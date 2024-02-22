#! format: off
#! source: https://github.com/alexeyovchinnikov/SIAN-Julia

import AbstractAlgebra

function COVID_m1(; np=AbstractAlgebra, internal_ordering=:degrevlex, k=np.QQ)
    R, (I_7,I_6,x1_6,S_6,I_5,x2_5,R_5,x1_5,S_5,I_4,x2_4,R_4,x1_4,S_4,I_3,x2_3,R_3,x1_3,S_3,I_2,x2_2,R_2,x1_2,S_2,I_1,x2_1,R_1,x1_1,S_1,I_0,x2_0,R_0,x1_0,S_0,z_aux,mu_0,b_0_0,b_1_0,g_0,v_0,M_0) = np.PolynomialRing(k, [:I_7,:I_6,:x1_6,:S_6,:I_5,:x2_5,:R_5,:x1_5,:S_5,:I_4,:x2_4,:R_4,:x1_4,:S_4,:I_3,:x2_3,:R_3,:x1_3,:S_3,:I_2,:x2_2,:R_2,:x1_2,:S_2,:I_1,:x2_1,:R_1,:x1_1,:S_1,:I_0,:x2_0,:R_0,:x1_0,:S_0,:z_aux,:mu_0,:b_0_0,:b_1_0,:g_0,:v_0,:M_0], ordering=ordering)
    sys = [
    		-R_0 + 266151937559036351231,
		R_0*mu_0 + R_0*g_0 - I_0*v_0 + R_1,
		-I_0 + 52541355166892026801,
		-I_0*x1_0*S_0*b_0_0*b_1_0 - I_0*S_0*b_0_0 + I_0*mu_0 + I_0*v_0 + I_1,
		-R_1 - 92922358035875089299116866916225677267946,
		R_1*mu_0 + R_1*g_0 - I_1*v_0 + R_2,
		-I_1 + 823161420419878207964094701736923138454848428813583371666825248981147837662036024753900436386851508,
		-S_1*I_0*x1_0*b_0_0*b_1_0 - x1_1*I_0*S_0*b_0_0*b_1_0 - I_1*x1_0*S_0*b_0_0*b_1_0 - S_1*I_0*b_0_0 - I_1*S_0*b_0_0 + I_1*mu_0 + I_1*v_0 + I_2,
		I_0*x1_0*S_0*b_0_0*b_1_0 + I_0*S_0*b_0_0 + S_0*mu_0 - R_0*g_0 + S_1 - mu_0,
		x2_0*M_0 + x1_1,
		-R_2 + 28540102914435184709537590014487768100208352417703256209066566233017532409937905040762755553318863751715156260342156174,
		R_2*mu_0 + R_2*g_0 - I_2*v_0 + R_3,
		-I_2 + 9777378784657652837276298124939192924700299225063664258403438683557243588381181743598744233477029261238760622866759806326499790625739950940029029680336868457683590041734799168592,
		-2*x1_1*S_1*I_0*b_0_0*b_1_0 - 2*I_1*S_1*x1_0*b_0_0*b_1_0 - S_2*I_0*x1_0*b_0_0*b_1_0 - 2*I_1*x1_1*S_0*b_0_0*b_1_0 - x1_2*I_0*S_0*b_0_0*b_1_0 - I_2*x1_0*S_0*b_0_0*b_1_0 - 2*I_1*S_1*b_0_0 - S_2*I_0*b_0_0 - I_2*S_0*b_0_0 + I_2*mu_0 + I_2*v_0 + I_3,
		x2_1*M_0 + x1_2,
		S_1*I_0*x1_0*b_0_0*b_1_0 + x1_1*I_0*S_0*b_0_0*b_1_0 + I_1*x1_0*S_0*b_0_0*b_1_0 + S_1*I_0*b_0_0 + I_1*S_0*b_0_0 + S_1*mu_0 - R_1*g_0 + S_2,
		-x1_0*M_0 + x2_1,
		-I_3 + 18402960312646449892792631205231014236345047304171580000958678660534948369345469465194528057442149936449298450714851638967257083118186016028836913918233779944435379817915953665899103789371763216013776384775282272278363548856881697441605787413087865456139072,
		-6*I_1*x1_1*S_1*b_0_0*b_1_0 - 3*S_2*x1_1*I_0*b_0_0*b_1_0 - 3*x1_2*S_1*I_0*b_0_0*b_1_0 - 3*S_2*I_1*x1_0*b_0_0*b_1_0 - 3*I_2*S_1*x1_0*b_0_0*b_1_0 - S_3*I_0*x1_0*b_0_0*b_1_0 - 3*x1_2*I_1*S_0*b_0_0*b_1_0 - 3*I_2*x1_1*S_0*b_0_0*b_1_0 - x1_3*I_0*S_0*b_0_0*b_1_0 - I_3*x1_0*S_0*b_0_0*b_1_0 - 3*S_2*I_1*b_0_0 - 3*I_2*S_1*b_0_0 - S_3*I_0*b_0_0 - I_3*S_0*b_0_0 + I_3*mu_0 + I_3*v_0 + I_4,
		x2_2*M_0 + x1_3,
		2*x1_1*S_1*I_0*b_0_0*b_1_0 + 2*I_1*S_1*x1_0*b_0_0*b_1_0 + S_2*I_0*x1_0*b_0_0*b_1_0 + 2*I_1*x1_1*S_0*b_0_0*b_1_0 + x1_2*I_0*S_0*b_0_0*b_1_0 + I_2*x1_0*S_0*b_0_0*b_1_0 + 2*I_1*S_1*b_0_0 + S_2*I_0*b_0_0 + I_2*S_0*b_0_0 + S_2*mu_0 - R_2*g_0 + S_3,
		-x1_1*M_0 + x2_2,
		-I_4 - 3263917905201038016375072657955824396648229590458562364347242045390184140401457535074536390466665046900039385540882382515384506079716478800300690352380717934408336744823958212391811168714872409279246474047544718970872022382543545569350535860617410438600529965526273008478814615077846587633804287246845876683427718490398723854189676532736,
		-12*S_2*I_1*x1_1*b_0_0*b_1_0 - 12*x1_2*I_1*S_1*b_0_0*b_1_0 - 12*I_2*x1_1*S_1*b_0_0*b_1_0 - 6*x1_2*S_2*I_0*b_0_0*b_1_0 - 4*S_3*x1_1*I_0*b_0_0*b_1_0 - 4*x1_3*S_1*I_0*b_0_0*b_1_0 - 6*I_2*S_2*x1_0*b_0_0*b_1_0 - 4*S_3*I_1*x1_0*b_0_0*b_1_0 - 4*I_3*S_1*x1_0*b_0_0*b_1_0 - S_4*I_0*x1_0*b_0_0*b_1_0 - 6*I_2*x1_2*S_0*b_0_0*b_1_0 - 4*x1_3*I_1*S_0*b_0_0*b_1_0 - 4*I_3*x1_1*S_0*b_0_0*b_1_0 - x1_4*I_0*S_0*b_0_0*b_1_0 - I_4*x1_0*S_0*b_0_0*b_1_0 - 6*I_2*S_2*b_0_0 - 4*S_3*I_1*b_0_0 - 4*I_3*S_1*b_0_0 - S_4*I_0*b_0_0 - I_4*S_0*b_0_0 + I_4*mu_0 + I_4*v_0 + I_5,
		6*I_1*x1_1*S_1*b_0_0*b_1_0 + 3*S_2*x1_1*I_0*b_0_0*b_1_0 + 3*x1_2*S_1*I_0*b_0_0*b_1_0 + 3*S_2*I_1*x1_0*b_0_0*b_1_0 + 3*I_2*S_1*x1_0*b_0_0*b_1_0 + S_3*I_0*x1_0*b_0_0*b_1_0 + 3*x1_2*I_1*S_0*b_0_0*b_1_0 + 3*I_2*x1_1*S_0*b_0_0*b_1_0 + x1_3*I_0*S_0*b_0_0*b_1_0 + I_3*x1_0*S_0*b_0_0*b_1_0 + 3*S_2*I_1*b_0_0 + 3*I_2*S_1*b_0_0 + S_3*I_0*b_0_0 + I_3*S_0*b_0_0 + S_3*mu_0 - R_3*g_0 + S_4,
		x2_3*M_0 + x1_4,
		-x1_2*M_0 + x2_3,
		-I_5 - 88872613239397628745152907239694806008007796570798600436758373029536051556892330048559593317773905292863152114221424424841976319124223863759015966191910634475787582439284514925363250425676165481315879260792989695790208439500857439925123539653418418034830615518497198180594567320610774077736050768396375754975917268425466390902662975173851870524292338892524752375836843625350451528916149546246276322620911740501715136,
		-30*x1_2*S_2*I_1*b_0_0*b_1_0 - 30*I_2*S_2*x1_1*b_0_0*b_1_0 - 20*S_3*I_1*x1_1*b_0_0*b_1_0 - 30*I_2*x1_2*S_1*b_0_0*b_1_0 - 20*x1_3*I_1*S_1*b_0_0*b_1_0 - 20*I_3*x1_1*S_1*b_0_0*b_1_0 - 10*S_3*x1_2*I_0*b_0_0*b_1_0 - 10*x1_3*S_2*I_0*b_0_0*b_1_0 - 5*S_4*x1_1*I_0*b_0_0*b_1_0 - 5*x1_4*S_1*I_0*b_0_0*b_1_0 - 10*S_3*I_2*x1_0*b_0_0*b_1_0 - 10*I_3*S_2*x1_0*b_0_0*b_1_0 - 5*S_4*I_1*x1_0*b_0_0*b_1_0 - 5*I_4*S_1*x1_0*b_0_0*b_1_0 - S_5*I_0*x1_0*b_0_0*b_1_0 - 10*x1_3*I_2*S_0*b_0_0*b_1_0 - 10*I_3*x1_2*S_0*b_0_0*b_1_0 - 5*x1_4*I_1*S_0*b_0_0*b_1_0 - 5*I_4*x1_1*S_0*b_0_0*b_1_0 - x1_5*I_0*S_0*b_0_0*b_1_0 - I_5*x1_0*S_0*b_0_0*b_1_0 - 10*S_3*I_2*b_0_0 - 10*I_3*S_2*b_0_0 - 5*S_4*I_1*b_0_0 - 5*I_4*S_1*b_0_0 - S_5*I_0*b_0_0 - I_5*S_0*b_0_0 + I_5*mu_0 + I_5*v_0 + I_6,
		12*S_2*I_1*x1_1*b_0_0*b_1_0 + 12*x1_2*I_1*S_1*b_0_0*b_1_0 + 12*I_2*x1_1*S_1*b_0_0*b_1_0 + 6*x1_2*S_2*I_0*b_0_0*b_1_0 + 4*S_3*x1_1*I_0*b_0_0*b_1_0 + 4*x1_3*S_1*I_0*b_0_0*b_1_0 + 6*I_2*S_2*x1_0*b_0_0*b_1_0 + 4*S_3*I_1*x1_0*b_0_0*b_1_0 + 4*I_3*S_1*x1_0*b_0_0*b_1_0 + S_4*I_0*x1_0*b_0_0*b_1_0 + 6*I_2*x1_2*S_0*b_0_0*b_1_0 + 4*x1_3*I_1*S_0*b_0_0*b_1_0 + 4*I_3*x1_1*S_0*b_0_0*b_1_0 + x1_4*I_0*S_0*b_0_0*b_1_0 + I_4*x1_0*S_0*b_0_0*b_1_0 + 6*I_2*S_2*b_0_0 + 4*S_3*I_1*b_0_0 + 4*I_3*S_1*b_0_0 + S_4*I_0*b_0_0 + I_4*S_0*b_0_0 + S_4*mu_0 - R_4*g_0 + S_5,
		x2_4*M_0 + x1_5,
		R_3*mu_0 + R_3*g_0 - I_3*v_0 + R_4,
		-x1_3*M_0 + x2_4,
		-I_6 + 622433636890581769074856768784365846038616992556440631134580936024841404192972882230109021250618446301408725731706653415238293042048154714819204977613875459492344576420163141393847494797911884496545648329831137149025236060187611704291092932697743792714299421710861563854032889531339930085840496039371876615679870573421267744634997891142755180110257711471729879132697445791825345660749832054836052803142323386736835389308936117103598515857090357903511264544925204927171000494036372965681188585216,
		-90*I_2*x1_2*S_2*b_0_0*b_1_0 - 60*S_3*x1_2*I_1*b_0_0*b_1_0 - 60*x1_3*S_2*I_1*b_0_0*b_1_0 - 60*S_3*I_2*x1_1*b_0_0*b_1_0 - 60*I_3*S_2*x1_1*b_0_0*b_1_0 - 30*S_4*I_1*x1_1*b_0_0*b_1_0 - 60*x1_3*I_2*S_1*b_0_0*b_1_0 - 60*I_3*x1_2*S_1*b_0_0*b_1_0 - 30*x1_4*I_1*S_1*b_0_0*b_1_0 - 30*I_4*x1_1*S_1*b_0_0*b_1_0 - 20*x1_3*S_3*I_0*b_0_0*b_1_0 - 15*S_4*x1_2*I_0*b_0_0*b_1_0 - 15*x1_4*S_2*I_0*b_0_0*b_1_0 - 6*S_5*x1_1*I_0*b_0_0*b_1_0 - 6*x1_5*S_1*I_0*b_0_0*b_1_0 - 20*I_3*S_3*x1_0*b_0_0*b_1_0 - 15*S_4*I_2*x1_0*b_0_0*b_1_0 - 15*I_4*S_2*x1_0*b_0_0*b_1_0 - 6*S_5*I_1*x1_0*b_0_0*b_1_0 - 6*I_5*S_1*x1_0*b_0_0*b_1_0 - S_6*I_0*x1_0*b_0_0*b_1_0 - 20*I_3*x1_3*S_0*b_0_0*b_1_0 - 15*x1_4*I_2*S_0*b_0_0*b_1_0 - 15*I_4*x1_2*S_0*b_0_0*b_1_0 - 6*x1_5*I_1*S_0*b_0_0*b_1_0 - 6*I_5*x1_1*S_0*b_0_0*b_1_0 - x1_6*I_0*S_0*b_0_0*b_1_0 - I_6*x1_0*S_0*b_0_0*b_1_0 - 20*I_3*S_3*b_0_0 - 15*S_4*I_2*b_0_0 - 15*I_4*S_2*b_0_0 - 6*S_5*I_1*b_0_0 - 6*I_5*S_1*b_0_0 - S_6*I_0*b_0_0 - I_6*S_0*b_0_0 + I_6*mu_0 + I_6*v_0 + I_7,
		x2_5*M_0 + x1_6,
		30*x1_2*S_2*I_1*b_0_0*b_1_0 + 30*I_2*S_2*x1_1*b_0_0*b_1_0 + 20*S_3*I_1*x1_1*b_0_0*b_1_0 + 30*I_2*x1_2*S_1*b_0_0*b_1_0 + 20*x1_3*I_1*S_1*b_0_0*b_1_0 + 20*I_3*x1_1*S_1*b_0_0*b_1_0 + 10*S_3*x1_2*I_0*b_0_0*b_1_0 + 10*x1_3*S_2*I_0*b_0_0*b_1_0 + 5*S_4*x1_1*I_0*b_0_0*b_1_0 + 5*x1_4*S_1*I_0*b_0_0*b_1_0 + 10*S_3*I_2*x1_0*b_0_0*b_1_0 + 10*I_3*S_2*x1_0*b_0_0*b_1_0 + 5*S_4*I_1*x1_0*b_0_0*b_1_0 + 5*I_4*S_1*x1_0*b_0_0*b_1_0 + S_5*I_0*x1_0*b_0_0*b_1_0 + 10*x1_3*I_2*S_0*b_0_0*b_1_0 + 10*I_3*x1_2*S_0*b_0_0*b_1_0 + 5*x1_4*I_1*S_0*b_0_0*b_1_0 + 5*I_4*x1_1*S_0*b_0_0*b_1_0 + x1_5*I_0*S_0*b_0_0*b_1_0 + I_5*x1_0*S_0*b_0_0*b_1_0 + 10*S_3*I_2*b_0_0 + 10*I_3*S_2*b_0_0 + 5*S_4*I_1*b_0_0 + 5*I_4*S_1*b_0_0 + S_5*I_0*b_0_0 + I_5*S_0*b_0_0 + S_5*mu_0 - R_5*g_0 + S_6,
		R_4*mu_0 + R_4*g_0 - I_4*v_0 + R_5,
		-x1_4*M_0 + x2_5,
		-R_3 + 338994746140080417594704212704768095394893138552954260312342135537757970774654929395690178069496934463000697206549924198281002836637472308547364200808656057248980747053005563965868221133795946525922,
		-R_4 + 638055147173066651736475784114835327278887929703075873626064142423596736136948816025870871911170059904773952556067343650993121956889104525241149483696172171005363423792519989814193846956710994784021614413495702779823218948308590781098819031496830330992791163993626770025390718,
		-R_5 - 113164381381224195799636315024994487417184238270626678320034652563887309889066249134487738893426716388036829249396842341949859548921307169482635024436676988096601352538918140358325403945045828969574026012430506349518806582609517866919945588530411073383131129020315254920790635612430005599251480053752517987882248711509668453718684971781705632326680118088606,
		-I_7 + 139256384568759311662545623365107928765098985092444265017483067849381927492516078311981871920042241993915628707906204070516352620281665165055251729718513615059291184873478469103873324405221103206674465724160080395152646350609198317756904180308502304430915753737227724874048056476594333153249312713831968408154454531665198956276849154280911688500579246467147870716856270797711260925091960380093336533283481745277869368332845600995451492133512675008609411052582431231816877884491233193229592438059494346462312894480748802839921931692061960057531127688671824939814945471306965568,
		z_aux - 1
    ]
end
