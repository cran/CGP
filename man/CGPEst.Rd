\name{CGPEst}
\alias{CGPEst}

\title{
Estimate composite Gaussian process models
}
\description{
Estimate parameters in the composite Gaussian process (CGP) model using maximum likelihood methods. Calculate the root mean squared (leave-one-out) cross validation error for diagnosis, and export intermediate values to facilitate \code{predict.CGP}. This function is usually called by the generic function \code{\link{CGP}}. 
}
\usage{
CGPEst(X, yobs, nugget_l = 0.001, num_starts = 5, 
         theta_l = NULL, alpha_l = NULL, kappa_u = NULL)
}

\arguments{
  \item{X}{The design matrix
}
  \item{yobs}{
The vector of response values, corresponding to the rows of \code{X}
}

  \item{nugget_l}{
Optional, default is ``0.001''. The lower bound for the nugget value (\eqn{\lambda} in the paper)
}
  \item{num_starts}{
Optional, default is ``5''. Number of random starts for optimizing the likelihood function
}
  \item{theta_l}{
Optional, default is ``0.0001''. The lower bound for all correlation parameters in the global GP (\eqn{\theta} in the paper)
}
  \item{alpha_l}{
Optional. The lower bound for all correlation parameters in the local GP (\eqn{\alpha} in the paper). It is also the upper bound for all correlation parameters in the global GP (the \eqn{\theta}).
Default is \code{log(100)*mean(1/dist(Stand_X)^2)}, where \code{Stand_X<-apply(X,2,function(x) (x-min(x))/max(x-min(x)))}. Please refer to Ba and Joseph (2012) for details
}
  \item{kappa_u}{
Optional. The upper bound for \eqn{\kappa}, where we define \eqn{\alpha_j=\theta_j+\kappa} for \eqn{j=1,\ldots,p}. Default value is \code{log(10^6)*mean(1/dist(Stand_X)^2)}, \\ where \code{Stand_X<-apply(X,2,function(x) (x-min(x))/max(x-min(x)))}
}
}

\details{
This function is to be called by the generic function \code{CGP}. It estimates parameters in the composite Gaussian process (CGP) model using maximum likelihood methods, calculates the root mean squared (leave-one-out) cross validation error to measure goodness-of-fit, and also computes intermediate values to facilitate \code{predict.CGP}.
}
\value{
This function returns a list containing at least the following components:
\item{var_names}{Vector of input variable names}
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
\item{Sig_matrix}{Diagonal matrix containing standardized local variances at each of the design points}
\item{sf}{Standardization constant for rescaling the local variance model}
\item{res2}{Vector of squared residuals from the estimated global trend}
\item{invQ}{Matrix of \eqn{(\mathbf{G}+\lambda\mathbf{\Sigma}^{1/2}\mathbf{L}\mathbf{\Sigma}^{1/2})^{-1}}}
\item{temp_matrix}{Matrix of \eqn{(\mathbf{G}+\lambda\mathbf{\Sigma}^{1/2}\mathbf{L}\mathbf{\Sigma}^{1/2})^{-1} (\mathbf{y}- \hat{\mu}\mathbf{1})}}
}
\references{
Ba, S. and V. Roshan Joseph (2012) ``Composite Gaussian Process Models for Emulating Expensive Functions''. \emph{Annals of Applied Statistics}, to appear.
}
\author{
Shan Ba <sba3@isye.gatech.edu> and V. Roshan Joseph <roshan@isye.gatech.edu>
}


\seealso{
\code{\link{CGP}}
}

\examples{

#Training data
X<-c(0.775,0.83,0.85,1.05,1.272,1.335,1.365,1.45,1.639,1.675,
1.88,1.975,2.06,2.09,2.18,2.27,2.3,2.36,2.38,2.39)
yobs<-sin(10*pi*X)/(2*X)+(X-1)^4

#Fit the CGP model 
mod<-CGPEst(X,yobs)

mod$objval
#-40.17315
mod$lambda
#0.01877432
mod$theta
#2.43932
mod$alpha
#578.0898
mod$bandwidth
#1
mod$rmscv
#0.3035192

}