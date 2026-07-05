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
  [context/conventions-bundle.json](context/conventions-bundle.json)). Follow them; deviations are declared below.

### Deviations from the conventions

- **A — colormap catalog at the repo root, not `src/`** (from `where-files-live` v0.1.0). The catalog is the package's data/asset layer, kept on the MATLAB path for drop-in use; namespacing would break every caller. [ADR 0001](context/decisions/0001-catalog-at-root-and-cross-language-layout.md)
- **Tools go in `src/+scm/`** (namespace `scm`), tests in `tests/`.
- **B — no `pyproject.toml`** (from `project-layout` v0.1.0). Python access is a data catalog (`colormaps/*.csv`) plus a single loader module (`src/scm.py`), not a pip package — so there is no build manifest; [ENVIRONMENT.md](ENVIRONMENT.md) lists the deps.

## Current work

- No active efforts. See **[context/jobs.md](context/jobs.md)** for finished works.

## Where to look

| need | file |
| --- | --- |
| conceptual overview / usage | `README.md` |
| the colormap catalog | `colormaps/` |
| MATLAB tools (`scm`) | `src/+scm/` — `help scm` (`Contents.m`): list_cm, show_cm, show_gallery, cm_editor, trim, warp, export_cm |
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
