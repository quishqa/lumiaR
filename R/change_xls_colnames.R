#' Change columns name from xls file
#'
#' @param xls merged xls data frame
#' @param pattern xls file pattern. "Hour", "15 Minutes", or "Minute".
#'
#' @return data frame with better columns name.
#' @noRd
#'
#' @keywords internal
change_xls_colnames <- function(xls, pattern){
  if (pattern == "Hour"){
    col_pattern <- "Hr"
  }
  if (pattern == "15 Minutes"){
    col_pattern <- "15 Min"
  }
  if (pattern == "Minute"){
    col_pattern <- "Min"
  }

  column_pattern <- paste0("\\ \\(", col_pattern,"\\)")

  xls_names <- names(xls)
  xls_names <- gsub(column_pattern, "", xls_names)
  xls_names <- gsub(" ", "", xls_names)
  xls_names[1] <- "date"

  names(xls) <- xls_names
  return(xls)
}
