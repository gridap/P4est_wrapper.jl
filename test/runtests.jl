using p4est_wrapper
using Test

# Skip tests if library was not properly loaded
if p4est_wrapper.P4EST_FOUND
    @testset "Example 1" begin include("example_1.jl") end
    @testset "Example 2" begin include("example_2.jl") end
end
