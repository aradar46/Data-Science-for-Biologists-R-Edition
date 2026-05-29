filepaths <- list.files(c("notebooks", "challenge"), pattern = "\\.Rmd$", full.names = TRUE, recursive = TRUE)

results <- list()
for (filepath in filepaths) {
  cat(sprintf("\n\n=== Rendering %s ===\n", filepath))
  res <- tryCatch({
    rmarkdown::render(filepath, quiet = TRUE)
    "SUCCESS"
  }, error = function(e) {
    paste("ERROR:", conditionMessage(e))
  })
  results[[filepath]] <- res
}

cat("\n\n=== SUMMARY ===\n")
for (filepath in names(results)) {
  status <- if (results[[filepath]] == "SUCCESS") "SUCCESS" else "FAILED"
  cat(sprintf("%-60s : %s\n", filepath, status))
  if (status == "FAILED") {
    cat(sprintf("  %s\n", results[[filepath]]))
  }
}
