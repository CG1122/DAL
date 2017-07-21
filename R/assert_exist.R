


p_assert_exist <- function( dat , var ){
    if ( !( var %in% names(dat) )) warning("Variable does not exist")
    return(NULL)
}

assert_exist    <- decorate_assert(p_assert_exist)


