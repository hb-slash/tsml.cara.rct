\name{getOptTm}
\alias{getOptTm}
\title{Computes the Optimal Treatment Mechanism Within a Parametric Model}
\description{Computes the optimal  treatment mechanism within a  given parametric model
of  treatment  mechanisms.   The  computation  is  based  on  Monte  Carlo
simulation.}
\usage{getOptTm(tm.model = formula(A ~ 1), Gmin = 0.01, piV = c(1/2, 
    1/3, 1/6), family = c("beta", "gamma"), Qbar = Qbar1, Vbar = Vbar1, 
    n = 1000, tm.control = glm.control(maxit = 500), verbose = FALSE)}
\arguments{
  \item{tm.model}{A parametric  model \eqn{{\cal G}} of treatment  mechanisms. The procedure
targets  the optimal treatment  mechanism within  this model.  Defaults to
\code{formula(A~1)}.}
  \item{Gmin}{A  small positive  \code{numeric}, the  minimum value  of elements  of the
parametric  model \eqn{{\cal  G}}  of treatment  mechanisms (see  argument
\code{tm.model}). The maximum value is \code{1-Gmin}.}
  \item{piV}{Marginal distribution of \eqn{V}. Defaults to \code{c(1/2, 1/3, 1/6)}.}
  \item{family}{A \code{character}, either "beta" (default)  or "gamma", the nature of the
law of outcome.}
  \item{Qbar}{A   \code{function},  the   conditional  expectation   of   \eqn{Y}  given
\eqn{(A,W)}. Defaults to \code{Qbar1}.}
  \item{Vbar}{A   \code{function},   the   conditional   variance   of   \eqn{Y}   given
\eqn{(A,W)}. Defaults to \code{Vbar1}.}
  \item{n}{An  \code{integer}, the  sample size  of the  simulated data  set  used to
compute the optimal treatment mechanism.}
  \item{tm.control}{A \code{list}  of options to pass  to \code{glm} for the  targeting of the
treatment  mechanism  within the  model  defined  by argument  'tm.model'.
Defaults to \code{glm.control(maxit=500)}.}
  \item{verbose}{A \code{logical}  or an \code{integer}  indicating the level  of verbosity
(defaults to 'FALSE').}
}

\value{Returns  the  optimal  treatment  mechanism within  the  parametric  model
\eqn{{\cal G}}. }

\author{Antoine Chambaz [aut, cre]}



\seealso{getSample, getOptVar}

