# atus

An R package for abridged data from the [American Time Use Survey](https://www.bls.gov/tus).

_Last update: July 16, 2017_

This package contains partial data from the American Time Use Survey (ATUS) for years 2003-2016. The ATUS is an annual survey conducted on a sample of individuals across the United States studying how individuals spent their time over the course of a day. Individual respondents were interviewed about what activities they did, during what times (rounded to 15 minute increments), at what locations, and in the presence of which individuals. The activities are subsequently encoded based on 3 separate tier codes for classification. All rows from the multiyear ATUS Activities, ATUS-CPS, ATUS Respondents, and ATUS Activity Summary files were included, but only a subset of the columns. Columns were selected based on completeness of data as well as presence on the Frequently Used Variables list provided by the ATUS website. However, all activity codes were included. Permission was obtained from the Bureau of Labor Statistics for inclusion in this R package. The full data can be obtained from http://www.bls.gov/tus/

## Installation 
=======
To install this package in R, install the 'devtools' package if it doesn't already exist:

```
install.packages("devtools")
```

Then, install this package using:

```
devtools::install_github("swang87/atus")
```

## Usage

The package can then be loaded using:

```
library(atus)
```

The package contains 4 data frames that can be loaded with:

```
data(atussum)
data(atusact)
data(atusresp)
data(atuscps)
```

Each of these also has its own help file, e.g.:

```
?atusact
```
