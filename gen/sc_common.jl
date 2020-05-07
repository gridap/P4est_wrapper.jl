# Automatically generated using Clang.jl


# Skipping MacroDefinition: SC_CALC_VERSION ( major , minor , patchlevel ) ( ( ( major ) * 1000 + ( minor ) ) * 1000 + ( patchlevel ) )
# Skipping MacroDefinition: SC_GCC_VERSION SC_CALC_VERSION ( __GNUC__ , __GNUC_MINOR__ , __GNUC_PATCHLEVEL__ )
# Skipping MacroDefinition: SC_EXTERN_C_BEGIN void sc_extern_c_hack_3 ( void )
# Skipping MacroDefinition: SC_EXTERN_C_END void sc_extern_c_hack_4 ( void )

const SC_EPS = 2.220446049250313e-16
const SC_1000_EPS = "1000.*2.220446049250313e-16"

# Skipping MacroDefinition: SC_NOOP ( ) ( ( void ) ( 0 ) )
# Skipping MacroDefinition: SC_ABORT ( s ) sc_abort_verbose ( __FILE__ , __LINE__ , ( s ) )
# Skipping MacroDefinition: SC_ABORT_NOT_REACHED ( ) SC_ABORT ( "Unreachable code" )
# Skipping MacroDefinition: SC_CHECK_ABORT ( q , s ) ( ( q ) ? ( void ) 0 : SC_ABORT ( s ) )
# Skipping MacroDefinition: SC_CHECK_MPI ( r ) SC_CHECK_ABORT ( ( r ) == sc_MPI_SUCCESS , "MPI error" )
# Skipping MacroDefinition: SC_CHECK_ZLIB ( r ) SC_CHECK_ABORT ( ( r ) == Z_OK , "zlib error" )
# Skipping MacroDefinition: SC_ABORTF ( fmt , ... ) sc_abort_verbosef ( __FILE__ , __LINE__ , ( fmt ) , __VA_ARGS__ )
# Skipping MacroDefinition: SC_CHECK_ABORTF ( q , fmt , ... ) ( ( q ) ? ( void ) 0 : SC_ABORTF ( fmt , __VA_ARGS__ ) )
# Skipping MacroDefinition: SC_ABORT1 ( fmt , a ) sc_abort_verbosef ( __FILE__ , __LINE__ , ( fmt ) , ( a ) )
# Skipping MacroDefinition: SC_ABORT2 ( fmt , a , b ) sc_abort_verbosef ( __FILE__ , __LINE__ , ( fmt ) , ( a ) , ( b ) )
# Skipping MacroDefinition: SC_ABORT3 ( fmt , a , b , c ) sc_abort_verbosef ( __FILE__ , __LINE__ , ( fmt ) , ( a ) , ( b ) , ( c ) )
# Skipping MacroDefinition: SC_ABORT4 ( fmt , a , b , c , d ) sc_abort_verbosef ( __FILE__ , __LINE__ , ( fmt ) , ( a ) , ( b ) , ( c ) , ( d ) )
# Skipping MacroDefinition: SC_ABORT5 ( fmt , a , b , c , d , e ) sc_abort_verbosef ( __FILE__ , __LINE__ , ( fmt ) , ( a ) , ( b ) , ( c ) , ( d ) , ( e ) )
# Skipping MacroDefinition: SC_ABORT6 ( fmt , a , b , c , d , e , f ) sc_abort_verbosef ( __FILE__ , __LINE__ , ( fmt ) , ( a ) , ( b ) , ( c ) , ( d ) , ( e ) , ( f ) )
# Skipping MacroDefinition: SC_CHECK_ABORT1 ( q , fmt , a ) ( ( q ) ? ( void ) 0 : SC_ABORT1 ( ( fmt ) , ( a ) ) )
# Skipping MacroDefinition: SC_CHECK_ABORT2 ( q , fmt , a , b ) ( ( q ) ? ( void ) 0 : SC_ABORT2 ( ( fmt ) , ( a ) , ( b ) ) )
# Skipping MacroDefinition: SC_CHECK_ABORT3 ( q , fmt , a , b , c ) ( ( q ) ? ( void ) 0 : SC_ABORT3 ( ( fmt ) , ( a ) , ( b ) , ( c ) ) )
# Skipping MacroDefinition: SC_CHECK_ABORT4 ( q , fmt , a , b , c , d ) ( ( q ) ? ( void ) 0 : SC_ABORT4 ( ( fmt ) , ( a ) , ( b ) , ( c ) , ( d ) ) )
# Skipping MacroDefinition: SC_CHECK_ABORT5 ( q , fmt , a , b , c , d , e ) ( ( q ) ? ( void ) 0 : SC_ABORT5 ( ( fmt ) , ( a ) , ( b ) , ( c ) , ( d ) , ( e ) ) )
# Skipping MacroDefinition: SC_CHECK_ABORT6 ( q , fmt , a , b , c , d , e , f ) ( ( q ) ? ( void ) 0 : SC_ABORT6 ( ( fmt ) , ( a ) , ( b ) , ( c ) , ( d ) , ( e ) , ( f ) ) )
# Skipping MacroDefinition: SC_ASSERT ( c ) SC_NOOP ( )
# Skipping MacroDefinition: SC_EXECUTE_ASSERT_FALSE ( expression ) do { ( void ) ( expression ) ; } while ( 0 )
# Skipping MacroDefinition: SC_EXECUTE_ASSERT_TRUE ( expression ) do { ( void ) ( expression ) ; } while ( 0 )
# Skipping MacroDefinition: SC_ALLOC ( t , n ) ( t * ) sc_malloc ( sc_package_id , ( n ) * sizeof ( t ) )
# Skipping MacroDefinition: SC_ALLOC_ZERO ( t , n ) ( t * ) sc_calloc ( sc_package_id , ( size_t ) ( n ) , sizeof ( t ) )
# Skipping MacroDefinition: SC_REALLOC ( p , t , n ) ( t * ) sc_realloc ( sc_package_id , ( p ) , ( n ) * sizeof ( t ) )
# Skipping MacroDefinition: SC_STRDUP ( s ) sc_strdup ( sc_package_id , ( s ) )
# Skipping MacroDefinition: SC_FREE ( p ) sc_free ( sc_package_id , ( p ) )
# Skipping MacroDefinition: SC_ALIGN_UP ( x , n ) ( ( ( n ) <= 0 ) ? ( x ) : ( ( x ) + ( n ) - 1 ) / ( n ) * ( n ) )
# Skipping MacroDefinition: SC_ARG_ALIGN ( p , t , n ) SC_NOOP ( )
# Skipping MacroDefinition: SC_ATTR_ALIGN ( n ) __attribute__ ( ( aligned ( n ) ) )
# Skipping MacroDefinition: SC_BZERO ( p , n ) ( ( void ) memset ( ( p ) , 0 , ( n ) * sizeof ( * ( p ) ) ) )
# Skipping MacroDefinition: SC_MIN ( a , b ) ( ( ( a ) < ( b ) ) ? ( a ) : ( b ) )
# Skipping MacroDefinition: SC_MAX ( a , b ) ( ( ( a ) > ( b ) ) ? ( a ) : ( b ) )
# Skipping MacroDefinition: SC_SQR ( a ) ( ( a ) * ( a ) )
# Skipping MacroDefinition: SC_LOG2_8 ( x ) ( sc_log2_lookup_table [ ( x ) ] )
# Skipping MacroDefinition: SC_LOG2_16 ( x ) ( ( ( x ) > 0xff ) ? ( SC_LOG2_8 ( ( x ) >> 8 ) + 8 ) : SC_LOG2_8 ( x ) )
# Skipping MacroDefinition: SC_LOG2_32 ( x ) ( ( ( x ) > 0xffff ) ? ( SC_LOG2_16 ( ( x ) >> 16 ) ) + 16 : SC_LOG2_16 ( x ) )
# Skipping MacroDefinition: SC_LOG2_64 ( x ) ( ( ( x ) > 0xffffffffLL ) ? ( SC_LOG2_32 ( ( x ) >> 32 ) ) + 32 : SC_LOG2_32 ( x ) )
# Skipping MacroDefinition: SC_ROUNDUP2_32 ( x ) ( ( ( x ) <= 0 ) ? 0 : ( 1 << ( SC_LOG2_32 ( ( x ) - 1 ) + 1 ) ) )
# Skipping MacroDefinition: SC_ROUNDUP2_64 ( x ) ( ( ( x ) <= 0 ) ? 0 : ( 1LL << ( SC_LOG2_64 ( ( x ) - 1LL ) + 1 ) ) )

