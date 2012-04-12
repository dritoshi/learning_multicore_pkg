rm(list = ls())

source("mci.r")

set.seed(1234)
x.num <- 1000
x <- seq(0.1, 2.5, length = x.num)
m <- 100000
u <- runif(m)
cdf <- numeric(x.num)

mci.profiles <- cbind(
  system.time(mci.for(x, u)),
  system.time(mci.sapply.list(x, u)),
  system.time(mci.sapply(x, u)),
  system.time(mci.mclapply(x, u)),
  system.time(mci.llply(x, u)),
  system.time(mci.llply(x, u, .parallel = TRUE))
)
colnames(mci.profiles) <- c(
  "for", "sapply", "sapply.unlist",
  "mclappy", "llply", "llply.doMC")
print(mci.profiles)
