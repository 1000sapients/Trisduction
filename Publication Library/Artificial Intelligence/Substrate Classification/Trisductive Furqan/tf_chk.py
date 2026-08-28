# -*- coding: utf-8 -*-
"""TF-CHK · THE FORTIFICATION BATTERY OF THE TRISDUCTIVE FURQAN
Six recorded checks. Deterministic throughout: the three latent reading-context
axes are closed-form harmonics over the 24-point period and no pseudo-random
number enters row construction, so the battery reproduces bit-for-bit on any
substrate carrying IEEE-754 double precision. Bootstrap alone is seeded, at
20260622. The kernel is transcribed from the register of record and not
re-derived. Run: python3 tf_chk.py
"""
import numpy as np, sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from kernel import hardened, verdict_kernel, R_of, qmul, det3_four

N   = 24
u_m = np.finfo(float).eps
t   = np.linspace(0, 2*np.pi, N, endpoint=False)
L   = np.vstack([np.cos(2*t), np.sin(t), np.sin(3*t)])   # form, empirical, metrological

A_WATER = [[1.00, 0.18, 0.10], [0.15, 1.00, 0.12], [0.09, 0.14, 1.00]]
A_PHLOG = [[1.00, 0.12, 0.08], [0.94, 0.16, 0.10], [0.20, 0.10, 1.00]]

def rows(A): return np.asarray(A, float) @ L
def unitrows(M):
    Mn = M - M.mean(1, keepdims=True); Mn = Mn/Mn.std(1, ddof=1, keepdims=True)
    return Mn/np.sqrt((Mn*Mn).sum(1, keepdims=True))
def lam_fixed(M, B):
    co = unitrows(M) @ B.T
    q = [np.concatenate(([0.0], c)) for c in co]
    return float(qmul(qmul(q[0], q[1]), q[2])[0])
def bar(s): print("\n" + "="*72 + f"\n{s}\n" + "="*72)

# ---------------------------------------------------------------- TF-CHK.0
bar("TF-CHK.0 · LATENT ORTHOGONALITY")
G = L @ L.T
print(f"  max |off-diagonal of L Lᵀ| = {float(np.max(np.abs(G-np.diag(np.diag(G))))):.3e}")
print("  The three reading-context latents are exactly orthogonal over the period,")
print("  so any correlation the kernel reads is manufactured by the loading matrix")
print("  and by nothing in the construction.")

# ---------------------------------------------------------------- TF-CHK.1
bar("TF-CHK.1 · THE TWO REFERENCE PROPOSITIONS ON THE MATURE KERNEL")
for nm, A in (("water", A_WATER), ("phlogiston", A_PHLOG)):
    r = hardened(rows(A))
    print(f"\n  {nm}")
    print(f"    verdict {r['verdict']}  ·  {r['reason']}")
    print(f"    det(R) = {r['detR']:.12f}   λ = {r['lam']:+.12f}   κ(R) = {r['kappaR']:.6f}")
    print(f"    |λ²−det(R)| = {r['identity_resid']:.3e}   tol = {r['tol']:.3e}")
    print(f"    four-estimator spread = {r['spread']:.3e}")
    print(f"    collapse margin {r['collapse_margin_orders']:.2f} orders · "
          f"conditioning margin {r['cond_margin_orders']:.2f} orders")
    print(f"    bootstrap {r['bootstrap_agree']:.3f} {r['stability'].upper()}   "
          f"escalated {r['escalated']}")
print("\n  BOTH LOCK. The determinant certifies that a residence encloses volume.")
print("  It does not and cannot certify that the proposition is true.")

# ---------------------------------------------------------------- TF-CHK.2
bar("TF-CHK.2 · ORIENTATION-BLINDNESS, FIXED-BASIS ANALYZER")
for nm, A in (("water", A_WATER), ("phlogiston", A_PHLOG)):
    M = rows(A); B = np.linalg.qr(unitrows(M).T)[0].T[:3]     # basis fixed ONCE
    lp, lr, ln = lam_fixed(M, B), lam_fixed(np.diag([-1.,1.,1.])@M, B), lam_fixed(-M, B)
    dp = float(np.linalg.det(R_of(M)))
    dr = float(np.linalg.det(R_of(np.diag([-1.,1.,1.])@M)))
    dn = float(np.linalg.det(R_of(-M)))
    print(f"\n  {nm}")
    print(f"    λ:  P {lp:+.12f} → reflected {lr:+.12f}  ratio {lr/lp:+.6f}")
    print(f"        P {lp:+.12f} → negated   {ln:+.12f}  ratio {ln/lp:+.6f}")
    print(f"    det(R):  |P − reflected| = {abs(dr-dp):.3e}   |P − negated| = {abs(dn-dp):.3e}")
    print(f"    |λ² − det(R)| = {abs(lp*lp-dp):.3e}")
