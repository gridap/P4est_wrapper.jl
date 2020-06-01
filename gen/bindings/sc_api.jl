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
# Julia wrapper for header: sc_io.h
# Automatically generated using Clang.jl


function sc_io_sink_destroy(sink)
    ccall((:sc_io_sink_destroy, p4est_lib), Cint, (Ptr{sc_io_sink_t},), sink)
end

function sc_io_sink_write(sink, data, bytes_avail)
    ccall((:sc_io_sink_write, p4est_lib), Cint, (Ptr{sc_io_sink_t}, Ptr{Cvoid}, Csize_t), sink, data, bytes_avail)
end

function sc_io_sink_complete(sink, bytes_in, bytes_out)
    ccall((:sc_io_sink_complete, p4est_lib), Cint, (Ptr{sc_io_sink_t}, Ptr{Csize_t}, Ptr{Csize_t}), sink, bytes_in, bytes_out)
end

function sc_io_sink_align(sink, bytes_align)
    ccall((:sc_io_sink_align, p4est_lib), Cint, (Ptr{sc_io_sink_t}, Csize_t), sink, bytes_align)
end

function sc_io_source_destroy(source)
    ccall((:sc_io_source_destroy, p4est_lib), Cint, (Ptr{sc_io_source_t},), source)
end

function sc_io_source_read(source, data, bytes_avail, bytes_out)
    ccall((:sc_io_source_read, p4est_lib), Cint, (Ptr{sc_io_source_t}, Ptr{Cvoid}, Csize_t, Ptr{Csize_t}), source, data, bytes_avail, bytes_out)
end

function sc_io_source_complete(source, bytes_in, bytes_out)
    ccall((:sc_io_source_complete, p4est_lib), Cint, (Ptr{sc_io_source_t}, Ptr{Csize_t}, Ptr{Csize_t}), source, bytes_in, bytes_out)
end

function sc_io_source_align(source, bytes_align)
    ccall((:sc_io_source_align, p4est_lib), Cint, (Ptr{sc_io_source_t}, Csize_t), source, bytes_align)
end

function sc_io_source_activate_mirror(source)
    ccall((:sc_io_source_activate_mirror, p4est_lib), Cint, (Ptr{sc_io_source_t},), source)
end

function sc_io_source_read_mirror(source, data, bytes_avail, bytes_out)
    ccall((:sc_io_source_read_mirror, p4est_lib), Cint, (Ptr{sc_io_source_t}, Ptr{Cvoid}, Csize_t, Ptr{Csize_t}), source, data, bytes_avail, bytes_out)
end

function sc_vtk_write_binary(vtkfile, numeric_data, byte_length)
    ccall((:sc_vtk_write_binary, p4est_lib), Cint, (Ptr{FILE}, Cstring, Csize_t), vtkfile, numeric_data, byte_length)
end

function sc_vtk_write_compressed(vtkfile, numeric_data, byte_length)
    ccall((:sc_vtk_write_compressed, p4est_lib), Cint, (Ptr{FILE}, Cstring, Csize_t), vtkfile, numeric_data, byte_length)
end

function sc_fwrite(ptr, size, nmemb, file, errmsg)
    ccall((:sc_fwrite, p4est_lib), Cvoid, (Ptr{Cvoid}, Csize_t, Csize_t, Ptr{FILE}, Cstring), ptr, size, nmemb, file, errmsg)
end

function sc_fread(ptr, size, nmemb, file, errmsg)
    ccall((:sc_fread, p4est_lib), Cvoid, (Ptr{Cvoid}, Csize_t, Csize_t, Ptr{FILE}, Cstring), ptr, size, nmemb, file, errmsg)
end

function sc_mpi_write(mpifile, ptr, zcount, t, errmsg)
    ccall((:sc_mpi_write, p4est_lib), Cvoid, (MPI_File, Ptr{Cvoid}, Csize_t, MPI_Datatype, Cstring), mpifile, ptr, zcount, t, errmsg)
end
