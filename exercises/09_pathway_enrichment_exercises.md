# Exercises — Module 9: Pathway Enrichment Analysis

Work through these exercises after completing the Module 9 notebook.

---

## Exercise 9.1 — Over-Representation Analysis (ORA) on Down-Regulated Genes

Perform Over-Representation Analysis (ORA) on the list of significant *down-regulated* genes (`sig_down`) using the `GO_Biological_Process_2023` database via `enrichR`. 

1. Query the database using `enrichr()`.
2. Extract the result table as a tibble.
3. Filter for terms with Adjusted P-value < 0.05 and sort by P-value.
4. Plot the top 10 enriched terms using a horizontal bar plot (`geom_bar(stat = "identity")` with `-log10(P.value)`).
5. Compare the biological themes of the down-regulated terms with the up-regulated terms from the main tutorial. What tissue-specific functions are lost in colitis?

---

## Exercise 9.2 — GSEA with KEGG Pathway Database

In the tutorial, we used the MSigDB Hallmark signatures. For this exercise, load the KEGG pathways database signature from the local GMT file:
`data/MSigDB_files/c2.cp.kegg.v6.2.symbols.gmt.txt`

1. Load the GMT file using the `gmtPathways()` function from the `fgsea` package.
2. Run `fgsea()` using this database and the same `ranked_vector` from the tutorial.
3. Identify the top 5 up-regulated (positive NES) and top 5 down-regulated (negative NES) KEGG pathways (filtered by `padj < 0.05`).
4. Select one significant KEGG pathway of interest and plot its running enrichment score using `plotEnrichment()`.

---

## Exercise 9.3 — ORA vs. GSEA Comparison

Compare the enrichment results for the pathway **HALLMARK_INFLAMMATORY_RESPONSE** (or its GO/KEGG equivalent) between your up-regulated ORA and your GSEA.

1. Locate the term in the `enrich_up_tb` table. What was its p-value and FDR?
2. Locate the term in the GSEA `fgsea_res_tb` table. What was its NES, p-value, and padj?
3. Discuss: Do both methods agree on its activation? Why might a pathway show significant enrichment in GSEA but not in ORA (or vice versa)?

---

## Exercise 9.4 — Impact of Gene Ranking Metrics on GSEA

Modify the gene ranking metric for GSEA to use the log2 fold change directly (`rank_score = log2FoldChange`) instead of incorporating the p-value.

1. Re-calculate the ranked vector using only `log2FoldChange` (still converting gene symbols to uppercase and resolving duplicates by selecting the lowest p-value).
2. Run `fgsea()` with the Hallmark database using this new ranking.
3. Compare the top 5 up-regulated and top 5 down-regulated pathways between this ranking and the hybrid metric ranking used in the tutorial.
4. Discuss: How do the results differ? Why is it generally safer to use a hybrid metric (combining fold change and p-value) rather than fold change alone?
