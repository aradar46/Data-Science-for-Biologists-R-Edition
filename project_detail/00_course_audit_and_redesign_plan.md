# Course Audit and Redesign Plan

## Purpose

This document audits the current `Data Science for Biologists - R Edition` repository and defines a plan to reorganize it into a rigorous, executable, biology-centered data science course.

The current course has useful raw material, especially the METABRIC clinical dataset, the Week 0 to Week 7 scaffold, and the recently added `advanced_ml_track/`, `omics_track/`, and `engineering_track/` folders. However, the course is not yet coherent enough to support serious learner progression. The advanced tracks are too narrow, too shallow, and often non-executable. The core notebooks also lack a consistent teaching pattern, reproducibility contract, assessment model, and biological project arc.

## Repository State Observed

Audit date: 2026-05-30.

Observed structure:

- `README.md`
- `notebooks/`
- `notebooks/week2_extra_DataVisualisation/`
- `advanced_ml_track/`
- `omics_track/`
- `engineering_track/`
- `data/`
- `img/`

Important repository condition:

- `project_detail/` was missing before this audit, despite the local agent instructions requiring it.
- `README.md` refers to `render_all.R`, but `render_all.R` is currently deleted in the working tree.
- `README.md` refers to a `challenge/` folder and student submissions, but those files are currently deleted in the working tree.
- `advanced_ml_track/`, `omics_track/`, and `engineering_track/` are currently untracked in git.
- The local R environment has `rmarkdown`, `knitr`, `tidyverse`, `tidymodels`, `DESeq2`, `fgsea`, `limma`, `survival`, `survminer`, `ranger`, `vip`, and `renv`.
- The local R environment does not currently have `themis`, `airway`, or `Seurat`, which are required by current track notebooks.

## High-Level Verdict

The current course is a converted notebook collection, not yet a high-quality course.

The biggest issue is not that topics are missing in isolation. The bigger issue is that the course lacks a coherent spine:

- no explicit competency map,
- no learner progression from biological question to analysis decision,
- no reproducible environment,
- no executable validation workflow,
- no consistent notebook template,
- no capstone project scaffold,
- no assessment rubrics,
- no strong bridge between statistics, machine learning, omics, and engineering,
- no clear separation between core lessons, extensions, exercises, solutions, and projects.

The course should be rebuilt around biological data science workflows rather than around isolated packages.

## Critical Findings

### 1. Course identity is unclear

`README.md` says the course is a complete R-native adaptation of a Python course. That is not an adequate identity for a best-in-class course. A top course for biologists should be framed around practical scientific decisions:

- What is the biological question?
- What data type do we have?
- What assumptions are being made?
- What preprocessing is valid?
- What model is appropriate?
- What can and cannot be concluded?
- How is the analysis made reproducible?

Current content often teaches package operations before teaching the scientific decision being made.

### 2. The advanced tracks are too narrow and shallow

`advanced_ml_track/` currently contains only:

- imbalanced data,
- survival analysis,
- elastic net.

This misses essential advanced ML competencies for biological data:

- leakage prevention,
- nested cross-validation,
- preprocessing inside resampling,
- class probability calibration,
- threshold selection,
- ROC/PR tradeoffs,
- model comparison,
- uncertainty,
- explainability limits,
- high-dimensional validation,
- batch effects,
- confounding,
- grouped and patient-level splits,
- model reporting.

`B1_Imbalanced_Data.Rmd` also has a code defect: `set.set(123)` should be `set.seed(123)`.

`B3_Advanced_Predictive_Modeling.Rmd` defines an elastic net model but never builds a real dataset, recipe, workflow, resampling design, tuning grid, or evaluation.

### 3. The omics track is too narrow and uneven

`omics_track/` currently covers:

- RNA-seq with DESeq2,
- dummy GSEA,
- basic single-cell outline,
- placeholder proteomics outline.

Major missing essentials:

