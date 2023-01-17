using MPI
using P4est_wrapper
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

## Refine those cells with even identifier    (0,2,4,6,8,...)
## Leave untouched cells with odd identifier  (1,3,5,7,9,...)
function allocate_and_set_refinement_and_coarsening_flags(forest_ptr::Ptr{p4est_t})
    forest = forest_ptr[]
    tree = p4est_tree_array_index(forest.trees, 0)[]
    return [i != 1 ? nothing_flag : refine_flag for i = 1:tree.quadrants.elem_count]
end

function perform_single_mesh_adaptation_step(forest_ptr::Ptr{p4est_t})
    user_data = allocate_and_set_refinement_and_coarsening_flags(forest_ptr)
    p4est_reset_data(forest_ptr, Cint(sizeof(Cint)), init_fn_callback_2d_c, pointer(user_data))
    p4est_refine_ext(forest_ptr, 0, -1, refine_callback_2d_c, C_NULL, C_NULL)
    p4est_partition(forest_ptr, 1, C_NULL)
end

#############################################################################
# Main program
#############################################################################

mpicomm = P4est_wrapper.P4EST_ENABLE_MPI ? MPI.COMM_WORLD : Cint(0)
sc_init(mpicomm, Cint(true), Cint(true), C_NULL, P4est_wrapper.SC_LP_DEFAULT)
p4est_init(C_NULL, P4est_wrapper.SC_LP_DEFAULT)

unitsquare_connectivity = p4est_connectivity_new_unitsquare()
unitsquare_forest = p4est_new(mpicomm, unitsquare_connectivity, 0, C_NULL, C_NULL)


perform_single_mesh_adaptation_step(unitsquare_forest)
perform_single_mesh_adaptation_step(unitsquare_forest)
p4est_vtk_write_file(unitsquare_forest, C_NULL, string("adapted_forest"))

p4est_ghost=p4est_ghost_new(unitsquare_forest, P4est_wrapper.P4EST_CONNECT_FULL)

# /** Store a parallel numbering of Lobatto points of a given degree > 0.
#  *
#  * Each element has degree+1 nodes per face
#  * and vnodes = (degree+1)^2 nodes per volume.
#  * num_local_elements is the number of local quadrants in the p4est.
#  * element_nodes is of dimension vnodes * num_local_elements and lists the
#  * nodes of each element in lexicographic yx-order (x varies fastest); so for
#  * degree == 2, this is the layout of nodes:
#  *
#  *         f_3
#  *  c_2           c_3
#  *      6---7---8
#  *      |       |
#  * f_0  3   4   5  f_1
#  *      |       |
#  *      0---1---2
#  *  c_0           c_1
#  *         f_2
#  *
#  * element_nodes indexes into the set of local nodes, layed out as follows:
#  * local nodes = [<-----owned_count----->|<-----nonlocal_nodes----->]
#  *             = [<----------------num_local_nodes----------------->]
#  * nonlocal_nodes contains the globally unique numbers for independent nodes
#  * that are owned by other processes; for local nodes, the globally unique
#  * numbers are given by i + global_offset, where i is the local number.
#  * Hanging nodes are always local and don't have a global number.
#  * They index the geometrically corresponding independent nodes of a neighbor.
#  *
#  * Whether nodes are hanging or not is decided based on the element faces.
#  * This information is encoded in face_code with one int8_t per element.
#  * If no faces are hanging, the value is zero, otherwise the face_code is
#  * interpreted by p4est_lnodes_decode.
#  *
#  * Independent nodes can be shared by multiple MPI ranks.
#  * The owner rank of a node is the one from the lowest numbered element
#  * on the lowest numbered octree *touching* the node.
#  *
#  * What is meant by *touching*?
#  * A quadrant is said to touch all faces/corners that are incident on it,
#  * and by extension all nodes that are contained in those faces/corners.
#  *
#  *         X +-----------+
#  *         o |           |
#  *         o |           |
#  * +-----+ o |     p     |
#  * |  q  | o |           |
#  * |     | o |           |
#  * +-----+ O +-----------+
#  *
#  * In this example degree = 6.  There are 5 nodes that live on the face
#  * between q and p, and one at each corner of that face.  The face is incident
#  * on q, so q owns the nodes on the face (provided q is from a lower tree or
#  * has a lower index than p).  The lower corner is incident on q, so q owns it
#  * as well.  The upper corner is not incident on q, so q cannot own it.
#  *
#  * global_owned_count contains the number of independent nodes owned by each
#  * process.
#  *
#  * The sharers array contains items of type p4est_lnodes_rank_t
#  * that hold the ranks that own or share independent local nodes.
#  * If there are no shared nodes on this processor, it is empty.
#  * Otherwise, it is sorted by rank and the current process is included.
#  *
#  * degree < 0 indicates that the lnodes data structure is being used to number
#  * the quadrant boundary object (faces and corners) rather than the $C^0$
#  * Lobatto nodes:
#  *
#  * if degree == -1, then one node is assigned per face, and no nodes are
#  * assigned per volume or per corner: this numbering can be used for low-order
#  * Raviart-Thomas elements.  In this case, vnodes == 4, and the nodes are
#  * listed in face-order:
#  *
#  *         f_3
#  *  c_2           c_3
#  *      +---3---+
#  *      |       |
#  * f_0  0       1  f_1
#  *      |       |
#  *      +---2---+
#  *  c_0           c_1
#  *         f_2
#  *
#  * if degree == -2, then one node is assigned per face and per corner and no
#  * nodes are assigned per volume.  In this case, vnodes == 8, and the
#  * nodes are listed in face-order, followed by corner-order:
#  *
#  *         f_3
#  *  c_2           c_3
#  *      6---3---7
#  *      |       |
#  * f_0  0       1  f_1
#  *      |       |
#  *      4---2---5
#  *  c_0           c_1
#  *         f_2
#  *
#  */

