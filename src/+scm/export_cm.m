function export_cm(outdir)
%EXPORT_CM  Write each catalog colormap to a 256x3 CSV.
%   scm.export_cm() writes colormaps/<name>.csv for every colormaps/<name>.m
%   using feval(name, 256). Re-run whenever a colormap .m changes.
%   scm.export_cm(OUTDIR) writes to OUTDIR instead of colormaps/.
    here  = fileparts(mfilename('fullpath'));   % <root>/src/+scm
    root  = fileparts(fileparts(here));         % <root>
    cmdir = fullfile(root, 'colormaps');
    if nargin < 1 || isempty(outdir)
        outdir = cmdir;
    end
    files = dir(fullfile(cmdir, '*.m'));
    names = erase({files.name}, '.m');
    for i = 1:numel(names)
        M = feval(names{i}, 256);
        writematrix(M, fullfile(outdir, [names{i} '.csv']));
    end
    fprintf('exported %d colormaps to %s\n', numel(names), outdir);
end
