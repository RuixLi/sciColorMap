function map = lajolla(m)
%   LAJOLLA a scientific colour map 6 by FabioCrameri et al.
%   lajolla(M) returns an M-by-3 matrix containing a colormap. 
%   written by Ruix.Li in Jan, 2021
%   updated by Ruix.Li in Jul, 2024

% USAGE:
% colormap(lajolla(128))
% colormap lajolla

if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

values = [
   0.999831313178933   0.999744586463853   0.799907259781102
   0.999528585894065   0.997249111925352   0.792917517799622
   0.999207518804827   0.994756733416422   0.785930819102321
   0.998868692046269   0.992264834955537   0.778939940079727
   0.998512787334073   0.989767948728423   0.771953999512647
   0.998140591205414   0.987267870177684   0.764967417742721
   0.997752949466759   0.984762752331506   0.757976832531703
   0.997350363350441   0.982251966306812   0.750989141072645
   0.996933092016426   0.979734207501677   0.743990988588173
   0.996501431739951   0.977208351125106   0.736994954092506
   0.996055799543353   0.974672980042964   0.729998215083614
   0.995596563369573   0.972134088388860   0.722988658514902
   0.995123910852710   0.969576858015411   0.715989309237897
   0.994638042169943   0.967011220221280   0.708976208157318
   0.994139560686463   0.964425814501403   0.701947800827581
   0.993628770141919   0.961826421086778   0.694923798092129
   0.993104050066125   0.959212459023565   0.687893926506486
   0.992564079304520   0.956573592137222   0.680846090282486
   0.992010701579759   0.953913666487978   0.673800574928697
   0.991445259498832   0.951226129819589   0.666735801973474
   0.990866921356982   0.948508278983812   0.659669578574413
   0.990275810154643   0.945762082065545   0.652582968549942
   0.989672360321760   0.942983777833153   0.645487384102393
   0.989052800284101   0.940165943043339   0.638383128654616
   0.988416568526631   0.937305934914805   0.631264891549580
   0.987770351635787   0.934398567055655   0.624131310905197
   0.987109988390420   0.931449425655199   0.616981025729872
   0.986430043907963   0.928445083142960   0.609814132072304
   0.985734363425034   0.925389683383438   0.602638377510480
   0.985024053202256   0.922275548005655   0.595447879032487
   0.984295173767607   0.919090325538214   0.588240996776468
   0.983544144539604   0.915842161198334   0.581031344963474
   0.982780055590674   0.912527713631761   0.573807713611313
   0.981996083110432   0.909132371975536   0.566580619566147
   0.981188177128286   0.905664522267274   0.559340112895496
   0.980361831113563   0.902106172339815   0.552105755626544
   0.979514525032223   0.898463354390066   0.544863881828410
   0.978639721999084   0.894738217618138   0.537636384151258
   0.977749248238457   0.890912185850738   0.530410527762978
   0.976832884287329   0.886997063724222   0.523209051282094
   0.975891631649576   0.882982280764456   0.516015587369586
   0.974928778994575   0.878872724052358   0.508877523812562
   0.973942970155361   0.874664817537296   0.501763715452809
   0.972935832228287   0.870355181827699   0.494698197430346
   0.971900458318752   0.865954463155617   0.487690523089825
   0.970841115520443   0.861451219696376   0.480734721257540
   0.969761158298586   0.856853370122308   0.473868522444214
   0.968660952712954   0.852168775158588   0.467097673137749
   0.967540494545275   0.847384180459292   0.460403401496937
   0.966394231160156   0.842526099349941   0.453838006547536
   0.965232150169052   0.837582474867663   0.447382633952271
   0.964054325304356   0.832559657122360   0.441065331351478
   0.962863505017362   0.827471292997074   0.434900590557462
   0.961653263991341   0.822324026075567   0.428873651950260
   0.960438572372340   0.817113803913071   0.423008507096595
   0.959208160821978   0.811858827014555   0.417337219496899
   0.957973362387082   0.806563797079164   0.411826212345849
   0.956726870429227   0.801227740417987   0.406514955410623
   0.955483409080244   0.795868066461653   0.401394374238441
   0.954232740160920   0.790490586348255   0.396470206219652
   0.952984887738119   0.785102880059244   0.391761065574470
   0.951734379297433   0.779702687752199   0.387244417223452
   0.950492693459984   0.774304503183443   0.382955131450832
   0.949252387911040   0.768914934036700   0.378860255465172
   0.948021664451520   0.763539153075449   0.374976941106624
   0.946797332875789   0.758183463460649   0.371294769148771
   0.945583488147315   0.752838349605372   0.367823438968686
   0.944379373811841   0.747533259689549   0.364549211072273
   0.943185735213661   0.742247239748251   0.361471998795251
   0.942003049175668   0.736993493680346   0.358569785389367
   0.940831862809832   0.731775153081024   0.355870869254490
   0.939675353314368   0.726590468693982   0.353323136836000
   0.938528848508697   0.721439664033459   0.350959582955560
   0.937397374695730   0.716337254253284   0.348738214025358
   0.936279268832407   0.711263782466718   0.346674039513769
   0.935167268198405   0.706227285181560   0.344749641685351
   0.934069984980690   0.701224127957991   0.342972943210447
   0.932985963946536   0.696264334914634   0.341304148571538
   0.931914700324334   0.691330044326666   0.339766675288723
   0.930856784588438   0.686437595880139   0.338315988523434
   0.929803597577208   0.681569817488875   0.336993276210533
   0.928759740697705   0.676745564919537   0.335754783709570
   0.927726774252369   0.671938490496264   0.334612814316622
   0.926703515384117   0.667161038446305   0.333537020332516
   0.925689327031178   0.662415225502981   0.332545235325399
   0.924676099276449   0.657687855555223   0.331596260251593
   0.923677852486312   0.652970570592574   0.330727730445531
   0.922678727024780   0.648286314179684   0.329930846218193
   0.921685265381786   0.643617467394014   0.329172717671365
   0.920690766932604   0.638968380643124   0.328448077916345
   0.919707518026048   0.634335951508342   0.327768815803513
   0.918721196679038   0.629703514331816   0.327129797198758
   0.917745193216198   0.625091705235646   0.326525409910892
   0.916761819850755   0.620494069673764   0.325952595524842
   0.915774491677175   0.615891204780215   0.325408146460249
   0.914795543596098   0.611306427677167   0.324888722946187
   0.913813919063810   0.606722379773132   0.324390745458049
   0.912823868009097   0.602139200238689   0.323912165483058
   0.911831832799307   0.597565120535152   0.323452950191623
   0.910836552054202   0.592993626589864   0.323009845156069
   0.909834098826430   0.588408260184555   0.322573836033603
   0.908821273285643   0.583836477972524   0.322139787087679
   0.907806424296611   0.579264854679695   0.321715290952130
   0.906774658644558   0.574674047079693   0.321308360914220
   0.905735057002018   0.570089953572039   0.320914030944889
   0.904677318482314   0.565497710016131   0.320521431243714
   0.903607256034700   0.560903886740432   0.320125189302188
   0.902519882241099   0.556296019612197   0.319728891870050
   0.901410619895618   0.551690829189618   0.319336316427544
   0.900281644439673   0.547063446952805   0.318947084517889
   0.899128649403242   0.542430784491400   0.318559040232619
   0.897944827996709   0.537786048737512   0.318170497428117
   0.896735642210361   0.533118735902019   0.317780535718237
   0.895488441217518   0.528446346112072   0.317388437653596
   0.894205781258867   0.523753379249988   0.316994402315991
   0.892880010762963   0.519048701772769   0.316599082617554
   0.891510688058096   0.514321768109780   0.316200632390743
   0.890091397937831   0.509569472538682   0.315792602620258
   0.888621926870235   0.504805973495712   0.315369582527620
   0.887088498460957   0.500007369538575   0.314937624364951
   0.885494432853602   0.495204776358461   0.314507087119806
   0.883832005145356   0.490371527931858   0.314076063628057
   0.882089687052961   0.485504571671142   0.313631623910526
   0.880268115511393   0.480621777681877   0.313166597581295
   0.878362751608454   0.475721376122330   0.312685187772477
   0.876360057887157   0.470784288655667   0.312193318795394
   0.874260231254819   0.465813208969836   0.311697667596105
   0.872057100139379   0.460829282240978   0.311197664960958
   0.869731563426451   0.455821714694315   0.310676282164700
   0.867291602668551   0.450788393566890   0.310125654700741
   0.864725319315008   0.445721030419994   0.309558932701365
   0.862028818370696   0.440642742144489   0.308972367508484
   0.859184101825974   0.435556258761890   0.308347910399429
   0.856198342108483   0.430435791691036   0.307703507905330
   0.853059013074925   0.425309680518591   0.307054662635047
   0.849765582029144   0.420166441864821   0.306384487054382
   0.846302372916107   0.415022779658226   0.305674894840494
   0.842682347674789   0.409885902011682   0.304924258209527
   0.838883013067693   0.404734814115201   0.304148147430231
   0.834915952308419   0.399603486596505   0.303343452154354
   0.830772570551171   0.394499533554078   0.302508505621791
   0.826450362836149   0.389415237308709   0.301643581363366
   0.821953961375572   0.384355602051197   0.300746198289465
   0.817275020541875   0.379340645837178   0.299820606579785
   0.812424632691277   0.374377641280563   0.298849995228229
   0.807405841458074   0.369452480321638   0.297832348797091
   0.802212373933842   0.364594674850249   0.296799595543412
   0.796857158167917   0.359813122243761   0.295701773141627
   0.791345700239609   0.355117310164457   0.294574987006503
   0.785683211397916   0.350488068047593   0.293413207570060
   0.779868833649846   0.345934960858672   0.292217641195428
   0.773917751568557   0.341509353447127   0.290977704622967
   0.767838715825753   0.337176341128960   0.289693628718438
   0.761639954339135   0.332954477597017   0.288365904919865
   0.755331531822530   0.328832399861891   0.286993499053127
   0.748910382741788   0.324812886258764   0.285587350284577
   0.742403621035234   0.320939744639082   0.284148483370574
   0.735800868262905   0.317162815187525   0.282680356965901
   0.729129247157238   0.313514504432756   0.281126959404761
   0.722382988009622   0.309983328916610   0.279577908570291
   0.715588458777038   0.306560883515091   0.277960037539952
   0.708732247861397   0.303234621823056   0.276314276441763
   0.701821242518655   0.300045120333506   0.274597442558689
   0.694882302433920   0.296965341039592   0.272861823013885
   0.687912794830670   0.293959702353863   0.271084638858903
   0.680906207468804   0.291082664914147   0.269266239601109
   0.673888902298530   0.288275530439251   0.267363127396013
   0.666845732141380   0.285556531951923   0.265463081657986
   0.659797442223006   0.282950264264680   0.263515054925407
   0.652728756769378   0.280374693094087   0.261494461873553
   0.645659674973572   0.277907172513165   0.259453148532345
   0.638588508133487   0.275495674619713   0.257342159499618
   0.631513942227517   0.273124976937973   0.255206395911807
   0.624438060109975   0.270822723004194   0.253003157833670
   0.617360228342134   0.268553292084816   0.250755570695973
   0.610287256207418   0.266331601422916   0.248484803230232
   0.603221850423420   0.264149483289664   0.246122328115919
   0.596156423915539   0.261986787064994   0.243733659362270
   0.589092986925766   0.259865647698676   0.241320344951260
   0.582044337614914   0.257746691083541   0.238831070333020
   0.574999592688677   0.255667918085251   0.236326635237649
   0.567965035638934   0.253603610062004   0.233731607655334
   0.560933613220855   0.251554001159620   0.231137927155062
   0.553913987196683   0.249483390317017   0.228486866405205
   0.546904088350347   0.247453687394077   0.225780378872368
   0.539894090147104   0.245395628076041   0.223035962132376
   0.532905788689867   0.243359719522019   0.220254465435305
   0.525921115772807   0.241340209538351   0.217418270071763
   0.518950159351376   0.239300774966297   0.214547760754340
   0.511976601906954   0.237280284122025   0.211665211074170
   0.505025165619866   0.235232578267925   0.208714777259090
   0.498094694373920   0.233151818968379   0.205757039615250
   0.491166144254162   0.231121849016814   0.202743768303651
   0.484231796496144   0.229060068211299   0.199703106786355
   0.477332126228515   0.226998642300867   0.196690059463450
   0.470445944716028   0.224903132921155   0.193599064473185
   0.463562149569203   0.222858590629290   0.190481309744137
   0.456701108641807   0.220787888879338   0.187383089519172
   0.449857694025727   0.218684282271945   0.184220455505685
   0.443028400261074   0.216604217991980   0.181049316330467
   0.436212960793401   0.214489902828467   0.177922537524493
   0.429411772646895   0.212396692667108   0.174725169558208
   0.422622164574396   0.210282242672749   0.171513187046896
   0.415865125876609   0.208175972275214   0.168311629295532
   0.409121178877409   0.206083065812426   0.165093753624213
   0.402387152157629   0.203967947289910   0.161932000637194
   0.395693282489567   0.201817889679383   0.158717036967918
   0.389004674213671   0.199695582093306   0.155501482440122
   0.382326210910412   0.197596594266384   0.152278328148467
   0.375682359804223   0.195474317589770   0.149098277514217
   0.369062746563594   0.193367068517508   0.145929728464068
   0.362454677631692   0.191237725220758   0.142740244906891
   0.355878824541251   0.189132936905046   0.139537120029723
   0.349311895587013   0.187021136070666   0.136394428848458
   0.342780244095440   0.184917444196632   0.133291611374039
   0.336248090807295   0.182782485262778   0.130207534025068
   0.329770768031679   0.180679009904821   0.127045644510188
   0.323292867390274   0.178607634721616   0.123971786501644
   0.316844119099324   0.176475375452270   0.120914890207398
   0.310431057723900   0.174410924756520   0.117925494905623
   0.304013089954847   0.172305168263038   0.114879704139703
   0.297641729376832   0.170234125633460   0.111956563386038
   0.291300566686703   0.168139867742118   0.108996213739432
   0.284955192987653   0.166066638095021   0.106100692348042
   0.278670013240827   0.164035506964572   0.103209049683736
   0.272374016375878   0.161968938887563   0.100317811128153
   0.266142571011694   0.159860412264720   0.097519589180052
   0.259912826521716   0.157832660458379   0.094763909297919
   0.253709489974808   0.155804072341480   0.092000776267012
   0.247533869107337   0.153731798684644   0.089259692482174
   0.241378598202500   0.151697723575377   0.086566602844302
   0.235262743601355   0.149700964131412   0.083951414420989
   0.229142269958107   0.147662981905033   0.081329292518053
   0.223073904260451   0.145658654955239   0.078687194793628
   0.217021014724519   0.143615928088764   0.076120394597673
   0.211004810555551   0.141605144841632   0.073581417031967
   0.205032057888369   0.139542604243905   0.070836849686971
   0.199088769393282   0.137585841741756   0.068083588096292
   0.193222389724627   0.135533075094219   0.065213383930787
   0.187395139624321   0.133540713787362   0.062322868657432
   0.181557761977877   0.131529616841722   0.059336900615289
   0.175797417183565   0.129510077823440   0.056198008869503
   0.170113967025850   0.127477484985136   0.052899180176906
   0.164453839696532   0.125481387269410   0.049639514690553
   0.158832498122694   0.123420614094307   0.046062103508119
   0.153228763598589   0.121394305245067   0.042481719249141
   0.147732202750470   0.119395180657771   0.038691024038885
   0.142250702333279   0.117348127194184   0.034740253524465
   0.136816115317305   0.115318578116873   0.030783747342827
   0.131462860985398   0.113321009791265   0.026942530506912
   0.126157425423377   0.111254970959053   0.023109829773713
   0.120855421544251   0.109197696421761   0.019283161499210
   0.115699086944025   0.107133589737170   0.015460303402725
   0.110583871909491   0.104991741935462   0.011622044738100
   0.105487211755901   0.102956193020147   0.007623843145237
   0.100226644246888   0.100908457190777   0.003791345409753
   ];

values = flipud(values);
P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');
