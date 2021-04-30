function map = tofino(m)
%   TOFINO a scientific colour map 6 by FabioCrameri et al.
%   tofino(M) returns an M-by-3 matrix containing a colormap. 
%   written by Ruix.Li in Jan, 2021

% USAGE:
% colormap(tofino(128))
% colormap tofino

if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

values = [
   0.870438019189215   0.849775235247820   0.999921133807976
   0.859834611541815   0.842322065667941   0.995323787227188
   0.849229351093729   0.834875854268757   0.990733078447098
   0.838624294521697   0.827440720605885   0.986142154602919
   0.828026699110218   0.820014031244438   0.981551406291515
   0.817435790631789   0.812600216392267   0.976960312572486
   0.806854431709363   0.805194509921124   0.972375290227299
   0.796269326669779   0.797798045334960   0.967789416975771
   0.785701142530790   0.790410204289664   0.963202493946231
   0.775131435760875   0.783028918542356   0.958621508089889
   0.764577531270194   0.775656607189566   0.954039956178778
   0.754030242632093   0.768289059323094   0.949458613543492
   0.743491817416485   0.760935760491496   0.944885197878664
   0.732962243256624   0.753582374624977   0.940309872852321
   0.722436695038714   0.746238309031267   0.935734587345564
   0.711932815080606   0.738905012339510   0.931161687741676
   0.701431794284864   0.731567778466322   0.926588853450526
   0.690943156057957   0.724241509348528   0.922022551603653
   0.680467488100454   0.716925084223350   0.917454230160496
   0.670014066536881   0.709605607457914   0.912880040005896
   0.659557214510169   0.702287590820075   0.908309265637763
   0.649120181061548   0.694977561286309   0.903730953680034
   0.638686326301815   0.687672562756085   0.899151946228561
   0.628271692366761   0.680360494119449   0.894565442468510
   0.617857215932479   0.673062807276076   0.889963601018325
   0.607466957464942   0.665752381632873   0.885353897266863
   0.597075482405223   0.658440386185984   0.880724389283736
   0.586689693039248   0.651127174613808   0.876075772365002
   0.576326491713270   0.643799111776066   0.871400311770501
   0.565948729223150   0.636475243005907   0.866687128223241
   0.555583046189552   0.629124425347009   0.861940253301511
   0.545234244285540   0.621759471554193   0.857134994148047
   0.534879244715060   0.614380072877900   0.852281200204961
   0.524528034021842   0.606988593397005   0.847345496695315
   0.514185516079401   0.599558796219833   0.842340909247122
   0.503833691449923   0.592103913941153   0.837236080342909
   0.493485342280729   0.584607190286080   0.832024358224796
   0.483145728444896   0.577079359663240   0.826688291507893
   0.472812580902862   0.569503115652833   0.821213815970832
   0.462489016810598   0.561900156860267   0.815589097057973
   0.452195872971551   0.554236738308429   0.809792263732441
   0.441910694458686   0.546534097587251   0.803811948609540
   0.431657826832729   0.538777952211237   0.797628297584093
   0.421427486690823   0.530970800614034   0.791233113902840
   0.411272211891305   0.523125719991379   0.784613970438705
   0.401187107196899   0.515227863812977   0.777749878229153
   0.391176285529712   0.507301527315625   0.770637325953310
   0.381267767479932   0.499334747724984   0.763268090269002
   0.371463559208028   0.491365259332872   0.755647232946974
   0.361827809366034   0.483348389116684   0.747766048944227
   0.352332447399022   0.475353515425525   0.739628006299819
   0.343039829807453   0.467347927763280   0.731226456438638
   0.333935140198647   0.459362213119837   0.722589566837330
   0.325038738740308   0.451403918951102   0.713726061079657
   0.316414660885411   0.443487643206114   0.704639644413509
   0.308015089209750   0.435626033205090   0.695353073439859
   0.299907596754709   0.427822478797210   0.685881869068761
   0.292071989739374   0.420087547108006   0.676243746028065
   0.284509394791046   0.412447417724368   0.666455637938622
   0.277257682828986   0.404874375093234   0.656554911914089
   0.270287517762247   0.397412883046246   0.646536134087057
   0.263592000533364   0.390041790501654   0.636438238570864
   0.257161535691717   0.382785391922582   0.626260990771334
   0.251007193323572   0.375619831895332   0.616039198872801
   0.245081096766726   0.368570828421360   0.605774208002646
   0.239432854575559   0.361609874493281   0.595496272007342
   0.233979197436486   0.354757498185379   0.585209877638522
   0.228757489875321   0.347984783742919   0.574907409613180
   0.223689496979343   0.341308355046721   0.564625500493773
   0.218813976489786   0.334728649548841   0.554361803958069
   0.214087124346938   0.328204201338275   0.544114213094653
   0.209485424729259   0.321765132650235   0.533889172817308
   0.205018427955470   0.315407137684066   0.523709518052319
   0.200637199578717   0.309116818643009   0.513557037122965
   0.196412172710407   0.302848483260688   0.503430143895062
   0.192207092085360   0.296678607775448   0.493351329483633
   0.188128508159619   0.290527777883463   0.483311070095857
   0.184055022669171   0.284438850054954   0.473306506966189
   0.180064207475341   0.278405264164323   0.463347253126188
   0.176110043120805   0.272383286254674   0.453433267103977
   0.172236596103028   0.266433356061822   0.443561318470871
   0.168388420409538   0.260499930866420   0.433714383535972
   0.164585780279819   0.254618612614112   0.423924277045706
   0.160797054661671   0.248755746517874   0.414177194979606
   0.157045944729794   0.242904256583415   0.404464344276232
   0.153318567813331   0.237141671680403   0.394804276288405
   0.149672839185779   0.231370556028992   0.385178532907668
   0.146008164143051   0.225636761553095   0.375605931857259
   0.142376115466364   0.219943859718953   0.366085521855881
   0.138777088196894   0.214277609390568   0.356603134665500
   0.135230039509011   0.208646419514073   0.347169477481869
   0.131710766181240   0.203057644038649   0.337769852176354
   0.128229359802428   0.197513723649206   0.328435075264824
   0.124761239362291   0.192002667926271   0.319147212389182
   0.121343375510585   0.186546322773287   0.309921954116899
   0.118041642177408   0.181117646954998   0.300723955706719
   0.114683995743425   0.175752488537078   0.291618336312217
   0.111494484445016   0.170466665485855   0.282561328619007
   0.108251218816659   0.165193911261254   0.273557930457461
   0.105123272794217   0.160005685482967   0.264609925377397
   0.102084262077760   0.154916884780747   0.255747015317695
   0.099092215395261   0.149907300345089   0.246959266830711
   0.096146704758670   0.144955505765307   0.238245817616554
   0.093305233550149   0.140050598841653   0.229610775517076
   0.090594387744356   0.135307747118062   0.221110326304076
   0.087928447925494   0.130681484973009   0.212658252315315
   0.085292403396211   0.126137993119712   0.204356699773590
   0.082822900601748   0.121681098030290   0.196142727226467
   0.080421282241574   0.117440225442307   0.188082304130082
   0.078086171588295   0.113389075919667   0.180113612647756
   0.075904514591130   0.109465598236699   0.172337162073342
   0.073884877303591   0.105685937819898   0.164735880907027
   0.071860258862489   0.102134332551546   0.157303896625232
   0.069982097407826   0.098819087283988   0.150117315820674
   0.068225660451987   0.095733109661155   0.143111145654809
   0.066536840170263   0.092861243998953   0.136320681759399
   0.064954775663115   0.090276406640111   0.129886427461098
   0.063266919018491   0.087896835519328   0.123621681860450
   0.061329139986193   0.085712646705500   0.117742875939788
   0.059549286899756   0.084005001547613   0.112174854615613
   0.057509350724474   0.082537507246683   0.106931329412449
   0.055683760770014   0.081475022868973   0.101970877503558
   0.053860231853388   0.080759012356196   0.097418192381777
   0.052230127742017   0.080480887651533   0.093170563915755
   0.050913485276974   0.080625036033163   0.089271252274653
   0.049942949863145   0.081197557633963   0.085513265723803
   0.049352875579224   0.082180048476027   0.082189024207424
   0.049079103845023   0.083463931977742   0.079008628647212
   0.049155381443222   0.085141112926829   0.076274333170474
   0.049556053856891   0.087225749865689   0.073999736767093
   0.050266927975766   0.089512004763977   0.072018803098962
   0.051322365096347   0.092107110676525   0.070499989221310
   0.052670778151467   0.094930584972022   0.069495656841420
   0.054311518041590   0.097913723391023   0.068833699740492
   0.056239629211805   0.101025819172537   0.068578527277012
   0.058194680978076   0.104315603585064   0.068741291393063
   0.060290441447521   0.107873214361264   0.069259870204018
   0.062175520442592   0.111722481456840   0.070000026664421
   0.063927696247584   0.115777698744325   0.071095282333862
   0.065475314331567   0.120052058405240   0.072347165989663
   0.066837735705537   0.124587795107015   0.073907930560554
   0.068267869148449   0.129302417709472   0.075502798268309
   0.069792171909815   0.134182276479599   0.077268490620433
   0.071436432967125   0.139131341597247   0.079172658535939
   0.073206287389691   0.144276840706138   0.081195215672644
   0.075034875579579   0.149517546249588   0.083187611719946
   0.076993690105326   0.154830488473191   0.085287843898889
   0.079073323398848   0.160249870769859   0.087583608357930
   0.081281702604876   0.165793887070530   0.089893014867721
   0.083484361477513   0.171434423077089   0.092320470541065
   0.085727807590336   0.177156820363147   0.094882061804049
   0.088156370186054   0.182921508020277   0.097451876771108
   0.090583869405749   0.188804783579492   0.100120263361024
   0.093019167476485   0.194746605481568   0.102903096806653
   0.095616862664643   0.200704371125821   0.105721501034569
   0.098236901225142   0.206805052038315   0.108577609745300
   0.100855233278638   0.212891958201404   0.111567281841898
   0.103599538876349   0.219082236737794   0.114506120754873
   0.106364802254887   0.225298568811551   0.117581788638353
   0.109138522992995   0.231595865758819   0.120661607793872
   0.111973719998569   0.237912648082945   0.123797672462370
   0.114789052097576   0.244260612414200   0.126976098734336
   0.117726990344928   0.250686213861745   0.130254961605828
   0.120640765366649   0.257150565349113   0.133472200030062
   0.123602780899608   0.263655682242525   0.136736845537171
   0.126616331435695   0.270187533858149   0.140039834903234
   0.129658154249002   0.276752432374587   0.143405740585381
   0.132692930664901   0.283353817693330   0.146750445819019
   0.135724736934938   0.289984517184150   0.150170603605426
   0.138829533010037   0.296669681527555   0.153554292928388
   0.141948101936459   0.303359508602479   0.157002479048688
   0.145094017901858   0.310116179703008   0.160441554694641
   0.148200745477692   0.316873985479904   0.163967248062939
   0.151362736452167   0.323666929626343   0.167446233430449
   0.154545198887464   0.330493053902409   0.170949596267307
   0.157747637890808   0.337355351639864   0.174496905350674
   0.160983130568580   0.344225913596464   0.178066073875652
   0.164238633573046   0.351153812484230   0.181591302191284
   0.167487769986212   0.358094259765716   0.185219558837421
   0.170768101921641   0.365058589279016   0.188815960903756
   0.174089310634923   0.372056357857758   0.192436139906747
   0.177456584238916   0.379094349977569   0.196100709426831
   0.180808307266949   0.386151484471517   0.199745968953986
   0.184249034565972   0.393253710295917   0.203473790485593
   0.187756605865691   0.400395557335618   0.207206750418462
   0.191253175518209   0.407555116671549   0.210958002262884
   0.194872319813006   0.414761115673921   0.214741815537441
   0.198520928030057   0.422000395886080   0.218586874840338
   0.202283025516755   0.429297532119538   0.222458116591320
   0.206178815243653   0.436634105844751   0.226391005494628
   0.210132477923534   0.444018454644616   0.230337741256950
   0.214249931117720   0.451447787758895   0.234394656845616
   0.218508916869160   0.458933217696103   0.238470030064481
   0.222944465472113   0.466471908969471   0.242640076311599
   0.227556135452411   0.474069152887222   0.246892481719329
   0.232380843665788   0.481730779219722   0.251239162845678
   0.237454118727181   0.489442101886010   0.255649867924593
   0.242733006901583   0.497231166132336   0.260175030377436
   0.248342839300513   0.505068154250196   0.264791667419840
   0.254208299939238   0.512970231780798   0.269549723538734
   0.260386388799752   0.520927618279483   0.274387783900067
   0.266890311481387   0.528944621864732   0.279377007075506
   0.273758705376677   0.537001749499093   0.284454381885296
   0.280937515536617   0.545092857177192   0.289684447649971
   0.288510036668692   0.553216299581732   0.295021527525754
   0.296432400948362   0.561373685701569   0.300491446405967
   0.304706811057343   0.569535734141471   0.306102919249030
   0.313341582984465   0.577702582291783   0.311781044138309
   0.322318288773808   0.585869495367435   0.317611148277948
   0.331612194640141   0.593998915936571   0.323530851855258
   0.341241406150899   0.602096648157369   0.329558901614535
   0.351160231483430   0.610148059456116   0.335653390112436
   0.361343431335190   0.618143374522179   0.341827691417137
   0.371779239740336   0.626065471248081   0.348071058387737
   0.382451189518747   0.633915702850743   0.354368559964500
   0.393324805237488   0.641665703688067   0.360698037342275
   0.404374006914236   0.649335591221795   0.367085879103768
   0.415581981115286   0.656898842944172   0.373490701292857
   0.426923747353038   0.664354953701788   0.379910543559337
   0.438366486706563   0.671712007332848   0.386331268661607
   0.449903653395126   0.678963599545421   0.392766428602403
   0.461513609896296   0.686115748642312   0.399186890187243
   0.473168263706877   0.693167007514277   0.405617054564707
   0.484878113995326   0.700114524287827   0.412014966913155
   0.496615644499793   0.706977076628042   0.418392015308280
   0.508389702323829   0.713746543461066   0.424768233153551
   0.520147321466516   0.720435658509040   0.431115531817041
   0.531933308966770   0.727051506283867   0.437442710464330
   0.543710707369225   0.733599552626122   0.443741676307265
   0.555480594767122   0.740086449758255   0.450020192664994
   0.567260771716360   0.746509539356493   0.456277967329396
   0.579022157339174   0.752882331479126   0.462515130725840
   0.590772182773618   0.759216041398566   0.468745497675261
   0.602519415368548   0.765514669942481   0.474956903061778
   0.614251800844466   0.771770519831453   0.481133257775100
   0.625984059581596   0.777997516469024   0.487318808943127
   0.637705646055995   0.784201977408286   0.493472634442964
   0.649422075072678   0.790375027388148   0.499620150979245
   0.661122379892005   0.796532794242820   0.505760115026840
   0.672828711922990   0.802676348445886   0.511898603452770
   0.684516372711618   0.808809652659378   0.518031586261713
   0.696215856704021   0.814923047387994   0.524146930473100
   0.707901746146597   0.821030728829417   0.530262712666590
   0.719594503749032   0.827132021332387   0.536376200522747
   0.731277434760508   0.833222778240341   0.542484669962302
   0.742972543163557   0.839310779374273   0.548595496075474
   0.754662329881109   0.845390456363375   0.554696027512099
   0.766349220015562   0.851466513413657   0.560799512026066
   0.778044820712810   0.857542865294231   0.566914052532521
   0.789741551370198   0.863621392181330   0.573024157632564
   0.801441030527875   0.869686690040834   0.579135316315223
   0.813145657724494   0.875759437362913   0.585254014253540
   0.824857123547172   0.881827824792456   0.591370121234810
   0.836576446806999   0.887893214248749   0.597497256868809
   0.848297424544154   0.893962485166786   0.603631286944076
   0.860030636863721   0.900030621656005   0.609764084912081
   ];

P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');
