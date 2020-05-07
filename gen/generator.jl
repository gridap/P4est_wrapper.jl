
module wrapper
    ################################################################
    # Original generator script found at:
    # https://github.com/JuliaInterop/Clang.jl#build-a-custom-c-bindings-generator
    ################################################################
    using Clang

    ################################################################
    # Wraper generator
    # Loop on all headerfiles files and generate 2 julia files:
    #   - API_FILE: functions wrapper
    #   - COMMON_FILE: data wrapper
    ################################################################
    function generate(headers, includes, libname, apifile, commonfile, ignore)
        # create a work context
        ctx = DefaultContext()

        # parse headers
        parse_headers!(ctx, headers, includes=includes)

        # settings
        ctx.libname = libname
        ctx.options["is_function_strictly_typed"] = false
        ctx.options["is_struct_mutable"] = false

        # write output
        api_file = joinpath(@__DIR__, apifile)
        api_stream = open(api_file, "w")

        let api_buffer = Array{Expr}(undef,0)

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
                    child_name in keys(ctx.api_buffer) && continue  # already wrapped
                    child_header != header && continue  # skip if cursor filename is not in the headers to be wrapped
                    isinlined(child) && continue # skip inlined functions (static inline procedures are not in library ABI)
                    child_name in ignore && continue # explicitly ignore structs/functions
                    @info "  | + $child_name"
                    wrap!(ctx, child)
                end
                # Remove duplicated Expr already present in a different header
                @info "- Removing duplicates from: $header ..."
                for (i,element) in enumerate(ctx.api_buffer)
                    if element in api_buffer
                        name = string(element.args[1])
                        @info "  | - $name"
                        deleteat!(ctx.api_buffer, i)
                    end
                end
                api_buffer = vcat(api_buffer,ctx.api_buffer)
                # Write down context api_buffer
                @info "Writing $(api_file)"
                println(api_stream, "# Julia wrapper for header: $(basename(header))")
                println(api_stream, "# Automatically generated using Clang.jl\n")
                print_buffer(api_stream, ctx.api_buffer)
                empty!(ctx.api_buffer)  # clean up api_buffer for the next header
            end
            empty!(api_buffer)
            close(api_stream)
        end

        # write "common" definitions: types, typealiases, etc.
        common_file = joinpath(@__DIR__, commonfile)
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

    end

end

################################################################
# Load sc/p4est header filenames
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
# Build absolute paths
################################################################
const P4EST_INCLUDE     = joinpath(dirname(P4EST_ROOT_DIR), "include") |> normpath
const SC_HEADERS        = [joinpath(P4EST_INCLUDE, header) for header in SC_HEADER_FILES if endswith(header, ".h")]
const P4EST_HEADERS     = [joinpath(P4EST_INCLUDE, header) for header in PXEST_HEADER_FILES if endswith(header, ".h")]
const MPI_INCLUDES      = [MPI_INCLUDE_DIR]

################################################################
# Explicitly ignore some structs/functions during automatic generation
################################################################
const SC_IGNORE         = ["sc_array"]
const P4EST_IGNORE      = ["sc_extern_c_hack_3()", "sc_extern_c_hack_4()"]

################################################################
# Generate API and COMMON files
################################################################
includes = vcat(MPI_INCLUDES, P4EST_INCLUDE)
wrapper.generate(SC_HEADERS, includes, "p4est_lib", "sc_api.jl", "sc_common.jl", SC_IGNORE)
wrapper.generate(P4EST_HEADERS, includes, "p4est_lib", "p4est_api.jl", "p4est_common.jl", P4EST_IGNORE)

