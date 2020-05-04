# Julia wrapper for header: sc.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

function sc_malloc(package, size)
    ccall((:sc_malloc, p4est_lib), Ptr{Cvoid}, (Cint, Cint), package, size)
end

function sc_calloc(package, nmemb, size)
    ccall((:sc_calloc, p4est_lib), Ptr{Cvoid}, (Cint, Cint, Cint), package, nmemb, size)
end

function sc_realloc(package, ptr, size)
    ccall((:sc_realloc, p4est_lib), Ptr{Cvoid}, (Cint, Ptr{Cvoid}, Cint), package, ptr, size)
end

function sc_strdup(package, s)
    ccall((:sc_strdup, p4est_lib), Cstring, (Cint, Cstring), package, s)
end

function sc_free(package, ptr)
    ccall((:sc_free, p4est_lib), Cvoid, (Cint, Ptr{Cvoid}), package, ptr)
end

function sc_memory_status(package)
    ccall((:sc_memory_status, p4est_lib), Cint, (Cint,), package)
end

function sc_memory_check(package)
    ccall((:sc_memory_check, p4est_lib), Cvoid, (Cint,), package)
end

function sc_int_compare(v1, v2)
    ccall((:sc_int_compare, p4est_lib), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), v1, v2)
end

function sc_int8_compare(v1, v2)
    ccall((:sc_int8_compare, p4est_lib), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), v1, v2)
end

function sc_int16_compare(v1, v2)
    ccall((:sc_int16_compare, p4est_lib), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), v1, v2)
end

function sc_int32_compare(v1, v2)
    ccall((:sc_int32_compare, p4est_lib), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), v1, v2)
end

function sc_int64_compare(v1, v2)
    ccall((:sc_int64_compare, p4est_lib), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), v1, v2)
end

function sc_double_compare(v1, v2)
    ccall((:sc_double_compare, p4est_lib), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), v1, v2)
end

function sc_set_log_defaults(log_stream, log_handler, log_thresold)
    ccall((:sc_set_log_defaults, p4est_lib), Cvoid, (Ptr{FILE}, sc_log_handler_t, Cint), log_stream, log_handler, log_thresold)
end

function sc_set_abort_handler(abort_handler)
    ccall((:sc_set_abort_handler, p4est_lib), Cvoid, (sc_abort_handler_t,), abort_handler)
end

function sc_log(filename, lineno, package, category, priority, msg)
    ccall((:sc_log, p4est_lib), Cvoid, (Cstring, Cint, Cint, Cint, Cint, Cstring), filename, lineno, package, category, priority, msg)
end

function sc_log_indent_push_count(package, count)
    ccall((:sc_log_indent_push_count, p4est_lib), Cvoid, (Cint, Cint), package, count)
end

function sc_log_indent_pop_count(package, count)
    ccall((:sc_log_indent_pop_count, p4est_lib), Cvoid, (Cint, Cint), package, count)
end

function sc_log_indent_push()
    ccall((:sc_log_indent_push, p4est_lib), Cvoid, ())
end

function sc_log_indent_pop()
    ccall((:sc_log_indent_pop, p4est_lib), Cvoid, ())
end

function sc_abort()
    ccall((:sc_abort, p4est_lib), Cvoid, ())
end

function sc_abort_verbose(filename, lineno, msg)
    ccall((:sc_abort_verbose, p4est_lib), Cvoid, (Cstring, Cint, Cstring), filename, lineno, msg)
end

function sc_abort_collective(msg)
    ccall((:sc_abort_collective, p4est_lib), Cvoid, (Cstring,), msg)
end

function sc_package_register(log_handler, log_threshold, name, full)
    ccall((:sc_package_register, p4est_lib), Cint, (sc_log_handler_t, Cint, Cstring, Cstring), log_handler, log_threshold, name, full)
end

function sc_package_is_registered(package_id)
    ccall((:sc_package_is_registered, p4est_lib), Cint, (Cint,), package_id)
end

function sc_package_lock(package_id)
    ccall((:sc_package_lock, p4est_lib), Cvoid, (Cint,), package_id)
end

function sc_package_unlock(package_id)
    ccall((:sc_package_unlock, p4est_lib), Cvoid, (Cint,), package_id)
end

function sc_package_set_verbosity(package_id, log_priority)
    ccall((:sc_package_set_verbosity, p4est_lib), Cvoid, (Cint, Cint), package_id, log_priority)
end

function sc_package_set_abort_alloc_mismatch(package_id, set_abort)
    ccall((:sc_package_set_abort_alloc_mismatch, p4est_lib), Cvoid, (Cint, Cint), package_id, set_abort)
end

function sc_package_unregister(package_id)
    ccall((:sc_package_unregister, p4est_lib), Cvoid, (Cint,), package_id)
end

function sc_package_print_summary(log_priority)
    ccall((:sc_package_print_summary, p4est_lib), Cvoid, (Cint,), log_priority)
end

function sc_init(mpicomm, catch_signals, print_backtrace, log_handler, log_threshold)
    ccall((:sc_init, p4est_lib), Cvoid, (MPI_Comm, Cint, Cint, sc_log_handler_t, Cint), mpicomm, catch_signals, print_backtrace, log_handler, log_threshold)
end

function sc_finalize()
    ccall((:sc_finalize, p4est_lib), Cvoid, ())
end

function sc_is_root()
    ccall((:sc_is_root, p4est_lib), Cint, ())
end

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: sc_containers.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

function sc_array_memory_used()
    ccall((:sc_array_memory_used, p4est_lib), Cint, ())
end

function sc_array_new(elem_size)
    ccall((:sc_array_new, p4est_lib), Ptr{sc_array_t}, (Cint,), elem_size)
end

function sc_array_new_count(elem_size, elem_count)
    ccall((:sc_array_new_count, p4est_lib), Ptr{sc_array_t}, (Cint, Cint), elem_size, elem_count)
end

function sc_array_new_view(array, offset, length)
    ccall((:sc_array_new_view, p4est_lib), Ptr{sc_array_t}, (Ptr{sc_array_t}, Cint, Cint), array, offset, length)
end

function sc_array_new_data(base, elem_size, elem_count)
    ccall((:sc_array_new_data, p4est_lib), Ptr{sc_array_t}, (Ptr{Cvoid}, Cint, Cint), base, elem_size, elem_count)
end

function sc_array_destroy(array)
    ccall((:sc_array_destroy, p4est_lib), Cvoid, (Ptr{sc_array_t},), array)
end

function sc_array_destroy_null(parray)
    ccall((:sc_array_destroy_null, p4est_lib), Cvoid, (Ptr{Ptr{sc_array_t}},), parray)
end

function sc_array_init(array, elem_size)
    ccall((:sc_array_init, p4est_lib), Cvoid, (Ptr{sc_array_t}, Cint), array, elem_size)
end

function sc_array_init_size(array, elem_size, elem_count)
    ccall((:sc_array_init_size, p4est_lib), Cvoid, (Ptr{sc_array_t}, Cint, Cint), array, elem_size, elem_count)
end

function sc_array_init_count(array, elem_size, elem_count)
    ccall((:sc_array_init_count, p4est_lib), Cvoid, (Ptr{sc_array_t}, Cint, Cint), array, elem_size, elem_count)
end

function sc_array_init_view(view, array, offset, length)
    ccall((:sc_array_init_view, p4est_lib), Cvoid, (Ptr{sc_array_t}, Ptr{sc_array_t}, Cint, Cint), view, array, offset, length)
end

function sc_array_init_data(view, base, elem_size, elem_count)
    ccall((:sc_array_init_data, p4est_lib), Cvoid, (Ptr{sc_array_t}, Ptr{Cvoid}, Cint, Cint), view, base, elem_size, elem_count)
end

function sc_array_memset(array, c)
    ccall((:sc_array_memset, p4est_lib), Cvoid, (Ptr{sc_array_t}, Cint), array, c)
end

function sc_array_reset(array)
    ccall((:sc_array_reset, p4est_lib), Cvoid, (Ptr{sc_array_t},), array)
end

function sc_array_truncate(array)
    ccall((:sc_array_truncate, p4est_lib), Cvoid, (Ptr{sc_array_t},), array)
end

function sc_array_rewind(array, new_count)
    ccall((:sc_array_rewind, p4est_lib), Cvoid, (Ptr{sc_array_t}, Cint), array, new_count)
end

function sc_array_resize(array, new_count)
    ccall((:sc_array_resize, p4est_lib), Cvoid, (Ptr{sc_array_t}, Cint), array, new_count)
end

function sc_array_copy(dest, src)
    ccall((:sc_array_copy, p4est_lib), Cvoid, (Ptr{sc_array_t}, Ptr{sc_array_t}), dest, src)
end

function sc_array_copy_into(dest, dest_offset, src)
    ccall((:sc_array_copy_into, p4est_lib), Cvoid, (Ptr{sc_array_t}, Cint, Ptr{sc_array_t}), dest, dest_offset, src)
end

function sc_array_move_part(dest, dest_offset, src, src_offset, count)
    ccall((:sc_array_move_part, p4est_lib), Cvoid, (Ptr{sc_array_t}, Cint, Ptr{sc_array_t}, Cint, Cint), dest, dest_offset, src, src_offset, count)
end

function sc_array_sort(array, compar)
    ccall((:sc_array_sort, p4est_lib), Cvoid, (Ptr{sc_array_t}, Ptr{Cvoid}), array, compar)
end

function sc_array_is_sorted(array, compar)
    ccall((:sc_array_is_sorted, p4est_lib), Cint, (Ptr{sc_array_t}, Ptr{Cvoid}), array, compar)
end

function sc_array_is_equal(array, other)
    ccall((:sc_array_is_equal, p4est_lib), Cint, (Ptr{sc_array_t}, Ptr{sc_array_t}), array, other)
end

function sc_array_uniq(array, compar)
    ccall((:sc_array_uniq, p4est_lib), Cvoid, (Ptr{sc_array_t}, Ptr{Cvoid}), array, compar)
end

function sc_array_bsearch(array, key, compar)
    ccall((:sc_array_bsearch, p4est_lib), ssize_t, (Ptr{sc_array_t}, Ptr{Cvoid}, Ptr{Cvoid}), array, key, compar)
end

function sc_array_split(array, offsets, num_types, type_fn, data)
    ccall((:sc_array_split, p4est_lib), Cvoid, (Ptr{sc_array_t}, Ptr{sc_array_t}, Csize_t, Cint, Ptr{Cvoid}), array, offsets, num_types, type_fn, data)
end

function sc_array_is_permutation(array)
    ccall((:sc_array_is_permutation, p4est_lib), Cint, (Ptr{sc_array_t},), array)
end

function sc_array_permute(array, newindices, keepperm)
    ccall((:sc_array_permute, p4est_lib), Cvoid, (Ptr{sc_array_t}, Ptr{sc_array_t}, Cint), array, newindices, keepperm)
end

function sc_array_checksum(array)
    ccall((:sc_array_checksum, p4est_lib), UInt32, (Ptr{sc_array_t},), array)
end

function sc_array_pqueue_add()
    ccall((:sc_array_pqueue_add, p4est_lib), Cint, ())
end

function sc_array_pqueue_pop()
    ccall((:sc_array_pqueue_pop, p4est_lib), Cint, ())
end

function sc_mstamp_init(mst, stamp_unit, elem_size)
    ccall((:sc_mstamp_init, p4est_lib), Cvoid, (Ptr{sc_mstamp_t}, Csize_t, Csize_t), mst, stamp_unit, elem_size)
end

function sc_mstamp_reset(mst)
    ccall((:sc_mstamp_reset, p4est_lib), Cvoid, (Ptr{sc_mstamp_t},), mst)
end

function sc_mstamp_truncate(mst)
    ccall((:sc_mstamp_truncate, p4est_lib), Cvoid, (Ptr{sc_mstamp_t},), mst)
end

function sc_mstamp_alloc(mst)
    ccall((:sc_mstamp_alloc, p4est_lib), Ptr{Cvoid}, (Ptr{sc_mstamp_t},), mst)
end

function sc_mstamp_memory_used()
    ccall((:sc_mstamp_memory_used, p4est_lib), Cint, ())
end

function sc_mempool_memory_used()
    ccall((:sc_mempool_memory_used, p4est_lib), Cint, ())
end

function sc_mempool_new(elem_size)
    ccall((:sc_mempool_new, p4est_lib), Ptr{sc_mempool_t}, (Csize_t,), elem_size)
end

function sc_mempool_new_zero_and_persist(elem_size)
    ccall((:sc_mempool_new_zero_and_persist, p4est_lib), Ptr{sc_mempool_t}, (Csize_t,), elem_size)
end

function sc_mempool_init(mempool, elem_size)
    ccall((:sc_mempool_init, p4est_lib), Cvoid, (Ptr{sc_mempool_t}, Csize_t), mempool, elem_size)
end

function sc_mempool_destroy(mempool)
    ccall((:sc_mempool_destroy, p4est_lib), Cvoid, (Ptr{sc_mempool_t},), mempool)
end

function sc_mempool_destroy_null(pmempool)
    ccall((:sc_mempool_destroy_null, p4est_lib), Cvoid, (Ptr{Ptr{sc_mempool_t}},), pmempool)
end

function sc_mempool_reset(mempool)
    ccall((:sc_mempool_reset, p4est_lib), Cvoid, (Ptr{sc_mempool_t},), mempool)
end

function sc_mempool_truncate(mempool)
    ccall((:sc_mempool_truncate, p4est_lib), Cvoid, (Ptr{sc_mempool_t},), mempool)
end

function sc_list_memory_used()
    ccall((:sc_list_memory_used, p4est_lib), Cint, ())
end

function sc_list_new(allocator)
    ccall((:sc_list_new, p4est_lib), Ptr{sc_list_t}, (Ptr{sc_mempool_t},), allocator)
end

function sc_list_destroy(list)
    ccall((:sc_list_destroy, p4est_lib), Cvoid, (Ptr{sc_list_t},), list)
end

function sc_list_init(list, allocator)
    ccall((:sc_list_init, p4est_lib), Cvoid, (Ptr{sc_list_t}, Ptr{sc_mempool_t}), list, allocator)
end

function sc_list_reset(list)
    ccall((:sc_list_reset, p4est_lib), Cvoid, (Ptr{sc_list_t},), list)
end

function sc_list_unlink(list)
    ccall((:sc_list_unlink, p4est_lib), Cvoid, (Ptr{sc_list_t},), list)
end

