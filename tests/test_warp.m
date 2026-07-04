function tests = test_warp
%TEST_WARP  Known-answer tests for scm.warp.
tests = functiontests(localfunctions);
end

function setupOnce(tc) %#ok<INUSD>
here = fileparts(mfilename('fullpath'));
addpath(fullfile(fileparts(here), 'src'));
end

function ramp = grayRamp(n)
p = linspace(0,1,n)';
ramp = [p p p];
end

function test_identity_curve_is_noop(tc)
cmap = grayRamp(64);
verifyEqual(tc, scm.warp(cmap, [0 0; 1 1]), cmap, 'AbsTol', 1e-12);
end

function test_curve_hits_control_point(tc)
% N=101 -> row 51 sits exactly at output position 0.5; the curve passes
% through (0.5, 0.25), so that row must draw the source color at 0.25.
n = 101; cmap = grayRamp(n);
M = scm.warp(cmap, [0 0; 0.5 0.25; 1 1]);
verifyEqual(tc, M(51,:), [0.25 0.25 0.25], 'AbsTol', 1e-12);
end

function test_result_is_monotone_and_in_range(tc)
cmap = grayRamp(128);
M = scm.warp(cmap, [0 0; 0.3 0.6; 1 1]);
verifySize(tc, M, [128 3]);
verifyTrue(tc, all(diff(M(:,1)) >= -1e-12));      % non-decreasing
verifyTrue(tc, all(M(:) >= 0 & M(:) <= 1));
end

function test_non_monotone_y_errors(tc)
verifyError(tc, @() scm.warp(grayRamp(16), [0 0; 0.3 0.6; 0.6 0.4; 1 1]), ...
    'scm:warp:nonMonotoneY');
end

function test_bad_endpoints_error(tc)
verifyError(tc, @() scm.warp(grayRamp(16), [0 0.1; 1 1]), 'scm:warp:badEndpoints');
end
