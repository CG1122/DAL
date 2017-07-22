

#' Assert_spec
#' Function to check whether a dataset meets a desired specification
#' @param DAT Input dataset
#' @param spec YAML dataset specification
#' @param file file name containing YAML dataset specification
#' @param warn Should the function throw a warning if issues are found ? (default True)
#' @param error Should the function throw a error if issues are found ? (default False)
#' @export
assert_spec <- function( DAT , spec = NULL , file = NULL, error = FALSE, warn = TRUE){

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
        issue_count = (map_dbl(RES , length) %>% sum),
        issue_vector = flatten_chr(RES),
        issue_list = RES,
        compliant =  (map_dbl(RES , length) %>% sum) == 0
    )

    class(DAL) <- "DAL"


    if( !DAL$compliant ) {
        if ( warn  ) warning( dal_msg$glb$fail )
        if ( error ) stop( dal_msg$glb$fail )
    }

    return(DAL)
}





#' @method print DAL
#' @export
print.DAL <- function(x, ...){

    x <- x$issue_list

    for ( i in names(x) ){
        if( length(x[[i]]) != 0) {
            cat( paste0(i,":\n"))
            for ( j in x[[i]]) cat(paste0("    " , j , "\n"))
            cat("\n")
        }
    }
}
