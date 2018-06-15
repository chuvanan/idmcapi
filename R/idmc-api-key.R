## https://github.com/hrbrmstr/omdbapi/blob/master/R/omdb_api_key.R



##' Get or set IDMC_API_KEY value
##'
##' The API wrapper functions in this package all rely on a IDMC API key
##' residing in the environment variable `IDMC_API_KEY`. The easiest way to
##' accomplish this is to set it in the `.Renviron` file in your home directory.
##'
##' @param force Force setting a new IDMC API key for the current environment?
##' @return A character vector containing the IDMC API key
##' @author An Chu
##' @export
idmc_api_key <- function(force = FALSE) {

    key <- Sys.getenv('IDMC_API_KEY')
    if (!identical(key, "") && !force) return(key)

    if (!interactive()) {
        stop("Please set env var IDMC_API_KEY to your IDMC API key",
             call. = FALSE)
    }

    message("Couldn't find env var IDMC_API_KEY See ?idmc_api_key for more details.")
    message("Please enter your API key and press enter:")
    pat <- readline(": ")

    if (identical(pat, "")) {
        stop("IDMC API key entry failed", call. = FALSE)
    }

    message("Updating IDMC_API_KEY env var to PAT")
    Sys.setenv(IDMC_API_KEY = pat)

    pat

}
