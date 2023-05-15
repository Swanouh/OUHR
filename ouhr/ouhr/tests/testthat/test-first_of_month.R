test_that("first of month returns the first of the month", {
  fom <- first_of_month(Sys.Date())

  day_fom <- lubridate::day(fom)
  month_fom <- lubridate::month(fom)
  year_fom <- lubridate::year(fom)

  current_month <- lubridate::month(Sys.Date())
  current_year <- lubridate::year(Sys.Date())

  expect_equal(day_fom, 1)
  expect_equal(month_fom, lubridate::month(Sys.Date()))
  expect_equal(year_fom, lubridate::year(Sys.Date()))
})
