# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed
- Adopted the **all-you-need-is-trust** framework (v0.1.0) as a `package`: added
  `AGENTS.md` (agent entry point), `ENVIRONMENT.md`, and a `context/` working
  memory holding the vendored conventions (hash-sealed in
  `context/conventions-bundle.json`). Aligned `.gitignore` to the framework template.
- **Breaking (tools):** moved the preview tools into a MATLAB package — `show_cm`
  and `show_gallery` now live in `src/+scm/` and are called as `scm.show_cm` /
  `scm.show_gallery` (previously `run examples/show_gallery.m`). `show_gallery`
  now discovers the catalog robustly (all `*.m`) instead of a fixed directory slice.
- Recorded the catalog-at-root architecture decision in ADR 0001.

### Added
- `tests/test_colormaps.m` — smoke test that every colormap returns a valid
  `N×3` RGB table in `[0,1]`.
- `examples/basic_usage.m` — runnable usage demo.
- `scm.trim`, `scm.warp`, and interactive `scm.cm_editor` — trim a colormap to a sub-range and reshape its transition (see [effort](context/efforts/colormap-editor.md)).
- Python access: `colormaps/*.csv` exported via `scm.export_cm`, loaded by `src/scm.py` (`scm.load` / `scm.cmap` / `scm.list_cm`) for matplotlib/seaborn.

### Removed
- Stray `.DS_Store` from version control.

## [2.1.0] - 2026-04-02

### Changed
- Reorganized project structure for better maintainability
- Moved utility functions to `examples/` folder
- Consolidated documentation assets in `docs/` folder
- Enhanced README with improved visual hierarchy and navigation

### Added
- CHANGELOG.md for version history tracking
- CITATION.cff for academic citation
- VERSION file
- Contents.m for MATLAB help system integration
- Comprehensive usage examples in demo_usage.m

## [2.0.0] - 2024-06-17

### Added
- 60+ perceptually uniform scientific colormaps
- Colormaps from multiple sources:
  - Matplotlib (viridis, plasma, inferno, magma, cividis)
  - cmocean collection
  - Scientific Colour Maps 6.0 (Fabio Crameri)
  - Color Map Advice for Scientific Visualization (Kenneth Moreland)
- `show_gallery.m` function to display all available colormaps
- `show_cm.m` function to display individual colormaps
- Colormap selection guideline based on data type
- Preview images for all colormaps
- MIT License

### Features
- Drop-in replacement for MATLAB built-in colormaps
- Support for standard colormap syntax: `colormap(name)` and `colormap name`
- Support for custom resolution: `colormap(name(n))`
- Perceptually uniform design for better data representation
- Accessibility-focused color schemes

## [1.0.0] - Initial Release

### Added
- Initial colormap collection
- Basic documentation
