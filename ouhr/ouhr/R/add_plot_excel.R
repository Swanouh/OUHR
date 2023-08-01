#' Add Plot to Excel
#'
#' Adding a R plot to Excel workbook. Plot can be made using `ggplot` or base `R`. Ensure plot exists in the global environment before using the function.
#'
#' @param wb A string containing the current workbook.
#' @param sheetname A string containing the sheetname.
#' @param plot A plot.
#' @param plot_position A vector of coordinates of starting column and starting row. Defaults to column `2`, row `1`.
#' @param plot_width A number for the desired width of plot. Defaults to `8`.
#' @param plot_height A number for the desired height of plot. Defaults to `5`.
#'
#' @return Inserts the plot into the Excel workbook.
#' @export
#'
#' @examples \dontrun{
#' plot1 <- plot(cars)
#' wb <- openxlsx::createWorkbook()
#' openxlsx::addWorksheet(wb, "example")
#' plot_excel(sheetname = "example", plot = plot1)
#' save_excel(wb = wb, filename = "C:/example.xlsx")
#' }

plot_excel <- function(wb, sheetname, plot, plot_position = c(2, 1), plot_width = 8, plot_height = 5){

  if(!missing(plot)){

    print(plot)

    openxlsx::insertPlot(wb,
               sheetname,
               startCol = plot_position[1],
               startRow = plot_position[2],
               width = plot_width,
               height = plot_height,
               fileType = "png",
               units = "in"
    )
  }

}
