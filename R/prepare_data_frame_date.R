#' Prepare date column to be openair friendly
#'
#' @param nh3_merged The merged data frames into one data frames.
#' @param to_local Change to America/Sao_Paulo time zone.
#' @param col_names Columns to retrieve from raw data.
#'
#' @return data.frame with date column as POSIXct
#' @noRd
#' @keywords internal
prepare_data_frame_date <- function(nh3_merged, to_local = TRUE,
                                    col_names = c("DATE", "TIME", "NH3_30s")){
  nh3_merged$date <- paste(nh3_merged$DATE, nh3_merged$TIME)
  nh3_merged$date <- as.POSIXct(strptime(nh3_merged$date,
                                         format = "%Y-%m-%d %H:%M:%OS"),
                                tz = "etc/UTC")
  nh3_merged <- nh3_merged[c("date", "NH3_30s")]

  if (to_local){
    attributes(nh3_merged$date)$tzone <- "America/Sao_Paulo"
  }

  return(nh3_merged)
}
