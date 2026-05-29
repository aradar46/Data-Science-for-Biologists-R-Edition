source("render_all.R")

report <- render_course(stop_on_error = FALSE)
failed <- report[report$status != "ok", , drop = FALSE]

if (nrow(failed) > 0) {
  message("Failed notebooks:")
  for (i in seq_len(nrow(failed))) {
    message("- ", failed$file[[i]], ": ", failed$error[[i]])
  }
  quit(status = 1)
}

message("All notebooks rendered successfully.")
