
dal_is_datetime <- function(x){
    any(class(x) %in% c("POSIXct", "POSIXt"))
}

assert_datetime <- function( x , ...){

    if ( !all( map_lgl( x , dal_is_datetime )))  {
        warning(dal_msg$datetime$datetime)
        return(NULL)
    }

    return(NULL)

}









