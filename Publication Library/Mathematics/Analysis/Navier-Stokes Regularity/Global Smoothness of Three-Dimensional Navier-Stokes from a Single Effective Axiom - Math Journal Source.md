---
edition: math_journal
title: "Global Smoothness of the Three-Dimensional Navier-Stokes Equations from a Single Effective Axiom: The Complete Conditional Proof"
subtitle: "A Trisductive deduction: the anchoring axiom supplier-side at premise grade, every remaining step proved from the classical base"
article_type: "Mathematical Analysis · Conditional Theorem"
goal: "One axiom in, global smoothness out, with the whole chain on the page."
author_line: "Mohammad F. Islam, PhD"
affiliation: "Independent Researcher · The Trisduction Program"
date: "September 8, 2026"
short_title: "Effective Axiom and Navier-Stokes"
keywords: "Navier-Stokes equations; global regularity; conditional theorem; effective bounds; Beale-Kato-Majda; Osgood lemma; weak-strong uniqueness; Trisduction"
abstract: |
  The regularity problem for the three-dimensional incompressible Navier-Stokes equations remains open because no known argument bounds any continuation functional uniformly in the data. This paper takes exactly one statement on supply, the effective bound axiom EBA, asserting a data-uniform, locally bounded modulus for the velocity gradient supremum on the maximal interval of the strong solution, and deduces from it the full conclusion: global existence, uniqueness, spatial and temporal smoothness, the energy identity, smooth pressure, and coincidence with every Leray-Hopf weak solution, so that the existence-and-smoothness statement of the standard problem formulation holds conditionally. The axiom enters once, at a single line of the argument; everything else is proved on the page from the classical base, with the local theory established by a mollification scheme, the logarithmic gradient inequality proved by an elementary three-zone kernel estimate requiring no Littlewood-Paley theory, the double-logarithmic Osgood closure and the vorticity continuation theorem derived in full, parabolic bootstrap carried by two one-line Plancherel smoothing bounds, and weak-strong uniqueness proved by the Gronwall argument. The conditional theorem carries an explicit double-exponential growth bound in terms of the axiom's modulus. The primary falsifiable criterion is parameter-free: one exhibited smooth-data solution with finite maximal time and finite time-integrated peak vorticity refutes the chain. The paper claims nothing about the unconditional problem: the axiom is typed as a premise throughout, its truth is precisely the effectivity gap the companion method study isolates, and the authored-mass ledger of the present paper is zero by its own accounting, the contribution being the complete, self-contained arrangement of the deduction.
---

```{=latex}
\emergencystretch=1.6em
\sloppy
```

# Background and the Barrier

The system is the incompressible Navier-Stokes flow on $\mathbb{R}^3$ with viscosity $\nu>0$ and no external force,
$$
\begin{aligned}
&\partial_t u + (u\cdot\nabla)u = -\nabla p + \nu\Delta u,\\
&\nabla\cdot u = 0,\qquad u(\cdot,0)=u_0,
\end{aligned}
$$
posed for divergence-free data in the Sobolev class $H^s(\mathbb{R}^3)$ with $s\ge 3$ an integer, a class containing the Schwartz data of the standard problem statement \cite{fefferman2000}. We write $\omega=\nabla\times u$ for the vorticity and $T_*\le\infty$ for the maximal time of the strong solution. The question, open since \cite{leray1934}, is whether $T_*=\infty$ always.

The obstruction has a fixed shape. Under the scaling $u_\lambda(x,t)=\lambda u(\lambda x,\lambda^2t)$ the globally controlled energy shrinks, so the problem is supercritical, and every proved route to regularity is conditional: the solution continues as long as some functional of the flow stays finite, the time integral of the peak vorticity \cite{bkm1984}, a scale-invariant integrability norm \cite{prodi1959, serrin1963, ess2003}, and their relatives. What no theorem supplies is a bound on any such functional that is uniform in the data. That missing uniformity is the entire distance between the conditional literature and the unconditional problem.

A companion method study \cite{anchoring} examined the temptation this situation creates, the injection of an axiom asserting the missing bound, and proved a trichotomy over the classical base: every qualitative axiom built on a proved continuation criterion, in particular every axiom conditioned on finite-time breakdown, is provably equivalent to the conclusion it was meant to deliver, hence circular; only a data-uniform effective form escapes, implying regularity while not being provably implied by it through any known theorem; and physically rendered axioms about positive-microscale flows transfer nothing without a uniformity input of the same effective type. The screen that adjudicates candidates, and the account of when axiom formulation carries authored mathematical mass, are given there and are not repeated here.

The present paper is the deduction that study licenses. It takes the surviving effective candidate as its single supplied premise, the effective bound axiom EBA stated in Section 4, and proves everything else. The division of labor is stated exactly and kept: the axiom carries the one bound analysis has not produced, and the paper carries, on the page, the complete classical chain from that bound to global smoothness, uniqueness, and the conditional form of the standard existence-and-smoothness statement.

Self-containment is enforced with one two-line exception noted now, so the reader can audit the circularity question without the companion. An axiom of the form, if $T_*<\infty$ then the vorticity integral is finite, is equivalent to global regularity over the base: it implies regularity through the continuation theorem proved below, and regularity makes its antecedent false, so it holds vacuously. The axiom used here has the opposite grammar, an unconditional, data-uniform modulus, and no theorem of the roster reverses it; its status is open, which is precisely why it is an axiom and not a lemma, and why the theorem below is conditional and says so in its name.

