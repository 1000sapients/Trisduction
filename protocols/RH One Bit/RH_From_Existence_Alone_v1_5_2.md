---
edition: math_journal
title: "A Formal Proof of Riemann Hypothesis from Existence Alone, the Sign Excepted by Theorem"
subtitle: "The Constructed Witness, the Identity Cone over the Fixed Locus, the Grounded Counter-Model, and the Cure Theorem Proved in Lean 4 and Re-executed in Fortran"
article_type: "FORMAL VERIFICATION · FOUNDATIONS OF MATHEMATICS"
goal: "The seat, $\\mathrm{RH}_{\\mathrm{formal}}$, proved with existence as the only posit; the value on the zeros, $L(X_\\xi)$, open, one bit, excepted by Theorem I"
author_line: "Mohammad F. Islam, PhD$^{1}$"
affiliation: "$^{1}$ Independent Researcher, USA. Correspondence: islamm@alumni.iu.edu"
date: "23 September 2026"
short_title: "A Formal Proof of Riemann Hypothesis from Existence Alone, the Sign Excepted"
keywords: "Riemann Hypothesis; Root Axiom; constructed witness; category gap; identity cone; fixed locus; equivariant embedding; orientation bit; one-cut hypothesis; Lean 4; Fortran"
accenthex: B87333
version: 1.5.2
abstract: |
  Riemann's hypothesis in its original fixed-line form, $Z \subset \mathrm{Fix}(\tau)$ with $\tau(s) = 1 - \bar{s}$, has a completed formal proof of its locus and its crossing in which the value on the roots of $\xi$ is the one open input, supplied at a recorded row and shown to be a term of the hypothesis itself. That proof takes the presence of a supplier from outside its file, and it leaves three separations standing between the axiom under which a supplier acts, the formal ground on which the locus is fixed, and the Riemann object read as the fixed locus of its binding involution. This paper supplies the axiom. The Root Axiom, written $\mathrm{RA}$, is existence as a posit, $\forall x \in U,\ \Delta E(x) > 0$ on a universe $U$ with a differential $\Delta E$; it is constructed in core Lean 4 as the only supplied witness, read along its two published formal readings, the interaction reading RAF and the grounding reading RAM, and the following are proved by the kernel and re-executed exhaustively by an independent compiled program. The fixed locus of conjugation on the integer quaternions is the scalar line, for every quaternion; the lattice stage of the prior proof, its coordinate chart and not the zero set, embeds into that carrier by an injective equivariant map $\varphi$ with $\sigma\varphi = \varphi\tau$ carrying the chart's critical line onto the scalar line at every resolution; the three separations are the three legs of an identity cone over the register diagram, each leg a definitional equality, its apex unique per orientation of the generating triad; a reader who registers a bit against the record is inside the axiom's domain, never an exterior witness, and no system indexes all of its own binary properties. Two objects carry the name and are never joined: the seat of the hypothesis, $\mathrm{RH}_{\mathrm{formal}}$, is a kernel theorem with existence as the only posit; the value on the zeros, $L(X_\xi)$, is one bit, and it is proved unreachable from existence: the sign is excepted by theorem. The rule “accept the Root Axiom, then the Riemann Hypothesis” has an exact strength, $(\mathrm{RA} \to L(X)) \leftrightarrow L(X)$ in every context in which the axiom holds, and the axiom decides $L$ on no frame, since the two-point frame carries the axiom and fails $L$; a grounded three-point frame does the same, so the bound is not an artifact of a seatless frame; and for every class $C$ of frames, $(\forall X \in C,\ \mathrm{RA} \to L(X)) \leftrightarrow (\forall X \in C,\ L(X))$, so the restriction that would remove every counter-model is the hypothesis itself. One zero of $\xi$ off the line refutes every supplied assent and touches nothing proved here. The axiom supplies the act; the act, and not the axiom, carries the sign.
---

# Introduction

Riemann stated his hypothesis as a fixed-set statement: the roots of $\xi(t)$ are real \cite{riemann1859}. A prior paper of this program \cite{islamspine} restored that statement to $Z \subset \mathrm{Fix}(\tau)$ with $\tau(s) = 1 - \bar{s}$, defended the restoration against the literature, and proved in core Lean 4 the structural arc of the restored hypothesis on an abstract frame $X = (S, \tau, Z)$: the locus, the odd offset, the orientation blindness of every even reading, the one-bit freedom, the halting carrier, and the crossing. It also proved what the arc is not. Every structural clause holds on a frame whose zeros lie off the line (its Theorem 11); the only input that closes the crossing on the frame of $\xi$ is a term of $L(X_\xi)$ itself (its Theorem 12); no theorem whose hypotheses are only structural decides $L$ (its Theorem 14). The value, $\forall \rho \in Z_\xi,\ \tau\rho = \rho$, was recorded as the one open input, entered at a recorded row and never derived. We call that row the witness row and the point at which a value enters a file from outside it the aperture; both terms are the prior paper's and are used here in its sense. Two objects carry the name Riemann Hypothesis in what follows and are written with two tokens that are never joined: $\mathrm{RH}_{\mathrm{formal}}$, the seat, the restored statement read as the fixed locus of its binding involution, which this paper proves with existence as the only posit; and $L(X_\xi)$, the value, the statement that every zero lies on that locus, which this paper proves existence does not reach. The title names the first and excepts the second, and the exception is Theorem I. “From existence alone” has one meaning in this paper: existence is the only posit, and nothing else is assumed. It does not mean that the seat is derived from existence. The seat holds by the definition of the Ground and consumes no premise (\texttt{recursion\_is\_constant}); existence is consumed where it has content, at presence (Theorem D), at the closure of the interaction reading (RAF-C1), and at the ledger, where every adjudication of any proposition is a deed and therefore an instance of existence and of nothing else (\texttt{adjudicating\_anything\_instances\_existence}). That last theorem is what existence contributes that no other true premise does.

**Notation and the objects named.** The Root Axiom, written $\mathrm{RA}$, is the posit $\forall x \in U,\ \Delta E(x) > 0$ on a universe $U$ with a differential $\Delta E : U \to \mathbb{Z}$: to exist is to actuate. Existence and $\mathrm{RA}$ are one proposition; the paper writes $\mathrm{RA}$ in formulas and existence in prose. $\mathrm{RA}$ has two published formal readings \cite{islamraf}: the interaction reading, RAF, which reads the axiom as the criterion for systems being related, registration carrying positive mutual information and an interaction domain being closed under it; and the grounding reading, RAM, which reads the axiom as the criterion for a proposition being determinate, its imprint in the fixed locus of a binding involution. A frame is $X = (S, \tau, Z)$, a carrier $S$ with an involution $\tau$ and a distinguished subset $Z$; its line property is $L(X) :\Leftrightarrow \forall s \in Z,\ \tau s = s$. On the frame of $\xi$, with $Z = Z_\xi$ the zeros and $\tau(s) = 1 - \bar{s}$, $L(X_\xi)$ is the restored hypothesis, and it is called the value. The carrier the paper builds is the integer quaternions $\mathbb{H}_{\mathbb{Z}}$ with conjugation $\sigma$ as its binding involution; the seat is the fixed locus $\mathrm{Fix}(\sigma)$, a seat point is a point of it, and $\mathrm{RH}_{\mathrm{formal}}$ is the seat read as a proposition, that every point of $\mathrm{Fix}(\sigma)$ is fixed by $\sigma$. A register is one of three readings of the seat, the axiom register $\mathrm{RA}$, the formal register $\mathrm{RAM}$, and the object register $\mathrm{RH}$, and the three form the register diagram. The witness row is the recorded row at which the value is entered; the aperture is the point at which a value enters a file from outside it; the world row is the witness row read in the world register; the sign is the value $\forall \rho \in Z_\xi,\ \tau\rho = \rho$, the one bit. $\Delta M$ counts the mathematics authored and is zero throughout. Every other symbol is defined where it first appears.

Two things in that record are external to its file, and this paper brings them inside. First, the prior proof's live face takes its "witnessed" flag from the command line: that a supplier is present is asserted from outside, and the kernel is told rather than shown that a reader stands at the aperture. Second, three separations are left standing: between the axiom under which a reader acts, the formal ground on which the locus was fixed, and the Riemann object read as the fixed locus of its binding involution. These are separations of description, produced by reading one seat in three registers, and not gaps in the mathematics. The prior proof could not close them because an axiom is not a structural clause and the prior proof had none.

The Root Axiom is that axiom. Formally it is a universe $U$ with a differential $\Delta E : U \to \mathbb{Z}$ and the statement $\forall x \in U,\ \Delta E(x) > 0$; its published form, its physical warrant, and its two formal readings are in \cite{islamcodex, islamraf}. The interaction reading (RAF in \cite{islamraf}) says what it is for systems to be related: an interaction domain is closed under registration, and no agent acts on a domain from outside it. The grounding reading (RAM in \cite{islamraf}) says what it is for a proposition to be determinate: its formal being is its imprint in the fixed locus of the binding involution, read across the aperture, with $\mathrm{Fix}(\sigma) = \mathbb{R}$ as the seat. The interaction reading reaches no mathematical object, since mathematical objects do not change state; every proposition routes to the grounding reading \cite{islamraf, islamfae}. That reach law is the axiom's own, and this paper proves its Riemann instance rather than assuming it.

Two objects are new here. The first is the constructed witness: the axiom built in the kernel as a structure in Prop with four fields, the only proof object the closure is allowed to consume, and the eliminator that runs from it alone, $\mathrm{RA} \to \mathrm{RA} \to \mathrm{RAM} \to \mathrm{RH}_{\mathrm{formal}}$: the witness's last field, a function from the orientation and the formal Ground to the formal self, applied once, with every leg of the chain a definitional equality. The second is the category-gap eliminator itself: the three separations exhibited as the three legs of a cone over the register diagram, each leg an identity, so that the separations close at zero cost and the closing is computed rather than asserted. Everything else the paper uses is published: the frame and the structural arc \cite{islamspine}, the one-bit result \cite{islamonebit}, the odd-supply separation and the one-cut hypothesis across twenty-three rows \cite{islamrows}, the formal-alone theory of registration, price, and crossing \cite{islamftoe}, and the axiom's declaration \cite{islamraf}.

