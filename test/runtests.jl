using MPI
using p4est_wrapper
using Test

# Skip tests if library was not properly loaded
if p4est_wrapper.P4EST_FOUND
    # Initialize MPI if not initialized yet
    if !MPI.Initialized()
        MPI.Init()
    end
    @testset "Example 1" begin include("example_1.jl") end
    @testset "Example 2" begin include("example_2.jl") end
    # Finalize MPI if initialized and session is not interactive
    if (MPI.Initialized() && !isinteractive())
        MPI.Finalize()
    end
end