function sc_list_prepend(list, data)
    ccall((:sc_list_prepend, p4est_lib), Ptr{sc_link_t}, (Ptr{sc_list_t}, Ptr{Cvoid}), list, data)
end

function sc_list_append(list, data)
    ccall((:sc_list_append, p4est_lib), Ptr{sc_link_t}, (Ptr{sc_list_t}, Ptr{Cvoid}), list, data)
end

function sc_list_insert(list, pred, data)
    ccall((:sc_list_insert, p4est_lib), Ptr{sc_link_t}, (Ptr{sc_list_t}, Ptr{sc_link_t}, Ptr{Cvoid}), list, pred, data)
end

function sc_list_remove(list, pred)
    ccall((:sc_list_remove, p4est_lib), Ptr{Cvoid}, (Ptr{sc_list_t}, Ptr{sc_link_t}), list, pred)
end

function sc_list_pop(list)
    ccall((:sc_list_pop, p4est_lib), Ptr{Cvoid}, (Ptr{sc_list_t},), list)
end

function sc_hash_function_string(s, u)
    ccall((:sc_hash_function_string, p4est_lib), UInt32, (Ptr{Cvoid}, Ptr{Cvoid}), s, u)
end

function sc_hash_memory_used()
    ccall((:sc_hash_memory_used, p4est_lib), Cint, ())
end

function sc_hash_new(hash_fn, equal_fn, user_data, allocator)
    ccall((:sc_hash_new, p4est_lib), Ptr{sc_hash_t}, (sc_hash_function_t, sc_equal_function_t, Ptr{Cvoid}, Ptr{sc_mempool_t}), hash_fn, equal_fn, user_data, allocator)
end

function sc_hash_destroy(hash)
    ccall((:sc_hash_destroy, p4est_lib), Cvoid, (Ptr{sc_hash_t},), hash)
end

function sc_hash_destroy_null(phash)
    ccall((:sc_hash_destroy_null, p4est_lib), Cvoid, (Ptr{Ptr{sc_hash_t}},), phash)
end

function sc_hash_truncate(hash)
    ccall((:sc_hash_truncate, p4est_lib), Cvoid, (Ptr{sc_hash_t},), hash)
end

function sc_hash_unlink(hash)
    ccall((:sc_hash_unlink, p4est_lib), Cvoid, (Ptr{sc_hash_t},), hash)
end

function sc_hash_unlink_destroy(hash)
    ccall((:sc_hash_unlink_destroy, p4est_lib), Cvoid, (Ptr{sc_hash_t},), hash)
end

function sc_hash_lookup(hash, v, found)
    ccall((:sc_hash_lookup, p4est_lib), Cint, (Ptr{sc_hash_t}, Ptr{Cvoid}, Ptr{Ptr{Ptr{Cvoid}}}), hash, v, found)
end

function sc_hash_insert_unique(hash, v, found)
    ccall((:sc_hash_insert_unique, p4est_lib), Cint, (Ptr{sc_hash_t}, Ptr{Cvoid}, Ptr{Ptr{Ptr{Cvoid}}}), hash, v, found)
end

function sc_hash_remove(hash, v, found)
    ccall((:sc_hash_remove, p4est_lib), Cint, (Ptr{sc_hash_t}, Ptr{Cvoid}, Ptr{Ptr{Cvoid}}), hash, v, found)
end

function sc_hash_foreach(hash, fn)
    ccall((:sc_hash_foreach, p4est_lib), Cvoid, (Ptr{sc_hash_t}, sc_hash_foreach_t), hash, fn)
end

function sc_hash_print_statistics(package_id, log_priority, hash)
    ccall((:sc_hash_print_statistics, p4est_lib), Cvoid, (Cint, Cint, Ptr{sc_hash_t}), package_id, log_priority, hash)
end

function sc_hash_array_memory_used()
    ccall((:sc_hash_array_memory_used, p4est_lib), Cint, ())
end

function sc_hash_array_new(elem_size, hash_fn, equal_fn, user_data)
    ccall((:sc_hash_array_new, p4est_lib), Ptr{sc_hash_array_t}, (Csize_t, sc_hash_function_t, sc_equal_function_t, Ptr{Cvoid}), elem_size, hash_fn, equal_fn, user_data)
end

function sc_hash_array_destroy(hash_array)
    ccall((:sc_hash_array_destroy, p4est_lib), Cvoid, (Ptr{sc_hash_array_t},), hash_array)
end

function sc_hash_array_is_valid(hash_array)
    ccall((:sc_hash_array_is_valid, p4est_lib), Cint, (Ptr{sc_hash_array_t},), hash_array)
end

function sc_hash_array_truncate(hash_array)
    ccall((:sc_hash_array_truncate, p4est_lib), Cvoid, (Ptr{sc_hash_array_t},), hash_array)
end

function sc_hash_array_lookup(hash_array, v, position)
    ccall((:sc_hash_array_lookup, p4est_lib), Cint, (Ptr{sc_hash_array_t}, Ptr{Cvoid}, Ptr{Csize_t}), hash_array, v, position)
end

function sc_hash_array_insert_unique(hash_array, v, position)
    ccall((:sc_hash_array_insert_unique, p4est_lib), Ptr{Cvoid}, (Ptr{sc_hash_array_t}, Ptr{Cvoid}, Ptr{Csize_t}), hash_array, v, position)
end

function sc_hash_array_rip(hash_array, rip)
    ccall((:sc_hash_array_rip, p4est_lib), Cvoid, (Ptr{sc_hash_array_t}, Ptr{sc_array_t}), hash_array, rip)
end

function sc_recycle_array_init(rec_array, elem_size)
    ccall((:sc_recycle_array_init, p4est_lib), Cvoid, (Ptr{sc_recycle_array_t}, Csize_t), rec_array, elem_size)
end

function sc_recycle_array_reset(rec_array)
    ccall((:sc_recycle_array_reset, p4est_lib), Cvoid, (Ptr{sc_recycle_array_t},), rec_array)
end

function sc_recycle_array_insert(rec_array, position)
    ccall((:sc_recycle_array_insert, p4est_lib), Ptr{Cvoid}, (Ptr{sc_recycle_array_t}, Ptr{Csize_t}), rec_array, position)
end

function sc_recycle_array_remove(rec_array, position)
    ccall((:sc_recycle_array_remove, p4est_lib), Ptr{Cvoid}, (Ptr{sc_recycle_array_t}, Csize_t), rec_array, position)
end

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: p4est.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

function p4est_memory_used()
    ccall((:p4est_memory_used, p4est_lib), Cint, ())
end

function p4est_revision(p4est)
    ccall((:p4est_revision, p4est_lib), Clong, (Ptr{p4est_t},), p4est)
end

function p4est_qcoord_to_vertex(connectivity, treeid, x, y, vxyz)
    ccall((:p4est_qcoord_to_vertex, p4est_lib), Cvoid, (Ptr{p4est_connectivity_t}, p4est_topidx_t, p4est_qcoord_t, p4est_qcoord_t, Ptr{Cdouble}), connectivity, treeid, x, y, vxyz)
end

function p4est_new(mpicomm, connectivity, data_size, init_fn, user_pointer)
    ccall((:p4est_new, p4est_lib), Ptr{p4est_t}, (MPI_Comm, Ptr{p4est_connectivity_t}, Csize_t, p4est_init_t, Ptr{Cvoid}), mpicomm, connectivity, data_size, init_fn, user_pointer)
end

function p4est_destroy(p4est)
    ccall((:p4est_destroy, p4est_lib), Cvoid, (Ptr{p4est_t},), p4est)
end

function p4est_copy(input, copy_data)
    ccall((:p4est_copy, p4est_lib), Ptr{p4est_t}, (Ptr{p4est_t}, Cint), input, copy_data)
end

function p4est_reset_data(p4est, data_size, init_fn, user_pointer)
    ccall((:p4est_reset_data, p4est_lib), Cvoid, (Ptr{p4est_t}, Csize_t, p4est_init_t, Ptr{Cvoid}), p4est, data_size, init_fn, user_pointer)
end

function p4est_refine(p4est, refine_recursive, refine_fn, init_fn)
    ccall((:p4est_refine, p4est_lib), Cvoid, (Ptr{p4est_t}, Cint, p4est_refine_t, p4est_init_t), p4est, refine_recursive, refine_fn, init_fn)
end

function p4est_coarsen(p4est, coarsen_recursive, coarsen_fn, init_fn)
    ccall((:p4est_coarsen, p4est_lib), Cvoid, (Ptr{p4est_t}, Cint, p4est_coarsen_t, p4est_init_t), p4est, coarsen_recursive, coarsen_fn, init_fn)
end

function p4est_balance(p4est, btype, init_fn)
    ccall((:p4est_balance, p4est_lib), Cvoid, (Ptr{p4est_t}, p4est_connect_type_t, p4est_init_t), p4est, btype, init_fn)
end

function p4est_partition(p4est, allow_for_coarsening, weight_fn)
    ccall((:p4est_partition, p4est_lib), Cvoid, (Ptr{p4est_t}, Cint, p4est_weight_t), p4est, allow_for_coarsening, weight_fn)
end

function p4est_checksum(p4est)
    ccall((:p4est_checksum, p4est_lib), UInt32, (Ptr{p4est_t},), p4est)
end

function p4est_save(filename, p4est, save_data)
    ccall((:p4est_save, p4est_lib), Cvoid, (Cstring, Ptr{p4est_t}, Cint), filename, p4est, save_data)
end

function p4est_load(filename, mpicomm, data_size, load_data, user_pointer, connectivity)
    ccall((:p4est_load, p4est_lib), Ptr{p4est_t}, (Cstring, MPI_Comm, Csize_t, Cint, Ptr{Cvoid}, Ptr{Ptr{p4est_connectivity_t}}), filename, mpicomm, data_size, load_data, user_pointer, connectivity)
end

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: p4est_bits.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

function p4est_quadrant_print(log_priority, q)
    ccall((:p4est_quadrant_print, p4est_lib), Cvoid, (Cint, Ptr{p4est_quadrant_t}), log_priority, q)
end

function p4est_quadrant_is_equal(q1, q2)
    ccall((:p4est_quadrant_is_equal, p4est_lib), Cint, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}), q1, q2)
end

function p4est_quadrant_overlaps(q1, q2)
    ccall((:p4est_quadrant_overlaps, p4est_lib), Cint, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}), q1, q2)
end

function p4est_quadrant_is_equal_piggy(q1, q2)
    ccall((:p4est_quadrant_is_equal_piggy, p4est_lib), Cint, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}), q1, q2)
end

function p4est_quadrant_compare(v1, v2)
    ccall((:p4est_quadrant_compare, p4est_lib), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), v1, v2)
end

function p4est_quadrant_disjoint(v1, v2)
    ccall((:p4est_quadrant_disjoint, p4est_lib), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), v1, v2)
end

function p4est_quadrant_compare_piggy(v1, v2)
    ccall((:p4est_quadrant_compare_piggy, p4est_lib), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), v1, v2)
end

function p4est_quadrant_compare_local_num(v1, v2)
    ccall((:p4est_quadrant_compare_local_num, p4est_lib), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), v1, v2)
end

function p4est_quadrant_equal_fn(v1, v2, u)
    ccall((:p4est_quadrant_equal_fn, p4est_lib), Cint, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), v1, v2, u)
end

function p4est_quadrant_hash_fn(v, u)
    ccall((:p4est_quadrant_hash_fn, p4est_lib), UInt32, (Ptr{Cvoid}, Ptr{Cvoid}), v, u)
end

function p4est_node_equal_piggy_fn(v1, v2, u)
    ccall((:p4est_node_equal_piggy_fn, p4est_lib), Cint, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), v1, v2, u)
end

function p4est_node_hash_piggy_fn(v, u)
    ccall((:p4est_node_hash_piggy_fn, p4est_lib), UInt32, (Ptr{Cvoid}, Ptr{Cvoid}), v, u)
end

function p4est_node_clamp_inside(n, r)
    ccall((:p4est_node_clamp_inside, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}), n, r)
end

function p4est_node_unclamp(n)
    ccall((:p4est_node_unclamp, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t},), n)
end

function p4est_node_to_quadrant(n, level, q)
    ccall((:p4est_node_to_quadrant, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Cint, Ptr{p4est_quadrant_t}), n, level, q)
end

function p4est_quadrant_contains_node(q, n)
    ccall((:p4est_quadrant_contains_node, p4est_lib), Cint, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}), q, n)
end

function p4est_quadrant_ancestor_id(q, level)
    ccall((:p4est_quadrant_ancestor_id, p4est_lib), Cint, (Ptr{p4est_quadrant_t}, Cint), q, level)
end

function p4est_quadrant_child_id(q)
    ccall((:p4est_quadrant_child_id, p4est_lib), Cint, (Ptr{p4est_quadrant_t},), q)
end

function p4est_quadrant_is_inside_root(q)
    ccall((:p4est_quadrant_is_inside_root, p4est_lib), Cint, (Ptr{p4est_quadrant_t},), q)
end

function p4est_quadrant_is_inside_3x3(q)
    ccall((:p4est_quadrant_is_inside_3x3, p4est_lib), Cint, (Ptr{p4est_quadrant_t},), q)
end

function p4est_quadrant_is_outside_face(q)
    ccall((:p4est_quadrant_is_outside_face, p4est_lib), Cint, (Ptr{p4est_quadrant_t},), q)
end

function p4est_quadrant_is_outside_corner(q)
    ccall((:p4est_quadrant_is_outside_corner, p4est_lib), Cint, (Ptr{p4est_quadrant_t},), q)
end

function p4est_quadrant_is_node(q, inside)
    ccall((:p4est_quadrant_is_node, p4est_lib), Cint, (Ptr{p4est_quadrant_t}, Cint), q, inside)
end

function p4est_quadrant_is_valid(q)
    ccall((:p4est_quadrant_is_valid, p4est_lib), Cint, (Ptr{p4est_quadrant_t},), q)
end

function p4est_quadrant_is_extended(q)
    ccall((:p4est_quadrant_is_extended, p4est_lib), Cint, (Ptr{p4est_quadrant_t},), q)
end

function p4est_quadrant_is_sibling(q1, q2)
    ccall((:p4est_quadrant_is_sibling, p4est_lib), Cint, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}), q1, q2)
end

function p4est_quadrant_is_sibling_D(q1, q2)
    ccall((:p4est_quadrant_is_sibling_D, p4est_lib), Cint, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}), q1, q2)
end

