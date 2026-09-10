---
title: Closure and the Limits of Forced Results
subtitle: >-
  An information-theoretic criterion for when a forced-breakdown theorem transports to the system it is read as being about, with three consequences separated by carrier and one worked case
article_type: Foundations of Applied Mathematics
author_line: Mohammad F. Islam, PhD
affiliation: Independent researcher
date: 10 September 2026 · sealed, audit cycle clo-20260910
short_title: Closure and the Limits of Forced Results
accenthex: B87333
keywords: closure; mutual information; forced systems; transport of results; Navier--Stokes; self-representation; Landauer bound
abstract: >-
  A large and growing class of results establishes that some system breaks down in finite time when a force is supplied to it from outside. Such results are stated for a system on a fixed background, and they are read, in transit, as statements about the thing the system models. This paper gives a criterion for when that reading is licensed. We define an interaction domain by mutual information against the complement, state two axioms, and derive three consequences that separate by carrier: a domain admits no agent outside itself and no structured position outside itself, both conditional on the closure axiom, and no system indexes all of its own binary properties, which is unconditional and classical. We then prove a transport theorem: a forced-breakdown result transports to a system S only if S is not closed, and its hypothesis is unsatisfiable at any closed system. The theorem adjudicates a reading and never a theorem, and we prove for the worked case that the reading and the theorem come apart. Taking the 2026 forced Navier--Stokes construction as that case, we show by its own hypothesis that its fluid is not closed, so the transport theorem leaves its mathematics entirely untouched, and we show that the popular reading of it identifies its fluid with a closed system, at which point the transport theorem applies and the reading fails. The result is therefore total against the identification and empty against the mathematics, and we argue that this is the correct shape for a criterion of this kind.
---

# Introduction

Results of the following shape are now common. For a given evolution equation, one exhibits a smooth external force and a datum such that the solution fails to extend past a finite time. Recent instances cover the incompressible porous-media equation, the Boussinesq system, three-dimensional Euler with a smooth force, hypodissipative Navier--Stokes, and, in a construction released on 8 September 2026, full viscous Navier--Stokes under a smooth compactly supported force. Each is stated for a system on a fixed background with finite energy and prescribed decay.

Between the statement and its reception, a step occurs that is not in any of these papers. The system is identified with the thing it models, and the result is read as a statement about that thing: a fluid breaks, a medium admits a singularity, reality has a terminus. This paper is about that step. We give a criterion for when it is licensed, prove that it fails at a precisely characterised class of systems, those we call closed and define in section 2, and show for one worked case that the criterion leaves the underlying theorem entirely alone while retiring its popular reading.

Two commitments shape what follows. First, the criterion adjudicates a reading, never a theorem: nothing here bears on whether any construction's estimates hold, and a construction confirmed at full strength leaves every result below standing. Second, every consequence is reported with the premise it consumes, and the three principal consequences separate by carrier, one of them requiring no premise of ours at all.

# The interaction domain

A **system** is a variable taking at least two distinguishable values. Two systems are **directly related** when their joint law does not factor,
$$ I(A;B) \;=\; \sum_{a,b} p(a,b)\,\log_2\frac{p(a,b)}{p(a)\,p(b)} \;>\;0 . $$

**Definition 1 (Interaction domain).** A collection $D$ of systems is an interaction domain when membership is settled against the complement:
$$ A \in D \iff I\bigl(A \;;\; D\setminus A\bigr) > 0 . $$

The complement form is required, not stylistic. Membership tested pairwise fails to see dependence carried by higher-order structure. Let $X$ and $Y$ be independent uniform bits and $Z = X \oplus Y$. Then all three pairwise mutual informations vanish, while $I(Z\,;X,Y) = 1$ bit exactly, and symmetrically for $X$ and for $Y$. A pairwise criterion places three fully interdependent systems in three separate domains; the complement criterion places them in one. Numerically, at $4\times 10^5$ samples, every pairwise value sits below $10^{-5}$ bits and the complement value returns $1.000000$.

