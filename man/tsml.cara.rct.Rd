\name{tsml.cara.rct}
\alias{tsml.cara.rct}
\alias{tsml.cara.rct}
\title{Targeted  Minimum Loss  Covariate-Adjusted  Response-Adaptive RCT Design and Statistical Analysis}
\description{Simulates a targeted minimum loss covariate-adjusted response-adaptive RCT
design and statistical analysis.}
\usage{tsml.cara.rct(what = c("ATE", "MOR"), flavor = c("parametric", 
    "lasso"),
    ninit = 50, by = 25, nmax = 500, tm.init = oneOne, 
    tm.ref =  oneOne, learnQ,  tm.model = formula(A  ~ 1),  tm.control =
    glm.control(maxit = 500),
    Gmin = 0.01, Gexpl = 0.01, threxpl = 0.01, Qmin = 0.01, conf.level = 0.95, 
    verbose = FALSE, piV = c(1/2, 1/3, 1/6), family = c("beta", 
        "gamma"), Qbar = Qbar1, Vbar = Vbar1, Bn = 1e+05, slice.by = 1e+05)}
\arguments{
  \item{what}{A  \code{character}  indicating the  parameter  of  interest to  estimate.
Either "ATE" for the Average  Treatment Effect, the difference between the
means under  '\eqn{do(A=1)}' and  '\eqn{do(A=0)}', or  "MOR" for  the Mean
under the Optimal treatment Rule '\eqn{do(A=r(W))}'.}
  \item{flavor}{A \code{character}  indicating the  'flavor' of the  procedure. }
  \item{ninit}{An     \code{integer},    number    of     subjects    to     sample    at
initialization. Defaults to 50.}
  \item{by}{An  \code{integer},  number of  subjects  to  sample  at each  step  after
initialization. Defaults to 25.}
  \item{nmax}{An  \code{integer},  maximum  number  of  subjects to  sample  during  the
trial. Must be larger than 'ninit+by'. Defaults to 500.}
  \item{tm.init}{A  \code{function}  describing  the  initial  treatment  mechanism  to  be
employed.   Defaults  to  the  balanced  (1:1)  treatment  mechanism,  ie,
\code{function} \code{\link{oneOne}}.}
  \item{tm.ref}{A  \code{function}  describing the  reference  treatment  mechanism to  be
employed.   Defaults  to  the  balanced  (1:1)  treatment  mechanism,  ie,
\code{function} \code{\link{oneOne}}.}
  \item{learnQ}{A  model  \eqn{{\cal Q}}  of  conditional  expectations of  \eqn{Y}  given
\eqn{(A,W)}  for  both  flavors  'parametric'  and  'lasso',  given  as  a
\code{formula}  or  a  \code{function}  outputing  formulas.  Defaults  to
\code{formula(Y~1)} for flavors  'parametric' and 'lasso'.}
  \item{tm.model}{A parametric model \eqn{{\cal G}}  of treatment mechanisms, used only when
'what'  equals  "ATE".   The   procedure  targets  the  optimal  treatment
mechanism within this model.  Defaults to \code{formula(A~1)}.}
  \item{tm.control}{A  \code{list} of  options for  the targeting  of the  treatment mechanism
within the  model defined by  argument 'tm.model'.  Used only  when 'what'
equals "ATE", it defaults to \code{glm.control(maxit=500)}.}
  \item{Gmin}{A  small positive  \code{numeric}, with  default value  \code{1e-2}.  When
\code{what} equals 'ATE', it is  the minimum value of elements of the
parametric  model \eqn{{\cal  G}}  of treatment  mechanisms (see  argument
\code{tm.model}).  The  maximum value is  \code{1-Gmin}.  When \code{what}
equals 'MOR', it  is the minimum value of  the conditional probability
of \eqn{A=r_n(W)} given \eqn{W}.}
  \item{Gexpl}{A small positive \code{numeric}, with default value \code{1e-2}, only used
when  \code{what} equals  'MOR',  in which  case  it lower-bounds  the
conditional  probability  of  \eqn{A=1-r_n(W)}  given  \eqn{W}.}
  \item{threxpl}{Either a small positive \code{numeric}, with default value \code{1e-2}, or
a  \code{function} of  sample size  giving  such numbers,  only used  when
\code{what}  equals 'MOR'.  If  \eqn{0\in[Q_n-\theta,Q_n+\theta]} with
\eqn{\theta} equal  to \code{threxpl} then \eqn{r_n(W)}  is the proportion
of the interval which lies  above 0, thresholded at levels \code{Gmin} and
\code{1-Gmin}.}
  \item{Qmin}{A  small positive  \code{numeric}, the  minimum value  of  scaled outcomes
\eqn{Y}. The maximum value is \code{1-Qmin}.}
  \item{conf.level}{A  \code{numeric},  the  confidence  level of  the  resulting  confidence
interval.}
  \item{verbose}{A \code{logical}  or an \code{integer}  indicating the level  of verbosity
(defaults to 'FALSE').}
  \item{piV}{Marginal distribution of \eqn{V}. Defaults to \code{c(1/2, 1/3, 1/6)}.}
  \item{family}{A \code{character}, either "beta" (default)  or "gamma", the nature of the
law of outcome.}
  \item{Qbar}{A   \code{function},  the   conditional  expectation   of   \eqn{Y}  given
\eqn{(A,W)}. Defaults to \code{Qbar1}.}
  \item{Vbar}{A   \code{function},   the   conditional   variance   of   \eqn{Y}   given
\eqn{(A,W)}. Defaults to \code{Vbar1}.}
  \item{Bn}{An \code{integer}, the sample size used  to estimate the true value of the
data-adaptive parameter at  each step of the procedure  when 'what' equals
'MOR'. Defaults to 1e5.}
  \item{slice.by}{An \code{integer}. If it is smaller than argument 'n' of 'getSample', then
the simulation  is decomposed  into 'n\%/\%slice.by' smaller  simulations of
'slice.by' observations and one of 'n\%\%slice.by' observations. Defaults to
1e5 (hence, no decomposition if 'n' smaller than 4e5). Mainly for internal
use.}
}

