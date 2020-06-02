# Automatically generated using Clang.jl


const P4EST_MAXLEVEL = 30
const P4EST_QMAXLEVEL = 29

# Skipping MacroDefinition: P4EST_ROOT_LEN ( ( p4est_qcoord_t ) 1 << P4EST_MAXLEVEL )
# Skipping MacroDefinition: P4EST_QUADRANT_LEN ( l ) ( ( p4est_qcoord_t ) 1 << ( P4EST_MAXLEVEL - ( l ) ) )
# Skipping MacroDefinition: P4EST_LAST_OFFSET ( l ) ( P4EST_ROOT_LEN - P4EST_QUADRANT_LEN ( l ) )
# Skipping MacroDefinition: P4EST_QUADRANT_INIT ( q ) ( ( void ) memset ( ( q ) , - 1 , sizeof ( p4est_quadrant_t ) ) )

struct p4est_quadrant
    x::p4est_qcoord_t
    y::p4est_qcoord_t
    level::Int8
    pad8::Int8
    pad16::Int16
    p::p4est_quadrant_data
end

const p4est_quadrant_t = p4est_quadrant

struct p4est_tree
    quadrants::sc_array_t
    first_desc::p4est_quadrant_t
    last_desc::p4est_quadrant_t
    quadrants_offset::p4est_locidx_t
    quadrants_per_level::NTuple{31, p4est_locidx_t}
    maxlevel::Int8
end

const p4est_tree_t = p4est_tree

struct p4est_inspect
    use_balance_ranges::Cint
    use_balance_ranges_notify::Cint
    use_balance_verify::Cint
    balance_max_ranges::Cint
    balance_A_count_in::Csize_t
    balance_A_count_out::Csize_t
    balance_comm_sent::Csize_t
    balance_comm_nzpeers::Csize_t
    balance_B_count_in::Csize_t
    balance_B_count_out::Csize_t
    balance_zero_sends::Cint
    balance_zero_receives::Cint
    balance_A::Cdouble
    balance_comm::Cdouble
    balance_B::Cdouble
    balance_ranges::Cdouble
    balance_notify::Cdouble
    balance_notify_allgather::Cdouble
    use_B::Cint
end

const p4est_inspect_t = p4est_inspect

struct p4est_connectivity
    num_vertices::p4est_topidx_t
    num_trees::p4est_topidx_t
    num_corners::p4est_topidx_t
    vertices::Ptr{Cdouble}
    tree_to_vertex::Ptr{p4est_topidx_t}
    tree_attr_bytes::Csize_t
    tree_to_attr::Cstring
    tree_to_tree::Ptr{p4est_topidx_t}
    tree_to_face::Ptr{Int8}
    tree_to_corner::Ptr{p4est_topidx_t}
    ctt_offset::Ptr{p4est_topidx_t}
    corner_to_tree::Ptr{p4est_topidx_t}
    corner_to_corner::Ptr{Int8}
end

const p4est_connectivity_t = p4est_connectivity

struct p4est
    mpicomm::MPI_Comm
    mpisize::Cint
    mpirank::Cint
    mpicomm_owned::Cint
    data_size::Csize_t
    user_pointer::Ptr{Cvoid}
    revision::Clong
    first_local_tree::p4est_topidx_t
    last_local_tree::p4est_topidx_t
    local_num_quadrants::p4est_locidx_t
    global_num_quadrants::p4est_gloidx_t
    global_first_quadrant::Ptr{p4est_gloidx_t}
    global_first_position::Ptr{p4est_quadrant_t}
    connectivity::Ptr{p4est_connectivity_t}
    trees::Ptr{sc_array_t}
    user_data_pool::Ptr{sc_mempool_t}
    quadrant_pool::Ptr{sc_mempool_t}
    inspect::Ptr{p4est_inspect_t}
end

const p4est_t = p4est
const p4est_init_t = Ptr{Cvoid}
const p4est_refine_t = Ptr{Cvoid}
const p4est_coarsen_t = Ptr{Cvoid}
const p4est_weight_t = Ptr{Cvoid}
const P4EST_DIM = 2
const P4EST_FACES = 2P4EST_DIM
const P4EST_CHILDREN = 4
const P4EST_HALF = P4EST_CHILDREN / 2
const P4EST_INSUL = 9
const P4EST_FTRANSFORM = 9
const P4EST_STRING = "p4est"
const P4EST_ONDISK_FORMAT = 0x02000009

@cenum p4est_connect_type_t::UInt32 begin
    P4EST_CONNECT_FACE = 21
    P4EST_CONNECT_CORNER = 22
    P4EST_CONNECT_FULL = 22
end

@cenum p4est_connectivity_encode_t::UInt32 begin
    P4EST_CONN_ENCODE_NONE = 0
    P4EST_CONN_ENCODE_LAST = 1
end


struct p4est_corner_transform_t
    ntree::p4est_topidx_t
    ncorner::Int8
end

struct p4est_corner_info_t
    icorner::p4est_topidx_t
    corner_transforms::sc_array_t
end

const p4est_replace_t = Ptr{Cvoid}
const p4est_geometry_X_t = Ptr{Cvoid}
const p4est_geometry_destroy_t = Ptr{Cvoid}

struct p4est_geometry
    name::Cstring
    user::Ptr{Cvoid}
    X::p4est_geometry_X_t
    destroy::p4est_geometry_destroy_t
end

const p4est_geometry_t = p4est_geometry