**Definition 2 (Closed).** A system $S$ is **closed** when $S$ is an interaction domain, that is when nothing outside $S$ carries positive mutual information with it.

# The axioms

**RAF-1 (Registration).** An event is an interaction if and only if it carries strictly positive mutual information between the systems it relates. An event carrying zero bits relates nothing.

**RAF-2 (Closure).** An interaction domain is closed under interaction: if $I(s\,;D) > 0$ then $s \in D$.

We fix one further term, since the results below turn on it. A system $s$ **acts on** a system or collection $S$ when the evolution of $S$ is conditioned on the state of $s$, which is to say when $I(s\,;S) > 0$. Acting, conditioning and interacting are one relation under RAF-1 and we use the three words interchangeably.

RAF-1 is analytic in this register: it fixes what counts as an interaction and adds no content beyond Definition 1. RAF-2 carries the paper's single substantive premise and every conditional result below consumes it and nothing else.

The empirical content that a thermodynamic statement of the same axiom would carry is not lost but relocated, and we name the relocation rather than leaving it implicit.

**BR-L (Landauer bridge).** An interaction carrying $n$ bits, irreversibly registered at temperature $T$, dissipates at least $n k_B T \ln 2$ of heat.

BR-L is measured: Landauer's bound was confirmed at single-bit scale by Bérut et al. (2012) and tightened by Jun, Gavrilov and Bechhoefer (2014), with the Jarzynski equality and the Crooks fluctuation theorem covering the general non-equilibrium case and the Mandelstam--Tamm and Margolus--Levitin bounds the temporal floor. A result stated in the information register cites RAF-1 and RAF-2 alone. A result claiming anything about energy, matter or duration cites BR-L and inherits its experimental standing. Naming the bridge is what keeps an information-theoretic derivation from acquiring thermodynamic authority it has not earned.

# Three consequences, separated by carrier

**Theorem 3 (No exterior agent).** Let $D$ be an interaction domain. Then no $s \notin D$ acts on $D$.

*Proof.* Suppose $s \notin D$ acts on $D$. By the definition of acting, $I(s\,;D) > 0$; by RAF-2, $s \in D$, contradicting the supposition. $\square$

**Theorem 4 (No faithful self-representation).** Let $X$ be a system whose collection of binary properties is a set, or an object of the relevant cartesian closed category. Then $X$ does not index all of them.

*Proof.* For finite $X$ there are $2^{|X|}$ binary properties and $|X|$ indices, and $2^k > k$ for every $k \ge 1$; the general case is the contrapositive of Lawvere's fixed-point theorem. $\square$

**Theorem 5 (No structured exteriority).** Any structured attempt to occupy a position outside $D$ lies in $D$.

*Proof.* Such an attempt registers something, hence carries $I > 0$ with $D$, hence lies in $D$ by RAF-2. $\square$

The three separate by carrier, and the separation is the paper's most useful structural property. Theorem 4 is unconditional and classical: it requires no axiom of ours and would stand if RAF-2 were abandoned entirely, within the scope its carriers reach and no wider. Theorems 3 and 5 consume RAF-2 and no classical theorem reaches them, because the diagonal family bars self-indexing maps while these bar exogenous relata, and those are different relations.

We record the scope of Theorem 4 precisely because it is the one result here that costs nothing: Cantor requires a set and Lawvere a cartesian closed category with the relevant exponential, so a system whose property collection is a proper class lies outside both carriers and the theorem is not claimed there.

# The transport theorem

**Definition 6 (Forced-breakdown result).** A forced-breakdown result for a system $S$ is a theorem asserting the existence of a forcing term $f$ under which the evolution of $S$ fails to extend past a finite time, where $f$ is **exogenous** to $S$: $f \notin S$, and $f$ conditions the evolution of $S$. Exogeneity is the required property and it is stronger than functional independence, since an internal degree of freedom with its own autonomous dynamics is not a functional of the rest of the state while still belonging to the system.