function p4est_quadrant_is_family(q0, q1, q2, q3)
    ccall((:p4est_quadrant_is_family, p4est_lib), Cint, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}), q0, q1, q2, q3)
end

function p4est_quadrant_is_familyv(q)
    ccall((:p4est_quadrant_is_familyv, p4est_lib), Cint, (Ptr{p4est_quadrant_t},), q)
end

function p4est_quadrant_is_familypv(q)
    ccall((:p4est_quadrant_is_familypv, p4est_lib), Cint, (Ptr{Ptr{p4est_quadrant_t}},), q)
end

function p4est_quadrant_is_parent(q, r)
    ccall((:p4est_quadrant_is_parent, p4est_lib), Cint, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}), q, r)
end

function p4est_quadrant_is_parent_D(q, r)
    ccall((:p4est_quadrant_is_parent_D, p4est_lib), Cint, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}), q, r)
end

function p4est_quadrant_is_ancestor(q, r)
    ccall((:p4est_quadrant_is_ancestor, p4est_lib), Cint, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}), q, r)
end

function p4est_quadrant_is_ancestor_D(q, r)
    ccall((:p4est_quadrant_is_ancestor_D, p4est_lib), Cint, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}), q, r)
end

function p4est_quadrant_is_next(q, r)
    ccall((:p4est_quadrant_is_next, p4est_lib), Cint, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}), q, r)
end

function p4est_quadrant_is_next_D(q, r)
    ccall((:p4est_quadrant_is_next_D, p4est_lib), Cint, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}), q, r)
end

function p4est_quadrant_overlaps_tree(tree, q)
    ccall((:p4est_quadrant_overlaps_tree, p4est_lib), Cint, (Ptr{p4est_tree_t}, Ptr{p4est_quadrant_t}), tree, q)
end

function p4est_quadrant_is_inside_tree(tree, q)
    ccall((:p4est_quadrant_is_inside_tree, p4est_lib), Cint, (Ptr{p4est_tree_t}, Ptr{p4est_quadrant_t}), tree, q)
end

function p4est_quadrant_is_first_last(f, l, a)
    ccall((:p4est_quadrant_is_first_last, p4est_lib), Cint, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}), f, l, a)
end

function p4est_quadrant_enlarge_first(a, q)
    ccall((:p4est_quadrant_enlarge_first, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}), a, q)
end

function p4est_quadrant_enlarge_last(a, q)
    ccall((:p4est_quadrant_enlarge_last, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}), a, q)
end

function p4est_quadrant_ancestor(q, level, r)
    ccall((:p4est_quadrant_ancestor, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Cint, Ptr{p4est_quadrant_t}), q, level, r)
end

function p4est_quadrant_parent(q, r)
    ccall((:p4est_quadrant_parent, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}), q, r)
end

function p4est_quadrant_sibling(q, r, sibling_id)
    ccall((:p4est_quadrant_sibling, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}, Cint), q, r, sibling_id)
end

function p4est_quadrant_child(q, r, child_id)
    ccall((:p4est_quadrant_child, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}, Cint), q, r, child_id)
end

function p4est_quadrant_face_neighbor(q, face, r)
    ccall((:p4est_quadrant_face_neighbor, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Cint, Ptr{p4est_quadrant_t}), q, face, r)
end

function p4est_quadrant_face_neighbor_extra(q, t, face, r, nface, conn)
    ccall((:p4est_quadrant_face_neighbor_extra, p4est_lib), p4est_topidx_t, (Ptr{p4est_quadrant_t}, p4est_topidx_t, Cint, Ptr{p4est_quadrant_t}, Ptr{Cint}, Ptr{p4est_connectivity_t}), q, t, face, r, nface, conn)
end

function p4est_quadrant_half_face_neighbors(q, face, n, nur)
    ccall((:p4est_quadrant_half_face_neighbors, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Cint, Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}), q, face, n, nur)
end

function p4est_quadrant_all_face_neighbors(q, face, n)
    ccall((:p4est_quadrant_all_face_neighbors, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Cint, Ptr{p4est_quadrant_t}), q, face, n)
end

function p4est_quadrant_corner_neighbor(q, corner, r)
    ccall((:p4est_quadrant_corner_neighbor, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Cint, Ptr{p4est_quadrant_t}), q, corner, r)
end

function p4est_quadrant_corner_neighbor_extra(q, t, corner, quads, treeids, ncorners, conn)
    ccall((:p4est_quadrant_corner_neighbor_extra, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, p4est_locidx_t, Cint, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{p4est_connectivity_t}), q, t, corner, quads, treeids, ncorners, conn)
end

function p4est_quadrant_half_corner_neighbor(q, corner, r)
    ccall((:p4est_quadrant_half_corner_neighbor, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Cint, Ptr{p4est_quadrant_t}), q, corner, r)
end

function p4est_quadrant_corner_node(q, corner, r)
    ccall((:p4est_quadrant_corner_node, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Cint, Ptr{p4est_quadrant_t}), q, corner, r)
end

function p4est_quadrant_children(q, c0, c1, c2, c3)
    ccall((:p4est_quadrant_children, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}), q, c0, c1, c2, c3)
end

function p4est_quadrant_childrenv(q, c)
    ccall((:p4est_quadrant_childrenv, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}), q, c)
end

function p4est_quadrant_childrenpv(q, c)
    ccall((:p4est_quadrant_childrenpv, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Ptr{Ptr{p4est_quadrant_t}}), q, c)
end

function p4est_quadrant_first_descendant(q, fd, level)
    ccall((:p4est_quadrant_first_descendant, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}, Cint), q, fd, level)
end

function p4est_quadrant_last_descendant(q, ld, level)
    ccall((:p4est_quadrant_last_descendant, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}, Cint), q, ld, level)
end

function p4est_quadrant_corner_descendant(q, r, c, level)
    ccall((:p4est_quadrant_corner_descendant, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}, Cint, Cint), q, r, c, level)
end

function p4est_nearest_common_ancestor(q1, q2, r)
    ccall((:p4est_nearest_common_ancestor, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}), q1, q2, r)
end

function p4est_nearest_common_ancestor_D(q1, q2, r)
    ccall((:p4est_nearest_common_ancestor_D, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}), q1, q2, r)
end

function p4est_quadrant_transform_face(q, r, ftransform)
    ccall((:p4est_quadrant_transform_face, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}, Ptr{Cint}), q, r, ftransform)
end

function p4est_quadrant_touches_corner(q, corner, inside)
    ccall((:p4est_quadrant_touches_corner, p4est_lib), Cint, (Ptr{p4est_quadrant_t}, Cint, Cint), q, corner, inside)
end

function p4est_quadrant_transform_corner(q, icorner, inside)
    ccall((:p4est_quadrant_transform_corner, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Cint, Cint), q, icorner, inside)
end

function p4est_quadrant_shift_corner(q, r, corner)
    ccall((:p4est_quadrant_shift_corner, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}, Cint), q, r, corner)
end

function p4est_quadrant_linear_id(quadrant, level)
    ccall((:p4est_quadrant_linear_id, p4est_lib), UInt64, (Ptr{p4est_quadrant_t}, Cint), quadrant, level)
end

function p4est_quadrant_set_morton(quadrant, level, id)
    ccall((:p4est_quadrant_set_morton, p4est_lib), Cvoid, (Ptr{p4est_quadrant_t}, Cint, UInt64), quadrant, level, id)
end

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: p4est_connectivity.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

function p4est_connect_type_int(btype)
    ccall((:p4est_connect_type_int, p4est_lib), Cint, (p4est_connect_type_t,), btype)
end

function p4est_connect_type_string(btype)
    ccall((:p4est_connect_type_string, p4est_lib), Cstring, (p4est_connect_type_t,), btype)
end

function p4est_connectivity_memory_used()
    ccall((:p4est_connectivity_memory_used, p4est_lib), Cint, ())
end

function p4est_connectivity_face_neighbor_face_corner(fc, f, nf, o)
    ccall((:p4est_connectivity_face_neighbor_face_corner, p4est_lib), Cint, (Cint, Cint, Cint, Cint), fc, f, nf, o)
end

function p4est_connectivity_face_neighbor_corner(c, f, nf, o)
    ccall((:p4est_connectivity_face_neighbor_corner, p4est_lib), Cint, (Cint, Cint, Cint, Cint), c, f, nf, o)
end

function p4est_connectivity_new(num_vertices, num_trees, num_corners, num_ctt)
    ccall((:p4est_connectivity_new, p4est_lib), Ptr{p4est_connectivity_t}, (p4est_topidx_t, p4est_topidx_t, p4est_topidx_t, p4est_topidx_t), num_vertices, num_trees, num_corners, num_ctt)
end

function p4est_connectivity_new_copy(num_vertices, num_trees, num_corners, vertices, ttv, ttt, ttf, ttc, coff, ctt, ctc)
    ccall((:p4est_connectivity_new_copy, p4est_lib), Ptr{p4est_connectivity_t}, (p4est_topidx_t, p4est_topidx_t, p4est_topidx_t, Ptr{Cdouble}, Ptr{p4est_topidx_t}, Ptr{p4est_topidx_t}, Ptr{Int8}, Ptr{p4est_topidx_t}, Ptr{p4est_topidx_t}, Ptr{p4est_topidx_t}, Ptr{Int8}), num_vertices, num_trees, num_corners, vertices, ttv, ttt, ttf, ttc, coff, ctt, ctc)
end

function p4est_connectivity_bcast(conn_in, root, comm)
    ccall((:p4est_connectivity_bcast, p4est_lib), Ptr{p4est_connectivity_t}, (Ptr{p4est_connectivity_t}, Cint, MPI_Comm), conn_in, root, comm)
end

function p4est_connectivity_destroy(connectivity)
    ccall((:p4est_connectivity_destroy, p4est_lib), Cvoid, (Ptr{p4est_connectivity_t},), connectivity)
end

function p4est_connectivity_set_attr(conn, bytes_per_tree)
    ccall((:p4est_connectivity_set_attr, p4est_lib), Cvoid, (Ptr{p4est_connectivity_t}, Csize_t), conn, bytes_per_tree)
end

function p4est_connectivity_is_valid(connectivity)
    ccall((:p4est_connectivity_is_valid, p4est_lib), Cint, (Ptr{p4est_connectivity_t},), connectivity)
end

function p4est_connectivity_is_equal(conn1, conn2)
    ccall((:p4est_connectivity_is_equal, p4est_lib), Cint, (Ptr{p4est_connectivity_t}, Ptr{p4est_connectivity_t}), conn1, conn2)
end

function p4est_connectivity_sink(conn, sink)
    ccall((:p4est_connectivity_sink, p4est_lib), Cint, (Ptr{p4est_connectivity_t}, Ptr{sc_io_sink_t}), conn, sink)
end

function p4est_connectivity_deflate(conn, code)
    ccall((:p4est_connectivity_deflate, p4est_lib), Ptr{sc_array_t}, (Ptr{p4est_connectivity_t}, p4est_connectivity_encode_t), conn, code)
end

function p4est_connectivity_save(filename, connectivity)
    ccall((:p4est_connectivity_save, p4est_lib), Cint, (Cstring, Ptr{p4est_connectivity_t}), filename, connectivity)
end

function p4est_connectivity_source(source)
    ccall((:p4est_connectivity_source, p4est_lib), Ptr{p4est_connectivity_t}, (Ptr{sc_io_source_t},), source)
end

function p4est_connectivity_inflate(buffer)
    ccall((:p4est_connectivity_inflate, p4est_lib), Ptr{p4est_connectivity_t}, (Ptr{sc_array_t},), buffer)
end

function p4est_connectivity_load(filename, bytes)
    ccall((:p4est_connectivity_load, p4est_lib), Ptr{p4est_connectivity_t}, (Cstring, Ptr{Csize_t}), filename, bytes)
end

function p4est_connectivity_new_unitsquare()
    ccall((:p4est_connectivity_new_unitsquare, p4est_lib), Ptr{p4est_connectivity_t}, ())
end

function p4est_connectivity_new_periodic()
    ccall((:p4est_connectivity_new_periodic, p4est_lib), Ptr{p4est_connectivity_t}, ())
end

function p4est_connectivity_new_rotwrap()
    ccall((:p4est_connectivity_new_rotwrap, p4est_lib), Ptr{p4est_connectivity_t}, ())
end

function p4est_connectivity_new_twotrees(l_face, r_face, orientation)
    ccall((:p4est_connectivity_new_twotrees, p4est_lib), Ptr{p4est_connectivity_t}, (Cint, Cint, Cint), l_face, r_face, orientation)
end

function p4est_connectivity_new_corner()
    ccall((:p4est_connectivity_new_corner, p4est_lib), Ptr{p4est_connectivity_t}, ())
end

function p4est_connectivity_new_pillow()
    ccall((:p4est_connectivity_new_pillow, p4est_lib), Ptr{p4est_connectivity_t}, ())
end

function p4est_connectivity_new_moebius()
    ccall((:p4est_connectivity_new_moebius, p4est_lib), Ptr{p4est_connectivity_t}, ())
end

function p4est_connectivity_new_star()
    ccall((:p4est_connectivity_new_star, p4est_lib), Ptr{p4est_connectivity_t}, ())
end

function p4est_connectivity_new_cubed()
    ccall((:p4est_connectivity_new_cubed, p4est_lib), Ptr{p4est_connectivity_t}, ())
end

function p4est_connectivity_new_disk(periodic_a, periodic_b)
    ccall((:p4est_connectivity_new_disk, p4est_lib), Ptr{p4est_connectivity_t}, (Cint, Cint), periodic_a, periodic_b)
end

function p4est_connectivity_new_brick(mi, ni, periodic_a, periodic_b)
    ccall((:p4est_connectivity_new_brick, p4est_lib), Ptr{p4est_connectivity_t}, (Cint, Cint, Cint, Cint), mi, ni, periodic_a, periodic_b)
end

function p4est_connectivity_new_byname(name)
    ccall((:p4est_connectivity_new_byname, p4est_lib), Ptr{p4est_connectivity_t}, (Cstring,), name)
end

function p4est_connectivity_refine(conn, num_per_edge)
    ccall((:p4est_connectivity_refine, p4est_lib), Ptr{p4est_connectivity_t}, (Ptr{p4est_connectivity_t}, Cint), conn, num_per_edge)
end

function p4est_expand_face_transform(iface, nface, ftransform)
    ccall((:p4est_expand_face_transform, p4est_lib), Cvoid, (Cint, Cint, Ptr{Cint}), iface, nface, ftransform)
