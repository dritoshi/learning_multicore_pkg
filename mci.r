library(multicore)

mci.for <- function(x) {
  x.num <- length(x)
  cdf   <- numeric(x.num) 
  for ( i in 1:x.num ) {
    g   <- x[i] * exp( -(u * x[i])^2 / 2)
    cdf[i] <- mean(g) / sqrt(2 * pi) + 0.5
  }
  return(cdf)
}

mci.sapply.list <- function(x) {
  sapply(x, 
    function(x) {
      g <- x * exp( -(u * x)^2 / 2)
      mean(g) / sqrt(2 * pi) + 0.5
    }
  )
}

mci.sapply <- function(x) {
  unlist(sapply(x, 
    function(x) {
      g <- x * exp( -(u * x)^2 / 2)
      mean(g) / sqrt(2 * pi) + 0.5
    }
  ))
}

mci.mclapply <- function(x) {
  mclapply(x, 
    function(x) {
      g <- x * exp( -(u * x)^2 / 2)
      mean(g) / sqrt(2 * pi) + 0.5
    }
  )
}
