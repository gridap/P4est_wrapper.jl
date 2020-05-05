using p4est_wrapper

struct point_t x::Cdouble; y::Cdouble; end

function my_refine( ::Ptr{p4est_t}, which_tree::p4est_topidx_t, quadrant::Ptr{p4est_quadrant_t})
    @assert which_tree == 0
    q = unsafe_load(quadrant)
    ((q.level == 0) || (q.level < 5 && p4est_quadrant_child_id(quadrant) == 1)) && return Cint(1)
    return Cint(0)
end

const my_refine_c = @cfunction(my_refine, Cint, (Ptr{p4est_t}, p4est_topidx_t, Ptr{p4est_quadrant_t}))

function search_point_fn(::Ptr{p4est_t}, ::p4est_topidx_t, ::Ptr{p4est_quadrant_t}, local_num::p4est_locidx_t, point::Ptr{Cvoid})
    @info local_num, unsafe_load(convert(Ptr{point_t}, point))
    return Cint(1)
end

const search_point_fn_c = @cfunction(search_point_fn, Cint, (Ptr{p4est_t}, p4est_topidx_t, Ptr{p4est_quadrant_t}, p4est_locidx_t, Ptr{Cvoid}))

p4est_conn = p4est_connectivity_new_unitsquare() 
@test p4est_conn != C_NULL
p4est_ = p4est_new(MPI.COMM_WORLD, p4est_conn, 0, C_NULL, C_NULL) 
@test p4est_ != C_NULL
p4est_refine(p4est_, 1, my_refine_c, C_NULL)
ptr_to_points_array = sc_array_new_count(sizeof(point_t), 2)
@test ptr_to_points_array != C_NULL
points_array = unsafe_load(ptr_to_points_array)
@test points_array.elem_count == 2 && points_array.elem_size == sizeof(point_t)
ptr_to_point = convert(Ptr{point_t},pointer(points_array.array))
@test ptr_to_point != C_NULL
unsafe_store!(ptr_to_point, point_t(0.24, 0.24), 1)
unsafe_store!(ptr_to_point, point_t(0.51, 0.256), 2)
p4est_search(p4est_, C_NULL, search_point_fn_c, ptr_to_points_array)  
p4est_vtk_write_file(p4est_, C_NULL, "my_step")
sc_array_destroy(ptr_to_points_array)
p4est_destroy(p4est_)
p4est_connectivity_destroy(p4est_conn)
