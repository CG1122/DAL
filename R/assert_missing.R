

remove_na <- function(x ){
    x[!is.na(x)]
}



assert_na <- function( x){
    if( any(is.na(x)))
        warning ( dal_msg$glb$na)
    return(NULL)
}
