test_that("read_sql works", {

  filename <- "C:/SVN/R/Testing read_sql function.sql"

  connection_OP <- DBI::dbConnect(odbc::odbc(),
                                  Driver = "SQL Server",
                                  Server = "Oxnetorbit02\\ORBITPlus", # NB: the extra \
                                  Database = "DataMarts"
                                  )

  data <- DBI::dbGetQuery(conn = connection_OP,
                          statement = read_sql(filename)
                          )

  number_rows <- nrow(data)

  number_rows_20230731 <- data %>%
    dplyr::filter(grepl("2023-07-31", DischargeDateTime)) %>%
    nrow()

  number_rows_not_20230731 <- data %>%
    dplyr::filter(!grepl("2023-07-31", DischargeDateTime)) %>%
    nrow()

  expect_equal(number_rows, 10)
  expect_equal(number_rows_20230731, 10)
  expect_equal(number_rows_not_20230731, 0)
  }
  )
