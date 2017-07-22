



test_char <- list(
    x0 = "YES",
    xa = c(1,2,3),
    x1 = c("yes" , "no" , "yes" , "yes"),
    x2 = c("yes" , "no" , "yes" , "maybe"),
    x3 = c("yes" , "no" , "yes" , "YES"),
    x4 = c("h" , "h" , "he" , "help" ,"hit"),
    x5 = c("h" , "h" , "he" , "help" ,"f")
)



test_that( "assert_character - Basic detection works" , {
    expect_null(
        assert_character( test_char$x1)
    )

    expect_null(
        assert_character( test_char$x0)
    )

    expect_warning (
        assert_character(test_char$xa) ,
        dal_msg$char$char ,
        all = T
    )
})



test_that( "assert_character - Specific value selection works" , {

    expect_null(
        assert_character( test_char$x1 , values = c("yes" , "no"))
    )

    expect_warning(
        assert_character( test_char$x2 , values = c("yes" , "no")) ,
        dal_msg$char$values ,
        all = T
    )

    expect_warning(
        assert_character( test_char$x3 , values = c("yes" , "no")) ,
        dal_msg$char$values ,
        all = T
    )


})

test_that( "assert_character - regular expression matching works" , {

    expect_null(
        assert_character( test_char$x4 , format_re = "^\\w*$")
    )

    expect_null(
        assert_character( test_char$x4 , format_re = "h")
    )

    expect_warning(
        assert_character( test_char$x5 , format_re = "h") ,
        dal_msg$char$format_re ,
        all = T
    )
})




test_that("Full Function - character detecton works" , {

    spec <- "
        vars_character:
            - charvar1
            - charvar2
    "
    expect_true(
        assert_spec( test_dat , spec)$compliant
    )

    spec <- "
        vars_character:
            - charvar1
            - numvar1
    "
    expect_equal(
        assert_spec( test_dat , spec , warn = F)$issue_vector,
        dal_msg$char$char
    )

})



test_that( "Full Function - Character regular expresion formats work",{

    spec <- "
        vars_character:
            charvar1:
                format_re: 'h'
            charvar2:
                format_re: '\\w+ \\w+'
    "
    expect_true(
        assert_spec( test_dat , spec)$compliant
    )

    spec <- "
        vars_character:
            charvar1:
                format_re: 'h'
            charvar2:
                format_re: '^\\w+$'
    "
    expect_equal(
        assert_spec( test_dat , spec , warn = F)$issue_vector,
        dal_msg$char$format_re
    )


})


test_that( "Full Function - Character expected values work", {

    spec <- "
        vars_character:
            charvar3:
                values: ['yes' , 'no']
    "
    expect_true(
        assert_spec( test_dat , spec)$compliant
    )

    spec <- "
        vars_character:
            charvar3:
                values: ['yes' , 'n']
    "
    expect_equal(
        assert_spec( test_dat , spec , warn = F)$issue_vector,
        dal_msg$char$values
    )
})

















