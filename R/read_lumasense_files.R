#' Load and merge into single data frame Lumasense files
#'
#' @param lumasense_folder_path Folder were Lumasense files are located.
#' @param pol_columns Bool. If TRUE, it returns CO, CO2, and C2H5OH.
#' @param hour Bool. If TRUE, it returns hourly averages.
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
read_lumasense_files <- function(lumasense_folder_path, pol_columns = TRUE,
                                 hour = FALSE){
  luma_files <- dir(lumasense_folder_path, full.names = TRUE, pattern = ".csv")

  if (length(luma_files) == 0){
    stop("Wrong folder path or there is no files in this folder.")
  }

  luma_data <- lapply(luma_files, data.table::fread,
                      header = TRUE, sep = ";", dec = ".")
  luma_merged <- data.table::rbindlist(luma_data)

  luma <- prepare_luma_data_frame(luma_merged, pol_columns)
  if (hour){
    return(openair::timeAverage(luma, avg.time = "hour"))
  }
  return(luma)
}
