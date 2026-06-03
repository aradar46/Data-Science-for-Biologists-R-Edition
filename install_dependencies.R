# install_dependencies.R
#
# Run this once before starting the course to install all required packages.
#
# In RStudio, open this file and click Source, or paste into the Console:
#   source("install_dependencies.R")

# ── CRAN packages ────────────────────────────────────────────────────────────
# Every package actually used across the course notebooks.

cran_packages <- c(
  "broom",       # tidy model output — Module 4, 5
  "enrichR",     # pathway enrichment analysis — Module 10
  "glmnet",      # elastic net and penalized Cox — Modules 6, 12, 14
  "here",        # portable file paths — all modules
  "knitr",       # R Markdown execution engine — all notebooks
  "matrixStats", # fast row-wise summaries — Module 9
  "patchwork",   # multi-panel plots — Module 11
  "pheatmap",    # heatmaps — Modules 3 and 8
  "ranger",      # random forest — Module 6
  "renv",        # reproducible environments — Module 13
  "rmarkdown",   # render R Markdown notebooks — all notebooks
  "scales",      # axis formatting helpers — Module 3, 7
  "Seurat",      # single-cell RNA-seq analysis — Module 11
  "survival",    # Surv(), coxph(), survfit() — Modules 12, 14
  "survminer",   # ggsurvplot() KM curves — Modules 12, 14
  "themis",      # SMOTE and imbalanced sampling — Module 6
  "tidymodels",  # ML workflows: rsample, recipes, parsnip, tune, yardstick — Modules 5, 6
  "tidyverse",   # dplyr, ggplot2, tidyr, readr, purrr, stringr — all modules
  "viridis",     # colorblind-friendly palettes — exercises and solutions
  "vip"          # variable importance plots — Module 6
)

# ── Bioconductor packages ─────────────────────────────────────────────────────
# DESeq2, fgsea, limma, and anota2seq are used in Modules 7, 8, 9, 10, and 14.

bioc_packages <- c(
  "anota2seq",   # paired total RNA / polysome RNA translatome analysis — Module 9
  "DESeq2",      # count-based differential expression — Module 8
  "fgsea",       # fast gene set enrichment analysis — Module 10
  "limma"        # linear models for microarray/continuous expression — Modules 7 and 14
)

# ── Installation logic ────────────────────────────────────────────────────────

install_if_missing <- function(packages, installer) {
  installed <- rownames(utils::installed.packages())
  missing   <- setdiff(packages, installed)
  if (length(missing) == 0) {
    message("All packages already installed.")
    return(invisible(TRUE))
  }
  message("Installing: ", paste(missing, collapse = ", "))
  installer(missing)
}

message("── Installing CRAN packages ──────────────────────────────────")
install_if_missing(
  cran_packages,
  function(pkgs) utils::install.packages(pkgs, repos = "https://cloud.r-project.org")
)

message("── Installing Bioconductor packages ─────────────────────────")
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  utils::install.packages("BiocManager", repos = "https://cloud.r-project.org")
}
install_if_missing(
  bioc_packages,
  function(pkgs) BiocManager::install(pkgs, ask = FALSE, update = FALSE)
)

message("── Done ──────────────────────────────────────────────────────")
message("All course dependencies are installed.")
message("You can now open any .Rmd file in course/ and run it chunk by chunk.")
