\name{print.CGP}
\alias{print.CGP}

\title{
CGP model summary information
}
\description{
Print a brief summary of a ``\code{CGP}'' object.
}
\usage{
\method{print}{CGP}(x, ...)
}

\arguments{
  \item{x}{
An object of class "\code{CGP}"
}
  \item{\dots}{
For compatibility with generic method \code{print}
}
}
\details{
This function prints a brief summary of a ``\code{CGP}'' object. 
}
\value{
This function prints the results of:
\item{lambda}{Estimated nugget value \eqn{(\lambda)}}
\item{theta}{Estimated correlation parameters \eqn{(\theta)} in the global GP}
\item{alpha}{Estimated correlation parameters \eqn{(\alpha)} in the local GP}
\item{bandwidth}{Estimated bandwidth parameter \eqn{(b)} in the variance model}
}
\references{
Ba, S. and V. Roshan Joseph (2012) ``Composite Gaussian Process Models for Emulating Expensive Functions''. \emph{Annals of Applied Statistics}, 6, 1838-1860.
}
\author{
Shan Ba <shanbatr@gmail.com> and V. Roshan Joseph <roshan@isye.gatech.edu>
}


\seealso{
\code{\link{CGP}}, \code{\link{summary.CGP}}, \code{\link{predict.CGP}}
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
mod<-CGP(X,yobs)
print(mod)
}
}