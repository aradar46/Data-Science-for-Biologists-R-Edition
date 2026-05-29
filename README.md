<img align="right" src="img/course_logo.png" width="180">

# Data Science for Biologists — R Edition

This repository is being rebuilt into a rigorous, biology-centered data science course in R. The current material contains useful lectures and datasets, but the course is under active redesign because the old structure is too notebook-like, the advanced tracks are too shallow, and several lessons use placeholder or non-executable examples.

The redesign plan is documented in [project_detail/00_course_audit_and_redesign_plan.md](project_detail/00_course_audit_and_redesign_plan.md).

## Course Goal

The target learner is a biologist or life scientist who wants to analyze clinical, tabular, and omics data with defensible statistical and machine learning workflows.

By the end of the redesigned course, learners should be able to:

- turn a biological question into an analysis plan,
- validate and join clinical and omics datasets,
- visualize biological data clearly,
- choose appropriate statistical tests and models,
- build leakage-safe predictive models with `tidymodels`,
- analyze differential expression and pathway enrichment results,
- handle survival outcomes and high-dimensional omics predictors,
- produce reproducible R Markdown reports.

## Current Repository Structure

```text
data-science-for-biologists-AZ/
├── notebooks/                         Current core R Markdown notebooks, weeks 0-7
│   └── week2_extra_DataVisualisation/ Optional visualization reference notebooks
├── advanced_ml_track/                 Draft advanced ML notebooks under redesign
├── omics_track/                       Draft omics notebooks under redesign
├── engineering_track/                 Draft reproducibility notebooks under redesign
├── data/                              Shared teaching datasets
├── img/                               Images used in existing lectures
├── project_detail/                    Audit, redesign, and notebook standards
├── scripts/                           Dependency and validation scripts
├── templates/                         New notebook template
├── render_all.R                       Render all R Markdown notebooks
└── README.md
```

## Main Teaching Datasets

The course currently includes:

- `data/metabric_clinical_and_expression_data.csv`: METABRIC clinical and selected expression features for 1,904 breast cancer patients.
- `data/clinical.csv`: survival data for 614 breast cancer patients.
- `data/omics.csv`: microarray expression data for the same 614 patients, with 1,691 probe columns.
- `data/imagine_lyrics.txt` and `data/programming.txt`: small text files for early R/string exercises.

The redesigned capstone will use `clinical.csv` plus `omics.csv` as the main integrative project.

## Redesign Roadmap

The planned course structure is:

| Module | Topic | Status |
|---:|---|---|
| 0 | Orientation and scientific workflow | Added in `course/00_orientation/` |
| 1 | R foundations for biological data | Started in `course/01_r_foundations/` |
| 2 | Data wrangling and validation | Added in `course/02_data_wrangling/` |
| 3 | Visualization for biology | Added in `course/03_visualization/` |
| 4 | Statistical reasoning and experimental design | Added in `course/04_statistics/` |
| 5 | Modeling foundations with `tidymodels` | Added in `course/05_modeling_foundations/` |
| 6 | Biomedical machine learning | Added in `course/06_biomedical_ml/` |
| 7 | Omics foundations | Added in `course/07_omics_foundations/` |
| 8 | Survival, omics integration, and interpretation | New integrative module |
| 9 | Reproducible engineering for biologists | Replaces `engineering_track/` |
| 10 | Capstone | Added in `course/10_capstone/` |

## Getting Started

### Prerequisites

Install:

- R 4.1 or newer
- RStudio or another R-capable IDE

### Install Required Packages

From the repository root, run:

```r
source("scripts/install_dependencies.R")
```

The dependency script installs CRAN packages first, then Bioconductor packages. Some advanced omics packages are large, so installation can take time.

### Render Notebooks

Render every current `.Rmd` file:

```r
source("render_all.R")
render_course()
```

Run the validation script from a shell:

```bash
Rscript scripts/check_course.R
```

Rendered HTML files and `render_report.csv` are written to `rendered_notebooks/`.

Render a single notebook:

```r
source("render_all.R")
render_course("notebooks/week1_lecture.Rmd")
```

## Notebook Standard

New and rewritten notebooks should follow:

- [project_detail/01_notebook_standards.md](project_detail/01_notebook_standards.md)
- [templates/course_notebook_template.Rmd](templates/course_notebook_template.Rmd)

Core notebooks must be executable, use real course datasets for main examples, validate data before analysis, include interpretation checkpoints, and end with reproducibility information.

## Current Caveats

The repository is in transition.

- Several advanced, omics, and engineering notebooks are draft-quality.
- Some current notebooks rely on optional packages or unavailable external datasets.
- Some existing notebooks use placeholder data or `eval=FALSE`.
- The old `challenge/` folder is not present in the current working tree.

These gaps are tracked in the redesign plan.

## License

This project is licensed under the Apache License 2.0. See [LICENSE](LICENSE).

## Original Course and Credits

The original Python course was developed by the Data Science Academy at AstraZeneca.

Previous public course iterations:

- [June-July 2020](https://github.com/semacu/data-science-python)
- [January-February 2021](https://github.com/semacu/202101-data-science-python)
- [May-June 2021](https://github.com/semacu/202105-data-science-python)
- [October-November 2021](https://github.com/semacu/202110-data-science-python)

Further references:

- [R for Data Science, 2nd edition](https://r4ds.hadley.nz/)
- [tidyverse documentation](https://www.tidyverse.org/)
- [tidymodels documentation](https://www.tidymodels.org/)
- [ggplot2 documentation](https://ggplot2.tidyverse.org/)
- [Bioconductor](https://www.bioconductor.org/)
