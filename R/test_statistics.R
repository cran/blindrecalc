# abstract class 'TestStatistic' for internal use
setClass("TestStatistic", slots = c(
  alpha       = "numeric",
  beta        = "numeric",
  r           = "numeric",
  delta       = "numeric",
  delta_NI    = "numeric",
  alternative = "character",
  n_max       = "numeric"
))

#' Student's t test
#'
#' This class implements Student's t-test for superiority and non-inferiority
#' tests.
#' A trial with continuous outcomes of the two groups \code{E} and \code{C}
#' is assumed.
#' If \code{alternative == "greater"} the null hypothesis for the
#' mean difference \eqn{\Delta = \mu_E - \mu_C} is
#' \deqn{H_0: \Delta \leq -\delta_{NI} \textrm{ vs. } H_1: \Delta > -\delta_{NI}.}
#' Here, \eqn{\delta_{NI} \geq 0} denotes the non-inferiority margin.
#' For superiority trials,\eqn{\delta_{NI}} can be set to zero (default).
#' If \code{alternative=="smaller"}, the direction of the effect is changed.
#'
#' @details The nuisance parameter is the variance \eqn{\sigma^2}.
#' Within the blinded sample size recalculation procedure, it is re-estimated by
#' the one-sample variance estimator that is defined by
#' \deqn{\widehat{\sigma}^2
#' := \frac{1}{n_1-1} \sum_{j \in \{T, C \}}
#'  \sum_{k=1}^{n_{1,j}}(x_{j,k} - \bar{x} )^2,}
#' where \eqn{x_{j,k}} is the outcome of patient \eqn{k} in group \eqn{j},
#' \eqn{n_{1,j}} denotes the first-stage sample size in group \eqn{j} and
#' \eqn{\bar{x}} equals the mean over all \eqn{n_1} observations.
#' The following methods are available for this class:
#' \code{\link{toer}}, \code{\link{pow}}, \code{\link{n_dist}},
#' \code{\link{adjusted_alpha}}, and \code{\link{n_fix}}.
#' Check the design specific documentation for details.
#'
#' @references Lu, K. (2019).
#' Distribution of the two-sample t-test statistic following blinded
#' sample size re-estimation. Pharmaceutical Statistics 15(3): 208-215.
#'
#' @aliases Student
#' @rdname Student
#' @exportClass Student
setClass("Student", contains = "TestStatistic")


#' Chi-squared test
#'
#' This class implements a chi-squared test for superiority trials. A trial
#' with binary outcomes in two groups \code{E} and \code{C} is assumed. If
#' \code{alternative == "greater"} the null and alternative hypotheses for the
#' difference in response probabilities are
#' \deqn{H_0: p_E \leq p_C \textrm{ vs. } H_1: p_E > p_C.}
#' If \code{alternative == "smaller"}, the direction of the effect is changed.
#'
#' @details The nuisance parameter is the overall response probability \eqn{p_0}.
#' In the blinded sample size #' recalculation procedure it is blindly estimated
#' by: \deqn{\hat{p}_0 := (X_{1,E} + X_{1,C}) / (n_{1,E} + n_{1,C}),}
#' where \eqn{X_{1,E}} and \eqn{X_{1,C}} are the numbers of
#' responses and \eqn{n_{1,E}} and \eqn{n_{1,C}} are the sample sizes
#' of the respective group after the first stage. The event rates in both
#' groups under the alternative hypothesis can then be blindly estimated as:
#' \deqn{\hat{p}_{C,A} := \hat{p}_0 - \Delta \cdot r / (1 + r) \textrm{, }
#' \hat{p}_{E,A} := \hat{p}_0 + \Delta / (1 + r),}
#' where \eqn{\Delta} is the difference in response probabilities under the
#' alternative hypothesis and r is the allocation ratio of the sample sizes
#' in the two groups.
#' These blinded estimates can then be used to re-estimate the sample size.
#'
#' The following methods are available for this class:
#' \code{\link{toer}}, \code{\link{pow}}, \code{\link{n_dist}},
#' \code{\link{adjusted_alpha}}, and \code{\link{n_fix}}.
#' Check the design specific documentation for details.
#'
#' @references
#' Friede, T., & Kieser, M. (2004). Sample size recalculation for binary data
#' in internal pilot study designs. Pharmaceutical Statistics:
#' The Journal of Applied Statistics in the Pharmaceutical Industry,
#' 3(4), 269-279. \cr
#' Kieser, M. (2020). Methods and applications of sample size calculation and
#' recalculation in clinical trials. Springer.
#' @aliases ChiSquare
#' @rdname ChiSquare
#' @exportClass ChiSquare
setClass("ChiSquare", contains = "TestStatistic")



