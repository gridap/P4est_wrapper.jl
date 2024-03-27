# Automatically generated using Clang.jl


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
const p6est_lnodes_t = p8est_lnodes_t
const p6est_lnodes_code_t = p8est_lnodes_code_t
const p6est_lnodes_rank_t = p8est_lnodes_rank_t
const p6est_lnodes_buffer_t = p8est_lnodes_buffer_t
