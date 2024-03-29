% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods.R
\name{toer}
\alias{toer}
\title{Type I Error Rate}
\usage{
toer(design, n1, nuisance, recalculation, ...)
}
\arguments{
\item{design}{object of class \code{TestStatistic} created by \code{setup}}

\item{n1}{total number of patients that are recruited before the sample size
is recalculated}

\item{nuisance}{nuisance parameter that is estimated at the interim analysis}

\item{recalculation}{Should the sample size be recalculated after n1
n1 patients are recruited?}

\item{...}{Further optional arguments.}
}
\value{
One type I error rate value for every nuisance parameter and every value of n1.
}
\description{
Computes the type I error rate of designs with blinded sample size recalculation
or of fixed designs for one or several values of the nuisance parameter.
}
\details{
The method is only vectorized in either \code{nuisance}
  or \code{n1}.

The method is implemented for the classes \code{\link{Student}},
\code{\link{ChiSquare}}, and \code{\link{FarringtonManning}}.
}
\examples{
d <- setupStudent(alpha = .025, beta = .2, r = 1, delta = 3.5, delta_NI = 0,
                  alternative = "greater", n_max = 156)
toer(d, n1 = 20, nuisance = 5.5, recalculation = TRUE)

}