end

function p4est_find_face_transform(connectivity, itree, iface, ftransform)
    ccall((:p4est_find_face_transform, p4est_lib), p4est_topidx_t, (Ptr{p4est_connectivity_t}, p4est_topidx_t, Cint, Ptr{Cint}), connectivity, itree, iface, ftransform)
end

function p4est_find_corner_transform(connectivity, itree, icorner, ci)
    ccall((:p4est_find_corner_transform, p4est_lib), Cvoid, (Ptr{p4est_connectivity_t}, p4est_topidx_t, Cint, Ptr{p4est_corner_info_t}), connectivity, itree, icorner, ci)
end

function p4est_connectivity_complete(conn)
    ccall((:p4est_connectivity_complete, p4est_lib), Cvoid, (Ptr{p4est_connectivity_t},), conn)
end

function p4est_connectivity_reduce(conn)
    ccall((:p4est_connectivity_reduce, p4est_lib), Cvoid, (Ptr{p4est_connectivity_t},), conn)
end

function p4est_connectivity_permute(conn, perm, is_current_to_new)
    ccall((:p4est_connectivity_permute, p4est_lib), Cvoid, (Ptr{p4est_connectivity_t}, Ptr{sc_array_t}, Cint), conn, perm, is_current_to_new)
end

function p4est_connectivity_join_faces(conn, tree_left, tree_right, face_left, face_right, orientation)
    ccall((:p4est_connectivity_join_faces, p4est_lib), Cvoid, (Ptr{p4est_connectivity_t}, p4est_topidx_t, p4est_topidx_t, Cint, Cint, Cint), conn, tree_left, tree_right, face_left, face_right, orientation)
end

function p4est_connectivity_is_equivalent(conn1, conn2)
    ccall((:p4est_connectivity_is_equivalent, p4est_lib), Cint, (Ptr{p4est_connectivity_t}, Ptr{p4est_connectivity_t}), conn1, conn2)
end

function p4est_connectivity_read_inp_stream(stream, num_vertices, num_trees, vertices, tree_to_vertex)
    ccall((:p4est_connectivity_read_inp_stream, p4est_lib), Cint, (Ptr{FILE}, Ptr{p4est_topidx_t}, Ptr{p4est_topidx_t}, Ptr{Cdouble}, Ptr{p4est_topidx_t}), stream, num_vertices, num_trees, vertices, tree_to_vertex)
end

function p4est_connectivity_read_inp(filename)
    ccall((:p4est_connectivity_read_inp, p4est_lib), Ptr{p4est_connectivity_t}, (Cstring,), filename)
end

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: p4est_extended.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

function p4est_new_ext(mpicomm, connectivity, min_quadrants, min_level, fill_uniform, data_size, init_fn, user_pointer)
    ccall((:p4est_new_ext, p4est_lib), Ptr{p4est_t}, (MPI_Comm, Ptr{p4est_connectivity_t}, p4est_locidx_t, Cint, Cint, Csize_t, p4est_init_t, Ptr{Cvoid}), mpicomm, connectivity, min_quadrants, min_level, fill_uniform, data_size, init_fn, user_pointer)
end

function p4est_mesh_new_ext(p4est, ghost, compute_tree_index, compute_level_lists, btype)
    ccall((:p4est_mesh_new_ext, p4est_lib), Ptr{p4est_mesh_t}, (Ptr{p4est_t}, Ptr{p4est_ghost_t}, Cint, Cint, p4est_connect_type_t), p4est, ghost, compute_tree_index, compute_level_lists, btype)
end

function p4est_copy_ext(input, copy_data, duplicate_mpicomm)
    ccall((:p4est_copy_ext, p4est_lib), Ptr{p4est_t}, (Ptr{p4est_t}, Cint, Cint), input, copy_data, duplicate_mpicomm)
end

function p4est_refine_ext(p4est, refine_recursive, maxlevel, refine_fn, init_fn, replace_fn)
    ccall((:p4est_refine_ext, p4est_lib), Cvoid, (Ptr{p4est_t}, Cint, Cint, p4est_refine_t, p4est_init_t, p4est_replace_t), p4est, refine_recursive, maxlevel, refine_fn, init_fn, replace_fn)
end

function p4est_coarsen_ext(p4est, coarsen_recursive, callback_orphans, coarsen_fn, init_fn, replace_fn)
    ccall((:p4est_coarsen_ext, p4est_lib), Cvoid, (Ptr{p4est_t}, Cint, Cint, p4est_coarsen_t, p4est_init_t, p4est_replace_t), p4est, coarsen_recursive, callback_orphans, coarsen_fn, init_fn, replace_fn)
end

function p4est_balance_ext(p4est, btype, init_fn, replace_fn)
    ccall((:p4est_balance_ext, p4est_lib), Cvoid, (Ptr{p4est_t}, p4est_connect_type_t, p4est_init_t, p4est_replace_t), p4est, btype, init_fn, replace_fn)
end

function p4est_balance_subtree_ext(p4est, btype, which_tree, init_fn, replace_fn)
    ccall((:p4est_balance_subtree_ext, p4est_lib), Cvoid, (Ptr{p4est_t}, p4est_connect_type_t, p4est_topidx_t, p4est_init_t, p4est_replace_t), p4est, btype, which_tree, init_fn, replace_fn)
end

function p4est_partition_ext(p4est, partition_for_coarsening, weight_fn)
    ccall((:p4est_partition_ext, p4est_lib), p4est_gloidx_t, (Ptr{p4est_t}, Cint, p4est_weight_t), p4est, partition_for_coarsening, weight_fn)
end

function p4est_partition_for_coarsening(p4est, num_quadrants_in_proc)
    ccall((:p4est_partition_for_coarsening, p4est_lib), p4est_gloidx_t, (Ptr{p4est_t}, Ptr{p4est_locidx_t}), p4est, num_quadrants_in_proc)
end

function p4est_iterate_ext(p4est, ghost_layer, user_data, iter_volume, iter_face, iter_corner, remote)
    ccall((:p4est_iterate_ext, p4est_lib), Cvoid, (Ptr{p4est_t}, Ptr{p4est_ghost_t}, Ptr{Cvoid}, p4est_iter_volume_t, p4est_iter_face_t, p4est_iter_corner_t, Cint), p4est, ghost_layer, user_data, iter_volume, iter_face, iter_corner, remote)
end

function p4est_save_ext(filename, p4est, save_data, save_partition)
    ccall((:p4est_save_ext, p4est_lib), Cvoid, (Cstring, Ptr{p4est_t}, Cint, Cint), filename, p4est, save_data, save_partition)
end

function p4est_load_ext(filename, mpicomm, data_size, load_data, autopartition, broadcasthead, user_pointer, connectivity)
    ccall((:p4est_load_ext, p4est_lib), Ptr{p4est_t}, (Cstring, MPI_Comm, Csize_t, Cint, Cint, Cint, Ptr{Cvoid}, Ptr{Ptr{p4est_connectivity_t}}), filename, mpicomm, data_size, load_data, autopartition, broadcasthead, user_pointer, connectivity)
end

function p4est_source_ext(src, mpicomm, data_size, load_data, autopartition, broadcasthead, user_pointer, connectivity)
    ccall((:p4est_source_ext, p4est_lib), Ptr{p4est_t}, (Ptr{sc_io_source_t}, MPI_Comm, Csize_t, Cint, Cint, Cint, Ptr{Cvoid}, Ptr{Ptr{p4est_connectivity_t}}), src, mpicomm, data_size, load_data, autopartition, broadcasthead, user_pointer, connectivity)
end

function p4est_get_plex_data_ext(p4est, ghost, lnodes, ctype, overlap, first_local_quad, out_points_per_dim, out_cone_sizes, out_cones, out_cone_orientations, out_vertex_coords, out_children, out_parents, out_childids, out_leaves, out_remotes, custom_numbering)
    ccall((:p4est_get_plex_data_ext, p4est_lib), Cvoid, (Ptr{p4est_t}, Ptr{Ptr{p4est_ghost_t}}, Ptr{Ptr{p4est_lnodes_t}}, p4est_connect_type_t, Cint, Ptr{p4est_locidx_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Cint), p4est, ghost, lnodes, ctype, overlap, first_local_quad, out_points_per_dim, out_cone_sizes, out_cones, out_cone_orientations, out_vertex_coords, out_children, out_parents, out_childids, out_leaves, out_remotes, custom_numbering)
end

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: p4est_geometry.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

function p4est_geometry_destroy(geom)
    ccall((:p4est_geometry_destroy, p4est_lib), Cvoid, (Ptr{p4est_geometry_t},), geom)
end

function p4est_geometry_new_connectivity(conn)
    ccall((:p4est_geometry_new_connectivity, p4est_lib), Ptr{p4est_geometry_t}, (Ptr{p4est_connectivity_t},), conn)
end

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: p4est_ghost.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

function p4est_ghost_is_valid(p4est, ghost)
    ccall((:p4est_ghost_is_valid, p4est_lib), Cint, (Ptr{p4est_t}, Ptr{p4est_ghost_t}), p4est, ghost)
end

function p4est_ghost_memory_used()
    ccall((:p4est_ghost_memory_used, p4est_lib), Cint, ())
end

function p4est_quadrant_find_owner(p4est, treeid, face, q)
    ccall((:p4est_quadrant_find_owner, p4est_lib), Cint, (Ptr{p4est_t}, p4est_topidx_t, Cint, Ptr{p4est_quadrant_t}), p4est, treeid, face, q)
end

function p4est_ghost_new(p4est, btype)
    ccall((:p4est_ghost_new, p4est_lib), Ptr{p4est_ghost_t}, (Ptr{p4est_t}, p4est_connect_type_t), p4est, btype)
end

function p4est_ghost_destroy(ghost)
    ccall((:p4est_ghost_destroy, p4est_lib), Cvoid, (Ptr{p4est_ghost_t},), ghost)
end

function p4est_ghost_bsearch(ghost, which_proc, which_tree, q)
    ccall((:p4est_ghost_bsearch, p4est_lib), ssize_t, (Ptr{p4est_ghost_t}, Cint, p4est_topidx_t, Ptr{p4est_quadrant_t}), ghost, which_proc, which_tree, q)
end

function p4est_ghost_contains(ghost, which_proc, which_tree, q)
    ccall((:p4est_ghost_contains, p4est_lib), ssize_t, (Ptr{p4est_ghost_t}, Cint, p4est_topidx_t, Ptr{p4est_quadrant_t}), ghost, which_proc, which_tree, q)
end

function p4est_face_quadrant_exists(p4est, ghost, treeid, q, face, hang, owner_rank)
    ccall((:p4est_face_quadrant_exists, p4est_lib), p4est_locidx_t, (Ptr{p4est_t}, Ptr{p4est_ghost_t}, p4est_topidx_t, Ptr{p4est_quadrant_t}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), p4est, ghost, treeid, q, face, hang, owner_rank)
end

function p4est_quadrant_exists(p4est, ghost, treeid, q, exists_arr, rproc_arr, rquad_arr)
    ccall((:p4est_quadrant_exists, p4est_lib), Cint, (Ptr{p4est_t}, Ptr{p4est_ghost_t}, p4est_topidx_t, Ptr{p4est_quadrant_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{sc_array_t}), p4est, ghost, treeid, q, exists_arr, rproc_arr, rquad_arr)
end

function p4est_is_balanced(p4est, btype)
    ccall((:p4est_is_balanced, p4est_lib), Cint, (Ptr{p4est_t}, p4est_connect_type_t), p4est, btype)
end

function p4est_ghost_checksum(p4est, ghost)
    ccall((:p4est_ghost_checksum, p4est_lib), UInt32, (Ptr{p4est_t}, Ptr{p4est_ghost_t}), p4est, ghost)
end

function p4est_ghost_exchange_data(p4est, ghost, ghost_data)
    ccall((:p4est_ghost_exchange_data, p4est_lib), Cvoid, (Ptr{p4est_t}, Ptr{p4est_ghost_t}, Ptr{Cvoid}), p4est, ghost, ghost_data)
end

function p4est_ghost_exchange_data_begin(p4est, ghost, ghost_data)
    ccall((:p4est_ghost_exchange_data_begin, p4est_lib), Ptr{p4est_ghost_exchange_t}, (Ptr{p4est_t}, Ptr{p4est_ghost_t}, Ptr{Cvoid}), p4est, ghost, ghost_data)
end

function p4est_ghost_exchange_data_end(exc)
    ccall((:p4est_ghost_exchange_data_end, p4est_lib), Cvoid, (Ptr{p4est_ghost_exchange_t},), exc)
end

function p4est_ghost_exchange_custom(p4est, ghost, data_size, mirror_data, ghost_data)
    ccall((:p4est_ghost_exchange_custom, p4est_lib), Cvoid, (Ptr{p4est_t}, Ptr{p4est_ghost_t}, Csize_t, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}), p4est, ghost, data_size, mirror_data, ghost_data)
end

function p4est_ghost_exchange_custom_begin(p4est, ghost, data_size, mirror_data, ghost_data)
    ccall((:p4est_ghost_exchange_custom_begin, p4est_lib), Ptr{p4est_ghost_exchange_t}, (Ptr{p4est_t}, Ptr{p4est_ghost_t}, Csize_t, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}), p4est, ghost, data_size, mirror_data, ghost_data)
end

function p4est_ghost_exchange_custom_end(exc)
    ccall((:p4est_ghost_exchange_custom_end, p4est_lib), Cvoid, (Ptr{p4est_ghost_exchange_t},), exc)
end

function p4est_ghost_exchange_custom_levels(p4est, ghost, minlevel, maxlevel, data_size, mirror_data, ghost_data)
    ccall((:p4est_ghost_exchange_custom_levels, p4est_lib), Cvoid, (Ptr{p4est_t}, Ptr{p4est_ghost_t}, Cint, Cint, Csize_t, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}), p4est, ghost, minlevel, maxlevel, data_size, mirror_data, ghost_data)
end

function p4est_ghost_exchange_custom_levels_begin(p4est, ghost, minlevel, maxlevel, data_size, mirror_data, ghost_data)
    ccall((:p4est_ghost_exchange_custom_levels_begin, p4est_lib), Ptr{p4est_ghost_exchange_t}, (Ptr{p4est_t}, Ptr{p4est_ghost_t}, Cint, Cint, Csize_t, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}), p4est, ghost, minlevel, maxlevel, data_size, mirror_data, ghost_data)
end

