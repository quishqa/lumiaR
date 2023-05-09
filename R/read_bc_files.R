#' Load and merge into single data frame BC files
#'
#' @param bc_folder_path Upper level folder with BC data.
#' @param bc_columns Bool. If TRUE, returns data.frame with BC columns.
#'   BC1-7 are in ug/m3 and BB column in (%).
#' @param hour Bool. If TRUE, it returns hourly averages.
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' # Load data for 2022
#' bc_dir <- "~/lumiar_data/BC/2022/"
#' bc_22 <- read_bc_files(bc_dir)
#' }
read_bc_files <- function(bc_folder_path, bc_columns = TRUE,
                          hour = FALSE){
  bc_files <- dir(bc_folder_path, full.names = TRUE, pattern = ".dat")

  if (length(bc_files) == 0){
    stop("Wrong folder path or there is no files in this folder.")
  }

  bc_data <- lapply(bc_files, read_bc_file)
  bc_merged <- data.table::rbindlist(bc_data)

  bc <- prepare_bc_data_frame(bc_merged, bc_columns)
  if (hour){
    return(openair::timeAverage(bc, avg.time = "hour"))
  }
  return(bc)
}
