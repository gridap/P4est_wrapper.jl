################################################################
# Array index functions
# Not part of P4est, but really usefull to access sc_array from julia
################################################################

function sc_array_index(sc_array_object::sc_array_t, iz)
    @assert iz < sc_array_object.elem_count
    return sc_array_object.array + sc_array_object.elem_size * iz
end

function p4est_tree_array_index(sc_array_object::sc_array_t, it)
    @assert sc_array_object.elem_size == sizeof(p4est_tree_t)
    @assert it in 0:sc_array_object.elem_count
    return Ptr{p4est_tree_t}(sc_array_object.array + sc_array_object.elem_size*it)
end

function p4est_quadrant_array_index(sc_array_object::sc_array_t, it)
    @assert sc_array_object.elem_size == sizeof(p4est_quadrant_t)
    @assert it < sc_array_object.elem_count
    return Ptr{p4est_quadrant_t}(sc_array_object.array + sc_array_object.elem_size*it)
end

function p8est_tree_array_index(sc_array_object::sc_array_t, it)
  @assert sc_array_object.elem_size == sizeof(p8est_tree_t)
  @assert it in 0:sc_array_object.elem_count
  return Ptr{p8est_tree_t}(sc_array_object.array + sc_array_object.elem_size*it)
end

function p8est_quadrant_array_index(sc_array_object::sc_array_t, it)
  @assert sc_array_object.elem_size == sizeof(p8est_quadrant_t)
  @assert it < sc_array_object.elem_count
  return Ptr{p8est_quadrant_t}(sc_array_object.array + sc_array_object.elem_size*it)
end

################################################################
# Array index functions
# Static functions are not part of the API/ABI
################################################################

function sc_array_index(array::Ptr{sc_array_t}, iz)
    sc_array_object = unsafe_wrap(Array, array, 1)[1]
    return sc_array_index(sc_array_object, iz)
end

function p4est_tree_array_index(array::Ptr{sc_array_t}, it)
    sc_array_object = unsafe_wrap(Array, array, 1)[1]
    return p4est_tree_array_index(sc_array_object, it)
end

function p4est_quadrant_array_index(array::Ptr{sc_array_t}, it)
    sc_array_object = unsafe_wrap(Array, array, 1)[1]
    return p4est_quadrant_array_index(sc_array_object, it)
end

function p8est_tree_array_index(array::Ptr{sc_array_t}, it)
  sc_array_object = unsafe_wrap(Array, array, 1)[1]
  return p8est_tree_array_index(sc_array_object, it)
end

function p8est_quadrant_array_index(array::Ptr{sc_array_t}, it)
  sc_array_object = unsafe_wrap(Array, array, 1)[1]
  return p8est_quadrant_array_index(sc_array_object, it)
end


################################################################
# p4est_init function
# This function is part of p4est_base.h header.
# This header is strongly related with p4est_config.h
# and sc_config.h, so not added in automatic generation
# We wrap this binding manually.
################################################################
function p4est_init(log_handler, log_threshold)
    ccall((:p4est_init, p4est_lib), Cvoid, (sc_log_handler_t, Cint), log_handler, log_threshold)
end

################################################################
# Dereference functions
# Not part of P4est, but really usefull to access data from pointers
################################################################

PXEST_NAMED_STRUCTS = Union{p4est_quadrant, p4est_tree, p4est_inspect, p4est_connectivity, p4est, p4est_geometry,
                            p4est_ghost_t, p4est_ghost_exchange, p4est_iter_volume_info, p4est_iter_face_side,
                            p4est_iter_face_info, p4est_iter_corner_side, p4est_iter_corner_info, p4est_lnodes,
                            p4est_lnodes_rank, p4est_lnodes_buffer, p4est_search_local_t, p4est_vtk_context,
                            p6est_connectivity, p2est_quadrant, p6est_ghost, p8est_quadrant, p8est_tree, sc_array,
                            p8est_inspect, p8est_connectivity, p8est, p8est_geometry, p8est_ghost_t,
                            p8est_ghost_exchange, p8est_iter_volume_info, p8est_iter_face_side, p8est_iter_face_info,
                            p8est_iter_edge_side, p8est_iter_edge_info, p8est_iter_corner_side, p8est_iter_corner_info,
                            p8est_lnodes, p8est_lnodes_rank, p8est_lnodes_buffer, p8est_search_local_t, p8est_vtk_context}

function Base.getindex(ptr::Ptr{T}) where {T<:PXEST_NAMED_STRUCTS}
    unsafe_wrap(Array, ptr, 1)[]
end

function Base.getindex(ptr::Ptr{T}, i) where {T<:PXEST_NAMED_STRUCTS}
    unsafe_wrap(Array, ptr, i)[i]
end
