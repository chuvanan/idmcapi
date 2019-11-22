# idmcapi

<!-- badges: start -->
[![Travis build status](https://travis-ci.org/chuvanan/idmcapi.svg?branch=master)](https://travis-ci.org/chuvanan/idmcapi)
<!-- badges: end -->

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

The following
[functions](https://github.com/idmc-labs/IDMC-Platform-API/wiki/Endpoints) are
implemented:

* `get_countries`: Returns an array of countries in the database

* `get_overview`: Returns a country displacement information and includes
  population and refugee numbers

* `get_conflict_data`: Returns all available conflict displacement data

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

get_countries()          # output truncated

#     iso3                       geo_name
# 1    AB9                     Abyei Area
# 2    AFG                    Afghanistan
# 3    ALB                        Albania
# 4    DZA                        Algeria
# 5    AGO                         Angola
# 6    AIA                       Anguilla
# 7    ATG            Antigua and Barbuda
# 8    ARG                      Argentina
# 9    ARM                        Armenia
# 10   AUS                      Australia
```

``` r
get_overview('VNM')

#                               fields                       values
# 1                               iso3                          VNM
# 2                           geo_name                      Vietnam
# 3                  population.figure                     95414640
# 4                    population.year                         2017
# 5                  population.source       UN Population Division
# 6                     refugee.figure                       329331
# 7                       refugee.year                         2016
# 8                     refugee.source                        UNHCR
# 9                    conflict.source                         IDMC
# 10                     disaster.year                         2017
# 11        disaster.new_displacements                       633463
# 12  disaster.new_displacements_since 1 January - 31 December 2017
# 13 disaster.new_displacements_source                         IDMC
# 14                   disaster.source                         IDMC
```

``` r
get_conflict_data(iso3 = 'RUS', year = 2015)

#   iso3 iso           geo_name year stock_displacement stock_displacement_source new_displacements
# 1  RUS  RU Russian Federation 2015              26607                      IDMC                 0
#   new_displacements_source
# 1                     IDMC

get_conflict_data(iso3 = 'RUS', year = c(2011, 2015))

#   iso3 iso           geo_name year stock_displacement_source new_displacements new_displacements_source
# 1  RUS  RU Russian Federation 2011                      IDMC                 0                     IDMC
# 2  RUS  RU Russian Federation 2012                      IDMC                 0                     IDMC
# 3  RUS  RU Russian Federation 2013                      IDMC                 0                     IDMC
# 4  RUS  RU Russian Federation 2014                      IDMC                 0                     IDMC
# 5  RUS  RU Russian Federation 2015                      IDMC                 0                     IDMC
#   stock_displacement
# 1                 NA
# 2              29000
# 3              34900
# 4              25378
# 5              26607
```

``` r
get_strata_data('RUS')

#   iso3         type displacement_type       date figure
# 1  RUS IDPs (Stock)          Conflict 2016-12-31  19327
```

``` r
get_figure_analysis('RUS')

#     id iso3 year                    type displacement_type
# 1 6004  RUS 2017            IDPs (Stock)          Conflict
# 2 6118  RUS 2017       Returnees (Stock)          Conflict
# 3 6061  RUS 2017 New Displacement (Flow)          Conflict
#                                                                                                                                                                                                                                                     public_figure_analysis
# 1 This estimate is based on data provided directly by the Government of the Federation of Russia on 2016. Due to the very protracted nature of this caseload, humanitarian organizations are not actively tracking internal forced displacement in the Russian Federation.
# 2                                                                                                                                                                                                                              There were no new returns reported in 2017.
# 3                                                                                                                                                                                                                          There was no new displacement reported in 2017.
```

``` r
get_disaster_events('RUS')

#   iso3     subcategory                                                                           name       date
# 1  RUS Weather related                               Russian Federation: floods - Tyumen - 10/05/2017 2017-05-10
# 2  RUS Weather related Russian Federation: forest fires - Irkutsk; Buryatia; Krasnoyarsk - 28/04/2017 2017-04-28
# 3  RUS Weather related                            Russian Federation: floods - Stavropol - 24/05/2017 2017-05-24
# 4  RUS Weather related              Russian Federation: floods - Primorskye; Khabarkovsk - 07/08/2017 2017-08-07
#   new_displacements
# 1               643
# 2              1220
# 3              3600
# 4               436
```
