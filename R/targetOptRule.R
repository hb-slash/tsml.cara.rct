targetOptRule  <-  function(#Targets the Optimal Treatment Rule.
### Function to target the optimal treatment rule.
                            this,
### A \code{TSMLCARA} object, as created by \code{TSMLCARA}.
                            Q,
### A \code{function},  the fitted  estimating the conditional  expectation of
### \eqn{Y} given \eqn{(A,W)}.
                            ...,
### Additional parameters.
                          verbose=FALSE
### A \code{logical}  or an \code{integer}  indicating the level  of verbosity
### (defaults to 'FALSE').
                          ) {
  ## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ## Validate arguments
  ## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  ## Argument 'Gmin'
  Gmin <- getGmin(this)

  ## Argument 'Gexpl'
  Gexpl <- getGexpl(this)

  ## Argument 'threxpl'
  THREXPL <- getThrexpl(this)
  mode <- mode(THREXPL)
  if (mode=="numeric") {
    threxpl <- THREXPL
  } else {
    threxpl <- Arguments$getNumerics(THREXPL(nrow(getObs(this))), c(0, 1/2))
  }
  
  ## Argument 'Q'
  if (!mode(Q)=="function"|is.null(attr(Q, "model"))) {
    throw("Argument 'Q' must be a function as output by 'estimateQ'.")
  }
  
  ## Argument 'verbose'
  verbose <- Arguments$getVerbose(verbose)

  ## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ## Core
  ## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  coeffs <- attr(Q, "model")
  Gstar <- function(W) {
    q <- Q(1,W) - Q(0,W)
    pos <- (q > threxpl)
    neg <- (-q > threxpl)
    btwn <- !(pos|neg)
    ##
    out <- q
    out[pos] <- (1-Gexpl)
    out[neg] <- Gexpl
    out[btwn] <- pmin(1-Gmin, pmax(Gmin, (q[btwn]+threxpl)/(2*threxpl)))
    return(out)
  }

  attr(Gstar, "model") <- coeffs
  
  return(Gstar)
### Returns \code {Gstar}, a \code{function} of the same form as \code{oneOne}
### coding the treatment rule.  This function has a "model" attribute describing
### the fitted  conditional expectation of \eqn{Y} given  \eqn{(A,W)} which is
### used for its construction.
}

############################################################################
## HISTORY:
## 2016-09-16
## o Created.
############################################################################