- experimental design and metadata sanity checks,
- count matrix and sample metadata alignment,
- normalization concepts across assay types,
- QC before hypothesis testing,
- batch effects and confounding,
- multiple testing,
- gene ID mapping,
- annotation reproducibility,
- pathway database versioning,
- microarray analysis, despite `data/omics.csv` being a microarray matrix,
- survival plus omics integration using the existing `clinical.csv` and `omics.csv`,
- multi-omics integration at an introductory level,
- reporting effect sizes, not just p-values.

`C2_Pathway_Enrichment_GSEA.Rmd` uses dummy ranked genes and dummy pathways instead of carrying forward real results.

`C3_Single_Cell_RNASeq.Rmd` is entirely `eval=FALSE` and assumes unavailable 10X input data.

`C4_Proteomics_Analysis.Rmd` is `eval=FALSE` and assumes an unavailable `imputed_protein_intensities.csv`.

`C1_RNASeq_DESeq2.Rmd` depends on the `airway` package, which is not installed locally during audit.

### 4. The engineering track is too thin for reproducible biological data science

`engineering_track/` currently introduces Bash, Conda, Git, Docker, and Nextflow, but each topic is a short sketch.

Missing essentials:

- RStudio project structure,
- `renv` or lockfile-based R dependency management,
- data provenance,
- relative paths with `here`,
- scripted analysis entrypoints,
- parameterized R Markdown,
- Quarto or R Markdown rendering workflows,
- Makefile or task runner basics,
- CI for rendering notebooks,
- large data handling,
- git ignore strategy for data/results,
- secrets and credentials,
- HPC and cloud execution concepts,
- Nextflow DSL2 modules and nf-core usage,
- container plus pipeline integration tested on a real exercise.

### 5. Core statistics and ML are underdeveloped

`notebooks/week3_lecture.Rmd` is a no-code theory notebook and contains repeated/rough text. It does not give learners runnable intuition through simulation.

`notebooks/week4_lecture.Rmd` lists tests but does not teach a decision framework for choosing tests, checking assumptions, interpreting confidence intervals, controlling false discoveries, or reporting effect sizes.

`notebooks/week5_lecture.Rmd` and `notebooks/week6_lecture.Rmd` introduce tidymodels, trees, random forests, cross-validation, and tuning, but:

- examples jump between METABRIC, CPS wages, diabetes, penguins, and a missing COVID dataset,
- evaluation is thin,
- leakage prevention is not emphasized,
- preprocessing is not consistently inside recipes,
- classification metrics are incomplete for biomedical imbalance,
- biological conclusions and model limitations are not central.

### 6. The course does not use its strongest available data well

The repository already contains:

- `data/metabric_clinical_and_expression_data.csv`: 1,904 rows, 32 columns.
- `data/clinical.csv`: 614 rows, survival data.
- `data/omics.csv`: 614 rows, 1,691 expression probe columns.

The `clinical.csv` plus `omics.csv` pair is ideal for a course-long capstone:

- data joining,
- exploratory analysis,
- survival analysis,
- high-dimensional modeling,
- feature selection,
- pathway interpretation,
- reproducible reporting.

Current advanced notebooks mostly ignore this opportunity and use dummy data or unrelated toy datasets.

### 7. Notebook quality is inconsistent

Recurring notebook issues:

- missing or inconsistent setup chunks,
- no global `knitr` options,
- no session info,
- no standard learning objective format,
- no "common failure modes" section,
- sparse exercises,
- solutions are separate but not consistently mapped to exercises,
- too many code chunks execute silently without learner checkpoints,
- some chunks write files into the working directory without a declared output path,
- several notebooks are non-executable by design,
- no automated render check.

## Target Course Design

The redesigned course should have one core promise:

> A biologist can start with tabular, clinical, and omics data; ask a defensible biological question; clean and validate the data; choose an appropriate statistical or machine learning method; interpret results honestly; and deliver a reproducible analysis report.

The course should be organized into five layers:

