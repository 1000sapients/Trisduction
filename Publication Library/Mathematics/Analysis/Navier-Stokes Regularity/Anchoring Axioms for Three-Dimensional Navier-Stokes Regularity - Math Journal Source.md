---
edition: math_journal
title: "Anchoring Axioms for Three-Dimensional Navier-Stokes Regularity: A Gated Cascade for Supplier-Side Axiom Formulation"
subtitle: "A Trisductive instrument: the conditional deductive chain in full, an axiom trichotomy, five candidates adjudicated, and the ledger of authored mass"
article_type: "Mathematical Analysis · Method and Conditional Results"
goal: "To mechanize legitimate axiom formulation for one hard problem, and to price it exactly."
author_line: "Mohammad F. Islam, PhD"
affiliation: "Independent Researcher · The Trisduction Program"
date: "September 8, 2026"
short_title: "Anchoring Axioms for Navier-Stokes"
keywords: "Navier-Stokes equations; global regularity; axiom extension; Beale-Kato-Majda criterion; Constantin-Fefferman criterion; effective bounds; reverse mathematics; Trisduction"
abstract: |
  Global regularity for the three-dimensional incompressible Navier-Stokes equations has been open since Leray, and every known route prices blowup by an unbounded actuation functional, a vorticity integral, a critical norm, or a coherence scale, without ever deriving the bound. The tempting shortcut is to postulate the bound as an axiom and deduce regularity, and the legitimacy, the mechanics, and the exact price of that shortcut are rarely stated with precision. This paper supplies all three. First it builds a gated screening cascade, AXF, that adjudicates candidate anchoring axioms for a fixed target on eight admission gates, consistency, provable-equivalence status against the known criterion roster, coupling, literature clearance, consequence breadth, calibration, motivation typing, and an aperture clause under which the cascade emits candidacy and never truth. Second it proves an axiom trichotomy over the classical base: every candidate lands as circular, provably equivalent to global regularity, and we show this tier swallows every qualitative axiom built on a proved continuation criterion, including the blowup-conditioned vorticity axiom, the bounded critical norm axiom, and the qualitative vorticity-coherence axiom; or as effective, a data-uniform explicit bound not known to follow from bare regularity, the only tier where an axiom can carry breadth; or as off-string, quantifying over positive-microscale flows and transferring nothing without a uniformity input that is itself tier two. Third it gives the complete deductive chain from the classical base, local theory, the commutator estimate, the logarithmic Sobolev inequality, and an Osgood closure, so that each admitted axiom yields global smoothness by a fully written proof. The primary falsifiable criterion is exact and parameter-free: one exhibited smooth-data solution with finite maximal time and finite vorticity actuation integral refutes the chain. The implication, if the classification stands, is that axiom formulation is real mathematics exactly when the axiom escapes tier one with a proved consequence network, and that the entire open content of the problem is the effectivity gap the cascade isolates.
---

```{=latex}
\emergencystretch=1.6em
\sloppy
```

# Background and the Barrier Record

The object is the incompressible Navier-Stokes system on $\mathbb{R}^3$ with viscosity $\nu>0$ and no external force,
$$
\begin{aligned}
&\partial_t u + (u\cdot\nabla)u = -\nabla p + \nu\Delta u,\\
&\nabla\cdot u = 0,\qquad u(\cdot,0)=u_0,
\end{aligned}
$$
with divergence-free data $u_0$ in the Sobolev class $H^s(\mathbb{R}^3)$, $s\ge 3$, which contains the Schwartz-class data of the standard problem statement \cite{fefferman2000}. The question is whether the unique local strong solution extends smoothly to all positive times for every such datum. We write $\omega=\nabla\times u$ for the vorticity and $T_*\le\infty$ for the maximal existence time of the strong solution.

The difficulty has a scaling name. The equations are invariant under $u_\lambda(x,t)=\lambda u(\lambda x,\lambda^2 t)$, $p_\lambda(x,t)=\lambda^2 p(\lambda x,\lambda^2 t)$, and under this zoom the energy scales as
$$
\|u_\lambda(\cdot,0)\|_{L^2}^2=\lambda^{-1}\|u_0\|_{L^2}^2,
$$
so the one globally controlled quantity, the Leray energy, shrinks precisely as one zooms into a putative singularity. The problem is supercritical: the conserved quantity lives below the scaling-critical spaces $\dot H^{1/2}$, $L^3$, and $BMO^{-1}$, and no known monotone quantity lives at or above them. This is the structural diagnosis, and it is a barrier of geometry rather than of computation: refining the estimates inside the energy class does not change which side of the scaling line the estimates live on.

What is known draws the barrier precisely. Global weak solutions in the energy class exist for all data \cite{leray1934, hopf1951}, and unique strong solutions exist locally in time with a sharp blowup alternative \cite{fujitakato1964, kato1972}. Regularity holds conditionally under any member of a family of criteria: the Prodi-Serrin scale-invariant integrability conditions \cite{prodi1959, serrin1963}, the vorticity criterion of Beale, Kato, and Majda \cite{bkm1984}, the endpoint critical-norm criterion \cite{ess2003}, sharpened to a necessity statement at blowup \cite{seregin2012}, and the vorticity-direction coherence criterion of Constantin and Fefferman \cite{constantinfefferman1993}. Partial regularity bounds the possible singular set to parabolic one-dimensional Hausdorff measure zero \cite{ckn1982}. Small data in the largest critical space are globally regular \cite{kochtataru2001}.

The negative record is equally structural, and it is what makes an added axiom tempting. A finite-time blowup exists for an averaged model that obeys the same energy identity as the true equations \cite{tao2016}, so no argument using only the identities the averaging preserves can close the problem; the wall is on a method class, and it is a theorem, not a sentiment. Below the strong class the solution concept is genuinely wild: weak solutions in the sense of distributions are non-unique \cite{buckmastervicol2019}, and even Leray-Hopf solutions are non-unique in the forced setting \cite{abc2022}. Warrant: each statement in the last two paragraphs is theorem grade in its cited source; the supercriticality diagnosis is the standard structural reading and is carried at structural grade.

Every positive criterion in the family has one shape. It names an actuation functional of the flow, the time integral of the peak vorticity, the running supremum of a critical norm, the coherence scale of the vorticity direction on the high-vorticity set, and proves: if the functional stays finite, the solution continues. Blowup, if it exists, is exactly the divergence of every such functional. The shortcut is then irresistible to state: postulate, as an axiom, that the functional stays finite, and regularity follows by the criterion. Three questions attach to the shortcut, and they are the subject of this paper. Is it legitimate mathematics or is it question begging. Can the search for such an axiom be made an algorithm, a gated cascade that filters candidates the way a proof assistant filters proof steps. And what, exactly, does a successful candidate contribute, in the strict accounting where restating a conjecture contributes nothing.

