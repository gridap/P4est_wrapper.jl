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
function init_fn_callback_2d(forest_ptr::Ptr{p8est_t},
                            which_tree::p4est_topidx_t,
                            quadrant_ptr::Ptr{p8est_quadrant_t})
    @assert which_tree == 0
    # Extract a reference to the first (and uniquely allowed) tree
    forest = forest_ptr[]
    tree = p8est_tree_array_index(forest.trees, 0)[]
    quadrant = quadrant_ptr[]
    q = p8est_quadrant_array_index(tree.quadrants, current_quadrant_index)
    @assert p8est_quadrant_compare(q,quadrant_ptr) == 0
    user_data  = unsafe_wrap(Array, Ptr{Cint}(forest.user_pointer), current_quadrant_index+1)[current_quadrant_index+1]
    unsafe_store!(Ptr{Cint}(quadrant.p.user_data), user_data, 1)
    global current_quadrant_index = (current_quadrant_index+1) % (tree.quadrants.elem_count)
    return nothing
end

const init_fn_callback_2d_c = @cfunction(init_fn_callback_2d, Cvoid, (Ptr{p8est_t}, p4est_topidx_t, Ptr{p8est_quadrant_t}))

function refine_callback_2d(::Ptr{p8est_t},
                            which_tree::p4est_topidx_t,
                            quadrant_ptr::Ptr{p8est_quadrant_t})
    @assert which_tree == 0
    quadrant = quadrant_ptr[]
    return Cint(unsafe_wrap(Array, Ptr{Cint}(quadrant.p.user_data),1)[] == refine_flag)
end

const refine_callback_2d_c = @cfunction(refine_callback_2d, Cint, (Ptr{p8est_t}, p4est_topidx_t, Ptr{p8est_quadrant_t}))

## Refine those cells with even identifier    (0,2,4,6,8,...)
## Leave untouched cells with odd identifier  (1,3,5,7,9,...)
function allocate_and_set_refinement_and_coarsening_flags(forest_ptr::Ptr{p8est_t})
    forest = forest_ptr[]
    tree = p8est_tree_array_index(forest.trees, 0)[]
    @assert tree.quadrants.elem_count == 1 || tree.quadrants.elem_count == 8
    if (tree.quadrants.elem_count == 1)
      return [refine_flag]
    else
      return [nothing_flag,
       refine_flag,
       nothing_flag,
       nothing_flag,
       nothing_flag,
       nothing_flag,
       nothing_flag,
       nothing_flag]
    end
    # return [i != 1 ? nothing_flag : refine_flag for i = 1:tree.quadrants.elem_count]
end

function perform_single_mesh_adaptation_step(forest_ptr::Ptr{p8est_t})
    user_data = allocate_and_set_refinement_and_coarsening_flags(forest_ptr)
    p8est_reset_data(forest_ptr, Cint(sizeof(Cint)), init_fn_callback_2d_c, pointer(user_data))
    p8est_refine_ext(forest_ptr, 0, -1, refine_callback_2d_c, C_NULL, C_NULL)
    p8est_partition(forest_ptr, 1, C_NULL)
end