**Theorem 7 (Transport).** Let $R$ be a forced-breakdown result for $S$. If $S$ is closed, the hypothesis of $R$ is unsatisfiable and $R$ is vacuously inapplicable to $S$. Consequently $R$ transports to $S$ only if $S$ is not closed.

*Proof.* Suppose $S$ is closed and $R$ applies. By Definition 6 there is $f$ with $f \notin S$ conditioning the evolution of $S$, so $I(f\,;S) > 0$ and $f$ acts on $S$. This contradicts Theorem 3 with $D = S$. $\square$

Three registers follow immediately and must be kept apart.

For a system on a fixed background with an exogenous force, the system is not closed and the transport theorem says nothing: the result applies to that system exactly as proved.

For a closed system, no force in the sense of Definition 6 exists, and a forced-breakdown result has no purchase there, not because its mathematics fails but because its hypothesis has no instance.

For a total system, that is one for which no system whatever lies outside, the same conclusion follows with an additional consequence from Theorem 5: not only does no external supplier exist, but no structured attempt to occupy the supplier's position succeeds, since any such attempt lands inside the system it would stand outside of.

# The worked case

We take as the worked case the construction released on 8 September 2026 under the author line OPENAI, which asserts that for every viscosity there exist a smooth compactly supported force and a smooth solution of the three-dimensional incompressible Navier--Stokes system on $\mathbb{R}^3\times[0,1)$, from rest, with bounded energy and unbounded velocity as $t \uparrow 1$.

**Proposition 8.** The fluid of that construction is not closed.

*Proof.* Three independent grounds, each from the construction's own statement. Its force is exogenous by hypothesis, being neither a member of the fluid nor a functional of its state; therefore something outside the fluid carries positive mutual information with it, and Definition 2 fails. Its background is fixed and its decay conditions are imposed at spatial infinity, and both condition the evolution from outside the state space. And its force is by construction correlated with the flow while not being the flow. $\square$

**Corollary 9.** Theorem 7 does not apply to that construction, and nothing in this paper bears on whether its estimates hold.

This is the paper's substantive negative result and we state it without qualification. The transport theorem is empty against the mathematics of any forced-breakdown result stated for an open system, which is to say against every such result we are aware of, including the one taken as the worked case. A reader looking here for a refutation of that construction will not find one, and we do not believe one is available by this route.

**Proposition 10.** The reading under which such a construction is a statement about a closed or total system identifies its system with one, and at that identification Theorem 7 applies and the reading fails.

*Proof.* Immediate from Theorem 7 and Proposition 8: the identification asserts of the construction's fluid a property, closure, which by Proposition 8 it does not have, and under which by Theorem 7 the construction's own hypothesis is unsatisfiable. $\square$

The identification is not in the construction. It is supplied by the reading, and it is the single step at which a theorem about a forced system on a fixed background becomes a statement about the thing that system models. Proposition 10 says that this step is available only where the modelled thing is open, and that it is barred wherever the modelled thing is closed.

# The undecided word

There is a second failure in the reading, independent of transport, and it sits inside the construction's own register rather than at its boundary. It concerns a single word.

**Proposition 11.** For a forced-breakdown result in which the forcing term vanishes to infinite order at the singular point, the proposition *the force causes the breakdown* is field-permitted in both directions and settled in neither, and the two permissions are exhibited by the result itself.

*Proof.* One direction is exhibited by the construction: the forcing term is present, the system holds with it, and the solution is singular, so nothing in the system forbids the causal reading. The other is exhibited by the limit lemma: the force and all of its derivatives vanish at the singular point, so the force performs nothing where the velocity diverges and the concentration proceeds by inertia against dissipation, and nothing in the system forbids the non-causal reading. The two are consistent because *causes* is not a predicate of the object language. The system contains the identity $R(u,p) = f$ and contains no relation ranking one term as cause of another; the identity is symmetric in exactly the way causation is not. $\square$

**Corollary 12.** No proof of a forced-breakdown result of this shape settles whether its force causes the breakdown, and settling it would require a resource the formal register does not have.

