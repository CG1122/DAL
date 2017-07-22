assert_numeric <- function(x, upper = NULL , lower = NULL){

    if ( !all(is_numeric(x)))  {
        warning(dal_msg$num$num)
        return(NULL)
    }


    if( !is.null(upper))
        if(max(x) > upper)
            warning(dal_msg$num$upper)

    if( !is.null(lower))
        if(min(x) < lower)
            warning(dal_msg$num$lower)

    return(NULL)
}




