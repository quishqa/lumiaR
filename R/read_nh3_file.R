#' Load a single NH3 file
#'
#' @param file_path
#'
#' @return data.table
#' @noRd
#' @keywords internal
read_nh3_file <- function(file_path){
  nh3_dt <- data.table::fread(file_path, header = T, sep = " ", dec = ".")
  return(nh3_dt)
}
