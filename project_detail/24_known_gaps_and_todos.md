# Known Gaps and Todos

## Purpose

This file tracks documentation and course gaps that affect maintainability, reproducibility, or learner quality. It is the course-specific equivalent of the local governance requirement to keep known gaps explicit.

## Documentation Governance Gap

The local `AGENTS.md`-style instructions mention React, Capacitor, Android, storage, frontend architecture, and several project documents such as `04_system_architecture.md`, `10_data_models.md`, and `16_android_configuration.md`.

This repository is an R Markdown course, not a React/Capacitor application. Those application-specific documents are not present and are not directly applicable.

Current course documentation source of truth:

- `project_detail/00_course_audit_and_redesign_plan.md`
- `project_detail/01_notebook_standards.md`
- `project_detail/02_implementation_log.md`
- `project_detail/24_known_gaps_and_todos.md`

Todo:

- If this repository later becomes a web application or packaged learning platform, create the missing app architecture documents before implementing app code.
- For the current R course, continue documenting curriculum architecture, notebook standards, dependency strategy, validation workflow, and implementation rationale in the existing course-specific documentation files.

## Curriculum Gaps Remaining

- Module 8 still needs a full survival plus omics integration notebook.
- Module 9 still needs a full reproducible engineering notebook.
- Legacy `omics_track/` notebooks still contain placeholder or optional-only material and should eventually be archived or rewritten as optional references.
- Legacy `engineering_track/` notebooks are still shallow and should be replaced by a practical reproducibility module.
- A formal exercises and solutions structure has not yet been created for the redesigned `course/` path.
- A lockfile-based dependency workflow, such as `renv.lock`, has not yet been finalized.

## Risk Notes

- Rendering all notebooks currently validates execution, but it does not yet verify pedagogical completeness or exercise coverage.
- The bundled `omics.csv` file uses probe identifiers. Biological interpretation requires documented annotation mapping before learners make gene-level claims.
- Some advanced Bioconductor packages are large and may make first-time setup slow for learners.
