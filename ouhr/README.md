
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
#> Downloading GitHub repo AnyaJade/OUHR@HEAD
#> xfun      (0.40   -> 0.41  ) [CRAN]
#> vctrs     (0.6.1  -> 0.6.4 ) [CRAN]
#> stringi   (1.7.12 -> 1.8.2 ) [CRAN]
#> rlang     (1.1.0  -> 1.1.2 ) [CRAN]
#> lifecycle (1.0.3  -> 1.0.4 ) [CRAN]
#> cli       (3.6.0  -> 3.6.1 ) [CRAN]
#> evaluate  (0.22   -> 0.23  ) [CRAN]
#> digest    (0.6.31 -> 0.6.33) [CRAN]
#> htmltools (0.5.4  -> 0.5.7 ) [CRAN]
#> fs        (1.6.1  -> 1.6.3 ) [CRAN]
#> cachem    (1.0.6  -> 1.0.8 ) [CRAN]
#> utf8      (1.2.3  -> 1.2.4 ) [CRAN]
#> fansi     (1.0.4  -> 1.0.5 ) [CRAN]
#> tinytex   (0.48   -> 0.49  ) [CRAN]
#> stringr   (1.5.0  -> 1.5.1 ) [CRAN]
#> bslib     (0.5.1  -> 0.6.0 ) [CRAN]
#> Rcpp      (1.0.10 -> 1.0.11) [CRAN]
#> odbc      (1.3.4  -> 1.3.5 ) [CRAN]
#> lubridate (1.9.2  -> 1.9.3 ) [CRAN]
#> dplyr     (1.1.3  -> 1.1.4 ) [CRAN]
#> Skipping 1 packages not available: RDCOMClient
#> Installing 20 packages: xfun, vctrs, stringi, rlang, lifecycle, cli, evaluate, digest, htmltools, fs, cachem, utf8, fansi, tinytex, stringr, bslib, Rcpp, odbc, lubridate, dplyr
#> Installing packages into 'C:/Users/Anya.Ferguson/AppData/Local/R/win-library/4.2'
#> (as 'lib' is unspecified)
#> package 'xfun' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'xfun'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\00LOCK\xfun\libs\x64\xfun.dll
#> to
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\xfun\libs\x64\xfun.dll:
#> Permission denied
#> Warning: restored 'xfun'
#> package 'vctrs' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'vctrs'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\00LOCK\vctrs\libs\x64\vctrs.dll
#> to
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\vctrs\libs\x64\vctrs.dll:
#> Permission denied
#> Warning: restored 'vctrs'
#> package 'stringi' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'stringi'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\00LOCK\stringi\libs\icudt69l.dat
#> to
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\stringi\libs\icudt69l.dat:
#> Invalid argument
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\00LOCK\stringi\libs\x64\stringi.dll
#> to
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\stringi\libs\x64\stringi.dll:
#> Permission denied
#> Warning: restored 'stringi'
#> package 'rlang' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'rlang'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\00LOCK\rlang\libs\x64\rlang.dll
#> to
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\rlang\libs\x64\rlang.dll:
#> Permission denied
#> Warning: restored 'rlang'
#> package 'lifecycle' successfully unpacked and MD5 sums checked
#> package 'cli' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'cli'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\00LOCK\cli\libs\x64\cli.dll
#> to C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\cli\libs\x64\cli.dll:
#> Permission denied
#> Warning: restored 'cli'
#> package 'evaluate' successfully unpacked and MD5 sums checked
#> package 'digest' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'digest'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\00LOCK\digest\libs\x64\digest.dll
#> to
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\digest\libs\x64\digest.dll:
#> Permission denied
#> Warning: restored 'digest'
#> package 'htmltools' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'htmltools'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\00LOCK\htmltools\libs\x64\htmltools.dll
#> to
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\htmltools\libs\x64\htmltools.dll:
#> Permission denied
#> Warning: restored 'htmltools'
#> package 'fs' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'fs'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\00LOCK\fs\libs\x64\fs.dll
#> to C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\fs\libs\x64\fs.dll:
#> Permission denied
#> Warning: restored 'fs'
#> package 'cachem' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'cachem'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\00LOCK\cachem\libs\x64\cachem.dll
#> to
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\cachem\libs\x64\cachem.dll:
#> Permission denied
#> Warning: restored 'cachem'
#> package 'utf8' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'utf8'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\00LOCK\utf8\libs\x64\utf8.dll
#> to
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\utf8\libs\x64\utf8.dll:
#> Permission denied
#> Warning: restored 'utf8'
#> package 'fansi' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'fansi'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\00LOCK\fansi\libs\x64\fansi.dll
#> to
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\fansi\libs\x64\fansi.dll:
#> Permission denied
#> Warning: restored 'fansi'
#> package 'tinytex' successfully unpacked and MD5 sums checked
#> package 'stringr' successfully unpacked and MD5 sums checked
#> package 'bslib' successfully unpacked and MD5 sums checked
#> package 'Rcpp' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'Rcpp'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\00LOCK\Rcpp\libs\x64\Rcpp.dll
#> to
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\Rcpp\libs\x64\Rcpp.dll:
#> Permission denied
#> Warning: restored 'Rcpp'
#> package 'odbc' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'odbc'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\00LOCK\odbc\libs\x64\odbc.dll
#> to
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\odbc\libs\x64\odbc.dll:
#> Permission denied
#> Warning: restored 'odbc'
#> package 'lubridate' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'lubridate'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\00LOCK\lubridate\libs\x64\lubridate.dll
#> to
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\lubridate\libs\x64\lubridate.dll:
#> Permission denied
#> Warning: restored 'lubridate'
#> package 'dplyr' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'dplyr'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\00LOCK\dplyr\libs\x64\dplyr.dll
#> to
#> C:\Users\Anya.Ferguson\AppData\Local\R\win-library\4.2\dplyr\libs\x64\dplyr.dll:
#> Permission denied
#> Warning: restored 'dplyr'
#> 
#> The downloaded binary packages are in
#>  C:\Users\Anya.Ferguson\AppData\Local\Temp\Rtmpwd5yve\downloaded_packages
#> ── R CMD build ─────────────────────────────────────────────────────────────────
#>          checking for file 'C:\Users\Anya.Ferguson\AppData\Local\Temp\Rtmpwd5yve\remotes43441a391e5f\AnyaJade-OUHR-0440e98\ouhr/DESCRIPTION' ...     checking for file 'C:\Users\Anya.Ferguson\AppData\Local\Temp\Rtmpwd5yve\remotes43441a391e5f\AnyaJade-OUHR-0440e98\ouhr/DESCRIPTION' ...   ✔  checking for file 'C:\Users\Anya.Ferguson\AppData\Local\Temp\Rtmpwd5yve\remotes43441a391e5f\AnyaJade-OUHR-0440e98\ouhr/DESCRIPTION' (1.5s)
#>       ─  preparing 'ouhr': (414ms)
#>    checking DESCRIPTION meta-information ...  ✔  checking DESCRIPTION meta-information
#>       ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#>   ─  building 'ouhr_0.3.1.tar.gz'
#>      
#> 
#> Installing package into 'C:/Users/Anya.Ferguson/AppData/Local/R/win-library/4.2'
#> (as 'lib' is unspecified)
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

- `financial_month()` for getting the financial month from a date.
- `financial_year()` for getting the Financial Year from a date.
- `first_of_month()` for getting the First of the Month from a date.
- `last_sunday()` for getting the Last Sunday from a date.
- `monthyear()` for getting the Month and Year from a date in 1 of 3
  formats.
- `month_zero()` for adding a zero to month.
- `previous_month()` for Previous Month from a date.

## Email

- `email()` for creating an Email.
- `email_info_request()` for creating emails for info requests.

## Excel

- `delete_all_excel()` for deleting existing data from an Excel sheet.
- `group_table_excel()` for adding one sheet and table per group to
  Excel.
- `one_table_excel()` for creating and Excel file with one table.
- `plot_excel()` for adding a plot to Excel.
- `save_excel()` for saving an Excel File with optional password.

## SQL

- `append_sql()` for appending data to SQL.
- `match_data()` for matching data.
- `prescriptions()` for writing a prescriptions SQL query.
- `read_sql()` for reading .sql files.
- `unmatched_names()` for finding unmatched names.

## Other

- `random_password()` for generating random strings.
- `wrap_up()` for wrap up of scripts.
