assert_lgl <- function(x){

    if ( !all(is_logical(x)))  {
        warning(dal_msg$lgl$lgl)
        return(NULL)
    }

    return(NULL)
}
