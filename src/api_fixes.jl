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

