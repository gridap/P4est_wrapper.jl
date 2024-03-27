
using MPI
using P4est_wrapper
using Test

# Initialize MPI if not initialized yet
if !MPI.Initialized()
    MPI.Init()
end

#############################################################################
# Definition of constants, data structures, functions and function callbacks
#############################################################################

## Global variable which is updated across calls to init_fn_callback_2d
current_quadrant_index = Cint(-1)
current_layer          = Cint(0)
previous_quadrant      = Ref{p4est_quadrant_t}() 

## Global variable which is updated across calls to refine_replace_callback_2d
num_calls = Cint(0)

# ## Better to use a C-enum. But I did not use it in order to keep the Julia
# ## version of this C example as simple as possible
const nothing_flag = Cint(0)
const refine_flag  = Cint(1)
const coarsen_flag = Cint(2)

function P6EST_COLUMN_GET_RANGE(q::Ptr{p4est_quadrant_t})
   f=q[].p.piggy3.local_num 
   l=f+q[].p.piggy3.which_tree
   (f,l)
end  


function p2est_quadrant_array_index(sc_array_object::sc_array_t, it)
    @assert sc_array_object.elem_size == sizeof(p2est_quadrant_t)
    @assert it in 0:sc_array_object.elem_count
    return Ptr{p2est_quadrant_t}(sc_array_object.array + sc_array_object.elem_size*it)
end

# # This C callback function is called once per cell. Here we are assuming
# # that p6est->user_pointer has been set prior to the first call to this call
# # back function to an array of ints with as many entries as cells. This call back function
# # initializes the p2est_quadrant->p.user_data void * pointer of all cells such that it
# # points to the corresponding entry in the global array mentioned in the previous sentence.
function init_fn_callback(forest_ptr::Ptr{p6est_t},
                          which_tree::p4est_topidx_t,
                          column_ptr::Ptr{p4est_quadrant_t},
                          layer_ptr::Ptr{p2est_quadrant_t})

 @assert which_tree == 0
 
 # Find index of column
 # Extract a reference to the first (and uniquely allowed) tree
 forest = forest_ptr[]
 columns = forest.columns[]
 tree = p4est_tree_array_index(columns.trees, 0)[]
 quadrant = column_ptr[]
 layer = layer_ptr[]

 if (current_quadrant_index==-1 || 
        p4est_quadrant_compare(previous_quadrant,column_ptr) != 0)

   global previous_quadrant = column_ptr
   global current_quadrant_index = current_quadrant_index+1
  
   q = p4est_quadrant_array_index(tree.quadrants, current_quadrant_index)
   
   println("current_quadrant_index=$(current_quadrant_index)")
   println("q.x=$(q[].x) q.y=$(q[].y)")
   println("column_ptr.x=$(column_ptr[].x) column_ptr.y=$(column_ptr[].y)")

   @assert p4est_quadrant_compare(q,column_ptr) == 0
   
   global current_layer = 0
 end

 q = p4est_quadrant_array_index(tree.quadrants, current_quadrant_index)
 
 user_data  = unsafe_wrap(Array, Ptr{Cint}(forest.user_pointer), current_quadrant_index+1)[current_quadrant_index+1]
 println("user_data=$(user_data)")

 println("q.x=$(q[].x) q.y=$(q[].y)")
 println("column.x=$(column_ptr[].x) column.y=$(column_ptr[].y)")
 println("current_layer=$(current_layer)")

 f,l=P6EST_COLUMN_GET_RANGE(column_ptr)
 println("column.f=$(f) column.l=$(l)")
 for i=f:l-1
  q2_ptr=p2est_quadrant_array_index(forest.layers[], i)
  unsafe_store!(Ptr{Cint}(q2_ptr[].p.user_data), user_data, 1)
  println(" i=$(i) ", Ptr{Cint}(layer_ptr[].p.user_data), " ", Ptr{Cint}(q2_ptr[].p.user_data), " z=$(q2_ptr[].z) level=$(q2_ptr[].z)")
 end 

 @assert p4est_quadrant_compare(q,column_ptr) == 0

 global current_layer=current_layer+1                             
 
 println("AAA $(current_quadrant_index+1)==$(tree.quadrants.elem_count)")
 println("BBB $(current_layer)==$(l-f)")



 if (current_quadrant_index+1==tree.quadrants.elem_count && current_layer==l-f)
  println("Aqui!!!")
  global current_quadrant_index = Cint(-1)
 end 

 return nothing
