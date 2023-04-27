#' Load single BC file
#'
#' @param file_path Directory of file with BC data
#'
#' @return data.table
#' @noRd
#' @keywords internal
read_bc_file <- function(file_path){
  bc_dt <- data.table::fread(file_path, header = F, skip = 8, sep = " ",
                              dec = ".")
  return(bc_dt)
}
