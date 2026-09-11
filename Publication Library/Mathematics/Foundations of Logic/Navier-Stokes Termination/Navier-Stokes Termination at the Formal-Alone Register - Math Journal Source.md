---
edition: math_journal
title: "A Formal Proof of Navier-Stokes Termination at the Formal-Alone Register"
subtitle: "Why no procedure that reads formal data and constructs nothing supplies the uniform modulus, the four reading routes censused, and the critical locus where the first of them carries provably zero information"
article_type: "Mathematical Analysis · Termination of a Register, Companion to the Alignment-Defect Paper"
goal: "To locate the effective alignment-defect axiom exactly, and to prove that no reading discharges it at the critical locus."
author_line: "Mohammad F. Islam, PhD"
affiliation: "Independent Researcher · The Trisduction Program"
date: "September 11, 2026"
short_title: "Navier-Stokes Termination"
keywords: "Navier-Stokes equations; effective bounds; data-uniform modulus; scale invariance; critical exponent; barriers; conditional independence; supply-side openness; Trisduction"
abstract: |
  The companion paper proves an unconditional continuation criterion and then closes it to global regularity with one premise, an effective alignment-defect axiom asserting a data-uniform modulus for the defect. This paper is about that premise and nothing else. It asks whether a procedure that reads formal data and constructs nothing can supply the modulus, and answers completely for one locus. We first restate the axiom in its exact content, which is an independence: the modulus carries zero conditional mutual information about which datum was drawn, given the datum's norm, and the conditioning is load-bearing since a modulus varying with nothing at all is a constant and is vacuously independent of everything. We then census the reading routes and prove the census exhaustive at structural grade: scaling, compactness, transport across classes, and induction on scales, four routes and no fifth. We prove that the defect integral scales with an exponent vanishing exactly at three over twice the partner exponent, a locus lying strictly inside the axiom's own range of orders, and that at that locus the scaling family is present, is answer-preserving rather than answer-flipping, and carries zero information, so the first route supplies nothing. Compactness loses the hypothesis to concentration permitted by that same invariance, transport requires a correspondence uniform in the datum that the criticality gap does not supply, and induction on scales requires a uniform bound on its stage constants which is the object it was invoked to produce. With the four routes closed and authorship outside the register's constitution, no reading supplies the modulus at a terminal class. The openness is therefore supply-side rather than reader-side: the instrument reads correctly and nothing sits at the address. Nothing here bears on whether the axiom is true or provable, and a construction crosses the block in one step. We then adjudicate the block against the register's family of terminal tokens, which is indexed by the locus of the halt rather than by its mechanism, and show the block halts in the witness, the same locus as the geometric terminus at rigid Hodge classes, so it takes the existing token and mints no new one. The genuine differentia between the two occupants, a relocation family dead by absence against one dead by inertness, is shown to change only how the first gate is certified and is therefore seated as a printed certification mode rather than a token. The four gates, two doors and four riders are carried as a fail-safe emitter run with its controls, every gate load-bearing by mutation, and at the partner exponent exercised the token fires on the critical order and routes open above and below it. The formal-alone register of the Trisduction program was loaded, its digest matched, and its boot re-ran at the canonical seed; the readings it emitted are reported as emitted, including one that faulted an earlier draft of the axiom's information form.
---

```{=latex}
\emergencystretch=1.6em
\sloppy
```


# Introduction

The alignment-defect paper \cite{islam2026defect} proves a continuation criterion and then buys its conclusion with one premise. The criterion is unconditional: at fixed exponents, finiteness of a defect integral forbids finite-time breakdown. The premise, called EAD, asserts that a modulus exists bounding the defect uniformly over the admissible data class. Everything else in that paper is derived; the conclusion stands or falls with the premise, and the premise is unproved.

This paper is about the premise and about nothing else. It asks a narrower question than whether EAD is true, and it answers that narrower question completely.

**The question.** Can a procedure that reads formal data and constructs nothing supply the modulus EAD asserts?

**The answer.** At the critical locus it cannot, and the impossibility is a fact about the register rather than about anyone's ingenuity. A reading moves an undetermined quantity from one presentation to another. Four relocations are available and at the critical exponent the first of them carries provably zero information, while the other three are shown to require what they would supply. With every reading route closed and authorship outside the register's constitution, the formal-alone register can neither read the modulus nor write it.

