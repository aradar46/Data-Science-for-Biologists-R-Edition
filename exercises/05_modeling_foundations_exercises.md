# Exercises — Module 5: Modeling Foundations with Tidymodels

Work through these exercises after completing the Module 5 notebook.

---

## Exercise 5.1 — Stratified splitting

Load `data/clinical.csv`.

1. Split the data 75/25 into training and test sets stratified by `status`.
2. Verify that the event rate is similar in both sets.
3. Why is stratification important here, and what could go wrong without it?

---

## Exercise 5.2 — Recipe with preprocessing

Build a tidymodels recipe that:

1. Treats `status` as the outcome and `treatment` and `time` as predictors.
2. Converts any nominal predictors to dummy variables.
3. Normalizes all numeric predictors to zero mean and unit variance.
4. Print a summary of the recipe with `prep()` and `juice()` to confirm preprocessing is applied.

---

## Exercise 5.3 — Resampling and metric comparison

Using the training set from Exercise 5.1:

1. Set up 5-fold cross-validation.
2. Fit a logistic regression model using `tidymodels` to predict `status`.
3. Collect metrics: accuracy, ROC-AUC, and sensitivity.
4. Why might accuracy be misleading here? Compute the proportion of events in the training set and explain.

---

## Exercise 5.4 — Leakage scenario

Consider this analysis:

> "I computed the mean expression per probe across all 614 patients, kept the 50 most variable probes, then split 80/20 and trained a random forest."

1. Identify the leakage step.
2. Explain what information from the test set is used in the pre-split step.
3. Rewrite the sequence of steps to be leakage-free.

---

## Exercise 5.5 — Final fit and test evaluation

Using any model you built above:

1. Select the best hyperparameters using `select_best()`.
2. Finalize the workflow with `finalize_workflow()`.
3. Fit to the full training set and evaluate on the test set with `last_fit()`.
4. Report the test-set AUC. Is it higher or lower than the cross-validation AUC? What explains the difference?
