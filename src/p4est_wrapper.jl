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

# Use library path from build process
const p4est_lib = P4EST_LIB

# Include wrappers from 
include(joinpath(@__DIR__, "..", "gen", "p4est_fixes.jl"))
include(joinpath(@__DIR__, "..", "gen", "p4est_common.jl"))
include(joinpath(@__DIR__, "..", "gen", "p4est_api.jl"))

################################################################
# Export everything
################################################################
foreach(names(@__MODULE__, all=true)) do s
    if startswith(string(s), "sc") || startswith(string(s), "p4est") || startswith(string(s), "p6est") || startswith(string(s), "p8est") 
        @eval export $s
    end
end

end # module
