
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

first_of_month(Sys.Date())
#> [1] "2023-05-01"
```

# Functions

Below is a list of all the functions currently in ouhr and a summary of
what they do.

## Date Manipulations

``` r
# A function to find the financial year of a given date
financial_year(Sys.Date())
#> [1] "2023-2024"
```

``` r
# A function to find the first of the month of a given date
first_of_month(Sys.Date())
#> [1] "2023-05-01"
```

``` r
# A function to find the date of the last Sunday before a given date
last_sunday(Sys.Date())
#> [1] "2023-05-12 UTC"
```

``` r
# A function to find the previous month of a given date
previous_month(Sys.Date())
#> [1] "2023-04-30"
```

``` r
# A function to create a string of the month and year as "MM YYYY" of a given date
monthyear(Sys.Date(), "abb")
#> [1] "May 2023"
```

``` r
# A function to convert a month into "MM" format
month_zero(Sys.Date())
#> [1] "05"
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
