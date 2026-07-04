function show_cm(cmname)
% plot a colorbar for each colormap in this folder
assert(ischar(cmname)||isstring(cmname),'input should be a string')
figure('Position',[200,100,400,100])
axes('Position',[0.1,0.1,0.8,0.5]);
imagesc(repmat(1:256,30,1))
colormap(gca,cmname);
text(0,-8,cmname,'FontSize',24,'FontWeight','normal','HorizontalAlignment','left')
axis off

end