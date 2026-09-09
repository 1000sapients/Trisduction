---
title: The Forced Alternative Is a Filter
subtitle: What a constructed Navier--Stokes blowup proves, what it does not, and one order-type demand on its correction tower
article_type: Rebuttal and Reading
author_line: Mohammad F. Islam, PhD
affiliation: Independent researcher
date: 9 September 2026 · sealed, audit cycle reb-20260909 v3
short_title: The Forced Alternative Is a Filter
accenthex: B87333
keywords: Navier--Stokes equations; finite-time blowup; Millennium Prize alternatives; forced regularity; ordinal analysis; formal verification
abstract: >-
  On 8 September 2026 a construction was released, under the author line OPENAI, claiming a smooth compactly supported force under which a solution of the three-dimensional incompressible Navier--Stokes equations develops unbounded velocity in finite time from rest at bounded energy, thereby resolving Millennium alternatives (C) and (D). This paper does not assert that the construction is wrong. It proves four things about what such a construction can mean and one thing it must supply. First, a reduction theorem: alternative (C) holds if and only if there exists a smooth bounded-energy field, singular in finite time, whose Navier--Stokes residual extends to a smooth decaying force. The equation therefore acts as a regularity filter on a field one is free to prescribe, and no evolution from data enters the forced alternatives at all. Second, the construction's own limit lemma places the force flat to infinite order at the singular point, so the force performs no act where the velocity diverges. Third, the constructed field is the limit of an iteration designed to make the residual flat, so the theorem is true by design conditional on convergence, and in the source-attribution register the field is occupied by its own designer and by no generator independent of the design. Fourth, in the construction's dyadic chart the small parameter is a function of the band index and the stage count within a band is band-independent, so the correction scheme has order type omega squared; the anchor such a tower requires is a modulus of moduli, uniformity of the band constants in the band index, and per-band control does not compose by itself. We state that demand as the paper's one open question to the authors and to any referee. We close with the complementary unforced criterion of an earlier paper and with three falsification criteria for the present one.
---

# Introduction

Fefferman's statement of the Navier--Stokes Millennium problem carries four alternatives. (A) and (B) ask for global existence and smoothness of the unforced equation on $\mathbb{R}^3$ and on the torus. (C) and (D) ask for a breakdown scenario: smooth data $u_0$ and a smooth force $f$ obeying decay bounds such that no smooth bounded-energy solution exists globally. The construction released on 8 September 2026 addresses (C) and (D). The unforced alternatives, which most readers mean by the problem, remain open, and nothing in this paper or in that construction touches them.

This paper is a reading, not a refutation. Its arguments were produced by re-executing the construction's own leading scalings, reading its statements, and proving four propositions that hold whatever the construction's estimates do. We found no broken step and no contradiction with any known theorem. We found that the sentence the construction is carried under is far stronger than the statement it proves, that the strengthening happens in four identifiable places, and that its correction scheme carries an order type whose anchor a prose reading cannot exhibit.

Section 2 proves the reduction. Section 3 records the silence of the force at the singular point. Section 4 states the design fixed point and what conditional truth means here. Section 5 gives the source-attribution reading. Section 6 gives the order-type theorem and its demand. Section 7 records what the construction's object is in matter. Section 8 states precisely what a successful machine verification would and would not settle. Section 9 gives the complementary unforced criterion. Section 10 states the falsification criteria for this paper and closes.

# The reduction: the forced alternative is a regularity filter

Write the Navier--Stokes residual of a pair $(u,p)$ as
$$ R(u,p) \;:=\; \partial_t u + (u\cdot\nabla)u - \nu\Delta u + \nabla p . $$
A forced solution is a triple $(u,p,f)$ with $R(u,p)=f$ and $\operatorname{div} u = 0$.

**Proposition 1 (tautology).** For every smooth divergence-free $u$ and smooth $p$, the triple $(u,p,R(u,p))$ is a forced solution.

*Proof.* $R(u,p)=R(u,p)$. $\square$

The proposition is trivial and its consequence is not. In any theorem asserting the existence of a smooth force under which a prescribed pair solves the forced system, the word *solves* carries no information once $f$ is defined as the residual; the entire content of such a theorem is the regularity class of $R(u,p)$.