end 

const init_fn_callback_c = @cfunction(init_fn_callback, Cvoid, 
                             (Ptr{p6est_t}, p4est_topidx_t, Ptr{p4est_quadrant_t},Ptr{p2est_quadrant_t}))


#     /** Callback function prototype to decide whether to horizontally refine a
#     * column, i.e., horizontally refine all of the layers in the column.
#     * \return nonzero if the layer shall be refined.
#     */
# typedef int         (*p6est_refine_column_t) (p6est_t * p6est,
#                                                 p4est_topidx_t which_tree,
#                                                 p4est_quadrant_t * column); 

function refine_column_callback(p6est::Ptr{p6est_t},
                                which_tree::p4est_topidx_t,
                                column::Ptr{p4est_quadrant_t})
      forest=p6est[]
      f,l=P6EST_COLUMN_GET_RANGE(column)
      q2_ptr=p2est_quadrant_array_index(forest.layers[], f)
      Cint(unsafe_wrap(Array, Ptr{Cint}(q2_ptr[].p.user_data), 1)[] == refine_flag)
end 

const refine_column_fn_callback_c = @cfunction(refine_column_callback, Cint, 
                                    (Ptr{p6est_t}, p4est_topidx_t, Ptr{p4est_quadrant_t}))
                 
         
function refine_layer_callback(p6est::Ptr{p6est_t},
                       which_tree::p4est_topidx_t,
                       column::Ptr{p4est_quadrant_t},
                       layer::Ptr{p2est_quadrant_t})
    Cint(unsafe_wrap(Array, Ptr{Cint}(layer[].p.user_data), 1)[] == refine_flag) 
end    

const refine_layer_fn_callback_c = @cfunction(refine_layer_callback, Cint, 
                                    (Ptr{p6est_t}, p4est_topidx_t, Ptr{p4est_quadrant_t}, Ptr{p2est_quadrant_t}))
                          

# function refine_callback_2d(::Ptr{p8est_t},
#                             which_tree::p4est_topidx_t,
#                             quadrant_ptr::Ptr{p8est_quadrant_t})
#     @assert which_tree == 0
#     quadrant = quadrant_ptr[]
#     return Cint(unsafe_wrap(Array, Ptr{Cint}(quadrant.p.user_data),1)[] == refine_flag)
# end

# const refine_callback_2d_c = @cfunction(refine_callback_2d, Cint, (Ptr{p8est_t}, p4est_topidx_t, Ptr{p8est_quadrant_t}))

# ## Refine those cells with even identifier    (0,2,4,6,8,...)
# ## Leave untouched cells with odd identifier  (1,3,5,7,9,...)
# function allocate_and_set_refinement_and_coarsening_flags(forest_ptr::Ptr{p8est_t})
#     forest = forest_ptr[]
#     tree = p8est_tree_array_index(forest.trees, 0)[]
#     @assert tree.quadrants.elem_count == 1 || tree.quadrants.elem_count == 8
#     if (tree.quadrants.elem_count == 1)
#       return [refine_flag]
#     else
#       return [nothing_flag,
#        refine_flag,
#        nothing_flag,
#        nothing_flag,
#        nothing_flag,
#        nothing_flag,
#        nothing_flag,
#        nothing_flag]
#     end
#     # return [i != 1 ? nothing_flag : refine_flag for i = 1:tree.quadrants.elem_count]
# end

# function perform_single_mesh_adaptation_step(forest_ptr::Ptr{p8est_t})
#     user_data = allocate_and_set_refinement_and_coarsening_flags(forest_ptr)
#     p8est_reset_data(forest_ptr, Cint(sizeof(Cint)), init_fn_callback_2d_c, pointer(user_data))
#     p8est_refine_ext(forest_ptr, 0, -1, refine_callback_2d_c, C_NULL, C_NULL)
#     p8est_partition(forest_ptr, 1, C_NULL)
# end

