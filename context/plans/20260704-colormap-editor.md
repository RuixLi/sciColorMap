---
kind: plan
name: colormap editor
status: proposed
description: "Tests-first route to build scm.trim, scm.warp, and the scm.cm_editor uifigure, realizing the colormap-editor effort's oracle."
created: "2026-07-04T12:30"
updated: "2026-07-04T12:30"
---
# colormap editor — implementation plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax.
> Realizes [effort](../efforts/colormap-editor.md).

**Goal:** Ship an interactive MATLAB tool to trim and warp a colormap, built on two pure, tested transforms.

**Architecture:** Two graphics-free functions `scm.trim(cmap,lo,hi)` and `scm.warp(cmap,xy)` (each N×3 → N×3), plus a thin `scm.cm_editor(cmap)` `uifigure` that composes them behind sliders and a draggable warp curve, returning the edited N×3 on Done. The transforms carry the oracle (known-answer tests); the GUI is verified by manual smoke.

**Tech stack:** MATLAB. Pure functions target R2016b+ (`validateattributes`, `interp1`, `pchip`). The editor uses `uifigure` window mouse callbacks — R2020a+ (R2022a+ recommended).

---

## Work documents

- Effort: [colormap editor](../efforts/colormap-editor.md)
- Log: create `context/logs/20260704-colormap-editor.md` at execution start (`kind: log`, `status: in-execution`).

## Decisions

### Needs your response

- **Editor MATLAB version [Task 3–4]** — the `uifigure` drag uses `WindowButtonMotionFcn` + `uiaxes.CurrentPoint`.
  - options: **(A)** `uifigure` + window callbacks — matches "use uifigure"; sets the *editor's* minimum to ~R2020a. **(B)** classic `figure()` — full drag support on R2016b+, still a programmatic `.m`, but not `uifigure`.
  - recommendation: **A** — you asked for `uifigure`, and only the editor (not the transforms) needs the newer version. If your MATLAB is older, we fall back to B with the same structure.

### Already made

- **`validateattributes`, not `arguments` blocks** — keeps `scm.trim`/`scm.warp` on R2016b+ (`arguments` is R2019b+). 
- **Function-based tests** (`functiontests`) so `runtests('tests')` discovers them; each adds `../src` to the path in `setupOnce`.
- **PCHIP for the warp** — monotone-preserving; result clamped to `[0,1]` against float overshoot.
- **Control points `xy` are K×2 including fixed endpoints `[0 0]`/`[1 1]`**; interior points clamped non-decreasing.
- **Preview strips via `image(ax, reshape(map,[1 n 3]))`**; result = `warp(trim(orig,lo,hi), xy)`, recomputed on every change.
- **Output size = input size; Cancel/close returns the original unchanged.**

## Architecture (files)

- Create `src/+scm/trim.m` — pure trim transform.
- Create `src/+scm/warp.m` — pure monotone-curve warp transform.
- Create `src/+scm/cm_editor.m` — the `uifigure` editor composing the two.
- Create `tests/test_trim.m`, `tests/test_warp.m` — known-answer oracles.
- Modify `src/+scm/Contents.m` — list the three new functions.
- Modify `README.md`, `CHANGELOG.md`, `ENVIRONMENT.md` — usage, changelog, editor version note.
- Modify `context/efforts/colormap-editor.md` — seal on oracle pass.

## Untouchables

- `colormaps/*.m` (the 67 catalog files) — read-only.
- `src/+scm/show_cm.m`, `src/+scm/show_gallery.m`, `tests/test_colormaps.m` — do not alter.

---

## Task 1: `scm.trim` (pure transform)

**Files:**
- Create: `tests/test_trim.m`
- Create: `src/+scm/trim.m`

- [ ] **Step 1: Write the failing test**

