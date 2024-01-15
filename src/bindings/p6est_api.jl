# Julia wrapper for header: p6est.h
# Automatically generated using Clang.jl


function p6est_connectivity_new(conn4, top_vertices, height)
    ccall((:p6est_connectivity_new, p4est_lib), Ptr{p6est_connectivity_t}, (Ptr{p4est_connectivity_t}, Ptr{Cdouble}, Ptr{Cdouble}), conn4, top_vertices, height)
end

function p6est_connectivity_destroy(conn)
    ccall((:p6est_connectivity_destroy, p4est_lib), Cvoid, (Ptr{p6est_connectivity_t},), conn)
end

function p6est_tree_get_vertices(conn, which_tree, vertices)
    ccall((:p6est_tree_get_vertices, p4est_lib), Cvoid, (Ptr{p6est_connectivity_t}, p4est_topidx_t, Ptr{Cdouble}), conn, which_tree, vertices)
end

function p6est_qcoord_to_vertex(connectivity, treeid, x, y, z, vxyz)
    ccall((:p6est_qcoord_to_vertex, p4est_lib), Cvoid, (Ptr{p6est_connectivity_t}, p4est_topidx_t, p4est_qcoord_t, p4est_qcoord_t, p4est_qcoord_t, Ptr{Cdouble}), connectivity, treeid, x, y, z, vxyz)
end

function p6est_new(mpicomm, connectivity, data_size, init_fn, user_pointer)
    ccall((:p6est_new, p4est_lib), Ptr{p6est_t}, (MPI_Comm, Ptr{p6est_connectivity_t}, Csize_t, p6est_init_t, Ptr{Cvoid}), mpicomm, connectivity, data_size, init_fn, user_pointer)
end

function p6est_new_from_p4est(p4est, top_vertices, height, min_zlevel, data_size, init_fn, user_pointer)
    ccall((:p6est_new_from_p4est, p4est_lib), Ptr{p6est_t}, (Ptr{p4est_t}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Csize_t, p6est_init_t, Ptr{Cvoid}), p4est, top_vertices, height, min_zlevel, data_size, init_fn, user_pointer)
end

function p6est_destroy(p6est)
    ccall((:p6est_destroy, p4est_lib), Cvoid, (Ptr{p6est_t},), p6est)
end

function p6est_copy(input, copy_data)
    ccall((:p6est_copy, p4est_lib), Ptr{p6est_t}, (Ptr{p6est_t}, Cint), input, copy_data)
end

function p6est_reset_data(p6est, data_size, init_fn, user_pointer)
    ccall((:p6est_reset_data, p4est_lib), Cvoid, (Ptr{p6est_t}, Csize_t, p6est_init_t, Ptr{Cvoid}), p6est, data_size, init_fn, user_pointer)
end

function p6est_refine_columns(p6est, refine_recursive, refine_fn, init_fn)
    ccall((:p6est_refine_columns, p4est_lib), Cvoid, (Ptr{p6est_t}, Cint, p6est_refine_column_t, p6est_init_t), p6est, refine_recursive, refine_fn, init_fn)
end

function p6est_refine_layers(p6est, refine_recursive, refine_fn, init_fn)
    ccall((:p6est_refine_layers, p4est_lib), Cvoid, (Ptr{p6est_t}, Cint, p6est_refine_layer_t, p6est_init_t), p6est, refine_recursive, refine_fn, init_fn)
end

function p6est_coarsen_columns(p6est, coarsen_recursive, coarsen_fn, init_fn)
    ccall((:p6est_coarsen_columns, p4est_lib), Cvoid, (Ptr{p6est_t}, Cint, p6est_coarsen_column_t, p6est_init_t), p6est, coarsen_recursive, coarsen_fn, init_fn)
end

function p6est_coarsen_layers(p6est, coarsen_recursive, coarsen_fn, init_fn)
    ccall((:p6est_coarsen_layers, p4est_lib), Cvoid, (Ptr{p6est_t}, Cint, p6est_coarsen_layer_t, p6est_init_t), p6est, coarsen_recursive, coarsen_fn, init_fn)
