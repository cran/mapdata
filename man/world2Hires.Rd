\name{world2Hires}
\docType{data}
\alias{world2Hires}
\alias{world2HiresMapEnv}
\alias{world2Lores}
\alias{world2LoresMapEnv}
\title{
Pacific Centric World Map
}
\usage{
data(world2HiresMapEnv)
data(world2LoresMapEnv)
}
\description{
This world database comes from a cleaned-up version of the CIA
World Data Bank II data and contains approximately 2 million points
representing the world coastlines and national boundaries.  This
map is based on latitudes [0, 360), which then has the Pacific
Ocean in the centre of the map.
}
\format{
The data file is merely an assignment to a character string which
specifies the name of an environment variable which contains the
base location of the binary files used by the map drawing functions.
This environment variable (\code{R_MAPDATA_DATA_DIR} for the datasets in the
mapdata package) is set at package load time.
}
\source{
The CIA World Data Bank II is currently (mid-2003) available from 
\url{http://www.evl.uic.edu/pape/data/WDB/}.
}
\seealso{
\code{\link[maps]{map}}, \code{\link[maps]{world}}, \code{\link{worldHires}},
\code{\link[maps]{world2}}
}
\examples{
map('world2Hires', xlim=c(100, 300))
}
\references{
Richard A. Becker, and Allan R. Wilks,
"Maps in S",
\emph{AT\&T Bell Laboratories Statistics Research Report [93.2], 1993.}

Richard A. Becker, and Allan R. Wilks,
"Constructing a Geographical Database",
\emph{AT\&T Bell Laboratories Statistics Research Report [95.2], 1995.}
}
\keyword{datasets}
