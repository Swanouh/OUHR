test_that("random password works", {

  # testing that length argument works
  rp <- random_password(length = 4)
  expect_equal(nchar(rp), 4)

  # testing that seed = x works and returns same string each time
  rp2 <- random_password(seed = 1)
  rp3 <- random_password(seed = 1)
  expect_equal(rp2, rp3)

  # testing that seed = "INF12345" works and returns same string each time
  rp4 <- random_password(seed = "INF-12345")
  rp5 <- random_password(seed = "INF-12345")
  expect_equal(rp4, rp5)
})
