source("mci.r")

set.seed(1234)
x.num <- 1000
x <- seq(0.1, 2.5, length = x.num)
m <- 100000
u <- runif(m)
cdf <- numeric(x.num)

mci.profiles <- cbind(
  system.time(mci.for(x)),
  system.time(mci.sapply.list(x)),
  system.time(mci.sapply(x)),
  system.time(mci.mclapply(x))
)
colnames(mci.profiles) <- c("for", "sapply", "sapply.unlist", "mclappy")
print(mci.profiles)
