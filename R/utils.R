

bind_dtfs <- function(x) {

    all_cols <- Reduce(union, lapply(x, names))

    out <- lapply(x, function(y) {
        ## fill in non-overlapping columns with NA
        y[setdiff(all_cols, names(y))] <- NA

        ## re-order columns
        y[all_cols]
    })

    do.call('rbind', out)
}