function p4est_ghost_exchange_custom_levels_end(exc)
    ccall((:p4est_ghost_exchange_custom_levels_end, p4est_lib), Cvoid, (Ptr{p4est_ghost_exchange_t},), exc)
end

function p4est_ghost_expand(p4est, ghost)
    ccall((:p4est_ghost_expand, p4est_lib), Cvoid, (Ptr{p4est_t}, Ptr{p4est_ghost_t}), p4est, ghost)
end

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: p4est_iterate.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

function p4est_iterate(p4est, ghost_layer, user_data, iter_volume, iter_face, iter_corner)
    ccall((:p4est_iterate, p4est_lib), Cvoid, (Ptr{p4est_t}, Ptr{p4est_ghost_t}, Ptr{Cvoid}, p4est_iter_volume_t, p4est_iter_face_t, p4est_iter_corner_t), p4est, ghost_layer, user_data, iter_volume, iter_face, iter_corner)
end

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: p4est_mesh.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

function p4est_mesh_memory_used()
    ccall((:p4est_mesh_memory_used, p4est_lib), Cint, ())
end

function p4est_mesh_new(p4est, ghost, btype)
    ccall((:p4est_mesh_new, p4est_lib), Ptr{p4est_mesh_t}, (Ptr{p4est_t}, Ptr{p4est_ghost_t}, p4est_connect_type_t), p4est, ghost, btype)
end

function p4est_mesh_destroy(mesh)
    ccall((:p4est_mesh_destroy, p4est_lib), Cvoid, (Ptr{p4est_mesh_t},), mesh)
end

function p4est_mesh_quadrant_cumulative(p4est, cumulative_id, which_tree, quadrant_id)
    ccall((:p4est_mesh_quadrant_cumulative, p4est_lib), Ptr{p4est_quadrant_t}, (Ptr{p4est_t}, p4est_locidx_t, Ptr{p4est_topidx_t}, Ptr{p4est_locidx_t}), p4est, cumulative_id, which_tree, quadrant_id)
end

function p4est_mesh_face_neighbor_init2(mfn, p4est, ghost, mesh, which_tree, quadrant_id)
    ccall((:p4est_mesh_face_neighbor_init2, p4est_lib), Cvoid, (Ptr{p4est_mesh_face_neighbor_t}, Ptr{p4est_t}, Ptr{p4est_ghost_t}, Ptr{p4est_mesh_t}, p4est_topidx_t, p4est_locidx_t), mfn, p4est, ghost, mesh, which_tree, quadrant_id)
end

function p4est_mesh_face_neighbor_init(mfn, p4est, ghost, mesh, which_tree, quadrant)
    ccall((:p4est_mesh_face_neighbor_init, p4est_lib), Cvoid, (Ptr{p4est_mesh_face_neighbor_t}, Ptr{p4est_t}, Ptr{p4est_ghost_t}, Ptr{p4est_mesh_t}, p4est_topidx_t, Ptr{p4est_quadrant_t}), mfn, p4est, ghost, mesh, which_tree, quadrant)
end

function p4est_mesh_face_neighbor_next(mfn, ntree, nquad, nface, nrank)
    ccall((:p4est_mesh_face_neighbor_next, p4est_lib), Ptr{p4est_quadrant_t}, (Ptr{p4est_mesh_face_neighbor_t}, Ptr{p4est_topidx_t}, Ptr{p4est_locidx_t}, Ptr{Cint}, Ptr{Cint}), mfn, ntree, nquad, nface, nrank)
end

function p4est_mesh_face_neighbor_data(mfn, ghost_data)
    ccall((:p4est_mesh_face_neighbor_data, p4est_lib), Ptr{Cvoid}, (Ptr{p4est_mesh_face_neighbor_t}, Ptr{Cvoid}), mfn, ghost_data)
end

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: p4est_search.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

function p4est_find_lower_bound(array, q, guess)
    ccall((:p4est_find_lower_bound, p4est_lib), ssize_t, (Ptr{sc_array_t}, Ptr{p4est_quadrant_t}, Csize_t), array, q, guess)
end

function p4est_find_higher_bound(array, q, guess)
    ccall((:p4est_find_higher_bound, p4est_lib), ssize_t, (Ptr{sc_array_t}, Ptr{p4est_quadrant_t}, Csize_t), array, q, guess)
end

function p4est_split_array(array, level, indices)
    ccall((:p4est_split_array, p4est_lib), Cvoid, (Ptr{sc_array_t}, Cint, Cint), array, level, indices)
end

function p4est_find_range_boundaries(lq, uq, level, faces, corners)
    ccall((:p4est_find_range_boundaries, p4est_lib), Int32, (Ptr{p4est_quadrant_t}, Ptr{p4est_quadrant_t}, Cint, Ptr{Cint}, Ptr{Cint}), lq, uq, level, faces, corners)
end

function p4est_search_local(p4est, call_post, quadrant_fn, point_fn, points)
    ccall((:p4est_search_local, p4est_lib), Cvoid, (Ptr{p4est_t}, Cint, p4est_search_local_t, p4est_search_local_t, Ptr{sc_array_t}), p4est, call_post, quadrant_fn, point_fn, points)
end

function p4est_search(p4est, quadrant_fn, point_fn, points)
    ccall((:p4est_search, p4est_lib), Cvoid, (Ptr{p4est_t}, p4est_search_query_t, p4est_search_query_t, Ptr{sc_array_t}), p4est, quadrant_fn, point_fn, points)
end

function p4est_search_partition(p4est, call_post, quadrant_fn, point_fn, points)
    ccall((:p4est_search_partition, p4est_lib), Cvoid, (Ptr{p4est_t}, Cint, p4est_search_partition_t, p4est_search_partition_t, Ptr{sc_array_t}), p4est, call_post, quadrant_fn, point_fn, points)
end

function p4est_search_all(p4est, call_post, quadrant_fn, point_fn, points)
    ccall((:p4est_search_all, p4est_lib), Cvoid, (Ptr{p4est_t}, Cint, p4est_search_all_t, p4est_search_all_t, Ptr{sc_array_t}), p4est, call_post, quadrant_fn, point_fn, points)
end

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: p4est_vtk.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

function p4est_vtk_write_file(p4est, geom, filename)
    ccall((:p4est_vtk_write_file, p4est_lib), Cvoid, (Ptr{p4est_t}, Ptr{p4est_geometry_t}, Cstring), p4est, geom, filename)
end

function p4est_vtk_context_new(p4est, filename)
    ccall((:p4est_vtk_context_new, p4est_lib), Ptr{p4est_vtk_context_t}, (Ptr{p4est_t}, Cstring), p4est, filename)
end

function p4est_vtk_context_set_geom(cont, geom)
    ccall((:p4est_vtk_context_set_geom, p4est_lib), Cvoid, (Ptr{p4est_vtk_context_t}, Ptr{p4est_geometry_t}), cont, geom)
end

function p4est_vtk_context_set_scale(cont, scale)
    ccall((:p4est_vtk_context_set_scale, p4est_lib), Cvoid, (Ptr{p4est_vtk_context_t}, Cdouble), cont, scale)
end

function p4est_vtk_context_set_continuous(cont, continuous)
    ccall((:p4est_vtk_context_set_continuous, p4est_lib), Cvoid, (Ptr{p4est_vtk_context_t}, Cint), cont, continuous)
end

function p4est_vtk_context_destroy(context)
    ccall((:p4est_vtk_context_destroy, p4est_lib), Cvoid, (Ptr{p4est_vtk_context_t},), context)
end

function p4est_vtk_write_header(cont)
    ccall((:p4est_vtk_write_header, p4est_lib), Ptr{p4est_vtk_context_t}, (Ptr{p4est_vtk_context_t},), cont)
end

function p4est_vtk_write_cell_data(cont, write_tree, write_level, write_rank, wrap_rank, num_cell_scalars, num_cell_vectors, filenames, values)
    ccall((:p4est_vtk_write_cell_data, p4est_lib), Ptr{p4est_vtk_context_t}, (Ptr{p4est_vtk_context_t}, Cint, Cint, Cint, Cint, Cint, Cint, Ptr{Cstring}, Ptr{Ptr{sc_array_t}}), cont, write_tree, write_level, write_rank, wrap_rank, num_cell_scalars, num_cell_vectors, filenames, values)
end

function p4est_vtk_write_footer(cont)
    ccall((:p4est_vtk_write_footer, p4est_lib), Cint, (Ptr{p4est_vtk_context_t},), cont)
end

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: p6est.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

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

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: p6est_extended.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

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

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: p6est_ghost.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

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

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: p8est.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

function p8est_memory_used()
    ccall((:p8est_memory_used, p4est_lib), Cint, ())
end

function p8est_revision(p8est)
    ccall((:p8est_revision, p4est_lib), Clong, (Ptr{p8est_t},), p8est)
end

function p8est_qcoord_to_vertex(connectivity, treeid, x, y, z, vxyz)
    ccall((:p8est_qcoord_to_vertex, p4est_lib), Cvoid, (Ptr{p8est_connectivity_t}, p4est_topidx_t, p4est_qcoord_t, p4est_qcoord_t, p4est_qcoord_t, Ptr{Cdouble}), connectivity, treeid, x, y, z, vxyz)
end

function p8est_new(mpicomm, connectivity, data_size, init_fn, user_pointer)
    ccall((:p8est_new, p4est_lib), Ptr{p8est_t}, (MPI_Comm, Ptr{p8est_connectivity_t}, Csize_t, p8est_init_t, Ptr{Cvoid}), mpicomm, connectivity, data_size, init_fn, user_pointer)
end

function p8est_destroy(p8est)
    ccall((:p8est_destroy, p4est_lib), Cvoid, (Ptr{p8est_t},), p8est)
end

function p8est_copy(input, copy_data)
    ccall((:p8est_copy, p4est_lib), Ptr{p8est_t}, (Ptr{p8est_t}, Cint), input, copy_data)
end

function p8est_reset_data(p8est, data_size, init_fn, user_pointer)
    ccall((:p8est_reset_data, p4est_lib), Cvoid, (Ptr{p8est_t}, Csize_t, p8est_init_t, Ptr{Cvoid}), p8est, data_size, init_fn, user_pointer)
end

function p8est_refine(p8est, refine_recursive, refine_fn, init_fn)
    ccall((:p8est_refine, p4est_lib), Cvoid, (Ptr{p8est_t}, Cint, p8est_refine_t, p8est_init_t), p8est, refine_recursive, refine_fn, init_fn)
end

function p8est_coarsen(p8est, coarsen_recursive, coarsen_fn, init_fn)
    ccall((:p8est_coarsen, p4est_lib), Cvoid, (Ptr{p8est_t}, Cint, p8est_coarsen_t, p8est_init_t), p8est, coarsen_recursive, coarsen_fn, init_fn)
end

function p8est_balance(p8est, btype, init_fn)
    ccall((:p8est_balance, p4est_lib), Cvoid, (Ptr{p8est_t}, p8est_connect_type_t, p8est_init_t), p8est, btype, init_fn)
end

function p8est_partition(p8est, allow_for_coarsening, weight_fn)
    ccall((:p8est_partition, p4est_lib), Cvoid, (Ptr{p8est_t}, Cint, p8est_weight_t), p8est, allow_for_coarsening, weight_fn)
end

function p8est_checksum(p8est)
    ccall((:p8est_checksum, p4est_lib), UInt32, (Ptr{p8est_t},), p8est)
end

function p8est_save(filename, p8est, save_data)
    ccall((:p8est_save, p4est_lib), Cvoid, (Cstring, Ptr{p8est_t}, Cint), filename, p8est, save_data)
end

function p8est_load(filename, mpicomm, data_size, load_data, user_pointer, connectivity)
    ccall((:p8est_load, p4est_lib), Ptr{p8est_t}, (Cstring, MPI_Comm, Csize_t, Cint, Ptr{Cvoid}, Ptr{Ptr{p8est_connectivity_t}}), filename, mpicomm, data_size, load_data, user_pointer, connectivity)
end

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: p8est_bits.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

function p8est_quadrant_print(log_priority, q)
    ccall((:p8est_quadrant_print, p4est_lib), Cvoid, (Cint, Ptr{p8est_quadrant_t}), log_priority, q)
end

function p8est_quadrant_is_equal(q1, q2)
    ccall((:p8est_quadrant_is_equal, p4est_lib), Cint, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}), q1, q2)
end

function p8est_quadrant_overlaps(q1, q2)
    ccall((:p8est_quadrant_overlaps, p4est_lib), Cint, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}), q1, q2)
end

function p8est_quadrant_is_equal_piggy(q1, q2)
    ccall((:p8est_quadrant_is_equal_piggy, p4est_lib), Cint, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}), q1, q2)
end

function p8est_quadrant_compare(v1, v2)
    ccall((:p8est_quadrant_compare, p4est_lib), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), v1, v2)
end

function p8est_quadrant_disjoint(v1, v2)
    ccall((:p8est_quadrant_disjoint, p4est_lib), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), v1, v2)
end

function p8est_quadrant_compare_piggy(v1, v2)
    ccall((:p8est_quadrant_compare_piggy, p4est_lib), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), v1, v2)
end

function p8est_quadrant_compare_local_num(v1, v2)
    ccall((:p8est_quadrant_compare_local_num, p4est_lib), Cint, (Ptr{Cvoid}, Ptr{Cvoid}), v1, v2)
end

function p8est_quadrant_equal_fn(v1, v2, u)
    ccall((:p8est_quadrant_equal_fn, p4est_lib), Cint, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), v1, v2, u)
end

function p8est_quadrant_hash_fn(v, u)
    ccall((:p8est_quadrant_hash_fn, p4est_lib), UInt32, (Ptr{Cvoid}, Ptr{Cvoid}), v, u)
end

function p8est_node_equal_piggy_fn(v1, v2, u)
    ccall((:p8est_node_equal_piggy_fn, p4est_lib), Cint, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), v1, v2, u)
end

function p8est_node_hash_piggy_fn(v, u)
    ccall((:p8est_node_hash_piggy_fn, p4est_lib), UInt32, (Ptr{Cvoid}, Ptr{Cvoid}), v, u)
end

function p8est_node_clamp_inside(n, r)
    ccall((:p8est_node_clamp_inside, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}), n, r)
end

function p8est_node_unclamp(n)
    ccall((:p8est_node_unclamp, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t},), n)
end

function p8est_node_to_quadrant(n, level, q)
    ccall((:p8est_node_to_quadrant, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Cint, Ptr{p8est_quadrant_t}), n, level, q)