const SC_LC_GLOBAL = 1
const SC_LC_NORMAL = 2
const SC_LP_DEFAULT = -1
const SC_LP_ALWAYS = 0
const SC_LP_TRACE = 1
const SC_LP_DEBUG = 2
const SC_LP_VERBOSE = 3
const SC_LP_INFO = 4
const SC_LP_STATISTICS = 5
const SC_LP_PRODUCTION = 6
const SC_LP_ESSENTIAL = 7
const SC_LP_ERROR = 8
const SC_LP_SILENT = 9
const SC_LP_THRESHOLD = SC_LP_INFO

# Skipping MacroDefinition: SC_GEN_LOG ( package , category , priority , s ) ( ( priority ) < SC_LP_THRESHOLD ? ( void ) 0 : sc_log ( __FILE__ , __LINE__ , ( package ) , ( category ) , ( priority ) , ( s ) ) )
# Skipping MacroDefinition: SC_GLOBAL_LOG ( p , s ) SC_GEN_LOG ( sc_package_id , SC_LC_GLOBAL , ( p ) , ( s ) )
# Skipping MacroDefinition: SC_LOG ( p , s ) SC_GEN_LOG ( sc_package_id , SC_LC_NORMAL , ( p ) , ( s ) )
# Skipping MacroDefinition: SC_GEN_LOGF ( package , category , priority , fmt , ... ) ( ( priority ) < SC_LP_THRESHOLD ? ( void ) 0 : sc_logf ( __FILE__ , __LINE__ , ( package ) , ( category ) , ( priority ) , ( fmt ) , __VA_ARGS__ ) )
# Skipping MacroDefinition: SC_GLOBAL_LOGF ( p , fmt , ... ) SC_GEN_LOGF ( sc_package_id , SC_LC_GLOBAL , ( p ) , ( fmt ) , __VA_ARGS__ )
# Skipping MacroDefinition: SC_LOGF ( p , fmt , ... ) SC_GEN_LOGF ( sc_package_id , SC_LC_NORMAL , ( p ) , ( fmt ) , __VA_ARGS__ )
# Skipping MacroDefinition: SC_GLOBAL_TRACE ( s ) SC_GLOBAL_LOG ( SC_LP_TRACE , ( s ) )
# Skipping MacroDefinition: SC_GLOBAL_LDEBUG ( s ) SC_GLOBAL_LOG ( SC_LP_DEBUG , ( s ) )
# Skipping MacroDefinition: SC_GLOBAL_VERBOSE ( s ) SC_GLOBAL_LOG ( SC_LP_VERBOSE , ( s ) )
# Skipping MacroDefinition: SC_GLOBAL_INFO ( s ) SC_GLOBAL_LOG ( SC_LP_INFO , ( s ) )
# Skipping MacroDefinition: SC_GLOBAL_STATISTICS ( s ) SC_GLOBAL_LOG ( SC_LP_STATISTICS , ( s ) )
# Skipping MacroDefinition: SC_GLOBAL_PRODUCTION ( s ) SC_GLOBAL_LOG ( SC_LP_PRODUCTION , ( s ) )
# Skipping MacroDefinition: SC_GLOBAL_LERROR ( s ) SC_GLOBAL_LOG ( SC_LP_ERROR , ( s ) )
# Skipping MacroDefinition: SC_GLOBAL_TRACEF ( fmt , ... ) SC_GLOBAL_LOGF ( SC_LP_TRACE , ( fmt ) , __VA_ARGS__ )
# Skipping MacroDefinition: SC_GLOBAL_LDEBUGF ( fmt , ... ) SC_GLOBAL_LOGF ( SC_LP_DEBUG , ( fmt ) , __VA_ARGS__ )
# Skipping MacroDefinition: SC_GLOBAL_VERBOSEF ( fmt , ... ) SC_GLOBAL_LOGF ( SC_LP_VERBOSE , ( fmt ) , __VA_ARGS__ )
# Skipping MacroDefinition: SC_GLOBAL_INFOF ( fmt , ... ) SC_GLOBAL_LOGF ( SC_LP_INFO , ( fmt ) , __VA_ARGS__ )
# Skipping MacroDefinition: SC_GLOBAL_STATISTICSF ( fmt , ... ) SC_GLOBAL_LOGF ( SC_LP_STATISTICS , ( fmt ) , __VA_ARGS__ )
# Skipping MacroDefinition: SC_GLOBAL_PRODUCTIONF ( fmt , ... ) SC_GLOBAL_LOGF ( SC_LP_PRODUCTION , ( fmt ) , __VA_ARGS__ )
# Skipping MacroDefinition: SC_GLOBAL_ESSENTIALF ( fmt , ... ) SC_GLOBAL_LOGF ( SC_LP_ESSENTIAL , ( fmt ) , __VA_ARGS__ )
# Skipping MacroDefinition: SC_GLOBAL_LERRORF ( fmt , ... ) SC_GLOBAL_LOGF ( SC_LP_ERROR , ( fmt ) , __VA_ARGS__ )
# Skipping MacroDefinition: SC_TRACE ( s ) SC_LOG ( SC_LP_TRACE , ( s ) )
# Skipping MacroDefinition: SC_LDEBUG ( s ) SC_LOG ( SC_LP_DEBUG , ( s ) )
# Skipping MacroDefinition: SC_VERBOSE ( s ) SC_LOG ( SC_LP_VERBOSE , ( s ) )
# Skipping MacroDefinition: SC_INFO ( s ) SC_LOG ( SC_LP_INFO , ( s ) )
# Skipping MacroDefinition: SC_STATISTICS ( s ) SC_LOG ( SC_LP_STATISTICS , ( s ) )
# Skipping MacroDefinition: SC_PRODUCTION ( s ) SC_LOG ( SC_LP_PRODUCTION , ( s ) )
# Skipping MacroDefinition: SC_ESSENTIAL ( s ) SC_LOG ( SC_LP_ESSENTIAL , ( s ) )
# Skipping MacroDefinition: SC_LERROR ( s ) SC_LOG ( SC_LP_ERROR , ( s ) )
# Skipping MacroDefinition: SC_TRACEF ( fmt , ... ) SC_LOGF ( SC_LP_TRACE , ( fmt ) , __VA_ARGS__ )
# Skipping MacroDefinition: SC_LDEBUGF ( fmt , ... ) SC_LOGF ( SC_LP_DEBUG , ( fmt ) , __VA_ARGS__ )
# Skipping MacroDefinition: SC_VERBOSEF ( fmt , ... ) SC_LOGF ( SC_LP_VERBOSE , ( fmt ) , __VA_ARGS__ )
# Skipping MacroDefinition: SC_INFOF ( fmt , ... ) SC_LOGF ( SC_LP_INFO , ( fmt ) , __VA_ARGS__ )
# Skipping MacroDefinition: SC_STATISTICSF ( fmt , ... ) SC_LOGF ( SC_LP_STATISTICS , ( fmt ) , __VA_ARGS__ )
# Skipping MacroDefinition: SC_PRODUCTIONF ( fmt , ... ) SC_LOGF ( SC_LP_PRODUCTION , ( fmt ) , __VA_ARGS__ )
# Skipping MacroDefinition: SC_ESSENTIALF ( fmt , ... ) SC_LOGF ( SC_LP_ESSENTIAL , ( fmt ) , __VA_ARGS__ )
# Skipping MacroDefinition: SC_LERRORF ( fmt , ... ) SC_LOGF ( SC_LP_ERROR , ( fmt ) , __VA_ARGS__ )

