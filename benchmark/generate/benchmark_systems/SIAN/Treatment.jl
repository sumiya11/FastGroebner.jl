#! format: off
#! source: https://github.com/alexeyovchinnikov/SIAN-Julia

import AbstractAlgebra

function Treatment(; np=AbstractAlgebra, internal_ordering=:degrevlex, k=np.QQ)
    R, (Tr_7,In_6,Tr_6,In_5,Tr_5,S_5,N_5,In_4,Tr_4,S_4,N_4,In_3,Tr_3,S_3,N_3,In_2,Tr_2,S_2,N_2,In_1,Tr_1,S_1,N_1,In_0,Tr_0,S_0,N_0,z_aux,b_0,d_0,a_0,g_0,nu_0) = np.PolynomialRing(k, [:Tr_7,:In_6,:Tr_6,:In_5,:Tr_5,:S_5,:N_5,:In_4,:Tr_4,:S_4,:N_4,:In_3,:Tr_3,:S_3,:N_3,:In_2,:Tr_2,:S_2,:N_2,:In_1,:Tr_1,:S_1,:N_1,:In_0,:Tr_0,:S_0,:N_0,:z_aux,:b_0,:d_0,:a_0,:g_0,:nu_0], ordering=ordering)
    sys = [
    		-Tr_0 + 27932493965905,
		-In_0*g_0 + Tr_0*nu_0 + Tr_1,
		-N_0 + 49877654784690,
		N_1,
		-Tr_1 - 349979343781514446334827265,
		-In_1*g_0 + Tr_1*nu_0 + Tr_2,
		-Tr_0*S_0*b_0*d_0 - In_0*S_0*b_0 + In_0*N_0*a_0 + In_0*N_0*g_0 + In_1*N_0,
		-Tr_2 + k(47548372951634455227541961041049789867609413526744310255118325935)//k(1662588492823),
		-In_2*g_0 + Tr_2*nu_0 + Tr_3,
		-S_1*Tr_0*b_0*d_0 - Tr_1*S_0*b_0*d_0 - S_1*In_0*b_0 - In_1*S_0*b_0 + N_1*In_0*a_0 + In_1*N_0*a_0 + N_1*In_0*g_0 + In_1*N_0*g_0 + In_1*N_1 + In_2*N_0,
		Tr_0*S_0*b_0*d_0 + In_0*S_0*b_0 + S_1*N_0,
		-Tr_3 - k(30732641758629327505039257135779308232916239705946410321117802081479352825031205305557758349907742539025)//k(2764200496467454722509329),
		-In_3*g_0 + Tr_3*nu_0 + Tr_4,
		-2*Tr_1*S_1*b_0*d_0 - S_2*Tr_0*b_0*d_0 - Tr_2*S_0*b_0*d_0 - 2*In_1*S_1*b_0 - S_2*In_0*b_0 - In_2*S_0*b_0 + 2*In_1*N_1*a_0 + N_2*In_0*a_0 + In_2*N_0*a_0 + 2*In_1*N_1*g_0 + N_2*In_0*g_0 + In_2*N_0*g_0 + N_2*In_1 + 2*In_2*N_1 + In_3*N_0,
		N_2,
		S_1*Tr_0*b_0*d_0 + Tr_1*S_0*b_0*d_0 + S_1*In_0*b_0 + In_1*S_0*b_0 + S_1*N_1 + S_2*N_0,
		-Tr_4 + k(19863881997065746312340893974852206398607909923091793421165627178140777225756001511707018734123279719036096601551431712174243811225642709570623)//k(4595727937282413882767778994667045767),
		-In_4*g_0 + Tr_4*nu_0 + Tr_5,
		-3*S_2*Tr_1*b_0*d_0 - 3*Tr_2*S_1*b_0*d_0 - S_3*Tr_0*b_0*d_0 - Tr_3*S_0*b_0*d_0 - 3*S_2*In_1*b_0 - 3*In_2*S_1*b_0 - S_3*In_0*b_0 - In_3*S_0*b_0 + 3*N_2*In_1*a_0 + 3*In_2*N_1*a_0 + N_3*In_0*a_0 + In_3*N_0*a_0 + 3*N_2*In_1*g_0 + 3*In_2*N_1*g_0 + N_3*In_0*g_0 + In_3*N_0*g_0 + 3*In_2*N_2 + N_3*In_1 + 3*In_3*N_1 + In_4*N_0,
		2*Tr_1*S_1*b_0*d_0 + S_2*Tr_0*b_0*d_0 + Tr_2*S_0*b_0*d_0 + 2*In_1*S_1*b_0 + S_2*In_0*b_0 + In_2*S_0*b_0 + N_2*S_1 + 2*S_2*N_1 + S_3*N_0,
		N_3,
		-Tr_5 - k(64194580324771147900220144786846506337812072258890781059454750536679819872860769449557156478099949861628911914636998970867148548595791147149616614625905436777686711052441346463320397)//k(38204021923354615839270865452253208882312460151205),
		-In_5*g_0 + Tr_5*nu_0 + Tr_6,
		-6*Tr_2*S_2*b_0*d_0 - 4*S_3*Tr_1*b_0*d_0 - 4*Tr_3*S_1*b_0*d_0 - S_4*Tr_0*b_0*d_0 - Tr_4*S_0*b_0*d_0 - 6*In_2*S_2*b_0 - 4*S_3*In_1*b_0 - 4*In_3*S_1*b_0 - S_4*In_0*b_0 - In_4*S_0*b_0 + 6*In_2*N_2*a_0 + 4*N_3*In_1*a_0 + 4*In_3*N_1*a_0 + N_4*In_0*a_0 + In_4*N_0*a_0 + 6*In_2*N_2*g_0 + 4*N_3*In_1*g_0 + 4*In_3*N_1*g_0 + N_4*In_0*g_0 + In_4*N_0*g_0 + 4*N_3*In_2 + 6*In_3*N_2 + N_4*In_1 + 4*In_4*N_1 + In_5*N_0,
		3*S_2*Tr_1*b_0*d_0 + 3*Tr_2*S_1*b_0*d_0 + S_3*Tr_0*b_0*d_0 + Tr_3*S_0*b_0*d_0 + 3*S_2*In_1*b_0 + 3*In_2*S_1*b_0 + S_3*In_0*b_0 + In_3*S_0*b_0 + 3*S_2*N_2 + N_3*S_1 + 3*S_3*N_1 + S_4*N_0,
		N_4,
		-Tr_6 + k(207459153436476173585011395083718032743918386138901690257582530772268533416457298053813332784971351904176894250374917320860446749938899941176752768495481128507728496306937840899240173578077098119344105365385278393689060443)//k(317587836146635001861867557037582414125046347528725838186508575),
		-In_6*g_0 + Tr_6*nu_0 + Tr_7,
		-10*S_3*Tr_2*b_0*d_0 - 10*Tr_3*S_2*b_0*d_0 - 5*S_4*Tr_1*b_0*d_0 - 5*Tr_4*S_1*b_0*d_0 - S_5*Tr_0*b_0*d_0 - Tr_5*S_0*b_0*d_0 - 10*S_3*In_2*b_0 - 10*In_3*S_2*b_0 - 5*S_4*In_1*b_0 - 5*In_4*S_1*b_0 - S_5*In_0*b_0 - In_5*S_0*b_0 + 10*N_3*In_2*a_0 + 10*In_3*N_2*a_0 + 5*N_4*In_1*a_0 + 5*In_4*N_1*a_0 + N_5*In_0*a_0 + In_5*N_0*a_0 + 10*N_3*In_2*g_0 + 10*In_3*N_2*g_0 + 5*N_4*In_1*g_0 + 5*In_4*N_1*g_0 + N_5*In_0*g_0 + In_5*N_0*g_0 + 10*In_3*N_3 + 5*N_4*In_2 + 10*In_4*N_2 + N_5*In_1 + 5*In_5*N_1 + In_6*N_0,
		N_5,
		6*Tr_2*S_2*b_0*d_0 + 4*S_3*Tr_1*b_0*d_0 + 4*Tr_3*S_1*b_0*d_0 + S_4*Tr_0*b_0*d_0 + Tr_4*S_0*b_0*d_0 + 6*In_2*S_2*b_0 + 4*S_3*In_1*b_0 + 4*In_3*S_1*b_0 + S_4*In_0*b_0 + In_4*S_0*b_0 + 4*N_3*S_2 + 6*S_3*N_2 + N_4*S_1 + 4*S_4*N_1 + S_5*N_0,
		-Tr_7 - k(670450684883857214142316985583435640316842189059001937273639615999531076701958593776209318138648773850568554162419704436081109892690046786377607434778902247807139748163585069690936786596659969014131501941605412117431997418183655756990539780127408750750868885667)//k(2640089409189758838843100902455775663339053165964026810040423356409077286125),
		-N_1,
		-N_2,
		-N_3,
		-N_4,
		-N_5,
		N_0*z_aux - 1
    ]
end
