# Exercises — Module 2: Data Wrangling and Validation

Work through these exercises after completing the Module 2 notebook.

---

## Exercise 2.1 — Missingness audit

Load `data/clinical.csv`.

1. Count missing values per column using `colSums(is.na(...))`.
2. Which columns, if any, have more than 5 % missing values?
3. Add a column `complete_case` that is `TRUE` if no clinical fields are missing for that patient.

---

## Exercise 2.2 — Duplicate detection

Load `data/omics.csv`.

1. Are there any duplicate `patientID` values?
2. Write an assertion (`stopifnot()`) that will abort the script if duplicates exist.
3. What would the consequence be if you proceeded without this check and rows 10 and 11 were accidentally duplicated?

---

## Exercise 2.3 — Safe joins

Join `data/clinical.csv` and `data/omics.csv` on `patientID`.

1. Use `inner_join()`. How many rows result?
2. Use `left_join()` with clinical as the left table. Are there any extra rows?
3. Write a check that verifies every clinical patient ID appears exactly once in the joined table.

---

## Exercise 2.4 — Grouped summaries

Using the joined clinical + omics table:

1. Compute the mean follow-up time (`time`) and event rate (`status`) per treatment group.
2. Compute the inter-quartile range of follow-up time per treatment group.
3. Report the number of patients in each combination of `treatment` and `status`.

---

## Exercise 2.5 — Reshaping

Create a small wide table:

```r
wide <- tibble(
  patientID = paste0("pt", 1:4),
  probe_A   = c(0.1, 0.4, -0.2, 0.7),
  probe_B   = c(-0.3, 0.2, 0.5, -0.1),
  probe_C   = c(0.8, -0.5, 0.3, 0.2)
)
```

1. Pivot it to long format with columns `patientID`, `probe_id`, `expression`.
2. Filter to keep only rows where `expression > 0`.
3. Pivot back to wide format. Does it match the original?
