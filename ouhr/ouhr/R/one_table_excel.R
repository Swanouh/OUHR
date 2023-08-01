#' Create Excel File with One Table.
#'
#' Creating an Excel workbook with only one table and saving in desired location with desired filename. Option to add a password.
#'
#' @param sheetname A string containing the sheetname.
#' @param data A dataframe.
#' @param filename A string containing desired filepath and name using `/` instead of `\`.
#' @param password A string containing desired password. If omitted, no password is assigned.
#' @param colNames Boolean to say whether column names from the dataframe should be used. Defaults to `TRUE`.
#' @param table_position A vector of coordinates of starting column and starting row. Defaults to column `1`, row `1`.
#' @param column_widths A vector of the desired column widths. Defaults to "`auto`".
#' @param columns A vector of the column numbers to apply the specified widths too. Defaults to all columns.
#'
#' @return An Excel workbook with one table saved with filename and password provided.
#' @export
#'
#' @examples
#' one_table_excel(data = cars, filename = "C:/example.xlsx",
#'    column_widths = c(5, 8), columns = c(1, 2))
#'

one_table_excel <- function(sheetname = "Sheet1", data, filename, password, colNames = TRUE, table_position = c(1, 1), column_widths = "auto", columns = 1:ncol(data)){
  wb <- openxlsx::createWorkbook()

  openxlsx::addWorksheet(wb, sheetname)

  openxlsx::writeDataTable(wb,
                           sheetname,
                           data,
                           colNames = colNames,
                           startCol = table_position[1],
                           startRow = table_position[2],
                           tableStyle = "TableStyleLight9"
                           )

  openxlsx::setColWidths(wb,
                         sheetname,
                         cols = columns,
                         widths = column_widths
                         )

  openxlsx::saveWorkbook(wb,
                         file = filename,
                         overwrite = TRUE
                         )

  # Adding password if specified
  if(!missing(password)){
    filename <- normalizePath(path.expand(filename))
    Application <- RDCOMClient::COMCreate("Excel.Application")
    wkb <- Application$Workbooks()$Open(filename)
    wkb[['Password']] <- password
    wkb$Save()
    Application$Quit()
    Application <- NULL
    invisible(gc())

  }
}
