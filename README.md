# STLDecomposition.jl

[![Build Status](https://github.com/WilliBee/STLDecomposition.jl/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/WilliBee/STLDecomposition.jl/actions/workflows/CI.yml?query=branch%3Amaster)

A Julia wrapper around the Fortran implementation of the STL (Seasonal and Trend decomposition using Loess) algorithm

## Credit 
This library wraps around a modified version in the [r-source repo](https://github.com/SurajGupta/r-source/blob/master/src/library/stats/src/stl.f) of the original [Fortran code](https://www.netlib.org/a/stl) 

## References
* Cleveland, R. B., Cleveland, W. S., McRae, J. E., & Terpenning, I. J. (1990). STL: A seasonal-trend decomposition procedure based on loess. Journal of Official Statistics, 6(1), 3–33. [http://bit.ly/stl1990](http://bit.ly/stl1990)
* Hyndman, R.J., & Athanasopoulos, G. (2021) Forecasting: principles and practice, 3rd edition, OTexts: Melbourne, Australia. OTexts.com/fpp3. Accessed on 2023/07/24. [https://otexts.com/fpp3/stl.html](https://otexts.com/fpp3/stl.html)