There is a standing model for the legitimate version of the shortcut, and it is not folklore but a named research program. In set theory, statements independent of the base axioms are decided by new axioms whose admission is earned through their consequence networks: large cardinal hypotheses were proposed on structural motivation and then justified by what they proved, the determinacy of definable games being the flagship, derived from Woodin cardinals \cite{martinsteel1989}, exactly as the program of \cite{godel1947} envisioned. Reverse mathematics runs the same trade in the other direction, calibrating each theorem to the exact axiom it is equivalent to over a weak base \cite{simpson2009}. Axiom formulation, in that tradition, is real mathematics, and the mass is never in the axiom sentence: it is in the proved network around it, the implications, the calibrations, and the consistency comparisons.

The same tradition also names the illegitimate version. An axiom admitted because it decides the one target it was written for, with no consequence outside that target and no position in any calibration order, is a decree wearing a postulate's clothing. The set-theoretic community's resistance to deciding the continuum hypothesis by fiat is the standing exhibit: an axiom equivalent to the desired answer settles nothing, because assuming it is indistinguishable from assuming the answer. The distinction between a structured extension and a one-target decree is therefore the entire legitimacy question, and the contribution of this paper is to mechanize that distinction for one hard problem and to prove where the line falls.

Two inflations must be barred at the door, because both are natural readings of the phrase an algorithm that finds the axiom. First, no screening procedure sources the truth of a candidate. The cascade below adjudicates well-formedness, non-circularity, coupling, breadth, and calibration; the truth of an admitted candidate remains exactly as open as the problem, and is settled, if ever, by the ordinary external process of proof and refereed verification. A procedure that claimed to output the truth value of the regularity statement from structural inputs alone would be claiming information those inputs provably do not carry, and the third falsification criterion of Section 5 puts that claim at risk in exact form. Second, the geometric reading of the problem, the vortex-line and alignment geometry that visibly organizes the criterion family, guides the search for candidates and supplies zero warrant for any of them. Guidance is heuristic and is typed as such throughout; warrant travels only with proofs.

The plan is then as follows. Section 2 fixes the prior work the paper stands on. Section 3 states the method. Section 4 is the core: the classical inputs stated exactly; the cascade AXF with its gates; the full deductive chain, an a priori estimate, an Osgood closure, and the continuation theorem, written out; the axiom trichotomy with proof; and the adjudication of five candidates, three refused as circular by theorem, two admitted at the effective tier. Section 4 closes on the mass ledger, the strict accounting of what, if anything, the formulations author. Section 5 states three falsifiable criteria, each forced by the paper's own results. Section 6 discusses legitimacy, the set-theoretic comparison, implications, and limitations, and closes on the positioning table.

A remark on provenance, stated once. The screening discipline below descends from a broader verification framework, Trisduction, whose root postulate, that to exist is to actuate at strictly positive energetic cost, motivates reading the criterion family as actuation bounds; within this paper that provenance is a motivation and nothing else, typed premise grade, and every load-bearing step is classical mathematics proved or cited at theorem grade. The framework adds the cited results no warrant.

The honest boundary of the whole enterprise is stated before any machinery: no derivation grounds its own starting points, so every proof in this paper, like every proof anywhere, is conditional on a posited base, and the paper's conditional theorems differ from unconditional mathematics only in that their extra posit is local, named, and priced. What the cascade regulates is the pricing.

# Prior Approaches

The classical existence theory is the base. Leray constructed global weak solutions satisfying the energy inequality \cite{leray1934}, extended to domains by Hopf \cite{hopf1951}. Local strong well-posedness with the blowup alternative is due to Fujita and Kato and to Kato \cite{fujitakato1964, kato1972}; the textbook treatment we cite for the exact statements used below is \cite{majdabertozzi2002}. Weak-strong uniqueness, that a Leray-Hopf solution coincides with the strong solution while the latter exists, is due to Prodi and Serrin \cite{prodi1959, serrin1963}.

The conditional-regularity family supplies the continuation criteria the trichotomy consumes. The Prodi-Serrin conditions give regularity under scale-invariant space-time integrability of the velocity \cite{prodi1959, serrin1963}. Beale, Kato, and Majda proved that finite time-integrated peak vorticity forbids blowup \cite{bkm1984}; their logarithmic Sobolev inequality is Lemma D below and the criterion itself is reproved as Theorem 3. Escauriaza, Seregin, and Sverak proved the endpoint criterion in the critical Lebesgue space \cite{ess2003}, and Seregin sharpened it to necessity: the critical norm diverges at any finite-time singularity \cite{seregin2012}. Constantin and Fefferman proved that Lipschitz coherence of the vorticity direction on the high-vorticity set forbids blowup \cite{constantinfefferman1993}, the one member of the family whose hypothesis is geometric rather than metric.

The effective and computational line is younger and is where the admitted candidates of Section 4 live. Chernyshenko, Constantin, Robinson, and Titi showed that regularity for specific data can be certified a posteriori from a sufficiently accurate numerical computation, with explicit computable smallness conditions \cite{ccrt2007}. Tao's quantitative program derives explicit, if towering, bounds for solutions obeying a critical-norm bound \cite{tao2021}, making effectivity itself a research object. Regularized dynamics are classical: with hyperdissipation of order five-fourths or more, global smoothness is a theorem \cite{lions1969}, and spectral Galerkin truncations are globally regular finite systems; these anchor the off-string tier of the trichotomy.

The extension practice this paper mechanizes is the set-theoretic one. Godel proposed deciding independent statements by new axioms justified through their fruitfulness \cite{godel1947}; Martin and Steel delivered the flagship, projective determinacy from Woodin cardinals \cite{martinsteel1989}; Simpson's reverse mathematics is the calibration science, matching theorems to their exact axiomatic strength \cite{simpson2009}. The paper's cascade is these two disciplines, admission by consequence network and calibration by equivalence, compiled into gates for a single analytic target.

Each of these approaches is correct on its own ground, and each stops at the same wall from its own side. The existence theory stops below the critical line; the criterion family proves necessity shapes and never the bound; the effective line certifies data one at a time; the walls of \cite{tao2016, buckmastervicol2019, abc2022} close whole method classes; and the extension practice, imported naively, threatens to decide by decree. The common missing piece is a screen that says, before any axiom is used, which of these fates the axiom meets. Section 4 builds the screen and proves that the fates are exactly three.

# Method

The paper's method is deductive throughout and carries a fixed discipline. First, every implication is proved from a stated base, the classical results of Section 4.1 taken at theorem grade with exact statements, and every nonclassical hypothesis is typed premise grade on its face and quarantined from the theorem grade of the implications it enables. Second, no candidate axiom is used before it passes the intake screen: its provable-equivalence status against the known criterion roster is computed, its provenance is stated, and a candidate provably equivalent to the target is refused as circular no matter how it is costumed. Third, verdicts are invariant under reformulation: the classification of a candidate depends only on its equivalence class over the base, never on its wording, so that renaming a conjecture cannot launder it into an axiom.

