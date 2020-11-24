import numpy as np

def soft_threshold(x, t):
    y = np.zeros(x.shape)
    y[x > t] = x[x > t] - t
    y[x < -t] = x[x < -t] + t
    return y

def lasso_ista(y, X, lam, t, nit):
    beta = np.zeros((X.shape[1],1))
    cost = np.zeros(nit)
    Xty = np.transpose(X) @ y
    XtX = np.transpose(X) @ X
    for i in range(nit):
        tmp = beta + t * (Xty - XtX @ beta)
        beta = soft_threshold(tmp, t * lam)
        cost[i] = np.linalg.norm(y - X @ beta, 2) + lam * np.linalg.norm(beta, 1)
    return beta, cost

def lasso_fista(y, X, lam, nit):
    beta = np.zeros((X.shape[1],1))
    cost = np.zeros(nit)
    t = 1
    z = beta.copy()
    L = np.linalg.norm(X, ord=2) ** 2
    for i in range(nit):
        beta_old = beta.copy()
        z = z + X.T.dot(y - X.dot(z)) / L
        beta = soft_threshold(z, lam / L)
        t0 = t
        t = (1. + np.sqrt(1. + 4.*t ** 2)) / 2.
        z = beta + ((t0 - 1.)/t) * (beta - beta_old)
        cost[i] = np.linalg.norm(y - X @ beta, 2) + lam * np.linalg.norm(beta, 1)
    return beta, cost
