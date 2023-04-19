test_that("previous_month returns the previous month", {
  pm <- previous_month(Sys.Date())

  month_pm <- lubridate::month(pm)

  expect_equal(month_pm, lubridate::month(Sys.Date())-1)
})
