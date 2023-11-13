function map = inferno(m)
%   INFERNO a colour map adopted from matplotlib
%   inferno(M) returns an M-by-3 matrix containing a colormap.
%   written by Ruix.Li in Jan, 2021

% USAGE:
% colormap(inferno(128))
% colormap inferno

if nargin < 1
    f = get(groot,'CurrentFigure');
    if isempty(f)
        m = size(get(groot,'DefaultFigureColormap'),1);
    else
        m = size(f.Colormap,1);
    end
end

values = [
    0.001462000000000   0.000466000000000   0.013866000000000
    0.002267000000000   0.001270000000000   0.018570000000000
    0.003299000000000   0.002249000000000   0.024239000000000
    0.004547000000000   0.003392000000000   0.030909000000000
    0.006006000000000   0.004692000000000   0.038558000000000
    0.007676000000000   0.006136000000000   0.046836000000000
    0.009561000000000   0.007713000000000   0.055143000000000
    0.011663000000000   0.009417000000000   0.063460000000000
    0.013995000000000   0.011225000000000   0.071862000000000
    0.016561000000000   0.013136000000000   0.080282000000000
    0.019373000000000   0.015133000000000   0.088767000000000
    0.022447000000000   0.017199000000000   0.097327000000000
    0.025793000000000   0.019331000000000   0.105930000000000
    0.029432000000000   0.021503000000000   0.114621000000000
    0.033385000000000   0.023702000000000   0.123397000000000
    0.037668000000000   0.025921000000000   0.132232000000000
    0.042253000000000   0.028139000000000   0.141141000000000
    0.046915000000000   0.030324000000000   0.150164000000000
    0.051644000000000   0.032474000000000   0.159254000000000
    0.056449000000000   0.034569000000000   0.168414000000000
    0.061340000000000   0.036590000000000   0.177642000000000
    0.066331000000000   0.038504000000000   0.186962000000000
    0.071429000000000   0.040294000000000   0.196354000000000
    0.076637000000000   0.041905000000000   0.205799000000000
    0.081962000000000   0.043328000000000   0.215289000000000
    0.087411000000000   0.044556000000000   0.224813000000000
    0.092990000000000   0.045583000000000   0.234358000000000
    0.098702000000000   0.046402000000000   0.243904000000000
    0.104551000000000   0.047008000000000   0.253430000000000
    0.110536000000000   0.047399000000000   0.262912000000000
    0.116656000000000   0.047574000000000   0.272321000000000
    0.122908000000000   0.047536000000000   0.281624000000000
    0.129285000000000   0.047293000000000   0.290788000000000
    0.135778000000000   0.046856000000000   0.299776000000000
    0.142378000000000   0.046242000000000   0.308553000000000
    0.149073000000000   0.045468000000000   0.317085000000000
    0.155850000000000   0.044559000000000   0.325338000000000
    0.162689000000000   0.043554000000000   0.333277000000000
    0.169575000000000   0.042489000000000   0.340874000000000
    0.176493000000000   0.041402000000000   0.348111000000000
    0.183429000000000   0.040329000000000   0.354971000000000
    0.190367000000000   0.039309000000000   0.361447000000000
    0.197297000000000   0.038400000000000   0.367535000000000
    0.204209000000000   0.037632000000000   0.373238000000000
    0.211095000000000   0.037030000000000   0.378563000000000
    0.217949000000000   0.036615000000000   0.383522000000000
    0.224763000000000   0.036405000000000   0.388129000000000
    0.231538000000000   0.036405000000000   0.392400000000000
    0.238273000000000   0.036621000000000   0.396353000000000
    0.244967000000000   0.037055000000000   0.400007000000000
    0.251620000000000   0.037705000000000   0.403378000000000
    0.258234000000000   0.038571000000000   0.406485000000000
    0.264810000000000   0.039647000000000   0.409345000000000
    0.271347000000000   0.040922000000000   0.411976000000000
    0.277850000000000   0.042353000000000   0.414392000000000
    0.284321000000000   0.043933000000000   0.416608000000000
    0.290763000000000   0.045644000000000   0.418637000000000
    0.297178000000000   0.047470000000000   0.420491000000000
    0.303568000000000   0.049396000000000   0.422182000000000
    0.309935000000000   0.051407000000000   0.423721000000000
    0.316282000000000   0.053490000000000   0.425116000000000
    0.322610000000000   0.055634000000000   0.426377000000000
    0.328921000000000   0.057827000000000   0.427511000000000
    0.335217000000000   0.060060000000000   0.428524000000000
    0.341500000000000   0.062325000000000   0.429425000000000
    0.347771000000000   0.064616000000000   0.430217000000000
    0.354032000000000   0.066925000000000   0.430906000000000
    0.360284000000000   0.069247000000000   0.431497000000000
    0.366529000000000   0.071579000000000   0.431994000000000
    0.372768000000000   0.073915000000000   0.432400000000000
    0.379001000000000   0.076253000000000   0.432719000000000
    0.385228000000000   0.078591000000000   0.432955000000000
    0.391453000000000   0.080927000000000   0.433109000000000
    0.397674000000000   0.083257000000000   0.433183000000000
    0.403894000000000   0.085580000000000   0.433179000000000
    0.410113000000000   0.087896000000000   0.433098000000000
    0.416331000000000   0.090203000000000   0.432943000000000
    0.422549000000000   0.092501000000000   0.432714000000000
    0.428768000000000   0.094790000000000   0.432412000000000
    0.434987000000000   0.097069000000000   0.432039000000000
    0.441207000000000   0.099338000000000   0.431594000000000
    0.447428000000000   0.101597000000000   0.431080000000000
    0.453651000000000   0.103848000000000   0.430498000000000
    0.459875000000000   0.106089000000000   0.429846000000000
    0.466100000000000   0.108322000000000   0.429125000000000
    0.472328000000000   0.110547000000000   0.428334000000000
    0.478558000000000   0.112764000000000   0.427475000000000
    0.484789000000000   0.114974000000000   0.426548000000000
    0.491022000000000   0.117179000000000   0.425552000000000
    0.497257000000000   0.119379000000000   0.424488000000000
    0.503493000000000   0.121575000000000   0.423356000000000
    0.509730000000000   0.123769000000000   0.422156000000000
    0.515967000000000   0.125960000000000   0.420887000000000
    0.522206000000000   0.128150000000000   0.419549000000000
    0.528444000000000   0.130341000000000   0.418142000000000
    0.534683000000000   0.132534000000000   0.416667000000000
    0.540920000000000   0.134729000000000   0.415123000000000
    0.547157000000000   0.136929000000000   0.413511000000000
    0.553392000000000   0.139134000000000   0.411829000000000
    0.559624000000000   0.141346000000000   0.410078000000000
    0.565854000000000   0.143567000000000   0.408258000000000
    0.572081000000000   0.145797000000000   0.406369000000000
    0.578304000000000   0.148039000000000   0.404411000000000
    0.584521000000000   0.150294000000000   0.402385000000000
    0.590734000000000   0.152563000000000   0.400290000000000
    0.596940000000000   0.154848000000000   0.398125000000000
    0.603139000000000   0.157151000000000   0.395891000000000
    0.609330000000000   0.159474000000000   0.393589000000000
    0.615513000000000   0.161817000000000   0.391219000000000
    0.621685000000000   0.164184000000000   0.388781000000000
    0.627847000000000   0.166575000000000   0.386276000000000
    0.633998000000000   0.168992000000000   0.383704000000000
    0.640135000000000   0.171438000000000   0.381065000000000
    0.646260000000000   0.173914000000000   0.378359000000000
    0.652369000000000   0.176421000000000   0.375586000000000
    0.658463000000000   0.178962000000000   0.372748000000000
    0.664540000000000   0.181539000000000   0.369846000000000
    0.670599000000000   0.184153000000000   0.366879000000000
    0.676638000000000   0.186807000000000   0.363849000000000
    0.682656000000000   0.189501000000000   0.360757000000000
    0.688653000000000   0.192239000000000   0.357603000000000
    0.694627000000000   0.195021000000000   0.354388000000000
    0.700576000000000   0.197851000000000   0.351113000000000
    0.706500000000000   0.200728000000000   0.347777000000000
    0.712396000000000   0.203656000000000   0.344383000000000
    0.718264000000000   0.206636000000000   0.340931000000000
    0.724103000000000   0.209670000000000   0.337424000000000
    0.729909000000000   0.212759000000000   0.333861000000000
    0.735683000000000   0.215906000000000   0.330245000000000
    0.741423000000000   0.219112000000000   0.326576000000000
    0.747127000000000   0.222378000000000   0.322856000000000
    0.752794000000000   0.225706000000000   0.319085000000000
    0.758422000000000   0.229097000000000   0.315266000000000
    0.764010000000000   0.232554000000000   0.311399000000000
    0.769556000000000   0.236077000000000   0.307485000000000
    0.775059000000000   0.239667000000000   0.303526000000000
    0.780517000000000   0.243327000000000   0.299523000000000
    0.785929000000000   0.247056000000000   0.295477000000000
    0.791293000000000   0.250856000000000   0.291390000000000
    0.796607000000000   0.254728000000000   0.287264000000000
    0.801871000000000   0.258674000000000   0.283099000000000
    0.807082000000000   0.262692000000000   0.278898000000000
    0.812239000000000   0.266786000000000   0.274661000000000
    0.817341000000000   0.270954000000000   0.270390000000000
    0.822386000000000   0.275197000000000   0.266085000000000
    0.827372000000000   0.279517000000000   0.261750000000000
    0.832299000000000   0.283913000000000   0.257383000000000
    0.837165000000000   0.288385000000000   0.252988000000000
    0.841969000000000   0.292933000000000   0.248564000000000
    0.846709000000000   0.297559000000000   0.244113000000000
    0.851384000000000   0.302260000000000   0.239636000000000
    0.855992000000000   0.307038000000000   0.235133000000000
    0.860533000000000   0.311892000000000   0.230606000000000
    0.865006000000000   0.316822000000000   0.226055000000000
    0.869409000000000   0.321827000000000   0.221482000000000
    0.873741000000000   0.326906000000000   0.216886000000000
    0.878001000000000   0.332060000000000   0.212268000000000
    0.882188000000000   0.337287000000000   0.207628000000000
    0.886302000000000   0.342586000000000   0.202968000000000
    0.890341000000000   0.347957000000000   0.198286000000000
    0.894305000000000   0.353399000000000   0.193584000000000
    0.898192000000000   0.358911000000000   0.188860000000000
    0.902003000000000   0.364492000000000   0.184116000000000
    0.905735000000000   0.370140000000000   0.179350000000000
    0.909390000000000   0.375856000000000   0.174563000000000
    0.912966000000000   0.381636000000000   0.169755000000000
    0.916462000000000   0.387481000000000   0.164924000000000
    0.919879000000000   0.393389000000000   0.160070000000000
    0.923215000000000   0.399359000000000   0.155193000000000
    0.926470000000000   0.405389000000000   0.150292000000000
    0.929644000000000   0.411479000000000   0.145367000000000
    0.932737000000000   0.417627000000000   0.140417000000000
    0.935747000000000   0.423831000000000   0.135440000000000
    0.938675000000000   0.430091000000000   0.130438000000000
    0.941521000000000   0.436405000000000   0.125409000000000
    0.944285000000000   0.442772000000000   0.120354000000000
    0.946965000000000   0.449191000000000   0.115272000000000
    0.949562000000000   0.455660000000000   0.110164000000000
    0.952075000000000   0.462178000000000   0.105031000000000
    0.954506000000000   0.468744000000000   0.099874000000000
    0.956852000000000   0.475356000000000   0.094695000000000
    0.959114000000000   0.482014000000000   0.089499000000000
    0.961293000000000   0.488716000000000   0.084289000000000
    0.963387000000000   0.495462000000000   0.079073000000000
    0.965397000000000   0.502249000000000   0.073859000000000
    0.967322000000000   0.509078000000000   0.068659000000000
    0.969163000000000   0.515946000000000   0.063488000000000
    0.970919000000000   0.522853000000000   0.058367000000000
    0.972590000000000   0.529798000000000   0.053324000000000
    0.974176000000000   0.536780000000000   0.048392000000000
    0.975677000000000   0.543798000000000   0.043618000000000
    0.977092000000000   0.550850000000000   0.039050000000000
    0.978422000000000   0.557937000000000   0.034931000000000
    0.979666000000000   0.565057000000000   0.031409000000000
    0.980824000000000   0.572209000000000   0.028508000000000
    0.981895000000000   0.579392000000000   0.026250000000000
    0.982881000000000   0.586606000000000   0.024661000000000
    0.983779000000000   0.593849000000000   0.023770000000000
    0.984591000000000   0.601122000000000   0.023606000000000
    0.985315000000000   0.608422000000000   0.024202000000000
    0.985952000000000   0.615750000000000   0.025592000000000
    0.986502000000000   0.623105000000000   0.027814000000000
    0.986964000000000   0.630485000000000   0.030908000000000
    0.987337000000000   0.637890000000000   0.034916000000000
    0.987622000000000   0.645320000000000   0.039886000000000
    0.987819000000000   0.652773000000000   0.045581000000000
    0.987926000000000   0.660250000000000   0.051750000000000
    0.987945000000000   0.667748000000000   0.058329000000000
    0.987874000000000   0.675267000000000   0.065257000000000
    0.987714000000000   0.682807000000000   0.072489000000000
    0.987464000000000   0.690366000000000   0.079990000000000
    0.987124000000000   0.697944000000000   0.087731000000000
    0.986694000000000   0.705540000000000   0.095694000000000
    0.986175000000000   0.713153000000000   0.103863000000000
    0.985566000000000   0.720782000000000   0.112229000000000
    0.984865000000000   0.728427000000000   0.120785000000000
    0.984075000000000   0.736087000000000   0.129527000000000
    0.983196000000000   0.743758000000000   0.138453000000000
    0.982228000000000   0.751442000000000   0.147565000000000
    0.981173000000000   0.759135000000000   0.156863000000000
    0.980032000000000   0.766837000000000   0.166353000000000
    0.978806000000000   0.774545000000000   0.176037000000000
    0.977497000000000   0.782258000000000   0.185923000000000
    0.976108000000000   0.789974000000000   0.196018000000000
    0.974638000000000   0.797692000000000   0.206332000000000
    0.973088000000000   0.805409000000000   0.216877000000000
    0.971468000000000   0.813122000000000   0.227658000000000
    0.969783000000000   0.820825000000000   0.238686000000000
    0.968041000000000   0.828515000000000   0.249972000000000
    0.966243000000000   0.836191000000000   0.261534000000000
    0.964394000000000   0.843848000000000   0.273391000000000
    0.962517000000000   0.851476000000000   0.285546000000000
    0.960626000000000   0.859069000000000   0.298010000000000
    0.958720000000000   0.866624000000000   0.310820000000000
    0.956834000000000   0.874129000000000   0.323974000000000
    0.954997000000000   0.881569000000000   0.337475000000000
    0.953215000000000   0.888942000000000   0.351369000000000
    0.951546000000000   0.896226000000000   0.365627000000000
    0.950018000000000   0.903409000000000   0.380271000000000
    0.948683000000000   0.910473000000000   0.395289000000000
    0.947594000000000   0.917399000000000   0.410665000000000
    0.946809000000000   0.924168000000000   0.426373000000000
    0.946392000000000   0.930761000000000   0.442367000000000
    0.946403000000000   0.937159000000000   0.458592000000000
    0.946903000000000   0.943348000000000   0.474970000000000
    0.947937000000000   0.949318000000000   0.491426000000000
    0.949545000000000   0.955063000000000   0.507860000000000
    0.951740000000000   0.960587000000000   0.524203000000000
    0.954529000000000   0.965896000000000   0.540361000000000
    0.957896000000000   0.971003000000000   0.556275000000000
    0.961812000000000   0.975924000000000   0.571925000000000
    0.966249000000000   0.980678000000000   0.587206000000000
    0.971162000000000   0.985282000000000   0.602154000000000
    0.976511000000000   0.989753000000000   0.616760000000000
    0.982257000000000   0.994109000000000   0.631017000000000
    0.988362000000000   0.998364000000000   0.644924000000000
    ];
 
 P = size(values,1);
 map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');
