# Does a two-axis "lock" discriminate? Seed 20260622, N=24 contexts.
import numpy as np
rg = np.random.default_rng(20260622)
N, T = 24, 200000

def unit(v):
    v = v - v.mean()
    return v / np.linalg.norm(v)

# 1. sin^2(theta) for random centered pairs
s2 = np.empty(T)
for i in range(T):
    a = unit(rg.standard_normal(N)); b = unit(rg.standard_normal(N))
    c = float(a @ b); s2[i] = 1 - c*c
print(f"sin^2(theta), {T} random pairs at N={N}:")
print(f"  mean {s2.mean():.6f}  median {np.median(s2):.6f}")
print(f"  1st pct {np.percentile(s2,1):.6f}  5th pct {np.percentile(s2,5):.6f}  min {s2.min():.6f}")
print(f"  fraction with sin^2 > 0.50 : {(s2>0.50).mean():.5f}")
print(f"  fraction with sin^2 > 0.80 : {(s2>0.80).mean():.5f}")
print(f"  fraction with sin^2 > 0.90 : {(s2>0.90).mean():.5f}")

# 2. genuine vs fabricated third axis on the SAME locked pair
a = unit(rg.standard_normal(N)); x = rg.standard_normal(N)
b = unit(x - (x @ a)*a*0.0)                      # independent second axis
S = rg.standard_normal(N); S = S - S.mean()      # the "real" generator
Q,_ = np.linalg.qr(np.column_stack([a,b]))
Sp = S - Q @ (Q.T @ S); Sp = Sp/np.linalg.norm(Sp)

def det3(a,b,w):
    M = np.vstack([a,b,unit(w)]); return float(np.linalg.det(M @ M.T))

real  = 0.05*(a-b) + Sp
fabs  = [rg.standard_normal(N) for _ in range(6)]   # six fabricated thirds
print(f"\nsame two-axis plane, sin^2(theta) = {1-(a@b)**2:.6f}")
print(f"  det(R) with the SOURCED third axis        : {det3(a,b,real):.6f}")
for k,f in enumerate(fabs):
    print(f"  det(R) with fabricated third axis #{k+1}      : {det3(a,b,f):.6f}")

def eta(w):
    wp = unit(w); wp = wp - Q @ (Q.T @ wp)
    return float(np.corrcoef(wp, Sp)[0,1]**2)
print(f"\n  eta_S sourced      : {eta(real):.6f}")
print(f"  eta_S fabricated#1 : {eta(fabs[0]):.6f}   (analytic null q99, m=21: ~0.32)")
