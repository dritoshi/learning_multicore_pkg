rm(list = ls())

source("mci.r")

context("mci function for multicore")

x.num <- 100
x <- seq(0.1, 2.5, length = x.num)

set.seed(1234)
m <- 100000
u <- runif(m)

cdf <- numeric(x.num)

test_that("mci.sapply.list return identical results of mci.for in list object", {
  expect_identical(mci.for(x, u), unlist(mci.sapply.list(x, u)))
})

test_that("mci.sapply return identical vector of mci.for", {
  expect_identical(mci.for(x, u), mci.sapply(x, u))
})

test_that("mci.mclapply return identical vector of mci.for", {
  expect_identical(mci.for(x, u), unlist(mci.mclapply(x, u)))
})
