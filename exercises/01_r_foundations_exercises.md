# Exercises — Module 1: R Foundations for Biological Data

Work through these exercises after completing the Module 1 notebook.
Write your answers in an R script or a new `.Rmd` file.

---

## Exercise 1.1 — Vectors and factors

A colleague shares the following gene expression classifications for 10 samples:

```
"high", "low", "medium", "high", "high", "low", "medium", "low", "high", "medium"
```

1. Create this as a character vector named `expr_class`.
2. Convert it to a factor with levels ordered `"low"`, `"medium"`, `"high"`.
3. Print the factor. What levels are shown?
4. Count how many samples are in each class using `table()`.

---

## Exercise 1.2 — Tibbles and data types

Create a tibble with the following 5 patients:

| patientID | age | treatment | response |
|-----------|-----|-----------|----------|
| pt001 | 52 | A | TRUE |
| pt002 | 67 | B | FALSE |
| pt003 | 45 | A | TRUE |
| pt004 | 58 | B | TRUE |
| pt005 | 71 | A | FALSE |

1. Check the class of each column with `sapply(df, class)`.
2. Convert `treatment` to a factor.
3. Filter the tibble to keep only patients older than 55 who received treatment A.

---

## Exercise 1.3 — File reading

Download or locate a CSV file with at least 3 columns. Read it into R with `read_csv()`.

1. Print the column names.
2. Print the number of rows.
3. Select only the numeric columns and print the first 5 rows.

If you do not have a ready file, use `data/clinical.csv` from this project.

---

## Exercise 1.4 — Functions

Write a function `summarise_vector(x)` that:

1. Returns a named list with: `n`, `mean`, `sd`, `min`, `max`, and `n_missing`.
2. Works correctly if `x` contains `NA` values (use `na.rm = TRUE` where needed).
3. Test it on a vector of 20 random normal values where you manually set 3 values to `NA`.

---

## Exercise 1.5 — String work with biological identifiers

Given this vector of probe identifiers:

```r
probes <- c("200008_s_at", "200052_s_at", "1405_i_at", "200600_at", "200604_s_at")
```

1. How many probes contain the substring `"_s_at"`?
2. Extract the numeric prefix from each probe ID (the digits before the first underscore). Hint: use `stringr::str_extract()`.
3. Sort the probes alphabetically.