`tests/test_trim.m`:
```matlab
function tests = test_trim
%TEST_TRIM  Known-answer tests for scm.trim.
tests = functiontests(localfunctions);
end

function setupOnce(tc) %#ok<INUSD>
here = fileparts(mfilename('fullpath'));         % tests/
addpath(fullfile(fileparts(here), 'src'));       % repo/src -> scm.* resolves
end

function ramp = grayRamp(n)
p = linspace(0,1,n)';
ramp = [p p p];                                  % color == position: exact answers
end

function test_full_range_is_identity(tc)
cmap = grayRamp(64);
verifyEqual(tc, scm.trim(cmap,0,1), cmap, 'AbsTol', 1e-12);
end

function test_subrange_restretches(tc)
n = 256; cmap = grayRamp(n);
M = scm.trim(cmap, 0.25, 0.75);
expected = linspace(0.25,0.75,n)';
verifyEqual(tc, M, [expected expected expected], 'AbsTol', 1e-12);
end

function test_shape_and_range_preserved(tc)
cmap = grayRamp(100);
M = scm.trim(cmap, 0.1, 0.9);
verifySize(tc, M, [100 3]);
verifyTrue(tc, all(M(:) >= 0 & M(:) <= 1));
end

function test_lo_ge_hi_errors(tc)
verifyError(tc, @() scm.trim(grayRamp(16), 0.6, 0.4), 'scm:trim:badRange');
end

function test_bad_shape_errors(tc)
verifyError(tc, @() scm.trim(ones(10,2), 0, 1), 'scm:trim:badShape');
end
```

- [ ] **Step 2: Run test to verify it fails**

Run (MATLAB, from repo root): `runtests('tests/test_trim.m')`
Expected: FAIL/ERROR — `Unrecognized function or variable 'scm.trim'` (or `scm` package not found).

- [ ] **Step 3: Write minimal implementation**

`src/+scm/trim.m`:
```matlab
function M = trim(cmap, lo, hi)
%TRIM  Restrict a colormap to a [lo,hi] sub-range, re-stretched to N rows.
%   M = scm.trim(CMAP, LO, HI) returns the slice of the N-by-3 colormap CMAP
%   between normalized positions LO and HI (0 <= LO < HI <= 1), re-sampled back
%   to N rows.
%
%   Example:
%     M = scm.trim(viridis(256), 0.1, 0.9);   % drop the darkest/lightest 10%
    validateattributes(cmap, {'double','single'}, ...
        {'2d','nonempty','>=',0,'<=',1}, mfilename, 'cmap', 1);
    if size(cmap,2) ~= 3
        error('scm:trim:badShape', 'cmap must be N-by-3, got N-by-%d.', size(cmap,2));
    end
    validateattributes(lo, {'double'}, {'scalar','>=',0,'<=',1}, mfilename, 'lo', 2);
    validateattributes(hi, {'double'}, {'scalar','>=',0,'<=',1}, mfilename, 'hi', 3);
    if lo >= hi
        error('scm:trim:badRange', 'lo (%g) must be < hi (%g).', lo, hi);
    end
    cmap = double(cmap);
    n = size(cmap, 1);
    p = linspace(0, 1, n);
    M = interp1(p, cmap, linspace(lo, hi, n), 'linear');
end
```

- [ ] **Step 4: Run test to verify it passes**

Run: `runtests('tests/test_trim.m')`
Expected: PASS (5/5). Note: `test_bad_shape_errors` expects the `validateattributes` identifier `MATLAB:trim:expectedNumeric` — if your MATLAB emits a different id, adjust the expected id to the one it throws (run the call once at the command line to see it).

- [ ] **Step 5: Commit**

```bash
git add tests/test_trim.m "src/+scm/trim.m"
git commit -m "feat(scm): add pure trim transform with known-answer tests"
```

---

## Task 2: `scm.warp` (pure transform)

**Files:**
- Create: `tests/test_warp.m`
- Create: `src/+scm/warp.m`

- [ ] **Step 1: Write the failing test**