*Proof.* Immediate from Proposition 11. What would decide the question is not a further derivation but a determination of which term acts, and acting is a relation between systems rather than a relation between terms. By Theorem 3 the acting relation is carried by mutual information, and a formal identity carries none: $R(u,p)$ and $f$ are the same object under two names. $\square$

This matters because it is the word the reception rests on. A result of this class is carried in transit as *a force drives the system to breakdown*, and Proposition 11 says that the driving is exactly the part the result leaves undecided, while the parts it does decide, the existence of the field and the regularity of the residual, are not what the sentence is about.

**An everyday case.** Consider a bicycle at the top of a long hill. You give it a push and let go, and it rolls down and eventually crashes at the bottom. Now ask what caused the crash.

Your push is real, and without it the bicycle would have stayed where it was, so there is a straightforward sense in which your push caused the crash. But the push ended at the top of the hill. At the moment of the crash your hand is a hundred metres away and doing nothing at all, and what is happening at the crash is gravity, momentum and the road. So there is an equally straightforward sense in which the push did not cause the crash and only set up the conditions under which the hill did.

Both readings are honest. Neither is refuted by anything you can measure about the bicycle. And crucially, no amount of further study of the bicycle's trajectory will settle it, because the disagreement is not about the trajectory. It is about the word *cause*, and the trajectory does not contain that word.

The forced constructions are in exactly this position, with one detail sharper. The force is not merely absent at the moment of breakdown in the loose sense that your hand was far away; the construction's own lemma states that the force and every one of its derivatives is exactly zero at the singular point. The push is provably not touching the bicycle when it crashes. And unlike the bicycle, where you could at least film the push and the crash and argue about the film, the construction contains no film: it contains an equation that says the force equals the residual, which is true in both directions and picks no direction, the way *height equals length times width* picks neither the height nor the area as the cause of the other.

So the honest report of a result of this class is the one its mathematics supports: an arrangement exists in which a system with a smooth external force becomes singular in finite time, and the force is silent at the point where it does. Whether that counts as the force *driving* the system is not a question the result answers, and it is the only question the headline asks.

# Discussion

The shape of this result is worth stating plainly, because it is unusual and we regard it as correct rather than as a limitation.

The transport theorem is **total against the identification and empty against the mathematics**. It retires a reading completely and touches no proof at all. A criterion that also refuted the underlying theorems would be doing two jobs, and the second job would be done badly, since whether a construction's estimates hold is a question for its own proof or its own machine verification and not for an information-theoretic criterion. Keeping the two jobs apart is what allows the first to be done without qualification.

Three consequences for practice follow. A forced-breakdown result, in the sense of Definition 6, should state the openness of its system explicitly, since that is the property on which its own hypothesis rests and on which its transportability depends; none of the results we surveyed does so. A reading that carries such a result to a closed or total system should identify the supplier, since Theorem 7 says the supplier is what the reading has silently assumed to exist. And a result whose force vanishes at the singular point should say so in its abstract, since by Proposition 11 that fact decides how the result may be described and it is the description, not the theorem, that travels.

Finally, we note what the framework here does not decide. It removes one route to a finite-time terminus at a closed system and supplies no route to its denial. Whether such a system persists is not settled by Theorem 7, and we make no claim about it.

# Falsification

**F1.** Exhibit a closed system, in the sense of Definition 2, admitting a forcing term in the sense of Definition 6. Theorem 7 retires entirely.

**F2.** Exhibit two systems with zero mutual information and no chain of positive mutual information connecting them. RAF-2's substantive content, the uniqueness of the interaction domain, fails, and with it Theorems 3, 5 and 7, while Theorem 4 survives on its classical carriers. Causally disconnected regions in cosmology are the natural place to look and we regard this as the live falsifier.

**F3.** Exhibit a dependence structure that the complement criterion of Definition 1 fails to place in one domain. Definition 1 requires repair.

We note that F2 has a self-sealing character in one direction and we disclose it rather than argue it away: an exhibition of a system correlated with $D$ and not in $D$ is itself a registration, hence places the exhibited system inside $D$. The falsifier that is not self-sealing is the uniqueness claim as stated in F2, and it is the one we invite.