**Theorem 2 (reduction).** Alternative (C) holds for viscosity $\nu>0$ if and only if there exist $T<\infty$ and a smooth divergence-free pair $(u,p)$ on $\mathbb{R}^3\times[0,T)$ with $\sup_{t<T}\lVert u(t)\rVert_{L^2}<\infty$, such that $u$ does not extend smoothly past $T$ and $R(u,p)$ extends to a smooth force on $\mathbb{R}^3\times[0,\infty)$ satisfying the decay bounds of the problem statement.

*Proof.* ($\Leftarrow$) Put $f:=R(u,p)$ extended and $u_0:=u(\cdot,0)$. Suppose a smooth bounded-energy pair $(v,q)$ solved the system with these data on $\mathbb{R}^3\times[0,\infty)$. By weak--strong uniqueness in the smooth bounded-energy class with a smooth force, $(v,q)=(u,p)$ on $[0,T']$ for every $T'<T$; since $v$ is smooth at $T$ it is bounded near $T$, contradicting the non-extendability of $u$. Hence no such $(v,q)$ exists, which is (C).

($\Rightarrow$) Given (C) with data $(u_0,f)$ in the decay class of the problem statement, standard local well-posedness for smooth rapidly decaying data and force (Kato's mild-solution theory, or Leray's construction with the smoothing of the heat semigroup) gives a unique smooth solution on a maximal interval $[0,T^\ast)$, with energy bounded there by the energy inequality with force, since $f\in L^1_{\mathrm{loc}}L^2$ on that interval by the decay bounds. If $T^\ast=\infty$ the solution would be global, smooth and bounded-energy, contradicting (C); so $T^\ast<\infty$, the solution does not extend past $T^\ast$ by maximality, and its residual is $f$, smooth with the required decay. $\square$

**Corollary 3.** No evolution from data enters the forced alternatives. Their content is the existence of a *written* field, singular in finite time, whose residual is smooth. The equation appears only through the operator $R$, as a filter on fields one is free to prescribe.

We stress what Corollary 3 does and does not say. It does not say (C) is easy: making $R$ smooth at a singularity of a field one has prescribed is a hard analytic problem, and the released construction spends most of its length on it. It says that the difficulty is of that kind and not of the kind a reader hears in the sentence "a fluid develops a singularity."

# The silence of the force at the singular point

The released construction's limit lemma (its Lemma 10.2) states that every mixed space-time derivative of the force converges as $t\uparrow 1$ to a function in $C_c^\infty(\mathbb{R}^3)$ vanishing to all orders at the origin, and its extension lemma preserves those limits. Hence:

**Observation 4.** In that construction the force and all of its derivatives vanish at the singular point $(0,1)$.

The force acts at ordinary scales, preparing an inward spiral with axial outflow; at the point where the velocity diverges it does nothing, and the concentration there is inertia against viscosity. This makes the result stronger as mathematics, since the singular mechanism is intrinsic to the flow, and it makes the phrase *driven by a smooth force* inaccurate at the only location the phrase names.

# The design fixed point

Let $u_0$ denote a prescribed leading profile and let
$$ u_{n+1} \;=\; u_n + C_n\bigl(R(u_n)\bigr) $$
be a correction cycle in which each $C_n$ is chosen so that $R(u_{n+1})$ decays faster at the singular point than $R(u_n)$ by a fixed factor. If the cycle converges in the sense supplied by the construction's summation and extension lemmas, its limit $u$ satisfies: $R(u)$ is flat to infinite order at the singular point.

**Observation 5.** By Proposition 1 the only clause of such a theorem that is not true by construction is the regularity of $R(u)$ through the singular time, which is exactly the convergence of the cycle. The theorem is therefore true by design, conditional on that convergence, and its root object is a written field rather than a solution found.

This is a description of a method, not an objection to it. Fixed-point constructions are among the oldest existence proofs in analysis. What the description fixes is the location of every remaining question: they are all questions about the convergence of an iteration whose target was chosen in advance.

# The source-attribution reading

A construction of this kind can be read in the register where one asks not whether a completion is permitted but whether it is occupied, and by what. Let two manifest axes be given: formal permission, whether the field satisfies its constraints, and the design trajectory, the ansatz together with its correction cycle. Let the witness be the constructed field. The diagnostic in this register is not the Gram determinant of the three axes, which is invariant on the orthogonal complement of the manifest plane and therefore carries no information about provenance; it is the partial correlation of the witness's out-of-plane residual with a claimed independent generator, measured against a null. Two words are used technically here. *Attribution* means the share of a quantity's variation explained by a named source, in the statistical sense and not in the sense of credit. A *null* is the value that statistic takes when the source is independent of the quantity, so that exceeding it is evidence of a real relation.

**Observation 6.** (i) The attribution of the constructed field to its author's own design is total, since the design produced it. (ii) Its attribution to any generator independent of the design is zero, and not by accident: by Corollary 3 no dynamics enters the forced alternative, so no evolution from data can source the field, now or later. (iii) The certificate offered for the field, a machine-checked build produced by the claimant's own system, has attribution to an independent verifier at the null as the public record stands.

The two absences have different fates and the difference is the practical content of this section. The second fills the moment an independent reader reproduces the build, an act anyone can perform. The first cannot fill on the dynamics axis at all; it fills only on the construction axis, where the machine is the source. That is what "a theorem about the idealization" means when it is stated precisely rather than gestured at.

# The order type of the correction scheme

We now state the paper's one open demand, and it is a mathematical demand rather than a reading.

The released construction works in a dyadic chart. With band index $\ell$ it sets
$$ Q = 2^{-\ell},\qquad \varepsilon = Q^{h},\qquad S_\ast = \ell^2, $$
and rescales $(r,z,\tau)$ by $(Q^{1/2},Q^{D},Q)$, where $\tau=1-t$ and $h>0$ is the anisotropy parameter. Within a band the correction cycle improves the residual by $\varepsilon^{\sigma_j}$ with $\sigma_j = \tfrac15 + \tfrac{j}{10}$. Reaching the singular time means letting $\ell$ run without bound.

**Theorem 7 (order type).** In this chart:

(i) The small parameter is a function of the band, $\varepsilon(\ell)=2^{-\ell h}$, so $\log_2(1/\varepsilon)=\ell h\to\infty$ while $\log_2(1/\varepsilon)/S_\ast = h/\ell \to 0$.

(ii) The number of stages required within a band to overcome a derivative cost $K_m$ at rate $h\sigma_j$ is $j^\ast = 10K_m/h - 2$, which depends on $h$ and on $K_m$ and not otherwise on $\ell$. The released construction states $K_m$ independent of the stage index; whether it may depend on the band index is not stated there, and if it may then $j^\ast$ is band-dependent and the demand of (iv) is the sharper for it.

(iii) Consequently the bands form an $\omega$-sequence and each band carries an $\omega$-sequence of corrections: the scheme has order type $\omega^2$.

(iv) An $\omega$-tower is anchored by a modulus, a rule fixing in advance how fast its terms vanish; this is what Borel's device supplies when cutoffs are chosen after the stage constants. An $\omega^2$-tower is anchored only by a modulus of moduli: control of the band constants uniformly in $\ell$. Per-band control does not compose by itself.

*Proof.* (i) and (ii) are computations from the displayed definitions. (iii) is their conjunction. For (iv), let $a_{\ell,j}\ge 0$ with $\sum_j a_{\ell,j} = S_\ell < \infty$ for every $\ell$. Then $\sum_\ell \sum_j a_{\ell,j}$ converges if and only if $\sum_\ell S_\ell < \infty$, which is a condition on the band totals and is not implied by the finiteness of each. Taking $a_{\ell,j} = C_\ell 2^{-j}\cdot 2^{-\ell}$ with $C_\ell = 2^{\ell}$ gives $S_\ell \to 1$ and a divergent double sum while every band sum is finite; taking $C_\ell$ bounded gives convergence. $\square$

**Demand 8.** Every bound we read in the released construction is stated at fixed band, with constants free to depend on the stage and on the band, and its summation runs its cutoffs at fixed band. An $\omega^2$ scheme requires in addition a bound on the band constants uniform in $\ell$. We could not locate that uniformity in the prose, and we note that a chart is precisely a device that makes every band look alike, so a prose reading is not the instrument that can settle it.

We state Demand 8 as a demand and not as a defect. It may be discharged in band bookkeeping we did not read at that depth, and a machine-checked proof would either carry the uniformity or fail to compile without it. We regard it as the single most useful question a referee of that construction can ask, because it is the one question whose answer is invisible in the register where the construction is written.

Two classical readings frame the demand and neither of them condemns the construction. An infinite process has a determinate value when a modulus of convergence exists; Borel's device supplies rather than computes such a modulus, which is a difference in provenance and not in validity, so the per-band summation is sound as an $\omega$-tower. And the towers here are countable: no completed uncountable object is asserted anywhere in the construction, so no set-theoretic pathology is in play. What is in play is only the composition law of Theorem 7 (iv), that an anchor must rise with the order type of the tower it anchors.

# The object in matter

The construction is a statement about the continuum. It is worth recording what its object is when read in a fluid, because the sentence it is carried under is a sentence about fluids.

At viscosity one, the construction's core has radius $\tau^{1/2}$, length $\tau^{1/2-h}$, speeds of order $\tau^{-1/2-h}$ and volume $\tau^{3/2-h}$, and its viscosity map $u_\nu=\sqrt{\nu}\,u(x/\sqrt{\nu},t)$ carries the residual exactly with the singular time unchanged. Read in water at $\nu=10^{-6}\,\mathrm{m^2 s^{-1}}$, $\rho=10^3\,\mathrm{kg\,m^{-3}}$, with the singular time placed at $T$ seconds, the core mass is $\rho(\nu T)^{3/2}\tau^{3/2-h}$ and equals the mass of one water molecule at
$$ \tau_{\mathrm{exit}} \;=\; \Bigl(\frac{m}{\rho\,(\nu T)^{3/2}}\Bigr)^{1/(3/2-h)} . $$
For $T=1\,\mathrm{s}$ and $h=10^{-2}$ this is $7.9\times10^{-14}$ s before the singular time, at which moment the core radius is $2.8\times10^{-10}$ m, one molecular diameter, and the core speed is $4.8\times10^{3}\,\mathrm{m\,s^{-1}}$, Mach 3.3 in water. For $h=10^{-4}$ the numbers are $9.6\times10^{-14}$ s, $3.1\times10^{-10}$ m and $3.2\times10^{3}\,\mathrm{m\,s^{-1}}$. Placing the singular time at $10^3$ s moves the exit to $10^{-17}$ s and changes nothing else materially.

**Observation 9.** Past $\tau_{\mathrm{exit}}$ the region of the construction whose speed exceeds every earlier value contains less than one molecule. The object leaves matter, and with it the continuum hypothesis of the model and incompressibility, before its velocity has done anything a fluid could exhibit.

**Observation 10.** The signature any singularity must show, the divergence of the critical norm $\lVert u\rVert_{L^3}$, grows in the construction as $\tau^{-4h/3}$. Up to $\tau_{\mathrm{exit}}$ that factor is $1.495$ at the displayed cap $h=10^{-2}$, $1.004$ at $h=10^{-4}$, and smaller still at the value the construction's own parameter schedule forces, which is below $\exp(-\exp(M_d))$ for a large constant $M_d$. No experiment and no simulation can meet this object even in principle.

Observations 9 and 10 do not bear on the mathematics. They fix the register in which the theorem, if it holds, is true.

# What a machine verification settles

The released construction ships a Lean 4 project, pinned to a toolchain and to Mathlib, exposing theorems named for alternatives (C) and (D), with a checking configuration permitting only the three standard axioms of that system and a reference statement adapted from an independently written formalization of the Millennium problem. This is a substantial and welcome artifact, and it changes the shape of the verification question.

What an independent reproduction would settle: the convergence questions of Section 4, the uniformity demand of Section 6, and every constant-tracking question a prose reading cannot reach. A kernel does not care how small $h$ is. If the build reproduces on an independent machine and the adapted statement is confirmed to be the problem's statement, the construction is a theorem.

What it would not settle: Theorem 2 and Corollary 3, which are propositions about the alternative and not about the proof; Observation 4, which is the construction's own lemma; Observation 6 (ii), which is a consequence of Corollary 3 and cannot be changed by any verification; and Observations 9 and 10, which are arithmetic. A successful build strengthens the mathematics and leaves every reading in this paper standing.

We note one audit that is owed and is small: the reference statement is described as adapted, and the difference between the independent formalization and the challenge module is exactly the surface on which a formal witness could certify a different object from the one named. That diff is public and short.

# The complementary criterion, unforced

For completeness we record the criterion of a companion paper, which concerns the unforced equation and is the complement of the construction discussed here. For $a\in(0,1)$ define the alignment defect
$$ \mathcal{A}_a(t) = \iint \frac{\sigma(x,y)^2\,\lvert\omega(x)\rvert\,\lvert\omega(y)\rvert}{\lvert x-y\rvert^{3+2a}}\,dx\,dy, $$
with $\sigma(x,y)=\lvert\sin\angle(\xi(x),\xi(y))\rvert$ the sine of the angle between vorticity directions and $\sigma=0$ where either vorticity vanishes. For $p\in[2,6]$, $a\in(3/(2p),1)$ and $q=2p/(p+3)$, finiteness of $\int_0^{T^\ast}\mathcal{A}_a^{\,q}\,dt$ forbids blowup; at the endpoint $a=3/(2p)$ with $p\in(2,6)$ the same conclusion holds and the hypothesis functional is invariant under the Navier--Stokes scaling. The criterion is a statement about how a flow must lose alignment in order to become singular. Extended to a smooth compactly supported force the enstrophy balance gains a term bounded by $\lVert\nabla\times f\rVert_{L^2}\lVert\omega\rVert_{L^2}$, whose coefficient is integrable in time, so the criteria survive and predict that any forced blowup carries a divergent defect integral. A scaling of the released construction's core, with vorticity of order $\tau^{-1-h}$ and direction varying across a radial width $\tau^{1/2}$, gives that integral an exponent of $-1-4h$, divergent. This is a consistency check at the level of exponents, computed after reading the construction and reported as such; it corroborates the criterion and proves nothing.

# Falsification and close

We state three criteria, each of which would sink a stated claim of this paper.

**F1.** A passage of the released construction supplying a bound on its band constants uniform in the band index retires Demand 8 and with it the open question of Section 6.

**F2.** A proof that alternative (C) requires an evolution from data, that is, a counterexample to either direction of Theorem 2, retires Corollary 3 and every reading that rests on it, including Observation 6 (ii).

**F3.** A realization of the construction's mechanism at continuum scales, or a demonstration that its critical-norm divergence is resolvable within a finite observation window, retires Observations 9 and 10.

We close by stating our position plainly. If the released construction's estimates hold, it is a substantial theorem: an explicit smooth field, singular in finite time at bounded energy, whose Navier--Stokes residual is a smooth compactly supported force, and with it the forced Millennium alternatives. We have not found an error in it and we do not assert one. What we assert is that the theorem is a regularity statement about a written field rather than a dynamical statement about a fluid; that its force is silent where its field breaks; that its object has no material referent and no observable signature; that its only generator is its author; and that its correction scheme has order type $\omega^2$ and therefore owes an anchor one type higher than any its prose exhibits. The unforced problem, alternatives (A) and (B), remains open for everyone, and it is the one whose answer would tell us something about water.

# Reproducibility

Every executable claim of this paper is checked by a single self-contained script, `CHECK.py`, distributed with it: standard library and NumPy only, no network, about two seconds. It verifies the tautology of Section 2 at machine zero on a grid, the leading exponents of Section 6 against the necessity theorems together with their collapse at $h=0$, the material figures of Section 7, and the order-type computations and the composition counterexample of Theorem 7. It reports 14 of 14 and prints, in its own output, what it does not establish: nothing in it bears on whether the released construction's estimates converge, which is a question for its machine-checked build. The script is public domain.

# Appendix A · Author, methodology, and disclosure

**Author.** Mohammad F. Islam, PhD, independent researcher. Sole author and sole authority for every claim, every concession, and every error in this paper. Correspondence through the Zenodo record of reference 13.

**Method.** The mathematical content was developed by the author and drafted with a large language model acting as scribe under the author's direction: the model executed computations, checked citations, drafted prose to the author's specification, and argued against the author's positions on instruction. It authored no claim that the author did not seat, and it holds no authorship. Two claims were weakened during drafting on the model's objection and are reported here rather than silently absorbed: the assertion that the alignment-defect prediction of Section 9 was on record before the released construction was read was corrected, since only the unforced theorems and their falsifiers were on record and the forced extension was written after that reading, so the corroboration is typed as reached after the fact; and a claim of primacy for the released construction as the first hard blowup witness in circulation was scoped to the author's knowledge for want of a census.

**Verification standing.** No claim in this paper is machine-checked. Theorem 2 and Theorem 7 are proofs on the page and stand or fall as such. Sections 3, 6, 7 and 9 rest on figures re-executed in session and reproducible by Appendix B. The paper carries no independent referee and none is claimed; a reader who is not the author is the only party who can settle its standing, which is exactly the condition it asserts of the work it reads.

**Prior relation and interest.** The author is the author of reference 13, the unforced criterion recorded in Section 9, and therefore has an interest in the standing of a competing result. Two disclosures follow from that. The paper asserts no error in the released construction and would be unharmed by its confirmation, which Section 8 states in the direction that costs the author most. And Section 9 is confined to one paragraph and one consistency check reported as computed after the fact, rather than being argued.

**Sources.** The construction was read from a copy supplied to the author, identified in reference 2 by its SHA-256 prefix; a copy fetched the same day from the public link carried a different reference list, so at least two builds circulate. Which build a given reader holds therefore matters, and every statement here about the construction's text refers to the copy named by that prefix. The Lean project, its toolchain pin, its permitted-axiom list, and its adapted reference statement were read from the public repository; the build was not executed by this author. The announcement and the concurrent statement of reference 11 were read as published. No unpublished material and no private communication informs this paper.

**Standing of the concurrent dispute.** A public objection concerning timing, data access, and authorship attends the released construction. Nothing in it bears on any mathematical claim here, and no claim here rests on it. It is named once, in this paragraph, because a reader is entitled to know that the author knew of it.

# Appendix B · The reproduction script

The script below is the paper's executable spine. Standard library and NumPy only; no network; about two seconds. It verifies the tautology of Section 2 at machine zero, the leading exponents of Section 6 together with their collapse at $h=0$, the material figures of Section 7, and the order-type computations and the composition counterexample of Theorem 7, reporting 14 of 14. It checks nothing about whether the released construction's estimates converge, and prints that limitation in its own output. Public domain.

```{=latex}
\begin{figure*}[p]
\scriptsize
\begin{verbatim}
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
\end{verbatim}
\begin{center}\footnotesize\textsc{Appendix B, listing 1 of 3.}\end{center}
\end{figure*}
```
```{=latex}
\begin{figure*}[p]
\scriptsize
\begin{verbatim}
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
\end{verbatim}
\begin{center}\footnotesize\textsc{Appendix B, listing 2 of 3.}\end{center}
\end{figure*}
```
```{=latex}
\begin{figure*}[p]
\scriptsize
\begin{verbatim}
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

\end{verbatim}
\begin{center}\footnotesize\textsc{Appendix B, listing 3 of 3.}\end{center}
\end{figure*}
```

# Appendix C · Self-audit record

The paper was audited against itself before release, in five adversarial rounds under a fixed protocol: eight claims and their falsifiers registered and locked before the first round; three defects planted into a seeded copy each round and required to be caught before that round could count; six registers prosecuted, kinematic, definitional, parameter, provenance, limit and symmetry; every repair verified by a propagation sweep run before and after the change. The rounds are single-substrate, which is a limitation the record states rather than hides: an adversary who is not the author has not read this paper.

Four findings against the paper were earned and repaired, and one fault was charged against the auditing procedure itself. The table below is the whole census. The two entries that matter are R5, which found the paper's central proposition resting on uncited standard theory, and R3, which found the paper's sharpest claim printed more strongly than its own formula supports.

```{=latex}
\begin{table*}[t]
\small
\setlength{\tabcolsep}{5pt}
\renewcommand{\arraystretch}{1.2}\raggedright
\begin{tabular}{@{}p{0.04\textwidth}p{0.082\textwidth}p{0.108\textwidth}p{0.315\textwidth}p{0.315\textwidth}@{}}
\toprule
\textbf{Id} & \textbf{Register} & \textbf{Claim struck} & \textbf{Mechanism found} & \textbf{Repair, and its direction} \\
\midrule
R2 & definitional & Section 5, the attribution reading &
\emph{Attribution} and \emph{null} carried technical senses with no definition, in the one section a reader is most likely to misread as a claim about credit rather than about statistics. &
First-use glosses added for both. \textsc{strengthens}: the register can no longer be read as an accusation. \\
R3 & kinematic & Theorem 7 (ii), the stage count &
The clause was printed as band-independent while its own formula carries $K_m$, and the released construction fixes $K_m$ independent of the stage index but says nothing about the band index. As printed the clause claimed more than it had. &
Scoped to ``depends on $h$ and on $K_m$ and not otherwise on $\ell$'', with the open band dependence named. \textsc{narrows and strengthens}: Demand 8 gains a second, cheaper route to its own retirement. \\
R5 & parameter & Theorem 2, the reduction &
The reverse direction invoked local well-posedness for smooth decaying data and force, and the energy inequality with force, without citation. Both are standard and both are load-bearing on the paper's central proposition. &
The decay class named and Kato's mild-solution theory and Leray's construction cited inline. \textsc{strengthens}: the proposition no longer rests on an unnamed appeal. \\
R6 & provenance & Appendix A, the sources &
The manner of receipt of the audited copy was undisclosed while two builds of the construction are known to circulate with different reference lists, so a reader could not reconstruct which text was read. &
Receipt stated, and every textual claim about the construction bound to the copy named by its \textsc{sha}-256 prefix. \textsc{strengthens}: the reading is now addressable. \\
\midrule
ERR\nobreakdash-1 & auditor & none &
Round one was closed before its two findings were filed, so R2 and R3 were repaired in the artifact with no ledger row in their own round; the repairs and their sweeps stood, and the round-one census was understated by two. &
Census corrected on the record in round three. Charged against the auditing seat, not the paper. \\
\bottomrule
\end{tabular}
\vspace{4pt}\begin{center}\begin{minipage}{0.92\textwidth}\footnotesize\textsc{Appendix C.} The complete self-audit census: four findings earned against the paper and one fault against the audit. Five rounds, six registers, controls three of three on verified plants in every round, two propagation sweeps each verified before and after its repair, terminal verdict sealed at the fifth round. No claim's warrant tier rose during the cycle and no claim was added.\end{minipage}\end{center}
\end{table*}
```

Three properties of this record are worth stating plainly, because a self-audit that reports only successes is an advertisement. Every finding above moved a claim in the direction of saying less, or of saying it with its support named. No finding moved a claim upward, and the protocol returns a fault if one does. And the one error that matters most to a hostile reader, R3, was found against the paper's own strongest and most novel assertion, which is where an author's attention is least reliable and where an audit earns its cost.

# Appendix D · Summary card

The five critique vectors of this paper, each with its core argument, its justification, its warrant, and the observation that would retire it. The card is a reading aid and carries no claim not proved in the body; where the card and the body differ, the body governs.

```{=latex}
\begin{table*}[t]
\small
\setlength{\tabcolsep}{5pt}
\renewcommand{\arraystretch}{1.2}\raggedright
\begin{tabular}{@{}p{0.145\textwidth}p{0.195\textwidth}p{0.235\textwidth}p{0.135\textwidth}p{0.19\textwidth}@{}}
\toprule
\textbf{Vector} & \textbf{Core argument} & \textbf{Justification} & \textbf{Warrant} & \textbf{Retired by} \\
\midrule
Reduction &
The forced equation is a regularity filter, not a dynamics. &
Defining $f := R(u,p)$ solves the forced system identically, so ``solves'' carries no weight; the whole problem is a singular field whose residual extends smoothly. &
Theorem 2, proved here; Proposition 1, exact at machine zero. &
A counterexample to either direction of Theorem 2 (F2). \\
Force silence &
The force vanishes at the singularity and does not drive it. &
The construction's own limit lemma gives every mixed derivative of the force converging to a function flat to all orders at the origin. &
Observation 4, the construction's Lemma 10.2. &
A statement in the construction under which the force does not vanish there. \\
Source attribution &
The field is authored, not evolved. &
A fixed-point cycle $u_{n+1}=u_n+C_n(R(u_n))$ drives the residual to flatness at a target chosen in advance; by the reduction no dynamics can source it. &
Observations 5 and 6, the second resting on Corollary 3. &
An independent generator, that is, a dynamics from data entering alternative (C) (F2). \\
Order type $\omega^2$ &
The correction scheme owes an anchor its prose does not exhibit. &
$\varepsilon(\ell)=2^{-\ell h}$ carries the band index and $j^\ast=10K_m/h-2$ does not; bands and stages are each $\omega$-sequences, so the scheme is $\omega^2$ and needs band constants uniform in $\ell$. Finite band sums do not give a finite composite. &
Theorem 7, proved with an explicit counterexample; Demand 8, stated as a question. &
A passage supplying band constants uniform in $\ell$, or fixing $K_m$ independent of $\ell$ (F1). \\
Material\newline irrelevance &
The continuum fails before the blowup. &
In water the core holds one molecule at $\tau_{\mathrm{exit}}$, which at $h=10^{-2}$ is $7.9\times10^{-14}$ s before the singular time, at one molecular diameter and Mach 3.3, with $\lVert u\rVert_{L^3}$ grown by 1.495. &
Observations 9 and 10, arithmetic at stated constants. &
A realization at continuum scales, or a critical-norm divergence resolvable in a finite window (F3). \\
\bottomrule
\end{tabular}
\vspace{4pt}\begin{center}\begin{minipage}{0.92\textwidth}\footnotesize\textsc{Appendix D.} The five critique vectors, their warrants, and their falsifiers. None of the five asserts an error in the released construction, and none is retired by a successful machine verification of it: the first three are propositions about the alternative or the construction's own lemmas, the fourth is a question a verification would answer, and the fifth is arithmetic.\end{minipage}\end{center}
\end{table*}
```

One line holds the card together. Four of the five vectors survive any outcome of the construction's verification, because they say what the theorem is rather than whether it holds; the fourth is the single vector a machine can settle, and settling it in the construction's favour is the outcome this paper expects and would welcome.

# References

1. C. L. Fefferman, *Existence and smoothness of the Navier--Stokes equation*, Clay Mathematics Institute Millennium Prize Problem statement, 2000.
2. OPENAI, *Finite time blowup for Navier--Stokes*, 8 September 2026; Lean formalization at github.com/openai/NavierStokesAndEuler; announcement at openai.com/index/navier-stokes-solution/. Copy audited here identified by SHA-256 prefix 0e779481.
3. J. Leray, *Sur le mouvement d'un liquide visqueux emplissant l'espace*, Acta Math. **63** (1934), 193--248.
4. J. Serrin, *The initial value problem for the Navier--Stokes equations*, in Nonlinear Problems, Univ. Wisconsin Press, 1963, 69--98.
5. L. Escauriaza, G. Seregin, V. Šverák, *$L^{3,\infty}$-solutions of the Navier--Stokes equations and backward uniqueness*, Russian Math. Surveys **58** (2003), 211--250.
6. J. T. Beale, T. Kato, A. Majda, *Remarks on the breakdown of smooth solutions for the 3-D Euler equations*, Comm. Math. Phys. **94** (1984), 61--66.
7. L. Caffarelli, R. Kohn, L. Nirenberg, *Partial regularity of suitable weak solutions of the Navier--Stokes equations*, Comm. Pure Appl. Math. **35** (1982), 771--831.
8. E. Borel, *Sur quelques points de la théorie des fonctions*, Ann. Sci. École Norm. Sup. **12** (1895), 9--55.
9. D. Córdoba, L. Martínez-Zoroa, *Blow-up for the incompressible 3D Euler equations with a force*, arXiv:2309.08495.
10. D. Córdoba, L. Martínez-Zoroa, F. Zheng, *Finite time blow-up for the hypodissipative Navier--Stokes equations with a force*, Arch. Ration. Mech. Anal. **250** (2026).
11. L. Alpöge, T. Buckmaster, *Finite-time blowup with smooth forcing for the porous-media, Boussinesq and 3D Euler equations*, and accompanying statement, 8 September 2026.
12. T. Tao, *Finite time blowup for an averaged three-dimensional Navier--Stokes equation*, J. Amer. Math. Soc. **29** (2016), 601--674.
13. M. F. Islam, *Integrable misalignment forbids blowup: a scale-invariant geometric continuation theorem for three-dimensional Navier--Stokes*, Zenodo, 2026, DOI 10.5281/zenodo.22665831.
14. Google DeepMind, *Formal Conjectures*: Lean formalization of the Navier--Stokes problem statement, github.com/google-deepmind/formal-conjectures.
