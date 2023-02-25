
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hexR

<!-- badges: start -->
<!-- badges: end -->

A small `shiny` gadget that display a colour picker in the Viewer pane.
Includes helper functions for converting `RGB` colour codes into `html`
hex codes.

## Installation

You can install the development version of hexr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("martinasladek/hexr")
```

## Example

#### Run `shiny` gadget

``` r
hexr::shiny_hexr()
```

#### Covert an RGB code into a html hex code

RGB value needs to be on a scale 0-1. If working on a scale 0-255,
divide input values by 255 first

``` r
hexr::hex_code(0.5, 0.1, 0.8)
#> [1] "#7F19CC"
```
