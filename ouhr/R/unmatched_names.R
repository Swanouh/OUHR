#' Finding unmatched names
#'
#' Comparing a dataframe to a SQL table to create an Excel sheet with the column
#' names that do not have a match.
#'
#' @param data The dataframe you want to compare to SQL.
#' @param sql_table The SQL table you wish to compare to. For example,
#' `"Info.Performance.Perf_Data"`.
#' @param connection The SQL connection. For example, `connection_WH` or
#' `connection_OP`.
#' @param filename The filename for the Excel to output to.
#'
#' @return An Excel file.
#' @export
#'
#' @examples \dontrun{data <- cars
#' sql_table <- "Info.Performance.Perf_Data"
#' connection_WH <- DBI::dbConnect(odbc::odbc(),
#'                                 Driver = "SQL Server",
#'                                 Server = "oxnetorbit01\\tdwh_live",
#'                                 Database = "Info"
#'                                 )
#' unmatched_names(data = data,
#'                 sql_table = sql_table,
#'                 connection = connection_WH,
#'                 filename = "C:/example.xlsx"
#'                )
#' }

unmatched_names <- function(data, sql_table, connection, filename) {

  # read in SQL
  sql <- DBI::dbGetQuery(conn = connection,
                         statement = stringr::str_replace(
                                                "SELECT TOP 1 * FROM TABLENAME",
                                                 "TABLENAME",
                                                 sql_table
                                                 )
                         )

  # return names in data that aren't in SQL
  unmatched_names <- data[!names(data) %in% names(sql)] %>%
    slice(0)

  # write to new data file
  one_table_excel(filename = filename,
                  data = unmatched_names
                  )

}
