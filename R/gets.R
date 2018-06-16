

##' Countries
##'
##'
##' Get a list of countries in the database
##'
##'
##' @param sort Sort the \code{data.frame} by either 'iso3' or 'name', defaults
##'     to 'name'.
##' @param ci A character of IDMC_API_KEY. See [idmc_api_key()].
##' @return A \code{data.frame} of search results, with two columns: 'iso3' and
##'     'name'.
##' @author An Chu
##' @export
get_countries <- function(sort = c('name', 'iso3'), ci = idmc_api_key()) {

    sort <- match.arg(sort)
    req <- paste0(IDMC_BASE_URL, '/api/countries?sort=', sort, '&ci=', ci)

    res <- httr::GET(req)
    httr::stop_for_status(res)

    dta <- httr::content(res, as = 'parsed')$result
    if (length(dta) == 0L) return(NULL)

    dta <- lapply(dta, as.data.frame, stringsAsFactors = FALSE)
    dta <- bind_dtfs(dta)
    dta

}



##' Country overview
##'
##'
##' Get a country displacement information and includes population and refugee
##' numbers
##'
##'
##' @param iso3 The country ISO3 code
##' @param ci A character vector of IDMC_API_KEY. See [idmc_api_key()].
##' @return A \code{data.frame}
##' @author An Chu
##' @export
get_overview <- function(iso3, ci = idmc_api_key()) {

    stopifnot(!missing(iso3))

    req <- paste0(IDMC_BASE_URL, '/api/overview?iso3=', iso3, '&ci=', ci)

    res <- httr::GET(req)
    httr::stop_for_status(res)

    dta <- httr::content(res, as = 'parsed')$result
    if (length(dta) == 0L) return(NULL)

    dta <- data.frame(
        fields = names(unlist(dta)),
        values = unlist(dta),
        stringsAsFactors = FALSE
    )

    rownames(dta) <- NULL
    dta

}


##' Conflict displacement data
##'
##'
##' Returns all available conflict displacement data
##'
##'
##' @param iso3 Character. The country iso3 code (if neglected then all the
##'     countries)
##' @param year Integer. The year of the records (default all years, it also
##'     accept ranges)
##' @param limit Integer. Limit the number of records returned by the API
##' @param ci A character vector of IDMC_API_KEY. See [idmc_api_key()].
##' @return A \code{data.frame}
##' @author An Chu
##' @export
get_confict_data <- function(iso3, year, limit, ci = idmc_api_key()) {

    if (missing(iso3)) {
        iso3 <- ''
    }

    if (missing(year)) {
        year <- ''
        range <- ''
    }

    if (length(year) == 1L) {
        range <- ''
    } else if (length(year) > 1L) {
        year <- range(year)
        range <- 1L
    }

    if (missing(limit)) {
        limit <- ''
    }

    req <- paste0(IDMC_BASE_URL, '/api/conflict_data?iso3=', iso3,
                  paste0('&year=', year, collapse = ''),
                  '&range=', range, '&ci=', ci)

    res <- httr::GET(req)
    httr::stop_for_status(res)

    dta <- httr::content(res, as = 'parsed')$result
    if (length(dta) == 0L) return(NULL)

    dta <- lapply(dta, as.data.frame, stringsAsFactors = FALSE)
    dta <- bind_dtfs(dta)
    dta

}




##' Disaster displacement data
##'
##' Returns all available disaster displacement data by event and includes
##' hazard type information
##'
##'
##' @param iso3 Character. The country ISO3 code
##' @param year Integer. The year of the records (default all years, it also
##'     accept ranges)
##' @param limit Integer. Limit the number of records returned by the API
##' @param ci A character vector of IDMC_API_KEY. See [idmc_api_key()].
##' @return A \code{data.frame}
##' @author An Chu
##' @export
get_disaster_data <- function(iso3, year, limit, ci = idmc_api_key()) {

    if (missing(iso3)) {
        iso3 <- ''
    }

    if (missing(year)) {
        year <- ''
        range <- ''
    }

    if (length(year) == 1L) {
        range <- ''
    } else if (length(year) > 1L) {
        year <- range(year)
        range <- 1L
    }

    if (missing(limit)) {
        limit <- ''
    }

    req <- paste0(IDMC_BASE_URL, '/api/disaster_data?iso3=', iso3,
                  paste0('&year=', year, collapse = ''),
                  '&range=', range, '&ci=', ci)

    res <- httr::GET(req)
    httr::stop_for_status(res)

    dta <- httr::content(res, as = 'parsed')$result
    if (length(dta) == 0L) return(NULL)

    dta <- lapply(dta, as.data.frame, stringsAsFactors = FALSE)
    dta <- bind_dtfs(dta)
    dta

}


##' Displacement data
##'
##'
##' Returns all available displacement data for both disaster and conflict by
##' year and country
##'
##'
##' @param iso3 Character. The country ISO3 code
##' @param year Integer. The year of the records (default all years, it also
##'     accept ranges)
##' @param limit Integer. Limit the number of records returned by the API
##' @param ci A character vector of IDMC_API_KEY. See [idmc_api_key()].
##' @return A \code{data.frame}
##' @author An Chu
##' @export
get_displacement_data <- function(iso3, year, limit, ci = idmc_api_key()) {

    if (missing(iso3)) {
        iso3 <- ''
    }

    if (missing(year)) {
        year <- ''
        range <- ''
    }

    if (length(year) == 1L) {
        range <- ''
    } else if (length(year) > 1L) {
        year <- range(year)
        range <- 1L
    }

    if (missing(limit)) {
        limit <- ''
    }

    req <- paste0(IDMC_BASE_URL, '/api/displacement_data?iso3=', iso3,
                  paste0('&year=', year, collapse = ''),
                  '&range=', range, '&ci=', ci)

    res <- httr::GET(req)
    httr::stop_for_status(res)

    dta <- httr::content(res, as = 'parsed')$result
    if (length(dta) == 0L) return(NULL)

    dta <- lapply(dta, as.data.frame, stringsAsFactors = FALSE)
    dta <- bind_dtfs(dta)
    dta

}


