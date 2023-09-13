
function maximum_totaldeg(ring::PolyRing, monoms::Vector{Vector{T}}) where {T}
    D = zero(T)
    @inbounds for i in 1:length(monoms)
        d = totaldeg(monoms[i])
        D = max(d, D)
    end
    D
end

function homogenize_generators!(
    ring::PolyRing{Ord},
    monoms::Vector{Vector{Vector{T}}},
    coeffs::Vector{Vector{C}},
    params
) where {Ord, T, C <: Coeff}
    @log level = -1 "Homogenizing generators"
    @assert length(monoms) == length(coeffs)
    nvars = ring.nvars
    new_nvars = nvars + 1
    new_monoms = Vector{Vector{Vector{T}}}(undef, length(monoms))
    @inbounds for i in 1:length(monoms)
        D = maximum_totaldeg(ring, monoms[i])
        new_monoms[i] = Vector{Vector{T}}(undef, length(monoms[i]))
        for j in 1:length(monoms[i])
            # `+ 1` since exponent vectors also store the total degree
            new_monoms[i][j] = Vector{T}(undef, new_nvars + 1)
            d = totaldeg(monoms[i][j])
            @invariant d <= D
            new_monoms[i][j][1] = D
            new_monoms[i][j][end] = D - d
            for k in 2:(nvars + 1)
                new_monoms[i][j][k] = monoms[i][j][k]
            end
        end
    end
    # TODO: clarify the order of variables
    # (ideally it should be weighted)
    new_ord = _ProductOrdering(
        _Lex{false}(variable_indices(ring.ord)),
        _Lex{false}(Int[new_nvars])
    )
    new_ring = PolyRing(new_nvars, new_ord, ring.ch)
    # sort_input_terms_to_change_ordering!(new_monoms, coeffs, new_ord)
    @log level = -2 """
    Original polynomial ring: 
    $ring
    Homogenized polynomial ring: 
    $new_ring"""
    @log level = -7 """
    Original monomials: 
    $monoms
    Homogenized monomials: 
    $new_monoms
    """
    sat_var_index = new_nvars
    new_ring_sat, new_monoms, coeffs = saturate_generators_by_variable!(
        new_ring,
        new_monoms,
        coeffs,
        params,
        sat_var_index
    )
    new_ring_sat, new_monoms, coeffs
end

function dehomogenize_generators!(
    ring,
    monoms::Vector{Vector{Vector{T}}},
    coeffs::Vector{Vector{C}},
    params
) where {T, C <: Coeff}
    ring_desat, monoms, coeffs = desaturate_generators!(ring, monoms, coeffs, params)
    @assert length(monoms) == length(coeffs)
    @log level = -1 "De-homogenizing generators.."
    nvars = ring_desat.nvars
    @assert nvars > 1
    new_nvars = nvars - 1
    new_monoms = Vector{Vector{Vector{T}}}(undef, length(monoms))
    reduced_to_zero = Vector{Int}()
    @inbounds for i in 1:length(monoms)
        new_monoms[i] = Vector{Vector{T}}(undef, length(monoms[i]))
        for j in 1:length(monoms[i])
            new_monoms[i][j] = Vector{T}(undef, new_nvars + 1)
            for k in 2:(new_nvars + 1)
                new_monoms[i][j][k] = monoms[i][j][k]
            end
            new_monoms[i][j][1] = sum(new_monoms[i][j][2:end])
        end
        # if all(monom -> iszero(totaldeg(monom)), new_monoms[i])
        #     push!(reduced_to_zero, i)
        # end
    end
    deleteat!(new_monoms, reduced_to_zero)
    deleteat!(coeffs, reduced_to_zero)
    new_ord = ring_desat.ord.ord1
    new_ring = PolyRing(new_nvars, new_ord, ring_desat.ch)
    # sort_input_terms_to_change_ordering!(new_monoms, coeffs, new_ord)
    @log level = -2 """
    Original polynomial ring: 
    $ring_desat
    De-homogenized polynomial ring: 
    $new_ring"""
    @log level = -7 """
    Original monomials: 
    $monoms
    De-homogenized monomials: 
    $new_monoms
    """
    new_ring, new_monoms, coeffs
