#' Prepare xls data frames to be openair friendly
#'
#' @param xls_merged merged xls data frame into one data.table.
#'
#' @return data frame
#' @noRd
#'
#' @keywords internal
prepare_gases_data_frame <- function(xls_merged){
  xls <- as.data.frame(xls_merged)
  xls[, 2:ncol(xls)] <- sapply(xls[, 2:ncol(xls)],
                               gsub,
                               pattern = ",",
                               replacement = ".")
  xls[, 2:ncol(xls)] <- sapply(xls[, 2:ncol(xls)], as.numeric)
  xls$date <- as.POSIXct(strptime(xls$date, format = "%d/%m/%Y %H:%M"),
                         tz = "America/Sao_Paulo")
  return(xls)
}
