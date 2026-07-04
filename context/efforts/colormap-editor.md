---
kind: effort
name: colormap editor
status: done
description: "Interactive MATLAB tool to trim and warp a colormap's gradient, plus the pure, testable transforms behind it."
created: "2026-07-04T12:00"
updated: "2026-07-04T13:00"
---
# colormap editor - effort

> The contract for this effort: the oracle is declared up front (the transform tests); the internal file/task route lives in its `plan`. Design converged via brainstorming on 2026-07-04.

An interactive MATLAB tool that lets a user **trim** a colormap to a sub-range and **warp** its transition (make the color change sharper or softer around a chosen range), with live preview — plus the pure, graphics-free transforms it is built on.

## Outcome

- `scm.trim`, `scm.warp`, and `scm.cm_editor` exist. `newmap = scm.cm_editor(cmap)` opens a `uifigure`, lets the user trim to `[lo,hi]` and reshape the transition with a draggable monotone curve while a preview updates live, and returns the edited N×3 on **Done**.
- The pure transforms pass their known-answer tests (`tests/test_trim.m`, `tests/test_warp.m`).

## Assumptions

- **Input is an N×3 RGB matrix in [0,1]** (e.g. `viridis(256)`) - if wrong: input validation errors; this tool is not for arbitrary data arrays.
- **A graphical display is available** for `cm_editor` - if wrong: the GUI cannot run, but `scm.trim` / `scm.warp` still work headless.
- **Base MATLAB only, no toolboxes** - if wrong (e.g. we reach for IPT `drawpoint`): it breaks the `ENVIRONMENT.md` "base only" guarantee.

## Decisions

### Needs your response

- None - converged during the design session.

### Already made

- **Architecture: pure transforms + thin GUI** (approach A) - testable core, reusable for a later Python port.
- **Input: an arbitrary N×3 matrix passed as an argument**, no catalog dropdown - keeps the editor decoupled from `colormaps/`.
- **Operations: trim + warp only** - reverse and resample are out of v1.
- **Rescale = a draggable monotone warp curve, not a global gamma** - gamma can only trade detail between the two ends; local transition tuning needs a curve. Curve slope = transition sharpness (steep = sharp, flat = smooth).
- **Output: modal** - **Done** returns the edited N×3; **Cancel / close returns the original unchanged**; output size = input size.
- **Curve mechanics:** PCHIP through control points; endpoints fixed at (0,0)/(1,1); interior points clamped monotone; click the curve to add a point, right-click to remove; default = identity (no change).
- **Dragging via base graphics callbacks** (`WindowButtonMotionFcn`), not IPT `drawpoint` - preserves base-MATLAB-only.
- **Layout A (single column):** original/result preview strips, Low/High sliders, curve plot, Reset / Cancel / Done.
- **Names:** `scm.trim`, `scm.warp` (renamed from `rescale` to avoid the base `rescale` overlap), `scm.cm_editor`. (Flip any you dislike.)

## Oracle(s)

| capability / claim | oracle (independent, up-front) | check |
| --- | --- | --- |
| `trim` restricts to `[lo,hi]` and re-stretches to N rows | known-answer test | `tests/test_trim.m` |
| `warp` reparametrizes by a monotone curve; identity curve is a no-op | known-answer test | `tests/test_warp.m` |
| transforms preserve N×3 shape and keep RGB in `[0,1]` | known-answer test | both |
| invalid input errors (bad shape/range, `lo≥hi`, non-monotone curve) | negative test | both |

The GUI itself is checked by **manual smoke** only (interactive graphics cannot be unit-tested) - which is precisely why the logic lives in the pure transforms, where the oracle bites.

## Scope

- **In:** the `trim` + `warp` pure functions; the `cm_editor` uifigure; their tests; `Contents.m`, README, and CHANGELOG updates.
- **Out:** reverse, resample, catalog dropdown, live-figure apply, clipboard/`.m` export, the Python port. **Untouchable:** the 67 `colormaps/*.m` files (read-only) and the existing `show_*` tools.

## Design

With `p = linspace(0,1,N)` the positions of the input's N rows:

- **Trim** - `scm.trim(cmap,lo,hi) = interp1(p, cmap, linspace(lo,hi,N))`: the `[lo,hi]` slice, re-stretched to N rows.
- **Warp** - the curve is control points `xy` (K×2, monotone, endpoints at (0,0)/(1,1)). Build `g = pchip(xy(:,1), xy(:,2), p)` (smooth *and* monotone), then `scm.warp(cmap,xy) = interp1(p, cmap, g)`. The curve's slope is the local transition sharpness.
- **Editor result** - `scm.warp(scm.trim(cmap,lo,hi), xy)`: the two compose, and each is independently testable.

The internal file layout and the ordered, tests-first task route live in the plan, not here.

## Public interface

- **`scm.trim(cmap, lo, hi)`** - return the `[lo,hi]` sub-range re-stretched to N rows.
- **`scm.warp(cmap, xy)`** - return `cmap` reparametrized by the monotone curve through control points `xy` (K×2 in `[0,1]`).
- **`scm.cm_editor(cmap)`** - open the interactive editor; return the edited N×3 (or the original on cancel).

## Seal

- **Sealed 2026-07-04** on branch `colormap-editor`. Ground: `tests/test_trim` + `tests/test_warp` pass **10/10** (MATLAB R2025a), catalog `test_colormaps` 67/67, `cm_editor.m` lint-clean; interactive GUI smoke confirmed by ruixli (after a preview-strip height fix). Realized by [plan](../plans/20260704-colormap-editor.md); outcome in [report](../reports/20260704-colormap-editor.md).