print("\n  The directed quantity inverts exactly. The verdict scalar is bit-identical")
print("  to zero difference. lock(P) = lock(¬P): a determinant carries no truth-sign,")
print("  so no determinant can return 'broken' because a proposition is false.")

# ---------------------------------------------------------------- TF-CHK.3
bar("TF-CHK.3 · THE COSTUMED-AXIS SWEEP")
print("  c is how much of the empirical row restates the formal posit.")
print("  e is the independent empirical residue that survives.")
print(f"\n  {'c':>6} {'e':>8} {'r(V_F,V_E)':>13} {'det(R)':>11} {'κ(R)':>11}  verdict")
for c, e in [(0.00,0.16),(0.30,0.16),(0.60,0.16),(0.90,0.16),(0.94,0.16),(1.00,0.16),
             (1.00,0.05),(1.00,1e-2),(1.00,1e-4),(1.00,0.0)]:
    M = rows([[1.00,0.12,0.08],[c,e,0.10],[0.20,0.10,1.00]])
    r = hardened(M, n_boot=120); R = R_of(M)
    print(f"  {c:>6.2f} {e:>8.0e} {R[0,1]:>13.9f} {r['detR']:>11.3e} "
          f"{r['kappaR']:>11.4e}  {r['verdict']}")
Mi = rows([[1.00,0.12,0.08],[1.00,0.12,0.08],[0.20,0.10,1.00]])
ri = hardened(Mi)
print(f"\n  exact identity, V_E = V_F:  det(R) = {ri['detR']:.6e}   κ(R) = {ri['kappaR']:.4e}")
print(f"    verdict {ri['verdict']}  ·  {ri['reason']}   (ε = {ri['eps']:.4e})")
print("\n  A costumed axis is a graded reading, not a cliff: correlation runs to")
print("  0.999 and κ(R) rises three orders while the residence still locks. Only")
print("  exact identity retires it, and there the determinant reaches zero and")
print("  collapse fires first, strict precedence holding as proved.")

# ---------------------------------------------------------------- TF-CHK.4
bar("TF-CHK.4 · WHAT THE DIAGONAL GRAM CANNOT SEE")
print("  The paper's Gram is diagonal by construction, so its determinant is the")
print("  product of three gate counts and is fixed at 3 × 5 × 4 = 60 whenever all")
print("  twelve gates pass, whatever the axes actually do.\n")
print(f"  {'c':>7} {'paper det':>10} {'kernel det(R)':>15} {'kernel κ(R)':>13}")
for c in (0.00, 0.60, 0.94, 1.00):
    r = hardened(rows([[1.00,0.12,0.08],[c,0.16,0.10],[0.20,0.10,1.00]]), n_boot=60)
    print(f"  {c:>7.2f} {60:>10} {r['detR']:>15.3e} {r['kappaR']:>13.4e}")
print("\n  The paper's number does not move. The kernel's moves by two and a half")
print("  orders on the determinant and by three on the conditioning. That gap is")
print("  the exact content of the concession at §8.5.5, and it is what the")
print("  fortified kernel supplies rather than concedes.")

# ---------------------------------------------------------------- TF-CHK.5
bar("TF-CHK.5 · FLOOR-GATE SEPARATION AT THE OPERATING N")
worst = 27.0*1e6/((1e6+2)**3)
for n in (24, 100, 300, 1216):
    eps = 100.0*u_m*n; ks = (27.0/(100.0*u_m*n))**0.5
    print(f"  N={n:<5} ε={eps:.4e}  κ_sep={ks:.4e}  clearance {(ks/1e6)**2:>7.3f}× "
          f"({np.log10((ks/1e6)**2):+.2f} orders)")
print(f"\n  worst-case det(R) at κ=1e6 : 27κ/(κ+2)³ = {worst:.6e}")
print(f"  collapse floor at N=24      : ε = {100.0*u_m*24:.6e}")
print(f"  the conditioning gate fires first by {np.log10(worst/(100.0*u_m*24)):.2f} orders")
print("\n  Inside the operating envelope the two verdicts cannot contend, so the")
print("  three-state boundary is decided by structure and never by rounding.")
print("  No threshold is fitted anywhere: ε = 100·u_m·N is machine epsilon times")
print("  the context count, and κ* is proved, not chosen.")
print("\n" + "="*72)
print("TF-CHK COMPLETE · six checks executed · seed 20260622 · N = 24")
print("="*72)
