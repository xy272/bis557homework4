set.seed(42)
n <- 100
p <- 500
X1 <- matrix(rnorm(n * p), ncol = p)
beta <- c(3, 2, 1, rep(0, p - 3))
y1 <- X1 %*% beta + rnorm(n = n, sd = 0.1)