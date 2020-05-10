using p4est_wrapper
using Test

# Skip tests if library was not properly loaded
if p4est_wrapper.P4EST_FOUND
    @testset "p4est example" begin include("p4est_example.jl") end
end
