#' Random Password Generation
#'
#' @param seed Either a number to get the same password each time or a string of
#'  "INF-ABCDE" where ABCDE are numbers. Default uses current timestamp.
#' @param length The number of characters in the password. Default is 6.
#'
#' @return A string of length specified of uppercase letters, lowercase letters
#' and numbers.
#' @export
#'
#' @examples random_password(seed = "INF-12345")
#' random_password(seed = 1, length = 4)
#' random_password(length = 8)
#' random_password()

random_password <- function(seed = as.character(as.numeric(Sys.time())),
                            length = 6) {
  if(!grepl("INF", seed)){
    set.seed(seed)
  }

  if(grepl("INF", seed)){
    set.seed(substr(seed, 5, 9))
  }

  stringi::stri_rand_strings(1, length, pattern = "[A-Za-z0-9]")
  }
