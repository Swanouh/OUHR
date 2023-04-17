#' Previous Month
#'
#' @param date A date.
#'
#' @return The previous month of that date.
#' @export
#'
#' @examples previous_month(Sys.Date())
#' previous_month(as.Date("2023-03-28"))
previous_month <- function(date){
  first_of_month(date) - 1
}
