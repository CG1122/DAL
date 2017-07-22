


assert_datetime <- function( x , ...){

    if ( !all(class(x) %in% c("POSIXct", "POSIXt") ))  {
        warning(dal_msg$datetime$datetime)
        return(NULL)
    }

    return(NULL)

}









