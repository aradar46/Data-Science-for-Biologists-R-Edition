# Exercises — Module 6: Biomedical Machine Learning

Work through these exercises after completing the Module 6 notebook.

---

## Exercise 6.1 — Imbalanced metrics

Load `data/clinical.csv` and split 70/30 stratified by `status`.

1. Fit a logistic regression predicting `status` from `treatment`.
2. Evaluate on the test set: accuracy, sensitivity (true event rate), specificity, and ROC-AUC.
3. A model that predicts "censored" for all patients achieves what accuracy? Is this a good model?
4. Which metric would you report to a clinician who asks "how often does the model miss a true event?"

---

## Exercise 6.2 — Elastic net with high-dimensional predictors

Join `data/clinical.csv` and `data/omics.csv`.

1. Build a tidymodels elastic net model predicting `status` using all expression probes as predictors.
2. Use a recipe that filters out near-zero-variance probes and normalizes the remaining ones.
3. Tune `penalty` and `mixture` over a 5 × 5 grid using 5-fold CV.
4. Plot the tuning results as a heatmap of ROC-AUC vs penalty and mixture.

---

## Exercise 6.3 — Random forest comparison

Using the same train/test split:

1. Fit a random forest model predicting `status` from expression probes.
2. Compare its cross-validated ROC-AUC to the elastic net from Exercise 6.2.
3. Plot variable importance for the top 20 probes.
4. Write one sentence for each probe explaining why high importance does not mean the probe causes the outcome.

---

## Exercise 6.4 — Grouped resampling

Suppose each patient has two samples (imagine the dataset were duplicated with slight noise).

1. Explain why standard random CV would leak patient-level information.
2. Demonstrate `group_vfold_cv()` from rsample using `patientID` as the grouping variable.
3. How do the CV AUC estimates change compared to random CV?

---

## Exercise 6.5 — Model card

Write a model card (plain text or markdown) for the elastic net model from Exercise 6.2. Include:

1. Model purpose and intended use.
2. Training data description (size, event rate, features).
3. Performance metrics on the test set.
4. Known limitations (sample size, biological interpretation, generalisability).
5. What should not be done with this model.
