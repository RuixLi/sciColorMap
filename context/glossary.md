# Glossary

Project-specific terms. Framework terms (effort, oracle, scheme, plan, report)
are defined in the vendored conventions — see [conventions.md](conventions.md).

## Colormaps

- **colormap / LUT** — a lookup table mapping a scalar in `[0,1]` to an RGB
  triple; in MATLAB an `N×3` matrix of values in `[0,1]`. Each file in
  `colormaps/` is a function returning such a matrix.
- **catalog** — the set of colormap functions in `colormaps/`, kept on the
  MATLAB path for drop-in use (`colormap(viridis)`). Treated as the package's
  data/asset layer, not namespaced code — see [decisions/0001](decisions/0001-catalog-at-root-and-cross-language-layout.md).
- **sequential** — ordered low→high (e.g. `viridis`, `batlow`); for magnitude.
- **diverging** — two arms around a neutral midpoint (e.g. `vik`, `berlin`);
  for signed anomalies around zero.
- **cyclic** — wraps end-to-start (e.g. `romaO`, `twilight`); for angles/phase.
- **perceptually uniform** — equal steps in data read as equal perceived color
  steps; the design property the catalog selects for.

## This repo

- **`scm`** — the MATLAB package namespace (`src/+scm/`) holding the library
  *tools* (preview, and the planned customizer). Called as `scm.show_gallery`.
  Distinct from the catalog, which is not namespaced.
