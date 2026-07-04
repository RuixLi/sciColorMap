"""sciColorMap — load the colormap catalog in Python.

RGB tables live as colormaps/<name>.csv (256x3, values in [0,1]), exported from
the MATLAB catalog. This module reads them; it has no import side effects.

    import scm, seaborn as sns
    sns.heatmap(data, cmap=scm.cmap("vik"))
"""
from pathlib import Path

import numpy as np

# <root>/src/scm.py -> <root>/colormaps
_DATA_DIR = Path(__file__).resolve().parent.parent / "colormaps"


def list_cm():
    """Return the sorted list of available colormap names."""
    return sorted(p.stem for p in _DATA_DIR.glob("*.csv"))


def load(name, n=256):
    """Return an n-by-3 numpy array of RGB in [0,1] for the named colormap.

    The 256-row base table is linearly interpolated to n rows.
    """
    path = _DATA_DIR / f"{name}.csv"
    if not path.exists():
        raise ValueError(f"unknown colormap {name!r}; try scm.list_cm()")
    base = np.loadtxt(path, delimiter=",")
    if base.ndim != 2 or base.shape[1] != 3:
        raise ValueError(f"{name}: expected N-by-3 data, got {base.shape}")
    if n == base.shape[0]:
        return base.copy()
    src = np.linspace(0.0, 1.0, base.shape[0])
    dst = np.linspace(0.0, 1.0, n)
    return np.column_stack([np.interp(dst, src, base[:, c]) for c in range(3)])


def cmap(name, n=256):
    """Return a matplotlib ListedColormap for the named colormap."""
    from matplotlib.colors import ListedColormap
    return ListedColormap(load(name, n), name=name)
