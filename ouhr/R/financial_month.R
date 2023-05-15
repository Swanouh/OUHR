#' Financial Month.
#'
#' Finding the financial month of a date.
#'
#' @param date A date.
#'
#' @return The financial month, where "1" is April.
#' @export
#'
#' @examples financial_month(Sys.Date())
#' financial_month(as.Date("2023-03-31"))
#' financial_month(as.Date("2023-04-01"))

financial_month <- function(date){
  month <- lubridate::month(date)

  if(month < 4){
    fin_month <- month + 9
  }else{
    fin_month <- month - 3
  }

  print(as.character(fin_month))
}
