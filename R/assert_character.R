assert_character <- function(x, format_re = NULL, values = NULL){

    if ( !all(is_character(x)))  {
        warning(dal_msg$char$char)
        return(NULL)
    }

    if ( !is.null(format_re))
        if( !all ( grepl( format_re , x)))
            warning(dal_msg$char$format_re)


    if( !is.null(values))
        if( !all( x %in% values))
            warning(dal_msg$char$values)


    return(NULL)
}
