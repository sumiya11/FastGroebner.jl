#! format: off
#! source: https://github.com/alexeyovchinnikov/SIAN-Julia

import AbstractAlgebra

function Goodwin_with_weights(; np=AbstractAlgebra, internal_ordering=:degrevlex, k=np.QQ)
    R, (x1_9,x1_8,x4_8,x1_7,x2_7,x3_7,x4_7,x1_6,x2_6,x3_6,x4_6,x1_5,x2_5,x3_5,x4_5,x1_4,x2_4,x3_4,x4_4,x1_3,x2_3,x3_3,x4_3,x1_2,x2_2,x3_2,x4_2,x1_1,x2_1,x3_1,x4_1,x1_0,x2_0,x3_0,x4_0,z_aux,b_0,c_0,alpha_0,beta_0,gama_0,delta_0,sigma_0) = np.PolynomialRing(k, [:x1_9,:x1_8,:x4_8,:x1_7,:x2_7,:x3_7,:x4_7,:x1_6,:x2_6,:x3_6,:x4_6,:x1_5,:x2_5,:x3_5,:x4_5,:x1_4,:x2_4,:x3_4,:x4_4,:x1_3,:x2_3,:x3_3,:x4_3,:x1_2,:x2_2,:x3_2,:x4_2,:x1_1,:x2_1,:x3_1,:x4_1,:x1_0,:x2_0,:x3_0,:x4_0,:z_aux,:b_0,:c_0,:alpha_0,:beta_0,:gama_0,:delta_0,:sigma_0], ordering=ordering)
    sys = [
    		-x1_0 + 66626618109538133133,
		x1_0*x4_0^2*b_0 + x1_1*x4_0^2 + x1_0*b_0*c_0 + x1_1*c_0 - 1,
		-x1_1 - k(109365372900331087094671182948099025791485844124302772199831)//k(20532014486747450052),
		x4_1^2*x1_0*b_0 + x1_1*x4_0^2*b_0 + x1_1*x4_1^2 + x1_2*x4_0^2 + x1_1*b_0*c_0 + x1_2*c_0,
		-x2_0^3*x4_0^2*gama_0*sigma_0 + x3_0^3*x4_0^2*delta_0*sigma_0 + x4_1^2*x3_0^3,
		-x1_2 + k(700046698782145700339511765019070604588317901871928458981218413415494465333157989305079273556783733467711209787417995)//k(1643910726782351006692742235907081361548497842545856874048),
		2*x1_1*x4_1^2*b_0 + x4_2^2*x1_0*b_0 + x1_2*x4_0^2*b_0 + x4_2^2*x1_1 + 2*x1_2*x4_1^2 + x1_3*x4_0^2 + x1_2*b_0*c_0 + x1_3*c_0,
		-x4_1^2*x2_0^3*gama_0*sigma_0 - x2_1^3*x4_0^2*gama_0*sigma_0 + x4_1^2*x3_0^3*delta_0*sigma_0 + x3_1^3*x4_0^2*delta_0*sigma_0 + x3_1^3*x4_1^2 + x4_2^2*x3_0^3,
		x2_0^3*beta_0^4 + x2_1^3 - x1_0*alpha_0,
		-x2_0^3*gama_0 + x3_0^3*delta_0 + x3_1^3,
		-x1_3 - k(746832029613852051468613943547303704721851393864042529307888871434982983597843743482981840300040737111171058150705189565199900965660717911805427355150537058230893366173423925)//k(21936818712831695217261846127345386652907426055379126084735493887806963489926767660633850107392),
		3*x4_2^2*x1_1*b_0 + 3*x1_2*x4_1^2*b_0 + x4_3^2*x1_0*b_0 + x1_3*x4_0^2*b_0 + 3*x1_2*x4_2^2 + x4_3^2*x1_1 + 3*x1_3*x4_1^2 + x1_4*x4_0^2 + x1_3*b_0*c_0 + x1_4*c_0,
		-2*x2_1^3*x4_1^2*gama_0*sigma_0 - x4_2^2*x2_0^3*gama_0*sigma_0 - x2_2^3*x4_0^2*gama_0*sigma_0 + 2*x3_1^3*x4_1^2*delta_0*sigma_0 + x4_2^2*x3_0^3*delta_0*sigma_0 + x3_2^3*x4_0^2*delta_0*sigma_0 + 2*x4_2^2*x3_1^3 + x3_2^3*x4_1^2 + x4_3^2*x3_0^3,
		x2_1^3*beta_0^4 + x2_2^3 - x1_1*alpha_0,
		-x2_1^3*gama_0 + x3_1^3*delta_0 + x3_2^3,
		-x1_4 + k(14400496282353147779240440064051517594542619061482302119481500918335678783139767285489155810529354387115922947240349381533886315899816080905890011513422804140647502909509376093755145644195474010268903020157172111149233576536203218793)//k(5269162207650950409816206966484017258892742291065923526300892532467949058939610946177006000036951932644775528967156598985881002778624),
		6*x1_2*x4_2^2*b_0 + 4*x4_3^2*x1_1*b_0 + 4*x1_3*x4_1^2*b_0 + x4_4^2*x1_0*b_0 + x1_4*x4_0^2*b_0 + 4*x4_3^2*x1_2 + 6*x1_3*x4_2^2 + x4_4^2*x1_1 + 4*x1_4*x4_1^2 + x1_5*x4_0^2 + x1_4*b_0*c_0 + x1_5*c_0,
		-3*x4_2^2*x2_1^3*gama_0*sigma_0 - 3*x2_2^3*x4_1^2*gama_0*sigma_0 - x4_3^2*x2_0^3*gama_0*sigma_0 - x2_3^3*x4_0^2*gama_0*sigma_0 + 3*x4_2^2*x3_1^3*delta_0*sigma_0 + 3*x3_2^3*x4_1^2*delta_0*sigma_0 + x4_3^2*x3_0^3*delta_0*sigma_0 + x3_3^3*x4_0^2*delta_0*sigma_0 + 3*x3_2^3*x4_2^2 + 3*x4_3^2*x3_1^3 + x3_3^3*x4_1^2 + x4_4^2*x3_0^3,
		-x2_2^3*gama_0 + x3_2^3*delta_0 + x3_3^3,
		x2_2^3*beta_0^4 + x2_3^3 - x1_2*alpha_0,
		-x1_5 + k(6023146484867968982831395072975853459840428675793078655027031200915625335251026264995591788314817061012960143127465896778104301317190807787359147785084035892219997768561722127990674883087817275061642343495909207835010250562445419129856000180674740973000608844919335360292523100181672948353464614971220671779)//k(105469829566706030449828814232727792805929839103607170061003122354503588455876618384576557910763445930104623404066672449815409164413677718859087964596894741231747453190144),
		10*x4_3^2*x1_2*b_0 + 10*x1_3*x4_2^2*b_0 + 5*x4_4^2*x1_1*b_0 + 5*x1_4*x4_1^2*b_0 + x4_5^2*x1_0*b_0 + x1_5*x4_0^2*b_0 + 10*x1_3*x4_3^2 + 5*x4_4^2*x1_2 + 10*x1_4*x4_2^2 + x4_5^2*x1_1 + 5*x1_5*x4_1^2 + x1_6*x4_0^2 + x1_5*b_0*c_0 + x1_6*c_0,
		-6*x2_2^3*x4_2^2*gama_0*sigma_0 - 4*x4_3^2*x2_1^3*gama_0*sigma_0 - 4*x2_3^3*x4_1^2*gama_0*sigma_0 - x4_4^2*x2_0^3*gama_0*sigma_0 - x2_4^3*x4_0^2*gama_0*sigma_0 + 6*x3_2^3*x4_2^2*delta_0*sigma_0 + 4*x4_3^2*x3_1^3*delta_0*sigma_0 + 4*x3_3^3*x4_1^2*delta_0*sigma_0 + x4_4^2*x3_0^3*delta_0*sigma_0 + x3_4^3*x4_0^2*delta_0*sigma_0 + 6*x4_3^2*x3_2^3 + 4*x3_3^3*x4_2^2 + 4*x4_4^2*x3_1^3 + x3_4^3*x4_1^2 + x4_5^2*x3_0^3,
		-x2_3^3*gama_0 + x3_3^3*delta_0 + x3_4^3,
		x2_3^3*beta_0^4 + x2_4^3 - x1_3*alpha_0,
		-x1_6 + k(253949913262840323088574863777035021031954734282314408183787308682017877732179958729999565627829424377744430379593102942481557434380050527427389510359095048100556631522108698594500953750237585970360542368910419442925329493834675973473913093385116882696735396338749992298879460076980869416976912998032080964055940429022340750367620324990842004351034250664637608520392629227630991313557)//k(8444518889684488176011846605598492563045475803377931581512194493985531879976633361612792818682212573986093149138098413137707835069293281368636953083499711979427409877779945874471845453307638156373674078765056),
		20*x1_3*x4_3^2*b_0 + 15*x4_4^2*x1_2*b_0 + 15*x1_4*x4_2^2*b_0 + 6*x4_5^2*x1_1*b_0 + 6*x1_5*x4_1^2*b_0 + x4_6^2*x1_0*b_0 + x1_6*x4_0^2*b_0 + 15*x4_4^2*x1_3 + 20*x1_4*x4_3^2 + 6*x4_5^2*x1_2 + 15*x1_5*x4_2^2 + x4_6^2*x1_1 + 6*x1_6*x4_1^2 + x1_7*x4_0^2 + x1_6*b_0*c_0 + x1_7*c_0,
		-10*x4_3^2*x2_2^3*gama_0*sigma_0 - 10*x2_3^3*x4_2^2*gama_0*sigma_0 - 5*x4_4^2*x2_1^3*gama_0*sigma_0 - 5*x2_4^3*x4_1^2*gama_0*sigma_0 - x4_5^2*x2_0^3*gama_0*sigma_0 - x2_5^3*x4_0^2*gama_0*sigma_0 + 10*x4_3^2*x3_2^3*delta_0*sigma_0 + 10*x3_3^3*x4_2^2*delta_0*sigma_0 + 5*x4_4^2*x3_1^3*delta_0*sigma_0 + 5*x3_4^3*x4_1^2*delta_0*sigma_0 + x4_5^2*x3_0^3*delta_0*sigma_0 + x3_5^3*x4_0^2*delta_0*sigma_0 + 10*x3_3^3*x4_3^2 + 10*x4_4^2*x3_2^3 + 5*x3_4^3*x4_2^2 + 5*x4_5^2*x3_1^3 + x3_5^3*x4_1^2 + x4_6^2*x3_0^3,
		x2_4^3*beta_0^4 + x2_5^3 - x1_4*alpha_0,
		-x2_4^3*gama_0 + x3_4^3*delta_0 + x3_5^3,
		-x1_7 - k(121666364780579037201618891345504960968107797254699155205895968421189028955557603093854243603214720972195545210999472311147263143262522705177829447965841688225081819816791643225692481042571672286399621474800225009939636012375612436733407971481545257067325917538109866979012665403604268770054516144410900784075735332150384593144957503364412194553880477271088774944909630657666985161908907917526367546169334191425080570985591466738945720763238706673089596743029443)//k(338058284398464342634237460051035882962821424940867702737940688189897411835746130255995754001942685562871984955545276090349686810895527222299247607721903370611530697697112014593813084860842123183476550820848674364930866131300064595142068112719872),
		35*x4_4^2*x1_3*b_0 + 35*x1_4*x4_3^2*b_0 + 21*x4_5^2*x1_2*b_0 + 21*x1_5*x4_2^2*b_0 + 7*x4_6^2*x1_1*b_0 + 7*x1_6*x4_1^2*b_0 + x4_7^2*x1_0*b_0 + x1_7*x4_0^2*b_0 + 35*x1_4*x4_4^2 + 21*x4_5^2*x1_3 + 35*x1_5*x4_3^2 + 7*x4_6^2*x1_2 + 21*x1_6*x4_2^2 + x4_7^2*x1_1 + 7*x1_7*x4_1^2 + x1_8*x4_0^2 + x1_7*b_0*c_0 + x1_8*c_0,
		-20*x2_3^3*x4_3^2*gama_0*sigma_0 - 15*x4_4^2*x2_2^3*gama_0*sigma_0 - 15*x2_4^3*x4_2^2*gama_0*sigma_0 - 6*x4_5^2*x2_1^3*gama_0*sigma_0 - 6*x2_5^3*x4_1^2*gama_0*sigma_0 - x4_6^2*x2_0^3*gama_0*sigma_0 - x2_6^3*x4_0^2*gama_0*sigma_0 + 20*x3_3^3*x4_3^2*delta_0*sigma_0 + 15*x4_4^2*x3_2^3*delta_0*sigma_0 + 15*x3_4^3*x4_2^2*delta_0*sigma_0 + 6*x4_5^2*x3_1^3*delta_0*sigma_0 + 6*x3_5^3*x4_1^2*delta_0*sigma_0 + x4_6^2*x3_0^3*delta_0*sigma_0 + x3_6^3*x4_0^2*delta_0*sigma_0 + 20*x4_4^2*x3_3^3 + 15*x3_4^3*x4_3^2 + 15*x4_5^2*x3_2^3 + 6*x3_5^3*x4_2^2 + 6*x4_6^2*x3_1^3 + x3_6^3*x4_1^2 + x4_7^2*x3_0^3,
		-x2_5^3*gama_0 + x3_5^3*delta_0 + x3_6^3,
		x2_5^3*beta_0^4 + x2_6^3 - x1_5*alpha_0,
		-x1_8 - k(1035478426339532804280184425675865212583192915679354737011282251768492971659500295192883199178837870042316593767404434135839502034165360094555662944021415613923971520828829759859200678256806858872793173201520764955351575794871599304992700879752149237346260831272097084348101519836269315550398293457515278349705693029148551716663479630565103093831227504859508525747907421333476785031504646003998709330663881303776233995302032290120641287277558916223602660599661879631991614501351459525563588307585853179639238170094472370248825687845888525)//k(1002477159211585928057936315784867313939782158331411691253395651104546961303476537643951251274759542426673822147953537622807982818892001485731340326345370249669999250300655893874635217205774850859399132984297060844138082946659677229672722667405027229797464480024009081242726447448064),
		70*x1_4*x4_4^2*b_0 + 56*x4_5^2*x1_3*b_0 + 56*x1_5*x4_3^2*b_0 + 28*x4_6^2*x1_2*b_0 + 28*x1_6*x4_2^2*b_0 + 8*x4_7^2*x1_1*b_0 + 8*x1_7*x4_1^2*b_0 + x4_8^2*x1_0*b_0 + x1_8*x4_0^2*b_0 + 56*x4_5^2*x1_4 + 70*x1_5*x4_4^2 + 28*x4_6^2*x1_3 + 56*x1_6*x4_3^2 + 8*x4_7^2*x1_2 + 28*x1_7*x4_2^2 + x4_8^2*x1_1 + 8*x1_8*x4_1^2 + x1_9*x4_0^2 + x1_8*b_0*c_0 + x1_9*c_0,
		-35*x4_4^2*x2_3^3*gama_0*sigma_0 - 35*x2_4^3*x4_3^2*gama_0*sigma_0 - 21*x4_5^2*x2_2^3*gama_0*sigma_0 - 21*x2_5^3*x4_2^2*gama_0*sigma_0 - 7*x4_6^2*x2_1^3*gama_0*sigma_0 - 7*x2_6^3*x4_1^2*gama_0*sigma_0 - x4_7^2*x2_0^3*gama_0*sigma_0 - x2_7^3*x4_0^2*gama_0*sigma_0 + 35*x4_4^2*x3_3^3*delta_0*sigma_0 + 35*x3_4^3*x4_3^2*delta_0*sigma_0 + 21*x4_5^2*x3_2^3*delta_0*sigma_0 + 21*x3_5^3*x4_2^2*delta_0*sigma_0 + 7*x4_6^2*x3_1^3*delta_0*sigma_0 + 7*x3_6^3*x4_1^2*delta_0*sigma_0 + x4_7^2*x3_0^3*delta_0*sigma_0 + x3_7^3*x4_0^2*delta_0*sigma_0 + 35*x3_4^3*x4_4^2 + 35*x4_5^2*x3_3^3 + 21*x3_5^3*x4_3^2 + 21*x4_6^2*x3_2^3 + 7*x3_6^3*x4_2^2 + 7*x4_7^2*x3_1^3 + x3_7^3*x4_1^2 + x4_8^2*x3_0^3,
		-x2_6^3*gama_0 + x3_6^3*delta_0 + x3_7^3,
		x2_6^3*beta_0^4 + x2_7^3 - x1_6*alpha_0,
		-x1_9 + k(74498781299447588606588752974911930670277856803642844339909705301308548240554872329687775913191115501078578240897919561056135671823288981781246290384559929160172441876921532712805754611079471528573837636495175797816357679171877191693241936172759683737163552555041129791142697756563432473275798260805176836905469839505534348763789895151148761693528397708899825983488347397557503480751294060701474762176019247748646004831690933150503768771039290159708433683307227220068724618779227639372844273945676326911995918286827612406310569470979586395325145160102199899416795812552081561134366302548834799830328753962802162295)//k(30099024558317116707323832373444070201560469097079658125143427669949259251197216121216796228195086343457976491681632586935429455336434256495349995437638886080316189055707152086758344142451695886597267848791450868314255912444883882862663815068204672969810371079224322972046994652220833761909795444682289947002438393266176),
		x3_0^3*x4_0^2*z_aux + x3_0^3*z_aux*c_0 - 1
    ]
end
