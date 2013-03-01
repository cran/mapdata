\name{worldHires}
\docType{data}
\alias{worldHires}
\alias{worldHiresMapEnv}
\title{
World Map
}
\usage{data(worldHiresMapEnv)}
\description{
This world database comes from a cleaned-up version of the CIA
World Data Bank II data and contains approximately 2 million points
representing the world coastlines and national boundaries.  This
makes it suitable for extracting countries, continents, etc. while
still retaining lots of detail.

The `world2' database is a modified version of the `world' database
in which the longitude ranges from 0 through 360 degrees, instead of
-180 through 180.  This then allows maps of the whole Pacific Ocean for
example.
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
\code{\link[maps]{map}}, \code{\link[maps]{world}}
}
\examples{
map('worldHires', col=1:10)
map('worldHires', 'Switzerland')
title('Switzerland')
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
