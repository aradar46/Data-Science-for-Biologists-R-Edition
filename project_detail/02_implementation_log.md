# Implementation Log

## 2026-05-30

### Phase 1 Stabilization

Implemented the first stabilization pass from `00_course_audit_and_redesign_plan.md`.

Changes:

- Added `render_all.R` with `render_course()`.
- Added `scripts/check_course.R` for full render validation.
- Added `scripts/install_dependencies.R` for CRAN and Bioconductor dependencies.
- Added `DESCRIPTION` to declare project dependencies.
- Added `.gitignore` entries for rendered outputs and local R session files.
- Replaced stale `README.md` with an accurate current-state README and redesign roadmap.
- Added `templates/course_notebook_template.Rmd`.
- Added `project_detail/01_notebook_standards.md`.
- Fixed `advanced_ml_track/B1_Imbalanced_Data.Rmd` typo: `set.set()` to `set.seed()`.
- Fixed `advanced_ml_track/B2_Survival_Analysis.Rmd` Kaplan-Meier formula so it renders cleanly.

Validation:

- Installed missing local teaching dependencies: `themis`, `airway`, `apeglm`, and `EnhancedVolcano`.
- Ran `Rscript scripts/check_course.R`.
- Result: 45 notebooks rendered successfully, 0 failures.

### Phase 2 Start

Started the new course structure without deleting legacy notebooks.

Changes:

- Added `course/00_orientation/00_course_orientation.Rmd`.
- Added `course/01_r_foundations/01_r_foundations_for_biologists.Rmd`.
- Added `course/02_data_wrangling/02_data_wrangling_and_validation.Rmd`.
- Added `course/03_visualization/03_visualization_for_biology.Rmd`.
- Added `course/04_statistics/04_statistical_reasoning_and_experimental_design.Rmd`.
- Added `course/05_modeling_foundations/05_modeling_foundations_with_tidymodels.Rmd`.
- Added `course/06_biomedical_ml/06_biomedical_machine_learning.Rmd`.
- Added `course/07_omics_foundations/07_omics_foundations.Rmd`.
- Added `course/10_capstone/10_capstone_brief.Rmd`.
- Updated `render_all.R` to include the new `course/` directory.
- Added `project_detail/24_known_gaps_and_todos.md`.
- Updated `omics_track/C1_RNASeq_DESeq2.Rmd` to call `DESeq2::plotMA()` explicitly so the legacy notebook remains renderable after Module 7 introduces `limma`.

Rationale:

- The legacy notebooks remain available while the redesigned course path is built.
- Module 0 establishes the scientific workflow and data validation mindset.
- Module 1 starts replacing the old Week 0 material with a biology-centered R foundations lesson.
- Module 2 replaces the old generic data handling path with identifier validation, safe joins, missingness audits, and clinical/omics table preparation.
- Module 3 consolidates visualization around biological use cases: distributions, group comparisons, missingness, heatmaps, PCA, survival curves, and volcano-style displays.
- Module 4 replaces the old theory/test split with simulation-based statistical reasoning, effect sizes, confidence intervals, test selection, covariate adjustment, confounding checks, and multiple-testing correction.
- Module 5 replaces the old fragmented ML introduction with leakage-safe `tidymodels` workflows, train/test splitting, recipes, regression and classification metrics, threshold discussion, random forest tuning, and feature-importance cautions.
- Module 6 replaces the shallow advanced ML direction with high-dimensional omics prediction, elastic net tuning, imbalanced metric reporting, calibration checks, training-only feature filtering, SMOTE inside recipes, random forest comparison, and model-card limitations.
- Module 7 replaces the placeholder-heavy omics track with a runnable foundation module built on the bundled clinical and microarray-style expression data. It covers assay distinctions, metadata alignment, QC, PCA, high-variance heatmaps, limma-based probe association, multiple testing, confounding checks, probe annotation caveats, and real ranked probe results for downstream pathway interpretation.
- Module 10 establishes the clinical-plus-omics capstone as the spine for the course.

Compatibility impact:

- Module 7 legitimately loads `limma`, which also exports `plotMA()`.
- The legacy DESeq2 notebook previously called `plotMA()` without a namespace.
- The explicit namespace preserves the intended DESeq2 MA plot and avoids cross-notebook render ambiguity.

Documentation governance:

- The local agent instructions referenced React/Capacitor application documents that do not exist in this R course repository.
- The mismatch is now tracked in `project_detail/24_known_gaps_and_todos.md`.
- Course-specific architecture and implementation decisions remain documented in the course `project_detail/` files.

Validation:

- Rendered Module 7 directly with `render_course("course/07_omics_foundations/07_omics_foundations.Rmd")`.
- Ran `Rscript scripts/check_course.R`.
- Result: 54 notebooks rendered successfully, 0 failures.
