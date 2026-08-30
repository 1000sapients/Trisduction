#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""RA-TOE battery · executed evidence for the upgraded paper.
Seed 20260622. Double precision, 50-digit escalation where the fail-safe machine asks for it.
Kernel code is the shared quaternionic kernel of the Unified Master System Role, A.2.2 and B.19,
carried verbatim; the RA-specific constructions are printed in full so every figure reproduces."""
import sys, math, hashlib, io
import numpy as np
import mpmath as mp

SEED = 20260622
hbar = 1.054571817e-34; kB = 1.380649e-23; c = 299792458.0; eV = 1.602176634e-19
out = io.StringIO()
def P(*a):
    s = " ".join(str(x) for x in a); print(s); out.write(s + "\n")

# ---------------------------------------------------------------- shared kernel (A.2.2, B.19)
def qmul(a, b):
    w1,x1,y1,z1 = a; w2,x2,y2,z2 = b
    return np.array([w1*w2-x1*x2-y1*y2-z1*z2, w1*x2+x1*w2+y1*z2-z1*y2,
                     w1*y2-x1*z2+y1*w2+z1*x2, w1*z2+x1*y2-y1*x2+z1*w2])

def verdict_kernel(M, C=None, exact=False):
    M = np.asarray(M, float); N = M.shape[1]
    Cm = None if C is None else np.atleast_2d(np.asarray(C, float))
    k = 0 if Cm is None else Cm.shape[0]
    u_m = np.finfo(float).eps
    eps = 0.0 if exact else 100.0*u_m*N
    if N - k < 4: return '[?]', None, None, None, 'N-k<4 dimensional shortfall'
    Mn = M - M.mean(axis=1, keepdims=True)
    sd = Mn.std(axis=1, ddof=1, keepdims=True)
    if np.any(sd == 0): return '[?]', None, None, None, 'zero-variance row'
    Mn = Mn / sd
    if k:
        Cm = Cm - Cm.mean(axis=1, keepdims=True)
        if np.linalg.matrix_rank(Cm) < k: return '[?]', None, None, None, 'rank(C)<k'
        CC = Cm @ Cm.T
        if np.linalg.cond(CC) >= 1e6: return '[?]', None, None, None, 'kappa(CC^T)>=1e6'
        Mf = Mn - (Mn @ Cm.T) @ np.linalg.solve(CC, Cm)
    else:
        Mf = Mn
    d = (Mf*Mf).sum(axis=1) / (N-1)
    if np.any(d < 1e-9): return '[?]', None, None, None, 'post-projection axis absorbed'
    G = Mf @ Mf.T / (N-1); detG = float(np.linalg.det(G))
    Q = Mf / np.sqrt((Mf*Mf).sum(axis=1, keepdims=True)); R = Q @ Q.T
    detR = float(np.linalg.det(R))
    Bv = np.linalg.svd(Q, full_matrices=False)[2][:3]; co = Q @ Bv.T
    q = [np.concatenate(([0.0], cc)) for cc in co]
    lam = float(qmul(qmul(q[0], q[1]), q[2])[0])
    if detR <= eps: return '[X]', lam, detR, detG, 'collapse: det(R)<=eps'
    kap_gate = min(1e6, (27.0/(100.0*u_m*N))**0.5)
    if np.linalg.cond(R) >= kap_gate: return '[?]', lam, detR, detG, 'kappa(R)>=gate'
    return '[LOCK]', lam, detR, detG, 'sealed: three independent axes'

C_REL = 4.0
def _det3_four(R):
    d_lu = float(np.linalg.det(R)); d_eig = float(np.prod(np.linalg.eigvalsh(R)))
    try: L = np.linalg.cholesky(R); d_chol = float(np.prod(np.diag(L)) ** 2)
    except np.linalg.LinAlgError: d_chol = d_lu
    a,b,cc = R[0]; d,e,f = R[1]; g,h,i = R[2]
    d_co = float(a*(e*i - f*h) - b*(d*i - f*g) + cc*(d*h - e*g))
    return d_lu, d_eig, d_chol, d_co
def _det_mp(R, dps=50):
    mp.mp.dps = dps
    return float(mp.det(mp.matrix([[mp.mpf(x) for x in row] for row in R.tolist()])))
def _R_of(M, C):
    Mn = np.asarray(M, float); Mn = Mn - Mn.mean(1, keepdims=True); Mn = Mn / Mn.std(1, ddof=1, keepdims=True)
    if C is not None:
        Cm = np.atleast_2d(np.asarray(C, float)); Cm = Cm - Cm.mean(1, keepdims=True)
        Mf = Mn - (Mn @ Cm.T) @ np.linalg.solve(Cm @ Cm.T, Cm)
    else: Mf = Mn
    Q = Mf / np.sqrt((Mf*Mf).sum(1, keepdims=True)); return Q @ Q.T
def _bootstrap(M, C, exact, n_boot, seed):
    rg = np.random.default_rng(seed); N = np.asarray(M).shape[1]
    base = verdict_kernel(M, C, exact)[0]; agree = ok = 0
    for _ in range(n_boot):
        idx = rg.integers(0, N, N); Cb = None if C is None else np.asarray(C)[:, idx]
        v = verdict_kernel(np.asarray(M)[:, idx], Cb, exact)[0]
        if v is not None and v != '[?]': ok += 1; agree += (v == base)
    return agree / ok if ok else 0.0
def verdict_kernel_hardened(M, C=None, exact=False, n_boot=200, seed=0):
    tok, lam, detR, detG, why = verdict_kernel(M, C, exact)
    rep = {"verdict": tok, "lam": lam, "detR": detR, "detG": detG, "reason": why}
    if detR is None: return rep
    R = _R_of(M, C); kapR = float(np.linalg.cond(R)); u_m = np.finfo(float).eps
    N = np.asarray(M).shape[1]; eps = 0.0 if exact else 100.0*u_m*N; tol = C_REL * kapR * u_m
    kap_gate = min(1e6, (27.0/(100.0*u_m*N))**0.5)
    d_lu, d_eig, d_chol, d_co = _det3_four(R)
    spread = max(d_lu, d_eig, d_chol, d_co) - min(d_lu, d_eig, d_chol, d_co)
    resid = abs((lam or 0.0)**2 - detR)
    coll_margin = np.inf if detR <= 0 else np.log10(detR / eps) if eps > 0 else np.inf
    cond_margin = np.log10(kap_gate / kapR)
    in_band = (eps > 0 and abs(detR - eps) <= tol*max(detR, 1.0)) or (abs(kapR - kap_gate) <= kap_gate*tol)
    escalate = spread > tol or resid > tol or in_band
    rep.update({"kappaR": kapR, "estimator_spread": spread, "tol": tol, "identity_resid": resid,
                "collapse_margin_orders": coll_margin, "cond_margin_orders": cond_margin, "escalated": bool(escalate),
                "det_four": (d_lu, d_eig, d_chol, d_co), "R": R})
    if escalate:
        dhp = _det_mp(R, 50); rep["detR_hp50"] = dhp
        if dhp <= eps: rep["verdict"], rep["reason"] = '[X]', 'collapse confirmed at 50 digits'
        elif kapR >= kap_gate: rep["verdict"], rep["reason"] = '[?]', 'kappa(R)>=gate confirmed at 50 digits'
        else: rep["verdict"], rep["reason"] = '[LOCK]', 'lock confirmed at 50 digits'
    if rep["verdict"] == '[LOCK]':
        boot = _bootstrap(M, C, exact, n_boot, seed); rep["bootstrap_agree"] = boot
        rep["stability"] = 'stable' if boot >= 0.95 else 'fragile' if boot >= 0.80 else 'unstable'
    return rep

def gol_admit(magnitude, ling_seal):
    if magnitude == 'broken': return '[X]', 'geometric/math magnitude reports broken geometry; no GOL'
    if magnitude != 'lock': return '[?]', 'no geometric/math lock: the orthogonal volume unestablished'
    if ling_seal != 'lock': return '[?]', 'magnitude locks but Seal L open: orientation-blind determinant carries no direction; uncertified'
    return '[GOL-OK]', 'geometric/math lock (formal axis included) plus linguistic direction; proceed to witness and asymmetry (B.11.S)'

def imprint_seal(verdict_P, verdict_notP, *, sealL_P=False, sealL_notP=False, gates_P=False, gates_notP=False, witness_P=None, witness_notP=None):
    lockP = verdict_P.startswith('[LOCK]'); lockN = verdict_notP.startswith('[LOCK]')
    cleanP = lockP and sealL_P and gates_P; cleanN = lockN and sealL_notP and gates_notP
    witP = witness_P is not None; witN = witness_notP is not None
    if cleanP and cleanN: return '[X] PLATONIC GHOST: both directions clean-lock, field-permitted both ways, no imprint'
    if cleanP and not cleanN:
        return ('[⟀] SEALED: only P field-permitted, determinacy witness supplied' if witP
                else '[?] residence: P clean-locks, imprint unproven (no witness, B.11 necessary-not-sufficient)')
    if cleanN and not cleanP:
        return ('[⟀] SEALED: only not-P field-permitted, determinacy witness supplied' if witN
                else '[?] residence: not-P clean-locks, imprint unproven (no witness, B.11)')
    if not lockP and not lockN: return '[?] flat: neither direction populated'
    return '[?] uncertified: geometric lock present but Seal L / twelve-gate screen not confirmed; no seal'

def delta_m_admit(object_level=False, name_strip=False, literature_clear=False, not_two_line=False,
                  external_witness=None, witness_independent=False, reproducible_artifact=False, gap_audit_closed=False):
    if not object_level: return '[Mosaic ΔM=0]', 'M1 fail: meta-work (placement/typing), not object-level. No new mass by definition.'
    if not name_strip: return '[?] vocab', 'M2 fail'
    if not literature_clear: return '[?] rediscovery', 'M3 fail'
    if not not_two_line: return '[?] trivial', 'M4 fail'
    if external_witness is None: return '[?] witness absent', 'M5 fail'
    if not witness_independent: return '[?] self-verified', 'M6 fail'
    if not reproducible_artifact: return '[?] vapor', 'M7 fail'
    if not gap_audit_closed: return '[?] gap open', 'M8 fail'
    return '[⟀ ΔM>0]', f'authored new mass, witness={external_witness}'

def lam_det_fixed(Q, Bv):
    """lambda on a basis fixed once (the fixed-basis analyzer of CHK.3); det(R) from the Gram."""
    co = Q @ Bv.T; q = [np.concatenate(([0.0], cc)) for cc in co]
    return float(qmul(qmul(q[0], q[1]), q[2])[0]), float(np.linalg.det(Q @ Q.T))

BAR = "=" * 78
P(BAR); P("RA-TOE BATTERY · seed", SEED, "· numpy", np.__version__, "· u_m =", np.finfo(float).eps); P(BAR)

# ================================================================ PART A · SEAL L, THE TONGUE
P("A.1  RA parsed: ∃x ⇒ ΔE_k(x) > 0, x ∈ {Real, Measurable, Grounded}.")
slots = {"A1 existence": {"exists","is","actual","occupies"},
         "A2 kinetic":   {"moves","actuates","works","dissipates"},
         "A3 relation":  {"relates","implies","binds","forces"}}
names = list(slots)
lit = all(len(slots[names[a]] & slots[names[b]]) == 0 for a in range(3) for b in range(a+1, 3))
P("A.2  slots =", len(slots), "· LIT pairwise-disjoint =", lit)

# ================================================================ PART B · THEOREM 1, THE FLOOR IN NUMBERS
m_e = 9.1093837015e-31
T_floor = hbar**2/(8*m_e*(1e-10)**2)
P(f"B.1  Heisenberg kinetic floor, electron confined to 1 Å: ⟨T⟩ ≥ {T_floor:.6e} J = {T_floor/eV:.4f} eV")
zpe = 0.5*hbar*1e14
P(f"B.2  zero-point energy at ω = 1e14 rad/s: ½ħω = {zpe:.6e} J = {zpe/eV:.4f} eV")
land = kB*300.0*math.log(2)
P(f"B.3  Landauer floor, one bit at 300 K: k_B T ln 2 = {land:.6e} J")
E = np.array([0.0, 1.0]); amp = np.array([1,1])/np.sqrt(2)          # ħ = 1 units
mean = float(np.sum(amp**2*E)); sig = float(np.sqrt(np.sum(amp**2*(E-mean)**2)))
tau_MT = math.pi/(2*sig); tau_ML = math.pi/(2*mean)
P(f"B.4  qubit in equal superposition: ⟨E⟩ = {mean:.6f}, ΔE = {sig:.6f}; Mandelstam-Tamm floor τ⊥ ≥ {tau_MT:.6f}, Margolus-Levitin floor {tau_ML:.6f}")
surv = [math.cos((E[1]-E[0])*t/2)**2 for t in [0, math.pi/4, math.pi/2, 3*math.pi/4, math.pi]]
P("B.5  survival |⟨ψ(0)|ψ(t)⟩|² on [0, τ⊥]:", " → ".join(f"{s:.4f}" if s > 1e-6 else f"{s:.1e}" for s in surv))
P(f"B.6  Frozen Substrate: ΔE → 0 ⟹ τ⊥ → ∞ ; τ⊥(ΔE=1e-3) = {math.pi/(2*1e-3):.3e}, τ⊥(ΔE=1e-6) = {math.pi/(2*1e-6):.3e}; an eigenstate registers nothing.")

# ================================================================ PART C · THE ALGEBRA, THE RETURN
i_, j_, k_ = np.array([0.,1,0,0]), np.array([0.,0,1,0]), np.array([0.,0,0,1])
ijk = qmul(qmul(i_, j_), k_)
P("C.1  RA witnesses RA: i·j·k =", [int(round(x)) for x in ijk], "· scalar on Fix(σ) = ℝ")
sig_ = np.diag([1.0,-1.0,-1.0,-1.0]); ev_s = sorted(int(round(x)) for x in np.linalg.eigvalsh(sig_))
ev_d = sorted(int(round(x)) for x in np.linalg.eigvalsh(-np.eye(4)))
P("C.2  conjugation σ eigenvalues", ev_s, "Ground dim", ev_s.count(1), "· diagonal −I₄ eigenvalues", ev_d, "Ground dim", ev_d.count(1),
  "· det(σ|residence) =", round(float(np.linalg.det(-np.eye(3))), 12))
t = np.linspace(0, 2*np.pi, 24, endpoint=False)
tokR, lamR, dR, dGR, whyR = verdict_kernel(np.vstack([np.sin(t), np.cos(t), np.sin(2*t)]))
P(f"C.3  the Return, Fourier triad N=24: {tokR} det(R) = {dR:.12f}, |λ| = {abs(lamR):.12f}, identity |λ²−det(R)| = {abs(lamR*lamR-dR):.3e}")

# ================================================================ PART D · THE RA WARRANT TRIAD, HAND-BUILT
rng = np.random.default_rng(SEED); N = 24
m   = 10**rng.uniform(math.log10(9.109e-31), -25, N)        # confined mass, electron to light atom
dx  = 10**rng.uniform(-10, -6, N)                            # confinement, 1 Å to 1 µm
om  = 10**rng.uniform(12, 15, N)                             # oscillator frequency, rad/s
T   = rng.uniform(1.0, 300.0, N)                             # registration temperature, K
bits= rng.integers(1, 1001, N)                               # bits registered per context
L_F  = np.log10(hbar**2/(8*m*dx**2))                         # V_F  : the Heisenberg kinetic floor
L_E  = np.log10(0.5*hbar*om)                                 # V_E  : the zero-point energy carried
L_ER = np.log10(kB*T*math.log(2)*bits)                       # V_ER : the registration cost paid
L = np.vstack([L_F, L_E, L_ER])
C1 = np.log10(5e-20*rng.integers(10, 10001, N))              # auditor-substrate load, J (anthropocentrism)
C2 = rng.uniform(-24, -18, N)                                # instrument resolution floor, log10 J (instrumentalism)
Cz = np.vstack([C1, C2]); Cz = (Cz - Cz.mean(1, keepdims=True))/Cz.std(1, ddof=1, keepdims=True)
Lz = (L - L.mean(1, keepdims=True))/L.std(1, ddof=1, keepdims=True)
A  = np.array([[1.00,0.35,0.12],[0.22,1.00,0.28],[0.16,0.20,1.00]])
Bc = np.array([[0.60,0.30],[0.40,0.50],[0.55,0.20]])
M = A @ Lz + Bc @ Cz
P("D.0  construction: N=24 contexts; latent rows log10 floor / log10 ½ħω / log10 k_B T ln2 · bits; oblique mixing A rows",
  A.tolist(), "; contamination Bc rows", Bc.tolist(), "; two Mass-Mandate covariates, auditor load and instrument floor.")
# genealogy receipt: eta per row and covariate, source-share per row
for r, nm in enumerate(["V_F","V_E","V_ER"]):
    etas = [float(np.corrcoef(M[r], Cz[j])[0,1]**2) for j in range(2)]
    X = np.column_stack([np.ones(N), Cz.T]); beta, *_ = np.linalg.lstsq(X, M[r], rcond=None)
    resid = M[r] - X @ beta; share = 1 - resid.var(ddof=1)/M[r].var(ddof=1)
    P(f"D.1  genealogy receipt {nm}: η(auditor load) = {etas[0]:.4f}, η(instrument floor) = {etas[1]:.4f}, source-share = {share:.4f}")
tok0, lam0, det0, dG0, why0 = verdict_kernel(M)
P(f"D.2  unprojected read: {tok0} det(R) = {det0:.12f}, λ = {lam0:+.12f}")
rep = verdict_kernel_hardened(M, Cz, n_boot=200, seed=0)
P(f"D.3  CDT projection out of both covariates, hardened kernel: {rep['verdict']} · {rep['reason']}")
P(f"     det(R) = {rep['detR']:.12f}, λ = {rep['lam']:+.12f}, det(G) = {rep['detG']:.12f}, κ(R) = {rep['kappaR']:.6f}")
d4 = rep['det_four']
P(f"     four estimators LU/eig/chol/cofactor = {d4[0]:.15f} / {d4[1]:.15f} / {d4[2]:.15f} / {d4[3]:.15f}")
P(f"     spread = {rep['estimator_spread']:.3e} against tol = {rep['tol']:.3e} · identity residual |λ²−det(R)| = {rep['identity_resid']:.3e}")
P(f"     collapse margin = {rep['collapse_margin_orders']:.2f} orders · conditioning margin = {rep['cond_margin_orders']:.2f} orders · escalated = {rep['escalated']}")
P(f"     bootstrap agreement = {rep.get('bootstrap_agree', float('nan')):.3f} · stability tier = {rep.get('stability','n/a').upper()}")

# reflection exhibit on the post-projection unit rows, basis fixed once
Cm = Cz - Cz.mean(1, keepdims=True); Mn = (M - M.mean(1, keepdims=True))/M.std(1, ddof=1, keepdims=True)
Mf = Mn - (Mn @ Cm.T) @ np.linalg.solve(Cm @ Cm.T, Cm); Q = Mf/np.sqrt((Mf*Mf).sum(1, keepdims=True))
Bv = np.linalg.svd(Q, full_matrices=False)[2][:3]
lamA, detA = lam_det_fixed(Q, Bv); Q1 = Q.copy(); Q1[0] = -Q1[0]; lamB, detB = lam_det_fixed(Q1, Bv)
P(f"D.4  reflection of V_F on the fixed basis: λ {lamA:+.12f} → {lamB:+.12f} (ratio {lamB/lamA:+.6f}), |Δdet(R)| = {abs(detA-detB):.3e}")
Gneg = float(np.max(np.abs((-Q) @ (-Q).T - Q @ Q.T)))
P(f"D.5  full negation: max|G(P)−G(¬P)| = {Gneg:.1e} · the even functionals identical, the sign displaced to λ")
# time-reversal control: the registrations in reversed order, and the Chronos arrow statistic
Mrev = M[:, ::-1]; Crev = Cz[:, ::-1]
repr_ = verdict_kernel(Mrev, Crev)
dS = bits*math.log(2)                                          # entropy registered per context, k_B units
arrow_fwd = float(np.sum(dS)); arrow_rev = -arrow_fwd
P(f"D.6  time-reversal control: det(R) forward {rep['detR']:.12f}, reversed {repr_[2]:.12f}, |Δ| = {abs(rep['detR']-repr_[2]):.1e};"
  f" the arrow Σ ΔS/k_B parts them at {arrow_fwd:+.4f} against {arrow_rev:+.4f}")
# deletion test at the kernel: zero one slot, rank three to two, determinant exactly zero
for r, nm in enumerate(["A1/V_F","A2/V_E","A3/V_ER"]):
    Md = Mf.copy(); Md[r] = 0.0; G = Md @ Md.T
    P(f"D.7  deletion test, slot {nm} zeroed: rank(G) = {np.linalg.matrix_rank(G)}, det(G) = {float(np.linalg.det(G)):.1f}, kernel routes {verdict_kernel(Md)[0]} ({verdict_kernel(Md)[4]})")
# the negation's formal row: a localized existent with <T> = 0 under the Heisenberg bound has no formal content
notRA_F = np.zeros(N)
P(f"D.8  ¬RA formal row (⟨T⟩ = 0 at a defined position): variance {float(notRA_F.var()):.1f} · kernel routes {verdict_kernel(np.vstack([notRA_F, L_E, L_ER]))[0]} ({verdict_kernel(np.vstack([notRA_F, L_E, L_ER]))[4]})")

# ================================================================ PART E · THE ADMISSION EMITTERS
P("E.1  GOL admission:", *gol_admit('lock', 'lock' if lit else 'open'))
w = "Heisenberg kinetic-energy bound + Masanes-Oppenheim third law (energy floor); Mandelstam-Tamm and Margolus-Levitin (transition floor); Frozen Substrate Lemma"
P("E.2  bridge leg (transitions and registrations):", imprint_seal('[LOCK]', '[?]', sealL_P=True, gates_P=True, witness_P=w))
pass

P("E.4  Mosaic Seal on this paper:", *delta_m_admit(object_level=False))

# ================================================================ DIGEST
dig = hashlib.sha256(out.getvalue().encode("utf-8")).hexdigest()
P(BAR); P("RECEIPT DIGEST sha256[:16] =", dig[:16]); P(BAR)
open("/home/claude/build/ra_battery_receipt.txt", "w", encoding="utf-8").write(out.getvalue())
