################################################################
# Original generator script found at:
# https://github.com/JuliaInterop/Clang.jl#build-a-custom-c-bindings-generator
################################################################
using Clang

################################################################
# Load p4est header filenames
################################################################
headers_file = "headers.jl"
if !isfile(headers_file) 
    error("Headers file (\"headers.jl\") was not found.")
end
include(headers_file)

################################################################
# User define p4est and MPI include paths
################################################################
P4EST_ROOT_DIR  = haskey(ENV,"P4EST_ROOT_DIR") ? ENV["P4EST_ROOT_DIR"] : "/usr"
MPI_INCLUDE_DIR = haskey(ENV,"MPI_INCLUDE_DIR") ? ENV["MPI_INCLUDE_DIR"] : "/usr/include/x86_64-linux-gnu/openmpi"

################################################################
# Define files and variables according to main file at ../src
################################################################
const P4EST_LIBNAME     = "p4est_lib"
const P4EST_API_FILE    = "p4est_api.jl"
const P4EST_COMMON_FILE = "p4est_common.jl"

################################################################
# Build absolute paths
################################################################
const P4EST_INCLUDE     = joinpath(dirname(P4EST_ROOT_DIR), "include") |> normpath
const P4EST_HEADERS     = [joinpath(P4EST_INCLUDE, header) for header in HEADER_FILES if endswith(header, ".h")]
const MPI_INCLUDES      = [MPI_INCLUDE_DIR]

################################################################
# Wrap p4est
# Loop on all included files and generate 2 julia files:
#   - P4EST_API_FILE: p4est functions wrapper
#   - P4EST_COMMON_FILE: p4est data wrapper
################################################################
# create a work context
ctx = DefaultContext()

# parse headers
parse_headers!(ctx, P4EST_HEADERS, includes=vcat(MPI_INCLUDES, P4EST_INCLUDE))

# settings
ctx.libname = P4EST_LIBNAME
ctx.options["is_function_strictly_typed"] = false
ctx.options["is_struct_mutable"] = false

# write output
api_file = joinpath(@__DIR__, P4EST_API_FILE)
api_stream = open(api_file, "w")

for trans_unit in ctx.trans_units
    root_cursor = getcursor(trans_unit)
    push!(ctx.cursor_stack, root_cursor)
    header = spelling(root_cursor)
    @info "+ Wrapping header: $header ..."
    # loop over all of the child cursors and wrap them, if appropriate.
    ctx.children = children(root_cursor)
    for (i, child) in enumerate(ctx.children)
        child_name = name(child)
        child_header = filename(child)
        ctx.children_index = i
        # choose which cursor to wrap
        startswith(child_name, "__") && continue  # skip compiler definitions
        child_name in keys(ctx.common_buffer) && continue  # already wrapped
        child_header != header && continue  # skip if cursor filename is not in the headers to be wrapped
        isinlined(child) && continue # skip inlined functions (static inline procedures are not in library ABI)
        child_name == "sc_array" && continue # struct member types are wrong (CInt -> Csint_t)
        @info "  | $child_name"
        wrap!(ctx, child)
    end
    @info "Writing $(api_file)"
    println(api_stream, "# Julia wrapper for header: $(basename(header))")
    println(api_stream, "# Automatically generated using Clang.jl\n")
    print_buffer(api_stream, ctx.api_buffer)
    empty!(ctx.api_buffer)  # clean up api_buffer for the next header
end
close(api_stream)

# write "common" definitions: types, typealiases, etc.
common_file = joinpath(@__DIR__, P4EST_COMMON_FILE)
@info "Writing $(common_file)"
open(common_file, "w") do f
    println(f, "# Automatically generated using Clang.jl\n")
    print_buffer(f, dump_to_buffer(ctx.common_buffer))
end

################################################################
# Generate default main file at ../src
################################################################
# uncomment the following code to generate dependency and template files
# copydeps(dirname(api_file))
# print_template(joinpath(dirname(api_file), "LibTemplate.jl"))
