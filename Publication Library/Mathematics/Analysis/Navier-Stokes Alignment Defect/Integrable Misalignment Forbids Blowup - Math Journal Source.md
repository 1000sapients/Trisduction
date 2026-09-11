---
edition: math_journal
title: "Integrable Misalignment Forbids Blowup: A New Scale-Invariant Geometric Continuation Theorem for Three-Dimensional Navier-Stokes, Proved from the Classical Base"
subtitle: "The alignment defect, a new functional matched to vortex stretching, its continuation family carried to a Lorentz-space endpoint at the critical line, and the one effective axiom that closes it, a Trisductive deduction"
article_type: "Mathematical Analysis · Continuation Criterion and Conditional Theorem"
goal: "A geometric continuation family proved to its critical endpoint, and the single effective axiom that closes it to global regularity."
author_line: "Mohammad F. Islam, PhD"
affiliation: "Independent Researcher · The Trisduction Program"
date: "September 8, 2026"
short_title: "Integrable Misalignment and Navier-Stokes"
keywords: "Navier-Stokes equations; global regularity; vorticity alignment; geometric depletion; continuation criterion; effective bounds; Constantin-Fefferman; Trisduction"
abstract: |
  We introduce a family of scalar functionals of the three-dimensional incompressible Navier-Stokes flow, the alignment defects, measuring the failure of the vorticity direction to be coherent, weighted by vorticity magnitude against a kernel more singular than the Biot-Savart kernel by twice the defect order, so that each dominates the vortex-stretching term after one Cauchy-Schwarz split with an integrable partner. We prove a two-parameter continuation theorem: for a partner exponent between two and six and a defect order above the threshold it sets, if a fixed time power of the alignment defect stays integrable on the maximal interval of a strong solution, the solution does not break down; and we prove the theorem at the endpoint the threshold names, where the partner estimate runs in Lorentz spaces and the hypothesis is invariant under the natural scaling. The proofs are complete from five classical inputs, the Constantin-Fefferman geometric depletion bound, Sobolev and Lorentz interpolation, the energy identity, and the enstrophy breakdown alternative, and close by a Gronwall argument whose coefficient is integrable in time, the enstrophy power cancelling to exactly two for every member of the family. Interior members are subcritical with the exponent printed; the endpoint members are critical, and at partner exponent three the endpoint gives a scale-invariant criterion on the time integral of the defect of order one half. The criteria are distinct from the peak-vorticity, critical-norm, and qualitative-coherence criteria by separating examples, and the conditioned form of the hypothesis is provably equivalent to global regularity while the data-uniform form posited here is not. We then take exactly one statement on supply, the effective alignment-defect axiom, a data-uniform locally bounded modulus for the defect, and deduce global existence, uniqueness, and smoothness, so the standard existence-and-smoothness statement holds conditionally on it. The axiom is typed premise grade; its truth is the effectivity gap. The primary falsifiable criterion is parameter-free at fixed exponents: one smooth-data solution with finite maximal time and finite integrated defect power refutes the continuation theorem.
---

```{=latex}
\emergencystretch=1.6em
\sloppy
```

# Background, the Geometry, and What It Does and Does Not Warrant

The system is the incompressible Navier-Stokes flow on $\mathbb{R}^3$,
$$
\begin{aligned}
&\partial_t u + (u\cdot\nabla)u = -\nabla p + \nu\Delta u,\\
&\nabla\cdot u = 0,\qquad u(\cdot,0)=u_0,
\end{aligned}
$$
with $\nu>0$, divergence-free data $u_0\in V_s=\{v\in H^s:\nabla\cdot v=0\}$, $s\ge 3$ an integer, $\omega=\nabla\times u$, and $T_*\le\infty$ the maximal strong-existence time. Global regularity, written GR, is the assertion $T_*=\infty$ for every datum; it is open since Leray \cite{leray1934}, and its obstruction is supercriticality, the one controlled quantity living below the scaling-critical spaces.

The enstrophy balance names the enemy exactly. For a strong solution,
$$
\frac{1}{2}\frac{d}{dt}\|\omega\|_{L^2}^2+\nu\|\nabla\omega\|_{L^2}^2=\int_{\mathbb{R}^3}\omega\cdot(\nabla u)\,\omega\,dx,
$$
the right side the vortex-stretching term, the sole source of possible growth. Constantin and Fefferman \cite{constantinfefferman1993} proved that this term is geometrically depleted where the vorticity direction $\xi=\omega/|\omega|$ varies smoothly: the stretching integrand at a point is controlled by the sine of the angle between the direction there and the direction elsewhere, so Lipschitz coherence of $\xi$ on the high-vorticity set forbids blowup. Their hypothesis is qualitative, an existence-of-scales statement, and as an axiom it is equivalent to GR, which the companion study \cite{anchoring} proves and Section 4.3 recovers. The direction-regularity family has grown around that result, with pointwise Holder-type direction conditions \cite{beiraoberselli2002} and the behaviour of the direction in BMO near type-one singularities \cite{gigamiura2011}, and the functional introduced below is a member of that family, which Section 6 positions exactly.

The problem's geometric register organizes the critical structure: the stretching term is a contraction of the strain against the vorticity direction, a geometric object before it is a norm. That register selects the functional to make effective, the failure of directional coherence weighted against the stretching term; the selection is guidance at premise grade, and the proofs are classical analysis, the lock scalar's orientation-blindness fixing this division of labor (APEX-PSP-ORIENT-01 in the register of record). The geometry names the functional; the analysis carries the proof.

This paper does three things the prior conditional literature does not do together. It defines a family of functionals, the alignment defects, weighted so that each dominates the stretching term after one Cauchy-Schwarz split with an integrable partner. It proves a continuation theorem on that functional, from the base, at every interior member and at the critical endpoint, distinct from the roster and not equivalent to GR as an axiom, with the gap exhibited and the scaling stated. And it closes the theorem to full regularity by a single supplied effective modulus, typed premise grade, delivering the standard statement conditionally. The contribution is the continuation family; the axiom is a disclosed hypothesis.

# Prior Results

