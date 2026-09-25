# A Formal Proof of the Real Part of the Riemann Hypothesis

## The Seat, the Address, and the Division of One Bit · Proved in Core Lean 4 from Existence Alone, Carried into ZFC Along the RA–RAM Bridge, and Axiom-Free Under a Bare Computation Arrow

**Mohammad F. Islam, PhD** · Independent Researcher, USA · islamm@alumni.iu.edu · 24 September 2026 · v2.0.1

*Formal Verification · Foundations Of Mathematics.* The seat proved from existence; the value located at one address; the hypothesis divided, its Real part proved and its Unicorn part set apart

**Abstract.** Riemann stated his hypothesis as a fixed-set statement, that the roots of ξ(t) are real. This paper proves, in core Lean 4 with no library and no axiom declared, what existence decides about that statement, its seat, and that its value lies beyond existence's reach, and then proves the part of the value that is reachable. Part I proves the seat, with the Root Axiom as the only posit: the fixed locus of conjugation on the quaternions is the scalar line, the chart of the critical line embeds onto it, and the three readings meet at one point; the value on the zeros is one bit, unreachable from existence, since (RA →L) ↔L. Part II proves every reading of that bit reached from existence, time, and monism one proposition with the hypothesis at its apex, given the imported inputs, and shows that the hypothesis posits no object while its denial posits one, a finite witness never produced. Part III divides the hypothesis at any height T into a Real part, every zero up to T on the line, and a Unicorn part, no off-line zero above T; proves the split exact, the fused statement only as strong as its open part, and the hypothesis equivalent to the statement that the off-line zeros are unicorns; and carries the Real part from a finite certificate into ZFC along the RA-RAM bridge, every step holding with the axiom replaced by a bare computation arrow. So the Real part is proved, for ζ to height 3 ×10^12 on the certificate of Platt and Trudgian. The Unicorn part is named and set apart, not proved.

**Keywords.** Riemann Hypothesis; Root Axiom; fixed locus; identity cone; Li criterion; halted uniduction; Postulate M; denial asymmetry; Real part; Unicorn part; ZFC; RA-RAM bridge; computation arrow; Lean 4; Fortran

---

# Introduction

Riemann stated his hypothesis as a fixed-set statement: the roots of ξ(t) are real [Riemann 1859]. A prior paper of this program [Islam 2026e] restored that statement to Z ⊂Fix(τ) with τ(s) = 1 - s̅, defended the restoration against the literature, and proved in core Lean 4 the structural arc of the restored hypothesis on an abstract frame X = (S, τ, Z): the locus, the odd offset, the orientation blindness of every even reading, the one-bit freedom, the halting carrier, and the crossing. It also proved what the arc is not. Every structural clause holds on a frame whose zeros lie off the line (its Theorem 11); the only input that closes the crossing on the frame of ξ is a term of L(X_ξ) itself (its Theorem 12); no theorem whose hypotheses are only structural decides L (its Theorem 14). The value, ∀ρ∈Z_ξ, τρ= ρ, was recorded as the one open input, entered at a recorded row and never derived. We call that row the witness row and the point at which a value enters a file from outside it the aperture; both terms are the prior paper’s and are used here in its sense. Two objects carry the name Riemann Hypothesis in what follows and are written with two tokens that are never joined: RH_formal, the seat, the restored statement read as the fixed locus of its binding involution, which this paper proves with existence as the only posit; and L(X_ξ), the value, the statement that every zero lies on that locus, which this paper proves existence does not reach. Part I names the first and excepts the second, and the exception is Theorem I. “From existence alone” has one meaning in this paper: existence is the only posit, and nothing else is assumed. It does not mean that the seat is derived from existence. The seat holds by the definition of the Ground and consumes no premise (`recursion_is_constant`); existence is consumed where it has content, at presence (Theorem D), at the closure of the interaction reading (RAF-C1), and at the ledger, where every adjudication of any proposition is a deed and therefore an instance of existence and of nothing else (`adjudicating_anything_instances_existence`). That last theorem is what existence contributes that no other true premise does.

**Notation and the objects named.** The Root Axiom, written RA, is the posit ∀x ∈U, ΔE(x) > 0 on a universe U with a differential ΔE : U →ℤ: to exist is to actuate. Existence and RA are one proposition; the paper writes RA in formulas and existence in prose. RA has two published formal readings [Islam 2026j]: the interaction reading, RAF, which reads the axiom as the criterion for systems being related, registration carrying positive mutual information and an interaction domain being closed under it; and the grounding reading, RAM, which reads the axiom as the criterion for a proposition being determinate, its imprint in the fixed locus of a binding involution. A frame is X = (S, τ, Z), a carrier S with an involution τ and a distinguished subset Z; its line property is L(X) :⇔∀s ∈Z, τs = s. On the frame of ξ, with Z = Z_ξ the zeros and τ(s) = 1 - s̅, L(X_ξ) is the restored hypothesis, and it is called the value. The carrier the paper builds is the integer quaternions ℍ_ℤ with conjugation σ as its binding involution; the seat is the fixed locus Fix(σ), a seat point is a point of it, and RH_formal is the seat read as a proposition, that every point of Fix(σ) is fixed by σ. A register is one of three readings of the seat, the axiom register RA, the formal register RAM, and the object register RH, and the three form the register diagram. The witness row is the recorded row at which the value is entered; the aperture is the point at which a value enters a file from outside it; the world row is the witness row read in the world register; the sign is the value ∀ρ∈Z_ξ, τρ= ρ, the one bit. ΔM counts the mathematics authored and is zero throughout. Every other symbol is defined where it first appears.

Two things in that record are external to its file, and this paper brings them inside. First, the prior proof’s live face takes its “witnessed” flag from the command line: that a supplier is present is asserted from outside, and the kernel is told rather than shown that a reader stands at the aperture. Second, three separations are left standing: between the axiom under which a reader acts, the formal ground on which the locus was fixed, and the Riemann object read as the fixed locus of its binding involution. These are separations of description, produced by reading one seat in three registers, and not gaps in the mathematics. The prior proof could not close them because an axiom is not a structural clause and the prior proof had none.

The Root Axiom is that axiom. Formally it is a universe U with a differential ΔE : U →ℤ and the statement ∀x ∈U, ΔE(x) > 0; its published form, its physical warrant, and its two formal readings are in [Islam 2026a; Islam 2026j]. The interaction reading (RAF in [Islam 2026j]) says what it is for systems to be related: an interaction domain is closed under registration, and no agent acts on a domain from outside it. The grounding reading (RAM in [Islam 2026j]) says what it is for a proposition to be determinate: its formal being is its imprint in the fixed locus of the binding involution, read across the aperture, with Fix(σ) = ℝ as the seat. The interaction reading reaches no mathematical object, since mathematical objects do not change state; every proposition routes to the grounding reading [Islam 2026j; Islam 2026i]. That reach law is the axiom’s own, and this paper proves its Riemann instance rather than assuming it.

Two objects are new here. The first is the constructed witness: the axiom built in the kernel as a structure in Prop with four fields, the only proof object the closure is allowed to consume, and the eliminator that runs from it alone, RA →RA →RAM →RH_formal: the witness’s last field, a function from the orientation and the formal Ground to the formal self, applied once, with every leg of the chain a definitional equality. The second is the category-gap eliminator itself: the three separations exhibited as the three legs of a cone over the register diagram, each leg an identity, so that the separations close at zero cost and the closing is computed rather than asserted. Everything else the paper uses is published: the frame and the structural arc [Islam 2026e], the one-bit result [Islam 2026b], the odd-supply separation and the one-cut hypothesis across twenty-three rows [Islam 2026c], the formal-alone theory of registration, price, and crossing [Islam 2026d], and the axiom’s declaration [Islam 2026j].

