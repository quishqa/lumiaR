#' Prepare Lumasense data frame to be openair friendly
#'
#' @param luma_merged Merged data.tables into one data.table.
#' @param pol_columns Boolean, if TRUE, returns only CO, CO2, and C2H5OH.
#'
#' @return data.frame
#' @noRd
#'
#' @keywords internal
prepare_luma_data_frame <- function(luma_merged, pol_columns=TRUE){
  luma_merged <- as.data.frame(luma_merged)
  luma_merged$`Date & Time` <- as.POSIXct(
    strptime(luma_merged$`Date & Time`, format = "%d-%m-%Y %H:%M:%OS"),
    tz = "America/Sao_Paulo"
  )
  if (pol_columns){
    luma_merged <- luma_merged[, seq(1, 4)]
    names(luma_merged) <- c("date", "co2", "co", "ethanol")
    return(luma_merged)
  }
  return(luma_merged)
}
