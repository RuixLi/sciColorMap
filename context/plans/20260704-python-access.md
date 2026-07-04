---
kind: plan
name: python access
status: proposed
description: "Tests-first route to export the catalog to per-map CSVs and build the src/scm.py loader, realizing the python-access effort's oracle."
created: "2026-07-04T14:00"
updated: "2026-07-04T14:00"
---
# python access — implementation plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax.
> Realizes [effort](../efforts/python-access.md).

**Goal:** Make the colormap catalog usable from Python (matplotlib/seaborn) via neutral per-map CSVs + a small loader — data + snippet, no package.

**Architecture:** A MATLAB exporter `scm.export_data` evaluates each `colormaps/<name>.m` at 256 rows and writes `colormaps/<name>.csv`. A Python module `src/scm.py` reads those CSVs and exposes `load` / `cmap` / `list_cm`. Two oracles: a MATLAB drift test (CSV ≈ `feval(name,256)`) and a Python loader test.

**Tech Stack:** MATLAB (`feval`, `writematrix`/`readmatrix`); Python 3 with `numpy` (loader) and `matplotlib` (only for `cmap`). Python tests use `pytest`.

---

## Work documents

- Effort: [python access](../efforts/python-access.md)
- Log: create `context/logs/20260704-python-access.md` at execution start if a running trail is wanted.

## Decisions

### Needs your response

- None — converged during design.

### Already made

