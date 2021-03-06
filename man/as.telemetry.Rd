\name{as.telemetry}
\alias{as.telemetry}
\alias{as.telemetry.character}
\alias{as.telemetry.data.frame}
\alias{as.telemetry.Move}
\alias{summary.telemetry}
\encoding{UTF-8}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Import, coerce, and summarize MoveBank data}
\description{Functions to import MoveBank csv files, \code{data.frame}, and \code{Move} objects, coerce them into \code{telemetry} objects, and summarize them.}

\usage{
as.telemetry(object,timeformat="",timezone="UTC",projection=NULL,timeout=Inf,na.rm="row",
             mark.rm=FALSE,drop=TRUE,...)

\S3method{as.telemetry}{character}(object,timeformat="",timezone="UTC",projection=NULL,timeout=Inf,na.rm="row",
             mark.rm=FALSE,drop=TRUE,...)

\S3method{as.telemetry}{data.frame}(object,timeformat="",timezone="UTC",projection=NULL,timeout=Inf,na.rm="row",
             mark.rm=FALSE,drop=TRUE,...)

\S3method{as.telemetry}{Move}(object,timeformat="",timezone="UTC",projection=NULL,timeout=Inf,na.rm="row",
             mark.rm=FALSE,drop=TRUE,...)

\S3method{summary}{telemetry}(object,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{A MoveBank CSV filename, MoveBank \code{data.frame} object, or \code{Move} object to coarce, or a \code{telemetry} object to summarize.}
  \item{timeformat}{Format argument for \code{\link{strptime}}.}
  \item{timezone}{Timezone argument for \code{\link{strptime}}.}
  \item{projection}{Optional PROJ.4 projection argument to be fed to \code{\link[rgdal]{project}}.}
  %\item{UERE}{"User equivalent range errors" needed to translate DOP values into location uncertainty.}
  \item{timeout}{GPS location fix timeout value (seconds). Potentially useful for categorizing accuracy. \code{timeout=max} will use the maximum value.}
  \item{na.rm}{If some values are \code{NA} in the data frame, are the rows (times) deleted or are the columns (data types) deleted.}
  \item{mark.rm}{Delete Movebank manually marked outliers. Also see \code{\link{outlie}}.}
  \item{drop}{Only return a \code{telemetry} object for one individual if \code{TRUE}. Always return a \code{list} of telemetry objects if \code{FALSE}.}
  \item{...}{Optional arguments to be fed to \code{\link{fread}} or \code{\link{read.csv}}, in the case of compressed files.}
}

\details{
If no projection argument is specified, a two-point equidistant projection is calculated that should be good for most range resident and migratory species.
Global migrations that are not along one geodesic (locally straight line) will probably suffer distortion.

\code{as.telemetry} assumes \href{https://www.movebank.org/node/2381}{Movebank naming conventions}.
Sufficient MoveBank columns include \code{individual.local.identifier} (or \code{tag.local.identifier}), \code{timestamp}, \code{location.long} and \code{location.lat}, while the optional Movebank columns include (E-OBS) \code{eobs.horizontal.accuracy.estimate}, (Telonics) \code{GPS.Horizontal.Error}, \code{GPS.HDOP}, (ARGOS) \code{Argos.orientation}, \code{Argos.semi.minor} and \code{Argos.semi.major} or \code{Argos.location.class}, etc..

The \code{GPS.HDOP} value requires the device's UERE value to be translated into telemetry errors. The UERE represents the RMS error given ideal (\eqn{HDOP=1}) satellite conditions. Therefore, if your device is purported to have an accuracy of 10 meters, then the UERE is likely around 10 meters. Consult your device manual and manufacturer for a specific value or see \code{\link{uere}} for UERE calibration.
}

\value{\code{as.telemetry} returns a single \code{telemetry} object or list of \code{telemetry} objects if multiple animals are identified.}

%\references{}

\author{C. H. Fleming, X. Dong, B. Kranstauber, G. Péron, and K. Safi.}

%\note{}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{ \code{\link{plot.telemetry}}, \code{\link{SpatialPoints.telemetry}}, \code{\link{uere}}.  }

%\examples{
%# Load package and data
%library(ctmm)
%data(buffalo)

%# Extract movement data for a single animal
%billy <- buffalo[[1]]

%# Plot the data
%plot.telemetry(billy)
%}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
