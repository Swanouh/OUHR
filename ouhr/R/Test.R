#' Title
#'
#' @param date Test that it works
#'
#' @return Everything you ever wanted
#' @export
#'
#' @examples  financial_year(Sys.Date())
#' financial_year(as.Date("2024-01-31"))
#' financial_year(as.Date("2024-04-01"))

R_Test  <- function(date){

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
