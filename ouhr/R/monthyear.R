#' Getting the Month and Year of a Date
#'
#' @param date A date.
#' @param type Either "`abb`", "`full`" or "`num`" to determine how month should
#'  appear.
#'
#' @return A string of the month and year of a date.
#' @export
#'
#' @examples monthyear(as.Date("2023-11-28"), "abb")
#' monthyear(as.Date("2023-11-28"), "full")
#' monthyear(as.Date("2023-11-28"), "num")

monthyear <- function(date, type){
  if(type == "abb"){
    month <- month.abb[lubridate::month(date)]
  }

  if(type == "full"){
    month <- month.name[lubridate::month(date)]
  }

  if(type == "num"){
    month <- month_zero(date)
  }

  year <- lubridate::year(date)

  paste(month, year)
}
