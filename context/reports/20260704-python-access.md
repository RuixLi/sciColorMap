---
kind: report
name: python access
status: passed
description: "Oracle passed: 67 CSVs match the MATLAB catalog and the Python loader works; the catalog is now usable in matplotlib/seaborn."
created: "2026-07-04T14:15"
updated: "2026-07-04T14:15"
---
# python access - report

## Status

- **passed** — both oracles pass. `tests/test_export_data.m`: all 67 `colormaps/<name>.csv` match `feval(name,256)` within 1e-6 (MATLAB R2025a). `tests/test_scicolormap.py`: 7/7 (Python 3.11.7, numpy 1.26.4, matplotlib 3.8.0) — `load` shape/range/resample/endpoints, `cmap` returns a `ListedColormap`, `list_cm` lists all names, unknown name raises.

## Related files

- [effort](../efforts/python-access.md) · [plan](../plans/20260704-python-access.md)
- Code: `src/+scm/export_data.m` (exporter), `src/scm.py` (loader), `colormaps/*.csv` (67 exported tables).
- Tests (oracle): `tests/test_export_data.m`, `tests/test_scicolormap.py`.

## Next action(s)

- If wider distribution is wanted, package `src/scm.py` + the CSVs as a pip/PyPI module (out of scope now) -> [effort](../efforts/python-access.md)
- Make `runtests('tests')` discover the older `test_colormaps.m` (function-based) so all MATLAB suites run together -> `tests/test_colormaps.m`