# /** Store a parallel numbering of Lobatto points of a given degree > 0.
#  *
#  * Each element has degree+1 nodes per edge
#  * and vnodes = (degree+1)^3 nodes per volume.
#  * element_nodes is of dimension vnodes * num_local_elements and lists the
#  * nodes of each element in lexicographic yx-order (x varies fastest);
#  * element_nodes indexes into the set of local nodes, layed out as follows:
#  * local nodes = [<-----owned_count----->|<-----nonlocal_nodes----->]
#  *             = [<----------------num_local_nodes----------------->]
#  * nonlocal_nodes contains the globally unique numbers for independent nodes
#  * that are owned by other processes; for local nodes, the globally unique
#  * numbers are given by i + global_offset, where i is the local number.
#  * Hanging nodes are always local and don't have a global number.
#  * They index the geometrically corresponding independent nodes of a neighbor.
#  *
#  * Whether nodes are hanging or not is decided based on the element faces and
#  * edges. This information is encoded in face_code with one int16_t per
#  * element. If no faces or edges are hanging, the value is zero, otherwise the
#  * face_code is interpreted by p8est_lnodes_decode.
#  *
#  * Independent nodes can be shared by multiple MPI ranks.
#  * The owner rank of a node is the one from the lowest numbered element
#  * on the lowest numbered octree *touching* the node.
#  *
#  * What is meant by *touching*?
#  * A quadrant is said to touch all faces/edges/corners that are incident on it,
#  * and by extension all nodes that are contained in those faces/edges/corners.
#  *
#  *            X      +-----------+
#  *             x     |\           \
#  *            x      | \           \
#  *             . x   |  \           \
#  *            x   X  |   +-----------+
#  * +-----+     . .   |   |           |
#  * |\     \   X   o  +   |           |
#  * | +-----+   o .    \  |     p     |
#  * + |  q  |      o    \ |           |
#  *  \|     |     o      \|           |
#  *   +-----+      O      +-----------+
#  *
#  * In this example degree = 3.  There are 4 nodes that live on the face
#  * between q and p, two on each edge and one at each corner of that face.
#  * The face is incident on q, so q owns the nodes marked '.' on the face
#  * (provided q is from a lower tree or has a lower index than p).
#  * The bottom and front edges are incident on q, so q owns its nodes marked
#  * 'o' as well.
#  * The front lower corner is incident on q, so q owns its node 'O' as
#  * well.  The other edges and corners are not incident on q, so q cannot own
#  * their nodes, marked 'x' and 'X'.
#  *
#  * global_owned_count contains the number of independent nodes owned by each
#  * process.
#  *
#  * The sharers array contains items of type p8est_lnodes_rank_t
#  * that hold the ranks that own or share independent local nodes.
#  * If there are no shared nodes on this processor, it is empty.
#  * Otherwise, it is sorted by rank and the current process is included.
#  *
#  * degree < 0 indicates that the lnodes data structure is being used to number
#  * the quadrant boundary object (faces, edge  and corners) rather than the
#  * $C^0$ Lobatto nodes:
#  *
#  * if degree == -1, then one node is assigned per face, and no nodes are
#  * assigned per volume, per edge,  or per corner: this numbering can be used
#  * for low-order Raviart-Thomas elements.  In this case, vnodes == 6, and the
#  * nodes are listed in face-order.
#  *
#  * if degree == -2, then one node is assigned per face and per edge and no
#  * nodes are assigned per volume or per corner.  In this case, vnodes == 18,
#  * and the nodes are listed in face-order, followed by edge-order.
#  *
#  * if degree == -3, then one node is assigned per face, per edge and per
#  * corner and no nodes are assigned per volume.  In this case, vnodes == 26,
#  * and the nodes are listed in face-order, followed by edge-order, followed by
#  * corner-order.
#  *
#  */
# typedef struct p8est_lnodes
# {
#   sc_MPI_Comm         mpicomm;
#   p4est_locidx_t      num_local_nodes;
#   p4est_locidx_t      owned_count;
#   p4est_gloidx_t      global_offset;
#   p4est_gloidx_t     *nonlocal_nodes;
#   sc_array_t         *sharers;
#   p4est_locidx_t     *global_owned_count;

#   int                 degree, vnodes;
#   p4est_locidx_t      num_local_elements;
#   p8est_lnodes_code_t *face_code;
#   p4est_locidx_t     *element_nodes;
# }
# p8est_lnodes_t;

# /** The structure stored in the sharers array.
#  *
#  * shared_nodes is a sorted array of p4est_locidx_t
#  * that indexes into local nodes.  The shared_nodes array has a
#  * contiguous (or empty) section of nodes owned by the current rank.
#  * shared_mine_offset and shared_mine_count identify this section
#  * by indexing the shared_nodes array, not the local nodes array.
#  * owned_offset and owned_count define the section of local nodes
#  * that is owned by the listed rank (the section may be empty).
#  * For the current process these coincide with those in p8est_lnodes_t.
#  */
# typedef struct p8est_lnodes_rank
# {
#   int                 rank;
#   sc_array_t          shared_nodes;
#   p4est_locidx_t      shared_mine_offset, shared_mine_count;
#   p4est_locidx_t      owned_offset, owned_count;
# }
# p8est_lnodes_rank_t;