const sc_handler_t = Ptr{Cvoid}
const sc_log_handler_t = Ptr{Cvoid}
const sc_abort_handler_t = Ptr{Cvoid}

# Skipping MacroDefinition: sc_hash_rot ( x , k ) ( ( ( x ) << ( k ) ) | ( ( x ) >> ( 32 - ( k ) ) ) )
# Skipping MacroDefinition: sc_hash_mix ( a , b , c ) ( ( void ) ( a -= c , a ^= sc_hash_rot ( c , 4 ) , c += b , b -= a , b ^= sc_hash_rot ( a , 6 ) , a += c , c -= b , c ^= sc_hash_rot ( b , 8 ) , b += a , a -= c , a ^= sc_hash_rot ( c , 16 ) , c += b , b -= a , b ^= sc_hash_rot ( a , 19 ) , a += c , c -= b , c ^= sc_hash_rot ( b , 4 ) , b += a ) )
# Skipping MacroDefinition: sc_hash_final ( a , b , c ) ( ( void ) ( c ^= b , c -= sc_hash_rot ( b , 14 ) , a ^= c , a -= sc_hash_rot ( c , 11 ) , b ^= a , b -= sc_hash_rot ( a , 25 ) , c ^= b , c -= sc_hash_rot ( b , 16 ) , a ^= c , a -= sc_hash_rot ( c , 4 ) , b ^= a , b -= sc_hash_rot ( a , 14 ) , c ^= b , c -= sc_hash_rot ( b , 24 ) ) )
# Skipping MacroDefinition: SC_ARRAY_IS_OWNER ( a ) ( ( a ) -> byte_alloc >= 0 )
# Skipping MacroDefinition: SC_ARRAY_BYTE_ALLOC ( a ) ( ( size_t ) ( SC_ARRAY_IS_OWNER ( a ) ? ( a ) -> byte_alloc : - ( ( a ) -> byte_alloc + 1 ) ) )
# Skipping MacroDefinition: sc_array_new_size ( s , c ) ( sc_array_new_count ( ( s ) , ( c ) ) )