Independent verifiability is a standing requirement rather than a courtesy. Every claim in this paper is checkable by the ordinary refereeing process, and every proof is elementary enough to be formalized in a contemporary proof assistant; the falsification criteria of Section 5 are stated so that a refutation, should one exist, is a finite exhibitable object verifiable by at least two independent parties.

The three conditions any admitted anchoring axiom must satisfy are stated here and enforced by the gates of Section 4.2: a formal statement in the language of the base with scoped quantifiers; a proved coupling, meaning the base plus the axiom derives the target by a written proof; and a computed position, meaning the axiom's relation to the target, equivalent, strictly stronger, or unknown, is established against the known theorem roster before the axiom is offered for any purpose. The gates add consistency evidence, literature clearance, breadth, calibration, and the aperture clause, and Section 4.5 adds the strict mass accounting.

# The Cascade, the Chain, and the Trichotomy

## Setting and classical inputs

Throughout, $s\ge 3$ is an integer, $u_0\in H^s(\mathbb{R}^3)$ with $\nabla\cdot u_0=0$, $\nu>0$, and $\Lambda=(-\Delta)^{1/2}$. All constants named $C$ depend at most on $s$. The classical inputs are stated exactly and cited; each is theorem grade in its source.

**Theorem A** (Leray; Hopf \cite{leray1934, hopf1951}). *For every divergence-free $u_0\in L^2$ there exists a global weak solution $u\in L^\infty(0,\infty;L^2)\cap L^2(0,\infty;\dot H^1)$ satisfying the energy inequality*
$$
\|u(t)\|_{L^2}^2+2\nu\int_0^t\|\nabla u(\tau)\|_{L^2}^2\,d\tau\le\|u_0\|_{L^2}^2 .
$$
*For strong solutions the inequality is an identity.*

**Theorem B** (local well-posedness and the blowup alternative \cite{fujitakato1964, kato1972, majdabertozzi2002}). *For $u_0$ as above there is a unique maximal strong solution $u\in C([0,T_*);H^s)$, smooth for $t>0$, and if $T_*<\infty$ then $\lim_{t\uparrow T_*}\|u(t)\|_{H^s}=\infty$. Conversely, a bound $\sup_{[0,T]}\|u\|_{H^s}<\infty$ with $T\le T_*$ finite permits extension past $T$.*

**Lemma C** (commutator estimate \cite{katoponce1988}). *For $s>0$ and $f,g$ Schwartz,*
$$
\begin{aligned}
\|\Lambda^s(fg)-f\,\Lambda^s g\|_{L^2}\le C\big(&\|\nabla f\|_{L^\infty}\|\Lambda^{s-1}g\|_{L^2}\\
&+\|\Lambda^s f\|_{L^2}\|g\|_{L^\infty}\big).
\end{aligned}
$$

**Lemma D** (logarithmic Sobolev inequality \cite{bkm1984}). *For divergence-free $u\in H^s(\mathbb{R}^3)$, $s\ge 3$, with $\omega=\nabla\times u$,*
$$
\|\nabla u\|_{L^\infty}\le C\Big(1+\|\omega\|_{L^2}+\|\omega\|_{L^\infty}\big(1+\log^+\|u\|_{H^s}\big)\Big).
$$

**Theorem E** (weak-strong uniqueness \cite{prodi1959, serrin1963}). *If a strong solution with datum $u_0$ exists on $[0,T]$, every Leray-Hopf solution with the same datum coincides with it on $[0,T]$.*

**Theorem F** (critical-norm criterion and its necessity \cite{ess2003, seregin2012}). *A Leray-Hopf solution bounded in $L^\infty(0,T;L^3)$ is smooth on $(0,T]$; and if $T_*<\infty$ then $\|u(t)\|_{L^3}\to\infty$ as $t\uparrow T_*$.*

**Theorem G** (direction coherence \cite{constantinfefferman1993}). *There is an absolute constant with the following property. If on $[0,T)$ there exist $\rho>0$ and $\Omega>0$ such that, for almost every $t$ and all $x,y$ with $|\omega(x,t)|\ge\Omega$ and $|\omega(y,t)|\ge\Omega$, the angle $\theta$ between $\omega(x,t)$ and $\omega(y,t)$ satisfies $|\sin\theta|\le|x-y|/\rho$, then the solution is smooth up to $T$ and extends past it.*

## The cascade AXF

The instrument is a screen followed by admission gates, in the shape of the verdict cascades of the parent framework, and it is a screening instrument only: it authors no mathematics, its own contribution is arrangement, and its output vocabulary contains no truth values. Its inputs are a fixed target sentence, here global regularity, written $\mathrm{GR}$: for every admissible datum, $T_*=\infty$; the known theorem roster of Section 4.1; and one candidate sentence $A$ in the language of the base.

```{=latex}
\begin{jbox}
\textbf{AXF, the axiom-forge cascade.} Screen, then eight admission gates, first
failure terminal with its state named; defaults absent, so an under-specified
candidate is never admitted. Instrument typing: screening grade; authored mass
zero; the emitter states are \textsc{refused-circular},
\textsc{refused-inert}, \textsc{refused-inconsistent},
\textsc{conditional} (usable as a disclosed hypothesis, mass zero),
and \textsc{mass-candidate} (routed onward to the external admission cascade
of Section 4.5). \emph{Warrant: the gate logic is elementary; every
mathematical fact it consults is a cited theorem of Section 4.1.}

\smallskip
\textbf{S1} target typed: the target sentence fixed, its proved
continuation-criterion roster enumerated. \textbf{S2} shape consulted: any
geometric or physical reading enters as search guidance, typed premise, zero
warrant. \textbf{S3} well-formed: $A$ is a sentence of the base language with
scoped quantifiers.

\smallskip
\textbf{A1} consistency floor: no known proof that the base refutes $A$;
relative-consistency evidence graded where available. \textbf{A2} equivalence
status: the roster is applied; if the base provably yields $A\leftrightarrow
\mathrm{GR}$, emit \textsc{refused-circular}. \textbf{A3} coupling: a written
proof of base $+\,A\vdash\mathrm{GR}$ exists; absent one, emit
\textsc{refused-inert}. \textbf{A4} literature clearance: if $A$ is a named
statement of the literature, the formulation authors nothing and the route is
\textsc{conditional}. \textbf{A5} breadth: the number of proved consequences of
base $+\,A$ outside the target's provable-equivalence family is counted;
breadth zero marks a one-target decree, admissible only as
\textsc{conditional}. \textbf{A6} calibration: the position of $A$ against the
target and against named conjectures is computed where theorems permit,
equivalent, strictly stronger, or unknown. \textbf{A7} motivation typed: every
motivation travels at premise grade and carries no warrant. \textbf{A8} the
aperture clause: the emitter's vocabulary excludes \emph{true}; candidacy is
the maximal output, and the truth of $A$ is settled only by external proof and
independent verification.
\end{jbox}
```

