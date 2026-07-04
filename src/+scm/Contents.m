% SCM  sciColorMap tools (namespace: scm)
%
% Preview
%   show_cm      - Preview a single colormap by name, e.g. scm.show_cm('viridis')
%   show_gallery - Preview every colormap in the catalog as a grid
%
% Edit
%   trim         - Restrict a colormap to a [lo,hi] sub-range (pure)
%   warp         - Reparametrize a colormap by a monotone curve (pure)
%   cm_editor   - Interactively trim + warp a colormap (returns the edited N-by-3)
%
% The colormaps themselves are NOT in this package: they live in the
% repository's colormaps/ folder and are used directly as drop-in
% replacements once on the path, e.g. colormap(viridis) or magma(256).
% See README.md for the full catalog and usage.
