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
