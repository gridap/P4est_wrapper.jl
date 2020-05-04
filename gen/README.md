# Generator

Automatically generate p4est wrappers using [Clang](https://github.com/JuliaInterop/Clang.jl) package.

## How to use it

User must manually export the relevant include directories. 
    - P4EST_ROOT_DIR: p4est install root directory
    - MPI_INCLUDE_DIR: MPI include directory

Then, environment should be ready to run the `generator.jl` as follows:

```
export P4EST_ROOT_DIR=/opt/p4est/2.2/
export MPI_INCLUDE_DIR=/usr/include/x86_64-linux-gnu/openmpi
julia --project=. -e '  using Pkg;
                        Pkg.develop(PackageSpec(path=pwd()));
                        Pkg.instantiate();
                        include("generator.jl");'
```

This script generate `p4est_api.jl` and `p4est_common.jl` files.

## Julia files in this directory

- `generator.jl`: Script to generate `p4est_api.jl` and `p4est_common.jl` files.
- `headers.jl`: List of p4est header files to be wrapped.
- `p4est_api.jl`: Automatically generated p4est API.
- `p4est_common.jl`: Automatically generated p4est common data.
- `p4est_fixes.jl`: Some manual fixes to the automatic generated files.