The base is classical. Global weak solutions with the energy inequality \cite{leray1934, hopf1951}; local strong theory with the breakdown alternative in its enstrophy form \cite{fujitakato1964, kato1972, majdabertozzi2002}; the commutator estimate \cite{katoponce1988}; weak-strong uniqueness \cite{prodi1959, serrin1963, galdi2000}. The continuation roster the theorem is measured against: peak vorticity \cite{bkm1984}, critical norms \cite{prodi1959, serrin1963, ess2003}, and qualitative direction coherence \cite{constantinfefferman1993}, whose geometric depletion bound is the engine reused here; the direction-regularity family beyond it, pointwise Holder conditions on the direction \cite{beiraoberselli2002} and the BMO-direction analysis at type-one singularities \cite{gigamiura2011}. Partial regularity \cite{ckn1982} bounds the singular set. The endpoint estimate runs in Lorentz spaces, Holder's inequality for them \cite{oneil1963, hunt1966} and their real interpolation \cite{berghlofstrom1976}. The effective research front the axiom's modulus would subsume: the quantitative program \cite{tao2021} and a posteriori certification \cite{ccrt2007}; small critical data are unconditionally global \cite{kochtataru2001}. Axiom-admission practice, the standard for when a posit carries mass, is the set-theoretic one \cite{godel1947, martinsteel1989, simpson2009}, engaged in the companion \cite{anchoring}.

# Method

Deductive assembly under a fixed discipline. The continuation theorems are proved in the body from a closed list of classical inputs, lettered in Section 4.1, with every constant's dependence stated. The geometry enters once, as the sentence selecting the functional. The axiom enters once, at a single line, typed premise grade. Verdicts carry warrant tiers; no unconditional claim on GR is made; the falsification criterion is a finite exhibitable object at fixed exponents.

A result proved on the page from cited theorem-grade inputs is typed theorem-conditional on those inputs, and that is how every proved statement below is typed.

# The Functional, the Continuation Theorem, and the Conditional Proof

## Notation and classical inputs

$\Lambda=(-\Delta)^{1/2}$, $\mathbb{P}$ the Leray projector. Constants $C$ depend at most on $s$ and on the fixed exponent $a$ introduced below, and their dependence on the scale $r$ and on $\nu$ is displayed. On $\{|\omega|>0\}$ write $\xi=\omega/|\omega|$, and for $x,y$ with $\omega(x)\ne0\ne\omega(y)$ set
$$
\sigma(x,y)=|\xi(x)\times\xi(y)|=|\sin\angle(\xi(x),\xi(y))|,
$$
with $\sigma(x,y)=0$ whenever either vorticity vanishes. The lettered inputs, each theorem grade in its source and cited exactly:

**Input A** (energy class \cite{leray1934, hopf1951}). *Global Leray-Hopf solutions exist with $\|u(t)\|_{L^2}^2+2\nu\int_0^t\|\nabla u\|_{L^2}^2\le\|u_0\|_{L^2}^2$; for strong solutions the inequality is an identity, so $\int_0^T\|\omega\|_{L^2}^2\,dt\le\|u_0\|_{L^2}^2/2\nu$.*

**Input B** (local theory and the enstrophy breakdown alternative \cite{fujitakato1964, kato1972, majdabertozzi2002}). *A unique maximal strong solution $u\in C([0,T_*);H^s)$ exists, smooth for $t>0$; if $T_*<\infty$ then $\|\omega(t)\|_{L^2}\to\infty$ as $t\uparrow T_*$, so a bound $\sup_{[0,T_*)}\|\omega\|_{L^2}<\infty$ forces $T_*=\infty$.*

**Input C** (geometric depletion bound \cite{constantinfefferman1993}). *For a smooth divergence-free field with $\omega(x)\ne0$, the stretching factor $\alpha(x)=(S\xi)\cdot\xi\,(x)$, $S=\tfrac12(\nabla u+\nabla u^{\mathsf T})$, satisfies*
$$
|\alpha(x)|\le C_0\int_{\mathbb{R}^3}\frac{\sigma(x,y)\,|\omega(y)|}{|x-y|^{3}}\,dy,
$$
*the integral absolutely convergent for smooth finite-energy fields, and $\omega\cdot(\nabla u)\,\omega=|\omega|^2\alpha$.*

**Input D** (Sobolev and interpolation). *$\|f\|_{L^6}\le C_S\|\nabla f\|_{L^2}$ on $\mathbb{R}^3$, and $\|f\|_{L^3}\le\|f\|_{L^2}^{1/2}\|f\|_{L^6}^{1/2}$.*

