#' Load and merge into single data frame BC files
#'
#' @param bc_folder_path Upper level folder with BC data
#' @param bc_columns Bool. If TRUE, returns data.frame with BC columns.
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
read_bc_files <- function(bc_folder_path, bc_columns = TRUE){
  bc_files <- dir(bc_folder_path, full.names = TRUE, pattern = ".dat")
  bc_data <- lapply(bc_files, data.table::fread,
                    header = FALSE, skip = 8, sep = " ",
                    dec = ".")
  bc_merged <- data.table::rbindlist(bc_data)

  bc <- prepare_bc_data_frame(bc_merged, bc_columns)
  return(bc)
}
