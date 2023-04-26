read_nh3_files <- function(nh3_folder_path, to_local=TRUE,
                           col_names = c("DATE", "TIME", "NH3_30s")){
  nh3_files <- dir(nh3_folder_path, recursive = T,
                   full.names = T, pattern = ".dat")
  nh3_data <- lapply(nh3_files, read_nh3_file)
  nh3_merged <- do.call(rbind, nh3_data)

  nh3 <- prepare_data_frame_date(nh3_merged, to_local,
                                 col_names)
  return(nh3)
}
