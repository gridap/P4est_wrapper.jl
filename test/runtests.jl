using MPI
using P4est_wrapper
using Test


# Skip tests if library was not properly loaded
if P4est_wrapper.P4EST_FOUND
    repodir = normpath(joinpath(@__DIR__,".."))
    nprocs = min(Sys.CPU_THREADS, 2)
    dir = dirname(@__FILE__)
    julia = Base.julia_cmd()
    mpiexec = MPI.mpiexec()
    if MPI.MPI_LIBRARY == "OpenMPI" || (isdefined(MPI, :OpenMPI) && MPI.MPI_LIBRARY == MPI.OpenMPI)
       extra_args = `--allow-run-as-root --tag-output`
    else
       extra_args = ``
    end
    @testset "Test SC bindings" begin
	cmd = `$mpiexec -n $nprocs $(extra_args) $(julia) --project=$repodir $(joinpath(dir, "test_sc_bindings.jl"))`
        @show cmd
        run(cmd)
    end
    @testset "Test P4EST bindings" begin
        cmd = `$mpiexec -n $nprocs $(extra_args) $(julia) --project=$repodir $(joinpath(dir, "test_p4est_bindings.jl"))`
        @show cmd
        run(cmd)
    end
    @testset "Test P8EST bindings" begin
        cmd = `$mpiexec -n $nprocs $(extra_args) $(julia) --project=$repodir $(joinpath(dir, "test_p8est_bindings.jl"))`
        @show cmd
        run(cmd)
    end
    @testset "Example 1" begin
        cmd = `$mpiexec -n $nprocs $(extra_args) $(julia) --project=$repodir $(joinpath(dir, "example_1.jl"))`
        @show cmd
        run(cmd)
    end
    @testset "Example 2" begin
        cmd = `$mpiexec -n $nprocs $(extra_args) $(julia) --project=$repodir $(joinpath(dir, "example_2.jl"))`
        @show cmd
        run(cmd)
    end
    @testset "Example 3" begin
        cmd = `$mpiexec -n $nprocs $(extra_args) $(julia) --project=$repodir $(joinpath(dir, "example_3.jl"))`
        @show cmd
        run(cmd)
    end
end
