assert_character <- function(x, format_re = NULL, values = NULL){

    if ( !all(is_character(x)))  {
        warning("Variable is not character")
        return(NULL)
    }

    if ( !is.null(format_re))
        if( !all ( grepl( format_re , x)))
            warning("Regular expression format violated")


    if( !is.null(values))
        if( !all( x %in% values))
            warning("Contains unexpected values")


    return(NULL)
}
