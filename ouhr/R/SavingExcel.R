#' Saving an Excel File
#'
#' Saves workbook as Excel file in desired location with desired filename. Option to add a password.
#'
#' @param wb A string containing the current workbook. Default is "'wb'".
#' @param filename A string containing desired filepath and name using `/` instead of `\`.
#' @param password A string containing desired password. If omitted, no password is assigned.
#'
#' @return Workbook will be saved with filename and password provided.
#' @export
#'
#' @examples \dontrun{
#' wb <- openxlsx::createWorkbook()
#' openxlsx::addWorksheet(wb, "example")
#' save_excel(wb = wb, filename = "C:/Users/Anya.Ferguson/Desktop/example.xlsx")
#' }

save_excel <- function(wb = wb, filename, password){
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
