function tests = test_list_cm
%TEST_LIST_CM  scm.list_cm returns the sorted catalog names.
tests = functiontests(localfunctions);
end

function setupOnce(tc) %#ok<INUSD>
here = fileparts(mfilename('fullpath'));            % tests/
addpath(fullfile(fileparts(here), 'src'));          % repo/src -> scm.* resolves
end

function test_returns_sorted_string_names(tc)
names = scm.list_cm();
verifyClass(tc, names, 'string');
verifyGreaterThanOrEqual(tc, numel(names), 1);
verifyTrue(tc, issorted(names));
verifyTrue(tc, any(names == "viridis"));
end

function test_count_matches_catalog(tc)
here  = fileparts(mfilename('fullpath'));
cmdir = fullfile(fileparts(here), 'colormaps');
n = numel(dir(fullfile(cmdir, '*.m')));
verifyEqual(tc, numel(scm.list_cm()), n);
end
