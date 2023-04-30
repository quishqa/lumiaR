prepare_gases_data_frame <- function(xls_gases){
  xls <- as.data.frame(xls_gases)
  xls[, 2:ncol(xls)] <- sapply(xls[, 2:ncol(xls)],
                               gsub,
                               pattern = ",",
                               replacement = ".")
  xls[, 2:ncol(xls)] <- sapply(xls[, 2:ncol(xls)], as.numeric)
  xls$date <- as.POSIXct(strptime(xls$date, format = "%d/%m/%Y %H:%M"),
                         tz = "America/Sao_Paulo")
  return(xls)
}
