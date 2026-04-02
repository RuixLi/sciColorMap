# sciColorMap

> 🎨 Scientific colormaps for MATLAB — **67 perceptually uniform colormaps** optimized for data visualization

[![MATLAB](https://img.shields.io/badge/MATLAB-R2016b%2B-orange.svg)](https://www.mathworks.com/products/matlab.html)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-2.0.0-green.svg)](CHANGELOG.md)

---

## 📊 Quick Start

```matlab
% Add sciColorMap to your MATLAB path
addpath(genpath('path/to/sciColorMap'))

% Use exactly like built-in colormaps
colormap(viridis)
colormap plasma
cm = magma(256);
```

**That's it!** Drop-in replacement for MATLAB's built-in colormaps with scientifically optimized colors.

---

## 🎨 Gallery

![Colormap Gallery](docs/images/gallery.png)

**View all colormaps:**
```matlab
run examples/show_gallery.m
```

**Preview a specific colormap:**
```matlab
run examples/show_cm('viridis')
```

Browse individual colormap previews in [`docs/colormap_previews/`](docs/colormap_previews/)

---

## ✨ Features

- ✅ **67 scientific colormaps** from leading visualization research
- ✅ **Perceptually uniform** — equal data steps appear as equal color changes
- ✅ **Accessible** — designed for colorblind-friendly visualization
- ✅ **Drop-in replacement** — use like MATLAB built-in colormaps
- ✅ **Multiple categories** — sequential, diverging, cyclic, and multi-sequential
- ✅ **Customizable resolution** — generate any number of colors: `viridis(64)`, `plasma(512)`

---

## 📦 Installation

### Option 1: Add to Path (Recommended)
```matlab
% Add this to your startup.m file for automatic loading
addpath(genpath('/path/to/sciColorMap'))
```

### Option 2: Manual Path Addition
1. Download or clone this repository
2. In MATLAB, navigate to the folder
3. Right-click on `sciColorMap` folder → **Add to Path** → **Selected Folders and Subfolders**

### Option 3: Temporary Use
```matlab
% Add for current session only
cd /path/to/sciColorMap
addpath(genpath(pwd))
```

---

## 🚀 Usage

### Basic Usage
```matlab
% Apply to current figure
colormap(viridis)

% Alternative syntax
colormap plasma

% Get colormap matrix
cm = inferno(256);  % 256x3 RGB matrix
colormap(cm)
```

### Advanced Examples
```matlab
% Use with surface plots
[X, Y] = meshgrid(-5:0.1:5);
Z = sin(sqrt(X.^2 + Y.^2));
surf(X, Y, Z)
colormap(batlow)
colorbar

% Use with images
img = imread('example.png');
imshow(img)
colormap(tokyo)

% Multiple subplots with different colormaps
figure
subplot(1,2,1)
imagesc(peaks(50))
colormap(gca, viridis)  % Apply to specific axes
colorbar

subplot(1,2,2)
imagesc(peaks(50))
colormap(gca, vik)
colorbar

% Custom resolution
colormap(hawaii(128))   % 128 colors
colormap(davos(512))    % 512 colors
```

---

## 📚 Available Colormaps

### Sequential (Continuous data, single hue progression)
`acton`, `bamako`, `batlow`, `bilbao`, `davos`, `devon`, `grayC`, `hawaii`, `imola`, `lajolla`, `lapaz`, `lisbon`, `nuuk`, `oslo`, `tokyo`, `turku`, `buda`, `inferno`, `magma`, `plasma`, `viridis`, `cividis`

### Sequential (Multi-hue)
`algae`, `haline`, `tempo`, `turbid`, `dense`, `deep`, `ice`, `matter`, `thermal`, `speed`, `amp`, `solar`, `tarn`, `tofino`, `turbo`

### Diverging (Data with critical midpoint)
`balance`, `berlin`, `broc`, `cork`, `lisbon`, `roma`, `tofino`, `vik`, `coolwarm`, `seismic`, `bwr`, `bkr`, `delta`, `diff`

### Cyclic (Periodic data: angles, phases)
`bamako`, `broc`, `cork`, `roma`, `twilight`, `romaO`, `brocO`, `corkO`, `vikO`

### Special Purpose
`rainbow` (use with caution!), `phase`, `curl`, `oleron`

**🔍 Browse all previews:** [`docs/colormap_previews/`](docs/colormap_previews/)

---

## 🎯 Choosing the Right Colormap

![Colormap Selection Guide](docs/images/guideline.png)

### Quick Decision Guide

| Data Type | Recommended Colormaps | Use Case |
|-----------|----------------------|----------|
| **Sequential** (0→100) | `batlow`, `lajolla`, `hawaii`, `viridis` | Temperature, elevation, magnitude |
| **Diverging** (-1→0→1) | `vik`, `berlin`, `roma`, `coolwarm` | Anomalies, differences, correlations |
| **Cyclic** (0→360→0) | `romaO`, `twilight`, `phase` | Angles, directions, phases |
| **Categorical** | `tofino`, `hawaii`, `tokyo` | Discrete categories (use with binning) |

### Best Practices
- ✅ **DO** use perceptually uniform colormaps (e.g., `viridis`, `batlow`, `vik`)
- ✅ **DO** consider colorblind accessibility
- ✅ **DO** match colormap type to data structure
- ❌ **AVOID** rainbow colormap for continuous data (hides features, not perceptually uniform)
- ❌ **AVOID** diverging colormaps for sequential data

---

## 📖 Documentation

- **[Changelog](CHANGELOG.md)** — Version history and updates
- **[Examples](examples/)** — Demo scripts and utility functions
  - `show_gallery.m` — Display all available colormaps
  - `show_cm.m` — Display a specific colormap
  - `demo_usage.m` — Comprehensive usage examples
- **[Colormap Previews](docs/colormap_previews/)** — Individual colormap images

---

## 🤝 Contributing & Citation

### Academic Citation
If you use sciColorMap in academic work, please cite the original colormap sources (see References below).

For this package specifically:
```bibtex
@software{sciColorMap,
  author = {Li, Ruix},
  title = {sciColorMap: Scientific Colormaps for MATLAB},
  year = {2021},
  url = {https://github.com/yourusername/sciColorMap}
}
```

See [`CITATION.cff`](CITATION.cff) for structured citation metadata.

### Contributing
Contributions are welcome! Please feel free to submit issues or pull requests.

---

## 📄 License & References

### License
This project is licensed under the MIT License - see [LICENSE](LICENSE) file for details.

### Colormap Sources & Credits

This package aggregates colormaps from multiple sources:

1. **[Matplotlib](https://matplotlib.org/stable/tutorials/colors/colormaps.html)** — `viridis`, `plasma`, `inferno`, `magma`, `cividis`

2. **[cmocean](https://matplotlib.org/cmocean/)** — Oceanography-focused perceptually uniform colormaps

3. **[Scientific Colour Maps (Fabio Crameri)](http://www.fabiocrameri.ch/colourmaps.php)** — Perceptually uniform, colorblind-friendly scientific colormaps

4. **[Color Map Advice for Scientific Visualization (Kenneth Moreland)](https://www.kennethmoreland.com/color-advice/)** — `coolwarm`, `kindlmann`, and diverging colormap theory

### Key References

1. **Crameri, F., Shephard, G.E. & Heron, P.J.** (2020). *The misuse of colour in science communication.* Nature Communications, 11(1), 1-10. [DOI: 10.1038/s41467-020-19160-7](https://doi.org/10.1038/s41467-020-19160-7)

2. **Moreland, K.** (2016). *Why We Use Bad Color Maps and What You Can Do About It.* Electronic Imaging, 2016(16), 1-6.

3. **Kindlmann, G., Reinhard, E., & Creem, S.** (2002). *Face-based luminance matching for perceptual colormap generation.* IEEE Visualization 2002, 299-306.

4. **Thyng, K.M., Greene, C.A., Hetland, R.D., Zimmerle, H.M., & DiMarco, S.F.** (2016). *True colors of oceanography: Guidelines for effective and accurate colormap selection.* Oceanography, 29(3), 9-13.

---

## 🙏 Acknowledgments

Special thanks to the creators of the original colormaps: Stéfan van der Walt, Nathaniel Smith (Matplotlib), Fabio Crameri (Scientific Colour Maps), Kenneth Moreland (Diverging Color Maps), and Kristen Thyng (cmocean).

---

**Questions or Issues?** Please open an issue on the repository or contact the maintainer.

**Enjoy better scientific visualization! 🎨📊**