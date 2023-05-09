#' Prepare BC data frame to be openair friendly
#'
#' @param bc_merged Merged data.tables into one data.table.
#' @param bc_columns Boolean, if TRUE, returns only BC colums in ug/m3.
#'
#' @return data.frame with a date column as POSIXct.
#' @noRd
#' @keywords internal
prepare_bc_data_frame <- function(bc_merged, bc_columns = TRUE){
  bc_merged <- as.data.frame(bc_merged)
  bc_data_names <- c(
    "Date", "Time", "Timebase", "RefCh1", "Sen1Ch1", "Sen2Ch1", "RefCh2",
    "Sen1Ch2", "Sen2Ch2", "RefCh3", "Sen1Ch3", "Sen2Ch3", "RefCh4", "Sen1Ch4",
    "Sen2Ch4", "RefCh5", "Sen1Ch5", "Sen2Ch5", "RefCh6", "Sen1Ch6", "Sen2Ch6",
    "RefCh7", "Sen1Ch7", "Sen2Ch7", "Flow1", "Flow2", "FlowC", "Pressure",
    "Temperature", "BB", "ContTemp", "SupplyTemp", "Status", "ContStatus",
    "DetectStatus", "LedStatus", "ValveStatus", "LedTemp", "BC11", "BC12",
    "BC1", "BC21", "BC22", "BC2", "BC31", "BC32", "BC3", "BC41", "BC42", "BC4",
    "BC51", "BC52", "BC5", "BC61", "BC62", "BC6", "BC71", "BC72", "BC7", "K1",
    "K2", "K3", "K4", "K5", "K6", "K7", "TapeAdvCount"
  )

  names(bc_merged) <- bc_data_names

  bc_merged$date <- paste(bc_merged$Date, bc_merged$Time)
  bc_merged$date <- as.POSIXct(
    strptime(bc_merged$date, format = "%Y/%m/%d %H:%M:%OS"),
    tz = "America/Sao_Paulo"
  )

  if (bc_columns){
    bc_vars <- c(paste0("BC", seq(1,7)), "BB")
    bc_columns <- c("date", bc_vars)
    bc <- bc_merged[bc_columns]
    bc[, bc_vars[1:7]] <- bc[, bc_vars[1:7]] / 1000
    return(bc)
  }
  return(bc_merged)
}