end

function p6est_balance(p6est, btype, init_fn)
    ccall((:p6est_balance, p4est_lib), Cvoid, (Ptr{p6est_t}, p8est_connect_type_t, p6est_init_t), p6est, btype, init_fn)
end

function p6est_partition(p6est, weight_fn)
    ccall((:p6est_partition, p4est_lib), p4est_gloidx_t, (Ptr{p6est_t}, p6est_weight_t), p6est, weight_fn)
end

function p6est_partition_correct(p6est, num_layers_in_proc)
    ccall((:p6est_partition_correct, p4est_lib), Cvoid, (Ptr{p6est_t}, Ptr{p4est_locidx_t}), p6est, num_layers_in_proc)
end

function p6est_partition_to_p4est_partition(p6est, num_layers_in_proc, num_columns_in_proc)
    ccall((:p6est_partition_to_p4est_partition, p4est_lib), Cvoid, (Ptr{p6est_t}, Ptr{p4est_locidx_t}, Ptr{p4est_locidx_t}), p6est, num_layers_in_proc, num_columns_in_proc)
end

function p4est_partition_to_p6est_partition(p6est, num_columns_in_proc, num_layers_in_proc)
    ccall((:p4est_partition_to_p6est_partition, p4est_lib), Cvoid, (Ptr{p6est_t}, Ptr{p4est_locidx_t}, Ptr{p4est_locidx_t}), p6est, num_columns_in_proc, num_layers_in_proc)
end

function p6est_partition_for_coarsening(p6est, num_layers_in_proc)
    ccall((:p6est_partition_for_coarsening, p4est_lib), p4est_gloidx_t, (Ptr{p6est_t}, Ptr{p4est_locidx_t}), p6est, num_layers_in_proc)
end

function p6est_partition_given(p6est, num_layers_in_proc)
    ccall((:p6est_partition_given, p4est_lib), p4est_gloidx_t, (Ptr{p6est_t}, Ptr{p4est_locidx_t}), p6est, num_layers_in_proc)
end

function p6est_checksum(p6est)
    ccall((:p6est_checksum, p4est_lib), UInt32, (Ptr{p6est_t},), p6est)
end

function p6est_save(filename, p6est, save_data)
    ccall((:p6est_save, p4est_lib), Cvoid, (Cstring, Ptr{p6est_t}, Cint), filename, p6est, save_data)
end

function p6est_load(filename, mpicomm, data_size, load_data, user_pointer, connectivity)
    ccall((:p6est_load, p4est_lib), Ptr{p6est_t}, (Cstring, MPI_Comm, Csize_t, Cint, Ptr{Cvoid}, Ptr{Ptr{p6est_connectivity_t}}), filename, mpicomm, data_size, load_data, user_pointer, connectivity)
end

function p6est_compress_columns(p6est)
    ccall((:p6est_compress_columns, p4est_lib), Cvoid, (Ptr{p6est_t},), p6est)
end

function p6est_update_offsets(p6est)
    ccall((:p6est_update_offsets, p4est_lib), Cvoid, (Ptr{p6est_t},), p6est)
end
# Julia wrapper for header: p6est_extended.h
# Automatically generated using Clang.jl


function p6est_new_ext(mpicomm, connectivity, min_quadrants, min_level, min_zlevel, num_zroot, fill_uniform, data_size, init_fn, user_pointer)
    ccall((:p6est_new_ext, p4est_lib), Ptr{p6est_t}, (MPI_Comm, Ptr{p6est_connectivity_t}, p4est_locidx_t, Cint, Cint, Cint, Cint, Csize_t, p6est_init_t, Ptr{Cvoid}), mpicomm, connectivity, min_quadrants, min_level, min_zlevel, num_zroot, fill_uniform, data_size, init_fn, user_pointer)
end

function p6est_copy_ext(input, copy_data, duplicate_mpicomm)
    ccall((:p6est_copy_ext, p4est_lib), Ptr{p6est_t}, (Ptr{p6est_t}, Cint, Cint), input, copy_data, duplicate_mpicomm)
