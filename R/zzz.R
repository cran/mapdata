.First.lib <- function(lib, pkg) {
	Sys.putenv("R_MAPDATA_DATA_DIR"=paste(lib, pkg, "mapdata/", sep="/"))
	require(maps)
}
