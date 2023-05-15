test_that("financial year returns the financial year", {
  fy <- financial_year(as.Date("2023-03-31"))
  fy2 <- financial_year(as.Date("2023-04-01"))

  expect_equal(fy, "2022-2023")
  expect_equal(fy2, "2023-2024")
})
