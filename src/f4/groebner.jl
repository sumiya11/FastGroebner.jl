
# Mutate everything!

#######################################
# Finite field groebner

function groebner_ff(
            ring::PolyRing,
            exps::Vector{Vector{Vector{UInt16}}},
            coeffs::Vector{Vector{UInt64}},
            reduced::Bool,
            rng::Rng) where {Rng<:Random.AbstractRNG}
    # specialize on ordering (not yet)
    # groebner_ff(ring, exps, coeffs, reduced, rng, Val(ring.ord))
    f4(ring, exps, coeffs, rng, reduced)
end

#######################################
# Rational field groebner

function groebner_qq(
            ring::PolyRing,
            exps::Vector{Vector{Vector{UInt16}}},
            coeffs::Vector{Vector{Rational{BigInt}}},
            reduced::Bool,
            randomized::Bool,
            rng::Rng,
            ) where {Rng<:Random.AbstractRNG}

    # we can mutate coeffs and exps here

    gbcoeffs_accum = Vector{Vector{BigInt}}(undef, 0)
    gbcoeffs_qq = Vector{Vector{Rational{BigInt}}}(undef, 0)

    init_coeffs_zz = scale_denominators(coeffs)

    @warn "scaled" coeffs init_coeffs_zz

    modulo = BigInt(1)
    prime = nextluckyprime(init_coeffs_zz)
    moduli = Int[prime]
    goodprime = nextgoodprime(init_coeffs_zz, moduli)

    ring_ff, init_coeffs_ff = reduce_modulo(init_coeffs_zz, ring, prime)

    @warn "reduced" ring_ff init_coeffs_ff init_coeffs_zz

    # TODO: 2^16
    init_gens_temp_ff, ht = initialize_structures(ring_ff, exps,
                                                    init_coeffs_zz, init_coeffs_ff,
                                                    rng, 2^16)
    gens_ff = copy_basis(init_gens_temp_ff)

    @warn "after init" gens_ff

    i = 1
    while true
        @info "$i: selected lucky prime $prime"

        f4!(ring_ff, gens_ff, ht, reduced)
        @info "basis computed" gens_ff.coeffs

        @info "CRT modulo ($modulo, $(ring_ff.ch))"
        reconstruct_crt!(gbcoeffs_accum, modulo, gens_ff.coeffs, ring_ff)

        @info "reconstructed #1" gbcoeffs_accum

        @info "Reconstructing modulo $modulo"
        reconstruct_modulo!(gbcoeffs_qq, gbcoeffs_accum, modulo)

        @info "reconstructed #2" gbcoeffs_qq
        println(ht.exponents[1:10])

        buf_ff = copy_basis(init_gens_temp_ff)
        if correctness_check!(init_coeffs_zz, ring_ff, gens_ff,
                                        buf_ff, ht, gbcoeffs_qq,
                                        modulo, randomized, goodprime)
            @info "Success!"
            break
        end

        prime = nextluckyprime(init_coeffs_zz, prime)
        goodprime = nextgoodprime(init_coeffs_zz, moduli, goodprime)
        push!(moduli, prime)

        reduce_modulo!(init_coeffs_zz, prime, ring_ff, init_gens_temp_ff)
        gens_ff = copy_basis(init_gens_temp_ff)

        i += 1
    end

    # normalize_coeffs!(gbcoeffs_qq)
    gbexps = hash_to_exponents(gens_ff, ht)
    gbexps, gbcoeffs_qq
end

#######################################
# Finite field isgroebner

# UWU!
function isgroebner_ff(
            ring::PolyRing,
            exps::Vector{Vector{Vector{UInt16}}},
            coeffs::Vector{Vector{UInt64}},
            rng)

    isgroebner_f4(ring, exps, coeffs, rng)
end

#######################################
# Rational field groebner

# TODO
function isgroebner_qq(
            ring::PolyRing,
            exps::Vector{Vector{Vector{UInt16}}},
            coeffs::Vector{Vector{Rational{BigInt}}},
            randomized::Bool,
            rng)

    if randomized
        coeffs_zz = scale_denominators!(coeffs)
        goodprime = nextgoodprime(coeffs_zz, Int[], 2^30 + 3)
        ring_ff, coeffs_ff = reduce_modulo(coeffs_zz, ring, goodprime)
        isgroebner_f4(ring_ff, exps, coeffs_ff, rng)
    else
        error("Sorry, not randomized version is not implemented yet.")
    end
end