end

function p8est_quadrant_contains_node(q, n)
    ccall((:p8est_quadrant_contains_node, p4est_lib), Cint, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}), q, n)
end

function p8est_quadrant_ancestor_id(q, level)
    ccall((:p8est_quadrant_ancestor_id, p4est_lib), Cint, (Ptr{p8est_quadrant_t}, Cint), q, level)
end

function p8est_quadrant_child_id(q)
    ccall((:p8est_quadrant_child_id, p4est_lib), Cint, (Ptr{p8est_quadrant_t},), q)
end

function p8est_quadrant_is_inside_root(q)
    ccall((:p8est_quadrant_is_inside_root, p4est_lib), Cint, (Ptr{p8est_quadrant_t},), q)
end

function p8est_quadrant_is_inside_3x3(q)
    ccall((:p8est_quadrant_is_inside_3x3, p4est_lib), Cint, (Ptr{p8est_quadrant_t},), q)
end

function p8est_quadrant_is_outside_face(q)
    ccall((:p8est_quadrant_is_outside_face, p4est_lib), Cint, (Ptr{p8est_quadrant_t},), q)
end

function p8est_quadrant_is_outside_edge(q)
    ccall((:p8est_quadrant_is_outside_edge, p4est_lib), Cint, (Ptr{p8est_quadrant_t},), q)
end

function p8est_quadrant_is_outside_edge_extra(q, edge)
    ccall((:p8est_quadrant_is_outside_edge_extra, p4est_lib), Cint, (Ptr{p8est_quadrant_t}, Ptr{Cint}), q, edge)
end

function p8est_quadrant_is_outside_corner(q)
    ccall((:p8est_quadrant_is_outside_corner, p4est_lib), Cint, (Ptr{p8est_quadrant_t},), q)
end

function p8est_quadrant_is_node(q, inside)
    ccall((:p8est_quadrant_is_node, p4est_lib), Cint, (Ptr{p8est_quadrant_t}, Cint), q, inside)
end

function p8est_quadrant_is_valid(q)
    ccall((:p8est_quadrant_is_valid, p4est_lib), Cint, (Ptr{p8est_quadrant_t},), q)
end

function p8est_quadrant_is_extended(q)
    ccall((:p8est_quadrant_is_extended, p4est_lib), Cint, (Ptr{p8est_quadrant_t},), q)
end

function p8est_quadrant_is_sibling(q1, q2)
    ccall((:p8est_quadrant_is_sibling, p4est_lib), Cint, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}), q1, q2)
end

function p8est_quadrant_child(q, r, child_id)
    ccall((:p8est_quadrant_child, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Cint), q, r, child_id)
end

function p8est_quadrant_is_sibling_D(q1, q2)
    ccall((:p8est_quadrant_is_sibling_D, p4est_lib), Cint, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}), q1, q2)
end

function p8est_quadrant_is_family(q0, q1, q2, q3, q4, q5, q6, q7)
    ccall((:p8est_quadrant_is_family, p4est_lib), Cint, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}), q0, q1, q2, q3, q4, q5, q6, q7)
end

function p8est_quadrant_is_familyv(q)
    ccall((:p8est_quadrant_is_familyv, p4est_lib), Cint, (Ptr{p8est_quadrant_t},), q)
end

function p8est_quadrant_is_familypv(q)
    ccall((:p8est_quadrant_is_familypv, p4est_lib), Cint, (Ptr{Ptr{p8est_quadrant_t}},), q)
end

function p8est_quadrant_is_parent(q, r)
    ccall((:p8est_quadrant_is_parent, p4est_lib), Cint, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}), q, r)
end

function p8est_quadrant_is_parent_D(q, r)
    ccall((:p8est_quadrant_is_parent_D, p4est_lib), Cint, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}), q, r)
end

function p8est_quadrant_is_ancestor(q, r)
    ccall((:p8est_quadrant_is_ancestor, p4est_lib), Cint, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}), q, r)
end

function p8est_quadrant_is_ancestor_D(q, r)
    ccall((:p8est_quadrant_is_ancestor_D, p4est_lib), Cint, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}), q, r)
end

function p8est_quadrant_is_next(q, r)
    ccall((:p8est_quadrant_is_next, p4est_lib), Cint, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}), q, r)
end

function p8est_quadrant_is_next_D(q, r)
    ccall((:p8est_quadrant_is_next_D, p4est_lib), Cint, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}), q, r)
end

function p8est_quadrant_overlaps_tree(tree, q)
    ccall((:p8est_quadrant_overlaps_tree, p4est_lib), Cint, (Ptr{p8est_tree_t}, Ptr{p8est_quadrant_t}), tree, q)
end

function p8est_quadrant_is_inside_tree(tree, q)
    ccall((:p8est_quadrant_is_inside_tree, p4est_lib), Cint, (Ptr{p8est_tree_t}, Ptr{p8est_quadrant_t}), tree, q)
end

function p8est_quadrant_is_first_last(f, l, a)
    ccall((:p8est_quadrant_is_first_last, p4est_lib), Cint, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}), f, l, a)
end

function p8est_quadrant_enlarge_first(a, q)
    ccall((:p8est_quadrant_enlarge_first, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}), a, q)
end

function p8est_quadrant_enlarge_last(a, q)
    ccall((:p8est_quadrant_enlarge_last, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}), a, q)
end

function p8est_quadrant_ancestor(q, level, r)
    ccall((:p8est_quadrant_ancestor, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Cint, Ptr{p8est_quadrant_t}), q, level, r)
end

function p8est_quadrant_parent(q, r)
    ccall((:p8est_quadrant_parent, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}), q, r)
end

function p8est_quadrant_sibling(q, r, sibling_id)
    ccall((:p8est_quadrant_sibling, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Cint), q, r, sibling_id)
end

function p8est_quadrant_face_neighbor(q, face, r)
    ccall((:p8est_quadrant_face_neighbor, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Cint, Ptr{p8est_quadrant_t}), q, face, r)
end

function p8est_quadrant_face_neighbor_extra(q, t, face, r, nface, conn)
    ccall((:p8est_quadrant_face_neighbor_extra, p4est_lib), p4est_locidx_t, (Ptr{p8est_quadrant_t}, p4est_topidx_t, Cint, Ptr{p8est_quadrant_t}, Ptr{Cint}, Ptr{p8est_connectivity_t}), q, t, face, r, nface, conn)
end

function p8est_quadrant_half_face_neighbors(q, face, n, nur)
    ccall((:p8est_quadrant_half_face_neighbors, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Cint, Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}), q, face, n, nur)
end

function p8est_quadrant_all_face_neighbors(q, face, n)
    ccall((:p8est_quadrant_all_face_neighbors, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Cint, Ptr{p8est_quadrant_t}), q, face, n)
end

function p8est_quadrant_edge_neighbor(q, edge, r)
    ccall((:p8est_quadrant_edge_neighbor, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Cint, Ptr{p8est_quadrant_t}), q, edge, r)
end

function p8est_quadrant_edge_neighbor_extra(q, t, edge, quads, treeids, nedges, conn)
    ccall((:p8est_quadrant_edge_neighbor_extra, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, p4est_locidx_t, Cint, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{p8est_connectivity_t}), q, t, edge, quads, treeids, nedges, conn)
end

function p8est_quadrant_corner_neighbor(q, corner, r)
    ccall((:p8est_quadrant_corner_neighbor, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Cint, Ptr{p8est_quadrant_t}), q, corner, r)
end

function p8est_quadrant_corner_neighbor_extra(q, t, corner, quads, treeids, ncorners, conn)
    ccall((:p8est_quadrant_corner_neighbor_extra, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, p4est_locidx_t, Cint, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{p8est_connectivity_t}), q, t, corner, quads, treeids, ncorners, conn)
end

function p8est_quadrant_half_corner_neighbor(q, corner, r)
    ccall((:p8est_quadrant_half_corner_neighbor, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Cint, Ptr{p8est_quadrant_t}), q, corner, r)
end

function p8est_quadrant_corner_node(q, corner, r)
    ccall((:p8est_quadrant_corner_node, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Cint, Ptr{p8est_quadrant_t}), q, corner, r)
end

function p8est_quadrant_children(q, c0, c1, c2, c3, c4, c5, c6, c7)
    ccall((:p8est_quadrant_children, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}), q, c0, c1, c2, c3, c4, c5, c6, c7)
end

function p8est_quadrant_childrenv(q, c)
    ccall((:p8est_quadrant_childrenv, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}), q, c)
end

function p8est_quadrant_childrenpv(q, c)
    ccall((:p8est_quadrant_childrenpv, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Ptr{Ptr{p8est_quadrant_t}}), q, c)
end

function p8est_quadrant_first_descendant(q, fd, level)
    ccall((:p8est_quadrant_first_descendant, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Cint), q, fd, level)
end

function p8est_quadrant_last_descendant(q, ld, level)
    ccall((:p8est_quadrant_last_descendant, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Cint), q, ld, level)
end

function p8est_quadrant_corner_descendant(q, r, c, level)
    ccall((:p8est_quadrant_corner_descendant, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Cint, Cint), q, r, c, level)
end

function p8est_nearest_common_ancestor(q1, q2, r)
    ccall((:p8est_nearest_common_ancestor, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}), q1, q2, r)
end

function p8est_nearest_common_ancestor_D(q1, q2, r)
    ccall((:p8est_nearest_common_ancestor_D, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}), q1, q2, r)
end

function p8est_quadrant_transform_face(q, r, ftransform)
    ccall((:p8est_quadrant_transform_face, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Ptr{Cint}), q, r, ftransform)
end

function p8est_quadrant_touches_edge(q, edge, inside)
    ccall((:p8est_quadrant_touches_edge, p4est_lib), Cint, (Ptr{p8est_quadrant_t}, Cint, Cint), q, edge, inside)
end

function p8est_quadrant_transform_edge(q, r, ei, et, inside)
    ccall((:p8est_quadrant_transform_edge, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Ptr{p8est_edge_info_t}, Ptr{p8est_edge_transform_t}, Cint), q, r, ei, et, inside)
end

function p8est_quadrant_shift_edge(q, r, rup, rdown, edge)
    ccall((:p8est_quadrant_shift_edge, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Cint), q, r, rup, rdown, edge)
end

function p8est_quadrant_touches_corner(q, corner, inside)
    ccall((:p8est_quadrant_touches_corner, p4est_lib), Cint, (Ptr{p8est_quadrant_t}, Cint, Cint), q, corner, inside)
end

function p8est_quadrant_transform_corner(r, corner, inside)
    ccall((:p8est_quadrant_transform_corner, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Cint, Cint), r, corner, inside)
end

function p8est_quadrant_shift_corner(q, r, corner)
    ccall((:p8est_quadrant_shift_corner, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Cint), q, r, corner)
end

function p8est_quadrant_linear_id(quadrant, level)
    ccall((:p8est_quadrant_linear_id, p4est_lib), UInt64, (Ptr{p8est_quadrant_t}, Cint), quadrant, level)
end

function p8est_quadrant_set_morton(quadrant, level, id)
    ccall((:p8est_quadrant_set_morton, p4est_lib), Cvoid, (Ptr{p8est_quadrant_t}, Cint, UInt64), quadrant, level, id)
end

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: p8est_connectivity.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

function p8est_connect_type_int(btype)
    ccall((:p8est_connect_type_int, p4est_lib), Cint, (p8est_connect_type_t,), btype)
end

function p8est_connect_type_string(btype)
    ccall((:p8est_connect_type_string, p4est_lib), Cstring, (p8est_connect_type_t,), btype)
end

function p8est_connectivity_memory_used()
    ccall((:p8est_connectivity_memory_used, p4est_lib), Cint, ())
end

function p8est_connectivity_face_neighbor_corner_set(c, f, nf, set)
    ccall((:p8est_connectivity_face_neighbor_corner_set, p4est_lib), Cint, (Cint, Cint, Cint, Cint), c, f, nf, set)
end

function p8est_connectivity_face_neighbor_face_corner(fc, f, nf, o)
    ccall((:p8est_connectivity_face_neighbor_face_corner, p4est_lib), Cint, (Cint, Cint, Cint, Cint), fc, f, nf, o)
end

function p8est_connectivity_face_neighbor_corner(c, f, nf, o)
    ccall((:p8est_connectivity_face_neighbor_corner, p4est_lib), Cint, (Cint, Cint, Cint, Cint), c, f, nf, o)
end

function p8est_connectivity_face_neighbor_face_edge(fe, f, nf, o)
    ccall((:p8est_connectivity_face_neighbor_face_edge, p4est_lib), Cint, (Cint, Cint, Cint, Cint), fe, f, nf, o)
end

function p8est_connectivity_face_neighbor_edge(e, f, nf, o)
    ccall((:p8est_connectivity_face_neighbor_edge, p4est_lib), Cint, (Cint, Cint, Cint, Cint), e, f, nf, o)
end

function p8est_connectivity_edge_neighbor_edge_corner(ec, o)
    ccall((:p8est_connectivity_edge_neighbor_edge_corner, p4est_lib), Cint, (Cint, Cint), ec, o)
end

function p8est_connectivity_edge_neighbor_corner(c, e, ne, o)
    ccall((:p8est_connectivity_edge_neighbor_corner, p4est_lib), Cint, (Cint, Cint, Cint, Cint), c, e, ne, o)
end

function p8est_connectivity_new(num_vertices, num_trees, num_edges, num_ett, num_corners, num_ctt)
    ccall((:p8est_connectivity_new, p4est_lib), Ptr{p8est_connectivity_t}, (p4est_topidx_t, p4est_topidx_t, p4est_topidx_t, p4est_topidx_t, p4est_topidx_t, p4est_topidx_t), num_vertices, num_trees, num_edges, num_ett, num_corners, num_ctt)
end

function p8est_connectivity_new_copy(num_vertices, num_trees, num_edges, num_corners, vertices, ttv, ttt, ttf, tte, eoff, ett, ete, ttc, coff, ctt, ctc)
    ccall((:p8est_connectivity_new_copy, p4est_lib), Ptr{p8est_connectivity_t}, (p4est_topidx_t, p4est_topidx_t, p4est_topidx_t, p4est_topidx_t, Ptr{Cdouble}, Ptr{p4est_topidx_t}, Ptr{p4est_topidx_t}, Ptr{Int8}, Ptr{p4est_topidx_t}, Ptr{p4est_topidx_t}, Ptr{p4est_topidx_t}, Ptr{Int8}, Ptr{p4est_topidx_t}, Ptr{p4est_topidx_t}, Ptr{p4est_topidx_t}, Ptr{Int8}), num_vertices, num_trees, num_edges, num_corners, vertices, ttv, ttt, ttf, tte, eoff, ett, ete, ttc, coff, ctt, ctc)
