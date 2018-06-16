

context('IDMC API')

test_that('If get_countries() is broken', {
    skip_on_cran()

    res <- get_countries()
    expect_is(res, 'data.frame')
})

test_that('If get_overview() is broken', {
    skip_on_cran()

    res <- get_overview('RUS')
    expect_is(res, 'data.frame')
})


test_that('If get_conflict_data() is broken', {
    skip_on_cran()

    res1 <- get_conflict_data('RUS', year = 2015L)
    expect_is(res1, 'data.frame')

    res2 <- get_conflict_data('RUS', year = c(2011L, 2015L))
    expect_is(res2, 'data.frame')
})

test_that('If get_disaster_data() is broken', {
    skip_on_cran()

    res1 <- get_disaster_data('RUS', year = 2015L)
    expect_is(res1, 'data.frame')

    res2 <- get_disaster_data('RUS', year = c(2011L, 2015L))
    expect_is(res2, 'data.frame')
})


test_that('If get_displacement_data() is broken', {
    skip_on_cran()

    res1 <- get_displacement_data('RUS', year = 2015L)
    expect_is(res1, 'data.frame')

    res2 <- get_displacement_data('RUS', year = c(2011L, 2015L))
    expect_is(res2, 'data.frame')
})

test_that('If get_strata_data() is broken', {
    skip_on_cran()

    res <- get_strata_data('RUS')
    expect_is(res, 'data.frame')
})
