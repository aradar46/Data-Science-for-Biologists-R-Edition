# Notebook Standards

## Purpose

This file defines the required structure and quality bar for course notebooks. It implements the notebook best-practice rules from `project_detail/00_course_audit_and_redesign_plan.md`.

## Required Structure

Every core teaching notebook must contain:

1. Title and module number.
2. Biological question.
3. Learning objectives.
4. Prerequisites.
5. Setup chunk with global `knitr` options.
6. Data input and validation.
7. Concept explanation.
8. Small runnable example when helpful.
9. Main biological example.
10. Interpretation checkpoint.
11. Exercises.
12. Common failure modes.
13. Key takeaways.
14. Session info.

## Execution Rules

- Core notebooks must render from a clean R session.
- Core notebooks must avoid `eval=FALSE` unless the chunk is explicitly optional.
- Core notebooks must use real course datasets or bundled teaching datasets for the main lesson.
- Demonstration-only dummy data is allowed only for short concept checks, not for the main workflow.
- Random operations must set a seed.
- File outputs must go under `outputs/`, `results/`, or `rendered_notebooks/`.
- Notebook rendering is validated through `render_all.R` and `scripts/check_course.R`.

## Modeling Rules

- Split data before fitting or learning preprocessing parameters.
- Put model preprocessing inside `recipes` when using `tidymodels`.
- Use stratified or grouped splitting when the outcome or unit of analysis requires it.
- Report more than one metric for biomedical classification tasks.
- Prefer ROC and precision-recall curves over accuracy alone for imbalanced outcomes.
- State the unit of analysis: patient, sample, cell, gene, protein, or observation.
- Distinguish prediction from explanation.
- State assumptions, limitations, and leakage risks.

## Omics Rules

- Validate sample identifiers before analysis.
- Keep count data, normalized data, transformed data, and model-ready data conceptually separate.
- Use raw integer counts for count-based RNA-seq models.
- Report multiple-testing correction.
- Track gene identifier type and annotation source.
- State pathway database source and version where possible.
- Treat batch effects and confounding as first-class analysis risks.

## Teaching Rules

- Teach the biological decision before package mechanics.
- Each section should answer why the step exists, not only how to run it.
- Exercises must map clearly to solutions.
- Learners should be asked to interpret outputs, not only produce them.
- Use short, focused chunks and avoid large noisy outputs.

## Template

Use `templates/course_notebook_template.Rmd` for new notebooks and major rewrites.