end

function p8est_connectivity_bcast(conn_in, root, comm)
    ccall((:p8est_connectivity_bcast, p4est_lib), Ptr{p8est_connectivity_t}, (Ptr{p8est_connectivity_t}, Cint, MPI_Comm), conn_in, root, comm)
end

function p8est_connectivity_destroy(connectivity)
    ccall((:p8est_connectivity_destroy, p4est_lib), Cvoid, (Ptr{p8est_connectivity_t},), connectivity)
end

function p8est_connectivity_set_attr(conn, bytes_per_tree)
    ccall((:p8est_connectivity_set_attr, p4est_lib), Cvoid, (Ptr{p8est_connectivity_t}, Csize_t), conn, bytes_per_tree)
end

function p8est_connectivity_is_valid(connectivity)
    ccall((:p8est_connectivity_is_valid, p4est_lib), Cint, (Ptr{p8est_connectivity_t},), connectivity)
end

function p8est_connectivity_is_equal(conn1, conn2)
    ccall((:p8est_connectivity_is_equal, p4est_lib), Cint, (Ptr{p8est_connectivity_t}, Ptr{p8est_connectivity_t}), conn1, conn2)
end

function p8est_connectivity_sink(conn, sink)
    ccall((:p8est_connectivity_sink, p4est_lib), Cint, (Ptr{p8est_connectivity_t}, Ptr{sc_io_sink_t}), conn, sink)
end

function p8est_connectivity_deflate(conn, code)
    ccall((:p8est_connectivity_deflate, p4est_lib), Ptr{sc_array_t}, (Ptr{p8est_connectivity_t}, p8est_connectivity_encode_t), conn, code)
end

function p8est_connectivity_save(filename, connectivity)
    ccall((:p8est_connectivity_save, p4est_lib), Cint, (Cstring, Ptr{p8est_connectivity_t}), filename, connectivity)
end

function p8est_connectivity_source(source)
    ccall((:p8est_connectivity_source, p4est_lib), Ptr{p8est_connectivity_t}, (Ptr{sc_io_source_t},), source)
end

function p8est_connectivity_inflate(buffer)
    ccall((:p8est_connectivity_inflate, p4est_lib), Ptr{p8est_connectivity_t}, (Ptr{sc_array_t},), buffer)
end

function p8est_connectivity_load(filename, bytes)
    ccall((:p8est_connectivity_load, p4est_lib), Ptr{p8est_connectivity_t}, (Cstring, Ptr{Csize_t}), filename, bytes)
end

function p8est_connectivity_new_unitcube()
    ccall((:p8est_connectivity_new_unitcube, p4est_lib), Ptr{p8est_connectivity_t}, ())
end

function p8est_connectivity_new_periodic()
    ccall((:p8est_connectivity_new_periodic, p4est_lib), Ptr{p8est_connectivity_t}, ())
end

function p8est_connectivity_new_rotwrap()
    ccall((:p8est_connectivity_new_rotwrap, p4est_lib), Ptr{p8est_connectivity_t}, ())
end

function p8est_connectivity_new_twocubes()
    ccall((:p8est_connectivity_new_twocubes, p4est_lib), Ptr{p8est_connectivity_t}, ())
end

function p8est_connectivity_new_twotrees(l_face, r_face, orientation)
    ccall((:p8est_connectivity_new_twotrees, p4est_lib), Ptr{p8est_connectivity_t}, (Cint, Cint, Cint), l_face, r_face, orientation)
end

function p8est_connectivity_new_twowrap()
    ccall((:p8est_connectivity_new_twowrap, p4est_lib), Ptr{p8est_connectivity_t}, ())
end

function p8est_connectivity_new_rotcubes()
    ccall((:p8est_connectivity_new_rotcubes, p4est_lib), Ptr{p8est_connectivity_t}, ())
end

function p8est_connectivity_new_brick(m, n, p, periodic_a, periodic_b, periodic_c)
    ccall((:p8est_connectivity_new_brick, p4est_lib), Ptr{p8est_connectivity_t}, (Cint, Cint, Cint, Cint, Cint, Cint), m, n, p, periodic_a, periodic_b, periodic_c)
end

function p8est_connectivity_new_shell()
    ccall((:p8est_connectivity_new_shell, p4est_lib), Ptr{p8est_connectivity_t}, ())
end

function p8est_connectivity_new_sphere()
    ccall((:p8est_connectivity_new_sphere, p4est_lib), Ptr{p8est_connectivity_t}, ())
end

function p8est_connectivity_new_byname(name)
    ccall((:p8est_connectivity_new_byname, p4est_lib), Ptr{p8est_connectivity_t}, (Cstring,), name)
end

function p8est_connectivity_refine(conn, num_per_edge)
    ccall((:p8est_connectivity_refine, p4est_lib), Ptr{p8est_connectivity_t}, (Ptr{p8est_connectivity_t}, Cint), conn, num_per_edge)
end

function p8est_expand_face_transform(iface, nface, ftransform)
    ccall((:p8est_expand_face_transform, p4est_lib), Cvoid, (Cint, Cint, Ptr{Cint}), iface, nface, ftransform)
end

function p8est_find_face_transform(connectivity, itree, iface, ftransform)
    ccall((:p8est_find_face_transform, p4est_lib), p4est_topidx_t, (Ptr{p8est_connectivity_t}, p4est_topidx_t, Cint, Ptr{Cint}), connectivity, itree, iface, ftransform)
end

function p8est_find_edge_transform(connectivity, itree, iedge, ei)
    ccall((:p8est_find_edge_transform, p4est_lib), Cvoid, (Ptr{p8est_connectivity_t}, p4est_topidx_t, Cint, Ptr{p8est_edge_info_t}), connectivity, itree, iedge, ei)
end

function p8est_find_corner_transform(connectivity, itree, icorner, ci)
    ccall((:p8est_find_corner_transform, p4est_lib), Cvoid, (Ptr{p8est_connectivity_t}, p4est_topidx_t, Cint, Ptr{p8est_corner_info_t}), connectivity, itree, icorner, ci)
end

function p8est_connectivity_complete(conn)
    ccall((:p8est_connectivity_complete, p4est_lib), Cvoid, (Ptr{p8est_connectivity_t},), conn)
end

function p8est_connectivity_reduce(conn)
    ccall((:p8est_connectivity_reduce, p4est_lib), Cvoid, (Ptr{p8est_connectivity_t},), conn)
end

function p8est_connectivity_permute(conn, perm, is_current_to_new)
    ccall((:p8est_connectivity_permute, p4est_lib), Cvoid, (Ptr{p8est_connectivity_t}, Ptr{sc_array_t}, Cint), conn, perm, is_current_to_new)
end

function p8est_connectivity_join_faces(conn, tree_left, tree_right, face_left, face_right, orientation)
    ccall((:p8est_connectivity_join_faces, p4est_lib), Cvoid, (Ptr{p8est_connectivity_t}, p4est_topidx_t, p4est_topidx_t, Cint, Cint, Cint), conn, tree_left, tree_right, face_left, face_right, orientation)
end

function p8est_connectivity_is_equivalent(conn1, conn2)
    ccall((:p8est_connectivity_is_equivalent, p4est_lib), Cint, (Ptr{p8est_connectivity_t}, Ptr{p8est_connectivity_t}), conn1, conn2)
end

function p8est_connectivity_read_inp_stream(stream, num_vertices, num_trees, vertices, tree_to_vertex)
    ccall((:p8est_connectivity_read_inp_stream, p4est_lib), Cint, (Ptr{FILE}, Ptr{p4est_topidx_t}, Ptr{p4est_topidx_t}, Ptr{Cdouble}, Ptr{p4est_topidx_t}), stream, num_vertices, num_trees, vertices, tree_to_vertex)
end

function p8est_connectivity_read_inp(filename)
    ccall((:p8est_connectivity_read_inp, p4est_lib), Ptr{p8est_connectivity_t}, (Cstring,), filename)
end

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: p8est_extended.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

function p8est_new_ext(mpicomm, connectivity, min_quadrants, min_level, fill_uniform, data_size, init_fn, user_pointer)
    ccall((:p8est_new_ext, p4est_lib), Ptr{p8est_t}, (MPI_Comm, Ptr{p8est_connectivity_t}, p4est_locidx_t, Cint, Cint, Csize_t, p8est_init_t, Ptr{Cvoid}), mpicomm, connectivity, min_quadrants, min_level, fill_uniform, data_size, init_fn, user_pointer)
end

function p8est_mesh_new_ext(p4est, ghost, compute_tree_index, compute_level_lists, btype)
    ccall((:p8est_mesh_new_ext, p4est_lib), Ptr{p8est_mesh_t}, (Ptr{p8est_t}, Ptr{p8est_ghost_t}, Cint, Cint, p8est_connect_type_t), p4est, ghost, compute_tree_index, compute_level_lists, btype)
end

function p8est_copy_ext(input, copy_data, duplicate_mpicomm)
    ccall((:p8est_copy_ext, p4est_lib), Ptr{p8est_t}, (Ptr{p8est_t}, Cint, Cint), input, copy_data, duplicate_mpicomm)
end

function p8est_refine_ext(p8est, refine_recursive, maxlevel, refine_fn, init_fn, replace_fn)
    ccall((:p8est_refine_ext, p4est_lib), Cvoid, (Ptr{p8est_t}, Cint, Cint, p8est_refine_t, p8est_init_t, p8est_replace_t), p8est, refine_recursive, maxlevel, refine_fn, init_fn, replace_fn)
end

function p8est_coarsen_ext(p8est, coarsen_recursive, callback_orphans, coarsen_fn, init_fn, replace_fn)
    ccall((:p8est_coarsen_ext, p4est_lib), Cvoid, (Ptr{p8est_t}, Cint, Cint, p8est_coarsen_t, p8est_init_t, p8est_replace_t), p8est, coarsen_recursive, callback_orphans, coarsen_fn, init_fn, replace_fn)
end

function p8est_balance_ext(p8est, btype, init_fn, replace_fn)
    ccall((:p8est_balance_ext, p4est_lib), Cvoid, (Ptr{p8est_t}, p8est_connect_type_t, p8est_init_t, p8est_replace_t), p8est, btype, init_fn, replace_fn)
end

function p8est_balance_subtree_ext(p8est, btype, which_tree, init_fn, replace_fn)
    ccall((:p8est_balance_subtree_ext, p4est_lib), Cvoid, (Ptr{p8est_t}, p8est_connect_type_t, p4est_topidx_t, p8est_init_t, p8est_replace_t), p8est, btype, which_tree, init_fn, replace_fn)
end

function p8est_partition_ext(p8est, partition_for_coarsening, weight_fn)
    ccall((:p8est_partition_ext, p4est_lib), p4est_gloidx_t, (Ptr{p8est_t}, Cint, p8est_weight_t), p8est, partition_for_coarsening, weight_fn)
end

function p8est_partition_for_coarsening(p8est, num_quadrants_in_proc)
    ccall((:p8est_partition_for_coarsening, p4est_lib), p4est_gloidx_t, (Ptr{p8est_t}, Ptr{p4est_locidx_t}), p8est, num_quadrants_in_proc)
end

function p8est_iterate_ext(p8est, ghost_layer, user_data, iter_volume, iter_face, iter_edge, iter_corner, remote)
    ccall((:p8est_iterate_ext, p4est_lib), Cvoid, (Ptr{p8est_t}, Ptr{p8est_ghost_t}, Ptr{Cvoid}, p8est_iter_volume_t, p8est_iter_face_t, p8est_iter_edge_t, p8est_iter_corner_t, Cint), p8est, ghost_layer, user_data, iter_volume, iter_face, iter_edge, iter_corner, remote)
end

function p8est_save_ext(filename, p8est, save_data, save_partition)
    ccall((:p8est_save_ext, p4est_lib), Cvoid, (Cstring, Ptr{p8est_t}, Cint, Cint), filename, p8est, save_data, save_partition)
end

function p8est_load_ext(filename, mpicomm, data_size, load_data, autopartition, broadcasthead, user_pointer, connectivity)
    ccall((:p8est_load_ext, p4est_lib), Ptr{p8est_t}, (Cstring, MPI_Comm, Csize_t, Cint, Cint, Cint, Ptr{Cvoid}, Ptr{Ptr{p8est_connectivity_t}}), filename, mpicomm, data_size, load_data, autopartition, broadcasthead, user_pointer, connectivity)
end

function p8est_source_ext(src, mpicomm, data_size, load_data, autopartition, broadcasthead, user_pointer, connectivity)
    ccall((:p8est_source_ext, p4est_lib), Ptr{p8est_t}, (Ptr{sc_io_source_t}, MPI_Comm, Csize_t, Cint, Cint, Cint, Ptr{Cvoid}, Ptr{Ptr{p8est_connectivity_t}}), src, mpicomm, data_size, load_data, autopartition, broadcasthead, user_pointer, connectivity)
end