## Refine those columns with even identifier    (0,2,4,6,8,...)
## Leave untouched columns with odd identifier  (1,3,5,7,9,...)
function allocate_and_set_columns_refinement_and_coarsening_flags(forest_ptr::Ptr{p6est_t})
    forest  = forest_ptr[]
    columns = forest.columns[]
    tree = p4est_tree_array_index(columns.trees, 0)[]
    flags = Vector{Cint}(undef,tree.quadrants.elem_count)
    flags .= nothing_flag 
    if (tree.quadrants.elem_count!=0)
      flags[1] = refine_flag 
    end
    return flags
    #return [i%2 == 0 ? nothing_flag : refine_flag for i = 1:tree.quadrants.elem_count]
end

p4est_corner_faces         = [0 2; 1 2; 0 3; 1 3]
p4est_corner_face_corners  = [0  -1 0 -1; -1 0 1 -1; 1 -1 -1  0; -1 1 -1 1]
function p4est_lnodes_decode(face_code, hanging_face)
    @assert face_code>=0
    if (face_code!=0)
      c = face_code & 0x03
      work = face_code >> 2
      hanging_face .= -1
      for i=0:1
        f = p4est_corner_faces[c+1,i+1]
        hanging_face[f+1] = (work & 0x01)!=0 ? p4est_corner_face_corners[c+1,f+1] : -1
        work >>= 1
      end
      return 1
    else
      return 0
    end
end

p8est_face_edges =
    [ 4 6  8 10 ;
      5 7  9 11 ;
      0 2  8  9 ;
      1 3 10 11 ;
      0 1  4  5 ;
      2 3  6  7 ]

function p6est_lnodes_decode(face_code,
                             hanging_face,
                             hanging_edge)
    @assert face_code >= 0
    if (face_code != 0)
        fc4  = face_code & 0x000f
        h    = Int16((face_code & 0x0010) >> 4)
        work = Int16(face_code >> 5)
        hanging_face .= -1
        hanging_edge .= -1
        p4est_lnodes_decode(fc4, hanging_face[3:end])
        for f=0:3
            hf = hanging_face[f + 3]
            w = work & 0x0001
            if (hf >= 0)
              hanging_edge[p8est_face_edges[f+3,3]+1] = 2 + hf
              hanging_edge[p8est_face_edges[f+3,4]+1] = 2 + hf
              hanging_edge[p8est_face_edges[f+3,1⊻hf+1]+1] = 4
              if (w!=0)
                hanging_edge[p8est_face_edges[f+3,3⊻h+1]+1] = 4
                hanging_edge[p8est_face_edges[f+3,1⊻hf+1]+1] = 4
                hanging_edge[p8est_face_edges[f+3,hf+1]+1] = 2+h
                hanging_face[f + 3] = (hf << 1) | h
              else
                hanging_face[f + 3] = 4 + hf
              end
            elseif (w!=0)
              hanging_edge[p8est_face_edges[f+3,3⊻h+1]+1] = 4;
              hanging_edge[p8est_face_edges[f+3,1]+1] =
                max(hanging_edge[p8est_face_edges[f+3,1]+1], 2+h);
              hanging_edge[p8est_face_edges[f+3,2]+1] =
                max(hanging_edge[p8est_face_edges[f+3,2]+1], 2+h);
              hanging_face[f + 3] = 6 + h;
            end       
            work >>= 1;
        end

        for e=0:3
           if ((work & 0x0001)!=0)
             if (hanging_edge[e+1] < 0)
                hanging_edge[e+1] = h
             else
                @assert (hanging_edge[e+1] == 2 + h || hanging_edge[e+1] == 4)
             end
           end
           work >>= 1; 
        end 
        return 1
    else
        return 0
    end
end 


# static inline int
# p6est_lnodes_decode (p6est_lnodes_code_t face_code, int hanging_face[6],
#                      int hanging_edge[12])
# {
#   P4EST_ASSERT (face_code >= 0);

