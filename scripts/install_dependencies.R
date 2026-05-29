cran_packages <- c(
  "AER",
  "broom",
  "cluster",
  "corrplot",
  "factoextra",
  "GGally",
  "ggpubr",
  "ggraph",
  "here",
  "knitr",
  "maps",
  "palmerpenguins",
  "ranger",
  "rmarkdown",
  "rpart",
  "rpart.plot",
  "scales",
  "survival",
  "survminer",
  "themis",
  "tidygraph",
  "tidymodels",
  "tidyverse",
  "vip",
  "visNetwork",
  "writexl"
)

bioc_packages <- c(
  "airway",
  "apeglm",
  "DESeq2",
  "EnhancedVolcano",
  "fgsea",
  "limma",
  "pheatmap"
)

install_missing_cran <- function(packages) {
  installed <- rownames(utils::installed.packages())
  missing <- setdiff(packages, installed)

  if (length(missing) == 0) {
    message("All CRAN packages are already installed.")
    return(invisible(TRUE))
  }

  message("Installing CRAN packages: ", paste(missing, collapse = ", "))
  utils::install.packages(missing, repos = "https://cloud.r-project.org")
}

install_missing_bioc <- function(packages) {
  installed <- rownames(utils::installed.packages())
  missing <- setdiff(packages, installed)

  if (length(missing) == 0) {
    message("All Bioconductor packages are already installed.")
    return(invisible(TRUE))
  }

  if (!requireNamespace("BiocManager", quietly = TRUE)) {
    utils::install.packages("BiocManager", repos = "https://cloud.r-project.org")
  }

  message("Installing Bioconductor packages: ", paste(missing, collapse = ", "))
  BiocManager::install(missing, ask = FALSE, update = FALSE)
}

install_missing_cran(cran_packages)
install_missing_bioc(bioc_packages)

message("Dependency installation complete.")
