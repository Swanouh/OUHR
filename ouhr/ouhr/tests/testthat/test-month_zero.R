test_that("month zero works", {
  mz1 <- month_zero(as.Date("2023-03-28"))
  expect_equal(mz1, "03")

  mz2 <- month_zero(as.Date("2023-11-28"))
  expect_equal(mz2, "11")

  mz3 <- month_zero(Sys.Date())
  expect_equal(nchar(mz3), 2)
})
