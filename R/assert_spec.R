

#' Assert_spec
#' Function to check whether a dataset meets a desired specification
#' @param DAT Input dataset
#' @param spec YAML dataset specification
#' @param file file name containing YAML dataset specification
#' @param error Should the function error if issues are found ? (default is just a warning)
#' @export
assert_spec <- function( DAT , spec = NULL , file = NULL, error = FALSE){

    spec_formated <- get_spec ( spec , file)

    RES <- map( names(spec_formated) , assert_exist , dat = DAT) %>%
        set_names( names(spec_formated))


    for ( i in names(RES)) {

        if ( length( RES[[i]] ) == 0 ) {
            temp <- spec_formated[[i]]

            if ( length( temp) != 0 ){
                temp[["x"]] <- DAT[[i]]
                RES[[i]] <- do.call(dispatch_assert , temp )
            }
        }
    }

    DAL <- list(
        compliant =  (map_dbl(RES , length) %>% sum) == 0 ,
        variables = RES
    )

    class(DAL) <- "DAL"


    if( !DAL$compliant ) {
        message <- "Data did not conform to the specification"
        if ( error) stop(message)
        else warning(message)
    }

    return(DAL)
}





#' @method print DAL
#' @export
print.DAL <- function(x, ...){

    x <- x$variables

    for ( i in names(x) ){
        if( length(x[[i]]) != 0) {
            cat( paste0(i,":\n"))
            for ( j in x[[i]]) cat(paste0("    " , j , "\n"))
            cat("\n")
        }
    }
}
