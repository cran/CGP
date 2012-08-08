\name{predict.CGP}
\alias{predict.CGP}

\title{
Predict from the composite Gaussian process model
}
\description{
Compute predictions from the composite Gaussian process (CGP) model. 95\% prediction intervals can also be calculated.
}
\usage{
\method{predict}{CGP}(object, newdata = NULL, PI = FALSE, ...)
}

\arguments{
  \item{object}{
An object of class "\code{CGP}"
}
  \item{newdata}{
Optional. The matrix of predictive input locations, where each row of \code{newdata} corresponds to one predictive location
}
  \item{PI}{
If \code{TRUE}, 95\% prediction intervals are also calculated. Default is \code{FALSE}
}
  \item{\dots}{
For compatibility with generic method \code{predict}
}

}

\details{
Given an object of ``\code{CGP}'' class, this function predicts responses at unobserved \code{newdata} locations. If the \code{PI} is set to be \code{TRUE}, 95\% predictions intervals are also computed. 

If \code{newdata} is equal to the design matrix of the \code{object}, predictions from the CGP model will be identical to the \code{yobs} component of the \code{object} and the width of the prediction intervals will be shrunk to zero. This is due to the interpolating property of the predictor.
}
\value{
The function returns a list containing the following components:
\item{Yp}{Vector of predictive values at \code{newdata} locations (\code{Yp=gp+lp})}
\item{gp}{Vector of predictive values at \code{newdata} locations from the global process}
\item{lp}{Vector of predictive values at \code{newdata} locations from the local process}
\item{v}{Vector of predictive standardized local volatilities at \code{newdata} locations}
\item{Y_low}{If \code{PI=TRUE}, vector of 5\% predictive quantiles at \code{newdata} locations}
\item{Y_up}{If \code{PI=TRUE}, vector of 95\% predictive quantiles at \code{newdata} locations}
}
\references{
Ba, S. and V. Roshan Joseph (2012) ``Composite Gaussian Process Models for Emulating Expensive Functions''. \emph{Annals of Applied Statistics}, to appear.
}
\author{
Shan Ba <sba3@isye.gatech.edu> and V. Roshan Joseph <roshan@isye.gatech.edu>
}


\seealso{
\code{\link{CGP}}, \code{\link{summary.CGP}}
}
\examples{
### A simulated example from Gramacy and Lee (2012) ``Cases for the nugget 
### in modeling computer experiments''. \emph{Statistics and Computing}, 22, 713-722.

#Training data
X<-c(0.775,0.83,0.85,1.05,1.272,1.335,1.365,1.45,1.639,1.675,
1.88,1.975,2.06,2.09,2.18,2.27,2.3,2.36,2.38,2.39)
yobs<-sin(10*pi*X)/(2*X)+(X-1)^4

#Testing data
UU<-seq(from=0.7,to=2.4,by=0.001)
y_true<-sin(10*pi*UU)/(2*UU)+(UU-1)^4

plot(UU,y_true,type="l",xlab="x",ylab="y")
points(X,yobs,col="red")

#Fit the CGP model 
mod<-CGP(X,yobs)
summary(mod)

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

#Predict for the testing data 'UU'
modpred<-predict(mod,UU)

#Plot the fitted CGP model
#Red: final predictor; Blue: global trend
lines(UU,modpred$Yp,col="red",lty=3,lwd=2)
lines(UU,modpred$gp,col="blue",lty=5,lwd=1.8)

}

