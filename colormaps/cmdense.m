function map = cmdense(m)
%   CMDENSE colormap from cmocean by Thyng, K. M et al.
%   cmdense(M) returns an M-by-3 matrix containing a colormap. 
%   written by Ruix.Li in Jan, 2021
%   updated by Ruix.Li in Jul, 2024

% USAGE:
% colormap(cmdense(128))
% colormap cmdense

if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

values = [
9.022021640633741679e-01 9.441797977915000750e-01 9.438027309131502562e-01
8.954445384876381642e-01 9.409578903665054561e-01 9.410648759794842944e-01
8.886855788874895579e-01 9.377403820634679921e-01 9.384098650760986926e-01
8.819275100483495722e-01 9.345262546442011375e-01 9.358372814047579702e-01
8.751724774625697645e-01 9.313145521613219735e-01 9.333465385891809296e-01
8.684225465562396273e-01 9.281043788756372370e-01 9.309368983040341439e-01
8.616797015669134252e-01 9.248948973050555855e-01 9.286074874996731454e-01
8.549458444869071361e-01 9.216853262599870034e-01 9.263573151615366319e-01
8.482227943572994144e-01 9.184749387758168737e-01 9.241852885114790750e-01
8.415122870990738857e-01 9.152630598938195083e-01 9.220902285443438595e-01
8.348159759916423672e-01 9.120490642716416740e-01 9.200708847923535494e-01
8.281354328507813944e-01 9.088323736256948004e-01 9.181259492188009741e-01
8.214721499137223049e-01 9.056124540224106401e-01 9.162540691578000551e-01
8.148275424063925465e-01 9.023888130447765832e-01 9.144538592359539031e-01
8.082029517444304645e-01 8.991609968660188024e-01 9.127239122325879750e-01
8.015996493038702875e-01 8.959285872646755022e-01 9.110628088561002480e-01
7.950188742001107478e-01 8.926911903474541443e-01 9.094690972400388818e-01
7.884617893745216044e-01 8.894484461080551796e-01 9.079413399350437786e-01
7.819294709222469608e-01 8.862000288332800846e-01 9.064781367807944745e-01
7.754229463217646723e-01 8.829456358148736195e-01 9.050781031537078469e-01
7.689431984424601740e-01 8.796849849240929720e-01 9.037398757679527828e-01
7.624911712284807574e-01 8.764178119047121296e-01 9.024621162700895427e-01
7.560677754202349554e-01 8.731438677954835859e-01 9.012435140344750018e-01
7.496738942657009686e-01 8.698629164913183054e-01 9.000827882281617898e-01
7.433103891809360597e-01 8.665747324492172332e-01 8.989786892140232410e-01
7.369781053261772463e-01 8.632790985421132657e-01 8.979299993594229701e-01
7.306778770702586634e-01 8.599758040613866283e-01 8.969355333152028154e-01
7.244105333220340892e-01 8.566646428667109570e-01 8.959941378263615031e-01
7.181769027125698424e-01 8.533454116802825506e-01 8.951046911317568355e-01
7.119778186163850942e-01 8.500179085211370111e-01 8.942661020057923738e-01
7.058142285268640403e-01 8.466819129479339345e-01 8.934771781429077242e-01
6.996868754737947116e-01 8.433372425635760061e-01 8.927370216147950677e-01
6.935966262281186845e-01 8.399836925869731408e-01 8.920446369253884900e-01
6.875443783072674453e-01 8.366210531289836050e-01 8.913990435590287698e-01
6.815310569542375463e-01 8.332491095447560614e-01 8.907992825434407624e-01
6.755576190661271019e-01 8.298676415986731003e-01 8.902444142113377090e-01
6.696250569512002260e-01 8.264764227239829175e-01 8.897335158509319664e-01
6.637344019158556430e-01 8.230752193711802223e-01 8.892656792634947571e-01
6.578867276821276366e-01 8.196637904396377738e-01 8.888400082431817673e-01
6.520831536351689994e-01 8.162418867874922102e-01 8.884556159917510465e-01
6.463248478988037338e-01 8.128092508153051954e-01 8.881116224784991742e-01
6.406130302355731443e-01 8.093656161195516008e-01 8.878071517537653445e-01
6.349489747657169891e-01 8.059107072125802906e-01 8.875413292226665973e-01
6.293340124974293737e-01 8.024442393062223289e-01 8.873132788842952312e-01
6.237695336583948258e-01 7.989659181568090629e-01 8.871221205404720145e-01
6.182569898160699129e-01 7.954754399699002221e-01 8.869669669772310971e-01
6.127978529026838483e-01 7.919724939438572697e-01 8.868470036964815062e-01
6.073937143892588209e-01 7.884567552174953642e-01 8.867613059311603152e-01
6.020462362204239692e-01 7.849278896215748924e-01 8.867089225926839680e-01
5.967571335484213035e-01 7.813855546115021644e-01 8.866889106706612456e-01
5.915281898823177009e-01 7.778293984625483937e-01 8.867003055015370006e-01
5.863612575196054388e-01 7.742590605302298590e-01 8.867421178165009188e-01
5.812582575983973321e-01 7.706741715732086107e-01 8.868133307743576443e-01
5.762211797340099917e-01 7.670743541409147381e-01 8.869128969829140896e-01
5.712520812007981785e-01 7.634592230284988901e-01 8.870397355132993988e-01
5.663530856178774497e-01 7.598283858019500014e-01 8.871927289126763094e-01
5.615263810949739920e-01 7.561814433965411419e-01 8.873707202219829338e-01
5.567742177930775638e-01 7.525179907919229416e-01 8.875725100066919060e-01
5.520989048532665144e-01 7.488376177673574663e-01 8.877968534100384446e-01
5.475028066465008614e-01 7.451399097406838923e-01 8.880424572398104566e-01
5.429883038774732107e-01 7.414244411965056347e-01 8.883081102246548344e-01
5.385578037806126872e-01 7.376907727350942023e-01 8.885926739767254778e-01
5.342139074650678054e-01 7.339384990781333551e-01 8.888943435724941944e-01
5.299591516928192636e-01 7.301671976158840005e-01 8.892116013883853975e-01
5.257960979209626018e-01 7.263764470411206986e-01 8.895428673545512366e-01
5.217273234975481344e-01 7.225658287807643632e-01 8.898864965652431014e-01
5.177554119038457747e-01 7.187349285333118898e-01 8.902407770595432979e-01
5.138829420298184347e-01 7.148833379130644650e-01 8.906039278005388748e-01
5.101124764807559719e-01 7.110106562012711295e-01 8.909740968830553998e-01
5.064465489258500597e-01 7.071164922032951994e-01 8.913493600019622987e-01
5.028876505140544850e-01 7.032004662097455228e-01 8.917277192147863296e-01
4.994382152582386714e-01 6.992621674331673809e-01 8.921074350832908229e-01
4.961006347215984325e-01 6.953012224940204877e-01 8.924864661543192579e-01
4.928771955532800786e-01 6.913173542206699773e-01 8.928621485317782547e-01
4.897700668589555772e-01 6.873102514205022828e-01 8.932321753875414050e-01
4.867812943786045676e-01 6.832796259123631311e-01 8.935941653626673364e-01
4.839127827295982009e-01 6.792252150037093594e-01 8.939456639464463672e-01
4.811662774244846452e-01 6.751467840099739659e-01 8.942841454160184167e-01
4.785433468471342322e-01 6.710441287994942661e-01 8.946070153685665716e-01
4.760453643890875663e-01 6.669170783452496032e-01 8.949116138746746607e-01
4.736736428294658352e-01 6.627653768113491717e-01 8.951957859716279664e-01
4.714290262412598742e-01 6.585890168305761350e-01 8.954562723025643045e-01
4.693121574935592011e-01 6.543879757664989860e-01 8.956900818434682110e-01
4.673234528945732769e-01 6.501622438680934035e-01 8.958943277799077398e-01
4.654630534005658737e-01 6.459118568983728270e-01 8.960660842179661856e-01
4.637308126788352580e-01 6.416368981971656282e-01 8.962023935259622043e-01
4.621262870085202645e-01 6.373375005637914592e-01 8.963002743257548754e-01
4.606487857322991153e-01 6.330138155630400387e-01 8.963568414436460241e-01
4.592973162762510886e-01 6.286660463835676005e-01 8.963691878774373567e-01
4.580703339287382492e-01 6.242945769689846047e-01 8.963339924500021150e-01
4.569661322748618804e-01 6.198997574323485971e-01 8.962482674873512023e-01
4.559826907629682125e-01 6.154819930493959923e-01 8.961090514006179175e-01
4.551176793504218554e-01 6.110417444047528956e-01 8.959134196000665407e-01
4.543684658154031886e-01 6.065795271800727972e-01 8.956584955889488331e-01
4.537321103072295414e-01 6.020959187639063348e-01 8.953414439077735931e-01
4.532053056792195167e-01 5.975915899334859338e-01 8.949594061016020730e-01
4.527845804849874312e-01 5.930672153918072897e-01 8.945097368602321630e-01
4.524662055084718859e-01 5.885235252040261766e-01 8.939898705469653262e-01
4.522462243009037208e-01 5.839612972830612314e-01 8.933973456284665104e-01
4.521204742039108271e-01 5.793813548677185787e-01 8.927298144348156939e-01
4.520846088132207119e-01 5.747845636677534342e-01 8.919850523005500298e-01
4.521340640278729839e-01 5.701718535137081378e-01 8.911609204213972735e-01
4.522636556547669495e-01 5.655443967339887079e-01 8.902550664458118712e-01
4.524690821672368579e-01 5.609029696513448959e-01 8.892660746141660688e-01
4.527455061379137002e-01 5.562485728577384325e-01 8.881923021329055645e-01
4.530880320659124716e-01 5.515822303923638703e-01 8.870322627966300555e-01
4.534917310405354729e-01 5.469049855617650335e-01 8.857846304506885593e-01
4.539516647179116515e-01 5.422178966900855768e-01 8.844482413776627583e-01
4.544629083695410077e-01 5.375220328430567740e-01 8.830220956021650469e-01
4.550204443687518308e-01 5.328185230036192044e-01 8.815052933071011454e-01
4.556185611092698484e-01 5.281088097066267695e-01 8.798967638851667994e-01
4.562534204266542326e-01 5.233935859930700651e-01 8.781964868264527935e-01
4.569203709084596610e-01 5.186739169401044514e-01 8.764041195297782583e-01
4.576148706477833339e-01 5.139508576774439730e-01 8.745194730542404926e-01
4.583325010790182952e-01 5.092254498718804534e-01 8.725425074817807491e-01
4.590689790493137079e-01 5.044987184411230396e-01 8.704733265502938577e-01
4.598201671313326133e-01 4.997716685175846441e-01 8.683121716406742019e-01
4.605820822069772169e-01 4.950452826784434435e-01 8.660594152048119998e-01
4.613509023726869995e-01 4.903205184540396222e-01 8.637155537234258995e-01
4.621229722350553293e-01 4.855983061224402042e-01 8.612812002829223212e-01
4.628948066804312034e-01 4.808795467939734336e-01 8.587570768592888149e-01
4.636621617804746465e-01 4.761655004408036906e-01 8.561438461496413410e-01
4.644228483348319947e-01 4.714566096078480206e-01 8.534426324219575033e-01
4.651739386269664878e-01 4.667536635703780079e-01 8.506544391441875907e-01
4.659126485884828583e-01 4.620574294334566789e-01 8.477803402103136765e-01
4.666363628095652749e-01 4.573686402108441684e-01 8.448214774526084936e-01
4.673426313321316639e-01 4.526879945693308982e-01 8.417790529251527598e-01
4.680291657078233247e-01 4.480161567955825430e-01 8.386543213914651185e-01
4.686938344285310198e-01 4.433537569692765912e-01 8.354485830591045215e-01
4.693346578320167217e-01 4.387013913255956021e-01 8.321631765974399908e-01
4.699498025791529199e-01 4.340596227897761117e-01 8.287994724682681280e-01
4.705375757926853475e-01 4.294289816663295900e-01 8.253588665927664714e-01
4.710964189403291091e-01 4.248099664657251084e-01 8.218427743723751844e-01
4.716249015377835252e-01 4.202030448517347638e-01 8.182526250758133113e-01
4.721217147398471536e-01 4.156086546932221681e-01 8.145898565994108553e-01
4.725856648806062155e-01 4.110272052049120939e-01 8.108559106034937125e-01
4.730156670165072685e-01 4.064590781625461724e-01 8.070522280235292722e-01
4.734107385193607187e-01 4.019046291787961578e-01 8.031802449512829289e-01
4.737699927598160721e-01 3.973641890273297284e-01 7.992413888782301523e-01
4.740926329157582608e-01 3.928380650035104282e-01 7.952370752909331264e-01
4.743779459344564242e-01 3.883265423112774450e-01 7.911687046060347228e-01
4.746252966720311828e-01 3.838298854668622528e-01 7.870376594308572393e-01
4.748341222291213026e-01 3.793483397110574140e-01 7.828453021343189100e-01
4.750039264972926722e-01 3.748821324227855634e-01 7.785929727119723642e-01
4.751342749269319987e-01 3.704314745277388354e-01 7.742819869283568135e-01
4.752247895239137265e-01 3.659965618967846446e-01 7.699136347195338903e-01
4.752751440794077964e-01 3.615775767297375043e-01 7.654891788385849161e-01
4.752846577346016566e-01 3.571748688576533159e-01 7.610100397104845316e-01
4.752531583445195884e-01 3.527885695695618384e-01 7.564774234071200976e-01
4.751807975405666906e-01 3.484186721552497978e-01 7.518923528283415481e-01
4.750674206653115461e-01 3.440653140404167365e-01 7.472559685686853692e-01
4.749129042193905303e-01 3.397286256677667371e-01 7.425693796885003417e-01
4.747171524182526858e-01 3.354087317676910929e-01 7.378336635067138660e-01
4.744800939620510971e-01 3.311057526021228270e-01 7.330498655303070432e-01
4.742016790105380575e-01 3.268198051821941674e-01 7.282189995072744226e-01
4.738818763543148349e-01 3.225510044607445836e-01 7.233420475907058611e-01
4.735206707734627707e-01 3.182994645010271961e-01 7.184199606025195584e-01
4.731180605743212086e-01 3.140652996233325722e-01 7.134536583862346459e-01
4.726740552951489982e-01 3.098486255314443216e-01 7.084440302390293542e-01
4.721886735713431427e-01 3.056495604211318384e-01 7.033919354141809910e-01
4.716613727297020442e-01 3.014684828248803128e-01 6.982986813805610593e-01
4.710926963645384880e-01 2.973052870266812420e-01 6.931646771793222861e-01
4.704828136289659901e-01 2.931600441838846383e-01 6.879905802658634606e-01
4.698317639381846544e-01 2.890328918495519428e-01 6.827771264871377310e-01
4.691395866583317198e-01 2.849239757466777712e-01 6.775250248474340431e-01
4.684063197381936328e-01 2.808334508365700755e-01 6.722349583426855402e-01
4.676319984415455155e-01 2.767614823885942155e-01 6.669075848245407112e-01
4.668166541724163010e-01 2.727082470546194348e-01 6.615435378909206854e-01
4.659603133859185342e-01 2.686739339515746283e-01 6.561434278004181220e-01
4.650628643816827057e-01 2.646588038897796924e-01 6.507079958832593380e-01
4.641242580497152992e-01 2.606631006122758221e-01 6.452378997676680994e-01
4.631447877428095938e-01 2.566869305701654502e-01 6.397333527350717031e-01
4.621244494694312643e-01 2.527305449360881529e-01 6.341948722101476976e-01
4.610632293393826520e-01 2.487942133948352064e-01 6.286229575018943416e-01
4.599611028558598380e-01 2.448782253548376642e-01 6.230180909006084455e-01
4.588180342503813125e-01 2.409828911918876493e-01 6.173807387973655469e-01
4.576339758554896497e-01 2.371085435285009702e-01 6.117113528277585699e-01
4.564088675103588622e-01 2.332555385522245284e-01 6.060103710422047874e-01
4.551426114844220883e-01 2.294242672454404608e-01 6.002782575500510420e-01
4.538352109035017068e-01 2.256151009415963693e-01 5.945152849064858636e-01
4.524865766439374881e-01 2.218284716492017750e-01 5.887218272221994564e-01
4.510965881023942248e-01 2.180648477346619485e-01 5.828982757017970862e-01
4.496651090864017264e-01 2.143247287775243981e-01 5.770450152504881247e-01
4.481919873439485502e-01 2.106086471651167358e-01 5.711624259770210488e-01
4.466770541000937844e-01 2.069171697362102713e-01 5.652508847626541710e-01
4.451201235978615167e-01 2.032508994724643858e-01 5.593107669047254760e-01
4.435210649059648236e-01 1.996104535682982628e-01 5.533422989220041499e-01
4.418797550887742509e-01 1.959964848006353622e-01 5.473456323671032075e-01
4.401958303868417355e-01 1.924097603751145913e-01 5.413213827196030614e-01
4.384690252866834115e-01 1.888510510844303159e-01 5.352699392743940354e-01
4.366990547337928352e-01 1.853211730457038908e-01 5.291917009058230148e-01
4.348856137062026561e-01 1.818209895007495414e-01 5.230870785018020275e-01
4.330283767917184612e-01 1.783514125901697334e-01 5.169564975681201213e-01
4.311269977716754020e-01 1.749134050778043403e-01 5.108004010215621005e-01
4.291811092153304252e-01 1.715079819968361174e-01 5.046192521919092844e-01
4.271904344659923636e-01 1.681361967924985268e-01 4.984132106571174670e-01
4.251546522673581574e-01 1.647991755952243342e-01 4.921824740309181379e-01
4.230731286286127379e-01 1.614981359784699588e-01 4.859281380753826540e-01
4.209454004136206628e-01 1.582343200442791198e-01 4.796507952549767251e-01
4.187709818950797191e-01 1.550090272321758555e-01 4.733510791258234707e-01
4.165493646911141434e-01 1.518236143519533232e-01 4.670296690947607909e-01
4.142800178080069395e-01 1.486794951032471834e-01 4.606872955350938548e-01
4.119623878145514673e-01 1.455781389789607694e-01 4.543247452773370720e-01
4.095958991778662628e-01 1.425210694369028197e-01 4.479428674896456797e-01
4.071799547953330878e-01 1.395098612110991787e-01 4.415425799574690391e-01
4.047139367624922324e-01 1.365461366216895456e-01 4.351248757648299992e-01
4.021972936019284628e-01 1.336316105494000928e-01 4.286903779176353124e-01
3.996293630849273582e-01 1.307680150350410408e-01 4.222401836338272596e-01
3.970093606178293211e-01 1.279570274853844003e-01 4.157761120045768699e-01
3.943365976380542870e-01 1.252003942696350014e-01 4.092995513119635498e-01
3.916103749033576498e-01 1.224998688123591362e-01 4.028120041341317625e-01
3.888299858840064682e-01 1.198571984110099742e-01 3.963150954999720699e-01
3.859947208059889556e-01 1.172741089547249538e-01 3.898105809973525515e-01
3.831038714159066827e-01 1.147522874417901684e-01 3.833003546699703667e-01
3.801567365353383798e-01 1.122933622374599760e-01 3.767864564999491295e-01
3.771526284658990869e-01 1.098988810729940035e-01 3.702710792321893263e-01
3.740908802950018708e-01 1.075702868621947472e-01 3.637565742534386581e-01
3.709708541354928557e-01 1.053088915040240603e-01 3.572454561957943420e-01
3.677919503089708275e-01 1.031158479486348478e-01 3.507404058933542013e-01
3.645536174519507511e-01 1.009921209275927434e-01 3.442442712851704334e-01
3.612553634855836804e-01 9.893845688361260771e-02 3.377600658314386384e-01
3.578967673433453012e-01 9.695535377529579391e-02 3.312909639976103771e-01
3.544774912975176551e-01 9.504303157033086591e-02 3.248402933678479765e-01
3.509972936657820841e-01 9.320140436662560646e-02 3.184115229802063629e-01
3.474560416161082133e-01 9.143005518316707492e-02 3.120082475359999274e-01
3.438537237247893397e-01 8.972821452832538403e-02 3.056341672288407363e-01
3.401904735486728781e-01 8.809468358171337887e-02 2.992931815755145442e-01
3.364665724714709372e-01 8.652789261304066892e-02 2.929892038941975252e-01
3.326824502647063309e-01 8.502592614588003195e-02 2.867260839053818455e-01
3.288387024976534012e-01 8.358647051086640078e-02 2.805076847277695462e-01
3.249360934730275985e-01 8.220683878873383255e-02 2.743378151941179288e-01
3.209755584101655623e-01 8.088399100741089365e-02 2.682201871550352612e-01
3.169582022236226426e-01 7.961456284429593855e-02 2.621583713198606391e-01
3.128852946012805614e-01 7.839490235071094881e-02 2.561557528820557206e-01
3.087582612248004899e-01 7.722111381434071387e-02 2.502154883125917717e-01
3.045786711401687885e-01 7.608910749927882966e-02 2.443404647714875755e-01
3.003482204670568367e-01 7.499465368295166190e-02 2.385332635717280492e-01
2.960687128198414286e-01 7.393343917254721620e-02 2.327961290245241788e-01
2.917420369856660312e-01 7.290112435224016529e-02 2.271309438018545013e-01
2.873701425511966390e-01 7.189339879884681928e-02 2.215392116816457535e-01
2.829550142767416343e-01 7.090603360902006380e-02 2.160220482113159313e-01
2.784999277173711985e-01 6.993210653137302280e-02 2.105832735994622174e-01
2.740068130913843047e-01 6.896804327168698512e-02 2.052225548327365479e-01
2.694770905593398824e-01 6.801140076763184661e-02 1.999383122503714527e-01
2.649127155611373241e-01 6.705861363954487842e-02 1.947301490341072916e-01
2.603155555465970217e-01 6.610638194498252851e-02 1.895973275559961757e-01
2.556873713350471533e-01 6.515168315524647036e-02 1.845388003264406274e-01
2.510311382384792789e-01 6.418928564209233634e-02 1.795555007506528800e-01
2.463515264850693609e-01 6.321115386076697762e-02 1.746505568409140452e-01
2.416465428487372114e-01 6.222162722501616700e-02 1.698160042316500806e-01
2.369174512696113344e-01 6.121879219616855466e-02 1.650498029374760922e-01
2.321653556071113234e-01 6.020099184329732317e-02 1.603497740495725687e-01
2.273975644358762205e-01 5.915624173942467950e-02 1.557218456563352615e-01
2.226121431237116921e-01 5.808842465569693386e-02 1.511590815358170026e-01
2.178074381899826051e-01 5.700049790743180050e-02 1.466558187034970040e-01
2.129839422000848193e-01 5.589168645699472276e-02 1.422095068240733784e-01
   ];

values = flipud(values);
P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');
