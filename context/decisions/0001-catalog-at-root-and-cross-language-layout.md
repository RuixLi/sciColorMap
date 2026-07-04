# 0001 — Colormap catalog at root; tools in `src/`; cross-language plan

- **Status:** Accepted
- **Date:** 2026-07-04
- **Deciders:** ruixli

## Context

sciColorMap is a `package` whose entire value is *drop-in* MATLAB usage:
`colormap(viridis)`, `magma(256)`. MATLAB resolves a colormap function by name
from the path, so the ~67 colormap functions must sit **directly on the path**,
not behind a namespace — `scm.viridis(256)` would break the drop-in promise and
every downstream script that already calls `viridis`.

The framework's package layout ([where-files-live](../where-files-live.md),
[project-layout](../references/project-layout.md)) expects reusable code under
`src/<pkg>/` (MATLAB `src/+<pkg>/`). Applied verbatim, that would namespace the
colormaps. Separately, Goal 2 wants the same colormaps callable from **Python**
and a **customization tool** (trim, tune the gradient).

## Decision

1. **Catalog stays at `colormaps/` in the repo root, on the MATLAB path** —
   treated as the package's *data / asset layer*, not namespaced code.
   *(Deviation A from `where-files-live`, which places reusable code in `src/`.)*
2. **Library tools live in `src/+scm/`** (namespace `scm`): the previews today
   (`show_cm`, `show_gallery`) and the planned customizer. **Tests in `tests/`.**
3. **Cross-language (Goal 2, deferred):** the colormap RGB tables become the
   *language-neutral source of truth* so MATLAB and Python read the same data.
   Today the `.m` files are MATLAB *code*, not neutral data, so Python cannot
   consume them directly. The exact representation — per-map files vs one table;
   *extract* the RGB from the `.m` files vs *generate both* `.m` and Python from
   a master — is an **open question to resolve in the Python effort's design**,
   not here.

## Options considered

- **Namespace colormaps as `scm.viridis`** — rejected: breaks drop-in usage (the
  point of the package) and churns every caller.
- **Keep everything flat at root, no `src/`** — rejected: blurs tools and data,
  leaves no home for the Python package or tests, and drifts from the framework.
- **Chosen:** catalog at root (data layer) + tools in `src/+scm/` + `tests/`.

## Consequences

- `AGENTS.md` declares **Deviation A** (catalog at root) and **Deviation B**
  (no `pyproject.toml` yet — MATLAB-only today; `ENVIRONMENT.md` is the manifest).
- `colormaps/` is tracked *text* (small `.m` files), not git-ignored data — the
  deviation is about **location**, not the tracked/synced split.
- Tools locate the catalog by climbing to the repo root (see
  `src/+scm/show_gallery.m`, `tests/test_colormaps.m`), not via the package.
- Python support is blocked on choosing the neutral data representation above;
  that choice is the first design question of the Python effort.
