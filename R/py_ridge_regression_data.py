import numpy as np

lam = 0.1
y = r.y
X = r.X

u,s,vh = np.linalg.svd(X) # X: n x m
n = u.shape[0]
m = vh.shape[0]
st = np.zeros(max(n,m))
st[:min(n,m)] = s / (s**2 + lam)
uty = np.transpose(u) @ y
ST = np.diag(st)
b = np.transpose(vh) @ ST[:m, :n] @ uty
b