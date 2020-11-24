set.seed(1)
n <- 1e4; p <- 4
X2 <- matrix(rnorm(n*p), ncol = p)
beta <- c(1,2,3,4)
epsilon <- rnorm(n)
y2 <- X2 %*% beta + epsilon