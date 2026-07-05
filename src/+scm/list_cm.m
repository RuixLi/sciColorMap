function names = list_cm()
%LIST_CM  List the names of every colormap in the catalog.
%   NAMES = scm.list_cm() returns a sorted string array of the colormap names
%   in the repository's colormaps/ folder -- the same names accepted by
%   colormap(<name>) and scm.show_cm. Mirrors the Python scm.list_cm().
%
%   Example:
%     names = scm.list_cm();
%     disp(names)
    here  = fileparts(mfilename('fullpath'));   % <root>/src/+scm
    root  = fileparts(fileparts(here));         % <root>
    cmdir = fullfile(root, 'colormaps');
    files = dir(fullfile(cmdir, '*.m'));
    names = sort(string(erase({files.name}, '.m')));
    names = names(:);                           % column vector
end
