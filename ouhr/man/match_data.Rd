% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/match_data.R
\name{match_data}
\alias{match_data}
\title{Matching data.}
\usage{
match_data(data, sql_table, connection, matched_names, missing_columns = FALSE)
}
\arguments{
\item{data}{The dataframe you want to tidy before appending to SQL.}

\item{sql_table}{The SQL table you wish to compare to. For example,
\code{"Info.Performance.Perf_Data"}.}

\item{connection}{The SQL connection. For example, \code{connection_WH} or
\code{connection_OP}.}

\item{matched_names}{A dataframe with 2 rows only to show the mapping of
column names for column names that need do not match. The first row is for
the column names of data. The second row is for the column names of
\code{sql_table}. Names that are the same in both \code{data} and \code{sql_table} do not
need to be given.}

\item{missing_columns}{Default is \code{FALSE}. If set to \code{TRUE}, R will compare
the columns in \code{data} against the column names in \code{sql_table} and create new
\code{NULL} columns for the missing columns.}
}
\value{
A dataframe (mostly) ready to append to SQL. Further modifications
can be made if necessary.
}
\description{
To rename columns in a dataframe to match a SQL table according to a map and
to start the tidying of data before using append_data().
}
\examples{
\dontrun{sql_table <- "Info.Performance.Perf_Data"
connection_WH <- DBI::dbConnect(odbc::odbc(),
                                Driver = "SQL Server",
                                Server = "oxnetorbit01\\\\tdwh_live",
                                Database = "Info"
                                )
match_data(data = cars,
           sql_table = sql_table,
           connection = connection_WH,
           matched_names = "C:/example.xlsx"
          )
}
}
