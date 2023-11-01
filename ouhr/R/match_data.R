#' Matching data.
#'
#' To rename columns in a dataframe to match a SQL table according to a map and
#' to start the tidying of data before using append_data().
#'
#' @param data The dataframe you want to tidy before appending to SQL.
#' @param sql_table The SQL table you wish to compare to. For example,
#' `"Info.Performance.Perf_Data"`.
#' @param connection The SQL connection. For example, `connection_WH` or
#' `connection_OP`.
#' @param matched_names A dataframe with 2 rows only to show the mapping of
#' column names for column names that need do not match. The first row is for
#' the column names of data. The second row is for the column names of
#' `sql_table`. Names that are the same in both `data` and `sql_table` do not
#' need to be given.
#' @param missing_columns Default is `FALSE`. If set to `TRUE`, R will compare
#' the columns in `data` against the column names in `sql_table` and create new
#' `NULL` columns for the missing columns.
#'
#' @return A dataframe (mostly) ready to append to SQL. Further modifications
#' can be made if necessary.
#' @export
#'
#' @examples \dontrun{sql_table <- "Info.Performance.Perf_Data"
#' connection_WH <- DBI::dbConnect(odbc::odbc(),
#'                                 Driver = "SQL Server",
#'                                 Server = "oxnetorbit01\\tdwh_live",
#'                                 Database = "Info"
#'                                 )
#' match_data(data = cars,
#'            sql_table = sql_table,
#'            connection = connection_WH,
#'            matched_names = "C:/example.xlsx"
#'           )
#' }

match_data <- function(data, sql_table, connection, matched_names,
                       missing_columns = FALSE) {

  # read in SQL
  sql <- DBI::dbGetQuery(conn = connection,
                         statement = stringr::str_replace(
                                                "SELECT TOP 1 * FROM TABLENAME",
                                                 "TABLENAME",
                                                 sql_table
                                                )
                         )

  # getting column names
  names_updated <- matched_names %>%
    t() %>%
    as.data.frame()

  data_names <- names_updated[1] %>% dplyr::pull()

  sql_names <- names_updated[2] %>% dplyr::pull()

  # renaming columns
  data_tidy <- data %>%
    dplyr::rename_at(vars(data_names), ~ sql_names)

  # adding missing columns
  if(missing_columns){

    desired_column_names <- colnames(sql)

    desired_columns <- data.frame(matrix(nrow = 1,
                                         ncol = length(desired_column_names)
                                         )
                                  )

    colnames(desired_columns) <- desired_column_names

    data_tidy <- data_tidy %>%
      add_column(!!!desired_columns[!names(desired_columns) %in% names(.)]) %>%
      data.table::setcolorder(desired_column_names)

  }

  # tidying up
  data_tidy %>% # ordering columns
    dplyr::mutate(across(everything(), ~ as.character(.)),
           across(everything(), ~ str_replace_all(., "'", "''")) # for ' in sql
           )

}
