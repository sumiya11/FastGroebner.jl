#! format: off
#! source: https://github.com/alexeyovchinnikov/SIAN-Julia

import AbstractAlgebra

function Tumor(; np=AbstractAlgebra, internal_ordering=:degrevlex, k=np.QQ)
    R, (x5_9,x5_8,x1_8,x2_7,x5_7,x1_7,d_6,x4_6,x2_6,x5_6,b_6,x1_6,a_6,x3_6,d_5,x4_5,x2_5,x5_5,b_5,x1_5,a_5,x3_5,d_4,x4_4,x2_4,x5_4,b_4,x1_4,a_4,x3_4,d_3,x4_3,x2_3,x5_3,b_3,x1_3,a_3,x3_3,d_2,x4_2,x2_2,x5_2,b_2,x1_2,a_2,x3_2,d_1,x4_1,x2_1,x5_1,b_1,x1_1,a_1,x3_1,d_0,x4_0,x2_0,x5_0,b_0,x1_0,a_0,x3_0,z_aux,k3_0,k7_0,k4_0,k5_0,k6_0) = np.PolynomialRing(k, [:x5_9,:x5_8,:x1_8,:x2_7,:x5_7,:x1_7,:d_6,:x4_6,:x2_6,:x5_6,:b_6,:x1_6,:a_6,:x3_6,:d_5,:x4_5,:x2_5,:x5_5,:b_5,:x1_5,:a_5,:x3_5,:d_4,:x4_4,:x2_4,:x5_4,:b_4,:x1_4,:a_4,:x3_4,:d_3,:x4_3,:x2_3,:x5_3,:b_3,:x1_3,:a_3,:x3_3,:d_2,:x4_2,:x2_2,:x5_2,:b_2,:x1_2,:a_2,:x3_2,:d_1,:x4_1,:x2_1,:x5_1,:b_1,:x1_1,:a_1,:x3_1,:d_0,:x4_0,:x2_0,:x5_0,:b_0,:x1_0,:a_0,:x3_0,:z_aux,:k3_0,:k7_0,:k4_0,:k5_0,:k6_0], ordering=ordering)
    sys = [
    		-d_0 + 1793380046825655415478,
		d_1,
		-x5_0 + 1495927109736899189706,
		-x1_0*k7_0 + x5_1,
		-a_0 + 2688483022278289216445,
		a_1,
		-b_0 + 551531423351070942938,
		b_1,
		-x5_1 + 264106632685474730905360013505674269507008,
		-x1_1*k7_0 + x5_2,
		x1_0*k3_0 + x1_0*k7_0 - x2_0*k4_0 + x1_1,
		-x5_2 - 246918790330024107247222929607729502888290114769307661633166400,
		-x1_2*k7_0 + x5_3,
		x1_1*k3_0 + x1_1*k7_0 - x2_1*k4_0 + x1_2,
		d_0*x2_0*b_0*k5_0 - x4_0*x2_0*k5_0 + x2_0*a_0*k5_0 - x2_0*x3_0*k5_0 - x1_0*k3_0 + x2_0*k4_0 - x4_0*k6_0 - x3_0*k6_0 + x2_1,
		-x5_3 - 2421051817140450789695646908749604894100534893810796183688465314288755493421981142105886039628306705835510174145460905708096,
		-x1_3*k7_0 + x5_4,
		x1_2*k3_0 + x1_2*k7_0 - x2_2*k4_0 + x1_3,
		b_1*d_0*x2_0*k5_0 + x2_1*d_0*b_0*k5_0 + d_1*x2_0*b_0*k5_0 - x2_1*x4_0*k5_0 - x4_1*x2_0*k5_0 + a_1*x2_0*k5_0 - x3_1*x2_0*k5_0 + x2_1*a_0*k5_0 - x2_1*x3_0*k5_0 - x1_1*k3_0 + x2_1*k4_0 - x4_1*k6_0 - x3_1*k6_0 + x2_2,
		-x2_0*a_0*k5_0 + x2_0*x3_0*k5_0 + x3_0*k6_0 + x3_1,
		-d_0*x2_0*b_0*k5_0 + x4_0*x2_0*k5_0 + x4_0*k6_0 + x4_1,
		-x5_4 + 1075074732423494657285245742512744983503163455386523597179209755897951611817064931314877669000885732540982570779731712832283049314847856381346174858690083610968987979798767144784329297856,
		-x1_4*k7_0 + x5_5,
		x1_3*k3_0 + x1_3*k7_0 - x2_3*k4_0 + x1_4,
		2*x2_1*b_1*d_0*k5_0 + 2*d_1*b_1*x2_0*k5_0 + b_2*d_0*x2_0*k5_0 + 2*d_1*x2_1*b_0*k5_0 + x2_2*d_0*b_0*k5_0 + d_2*x2_0*b_0*k5_0 - 2*x4_1*x2_1*k5_0 + 2*x2_1*a_1*k5_0 - 2*x2_1*x3_1*k5_0 - x2_2*x4_0*k5_0 - x4_2*x2_0*k5_0 + a_2*x2_0*k5_0 - x3_2*x2_0*k5_0 + x2_2*a_0*k5_0 - x2_2*x3_0*k5_0 - x1_2*k3_0 + x2_2*k4_0 - x4_2*k6_0 - x3_2*k6_0 + x2_3,
		d_2,
		b_2,
		a_2,
		-b_1*d_0*x2_0*k5_0 - x2_1*d_0*b_0*k5_0 - d_1*x2_0*b_0*k5_0 + x2_1*x4_0*k5_0 + x4_1*x2_0*k5_0 + x4_1*k6_0 + x4_2,
		-a_1*x2_0*k5_0 + x3_1*x2_0*k5_0 - x2_1*a_0*k5_0 + x2_1*x3_0*k5_0 + x3_1*k6_0 + x3_2,
		-x5_5 - 477389898106587632100436338610050356598217216466518885101845383803257627785503778416520415968020949641969790667481315538689243665258537335073651379886521686672895713428653713667290350423739585185809518432257458696797963938383435810140945425183036992,
		-x1_5*k7_0 + x5_6,
		x1_4*k3_0 + x1_4*k7_0 - x2_4*k4_0 + x1_5,
		6*d_1*x2_1*b_1*k5_0 + 3*b_2*x2_1*d_0*k5_0 + 3*x2_2*b_1*d_0*k5_0 + 3*b_2*d_1*x2_0*k5_0 + 3*d_2*b_1*x2_0*k5_0 + b_3*d_0*x2_0*k5_0 + 3*x2_2*d_1*b_0*k5_0 + 3*d_2*x2_1*b_0*k5_0 + x2_3*d_0*b_0*k5_0 + d_3*x2_0*b_0*k5_0 - 3*x2_2*x4_1*k5_0 - 3*x4_2*x2_1*k5_0 + 3*a_2*x2_1*k5_0 - 3*x3_2*x2_1*k5_0 + 3*x2_2*a_1*k5_0 - 3*x2_2*x3_1*k5_0 - x2_3*x4_0*k5_0 - x4_3*x2_0*k5_0 + a_3*x2_0*k5_0 - x3_3*x2_0*k5_0 + x2_3*a_0*k5_0 - x2_3*x3_0*k5_0 - x1_3*k3_0 + x2_3*k4_0 - x4_3*k6_0 - x3_3*k6_0 + x2_4,
		-2*x2_1*b_1*d_0*k5_0 - 2*d_1*b_1*x2_0*k5_0 - b_2*d_0*x2_0*k5_0 - 2*d_1*x2_1*b_0*k5_0 - x2_2*d_0*b_0*k5_0 - d_2*x2_0*b_0*k5_0 + 2*x4_1*x2_1*k5_0 + x2_2*x4_0*k5_0 + x4_2*x2_0*k5_0 + x4_2*k6_0 + x4_3,
		a_3,
		d_3,
		b_3,
		-2*x2_1*a_1*k5_0 + 2*x2_1*x3_1*k5_0 - a_2*x2_0*k5_0 + x3_2*x2_0*k5_0 - x2_2*a_0*k5_0 + x2_2*x3_0*k5_0 + x3_2*k6_0 + x3_3,
		-x5_6 + 211986300059783245051128856730090546420177017719814858207674372147161985886637119580837887083711072847486915838579702052705422718435836958602154141557124061060792601829403015981880233561501380037682833785824595247199012226258103724083117416480425755072159390791913798634432844270470074103251261195570091515245504,
		-x1_6*k7_0 + x5_7,
		x1_5*k3_0 + x1_5*k7_0 - x2_5*k4_0 + x1_6,
		12*b_2*d_1*x2_1*k5_0 + 12*x2_2*d_1*b_1*k5_0 + 12*d_2*x2_1*b_1*k5_0 + 6*x2_2*b_2*d_0*k5_0 + 4*b_3*x2_1*d_0*k5_0 + 4*x2_3*b_1*d_0*k5_0 + 6*d_2*b_2*x2_0*k5_0 + 4*b_3*d_1*x2_0*k5_0 + 4*d_3*b_1*x2_0*k5_0 + b_4*d_0*x2_0*k5_0 + 6*d_2*x2_2*b_0*k5_0 + 4*x2_3*d_1*b_0*k5_0 + 4*d_3*x2_1*b_0*k5_0 + x2_4*d_0*b_0*k5_0 + d_4*x2_0*b_0*k5_0 - 6*x4_2*x2_2*k5_0 + 6*x2_2*a_2*k5_0 - 6*x2_2*x3_2*k5_0 - 4*x2_3*x4_1*k5_0 - 4*x4_3*x2_1*k5_0 + 4*a_3*x2_1*k5_0 - 4*x3_3*x2_1*k5_0 + 4*x2_3*a_1*k5_0 - 4*x2_3*x3_1*k5_0 - x2_4*x4_0*k5_0 - x4_4*x2_0*k5_0 + a_4*x2_0*k5_0 - x3_4*x2_0*k5_0 + x2_4*a_0*k5_0 - x2_4*x3_0*k5_0 - x1_4*k3_0 + x2_4*k4_0 - x4_4*k6_0 - x3_4*k6_0 + x2_5,
		a_4,
		d_4,
		-6*d_1*x2_1*b_1*k5_0 - 3*b_2*x2_1*d_0*k5_0 - 3*x2_2*b_1*d_0*k5_0 - 3*b_2*d_1*x2_0*k5_0 - 3*d_2*b_1*x2_0*k5_0 - b_3*d_0*x2_0*k5_0 - 3*x2_2*d_1*b_0*k5_0 - 3*d_2*x2_1*b_0*k5_0 - x2_3*d_0*b_0*k5_0 - d_3*x2_0*b_0*k5_0 + 3*x2_2*x4_1*k5_0 + 3*x4_2*x2_1*k5_0 + x2_3*x4_0*k5_0 + x4_3*x2_0*k5_0 + x4_3*k6_0 + x4_4,
		-3*a_2*x2_1*k5_0 + 3*x3_2*x2_1*k5_0 - 3*x2_2*a_1*k5_0 + 3*x2_2*x3_1*k5_0 - a_3*x2_0*k5_0 + x3_3*x2_0*k5_0 - x2_3*a_0*k5_0 + x2_3*x3_0*k5_0 + x3_3*k6_0 + x3_4,
		b_4,
		-x5_7 - 94133100828629250811617132465200576231795345688281375830471475325741463243482606849023599641687065936954716659261128436643697316441094169545957424595875155038467828146047481436815747536297447797404017901947955343847968918494119036117144432510304322469685822211797360724333036694114038213794526852458339130825352115150252380399479200816989735848076768015946922541952784069184,
		-x1_7*k7_0 + x5_8,
		x1_6*k3_0 + x1_6*k7_0 - x2_6*k4_0 + x1_7,
		30*x2_2*b_2*d_1*k5_0 + 30*d_2*b_2*x2_1*k5_0 + 20*b_3*d_1*x2_1*k5_0 + 30*d_2*x2_2*b_1*k5_0 + 20*x2_3*d_1*b_1*k5_0 + 20*d_3*x2_1*b_1*k5_0 + 10*b_3*x2_2*d_0*k5_0 + 10*x2_3*b_2*d_0*k5_0 + 5*b_4*x2_1*d_0*k5_0 + 5*x2_4*b_1*d_0*k5_0 + 10*b_3*d_2*x2_0*k5_0 + 10*d_3*b_2*x2_0*k5_0 + 5*b_4*d_1*x2_0*k5_0 + 5*d_4*b_1*x2_0*k5_0 + b_5*d_0*x2_0*k5_0 + 10*x2_3*d_2*b_0*k5_0 + 10*d_3*x2_2*b_0*k5_0 + 5*x2_4*d_1*b_0*k5_0 + 5*d_4*x2_1*b_0*k5_0 + x2_5*d_0*b_0*k5_0 + d_5*x2_0*b_0*k5_0 - 10*x2_3*x4_2*k5_0 - 10*x4_3*x2_2*k5_0 + 10*a_3*x2_2*k5_0 - 10*x3_3*x2_2*k5_0 + 10*x2_3*a_2*k5_0 - 10*x2_3*x3_2*k5_0 - 5*x2_4*x4_1*k5_0 - 5*x4_4*x2_1*k5_0 + 5*a_4*x2_1*k5_0 - 5*x3_4*x2_1*k5_0 + 5*x2_4*a_1*k5_0 - 5*x2_4*x3_1*k5_0 - x2_5*x4_0*k5_0 - x4_5*x2_0*k5_0 + a_5*x2_0*k5_0 - x3_5*x2_0*k5_0 + x2_5*a_0*k5_0 - x2_5*x3_0*k5_0 - x1_5*k3_0 + x2_5*k4_0 - x4_5*k6_0 - x3_5*k6_0 + x2_6,
		a_5,
		-12*b_2*d_1*x2_1*k5_0 - 12*x2_2*d_1*b_1*k5_0 - 12*d_2*x2_1*b_1*k5_0 - 6*x2_2*b_2*d_0*k5_0 - 4*b_3*x2_1*d_0*k5_0 - 4*x2_3*b_1*d_0*k5_0 - 6*d_2*b_2*x2_0*k5_0 - 4*b_3*d_1*x2_0*k5_0 - 4*d_3*b_1*x2_0*k5_0 - b_4*d_0*x2_0*k5_0 - 6*d_2*x2_2*b_0*k5_0 - 4*x2_3*d_1*b_0*k5_0 - 4*d_3*x2_1*b_0*k5_0 - x2_4*d_0*b_0*k5_0 - d_4*x2_0*b_0*k5_0 + 6*x4_2*x2_2*k5_0 + 4*x2_3*x4_1*k5_0 + 4*x4_3*x2_1*k5_0 + x2_4*x4_0*k5_0 + x4_4*x2_0*k5_0 + x4_4*k6_0 + x4_5,
		-6*x2_2*a_2*k5_0 + 6*x2_2*x3_2*k5_0 - 4*a_3*x2_1*k5_0 + 4*x3_3*x2_1*k5_0 - 4*x2_3*a_1*k5_0 + 4*x2_3*x3_1*k5_0 - a_4*x2_0*k5_0 + x3_4*x2_0*k5_0 - x2_4*a_0*k5_0 + x2_4*x3_0*k5_0 + x3_4*k6_0 + x3_5,
		b_5,
		d_5,
		-x5_8 + 41800062877242244162222135630244468850762270144778464680070101958795316235276436046577615860271465258837460906972903616905377364149660430506694688105483481463256445982528648554267731946160684394673935517344839205757713468926763851177442957404880923218783744961188316224854319610388982554950744888025452137214928863779054707322153030491197622989071139820919112929241166546026488430298225464716196853956541754565033784226935785681591187392,
		-x1_8*k7_0 + x5_9,
		x1_7*k3_0 + x1_7*k7_0 - x2_7*k4_0 + x1_8,
		90*d_2*x2_2*b_2*k5_0 + 60*b_3*x2_2*d_1*k5_0 + 60*x2_3*b_2*d_1*k5_0 + 60*b_3*d_2*x2_1*k5_0 + 60*d_3*b_2*x2_1*k5_0 + 30*b_4*d_1*x2_1*k5_0 + 60*x2_3*d_2*b_1*k5_0 + 60*d_3*x2_2*b_1*k5_0 + 30*x2_4*d_1*b_1*k5_0 + 30*d_4*x2_1*b_1*k5_0 + 20*x2_3*b_3*d_0*k5_0 + 15*b_4*x2_2*d_0*k5_0 + 15*x2_4*b_2*d_0*k5_0 + 6*b_5*x2_1*d_0*k5_0 + 6*x2_5*b_1*d_0*k5_0 + 20*d_3*b_3*x2_0*k5_0 + 15*b_4*d_2*x2_0*k5_0 + 15*d_4*b_2*x2_0*k5_0 + 6*b_5*d_1*x2_0*k5_0 + 6*d_5*b_1*x2_0*k5_0 + b_6*d_0*x2_0*k5_0 + 20*d_3*x2_3*b_0*k5_0 + 15*x2_4*d_2*b_0*k5_0 + 15*d_4*x2_2*b_0*k5_0 + 6*x2_5*d_1*b_0*k5_0 + 6*d_5*x2_1*b_0*k5_0 + x2_6*d_0*b_0*k5_0 + d_6*x2_0*b_0*k5_0 - 20*x4_3*x2_3*k5_0 + 20*x2_3*a_3*k5_0 - 20*x2_3*x3_3*k5_0 - 15*x2_4*x4_2*k5_0 - 15*x4_4*x2_2*k5_0 + 15*a_4*x2_2*k5_0 - 15*x3_4*x2_2*k5_0 + 15*x2_4*a_2*k5_0 - 15*x2_4*x3_2*k5_0 - 6*x2_5*x4_1*k5_0 - 6*x4_5*x2_1*k5_0 + 6*a_5*x2_1*k5_0 - 6*x3_5*x2_1*k5_0 + 6*x2_5*a_1*k5_0 - 6*x2_5*x3_1*k5_0 - x2_6*x4_0*k5_0 - x4_6*x2_0*k5_0 + a_6*x2_0*k5_0 - x3_6*x2_0*k5_0 + x2_6*a_0*k5_0 - x2_6*x3_0*k5_0 - x1_6*k3_0 + x2_6*k4_0 - x4_6*k6_0 - x3_6*k6_0 + x2_7,
		-30*x2_2*b_2*d_1*k5_0 - 30*d_2*b_2*x2_1*k5_0 - 20*b_3*d_1*x2_1*k5_0 - 30*d_2*x2_2*b_1*k5_0 - 20*x2_3*d_1*b_1*k5_0 - 20*d_3*x2_1*b_1*k5_0 - 10*b_3*x2_2*d_0*k5_0 - 10*x2_3*b_2*d_0*k5_0 - 5*b_4*x2_1*d_0*k5_0 - 5*x2_4*b_1*d_0*k5_0 - 10*b_3*d_2*x2_0*k5_0 - 10*d_3*b_2*x2_0*k5_0 - 5*b_4*d_1*x2_0*k5_0 - 5*d_4*b_1*x2_0*k5_0 - b_5*d_0*x2_0*k5_0 - 10*x2_3*d_2*b_0*k5_0 - 10*d_3*x2_2*b_0*k5_0 - 5*x2_4*d_1*b_0*k5_0 - 5*d_4*x2_1*b_0*k5_0 - x2_5*d_0*b_0*k5_0 - d_5*x2_0*b_0*k5_0 + 10*x2_3*x4_2*k5_0 + 10*x4_3*x2_2*k5_0 + 5*x2_4*x4_1*k5_0 + 5*x4_4*x2_1*k5_0 + x2_5*x4_0*k5_0 + x4_5*x2_0*k5_0 + x4_5*k6_0 + x4_6,
		d_6,
		-10*a_3*x2_2*k5_0 + 10*x3_3*x2_2*k5_0 - 10*x2_3*a_2*k5_0 + 10*x2_3*x3_2*k5_0 - 5*a_4*x2_1*k5_0 + 5*x3_4*x2_1*k5_0 - 5*x2_4*a_1*k5_0 + 5*x2_4*x3_1*k5_0 - a_5*x2_0*k5_0 + x3_5*x2_0*k5_0 - x2_5*a_0*k5_0 + x2_5*x3_0*k5_0 + x3_5*k6_0 + x3_6,
		b_6,
		a_6,
		-d_1,
		-d_2,
		-d_3,
		-d_4,
		-d_5,
		-d_6,
		-x5_9 - 18561433132031758535238503466318349466700369278163603206817492871118828463478041118635054090099505077762114031529655107700371510777564683483593197204707156511339185209886726071114882481557257806517838282761051778022925364851339073663407329697648154909149013353339464292426278425690433863969473119685171303340524195127734838971856558545015520732455174458135134994647776320096819603725065652098361061115667295103427814594217454585210304822953681359670916859547352512896010447515400269418998215312346688,
		-a_1,
		-a_2,
		-a_3,
		-a_4,
		-a_5,
		-a_6,
		-b_1,
		-b_2,
		-b_3,
		-b_4,
		-b_5,
		-b_6,
		z_aux - 1
    ]
end
