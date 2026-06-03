# Exercises — Module 3: Visualization for Biology

Work through these exercises after completing the Module 3 notebook.

---

## Exercise 3.1 — Distribution plot

Load `data/clinical.csv`.

1. Plot a histogram of follow-up time (`time`) coloured by event status (`status`).
2. Add a vertical dashed line at the median follow-up time.
3. Write a one-sentence caption that a biologist unfamiliar with the data could understand.

---

## Exercise 3.2 — Group comparison

Load both clinical and omics tables and join them.

1. Select any 3 probes from the expression matrix.
2. Plot their distributions side-by-side as boxplots, grouped by treatment.
3. Add individual data points as jittered dots on top of the boxes.

---

## Exercise 3.3 — Heatmap interpretation

In the Module 7 notebook, the top 30 variable probes are shown in a heatmap.

1. Reproduce that heatmap using only the 15 most variable probes.
2. Change the colour gradient from blue-white-red to viridis.
3. Write a two-sentence interpretation: what patterns do you see, and why might they not reflect biology?

---

## Exercise 3.4 — PCA plot

Reproduce the PCA from Module 7 but colour by event status (`status_label`) instead of treatment.

1. Does any separation appear along PC1 or PC2?
2. Add a `geom_text()` layer labelling the 3 most extreme outlier patients by `patientID`.
3. What would you investigate first if a patient had a PC1 score more than 3 standard deviations from the mean?

---

## Exercise 3.5 — Publication-ready figure

Choose any plot you produced in exercises 3.1 to 3.4.

1. Add a proper `labs()` block with title, subtitle, axis labels, and caption.
2. Apply `theme_classic()` or a custom theme that uses a white background and no grid lines.
3. Save the plot to `outputs/module03_exercise_figure.png` at 300 dpi using `ggsave()`.