Two design facts are recorded so the gate count is not misread. The count eight is enumeration-forced by the refusal-and-routing taxonomy above, one gate per boundary between the candidate pool and a named emitter state or tier, and no group-theoretic forcing is claimed for it; asserting one would be exactly the fitted-count error the parent discipline bars. And gate A8 is the load-bearing one: a cascade whose emitter could say true would be an algorithm claiming to source the deciding bit of an open problem from structural inputs, which is the claim Section 5's third criterion invites the reader to refute this paper for making, and which this paper does not make.

## The deductive chain

The chain is written in full so that every admitted candidate closes to global smoothness by proof rather than by citation alone.

**Proposition 1** (a priori estimate). *For the strong solution on any $[0,T]\subset[0,T_*)$, with $X(t)=\|u(t)\|_{L^2}^2+\|\Lambda^s u(t)\|_{L^2}^2$,*
$$
\frac{d}{dt}X\le C\,\|\nabla u\|_{L^\infty}\,X .
$$

*Proof.* Apply $\Lambda^s$ to the momentum equation and pair with $\Lambda^s u$ in $L^2$:
$$
\begin{aligned}
\tfrac12\tfrac{d}{dt}\|\Lambda^s u\|_{L^2}^2+\nu\|\nabla\Lambda^s u\|_{L^2}^2
=&-\langle\Lambda^s(u\cdot\nabla u),\Lambda^s u\rangle\\
&-\langle\Lambda^s\nabla p,\Lambda^s u\rangle .
\end{aligned}
$$
The pressure term vanishes: $\Lambda^s$ commutes with derivatives, so integrating by parts gives $\langle\Lambda^s p,\nabla\cdot\Lambda^s u\rangle=0$ by the divergence constraint. Split $\Lambda^s(u\cdot\nabla u)=u\cdot\nabla\Lambda^s u+[\Lambda^s,u\cdot\nabla]u$. The transport part pairs to zero, $\langle u\cdot\nabla v,v\rangle=-\tfrac12\int(\nabla\cdot u)|v|^2=0$ with $v=\Lambda^s u$. The commutator is bounded componentwise by Lemma C with $f=u_j$, $g=\partial_j u_i$:
$$
\begin{aligned}
\|[\Lambda^s,u\cdot\nabla]u\|_{L^2}
&\le C\,\|\nabla u\|_{L^\infty}\|\Lambda^{s-1}\nabla u\|_{L^2}\\
&\quad+C\,\|\Lambda^s u\|_{L^2}\|\nabla u\|_{L^\infty}\\
&\le C\,\|\nabla u\|_{L^\infty}\|\Lambda^s u\|_{L^2},
\end{aligned}
$$
since $\partial_j\Lambda^{-1}$ is an $L^2$ Fourier multiplier of norm at most one. Cauchy-Schwarz, together with the $L^2$ energy identity at order zero, and dropping the nonnegative viscous terms, gives the display. $\square$

**Proposition 2** (Osgood closure). *Let $y(t)=e+X(t)$. For every $T\in(0,T_*)$,*
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

*Proof.* Since $\|u\|_{H^s}\le y^{1/2}$, Lemma D gives $\|\nabla u\|_{L^\infty}\le C(1+\|\omega\|_{L^2}+\|\omega\|_{L^\infty})\log y$, using $\log y\ge 1$ to absorb constants. Proposition 1 then yields $y'\le C(1+\|\omega\|_{L^2}+\|\omega\|_{L^\infty})\,y\log y$, that is, $(\log\log y)'\le C(1+\|\omega\|_{L^2}+\|\omega\|_{L^\infty})$; integrate. For divergence-free fields $\|\omega\|_{L^2}=\|\nabla u\|_{L^2}$, by Plancherel and $\xi\cdot\hat u=0$, and the energy identity of Theorem A bounds $\int_0^T\|\nabla u\|_{L^2}^2$; Cauchy-Schwarz in time finishes. $\square$

**Theorem 3** (continuation; the viscous Beale-Kato-Majda criterion, reproved). *If $T_*<\infty$ then $\int_0^{T_*}\|\omega(t)\|_{L^\infty}\,dt=\infty$.*

*Proof.* If the integral were finite, Proposition 2 would bound $\|u\|_{H^s}$ on $[0,T_*)$, and Theorem B would extend the solution past $T_*$, contradicting maximality. $\square$

The chain is now closed for any axiom that bounds the actuation functional. The candidates are stated next and run through the cascade; for each admitted implication the proof is one paragraph on top of Theorem 3 or a cited theorem of Section 4.1, which is the intended division of labor: the base carries the analysis, the axiom carries the one bound analysis has not produced.

## The candidates and the trichotomy

Five candidates are adjudicated. Each is stated exactly; each verdict names the gate that decides it. Every motivation clause, including the actuation reading inherited from the parent framework's root postulate, travels at premise grade and zero warrant, per gate A7.

**BAR** (bounded actuation, blowup-conditioned). *For every admissible datum, if $T_*<\infty$ then $\int_0^{T_*}\|\omega\|_{L^\infty}\,dt<\infty$.*

**L3B** (bounded critical norm). *For every admissible datum, if $T_*<\infty$ then $\sup_{t<T_*}\|u(t)\|_{L^3}<\infty$.*

**CFCq** (qualitative coherence). *For every admissible datum, if $T_*<\infty$ then there exist $\rho,\Omega>0$ with the coherence property of Theorem G on $[0,T_*)$.*

**EBA** (effective bound). *There exists a function $F$, finite and bounded on compact sets of its arguments, such that every maximal strong solution satisfies $\|\nabla u(t)\|_{L^\infty}\le F\big(\nu^{-1},\|u_0\|_{H^s},t\big)$ for all $t\in[0,T_*)$.*

**CFCe** (effective coherence). *There exist functions $\rho_*,\Omega_*$ of $\big(\nu^{-1},\|u_0\|_{H^s}\big)$, positive on their domain, such that every maximal strong solution satisfies the coherence property of Theorem G with $\rho=\rho_*$, $\Omega=\Omega_*$ on $[0,T_*)$.*

**Theorem 4** (couplings). *Over the base: BAR implies GR; L3B implies GR; CFCq implies GR; EBA implies GR; CFCe implies GR. In each case every Leray-Hopf solution with admissible datum coincides with the global strong solution.*

