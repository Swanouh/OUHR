#' First of the Month
#'
#' Finding the first of the month of a given date.
#'
#' @param date A date.
#'
#' @return The first of the month in YYYY-MM-DD format.
#' @export
#'
#' @examples first_of_month(Sys.Date())
#' first_of_month(as.Date("2023-03-28"))

first_of_month <- function(date) {
  as.Date(format(date, "%Y-%m-01"))
}
