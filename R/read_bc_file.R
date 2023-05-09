#' Load single BC file
#'
#' If file has more than 67 columns it will cut the rest columns.
#'
#' @param file_path Full name of BC file
#'
#' @return data.table
#' @noRd
#'
#' @keywords internal
read_bc_file <- function(file_path){
  bc_dt <- data.table::fread(file_path, header = F, skip = 8,
                             sep = " ", dec = ".", fill = T)
  if (ncol(bc_dt) > 67){
    message(file_path, " has more than 67 columns.")
    message("Selecting first 67 columns.")
    return(bc_dt[, 1:67])
  }
  return(bc_dt)
}
