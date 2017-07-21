

dat <- data.frame(
    stringsAsFactors = F,
    lglvar1 = c(T,F ,T ,F),
    lglvar2 = c(T,F , NA , T),
    numvar1 = c(1,2,3,4),
    numvar2 = c(1,2,3,NA),
    charvar1 = c( "hello" , "how" , "hope", "his"),
    charvar2 = c("two words" , "again again" , "dup dup" , "so there"),
    charvar3 = c("yes" , "no" , "yes" , "yes")
)




test_that( "Basic variable detection",{
    spec <- "
        vars:
            - lglvar1
            - lglvar2
            - numvar1
            - numvar2
    "
    expect_true( assert_spec( dat , spec)$compliant )
})




test_that( "Missing variables give warnings", {

    spec <- "
        vars:
            - lglvar1
            - lglvar2
            - numvar1
            - numvar2
            - numvar3
    "
    expect_warning( assert_spec( dat , spec) )
})




test_that( "Basic type detection works", {

    spec <- "
        vars_logical:
            - lglvar1

        vars_numeric:
            - numvar1
    "

    expect_true( assert_spec( dat , spec)$compliant )


    spec <- "
        vars:
            - lglvar1:
                type: logical
            - numvar1:
                type: numeric
    "
    expect_true( assert_spec( dat , spec)$compliant )

    spec <- "
        vars_logical:
            - lglvar1
            - lglvar2
            - numvar2

        vars_numeric:
            - numvar1
    "

    expect_warning( assert_spec( dat , spec) )

})




test_that("NA detection works", {


    spec <- "
        vars_logical:
            lglvar1:
                allow_na: False
    "
    expect_true( assert_spec( dat , spec)$compliant )

    spec <- "
        vars_logical:
            lglvar1:
                allow_na: False
            lglvar2:
                allow_na: False
    "
    expect_warning( assert_spec( dat , spec) )

})



test_that( "Character regular expresion formats work",{

    spec <- "
        vars_character:
            charvar1:
                format_re: 'h'
            charvar2:
                format_re: '\\w+ \\w+'
    "
    expect_true( assert_spec( dat , spec)$compliant)

    spec <- "
        vars_character:
            charvar1:
                format_re: 'h'
            charvar2:
                format_re: '^\\w+$'
    "
    expect_warning( assert_spec( dat , spec) )


})


test_that( "Character expected values work", {

    spec <- "
        vars_character:
            charvar3:
                values: ['yes' , 'no']
    "
    expect_true( assert_spec( dat , spec)$compliant)

    spec <- "
        vars_character:
            charvar3:
                values: ['yes' , 'n']
    "
    expect_warning( assert_spec( dat , spec) )
})