1. Foundations: R, RStudio, projects, data types, functions, debugging.
2. Data work: import, validation, joining, missingness, tidy data, visualization.
3. Statistical reasoning: uncertainty, experimental design, hypothesis tests, models, multiple testing.
4. Predictive modeling: tidymodels, resampling, leakage prevention, metrics, interpretation.
5. Biological workflows: omics, survival, pathway analysis, reproducibility, reporting, pipelines.

## Proposed Repository Organization

Replace the current loose organization with this structure:

```text
course/
  00_orientation/
  01_r_foundations/
  02_data_wrangling/
  03_visualization/
  04_statistics/
  05_modeling_foundations/
  06_biomedical_ml/
  07_omics_foundations/
  08_multiomics_and_survival/
  09_reproducible_engineering/
  10_capstone/
exercises/
solutions/
data/
  raw/
  processed/
  external/
R/
  helpers/
  checks/
project_detail/
renv.lock
README.md
```

If a full restructure is too disruptive, keep the current directories temporarily but add a new navigation layer in `README.md` and migrate notebooks one module at a time.

## Proposed Curriculum

### Module 0: Orientation and Scientific Workflow

Goal: Define what data science means for biologists.

Required content:

- biological question types,
- descriptive vs inferential vs predictive work,
- data provenance,
- reproducible project layout,
- how to run notebooks,
- how exercises and capstone work.

Outcome: learner can explain the end-to-end workflow and run the course environment.

### Module 1: R Foundations for Biological Data

Replace the current Week 0 with a cleaner, executable module.

Required content:

- vectors, factors, tibbles, lists,
- functions,
- control flow only where useful,
- debugging errors,
- file paths,
- package loading,
- reading CSV/TSV/XLSX,
- basic string work with gene/protein examples.

Assessment: small protein sequence and clinical metadata exercises.

### Module 2: Data Wrangling and Validation

Upgrade Week 1.

Required content:

- data dictionaries,
- column types,
- missingness audit,
- duplicates,
- joins,
- grouped summaries,
- reshaping,
- validation checks,
- clinical plus omics alignment.

Use METABRIC and `clinical.csv`/`omics.csv`.

Assessment: produce a validated analysis-ready table.

### Module 3: Visualization for Biology

Condense Week 2 and the 15 extra visualization notebooks into a coherent module.

Required content:

- distribution plots,
- categorical comparisons,
- scatterplots,
- faceting,
- uncertainty visualization,
- heatmaps,
- PCA plots,
- survival curves,
- volcano plots,
- accessible color,
- publication-ready export.

Do not keep 15 disconnected micro-notebooks as the primary path. They can become optional references.

Assessment: create a figure panel with captions and interpretation.

### Module 4: Statistical Reasoning and Experimental Design

Rewrite Week 3 and Week 4 into a stronger statistics block.

Required content:

- sampling and bias,
- biological replicates vs technical replicates,
- distributions and simulation,
- confidence intervals,
- effect sizes,
- p-values,
- power,
- test selection,
- linear models,
- generalized linear models,
- multiple testing and FDR,
- confounding and covariates,
- reporting standards.

Assessment: choose and justify tests for multiple biological scenarios.

### Module 5: Modeling Foundations with Tidymodels

Rewrite Week 5 and Week 6 around one consistent biomedical prediction problem.

Required content:

- train/test split,
- stratification,
- grouped split when repeated measures or patients exist,
- recipes,
- workflows,
- resampling,
- regression metrics,
- classification metrics,
- ROC and PR curves,
- calibration,
- threshold choice,
- model comparison,
- tuning,
- final fit and test evaluation.

Use METABRIC where possible and avoid unrelated toy datasets except for tiny concept demonstrations.

Assessment: build and report a baseline predictive model.

### Module 6: Biomedical Machine Learning

Replace `advanced_ml_track/` with a broad applied ML module.

Required content:

- leakage prevention,
- imbalanced outcomes,
- class weights and sampling methods,
- penalized regression,
- random forest and gradient boosting,
- nested cross-validation,
- high-dimensional feature selection,
- grouped resampling,
- uncertainty and confidence intervals for model performance,
- explainability with permutation importance and partial dependence,
- why feature importance is not biological causality,
- model cards for biomedical prediction.

