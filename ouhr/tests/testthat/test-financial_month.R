test_that("financial month returns the financial month", {
  fm <- financial_month(as.Date("2023-03-31"))
  fm2 <- financial_month(as.Date("2023-04-01"))

  expect_equal(fm, "12")
  expect_equal(fm2, "1")
})
