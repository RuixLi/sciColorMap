# Environment

The pinned environment to run this repo. Language-agnostic (MATLAB today; Python
planned for Goal 2 — when it lands, its dependencies move to `pyproject.toml`).

## Toolchain

- **MATLAB R2016b or newer** — runs the colormaps and the pure `scm` functions.
  No additional toolboxes are required (base MATLAB only). The interactive
  `scm.cm_editor` GUI needs **R2020a+** (uifigure mouse callbacks).
- **Python 3.11+** with `numpy` + `matplotlib` — for the `src/scm.py` colormap loader.

## Dependencies

- **MATLAB:** base only. The colormap functions and `src/+scm/` use core
  plotting (`colormap`, `imagesc`, `interp1`, `subplot`).
- **Python:** `numpy` (loader), `matplotlib` (`scm.cmap`), `pytest` (tests). Not yet pinned in a lockfile.

## Setup

1. Clone the repository to **local disk** (not an actively-synced folder such as
   OneDrive — a synced `.git` corrupts; see `where-files-live`).
2. In MATLAB, from the repo root:
   ```matlab
   addpath(genpath(pwd))   % puts colormaps/ and src/+scm on the path
   ```
   Add that line to your `startup.m` for automatic loading.
3. Verify:
   ```matlab
   colormap(viridis)       % drop-in colormap
   scm.show_gallery        % preview the whole catalog
   runtests('tests')       % run the smoke test
   ```

## Notes

- The `colormaps/` catalog must be on the path for `colormap(<name>)` and for
  `scm.show_gallery` / `tests/test_colormaps.m` (they load colormaps by name).
- `scm` tools are called through the namespace: `scm.show_cm`, `scm.show_gallery`.
