#' Last Sunday
#'
#' @param date A date.
#'
#' @return The last Sunday before the given date.
#' @export
#'
#' @examples last_sunday(Sys.Date())
last_sunday <- function(date){
  lubridate::floor_date(date)
  }