#   if (face_code) {
#     /* we pack the p4est_lnodes_code_t at the bottom, followed by a bit
#      * indicating whether this layer is a first or second sibling, followed by
#      * four bits indicating which of the four side faces are layerwise
#      * nonconforming, followed by four bits indicating which of the four side
#      * edges are layerwise nonconforming */
#     p4est_lnodes_code_t fc4 = face_code & 0x000f;
#     int16_t             h = (face_code & 0x0010) >> 4;
#     int16_t             work = face_code >> 5;
#     int                 hf;
#     int                 f, e, w;

#     memset (hanging_face, -1, 6 * sizeof (int));
#     memset (hanging_edge, -1, 12 * sizeof (int));

#     /* the first two faces are the top and bottom faces, which we know are not
#      * hanging */
#     p4est_lnodes_decode (fc4, hanging_face + 2);
#     for (f = 0; f < 4; f++) {
#       hf = hanging_face[f + 2];
#       w = work & 0x0001;
#       if (hf >= 0) {
#         hanging_edge[p8est_face_edges[f + 2][2]] = 2 + hf;
#         hanging_edge[p8est_face_edges[f + 2][3]] = 2 + hf;
#         hanging_edge[p8est_face_edges[f + 2][1 ^ hf]] = 4;
#         if (w) {
#           hanging_edge[p8est_face_edges[f + 2][3 ^ h]] = 4;
#           hanging_edge[p8est_face_edges[f + 2][1 ^ hf]] = 4;
#           hanging_edge[p8est_face_edges[f + 2][hf]] = 2 + h;
#           hanging_face[f + 2] = (hf << 1) | h;
#         }
#         else {
#           hanging_face[f + 2] = 4 + hf;
#         }
#       }
#       else if (w) {
#         hanging_edge[p8est_face_edges[f + 2][3 ^ h]] = 4;
#         hanging_edge[p8est_face_edges[f + 2][0]] =
#           SC_MAX (hanging_edge[p8est_face_edges[f + 2][0]], 2 + h);
#         hanging_edge[p8est_face_edges[f + 2][1]] =
#           SC_MAX (hanging_edge[p8est_face_edges[f + 2][1]], 2 + h);
#         hanging_face[f + 2] = 6 + h;
#       }
#       work >>= 1;
#     }
#     for (e = 0; e < 4; e++) {
#       if (work & 0x0001) {
#         if (hanging_edge[e] < 0) {
#           hanging_edge[e] = h;
#         }
# #ifdef P4EST_ENABLE_DEBUG
#         else {
#           P4EST_ASSERT (hanging_edge[e] == 2 + h || hanging_edge[e] == 4);
#         }
# #endif
#       }
#       work >>= 1;
#     }
#     return 1;
#   }
#   else {
#     return 0;
#   }
# }

# #############################################################################
# # Main program
# #############################################################################

mpicomm = P4est_wrapper.P4EST_ENABLE_MPI ? MPI.COMM_WORLD : Cint(0)
sc_init(mpicomm, Cint(true), Cint(true), C_NULL, P4est_wrapper.SC_LP_VERBOSE)
p4est_init(C_NULL, P4est_wrapper.SC_LP_VERBOSE)

height = Vector{Cdouble}(undef,3)
height[1]=0.0
height[2]=0.0
height[3]=1.0

unitsquare_connectivity = p4est_connectivity_new_unitsquare()
extruded_unitsquare_connectivity = p6est_connectivity_new(unitsquare_connectivity,C_NULL,height)

unitsquare_forest_extruded = p6est_new_ext(mpicomm,
              extruded_unitsquare_connectivity,
              Cint(0), 
              Cint(1), # min_level 
              Cint(1), # min_zlevel
              Cint(1),                       # num_zroot
              Cint(0),                       # fill_uniform
              Cint(1),                       # data_size 
              C_NULL,                        # init_fn
              C_NULL)                        # user_pointer


