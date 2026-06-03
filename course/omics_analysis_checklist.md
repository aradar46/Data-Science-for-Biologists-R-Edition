# "Before You Run Any Omics Analysis" Checklist Card

This checklist compiles the key data-validation checkpoints, statistical assumptions, leakage controls, and interpretation boundaries from all modules into a single, printable reference card. Use it before finalizing, sharing, or publishing any biological data science project.

---

### 1. Data Integrity and Alignment Contract
Before joining or merging clinical metadata and molecular expression matrices:
*   [ ] **No Duplicate Identifiers:** Confirm that patient, sample, or cell IDs are unique.
    *   *R code:* `stopifnot(!anyDuplicated(clinical$patientID))`
*   [ ] **Strict Identifier Set Matching:** Confirm that the sets of IDs match exactly between the tables.
    *   *R code:* `stopifnot(base::setequal(clinical$patientID, omics$patientID))`
*   [ ] **Explicit Row Alignment:** Never assume that rows are in the same order. Slice and match them explicitly.
    *   *R code:* `omics_aligned <- omics %>% slice(match(clinical$patientID, patientID))`
*   [ ] **Post-Alignment Verification:** Verify identity match after alignment.
    *   *R code:* `stopifnot(identical(clinical$patientID, omics_aligned$patientID))`

---

### 2. Assay-Model Compatibility
Verify that the statistical model selected is appropriate for the data structure:
*   [ ] **Discrete Count Matrix (RNA-seq):** Use Negative Binomial GLMs (`DESeq2` or `edgeR`) to account for discrete counts and overdispersion. Never run linear regression on raw counts.
*   [ ] **Continuous Expression Matrix (Microarrays/Proteomics):** Use standard linear models with empirical Bayes shrinkage (`limma`). Ensure intensities are log2-scaled and approximately normal.
*   [ ] **Single-Cell Matrix (Sparsity/Zero-Inflation):** Use negative binomial models or variance-stabilizing transformation (`SCTransform` in `Seurat`) to handle dropout and count sparsity.

---

### 3. Leakage and Overfitting Control
To prevent optimistic bias in high-dimensional feature selection and validation:
*   [ ] **Unsupervised Feature Filtering:** Ensure that any filtering of low-variance or low-expression features is unsupervised (e.g., total variance, mean expression) and does not use patient outcome metadata.
*   [ ] **No Supervised Selection Before Splitting:** If selecting features based on association with outcomes, perform this step **entirely inside** cross-validation folds or on the training set only.
*   [ ] **Separation of Training & Evaluation:** Never calculate concordance indices (C-index), ROC curves, or risk-group Kaplan-Meier p-values on the same data used to select genes or fit models.
*   [ ] **Outlier Handling Documentation:** If identifying outliers (e.g., using PC3 vs PC4 or Mahalanobis distance), document the criteria, run sensitivity analyses with and without them, and never exclude them silently.

---

### 4. Survival Analysis Rigor
When modeling clinical outcomes with follow-up time:
*   [ ] **Censoring Handled Correctly:** Ensure that patients who did not experience the event are censored (`status = 0`) and contribute risk time. Do not convert survival time into a binary logistic regression.
*   [ ] **Proportional Hazards Plausibility:** Run the Schoenfeld residual test and plot residuals over time to confirm the proportional hazards assumption is met.
    *   *R code:* `ph_test <- cox.zph(fit); ggcoxzph(ph_test)`
*   [ ] **Power to Predictor Ratio:** Ensure the number of events (not the number of patients) is at least 10–15 times the number of independent clinical predictors in standard Cox regression.

---

### 5. Biological Interpretation Limits
Check your written conclusions against these boundaries:
*   [ ] **Association ≠ Causation:** Document that observed biomarker associations or Kaplan-Meier separations do not establish causal relationships (which requires randomized trials or genetic validation).
*   [ ] **Feature Identification ≠ Mechanism:** A gene selected by penalized regression is a predictor, not a validated mechanism. Acknowledge that correlation, multicollinearity, and redundant pathways may cause other active genes to be excluded.
*   [ ] **In-sample ≠ Validated:** Clearly state that any model metrics (C-index, AUC) computed on training data are optimistic and require independent cohort validation before claiming clinical value.

---

### 6. Reproducibility Entrypoint
*   [ ] **Relative Paths Only:** Ensure all file references use `here()` or relative paths. Absolutely no `setwd()` or local machine absolute paths.
*   [ ] **Locked Environment:** Commit a fresh `renv.lock` file documenting all package versions.
*   [ ] **Documented Entrypoint:** For multi-step projects, document the single command or workflow rule that reruns the pipeline from scratch.
