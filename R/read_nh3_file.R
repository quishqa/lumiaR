#' Load a single NH3 file
#'
#' @param file_path
#'
#' @return data.frame#'
#' @noRd
#' @keywords internal
read_nh3_file <- function(file_path){
  nh3_df <- utils::read.table(file_path, header = T, sep = "", dec = ".")
  return(nh3_df)
}
