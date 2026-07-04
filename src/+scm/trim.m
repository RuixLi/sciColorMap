function M = trim(cmap, lo, hi)
%TRIM  Restrict a colormap to a [lo,hi] sub-range, re-stretched to N rows.
%   M = scm.trim(CMAP, LO, HI) returns the slice of the N-by-3 colormap CMAP
%   between normalized positions LO and HI (0 <= LO < HI <= 1), re-sampled back
%   to N rows.
%
%   Example:
%     M = scm.trim(viridis(256), 0.1, 0.9);   % drop the darkest/lightest 10%
    validateattributes(cmap, {'double','single'}, ...
        {'2d','nonempty','>=',0,'<=',1}, mfilename, 'cmap', 1);
    if size(cmap,2) ~= 3
        error('scm:trim:badShape', 'cmap must be N-by-3, got N-by-%d.', size(cmap,2));
    end
    validateattributes(lo, {'double'}, {'scalar','>=',0,'<=',1}, mfilename, 'lo', 2);
    validateattributes(hi, {'double'}, {'scalar','>=',0,'<=',1}, mfilename, 'hi', 3);
    if lo >= hi
        error('scm:trim:badRange', 'lo (%g) must be < hi (%g).', lo, hi);
    end
    cmap = double(cmap);
    n = size(cmap, 1);
    p = linspace(0, 1, n);
    M = interp1(p, cmap, linspace(lo, hi, n), 'linear');
end
