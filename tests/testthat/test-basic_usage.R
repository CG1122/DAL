



test_that( "Full Function - Variable detection", {

    spec <- "
        vars:
            - lglvar1
            - lglvar2
            - numvar1
            - numvar2
    "
    expect_true(
        assert_spec( test_dat , spec)$compliant
    )


    spec <- "
        vars:
            - lglvar1
            - lglvar2
            - numvar1
            - numvar2
            - missingvar1
            - missingvar2
            - missingvar3
    "
    expect_match(
        assert_spec( test_dat , spec, warn = F)$issue_vector,
        dal_msg$glb$exist
    )

    expect_length(
        assert_spec( test_dat , spec, warn = F)$issue_vector,
        3
    )
})




test_that("Full Function - Type detection", {

    spec <- "
        vars_logical:
            - lglvar1

        vars_numeric:
            - numvar1
    "
    expect_true(
        assert_spec( test_dat , spec)$compliant
    )


    spec <- "
        vars:
            - lglvar1:
                type: logical
            - numvar1:
                type: numeric
    "
    expect_true(
        assert_spec( test_dat , spec)$compliant
    )

    spec <- "
        vars_logical:
            - lglvar1
            - lglvar2
            - numvar2

        vars_numeric:
            - numvar1
    "
    expect_match(
        assert_spec( test_dat , spec, warn= F)$issue_vector ,
        dal_msg$lgl$lgl
    )

})




test_that("Full Function - NA detection", {


    spec <- "
        vars_logical:
            lglvar1:
                allow_na: False
    "
    expect_true(
        assert_spec( test_dat , spec)$compliant
    )


    spec <- "
        vars_logical:
            lglvar1:
                allow_na: False
            lglvar2:
                allow_na: False
    "
    expect_match(
        assert_spec( test_dat , spec, warn = F)$issue_vector,
        dal_msg$glb$na
    )

    expect_length(
        assert_spec( test_dat , spec, warn = F)$issue_vector,
        1
    )

})



test_that("Full Function - Class detection",{

    test_class <- list(
        x = c(1,2,3,4),
        y = lm ( x~y , data= data.frame( x= rnorm(10) , y = rnorm(10)))

    )

    spec <- "
        vars:
            - x:
                class: 'numeric'
            - y:
                class: 'lm'
    "
    expect_true(
        assert_spec( test_class , spec)$compliant
    )

    spec <- "
        vars:
            - x:
                class: 'numeric'
            - y:
                class: 'numeric'
    "
    expect_equal(
        assert_spec( test_class , spec, warn = F)$issue_vector,
        dal_msg$glb$class
    )


})







