\name{rivers}
\docType{data}
\alias{rivers}
\alias{riversMapEnv}
\title{
World Rivers Map Database
}
\description{
This database produces major rivers (and some lakes) which may be used
to add to an existing map. Unfortunately, there is no fine control over
which rivers are plotted, so all rivers which lie within the boundaries
of the current plot on display will be added.  Some of these may be
outside the boundaries of the map shown.
}
\format{
The data file is merely an assignment to a character string which
specifies the name of an environment variable which contains the
base location of the binary files used by the map drawing functions.
This environment variable (\code{R_MAPDATA_DATA_DIR} for the datasets in the
mapdata package) is set at package load time.
}
\seealso{
\code{\link[maps]{map}}, \code{\link[maps]{world}}
}
\examples{
map('usa')
map('rivers', add=TRUE)
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