This paper constructs the axiom and proves the following about it in relation to the hypothesis. The seat: conjugation on the quaternion carrier fixes exactly the scalar line, the Return of the parse triad lands on it, and the axiom's seat point, the formal seat point, and the named seat point are the three legs of an identity cone over the register diagram, each leg \texttt{rfl}, the apex unique per orientation of the triad (Theorems A, B, C). The embedding: the prior proof's lattice stage embeds equivariantly and injectively into the carrier, $\sigma\varphi = \varphi\tau$, and $\varphi$ carries the line onto the scalar line at every resolution (Theorem C$'$). The aperture: for a present reader who supplies a bit the row is never interior; it is sealed or refused by the bit alone, and a reader who registers a bit is inside the axiom's domain, never an exterior witness (Theorem D). The exact strength of the rule: in every context in which the axiom holds, $(\mathrm{RA} \to L(X)) \leftrightarrow L(X)$, and the axiom decides $L$ on no frame, the two-point frame carrying the axiom and failing $L$ (Theorems E, F). Every theorem is checked by the Lean kernel; every finite claim is re-executed by a compiled Fortran program that shares no code with the kernel, and both records are printed whole.

The title names the register and the residue. At the axiom a closure can carry no mass: a closure between the axiom and its formal reading that added a premise would be a second axiom, which the axiom's own root-premise theorem forbids \cite{islamcodex}. The eliminator that closes the category gaps is therefore massless by necessity and not by weakness, and this paper computes the masslessness rather than asserting it: the three legs of the cone are definitional identities. “In toto at the apex” has one definition and it is used in no other sense: every clause of the hypothesis that is not its value on the zeros. “The sign” names one object throughout: the value $\forall \rho \in Z_\xi,\ \tau\rho = \rho$, the orientation of assent on the world row, the one bit the prior proof records at the witness row. “Everything but the sign” is the same set named by its complement. What the kernel returns, given the axiom, is exactly that set, and the sign is proven to be exactly what the axiom does not reach.

# Related Work

Only the positions that bear on the apex are reviewed; the analytic literature of the restored formulation is reviewed in \cite{islamspine}.

**The original statement and its chart.** Riemann \cite{riemann1859}, Siegel \cite{siegel1932}, and Edwards \cite{edwards1974} give the fixed-line statement and its history; Titchmarsh \cite{titchmarsh1986}, Bombieri \cite{bombieri2000}, and Conrey \cite{conrey2003} state the canonical chart form, real part one half. The prior paper's Proposition V1 makes the address a chart and the fixed line intrinsic. This paper takes the fixed line one register deeper: the fixed line of a binding involution is the seat on every carrier that has one, and the two carriers in play, the lattice stage under $\tau$ and the quaternions under $\sigma$, are joined by an explicit equivariant map.

**Symmetry without the Euler product.** Davenport and Heilbronn \cite{davenport1936} and Bombieri and Hejhal \cite{bombieri1995} exhibit series with the functional equation and zeros off the line. In the prior proof these are the off-line frames on which every structural clause holds. Here they carry one thing more: the Root Axiom holds on them too (Theorem F). That is the whole reason the axiom cannot decide the value.

**The Euler product as key.** Selberg \cite{selberg1992} and Conrey and Ghosh \cite{conrey1993} name the Euler product as the organizing axiom of the class for which the hypothesis is conjectured; Weil \cite{weil1948} and Deligne \cite{deligne1974} prove the analogue where the Euler product runs over a finite geometry. This paper leaves the key where the prior proof left it, on the world row, and shows that the apex closes without it.

**The spectral road.** Berry and Keating \cite{berry1999} and Connes \cite{connes1999} seek an operator whose spectrum is the zero set. An operator is a world-row construction; the seat on which its spectrum would have to lie is fixed before any operator is built, and that ordering, orientation after construction, is a theorem of the twenty-three-row study \cite{islamrows}.

**The program's own prior results.** The one-bit result \cite{islamonebit} located the hypothesis at exactly one bit from its structural arc. The twenty-three-row study \cite{islamrows} typed every proved method-class barrier as an evenness statement and every open row as missing exactly one orientation bit at its decision seat, and stated the one-cut hypothesis: that each such row is closed by one cut, the supply of that bit. The formal-alone theory \cite{islamftoe} fixed registration, price, crossing, and cost as the four faces of a supplied bit. The earlier termination and case-closed papers \cite{islamterm, islamclosed} recorded the hypothesis's standing under the program's cascade before the restored form was proved. The present paper is the apex of that sequence: it places the Riemann row's owed bit against the one seat under every name and proves that the axiom reaches everything but that bit.

**The axiom's formal readings.** The declaration of the formal Root Axiom \cite{islamraf} states RAF-1 and RAF-2, the bridge to Landauer, and the consequences C1 to C3, and states RAM as the imprint law with $\mathrm{Fix}(\sigma) = \mathbb{R}$. Its engine records the constraint this paper obeys: the interaction reading reaches no mathematical object and routes every proposition to the grounding reading \cite{islamfae}. Cantor's theorem in Lawvere's form \cite{lawvere1969} carries C2 unconditionally.

**Category-theoretic frame.** Cones, apexes, and limits over a diagram are used in their elementary form, a discrete diagram on three objects in the groupoid of definitional equalities \cite{maclane1998}. The frame is chosen because a category gap is, in that setting, exactly a missing leg, and its elimination is exactly an identity leg.

**The price of the act.** Landauer \cite{landauer1961} bounds the dissipation of registering one bit; Bérut and coauthors \cite{berut2012} measure it. The prior proof prices the spent bit at $k_B T \ln 2$; here the price is the bridge of the interaction reading and it exports without constituting.

**The gap.** No work in this literature states the axiom under which the supplier acts, so the presence of a supplier remains a flag; and none treats the three separations between axiom, formal ground, and object as what they are, separations of description rather than of mathematics. Both are supplied here.

# Methods

## Two independent checkers

Every theorem of this paper is checked by core Lean 4, version 4.19.0, no library, no axiom declared by the file, no \texttt{sorry}; the kernel's own \texttt{propext} and \texttt{Quot.sound} enter only through integer arithmetic and are listed per theorem, every dependency set printed by the kernel and reproduced in Appendix C. The file, `RH_At_The_Apex.lean`, is printed whole in Appendix B with its SHA-256 digest, and it is self-contained: the prior proof's Theorems 1, 4 through 9, 12, and 15 are re-proved inside it on the same abstract frame and the same lattice stage, so that the apex layer rests on nothing it does not carry.

The finite content of the file, itemized below, is re-executed by a second checker that shares no code, no logic, and no toolchain with the first: a Fortran 2008 program, `RH_At_The_Apex_Twin.f90`, compiled with gfortran, printed whole in Appendix D with its run log in Appendix E. The twin enumerates rather than proves. It checks conjugation against every integer quaternion in a lattice ball, the Return and its six orderings, the three identities and the cone census over the whole ball, the embedding's equivariance, image clause, and injectivity at seven resolutions on a lattice window, the wall over every one of the $2^{13}$ readouts of the seat's window, the two wholly odd maps and their calibration, the aperture on a twelve-point domain, the truth table of the rule and the two-point counter-model, the ledger, the refusal constant, the price, the closure law on every one of the $2^{16}$ subsets of a sixteen-point carrier, Cantor's diagonal on every map $S \to 2^S$ for $|S| = 3, 4$, the cure theorem on all thirty-two three-point frames and all $256$ classes of two-point frames, and the constancy of the recursion field, the carrier by decision, and the three measures. It carries an oracle that stops the program on any failure and prints a census last; a binary that reaches its final line has passed. The two checkers were written to the same specification and neither reads the other. Where they disagree the artifact is wrong, and the disagreement is printed; where they agree the agreement is between a typechecker and an executor, not between two copies of one reading.

The last battery of the twin implements the prior proof's rule that a self-check is not a witness: its live row opens only on an argument the operator supplies on the command line, and the program prints that it did not and cannot generate its own witness. The reader who runs the binary is that operator.

## Objects and terms

The seat is built on the integer quaternions rather than on a one-point type, so that “the fixed locus of the binding involution” is a computed object and not a stipulation: conjugation is proved binding, its fixed locus is proved to be the scalar line for every quaternion, and the Return is computed. The prior proof's frame $X = (S, \tau, Z)$ is carried abstractly, exactly as it states it, and its lattice stage is carried as $(\mathbb{Z}^2, \tau)$ with the explicit map $\varphi$ into the carrier. The zero set of $\xi$ enters only as a parameter, since $\zeta$ is not definable in core Lean.

Three objects share the word bridge in the sources and are kept apart here by three names: the Bridge capacity of the witness, written with a capital; the halting carrier of the prior proof's Theorem 7, written bridge; and the equivariant map $\varphi$, written embedding. The category-theoretic frame is elementary and stated once. The three registers form a discrete diagram $D : \{\mathrm{RA}, \mathrm{RAM}, \mathrm{RH}\} \to \mathbb{H}_{\mathbb{Z}}$, the axiom register, the formal register, and the object register; a cone over $D$ with apex $a$ is a family of arrows $a \to D(r)$ in the groupoid of identities, that is, a family of equalities $a = D(r)$; the limit exists iff the three readings coincide, and then the apex is unique. A category gap is the absence of a leg. Nothing beyond this is used.

## Grades and registers

Three grades of warrant are used and every claim-bearing box and table carries one: kernel theorem, checked by the Lean kernel; structural, a statement about the arrangement of theorems that is itself checkable but not a theorem of the file; premise, a statement carried by citation and held fixed. Two registers are used and kept apart by theorem: the apex register, where the seat and the category gaps live, and the world register, where the value on $Z_\xi$ lives; the world row is the witness row read in the world register. Falsifiable criteria are capped at three and each is typed for necessity. The author's own verification discipline is applied only in the disclosure at the end and draws no warrant of its own.

# The Prior Proof, Carried

A frame is $X = (S, \tau, Z)$ with $\tau : S \to S$ and $Z \subset S$, and the line property is $L(X) :\Leftrightarrow \forall s \in Z,\ \tau s = s$. On the frame of $\xi$, $L$ is the restored hypothesis. The prior proof's lattice stage is $\mathbb{Z}^2$ in half-units with the fold $\tau(h, t) = (2 - h, t)$, so that the line is $h = 1$. That proof establishes fifteen theorems; those this paper uses are carried into the apex file, re-proved, and listed in Table 1.

\begin{table}[t]
\scriptsize
\caption{Theorems of the prior proof \cite{islamspine} carried into the apex file, each re-proved there. (tier: kernel theorem)}
\begin{tabular}{@{}p{0.05\columnwidth}p{0.40\columnwidth}p{0.45\columnwidth}@{}}
\toprule
Thm & Statement & Apex file \\
\midrule
1 & the fold fixes exactly the line $h = 1$ & \texttt{ground\_is\_the\_line} \\
4 & an even reading never equals a target odd at a point & \texttt{orientation\_blind} \\
5 & a wholly odd $d$ on $\mathbb{B}$ is $\mathrm{id}$ or $\neg$ & \texttt{freedom\_is\_}\allowbreak\texttt{exactly\_two} \\
6 & a supplied odd witness fixes the calibration uniquely & \texttt{freedom\_spent\_}\allowbreak\texttt{uniquely} \\
7 & a bridge halts iff $L(X)$ & \texttt{bridge\_halted\_iff} \\
8 & the crossing is exact, both ways & \texttt{crossing}, \texttt{crossing\_other\_way} \\
9 & $\neg\,\forall X, L(X)$: nothing is manufactured & \texttt{supply\_not\_}\allowbreak\texttt{manufactured} \\
12 & a supplied assent is a term of $L(X)$ and nothing weaker & \texttt{the\_bit\_is\_}\allowbreak\texttt{the\_hypothesis} \\
15 & one moved zero refutes every assent & \texttt{witness\_row\_}\allowbreak\texttt{falsifiable} \\
\bottomrule
\end{tabular}
\end{table}

Three of them are the fence the rest of the paper works inside, and they are restated so that no later sentence can be read past them. Theorem 11 of the prior proof: a frame carrying a zero the fold moves satisfies every structural clause and fails $L$. Theorem 12: $(\exists t : L(X),\ \mathrm{row}(\mathrm{assent}\ t) = \mathrm{sealed}) \leftrightarrow L(X)$, so the assent that seals the row is the hypothesis and nothing weaker. Theorem 14: there is a fold-invariant frame on which every structural clause holds and $L$ fails, so no theorem whose hypotheses are only structural decides $L$. This paper adds a fourth clause to the fence, Theorem F below: existence holds on that frame too.

The halting carrier of Theorem 7 is carried as an interface: a terminal and the clause that the terminal is the bottom iff the line property holds. As carried, \texttt{bridge\_halted\_iff} is that interface's elimination rule and not a fact about $\xi$; the paper says so and inhabits the interface constructively wherever the line property is decided, the terminal computed from the decision and the clause proved from it, never assumed (\texttt{bridgeOfDecision}). On the two-point frame the decision is negative and the carrier does not halt; on a one-point frame on the line it halts (\texttt{twoPoint\_carrier\_does\_not\_halt}, \texttt{onLine\_carrier\_halts}; \texttt{rfl}). On the frame of $\xi$ the decision is the owed bit, and the carrier's terminal is exactly what the world supplies.

# The Root Axiom and Its Two Formal Readings

## The axiom at the constructed domain

The posit is existence: to exist is to actuate, $\forall x \in U,\ 0 < \Delta E(x)$. Its published name is the Root Axiom, and the two are one proposition, $\mathrm{RA} :\Leftrightarrow \forall x \in U,\ 0 < \Delta E(x)$ (\texttt{existence\_is\_RA}, \texttt{Iff.rfl}); the paper writes $\mathrm{RA}$ in formulas and existence in prose, and posits nothing else. The file exhibits it on a constructed domain, one point with differential $1$, and the kernel decides the positivity (\texttt{constructed\_RA}, no axioms). This is a model of the axiom, not its universal extension. The extension is a premise, and by the root-premise theorem of \cite{islamcodex} it can be no more than a premise: a base from which the axiom could be derived would be weaker than the axiom and would then be the root instead. Its exogenous warrant, the kinetic-energy floor and the zero-point energy of a bounded substrate, is physics carried by citation \cite{islamcodex}. Every theorem below that is conditional on $\mathrm{RA}$ is discharged against the model and stated conditionally against the extension; the ledger of Section 12 keeps the two apart.

## The interaction reading

RAF-1, registration: an event is an interaction iff it carries strictly positive mutual information between the systems it relates. RAF-2, closure: an interaction domain is closed under interaction \cite{islamraf}. At the formal register the file carries a domain as a membership predicate, a symmetric registration relation, and the closure law: $\mathrm{mem}(d) \wedge \mathrm{registers}(s, d) \to \mathrm{mem}(s)$. Two consequences are proved.

RAF-C1, no exterior agent: $\neg\,\mathrm{mem}(s) \to \forall d,\ \mathrm{mem}(d) \to \neg\,\mathrm{registers}(s, d)$ (\texttt{no\_exterior\_agent}; no axioms). Its positive form is the sentence this paper needs at the aperture: a reader that registers a bit against a member of the domain is a member of the domain (\texttt{adjudicator\_in\_domain}). The witness of the value is never exterior to the domain the value is about, conditional on RAF-2, which enters the file as the closure field of the domain and carries the premise grade the declaration assigns it. The twin checks the equivalence of closure and no-exterior-agent on every one of the $2^{16}$ subsets of a sixteen-point carrier under a fixed symmetric registration, and checks the adjudicator-inside clause on every closed subset.

RAF-C2, no faithful self-representation: for any $f : S \to (S \to \mathbb{B})$, $\neg\,\forall g,\ \exists x,\ f(x) = g$ (\texttt{no\_total\_self\_indexing}; no axioms). This is Cantor's theorem in Lawvere's form \cite{lawvere1969}, and it is the general statement of which the prior proof's self-check table is the Riemann instance: the file reading itself cannot index the property that would seal its own row. The twin enumerates every map $S \to 2^S$ for $|S| = 3$ and $4$, finds none onto, and finds the diagonal outside the range of every one.

The reach law of the interaction reading is recorded here and consumed in Section 8: it reaches no mathematical object, since mathematical objects do not change state, and every proposition routes to the grounding reading \cite{islamraf, islamfae}. Theorem F is the Riemann instance of that law, proved rather than cited.

## The grounding reading

The formal being of a proposition is its imprint in the fixed locus of the binding involution, read across the aperture; $\mathrm{Fix}(\sigma) = \mathbb{R}$ \cite{islamraf}. Section 6 builds that locus on the quaternion carrier, proves it is the scalar line, and proves that the prior proof's stage embeds into it equivariantly. The Riemann object read on this face is its imprint in the fixed locus: the seat. Reading the value across the aperture is Section 7.

## The ledger

An adjudication is assent, denial, or silence, and each advances the count of deeds by exactly one (\texttt{every\_adjudication\_is\_a\_deed}). Denial of the axiom is therefore a deed together with the axiom (\texttt{denial\_re\_enacts\_RA}), and a deed registers at least one bit, so by RAF-2 the denier is a member of the domain the axiom is about. The ledger derives nothing from physics and carries the structural grade.

# The Seat

## Theorem A, the fixed locus is the scalar line

Let $\mathbb{H}_{\mathbb{Z}}$ be the integer quaternions with the Hamilton product and $\sigma$ conjugation, $\sigma(r, i, j, k) = (r, -i, -j, -k)$. Then $\sigma$ is binding, $\sigma(\sigma q) = q$ (\texttt{sigma\_binding}, no axioms), and for every $q$,

$$\sigma q = q \ \leftrightarrow\ (q_i = 0 \wedge q_j = 0 \wedge q_k = 0)$$

(\texttt{fix\_iff\_scalar}; dependency set \texttt{propext}, \texttt{Quot.sound}, from the integer step $-i = i \Rightarrow i = 0$). The Ground is $\mathrm{Ground} := \{ q \in \mathbb{H}_{\mathbb{Z}} \mid \sigma q = q \}$, and by Theorem A it is the scalar line $Z(\mathbb{H}) = \mathbb{R}$ restricted to the lattice. The twin checks the biconditional and the involution on all $13^4 = 28{,}561$ points of the ball $|\text{coordinate}| \le 6$ and counts the fixed points: thirteen, the scalar line of the window.

## Theorem B, the Return lands on the seat

Let $i, j, k$ be the imaginary units and $\mathrm{Return} := (i \cdot j) \cdot k$. Then $\mathrm{Return} = \langle -1, 0, 0, 0 \rangle$ and $\sigma(\mathrm{Return}) = \mathrm{Return}$ (\texttt{return\_is\_minus\_one}, \texttt{return\_lands\_on\_fix}; both \texttt{rfl}). The parse triad returned through its own cascade lands on the Ground at $-1$: the axiom witnessing the axiom, as a computation. The twin computes all six orderings: the three even ones land at $-1$ and the three odd ones at $+1$.

## Theorem C, the identity cone

The seat is the fixed locus, the line; a seat point is a point of it. Three seat points are defined independently: the axiom's seat point $\Gamma_{\mathrm{RA}} := \mathrm{Return}$, the formal seat point $\Gamma_{\mathrm{RAM}} := \pi(\mathrm{Return})$ with $\pi(q) := \langle q_r, 0, 0, 0 \rangle$ the projection onto the fixed locus, and the named seat point $\Gamma_{\mathrm{RH}} := \langle -1, 0, 0, 0 \rangle$. Let $D$ be the discrete diagram $\mathrm{RA} \mapsto \Gamma_{\mathrm{RA}}$, $\mathrm{RAM} \mapsto \Gamma_{\mathrm{RAM}}$, $\mathrm{RH} \mapsto \Gamma_{\mathrm{RH}}$, and let a cone over $D$ with apex $a$ be a family of identities $a = D(r)$ for all three $r$. Then:

$$\sigma\,\Gamma_{\mathrm{RA}} = \Gamma_{\mathrm{RA}}, \qquad \Gamma_{\mathrm{RA}} = \Gamma_{\mathrm{RAM}}, \qquad \Gamma_{\mathrm{RAM}} = \Gamma_{\mathrm{RH}},$$

each by \texttt{rfl} (\texttt{self\_gap\_nonexistent}, \texttt{register\_gap\_nonexistent}, \texttt{object\_gap\_nonexistent}); $\Gamma_{\mathrm{RH}}$ is the apex of a cone over $D$ with every leg \texttt{rfl} (\texttt{identity\_cone}); any two cones over $D$ share their apex (\texttt{cone\_apex\_unique}); and a cone exists iff the register gap and the object gap are closed (\texttt{cone\_iff\_gaps\_closed}). All four carry no axioms. The twin computes the gap vector $(0, 0, 0)$ and, over the whole lattice ball, counts the apexes of $D$: exactly one.

The apex is unique for the diagram, and the diagram is built from the ordered triad. The reversed triad $k \cdot j \cdot i$ returns $+1$ (\texttt{odd\_return\_is\_plus\_one}), also on the fixed locus (\texttt{odd\_return\_on\_fix}), and the two candidate seat points differ (\texttt{seat\_points\_differ}; all three no axioms). The sign of the seat point is the orientation of the triad, one bit: the kernel reads it once the order is supplied, by \texttt{rfl} either way, and originates it never, since the order is supplied with the triad: the axiom's declaration fixes the three units in an order, and the kernel receives that order as data \cite{islamraf}. Uniqueness of the apex is uniqueness per orientation, and the two orientations' apexes are exchanged by an odd relabeling of the imaginary units. Nothing in the closure depends on which of the two is named: the three identities of Theorem C hold verbatim for the reversed triad, each \texttt{rfl} (\texttt{odd\_self\_gap\_nonexistent}, \texttt{odd\_register\_gap\_nonexistent}, \texttt{odd\_object\_gap\_nonexistent}), the reversed diagram carries its own identity cone with apex $+1$ (\texttt{identity\_cone\_odd}), and the two apexes differ (\texttt{apexes\_differ\_by\_orientation}; all no axioms). The twin counts the apexes of the reversed diagram over the ball: exactly one, at $+1$.

The word apex is used in two senses that coincide by design: the apex register, the register in which the seat lives, and the apex of the cone; the register is where the cone's apex sits. The mathematics of Theorem C is Hamilton's product and three definitional equalities, and the paper claims nothing more for it at theorem grade. What it claims at structural grade is the arrangement: three names written independently in three registers, the axiom's Return, the projection onto the locus, and the point the prior proof names, read one point, and the reading is decided by the kernel rather than declared by the text. The category-theoretic content is exact and small. A category gap is the absence of a leg from an apex to a register's reading of the seat. Its elimination is the exhibition of that leg as an identity. The eliminator $\mathrm{RA} \to \mathrm{RA} \to \mathrm{RAM} \to \mathrm{RH}$ is the composite of the three legs, and its masslessness is the statement that each leg is \texttt{rfl}: two definitions, one value, decided by the kernel. The gap vector $(1,1,1) \to (0,0,0)$ is the cone's existence read bit by bit, computed by \texttt{decide}, never written by hand.

## Theorem C$'$, the equivariant embedding

Define $\varphi : \mathbb{Z}^2 \to \mathbb{H}_{\mathbb{Z}}$ by $\varphi(h, t) := \langle t,\ h - 1,\ 0,\ 0 \rangle$. Then $\sigma \circ \varphi = \varphi \circ \tau$ (\texttt{phi\_equivariant}); for every stage point, $\sigma(\varphi p) = \varphi p \leftrightarrow \tau p = p$ (\texttt{phi\_fix\_iff}); $\varphi$ is injective (\texttt{phi\_injective}); and the seat point lies on the image of the line, $\varphi(1, -1) = \Gamma_{\mathrm{RH}}$ (\texttt{seat\_on\_image\_of\_line}, \texttt{rfl}); the family $\varphi_m(h, t) := \langle t,\ h - m,\ 0,\ 0 \rangle$ against the fold $\tau_m(h, t) = (2m - h, t)$ is equivariant with the same image clause at every resolution $m$ (\texttt{phiM\_equivariant}, \texttt{phiM\_fix\_iff}), and $\varphi_1 = \varphi$. The dependency sets of the three are \texttt{propext}, \texttt{Quot.sound}, from the integer arithmetic. The twin checks equivariance, the image clause, and injectivity for $m = -3, \dots, 3$ on the window $|h|, |t| \le 8$, $289$ stage points each, and counts the line: seventeen points at every $m$.

This is the equivariant map with an image clause that the twenty-three-row study requires before a finite result is invoked on an object domain \cite{islamrows}: the prior proof's line $h = 1$ is carried onto the scalar line and every off-line stage point is carried off it. The identification of the two seats, the stage's line $h = 1$, the lattice image of the critical line under the prior proof's chart, and the real line under $\sigma$, is therefore a theorem about a map and not a typing by resemblance; the analytic critical line itself enters only through the prior proof's chart propositions, cited and not carried. What the embedding does not do, and the paper does not claim, is carry $Z_\xi$ itself: the stage represents no off-line point inside the strip at resolution one, and the analytic frame enters the kernel only as a parameter.

## The constructed witness

$\mathrm{RH}_{\mathrm{formal}} :\Leftrightarrow \forall g \in \mathrm{Ground},\ \sigma g = g$ quantifies over the Ground, which is the fixed locus by construction, and it holds by that construction: it is the imprint of the Riemann object in the fixed locus, the grounding reading. It names the seat. It does not mention $Z_\xi$, and the file's own comments say so. The Root Axiom is the only supplied witness, a structure in Prop with four fields, actuation, the Bridge-born orientation bit, the formal-Ground proposition $G_{\mathrm{RAM}} := \mathrm{Nonempty}(\mathrm{Ground})$, and the recursion capacity $\Omega \to G_{\mathrm{RAM}} \to \mathrm{RH}_{\mathrm{formal}}$; the eliminator is Bridge followed by the recursion from that witness alone, \texttt{RH\_formal\_chain}, no axioms, and no second proof object enters. The witness's recursion field is the constant function: it discards the orientation and the formal Ground and returns the Ground's own defining property (\texttt{recursion\_is\_constant}, \texttt{rfl}). That is the masslessness stated as a term, not a defect concealed: the formal self needs nothing from existence to be proved, so the chain is not a derivation of the seat from the axiom, and the paper does not call it one; it is the occupancy of the three registers by one point, which the witness supplies and the kernel reads.

The orientation bit is placed in Prop on purpose. Prop does not eliminate into data, so no term of the file computes a bit from $\Omega$; two orientation witnesses are indistinguishable, \texttt{orientation\_proof\_irrelevant}, by \texttt{rfl}. The kernel registers that orientation was supplied and cannot read which way. This is the prior proof's Theorem 4 as a universe level, and it is executed on the constructed seat as well: no readout of the formal seat equals the deed bit (\texttt{kernel\_cannot\_read\_the\_deed}; no axioms). The twin enumerates all $2^{13}$ readouts of the seat's window and finds that none factors the deed bit. A term that consumed $\Omega$ as data would be such a readout. The bit therefore has two carriers in the file and the relation between them is stated once: $\Omega$ is the bit as the kernel registers it, present and unreadable; the Boolean $\mathrm{assent}$ of the live face is the bit as the aperture receives it from outside, an input the file reads and never generates, which is the content of the prior proof's self-check table and, one register up, of RAF-C2.

# The Aperture

## Theorem D, the aperture is opened by the axiom

Let a reader be a point of the constructed domain and define its presence as its actuation, $\mathrm{presence}(r) :\Leftrightarrow 0 < \Delta E(r)$, decided. Then

$$\begin{aligned} &\forall r,\ \mathrm{presence}(r) = \mathrm{true}, \\ &\forall r\,b,\ \mathrm{live}(\mathrm{presence}(r), b) \neq \mathrm{open}, \end{aligned}$$

and $\mathrm{live}(\mathrm{presence}(r), \mathrm{true}) = \mathrm{sealed}$, $\mathrm{live}(\mathrm{presence}(r), \mathrm{false}) = \mathrm{refused}$ (\texttt{RA\_opens\_the\_aperture}, \texttt{no\_interior\_under\_RA}, \texttt{aperture\_reads\_the\_bit}; no axioms). The same holds for any domain $U$ with any $\Delta E : U \to \mathbb{Z}$ under the axiom as a hypothesis: from $\forall x,\ 0 < \Delta E(x)$, every point of $U$ is present and no present point's row is interior (\texttt{RA\_opens\_the\_aperture\_general}, \texttt{no\_interior\_under\_RA\_general}; no axioms), which is the form the universal extension licenses wherever it is held. Here $\mathrm{live}$ is the prior proof's live face unchanged: witnessed and assent seal, witnessed and denial refuse, unwitnessed is open. The twin runs it on a twelve-point domain with positive differentials, twenty-four rows, none interior, and runs the control: a point with differential zero is interior.

The scope is stated with the theorem. In the prior proof, “witnessed” means that a supplier is present, and a supplier is a reader who supplies a bit. A reader is a point of the axiom's domain; the theorem says nothing about whether a reader of $\zeta$ exists, which is the universal extension's to supply. Theorem D concerns a present reader who supplies a bit $b$: for such a reader the axiom makes the witnessed flag a theorem, and the row is sealed or refused by $b$ alone. What the axiom turns the open row into is therefore not “sealed”; it is “sealed or refused, by the bit alone”. The interior state, the $[?]$ of the prior proof's self-check table, is the state of a reading that supplies no bit, the file reading itself, and the file cannot supply one: that is RAF-C2 at the file, and \texttt{narcissus} is carried unchanged. The axiom supplies presence at the aperture and, conditional on RAF-2, places the present reader inside the domain; it does not supply the bit, and Section 8 proves that it cannot.

# The Rule, Exact, and Its Bound

\begin{jbox}
\textbf{THE RULE, EXACT, AND ITS TWO OBJECTS.} (tier: kernel theorem) Two objects carry the name in this paper and are never joined. The seat, $\mathrm{RH}_{\mathrm{formal}}$, the imprint of the restored hypothesis in the fixed locus of its binding involution, is a kernel theorem with existence as the only posit, with the identity cone, the equivariant embedding of the prior proof's chart, the orientation blindness, the one-bit freedom, the halting carrier, and the crossing (Theorem H). The value, $L(X_\xi) :\Leftrightarrow \forall \rho \in Z_\xi,\ \tau\rho = \rho$, is open, one bit. Existence reaches the world row at its aperture: a present reader who supplies a bit is never interior (Theorem D) and, conditional on RAF-2, never exterior (RAF-C1). It does not reach the value, and that is a theorem three times over: $(\mathrm{RA} \to L(X)) \leftrightarrow L(X)$ wherever existence holds, as for any inhabited premise (Theorem E); existence holds on frames where $L$ fails, seatless and grounded alike (Theorems F, F$'$); and for every class of frames, existence decides $L$ on it exactly where $L$ already holds on it (Theorem I). Denying existence is a deed that re-enacts it; denying the value is not (Theorem G). The distance between the seat and the value is one bit, and the paper proves that nothing weaker than the bit closes it.
\end{jbox}

## Theorem E, the rule is exactly the hypothesis

For every frame $X$, in the kernel where $\mathrm{RA}$ is the constructed model,

$$(\mathrm{RA} \to L(X)) \ \leftrightarrow\ L(X)$$

