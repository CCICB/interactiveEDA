
# ggEDA <img src="man/figures/logo.png" align="right" height="138" alt="" />

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/CCICB/ggEDA/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/CCICB/ggEDA/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

A browser-based graphical user interface for interactive exploratory data analysis, 
powered by the 'gg1d' package. 
Designed for non-programmers, it allows users to explore complex multi-variable relationships, 
visualize patterns of missing data, and create publication-ready parallel coordinate plots 
and tiled one-dimensional graphics — all without writing a single line of code.

## Quick Start

Start using the web-app hosted [here](https://CCICB.github.io/ggEDA)


### Running ggEDA offline:

You can install ggEDA as an R package from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("CCICB/ggEDA")
```

Once installed, run the app locally:

``` r
library(ggEDA)
run_app()
```

ggEDA will open in your default browser.


## Code of Conduct

Please note that the ggEDA project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.
