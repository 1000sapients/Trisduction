# -*- coding: utf-8 -*-
"""TF-CHK · the mature verdict kernel, transcribed from the register of record
(Trisduction Master Codex v3.15.0, A.2.2 core + B.17-B.19 reliability layer).
No re-derivation: this is the codex kernel executed on rows built by hand.
"""
import numpy as np, mpmath as mp

C_REL = 4.0                       # B.17.1 engineering envelope constant

def qmul(a, b):
    w1,x1,y1,z1 = a; w2,x2,y2,z2 = b
    return np.array([w1*w2-x1*x2-y1*y2-z1*z2, w1*x2+x1*w2+y1*z2-z1*y2,
                     w1*y2-x1*z2+y1*w2+z1*x2, w1*z2+x1*y2-y1*x2+z1*w2])

def verdict_kernel(M, C=None, exact=False):
    """A.2.2 verbatim. M: three warrant rows over N contexts. C: covariates."""
    M = np.asarray(M, float); N = M.shape[1]
    Cm = None if C is None else np.atleast_2d(np.asarray(C, float))
    k = 0 if Cm is None else Cm.shape[0]
    u_m = np.finfo(float).eps
    eps = 0.0 if exact else 100.0*u_m*N
    if N - k < 4:
        return '[?]', None, None, None, 'N-k<4 dimensional shortfall'
    Mn = M - M.mean(axis=1, keepdims=True)
    sd = Mn.std(axis=1, ddof=1, keepdims=True)
    if np.any(sd == 0):
        return '[?]', None, None, None, 'zero-variance row'
    Mn = Mn / sd
    if k:
        Cm = Cm - Cm.mean(axis=1, keepdims=True)
        if np.linalg.matrix_rank(Cm) < k:
            return '[?]', None, None, None, 'rank(C)<k'
        CC = Cm @ Cm.T
        if np.linalg.cond(CC) >= 1e6:
            return '[?]', None, None, None, 'kappa(CC^T)>=1e6'
        Mf = Mn - (Mn @ Cm.T) @ np.linalg.solve(CC, Cm)
    else:
        Mf = Mn
    d = (Mf*Mf).sum(axis=1) / (N-1)
    if np.any(d < 1e-9):
        return '[?]', None, None, None, 'post-projection axis absorbed'
    G = Mf @ Mf.T / (N-1)
    detG = float(np.linalg.det(G))
    Q = Mf / np.sqrt((Mf*Mf).sum(axis=1, keepdims=True))
    R = Q @ Q.T
    detR = float(np.linalg.det(R))
    Bv = np.linalg.svd(Q, full_matrices=False)[2][:3]
    co = Q @ Bv.T
    q = [np.concatenate(([0.0], c)) for c in co]
    lam = float(qmul(qmul(q[0], q[1]), q[2])[0])
    if detR <= eps:
        return '[X]', lam, detR, detG, 'collapse: det(R)<=eps'
    kap_gate = min(1e6, (27.0/(100.0*u_m*N))**0.5)      # B.17.2 tightened gate
    if np.linalg.cond(R) >= kap_gate:
        return '[?]', lam, detR, detG, 'kappa(R)>=gate'
    return '[LOCK]', lam, detR, detG, 'sealed: three independent axes'

# ---- B.17.3 four-estimator redundancy -------------------------------------
def det3_four(R):
    d_lu  = float(np.linalg.det(R))
    d_eig = float(np.prod(np.linalg.eigvalsh(R)))
    try:
        L = np.linalg.cholesky(R); d_ch = float(np.prod(np.diag(L))**2)
    except np.linalg.LinAlgError:
        d_ch = d_lu
    a,b,c = R[0]; d_,e_,f_ = R[1]; g_,h_,i_ = R[2]
    d_co = float(a*(e_*i_-f_*h_) - b*(d_*i_-f_*g_) + c*(d_*h_-e_*g_))
    return d_lu, d_eig, d_ch, d_co

def det_mp(R, dps=50):
    mp.mp.dps = dps
    return float(mp.det(mp.matrix([[mp.mpf(x) for x in row] for row in R.tolist()])))

def R_of(M, C=None):
    Mn = np.asarray(M, float); Mn = Mn - Mn.mean(1, keepdims=True)
    Mn = Mn / Mn.std(1, ddof=1, keepdims=True)
    if C is not None:
        Cm = np.atleast_2d(np.asarray(C, float)); Cm = Cm - Cm.mean(1, keepdims=True)
        Mf = Mn - (Mn @ Cm.T) @ np.linalg.solve(Cm @ Cm.T, Cm)
    else:
        Mf = Mn
    Q = Mf / np.sqrt((Mf*Mf).sum(1, keepdims=True))
    return Q @ Q.T

def bootstrap(M, C, n_boot, seed):
    rg = np.random.default_rng(seed); N = np.asarray(M).shape[1]
    base = verdict_kernel(M, C)[0]; agree = ok = 0
    for _ in range(n_boot):
        idx = rg.integers(0, N, N)
        Cb = None if C is None else np.asarray(C)[:, idx]
        v = verdict_kernel(np.asarray(M)[:, idx], Cb)[0]
        if v is not None and v != '[?]':
            ok += 1; agree += (v == base)
    return agree/ok if ok else 0.0

def hardened(M, C=None, n_boot=400, seed=20260622):
    """B.19 production form: core kernel + reliability layer + fail-safe machine."""
    tok, lam, detR, detG, why = verdict_kernel(M, C)
    rep = {"verdict": tok, "lam": lam, "detR": detR, "detG": detG, "reason": why}
    if detR is None:
        return rep
    R = R_of(M, C); kapR = float(np.linalg.cond(R)); u_m = np.finfo(float).eps
    N = np.asarray(M).shape[1]; eps = 100.0*u_m*N
    tol = C_REL*kapR*u_m
    kap_gate = min(1e6, (27.0/(100.0*u_m*N))**0.5)
    ests = det3_four(R); spread = max(ests) - min(ests)
    resid = abs((lam or 0.0)**2 - detR)
    escalate = spread > tol or resid > tol
    rep.update({"kappaR": kapR, "spread": spread, "tol": tol, "identity_resid": resid,
                "eps": eps, "kappa_gate": kap_gate,
                "collapse_margin_orders": float(np.log10(detR/eps)) if detR > 0 else float('-inf'),
                "cond_margin_orders": float(np.log10(kap_gate/kapR)),
                "escalated": bool(escalate), "estimators": ests})
    if escalate:
        rep["detR_hp50"] = det_mp(R, 50)
    if rep["verdict"] == '[LOCK]':
        b = bootstrap(M, C, n_boot, seed); rep["bootstrap_agree"] = b
        rep["stability"] = 'stable' if b >= 0.95 else 'fragile' if b >= 0.80 else 'unstable'
    return rep
