# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
