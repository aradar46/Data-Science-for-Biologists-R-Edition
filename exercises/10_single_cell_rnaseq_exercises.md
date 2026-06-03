# Exercises — Module 10: Single-Cell RNA-seq Analysis

Work through these exercises after completing the Module 10 notebook.

---

## Exercise 10.1 — Ribosomal Gene Profiling

In many single-cell datasets, ribosomal genes (which start with `RPS` or `RPL` in humans) account for a high percentage of the reads.

1. Calculate the percentage of ribosomal reads for each cell in the `pbmc` object. Save it to a metadata column named `percent_ribo`. (Hint: Use `PercentageFeatureSet()` with `pattern = "^RP[SL]"`).
2. Plot `percent_ribo` vs. `percent_mito` as a scatter plot using `FeatureScatter()`.
3. Discuss: What is the correlation? Are cells with high ribosomal percentages necessarily dead or dying?

---

## Exercise 10.2 — Granular Clustering Resolution

Adjust the clustering resolution parameter to split the cell populations into more granular subgroups.

1. Re-run `FindClusters()` on the PCA-reduced `pbmc` object, setting the `resolution` parameter to `1.2`.
2. Check the number of clusters generated. How does it compare to the default resolution of `0.5`?
3. Generate a new UMAP plot colored by these new clusters.
4. Inspect the T-cell clusters. How many T-cell sub-clusters can you distinguish now?

---

## Exercise 10.3 — NK Cells vs. T Cells Differential Expression

NK cells and T cells share many lymphoid lineage markers, but they also have distinct functional roles.

1. Perform marker identification comparing NK cells (original Cluster 6) directly against T cells (original Clusters 0, 1, and 2). (Hint: Set `ident.1 = "NK Cells"` and `ident.2 = "T Cells"`, using the cell type annotations from Section 7).
2. Filter the markers to keep only those with `p_val_adj < 0.05` and `avg_log2FC > 0.5`.
3. List the top 5 genes that are more highly expressed in NK cells than in T cells.
4. Discuss: What are the functions of these genes? Are they typical cytotoxic effector genes?

---

## Exercise 10.4 — B Cell Antiviral Response in COVID-19

Let's study the cell-type-specific response in B cells during COVID-19.

1. Subset the `pbmc` object to keep only **B Cells**.
2. Run differential expression using `FindMarkers()` comparing the `Covid` group (ident.1) vs. the `Ctrl` group (ident.2).
3. Find the top 5 up-regulated genes (highest `avg_log2FC` with `p_val_adj < 0.05`).
4. Compare these top B-cell responsive genes with the CD14+ Monocyte responsive genes from the tutorial. Do B cells and monocytes share the same interferon-stimulated gene signature, or are there cell-type-specific responses?
