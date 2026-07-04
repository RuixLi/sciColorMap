function M = warp(cmap, xy)
%WARP  Reparametrize a colormap by a monotone curve through control points.
%   M = scm.warp(CMAP, XY) resamples the N-by-3 colormap CMAP so that output
%   position x draws the color at source position y, where x->y is the monotone
%   PCHIP curve through control points XY (K-by-2, columns [x y]) with
%   XY(1,:)=[0 0], XY(end,:)=[1 1], x strictly increasing and y non-decreasing,
%   all in [0,1]. The identity curve [0 0; 1 1] is a no-op. Curve slope is the
%   local transition sharpness (steep = sharp, flat = smooth).
    validateattributes(cmap, {'double','single'}, ...
        {'ncols',3,'>=',0,'<=',1,'nonempty'}, mfilename, 'cmap', 1);
    validateattributes(xy, {'double'}, {'2d','ncols',2,'>=',0,'<=',1}, mfilename, 'xy', 2);
    if size(xy,1) < 2
        error('scm:warp:badShape', 'xy must have at least 2 rows.');
    end
    x = xy(:,1); y = xy(:,2);
    if x(1) ~= 0 || x(end) ~= 1 || y(1) ~= 0 || y(end) ~= 1
        error('scm:warp:badEndpoints', 'xy must start at [0 0] and end at [1 1].');
    end
    if any(diff(x) <= 0)
        error('scm:warp:nonMonotoneX', 'xy(:,1) must be strictly increasing.');
    end
    if any(diff(y) < 0)
        error('scm:warp:nonMonotoneY', 'xy(:,2) must be non-decreasing.');
    end
    cmap = double(cmap);
    n = size(cmap, 1);
    p = linspace(0, 1, n);
    g = pchip(x, y, p);              % monotone-preserving through the points
    g = min(max(g, 0), 1);           % guard tiny float overshoot
    M = interp1(p, cmap, g, 'linear');
end
