################################################################
# List of headers to be automatically wrapped
# HEADER_FILES will be used by generator.jl
################################################################

const P4EST_HEADER_FILES = [
    "p4est.h", 
    "p4est_bits.h", 
    "p4est_connectivity.h",  
    "p4est_extended.h", 
    "p4est_geometry.h", 
    "p4est_ghost.h", 
    "p4est_iterate.h",  
    "p4est_lnodes.h",
    "p4est_mesh.h", 
    "p4est_search.h", 
    "p4est_vtk.h"]

const P6EST_HEADER_FILES = [
    "p6est.h", 
    "p6est_extended.h", 
    "p6est_ghost.h"]

const P8EST_HEADER_FILES = [
    "p8est.h", 
    "p8est_bits.h", 
    "p8est_connectivity.h",  
    "p8est_extended.h", 
    "p8est_geometry.h", 
    "p8est_ghost.h", 
    "p8est_iterate.h",  
    "p8est_lnodes.h",
    "p8est_mesh.h", 
    "p8est_search.h", 
    "p8est_vtk.h"]

const PXEST_HEADER_FILES = vcat(P4EST_HEADER_FILES,P6EST_HEADER_FILES,P8EST_HEADER_FILES)

const SC_HEADER_FILES = [
    "sc.h",
    "sc_containers.h",
    "sc_io.h"]