function perform_single_mesh_adaptation_step(forest_ptr::Ptr{p6est_t}, step::Int)
    # user_data=allocate_and_set_columns_refinement_and_coarsening_flags(forest_ptr)
    # p6est_reset_data(forest_ptr, Cint(sizeof(Cint)), init_fn_callback_c, pointer(user_data))
    
    # p6est_refine_columns(forest_ptr, Cint(0), refine_column_fn_callback_c, C_NULL)
    # p6est_vtk_write_file(forest_ptr, string("refine_columns_step_", step))
    
    user_data=allocate_and_set_columns_refinement_and_coarsening_flags(forest_ptr)
    p6est_reset_data(forest_ptr, Cint(sizeof(Cint)), init_fn_callback_c, pointer(user_data))

    p6est_refine_layers(forest_ptr, Cint(0), refine_layer_fn_callback_c, C_NULL)
    p6est_vtk_write_file(forest_ptr, string("refine_layers_step_", step))
end

# p4est_refine_ext(forest_ptr, 0, -1, refine_callback_2d_c, C_NULL, refine_replace_callback_2d_c)
# p4est_coarsen(forest_ptr, 0, coarsen_callback_2d_c, C_NULL)
# p4est_partition(forest_ptr, 1, C_NULL)

perform_single_mesh_adaptation_step(unitsquare_forest_extruded,1)
#perform_single_mesh_adaptation_step(unitsquare_forest_extruded,2)
p6est_balance(unitsquare_forest_extruded, P4est_wrapper.P8EST_CONNECT_FULL, C_NULL)
p6est_partition(unitsquare_forest_extruded, C_NULL)

p6est_ghost=p6est_ghost_new(unitsquare_forest_extruded, P4est_wrapper.P4EST_CONNECT_FULL)

if (MPI.Comm_rank(MPI.COMM_WORLD)==0)
  proc_offsets = unsafe_wrap(Array, p6est_ghost[].proc_offsets, p6est_ghost[].mpisize+1)
  println(proc_offsets)

  global_first_layer = unsafe_wrap(Array, unitsquare_forest_extruded[].global_first_layer, unitsquare_forest_extruded[].mpisize+1)
  println(global_first_layer)


  ptr_ghost_quadrants = Ptr{p2est_quadrant_t}(p6est_ghost[].ghosts.array)

  for i=1:p6est_ghost[].mpisize
    for j=proc_offsets[i]:proc_offsets[i+1]-1
      quadrant       = ptr_ghost_quadrants[j+1]
      piggy3         = quadrant.p.piggy3
      println("$(i): ", piggy3.local_num+1)
    end
  end

end 

p6est_lnodes=p6est_lnodes_new(unitsquare_forest_extruded, p6est_ghost, Cint(2))

lnodes=p6est_lnodes[]
num_nonlocal_nodes=lnodes.num_local_nodes-lnodes.owned_count
nonlocal_nodes=unsafe_wrap(Array, lnodes.nonlocal_nodes,num_nonlocal_nodes)
global_owned_count=unsafe_wrap(Array, lnodes.global_owned_count, MPI.Comm_size(MPI.COMM_WORLD))
println(propertynames(lnodes))
println("num_local_nodes=$(lnodes.num_local_nodes)")
println("owned_count=$(lnodes.owned_count)")
println("num_nonlocal_nodes=$(num_nonlocal_nodes)")
println("nonlocal_nodes=$(nonlocal_nodes)")
println("global_owned_count=$(global_owned_count)")
println("global_offset=$(lnodes.global_offset)")

lnodes.num_local_elements
element_nodes = unsafe_wrap(Array, lnodes.element_nodes, lnodes.vnodes*lnodes.num_local_elements)
face_code     = unsafe_wrap(Array, lnodes.face_code, lnodes.num_local_elements)

println("face_code=$(face_code)")

hanging_face  = Vector{Cint}(undef,6)
hanging_edge  = Vector{Cint}(undef,12)

function f()

