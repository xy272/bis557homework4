n <- 200
p <- 4
N <- 500
M <- 20
set.seed(1)
beta <- c(1, -1, 0.5, 9)
mu <- rep(0, p)
Sigma <- matrix(0.9, nrow = p, ncol = p)
diag(Sigma) <- 1
X <- MASS::mvrnorm(n, mu, Sigma)
y <- X %*% beta + rnorm(n, sd = 5)

use_data(X,y)