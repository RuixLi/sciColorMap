function map = romao(m)
%   ROMAO a scientific colour map 6 by FabioCrameri et al.
%   romao(M) returns an M-by-3 matrix containing a colormap. 
%   written by Ruix.Li in Jan, 2021

% USAGE:
% colormap(romao(128))
% colormap romao

if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

values = [
   0.451373874666344   0.223458709918417   0.341870799965347
   0.454179360348631   0.222444238181896   0.336099154085492
   0.456964522293290   0.221583601522335   0.330427574767728
   0.459745820461505   0.220901628723239   0.324833950490025
   0.462508758064081   0.220345584246605   0.319346410115490
   0.465268902882544   0.219935742212323   0.313937787735644
   0.468025885957327   0.219680462176042   0.308619385744648
   0.470782101675561   0.219577010232285   0.303366719804345
   0.473519265726396   0.219623882296950   0.298217773730138
   0.476275351516132   0.219821369676404   0.293158159723772
   0.479024037655900   0.220171739281479   0.288183645222632
   0.481778917991479   0.220672622310684   0.283304066374102
   0.484529958777781   0.221302490266283   0.278502330945246
   0.487307940272339   0.222079022168182   0.273790013989858
   0.490078715420987   0.223040829891889   0.269166882473323
   0.492862402960593   0.224106403739438   0.264606084330161
   0.495670101286812   0.225363081959894   0.260159132801034
   0.498500152446305   0.226770027021745   0.255786059646747
   0.501335001941077   0.228325296954820   0.251528332963304
   0.504194621529517   0.229991675316682   0.247331299054301
   0.507065485813229   0.231880162811605   0.243219851754147
   0.509967957283227   0.233865786495777   0.239229391966027
   0.512896328092730   0.236049899338159   0.235333622211638
   0.515844200691218   0.238350103812623   0.231514395283152
   0.518841911844592   0.240822744063106   0.227787051712419
   0.521841594014727   0.243452879217144   0.224136432772643
   0.524893663308195   0.246246143457201   0.220646541394071
   0.527968800607021   0.249200338712028   0.217202932692713
   0.531082226579023   0.252306972415458   0.213873324035087
   0.534225004042677   0.255562970990884   0.210643302596944
   0.537416087128431   0.258987187558678   0.207528215704541
   0.540629536634246   0.262548749065279   0.204524225580655
   0.543885785011561   0.266280741940019   0.201584797958454
   0.547179477632665   0.270168713383466   0.198791034553722
   0.550514704176014   0.274192207684136   0.196131589415874
   0.553885070570000   0.278385578013960   0.193558966407381
   0.557305138435603   0.282734966244876   0.191089012591656
   0.560748189184959   0.287202953655440   0.188770257728305
   0.564244205388050   0.291860446076231   0.186548236026034
   0.567772256409437   0.296649431718830   0.184461368100510
   0.571339570837261   0.301567625153758   0.182482555580965
   0.574947604121397   0.306664119697607   0.180654732703645
   0.578598490374044   0.311863872594390   0.178977069127580
   0.582283853643684   0.317240057098572   0.177429746258176
   0.586016684749346   0.322749176207850   0.175966004432052
   0.589770863822602   0.328375791700060   0.174730419134997
   0.593577700999903   0.334152073780716   0.173584611867736
   0.597416214243559   0.340050829625957   0.172607717909133
   0.601285208641269   0.346064887320984   0.171791071025377
   0.605194293470733   0.352226126134867   0.171138826959943
   0.609145959669658   0.358506600927232   0.170651800166170
   0.613114035857341   0.364912305455452   0.170336591384614
   0.617133052637388   0.371431700016994   0.170196472439744
   0.621178318171685   0.378080042605128   0.170234247234680
   0.625256504059482   0.384832778446796   0.170455845768374
   0.629366636452217   0.391712740108326   0.170869499271695
   0.633515835346981   0.398691613665266   0.171480298326735
   0.637689980159213   0.405792734518284   0.172294554159029
   0.641896920664036   0.412993418585885   0.173321703105273
   0.646134780383632   0.420289686311832   0.174579478314021
   0.650407311180225   0.427708212561650   0.175999703086171
   0.654703467818621   0.435221980575150   0.177735557010528
   0.659035946889454   0.442831047015092   0.179618724627445
   0.663406637099197   0.450539198448129   0.181754102446029
   0.667797548648492   0.458344002465640   0.184158836750910
   0.672217015566362   0.466246012883158   0.186796533030099
   0.676668408258122   0.474245565161998   0.189683438940085
   0.681139874535213   0.482334320479612   0.192825591742429
   0.685655046143849   0.490513841767484   0.196242123648254
   0.690186594384193   0.498775252471610   0.199871510867948
   0.694744892675193   0.507118789397771   0.203840956138971
   0.699331501905026   0.515543645103155   0.208029517171897
   0.703943799444585   0.524059133087570   0.212508158076656
   0.708579269984744   0.532648108513652   0.217264666524243
   0.713224624872026   0.541295847833706   0.222288019544613
   0.717895431724119   0.550028502871964   0.227609997896430
   0.722570748796306   0.558811919993631   0.233180387444497
   0.727265419081437   0.567667619090913   0.239068447335720
   0.731967541248220   0.576577030681021   0.245212743131405
   0.736664298555207   0.585526069643822   0.251676901995350
   0.741359662805532   0.594511436020260   0.258373361840245
   0.746052087220832   0.603541903546018   0.265369422976630
   0.750732069701935   0.612586769528166   0.272630200433631
   0.755384587614178   0.621656419517036   0.280165366529755
   0.760006263757777   0.630745190728584   0.287961592854003
   0.764598505483821   0.639821073721959   0.296021336037040
   0.769139354792402   0.648887200787926   0.304326413337260
   0.773630823537473   0.657933450106205   0.312873175907669
   0.778063513547249   0.666936481733587   0.321653420457785
   0.782418581813062   0.675904521343495   0.330656287648344
   0.786694732227427   0.684810128489108   0.339884297681032
   0.790867299784473   0.693646016409684   0.349291770054687
   0.794941521481620   0.702400073437457   0.358880664372762
   0.798900565836588   0.711061100145098   0.368666669049243
   0.802726573519531   0.719607586643789   0.378587855374621
   0.806421837392876   0.728027838654578   0.388664144382940
   0.809957948959543   0.736314422916465   0.398853564398904
   0.813335087755896   0.744457903338183   0.409164193430441
   0.816545380548486   0.752435764718076   0.419567858951260
   0.819560666625244   0.760245519552163   0.430039098836235
   0.822393521450306   0.767865276063038   0.440565806003784
   0.825010079986655   0.775295031452425   0.451145663965975
   0.827418421018033   0.782520628401372   0.461742071444187
   0.829603946670109   0.789531252519213   0.472345570182984
   0.831554219295550   0.796313459043071   0.482931135053489
   0.833257639481874   0.802869455465357   0.493494380923210
   0.834717114403167   0.809192173379218   0.504023492380164
   0.835918029929048   0.815262906488043   0.514486370013576
   0.836858347266738   0.821087478257886   0.524870639264994
   0.837531128778779   0.826661529119534   0.535169715855738
   0.837927118839844   0.831977751365753   0.545374994032705
   0.838045221966123   0.837030911276995   0.555455033735427
   0.837882936293263   0.841823729780831   0.565416871642003
   0.837435056914653   0.846348410663529   0.575250092483893
   0.836696087380010   0.850614289469828   0.584934816832682
   0.835669002972180   0.854618221503177   0.594456624750839
   0.834353490535377   0.858352935600571   0.603824386219959
   0.832739089581336   0.861831063982447   0.613005156127519
   0.830839167846666   0.865038816819590   0.622016425843028
   0.828642731538215   0.867996924203077   0.630853456571219
   0.826152892768053   0.870684531383809   0.639486225446115
   0.823373162261091   0.873124380817085   0.647921662722662
   0.820303020497873   0.875308817916059   0.656170514312734
   0.816950287511810   0.877237852405660   0.664201605910950
   0.813306179117797   0.878921936074126   0.672030503729423
   0.809388073505355   0.880358839111006   0.679643693683488
   0.805181036769787   0.881555395472714   0.687052624961635
   0.800705574185539   0.882503842327117   0.694237023551654
   0.795954169868156   0.883220241607769   0.701214908251366
   0.790938967228141   0.883701664425688   0.707969553764922
   0.785663543557488   0.883947567911921   0.714502396819216
   0.780124483164676   0.883962678457858   0.720818601436446
   0.774334980954907   0.883749615377753   0.726915148488682
   0.768301175004912   0.883308806570642   0.732792359433071
   0.762029328671279   0.882643966460550   0.738440802199266
   0.755527453057546   0.881765285430976   0.743873080043017
   0.748792220144272   0.880661428552674   0.749079012440101
   0.741840965356767   0.879342742529825   0.754073625069429
   0.734682894357330   0.877813133624419   0.758841121047384
   0.727312863441527   0.876068132799499   0.763388471906452
   0.719755631317401   0.874112813429136   0.767718637026564
   0.712006342546529   0.871954902056298   0.771837313268078
   0.704081577782785   0.869583615867475   0.775731891495379
   0.695993443584167   0.867011995424546   0.779414086112450
   0.687740864015902   0.864246650830921   0.782881614147271
   0.679338916223792   0.861273380595539   0.786142515905421
   0.670810434880605   0.858108754869297   0.789186969637589
   0.662149748232041   0.854755325633921   0.792019374606443
   0.653361916155353   0.851203814713701   0.794649494627047
   0.644478885262367   0.847472811831077   0.797069294434750
   0.635504666488871   0.843556888739428   0.799295501370479
   0.626447893689940   0.839467366433451   0.801310053016532
   0.617322502450550   0.835194656725739   0.803130313344750
   0.608144583302166   0.830753930976100   0.804757473440179
   0.598912079049943   0.826141947771841   0.806189740252853
   0.589645823625313   0.821370001503925   0.807430732012099
   0.580374168916684   0.816440699297387   0.808484484311782
   0.571082957955643   0.811354170520931   0.809354994679040
   0.561810966566339   0.806119714256311   0.810038301048296
   0.552546960507884   0.800741533576922   0.810547371809240
   0.543316929388907   0.795224874734709   0.810884868038541
   0.534124813438698   0.789578647801533   0.811050736129130
   0.524999428013783   0.783804943395580   0.811048292555418
   0.515929466404085   0.777906196846813   0.810881285352650
   0.506954571786799   0.771892376069495   0.810553867312021
   0.498077308149397   0.765770655919180   0.810073133673291
   0.489276115456163   0.759536271450397   0.809444130961946
   0.480607244286720   0.753210354558093   0.808662099820502
   0.472071584724821   0.746795099369177   0.807734787829787
   0.463654383215753   0.740290033149660   0.806671035699975
   0.455394360620785   0.733700555344614   0.805461755286857
   0.447278927831037   0.727034217757005   0.804130158010569
   0.439336620501912   0.720298505384864   0.802660920754001
   0.431578202951411   0.713497220480941   0.801070340661509
   0.423976079052573   0.706637594458821   0.799360489839798
   0.416583190408008   0.699710836281273   0.797520584368183
   0.409379509987892   0.692746942531493   0.795570288684554
   0.402372226549308   0.685722634330432   0.793511482571788
   0.395597688518829   0.678654646779832   0.791329804435164
   0.389025947547197   0.671548907421512   0.789048297536624
   0.382671345108664   0.664406303318654   0.786656860318507
   0.376561947268742   0.657236459994041   0.784158256900166
   0.370659986717355   0.650026169816983   0.781553124321867
   0.365015647837445   0.642789072622142   0.778843970434607
   0.359614743574629   0.635524595313475   0.776036095741217
   0.354461287565346   0.628244359839952   0.773123354044123
   0.349553297832988   0.620935780018014   0.770112593567453
   0.344901326883875   0.613598608297483   0.766997646994436
   0.340512061483410   0.606253490531601   0.763781921201451
   0.336374073067214   0.598893330870484   0.760465353237028
   0.332528968979996   0.591513859140395   0.757040266028689
   0.328929781059665   0.584115416396951   0.753509660145864
   0.325586609567640   0.576713862276947   0.749871388160615
   0.322555381454544   0.569280400259959   0.746129043778338
   0.319776812327851   0.561855233623468   0.742275401628756
   0.317272157699419   0.554405968793409   0.738302384899763
   0.315046235440496   0.546948807512942   0.734220565025535
   0.313108881007278   0.539476832503370   0.730018305046634
   0.311440785101484   0.532009191399311   0.725694951314830
   0.310070855732192   0.524525177713516   0.721239405167334
   0.308965967544592   0.517042351424248   0.716672689241330
   0.308112336940385   0.509545895425653   0.711965501867179
   0.307547555961555   0.502053560012502   0.707131652484196
   0.307259929416605   0.494560989038369   0.702158431749028
   0.307233576761600   0.487065279796290   0.697055798010440
   0.307462786371071   0.479578053868202   0.691816310441179
   0.307949454806086   0.472097808158604   0.686432002036719
   0.308702141604560   0.464627860767528   0.680904292242408
   0.309676562883855   0.457161404215725   0.675245103659127
   0.310879432788649   0.449727668403919   0.669442622336179
   0.312279304553507   0.442318714422182   0.663499069128580
   0.313934178493022   0.434929665013691   0.657411933038372
   0.315778383249335   0.427576843437282   0.651183535962963
   0.317795101130803   0.420252876646362   0.644816597979884
   0.320009081017459   0.412992433182499   0.638326091996524
   0.322377217434100   0.405773540241357   0.631703689587523
   0.324885951894114   0.398606008638723   0.624954312346545
   0.327554052452446   0.391515785986681   0.618086400212870
   0.330352908645315   0.384483610145413   0.611109580693926
   0.333269985164695   0.377545274391828   0.604024263298843
   0.336267009070308   0.370682136446979   0.596835463446233
   0.339387468767615   0.363923271621352   0.589549109779472
   0.342566170556688   0.357279613238299   0.582191171510619
   0.345799649822960   0.350728401141292   0.574755567540208
   0.349116809506709   0.344276066847396   0.567267232355311
   0.352467121882867   0.337969510866426   0.559714218767342
   0.355865713303850   0.331794293615229   0.552119519996742
   0.359271969840537   0.325743398950863   0.544484280602014
   0.362710136498347   0.319862449027072   0.536835756417721
   0.366167015233560   0.314105968670308   0.529165473382393
   0.369610672934183   0.308515101151617   0.521480826456345
   0.373060656995484   0.303063401537953   0.513820682513332
   0.376517214154980   0.297795930124178   0.506154769037134
   0.379939132710443   0.292690609939453   0.498536936593279
   0.383360169511237   0.287752110458865   0.490940983659699
   0.386740348938660   0.283008570525411   0.483366122680233
   0.390111486026396   0.278417874447161   0.475862037746270
   0.393459722127679   0.274008885050451   0.468396556886403
   0.396771875248328   0.269784447881847   0.460998219358973
   0.400063898710988   0.265727786716959   0.453664865012163
   0.403325707082903   0.261850635310411   0.446403572587059
   0.406547401407363   0.258146094639151   0.439212822292539
   0.409741225849954   0.254657940706205   0.432119552139981
   0.412904844285311   0.251320539246937   0.425086919432954
   0.416022980699253   0.248165710882312   0.418134763347461
   0.419121635707897   0.245150449412963   0.411282639577915
   0.422176393041123   0.242351732349178   0.404511467765215
   0.425223742431519   0.239720066604175   0.397844499511447
   0.428226019855261   0.237275911059008   0.391261179875267
   0.431207037668524   0.234977234716524   0.384754587126966
   0.434145103406801   0.232820144377384   0.378356601826728
   0.437081744922473   0.230864081716431   0.372040424231240
   0.439978915888091   0.229065577831490   0.365831610973635
   0.442859610944077   0.227427919467051   0.359703036210830
   0.445705698969355   0.225956596013992   0.353661316294132
   0.448554651581068   0.224596141044977   0.347728374536178
   ];

P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');
