#' Appending data to SQL.
#'
#' Appending a dataframe to specified SQL table.
#'
#' @param data The dataframe you want to append to SQL. `data` does not need to
#' have all the columns that are in `sql_table`, but column names must match.
#' @param sql_table The SQL table you wish to append to. For example,
#' `"Info.Performance.Perf_Data"`.
#' @param connection The SQL connection. For example, `connection_WH` or
#' `connection_OP`.
#' @param chunksize Default is `100`. This is the number of rows to append at a
#' time. Recommend not changing unless absolutely necessary.
#'
#' @return Rows appended to SQL.
#' @export
#'
#' @examples \dontrun{
#' sql_table <- "Info.AdHoc.MyTableName"
#'connection_WH <- DBI::dbConnect(odbc::odbc(),
#'                                Driver = "SQL Server",
#'                                Server = "oxnetorbit01\\tdwh_live",
#'                                Database = "Info"
#'                               )
#'append_sql(data = data,
#'           sql_table = sql_table,
#'           connection = connection_WH,
#'           missing_columns = TRUE
#'           )
#'}


append_sql <- function(data, sql_table, connection, chunksize = 100) {

  rows <- nrow(data)

  # creating beginning of insert statement
  query_beginning <- paste0("INSERT INTO ",
                            sql_table,
                            "([",
                            paste0(colnames(data),
                                   collapse = '], ['
                            ),
                            "]) VALUES "
                            )

  for (i in 1:ceiling(rows / chunksize)) {

    values <- NULL

    # create values to append to sql
    for (j in 1:chunksize) {

      k <- (i - 1) * chunksize + j

      if (k <= rows) {

        values[j] <- paste0("('", paste0(data[k,], collapse = "','"), "')")

      }

    }

    # put together query beginning and rows to get full query
    query_full <- stringr::str_replace_all(paste0(query_beginning,
                                         paste0(values, collapse = ","
                                                )
                                         ),
                                         "'NA'",
                                         "NULL"
                                         )

    # sending query to sql
    DBI::dbSendStatement(connection, statement = query_full)

  }

}