The mathematical content of the paper is therefore the chain itself, assembled to be checkable line by line: local well-posedness with the breakdown alternative proved by a mollification scheme; the logarithmic gradient inequality proved by an elementary three-zone estimate on the Biot-Savart kernel, with no Littlewood-Paley machinery; the a priori Sobolev estimate by the commutator inequality; the double-logarithmic Osgood closure; the vorticity continuation theorem; the single application of the axiom; parabolic bootstrap to spatial and temporal smoothness by two one-line Plancherel smoothing bounds; the energy identity; smooth pressure by the Riesz formula; and weak-strong uniqueness closing the Leray-Hopf class onto the strong solution.

Provenance is disclosed once and typed. The axiom descends, through the screening cascade of \cite{anchoring}, from the root actuation postulate of a broader verification framework, Trisduction, under which the gradient supremum reads as the flow's peak actuation rate and the axiom as a physical floor on it; within this paper that reading is a motivation at premise grade, contributes no warrant to any step, and the framework adds the cited results nothing.

The honest boundary is the same as everywhere in mathematics, here made local and priced: the theorem is conditional on a named posit, the posit is unproven, and no claim is made on the standard problem \cite{fefferman2000}, whose ambient base this paper does not touch. What the paper adds to the conditional literature is completeness of assembly: a reader granting one displayed sentence receives the entire conclusion with proofs, not pointers.

# Prior Results

The classical base is fixed by the following bodies of work, engaged throughout. Global weak solutions with the energy inequality are due to Leray on $\mathbb{R}^3$ \cite{leray1934} and Hopf on domains \cite{hopf1951}. Local strong well-posedness descends from Fujita and Kato \cite{fujitakato1964} and Kato \cite{kato1972}; the mollification scheme used in Section 4.3 follows the textbook development of Majda and Bertozzi \cite{majdabertozzi2002}, which the proof cites for two routine functional-analytic passages named there. The commutator estimate is Kato and Ponce's \cite{katoponce1988}. The vorticity continuation criterion originates with Beale, Kato, and Majda \cite{bkm1984}; Section 4.4 proves the underlying logarithmic inequality by a kernel argument in the spirit of their original, self-contained here. Weak-strong uniqueness in the Leray-Hopf class goes back to Prodi \cite{prodi1959} and Serrin \cite{serrin1963}, with the modern justification of the duality pairing as in Galdi \cite{galdi2000}. The critical-norm criterion of Escauriaza, Seregin, and Sverak \cite{ess2003} is engaged in Section 1 as part of the roster the companion classifies. Small critical data are global \cite{kochtataru2001}, which calibrates what the axiom does not need to assert. On the effective side, the quantitative program of Tao \cite{tao2021} pursues explicit bounds under critical-norm hypotheses, and the a posteriori certification program of Chernyshenko, Constantin, Robinson, and Titi \cite{ccrt2007} certifies regularity computationally for specific data; both are engaged in the Discussion as the unconditional research front the axiom's modulus would subsume.

# Method

The method is deductive assembly under a fixed citation discipline. Every load-bearing estimate is proved in the body. Exactly five classical inputs are consumed by citation with exact statements, lettered A through E in Section 4.1: the Leray energy class, the commutator estimate, the Biot-Savart representation of the velocity gradient, the Morrey embedding, and the admissibility of the strong solution as a test function in the weak formulation. Each is theorem grade in its source, and the list is closed: no other external fact enters. The axiom enters once, in the proof of Theorem 1 part one, at a line flagged in the margin of the argument by name.

Verdict discipline travels with the statements. The main theorem is typed as theorem grade conditional on EBA and the lettered inputs; the axiom itself is typed premise grade with open status; no unconditional sentence about the regularity problem appears in the paper; and the falsification criteria of Section 5 are stated so that a refutation is a finite exhibitable object verifiable by independent parties, refereed or machine-checked.

# The Axiom and the Complete Chain

## Notation and the lettered inputs

$H^\sigma$ denotes the inhomogeneous Sobolev space on $\mathbb{R}^3$, $\Lambda=(-\Delta)^{1/2}$, and $V_s=\{v\in H^s:\nabla\cdot v=0\}$ with $s\ge 3$ integer fixed. $\mathbb{P}$ is the Leray projector, the Fourier multiplier $I-\xi\xi^{\mathsf T}/|\xi|^2$, bounded on every $H^\sigma$. Constants $C$ depend at most on $s$ and change line to line. $J_\varepsilon$ is a standard radial Friedrichs mollifier; by Plancherel, $\|(I-J_\varepsilon)v\|_{L^2}\le C\varepsilon\|v\|_{H^1}$ and $\|J_\varepsilon v\|_{H^{\sigma+1}}\le C\varepsilon^{-1}\|v\|_{H^\sigma}$.

**Input A** (energy class \cite{leray1934, hopf1951}). *For $u_0\in L^2$ divergence-free there exists a global Leray-Hopf weak solution, $u\in L^\infty(0,\infty;L^2)\cap L^2(0,\infty;\dot H^1)$, weakly continuous into $L^2$, satisfying for all $t$*
$$
\|u(t)\|_{L^2}^2+2\nu\int_0^t\|\nabla u\|_{L^2}^2\,d\tau\le\|u_0\|_{L^2}^2 .
$$

**Input B** (commutator estimate \cite{katoponce1988}). *For $\sigma>0$,*
$$
\begin{aligned}
\|\Lambda^\sigma(fg)-f\,\Lambda^\sigma g\|_{L^2}\le C\big(&\|\nabla f\|_{L^\infty}\|\Lambda^{\sigma-1}g\|_{L^2}\\
&+\|\Lambda^\sigma f\|_{L^2}\|g\|_{L^\infty}\big).
\end{aligned}
$$

