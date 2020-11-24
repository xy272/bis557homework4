import numpy as np


def ridge_regression(y, X, lam):
    u,s,vh = np.linalg.svd(X) # X: n x m
    n = u.shape[0]
    m = vh.shape[0]
    st = np.zeros(max(n,m))
    st[:min(n,m)] = s / (s**2 + lam)
    uty = np.transpose(u) @ y
    ST = np.diag(st)
    b = np.transpose(vh) @ ST[:m, :n] @ uty
    return b
