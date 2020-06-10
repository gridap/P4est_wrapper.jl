# p4est_wrapper

Julia wrappers for p4est library ([Parallel AMR on Forests of Octrees](http://www.p4est.org/))

[![Build Status](https://travis-ci.com/gridap/p4est_wrapper.jl.svg?branch=master)](https://travis-ci.com/gridap/p4est_wrapper.jl)
[![Codecov](https://codecov.io/gh/gridap/p4est_wrapper.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/gridap/p4est_wrapper.jl)


## Basic Usage

```julia
using MPI
using p4est_wrapper
using Test

sc_init(MPI.COMM_WORLD, Cint(true), Cint(true), C_NULL, p4est_wrapper.SC_LP_DEFAULT)
p4est_init(C_NULL, p4est_wrapper.SC_LP_DEFAULT)
unitsquare_connectivity = p4est_connectivity_new_unitsquare() 
unitsquare_forest = p4est_new(MPI.COMM_WORLD, unitsquare_connectivity, 0, C_NULL, C_NULL) 
...
p4est_destroy(unitsquare_forest)
p4est_connectivity_destroy(unitsquare_connectivity)
sc_finalize()

MPI.Finalize()
```


## Installation

**p4est_wrapper.jl** itself is installed when you add and use it into another project.

Please, ensure that your system fulfill the requirements.

To include into your project form Julia REPL, use the following commands:

```
pkg> add p4est_wrapper
julia> using p4est_wrapper
```

If, for any reason, you need to manually build the project, write down the following commands in Julia REPL:
```
pkg> add p4est_wrapper
pkg> build p4est_wrapper
julia> using p4est_wrapper
```

### Requirements

  - `p4est >= 2.2`
  - `MPI` 

`p4est_wrapper` julia package requires `p4est` library ([Parallel AMR on Forests of Octrees](http://www.p4est.org/)), and (optionally) `MPI` to work correctly. 
  - Latests versions of julia `MPI` use artifacts to locally install a MPI distribution. You should take care with the compatibility (version/vendor/distribution) between the parallel `p4est` and `MPI` libraries. If you want julia `MPI` library to wrap your local MPI library, you must export `JULIA_MPI_BINARY="system"` before installing the package.
  - Parallel `p4est` library can be manually installed in a custom path on your local machine. In order to succesfull describe your custom installation to be discovered by `p4est_wrapper`, you must export `P4EST_ROOT_DIR` environment variable pointing to the installation directory. If this environment variable is not available, and `julia >= 1.3`, `p4est_wrapper` will try to  use [`P4est_jll` artifact](https://github.com/JuliaBinaryWrappers/P4est_jll.jl), but you should take into account that this artifact is not for parallel computations (MPI not enabled). Finally, in other case `p4est_wrapper` will try to find the `p4est` library in the usual linux user library directory (`/usr/lib`).

#### Basic OpenMPIMPI installation in debian based systems

`MPI` can be obtained from the default repositories of your Debian-based OS by means of `apt` tool.

Basic `MPI` installation in order to use it from `p4est_wrapper` julia package is as follows:

```
apt-get update
apt-get openmpi-bin libpenmpi3 libopenmpi-dev
export JULIA_MPI_BINARY="system"
```

#### p4est 2.2 installation in linux based systems

To install `p4est` in your local machine, you can use the following shell script:

```
# Install p4est 2.2 from sources
CURR_DIR=$(pwd)
PACKAGE=p4est
VERSION=2.2
INSTALL_ROOT=/opt
P4EST_INSTALL=$INSTALL_ROOT/$PACKAGE/$VERSION
TAR_FILE=$PACKAGE-$VERSION.tar.gz
URL="https://github.com/p4est/p4est.github.io/raw/master/release"
ROOT_DIR=/tmp
SOURCES_DIR=$ROOT_DIR/$PACKAGE-$VERSION
BUILD_DIR=$SOURCES_DIR/build
wget -q $URL/$TAR_FILE -O $ROOT_DIR/$TAR_FILE
mkdir -p $SOURCES_DIR
tar xzf $ROOT_DIR/$TAR_FILE -C $SOURCES_DIR --strip-components=1
cd $SOURCES_DIR
./configure --prefix=$P4EST_INSTALL --without-blas --without-lapack --enable-mpi --disable-dependency-tracking
make --quiet
make --quiet install
rm -rf $ROOT_DIR/$TAR_FILE $SOURCES_DIR
export P4EST_ROOT_DIR=$P4EST_INSTALL
cd $CURR_DIR
```

Note: you need the following tools:
  - wget
  - tar
  - make

## Automated p4est wrapper generator

`p4est_wrapper` bindings are automatically generated by using [Clang](https://github.com/JuliaInterop/Clang.jl) package.

To learn more about how it works, please read the README file at [gen directory](https://github.com/gridap/p4est_wrapper.jl/tree/master/gen).


