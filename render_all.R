# Render course R Markdown notebooks.
#
# Usage:
#   source("render_all.R")
#   render_course()
#   render_course("notebooks/week1_lecture.Rmd")

render_course <- function(
  files = NULL,
  output_dir = "rendered_notebooks",
  stop_on_error = FALSE
) {
  if (!requireNamespace("rmarkdown", quietly = TRUE)) {
    stop("Package 'rmarkdown' is required. Run scripts/install_dependencies.R first.")
  }

  if (is.null(files)) {
    search_dirs <- c("course", "notebooks", "advanced_ml_track", "omics_track", "engineering_track")
    search_dirs <- search_dirs[dir.exists(search_dirs)]
    files <- unlist(
      lapply(search_dirs, list.files, pattern = "\\.Rmd$", recursive = TRUE, full.names = TRUE),
      use.names = FALSE
    )
  }

  files <- sort(normalizePath(files, mustWork = TRUE))
  output_dir <- normalizePath(output_dir, mustWork = FALSE)
  dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

  results <- lapply(files, function(path) {
    rel <- sub(paste0("^", normalizePath(getwd()), "/?"), "", path)
    out_file <- paste0(gsub("[/\\\\]", "__", tools::file_path_sans_ext(rel)), ".html")

    message("Rendering: ", rel)

    result <- tryCatch(
      {
        rmarkdown::render(
          input = path,
          output_format = "html_document",
          output_file = out_file,
          output_dir = output_dir,
          quiet = TRUE,
          envir = new.env(parent = globalenv())
        )
        list(file = rel, status = "ok", error = NA_character_)
      },
      error = function(err) {
        if (isTRUE(stop_on_error)) {
          stop(err)
        }
        list(file = rel, status = "failed", error = conditionMessage(err))
      }
    )

    as.data.frame(result, stringsAsFactors = FALSE)
  })

  report <- do.call(rbind, results)
  report_path <- file.path(output_dir, "render_report.csv")
  utils::write.csv(report, report_path, row.names = FALSE)

  failed <- report[report$status != "ok", , drop = FALSE]
  message("Render report: ", report_path)
  message("Rendered: ", sum(report$status == "ok"), " ok, ", nrow(failed), " failed")

  invisible(report)
}