**Input C** (gradient representation \cite{majdabertozzi2002}). *For $u\in V_s$ with vorticity $\omega$,*
$$
u(x)=-\frac{1}{4\pi}\int_{\mathbb{R}^3}\frac{x-y}{|x-y|^3}\times\omega(y)\,dy,
$$
*and there is a matrix kernel $M$, smooth away from the origin, homogeneous of degree $-3$, with zero average on spheres about the origin, and a constant matrix $c_0$, such that*
$$
\nabla u(x)=c_0\,\omega(x)+\mathrm{p.v.}\!\int_{\mathbb{R}^3}M(x-y)\,\omega(y)\,dy .
$$

**Input D** (Morrey embedding). *$H^2(\mathbb{R}^3)\hookrightarrow C^{0,1/2}(\mathbb{R}^3)$, so $[\,\omega\,]_{C^{1/2}}\le C\|\omega\|_{H^2}\le C\|u\|_{H^3}$.*

**Input E** (duality admissibility \cite{prodi1959, serrin1963, galdi2000}). *A strong solution on $[0,T]$ of the regularity class of Theorem 2 may be used as a test function in the weak formulation of a Leray-Hopf solution with the same datum, yielding the identity displayed in the proof of Theorem 8.*

## The axiom, its typing, and the main theorem

```{=latex}
\begin{jbox}
\textbf{Axiom EBA, the effective bound axiom.} There exists a function
$F:(0,\infty)\times[0,\infty)\times[0,\infty)\to[0,\infty)$, bounded on
compact sets, such that for every $\nu>0$ and every $u_0\in V_s$ the maximal
strong solution satisfies
\[
\|\nabla u(t)\|_{L^\infty}\ \le\ F\big(\nu^{-1},\,\|u_0\|_{H^s},\,t\big)
\qquad\text{for all }t\in[0,T_*).
\]
\emph{Typing: premise grade, supplied, status open. Adjudication: admitted at
the effective tier of the companion screen, implying regularity below and not
provably implied by it through any theorem of the classical roster; the
converse status is exactly the effectivity gap. Provenance: the framework's
actuation floor, rendered data-uniform; the reading motivates and warrants
nothing.}
\end{jbox}
```

**Theorem 1** (main, conditional). *Assume EBA. Then for every $\nu>0$ and every $u_0\in V_s$: (i) $T_*=\infty$, and for every $T$ the solution obeys the explicit bound of Corollary 9; (ii) $u\in C([0,\infty);H^s)\cap C^\infty\big((0,\infty)\times\mathbb{R}^3\big)$, and a pressure $p$, smooth on $(0,\infty)\times\mathbb{R}^3$ and unique up to a function of time, makes the pair a classical solution for $t>0$; (iii) the energy identity holds for all $t$; (iv) every Leray-Hopf weak solution with datum $u_0$ coincides with $u$ on $[0,\infty)$. In particular, for Schwartz data the existence-and-smoothness clause of the standard formulation \cite{fefferman2000} holds conditionally on EBA. Warrant: theorem grade conditional on EBA and Inputs A through E; the axiom premise grade.*

The proof occupies the rest of the section: local theory in 4.3, the logarithmic inequality in 4.4, the Sobolev estimate and Osgood closure in 4.5, continuation in 4.6, the single application of the axiom with the global bound in 4.7, smoothness, pressure, and energy in 4.8, and weak-strong uniqueness with the concluding assembly in 4.9.

## Local theory, proved

**Theorem 2** (local well-posedness and the breakdown alternative). *For $u_0\in V_s$ there exist $T_0\ge c_s\,(1+\|u_0\|_{H^s})^{-1}$ and a unique solution $u\in C([0,T_0];H^s)$, with $\partial_t u\in C([0,T_0];H^{s-2})$, of the projected equation $\partial_t u+\mathbb{P}\,(u\cdot\nabla)u=\nu\Delta u$. The solution extends to a maximal interval $[0,T_*)$, and if $T_*<\infty$ then $\lim_{t\uparrow T_*}\|u(t)\|_{H^s}=\infty$. Moreover $\sup_{[0,T]}\|u\|_{H^s}<\infty$ for $T<T_*$, and any bound of that supremum as $T\uparrow T_*<\infty$ contradicts maximality.*

*Proof.* Step 1, the mollified system. Consider on $H^s$ the equation
$$
\begin{aligned}
\partial_t u^\varepsilon=&-\mathbb{P}J_\varepsilon\big[(J_\varepsilon u^\varepsilon\cdot\nabla)J_\varepsilon u^\varepsilon\big]\\
&+\nu\,J_\varepsilon^2\Delta u^\varepsilon,\qquad u^\varepsilon(0)=u_0 .
\end{aligned}
$$
Each term is a bounded, locally Lipschitz map of $H^s$ to itself, by the mollifier bounds of 4.1 and the algebra property of $H^s$, $s>3/2$; Picard iteration gives a unique maximal $H^s$ solution, and divergence-freeness is preserved since $\mathbb{P}$ commutes with the flow.

