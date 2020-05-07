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

# Skipping MacroDefinition: P2EST_QUADRANT_INIT ( q ) ( ( void ) memset ( ( q ) , - 1 , sizeof ( p2est_quadrant_t ) ) )
# Skipping MacroDefinition: P6EST_COLUMN_GET_RANGE ( q , f , l ) do { * ( f ) = ( size_t ) ( q ) -> p . piggy3 . local_num ; * ( l ) = * ( f ) + ( size_t ) ( q ) -> p . piggy3 . which_tree ; } while ( 0 ) ;
# Skipping MacroDefinition: P6EST_COLUMN_SET_RANGE ( q , f , l ) do { ( q ) -> p . piggy3 . local_num = ( p4est_locidx_t ) ( f ) ; ( q ) -> p . piggy3 . which_tree = ( p4est_topidx_t ) ( ( l ) - ( f ) ) ; } while ( 0 ) ;

struct p6est_connectivity
    conn4::Ptr{p4est_connectivity_t}
    top_vertices::Ptr{Cdouble}
    height::NTuple{3, Cdouble}
end

const p6est_connectivity_t = p6est_connectivity

struct p2est_quadrant
    z::p4est_qcoord_t
    level::Int8
    pad8::Int8
    pad16::Int16
    p::p6est_quadrant_data
end

const p2est_quadrant_t = p2est_quadrant

struct p6est
    mpicomm::MPI_Comm
    mpisize::Cint
    mpirank::Cint
    mpicomm_owned::Cint
    data_size::Csize_t
    user_pointer::Ptr{Cvoid}
    connectivity::Ptr{p6est_connectivity_t}
    columns::Ptr{p4est_t}
    layers::Ptr{sc_array_t}
    user_data_pool::Ptr{sc_mempool_t}
    layer_pool::Ptr{sc_mempool_t}
    global_first_layer::Ptr{p4est_gloidx_t}
    root_len::p4est_qcoord_t
end

const p6est_t = p6est
const p6est_init_t = Ptr{Cvoid}
const p6est_replace_t = Ptr{Cvoid}
const p6est_refine_column_t = Ptr{Cvoid}
const p6est_refine_layer_t = Ptr{Cvoid}
const p6est_coarsen_column_t = Ptr{Cvoid}
const p6est_coarsen_layer_t = Ptr{Cvoid}
const p6est_weight_t = Ptr{Cvoid}

@cenum p6est_comm_tag_t::UInt32 begin
    P6EST_COMM_PARTITION = 1
    P6EST_COMM_GHOST = 2
    P6EST_COMM_BALANCE = 3
end


struct p6est_ghost
    mpisize::Cint
    num_trees::p4est_topidx_t
    btype::p4est_connect_type_t
    column_ghost::Ptr{p4est_ghost_t}
    column_layer_offsets::Ptr{sc_array_t}
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

const p6est_ghost_t = p6est_ghost
const P8EST_MAXLEVEL = 19
const P8EST_QMAXLEVEL = 18

# Skipping MacroDefinition: P8EST_ROOT_LEN ( ( p4est_qcoord_t ) 1 << P8EST_MAXLEVEL )
# Skipping MacroDefinition: P8EST_QUADRANT_LEN ( l ) ( ( p4est_qcoord_t ) 1 << ( P8EST_MAXLEVEL - ( l ) ) )
# Skipping MacroDefinition: P8EST_LAST_OFFSET ( l ) ( P8EST_ROOT_LEN - P8EST_QUADRANT_LEN ( l ) )
# Skipping MacroDefinition: P8EST_QUADRANT_INIT ( q ) ( ( void ) memset ( ( q ) , - 1 , sizeof ( p8est_quadrant_t ) ) )

struct p8est_quadrant
    x::p4est_qcoord_t
    y::p4est_qcoord_t
    z::p4est_qcoord_t
    level::Int8
    pad8::Int8
    pad16::Int16
    p::p8est_quadrant_data
end

const p8est_quadrant_t = p8est_quadrant

struct p8est_tree
    quadrants::sc_array_t
    first_desc::p8est_quadrant_t
    last_desc::p8est_quadrant_t
    quadrants_offset::p4est_locidx_t
    quadrants_per_level::NTuple{20, p4est_locidx_t}
    maxlevel::Int8
end

const p8est_tree_t = p8est_tree

struct p8est_inspect
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

const p8est_inspect_t = p8est_inspect

struct p8est_connectivity
    num_vertices::p4est_topidx_t
    num_trees::p4est_topidx_t
    num_edges::p4est_topidx_t
    num_corners::p4est_topidx_t
    vertices::Ptr{Cdouble}
    tree_to_vertex::Ptr{p4est_topidx_t}
    tree_attr_bytes::Csize_t
    tree_to_attr::Cstring
    tree_to_tree::Ptr{p4est_topidx_t}
    tree_to_face::Ptr{Int8}
    tree_to_edge::Ptr{p4est_topidx_t}
    ett_offset::Ptr{p4est_topidx_t}
    edge_to_tree::Ptr{p4est_topidx_t}
    edge_to_edge::Ptr{Int8}
    tree_to_corner::Ptr{p4est_topidx_t}
    ctt_offset::Ptr{p4est_topidx_t}
    corner_to_tree::Ptr{p4est_topidx_t}
    corner_to_corner::Ptr{Int8}
end

const p8est_connectivity_t = p8est_connectivity

struct p8est
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
    global_first_position::Ptr{p8est_quadrant_t}
    connectivity::Ptr{p8est_connectivity_t}
    trees::Ptr{sc_array_t}
    user_data_pool::Ptr{sc_mempool_t}
    quadrant_pool::Ptr{sc_mempool_t}
    inspect::Ptr{p8est_inspect_t}
