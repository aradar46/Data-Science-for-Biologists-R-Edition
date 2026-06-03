# Exercises — Module 4: Statistical Reasoning and Experimental Design

Work through these exercises after completing the Module 4 notebook.

---

## Exercise 4.1 — Simulation: sampling variability

1. Simulate 1,000 samples of size n = 20 from a Normal(0, 1) distribution.
2. For each sample, compute the sample mean.
3. Plot the distribution of sample means. What shape does it have?
4. Now repeat with n = 5 and n = 100. How does spread change?

---

## Exercise 4.2 — Confidence intervals

Load `data/clinical.csv`.

1. Compute a 95 % confidence interval for the mean follow-up time using `t.test()`.
2. Repeat for each treatment group separately.
3. Plot the two group means and their 95 % CIs using `ggplot2`.
4. Do the intervals overlap? What does that tell you?

---

## Exercise 4.3 — Multiple testing

A collaborator tests 500 probes for association with treatment and finds 30 with p < 0.05.

1. Under the null hypothesis (no real associations), how many false positives would you expect among 500 tests at α = 0.05?
2. Apply Bonferroni correction: what is the new threshold?
3. Apply Benjamini-Hochberg FDR at 5 %. If 30 p-values are below 0.05, approximately how many do you expect to be false positives?
4. Write two sentences explaining to a non-statistician why p < 0.05 is not enough for omics results.

---

## Exercise 4.4 — Linear model interpretation

Using `data/clinical.csv`:

1. Fit a linear model: `time ~ treatment`. Interpret the intercept and slope.
2. Is this the right model for follow-up time? What assumption does ordinary linear regression make that is violated here?
3. Suggest a better approach and name the R package and function you would use.

---

## Exercise 4.5 — Effect sizes

Pick any two numeric columns from the dataset (not time or status).

1. Compute Cohen's d for the difference between treatment groups.
   Formula: d = (mean_A - mean_B) / pooled_SD.
2. Interpret: is the effect small (< 0.2), medium (0.2–0.5), or large (> 0.8)?
3. A colleague says "the p-value is 0.001, so the effect is large." Write a one-paragraph rebuttal.
