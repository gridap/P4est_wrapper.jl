# Julia wrapper for header: p4est.h
# Automatically generated using Clang.jl


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

function p4est_partition_given(p4est, num_quadrants_in_proc)
    ccall((:p4est_partition_given, p4est_lib), Cvoid, (Ptr{p4est_t}, Ptr{p4est_locidx_t}), p4est, num_quadrants_in_proc)
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
# Julia wrapper for header: p4est_bits.h
# Automatically generated using Clang.jl


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
# Julia wrapper for header: p4est_connectivity.h
# Automatically generated using Clang.jl


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
# Julia wrapper for header: p4est_extended.h
# Automatically generated using Clang.jl


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
# Julia wrapper for header: p4est_geometry.h
# Automatically generated using Clang.jl


function p4est_geometry_destroy(geom)
    ccall((:p4est_geometry_destroy, p4est_lib), Cvoid, (Ptr{p4est_geometry_t},), geom)
end

function p4est_geometry_new_connectivity(conn)
    ccall((:p4est_geometry_new_connectivity, p4est_lib), Ptr{p4est_geometry_t}, (Ptr{p4est_connectivity_t},), conn)
end
# Julia wrapper for header: p4est_ghost.h
# Automatically generated using Clang.jl


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
# Julia wrapper for header: p4est_iterate.h
# Automatically generated using Clang.jl


function p4est_iterate(p4est, ghost_layer, user_data, iter_volume, iter_face, iter_corner)
    ccall((:p4est_iterate, p4est_lib), Cvoid, (Ptr{p4est_t}, Ptr{p4est_ghost_t}, Ptr{Cvoid}, p4est_iter_volume_t, p4est_iter_face_t, p4est_iter_corner_t), p4est, ghost_layer, user_data, iter_volume, iter_face, iter_corner)
end
# Julia wrapper for header: p4est_lnodes.h
# Automatically generated using Clang.jl


function p4est_lnodes_new(p4est, ghost_layer, degree)
    ccall((:p4est_lnodes_new, p4est_lib), Ptr{p4est_lnodes_t}, (Ptr{p4est_t}, Ptr{p4est_ghost_t}, Cint), p4est, ghost_layer, degree)
end

function p4est_lnodes_destroy(lnodes)
    ccall((:p4est_lnodes_destroy, p4est_lib), Cvoid, (Ptr{p4est_lnodes_t},), lnodes)
end

function p4est_ghost_support_lnodes(p4est, lnodes, ghost)
    ccall((:p4est_ghost_support_lnodes, p4est_lib), Cvoid, (Ptr{p4est_t}, Ptr{p4est_lnodes_t}, Ptr{p4est_ghost_t}), p4est, lnodes, ghost)
end

function p4est_ghost_expand_by_lnodes(p4est, lnodes, ghost)
    ccall((:p4est_ghost_expand_by_lnodes, p4est_lib), Cvoid, (Ptr{p4est_t}, Ptr{p4est_lnodes_t}, Ptr{p4est_ghost_t}), p4est, lnodes, ghost)
end

function p4est_partition_lnodes(p4est, ghost, degree, partition_for_coarsening)
    ccall((:p4est_partition_lnodes, p4est_lib), Cvoid, (Ptr{p4est_t}, Ptr{p4est_ghost_t}, Cint, Cint), p4est, ghost, degree, partition_for_coarsening)
end

function p4est_partition_lnodes_detailed(p4est, ghost, nodes_per_volume, nodes_per_face, nodes_per_corner, partition_for_coarsening)
    ccall((:p4est_partition_lnodes_detailed, p4est_lib), Cvoid, (Ptr{p4est_t}, Ptr{p4est_ghost_t}, Cint, Cint, Cint, Cint), p4est, ghost, nodes_per_volume, nodes_per_face, nodes_per_corner, partition_for_coarsening)
end

function p4est_lnodes_share_owned_begin(node_data, lnodes)
    ccall((:p4est_lnodes_share_owned_begin, p4est_lib), Ptr{p4est_lnodes_buffer_t}, (Ptr{sc_array_t}, Ptr{p4est_lnodes_t}), node_data, lnodes)
end

function p4est_lnodes_share_owned_end(buffer)
    ccall((:p4est_lnodes_share_owned_end, p4est_lib), Cvoid, (Ptr{p4est_lnodes_buffer_t},), buffer)
end

function p4est_lnodes_share_owned(node_data, lnodes)
    ccall((:p4est_lnodes_share_owned, p4est_lib), Cvoid, (Ptr{sc_array_t}, Ptr{p4est_lnodes_t}), node_data, lnodes)
end

function p4est_lnodes_share_all_begin(node_data, lnodes)
    ccall((:p4est_lnodes_share_all_begin, p4est_lib), Ptr{p4est_lnodes_buffer_t}, (Ptr{sc_array_t}, Ptr{p4est_lnodes_t}), node_data, lnodes)
end

function p4est_lnodes_share_all_end(buffer)
    ccall((:p4est_lnodes_share_all_end, p4est_lib), Cvoid, (Ptr{p4est_lnodes_buffer_t},), buffer)
end

function p4est_lnodes_share_all(node_data, lnodes)
    ccall((:p4est_lnodes_share_all, p4est_lib), Ptr{p4est_lnodes_buffer_t}, (Ptr{sc_array_t}, Ptr{p4est_lnodes_t}), node_data, lnodes)
end

function p4est_lnodes_buffer_destroy(buffer)
    ccall((:p4est_lnodes_buffer_destroy, p4est_lib), Cvoid, (Ptr{p4est_lnodes_buffer_t},), buffer)
end
# Julia wrapper for header: p4est_mesh.h
# Automatically generated using Clang.jl


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
# Julia wrapper for header: p4est_search.h
# Automatically generated using Clang.jl


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
# Julia wrapper for header: p4est_vtk.h
# Automatically generated using Clang.jl


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

# Julia wrapper for header: p4est_io.h
# Generated manually
function p4est_deflate_quadrants(p4est, data)
  ccall((:p4est_deflate_quadrants, p4est_lib),
        Ptr{sc_array_t}, (Ptr{p4est_t}, Ptr{Ptr{sc_array_t}}), p4est, data)
end

function p4est_inflate(mpicomm, connectivity,
                       global_first_quadrant, pertree,
                       quadrants, data, user_pointer)
  ccall((:p4est_inflate, p4est_lib),
        Ptr{p4est_t},
        (MPI_Comm, Ptr{p4est_connectivity_t},
         Ptr{p4est_gloidx_t}, Ptr{p4est_gloidx_t},
         Ptr{sc_array_t}, Ptr{sc_array_t}, Ptr{Cvoid}),
        mpicomm, connectivity, global_first_quadrant, pertree, quadrants, data, user_pointer)
end

# Julia wrapper for header: p4est_communication.h
# Generated manually
# void p4est_comm_count_pertree (p4est_t * p4est,
#                                p4est_gloidx_t * pertree)
function p4est_comm_count_pertree(p4est, pertree)
  ccall((:p4est_comm_count_pertree, p4est_lib),
        Cvoid,
        (Ptr{p4est_t}, Ptr{p4est_gloidx_t}),
        p4est, pertree)
end

function p4est_comm_find_owner(p4est, which_tree, q, guess)
  ccall((:p4est_comm_find_owner, p4est_lib),
        Cint,
        (Ptr{p4est_t}, p4est_locidx_t, Ptr{p4est_quadrant_t}, Cint),
        p4est, which_tree, q, guess)
end