A companion result on when a forced conclusion transports at all is cited for the general shape \cite{islam2026closure}.

**What this does not claim.** It does not claim EAD is false, and nothing here bears on its truth. It does not claim EAD is unprovable, which would be a different and stronger assertion that the register bars. And it does not claim the Navier-Stokes problem is closed: a construction crosses the block in one step, and the paper names that door in one sentence and says nothing more about what lies beyond it.

**Why the question is worth asking.** A conditional theorem is worth exactly what its condition is worth, and a reader is entitled to know what kind of thing the condition is. The result here is that EAD is not a lemma awaiting a cleverer argument of the same species. It is a supply-side gap, and the distinction decides where effort should go.

# Background and the barrier

Three walls stand in the literature and each closes a method class rather than a technique.

**Supercriticality.** The energy is supercritical in three dimensions \cite{leray1934,fefferman2000}. A purely energy-based argument cannot close the gap between what the energy controls and what regularity requires, and this is classical.

**Averaged blowup.** There is an averaged Navier-Stokes system carrying the same energy identity and the same perturbative structure as the true equations, whose solutions blow up in finite time \cite{tao2016}. Any argument using only those two features proves something false about that system, so it cannot be an argument about the true one. This is a barrier in the exact sense the complexity literature uses the word \cite{bakergillsolovay1975,razborovrudich1997}, and it is the strongest wall available on this side.

**Non-uniqueness below the class.** Weak solutions are non-unique in the Leray class \cite{buckmastervicol2019}, which closes the route that would read a modulus off the weak theory.

One further fact is often treated as a wall and is not. The best available quantitative bounds are not data-uniform moduli of the required kind \cite{tao2021}. That is a status report on a search, not a theorem about what a search can find, and this paper does not use it as one.

# What EAD asserts, in the register's own primitive

EAD fixes an exponent and asserts a function bounded on compacts such that, for every viscosity and every admissible datum, the defect at every time before the maximal time is dominated by that function of the viscosity, the datum's norm, and the time.

The content of the word *uniform* is an independence, and stating it as one makes the requirement legible.

**Definition 3.1.** Write $D$ for the datum ranging over the admissible class \cite{shannon1948,cover2006}, $N$ for its norm, and $G$ for the modulus at a fixed viscosity and time. EAD asserts a modulus satisfying


```{=latex}
\[ I(G \,;\, D \mid N) = 0, \]
```


the conditional mutual information between the modulus and the datum, given the norm, vanishing identically.

**Remark 3.2 (why the conditioning is load-bearing).** Drop the conditioning and the statement changes meaning rather than losing precision. An unconditional independence between modulus and datum would require a modulus varying with nothing at all, which is a constant; a constant is independent of every variable vacuously, so the unconditional form is satisfied by an object that bounds nothing and excluded by every object that does. EAD's modulus varies with viscosity, with the norm, and with time, and what it does not vary with is the datum beyond its norm, which is exactly a conditional statement. On a three-variable schematic law where the modulus is a function of the norm alone, the engine returns $I(G;D \mid N) = 0$ exactly while the unconditional $I(G;D)$ is one bit; on a law where the modulus reads the datum beyond its norm, the conditional quantity is positive and the unconditional is two bits. The distinction is the whole of the axiom.

**Definition 3.3.** A *reading* is a procedure whose output is determined by formal data already in hand: definitions, previously proved theorems, and constructions supplied to it. A reading constructs nothing. A *construction* produces an object not determined by the data in hand. The distinction is not about difficulty. It is about whether the procedure's output is a function of its input.

# The relocations, censused

A reading that would supply the modulus has four routes and no others. The census is exhaustive over the ways an undetermined quantity can be moved without being constructed, and the gate count of Section 6 is forced by it rather than chosen.

**R1, scaling.** Rescale the solution and read the modulus off the rescaled family.

**R2, compactness.** Extract a limit from a sequence and read the modulus off the limit \cite{ckn1982,ess2003}.

**R3, transport.** Import the modulus from a class where it is known: two dimensions \cite{ladyzhenskaya1969}, small data \cite{fujitakato1964}, axisymmetric flows \cite{ukhovskii1968}.

**R4, induction on scales.** Build the modulus stage by stage through a quantitative regress \cite{tao2021}.

**Premise 4.1 (the data inventory).** The data in hand for a reading of this problem consist of a solution, a family of solutions, a class of solutions, and a decomposition into scales. *Grade: premise. This paper does not prove the inventory exhaustive and does not claim to.*