- **`writematrix`/`readmatrix` round-trip with `AbsTol 1e-6`** in the drift test — well inside double-precision CSV fidelity.
- **Resampling is per-channel `np.interp`** from the 256-row base to `n` rows (mirrors the `.m`'s `interp1 'linear'`).
- **`matplotlib` is imported lazily inside `cmap()`** so `load`/`list_cm` work with only `numpy` installed.
- **`list_cm()` uses `sorted(...)`** (never bare `list(...)`) — no builtin shadowing.
- **Tests:** MATLAB function-based (`test_export_data.m`), Python `pytest` (`test_scicolormap.py`).

## Architecture (files)

- Create `src/+scm/export_data.m` — MATLAB exporter (`scm.export_data`).
- Generate `colormaps/<name>.csv` × 67 — by running `scm.export_data` (committed as data).
- Create `src/scm.py` — Python loader (`load`, `cmap`, `list_cm`).
- Create `tests/test_export_data.m` — MATLAB drift oracle.
- Create `tests/test_scicolormap.py` — Python loader oracle.
- Modify `README.md`, `ENVIRONMENT.md`, `CHANGELOG.md`; seal `context/efforts/python-access.md`.

## Untouchables

- `colormaps/*.m` (the 67 catalog functions) — **read-only** (exporter only *reads* them via `feval` and *writes new* `.csv`; never edits a `.m`).
- The `+scm` MATLAB tools (`trim`, `warp`, `cm_editor`, `show_*`) and existing tests.

---

## Task 1: MATLAB exporter `scm.export_data` + generate the CSVs

**Files:**
- Create: `tests/test_export_data.m`
- Create: `src/+scm/export_data.m`
- Generate: `colormaps/*.csv`

- [ ] **Step 1: Write the failing drift test**

`tests/test_export_data.m`:
```matlab
function tests = test_export_data
%TEST_EXPORT_DATA  Each committed colormaps/<name>.csv matches feval(name,256).
tests = functiontests(localfunctions);
end

function setupOnce(tc) %#ok<INUSD>
here = fileparts(mfilename('fullpath'));               % tests/
addpath(fullfile(fileparts(here), 'colormaps'));       % catalog on path for feval
end

function test_every_csv_matches_matlab(tc)
here  = fileparts(mfilename('fullpath'));
cmdir = fullfile(fileparts(here), 'colormaps');
files = dir(fullfile(cmdir, '*.m'));
names = erase({files.name}, '.m');
verifyNotEmpty(tc, names);
for i = 1:numel(names)
    csv = fullfile(cmdir, [names{i} '.csv']);
    verifyTrue(tc, isfile(csv), ...
        sprintf('missing %s.csv — run scm.export_data', names{i}));
    M = feval(names{i}, 256);
    C = readmatrix(csv);
    verifyEqual(tc, C, M, 'AbsTol', 1e-6, ...
        sprintf('%s.csv does not match feval(%s,256)', names{i}, names{i}));
end
end
```

- [ ] **Step 2: Run it — verify it fails**

Run: `matlab -batch "cd('d:/code/sciColorMap'); runtests('tests/test_export_data.m')"`
Expected: FAIL — `scm.export_data` doesn't exist yet and no `.csv` files, so `isfile` assertions fail.

- [ ] **Step 3: Write the exporter**

`src/+scm/export_data.m`:
```matlab
function export_data(outdir)
%EXPORT_DATA  Write each catalog colormap to a 256x3 CSV.
%   scm.export_data() writes colormaps/<name>.csv for every colormaps/<name>.m
%   using feval(name, 256). Re-run whenever a colormap .m changes.
%   scm.export_data(OUTDIR) writes to OUTDIR instead of colormaps/.
    here  = fileparts(mfilename('fullpath'));   % <root>/src/+scm
    root  = fileparts(fileparts(here));         % <root>
    cmdir = fullfile(root, 'colormaps');
    if nargin < 1 || isempty(outdir)
        outdir = cmdir;
    end
    files = dir(fullfile(cmdir, '*.m'));
    names = erase({files.name}, '.m');
    for i = 1:numel(names)
        M = feval(names{i}, 256);
        writematrix(M, fullfile(outdir, [names{i} '.csv']));
    end
    fprintf('exported %d colormaps to %s\n', numel(names), outdir);
end
```

- [ ] **Step 4: Generate the CSVs**

Run: `matlab -batch "cd('d:/code/sciColorMap'); addpath(genpath(pwd)); scm.export_data"`
Expected: `exported 67 colormaps to ...colormaps` and 67 new `colormaps/*.csv`.

- [ ] **Step 5: Run the drift test — verify it passes**

Run: `matlab -batch "cd('d:/code/sciColorMap'); runtests('tests/test_export_data.m')"`
Expected: PASS (1 test, iterating all 67 maps).

- [ ] **Step 6: Commit**

```bash
git add "src/+scm/export_data.m" tests/test_export_data.m "colormaps/*.csv"
git commit -m "feat(scm): export catalog to per-map CSVs + drift test"
```

---

## Task 2: Python loader `src/scm.py` + test

**Files:**
- Create: `tests/test_scicolormap.py`
- Create: `src/scm.py`

- [ ] **Step 1: Write the failing loader test**

`tests/test_scicolormap.py`:
```python
import sys
from pathlib import Path

import numpy as np
import pytest

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "src"))
import scm  # noqa: E402


def test_list_cm_nonempty_and_sorted():
    names = scm.list_cm()
    assert len(names) >= 1
    assert names == sorted(names)
    assert "viridis" in names


def test_load_default_shape_and_range():
    m = scm.load("viridis")
    assert m.shape == (256, 3)
    assert m.min() >= 0.0 and m.max() <= 1.0


def test_load_resamples_to_n():
    assert scm.load("viridis", n=64).shape == (64, 3)


def test_load_n256_is_identity():
    base = np.loadtxt(ROOT / "colormaps" / "viridis.csv", delimiter=",")
    np.testing.assert_allclose(scm.load("viridis", 256), base, atol=1e-12)


def test_load_endpoints_preserved_when_resampling():
    base = np.loadtxt(ROOT / "colormaps" / "viridis.csv", delimiter=",")
    m = scm.load("viridis", n=64)
    np.testing.assert_allclose(m[0], base[0], atol=1e-12)
    np.testing.assert_allclose(m[-1], base[-1], atol=1e-12)


def test_unknown_name_raises():
    with pytest.raises(ValueError):
        scm.load("not_a_colormap")


def test_cmap_returns_listedcolormap():
    from matplotlib.colors import ListedColormap
    c = scm.cmap("vik")
    assert isinstance(c, ListedColormap)
    assert c.N == 256
```

- [ ] **Step 2: Run it — verify it fails**

Run: `python -m pytest tests/test_scicolormap.py -v`
Expected: collection/import error — `No module named 'scm'`.

- [ ] **Step 3: Write the loader**

`src/scm.py`:
```python
"""sciColorMap — load the colormap catalog in Python.

RGB tables live as colormaps/<name>.csv (256x3, values in [0,1]), exported from
the MATLAB catalog. This module reads them; it has no import side effects.

    import scm, seaborn as sns
    sns.heatmap(data, cmap=scm.cmap("vik"))
"""
from pathlib import Path

import numpy as np

# <root>/src/scm.py -> <root>/colormaps
_DATA_DIR = Path(__file__).resolve().parent.parent / "colormaps"


def list_cm():
    """Return the sorted list of available colormap names."""
    return sorted(p.stem for p in _DATA_DIR.glob("*.csv"))


def load(name, n=256):
    """Return an n-by-3 numpy array of RGB in [0,1] for the named colormap.

    The 256-row base table is linearly interpolated to n rows.
    """
    path = _DATA_DIR / f"{name}.csv"
    if not path.exists():
        raise ValueError(f"unknown colormap {name!r}; try scm.list_cm()")
    base = np.loadtxt(path, delimiter=",")
    if base.ndim != 2 or base.shape[1] != 3:
        raise ValueError(f"{name}: expected N-by-3 data, got {base.shape}")
    if n == base.shape[0]:
        return base.copy()
    src = np.linspace(0.0, 1.0, base.shape[0])
    dst = np.linspace(0.0, 1.0, n)
    return np.column_stack([np.interp(dst, src, base[:, c]) for c in range(3)])


def cmap(name, n=256):
    """Return a matplotlib ListedColormap for the named colormap."""
    from matplotlib.colors import ListedColormap
    return ListedColormap(load(name, n), name=name)
```

- [ ] **Step 4: Run it — verify it passes**

Run: `python -m pytest tests/test_scicolormap.py -v`
Expected: PASS (7 tests). Requires `numpy`, `matplotlib`, `pytest` installed.

- [ ] **Step 5: Commit**

```bash
git add src/scm.py tests/test_scicolormap.py
git commit -m "feat(scm): add Python loader (load/cmap/list_cm) + test"
```

---

## Task 3: Docs + seal

**Files:**
- Modify: `README.md`, `ENVIRONMENT.md`, `CHANGELOG.md`, `context/efforts/python-access.md`

- [ ] **Step 1: README — add a "Use in Python" section**

After the Documentation section in `README.md`, add:
````markdown
## 🐍 Use in Python

The catalog is exported to `colormaps/*.csv` and loaded by `src/scm.py` (no pip
package, no registration):

```python
import sys; sys.path.append("path/to/sciColorMap/src")
import scm
import seaborn as sns

sns.heatmap(data, cmap=scm.cmap("vik"))   # matplotlib ListedColormap
rgb = scm.load("batlow", 64)              # 64x3 numpy array
scm.list_cm()                             # available names
```
Requires `numpy` (and `matplotlib` for `scm.cmap`). Regenerate the CSVs after
editing a colormap with `scm.export_data` in MATLAB.
````

- [ ] **Step 2: ENVIRONMENT — add Python deps**

In `ENVIRONMENT.md`, under Dependencies replace the Python line:
```markdown
- **Python:** `numpy` (loader), `matplotlib` (for `scm.cmap`), `pytest` (tests). No pinned lockfile yet.
```

- [ ] **Step 3: CHANGELOG — note it under `## [Unreleased]` → `### Added`**

```markdown
- Python access: `colormaps/*.csv` exported via `scm.export_data`, loaded by `src/scm.py` (`scm.load` / `scm.cmap` / `scm.list_cm`) for matplotlib/seaborn.
```

- [ ] **Step 4: Run the whole suite (both languages)**

Run: `matlab -batch "cd('d:/code/sciColorMap'); runtests({'tests/test_trim.m','tests/test_warp.m','tests/test_export_data.m'})"`
Then: `python -m pytest tests/test_scicolormap.py -v`
Expected: all green.

- [ ] **Step 5: Seal the effort and commit**

In `context/efforts/python-access.md`: set `status: done` and fill the **Seal** line (`Sealed 2026-07-04; ground: test_export_data + test_scicolormap pass; by: ruixli`). Update `context/jobs.md` (move python access to Done).
```bash
git add README.md ENVIRONMENT.md CHANGELOG.md context/efforts/python-access.md context/jobs.md
git commit -m "docs(scm): document Python access; seal python-access effort"
```

---

## Done when

- Both oracles pass: `tests/test_export_data.m` (CSVs match MATLAB) and `tests/test_scicolormap.py` (loader behaves).
- `import scm; scm.cmap('vik')` yields a usable matplotlib colormap.
- Docs updated; effort sealed; jobs board updated.