Assessment: compare elastic net, random forest, and baseline models on a high-dimensional omics task.

### Module 7: Omics Foundations

Replace `omics_track/` with a real omics workflow progression.

Required content:

- assay types: RNA-seq, microarray, proteomics, single-cell,
- raw counts vs normalized intensities,
- metadata alignment,
- QC,
- normalization,
- batch effects,
- differential expression,
- multiple testing,
- gene annotation,
- pathway enrichment,
- reproducible gene set databases.

Use runnable datasets. If `airway` is used, add it to the environment. If single-cell is included, ship a small public example or make it an optional extension with clear installation notes.

Assessment: run a complete differential expression and enrichment workflow.

Implementation decision for the first rebuilt Module 7 notebook:

- Use `data/clinical.csv` plus `data/omics.csv` as the primary executable dataset because it is bundled, matched at the patient level, and directly supports the capstone.
- Teach the distinction between assay types before package mechanics: RNA-seq counts, microarray/proteomics intensities, and single-cell matrices require different modeling assumptions.
- Analyze the bundled `omics.csv` matrix as continuous microarray-style probe intensities, not RNA-seq counts.
- Use `limma` for probe-level differential association because it is the standard linear modeling framework for continuous expression matrices and small-to-moderate omics studies.
- Keep RNA-seq, single-cell, and proteomics in the conceptual comparison unless a small fully bundled dataset is added for each workflow.
- Produce a real ranked probe result table inside the lesson for later pathway and interpretation modules; do not use dummy ranked genes as the primary workflow.
- Explicitly flag that the probe IDs in the bundled file are not automatically gene symbols and require an annotation source before biological naming or pathway enrichment.

### Module 8: Survival, Omics Integration, and Translational Interpretation

Create an integrative module from current survival and METABRIC material.

Required content:

- censoring,
- Kaplan-Meier,
- Cox models,
- proportional hazards checks,
- penalized Cox for high-dimensional omics,
- clinical-only vs omics-only vs combined models,
- validation,
- risk groups,
- biological interpretation limits.

Use `clinical.csv` plus `omics.csv` as the main dataset.

Assessment: build and report a survival model with appropriate caveats.

### Module 9: Reproducible Engineering for Biologists

Replace `engineering_track/` with a hands-on reproducibility module.

Required content:

- RStudio projects,
- `renv`,
- `here`,
- project directory conventions,
- git and GitHub,
- `.gitignore`,
- scripted analysis,
- parameterized reports,
- rendering all reports,
- Docker,
- CI render checks,
- Nextflow basics,
- nf-core overview,
- data management for large files.

Assessment: make the capstone analysis reproducible from a clean clone.

### Module 10: Capstone

The capstone should run across the course and finish with a report.

Recommended capstone:

- join `clinical.csv` and `omics.csv`,
- validate patient IDs and outcomes,
- perform EDA,
- fit survival and predictive models,
- evaluate model performance,
- identify top molecular features,
- run pathway interpretation where possible,
- produce a final R Markdown or Quarto report.

Deliverables:

- reproducible report,
- short presentation,
- code quality checklist,
- scientific interpretation checklist.

## Notebook Best Practices

Every teaching notebook should follow this structure:

1. Title and module number.
2. Biological question.
3. Learning objectives.
4. Prerequisites.
5. Setup chunk with global `knitr` options.
6. Data input and validation.
7. Concept explanation.
8. Small runnable example.
9. Main biological example.
10. Interpretation checkpoint.
11. Exercises.
12. Common mistakes.
13. Key takeaways.
14. Session info.

Required notebook rules:

