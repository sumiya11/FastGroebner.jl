#! format: off
#! source: https://github.com/alexeyovchinnikov/SIAN-Julia

import AbstractAlgebra

function DAISY_mamil3(; np=AbstractAlgebra, internal_ordering=:degrevlex, k=np.QQ)
    R, (x1_8,x1_7,x3_7,x2_7,x1_6,x3_6,x2_6,x1_5,x3_5,x2_5,x1_4,x3_4,x2_4,x1_3,x3_3,x2_3,x1_2,x3_2,x2_2,x1_1,x3_1,x2_1,x1_0,x3_0,x2_0,z_aux,a21_0,a31_0,a01_0,a12_0,a13_0) = np.PolynomialRing(k, [:x1_8,:x1_7,:x3_7,:x2_7,:x1_6,:x3_6,:x2_6,:x1_5,:x3_5,:x2_5,:x1_4,:x3_4,:x2_4,:x1_3,:x3_3,:x2_3,:x1_2,:x3_2,:x2_2,:x1_1,:x3_1,:x2_1,:x1_0,:x3_0,:x2_0,:z_aux,:a21_0,:a31_0,:a01_0,:a12_0,:a13_0], ordering=ordering)
    sys = [
    		-x1_0 + 535512116913,
		x1_0*a21_0 + x1_0*a31_0 + x1_0*a01_0 - x2_0*a12_0 - x3_0*a13_0 + x1_1 - 419870917348,
		-x1_1 - 707394957569499110890520,
		x1_1*a21_0 + x1_1*a31_0 + x1_1*a01_0 - x2_1*a12_0 - x3_1*a13_0 + x1_2 - 543107353265,
		-x1_0*a21_0 + x2_0*a12_0 + x2_1,
		-x1_0*a31_0 + x3_0*a13_0 + x3_1,
		-x1_2 + 1016133668379371012983444712494416643,
		x1_2*a21_0 + x1_2*a31_0 + x1_2*a01_0 - x2_2*a12_0 - x3_2*a13_0 + x1_3 - 215559325250,
		-x1_1*a21_0 + x2_1*a12_0 + x2_2,
		-x1_1*a31_0 + x3_1*a13_0 + x3_2,
		-x1_3 - 1465004405820761240727762683655704885292628012074,
		x1_3*a21_0 + x1_3*a31_0 + x1_3*a01_0 - x2_3*a12_0 - x3_3*a13_0 + x1_4 - 632407870919,
		-x1_2*a31_0 + x3_2*a13_0 + x3_3,
		-x1_2*a21_0 + x2_2*a12_0 + x2_3,
		-x1_4 + 2112552872850807573502650184872785268131244591505698883068581,
		x1_4*a21_0 + x1_4*a31_0 + x1_4*a01_0 - x2_4*a12_0 - x3_4*a13_0 + x1_5 - 110630048503,
		-x1_3*a31_0 + x3_3*a13_0 + x3_4,
		-x1_3*a21_0 + x2_3*a12_0 + x2_4,
		-x1_5 - 3046362230618751132351642865375916979018925839287065329547735751597439661,
		x1_5*a21_0 + x1_5*a31_0 + x1_5*a01_0 - x2_5*a12_0 - x3_5*a13_0 + x1_6 - 362693906659,
		-x1_4*a21_0 + x2_4*a12_0 + x2_5,
		-x1_4*a31_0 + x3_4*a13_0 + x3_5,
		-x1_6 + 4392946782376403864273749579899670096217505379686075243730479043592493239457810218835,
		x1_6*a21_0 + x1_6*a31_0 + x1_6*a01_0 - x2_6*a12_0 - x3_6*a13_0 + x1_7 - 117143341374,
		-x1_5*a21_0 + x2_5*a12_0 + x2_6,
		-x1_5*a31_0 + x3_5*a13_0 + x3_6,
		-x1_7 - 6334763197604487822421237273003975085262479664158362920707585628599193491889497054330720549564382,
		x1_7*a21_0 + x1_7*a31_0 + x1_7*a01_0 - x2_7*a12_0 - x3_7*a13_0 + x1_8 - 240464436510,
		-x1_6*a21_0 + x2_6*a12_0 + x2_7,
		-x1_6*a31_0 + x3_6*a13_0 + x3_7,
		-x1_8 + 9134921765902580976732501363657527012555990985091689462586403513072508976450620785134771040893038530509835040,
		z_aux - 1
    ]
end
