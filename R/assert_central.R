


decorate_assert <- function(f){
    function(...){
        x <- quietly(f)(...)
        x$warnings
    }
}


parse_na <- function(x , allow_na = TRUE, ...){
    if ( !allow_na) if( any(is.na(x))) warning ( "Contains Missing Values")
    x[!is.na(x)]
}



assert_default <- function(x){
    return(NULL)
}


p_dispatch_assert <- function( type = NULL , x, allow_na = TRUE,  ... ){

    x <- parse_na(x , allow_na)

    if ( is.null(type))       return(assert_default(x = x , ...))
    if ( type == "numeric")   return(assert_numeric(x = x, ...))
    if ( type == "logical")   return(assert_lgl(x = x, ...))
    if ( type == "character") return(assert_character(x = x, ...))
}

dispatch_assert <- decorate_assert(p_dispatch_assert)
