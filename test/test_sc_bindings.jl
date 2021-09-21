using MPI
using P4est_wrapper
using Test

el_num = Cint(8)
el_size = Cint(32)

# Initialize MPI if not initialized yet
if !MPI.Initialized()
    MPI.Init()
end

mpicomm = P4est_wrapper.P4EST_ENABLE_MPI ? MPI.COMM_WORLD : Cint(0)

# SC library initialization
sc_init(mpicomm, Cint(true), Cint(true), C_NULL, P4est_wrapper.SC_LP_DEFAULT)
@test typeof(sc_is_root()) == Cint

# SC package related API
id = sc_package_register(C_NULL, P4est_wrapper.SC_LP_INFO, "p4est", "A forest of octrees")
@test sc_package_is_registered(id) == 1
sc_package_lock(id)
sc_package_unlock(id)
sc_package_set_verbosity(id, P4est_wrapper.SC_LP_DEBUG)
sc_package_print_summary(id)

# SC memory allocation/deallocation related API
@test sc_memory_status(id) == 0 && sc_memory_check(id) == nothing
mem_ptr = sc_malloc(id, el_size)
@test sc_memory_status(id) == 1
mem_ptr = sc_realloc(id, mem_ptr, 2*el_size)
@test sc_memory_status(id) == 1
@test sc_free(id, mem_ptr) == nothing
@test sc_memory_status(id) == 0 && sc_memory_check(id) == nothing

@test sc_memory_status(id) == 0 && sc_memory_check(id) == nothing
mem_ptr = sc_calloc(id, el_num, el_size)
@test sc_memory_status(id) == 1
str_ptr = sc_strdup(id, "p4est")
@test sc_memory_status(id) == 2
@test sc_free(id, mem_ptr) == nothing
@test sc_free(id, Ptr{Cvoid}(str_ptr)) == nothing
@test sc_memory_status(id) == 0 && sc_memory_check(id) == nothing

# SC number comparison related API
@test sc_int_compare([Int(1)],        [Int(1)])     == 0
@test sc_int8_compare([Int8(2)],      [Int8(2)])    == 0
@test sc_int16_compare([Int16(3)],    [Int16(3)])   == 0
@test sc_int32_compare([Int32(4)],    [Int32(4)])   == 0
@test sc_int64_compare([Int64(5)],    [Int64(5)])   == 0
@test sc_double_compare([Float64(6)], [Float64(6)]) == 0

# SC_ARRAY related API
sc_array_ptr = sc_array_new(el_size)
@test sc_array_init(sc_array_ptr, el_size) == nothing
@test sc_array_memset(sc_array_ptr,0) == nothing
@test sc_array_reset(sc_array_ptr) == nothing
@test sc_array_truncate(sc_array_ptr) == nothing
@test sc_array_rewind(sc_array_ptr,2*el_num) == nothing
@test sc_array_resize(sc_array_ptr,2*el_num) == nothing
@test sc_array_destroy(sc_array_ptr) == nothing

sc_array_ptr = sc_array_new_count(el_size, el_num)
#@test sc_array_init_size(sc_array_ptr, el_size, el_num) == nothing
#@test sc_array_init_count(sc_array_ptr, el_size, el_num) == nothing
#sc_array_data_ptr = sc_array_new_data(sc_array_ptr, el_size, el_num)
#sc_array_view_ptr = sc_array_new_view(sc_array_ptr, 0, 0)
#@test sc_array_destroy(sc_array_data_ptr) == nothing
#@test sc_array_destroy(sc_array_view_ptr) == nothing
@test sc_array_destroy(sc_array_ptr) == nothing

# SC_MEMPOOL related API
sc_mempool_ptr = sc_mempool_new(el_size)
#@test sc_mempool_init(sc_mempool_ptr, el_size) == nothing
#@test sc_mempool_truncate(sc_mempool_ptr) == nothing
#@test sc_mempool_reset(sc_mempool_ptr) == nothing
#@test sc_mempool_destroy(sc_mempool_ptr) == nothing
#sc_mempool_ptr = sc_mempool_new_zero_and_persist(el_size)
@test sc_mempool_destroy(sc_mempool_ptr) == nothing

# SC library finalization
@test sc_package_unregister(id) == nothing
@test sc_finalize() == nothing

# Finalize MPI if initialized and session is not interactive
if (MPI.Initialized() && !isinteractive())
    MPI.Finalize()
end
