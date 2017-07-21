assert_numeric <- function(x, upper = NULL , lower = NULL){

    if ( !all(is_numeric(x)))  {
        warning("Variable is not numeric")
        return(NULL)
    }


    if( !is.null(upper)) if(max(x) > upper) warning("Upper limit violated")
    if( !is.null(lower)) if(min(x) < lower) warning("Lower limit violated")

    return(NULL)
}




