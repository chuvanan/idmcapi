# idmcapi

The goal of `idmcapi` is to provide R functions to get access to
[IDMC](http://www.internal-displacement.org/) database. For more information
about the database, please visit this
[website](http://www.internal-displacement.org/database)

**Note**: The IDMC API requires a special access key
(https://github.com/idmc-labs/IDMC-Platform-API)

## Installation

You can install the released version of idmcapi from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("idmcapi")
```

Or development version on Github:

``` r
devtools::install_github("chuvanan/idmcapi")
```

## API

The following functions are implemented:

* `get_countries`: Returns an array of countries in the database

* `get_country_overview`: Returns a country displacement information and
  includes population and refugee numbers

* `get_confict_data`: Returns all available conflict displacement data

* `get_disaster_data`: Returns all available disaster displacement data by event
  and includes hazard type information

* `get_aggregated_disaster_data`: Returns all available disaster displacement
  data by country aggregating all the events

* `get_displacement_data`: Returns all available displacement data for both
  disaster and conflict by year and country

* `get_strata_data`: Returns the strata data for a country by type of
  displacement and fact type

* `get_figure_analysis`: Returns the figure analysis for a country

* `get_confidence_assessment`: Returns the confidence assessment data for a
  country by type of displacement and fact type

* `get_disaster_events`: Returns events associated with an iso code

## Example

This is a basic example which shows you how to solve a common problem:

``` r
## basic example code
```
