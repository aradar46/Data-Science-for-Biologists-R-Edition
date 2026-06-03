# Exercises — Module 11: Survival Analysis and Omics Integration

Work through these exercises after completing the Module 11 notebook.

---

## Exercise 11.1 — Censoring scenarios

For each patient below, explain whether they are an event or censored and at what time:

1. Patient enrolled on day 0, died on day 730.
2. Patient enrolled on day 0, still alive when study ended on day 1095.
3. Patient enrolled on day 0, moved abroad on day 400, last known alive.
4. Patient enrolled on day 0, withdrew consent on day 200.

Which of cases 2–4 are informative censoring and which are administrative censoring?

---

## Exercise 11.2 — Kaplan-Meier interpretation

Using the KM curve from Module 11:

1. Read the estimated survival probability at 2 years for each treatment group.
2. Read the estimated median survival time for each group (if reached).
3. The log-rank p-value is reported. Under what condition would a significant p-value NOT imply the treatment is effective?

---

## Exercise 11.3 — Cox model extension

Load `data/clinical.csv`.

1. Fit a Cox model with both `treatment` and `time` as predictors.
   (Note: including `time` directly violates the Cox model structure — identify the problem and correct it.)
2. Fit a Cox model with only `treatment`.
3. Test the proportional hazards assumption and interpret the Schoenfeld test result.

---

## Exercise 11.4 — Validation split for omics Cox

Using the penalized Cox from Module 11:

1. Split the cohort 70/30 stratified by event status (set seed 42).
2. Fit the elastic net Cox on the 70 % training set using `cv.glmnet`.
3. Compute the C-index on both the training set and the held-out 30 % test set.
4. Report the difference. What does this gap tell you about the in-sample C-index reported in Module 11?

---

## Exercise 11.5 — Risk group reporting

A colleague argues that the high/low risk group split shown in Module 11 is publishable evidence for a clinical biomarker.

Write a paragraph (5–8 sentences) explaining why it is not, covering:

- model overfitting,
- data-driven cutpoint selection,
- in-sample vs external validation,
- the distinction between statistical association and clinical utility.
