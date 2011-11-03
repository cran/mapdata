.onLoad <- function(lib, pkg) {
  if(!exists("Sys.setenv", envir = baseenv()))
    Sys.setenv <- Sys.putenv
  Sys.setenv("R_MAPDATA_DATA_DIR"=paste(lib, pkg, "mapdata/", sep="/"))
}