`tests/test_warp.m`:
```matlab
function tests = test_warp
%TEST_WARP  Known-answer tests for scm.warp.
tests = functiontests(localfunctions);
end

function setupOnce(tc) %#ok<INUSD>
here = fileparts(mfilename('fullpath'));
addpath(fullfile(fileparts(here), 'src'));
end

function ramp = grayRamp(n)
p = linspace(0,1,n)';
ramp = [p p p];
end

function test_identity_curve_is_noop(tc)
cmap = grayRamp(64);
verifyEqual(tc, scm.warp(cmap, [0 0; 1 1]), cmap, 'AbsTol', 1e-12);
end

function test_curve_hits_control_point(tc)
% N=101 -> row 51 sits exactly at output position 0.5; the curve passes
% through (0.5, 0.25), so that row must draw the source color at 0.25.
n = 101; cmap = grayRamp(n);
M = scm.warp(cmap, [0 0; 0.5 0.25; 1 1]);
verifyEqual(tc, M(51,:), [0.25 0.25 0.25], 'AbsTol', 1e-12);
end

function test_result_is_monotone_and_in_range(tc)
cmap = grayRamp(128);
M = scm.warp(cmap, [0 0; 0.3 0.6; 1 1]);
verifySize(tc, M, [128 3]);
verifyTrue(tc, all(diff(M(:,1)) >= -1e-12));      % non-decreasing
verifyTrue(tc, all(M(:) >= 0 & M(:) <= 1));
end

function test_non_monotone_y_errors(tc)
verifyError(tc, @() scm.warp(grayRamp(16), [0 0; 0.3 0.6; 0.6 0.4; 1 1]), ...
    'scm:warp:nonMonotoneY');
end

function test_bad_endpoints_error(tc)
verifyError(tc, @() scm.warp(grayRamp(16), [0 0.1; 1 1]), 'scm:warp:badEndpoints');
end
```

- [ ] **Step 2: Run test to verify it fails**

Run: `runtests('tests/test_warp.m')`
Expected: FAIL/ERROR — `scm.warp` undefined.

- [ ] **Step 3: Write minimal implementation**

`src/+scm/warp.m`:
```matlab
function M = warp(cmap, xy)
%WARP  Reparametrize a colormap by a monotone curve through control points.
%   M = scm.warp(CMAP, XY) resamples the N-by-3 colormap CMAP so that output
%   position x draws the color at source position y, where x->y is the monotone
%   PCHIP curve through control points XY (K-by-2, columns [x y]) with
%   XY(1,:)=[0 0], XY(end,:)=[1 1], x strictly increasing and y non-decreasing,
%   all in [0,1]. The identity curve [0 0; 1 1] is a no-op. Curve slope is the
%   local transition sharpness (steep = sharp, flat = smooth).
    validateattributes(cmap, {'double','single'}, ...
        {'ncols',3,'>=',0,'<=',1,'nonempty'}, mfilename, 'cmap', 1);
    validateattributes(xy, {'double'}, {'2d','ncols',2,'>=',0,'<=',1}, mfilename, 'xy', 2);
    if size(xy,1) < 2
        error('scm:warp:badShape', 'xy must have at least 2 rows.');
    end
    x = xy(:,1); y = xy(:,2);
    if x(1) ~= 0 || x(end) ~= 1 || y(1) ~= 0 || y(end) ~= 1
        error('scm:warp:badEndpoints', 'xy must start at [0 0] and end at [1 1].');
    end
    if any(diff(x) <= 0)
        error('scm:warp:nonMonotoneX', 'xy(:,1) must be strictly increasing.');
    end
    if any(diff(y) < 0)
        error('scm:warp:nonMonotoneY', 'xy(:,2) must be non-decreasing.');
    end
    cmap = double(cmap);
    n = size(cmap, 1);
    p = linspace(0, 1, n);
    g = pchip(x, y, p);              % monotone-preserving through the points
    g = min(max(g, 0), 1);           % guard tiny float overshoot
    M = interp1(p, cmap, g, 'linear');
end
```

