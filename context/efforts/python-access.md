---
kind: effort
name: python access
status: done
description: "Export the colormap catalog to neutral per-map CSVs and provide a small Python loader so the maps work in matplotlib/seaborn."
created: "2026-07-04T13:30"
updated: "2026-07-04T14:15"
---
# python access - effort

> The contract for this effort: the oracle (a MATLAB drift test + a Python loader test) is declared up front; the internal file/task route lives in its `plan`. Design converged via brainstorming on 2026-07-04. Realizes Goal 2's cross-language question from [ADR 0001](decisions/0001-catalog-at-root-and-cross-language-layout.md).

Make the colormap catalog usable from Python (matplotlib / seaborn) by exporting each map to a language-neutral CSV and shipping a small Python loader module — **data + snippet, not a pip package**.

## Outcome

- Every catalog map has a committed `colormaps/<name>.csv` (256×3 RGB) produced from its `.m` by `scm.export_cm`.
- `src/scm.py` provides `load`, `cmap`, and `list_cm`; a user can do `import scm; sns.heatmap(d, cmap=scm.cmap('vik'))` with no registration.
- The oracle passes: the CSVs match the MATLAB functions (drift test) and the Python loader behaves (loader test).

## Assumptions

- **The `.m` colormap functions accept an optional N and return N×3 in [0,1]** (e.g. `viridis(256)`) - if wrong: `export_cm` must special-case that map.
- **Python 3 with numpy + matplotlib** is available to run/use the snippet - if wrong: the snippet can't run; the CSV data is still usable by any tool.
- **256 rows is a faithful canonical resolution** for these maps - if wrong (a map with a much larger native table): `load(name, n≠256)` differs sub-perceptually from MATLAB `feval(name, n)`.

## Decisions

### Needs your response

- None - converged during the design session.

### Already made

- **Data + snippet, no pip package, no auto-registration** - lowest-maintenance; sidesteps PyPI and name-collisions with matplotlib/`cmcrameri`/`cmocean`.
- **Export all 67 maps** - uniform; nothing is registered, so there is no collision reason to subset.
- **Per-map CSV, 256×3, stored in `colormaps/`** next to the `.m` files - `colormaps/` becomes the shared catalog/asset layer ([ADR 0001](decisions/0001-catalog-at-root-and-cross-language-layout.md)). Tracked as text.
- **Python code is a single module `src/scm.py`** imported as `import scm` → `scm.load` / `scm.cmap` / `scm.list_cm` (parallels the MATLAB `scm.*` namespace). Not a package.
- **The names function is `list_cm()`, not `list`** - avoids shadowing the Python builtin `list`.
- **Extraction via MATLAB** `scm.export_cm` (`feval(name,256)` → `writematrix`), not by parsing `.m` source - robust, uses each map's own logic.
- **MATLAB `.m` files are read-only** here; MATLAB tools glob `*.m`, so the new `.csv` do not affect them.

## Oracle(s)

| capability / claim | oracle (independent, up-front) | check |
| --- | --- | --- |
| exported CSVs faithfully match the MATLAB colormaps (no `.m`/`.csv` drift) | known-answer test (tolerance) | `tests/test_export_data.m` |
| `load(name, n)` returns valid n×3 RGB in `[0,1]`, endpoints preserved, resamples | known-answer test | `tests/test_scicolormap.py` |
| `cmap(name)` is a usable matplotlib `ListedColormap`; `list_cm()` returns all names | known-answer test | `tests/test_scicolormap.py` |

## Scope

- **In:** `scm.export_cm` (MATLAB exporter); the 67 `colormaps/*.csv`; `src/scm.py` loader; the two tests; README "Use in Python" section; `ENVIRONMENT.md` + `CHANGELOG.md` updates.
- **Out:** a pip/PyPI package, conda, auto-registration on import, a gap analysis against existing Python packages, native-resolution (non-256) storage. **Untouchable:** the 67 `colormaps/*.m` (read-only) and the existing `+scm` MATLAB tools.

## Design

- **Export** - `scm.export_cm` loops `colormaps/*.m`; for each, `M = feval(name, 256)`; `writematrix(M, colormaps/<name>.csv)`. Re-run whenever a `.m` changes.
- **Storage** - one `colormaps/<name>.csv` per map, a 256×3 table of floats in `[0,1]`; the shared, language-neutral source of truth.
- **Load (Python)** - `src/scm.py` locates `../colormaps` relative to itself, reads `<name>.csv`, and linearly interpolates the 256-row base to the requested `n` (mirroring the `.m`). `cmap` wraps the array in `matplotlib.colors.ListedColormap`. No import side effects.

The internal file layout and the ordered, tests-first task route live in the plan, not here.

## Public interface

- **`scm.export_cm()`** (MATLAB) - regenerate `colormaps/*.csv` from `colormaps/*.m`.
- **`scm.load(name, n=256)`** (Python) - return an `n×3` numpy array of RGB in `[0,1]`.
- **`scm.cmap(name, n=256)`** (Python) - return a `matplotlib.colors.ListedColormap` for `cmap=`.
- **`scm.list_cm()`** (Python) - return the sorted list of available colormap names.

## Seal

- **Sealed 2026-07-04** on branch `python-access`. Ground: `tests/test_export_data.m` (all 67 CSVs match `feval(name,256)`, AbsTol 1e-6) and `tests/test_scicolormap.py` (7/7) both pass — MATLAB R2025a, Python 3.11.7 / numpy 1.26.4 / matplotlib 3.8.0. Realized by [plan](../plans/20260704-python-access.md); outcome in [report](../reports/20260704-python-access.md).
