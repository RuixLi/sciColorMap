% BASIC_USAGE  Minimal sciColorMap usage.
%
% From the repository root:
%   addpath(genpath(pwd))   % puts colormaps/ and src/+scm on the path
%   run examples/basic_usage.m

%% Drop-in: use a colormap like a MATLAB built-in
figure;
imagesc(peaks(200));
colormap(viridis);      % from colormaps/, resolved on the path
colorbar;
title('peaks with viridis');

%% Custom resolution
figure;
imagesc(peaks(200));
colormap(batlow(128));  % 128-color version
colorbar;
title('peaks with batlow(128)');

%% Preview tools (packaged under +scm)
scm.show_cm('vik');     % preview one colormap
scm.show_gallery;       % preview the whole catalog
