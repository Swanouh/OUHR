#' Prescriptions SQL Query
#'
#' To create a base for a prescriptions SQL query that searches columns CATALOG_CD_DISPLAY, ORDER_MNEMONIC and ORDERED_AS_MNEMONIC in TDWH_ORH.WareHouse.ODS.d_PrescriptionOrders for all provided drugs in a specified date range. This query can then be amended before use.
#'
#' @param drugs A vector of the drugs you want to search for.
#' @param startdate A start date for the search.
#' @param enddate An end date for the search.
#'
#' @return A string containing a SQL query to look for the drugs provided within the specified date range.
#' @export
#'
#' @examples
#' drugs <- c("Berinert", "Cinryze", "Orladeyo")
#' startdate <- "2023-06-01"
#' enddate <- "2023-06-30"
#' prescriptions(drugs = drugs, startdate = startdate, enddate = enddate)

prescriptions <- function(drugs, startdate, enddate){
  # Creating empty vector
  drug_search <- c()

  # Adding drug search clause for each drug to the drug_search vector
  for(d in drugs){
    drug_search <- c(drug_search,
                     paste0("PO.CATALOG_CD_DISPLAY LIKE '%",
                            d,
                            "%' OR PO.ORDER_MNEMONIC LIKE '%",
                            d,
                            "%' OR PO.ORDERED_AS_MNEMONIC LIKE '%",
                            d,
                            "%'"
                     )
    )
  }

  # Wrangling drug search
  drug_search <- drug_search %>%
    toString() %>%
    stringr::str_replace_all(",", " OR")

  # Creating query
  query <- stringr::str_replace_all(paste("SELECT * FROM TDWH_ORH.WareHouse.ODS.d_PrescriptionOrders AS PO WHERE PO.OrderPlacedDateTime BETWEEN 'START' AND 'END' AND (DRUGS)"),
                           c("DRUGS" = drug_search,
                             "START" = startdate,
                             "END" = enddate
                           )
  )

  # Output
  return(query)
}
