#' Reading .sql files
#'
#' @param filepath Filepath to the .sql file you wish to read in.
#'
#' @return The contents of the .sql file in one string.
#' @export
#'
#' @examples
#' filename <- "C:/SVN/R/Testing read_sql function.sql"
#' read_sql(filename)

read_sql <- function(filepath){
  con = file(filepath, "r")
  sql.string <- ""

  while (TRUE){
    line <- readLines(con, n = 1)

    if ( length(line) == 0 ){
      break
    }

    line <- gsub("\\t", " ", line)

    if(grepl("--",line) == TRUE){
      line <- paste(sub("--","/*",line),"*/")
    }

    sql.string <- paste(sql.string, line)
  }

  close(con)
  return(sql.string)
}
