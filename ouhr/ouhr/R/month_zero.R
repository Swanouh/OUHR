#' Adding zero to month.
#'
#' @param date A date.
#'
#' @return The month in MM format.
#' @export
#'
#' @examples month_zero(Sys.Date())
#' month_zero(as.Date("2023-03-28"))
#' month_zero(as.Date("2023-11-28"))

month_zero <- function(date){
  month <- lubridate::month(date)

  if(month < 10){
    paste0("0", month)
  }else{
    paste(month)
  }
}
