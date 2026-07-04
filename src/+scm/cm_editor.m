function newmap = cm_editor(cmap)
%CM_EDITOR  Interactively trim and warp a colormap.
%   NEWMAP = scm.cm_editor(CMAP) opens an editor on the N-by-3 colormap CMAP.
%   Trim to a sub-range with the Low/High sliders and reshape the transition by
%   dragging the warp curve (steep = sharp, flat = smooth). Click Done to return
%   the edited N-by-3 matrix; Cancel or closing the window returns CMAP.
%
%   Requires uifigure window mouse callbacks (MATLAB R2020a+; R2022a+ best).
%
%   Example:
%     newmap = scm.cm_editor(viridis(256));
    validateattributes(cmap, {'double','single'}, ...
        {'ncols',3,'>=',0,'<=',1,'nonempty'}, mfilename, 'cmap', 1);
    cmap = double(cmap);
    n = size(cmap, 1);

    st.orig = cmap; st.lo = 0; st.hi = 1;
    st.xy = [0 0; 1 1]; st.result = cmap; st.done = false; st.drag = 0;

    f = uifigure('Name', 'scm.cm_editor', 'Position', [100 100 480 680]);

    uilabel(f, 'Position', [20 640 200 18], 'Text', 'Original');
    axO = uiaxes(f, 'Position', [20 586 440 50]);
    uilabel(f, 'Position', [20 554 200 18], 'Text', 'Result');
    axR = uiaxes(f, 'Position', [20 500 440 50]);

    uilabel(f, 'Position', [20 468 440 18], ...
        'Text', 'Warp curve  —  drag a point; click curve to add; right-click a point to remove');
    axC = uiaxes(f, 'Position', [20 214 440 250]);

    uilabel(f, 'Position', [20 176 50 20], 'Text', 'Low');
    sLo = uislider(f, 'Position', [80 186 260 3], 'Limits', [0 1], 'Value', 0, ...
        'ValueChangingFcn', @(~,ev) onLo(ev.Value));
    uilabel(f, 'Position', [20 128 50 20], 'Text', 'High');
    sHi = uislider(f, 'Position', [80 138 260 3], 'Limits', [0 1], 'Value', 1, ...
        'ValueChangingFcn', @(~,ev) onHi(ev.Value));

    uibutton(f, 'Position', [20 20 90 30],  'Text', 'Reset',  'ButtonPushedFcn', @(~,~) onReset());
    uibutton(f, 'Position', [250 20 90 30], 'Text', 'Cancel', 'ButtonPushedFcn', @(~,~) onCancel());
    uibutton(f, 'Position', [360 20 100 30],'Text', 'Done',   'ButtonPushedFcn', @(~,~) onDone());

    hOrig = image(axO, reshape(st.orig, [1 n 3]));
    hRes  = image(axR, reshape(st.result, [1 n 3]));
    setStrip(axO, n); setStrip(axR, n);

    hold(axC, 'on'); box(axC, 'on');
    axC.XLim = [0 1]; axC.YLim = [0 1]; axC.XTick = []; axC.YTick = [];
    plot(axC, [0 1], [0 1], ':', 'Color', [.5 .5 .5]);
    hCurve = plot(axC, st.xy(:,1), st.xy(:,2), '-', 'Color', [.29 .56 .85], 'LineWidth', 2);
    hPts   = plot(axC, st.xy(:,1), st.xy(:,2), 'o', 'MarkerSize', 8, ...
                  'MarkerFaceColor', [.29 .56 .85], 'MarkerEdgeColor', 'w');
    try disableDefaultInteractivity(axC); axC.Toolbar.Visible = 'off'; catch; end

    f.WindowButtonMotionFcn = @(~,~) onMove();
    f.WindowButtonUpFcn     = @(~,~) onUp();
    hPts.ButtonDownFcn      = @(~,~) onPointDown();
    hCurve.ButtonDownFcn    = @(~,~) onCurveDown();
    f.CloseRequestFcn       = @(~,~) onCancel();

    refresh();
    uiwait(f);
    newmap = st.result;

    % ---------------- nested callbacks ----------------
    function setStrip(ax, m)
        ax.XLim = [0.5 m+0.5]; ax.YLim = [0.5 1.5]; axis(ax, 'off');
    end
    function onLo(v), st.lo = min(v, st.hi - 1e-3); refresh(); end
    function onHi(v), st.hi = max(v, st.lo + 1e-3); refresh(); end
    function onReset()
        st.lo = 0; st.hi = 1; st.xy = [0 0; 1 1];
        sLo.Value = 0; sHi.Value = 1; refresh();
    end
    function onCancel(), st.result = st.orig; st.done = false; uiresume(f); delete(f); end
    function onDone(),   st.done = true; uiresume(f); delete(f); end

    function onPointDown()
        cp = axC.CurrentPoint(1, 1:2);
        [~, i] = min(abs(st.xy(:,1) - cp(1)));
        if strcmp(f.SelectionType, 'alt')            % right-click removes interior point
            if i > 1 && i < size(st.xy, 1), st.xy(i,:) = []; refresh(); end
        else
            st.drag = i;                             % begin drag
        end
    end
    function onCurveDown()
        if ~strcmp(f.SelectionType, 'alt')
            cp = axC.CurrentPoint(1, 1:2);
            x = min(max(cp(1), 0), 1);
            st.xy = sortrows([st.xy; x cp(2)], 1);
            clampMonotone();
            [~, st.drag] = min(abs(st.xy(:,1) - x));
            refresh();
        end
    end
    function onMove()
        if st.drag == 0, return; end
        k = st.drag; last = size(st.xy, 1);
        if k == 1 || k == last, return; end          % endpoints locked
        cp = axC.CurrentPoint(1, 1:2);
        xlo = st.xy(k-1,1) + 1e-3; xhi = st.xy(k+1,1) - 1e-3;
        st.xy(k,1) = min(max(cp(1), xlo), xhi);
        st.xy(k,2) = min(max(cp(2), 0), 1);
        clampMonotone(); refresh();
    end
    function onUp(), st.drag = 0; end
    function clampMonotone()
        st.xy(1,:) = [0 0]; st.xy(end,:) = [1 1];
        for k = 2:size(st.xy,1)
            if st.xy(k,2) < st.xy(k-1,2), st.xy(k,2) = st.xy(k-1,2); end
        end
    end
    function refresh()
        st.result = scm.warp(scm.trim(st.orig, st.lo, st.hi), st.xy);
        hOrig.CData = reshape(st.orig,   [1 n 3]);
        hRes.CData  = reshape(st.result, [1 n 3]);
        set(hCurve, 'XData', st.xy(:,1), 'YData', st.xy(:,2));
        set(hPts,   'XData', st.xy(:,1), 'YData', st.xy(:,2));
    end
end
