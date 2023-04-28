#' Load and merge into single data frame NH3 files
#'
#' Load into a single data frames the hour files from the NH3 analyzer.
#'
#' @param nh3_folder_path Upper level folder path with month and days folder.
#' @param to_local Change to America/Sao_Paulo time zone.
#' @param col_names Columns to retrieve from raw data.
#'
#' @return data.frame
#' @export
#'
#' @examples
#' \dontrun{
#' # Load data from December 2022
#' nh3_dic_path <- "~/lumiar_data/2022/12/"
#' nh3_dic22 <- read_nh3_files(nh3_dic_path)
#' }
read_nh3_files <- function(nh3_folder_path, to_local=TRUE,
                           col_names = c("DATE", "TIME", "NH3_30s")){
  nh3_files <- dir(nh3_folder_path, recursive = T,
                   full.names = T, pattern = ".dat")
  nh3_data <- lapply(nh3_files, data.table::fread,
                     header = T, sep = " ", dec = ".")
  nh3_merged <- data.table::rbindlist(nh3_data)

  nh3 <- prepare_data_frame_date(nh3_merged, to_local,
                                 col_names)
  return(nh3)
}