*Proof.* BAR: if $T_*<\infty$, BAR's consequent contradicts Theorem 3; so $T_*=\infty$. L3B: if $T_*<\infty$, its consequent contradicts the necessity clause of Theorem F. CFCq: if $T_*<\infty$, its consequent puts Theorem G's hypothesis in force on $[0,T_*)$, and Theorem G extends the solution past $T_*$, a contradiction. EBA: if $T_*<\infty$, then $\|\omega\|_{L^\infty}\le 2\|\nabla u\|_{L^\infty}\le 2\sup_{t\le T_*}F$ on $[0,T_*)$, the supremum finite since $F$ is bounded on compacts, so $\int_0^{T_*}\|\omega\|_{L^\infty}\,dt<\infty$, contradicting Theorem 3. CFCe implies CFCq instance-wise, hence GR. The final clause is Theorem E applied on every compact interval. $\square$

**Theorem 5** (the circular tier). *Over the base, each of BAR, L3B, CFCq is provably equivalent to GR.*

*Proof.* Each implies GR by Theorem 4. Conversely, GR asserts $T_*=\infty$ for every datum, so the antecedent $T_*<\infty$ of each candidate is false and each holds vacuously. $\square$

The vacuity in the converse is not a technicality to be engineered away; it is the trap itself, and the next result shows the trap swallows the entire qualitative regime, including the unconditioned forms a careful author would reach for next.

**Proposition 6** (the axiom trichotomy). *Call a sentence $A$ a faithful actuation axiom if it asserts finiteness of a functional $\Phi$ of the flow either (i) conditioned on $T_*<\infty$ over $[0,T_*)$, or (ii) unconditionally per solution, with $\Phi$ drawn from a proved continuation criterion of the roster, and with the assertion qualitative, meaning no data-uniform bounding function is named; or call $A$ off-string if its quantifiers range over dynamics carrying a positive microstructural scale rather than over solutions of the equations. Then over the base exactly one of three holds. Tier one, circular: every faithful qualitative axiom of form (i) is provably equivalent to GR, and every one of form (ii) whose per-solution finiteness is itself provable from GR, which includes the vorticity, critical-norm, and coherence functionals of the roster, is likewise provably equivalent to GR. Tier two, effective: a data-uniform form, one naming an explicit bounding function of $(\nu^{-1},\|u_0\|_{H^s},t)$, implies GR and is not provably implied by GR by any theorem of the roster; its equivalence status is open, and it is the only tier at which gate A5 breadth can be nonzero. Tier three, off-string: an off-string axiom constrains regularized dynamics whose global regularity is already classical, hyperdissipative flows and Galerkin systems \cite{lions1969}, and yields no constraint on GR absent an added uniformity-in-the-microscale hypothesis, which is itself a tier-two statement.*

*Proof.* Tier one, form (i): Theorem 5's argument is generic; the coupling direction is the criterion's continuation theorem and the converse is vacuity under GR. Form (ii): under GR the solution is smooth on every compact time interval, so $\sup_{[0,T]}\|\omega\|_{L^\infty}$, $\sup_{[0,T]}\|u\|_{L^3}$, and, for the coherence functional, the existence of per-solution $\rho(T),\Omega(T)$ are finite or hold by continuity of the fields and, for coherence, by continuity of the direction field on the compact high-vorticity set, the set being compact because finite-energy smooth fields decay; global-in-time versions follow from eventual smallness, since the energy inequality forces $\|u(t)\|_{\dot H^{1/2}}^2\le\|u(t)\|_{L^2}\|\nabla u(t)\|_{L^2}$ to be small along a sequence, small-critical-data theory \cite{fujitakato1964, kochtataru2001} then gives decay of $\|\nabla u\|_{L^\infty}$, and the high-vorticity set is eventually empty at any fixed threshold. So GR proves each qualitative form, and each proves GR through its criterion: equivalence. Tier two: the coupling is Theorem 4's EBA and CFCe clauses; non-derivability from GR by the roster is the observation that no cited theorem produces a data-uniform bounding function from bare regularity, per-solution finiteness supplying no modulus, and the existence of such moduli is precisely the open subject of the quantitative program \cite{tao2021}; the tier's equivalence status is therefore recorded as open, not as separated, which is what the second falsification criterion of Section 5 puts at risk. Tier three: hyperdissipative and Galerkin regularity are the cited theorems; and any inference from an off-string model to the limiting equations requires uniform-in-microscale control of the defect, a bound of exactly the tier-two type, since with the vorticity functional the required uniformity statement is EBA itself restricted along the regularization. The three tiers are exclusive by their quantifier ranges and exhaustive over the two ranges by the qualitative-or-effective dichotomy on the named bounding function. *Warrant: tier one and the couplings are theorem grade; the exhaustiveness of the tiering over faithful axioms is definitional and carried at structural grade; the openness recorded at tier two is a status report, not a claim.* $\square$

The cascade run is now mechanical, and the table records it.

```{=latex}
\begin{table*}[t]\small\setlength{\tabcolsep}{4pt}\centering
\begin{tabular}{@{}>{\raggedright\arraybackslash}p{0.75in}>{\raggedright\arraybackslash}p{1.05in}>{\raggedright\arraybackslash}p{1.05in}>{\raggedright\arraybackslash}p{0.85in}>{\raggedright\arraybackslash}p{1.15in}>{\raggedright\arraybackslash}p{1.30in}@{}}
\toprule
Candidate & Consistency & Equivalence & Coupling & Breadth & Verdict\\
\midrule
BAR & tied to the GR side & equivalent (Thm 5) & proved (Thm 4) & zero (Thm 5) & refused: circular\\
L3B & tied to the GR side & equivalent (Thm 5) & proved (Thm 4) & zero (Thm 5) & refused: circular\\
CFCq & tied to the GR side & equivalent (Thm 5) & proved (Thm 4) & zero (Thm 5) & refused: circular\\
EBA & no known obstruction & open; implies GR & proved (Thm 4) & certificates; stability moduli & conditional; mass route open\\
CFCe & no known obstruction & open; implies GR & proved (Thm 4) & depletion moduli; alignment & conditional; mass route open\\
\bottomrule
\end{tabular}
\caption{The cascade run on the five candidates. The consistency entries for the circular tier record Theorem 5's consequence that the base plus the candidate is consistent exactly when the base plus GR is; the breadth entries for the effective tier name the consequence families of the adjoining paragraphs.}
\end{table*}
```

