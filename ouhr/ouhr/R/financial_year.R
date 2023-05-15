#' Financial Year.
#'
#' Finding the financial year of a date.
#'
#' @param date A date.
#'
#' @return The financial year in YYYY-YYYY format.
#' @export
#'
#' @examples financial_year(Sys.Date())
#' financial_year(as.Date("2023-03-31"))
#' financial_year(as.Date("2023-04-01"))

financial_year <- function(date){

  month <- lubridate::month(date)
  year <- lubridate::year(date)

  if(month < 4){
    paste0(as.character(year - 1),
           "-",
           as.character(year)
    )
  } else{
    paste0(as.character(year),
           "-",
           as.character(year + 1)
    )
  }
}