# /** Decode the face_code into hanging face information.
#  *
#  * This is mostly for demonstration purposes.  Applications probably will
#  * integrate it into their own loop over the face for performance reasons.
#  *
#  * \param[in] face_code as in the p8est_lnodes_t structure.
#  * \param[out] hanging_face: if there are hanging faces or edges,
#  *             hanging_face = -1 if the face is not hanging,
#  *                          = the corner of the full face that it touches:
#  *                            e.g. if face = i and hanging_face[i] =
#  *                            j, then the interpolation operator corresponding
#  *                            to corner j should be used for that face.
#  *             note: not touched if there are no hanging faces or edges.
#  * \param[out] hanging_edge: if there are hanging faces or edges,
#  *             hanging_edge = -1 if the edge is not hanging,
#  *                          =  0 if the edge is the first half of a full edge,
#  *                               but neither of the two faces touching the
#  *                               edge is hanging,
#  *                          =  1 if the edge is the second half of a full edge,
#  *                               but neither of the two faces touching the
#  *                               edge is hanging,
#  *                          =  2 if the edge is the first half of a full edge
#  *                               and is on the boundary of a full face,
#  *                          =  3 if the edge is the second half of a full edge
#  *                               and is on the boundary of a full face,
#  *                          =  4 if the edge is in the middle of a full face.
#  *                               See the diagram below for clarification.
#  *             note: not touched if there are no hanging faces or edges.
#  * \return             true if any face or edge is hanging, false otherwise.
#  *
#  * o...............o  o...............o  +---2---+.......o  o.......+---3---+
#  * :               :  :               :  |       |       :  :       |       |
#  * :               :  :               :  3   2   4       :  :       4   3   3
#  * :               :  :               :  |       |       :  :       |       |
#  * +---4---+       :  :       +---4---+  +---4---+       :  :       +---4---+
#  * |       |       :  :       |       |  :               :  :               :
#  * 2   0   4       :  :       4   1   2  :               :  :               :
#  * |       |       :  :       |       |  :               :  :               :
#  * +---2---+.......o  o.......+---3---+  o...............o  o...............o
#  *
#  *                    o                  +-------+
#  *                    :                  |\       \
#  *                    :                  1 \       \
#  *                    :                  |  +-------+
#  *                    +-------+          +  |       |
#  *                    |\       \         :\ |       |
#  *                    0 \       \        : \|       |
#  *                    |  +-------+       :  +-------+
#  *                    +  |       |       o
#  *                     \ |       |
#  *                      \|       |
#  *                       +-------+
#  */

p8est_corner_faces = [
   0 2 4;
   1 2 4;
   0 3 4;
   1 3 4;
   0 2 5;
   1 2 5;
   0 3 5;
   1 3 5; ]

p8est_corner_face_corners = [
    0 -1  0 -1  0 -1 ;
    -1  0  1 -1  1 -1 ;
    1 -1 -1  0  2 -1 ;
    -1  1 -1  1  3 -1 ;
     2 -1  2 -1 -1  0 ;
    -1  2  3 -1 -1  1 ;
     3 -1 -1  2 -1  2 ;
    -1  3 -1  3 -1  3 ; ]

p8est_face_edges =
    [ 4 6  8 10 ;
      5 7  9 11 ;
      0 2  8  9 ;
      1 3 10 11 ;
      0 1  4  5 ;
      2 3  6  7 ]

p8est_corner_edges  =
      [ 0 4  8;
        0 5  9;
        1 4 10;
        1 5 11;
        2 6  8;
        2 7  9;
        3 6 10;
        3 7 11 ]