- [ ] **Step 4: Run test to verify it passes**

Run: `runtests('tests/test_warp.m')`
Expected: PASS (5/5).

- [ ] **Step 5: Commit**

```bash
git add tests/test_warp.m "src/+scm/warp.m"
git commit -m "feat(scm): add pure warp transform (monotone curve) with tests"
```

---

## Task 3: `scm.cm_editor` (uifigure editor)

GUIs are not unit-tested (the trust anchor is Tasks 1–2). This task writes the complete editor in one file; Task 4 is its manual smoke test.

**Files:**
- Create: `src/+scm/cm_editor.m`

- [ ] **Step 1: Write the editor**

`src/+scm/cm_editor.m`:
```matlab
function newmap = cm_editor(cmap)
%CMAPEDITOR  Interactively trim and warp a colormap.
%   NEWMAP = scm.cm_editor(CMAP) opens an editor on the N-by-3 colormap CMAP.
%   Trim to a sub-range with the Low/High sliders and reshape the transition by
%   dragging the warp curve (steep = sharp, flat = smooth). Click Done to return
%   the edited N-by-3 matrix; Cancel or closing the window returns CMAP.
%
%   Requires uifigure window mouse callbacks (MATLAB R2020a+; R2022a+ best).
%
%   Example:
%     newmap = scm.cm_editor(viridis(256));
    validateattributes(cmap, {'double','single'}, ...
        {'ncols',3,'>=',0,'<=',1,'nonempty'}, mfilename, 'cmap', 1);
    cmap = double(cmap);
    n = size(cmap, 1);

    st.orig = cmap; st.lo = 0; st.hi = 1;
    st.xy = [0 0; 1 1]; st.result = cmap; st.done = false; st.drag = 0;

    f = uifigure('Name', 'scm.cm_editor', 'Position', [100 100 480 620]);

    uilabel(f, 'Position', [20 588 200 18], 'Text', 'Original');
    axO = uiaxes(f, 'Position', [20 560 440 26]);
    uilabel(f, 'Position', [20 528 200 18], 'Text', 'Result');
    axR = uiaxes(f, 'Position', [20 500 440 26]);

    uilabel(f, 'Position', [20 468 440 18], ...
        'Text', 'Warp curve  —  drag a point; click curve to add; right-click a point to remove');
    axC = uiaxes(f, 'Position', [20 214 440 250]);

    uilabel(f, 'Position', [20 176 50 20], 'Text', 'Low');
    sLo = uislider(f, 'Position', [80 186 260 3], 'Limits', [0 1], 'Value', 0, ...
        'ValueChangingFcn', @(~,ev) onLo(ev.Value));
    uilabel(f, 'Position', [20 128 50 20], 'Text', 'High');
    sHi = uislider(f, 'Position', [80 138 260 3], 'Limits', [0 1], 'Value', 1, ...
        'ValueChangingFcn', @(~,ev) onHi(ev.Value));

    uibutton(f, 'Position', [20 20 90 30],  'Text', 'Reset',  'ButtonPushedFcn', @(~,~) onReset());
    uibutton(f, 'Position', [250 20 90 30], 'Text', 'Cancel', 'ButtonPushedFcn', @(~,~) onCancel());
    uibutton(f, 'Position', [360 20 100 30],'Text', 'Done',   'ButtonPushedFcn', @(~,~) onDone());

    hOrig = image(axO, reshape(st.orig, [1 n 3]));
    hRes  = image(axR, reshape(st.result, [1 n 3]));
    setStrip(axO, n); setStrip(axR, n);

    hold(axC, 'on'); box(axC, 'on');
    axC.XLim = [0 1]; axC.YLim = [0 1]; axC.XTick = []; axC.YTick = [];
    plot(axC, [0 1], [0 1], ':', 'Color', [.5 .5 .5]);
    hCurve = plot(axC, st.xy(:,1), st.xy(:,2), '-', 'Color', [.29 .56 .85], 'LineWidth', 2);
    hPts   = plot(axC, st.xy(:,1), st.xy(:,2), 'o', 'MarkerSize', 8, ...
                  'MarkerFaceColor', [.29 .56 .85], 'MarkerEdgeColor', 'w');
    try disableDefaultInteractivity(axC); axC.Toolbar.Visible = 'off'; catch; end

    f.WindowButtonMotionFcn = @(~,~) onMove();
    f.WindowButtonUpFcn     = @(~,~) onUp();
    hPts.ButtonDownFcn      = @(~,~) onPointDown();
    hCurve.ButtonDownFcn    = @(~,~) onCurveDown();
    f.CloseRequestFcn       = @(~,~) onCancel();

    refresh();
    uiwait(f);
    newmap = st.result;

    % ---------------- nested callbacks ----------------
    function setStrip(ax, m)
        ax.XLim = [0.5 m+0.5]; ax.YLim = [0.5 1.5]; axis(ax, 'off');
    end
    function onLo(v), st.lo = min(v, st.hi - 1e-3); refresh(); end
    function onHi(v), st.hi = max(v, st.lo + 1e-3); refresh(); end
    function onReset()
        st.lo = 0; st.hi = 1; st.xy = [0 0; 1 1];
        sLo.Value = 0; sHi.Value = 1; refresh();
    end
    function onCancel(), st.result = st.orig; st.done = false; uiresume(f); delete(f); end
    function onDone(),   st.done = true; uiresume(f); delete(f); end

    function onPointDown()
        cp = axC.CurrentPoint(1, 1:2);
        [~, i] = min(abs(st.xy(:,1) - cp(1)));
        if strcmp(f.SelectionType, 'alt')            % right-click removes interior point
            if i > 1 && i < size(st.xy, 1), st.xy(i,:) = []; refresh(); end
        else
            st.drag = i;                             % begin drag
        end
    end
    function onCurveDown()
        if ~strcmp(f.SelectionType, 'alt')
            cp = axC.CurrentPoint(1, 1:2);
            x = min(max(cp(1), 0), 1);
            st.xy = sortrows([st.xy; x cp(2)], 1);
            clampMonotone();
            [~, st.drag] = min(abs(st.xy(:,1) - x));
            refresh();
        end
    end
    function onMove()
        if st.drag == 0, return; end
        k = st.drag; last = size(st.xy, 1);
        if k == 1 || k == last, return; end          % endpoints locked
        cp = axC.CurrentPoint(1, 1:2);
        xlo = st.xy(k-1,1) + 1e-3; xhi = st.xy(k+1,1) - 1e-3;
        st.xy(k,1) = min(max(cp(1), xlo), xhi);
        st.xy(k,2) = min(max(cp(2), 0), 1);
        clampMonotone(); refresh();
    end
    function onUp(), st.drag = 0; end
    function clampMonotone()
        st.xy(1,:) = [0 0]; st.xy(end,:) = [1 1];
        for k = 2:size(st.xy,1)
            if st.xy(k,2) < st.xy(k-1,2), st.xy(k,2) = st.xy(k-1,2); end
        end
    end
    function refresh()
        st.result = scm.warp(scm.trim(st.orig, st.lo, st.hi), st.xy);
        hOrig.CData = reshape(st.orig,   [1 n 3]);
        hRes.CData  = reshape(st.result, [1 n 3]);
        set(hCurve, 'XData', st.xy(:,1), 'YData', st.xy(:,2));
        set(hPts,   'XData', st.xy(:,1), 'YData', st.xy(:,2));
    end
end
```

