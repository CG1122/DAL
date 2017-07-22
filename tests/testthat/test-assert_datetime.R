

test_that( "assert_datetime - basic datetime detection",{
    expect_null(
        assert_datetime( test_dat$dtvar1 )
    )


    expect_warning(
        assert_datetime( test_dat$datevar1 ) ,
        dal_msg$datetime$datetime,
        all = T
    )

    expect_warning(
        assert_datetime( test_dat$numvar1 ),
        dal_msg$datetime$datetime,
        all = T
    )

    expect_warning(
        assert_datetime( test_dat$charvar1 ),
        dal_msg$datetime$datetime,
        all = T
    )
})


test_that( "Full Function - basic datetime detection",{


    spec <- "
        vars:
            dtvar1:
                type: datetime
        vars_datetime:
            dtvar2
    "
    expect_true(
        assert_spec(test_dat , spec)$compliant
    )

    spec <- "
        vars:
            lglvar1:
                type: datetime
        vars_datetime:
            - datevar1
            - datevar2
            - dtvar1
            - numvar1
    "
    expect_match(
        assert_spec(test_dat , spec, warn = F)$issue_vector,
        dal_msg$datetime$datetime
    )

    expect_length(
        assert_spec(test_dat , spec, warn = F)$issue_vector,
        4
    )
})
