using MPI
using p4est_wrapper
using Test


# Skip tests if library was not properly loaded
if p4est_wrapper.P4EST_FOUND


    nprocs = min(Sys.CPU_THREADS, 2)
    dir = dirname(@__FILE__)
    julia = Base.julia_cmd()
    mpiexec = MPI.mpiexec_path
    @testset "Test SC bindings" begin 
        cmd = `$mpiexec -n $nprocs --allow-run-as-root --tag-output $(julia) $(joinpath(dir, "test_sc_bindings.jl"))`
        @show cmd
        run(cmd)
    end
    @testset "Test P4EST bindings" begin 
        cmd = `$mpiexec -n $nprocs --allow-run-as-root --tag-output $(julia) $(joinpath(dir, "test_p4est_bindings.jl"))`
        @show cmd
        run(cmd)
    end
    @testset "Test P8EST bindings" begin 
        cmd = `$mpiexec -n $nprocs --allow-run-as-root --tag-output $(julia) $(joinpath(dir, "test_p8est_bindings.jl"))`
        @show cmd
        run(cmd)
    end
    @testset "Example 1" begin 
        cmd = `$mpiexec -n $nprocs --allow-run-as-root --tag-output $(julia) $(joinpath(dir, "example_1.jl"))`
        @show cmd
        run(cmd)
    end
    @testset "Example 2" begin 
        cmd = `$mpiexec -n $nprocs --allow-run-as-root --tag-output $(julia) $(joinpath(dir, "example_2.jl"))`
        @show cmd
        run(cmd)
    end
    @testset "Example 3" begin 
        cmd = `$mpiexec -n $nprocs --allow-run-as-root --tag-output $(julia) $(joinpath(dir, "example_3.jl"))`
        @show cmd
        run(cmd)
    end
end