The breadth entries deserve their one paragraph each, because breadth is the whole difference between a decree and a structured extension. Under the base plus EBA, the bounding function $F$ yields explicit continuation certificates, a computable time-step and threshold at which a numerical solution's fidelity certifies continued regularity for the true solution, sharpening the a posteriori program of \cite{ccrt2007} from per-computation certificates to an a priori schedule; and it yields explicit weak-strong stability moduli, a Gronwall radius within which perturbed data remain regular for a computable time. Both are statements naming $F$ and are not known to be theorems of the base plus bare GR, which names no modulus; they are counted at the grade proved-from-the-candidate, and their independence from the base plus GR is recorded as open. Under the base plus CFCe, the coherence scales $\rho_*,\Omega_*$ quantify the depletion-of-nonlinearity mechanism of \cite{constantinfefferman1993}, yielding explicit vortex-stretching bounds on the high-vorticity set; and the axiom has an empirical face, the observed alignment statistics of the vorticity field in turbulent flow, which is corroboration at evidence grade and, per the discipline this paper inherits, carries zero warrant in either direction. The geometric reading of the problem earns exactly this much: it points the search at the coherence functional, at premise grade, and the pointing is where its authority ends.

## The mass ledger

The strict accounting is now run, because the paper's thesis is that axiom formulation is real mathematics exactly when this ledger is nonzero, and the ledger's gates are external by design. The parent discipline's admission cascade for authored mass requires, in order: an object-level contribution; survival of renaming; clearance against the literature; more than a two-line corollary; an external witness; independence of the witness from the claimant; a reproducible artifact; and a closed gap audit. The first four can be evaluated on the page; the last four cannot be evaluated by the author at all, and any self-issued certificate at those gates is void where issued.

Run on this paper's objects the ledger reads as follows, and it is printed rather than implied. The instrument AXF and the trichotomy are arrangement: they organize cited theorems and elementary logic, they author no object-level mathematics, and their ledger line is zero by the first gate, which is the correct and intended reading of a method paper. The formulation BAR is the hypothesis of the Beale-Kato-Majda criterion under a new name and fails clearance and triviality together, its conditional theorem being a two-line corollary of Theorem 3; its ledger line is zero, and Theorem 5 is the proof. The formulations L3B and CFCq fail identically against \cite{ess2003} and \cite{constantinfefferman1993}. The formulation EBA names a statement the quantitative literature already treats as its target \cite{tao2021, ccrt2007}, so its formulation line is zero on clearance even though its tier is right; CFCe similarly rides a mechanism owned by \cite{constantinfefferman1993}. The paper's own ledger is therefore zero on every line, stated without discomfort, because the trade the ledger enforces is the point: a nonzero line is earnable here only by a tier-two formulation that is new against the literature, arrives with a proved consequence network of the kind the breadth paragraphs sketch, and then survives external, independent verification. That is the exact shape of the set-theoretic exhibits \cite{godel1947, martinsteel1989}, where the mass was never the axiom sentence but the proved network around it, and it is the only door this paper leaves open, deliberately, with its hinges oiled.

# Falsifiable Criteria

Three criteria, each forced by a named result of this paper, each parameter-free, each stated with the event that fires it and the single claim of this paper that falls.

**F1, the chain criterion.** The prediction: no triple exists consisting of an admissible datum, its maximal strong solution, and a finite $T_*$, with $\int_0^{T_*}\|\omega\|_{L^\infty}\,dt<\infty$. Confirmation method: none is required, the criterion being a standing invitation; the firing event is a written construction of such a triple, refereed or machine-checked in a contemporary proof assistant, verified by at least two independent parties. Expected outcome while the paper stands: every finite-time singularity scenario carries a divergent vorticity actuation integral. Null hypothesis, exact: one exhibited triple. Necessity: Proposition 2's Osgood closure entails the divergence, so the criterion is the closure's negation, forced. Blast radius: Theorem 3, and with it Theorem 4's BAR clause and Theorem 5's BAR row; nothing above them.

**F2, the separation criterion.** The prediction: no sentence of the base language separates a circular-tier candidate from GR, and no theorem of the base separates a tier-two candidate downward, that is, no proof of base plus GR deriving EBA or CFCe exists at the time of writing, this being recorded as open rather than impossible. Firing events, either of: a sentence $\varphi$ with a derivation of $\varphi$ from the base plus BAR and a proof that the base plus GR does not derive $\varphi$, which would refute Theorem 5; or a proof of base plus GR deriving EBA, which would collapse tier two into tier one and refute Proposition 6's tiering as stated. Necessity: Theorem 5 and Proposition 6 jointly entail the prediction, forced. Blast radius: Theorem 5 and the tier boundary of Proposition 6.

**F3, the extraction criterion, running against the author.** The prediction: no correct algorithm exists whose inputs are invariant under the reflection that implements negation in the paper's verdict geometry, equivalently whose inputs carry no orientation information about the target string, and whose output is the truth value of GR with a proof of correctness. Firing event: such an algorithm exhibited with its correctness proof, independently verified. Necessity: gate A8 and the guide-only typing of the geometric reading entail the prediction; an extractor would refute exactly the aperture clause this paper's instrument is built on. Blast radius: the aperture clause of AXF and the guide-only status assigned to the geometric register in Sections 1 and 4; the analytic theorems of Section 4 stand independently of it.

# Discussion

The legitimacy question can now be answered in the sharp form it deserves, because the machinery makes the answer a case analysis rather than a sensibility. Using an axiom is legitimate conditional mathematics under three conditions that the cascade enforces mechanically: the axiom is disclosed and typed as a hypothesis; it is not provably equivalent to the target, gate A2, since an equivalent axiom is the conclusion in costume and Theorem 5 shows the costume can be cut off by a two-line proof; and no unconditional claim is made, in particular no claim on the standard problem \cite{fefferman2000}, whose ambient base is fixed and for which changing the base changes the problem. Cheating is then not a mood but a location: it is the assertion of a conditional as unconditional, the concealment of a proved equivalence, or the presentation of a base change as a solution. Everything this paper does sits on the legitimate side of each line, and the price of sitting there is printed in the mass ledger: zero.

The set-theoretic comparison is the load-bearing precedent and it cuts both ways. Large cardinal and determinacy axioms earned admission exactly as gate A5 demands, through consequence networks spanning descriptive set theory, calibrated consistency strengths, and an interpretability hierarchy \cite{godel1947, martinsteel1989, simpson2009}; the community's acceptance followed the proofs, not the postulation, which is the external-witness discipline of the mass ledger operating at civilizational scale. The same precedent condemns the one-target decree: an axiom whose entire consequence set is the target's equivalence class has, by Theorem 5's mechanism, literally nothing to offer that assuming the target did not already offer. The cascade is therefore not a bureaucratic overlay on mathematical practice; it is mathematical practice, compiled.

The implications for the analytic problem are concrete. First, the trichotomy is a router for proposals: any argument of the form a physical principle implies regularity must declare its landing, and the router disposes of it mechanically, off-string proposals owing a uniformity input, qualitative on-string proposals collapsing into the conclusion, and only effective proposals surviving to be judged on breadth. Second, the surviving tier localizes the open content of the problem in a single place, the effectivity gap: what is missing is not another criterion, the roster is rich, but a data-uniform modulus for any one member of it, and the quantitative program \cite{tao2021} together with the certification program \cite{ccrt2007} are exactly attacks on that gap. Third, the geometric register keeps an honest job, smaller than prophecy and larger than decoration: it selects which functional to make effective, the coherence scale being its native candidate, and it does so at premise grade.

