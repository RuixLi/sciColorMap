function map = tempo(m)
%   TEMPO colormap from cmocean by Thyng, K. M et al.
%   tempo(M) returns an M-by-3 matrix containing a colormap. 
%   written by Ruix.Li in Jan, 2021
%   updated by Ruix.Li in Jul, 2024

% USAGE:
% colormap(tempo(128))
% colormap tempo

if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

values = [
9.985763296811461798e-01 9.632965417140263442e-01 9.577895036430327247e-01
9.934918422996558141e-01 9.594375624216472387e-01 9.516983192548315040e-01
9.883417388454437402e-01 9.556282921109976458e-01 9.455836323325411685e-01
9.831050718338244510e-01 9.518727670560837018e-01 9.394860306213083101e-01
9.777785730890226068e-01 9.481687534308861354e-01 9.334364948680430318e-01
9.723870692594612786e-01 9.445024597948724621e-01 9.274670258562995873e-01
9.669573847273637002e-01 9.408624710997687268e-01 9.215795307640300971e-01
9.615066616129493982e-01 9.372434217616608665e-01 9.157560566822336989e-01
9.560531046363628382e-01 9.336385357088663461e-01 9.099886803187530182e-01
9.506035559047821826e-01 9.300461763422669392e-01 9.042646579991682199e-01
9.451563753217823161e-01 9.264682865796181055e-01 8.985697730985615639e-01
9.397124373542273812e-01 9.229047657151164819e-01 8.928998260600508052e-01
9.342716413123769437e-01 9.193556495997508016e-01 8.872531405900644375e-01
9.288308811012930821e-01 9.158223472192428272e-01 8.816263177427966502e-01
9.233851804191220980e-01 9.123071100087158936e-01 8.760148319228351355e-01
9.179365336943248188e-01 9.088084827838653901e-01 8.704232606428425889e-01
9.124832972967743538e-01 9.053269113370198129e-01 8.648517190341429295e-01
9.070218374764418279e-01 9.018638497314315217e-01 8.592980228813623667e-01
9.015509263802756745e-01 8.984195016922670307e-01 8.537628451897162352e-01
8.960718329388820402e-01 8.949928217018373600e-01 8.482495190363266158e-01
8.905836610629007666e-01 8.915838848352710677e-01 8.427587078675609078e-01
8.850836254841629724e-01 8.881937049832523412e-01 8.372889893254339411e-01
8.795708463666609411e-01 8.848223352046364898e-01 8.318410153090299852e-01
8.740469282893844616e-01 8.814686228402575097e-01 8.264178662740626624e-01
8.685112937853189941e-01 8.781325055194139084e-01 8.210202040569095638e-01
8.629633327895804840e-01 8.748139384163003962e-01 8.156486084917724533e-01
8.573988637074910768e-01 8.715145671024431273e-01 8.103003320898716222e-01
8.518212329614019973e-01 8.682324447773152043e-01 8.049797193798620132e-01
8.462299834685677036e-01 8.649674562084326279e-01 7.996873827745283325e-01
8.406246724049463159e-01 8.617194786977677712e-01 7.944239257301034529e-01
8.350048677827189847e-01 8.584883831868801440e-01 7.891899443847590900e-01
8.293671160911614271e-01 8.552754073408689317e-01 7.839836146965878383e-01
8.237138279483190439e-01 8.520791051833870311e-01 7.788079287668441264e-01
8.180448941186928558e-01 8.488991950022984900e-01 7.736637090147417961e-01
8.123599093553812711e-01 8.457355276105180675e-01 7.685515296147656938e-01
8.066584706735069332e-01 8.425879497641356464e-01 7.634719632765348818e-01
8.009401766621723207e-01 8.394563042330350777e-01 7.584255820860429376e-01
7.952028972601549173e-01 8.363411716110775718e-01 7.534118252377455249e-01
7.894471633387081244e-01 8.332419707110174656e-01 7.484319716624078245e-01
7.836734962813408645e-01 8.301581353160575327e-01 7.434872090029538416e-01
7.778815003305534770e-01 8.270894921786368092e-01 7.385781042557458820e-01
7.720707796269933310e-01 8.240358639329949941e-01 7.337052258319404219e-01
7.662409381414175824e-01 8.209970689783633313e-01 7.288691437189614986e-01
7.603915796412942241e-01 8.179729213555224643e-01 7.240704295566047222e-01
7.545223076817887398e-01 8.149632306197714948e-01 7.193096566367255251e-01
7.486327256130643759e-01 8.119678017125729896e-01 7.145873998348200029e-01
7.427219014782563411e-01 8.089866453573647531e-01 7.099039891607071828e-01
7.367891737192681090e-01 8.060196536672460388e-01 7.052599184573171698e-01
7.308350860228653989e-01 8.030662448375227580e-01 7.006562091939169123e-01
7.248592428796667431e-01 8.001262050844080154e-01 6.960934321026465144e-01
7.188612485448663270e-01 7.971993154607720511e-01 6.915721584188375681e-01
7.128407070658809852e-01 7.942853517324697243e-01 6.870929595632513376e-01
7.067972223051004477e-01 7.913840842570615264e-01 6.826564067967675342e-01
7.007303979576740005e-01 7.884952778644843674e-01 6.782630708517513041e-01
6.946398375648411561e-01 7.856186917391158042e-01 6.739135215439332471e-01
6.885251445237092760e-01 7.827540793025653532e-01 6.696083273682165160e-01
6.823859220949484161e-01 7.799011880964143995e-01 6.653480550814426797e-01
6.762217734101813038e-01 7.770597596640953508e-01 6.611332692747456941e-01
6.700323014813579503e-01 7.742295294309987641e-01 6.569645319377305226e-01
6.638171092147175933e-01 7.714102265818907345e-01 6.528424020163275943e-01
6.575757994324034073e-01 7.686015739346664377e-01 6.487674349657708284e-01
6.513079749051275957e-01 7.658032878094622742e-01 6.447401822997557153e-01
6.450132383997043695e-01 7.630150778921287458e-01 6.407611911364364810e-01
6.386911927456534466e-01 7.602366470910791874e-01 6.368310037415121361e-01
6.323414409254812796e-01 7.574676913865331374e-01 6.329501570682624090e-01
6.259635861936422296e-01 7.547078996712067722e-01 6.291191822939783407e-01
6.195560972423146406e-01 7.519573115237726535e-01 6.253384926911926822e-01
6.131191206125891080e-01 7.492154188267443615e-01 6.216087050224498034e-01
6.066526905401021796e-01 7.464817491552263595e-01 6.179303860708607044e-01
6.001564124519274124e-01 7.437559595200373685e-01 6.143040456187923715e-01
5.936298933201957784e-01 7.410376988478269977e-01 6.107301851240671819e-01
5.870727421002424062e-01 7.383266077479672118e-01 6.072092971993915400e-01
5.804845702488933279e-01 7.356223182652517067e-01 6.037418650719156288e-01
5.738649923321349489e-01 7.329244536181049874e-01 6.003283620189617809e-01
5.672131712764029166e-01 7.302327570205698892e-01 5.969692609600730782e-01
5.605265661533928023e-01 7.275474322700724583e-01 5.936651120515976654e-01
5.538072551957783363e-01 7.248673679611095100e-01 5.904163410524770894e-01
5.470548736207613283e-01 7.221921468817737999e-01 5.872233804977959881e-01
5.402690647877386176e-01 7.195213413684249382e-01 5.840866494502513495e-01
5.334494816269396145e-01 7.168545129510710545e-01 5.810065526719623286e-01
5.265932673521412921e-01 7.141918646847531527e-01 5.779837442967735717e-01
5.197010257328686933e-01 7.115326679134365007e-01 5.750185876848199484e-01
5.127738759690677606e-01 7.088760718122417703e-01 5.721113127309581659e-01
5.058115298480653221e-01 7.062215879970826782e-01 5.692622613027222833e-01
4.988124547076915882e-01 7.035690215604037956e-01 5.664719533702552434e-01
4.917741270603506742e-01 7.009183842407572529e-01 5.637411222277634026e-01
4.846997162615552246e-01 6.982683108816961637e-01 5.610695620964348818e-01
4.775890398856753039e-01 6.956182556045346077e-01 5.584575291026864230e-01
4.704389351347622594e-01 6.929683367461523247e-01 5.559058726658481220e-01
4.632498634530364812e-01 6.903178139102768007e-01 5.534147775766539157e-01
4.560240745098563253e-01 6.876655632831355502e-01 5.509839689679422170e-01
4.487598229028739172e-01 6.850113432670585922e-01 5.486140038956078824e-01
4.414547339722453279e-01 6.823550079810395408e-01 5.463056567639269501e-01
4.341129901223799714e-01 6.796950319734580415e-01 5.440580596655568701e-01
4.267325988888523436e-01 6.770311866202418649e-01 5.418718349209995511e-01
4.193119538935562440e-01 6.743631277083362852e-01 5.397475699351562684e-01
4.118554481683104340e-01 6.716893377862352965e-01 5.376841277217632165e-01
4.043593499172888350e-01 6.690098785171258999e-01 5.356826761355167887e-01
3.968261890078971788e-01 6.663236061846555813e-01 5.337425455110953454e-01
3.892580517875900981e-01 6.636294950347043642e-01 5.318631054022345817e-01
3.816510562742471135e-01 6.609275747235534570e-01 5.300456830101799577e-01
3.740119682194762429e-01 6.582160193662682790e-01 5.282880419647097980e-01
3.663368289249827603e-01 6.554948605761221625e-01 5.265915743478537525e-01
3.586308928051362699e-01 6.527625972609284455e-01 5.249544352005411918e-01
3.508936232465371674e-01 6.500187029053001719e-01 5.233768303957324619e-01
3.431277348645550562e-01 6.472621506436356809e-01 5.218577640245062321e-01
3.353355552299603914e-01 6.444920106677175520e-01 5.203963563323180663e-01
3.275188103490194735e-01 6.417074699067215615e-01 5.189919719540163623e-01
3.196814435511296515e-01 6.389074409416231060e-01 5.176430585409529384e-01
3.118254758119217707e-01 6.360911463304157465e-01 5.163488722475468862e-01
3.039555214161791530e-01 6.332575133378499643e-01 5.151075596956975478e-01
2.960748324121407205e-01 6.304057046767445049e-01 5.139178767894679867e-01
2.881881143962810587e-01 6.275347641630057982e-01 5.127779478270290126e-01
2.803003746086680792e-01 6.246437759477415641e-01 5.116857725517640620e-01
2.724162323640093031e-01 6.217319406932720893e-01 5.106395912364674050e-01
2.645425291505308918e-01 6.187983086880044503e-01 5.096365792929340444e-01
2.566840197606024554e-01 6.158422311486778655e-01 5.086750547256451149e-01
2.488489441844971561e-01 6.128628192186393875e-01 5.077515718650474907e-01
2.410430130087069522e-01 6.098595200479223211e-01 5.068641518721540562e-01
2.332749143253212143e-01 6.068316286127126702e-01 5.060092633925864503e-01
2.255521696872271886e-01 6.037786523436265984e-01 5.051841613954050070e-01
2.178835011739876371e-01 6.007001216855215597e-01 5.043855354959408954e-01
2.102776619158149840e-01 5.975956842983582984e-01 5.036102222376415138e-01
2.027443124327554802e-01 5.944650539898058694e-01 5.028546409645925364e-01
1.952924636272905801e-01 5.913080959200207598e-01 5.021159025525618880e-01
1.879334378838529440e-01 5.881246912104457492e-01 5.013896313522919757e-01
1.806761031013389140e-01 5.849149331180006905e-01 5.006736479698321585e-01
1.735328783097749850e-01 5.816789154432452369e-01 4.999631315071642601e-01
1.665133003434038084e-01 5.784169089899582339e-01 4.992561455145328453e-01
1.596300036906863895e-01 5.751292412901443107e-01 4.985481743532478860e-01
1.528937099908951325e-01 5.718163393279495077e-01 4.978371217540351057e-01
1.463171276735238113e-01 5.684787369209851615e-01 4.971190242696297834e-01
1.399119531735926458e-01 5.651170059000043544e-01 4.963918396953513335e-01
1.336912106530599997e-01 5.617318570854707982e-01 4.956519172255148820e-01
1.276672732366210816e-01 5.583239554235875923e-01 4.948978636889357907e-01
1.218535592637135234e-01 5.548942058020517321e-01 4.941256571865651481e-01
1.162631754482068569e-01 5.514432364311973034e-01 4.933355557142476422e-01
1.109091719419828259e-01 5.479722539284174188e-01 4.925220286879308795e-01
1.058058868411170528e-01 5.444817357603629615e-01 4.916873206428047927e-01
1.009651127375016111e-01 5.409730397620680087e-01 4.908260102866368046e-01
9.640117372078826907e-02 5.374467824904106683e-01 4.899392661237967350e-01
9.212706115366336990e-02 5.339038791645212001e-01 4.890257976801760109e-01
8.815110303261089464e-02 5.303457163263245455e-01 4.880817131293228583e-01
8.448832972524200624e-02 5.267726392289812098e-01 4.871097239159773440e-01
8.114572394888117102e-02 5.231858403590214923e-01 4.861073630469811557e-01
7.812721320542403980e-02 5.195865216476734938e-01 4.850725749743695636e-01
7.544312997722565917e-02 5.159750173542567708e-01 4.840076729265158639e-01
7.309574065371191032e-02 5.123522156200341904e-01 4.829119931483520367e-01
7.107372065756567547e-02 5.087198306495862576e-01 4.817814896929000779e-01
6.938287907938911481e-02 5.050778255979795350e-01 4.806197953737798012e-01
6.801610562745827315e-02 5.014269919387287500e-01 4.794267081520149909e-01
6.696293828126623215e-02 4.977680989992983585e-01 4.782021118153178540e-01
6.619782080433814220e-02 4.941027658684106760e-01 4.769429100625798834e-01
6.571558023976076246e-02 4.904308747270616498e-01 4.756523204648347991e-01
6.549820807888259711e-02 4.867530881918184504e-01 4.743305399824718216e-01
6.552566064603559948e-02 4.830700650743400826e-01 4.729777438223161101e-01
6.577673858968982601e-02 4.793824370720338179e-01 4.715941633832017588e-01
6.622677049492370349e-02 4.756910136151853430e-01 4.701794827815656830e-01
6.685019795786503738e-02 4.719966397538147285e-01 4.687333314519904204e-01
6.763272639280798471e-02 4.682993582933911436e-01 4.672575858662252890e-01
6.855374817251533304e-02 4.645996843636931994e-01 4.657526519729214276e-01
6.959365457471067273e-02 4.608981063279830592e-01 4.642189680611767399e-01
7.073403782879061907e-02 4.571950861446216208e-01 4.626570010388615928e-01
7.195781915786156335e-02 4.534910598140922677e-01 4.610672429543411499e-01
7.324931366840245484e-02 4.497864378980456768e-01 4.594502077591564038e-01
7.459424408415230023e-02 4.460816060979165276e-01 4.578064283072901808e-01
7.597971511267428979e-02 4.423769258816079852e-01 4.561364535850265800e-01
7.739415915996109008e-02 4.386727351476746306e-01 4.544408461640829233e-01
7.882726258105521300e-02 4.349693489173894201e-01 4.527201798696426915e-01
8.026987997778653461e-02 4.312670600459782566e-01 4.509750376540915817e-01
8.171394242970148047e-02 4.275661399451892164e-01 4.492060096666721791e-01
8.315236408743081897e-02 4.238668393102046350e-01 4.474136915088433031e-01
8.457895032121595658e-02 4.201693888446985103e-01 4.455986826648858368e-01
8.598830961259482097e-02 4.164739999785817548e-01 4.437615850971945997e-01
8.737577058920215078e-02 4.127808655736769361e-01 4.419030019956885491e-01
8.873730500447504776e-02 4.090901606132017476e-01 4.400235366709063789e-01
9.006945702453716951e-02 4.054020428715323643e-01 4.381237915805220595e-01
9.136927887187012987e-02 4.017166535612498035e-01 4.362043674792987491e-01
9.263427266200571775e-02 3.980341179549674036e-01 4.342658626828024837e-01
9.386233813144639893e-02 3.943545459798681874e-01 4.323088724355508838e-01
9.505172587236093706e-02 3.906780327832828914e-01 4.303339883746660766e-01
9.620003933222870396e-02 3.870047637840662302e-01 4.283416262899890081e-01
9.729997123759509536e-02 3.833354963232004087e-01 4.263312615677605777e-01
9.835741884413440328e-02 3.796695548525758634e-01 4.243046936775203282e-01
9.937169919107982641e-02 3.760069784468507703e-01 4.222625006231348066e-01
1.003423119365809690e-01 3.723477936835040136e-01 4.202052548968338574e-01
1.012689167529539358e-01 3.686920150348446112e-01 4.181335233490640069e-01
1.021513134274243950e-01 3.650396452261166491e-01 4.160478671051655586e-01
1.029884320307208612e-01 3.613907991323849767e-01 4.139486582680417803e-01
1.037719209811681642e-01 3.577465259466254266e-01 4.118348877541359032e-01
1.045112201334900126e-01 3.541056562885774861e-01 4.097088092956981398e-01
1.052065591856250482e-01 3.504681464569319171e-01 4.075709632165070984e-01
1.058582376509708545e-01 3.468339423292918222e-01 4.054218838433404359e-01
1.064666158592602885e-01 3.432029795356145718e-01 4.032620996037361571e-01
1.070239159802940931e-01 3.395763147211236510e-01 4.010905648833596460e-01
1.075355258379605550e-01 3.359532282299735328e-01 3.989087127976621017e-01
1.080052802278752000e-01 3.323331728550899533e-01 3.967176863054378000e-01
1.084337294201929702e-01 3.287160421828903556e-01 3.945179917556369542e-01
1.088202096165073185e-01 3.251019032868823211e-01 3.923098843692563453e-01
1.091556968975302966e-01 3.214920812428978536e-01 3.900919340676701208e-01
1.094518269158459012e-01 3.178848431435130073e-01 3.878667847148202785e-01
1.097092559883022234e-01 3.142800415550652815e-01 3.856349205402823110e-01
1.099286556573810802e-01 3.106775192369479188e-01 3.833968205472055302e-01
1.100986315611906241e-01 3.070790351009552999e-01 3.811504545068737926e-01
1.102317288825286901e-01 3.034825829921489193e-01 3.788986922133656954e-01
1.103290785873510815e-01 2.998879083652261635e-01 3.766420819050353419e-01
1.103893448894039397e-01 2.962951553198432397e-01 3.743806401368951486e-01
1.104047114339987423e-01 2.927055780381122019e-01 3.721129484539063559e-01
1.103867349279119559e-01 2.891171759115234718e-01 3.698417464033080804e-01
1.103361572207214036e-01 2.855297163446686715e-01 3.675674754730824945e-01
1.102460152182262176e-01 2.819443225282238785e-01 3.652888319764409086e-01
1.101198294511886444e-01 2.783603021914852760e-01 3.630068099573608986e-01
1.099635342633853707e-01 2.747764822051754763e-01 3.607229892872333421e-01
1.097748910210358808e-01 2.711931376089152246e-01 3.584370856671010852e-01
1.095478763802813504e-01 2.676112773022403801e-01 3.561478615212890775e-01
1.092932808921200649e-01 2.640287615628073015e-01 3.538580573547516761e-01
1.090116287119651528e-01 2.604453159192556266e-01 3.515680214913912693e-01
1.086913329090623825e-01 2.568630402753477870e-01 3.492750549670107785e-01
1.083460004297124302e-01 2.532791299120676354e-01 3.469826761312421182e-01
1.079763885418836000e-01 2.496932209057829977e-01 3.446912766824791197e-01
1.075713140889580088e-01 2.461073946949010050e-01 3.423980926413837667e-01
1.071428862568302165e-01 2.425189920877232619e-01 3.401063918909076889e-01
1.066927192498384747e-01 2.389274243968986799e-01 3.378167764830257158e-01
1.062093640276061124e-01 2.353348932541681759e-01 3.355262248019345583e-01
1.057055066316897329e-01 2.317384538919968207e-01 3.332383062494437276e-01
1.051814556007013568e-01 2.281377376539149293e-01 3.309532535866355762e-01
1.046272664909374817e-01 2.245346804307608024e-01 3.286682704446855507e-01
1.040556247342821483e-01 2.209261472703716311e-01 3.263871052200472134e-01
1.034637486817424901e-01 2.173124203806320875e-01 3.241090419310820314e-01
1.028468845169810686e-01 2.136942776676366007e-01 3.218326666201724029e-01
1.022150454689789434e-01 2.100689913462399083e-01 3.195611195376787395e-01
1.015620277820400430e-01 2.064376400065636719e-01 3.172925125709148420e-01
1.008900241588315538e-01 2.027992883367119026e-01 3.150275553737127421e-01
1.002054858430543316e-01 1.991518634625495388e-01 3.127684262427183892e-01
9.949803783218733044e-02 1.954975058870322413e-01 3.105116763778897337e-01
9.877832247043097369e-02 1.918329889556127654e-01 3.082609202522414993e-01
9.804493118338306057e-02 1.881580898967480098e-01 3.060157402408537064e-01
9.729328810023782359e-02 1.844734436312414905e-01 3.037745103921251633e-01
9.653316478613682694e-02 1.807757562460599599e-01 3.015407883893915231e-01
9.575619444438937533e-02 1.770666290075273708e-01 2.993115284087380368e-01
9.496899572502048859e-02 1.733434725855039771e-01 2.970892156823352059e-01
9.417284157369981701e-02 1.696050767223750977e-01 2.948744162588470830e-01
9.336173420340779239e-02 1.658523274558137695e-01 2.926648040593683997e-01
9.254607948203208423e-02 1.620811665705463311e-01 2.904645825457518593e-01
9.171714479257989105e-02 1.582931942356169963e-01 2.882702798507874586e-01
9.088231952195491292e-02 1.544850037627045203e-01 2.860850125083750362e-01
9.004099984169053328e-02 1.506555099870153513e-01 2.839086654207542693e-01
8.919012906146844832e-02 1.468043594975814992e-01 2.817400195447572475e-01
8.833858505105957049e-02 1.429270910011002649e-01 2.795831537842536352e-01
8.747533041314431435e-02 1.390258052165279645e-01 2.774332852121961235e-01
8.661249189260347703e-02 1.350944971238551839e-01 2.752961432065319514e-01
8.574385298640457842e-02 1.311333174761502018e-01 2.731691209373900975e-01
8.487294239495335457e-02 1.271387529060027943e-01 2.710541708402016137e-01
8.400180885962132971e-02 1.231074880892656653e-01 2.689526699064171411e-01
8.312616532498406929e-02 1.190383729463048712e-01 2.668628892216621806e-01
8.225559928700268419e-02 1.149244079727295142e-01 2.647901677800857390e-01
];

values = flipud(values);
P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');
