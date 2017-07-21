yaml_format <- function(yam, group = NULL, type = NULL){
    outyam <- list()

    yam <- yam[[group]]

    for (i in seq_along(yam) ) {

        CUR      <- yam[[i]]
        TOP_NAME <- names(yam)[[i]]
        CUR_NAME <- names(CUR)
        ATOMIC   <- is_scalar_atomic( CUR )


        if (ATOMIC) {
            NAME <- CUR
            VALUE <- list()
        } else {
            if ( is.null(TOP_NAME)) {
                NAME <- CUR_NAME
                VALUE <- CUR[[1]]
            } else {
                NAME <- TOP_NAME
                VALUE <- CUR
            }
        }

        outyam[[NAME]] <- VALUE

        if( !is.null(type) & type != "" & length(type) != 0 ) outyam[[NAME]][["type"]] <- type

    }
    return(outyam)
}



get_spec <- function( spec = NULL , file = NULL){
    if( !is.null(spec) & !is.null(file)) stop("Can only handle 1 input of file or spec not both!!")
    if( is.null(spec) & is.null(file))   stop("No specification provided")

    if ( !is.null(spec)) spec_yaml <- yaml.load(spec)
    if ( !is.null(file)) spec_yaml <- yaml.load_file(file)

    groups <- grep( "^vars.*" , names(spec_yaml) , value = T)
    types <- sub( "vars_?" , "" , groups)

    spec_formated <- flatten( map2(groups ,types ,yaml_format, yam = spec_yaml ) )

    if ( !( length(names(spec_formated)) == length(unique(names(spec_formated))) )) {
        stop( "Name Collision")
    }

    return(spec_formated)
}

