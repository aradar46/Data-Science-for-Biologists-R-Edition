# Exercises — Module 8: RNA-seq Analysis

Work through these exercises after completing the Module 8 notebook.

---

## Exercise 8.1 — Count-based vs. Continuous distributions

Explain why running a standard linear model (like `limma`) directly on raw RNA-seq integer count data is statistically inappropriate. What are the two major assumptions of linear models that raw integer counts violate, and how does the Negative Binomial distribution address these issues?

---

## Exercise 8.2 — Manual calculation of size factors

Using the raw count table `data/rnaseq_counts_filtered.csv`:

1. Write R code to manually compute the size factors for the 6 samples using the *median-of-ratios* method described in the text:
   - Calculate the geometric mean for each gene across all samples (filtering out genes with a geometric mean of 0).
   - Divide each gene's raw count by its geometric mean to get the ratio.
   - For each sample, compute the median ratio across all genes.
2. Compare your manual size factors with the output of `DESeq2::sizeFactors(dds)`. Are they identical?
3. Plot your manual size factors against the column sums of the raw counts. Explain the relationship.

---

## Exercise 8.3 — Differential expression parameters

In Module 8, we extracted results using `results(dds, alpha = 0.05)`.

1. Run the analysis again but set the FDR threshold `alpha` to `0.10`. How does this change the number of significant up- and down-regulated genes?
2. By default, `results()` performs independent filtering to remove genes with low average counts. Disable this by setting `independentFiltering = FALSE`. How many genes are now tested, and how does it impact the number of significant genes after FDR correction? Why does testing genes with low counts decrease overall power?
3. What is the difference between setting `lfcThreshold = 1` in `results()` vs. filtering the final results table by `abs(log2FoldChange) > 1` post-hoc? Run both and report the numbers.

---

## Exercise 8.4 — Visualizing top gene expressions

1. Select the top 4 most significantly differentially expressed genes (by adjusted p-value).
2. Write R code using `ggplot2` to plot the normalized expression levels for each of these 4 genes across the two groups (`day00` and `day07`). Use `geom_jitter()` or `geom_boxplot()` to display the individual replicates.
3. Scale the y-axis to a logarithmic scale (`scale_y_log10()`) and explain why this is helpful for visualizing expression across replicates.

---

## Exercise 8.5 — Pathway enrichment and comparison

1. Extract the list of significant *down-regulated* genes (adjusted p-value < 0.05, log2 fold change < -1).
2. Run over-representation analysis (ORA) using `enrichR` with the `GO_Biological_Process_2023` database.
3. Compare the top 5 down-regulated pathways with the top 5 up-regulated pathways. What biological processes are shut down in the colon during DSS-induced colitis, and which processes are activated?
4. Look at the GSEA results table. What is the interpretation of a negative Normalized Enrichment Score (NES)? Identify one Hallmark pathway that is significantly down-regulated.
