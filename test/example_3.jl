using MPI
using p4est_wrapper
using Test

# Initialize MPI if not initialized yet
if !MPI.Initialized()
    MPI.Init()
end

#############################################################################
# Definition of constants, data structures, functions and function callbacks
#############################################################################

## Global variable which is updated across calls to init_fn_callback_2d
current_quadrant_index = Cint(0)
## Global variable which is updated across calls to refine_replace_callback_2d
num_calls = Cint(0)

## Better to use a C-enum. But I did not use it in order to keep the Julia
## version of this C example as simple as possible
const nothing_flag = Cint(0)
const refine_flag  = Cint(1)
const coarsen_flag = Cint(2)

# This C callback function is called once per quadtree quadrant. Here we are assuming
# that p4est->user_pointer has been set prior to the first call to this call
# back function to an array of ints with as many entries as forest quadrants. This call back function
# initializes the quadrant->p.user_data void * pointer of all quadrants such that it
# points to the corresponding entry in the global array mentioned in the previous sentence.
function init_fn_callback_2d(forest_ptr::Ptr{p4est_t}, 
                            which_tree::p4est_topidx_t, 
                            quadrant_ptr::Ptr{p4est_quadrant_t})
    @assert which_tree == 0
    # Extract a reference to the first (and uniquely allowed) tree
    forest = forest_ptr[]
    tree = p4est_tree_array_index(forest.trees, 0)[]
    quadrant = quadrant_ptr[]
    q = p4est_quadrant_array_index(tree.quadrants, current_quadrant_index)
    @assert p4est_quadrant_compare(q,quadrant_ptr) == 0
    user_data  = unsafe_wrap(Array, Ptr{Cint}(forest.user_pointer), current_quadrant_index+1)[current_quadrant_index+1]
    unsafe_store!(Ptr{Cint}(quadrant.p.user_data), user_data, 1)
    global current_quadrant_index = (current_quadrant_index+1) % (tree.quadrants.elem_count)
    return nothing
end

const init_fn_callback_2d_c = @cfunction(init_fn_callback_2d, Cvoid, (Ptr{p4est_t}, p4est_topidx_t, Ptr{p4est_quadrant_t}))

function refine_callback_2d(::Ptr{p4est_t}, 
                            which_tree::p4est_topidx_t, 
                            quadrant_ptr::Ptr{p4est_quadrant_t})
    @assert which_tree == 0
    quadrant = quadrant_ptr[]
    return Cint(unsafe_wrap(Array, Ptr{Cint}(quadrant.p.user_data),1)[] == refine_flag)
end

const refine_callback_2d_c = @cfunction(refine_callback_2d, Cint, (Ptr{p4est_t}, p4est_topidx_t, Ptr{p4est_quadrant_t}))

# For each refined quadrant:
#   num_calls is even -> leave untouched all children
#   num_calls is odd  -> mark all children for coarsening
function refine_replace_callback_2d(forest_ptr::Ptr{p4est_t}, 
                                    which_tree::p4est_topidx_t, 
                                    num_outgoing::Cint, 
                                    outgoing_ptr::Ptr{Ptr{p4est_quadrant_t}}, 
                                    num_incoming::Cint, 
                                    incoming_ptr::Ptr{Ptr{p4est_quadrant_t}})
    @assert which_tree   == 0
    @assert num_outgoing == 1
    @assert num_incoming == p4est_wrapper.P4EST_CHILDREN
    incoming = unsafe_wrap(Array, incoming_ptr, p4est_wrapper.P4EST_CHILDREN)
    for quadrant_index = 1:p4est_wrapper.P4EST_CHILDREN
        quadrant = incoming[quadrant_index][]
        if (num_calls % 2 == 0)
            unsafe_store!(Ptr{Cint}(quadrant.p.user_data), nothing_flag, 1)
        else
            unsafe_store!(Ptr{Cint}(quadrant.p.user_data), coarsen_flag, 1)
        end
    end
    global num_calls += 1
    return nothing
end

const refine_replace_callback_2d_c = @cfunction(refine_replace_callback_2d, Cvoid, (Ptr{p4est_t}, p4est_topidx_t, Cint, Ptr{Ptr{p4est_quadrant_t}}, Cint, Ptr{Ptr{p4est_quadrant_t}}))

function coarsen_callback_2d(forest_ptr::Ptr{p4est_t},
                            which_tree::p4est_topidx_t,
                            quadrants_ptr::Ptr{Ptr{p4est_quadrant_t}})
    @assert which_tree == 0
    coarsen = Cint(1)
    quadrants = unsafe_wrap(Array, quadrants_ptr, p4est_wrapper.P4EST_CHILDREN)
    for quadrant_index = 1:p4est_wrapper.P4EST_CHILDREN
        quadrant = quadrants[quadrant_index][]
        coarsen = Cint(unsafe_wrap(Array, Ptr{Cint}(quadrant.p.user_data), 1)[] ==  coarsen_flag)
        if (!Bool(coarsen)) return coarsen end
    end
    return coarsen
end

const coarsen_callback_2d_c = @cfunction(coarsen_callback_2d, Cint, (Ptr{p4est_t}, p4est_topidx_t, Ptr{Ptr{p4est_quadrant_t}}))

## Refine those cells with even identifier    (0,2,4,6,8,...)
## Leave untouched cells with odd identifier  (1,3,5,7,9,...)
function allocate_and_set_refinement_and_coarsening_flags(forest_ptr::Ptr{p4est_t})
    forest = forest_ptr[]
    tree = p4est_tree_array_index(forest.trees, 0)[]
    refinement_and_coarsening_flags = Ptr{Cint}(Libc.malloc(sizeof(Cint)*tree.quadrants.elem_count))
    for i = 1:tree.quadrants.elem_count
        if (i%2 == 0)
            unsafe_store!(refinement_and_coarsening_flags, nothing_flag, i)
        else
            unsafe_store!(refinement_and_coarsening_flags, refine_flag, i)
        end
    end
    return refinement_and_coarsening_flags
end

function perform_single_mesh_adaptation_step(forest_ptr::Ptr{p4est_t}, step::Int)
    name = string("step_", step)
    user_data = allocate_and_set_refinement_and_coarsening_flags(forest_ptr)
    p4est_reset_data(forest_ptr, Cint(sizeof(Cint)), init_fn_callback_2d_c, Ptr{Cvoid}(user_data))
    p4est_refine_ext(forest_ptr, 0, -1, refine_callback_2d_c, C_NULL, refine_replace_callback_2d_c)
    p4est_coarsen(forest_ptr, 0, coarsen_callback_2d_c, C_NULL)
    p4est_partition(forest_ptr, 1, C_NULL)
    p4est_vtk_write_file(forest_ptr, C_NULL, name)
    Libc.free(user_data)
end

#############################################################################
# Main program
#############################################################################

sc_init(MPI.COMM_WORLD, Cint(true), Cint(true), C_NULL, p4est_wrapper.SC_LP_DEFAULT)
p4est_init(C_NULL, p4est_wrapper.SC_LP_DEFAULT)

unitsquare_connectivity = p4est_connectivity_new_unitsquare()
unitsquare_forest = p4est_new(MPI.COMM_WORLD, unitsquare_connectivity, 0, C_NULL, C_NULL)

for i=1:7
    perform_single_mesh_adaptation_step(unitsquare_forest,i)
end

p4est_destroy(unitsquare_forest);
p4est_connectivity_destroy(unitsquare_connectivity)
sc_finalize()


# Finalize MPI if initialized and session is not interactive
if (MPI.Initialized() && !isinteractive())
    MPI.Finalize()
end