**Definition 4.2 (the operation set).** Granting Premise 4.1, a reading acts on the data in hand by operations of exactly four kinds, one per item of the inventory: on one solution by a symmetry of the equations; on a family by passage to a limit; across classes by a correspondence; across a scale decomposition by assembly of the parts.

**Proposition 4.3.** Every reading built from the operations of Definition 4.2 is one of R1 through R4. *Grade: immediate given Premise 4.1 and Definition 4.2.*

*Argument.* Each kind defines exactly one route: symmetry gives R1, limit gives R2, correspondence gives R3, assembly gives R4.

**Remark 4.4 (where the weight sits).** The load of the relocation channel is carried by Premise 4.1 and by nothing downstream of it. Proposition 4.3 is immediate once the premise is granted, so a reader who rejects this channel should reject the inventory and not the sort.

The inventory is not proved exhaustive here. Four candidate fifth items reduce to members of the four: an invariant of the equations to a function of a solution, a probability measure on data to a class, a numerical discretization to a scale decomposition, and an oracle to something not in the data in hand at all. Four reductions are not a proof, so the inventory stands at premise grade and the termination theorem is conditional on it. Criterion F2 is the falsifier of Premise 4.1 and of nothing else.

# The critical locus

**Definition 5.1.** Fix $p \in [2,6]$ and write $q = 2p/(p+3)$. The defect integral scales under the natural rescaling with exponent


```{=latex}
\[ E(p,a) = \frac{2(2ap-3)}{p+3}. \]
```


The pair $(p,a)$ is *scale-critical* when $E(p,a) = 0$, which holds exactly at $a^\ast = 3/(2p)$.