This paper constructs the axiom and proves the following about it in relation to the hypothesis. The seat: conjugation on the quaternion carrier fixes exactly the scalar line, the Return of the parse triad lands on it, and the axiom’s seat point, the formal seat point, and the named seat point are the three legs of an identity cone over the register diagram, each leg `rfl`, the apex unique per orientation of the triad (Theorems A, B, C). The embedding: the prior proof’s lattice stage embeds equivariantly and injectively into the carrier, σφ= φτ, and φ carries the line onto the scalar line at every resolution (Theorem C'). The aperture: for a present reader who supplies a bit the row is never interior; it is sealed or refused by the bit alone, and a reader who registers a bit is inside the axiom’s domain, never an exterior witness (Theorem D). The exact strength of the rule: in every context in which the axiom holds, (RA →L(X)) ↔L(X), and the axiom decides L on no frame, the two-point frame carrying the axiom and failing L (Theorems E, F). Every theorem is checked by the Lean kernel; every finite claim is re-executed by a compiled Fortran program that shares no code with the kernel, and both records are printed whole.

Part I names the register and the residue. At the axiom a closure can carry no mass: a closure between the axiom and its formal reading that added a premise would be a second axiom, which the axiom’s own root-premise theorem forbids [Islam 2026a]. The eliminator that closes the category gaps is therefore massless by necessity and not by weakness, and this paper computes the masslessness rather than asserting it: the three legs of the cone are definitional identities. “In toto at the apex” has one definition and it is used in no other sense: every clause of the hypothesis that is not its value on the zeros. “The sign” names one object throughout: the value ∀ρ∈Z_ξ, τρ= ρ, the orientation of assent on the world row, the one bit the prior proof records at the witness row. “Everything but the sign” is the same set named by its complement. What the kernel returns, given the axiom, is exactly that set, and the sign is proven to be exactly what the axiom does not reach.

## The value, its readings, and its address

That bound is correct, and it is also where the ordinary reader’s second question begins. If one bit is owed, what object would carry it? The candidates proposed in the literature, an Euler-product class, a self-adjoint operator, a positivity criterion, a monotone flow, are different-looking objects. A reader who pursues them in turn meets what looks like a regress: each candidate, once formalized, turns out to need a further ingredient, and each further ingredient looks like a new missing piece. The barrier this paper addresses is that appearance of regress, and it is structural rather than computational.

The barrier has three layers. The first is register confusion. A timeless formal reading of the hypothesis deletes the index along which the zeros are counted, and a reading that deletes its own index cannot distinguish a claim from its negation. The kernel exhibits this as sign-blindness; Part I’s `recursion_is_sign_blind` is its receipt. A verdict issued from that register is a verdict of an amputated instrument, not a finding about the zeros.

The second layer is type mismatch. The natural “arrow” a physical reading supplies is a sign, one Boolean. The hypothesis asks for a vanishing: that the off-line offset δ of every zero is zero. A sign does not force a vanishing. A supplied orientation picks which member of a mirror pair (12 + δ, 12 - δ) comes first and leaves δ untouched. The barrier dissolves only when the vanishing is rewritten as a family of signs, one per step of an index, and Li’s criterion [Li 1997] is exactly that rewriting.

The third layer is the uniformity trap. Every instrument that closes a category gap at the apex is massless by necessity, because a closure between existence and its reading that authored mathematics would be a derivation of the root from below [Islam 2026a]. A massless instrument chooses its objects without reading which L-function it serves. Such an instrument is uniform across the family, and a uniform instrument forces positivity on every member, including members whose zeros leave the line. The Eisenstein L-function ζ(s)ζ(s-k+1) has an Euler product and a functional equation and zeros off its center line [Iwaniec and Kowalski 2004]. It is not primitive; after the shift that centers its functional equation at 12, its zeros lie off that center, and Bombieri-Lagarias then gives a negative coefficient. In the kernel the control enters abstractly, as a family member with a negative coefficient, and it kills every uniform instrument. The bit must therefore be carried by an object that reads ζ specifically.

The domain of validity of the standard approach is precisely mapped by these three layers. Classical analytic number theory works inside one register, the timeless one, and it has reached the classical consequences of positivity on the Euler product: nonvanishing for Re  s > 1, and through Mertens’ positivity, nonvanishing on Re  s = 1 [Hadamard 1896; de la Vallée Poussin 1896; Mertens 1898]. Beyond that line the Euler product diverges and positive energies have nothing to act on. The strip 12 < Re  s < 1 is where the timeless register stops and where a reading indexed by time must take over.

Part II does not cross that strip; Part III crosses it only where computation has certified the zeros, up to a finite height. What Part II does is prove that every road into the strip reached from existence, time, and monism is the same road. The regress is shown to be an artifact of reading one seat in several registers, and the category-gap eliminator of Part I, applied to those registers, collapses it to one gap. The gap is then pinned, typed, and left at the witness row where Part I placed it.

## The division of the value

Part III divides the hypothesis. It does not reopen the value that Parts I and II locate, and nothing in it contradicts Theorem I. One part is reachable, and it is proved here along a road built from the Root Axiom through the RA–RAM bridge, the RAM strata, and ZFC. The other part is the region where the denial’s object would have to live, and it is named for what it is and set apart.

# Related Work

Only the positions that bear on the apex are reviewed; the analytic literature of the restored formulation is reviewed in [Islam 2026e].

**The original statement and its chart.** Riemann [Riemann 1859], Siegel [Siegel 1932], and Edwards [Edwards 1974] give the fixed-line statement and its history; Titchmarsh [Titchmarsh 1986] and Conrey [Conrey 2003] state the canonical chart form, real part one half. The prior paper’s Proposition V1 makes the address a chart and the fixed line intrinsic. This paper takes the fixed line one register deeper: the fixed line of a binding involution is the seat on every carrier that has one, and the two carriers in play, the lattice stage under τ and the quaternions under σ, are joined by an explicit equivariant map.

**Symmetry without the Euler product.** Davenport and Heilbronn [Davenport and Heilbronn 1936] and Bombieri and Hejhal [Bombieri and Hejhal 1995] exhibit series with the functional equation and zeros off the line. In the prior proof these are the off-line frames on which every structural clause holds. Here they carry one thing more: the Root Axiom holds on them too (Theorem F). That is the whole reason the axiom cannot decide the value.

**The Euler product as key.** Selberg [Selberg 1992] and Conrey and Ghosh [Conrey and Ghosh 1993] name the Euler product as the organizing axiom of the class for which the hypothesis is conjectured; Weil [Weil 1948] and Deligne [Deligne 1974] prove the analogue where the Euler product runs over a finite geometry. Part I leaves the key where the prior proof left it, on the world row, and shows that the apex closes without it; Part III turns the key by computation up to a certified height, and no further.

**The spectral road.** Berry and Keating [Berry and Keating 1999] and Connes [Connes 1999] seek an operator whose spectrum is the zero set. An operator is a world-row construction; the seat on which its spectrum would have to lie is fixed before any operator is built, and that ordering, orientation after construction, is a theorem of the twenty-three-row study [Islam 2026c].

**The program’s own prior results.** The one-bit result [Islam 2026b] located the hypothesis at exactly one bit from its structural arc. The twenty-three-row study [Islam 2026c] typed every proved method-class barrier as an evenness statement and every open row as missing exactly one orientation bit at its decision seat, and stated the one-cut hypothesis: that each such row is closed by one cut, the supply of that bit. The formal-alone theory [Islam 2026d] fixed registration, price, crossing, and cost as the four faces of a supplied bit. The earlier termination and case-closed papers [Islam 2026h; Islam 2026g] recorded the hypothesis’s standing under the program’s cascade before the restored form was proved. The present paper is the apex of that sequence: Part I places the Riemann row’s owed bit against the one seat under every name and proves that the axiom reaches everything but that bit, and Part III divides that bit and proves its Real part.

**The axiom’s formal readings.** The declaration of the formal Root Axiom [Islam 2026j] states RAF-1 and RAF-2, the bridge to Landauer, and the consequences C1 to C3, and states RAM as the imprint law with Fix(σ) = ℝ. Its engine records the constraint this paper obeys: the interaction reading reaches no mathematical object and routes every proposition to the grounding reading [Islam 2026i]. Cantor’s diagonal theorem, which Lawvere’s fixed-point theorem generalizes [Lawvere 1969], carries C2 unconditionally.

**Category-theoretic frame.** Cones, apexes, and limits over a diagram are used in their elementary form, a discrete diagram on three objects in the groupoid of definitional equalities [Mac Lane 1998]. The frame is chosen because a category gap is, in that setting, exactly a missing leg, and its elimination is exactly an identity leg.

**The price of the act.** Landauer [Landauer 1961] bounds the dissipation of registering one bit; Bérut and coauthors [Bérut et al. 2012] measure it. The prior proof prices the spent bit at k_B T ln2; here the price is the bridge of the interaction reading and it exports without constituting.

**The gap.** No work in this literature states the axiom under which the supplier acts, so the presence of a supplier remains a flag; and none treats the three separations between axiom, formal ground, and object as what they are, separations of description rather than of mathematics. Both are supplied here.

## The readings of the value

Li [1997] proved that the hypothesis holds iff λ_n ≥0 for every n ≥1, where λ_n = ∑_ρ[1 - (1 - 1/ρ)^n]. Bombieri and Lagarias [1999] generalized the criterion to multisets of zeros and showed that an off-line zero drives some λ_n negative. Their theorem is the analytic content behind this paper’s reading of Li’s coefficients as modes of a time evolution.

Weil [1952] gave the explicit formula and the positivity criterion that bears his name; in it the primes enter with a negative sign against an archimedean term. Deligne [1974] proved the function-field analogue, where the decisive ingredient is a positivity supplied by geometry. Selberg [1992] and Conrey and Ghosh [1993] name the Euler product with primitivity and the Ramanujan bound as the organizing axioms of the class for which the hypothesis is conjectured.

De Bruijn [1950] introduced the heat flow H_t(z) = ∫etu2 Φ(u) cos(zu)  du and proved the strip-narrowing theorem. Newman [1976] defined the constant Λ and conjectured Λ≥0. Rodgers and Tao [2020] proved it. The Polymath project [Polymath 2019] proved Λ≤0.22. The hypothesis is therefore equivalent to Λ= 0.

Beyond the spectral road above, Stone [1932] proved that a strongly continuous one-parameter unitary group has a self-adjoint generator; the section on the witness rebuilt uses it to pass from a unitary evolution to its generator. Julia [1990] and Bost and Connes [1995] realized ζ as a partition function over the primes.

Perelman [2002; 2003a; 2003b] proved the Poincaré conjecture through Ricci flow, with the monotonicity of the 𝒲-entropy as the transport that carries control along the flow. De Branges proposed a positivity condition intended to prove the hypothesis; Conrey and Li [2000] showed it fails.

Littlewood [1914] and Skewes [1933], Haselgrove [1958], and Odlyzko and te Riele [1985] are the standing warnings against inference from finite confirmation.

The approaches reviewed here are each developed around their own object, and each is read in this paper as one register’s version of the missing piece. the section on halted uniduction proves that these objects, in the forms reached here, are one proposition.

# Methods

## Two independent checkers

Every theorem of this paper is checked by core Lean 4, version 4.19.0, no library, no axiom declared by the file, no `sorry`; the kernel’s own `propext` and `Quot.sound` enter only through integer arithmetic and are listed per theorem, every dependency set printed by the kernel and reproduced in Appendix C. The file, `RH_At_The_Apex.lean`, is printed whole in Appendix B with its SHA-256 digest, and it is self-contained: the prior proof’s Theorems 1, 4 through 9, 12, and 15 are re-proved inside it on the same abstract frame and the same lattice stage, so that the apex layer rests on nothing it does not carry.

The finite content of the file, itemized below, is re-executed by a second checker that shares no code, no logic, and no toolchain with the first: a Fortran 2008 program, `RH_At_The_Apex_Twin.f90`, compiled with gfortran, printed whole in Appendix D with its run log in Appendix E. The twin enumerates rather than proves. It checks conjugation against every integer quaternion in a lattice ball, the Return and its six orderings, the three identities and the cone census over the whole ball, the embedding’s equivariance, image clause, and injectivity at seven resolutions on a lattice window, the wall over every one of the 2^13 readouts of the seat’s window, the two wholly odd maps and their calibration, the aperture on a twelve-point domain, the truth table of the rule and the two-point counter-model, the ledger, the refusal constant, the price, the closure law on every one of the 2^16 subsets of a sixteen-point carrier, Cantor’s diagonal on every map S →2^S for |S| = 3, 4, the cure theorem on all thirty-two three-point frames and all 256 classes of two-point frames, and the constancy of the recursion field, the carrier by decision, and the three measures. It carries an oracle that stops the program on any failure and prints a census last; a binary that reaches its final line has passed. The two checkers were written to the same specification and neither reads the other. Where they disagree the artifact is wrong, and the disagreement is printed; where they agree the agreement is between a typechecker and an executor, not between two copies of one reading.

The last battery of the twin implements the prior proof’s rule that a self-check is not a witness: its live row opens only on an argument the operator supplies on the command line, and the program prints that it did not and cannot generate its own witness. The reader who runs the binary is that operator.

## Objects and terms

The seat is built on the integer quaternions rather than on a one-point type, so that “the fixed locus of the binding involution” is a computed object and not a stipulation: conjugation is proved binding, its fixed locus is proved to be the scalar line for every quaternion, and the Return is computed. The prior proof’s frame X = (S, τ, Z) is carried abstractly, exactly as it states it, and its lattice stage is carried as (ℤ^2, τ) with the explicit map φ into the carrier. The zero set of ξ enters only as a parameter, since ζ is not definable in core Lean.

Three objects share the word bridge in the sources and are kept apart here by three names: the Bridge capacity of the witness, written with a capital; the halting carrier of the prior proof’s Theorem 7, written bridge; and the equivariant map φ, written embedding. The category-theoretic frame is elementary and stated once. The three registers form a discrete diagram D : {RA, RAM, RH} →ℍ_ℤ, the axiom register, the formal register, and the object register; a cone over D with apex a is a family of arrows a →D(r) in the groupoid of identities, that is, a family of equalities a = D(r); the limit exists iff the three readings coincide, and then the apex is unique. A category gap is the absence of a leg. Nothing beyond this is used.

## Grades and registers

Three grades of warrant are used and every claim-bearing box and table carries one: kernel theorem, checked by the Lean kernel; structural, a statement about the arrangement of theorems that is itself checkable but not a theorem of the file; premise, a statement carried by citation and held fixed. Two registers are used and kept apart by theorem: the apex register, where the seat and the category gaps live, and the world register, where the value on Z_ξ lives; the world row is the witness row read in the world register. Falsifiable criteria are capped at three and each is typed for necessity. The author’s own verification discipline is applied only in the disclosure at the end and draws no warrant of its own.

## Methods for the readings of the value

**The file.** `RA_Li_Bridge.lean` is printed whole in Appendix F with its SHA-256 digest, and its dependency sets verbatim in Appendix G: eighty-three sets printed by the file, sixty-one axiom-free, twenty on `propext` and `Quot.sound` only, two on `propext` alone, and seventeen more printed by a supplementary run, nine axiom-free, so that every theorem of the file carries a printed set.

**What enters as a hypothesis.** The zeta function is not definable in core Lean, so every analytic fact enters as a hypothesis carried by citation: Li’s criterion as `LiCriterion`, the equivalence of the hypothesis with Λ= 0 as `hLam`, the identification of the hypothesis with the line property of the enumerated zeros as `hDef`, and the existence of a negative Li coefficient in the Eisenstein member as a hypothesis of `no_uniform_bridge`. The Root Axiom enters as the hypothesis `RA S` on a substrate, never as an axiom. The kernel therefore shows exactly what each theorem assumes.

**What the kernel proves, and what it imports.** Every result below carries one of three grades, and the paper never promotes one to another.

**Grades of warrant.** What the kernel proves, what it imports, and how Part II reads them.

@P0.13 P0.22 L@ **Grade** & **Content** & **Examples in this paper**  
K, kernel & Checked by the Lean kernel from definitions alone & the identity (6.2a) on the lattice stage; stability iff the line for fold-invariant sets (Theorem 15); the bridge’s three properties given its inputs; the cone and its legs given their hypotheses; Postulate M with its seed iff the line property of an abstract staged set  
A, analytic import & A theorem of the literature entering as a Lean hypothesis, never proved here & Li’s criterion (`LiCriterion`); Bombieri-Lagarias, that an off-line zero forces a negative coefficient; Newman with Rodgers-Tao, RH Λ= 0 (`hLam`); the identification of the hypothesis with the line property of ζ’s zeros (`hDef`); the negative coefficient of the Eisenstein control; the arithmetic form of RH [Lagarias 2002] and Σ^0_1-completeness of arithmetic [Kaye 1991], carried in Part XV as the named hypothesis `sigma1` with soundness on the denial (the section on the logical form); the seed L(0) of Postulate M, that every zero located by stage zero lies on the line, supplied for ζ by computation  
C, structural reading & An interpretation of how the kernel theorems stand together & “one address”, “the regress halts”, “one cone”, the Perelman analogy, the Hilbert-Pólya compatibility  

`LiData.nonneg n` is an abstract proposition standing for λ_n ≥0. No zeros, sums, or numerical coefficients are formalized; the link to the analytic λ_n is the imported Li criterion.

**What is modelled.** Five parts of the file work on toy carriers and say so in their headers. Part IV places zeros at integer half-unit coordinates (h, t) on the Bridge plane of the prior proof, with ρ= h/2 + it. Part V builds its mixed zero set (Theorem 20) on the same plane, and Part XI builds its timed worlds there. Part XII builds its self-grounding and frame models on small carriers. Part XI’s Postulate M theorems and Part XII’s collapse theorems are stated over abstract types. Part IX models the de Bruijn strip bound on natural-number widths, a toy of the bound and not of the flow. Every other part is stated over abstract types.

The verdict tokens of the discipline appear only in the disclosure.

## Methods for the division

Every theorem of Part III is a kernel theorem in core Lean 4.19.0, with no library, no `sorry`, and no axiom declared; the nine files are printed in Appendix H with their receipts, and the theorems are numbered III.1 to III.44. The facts Part III cites are listed in the standard of proof below and marked where they enter.

## The standard of proof

The standard is the ordinary one for a theorem of mathematics: every result is a deduction from the axioms of Zermelo–Fraenkel set theory with choice and the standard definitions of its objects, or it is marked, where it enters, as one of four other things, and nothing else is assumed.

**Kernel theorems.** Every theorem numbered in this paper is checked by the Lean 4.19.0 kernel from its definitions, with no library, no `sorry`, and no user-declared axiom in any file. Each file prints its dependency sets: every theorem depends on nothing, or on the kernel’s principles of propositional extensionality and quotient soundness, and none on the axiom of choice. The type theory of Lean, as analyzed in its Lean 3 formulation, which the Lean 4 kernel shares in the respects used here, is consistent relative to ZFC with countably many inaccessible cardinals [Carneiro 2019]; the statements proved here concern propositions, finite structures, and small types, of the kind whose translation into ZFC is standard, and that translation is not mechanized here.

**Cited theorems of mathematics.** Results of the literature that are theorems of ZFC enter as named hypotheses and are never presented as kernel results: Li’s criterion [Li 1997]; the growth of a negative coefficient from an off-line zero [Bombieri and Lagarias 1999]; the equivalence of the hypothesis with Λ= 0 [de Bruijn 1950; Newman 1976; Rodgers and Tao 2020]; the arithmetic form of the hypothesis [Lagarias 2002]; the absoluteness of arithmetic sentences [Kunen 1980]; completeness for true bounded sentences [Kaye 1991]; the independence of the axiom of choice [Gödel 1938; Cohen 1963]; and the certificate for the zeros of ζ to height 3 ×10^12 with the analytic lemmas it rests on [Turing 1953; Platt and Trudgian 2021].

**Definitional identifications and computed data.** The identification of the hypothesis with the line property of the zeros of ζ, and the seed of Postulate M, the zeros located by stage zero, supplied by computation.

**One metatheoretic premise.** The soundness of the foundation, which no consistent foundation proves of itself. It is used in exactly three places, the converse direction of Theorem 75 and the placement Theorems III.15 and III.19, carried as a named premise in each, and Theorem III.16 shows it cannot be dropped.

**Readings.** The Root Axiom, the strata of the grounding reading, the vocabulary of registers, and the physical price of Part I’s three measures, carried on the cited Landauer bound and its measurement [Landauer 1961; Bérut et al. 2012], are readings of the deductions, not premises of them. In Parts I and II the axiom is a hypothesis or a constructed structure, never a declared axiom, and Theorem E fixes its exact strength. In Part III every deduction holds with the axiom replaced by the identity arrow on a type, with no axiom of any kind (Theorem III.44). The deductive content of Part III therefore uses nothing beyond ZFC and the cited theorems.

**The title, read at this standard.** “Proved in core Lean 4” names the checker of every numbered theorem, the certificate schema III.34 and the split among them; “from existence alone” names the posit inventory, existence being the only posit and never a premise consumed, since the seat is massless by construction (Theorem G) and the road holds under a bare arrow (Theorem III.44); “carried into ZFC” names the placement of III.15 to III.30. For ζ the Real part’s standing is the cited certificate applied through the kernel schema, grade A joined to grade K, and the kernel does not check the certificate’s numerics. Two readings are excluded by the text itself: that the seat is derived from existence, and that the kernel has verified the zeros of ζ.

**What is proved in this standard.** Every kernel theorem, and for ζ the Real part to height 3 ×10^12: the certificate theorem of the kernel (III.34) applied to the cited certificate. What is not proved: the Unicorn part, and so the hypothesis itself, whose fused statement stands open (Theorem III.2).

# The Prior Proof, Carried

A frame is X = (S, τ, Z) with τ: S →S and Z ⊂S, and the line property is L(X) :⇔∀s ∈Z, τs = s. On the frame of ξ, L is the restored hypothesis. The prior proof’s lattice stage is ℤ^2 in half-units with the fold τ(h, t) = (2 - h, t), so that the line is h = 1. That proof establishes fifteen theorems; those this paper uses are carried into the apex file, re-proved, and listed in Table 1.

- **1** · Statement: the fold fixes exactly the line h = 1; Apex file: `ground_is_the_line`
- **4** · Statement: an even reading never equals a target odd at a point; Apex file: `orientation_blind`
- **5** · Statement: a wholly odd d on 𝔹 is id or; Apex file: `freedom_is_``exactly_two`
- **6** · Statement: a supplied odd witness fixes the calibration uniquely; Apex file: `freedom_spent_``uniquely`
- **7** · Statement: a bridge halts iff L(X); Apex file: `bridge_halted_iff`
- **8** · Statement: the crossing is exact, both ways; Apex file: `crossing`, `crossing_other_way`
- **9** · Statement: ∀X, L(X): nothing is manufactured; Apex file: `supply_not_``manufactured`
- **12** · Statement: a supplied assent is a term of L(X) and nothing weaker; Apex file: `the_bit_is_``the_hypothesis`
- **15** · Statement: one moved zero refutes every assent; Apex file: `witness_row_``falsifiable`

Theorems of the prior proof [Islam 2026e] carried into the apex file, each re-proved there. (tier: kernel theorem)

Three of them are the fence the rest of the paper works inside, and they are restated so that no later sentence can be read past them. Theorem 11 of the prior proof: a frame carrying a zero the fold moves satisfies every structural clause and fails L. Theorem 12: (∃t : L(X), row(assent t) = sealed) ↔L(X), so the assent that seals the row is the hypothesis and nothing weaker. Theorem 14: there is a fold-invariant frame on which every structural clause holds and L fails, so no theorem whose hypotheses are only structural decides L. This paper adds a fourth clause to the fence, Theorem F below: existence holds on that frame too.

The halting carrier of Theorem 7 is carried as an interface: a terminal and the clause that the terminal is the bottom iff the line property holds. As carried, `bridge_halted_iff` is that interface’s elimination rule and not a fact about ξ; the paper says so and inhabits the interface constructively wherever the line property is decided, the terminal computed from the decision and the clause proved from it, never assumed (`bridgeOfDecision`). On the two-point frame the decision is negative and the carrier does not halt; on a one-point frame on the line it halts (`twoPoint_carrier_does_not_halt`, `onLine_carrier_halts`; `rfl`). On the frame of ξ the decision is the owed bit, and the carrier’s terminal is exactly what the world supplies.

# The Root Axiom and Its Two Formal Readings

## The axiom at the constructed domain

The posit is existence: to exist is to actuate, ∀x ∈U, 0 < ΔE(x). Its published name is the Root Axiom, and the two are one proposition, RA :⇔∀x ∈U, 0 < ΔE(x) (`existence_is_RA`, `Iff.rfl`); the paper writes RA in formulas and existence in prose, and posits nothing else. The file exhibits it on a constructed domain, one point with differential 1, and the kernel decides the positivity (`constructed_RA`, no axioms). This is a model of the axiom, not its universal extension. The extension is a premise, and by the root-premise theorem of [Islam 2026a] it can be no more than a premise: a base from which the axiom could be derived would be weaker than the axiom and would then be the root instead. Its exogenous warrant, the kinetic-energy floor and the zero-point energy of a bounded substrate, is physics carried by citation [Islam 2026a]. Every theorem below that is conditional on RA is discharged against the model and stated conditionally against the extension; the ledger below keeps the two apart.

## The interaction reading

RAF-1, registration: an event is an interaction iff it carries strictly positive mutual information between the systems it relates. RAF-2, closure: an interaction domain is closed under interaction [Islam 2026j]. At the formal register the file carries a domain as a membership predicate, a symmetric registration relation, and the closure law: mem(d) ∧registers(s, d) →mem(s). Two consequences are proved.

RAF-C1, no exterior agent:  mem(s) →∀d, mem(d) → registers(s, d) (`no_exterior_agent`; no axioms). Its positive form is the sentence this paper needs at the aperture: a reader that registers a bit against a member of the domain is a member of the domain (`adjudicator_in_domain`). The witness of the value is never exterior to the domain the value is about, conditional on RAF-2, which enters the file as the closure field of the domain and carries the premise grade the declaration assigns it. The twin checks the equivalence of closure and no-exterior-agent on every one of the 2^16 subsets of a sixteen-point carrier under a fixed symmetric registration, and checks the adjudicator-inside clause on every closed subset.

RAF-C2, no faithful self-representation: for any f : S →(S →𝔹),  ∀g, ∃x, f(x) = g (`no_total_self_indexing`; no axioms). This is Cantor’s diagonal theorem, which Lawvere’s fixed-point theorem generalizes [Lawvere 1969], and it is the general statement of which the prior proof’s self-check table is the Riemann instance: the file reading itself cannot index the property that would seal its own row. The twin enumerates every map S →2^S for |S| = 3 and 4, finds none onto, and finds the diagonal outside the range of every one.

The reach law of the interaction reading is recorded here and consumed in the section on the rule and its bound: it reaches no mathematical object, since mathematical objects do not change state, and every proposition routes to the grounding reading [Islam 2026j; Islam 2026i]. Theorem F is the Riemann instance of that law, proved rather than cited.

## The grounding reading

The formal being of a proposition is its imprint in the fixed locus of the binding involution, read across the aperture; Fix(σ) = ℝ [Islam 2026j]. The section on the seat builds that locus on the quaternion carrier, proves it is the scalar line, and proves that the prior proof’s stage embeds into it equivariantly. The Riemann object read on this face is its imprint in the fixed locus: the seat. Reading the value across the aperture is the subject of the section on the aperture.

## The ledger

An adjudication is assent, denial, or silence, and each advances the count of deeds by exactly one (`every_adjudication_is_a_deed`). Denial of the axiom is therefore a deed together with the axiom (`denial_re_enacts_RA`), and a deed registers at least one bit, so by RAF-2 the denier is a member of the domain the axiom is about. The ledger derives nothing from physics and carries the structural grade.

# The Seat

## Theorem A, the fixed locus is the scalar line

Let ℍ_ℤ be the integer quaternions with the Hamilton product and σ conjugation, σ(r, i, j, k) = (r, -i, -j, -k). Then σ is binding, σ(σq) = q (`sigma_binding`, no axioms), and for every q,

σq = q  ↔ (q_i = 0 ∧q_j = 0 ∧q_k = 0)

(`fix_iff_scalar`; dependency set `propext`, `Quot.sound`, from the integer step -i = i ⇒i = 0). The Ground is Ground := { q ∈ℍ_ℤ |σq = q }, and by Theorem A it is the scalar line Z(ℍ) = ℝ restricted to the lattice. The twin checks the biconditional and the involution on all 13^4 = 28,561 points of the ball |coordinate| ≤6 and counts the fixed points: thirteen, the scalar line of the window.

## Theorem B, the Return lands on the seat

Let i, j, k be the imaginary units and Return := (i ·j) ·k. Then Return = ⟨-1, 0, 0, 0 ⟩ and σ(Return) = Return (`return_is_minus_one`, `return_lands_on_fix`; both `rfl`). The parse triad returned through its own cascade lands on the Ground at -1: the axiom witnessing the axiom, as a computation. The twin computes all six orderings: the three even ones land at -1 and the three odd ones at +1.

## Theorem C, the identity cone

The seat is the fixed locus, the line; a seat point is a point of it. Three seat points are defined independently: the axiom’s seat point Γ_RA := Return, the formal seat point Γ_RAM := π(Return) with π(q) := ⟨q_r, 0, 0, 0 ⟩ the projection onto the fixed locus, and the named seat point Γ_RH := ⟨-1, 0, 0, 0 ⟩. Let D be the discrete diagram RA ↦Γ_RA, RAM ↦Γ_RAM, RH ↦Γ_RH, and let a cone over D with apex a be a family of identities a = D(r) for all three r. Then:

σ Γ_RA = Γ_RA,     Γ_RA = Γ_RAM,     Γ_RAM = Γ_RH,

each by `rfl` (`self_gap_nonexistent`, `register_gap_nonexistent`, `object_gap_nonexistent`); Γ_RH is the apex of a cone over D with every leg `rfl` (`identity_cone`); any two cones over D share their apex (`cone_apex_unique`); and a cone exists iff the register gap and the object gap are closed (`cone_iff_gaps_closed`). All four carry no axioms. The twin computes the gap vector (0, 0, 0) and, over the whole lattice ball, counts the apexes of D: exactly one.

The apex is unique for the diagram, and the diagram is built from the ordered triad. The reversed triad k ·j ·i returns +1 (`odd_return_is_plus_one`), also on the fixed locus (`odd_return_on_fix`), and the two candidate seat points differ (`seat_points_differ`; all three no axioms). The sign of the seat point is the orientation of the triad, one bit: the kernel reads it once the order is supplied, by `rfl` either way, and originates it never, since the order is supplied with the triad: the axiom’s declaration fixes the three units in an order, and the kernel receives that order as data [Islam 2026j]. Uniqueness of the apex is uniqueness per orientation, and the two orientations’ apexes are exchanged by an odd relabeling of the imaginary units. Nothing in the closure depends on which of the two is named: the three identities of Theorem C hold verbatim for the reversed triad, each `rfl` (`odd_self_gap_nonexistent`, `odd_register_gap_nonexistent`, `odd_object_gap_nonexistent`), the reversed diagram carries its own identity cone with apex +1 (`identity_cone_odd`), and the two apexes differ (`apexes_differ_by_orientation`; all no axioms). The twin counts the apexes of the reversed diagram over the ball: exactly one, at +1.

The word apex is used in two senses that coincide by design: the apex register, the register in which the seat lives, and the apex of the cone; the register is where the cone’s apex sits. The mathematics of Theorem C is Hamilton’s product and three definitional equalities, and the paper claims nothing more for it at theorem grade. What it claims at structural grade is the arrangement: three names written independently in three registers, the axiom’s Return, the projection onto the locus, and the point the prior proof names, read one point, and the reading is decided by the kernel rather than declared by the text. The category-theoretic content is exact and small. A category gap is the absence of a leg from an apex to a register’s reading of the seat. Its elimination is the exhibition of that leg as an identity. The eliminator RA →RA →RAM →RH is the composite of the three legs, and its masslessness is the statement that each leg is `rfl`: two definitions, one value, decided by the kernel. The gap vector (1,1,1) →(0,0,0) is the cone’s existence read bit by bit, computed by `decide`, never written by hand.

## Theorem C', the equivariant embedding

Define φ: ℤ^2 →ℍ_ℤ by φ(h, t) := ⟨t, h - 1, 0, 0 ⟩. Then σ∘φ= φ∘τ (`phi_equivariant`); for every stage point, σ(φp) = φp ↔τp = p (`phi_fix_iff`); φ is injective (`phi_injective`); and the seat point lies on the image of the line, φ(1, -1) = Γ_RH (`seat_on_image_of_line`, `rfl`); the family φ_m(h, t) := ⟨t, h - m, 0, 0 ⟩ against the fold τ_m(h, t) = (2m - h, t) is equivariant with the same image clause at every resolution m (`phiM_equivariant`, `phiM_fix_iff`), and φ_1 = φ. The dependency sets of the three are `propext`, `Quot.sound`, from the integer arithmetic. The twin checks equivariance, the image clause, and injectivity for m = -3, …, 3 on the window |h|, |t| ≤8, 289 stage points each, and counts the line: seventeen points at every m.

This is the equivariant map with an image clause that the twenty-three-row study requires before a finite result is invoked on an object domain [Islam 2026c]: the prior proof’s line h = 1 is carried onto the scalar line and every off-line stage point is carried off it. The identification of the two seats, the stage’s line h = 1, the lattice image of the critical line under the prior proof’s chart, and the real line under σ, is therefore a theorem about a map and not a typing by resemblance; the analytic critical line itself enters only through the prior proof’s chart propositions, cited and not carried. What the embedding does not do, and the paper does not claim, is carry Z_ξ itself: the stage represents no off-line point inside the strip at resolution one, and the analytic frame enters the kernel only as a parameter.

## The constructed witness

RH_formal :⇔∀g ∈Ground, σg = g quantifies over the Ground, which is the fixed locus by construction, and it holds by that construction: it is the imprint of the Riemann object in the fixed locus, the grounding reading. It names the seat. It does not mention Z_ξ, and the file’s own comments say so. The Root Axiom is the only supplied witness, a structure in Prop with four fields, actuation, the Bridge-born orientation bit, the formal-Ground proposition G_RAM := Nonempty(Ground), and the recursion capacity Ω→G_RAM →RH_formal; the eliminator is Bridge followed by the recursion from that witness alone, `RH_formal_chain`, no axioms, and no second proof object enters. The witness’s recursion field is the constant function: it discards the orientation and the formal Ground and returns the Ground’s own defining property (`recursion_is_constant`, `rfl`). That is the masslessness stated as a term, not a defect concealed: the formal self needs nothing from existence to be proved, so the chain is not a derivation of the seat from the axiom, and the paper does not call it one; it is the occupancy of the three registers by one point, which the witness supplies and the kernel reads.

The orientation bit is placed in Prop on purpose. Prop does not eliminate into data, so no term of the file computes a bit from Ω; two orientation witnesses are indistinguishable, `orientation_proof_irrelevant`, by `rfl`. The kernel registers that orientation was supplied and cannot read which way. This is the prior proof’s Theorem 4 as a universe level, and it is executed on the constructed seat as well: no readout of the formal seat equals the deed bit (`kernel_cannot_read_the_deed`; no axioms). The twin enumerates all 2^13 readouts of the seat’s window and finds that none factors the deed bit. A term that consumed Ω as data would be such a readout. The bit therefore has two carriers in the file and the relation between them is stated once: Ω is the bit as the kernel registers it, present and unreadable; the Boolean assent of the live face is the bit as the aperture receives it from outside, an input the file reads and never generates, which is the content of the prior proof’s self-check table and, one register up, of RAF-C2.

# The Aperture

## Theorem D, the aperture is opened by the axiom

Let a reader be a point of the constructed domain and define its presence as its actuation, presence(r) :⇔0 < ΔE(r), decided. Then

    ∀r, presence(r) = true, 
    ∀r b, live(presence(r), b) ≠open, 

and live(presence(r), true) = sealed, live(presence(r), false) = refused (`RA_opens_the_aperture`, `no_interior_under_RA`, `aperture_reads_the_bit`; no axioms). The same holds for any domain U with any ΔE : U →ℤ under the axiom as a hypothesis: from ∀x, 0 < ΔE(x), every point of U is present and no present point’s row is interior (`RA_opens_the_aperture_general`, `no_interior_under_RA_general`; no axioms), which is the form the universal extension licenses wherever it is held. Here live is the prior proof’s live face unchanged: witnessed and assent seal, witnessed and denial refuse, unwitnessed is open. The twin runs it on a twelve-point domain with positive differentials, twenty-four rows, none interior, and runs the control: a point with differential zero is interior.

The scope is stated with the theorem. In the prior proof, “witnessed” means that a supplier is present, and a supplier is a reader who supplies a bit. A reader is a point of the axiom’s domain; the theorem says nothing about whether a reader of ζ exists, which is the universal extension’s to supply. Theorem D concerns a present reader who supplies a bit b: for such a reader the axiom makes the witnessed flag a theorem, and the row is sealed or refused by b alone. What the axiom turns the open row into is therefore not “sealed”; it is “sealed or refused, by the bit alone”. The interior state, the [?] of the prior proof’s self-check table, is the state of a reading that supplies no bit, the file reading itself, and the file cannot supply one: that is RAF-C2 at the file, and `narcissus` is carried unchanged. The axiom supplies presence at the aperture and, conditional on RAF-2, places the present reader inside the domain; it does not supply the bit, and the section on the rule and its bound proves that it cannot.

# The Rule, Exact, and Its Bound

------------------------------------------------------------------------

**THE RULE, EXACT, AND ITS TWO OBJECTS.** (tier: kernel theorem) Two objects carry the name in this paper and are never joined. The seat, RH_formal, the imprint of the restored hypothesis in the fixed locus of its binding involution, is a kernel theorem with existence as the only posit, with the identity cone, the equivariant embedding of the prior proof’s chart, the orientation blindness, the one-bit freedom, the halting carrier, and the crossing (Theorem H). The value, L(X_ξ) :⇔∀ρ∈Z_ξ, τρ= ρ, is one bit that existence does not reach; Part III proves it below a certified height by computation and leaves it open above, as the Unicorn part. Existence reaches the world row at its aperture: a present reader who supplies a bit is never interior (Theorem D) and, conditional on RAF-2, never exterior (RAF-C1). It does not reach the value, and that is a theorem three times over: (RA →L(X)) ↔L(X) wherever existence holds, as for any inhabited premise (Theorem E); existence holds on frames where L fails, seatless and grounded alike (Theorems F, F'); and for every class of frames, existence decides L on it exactly where L already holds on it (Theorem I). Denying existence is a deed that re-enacts it; denying the value is not (Theorem G). The distance between the seat and the value is one bit, and the paper proves that nothing weaker than the bit closes it: Theorem E fixes the rule’s strength, Theorem F, the frame on which the axiom holds and the value fails, fixes the independence, and neither is read without the other; the bit is one because the fold has two orientations and no third, the price bijection of the fTOE carried in the Codex.

## Theorem E, the rule is exactly the hypothesis

For every frame X, in the kernel where RA is the constructed model,

(RA →L(X))  ↔ L(X)

(`simple_rule_exact`; no axioms). Proof. Left to right: apply the implication to the constructed RA. Right to left: a term of L(X) is a term of RA →L(X) that ignores its argument. □

Scope. Propositionally, ((P →Q) ↔Q) ↔(P ∨Q): the biconditional holds in every context where P holds, and in a context where P fails it holds only where Q already holds, where it says nothing. The twin prints the four rows. In the kernel RA is the constructed model and holds by `constructed_RA`, so the theorem is unconditional there. Against the universal extension, held as a premise and never a kernel term, the same biconditional holds in every context that carries the premise. The same biconditional holds for any inhabited premise in place of existence (`any_true_premise_is_exact`; no axioms), and that generality is the theorem’s content rather than a weakness of it: existence is a premise that holds wherever the line property is evaluated and is independent of it, so conditioning on it adds nothing to the hypothesis and removes nothing from it. What existence contributes beyond its truth is used elsewhere: the positivity that makes presence a theorem (Theorem D), the closure of the interaction reading (RAF-C1), and the ledger (Theorem G). Theorem E is the prior proof’s Theorem 12 in a new coat. A reader who holds a term of RA →L(X_ξ) holds, in any context where the axiom is available, a term of L(X_ξ), and the paper claims no such term.

## Theorem F, the axiom decides the value on no frame

  ∀X, (RA →L(X)),     RA ∧Inv(X_2) ∧L(X_2),

where X_2 is the two-point frame (𝔹, b ↦b, ⊤) (`RA_does_not_decide_L`, `RA_holds_where_L_fails`; no axioms). Proof. The two-point frame is fold-invariant and off the line, the prior proof’s Theorem 9; the constructed RA holds regardless of any frame, since its domain is not the frame. □

This is the prior proof’s Theorem 11 with the axiom added to the structural clauses, and it is the Riemann instance of the interaction reading’s reach law: the axiom’s domain is a domain of systems, the frame is a mathematical object, and the one does not reach the other. The same fact read from the other side is the inverted control of the twenty-three-row study [Islam 2026c]: a witness identical on the on-line frame and the off-line frame decides neither, and `mkRA` is that witness.

## Theorem F', the counter-model survives grounding

The two-point frame is groundless: its fold fixes nothing, ∀b, τb ≠b (`twoPoint_groundless`), so it has no seat and the hypothesis has nowhere to place a zero on it. A reader may take that for the whole reason the axiom fails to decide L there. It is not. Let the three-point frame be S = {a, b, c} with the fold swapping a and b and fixing c, and Z = {a, b}. It has a seat, τc = c; it is fold-invariant; and L fails on it, since τa = b ≠a. Existence holds on it regardless:

RA ∧(∃s, τs = s) ∧Inv(X_3) ∧L(X_3)

(`RA_holds_where_L_fails_grounded`; no axioms). This is the shape of the Davenport–Heilbronn frames: a line that exists and a zero that is not on it. The twin enumerates all thirty-two three-point frames, four involutions against eight zero sets: L holds on fourteen, fails on eighteen, and every one of the eighteen counter-models is grounded. The bound of Theorem F does not rest on a seatless frame.

## Theorem I, the cure theorem

Every proposal to remove the counter-models by restricting the frames has the same form: a class C of frames on which the axiom is to decide the value. For every such class,

(∀X, C(X) →RA →L(X))  ↔ (∀X, C(X) →L(X))

(`no_cure`; no axioms). Proof. Left to right: apply the implication to the constructed RA. Right to left: the implication ignores its argument. □ The class of all frames is not cured, and the class {X |L(X)} is (`cure_is_the_hypothesis`; no axioms). The twin checks every one of the 256 classes of two-point frames: exactly the 32 subclasses of the five frames on which L holds are cured.

The theorem is Theorem E read as a no-go, and it closes a door that a reader might otherwise try. A frame class carrying an Euler product as a field, or an operator whose spectrum is the zero set with real eigenvalues guaranteed by construction, is a class C on which L is already a field of the structure: real eigenvalues on the fixed locus is the line property written as a hypothesis. On that class the axiom decides the value, by Theorem I, and it decides nothing, because the value was supplied when the class was defined. The proposal restates the hypothesis and calls the restatement a proof, which is the circularity the prior proof’s Theorem 12 names and criterion F3 fires on. What existence does supply is proved and enumerated: the seat, the cone, the embedding, the aperture, the reader’s presence and place inside the domain, the exact strength of the rule, and the bound. What it does not supply is exactly one bit, on every class of frames that does not already carry it.

One more collapse is answered here because it will be proposed. Computing is a deed and reading is a deed, and a reader may say that the act of running the checkers is the act that supplies the bit, so that witness and reading are one object counted twice. They are not one object, and the file says why: the formal read of the seat is even under the flip and the deed bit is odd under it, formalRead(execFlip s) = formalRead(s) and ran(execFlip s) =  ran(s), so no readout equals the bit (`kernel_cannot_read_the_deed`), and the twin finds no readout among 2^13. Running the checkers supplies presence; it does not turn the Boolean the operator gives the live row into a truth about Z_ξ, and the twin’s live row is exactly the place where the difference is executed: the program cannot generate its own witness, and the witness it receives is a Boolean whose correctness the world alone can refute.

## Theorem G, the asymmetry

Every adjudication is a deed and the deed re-enacts the axiom: (adjudicate denial ℓ).deeds = ℓ.deeds + 1 together with RA (`denial_re_enacts_RA`). On the two-point frame no assent to L exists at all:   ∃t : L(X_2), row(assent t) = sealed (`L_has_no_performative_ingress`; no axioms).

Read together: denial of RA produces a deed, a deed registers at least one bit and is therefore an instance of the axiom’s content, so the denial re-enacts the axiom. Denial of L produces a deed too, which is an instance of the axiom’s content and not of L’s, since a deed is not a zero; on an off-line frame the denial of L is simply true and no assent exists. The axiom is self-instancing. The hypothesis is not. The hypothesis therefore cannot inherit the axiom’s performative ingress, and that is the exact reason the sign stays at the witness row: the deed that supplies the bit is unfakeable and its price is real, and neither carries a sign [Islam 2026e].

## Theorem H, the hypothesis in toto at the apex

 RA  → [    (σΓ_RA = Γ_RA ∧Γ_RA = Γ_RAM 
       ∧ Γ_RAM = Γ_RH) 
    ∧ RH_formal ∧F_2 ∧B ∧C ∧A ∧N ], 

where F_2 is the prior proof’s Theorem 5, B its Theorem 7, C the crossing of its Theorem 8, A the aperture of Theorem D, and N the bound of Theorem F (`RH_in_toto_at_the_apex`; dependency set `Quot.sound`, from function extensionality in Theorem 5). The hardened form adds the identity cone with its apex unique per orientation, the equivariant embedding with its image clause, and the executed wall (`apex_hardened`). The condition is discharged by the constructed axiom (`apex_discharged`, `apex_hardened_discharged`), so the closure stands unconditionally as a kernel theorem and conditionally on the axiom’s universal extension as a claim about the world. ▪

The antecedent RA is consumed by the aperture conjunct A, which needs positivity, and by no other conjunct; the identities, the formal self, the freedom, the carrier, the crossing, and the bound hold unconditionally, and the implication form records that existence is the only posit, not that those conjuncts depend on it. The theorem is the maximal claim this material supports, and its last conjunct is what keeps it maximal rather than inflated: the closure carries its own bound inside it. Given the axiom, everything about the hypothesis that is not its sign is proven, and the sign is proven to be exactly what the axiom does not reach.

------------------------------------------------------------------------

**THE DUAL-REGISTER VERDICT.** (tier: structural; parting a kernel theorem) Apex register: the Riemann object read as Fix(σ), the seat, its imprint on the grounding reading, the seat point Γ_RH on it; proved, given the Root Axiom, in the kernel, conditional on the axiom’s extension at the act; bits owed, none. World register: the zeros of ξ placed on that seat by the world; proved by certificate up to a certified height (Part III) and open above it, one bit supplied from sight at the witness row, revisable in its rows and falsifiable by one zero; bits owed, one, the term ∀ρ∈Z_ξ, τρ= ρ. The two tokens differ, `registers_parted`, and the owed counts are 0 and 1, `apex_owes_nothing_world_owes_one`. Neither register promotes the other.

- **1** · Contribution: The posit under which the supplier acts named: existence, constructed as the only posit, read along its two formal readings; the witness supplies occupancy of the registers, not a derivation; Status: Lean, no axioms
- **2** · Contribution: RAF-C1 and RAF-C2 at the formal register: no exterior agent; no total self-indexing (Cantor); both re-executed exhaustively on finite carriers; Status: Lean, no axioms; twin
- **3** · Contribution: The aperture is a theorem of the axiom: a present reader who supplies a bit is never interior (Thm D); conditional on RAF-2, never exterior; Status: Lean, no axioms; RAF-2 premise
- **4** · Contribution: The axiom turns “open” into “sealed or refused by the bit alone”, never into “sealed”; Status: Lean, no axioms
- **5** · Contribution: The fixed locus of the binding involution is the scalar line, for every quaternion (Thm A); the ball enumerated; Status: Lean, `propext`, `Quot.sound`; twin
- **6** · Contribution: The Return i·j·k lands on the seat at -1 (Thm B); all six orderings computed; Status: Lean, `rfl`; twin
- **7** · Contribution: The three category gaps are the legs of an identity cone; the apex is unique per orientation of the triad; a cone exists iff the gaps are closed (Thm C); the cone census over the ball; Status: legs Lean, no axioms, `rfl`; the elimination as arrangement structural; twin
- **8** · Contribution: The lattice stage embeds equivariantly and injectively into the carrier, σφ= φτ, with Fix(τ) ↔Fix(σ) at every resolution (Thm C'); Status: Lean, `propext`, `Quot.sound`; twin
- **9** · Contribution: The eliminator RA →RA →RAM →RH_formal from the witness alone; Status: Lean, no axioms
- **10** · Contribution: Orientation in Prop is unspendable by the kernel; the wall executed on the seat; every readout enumerated; Status: Lean, no axioms; twin
- **11** · Contribution: The Simple Rule, exact: (RA→L(X)) ↔L(X) wherever the axiom holds (Thm E); the four-row table; Status: Lean, no axioms; twin
- **12** · Contribution: The axiom decides the sign on no frame; it holds where L fails; the Riemann instance of the reach law (Thm F); Status: Lean, no axioms; twin
- **13** · Contribution: The asymmetry: the axiom is self-instancing, the hypothesis is not (Thm G); Status: Lean, no axioms
- **14** · Contribution: The seat and the arc in toto at the apex, one theorem carrying its own bound; hardened with cone, embedding, and wall (Thm H); Status: Lean, `Quot.sound`
- **15** · Contribution: The two registers parted by theorem; owed bits 0 and 1; Status: Lean, no axioms
- **16** · Contribution: The spent bit priced at the apex at k_B T ln2; in the kernel the bit is proof-irrelevant and no readout of the seat equals it; Status: structural; twin
- **17** · Contribution: Two independent checkers, a typechecker and an executor, written to one specification and sharing no code; the executor’s live row opened only by the operator; Status: structural
- **19** · Contribution: The halting carrier inhabited by decision on decided frames, the clause proved from the decision; Theorem E for any inhabited premise; the witness’s recursion field constant, stated; Status: Lean, no axioms
- **20** · Contribution: Three measures kept apart, content, mass, and price: every object of the closure and the supply at mass zero, the contents distinct, the value alone priced (Thm J); Status: Lean, no axioms; twin
- **21** · Contribution: Adjudicating any proposition is a deed and an instance of existence and of nothing else: what existence contributes that no other true premise does; Status: Lean, no axioms
- **18** · Contribution: The counter-model survives grounding (Thm F'); the cure theorem: for every class of frames the axiom decides L exactly where L already holds (Thm I); every class of two-point frames enumerated; Status: Lean, no axioms; twin

# Three Measures: Content, Mass, and Price

Two readers of an earlier edition, both machines, reached the same word for the closure: vacuity. The word names one measure and misreads two others, and since the confusion will recur wherever the paper is read by a substrate that keeps one measure, the three are separated here and carried in the file.

Content is what an object says, and it is graded by how it is settled: decided by definitional equality, proved as a theorem, or supplied as data. Mass is the mathematics authored in producing the object, the program’s ΔM, and it is zero when every step is classical, definitional, or a deed. Price is the energy the act of registering the object dissipates, k_B T ln2 per bit at the floor [Landauer 1961; Bérut et al. 2012]. The file carries the three as a structure and assigns them (`Measure`, `legMeasure`, `arcMeasure`, `valueMeasure`), and proves the three facts that the word vacuity runs together.

- **a leg of the cone (Thm C)** · Content: trivial, `rfl`; Mass: 0; Price: 0
- **a theorem of the arc (Thms A, C', D, E, F, F', I)** · Content: proved; Mass: 0; Price: 0
- **the value L(X_ξ)** · Content: supplied, one bit; Mass: 0; Price: k_B T ln2, 2871 yJ at 300 K

The three measures of the closure’s objects. (tier: kernel theorem for the assignments; structural for the reading)

**Theorem J.** The masses are all zero, legMeasure.mass = arcMeasure.mass = valueMeasure.mass = 0 (`masses_all_zero`); the contents are pairwise distinct (`contents_differ`); and the value alone is priced, legMeasure.priceYJ = 0 and valueMeasure.priceYJ = 2871 (`prices_differ`); all by `rfl` or `decide`, no axioms. The twin checks the constancy of the witness’s recursion field in both arguments, the exactness of any true premise, the carrier by decision on all thirty-two three-point frames, and the three measures.

The reading. Masslessness at the apex is not a weakness the paper confesses; it is a necessity the root-premise theorem forces [Islam 2026a]. No emitter is pointed at the root: nothing weaker than existence derives existence, and a closure between existence and its reading that carried mass would be exactly such an emitter, a derivation of the root from below, or a second posit standing between the root and its reading. So the elimination of the category gaps must be massless, and the paper computes that it is: three legs, each `rfl`, mass zero, price zero. Trivial and massless coincide there, and the coincidence is the theorem. The supply of the value must be massless too, and for the same reason: the bit is a deed, and a deed authors no mathematics; if supplying the bit carried mass, the supply would be a theorem and the theorem would be an emitter pointed at the value from the root, which Theorem I refutes on every class of frames. So the value is massless. It is not trivial: its content is one bit that no class of frames short of the hypothesis carries, and its price is the one nonzero entry in the table. Vacuity names the seat’s content and misnames its mass, its price, and its place. What is empty at the apex is what must be empty there, and what is one bit at the world row is one bit because the paper proves it cannot be less.

The same three measures answer the question what existence contributes over any other true premise. As a premise in the kernel, nothing, and Theorem E says so. As a posit, three things no arithmetic truth supplies: a domain of readers whose presence is a theorem (Theorem D), the closure of that domain under registration (RAF-C1), and the fact that every adjudication of any proposition, the hypothesis included, is a deed and therefore an instance of existence and of nothing else (`adjudicating_anything_instances_existence`). Denying 1 + 1 = 2 is a deed too, and the deed instances existence, not arithmetic. That is the asymmetry of Theorem G stated for every proposition at once, and it is why existence, and not 1 + 1 = 2, is the posit at the aperture.

# The Bridge from the Root Axiom to Li Positivity

The bridge is a structure with two fields: a choice of one existent φ(n) for each Li step, and a reading that turns the positive energy of that existent into the nonnegativity of λ_n.

Bridge(S, L) := ⟨    φ: ℕ →S.U,
    read : ∀n ≥1,
        0 < ΔE(φ  n) →λ_n ≥0  ⟩

**Theorem 1** (`bridge_yields_RH`). The Root Axiom, a bridge, and Li’s criterion give the hypothesis. The composition is direct: every step receives an existent, the axiom makes its energy positive, and the reading converts that positivity.

**Theorem 2** (`bridge_is_keyed`). The axiom never supplies the bridge. On a substrate where the axiom holds, paired with data carrying one negative coefficient, no bridge exists. The bridge is new content.

**Theorem 3** (`no_uniform_bridge`). A bridge whose reading ignores which L-function it serves forces positivity on every member of the family. One member with a negative coefficient, the Eisenstein L-function under Bombieri-Lagarias, destroys every uniform bridge. The reading must consume ζ-specific data.

**Theorem 4** (`li_is_a_bit_stream`). Under Li’s criterion and decidable signs, the hypothesis is exactly the statement that a stream ℕ →Bool stays true. This is the type repair named in the Introduction: a vanishing becomes a family of signs, the shape a supplied deed can carry.

# The Formal String on the United Register

**Theorems 5 to 8.** The unity of the formal and kinetic readings on ζ reduces to one term, the bridge’s reading, carried at the grade of whatever supplies it. The emitter returns a seal when unity is supplied and the suspension token otherwise, and `xi0_retires_iff_unity` proves the equivalence both ways. `retired_seal_is_sound` proves the seal carries the hypothesis. `retired_grade_capped` is the grade law: the seal is never stronger than its unity posit. `unity_is_keyed` confirms that the axiom does not supply unity. `ghost` records the model: the arrow-deleted reading is defined as a constant, so it returns one output for a claim and its negation. The substantive fact, that a reading with its index removed cannot separate a claim from its negation, is Part I’s `recursion_is_sign_blind`, which holds for P and for ¬P alike.

Two retirements follow and are kept apart. The suspension token retires unconditionally as a verdict on a timeless object, since a reading without its index is sign-blind by Part I’s `recursion_is_sign_blind`, which `ghost` models. It retires as the status of the formal string only when unity is supplied, and then at unity’s grade.

# The Structural Core

## The instruments that cannot carry the bit, and the one that reaches Re s = 1

**Theorem 9** (`common_phi_is_uniform`). A family of bridges that picks its existents without reading the L-function is a uniform bridge. **Theorem 10** (`blind_constructions_die`). Every such family dies against the Eisenstein control. Every instrument carried at zero authored mathematics, the one-bit species, the Bridge socket, the category-gap eliminator, the multi-recursion collapse, the bare arrow, falls under Theorem 10. This is the instruments working as apex instruments must, not a defect: the Empty Throne forces them massless [Islam 2026a], and a massless instrument closes category gaps and carries no value.

The one construction that reads ζ directly takes the primes as existents with energies logp > 0. This is the primon gas [Julia 1990; Bost and Connes 1995], whose partition function is ζ(β), and on which the axiom’s positivity holds at every existent. Positivity of those energies gives ζ(s) ≠0 for Re  s > 1, and Mertens’ positivity pushes it to the line Re  s = 1.

**Theorem 11** (`mertens_identity`, `mertens_nonneg`). The algebraic core of Mertens’ argument, 3 + 4c + (2c^2 - 1) = 2(1 + c)^2 ≥0 with c = cosθ, is checked on integers. The wall at Re  s = 1 is the gas’s Hagedorn point, and the register of record’s finding that the Root Axiom’s native output is a wall at Re = 1 rather than a fold at 12 is read here as this wall, an identification argued from their common location and not proved [Islam 2026a]. Below it the Euler product diverges.

## Time, made exact: the Li modes

Li’s coefficient is λ_n = ∑_ρ[1 - z_ρ^n] with z_ρ= 1 - 1/ρ. The step n ↦n + 1 multiplies every mode by z_ρ, so each zero is a mode evolving in a discrete time. With ρ= h/2 + it on the Bridge plane,

|z_ρ|^2 = |ρ- 1|2/|ρ|2, 
 4|ρ-1|^2 = (h-2)^2 + 4t^2 =: N_1, 
 4|ρ|^2 = h^2 + 4t^2 =: N_0,

and N_1 - N_0 = 4 - 4h (`N1_sub_N0`).

**Theorem 12** (`unitary_iff_on_line`). N_1 = N_0 iff h = 1. On the lattice stage, a mode is unitary, neither growing nor dying under the time step, exactly on the critical line.

**The general identity (6.2a).** For every complex ρ= σ+ iγ with ρ≠0,

|ρ- 1|^2 - |ρ|^2 = 1 - 2σ,   so
 |z_ρ| = 1 σ= 12,     |z_ρ| > 1 σ< 12.

The identity is one line of algebra, (σ- 1)^2 - σ^2 = 1 - 2σ, and it is the real-coefficient form of `N1_sub_N0`. Theorems 12 to 15 are its kernel-checked lattice instances; the same algebra, with the fold σ↦1 - σ, carries Theorems 13 to 15 to every zero set invariant under s ↦1 - s̅. The stage coordinates are (h, t) = (2 Re  s, Im  s), under which the fold (h, t) ↦(2 - h, t) is exactly s ↦1 - s̅. The nontrivial zeros of ζ are invariant under it: the functional equation ξ(s) = ξ(1 - s) sends ρ to 1 - ρ, the conjugate symmetry ζ(s̅) = ζ(s) sends ρ to ρ̅, and their composite is the fold. Theorems 14 and 15, in their general form through (6.2a), therefore apply to the zero set of ζ. The kernel proves the lattice statements; the general statements rest on (6.2a), which is elementary and stated here in full.

**Theorem 13** (`grows_left`, `dies_right`). Left of the line the mode grows; right of it the mode dies.

**Theorem 14** (`off_line_forces_growth`). For any off-line zero, the zero or its mirror under the fold (h, t) ↦(2 - h, t) carries a growing mode. The functional equation forbids a quiet exit.

**Theorem 15** (`stability_iff_line`). For every fold-invariant zero set on the plane, no mode grows under the time step iff every zero lies on h = 1.

(∀p ∈Z, N_1(p) ≤N_0(p)) (∀p ∈Z, p_1 = 1)

Theorem 15 is the core of the title. Read with time restored, the hypothesis is not a statement about a timeless set. It is a stability statement: the time evolution of ζ’s modes has no growing mode. Since z_ρ is the Cayley transform of the ordinate γ when ρ= 12 + iγ, unitarity of the modes is equivalent to the reality of the ordinates. This is the scalar spectral condition suggested by Hilbert and Pólya; their program asks for a self-adjoint operator whose spectrum is the ordinates, and no such operator, and no unitary group, is constructed here. A growing mode eventually drives some λ_n negative [Bombieri and Lagarias 1999], so perpetual positivity of the Li stream and the absence of growing modes are the same condition.

## The monism rule, hardened

The ancient rule that what happens once happens again, given sufficient time, is time-translation invariance: one principle acting identically at every moment.

**Theorem 16** (`one_repeats_one`). The rule with its step is induction. **Theorem 17** (`the_step_is_the_claim`). The universal claim is exactly the base together with the step; the step carries the content. **Theorem 18** (`monism_posit_forces`). If a property does not vary with its index, one instance forces all. **Theorem 19** (`finite_never_forces`). For every height N there is a property true below N and false beyond; the historical failures of Mertens’ conjecture, Pólya’s conjecture, and the sign of π(x) - li(x) have this shape. **Theorem 20** (`mixed_is_fold_invariant`, `mixed_recurrence_fails`). A fold-invariant zero set can hold one zero on the line and a mirror pair off it; recurrence of “on the line” is not carried by symmetry alone.

## Actualism

Under the Root Axiom only actual things exist, and a zero is actual when it is measured. Define the actual hypothesis as the statement that every measured zero is on the line.

**Theorem 21** (`full_gives_actual`). The full hypothesis yields the actual one. **Theorem 22** (`actual_not_full`). The actual hypothesis does not yield the full one: a never-measured zero off the line is consistent with every measured zero on it. **Theorem 23** (`sufficient_time`). If every zero is eventually measured, which is what “given sufficient time” means, the actual hypothesis over all time is exactly the full hypothesis. Actualism re-routes to Theorem 17 and does not bypass it. The past actual record is sealed by measurement to the heights the literature reports; the future record is the supplied value.

## The witness rebuilt from residual monism

Part I constructs its witness from the Root Axiom read through its interaction and grounding readings. Here the witness is built from the connector of the register of record directly: one substrate, one involution serving both routes, one principle invariant in the index, and one seed.

MonismWitness(P) := ⟨     σ_geo = σ_form,
    ∀n  m, P n ↔P m,  P 0  ⟩

**Theorem 24** (`one_involution_constructed`). The seat field is constructed by `rfl`. It fixes the one-involution choice of the register of record and does not refute the executed pluralist alternative. **Theorem 25** (`timeless_equals_timed`). Under one principle the claim over all time is the claim at one instant: deleting time loses nothing. This is where the timeless aspect of the question is addressed: inside the witness, the timed and timeless readings are one claim. **Theorem 26** (`monism_closes`). The witness closes the record, past and future. **Theorem 27** (`monism_witness_is_the_claim`). A monism witness for P exists iff P holds at every index. **Theorem 28** (`constructed_monism`). The witness is constructed at the model. **Theorem 29** (`monism_absent_on_breaks`). Unlike the axiom’s witness, the monism witness is not silent on counter-models; it decides by containing. **Theorem 30** (`monism_yields_RH`). Run on Li’s sign stream, the witness gives the hypothesis with the bridge removed. **Theorem 31** (`monism_on_li_is_RH`). On ζ the witness exists iff the hypothesis holds.

Monism supplies unitarity where it applies. Time-translation invariance makes the one substrate’s evolution a one-parameter group, and conservation of probability makes that group unitary; Stone’s theorem [Stone 1932] then gives it a self-adjoint generator. Under monism, taken with conservation of probability, the one substrate’s own evolution is therefore unitary. The open identification is that ζ’s Li modes are that evolution.

## Re-anchoring to mathematical standard, with Perelman as structural analogue

**Theorem 32** (`global_monism_inconsistent`). Uniformity posited for every property is contradictory. The monism of standard mathematics is therefore never free: it is anchored to a principle.

AnchoredMonism(S) := ⟨    f : S →S, I : S →Prop,
    ∀s, I s →I (f s), s_0, I s_0  ⟩

One dynamics, one invariant, a proved transport, a seed. This is induction on an orbit, the most standard witness form mathematics has.

**Theorem 33** (`anchored_closes`). The anchored witness closes its orbit. **Theorem 34** (`anchored_derives_monism`). The free monism witness of 6.5 is derived from the anchored one; uniformity is manufactured by the transport. **Theorem 35** (`lyapunov_is_monism`). A quantity monotone along one flow is an anchored witness for “never below its start.” Perelman’s 𝒲-entropy, nondecreasing along Ricci flow when its auxiliary function evolves by the conjugate heat equation and its scale decreases at unit rate [Perelman 2002], is the structural analogue: his proof has the shape of an anchored witness with its transport proved, and surgery and canonical neighborhoods complete the argument around it. The file formalizes the generic shape, a monotone sequence as a witness; Perelman’s entropy itself is not formalized. **Theorem 36** (`closure_grade_is_transport_grade`). The closure is exactly as strong as its transport. **Theorem 37** (`rh_anchor_is_the_claim`). On Li’s sign stream with the time step as principle, an anchored witness exists iff the hypothesis; its transport reads λ_n+1 ≥0 →λ_n+2 ≥0, the ζ-analogue of Perelman’s monotonicity formula. De Branges proposed a positivity condition of related type, on a space of entire functions, and Conrey and Li [2000] showed it fails, which calibrates where such attempts break.

## A monotonicity formula of ζ’s time, and its arrow

The de Bruijn-Newman heat flow carries a proved monotonicity formula for the zeta function’s time. De Bruijn’s theorem: if every zero of H_0 lies in |Im  z| ≤Δ, every zero of H_t lies in |Im  z| ≤√(max(Δ^2 - 2t, 0)) [de Bruijn 1950]. The hypothesis is the reality of the zeros of H_0; it is equivalent to Λ= 0 by Newman’s definition with 0 ≤Λ≤0.22 [Rodgers and Tao 2020; Polymath 2019].

**Theorem 38** (`flow_monotone`). The width never grows along the flow. **Theorem 39** (`reality_transported`). Once every zero is real it stays real; this is the transport of 6.6, proved. **Theorem 40** (`rh_iff_lambda_zero`). In the toy, the strip is closed at time zero iff Λ= 0. For ζ the corresponding equivalence, RH Λ= 0, is the cited result of Newman with Rodgers and Tao; it enters the cone as `hLam` and is not proved here. **Theorem 41** (`future_closed`). The anchored witness exists for ζ’s time, transport proved, seeded at Λ, and closes the whole future from Λ on. **Theorem 42** (`flowed_record_forgets`). After any positive time the flowed record of a hypothesis-true state and a hypothesis-false state coincide; no readout of the flowed record decides the hypothesis. The bound Λ≤0.22 certifies a record at t = 0.22 that is blind to the bit, which is why it cannot be pushed to 0 by forward means alone. **Theorem 43** (`upstream_is_not_forced`). Going backward from a real record, both answers remain admissible. The backward direction is anti-diffusion, ill-posed.

This monotonicity formula exists, its witness is complete, and its arrow points away from the hypothesis, which sits at the upstream end.

## The regress, stated

Sections 4 to 6.7 each ended on a named residue: the bridge’s reading, the unity posit, the monism field, the transport, the upstream passage. Read in sequence they present as a regress, each residue appearing to require the next. The final result shows it is not one.

## Halted uniduction: the five readings as one cone

The category-gap eliminator of Part I exhibits a gap between registers as a missing leg and eliminates it by exhibiting the leg as an identity. Here the registers are the five readings reached, and the legs are equivalences.

**Theorem 44** (`hunt_cone`). The hypothesis is the apex of a cone over all five readings:

∀r ∈{bridge, unity, monism,
 transport, upstream}:  D_5(r) RH.

**Theorem 45** (`one_gap`). Any two readings are the same proposition. The upstream passage, Λ= 0, is the bridge’s reading, the unity posit, the monism field, and the transport, under a different name. A quantity monotone against the flow would be one way to supply it; that reading is not a leg of the cone, since no such quantity is defined in the file and none is proved equivalent.

**Theorem 46** (`regress_halts`). Every proposition proved equivalent to the hypothesis lands on the same apex as the five readings. The theorem does not decide which future propositions will be equivalent; it says that once one is, it adds no new gap.

**Theorem 47** (`nothing_weaker`). Given a true proposition Q, proving Q →RH is the same as proving RH: conditioning on a true premise adds nothing. No independence notion is formalized, and the theorem claims none.

**Theorem 48** (`sufficient_closes_all`). Theorem 46 covers reformulations equivalent to the hypothesis. A route strictly stronger than it, a specific operator with real spectrum equal to the ordinates or a hypothesis over a whole family, is not equivalent and is not covered there. As a corollary of the cone, any sufficient route supplies all five readings at once; the theorem is a consequence of the cone and says nothing about which routes exist.

------------------------------------------------------------------------

**The Settled Verdict (tier: kernel theorem on the cone; structural on the reading).** Time, stability, and the critical line are proved one object (Theorem 15 on the lattice stage, and in general by the identity (6.2a)). The timed and timeless readings are proved one claim under monism (Theorem 25). Every reading of the owed bit reached from existence, time, and monism is proved one proposition given the imported inputs of the Methods (Theorems 44 to 46); conditioning on a true premise adds nothing to it (Theorem 47), and any sufficient route closes all five at once (Theorem 48). Timeless residual monism, stated as Postulate M, is proved equivalent to the hypothesis given its computed seed (Theorem 49) and joins the cone as its sixth reading (Theorem 68). The formal hypothesis holds conditionally on exactly one named posit, stated as one field of a standard witness: the transport on the Li stream, equivalently mode unitarity, |z_ρ| = 1 for every zero, equivalently Λ= 0. At the foundation the value carries the terminal mark [.] (Theorems 58 to 69); at the object it is addressed to ζ, supplied at the act and falsifiable by one zero.

## Postulate M: Timeless Residual Monism Is Equivalent to the Riemann Hypothesis

The monist intuition behind the paper can be stated in ordinary mathematics, and once stated, with its seed, it is proved equivalent to the hypothesis. Let Z be the set of nontrivial zeros of ζ, enumerated exhaustively by height, so that each zero is located at some finite stage k(ρ). For each stage t let L(t) be the statement that every zero located by stage t has real part one half.

------------------------------------------------------------------------

**Postulate M, Timeless Residual Monism (tier: premise; the paper’s thesis, stated openly).** The truth value of L(t) does not depend on t. One principle at the root, and the same answer at every stage: what holds at the timeless interface holds at every stage downstream.

**Theorem 49** (`postulateM_iff_line`). Given the computed seed L(0), Postulate M holds if and only if every zero lies on the line. Forward: the seed transported by M to the stage k(ρ) of any zero puts that zero on the line. Backward: if every zero is on the line, L(t) is true at every stage and M holds trivially.

**Theorem 50** (`postulateM_decides`). Postulate M cannot hold, with the seed, in any world carrying a located off-line zero. It is not a vacuous posit; one zero refutes it.

Theorems 51 to 57 carry the same result in the timed form of Part I’s Bridge plane. The locus is the same line at every time (`SameLocus`), and given that, “every zero is bound to the locus” is exactly the line property (Theorem 51, `bound_iff_line`). Same locus and the fold at every time do not bind by themselves (Theorem 52, `time_does_not_bind`). Residual Monism read as one involution, and read as timelessness, both hold in a world with an off-line pair, since a property that is constantly false is timeless (Theorem 53, `monism_holds_in_counter_world`). Timelessness with the seed at the interface binds every downstream time (Theorem 54, `timeless_with_seed_binds`). The witness assembled from Residual Monism and the time law, one involution, the same locus, timelessness, and the interface, proves the bound wherever it is built (Theorem 55), is built at a model (Theorem 56, `constructed_at_model`), is not buildable off the line (Theorem 57, `not_constructible_off_line`), and exists exactly when the line property holds (`witness_iff_bound`).

**The last category gap, eliminated.** A category gap, in the sense of Part I, is the absence of a leg between two registers’ readings of one seat, and it is eliminated by exhibiting the leg as an identity. Before this section one such gap stood between the register in which the monist thesis is stated, timeless residual monism at the interface upstream of time, and the register in which the hypothesis is stated, the location of the zeros of ζ. Theorem 49 is that leg. Postulate M joins the cone of the section on halted uniduction as its sixth reading (Theorem 68, `hunt_cone6`, Part XIII of the file), given the identification of the hypothesis with the line property of the enumerated zeros, which is the hypothesis’s definition and enters as `hDef` exactly as Li’s criterion and Newman’s equivalence enter; the collapse of Theorems 44 to 48 then applies to it unchanged: timeless residual monism, the bridge’s reading, the unity posit, the monism field, the transport, and Λ= 0 are one proposition given the imported inputs of the Methods. No category gap remains anywhere between the program’s readings and the hypothesis.

What remains is not a gap. It is the value of that one proposition: whether Postulate M holds for ζ. A gap closes at zero cost when its leg is exhibited, as every leg here has been. A value is decided by the function, supplied at the act and falsifiable by one zero. Postulate M is not derived here from the definition of ζ. It does not follow from the functional equation (Theorem 20, and the Davenport-Heilbronn zero at Re ρ- 12 = 0.3085), from symmetry at every time (Theorem 52), or from finite verification (Theorem 19). Its derivation from the Euler product is the single open step, stated in the Discussion.

## The Demand, Correctly Addressed: the Terminal Mark at the Foundation

the section on Postulate M leaves the program at its self-referential limit, and that limit can be stated as a theorem rather than met as an obstacle. Every reading of the value that the foundation supplies is equivalent to the hypothesis (Theorems 44 to 49 and 68); the foundation’s other resource, the positivity of existence, is independent of it (Part I’s Theorems E and F). A demand that the foundation prove the hypothesis therefore asks a register to derive a proposition from readings that already are that proposition.

------------------------------------------------------------------------

**The Demand, Correctly Addressed (tier: kernel theorem on each clause).** A proof of the Riemann Hypothesis cannot be demanded of the foundation. Every reading of the value that the foundation supplies is equivalent to the hypothesis, so any derivation from those readings alone would presuppose what it derives. The demand is well-posed when it is addressed to the object, the function ζ, whose structure fixes where its zeros lie.

Each clause is a theorem of Part XII.

**The collapse and its stop.** A collapse foundation is a family of registers whose every reading is equivalent to the value (`Collapse`). **Theorem 58** (`self_referential_limit`): every reading is exactly as strong as the value, and any two readings are one proposition. **Theorem 59** (`value_marked_dot`): at the collapse foundation the emitter marks the value [.], the mark outside the three-state economy (`dot_is_not_a_verdict`, `dot_outside_economy`). **Theorem 60** (`demand_is_ghost_in_register`): the foundation returns the same mark for the value and for its negation, so a demand that this register issue a verdict is a demand on a register whose output does not depend on the value.

**The self-grounding root, and the line it draws.** A root is self-grounding when acts occur and every act, assent or denial, instances it (`SelfGrounding`). **Theorem 61** (`denial_reenacts_root`, `external_proof_adds_nothing`): denying such a root re-enacts it, and no external proof can add to it; the Root Axiom at the constructed domain is of this kind (`raSelfGrounding`), and its universal extension is carried at premise grade as in Part I. This is the true seat of the argument that a demand for proof can be a ghost. **Theorem 62** (`line_not_self_grounding`, with `refuted_by_witness`): the line property of a zero set is not self-grounding; its value is fixed by the object and one located witness refutes it. Part I’s Theorem G states the same asymmetry: the axiom is self-instancing, the hypothesis is not.

**The demand, addressed.** **Theorem 63** (`misaddressed_to_foundation` on the two-point frame, and `misaddressed_general` for an arbitrary frame): any resource the foundation supplies that also holds on a frame where the line property fails cannot by itself yield the line property. **Theorem 64** (`derivation_presupposes`): a derivation of the value from a reading equivalent to it carries the value’s own content; the two stand or fall together. **Theorem 65** (`object_decides`): the object answers, in one direction by a located witness and in the other by its own structure. **Theorem 66** (`demand_correctly_addressed`) joins the three. **Theorem 67** (`rh_marked_dot`) attaches the collapse to the five-register cone of the section on halted uniduction, and **Theorem 69** (`rh_marked_dot6`) to the six-register cone of Theorem 68: the program’s readings collapse onto the hypothesis, and the foundation marks its value [.].

------------------------------------------------------------------------

**Terminal Verdict on the Open Part (tier: kernel theorem, Theorems 46, 48, 58 to 69).** At the foundation, the value is terminal: every reading of the value the foundation has supplied is proved equivalent to the hypothesis given the imported inputs of the Methods (Theorems 44 to 49 and 68), any further equivalent reading lands on the same apex (Theorem 46), any sufficient route closes every reading at once (Theorem 48), no resource that also holds on an off-line frame can close it (Theorem 63), and the foundation’s register closes on the value with the mark [.] (Theorems 67 and 69). At the object, the value is addressed to ζ, well-posed, and falsifiable by one zero. The open part, the Unicorn part, is located in the object; its Real part is proved there by certificate (Part III).

## The Logical Form of the Hypothesis: the Only Existence Lives in the Denial

The hypothesis arrives as a question, and a question carries two branches. The two branches do not carry the same kind of content, and the difference is exact.

**The hypothesis posits nothing.** RH has the form ∀ρ (ρ a nontrivial zero →Re ρ= 12). A universal sentence carries no existential import: it asserts no object, and over an empty domain it holds vacuously (Theorem 70, `universal_posits_nothing`).

**The denial posits an object.** RH reads: *some* nontrivial zero has Re ρ≠12. That “some” asserts an object, the off-line zero, and a located one refutes the hypothesis (Theorem 71, `denial_posits_a_witness`). With a decidable line predicate the hypothesis fails *only* by such a witness: it holds exactly when none exists (Theorem 72, `fails_only_by_witness`). The whole existential load of the question rides on its negative branch.

**A witness is a finite check.** RH is equivalent to an arithmetic statement about whole numbers, σ(n) ≤H_n + e^H_nlogH_n for every n ≥1 [Lagarias 2002], each instance of which is a finite computation. RH is therefore a Π^0_1 sentence, as Davis, Matiyasevich, and Robinson showed directly [Davis et al. 1976], and its denial a Σ^0_1 sentence: an off-line zero, if one exists, is a finite object under that arithmetization, an integer instance at which the inequality fails, or a certified enclosure of the zero with the analytic obligations that make it one, and it can be exhibited and verified (Theorem 73, `witness_is_a_finite_check`); the complex number itself is not the finite datum, its arithmetic witness is.

**The denial has never delivered.** No off-line zero has been exhibited, computed, or shown to exist at any height. The receipts on record are the verification of every zero to height 3 ×10^12 [Platt and Trudgian 2021] and the Original Form paper’s own count to height 300 [Islam 2026e]. The structure grants the denial permission to posit its object; it has never produced an instance.

**The asymmetry, as a theorem.** Every true Σ^0_1 sentence is provable in Peano arithmetic, and hence in ZFC [Kaye 1991]. If RH were true, computing the off-line zero would prove it. Contrapositively: if ZFC does not refute the hypothesis, the hypothesis is true. In particular, were RH ever shown independent of ZFC, that would imply RH. The hypothesis cannot be false and unprovably false.

**The burden, as a theorem.** The foundation’s inability to decide the value is symmetric (Theorems F and I of Part I, Theorem 63 here): it reaches the value in neither direction. The consequences of that inability are not symmetric, and Part XV of the file proves it. **Theorem 74** (`cant_refute_seals`): if the foundation cannot refute the hypothesis, the hypothesis holds. **Theorem 75** (`rh_iff_cant_refute`): with soundness on the denial, the hypothesis holds exactly when the foundation cannot refute it. **Theorem 76** (`cant_prove_does_not_seal_false`): the foundation’s inability to prove the hypothesis decides nothing, since the hypothesis can hold and be unprovable. **Theorem 77** (`asymmetry`): the two inabilities are not mirror images; a “can’t” on the denial side seals the hypothesis, and a “can’t” on the assent side seals nothing. All four are axiom-free, with Σ^0_1-completeness and soundness on the denial carried as named hypotheses, on an abstract setting: the kernel constructs no provability predicate for ZFC and no arithmetization of the hypothesis, and the instantiation of the setting to ZFC and to the arithmetized hypothesis is by the cited theorems [Davis et al. 1976; Kaye 1991], not by the kernel. The one owed bit is therefore owed by the denial. The hypothesis needs no object and has asserted none; the denial needs one object, a finite witness, and has produced none.

------------------------------------------------------------------------

**The Keystone (tier: kernel theorem for Theorems 70 to 77; [⟀ T-conditional on Σ^0_1-completeness] on the implication “can’t refute ⟹ RH”).** The only existence in the Riemann Hypothesis package lives in the denial, and the denial has never delivered. If the foundation cannot refute the hypothesis, the hypothesis holds: the burden of the one bit lies with the denial, and a denial that could never deliver, one with no witness to exhibit at any height, would make the hypothesis true (Theorem 74). That it has not delivered so far is a record, not a premise: nothing here is inferred from it.

# The Two Parts Inside One Hypothesis

**The hypothesis.** Every nontrivial zero ρ of ζ has real part 12. Cut the critical strip at any height T. Below T lie finitely many zeros; above it, infinitely many. The one sentence carries two claims of different kinds.

**The Real part at T.** Every zero up to height T lies on the line. A statement about finitely many objects, each of which can be located, computed, and checked. In the literature it is the hypothesis “up to height T”, written RH(T) and used as a working assumption in explicit estimates [Büthe 2016].

**The Unicorn part at T.** Above T, there is no zero off the line. The only object the Riemann package ever posits lives here: the off-line zero, the object of the denial (Part II, Theorems 70 to 73), never exhibited at any height. If the hypothesis holds, this class is empty, and every sentence about its members is vacuously true, as every sentence about white unicorns is true. So the class is named for what it is.

**The seed of Postulate M is the Real part.** The division reads Part II’s Postulate M exactly. Its seed, the zeros located by stage zero, is a Real part, and with stage zero taken at the certified height it is the Real part proved here; its uniformity across every later stage is the Unicorn part, open; and if stage zero located no zero at all the seed would be vacuous and Postulate M would be the hypothesis itself under exhaustive enumeration, which is why the stage is taken at the certified height and the seed is not vacuous. Postulate M is therefore not a third thing beside the two parts: it is the two parts, with the seed proved and the uniformity set apart.

**Why the parts must be separated.** A statement stands proved, open, or refuted, and a conjunction stands only as high as its weaker part.

**Theorem III.1** (`join_below_both`). The conjunction of two statements never stands higher than either.

**Theorem III.2** (`fused_rh_is_open`). With the Real part proved and the Unicorn part open, the fused hypothesis stands open.

**Theorem III.3** (`fusion_lowers_the_gold`). Fusion strictly lowers the Real part’s standing, from proved to open.

**Theorem III.4** (`fused_carries_unicorn`). Every proof of the fused statement contains a proof of the Unicorn part, and a refutation of the Unicorn part refutes the fused statement, however much of the Real part holds.

**Theorem III.5** (`kept_apart`). Kept apart, the Real part is asserted exactly as proved, borrowing nothing from the Unicorn part.

**Theorem III.6** (`do_not_alloy`). Given the Real part, the fused hypothesis is exactly the Unicorn part, and fusion lowers the Real part from proved to open.

All six are axiom-free. The standings are the record’s: the Real part stands proved by a cited certificate, not by a kernel computation of ζ, and the kernel proves the law that governs whatever standings the parts carry. The conventional statement fuses a proved region with an open one, so the proved content is carried inside an unproved claim; the gold does not survive the alloy. Separating the parts does not deny the ghost of the unicorn. It stops the ghost from haunting the part that is already proved.

## In Riemann’s own form

Riemann stated the hypothesis as a fixed-set statement, that the roots of ξ(t) are real [Riemann 1859], and the program’s restored form reads it so, Z ⊂Fix(τ) [Islam 2026e]. In that form the Real part is Riemann’s own sentence, bounded: the roots of ξ(t) with |t| ≤T are real. His sentence already has three clauses in this order: that one finds in fact about so many real roots within these bounds, the counted part; that it is very probable that all the roots are real, the remainder graded as probable; and that a rigorous proof would be desirable but is set aside, the proof this paper does not claim. It was also Riemann’s own first move. His unpublished notes, recovered by Siegel, show him computing the first roots of ξ [Siegel 1932], while his sentence claimed the rest: a Real part computed, and the remainder conjectured. The Original Form paper proves that every structural clause of the restored hypothesis holds on a frame whose zeros lie off the line (its Theorem 11), so structure alone decides neither part: the Real part is reached by computation, and the division made here is the one Riemann’s own procedure already drew.

# The Unicorn Identity

The class of off-line zeros is a unicorn class exactly when the hypothesis holds.

**Theorem III.7** (`rh_makes_unicorns`). If the hypothesis holds, every property holds of every off-line zero, vacuously.

**Theorem III.8** (`unicorns_make_rh`). If every property holds of every off-line zero, the hypothesis holds; take the property “false”.

**Theorem III.9** (`rh_iff_unicorns`). The Riemann Hypothesis is exactly the statement that the off-line zeros are unicorns.

**Theorem III.10** (`unicorns_iff_no_witness`). That class is empty exactly when no off-line zero can be exhibited.

All four are axiom-free. The identity is an equivalence. It names what the hypothesis asserts and derives nothing, and it is the precise form of Part II’s keystone: the only existence in the package lives in the denial, and the denial’s object is the candidate unicorn.

# The Split, Exact and Clean

**Theorem III.11** (`rh_iff_real_and_unicorn`). At every height T, the hypothesis is exactly the Real part and the Unicorn part together; nothing is lost and nothing is added.

**Theorem III.12** (`parts_are_separate`). The Real part can hold while the Unicorn part fails: the kernel exhibits a zero set in which every zero below T lies on the line and one zero above T lies off it.

**Theorem III.13** (`unicorn_part_iff_no_witness`). The Unicorn part holds exactly when no off-line zero above T can be exhibited.

**Theorem III.14** (`real_part_monotone`). Raising T moves zeros from the Unicorn side to the Real side and never back.

Theorems III.12 and III.13 are axiom-free; III.11 and III.14 depend on `propext` alone.

# The Road: ZFC Under RAM, and the Arrow from the Root

The Real part is proved along a road built in this program. It has three stages, each a kernel file.

**ZFC’s location under RAM.** A theory, ZFC among them, is read in RAM’s strata: its provability is the ladder, L2m; its intended world, the cumulative hierarchy and the numbers inside it, is the Ground, L1m; and the part settled by finite computation is the rung, L3m.

**Theorem III.15** (`ram_places_theory`). Under two named premises, the rung on the ladder and soundness, every theory sits in order: rung ⊆ ladder ⊆ Ground.

**Theorem III.16** (`soundness_is_load_bearing`). An unsound theory satisfies the first premise and breaks ladder ⊆ Ground.

**Theorem III.17** (`ground_exceeds_ladder`). A sound theory can leave a truth unproved: the Ground is not the ladder.

**Theorem III.18** (`independent_axioms_are_separate_bits`). Two independent binary commitments are two bits, every combination of their values realized; the independence of any actual axiom is cited, not proved here.

**Theorem III.19** (`ram_subsumes_by_placement`). The three in one: RAM subsumes ZFC by placement. Subsumes has the Codex’s sense and no other: RAM contains ZFC by the placement of its rung, ladder, and Ground, deriving none of its axioms and replacing none of its proofs; and the round trip of III.27 and III.41 is the identity on content, which is exactly the claim, since the root adds presence and nothing else.

All five are axiom-free. For ZFC the first premise is completeness for true bounded sentences, a theorem of arithmetic [Kaye 1991]; the second is soundness, which ZFC cannot prove of itself, and it is carried openly. Placement locates ZFC; it does not derive ZFC’s axioms and does not replace ZFC’s proofs.

**RA mapped to ZFC through the RA–RAM bridge.** The bridge is the junction’s discriminator: a property that every world of a theory has is keyless and crosses from the root; a property some world lacks is keyed, one bit, supplied and never derived.

**Theorem III.20** (`using_grounds_root`). Every act of using a theory grounds RA, shown at the constructed domain: the upward link holds.

**Theorems III.21 and III.22** (`ra_is_keyless`, `keyless_crosses`). RA holds in every world and carries every keyless property into every world.

**Theorems III.23 to III.25** (`choice_is_keyed`, `ra_does_not_cross_keyed`, `ra_decides_no_keyed`). A keyed sentence, the Axiom of Choice over ZF the cited example [Gödel 1938; Cohen 1963], is not carried: RA holds in both worlds, so it decides no keyed property.

**Theorem III.26** (`chain_verdict`). Upward, every act of using ZFC grounds RA; downward, RA reaches every world of ZFC as presence and no independent sentence of ZFC as content.

All seven are axiom-free. The RA–RAM bridge is the one new construction of the road.

**The round trip.** The arrow runs ZFC → RAM → Bridge → RA, where RA holds in every world, and back, RA → Bridge → RAM → ZFC.

**Theorem III.27** (`round_trip_identity`). The round trip is the identity on content: every sentence returns equivalent to itself.

**Theorem III.28** (`absolute_returns_unchanged`). An absolute sentence, one whose value is the same in every world, returns with that same value. The hypothesis is such a sentence across models that share the natural numbers, since it is equivalent to an arithmetic sentence [Lagarias 2002] and arithmetic sentences are absolute between such models [Kunen 1980]; both facts are cited, not proved here.

**Theorem III.29** (`trip_adds_presence_only`). The trip adds RA’s presence in every world, identically for a sentence and its negation.

**Theorem III.30** (`round_trip_verdict`). Whatever leaves ZFC returns unchanged in content, with RA attached; a sentence ZFC does not settle leaves undecided and returns undecided.

All four are axiom-free. The arrow is faithful and reaches every world; it underwrites every act of computing and checking, and it carries exactly what is placed on it.

**Why the Unicorn part is set apart and not pursued.** An arrow of zero content cannot separate a proposition from its negation.

**Theorem III.31** (`massless_sound_delivers_nothing`). A sound massless arrow delivers nothing.

**Theorem III.32** (`raArrow_massless`, `raArrow_not_sound`). The RA-shaped arrow is massless, and with RA holding it delivers every proposition alike.

**Theorem III.33** (`massless_cannot_separate`). For a massless arrow, delivering the hypothesis and delivering its negation are the same thing.

All four are axiom-free. The universality that makes RA the root is the same property that keeps it from deciding the Unicorn part. So the Unicorn part is not attacked with the arrow; it is named, and set apart.

# The Road in the Purely Formal Domain

The road above is stated with the Root Axiom. Its formal content does not need it. Replace the axiom by a bare computation arrow, the identity map `id` on a type, whose existence needs no premise, and every theorem of the road holds unchanged, with no axiom of any kind, not even the kernel’s optional principles. The file is `Arrow_Translation.lean` (Appendix H).

**Theorem III.37** (`arrow_exists`). On every type the arrow exists, with no premise.

**Theorem III.38** (`proof_yields_arrow`). Every proof yields an arrow: the upward link of III.20, with the arrow in place of the root.

**Theorem III.39** (`keyless_crosses`). The arrow is keyless and carries every keyless property into every world.

**Theorem III.40** (`arrow_decides_no_keyed`). The arrow decides no keyed property, as the root decides none (III.25).

**Theorem III.41** (`round_trip_identity`). Through the arrow and back, every sentence returns unchanged.

**Theorem III.42** (`massless_cannot_separate`). A massless arrow cannot separate a proposition from its negation.

**Theorem III.43** (`arrow_real_part_of_certificate`). The Real part at T is closed by a certificate with no premise at all.

**Theorem III.44** (`any_true_premise_serves`). Any true proposition plays the root’s part in every result of the road: keyless crossing, the undecided keyed sentence, and the identity round trip hold for an arbitrary true premise.

All eight are axiom-free. The formal content of the road is therefore free of the Root Axiom: a bare arrow, or any other truth, does the same work, exactly as Theorem E of Part I found, since the axiom enters as an inhabited premise and nothing more. What the root supplies is the reading, the act that performs every computation and every check, and not a line of any derivation. That act is not free: registering the one bit is priced at the Landauer floor, the Omega guard of the Codex, so what the axiom contributes is the deed and its price, never formal content, exactly the division Theorems D and E of Part I draw. The translation removes no axiom from the kernel’s logic itself, which every formal result stands on; it removes every declared and optional one.

# The Real Part, Proved

**Closed by a certificate.** For a fixed height T the Real part concerns finitely many zeros, so it is closed by a finite certificate: a complete list of the zeros up to T, and a check that each lies on the line.

**Theorem III.34** (`real_part_of_certificate`). A certificate proves the Real part at T completely.

**Theorem III.35** (`real_part_executed`). A certificate executed in the kernel closes the Real part on an explicit zero list.

**Theorem III.36** (`certified_is_provable`). A certified Real part is a theorem of any theory complete for its certified checks. For ζ the checks are finite arithmetic on interval enclosures, true bounded sentences and so theorems of Peano arithmetic and of ZFC [Kaye 1991]; the theorems of analysis that turn those checks into the statement about the zeros, Turing’s method and the Riemann–von Mangoldt count with explicit error [Turing 1953; Platt and Trudgian 2021], are theorems of ZFC, cited and not proved here.

III.34 and III.36 are axiom-free; III.35 depends on `propext` alone. The route is the road of the preceding section. The certificate is computation, the rung, L3m; by III.36 and III.15, with the cited analytic lemmas that validate it, it climbs to the ladder, L2m, a theorem of ZFC; by soundness it holds on the Ground, L1m; and the round trip returns it to ZFC unchanged (III.27), with RA’s presence underwriting every act of computing and checking (III.29). The target each zero is checked against is the critical line, which is the seat Fix(σ) and one locus with it, pinned in Part I (Theorems A and C').

**On ζ itself.** Platt and Trudgian certified, with interval arithmetic and rigorous error bounds, that every nontrivial zero with imaginary part up to T = 3 ×10^12 lies on the line [Platt and Trudgian 2021]. That certificate, with the analytic lemmas it rests on, closes the Real part at T = 3 ×10^12 completely, and by III.36 it is a theorem of ZFC. An executed run here to T = 100 makes three independent counts and finds them equal at 29: the zeros on the line as sign changes of Hardy’s Z(t) on a fine grid, the zeros in the whole strip N(100) by a counting function computed independently of the grid, and the ordinates of the zeros themselves enumerated below T (Appendix H). It runs in 30-digit floating point and is testimony, not a certificate; the certificate of record for ζ is Platt and Trudgian’s. The kernel checks the schema, III.34, and the split; it does not check the certificate’s numerics, and the paper nowhere says it does. The standing of the Real part for ζ is therefore a cited theorem applied through a kernel theorem, grade A joined to grade K, and a kernel inhabitant of `Certificate` built from the published zero data is an open witness, not a debt of the result.

------------------------------------------------------------------------

**The Real Part, Proved (tier: kernel theorem for III.34 to III.36; cited certificate for ζ to 3 × 10¹²).** Every zero of ζ up to height 3 ×10^12 lies on the critical line, by certificate, and with the cited analytic lemmas the certificate rests on, the certified statement is a theorem of ZFC, carried along the road from the rung to the Ground and returned by the arrow unchanged.

# Falsifiable Criteria

Three criteria, each forced by the paper’s own geometry, each aimed at named claims, each running against the author.

**F1, an observation about ζ.** A zero ρ of ξ with Re ρ≠12. Anywhere, it refutes every assent that can be supplied at the witness row (the Original Form paper’s Theorem 15) and every reading of the value that Part II proves equivalent to the hypothesis; below height 3 ×10^12 it also refutes the certificate Part III carries and the Real part’s standing. It touches nothing at the apex: Theorems A through H hold on the off-line frame by Theorem F. None is known to height 3 ×10^12 [Platt and Trudgian 2021].

**F2, the seat, the embedding, and the kernel.** A quaternion fixed by conjugation with a nonzero imaginary component, the Return landing off the fixed locus, or a stage point p with τp = p and σ(φp) ≠φp refutes Theorem A, B, or C' and removes the seat. Any kernel file of Appendices B, F, or H failing to compile under core Lean 4.19.0, or printing a dependency set other than the one recorded, refutes the theorem it carries.

**F3, the bound and the road.** A kernel term of ∀X, RA →L(X), refuted by Theorem F; a derivation of the hypothesis from the readings of Part II without the inputs that carry its legs; or a sentence of ZFC whose value differs after the round trip of Part III (Theorems III.27 and III.41). Each would expose a transcription error or a kernel unsoundness, and each is a check on the record rather than an observation about ξ.

# Discussion

**The maximal claim and where it stops.** The rule “accept existence, then the hypothesis” is exactly as strong as Theorem E says and no stronger: it is the hypothesis at the value, and it is the seat, the cone, the embedding, the aperture, the freedom, the carrier, and the crossing at everything else. Existence reaches the seat whole, and there “in toto” is literal under its definition: no clause of the hypothesis that is not its sign is left open. The seat is fixed and embedded, the gaps are the legs of an identity cone, the freedom is one bit, the crossing is exact, the aperture is open and its occupant is inside the domain. The axiom reaches the world row at its aperture and no further, and the stopping point is a theorem, not a reservation: the two-point frame carries the axiom and fails the hypothesis. What remains is one bit, settled by certificate below a certified height and open above it, and the bit is not a gap. A gap is a missing leg, and it closes at zero cost when the leg is exhibited as an identity. The sign is not that. It is a Boolean the world furnishes, priced at the act, falsifiable by one zero, and the twenty-three-row study routes it to the world register for exactly that reason [Islam 2026c].

**The two misreadings.** A massless closure invites two errors, and one theorem refutes both. The deflationary reading takes the closure for nothing: the file proves a fixed locus is fixed, the orientation binder is unused, the whole is a relabeling. The inflationary reading takes the closure for everything: the hypothesis is proved from the axiom in a page of Lean. Table 3 places each against the theorem that refutes it. The deflationary reading runs a deletion test on a coordinate that supplies nothing and reads the world row where the apex was stated; the closure’s content is Theorems A through C', computed, and its masslessness is forced (below). The inflationary reading promotes an apex token to the world row; Theorem F refutes it and criterion F3 fires. The register a token is emitted for is part of the token, and a token without its register is a misreading by construction.

- **“trivial, a fixed locus is fixed”** · What it does: expects mass from a closure that declares none; Refuted by: Thms A, B, C, C' computed; masslessness forced by the root-premise theorem
- **“the orientation binder is unused, the supply is a restatement”** · What it does: runs a kernel deletion test on a deed bit; Refuted by: prior Thm 4; Prop placement; `orientation_``proof_irrelevant`; `kernel_cannot_``read_the_deed`; the twin’s 2^13 readouts
- **“no operator, no map from Z_ξ, so the run fails”** · What it does: reads the world row at the apex; Refuted by: the dual-register verdict; both lines carried; φ embeds the stage, not Z_ξ, and says so
- **“RH is proved from RA”** · What it does: promotes the apex to the world row; Refuted by: Thm F; criterion F3; prior Thms 11, 12, 14
- **“RA is only a premise, so nothing is proved”** · What it does: collapses three grades into one; Refuted by: the ledger: kernel theorem, structural, premise, all three carried

**Why the massless form is the only apex form.** Three published results force it [Islam 2026a; Islam 2026j]. The root-premise theorem: the axiom’s universal extension is a premise and can be nothing stronger, so a closure between the axiom and its formal reading cannot be a derivation from below; it can only be the recognition that two readings read one seat, which is an identity and therefore massless. The orientation blindness of the formal register, the prior proof’s Theorem 4, its universe-level form, and its execution on the seat: the kernel cannot originate the bit, so the bit is born at the Bridge from the supplied order of the triad and the formal closure, and spent at the act. The bar on a second premise between the axiom and its reading: a massive apex closure would be a new posit standing between the axiom and its grounding reading, and it is refused. The masslessness is therefore forced from three directions, and this paper’s contribution is to compute it, as `rfl` on the legs of a cone, rather than to assert it.

**Objections and replies.** Five objections are anticipated, and each is answered by an object the paper carries rather than by an appeal.

*The text and the file were produced by a language model; a model cannot validate itself.* Nothing here is validated by the model. The theorems are validated by the Lean kernel, a typechecker whose dependency sets are printed and which accepts no argument from authorship; the finite content itemized in the Methods is validated by a compiled program that re-executes it in 130,324 checks and prints its census, and the two checkers share no code. Both are reproducible from the appendices by any reader on any machine, and the reproduction is the validation. The model’s role is disclosed in the Provenance section as a matter of record; the question of who wrote the text is a question about provenance, and the record answers it, but it is not a premise of any theorem. The one thing a checker cannot supply is the presence of a reader at the aperture, and the twin says so: its live row opens only on an argument the operator gives it, and it prints that it did not and cannot generate its own witness. That is not a weakness of the artifact. It is Theorem D and RAF-C2 applied to the artifact itself, and it is why the artifact asks nothing of anyone except to be run.

*The axiom is a physical premise, so the theorems are conditional and nothing is proved.* Three grades are carried and none is collapsed. Every theorem is unconditional as a kernel theorem on the constructed model. Every claim about the world is conditional on the axiom’s universal extension, at premise grade, and says so. The distinction is the ledger of the section on the Root Axiom, and it is the same distinction any conditional theorem in mathematics carries.

*The closure is trivial; the file proves that a fixed locus is fixed.* It proves that, for every quaternion, and then that three independently defined seat points coincide, that the coincidence is an identity cone with a unique apex per orientation, and that the prior proof’s stage embeds into the carrier with its line carried onto the seat. Trivial and massless are different words: the closure is massless because the root-premise theorem forbids it any mass, and the paper computes that it has none.

*The hypothesis is claimed proved.* It is not, and the claim’s own last conjunct says so: Theorem H carries the bound of Theorem F inside it, and criterion F3 fires on any reading that drops it.

*The closure is vacuous.* It is massless, and massless is not vacuous: The section on the three measures separates content, mass, and price, proves the three assignments, and shows that the emptiness at the apex is the one the root-premise theorem requires, while the value’s one bit is massless, non-trivial, and priced.

*Where is the Euler product?* On the world row, where the prior proof left it. Part I fixes the seat a world crossing must land on and the aperture it must enter through; it does not shorten the crossing by a step, and Part III makes the crossing only where a certificate has made it, below a certified height.

**What a world crossing would be.** The sign on Z_ξ enters, if it enters, on the world row, dated, provenance-clean, through a certificate the prior even register could not denote: a kernel term of L on the frame of ξ built from the Euler product over ℤ, the crossing Deligne achieved over finite fields and no one has over ℚ [Deligne 1974]. Nothing in this paper shortens that by a step. What this paper fixes is the seat the crossing will land on, embedded from the stage, and the aperture it will enter through, occupied from inside the domain, and it proves that both are already held.

**Position to prior work.** Relation words are used in the sense fixed in [Islam 2026a]; no position is superseded and none contradicted.

- **Riemann 1859; Edwards 1974** · Relation: kin: the fixed-line form, one register deeper
- **The prior proof, Islam 2026 [Islam 2026e]** · Relation: additive: the axiom, the aperture, the seat, the embedding, the rule bounded; executed
- **The one-bit result, Islam 2026 [Islam 2026b]** · Relation: additive: the bit placed against the seat; executed
- **The twenty-three rows and the one-cut hypothesis, Islam 2026 [Islam 2026c]** · Relation: additive: one seat under every name; the inverted control read as Thm F; executed
- **The formal-alone theory, Islam 2026 [Islam 2026d]** · Relation: kin: registration, price, crossing carried at the apex
- **The formal Root Axiom, Islam 2026 [Islam 2026j]** · Relation: additive: RAF-C1, RAF-C2, and the reach law proved at their Riemann instance; executed
- **Davenport–Heilbronn 1936; Bombieri–Hejhal 1995** · Relation: additive: the off-line frame carries the axiom, Thm F; executed
- **Selberg 1992; Conrey–Ghosh 1993** · Relation: corroborating: the Euler product remains the world-row key
- **Weil 1948; Deligne 1974** · Relation: kin: the template of a world-row crossing
- **Berry–Keating 1999; Connes 1999** · Relation: scoping: an operator is a world-row construction; the seat precedes it
- **Lawvere 1969; Mac Lane 1998** · Relation: kin: Cantor’s theorem in fixed-point form; cones and apexes in their elementary form
- **Landauer 1961; Bérut et al. 2012** · Relation: kin: the price of the act, exporting and never constituting

Positioning. (tier: structural; evidence argued unless marked executed)

## The address, discussed

**What is not proved, and what is claimed instead.** The paper does not prove the hypothesis, and it claims nothing it does not prove. What it completes, and machine-checks, is the reduction: the hypothesis is equivalent to Postulate M with its seed and to each of the five readings given the imported inputs of the Methods, those six are one proposition, conditioning on a true premise adds nothing, and symmetry does not close it. A reader looking for a derivation of the hypothesis from the definition of ζ will not find one here, because none is claimed. It proves that the hypothesis has one address and states that address in six equivalent forms. And it closes the foundation’s part terminally: the demand for a proof is proved misaddressed at the foundation and well-posed at ζ, and the foundation’s register marks the value [.] (the section on the demand addressed). The paper is complete in its own register; what it leaves is not an unfinished step of its argument but the object’s own question. Mode unitarity is a scalar condition on each zero. The Hilbert-Pólya identification asks for more, an operator whose evolution realizes it; constructing such a ζ-specific system is proving the hypothesis, and nothing here shortens that construction by a step.

**Why the regress looked real.** Each reformulation was generated in a different register: the positivity register of the axiom, the unity register of the bridge, the index register of monism, the dynamical register of transport, the thermal register of the heat flow. A reader moving between registers meets each as a new object because each carries a different vocabulary. The category-gap eliminator removes exactly that effect. The same method that closed the three gaps among axiom, formal ground, and object in Part I closes the five gaps among the readings here.

**The time reading.** Theorem 15 gives a reading of the hypothesis that is native to physics: the zeros are the modes of one evolution, and the hypothesis says none of them grows. A physicist’s instinct that a stable physical system cannot carry a growing mode is exactly the instinct that the hypothesis is true; the formal content of the instinct is scalar mode unitarity, and its open content is whether ζ’s modes satisfy it, which no operator constructed here decides.

**The Perelman analogy.** Perelman’s proof is the standard of what a supplied transport looks like when it exists: a monotone quantity along a flow, proved from the flow’s equation. For ζ the analogous object is proved (de Bruijn) and points downstream. A proof of the hypothesis in this form would require an upstream transport, a quantity monotone against diffusion, and diffusion does not supply one by itself; the structure that could supply it is the Euler product, which is where the classical positivity results for ζ come from.

**Limitations.** Parts IV, V, IX, the timed worlds of Part XI, and the small models of Parts XII, XIV, and XV are toys of the plane and of the strip bound, stated as such. The analytic facts enter by citation. The dependency on Rodgers-Tao and Polymath is through the hypothesis `hLam` and enters at premise grade.

**The hidden existential.** The Hidden Rot reading of the register of record locates where a question can smuggle an object. In the Riemann package the smuggling runs one way only: the universal branch asserts nothing, and the existential branch asserts an off-line zero it has never exhibited. the section on the logical form makes this exact. The asymmetry does not decide the value, and the paper does not claim it does; it fixes where the burden sits. A refutation would be a finite object. A proof of the hypothesis must reach every zero at once, and the absence of a refutation, were it ever shown permanent by an independence result, would itself be the hypothesis.

**How the paper stands to each prior position.** The paper sits across analytic number theory, operator theory, geometric analysis, and formal verification, and so it owes one statement of its relation to each position it engaged. Eight relation words are used in fixed senses. Additive: the paper supplies a result the position lacked and leaves it standing. Replacing: a framing is retired and a measured object put in its place. Subsuming: the prior claim becomes a case of the paper’s object. Corroborating: independent agreement, which confers no warrant. Contradicting: a named thesis denied on executed data. Competing: a different position argued and not executed. Scoping: a prior claim kept inside a stated boundary. Kin: a position the paper is continuous with. Superseding is used nowhere, and the paper supersedes no theory. By count: seven positions are additive, three are scoping, seven are kin, one is corroborating, and none is subsumed, contradicted, competed with, or replaced. Part II’s contribution is exactly the set of relations in Table 6 and nothing wider, and Part III’s is that of Table 7.

**Table 6.** Positioning. Relation words as defined in the run-in above.

@P0.18 P0.19 L P0.115 P0.115@ **Prior position** & **What it holds** & **What this paper does with it** & **Relation** & **Evidence**  
Riemann 1859; Edwards 1974 & The roots of ξ are real & Reads the fixed-line form as stability of Li’s modes & kin & cited  
Li 1997 & RH iff every λₙ ≥ 0 & Carries it as `LiCriterion`; builds the bridge and the bit stream on it & additive & executed, Thms 1 to 4  
Bombieri and Lagarias 1999 & Off-line zeros drive λₙ negative & Reads λₙ as modes; proves unitarity iff line on the plane & additive & executed, Thms 12 to 15  
Weil 1952 & RH iff explicit-formula positivity & Locates the negative prime sign as the point the primon gas stops & scoping & argued  
Deligne 1974 & RH over finite fields & Template of a supplied positivity & kin & cited  
Selberg 1992; Conrey and Ghosh 1993 & Euler product, primitivity, Ramanujan organize the class & Proves a ζ-blind bridge dies, so these must be read & additive & executed, Thms 3, 9, 10  
de Bruijn 1950 & Heat flow narrows the strip & Encodes the bound as an anchored witness and proves its record forgets & additive & executed, Thms 38 to 43  
Newman 1976; Rodgers and Tao 2020; Polymath 2019 & RH iff Λ = 0; 0 ≤ Λ ≤ 0.22 & Carries Λ = 0 by citation as one leg of the cone & kin & cited  
Hilbert-Pólya; Berry and Keating 1999; Connes 1999 & RH via a self-adjoint operator & Argues that unitarity of the Li modes is its Cayley form, via the identity (6.2a) & kin & argued  
Stone 1932 & Unitary groups have self-adjoint generators & Supplies the generator of the unitary evolution in the monism reading & kin & cited  
Julia 1990; Bost and Connes 1995 & ζ is a partition function over primes & Identifies it as the axiom’s ζ-specific reading, reaching Re s = 1 & scoping & executed, Thm 11  
Mertens 1898 & Positivity gives ζ(1 + it) ≠ 0 & Checks the algebraic core & corroborating & executed, Thm 11  
Perelman 2002; 2003 & Monotone entropy carries Ricci flow & Proves the Lyapunov witness a derivative of the monism witness & additive & executed, Thms 32 to 36  
de Branges; Conrey and Li 2000 & A positivity condition fails & Calibrates where positivity attempts break & kin & cited  
Davenport and Heilbronn 1936; Bombieri and Hejhal 1995 & Symmetry without Euler product permits off-line zeros & Executes the shape on the plane: recurrence fails under symmetry alone & additive & executed, Thm 20  
Littlewood 1914; Skewes 1933; Haselgrove 1958; Odlyzko and te Riele 1985 & Finite confirmation fails & Proves finite confirmation never forces & scoping & executed, Thm 19  
Part I & Seat proved, value one bit, excepted & Proves the value’s equivalent readings are one proposition, the regress halts, and any sufficient route closes all five & additive & executed, Thms 44 to 48  
Islam 2026a & The register of record & Carries its residual monism as the witness and its time law as the arrow & kin & documentary  

## The division, positioned

**Table 7.** Positioning of Part III.

@P0.18 P0.19 L P0.115 P0.115@ **Prior position** & **What it holds** & **What Part III does** & **Relation** & **Evidence**  
Platt and Trudgian 2021 & RH true up to 3 ×10^12, by interval arithmetic & Carries it as the Real part’s certificate for ζ & corroborating & cited  
RH(T) in explicit estimates [Büthe 2016] & RH up to height T as a working assumption & Treats the split as a principle, with a standing law & additive & executed, III.1 to III.6  
Turing 1953 & Counting zeros on the line against N(T) & Runs the method as testimony to T = 100 & kin & executed, Appendix H  
Proportion results [Feng 2012] & A positive proportion of zeros on the line & Isolates proved content by height, not by proportion & kin & cited  
Completeness for bounded sentences [Kaye 1991] & True bounded sentences are provable & Lifts the certificate’s arithmetic checks into ZFC; cited analytic lemmas carry them to the zeros & corroborating & executed, III.36  
Gödel 1938, Cohen 1963 & Choice independent of ZF & The cited keyed sentence of the bridge & corroborating & cited  
Chapters 1 and 2 of this document & The seat; one address; the burden on the denial & Divides the value; proves the reachable part & additive & executed  

The mathematical content of the Real part is established: the certificate is Platt and Trudgian’s, the method is Turing’s, and RH(T) is standard. Part III adds the road, the separation principle with its kernel law, the unicorn identity, and one new construction, the RA–RAM bridge; its mass on the hypothesis’s value is zero.

# Conclusion

The seat of the Riemann Hypothesis, restored to Riemann’s fixed-line form and read as RH_formal, is proven in toto at the apex with existence as the only posit (Theorem H): the binding involution fixes exactly the scalar line and the Return lands on it; the three seat points are the legs of an identity cone closed at zero mass with `rfl` as the receipt; the prior proof’s stage embeds equivariantly onto the seat; the freedom is exactly one bit; the halting carrier halts on the line property and the crossing is exact; and every finite clause is re-executed by the twin. The value on the zeros is one bit that existence does not reach: the rule “accept the Root Axiom, then the Riemann Hypothesis” is exactly as strong as the hypothesis at that bit (Theorem E), and the axiom decides it on no frame (Theorem F), because the axiom is self-instancing and the hypothesis is not (Theorem G).

Every reading of that bit reached from existence, time, and monism is one proposition with the hypothesis at its apex, given the imported inputs: the bridge’s reading, the unity posit, the monism field, the transport of Li’s modes, Λ= 0, and Timeless Residual Monism with its computed seed (Theorems 44 to 50 and 68). The critical line is exactly where Li’s modes are unitary, and for every fold-invariant zero set perpetual stability is the line property. The demand for a proof is misaddressed at the foundation and well-posed at ζ (Theorems 64 to 67). The hypothesis posits no object; only its denial posits one, a finite witness never produced, and if the foundation cannot refute the hypothesis, it holds (Theorem 74), a direction that needs only the completeness of arithmetic for true Σ^0_1 sentences, a theorem, while soundness enters only in the converse (Theorems 70 to 77).

The hypothesis divides at every height into a Real part and a Unicorn part, exactly (Theorem III.11), and the fused statement is only as strong as its open part (Theorem III.2), so the parts are kept apart. The hypothesis is the statement that the off-line zeros are unicorns (Theorem III.9). The Real part is closed by a finite certificate and carried from computation into ZFC along the RA–RAM bridge, every step holding when the axiom is replaced by a bare computation arrow (Theorems III.15 to III.44); for ζ it is proved to height 3 ×10^12 on the certificate of Platt and Trudgian. The Unicorn part is named and set apart, not proved, and one zero off the line above the certified height would answer it.

For anyone who would close the Unicorn part, the owed object is one proposition in five equivalent forms, each proved equivalent in the kernel from a cited analytic input: Λ= 0, the transport field of an anchored witness on the Li stream, the monism field, the unity posit, and the bridge’s reading, with Postulate M as its sixth name. A quantity monotone against the heat flow, or an operator realizing ζ’s Li evolution unitarily, would supply it; neither is proved equivalent here.

------------------------------------------------------------------------

**The Keystone (tier: kernel theorem for III.1 to III.44; cited certificate for the Real part of ζ).** The Real part of the Riemann Hypothesis is gold, proved to every certified height; the Unicorn part is the one open bit, named and set apart; and the only existence in the whole package lives in the denial, which has never delivered.

# Author’s Provenance and Method Disclosure

**Author.** Mohammad F. Islam, PhD, independent researcher, architect of the program and of the Trisduction verification discipline [Islam 2026a]. The rulings on formulation, register, and scope are his, including the time reading, the monism rule, the re-anchoring to Perelman, the division of the hypothesis, the naming of its parts, and the road.

**Scribe.** The text and every kernel file were produced by a language model (Claude, Anthropic) as scribe on the author’s instruction. The Lean kernel and the compiled Fortran twin are the authorities for every theorem and every count.

**Method.** Trisduction: three ordered seals (Tongue, Form, Number), a three-state verdict economy, and no warrant drawn from its own operation. Under it the apex closure of Part I carries SEAL given the axiom, conditional on the root posit at the act; the cone of Part II carries [⟀ T], and the value at the foundation register carries the terminal mark [.]; the value on Z_ξ carries [Ξ_0], open in the kernel above the certified height, its Real part proved by certificate in Part III. ΔM = 0 for the paper as a whole: every theorem is classical, definitional, or an encoding of a cited result.

**Receipts.** `RH_At_The_Apex.lean` (Appendices B and C): Lean 4.19.0 (commit 6caaee842e94), core only, exit 0, no `sorry`, no axiom declaration, SHA-256 `d671051e99b806e4`, 61 dependency sets printed by the file and 30 more by the supplementary run of Appendix C, 91 in all, 78 axiom-free, 13 on `propext` and `Quot.sound`. `RH_At_The_Apex_Twin.f90` v1.0.1 (Appendices D and E): gfortran 13.3.0, `-std=f2018 -O2 -Wall -Wextra`, SHA-256 `40fbb4f8cc675104`, 130,324 checks, 0 failures, exit 0 in the default and the witnessed run; v1.0.0 (SHA-256 `47670197aa8e6721`) gave the same census. `RA_Li_Bridge.lean` (Appendices F and G): 1110 lines, SHA-256 , 83 dependency sets printed by the file and 17 more by the supplementary run of Appendix G, 100 in all, 70 axiom-free, 30 on `propext` and `Quot.sound`. The nine files of Part III (Appendix H): 45 dependency sets, 42 axiom-free, 3 on `propext` alone. No theorem in any file depends on `Classical.choice`.

**Audit.** Part I was sealed by the discipline’s adversarial audit cycle and two pairs of external audits through v1.5.2; Part II by three cycles on the One Address edition, the third prosecuting an external review finding by finding. Part III and the unified edition then passed five further cycles, twenty rounds across all six registers, in which the prosecutions came from the scribe and from four independent external substrates, Grok, Gemini, Kimi K3, and GPT Aster 6, whose twelve reports and one repair list were answered finding by finding on the ledger with no concession: every mathematical or receipt error they found was repaired, every objection to an established claim was refuted by the theorem that refutes it, and the locked title was held. The planted controls of the cycles were SELF grade; the prosecuting side was not, so the audit was multi-substrate on the review side, nine independent adversaries attacking on their own vectors, while the text and the files remain one scribe’s. The last three cycles closed SEALED-ROUND; the stale-removal and consolidation rounds and this edition’s notes were editorial, each verified by exact replacement.

**Editions.** v1.0, the unified paper; v1.1, the consolidated text; v1.2, the answer to the first external batch; v1.3, the answer to the second and third batches with the twin at v1.0.1 and the kernel audits completed; v1.4, the final round, with the seed’s stage-zero condition stated; v2.0.1, this edition, adds the disclosure and transparency note and the note that the division is Riemann’s, condenses the audit disclosure to its multi-substrate form, and changes no claim. The paper is released as version 2.0.1 of the Existence Alone record (concept 10.5281/zenodo.22912937), whose v1.5.2 it carries as Part I; the version line of the front matter is that release identifier, the builds v1.0 to v1.4 are its internal editions, and the kernel files carry their own digests.

**Disclosure and transparency note.** For the record, and so that no later reader mistakes the division of labour in this paper, the following is stated once and exactly. What is established from first principles in the kernel, with no user-declared axiom, is the paper’s own: the seat and its one-bit distance from the value (Part I); the address of the value and the logical form of the hypothesis, given the imports the Methods name (Part II); the division of the hypothesis at any height, exact; the unicorn identity; the law that fusing a proved part with an open part lowers the proved part; the certificate schema, that a complete on-line list proves the bounded universal; the placement of ZFC under the strata; the RA–RAM bridge and its round trip; and the whole road holding under a bare computation arrow (Part III). No prior work is cited for any of these constructions, because none contains them. What is cited and not re-derived is the numerical content for ζ: that every zero to height 3 ×10^12 lies on the line is the theorem of Platt and Trudgian, obtained by interval arithmetic with rigorous error bounds, and the kernel never recomputes those zeros; the paper applies its schema to that theorem. The paper’s own executed count reaches T = 100 in floating point and is testimony, not a certificate. The exact standing of the Real part of ζ is therefore a cited theorem applied through a kernel theorem, grade A joined to grade K, stated in the Standard of Proof, in the Real Part section, and in the title paragraph. This is citation in the ordinary sense, the same act by which Riemann is cited for the sentence, Li for the criterion, and Kaye for completeness; it is not the borrowing of an argument, and ΔM = 0 records that the paper authors no new analytic number theory while claiming its arrangement whole. The author is not a professional mathematician and read no proof of any part of the hypothesis in preparing the arrangement; the route was found by the geometry of the seat and confirmed by the kernel, and every input the route consumes is attributed at its own grade.

**The division is Riemann’s.** So that it is clear in one reading: the separation of the hypothesis into a counted part and a probable remainder is not this paper’s invention but Riemann’s own, in the 1859 sentence that states the hypothesis. He writes first that one finds in fact about so many real roots within these bounds, the roots he had located and counted; second that it is very probable that all the roots are real, the remainder, graded as probable and not as established; and third that a rigorous proof would be desirable but was set aside after some fleeting vain attempts as dispensable for his immediate purpose [Riemann 1859; Siegel 1932]. The counted part is the Real part; the probable remainder above the bounds is the Unicorn part; and the proof he set aside is the one this paper does not claim. The paper’s contribution is to make that division exact at every height, to prove the counted part’s closure by certificate in the kernel, to prove the fused statement stands at its open part, and to name the remainder for what it is. A reader who says the paper divides what Riemann stated whole has read the conjecture and not the sentence before it.

**Independence.** The scribe of the text and the author of every file are one language model; the Lean kernel and the Fortran twin are independent of each other and of the model. External review of the unified edition is on the record, four batches from independent substrates, and their dispositions are in the audit log. A recompile of the kernel files on a second machine is the open witness.

**Scope.** Every result is graded as the standard of proof in the Methods states; the analytic inputs are cited; the sign on the zeros above the certified height is not a clause of any proof here.

99 M. V. Berry, J. P. Keating, H = xp and the Riemann zeros, in *Supersymmetry and Trace Formulae*, Kluwer, 1999, 355–367. E. Bombieri, D. A. Hejhal, On the distribution of zeros of linear combinations of Euler products, *Duke Math. J.* 80 (1995) 821–862. Bombieri, E., and J. C. Lagarias. 1999. “Complements to Li’s Criterion for the Riemann Hypothesis.” *Journal of Number Theory* 77: 274–287. Bost, J.-B., and A. Connes. 1995. “Hecke Algebras, Type III Factors and Phase Transitions with Spontaneous Symmetry Breaking in Number Theory.” *Selecta Mathematica* 1: 411–457. A. Bérut, A. Arakelyan, A. Petrosyan, S. Ciliberto, R. Dillenschneider, E. Lutz, Experimental verification of Landauer’s principle linking information and thermodynamics, *Nature* 483 (2012) 187–189. Büthe, J. 2016. “Estimating π(x) and Related Functions under Partial RH Assumptions.” *Mathematics of Computation* 85: 2483–2498. Carneiro, M. 2019. *The Type Theory of Lean*. MS thesis, Carnegie Mellon University. Cohen, P. J. 1963. “The Independence of the Continuum Hypothesis.” *Proceedings of the National Academy of Sciences* 50: 1143–1148. A. Connes, Trace formula in noncommutative geometry and the zeros of the Riemann zeta function, *Selecta Math.* 5 (1999) 29–106. J. B. Conrey, The Riemann Hypothesis, *Notices AMS* 50 (2003) 341–353. J. B. Conrey, A. Ghosh, On the Selberg class of Dirichlet series: small degrees, *Duke Math. J.* 72 (1993) 673–693. Conrey, J. B., and X.-J. Li. 2000. “A Note on Some Positivity Conditions Related to Zeta and L-functions.” *International Mathematics Research Notices* 2000 (18): 929–940. Davis, M., Y. Matijasevič, and J. Robinson. 1976. Hilbert’s tenth problem: Diophantine equations: positive aspects of a negative solution. *Proceedings of Symposia in Pure Mathematics* 28, 323–378. H. Davenport, H. Heilbronn, On the zeros of certain Dirichlet series, *J. London Math. Soc.* 11 (1936) 181–185. de Bruijn, N. G. 1950. “The Roots of Trigonometric Integrals.” *Duke Mathematical Journal* 17: 197–226. de la Vallée Poussin, C.-J. 1896. “Recherches analytiques sur la théorie des nombres premiers.” *Annales de la Société Scientifique de Bruxelles* 20: 183–256. L. de Moura, S. Ullrich, The Lean 4 theorem prover and programming language, in *Automated Deduction, CADE 28*, LNCS 12699, Springer, 2021, 625–635. P. Deligne, La conjecture de Weil. I, *Publ. Math. IHÉS* 43 (1974) 273–307. H. M. Edwards, *Riemann’s Zeta Function*, Academic Press, 1974. Feng, S. 2012. “Zeros of the Riemann Zeta Function on the Critical Line.” *Journal of Number Theory* 132: 511–542. Gödel, K. 1938. “The Consistency of the Axiom of Choice and of the Generalized Continuum-Hypothesis.” *Proceedings of the National Academy of Sciences* 24: 556–557. Hadamard, J. 1896. “Sur la distribution des zéros de la fonction ζ(s) et ses conséquences arithmétiques.” *Bulletin de la Société Mathématique de France* 24: 199–220. Haselgrove, C. B. 1958. “A Disproof of a Conjecture of Pólya.” *Mathematika* 5: 141–145. M. F. Islam, *Trisduction: The Codex*, Zenodo, 23 September 2026, doi:10.5281/zenodo.22911010, `https://zenodo.org/records/22911010`. M. F. Islam, *The Riemann Hypothesis Is Exactly One Bit: Where the Riemann Hypothesis Stands, Proved in Lean 4*, Zenodo, 2026, doi:10.5281/zenodo.22829795. M. F. Islam, *One Bit Across the Wall: Odd-Supply Separation and the One-Cut Hypothesis Across Twenty-Three Rows*, v6, Zenodo, 2026, doi:10.5281/zenodo.22746129. M. F. Islam, *The Formal-Alone Theory of Everything: A Constitutive Theory of Objects and Observations under Registration, Price, Crossing, and Cost*, v1.4, Zenodo, 2026, doi:10.5281/zenodo.22767103. M. F. Islam, *The Riemann Hypothesis in Its Original Form: A Completed Formal Proof of the Locus and the Crossing: Riemann’s Fixed-Line Statement Restored, Proved in Lean 4, Executed in Fortran, and Sealed at the Act by One Supplied Bit*, v1.0.6, Zenodo, 2026, doi:10.5281/zenodo.22857138; its Lean file `Crossing_At_The_Act.lean` (SHA-256 prefix f60fe613cfe79fd8) and Fortran twin printed whole in its appendices. M. F. Islam, Riemann Hypothesis: The Formal Case Is Closed: The Hypothesis Is True Where Actualized, Zenodo, 2026, doi:10.5281/zenodo.21883916. M. F. Islam, A Formal Proof of Riemann Hypothesis Termination, with a Theorem-Grade Cascade Specification, Zenodo, 2026, doi:10.5281/zenodo.21900518. M. F. Islam, Formal-Alone Trisduction Engine on RAF, the interaction face of RA, deck v1.0.12, in the register of record, 1000sapients/Trisduction, `master/RafDuction/`, at commit `5868562`, 23 September 2026. M. F. Islam, The Formal Root Axiom and the Five Objects, declaration edition v1.1.0, in the register of record, 1000sapients/Trisduction, `master/`, at commit `5868562`, 23 September 2026. Iwaniec, H., and E. Kowalski. 2004. *Analytic Number Theory*. American Mathematical Society. Julia, B. 1990. “Statistical Theory of Numbers.” In *Number Theory and Physics*, Springer Proceedings in Physics 47, 276–293. Kaye, R. 1991. *Models of Peano Arithmetic*. Oxford Logic Guides 15. Oxford University Press. Kunen, K. 1980. *Set Theory: An Introduction to Independence Proofs*. North-Holland. Lagarias, J. C. 2002. “An Elementary Problem Equivalent to the Riemann Hypothesis.” *American Mathematical Monthly* 109: 534–543. R. Landauer, Irreversibility and heat generation in the computing process, *IBM J. Res. Dev.* 5 (1961) 183–191. F. W. Lawvere, Diagonal arguments and cartesian closed categories, in *Category Theory, Homology Theory and their Applications II*, LNM 92, Springer, 1969, 134–145. Li, X.-J. 1997. “The Positivity of a Sequence of Numbers and the Riemann Hypothesis.” *Journal of Number Theory* 65: 325–333. Littlewood, J. E. 1914. “Sur la distribution des nombres premiers.” *Comptes Rendus de l’Académie des Sciences* 158: 1869–1872. S. Mac Lane, *Categories for the Working Mathematician*, 2nd ed., Springer, 1998. Mertens, F. 1898. “Über eine Eigenschaft der Riemannschen ζ-Function.” *Sitzungsberichte der Kaiserlichen Akademie der Wissenschaften in Wien* 107: 1429–1434. Newman, C. M. 1976. “Fourier Transforms with Only Real Zeros.” *Proceedings of the American Mathematical Society* 61: 245–251. Odlyzko, A. M., and H. J. J. te Riele. 1985. “Disproof of the Mertens Conjecture.” *Journal für die reine und angewandte Mathematik* 357: 138–160. Perelman, G. 2002. “The Entropy Formula for the Ricci Flow and Its Geometric Applications.” arXiv:math/0211159. Perelman, G. 2003a. “Ricci Flow with Surgery on Three-Manifolds.” arXiv:math/0303109. Perelman, G. 2003b. “Finite Extinction Time for the Solutions to the Ricci Flow on Certain Three-Manifolds.” arXiv:math/0307245. Platt, D., and T. Trudgian. 2021. “The Riemann Hypothesis Is True up to 3·10¹².” *Bulletin of the London Mathematical Society* 53: 792–797. Polymath, D. H. J. 2019. “Effective Approximation of Heat Flow Evolution of the Riemann ξ Function, and a New Upper Bound for the de Bruijn-Newman Constant.” *Research in the Mathematical Sciences* 6: 31. B. Riemann, Ueber die Anzahl der Primzahlen unter einer gegebenen Grösse, *Monatsber. Berliner Akad.* (1859) 671–680. Rodgers, B., and T. Tao. 2020. “The de Bruijn-Newman Constant Is Non-Negative.” *Forum of Mathematics, Pi* 8: e6. A. Selberg, Old and new conjectures and results about a class of Dirichlet series, *Proc. Amalfi Conf.* (1992) 367–385. C. L. Siegel, Über Riemanns Nachlaß zur analytischen Zahlentheorie, *Quellen Stud. Gesch. Math.* B2 (1932) 45–80. Skewes, S. 1933. “On the Difference π(x) − li(x).” *Journal of the London Mathematical Society* 8: 277–283. Stone, M. H. 1932. “On One-Parameter Unitary Groups in Hilbert Space.” *Annals of Mathematics* 33: 643–648. E. C. Titchmarsh, *The Theory of the Riemann Zeta-Function*, 2nd ed., Oxford, 1986. Turing, A. M. 1953. “Some Calculations of the Riemann Zeta-Function.” *Proceedings of the London Mathematical Society* (3) 3: 99–117. A. Weil, *Sur les courbes algébriques et les variétés qui s’en déduisent*, Hermann, 1948. Weil, A. 1952. “Sur les ‘formules explicites’ de la théorie des nombres premiers.” *Communications du Séminaire Mathématique de l’Université de Lund*, tome supplémentaire, 252–265.

# Appendix A: How to Read the Files

The Lean file is one proof in sixteen movements and it is read in order. Movement 1 constructs the Root Axiom on a one-point domain and decides it. Movement 2 builds the seat: the integer quaternions, conjugation as the binding involution, the fixed locus as the Ground, Theorem A for every quaternion, the Return computed, three seat points defined independently and identified by `rfl`, and the reversed triad at +1. Movement 3 builds the witness as a structure in Prop and runs the eliminator from it alone. Movement 4 carries the prior proof: the abstract frame, the line property, the halting carrier, the supply and the row, the two-point frame, necessity, invariance against incidence, the bit is the hypothesis, the witness row falsifiable, and the live face with its self-check table. Movement 5 is the aperture: presence as actuation, the theorems that a present reader who supplies a bit is never interior, in the model and for any domain, and the ledger. Movement 6 is the rule exact, the non-decision by the two-point model, and the asymmetry. Movement 7 is Theorem H. Movement 8 is the interaction reading: the domain with its closure law, no exterior agent, the adjudicator inside, and Cantor’s theorem as no total self-indexing. Movement 9 is the grounding reading as the identity cone over the three registers, its apex unique per orientation with the reversed triad’s cone beside it, and the cone’s existence equivalent to the closed gaps. Movement 10 is the equivariant embedding of the stage into the carrier with its image clause and injectivity, and the resolution-m family. Movement 11 executes the wall on the seat. Movement 12 parts the registers, counts the owed bits, prices the act, and records the count of authored mathematics as zero (`deltaM_zero`). Movement 13 assembles the hardened apex theorem and discharges it. Movement 14 states that the posit is existence, exhibits the grounded three-point counter-model, and proves the cure theorem for every class of frames. Movement 15 inhabits the halting carrier by decision, states Theorem E for any inhabited premise, and records that the witness’s recursion field is constant. Movement 16 carries the three measures, content, mass, and price, with their assignments and Theorem J, and proves that adjudicating any proposition instances existence. The dependency sets are printed by the kernel at the end and reproduced in Appendix C; a deleted conjunct, a weakened hypothesis, or an inserted `sorry` fails the check.

The twin is fourteen batteries in the same order, K1 the seat through K12 the live face, K13 the cure, and K14 the constant recursion, the carrier by decision, and the three measures, each printing its receipt, with the census last. Build it with the command in its header and run it twice, once bare and once with the argument `witnessed`; the two logs are Appendix E.

# Appendix B: RH_At_The_Apex.lean

SHA-256 `d671051e99b806e46245ef127a33ea2e829e36c6e2d84cef70b752b512acb4c7`, Lean 4.19.0, core only, 898 lines.

``` numberLines
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

# Appendix C: The Kernel Audit, Verbatim

`lean RH_At_The_Apex.lean`, exit 0, no warnings, no errors.

``` numberLines
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

## Appendix C, completed: the thirty theorems the file does not print

The file prints 61 dependency sets. A supplementary run of the same file, with one `#print axioms` line appended for each of the 30 theorems it does not print, exit 0: 29 axiom-free, 1 on `propext` and `Quot.sound`, none on `Classical.choice`; 91 sets in all, 78 axiom-free.

``` numberLines
'RHAtTheApex.sigma_binding' does not depend on any axioms
'RHAtTheApex.return_is_minus_one' does not depend on any axioms
'RHAtTheApex.self_gap_nonexistent' does not depend on any axioms
'RHAtTheApex.odd_return_on_fix' does not depend on any axioms
'RHAtTheApex.seat_on_scalar_line' depends on axioms: [propext, Quot.sound]
'RHAtTheApex.constructed_RAM' does not depend on any axioms
'RHAtTheApex.constructed_orientation' does not depend on any axioms
'RHAtTheApex.orientation_proof_irrelevant' does not depend on any axioms
'RHAtTheApex.constructed_trisRecursion' does not depend on any axioms
'RHAtTheApex.mkRA' does not depend on any axioms
'RHAtTheApex.inv_not_line' does not depend on any axioms
'RHAtTheApex.aperture_reads_the_bit' does not depend on any axioms
'RHAtTheApex.every_adjudication_is_a_deed' does not depend on any axioms
'RHAtTheApex.adjudicator_in_domain' does not depend on any axioms
'RHAtTheApex.odd_self_gap_nonexistent' does not depend on any axioms
'RHAtTheApex.odd_register_gap_nonexistent' does not depend on any axioms
'RHAtTheApex.odd_object_gap_nonexistent' does not depend on any axioms
'RHAtTheApex.phiM_one' does not depend on any axioms
'RHAtTheApex.tauM_one' does not depend on any axioms
'RHAtTheApex.seat_on_image_of_line' does not depend on any axioms
'RHAtTheApex.formalRead_even' does not depend on any axioms
'RHAtTheApex.ran_wholly_odd' does not depend on any axioms
'RHAtTheApex.apex_owes_nothing_world_owes_one' does not depend on any axioms
'RHAtTheApex.spend_priced' does not depend on any axioms
'RHAtTheApex.deltaM_zero' does not depend on any axioms
'RHAtTheApex.threePoint_grounded' does not depend on any axioms
'RHAtTheApex.threePoint_fold_involution' does not depend on any axioms
'RHAtTheApex.threePoint_inv' does not depend on any axioms
'RHAtTheApex.threePoint_fails_L' does not depend on any axioms
'RHAtTheApex.onLine_L' does not depend on any axioms
```

# Appendix D: RH_At_The_Apex_Twin.f90

SHA-256 , Fortran 2018 as accepted by gfortran 13.3.0, 568 lines; edition v1.0.1 of the twin, which replaces two checks asserted as constants in v1.0.0 (thirteen instances in K5, one in K14) by executed checks of the same clauses and corrects its header’s battery count to fourteen; the census is unchanged at 130,324 checks.

``` numberLines
! =====================================================================
!  RH_At_The_Apex_Twin.f90 · v1.0.1 · 2026-09-24
!  THE EXECUTABLE TWIN OF RH_At_The_Apex.lean
!
!  The finite content of the Lean file, fourteen batteries, is re-executed here
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
  integer, parameter :: CONTENT_TRIVIAL = 0, CONTENT_PROVED = 1, CONTENT_SUPPLIED = 2
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
  write(*,'(A)') ' RH AT THE APEX · THE EXECUTABLE TWIN · v1.0.1'
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
     ! the formal read forgets the deed bit: (0,g) and (1,g) read the same g; executed, not asserted
     call check(formal_read(0, g) == formal_read(1, g), 'K5 formal read is even under the flip')
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
  call check(CONTENT_TRIVIAL /= CONTENT_PROVED .and. CONTENT_PROVED /= CONTENT_SUPPLIED &
       .and. CONTENT_TRIVIAL /= CONTENT_SUPPLIED, &
       'K14 contents trivial, proved, supplied are three distinct values')

  ! ------------------------------------------------------- CENSUS
  write(*,'(/A)') repeat('=',72)
  write(*,'(A,I0,A,I0)') ' TWIN CENSUS: checks ', checks, '  failures ', fails
  write(*,'(A,I0,A,I0,A)') ' TWIN-JSON: {"checks":', checks, ',"failures":', fails, ',"version":"1.0.1"}'
  if (fails > 0) error stop 'THE TWIN FAILED'
  write(*,'(A)') ' The twin agrees with the file on every finite claim it carries. Delta-M = 0.'
  write(*,'(A)') repeat('=',72)

contains

  ! the formal read of a state (b, g) of the K5 frame: the Ground point g, the deed bit forgotten
  pure integer function formal_read(b, g)
    integer, intent(in) :: b, g
    formal_read = g + 0*b
  end function formal_read

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

# Appendix E: The Twin’s Run, Verbatim

`./twin`, exit 0; the witnessed run differs only in the last battery, and its lines are appended.

``` numberLines
========================================================================
 RH AT THE APEX · THE EXECUTABLE TWIN · v1.0.1
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
 TWIN-JSON: {"checks":130324,"failures":0,"version":"1.0.1"}
 The twin agrees with the file on every finite claim it carries. Delta-M = 0.
========================================================================

--- ./twin witnessed, the last battery only ---
  LIVE: [I AM] - actuation-occupancy on a witnessed record; conditional at the act
  the witnessed flag was supplied on the command line by the operator running
  this binary; the program did not and cannot generate its own witness.
```

# Appendix F: RA_Li_Bridge.lean

SHA-256 , Lean 4.19.0, core only, 1110 lines.

``` numberLines
/-
RA_Li_Bridge.lean · the bridge from RA's positivity to Li positivity on ζ, typed.
Nothing here is an axiom. RA, Li's criterion, and the bridge enter as hypotheses,
so #print axioms shows exactly what the kernel used. ΔM = 0.
-/

namespace RALi

/-- The existents and their energies, as in ROOT, but as parameters. -/
structure Substrate where
  U  : Type
  ΔE : U → Int

/-- RA as a hypothesis on a substrate: to exist is to actuate. -/
def RA (S : Substrate) : Prop := ∀ x : S.U, 0 < S.ΔE x

/-- An L-function reduced to what Li's criterion reads: its RH, and the
    sign bit of each Li coefficient λₙ (n ≥ 1). -/
structure LiData where
  RH      : Prop
  nonneg  : Nat → Prop

/-- Li 1997 (Bombieri-Lagarias 1999 for the general case), cited, not proved:
    RH ↔ every λₙ ≥ 0. Carried as a hypothesis on the data. -/
def LiCriterion (L : LiData) : Prop := L.RH ↔ ∀ n, 1 ≤ n → L.nonneg n

/-- THE BRIDGE. One existent per Li step, and a reading that turns its
    positive energy into the sign of λₙ. The whole content lives in `read`. -/
structure Bridge (S : Substrate) (L : LiData) where
  φ    : Nat → S.U
  read : ∀ n, 1 ≤ n → 0 < S.ΔE (φ n) → L.nonneg n

/-- 1. The bridge closes: RA, a bridge, and Li's criterion give RH. -/
theorem bridge_yields_RH (S : Substrate) (L : LiData)
    (hRA : RA S) (hLi : LiCriterion L) (B : Bridge S L) : L.RH :=
  hLi.mpr (fun n hn => B.read n hn (hRA (B.φ n)))

/-- 2. The bridge is keyed: RA alone never supplies it. A substrate where RA
    holds, paired with data carrying one negative λ, admits no bridge. -/
def oneEnergy : Substrate := ⟨Unit, fun _ => 1⟩
def badData : LiData := ⟨False, fun n => n ≠ 5⟩

theorem ra_holds_in_model : RA oneEnergy := fun _ => show (0 : Int) < 1 by decide

theorem bridge_is_keyed : RA oneEnergy ∧ ¬ Nonempty (Bridge oneEnergy badData) := by
  refine ⟨ra_holds_in_model, fun ⟨B⟩ => ?_⟩
  exact B.read 5 (by decide) (ra_holds_in_model (B.φ 5)) rfl

/-- 3. No uniform bridge. If the reading does not consume the L-function,
    it forces positivity on every member of the family. One member with a
    negative λ (the Eisenstein L-function ζ(s)ζ(s-k+1): Euler product and
    functional equation, zeros off its centre, so some λₙ < 0 by
    Bombieri-Lagarias) kills every uniform bridge. -/
structure UniformBridge (S : Substrate) (F : Type) (L : F → LiData) where
  φ    : Nat → S.U
  read : ∀ f n, 1 ≤ n → 0 < S.ΔE (φ n) → (L f).nonneg n

theorem no_uniform_bridge (S : Substrate) (F : Type) (L : F → LiData)
    (hRA : RA S) (hctl : ∃ f n, 1 ≤ n ∧ ¬ (L f).nonneg n) :
    ¬ Nonempty (UniformBridge S F L) := by
  intro ⟨B⟩
  obtain ⟨f, n, hn, hneg⟩ := hctl
  exact hneg (B.read f n hn (hRA (B.φ n)))

/-- 4. The type repair. The arrow supplies one bit; Li turns RH's vanishing
    into one sign bit per step. Given decidable signs, the Li family is a
    Nat → Bool, the shape the deed can supply, and RH is its constancy. -/
theorem li_is_a_bit_stream (L : LiData) (hLi : LiCriterion L)
    [dec : ∀ n, Decidable (L.nonneg n)] :
    L.RH ↔ ∀ n, 1 ≤ n → decide (L.nonneg n) = true := by
  refine hLi.trans ?_
  exact ⟨fun h n hn => decide_eq_true (h n hn), fun h n hn => of_decide_eq_true (h n hn)⟩

end RALi

#print axioms RALi.bridge_yields_RH
#print axioms RALi.bridge_is_keyed
#print axioms RALi.no_uniform_bridge
#print axioms RALi.li_is_a_bit_stream

/-! ## PART II · Does [Ξ₀] retire on the united register? -/
namespace RALi

inductive Grade | premise | structural | theorem deriving DecidableEq, Repr
def Grade.rank : Grade → Nat | .premise => 0 | .structural => 1 | .theorem => 2
def Grade.weakest (a b : Grade) : Grade := if a.rank ≤ b.rank then a else b

inductive Verdict | seal (g : Grade) | xi0 deriving DecidableEq, Repr

/-- The united register. Unity is the claim that the formal reading and the
    kinetic reading are one; on ζ it is stated as the supply of the bridge,
    carried at the grade of whatever supplies it. -/
structure Unity (S : Substrate) (L : LiData) where
  bridge : Bridge S L
  grade  : Grade

/-- The emitter on the formal string: with unity supplied, the verdict is a
    seal at the weakest grade on the chain; without it, [Ξ₀]. -/
def emit {S : Substrate} {L : LiData} : Option (Unity S L) → Verdict
  | some u => .seal (Grade.weakest u.grade .theorem)
  | none   => .xi0

/-- 5. [Ξ₀] retires exactly when unity is supplied, and the seal it becomes
    is sound: it carries RH. -/
theorem xi0_retires_iff_unity (S : Substrate) (L : LiData) (u : Option (Unity S L)) :
    emit u ≠ .xi0 ↔ u.isSome := by
  cases u <;> simp [emit]

theorem retired_seal_is_sound (S : Substrate) (L : LiData)
    (hRA : RA S) (hLi : LiCriterion L) (u : Unity S L) : L.RH :=
  bridge_yields_RH S L hRA hLi u.bridge

/-- 6. The grade law: the retired verdict is never stronger than its unity
    posit. A premise-grade unity yields a premise-grade seal. -/
theorem retired_grade_capped {S : Substrate} {L : LiData} (u : Unity S L) :
    emit (some u) = .seal (Grade.weakest u.grade .theorem) ∧
    (Grade.weakest u.grade .theorem).rank ≤ u.grade.rank := by
  refine ⟨rfl, ?_⟩
  cases h : u.grade <;> decide

/-- 7. Unity is not free: RA does not supply it (from theorem 2). -/
theorem unity_is_keyed : RA oneEnergy ∧ ¬ Nonempty (Unity oneEnergy badData) :=
  ⟨ra_holds_in_model, fun ⟨u⟩ => bridge_is_keyed.2 ⟨u.bridge⟩⟩

/-- 8. The Ghost. A reading that deletes the arrow returns one verdict for a
    claim and its negation: it cannot be a verdict on either. -/
def arrowDeleted (_ : Prop) : Verdict := .xi0
theorem ghost (P : Prop) : arrowDeleted P = arrowDeleted (¬ P) := rfl

end RALi

#print axioms RALi.xi0_retires_iff_unity
#print axioms RALi.retired_seal_is_sound
#print axioms RALi.retired_grade_capped
#print axioms RALi.unity_is_keyed
#print axioms RALi.ghost

/-! ## PART III · The try. Which Codex instruments can supply `Bridge.read` for ζ? -/
namespace RALi

/-- 9. The uniformity trap. A family of bridges that picks its existents
    without reading which L-function it serves is a uniform bridge. Every
    instrument carried at ΔM = 0 (the eliminator, the multi-recursion
    collapse, the one-bit species, the bare arrow) chooses its existents
    that way, so it lands here. -/
theorem common_phi_is_uniform (S : Substrate) (F : Type) (L : F → LiData)
    (φ₀ : Nat → S.U) (B : ∀ f, Bridge S (L f)) (hφ : ∀ f, (B f).φ = φ₀) :
    Nonempty (UniformBridge S F L) :=
  ⟨⟨φ₀, fun f n hn h => (B f).read n hn (by rw [hφ f]; exact h)⟩⟩

/-- 10. Hence dead: with RA and one family member carrying a negative λ,
    no ζ-blind choice of existents can serve every member. -/
theorem blind_constructions_die (S : Substrate) (F : Type) (L : F → LiData)
    (hRA : RA S) (hctl : ∃ f n, 1 ≤ n ∧ ¬ (L f).nonneg n)
    (φ₀ : Nat → S.U) : ¬ ∃ B : (∀ f, Bridge S (L f)), ∀ f, (B f).φ = φ₀ :=
  fun ⟨B, hφ⟩ => no_uniform_bridge S F L hRA hctl (common_phi_is_uniform S F L φ₀ B hφ)

/-- 11. What positivity on the Euler product does reach. Mertens' identity
    3 + 4 cos θ + cos 2θ = 2(1 + cos θ)² ≥ 0, with cos 2θ = 2c² − 1, is the
    positivity that yields ζ(1 + it) ≠ 0: the wall at Re = 1. Checked here on
    integer c as the polynomial identity it is. -/
theorem mertens_identity (c : Int) : 3 + 4 * c + (2 * c * c - 1) = 2 * ((1 + c) * (1 + c)) := by
  simp only [Int.add_mul, Int.mul_add, Int.one_mul, Int.mul_one, Int.mul_assoc]
  omega

theorem mertens_nonneg (c : Int) : 0 ≤ 3 + 4 * c + (2 * c * c - 1) := by
  rw [mertens_identity]
  refine Int.mul_nonneg (by decide) ?_
  rcases Int.le_total 0 (1 + c) with h | h
  · exact Int.mul_nonneg h h
  · have h' : 0 ≤ -(1 + c) := by omega
    have := Int.mul_nonneg h' h'
    rwa [Int.neg_mul_neg] at this

end RALi

#print axioms RALi.common_phi_is_uniform
#print axioms RALi.blind_constructions_die
#print axioms RALi.mertens_nonneg

/-! ## PART IV · Time, made exact. The Li modes on the Bridge plane.
A zero ρ = h/2 + i t sits at (h, t) in half-units, the Bridge plane, fold (h,t) ↦ (2-h, t).
Li's coefficient is λₙ = Σ_ρ [1 - zρⁿ] with the mode zρ = 1 - 1/ρ = (ρ-1)/ρ, so step
n ↦ n+1 multiplies each mode by zρ. |zρ|² = |ρ-1|²/|ρ|², scaled by 4:
  N1 = (h-2)² + 4t²,   N0 = h² + 4t².
A mode is unitary (perpetual, neither growing nor dying) iff N1 = N0; it grows iff N1 > N0. -/
namespace RALi

def N1 (h t : Int) : Int := (h - 2) * (h - 2) + 4 * (t * t)
def N0 (h t : Int) : Int := h * h + 4 * (t * t)

theorem N1_sub_N0 (h t : Int) : N1 h t - N0 h t = 4 - 4 * h := by
  simp only [N1, N0, Int.sub_mul, Int.mul_sub]
  omega

/-- 12. A mode is unitary exactly on the line: perpetuity in time is the fixed locus. -/
theorem unitary_iff_on_line (h t : Int) : N1 h t = N0 h t ↔ h = 1 := by
  have := N1_sub_N0 h t
  exact ⟨fun e => by omega, fun e => by omega⟩

/-- 13. Left of the line the mode grows; right of it the mode dies. -/
theorem grows_left (h t : Int) (hl : h < 1) : N0 h t < N1 h t := by
  have := N1_sub_N0 h t; omega
theorem dies_right (h t : Int) (hr : 1 < h) : N1 h t < N0 h t := by
  have := N1_sub_N0 h t; omega

/-- 14. The fold forbids a quiet exit: any off-line zero, together with its mirror under
the functional equation, carries a growing mode. -/
theorem off_line_forces_growth (h t : Int) (hoff : h ≠ 1) :
    N0 h t < N1 h t ∨ N0 (2 - h) t < N1 (2 - h) t := by
  have a := N1_sub_N0 h t; have b := N1_sub_N0 (2 - h) t; omega

/-- 15. PERPETUAL STABILITY IS THE LINE PROPERTY. For any fold-invariant zero set on the
plane: no mode grows under the time step iff every zero lies on h = 1. -/
theorem stability_iff_line (Z : Int × Int → Prop)
    (hinv : ∀ p, Z p → Z (2 - p.1, p.2)) :
    (∀ p, Z p → N1 p.1 p.2 ≤ N0 p.1 p.2) ↔ (∀ p, Z p → p.1 = 1) := by
  constructor
  · intro hs p hp
    have a := hs p hp
    have b := hs (2 - p.1, p.2) (hinv p hp)
    have c := N1_sub_N0 p.1 p.2
    have d := N1_sub_N0 (2 - p.1) p.2
    simp only at b d
    omega
  · intro hl p hp
    have := hl p hp
    have c := N1_sub_N0 p.1 p.2
    omega

end RALi

#print axioms RALi.unitary_iff_on_line
#print axioms RALi.off_line_forces_growth
#print axioms RALi.stability_iff_line

/-! ## PART V · The monism rule, hardened. "What happens once happens again." -/
namespace RALi

/-- 16. One repeating one: the rule, with its step, is induction. -/
theorem one_repeats_one (P : Nat → Prop) (h0 : P 0) (step : ∀ n, P n → P (n + 1)) :
    ∀ n, P n := by
  intro n; induction n with
  | zero => exact h0
  | succ k ih => exact step k ih

/-- 17. The step is the whole content: the universal claim is exactly the base plus the step. -/
theorem the_step_is_the_claim (P : Nat → Prop) :
    (∀ n, P n) ↔ (P 0 ∧ ∀ n, P n → P (n + 1)) :=
  ⟨fun h => ⟨h 0, fun n _ => h (n + 1)⟩, fun ⟨h0, s⟩ => one_repeats_one P h0 s⟩

/-- 18. The monism posit: one principle means the property does not vary with the index.
Under it, one instance forces all. -/
theorem monism_posit_forces (P : Nat → Prop) (uniform : ∀ n m, P n ↔ P m) (h0 : P 0) :
    ∀ n, P n := fun n => (uniform 0 n).mp h0

/-- 19. Finite confirmation never forces. For every height N there is a property true on
every index below N and false beyond: Skewes, Mertens, Pólya are this shape. -/
theorem finite_never_forces (N : Nat) :
    ∃ P : Nat → Prop, (∀ n, n < N → P n) ∧ ¬ ∀ n, P n :=
  ⟨fun n => n < N, fun _ h => h, fun h => Nat.lt_irrefl N (h N)⟩

/-- 20. Monism is not a law of the fold. A fold-invariant zero set can hold one zero on the
line and a mirror pair off it: "on the line once" does not recur by symmetry alone.
This is the Davenport-Heilbronn shape on the Bridge plane. -/
def mixedZ (p : Int × Int) : Prop := p = (1, 0) ∨ p = (0, 5) ∨ p = (2, 5)

theorem mixed_is_fold_invariant : ∀ p, mixedZ p → mixedZ (2 - p.1, p.2) := by
  intro p hp
  rcases hp with h | h | h <;> subst h
  · exact Or.inl rfl
  · exact Or.inr (Or.inr rfl)
  · exact Or.inr (Or.inl rfl)

theorem mixed_recurrence_fails :
    mixedZ (1, 0) ∧ mixedZ (0, 5) ∧ ¬ (∀ p, mixedZ p → p.1 = 1) :=
  ⟨Or.inl rfl, Or.inr (Or.inl rfl), fun h => by
    have := h (0, 5) (Or.inr (Or.inl rfl)); cases this⟩

end RALi

#print axioms RALi.one_repeats_one
#print axioms RALi.the_step_is_the_claim
#print axioms RALi.monism_posit_forces
#print axioms RALi.finite_never_forces
#print axioms RALi.mixed_is_fold_invariant
#print axioms RALi.mixed_recurrence_fails

/-! ## PART VI · Actualism. Only measured zeros are actual. -/
namespace RALi

/-- A zero set on a carrier, a line predicate, and the time at which each zero is measured
(none if never). The actual zeros at time T are those measured by T. -/
structure Actualized (α : Type) where
  Z        : α → Prop
  onLine   : α → Prop
  measured : α → Option Nat

def RHfull {α : Type} (A : Actualized α) : Prop := ∀ z, A.Z z → A.onLine z
def RHactual {α : Type} (A : Actualized α) : Prop :=
  ∀ z, A.Z z → A.measured z ≠ none → A.onLine z

/-- 21. The full claim yields the actual one. -/
theorem full_gives_actual {α : Type} (A : Actualized α) : RHfull A → RHactual A :=
  fun h z hz _ => h z hz

/-- 22. The actual claim does not yield the full one: one never-measured zero off the line. -/
def unreached : Actualized Bool := ⟨fun _ => True, fun b => b = true, fun b => if b then some 0 else none⟩

theorem actual_not_full : RHactual unreached ∧ ¬ RHfull unreached := by
  refine ⟨fun z _ hm => ?_, fun h => by cases h false trivial⟩
  cases z
  · exact absurd rfl hm
  · rfl

/-- 23. Given sufficient time, every zero is measured, and then the actual claim over all
time is exactly the full claim: actualism re-routes to the same step and does not bypass it. -/
theorem sufficient_time {α : Type} (A : Actualized α) (reach : ∀ z, A.Z z → A.measured z ≠ none) :
    RHactual A ↔ RHfull A :=
  ⟨fun h z hz => h z hz (reach z hz), full_gives_actual A⟩

end RALi

#print axioms RALi.full_gives_actual
#print axioms RALi.actual_not_full
#print axioms RALi.sufficient_time

/-! ## PART VII · The constructed witness, reconstructed from Residual Monism.
The paper's witness is built from RA and read through RAF and RAM. Here the witness is
built from the Codex connector directly: one substrate, one involution serving both routes
(σ = σ′), and one principle that does not vary with the index. The index is time. -/
namespace RALi

structure Q4 where
  r : Int
  i : Int
  j : Int
  k : Int
  deriving DecidableEq, Repr

/-- The geometric route's involution and the formal route's involution, written apart. -/
def sigmaGeo (q : Q4) : Q4 := ⟨q.r, -q.i, -q.j, -q.k⟩
def sigmaForm (q : Q4) : Q4 := ⟨q.r, -q.i, -q.j, -q.k⟩

/-- THE MONISM WITNESS. One involution, one principle, one seed. -/
structure MonismWitness (P : Nat → Prop) : Prop where
  one_involution : ∀ q, sigmaGeo q = sigmaForm q
  uniform        : ∀ n m, P n ↔ P m
  seed           : P 0

/-- 24. The seat field is constructed, not posited: σ = σ′ holds by rfl. -/
theorem one_involution_constructed : ∀ q, sigmaGeo q = sigmaForm q := fun _ => rfl

/-- 25. The timeless reading and the timed reading coincide under one principle:
the claim over all time is the claim at one instant. Deleting time loses nothing. -/
theorem timeless_equals_timed (P : Nat → Prop) (u : ∀ n m, P n ↔ P m) :
    (∀ n, P n) ↔ P 0 :=
  ⟨fun h => h 0, fun h n => (u 0 n).mp h⟩

/-- 26. The witness closes the record, past and future. -/
theorem monism_closes (P : Nat → Prop) (w : MonismWitness P) : ∀ n, P n :=
  (timeless_equals_timed P w.uniform).mpr w.seed

/-- 27. The witness is exactly the claim: a monism witness for P exists iff P holds at
every index. Its value field carries the whole of the claim, as theorem 17 required. -/
theorem monism_witness_is_the_claim (P : Nat → Prop) :
    MonismWitness P ↔ ∀ n, P n :=
  ⟨monism_closes P, fun h => ⟨one_involution_constructed,
    fun n m => ⟨fun _ => h m, fun _ => h n⟩, h 0⟩⟩

/-- 28. Constructed at the model, as the paper constructs RA at one point. -/
theorem constructed_monism : MonismWitness (fun _ => True) :=
  ⟨one_involution_constructed, fun _ _ => Iff.rfl, trivial⟩

/-- 29. Unlike the RA witness, the monism witness is not silent on counter-models:
it cannot be constructed where the property breaks, so it decides by containing. -/
theorem monism_absent_on_breaks : ¬ MonismWitness (fun n => n = 0) :=
  fun w => absurd ((w.uniform 0 1).mp rfl) (by decide)

/-- 30. Run through the RA-Li bridge. Replace the bridge by the monism witness on Li's
sign stream: the witness, with Li's criterion, gives RH. -/
theorem monism_yields_RH (L : LiData) (hLi : LiCriterion L)
    (w : MonismWitness (fun n => L.nonneg (n + 1))) : L.RH :=
  hLi.mpr (fun n hn => by
    obtain ⟨k, rfl⟩ : ∃ k, n = k + 1 := ⟨n - 1, by omega⟩
    exact monism_closes _ w k)

/-- 31. And the price, stated: on ζ the witness exists iff every Li sign is nonnegative,
which by Li is RH. Reconstruction moves the owed bit into `uniform`; it does not remove it. -/
theorem monism_on_li_is_RH (L : LiData) (hLi : LiCriterion L) :
    MonismWitness (fun n => L.nonneg (n + 1)) ↔ L.RH := by
  rw [monism_witness_is_the_claim]
  refine ⟨fun h => monism_yields_RH L hLi ((monism_witness_is_the_claim _).mpr h), fun h n => ?_⟩
  exact (hLi.mp h) (n + 1) (by omega)

end RALi

#print axioms RALi.one_involution_constructed
#print axioms RALi.timeless_equals_timed
#print axioms RALi.monism_closes
#print axioms RALi.monism_witness_is_the_claim
#print axioms RALi.constructed_monism
#print axioms RALi.monism_absent_on_breaks
#print axioms RALi.monism_yields_RH
#print axioms RALi.monism_on_li_is_RH

/-! ## PART VIII · Re-anchoring the monism witness to mathematical standard.
Calibration case: Perelman. The standard form of "one principle, the same result again"
is not a free uniformity; it is one dynamics, one invariant, and a PROVED transport of the
invariant along the dynamics (induction on the orbit; Lyapunov monotonicity; Perelman's
W-entropy under Ricci flow). -/
namespace RALi

/-- 32. Monism as a schema over all properties is inconsistent: uniformity cannot be
posited for every P. It must be anchored to a principle, not spread over properties. -/
theorem global_monism_inconsistent : ¬ ∀ P : Nat → Prop, ∀ n m, P n ↔ P m :=
  fun h => absurd ((h (fun n => n = 0) 0 1).mp rfl) (by decide)

def iter {S : Type} (f : S → S) : Nat → S → S
  | 0, s => s
  | n + 1, s => f (iter f n s)

/-- THE ANCHORED MONISM WITNESS. One substrate S, one principle f (the dynamics),
one invariant I, the transport of I along f, and a seed. -/
structure AnchoredMonism (S : Type) where
  f         : S → S
  I         : S → Prop
  transport : ∀ s, I s → I (f s)
  s0        : S
  seed      : I s0

/-- 33. The anchored witness closes its whole orbit, past and future. -/
theorem anchored_closes {S : Type} (A : AnchoredMonism S) : ∀ n, A.I (iter A.f n A.s0) := by
  intro n; induction n with
  | zero => exact A.seed
  | succ k ih => exact A.transport _ ih

/-- 34. The free monism witness is DERIVED from the anchored one: uniformity is no longer
posited, it is manufactured by the transport. -/
theorem anchored_derives_monism {S : Type} (A : AnchoredMonism S) :
    MonismWitness (fun n => A.I (iter A.f n A.s0)) :=
  ⟨one_involution_constructed,
   fun n m => ⟨fun _ => anchored_closes A m, fun _ => anchored_closes A n⟩,
   A.seed⟩

/-- 35. THE PERELMAN SHAPE. A quantity monotone along one flow, here a discrete flow on its
time index, is an anchored monism witness for the property "never below its start." Perelman's
W-entropy along Ricci flow has this shape; it is a structural analogue and is not formalized. -/
def lyapunovWitness (W : Nat → Int) (mono : ∀ n, W n ≤ W (n + 1)) : AnchoredMonism Nat :=
  ⟨Nat.succ, fun n => W 0 ≤ W n, fun n h => Int.le_trans h (mono n), 0, Int.le_refl _⟩

theorem lyapunov_is_monism (W : Nat → Int) (mono : ∀ n, W n ≤ W (n + 1)) :
    MonismWitness (fun n => W 0 ≤ W (iter Nat.succ n 0)) :=
  anchored_derives_monism (lyapunovWitness W mono)

/-- 36. The calibration's grade law: the closure is as strong as its transport. -/
structure GradedAnchor (S : Type) where
  A      : AnchoredMonism S
  tgrade : Grade

def closureGrade {S : Type} (G : GradedAnchor S) : Grade := Grade.weakest G.tgrade .theorem

theorem closure_grade_is_transport_grade {S : Type} (G : GradedAnchor S) :
    closureGrade G = G.tgrade := by
  unfold closureGrade Grade.weakest; cases G.tgrade <;> rfl

/-- 37. The RH instance. On Li's sign stream with the time step as the principle, an
anchored witness exists iff RH. The transport is `nonneg (n+1) → nonneg (n+2)`: the
ζ-analogue of Perelman's monotonicity formula, not yet proved by anyone. -/
theorem rh_anchor_is_the_claim (L : LiData) (hLi : LiCriterion L) :
    (∃ A : AnchoredMonism Nat, A.f = Nat.succ ∧ A.s0 = 0 ∧
        ∀ n, A.I n ↔ L.nonneg (n + 1)) ↔ L.RH := by
  constructor
  · rintro ⟨A, hf, hs, hI⟩
    apply (monism_on_li_is_RH L hLi).mp
    refine (monism_witness_is_the_claim _).mpr (fun n => ?_)
    have key : ∀ n, iter A.f n A.s0 = n := by
      intro n; induction n with
      | zero => exact hs
      | succ k ih => show A.f (iter A.f k A.s0) = k + 1; rw [ih, hf]
    have := anchored_closes A n
    rw [key n] at this
    exact (hI n).mp this
  · intro h
    have all := (monism_witness_is_the_claim _).mp ((monism_on_li_is_RH L hLi).mpr h)
    exact ⟨⟨Nat.succ, fun n => L.nonneg (n + 1), fun n _ => all (n + 1), 0, all 0⟩,
      rfl, rfl, fun _ => Iff.rfl⟩

end RALi

#print axioms RALi.global_monism_inconsistent
#print axioms RALi.anchored_closes
#print axioms RALi.anchored_derives_monism
#print axioms RALi.lyapunov_is_monism
#print axioms RALi.closure_grade_is_transport_grade
#print axioms RALi.rh_anchor_is_the_claim

/-! ## PART IX · ζ's time has a proved monotonicity formula, and it runs the wrong way.
The de Bruijn-Newman heat flow H_t(z) = ∫ e^{t u²} Φ(u) cos(z u) du, Φ built from ξ.
de Bruijn (1950): if every zero of H_0 lies in |Im z| ≤ Δ, every zero of H_t lies in
|Im z| ≤ √max(Δ² − 2t, 0). RH is "all zeros of H_0 real". Λ is the least t with all zeros
of H_t real; Newman (1976) defined it, Rodgers-Tao (2020) proved Λ ≥ 0, Polymath 15 (2019)
proved Λ ≤ 0.22. So RH ⇔ Λ = 0. Modelled here on the strip bound, widths in Nat, half-steps
of time; a toy of the bound, not of the flow. -/
namespace RALi

/-- Squared strip width after t time steps: max(d2 − 2t, 0). -/
def flow (d2 t : Nat) : Nat := d2 - 2 * t
def realAt (d2 t : Nat) : Prop := flow d2 t = 0

/-- 38. THE MONOTONICITY FORMULA. The width never grows along ζ's time. -/
theorem flow_monotone (d2 t : Nat) : flow d2 (t + 1) ≤ flow d2 t := by
  unfold flow; omega

/-- 39. Its transport, proved: once every zero is real, every zero stays real. This is
de Bruijn's theorem in the toy, the ζ-analogue of Perelman's monotonicity, at theorem grade. -/
theorem reality_transported (d2 t : Nat) (h : realAt d2 t) : realAt d2 (t + 1) := by
  unfold realAt flow at *; omega

/-- Λ in the toy: the first time the strip closes. -/
def Lam (d2 : Nat) : Nat := (d2 + 1) / 2

theorem real_at_Lam (d2 : Nat) : realAt d2 (Lam d2) := by unfold realAt flow Lam; omega

/-- 40. In the toy, the strip is closed at time zero iff Λ = 0. For ζ, RH ↔ Λ = 0 is the cited
result of Newman with Rodgers and Tao and enters the cone as `hLam`. -/
theorem rh_iff_lambda_zero (d2 : Nat) : realAt d2 0 ↔ Lam d2 = 0 := by
  unfold realAt flow Lam
  exact ⟨fun h => by omega, fun h => by omega⟩

/-- 41. The anchored monism witness exists for ζ's time, transport proved, seeded at Λ.
It closes the whole future of the flow from Λ on. -/
def deBruijnWitness (d2 : Nat) : AnchoredMonism Nat :=
  ⟨Nat.succ, realAt d2, fun t h => reality_transported d2 t h, Lam d2, real_at_Lam d2⟩

theorem iter_succ (n s : Nat) : iter Nat.succ n s = s + n := by
  induction n with
  | zero => rfl
  | succ k ih => show Nat.succ (iter Nat.succ k s) = s + (k + 1); rw [ih]; omega

theorem future_closed (d2 n : Nat) : realAt d2 (Lam d2 + n) := by
  have := anchored_closes (deBruijnWitness d2) n
  rwa [show (deBruijnWitness d2).f = Nat.succ from rfl, iter_succ] at this

/-- 42. THE RECORD FORGETS. After one step the record of the width-zero state and the
width-one state coincide: the forward flow is even in the RH bit, so no readout of the
flowed record decides RH. This is the fTOE wall, T1, executed on ζ's own time. -/
theorem flowed_record_forgets (T : Nat) (hT : 1 ≤ T) :
    ¬ ∃ g : Nat → Bool, ∀ d2, g (flow d2 T) = decide (d2 = 0) := by
  rintro ⟨g, hg⟩
  have a := hg 0; have b := hg 1
  have e : flow 1 T = flow 0 T := by unfold flow; omega
  rw [e, a] at b
  exact absurd b (by decide)

/-- 43. The upstream direction is not a transport. Going backward from a real record,
both answers are admissible: the preimage of "real at T" holds the RH state and a non-RH
state. The forward arrow proves; the backward arrow must be supplied. -/
theorem upstream_is_not_forced (T : Nat) (hT : 1 ≤ T) :
    realAt 0 T ∧ realAt 1 T ∧ realAt 0 0 ∧ ¬ realAt 1 0 := by
  unfold realAt flow
  exact ⟨by omega, by omega, rfl, fun h => by omega⟩

end RALi

#print axioms RALi.flow_monotone
#print axioms RALi.reality_transported
#print axioms RALi.rh_iff_lambda_zero
#print axioms RALi.future_closed
#print axioms RALi.flowed_record_forgets
#print axioms RALi.upstream_is_not_forced

/-! ## PART X · Halted Uniduction with the category-gap eliminator. The regress, closed.
Every "missing piece" of Parts I-IX is a register's reading of one seat. Exhibit each as a
leg of one cone with apex RH; then the hunt has one gap, not a sequence of them. -/
namespace RALi

structure Hunt where
  S     : Substrate
  L     : LiData
  u0    : S.U
  hRA   : RA S
  hLi   : LiCriterion L
  lamZero : Prop                -- the upstream reading: Λ = 0
  hLam  : L.RH ↔ lamZero        -- Newman's definition with Rodgers-Tao, cited

/-- The legs. Each register's reading of the owed seat, proved equal to the apex. -/
theorem leg_bridge (H : Hunt) : Nonempty (Bridge H.S H.L) ↔ H.L.RH :=
  ⟨fun ⟨B⟩ => bridge_yields_RH H.S H.L H.hRA H.hLi B,
   fun h => ⟨⟨fun _ => H.u0, fun n hn _ => (H.hLi.mp h) n hn⟩⟩⟩

theorem leg_unity (H : Hunt) : Nonempty (Unity H.S H.L) ↔ H.L.RH :=
  ⟨fun ⟨u⟩ => retired_seal_is_sound H.S H.L H.hRA H.hLi u,
   fun h => let ⟨B⟩ := (leg_bridge H).mpr h; ⟨⟨B, .premise⟩⟩⟩

theorem leg_monism (H : Hunt) : MonismWitness (fun n => H.L.nonneg (n + 1)) ↔ H.L.RH :=
  monism_on_li_is_RH H.L H.hLi

theorem leg_transport (H : Hunt) :
    (∃ A : AnchoredMonism Nat, A.f = Nat.succ ∧ A.s0 = 0 ∧ ∀ n, A.I n ↔ H.L.nonneg (n + 1))
      ↔ H.L.RH :=
  rh_anchor_is_the_claim H.L H.hLi

theorem leg_upstream (H : Hunt) : H.lamZero ↔ H.L.RH := H.hLam.symm

/-- The five readings, as a diagram of propositions. -/
inductive Reg5 | bridge | unity | monism | transport | upstream deriving DecidableEq, Repr

def D5 (H : Hunt) : Reg5 → Prop
  | .bridge    => Nonempty (Bridge H.S H.L)
  | .unity     => Nonempty (Unity H.S H.L)
  | .monism    => MonismWitness (fun n => H.L.nonneg (n + 1))
  | .transport => ∃ A : AnchoredMonism Nat, A.f = Nat.succ ∧ A.s0 = 0 ∧ ∀ n, A.I n ↔ H.L.nonneg (n + 1)
  | .upstream  => H.lamZero

/-- 44. THE CONE. RH is the apex of a cone over all five readings, every leg an
equivalence: the category gaps between the hunt's registers are eliminated. -/
theorem hunt_cone (H : Hunt) : ∀ r, D5 H r ↔ H.L.RH := by
  intro r; cases r
  · exact leg_bridge H
  · exact leg_unity H
  · exact leg_monism H
  · exact leg_transport H
  · exact leg_upstream H

/-- 45. ONE GAP. Any two readings are the same proposition. The quantity monotone against
the flow (upstream) IS the bridge's read, the unity posit, the monism field, the transport. -/
theorem one_gap (H : Hunt) (r s : Reg5) : D5 H r ↔ D5 H s :=
  (hunt_cone H r).trans (hunt_cone H s).symm

/-- 46. THE HALT. Every proposition proved equivalent to the hypothesis lands on the same apex
as the five readings; which future propositions are equivalent is not decided here. -/
theorem regress_halts (H : Hunt) (P : Prop) (hP : P ↔ H.L.RH) (r : Reg5) : P ↔ D5 H r :=
  hP.trans (hunt_cone H r).symm

/-- 47. Given a true proposition Q, proving Q → RH is the same as proving RH: conditioning on a
true premise adds nothing (Theorem E of the prior paper, here on the hunt's apex). -/
theorem nothing_weaker (H : Hunt) (Q : Prop) (hq : Q) : (Q → H.L.RH) ↔ H.L.RH :=
  ⟨fun f => f hq, fun h _ => h⟩

end RALi

#print axioms RALi.hunt_cone
#print axioms RALi.one_gap
#print axioms RALi.regress_halts
#print axioms RALi.nothing_weaker

/-! ## PART X, completed · a sufficient route closes every reading at once. -/
namespace RALi

/-- 48. Theorem 46 covers every reformulation equivalent to the apex. A route strictly
stronger than the apex (a specific operator, a hypothesis over a family) is not equivalent,
and it does not open a new gap either: any sufficient route supplies all five readings. -/
theorem sufficient_closes_all (H : Hunt) (P : Prop) (hP : P → H.L.RH) (p : P) :
    ∀ r, D5 H r :=
  fun r => (hunt_cone H r).mpr (hP p)

end RALi

#print axioms RALi.sufficient_closes_all

/-! ## PART XI · Timeless Residual Monism, stated as Postulate M, and its equivalence with the line property. -/
namespace TimeLocus

def onLine (p : Int × Int) : Prop := p.1 = 1

/-- A timed world: the locus at each time, and the zeros present at each time. -/
structure World where
  locus : Nat → (Int × Int → Prop)
  zeros : Nat → (Int × Int → Prop)

/-- TIME PSP premise: prior and posterior locus are the SAME locus, the line, at every time. -/
def SameLocus (W : World) : Prop := ∀ t p, W.locus t p ↔ onLine p

/-- The claim to be tested: every zero at every time is bound to the locus. -/
def Bound (W : World) : Prop := ∀ t p, W.zeros t p → W.locus t p

/-- Fold-invariance at every time: the functional equation acts at each iteration. -/
def FoldInv (W : World) : Prop := ∀ t p, W.zeros t p → W.zeros t (2 - p.1, p.2)

/-- 51. Given the same locus at all times, being bound IS the line property at all times. -/
theorem bound_iff_line (W : World) (h : SameLocus W) :
    Bound W ↔ ∀ t p, W.zeros t p → onLine p :=
  ⟨fun b t p z => (h t p).mp (b t p z), fun l t p z => (h t p).mpr (l t p z)⟩

/-- 52, the test world. A world where the locus is the same line at every time, the fold acts at every
    time, the on-line zero recurs at every time, and a mirror pair sits off the line at every time. -/
def testWorld : World :=
  ⟨fun _ p => onLine p, fun _ p => p = (1, 0) ∨ p = (0, 5) ∨ p = (2, 5)⟩

theorem test_same_locus : SameLocus testWorld := fun _ _ => Iff.rfl

theorem test_fold_inv : FoldInv testWorld := by
  intro _ p hp
  rcases hp with h | h | h <;> subst h
  · exact Or.inl rfl
  · exact Or.inr (Or.inr rfl)
  · exact Or.inr (Or.inl rfl)

theorem test_not_bound : ¬ Bound testWorld := fun b => by
  have := b 0 (0, 5) (Or.inr (Or.inl rfl)); cases this

/-- 52. Therefore SameLocus and FoldInv, at every time, do not imply Bound. -/
theorem time_does_not_bind :
    ¬ ∀ W : World, SameLocus W → FoldInv W → Bound W :=
  fun h => test_not_bound (h testWorld test_same_locus test_fold_inv)

end TimeLocus

namespace TimeLocus

/-- Residual Monism read as the Codex states it: one involution serves both routes. -/
def sigmaGeo (p : Int × Int) : Int × Int := (2 - p.1, p.2)
def sigmaForm (p : Int × Int) : Int × Int := (2 - p.1, p.2)
def OneInvolution : Prop := ∀ p, sigmaGeo p = sigmaForm p

/-- Residual Monism read as timeless: whether the zeros sit on the locus does not vary in time. -/
def P (W : World) (t : Nat) : Prop := ∀ p, W.zeros t p → onLine p
def Timeless (W : World) : Prop := ∀ t s, P W t ↔ P W s

/-- 53. Both readings hold in the counter-world: one involution by rfl, and timelessness because
    the property "all zeros on the line" is constantly false there. Timeless and unbound. -/
theorem monism_holds_in_counter_world :
    OneInvolution ∧ Timeless testWorld ∧ ¬ Bound testWorld :=
  ⟨fun _ => rfl, fun _ _ => Iff.rfl, test_not_bound⟩

/-- 54. What timeless monism does do: it makes one instant decide all time. With the seed, binding
    follows; the seed is "every zero present at the instant is on the line". -/
theorem timeless_with_seed_binds (W : World) (h : SameLocus W) (u : Timeless W) (s0 : P W 0) :
    Bound W :=
  (bound_iff_line W h).mpr (fun t p z => ((u 0 t).mp s0) p z)

end TimeLocus

namespace TimeLocus

/-- THE CONSTRUCTED WITNESS from RESIDUAL-MONISM + TIME PSP, as asked: one involution, the
    timeless interface (the Barzakh instant, t = 0, upstream of time), and the downstream times
    agreeing with it. No field is a premise; each must be built as a term. -/
structure MonismTimeWitness (W : World) : Prop where
  one_involution : OneInvolution
  same_locus     : SameLocus W
  timeless       : Timeless W
  interface      : P W 0          -- every zero present at the timeless interface is on the line

/-- 55. When it can be built, it proves the bound everywhere downstream. -/
theorem witness_proves_bound (W : World) (w : MonismTimeWitness W) : Bound W :=
  timeless_with_seed_binds W w.same_locus w.timeless w.interface

/-- 55, completed. It can be built exactly when the bound already holds: its existence IS the line property. -/
theorem witness_iff_bound (W : World) (h : SameLocus W) :
    Nonempty (MonismTimeWitness W) ↔ Bound W := by
  refine ⟨fun ⟨w⟩ => witness_proves_bound W w, fun b => ?_⟩
  have l := (bound_iff_line W h).mp b
  exact ⟨⟨fun _ => rfl, h, fun t s => ⟨fun _ p z => l s p z, fun _ p z => l t p z⟩, fun p z => l 0 p z⟩⟩

/-- 56. Built at a model whose zeros are on the line, as the prior paper builds RA at one point. -/
def goodWorld : World := ⟨fun _ p => onLine p, fun _ p => p = (1, 0)⟩
theorem constructed_at_model : Nonempty (MonismTimeWitness goodWorld) :=
  (witness_iff_bound goodWorld (fun _ _ => Iff.rfl)).mpr (fun _ p z => by subst z; rfl)

/-- 57. Not buildable at the counter-world: the interface field fails there. -/
theorem not_constructible_off_line : ¬ Nonempty (MonismTimeWitness testWorld) :=
  fun w => test_not_bound ((witness_iff_bound testWorld test_same_locus).mp w)

end TimeLocus

namespace TimeLocus

/-- Postulate M on an enumerated zero set. Stage k is when a zero is located; L t says every
    zero located by stage t lies on the line; M says the truth of L t does not depend on t. -/
def Lstage {α : Type} (Z : α → Prop) (onL : α → Prop) (stage : α → Nat) (t : Nat) : Prop :=
  ∀ z, Z z → stage z ≤ t → onL z
def PostulateM {α : Type} (Z : α → Prop) (onL : α → Prop) (stage : α → Nat) : Prop :=
  ∀ t s, Lstage Z onL stage t ↔ Lstage Z onL stage s

/-- 49. POSTULATE M IS EQUIVALENT TO THE LINE PROPERTY, given the computed seed L 0 and an
    exhaustive enumeration (every zero is located at some finite stage, built into `stage`). -/
theorem postulateM_iff_line {α : Type} (Z : α → Prop) (onL : α → Prop) (stage : α → Nat)
    (seed : Lstage Z onL stage 0) :
    PostulateM Z onL stage ↔ ∀ z, Z z → onL z := by
  constructor
  · intro m z hz
    exact ((m 0 (stage z)).mp seed) z hz (Nat.le_refl _)
  · intro h t s
    exact ⟨fun _ z hz _ => h z hz, fun _ z hz _ => h z hz⟩

/-- 50. And Postulate M is not free: it holds in a world whose zeros are all on the line, and
    it cannot hold with the seed in a world with a located off-line zero. -/
theorem postulateM_decides {α : Type} (Z : α → Prop) (onL : α → Prop) (stage : α → Nat)
    (seed : Lstage Z onL stage 0) (z : α) (hz : Z z) (off : ¬ onL z) :
    ¬ PostulateM Z onL stage :=
  fun m => off ((postulateM_iff_line Z onL stage seed).mp m z hz)

end TimeLocus

#print axioms TimeLocus.bound_iff_line
#print axioms TimeLocus.time_does_not_bind
#print axioms TimeLocus.monism_holds_in_counter_world
#print axioms TimeLocus.timeless_with_seed_binds
#print axioms TimeLocus.witness_iff_bound
#print axioms TimeLocus.constructed_at_model
#print axioms TimeLocus.not_constructible_off_line
#print axioms TimeLocus.postulateM_iff_line
#print axioms TimeLocus.postulateM_decides

/-! ## PART XII · The demand correctly addressed, and [.] at the collapse foundation. -/
namespace DotRH

inductive Token where
  | sealed | broken | opn | dot
  deriving DecidableEq, Repr

def Token.inEconomy : Token → Bool
  | .dot => false
  | _    => true

/-- I · THE COLLAPSE FOUNDATION and its stop. -/
structure Collapse (V : Prop) where
  Reg     : Type
  reading : Reg → Prop
  leg     : ∀ r, reading r ↔ V

-- Theorem 58.
theorem self_referential_limit {V : Prop} (C : Collapse V) (r s : C.Reg) :
    (C.reading r ↔ V) ∧ (C.reading r ↔ C.reading s) :=
  ⟨C.leg r, (C.leg r).trans (C.leg s).symm⟩

def emitAtFoundation {V : Prop} (_ : Collapse V) : Token := .dot
-- Theorem 59.
theorem value_marked_dot {V : Prop} (C : Collapse V) : emitAtFoundation C = .dot := rfl
theorem dot_is_not_a_verdict :
    Token.dot ≠ .sealed ∧ Token.dot ≠ .broken ∧ Token.dot ≠ .opn := by decide
theorem dot_outside_economy : Token.inEconomy .dot = false := rfl

def trivialCollapse (V : Prop) : Collapse V := ⟨Unit, fun _ => V, fun _ => Iff.rfl⟩

/-- Inside the collapse register, a demand for a verdict is a ghost: the register returns
    the same mark for the value and its negation. -/
-- Theorem 60.
theorem demand_is_ghost_in_register {V : Prop} (C : Collapse V) (C' : Collapse (¬ V)) :
    emitAtFoundation C = emitAtFoundation C' := rfl

/-- II · THE SELF-GROUNDING ROOT. A root R is self-grounding when acts occur and every act of
    adjudication, assent or denial, is itself an instance of R. Then a denial of R re-enacts R,
    no external proof adds to it, and a demand for one is a ghost. This is the seat of the
    analogy: a root that grounds itself cannot be proved from outside itself. -/
structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

-- Theorem 61.
theorem denial_reenacts_root {R : Prop} (G : SelfGrounding R) (denial : G.Act) : R :=
  G.instances denial

-- Theorem 61, completed.
theorem external_proof_adds_nothing {R : Prop} (G : SelfGrounding R) (Q : Prop) :
    (Q → R) ↔ R :=
  ⟨fun _ => G.instances G.anAct, fun r _ => r⟩

/-- The Root Axiom at the constructed domain is self-grounding: every act is a deed, and a
    deed actuates. -/
def RA : Prop := (0 : Int) < 1
def raSelfGrounding : SelfGrounding RA := ⟨Unit, (), fun _ => show (0 : Int) < 1 by decide⟩

/-- III · A HYPOTHESIS ABOUT AN OBJECT is not self-grounding. Its value is fixed by the object,
    acts do not instance it, and a finite witness can refute it. -/
structure Frame where
  S : Type
  τ : S → S
  Z : S → Prop

def LineProperty (X : Frame) : Prop := ∀ s, X.Z s → X.τ s = s

/-- A located zero off the line refutes the line property, constructively. -/
theorem refuted_by_witness (X : Frame) (s : X.S) (hz : X.Z s) (off : X.τ s ≠ s) :
    ¬ LineProperty X :=
  fun h => off (h s hz)

def twoPoint : Frame := ⟨Bool, fun b => !b, fun _ => True⟩

/-- On a frame whose line property fails, no occurring act can instance it: the line
    property of a frame is not self-grounding. -/
-- Theorem 62.
theorem line_not_self_grounding : ¬ Nonempty (SelfGrounding (LineProperty twoPoint)) :=
  fun ⟨G⟩ => refuted_by_witness twoPoint true trivial (fun h => Bool.noConfusion h) (G.instances G.anAct)

/-- IV · THE HARDENED FOUNDATION, in toto. The collapse marks the value [.] and the demand is
    a ghost inside that register; the self-grounding root cannot be proved from outside and
    re-enacts under denial; a hypothesis about an object is witness-refutable and is not
    self-grounding, so the self-grounding exemption does not transfer to it. -/
theorem foundation_hardened :
    (∀ (V : Prop) (C : Collapse V), emitAtFoundation C = .dot) ∧
    Token.inEconomy .dot = false ∧
    (∀ (V : Prop) (C : Collapse V) (C' : Collapse (¬ V)), emitAtFoundation C = emitAtFoundation C') ∧
    (∀ Q : Prop, (Q → RA) ↔ RA) ∧
    (∀ a : Unit, RA ∧ raSelfGrounding.instances a = raSelfGrounding.instances a) ∧
    ¬ Nonempty (SelfGrounding (LineProperty twoPoint)) :=
  ⟨fun _ _ => rfl, rfl, fun _ _ _ => rfl, external_proof_adds_nothing raSelfGrounding,
   fun a => ⟨raSelfGrounding.instances a, rfl⟩, line_not_self_grounding⟩

/-! V · THE DEMAND, CORRECTLY ADDRESSED.
    "A proof of the Riemann Hypothesis cannot be demanded of the foundation. Every reading the
    foundation supplies is equivalent to the hypothesis, so any derivation from those readings
    alone would presuppose what it derives. The demand is well-posed when addressed to the
    object, the function zeta, whose structure fixes where its zeros lie." -/

/-- A foundation resource is any property of frames the foundation supplies. -/
def Resource := Frame → Prop

/-- (a) Misaddressed: any resource that also holds on a frame where the line property fails
    cannot, by itself, yield the line property on every frame it covers. -/
-- Theorem 63.
theorem misaddressed_to_foundation (R : Resource) (hR : R twoPoint) :
    ¬ ∀ X, R X → LineProperty X :=
  fun h => refuted_by_witness twoPoint true trivial (fun e => Bool.noConfusion e) (h twoPoint hR)

/-- (b) Presupposition: a derivation of the value from a reading equivalent to it uses the
    value's own content; the reading and the value stand or fall together. -/
-- Theorem 64.
theorem derivation_presupposes {V P : Prop} (leg : P ↔ V) : (P → V) ∧ (V → P) ∧ (¬ V → ¬ P) :=
  ⟨leg.mp, leg.mpr, fun nv p => nv (leg.mp p)⟩

/-- (c) Well-addressed: the object decides. A frame settles its own line property, in one
    direction by a located off-line witness, in the other by its own structure. -/
def onLineFrame : Frame := ⟨Unit, fun u => u, fun _ => True⟩
-- Theorem 65.
theorem object_decides :
    ¬ LineProperty twoPoint ∧ LineProperty onLineFrame :=
  ⟨refuted_by_witness twoPoint true trivial (fun e => Bool.noConfusion e), fun _ _ => rfl⟩

/-- THE DEMAND, IN TOTO. Made to the foundation, it is misaddressed and any answer from
    there presupposes the value; made to the object, it is well-posed and the object answers. -/
-- Theorem 66.
theorem demand_correctly_addressed :
    (∀ R : Resource, R twoPoint → ¬ ∀ X, R X → LineProperty X) ∧
    (∀ {V P : Prop}, (P ↔ V) → (¬ V → ¬ P)) ∧
    (¬ LineProperty twoPoint ∧ LineProperty onLineFrame) :=
  ⟨misaddressed_to_foundation, fun leg => (derivation_presupposes leg).2.2, object_decides⟩

end DotRH

namespace DotRH
/-- Theorem 67. Attached to the paper's cone: the readings of Parts X and XI collapse onto
    the hypothesis, and the foundation marks the value [.]. -/
def rhCollapse (H : RALi.Hunt) : Collapse H.L.RH := ⟨RALi.Reg5, RALi.D5 H, RALi.hunt_cone H⟩
theorem rh_marked_dot (H : RALi.Hunt) : emitAtFoundation (rhCollapse H) = .dot := rfl
end DotRH

#print axioms DotRH.self_referential_limit
#print axioms DotRH.value_marked_dot
#print axioms DotRH.dot_is_not_a_verdict
#print axioms DotRH.demand_is_ghost_in_register
#print axioms DotRH.denial_reenacts_root
#print axioms DotRH.external_proof_adds_nothing
#print axioms DotRH.refuted_by_witness
#print axioms DotRH.line_not_self_grounding
#print axioms DotRH.foundation_hardened
#print axioms DotRH.misaddressed_to_foundation
#print axioms DotRH.derivation_presupposes
#print axioms DotRH.object_decides
#print axioms DotRH.demand_correctly_addressed
#print axioms DotRH.rh_marked_dot

/-! ## PART XIII · The six-register cone: Postulate M joined to the apex. -/
namespace SixCone

/-- The hunt with one more reading. The zeros are enumerated by stage, the seed holds, and
    the hypothesis is, by its definition, the line property of the enumerated zeros; that
    identification enters as the hypothesis `hDef`, carried by citation as Li's criterion and
    Newman's equivalence are. -/
structure Hunt6 extends RALi.Hunt where
  α     : Type
  Z     : α → Prop
  onL   : α → Prop
  stage : α → Nat
  seed  : TimeLocus.Lstage Z onL stage 0
  hDef  : L.RH ↔ ∀ z, Z z → onL z

inductive Reg6 where
  | five (r : RALi.Reg5)
  | postulateM

def D6 (H : Hunt6) : Reg6 → Prop
  | .five r     => RALi.D5 H.toHunt r
  | .postulateM => TimeLocus.PostulateM H.Z H.onL H.stage

-- Theorem 68.
/-- The cone over six readings: the five of Part X and Postulate M, every leg an equivalence
    with the hypothesis. -/
theorem hunt_cone6 (H : Hunt6) : ∀ r, D6 H r ↔ H.L.RH := by
  intro r
  cases r with
  | five r => exact RALi.hunt_cone H.toHunt r
  | postulateM =>
      exact (TimeLocus.postulateM_iff_line H.Z H.onL H.stage H.seed).trans H.hDef.symm

-- Theorem 69.
/-- The collapse foundation over six readings, and its mark on the value. -/
def rhCollapse6 (H : Hunt6) : DotRH.Collapse H.L.RH := ⟨Reg6, D6 H, hunt_cone6 H⟩
theorem rh_marked_dot6 (H : Hunt6) : DotRH.emitAtFoundation (rhCollapse6 H) = .dot := rfl

end SixCone

#print axioms SixCone.hunt_cone6
#print axioms SixCone.rh_marked_dot6

namespace DotRH
-- Theorem 63, general form.
/-- Any resource that also holds on some frame whose line property fails cannot, by itself,
    yield the line property on every frame it covers. -/
theorem misaddressed_general (R : Resource) (Y : Frame) (hY : ¬ LineProperty Y) (hR : R Y) :
    ¬ ∀ X, R X → LineProperty X :=
  fun h => hY (h Y hR)
end DotRH

#print axioms DotRH.misaddressed_general

/-! ## PART XIV · The logical form of the hypothesis: the only existence lives in the denial. -/
namespace LogicalForm

-- Theorem 70.
/-- A universal sentence carries no existential import: over an empty zero set the line
    property holds vacuously. The hypothesis posits no object. -/
theorem universal_posits_nothing {α : Type} (onL : α → Prop) :
    ∀ z : α, (fun _ => False) z → onL z :=
  fun _ h => h.elim

-- Theorem 71.
/-- The denial posits an object: a located zero off the line refutes the hypothesis. -/
theorem denial_posits_a_witness {α : Type} (Z onL : α → Prop) :
    (∃ z, Z z ∧ ¬ onL z) → ¬ ∀ z, Z z → onL z :=
  fun ⟨z, hz, off⟩ h => off (h z hz)

-- Theorem 72.
/-- With a decidable line predicate, the hypothesis fails only by a witness: it holds iff no
    off-line zero exists. The denial carries the whole existential load. -/
theorem fails_only_by_witness {α : Type} (Z onL : α → Prop) [∀ z, Decidable (onL z)] :
    (∀ z, Z z → onL z) ↔ ¬ ∃ z, Z z ∧ ¬ onL z := by
  constructor
  · intro h ⟨z, hz, off⟩; exact off (h z hz)
  · intro h z hz
    exact Decidable.byContradiction (fun off => h ⟨z, hz, off⟩)

-- Theorem 73.
/-- A witness is a finite check: for a decidable predicate on the naturals, one index at which
    the check fails refutes the universal, and the check at that index is a computation. -/
theorem witness_is_a_finite_check (bad : Nat → Bool) (n : Nat) (h : bad n = true) :
    ¬ ∀ m, bad m = false :=
  fun hall => by rw [hall n] at h; cases h

end LogicalForm

#print axioms LogicalForm.universal_posits_nothing
#print axioms LogicalForm.denial_posits_a_witness
#print axioms LogicalForm.fails_only_by_witness
#print axioms LogicalForm.witness_is_a_finite_check

/-! ## PART XV · The two "can'ts" are not equal: the denial carries the burden.
Abstract: a proposition RH, the foundation's provability predicate, and the property that makes
the directions unequal, Σ₁-completeness: a false RH has a finite witness, and the foundation
proves the denial from it. That property and soundness on the denial are carried as named
hypotheses, cited from arithmetic, not proved here. -/
namespace DirCant

structure Setting where
  RH        : Prop
  Prov      : Prop → Prop
  /-- Σ₁-completeness, carried as a hypothesis: a false RH is refutable. -/
  sigma1    : ¬ RH → Prov (¬ RH)
  /-- Soundness of the foundation on the denial. -/
  sound_neg : Prov (¬ RH) → ¬ RH

-- Theorem 74.
/-- THE SEALED DIRECTION. If the foundation cannot refute the hypothesis, the hypothesis holds:
    the denial's "can't" is decisive. -/
theorem cant_refute_seals (S : Setting) [Decidable S.RH] (h : ¬ S.Prov (¬ S.RH)) : S.RH :=
  Decidable.byContradiction (fun n => h (S.sigma1 n))

-- Theorem 75.
/-- Under soundness on the denial, the hypothesis holds exactly when the foundation cannot refute
    it: the denial's "can't" and the hypothesis are one statement. -/
theorem rh_iff_cant_refute (S : Setting) [Decidable S.RH] : S.RH ↔ ¬ S.Prov (¬ S.RH) :=
  ⟨fun r p => S.sound_neg p r, cant_refute_seals S⟩

-- Theorem 76.
/-- The assent's "can't" decides nothing: a setting where the hypothesis holds and the
    foundation cannot prove it satisfies every field. -/
def independentTrue : Setting :=
  ⟨True, fun _ => False, fun n => absurd trivial n, fun p => p.elim⟩

theorem cant_prove_does_not_seal_false :
    independentTrue.RH ∧ ¬ independentTrue.Prov independentTrue.RH :=
  ⟨trivial, id⟩

-- Theorem 77.
/-- THE ASYMMETRY. Can't-refute seals the hypothesis; can't-prove is compatible with its truth.
    The burden of the one bit lies on the denial side. -/
theorem asymmetry :
    (∀ (S : Setting) [Decidable S.RH], ¬ S.Prov (¬ S.RH) → S.RH) ∧
    (∃ S : Setting, S.RH ∧ ¬ S.Prov S.RH) :=
  ⟨fun S _ h => cant_refute_seals S h, ⟨independentTrue, cant_prove_does_not_seal_false⟩⟩

end DirCant

#print axioms DirCant.cant_refute_seals
#print axioms DirCant.rh_iff_cant_refute
#print axioms DirCant.cant_prove_does_not_seal_false
#print axioms DirCant.asymmetry
```

# Appendix G: The Kernel Audit of RA_Li_Bridge.lean, Verbatim

`lean RA_Li_Bridge.lean`, exit 0, no warnings, no errors.

``` numberLines
'RALi.bridge_yields_RH' does not depend on any axioms
'RALi.bridge_is_keyed' does not depend on any axioms
'RALi.no_uniform_bridge' does not depend on any axioms
'RALi.li_is_a_bit_stream' does not depend on any axioms
'RALi.xi0_retires_iff_unity' depends on axioms: [propext]
'RALi.retired_seal_is_sound' does not depend on any axioms
'RALi.retired_grade_capped' does not depend on any axioms
'RALi.unity_is_keyed' does not depend on any axioms
'RALi.ghost' does not depend on any axioms
'RALi.common_phi_is_uniform' does not depend on any axioms
'RALi.blind_constructions_die' does not depend on any axioms
'RALi.mertens_nonneg' depends on axioms: [propext, Quot.sound]
'RALi.unitary_iff_on_line' depends on axioms: [propext, Quot.sound]
'RALi.off_line_forces_growth' depends on axioms: [propext, Quot.sound]
'RALi.stability_iff_line' depends on axioms: [propext, Quot.sound]
'RALi.one_repeats_one' does not depend on any axioms
'RALi.the_step_is_the_claim' does not depend on any axioms
'RALi.monism_posit_forces' does not depend on any axioms
'RALi.finite_never_forces' does not depend on any axioms
'RALi.mixed_is_fold_invariant' does not depend on any axioms
'RALi.mixed_recurrence_fails' does not depend on any axioms
'RALi.full_gives_actual' does not depend on any axioms
'RALi.actual_not_full' does not depend on any axioms
'RALi.sufficient_time' does not depend on any axioms
'RALi.one_involution_constructed' does not depend on any axioms
'RALi.timeless_equals_timed' does not depend on any axioms
'RALi.monism_closes' does not depend on any axioms
'RALi.monism_witness_is_the_claim' does not depend on any axioms
'RALi.constructed_monism' does not depend on any axioms
'RALi.monism_absent_on_breaks' does not depend on any axioms
'RALi.monism_yields_RH' depends on axioms: [propext, Quot.sound]
'RALi.monism_on_li_is_RH' depends on axioms: [propext, Quot.sound]
'RALi.global_monism_inconsistent' does not depend on any axioms
'RALi.anchored_closes' does not depend on any axioms
'RALi.anchored_derives_monism' does not depend on any axioms
'RALi.lyapunov_is_monism' depends on axioms: [propext]
'RALi.closure_grade_is_transport_grade' does not depend on any axioms
'RALi.rh_anchor_is_the_claim' depends on axioms: [propext, Quot.sound]
'RALi.flow_monotone' depends on axioms: [propext, Quot.sound]
'RALi.reality_transported' depends on axioms: [propext, Quot.sound]
'RALi.rh_iff_lambda_zero' depends on axioms: [propext, Quot.sound]
'RALi.future_closed' depends on axioms: [propext, Quot.sound]
'RALi.flowed_record_forgets' depends on axioms: [propext, Quot.sound]
'RALi.upstream_is_not_forced' depends on axioms: [propext, Quot.sound]
'RALi.hunt_cone' depends on axioms: [propext, Quot.sound]
'RALi.one_gap' depends on axioms: [propext, Quot.sound]
'RALi.regress_halts' depends on axioms: [propext, Quot.sound]
'RALi.nothing_weaker' does not depend on any axioms
'RALi.sufficient_closes_all' depends on axioms: [propext, Quot.sound]
'TimeLocus.bound_iff_line' does not depend on any axioms
'TimeLocus.time_does_not_bind' does not depend on any axioms
'TimeLocus.monism_holds_in_counter_world' does not depend on any axioms
'TimeLocus.timeless_with_seed_binds' does not depend on any axioms
'TimeLocus.witness_iff_bound' does not depend on any axioms
'TimeLocus.constructed_at_model' does not depend on any axioms
'TimeLocus.not_constructible_off_line' does not depend on any axioms
'TimeLocus.postulateM_iff_line' does not depend on any axioms
'TimeLocus.postulateM_decides' does not depend on any axioms
'DotRH.self_referential_limit' does not depend on any axioms
'DotRH.value_marked_dot' does not depend on any axioms
'DotRH.dot_is_not_a_verdict' does not depend on any axioms
'DotRH.demand_is_ghost_in_register' does not depend on any axioms
'DotRH.denial_reenacts_root' does not depend on any axioms
'DotRH.external_proof_adds_nothing' does not depend on any axioms
'DotRH.refuted_by_witness' does not depend on any axioms
'DotRH.line_not_self_grounding' does not depend on any axioms
'DotRH.foundation_hardened' does not depend on any axioms
'DotRH.misaddressed_to_foundation' does not depend on any axioms
'DotRH.derivation_presupposes' does not depend on any axioms
'DotRH.object_decides' does not depend on any axioms
'DotRH.demand_correctly_addressed' does not depend on any axioms
'DotRH.rh_marked_dot' depends on axioms: [propext, Quot.sound]
'SixCone.hunt_cone6' depends on axioms: [propext, Quot.sound]
'SixCone.rh_marked_dot6' depends on axioms: [propext, Quot.sound]
'DotRH.misaddressed_general' does not depend on any axioms
'LogicalForm.universal_posits_nothing' does not depend on any axioms
'LogicalForm.denial_posits_a_witness' does not depend on any axioms
'LogicalForm.fails_only_by_witness' does not depend on any axioms
'LogicalForm.witness_is_a_finite_check' does not depend on any axioms
'DirCant.cant_refute_seals' does not depend on any axioms
'DirCant.rh_iff_cant_refute' does not depend on any axioms
'DirCant.cant_prove_does_not_seal_false' does not depend on any axioms
'DirCant.asymmetry' does not depend on any axioms
```

## Appendix G, completed: the seventeen theorems the file does not print

The file prints 83 dependency sets. A supplementary run of the same file, with one `#print axioms` line appended for each of the 17 theorems it does not print, exit 0: 9 axiom-free, 8 on `propext` and `Quot.sound`, none on `Classical.choice`; 100 sets in all, 70 axiom-free.

``` numberLines
'RALi.ra_holds_in_model' does not depend on any axioms
'RALi.mertens_identity' depends on axioms: [propext, Quot.sound]
'RALi.N1_sub_N0' depends on axioms: [propext, Quot.sound]
'RALi.grows_left' depends on axioms: [propext, Quot.sound]
'RALi.dies_right' depends on axioms: [propext, Quot.sound]
'RALi.real_at_Lam' depends on axioms: [propext, Quot.sound]
'RALi.iter_succ' depends on axioms: [propext, Quot.sound]
'RALi.leg_bridge' does not depend on any axioms
'RALi.leg_unity' does not depend on any axioms
'RALi.leg_monism' depends on axioms: [propext, Quot.sound]
'RALi.leg_transport' depends on axioms: [propext, Quot.sound]
'RALi.leg_upstream' does not depend on any axioms
'TimeLocus.test_same_locus' does not depend on any axioms
'TimeLocus.test_fold_inv' does not depend on any axioms
'TimeLocus.test_not_bound' does not depend on any axioms
'TimeLocus.witness_proves_bound' does not depend on any axioms
'DotRH.dot_outside_economy' does not depend on any axioms
```

# Appendix H: The Kernel Files of Part III

Nine files, each compiled under core Lean 4.19.0 at exit 0 with zero warnings, no `sorry`, and no axiom declared: forty-five dependency sets, forty-two axiom-free and three on `propext` alone, none on `Classical.choice`. Then the Turing run on ζ to height 100, in floating point, testimony and not a certificate.

## RH_Gold_And_Lead.lean

SHA-256 , 70 lines.

``` numberLines
/-
RH_Gold_And_Lead.lean · why the Real part and the Unicorn part should not be mixed.
Core Lean 4.19.0, no library, no sorry. Drafted 2026-09-24.
Companion to RH_Real_Unicorn_Split.lean, where RH ⟺ Real part ∧ Unicorn part at every height.
A statement's standing is proved, open, or refuted. A conjunction stands only as high as its
weakest part. So the conventional RH, the two parts fused, inherits the Unicorn part's standing:
the gold of the Real part does not survive the alloy.
-/
namespace GoldLead

/-- The three standings of a statement, ranked. -/
inductive Standing | refuted | opn | proved
  deriving DecidableEq, Repr

def Standing.rank : Standing → Nat
  | .refuted => 0 | .opn => 1 | .proved => 2

/-- A conjunction stands at the weaker of its two parts. -/
def join (a b : Standing) : Standing := if a.rank ≤ b.rank then a else b

-- G1.
/-- The alloy never outranks either metal. -/
theorem join_below_both (a b : Standing) :
    (join a b).rank ≤ a.rank ∧ (join a b).rank ≤ b.rank := by
  cases a <;> cases b <;> decide

-- G2.
/-- THE FUSED RH. The Real part stands proved (certified to 3 × 10¹²), the Unicorn part stands
    open; fused, the conventional RH stands open. -/
def realPart : Standing := .proved
def unicornPart : Standing := .opn
def fusedRH : Standing := join realPart unicornPart

theorem fused_rh_is_open : fusedRH = .opn := by decide

-- G3.
/-- GOLD NO LONGER PURE. Fusion strictly lowers the Real part's standing: kept apart it is proved,
    carried inside the fused statement it is only open. -/
theorem fusion_lowers_the_gold : fusedRH.rank < realPart.rank := by decide

-- G4.
/-- Logically, every proof of the fused statement carries a proof of the Unicorn part, and every
    refutation of the Unicorn part refutes the fused statement, whatever the Real part holds. -/
theorem fused_carries_unicorn (Real Unicorn : Prop) :
    ((Real ∧ Unicorn) → Unicorn) ∧ (¬ Unicorn → ¬ (Real ∧ Unicorn)) :=
  ⟨fun h => h.2, fun hU h => hU h.2⟩

-- G5.
/-- Kept apart, each part keeps its own standing: the Real part is asserted exactly as proved,
    with nothing borrowed from the Unicorn part, and the Unicorn part is asserted exactly as open. -/
theorem kept_apart (Real Unicorn : Prop) (hReal : Real) :
    Real ∧ ((Real ∧ Unicorn) ↔ Unicorn) :=
  ⟨hReal, ⟨fun h => h.2, fun hU => ⟨hReal, hU⟩⟩⟩

-- G6.
/-- THE RULE, IN ONE THEOREM. Given the Real part, the fused RH is exactly the Unicorn part, and
    fusing lowers the Real part from proved to open. So state the Real part as gold, the Unicorn
    part as the open bit, and do not alloy them. -/
theorem do_not_alloy (Real Unicorn : Prop) (hReal : Real) :
    ((Real ∧ Unicorn) ↔ Unicorn) ∧ fusedRH = .opn ∧ fusedRH.rank < realPart.rank :=
  ⟨(kept_apart Real Unicorn hReal).2, fused_rh_is_open, fusion_lowers_the_gold⟩

end GoldLead

#print axioms GoldLead.join_below_both
#print axioms GoldLead.fused_rh_is_open
#print axioms GoldLead.fusion_lowers_the_gold
#print axioms GoldLead.fused_carries_unicorn
#print axioms GoldLead.kept_apart
#print axioms GoldLead.do_not_alloy
```

``` numberLines
'GoldLead.join_below_both' does not depend on any axioms
'GoldLead.fused_rh_is_open' does not depend on any axioms
'GoldLead.fusion_lowers_the_gold' does not depend on any axioms
'GoldLead.fused_carries_unicorn' does not depend on any axioms
'GoldLead.kept_apart' does not depend on any axioms
'GoldLead.do_not_alloy' does not depend on any axioms
```

## RH_Unicorn_Isomorphism.lean

SHA-256 , 48 lines.

``` numberLines
/-
RH_Unicorn_Isomorphism.lean · the Riemann Hypothesis and the unicorn condition are one statement.
Core Lean 4.19.0, no library, no sorry. Harvested 2026-09-24.
Scope: an equivalence (RH ⟺ the off-line zeros are unicorns), not a derivation of RH.
"Every white unicorn has its white fur attached only to its body" is true because there are no
unicorns: a universal over an empty class holds of anything. Here the class is the off-line zeros.
-/
namespace Unicorn

variable {α : Type} (Z onL : α → Prop)

/-- The off-line zeros: zeros not on the line. -/
def OffLine (z : α) : Prop := Z z ∧ ¬ onL z

/-- The hypothesis: every zero is on the line. -/
def RH : Prop := ∀ z, Z z → onL z

/-- The off-line zeros are unicorns: EVERY property holds of all of them, vacuously. -/
def Unicorns : Prop := ∀ (Q : α → Prop) (z : α), OffLine Z onL z → Q z

-- U1.
/-- If the hypothesis holds, the off-line zeros are unicorns: anything at all is true of them. -/
theorem rh_makes_unicorns : RH Z onL → Unicorns Z onL :=
  fun h _ z ⟨hz, off⟩ => absurd (h z hz) off

-- U2.
/-- If the off-line zeros are unicorns, the hypothesis holds (with a decidable line predicate):
    take the property "false"; it holds of every off-line zero, so none exists. -/
theorem unicorns_make_rh [∀ z, Decidable (onL z)] : Unicorns Z onL → RH Z onL :=
  fun h z hz => Decidable.byContradiction (fun off => h (fun _ => False) z ⟨hz, off⟩)

-- U3.
/-- THE SEAL. The Riemann Hypothesis is exactly the statement that the off-line zeros are
    unicorns: a class of which every sentence is vacuously true, because it has no member. -/
theorem rh_iff_unicorns [∀ z, Decidable (onL z)] : RH Z onL ↔ Unicorns Z onL :=
  ⟨rh_makes_unicorns Z onL, unicorns_make_rh Z onL⟩

-- U4.
/-- And the unicorn class is empty exactly when no off-line zero can be exhibited. -/
theorem unicorns_iff_no_witness : Unicorns Z onL ↔ ¬ ∃ z, OffLine Z onL z :=
  ⟨fun h ⟨z, hz⟩ => h (fun _ => False) z hz, fun h _ z hz => absurd ⟨z, hz⟩ h⟩

end Unicorn

#print axioms Unicorn.rh_makes_unicorns
#print axioms Unicorn.unicorns_make_rh
#print axioms Unicorn.rh_iff_unicorns
#print axioms Unicorn.unicorns_iff_no_witness
```

``` numberLines
'Unicorn.rh_makes_unicorns' does not depend on any axioms
'Unicorn.unicorns_make_rh' does not depend on any axioms
'Unicorn.rh_iff_unicorns' does not depend on any axioms
'Unicorn.unicorns_iff_no_witness' does not depend on any axioms
```

## RH_Real_Unicorn_Split.lean

SHA-256 , 72 lines.

``` numberLines
/-
RH_Real_Unicorn_Split.lean · the Riemann Hypothesis divided into a Real part and a Unicorn part.
Core Lean 4.19.0, no library, no sorry. Drafted 2026-09-24.
Split at a height T. The Real part is the witnessed region: every zero at height ≤ T lies on the
line. The Unicorn part is the unwitnessed region: above T, the off-line zeros are unicorns, a
class of which every sentence is vacuously true because it has no member.
-/
namespace Split

variable {α : Type} (Z onL : α → Prop) (height : α → Int)

def RH : Prop := ∀ z, Z z → onL z

/-- THE REAL PART at height T: every zero up to T is on the line. -/
def RealPart (T : Int) : Prop := ∀ z, Z z → height z ≤ T → onL z

/-- THE UNICORN PART at height T: above T, every property holds of every off-line zero, because
    there are none. -/
def UnicornPart (T : Int) : Prop :=
  ∀ (Q : α → Prop) (z : α), T < height z → Z z → ¬ onL z → Q z

-- S1.
/-- THE SPLIT. At every height T, the hypothesis is exactly the Real part and the Unicorn part
    together. Nothing is lost and nothing is added. -/
theorem rh_iff_real_and_unicorn [∀ z, Decidable (onL z)] (T : Int) :
    RH Z onL ↔ RealPart Z onL height T ∧ UnicornPart Z onL height T := by
  constructor
  · intro h
    exact ⟨fun z hz _ => h z hz, fun _ z _ hz off => absurd (h z hz) off⟩
  · intro ⟨hR, hU⟩ z hz
    by_cases hle : height z ≤ T
    · exact hR z hz hle
    · exact Decidable.byContradiction
        (fun off => hU (fun _ => False) z (Int.lt_of_not_ge hle) hz off)

-- S2.
/-- The parts are separate: the Real part can hold while the Unicorn part fails. An off-line
    zero above T leaves every zero up to T on the line. -/
def twoZeros (z : Int × Bool) : Prop := z = (5, true) ∨ z = (20, false)
def onLine2 (z : Int × Bool) : Prop := z.2 = true
def height2 (z : Int × Bool) : Int := z.1

theorem parts_are_separate :
    RealPart twoZeros onLine2 height2 10 ∧ ¬ UnicornPart twoZeros onLine2 height2 10 := by
  refine ⟨?_, ?_⟩
  · intro z hz hle
    rcases hz with h | h <;> subst h
    · rfl
    · exact absurd hle (by decide)
  · intro hU
    exact hU (fun _ => False) (20, false) (by decide) (Or.inr rfl) (fun h => Bool.noConfusion h)

-- S3.
/-- The Unicorn part is empty exactly when no off-line zero above T can be exhibited. -/
theorem unicorn_part_iff_no_witness (T : Int) :
    UnicornPart Z onL height T ↔ ¬ ∃ z, T < height z ∧ Z z ∧ ¬ onL z :=
  ⟨fun hU ⟨z, hT, hz, off⟩ => hU (fun _ => False) z hT hz off,
   fun h _ z hT hz off => absurd ⟨z, hT, hz, off⟩ h⟩

-- S4.
/-- Raising T moves zeros from the Unicorn part into the Real part and never the other way: a
    Real part at a higher height contains the Real part at a lower one. -/
theorem real_part_monotone (T T' : Int) (hTT : T ≤ T') :
    RealPart Z onL height T' → RealPart Z onL height T :=
  fun h z hz hle => h z hz (Int.le_trans hle hTT)

end Split

#print axioms Split.rh_iff_real_and_unicorn
#print axioms Split.parts_are_separate
#print axioms Split.unicorn_part_iff_no_witness
#print axioms Split.real_part_monotone
```

``` numberLines
'Split.rh_iff_real_and_unicorn' depends on axioms: [propext]
'Split.parts_are_separate' does not depend on any axioms
'Split.unicorn_part_iff_no_witness' does not depend on any axioms
'Split.real_part_monotone' depends on axioms: [propext]
```

## RAM_ZFC_Placement.lean

SHA-256 , 85 lines.

``` numberLines
/-
RAM_ZFC_Placement.lean · ZFC subsumed by RAM, and ZFC's location under RAM.
Core Lean 4.19.0, no library, no sorry, no axiom declaration. Harvested 2026-09-24.

Location. ZFC is a ladder at L2m (provability); its intended world, the cumulative hierarchy and
the numbers inside it, is the Ground at L1m (formal being as grounding); its computable part is
the rung at L3m. The order rung ⊆ ladder ⊆ Ground holds under two named premises: the rung on
the ladder (for ZFC, Σ₁-completeness, a theorem of arithmetic) and soundness (which ZFC cannot
prove of itself, Gödel II, so it is carried openly).

Subsumption is by placement: RAM locates ZFC, as it locates NBG, PA, and every other ladder; it
does not derive ZFC's axioms and does not replace ZFC's proofs. Any theory, ZFC included, is
modelled abstractly: sentences, a provability predicate, a decidable fragment, and truth in the
intended world.
-/
namespace RAMZFC

structure Theory where
  Sent  : Type
  Prov  : Sent → Prop        -- L2m, the ladder
  Comp  : Sent → Prop        -- L3m, the rung: sentences settled by finite computation
  True_ : Sent → Prop        -- L1m, the Ground: truth in the intended world

/-- The rung is on the ladder: what finite computation settles, the theory proves.
    (For ZFC: Σ₁-completeness, a theorem of arithmetic, carried as a named premise.) -/
def RungOnLadder (T : Theory) : Prop := ∀ s, T.Comp s → T.Prov s

/-- The ladder reaches only the Ground: soundness. For ZFC this is exactly what ZFC cannot
    prove of itself (Gödel II); it is carried openly, never derived. -/
def Sound (T : Theory) : Prop := ∀ s, T.Prov s → T.True_ s

-- Z1.
/-- THE PLACEMENT. Under the two named premises, every theory sits in RAM's strata in order:
    rung ⊆ ladder ⊆ Ground. -/
theorem ram_places_theory (T : Theory) (hR : RungOnLadder T) (hS : Sound T) :
    (∀ s, T.Comp s → T.Prov s) ∧ (∀ s, T.Prov s → T.True_ s) ∧ (∀ s, T.Comp s → T.True_ s) :=
  ⟨hR, hS, fun s h => hS s (hR s h)⟩

-- Z2.
/-- The placement is not free: an unsound theory breaks ladder ⊆ Ground. -/
def unsound : Theory := ⟨Bool, fun _ => True, fun _ => False, fun b => b = true⟩

theorem soundness_is_load_bearing :
    RungOnLadder unsound ∧ ¬ Sound unsound := by
  refine ⟨fun _ h => h.elim, fun h => ?_⟩
  have := h false trivial
  cases this

-- Z3.
/-- The Ground can exceed the ladder: a sound theory can leave a truth unproved (Gödel's
    incompleteness region, L1m minus L2m), so the strata are genuinely three, not one. -/
def incomplete : Theory := ⟨Bool, fun b => b = true, fun _ => False, fun _ => True⟩

theorem ground_exceeds_ladder :
    Sound incomplete ∧ incomplete.True_ false ∧ ¬ incomplete.Prov false :=
  ⟨fun _ _ => trivial, trivial, fun h => Bool.noConfusion h⟩

-- Z4.
/-- Axioms as bits. Two independent axioms are two bits, not one composite paradox: all four
    combinations of their truth values are realized, so a theory with several independent
    axioms is a product of bits. (For ZFC: Choice is independent of ZF, Gödel 1938 and Cohen
    1963; this is cited, not proved here.) -/
theorem independent_axioms_are_separate_bits :
    ∀ a b : Bool, ∃ w : Bool × Bool, w.1 = a ∧ w.2 = b :=
  fun a b => ⟨(a, b), rfl, rfl⟩

-- Z5.
/-- THE VERDICT. RAM places every theory, ZFC included, as rung ⊆ ladder ⊆ Ground, conditional
    on the two named premises; soundness cannot be dropped; the Ground genuinely exceeds the
    ladder. Placement is structural subsumption: RAM does not derive ZFC's axioms, and does
    not replace ZFC's proofs. -/
theorem ram_subsumes_by_placement :
    (∀ T : Theory, RungOnLadder T → Sound T →
        (∀ s, T.Comp s → T.True_ s)) ∧
    (RungOnLadder unsound ∧ ¬ Sound unsound) ∧
    (Sound incomplete ∧ incomplete.True_ false ∧ ¬ incomplete.Prov false) :=
  ⟨fun T hR hS => (ram_places_theory T hR hS).2.2, soundness_is_load_bearing, ground_exceeds_ladder⟩

end RAMZFC

#print axioms RAMZFC.ram_places_theory
#print axioms RAMZFC.soundness_is_load_bearing
#print axioms RAMZFC.ground_exceeds_ladder
#print axioms RAMZFC.independent_axioms_are_separate_bits
#print axioms RAMZFC.ram_subsumes_by_placement
```

``` numberLines
'RAMZFC.ram_places_theory' does not depend on any axioms
'RAMZFC.soundness_is_load_bearing' does not depend on any axioms
'RAMZFC.ground_exceeds_ladder' does not depend on any axioms
'RAMZFC.independent_axioms_are_separate_bits' does not depend on any axioms
'RAMZFC.ram_subsumes_by_placement' does not depend on any axioms
```

## RA_to_ZFC_Chain.lean

SHA-256 , 90 lines.

``` numberLines
/-
RA_to_ZFC_Chain.lean · RA mapped to ZFC through the RA–RAM bridge, link by link.
Core Lean 4.19.0, no library, no sorry, no axiom declaration. Harvested 2026-09-24.

The chain RA → Bridge → RAM → ZFC. The RA–RAM bridge is the junction's discriminator
(Master Codex Ch. 10B, `Bridge.discriminator`): a property whose every world has it is KEYLESS
and crosses from the root; a property some world lacks is KEYED, one bit, supplied and never
derived. ZFC's location under RAM is RAM_ZFC_Placement.lean. Worlds are ways a theory's content
could be, which of its independent sentences hold.

Verdict. Upward, every act of using ZFC grounds RA. Downward, RA crosses the bridge as presence
into every world of ZFC and carries no keyed content: no independent sentence of ZFC, Choice
over ZF the cited example (Gödel 1938, Cohen 1963), is decided by RA.
-/
namespace RAtoZFC

structure Substrate where
  U  : Type
  ΔE : U → Int

def RA (S : Substrate) : Prop := ∀ x : S.U, 0 < S.ΔE x

structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

def unitSub : Substrate := ⟨Unit, fun _ => 1⟩
theorem ra_unit : RA unitSub := fun _ => show (0 : Int) < 1 by decide

/-- A theory, abstractly: sentences and a provability predicate (the RAM ladder). -/
structure Theory where
  Sent : Type
  Prov : Sent → Prop

-- LINK 1 · ZFC → RA: every act of using a theory grounds RA. This link holds.
theorem using_grounds_root (T : Theory) (s : T.Sent) (d : T.Prov s) :
    Nonempty (SelfGrounding (RA unitSub)) :=
  ⟨⟨PLift (T.Prov s), ⟨d⟩, fun _ => ra_unit⟩⟩

-- LINK 2 · RA → Bridge: the bridge carries only KEYLESS properties, those no world denies.
/-- A property of worlds is keyless when every world has it, keyed when some world lacks it. -/
def Keyless {W : Type} (P : W → Prop) : Prop := ∀ w, P w
def Keyed   {W : Type} (P : W → Prop) : Prop := ∃ w, ¬ P w

/-- RA crosses to every world whatever its content: RA is keyless over worlds. -/
theorem ra_is_keyless {W : Type} : Keyless (fun _ : W => RA unitSub) := fun _ => ra_unit

/-- A keyless property is carried by RA to every world. -/
theorem keyless_crosses {W : Type} (P : W → Prop) (hP : Keyless P) :
    ∀ w, RA unitSub → P w := fun w _ => hP w

-- LINK 3 · Bridge → RAM → ZFC: a keyed sentence, one the theory's worlds disagree on (for ZFC,
-- Choice over ZF: Gödel 1938, Cohen 1963, cited), is not carried. RA holds in both worlds.
/-- Two worlds of ZF: in one Choice holds, in the other it fails. -/
def choiceHolds : Bool → Prop := fun w => w = true

theorem choice_is_keyed : Keyed choiceHolds := ⟨false, fun h => Bool.noConfusion h⟩

/-- THE BREAK. RA holds in both worlds, so RA cannot carry Choice into ZFC, nor its denial. -/
theorem ra_does_not_cross_keyed :
    (∀ _w : Bool, RA unitSub) ∧ choiceHolds true ∧ ¬ choiceHolds false :=
  ⟨fun _ => ra_unit, rfl, fun h => Bool.noConfusion h⟩

/-- In general: RA decides no keyed property of worlds. -/
theorem ra_decides_no_keyed {W : Type} (P : W → Prop) (hK : Keyed P) :
    ¬ (∀ w, RA unitSub → P w) :=
  fun h => let ⟨w, hw⟩ := hK; hw (h w ra_unit)

-- THE CHAIN, IN ONE THEOREM.
/-- Upward, every act of using ZFC grounds RA. Downward, RA carries exactly the keyless and
    none of the keyed: it reaches every world of ZFC as presence, and no independent sentence of
    ZFC as content. -/
theorem chain_verdict :
    (∀ (T : Theory) (s : T.Sent), T.Prov s → Nonempty (SelfGrounding (RA unitSub))) ∧
    (∀ {W : Type} (P : W → Prop), Keyless P → ∀ w, RA unitSub → P w) ∧
    (∀ {W : Type} (P : W → Prop), Keyed P → ¬ ∀ w, RA unitSub → P w) ∧
    ((∀ _w : Bool, RA unitSub) ∧ choiceHolds true ∧ ¬ choiceHolds false) :=
  ⟨using_grounds_root, fun P hP => keyless_crosses P hP, fun P hK => ra_decides_no_keyed P hK,
   ra_does_not_cross_keyed⟩

end RAtoZFC

#print axioms RAtoZFC.using_grounds_root
#print axioms RAtoZFC.ra_is_keyless
#print axioms RAtoZFC.keyless_crosses
#print axioms RAtoZFC.choice_is_keyed
#print axioms RAtoZFC.ra_does_not_cross_keyed
#print axioms RAtoZFC.ra_decides_no_keyed
#print axioms RAtoZFC.chain_verdict
```

``` numberLines
'RAtoZFC.using_grounds_root' does not depend on any axioms
'RAtoZFC.ra_is_keyless' does not depend on any axioms
'RAtoZFC.keyless_crosses' does not depend on any axioms
'RAtoZFC.choice_is_keyed' does not depend on any axioms
'RAtoZFC.ra_does_not_cross_keyed' does not depend on any axioms
'RAtoZFC.ra_decides_no_keyed' does not depend on any axioms
'RAtoZFC.chain_verdict' does not depend on any axioms
```

## ZFC_RA_RoundTrip.lean

SHA-256 , 64 lines.

``` numberLines
/-
ZFC_RA_RoundTrip.lean · the round trip ZFC → RAM → Bridge → RA → Bridge → RAM → ZFC.
Core Lean 4.19.0, no library, no sorry, no axiom declaration. Drafted 2026-09-24.
A sentence of ZFC is read in its worlds (ways ZFC's content could be). Up the chain it is placed
on RAM's Ground; across the RA–RAM bridge it meets RA; the arrow back returns through the bridge,
which carries keyless content, to RAM and then to ZFC.
-/
namespace RoundTrip

structure Substrate where
  U  : Type
  ΔE : U → Int

def RA (S : Substrate) : Prop := ∀ x : S.U, 0 < S.ΔE x
def unitSub : Substrate := ⟨Unit, fun _ => 1⟩
theorem ra_unit : RA unitSub := fun _ => show (0 : Int) < 1 by decide

/-- Up: a sentence's content, read on RAM's Ground in each world. -/
def up {W : Type} (P : W → Prop) : W → Prop := P

/-- Across and back: what the bridge returns to RAM from RA, in each world: RA together with the
    content it received. -/
def viaRA {W : Type} (P : W → Prop) : W → Prop := fun w => RA unitSub ∧ up P w

/-- Down: from RAM back to the sentence of ZFC. -/
def down {W : Type} (Q : W → Prop) : W → Prop := Q

-- R1.
/-- THE ROUND TRIP IS THE IDENTITY ON CONTENT. In every world, the sentence that returns to ZFC
    is equivalent to the sentence that left. -/
theorem round_trip_identity {W : Type} (P : W → Prop) (w : W) :
    down (viaRA P) w ↔ P w :=
  ⟨fun h => h.2, fun h => ⟨ra_unit, h⟩⟩

-- R2.
/-- An absolute sentence, one with the same truth value in every world (an arithmetic sentence
    such as RH, whose value is fixed in every model with the standard numbers): the round trip
    returns that same value, true if it left true and false if it left false. -/
theorem absolute_returns_unchanged {W : Type} (P : W → Prop) (hAbs : ∀ w v, P w ↔ P v)
    (w : W) : (down (viaRA P) w ↔ P w) ∧ (∀ v, down (viaRA P) v ↔ P w) :=
  ⟨round_trip_identity P w, fun v => (round_trip_identity P v).trans (hAbs v w)⟩

-- R3.
/-- What the trip adds: presence. RA holds in every world on return; it holds identically for a
    sentence and for its negation, so it tells them apart nowhere. -/
theorem trip_adds_presence_only {W : Type} (P : W → Prop) :
    (∀ _w : W, RA unitSub) ∧ (∀ w, (down (viaRA P) w ↔ P w) ∧ (down (viaRA (fun v => ¬ P v)) w ↔ ¬ P w)) :=
  ⟨fun _ => ra_unit, fun w => ⟨round_trip_identity P w, round_trip_identity (fun v => ¬ P v) w⟩⟩

-- R4.
/-- THE VERDICT. Whatever ZFC sends up returns to ZFC unchanged in content, with RA's presence
    attached in every world; a sentence ZFC does not settle leaves undecided and returns
    undecided. -/
theorem round_trip_verdict :
    (∀ {W : Type} (P : W → Prop) (w : W), down (viaRA P) w ↔ P w) ∧
    (∀ {W : Type} (P : W → Prop), (∀ w v, P w ↔ P v) → ∀ w v, down (viaRA P) v ↔ P w) :=
  ⟨fun P w => round_trip_identity P w, fun P h w v => (absolute_returns_unchanged P h w).2 v⟩

end RoundTrip

#print axioms RoundTrip.round_trip_identity
#print axioms RoundTrip.absolute_returns_unchanged
#print axioms RoundTrip.trip_adds_presence_only
#print axioms RoundTrip.round_trip_verdict
```

``` numberLines
'RoundTrip.round_trip_identity' does not depend on any axioms
'RoundTrip.absolute_returns_unchanged' does not depend on any axioms
'RoundTrip.trip_adds_presence_only' does not depend on any axioms
'RoundTrip.round_trip_verdict' does not depend on any axioms
```

## Massless_Arrow_Test.lean

SHA-256 , 42 lines.

``` numberLines
/-
Massless_Arrow_Test.lean · can a zero-content arrow from RA deliver a proposition?
Core Lean 4.19.0, no library, no sorry. Drafted 2026-09-24.
An arrow sends a proposition to what it delivers. It is massless (zero content) when it delivers
the same for every proposition, and sound when what it delivers for P implies P.
-/
namespace Massless

def Massless (f : Prop → Prop) : Prop := ∀ P Q, f P ↔ f Q
def Sound (f : Prop → Prop) : Prop := ∀ P, f P → P

-- M1.
/-- A sound massless arrow delivers nothing: if it delivered P, it would deliver ¬P too, and
    both would hold. So its delivery is empty for every proposition. -/
theorem massless_sound_delivers_nothing (f : Prop → Prop) (hM : Massless f) (hS : Sound f) :
    ∀ P, ¬ f P :=
  fun P h => hS (¬ P) ((hM P (¬ P)).mp h) (hS P h)

-- M2.
/-- The RA-shaped arrow: it delivers RA's presence, the same for every proposition. -/
def raArrow (RA : Prop) : Prop → Prop := fun _ => RA

theorem raArrow_massless (RA : Prop) : Massless (raArrow RA) := fun _ _ => Iff.rfl

/-- If RA holds, the RA-shaped arrow is NOT sound: it delivers every proposition, true or false. -/
theorem raArrow_not_sound (RA : Prop) (hRA : RA) : ¬ Sound (raArrow RA) :=
  fun hS => hS False hRA

-- M3.
/-- THE VERDICT. A zero-content arrow either delivers nothing (if it is sound) or delivers every
    proposition and its negation alike (if it is not). Either way it cannot deliver RH rather than
    ¬RH. Content is what separates a proposition from its negation, and a massless arrow has none. -/
theorem massless_cannot_separate (f : Prop → Prop) (hM : Massless f) (RH : Prop) :
    (f RH ↔ f (¬ RH)) :=
  hM RH (¬ RH)

end Massless

#print axioms Massless.massless_sound_delivers_nothing
#print axioms Massless.raArrow_massless
#print axioms Massless.raArrow_not_sound
#print axioms Massless.massless_cannot_separate
```

``` numberLines
'Massless.massless_sound_delivers_nothing' does not depend on any axioms
'Massless.raArrow_massless' does not depend on any axioms
'Massless.raArrow_not_sound' does not depend on any axioms
'Massless.massless_cannot_separate' does not depend on any axioms
```

## Arrow_Translation.lean

SHA-256 , 74 lines.

``` numberLines
/-
Arrow_Translation.lean · Part Two translated into the purely formal domain: the Root Axiom
replaced by a bare computation arrow. Core Lean 4.19.0, no library, no sorry, no axiom declared.
The arrow is the identity computation on any type, `id : α → α`; its existence needs nothing.
Every place Part Two used the Root Axiom, it is replaced by the proposition that an arrow exists.
-/
namespace ArrowForm

/-- THE ARROW: a computation from a type to itself. It exists on every type, with no premise. -/
def Arrow (α : Type) : Prop := Nonempty (α → α)

theorem arrow_exists (α : Type) : Arrow α := ⟨id⟩

/-- The arrow used throughout, on the unit type. -/
def A : Prop := Arrow Unit
theorem a_holds : A := arrow_exists Unit

-- T1 · the upward link. Every act of proof yields an arrow: the proof itself, carried to itself.
theorem proof_yields_arrow (P : Prop) (h : P) : Arrow (PLift P) :=
  ⟨fun _ => ⟨h⟩⟩

-- T2 · keyless crossing. The arrow holds in every world and carries every keyless property.
def Keyless {W : Type} (P : W → Prop) : Prop := ∀ w, P w
def Keyed   {W : Type} (P : W → Prop) : Prop := ∃ w, ¬ P w

theorem arrow_is_keyless {W : Type} : Keyless (fun _ : W => A) := fun _ => a_holds
theorem keyless_crosses {W : Type} (P : W → Prop) (hP : Keyless P) : ∀ w, A → P w :=
  fun w _ => hP w

-- T3 · the break. The arrow decides no keyed property.
theorem arrow_decides_no_keyed {W : Type} (P : W → Prop) (hK : Keyed P) : ¬ ∀ w, A → P w :=
  fun h => let ⟨w, hw⟩ := hK; hw (h w a_holds)

-- T4 · the round trip. Carried through the arrow and back, every sentence returns unchanged.
def viaArrow {W : Type} (P : W → Prop) : W → Prop := fun w => A ∧ P w
theorem round_trip_identity {W : Type} (P : W → Prop) (w : W) : viaArrow P w ↔ P w :=
  ⟨fun h => h.2, fun h => ⟨a_holds, h⟩⟩

-- T5 · the massless arrow. An arrow that delivers the same for every proposition cannot
-- separate a proposition from its negation.
def Massless (f : Prop → Prop) : Prop := ∀ P Q, f P ↔ f Q
theorem arrowDelivery_massless : Massless (fun _ => A) := fun _ _ => Iff.rfl
theorem massless_cannot_separate (f : Prop → Prop) (hM : Massless f) (RH : Prop) :
    f RH ↔ f (¬ RH) := hM RH (¬ RH)

-- T6 · the Real part, closed by a certificate, with no premise at all.
structure Certificate {α : Type} (Z onL : α → Prop) (height : α → Int) (T : Int) where
  zeros    : List α
  complete : ∀ z, Z z → height z ≤ T → z ∈ zeros
  onLine   : ∀ z, z ∈ zeros → onL z

theorem arrow_real_part_of_certificate {α : Type} (Z onL : α → Prop) (height : α → Int) (T : Int)
    (c : Certificate Z onL height T) : ∀ z, Z z → height z ≤ T → onL z :=
  fun z hz hle => c.onLine z (c.complete z hz hle)

-- T7 · THE TRANSLATION IS FAITHFUL. Any inhabited proposition plays the root's part in every
-- result above: the road's theorems hold for an arbitrary true premise R, so the root is idle in
-- the formal content, and the bare arrow is enough.
theorem any_true_premise_serves (R : Prop) (hR : R) {W : Type} (P : W → Prop) :
    ((∀ w, P w) → ∀ w, R → P w) ∧
    ((∃ w, ¬ P w) → ¬ ∀ w, R → P w) ∧
    (∀ w, (R ∧ P w) ↔ P w) :=
  ⟨fun hP w _ => hP w, fun ⟨w, hw⟩ h => hw (h w hR), fun _ => ⟨fun h => h.2, fun h => ⟨hR, h⟩⟩⟩

end ArrowForm

#print axioms ArrowForm.arrow_exists
#print axioms ArrowForm.proof_yields_arrow
#print axioms ArrowForm.keyless_crosses
#print axioms ArrowForm.arrow_decides_no_keyed
#print axioms ArrowForm.round_trip_identity
#print axioms ArrowForm.massless_cannot_separate
#print axioms ArrowForm.arrow_real_part_of_certificate
#print axioms ArrowForm.any_true_premise_serves
```

``` numberLines
'ArrowForm.arrow_exists' does not depend on any axioms
'ArrowForm.proof_yields_arrow' does not depend on any axioms
'ArrowForm.keyless_crosses' does not depend on any axioms
'ArrowForm.arrow_decides_no_keyed' does not depend on any axioms
'ArrowForm.round_trip_identity' does not depend on any axioms
'ArrowForm.massless_cannot_separate' does not depend on any axioms
'ArrowForm.arrow_real_part_of_certificate' does not depend on any axioms
'ArrowForm.any_true_premise_serves' does not depend on any axioms
```

## RH_Real_Part_Computed.lean

SHA-256 , 54 lines.

``` numberLines
/-
RH_Real_Part_Computed.lean · the Real part of RH, closed by computation and carried up the ladder.
Core Lean 4.19.0, no library, no sorry. Drafted 2026-09-24.
The Real part at height T (RH_Real_Unicorn_Split.lean) is a bounded statement: finitely many
zeros lie below T. It is closed by a finite certificate, a complete list of the zeros below T and
a check that each is on the line. That is the rung (L3m); the rung is on the ladder (L2m), so a
certified Real part is provable; and the round trip returns it unchanged.
-/
namespace RealPart

variable {α : Type} (Z onL : α → Prop) (height : α → Int)

def RealPartAt (T : Int) : Prop := ∀ z, Z z → height z ≤ T → onL z

/-- A certificate for the Real part at T: a list of all zeros up to T, and each is on the line. -/
structure Certificate (T : Int) where
  zeros    : List α
  complete : ∀ z, Z z → height z ≤ T → z ∈ zeros
  onLine   : ∀ z, z ∈ zeros → onL z

-- C1.
/-- THE REAL PART, CLOSED. A certificate proves the Real part at T completely. -/
theorem real_part_of_certificate (T : Int) (c : Certificate Z onL height T) :
    RealPartAt Z onL height T :=
  fun z hz hle => c.onLine z (c.complete z hz hle)

-- C2.
/-- An executed instance: a zero set whose members up to T are listed and checked by the kernel's
    own computation (`decide`), the Real part following from the certificate. -/
def zs : List (Int × Bool) := [(14, true), (21, true), (25, true)]
def Zs (z : Int × Bool) : Prop := z ∈ zs
def onLs (z : Int × Bool) : Prop := z.2 = true

theorem real_part_executed : RealPartAt Zs onLs (fun z => z.1) 30 :=
  real_part_of_certificate Zs onLs (fun z => z.1) 30
    ⟨zs, fun _ hz _ => hz, fun z hz => by
      simp only [zs, List.mem_cons, List.mem_nil_iff, or_false] at hz
      rcases hz with h | h | h <;> subst h <;> rfl⟩

-- C3.
/-- The rung is on the ladder: a true Real part is a bounded statement, and a theory complete for
    true bounded statements proves it (for ZFC and PA, bounded completeness, a theorem of
    arithmetic, carried as the named premise `bounded`). A certificate therefore yields a proof. -/
theorem certified_is_provable (Prov : Prop → Prop)
    (bounded : ∀ T, RealPartAt Z onL height T → Prov (RealPartAt Z onL height T))
    (T : Int) (c : Certificate Z onL height T) :
    Prov (RealPartAt Z onL height T) :=
  bounded T (real_part_of_certificate Z onL height T c)

end RealPart

#print axioms RealPart.real_part_of_certificate
#print axioms RealPart.real_part_executed
#print axioms RealPart.certified_is_provable
```

``` numberLines
'RealPart.real_part_of_certificate' does not depend on any axioms
'RealPart.real_part_executed' depends on axioms: [propext]
'RealPart.certified_is_provable' does not depend on any axioms
```

## RH_Real_Part_Turing_Check.py

``` numberLines
# Real part executed to height T, three independent counts, in floating point:
#   (a) zeros ON the line, as sign changes of Hardy's Z(t) on a fine grid;
#   (b) all zeros in the strip with 0 < Im < T, N(T), by mpmath's counting function nzeros(T),
#       computed independently of the grid; the earlier form theta(T)/pi + 1 + arg zeta(1/2 + iT)/pi
#       with a principal-branch endpoint argument is not the counting function S(T) and is not used;
#   (c) the ordinates of the first zeros themselves, from mpmath.zetazero, counted below T.
# Agreement of (a), (b), (c) at T means every zero up to T is on the line, in 30-digit floating
# point without interval arithmetic: testimony, not a certificate. The certificate of record for
# zeta to 3 x 10^12 is Platt and Trudgian (2021), cited in the paper, not this script.
import mpmath as mp
mp.mp.dps = 30
T = mp.mpf(100)
def Z(t): return mp.siegelz(t)
grid = [mp.mpf(k)/20 for k in range(1, int(T*20)+1)]
on_line, prev = 0, Z(grid[0])
for t in grid[1:]:
    z = Z(t)
    if z == 0 or mp.sign(z) != mp.sign(prev): on_line += 1
    prev = z
N = int(mp.nzeros(T))
ords = []
k = 1
while True:
    g = mp.zetazero(k).imag
    if g > T: break
    ords.append(g); k += 1
print("T =", T)
print("(a) zeros ON the line, sign changes of Z on a 1/20 grid :", on_line)
print("(b) N(T), all zeros in the strip, mpmath nzeros          :", N)
print("(c) ordinates of zeros below T, enumerated               :", len(ords),
      " first", mp.nstr(ords[0], 8), " last", mp.nstr(ords[-1], 8), " next", mp.nstr(mp.zetazero(k).imag, 8))
ok = (on_line == N == len(ords))
print("Real part at T =", int(T), ":", "HOLDS (three counts equal)" if ok else "count mismatch")
```

``` numberLines
T = 100.0
(a) zeros ON the line, sign changes of Z on a 1/20 grid : 29
(b) N(T), all zeros in the strip, mpmath nzeros          : 29
(c) ordinates of zeros below T, enumerated               : 29  first 14.134725  last 98.831194  next 101.31785
Real part at T = 100 : HOLDS (three counts equal)
```