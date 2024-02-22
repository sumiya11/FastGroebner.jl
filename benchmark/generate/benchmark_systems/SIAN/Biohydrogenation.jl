#! format: off
#! source: https://github.com/alexeyovchinnikov/SIAN-Julia

import AbstractAlgebra

function Biohydrogenation(; np=AbstractAlgebra, internal_ordering=:degrevlex, k=np.QQ)
    R, (x₅_12,x₅_11,x₅_10,x₅_9,x₅_8,x₅_7,x₅_6,x₅_5,x₆_5,x₄_5,x₅_4,x₆_4,x₄_4,x₅_3,x₆_3,x₄_3,x₅_2,x₆_2,x₄_2,x₅_1,x₆_1,x₄_1,x₅_0,x₆_0,x₄_0,z_aux,x₇_0,k₅_0,k₆_0,k₇_0,k₈_0,k₉_0,k₁₀_0) = np.PolynomialRing(k, [:x₅_12,:x₅_11,:x₅_10,:x₅_9,:x₅_8,:x₅_7,:x₅_6,:x₅_5,:x₆_5,:x₄_5,:x₅_4,:x₆_4,:x₄_4,:x₅_3,:x₆_3,:x₄_3,:x₅_2,:x₆_2,:x₄_2,:x₅_1,:x₆_1,:x₄_1,:x₅_0,:x₆_0,:x₄_0,:z_aux,:x₇_0,:k₅_0,:k₆_0,:k₇_0,:k₈_0,:k₉_0,:k₁₀_0], ordering=ordering)
    sys = [
    		-x₅_0 + 67015448674721,
		x₅_1*x₅_0*x₄_0 + x₅_1*x₆_0*x₄_0 - x₅_0*x₄_0*k₅_0 - x₆_0*x₄_0*k₅_0 + x₅_1*x₅_0*k₆_0 + x₅_1*x₆_0*k₆_0 + x₅_0*x₄_0*k₇_0 + x₅_0*k₆_0*k₇_0 + x₅_1*x₄_0*k₈_0 - x₄_0*k₅_0*k₈_0 + x₅_1*k₆_0*k₈_0,
		-x₄_0 + 79594148671001,
		x₄_1*x₄_0 + x₄_0*k₅_0 + x₄_1*k₆_0,
		-x₅_1 - k(7627204911986308857901245890919963747673)//k(462336504208801767785125067),
		x₅_1*x₄_1*x₅_0 + x₅_1*x₄_1*x₆_0 + x₅_1^2*x₄_0 + x₅_1*x₆_1*x₄_0 + x₅_2*x₅_0*x₄_0 + x₅_2*x₆_0*x₄_0 - x₄_1*x₅_0*k₅_0 - x₄_1*x₆_0*k₅_0 - x₅_1*x₄_0*k₅_0 - x₆_1*x₄_0*k₅_0 + x₅_1^2*k₆_0 + x₅_1*x₆_1*k₆_0 + x₅_2*x₅_0*k₆_0 + x₅_2*x₆_0*k₆_0 + x₄_1*x₅_0*k₇_0 + x₅_1*x₄_0*k₇_0 + x₅_1*k₆_0*k₇_0 + x₅_1*x₄_1*k₈_0 + x₅_2*x₄_0*k₈_0 - x₄_1*k₅_0*k₈_0 + x₅_2*k₆_0*k₈_0,
		-x₅_0*x₆_0^2*k₉_0 - x₆_0^3*k₉_0 - x₆_0^2*k₈_0*k₉_0 + x₅_0*x₆_0*k₉_0*k₁₀_0 + x₆_0^2*k₉_0*k₁₀_0 + x₆_0*k₈_0*k₉_0*k₁₀_0 + x₆_1*x₅_0*k₁₀_0 + x₆_1*x₆_0*k₁₀_0 - x₅_0*k₇_0*k₁₀_0 + x₆_1*k₈_0*k₁₀_0,
		-x₄_1 - k(849688852011726944749299424)//k(165083431976057),
		x₄_1^2 + x₄_2*x₄_0 + x₄_1*k₅_0 + x₄_2*k₆_0,
		-x₅_2 - k(1239332089934281267379532187583917481180910029079078238091282606931148942937878333038400463671275820890985273)//k(79948331766654673470679107241960466946757226361862898052030563365795937781145102663),
		2*x₅_1^2*x₄_1 + 2*x₅_1*x₆_1*x₄_1 + x₄_2*x₅_1*x₅_0 + 2*x₅_2*x₄_1*x₅_0 + x₄_2*x₅_1*x₆_0 + 2*x₅_2*x₄_1*x₆_0 + 3*x₅_2*x₅_1*x₄_0 + x₆_2*x₅_1*x₄_0 + 2*x₅_2*x₆_1*x₄_0 + x₅_3*x₅_0*x₄_0 + x₅_3*x₆_0*x₄_0 - 2*x₅_1*x₄_1*k₅_0 - 2*x₆_1*x₄_1*k₅_0 - x₄_2*x₅_0*k₅_0 - x₄_2*x₆_0*k₅_0 - x₅_2*x₄_0*k₅_0 - x₆_2*x₄_0*k₅_0 + 3*x₅_2*x₅_1*k₆_0 + x₆_2*x₅_1*k₆_0 + 2*x₅_2*x₆_1*k₆_0 + x₅_3*x₅_0*k₆_0 + x₅_3*x₆_0*k₆_0 + 2*x₅_1*x₄_1*k₇_0 + x₄_2*x₅_0*k₇_0 + x₅_2*x₄_0*k₇_0 + x₅_2*k₆_0*k₇_0 + x₄_2*x₅_1*k₈_0 + 2*x₅_2*x₄_1*k₈_0 + x₅_3*x₄_0*k₈_0 - x₄_2*k₅_0*k₈_0 + x₅_3*k₆_0*k₈_0,
		-2*x₆_1*x₅_0*x₆_0*k₉_0 - x₅_1*x₆_0^2*k₉_0 - 3*x₆_1*x₆_0^2*k₉_0 - 2*x₆_1*x₆_0*k₈_0*k₉_0 + x₆_1*x₅_0*k₉_0*k₁₀_0 + x₅_1*x₆_0*k₉_0*k₁₀_0 + 2*x₆_1*x₆_0*k₉_0*k₁₀_0 + x₆_1*k₈_0*k₉_0*k₁₀_0 + x₅_1*x₆_1*k₁₀_0 + x₆_1^2*k₁₀_0 + x₆_2*x₅_0*k₁₀_0 + x₆_2*x₆_0*k₁₀_0 - x₅_1*k₇_0*k₁₀_0 + x₆_2*k₈_0*k₁₀_0,
		-x₄_2 + k(775443883796288570651860272400342157949121389889683456)//k(4498942752868057913034851511444629966257193),
		3*x₄_2*x₄_1 + x₄_3*x₄_0 + x₄_2*k₅_0 + x₄_3*k₆_0,
		-x₅_3 + k(411625095283510678087623770144201056565519228546718831776236709572874350069975128012424182599905906346937091715553422087321598651127645441968697978091568865582882695870170294927)//k(27649712683662245881719072428128518968929234738329439504054731760076440044938333248750987134084029126595769423881478044667939156498142576614),
		3*x₄_2*x₅_1^2 + 3*x₄_2*x₅_1*x₆_1 + 9*x₅_2*x₅_1*x₄_1 + 3*x₆_2*x₅_1*x₄_1 + 6*x₅_2*x₆_1*x₄_1 + 3*x₅_2*x₄_2*x₅_0 + x₄_3*x₅_1*x₅_0 + 3*x₅_3*x₄_1*x₅_0 + 3*x₅_2*x₄_2*x₆_0 + x₄_3*x₅_1*x₆_0 + 3*x₅_3*x₄_1*x₆_0 + 3*x₅_2^2*x₄_0 + 3*x₅_2*x₆_2*x₄_0 + 4*x₅_3*x₅_1*x₄_0 + x₆_3*x₅_1*x₄_0 + 3*x₅_3*x₆_1*x₄_0 + x₅_4*x₅_0*x₄_0 + x₅_4*x₆_0*x₄_0 - 3*x₄_2*x₅_1*k₅_0 - 3*x₄_2*x₆_1*k₅_0 - 3*x₅_2*x₄_1*k₅_0 - 3*x₆_2*x₄_1*k₅_0 - x₄_3*x₅_0*k₅_0 - x₄_3*x₆_0*k₅_0 - x₅_3*x₄_0*k₅_0 - x₆_3*x₄_0*k₅_0 + 3*x₅_2^2*k₆_0 + 3*x₅_2*x₆_2*k₆_0 + 4*x₅_3*x₅_1*k₆_0 + x₆_3*x₅_1*k₆_0 + 3*x₅_3*x₆_1*k₆_0 + x₅_4*x₅_0*k₆_0 + x₅_4*x₆_0*k₆_0 + 3*x₄_2*x₅_1*k₇_0 + 3*x₅_2*x₄_1*k₇_0 + x₄_3*x₅_0*k₇_0 + x₅_3*x₄_0*k₇_0 + x₅_3*k₆_0*k₇_0 + 3*x₅_2*x₄_2*k₈_0 + x₄_3*x₅_1*k₈_0 + 3*x₅_3*x₄_1*k₈_0 + x₅_4*x₄_0*k₈_0 - x₄_3*k₅_0*k₈_0 + x₅_4*k₆_0*k₈_0,
		-2*x₆_1^2*x₅_0*k₉_0 - 4*x₅_1*x₆_1*x₆_0*k₉_0 - 6*x₆_1^2*x₆_0*k₉_0 - 2*x₆_2*x₅_0*x₆_0*k₉_0 - x₅_2*x₆_0^2*k₉_0 - 3*x₆_2*x₆_0^2*k₉_0 - 2*x₆_1^2*k₈_0*k₉_0 - 2*x₆_2*x₆_0*k₈_0*k₉_0 + 2*x₅_1*x₆_1*k₉_0*k₁₀_0 + 2*x₆_1^2*k₉_0*k₁₀_0 + x₆_2*x₅_0*k₉_0*k₁₀_0 + x₅_2*x₆_0*k₉_0*k₁₀_0 + 2*x₆_2*x₆_0*k₉_0*k₁₀_0 + x₆_2*k₈_0*k₉_0*k₁₀_0 + 2*x₆_2*x₅_1*k₁₀_0 + x₅_2*x₆_1*k₁₀_0 + 3*x₆_2*x₆_1*k₁₀_0 + x₆_3*x₅_0*k₁₀_0 + x₆_3*x₆_0*k₁₀_0 - x₅_2*k₇_0*k₁₀_0 + x₆_3*k₈_0*k₁₀_0,
		-x₅_4 + k(2384600107053046350336284721889961310439671682490966697898251815647085963223364450561445799962196135486227502355019460458362655019402659908224112357887093140620106583542649241530771655766184054775437542040535327108846232314842097824067328833840011)//k(4781254308848116875254357471372705191892638442233768626304550517795792797007294545173750025977489674836648929529813506319161992461788980834876125230656790367832312111480486502438455241818619510046),
		18*x₅_2*x₄_2*x₅_1 + 6*x₆_2*x₄_2*x₅_1 + 4*x₄_3*x₅_1^2 + 12*x₅_2*x₄_2*x₆_1 + 4*x₄_3*x₅_1*x₆_1 + 12*x₅_2^2*x₄_1 + 12*x₅_2*x₆_2*x₄_1 + 16*x₅_3*x₅_1*x₄_1 + 4*x₆_3*x₅_1*x₄_1 + 12*x₅_3*x₆_1*x₄_1 + 4*x₄_3*x₅_2*x₅_0 + 6*x₅_3*x₄_2*x₅_0 + x₄_4*x₅_1*x₅_0 + 4*x₅_4*x₄_1*x₅_0 + 4*x₄_3*x₅_2*x₆_0 + 6*x₅_3*x₄_2*x₆_0 + x₄_4*x₅_1*x₆_0 + 4*x₅_4*x₄_1*x₆_0 + 10*x₅_3*x₅_2*x₄_0 + 4*x₆_3*x₅_2*x₄_0 + 6*x₅_3*x₆_2*x₄_0 + 5*x₅_4*x₅_1*x₄_0 + x₆_4*x₅_1*x₄_0 + 4*x₅_4*x₆_1*x₄_0 + x₅_5*x₅_0*x₄_0 + x₅_5*x₆_0*x₄_0 - 6*x₅_2*x₄_2*k₅_0 - 6*x₆_2*x₄_2*k₅_0 - 4*x₄_3*x₅_1*k₅_0 - 4*x₄_3*x₆_1*k₅_0 - 4*x₅_3*x₄_1*k₅_0 - 4*x₆_3*x₄_1*k₅_0 - x₄_4*x₅_0*k₅_0 - x₄_4*x₆_0*k₅_0 - x₅_4*x₄_0*k₅_0 - x₆_4*x₄_0*k₅_0 + 10*x₅_3*x₅_2*k₆_0 + 4*x₆_3*x₅_2*k₆_0 + 6*x₅_3*x₆_2*k₆_0 + 5*x₅_4*x₅_1*k₆_0 + x₆_4*x₅_1*k₆_0 + 4*x₅_4*x₆_1*k₆_0 + x₅_5*x₅_0*k₆_0 + x₅_5*x₆_0*k₆_0 + 6*x₅_2*x₄_2*k₇_0 + 4*x₄_3*x₅_1*k₇_0 + 4*x₅_3*x₄_1*k₇_0 + x₄_4*x₅_0*k₇_0 + x₅_4*x₄_0*k₇_0 + x₅_4*k₆_0*k₇_0 + 4*x₄_3*x₅_2*k₈_0 + 6*x₅_3*x₄_2*k₈_0 + x₄_4*x₅_1*k₈_0 + 4*x₅_4*x₄_1*k₈_0 + x₅_5*x₄_0*k₈_0 - x₄_4*k₅_0*k₈_0 + x₅_5*k₆_0*k₈_0,
		3*x₄_2^2 + 4*x₄_3*x₄_1 + x₄_4*x₄_0 + x₄_3*k₅_0 + x₄_4*k₆_0,
		-6*x₅_1*x₆_1^2*k₉_0 - 6*x₆_1^3*k₉_0 - 6*x₆_2*x₆_1*x₅_0*k₉_0 - 6*x₆_2*x₅_1*x₆_0*k₉_0 - 6*x₅_2*x₆_1*x₆_0*k₉_0 - 18*x₆_2*x₆_1*x₆_0*k₉_0 - 2*x₆_3*x₅_0*x₆_0*k₉_0 - x₅_3*x₆_0^2*k₉_0 - 3*x₆_3*x₆_0^2*k₉_0 - 6*x₆_2*x₆_1*k₈_0*k₉_0 - 2*x₆_3*x₆_0*k₈_0*k₉_0 + 3*x₆_2*x₅_1*k₉_0*k₁₀_0 + 3*x₅_2*x₆_1*k₉_0*k₁₀_0 + 6*x₆_2*x₆_1*k₉_0*k₁₀_0 + x₆_3*x₅_0*k₉_0*k₁₀_0 + x₅_3*x₆_0*k₉_0*k₁₀_0 + 2*x₆_3*x₆_0*k₉_0*k₁₀_0 + x₆_3*k₈_0*k₉_0*k₁₀_0 + 3*x₅_2*x₆_2*k₁₀_0 + 3*x₆_2^2*k₁₀_0 + 3*x₆_3*x₅_1*k₁₀_0 + x₅_3*x₆_1*k₁₀_0 + 4*x₆_3*x₆_1*k₁₀_0 + x₆_4*x₅_0*k₁₀_0 + x₆_4*x₆_0*k₁₀_0 - x₅_3*k₇_0*k₁₀_0 + x₆_4*k₈_0*k₁₀_0,
		-x₅_5 - k(462306381610934386161590109434596611812300250627682846746052501392730255207574977651907113785692803839662165885540030379523603169739422460008241454961035411824975810893999085822725090507678919288969636407403578970894466887960513558609736591962593405648863798338833786012757779909083266703902382738836256992754182229)//k(236224544716894329256657689350480024599688212957791963779107700577541062573687585276827003603374856447830036794494900999645954315328568366742853830459798838618066891821709595787088711164807427116124867301069569340448278268865215683762465660681870162484),
		30*x₅_2^2*x₄_2 + 30*x₅_2*x₆_2*x₄_2 + 30*x₄_3*x₅_2*x₅_1 + 10*x₄_3*x₆_2*x₅_1 + 40*x₅_3*x₄_2*x₅_1 + 10*x₆_3*x₄_2*x₅_1 + 5*x₄_4*x₅_1^2 + 20*x₄_3*x₅_2*x₆_1 + 30*x₅_3*x₄_2*x₆_1 + 5*x₄_4*x₅_1*x₆_1 + 50*x₅_3*x₅_2*x₄_1 + 20*x₆_3*x₅_2*x₄_1 + 30*x₅_3*x₆_2*x₄_1 + 25*x₅_4*x₅_1*x₄_1 + 5*x₆_4*x₅_1*x₄_1 + 20*x₅_4*x₆_1*x₄_1 + 10*x₅_3*x₄_3*x₅_0 + 5*x₄_4*x₅_2*x₅_0 + 10*x₅_4*x₄_2*x₅_0 + x₄_5*x₅_1*x₅_0 + 5*x₅_5*x₄_1*x₅_0 + 10*x₅_3*x₄_3*x₆_0 + 5*x₄_4*x₅_2*x₆_0 + 10*x₅_4*x₄_2*x₆_0 + x₄_5*x₅_1*x₆_0 + 5*x₅_5*x₄_1*x₆_0 + 10*x₅_3^2*x₄_0 + 10*x₅_3*x₆_3*x₄_0 + 15*x₅_4*x₅_2*x₄_0 + 5*x₆_4*x₅_2*x₄_0 + 10*x₅_4*x₆_2*x₄_0 + 6*x₅_5*x₅_1*x₄_0 + x₆_5*x₅_1*x₄_0 + 5*x₅_5*x₆_1*x₄_0 + x₅_6*x₅_0*x₄_0 + x₅_6*x₆_0*x₄_0 - 10*x₄_3*x₅_2*k₅_0 - 10*x₄_3*x₆_2*k₅_0 - 10*x₅_3*x₄_2*k₅_0 - 10*x₆_3*x₄_2*k₅_0 - 5*x₄_4*x₅_1*k₅_0 - 5*x₄_4*x₆_1*k₅_0 - 5*x₅_4*x₄_1*k₅_0 - 5*x₆_4*x₄_1*k₅_0 - x₄_5*x₅_0*k₅_0 - x₄_5*x₆_0*k₅_0 - x₅_5*x₄_0*k₅_0 - x₆_5*x₄_0*k₅_0 + 10*x₅_3^2*k₆_0 + 10*x₅_3*x₆_3*k₆_0 + 15*x₅_4*x₅_2*k₆_0 + 5*x₆_4*x₅_2*k₆_0 + 10*x₅_4*x₆_2*k₆_0 + 6*x₅_5*x₅_1*k₆_0 + x₆_5*x₅_1*k₆_0 + 5*x₅_5*x₆_1*k₆_0 + x₅_6*x₅_0*k₆_0 + x₅_6*x₆_0*k₆_0 + 10*x₄_3*x₅_2*k₇_0 + 10*x₅_3*x₄_2*k₇_0 + 5*x₄_4*x₅_1*k₇_0 + 5*x₅_4*x₄_1*k₇_0 + x₄_5*x₅_0*k₇_0 + x₅_5*x₄_0*k₇_0 + x₅_5*k₆_0*k₇_0 + 10*x₅_3*x₄_3*k₈_0 + 5*x₄_4*x₅_2*k₈_0 + 10*x₅_4*x₄_2*k₈_0 + x₄_5*x₅_1*k₈_0 + 5*x₅_5*x₄_1*k₈_0 + x₅_6*x₄_0*k₈_0 - x₄_5*k₅_0*k₈_0 + x₅_6*k₆_0*k₈_0,
		10*x₄_3*x₄_2 + 5*x₄_4*x₄_1 + x₄_5*x₄_0 + x₄_4*k₅_0 + x₄_5*k₆_0,
		-24*x₆_2*x₅_1*x₆_1*k₉_0 - 12*x₅_2*x₆_1^2*k₉_0 - 36*x₆_2*x₆_1^2*k₉_0 - 6*x₆_2^2*x₅_0*k₉_0 - 8*x₆_3*x₆_1*x₅_0*k₉_0 - 12*x₅_2*x₆_2*x₆_0*k₉_0 - 18*x₆_2^2*x₆_0*k₉_0 - 8*x₆_3*x₅_1*x₆_0*k₉_0 - 8*x₅_3*x₆_1*x₆_0*k₉_0 - 24*x₆_3*x₆_1*x₆_0*k₉_0 - 2*x₆_4*x₅_0*x₆_0*k₉_0 - x₅_4*x₆_0^2*k₉_0 - 3*x₆_4*x₆_0^2*k₉_0 - 6*x₆_2^2*k₈_0*k₉_0 - 8*x₆_3*x₆_1*k₈_0*k₉_0 - 2*x₆_4*x₆_0*k₈_0*k₉_0 + 6*x₅_2*x₆_2*k₉_0*k₁₀_0 + 6*x₆_2^2*k₉_0*k₁₀_0 + 4*x₆_3*x₅_1*k₉_0*k₁₀_0 + 4*x₅_3*x₆_1*k₉_0*k₁₀_0 + 8*x₆_3*x₆_1*k₉_0*k₁₀_0 + x₆_4*x₅_0*k₉_0*k₁₀_0 + x₅_4*x₆_0*k₉_0*k₁₀_0 + 2*x₆_4*x₆_0*k₉_0*k₁₀_0 + x₆_4*k₈_0*k₉_0*k₁₀_0 + 6*x₆_3*x₅_2*k₁₀_0 + 4*x₅_3*x₆_2*k₁₀_0 + 10*x₆_3*x₆_2*k₁₀_0 + 4*x₆_4*x₅_1*k₁₀_0 + x₅_4*x₆_1*k₁₀_0 + 5*x₆_4*x₆_1*k₁₀_0 + x₆_5*x₅_0*k₁₀_0 + x₆_5*x₆_0*k₁₀_0 - x₅_4*k₇_0*k₁₀_0 + x₆_5*k₈_0*k₁₀_0,
		-x₅_6 - k(2562234781595065906457035814819483146900473451622978384950889508902522745027732649649112891195216089491243939986594461715520615948589441913505037477171474580487552446183962463889703099765611140566789448496051284499414304400695275840799141179200116611967173371216100008079062022244667209044376647491492506322318138938472326111442526601125283678906942924882488432211212037617379694729045)//k(40848512069736935138419483813941025277293104128900971649504279321490996666256192159804175465308094145923996836206007968136838217573137697367074863923289952067072044195455358914006604066150712129622715620487858543033764309098327746559621050082314381345165286604132725540006390330745074044713456761781101889476),
		-x₅_7 + k(7665536256744016303146280109162274853603983722544889682404858010379449455580398607065681814867448753184160341074113530909640752045360193391189023687952277517611855254599762606581416068553370910547476507389896683411103482848977264906235331598025504846307066188197601444831598058041372521106703604017899586087959607959629538630247401895699697719126366050751466501626635306948020903918990594640503279211424504503667002388604630754146875049182544008180235211)//k(14127244400544368236067595166456276785318083801845902113037309077110293300620090331382781876538956582905288463204525977437287876605105450091479180820800793618891592459066894547194344890905523029876068908380461477047766975640571584473663007443574253437781323132072359759767220821654093308264252415973775955830742135624658156629805998553915979287904101142277080261928),
		-x₅_8 + k(39848828510046447812791768375380035101759547002057608147406894060596739490818331658081581934232395729397158980939373185511844319779129107286510411973795423257837578291771452533913606491311596621172494856080009040919195646202438268224341587108187857740563406442958838542427356184590013414126998598484616623251950657856394187461658574863594497045215379387246178363703755396534204304826299265193457138500423274391485161807160716625712082174938012538274378039514921644139708922947933503869111816895613679683492012622448645937211)//k(2442916819246551045539216113124354609453781996940637117743033825863924635688546734346430444377465042803393504338875734903737911974559219104280468729309546194681586505943095100169509460216835126070999014058790543556457398041234911526698818891268994498020019101258418562618009073145910326991814202428071014239558129171618093945329579967715382875314711872493684834926927254588077417542744365609015410533929290451440951064392),
		-x₅_9 - k(216432192012111783100634759385607158386729945482553330725272040618409083125605323791898643135801391008512285093909956356570390479102224470895821347724552305979438428389234451494528528278194036603631832655421999839753506010716691590450942365593838179202490747128627058859166787401325257581937032755767017936617301144454382041182944663628317727451452396910690847092897867973542303212207023167461322334908521994961198287304307138072936339538573469430140307031685137989811901002363531269495781792773999878072171874957059111606947630852312757180294202905690484474110385778213829214244061247175740583)//k(844870013790902626882207845031858067129066597195932139443848116939066385787082836000772704768484561304005509959537623481195387875001270929332976157485451667326954121558190843986308191373276828976323111783071438278077941865239755573291469214375227839253856737185090314493643510358240998731068382509680362300223336484167662197130975819164229126320864357472965712955121655952321733040240012020841640503102228799861825153422038145652338989696816803686401154241340105590423332020176),
		-x₅_10 - k(79161421951084427549586856436704233256737436721098771130933114237902538648863130622272566037969890768976242031396573393027820065993908330367212347655919649343316702069588575066293600658848181657346648893697683772756105162873604831007909502392470982559280345173411856424174377080392210887128305918254741846806318978942578314363692492687059774145582915311430192960360436404196875440479423859404306266348130329189813773384497443856409133242116010278451169601428376965191098547476814410095478454878301553583518514979618659831288899164479225988406370170314212576027411048288507116080600042212566496452709394156159287178558938601415675628417105264653730831705105376695)//k(11238226095122714304042554857709048085818010091729318421824445960029857537318737773700556365379466351241281243257419569006465865936334142737606085189529751543638466649547790772104752871260043643838488305821336272845150942192525059737162519933561997247817578645343832115237748563874852340325434437100893223424776854282949805451669575405415692538774591420558911071715081902026850588467055408655618868182756381158259235515377272832870146418331297292014667944696974033175578680488460414852598500797216151314479319912951085516732089333328),
		-x₅_11 + k(9260925264187946705953844444226641548312072318722229814909071838587821493609072098512415513598097868023024280445131507921828476706129585821071640456330365597092357578181215815921919777491774223586965694349993968426623791079098189769260633699770931899814387079088784667100231047121499038605909174984922518612661562322106451853339042395905583542900610646180697833805257197280608821353741045651366640371681457352414254839048590377391693494052560756636459826540797150063107240992159455586951546991287176111212014992280243959235232275078722097361134657730779616701456203513719493120785572914203433106027841832809249249912899580184279485410812034786439823736413380895229482086878701253790676451485413780602876835891293599381705269288920129)//k(50526862844925000075458170219156079538167696160347005835797134328869896531608860749258766575143735785426473041163839289044810443063926617362054229705862702505569187122817296350047036179410947944899535799659536106041690415842812936962190704584333266464771645778474850100306153484065133856154464156986972768958820258131731837629036745047405664723343937868016779450611275744383367781426457219611442895319524381701027729305164038300594426052365912094626195977742122364642631729256692775400394151968006614410548337818899662821064253187409382040011206153413358288162268904356536539430408582533792),
		-x₅_12 + k(505553790857360181215251263736513375134332481480106668727714953166737889830471767523675607891169754450188716188210823656718211837269562641417940156997173714373289192823785792155282761045876072494463857493723017227490851536114443725244477034765079048382864845098509182938139807465403488092812715738144711520049843638754189431503563903101056374652379153752197638892817129255297604662817713318771250087654810291162669593679793697758142791348492406822414988378657368217103510744911083110700328734674593374296089114867097134293846052021534319562158308687408707537043100762883550550296542345366092204467284460899376194549984580744269636765786443684117322655197676109584765928773986162446810315023077383415007350212897055581174842236517740124417165864015028681637198665528049121276311047195337689235843453649)//k(113470463839538868350225854540604105700312855175376040145003436925417560105799817464781344799137291844855202015421145623946812363976176063406517274384030804030183179335327250351899619875492368074796852021631783305851366530837349255619220313139909051701138786334850138439714192796784366918033249024862779479238330049094417313552397056230325604506513301891523234850449431271167339731365958692589894609852139017191906244443329194322361792084582434943664106544211100574582576461637519832865378580506742300041064980767311482399384765823076716869140421128955504302465724942523337198994027398054464312759825928775494315723963217362058626450016044502944),
		-x₄_3 + k(610085679660590949962439800657150900029826683898242990661757710576217473547239424)//k(122607615139232223778585756176508534555690644402644276417069582721572057),
		-x₄_4 - k(805567647150741311495104896964977193834764386653453901829583202326612021216234330665301643489114197837479936)//k(3341368876175818718959818193303668989427407482463521185990735623921126886714938207223633591207661193),
		-x₄_5 - k(961945934305580204778702705507077027954436731257909508601429490958736255075279784683011283374984680770247586938779605833821842325897216)//k(13008683903638282929045293958708762898394382403511209187602810707768356885516185021328881817516356730555899001346295010099881151),
		x₅_0*x₄_0*z_aux*k₁₀_0 + x₆_0*x₄_0*z_aux*k₁₀_0 + x₅_0*z_aux*k₆_0*k₁₀_0 + x₆_0*z_aux*k₆_0*k₁₀_0 + x₄_0*z_aux*k₈_0*k₁₀_0 + z_aux*k₆_0*k₈_0*k₁₀_0 - 1
    ]
end
