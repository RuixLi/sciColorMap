function show_cm(cmname)
% plot a colorbar for each colormap in this folder
  
% plot the colorbar
imagesc(1:256);
colormap(gca,cmname);
axis off;

end