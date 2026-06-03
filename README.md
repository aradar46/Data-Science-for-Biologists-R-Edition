# R for Biologists — Data Science, Bioinformatics, and Machine Learning in R

**A free, complete, executable R course covering data wrangling, statistics, machine learning with tidymodels, omics analysis, survival analysis, and reproducible bioinformatics — built on real clinical and expression datasets.**

No placeholder code. Every notebook runs. Beginner-friendly.

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
git clone https://github.com/<username>/r-for-biologists.git
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
| 8 | Survival analysis and omics integration | `course/08_multiomics_and_survival/` |
| 9 | Reproducible engineering for biologists | `course/09_reproducible_engineering/` |
| 10 | Capstone project | `course/10_capstone/` |

Each module follows a consistent structure: biological question → learning objectives → data validation → concept explanation → worked example → exercises → common mistakes → key takeaways → `sessionInfo()`.

---

## Datasets

All core modules use two fully matched, bundled datasets — no external downloads required:

| File | Description |
|---|---|
| `data/clinical.csv` | 614 breast cancer patients: treatment, follow-up time, event status |
| `data/omics.csv` | Same 614 patients: 1,691 processed microarray expression probe columns |
| `data/metabric_clinical_and_expression_data.csv` | METABRIC cohort: 1,904 patients, clinical and selected expression features |

The `clinical.csv` + `omics.csv` pair runs as the integrative project arc across Modules 7, 8, and the capstone: joining, QC, differential analysis, survival modeling, penalized regression, and reproducible reporting.

---

## Repository Structure

```
r-for-biologists/
├── course/                   11 R Markdown modules (00–10), each self-contained
├── exercises/                8 exercise sheets (Modules 1–8)
├── solutions/                Executable R Markdown solutions with explanations
├── data/                     Bundled clinical and expression datasets
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
| `survival` + `survminer` | Kaplan-Meier curves, Cox models, proportional hazards checks |
| `glmnet` | Penalized regression (elastic net, lasso) for high-dimensional omics |
| `renv` | Reproducible R environments with locked package versions |
| `here` | Portable file paths across machines and operating systems |

---

## Design Principles

This course enforces decisions that introductory courses typically skip:

- **No leakage:** preprocessing and feature selection always happen inside resampling folds or after splitting
- **No dummy data in core modules:** every advanced topic uses the bundled clinical + omics datasets
- **Censoring is handled correctly:** survival outcomes are never converted to binary logistic regression
- **Every notebook validates its data:** patient IDs are aligned explicitly before any join or model
- **Interpretation is separated from mechanism:** association ≠ causation, in-sample ≠ validated
- **Every notebook is self-contained:** each file runs independently from top to bottom with no hidden state

---

## Exercises and Solutions

`exercises/` contains 8 exercise sheets (one per module), each with 5 questions covering code tasks and written biological interpretation.

`solutions/` contains executable R Markdown solutions for Modules 1, 2, 4, 5, and 8, with annotated explanations, not just code.

---

## Capstone Project

`course/10_capstone/` contains:

- **`10_capstone_brief.Rmd`** — project scope, required analysis sections, and grading rubric
- **`10_capstone_starter.Rmd`** — parameterized starter notebook with required section scaffolding and code stubs

---

## References

- [R for Data Science, 2nd edition](https://r4ds.hadley.nz/) — Wickham, Çetinkaya-Rundel, Grolemund
- [tidymodels documentation](https://www.tidymodels.org/)
- [Bioconductor](https://www.bioconductor.org/) — limma, DESeq2, and omics packages
- [Applied Predictive Modeling](http://appliedpredictivemodeling.com/) — Kuhn & Johnson
- [Survival Analysis: A Self-Learning Text](https://link.springer.com/book/10.1007/978-1-4419-6646-9) — Kleinbaum & Klein
- [Happy Git and GitHub for the useR](https://happygitwithr.com/) — Bryan

---

## License

Apache License 2.0. See [LICENSE](LICENSE).

## Original Course and Credits

The original Python course was developed by the Data Science Academy at AstraZeneca.
This R edition is an independent redesign that replaces all Python content with R-native, biology-centered, reproducible workflows.

Previous Python course iterations:
[2020](https://github.com/semacu/data-science-python) ·
[Jan 2021](https://github.com/semacu/202101-data-science-python) ·
[May 2021](https://github.com/semacu/202105-data-science-python) ·
[Oct 2021](https://github.com/semacu/202110-data-science-python)
