



decorate_assert <- function(f){
    function(...){
        x <- quietly(f)(...)
        x$warnings
    }
}



remove_na <- function(x ){
    x[!is.na(x)]
}


assert_na <- function( x){
    if( any(is.na(x)))
        warning ( dal_msg$glb$na)
    return(NULL)
}


assert_default <- function(x){
    return(NULL)
}




assert_class <- function( x , cls){

    if ( ! all(class(x) %in% cls) ) {
        warning( dal_msg$glb$class)
    }

    return(NULL)
}




p_dispatch_assert <- function( type = NULL , x, allow_na = TRUE, class = NULL,  ... ){

    if( !allow_na){
        assert_na(x)
    }

    if ( !is.null(class)){
        assert_class( x = x , cls = class)
    }


    if ( is.null(type)){
        return( assert_default(x = x , ... ) )
    }


    if ( type == "numeric"){
        return( assert_numeric(x = remove_na(x) , ... ) )
    }


    if ( type == "logical"){
        return( assert_lgl(x = remove_na(x), ... ) )
    }


    if ( type == "character"){
        return( assert_character(x = remove_na(x), ... ) )
    }


    if ( type == "date"){
        return( assert_date(x = remove_na(x), ... ) )
    }


    if ( type == "datetime"){
        return( assert_datetime(x = remove_na(x), ... ) )
    }
}

# dispatch_assert <- p_dispatch_assert
dispatch_assert <- decorate_assert(p_dispatch_assert)













