


test_num <- list(
    n0 = 1,
    n1 = c(1,2,3,4,5),
    n2 = c("1" , "2")
)



test_that( "assert_numeric - Basic detetction",{


    expect_null(
        assert_numeric( test_num$n0)
    )

    expect_null(
        assert_numeric( test_num$n1)
    )

    expect_warning(
        assert_numeric( test_num$n2),
        dal_msg$num$num,
        all = T
    )

})

test_that ( "assert_numeric - Limits" , {

    expect_null(
        assert_numeric( test_num$n1 , upper = 5)
    )

    expect_null(
        assert_numeric( test_num$n1 , lower = 1)
    )


    expect_warning(
        assert_numeric( test_num$n1 , upper = 4 ),
        dal_msg$num$upper,
        all = T
    )

    expect_warning(
        assert_numeric( test_num$n1 , lower = 2) ,
        dal_msg$num$lower,
        all = T
    )

    expect_warning(
        assert_numeric( test_num$n1 , lower = 2, upper= 4) ,
        paste(dal_msg$num$upper , dal_msg$num$lower, sep = "|")  ,
        all = T
    )

})

test_that("Full Function - Basic detection",{

    spec <- "
        vars:
            numvar1:
                type: numeric
            numvar2:
                type: numeric
    "
    expect_true(
        assert_spec( test_dat , spec)$compliant
    )


    spec <- "
        vars_numeric:
            - numvar1
            - numvar2
    "
    expect_true(
        assert_spec( test_dat , spec)$compliant
    )


    spec <- "
        vars:
            numvar1:
                type: numeric
            charvar1:
                type: numeric
    "
    expect_equal(
        assert_spec( test_dat , spec , warn = F)$issue_vector,
        dal_msg$num$num
    )


    spec <- "
        vars_numeric:
            - numvar1
            - charvar1
    "
    expect_equal(
        assert_spec( test_dat , spec , warn = F)$issue_vector,
        dal_msg$num$num
    )

})



test_that("Full Function - Limits",{

    spec <- "
        vars_numeric:
            - numvar1:
                upper: 4
                lower: 1
    "
    expect_true(
        assert_spec( test_dat , spec)$compliant
    )



    spec <- "
        vars_numeric:
            - numvar1:
                upper: 1
                lower: 1
    "
    expect_equal(
        assert_spec( test_dat , spec, warn = F)$issue_vector,
        dal_msg$num$upper
    )


    spec <- "
        vars_numeric:
            - numvar1:
                upper: 4
                lower: 4
    "
    expect_equal(
        assert_spec( test_dat , spec, warn = F)$issue_vector,
        dal_msg$num$lower
    )


    spec <- "
        vars_numeric:
            - numvar1:
                upper: 3
                lower: 3
    "
    expect_match(
        assert_spec( test_dat , spec, warn = F)$issue_vector,
        paste0(dal_msg$num$lower , dal_msg$num$upper , sep = "|")
    )

})


