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

# piggy3_t struct
struct piggy3_t which_tree::p4est_topidx_t; local_num::p4est_locidx_t; end

# Refine callback
function my_refine( ::Ptr{p4est_t}, which_tree::p4est_topidx_t, quadrant::Ptr{p4est_quadrant_t})
    @assert which_tree == 0
    q = unsafe_wrap(Array,quadrant,1)[1]
    ((q.level == 0) || (q.level < 2 && p4est_quadrant_child_id(quadrant) == 1)) && return Cint(1)
    return Cint(0)
end

# C-callable refine callback
const my_refine_c = @cfunction(my_refine, Cint, (Ptr{p4est_t}, p4est_topidx_t, Ptr{p4est_quadrant_t}))

#############################################################################
# Main program
#############################################################################

# Create a connectivity structure for the unit square.
unitsquare_connectivity = p4est_connectivity_new_unitsquare() 
@assert Bool(p4est_connectivity_is_valid(unitsquare_connectivity))

# Create a new forest
unitsquare_forest = p4est_new(MPI.COMM_WORLD, unitsquare_connectivity, sizeof(p4est_quadrant_t), C_NULL, C_NULL) 
@test unitsquare_forest != C_NULL

# Register callback function to decide for refinement. 
p4est_refine(unitsquare_forest, 1, my_refine_c, C_NULL)

# Equally partition the forest. The partition can be by element count or by a user-defined weight.
p4est_partition(unitsquare_forest, 0, C_NULL);

# Build the ghost layer. 
ptr_to_p4est_ghost = p4est_ghost_new(unitsquare_forest, p4est_wrapper.P4EST_CONNECT_FULL)
p4est_ghost = unsafe_wrap(Array,ptr_to_p4est_ghost,1)[1]

# Obtain ghost quadrants
##p4est_quadrant_t * ptr_ghost_quadrants = (p4est_quadrant_t *) p4est_ghost->ghosts.array;
ptr_ghost_quadrants = Ptr{p4est_quadrant_t}(p4est_ghost.ghosts.array)
proc_offsets = unsafe_wrap(Array, p4est_ghost.proc_offsets, p4est_ghost.mpisize+1)
ghost_quadrants = unsafe_wrap(Array, ptr_ghost_quadrants, p4est_ghost.ghosts.elem_count)

let mpirank = MPI.Comm_rank(MPI.COMM_WORLD)
    for i=1:p4est_ghost.mpisize
        for j=proc_offsets[i]:proc_offsets[i+1]-1
            quadrant = ghost_quadrants[j+1]
            piggy3 = reinterpret(piggy3_t, [quadrant.p])[]
            @test Bool(p4est_quadrant_is_valid(ptr_ghost_quadrants+(sizeof(p4est_quadrant_t)*j)))
            p4est_quadrant_print(p4est_wrapper.SC_LP_INFO, ptr_ghost_quadrants+(sizeof(p4est_quadrant_t)*j))
            print("(rank, local_num) ($(mpirank),$(piggy3.local_num)) \n")
        end
    end
end

# Destroy the ghost structure
p4est_ghost_destroy(ptr_to_p4est_ghost)
# Destroy the forest
p4est_destroy(unitsquare_forest)
# Destroy the connectivity
p4est_connectivity_destroy(unitsquare_connectivity)

# Finalize MPI if initialized and session is not interactive
if (MPI.Initialized() && !isinteractive())
    MPI.Finalize()
end
