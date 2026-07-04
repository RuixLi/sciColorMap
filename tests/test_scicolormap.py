import sys
from pathlib import Path

import numpy as np
import pytest

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "src"))
import scm  # noqa: E402


def test_list_cm_nonempty_and_sorted():
    names = scm.list_cm()
    assert len(names) >= 1
    assert names == sorted(names)
    assert "viridis" in names


def test_load_default_shape_and_range():
    m = scm.load("viridis")
    assert m.shape == (256, 3)
    assert m.min() >= 0.0 and m.max() <= 1.0


def test_load_resamples_to_n():
    assert scm.load("viridis", n=64).shape == (64, 3)


def test_load_n256_is_identity():
    base = np.loadtxt(ROOT / "colormaps" / "viridis.csv", delimiter=",")
    np.testing.assert_allclose(scm.load("viridis", 256), base, atol=1e-12)


def test_load_endpoints_preserved_when_resampling():
    base = np.loadtxt(ROOT / "colormaps" / "viridis.csv", delimiter=",")
    m = scm.load("viridis", n=64)
    np.testing.assert_allclose(m[0], base[0], atol=1e-12)
    np.testing.assert_allclose(m[-1], base[-1], atol=1e-12)


def test_unknown_name_raises():
    with pytest.raises(ValueError):
        scm.load("not_a_colormap")


def test_cmap_returns_listedcolormap():
    from matplotlib.colors import ListedColormap
    c = scm.cmap("vik")
    assert isinstance(c, ListedColormap)
    assert c.N == 256
