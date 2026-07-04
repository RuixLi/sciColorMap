# API surface recipes

How to make a package's public surface legible, per language. Recipes the `working-with-code` convention leans on; non-normative here. Public functions only - internal helpers are exempt.

## Python

- **Annotate every public signature** - params and return, concrete types (`NDArray[np.float64]`, `Path`).
- **One-line docstring under each public def** - what is returned, in meaning not shape.
- **Keyword-only for optionals** - `def fit(X, y, *, alpha=1.0)`.
- **Curated top-level `__init__.py`** - docstring map, explicit re-exports, `__all__`; internal `__init__.py` empty.
- **Underscore marks internal** - or an `_internal/` module.

## MATLAB

MATLAB gives the reader less for free; spend more here.

- **`arguments` block in every function** - shape, type, defaults in one declarable region (the closest thing to typed signatures, R2019b+).
- **Name-value pairs via `opts`** - not positional optionals.
- **H1 line on every function** - the one comment line `help` and `lookfor` read.
- **`Contents.m` per package folder** - public functions with their H1 lines; the API manifest `help folderName` reads.
- **Package folders (`+pkg/`)** - callers write `pkg.fn`; internals in `+pkg/+private/`.

## Gates (the tools enforce)

- **Python** - a test imports every name in `__all__` (catches re-export drift); `pyright` / `mypy --strict` on public modules (catches missing annotations).
- **MATLAB** - a smoke test asserts a non-empty H1 per public function and its presence in `Contents.m`.
