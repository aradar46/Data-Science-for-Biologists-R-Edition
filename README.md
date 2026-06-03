# R for Biologists - Data Science, Bioinformatics, and Machine Learning in R

**A free, hands-on R course covering data wrangling, statistics, machine learning with tidymodels, omics analysis, translatome analysis, survival analysis, and reproducible bioinformatics — built on real clinical and expression datasets.**

No placeholder code. Beginner-friendly.

---

## Getting Started

### Step 1 — Install R and RStudio (first time only)

| | Link |
|---|---|
| **R** (the language) | https://cran.r-project.org — pick your OS, download, install |
| **RStudio** (the editor) | https://posit.co/download/rstudio-desktop — free Desktop version |

### Step 2 — Get the course files

**No git?** Click the green **Code** button on GitHub → **Download ZIP** → unzip anywhere.

**Have git?**
```bash
git clone https://github.com/aradar46/Data-Science-for-Biologists-R-Edition
```

### Step 3 — Install the course packages (once)

Open RStudio. In the **Console** (bottom pane), run:

```r
install.packages("renv")
source("install_dependencies.R")
```

This installs every package the course uses. Takes a few minutes the first time. You never need to do it again.

### Step 4 — Open a notebook and start learning

In the **Files** panel (bottom-right in RStudio), go to `course/01_r_foundations/` and open `01_r_foundations_for_biologists.Rmd`.

**How to use the notebooks:**
- Each grey block is a **code chunk** — real, runnable R code
- Click inside a chunk and press **Ctrl+Enter** (Windows/Linux) or **Cmd+Enter** (Mac) to run that line
- Press **Ctrl+Shift+Enter** to run the whole chunk
- Edit the code, change values, break things — that is how you learn
- Read the text between chunks — it explains the biological reasoning behind each step

You do not need to "knit" or "render" anything to learn from this course.
Just open, read, run, edit, and experiment.

---

## Who This Is For

This course is designed for:

- **Wet-lab biologists** who analyze clinical or experimental data in R and want rigorous, reproducible workflows
- **Bioinformaticians** looking for a structured path from R foundations to omics integration and survival modeling
- **Graduate students and postdocs** in life sciences who need machine learning and statistics beyond basic tests
- **Data scientists moving into biomedical research** who need biology-specific context for modeling decisions
- **Complete beginners** who have never written R code but have data they need to analyze

---

## What You Will Learn

By the end of this course you will be able to:

- validate and join clinical and omics datasets correctly
- produce publication-ready visualizations of biological data
- choose statistical tests with justified assumptions, not guesswork
- build leakage-safe predictive models with `tidymodels` on real patient data
- run differential expression analysis with `limma` on microarray-style expression matrices
- analyze paired total RNA and polysome-associated RNA to detect translational regulation
- fit Cox proportional hazards models and penalized survival models for high-dimensional omics data
- compare clinical-only, omics-only, and combined models with an honest performance estimate
- produce fully reproducible R Markdown reports using `renv`, `here`, and documented data provenance

---

## Course Modules

| Module | Topic | Notebook |
|:---:|---|---|
| 0 | Orientation and scientific workflow | `course/00_orientation/` |
| 1 | R foundations for biological data | `course/01_r_foundations/` |
| 2 | Data wrangling and validation | `course/02_data_wrangling/` |
| 3 | Visualization for biology | `course/03_visualization/` |
| 4 | Statistical reasoning and experimental design | `course/04_statistics/` |
| 5 | Modeling foundations with tidymodels | `course/05_modeling_foundations/` |
| 6 | Biomedical machine learning | `course/06_biomedical_ml/` |
| 7 | Omics foundations | `course/07_omics_foundations/` |
| 8 | Bulk RNA-seq differential expression | `course/08_bulk_rnaseq_differential_expression/` |
| 9 | Translatome analysis with anota2seq | `course/09_translatome_analysis/` |
| 10 | Pathway enrichment analysis | `course/10_pathway_enrichment/` |
| 11 | Single-cell RNA-seq analysis | `course/11_single_cell_rnaseq/` |
| 12 | Survival analysis and omics integration | `course/12_survival_analysis_and_omics_integration/` |
| 13 | Reproducible engineering for biologists | `course/13_reproducible_engineering/` |
| 14 | Capstone project | `course/14_capstone/` |

Each module follows a consistent structure: biological question → learning objectives → data validation → concept explanation → worked example → exercises → common mistakes → key takeaways → `sessionInfo()`.

---

## Fast Path

Do not force yourself through all 15 modules linearly. Pick the route that matches your immediate goal:

- **Core data science route:** 0, 1, 2, 3, 4, 7, 13, 14
- **Bioinformatics route:** 0, 2, 4, 7, 8, 9, 10, 13, 14
- **ML/survival route:** 0, 2, 4, 5, 6, 12, 14

Each route is designed to get you from foundations to a project-ready workflow quickly.

---

## Datasets

Core modules use matched, bundled datasets:

| File | Description |
|---|---|
| `data/clinical.csv` | 614 breast cancer patients: treatment, follow-up time, event status |
| `data/omics.csv` | Same 614 patients: 1,691 processed microarray expression probe columns |
| `data/metabric_clinical_and_expression_data.csv` | METABRIC cohort: 1,904 patients, clinical and selected expression features |
| `data/rnaseq_counts_filtered.csv` | RNA-seq count matrix (Ensembl IDs) for colitis model (6 samples) |
| `data/rnaseq_metadata.csv` | Sample metadata (colitis model) |
| `data/rnaseq_mouse_genes.txt` | Gene symbol lookup table for mouse Ensembl IDs |
| `data/GSE134606_rawCounts.tsv.gz` | Paired total RNA and polysome-associated RNA counts for translatome analysis |
| `data/MSigDB_files/` | Local MSigDB pathway signatures (Hallmark, GO BP, KEGG) |
| `data/seurat_pbmc_subset.rds` | Cleaned 1,500-cell PBMC single-cell RNA-seq subset (COVID-19 vs. Control) |

