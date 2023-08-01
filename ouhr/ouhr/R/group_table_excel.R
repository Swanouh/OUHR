#' Add One Sheet and Table per Group to Excel.
#'
#' @param wb A string containing the current workbook.
#' @param data A dataframe.
#' @param group The column you want to group the data into it.
#' @param range The range of group values.
#' @param column_widths A vector of the desired column widths. Defaults to "`auto`".
#' @param columns A vector of the column numbers to apply the specified widths too. Defaults to all columns.
#' @param colNames Boolean to say whether column names from the dataframe should be used. Defaults to `TRUE`.
#'
#' @return Inserts one sheet with data in a table for each group.
#' @export
#' @importFrom magrittr %>%
#'
#' @examples \dontrun{
#' wb <- openxlsx::createWorkbook()
#' data <- cars %>% mutate("speed_category" = ifelse(speed <15, "Less than 15", "Greater than 15"))
#' group_table_excel(wb = wb, data = data, group = speed_category,
#'    range = c("Less than 15", "Greater than 15"))
#' save_excel(wb = wb, filename = "C:/Users/Anya.Ferguson/Desktop/example.xlsx")
#' }
group_table_excel <- function(wb, data, group, range, colNames = TRUE, column_widths = "auto", columns = 1:ncol(data_amend)){
  for(i in range){
     data_amend <- data %>%
       dplyr::filter({{group}} == i) %>%
       dplyr::select(-{{group}})

     openxlsx::addWorksheet(wb,
                            as.character(i)
                            )

     openxlsx::writeDataTable(wb,
                              as.character(i),
                              data_amend,
                              colNames = colNames
                              )

     openxlsx::setColWidths(wb,
                            as.character(i),
                            cols = columns,
                            widths = column_widths
                            )
  }
}
