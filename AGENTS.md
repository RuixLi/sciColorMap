# AGENTS.md

You are reading `AGENTS.md`, the entry point for agents working on this project.
Read it fully at the start of each session. It orients you; the detail lives in
the files it points to.

## Project

- **What:** sciColorMap — a catalog of 67 perceptually-uniform scientific
  colormaps, usable as drop-in MATLAB colormaps (`colormap(viridis)`) and from
  Python (`scm.cmap("viridis")`).
- **Goal:** a maintained colormap package: the catalog + MATLAB tools (preview,
  interactive trim/warp editor) + read-only Python access.
- **Outputs:** the catalog (`colormaps/*.m`, with exported `*.csv`), MATLAB tools
  (`src/+scm/`), and the Python loader (`src/scm.py`).
- **Primary language:** MATLAB (R2016b+; the `scm.cm_editor` GUI needs R2020a+).
  Python 3.11+ (numpy / matplotlib) for the loader.
- **Archetype:** `package`. Status: `dev`.

## How to work here

- **Conventions:** vendored at [context/conventions.md](context/conventions.md),
  framework **all-you-need-is-trust v0.1.0** (hashes in
  [context/conventions-bundle.json](context/conventions-bundle.json)). Follow
  them; deviations are declared below.
- **The catalog is on the path, not namespaced** — `colormaps/*.m` must stay
  directly on the MATLAB path so `colormap(viridis)` works. Don't move them
  under `src/` or into a namespace.
- **Tools go in `src/+scm/`** (namespace `scm`), tests in `tests/`.
- **New features are creative work:** design them first (converge an effort +
  its oracle before a plan; `how-to-work-here`), don't jump to code.

### Deviations from the conventions

- **A — colormap catalog at the repo root, not `src/`** (from `where-files-live`
  v0.1.0). The catalog is the package's data/asset layer, kept on the MATLAB
  path for drop-in use; namespacing would break every caller.
  [ADR 0001](context/decisions/0001-catalog-at-root-and-cross-language-layout.md)
- **B — no `pyproject.toml`** (from `project-layout` v0.1.0). Python access is a
  data catalog (`colormaps/*.csv`) plus a single loader module (`src/scm.py`),
  not a pip package — so there is no build manifest; [ENVIRONMENT.md](ENVIRONMENT.md)
  lists the deps. See the [python-access effort](context/efforts/python-access.md).

## Current work

- Where things stand: **[context/jobs.md](context/jobs.md)** — the worklist. No active effort; Goals 1 (framework adoption) and 2 (colormap editor + Python access) are shipped.

> The [jobs board](context/jobs.md) is the current-work surface; this section only points to it (`tracking-progress`).

## Where to look

| need | file |
| --- | --- |
| conceptual overview / usage | `README.md` |
| the colormap catalog | `colormaps/` |
| MATLAB tools (`scm`) | `src/+scm/` — `help scm` (`Contents.m`): show_cm, show_gallery, cm_editor, trim, warp, export_cm |
| Python loader | `src/scm.py` — `import scm` → `load` / `cmap` / `list_cm` |
| runnable usage demos | `examples/basic_usage.m` (MATLAB), `examples/basic_usage.py` (Python) |
| tests | `tests/` |
| conventions (the guidance) | `context/conventions.md` |
| glossary | `context/glossary.md` |
| decisions / ADRs | `context/decisions/` |
| where things stand | `context/jobs.md` |
| efforts / plans / logs / reports | `context/efforts/`, `context/plans/`, `context/logs/`, `context/reports/` |
| environment | `ENVIRONMENT.md` |
| release history | `CHANGELOG.md` |