The `clinical.csv` + `omics.csv` pair runs as the integrative project arc across Modules 7, 12, and 14: joining, QC, differential analysis, survival modeling, penalized regression, and reproducible reporting.

Most analyses run from bundled files. Module 10 includes optional `enrichR` examples that query online enrichment databases; the local `fgsea` examples use bundled MSigDB GMT files.

---

## Repository Structure

```
r-for-biologists/
├── course/                   15 R Markdown modules (00–14), each self-contained
├── exercises/                12 exercise sheets (Modules 1–12 where practice is assigned)
├── solutions/                Executable R Markdown solutions with explanations
├── data/                     Bundled clinical, expression, RNA-seq, and single-cell datasets
├── install_dependencies.R    Run once to install all required packages
├── renv.lock                 Pinned package versions (R 4.5.0)
└── DESCRIPTION               Package dependency declarations
```

---

## Key Packages Covered

| Package | Topic |
|---|---|
| `tidyverse` | Data wrangling, visualization, functional programming |
| `tidymodels` | Machine learning workflows, resampling, tuning |
| `limma` | Differential expression for continuous expression matrices |
| `DESeq2` | Differential expression for count-based RNA-seq matrices |
| `anota2seq` | Paired total RNA and polysome/ribosome-profiling translatome analysis |
| `Seurat` | Single-cell RNA-seq QC, dimensionality reduction, and clustering |
| `survival` + `survminer` | Kaplan-Meier curves, Cox models, proportional hazards checks |
| `glmnet` | Penalized regression (elastic net, lasso) for high-dimensional omics |
| `enrichR` + `fgsea` | Pathway enrichment analysis (over-representation and GSEA) |
| `matrixStats` | Fast row-wise summaries for omics QC and PCA |
| `pheatmap` | Clustered expression heatmaps |
| `patchwork` | Multi-panel single-cell visualizations |
| `viridis` | Colorblind-friendly heatmap palettes in exercises and solutions |
| `scales` | Formatting and transformation helpers for visualization |
| `rmarkdown` + `knitr` | Executing and rendering R Markdown notebooks |
| `renv` | Reproducible R environments with locked package versions |
| `here` | Portable file paths across machines and operating systems |

---

## Design Principles

This course enforces decisions that introductory courses typically skip:

- **No leakage:** preprocessing and feature selection always happen inside resampling folds or after splitting
- **No dummy data in core modules:** every advanced topic uses the bundled clinical + omics datasets
- **Censoring is handled correctly in survival modules:** binary simplifications are explicitly labeled as teaching examples
- **Every notebook validates its data:** patient IDs are aligned explicitly before any join or model
- **Interpretation is separated from mechanism:** association ≠ causation, in-sample ≠ validated
- **Notebook state is explicit:** inputs, assumptions, and optional online steps are labeled in the notebook itself

## Memorable Rules

- IDs before joins.
- Assay decides model.
- Split before preprocessing.
- Censored is not "no event."
- Feature importance is not mechanism.
- In-sample is not validated.

---

## Exercises and Solutions

`exercises/` contains 12 exercise sheets (one per active module), each with 4-5 questions covering code tasks and written biological interpretation.

`solutions/` contains executable R Markdown solutions for Modules 1 through 12, with annotated explanations, not just code.

---

## Omics Analysis Checklist Card

A printable quick-reference checklist is available at [`course/omics_analysis_checklist.md`](course/omics_analysis_checklist.md), compiling data-validation, assay-model compatibility, leakage control, and biological interpretation boundaries.

---

## Capstone Project

`course/14_capstone/` contains:

- **`14_capstone_brief.Rmd`** — project scope, required analysis sections, and grading rubric
- **`14_capstone_starter.Rmd`** — parameterized starter notebook with required section scaffolding and code stubs

---

## References

- [R for Data Science, 2nd edition](https://r4ds.hadley.nz/) — Wickham, Çetinkaya-Rundel, Grolemund
- [tidymodels documentation](https://www.tidymodels.org/)
- [Bioconductor](https://www.bioconductor.org/) — limma, DESeq2, and omics packages
- [Applied Predictive Modeling](http://appliedpredictivemodeling.com/) — Kuhn & Johnson
- [Survival Analysis: A Self-Learning Text](https://link.springer.com/book/10.1007/978-1-4419-6646-9) — Kleinbaum & Klein
- [Happy Git and GitHub for the useR](https://happygitwithr.com/) — Bryan
- [NBIS Bulk RNA-seq Workshop](https://github.com/NBISweden/workshop-RNAseq) — National Bioinformatics Infrastructure Sweden
- [NBIS Single-Cell RNA-seq Workshop](https://github.com/NBISweden/workshop-scRNAseq) — National Bioinformatics Infrastructure Sweden

---

## License

Apache License 2.0. See [LICENSE](LICENSE).

## Original Course and Credits

The original Python course was developed by the Data Science Academy at AstraZeneca [data-science-python-course](https://github.com/AstraZeneca/data-science-python-course). 
This R edition is an independent redesign that replaces all Python content with R-native, biology-centered, reproducible workflows. Also, other content has been added, and will be added in the future, to make the course more complete and useful.  
