# Web Assembly App

This branch houses the pre-compiled interactiveEDA web-assembly app.


## How to update

1. Wait until interactiveEDA changes are propagated to the R-universe repo, which prepares web-assembly compiled versions
of the golem app.
2. If any additional R or system dependencies were added, update setup.R and setup.sh. These are run before `shinylive::export()` to ensure binaries are pulled from the appropriate locations (R-universe vs CRAN vs GitHub etc).
3. Push Changes (or if no changes are made, manually trigger `compile_and_deploy.yml` workflow)

## Changing site title

Change compile_and_deploy.yml `SITE_TITLE` environment variable.


## Compiling app offline

For debugging build process, it can be useful to compile the webassembly app locally. 

Compilation can be performed with a single line.

```
shinylive::export(appdir = ".", destdir = "_site", template_params = list(title = "interactiveEDA"))
```

The most common reason for compilation failure is missing dependencies. You may need to first install packages in `setup.R` and `setup.sh` before running the export command.

If compilation succeeds, but app crashes at runtime due to missing dependencies, it can be helpful to add `library(mydependency)` to the `app.R` file before compilation. Dependencies in 'Suggests' fields of Description files are not automatically installed by shinylive, but adding the explicit `library()` call forces shinylive to install them.


Once compiled, test by running  `httpuv::runStaticServer("_site")`