\value{Returns a  \code{TSMLCARA} object  which summarizes the  TSMLCARA undertaken
procedure.}
\references{Chambaz, van der Laan,  Zheng, Chapter  16, Modern Adaptive Randomized Clinical  Trials: Statistical, Operational, and Regulatory    Aspects,    by    A.    Sverdlov    (CRC    Press,    2015). }
\author{Antoine Chambaz [aut, cre]}



\seealso{update, targetPsi, getSample}
\examples{
##
log <- Arguments$getVerbose(-1, timestamp=TRUE)
set.seed(12345)

## ## ########################
## ## AVERAGE TREATMENT EFFECT
## ## ########################


## psi.sd <- sqrt(getOptVar(n=1e5,
##                         tm.model=formula(A~1),
##                         piV=c(1/2, 1/3, 1/6),
##                         family="gamma",
##                         Qbar=Qbar1,
##                         Vbar=Vbar1))
## truth <- c(psi=91/72, psi.sd=psi.sd)

## ## parametric example
## tm.model <- formula(A~.)

## learnQ <- formula(Y~I(as.integer(A)):(U+V)+I(as.integer(1-A)):(U+V))
## ATE.param <- tsml.cara.rct(what="ATE",
##                           flavor="parametric",
##                           ninit=250,
##                           by=100,
##                           nmax=2500,
##                           tm.init=oneOne,
##                           tm.ref=oneOne,
##                           learnQ=learnQ,
##                           tm.model=tm.model,
##                           conf.level=0.95,
##                           piV=c(1/2, 1/3, 1/6),
##                           family="gamma",
##                           Qbar=Qbar1,
##                           Vbar=Vbar1)
## ATE.param
## plot(ATE.param, truth=truth)

## ## lasso example
## learnQ <- formula(Y~I(as.integer(A)):(poly(U, 3)*V)+I(as.integer(1-A)):(poly(U, 3)*V))
## ATE.lasso <- tsml.cara.rct(what="ATE",
##                           flavor="lasso",
##                           ninit=250,
##                           by=100,
##                           nmax=2500,
##                           learnQ=learnQ,
##                           tm.init=oneOne,
##                           tm.ref=oneOne,
##                           tm.model=tm.model,
##                           conf.level=0.95,
##                           piV=c(1/2, 1/3, 1/6),
##                           family="gamma",
##                           Qbar=Qbar1,
##                           Vbar=Vbar1)
## ATE.lasso
## x11()
## plot(ATE.lasso, truth=truth)

## ## manually, another parametric example
## learnQ <- formula(Y~A*V)
## tm.model <- formula(A~V)

## obs <- getSample(200, 
##                  piV=c(1/2, 1/3, 1/6),
##                  family="gamma",
##                  Qbar=Qbar1,
##                  Vbar=Vbar1)
## nobs <- nrow(obs)
## ATE.param2 <- tsml.cara.rct:::TSMLCARA(what="ATE",
##                       obs=obs,
##                       learnQ=learnQ,
##                       tm.model=tm.model,
##                       Gmin=1e-2,
##                       flavor="parametric",
##                       verbose=log)
## while (nobs<=900) {
##   tsml.cara.rct:::update(ATE.param2, verbose=log)
##   tsml.cara.rct:::targetPsi(ATE.param2, verbose=log)
##   newObs <- getSample(100, tm=getGstar(ATE.param2),
##                       piV=c(1/2, 1/3, 1/6),
##                       family="gamma",
##                       Qbar=Qbar1,
##                       Vbar=Vbar1)
##   tsml.cara.rct:::addNewSample(ATE.param2, newObs)
##   nobs <- nrow(getObs(ATE.param2))
## }
## tsml.cara.rct:::update(ATE.param2, verbose=log)
## tsml.cara.rct:::targetPsi(ATE.param2, verbose=log)
## ATE.param2
## x11()
## plot(ATE.param2, truth=truth)

## ##################################
## MEAN OF THE OPTIMAL TREATMENT RULE
## ##################################

set.seed(54321)
truth <- getSample(1e5,
                   tm=oneOne,
                   rule=NULL,
                   piV=c(1/2, 1/3, 1/6),
                   Qbar=Qbar2,
                   Vbar=Vbar2,
                   what="MOR",
                   family="beta")
## truth <- c(psi=2.58445, psi.sd=0.48729) ## CHECK!!!

## parametric example
learnQ <- formula(Y~I(A==1):(U+V)+I(A==0):(U+V))
MOR.param <- tsml.cara.rct(what="MOR",
                          flavor="parametric",
                          ninit=200,
                          by=100,
                          nmax=500,
                          tm.init=oneOne,
                          tm.ref=oneOne,
                          learnQ=learnQ,
                          conf.level=0.95,
                          piV=c(1/2, 1/3, 1/6),
                          Qbar=Qbar2,
                          Vbar=Vbar2,
                          family="beta")
MOR.param
## plot(MOR.param, truth=truth)

## lasso example
learnQ <- formula(Y~I(A==0)*poly(U, 3)*V+I(A==1)*poly(U, 3)*V)
MOR.lasso <- tsml.cara.rct(what="MOR",
                          flavor="lasso",
                          ninit=200,
                          by=100,
                          nmax=500,
                          learnQ=learnQ,
                          tm.init=oneOne,
                          tm.ref=oneOne,
                          conf.level=0.95,
                          piV=c(1/2, 1/3, 1/6),
                          Qbar=Qbar2,
                          Vbar=Vbar2,
                          family="beta")
MOR.lasso
## x11()
## plot(MOR.lasso, truth=truth)

## manually, another parametric example
learnQ <- formula(Y~I(A==1):U+I(A==0):U)

obs <- getSample(200,
                 piV=c(1/2, 1/3, 1/6),
                 Qbar=Qbar2,
                 Vbar=Vbar2,
                 family="beta")
nobs <- nrow(obs)
MOR.param2 <- tsml.cara.rct:::TSMLCARA(what="MOR",
                                      obs=obs,
                                      learnQ=learnQ,
                                      Gmin=1e-2,
                                      Qmin=1e-2,
                                      flavor="parametric", #"lasso",
                                      verbose=log)
while (nobs<=400) {
  tsml.cara.rct:::update.TSMLCARA(MOR.param2, verbose=log)
  tsml.cara.rct:::targetPsi.TSMLCARA(MOR.param2, verbose=log)
  newObs <- getSample(100, tm=tsml.cara.rct:::getGstar.TSMLCARA(MOR.param2),
                      piV=c(1/2, 1/3, 1/6),
                      Qbar=Qbar2,
                      Vbar=Vbar2,
                      family="beta")
  tsml.cara.rct:::addNewSample.TSMLCARA(MOR.param2, newObs)
  nobs <- nrow(getObs(MOR.param2))
}
tsml.cara.rct:::update.TSMLCARA(MOR.param2, verbose=log)
tsml.cara.rct:::targetPsi.TSMLCARA(MOR.param2, verbose=log)

MOR.param2
## x11()
## plot(MOR.param2, truth=truth)


}