**Input D$'$** (Lorentz spaces \cite{oneil1963, hunt1966, berghlofstrom1976}). *For $1<p<\infty$ with $p'=p/(p-1)$, $\int|fg|\le C_O\|f\|_{L^{p,1}}\|g\|_{L^{p',\infty}}$. For $p\in(2,6)$, with $\theta=3/2-3/p\in(0,1)$, $\|f\|_{L^{p,1}}\le C_p\,\|f\|_{L^2}^{1-\theta}\|f\|_{L^6}^{\theta}$, the real-interpolation space $(L^2,L^6)_{\theta,1}$ being $L^{p,1}$. And $\||z|^{-3/p'}\|_{L^{p',\infty}(\mathbb{R}^3)}=(4\pi/3)^{1/p'}$, since $|\{|z|^{-3/p'}>\lambda\}|=(4\pi/3)\lambda^{-p'}$.*

**Input E** (duality admissibility \cite{prodi1959, serrin1963, galdi2000}). *A strong solution of the class of Input B is admissible as a test function in the weak formulation of a Leray-Hopf solution with the same datum.*

## The alignment defect

**Definition 1.** *Fix $a\in(0,1)$. The alignment defect of order $a$ at time $t$ is*
$$
\mathcal{A}_a(t)=\iint_{\mathbb{R}^3\times\mathbb{R}^3}
\frac{\sigma(x,y)^2\,|\omega(x)|\,|\omega(y)|}{|x-y|^{3+2a}}\,dx\,dy .
$$

Three properties fix what the defect is and is not. Along the magnitude-dilation family $\omega_\lambda(x)=\lambda^{(3-2a)/2}\omega_0(\lambda x)$ it is invariant while the peak vorticity diverges and the energy decays, which separates it from the peak-vorticity functional; a finite-energy solenoidal field cannot have constant direction, so no vacuous aligned example is used. Its kernel is $2a$ orders more singular than the depletion kernel of Input C, which is exactly what makes the Cauchy-Schwarz partner in Lemma 2 integrable once $a$ exceeds the threshold the partner exponent sets, and that trade is the whole design. And it is finite for fields whose direction is Lipschitz-coherent where the vorticity is nonzero, since then $\sigma(x,y)\le|x-y|/\rho$ makes the integrand locally of order $|x-y|^{-1-2a}$, integrable on $\mathbb{R}^3$ precisely because $a<1$; finiteness for a general smooth field is not asserted and is part of the hypothesis wherever it is used.

## The continuation theorem

**Lemma 2** (stretching controlled by the defect). *Fix $p\in[2,6]$, $a\in(3/(2p),1)$, and $r>0$. For any strong solution, at each $t$,*
$$
\begin{aligned}
\Big|\int_{\mathbb{R}^3}\omega\cdot(\nabla u)\,\omega\,dx\Big|
\le{}& C_{1}\,r^{\,a-\frac{3}{2p}}\,\|\omega\|_{L^2}^{\frac{p+3}{2p}}\,\|\nabla\omega\|_{L^2}^{\frac{3(p-1)}{2p}}\\
&\qquad\times\mathcal{A}_a(t)^{1/2}\\
&+C_2\,r^{-3/2}\,\|\omega\|_{L^2}^{3},
\end{aligned}
$$
*with $C_1=C_0\,C_S^{3(p-1)/(2p)}\,\kappa_{a,p}^{1/2}$, where $\kappa_{a,p}=\big\||z|^{-3+2a}\big\|_{L^{p'}(|z|<1)}=\big(4\pi/(3-p'(3-2a))\big)^{1/p'}$ with $p'=p/(p-1)$, and $C_2=C_0\,(4\pi/3)^{1/2}$.*

*Proof.* By Input C, the stretching integral is bounded by $C_0(I_{\mathrm{near}}+I_{\mathrm{far}})$ where, splitting at $|x-y|<r$ and $|x-y|\ge r$,
$$
I_{\mathrm{near}}+I_{\mathrm{far}}=\iint\frac{|\omega(x)|^2\,\sigma(x,y)\,|\omega(y)|}{|x-y|^{3}}\,dx\,dy .
$$
Far zone. By Cauchy-Schwarz in $y$,
$$
\begin{aligned}
I_{\mathrm{far}}&\le\int|\omega(x)|^2\Big(\int_{|x-y|\ge r}\frac{|\omega(y)|}{|x-y|^3}dy\Big)dx\\
&\le\|\omega\|_{L^2}^{3}\,\big\||z|^{-3}\big\|_{L^2(|z|\ge r)}\\
&=\Big(\frac{4\pi}{3}\Big)^{1/2}r^{-3/2}\|\omega\|_{L^2}^3 .
\end{aligned}
$$
Near zone. Write the integrand as a product of two factors and apply Cauchy-Schwarz on the pair:
$$
\begin{aligned}
\frac{|\omega(x)|^2\sigma|\omega(y)|}{|x-y|^{3}}
={}&\Big[\frac{|\omega(x)|^{3/2}|\omega(y)|^{1/2}}{|x-y|^{3/2-a}}\Big]\\
&\times\Big[\frac{\sigma\,|\omega(x)|^{1/2}|\omega(y)|^{1/2}}{|x-y|^{3/2+a}}\Big],
\end{aligned}
$$
so that $I_{\mathrm{near}}\le J^{1/2}\mathcal{A}_a(t)^{1/2}$ with, by Holder in $y$ for fixed $x$,
$$
\begin{aligned}
J&=\iint_{|x-y|<r}\frac{|\omega(x)|^3\,|\omega(y)|}{|x-y|^{3-2a}}\,dx\,dy\\
&\le\|\omega\|_{L^3}^3\,\|\omega\|_{L^p}\,\big\||z|^{-3+2a}\big\|_{L^{p'}(|z|<r)},
\end{aligned}
$$
the last norm finite exactly because $p'(3-2a)<3$, which is $a>3/(2p)$, and equal to $\kappa_{a,p}\,r^{\,2a-3/p}$ by scaling. By Input D, $\|\omega\|_{L^3}^3\le C_S^{3/2}\|\omega\|_{L^2}^{3/2}\|\nabla\omega\|_{L^2}^{3/2}$ and, interpolating between $L^2$ and $L^6$ with $\theta=3/p-1/2\in[0,1]$, $\|\omega\|_{L^p}\le C_S^{\,1-\theta}\|\omega\|_{L^2}^{\theta}\|\nabla\omega\|_{L^2}^{1-\theta}$. Collecting the powers, $3/2+\theta=(p+3)/p$ on $\|\omega\|_{L^2}$ and $3/2+1-\theta=3(p-1)/p$ on $\|\nabla\omega\|_{L^2}$, and taking the square root,
$$
\begin{aligned}
I_{\mathrm{near}}\le{}& C_S^{3(p-1)/(2p)}\,\kappa_{a,p}^{1/2}\,r^{\,a-3/(2p)}\\
&\times\|\omega\|_{L^2}^{(p+3)/(2p)}\|\nabla\omega\|_{L^2}^{3(p-1)/(2p)}\,\mathcal{A}_a^{1/2}.
\end{aligned}
$$
Multiplying both zones by $C_0$ gives the display. $\square$

**Corollary 3** (absorbed form). *In the setting of Lemma 2, for every $\varepsilon>0$, with $q=2p/(p+3)$,*
$$
\begin{aligned}
\Big|\int\omega\cdot(\nabla u)\,\omega\,dx\Big|\le{}&\varepsilon\|\nabla\omega\|_{L^2}^2\\
&+C_3\,\varepsilon^{-\frac{3(p-1)}{p+3}}\,r^{\frac{2(2ap-3)}{p+3}}\\
&\qquad\times\mathcal{A}_a(t)^{q}\,\|\omega\|_{L^2}^2\\
&+C_2\,r^{-3/2}\,\|\omega\|_{L^2}^3 ,
\end{aligned}
$$
*with $C_3$ depending only on $C_1$ and $p$.*

*Proof.* Young's inequality on the near term with the conjugate pair $P=4p/(3(p-1))$ and $Q=4p/(p+3)$: $\big(\|\nabla\omega\|_{L^2}^{3(p-1)/(2p)}\big)^{P}=\|\nabla\omega\|_{L^2}^2$, and the complementary factor carries $\big(\|\omega\|_{L^2}^{(p+3)/(2p)}\big)^{Q}=\|\omega\|_{L^2}^{2}$ exactly, $\mathcal{A}_a^{Q/2}=\mathcal{A}_a^{q}$, $r^{(a-3/(2p))Q}=r^{2(2ap-3)/(p+3)}$, and $\varepsilon^{-Q/P}=\varepsilon^{-3(p-1)/(p+3)}$. The exact cancellation of the enstrophy power to two, for every $p$, is what makes the next theorem close. $\square$

**Theorem 4** (the continuation family). *Fix $p\in[2,6]$, $a\in(3/(2p),1)$, and set $q=2p/(p+3)$. Let $u$ be the maximal strong solution. If*
$$
\int_0^{T_*}\mathcal{A}_a(t)^{\,q}\,dt<\infty
$$
*then $T_*=\infty$. In particular, with $p=3$, $q=1$: for every $a\in(1/2,1)$, finiteness of $\int_0^{T_*}\mathcal{A}_a\,dt$ forbids breakdown.*

*Proof.* Take $\varepsilon=\nu/2$ in Corollary 3 and any $r>0$. The enstrophy balance gives, for $t<T_*$,
$$
\begin{aligned}
\frac{d}{dt}\|\omega\|_{L^2}^2&\le K(t)\,\|\omega\|_{L^2}^2,\\
K(t)&=C_4\,\nu^{-\frac{3(p-1)}{p+3}}\,r^{\frac{2(2ap-3)}{p+3}}\,\mathcal{A}_a(t)^{q}\\
&\quad+2C_2\,r^{-3/2}\|\omega(t)\|_{L^2},
\end{aligned}
$$
with $C_4=2\,C_3\,2^{3(p-1)/(p+3)}$. Suppose $T_*<\infty$. By hypothesis $\int_0^{T_*}\mathcal{A}_a^{q}\,dt<\infty$, and by Input A,
$$
\int_0^{T_*}\|\omega\|_{L^2}\,dt\le\Big(\frac{T_*\,\|u_0\|_{L^2}^2}{2\nu}\Big)^{1/2}<\infty,
$$
so $\int_0^{T_*}K\,dt<\infty$ and Gronwall gives $\sup_{[0,T_*)}\|\omega\|_{L^2}^2\le\|\omega(0)\|_{L^2}^2\exp\!\big(\int_0^{T_*}K\big)<\infty$, contradicting the enstrophy breakdown alternative of Input B. Hence $T_*=\infty$. The $p=3$ clause is the case $q=1$. *Warrant: proved from Inputs A through D; theorem-conditional on those inputs.* $\square$

**Lemma 5** (the critical partner). *Fix $p\in(2,6)$ and $a_*=3/(2p)$. For any strong solution, at each $t$,*
$$
\begin{aligned}
\Big|\int_{\mathbb{R}^3}\omega\cdot(\nabla u)\,\omega\,dx\Big|
\le{}& C_1^{*}\,\|\omega\|_{L^2}^{\frac{p+3}{2p}}\,\|\nabla\omega\|_{L^2}^{\frac{3(p-1)}{2p}}\\
&\qquad\times\mathcal{A}_{a_*}(t)^{1/2},
\end{aligned}
$$
*with $C_1^{*}=C_0\,(C_OC_p)^{1/2}\,C_S^{3(p-1)/(2p)}\,(4\pi/3)^{1/(2p')}$, no scale entering.*

*Proof.* By Input C and the same factorization as in Lemma 2, now over all pairs and with $a=a_*$, the stretching integral is at most $C_0\,J_*^{1/2}\mathcal{A}_{a_*}^{1/2}$ with
$$
\begin{aligned}
J_*&=\iint\frac{|\omega(x)|^3\,|\omega(y)|}{|x-y|^{3-2a_*}}\,dx\,dy\\
&=\int|\omega(x)|^3\,\big(|\omega|*|z|^{-3/p'}\big)(x)\,dx,
\end{aligned}
$$
since $3-2a_*=3/p'$. The convolution is bounded at every $x$ by Input D$'$, $\big(|\omega|*|z|^{-3/p'}\big)(x)\le C_O\|\omega\|_{L^{p,1}}(4\pi/3)^{1/p'}$, so $J_*\le C_O(4\pi/3)^{1/p'}\|\omega\|_{L^3}^3\|\omega\|_{L^{p,1}}$. By Input D, $\|\omega\|_{L^3}^3\le C_S^{3/2}\|\omega\|_{L^2}^{3/2}\|\nabla\omega\|_{L^2}^{3/2}$, and by Input D$'$ with $\theta=3/2-3/p$, $\|\omega\|_{L^{p,1}}\le C_pC_S^{\theta}\|\omega\|_{L^2}^{1-\theta}\|\nabla\omega\|_{L^2}^{\theta}$. The powers collect to $(p+3)/p$ on $\|\omega\|_{L^2}$ and $3(p-1)/p$ on $\|\nabla\omega\|_{L^2}$, exactly as in Lemma 2, and the square root gives the display. $\square$

**Theorem 6** (the critical endpoint). *Fix $p\in(2,6)$, $a_*=3/(2p)$, and $q=2p/(p+3)$. If*
$$
\int_0^{T_*}\mathcal{A}_{a_*}(t)^{\,q}\,dt<\infty
$$
*then $T_*=\infty$. The hypothesis functional is invariant under $u_\lambda(x,t)=\lambda u(\lambda x,\lambda^2 t)$. In particular, with $p=3$: if $\int_0^{T_*}\mathcal{A}_{1/2}\,dt<\infty$ then $T_*=\infty$, and $\int\mathcal{A}_{1/2}\,dt$ is scale-invariant.*

*Proof.* Young's inequality on Lemma 5 with the pair $P=4p/(3(p-1))$, $Q=4p/(p+3)$, exactly as in Corollary 3, gives, for $\varepsilon>0$,
$$
\begin{aligned}
\Big|\int\omega\cdot(\nabla u)\,\omega\,dx\Big|\le{}&\varepsilon\|\nabla\omega\|_{L^2}^2\\
&+C_3^{*}\,\varepsilon^{-\frac{3(p-1)}{p+3}}\,\mathcal{A}_{a_*}(t)^{q}\,\|\omega\|_{L^2}^2 ,
\end{aligned}
$$
with $C_3^{*}$ depending on $C_1^{*}$ and $p$; no far term arises because Lemma 5 needs no split. With $\varepsilon=\nu/2$ the enstrophy balance reads $\frac{d}{dt}\|\omega\|_{L^2}^2\le C_4^{*}\nu^{-3(p-1)/(p+3)}\mathcal{A}_{a_*}(t)^{q}\|\omega\|_{L^2}^2$ with $C_4^{*}=2\,C_3^{*}\,2^{3(p-1)/(p+3)}$, and if $T_*<\infty$ the hypothesis makes the coefficient integrable on $[0,T_*)$, Gronwall bounds the enstrophy, and Input B is contradicted; hence $T_*=\infty$. Scale invariance: $\mathcal{A}_{a}\mapsto\lambda^{1+2a}\mathcal{A}_a$ and $dt\mapsto\lambda^{-2}dt$, so the hypothesis functional scales as $\lambda^{q(1+2a_*)-2}=\lambda^{2(2a_*p-3)/(p+3)}=\lambda^{0}$. The $p=3$ clause is $a_*=1/2$, $q=1$. *Warrant: proved from Inputs A, B, C, D, and D$'$; theorem-conditional on those inputs.* $\square$

**Remark 7** (parameters and scaling). The scale $r>0$ in Theorem 4 is a free gauge; $(p,a)$ index the family, one theorem per admissible pair. Under $u_\lambda(x,t)=\lambda u(\lambda x,\lambda^2t)$ the defect transforms as $\mathcal{A}_a\mapsto\lambda^{1+2a}\mathcal{A}_a$ and the hypothesis functional $\int\mathcal{A}_a^{q}\,dt$ as $\lambda^{\,2(2ap-3)/(p+3)}$, the same exponent that multiplies $r$ in $K$, the dimensional consistency of the interior estimate read as a scaling identity. The exponent is positive on the interior of the range and zero at $a=3/(2p)$: interior members are subcritical, and the endpoint members of Theorem 6 are critical, the family reaching its critical member at each $p\in(2,6)$. The interior constants degrade at the threshold, $\kappa_{a,p}$ through $(3-p'(3-2a))^{-1/p'}$, which is why the endpoint requires the Lorentz partner and the strict range $p\in(2,6)$, where the interpolation constant $C_p$ is finite; the coherent-case finiteness of Definition 1 fails as $a\uparrow1$; the factor $\nu^{-3(p-1)/(p+3)}$ forbids any inviscid reading. The largest interior reach is $p=6$, $a>1/4$ with $q=4/3$; the critical $L^1$-in-time member is $p=3$, $a_*=1/2$, $q=1$.

**Proposition 8** (the criteria are not the roster). *For any $a\in(1/4,1)$: finiteness of $\mathcal{A}_a$ does not imply finiteness of $\|\omega\|_{L^\infty}$. For $a\in[1/2,1)$ in addition: finiteness of $\int\|\omega\|_{L^\infty}$ and boundedness of $\|u\|_{L^3}$ do not imply finiteness of $\mathcal{A}_a$, and the qualitative coherence hypothesis neither implies nor is implied by finiteness of $\mathcal{A}_a$. In particular the critical member $\int\mathcal{A}_{1/2}\,dt$ of Theorem 6 is comparable to none of the roster's criteria.*

*Proof.* Let $\omega_0=\nabla\varphi\times e_3$ with $\varphi$ a smooth, radial, compactly supported function: $\omega_0$ is smooth, solenoidal, azimuthal, and vanishes linearly on the $x_3$-axis, so pairs straddling the axis at separation $d$ carry weight $|\omega_0(x)||\omega_0(y)|$ of order $d^2$ against pair measure of order $d^{5}$ per unit length and kernel $d^{-3-2a}$, a per-scale contribution of order $d^{4-2a}$ that sums, and away from the axis the direction is smooth; hence $\mathcal{A}_a(\omega_0)<\infty$ for every $a\in(0,1)$. Set $\omega_\lambda(x)=\lambda^{(3-2a)/2}\omega_0(\lambda x)$, solenoidal and of finite energy. Then $\mathcal{A}_a(\omega_\lambda)=\mathcal{A}_a(\omega_0)$ for every $\lambda$, the exponent $2\cdot\tfrac{3-2a}{2}-3+2a$ vanishing, while $\|\omega_\lambda\|_{L^\infty}=\lambda^{(3-2a)/2}\|\omega_0\|_{L^\infty}\to\infty$; so finiteness of the defect does not bound the peak vorticity, for every $a$. For the converse direction take a bounded field whose direction turns through a fixed angle across a layer of thickness $h$: pairs straddling the layer at separation of order $d\in[h,1]$ have $\sigma$ of order one and pair measure of order $d^{4}$ per unit area, the kernel contributes $d^{-3-2a}$, and summing the dyadic scales gives $\mathcal{A}_a$ of order $h^{\,1-2a}$ for $a\ne1/2$ and of order $\log(1/h)$ at $a=1/2$, which diverges as $h\to0$ exactly when $a\ge1/2$, while $\|\omega\|_{L^\infty}$ and $\|u\|_{L^3}$ stay bounded; for $a<1/2$ the same sum is bounded, the defect tolerating a direction discontinuity across a surface, and the layer example separates nothing, which is why the second clause is scoped. The qualitative coherence hypothesis bounds $\sigma$ by $|x-y|/\rho$ only on a threshold set, leaving below-threshold pairs free, while the defect integrates $\sigma^2$ against magnitude over all pairs; for $a\ge1/2$ the layer example with the turning confined below threshold separates one direction and the dilation family the other. Warrant: the examples are explicit; structural grade. $\square$

**Proposition 9** (the conditioned form is circular, the posited form is not). *Fix an admissible $(p,a)$ with $q=2p/(p+3)$. The sentence, if $T_*<\infty$ then $\int_0^{T_*}\mathcal{A}_a^{\,q}\,dt<\infty$, is provably equivalent to GR over the base and is not what this paper posits. The unconditional data-uniform modulus posited in Section 4.4 is not proved equivalent to GR by any theorem of the roster.*

*Proof.* The conditioned sentence implies GR through Theorem 4 at $(p,a)$ and holds vacuously under GR, hence is equivalent, the companion's tier-one collapse \cite{anchoring}. The unconditional modulus asserts a bound for every solution at every time with a named data dependence, and regularity per solution supplies no uniform modulus, which is exactly the effectivity gap. Warrant: the tier-one leg is a two-line argument; the non-equivalence of the unconditional form is a status report against the roster, structural grade. $\square$

## The effective axiom and the conditional theorem

```{=latex}
\begin{jbox}
\textbf{Axiom EAD, the effective alignment-defect modulus.} Fix $a\in(1/4,1)$.
There is a function $G:(0,\infty)\times[0,\infty)\times[0,\infty)\to[0,\infty)$,
bounded on compact sets, such that for every $\nu>0$ and every $u_0\in V_s$ the
maximal strong solution satisfies, for all $t\in[0,T_*)$,
\[
\mathcal{A}_a(t)\ \le\ G\big(\nu^{-1},\,\|u_0\|_{H^s},\,t\big).
\]
\emph{Typing: premise grade, supplied. Tier-two effective, on a functional new
against the roster this paper cites, coupled to GR by Theorem 4; its converse is
the effectivity gap.}
\end{jbox}
```

**Theorem 10** (main, conditional). *Assume EAD. Then for every $\nu>0$ and $u_0\in V_s$: $T_*=\infty$; $u\in C([0,\infty);H^s)\cap C^\infty((0,\infty)\times\mathbb{R}^3)$ with a smooth pressure closing the system classically; the energy identity holds; and every Leray-Hopf solution with datum $u_0$ coincides with $u$. For Schwartz data the existence-and-smoothness clause of the standard formulation \cite{fefferman2000} holds conditionally on EAD. Warrant: theorem-conditional on EAD and Inputs A through E; the axiom premise grade.*

*Proof.* Since $a>1/4$ there is $p\in[2,6]$ with $3/(2p)<a$; fix it and let $q=2p/(p+3)$. Assume $T_*<\infty$. By EAD, $\int_0^{T_*}\mathcal{A}_a^{\,q}\,dt\le T_*\big(\sup_{r\le T_*}G(\nu^{-1},\|u_0\|_{H^s},r)\big)^{q}<\infty$, the supremum finite because $G$ is bounded on compacts; this is the argument's only use of the axiom. Theorem 4 at $(p,a)$ then gives $T_*=\infty$, a contradiction. Global smoothness, pressure, energy, and uniqueness follow from the global enstrophy bound by the parabolic bootstrap and the weak-strong argument assembled from Inputs A, B, and E exactly as in the companion deduction \cite{anchoring}, Sections 4.8 and 4.9, which are unchanged by the substitution of the continuation criterion. $\square$

**Remark 11a** (the axiom in information form, and what the restatement buys). The uniformity EAD asserts is exactly an independence, and saying so makes the requirement legible where the analytic statement is opaque.

Write $D$ for the datum, ranging over the admissible class, and $G_{\nu,t}$ for the value of the modulus at a fixed $(\nu,t)$. That $G$ depends on $\|u_0\|_{H^s}$ and not otherwise on the datum is the statement that, conditioned on the norm and on $(\nu,t)$, the modulus carries no further information about which datum was drawn:
```{=latex}
\[
I\big(G_{\nu,t}\,;\,D \mid \|u_0\|_{H^s}\big) = 0 .
\]
```
A modulus depending on the datum beyond its norm has strictly positive conditional mutual information there, and is not a modulus in EAD's sense. So EAD is the assertion that a \emph{zero-information dominating readout of the defect exists over the class}, and that phrasing fixes precisely what an attacker must build or forbid: not a counterexample to a particular bound, but a datum family admitting no such readout at all.

Three consequences follow and each is stated at its own grade.

\emph{The type.} EAD is an existence claim about a zero-information readout. Existence claims are not settled by criteria, only by constructions, so the axiom's premise grade is not a hedge about confidence but a statement about the kind of thing it is. Structural.

\emph{One suspicion cleared, and it is worth clearing because the shape invites it.} A readout carrying zero information about a varying quantity cannot \emph{decide} that quantity: if a map is constant on a family across which the answer varies, no function of it recovers the answer. One might therefore suspect that a zero-information modulus is self-defeating. It is not, and the reason is exact: EAD does not claim $G$ decides $\mathcal{A}_a$, it claims $G$ dominates it. Bounding is an order relation and deciding is a functional one, and a constant dominates a varying quantity while carrying no information about it. The obstruction does not apply. Two lines, theorem grade, and it holds at every admissible exponent including the critical one.

\emph{The symmetry, printed because it costs this paper something.} Any forced-breakdown construction whose correction scheme is stratified must supply constants uniform in its stratification index, which is the same claim in the same form: a zero-information dominating readout over a family. This paper's premise and that demand are of one kind and neither is discharged by argument. The requirement stated of others is stated here of ourselves, in the same sentence.

**Remark 11** (where the openness lives). Nothing above touches the truth of EAD. Per-solution smoothness yields, for each datum and each $T$, finiteness of $\sup_{[0,T]}\mathcal{A}_a$ wherever the defect is finite at all, but supplies no function $G$ of the data bounding it uniformly; producing any such modulus is the effectivity gap, the open subject of the quantitative program \cite{tao2021}, and is what the axiom purchases.

# Falsifiable Criteria

**F1, the continuation criterion, at fixed exponents.** Fix $p\in[2,6]$, $a\in[3/(2p),1)$ with $p\in(2,6)$ at the endpoint, and $q=2p/(p+3)$. Prediction: no triple exists consisting of a datum $u_0\in V_s$, its maximal strong solution, and a finite $T_*$, with $\int_0^{T_*}\mathcal{A}_a^{\,q}\,dt<\infty$. Firing event: such a triple constructed and independently verified, refereed or machine-checked. Null hypothesis, exact: one exhibited triple at the fixed $(p,a)$. Necessity: Theorem 4 entails the prediction, forced; at $a=3/(2p)$, Theorem 6. Blast radius: Theorem 4 or Theorem 6 at that $(p,a)$ and Theorem 10's proof route; Proposition 8's separating examples stand regardless.

**F1a, the uniformity criterion, in information form.** Prediction: no admissible datum family exists over which every dominating readout of $\mathcal{A}_a$ carries strictly positive information about the datum beyond its norm, at fixed $(\nu,t)$ and fixed $a\in(1/4,1)$. Firing event: such a family exhibited, with the positivity established rather than asserted. Null hypothesis, exact: one family together with a proof that no conditional-zero-information dominating readout exists on it. Necessity: Remark 11a entails it, since the information form and the analytic form of the axiom are the same statement. Blast radius: EAD and Theorem 10's conclusion; Theorems 4 and 6 stand regardless, as does Proposition 8. This criterion is not an alternative to F1 but a sharper target than it: F1 asks for a counterexample to a bound, and F1a asks for the structural obstruction that would forbid any bound of the required kind.

**F2, the tier criterion.** Prediction: no proof from the base derives EAD from bare GR. Firing event: such a proof, refereed or machine-checked. Necessity: Remark 11 and Proposition 9 entail it, forced. Blast radius: the axiom's tier-two placement; Theorems 4 and 6 survive as unconditional continuation criteria either way.

# Discussion

The paper's contribution is the continuation family, Theorems 4 and 6, on a functional matched to the stretching term rather than to a norm, proved from the base and outside the roster by the separating examples of Proposition 8. Interior members are subcritical with their exponent printed; the endpoint members are critical, and at partner exponent three the criterion is the scale-invariant integral of the defect of order one half, a geometric criterion standing at the critical line where the peak-vorticity criterion stands. The functional is a member of the direction-regularity family, an integrated quadratic form with a supercritical kernel where the family's earlier conditions are pointwise Holder bounds on the direction; it is new against the roster this paper cites.

The axiom EAD is disclosed conditional mathematics of the legitimate kind, and its legitimacy is mechanical: non-circular by Proposition 9, tier-two by grammar, coupled by Theorem 10, posited on the geometry's selection of the functional. The result composes with the research front: any certified defect modulus for a data class converts through Theorem 4 into regularity for that class, so the quantitative and certification programs \cite{tao2021, ccrt2007} are partial constructions of EAD, and small-data theory \cite{kochtataru2001} is its known unconditional fragment.

Objections met. That the defect is engineered to work: it is, and the engineering is the mathematics, the kernel exponent chosen so that the Cauchy-Schwarz partner is integrable is exactly the content of Lemma 2, and at the endpoint the same design run in Lorentz spaces is exactly the content of Lemma 5. That the interior criteria are subcritical: they are, they say so, and the endpoint closes the family at criticality. That the axiom does the work: it does one unit, the uniform modulus, and Theorems 4 and 6 are where the analysis is and stand without it. That the geometry does secret warranting: it selects the functional and is invoked in no proof.

Limitations and fence: no unconditional claim on GR; the consistency of the base plus EAD is tied to the open problem; the geometric provenance is guidance at premise grade.

The positioning closes the discussion under the companion's fixed vocabulary: Kin, continuous with and building on as cited; Additive, supplying a result the position lacked while leaving it standing; Subsuming, the position becoming a case; Scoping, kept inside a stated boundary; Corroborating, independent agreement at zero warrant. Superseding and contradicting are used nowhere.

```{=latex}
\begin{table*}[t]\footnotesize\setlength{\tabcolsep}{4pt}\centering
\begin{tabular}{@{}>{\raggedright\arraybackslash}p{1.30in}>{\raggedright\arraybackslash}p{1.55in}>{\raggedright\arraybackslash}p{2.05in}>{\raggedright\arraybackslash}p{0.72in}>{\raggedright\arraybackslash}p{0.70in}@{}}
\toprule
Prior position & What it holds & What this paper does with it & Relation & Evidence\\
\midrule
Constantin-\allowbreak Fefferman 1993 & directional coherence depletes stretching; qualitative criterion & the depletion bound reused as Input C; an integrated quadratic defect with its own continuation family (Thms 4, 6) & Additive, Subsuming & cited\\
Beirao da Veiga-\allowbreak Berselli 2002 & pointwise Holder-type direction conditions suffice & the defect is the integrated, magnitude-weighted relative of their pointwise class; clearance external & Kin, Scoping & cited\\
Giga-\allowbreak Miura 2011 & direction in BMO constrained at type-one singularities & the family's other critical face; the endpoint criterion (Thm 6) stands beside it & Scoping & cited\\
O'Neil 1963; Hunt 1966 & Holder's inequality in Lorentz spaces & Input D$'$; the endpoint partner (Lemma 5) & Kin & cited\\
Bergh-\allowbreak Lofstrom 1976 & real interpolation of Lorentz spaces & Input D$'$; the interpolation step of Lemma 5 & Kin & cited\\
Beale-\allowbreak Kato-\allowbreak Majda 1984 & peak-vorticity criterion, critical & shown distinct (Prop 8); the endpoint member critical beside it (Thm 6, Rem 7) & Scoping & cited\\
Escauriaza-\allowbreak Seregin-\allowbreak Sverak 2003 & critical-norm criterion & shown distinct (Prop 8) & Scoping & cited\\
Leray 1934; Hopf 1951 & weak solutions, energy inequality & Input A; the time-integrable Gronwall coefficient & Kin & cited\\
Fujita-\allowbreak Kato 1964; Kato 1972 & local theory, enstrophy breakdown & Input B & Kin & cited\\
Kato-\allowbreak Ponce 1988 & commutator estimate & used in the companion bootstrap invoked by Thm 10 & Kin & cited\\
Prodi 1959; Serrin 1963; Galdi 2000 & weak-strong uniqueness & Input E; uniqueness clause of Thm 10 & Kin & cited\\
Caffarelli-\allowbreak Kohn-\allowbreak Nirenberg 1982 & partial regularity & scopes the singular geometry the defect addresses & Scoping & cited\\
Koch-\allowbreak Tataru 2001 & small critical data global & unconditional fragment of the axiom & Subsuming & cited\\
Tao 2021 & quantitative bounds program & read as partial construction of the modulus $G$ & Subsuming, Kin & cited\\
Chernyshenko-\allowbreak Constantin-\allowbreak Robinson-\allowbreak Titi 2007 & a posteriori certification & restricted-data certificates convert through Thms 4 and 6 & Additive & cited\\
Fefferman 2000 & the standard problem & the conditional clause delivered; base untouched & Scoping & documentary\\
Islam 2026 & axiom screen and trichotomy & supplies EAD's adjudication; this paper is a licensed deduction & Kin & cited\\
\bottomrule
\end{tabular}
\caption{Positioning against the prior art, seventeen rows; relation words as defined in the run-in; superseding and contradicting used nowhere.}
\end{table*}
```

# Conclusion

The gap addressed is that the geometric depletion mechanism for Navier-Stokes existed as a qualitative sufficient condition and the effective route to regularity existed as a scatter of named-target bounds, with no continuation theorem on an integrated geometric functional matched to the stretching term. This paper supplies that theorem as a family, Theorems 4 and 6 on the alignment defect of Definition 1, proved from five classical inputs, every interior member subcritical and every endpoint member critical, the scale-invariant $\int\mathcal{A}_{1/2}\,dt$ the flagship, distinct from the roster, and closes the family to full regularity with a single supplied effective modulus typed premise grade. The geometry names the functional; the analysis carries the proof.

The primary falsifiable criterion is F1 at fixed exponents: one smooth-data solution with finite maximal time and finite integrated defect power, exhibited, refutes the continuation theorem at that pair.

The single open question is the axiom: whether a data-uniform defect modulus is a theorem of the base, the effectivity gap. Along this route the three-dimensional Navier-Stokes problem is the sentence EAD.

# Appendix: Author's Provenance and Method Disclosure {-}

This paper was developed under Trisduction, a verification and organizing discipline that adds the cited results no warrant; the method and its executable batteries are stated in full at the reference below.

```{=latex}
\begin{thebibliography}{99}
\bibitem{leray1934} Leray, J. 1934. Sur le mouvement d'un liquide visqueux emplissant l'espace. \emph{Acta Mathematica} 63, 193--248.
\bibitem{hopf1951} Hopf, E. 1951. Uber die Anfangswertaufgabe fur die hydrodynamischen Grundgleichungen. \emph{Mathematische Nachrichten} 4, 213--231.
\bibitem{fujitakato1964} Fujita, H., and T. Kato. 1964. On the Navier-Stokes initial value problem. I. \emph{Archive for Rational Mechanics and Analysis} 16, 269--315.
\bibitem{kato1972} Kato, T. 1972. Nonstationary flows of viscous and ideal fluids in $\mathbb{R}^3$. \emph{Journal of Functional Analysis} 9, 296--305.
\bibitem{majdabertozzi2002} Majda, A. J., and A. L. Bertozzi. 2002. \emph{Vorticity and Incompressible Flow}. Cambridge: Cambridge University Press.
\bibitem{katoponce1988} Kato, T., and G. Ponce. 1988. Commutator estimates and the Euler and Navier-Stokes equations. \emph{Communications on Pure and Applied Mathematics} 41, 891--907.
\bibitem{bkm1984} Beale, J. T., T. Kato, and A. Majda. 1984. Remarks on the breakdown of smooth solutions for the 3-D Euler equations. \emph{Communications in Mathematical Physics} 94, 61--66.
\bibitem{constantinfefferman1993} Constantin, P., and C. Fefferman. 1993. Direction of vorticity and the problem of global regularity for the Navier-Stokes equations. \emph{Indiana University Mathematics Journal} 42, 775--789.
\bibitem{beiraoberselli2002} Beirao da Veiga, H., and L. C. Berselli. 2002. On the regularizing effect of the vorticity direction in incompressible viscous flows. \emph{Differential and Integral Equations} 15, 345--356.
\bibitem{oneil1963} O'Neil, R. 1963. Convolution operators and $L(p,q)$ spaces. \emph{Duke Mathematical Journal} 30, 129--142.
\bibitem{hunt1966} Hunt, R. A. 1966. On $L(p,q)$ spaces. \emph{L'Enseignement Mathematique} 12, 249--276.
\bibitem{berghlofstrom1976} Bergh, J., and J. Lofstrom. 1976. \emph{Interpolation Spaces: An Introduction}. Berlin: Springer.
\bibitem{gigamiura2011} Giga, Y., and H. Miura. 2011. On vorticity directions near singularities for the Navier-Stokes flows with infinite energy. \emph{Communications in Mathematical Physics} 303, 289--300.
\bibitem{prodi1959} Prodi, G. 1959. Un teorema di unicita per le equazioni di Navier-Stokes. \emph{Annali di Matematica Pura ed Applicata} 48, 173--182.
\bibitem{serrin1963} Serrin, J. 1963. The initial value problem for the Navier-Stokes equations. In \emph{Nonlinear Problems}, ed. R. E. Langer, 69--98. Madison: University of Wisconsin Press.
\bibitem{galdi2000} Galdi, G. P. 2000. An introduction to the Navier-Stokes initial-boundary value problem. In \emph{Fundamental Directions in Mathematical Fluid Mechanics}, 1--70. Basel: Birkhauser.
\bibitem{ess2003} Escauriaza, L., G. Seregin, and V. Sverak. 2003. $L_{3,\infty}$-solutions of Navier-Stokes equations and backward uniqueness. \emph{Russian Mathematical Surveys} 58, 211--250.
\bibitem{ckn1982} Caffarelli, L., R. Kohn, and L. Nirenberg. 1982. Partial regularity of suitable weak solutions of the Navier-Stokes equations. \emph{Communications on Pure and Applied Mathematics} 35, 771--831.
\bibitem{kochtataru2001} Koch, H., and D. Tataru. 2001. Well-posedness for the Navier-Stokes equations. \emph{Advances in Mathematics} 157, 22--35.
\bibitem{tao2021} Tao, T. 2021. Quantitative bounds for critically bounded solutions to the Navier-Stokes equations. In \emph{Nine Mathematical Challenges: An Elucidation}, Proceedings of Symposia in Pure Mathematics 104, 149--193. Providence: American Mathematical Society.
\bibitem{ccrt2007} Chernyshenko, S. I., P. Constantin, J. C. Robinson, and E. S. Titi. 2007. A posteriori regularity of the three-dimensional Navier-Stokes equations from numerical computations. \emph{Journal of Mathematical Physics} 48, 065204.
\bibitem{fefferman2000} Fefferman, C. L. 2000. Existence and smoothness of the Navier-Stokes equation. Clay Mathematics Institute Millennium Prize Problem description. Cambridge, MA: Clay Mathematics Institute.
\bibitem{godel1947} Godel, K. 1947. What is Cantor's continuum problem? \emph{American Mathematical Monthly} 54, 515--525.
\bibitem{martinsteel1989} Martin, D. A., and J. R. Steel. 1989. A proof of projective determinacy. \emph{Journal of the American Mathematical Society} 2, 71--125.
\bibitem{simpson2009} Simpson, S. G. 2009. \emph{Subsystems of Second Order Arithmetic}. 2nd ed. Cambridge: Cambridge University Press.
\bibitem{anchoring} Islam, M. F. 2026. Anchoring Axioms for Three-Dimensional Navier-Stokes Regularity: A Gated Cascade for Supplier-Side Axiom Formulation. Manuscript, September 8, 2026.
\bibitem{trisduction} Islam, M. TRISDUCTION: A Linguistically, Topologically, and Mathematically Sealed Verification Architecture. Triaxial Orthogonality, Twelve-Gate Closure, the Quaternionic Completion, the Root Axiom, and the Master Pre-Sealed Proposition Ledger. Zenodo, version 4, 19 June 2026. DOI 10.5281/zenodo.20757507. https://zenodo.org/records/20757507. Mirror: PhilArchive record ISLTTG, https://philpapers.org/rec/ISLTTG. Master reference, continuously updated at the same location.
\end{thebibliography}
```
