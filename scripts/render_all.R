# Render course R Markdown notebooks.
#
# Usage:
#   source("render_all.R")
#   render_course()                              # render all notebooks, results beside each .Rmd
#   render_course("course/07_omics_foundations/07_omics_foundations.Rmd")

render_course <- function(
  files         = NULL,
  stop_on_error = FALSE
) {
  if (!requireNamespace("rmarkdown", quietly = TRUE)) {
    stop("Package 'rmarkdown' is required. Run scripts/install_dependencies.R first.")
  }

  if (is.null(files)) {
    # Course notebooks and worked solutions
    search_dirs <- c("course", "solutions")
    search_dirs <- search_dirs[dir.exists(search_dirs)]
    files <- unlist(
      lapply(search_dirs, list.files, pattern = "\\.Rmd$", recursive = TRUE, full.names = TRUE),
      use.names = FALSE
    )
  }

  files <- sort(normalizePath(files, mustWork = TRUE))

  results <- lapply(files, function(path) {
    rel <- sub(paste0("^", normalizePath(getwd()), "/?"), "", path)
    message("Rendering: ", rel)

    result <- tryCatch(
      {
        # Render HTML next to the source file; delete it after to keep the repo clean.
        # To keep rendered output, remove the file.remove() line below.
        out_html <- rmarkdown::render(
          input  = path,
          output_format = "html_document",
          quiet  = TRUE,
          envir  = new.env(parent = globalenv())
        )
        file.remove(out_html)  # delete rendered HTML; source .Rmd is the record
        list(file = rel, status = "ok", error = NA_character_)
      },
      error = function(err) {
        if (isTRUE(stop_on_error)) stop(err)
        list(file = rel, status = "failed", error = conditionMessage(err))
      }
    )

    as.data.frame(result, stringsAsFactors = FALSE)
  })

  report <- do.call(rbind, results)
  failed <- report[report$status != "ok", , drop = FALSE]

  message("Rendered: ", sum(report$status == "ok"), " ok, ", nrow(failed), " failed")
  if (nrow(failed) > 0) {
    message("Failed notebooks:")
    for (i in seq_len(nrow(failed))) {
      message("  ", failed$file[i], " -- ", failed$error[i])
    }
    message("Fix failures and rerun before committing.")
  } else {
    message("All notebooks rendered successfully.")
  }

  invisible(report)
}
