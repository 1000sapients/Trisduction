#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
CHECK.py  ·  companion to "The Forced Alternative Is a Filter"
            (rebuttal to the OpenAI forced Navier-Stokes construction)

Run:  python3 CHECK.py          # stdlib + numpy only, ~2 seconds, no network

WHAT THIS DOES AND DOES NOT DO
  It verifies the four EXECUTABLE claims of the rebuttal. It does not verify,
  and cannot verify, whether the OpenAI construction's estimates converge; that
  is a question for its Lean build, and the rebuttal says so throughout.

  C1  TAUTOLOGY      Once f is DEFINED as the momentum residual R(u,p), the
                     forced Navier-Stokes system holds identically. "Solves"
                     carries zero information. -> machine zero, exactly.
  C2  SCALINGS       The construction's own leading exponents clear every
                     necessity theorem (Leray, L^3, dissipation, BKM) for h>0,
                     and ALL of them collapse at h=0. The anisotropy is
                     load-bearing exactly where the answer differs.
  C3  MATTER         Read in water, the core holds one molecule ~1e-13 s before
                     the singular time, at one molecular radius and Mach 3, and
                     the critical norm has grown by a factor of ~1.5 at the
                     displayed cap h=1/100 and by ~1.004 at h=1e-4.
  C4  ORDER TYPE     eps = Q^h depends on the band index l; the stage count per
                     band does not. Order type omega^2. An omega-tower is
                     anchored by a modulus; an omega^2-tower needs a modulus of
                     moduli (band constants uniform in l). Per-band control does
                     NOT compose: exhibited by an explicit divergent example in
                     which every band sum is finite.