# To add to p8est_wrapper.jl library
# I just translated this function to Julia from its p4est counterpart
# We cannot call it directly because it is declared as static within p4est,
# and thus it does not belong to the ABI of the dynamic library object.
function p8est_lnodes_decode(face_code,
                              hanging_face,
                              hanging_edge)
  @assert face_code >= 0
  if (face_code!=0)
    c = face_code & 0x0007
    work = face_code >> 3
    hanging_face .= -1
    hanging_edge .= -1
    cwork = c
    for i=0:2
      if ((work & 0x0001)!=0)
        f = p8est_corner_faces[c+1,i+1]
        hanging_face[f+1] = p8est_corner_face_corners[c+1,f+1]
        for j=0:3
          e = p8est_face_edges[f+1,j+1]
          hanging_edge[e+1] = 4
        end
      end
      work >>= 1
    end
    for i=0:3
      if ((work & 0x0001)!=0)
        e = p8est_corner_edges[c+1,i+1]
        hanging_edge[e+1] = (hanging_edge[e] == -1) ? 0 : 2
        hanging_edge[e+1] += (cwork & 0x0001)
      end
      cwork >>= 1
      work  >>= 1
    end
    return 1
  else
    return 0
  end
end

#############################################################################
# Main program
#############################################################################

mpicomm = MPI.COMM_WORLD
sc_init(mpicomm, Cint(true), Cint(true), C_NULL, P4est_wrapper.SC_LP_DEFAULT)
p4est_init(C_NULL, P4est_wrapper.SC_LP_DEFAULT)

unitsquare_connectivity = p8est_connectivity_new_unitcube()
unitsquare_forest = p8est_new(mpicomm, unitsquare_connectivity, 0, C_NULL, C_NULL)

perform_single_mesh_adaptation_step(unitsquare_forest)
perform_single_mesh_adaptation_step(unitsquare_forest)
p8est_vtk_write_file(unitsquare_forest, C_NULL, string("adapted_forest"))

p8est_ghost=p8est_ghost_new(unitsquare_forest, P4est_wrapper.P8EST_CONNECT_FULL)

p8est_lnodes=p8est_lnodes_new(unitsquare_forest, p8est_ghost, -3)
lnodes=p8est_lnodes[]
num_nonlocal_nodes=lnodes.num_local_nodes-lnodes.owned_count
nonlocal_nodes=unsafe_wrap(Array, lnodes.nonlocal_nodes,num_nonlocal_nodes)
global_owned_count=unsafe_wrap(Array, lnodes.global_owned_count, MPI.Comm_size(MPI.COMM_WORLD))
println(propertynames(lnodes))
println("num_local_nodes=$(lnodes.num_local_nodes)")
println("owned_count=$(lnodes.owned_count)")
println("num_nonlocal_nodes=$(num_nonlocal_nodes)")
println("nonlocal_nodes=$(nonlocal_nodes)")
println("global_owned_count=$(global_owned_count)")
println("global_offset=$(lnodes.global_offset)")

lnodes.num_local_elements
element_nodes = unsafe_wrap(Array, lnodes.element_nodes, lnodes.vnodes*lnodes.num_local_elements)
face_code     = unsafe_wrap(Array, lnodes.face_code, lnodes.num_local_elements)
hanging_face  = Vector{Cint}(undef,6)
hanging_edge  = Vector{Cint}(undef,12)

for cell=1:lnodes.num_local_elements
  start=(cell-1)*lnodes.vnodes+1
  println("cell=$(cell) faces=$(element_nodes[start:start+5])")
  for lface in element_nodes[start:start+5]
    if (lface<lnodes.owned_count)
      println("lface=$(lface) gface=$(lnodes.global_offset+lface)")
    else
      println("lface=$(lface) gface=$(lnodes.global_offset+lface)")
    end
  end
  println("cell=$(cell) edges=$(element_nodes[start+6:start+17])")
  println("cell=$(cell) corners=$(element_nodes[start+18:start+25])")
  has_hanging=p8est_lnodes_decode(face_code[cell],
                                  hanging_face,
                                  hanging_edge)
  if (has_hanging==1)
    println("cell=$(cell) has hanging faces")
    println("hanging_face=$(hanging_face)")
    println("hanging_edge=$(hanging_edge)")
  else
    println("cell=$(cell) does not have hanging faces")
  end
end

p8est_destroy(unitsquare_forest);
p8est_connectivity_destroy(unitsquare_connectivity)
# sc_finalize()


# Finalize MPI if initialized and session is not interactive
if (MPI.Initialized() && !isinteractive())
    MPI.Finalize()
end