# Self-audit record

The paper was audited against itself before release under a fixed protocol: ten claims and their falsifiers registered and locked before the first round, three defects planted into a seeded copy each round and required to be caught before that round could count, six registers prosecuted, every repair verified by a propagation sweep run before and after the change. Four rounds, controls three of three in every round, sealed at the fourth. The rounds are single-substrate, which is a limitation stated rather than hidden: an adversary who is not the author has not read this paper.

Four findings were earned, two of them load-bearing on the central theorem.

**An undefined predicate under Theorem 3.** The proof read "acting is conditioning" and identified the two mid-proof, while *acting* was nowhere defined. The transport theorem descends through that step. Acting is now defined where the axioms are stated, and Theorem 3 cites the definition.

**An invalid inference in the proof of Theorem 7.** The proof concluded $f \notin S$ from "$f$ is not a functional of the state of $S$", and that does not follow: an internal degree of freedom with its own autonomous dynamics is not a functional of the rest of the state while still belonging to the system. Definition 6 now requires **exogeneity**, $f \notin S$, and distinguishes it from functional independence in the same sentence; the theorem cites membership directly. Proposition 8 was rechecked against the stronger definition and each of its three grounds survives.

**Two forward references.** *Closed* and *forced-breakdown result* appeared in the abstract and introduction before their definitions. Both are now signalled at first use.

**Two unmarked self-citations.** References 14 and 15 are the author's own and are now identified as such.

Every finding moved a claim toward saying exactly what its argument establishes, and the second strengthened a definition rather than a theorem. No finding moved a claim upward, and the protocol returns a fault if one does.

# References

1. R. Landauer, *Irreversibility and heat generation in the computing process*, IBM J. Res. Develop. **5** (1961), 183--191.
2. A. Bérut, A. Arakelyan, A. Petrosyan, S. Ciliberto, R. Dillenschneider, E. Lutz, *Experimental verification of Landauer's principle linking information and thermodynamics*, Nature **483** (2012), 187--189.
3. Y. Jun, M. Gavrilov, J. Bechhoefer, *High-precision test of Landauer's principle in a feedback trap*, Phys. Rev. Lett. **113** (2014), 190601.
4. C. Jarzynski, *Nonequilibrium equality for free energy differences*, Phys. Rev. Lett. **78** (1997), 2690--2693.
5. G. E. Crooks, *Entropy production fluctuation theorem and the nonequilibrium work relation*, Phys. Rev. E **60** (1999), 2721--2726.
6. G. Cantor, *Über eine elementare Frage der Mannigfaltigkeitslehre*, Jahresbericht der DMV **1** (1891), 75--78.
7. F. W. Lawvere, *Diagonal arguments and cartesian closed categories*, Lecture Notes in Mathematics **92** (1969), 134--145.
8. C. E. Shannon, *A mathematical theory of communication*, Bell System Tech. J. **27** (1948), 379--423.
9. C. L. Fefferman, *Existence and smoothness of the Navier--Stokes equation*, Clay Mathematics Institute Millennium Prize Problem statement, 2000.
10. D. Córdoba, L. Martínez-Zoroa, *Blow-up for the incompressible 3D Euler equations with a force*, arXiv:2309.08495.
11. D. Córdoba, L. Martínez-Zoroa, F. Zheng, *Finite time blow-up for the hypodissipative Navier--Stokes equations with a force*, Arch. Ration. Mech. Anal. **250** (2026).
12. L. Alpöge, T. Buckmaster, *Finite-time blowup with smooth forcing for the porous-media, Boussinesq and 3D Euler equations*, 2026.
13. OPENAI, *Finite time blowup for Navier--Stokes*, 8 September 2026.
14. M. F. Islam (the present author), *The forced alternative is a filter*, Zenodo, 2026, DOI 10.5281/zenodo.22670252.
15. M. F. Islam (the present author), *Integrable misalignment forbids blowup*, Zenodo, 2026, DOI 10.5281/zenodo.22665831.
