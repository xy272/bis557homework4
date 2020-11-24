# library(reticulate)

# source_python("C:/Users/Xining/Dropbox/My PC (DESKTOP-Q77OU8J)/Desktop/Campus/First Year/First Semester/Computitional Statistics/bis557homework4/R/py_ridge_regression_data.py")

#n <- 200
#p <- 4
#N <- 500
#M <- 20
#set.seed(1)
#beta <- c(1, -1, 0.5, 9)
#mu <- rep(0, p)
#Sigma <- matrix(0.9, nrow = p, ncol = p)
#diag(Sigma) <- 1
#X <- MASS::mvrnorm(n, mu, Sigma)
#y <- X %*% beta + rnorm(n, sd = 5)

# python environment
#repl_python()

#import numpy as np

#lam = 0.1
#y = r.y
#X = r.X

#u,s,vh = np.linalg.svd(X) # X: n x m
#n = u.shape[0]
#m = vh.shape[0]
#st = np.zeros(max(n,m))
#st[:min(n,m)] = s / (s**2 + lam)
#uty = np.transpose(u) @ y
#ST = np.diag(st)
#b = np.transpose(vh) @ ST[:m, :n] @ uty

#print(b)

#exit
#py$b

# R
My_ridge_regression <-
  function(X, y, lambda) {
  n <- dim(X)[2]
  solve( crossprod(X) + lambda * diag(n), crossprod(X, y))
}

#br <- My_ridge_regression(X, y, 0.1)
#br

