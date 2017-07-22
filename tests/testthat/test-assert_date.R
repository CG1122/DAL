



test_that( "assert_date - basic date detection",{
    expect_null(
        assert_date( test_dat$datevar1 )
    )


    expect_warning(
        assert_date( test_dat$dtvar1 ) ,
        dal_msg$date$date,
        all = T
    )

    expect_warning(
        assert_date( test_dat$numvar1 ),
        dal_msg$date$date,
        all = T
    )

    expect_warning(
        assert_date( test_dat$charvar1 ),
        dal_msg$date$date,
        all = T
    )
})


test_that( "Full Function - basic date detection",{


    spec <- "
        vars:
            datevar1:
                type: date
        vars_date:
            datevar2
    "
    expect_true(
        assert_spec(test_dat , spec)$compliant
    )

    spec <- "
        vars:
            lglvar1:
                type: date
        vars_date:
            - datevar1
            - datevar2
            - dtvar1
            - numvar1
    "
    expect_match(
        assert_spec(test_dat , spec, warn = F)$issue_vector,
        dal_msg$date$date
    )

    expect_length(
        assert_spec(test_dat , spec, warn = F)$issue_vector,
        3
    )
})





















