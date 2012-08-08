\name{CGP-package}
\alias{CGP-package}
\docType{package}
\title{
The composite Gaussian process model package
}
\description{
Build nonstationary surrogate models for emulating computationally-expensive computer simulations (computer models).  
} 
\details{
\tabular{ll}{
Package: \tab CGP\cr
Type: \tab Package\cr
Version: \tab 1.6-2\cr
Date: \tab 2012-08-08\cr
License: \tab LGPL-2.1\cr
}
This package contains functions for fitting the composite Gaussian process (CGP) model, which consists of two Gaussian processes (GPs). The first GP captures the smooth global trend and the second one models local details. The model also incorporates a flexible variance model, which makes it more capable of approximating surfaces with varying volatility. It can be used as an emulator (surrogate model) for approximating computationally expensive functions that are not second-order stationary. When the underlying surface is stationary, the fitted CGP model should degenerate to a standard (stationary) GP model (\eqn{\hat{\lambda}\approx 0}). 

The package implements maximum likelihood method to estimate model parameters and also provides predictions (with 5\% and 95\% prediction quantiles) for unobserved input locations. Leave-one-out cross validation diagnostic plot is also supported.   

\emph{Gaussian correlation functions} 
\deqn{g(\mathbf{h})=\exp(-\sum_{j=1}^p \theta_j h_j^2), \qquad l(\mathbf{h})=\exp(-\sum_{j=1}^p \alpha_j h_j^2)}
(with unknown parameters \eqn{\mathbf{\theta}} and \eqn{\mathbf{\alpha}}) are used to describe the correlations in the global and local processes respectively. 

For a complete list of functions, please use \code{help(package="CGP")}. Important functions are \code{\link{CGP}}, \code{\link{summary.CGP}}, \code{\link{predict.CGP}} and {\link{plotCGP}}. 

}
\author{
Shan Ba and V. Roshan Joseph

Maintainer: Shan Ba <sba3@isye.gatech.edu>

}
\references{
Ba, S. and V. Roshan Joseph (2012). Composite Gaussian Process Models for Emulating Expensive Functions. Annals of Applied Statistics, to appear.
}

\keyword{ package }