Anticipated objections are engaged on their merits. That the trichotomy's tier one is obvious once stated: agreed, and its value is exactly that of an obvious lemma nobody had made load-bearing, since published motivation-first proposals routinely occupy tier one without noticing, and a two-line equivalence proof now meets them at the door. That tier two might be empty of genuinely new candidates: possibly, and gate A4 is what says so today; the door is specified, not populated. That the walls \cite{tao2016} might also bar the effective tier's methods: the wall bars a method class for proving GR outright, and says nothing against an axiom-conditional development; the two live at different registers, and conflating them is the register error gate A6 exists to catch. That an algorithmic screen is scientism: the screen automates only the checkable parts, equivalence against a theorem roster, breadth counting, typing, and leaves truth entirely to proof, which is the opposite of scientism.

The limitations and the fence are stated without decoration. This paper resolves no case of the standard problem and claims no progress on its truth value; its conditional theorems are corollaries of cited criteria plus disclosed hypotheses; its classification is exhaustive only over the faithful class it defines, and a candidate escaping that class by construction, a genuinely new functional outside the roster with its own continuation theorem, would be new analysis first and cascade fodder second, which would be the best possible outcome; the breadth claims for the effective tier are proved from the candidates and their independence from bare regularity is open; the physical motivation carries zero warrant everywhere; and community acceptability, which the cascade can discuss, is a sociological quantity that confers no evidential weight in either direction. The mass ledger of Section 4.5 is the paper's own accounting of its own contribution and it reads zero on every line by the paper's own gates.

The positioning of this work against the prior art is stated in the two positioning tables under a fixed vocabulary, defined once. Kin marks a position this paper is continuous with and builds on as cited. Additive marks a position to which this paper supplies a result or framing it lacked while leaving it standing. Scoping marks a position kept intact inside a stated boundary. Subsuming marks a claim that becomes a case of this paper's classification. Corroborating marks independent agreement, counted at zero warrant. Superseding and contradicting are used nowhere; this paper supersedes no theory and contradicts none.

```{=latex}
\begin{table*}[t]\footnotesize\setlength{\tabcolsep}{4pt}\centering
\begin{tabular}{@{}>{\raggedright\arraybackslash}p{1.30in}>{\raggedright\arraybackslash}p{1.45in}>{\raggedright\arraybackslash}p{2.05in}>{\raggedright\arraybackslash}p{0.72in}>{\raggedright\arraybackslash}p{0.78in}@{}}
\toprule
Prior position & What it holds & What this paper does with it & Relation & Evidence\\
\midrule
Leray 1934; Hopf 1951 & global weak solutions, energy inequality & taken as base; Theorem A & Kin & cited\\
Fujita-Kato 1964; Kato 1972 & local strong theory, blowup alternative & taken as base; Theorem B; decay leg in Prop.~6 & Kin & cited\\
Beale-Kato-Majda 1984 & vorticity continuation criterion & reproved as Theorem 3; its hypothesis, as an axiom, shown GR-equivalent & Additive, Kin & cited\\
Prodi 1959; Serrin 1963 & weak-strong uniqueness; integrability criteria & Theorem E; criteria enter the roster at tier one & Kin, Subsuming & cited\\
Escauriaza-Seregin-Sverak 2003; Seregin 2012 & endpoint criterion; critical-norm necessity & Theorem F; L3B shown circular & Subsuming & cited\\
Caffarelli-Kohn-Nirenberg 1982 & partial regularity of suitable solutions & scopes the singular geometry the axioms address & Scoping & cited\\
Constantin-Fefferman 1993 & direction coherence forbids blowup & Theorem G; CFCq shown circular; CFCe seated at tier two & Additive, Subsuming & cited\\
Chernyshenko-\allowbreak Constantin-\allowbreak Robinson-\allowbreak Titi 2007 & a posteriori numerical certification & named as a breadth leg of EBA & Additive & cited\\
\bottomrule
\end{tabular}
\caption{Positioning against the prior art, part i of ii, rows one to eight. One row per position the body engages; relation words as defined in the run-in above; superseding and contradicting used nowhere.}
\end{table*}

\begin{table*}[t]\footnotesize\setlength{\tabcolsep}{4pt}\centering
\begin{tabular}{@{}>{\raggedright\arraybackslash}p{1.30in}>{\raggedright\arraybackslash}p{1.45in}>{\raggedright\arraybackslash}p{2.05in}>{\raggedright\arraybackslash}p{0.72in}>{\raggedright\arraybackslash}p{0.78in}@{}}
\toprule
Prior position & What it holds & What this paper does with it & Relation & Evidence\\
\midrule
Lions 1969 & hyperdissipative global regularity & anchors tier three & Subsuming & cited\\
Tao 2016 & averaged blowup; energy-method wall & kept as a method-class boundary at its own register & Scoping & cited\\
Tao 2021 & quantitative bounds program & names the effectivity gap tier two isolates & Kin & cited\\
Buckmaster-Vicol 2019; Albritton-\allowbreak Brue-\allowbreak Colombo 2022 & nonuniqueness below and in the forced Leray class & scopes the weak-class wilderness the axioms bypass & Scoping & cited\\
Fefferman 2000 & the standard problem statement & conditional results kept strictly outside its scope & Scoping & documentary\\
Godel 1947; Martin-Steel 1989 & axiom extension by consequence networks & mechanized as gates A4 to A6; the ledger's exhibit & Kin, Additive & cited\\
Simpson 2009 & calibration of theorems to axioms & the equivalence gate A2 is its local instance & Kin & cited\\
\bottomrule
\end{tabular}
\caption{Positioning, part ii of ii, rows nine to fifteen; same contract as part i.}
\end{table*}
```


# Conclusion

The gap this paper addressed was never the absence of criteria for Navier-Stokes regularity but the absence of a discipline for the axioms people are tempted to bolt onto them. The resolution proposed is a screening cascade whose gates are theorems where theorems exist and typed disclosures where they do not, together with a trichotomy proving that the temptation's natural products are equivalent to the conclusion, that the only survivable tier is the effective one, and that off-string physical postulates owe a uniformity input before they touch the equations at all.

The primary falsifiable criterion is the chain criterion F1: one smooth-data solution with finite maximal time and finite vorticity actuation integral, exhibited and independently verified, refutes Theorem 3 and everything resting on it. The invitation is genuine, the threshold is exact, and the community best placed to fire it, or to certify that it cannot be fired, is the one already working the quantitative and certification programs.

