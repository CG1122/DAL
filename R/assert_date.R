


dal_is_date <- function(x){
    any(class(x) %in% "Date")
}


assert_date <- function( x , ...){

    if ( !all( map_lgl(x , dal_is_date))){
        warning(dal_msg$date$date)
        return(NULL)
    }

    return(NULL)


}



















