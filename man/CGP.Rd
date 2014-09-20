\name{CGP}
\alias{CGP}

\title{
Composite Gaussian process models
}
\description{
Estimate parameters in the composite Gaussian process (CGP) model using maximum likelihood methods. Calculate the root mean squared (leave-one-out) cross validation error for diagnosis, and export intermediate values to facilitate \code{predict.CGP} function.  
}
\usage{
CGP(X, yobs, ...)
}

\arguments{
  \item{X}{The design matrix
}
  \item{yobs}{
The vector of response values, corresponding to the rows of \code{X}
}

  \item{...}{Optional arguments for the \code{CGPEst} function, including lower bound for the nugget parameter, number of random starts, etc. See \code{\link{CGPEst}} for details.
  }
}

\details{
This function calls the \code{CGPEst} function for fitting a composite Gaussian process (CGP) model based on the given design matrix \code{X} and the observed responses \code{yobs}. The fitted model consists of a smooth GP to caputre the global trend and a local GP which is augmented with a flexible variance model to capture the change of local volatilities. For \eqn{p} input variables, such two GPs involve \eqn{2p+2} unknown parameters in total. As demonstrated in Ba and Joseph (2012), by assuming \eqn{\alpha_j=\theta_j+\kappa} for \eqn{j=1,\ldots,p}, fitting the CGP model only requires estimating \eqn{p+3} unknown parameters, which is comparable to fitting a stationary GP model (\eqn{p} unknown parameters). 
}
\value{
This function fits the CGP model and returns an object of class ``\code{CGP}''. Function \code{predict.CGP} can be further used for making new predictions and function \code{summary.CGP} can be used to print a summary of the ``\code{CGP}'' object.

An object of class ``\code{CGP}'' is a list containing at least the following components:
\item{lambda}{Estimated nugget value \eqn{(\lambda)}}
\item{theta}{Vector of estimated correlation parameters \eqn{(\theta)} in the global GP}
\item{alpha}{Vector of estimated correlation parameters \eqn{(\alpha)} in the local GP}
\item{bandwidth}{Estimated bandwidth parameter \eqn{(b)} in the variance model}
\item{rmscv}{Root mean squared (leave-one-out) cross validation error}
\item{Yp_jackknife}{Vector of Jackknife (leave-one-out) predicted values}
\item{mu}{Estimated mean value \eqn{(\mu)} for global trend}
\item{tau2}{Estimated variance \eqn{(\tau^2)} for global trend}
\item{beststart}{Best starting value found for optimizing the log-likelihood}
\item{objval}{Optimal objective value for the negative log-likelihood (up to a constant)}

}
\references{
Ba, S. and V. Roshan Joseph (2012) ``Composite Gaussian Process Models for Emulating Expensive Functions''. \emph{Annals of Applied Statistics}, 6, 1838-1860.
}
\author{
Shan Ba <shanbatr@gmail.com> and V. Roshan Joseph <roshan@isye.gatech.edu>
}


\seealso{
\code{\link{predict.CGP}}, \code{\link{print.CGP}}, \code{\link{summary.CGP}}, \code{\link{CGPEst}}
}

\examples{

x1<-c(0,.02,.075,.08,.14,.15,.155,.156,.18,.22,.29,.32,.36,
      .37,.42,.5,.57,.63,.72,.785,.8,.84,.925,1)
x2<-c(.29,.02,.12,.58,.38,.87,.01,.12,.22,.08,.34,.185,.64,
      .02,.93,.15,.42,.71,1,0,.21,.5,.785,.21)
X<-cbind(x1,x2)
yobs<-sin(1/((x1*0.7+0.3)*(x2*0.7+0.3)))

#Fit the CGP model
#Increase the lower bound for nugget to 0.01 (Optional)
mod<-CGP(X,yobs,nugget_l=0.01)
summary(mod)

mod$objval
#-27.4537
mod$lambda
#0.6210284
mod$theta
#6.065497 8.093402 
mod$alpha
#143.1770 145.2049 
mod$bandwidth
#1
mod$rmscv
#0.5714969

}