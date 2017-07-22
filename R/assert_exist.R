


p_assert_exist <- function( dat , var ){
    if ( !( var %in% names(dat) )) warning(dal_msg$glb$exist)
    return(NULL)
}

assert_exist    <- decorate_assert(p_assert_exist)