Author: Mohammad F. Islam.  Public domain; reuse, fork, and refute freely.
"""

import math
import numpy as np

PASS, FAIL = [], []


def check(cond, label, detail=""):
    (PASS if cond else FAIL).append(label)
    print(f"  [{'PASS' if cond else 'FAIL'}] {label}" + (f"\n         {detail}" if detail else ""))


# ----------------------------------------------------------------------------
# C1 · the tautology: f := R(u,p) makes the forced system an identity
# ----------------------------------------------------------------------------
def c1_tautology(n=41, nu=1.0):
    """u = curl(psi e_z) for a compactly supported bump psi (so div u = 0 in the
    continuum), p a bump. Define f := R(u,p) by centred differences, then ask
    for max |R(u,p) - f|. It is zero by construction, and that is the point:
    the equation is not being solved, it is being defined."""
    hx = 4.0 / (n - 1)
    g = np.linspace(-2.0, 2.0, n)
    X, Y, Z = np.meshgrid(g, g, g, indexing="ij")
    r2 = X**2 + Y**2 + Z**2
    inside = r2 < 1.0
    psi = np.zeros_like(X)
    psi[inside] = np.exp(-1.0 / (1.0 - r2[inside]))
    d = np.zeros_like(X)
    d[inside] = -2.0 / (1.0 - r2[inside]) ** 2
    u1, u2 = psi * d * Y, -psi * d * X          # curl(psi e_z) = (d_y psi, -d_x psi, 0)
    p = 0.5 * psi

    def dx(a, ax):
        out = np.zeros_like(a)
        sl = [slice(None)] * 3
        lo, hi = sl.copy(), sl.copy()
        lo[ax] = slice(0, -2); hi[ax] = slice(2, None)
        mid = sl.copy(); mid[ax] = slice(1, -1)
        out[tuple(mid)] = (a[tuple(hi)] - a[tuple(lo)]) / (2 * hx)
        return out

    def lap(a):
        out = -6.0 * a
        for ax in range(3):
            sl = [slice(None)] * 3
            lo, hi = sl.copy(), sl.copy()
            lo[ax] = slice(0, -2); hi[ax] = slice(2, None)
            mid = sl.copy(); mid[ax] = slice(1, -1)
            out[tuple(mid)] += a[tuple(hi)] + a[tuple(lo)]
        return out / (hx * hx)

    # steady prescribed field, so d_t u = 0
    R1 = u1 * dx(u1, 0) + u2 * dx(u1, 1) - nu * lap(u1) + dx(p, 0)
    f1 = R1.copy()                                # f := R, the paper's Section 2 move
    residual = float(np.max(np.abs(R1 - f1)))     # the forced equation, with that f
    return residual


# ----------------------------------------------------------------------------
# C2 · the construction's leading exponents against the necessity theorems
# ----------------------------------------------------------------------------
def c2_scalings(h):
    """Core radius tau^(1/2), length tau^(1/2-h), speeds tau^(-1/2-h),
    volume tau^(3/2-h), at viscosity one."""
    return dict(
        energy=0.5 - 3 * h,        # ||u||_2^2 : bounded (and ->0) iff > 0
        L3=-4 * h,                 # ||u||_3^3 : must diverge, so < 0 (Escauriaza-Seregin-Sverak)
        dissipation=-0.5 - 3 * h,  # ||grad u||_2^2 : integrable in time iff > -1 (energy identity)
        bkm=-1.0 - h,              # ||omega||_inf : BKM integral diverges iff <= -1
        reynolds=-h,               # core Reynolds : grows iff < 0
        defect=-1.0 - 4 * h,       # alignment-defect integral : divergent iff <= -1
    )


# ----------------------------------------------------------------------------
# C3 · the object in matter
# ----------------------------------------------------------------------------
def c3_matter(h, T, nu=1e-6, rho=1e3, m=2.99e-26, cs=1480.0):
    L, V = math.sqrt(nu * T), math.sqrt(nu / T)
    tau = (m / (rho * L**3)) ** (1.0 / (1.5 - h))     # core mass = one molecule
    return dict(tau_exit=tau,
                radius=L * math.sqrt(tau),
                speed=V * tau ** (-0.5 - h),
                mach=V * tau ** (-0.5 - h) / cs,
                energy=rho * L**3 * V**2 * tau ** (0.5 - 3 * h),
                L3_growth=tau ** (-4 * h / 3))


# ----------------------------------------------------------------------------
# C4 · the order type and the composition law
# ----------------------------------------------------------------------------
def c4_order_type(h, K_m=5.0, order=10):
    """eps(l) = 2^(-l h) depends on the band index l.
    Stages needed within a band to beat cost K_m at rate h*sigma_j,
    sigma_j = 1/5 + j/10, is j* = 10 K_m / h - 2: independent of l."""
    return dict(log2_inv_eps_per_band=h,               # d/dl of log2(1/eps)
                stages_per_band=10 * K_m / h - 2,      # no l in it
                cutoff_log10_a10=(10 * math.log10(2) + 6.0) / (10 * h))


def c4_composition(C_of_l, levels=40, stages=60):
    """Double sum a[l][j] = C_l * 2^-j * 2^-l. Every band sum is finite for any
    C_l. The composite converges iff sum_l C_l * 2^-l converges."""
    band_sums = [C_of_l(l) * sum(2.0 ** (-j) for j in range(1, stages + 1)) * 2.0 ** (-l)
                 for l in range(1, levels + 1)]
    return all(math.isfinite(b) for b in band_sums), sum(band_sums)


# ============================================================================
def main():
    print("=" * 74)
    print("CHECK.py  ·  The Forced Alternative Is a Filter  ·  executable claims")
    print("=" * 74)

    print("\nC1 · TAUTOLOGY: define f := R(u,p), then the forced system is an identity")
    r = c1_tautology()
    check(r == 0.0, "max |R(u,p) - f| with f := R(u,p) is exactly zero",
          f"value = {r:.3e} on a 41^3 grid. 'Solves' carries zero bits; all content "
          f"is the regularity class of R.")

    print("\nC2 · SCALINGS: the construction's exponents against the necessity theorems")
    for h in (1e-2, 1e-4, 1e-8):
        e = c2_scalings(h)
        ok = (e["energy"] > 0 and e["L3"] < 0 and e["dissipation"] > -1
              and e["bkm"] <= -1 and e["reynolds"] < 0)
        check(ok, f"h = {h:g}: energy {e['energy']:.6f}, L3 {e['L3']:.6f}, "
                  f"dissipation {e['dissipation']:.6f}, BKM {e['bkm']:.6f}")
    e0 = c2_scalings(0.0)
    check(e0["L3"] == 0.0 and e0["reynolds"] == 0.0,
          "h = 0 (isotropic cousin): L3 divergence and Reynolds growth both vanish",
          "the construction dies exactly on the cousin where the answer differs, "
          "so the anisotropy is structure and not decoration.")

    print("\nC3 · MATTER: the object read in water (nu=1e-6, rho=1e3, m=2.99e-26 kg)")
    for T in (1.0, 1e3):
        for h in (1e-2, 1e-4):
            d = c3_matter(h, T)
            check(d["radius"] < 1e-9 and d["mach"] > 1.0,
                  f"T={T:g}s h={h:g}: exit at tau={d['tau_exit']:.2e}s, radius "
                  f"{d['radius']:.2e} m, {d['speed']:.2e} m/s (Mach {d['mach']:.1f}), "
                  f"L3 growth to that instant {d['L3_growth']:.3f}")
    print("         Past the exit the fast region holds < 1 molecule: no continuum, "
          "no incompressibility,\n         no material referent. The signature every "
          "singularity must show is invisible in every\n         window an instrument can reach.")

    print("\nC4 · ORDER TYPE: eps = Q^h is band-dependent, the stage count is not")
    for h in (1e-2, 1e-4, 1e-8):
        d = c4_order_type(h)
        check(d["cutoff_log10_a10"] > 60,
              f"h = {h:g}: stages per band {d['stages_per_band']:.3g} (no band index in it); "
              f"cutoff log10(a_10) = {d['cutoff_log10_a10']:.3g}")
    print("         Bands form an omega-sequence; each band carries an omega-sequence "
          "of stages.\n         Order type omega^2.")

    print("\n     Composition law: per-band control does not compose by itself.")
    fin_u, tot_u = c4_composition(lambda l: 1.0)         # band constants uniform in l
    fin_g, tot_g = c4_composition(lambda l: 2.0 ** l)    # band constants growing like 2^l
    check(fin_u and tot_u < 2.0,
          f"C_l uniform in l: every band finite, composite = {tot_u:.4f} (converges)")
    check(fin_g and tot_g > 30.0,
          f"C_l = 2^l:        every band finite, composite = {tot_g:.1f} and grows "
          f"linearly in the band count (diverges)")
    print("         Therefore an omega^2 tower is anchored only by a MODULUS OF MODULI: "
          "a bound on\n         the band constants uniform in the band index. That is "
          "Demand 8 of the paper, and it\n         is a question to the authors, not a "
          "claim that it fails.")

    print("\n" + "=" * 74)
    print(f"RESULT  {len(PASS)}/{len(PASS)+len(FAIL)} checks pass")
    print("""
WHAT THIS ESTABLISHES
  The forced Millennium alternative is a regularity filter on a field one is free
  to prescribe (C1, and Theorem 2 of the paper, which is a proof and not a
  computation). The construction's anisotropy is load-bearing (C2). Its object
  has no material referent and no observable signature (C3). Its correction
  scheme has order type omega^2 and therefore owes an anchor one type higher
  than any its prose exhibits (C4).

WHAT THIS DOES NOT ESTABLISH
  Nothing here says the OpenAI construction is wrong. No step of it was found
  broken and none is asserted to be. If its Lean build reproduces under an
  independent reader, it is a theorem, and every claim above still stands,
  because these are claims about what the theorem says, not about whether it
  holds.

FALSIFIERS (from the paper)
  F1  a passage supplying band constants uniform in l retires C4 and Demand 8.
  F2  a counterexample to either direction of Theorem 2 retires the reduction.
  F3  a realization at continuum scales, or a resolvable critical-norm
      divergence in a finite window, retires C3.
""")
    print("=" * 74)
    return 0 if not FAIL else 1


if __name__ == "__main__":
    raise SystemExit(main())