function p8est_get_plex_data_ext(p8est, ghost, lnodes, ctype, overlap, first_local_quad, out_points_per_dim, out_cone_sizes, out_cones, out_cone_orientations, out_vertex_coords, out_children, out_parents, out_childids, out_leaves, out_remotes, custom_numbering)
    ccall((:p8est_get_plex_data_ext, p4est_lib), Cvoid, (Ptr{p8est_t}, Ptr{Ptr{p8est_ghost_t}}, Ptr{Ptr{p8est_lnodes_t}}, p8est_connect_type_t, Cint, Ptr{p4est_locidx_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Cint), p8est, ghost, lnodes, ctype, overlap, first_local_quad, out_points_per_dim, out_cone_sizes, out_cones, out_cone_orientations, out_vertex_coords, out_children, out_parents, out_childids, out_leaves, out_remotes, custom_numbering)
end

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: p8est_geometry.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

function p8est_geometry_destroy(geom)
    ccall((:p8est_geometry_destroy, p4est_lib), Cvoid, (Ptr{p8est_geometry_t},), geom)
end

function p8est_geometry_new_connectivity(conn)
    ccall((:p8est_geometry_new_connectivity, p4est_lib), Ptr{p8est_geometry_t}, (Ptr{p8est_connectivity_t},), conn)
end

function p8est_geometry_new_shell(conn, R2, R1)
    ccall((:p8est_geometry_new_shell, p4est_lib), Ptr{p8est_geometry_t}, (Ptr{p8est_connectivity_t}, Cdouble, Cdouble), conn, R2, R1)
end

function p8est_geometry_new_sphere(conn, R2, R1, R0)
    ccall((:p8est_geometry_new_sphere, p4est_lib), Ptr{p8est_geometry_t}, (Ptr{p8est_connectivity_t}, Cdouble, Cdouble, Cdouble), conn, R2, R1, R0)
end

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: p8est_ghost.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

function p8est_ghost_is_valid(p8est, ghost)
    ccall((:p8est_ghost_is_valid, p4est_lib), Cint, (Ptr{p8est_t}, Ptr{p8est_ghost_t}), p8est, ghost)
end

function p8est_ghost_memory_used()
    ccall((:p8est_ghost_memory_used, p4est_lib), Cint, ())
end

function p8est_quadrant_find_owner(p8est, treeid, face, q)
    ccall((:p8est_quadrant_find_owner, p4est_lib), Cint, (Ptr{p8est_t}, p4est_topidx_t, Cint, Ptr{p8est_quadrant_t}), p8est, treeid, face, q)
end

function p8est_ghost_new(p8est, btype)
    ccall((:p8est_ghost_new, p4est_lib), Ptr{p8est_ghost_t}, (Ptr{p8est_t}, p8est_connect_type_t), p8est, btype)
end

function p8est_ghost_destroy(ghost)
    ccall((:p8est_ghost_destroy, p4est_lib), Cvoid, (Ptr{p8est_ghost_t},), ghost)
end

function p8est_ghost_bsearch(ghost, which_proc, which_tree, q)
    ccall((:p8est_ghost_bsearch, p4est_lib), ssize_t, (Ptr{p8est_ghost_t}, Cint, p4est_topidx_t, Ptr{p8est_quadrant_t}), ghost, which_proc, which_tree, q)
end

function p8est_ghost_tree_contains(ghost, which_proc, which_tree, q)
    ccall((:p8est_ghost_tree_contains, p4est_lib), ssize_t, (Ptr{p8est_ghost_t}, Cint, p4est_topidx_t, Ptr{p8est_quadrant_t}), ghost, which_proc, which_tree, q)
end

function p8est_face_quadrant_exists(p8est, ghost, treeid, q, face, hang, owner_rank)
    ccall((:p8est_face_quadrant_exists, p4est_lib), p4est_locidx_t, (Ptr{p8est_t}, Ptr{p8est_ghost_t}, p4est_topidx_t, Ptr{p8est_quadrant_t}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), p8est, ghost, treeid, q, face, hang, owner_rank)
end

function p8est_quadrant_exists(p8est, ghost, treeid, q, exists_arr, rproc_arr, rquad_arr)
    ccall((:p8est_quadrant_exists, p4est_lib), Cint, (Ptr{p8est_t}, Ptr{p8est_ghost_t}, p4est_topidx_t, Ptr{p8est_quadrant_t}, Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{sc_array_t}), p8est, ghost, treeid, q, exists_arr, rproc_arr, rquad_arr)
end

function p8est_is_balanced(p8est, btype)
    ccall((:p8est_is_balanced, p4est_lib), Cint, (Ptr{p8est_t}, p8est_connect_type_t), p8est, btype)
end

function p8est_ghost_checksum(p8est, ghost)
    ccall((:p8est_ghost_checksum, p4est_lib), UInt32, (Ptr{p8est_t}, Ptr{p8est_ghost_t}), p8est, ghost)
end

function p8est_ghost_exchange_data(p4est, ghost, ghost_data)
    ccall((:p8est_ghost_exchange_data, p4est_lib), Cvoid, (Ptr{p8est_t}, Ptr{p8est_ghost_t}, Ptr{Cvoid}), p4est, ghost, ghost_data)
end

function p8est_ghost_exchange_data_begin(p4est, ghost, ghost_data)
    ccall((:p8est_ghost_exchange_data_begin, p4est_lib), Ptr{p8est_ghost_exchange_t}, (Ptr{p8est_t}, Ptr{p8est_ghost_t}, Ptr{Cvoid}), p4est, ghost, ghost_data)
end

function p8est_ghost_exchange_data_end(exc)
    ccall((:p8est_ghost_exchange_data_end, p4est_lib), Cvoid, (Ptr{p8est_ghost_exchange_t},), exc)
end

function p8est_ghost_exchange_custom(p4est, ghost, data_size, mirror_data, ghost_data)
    ccall((:p8est_ghost_exchange_custom, p4est_lib), Cvoid, (Ptr{p8est_t}, Ptr{p8est_ghost_t}, Csize_t, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}), p4est, ghost, data_size, mirror_data, ghost_data)
end

function p8est_ghost_exchange_custom_begin(p4est, ghost, data_size, mirror_data, ghost_data)
    ccall((:p8est_ghost_exchange_custom_begin, p4est_lib), Ptr{p8est_ghost_exchange_t}, (Ptr{p8est_t}, Ptr{p8est_ghost_t}, Csize_t, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}), p4est, ghost, data_size, mirror_data, ghost_data)
end

function p8est_ghost_exchange_custom_end(exc)
    ccall((:p8est_ghost_exchange_custom_end, p4est_lib), Cvoid, (Ptr{p8est_ghost_exchange_t},), exc)
end

function p8est_ghost_exchange_custom_levels(p8est, ghost, minlevel, maxlevel, data_size, mirror_data, ghost_data)
    ccall((:p8est_ghost_exchange_custom_levels, p4est_lib), Cvoid, (Ptr{p8est_t}, Ptr{p8est_ghost_t}, Cint, Cint, Csize_t, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}), p8est, ghost, minlevel, maxlevel, data_size, mirror_data, ghost_data)
end

function p8est_ghost_exchange_custom_levels_begin(p4est, ghost, minlevel, maxlevel, data_size, mirror_data, ghost_data)
    ccall((:p8est_ghost_exchange_custom_levels_begin, p4est_lib), Ptr{p8est_ghost_exchange_t}, (Ptr{p8est_t}, Ptr{p8est_ghost_t}, Cint, Cint, Csize_t, Ptr{Ptr{Cvoid}}, Ptr{Cvoid}), p4est, ghost, minlevel, maxlevel, data_size, mirror_data, ghost_data)
end

function p8est_ghost_exchange_custom_levels_end(exc)
    ccall((:p8est_ghost_exchange_custom_levels_end, p4est_lib), Cvoid, (Ptr{p8est_ghost_exchange_t},), exc)
end

function p8est_ghost_expand(p8est, ghost)
    ccall((:p8est_ghost_expand, p4est_lib), Cvoid, (Ptr{p8est_t}, Ptr{p8est_ghost_t}), p8est, ghost)
end

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: p8est_iterate.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

function p8est_iterate(p4est, ghost_layer, user_data, iter_volume, iter_face, iter_edge, iter_corner)
    ccall((:p8est_iterate, p4est_lib), Cvoid, (Ptr{p8est_t}, Ptr{p8est_ghost_t}, Ptr{Cvoid}, p8est_iter_volume_t, p8est_iter_face_t, p8est_iter_edge_t, p8est_iter_corner_t), p4est, ghost_layer, user_data, iter_volume, iter_face, iter_edge, iter_corner)
end

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: p8est_mesh.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

function p8est_mesh_memory_used()
    ccall((:p8est_mesh_memory_used, p4est_lib), Cint, ())
end

function p8est_mesh_new(p8est, ghost, btype)
    ccall((:p8est_mesh_new, p4est_lib), Ptr{p8est_mesh_t}, (Ptr{p8est_t}, Ptr{p8est_ghost_t}, p8est_connect_type_t), p8est, ghost, btype)
end

function p8est_mesh_destroy(mesh)
    ccall((:p8est_mesh_destroy, p4est_lib), Cvoid, (Ptr{p8est_mesh_t},), mesh)
end

function p8est_mesh_quadrant_cumulative(p8est, cumulative_id, which_tree, quadrant_id)
    ccall((:p8est_mesh_quadrant_cumulative, p4est_lib), Ptr{p8est_quadrant_t}, (Ptr{p8est_t}, p4est_locidx_t, Ptr{p4est_topidx_t}, Ptr{p4est_locidx_t}), p8est, cumulative_id, which_tree, quadrant_id)
end

function p8est_mesh_face_neighbor_init2(mfn, p8est, ghost, mesh, which_tree, quadrant_id)
    ccall((:p8est_mesh_face_neighbor_init2, p4est_lib), Cvoid, (Ptr{p8est_mesh_face_neighbor_t}, Ptr{p8est_t}, Ptr{p8est_ghost_t}, Ptr{p8est_mesh_t}, p4est_topidx_t, p4est_locidx_t), mfn, p8est, ghost, mesh, which_tree, quadrant_id)
end

function p8est_mesh_face_neighbor_init(mfn, p8est, ghost, mesh, which_tree, quadrant)
    ccall((:p8est_mesh_face_neighbor_init, p4est_lib), Cvoid, (Ptr{p8est_mesh_face_neighbor_t}, Ptr{p8est_t}, Ptr{p8est_ghost_t}, Ptr{p8est_mesh_t}, p4est_topidx_t, Ptr{p8est_quadrant_t}), mfn, p8est, ghost, mesh, which_tree, quadrant)
end

function p8est_mesh_face_neighbor_next(mfn, ntree, nquad, nface, nrank)
    ccall((:p8est_mesh_face_neighbor_next, p4est_lib), Ptr{p8est_quadrant_t}, (Ptr{p8est_mesh_face_neighbor_t}, Ptr{p4est_topidx_t}, Ptr{p4est_locidx_t}, Ptr{Cint}, Ptr{Cint}), mfn, ntree, nquad, nface, nrank)
end

function p8est_mesh_face_neighbor_data(mfn, ghost_data)
    ccall((:p8est_mesh_face_neighbor_data, p4est_lib), Ptr{Cvoid}, (Ptr{p8est_mesh_face_neighbor_t}, Ptr{Cvoid}), mfn, ghost_data)
end

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: p8est_search.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

function p8est_find_lower_bound(array, q, guess)
    ccall((:p8est_find_lower_bound, p4est_lib), ssize_t, (Ptr{sc_array_t}, Ptr{p8est_quadrant_t}, Csize_t), array, q, guess)
end

function p8est_find_higher_bound(array, q, guess)
    ccall((:p8est_find_higher_bound, p4est_lib), ssize_t, (Ptr{sc_array_t}, Ptr{p8est_quadrant_t}, Csize_t), array, q, guess)
end

function p8est_split_array(array, level, indices)
    ccall((:p8est_split_array, p4est_lib), Cvoid, (Ptr{sc_array_t}, Cint, Cint), array, level, indices)
end

function p8est_find_range_boundaries(lq, uq, level, faces, edges, corners)
    ccall((:p8est_find_range_boundaries, p4est_lib), Int32, (Ptr{p8est_quadrant_t}, Ptr{p8est_quadrant_t}, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), lq, uq, level, faces, edges, corners)
end

function p8est_search_local(p4est, call_post, quadrant_fn, point_fn, points)
    ccall((:p8est_search_local, p4est_lib), Cvoid, (Ptr{p8est_t}, Cint, p8est_search_local_t, p8est_search_local_t, Ptr{sc_array_t}), p4est, call_post, quadrant_fn, point_fn, points)
end

function p8est_search(p4est, quadrant_fn, point_fn, points)
    ccall((:p8est_search, p4est_lib), Cvoid, (Ptr{p8est_t}, p8est_search_query_t, p8est_search_query_t, Ptr{sc_array_t}), p4est, quadrant_fn, point_fn, points)
end

function p8est_search_partition(p4est, call_post, quadrant_fn, point_fn, points)
    ccall((:p8est_search_partition, p4est_lib), Cvoid, (Ptr{p8est_t}, Cint, p8est_search_partition_t, p8est_search_partition_t, Ptr{sc_array_t}), p4est, call_post, quadrant_fn, point_fn, points)
end

function p8est_search_all(p4est, call_post, quadrant_fn, point_fn, points)
    ccall((:p8est_search_all, p4est_lib), Cvoid, (Ptr{p8est_t}, Cint, p8est_search_all_t, p8est_search_all_t, Ptr{sc_array_t}), p4est, call_post, quadrant_fn, point_fn, points)
end

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
# Julia wrapper for header: p8est_vtk.h
# Automatically generated using Clang.jl


function sc_extern_c_hack_3()
    ccall((:sc_extern_c_hack_3, p4est_lib), Cvoid, ())
end

function p8est_vtk_write_file(p8est, geom, filename)
    ccall((:p8est_vtk_write_file, p4est_lib), Cvoid, (Ptr{p8est_t}, Ptr{p8est_geometry_t}, Cstring), p8est, geom, filename)
end

function p8est_vtk_context_new(p4est, filename)
    ccall((:p8est_vtk_context_new, p4est_lib), Ptr{p8est_vtk_context_t}, (Ptr{p8est_t}, Cstring), p4est, filename)
end

function p8est_vtk_context_set_geom(cont, geom)
    ccall((:p8est_vtk_context_set_geom, p4est_lib), Cvoid, (Ptr{p8est_vtk_context_t}, Ptr{p8est_geometry_t}), cont, geom)
end

function p8est_vtk_context_set_scale(cont, scale)
    ccall((:p8est_vtk_context_set_scale, p4est_lib), Cvoid, (Ptr{p8est_vtk_context_t}, Cdouble), cont, scale)
end

function p8est_vtk_context_set_continuous(cont, continuous)
    ccall((:p8est_vtk_context_set_continuous, p4est_lib), Cvoid, (Ptr{p8est_vtk_context_t}, Cint), cont, continuous)
end

function p8est_vtk_context_destroy(context)
    ccall((:p8est_vtk_context_destroy, p4est_lib), Cvoid, (Ptr{p8est_vtk_context_t},), context)
end

function p8est_vtk_write_header(cont)
    ccall((:p8est_vtk_write_header, p4est_lib), Ptr{p8est_vtk_context_t}, (Ptr{p8est_vtk_context_t},), cont)
end

function p8est_vtk_write_footer(cont)
    ccall((:p8est_vtk_write_footer, p4est_lib), Cint, (Ptr{p8est_vtk_context_t},), cont)
end

function sc_extern_c_hack_4()
    ccall((:sc_extern_c_hack_4, p4est_lib), Cvoid, ())
end
