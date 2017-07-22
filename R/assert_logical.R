assert_lgl <- function(x){

    if ( !all( map_lgl(x , is_logical)))  {
        warning(dal_msg$lgl$lgl)
        return(NULL)
    }

    return(NULL)
}