The single most important open question the paper leaves is the one it deliberately isolates: whether any data-uniform modulus, for any functional of the continuation roster, is a theorem of the base, or failing that, of the base plus a tier-two axiom that is new against the literature and arrives with a proved consequence network. Formulating such an axiom, proving its network, and surviving external verification is, on this paper's own accounting, the rare case in which axiom formulation is authored mathematics; nothing in this paper reaches that bar, and the paper says so in its own ledger.

Acceptance of the classification would entail one reframing, statable in a sentence: for this problem, the mathematics of adding an axiom is exactly the mathematics of producing an effective bound, and everything else that wears the word axiom is either the conclusion, a physics essay, or both.

# Appendix: Author's Provenance and Method Disclosure {-}

This paper was developed under Trisduction, a verification and organizing discipline that adds the cited results no warrant; the method and its executable batteries are stated in full at the reference below.

```{=latex}
\begin{thebibliography}{99}
\bibitem{leray1934} Leray, J. 1934. Sur le mouvement d'un liquide visqueux emplissant l'espace. \emph{Acta Mathematica} 63, 193--248.
\bibitem{hopf1951} Hopf, E. 1951. Uber die Anfangswertaufgabe fur die hydrodynamischen Grundgleichungen. \emph{Mathematische Nachrichten} 4, 213--231.
\bibitem{fujitakato1964} Fujita, H., and T. Kato. 1964. On the Navier-Stokes initial value problem. I. \emph{Archive for Rational Mechanics and Analysis} 16, 269--315.
\bibitem{kato1972} Kato, T. 1972. Nonstationary flows of viscous and ideal fluids in $\mathbb{R}^3$. \emph{Journal of Functional Analysis} 9, 296--305.
\bibitem{prodi1959} Prodi, G. 1959. Un teorema di unicita per le equazioni di Navier-Stokes. \emph{Annali di Matematica Pura ed Applicata} 48, 173--182.
\bibitem{serrin1963} Serrin, J. 1963. The initial value problem for the Navier-Stokes equations. In \emph{Nonlinear Problems}, ed. R. E. Langer, 69--98. Madison: University of Wisconsin Press.
\bibitem{ladyzhenskaya1969} Ladyzhenskaya, O. A. 1969. \emph{The Mathematical Theory of Viscous Incompressible Flow}. 2nd ed. New York: Gordon and Breach.
\bibitem{katoponce1988} Kato, T., and G. Ponce. 1988. Commutator estimates and the Euler and Navier-Stokes equations. \emph{Communications on Pure and Applied Mathematics} 41, 891--907.
\bibitem{bkm1984} Beale, J. T., T. Kato, and A. Majda. 1984. Remarks on the breakdown of smooth solutions for the 3-D Euler equations. \emph{Communications in Mathematical Physics} 94, 61--66.
\bibitem{ckn1982} Caffarelli, L., R. Kohn, and L. Nirenberg. 1982. Partial regularity of suitable weak solutions of the Navier-Stokes equations. \emph{Communications on Pure and Applied Mathematics} 35, 771--831.
\bibitem{ess2003} Escauriaza, L., G. Seregin, and V. Sverak. 2003. $L_{3,\infty}$-solutions of Navier-Stokes equations and backward uniqueness. \emph{Russian Mathematical Surveys} 58, 211--250.
\bibitem{seregin2012} Seregin, G. 2012. A certain necessary condition of potential blow up for Navier-Stokes equations. \emph{Communications in Mathematical Physics} 312, 833--845.
\bibitem{kochtataru2001} Koch, H., and D. Tataru. 2001. Well-posedness for the Navier-Stokes equations. \emph{Advances in Mathematics} 157, 22--35.
\bibitem{constantinfefferman1993} Constantin, P., and C. Fefferman. 1993. Direction of vorticity and the problem of global regularity for the Navier-Stokes equations. \emph{Indiana University Mathematics Journal} 42, 775--789.
\bibitem{ccrt2007} Chernyshenko, S. I., P. Constantin, J. C. Robinson, and E. S. Titi. 2007. A posteriori regularity of the three-dimensional Navier-Stokes equations from numerical computations. \emph{Journal of Mathematical Physics} 48, 065204.
\bibitem{lions1969} Lions, J.-L. 1969. \emph{Quelques methodes de resolution des problemes aux limites non lineaires}. Paris: Dunod.
\bibitem{tao2016} Tao, T. 2016. Finite time blowup for an averaged three-dimensional Navier-Stokes equation. \emph{Journal of the American Mathematical Society} 29, 601--674.
\bibitem{tao2021} Tao, T. 2021. Quantitative bounds for critically bounded solutions to the Navier-Stokes equations. In \emph{Nine Mathematical Challenges: An Elucidation}, Proceedings of Symposia in Pure Mathematics 104, 149--193. Providence: American Mathematical Society.
\bibitem{buckmastervicol2019} Buckmaster, T., and V. Vicol. 2019. Nonuniqueness of weak solutions to the Navier-Stokes equation. \emph{Annals of Mathematics} 189, 101--144.
\bibitem{abc2022} Albritton, D., E. Brue, and M. Colombo. 2022. Non-uniqueness of Leray solutions of the forced Navier-Stokes equations. \emph{Annals of Mathematics} 196, 415--455.
\bibitem{fefferman2000} Fefferman, C. L. 2000. Existence and smoothness of the Navier-Stokes equation. Clay Mathematics Institute Millennium Prize Problem description. Cambridge, MA: Clay Mathematics Institute.
\bibitem{godel1947} Godel, K. 1947. What is Cantor's continuum problem? \emph{American Mathematical Monthly} 54, 515--525.
\bibitem{martinsteel1989} Martin, D. A., and J. R. Steel. 1989. A proof of projective determinacy. \emph{Journal of the American Mathematical Society} 2, 71--125.
\bibitem{simpson2009} Simpson, S. G. 2009. \emph{Subsystems of Second Order Arithmetic}. 2nd ed. Cambridge: Cambridge University Press.
\bibitem{majdabertozzi2002} Majda, A. J., and A. L. Bertozzi. 2002. \emph{Vorticity and Incompressible Flow}. Cambridge: Cambridge University Press.
\bibitem{trisduction} Islam, M. TRISDUCTION: A Linguistically, Topologically, and Mathematically Sealed Verification Architecture. Triaxial Orthogonality, Twelve-Gate Closure, the Quaternionic Completion, the Root Axiom, and the Master Pre-Sealed Proposition Ledger. Zenodo, version 4, 19 June 2026. DOI 10.5281/zenodo.20757507. https://zenodo.org/records/20757507. Mirror: PhilArchive record ISLTTG, https://philpapers.org/rec/ISLTTG. Master reference, continuously updated at the same location.
\end{thebibliography}
```
