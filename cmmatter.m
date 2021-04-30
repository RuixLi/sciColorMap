function map = cmmatter(m)
%   CMMATTER colormap from cmocean by Thyng, K. M et al.
%   matter(M) returns an M-by-3 matrix containing a colormap. 
%   written by Ruix.Li in Jan, 2021

% USAGE:
% colormap(cmmatter(128))
% colormap cmmatter

if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

values = [
9.942936149611202312e-01 9.303277953232079733e-01 6.910969022498407721e-01
9.938034737629607429e-01 9.248067799917484288e-01 6.856470896792071779e-01
9.932915386396504731e-01 9.192993747690529904e-01 6.802308895677181555e-01
9.927922245331627371e-01 9.137917294903226129e-01 6.748329403835298113e-01
9.922937701498860674e-01 9.082882194233706796e-01 6.694590190525575579e-01
9.917843550306121303e-01 9.027933977435592672e-01 6.641148019075449049e-01
9.912962746539998315e-01 8.972938428980343772e-01 6.587860434151366906e-01
9.907825925330567829e-01 8.918085346471608110e-01 6.534941055176841651e-01
9.902949549053171596e-01 8.863158938146130650e-01 6.482161486636766057e-01
9.897868190815676259e-01 8.808350065840212517e-01 6.429731121246738956e-01
9.892857473867685547e-01 8.753541152485579957e-01 6.377529594546893499e-01
9.887800796370288525e-01 8.698778821960219121e-01 6.325610007226144527e-01
9.882646997282734658e-01 8.644083076900085372e-01 6.273995656371403884e-01
9.877584964502673648e-01 8.589369989413550011e-01 6.222606017222616082e-01
9.872280289134517384e-01 8.534782966339129473e-01 6.171585665698279266e-01
9.867183884350317902e-01 8.480122040334344691e-01 6.120742768604477968e-01
9.861766767190066618e-01 8.425618846460892764e-01 6.070302342911766402e-01
9.856563017997251874e-01 8.371033300354000506e-01 6.020039838864913451e-01
9.851070454224936102e-01 8.316588814371468352e-01 5.970165676525449605e-01
9.845690242211674326e-01 8.262101763023093071e-01 5.920513492549713819e-01
9.840096682146298734e-01 8.207718909127237339e-01 5.871217557569952117e-01
9.834535848293927129e-01 8.153324961500217904e-01 5.822177451775890633e-01
9.828817074848651414e-01 8.099006555998068402e-01 5.773470477348076058e-01
9.823072425148250408e-01 8.044699893992296458e-01 5.725043678439867278e-01
9.817205500240108185e-01 7.990448613324698801e-01 5.676935526547516320e-01
9.811274651130897917e-01 7.936222997819741831e-01 5.629123141708799460e-01
9.805237822250761903e-01 7.882041368744077126e-01 5.581623151179201381e-01
9.799119019116716567e-01 7.827890166019746410e-01 5.534426550185235216e-01
9.792891597791347769e-01 7.773780574795166043e-01 5.487543863553446810e-01
9.786583517021393286e-01 7.719696800001862869e-01 5.440965033742034551e-01
9.780145739702225116e-01 7.665661517278330450e-01 5.394708896034823287e-01
9.773647283145959763e-01 7.611637891820339785e-01 5.348750765091280224e-01
9.766980163585675667e-01 7.557679109997390565e-01 5.303130790083464552e-01
9.760290252537030531e-01 7.503708130006796484e-01 5.257797515465254534e-01
9.753375433133614214e-01 7.449828010040938642e-01 5.212823917018596376e-01
9.746492807368433153e-01 7.395902023503717615e-01 5.168121142252199984e-01
9.739312415395592337e-01 7.342102748450782812e-01 5.123804929986149892e-01
9.732235441351503313e-01 7.288214038955377339e-01 5.079740009039053206e-01
9.724836441494412176e-01 7.234462681298939879e-01 5.036071894033782304e-01
9.717498445504565430e-01 7.180638747370174935e-01 4.992675340324776445e-01
9.709912116410467364e-01 7.126909352035095679e-01 4.949654270232705655e-01
9.702261620325377534e-01 7.073170976907954266e-01 4.906951514278061199e-01
9.694484453171449134e-01 7.019455954348422511e-01 4.864590138179895606e-01
9.686504017535663147e-01 6.965805969226914751e-01 4.822596297437949375e-01
9.678531538881393059e-01 6.912098001765796251e-01 4.780909555078191597e-01
9.670272977476158660e-01 6.858499112812684873e-01 4.739621016861336744e-01
9.662030356838596790e-01 6.804831678592252464e-01 4.698646253054341027e-01
9.653577621840926382e-01 6.751225363106635458e-01 4.658054627874114728e-01
9.644956606754987449e-01 6.697653999656224544e-01 4.617837747090557943e-01
9.636302007256901669e-01 6.644033993552483919e-01 4.577964421810854501e-01
9.627382975013459854e-01 6.590502602174439506e-01 4.538500459526182973e-01
9.618419029037778012e-01 6.536923650498338567e-01 4.499394348167297664e-01
9.609293304705296412e-01 6.483365953124501369e-01 4.460681718992942080e-01
9.599915754015638791e-01 6.429884241455728899e-01 4.422388634417756537e-01
9.590555927894280908e-01 6.376305748866927248e-01 4.384459238793448344e-01
9.580962561892508722e-01 6.322786777663680358e-01 4.346957499886874854e-01
9.571138853949342495e-01 6.269324224641481536e-01 4.309887354294504314e-01
9.561315297025726467e-01 6.215764963092997863e-01 4.273209635732272416e-01
9.551250405128054455e-01 6.162263913356859080e-01 4.236980325915365997e-01
9.540950546856811210e-01 6.108815734129118269e-01 4.201203681538954182e-01
9.530626716897264705e-01 6.055275479248746207e-01 4.165851980241140895e-01
9.520078397406573911e-01 6.001775213709300560e-01 4.130968208871531600e-01
9.509298744158470873e-01 5.948318045431840728e-01 4.096560342134981103e-01
9.498400194890849191e-01 5.894823244090308112e-01 4.062621760942275451e-01
9.487347976692349638e-01 5.841311256224190895e-01 4.029168199567615405e-01
9.476064491016543689e-01 5.787834319880815759e-01 3.996218296412110127e-01
9.464553073333200617e-01 5.734388133376047136e-01 3.963780340202668340e-01
9.452939757532162757e-01 5.680877777926379713e-01 3.931855149232086899e-01
9.441119180634874875e-01 5.627376402983688131e-01 3.900463532360756713e-01
9.429065439155045469e-01 5.573900694724827076e-01 3.869617715840133476e-01
9.416779791961638058e-01 5.520447400757862999e-01 3.839328326459904850e-01
9.404312902807343555e-01 5.466974929733746658e-01 3.809606687756254551e-01
9.391670109637508812e-01 5.413475099598963336e-01 3.780467610439202097e-01
9.378784499903906058e-01 5.359996531278976573e-01 3.751924384200013285e-01
9.365655059652620018e-01 5.306537435419416138e-01 3.723989770682498146e-01
9.352280123612883855e-01 5.253096443760549850e-01 3.696677100588824927e-01
9.338657357609021492e-01 5.199672647340076725e-01 3.670000247302842578e-01
9.324834513518638346e-01 5.146223341056469502e-01 3.643980039003675286e-01
9.310764112648535207e-01 5.092783920261573227e-01 3.618628439391275986e-01
9.296425700359164379e-01 5.039368520229430271e-01 3.593958605013685692e-01
9.281814529069224440e-01 4.985978383651590851e-01 3.569985751712403399e-01
9.266925163734759385e-01 4.932615377693159719e-01 3.546725399001493528e-01
9.251751483021848355e-01 4.879282029910456120e-01 3.524193303048753223e-01
9.236286685007274455e-01 4.825981562592266960e-01 3.502405381564949738e-01
9.220523297832619036e-01 4.772717924986036864e-01 3.481377630517493160e-01
9.204453195710341484e-01 4.719495822836188847e-01 3.461126032707011468e-01
9.188067620643404210e-01 4.666320744633321582e-01 3.441666458384411431e-01
9.171357210169962526e-01 4.613198983953663013e-01 3.423014558239780292e-01
9.154312031382285664e-01 4.560137657258883093e-01 3.405185649261683878e-01
9.136921621394280546e-01 4.507144716528461159e-01 3.388194594142976412e-01
9.119175034344646491e-01 4.454228956112940563e-01 3.372055675093833527e-01
9.101060894923883593e-01 4.401400013227078634e-01 3.356782463109665438e-01
9.082567458304244834e-01 4.348668361548626016e-01 3.342387683926176800e-01
9.063682676234201541e-01 4.296045297451883127e-01 3.328883082070119848e-01
9.044394268935215253e-01 4.243542918485532223e-01 3.316279284576256203e-01
9.024689802311073317e-01 4.191174093801583456e-01 3.304585666082093254e-01
9.004556769853120368e-01 4.138952426354805536e-01 3.293810217125931472e-01
8.983982678499889962e-01 4.086892206819806583e-01 3.283959417554291327e-01
8.962955137593517918e-01 4.035008359311561543e-01 3.275038116986458414e-01
8.941481104554649395e-01 3.983293983456084875e-01 3.267070561329722400e-01
8.919536525149722728e-01 3.931778253066712803e-01 3.260048269152195366e-01
8.897101199351982181e-01 3.880487567649602565e-01 3.253961697320843505e-01
8.874163795567694413e-01 3.829439054205242554e-01 3.248807846244438635e-01
8.850713585473568568e-01 3.778650063033766049e-01 3.244581619630766411e-01
8.826755435924777959e-01 3.728118797277990004e-01 3.241299144458608672e-01
8.802274289557096010e-01 3.677869127615048805e-01 3.238946418203613176e-01
8.777249655021830410e-01 3.627933891756242590e-01 3.237493930733041925e-01
8.751673985732256744e-01 3.578330531078428023e-01 3.236927558288430484e-01
8.725555139394461923e-01 3.529055754992642124e-01 3.237261048951861064e-01
8.698877548666956727e-01 3.480139364384642886e-01 3.238460395212981457e-01
8.671629330678980452e-01 3.431608117920707524e-01 3.240490255671465425e-01
8.643813155550574834e-01 3.383468700732272794e-01 3.243343280815126350e-01
8.615430100192384977e-01 3.335730372253879472e-01 3.247007528957156497e-01
8.586467469801843944e-01 3.288425164717434512e-01 3.251427866013465451e-01
8.556930023091509074e-01 3.241559097884965657e-01 3.256590726700412941e-01
8.526821206317460877e-01 3.195140519652634459e-01 3.262477399527137223e-01
8.496135249080434271e-01 3.149194771604064691e-01 3.269031319055852869e-01
8.464880691147448344e-01 3.103723490573296884e-01 3.276240607685041994e-01
8.433059903582461603e-01 3.058739837233550030e-01 3.284066774658670473e-01
8.400675201697129779e-01 3.014258630212182100e-01 3.292462412802209526e-01
8.367737994501905918e-01 2.970277335155548926e-01 3.301419279880662416e-01
8.334250817653976462e-01 2.926812202808505847e-01 3.310879308798391207e-01
8.300223167271181257e-01 2.883865925403408248e-01 3.320815261966803544e-01
8.265664528479066409e-01 2.841441353717970020e-01 3.331197789552536870e-01
8.230582869411739999e-01 2.799545862699168719e-01 3.341980671944378423e-01
8.194989991910379690e-01 2.758177426460852733e-01 3.353144156579274116e-01
8.158895345625488682e-01 2.717340841090945536e-01 3.364643892127716640e-01
8.122310472907531276e-01 2.677035350490168386e-01 3.376451421817873721e-01
8.085246874446361254e-01 2.637260312682816465e-01 3.388536188130562565e-01
8.047716060121338222e-01 2.598015433395364782e-01 3.400863817867416095e-01
8.009730135703670983e-01 2.559297758719957794e-01 3.413409259751189473e-01
7.971300939112275774e-01 2.521105612652171368e-01 3.426140174094376434e-01
7.932440533013958017e-01 2.483435687707094552e-01 3.439030220163640239e-01
7.893160890135294538e-01 2.446284526280468330e-01 3.452052771464595993e-01
7.853473877765537736e-01 2.409648192333603833e-01 3.465182972816244766e-01
7.813391260814397388e-01 2.373522835108513029e-01 3.478394483472491694e-01
7.772924488739767490e-01 2.337903640474600642e-01 3.491667244042649942e-01
7.732084983091196406e-01 2.302786572731657100e-01 3.504975234338518764e-01
7.690883651827444822e-01 2.268166676306541119e-01 3.518300145036632465e-01
7.649331213342656088e-01 2.234039396519906795e-01 3.531621316810459876e-01
7.607438261029081383e-01 2.200400345294166726e-01 3.544916653625779235e-01
7.565214435019435024e-01 2.167244640001846911e-01 3.558173116773682421e-01
7.522670051172567485e-01 2.134568325306841485e-01 3.571365659018996275e-01
7.479813874637180060e-01 2.102366867865238520e-01 3.584483801868486030e-01
7.436655059621508634e-01 2.070636399021255625e-01 3.597509060488300325e-01
7.393202434785964838e-01 2.039373173302497233e-01 3.610423849932817841e-01
7.349463482724380992e-01 2.008573725915569486e-01 3.623219106278985358e-01
7.305447136853985279e-01 1.978234802458921360e-01 3.635871804824805653e-01
7.261159828724578214e-01 1.948353685346151387e-01 3.648375781480875379e-01
7.216608959662019762e-01 1.918927853792166127e-01 3.660715129191122186e-01
7.171801670483409774e-01 1.889955002148961394e-01 3.672874263418225982e-01
7.126743300531552805e-01 1.861433788319636073e-01 3.684846837309949108e-01
7.081441223914051175e-01 1.833362215388179839e-01 3.696612595209343710e-01
7.035900061356136215e-01 1.805739799909275023e-01 3.708165722616917348e-01
6.990125222046897902e-01 1.778565964180273684e-01 3.719494030784631367e-01
6.944122804123707970e-01 1.751839824866724127e-01 3.730580800830735622e-01
6.897896069146784992e-01 1.725562544195547443e-01 3.741422132560422997e-01
6.851450759297335047e-01 1.699733803139570343e-01 3.752000809033200213e-01
6.804790620490438480e-01 1.674354838987148208e-01 3.762308077572429355e-01
6.757918752796293616e-01 1.649427652357627616e-01 3.772336599439788940e-01
6.710841190288990843e-01 1.624951923227635209e-01 3.782065903997158807e-01
6.663559221262009835e-01 1.600931455660249692e-01 3.791494395940231965e-01
6.616076837858697601e-01 1.577367904785384745e-01 3.800608417430486607e-01
6.568398281175149567e-01 1.554262673949660112e-01 3.809393122355112515e-01
6.520524648278914759e-01 1.531620260338200923e-01 3.817844598609113071e-01
6.472460502131879290e-01 1.509441834093387669e-01 3.825945806932325444e-01
6.424208086222070735e-01 1.487730846896873349e-01 3.833687631504908433e-01
6.375768667154826375e-01 1.466491860640934397e-01 3.841063458261376740e-01
6.327147719614083510e-01 1.445724818775720732e-01 3.848052877974663111e-01
6.278345360543612363e-01 1.425435417995506715e-01 3.854652342077181104e-01
6.229363449371848604e-01 1.405627442689544315e-01 3.860852182514847852e-01
6.180208267587814497e-01 1.386299275595349323e-01 3.866630046493146899e-01
6.130878172636732293e-01 1.367458410848005068e-01 3.871986373954375282e-01
6.081376300127646628e-01 1.349106539902725221e-01 3.876907660008953038e-01
6.031708343692542273e-01 1.331241752511138077e-01 3.881374204452801013e-01
5.981872594198538451e-01 1.313871076769131119e-01 3.885385758335542783e-01
5.931872993271581906e-01 1.296994119208923768e-01 3.888927420384044042e-01
5.881715194167826954e-01 1.280607661499650052e-01 3.891980996789912162e-01
5.831397292746328676e-01 1.264718001616958465e-01 3.894546477166113685e-01
5.780923809284296278e-01 1.249322477491876249e-01 3.896608882675748342e-01
5.730301484941315859e-01 1.234414650841386962e-01 3.898149438393606059e-01
5.679527785339369972e-01 1.220000281824430710e-01 3.899169825800337663e-01
5.628606992123619257e-01 1.206075179177948653e-01 3.899657247446918218e-01
5.577549128735556083e-01 1.192626131188577743e-01 3.899588733885684388e-01
5.526350045348186191e-01 1.179659461688005728e-01 3.898969895870120772e-01
5.475013145908723677e-01 1.167170132781017999e-01 3.897791516609607765e-01
5.423552229242829537e-01 1.155136939391362971e-01 3.896026927627281311e-01
5.371963110518728213e-01 1.143564329775472455e-01 3.893682721938278024e-01
5.320248625085529648e-01 1.132445825251853777e-01 3.890752921818558807e-01
5.268418790923193873e-01 1.121763322989662304e-01 3.887220732362928199e-01
5.216480344214139420e-01 1.111502746625857019e-01 3.883076350820581779e-01
5.164430850451627864e-01 1.101663332257847294e-01 3.878324664548168932e-01
5.112275102681053118e-01 1.092232673876926685e-01 3.872959651352503863e-01
5.060029073959358970e-01 1.083180273650512782e-01 3.866960834588916152e-01
5.007692304925555060e-01 1.074500336043514026e-01 3.860332364294135066e-01
4.955265944792267008e-01 1.066184092659498428e-01 3.853076049214476662e-01
4.902755524910634155e-01 1.058215397414334347e-01 3.845188368245686661e-01
4.850176459901380244e-01 1.050561979453382144e-01 3.836654992000479436e-01
4.797532909040905236e-01 1.043208730187463462e-01 3.827476922012114091e-01
4.744823785889252243e-01 1.036148463575309320e-01 3.817661365680148355e-01
4.692055171112920475e-01 1.029362343090417242e-01 3.807207588669155873e-01
4.639233255037821801e-01 1.022831037225876705e-01 3.796115541526619008e-01
4.586377341242697248e-01 1.016514176559336347e-01 3.784373263419291700e-01
4.533486056644123185e-01 1.010403969450098804e-01 3.771990792167705386e-01
4.480561070398016432e-01 1.004487677966155457e-01 3.758974928385367953e-01
4.427608762820601784e-01 9.987450133495995308e-02 3.745328419993724234e-01
4.374635532679027050e-01 9.931556251859710582e-02 3.731054660236349796e-01
4.321647778868571432e-01 9.876991822512792840e-02 3.716157670899542520e-01
4.268658599998730319e-01 9.823449013050672418e-02 3.700637078536853086e-01
4.215676735765455097e-01 9.770690573986753891e-02 3.684497084664269395e-01
4.162699168504104819e-01 9.718665004270135577e-02 3.667750666255454317e-01
4.109731987208080639e-01 9.667179308527124038e-02 3.650404160810349907e-01
4.056781184785120398e-01 9.616044175324228727e-02 3.632464399813756240e-01
4.003852641200214557e-01 9.565074509543119996e-02 3.613938677771775798e-01
3.950952107257716950e-01 9.514089908082037916e-02 3.594834719896101149e-01
3.898085189133677075e-01 9.462915077538672226e-02 3.575160648711968037e-01
3.845257333758309581e-01 9.411380193352703039e-02 3.554924949866632988e-01
3.792473815136121473e-01 9.359321200643175298e-02 3.534136437413167853e-01
3.739739721678181361e-01 9.306580057655630678e-02 3.512804218838474490e-01
3.687059944607640194e-01 9.253004923332719400e-02 3.490937660095801975e-01
3.634439167485821742e-01 9.198450291035600856e-02 3.468546350890427399e-01
3.581881856892511484e-01 9.142777070873894796e-02 3.445640070453340198e-01
3.529392254280559471e-01 9.085852623447668308e-02 3.422228754021731101e-01
3.476974369011708865e-01 9.027550748073234765e-02 3.398322460227614084e-01
3.424631972568040195e-01 8.967751628755202264e-02 3.373931339577017074e-01
3.372368593921474811e-01 8.906341741289613978e-02 3.349065604182628331e-01
3.320187516032832020e-01 8.843213724940904297e-02 3.323735498892629314e-01
3.268091773441717529e-01 8.778266222136388297e-02 3.297951273938287686e-01
3.216084150899517491e-01 8.711403689571997622e-02 3.271723159202782338e-01
3.164167182989683913e-01 8.642536184028648538e-02 3.245061340194448363e-01
3.112343154672587153e-01 8.571579126067202514e-02 3.217975935788711661e-01
3.060614102686342042e-01 8.498453044606019136e-02 3.190476977785482449e-01
3.008981817730306263e-01 8.423083305194795090e-02 3.162574392312175187e-01
2.957447847354051640e-01 8.345399824589613824e-02 3.134277983087430108e-01
2.906013499472219208e-01 8.265336774002721154e-02 3.105597416546946876e-01
2.854679846423482936e-01 8.182832273165288606e-02 3.076542208820723934e-01
2.803477329331294232e-01 8.097431979192776241e-02 3.047120362305891783e-01
2.752380681858879186e-01 8.009433346301736423e-02 3.017343316299965217e-01
2.701389341759609652e-01 7.918798082745703848e-02 2.987220235093637766e-01
2.650503484302856316e-01 7.825477700181371343e-02 2.956760032243300196e-01
2.599723067663477494e-01 7.729426121855428877e-02 2.925971426566268407e-01
2.549047838884308526e-01 7.630599343423161152e-02 2.894862939132400448e-01
2.498493147092451516e-01 7.528752506190716787e-02 2.863443687052725228e-01
2.448074110283037785e-01 7.423648337865965119e-02 2.831723508316192905e-01
2.397761080979832760e-01 7.315619369923848092e-02 2.799709378403843485e-01
2.347552980534894362e-01 7.204627593897616755e-02 2.767409087277542534e-01
2.297448542911243452e-01 7.090635374932227619e-02 2.734830227534650882e-01
2.247460435545195478e-01 6.973430487024689928e-02 2.701981884636781017e-01
2.197617914493367186e-01 6.852599251980440176e-02 2.668875888727837431e-01
2.147876871428340828e-01 6.728630515821912295e-02 2.635514822299450111e-01
2.098235281541684927e-01 6.601485651366462148e-02 2.601905585020159450e-01
2.048690954628696881e-01 6.471124480576789795e-02 2.568054914489818485e-01
1.999302337340111424e-01 6.336777961956377436e-02 2.533980282310328569e-01
1.950016002461211762e-01 6.199020593164828591e-02 2.499680455203335816e-01
1.900821894571196047e-01 6.057894133574073109e-02 2.465160535124999996e-01
1.851717128353368158e-01 5.913348735199071976e-02 2.430426744218359136e-01
   ];

P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');
