\name{plotCGP}
\alias{plotCGP}

\title{
Jackknife (leave-one-out) actual by predicted diagnostic plot
}
\description{
Draw jackknife (leave-one-out) actual by predicted plot to measure goodness-of-fit.
}
\usage{
plotCGP(object)
}

\arguments{
  \item{object}{
An object of class "\code{CGP}"
}
}
\details{
Draw the actual observed values on the y-axis and the jackknife (leave-one-out) predicted values on the x-axis. The goodness-of-fit can be measured by how well the points lie along the 45 degree diagonal line.
}
\value{
This function draws the jackknife (leave-one-out) actual by predicted plot. 
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
x1<-c(0,.02,.075,.08,.14,.15,.155,.156,.18,.22,.29,.32,.36,
.37,.42,.5,.57,.63,.72,.785,.8,.84,.925,1)
x2<-c(.29,.02,.12,.58,.38,.87,.01,.12,.22,.08,.34,.185,.64,
.02,.93,.15,.42,.71,1,0,.21,.5,.785,.21)
X<-cbind(x1,x2)
yobs<-x1^2+x2^2

#The CGP model
mod<-CGP(X,yobs,nugget_l=0.001)
plotCGP(mod)

}