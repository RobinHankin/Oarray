
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Oarray

<!-- badges: start -->

[![R-CMD-check](https://github.com/RobinHankin/Oarray/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/RobinHankin/Oarray/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Package `Oarray` allows the user to define an arbitrary offset for
arrays. By far the most common use-case is to specify zero offset in
each dimension, but the package is user-configurable.

## Installation

You can install the development version of Oarray from
[GitHub](https://github.com/) with:

``` r
# install.packages("Oarray")
pak::pak("RobinHankin/Oarray")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library("Oarray")
A <- as.Oarray(array(1:24,2:4),offset=0)
A
#> , , 0
#> 
#>      [,0] [,1] [,2]
#> [0,]    1    3    5
#> [1,]    2    4    6
#> 
#> , , 1
#> 
#>      [,0] [,1] [,2]
#> [0,]    7    9   11
#> [1,]    8   10   12
#> 
#> , , 2
#> 
#>      [,0] [,1] [,2]
#> [0,]   13   15   17
#> [1,]   14   16   18
#> 
#> , , 3
#> 
#>      [,0] [,1] [,2]
#> [0,]   19   21   23
#> [1,]   20   22   24
A[0,0,0]
#> [1] 1
A[0, ,1] <- -99
A[ , ,1]
#>      [,1] [,2] [,3]
#> [1,]  -99  -99  -99
#> [2,]    8   10   12
```
