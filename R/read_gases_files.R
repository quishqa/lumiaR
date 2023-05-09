#' Load and merge single data frame XLS gases file.
#'
#' @param gases_folder_path Folder with the xls files.
#' @param pattern Pattern to read the xls files. "Hour", "15 Minutes",
#' "Minutes".
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' # Load march hourly data files
#' gases_folder <- "/home/myUser/Data/gases/march"
#' gases <- read_gases_files(gases_folder, "Hour")
#' }
read_gases_files <- function(gases_folder_path, pattern){
  xls_files <- dir(gases_folder_path, recursive = F, pattern = pattern,
                   full.names = T)

  if (length(xls_files) == 0){
    if (dir.exists(gases_folder_path)){
      stop("There is no files in this folder.")
    } else {
      stop("This folder path does not exit. Please double-check.")
    }
  }

  xls_gases <- lapply(xls_files, readxl::read_excel)
  xls_gases <- data.table::rbindlist(xls_gases)
  xls_gases <- change_xls_colnames(xls_gases, pattern)
  xls_gases <- prepare_gases_data_frame(xls_gases)
  return(xls_gases)
}
