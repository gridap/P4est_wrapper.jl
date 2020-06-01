using MPI
using p4est_wrapper
using Test

el_num = Cint(8)
el_size = Cint(32)

# Initialize MPI if not initialized yet
if !MPI.Initialized()
    MPI.Init()
end

# SC library initialization
sc_init(MPI.COMM_WORLD, Cint(true), Cint(true), C_NULL, p4est_wrapper.SC_LP_DEFAULT)
@test sc_is_root() ==  (MPI.Comm_rank(MPI.COMM_WORLD) == 0 ? 1 : 0)

# SC package related API
id = sc_package_register(C_NULL, p4est_wrapper.SC_LP_INFO, "p4est", "A forest of octrees")
@test sc_package_is_registered(id) == 1
sc_package_lock(id)
sc_package_unlock(id)
sc_package_set_verbosity(id, p4est_wrapper.SC_LP_DEBUG)
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

# SC library finalization
@test sc_package_unregister(id) == nothing
@test sc_finalize() == nothing

# Finalize MPI if initialized and session is not interactive
if (MPI.Initialized() && !isinteractive())
    MPI.Finalize()
end


