<img align="right" src="img/course_logo.png" width="180">

# Data Science for Biologists — R Edition

> A complete, R-native adaptation of the *Data Science in Python* course originally developed by the **Data Science Academy at AstraZeneca**. Every lecture, solution, and student challenge has been rewritten from the ground up using **R**, **tidyverse**, and **tidymodels** — no Python required.

---

## Background & Motivation

The original course — *Data Science in Python* — was a 7-week training programme run by the Data Science Academy, AstraZeneca (Cambridge, UK), covering data handling, visualisation, statistics, and machine learning through Python/pandas/scikit-learn. It was delivered multiple times between 2020 and 2022 and used a real-world breast cancer dataset (METABRIC) as the running example.

Many biologists and life scientists work primarily in R, using it for bioinformatics, statistics, and reproducible research. This repository is a **full R conversion** of that curriculum, providing the same conceptual coverage and pedagogical structure, but expressed entirely in idiomatic R:

| Original (Python) | R Equivalent |
|---|---|
| `pandas` DataFrame | `tibble` / `tidyverse` |
| `matplotlib` / `seaborn` | `ggplot2` |
| `scikit-learn` | `tidymodels` |
| Jupyter Notebook (`.ipynb`) | R Markdown (`.Rmd`) |
| `numpy` arrays | R vectors / matrices |
| `statsmodels` | `stats` / `broom` |
| `networkx` | `tidygraph` / `ggraph` |

---

## What's in This Repository

```
data-science-for-biologists-AZ/
│
├── notebooks/            ← R Markdown lecture & solution files (weeks 0–7)
│   └── week2_extra_DataVisualisation/  ← 15 supplementary ggplot2 notebooks
│
├── challenge/            ← Student project examples in R
│   ├── KatarzynaNurzynska/
│   └── RobertShaw/
│
├── data/                 ← Shared datasets used across all weeks
│   ├── metabric_clinical_and_expression_data.csv   ← Primary teaching dataset
│   ├── clinical.csv / omics.csv                    ← Week 0 challenge datasets
│   └── imagine_lyrics.txt                          ← Week 0 string exercise
│
├── img/                  ← Images used in lectures
├── render_all.R          ← Script to render all notebooks to HTML
├── LICENSE               ← Apache License 2.0
└── README.md             ← This file
```

---

## Course Structure

| Week | Topic | R Notebooks |
|:----:|-------|-------------|
| **0** | R basics, functions, I/O | `week0_lecture.Rmd`, `week0_solutions.Rmd`, `week0_challenge.Rmd`, `week0_materials.Rmd` |
| **1** | Data handling with tidyverse | `week1_lecture.Rmd`, `week1_solutions.Rmd` |
| **2** | Data visualisation with ggplot2 | `week2_lecture.Rmd` + 15 extra notebooks in `week2_extra_DataVisualisation/` |
| **3** | Key concepts in statistics & ML | `week3_lecture.Rmd` *(theory, no code)* |
| **4** | Statistical tests & linear modelling | `week4_lecture.Rmd`, `week4_solution.Rmd` |
| **5** | Machine Learning part 1 (regression) | `week5_lecture.Rmd`, `week5_lecture_2.Rmd`, `week5_solutions.Rmd`, `week5_solutions_2.Rmd` |
| **6** | Machine Learning part 2 (classification, random forests) | `week6_lecture.Rmd`, `week6_solutions.Rmd` |
| **7** | Networks, graphs & METABRIC case study | `week7_lecture.Rmd`, `week7_Metabric_data_analysis.Rmd` |

### Supplementary ggplot2 Notebooks (Week 2 Extra)

A series of focused notebooks covering advanced `ggplot2` topics:
line plots, scatter plots, error bars, density plots, histograms, legends, colourbars, multi-panel layouts, text annotation, tick customisation, themes, 3D plotting, geographic data, advanced statistical visualisation, and further resources.

---

## Primary Dataset — METABRIC

The **Molecular Taxonomy of Breast Cancer International Consortium (METABRIC)** dataset is used as the running example throughout the course. It contains clinical variables and gene expression data for ~1,900 breast cancer patients.

> Source: [Pereira et al., *Nature Communications*, 2016](https://www.nature.com/articles/ncomms11479)

The dataset is located at `data/metabric_clinical_and_expression_data.csv`.

---

## Getting Started

### Prerequisites

You need **R** (≥ 4.1) and **RStudio** installed.

1. **Install R:** [https://cran.r-project.org/](https://cran.r-project.org/)
2. **Install RStudio:** [https://posit.co/download/rstudio-desktop/](https://posit.co/download/rstudio-desktop/)

### Install Required Packages

Open RStudio and run the following once:

```r
install.packages(c(
  "tidyverse", "tidymodels", "broom", "ggpubr", "GGally",
  "ranger", "vip", "rpart", "palmerpenguins",
  "tidygraph", "ggraph", "visNetwork",
  "survival", "survminer", "factoextra",
  "AER", "corrplot", "cluster", "writexl",
  "maps", "scales"
))
```

### Clone the Repository

```bash
git clone https://github.com/YOUR-USERNAME/data-science-for-biologists-AZ.git
cd data-science-for-biologists-AZ
```

### Open and Run a Notebook

1. Open RStudio
2. Navigate to `notebooks/`
3. Open any `.Rmd` file (e.g., `week1_lecture.Rmd`)
4. Click **Knit** to render it to HTML, or run chunks interactively

### Render All Notebooks at Once

```r
source("render_all.R")
```

---

## Student Challenges

The `challenge/` folder contains real student project submissions that were adapted to R. These demonstrate how to apply course concepts to custom datasets:

- **KatarzynaNurzynska** — METABRIC survival and subtype analysis (`week8_Metabric_data_analysis.Rmd`)
- **RobertShaw** — Particle size data processing and reporting (`G3_example_DEMO.Rmd`)

---

## License

This project is licensed under the **Apache License 2.0** — see the [LICENSE](LICENSE) file for full terms.

You are free to use, modify, and distribute this material, including for commercial training, as long as you retain the licence notice and document any changes you make.

---

## Original Course & Credits

The R conversion is based on the *Data Science in Python* course by the **Data Science Academy, AstraZeneca**:

- **Original trainers:** Gabriella Rustici, Sergio Martínez Cuesta, Leo Souliotis, Katarzyna Nurzynska, Michał Oziębło, Daniel Roythorne, Samuel Lewis, Caterina Darcy
- **Previous course iterations:**
  - [June–July 2020](https://github.com/semacu/data-science-python)
  - [January–February 2021](https://github.com/semacu/202101-data-science-python)
  - [May–June 2021](https://github.com/semacu/202105-data-science-python)
  - [October–November 2021](https://github.com/semacu/202110-data-science-python)

**Further references:**

- [CRUK-CI Introduction to R course](https://bioinformatics-core-shared-training.github.io/r-intro/)
- [tidyverse documentation](https://www.tidyverse.org/)
- [tidymodels documentation](https://www.tidymodels.org/)
- [ggplot2 documentation](https://ggplot2.tidyverse.org/)
- [R for Data Science (2nd ed.)](https://r4ds.hadley.nz/) — Wickham, Çetinkaya-Rundel & Grolemund