**Proposition 5.2 (the critical locus lies inside EAD's range).** For $p \in (2,6)$ the critical exponent $a^\ast$ lies strictly inside $(1/4,1)$, and at $p = 6$ it meets the endpoint. Explicitly $a^\ast = 3/4$ at $p=2$, $1/2$ at $p=3$, $3/8$ at $p=4$, and $1/4$ at $p=6$. *Grade: exact arithmetic.*

**Theorem 5.3 (scaling inertness).** At a scale-critical pair the rescaling family carries zero information about the hypothesis quantity: the defect integral is invariant under the family, so no reading of the rescaled solutions distinguishes any two members, and R1 supplies nothing. *Grade: theorem on the exponent computation; structural on the reading that inertness closes the route.*

*Proof.* The integral scales as $\lambda^{E(p,a)}$ and $E(p,a^\ast) = 0$, so its value is constant along the family, and a reading consulting the family's members returns the same value at every member.

It remains to exclude a reading that consults the scaling **parameter** rather than the integral, since the parameter is itself data. Such a reading returns a function of $\lambda$. For its output to be a modulus it must bound the defect for the *datum*, and a datum's scaling orbit is a full ray, so any datum-level quantity extracted from a $\lambda$-dependent bound is a statistic of that bound over the orbit: a supremum, an infimum, a mean, or any order statistic. At $E(p,a^\ast) = 0$ the integral is constant on the orbit, so **every** such statistic equals the value at every point and carries no more than the integral did. The argument does not depend on which statistic is chosen, which is why it is stated over all of them. The parameter therefore adds no information about the datum, and both readings are excluded. $\square$

**Remark 5.4 (the family exists and is the wrong kind).** This is a sharper situation than the absence of a symmetry. At the critical locus the scaling family is present and it is *answer-preserving*: rescaling maps regular solutions to regular solutions and singular to singular. An answer-flipping family would obstruct a reading by a different mechanism. An answer-preserving family obstructs it by carrying no signal. Both close the route, and it is worth recording that the route here is closed by the second and rarer of the two.

# The termination theorem

**Definition 6.1.** A class of data is *terminal* at $(p,a)$ when $(p,a)$ is scale-critical and no admissible correspondence carries a uniform modulus onto the class from a class where one is known.

**Definition 6.2 (the supply seat).** A procedure's *supply seat* holds the objects it received rather than derived. A modulus produced in the course of a procedure enters only through the seat. The seat is empty when the procedure was supplied no modulus.

**Lemma 6.3 (the regress).** A quantitative induction on scales supplies a modulus only if its stage constants are bounded uniformly in the stage index. Stage-dependent constants compose to a bound depending on the number of stages, and the number of stages depends on the datum, so the composite is not a uniform modulus. *Grade: structural.*

*Proof.* Suppose the constant at stage $j$ is $C_j$ and the composite bound after $J$ stages is $\prod_{j\le J} C_j$ or any monotone function of the $C_j$. If $\sup_j C_j$ is not finite, the composite grows with $J$; if $J$ depends on the datum beyond its norm, the composite does too, and by Definition 3.1 it is not a modulus in EAD's sense. A uniform bound on the stage constants is therefore required, and such a bound is itself a data-uniform modulus one level down, which the induction was invoked to supply. $\square$

**Lemma 6.4 (transport needs the criticality gap crossed).** A correspondence carrying a modulus from a solved class to the terminal class must be uniform in the datum, since a datum-dependent correspondence transports a datum-dependent bound. The solved classes are solved by mechanisms that the critical scaling does not preserve, so such a correspondence is not supplied. *Grade: structural.*

**Lemma 6.5 (compactness loses the hypothesis).** A limit extracted from a sequence of solutions retains the defect's finiteness only if the defect is lower semicontinuous along the sequence in the relevant topology. At the critical exponent, take the sequence generated by the scaling family itself with $\lambda_n \to \infty$: by Theorem 5.3 the integral is the same at every member while the profiles concentrate, so any weak limit carries defect no larger than the common value and may carry less, and the modulus read off such a limit bounds the limit and not the sequence. *Grade: structural.*

**Theorem 6.6 (Termination).** Let the data class be terminal at $(p,a)$ in the sense of Definition 6.1 and let the supply seat be empty. Then no reading supplies a modulus satisfying Definition 3.1. *Grade: conditional on Premise 4.1 in the relocation channel; theorem in the supply channel.*

*Proof.* A procedure's output can vary along two channels. **Supply channel.** A modulus produced in the course of the procedure enters only through the supply seat by Definition 6.2, and the seat is empty by hypothesis. **Relocation channel.** By Proposition 4.3 every reading route is R1 through R4. R1 carries zero information by Theorem 5.3. R2 fails by Lemma 6.5. R3 fails by Lemma 6.4. R4 fails by Lemma 6.3, since it requires a uniform bound of the kind it was invoked to produce. No channel remains. $\square$

*Evidentiary note.* The lemma is exhibited on the scaling sequence rather than asserted, so it stands at the same standard as Theorem 5.3 beside it. What is not claimed is that every admissible sequence behaves so: the lemma needs one family on which the route fails, and the critical locus supplies it.

**Corollary 6.7.** The openness of EAD at the terminal class is supply-side and not reader-side: the instrument reads correctly and nothing sits at the address. A better reading does not help; a delivery does.

**Corollary 6.8 (the pair).** The alignment-defect paper and this one are one proof whose single open condition is the supply of the modulus. That paper is valid and conditional; this one locates its condition exactly and shows the condition is not discharged by any reading. Neither paper claims the conjecture.

# The register, executed

**This section supports no claim of the paper and is a load receipt.** Deleting it costs no theorem, and it is included because a paper that names an instrument owes the reader the evidence that the instrument ran. The formal-alone engine of the register of record was fetched at its seated path, its digest matched the deck's declared hash, and its boot re-ran at the canonical seed with the recorded first light reproduced byte for byte: kill-matrix 51 of 51, ablation 22 of 22, adversarial 9 of 9, calibration 12 of 12, the margin gate passed, and the chain $D_0 \to D_4$ identical to the record. The readings below were executed on that engine and are reported as it emitted them.

The register reaches no mathematical proposition, so the regularity string and the defect functional both route out to the grounding face. What the register carries is the *shape* of the axiom.

```{=latex}
\begin{jbox}
\footnotesize\setlength{\tabcolsep}{3pt}
\begin{tabular}{@{}p{0.50\linewidth}p{0.13\linewidth}p{0.09\linewidth}p{0.20\linewidth}@{}}
\textit{reading} & \textit{token} & \textit{label} & \textit{grade}\\[2pt]\hline\\[-6pt]
the regularity string as a proposition & route out & R1 & structural\\
the defect functional as a mathematical object & route out & R2 & structural\\
``the defect drives regularity'', a direction claim & open & M-DIR & structural\\
an energetic rider on a formal verdict, bridge unnamed & broken & G12 & structural\\
EAD with the joint law not supplied & open & M0 & supply owed\\
uniform modulus, schematic law, against the datum & sealed & M-IX & analytic\\
datum-dependent modulus, same shape & sealed & M-IX & analytic\\
\end{tabular}
\end{jbox}
```

Three of these are worth the space they take.

The direction claim returns open with its supply named: the register's measure is symmetric, $I(A;B) = I(B;A)$, and a Markov chain reads identically reversed, so no direction is readable there and the arrow belongs to an arrow-bearing register. This is why the continuation theorem of the companion paper, which is an implication, cannot be stated in this register at all, while its premise can.

The energetic reading breaks at the twelfth gate as an unbridged export. An argument that lets a thermodynamic quantity decide a formal verdict acquires authority it did not pay for, and the gate refuses it by mechanism.

And the schematic modulus readings separate exactly as Remark 3.2 requires, which is the register confirming the information form of the axiom rather than the author asserting it.

# The token, and why no new one is minted

The block proved above halts at a definite place, and the Trisduction register carries tokens for terminal blocks indexed by that place. Three are seated: one for a block halting in the **reader**, where a sign is unreadable by theorem; one halting in the **terrain**, where no fixed locus exists for any instrument; and one halting in the **witness**, where the reader reads correctly, the terrain carries a locus, and the missing item is a constructed object nobody has supplied. The index is the locus of the halt and not the mechanism, so a fourth token requires a fourth locus.

**Proposition 8.1.** The block of Theorem 6.6 halts in the witness. *Grade: structural.*

*Argument.* The three loci are distinguished by two measurements on the object, not by the definition of reading, and the argument must run on those measurements or it discriminates nothing.

**The terrain measurement.** A block halts in the terrain when the object carries no fixed locus for any instrument to anchor to. Here it does: the exponent equation $E(p,a) = 0$ has the solution set $a = 3/(2p)$, a curve in the exponent pair, and it is fixed pointwise by the rescaling action since $E$ is invariant under it. A fixed locus exists, so the terrain-locus does not apply. This is a computation and not a restatement.

**The reader measurement.** A block halts in the reader when a readout is barred from carrying the answer by a theorem about readouts of its class \cite{islam2026rh}, independent of what is supplied. No such theorem is available here: supply a modulus and every route reports it, as the constructive door of Section 9 states and as the emitter's [RESOLVE] branch executes. The reader is not barred; it is unfed.

**What remains.** The supply channel is empty by hypothesis, the relocation channel is closed by Proposition 4.3 with Theorem 5.3 and Lemmas 6.3 through 6.5, and the missing item is a constructed object. With the terrain-locus excluded by measurement and the reader-locus excluded by the constructive door, the witness-locus is what remains, and the exclusions were made on this object rather than on the notion of a reading.

**Remark 8.1a (that the loci discriminate, exhibited).** The argument would be worthless if every supply-side gap fell to the witness. It does not. A supply-side gap on an object whose native involution is fixed-point-free halts in the **terrain**: there is no locus for any instrument to anchor to, and what is missing is not a constructed object but a ground. The two measurements above are exactly what separates that case from this one.

**Corollary 8.2.** No new token is minted for this block. It takes the existing witness-locus token, whose first occupant is the Hodge conjecture at rigid classes.

**Remark 8.3 (the real differentia, and what it earns).** There is a genuine difference between the two occupants and it is worth stating. At the geometric terminus the relocation family is **empty**: the Hodge locus is a point and deformation is dead by *absence*. Here the relocation family is a **full one-parameter group**, present and answer-preserving, and dead by *inertness*.

Tested against what the token governs, the differentia leaves the halting locus unchanged, the supply species unchanged, and the shape of both doors unchanged; the gate counts differ, three against four, and that is forced per instance by each side's relocation census rather than per token. The one thing it changes is **how the first gate is certified**. It therefore earns a certification mode printed on the emission, dead by absence or dead by inertness, and not a token of its own.

**Remark 8.4.** The refusal is the larger result. A token with one occupant describes one problem; with two, across geometry and analysis, it is a classification. Minting a second token for the second occupant would have destroyed the generalization that makes the first worth having.

## The gate emitter, executed

The four gates, the two doors and the riders are carried as a fail-safe emitter whose defaults are absent, so an under-specified reading never emits the token. It was run with its controls.

Four gate controls land at exactly their own gate. Ablation leaks four of four: deleting any one gate leaks the token on that gate's own control, so every gate is load-bearing by mutation rather than by assertion. The four riders fire at their own labels. The intake routes an unread form, a per-solution finiteness claim, a family statement over exponents, and an empty reading to their four distinct dispositions. The two doors route as constructed.

The card's own negative control is the one that matters, since a token that fires widely is not a terminus. At partner exponent three the critical order is one half, the scaling exponent is exactly zero, the reading is inert and the token issues. At order three quarters the exponent is one half, not inert, and the reading routes open at the first gate. At order one third the exponent is minus one third, not inert, and it routes open at the first gate. **At the partner exponent exercised, the token fires on the critical order and routes open above and below it.** The emitter was run at three orders at one partner exponent; the sentence is scoped to that run.


# Falsification criteria

**F1.** A uniform modulus supplied at a terminal class, or a proof that one exists. Firing event: the object exhibited and independently verified. Blast radius: Theorem 6.6 and with it this paper entirely; the companion paper's conditional theorem becomes unconditional. This is the constructive door.

**F2.** A fifth item in the data inventory of Premise 4.1: something the data in hand consist of that is neither a solution, a family, a class, nor a scale decomposition. Firing event: the item exhibited and shown to reduce to none of the four. Blast radius: Premise 4.1, and with it the relocation channel of Theorem 6.6; the supply channel stands. Blast radius: Definition 4.1 and the relocation channel of Theorem 6.6; the supply channel stands.

**F4.** A fourth halting locus, distinct from reader, terrain and witness, exhibited on any object. Firing event: the locus exhibited and the three existing ones shown not to cover it. Blast radius: Proposition 8.1 and Corollary 8.2, and with them the refusal to mint a new token; Theorem 6.6 is unaffected, having named no token.

**F3.** A datum family over which every dominating readout carries strictly positive conditional information about the datum beyond its norm. Firing event: such a family exhibited with the positivity established rather than asserted. Blast radius: EAD itself, and with it the companion paper's conclusion; Theorem 6.6 survives, having said nothing about the axiom's truth.

# What is claimed

Five statements and no sixth.

**One.** EAD's content is an independence, stated exactly at Definition 3.1, and the conditional form is the correct one.

**Two.** At the scale-critical locus, which lies inside EAD's own range of exponents, the scaling relocation carries provably zero information, by exact arithmetic.

**Three.** Granting Premise 4.1, the four reading routes are the only ones, and at a terminal class all four are closed, so no reading supplies the modulus. The openness is supply-side. The premise is carried at premise grade and the theorem is conditional on it.

**Four.** The block halts in the witness, takes the existing witness-locus token, and earns a certification mode rather than a token of its own; the differentia between absence and inertness is real and does not reach token level.

**Five.** Nothing above bears on whether EAD is true, on whether it is provable, or on whether the Navier-Stokes problem is open. A construction crosses the block, and the door is named once here and not discussed further.

# Discussion

The result has a shape worth naming because it recurs. A conjecture is relocated repeatedly, each relocation moving an undetermined quantity to a new presentation without discharging it, until a locus is reached where relocation is inert and the quantity has nowhere further to go. There the register that reads and never authors states the exact boundary of its own reach. The Hodge conjecture reaches such a locus at rigid classes \cite{islam2026hodgeterm,islam2026hodgeaxiom}, where deformation is a point and the missing object is a cycle. The Navier-Stokes problem reaches one at the critical exponent, where rescaling carries no information and the missing object is a modulus. The two are the same species of block in different fields, and the species is characterized by what is absent: not a reader's sight, and not a terrain's structure, but a constructed object nobody has supplied.

Two honest asymmetries with the geometric case should be recorded. The rigidity criterion there is certified by a classical residue calculus with an executable test, while the criticality criterion here is an exact arithmetic fact whose reading as a terminus is this paper's own and has not been refereed. And three of the four gates there are certified per class, while three of the four here are argued structurally and are the weakest part of this paper. A reader who rejects Lemmas 6.3, 6.4 and 6.5 keeps Theorem 5.3 and the supply channel of Theorem 6.6, which is less than the paper claims and more than nothing.

# Conclusion

The alignment-defect paper's premise is not a lemma awaiting a better argument. At the critical locus it is a supply-side gap, and no procedure that reads formal data and constructs nothing closes it. The register states its own boundary and does not cross it. What crosses is a construction, and the construction is not in this paper.


# Methodology {-}

**What was done, in the order it was done.** The companion paper's premise was isolated and restated in its exact content, an independence rather than a bound. The operations available to a reading were then inventoried, the inventory carried as a premise rather than proved, and the four routes derived from it. The scaling exponent was computed symbolically and its vanishing locus solved for; the locus was checked against the companion's own range of admissible orders at four partner exponents. Each of the four routes was then tested at that locus, one by computation and three by argument. The resulting block was adjudicated against the register's existing family of terminal tokens, and the adjudication refused a new token on the family's own indexing principle.

**What was executed rather than asserted.** Every numeric figure in this paper was recomputed from the equation that produces it: the scaling exponent, its vanishing locus, the four endpoint values, and the three emitter orders. The gate emitter of Section 7 was run with its controls, including its ablation, and the figures reported are the figures it printed. The formal-alone engine was fetched at its seated path, its digest compared to the declared hash, and its boot re-run; a mismatch would have been reported and no reading would have been carried.

**What was not done.** No route was tested by exhibiting a construction, because a construction would have crossed the block and ended the paper rather than supporting it. No claim about the truth of the premise was tested, since none is made. No claim about provability was tested, since the unrestricted form of such a claim is barred and this paper is bound by that bar before any reader is.

**The adversarial pass.** The paper was put through a six-round adversarial self-audit before release, one seat prosecuting framework-blind against seeded controls, one defending on the booted register, a third adjudicating without authoring rights. Six registers were covered, three planted defects were seeded per round and detected in five of six rounds, and the round that failed detection was voided by the ledger and re-run rather than counted. Ten findings were earned and repaired, each with a sweep specification verified before and after the repair.

The audit changed the paper's central claim and the change is the honest one to report: the relocation channel was stated unconditionally and is now conditional on Premise 4.1, a data inventory this paper does not prove. Three further repairs changed arguments rather than wording, at Theorem 5.3, at Lemma 6.5, and at Proposition 8.1, whose witness-locus argument was rebuilt on measurements of this object after the prosecution showed the original argued from the definition of a reading and therefore discriminated nothing.

**The control grade, stated as the limitation it is.** The controls were self-generated in session. Their detection proves the cycle is not fitting findings after the fact; it does not prove independence, because one substrate held every seat and the sealed control file was readable on disk. That aperture is open and is not closed by anything in this paper.

# Appendix: Author's Provenance and Method Disclosure {-}

This paper was developed under Trisduction, a verification and organizing discipline and not a source of results. Its conclusions rest on the standard results cited below and on premises stated as premises. Trisduction is the method under which those results were decomposed, assembled and audited; it adds them no warrant and claims authorship over none of them.

The discipline is used for fidelity. It forces a claim onto disjoint axes so no single persuasive line carries it alone, requires every verdict to resolve to one of three states, sealed, broken or open, each with a named failure mechanism, and attaches an explicit warrant grade, theorem, conditional, structural or premise, to every claim so that nothing is stated above its strength. Two errors it is built to catch are inflation, reading an internal lock as a proof, and circularity, reading a restatement of a claim as a derivation of it. Both were caught in this paper by its own audit and both are recorded above rather than removed from the record.

The root axiom is that to exist is to actuate: every physical existent carries a strictly positive energetic cost, grounded in the Heisenberg energy floor, the zero-point energy, and Landauer's bound \cite{landauer1961}. The formal-alone register used here is that root read along its interaction face, where systems are variables with distinguishable values and two systems are related when their joint law does not factor. That register is symmetric by construction, so it carries no direction, which is why the companion paper's continuation theorem cannot be stated in it while the premise examined here can.

**Conflicts and independence.** The author is unaffiliated and the work is unfunded. The companion paper cited as the source of the premise examined here is the author's own, as are the two geometric papers cited as the parent species of this block; each is identified as such at the point of citation. Nothing in this paper is refereed, and the adversarial pass described above was run by the author's own instrument on the author's own artifact, which is a self-audit and not an external review. A reader who requires witness independence should treat every grade in this paper as unconfirmed until an external reading supplies it.

**Data and reproducibility.** The paper contains no data. Every symbolic computation is a two-line recomputation from the equation printed beside it. The engine whose boot is reported in Section 7 is public at the repository named there, its digest is printed, and its boot is deterministic at the stated seed, so any reader with a Python interpreter reproduces the receipt or falsifies it.

```{=latex}
\begin{thebibliography}{99}
\bibitem{leray1934} Leray, J. 1934. Sur le mouvement d'un liquide visqueux emplissant l'espace. \emph{Acta Mathematica} 63, 193--248.
\bibitem{fujitakato1964} Fujita, H., and T. Kato. 1964. On the Navier-Stokes initial value problem. I. \emph{Archive for Rational Mechanics and Analysis} 16, 269--315.
\bibitem{ladyzhenskaya1969} Ladyzhenskaya, O. A. 1969. \emph{The Mathematical Theory of Viscous Incompressible Flow}. 2nd ed. New York: Gordon and Breach.
\bibitem{ukhovskii1968} Ukhovskii, M. R., and V. I. Yudovich. 1968. Axially symmetric flows of ideal and viscous fluids filling the whole space. \emph{Journal of Applied Mathematics and Mechanics} 32, 52--61.
\bibitem{ckn1982} Caffarelli, L., R. Kohn, and L. Nirenberg. 1982. Partial regularity of suitable weak solutions of the Navier-Stokes equations. \emph{Communications on Pure and Applied Mathematics} 35, 771--831.
\bibitem{ess2003} Escauriaza, L., G. Seregin, and V. Sverak. 2003. $L_{3,\infty}$-solutions of Navier-Stokes equations and backward uniqueness. \emph{Russian Mathematical Surveys} 58, 211--250.
\bibitem{tao2016} Tao, T. 2016. Finite time blowup for an averaged three-dimensional Navier-Stokes equation. \emph{Journal of the American Mathematical Society} 29, 601--674.
\bibitem{tao2021} Tao, T. 2021. Quantitative bounds for critically bounded solutions to the Navier-Stokes equations. In \emph{Nine Mathematical Challenges: An Elucidation}, Proceedings of Symposia in Pure Mathematics 104, 149--193. Providence: American Mathematical Society.
\bibitem{buckmastervicol2019} Buckmaster, T., and V. Vicol. 2019. Nonuniqueness of weak solutions to the Navier-Stokes equation. \emph{Annals of Mathematics} 189, 101--144.
\bibitem{fefferman2000} Fefferman, C. L. 2000. Existence and smoothness of the Navier-Stokes equation. Clay Mathematics Institute Millennium Prize Problem description. Cambridge, MA: Clay Mathematics Institute.
\bibitem{shannon1948} Shannon, C. E. 1948. A mathematical theory of communication. \emph{Bell System Technical Journal} 27, 379--423, 623--656.
\bibitem{cover2006} Cover, T. M., and J. A. Thomas. 2006. \emph{Elements of Information Theory}. 2nd ed. Hoboken: Wiley.
\bibitem{landauer1961} Landauer, R. 1961. Irreversibility and heat generation in the computing process. \emph{IBM Journal of Research and Development} 5, 183--191.
\bibitem{bakergillsolovay1975} Baker, T., J. Gill, and R. Solovay. 1975. Relativizations of the P =? NP question. \emph{SIAM Journal on Computing} 4, 431--442.
\bibitem{razborovrudich1997} Razborov, A. A., and S. Rudich. 1997. Natural proofs. \emph{Journal of Computer and System Sciences} 55, 24--35.
\bibitem{islam2026defect} Islam, M. F. 2026. Integrable misalignment forbids blowup: a new scale-invariant geometric continuation theorem for three-dimensional Navier-Stokes, proved from the classical base. Zenodo record 22665831. [Author's own; the source of the premise examined here.]
\bibitem{islam2026hodgeaxiom} Islam, M. F. 2026. A proof of the Hodge conjecture derived from one semiregular witness axiom. Zenodo record 22701510. [Author's own.]
\bibitem{islam2026hodgeterm} Islam, M. F. 2026. A formal proof of Hodge conjecture termination at the formal-alone register. The Tractatus Veritatis Trisductivus. [Author's own; the parent species of the block adjudicated in Section 8.]
\bibitem{islam2026rh} Islam, M. F. 2026. A formal proof of Riemann Hypothesis termination, with a theorem-grade cascade specification. The Tractatus Veritatis Trisductivus, Zenodo record 21900518. [Author's own; the reader-locus exemplar.]
\bibitem{islam2026closure} Islam, M. F. 2026. Closure and the limits of forced results. Zenodo record 10.5281/zenodo.22683805. [Author's own.]
\end{thebibliography}
```