Step 2, the uniform bound. Apply $\Lambda^\sigma$, $\sigma\in\{0,s\}$, pair with $\Lambda^\sigma u^\varepsilon$, and use that $J_\varepsilon$ is self-adjoint and commutes with $\Lambda^\sigma$ and $\mathbb{P}$; the transport part of the mollified nonlinearity pairs to zero exactly as in Proposition 4 below, and Input B applied to the commutator gives, with $y_\varepsilon=e+\|u^\varepsilon\|_{H^s}^2$,
$$
y_\varepsilon'\le C\|\nabla J_\varepsilon u^\varepsilon\|_{L^\infty}\,y_\varepsilon\le C_0\,y_\varepsilon^{3/2},
$$
the second step by Sobolev embedding, $\|\nabla v\|_{L^\infty}\le C\|v\|_{H^s}$. Integrating the Riccati inequality,
$$
y_\varepsilon(t)\le\frac{y_\varepsilon(0)}{\big(1-\tfrac12 C_0\,t\,y_\varepsilon(0)^{1/2}\big)^{2}},
$$
valid while the denominator is positive; hence all $u^\varepsilon$ exist and are bounded in $C([0,T_0];H^s)$ uniformly in $\varepsilon$, with $T_0=c_s(1+\|u_0\|_{H^s})^{-1}$, and by the equation $\partial_t u^\varepsilon$ is bounded in $C([0,T_0];H^{s-2})$.

