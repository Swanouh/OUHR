
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ouhr

<!-- badges: start -->
<!-- badges: end -->

The goal of ouhr is to provide useful functions for completing routine
procedures. This includes various functions to manipulate dates, e.g.,
finding financial years or the first of the month, functions for sending
emails and functions for creating Excel files.

## Installation

You can install the development version of ouhr like so:

``` r
devtools::install_github("AnyaJade/OUHR/ouhr")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(ouhr)
#> Loading required package: RDCOMClient

first_of_month(as.Date("2023-03-28"))
#> [1] "2023-03-01"
```

# Functions

Below is a list of all the functions currently in ouhr and a summary of
what they do.

## Date Manipulations

``` r
# A function to find the financial year of a given date
financial_year(as.Date("2023-03-28"))
#> [1] "2022-2023"
```

``` r
# A function to find the first of the month of a given date
first_of_month(as.Date("2023-03-28"))
#> [1] "2023-03-01"
```

``` r
# A function to find the date of the last Sunday before a given date
last_sunday(as.Date("2023-03-28"))
#> [1] "2023-03-28 UTC"
```

``` r
# A function to find the previous month of a given date
previous_month(as.Date("2023-03-28"))
#> [1] "2023-02-28"
```

``` r
# A function to create a string of the month and year where month can be either the full name, abbreviated or a number in MM format
monthyear(as.Date("2023-03-28"), "abb")
#> [1] "Mar 2023"
monthyear(as.Date("2023-03-28"), "full")
#> [1] "March 2023"
monthyear(as.Date("2023-03-28"), "num")
#> [1] "03 2023"
```

``` r
# A function to convert a month into "MM" format
month_zero(as.Date("2023-03-28"))
#> [1] "03"
```

## Email

``` r
# A function to create an email
email(To = "anya.ferguson@ouh.nhs.uk; EDandSupportServicesInformationTeam@oxnet.nhs.uk",
      Cc = "example@ouh.nhs.uk",
      subject = "Testing email function from OUHR package",
      body = "Testing the email function from OUHR package. <p> Please ignore this email."
      )
#> NULL
```

``` r
library(tidyverse)
#> Warning: package 'tidyverse' was built under R version 4.2.3
#> Warning: package 'tibble' was built under R version 4.2.3
#> Warning: package 'dplyr' was built under R version 4.2.3
#> Warning: package 'lubridate' was built under R version 4.2.3
#> ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
#> ✔ dplyr     1.1.2     ✔ readr     2.1.4
#> ✔ forcats   1.0.0     ✔ stringr   1.5.0
#> ✔ ggplot2   3.4.1     ✔ tibble    3.2.1
#> ✔ lubridate 1.9.2     ✔ tidyr     1.3.0
#> ✔ purrr     1.0.1     
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
#> ℹ Use the ]8;;http://conflicted.r-lib.org/conflicted package]8;; to force all conflicts to become errors
library(kableExtra)
#> Warning: package 'kableExtra' was built under R version 4.2.3
#> 
#> Attaching package: 'kableExtra'
#> 
#> The following object is masked from 'package:dplyr':
#> 
#>     group_rows

# Can also add a table to an email body, or an attachment
cars_table <- cars %>% 
  kable(booktabs = TRUE) %>% 
  kable_styling(full_width = F)

email(To = "anya.ferguson@ouh.nhs.uk; EDandSupportServicesInformationTeam@oxnet.nhs.uk",
      body = "Testing the email function from OUHR package.",
      table = cars_table,
      body2 = "The table above shows the cars dataset."
      )
#> NULL
```

``` r
# A function to create 1 of 4 emails specifically for information requests
email_info_request(type = "password",
                   To = "anya.ferguson@ouh.nhs.uk ",
                   dear = "Anya",
                   password = "test"
                   )
#> NULL
```

## Excel

``` r
# A function to save excel, with option to add a password
wb <- openxlsx::createWorkbook()

openxlsx::addWorksheet(wb, "example")

save_excel(wb = wb, 
           filename = "C:/examplewithpassword.xlsx", 
           password = "test"
           )
```

``` r
# A function to add a plot to excel
plot1 <- plot(cars)
```

<img src="man/figures/README-plot in excel-1.png" width="100%" />

``` r

wb1 <- openxlsx::createWorkbook()

openxlsx::addWorksheet(wb1, "example")

plot_excel(wb = wb1,
           sheetname = "example", 
           plot = plot1,
           plot_position = c(5, 3),
           plot_width = 10
           )
#> NULL

save_excel(wb = wb1, 
           filename = "C:/exampleplot.xlsx"
           )
```

``` r
# A function to create an excel file with data saved in only one table in only one sheet
one_table_excel(sheetname = "data", 
                data = cars, 
                filename = "C:/exampletable.xlsx", 
                column_widths = c(5, 8), 
                columns = c(1, 2)
                )
```

``` r
# A function to add one sheet per group in an excel sheet, each with one table. 
wb <- openxlsx::createWorkbook()

data <- cars %>% mutate("speed_category" = ifelse(speed <15, "Less than 15", "Greater than 15"))

group_table_excel(wb = wb1, data = data, group = speed_category, range = c("Less than 15", "Greater than 15"))

save_excel(wb = wb, 
           filename = "C:/examplegroup.xlsx"
           )
#> Warning: Workbook does not contain any worksheets. A worksheet will be added.
```

## Other

``` r
# A function to create a string of upper/lower case letters and numbers of a desired length, with option to specify a seed.
random_password(seed = 1, length = 4)
#> [1] "GNZu"
```