end

function desaturate_generators!(
    ring,
    monoms::Vector{Vector{Vector{T}}},
    coeffs::Vector{Vector{C}},
    params
) where {T, C <: Coeff}
    @assert length(monoms) == length(coeffs)
    @log level = -1 "De-saturating generators.."
    nvars = ring.nvars
    @assert nvars > 1
    new_nvars = nvars - 1
    new_monoms = Vector{Vector{Vector{T}}}(undef, length(monoms))
    new_coeffs = similar(coeffs)
    new_size = 0
    # remove the saturating variable
    @inbounds for i in 1:length(monoms)
        to_skip = false
        for j in 1:length(monoms[i])
            if monoms[i][j][end] > zero(T)
                to_skip = true
                break
            end
            to_skip && break
        end
        to_skip && break
        new_size += 1
        new_coeffs[new_size] = coeffs[i]
        new_monoms[new_size] = Vector{Vector{T}}(undef, length(monoms[i]))
        for j in 1:length(monoms[i])
            new_monoms[i][j] = Vector{T}(undef, new_nvars + 1)
            for k in 2:(new_nvars + 1)
                new_monoms[i][j][k] = monoms[i][j][k]
            end
            new_monoms[i][j][1] = sum(new_monoms[i][j][2:end])
        end
    end
    @assert new_size > 0
    resize!(new_coeffs, new_size)
    resize!(new_monoms, new_size)
    new_ord = ring.ord.ord2
    new_ring = PolyRing(new_nvars, new_ord, ring.ch)
    @log level = -2 """
    Original polynomial ring: 
    $ring
    De-saturated polynomial ring: 
    $new_ring"""
    @log level = -7 """
    Original monomials: 
    $monoms
    De-saturated monomials: 
    $new_monoms
    """
    new_ring, new_monoms, new_coeffs
end

function saturate_generators_by_variable!(
    ring,
    monoms::Vector{Vector{Vector{T}}},
    coeffs::Vector{Vector{C}},
    params,
    sat_var_index
) where {T, C <: Coeff}
    @assert length(monoms) == length(coeffs)
    @log level = -1 "Saturating by variable at index $sat_var_index.."
    nvars = ring.nvars
    new_nvars = nvars + 1
    new_monoms = Vector{Vector{Vector{T}}}(undef, length(monoms))
    @inbounds for i in 1:length(monoms)
        new_monoms[i] = Vector{Vector{T}}(undef, length(monoms[i]))
        for j in 1:length(monoms[i])
            # `+ 1` since exponent vectors also store the total degree
            new_monoms[i][j] = Vector{T}(undef, new_nvars + 1)
            for k in 1:(nvars + 1)
                new_monoms[i][j][k] = monoms[i][j][k]
            end
            new_monoms[i][j][end] = zero(T)
        end
    end
    # Construct `xi*t - 1`, where `i` is the `sat_var_index`
    new_poly_monoms = Vector{Vector{T}}(undef, 2)
    const_monom = zeros(T, new_nvars + 1)
    lead_monom = zeros(T, new_nvars + 1)
    lead_monom[sat_var_index + 1] = one(T)
    lead_monom[end] = one(T)
    new_poly_monoms[1] = lead_monom
    new_poly_monoms[2] = const_monom
    new_poly_coeffs = Vector{C}(undef, 2)
    new_poly_coeffs[1] = one(C)
    # TODO: minus one in the current ground field
    new_poly_coeffs[2] = iszero(ring.ch) ? -one(C) : (ring.ch - one(ring.ch))
    push!(new_monoms, new_poly_monoms)
    push!(coeffs, new_poly_coeffs)
    new_ord = _ProductOrdering(_Lex{false}(Int[new_nvars]), ring.ord)
    new_ring = PolyRing(new_nvars, new_ord, ring.ch)
    @log level = -2 """
    Original polynomial ring: 
    $ring
    Saturated polynomial ring: 
    $new_ring"""
    @log level = -7 """
    Original monomials: 
    $monoms
    Saturated monomials: 
    $new_monoms
    """
    new_ring, new_monoms, coeffs
end