Step 3, contraction of the family. With $\delta=u^\varepsilon-u^{\varepsilon'}$, pairing the difference of the equations with $\delta$ in $L^2$, estimating the nonlinear differences by the uniform $H^s$ bound and the mollifier error $\|(I-J_\varepsilon)v\|_{L^2}\le C\varepsilon\|v\|_{H^1}$, one obtains
$$
\frac{d}{dt}\|\delta\|_{L^2}\le C\big(\|\delta\|_{L^2}+\varepsilon+\varepsilon'\big),
$$
with $C$ depending on the Step 2 bound; Gronwall makes $(u^\varepsilon)$ Cauchy in $C([0,T_0];L^2)$, hence by interpolation with the uniform $H^s$ bound Cauchy in $C([0,T_0];H^{\sigma})$ for every $\sigma<s$. The limit $u$ lies in $C([0,T_0];H^{\sigma})\cap L^\infty(0,T_0;H^s)\cap \mathrm{Lip}([0,T_0];H^{s-2})$ and solves the projected equation in $H^{s-2}$.

Step 4, continuity in $H^s$ and uniqueness. Weak continuity of $t\mapsto u(t)$ into $H^s$ follows from the class just named, and strong right-continuity at $t=0$ from the Step 2 bound, which gives $\limsup_{t\downarrow0}\|u(t)\|_{H^s}\le\|u_0\|_{H^s}$, together with weak lower semicontinuity; continuity at interior times follows by uniqueness and restart from $u(t_1)$. These two passages, weak continuity from the regularity class and the restart bookkeeping, are the routine steps cited to \cite{majdabertozzi2002}, Chapter 3, whose argument is followed verbatim. Uniqueness: for two solutions with the same datum, the $L^2$ difference obeys $\frac{d}{dt}\|\delta\|_{L^2}^2\le C\|\nabla u\|_{L^\infty}\|\delta\|_{L^2}^2$ by the same pairing as in Step 3 with $\varepsilon=\varepsilon'=0$, and Gronwall gives $\delta\equiv0$.

Step 5, the alternative. Define $T_*$ as the supremum of times to which the solution extends in $C([0,\cdot];H^s)$. If $T_*<\infty$ and some sequence $t_n\uparrow T_*$ carried $\|u(t_n)\|_{H^s}\le M$, the local time from Step 2, bounded below by $c_s(1+M)^{-1}$ uniformly, would extend the solution past $T_*$ for large $n$, a contradiction; hence $\|u(t)\|_{H^s}\to\infty$. The final clause is the same restart read forward. $\square$

## The logarithmic gradient inequality, proved

**Lemma 3.** *There is $C=C(s)$ such that every $u\in V_s$ satisfies*
$$
\|\nabla u\|_{L^\infty}\le C\Big(1+\|\omega\|_{L^2}+\|\omega\|_{L^\infty}\log\big(e+\|u\|_{H^s}\big)\Big).
$$

*Proof.* Fix $x$ and split the principal-value integral of Input C at radii $\delta\in(0,1]$ and $1$. Far zone, $|z|>1$: by Cauchy-Schwarz and homogeneity,
$$
\begin{aligned}
\Big|\int_{|z|>1}&M(z)\,\omega(x-z)\,dz\Big|\\
&\le\|M\|_{L^2(|z|>1)}\,\|\omega\|_{L^2}\le C\,\|\omega\|_{L^2}.
\end{aligned}
$$
Middle zone, $\delta\le|z|\le1$: by $|M(z)|\le C|z|^{-3}$,
$$
\begin{aligned}
\Big|\int_{\delta\le|z|\le1}&M(z)\,\omega(x-z)\,dz\Big|\\
&\le C\,\|\omega\|_{L^\infty}\,\log(1/\delta).
\end{aligned}
$$
Near zone, $|z|<\delta$: the spherical mean of $M$ vanishes, so $\omega(x-z)$ may be replaced by $\omega(x-z)-\omega(x)$, and by Input D,
$$
\begin{aligned}
\Big|\int_{|z|<\delta}&M(z)\big(\omega(x-z)-\omega(x)\big)\,dz\Big|\\
&\le C\,[\omega]_{C^{1/2}}\int_{|z|<\delta}|z|^{-5/2}\,dz
\le C\,\delta^{1/2}\|u\|_{H^s}.
\end{aligned}
$$
Choose $\delta=\min\{1,(e+\|u\|_{H^s})^{-2}\}$; then $\delta^{1/2}\|u\|_{H^s}\le1$ and $\log(1/\delta)\le2\log(e+\|u\|_{H^s})$. Adding the local term $|c_0\,\omega(x)|\le C\|\omega\|_{L^\infty}$ completes the bound. $\square$

## The Sobolev estimate and the Osgood closure, proved

**Proposition 4** (a priori estimate). *For the strong solution of Theorem 2 on $[0,T]\subset[0,T_*)$, with $X=\|u\|_{L^2}^2+\|\Lambda^s u\|_{L^2}^2$,*
$$
\frac{d}{dt}X\le C\,\|\nabla u\|_{L^\infty}\,X .
$$

*Proof.* Apply $\Lambda^s$ to the projected equation and pair with $\Lambda^s u$:
$$
\begin{aligned}
\tfrac12\tfrac{d}{dt}\|\Lambda^s u\|_{L^2}^2&+\nu\|\nabla\Lambda^s u\|_{L^2}^2\\
&=-\langle\Lambda^s\mathbb{P}(u\cdot\nabla u),\Lambda^s u\rangle .
\end{aligned}
$$
Since $\Lambda^s u$ is divergence free, $\mathbb{P}$ may be dropped from the pairing. Write $\Lambda^s(u\cdot\nabla u)=u\cdot\nabla\Lambda^s u+[\Lambda^s,u\cdot\nabla]u$; the transport term pairs to zero, $\langle u\cdot\nabla v,v\rangle=-\tfrac12\int(\nabla\cdot u)|v|^2=0$ with $v=\Lambda^su$, and the commutator is bounded by Input B with $f=u_j$, $g=\partial_ju$:
$$
\begin{aligned}
\|[\Lambda^s,u\cdot\nabla]u\|_{L^2}
&\le C\,\|\nabla u\|_{L^\infty}\|\Lambda^{s-1}\nabla u\|_{L^2}\\
&\quad+C\,\|\Lambda^s u\|_{L^2}\|\nabla u\|_{L^\infty}\\
&\le C\,\|\nabla u\|_{L^\infty}\|\Lambda^s u\|_{L^2},
\end{aligned}
$$
because $\partial_j\Lambda^{-1}$ has $L^2$ multiplier norm one. The order-zero pairing gives $\tfrac12\frac{d}{dt}\|u\|_{L^2}^2+\nu\|\nabla u\|_{L^2}^2=0$. Add, apply Cauchy-Schwarz, and drop the viscous terms. $\square$

**Proposition 5** (Osgood closure). *Let $y=e+X$. For $T<T_*$,*
$$
\begin{aligned}
\log\log y(T)\le{}& \log\log y(0)\\
&+C\Big(T+\int_0^T\|\omega\|_{L^2}\,dt\\
&\qquad+\int_0^T\|\omega\|_{L^\infty}\,dt\Big),
\end{aligned}
$$
*and*
$$
\int_0^T\|\omega\|_{L^2}\,dt\le\big(T\,\|u_0\|_{L^2}^2/2\nu\big)^{1/2}.
$$
*Consequently $\sup_{[0,T]}\|u\|_{H^s}$ is finite whenever $\int_0^T\|\omega\|_{L^\infty}\,dt$ is.*

*Proof.* Lemma 3 with $\|u\|_{H^s}\le y^{1/2}$ and $\log y\ge1$ gives $\|\nabla u\|_{L^\infty}\le C(1+\|\omega\|_{L^2}+\|\omega\|_{L^\infty})\log y$; Proposition 4 then reads $(\log\log y)'\le C(1+\|\omega\|_{L^2}+\|\omega\|_{L^\infty})$; integrate. For the vorticity energy, $\|\omega\|_{L^2}=\|\nabla u\|_{L^2}$ for divergence-free fields by Plancherel, the order-zero identity in the proof of Proposition 4 integrates to the energy identity on $[0,T]$, and Cauchy-Schwarz in time gives the display. $\square$

## Continuation, proved

**Theorem 6** (vorticity continuation). *If $T_*<\infty$ then $\int_0^{T_*}\|\omega(t)\|_{L^\infty}\,dt=\infty$.*

*Proof.* Were the integral finite, Proposition 5 would bound $\|u\|_{H^s}$ on $[0,T_*)$, contradicting the breakdown alternative of Theorem 2. $\square$

This re-derives, in the viscous setting and from the inputs above, the criterion of \cite{bkm1984}.

## The axiom applied, once

*Proof of Theorem 1, part (i).* Suppose $T_*<\infty$ for some $\nu, u_0$. By EBA, and since componentwise $|\omega_i|\le2\max_{j,k}|\partial_ju_k|$,
$$
\int_0^{T_*}\!\|\omega\|_{L^\infty}dt\le 2\,T_*\sup_{r\le T_*}F\big(\nu^{-1},\|u_0\|_{H^s},r\big)<\infty,
$$
the supremum finite because $F$ is bounded on compact sets. This contradicts Theorem 6. Hence $T_*=\infty$; this is the argument's only use of the axiom. $\square$

**Corollary 7** (explicit conditional growth bound). *Assume EBA and set, for $T>0$,*
$$
E_T=\big(T\|u_0\|_{L^2}^2/2\nu\big)^{1/2}+2T\sup_{r\le T}F\big(\nu^{-1},\|u_0\|_{H^s},r\big).
$$
*Then for all $T$,*
$$
\sup_{[0,T]}\big(e+\|u\|_{H^s}^2\big)\le\big(e+2\,e+2\|u_0\|_{H^s}^2\big)^{\exp\left(C\,(T+E_T)\right)} .
$$

*Proof.* Exponentiate Proposition 5 twice and bound $y(0)\le e+2\|u_0\|_{H^s}^2$, absorbing constants. $\square$

## Smoothness, pressure, and energy, proved

**Lemma 8** (Plancherel smoothing). *For $r>0$ and any $\sigma$: $\|e^{\nu r\Delta}f\|_{H^{\sigma+1/2}}\le C(\nu r)^{-1/4}\|f\|_{H^{\sigma}}$ and $\|e^{\nu r\Delta}\nabla\!\cdot G\|_{H^{\sigma+1/2}}\le C(\nu r)^{-3/4}\|G\|_{H^{\sigma}}$.*

*Proof.* On the Fourier side the multipliers are bounded by $\sup_{\lambda\ge0}\lambda^{1/2}e^{-\nu r\lambda^2}=C(\nu r)^{-1/4}$ and $\sup_{\lambda\ge0}\lambda^{3/2}e^{-\nu r\lambda^2}=C(\nu r)^{-3/4}$, uniformly over the inhomogeneous weight. $\square$

**Proposition 9** (bootstrap). *Under EBA, $u\in C^\infty\big((0,\infty)\times\mathbb{R}^3\big)$, all spatial Sobolev norms are bounded on compact time subsets of $(0,\infty)$, and $p=\sum_{i,j}R_iR_j(u_iu_j)$, with $R_i$ the Riesz transforms, is smooth on $(0,\infty)\times\mathbb{R}^3$ and closes the unprojected system classically.*

*Proof.* Fix $0<t_0<T$. Duhamel for the projected equation on $[t_0,T]$ reads
$$
\begin{aligned}
u(t)={}&e^{\nu(t-t_0)\Delta}u(t_0)\\
&-\int_{t_0}^{t}e^{\nu(t-\tau)\Delta}\,\mathbb{P}\nabla\!\cdot\!\big(u\otimes u\big)(\tau)\,d\tau,
\end{aligned}
$$
valid in $H^{s-2}$ by Theorem 2's class. Since $H^s$ is an algebra, $\|u\otimes u\|_{H^{s}}\le C\|u\|_{H^s}^2$ is bounded on $[t_0,T]$ by part (i); Lemma 8 then bounds $\|u(t)\|_{H^{s+1/2}}$ by $C(\nu(t-t_0))^{-1/4}$ plus a convergent $(t-\tau)^{-3/4}$ integral, so $u\in L^\infty_{\mathrm{loc}}((t_0,T];H^{s+1/2})$; continuity in $H^{s+1/2}$ on $(t_0,T]$ follows by re-running Theorem 2 from any interior time at the higher index, its hypotheses now met. Iterating in half-steps gives $u\in C((0,T];H^{k})$ for every $k$, hence $u(t,\cdot)\in C^\infty$ with locally uniform bounds. Time regularity: the equation now gives $\partial_tu\in C((0,T];H^{k})$ for every $k$, and differentiating the equation in $t$ repeatedly, each right side lying in the same class, yields $u\in C^m((0,T];H^k)$ for all $m,k$, hence joint smoothness by Sobolev embedding. Applying $\mathrm{div}$ to the unprojected system determines $p$ up to a function of time as stated; the double Riesz formula preserves every $H^k$ and hence smoothness, and with this $p$ the pair satisfies the unprojected equations pointwise. $\square$

**Proposition 10** (energy identity, part (iii)). *For every $t\ge0$, $\|u(t)\|_{L^2}^2+2\nu\int_0^t\|\nabla u\|_{L^2}^2\,d\tau=\|u_0\|_{L^2}^2$.*

*Proof.* The order-zero pairing in Proposition 4 is justified classically on $[\epsilon,t]$ by Proposition 9 and passes to $\epsilon=0$ by the $C([0,\infty);H^s)$ continuity of Theorem 2. $\square$

## Weak-strong uniqueness and the assembly

**Theorem 11** (part (iv)). *Assume EBA. Let $v$ be any Leray-Hopf weak solution with datum $u_0\in V_s$, and $u$ the global strong solution. Then $v=u$ on $[0,\infty)$.*

*Proof.* Fix $T$. By Input E, pairing $v$'s weak formulation with the admissible test function $u$ and $u$'s equation with $v$, adding $v$'s energy inequality (Input A) and $u$'s energy identity (Proposition 10), all cross terms combine in the standard way and the pressure terms vanish against divergence-free fields, leaving for $w=v-u$ and almost every $t\le T$
$$
\begin{aligned}
\|w(t)\|_{L^2}^2&+2\nu\int_0^t\|\nabla w\|_{L^2}^2\,d\tau\\
&\le 2\int_0^t\!\int_{\mathbb{R}^3} w\cdot(w\cdot\nabla)u\,dx\,d\tau\\
&\le 2\int_0^t\|\nabla u\|_{L^\infty}\|w\|_{L^2}^2\,d\tau,
\end{aligned}
$$
the trilinear rearrangement using $\int (w\cdot\nabla)w\cdot u=-\int (w\cdot\nabla)u\cdot w$ for the divergence-free $w$. Since $\|\nabla u\|_{L^\infty}$ is continuous on $[0,T]$ by Theorem 2 and Sobolev embedding, Gronwall gives $w=0$ on $[0,T]$; $T$ was arbitrary. $\square$

*Proof of Theorem 1, assembly.* Part (i) is proved in 4.7; part (ii) is Theorem 2 plus Proposition 9; part (iii) is Proposition 10; part (iv) is Theorem 11. For Schwartz $u_0$, membership in every $V_s$ and the finiteness of the energy give the existence-and-smoothness clause of \cite{fefferman2000} conditionally on EBA. $\square$

**Remark 12** (where the openness lives). Nothing above touches the truth of EBA. Regularity per solution yields finiteness of $\sup_{[0,T]}\|\nabla u\|_{L^\infty}$ for each datum and each $T$, but supplies no function $F$ of $(\nu^{-1},\|u_0\|_{H^s},t)$ bounding it uniformly over data; producing any such modulus, for this or any roster functional, is the effectivity gap, the open subject of \cite{tao2021}, and is exactly what the axiom purchases. Warrant: the per-solution clause is theorem grade from part (ii); the no-known-modulus clause is a status report against the cited roster, structural grade.

# Falsifiable Criteria

Two criteria, each forced by a named result, each parameter-free, each naming the single claim of this paper that its firing compromises.

**F1, the chain criterion.** Prediction: no triple exists consisting of a datum $u_0\in V_s$, its maximal strong solution, and a finite $T_*$, with $\int_0^{T_*}\|\omega\|_{L^\infty}\,dt<\infty$. Firing event: such a triple constructed, refereed or machine-checked, and verified by two independent parties. Expected outcome while the paper stands: every finite-time breakdown carries a divergent vorticity integral. Null hypothesis, exact: one exhibited triple. Necessity: Proposition 5 entails the divergence, so the criterion is its negation, forced. Blast radius: Theorem 6, and with it part (i)'s proof route; nothing beyond this paper.

**F2, the tier criterion.** Prediction: no proof from the classical base derives EBA from bare global regularity, that is, qualitative regularity is not known to produce a data-uniform modulus. Firing event: a proof of base plus global regularity yielding EBA, refereed or machine-checked. Necessity: Remark 12's placement of the axiom at the effective tier entails it, forced by the companion trichotomy restated there. Blast radius: Remark 12's tier placement, and the axiom's claim to nontrivial supplier-side content; Theorem 1 itself would survive as an unconditionally weaker statement and would simply cease to need its axiom.

# Discussion

What the theorem buys, and what it prices honestly, can be read off the structure. Granting one displayed sentence, a reader obtains the entire standard conclusion with proofs on the page: this is the conditional literature's implication made complete and self-auditable, the same relation to \cite{bkm1984, prodi1959, serrin1963} that a fully worked textbook chapter bears to its research sources, plus the axiomatic framing that makes the single unproved input explicit, typed, and located at one line. The price is printed with equal clarity: the axiom is open, its truth is the uniformity the field lacks, and the paper's authored-mass ledger is zero on its own accounting, every ingredient being classical and the contribution being arrangement, which is stated without discomfort because arrangement under a disclosed premise is exactly what a conditional theorem is.

The result composes with the unconditional research front rather than competing with it. A modulus $F$ certified for restricted data classes is a restricted EBA, and the present chain converts any such certificate directly into global smoothness for that class; this is the sense in which the quantitative program \cite{tao2021} and the computational certification program \cite{ccrt2007} are, from this paper's seat, partial constructions of the axiom, and the small-data theory \cite{kochtataru2001} is its known unconditional fragment. Conversely, Corollary 7 turns any future bound on $F$ into an explicit double-exponential regularity envelope, which is the practical face of the conditional theorem.

Objections are met on their merits. That the axiom does all the work: it does one unit of work, the unit nobody can do, and the point of the paper is to show that this unit is literally a single line, everything else being classical labor that is here actually performed rather than waved at. That a conditional theorem on an open axiom is empty: it is exactly as empty as the Riemann-hypothesis-conditional literature, which is to say not at all, provided the conditioning is disclosed, non-circular, and located, all three of which the companion's screen enforces and Section 4.2 records. That the axiom might be false: then Theorem 1 is vacuously true, F2's territory, and the chain retains its unconditional content, Theorems 2, 6, and 11 and Lemma 3, which stand on the base alone. That the standard problem is thereby approached: it is not, the base is unchanged, and the paper says so wherever the question could arise.

Limitations and the fence, stated plainly: no unconditional claim on regularity is made or implied; the consistency of the base plus EBA is not established here and is tied to the open side of the problem; the framework provenance of the axiom is motivation at premise grade with zero warrant; the two textbook-cited passages in Theorem 2's proof are the only compressions in the chain and are named where they occur; and the contribution ledger reads zero authored mathematical mass, the exit from that ledger being specified in the companion and not exercised here.

The positioning of the paper against the prior art closes the discussion under the fixed vocabulary of the companion, defined once here: Kin, continuous with and building on the position as cited; Additive, supplying a result or assembly the position lacked while leaving it standing; Scoping, keeping the position intact inside a stated boundary; Subsuming, the position becoming a case of this paper's frame; Corroborating, independent agreement at zero warrant. Superseding and contradicting are used nowhere; this paper supersedes no theory and contradicts none.

```{=latex}
\begin{table*}[t]\footnotesize\setlength{\tabcolsep}{4pt}\centering
\begin{tabular}{@{}>{\raggedright\arraybackslash}p{1.30in}>{\raggedright\arraybackslash}p{1.45in}>{\raggedright\arraybackslash}p{2.05in}>{\raggedright\arraybackslash}p{0.72in}>{\raggedright\arraybackslash}p{0.78in}@{}}
\toprule
Prior position & What it holds & What this paper does with it & Relation & Evidence\\
\midrule
Leray 1934 & global weak solutions, energy inequality & Input A; the class closed onto the strong solution in Thm 11 & Kin & cited\\
Hopf 1951 & the energy class on domains & Input A's domain form, engaged for the class definition & Kin & cited\\
Fujita-\allowbreak Kato 1964; Kato 1972 & local strong theory & reproved as Theorem 2 by their mollification route & Additive, Kin & cited\\
Majda-\allowbreak Bertozzi 2002 & the textbook local scheme & followed in Thm 2; two routine passages cited to it by name & Kin & cited\\
Kato-\allowbreak Ponce 1988 & commutator estimate & Input B; drives Prop 4 & Kin & cited\\
Beale-\allowbreak Kato-\allowbreak Majda 1984 & vorticity criterion & log inequality reproved by kernel zones (Lemma 3); criterion reproved (Thm 6) & Additive, Kin & cited\\
Prodi 1959; Serrin 1963 & weak-strong uniqueness & reproved as Theorem 11 on Inputs A and E & Kin & cited\\
Galdi 2000 & duality justification & Input E's admissibility, cited by name & Kin & cited\\
Escauriaza-\allowbreak Seregin-\allowbreak Sverak 2003 & critical-norm criterion & part of the roster the axiom's tier is measured against & Scoping & cited\\
Koch-\allowbreak Tataru 2001 & small critical data global & read as the unconditional fragment of the axiom & Subsuming & cited\\
Tao 2021 & quantitative bounds program & read as partial construction of the modulus $F$ & Subsuming, Kin & cited\\
Chernyshenko-\allowbreak Constantin-\allowbreak Robinson-\allowbreak Titi 2007 & a posteriori certification & restricted-data certificates convert through the chain & Additive & cited\\
Fefferman 2000 & the standard problem statement & the conditional clause delivered; the base untouched & Scoping & documentary\\
Islam 2026 & the axiom screen and trichotomy & supplies the axiom's adjudication; this paper is its licensed deduction & Kin & cited\\
\bottomrule
\end{tabular}
\caption{Positioning against the prior art, fourteen rows, one per position the body engages; relation words as defined in the run-in; superseding and contradicting used nowhere.}
\end{table*}
```

# Conclusion

The gap addressed was completeness: the conditional route to Navier-Stokes regularity existed as a scatter of criteria and a folklore implication, and it is here assembled into a single theorem with every step proved from a fixed base and a single, named, typed axiom entering at a single line. The resolution proposed is not of the problem but of its accounting: after this paper, the entire open content of the regularity question, along this route, is the truth of one displayed sentence about a modulus.

The primary falsifiable criterion is F1, exact and parameter-free: one smooth-data solution with finite maximal time and finite vorticity actuation integral, independently verified, refutes the chain. The invitation stands to the analysis community, and equally to the formalization community, for whom the chain as written, five lettered inputs and nine proved statements, is a specification.

The single most important open question is the axiom itself: whether any data-uniform modulus for any roster functional is a theorem of the base, the effectivity gap. A proof would fire F2, delete one hypothesis, and leave this paper's chain as the closing argument of the problem; a disproof would confine effectivity forever to restricted data classes and make the certification programs the permanent form of progress.

Acceptance of the framing entails one sentence: along the vorticity route, the three-dimensional Navier-Stokes problem is the statement EBA, and everything else is now bookkeeping that has been done.

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
\bibitem{prodi1959} Prodi, G. 1959. Un teorema di unicita per le equazioni di Navier-Stokes. \emph{Annali di Matematica Pura ed Applicata} 48, 173--182.
\bibitem{serrin1963} Serrin, J. 1963. The initial value problem for the Navier-Stokes equations. In \emph{Nonlinear Problems}, ed. R. E. Langer, 69--98. Madison: University of Wisconsin Press.
\bibitem{galdi2000} Galdi, G. P. 2000. An introduction to the Navier-Stokes initial-boundary value problem. In \emph{Fundamental Directions in Mathematical Fluid Mechanics}, 1--70. Basel: Birkhauser.
\bibitem{ess2003} Escauriaza, L., G. Seregin, and V. Sverak. 2003. $L_{3,\infty}$-solutions of Navier-Stokes equations and backward uniqueness. \emph{Russian Mathematical Surveys} 58, 211--250.
\bibitem{kochtataru2001} Koch, H., and D. Tataru. 2001. Well-posedness for the Navier-Stokes equations. \emph{Advances in Mathematics} 157, 22--35.
\bibitem{tao2021} Tao, T. 2021. Quantitative bounds for critically bounded solutions to the Navier-Stokes equations. In \emph{Nine Mathematical Challenges: An Elucidation}, Proceedings of Symposia in Pure Mathematics 104, 149--193. Providence: American Mathematical Society.
\bibitem{ccrt2007} Chernyshenko, S. I., P. Constantin, J. C. Robinson, and E. S. Titi. 2007. A posteriori regularity of the three-dimensional Navier-Stokes equations from numerical computations. \emph{Journal of Mathematical Physics} 48, 065204.
\bibitem{fefferman2000} Fefferman, C. L. 2000. Existence and smoothness of the Navier-Stokes equation. Clay Mathematics Institute Millennium Prize Problem description. Cambridge, MA: Clay Mathematics Institute.
\bibitem{anchoring} Islam, M. F. 2026. Anchoring Axioms for Three-Dimensional Navier-Stokes Regularity: A Gated Cascade for Supplier-Side Axiom Formulation. Manuscript, September 8, 2026.
\bibitem{trisduction} Islam, M. TRISDUCTION: A Linguistically, Topologically, and Mathematically Sealed Verification Architecture. Triaxial Orthogonality, Twelve-Gate Closure, the Quaternionic Completion, the Root Axiom, and the Master Pre-Sealed Proposition Ledger. Zenodo, version 4, 19 June 2026. DOI 10.5281/zenodo.20757507. https://zenodo.org/records/20757507. Mirror: PhilArchive record ISLTTG, https://philpapers.org/rec/ISLTTG. Master reference, continuously updated at the same location.
\end{thebibliography}
```
