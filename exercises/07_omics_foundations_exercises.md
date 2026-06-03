# Exercises — Module 7: Omics Foundations

Work through these exercises after completing the Module 7 notebook.

---

## Exercise 7.1 — Assay type identification

For each scenario below, state the most appropriate modeling family and explain why:

1. You receive a matrix of integer read counts per gene per sample from an RNA-seq experiment.
2. You receive a matrix of log-scaled fluorescence intensities from a microarray experiment.
3. You receive a sparse cell × gene matrix from a 10X Chromium single-cell experiment.
4. You receive a table of protein LFQ intensities with 30 % missing values from a mass spectrometry proteomics experiment.

---

## Exercise 7.2 — Sample alignment validation

Write an R function `validate_alignment(clinical, omics)` that:

1. Checks that `patientID` exists in both tables.
2. Checks that no duplicates exist in either table.
3. Checks that every clinical patient ID has a match in the omics table.
4. Returns a named list: `n_clinical`, `n_omics`, `n_matched`, `n_unmatched`.

Test it on `data/clinical.csv` and `data/omics.csv`.

---

## Exercise 7.3 — QC plots

Reproduce the PCA from Module 7.

1. Plot PC3 vs PC4. Do any patients separate from the main cloud?
2. Compute each patient's Mahalanobis distance in the first 5 PC space using `mahalanobis()`.
3. Flag patients more than 3 standard deviations above the mean Mahalanobis distance.
4. Would you automatically exclude these patients? Justify your answer.

---

## Exercise 7.4 — Differential analysis extension

In Module 7, the limma model uses `treatment_group` as the sole predictor.

1. Fit an alternative model that includes both `treatment_group` and `status_label` as additive terms.
2. How many probes are FDR-significant for the `status_label` coefficient?
3. What is the risk of including both terms if `treatment_group` and `status_label` are associated?

---

## Exercise 7.5 — Annotation caveat

The top 5 probes from the Module 7 ranked result are:

1. Look up what genes these probe IDs correspond to on the Affymetrix HG-U133A annotation or a similar platform.
2. Write a provenance note that records: platform name, annotation database, version accessed, and the date of access.
3. Explain why running pathway enrichment directly on the probe IDs without this mapping would be invalid.
