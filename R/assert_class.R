is_class <- function (x , cls){
    any( class(x) %in% cls )
}


assert_class <- function( x , cls){

    if ( all( class(x) == "list") ){

        if ( ! all( map_lgl( x , is_class , cls = cls)  ) ) {
            warning( dal_msg$glb$class)
        }


    } else {

        if( !is_class(x , cls) ){

            warning ( dal_msg$glb$class)
        }

    }

    return(NULL)
}