- Every core notebook must render from a clean R session.
- Avoid `eval=FALSE` in core notebooks unless the cell is explicitly shell-only or optional.
- No dummy data in core advanced modules when a real course dataset can support the lesson.
- Put all file outputs under `outputs/` or `results/`.
- Use stable random seeds.
- Keep preprocessing inside recipes for machine learning.
- Never preprocess full data before splitting if it affects model evaluation.
- Always state the unit of analysis: patient, sample, cell, gene, protein, or observation.
- Always distinguish prediction from explanation.
- Always report assumptions and limitations.
- Include `sessionInfo()` or an equivalent reproducibility footer.

## Implementation Phases

### Phase 1: Stabilize and make runnable

Actions:

- Add `renv.lock` or a clear installation script.
- Restore or replace `render_all.R`.
- Fix README references to deleted `challenge/` and `render_all.R`.
- Add an automated render check.
- Fix obvious execution defects such as `set.set(123)`.
- Decide whether the course standard is R Markdown or Quarto.
- Add a notebook template.

Exit criteria:

- All core notebooks render.
- README matches the repository.
- Required packages are installable from documented instructions.

### Phase 2: Rebuild the core path

Actions:

- Rewrite Weeks 0 to 7 into Modules 0 to 5.
- Consolidate visualization extras into optional references.
- Add exercises and solutions for each module.
- Use METABRIC consistently as the main clinical dataset.
- Add the `clinical.csv` plus `omics.csv` project arc.

Exit criteria:

- A learner can complete the core course without using placeholder data.
- Every module has objectives, exercises, solutions, and takeaways.

### Phase 3: Replace shallow tracks with real advanced modules

Actions:

- Replace `advanced_ml_track/` with Module 6.
- Replace `omics_track/` with Modules 7 and 8.
- Replace `engineering_track/` with Module 9.
- Make every advanced notebook executable or explicitly optional.

Exit criteria:

- Advanced ML covers leakage, resampling, metrics, high-dimensional modeling, and interpretation.
- Omics covers QC, normalization, differential analysis, enrichment, and integration.
- Engineering produces reproducible reports from clean environments.

### Phase 4: Add capstone and assessment

Actions:

- Add capstone brief.
- Add rubric.
- Add starter notebook.
- Add instructor solution.
- Add presentation template.

Exit criteria:

- Learners finish with a defensible, reproducible biological data science project.

## Immediate Backlog

Priority 0:

- Fix `README.md` stale references.
- Restore or replace `render_all.R`.
- Add dependency management with `renv`.
- Fix `advanced_ml_track/B1_Imbalanced_Data.Rmd`.
- Decide on executable datasets for `omics_track/C1`, `C3`, and `C4`.

Priority 1:

- Create a canonical notebook template.
- Add module map to README.
- Replace dummy GSEA with real output from differential expression or a bundled ranked list.
- Build a real elastic net notebook using `clinical.csv` plus `omics.csv`.
- Build a real survival notebook using `clinical.csv`.

Priority 2:

- Redesign Week 3 as simulation-based statistics.
- Redesign Week 4 around test/model selection.
- Redesign Weeks 5 and 6 around leakage-safe tidymodels workflows.
- Convert visualization extras into optional reference notebooks.

## Risks and Tradeoffs

- A full restructure may break links and historical continuity. Mitigation: migrate in phases and keep compatibility redirects or an index table.
- Bioconductor and Seurat dependencies can be heavy. Mitigation: separate core, omics, and optional single-cell environments if needed.
- Real omics workflows can be computationally expensive. Mitigation: use small curated datasets for teaching and reserve larger runs for optional projects.
- Advanced ML can become mathematically overwhelming. Mitigation: teach through biological failure modes first, then formalize.
- Keeping both lecture and solution notebooks can create drift. Mitigation: render both in CI and name exercises consistently.

## Definition of Done for the Redesigned Course

The course is ready when:

- README gives an accurate learning path.
- A fresh clone can reproduce the environment.
- All core notebooks render cleanly.
- Every module has objectives, exercises, solutions, and takeaways.
- Every advanced topic uses a real or intentionally bundled dataset.
- No core notebook relies on dummy data for the main lesson.
- The capstone connects clinical, omics, statistics, ML, and reproducibility.
- The course teaches biological judgment, not just R syntax.