p4est_lnodes=p4est_lnodes_new(unitsquare_forest, p4est_ghost, -2)
lnodes=p4est_lnodes[]
println(propertynames(lnodes))
println("num_local_nodes=$(lnodes.num_local_nodes)")
println("owned_count=$(lnodes.owned_count)")

lnodes.num_local_elements

p4est_corner_faces         = [0 2; 1 2; 0 3; 1 3]
p4est_corner_face_corners  = [0  -1 0 -1; -1 0 1 -1; 1 -1 -1  0; -1 1 -1 1]

# To add to P4est_wrapper.jl library
# I just translated this function to Julia from its p4est counterpart
# We cannot call it directly because it is declared as static within p4est,
# and thus it does not belong to the ABI of the dynamic library object.

# /** Decode the face_code into hanging face information.
#  *
#  * This is mostly for demonstration purposes.  Applications probably will
#  * integrate it into their own loop over the face for performance reasons.
#  *
#  * \param[in] face_code as in the p4est_lnodes_t structure.
#  * \param[out] hanging face: if there are hanging faces,
#  *             hanging_face = -1 if the face is not hanging,
#  *                          = 0 if the face is the first half,
#  *                          = 1 if the face is the second half.
#  *             note: not touched if there are no hanging faces.
#  * \return              true if any face is hanging, false otherwise.
#  */

function p4est_lnodes_decode(face_code, hanging_face)
  @assert face_code>=0
  if (face_code!=0)
    c = face_code & 0x03
    work = face_code >> 2
    hanging_face .= -1
    for i=0:1
      f = p4est_corner_faces[c+1,i+1]
      hanging_face[f+1] = (work & 0x01)!=0 ? p4est_corner_face_corners[c+1,f+1] : -1
      work >>= 1
    end
    return 1
  else
    return 0
  end
end

element_nodes = unsafe_wrap(Array, lnodes.element_nodes, lnodes.vnodes*lnodes.num_local_elements)
face_code     = unsafe_wrap(Array, lnodes.face_code, lnodes.num_local_elements)
hanging_face=Vector{Cint}(undef,4)

num_nonlocal_nodes=lnodes.num_local_nodes-lnodes.owned_count
nonlocal_nodes=unsafe_wrap(Array, lnodes.nonlocal_nodes,num_nonlocal_nodes)

println("num_nonlocal_nodes=$(num_nonlocal_nodes)")
println("nonlocal_nodes=$(nonlocal_nodes)")

for cell=1:lnodes.num_local_elements
  start=(cell-1)*lnodes.vnodes+1
  println("cell=$(cell) faces=$(element_nodes[start:start+3])")
  for lface in element_nodes[start:start+3]
    if (lface<lnodes.owned_count)
      println("lface=$(lface) gface=$(lnodes.global_offset+lface)")
    else
      println("lface=$(lface) gface=$(lnodes.global_offset+lface)")
    end
  end
  println("cell=$(cell) vertices=$(element_nodes[start+4:start+7])")
  has_hanging=p4est_lnodes_decode(face_code[cell], hanging_face)
  if (has_hanging==1)
    println("cell=$(cell) has hanging faces")
    for (lface,half) in enumerate(hanging_face)
      if (half==-1)
        println("cell=$(cell) lface=$(lface) is NOT hanging")
      else
        println("cell=$(cell) lface=$(lface) is hanging from half=$(half)")
      end
    end
  else
    println("cell=$(cell) does not have hanging faces")
  end
end

p4est_destroy(unitsquare_forest);
p4est_connectivity_destroy(unitsquare_connectivity)
# sc_finalize()


# Finalize MPI if initialized and session is not interactive
if (MPI.Initialized() && !isinteractive())
    MPI.Finalize()
end
