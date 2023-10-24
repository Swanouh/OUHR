#' Wrap up
#'
#' A function to print the run-time of the Rmd to the html output and to log
#' start and end datetimes to Info.Adhoc.R_Procedures.
#'
#' @return Run-time of Rmd.
#' @export
#'
#' @examples \dontrun{procedure_start_time <- Sys.Date()
#' wrap_up()}

wrap_up <- function(){

  procedure_end_time <- Sys.time()

  connection_WH <- DBI::dbConnect(odbc::odbc(),
                                  Driver = "SQL Server",
                                  Server = "oxnetorbit01\\tdwh_live",
                                  Database = "Info"
  )

  title <- rmarkdown::metadata$title

  log <- data.frame("StartDateTime" = as.character(
                                                    hms::round_hms(
                                                      as.POSIXct(
                                                        procedure_start_time
                                                                ), 1
                                                                   )
                                                    ),
                    "EndDateTime" = as.character(
                      hms::round_hms(
                        as.POSIXct(
                          procedure_end_time
                        ), 1
                      )
                    ),
                    "RScriptName" = title
  )

  DBI::dbAppendTable(conn = connection_WH,
                     name = DBI::SQL("Info.Adhoc.R_Procedures"),
                     value = log
  )

  paste("Runtime:",
        hms::round_hms(hms::as_hms(difftime(procedure_end_time,
                                            procedure_start_time)), 1)
  )

}