end

function p6est_save_ext(filename, p6est, save_data, save_partition)
    ccall((:p6est_save_ext, p4est_lib), Cvoid, (Cstring, Ptr{p6est_t}, Cint, Cint), filename, p6est, save_data, save_partition)
end

function p6est_load_ext(filename, mpicomm, data_size, load_data, autopartition, broadcasthead, user_pointer, connectivity)
    ccall((:p6est_load_ext, p4est_lib), Ptr{p6est_t}, (Cstring, MPI_Comm, Csize_t, Cint, Cint, Cint, Ptr{Cvoid}, Ptr{Ptr{p6est_connectivity_t}}), filename, mpicomm, data_size, load_data, autopartition, broadcasthead, user_pointer, connectivity)
end

function p6est_refine_columns_ext(p6est, refine_recursive, maxlevel, refine_fn, init_fn, replace_fn)
    ccall((:p6est_refine_columns_ext, p4est_lib), Cvoid, (Ptr{p6est_t}, Cint, Cint, p6est_refine_column_t, p6est_init_t, p6est_replace_t), p6est, refine_recursive, maxlevel, refine_fn, init_fn, replace_fn)
end

function p6est_refine_layers_ext(p6est, refine_recursive, maxlevel, refine_fn, init_fn, replace_fn)
    ccall((:p6est_refine_layers_ext, p4est_lib), Cvoid, (Ptr{p6est_t}, Cint, Cint, p6est_refine_layer_t, p6est_init_t, p6est_replace_t), p6est, refine_recursive, maxlevel, refine_fn, init_fn, replace_fn)
end

function p6est_coarsen_columns_ext(p6est, coarsen_recursive, callback_orphans, coarsen_fn, init_fn, replace_fn)
    ccall((:p6est_coarsen_columns_ext, p4est_lib), Cvoid, (Ptr{p6est_t}, Cint, Cint, p6est_coarsen_column_t, p6est_init_t, p6est_replace_t), p6est, coarsen_recursive, callback_orphans, coarsen_fn, init_fn, replace_fn)
end

function p6est_coarsen_layers_ext(p6est, coarsen_recursive, callback_orphans, coarsen_fn, init_fn, replace_fn)
    ccall((:p6est_coarsen_layers_ext, p4est_lib), Cvoid, (Ptr{p6est_t}, Cint, Cint, p6est_coarsen_layer_t, p6est_init_t, p6est_replace_t), p6est, coarsen_recursive, callback_orphans, coarsen_fn, init_fn, replace_fn)
end

function p6est_partition_ext(p6est, partition_for_coarsening, weight_fn)
    ccall((:p6est_partition_ext, p4est_lib), p4est_gloidx_t, (Ptr{p6est_t}, Cint, p6est_weight_t), p6est, partition_for_coarsening, weight_fn)
end

function p6est_balance_ext(p6est, btype, max_diff, min_diff, init_fn, replace_fn)
    ccall((:p6est_balance_ext, p4est_lib), Cvoid, (Ptr{p6est_t}, p8est_connect_type_t, Cint, Cint, p6est_init_t, p6est_replace_t), p6est, btype, max_diff, min_diff, init_fn, replace_fn)
end
# Julia wrapper for header: p6est_ghost.h
# Automatically generated using Clang.jl


function p6est_ghost_memory_used()
    ccall((:p6est_ghost_memory_used, p4est_lib), Cint, ())
end

function p6est_ghost_new(p4est, btype)
    ccall((:p6est_ghost_new, p4est_lib), Ptr{p6est_ghost_t}, (Ptr{p6est_t}, p4est_connect_type_t), p4est, btype)
end

function p6est_ghost_expand(p6est, ghost)
    ccall((:p6est_ghost_expand, p4est_lib), Cvoid, (Ptr{p6est_t}, Ptr{p6est_ghost_t}), p6est, ghost)
end

