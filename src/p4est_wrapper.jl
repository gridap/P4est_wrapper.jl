module p4est_wrapper

################################################################
# Check correct installation
################################################################
# Load in `deps.jl`, complaining if it does not exist
const depsjl_path = joinpath(@__DIR__, "..", "deps", "deps.jl")
if !isfile(depsjl_path)
    error("p4est_wrapper was not build properly. Please run Pkg.build(\"p4est.jl\").")
end
include(depsjl_path)
# Check if p4est library was found
if(!P4EST_FOUND)
    error("p4est_wrapper was not build properly. Please run Pkg.build(\"p4est.jl\").")
end

# Use library path from build process
const p4est_lib = P4EST_LIB

################################################################
# Use dependencies 
################################################################
using Libdl
using MPI
using CEnum

################################################################
# Include p4est wrappers
################################################################
include("ctypes.jl")
export Ctm, Ctime_t, Cclock_t

# Include P4EST bindings

# The following file fix and/or complete 
# the automated generation of types and data structures
include(joinpath(@__DIR__, "common_fixes.jl"))

# The following bindings are automatically generated.
# Read more info in gen/README.md
bindings_dir = joinpath(@__DIR__, "bindings")
include(joinpath(bindings_dir, "sc_common.jl"))
include(joinpath(bindings_dir, "sc_api.jl"))
include(joinpath(bindings_dir, "p4est_common.jl"))
include(joinpath(bindings_dir, "p4est_api.jl"))
include(joinpath(bindings_dir, "p8est_common.jl"))
include(joinpath(bindings_dir, "p8est_api.jl"))
include(joinpath(bindings_dir, "p6est_common.jl"))
include(joinpath(bindings_dir, "p6est_api.jl"))

# The following file fix and/or complete
# the automated generation of functions
include(joinpath(@__DIR__, "api_fixes.jl"))

################################################################
# Export everything starting with ...
################################################################
foreach(names(@__MODULE__, all=true)) do s
    if startswith(string(s), "sc") || startswith(string(s), "p4est") || startswith(string(s), "p6est") || startswith(string(s), "p8est") 
        @eval export $s
    end
end

end # module
