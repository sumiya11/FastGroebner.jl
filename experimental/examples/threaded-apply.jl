using AbstractAlgebra, Primes, Base.Threads
using BenchmarkTools
# using Groebner

# Computes the bases of the given system modulo different primes
function compute_bases(system, batch_size::Int)
    prime = 2^30 + 3
    Zp = GF(prime)

    system_zp = map(f -> map_coefficients(c -> Zp(c), f), system)
    trace, _ = Groebner.groebner_learn(system_zp)

    bases = Vector{typeof(system_zp)}()
    for j in 1:batch_size
        prime = Primes.nextprime(prime + 1)
        Zp = GF(prime)
        system_zp = map(f -> map_coefficients(c -> Zp(c), f), system)

        flag, gb = Groebner.groebner_apply!(trace, system_zp)
        @assert flag

        push!(bases, gb)
    end

    return bases
end

# Same as the above, but uses multi-threading
function compute_bases_threaded(system, batch_size::Int)
    prime = 2^30 + 3
    Zp = GF(prime)

    system_zp = map(f -> map_coefficients(c -> Zp(c), f), system)
    trace, _ = Groebner.groebner_learn(system_zp)

    bases = Vector{typeof(system_zp)}(undef, batch_size)
    buffer_traces = map(_ -> deepcopy(trace), 1:nthreads())

    buffer_zp = map(p -> GF(p), Primes.nextprimes(prime + 1, batch_size))
    buffer_systems_zp =
        map(zp -> map(f -> map_coefficients(c -> zp(c), f), system), buffer_zp)

    # :static guarantees that threadid() is constant within one iteraton
    Base.Threads.@threads :static for j in 1:batch_size
        t_id = threadid()

        system_zp = buffer_systems_zp[j]
        threadlocal_trace = buffer_traces[t_id]

        flag, gb = Groebner.groebner_apply!(threadlocal_trace, system_zp)
        @assert flag

        bases[j] = gb
    end

    return bases
end

# Same as the above, but also uses batch size 4
function compute_bases_threaded_batched(system, batch_size::Int)
    prime = 2^30 + 3
    Zp = GF(prime)

    system_zp = map(f -> map_coefficients(c -> Zp(c), f), system)
    trace, _ = Groebner.groebner_learn(system_zp)

    bases = Vector{typeof(system_zp)}(undef, batch_size)
    buffer_traces = map(_ -> deepcopy(trace), 1:nthreads())

    buffer_zp = map(p -> GF(p), Primes.nextprimes(prime + 1, batch_size))
    buffer_systems_zp =
        map(zp -> map(f -> map_coefficients(c -> zp(c), f), system), buffer_zp)

    # :static guarantees that threadid() is constant within one iteraton
    Base.Threads.@threads :static for j in 1:4:batch_size
        t_id = threadid()

        system_zp = (
            buffer_systems_zp[j],
            buffer_systems_zp[j + 1],
            buffer_systems_zp[j + 2],
            buffer_systems_zp[j + 3]
        )
        threadlocal_trace = buffer_traces[t_id]

        flag, gb = Groebner.groebner_apply!(threadlocal_trace, system_zp)
        @assert flag

        for i in 1:4
            bases[j + i - 1] = gb[i]
        end
    end

    return bases
end

system = Groebner.katsuran(10, ground=ZZ, ordering=:degrevlex)
begin
    GC.gc()
    @time bases_1 = compute_bases(system, 2^5)
    GC.gc()
    @time bases_2 = compute_bases_threaded(system, 2^5)
    GC.gc()
    @time bases_3 = compute_bases_threaded_batched(system, 2^5)
    @assert all(bases_1 .== bases_2) && all(bases_2 .== bases_3)
end;

GC.gc()
@profview compute_bases_threaded_batched(system, 2^8);

# @btime compute_bases($system, 5, 8);
# @btime compute_bases_threaded($system, 5, 8);