#' Farrington Manning test
#'
#' This class implements a Farrington-Manning test for non-inferiority
#' trials. A trial with binary outcomes in two groups \code{E} and
#' \code{C} is assumed. The null and alternative hypotheses for the
#' non-inferiority of response probabilities are:
#' \deqn{H_0: p_E - p_C \leq -\delta \textrm{ vs. } H_1: p_E - p_C > -\delta,}
#' where \eqn{\delta} denotes the non-inferiority margin.
#'
#' @details The nuisance parameter is the overall response probability \eqn{p_0}.
#' In the blinded sample size recalculation procedure it is blindly estimated
#' by:
#' \deqn{\hat{p}_0 := (X_{1,E} + X_{1,C}) / (n_{1,E} + n_{1,C}),}
#' where
#' \eqn{X_{1,E}} and \eqn{X_{1,C}} are the numbers of responses and \eqn{n_{1,E}}
#' and \eqn{n_{1,C}} are the sample sizes of the respective group after the first stage.
#' The event rates in both groups under the alternative hypothesis can then be
#' blindly estimated as:
#' \deqn{\hat{p}_{C,A} := \hat{p}_0 - \Delta \cdot r / (1 + r) \textrm{, }
#' \hat{p}_{E,A} := \hat{p}_0 + \Delta / (1 + r),}
#' where \eqn{\Delta} is the difference in
#' response probabilities under the alternative hypothesis and r is the
#' allocation ratio of the sample sizes in the two groups.
#' These blinded estimates can then be used to re-estimate the sample
#' size.
#'
#' @references
#' Friede, T., Mitchell, C., & Mueller-Velten, G. (2007). Blinded sample size
#' reestimation in non-inferiority trials with binary endpoints.
#' Biometrical Journal, 49(6), 903-916. \cr
#' Kieser, M. (2020). Methods and applications of sample size calculation and
#' recalculation in clinical trials. Springer.
#'
#' @aliases FarringtonManning
#' @rdname FarringtonManning
#' @exportClass FarringtonManning
setClass("FarringtonManning", contains = "TestStatistic")



#' Student's t-test
#'
#' The function \code{setupStudent} creates an object of class
#' \code{\link{Student}} that can be used for sample size recalculation.
#'
#' @template setup
#' @template NI
#' @template alternative
#' @template dotdotdot
#'
#' @return An object of class \code{\link{Student}}.
#'
#' @examples
#' d <- setupStudent(alpha = .025, beta = .2, r = 1, delta = 3.5, delta_NI = 0,
#'                   alternative = "greater", n_max = 156)
#' @rdname Student
#' @export
setupStudent <- function(alpha, beta, r = 1, delta, delta_NI = 0,
                         alternative = c("greater", "smaller"), n_max = Inf, ...) {

  if (delta_NI < 0)
    stop("the non-inferiority margin must be non-negative!")

  if (all(alternative == "smaller", delta_NI != 0))
    stop("smaller alternatives are not possible for non-inferiority tests!")

  if (all(alternative == "smaller", delta > 0))
    stop("use negative effect sizes for power calculations if alternative == 'smaller'!")

  if (all(alternative == "greater", delta < 0))
    stop("use positive effect sizes for power calculations if alternative == 'greater'!")

  new("Student", alpha = alpha, beta = beta, r = r, delta = delta,
      delta_NI = -delta_NI, alternative = match.arg(alternative), n_max = n_max)
}



#' Setup a chi-squared test
#'
#' The function \code{setupChiSquare} creates an object of class
#' \code{\link{ChiSquare}}.
#'
#' @template setup
#' @template alternative
#' @template dotdotdot
#'
#' @details For non-inferiority trials use the function \code{\link{setupFarringtonManning}}.
#'
#' @return An object of class \code{\link{ChiSquare}}.
#'
#' @examples
#' design <- setupChiSquare(alpha = .025, beta = .2, r = 1, delta = 0.2,
#' alternative = "greater")
#'
#' @rdname ChiSquare
#' @export
setupChiSquare <- function(alpha, beta, r = 1, delta,
                           alternative = c("greater", "smaller"), n_max = Inf, ...) {
  new("ChiSquare", alpha = alpha, beta = beta, r = r, delta = delta,
      delta_NI = 0, alternative = match.arg(alternative), n_max = n_max)
}



#' Setup a Farrington-Manning test
#'
#' The function \code{\link{setupFarringtonManning}} creates an object of
#' \code{\link{FarringtonManning}}.
#'
#' @template setup
#' @template NI
#' @template dotdotdot
#'
#' @return An object of class \code{\link{FarringtonManning}}.
#'
#' @examples
#' design <- setupFarringtonManning(alpha = .025, beta = .2, r = 1, delta = 0,
#' delta_NI = .15)
#'
#' @rdname FarringtonManning
#' @export
setupFarringtonManning <- function(alpha, beta, r = 1, delta, delta_NI, n_max = Inf, ...) {
  if (delta_NI == 0) warning("The non-inferiority margin equals 0! Do you want to conduct a chi square test?")
  new("FarringtonManning", alpha = alpha, beta = beta, r = r, delta = delta,
      delta_NI = delta_NI, alternative = "greater", n_max = n_max)
}
