using MPI
using p4est_wrapper
using Test

if !MPI.Initialized()
    MPI.Init()
end

mpicomm = MPI.COMM_WORLD

function my_refine( ::Ptr{p4est_t}, which_tree::p4est_topidx_t, quadrant::Ptr{p4est_quadrant_t})
    @assert which_tree == 0
    q = unsafe_load(quadrant)
    ((q.level == 0) || (q.level < 2 && p4est_quadrant_child_id(quadrant) == 1)) && return Cint(1)
    return Cint(0)
end

const my_refine_c = @cfunction(my_refine, Cint, (Ptr{p4est_t}, p4est_topidx_t, Ptr{p4est_quadrant_t}))

unitsquare_connectivity = p4est_connectivity_new_unitsquare() 
@assert Bool(p4est_connectivity_is_valid(unitsquare_connectivity))
unitsquare_forest = p4est_new(MPI.COMM_WORLD, unitsquare_connectivity, sizeof(p4est_quadrant_t), C_NULL, C_NULL) 

p4est_refine(unitsquare_forest, 1, my_refine_c, C_NULL)
p4est_partition(unitsquare_forest, 0, C_NULL);

ptr_to_p4est_ghost = p4est_ghost_new(unitsquare_forest,p4est_wrapper.P4EST_CONNECT_FULL)
p4est_ghost = unsafe_load(ptr_to_p4est_ghost)

##p4est_quadrant_t * ptr_ghost_quadrants = (p4est_quadrant_t *) p4est_ghost->ghosts.array;
ptr_ghost_quadrants = convert(Ptr{p4est_quadrant_t},p4est_ghost.ghosts.array)
proc_offsets = unsafe_wrap(Array,p4est_ghost.proc_offsets,p4est_ghost.mpisize+1)

let mpirank = MPI.Comm_rank(mpicomm)
    for i=1:p4est_ghost.mpisize
        for j=proc_offsets[i]:proc_offsets[i+1]-1
            current_quadrant = ptr_ghost_quadrants+(sizeof(p4est_quadrant_t)*j)
            quadrant = unsafe_load(current_quadrant)
            piggy3 = reinterpret(p4est_wrapper.piggy3, [quadrant.p])[]
            @show mpirank, piggy3.local_num
        end
    end
end

p4est_ghost_destroy(ptr_to_p4est_ghost)
p4est_destroy(unitsquare_forest)
p4est_connectivity_destroy(unitsquare_connectivity)

MPI.Finalize()


if (MPI.Initialized() && !isinteractive())
    MPI.Finalize()
end

