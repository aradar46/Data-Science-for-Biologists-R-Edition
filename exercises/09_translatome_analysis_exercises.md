# Exercises - Module 9: Translatome Analysis

Work through these exercises after completing the Module 9 notebook.

---

## Exercise 9.1 - Verify paired sample order

The translatome workflow only works if total RNA and polysome RNA columns describe the same biological samples in the same order.

1. Recreate `total_metadata` and `polysome_metadata` from `sample_metadata`.
2. Confirm that `pair_id` is identical between the two tables.
3. Intentionally sort one table by `raw_column` in descending order and show that the identity check fails.
4. Explain why a mismatch would invalidate `anota2seq`, even if the count matrices have the same dimensions.

---

## Exercise 9.2 - Library size and zero-count diagnostics

Use `dataT` and `dataP` from the tutorial.

1. Calculate library sizes separately for total RNA and polysome RNA.
2. Plot total RNA library size against polysome RNA library size for each paired replicate.
3. Count how many genes are zero in all total RNA samples, all polysome RNA samples, or both.
4. Write a short interpretation: are zero-count genes biological absences, technical limitations, or both?

---

## Exercise 9.3 - Naive translational efficiency score

The tutorial warns against using a naive `log2(polysome / total)` score as the main statistical test.

1. Compute log-CPM for `dataT_filtered` and `dataP_filtered`.
2. Calculate `te_score = log_cpm(dataP_filtered) - log_cpm(dataT_filtered)`.
3. For each gene, compute the mean TE score in `shERa` and `shCtrl`, then calculate `delta_te`.
4. List the top 10 genes by absolute `delta_te`.
5. Explain why this list is useful for exploration but not enough for a rigorous translatome claim.

---

## Exercise 9.4 - Interpret regulation modes

After running `anota2seqRun()`, use the `reg_modes` table.

1. Count genes by `singleRegMode`.
2. Select one gene labeled as `translation`, one as `buffering`, and one as mRNA abundance if available.
3. For each selected gene, compare total RNA fold change, translated RNA fold change, effect size, and adjusted p-value.
4. Write one sentence per gene using cautious language. Avoid claiming a molecular mechanism unless the analysis directly supports it.

---

## Exercise 9.5 - Tighten the FDR threshold

The tutorial uses `maxPAdj = 0.15` as an exploratory threshold.

1. Re-run the workflow using `maxPAdj = 0.05`.
2. Compare the number of genes in each regulation mode with the original threshold.
3. Which modes are most sensitive to the stricter cutoff?
4. Explain the tradeoff between exploratory sensitivity and confirmatory stringency.
