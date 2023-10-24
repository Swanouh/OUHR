#' Delete existing data from Excel sheet.
#'
#' Delete existing data from an Excel sheet. Can specify the start column and
#' start row.
#'
#' @param template A string containing the filename to delete from.
#' @param wb A string containing the current workbook.
#' @param sheet A string containing the sheetname.
#' @param col_start A number for the column to start deleting from. Default is
#' 1.
#' @param row_start A number for the row to start deleting from. Default is 1.
#'
#' @return Deletes all the data from the starting row/column specified of the
#' Excel sheet.
#' @export
#'
#' @examples \dontrun{
#' one_table_excel(data = cars, filename = "C:/example.xlsx")
#'
#' wb <- openxlsx::loadWorkbook("C:/example.xlsx")#'
#' delete_all_excel(template = "C:/example.xlsx", wb = wb, sheet = "Sheet1",
#' row_start = 5)
#' save_excel(wb = wb, filename = "C:/example.xlsx")
#' }

delete_all_excel <- function(template, wb, sheet, col_start = 1, row_start = 1){

  data <- readxl::read_excel(template, sheet = sheet)

  number_rows_to_delete <- nrow(data)

  number_cols_to_delete <- ncol(data)

  openxlsx::deleteData(wb = wb,
             sheet = sheet,
             cols = col_start:number_cols_to_delete,
             rows = row_start:number_rows_to_delete,
             gridExpand = TRUE
  )
}
