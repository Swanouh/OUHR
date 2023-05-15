test_that("month year works", {
  my_a <- monthyear(as.Date("2023-11-28"), "abb")
  expect_equal(my_a, "Nov 2023")

  my_f <- monthyear(as.Date("2023-11-28"), "full")
  expect_equal(my_f, "November 2023")

  my_n <- monthyear(as.Date("2023-11-28"), "num")
  expect_equal(my_n, "11 2023")

})
