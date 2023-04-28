#' Load and merge into single data frame Lumasense files
#'
#' @param lumasense_folder_path Folder were Lumasense files are located
#' @param pol_columns Bool. If TRUE, it returns CO, CO2, and C2H5OH.
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' # Load data for 2022
#' luma_dir <- "~/lumiar_data/BC/2022/"
#' luma_22 <- read_lumasense_files(bc_dir)
#' }
read_lumasense_files <- function(lumasense_folder_path, pol_columns = TRUE){
  luma_files <- dir(lumasense_folder_path, full.names = TRUE, pattern = ".csv")
  luma_data <- lapply(luma_files, read_luma_file)
  luma_merged <- data.table::rbindlist(luma_data)

  luma <- prepare_luma_data_frame(luma_merged, pol_columns)
  return(luma)
}
