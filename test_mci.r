source("mci.r")

context("mci function for multicore")

set.seed(1234)
x.num <- 100
x <- seq(0.1, 2.5, length = x.num)
m <- 100000
u <- runif(m)
cdf <- numeric(x.num)

test_that("mci.sapply.list return identical results of mci.for in list object", {
  expect_identical(mci.for(x), unlist(mci.sapply.list(x)))
})

test_that("mci.sapply return identical vector of mci.for", {
  expect_identical(mci.for(x), mci.sapply(x))
})

test_that("mci.mclapply return identical vector of mci.for", {
  expect_identical(mci.for(x), unlist(mci.mclapply(x)))
})
