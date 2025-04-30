message("Loading pacakge with pkgload::load_all ")
pkgload::load_all(export_all = FALSE,helpers = FALSE,attach_testthat = FALSE)
message("Updating options")
options("golem.app.prod" = TRUE)
message("About to run app")
run_app()

