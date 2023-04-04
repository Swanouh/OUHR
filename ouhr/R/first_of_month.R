#' First of the Month
#'
#' Finding the first of the month of a given date.
#'
#' @param x A date.
#'
#' @return The first of the month in YYYY-MM-DD format.
#' @export
#'
#' @examples first_of_month(Sys.Date())
#' first_of_month(as.Date("2023-03-28"))

first_of_month <- function(x) {
  as.Date(format(x, "%Y-%m-01"))
}