- [ ] **Step 2: Sanity-check it loads (headless)**

Run: `addpath(genpath(pwd)); which scm.cm_editor`
Expected: prints the path to `cm_editor.m` (no parse errors).

- [ ] **Step 3: Commit**

```bash
git add "src/+scm/cm_editor.m"
git commit -m "feat(scm): add interactive cm_editor uifigure (trim + warp)"
```

---

## Task 4: Manual smoke test of the editor

Interactive graphics cannot be unit-tested; verify by hand and fix issues found.

- [ ] **Step 1: Launch and drive it**

Run (MATLAB, repo root):
```matlab
addpath(genpath(pwd))
newmap = scm.cm_editor(viridis(256));
```
Verify each:
- Window opens; **Original** and **Result** strips show viridis.
- Dragging **Low**/**High** trims the Result strip live; Low can't cross High.
- Clicking the curve **adds** a point; dragging a point reshapes the Result (steep = sharp); the curve stays monotone; right-click **removes** an interior point; endpoints stay pinned at the corners.
- **Reset** restores full range + identity curve.
- **Done** closes and returns an `N×3` matrix; check `isequal(size(newmap),[256 3])` and `all(newmap(:)>=0 & newmap(:)<=1)`.
- Re-run and click **Cancel** (and separately close the window): `newmap` equals the input unchanged.

- [ ] **Step 2: Fix any issues, then commit**

If the drag/CurrentPoint behavior misbehaves on your MATLAB version, apply the decision-A/B fallback (classic `figure`) or minor callback fixes, then:
```bash
git add "src/+scm/cm_editor.m"
git commit -m "fix(scm): cm_editor interaction fixes from smoke test"
```
(Skip the commit if no changes were needed.)

---

## Task 5: Docs, full test run, and seal

**Files:**
- Modify: `src/+scm/Contents.m`, `README.md`, `CHANGELOG.md`, `ENVIRONMENT.md`, `context/efforts/colormap-editor.md`

- [ ] **Step 1: Update `Contents.m`**

Add under a new `Edit` block in `src/+scm/Contents.m`:
```matlab
% Edit
%   trim         - Restrict a colormap to a [lo,hi] sub-range (pure)
%   warp         - Reparametrize a colormap by a monotone curve (pure)
%   cm_editor   - Interactively trim + warp a colormap (returns the edited N-by-3)
```

- [ ] **Step 2: Update README, CHANGELOG, ENVIRONMENT**

- `README.md` Documentation/Tools list — add:
  `- \`scm.cm_editor(cmap)\` — interactively trim + warp a colormap; \`scm.trim\` / \`scm.warp\` are the pure transforms.`
- `CHANGELOG.md` under `## [Unreleased]` → `### Added`:
  `- \`scm.trim\`, \`scm.warp\`, and interactive \`scm.cm_editor\` — trim a colormap to a sub-range and reshape its transition.`
- `ENVIRONMENT.md` Toolchain — append to the MATLAB line:
  `(the \`scm.cm_editor\` GUI needs R2020a+; the colormaps and pure transforms run on R2016b+).`

- [ ] **Step 3: Run the whole suite**

Run: `addpath(genpath(pwd)); runtests('tests')`
Expected: all pass, including the existing `test_colormaps` and the new `test_trim`, `test_warp`.

- [ ] **Step 4: Seal the effort and commit**

In `context/efforts/colormap-editor.md`: set `status: done` in frontmatter and fill the **Seal** line (`Sealed at: <commit>; ground: tests/test_trim + tests/test_warp pass; by: ruixli, on 2026-07-04`).
```bash
git add "src/+scm/Contents.m" README.md CHANGELOG.md ENVIRONMENT.md context/efforts/colormap-editor.md
git commit -m "docs(scm): document colormap editor; seal effort"
```

---

## Done when

- `runtests('tests')` is green (the oracle passes).
- `scm.cm_editor(viridis(256))` runs, edits, and returns an N×3 (manual smoke).
- Docs updated; effort sealed.
