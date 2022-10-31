\name{japan}
\docType{data}
\alias{japan}
\alias{japanMapEnv}
\title{
Japan Map
}
\description{
This database produces a map of Japan, including prefecture boundaries.
}
\format{
The data file is merely an assignment to a character string which
specifies the name of an environment variable which contains the
base location of the binary files used by the map drawing functions.
This environment variable (\code{R_MAPDATA_DATA_DIR} for the datasets in the
mapdata package) is set at package load time.
}
\source{
Thanks to Ritei Shibata of Keio University for the formatted data.
}
\seealso{
\code{\link[maps]{map}}, \code{\link[maps]{world}}
}
\examples{
map('japan')
}
\references{
Richard A. Becker, and Allan R. Wilks,
"Maps in S",
\emph{AT&T Bell Laboratories Statistics Research Report [93.2], 1993.}

Richard A. Becker, and Allan R. Wilks,
"Constructing a Geographical Database",
\emph{AT&T Bell Laboratories Statistics Research Report [95.2], 1995.}
}
\keyword{datasets}