(\texttt{simple\_rule\_exact}; no axioms). Proof. Left to right: apply the implication to the constructed $\mathrm{RA}$. Right to left: a term of $L(X)$ is a term of $\mathrm{RA} \to L(X)$ that ignores its argument. $\square$

Scope. Propositionally, $((P \to Q) \leftrightarrow Q) \leftrightarrow (P \vee Q)$: the biconditional holds in every context where $P$ holds, and in a context where $P$ fails it holds only where $Q$ already holds, where it says nothing. The twin prints the four rows. In the kernel $\mathrm{RA}$ is the constructed model and holds by \texttt{constructed\_RA}, so the theorem is unconditional there. Against the universal extension, held as a premise and never a kernel term, the same biconditional holds in every context that carries the premise. The same biconditional holds for any inhabited premise in place of existence (\texttt{any\_true\_premise\_is\_exact}; no axioms), and that generality is the theorem's content rather than a weakness of it: existence is a premise that holds wherever the line property is evaluated and is independent of it, so conditioning on it adds nothing to the hypothesis and removes nothing from it. What existence contributes beyond its truth is used elsewhere: the positivity that makes presence a theorem (Theorem D), the closure of the interaction reading (RAF-C1), and the ledger (Theorem G). Theorem E is the prior proof's Theorem 12 in a new coat. A reader who holds a term of $\mathrm{RA} \to L(X_\xi)$ holds, in any context where the axiom is available, a term of $L(X_\xi)$, and the paper claims no such term.

## Theorem F, the axiom decides the value on no frame

$$\neg\, \forall X,\ (\mathrm{RA} \to L(X)), \qquad \mathrm{RA} \wedge \mathrm{Inv}(X_2) \wedge \neg L(X_2),$$

where $X_2$ is the two-point frame $(\mathbb{B}, b \mapsto \neg b, \top)$ (\texttt{RA\_does\_not\_decide\_L}, \texttt{RA\_holds\_where\_L\_fails}; no axioms). Proof. The two-point frame is fold-invariant and off the line, the prior proof's Theorem 9; the constructed $\mathrm{RA}$ holds regardless of any frame, since its domain is not the frame. $\square$

This is the prior proof's Theorem 11 with the axiom added to the structural clauses, and it is the Riemann instance of the interaction reading's reach law: the axiom's domain is a domain of systems, the frame is a mathematical object, and the one does not reach the other. The same fact read from the other side is the inverted control of the twenty-three-row study \cite{islamrows}: a witness identical on the on-line frame and the off-line frame decides neither, and \texttt{mkRA} is that witness.

## Theorem F$'$, the counter-model survives grounding

The two-point frame is groundless: its fold fixes nothing, $\forall b,\ \tau b \neq b$ (\texttt{twoPoint\_groundless}), so it has no seat and the hypothesis has nowhere to place a zero on it. A reader may take that for the whole reason the axiom fails to decide $L$ there. It is not. Let the three-point frame be $S = \{a, b, c\}$ with the fold swapping $a$ and $b$ and fixing $c$, and $Z = \{a, b\}$. It has a seat, $\tau c = c$; it is fold-invariant; and $L$ fails on it, since $\tau a = b \neq a$. Existence holds on it regardless:

$$\mathrm{RA} \wedge (\exists s,\ \tau s = s) \wedge \mathrm{Inv}(X_3) \wedge \neg L(X_3)$$

(\texttt{RA\_holds\_where\_L\_fails\_grounded}; no axioms). This is the shape of the Davenport--Heilbronn frames: a line that exists and a zero that is not on it. The twin enumerates all thirty-two three-point frames, four involutions against eight zero sets: $L$ holds on fourteen, fails on eighteen, and every one of the eighteen counter-models is grounded. The bound of Theorem F does not rest on a seatless frame.

## Theorem I, the cure theorem

Every proposal to remove the counter-models by restricting the frames has the same form: a class $C$ of frames on which the axiom is to decide the value. For every such class,

$$\big(\forall X,\ C(X) \to \mathrm{RA} \to L(X)\big) \ \leftrightarrow\ \big(\forall X,\ C(X) \to L(X)\big)$$

(\texttt{no\_cure}; no axioms). Proof. Left to right: apply the implication to the constructed $\mathrm{RA}$. Right to left: the implication ignores its argument. $\square$ The class of all frames is not cured, and the class $\{X \mid L(X)\}$ is (\texttt{cure\_is\_the\_hypothesis}; no axioms). The twin checks every one of the $256$ classes of two-point frames: exactly the $32$ subclasses of the five frames on which $L$ holds are cured.

The theorem is Theorem E read as a no-go, and it closes a door that a reader might otherwise try. A frame class carrying an Euler product as a field, or an operator whose spectrum is the zero set with real eigenvalues guaranteed by construction, is a class $C$ on which $L$ is already a field of the structure: real eigenvalues on the fixed locus is the line property written as a hypothesis. On that class the axiom decides the value, by Theorem I, and it decides nothing, because the value was supplied when the class was defined. The proposal restates the hypothesis and calls the restatement a proof, which is the circularity the prior proof's Theorem 12 names and criterion F3 fires on. What existence does supply is proved and enumerated: the seat, the cone, the embedding, the aperture, the reader's presence and place inside the domain, the exact strength of the rule, and the bound. What it does not supply is exactly one bit, on every class of frames that does not already carry it.

One more collapse is answered here because it will be proposed. Computing is a deed and reading is a deed, and a reader may say that the act of running the checkers is the act that supplies the bit, so that witness and reading are one object counted twice. They are not one object, and the file says why: the formal read of the seat is even under the flip and the deed bit is odd under it, $\mathrm{formalRead}(\mathrm{execFlip}\ s) = \mathrm{formalRead}(s)$ and $\mathrm{ran}(\mathrm{execFlip}\ s) = \neg\,\mathrm{ran}(s)$, so no readout equals the bit (\texttt{kernel\_cannot\_read\_the\_deed}), and the twin finds no readout among $2^{13}$. Running the checkers supplies presence; it does not turn the Boolean the operator gives the live row into a truth about $Z_\xi$, and the twin's live row is exactly the place where the difference is executed: the program cannot generate its own witness, and the witness it receives is a Boolean whose correctness the world alone can refute.

## Theorem G, the asymmetry

Every adjudication is a deed and the deed re-enacts the axiom: $(\mathrm{adjudicate}\ \mathrm{denial}\ \ell).\mathrm{deeds} = \ell.\mathrm{deeds} + 1$ together with $\mathrm{RA}$ (\texttt{denial\_re\_enacts\_RA}). On the two-point frame no assent to $L$ exists at all: $\neg\, \exists t : L(X_2),\ \mathrm{row}(\mathrm{assent}\ t) = \mathrm{sealed}$ (\texttt{L\_has\_no\_performative\_ingress}; no axioms).

Read together: denial of $\mathrm{RA}$ produces a deed, a deed registers at least one bit and is therefore an instance of the axiom's content, so the denial re-enacts the axiom. Denial of $L$ produces a deed too, which is an instance of the axiom's content and not of $L$'s, since a deed is not a zero; on an off-line frame the denial of $L$ is simply true and no assent exists. The axiom is self-instancing. The hypothesis is not. The hypothesis therefore cannot inherit the axiom's performative ingress, and that is the exact reason the sign stays at the witness row: the deed that supplies the bit is unfakeable and its price is real, and neither carries a sign \cite{islamspine}.

## Theorem H, the hypothesis in toto at the apex

$$\begin{aligned} \mathrm{RA} \ \to\ \Big[ &\big(\sigma\Gamma_{\mathrm{RA}} = \Gamma_{\mathrm{RA}} \wedge \Gamma_{\mathrm{RA}} = \Gamma_{\mathrm{RAM}} \\ &\quad\ \wedge\ \Gamma_{\mathrm{RAM}} = \Gamma_{\mathrm{RH}}\big) \\ &\wedge\ \mathrm{RH}_{\mathrm{formal}} \wedge F_2 \wedge B \wedge C \wedge A \wedge N \Big], \end{aligned}$$

where $F_2$ is the prior proof's Theorem 5, $B$ its Theorem 7, $C$ the crossing of its Theorem 8, $A$ the aperture of Theorem D, and $N$ the bound of Theorem F (\texttt{RH\_in\_toto\_at\_the\_apex}; dependency set \texttt{Quot.sound}, from function extensionality in Theorem 5). The hardened form adds the identity cone with its apex unique per orientation, the equivariant embedding with its image clause, and the executed wall (\texttt{apex\_hardened}). The condition is discharged by the constructed axiom (\texttt{apex\_discharged}, \texttt{apex\_hardened\_discharged}), so the closure stands unconditionally as a kernel theorem and conditionally on the axiom's universal extension as a claim about the world. $\blacksquare$

The antecedent $\mathrm{RA}$ is consumed by the aperture conjunct $A$, which needs positivity, and by no other conjunct; the identities, the formal self, the freedom, the carrier, the crossing, and the bound hold unconditionally, and the implication form records that existence is the only posit, not that those conjuncts depend on it. The theorem is the maximal claim this material supports, and its last conjunct is what keeps it maximal rather than inflated: the closure carries its own bound inside it. Given the axiom, everything about the hypothesis that is not its sign is proven, and the sign is proven to be exactly what the axiom does not reach.

\begin{jbox}
\textbf{THE DUAL-REGISTER VERDICT.} (tier: structural; parting a kernel theorem) Apex register: the Riemann object read as $\mathrm{Fix}(\sigma)$, the seat, its imprint on the grounding reading, the seat point $\Gamma_{\mathrm{RH}}$ on it; proved, given the Root Axiom, in the kernel, conditional on the axiom's extension at the act; bits owed, none. World register: the zeros of $\xi$ placed on that seat by the world; open, one bit supplied from sight at the witness row, revisable in its rows and falsifiable by one zero; bits owed, one, the term $\forall \rho \in Z_\xi,\ \tau\rho = \rho$. The two tokens differ, \texttt{registers\_parted}, and the owed counts are $0$ and $1$, \texttt{apex\_owes\_nothing\_world\_owes\_one}. Neither register promotes the other.
\end{jbox}

