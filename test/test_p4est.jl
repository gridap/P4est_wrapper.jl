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
dummy_callback( ::Ptr{p4est_t}, which_tree::p4est_topidx_t, quadrant::Ptr{p4est_quadrant_t}) = Cint(0)

# C-callable dummy callback
const dummy_callback_c = @cfunction(dummy_callback, Cint, (Ptr{p4est_t}, p4est_topidx_t, Ptr{p4est_quadrant_t}))

#############################################################################
# Main program
#############################################################################

# Create a connectivity structure for the unit square.
unitsquare_connectivity = p4est_connectivity_new_unitsquare()
@test unitsquare_connectivity != C_NULL
@test p4est_connectivity_is_valid(unitsquare_connectivity) == 1
@test p4est_connectivity_complete(unitsquare_connectivity) == nothing
@test p4est_connectivity_reduce(unitsquare_connectivity) == nothing

# Test new connectivities
for test_conn in [p4est_connectivity_new_periodic(), 
                p4est_connectivity_new_rotwrap(), 
                p4est_connectivity_new_corner(), 
                p4est_connectivity_new_pillow(), 
                p4est_connectivity_new_moebius(), 
                p4est_connectivity_new_star(), 
                p4est_connectivity_new_cubed()]
    @test test_conn != C_NULL
    @test p4est_connectivity_is_valid(test_conn) == 1
    @test p4est_connectivity_destroy(test_conn) == nothing
    @test p4est_connectivity_is_equivalent(unitsquare_connectivity, test_conn) == 0
end

# Create a new forest
unitsquare_forest = p4est_new(MPI.COMM_WORLD, unitsquare_connectivity, 0, C_NULL, C_NULL) 
@test unitsquare_forest != C_NULL

# Create/Destroy geometry
unitsquare_geometry = p4est_geometry_new_connectivity(unitsquare_forest)
@test unitsquare_geometry != C_NULL
@test p4est_geometry_destroy(unitsquare_geometry) == nothing

# Copy/Destroy forest
unitsquare_forest_copy =  p4est_copy(unitsquare_forest, 1)
@test p4est_destroy(unitsquare_forest_copy) == nothing
unitsquare_forest_copy =  p4est_copy_ext(unitsquare_forest, 1, 0)
@test p4est_destroy(unitsquare_forest_copy) == nothing

# Operations on forests
@test p4est_partition(unitsquare_forest, 0, C_NULL) == nothing
@test p4est_partition_ext(unitsquare_forest, 0, C_NULL) == 0
@test p4est_balance(unitsquare_forest, p4est_wrapper.P4EST_CONNECT_FULL, C_NULL) == nothing
@test p4est_balance_ext(unitsquare_forest, p4est_wrapper.P4EST_CONNECT_FULL, C_NULL, C_NULL) == nothing
@test p4est_refine(unitsquare_forest, 1, dummy_callback_c, C_NULL) == nothing
@test p4est_refine_ext(unitsquare_forest, 1, -1, dummy_callback_c, C_NULL, C_NULL) == nothing
@test p4est_coarsen(unitsquare_forest, 1, dummy_callback_c, C_NULL) == nothing
@test p4est_coarsen_ext(unitsquare_forest, 1, 0, dummy_callback_c, C_NULL, C_NULL) == nothing
@test p4est_revision(unitsquare_forest) == 0
@test typeof(p4est_checksum(unitsquare_forest)) == UInt32
@test p4est_connect_type_int(p4est_wrapper.P4EST_CONNECT_FACE) == 1
@test unsafe_string(p4est_connect_type_string(p4est_wrapper.P4EST_CONNECT_FACE)) == "FACE"

# Destroy the forest
@test p4est_destroy(unitsquare_forest) == nothing
# Destroy the connectivity
@test p4est_connectivity_destroy(unitsquare_connectivity) == nothing

# Finalize MPI if initialized and session is not interactive
if (MPI.Initialized() && !isinteractive())
    MPI.Finalize()
end


