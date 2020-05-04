################################################################
# Base fixed datatypes
################################################################
const FILE = Cvoid # File descriptor
const ssize_t = Cssize_t
const MPI_Comm = MPI.Comm

################################################################
# Data used for non supported struct/union
################################################################
struct ud
    user_data::Ref{Ptr{Cvoid}}
end

################################################################
# fix sc_array struct. 
# Wrong element_size and elem_cont datatypes (Cint -> Cssize_t)
################################################################
struct sc_array
    elem_size::ssize_t
    elem_count::ssize_t
    byte_alloc::ssize_t
    array::Cstring
end

################################################################
# Non supported data/struct/unions
################################################################
const sc_io_sink_t = ud
const sc_io_source_t = ud

const p4est_qcoord_t = Cint         # int32_t
const p4est_locidx_t = Cint         # int32_t
const p4est_topidx_t = Cint         # int32_t
const p4est_gloidx_t = Clonglong    # int64_t
const p4est_lnodes_t = ud
const p4est_quadrant_data = ud
const p4est_iter_face_side_data = ud

const p6est_quadrant_data = ud

const p8est_lnodes_t = ud
const p8est_quadrant_data = ud
const p8est_iter_edge_side_data = ud
const p8est_iter_face_side_data = ud