end

const p8est_t = p8est
const p8est_init_t = Ptr{Cvoid}
const p8est_refine_t = Ptr{Cvoid}
const p8est_coarsen_t = Ptr{Cvoid}
const p8est_weight_t = Ptr{Cvoid}
const P8EST_DIM = 3
const P8EST_FACES = 2P8EST_DIM
const P8EST_CHILDREN = 8
const P8EST_HALF = P8EST_CHILDREN / 2
const P8EST_EDGES = 12
const P8EST_INSUL = 27
const P8EST_FTRANSFORM = 9
const P8EST_STRING = "p8est"

@cenum p8est_connect_type_t::UInt32 begin
    P8EST_CONNECT_FACE = 31
    P8EST_CONNECT_EDGE = 32
    P8EST_CONNECT_CORNER = 33
    P8EST_CONNECT_FULL = 33
end

@cenum p8est_connectivity_encode_t::UInt32 begin
    P8EST_CONN_ENCODE_NONE = 0
    P8EST_CONN_ENCODE_LAST = 1
end


struct p8est_edge_transform_t
    ntree::p4est_topidx_t
    nedge::Int8
    naxis::NTuple{3, Int8}
    nflip::Int8
    corners::Int8
end

struct p8est_edge_info_t
    iedge::Int8
    edge_transforms::sc_array_t
end

struct p8est_corner_transform_t
    ntree::p4est_topidx_t
    ncorner::Int8
end

struct p8est_corner_info_t
    icorner::p4est_topidx_t
    corner_transforms::sc_array_t
end

const p8est_replace_t = Ptr{Cvoid}
const p8est_geometry_X_t = Ptr{Cvoid}
const p8est_geometry_destroy_t = Ptr{Cvoid}

struct p8est_geometry
    name::Cstring
    user::Ptr{Cvoid}
    X::p8est_geometry_X_t
    destroy::p8est_geometry_destroy_t
end

const p8est_geometry_t = p8est_geometry

struct p8est_ghost_t
    mpisize::Cint
    num_trees::p4est_topidx_t
    btype::p8est_connect_type_t
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

struct p8est_ghost_exchange
    is_custom::Cint
    is_levels::Cint
    p4est::Ptr{p8est_t}
    ghost::Ptr{p8est_ghost_t}
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

const p8est_ghost_exchange_t = p8est_ghost_exchange

struct p8est_iter_volume_info
    p4est::Ptr{p8est_t}
    ghost_layer::Ptr{p8est_ghost_t}
    quad::Ptr{p8est_quadrant_t}
    quadid::p4est_locidx_t
    treeid::p4est_topidx_t
end

const p8est_iter_volume_info_t = p8est_iter_volume_info
const p8est_iter_volume_t = Ptr{Cvoid}

struct p8est_iter_face_side
    treeid::p4est_topidx_t
    face::Int8
    is_hanging::Int8
    is::p8est_iter_face_side_data
end

const p8est_iter_face_side_t = p8est_iter_face_side

struct p8est_iter_face_info
    p4est::Ptr{p8est_t}
    ghost_layer::Ptr{p8est_ghost_t}
    orientation::Int8
    tree_boundary::Int8
    sides::sc_array_t
end

const p8est_iter_face_info_t = p8est_iter_face_info
const p8est_iter_face_t = Ptr{Cvoid}

struct p8est_iter_edge_side
    treeid::p4est_topidx_t
    edge::Int8
    orientation::Int8
    is_hanging::Int8
    is::p8est_iter_edge_side_data
    faces::NTuple{2, Int8}
end

const p8est_iter_edge_side_t = p8est_iter_edge_side

struct p8est_iter_edge_info
    p4est::Ptr{p8est_t}
    ghost_layer::Ptr{p8est_ghost_t}
    tree_boundary::Int8
    sides::sc_array_t
end

const p8est_iter_edge_info_t = p8est_iter_edge_info
const p8est_iter_edge_t = Ptr{Cvoid}

struct p8est_iter_corner_side
    treeid::p4est_topidx_t
    corner::Int8
    is_ghost::Int8
    quad::Ptr{p8est_quadrant_t}
    quadid::p4est_locidx_t
    faces::NTuple{3, Int8}
    edges::NTuple{3, Int8}
end

const p8est_iter_corner_side_t = p8est_iter_corner_side

struct p8est_iter_corner_info
    p4est::Ptr{p8est_t}
    ghost_layer::Ptr{p8est_ghost_t}
    tree_boundary::Int8
    sides::sc_array_t
end

const p8est_iter_corner_info_t = p8est_iter_corner_info
const p8est_iter_corner_t = Ptr{Cvoid}

struct p8est_mesh_t
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

struct p8est_mesh_face_neighbor_t
    p4est::Ptr{p8est_t}
    ghost::Ptr{p8est_ghost_t}
    mesh::Ptr{p8est_mesh_t}
    which_tree::p4est_topidx_t
    quadrant_id::p4est_locidx_t
    quadrant_code::p4est_locidx_t
    face::Cint
    subface::Cint
    current_qtq::p4est_locidx_t
end

const p8est_search_local_t = Ptr{Cvoid}
const p8est_search_query_t = p8est_search_local_t
const p8est_search_partition_t = Ptr{Cvoid}
const p8est_search_all_t = Ptr{Cvoid}
const p8est_vtk_context = Cvoid
const p8est_vtk_context_t = p8est_vtk_context
