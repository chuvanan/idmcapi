

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
    dta <- do.call('rbind', dta)
    dta <- as.data.frame(dta, stringsAsFactors = FALSE)
    dta[] <- lapply(dta, unlist)
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

    dta <- data.frame(
        fields = names(unlist(dta)),
        values = unlist(dta),
        stringsAsFactors = FALSE
    )

    rownames(dta) <- NULL
    dta

}
