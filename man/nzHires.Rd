\name{nzHires}
\docType{data}
\alias{nzHires}
\alias{nzHiresMapEnv}
\title{
New Zealand Map
}
\description{
This database produces a high-resolution map of New Zealand.  The
database includes many Pacific Island dependencies also.
}
\format{
The data file is merely an assignment to a character string which
specifies the name of an environment variable which contains the
base location of the binary files used by the map drawing functions.
This environment variable (\code{R_MAPDATA_DATA_DIR} for the datasets in the
mapdata package) is set at package load time.
}
\seealso{
\code{\link[maps]{map}}, \code{\link[maps]{world}}, \code{\link[maps]{nz}}
}
\examples{
map('nzHires')
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