function p6est_ghost_destroy(ghost)
    ccall((:p6est_ghost_destroy, p4est_lib), Cvoid, (Ptr{p6est_ghost_t},), ghost)
end

function p6est_ghost_bsearch(ghost, which_proc, which_tree, column, layer)
    ccall((:p6est_ghost_bsearch, p4est_lib), ssize_t, (Ptr{p6est_ghost_t}, Cint, p4est_topidx_t, Ptr{p4est_quadrant_t}, Ptr{p2est_quadrant_t}), ghost, which_proc, which_tree, column, layer)
end

function p6est_ghost_contains(ghost, which_proc, which_tree, column, layer)
    ccall((:p6est_ghost_contains, p4est_lib), ssize_t, (Ptr{p6est_ghost_t}, Cint, p4est_topidx_t, Ptr{p4est_quadrant_t}, Ptr{p2est_quadrant_t}), ghost, which_proc, which_tree, column, layer)
end

function p6est_layer_exists(p6est, ghost, treeid, column, layer, exists_arr, rproc_arr, rquad_arr)
    ccall((:p6est_layer_exists, p4est_lib), Cint, (Ptr{p6est_t}, Ptr{p6est_ghost_t}, p4est_topidx_t, Ptr{p4est_quadrant_t}, Ptr{p2est_quadrant_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{sc_array_t}), p6est, ghost, treeid, column, layer, exists_arr, rproc_arr, rquad_arr)
end

function p6est_is_balanced(p6est, btype)
    ccall((:p6est_is_balanced, p4est_lib), Cint, (Ptr{p6est_t}, p8est_connect_type_t), p6est, btype)
end

function p6est_ghost_checksum(p6est, ghost)
    ccall((:p6est_ghost_checksum, p4est_lib), UInt32, (Ptr{p6est_t}, Ptr{p6est_ghost_t}), p6est, ghost)
end
# Julia wrapper for header: p6est_lnodes.h
# Automatically generated using Clang.jl


function p6est_lnodes_new(p6est, ghost_layer, degree)
    ccall((:p6est_lnodes_new, p4est_lib), Ptr{p6est_lnodes_t}, (Ptr{p6est_t}, Ptr{p6est_ghost_t}, Cint), p6est, ghost_layer, degree)
end

function p6est_lnodes_get_column_labels(p6est, lnodes)
    ccall((:p6est_lnodes_get_column_labels, p4est_lib), Ptr{p4est_gloidx_t}, (Ptr{p6est_t}, Ptr{p8est_lnodes_t}), p6est, lnodes)
end
# Julia wrapper for header: p6est_vtk.h
# Automatically generated using Clang.jl


function p6est_vtk_write_file(p6est, filename)
    ccall((:p6est_vtk_write_file, p4est_lib), Cvoid, (Ptr{p6est_t}, Cstring), p6est, filename)
end

function p6est_vtk_write_header(p6est, scale, write_tree, write_rank, wrap_rank, point_scalars, point_vectors, filename)
    ccall((:p6est_vtk_write_header, p4est_lib), Cint, (Ptr{p6est_t}, Cdouble, Cint, Cint, Cint, Cstring, Cstring, Cstring), p6est, scale, write_tree, write_rank, wrap_rank, point_scalars, point_vectors, filename)
end

function p6est_vtk_write_point_scalar(p6est, filename, scalar_name, values)
    ccall((:p6est_vtk_write_point_scalar, p4est_lib), Cint, (Ptr{p6est_t}, Cstring, Cstring, Ptr{Cdouble}), p6est, filename, scalar_name, values)
end

function p6est_vtk_write_point_vector(p6est, filename, vector_name, values)
    ccall((:p6est_vtk_write_point_vector, p4est_lib), Cint, (Ptr{p6est_t}, Cstring, Cstring, Ptr{Cdouble}), p6est, filename, vector_name, values)
end

function p6est_vtk_write_footer(p6est, filename)
    ccall((:p6est_vtk_write_footer, p4est_lib), Cint, (Ptr{p6est_t}, Cstring), p6est, filename)
end
