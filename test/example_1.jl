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

# Point struct
struct point_t x::Cdouble; y::Cdouble; end

# Refine callback
function my_refine( ::Ptr{p4est_t}, which_tree::p4est_topidx_t, quadrant::Ptr{p4est_quadrant_t})
    @assert which_tree == 0
    q = unsafe_wrap(Array,quadrant,1)[1]
    ((q.level == 0) || (q.level < 5 && p4est_quadrant_child_id(quadrant) == 1)) && return Cint(1)
    return Cint(0)
end

# C-callable refine callback
const my_refine_c = @cfunction(my_refine, Cint, (Ptr{p4est_t}, p4est_topidx_t, Ptr{p4est_quadrant_t}))

# Search callback function
function search_point_fn(::Ptr{p4est_t}, ::p4est_topidx_t, ::Ptr{p4est_quadrant_t}, local_num::p4est_locidx_t, point::Ptr{Cvoid})
    @info local_num, unsafe_wrap(Array,convert(Ptr{point_t}, point),1)[1]
    return Cint(1)
end

# C-callable search callback function
const search_point_fn_c = @cfunction(search_point_fn, Cint, (Ptr{p4est_t}, p4est_topidx_t, Ptr{p4est_quadrant_t}, p4est_locidx_t, Ptr{Cvoid}))

#############################################################################
# Main program
#############################################################################

# Create a connectivity structure for the unit square.
unitsquare_connectivity = p4est_connectivity_new_unitsquare() 
@test unitsquare_connectivity != C_NULL

# Create a new forest
unitsquare_forest = p4est_new(MPI.COMM_WORLD, unitsquare_connectivity, 0, C_NULL, C_NULL) 
@test unitsquare_forest != C_NULL

# Register callback function to decide for refinement. 
p4est_refine(unitsquare_forest, 1, my_refine_c, C_NULL)

# Create a new sc_array
ptr_to_points_sc_array = sc_array_new_count(sizeof(point_t), 2)
@test ptr_to_points_sc_array != C_NULL

# Check correct number of elements and its size in sc_array
points_sc_array = unsafe_wrap(Array, ptr_to_points_sc_array, 1)[1]
@test points_sc_array.elem_count == 2 && points_sc_array.elem_size == sizeof(point_t)

# Obtain reference to first point_t 
ptr_to_points_array = convert(Ptr{point_t}, sc_array_index(ptr_to_points_sc_array,0))
@test ptr_to_points_array != C_NULL

# Overwrite point_t values in sc_array
unsafe_store!(ptr_to_points_array, point_t(0.24, 0.24), 1)
unsafe_store!(ptr_to_points_array, point_t(0.51, 0.256), 2)

# Search through quadrants, the local part of a forest, or the partition.
p4est_search(unitsquare_forest, C_NULL, search_point_fn_c, ptr_to_points_sc_array)
# Write forest to VTK file
p4est_vtk_write_file(unitsquare_forest, C_NULL, "my_step")

# Destroy sc_array structure
sc_array_destroy(ptr_to_points_sc_array)
# Destroy the forest
p4est_destroy(unitsquare_forest)
# Destroy the connectivity
p4est_connectivity_destroy(unitsquare_connectivity)

# Finalize MPI if initialized and session is not interactive
if (MPI.Initialized() && !isinteractive())
    MPI.Finalize()
end
