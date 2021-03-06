% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spread-factors.R
\name{spread_factors}
\alias{spread_factors}
\title{spread_factors turns any character or factors into dummy variables}
\usage{
spread_factors(data, drop_one = T)
}
\arguments{
\item{data}{the data}

\item{drop_one}{logical indicating whether one level should be dropped}
}
\value{
a data frame with dummy variables instead of factors
}
\description{
spread_factors turns any character or factors into dummy variables
}
\examples{
spread_factors(iris, drop_one = T)
}