for cell=1:lnodes.num_local_elements
  # start=(cell-1)*lnodes.vnodes+1
  # println("cell=$(cell) faces=$(element_nodes[start:start+5])")
  # for lface in element_nodes[start:start+5]
  #   if (lface<lnodes.owned_count)
  #     println("lface=$(lface) gface=$(lnodes.global_offset+lface)")
  #   else
  #     println("lface=$(lface) gface=$(lnodes.global_offset+lface)")
  #   end
  # end
  # println("cell=$(cell) edges=$(element_nodes[start+6:start+17])")
  # println("cell=$(cell) corners=$(element_nodes[start+18:start+25])")
  has_hanging=p6est_lnodes_decode(face_code[cell],
                                  hanging_face,
                                  hanging_edge)
  if (has_hanging==1)
    println("cell=$(cell) has hanging faces")
    println("hanging_face=$(hanging_face)")
    println("hanging_edge=$(hanging_edge)")
  else
    println("cell=$(cell) does not have hanging faces")
  end
end

end 

#unitsquare_forest = p8est_new(mpicomm, unitsquare_connectivity, 0, C_NULL, C_NULL)
# perform_single_mesh_adaptation_step(unitsquare_forest)
# perform_single_mesh_adaptation_step(unitsquare_forest)
# p8est_vtk_write_file(unitsquare_forest, C_NULL, string("adapted_forest"))

# p8est_ghost=p8est_ghost_new(unitsquare_forest, P4est_wrapper.P8EST_CONNECT_FULL)

# p8est_lnodes=p8est_lnodes_new(unitsquare_forest, p8est_ghost, -3)
# lnodes=p8est_lnodes[]
# num_nonlocal_nodes=lnodes.num_local_nodes-lnodes.owned_count
# nonlocal_nodes=unsafe_wrap(Array, lnodes.nonlocal_nodes,num_nonlocal_nodes)
# global_owned_count=unsafe_wrap(Array, lnodes.global_owned_count, MPI.Comm_size(MPI.COMM_WORLD))
# println(propertynames(lnodes))
# println("num_local_nodes=$(lnodes.num_local_nodes)")
# println("owned_count=$(lnodes.owned_count)")
# println("num_nonlocal_nodes=$(num_nonlocal_nodes)")
# println("nonlocal_nodes=$(nonlocal_nodes)")
# println("global_owned_count=$(global_owned_count)")
# println("global_offset=$(lnodes.global_offset)")

# lnodes.num_local_elements
# element_nodes = unsafe_wrap(Array, lnodes.element_nodes, lnodes.vnodes*lnodes.num_local_elements)
# face_code     = unsafe_wrap(Array, lnodes.face_code, lnodes.num_local_elements)
# hanging_face  = Vector{Cint}(undef,6)
# hanging_edge  = Vector{Cint}(undef,12)

# for cell=1:lnodes.num_local_elements
#   start=(cell-1)*lnodes.vnodes+1
#   println("cell=$(cell) faces=$(element_nodes[start:start+5])")
#   for lface in element_nodes[start:start+5]
#     if (lface<lnodes.owned_count)
#       println("lface=$(lface) gface=$(lnodes.global_offset+lface)")
#     else
#       println("lface=$(lface) gface=$(lnodes.global_offset+lface)")
#     end
#   end
#   println("cell=$(cell) edges=$(element_nodes[start+6:start+17])")
#   println("cell=$(cell) corners=$(element_nodes[start+18:start+25])")
#   has_hanging=p8est_lnodes_decode(face_code[cell],
#                                   hanging_face,
#                                   hanging_edge)
#   if (has_hanging==1)
#     println("cell=$(cell) has hanging faces")
#     println("hanging_face=$(hanging_face)")
#     println("hanging_edge=$(hanging_edge)")
#   else
#     println("cell=$(cell) does not have hanging faces")
#   end
# end

f()



p8est_lnodes_destroy(p6est_lnodes)
p6est_ghost_destroy(p6est_ghost)
p6est_destroy(unitsquare_forest_extruded);
p4est_connectivity_destroy(unitsquare_connectivity)
# sc_finalize()


# # Finalize MPI if initialized and session is not interactive
# if (MPI.Initialized() && !isinteractive())
#     MPI.Finalize()
# end
