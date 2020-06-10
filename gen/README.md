# Generator

Automatically generate p4est wrappers using [Clang](https://github.com/JuliaInterop/Clang.jl) package.

## How to use it

User must manually export the relevant include directories as environment variables:

- P4EST_ROOT_DIR: p4est install root directory
- MPI_INCLUDE_DIR: MPI include directory

Then, environment should be ready to run the `generator.jl` as follows:

```
export P4EST_ROOT_DIR=/opt/p4est/2.2/
export MPI_INCLUDE_DIR=/usr/include/x86_64-linux-gnu/openmpi
julia --project=. -e '  using Pkg;
                        Pkg.instantiate();
                        include("generator.jl");'
```

This script generate the following files inside `src/bindings` starting at the project root directory:

- `sc_api.jl`
- `sc_common.jl`
- `p4est_api.jl`
- `p4est_common.jl`
- `p6est_api.jl`
- `p6est_common.jl`
- `p8est_api.jl`
- `p8est_common.jl`

in addition files `[api|common]_fixes.jl` were manually added inside `src` directory to fix some issues on the automatically generated sources.

## Julia files in 'gen' directory

- `generator.jl`: Script to generate `p4est_api.jl` and `p4est_common.jl` files.
- `headers.jl`: List of p4est header files to be wrapped.

## Julia files in 'src' directory

- `api_fixes.jl`: Some commented manual API fixes to the automatically generated bindings.
- `common_fixes.jl`: Some commented manual common data fixes to the automatically generated bindings.

## Julia files in 'src/bindings' directory

- `sc_api.jl`: Automatically generated sc API.
- `sc_common.jl`: Automatically generated sc common data.
- `p4est_api.jl`: Automatically generated p4est API.
- `p4est_common.jl`: Automatically generated p4est common data.
- `p6est_api.jl`: Automatically generated p6est API.
- `p6est_common.jl`: Automatically generated p6est common data.
- `p8est_api.jl`: Automatically generated p8est API.
- `p8est_common.jl`: Automatically generated p8est common data.

