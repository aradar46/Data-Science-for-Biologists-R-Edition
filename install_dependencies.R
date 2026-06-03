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
  "glmnet",      # elastic net and penalized Cox — Module 6, 8
  "here",        # portable file paths — all modules
  "ranger",      # random forest — Module 6
  "renv",        # reproducible environments — Module 9
  "scales",      # axis formatting helpers — Module 3, 7
  "survival",    # Surv(), coxph(), survfit() — Module 8, 10
  "survminer",   # ggsurvplot() KM curves — Module 8, 10
  "themis",      # SMOTE and imbalanced sampling — Module 6
  "tidymodels",  # ML workflows: rsample, recipes, parsnip, tune, yardstick — Modules 5, 6
  "tidyverse",   # dplyr, ggplot2, tidyr, readr, purrr, stringr — all modules
  "vip"          # variable importance plots — Module 6
)

# ── Bioconductor packages ─────────────────────────────────────────────────────
# limma and pheatmap are used in Modules 7 and 8.

bioc_packages <- c(
  "limma",       # linear models for microarray/continuous expression — Module 7, 8
  "pheatmap"     # heatmaps — Module 7
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
