#! format: off
#! source: https://github.com/alexeyovchinnikov/SIAN-Julia

import AbstractAlgebra

function SIRSForced_with_weights(; np=AbstractAlgebra, internal_ordering=:degrevlex, k=np.QQ)
    R, (i_7,i_6,x1_6,s_6,i_5,x2_5,r_5,x1_5,s_5,i_4,x2_4,r_4,x1_4,s_4,i_3,x2_3,r_3,x1_3,s_3,i_2,x2_2,r_2,x1_2,s_2,i_1,x2_1,r_1,x1_1,s_1,i_0,x2_0,r_0,x1_0,s_0,z_aux,mu_0,b0_0,b1_0,g_0,nu_0,M_0) = np.PolynomialRing(k, [:i_7,:i_6,:x1_6,:s_6,:i_5,:x2_5,:r_5,:x1_5,:s_5,:i_4,:x2_4,:r_4,:x1_4,:s_4,:i_3,:x2_3,:r_3,:x1_3,:s_3,:i_2,:x2_2,:r_2,:x1_2,:s_2,:i_1,:x2_1,:r_1,:x1_1,:s_1,:i_0,:x2_0,:r_0,:x1_0,:s_0,:z_aux,:mu_0,:b0_0,:b1_0,:g_0,:nu_0,:M_0], ordering=ordering)
    sys = [
    		-r_0 + 14228652277668367766,
		r_0*mu_0 + r_0*g_0 - i_0*nu_0 + r_1,
		-i_0 + 13461257273418678052,
		-i_0*x1_0^2*s_0^2*b0_0*b1_0 - i_0*s_0^2*b0_0 + i_0*mu_0 + i_0*nu_0 + i_1,
		-r_1 - 556492236928720711844891372205014271070,
		r_1*mu_0 + r_1*g_0 - i_1*nu_0 + r_2,
		-i_1 + 369487220209980655717625562541517994040828422893338400317127932648370235129875463159570297007912,
		-s_1^2*i_0*x1_0^2*b0_0*b1_0 - x1_1^2*i_0*s_0^2*b0_0*b1_0 - i_1*x1_0^2*s_0^2*b0_0*b1_0 - s_1^2*i_0*b0_0 - i_1*s_0^2*b0_0 + i_1*mu_0 + i_1*nu_0 + i_2,
		i_0*x1_0^2*s_0^2*b0_0*b1_0 + i_0*s_0^2*b0_0 + s_0^2*mu_0 + s_1^2 - r_0*g_0 - mu_0,
		x2_0^3*M_0^3 + x1_1^2,
		-r_2 + 1287427625557855655710455969995083600883104303701430004311523545066464361424373044366083826177230785053239107581162,
		r_2*mu_0 + r_2*g_0 - i_2*nu_0 + r_3,
		-i_2 - 6689643753969481939376996110703392339755726337742444907752261884235084057385151886201365791146934792988366524670579339149800147233220585561993030891437082415866566314994776,
		-2*x1_1^2*s_1^2*i_0*b0_0*b1_0 - 2*i_1*s_1^2*x1_0^2*b0_0*b1_0 - s_2^2*i_0*x1_0^2*b0_0*b1_0 - 2*i_1*x1_1^2*s_0^2*b0_0*b1_0 - x1_2^2*i_0*s_0^2*b0_0*b1_0 - i_2*x1_0^2*s_0^2*b0_0*b1_0 - 2*i_1*s_1^2*b0_0 - s_2^2*i_0*b0_0 - i_2*s_0^2*b0_0 + i_2*mu_0 + i_2*nu_0 + i_3,
		x2_1^3*M_0^3 + x1_2^2,
		s_1^2*i_0*x1_0^2*b0_0*b1_0 + x1_1^2*i_0*s_0^2*b0_0*b1_0 + i_1*x1_0^2*s_0^2*b0_0*b1_0 + s_1^2*i_0*b0_0 + i_1*s_0^2*b0_0 + s_1^2*mu_0 + s_2^2 - r_1*g_0,
		-x1_0^2*M_0^3 + x2_1^3,
		-i_3 - 802865771704293050829789597960467005739308850935416544063025592935694103467033942968815897039452745814746460580226988531728218516867443735056113550753127932380417195284192990496874984144835059658316980184927817679630625276125233914554345161082101336,
		-6*i_1*x1_1^2*s_1^2*b0_0*b1_0 - 3*s_2^2*x1_1^2*i_0*b0_0*b1_0 - 3*x1_2^2*s_1^2*i_0*b0_0*b1_0 - 3*s_2^2*i_1*x1_0^2*b0_0*b1_0 - 3*i_2*s_1^2*x1_0^2*b0_0*b1_0 - s_3^2*i_0*x1_0^2*b0_0*b1_0 - 3*x1_2^2*i_1*s_0^2*b0_0*b1_0 - 3*i_2*x1_1^2*s_0^2*b0_0*b1_0 - x1_3^2*i_0*s_0^2*b0_0*b1_0 - i_3*x1_0^2*s_0^2*b0_0*b1_0 - 3*s_2^2*i_1*b0_0 - 3*i_2*s_1^2*b0_0 - s_3^2*i_0*b0_0 - i_3*s_0^2*b0_0 + i_3*mu_0 + i_3*nu_0 + i_4,
		x2_2^3*M_0^3 + x1_3^2,
		2*x1_1^2*s_1^2*i_0*b0_0*b1_0 + 2*i_1*s_1^2*x1_0^2*b0_0*b1_0 + s_2^2*i_0*x1_0^2*b0_0*b1_0 + 2*i_1*x1_1^2*s_0^2*b0_0*b1_0 + x1_2^2*i_0*s_0^2*b0_0*b1_0 + i_2*x1_0^2*s_0^2*b0_0*b1_0 + 2*i_1*s_1^2*b0_0 + s_2^2*i_0*b0_0 + i_2*s_0^2*b0_0 + s_2^2*mu_0 + s_3^2 - r_2*g_0,
		-x1_1^2*M_0^3 + x2_2^3,
		-i_4 + 64722782173804371410554447682841594833293387267390493049639705700857310794545989962378503784264863059164642835202798960626823780631483748274984307465203448541205984942315888739171903387733276334902602959584066594989206052434386096836563938507306752900765678456169151247549304603307844505633283712162323396567025499855519032744,
		-12*s_2^2*i_1*x1_1^2*b0_0*b1_0 - 12*x1_2^2*i_1*s_1^2*b0_0*b1_0 - 12*i_2*x1_1^2*s_1^2*b0_0*b1_0 - 6*x1_2^2*s_2^2*i_0*b0_0*b1_0 - 4*s_3^2*x1_1^2*i_0*b0_0*b1_0 - 4*x1_3^2*s_1^2*i_0*b0_0*b1_0 - 6*i_2*s_2^2*x1_0^2*b0_0*b1_0 - 4*s_3^2*i_1*x1_0^2*b0_0*b1_0 - 4*i_3*s_1^2*x1_0^2*b0_0*b1_0 - s_4^2*i_0*x1_0^2*b0_0*b1_0 - 6*i_2*x1_2^2*s_0^2*b0_0*b1_0 - 4*x1_3^2*i_1*s_0^2*b0_0*b1_0 - 4*i_3*x1_1^2*s_0^2*b0_0*b1_0 - x1_4^2*i_0*s_0^2*b0_0*b1_0 - i_4*x1_0^2*s_0^2*b0_0*b1_0 - 6*i_2*s_2^2*b0_0 - 4*s_3^2*i_1*b0_0 - 4*i_3*s_1^2*b0_0 - s_4^2*i_0*b0_0 - i_4*s_0^2*b0_0 + i_4*mu_0 + i_4*nu_0 + i_5,
		6*i_1*x1_1^2*s_1^2*b0_0*b1_0 + 3*s_2^2*x1_1^2*i_0*b0_0*b1_0 + 3*x1_2^2*s_1^2*i_0*b0_0*b1_0 + 3*s_2^2*i_1*x1_0^2*b0_0*b1_0 + 3*i_2*s_1^2*x1_0^2*b0_0*b1_0 + s_3^2*i_0*x1_0^2*b0_0*b1_0 + 3*x1_2^2*i_1*s_0^2*b0_0*b1_0 + 3*i_2*x1_1^2*s_0^2*b0_0*b1_0 + x1_3^2*i_0*s_0^2*b0_0*b1_0 + i_3*x1_0^2*s_0^2*b0_0*b1_0 + 3*s_2^2*i_1*b0_0 + 3*i_2*s_1^2*b0_0 + s_3^2*i_0*b0_0 + i_3*s_0^2*b0_0 + s_3^2*mu_0 + s_4^2 - r_3*g_0,
		x2_3^3*M_0^3 + x1_4^2,
		-x1_2^2*M_0^3 + x2_3^3,
		-i_5 + 5950501276454894133003249411598133023022916452700300922718878516428966088007398045153392849497325194797094368148407091464963455586922793565029831059751683948962036696131037228504494180358954754666042577527734005747571002124685849886698373796609217650086326719571801845809379965200384995097973845046659113648475076872725749615567395190083576372779964391593742294020364523962178865398941788917266146166248,
		-30*x1_2^2*s_2^2*i_1*b0_0*b1_0 - 30*i_2*s_2^2*x1_1^2*b0_0*b1_0 - 20*s_3^2*i_1*x1_1^2*b0_0*b1_0 - 30*i_2*x1_2^2*s_1^2*b0_0*b1_0 - 20*x1_3^2*i_1*s_1^2*b0_0*b1_0 - 20*i_3*x1_1^2*s_1^2*b0_0*b1_0 - 10*s_3^2*x1_2^2*i_0*b0_0*b1_0 - 10*x1_3^2*s_2^2*i_0*b0_0*b1_0 - 5*s_4^2*x1_1^2*i_0*b0_0*b1_0 - 5*x1_4^2*s_1^2*i_0*b0_0*b1_0 - 10*s_3^2*i_2*x1_0^2*b0_0*b1_0 - 10*i_3*s_2^2*x1_0^2*b0_0*b1_0 - 5*s_4^2*i_1*x1_0^2*b0_0*b1_0 - 5*i_4*s_1^2*x1_0^2*b0_0*b1_0 - s_5^2*i_0*x1_0^2*b0_0*b1_0 - 10*x1_3^2*i_2*s_0^2*b0_0*b1_0 - 10*i_3*x1_2^2*s_0^2*b0_0*b1_0 - 5*x1_4^2*i_1*s_0^2*b0_0*b1_0 - 5*i_4*x1_1^2*s_0^2*b0_0*b1_0 - x1_5^2*i_0*s_0^2*b0_0*b1_0 - i_5*x1_0^2*s_0^2*b0_0*b1_0 - 10*s_3^2*i_2*b0_0 - 10*i_3*s_2^2*b0_0 - 5*s_4^2*i_1*b0_0 - 5*i_4*s_1^2*b0_0 - s_5^2*i_0*b0_0 - i_5*s_0^2*b0_0 + i_5*mu_0 + i_5*nu_0 + i_6,
		12*s_2^2*i_1*x1_1^2*b0_0*b1_0 + 12*x1_2^2*i_1*s_1^2*b0_0*b1_0 + 12*i_2*x1_1^2*s_1^2*b0_0*b1_0 + 6*x1_2^2*s_2^2*i_0*b0_0*b1_0 + 4*s_3^2*x1_1^2*i_0*b0_0*b1_0 + 4*x1_3^2*s_1^2*i_0*b0_0*b1_0 + 6*i_2*s_2^2*x1_0^2*b0_0*b1_0 + 4*s_3^2*i_1*x1_0^2*b0_0*b1_0 + 4*i_3*s_1^2*x1_0^2*b0_0*b1_0 + s_4^2*i_0*x1_0^2*b0_0*b1_0 + 6*i_2*x1_2^2*s_0^2*b0_0*b1_0 + 4*x1_3^2*i_1*s_0^2*b0_0*b1_0 + 4*i_3*x1_1^2*s_0^2*b0_0*b1_0 + x1_4^2*i_0*s_0^2*b0_0*b1_0 + i_4*x1_0^2*s_0^2*b0_0*b1_0 + 6*i_2*s_2^2*b0_0 + 4*s_3^2*i_1*b0_0 + 4*i_3*s_1^2*b0_0 + s_4^2*i_0*b0_0 + i_4*s_0^2*b0_0 + s_4^2*mu_0 + s_5^2 - r_4*g_0,
		x2_4^3*M_0^3 + x1_5^2,
		r_3*mu_0 + r_3*g_0 - i_3*nu_0 + r_4,
		-x1_3^2*M_0^3 + x2_4^3,
		-i_6 - 1280507704458584217442017505729219976028714671565842381883996715813762733207368233370687005048247958900548316705220402933603167505861386897306188360258051838689722576560372908337780382633035390391791134036593860392386944397746019051114696805635626208135751499626898757783758116113917787878566903871657465978201841443428047099417738276062920924013017147227721208547942288665924157682142852230200670152333972105235723184687393726728960894713611188864937478066483899599091749625457112,
		-90*i_2*x1_2^2*s_2^2*b0_0*b1_0 - 60*s_3^2*x1_2^2*i_1*b0_0*b1_0 - 60*x1_3^2*s_2^2*i_1*b0_0*b1_0 - 60*s_3^2*i_2*x1_1^2*b0_0*b1_0 - 60*i_3*s_2^2*x1_1^2*b0_0*b1_0 - 30*s_4^2*i_1*x1_1^2*b0_0*b1_0 - 60*x1_3^2*i_2*s_1^2*b0_0*b1_0 - 60*i_3*x1_2^2*s_1^2*b0_0*b1_0 - 30*x1_4^2*i_1*s_1^2*b0_0*b1_0 - 30*i_4*x1_1^2*s_1^2*b0_0*b1_0 - 20*x1_3^2*s_3^2*i_0*b0_0*b1_0 - 15*s_4^2*x1_2^2*i_0*b0_0*b1_0 - 15*x1_4^2*s_2^2*i_0*b0_0*b1_0 - 6*s_5^2*x1_1^2*i_0*b0_0*b1_0 - 6*x1_5^2*s_1^2*i_0*b0_0*b1_0 - 20*i_3*s_3^2*x1_0^2*b0_0*b1_0 - 15*s_4^2*i_2*x1_0^2*b0_0*b1_0 - 15*i_4*s_2^2*x1_0^2*b0_0*b1_0 - 6*s_5^2*i_1*x1_0^2*b0_0*b1_0 - 6*i_5*s_1^2*x1_0^2*b0_0*b1_0 - s_6^2*i_0*x1_0^2*b0_0*b1_0 - 20*i_3*x1_3^2*s_0^2*b0_0*b1_0 - 15*x1_4^2*i_2*s_0^2*b0_0*b1_0 - 15*i_4*x1_2^2*s_0^2*b0_0*b1_0 - 6*x1_5^2*i_1*s_0^2*b0_0*b1_0 - 6*i_5*x1_1^2*s_0^2*b0_0*b1_0 - x1_6^2*i_0*s_0^2*b0_0*b1_0 - i_6*x1_0^2*s_0^2*b0_0*b1_0 - 20*i_3*s_3^2*b0_0 - 15*s_4^2*i_2*b0_0 - 15*i_4*s_2^2*b0_0 - 6*s_5^2*i_1*b0_0 - 6*i_5*s_1^2*b0_0 - s_6^2*i_0*b0_0 - i_6*s_0^2*b0_0 + i_6*mu_0 + i_6*nu_0 + i_7,
		x2_5^3*M_0^3 + x1_6^2,
		30*x1_2^2*s_2^2*i_1*b0_0*b1_0 + 30*i_2*s_2^2*x1_1^2*b0_0*b1_0 + 20*s_3^2*i_1*x1_1^2*b0_0*b1_0 + 30*i_2*x1_2^2*s_1^2*b0_0*b1_0 + 20*x1_3^2*i_1*s_1^2*b0_0*b1_0 + 20*i_3*x1_1^2*s_1^2*b0_0*b1_0 + 10*s_3^2*x1_2^2*i_0*b0_0*b1_0 + 10*x1_3^2*s_2^2*i_0*b0_0*b1_0 + 5*s_4^2*x1_1^2*i_0*b0_0*b1_0 + 5*x1_4^2*s_1^2*i_0*b0_0*b1_0 + 10*s_3^2*i_2*x1_0^2*b0_0*b1_0 + 10*i_3*s_2^2*x1_0^2*b0_0*b1_0 + 5*s_4^2*i_1*x1_0^2*b0_0*b1_0 + 5*i_4*s_1^2*x1_0^2*b0_0*b1_0 + s_5^2*i_0*x1_0^2*b0_0*b1_0 + 10*x1_3^2*i_2*s_0^2*b0_0*b1_0 + 10*i_3*x1_2^2*s_0^2*b0_0*b1_0 + 5*x1_4^2*i_1*s_0^2*b0_0*b1_0 + 5*i_4*x1_1^2*s_0^2*b0_0*b1_0 + x1_5^2*i_0*s_0^2*b0_0*b1_0 + i_5*x1_0^2*s_0^2*b0_0*b1_0 + 10*s_3^2*i_2*b0_0 + 10*i_3*s_2^2*b0_0 + 5*s_4^2*i_1*b0_0 + 5*i_4*s_1^2*b0_0 + s_5^2*i_0*b0_0 + i_5*s_0^2*b0_0 + s_5^2*mu_0 + s_6^2 - r_5*g_0,
		r_4*mu_0 + r_4*g_0 - i_4*nu_0 + r_5,
		-x1_4^2*M_0^3 + x2_5^3,
		-r_3 - 23309147659035135095794022551795317670740991551825312531516625496963544063543339976478531887980594888469526682272528566377865104223664561788960015532908827013124755622294724943793652245996430,
		-r_4 - 2797475846443396888436292522072908998691412109534827608035442929640987524167448842365978855956406594637173135490399592970633353925004849648774733920734011408156905825918243076699774521168053295357634339304813179899613695555227005327594381407357467835426242871442068806,
		-r_5 + 225517672102880636912435864837497076134688389968294091992756852313279622025616588308860095216348992705972065379128997871743407279593497026733887031711673391024280562125912555584556562641694881638022958490733198526865412094020084886603260153462399055628585797442181902214827392005200737748786035115645184123742648480346989575710944916317987109826,
		-i_7 - 65770004229417401930338881384139256200509846277026547246387836446884209427048400981691879519445552327318095293274031606043586739579523965361460584344276173035457182993612977516452031130811868888719457664116415063076744329400932226326345984214050488118892588549578649711890398656201129499954115819344783577541646858794073503912955583607084816025581189879653358495897101050034702195885741156283549197600170330696549619957704270997870853319156930255422896724302777229715777944129255358052075820441790191210269375481170818451618700414273260925432733779214083352,
		z_aux - 1
    ]
end
