function tests = test_export_data
%TEST_EXPORT_DATA  Each committed colormaps/<name>.csv matches feval(name,256).
tests = functiontests(localfunctions);
end

function setupOnce(tc) %#ok<INUSD>
here = fileparts(mfilename('fullpath'));               % tests/
addpath(fullfile(fileparts(here), 'colormaps'));       % catalog on path for feval
end

function test_every_csv_matches_matlab(tc)
here  = fileparts(mfilename('fullpath'));
cmdir = fullfile(fileparts(here), 'colormaps');
files = dir(fullfile(cmdir, '*.m'));
names = erase({files.name}, '.m');
verifyNotEmpty(tc, names);
for i = 1:numel(names)
    csv = fullfile(cmdir, [names{i} '.csv']);
    verifyTrue(tc, isfile(csv), ...
        sprintf('missing %s.csv - run scm.export_cm', names{i}));
    M = feval(names{i}, 256);
    C = readmatrix(csv);
    verifyEqual(tc, C, M, 'AbsTol', 1e-6, ...
        sprintf('%s.csv does not match feval(%s,256)', names{i}, names{i}));
end
end
