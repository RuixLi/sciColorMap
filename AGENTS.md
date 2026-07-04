# AGENTS.md

You are reading `AGENTS.md`, the entry point for agents working on this project.
Read it fully at the start of each session. It orients you; the detail lives in
the files it points to.

## Project

- **What:** sciColorMap — a catalog of ~67 perceptually-uniform scientific
  colormaps for MATLAB, usable as drop-in replacements (`colormap(viridis)`).
- **Goal:** a maintained colormap package; currently expanding to Python access
  and an interactive colormap customizer (trim, tune the gradient).
- **Outputs:** the colormap catalog (`colormaps/`) + MATLAB tools (`src/+scm/`);
  a Python package is planned.
- **Primary language:** MATLAB (R2016b+). Python planned (Goal 2).
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
- **B — no `pyproject.toml` yet** (from `project-layout` v0.1.0). MATLAB-only
  today; [ENVIRONMENT.md](ENVIRONMENT.md) is the manifest. `pyproject.toml`
  arrives with the Python effort.

## Current work

- Where things stand: **[context/jobs.md](context/jobs.md)** — the worklist. No active effort; Goals 1 (framework adoption) and 2 (colormap editor + Python access) are shipped.

> The [jobs board](context/jobs.md) is the current-work surface; this section only points to it (`tracking-progress`).

## Where to look

| need | file |
| --- | --- |
| conceptual overview / usage | `README.md` |
| the colormap catalog | `colormaps/` |
| library tools (previews, customizer) | `src/+scm/` (`Contents.m`) |
| runnable usage demo | `examples/basic_usage.m` |
| tests | `tests/` |
| conventions (the guidance) | `context/conventions.md` |
| glossary | `context/glossary.md` |
| decisions / ADRs | `context/decisions/` |
| where things stand | `context/jobs.md` |
| efforts / plans / logs / reports | `context/efforts/`, `context/plans/`, `context/logs/`, `context/reports/` |
| environment | `ENVIRONMENT.md` |
| release history | `CHANGELOG.md` |
