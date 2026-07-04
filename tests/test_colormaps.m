function test_colormaps
% TEST_COLORMAPS  Every colormap returns a valid Nx3 RGB lookup table in [0,1].
%
% A seatbelt for the catalog: it does not judge perceptual quality, only
% that each colormap function loads and returns well-formed RGB values.
%
% Run from the repository root with the catalog on the path:
%   addpath(genpath(pwd))
%   runtests('tests')      % or: test_colormaps

% This file lives in <root>/tests/, so climb one level to the repo root.
root  = fileparts(fileparts(mfilename('fullpath')));   % <root>
cmdir = fullfile(root, 'colormaps');

files = dir(fullfile(cmdir, '*.m'));
names = erase({files.name}, '.m');
assert(~isempty(names), 'test_colormaps:noColormaps', ...
    'no colormaps found in %s', cmdir);

for i = 1:numel(names)
    name = names{i};
    cm = feval(name);
    assert(ismatrix(cm) && size(cm, 2) == 3, ...
        'test_colormaps:notNx3', ...
        '%s did not return an Nx3 matrix (got %s)', name, mat2str(size(cm)));
    assert(all(cm(:) >= 0 & cm(:) <= 1), ...
        'test_colormaps:outOfRange', ...
        '%s returned RGB values outside [0,1]', name);
end

fprintf('OK: %d colormaps return valid Nx3 RGB in [0,1]\n', numel(names));
end
