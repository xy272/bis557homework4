# library(reticulate)

# test data
#set.seed(42)
#n <- 100
#p <- 500
#X <- matrix(rnorm(n * p), ncol = p)
#beta <- c(3, 2, 1, rep(0, p - 3))
#y <- X %*% beta + rnorm(n = n, sd = 0.1)

# R
# Soft threshold function.
casl_util_soft_thresh <-
  function(a, b)
  {
    a[abs(a) <= b] <- 0
    a[a > 0] <- a[a > 0] - b
    a[a < 0] <- a[a < 0] + b
    a
  }
# Update beta vector using coordinate descent.W
casl_lenet_update_beta <-
  function(X, y, lambda, alpha, b, W)
  {
    WX <- W * X
    WX2 <- W * X^2
    Xb <- X %*% b
    for (i in seq_along(b))
    {
      Xb <- Xb - X[, i] * b[i]
      b[i] <- casl_util_soft_thresh(sum(WX[,i, drop=FALSE] *
                                          (y - Xb)),
                                    lambda*alpha)
      b[i] <- b[i] / (sum(WX2[, i]) + lambda * (1 - alpha))
      Xb <- Xb + X[, i] * b[i]
    }
    b
  }
# Compute linear elastic net using coordinate descent.
# Args:
# X: A numeric data matrix.
# y: Response vector.
# lambda: The penalty term.
# alpha: Value from 0 and 1; balance between l1/l2 penalty.
# maxit: Integer maximum number of iterations.
# tol: Numeric tolerance parameter.
# Returns:
# Regression vector beta of length ncol(X).
casl_lenet <- function(X, y, lambda, alpha = 1,
    b = matrix(0, nrow=ncol(X), ncol=1),
    tol = 1e-5, maxit = 50, W = rep(1, length(y))/length(y))
{
    for (j in seq_along(lambda))
    {
        if (j > 1)
        {
            b[,j] <- b[, j-1, drop = FALSE]
        }
        # Update the slope coefficients until they converge.
        for (i in seq(1, maxit))
        {
            b_old <- b[, j]
            b[, j] <- casl_lenet_update_beta(X, y, lambda[j], alpha,
            b[, j], W)
            if (all(abs(b[, j] - b_old) < tol)) {
                break
            }
        }
        if (i == maxit)
        {
            warning("Function lenet did not converge.")
        }
    }
    b
}

#bhat_r <- casl_lenet(X, y, lambda = 0.1)
#bhat_r[bhat_r != 0]

# python
#source_python("C:/Users/Xining/Dropbox/My PC (DESKTOP-Q77OU8J)/Desktop/Campus/First Year/First Semester/Computitional Statistics/bis557homework4/R/py_lasso.py")
#out <- lasso_fista(y, X, 0.1, 10000L)
#bhat_py <- out[[1]]
#bhat_py[abs(bhat_py) > 0.02]
