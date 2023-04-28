#' Load single Lumasense file
#'
#' @param file_path
#'
#' @return data.table
#' @noRd
#' @keywords internal
read_luma_file <- function(file_path){
  luma_dt <- data.table::fread(file_path, header = T, sep = ";", dec = ".")
  return(luma_dt)
}
