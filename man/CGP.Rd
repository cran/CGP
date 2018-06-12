\name{CGP}
\alias{CGP}

\title{
Fit composite Gaussian process models
}
\description{
Estimate parameters in the composite Gaussian process (CGP) model using maximum likelihood methods. Calculate the root mean squared (leave-one-out) cross validation error for diagnosis, and export intermediate values to facilitate \code{predict.CGP} function.
}
\usage{
CGP(X, yobs, nugget_l = 0.001, num_starts = 5, 
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
This function fits a composite Gaussian process (CGP) model based on the given design matrix \code{X} and the observed responses \code{yobs}. The fitted model consists of a smooth GP to caputre the global trend and a local GP which is augmented with a flexible variance model to capture the change of local volatilities. For \eqn{p} input variables, such two GPs involve \eqn{2p+2} unknown parameters in total. As demonstrated in Ba and Joseph (2012), by assuming \eqn{\alpha_j=\theta_j+\kappa} for \eqn{j=1,\ldots,p}, fitting the CGP model only requires estimating \eqn{p+3} unknown parameters, which is comparable to fitting a stationary GP model (\eqn{p} unknown parameters).
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
\item{var_names}{Vector of input variable names}
\item{Sig_matrix}{Diagonal matrix containing standardized local variances at each of the design points}
\item{sf}{Standardization constant for rescaling the local variance model}
\item{res2}{Vector of squared residuals from the estimated global trend}
\item{invQ}{Matrix of \eqn{(\mathbf{G}+\lambda\mathbf{\Sigma}^{1/2}\mathbf{L}\mathbf{\Sigma}^{1/2})^{-1}}}
\item{temp_matrix}{Matrix of \eqn{(\mathbf{G}+\lambda\mathbf{\Sigma}^{1/2}\mathbf{L}\mathbf{\Sigma}^{1/2})^{-1} (\mathbf{y}- \hat{\mu}\mathbf{1})}}
}
\references{
Ba, S. and V. Roshan Joseph (2012) ``Composite Gaussian Process Models for Emulating Expensive Functions''. \emph{Annals of Applied Statistics}, 6, 1838-1860.
}
\author{
Shan Ba <shanbatr@gmail.com> and V. Roshan Joseph <roshan@isye.gatech.edu>
}

\seealso{
\code{\link{predict.CGP}}, \code{\link{print.CGP}}, \code{\link{summary.CGP}}
}

\examples{

x1<-c(0,.02,.075,.08,.14,.15,.155,.156,.18,.22,.29,.32,.36,
      .37,.42,.5,.57,.63,.72,.785,.8,.84,.925,1)
x2<-c(.29,.02,.12,.58,.38,.87,.01,.12,.22,.08,.34,.185,.64,
      .02,.93,.15,.42,.71,1,0,.21,.5,.785,.21)
X<-cbind(x1,x2)
yobs<-sin(1/((x1*0.7+0.3)*(x2*0.7+0.3)))

\dontrun{
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
}