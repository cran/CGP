\name{CGP.default}
\alias{CGP.default}

\title{
Default method for the CGP class
}
\description{
Default method for the ``\code{CGP}'' class. This is an intermediate function, not intended for direct use. 
}
\usage{
\method{CGP}{default}(X, yobs, ...)
}

\arguments{
  \item{X}{
The design matrix
}
  \item{yobs}{
The vector of response values, corresponding to the rows of \code{X}
}
  \item{\dots}{Optional arguments to be passed to \code{\link{CGPEst}} function}

}
\details{
This is an intermediate function which calls \code{CGPEst} for parameter estimation and call to the results. It sets the class of returned object to ``\code{CGP}''. It is not intended for direct use.
}
\value{
This function creates an object of class ``\code{CGP}''.
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


