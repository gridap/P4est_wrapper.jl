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

This script generate the following files inside `bindings` directory:

- `sc_api.jl`
- `sc_common.jl`
- `p4est_api.jl`
- `p4est_common.jl`

in addition file `fixes.jl` was manually added to fix some issues on the automatically generated sources.

## Julia files in 'gen' directory

- `generator.jl`: Script to generate `p4est_api.jl` and `p4est_common.jl` files.
- `headers.jl`: List of p4est header files to be wrapped.

## Julia files in 'gen/bindings' directory

- `fixes.jl`: Some commented manual fixes.
- `p4est_api.jl`: Automatically generated p4est API.
- `p4est_common.jl`: Automatically generated p4est common data.
- `sc_api.jl`: Automatically generated sc API.
- `sc_common.jl`: Automatically generated sc common data.