struct p4est_ghost_t
    mpisize::Cint
    num_trees::p4est_topidx_t
    btype::p4est_connect_type_t
    ghosts::sc_array_t
    tree_offsets::Ptr{p4est_locidx_t}
    proc_offsets::Ptr{p4est_locidx_t}
    mirrors::sc_array_t
    mirror_tree_offsets::Ptr{p4est_locidx_t}
    mirror_proc_mirrors::Ptr{p4est_locidx_t}
    mirror_proc_offsets::Ptr{p4est_locidx_t}
    mirror_proc_fronts::Ptr{p4est_locidx_t}
    mirror_proc_front_offsets::Ptr{p4est_locidx_t}
end

struct p4est_ghost_exchange
    is_custom::Cint
    is_levels::Cint
    p4est::Ptr{p4est_t}
    ghost::Ptr{p4est_ghost_t}
    minlevel::Cint
    maxlevel::Cint
    data_size::Csize_t
    ghost_data::Ptr{Cvoid}
    qactive::Ptr{Cint}
    qbuffer::Ptr{Cint}
    requests::sc_array_t
    sbuffers::sc_array_t
    rrequests::sc_array_t
    rbuffers::sc_array_t
end

const p4est_ghost_exchange_t = p4est_ghost_exchange

struct p4est_iter_volume_info
    p4est::Ptr{p4est_t}
    ghost_layer::Ptr{p4est_ghost_t}
    quad::Ptr{p4est_quadrant_t}
    quadid::p4est_locidx_t
    treeid::p4est_topidx_t
end

const p4est_iter_volume_info_t = p4est_iter_volume_info
const p4est_iter_volume_t = Ptr{Cvoid}

struct p4est_iter_face_side
    treeid::p4est_topidx_t
    face::Int8
    is_hanging::Int8
    is::p4est_iter_face_side_data
end

const p4est_iter_face_side_t = p4est_iter_face_side

struct p4est_iter_face_info
    p4est::Ptr{p4est_t}
    ghost_layer::Ptr{p4est_ghost_t}
    orientation::Int8
    tree_boundary::Int8
    sides::sc_array_t
end

const p4est_iter_face_info_t = p4est_iter_face_info
const p4est_iter_face_t = Ptr{Cvoid}

struct p4est_iter_corner_side
    treeid::p4est_topidx_t
    corner::Int8
    is_ghost::Int8
    quad::Ptr{p4est_quadrant_t}
    quadid::p4est_locidx_t
    faces::NTuple{2, Int8}
end

const p4est_iter_corner_side_t = p4est_iter_corner_side

struct p4est_iter_corner_info
    p4est::Ptr{p4est_t}
    ghost_layer::Ptr{p4est_ghost_t}
    tree_boundary::Int8
    sides::sc_array_t
end

const p4est_iter_corner_info_t = p4est_iter_corner_info
const p4est_iter_corner_t = Ptr{Cvoid}
const p4est_lnodes_code_t = Int8

struct p4est_lnodes
    mpicomm::MPI_Comm
    num_local_nodes::p4est_locidx_t
    owned_count::p4est_locidx_t
    global_offset::p4est_gloidx_t
    nonlocal_nodes::Ptr{p4est_gloidx_t}
    sharers::Ptr{sc_array_t}
    global_owned_count::Ptr{p4est_locidx_t}
    degree::Cint
    vnodes::Cint
    num_local_elements::p4est_locidx_t
    face_code::Ptr{p4est_lnodes_code_t}
    element_nodes::Ptr{p4est_locidx_t}
end

const p4est_lnodes_t = p4est_lnodes

struct p4est_lnodes_rank
    rank::Cint
    shared_nodes::sc_array_t
    shared_mine_offset::p4est_locidx_t
    shared_mine_count::p4est_locidx_t
    owned_offset::p4est_locidx_t
    owned_count::p4est_locidx_t
end

const p4est_lnodes_rank_t = p4est_lnodes_rank

struct p4est_lnodes_buffer
    requests::Ptr{sc_array_t}
    send_buffers::Ptr{sc_array_t}
    recv_buffers::Ptr{sc_array_t}
end

const p4est_lnodes_buffer_t = p4est_lnodes_buffer

struct p4est_mesh_t
    local_num_quadrants::p4est_locidx_t
    ghost_num_quadrants::p4est_locidx_t
    quad_to_tree::Ptr{p4est_topidx_t}
    ghost_to_proc::Ptr{Cint}
    quad_to_quad::Ptr{p4est_locidx_t}
    quad_to_face::Ptr{Int8}
    quad_to_half::Ptr{sc_array_t}
    quad_level::Ptr{sc_array_t}
    local_num_corners::p4est_locidx_t
    quad_to_corner::Ptr{p4est_locidx_t}
    corner_offset::Ptr{sc_array_t}
    corner_quad::Ptr{sc_array_t}
    corner_corner::Ptr{sc_array_t}
end

struct p4est_mesh_face_neighbor_t
    p4est::Ptr{p4est_t}
    ghost::Ptr{p4est_ghost_t}
    mesh::Ptr{p4est_mesh_t}
    which_tree::p4est_topidx_t
    quadrant_id::p4est_locidx_t
    quadrant_code::p4est_locidx_t
    face::Cint
    subface::Cint
    current_qtq::p4est_locidx_t
end

const p4est_search_local_t = Ptr{Cvoid}
const p4est_search_query_t = p4est_search_local_t
const p4est_search_partition_t = Ptr{Cvoid}
const p4est_search_all_t = Ptr{Cvoid}
const p4est_vtk_context = Cvoid
const p4est_vtk_context_t = p4est_vtk_context
