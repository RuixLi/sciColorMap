function map = cmfast(m)
%   cmfast value from https://www.kennethmoreland.com/color-advice/
%   cmfast(M) returns an M-by-3 matrix containing a colormap. 
%   written by Ruix.Li in Jul, 2024

% USAGE:
% colormap(cmfast(128))
% colormap cmfast

if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

values = [
0.056399322	0.056399092	0.4700000908789252
0.060486362	0.062005134	0.47372476
0.064416816	0.067460093	0.47745329368118844
0.068208361	0.072787627	0.4811856771994169
0.071875595	0.07800658	0.4849218948096958
0.075430733	0.083132214	0.4886619313746366
0.07888411	0.088177067	0.4924057720268043
0.082244549	0.093151564	0.49615340215942133
0.085519655	0.098064467	0.4999048074174715
0.088716031	0.10292321028597123	0.503659974
0.091839449	0.1077341539342711	0.5074188870978831
0.094894985	0.11250277964935398	0.5111815339941681
0.097887134	0.11723384373486456	0.5149479009484408
0.1008198889408061	0.12193149798781852	0.5187179747437294
0.10369682074242348	0.12659938634816684	0.5224917423688182
0.10652113276845596	0.13124072293591046	0.526269191
0.10929571148429909	0.13585835563649218	0.5300503080530375
0.11202316727061504	0.14045481834447432	0.5338350810605414
0.114705869	0.14503237421856888	0.5376234977827156
0.11734597297094118	0.14959305174834386	0.5414155461434925
0.1199454483569834	0.15413867502426848	0.5452112142368335
0.12250609792661046	0.15867088929713632	0.54901049
0.1250295766452019	0.16319118268190172	0.5528133628165277
0.1275174074468792	0.16770090468464235	0.5566198202956505
0.12997099497475875	0.1722012820955241	0.5604298514835687
0.1323916375573694	0.17669343268511253	0.5642434452511518
0.1347805376883293	0.18117837705871906	0.5680605906113081
0.1371388112300599	0.185657049	0.5718812767149322
0.13946749552498663	0.19013030424917374	0.5757054928470086
0.1417675565674319	0.19459892878884152	0.5795332284228638
0.14403989536474382	0.19906364533885834	0.5833644729845597
0.14628535359603004	0.20352511965737846	0.587199216
0.1485047186602105	0.20798396588503304	0.591037448
0.15069872819135532	0.2124407513202638	0.5948791578343328
0.15286807410783024	0.21689600066499443	0.5987243361758925
0.15501340625222337	0.22135019980932208	0.602572973
0.15713533567100055	0.22580379921374144	0.6064250585332337
0.15923443757612618	0.2302572169389266	0.6102805831218335
0.16131125402516697	0.2347108413659933	0.6141395372045474
0.16336629635156613	0.23916503364419106	0.6180019113222969
0.16540004737268849	0.24362012989793042	0.6218676961132428
0.16741296339969455	0.24807644322078798	0.6257368823103896
0.1694054760703218	0.25253426548049784	0.6296094607392744
0.17137799402306106	0.2569938689558448	0.6334854223157333
0.17333090442898133	0.2614555078237354	0.6373647580437497
0.17526457439554824	0.26591941951244225	0.6412474590133733
0.17717935225510142	0.2703858259350733	0.6451335163987142
0.17907556874922181	0.2748549346156248	0.6490229214560015
0.1809535381189467	0.2793269397185231	0.6529156655217104
0.18281355910969418	0.28380202299129365	0.6568117400107522
0.18465591589880098	0.2882803546288936	0.6607111364147238
0.18648087895271812	0.2927620940672896	0.6646138463002169
0.18828870582018803	0.2972473907130189	0.668519861
0.19007964186704251	0.30173638461474417	0.6724291731473425
0.1918539209577151	0.3062292070821613	0.6763417736026749
0.1936117660880268	0.31072598125706025	0.680257655
0.19535338997336027	0.31522682264083357	0.684176808
0.19707899559593622	0.31973183958229145	0.6880992255023648
0.1987887767145501	0.3242411337292462	0.6920248995922101
0.20048291833979215	0.32875480044699207	0.6959538222106018
0.2021615971775208	0.3332729292064891	0.6998859855315079
0.2038249820430741	0.33779560394479496	0.7038213817897198
0.20547323424848402	0.34232290340004273	0.7077600032796703
0.20710650796478164	0.34685490142304115	0.7117018423542868
0.20872495056124224	0.35139166726739085	0.7156468914238815
0.21032870292332045	0.3559332658598217	0.7195951429550731
0.2119178997508136	0.3604797580523151	0.7235465894697434
0.21349266983771453	0.3650312008574229	0.7275012235440229
0.21505313633504308	0.3695876476680801	0.7314590378073084
0.21659941699787794	0.3741491484630849	0.7354200249413088
0.21813162441767753	0.37871574999932667	0.7393841776791188
0.21964986624092053	0.3832874959917416	0.7433514888043196
0.22115424537498546	0.3878644272819027	0.7473219511501076
0.2226448601821281	0.3924465819960659	0.7512955575984437
0.22412180466236137	0.39703399569342973	0.7552723010792326
0.22558516862594918	0.4016267015053061	0.7592521745695195
0.22703503785619156	0.4062247302658422	0.7632351710927154
0.22847149426314084	0.4108281106348767	0.767221284
0.22989461602879052	0.4154368692134787	0.7712105055587793
0.23130447774429908	0.420051031	0.7752028297735886
0.2327011505397253	0.4246706177557461	0.7791982495637787
0.23408470220673872	0.4292956515747648	0.7831967581736486
0.23545519731471654	0.43392615150135483	0.7871983488896261
0.2368126973206433	0.43856213535244687	0.7912030150396264
0.23815726067315396	0.44320361945112235	0.7952107499924287
0.23948894291107325	0.44785061870293646	0.7992215471570697
0.24080779675676556	0.45250314666800057	0.8032353999822517
0.2421138722045883	0.4571612156290877	0.8072523019557665
0.2437324512834101	0.4616938261520715	0.8107061526439545
0.24603367830163092	0.4659480142395624	0.8129376656401243
0.2483113034501781	0.47020643277215185	0.8151690195933332
0.2505658453275872	0.4744690930331045	0.8174002139837899
0.2527977986013778	0.4787360054940705	0.8196312483150411
0.25500763543805527	0.4830071798504228	0.8218621221135133
0.2571958068258393	0.48728262505491365	0.8240928349280628
0.2593627437997214	0.4915623493497427	0.8263233863295366
0.2615088585774566	0.49584636029712065	0.8285537759103367
0.26363454561420874	0.5001346648084111	0.8307840032839994
0.2657401825828221	0.5044272691719235	0.8330140680847777
0.26782613128595956	0.5087241790794301	0.8352439699672344
0.2698927385057614	0.5130253996514716	0.837473709
0.2719403367961502	0.5173309354615153	0.8397032836945902
0.2739692452223773	0.5216407905590256	0.8419326949466026
0.27597977005202057	0.5259549684914997	0.8441619420937575
0.27797220540123196	0.5302734723255238	0.8463910248863193
0.27994683383969055	0.5345963046668972	0.8486199430925754
0.2819039269574107	0.538923468	0.8508486964984793
0.28384374589627465	0.5432549631055508	0.8530772849073034
0.28576654184890943	0.5475907922794858	0.8553057081392934
0.28767255652729445	0.5519309561485175	0.8575339660313366
0.2895620226033005	0.556275455	0.8597620584366279
0.2914351641231527	0.56062429	0.8619899852243489
0.29329219689766023	0.5649774598975384	0.8642177462793504
0.2951333288699085	0.5693349647909062	0.866445342
0.29695876046195135	0.5736968038234904	0.8686727708070816
0.2987686849019353	0.5780629759252897	0.8709000341250861
0.3005632885329829	0.5824334797370296	0.8731271314003272
0.30234275110502284	0.5868083136220928	0.8753540625914493
0.30410724605069966	0.5911874756779573	0.8775808276709836
0.3058569407464003	0.5955709637471647	0.8798074266250714
0.30759199675933807	0.5999587754278437	0.8820338594531927
0.3093125700815817	0.604350908	0.8842601261678974
0.3110188113518528	0.6087473588542203	0.8864862267945436
0.3127108660658523	0.6131481246629371	0.8887121613710405
0.3143888747758038	0.6175532022273853	0.8909379299475961
0.31605297327987847	0.6219625880671558	0.8931635325864682
0.31770329280211734	0.626376279	0.8953889693617222
0.3193399601633912	0.6307942697108689	0.8976142403589922
0.320963098	0.6352165576372372	0.8998393456752471
0.3225728246380139	0.639643138	0.9020642854185594
0.32416925480094183	0.6440740067426759	0.9042890597078809
0.3257524991892719	0.6485091590637221	0.9065136686728216
0.32732266489416734	0.6529485904096579	0.9087381124534306
0.32887985546855214	0.6573922959879699	0.9109623911999848
0.3304241710483118	0.6618402708717623	0.9131865050727777
0.3319557084678885	0.6662925100055168	0.9154104542419155
0.33347456137055753	0.6707490082106287	0.9176342388871142
0.33498082031368154	0.6752097601907361	0.9198578591975022
0.3364745728692121	0.6796747605368456	0.9220813153714269
0.33795590371967577	0.684144004	0.9243046076162615
0.33942489474988274	0.6886174841573419	0.926527736
0.3408816251345921	0.693095196	0.9287507011921723
0.3423261714223213	0.6975771337303639	0.9309735029814643
0.34375860761549765	0.7020632911645103	0.9331961417577403
0.3451790052471533	0.7065536624090324	0.9354186177707691
0.34658743345430737	0.7110482413947193	0.9376409312782737
0.34798395904821416	0.7155470219743846	0.9398630825457643
0.3493686465816351	0.7200499979265045	0.9420850718463719
0.35074155841325744	0.7245571629587255	0.9443068994606884
0.35210275476941294	0.7290685107112406	0.9465285656766073
0.3534522938032179	0.7335840347600426	0.9487500707891684
0.3547902316512562	0.7381037286200587	0.9509714151004048
0.35611662248791615	0.7426275857481701	0.9531925989191926
0.3599942426094666	0.7462569157955529	0.9541477186815751
0.36665919213525955	0.7488794978264013	0.9536788613915271
0.3732080465382223	0.7515049237322446	0.9532082243994601
0.3796473044588951	0.7541331805124579	0.9527358000714791
0.38598291	0.7567642552902677	0.952261581
0.3922203180050226	0.7593981353112416	0.9517855587118483
0.3983645439903723	0.762034808	0.9513077262512409
0.40442021524977995	0.7646742606677304	0.950828076
0.410391609	0.7673164810927663	0.950346599
0.41628268963180043	0.769961457	0.9498632884827772
0.42209713666647675	0.7726091760361155	0.949378136
0.42783837483185505	0.7752596263387322	0.9488911345949508
0.43350959648232096	0.7779127959062896	0.9484022753445526
0.4391137830136498	0.7805686729110634	0.9479115506124408
0.44465372359047783	0.7832272456349522	0.9474189523970488
0.45013203180323386	0.7858885024681586	0.9469244726616287
0.45555116052657346	0.7885524319078867	0.9464281033339431
0.4609134152101964	0.7912190225570591	0.9459298363059593
0.46622096579878464	0.7938882631230485	0.945429663
0.47147585744934234	0.7965601424164289	0.9449275765360958
0.4766800201903962	0.7992346493497413	0.944423567
0.48183527764749773	0.8019117729362782	0.9439176277598675
0.4869433549425855	0.8045915022888834	0.9434097493349233
0.49200588586044264	0.8072738266187671	0.9428999237920072
0.49702441936335157	0.8099587352343387	0.9423881427635693
0.5020004255246665	0.8126462175400538	0.9418743978436699
0.5069353009431576	0.8153362630352777	0.9413586805876387
0.511830374	0.8180288613131641	0.940840983
0.5166869078526631	0.8207240020595472	0.9403212950927843
0.5215061076680354	0.8234216750518516	0.9397996097678594
0.5262891213647314	0.8261218701580136	0.9392759179338945
0.5310370446646387	0.8288245773354204	0.9387502109473427
0.5357509240225776	0.8315297866298599	0.9382224801238109
0.5404317596134475	0.8342374881744873	0.9376927167376926
0.5450805080923455	0.8369476721888045	0.9371609120217997
0.5496980851483111	0.839660329	0.9366270571669869
0.5542853678701498	0.842375449	0.936091143
0.5588431969408993	0.8450930225190598	0.9355531615919648
0.5633723786757944	0.8478130402991252	0.935013103
0.5678736869170913	0.850535493	0.9344709586858626
0.5723478647978021	0.8532603710590244	0.9339267195040934
0.5767956263851971	0.8559876655522349	0.9333803764259805
0.5812176582138976	0.8587173672615773	0.9328319203378616
0.5856146207174519	0.861449467	0.9322813420809748
0.58998715	0.8641839562170646	0.9317286324510456
0.5943358569204654	0.8669208255986849	0.9311737821978697
0.5986613326005712	0.869660066	0.9306167820248923
0.6029641451883148	0.8724016700730204	0.9300576225887797
0.6072448430568432	0.8751456277493316	0.9294962944989892
0.6115039553391062	0.8778919308956485	0.9289327883173324
0.6157419928377809	0.8806405709847965	0.9283670945575345
0.6199594488811155	0.8833915395605384	0.9277992036847885
0.6241568001285553	0.8861448282367707	0.9272291061153024
0.6283345073296909	0.8889004286967339	0.9266567922158453
0.6324930160397582	0.8916583326922303	0.9260822523032847
0.6366327572947027	0.8944185320428522	0.9255054766441194
0.6407541482485264	0.8971810186352227	0.924926455
0.6448575927754652	0.8999457844222444	0.9243451788972953
0.6489434820393204	0.9027128214223579	0.9237616370865195
0.6530121950320953	0.9054821217188109	0.9231758200819346
0.6570640990839303	0.9082536774589368	0.9225877178910097
0.6610995503461689	0.9110274808534413	0.9219973204679324
0.665118894	0.9138035241757009	0.9214046177131014
0.6691224659370483	0.9165817997610682	0.9208095994726154
0.6731105906789893	0.9193623000061868	0.9202122555377567
0.6770835842615168	0.9221450173683164	0.9196125756444653
0.681041753	0.924929944	0.9190105494728129
0.6849853958920142	0.9277170735717307	0.9184061666464635
0.689533523	0.9300748502202364	0.917134549
0.6967941062924761	0.930496787	0.9128769077248013
0.7039581816073966	0.9309188112313086	0.9086173332071896
0.7110292399073956	0.9313409170612024	0.9043557622953741
0.7180105759651954	0.9317630981732395	0.9000921308248757
0.7249053029904223	0.9321853483853254	0.8958263732613951
0.7317163662747617	0.932607662	0.8915584226645067
0.7384465555513638	0.9330300314549511	0.8872882106501547
0.7450985162131459	0.9334524520218918	0.8830156673519045
0.7516747595158375	0.9338749171076168	0.8787407213808973
0.7581776718755586	0.9342974206034251	0.8744632997844545
0.7646095233569844	0.9347199564151945	0.8701833280032811
0.7709724754363656	0.9351425184633477	0.86590073
0.7772685881135054	0.9355651006828172	0.8616154273493942
0.7834998264380314	0.9359876970230105	0.8573273409189899
0.7896680665077086	0.9364103014477745	0.8530363890920852
0.7957751009899268	0.9368329079353596	0.8487424885809819
0.8018226442117738	0.9372555104783831	0.8444455542016506
0.8078123368590798	0.937678103	0.8401454988193189
0.8137457503204295	0.9381006797728273	0.835842233
0.819624391	0.9385232345809847	0.8315356664126047
0.8254497025861596	0.938945762	0.8272257048473656
0.8312230724271314	0.9393682547676995	0.8229122530741154
0.8369458318277275	0.9397907082881827	0.8185952133166836
0.8426192604971634	0.9402131162115617	0.8142744854774867
0.8482445890412471	0.9406354726440324	0.8099499670674798
0.8538230015577256	0.9410577717058136	0.8056215531334493
0.8593556380584475	0.9414800075311051	0.801289136
0.8648435967322021	0.9419021742680483	0.7969526061038316
0.8702879360608466	0.9423242660786851	0.7926118500869787
0.8756896768001364	0.9427462771389161	0.7882667525375255
0.8810498038356659	0.943168202	0.7839171949889879
0.8863692679233814	0.9435900337808109	0.7795630560113941
0.8916489873232983	0.944011768	0.7752042111161657
0.8968898493343052	0.944433398	0.7708405326571519
0.9004195976626898	0.9434066371484592	0.7657743270540015
0.9022445305713453	0.9409321790791019	0.7600107026582554
0.9040400128185455	0.9384585339258715	0.7542488843810901
0.9058063876950267	0.9359856980174586	0.748488795
0.9075439915876081	0.933513668	0.7427303530801604
0.9092531541882961	0.9310424389570772	0.736973476
0.9109341986955012	0.9285720081672135	0.7312180786931843
0.9125874420077204	0.9261023713446762	0.7254640703672561
0.9142131949100321	0.9236335245177746	0.7197113589924472
0.9158117622537346	0.9211654636521412	0.7139598486809668
0.9173834431294333	0.918698185	0.7082094400464302
0.9189285310338712	0.9162316833484078	0.70246003
0.9204473140307808	0.9137659555200136	0.6967115118909042
0.9219400749060188	0.9113009968704242	0.6909637747599933
0.923407091	0.9088368030380889	0.6852167037573603
0.9248486359383268	0.9063733695931545	0.6794701796720233
0.9262649765988482	0.9039106920364721	0.6737240788040211
0.9276563764186841	0.9014487657985896	0.6679782727680483
0.9290230939380992	0.8989875862387242	0.6622326282866121
0.9303653832434009	0.8965271486437222	0.656487007
0.9316834940883991	0.8940674482269971	0.6507412650966458
0.9329776720118228	0.8916084801274515	0.6449952533501757
0.9342481584508671	0.8891502394083823	0.6392488165838679
0.9354951908510314	0.8866927210563659	0.6335017935400555
0.9367190027723926	0.8842359199801241	0.6277540165664308
0.9379198239924623	0.8817798310093715	0.6220053113138944
0.9390978806057632	0.8793244488936443	0.6162554964168543
0.9402533951202502	0.8768697683011074	0.610504383
0.9413865865507091	0.8744157838173418	0.6047517750934198
0.9424976705092478	0.8719624899441105	0.5989974677050167
0.9435868592929877	0.8695098810981049	0.5932412479646606
0.9446543619690699	0.8670579516096679	0.5874828939223721
0.945700384	0.8646066957214951	0.5817221742482874
0.9467251296089846	0.8621561075873143	0.575958848
0.9477287972866791	0.8597061812705399	0.5701926628542054
0.9487115844372304	0.8572569107429078	0.5644233570671261
0.9496736851659077	0.8548082898830821	0.5586506563829977
0.9506152908070821	0.8523603124752378	0.5528742746658711
0.9515365899930658	0.8499129722076224	0.5470939129847532
0.9524377687209803	0.8474662626710872	0.5413092589042805
0.9533190104177124	0.8450201773575955	0.5355199857263786
0.9541804960030363	0.8425747096587021	0.5297257516787854
0.9550224039509626	0.8401298528640088	0.5239261990459163
0.9558449103493826	0.8376856001595875	0.5181209532370754
0.9566481889580593	0.8352419446263799	0.5123096217865184
0.957010308	0.8323543409251264	0.5075535515046651
0.9567690323719057	0.82884415	0.5042845910778775
0.9565186050605058	0.8253339897685821	0.5010178344600105
0.9562590609520741	0.8218238395549079	0.4977532745925712
0.9559904345603373	0.8183136790033442	0.494490904
0.9557127601087659	0.8148034871948006	0.49123071533541623
0.9554260715345041	0.8112932428131472	0.48797270025893996
0.9551304024922364	0.8077829241363227	0.48471685053837504
0.9548257863580037	0.8042725090272012	0.4814631574824417
0.9545122562329652	0.8007619749242062	0.4782116120404158
0.9541898449471001	0.797251299	0.47496220479020085
0.9538585850628619	0.7937404573099167	0.47171492592594805
0.953518509	0.7902294264650827	0.4684697652452063
0.9531696484330089	0.7867181819386352	0.46522671213558126
0.9528120355068305	0.7832066988966065	0.46198575556088034
0.9524457016281084	0.779694952	0.45874688404672254
0.9520706780746894	0.7761829154859976	0.45551008566558554
0.9516869958777664	0.7726705629710446	0.4522753480212673
0.9512946858251904	0.7691578676239946	0.44904265823273587
0.950893778	0.7656448020611053	0.4458120029173361
0.9504843041073522	0.7621313383517916	0.44258336817332483
0.9500662928302958	0.7586174480054856	0.4393567395617028
0.9496397744803234	0.7551031019581099	0.43613210208731246
0.9492047786767682	0.7515882705581479	0.4329094401791621
0.9487613348146083	0.7480729235522975	0.42968873766994214
0.9483094720674846	0.7445570300706985	0.4264699777746961
0.9478492193906917	0.741040559	0.42325314306860023
0.9473806055241208	0.7375234770262287	0.420038215
0.9469036589951717	0.7340057525015237	0.4168251761853496
0.9464184081216297	0.7304873515445811	0.41361400574591617
0.9459248810145046	0.7269682399649289	0.41040468391968704
0.945423106	0.7234483828569281	0.40719719
0.9449131095264727	0.7199277445815129	0.40399150134545536
0.9443949203588016	0.7164062887473508	0.4007875962007959
0.9438685653894675	0.7128839781914125	0.3975854508150924
0.9433340717370453	0.7093607749589167	0.39438504083457554
0.9427914663296875	0.7058366402826333	0.3911863409835979
0.942240776	0.7023115345615193	0.3879893250291288
0.9416820270263386	0.6987854173386617	0.3847939657436318
0.941115246	0.695258247	0.38160023486623507
0.9405404591949361	0.6917299821432736	0.37840810306210604
0.9399576924520157	0.6882005787687606	0.37521753987992773
0.9393669716687805	0.6846699930391105	0.3720285137073741
0.9387683225121296	0.6811381798609052	0.3688409917244711
0.9381617704787015	0.6776050931363127	0.36565494
0.9375473408972745	0.6740706857353356	0.36247032271389074
0.9369250589311476	0.6705349094671066	0.3592871035562445
0.9362949495804953	0.6669977150501945	0.3561052442182175
0.9356570376846979	0.663459052	0.3529247050592324
0.9350113479246546	0.6599188690063559	0.3497454448995837
0.9343579048250699	0.6563771130818098	0.34656742095518017
0.9336967327567212	0.6528337303463364	0.3433905887689627
0.9330278559387051	0.649288666	0.3402149021387962
0.9323512984406642	0.6457418622814426	0.3370403130416181
0.9316670841849939	0.6421932626036198	0.3338667715536126
0.9309752369490291	0.6386428073408882	0.3306942257661597
0.9302757803672158	0.6350904358750942	0.32752262169729407
0.9295687379332587	0.6315360861359802	0.3243519031983859
0.9288541330022589	0.6279796945573731	0.3211820118557358
0.9281319887928282	0.6244211960317306	0.3180128868867515
0.927256664	0.620847457	0.31499499785969404
0.9256215712003129	0.6172048528389424	0.31275847233441423
0.9239828557757352	0.613561777	0.3105242681444477
0.9223405183256501	0.6099181850792796	0.30829239146737203
0.9206945591251207	0.6062740290608148	0.3060628485095515
0.9190449784324208	0.602629261	0.3038356455061684
0.9173917764891045	0.5989838318104143	0.3016107887212484
0.9157349535200735	0.5953376904571126	0.29938828444767984
0.9140745097336473	0.5916907850309554	0.29716813900722416
0.9124104453216337	0.5880430621495152	0.29495035875052117
0.9107427604594023	0.5843944670250938	0.29273495005708633
0.9090714553059573	0.5807449434195744	0.2905219193352988
0.90739653	0.5770944335974834	0.2883112730223826
0.9057179846800752	0.5734428782771761	0.2861030175843782
0.9040358194445103	0.5697902165800592	0.28389715951610606
0.9023500343916347	0.5661363859777477	0.2816937053411184
0.9006606295997917	0.5624813222370629	0.2794926616116436
0.8989676051314378	0.5588249593627592	0.27729403490851784
0.8972709610332255	0.5551672295378723	0.27509783184110764
0.895570697	0.5515080630615626	0.272904059
0.8938668140553512	0.5478473882843309	0.27071272319299877
0.8921593111907756	0.5441851315404734	0.26852383097281185
0.8904481887267011	0.5405212170776326	0.26633738910912386
0.8887334466321138	0.5368555669832897	0.26415340435235274
0.8870150848607516	0.5331881011080449	0.26197188348071576
0.885293103	0.5295187369855093	0.25979283330005676
0.8835675020270007	0.52584739	0.25761626064366094
0.8818382807967455	0.5221739720422728	0.25544217237205125
0.8801054395541916	0.5184983939317972	0.25327057537276637
0.8783689781783666	0.5148205628075148	0.2511014765601243
0.8766288965336809	0.5111403832846861	0.2489348828749633
0.8748851944700412	0.5074577570988829	0.2467708012843653
0.8731378718229685	0.5037725829964215	0.24460923878135837
0.8713869284137159	0.5000847566195987	0.24245020238459608
0.8696323640493928	0.4963941703864279	0.24029369913801746
0.8678741785230889	0.49270071336455007	0.23813973611048023
0.8661123716140035	0.48900427113898864	0.2359883203953705
0.8643469430875756	0.4853047256733764	0.23383945911018728
0.8625778926956204	0.48160195516426235	0.2316931593960998
0.8608052201764659	0.4778958338880864	0.22954942841747644
0.8590289252550936	0.47418623204036564	0.22740827336138375
0.8572490076432848	0.4704730155666173	0.2252697014370551
0.8554654670397686	0.46675604598450143	0.22313371987532915
0.8536783031303727	0.46303518019662465	0.2210003359280508
0.8518875155881792	0.4593102702934148	0.21886955686743953
0.8500931040736858	0.4555811633454215	0.21674138998542058
0.8482950682349671	0.45184770118435885	0.2146158425929186
0.8464934077078452	0.4481097201721405	0.21249292201910824
0.8446881221160567	0.44436705095710854	0.2103726356106267
0.8428792110714345	0.44061951821659473	0.20825499073073844
0.8410666741740846	0.4368669403848787	0.20613999475845757
0.8392505110125724	0.43310912936553086	0.2040276550876194
0.8374307211641121	0.4293458902270545	0.20191797912590315
0.835607304	0.42557702088063853	0.19981097429380257
0.8337802596596233	0.4218023117387433	0.19770664802354032
0.8319495871030463	0.41802154535312736	0.1956050077579261
0.8301152860588381	0.41423449603080426	0.19350606094915457
0.8282773560504791	0.41044092942628657	0.19140981505753962
0.8264357965913446	0.40664060210833275	0.1893162775501851
0.8245906071849294	0.4028332610992441	0.1872254558995839
0.822741787	0.3990186433845902	0.18513735758214742
0.8208893364962404	0.39519647539104535	0.18305199007665998
0.8190332541736802	0.3913664724297937	0.18096936086265308
0.8171735398237627	0.38752833810273174	0.17888947741869954
0.8153101929041919	0.38368176366842127	0.17681234722061903
0.8134432128642805	0.3798264273644566	0.17473797773959632
0.8115725991452197	0.37596199368257943	0.17266637644020466
0.809698351	0.37208811259249536	0.17059755077832953
0.807820468	0.3682044187099551	0.1685315081989903
0.8059389502091155	0.3643105304041881	0.16646825613405508
0.8040537960328185	0.36040604883926686	0.1644078019998413
0.8021650052714903	0.35649055694340254	0.1623501531945995
0.8002725773236906	0.35256361829952165	0.16029531709587322
0.79767218	0.3493731578601745	0.1595959237968431
0.7949537889407805	0.3463052567537026	0.15912276150344312
0.7922360006989317	0.34323480608496093	0.15864836238197066
0.7895188142896681	0.3401616861731802	0.15817272581538322
0.786802228	0.3370857730067952	0.1576958511710645
0.7840862416859974	0.33400693804438075	0.15721773780073306
0.7813708528095973	0.33092504800412614	0.1567383850403496
0.7786560604014464	0.32783996464105203	0.15625779221002528
0.775941863	0.3247515445110901	0.15577595861392396
0.7732282594437172	0.32165963872110237	0.15529288354016715
0.7705152480787305	0.3185640926637981	0.15480856626073494
0.7678028275508098	0.3154647457364551	0.15432300603136634
0.7650909964091014	0.31236143104223496	0.15383620209145746
0.7623797531851566	0.30925397507277613	0.1533481536639591
0.7596690963927373	0.30614219737064274	0.1528588599552704
0.7569590245276262	0.3030259101700637	0.15236832015513516
0.7542495360674285	0.2999049180142645	0.15187653343652996
0.751540629	0.2967790173475278	0.15138349895555783
0.7488323031801336	0.2936479960799494	0.15088921585133405
0.7461245556155799	0.29051163312265393	0.15039368324587485
0.7434173851806205	0.2873696978910261	0.14989690024398036
0.7407107902589729	0.28422194977326803	0.14939886593311952
0.738004769	0.2810681375613172	0.14889957938331033
0.7352993203932914	0.27790799884087525	0.14839903964699927
0.7325944421188613	0.2747412593369462	0.14789724575893928
0.729890133	0.2715676322109166	0.14739419673606532
0.7271863904108654	0.2683868173047801	0.1468898915773682
0.7244832135260089	0.2651985003276385	0.1463843292637658
0.7217806002853614	0.2620023519790839	0.1458775087579739
0.7190785489114035	0.25879802700344307	0.1453694290043734
0.7163770576054542	0.25558516316820845	0.1448600889288767
0.7136761245474401	0.25236338015918547	0.14434948743879047
0.7109757478956601	0.24913227838403107	0.1438376234226786
0.7082759257865494	0.24589143767484117	0.14332449575022144
0.7055766563344366	0.24264041587932372	0.14281010327207283
0.7028779376313031	0.23937874732878822	0.14229444481971615
0.700179768	0.23610594116970324	0.14177751920531728
0.6974821447266802	0.23282147954385846	0.1412593252215754
0.694785067	0.22952481560021265	0.1407398616415719
0.6920885313521592	0.22621537131924313	0.14021912721861676
0.6893925369740946	0.22289253512798335	0.13969712068609327
0.6866970814136264	0.2195556592809106	0.1391738407572987
0.6840021625992595	0.21620405697828765	0.1386492861252851
0.6813077784351044	0.21283699918945342	0.13812345546269575
0.6786139268006093	0.2094537111437032	0.1375963474215996
0.6759206055502879	0.2060533684457359	0.13706796063332408
0.6732278125134448	0.2026350927659321	0.1365382937082849
0.6705355454938966	0.19919794704781374	0.13600734523581265
0.667843802	0.19574093016562127	0.13547511378397778
0.6651525805928273	0.19226297095372366	0.13494159789941307
0.6624618781889599	0.18876292151613866	0.1344067961071328
0.6597716927571168	0.18523954970828066	0.13387070691034936
0.6570820219694028	0.18169153066354474	0.1333333287902878
0.6543928634707019	0.17811743721363113	0.13279466020599745
0.6517042148783806	0.1745157290226043	0.13225469959415997
0.6490160737819818	0.17088474021924066	0.13171344536889565
0.6463284377429201	0.16722266526847027	0.1311708959215665
0.643641304	0.16352754276845843	0.13062704962057634
0.6409546709399682	0.1597972367921191	0.13008190481116827
0.6382685351554663	0.15602941530667633	0.1295354598152188
0.6355828943864434	0.15222152509706938	0.12898771293102954
0.6328977460489686	0.1483707624814613	0.12843866243311566
0.6302130875290778	0.14447403893025806	0.1278883065719909
0.627528916	0.1405279404706625	0.1273366435739504
0.6248452293340498	0.13652867945853342	0.12678367164084897
0.6221620242778444	0.1324720369023161	0.12622938894987848
0.6194792982764115	0.12835329299335005	0.12567379365333964
0.6167970485606246	0.12416714277968954	0.12511688387841158
0.6141152723293017	0.1199075929389446	0.12455865772691901
0.6114339667488586	0.11556783424338168	0.12399911327509441
0.6087531289529555	0.11114008239190423	0.12343824857333846
0.6060727560421423	0.10661537713667668	0.12287606164597553
0.6033928450835013	0.10198332562830867	0.12231255049100731
0.6007133931102859	0.09723177	0.12174771307986182
0.5980343971215555	0.09234635	0.12118154735713971
0.5953558540818084	0.087309917	0.12061405124035612
0.5926777609206111	0.082101736	0.12004522261968026
0.5900001145322249	0.076696368	0.11947505935767005
];

P = size(values/256,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');