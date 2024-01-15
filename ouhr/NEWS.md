# ouhr 0.3.2
* Changing `wrap_up` to use `append_sql` instead.

# ouhr 0.3.1
* Changing `append_sql()` so the column names of `data` wish to append to sql 
are used instead of the column names of `sql_table`. This will allow for 
appending a dataframe that doesn't have all the columns into SQL.

# ouhr 0.3.0
* Adding `match_data()` and `unmatched_names()`.

# ouhr 0.2.0
* Adding `append_sql()`.

# ouhr 0.1.1
* Adding `round_hms` to `wrap_up()` so fractions are not included in timestamps.

# ouhr 0.1.0
* Added a `NEWS.md` file to track changes to the package.
* Added `wrap-up.R` as part of INF-26712.
