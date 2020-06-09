using MPI
using p4est_wrapper
using Test

# Initialize MPI if not initialized yet
if !MPI.Initialized()
    MPI.Init()
end

#############################################################################
# Definition of data structures and function callbacks
#############################################################################

# Dummy callback
dummy_callback( ::Ptr{p8est_t}, which_tree::p4est_topidx_t, quadrant::Ptr{p8est_quadrant_t}) = Cint(0)

# C-callable dummy callback
const dummy_callback_c = @cfunction(dummy_callback, Cint, (Ptr{p8est_t}, p4est_topidx_t, Ptr{p8est_quadrant_t}))

#############################################################################
# Main program
#############################################################################

# Create a connectivity structure for the unit square.
unitcube_connectivity = p8est_connectivity_new_unitcube()
@test unitcube_connectivity != C_NULL
@test p8est_connectivity_is_valid(unitcube_connectivity) == 1
@test p8est_connectivity_complete(unitcube_connectivity) == nothing
@test p8est_connectivity_reduce(unitcube_connectivity) == nothing

# Test new connectivities
for test_conn in [p8est_connectivity_new_periodic(), 
                p8est_connectivity_new_twocubes(),
                p8est_connectivity_new_twowrap(), 
                p8est_connectivity_new_rotcubes(), 
                p8est_connectivity_new_shell(), 
                p8est_connectivity_new_sphere(), 
                p8est_connectivity_new_brick(3, 2, 8, 1, 0, 1)]
    @test test_conn != C_NULL
    @test p8est_connectivity_is_valid(test_conn) == 1
    @test p8est_connectivity_is_equivalent(unitcube_connectivity, test_conn) == 0
    @test p8est_connectivity_destroy(test_conn) == nothing
end

# Create a new forest
unitcube_forest = p8est_new(MPI.COMM_WORLD, unitcube_connectivity, 0, C_NULL, C_NULL) 
@test unitcube_forest != C_NULL

# Create/Destroy geometry
unitcube_geometry = p8est_geometry_new_connectivity(unitcube_forest)
@test unitcube_geometry != C_NULL
@test p8est_geometry_destroy(unitcube_geometry) == nothing

# Copy/Destroy forest
unitcube_forest_copy =  p8est_copy(unitcube_forest, 1)
@test p8est_destroy(unitcube_forest_copy) == nothing
unitcube_forest_copy =  p8est_copy_ext(unitcube_forest, 1, 0)
@test p8est_destroy(unitcube_forest_copy) == nothing

# Operations on forests
@test p8est_partition(unitcube_forest, 0, C_NULL) == nothing
@test p8est_partition_ext(unitcube_forest, 0, C_NULL) == 0
@test p8est_balance(unitcube_forest, p4est_wrapper.P8EST_CONNECT_FULL, C_NULL) == nothing
@test p8est_balance_ext(unitcube_forest, p4est_wrapper.P8EST_CONNECT_FULL, C_NULL, C_NULL) == nothing
@test p8est_refine(unitcube_forest, 1, dummy_callback_c, C_NULL) == nothing
@test p8est_refine_ext(unitcube_forest, 1, -1, dummy_callback_c, C_NULL, C_NULL) == nothing
@test p8est_coarsen(unitcube_forest, 1, dummy_callback_c, C_NULL) == nothing
@test p8est_coarsen_ext(unitcube_forest, 1, 0, dummy_callback_c, C_NULL, C_NULL) == nothing
@test p8est_revision(unitcube_forest) == 0
@test typeof(p8est_checksum(unitcube_forest)) == UInt32
@test p8est_connect_type_int(p4est_wrapper.P8EST_CONNECT_FACE) == 1
@test unsafe_string(p8est_connect_type_string(p4est_wrapper.P8EST_CONNECT_FACE)) == "FACE"

# Destroy the forest
@test p8est_destroy(unitcube_forest) == nothing
# Destroy the connectivity
@test p8est_connectivity_destroy(unitcube_connectivity) == nothing

# Finalize MPI if initialized and session is not interactive
if (MPI.Initialized() && !isinteractive())
    MPI.Finalize()
end


