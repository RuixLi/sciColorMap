function show_gallery
% SHOW_GALLERY  Preview every colormap in the catalog as a grid of colorbars.
%
%   scm.show_gallery displays all colormaps found in the repository's
%   colormaps/ folder. Requires the catalog to be on the path
%   (addpath(genpath('path/to/sciColorMap'))).

% This file lives in <root>/src/+scm/, so climb two levels to the repo root
% and locate the colormap catalog.
here  = fileparts(mfilename('fullpath'));   % <root>/src/+scm
root  = fileparts(fileparts(here));         % <root>
cmdir = fullfile(root, 'colormaps');

% list every colormap function file and strip the .m extension
files = dir(fullfile(cmdir, '*.m'));
names = erase({files.name}, '.m');
ncmg  = numel(names);
assert(ncmg > 0, 'show_gallery:noColormaps', ...
    'no colormaps found in %s', cmdir);

% grid layout: roughly square
nrow = ceil(sqrt(ncmg));
ncol = ceil(ncmg / nrow);

figure('Position', [100 100 1000 500]);
for i = 1:ncmg
    cmg = feval(names{i});          % each file returns an Nx3 RGB lookup table
    subplot(nrow, ncol, i);
    imagesc(1:256);
    colormap(gca, cmg);
    axis off;
    title(names{i}, 'Interpreter', 'none');
end
end