##' Disaster aggregated data
##'
##' Returns all available disaster displacement data by country aggregating all
##' the events
##'
##'
##' @param iso3 Character. The country ISO3 code
##' @param year Integer. The year of the records (default all years, it also
##'     accept ranges)
##' @param limit Integer. Limit the number of records returned by the API
##' @param ci A character vector of IDMC_API_KEY. See [idmc_api_key()].
##' @return A \code{data.frame}
##' @author An Chu
##' @export
get_aggregated_disaster_data <- function(iso3, year, limit,
                                         ci = idmc_api_key()) {

    if (missing(iso3)) {
        iso3 <- ''
    }

    if (missing(year)) {
        year <- ''
        range <- ''
    }

    if (length(year) == 1L) {
        range <- ''
    } else if (length(year) > 1L) {
        year <- range(year)
        range <- 1L
    }

    if (missing(limit)) {
        limit <- ''
    }

    req <- paste0(IDMC_BASE_URL, '/api/aggregated/disaster_data?iso3=', iso3,
                  paste0('&year=', year, collapse = ''),
                  '&range=', range, '&ci=', ci)

    res <- httr::GET(req)
    httr::stop_for_status(res)

    dta <- httr::content(res, as = 'parsed')$result
    if (length(dta)) return(NULL)

    dta <- lapply(dta, as.data.frame, stringsAsFactors = FALSE)
    dta <- bind_dtfs(dta)
    dta

}



##' Conflict stock by latest update
##'
##'
##' Returns the strata data for a country by type of displacement and fact type
##'
##'
##' @param iso3 Character. The country ISO3 code
##' @param ci A character vector of IDMC_API_KEY. See [idmc_api_key()].
##' @return A \code{data.frame}
##' @author An Chu
##' @export
get_strata_data <- function(iso3, ci = idmc_api_key()) {

    stopifnot(!missing(iso3))

    req <- paste0(IDMC_BASE_URL, '/api/strata_data?iso3=', iso3, '&ci=', ci)

    res <- httr::GET(req)
    httr::stop_for_status(res)

    dta <- httr::content(res, as = 'parsed')$result
    if (length(dta) == 0L) return(NULL)

    strata <- lapply(dta[[1L]]$strata, as.data.frame, stringsAsFactors = FALSE)
    strata <- do.call('rbind', strata)

    other_cols <- dta[[1]][c('iso3', 'type', 'displacement_type')]
    other_cols <- as.data.frame(other_cols, stringsAsFactors = FALSE)

    merge(other_cols, strata, all = TRUE)

}

##' Public figure analysis text
##'
##'
##' Returns the figure analysis for a country
##'
##'
##'
##' @param iso3 Character. The country ISO3 code
##' @param ci A character vector of IDMC_API_KEY. See [idmc_api_key()].
##' @return A \code{data.frame} or NULL if the API returns nothing
##' @author An Chu
##' @export
get_figure_analysis <- function(iso3, ci = idmc_api_key()) {

    stopifnot(!missing(iso3))

    req <- paste0(IDMC_BASE_URL, '/api/figure_analysis?iso3=', iso3, '&ci=', ci)

    res <- httr::GET(req)
    httr::stop_for_status(res)

    dta <- httr::content(res, as = 'parsed')$result
    if (length(dta) == 0L) return(NULL)

    dta <- lapply(dta, as.data.frame, stringsAsFactors = FALSE)
    dta <- bind_dtfs(dta)

    dta
}


##' Confidence assessment data
##'
##'
##' Returns the confidence assessment data for a country by type of displacement
##' and fact type
##'
##'
##' @param iso3 Character. The country ISO3 code
##' @param ci A character vector of IDMC_API_KEY. See [idmc_api_key()].
##' @return A \code{data.frame} or NULL if the API returns nothing
##' @author An Chu
##' @export
get_confidence_assessment <- function(iso3, ci = idmc_api_key()) {

    stopifnot(!missing(iso3))

    req <- paste0(IDMC_BASE_URL, '/api/confidence_assessment?iso3=', iso3, '&ci=', ci)

    res <- httr::GET(req)
    httr::stop_for_status(res)

    dta <- httr::content(res, as = 'parsed')$result
    if (length(dta) == 0L) return(NULL)

    dta <- lapply(dta, as.data.frame, stringsAsFactors = FALSE)
    dta <- bind_dtfs(dta)
    dta

}

##' Disaster Events
##'
##'
##' Returns events associated with an iso code
##'
##'
##' @param iso3 Character. The country ISO3 code
##' @param ci A character vector of IDMC_API_KEY. See [idmc_api_key()].
##' @return A \code{data.frame} or NULL if the API returns nothing
##' @author An Chu
##' @export
get_disaster_events <- function(iso3, ci = idmc_api_key()) {

    stopifnot(!missing(iso3))

    req <- paste0(IDMC_BASE_URL, '/api/disaster_events?iso3=', iso3, '&ci=', ci)

    res <- httr::GET(req)
    httr::stop_for_status(res)

    dta <- httr::content(res, as = 'parsed')$result
    if (length(dta) == 0L) return(NULL)

    dta <- lapply(dta, as.data.frame, stringsAsFactors = FALSE)
    dta <- bind_dtfs(dta)

    dta

}
