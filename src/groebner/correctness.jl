
@noinline __not_a_basis_error(basis, msg) = throw(DomainError(basis, msg))

# Checks if the basis is reconstructed correctly.
# There are 3 levels of checks:
#   - heuristic check (dedicated to discard obviously bad cases),
#   - randomized check (checks correctness modulo a prime),
#   - certification (checks correctness directly over the rationals).
#
# Usually, by default, only the first two are active, which gives the correct
# basis with a high probability
@timeit function correctness_check!(
    state,
    lucky,
    ring,
    basis_qq,
    basis_zz,
    basis_ff,
    hashtable,
    params
)
    # First we check the size of the coefficients with a heuristic
    if params.heuristic_check
        if !heuristic_correctness_check(state.gb_coeffs_qq, lucky.modulo)
            @log level = -2 "Heuristic check failed."
            return false
        end
        @log level = -2 "Heuristic check passed!"
    end
    # Then check that a basis is also a basis modulo a prime
    if params.randomized_check
        if !randomized_correctness_check!(
            state,
            ring,
            basis_zz,
            basis_ff,
            lucky,
            hashtable,
            params
        )
            @log level = -2 "Randomized check failed."
            return false
        end
        @log level = -2 "Randomized check passed!"
    end
    if params.certify_check
        return certify_correctness_check!(
            state,
            ring,
            basis_qq,
            basis_ff,
            hashtable,
            params
        )
    end
    true
end

# Heuristic bound on the size of coefficients of the basis.
threshold_in_heuristic_check(sznum, szden, szmod) = 1.15 * (sznum + szden) >= szmod

# Checks that 
#   ln(num) + ln(den) < C ln(modulo)
# for all coefficients of form num/den
function heuristic_correctness_check(gb_coeffs_qq, modulo)
    lnm = Base.GMP.MPZ.sizeinbase(modulo, 2)
    @inbounds for i in 1:length(gb_coeffs_qq)
        for j in 1:length(gb_coeffs_qq[i])
            n = numerator(gb_coeffs_qq[i][j])
            d = denominator(gb_coeffs_qq[i][j])
            if threshold_in_heuristic_check(
                Base.GMP.MPZ.sizeinbase(n, 2),
                Base.GMP.MPZ.sizeinbase(d, 2),
                lnm
            )
                @log level = -5 "Heuristic check failed for coefficient $n/$d and modulo $modulo"
                return false
            end
        end
    end
    true
end

function randomized_correctness_check!(
    state,
    ring,
    input_zz,
    gb_ff,
    lucky,
    hashtable,
    params
)
    prime = next_check_prime!(lucky)
    @log level = -2 "Checking the correctness of reconstrcted basis modulo $prime"
    ring_ff, input_ff = reduce_modulo_p!(state.buffer, ring, input_zz, prime, deepcopy=true)
    gb_coeffs_zz = clear_denominators!(state.buffer, state.gb_coeffs_qq)
    gb_zz = copy_basis(gb_ff, gb_coeffs_zz, deepcopy=true)
    ring_ff, gb_ff = reduce_modulo_p!(state.buffer, ring, gb_zz, prime, deepcopy=false)
    # Check that initial ideal contains in the computed groebner basis modulo a
    # random prime
    arithmetic = select_arithmetic(prime, CoeffModular)
    # TODO: Why is this here?
    # F4 normalizes the basis on entry
    normalize_basis!(ring_ff, gb_ff)
    f4_normalform!(ring_ff, gb_ff, input_ff, hashtable, arithmetic)
    for i in 1:(input_ff.nprocessed)
        # meaning that something is not reduced
        if !iszero_coeffs(input_ff.coeffs[i])
            @log level = -2 "Some input generators are not in the ideal generated by the reconstructed basis modulo $prime"
            return false
        end
    end
    # Check that the basis is a groebner basis modulo a prime
    pairset = initialize_pairset(UInt64)
    if !f4_isgroebner!(ring_ff, gb_ff, pairset, hashtable, arithmetic)
        @log level = -2 "Not all of S-polynomials reduce to zero modulo $prime"
        return false
    end
    true
end

function certify_correctness_check!(state, ring, input_qq, gb_ff, hashtable, params)
    @log level = -2 "Checking the correctness of reconstructed basis over the rationals"
    gb_qq = copy_basis(gb_ff, state.gb_coeffs_qq, deepcopy=true)
    input_qq = deepcopy_basis(input_qq)
    f4_normalform!(ring, gb_qq, input_qq, hashtable, params.arithmetic)
    for i in 1:(input_qq.nprocessed)
        # Meaning that some polynomial is not reduced to zero
        if !iszero_coeffs(input_qq.coeffs[i])
            @log level = -2 "Some input generators are not in the ideal generated by the reconstructed basis"
            return false
        end
    end
    # Check that the basis is a groebner basis modulo a prime
    pairset = initialize_pairset(UInt64)
    if !f4_isgroebner!(ring, gb_qq, pairset, hashtable, params.arithmetic)
        @log level = -2 "Not all of S-polynomials reduce to zero"
        return false
    end
    true
end
