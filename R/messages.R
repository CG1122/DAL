





dal_msg <- list(

    glb = list(
        na    = "Contains missing values",
        exist = "Variable does not exist",
        class = "Variable is not the correct class",
        fail  = "Data did not conform to the specification"
    ),


    char = list(
        char      = "Variable is not a character",
        format_re = "Regular expression format violated" ,
        values    = "Contains unexpected values"

    ),

    num = list(
        num   = "Variable is not a numeric",
        upper = "Upper limit violated",
        lower = "Lower limit violated"

    ),

    lgl = list(
        lgl = "Variable is not a logical"
    ),

    date = list(
        date = "Variable is not a date"
    ),

    datetime = list(
        datetime = "Variable is not a datetime"
    )


)
