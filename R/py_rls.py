import numpy as np

def recursive_ls(x, y, w, G):
    tmp = G @ (x.T @ x) @ G
    G = G - tmp / (1 + x @ G @ x.T)
    w = w - G @ x.T @ (x @ w - y)
    return w, G