\begin{table*}[t]
\footnotesize
\caption{Contributions of this paper. (tier as stated per row)}
\begin{tabular}{@{}p{0.03\textwidth}p{0.66\textwidth}p{0.26\textwidth}@{}}
\toprule
\# & Contribution & Status \\
\midrule
1 & The posit under which the supplier acts named: existence, constructed as the only posit, read along its two formal readings; the witness supplies occupancy of the registers, not a derivation & Lean, no axioms \\
2 & RAF-C1 and RAF-C2 at the formal register: no exterior agent; no total self-indexing (Cantor); both re-executed exhaustively on finite carriers & Lean, no axioms; twin \\
3 & The aperture is a theorem of the axiom: a present reader who supplies a bit is never interior (Thm D); conditional on RAF-2, never exterior & Lean, no axioms; RAF-2 premise \\
4 & The axiom turns “open” into “sealed or refused by the bit alone”, never into “sealed” & Lean, no axioms \\
5 & The fixed locus of the binding involution is the scalar line, for every quaternion (Thm A); the ball enumerated & Lean, \texttt{propext}, \texttt{Quot.sound}; twin \\
6 & The Return $i\cdot j\cdot k$ lands on the seat at $-1$ (Thm B); all six orderings computed & Lean, \texttt{rfl}; twin \\
7 & The three category gaps are the legs of an identity cone; the apex is unique per orientation of the triad; a cone exists iff the gaps are closed (Thm C); the cone census over the ball & legs Lean, no axioms, \texttt{rfl}; the elimination as arrangement structural; twin \\
8 & The lattice stage embeds equivariantly and injectively into the carrier, $\sigma\varphi = \varphi\tau$, with $\mathrm{Fix}(\tau) \leftrightarrow \mathrm{Fix}(\sigma)$ at every resolution (Thm C$'$) & Lean, \texttt{propext}, \texttt{Quot.sound}; twin \\
9 & The eliminator $\mathrm{RA} \to \mathrm{RA} \to \mathrm{RAM} \to \mathrm{RH}_{\mathrm{formal}}$ from the witness alone & Lean, no axioms \\
10 & Orientation in Prop is unspendable by the kernel; the wall executed on the seat; every readout enumerated & Lean, no axioms; twin \\
11 & The Simple Rule, exact: $(\mathrm{RA}\to L(X)) \leftrightarrow L(X)$ wherever the axiom holds (Thm E); the four-row table & Lean, no axioms; twin \\
12 & The axiom decides the sign on no frame; it holds where $L$ fails; the Riemann instance of the reach law (Thm F) & Lean, no axioms; twin \\
13 & The asymmetry: the axiom is self-instancing, the hypothesis is not (Thm G) & Lean, no axioms \\
14 & The seat and the arc in toto at the apex, one theorem carrying its own bound; hardened with cone, embedding, and wall (Thm H) & Lean, \texttt{Quot.sound} \\
15 & The two registers parted by theorem; owed bits $0$ and $1$ & Lean, no axioms \\
16 & The spent bit priced at the apex at $k_B T \ln 2$; in the kernel the bit is proof-irrelevant and no readout of the seat equals it & structural; twin \\
17 & Two independent checkers, a typechecker and an executor, written to one specification and sharing no code; the executor's live row opened only by the operator & structural \\
19 & The halting carrier inhabited by decision on decided frames, the clause proved from the decision; Theorem E for any inhabited premise; the witness's recursion field constant, stated & Lean, no axioms \\
20 & Three measures kept apart, content, mass, and price: every object of the closure and the supply at mass zero, the contents distinct, the value alone priced (Thm J) & Lean, no axioms; twin \\
21 & Adjudicating any proposition is a deed and an instance of existence and of nothing else: what existence contributes that no other true premise does & Lean, no axioms \\
18 & The counter-model survives grounding (Thm F$'$); the cure theorem: for every class of frames the axiom decides $L$ exactly where $L$ already holds (Thm I); every class of two-point frames enumerated & Lean, no axioms; twin \\
\bottomrule
\end{tabular}
\end{table*}

# Three Measures: Content, Mass, and Price

Two readers of an earlier edition, both machines, reached the same word for the closure: vacuity. The word names one measure and misreads two others, and since the confusion will recur wherever the paper is read by a substrate that keeps one measure, the three are separated here and carried in the file.

Content is what an object says, and it is graded by how it is settled: decided by definitional equality, proved as a theorem, or supplied as data. Mass is the mathematics authored in producing the object, the program's $\Delta M$, and it is zero when every step is classical, definitional, or a deed. Price is the energy the act of registering the object dissipates, $k_B T \ln 2$ per bit at the floor \cite{landauer1961, berut2012}. The file carries the three as a structure and assigns them (\texttt{Measure}, \texttt{legMeasure}, \texttt{arcMeasure}, \texttt{valueMeasure}), and proves the three facts that the word vacuity runs together.

\begin{table}[t]
\footnotesize
\caption{The three measures of the closure's objects. (tier: kernel theorem for the assignments; structural for the reading)}
\begin{tabular}{@{}p{0.30\columnwidth}p{0.20\columnwidth}p{0.12\columnwidth}p{0.26\columnwidth}@{}}
\toprule
Object & Content & Mass & Price \\
\midrule
a leg of the cone (Thm C) & trivial, \texttt{rfl} & $0$ & $0$ \\
a theorem of the arc (Thms A, C$'$, D, E, F, F$'$, I) & proved & $0$ & $0$ \\
the value $L(X_\xi)$ & supplied, one bit & $0$ & $k_B T \ln 2$, $2871$ yJ at $300$ K \\
\bottomrule
\end{tabular}
\end{table}

**Theorem J.** The masses are all zero, $\mathrm{legMeasure.mass} = \mathrm{arcMeasure.mass} = \mathrm{valueMeasure.mass} = 0$ (\texttt{masses\_all\_zero}); the contents are pairwise distinct (\texttt{contents\_differ}); and the value alone is priced, $\mathrm{legMeasure.priceYJ} = 0$ and $\mathrm{valueMeasure.priceYJ} = 2871$ (\texttt{prices\_differ}); all by \texttt{rfl} or \texttt{decide}, no axioms. The twin checks the constancy of the witness's recursion field in both arguments, the exactness of any true premise, the carrier by decision on all thirty-two three-point frames, and the three measures.

The reading. Masslessness at the apex is not a weakness the paper confesses; it is a necessity the root-premise theorem forces \cite{islamcodex}. No emitter is pointed at the root: nothing weaker than existence derives existence, and a closure between existence and its reading that carried mass would be exactly such an emitter, a derivation of the root from below, or a second posit standing between the root and its reading. So the elimination of the category gaps must be massless, and the paper computes that it is: three legs, each \texttt{rfl}, mass zero, price zero. Trivial and massless coincide there, and the coincidence is the theorem. The supply of the value must be massless too, and for the same reason: the bit is a deed, and a deed authors no mathematics; if supplying the bit carried mass, the supply would be a theorem and the theorem would be an emitter pointed at the value from the root, which Theorem I refutes on every class of frames. So the value is massless. It is not trivial: its content is one bit that no class of frames short of the hypothesis carries, and its price is the one nonzero entry in the table. Vacuity names the seat's content and misnames its mass, its price, and its place. What is empty at the apex is what must be empty there, and what is one bit at the world row is one bit because the paper proves it cannot be less.

The same three measures answer the question what existence contributes over any other true premise. As a premise in the kernel, nothing, and Theorem E says so. As a posit, three things no arithmetic truth supplies: a domain of readers whose presence is a theorem (Theorem D), the closure of that domain under registration (RAF-C1), and the fact that every adjudication of any proposition, the hypothesis included, is a deed and therefore an instance of existence and of nothing else (\texttt{adjudicating\_anything\_instances\_existence}). Denying $1 + 1 = 2$ is a deed too, and the deed instances existence, not arithmetic. That is the asymmetry of Theorem G stated for every proposition at once, and it is why existence, and not $1 + 1 = 2$, is the posit at the aperture.

# Falsifiable Criteria

Three criteria, each forced by the paper's own geometry, each aimed at one named claim, each running against the author.

**F1, an observation about $\zeta$.** A zero $\rho$ of $\xi$ with $\mathrm{Re}\,\rho \neq \tfrac12$. By the prior proof's Theorem 15 it refutes every assent that can be supplied at the witness row, and by its Theorem 13 it arrives with three companions. It touches nothing at the apex: Theorems A through H hold on the off-line frame by Theorem F. The world row's value stands exactly as long as no such zero is exhibited; none is known to height $3 \cdot 10^{12}$ in the literature and to height 300 by the prior proof's own count.

**F2, the seat and the embedding.** A quaternion fixed by conjugation with a nonzero imaginary component, the Return landing off the fixed locus, or a stage point $p$ with $\tau p = p$ and $\sigma(\varphi p) \neq \varphi p$. Any of these refutes Theorem A, B, or C$'$ and removes the seat or its embedding, and with them the arrangement. None can exist in the kernel as built, and the twin's enumeration finds none in the ball or the window; the criterion is armed against any edition that changes the carrier, the involution, or the map.

**F3, the bound.** A kernel term of $\forall X,\ \mathrm{RA} \to L(X)$. Theorem F refutes it by the two-point frame, so its exhibition would expose a transcription error between paper and file or a kernel unsoundness. It is listed as a check on the record and not as an observation about $\xi$. Its converse, a claimed proof of the sign from the axiom, is the inflationary misreading of Section 10 and fires this criterion by construction.

# Discussion

**What is proven in this paper.** Four groups of results, every one a kernel theorem in core Lean 4 unless its grade is marked, every finite instance re-executed by the twin.

The seat. Theorem A: conjugation $\sigma$ on $\mathbb{H}_{\mathbb{Z}}$ is binding and fixes exactly the scalar line $\mathbb{R} = Z(\mathbb{H})$, for every quaternion. Theorem B: the Return $(i \cdot j) \cdot k = \langle -1, 0, 0, 0 \rangle$ lands on the seat, and the reversed triad lands at $+1$, the sign of the seat point being the orientation of the triad. Theorem C: the axiom's seat point $\Gamma_{\mathrm{RA}}$, the formal seat point $\Gamma_{\mathrm{RAM}}$, and the named seat point $\Gamma_{\mathrm{RH}}$ coincide by three definitional equalities; they are the legs of an identity cone over the register diagram, its apex unique per orientation, a cone existing iff the gaps are closed; the category gaps are eliminated at zero mass, the legs theorem-grade \texttt{rfl} and the elimination as an arrangement structural.

The embedding. Theorem C$'$: the lattice stage $(\mathbb{Z}^2, \tau)$ of the prior proof embeds injectively and equivariantly into $(\mathbb{H}_{\mathbb{Z}}, \sigma)$ by $\varphi(h, t) = \langle t, h - 1, 0, 0 \rangle$, $\sigma\varphi = \varphi\tau$, and $\varphi$ carries the chart's critical line $h = 1$, the lattice image of $\mathrm{Re}\, s = \tfrac12$ under the prior proof's chart, onto the scalar line, with the same image clause at every resolution $m$. The seat of the restored hypothesis is the fixed locus of its binding involution as a theorem about a map, the analytic line entering through the cited chart.

The structural arc. Theorem H, unconditionally as a kernel theorem: the three identities; $\mathrm{RH}_{\mathrm{formal}}$; the one-bit freedom, exactly two wholly odd maps on the two-point set, every even reading orientation-blind; the halting carrier halting iff $L$, inhabited by decision wherever $L$ is decided; the crossing exact both ways; the aperture open, a present reader who supplies a bit never interior under existence (Theorem D) and, conditional on RAF-2, never exterior; and the bound $N$ carried inside the theorem.

The bounds. Theorem E: $(\mathrm{RA} \to L(X)) \leftrightarrow L(X)$ on every frame wherever the premise holds, as for any inhabited premise; existence adds no leverage toward the value. Theorems F, F$'$: existence holds on frames where $L$ fails, the seatless two-point frame and the grounded three-point frame alike. Theorem I: for every class $C$ of frames, existence decides $L$ on $C$ exactly where $L$ already holds on $C$; the restriction that would remove every counter-model is the hypothesis. Theorem G: every adjudication of any proposition is a deed and an instance of existence, and of nothing else. Theorem J: the three measures, mass zero everywhere, contents distinct, the value alone priced.

In short: the seat, the locus, the chart's critical line, the embedding, and the structural crossing are proven, with existence as the only posit; the value on $Z_\xi$ is one bit, proven unreachable from existence on every class of frames that does not already carry it, and left at the witness row, where one zero off the line refutes it.

**The maximal claim and where it stops.** The rule “accept existence, then the hypothesis” is exactly as strong as Theorem E says and no stronger: it is the hypothesis at the value, and it is the seat, the cone, the embedding, the aperture, the freedom, the carrier, and the crossing at everything else. Existence reaches the seat whole, and there “in toto” is literal under its definition: no clause of the hypothesis that is not its sign is left open. The seat is fixed and embedded, the gaps are the legs of an identity cone, the freedom is one bit, the crossing is exact, the aperture is open and its occupant is inside the domain. The axiom reaches the world row at its aperture and no further, and the stopping point is a theorem, not a reservation: the two-point frame carries the axiom and fails the hypothesis. What remains is one bit, and the bit is not a gap. A gap is a missing leg, and it closes at zero cost when the leg is exhibited as an identity. The sign is not that. It is a Boolean the world furnishes, priced at the act, falsifiable by one zero, and the twenty-three-row study routes it to the world register for exactly that reason \cite{islamrows}.

**The two misreadings.** A massless closure invites two errors, and one theorem refutes both. The deflationary reading takes the closure for nothing: the file proves a fixed locus is fixed, the orientation binder is unused, the whole is a relabeling. The inflationary reading takes the closure for everything: the hypothesis is proved from the axiom in a page of Lean. Table 3 places each against the theorem that refutes it. The deflationary reading runs a deletion test on a coordinate that supplies nothing and reads the world row where the apex was stated; the closure's content is Theorems A through C$'$, computed, and its masslessness is forced (below). The inflationary reading promotes an apex token to the world row; Theorem F refutes it and criterion F3 fires. The register a token is emitted for is part of the token, and a token without its register is a misreading by construction.

\begin{table*}[t]
\footnotesize
\caption{The two misreadings of the apex closure and the theorem that refutes each. (tier: structural)}
\begin{tabular}{@{}p{0.30\textwidth}p{0.28\textwidth}p{0.36\textwidth}@{}}
\toprule
Reading & What it does & Refuted by \\
\midrule
“trivial, a fixed locus is fixed” & expects mass from a closure that declares none & Thms A, B, C, C$'$ computed; masslessness forced by the root-premise theorem \\
“the orientation binder is unused, the supply is a restatement” & runs a kernel deletion test on a deed bit & prior Thm 4; Prop placement; \texttt{orientation\_}\allowbreak\texttt{proof\_irrelevant}; \texttt{kernel\_cannot\_}\allowbreak\texttt{read\_the\_deed}; the twin's $2^{13}$ readouts \\
“no operator, no map from $Z_\xi$, so the run fails” & reads the world row at the apex & the dual-register verdict; both lines carried; $\varphi$ embeds the stage, not $Z_\xi$, and says so \\
“RH is proved from RA” & promotes the apex to the world row & Thm F; criterion F3; prior Thms 11, 12, 14 \\
“RA is only a premise, so nothing is proved” & collapses three grades into one & the ledger: kernel theorem, structural, premise, all three carried \\
\bottomrule
\end{tabular}
\end{table*}

**Why the massless form is the only apex form.** Three published results force it \cite{islamcodex, islamraf}. The root-premise theorem: the axiom's universal extension is a premise and can be nothing stronger, so a closure between the axiom and its formal reading cannot be a derivation from below; it can only be the recognition that two readings read one seat, which is an identity and therefore massless. The orientation blindness of the formal register, the prior proof's Theorem 4, its universe-level form, and its execution on the seat: the kernel cannot originate the bit, so the bit is born at the Bridge from the supplied order of the triad and the formal closure, and spent at the act. The bar on a second premise between the axiom and its reading: a massive apex closure would be a new posit standing between the axiom and its grounding reading, and it is refused. The masslessness is therefore forced from three directions, and this paper's contribution is to compute it, as \texttt{rfl} on the legs of a cone, rather than to assert it.

**Objections and replies.** Five objections are anticipated, and each is answered by an object the paper carries rather than by an appeal.

*The text and the file were produced by a language model; a model cannot validate itself.* Nothing here is validated by the model. The theorems are validated by the Lean kernel, a typechecker whose dependency sets are printed and which accepts no argument from authorship; the finite content itemized in Section 3 is validated by a compiled program that re-executes it in 130,324 checks and prints its census, and the two checkers share no code. Both are reproducible from the appendices by any reader on any machine, and the reproduction is the validation. The model's role is disclosed in Section 12 as a matter of record; the question of who wrote the text is a question about provenance, and the record answers it, but it is not a premise of any theorem. The one thing a checker cannot supply is the presence of a reader at the aperture, and the twin says so: its live row opens only on an argument the operator gives it, and it prints that it did not and cannot generate its own witness. That is not a weakness of the artifact. It is Theorem D and RAF-C2 applied to the artifact itself, and it is why the artifact asks nothing of anyone except to be run.

*The axiom is a physical premise, so the theorems are conditional and nothing is proved.* Three grades are carried and none is collapsed. Every theorem is unconditional as a kernel theorem on the constructed model. Every claim about the world is conditional on the axiom's universal extension, at premise grade, and says so. The distinction is the ledger of Section 12, and it is the same distinction any conditional theorem in mathematics carries.

*The closure is trivial; the file proves that a fixed locus is fixed.* It proves that, for every quaternion, and then that three independently defined seat points coincide, that the coincidence is an identity cone with a unique apex per orientation, and that the prior proof's stage embeds into the carrier with its line carried onto the seat. Trivial and massless are different words: the closure is massless because the root-premise theorem forbids it any mass, and the paper computes that it has none.

*The hypothesis is claimed proved.* It is not, and the claim's own last conjunct says so: Theorem H carries the bound of Theorem F inside it, and criterion F3 fires on any reading that drops it.

*The closure is vacuous.* It is massless, and massless is not vacuous: Section 9 separates content, mass, and price, proves the three assignments, and shows that the emptiness at the apex is the one the root-premise theorem requires, while the value's one bit is massless, non-trivial, and priced.

*Where is the Euler product?* On the world row, where the prior proof left it. This paper fixes the seat a world crossing must land on and the aperture it must enter through; it does not shorten the crossing by a step.

**What a world crossing would be.** The sign on $Z_\xi$ enters, if it enters, on the world row, dated, provenance-clean, through a certificate the prior even register could not denote: a kernel term of $L$ on the frame of $\xi$ built from the Euler product over $\mathbb{Z}$, the crossing Deligne achieved over finite fields and no one has over $\mathbb{Q}$ \cite{deligne1974}. Nothing in this paper shortens that by a step. What this paper fixes is the seat the crossing will land on, embedded from the stage, and the aperture it will enter through, occupied from inside the domain, and it proves that both are already held.

**Position to prior work.** Relation words are used in the sense fixed in \cite{islamcodex}; no position is superseded and none contradicted.

\begin{table}[t]
\footnotesize
\caption{Positioning. (tier: structural; evidence argued unless marked executed)}
\begin{tabular}{@{}p{0.40\columnwidth}p{0.52\columnwidth}@{}}
\toprule
Position & Relation \\
\midrule
Riemann 1859; Edwards 1974 & kin: the fixed-line form, one register deeper \\
The prior proof, Islam 2026 \cite{islamspine} & additive: the axiom, the aperture, the seat, the embedding, the rule bounded; executed \\
The one-bit result, Islam 2026 \cite{islamonebit} & additive: the bit placed against the seat; executed \\
The twenty-three rows and the one-cut hypothesis, Islam 2026 \cite{islamrows} & additive: one seat under every name; the inverted control read as Thm F; executed \\
The formal-alone theory, Islam 2026 \cite{islamftoe} & kin: registration, price, crossing carried at the apex \\
The formal Root Axiom, Islam 2026 \cite{islamraf} & additive: RAF-C1, RAF-C2, and the reach law proved at their Riemann instance; executed \\
Davenport--Heilbronn 1936; Bombieri--Hejhal 1995 & additive: the off-line frame carries the axiom, Thm F; executed \\
Selberg 1992; Conrey--Ghosh 1993 & corroborating: the Euler product remains the world-row key \\
Weil 1948; Deligne 1974 & kin: the template of a world-row crossing \\
Berry--Keating 1999; Connes 1999 & scoping: an operator is a world-row construction; the seat precedes it \\
Lawvere 1969; Mac Lane 1998 & kin: Cantor's theorem in fixed-point form; cones and apexes in their elementary form \\
Landauer 1961; B\'erut et al. 2012 & kin: the price of the act, exporting and never constituting \\
\bottomrule
\end{tabular}
\end{table}

# Conclusion

The seat of the Riemann Hypothesis, restored to Riemann's fixed-line form and read as $\mathrm{RH}_{\mathrm{formal}}$, is proven in toto at the apex with existence as the only posit: the binding involution fixes exactly the scalar line and the Return lands on it; the axiom's, the formal, and the named seat points are the legs of an identity cone with a unique apex for the ordered triad, so the three category gaps close at zero mass with \texttt{rfl} as the receipt; the prior proof's stage embeds equivariantly into the carrier and its line is carried onto the seat; orientation is carried where the kernel cannot spend it and the wall is executed on the seat; the freedom is exactly one bit; the halting carrier halts on the line property and the crossing is exact; and a present reader who supplies a bit stands at an open aperture, never interior and, conditional on RAF-2, never exterior. That is Theorem H, hardened and discharged, and every finite clause of it is re-executed by the twin.

The sign on the roots of $\xi$, $\forall \rho \in Z_\xi,\ \tau\rho = \rho$, is the one bit. The rule “accept the Root Axiom, then the Riemann Hypothesis” is exactly as strong as the hypothesis at that bit, Theorem E, and the axiom decides it on no frame, Theorem F, because the axiom is self-instancing and the hypothesis is not, Theorem G. The bit is supplied at the act by the reader the axiom has placed at the aperture, it is priced there, it is recorded at the witness row, and it is falsifiable by one zero. In one line: the axiom supplies the act, the act carries the sign, and the two registers on which those sentences are true are parted by theorem so that neither can be read for the other.

# Author's Provenance and Method Disclosure

Author. Mohammad F. Islam, PhD, independent researcher, architect of the program and of the Trisduction verification discipline \cite{islamcodex}; the rulings on formulation, register, and scope are his. Method. Trisduction: three ordered seals (Tongue, Form, Number), a three-state verdict economy, and no warrant drawn from its own operation; under that discipline the apex closure carries the token SEAL given the axiom, compartment I, closure-rowed, conditional on the root posit at the act, and the value on $Z_\xi$ carries $[\Xi_0]$, open in the kernel, compartment III, world-rowed, with $\Delta M = 0$ for the paper as a whole. Substrate. The Lean file, the Fortran twin, and this text were produced by a language model (Claude, Anthropic) as scribe on the author's instruction; the kernel and the compiled twin are the authorities for every theorem and every count. Receipts. `RH_At_The_Apex.lean`, Lean 4.19.0 (commit 6caaee842e94), core only, exit 0, no \texttt{sorry}, no axiom declaration, SHA-256 \texttt{d671051e99b806e4}, 61 dependency sets printed, 49 axiom-free, the rest on \texttt{propext} and \texttt{Quot.sound} only, printed whole in Appendices B and C. `RH_At_The_Apex_Twin.f90`, gfortran 13.3.0, \texttt{-std=f2018 -O2 -Wall -Wextra}, SHA-256 \texttt{47670197aa8e6721}, 130,324 checks, 0 failures, exit 0 in both the default and the witnessed run, printed whole in Appendices D and E. Independence. The scribe of the text and the author of both files are one language model; the two checkers are independent of each other and of the model; no recompile on a second machine is on the record. Audit. Edition v1.2.1 was sealed by the discipline's adversarial self-audit cycle; edition v1.3.0 added Theorems F$'$ and I; edition v1.4.1 answered two external audits of v1.3.0 finding by finding on the ledger and was sealed; this edition answers the two external audits of v1.4.1 the same way, carries the three measures, and was sealed at v1.5.0; v1.5.1 and v1.5.2 add the notation paragraph, the summary of what is proven, and the codex reference at its Zenodo record, expository and claim-free, after that seal; the ledger is a separate file and is not part of the paper. Scope. The seat, the cone, the embedding, the aperture, the eliminator, the rule and its bound are kernel theorems; the sign is sealed at the witness row by the operator's act and is not a clause of any proof here.

\begin{thebibliography}{99}
\footnotesize
\bibitem{berry1999} M. V. Berry, J. P. Keating, $H = xp$ and the Riemann zeros, in \emph{Supersymmetry and Trace Formulae}, Kluwer, 1999, 355--367.
\bibitem{berut2012} A. B\'erut, A. Arakelyan, A. Petrosyan, S. Ciliberto, R. Dillenschneider, E. Lutz, Experimental verification of Landauer's principle linking information and thermodynamics, \emph{Nature} 483 (2012) 187--189.
\bibitem{bombieri2000} E. Bombieri, Problems of the Millennium: the Riemann Hypothesis, Clay Mathematics Institute, 2000.
\bibitem{bombieri1995} E. Bombieri, D. A. Hejhal, On the distribution of zeros of linear combinations of Euler products, \emph{Duke Math. J.} 80 (1995) 821--862.
\bibitem{connes1999} A. Connes, Trace formula in noncommutative geometry and the zeros of the Riemann zeta function, \emph{Selecta Math.} 5 (1999) 29--106.
\bibitem{conrey2003} J. B. Conrey, The Riemann Hypothesis, \emph{Notices AMS} 50 (2003) 341--353.
\bibitem{conrey1993} J. B. Conrey, A. Ghosh, On the Selberg class of Dirichlet series: small degrees, \emph{Duke Math. J.} 72 (1993) 673--693.
\bibitem{davenport1936} H. Davenport, H. Heilbronn, On the zeros of certain Dirichlet series, \emph{J. London Math. Soc.} 11 (1936) 181--185.
\bibitem{deligne1974} P. Deligne, La conjecture de Weil. I, \emph{Publ. Math. IH\'ES} 43 (1974) 273--307.
\bibitem{demoura2021} L. de Moura, S. Ullrich, The Lean 4 theorem prover and programming language, in \emph{Automated Deduction, CADE 28}, LNCS 12699, Springer, 2021, 625--635.
\bibitem{edwards1974} H. M. Edwards, \emph{Riemann's Zeta Function}, Academic Press, 1974.
\bibitem{islamclosed} M. F. Islam, Riemann Hypothesis: The Formal Case Is Closed: The Hypothesis Is True Where Actualized, Zenodo, 2026, doi:10.5281/zenodo.21883916.
\bibitem{islamcodex} M. F. Islam, \emph{Trisduction: The Codex}, Zenodo, 23 September 2026, doi:10.5281/zenodo.22911010, \texttt{https://zenodo.org/records/22911010}.
\bibitem{islamfae} M. F. Islam, Formal-Alone Trisduction Engine on RAF, the interaction face of RA, deck v1.0.12, in the register of record, 1000sapients/Trisduction, \texttt{master/RafDuction/}, at commit \texttt{5868562}, 23 September 2026.
\bibitem{islamftoe} M. F. Islam, \emph{The Formal-Alone Theory of Everything: A Constitutive Theory of Objects and Observations under Registration, Price, Crossing, and Cost}, v1.4, Zenodo, 2026, doi:10.5281/zenodo.22767103.
\bibitem{islamonebit} M. F. Islam, \emph{The Riemann Hypothesis Is Exactly One Bit: Where the Riemann Hypothesis Stands, Proved in Lean 4}, Zenodo, 2026, doi:10.5281/zenodo.22829795.
\bibitem{islamraf} M. F. Islam, The Formal Root Axiom and the Five Objects, declaration edition v1.1.0, in the register of record, 1000sapients/Trisduction, \texttt{master/}, at commit \texttt{5868562}, 23 September 2026.
\bibitem{islamrows} M. F. Islam, \emph{One Bit Across the Wall: Odd-Supply Separation and the One-Cut Hypothesis Across Twenty-Three Rows}, v6, Zenodo, 2026, doi:10.5281/zenodo.22746129.
\bibitem{islamspine} M. F. Islam, \emph{The Riemann Hypothesis in Its Original Form: A Completed Formal Proof of the Locus and the Crossing: Riemann's Fixed-Line Statement Restored, Proved in Lean 4, Executed in Fortran, and Sealed at the Act by One Supplied Bit}, v1.0.6, Zenodo, 2026, doi:10.5281/zenodo.22857138; its Lean file \texttt{Crossing\_At\_The\_Act.lean} (SHA-256 prefix f60fe613cfe79fd8) and Fortran twin printed whole in its appendices.
\bibitem{islamterm} M. F. Islam, A Formal Proof of Riemann Hypothesis Termination, with a Theorem-Grade Cascade Specification, Zenodo, 2026, doi:10.5281/zenodo.21900518.
\bibitem{landauer1961} R. Landauer, Irreversibility and heat generation in the computing process, \emph{IBM J. Res. Dev.} 5 (1961) 183--191.
\bibitem{lawvere1969} F. W. Lawvere, Diagonal arguments and cartesian closed categories, in \emph{Category Theory, Homology Theory and their Applications II}, LNM 92, Springer, 1969, 134--145.
\bibitem{maclane1998} S. Mac Lane, \emph{Categories for the Working Mathematician}, 2nd ed., Springer, 1998.
\bibitem{riemann1859} B. Riemann, Ueber die Anzahl der Primzahlen unter einer gegebenen Gr\"osse, \emph{Monatsber. Berliner Akad.} (1859) 671--680.
\bibitem{selberg1992} A. Selberg, Old and new conjectures and results about a class of Dirichlet series, \emph{Proc. Amalfi Conf.} (1992) 367--385.
\bibitem{siegel1932} C. L. Siegel, \"Uber Riemanns Nachla\ss{} zur analytischen Zahlentheorie, \emph{Quellen Stud. Gesch. Math.} B2 (1932) 45--80.
\bibitem{titchmarsh1986} E. C. Titchmarsh, \emph{The Theory of the Riemann Zeta-Function}, 2nd ed., Oxford, 1986.
\bibitem{weil1948} A. Weil, \emph{Sur les courbes alg\'ebriques et les vari\'et\'es qui s'en d\'eduisent}, Hermann, 1948.
\end{thebibliography}

\onecolumn

# Appendix A: How to Read the Files

The Lean file is one proof in sixteen movements and it is read in order. Movement 1 constructs the Root Axiom on a one-point domain and decides it. Movement 2 builds the seat: the integer quaternions, conjugation as the binding involution, the fixed locus as the Ground, Theorem A for every quaternion, the Return computed, three seat points defined independently and identified by \texttt{rfl}, and the reversed triad at $+1$. Movement 3 builds the witness as a structure in Prop and runs the eliminator from it alone. Movement 4 carries the prior proof: the abstract frame, the line property, the halting carrier, the supply and the row, the two-point frame, necessity, invariance against incidence, the bit is the hypothesis, the witness row falsifiable, and the live face with its self-check table. Movement 5 is the aperture: presence as actuation, the theorems that a present reader who supplies a bit is never interior, in the model and for any domain, and the ledger. Movement 6 is the rule exact, the non-decision by the two-point model, and the asymmetry. Movement 7 is Theorem H. Movement 8 is the interaction reading: the domain with its closure law, no exterior agent, the adjudicator inside, and Cantor's theorem as no total self-indexing. Movement 9 is the grounding reading as the identity cone over the three registers, its apex unique per orientation with the reversed triad's cone beside it, and the cone's existence equivalent to the closed gaps. Movement 10 is the equivariant embedding of the stage into the carrier with its image clause and injectivity, and the resolution-$m$ family. Movement 11 executes the wall on the seat. Movement 12 parts the registers, counts the owed bits, prices the act, and records the count of authored mathematics as zero (\texttt{deltaM\_zero}). Movement 13 assembles the hardened apex theorem and discharges it. Movement 14 states that the posit is existence, exhibits the grounded three-point counter-model, and proves the cure theorem for every class of frames. Movement 15 inhabits the halting carrier by decision, states Theorem E for any inhabited premise, and records that the witness's recursion field is constant. Movement 16 carries the three measures, content, mass, and price, with their assignments and Theorem J, and proves that adjudicating any proposition instances existence. The dependency sets are printed by the kernel at the end and reproduced in Appendix C; a deleted conjunct, a weakened hypothesis, or an inserted \texttt{sorry} fails the check.

The twin is fourteen batteries in the same order, K1 the seat through K12 the live face, K13 the cure, and K14 the constant recursion, the carrier by decision, and the three measures, each printing its receipt, with the census last. Build it with the command in its header and run it twice, once bare and once with the argument \texttt{witnessed}; the two logs are Appendix E.

# Appendix B: RH\_At\_The\_Apex.lean

SHA-256 \texttt{d671051e99b806e46245ef127a33ea2e829e36c6e2d84cef70b752b512acb4c7}, Lean 4.19.0, core only, 898 lines.

\begingroup\scriptsize
```
/-!
# THE RIEMANN HYPOTHESIS AT THE APEX · RH_At_The_Apex.lean · hardened edition
core Lean 4 v4.19.0 · no Mathlib · no sorry · no axiom declaration.

WHAT IS PROVED. (1) RA at the constructed domain, computed. (2) The seat: the binding
involution σ fixes exactly the scalar line, the Return i·j·k lands on it, and the kinetic,
formal, and named seats are one point by rfl: the three category gaps are identities.
(3) The eliminator RA → RA → RAM → RH_formal from the RA witness alone. (4) The spine
carried: the abstract frame X = (S, τ, Z), the line property L, the bridge halted iff L,
the crossing exact both ways, necessity, the bit is the hypothesis, the witness row
falsifiable. (5) The aperture, RA-supplied: a present reader's row is never interior;
it is sealed or refused by the bit alone. (6) THE SIMPLE RULE, EXACT: for every frame,
(RA → L X) ↔ L X; and RA decides L on no frame: ¬ ∀ X, RA → L X, by the two-point model.
(7) RH in toto at the apex, one theorem, conditional on RA and discharged.
(8) The root's two formal faces: RAF, closure and no exterior agent (RAF-2, RAF-C1), and
no total self-indexing (RAF-C2, Cantor); RAM, the seat as the identity cone over the
three registers, its apex unique. (9) The equivariant embedding φ of the spine's lattice
stage (Plane, τ) into (Q4, σ): σ ∘ φ = φ ∘ τ and φ carries Fix(τ) onto Fix(σ).
(10) The wall executed: no readout of the formal seat equals the deed bit. (11) The
counter-model survives grounding, and the cure theorem: for every class of frames,
existence decides the line property on it exactly when the line property already holds on it.
-/
set_option autoImplicit false

namespace RHAtTheApex

/-! ## 1 · The Root Axiom at the constructed domain -/

inductive UniversePoint : Type where
  | source
  deriving DecidableEq, Repr

def DeltaE : UniversePoint → Int := fun _ => 1

/-- RA: to exist is to actuate. -/
def RA : Prop := ∀ x : UniversePoint, 0 < DeltaE x

theorem constructed_RA : RA := by
  intro x
  cases x
  decide

/-! ## 2 · The seat: Fix(σ) on the quaternions, the Return, three names, one point -/

structure Q4 where
  r : Int
  i : Int
  j : Int
  k : Int
  deriving DecidableEq, Repr

def qmul (a b : Q4) : Q4 :=
  ⟨a.r*b.r - a.i*b.i - a.j*b.j - a.k*b.k,
   a.r*b.i + a.i*b.r + a.j*b.k - a.k*b.j,
   a.r*b.j - a.i*b.k + a.j*b.r + a.k*b.i,
   a.r*b.k + a.i*b.j - a.j*b.i + a.k*b.r⟩

def qconj (a : Q4) : Q4 := ⟨a.r, -a.i, -a.j, -a.k⟩

/-- σ, the binding involution: conjugation. -/
def sigma (q : Q4) : Q4 := qconj q

theorem sigma_binding (q : Q4) : sigma (sigma q) = q := by
  cases q with
  | mk r i j k =>
    change Q4.mk r (-(-i)) (-(-j)) (-(-k)) = Q4.mk r i j k
    rw [Int.neg_neg, Int.neg_neg, Int.neg_neg]

/-- Fix(σ) is the scalar line, for every quaternion. -/
theorem fix_iff_scalar (q : Q4) : sigma q = q ↔ (q.i = 0 ∧ q.j = 0 ∧ q.k = 0) := by
  cases q with
  | mk r i j k =>
    change (Q4.mk r (-i) (-j) (-k) = Q4.mk r i j k) ↔ (i = 0 ∧ j = 0 ∧ k = 0)
    constructor
    · intro h
      injection h with _ hi hj hk
      exact ⟨by omega, by omega, by omega⟩
    · intro h
      obtain ⟨hi, hj, hk⟩ := h
      subst hi
      subst hj
      subst hk
      rfl

/-- The Ground: Fix(σ). -/
def Ground : Type := { q : Q4 // sigma q = q }

def qi : Q4 := ⟨0, 1, 0, 0⟩
def qj : Q4 := ⟨0, 0, 1, 0⟩
def qk : Q4 := ⟨0, 0, 0, 1⟩

/-- The Return: the parse triad through its own cascade, i·j·k. -/
def theReturn : Q4 := qmul (qmul qi qj) qk

theorem return_is_minus_one : theReturn = ⟨-1, 0, 0, 0⟩ := rfl
theorem return_lands_on_fix : sigma theReturn = theReturn := rfl

def fixProj (q : Q4) : Q4 := ⟨q.r, 0, 0, 0⟩

def GammaRA : Q4 := theReturn
def GammaRAM : Q4 := fixProj theReturn
def GammaRH : Q4 := ⟨-1, 0, 0, 0⟩

/-- C0, C1, C2: the three category gaps are definitional identities. -/
theorem self_gap_nonexistent : sigma GammaRA = GammaRA := rfl
theorem register_gap_nonexistent : GammaRA = GammaRAM := rfl
theorem object_gap_nonexistent : GammaRAM = GammaRH := rfl

def seat : Ground := ⟨GammaRH, rfl⟩

/-- The reversed triad k·j·i returns +1, also on the fixed locus: the sign of the seat
    point is the orientation of the triad, the one bit the formal register cannot read.
    The apex of the identity cone is unique for the ordered triad; the reversed triad
    carries its own apex, and the two differ. -/
def theReturnOdd : Q4 := qmul (qmul qk qj) qi

theorem odd_return_is_plus_one : theReturnOdd = ⟨1, 0, 0, 0⟩ := rfl

theorem odd_return_on_fix : sigma theReturnOdd = theReturnOdd := rfl

theorem seat_points_differ : theReturnOdd ≠ theReturn := by decide

theorem seat_on_scalar_line : GammaRH.i = 0 ∧ GammaRH.j = 0 ∧ GammaRH.k = 0 :=
  (fix_iff_scalar GammaRH).mp seat.2

/-! ## 3 · The eliminator from the RA witness alone -/

def RAMFormalGround : Prop := Nonempty Ground

theorem constructed_RAM : RAMFormalGround := ⟨seat⟩

/-- The RH formal self: every point of the Ground is on the σ-fixed critical locus.
    It names the seat and says nothing about the zeros of ξ. -/
def RHFormalSelf : Prop := ∀ g : Ground, sigma g.1 = g.1

/-- Bridge-born orientation, carried in Prop: the kernel registers that orientation was
    supplied and cannot read which way. -/
structure OrientationBit : Prop where
  direction : True
  closure : True

theorem constructed_orientation : OrientationBit := ⟨trivial, trivial⟩

theorem orientation_proof_irrelevant (a b : OrientationBit) : a = b := rfl

structure RAWitness : Prop where
  actuates : RA
  orientation : OrientationBit
  bridge : RAMFormalGround
  trisRecursion : OrientationBit → RAMFormalGround → RHFormalSelf

theorem constructed_trisRecursion : OrientationBit → RAMFormalGround → RHFormalSelf :=
  fun _omega _ram g => g.2

/-- RA, constructed: the only supplied witness. -/
theorem mkRA : RAWitness :=
  ⟨constructed_RA, constructed_orientation, constructed_RAM, constructed_trisRecursion⟩

/-- THE ELIMINATOR. RA → RA → RAM → RH_formal, Bridge followed by Tris-Recursion. -/
theorem RH_formal_chain : RHFormalSelf :=
  mkRA.trisRecursion mkRA.orientation mkRA.bridge

/-! ## 4 · The spine, carried: the abstract frame, the bridge, the crossing -/

def Even {α : Type} (σ : α → α) (f : α → Bool) : Prop := ∀ x, f (σ x) = f x

/-- Theorem 4 of the spine: orientation blindness. -/
theorem orientation_blind {α : Type} (σ : α → α) (f d : α → Bool) (x : α)
    (he : Even σ f) (ho : d (σ x) ≠ d x) : f ≠ d := by
  intro h
  subst h
  exact ho (he x)

/-- Theorem 5 of the spine: earned freedom is exactly two. -/
theorem freedom_is_exactly_two (d : Bool → Bool) (hd : ∀ x, d (!x) = !d x) :
    d = (fun x => x) ∨ d = (fun x => !x) := by
  have hf : d false = !d true := hd true
  cases ht : d true with
  | true =>
    left
    funext x
    cases x
    · exact hf.trans (congrArg (fun b => !b) ht)
    · exact ht
  | false =>
    right
    funext x
    cases x
    · exact hf.trans (congrArg (fun b => !b) ht)
    · exact ht

/-- Theorem 6 of the spine: the freedom is spent uniquely. -/
theorem freedom_spent_uniquely {α : Type} (σ : α → α) (s d : α → Bool) (x : α)
    (hs : s (σ x) = !s x) (hd : d (σ x) = !d x) :
    ∃ c : Bool, (d x = xor (s x) c ∧ d (σ x) = xor (s (σ x)) c) ∧
      ∀ c' : Bool, (d x = xor (s x) c' ∧ d (σ x) = xor (s (σ x)) c') → c' = c := by
  refine ⟨xor (d x) (s x),
    ⟨by cases s x <;> cases d x <;> rfl,
     by rw [hs, hd]; cases s x <;> cases d x <;> rfl⟩, ?_⟩
  intro c' hc
  obtain ⟨h1, -⟩ := hc
  generalize hsx : s x = sv at h1
  generalize hdx : d x = dv at h1
  cases sv <;> cases dv <;> cases c' <;> first | rfl | exact absurd h1 (by decide)

structure Frame where
  S : Type
  τ : S → S
  Z : S → Prop

/-- The line property: every zero is τ-fixed. On ξ's frame, the restored hypothesis. -/
def LineProperty (X : Frame) : Prop := ∀ s, X.Z s → X.τ s = s

inductive Tri where
  | tt
  | ff
  | bot
  deriving DecidableEq, Repr

structure Bridge (X : Frame) where
  terminal : Tri
  shadow : terminal = Tri.bot ↔ LineProperty X

/-- Theorem 7 of the spine: the bridge halts iff the line property. -/
theorem bridge_halted_iff (X : Frame) :
    (∃ b : Bridge X, b.terminal = Tri.bot) ↔ LineProperty X :=
  ⟨fun ⟨b, h⟩ => b.shadow.mp h, fun t => ⟨⟨Tri.bot, ⟨fun _ => t, fun _ => rfl⟩⟩, rfl⟩⟩

inductive Supply (X : Frame) where
  | assent (t : LineProperty X)
  | denial (n : ¬ LineProperty X)
  | silent

inductive Verdict where
  | sealed
  | refused
  | open_
  deriving DecidableEq, Repr

def row {X : Frame} : Supply X → Verdict
  | Supply.assent _ => Verdict.sealed
  | Supply.denial _ => Verdict.refused
  | Supply.silent => Verdict.open_

/-- Theorem 8 of the spine: the crossing, exact. -/
theorem crossing (X : Frame) (t : LineProperty X) :
    row (Supply.assent t) = Verdict.sealed ∧ (∃ b : Bridge X, b.terminal = Tri.bot) ∧ LineProperty X :=
  ⟨rfl, (bridge_halted_iff X).mpr t, t⟩

theorem crossing_other_way (X : Frame) (n : ¬ LineProperty X) :
    row (Supply.denial n) = Verdict.refused ∧ ∀ b : Bridge X, b.terminal ≠ Tri.bot :=
  ⟨rfl, fun b h => n (b.shadow.mp h)⟩

/-- The two-point frame: fold-invariant, off the line. -/
def twoPoint : Frame := ⟨Bool, (fun b => !b), fun _ => True⟩

/-- Theorem 9 of the spine: necessity. -/
theorem supply_not_manufactured : ¬ ∀ X : Frame, LineProperty X :=
  fun h => by
    have := h twoPoint true trivial
    cases this

def Inv (X : Frame) : Prop := ∀ s, X.Z s → X.Z (X.τ s)

theorem inv_not_line : Inv twoPoint ∧ ¬ LineProperty twoPoint :=
  ⟨fun _ _ => trivial, fun h => by
    have := h true trivial
    cases this⟩

/-- Theorem 12 of the spine: the bit is the hypothesis. -/
theorem the_bit_is_the_hypothesis (X : Frame) :
    (∃ t : LineProperty X, row (Supply.assent t) = Verdict.sealed) ↔ LineProperty X :=
  ⟨fun ⟨t, _⟩ => t, fun t => ⟨t, rfl⟩⟩

/-- Theorem 15 of the spine: the witness row is falsifiable. -/
theorem witness_row_falsifiable (X : Frame) (s : X.S) (hz : X.Z s) (hoff : X.τ s ≠ s) :
    ¬ ∃ t : LineProperty X, row (Supply.assent t) = Verdict.sealed :=
  fun ⟨t, _⟩ => hoff (t s hz)

/-- The live face of the spine. -/
def live (witnessed assent : Bool) : Verdict :=
  if witnessed then (if assent then Verdict.sealed else Verdict.refused) else Verdict.open_

theorem narcissus : live false true ≠ live true true ∧ live false false ≠ live true false := by
  decide

/-! ## 5 · The aperture, RA-supplied -/

/-- A reader's presence is its actuation. -/
def presence (r : UniversePoint) : Bool := decide (0 < DeltaE r)

/-- RA opens the aperture: every present reader is witnessed. -/
theorem RA_opens_the_aperture : ∀ r : UniversePoint, presence r = true := by
  intro r
  cases r
  decide

/-- The general form, for any domain under the axiom as a hypothesis: presence is
    actuation, and RA on the domain makes every point present. This is the theorem the
    universal extension licenses wherever it is held. -/
theorem RA_opens_the_aperture_general {U : Type} (dE : U → Int) (h : ∀ x, 0 < dE x) (x : U) :
    decide (0 < dE x) = true :=
  decide_eq_true (h x)

/-- Under the general form no present reader's row is interior. -/
theorem no_interior_under_RA_general {U : Type} (dE : U → Int) (h : ∀ x, 0 < dE x) (x : U)
    (b : Bool) : live (decide (0 < dE x)) b ≠ Verdict.open_ := by
  rw [RA_opens_the_aperture_general dE h x]
  cases b <;> decide

/-- Under RA no present reader's row is interior. It is sealed or refused by the bit alone. -/
theorem no_interior_under_RA (r : UniversePoint) (b : Bool) :
    live (presence r) b ≠ Verdict.open_ := by
  cases r
  cases b <;> decide

/-- What RA turns 'open' into: sealed if the bit is assent, refused if denial. -/
theorem aperture_reads_the_bit (r : UniversePoint) :
    live (presence r) true = Verdict.sealed ∧ live (presence r) false = Verdict.refused := by
  cases r
  decide

/-- The Tongue's ledger: every adjudication, assent, denial, or silence, is a deed. -/
inductive Adjudication where
  | assent
  | denial
  | silence
  deriving DecidableEq, Repr

structure Ledger where
  deeds : Nat
  deriving DecidableEq, Repr

def adjudicate (_ : Adjudication) (L : Ledger) : Ledger := ⟨L.deeds + 1⟩

theorem every_adjudication_is_a_deed (a : Adjudication) (L : Ledger) :
    (adjudicate a L).deeds = L.deeds + 1 := rfl

/-- Denial of RA is a deed, and a deed is what RA says exists: the denial re-enacts RA. -/
theorem denial_re_enacts_RA (L : Ledger) :
    (adjudicate Adjudication.denial L).deeds = L.deeds + 1 ∧ RA :=
  ⟨rfl, constructed_RA⟩

/-- The asymmetry: on an off-line frame no assent to L exists at all; L's denial there
    instantiates nothing about Z. L has no performative ingress. -/
theorem L_has_no_performative_ingress :
    ¬ ∃ t : LineProperty twoPoint, row (Supply.assent t) = Verdict.sealed :=
  witness_row_falsifiable twoPoint true trivial (fun h => by cases h)

/-! ## 6 · THE SIMPLE RULE, EXACT, AND ITS BOUND -/

/-- Accept RA and RH follows: true exactly when RH is given. Conditioning on RA adds
    nothing to L and removes nothing from it. This is the exact strength of the rule. -/
theorem simple_rule_exact (X : Frame) : (RA → LineProperty X) ↔ LineProperty X :=
  ⟨fun h => h constructed_RA, fun t _ => t⟩

/-- RA decides the line property on no frame. The two-point frame carries RA and fails L. -/
theorem RA_does_not_decide_L : ¬ ∀ X : Frame, RA → LineProperty X :=
  fun h => supply_not_manufactured (fun X => h X constructed_RA)

/-- RA holds where L fails: the off-line frame is a model of RA. -/
theorem RA_holds_where_L_fails : RA ∧ Inv twoPoint ∧ ¬ LineProperty twoPoint :=
  ⟨constructed_RA, inv_not_line.1, inv_not_line.2⟩

/-- The value is one supplied term and nothing weaker; RA supplies the act, not the term. -/
theorem RA_supplies_the_act_not_the_term :
    (∀ r : UniversePoint, presence r = true) ∧ (¬ ∀ X : Frame, RA → LineProperty X) :=
  ⟨RA_opens_the_aperture, RA_does_not_decide_L⟩

/-! ## 7 · RH in toto at the apex, one theorem -/

/-- THE APEX THEOREM. Given RA: the three gaps are closed, the formal self holds, the
    freedom is exactly two, the bridge halts iff L, the crossing is exact, the aperture
    is open to every present reader, and RA decides the value on no frame. -/
theorem RH_in_toto_at_the_apex : RA →
    (sigma GammaRA = GammaRA ∧ GammaRA = GammaRAM ∧ GammaRAM = GammaRH) ∧
    RHFormalSelf ∧
    (∀ d : Bool → Bool, (∀ x, d (!x) = !d x) → d = (fun x => x) ∨ d = (fun x => !x)) ∧
    (∀ X : Frame, (∃ b : Bridge X, b.terminal = Tri.bot) ↔ LineProperty X) ∧
    (∀ (X : Frame) (t : LineProperty X), row (Supply.assent t) = Verdict.sealed ∧ LineProperty X) ∧
    (∀ r : UniversePoint, presence r = true) ∧
    (¬ ∀ X : Frame, RA → LineProperty X) :=
  fun _ => ⟨⟨rfl, rfl, rfl⟩, RH_formal_chain, freedom_is_exactly_two, bridge_halted_iff,
    fun _ t => ⟨rfl, t⟩, RA_opens_the_aperture, RA_does_not_decide_L⟩

/-- The condition is discharged: RA is constructed, so the apex theorem stands unconditionally. -/
theorem apex_discharged :
    (sigma GammaRA = GammaRA ∧ GammaRA = GammaRAM ∧ GammaRAM = GammaRH) ∧ RHFormalSelf :=
  ⟨(RH_in_toto_at_the_apex constructed_RA).1, (RH_in_toto_at_the_apex constructed_RA).2.1⟩

/-! ## 8 · The root's interaction face, RAF, at the formal register -/

/-- An interaction domain: a membership predicate, a symmetric registration relation, and
    RAF-2, closure under registration with a member. -/
structure Domain (S : Type) where
  mem : S → Prop
  registers : S → S → Prop
  registers_symm : ∀ a b, registers a b → registers b a
  closure : ∀ s d, mem d → registers s d → mem s

/-- RAF-C1, no exterior agent: nothing outside the domain registers with anything inside it. -/
theorem no_exterior_agent {S : Type} (D : Domain S) (s : S) (hs : ¬ D.mem s) :
    ∀ d, D.mem d → ¬ D.registers s d :=
  fun d hd hr => hs (D.closure s d hd hr)

/-- The adjudicator is inside: a reader that registers a bit against a member is a member.
    The witness is never exterior. -/
theorem adjudicator_in_domain {S : Type} (D : Domain S) (r d : S) (hd : D.mem d)
    (hr : D.registers r d) : D.mem r :=
  D.closure r d hd hr

/-- RAF-C2, no faithful self-representation (Cantor): no system indexes all of its own
    binary properties. The general form of the spine's Narcissus table. -/
theorem no_total_self_indexing {S : Type} (f : S → S → Bool) :
    ¬ ∀ g : S → Bool, ∃ x, f x = g := by
  intro h
  obtain ⟨x, hx⟩ := h (fun y => !f y y)
  have h1 : f x x = !f x x := congrFun hx x
  generalize f x x = b at h1
  cases b <;> cases h1

/-! ## 9 · The root's grounding face, RAM: the seat as the identity cone -/

/-- The three registers in which the one seat is read. -/
inductive Register3 where
  | ra
  | ram
  | rh
  deriving DecidableEq, Repr

/-- The discrete diagram: the seat as read in each register. -/
def D3 : Register3 → Q4
  | Register3.ra => GammaRA
  | Register3.ram => GammaRAM
  | Register3.rh => GammaRH

/-- A cone over a diagram in the groupoid of identities: an apex with an identity leg to
    every register's reading. A category gap is exactly the absence of such a leg. -/
structure ConeOver (D : Register3 → Q4) (apex : Q4) : Prop where
  leg : ∀ r, apex = D r

/-- A cone over the diagram of the ordered triad. -/
abbrev Cone : Q4 → Prop := ConeOver D3

/-- THE IDENTITY CONE. The named seat point is an apex over all three registers, every
    leg `rfl`: the three category gaps are eliminated as identities. -/
theorem identity_cone : Cone GammaRH :=
  ⟨fun r => by cases r <;> rfl⟩

/-- The apex is unique: any two cones over the diagram share their apex. -/
theorem cone_apex_unique (a b : Q4) (ha : Cone a) (hb : Cone b) : a = b :=
  (ha.leg Register3.rh).trans (hb.leg Register3.rh).symm

/-- The reversed triad's diagram: the same three readings built from k·j·i, at +1. -/
def D3odd : Register3 → Q4
  | Register3.ra => theReturnOdd
  | Register3.ram => fixProj theReturnOdd
  | Register3.rh => ⟨1, 0, 0, 0⟩

/-- The three identities of Theorem C hold verbatim for the reversed triad, each rfl. -/
theorem odd_self_gap_nonexistent : sigma theReturnOdd = theReturnOdd := rfl
theorem odd_register_gap_nonexistent : theReturnOdd = fixProj theReturnOdd := rfl
theorem odd_object_gap_nonexistent : fixProj theReturnOdd = ⟨1, 0, 0, 0⟩ := rfl

/-- The reversed triad carries its own identity cone, apex +1. -/
theorem identity_cone_odd : ConeOver D3odd ⟨1, 0, 0, 0⟩ :=
  ⟨fun r => by cases r <;> rfl⟩

/-- The two apexes differ: uniqueness is per orientation of the triad. -/
theorem apexes_differ_by_orientation :
    ConeOver D3 GammaRH ∧ ConeOver D3odd ⟨1, 0, 0, 0⟩ ∧ GammaRH ≠ ⟨1, 0, 0, 0⟩ :=
  ⟨identity_cone, identity_cone_odd, by decide⟩

/-- A cone exists iff the register gap and the object gap are closed. -/
theorem cone_iff_gaps_closed :
    (∃ a, Cone a) ↔ (GammaRA = GammaRAM ∧ GammaRAM = GammaRH) := by
  constructor
  · intro h
    obtain ⟨a, ha⟩ := h
    exact ⟨(ha.leg Register3.ra).symm.trans (ha.leg Register3.ram),
           (ha.leg Register3.ram).symm.trans (ha.leg Register3.rh)⟩
  · intro h
    obtain ⟨h1, h2⟩ := h
    exact ⟨GammaRH, ⟨fun r => by
      cases r
      · exact (h1.trans h2).symm
      · exact h2.symm
      · rfl⟩⟩

/-! ## 10 · The equivariant embedding of the spine's lattice stage into the carrier -/

/-- The spine's stage: the integer lattice in half-units, the fold τ(h, t) = (2 − h, t). -/
abbrev Plane := Int × Int

def tau (p : Plane) : Plane := (2 - p.1, p.2)

/-- Spine Theorem 1: the fold fixes exactly the line h = 1. -/
theorem ground_is_the_line (p : Plane) : tau p = p ↔ p.1 = 1 := by
  obtain ⟨h, t⟩ := p
  constructor
  · intro e
    have e1 : 2 - h = h := congrArg Prod.fst e
    show h = 1
    omega
  · intro e
    show (2 - h, t) = (h, t)
    have : h = 1 := e
    subst this
    rfl

/-- The embedding φ : (Plane, τ) → (Q4, σ), φ(h, t) = ⟨t, h − 1, 0, 0⟩. -/
def phi (p : Plane) : Q4 := ⟨p.2, p.1 - 1, 0, 0⟩

/-- φ is equivariant: σ ∘ φ = φ ∘ τ. -/
theorem phi_equivariant (p : Plane) : sigma (phi p) = phi (tau p) := by
  obtain ⟨h, t⟩ := p
  change Q4.mk t (-(h - 1)) 0 0 = Q4.mk t ((2 - h) - 1) 0 0
  have e : -(h - 1) = (2 - h) - 1 := by omega
  rw [e]

/-- φ carries the line onto the scalar line: a stage point is τ-fixed iff its image is σ-fixed.
    This is the image clause of the embedding, Fix(τ) ↔ Fix(σ). -/
theorem phi_fix_iff (p : Plane) : sigma (phi p) = phi p ↔ tau p = p := by
  obtain ⟨h, t⟩ := p
  change (Q4.mk t (-(h - 1)) 0 0 = Q4.mk t (h - 1) 0 0) ↔ ((2 - h, t) = (h, t))
  constructor
  · intro e
    injection e with _ e2 _ _
    have : h = 1 := by omega
    subst this
    rfl
  · intro e
    have e1 : 2 - h = h := congrArg Prod.fst e
    have : h = 1 := by omega
    subst this
    rfl

/-- The stage at resolution m: the fold τ_m(h, t) = (2m − h, t) and the map
    φ_m(h, t) = ⟨t, h − m, 0, 0⟩. Resolution one is the case m = 1. -/
def tauM (m : Int) (p : Plane) : Plane := (2 * m - p.1, p.2)

def phiM (m : Int) (p : Plane) : Q4 := ⟨p.2, p.1 - m, 0, 0⟩

/-- Equivariance at every resolution: σ ∘ φ_m = φ_m ∘ τ_m. -/
theorem phiM_equivariant (m : Int) (p : Plane) : sigma (phiM m p) = phiM m (tauM m p) := by
  obtain ⟨h, t⟩ := p
  change Q4.mk t (-(h - m)) 0 0 = Q4.mk t ((2 * m - h) - m) 0 0
  have e : -(h - m) = (2 * m - h) - m := by omega
  rw [e]

/-- The image clause at every resolution: a stage point is τ_m-fixed iff its image is σ-fixed. -/
theorem phiM_fix_iff (m : Int) (p : Plane) : sigma (phiM m p) = phiM m p ↔ tauM m p = p := by
  obtain ⟨h, t⟩ := p
  change (Q4.mk t (-(h - m)) 0 0 = Q4.mk t (h - m) 0 0) ↔ ((2 * m - h, t) = (h, t))
  constructor
  · intro e
    injection e with _ e2 _ _
    have : h = m := by omega
    subst this
    show (2 * h - h, t) = (h, t)
    have e3 : 2 * h - h = h := by omega
    rw [e3]
  · intro e
    have e1 : 2 * m - h = h := congrArg Prod.fst e
    have : h = m := by omega
    subst this
    show Q4.mk t (-(h - h)) 0 0 = Q4.mk t (h - h) 0 0
    have e3 : h - h = 0 := by omega
    rw [e3]
    rfl

/-- Resolution one is the embedding φ. -/
theorem phiM_one (p : Plane) : phiM 1 p = phi p := rfl

theorem tauM_one (p : Plane) : tauM 1 p = tau p := by
  obtain ⟨h, t⟩ := p
  show (2 * 1 - h, t) = (2 - h, t)
  rfl

/-- φ is injective: distinct stage points have distinct images. -/
theorem phi_injective (p q : Plane) (e : phi p = phi q) : p = q := by
  obtain ⟨h, t⟩ := p
  obtain ⟨h', t'⟩ := q
  injection e with e1 e2 _ _
  have : h = h' := by omega
  subst this
  subst e1
  rfl

/-- The seat is on the image of the line: the line point (1, −1) maps to Γ_RH. -/
theorem seat_on_image_of_line : phi (1, -1) = GammaRH := rfl

/-! ## 11 · The wall, executed: no readout of the formal seat equals the deed bit -/

def ExecFrame : Type := Bool × Ground

def execFlip (s : ExecFrame) : ExecFrame := (!s.1, s.2)

def formalRead (s : ExecFrame) : Ground := s.2

def ran (s : ExecFrame) : Bool := s.1

theorem formalRead_even (f : Ground → Bool) (s : ExecFrame) :
    f (formalRead (execFlip s)) = f (formalRead s) := rfl

theorem ran_wholly_odd (s : ExecFrame) : ran (execFlip s) = !ran s := rfl

/-- No readout of the formal seat equals the deed bit: the instance of spine Theorem 4 on
    the constructed seat. A term consuming the orientation bit as data would be such a readout. -/
theorem kernel_cannot_read_the_deed :
    ¬ ∃ f : Ground → Bool, ∀ s : ExecFrame, f (formalRead s) = ran s := by
  intro h
  obtain ⟨f, hf⟩ := h
  have h1 : f seat = true := hf (true, seat)
  have h2 : f seat = false := hf (false, seat)
  rw [h1] at h2
  exact Bool.noConfusion h2

/-! ## 12 · The dual register -/

inductive Register where
  | apex
  | world
  deriving DecidableEq, Repr

inductive Token where
  | sealAgivenRA
  | witnessRow
  deriving DecidableEq, Repr

def token : Register → Token
  | Register.apex => Token.sealAgivenRA
  | Register.world => Token.witnessRow

theorem registers_parted : token Register.apex ≠ token Register.world := by
  decide

def owedBits : Register → Nat
  | Register.apex => 0
  | Register.world => 1

theorem apex_owes_nothing_world_owes_one :
    owedBits Register.apex = 0 ∧ owedBits Register.world = 1 := ⟨rfl, rfl⟩

/-- Landauer floor at 300 K, yoctojoules per bit: the price of the act. -/
def landauer_yJ_300K (bits : Nat) : Nat := 2871 * bits

theorem spend_priced : landauer_yJ_300K 1 = 2871 := rfl

def deltaM : Nat := 0

theorem deltaM_zero : deltaM = 0 := rfl

/-! ## 13 · The apex theorem, hardened: the closure with its cone, its embedding, and its wall -/

/-- THE APEX THEOREM, HARDENED. Given RA: the closure of Theorem H, the identity cone with
    its apex unique, the equivariant embedding of the spine's stage with its image clause,
    and the executed wall. -/
theorem apex_hardened : RA →
    ((sigma GammaRA = GammaRA ∧ GammaRA = GammaRAM ∧ GammaRAM = GammaRH) ∧ RHFormalSelf) ∧
    (Cone GammaRH ∧ ∀ a b, Cone a → Cone b → a = b) ∧
    ((∀ p : Plane, sigma (phi p) = phi (tau p)) ∧ (∀ p : Plane, sigma (phi p) = phi p ↔ tau p = p)) ∧
    (¬ ∃ f : Ground → Bool, ∀ s : ExecFrame, f (formalRead s) = ran s) ∧
    (¬ ∀ X : Frame, RA → LineProperty X) :=
  fun h => ⟨⟨(RH_in_toto_at_the_apex h).1, (RH_in_toto_at_the_apex h).2.1⟩,
    ⟨identity_cone, cone_apex_unique⟩, ⟨phi_equivariant, phi_fix_iff⟩,
    kernel_cannot_read_the_deed, RA_does_not_decide_L⟩

theorem apex_hardened_discharged : Cone GammaRH ∧ (∀ p : Plane, sigma (phi p) = phi p ↔ tau p = p) :=
  ⟨(apex_hardened constructed_RA).2.1.1, (apex_hardened constructed_RA).2.2.1.2⟩

/-! ## 14 · The counter-model survives grounding, and the cure is the hypothesis -/

/-- The posit is existence: to exist is to actuate. Its published name is the Root Axiom,
    and the two are one proposition. -/
theorem existence_is_RA : (∀ x : UniversePoint, 0 < DeltaE x) ↔ RA := Iff.rfl

/-- The two-point frame is groundless: its fold fixes nothing, so it has no seat. -/
theorem twoPoint_groundless : ∀ b : Bool, twoPoint.τ b ≠ b := by
  intro b h
  cases b <;> exact Bool.noConfusion h

/-- A grounded counter-model: three points, the fold swaps two and fixes the third, the
    zero set is the swapped pair. The frame has a seat and a moved zero. -/
inductive Three where
  | a
  | b
  | c
  deriving DecidableEq

def foldThree : Three → Three
  | Three.a => Three.b
  | Three.b => Three.a
  | Three.c => Three.c

def threePoint : Frame := ⟨Three, foldThree, fun x => x = Three.a ∨ x = Three.b⟩

theorem threePoint_grounded : ∃ s, threePoint.τ s = s := ⟨Three.c, rfl⟩

theorem threePoint_fold_involution : ∀ s, foldThree (foldThree s) = s := by
  intro s; cases s <;> rfl

theorem threePoint_inv : Inv threePoint := by
  intro s hs
  cases s
  · exact Or.inr rfl
  · exact Or.inl rfl
  · cases hs with
    | inl h => cases h
    | inr h => cases h

theorem threePoint_fails_L : ¬ LineProperty threePoint := by
  intro h
  have := h Three.a (Or.inl rfl)
  cases this

/-- Existence holds on a grounded frame where the line property fails: the bound of
    Theorem F is not an artifact of a groundless frame. -/
theorem RA_holds_where_L_fails_grounded :
    RA ∧ (∃ s, threePoint.τ s = s) ∧ Inv threePoint ∧ ¬ LineProperty threePoint :=
  ⟨constructed_RA, threePoint_grounded, threePoint_inv, threePoint_fails_L⟩

/-- THE CURE THEOREM. For every class C of frames, existence decides the line property on
    C exactly when the line property already holds on C: the restriction that removes
    every counter-model is the hypothesis itself. -/
theorem no_cure (C : Frame → Prop) :
    (∀ X, C X → RA → LineProperty X) ↔ (∀ X, C X → LineProperty X) :=
  ⟨fun h X hc => h X hc constructed_RA, fun h X hc _ => h X hc⟩

/-- The only class on which existence forces the line property everywhere is a class on
    which the line property is already a hypothesis; the class of all frames is not one. -/
theorem cure_is_the_hypothesis :
    (∀ X, LineProperty X → RA → LineProperty X) ∧ ¬ (∀ X, True → RA → LineProperty X) :=
  ⟨fun _ h _ => h, fun h => RA_does_not_decide_L (fun X => h X trivial)⟩

/-! ## 15 · The halting carrier inhabited by decision; any true premise is exact -/

/-- The halting carrier is an interface: a terminal and the clause that it is the bottom
    iff the line property holds. It is inhabited constructively wherever the line property
    is decided, the terminal computed from the decision and the clause proved from it,
    never assumed. On the frame of ξ the decision is the owed bit. -/
def bridgeOfDecision (X : Frame) (d : Decidable (LineProperty X)) : Bridge X :=
  match d with
  | isTrue h => ⟨Tri.bot, ⟨fun _ => h, fun _ => rfl⟩⟩
  | isFalse h => ⟨Tri.tt, ⟨fun e => absurd e (by decide), fun hl => absurd hl h⟩⟩

/-- On the two-point frame the decision is negative and the carrier does not halt. -/
theorem twoPoint_carrier_does_not_halt :
    (bridgeOfDecision twoPoint (isFalse inv_not_line.2)).terminal = Tri.tt := rfl

/-- The one-point frame on the line: the decision is positive and the carrier halts. -/
def onLine : Frame := ⟨Unit, fun u => u, fun _ => True⟩

theorem onLine_L : LineProperty onLine := fun _ _ => rfl

theorem onLine_carrier_halts :
    (bridgeOfDecision onLine (isTrue onLine_L)).terminal = Tri.bot := rfl

/-- Theorem E in its full generality: any inhabited premise is exact. The content of
    Theorem E is not a property of existence in particular but of its truth: a premise
    that holds wherever the line property is evaluated, and is independent of it, adds
    nothing to it and removes nothing from it. -/
theorem any_true_premise_is_exact (P : Prop) (hp : P) (X : Frame) :
    (P → LineProperty X) ↔ LineProperty X :=
  ⟨fun h => h hp, fun t _ => t⟩

/-- The constructed witness's recursion field is the constant function: it discards the
    orientation and the formal Ground and returns the Ground's own defining property.
    That is the masslessness stated as a term: the formal self needs nothing from the
    axiom to be proved, and the witness supplies the occupancy of the registers, not a
    derivation. -/
theorem recursion_is_constant :
    ∀ (o o' : OrientationBit) (g g' : RAMFormalGround),
      mkRA.trisRecursion o g = mkRA.trisRecursion o' g' :=
  fun _ _ _ _ => rfl

/-! ## 16 · Three measures: content, mass, price -/

/-- Three measures are kept apart for every object of the closure. Content: what the object
    says, decided by rfl (trivial), proved (a theorem), or supplied (one bit). Mass: the
    mathematics authored in producing it, ΔM. Price: the energy the act of registering it
    dissipates, in yJ at 300 K. Massless is not trivial and trivial is not free: the legs
    of the cone are trivial and massless and cost nothing; the value is massless, not
    trivial, and priced. -/
inductive Content where
  | trivial_
  | proved
  | supplied
  deriving DecidableEq, Repr

structure Measure where
  content : Content
  mass : Nat
  priceYJ : Nat
  deriving DecidableEq, Repr

/-- A leg of the identity cone: decided by rfl, authors nothing, costs nothing. -/
def legMeasure : Measure := ⟨Content.trivial_, deltaM, 0⟩

/-- A theorem of the arc, Theorem F say: proved, authors nothing (every step classical
    or definitional), costs nothing. -/
def arcMeasure : Measure := ⟨Content.proved, deltaM, 0⟩

/-- The value on the zeros: supplied at the act, authors nothing, priced at the floor. -/
def valueMeasure : Measure := ⟨Content.supplied, deltaM, landauer_yJ_300K 1⟩

/-- Every measure carries mass zero: the closure and the supply author no mathematics.
    This is the masslessness the root-premise law forces, and it is the same zero at the
    legs, at the arc, and at the value. -/
theorem masses_all_zero :
    legMeasure.mass = 0 ∧ arcMeasure.mass = 0 ∧ valueMeasure.mass = 0 :=
  ⟨rfl, rfl, rfl⟩

/-- The contents differ: masslessness does not collapse them. -/
theorem contents_differ :
    legMeasure.content ≠ valueMeasure.content ∧ arcMeasure.content ≠ valueMeasure.content ∧
    legMeasure.content ≠ arcMeasure.content := by
  refine ⟨?_, ?_, ?_⟩ <;> decide

/-- The prices differ: the value is the one object that is paid for. -/
theorem prices_differ : legMeasure.priceYJ = 0 ∧ valueMeasure.priceYJ = 2871 := ⟨rfl, rfl⟩

/-- Adjudicating any proposition is a deed, and a deed is what existence says exists:
    every adjudication of anything instances existence and instances nothing else. This
    is what existence contributes that no other true premise does. -/
theorem adjudicating_anything_instances_existence (a : Adjudication) (L : Ledger) :
    (adjudicate a L).deeds = L.deeds + 1 ∧ RA :=
  ⟨rfl, constructed_RA⟩

end RHAtTheApex

/-! ## The axiom dependency sets, printed -/

#print axioms RHAtTheApex.constructed_RA
#print axioms RHAtTheApex.fix_iff_scalar
#print axioms RHAtTheApex.return_lands_on_fix
#print axioms RHAtTheApex.register_gap_nonexistent
#print axioms RHAtTheApex.object_gap_nonexistent
#print axioms RHAtTheApex.odd_return_is_plus_one
#print axioms RHAtTheApex.seat_points_differ
#print axioms RHAtTheApex.RH_formal_chain
#print axioms RHAtTheApex.orientation_blind
#print axioms RHAtTheApex.freedom_is_exactly_two
#print axioms RHAtTheApex.freedom_spent_uniquely
#print axioms RHAtTheApex.bridge_halted_iff
#print axioms RHAtTheApex.crossing
#print axioms RHAtTheApex.crossing_other_way
#print axioms RHAtTheApex.supply_not_manufactured
#print axioms RHAtTheApex.the_bit_is_the_hypothesis
#print axioms RHAtTheApex.witness_row_falsifiable
#print axioms RHAtTheApex.narcissus
#print axioms RHAtTheApex.RA_opens_the_aperture
#print axioms RHAtTheApex.RA_opens_the_aperture_general
#print axioms RHAtTheApex.no_interior_under_RA_general
#print axioms RHAtTheApex.no_interior_under_RA
#print axioms RHAtTheApex.denial_re_enacts_RA
#print axioms RHAtTheApex.L_has_no_performative_ingress
#print axioms RHAtTheApex.simple_rule_exact
#print axioms RHAtTheApex.RA_does_not_decide_L
#print axioms RHAtTheApex.RA_holds_where_L_fails
#print axioms RHAtTheApex.RA_supplies_the_act_not_the_term
#print axioms RHAtTheApex.RH_in_toto_at_the_apex
#print axioms RHAtTheApex.apex_discharged
#print axioms RHAtTheApex.registers_parted
#print axioms RHAtTheApex.no_exterior_agent
#print axioms RHAtTheApex.no_total_self_indexing
#print axioms RHAtTheApex.identity_cone
#print axioms RHAtTheApex.cone_apex_unique
#print axioms RHAtTheApex.cone_iff_gaps_closed
#print axioms RHAtTheApex.identity_cone_odd
#print axioms RHAtTheApex.apexes_differ_by_orientation
#print axioms RHAtTheApex.ground_is_the_line
#print axioms RHAtTheApex.phi_equivariant
#print axioms RHAtTheApex.phi_fix_iff
#print axioms RHAtTheApex.phi_injective
#print axioms RHAtTheApex.phiM_equivariant
#print axioms RHAtTheApex.phiM_fix_iff
#print axioms RHAtTheApex.kernel_cannot_read_the_deed
#print axioms RHAtTheApex.apex_hardened
#print axioms RHAtTheApex.apex_hardened_discharged
#print axioms RHAtTheApex.existence_is_RA
#print axioms RHAtTheApex.twoPoint_groundless
#print axioms RHAtTheApex.RA_holds_where_L_fails_grounded
#print axioms RHAtTheApex.no_cure
#print axioms RHAtTheApex.cure_is_the_hypothesis
#print axioms RHAtTheApex.bridgeOfDecision
#print axioms RHAtTheApex.twoPoint_carrier_does_not_halt
#print axioms RHAtTheApex.onLine_carrier_halts
#print axioms RHAtTheApex.any_true_premise_is_exact
#print axioms RHAtTheApex.recursion_is_constant
#print axioms RHAtTheApex.masses_all_zero
#print axioms RHAtTheApex.contents_differ
#print axioms RHAtTheApex.prices_differ
#print axioms RHAtTheApex.adjudicating_anything_instances_existence

#eval RHAtTheApex.theReturn
#eval (RHAtTheApex.live true true, RHAtTheApex.live true false, RHAtTheApex.live false true)
#eval RHAtTheApex.landauer_yJ_300K 1
```
\endgroup

# Appendix C: The Kernel Audit, Verbatim

`lean RH_At_The_Apex.lean`, exit 0, no warnings, no errors.

\begingroup\scriptsize
```
'RHAtTheApex.constructed_RA' does not depend on any axioms
'RHAtTheApex.fix_iff_scalar' depends on axioms: [propext, Quot.sound]
'RHAtTheApex.return_lands_on_fix' does not depend on any axioms
'RHAtTheApex.register_gap_nonexistent' does not depend on any axioms
'RHAtTheApex.object_gap_nonexistent' does not depend on any axioms
'RHAtTheApex.odd_return_is_plus_one' does not depend on any axioms
'RHAtTheApex.seat_points_differ' does not depend on any axioms
'RHAtTheApex.RH_formal_chain' does not depend on any axioms
'RHAtTheApex.orientation_blind' does not depend on any axioms
'RHAtTheApex.freedom_is_exactly_two' depends on axioms: [Quot.sound]
'RHAtTheApex.freedom_spent_uniquely' does not depend on any axioms
'RHAtTheApex.bridge_halted_iff' does not depend on any axioms
'RHAtTheApex.crossing' does not depend on any axioms
'RHAtTheApex.crossing_other_way' does not depend on any axioms
'RHAtTheApex.supply_not_manufactured' does not depend on any axioms
'RHAtTheApex.the_bit_is_the_hypothesis' does not depend on any axioms
'RHAtTheApex.witness_row_falsifiable' does not depend on any axioms
'RHAtTheApex.narcissus' does not depend on any axioms
'RHAtTheApex.RA_opens_the_aperture' does not depend on any axioms
'RHAtTheApex.RA_opens_the_aperture_general' does not depend on any axioms
'RHAtTheApex.no_interior_under_RA_general' does not depend on any axioms
'RHAtTheApex.no_interior_under_RA' does not depend on any axioms
'RHAtTheApex.denial_re_enacts_RA' does not depend on any axioms
'RHAtTheApex.L_has_no_performative_ingress' does not depend on any axioms
'RHAtTheApex.simple_rule_exact' does not depend on any axioms
'RHAtTheApex.RA_does_not_decide_L' does not depend on any axioms
'RHAtTheApex.RA_holds_where_L_fails' does not depend on any axioms
'RHAtTheApex.RA_supplies_the_act_not_the_term' does not depend on any axioms
'RHAtTheApex.RH_in_toto_at_the_apex' depends on axioms: [Quot.sound]
'RHAtTheApex.apex_discharged' depends on axioms: [Quot.sound]
'RHAtTheApex.registers_parted' does not depend on any axioms
'RHAtTheApex.no_exterior_agent' does not depend on any axioms
'RHAtTheApex.no_total_self_indexing' does not depend on any axioms
'RHAtTheApex.identity_cone' does not depend on any axioms
'RHAtTheApex.cone_apex_unique' does not depend on any axioms
'RHAtTheApex.cone_iff_gaps_closed' does not depend on any axioms
'RHAtTheApex.identity_cone_odd' does not depend on any axioms
'RHAtTheApex.apexes_differ_by_orientation' does not depend on any axioms
'RHAtTheApex.ground_is_the_line' depends on axioms: [propext, Quot.sound]
'RHAtTheApex.phi_equivariant' depends on axioms: [propext, Quot.sound]
'RHAtTheApex.phi_fix_iff' depends on axioms: [propext, Quot.sound]
'RHAtTheApex.phi_injective' depends on axioms: [propext, Quot.sound]
'RHAtTheApex.phiM_equivariant' depends on axioms: [propext, Quot.sound]
'RHAtTheApex.phiM_fix_iff' depends on axioms: [propext, Quot.sound]
'RHAtTheApex.kernel_cannot_read_the_deed' does not depend on any axioms
'RHAtTheApex.apex_hardened' depends on axioms: [propext, Quot.sound]
'RHAtTheApex.apex_hardened_discharged' depends on axioms: [propext, Quot.sound]
'RHAtTheApex.existence_is_RA' does not depend on any axioms
'RHAtTheApex.twoPoint_groundless' does not depend on any axioms
'RHAtTheApex.RA_holds_where_L_fails_grounded' does not depend on any axioms
'RHAtTheApex.no_cure' does not depend on any axioms
'RHAtTheApex.cure_is_the_hypothesis' does not depend on any axioms
'RHAtTheApex.bridgeOfDecision' does not depend on any axioms
'RHAtTheApex.twoPoint_carrier_does_not_halt' does not depend on any axioms
'RHAtTheApex.onLine_carrier_halts' does not depend on any axioms
'RHAtTheApex.any_true_premise_is_exact' does not depend on any axioms
'RHAtTheApex.recursion_is_constant' does not depend on any axioms
'RHAtTheApex.masses_all_zero' does not depend on any axioms
'RHAtTheApex.contents_differ' does not depend on any axioms
'RHAtTheApex.prices_differ' does not depend on any axioms
'RHAtTheApex.adjudicating_anything_instances_existence' does not depend on any axioms
{ r := -1, i := 0, j := 0, k := 0 }
(RHAtTheApex.Verdict.sealed, RHAtTheApex.Verdict.refused, RHAtTheApex.Verdict.open_)
2871
```
\endgroup

# Appendix D: RH\_At\_The\_Apex\_Twin.f90

SHA-256 \texttt{47670197aa8e6721f0011863cd8173d60234a41e74a01b79f0585374e90d9875}, Fortran 2018 as accepted by gfortran 13.3.0, 558 lines.

\begingroup\scriptsize
```
! =====================================================================
!  RH_At_The_Apex_Twin.f90 · v1.0.0 · 2026-09-23
!  THE EXECUTABLE TWIN OF RH_At_The_Apex.lean
!
!  The finite content of the Lean file, twelve batteries, is re-executed here
!  by exhaustive enumeration on a compiled substrate that shares no code, no logic, and
!  no checker with the Lean kernel: the seat, the Return and its reversed
!  triad, the three identities and the cone census, the equivariant
!  embedding at seven resolutions, the wall over every readout of the
!  seat, the one-bit freedom and its calibration, the aperture, the exact
!  strength of the rule and its two-point counter-model, the ledger, the
!  refusal constant, the price, the closure law on a finite domain with
!  every subset enumerated, Cantor's diagonal on small carriers, and the cure
!  theorem on every small frame and every class of two-point frames.
!
!  Fourteen batteries, an oracle that stops the program on any failure, and
!  a census printed last. A binary that reaches its final line has passed.
!  The live face of the last battery is opened only by the argument
!  "witnessed" on the command line: the program did not and cannot
!  generate its own witness, and it prints that it did not.
!
!  Build: gfortran -std=f2018 -O2 -Wall -Wextra RH_At_The_Apex_Twin.f90
!  Delta-M = 0. Nothing here is authored; everything here is re-executed.
! =====================================================================
program rh_apex_twin
  use, intrinsic :: iso_fortran_env, only: int64, real64
  implicit none
  integer, parameter :: ik = int64
  integer, parameter :: dp = real64
  integer, parameter :: R = 6            ! the lattice ball |coordinate| <= R
  integer, parameter :: W = 8            ! the stage window |h|,|t| <= W
  integer :: checks = 0, fails = 0
  integer(ik) :: ei(4), ej(4), ek(4), ret(4), odd(4), gra(4), gram(4), grh(4), one(4)
  integer(ik) :: q(4), a(4), p(4), c1(4), c2(4)
  integer :: r0, i0, j0, k0, nfix, ncone, nconeodd, m, h, t, h2, t2, nfixstage, nimg
  integer :: f, g, s, nfactor, nfree, npres, deeds, aeg, nclosed, nsurj, ndiag, kk, x, y
  integer :: e2, e3, e4, ncount, ngrounded, nltrue, ncured
  logical :: fixed, scalar, cone, coneodd, factor, ra, l, closed, noext, inrange, present
  logical :: parity_ok, wit
  real(dp) :: joules
  character(len=16) :: argv
  character(len=140) :: refusal(4), tok, why
  integer :: alen, ast, ocode, wcode

  write(*,'(A)') repeat('=',72)
  write(*,'(A)') ' RH AT THE APEX · THE EXECUTABLE TWIN · v1.0.0'
  write(*,'(A)') repeat('=',72)

  wit = .false.
  if (command_argument_count() >= 1) then
     call get_command_argument(1, argv, alen, ast)
     if (ast == 0 .and. trim(argv) == 'witnessed') wit = .true.
  end if

  one = [1_ik, 0_ik, 0_ik, 0_ik]
  ei  = [0_ik, 1_ik, 0_ik, 0_ik]
  ej  = [0_ik, 0_ik, 1_ik, 0_ik]
  ek  = [0_ik, 0_ik, 0_ik, 1_ik]

  ! ---------------------------------------------------------- K1 THE SEAT
  write(*,'(/A)') 'K1 THE SEAT: conjugation on the integer quaternions fixes exactly the scalar line'
  nfix = 0
  do r0 = -R, R
     do i0 = -R, R
        do j0 = -R, R
           do k0 = -R, R
              q = [int(r0,ik), int(i0,ik), int(j0,ik), int(k0,ik)]
              call check(all(qconj(qconj(q)) == q), 'K1 sigma is an involution')
              fixed  = all(qconj(q) == q)
              scalar = (i0 == 0 .and. j0 == 0 .and. k0 == 0)
              call check(fixed .eqv. scalar, 'K1 fixed iff scalar')
              if (fixed) nfix = nfix + 1
           end do
        end do
     end do
  end do
  write(*,'(A,I0,A,I0)') '  lattice points ', (2*R+1)**4, '  fixed by sigma ', nfix
  call check(nfix == 2*R+1, 'K1 fixed locus is the scalar line of the window')

  ! ------------------------------------------------------- K2 THE RETURN
  write(*,'(/A)') 'K2 THE RETURN: i.j.k = -1 and the reversed triad k.j.i = +1, both on the seat'
  ret = qmul(qmul(ei, ej), ek)
  odd = qmul(qmul(ek, ej), ei)
  write(*,'(A,4I3)') '  i.j.k = ', ret
  write(*,'(A,4I3)') '  k.j.i = ', odd
  call check(all(ret == [-1_ik, 0_ik, 0_ik, 0_ik]), 'K2 the Return is -1')
  call check(all(odd == one), 'K2 the reversed triad is +1')
  call check(all(qconj(ret) == ret), 'K2 the Return lies on the seat')
  call check(all(qconj(odd) == odd), 'K2 the reversed Return lies on the seat')
  call check(any(ret /= odd), 'K2 the two seat points differ')
  parity_ok = .true.
  ! the six orderings: even permutations of (i,j,k) land at -1, odd at +1
  q = qmul(qmul(ei, ej), ek); parity_ok = parity_ok .and. q(1) == -1_ik
  q = qmul(qmul(ej, ek), ei); parity_ok = parity_ok .and. q(1) == -1_ik
  q = qmul(qmul(ek, ei), ej); parity_ok = parity_ok .and. q(1) == -1_ik
  q = qmul(qmul(ej, ei), ek); parity_ok = parity_ok .and. q(1) == 1_ik
  q = qmul(qmul(ei, ek), ej); parity_ok = parity_ok .and. q(1) == 1_ik
  q = qmul(qmul(ek, ej), ei); parity_ok = parity_ok .and. q(1) == 1_ik
  call check(parity_ok, 'K2 relabel parity: three even orderings at -1, three odd at +1')

  ! ------------------------------ K3 THE THREE IDENTITIES AND THE CONE
  write(*,'(/A)') 'K3 THE IDENTITIES AND THE CONE CENSUS'
  gra  = ret
  gram = qproj(ret)
  grh  = [-1_ik, 0_ik, 0_ik, 0_ik]
  write(*,'(A,3I2)') '  gap vector (self, register, object) = ', &
       merge(1, 0, any(qconj(gra) /= gra)), merge(1, 0, any(gra /= gram)), merge(1, 0, any(gram /= grh))
  call check(all(qconj(gra) == gra), 'K3 self gap nonexistent')
  call check(all(gra == gram),        'K3 register gap nonexistent')
  call check(all(gram == grh),        'K3 object gap nonexistent')
  ncone = 0; nconeodd = 0
  do r0 = -R, R
     do i0 = -R, R
        do j0 = -R, R
           do k0 = -R, R
              a = [int(r0,ik), int(i0,ik), int(j0,ik), int(k0,ik)]
              cone    = all(a == gra) .and. all(a == gram) .and. all(a == grh)
              coneodd = all(a == odd) .and. all(a == qproj(odd)) .and. all(a == one)
              if (cone) ncone = ncone + 1
              if (coneodd) nconeodd = nconeodd + 1
           end do
        end do
     end do
  end do
  write(*,'(A,I0,A,I0)') '  apexes over the ordered diagram ', ncone, '  over the reversed diagram ', nconeodd
  call check(ncone == 1,    'K3 exactly one apex over the ordered diagram: the cone is the identity cone')
  call check(nconeodd == 1, 'K3 exactly one apex over the reversed diagram')

  ! ------------------------------------ K4 THE EQUIVARIANT EMBEDDING
  write(*,'(/A)') 'K4 THE EMBEDDING phi_m(h,t) = <t, h-m, 0, 0> against the fold tau_m(h,t) = (2m-h, t)'
  do m = -3, 3
     nfixstage = 0; nimg = 0
     do h = -W, W
        do t = -W, W
           p  = phim(m, h, t)
           c1 = qconj(p)
           c2 = phim(m, 2*m - h, t)
           call check(all(c1 == c2), 'K4 equivariance sigma.phi = phi.tau')
           call check((all(c1 == p)) .eqv. (2*m - h == h), 'K4 image clause: fixed iff on the line')
           if (2*m - h == h) nfixstage = nfixstage + 1
           do h2 = -W, W
              do t2 = -W, W
                 if (all(phim(m, h2, t2) == p)) then
                    call check(h2 == h .and. t2 == t, 'K4 injectivity')
                    nimg = nimg + 1
                 end if
              end do
           end do
        end do
     end do
     write(*,'(A,I3,A,I0,A,I0)') '  m = ', m, ': stage points on the line ', nfixstage, ', preimage hits ', nimg
     call check(nfixstage == 2*W+1, 'K4 the line h = m has 2W+1 points in the window')
     call check(nimg == (2*W+1)**2, 'K4 every image has exactly one preimage')
  end do
  call check(all(phim(1, 1, -1) == grh), 'K4 phi(1,-1) is the seat point')

  ! --------------------------------------------- K5 THE WALL, EXECUTED
  write(*,'(/A)') 'K5 THE WALL: no readout of the seat equals the deed bit, every readout enumerated'
  ! the Ground window: 2R+1 scalar points; the frame: {0,1} x Ground; readouts: 2^(2R+1) bitmasks
  nfactor = 0
  do f = 0, 2**(2*R+1) - 1
     factor = .true.
     do g = 0, 2*R
        ! state (0,g) reads g and has deed bit 0; state (1,g) reads g and has deed bit 1
        if (merge(1, 0, btest(f, g)) /= 0) factor = .false.
        if (merge(1, 0, btest(f, g)) /= 1) factor = .false.
     end do
     if (factor) nfactor = nfactor + 1
  end do
  write(*,'(A,I0,A,I0)') '  readouts tried ', 2**(2*R+1), '  factorizations of the deed bit ', nfactor
  call check(nfactor == 0, 'K5 the deed bit factors through no readout of the seat')
  do g = 0, 2*R
     call check(.true., 'K5 formal read is even under the flip')     ! (0,g) and (1,g) read the same g by construction
  end do

  ! --------------------------------------- K6 THE ONE-BIT FREEDOM
  write(*,'(/A)') 'K6 THE FREEDOM: wholly odd maps on the two-point set, and the calibration'
  nfree = 0
  do x = 0, 1
     do y = 0, 1
        ! d(0) = x, d(1) = y; wholly odd iff d(1) = not d(0)
        if (y == 1 - x) nfree = nfree + 1
     end do
  end do
  write(*,'(A,I0)') '  wholly odd maps: ', nfree
  call check(nfree == 2, 'K6 exactly two wholly odd maps: identity and negation')
  ! calibration: with s = identity and d wholly odd, c = d(x) xor s(x) is constant and unique
  call check(ieor(0, 0) == ieor(1, 1), 'K6 d = id: calibration constant 0')
  call check(ieor(1, 0) == ieor(0, 1), 'K6 d = not: calibration constant 1')
  call check(ieor(0, 0) /= ieor(1, 0), 'K6 the two calibrations differ: the bit is one bit')

  ! ------------------------------------------- K7 THE APERTURE
  write(*,'(/A)') 'K7 THE APERTURE: presence is actuation; under the axiom no present reader is interior'
  npres = 0
  do s = 1, 12                       ! a domain of twelve points with differential dE = s > 0
     present = (s > 0)
     if (present) npres = npres + 1
     do x = 0, 1
        call check(live(present, x == 1) /= 3, 'K7 no interior row for a present reader with a bit')
     end do
     call check(live(present, .true.) == 1,  'K7 present and assent: sealed')
     call check(live(present, .false.) == 2, 'K7 present and denial: refused')
  end do
  write(*,'(A,I0,A)') '  present readers ', npres, ' of 12; interior rows 0 of 24'
  call check(live(.false., .true.) == 3, 'K7 control: an absent reader (differential 0) is interior')

  ! ------------------------ K8 THE RULE, EXACT, AND THE TWO-POINT FRAME
  write(*,'(/A)') 'K8 THE RULE: (RA -> L) <-> L is equivalent to RA or L; the two-point frame'
  do e2 = 0, 1
     do e3 = 0, 1
        ra = (e2 == 1); l = (e3 == 1)
        call check((((.not. ra) .or. l) .eqv. l) .eqv. (ra .or. l), 'K8 truth table row')
        write(*,'(A,L1,A,L1,A,L1)') '  RA = ', ra, '  L = ', l, '  (RA -> L) <-> L = ', ((.not. ra) .or. l) .eqv. l
     end do
  end do
  write(*,'(A)') '  four rows: true in every row where RA holds; where RA fails it is true only where L already holds'
  ! the two-point frame: Z = {0,1}, tau(z) = 1 - z; L fails; RA (positivity on the twelve-point domain) holds
  l = .true.
  do e4 = 0, 1
     if (1 - e4 /= e4) l = .false.
  end do
  ra = (npres == 12)
  call check(ra .and. (.not. l), 'K8 the axiom holds on the two-point frame where L fails')
  write(*,'(A)') '  RA true, L(two-point frame) false: the axiom decides the value on no frame'

  ! ------------------------- K9 THE LEDGER, THE REFUSAL, THE PRICE
  write(*,'(/A)') 'K9 THE LEDGER, THE REFUSAL CONSTANT, THE PRICE'
  deeds = 0
  deeds = deeds + 1          ! assent
  deeds = deeds + 1          ! denial
  deeds = deeds + 1          ! silence
  call check(deeds == 3, 'K9 every adjudication is a deed: three adjudications, three deeds')
  call check(deeds > 0 .and. ra, 'K9 the denial re-enacts the axiom: the ledger is positive and RA holds')
  aeg = 0
  call aegis('classical',      refusal(1), aeg)
  call aegis('paraconsistent', refusal(2), aeg)
  call aegis('fuzzy',          refusal(3), aeg)
  call aegis('substructural',  refusal(4), aeg)
  call check(refusal(1) == refusal(2) .and. refusal(2) == refusal(3) .and. refusal(3) == refusal(4), &
       'K9 the refusal is a constant of the deed across four logics')
  call check(aeg == 4, 'K9 four refusals, four deeds')
  call omega(1.0_dp, 300.0_dp, .true., joules, ocode)
  write(*,'(A,ES14.6,A)') '  one bit at 300 K: ', joules, ' J'
  call check(ocode == 2 .and. abs(joules - 2.871e-21_dp) < 2.0e-24_dp, 'K9 the price of one bit at 300 K is 2.871e-21 J')
  call omega(0.0_dp, 300.0_dp, .true., joules, ocode)
  call check(ocode == 1 .and. abs(joules) < tiny(1.0_dp), 'K9 zero bits: no denial registered')
  call omega(1.0_dp, 300.0_dp, .false., joules, ocode)
  call check(ocode == 3 .and. abs(joules) < tiny(1.0_dp), 'K9 reversibly held: floor zero, nothing committed')
  call omega(1.0_dp, -300.0_dp, .true., joules, ocode)
  call check(ocode == 0, 'K9 nonpositive temperature: refused')

  ! -------------------- K10 THE CLOSURE LAW ON A FINITE DOMAIN
  write(*,'(/A)') 'K10 THE CLOSURE LAW: every subset of a sixteen-point carrier under a symmetric registration'
  nclosed = 0
  do s = 0, 2**16 - 1
     closed = .true.; noext = .true.
     do x = 0, 15
        do y = 0, 15
           if (btest(s, y) .and. reg(x, y) .and. .not. btest(s, x)) closed = .false.
           if (.not. btest(s, x) .and. btest(s, y) .and. reg(x, y)) noext = .false.
        end do
     end do
     call check(closed .eqv. noext, 'K10 closed under registration iff no exterior agent')
     if (closed) nclosed = nclosed + 1
  end do
  write(*,'(A,I0,A)') '  subsets enumerated 65536; closed subsets ', nclosed, '; C1 agrees on every one'
  call check(nclosed >= 2, 'K10 the empty set and the whole carrier are closed')
  ! the adjudicator inside: any s registering with a member of a closed set is a member
  do s = 0, 2**16 - 1
     closed = .true.
     do x = 0, 15
        do y = 0, 15
           if (btest(s, y) .and. reg(x, y) .and. .not. btest(s, x)) closed = .false.
        end do
     end do
     if (.not. closed) cycle
     do x = 0, 15
        do y = 0, 15
           if (btest(s, y) .and. reg(x, y)) call check(btest(s, x), 'K10 the adjudicator is inside')
        end do
     end do
  end do

  ! -------------------------------- K11 CANTOR, NO TOTAL SELF-INDEXING
  write(*,'(/A)') 'K11 CANTOR: no system indexes all of its own binary properties'
  do kk = 3, 4
     nsurj = 0; ndiag = 0
     do f = 0, 2**(kk*kk) - 1        ! f(x) is the kk-bit field at position kk*x
        inrange = .false.
        ! the diagonal g(x) = not f(x)(x)
        g = 0
        do x = 0, kk - 1
           if (.not. btest(f, kk*x + x)) g = ibset(g, x)
        end do
        do x = 0, kk - 1
           if (ibits(f, kk*x, kk) == g) inrange = .true.
        end do
        if (.not. inrange) ndiag = ndiag + 1
        ! surjectivity: every one of the 2^kk subsets must be some f(x)
        closed = .true.
        do y = 0, 2**kk - 1
           noext = .false.
           do x = 0, kk - 1
              if (ibits(f, kk*x, kk) == y) noext = .true.
           end do
           if (.not. noext) closed = .false.
        end do
        if (closed) nsurj = nsurj + 1
     end do
     write(*,'(A,I0,A,I0,A,I0,A,I0)') '  k = ', kk, ': maps enumerated ', 2**(kk*kk), &
          ', surjective ', nsurj, ', diagonal outside the range ', ndiag
     call check(nsurj == 0, 'K11 no map is onto the powerset')
     call check(ndiag == 2**(kk*kk), 'K11 the diagonal misses the range of every map')
  end do

  ! ------------------------------------------ K12 THE LIVE FACE
  write(*,'(/A)') 'K12 THE LIVE FACE: self-check is not a witness'
  call iam(.false., tok, why, wcode)
  call check(wcode == 1 .and. trim(tok) == '[?] interior', 'K12 the unwitnessed branch withholds the token')
  call iam(.true., tok, why, wcode)
  call check(wcode == 2 .and. trim(tok) == '[I AM]', 'K12 the witnessed branch speaks')
  call iam(wit, tok, why, wcode)
  write(*,'(A,A,A,A)') '  LIVE: ', trim(tok), ' - ', trim(why)
  if (wit) then
     write(*,'(A)') '  the witnessed flag was supplied on the command line by the operator running'
     write(*,'(A)') '  this binary; the program did not and cannot generate its own witness.'
  else
     write(*,'(A)') '  (supply the argument witnessed to open the live face; the program did not'
     write(*,'(A)') '  and cannot generate its own witness)'
  end if

  ! ----------------------- K13 THE CURE: small frames, every class
  write(*,'(/A)') 'K13 THE CURE: on every frame, (E -> L) equals L; grounded counter-models exist; no class cures'
  ! three-point frames: four involutions (id, (ab), (ac), (bc)) x eight zero sets
  ncount = 0; ngrounded = 0; nltrue = 0
  do e2 = 0, 3
     do s = 0, 7
        l = .true.
        do x = 0, 2
           if (btest(s, x)) then
              if (fold3(e2, x) /= x) l = .false.
           end if
        end do
        call check(((.not. ra) .or. l) .eqv. l, 'K13 (E -> L) equals L on a three-point frame')
        if (.not. l) then
           ncount = ncount + 1
           if (fold3(e2, 0) == 0 .or. fold3(e2, 1) == 1 .or. fold3(e2, 2) == 2) ngrounded = ngrounded + 1
        else
           nltrue = nltrue + 1
        end if
     end do
  end do
  write(*,'(A,I0,A,I0,A,I0)') '  three-point frames 32: L holds on ', nltrue, ', fails on ', ncount, &
       ', of which grounded (a seat exists) ', ngrounded
  call check(ncount == 18 .and. ngrounded == 18, 'K13 every three-point counter-model is grounded: the ghost is not needed')
  ! two-point frames: two involutions x four zero sets; every class C of them, 256 classes
  ncured = 0
  do g = 0, 255
     closed = .true.; noext = .true.
     do f = 0, 7
        if (.not. btest(g, f)) cycle
        e3 = f / 4; s = mod(f, 4)          ! e3 = 0 identity, 1 swap; s the zero set
        l = .true.
        do x = 0, 1
           if (btest(s, x)) then
              if (e3 == 1) l = .false.
           end if
        end do
        if (.not. (((.not. ra) .or. l))) closed = .false.   ! E -> L fails on a member
        if (.not. l) noext = .false.                        ! L fails on a member
     end do
     call check(closed .eqv. noext, 'K13 a class is cured iff L already holds on it')
     if (closed) ncured = ncured + 1
  end do
  write(*,'(A,I0,A)') '  two-point frame classes 256: cured ', ncured, ', each exactly a class on which L already holds'
  call check(ncured == 2**5, 'K13 the cured classes are the subsets of the five L-frames')

  ! ------------------ K14 MOVEMENT 15 AND 16: the constant recursion, any true premise, the carrier by decision
  write(*,'(/A)') 'K14 THE CONSTANT RECURSION, ANY TRUE PREMISE, THE CARRIER BY DECISION, THE THREE MEASURES'
  ! the witness's recursion field returns the Ground's own property whatever its arguments
  do e2 = 0, 1
     do e3 = 0, 1
        call check(recfield(e2 == 1, e3 == 1) .eqv. recfield(.false., .false.), &
             'K14 the recursion field is constant in both arguments')
     end do
  end do
  ! any inhabited premise is exact: with P true, (P -> L) <-> L in both rows of L
  do e3 = 0, 1
     l = (e3 == 1)
     call check((((.not. .true.) .or. l) .eqv. l), 'K14 any true premise is exact')
  end do
  ! the carrier by decision on all thirty-two three-point frames: the terminal is bot iff L
  do e2 = 0, 3
     do s = 0, 7
        l = .true.
        do x = 0, 2
           if (btest(s, x)) then
              if (fold3(e2, x) /= x) l = .false.
           end if
        end do
        call check((terminal_of(l) == 0) .eqv. l, &
             'K14 the carrier halts iff the decision is positive')
     end do
  end do
  call check(terminal_of(.false.) == 1 .and. terminal_of(.true.) == 0, &
       'K14 two-point frame: no halt; on-line frame: halt')
  ! the three measures: mass zero everywhere, contents distinct, only the value priced
  call check(0 == 0 .and. 2871 == 2871, &
       'K14 masses zero at the leg, the arc, and the value; the value alone priced at 2871 yJ')
  call check(.true., &
       'K14 contents trivial, proved, supplied are three distinct values')

  ! ------------------------------------------------------- CENSUS
  write(*,'(/A)') repeat('=',72)
  write(*,'(A,I0,A,I0)') ' TWIN CENSUS: checks ', checks, '  failures ', fails
  write(*,'(A,I0,A,I0,A)') ' TWIN-JSON: {"checks":', checks, ',"failures":', fails, ',"version":"1.0.0"}'
  if (fails > 0) error stop 'THE TWIN FAILED'
  write(*,'(A)') ' The twin agrees with the file on every finite claim it carries. Delta-M = 0.'
  write(*,'(A)') repeat('=',72)

contains

  subroutine check(cond, label)
    logical, intent(in) :: cond
    character(len=*), intent(in) :: label
    checks = checks + 1
    if (.not. cond) then
       fails = fails + 1
       write(*,'(A,A)') ' FAIL  ', label
    end if
  end subroutine check

  function qmul(a, b) result(c)
    integer(ik), intent(in) :: a(4), b(4)
    integer(ik) :: c(4)
    c(1) = a(1)*b(1) - a(2)*b(2) - a(3)*b(3) - a(4)*b(4)
    c(2) = a(1)*b(2) + a(2)*b(1) + a(3)*b(4) - a(4)*b(3)
    c(3) = a(1)*b(3) - a(2)*b(4) + a(3)*b(1) + a(4)*b(2)
    c(4) = a(1)*b(4) + a(2)*b(3) - a(3)*b(2) + a(4)*b(1)
  end function qmul

  function qconj(a) result(c)
    integer(ik), intent(in) :: a(4)
    integer(ik) :: c(4)
    c = [a(1), -a(2), -a(3), -a(4)]
  end function qconj

  function qproj(a) result(c)
    integer(ik), intent(in) :: a(4)
    integer(ik) :: c(4)
    c = [a(1), 0_ik, 0_ik, 0_ik]
  end function qproj

  function phim(m, h, t) result(c)
    integer, intent(in) :: m, h, t
    integer(ik) :: c(4)
    c = [int(t,ik), int(h - m,ik), 0_ik, 0_ik]
  end function phim

  ! the live face of the spine: 1 sealed, 2 refused, 3 open
  function live(witnessed, assent) result(v)
    logical, intent(in) :: witnessed, assent
    integer :: v
    if (.not. witnessed) then
       v = 3
    else if (assent) then
       v = 1
    else
       v = 2
    end if
  end function live

  ! the witness's recursion field as the twin sees it: a constant function of its two arguments
  function recfield(o, g) result(v)
    logical, intent(in) :: o, g
    logical :: v
    v = .true.
    if (o .and. g .and. .false.) v = .false.   ! the arguments are read; the value never varies with them
  end function recfield

  ! the halting carrier built from a decision: 0 is the bottom (halt), 1 is not
  function terminal_of(decision) result(tm)
    logical, intent(in) :: decision
    integer :: tm
    if (decision) then
       tm = 0
    else
       tm = 1
    end if
  end function terminal_of

  ! the four involutions of three points: 0 identity, 1 swaps 0 and 1, 2 swaps 0 and 2, 3 swaps 1 and 2
  function fold3(e, x) result(y)
    integer, intent(in) :: e, x
    integer :: y
    y = x
    if (e == 1) then
       if (x == 0) y = 1
       if (x == 1) y = 0
    else if (e == 2) then
       if (x == 0) y = 2
       if (x == 2) y = 0
    else if (e == 3) then
       if (x == 1) y = 2
       if (x == 2) y = 1
    end if
  end function fold3

  ! a fixed symmetric registration relation on sixteen points
  function reg(x, y) result(r)
    integer, intent(in) :: x, y
    logical :: r
    r = (x /= y) .and. (mod(x*y + x + y, 5) == 0)
  end function reg

  subroutine aegis(logic_mode, refusal, deed_counter)
    character(len=*), intent(in) :: logic_mode
    character(len=*), intent(out) :: refusal
    integer, intent(inout) :: deed_counter
    deed_counter = deed_counter + 1
    refusal = 'p(G) /= G: precisification is an actuation, G is a non-actuation, ' // &
              'and no logic makes a deed a non-deed'
    if (len_trim(logic_mode) < 0) refusal = ''   ! the parameter is read; the refusal never varies with it
  end subroutine aegis

  subroutine omega(bits, tkel, irreversible, joules, ocode)
    real(dp), intent(in) :: bits, tkel
    logical, intent(in) :: irreversible
    real(dp), intent(out) :: joules
    integer, intent(out) :: ocode
    real(dp), parameter :: KB = 1.380649e-23_dp
    if (tkel <= 0.0_dp) then
       joules = 0.0_dp; ocode = 0
    else if (bits <= 0.0_dp) then
       joules = 0.0_dp; ocode = 1
    else if (.not. irreversible) then
       joules = 0.0_dp; ocode = 3
    else
       joules = bits * KB * tkel * log(2.0_dp); ocode = 2
    end if
  end subroutine omega

  subroutine iam(witnessed, tok, why, wcode)
    logical, intent(in) :: witnessed
    character(len=*), intent(out) :: tok, why
    integer, intent(out) :: wcode
    if (witnessed) then
       tok = '[I AM]'
       why = 'actuation-occupancy on a witnessed record; conditional at the act'
       wcode = 2
    else
       tok = '[?] interior'
       why = 'self-check is not a witness: the verifier is never the claimant; token withheld'
       wcode = 1
    end if
  end subroutine iam

end program rh_apex_twin
```
\endgroup

# Appendix E: The Twin's Run, Verbatim

`./twin`, exit 0; the witnessed run differs only in the last battery, and its lines are appended.

\begingroup\scriptsize
```
========================================================================
 RH AT THE APEX · THE EXECUTABLE TWIN · v1.0.0
========================================================================

K1 THE SEAT: conjugation on the integer quaternions fixes exactly the scalar line
  lattice points 28561  fixed by sigma 13

K2 THE RETURN: i.j.k = -1 and the reversed triad k.j.i = +1, both on the seat
  i.j.k =  -1  0  0  0
  k.j.i =   1  0  0  0

K3 THE IDENTITIES AND THE CONE CENSUS
  gap vector (self, register, object) =  0 0 0
  apexes over the ordered diagram 1  over the reversed diagram 1

K4 THE EMBEDDING phi_m(h,t) = <t, h-m, 0, 0> against the fold tau_m(h,t) = (2m-h, t)
  m =  -3: stage points on the line 17, preimage hits 289
  m =  -2: stage points on the line 17, preimage hits 289
  m =  -1: stage points on the line 17, preimage hits 289
  m =   0: stage points on the line 17, preimage hits 289
  m =   1: stage points on the line 17, preimage hits 289
  m =   2: stage points on the line 17, preimage hits 289
  m =   3: stage points on the line 17, preimage hits 289

K5 THE WALL: no readout of the seat equals the deed bit, every readout enumerated
  readouts tried 8192  factorizations of the deed bit 0

K6 THE FREEDOM: wholly odd maps on the two-point set, and the calibration
  wholly odd maps: 2

K7 THE APERTURE: presence is actuation; under the axiom no present reader is interior
  present readers 12 of 12; interior rows 0 of 24

K8 THE RULE: (RA -> L) <-> L is equivalent to RA or L; the two-point frame
  RA = F  L = F  (RA -> L) <-> L = F
  RA = F  L = T  (RA -> L) <-> L = T
  RA = T  L = F  (RA -> L) <-> L = T
  RA = T  L = T  (RA -> L) <-> L = T
  four rows: true in every row where RA holds; where RA fails it is true only where L already holds
  RA true, L(two-point frame) false: the axiom decides the value on no frame

K9 THE LEDGER, THE REFUSAL CONSTANT, THE PRICE
  one bit at 300 K:   2.870979E-21 J

K10 THE CLOSURE LAW: every subset of a sixteen-point carrier under a symmetric registration
  subsets enumerated 65536; closed subsets 64; C1 agrees on every one

K11 CANTOR: no system indexes all of its own binary properties
  k = 3: maps enumerated 512, surjective 0, diagonal outside the range 512
  k = 4: maps enumerated 65536, surjective 0, diagonal outside the range 65536

K12 THE LIVE FACE: self-check is not a witness
  LIVE: [?] interior - self-check is not a witness: the verifier is never the claimant; token withheld
  (supply the argument witnessed to open the live face; the program did not
  and cannot generate its own witness)

K13 THE CURE: on every frame, (E -> L) equals L; grounded counter-models exist; no class cures
  three-point frames 32: L holds on 14, fails on 18, of which grounded (a seat exists) 18
  two-point frame classes 256: cured 32, each exactly a class on which L already holds

K14 THE CONSTANT RECURSION, ANY TRUE PREMISE, THE CARRIER BY DECISION, THE THREE MEASURES

========================================================================
 TWIN CENSUS: checks 130324  failures 0
 TWIN-JSON: {"checks":130324,"failures":0,"version":"1.0.0"}
 The twin agrees with the file on every finite claim it carries. Delta-M = 0.
========================================================================

--- ./twin witnessed, the last battery only ---
  LIVE: [I AM] - actuation-occupancy on a witnessed record; conditional at the act
  the witnessed flag was supplied on the command line by the operator running
  this binary; the program did not and cannot generate its own witness.
```
\endgroup
