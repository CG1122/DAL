



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

    test_class2 <- list(
        x = c(1,2,3,4),
        y = list(
            lm ( x~y , data= data.frame( x= rnorm(10) , y = rnorm(10))) ,
            lm ( x~y , data= data.frame( x= rnorm(10) , y = rnorm(10)))
        )
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
    expect_true(
        assert_spec( test_class2 , spec)$compliant
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



test_that("Full Function - Class detection (various input combinations)",{

    test_class3 <- list(
        x = c( 1L , 2L , 3L),
        y = c(1,2,3,4,5),
        z = 1L,
        w = list(30L),
        u = list( a = 1L , b = 2L)
    )

    spec <- "
        vars_numeric:
            - x:
                class: integer
            - y:
                class: integer
            - z:
                class: integer
            - w:
                class: integer
            - u:
                class: integer

    "
    expect_equal(
        assert_spec( test_class3 , spec, warn = F)$issue_vector,
        dal_msg$glb$class
    )
    expect_length(
        assert_spec( test_class3 , spec, warn = F)$issue_list$y,
        1
    )
    expect_length(
        assert_spec( test_class3 , spec, warn = F)$issue_vector,
        1
    )


})




