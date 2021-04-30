function map = buda(m)
%   BUDA a scientific colour map 6 by FabioCrameri et al.
%   buda(M) returns an M-by-3 matrix containing a colormap. 
%   written by Ruix.Li in Jan, 2021

% USAGE:
% colormap(buda(128))
% colormap buda

if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

values = [
   0.700151013186464   0.002744521371480   0.700612383503220
   0.700191438818500   0.010832587254906   0.697186184684569
   0.700225944402480   0.019196458575806   0.693784111724388
   0.700255042439362   0.027497169697863   0.690410321631844
   0.700279268492005   0.036129024029558   0.687067010023712
   0.700299178456893   0.044534585802717   0.683749886779686
   0.700315347392448   0.052200874533126   0.680466828737477
   0.700328370456209   0.059479067513228   0.677233894866722
   0.700338866405628   0.066137694297342   0.674023568775505
   0.700347483832883   0.072500448039125   0.670864562481575
   0.700354910521187   0.078556938320413   0.667746525454801
   0.700361885877581   0.084489178455497   0.664664973675436
   0.700369216265748   0.090118138587469   0.661646651096821
   0.700377792975552   0.095601576922107   0.658661977721888
   0.700388612287836   0.100918911780053   0.655739860700404
   0.700402796830400   0.106179573868724   0.652854262868175
   0.700421617391120   0.111272387283884   0.650034736756693
   0.700446513878155   0.116281084331147   0.647259934459058
   0.700479113827622   0.121141221409355   0.644531822209735
   0.700521246988776   0.126029246323975   0.641864059260454
   0.700574953496438   0.130794442371027   0.639246354308035
   0.700642483160206   0.135455048065142   0.636683654720671
   0.700726282610226   0.140078640086337   0.634168788975324
   0.700828965956693   0.144685046978661   0.631700610991304
   0.700953268424405   0.149192641399738   0.629284496197522
   0.701102108315513   0.153640610538232   0.626923308573509
   0.701278667160200   0.158084250772271   0.624614530651854
   0.701486414219002   0.162466064304015   0.622348584301474
   0.701729236013893   0.166801045871164   0.620146630591122
   0.702011586906612   0.171075869286048   0.617978544576132
   0.702337102712320   0.175335526215928   0.615866676926295
   0.702707257306773   0.179554849227689   0.613799718718198
   0.703121751242629   0.183740840163929   0.611790488340757
   0.703582255653892   0.187936079125258   0.609823326849925
   0.704093357496668   0.192033407623717   0.607911309246802
   0.704657760040289   0.196154358019587   0.606028705770948
   0.705274924636784   0.200200351172075   0.604212967675734
   0.705946456272764   0.204297579529091   0.602424435471941
   0.706670830165867   0.208310413140675   0.600685100409032
   0.707439240584263   0.212331691837457   0.598991764105848
   0.708264997091587   0.216333438531640   0.597336717817960
   0.709139656262237   0.220301829915574   0.595714428347909
   0.710053324802135   0.224219253100150   0.594134184914224
   0.711014686956381   0.228185934226232   0.592594773260327
   0.712010812748173   0.232099178623117   0.591072898020287
   0.713043839638589   0.235997254041744   0.589585257221429
   0.714112590724609   0.239863945309831   0.588130552982848
   0.715213806268153   0.243717366438516   0.586706353819360
   0.716339227050802   0.247586235318438   0.585309184549829
   0.717485369752209   0.251421394990197   0.583920022805588
   0.718641768594158   0.255233036215672   0.582556859365352
   0.719825026602796   0.259027869916906   0.581215872305585
   0.721011590204534   0.262797678888435   0.579897055024555
   0.722212253045731   0.266557404777711   0.578579637793857
   0.723422608115277   0.270315052937394   0.577284199362132
   0.724641427821812   0.274033740025158   0.576009287003681
   0.725860234129537   0.277746759026875   0.574722877432514
   0.727075222627729   0.281433198722397   0.573468375957142
   0.728294155219721   0.285106719308220   0.572216148629248
   0.729515557211823   0.288786035359460   0.570966521284320
   0.730730727402971   0.292428197148301   0.569729230016591
   0.731948326759305   0.296062572843625   0.568502381542882
   0.733158997202603   0.299688600443831   0.567287262937437
   0.734367621076589   0.303279959101782   0.566066965111619
   0.735568496796280   0.306882707978077   0.564853436290993
   0.736769355091338   0.310470724794144   0.563660870016477
   0.737963012982431   0.314024304717739   0.562463539271871
   0.739164204255183   0.317573639298476   0.561260544660038
   0.740347437528896   0.321114921907681   0.560077301612477
   0.741526796883478   0.324631880861722   0.558884653775052
   0.742713554302306   0.328153445889729   0.557710880760522
   0.743886254281325   0.331653631813577   0.556532370985910
   0.745056320183380   0.335166345437211   0.555357439678304
   0.746224728801056   0.338633014670199   0.554195812914167
   0.747393029244771   0.342110582684746   0.553026415125559
   0.748551516280258   0.345564696434943   0.551874232972246
   0.749704072946127   0.349024258210669   0.550713631917140
   0.750867574400834   0.352465070051989   0.549561116287911
   0.752015301353903   0.355908338093074   0.548415587054473
   0.753158270262494   0.359324454250786   0.547260020019887
   0.754310569366993   0.362742887101461   0.546123714773392
   0.755451333849762   0.366161869382935   0.544976597649746
   0.756588818886290   0.369555853010634   0.543837116102113
   0.757726440947796   0.372949034919816   0.542705135580038
   0.758860241264006   0.376350147363227   0.541560976790931
   0.759989936517236   0.379722343564458   0.540436824122962
   0.761121554850295   0.383103422470155   0.539305192121034
   0.762245941736055   0.386458838432252   0.538188780502719
   0.763371458607029   0.389823312204860   0.537064897595265
   0.764496937787110   0.393183243455329   0.535932615691830
   0.765620836947352   0.396533236582388   0.534816301052826
   0.766734662701837   0.399877563665850   0.533691450613081
   0.767849882461927   0.403228326394264   0.532586353185930
   0.768965108992218   0.406562922791357   0.531468270837627
   0.770080395027956   0.409898348717861   0.530356675485380
   0.771196648403570   0.413224883754405   0.529251782955260
   0.772302295162056   0.416544744647525   0.528136118052753
   0.773408061971554   0.419864445774082   0.527035563272476
   0.774513933269549   0.423170861023909   0.525927584645035
   0.775619790486386   0.426486792111321   0.524822293268453
   0.776726889831171   0.429799972645301   0.523722869741670
   0.777825926289850   0.433104863378092   0.522621276895807
   0.778920707439699   0.436412650530498   0.521521238115657
   0.780015711117315   0.439712990037653   0.520426777218191
   0.781110053543242   0.443015523378900   0.519342066711059
   0.782201629911325   0.446308423921652   0.518255757835602
   0.783285303928256   0.449611337199324   0.517171476239382
   0.784373315706480   0.452911208301395   0.516076604898320
   0.785449510708815   0.456202107126668   0.515006706266625
   0.786526378549360   0.459504676287572   0.513939445008477
   0.787590422080254   0.462791811640144   0.512864672457494
   0.788656952396293   0.466095924150253   0.511800006840681
   0.789713175529609   0.469411009674433   0.510743809963939
   0.790762519269440   0.472703388549380   0.509696466705426
   0.791806843755582   0.476015310143443   0.508661191779537
   0.792845399421227   0.479325149275140   0.507622318639014
   0.793876567807578   0.482635484611650   0.506588941793323
   0.794891576731808   0.485948973798488   0.505565080696060
   0.795900142759089   0.489268322395458   0.504571903601671
   0.796900844893156   0.492593581678486   0.503560486515749
   0.797893527911341   0.495924177687750   0.502571066246310
   0.798878640386456   0.499260524320831   0.501598554434494
   0.799853069281348   0.502601293516993   0.500622001234146
   0.800811366805841   0.505941670744057   0.499654106257125
   0.801762660375399   0.509300886703354   0.498714894614343
   0.802705532392462   0.512651888760832   0.497777702165082
   0.803641172005240   0.516004775037181   0.496831519884852
   0.804568353060173   0.519378041904114   0.495906581858622
   0.805480760463111   0.522744861353787   0.495000226718480
   0.806395309345431   0.526119591767508   0.494091534321570
   0.807296122841365   0.529496086491685   0.493182633644587
   0.808190190418876   0.532872946977499   0.492293571637260
   0.809081443419072   0.536254162320741   0.491418801200414
   0.809960459113135   0.539632789481346   0.490532317390270
   0.810838933440160   0.543029396431987   0.489643438809204
   0.811715601235634   0.546423037274834   0.488776501585397
   0.812582728066150   0.549810565477045   0.487915623059787
   0.813449438601782   0.553198935414387   0.487045680491540
   0.814314191868903   0.556600671981841   0.486177646642571
   0.815177870589752   0.560003214865697   0.485315027778154
   0.816041561378172   0.563405363759068   0.484455984777868
   0.816898107550460   0.566805981559958   0.483599960751350
   0.817752441249335   0.570200394233703   0.482748274475827
   0.818607883698267   0.573610501467508   0.481897762732943
   0.819463597083431   0.577019176245417   0.481034735256568
   0.820319957986687   0.580425930428299   0.480189281698687
   0.821177446156115   0.583831506451895   0.479336620354104
   0.822035969822589   0.587241081479623   0.478479061088267
   0.822888462673851   0.590654243234618   0.477626044385462
   0.823741264998074   0.594071127520723   0.476773681811010
   0.824596100036678   0.597489071180013   0.475924058256247
   0.825451763643807   0.600903014106865   0.475075195709202
   0.826310132575702   0.604329670254765   0.474213479790242
   0.827167159819731   0.607751532049467   0.473350279932075
   0.828020378782450   0.611173119725681   0.472504476600292
   0.828883052826960   0.614590400966780   0.471654766363941
   0.829740203569857   0.618022243193107   0.470795730707129
   0.830597541208017   0.621450515527074   0.469942944461760
   0.831458830555010   0.624886097972952   0.469086581770917
   0.832315380852915   0.628324965446607   0.468218456441812
   0.833173875377996   0.631759392382997   0.467368245299930
   0.834038448150471   0.635196823375233   0.466506476769535
   0.834897044663937   0.638641005280465   0.465638471982444
   0.835758543097143   0.642087709263600   0.464790485294026
   0.836621658064499   0.645531562757683   0.463930919171207
   0.837487803419455   0.648989656800177   0.463055373481399
   0.838348285077971   0.652439275627913   0.462200778922139
   0.839214362754337   0.655902376024582   0.461341711654507
   0.840083095643251   0.659357315925085   0.460468917576839
   0.840947110765205   0.662826380677549   0.459614069034002
   0.841815304737863   0.666286495897870   0.458748550412360
   0.842683950566224   0.669763614586003   0.457878421372628
   0.843547646521497   0.673236182784910   0.457011973817185
   0.844421151443106   0.676714389357141   0.456145220526422
   0.845290879749427   0.680187332072815   0.455281917149285
   0.846160351501909   0.683675092423245   0.454415171274446
   0.847032959459111   0.687165683933348   0.453535946927835
   0.847907120756279   0.690653921646195   0.452675257067408
   0.848784223201939   0.694148788406654   0.451800449755914
   0.849661567635039   0.697651941732423   0.450923899775968
   0.850534034728342   0.701158480853038   0.450049093608949
   0.851409914819018   0.704666667086334   0.449178221472403
   0.852295919927583   0.708180443451543   0.448296444491102
   0.853169752127195   0.711699367827177   0.447413239522151
   0.854049400115098   0.715219618316359   0.446541206796087
   0.854935836816614   0.718741712566437   0.445655264762778
   0.855818274785718   0.722269205513671   0.444788188493999
   0.856699298262828   0.725811245614990   0.443905091669831
   0.857583686297297   0.729347051194798   0.443020981661150
   0.858469960777855   0.732893095482216   0.442142283369983
   0.859359141397915   0.736435846156087   0.441246727241694
   0.860249966163106   0.739996536829189   0.440360593547745
   0.861135895845704   0.743552207273477   0.439474237813609
   0.862031994553083   0.747114547885020   0.438583844309574
   0.862924198313494   0.750684080583577   0.437706007519634
   0.863818309356783   0.754256636480351   0.436810408701618
   0.864708436591920   0.757832514155919   0.435919125898904
   0.865604131552675   0.761413246162834   0.435028242723042
   0.866502002803864   0.765005591294353   0.434119850178122
   0.867400358721010   0.768592551779725   0.433228097966045
   0.868306607824850   0.772194835042824   0.432343245470013
   0.869205589482613   0.775798455458561   0.431443049173180
   0.870103287131918   0.779408259403252   0.430537597761616
   0.871011744010603   0.783023084615552   0.429635385255963
   0.871922988660660   0.786650866564842   0.428732897009018
   0.872830655874579   0.790272606634989   0.427834484597939
   0.873742200210816   0.793911380676118   0.426929182928222
   0.874658462333725   0.797544713795591   0.426015001495068
   0.875581546227583   0.801192289798274   0.425118988950551
   0.876503707526342   0.804847017867378   0.424204755588912
   0.877438170941505   0.808509743935902   0.423294029085726
   0.878380656041148   0.812176979525468   0.422385733897974
   0.879330256496157   0.815858585084080   0.421480452630261
   0.880295011442233   0.819540844562096   0.420577873928526
   0.881278229171928   0.823242708564973   0.419683066337808
   0.882275899825967   0.826956231530337   0.418775070334603
   0.883301564037488   0.830680301290385   0.417880252614111
   0.884356084698022   0.834420221974354   0.416994539497475
   0.885442275704706   0.838174250811778   0.416101355083259
   0.886572620257563   0.841950316456782   0.415221802526958
   0.887744250375706   0.845740931305864   0.414352451051135
   0.888980585623504   0.849563495451310   0.413496843242602
   0.890274881263394   0.853401143028864   0.412657879785334
   0.891646579034337   0.857273929282672   0.411816986178964
   0.893098498090496   0.861175666241086   0.411007731241049
   0.894649097572288   0.865109107238093   0.410220673251575
   0.896296084517507   0.869084293879444   0.409442807231431
   0.898054955358838   0.873088381595888   0.408694646246037
   0.899940537240462   0.877132226169565   0.407975532240908
   0.901952440292702   0.881224130273248   0.407286200659150
   0.904103177651022   0.885354754065237   0.406631197696170
   0.906403812407172   0.889528959046851   0.406012690828740
   0.908850272067583   0.893747249180813   0.405420453492652
   0.911455309357940   0.898011616722504   0.404859124444351
   0.914219930108594   0.902321593786128   0.404345617987568
   0.917142247169875   0.906674844930219   0.403875819322628
   0.920216784475329   0.911069631922526   0.403438872076790
   0.923456970724700   0.915502258001119   0.403034170537186
   0.926840665494990   0.919981736697742   0.402664909915835
   0.930380282123106   0.924494473710662   0.402332590281795
   0.934052255055690   0.929044127014897   0.402037403782097
   0.937865507248695   0.933626294873014   0.401778141438598
   0.941799182793136   0.938243960894763   0.401552232633382
   0.945848104862810   0.942888259071230   0.401355258745917
   0.950004252232385   0.947555336200118   0.401183238064115
   0.954258294205353   0.952243457663056   0.401032963200344
   0.958598805317057   0.956957037948758   0.400901678547602
   0.963014176228260   0.961688113489183   0.400786876344931
   0.967501504450074   0.966439469822270   0.400686227821429
   0.972046104678356   0.971205457476981   0.400597624630681
   0.976640888027635   0.975983393224608   0.400518933863726
   0.981285683410791   0.980778721261431   0.400448016608471
   0.985967144331056   0.985583651609398   0.400382802995697
   0.990679623218528   0.990397047436713   0.400321340856881
   0.995417677808852   0.995217947898793   0.400261826008346
   1.000000000000000   1.000000000000000   0.400202619867322
   ];

P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');
