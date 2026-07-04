function tests = test_trim
%TEST_TRIM  Known-answer tests for scm.trim.
tests = functiontests(localfunctions);
end

function setupOnce(tc) %#ok<INUSD>
here = fileparts(mfilename('fullpath'));         % tests/
addpath(fullfile(fileparts(here), 'src'));       % repo/src -> scm.* resolves
end

function ramp = grayRamp(n)
p = linspace(0,1,n)';
ramp = [p p p];                                  % color == position: exact answers
end

function test_full_range_is_identity(tc)
cmap = grayRamp(64);
verifyEqual(tc, scm.trim(cmap,0,1), cmap, 'AbsTol', 1e-12);
end

function test_subrange_restretches(tc)
n = 256; cmap = grayRamp(n);
M = scm.trim(cmap, 0.25, 0.75);
expected = linspace(0.25,0.75,n)';
verifyEqual(tc, M, [expected expected expected], 'AbsTol', 1e-12);
end

function test_shape_and_range_preserved(tc)
cmap = grayRamp(100);
M = scm.trim(cmap, 0.1, 0.9);
verifySize(tc, M, [100 3]);
verifyTrue(tc, all(M(:) >= 0 & M(:) <= 1));
end

function test_lo_ge_hi_errors(tc)
verifyError(tc, @() scm.trim(grayRamp(16), 0.6, 0.4), 'scm:trim:badRange');
end

function test_bad_shape_errors(tc)
verifyError(tc, @() scm.trim(ones(10,2), 0, 1), 'scm:trim:badShape');
end
