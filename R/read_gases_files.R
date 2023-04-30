read_gases_files <- function(gases_folder_path, pattern){
  xls_files <- dir(gases_folder_path, recursive = F, pattern = pattern,
                   full.names = T)
  xls_gases <- lapply(xls_files, readxl::read_excel)
  xls_gases <- data.table::rbindlist(xls_gases)
  xls_gases <- change_xls_colnames(xls_gases, pattern)
  xls_gases <- prepare_gases_data_frame(xls_gases)
  return(xls_gases)
}