const sc_hash_function_t = Ptr{Cvoid}
const sc_equal_function_t = Ptr{Cvoid}
const sc_hash_foreach_t = Ptr{Cvoid}
const sc_array_t = sc_array

# Skipping Typedef: CXType_FunctionProto size_t

struct sc_mstamp
    elem_size::Csize_t
    per_stamp::Csize_t
    stamp_size::Csize_t
    cur_snext::Csize_t
    current::Cstring
    remember::sc_array_t
end

const sc_mstamp_t = sc_mstamp

struct sc_mempool
    elem_size::Csize_t
    elem_count::Csize_t
    zero_and_persist::Cint
    mstamp::sc_mstamp_t
    freed::sc_array_t
end

const sc_mempool_t = sc_mempool

struct sc_link
    data::Ptr{Cvoid}
    next::Ptr{sc_link}
end

const sc_link_t = sc_link

struct sc_list
    elem_count::Csize_t
    first::Ptr{sc_link_t}
    last::Ptr{sc_link_t}
    allocator_owned::Cint
    allocator::Ptr{sc_mempool_t}
end

const sc_list_t = sc_list

struct sc_hash
    elem_count::Csize_t
    slots::Ptr{sc_array_t}
    user_data::Ptr{Cvoid}
    hash_fn::sc_hash_function_t
    equal_fn::sc_equal_function_t
    resize_checks::Csize_t
    resize_actions::Csize_t
    allocator_owned::Cint
    allocator::Ptr{sc_mempool_t}
end

const sc_hash_t = sc_hash

struct sc_hash_array_data
    pa::Ptr{sc_array_t}
    hash_fn::sc_hash_function_t
    equal_fn::sc_equal_function_t
    user_data::Ptr{Cvoid}
    current_item::Ptr{Cvoid}
end

const sc_hash_array_data_t = sc_hash_array_data

struct sc_hash_array
    a::sc_array_t
    internal_data::sc_hash_array_data_t
    h::Ptr{sc_hash_t}
end

const sc_hash_array_t = sc_hash_array

struct sc_recycle_array
    elem_count::Csize_t
    a::sc_array_t
    f::sc_array_t
end

const sc_recycle_array_t = sc_recycle_array
