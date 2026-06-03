# Data Science for Biologists — R Edition

**A complete, executable R curriculum for biologists and life scientists learning data science, statistical modeling, machine learning, and omics analysis.**

Built on real breast cancer datasets. Every notebook runs. No placeholder code.

---

## Never Opened RStudio Before? Start Here

You do not need any prior programming experience to begin. Follow these four steps once and you are ready.

### Step 1 — Install R

R is the programming language this course uses.

1. Go to **https://cran.r-project.org/**
2. Click your operating system (Windows / macOS / Linux)
3. Download and run the installer
4. Accept all defaults

### Step 2 — Install RStudio

RStudio is the application you will write R code in (like Word is to text, RStudio is to R).

1. Go to **https://posit.co/download/rstudio-desktop/**
2. Download the free **RStudio Desktop** version
3. Install it

### Step 3 — Get the course files

**Option A — Download as a ZIP (no git required)**

1. Click the green **Code** button at the top of this GitHub page
2. Click **Download ZIP**
3. Unzip the folder somewhere you can find it (e.g. your Desktop)

**Option B — Clone with git (if you have git installed)**

```bash
git clone https://github.com/<username>/data-science-for-biologists-AZ.git
```

### Step 4 — Open RStudio and set up the course

1. Open RStudio
2. Click **File → Open Project** (or **File → Open File** and navigate to the unzipped folder)
3. In the **Console** pane at the bottom, paste these two lines and press Enter:

```r
install.packages("renv")
renv::restore()
```

This will install all required packages automatically. It takes a few minutes the first time.

### Step 5 — Open your first notebook

1. In the **Files** panel (bottom-right), navigate to `course/01_r_foundations/`
2. Click `01_r_foundations_for_biologists.Rmd`
3. Click the **Knit** button at the top of the editor
4. A rendered document will appear — you are ready to start

> **If you see a yellow bar asking to install packages**, click **Install**. If anything looks broken, run `renv::restore()` again in the Console.

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
data-science-for-biologists-AZ/
├── course/          11 R Markdown modules (00–10), each self-contained
├── exercises/       8 exercise sheets (Modules 1–8) in Markdown
├── solutions/       Executable R Markdown solutions with explanations
├── data/            Bundled clinical and expression datasets
├── scripts/         install_dependencies.R, check_course.R
├── render_all.R     Renders all notebooks from the command line
├── renv.lock        Pinned package versions (R 4.5.0)
└── DESCRIPTION      Declared project dependencies
```

---

## Getting Started (for experienced R users)

### Restore the exact R environment

```r
install.packages("renv")
renv::restore()
```

### Render a single notebook

```r
source("render_all.R")
render_course("course/01_r_foundations/01_r_foundations_for_biologists.Rmd")
```

### Validate all notebooks

```bash
Rscript scripts/check_course.R
```

All 17 notebooks (12 course + 5 solutions) render with zero failures.

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
- **Every notebook renders from a clean R session:** confirmed by automated render check

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
