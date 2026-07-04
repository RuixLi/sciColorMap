"""Minimal sciColorMap usage in Python.

Run from the repo (or anywhere — it locates src/ relative to this file):

    python examples/basic_usage.py

Requires numpy + matplotlib. The colormaps come from colormaps/*.csv,
exported from the MATLAB catalog by scm.export_cm.
"""
import sys
from pathlib import Path

import numpy as np
import matplotlib.pyplot as plt

# put the repo's src/ on the path, then import the loader
ROOT = Path(__file__).resolve().parent.parent
sys.path.append(str(ROOT / "src"))
import scm  # noqa: E402

# a sample field to colour
grid = np.linspace(-3, 3, 200)
X, Y = np.meshgrid(grid, grid)
Z = np.sin(np.hypot(X, Y))

print(f"{len(scm.list_cm())} colormaps available")
print("viridis(8) =\n", np.round(scm.load("viridis", 8), 3))

fig, axes = plt.subplots(1, 3, figsize=(11, 3.4))
axes[0].imshow(Z, cmap=scm.cmap("batlow"))          # sequential, straight into imshow
axes[0].set_title("batlow")
axes[1].imshow(Z, cmap=scm.cmap("vik", 16))         # diverging, 16 discrete steps
axes[1].set_title("vik (16 levels)")
axes[2].imshow(Z, cmap=scm.cmap("viridis"))
axes[2].set_title("viridis")
for ax in axes:
    ax.axis("off")

plt.tight_layout()
plt.show()
