test_that("save_excel saves excel", {
  # Test without password - Expect to find that the workbook exists
  wb <- openxlsx::createWorkbook()
  openxlsx::addWorksheet(wb, "example")
  save_excel(wb = wb, filename = "C:/Users/Anya.Ferguson/Desktop/example.xlsx")

  expect_true(file.exists("C:/Users/Anya.Ferguson/Desktop/example.xlsx"))

  # Test with password - Expect to find that the workbook exists, and that it can't be read in to R because it is password protected
  wb <- openxlsx::createWorkbook()
  openxlsx::addWorksheet(wb, "example")
  save_excel(wb = wb, filename = "C:/Users/Anya.Ferguson/Desktop/example2.xlsx", password = "p")

    expect_true(file.exists("C:/Users/Anya.Ferguson/Desktop/example2.xlsx"))
  expect_error(read_excel("C:/Users/Anya.Ferguson/Desktop/example2.xlsx"))
})
