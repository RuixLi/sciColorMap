function showgallery
% plot a colorbar for each colormap in this folder
%

% get the list of colormaps
cmglist = dir(fullfile(fileparts(mfilename('fullpath')),'colormaps'));

cmglist = {cmglist(3:end).name};

% get the number of colormaps
ncmg = length(cmglist);

% get the number of rows and columns
nrow = ceil(sqrt(ncmg));
ncol = ceil(ncmg/nrow);

% create the figure
figure('Position', [100 100 1000 500]);

% loop over the colormaps
for i = 1:ncmg
    % load the colormap
    cmg = eval(cmglist{i}(1:end-2));
    
    % create the subplot
    subplot(nrow, ncol, i);
    
    % plot the colorbar
    imagesc(1:256);
    colormap(gca,cmg);
    axis off;
    title(cmglist{i}(1:end-2), 'Interpreter', 'none');
end