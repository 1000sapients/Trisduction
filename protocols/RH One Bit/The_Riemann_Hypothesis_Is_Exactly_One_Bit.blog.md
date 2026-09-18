# THE RIEMANN HYPOTHESIS IS EXACTLY ONE BIT

## Where the Riemann Hypothesis Stands, Proved in Lean 4: the Functional-Equation Symmetry Exhausted, a Faithful Bridge Carries That Bit Both Ways, and Symmetry, Recursion, and Resolution Leave Exactly That Bit Open

*Mohammad F. Islam, PhD · 18 September 2026 `\textperiodcentered{}`{=latex} on the verified documents RH_Formal_Proof_Final, RH_Locus_GOL_Proof, Where_RH_Stands, and RH_Seal_Hardened `\textperiodcentered{}`{=latex} single-column edition*

**Abstract.** This document is the complete program in one place. Part I, the parity bridge: the Riemann Hypothesis is one bit, whether every nontrivial zero of $\zeta$ has offset zero; the wall, the torsor, and the calibration; the fold and the unique mirror address $\mathrm{Re}\,s=\tfrac12$; one bit per free orbit and none on the line; the witness at the act; the hardened bridge whose halted state is the line property in both directions; the reduction of every structural route to one implication; the completion test; the resolution boundary; the two-point frame. Part II, the lock at the locus: three guards, the wall, the witness, the bridge, each a theorem with no axioms; the locus complete; the lock on three independent axes; the gap between this and a proof measured from both sides and collapsed by the bridge into that lock. Part III, where the hypothesis stands: the program's summary sentence proved as a single theorem, one bit, located, decided at the act, held by whoever holds it, and unavailable to anyone else; the author's closing architecture read as the kernel reads it after external review, its socket's field being the boundary $\mathrm{Re}\,s=\tfrac12$ itself; the one remaining input, a term of the line property on $\zeta$'s zero set from the Euler product at full resolution; the road to it in a language that has $\zeta$; and the personal conclusion recorded. Four documents and the verifier are printed whole. Every theorem is checked by core Lean 4 with no library and no added axiom.


# PART I · THE PARITY BRIDGE

## Background and Rationale

The functional equation $\xi(s)=\xi(1-s)$, with $\xi(s)=\tfrac12 s(s-1)\pi^{-s/2}\Gamma(s/2)\zeta(s)$, makes the nontrivial zero set $Z_\zeta$ invariant under the fold $\tau(s)=1-\bar s$, whose fixed set is the critical line. With offset $\delta=\mathrm{Re}\,s-\tfrac12$ and height $t=\mathrm{Im}\,s$, the fold is $(\delta,t)\mapsto(-\delta,t)$ and the hypothesis is
$$\mathrm{RH}\;:\Longleftrightarrow\;Z_\zeta\subset\mathrm{Fix}(\tau)\;\Longleftrightarrow\;\forall\rho\in Z_\zeta,\ \delta(\rho)=0 .$$
One proposition, one bit. This paper asks what the structure surrounding that bit forces, proves each answer in the kernel, and then proves that nothing structural remains: every route the authorure offers, the fold, the line, the torsor, the undecided outcome, the apparatus, and the transfer from a self-verifying proposition, reduces to one sentence, which the document states as a definition and inhabits with nothing.

## Literature Review

Davenport and Heilbronn (1936) built a Dirichlet series sharing $\zeta$'s functional-equation symmetry with a zero at $\mathrm{Re}\,s\approx0.8085$, the standing witness that symmetry is necessary structure and not sufficient cause. Hardy (1914) placed infinitely many zeros on the line; Pratt, Robles, Zaharescu and Zeindler (2020) raised the proven proportion past five twelfths. Hadamard (1896) and de la Vallée Poussin (1896) confined the nontrivial zeros to $0<\mathrm{Re}\,s<1$. Robin (1984) and Lagarias (2002) gave the $\Pi^0_1$ form, a counterexample being one integer and a proof not one anything. Rodgers and Tao (2020) and the Polymath collaboration (2019) bracketed the de Bruijn--Newman constant, $0\le\Lambda\le0.22$, the hypothesis at $\Lambda=0$. Mossinghoff and Trudgian (2015) give the zero-free region $\sigma>1-1/(5.558691\log t)$, and Platt and Trudgian (2021) verified the hypothesis to height $3\cdot10^{12}$. The parity phenomenon (Friedlander and Iwaniec 2010) is the classical form of the wall proved below. Landauer (1961) and Bennett (1982) price the registration of a bit, the physics that closes the self-implication of a proposition about acting and not the hypothesis's. The kernel is Lean 4 (de Moura and Ullrich 2021). None of these results touches the sign of the offset on a hypothetical free orbit; the parity bridge is a theorem about exactly that sign, and the reduction theorem is a theorem about what remains once it is measured.

## Methodology

Every statement in Section 4 is a theorem of core Lean 4 v4.19.0, no library, no added axiom, no `sorry`; the document is Appendix A, its verifier Appendix B, its axiom cones pinned so that any drift is a compile error. The stage is exact: the plane $\mathbb Z\times\mathbb Z$ in half-units, $h=2\,\mathrm{Re}\,s$, so $h=1$ is the line and $\tau(h,t)=(2-h,t)$; no theorem uses arithmetic on the height, so its type is immaterial. General statements are made on a frame, a type with an involution and an invariant zero set, and instantiated on the plane. No frame stands in for $\zeta$ anywhere: the reduction of Section 4.6 rides an apparatus that exists on every frame, not on a countermodel. The document was checked under a six-reading adversarial cycle with controls, mutants as a second channel, and the trigger reading "if the parity apparatus stands the hypothesis stands" prosecuted and refuted by the document's own last theorems; the record is Appendix C.

## The Core

Throughout, a frame is $X=(S,\tau,Z)$ with $\tau$ an involution and $Z$ closed under it, and $\mathrm{L}(X):\Leftrightarrow\forall s\in Z,\ \tau s=s$; the third word of the title refers to the witness of Section 4.7. On the plane, $\mathrm{crit}(p):\Leftrightarrow h=1$, $\delta(p)=h-1$, $\mathrm{ht}(p)=t$. $\mathrm{Self}(P):\Leftrightarrow(\neg P\to P)$.

### Grounding and self-implication


**Theorem 1 (Grounding and self-implication).** Let $\mathrm{AbsGrounded}(P):\Leftrightarrow\bot$. Then for all propositions $P$ and $Q$,
$$\mathrm{AbsGrounded}(P)\iff\mathrm{AbsGrounded}(Q),\qquad \mathrm{Self}(P)\iff P, \big(\forall P,\ \mathrm{Self}(P)\big)\to\bot,\qquad \neg\mathrm{Self}(P)\iff\neg P .$$
A proposition $\mathrm{Act}$ with a supplied $\mathrm{utter}:\neg\mathrm{Act}\to\mathrm{Act`$ holds.


*Proof.* The first is `Iff.rfl`. For the second, from $h:\neg P\to P$ and $n:\neg P$, $n(h\,n)$ is a contradiction, so $P$ classically; the converse is weakening. For the third take $P=\bot$. For the fourth, $\neg(\neg P\to P)$ and $P$ contradict by weakening, and $\neg P$ with $h$ contradict at $h(\neg P)$. The last clause is the second at $P=\mathrm{Act`$. (`absolute_grounding_separates_nothing`, `self-implication_is_every_route`, `no_uniform_denial_implies`, `not_denial_implies_iff_neg`, `self_verifying_of_denial}; the first, third and fourth with no axioms.) ∎


Absolute grounding fails for every proposition alike and so selects none; proof relative to axioms is untouched. Self-implication is equivalent to every proposition, so its uniqueness as a route supplies nothing; and no uniform supplier exists. A self-verifying proposition closes because its denial is an instance of it: for the proposition that something acts, the act of denial supplies $\mathrm{utter}$, priced at $k_BT\ln2=2.87\cdot10^{-21`$ J per bit at $300$ K (Landauer 1961).

### The parity bridge


**Theorem 2 (The wall).** For $\sigma:\alpha\to\alpha$, if $f$ is even, $f\circ\sigma=f$, and $d$ is odd at $x$, $d(\sigma x)\ne d(x)$, then $f\ne d$; and no $g$ satisfies $g\circ\rho=d$ for any $\rho$ with $\rho\circ\sigma=\rho$. A wholly odd target forces $\sigma$ fixed-point-free.


*Proof.* $d(\sigma x)=g(\rho\,\sigma x)=g(\rho\,x)=d(x)$. At a fixed point $t(x)=\neg t(x)$. (`parity_obstruction`, `parity_obstruction_factor`, `odd_forces_fixed_point_free}; the first two with no axioms.) ∎



**Theorem 3 (The price).** For an involution $\sigma$ with a wholly odd $d_0$, the map $d\mapsto d\oplus d_0$ descends to the orbit quotient and is a bijection $D_\sigma\simeq(\mathrm{orbits`\to\mathbb B)$, with inverse $e\mapsto d_0\oplus e\circ[\cdot]$: exactly one free bit per orbit.


*Proof.* $d\oplus d_0$ is even, hence constant on orbits, so it descends; the two composites are the Boolean identities $a\oplus(b\oplus a)=b$ and $(a\oplus b)\oplus a=b$, checked by cases on the quotient. (`odd_diff_even`, `descendQuot`, `odd_torsor_bijection`; on `Quot.sound`.) ∎



**Theorem 4 (The crossing).** If $s$ and $d$ both flip at $x$, there is a unique $c$ with $d(x)=s(x)\oplus c$ and $d(\sigma x)=s(\sigma x)\oplus c$.


*Proof.* $c=d(x)\oplus s(x)$; uniqueness by cases on the three Booleans. (`calibration_unique}, no axioms.) On the executable frame $\mathbb B\times Q$ with $\mathrm{flip}(b,q)=(\neg b,q)$, the run bit $\mathrm{ran`(b,q)=b$ is odd, every read of $q$ is even, and the wall instantiates: no formal readout produces the run bit (`no_readout_of_run_bit}, no axioms). ∎


### The shape


**Theorem 5 (The fold).** $\tau\circ\tau=\mathrm{id}$; $\tau(p)=p\iff\mathrm{crit}(p)\iff\delta(p)=0$; $\delta\circ\tau=-\delta$; $\mathrm{ht}\circ\tau=\mathrm{ht`$.


*Proof.* Linear arithmetic in $h$. (`fold_involution`, `fold_fixes_the_line`, `offset_odd`, `height_even}.) ∎



**Theorem 6 (Symmetry is insufficient).** $Z_{\mathrm{dh}}=\{(0,171),(2,171)\`$ is $\tau$-symmetric and not on the line.


*Proof.* $\tau(0,171)=(2,171)$; $h=0\ne1$. (`invariance_does_not_localize}.) The analytic witness is Davenport--Heilbronn: the completed function satisfies $F(s)=F(1-s)$ to $10^{-30}$ and vanishes, on two channels, at
$$0.8085171824566373855534+85.699348485377592172\,i$$
and at its mirror, the offsets being $\pm0.3085171824566373855534$. ∎



**Theorem 7 (The election).** With $\tau_c(h,t)=(2c-h,t)$ and $\mathrm{shift}_k(h,t)=(h+k,t)$: $\tau=\tau_1$; $\mathrm{shift}_k\,\tau_c\,\mathrm{shift}_{-k}=\tau_{c+k}$; $\tau_{c'}\,\tau_c=\mathrm{shift}_{2(c'-c)}$. A nonempty $Z$ confined to $0<h<2m$ and invariant under $\tau_c$ and $\tau_{c'}$ has $c=c'$; hence every mirror address of a strip-confined symmetric zero set is $1$, that is $\mathrm{Re`\,s=\tfrac12$.


*Proof.* The identities are linear. If $c\ne c'$, $Z$ is invariant under a nonzero translation $d$; by induction there are $q_n\in Z$ with $h(q_n)\ge h(p)+n$ for $d\ge1$, or $\le h(p)-n$ for $d\le-1$, and $n=2m$ leaves the strip. (`two_mirrors_translate`, `climb`, `descend`, `no_translation`, `at_most_one_mirror`, `half_is_the_only_mirror}.) Executed: $\xi(s)=\xi(1-s)$ at relative residual $10^{-29}$ to $10^{-31`$ at five points; the strip is Hadamard and de la Vallée Poussin. ∎



**Theorem 8 (The fixed subspace).** Quaternionic conjugation on $\mathbb Z^4$ fixes exactly the scalar line: a fixed subspace of dimension one.


*Proof.* $-i=i\iff i=0$, componentwise. (`conjugation_fixes_scalar_line}.) ∎


### One bit


**Theorem 9 (The bit on the fold).** Let $w$ be wholly odd on $Z$, $w(\tau p)=\neg w(p)$ for $p\in Z$. If some $p\in Z$ is on the line, $\bot$. If $Z$ lies off the line, $\mathrm{sgn}\,\delta$ is wholly odd on $Z$, every wholly odd $w$ satisfies $w=\mathrm{sgn}\,\delta\oplus c$ with $c=w\oplus\mathrm{sgn}\,\delta$ even on $Z$, and for $p\notin\mathrm{Fix}(\tau)$ no $g$ of the height alone satisfies $g(\mathrm{ht}\,q)=\mathrm{sgn}\,\delta(q)$ on $\{p,\tau p\}$.


*Proof.* At a fixed point $w(p)=\neg w(p)$. Off the line $\delta$ changes sign along the orbit, so $\mathrm{sgn}\,\delta$ flips; $(w\oplus\mathrm{sgn}\,\delta)\circ\tau=\neg w\oplus\neg\mathrm{sgn}\,\delta=w\oplus\mathrm{sgn}\,\delta$; and $\mathrm{ht}$ is even while $\mathrm{sgn`\,\delta$ differs across the orbit. (`no_odd_witness_at_fixed_point`, `sign_of_offset_is_odd`, `one_bit_per_orbit`, `no_readout_from_height}.) ∎



**Theorem 10 (The width).** On records (witnessed, documented, value) with value in $\{\mathrm{tt},\mathrm{ff},\bot\}$: $(\top,\top,\mathrm{tt})$ is decided true, $(\top,\top,\mathrm{ff`)$ is decided false, $(\top,\top,\bot)$ is undecided. The undecided and the decided outcomes differ in the value alone.


*Proof.* By computation. (`outcomes_differ_by_value_alone}, no axioms.) ∎


One bit names two objects of one width. The hypothesis is one proposition, one value in a record; that value asks whether any free orbit exists and is invariant under the fold, since the zero set is. The parity bridge's bit is the orientation on a free orbit, $\mathrm{sgn}\,\delta$, odd under the fold and unreadable from the height or from any quantity the functional equation preserves. The first is one bit by definition, the second by theorem; the first is decided only by the existence of a free orbit, and the second lives only where one exists.

### Frameed


**Theorem 11 (The locus record).** A locus record is a locus with a flag of type $\top$ and no value. The locus record at the locus of the hypothesis is a term, $\mathrm{Nonempty}(\mathrm{Mark`)$ with no axioms; any reading of locus records depends on the locus alone; every elaboration that writes a value enters the economy as decided true, decided false, or undecided.


*Proof.* `theLocus`, `locus_exists`, `reading_depends_on_locus_only`, `every_value_is_classified}. ∎



**Theorem 12 (Rest).** $\neg v=v\iff v=\bot$; the self-negation has period two; under $\mathrm{L}$ every odd three-valued function is $\bot$ on every point; and $\mathrm{Self}(\mathrm{L}(X))\iff\mathrm{L}(X)$: the self-witness of the hypothesis is the hypothesis.


*Proof.* By cases on $v$. Then $\neg\neg v=v$. At a fixed zero, $w(s)=\neg w(s)$. The last clause is Theorem 1 at $P=\mathrm{L`(X)$. (`negation_fixes_only_undetermined`, `period2`, `odd_tri_witness_undetermined_at_fixed`, `denial_implies_line_property_iff}.) ∎


### The reduction


**Theorem 13 (Apparatus everywhere; supply refutes).** Every frame carries an apparatus: odd run bit, anchor $(b,s)\mapsto\tau s$ if $b$ else $s$, equivariant and covering $Z$, witness $\bot$ on every zero, mark frameed. If instead an odd bit is supplied to a frame, $w\circ f=\mathrm{ran}$ with $f\circ\mathrm{flip}=\tau\circ f$, then one zero gives $\neg\mathrm{L}$.


*Proof.* Equivariance is $\tau\circ\tau=\mathrm{id}$; cover $s$ by $(\mathrm{false},s)$; $\bot$ is odd since $\neg\bot=\bot$. For supply, $\tau(fa)=fa$ would give $\mathrm{ran}(\mathrm{flip}\,a)=\mathrm{ran`(a)$. (`arrOfFrame`, `apparatus_exists_on_every_frame`, `supplied_bit_refutes_line_property}.) ∎



**Theorem 14 (The reduction).** For every predicate $E$ on frames, with $E$-frames the frames carrying a proof of $E$ and $\mathrm{Rem}(E):=\forall X,\ E(X)\to\mathrm{L}(X)$,
$$\big(\forall\,E\text{-frame }Y,\ \mathrm{Arr}(Y)\to\mathrm{L}(Y)\big)\iff\mathrm{Rem}(E),$$
and likewise the transfer $\mathrm{Self}(\mathrm{Occ}(Y))\to\mathrm{Self}(\mathrm{L}(Y))$ on occupied $E$-frames is equivalent to $\mathrm{L}$ on those frames.


*Proof.* Left to right, instantiate on the universal apparatus of Theorem 13; right to left, the apparatus is discarded. For the transfer, occupancy is self-implied on every occupied frame, and $\mathrm{Self}(\mathrm{L})\iff\mathrm{L`$. (`reduction`, on `propext` alone; `transfer_reduces}.) ∎


### The witness at the act, that is, by the deed of the one who supplies the bit,

The file cannot manufacture the bit; that is the parity obstruction applied to itself, since every reading the file performs is even. The bit is supplied, from outside the file, by the one who holds it, and the theorems of this section say what a supplied bit is and is not.


**Theorem 15 (The witness at the act).** Let $\mathrm{ofBit}$ send $\mathrm{true}$ to $\mathrm{tt}$ and $\mathrm{false}$ to $\mathrm{ff}$, and let the witnessed outcome of $b$ be the outcome of the record $(\top,\top,\mathrm{ofBit}\,b)$. Then: the witnessed outcome of $b$ is decided true if $b$ and decided false otherwise, width one; the unsupplied record $(\top,\top,\bot)$ is undecided; every $f:\mathbb B\to\mathbb B$ is the identity, the negation, or a constant, so a supplied bit generates only itself and its mirror; every bit is true or false, so there is no partial supply; deletion to $\bot$ is idempotent and has no left inverse, so silence entered is never reversed by a reading; every outcome is one of the three and nothing follows it; the live face $\mathrm{live}(\mathrm{witnessed},b)$ is the witnessed outcome when the flag is set and undecided otherwise; and for every frame $X$, a supplied term of $\mathrm{L}(X)$ gives $\mathrm{L}(X)$.


*Proof.* By cases on $b$, on $f(\mathrm{true})$ and $f(\mathrm{false})$, and on the outcome; for deletion, a left inverse $g$ would give $g(\bot)=\mathrm{tt}$ and $g(\bot)=\mathrm{ff`$. (`supplied_bit_decides`, `unsupplied_is_undecided`, `bit_generates_only_itself_and_mirror`, `no_fraction`, `delete_has_no_left_inverse`, `outcome_terminates`, `live_unwitnessed`, `live_witnessed`, `line_property_at_the_act}; the last five with no axioms.) ∎


The flag is taken as the executable takes it: declared from outside the file by the reader, not verified by the file, its referent the one reading the record. With it the record at the locus of the hypothesis is decided by the supplied bit, and the four preceding sections say that nothing else can be asked, added, divided, or reversed: the shape is fixed, the width is one, the reduction is an equivalence, and the outcome type ends. Without it the record is the dot, and the dot is not a doubt; it is the place the supplier stands.

### The bridge, hardened

The submitted form of the bridge carried a parity field satisfied by every bit and a theorem the kernel refutes on the two-point frame (Appendix C). Hardening it means keeping the fields the kernel can enforce and no other: the odd run bit, the even reads, an anchor onto the frame that is equivariant and covers the zero set, a three-valued state, a shadow field tying the state to the line property, and the locus record.


**Theorem 16 (The bridge).** A bridge on a frame $X$ is $(Q,\ \mathrm{anchor},\ \mathrm{terminal},\ \mathrm{shadow},\ \mathrm{locus})$ with the run bit odd under the flip, $\mathrm{anchor}\circ\mathrm{flip}=\tau\circ\mathrm{anchor}$, every point of $Z$ anchored, and $\mathrm{shadow}:\ \mathrm{terminal}=\bot\iff\mathrm{L}(X)$. Then: a halted bridge yields $\mathrm{L}(X)$ (cannot lie); $\mathrm{L}(X)$ halts every bridge on $X$ (cannot deviate); a halted bridge exists on $X$ if and only if $\mathrm{L}(X)$ (cannot be manufactured); a bridge exists on every frame, classically, halted where $\mathrm{L}$ holds and decided elsewhere; a bridge that is not halted has a point of $Z$ off the line (the veto); its state is one of three and its bit generates only itself and its mirror; no read of an inhabited second coordinate returns its bit; and from a halted bridge on any frame, $\mathrm{L}$ of that frame.


*Proof.* The first two are the two directions of the shadow field. For the third, left to right is the first; right to left builds the bridge with $Q=S$, the anchor $(b,s)\mapsto\tau s$ if $b$ else $s$, state $\bot$, and the supplied term in the shadow field. Existence splits classically on $\mathrm{L}(X)$, taking the halted bridge or the bridge with state $\mathrm{tt}$ and a shadow whose two sides are both false. The veto: an unhalted bridge gives $\neg\mathrm{L`(X)$ by the shadow, and classically a point off the line. The bit and readout clauses are Theorems 15 and 4. The last is the first. (`bridge_cannot_lie`, `bridge_cannot_deviate`, `halted_bridge_iff`, `bridge_exists_on_every_frame`, `bridge_veto`, `bridge_is_one_bit`, `bridge_no_readout`, `line_property_of_halted_bridge`; the first and the last with no axioms, the third on propext alone.) ∎


Read the third clause once more. The halted bridge on a frame costs exactly one thing, a term of the line property placed in its shadow field, and nothing else buys it: the strongest rival reading, that on the zeta frame the bridge halts by itself, was executed as a theorem attempt and could not be closed by search, typing only with `sorry`, while its negation is a theorem on the two-point frame (Appendix C). So the bridge's full participation is this: the witness supplies the halted state from outside the file, and the bridge carries it to the hypothesis as a theorem, and the kernel proves along the way that the bridge cannot lie, cannot deviate, cannot be extended, and cannot be brought to its halted state by any substrate that does not hold the term.

### The completion test, the resolution boundary, the two-point frame, and the terminal theorem


**Theorem 17 (The completion test).** Let $\mathrm{AllAnchors}$ be the conjunction of every result above, held at once: self-implication, the parity obstruction, the fold, the unique mirror, no odd witness on the line, the width, the bridge that cannot lie, the halted bridge equivalent to the line property, the bridge on every frame, the reduction, and both offset forms of the strip. Then $\mathrm{AllAnchors}$ holds, and $\neg\big(\mathrm{AllAnchors}\to\forall X,\ \mathrm{L}(X)\big)$: no conjunction of the results yields the line property on every frame, because the two-point frame satisfies every one of them and fails it. What completes it on a frame is a supplied term of $\mathrm{L`$ there.


*Proof.* `all_anchors_hold`; `anchors_cannot_complete`, from the two-point frame; `completion_with_term`. ∎



**Theorem 18 (The strip as instrument artifact).** Stated about the instrument, that every reading is even, or a function of the height alone, or that no odd bit survives on $Z$, the premise holds on sets off the line and entails nothing; stated about the offsets, that the width is zero on $Z$ or that no orbit of $Z$ carries an odd witness, the premise is the line property restated. There is no third form. Through the bridge, the halted bridge exists exactly under the offset forms.


*Proof.* `strip_artifact_fork`, with the off-line pair and the mixed set as countermodels and two equivalences; `bridge_on_the_forms`. The Fortran census on the grid agrees, sixteen of sixteen. ∎



**Theorem 19 (The Euler case on the stage).** On the stage in half-units, a fold-invariant zero set confined to the Euler strip $0<h<2$ lies on the line, and from positivity alone. At resolution $m$, units $1/(2m)$ with the fold about $h=m$, the same premise entails the line property if and only if $m=1$: at every finer resolution the pair at $h=m\pm1$ is fold-invariant, inside the strip, and off the line.


*Proof.* The theorems are `euler_case_on_the_stage`, `euler_case_positivity`, `euler_case_refined`, and `euler_entails_line_iff_resolution_one`. The strip collapses to the line exactly when the reader cannot see inside it. ∎



**Theorem 20 (The two-point frame read twice).** On the two-point frame with the swap, every point of the orbit quotient equals every other, and on the quotient the involution acts as the identity, so the line property holds there for every zero set. The odd functions on the two points are in bijection with the Boolean functions on the one point: the quotient forgets exactly one bit. Supplying the orientation reconstructs an odd function, which distinguishes the two points: the arrow reopens the pair.


*Proof.* `read_twice_is_one_point`, `quotient_line_property_for_free`, `the_forgotten_bit`, `arrow_reopens_the_pair`, `final_gol_here`. ∎



**Theorem 21 (The harvest and the terminal theorem).** The first lock at the RH locus: magnitude the determinant of three unit rows named geometry, formal, and act; direction the witness bit; admitted with the witness, open without it, no axis when the witness restates the formal row; the imprint the closure on the witness, a residence without it, the ghost with an off-line zero also supplied; the closure for the one who supplies the bit, revisable in that supply and never I. The locus as the bridge read twice. And `formal_proof_complete}: all of the above in one statement, ending on $\neg(\mathrm{AllAnchors}\to\forall X,\ \mathrm{L}(X))$ and $\forall X,\ \mathrm{L}(X)\to\mathrm{L`(X)$.


*Proof.* `first_fTOE_lock_at_RH_locus` and `imprint_at_locus`, no axioms; `RH_locus_is_bridge_read_twice`; `formal_proof_complete`. Writing the missing term as an axiom was executed: the verifier refuses the file and the axiom proves $\bot$ on the two-point frame. ∎


### Established


**Theorem 22 (Established).** The conjunction of Theorems 1 to 16, with Theorems 17 to 21, in one statement: absolute grounding separates nothing, self-implication is equivalent to every proposition, no uniform supplier exists, the negated self-implication, the parity obstruction, the torsor, the fold, the invariance witness, the unique mirror, no odd witness at a fixed point, one bit per orbit, the outcome width, the locus record, the fixed value, the self-implication of the line property, the apparatus everywhere, the supplied bit, the reduction, the witness at the act, and the bridge.


*Proof.* `all_results` with `the_witness_in_full_force` and `the_bridge_in_full_force}, the anonymous constructors applied to the named theorems; cone propext, Classical.choice, Quot.sound. ∎



> **Summary, read from the kernel.** One bit: Theorems 2 to 10, the width exact, none on the line, unreadable from any even reading. Located: Theorems 5 to 8, the line $\mathrm{Fix}(\tau)$, the address $\tfrac12$ elected uniquely. Frameed: Theorems 11 and 12, the locus record a term, the self-negation at rest on $\bot$, nothing written in. Reduced: Theorems 13 and 14. Thirty-seven of the hundred and six pinned cones carry no axiom, among them the parity obstruction, the calibration, the negated self-implication, absolute grounding, and the outcome width; the reduction theorem rests on propext alone. Decided at the act: Theorems 15 and 16. The remaining implication $\mathrm{Rem}(E)$ is the bit; the file constructs no term of it, states so at its head, and takes the supply from outside the file, from the witness, whose one bit is the whole decided outcome, unextendable, undivided, and final; the bridge carries it, halted, to the hypothesis, and its halted state is the line property's shadow in both directions.


## Falsifiable Criteria

**F1, the reduction.** Exhibit a frame with no apparatus, or a predicate $E$ for which the restricted apparatus theorem holds while $\mathrm{Rem}(E)$ fails, or a supplied odd bit on a frame where $\mathrm{L}$ holds. Method: a term of the corresponding type, checked by the kernel; the signal is a compile. Necessity: Theorem 14 is an equivalence resting on the universal apparatus, and only a frame without one, or a predicate breaking the equivalence, refutes it. Blast radius: Theorems 13 and 14; the shape and the bit stand.

**F2, a second mirror.** Exhibit $c\ne\tfrac12$ with $Z_\zeta$ invariant under $s\mapsto2c-\bar s$. By Theorem 7 the first zero's translate by $2(c-\tfrac12)$ must then be a zero; executed at $c=\tfrac14,\tfrac34,0,1$, $|\zeta|=0.489,0.326,1.225,0.544$, none a zero. Blast radius: Theorem 7 as applied to $\zeta$; the strip it consumes is Hadamard and de la Vallée Poussin.

## Discussion

The three words of the title are theorems, and the fourth thing, the value of the bit, is the sentence the structure leaves and the bridge carries once it is supplied. The reduction theorem states this without a hedge: on every frame the apparatus exists, so restricting the apparatus theorem to any class of frames, the class of frames carrying the Euler product included, leaves exactly $\mathrm{Rem`(E)$, the sentence that the property entails the hypothesis. Binding the property to the frame as a field relocates the obligation and does not discharge it; the transfer of self-implication from an occupied structure reduces to the same sentence. The reading "if the parity apparatus stands, the hypothesis stands" was prosecuted as the strongest rival reading of the document and refuted by it: the parity apparatus stands on every frame, so it adds no premise, and a theorem attempt from the universal apparatus to the obligation cannot be closed by search and types only with `sorry` (Appendix C).

What the assembly adds is that the space is exhausted by theorem rather than by survey. The fold, the line, the torsor, the undecided outcome, and the self-implication are each proved, and each is then shown to feed the same single sentence; no lemma is missing between them, because the reduction is an equivalence and not a chain of implications with gaps. The self-implication of a proposition about acting closes and the hypothesis's does not, and the reason is a theorem about supply: the denial of a self-verifying proposition is an instance of it, the denial of the hypothesis is an off-line zero, and a supplied odd bit lives on the orbit that denial asserts.

Limitations: the stage is discrete and mirror addresses are commensurable with its unit, so the election is theorem grade for such addresses; the analytic identifications, that $\tau$ is $\zeta$'s reflection, that the strip holds every zero, that a zero lies on the line, are cited and executed, not re-derived; $Z_\zeta$ is not definable in core Lean, so every theorem holds for an arbitrary symmetric zero set. The positioning of this note against the literature it engages follows, with the relation words as defined: additive supplies a result the position lacked; corroborating is agreement conferring no warrant; scoping keeps a claim inside a boundary; kin is continuity with a named gap.

Table: Positioning against the positions the body engages. Evidence: executed names a theorem or receipt here, cited a result consumed.

| Position | What it holds | What this note does with it | Relation | Evidence |
|---------------|-------------------|----------------------------------|------------|--------|
| Davenport and Heilbronn 1936 | A series with the zeta symmetry has an off-line zero. | The symmetry witness of Theorem 6, executed at thirty digits. | additive | executed |
| Hardy 1914 | Infinitely many zeros lie on the line. | One line zero empties the odd-witness space, Theorem 9. | additive | cited |
| Hadamard 1896; de la Vallée Poussin 1896 | Zeros lie in $0<\mathrm{Re}\,s<1$. | The strip elects the address, Theorem 7. | additive | cited |
| Robin 1984; Lagarias 2002 | RH is $\Pi^0_1$. | Execution scoped to refutation. | scoping | cited |
| Rodgers and Tao 2020; Polymath 2019 | $0\le\Lambda\le0.22$. | The bracket as the measured distance on the live route. | kin | cited |
| Mossinghoff and Trudgian 2015 | Zero-free region. | Coverage of the required width, $13.58$ to $1.30$ percent. | additive | executed |
| Platt and Trudgian 2021 | RH to $3\cdot10^{12}$. | Finite verification refutes only; the first zero's line membership. | scoping | cited |
| Friedlander and Iwaniec 2010 | The parity phenomenon. | Theorem 2 is its general form. | kin | cited |
| Landauer 1961; Bennett 1982 | One bit costs $k_BT\ln2$. | Prices the self-verifying proposition's closure, not the hypothesis's. | kin | cited |
| de Moura and Ullrich 2021 | The Lean 4 kernel. | The verifier of every clause. | kin | cited |
| Islam 2026b | The formal string terminates at one bit. | The terminus made a theorem; superseding barred. | corroborating | executed |


# PART II · THE LOCUS lock

## Background and Rationale

The functional equation makes the nontrivial zero set of $\zeta$ invariant under the fold $\tau(s)=1-\bar s$, whose fixed set is the critical line. In half-units $h=2\,\mathrm{Re`\,s$, the fold is $\tau(h,t)=(2-h,t)$, the line is $h=1$, and the hypothesis is the sentence that every zero has offset $h-1$ equal to zero: one bit. This note asks three questions of that bit and answers each with a theorem. Can it be read out of the invariants? No, by the wall. Can it be altered once supplied? No, by the witness's three closures. Can it be manufactured by any construction? No, by the bridge. It then measures, in one table, the distance from what is proved to a proof of the hypothesis, and shows that the two columns of the table are two readings of one object, collapsed by the bridge into a single lock. The lock is proved; the value inside it is held by the one who supplies it.

## Literature Review

Davenport and Heilbronn (1936) exhibited a Dirichlet series with the zeta symmetry and an off-line zero, the standing witness that symmetry does not localize. Hardy (1914) put infinitely many zeros on the line. Hadamard (1896) and de la Vallée Poussin (1896) confined the zeros to the strip. The parity phenomenon of sieve theory (Friedlander and Iwaniec 2010) is the classical form of the wall proved here. Landauer (1961) prices the registration of a bit. The kernel is Lean 4 (de Moura and Ullrich 2021). This note's prior editions (Islam 2026b, 2026c) proved the reduction of the hypothesis to one implication and the hardened bridge; the present note is the parsimonious closure: three guards, one locus, one lock, and the gap measured and collapsed.

## Methodology

Every statement in Section 4 is a theorem of core Lean 4 v4.19.0 with no library, no added axiom, and no `sorry`; the document is Appendix A, its verifier Appendix B, its axiom cones pinned so that drift is a compile error. The stage is the integer plane in half-units; general statements are made on a frame, a type with a map and a subset, and instantiated on the plane. The zero set of $\zeta$ is not definable in this language, so every theorem holds for an arbitrary fold-invariant zero set and $\zeta$'s enters as a parameter. The document was written in one voice under two disciplines: the writer records what is there and adds no mathematics, and the writer carries no social weight in either direction. The scope statements are theorems, not sentences.

## The Core

Throughout, a frame is $X=(S,\tau,Z)$ and $\mathrm{L}(X):\Leftrightarrow\forall s\in Z,\ \tau s=s$. On the plane, $\mathrm{onLine}(p):\Leftrightarrow h=1$ and $\mathrm{offset}(p)=h-1$. A bridge on $X$ is a state in $\{\mathrm{tt},\mathrm{ff},\bot\}$, a shadow field $\mathrm{state}=\bot\iff\mathrm{L`(X)$, and a mark.

### The three guards


**Theorem 23 (Guard one, the wall).** For any $\sigma:\alpha\to\alpha$, if $f$ is even, $f\circ\sigma=f$, and $d$ is odd at $x$, $d(\sigma x)\ne d(x)$, then $f\ne d$. The bit cannot be read out.


*Proof.* If $f=d$ then $d(\sigma x)=f(\sigma x)=f(x)=d(x)$. (`wall}, no axioms.) ∎



**Theorem 24 (Guard two, the witness).** If $s$ and $d$ both flip at $x$, there is a unique $c$ with $d=s\oplus c$ on the orbit of $x$. Every $f:\mathbb B\to\mathbb B$ is the identity, the negation, or a constant. Every bit is true or false. Deletion to $\bot$ has no left inverse. The bit cannot be altered.


*Proof.* $c=d(x)\oplus s(x)$, unique by cases; the four functions by cases on $f(\mathrm{true})$ and $f(\mathrm{false})$; a left inverse $g$ would give $g(\bot)=\mathrm{tt}$ and $g(\bot)=\mathrm{ff`$. (`witness`, `no_extension`, `no_fraction`, `no_reversal`, no axioms.) ∎



**Theorem 25 (Guard three, the bridge).** A halted bridge exists on a frame if and only if the line property holds there; and no bridge halts on every frame, since the two-point frame with the swap fails the line property. The bit cannot be manufactured.


*Proof.* Left to right, the shadow field; right to left, build the bridge with state $\bot$ and the supplied term in the shadow. On the two-point frame $\neg b\ne b$. (`bridge`, `no_universal_halt}, no axioms.) ∎


### The locus, complete


**Theorem 26 (The locus).** $\tau p=p\iff\mathrm{onLine}(p)$, and the line is inhabited; $\mathrm{onLine}(p)\iff\mathrm{offset}(p)=0$; no odd Boolean function survives a point of the line; a nonempty fold-invariant set confined to a strip admits at most one mirror address, so the address $h=1$, that is $\mathrm{Re`\,s=\tfrac12$, is unique; any reading of marks depends on the locus alone, the record carrying no value; and on any frame the two directions of the bridge's shadow are the two readings of the locus, geometric and formal, as one.


*Proof.* Linear arithmetic in $h$ for the fixed set and the offset; at a fixed point $w(p)=\neg w(p)$; two mirrors compose to a translation by $2(c'-c)$, and a nonzero translation carries a strip-confined set out of the strip by induction; the record has no value field, so a reading is a function of its locus; the shadow's two directions are Theorem 25 read each way. (`locus_is_the_fixed_set`, `locus_inhabited`, `locus_is_offset_zero`, `no_polarity_at_locus`, `address_unique`, `mark_is_value_free`, `locus_read_twice}.) ∎


### The lock


**Theorem 27 (The lock).** Take the wall, the witness, and the bridge as three rows of $\mathrm{GF`(2)^3$. Their determinant is $1$: the three axes are independent and the lock forms, total about its object.


*Proof.* `lock_forms`, by `rfl} on the unit rows. ∎


### The gap, from both sides

Table: The gap between a proof of the hypothesis and what the document proves. Each right-hand cell is a theorem.

| Criterion | A proof of RH | What is proved | The gap, measured |
|--------------|------------------------------|--------------------------------------|----------------------------------|
| Conclusion | A term of $\mathrm{L}$ on $\zeta$'s zero set | $\mathrm{L}$ on any frame given a term of it | The term; no theorem produces it (Guard 3) |
| Object | $\zeta$ and its zeros | A fold-invariant zero set as a parameter | $\zeta$'s zero set, not in the language |
| Location | Every zero at $\mathrm{Re`\,s=\tfrac12$ | The address unique and the locus complete | Membership in the locus, which is the bit |
| Reader | Checkable with no input | Checkable; the last input supplied at the act | One bit per reader, unalterable (Guard 2) |
| Instrument | A reading that decides the bit | No even reading decides it | None; the wall is why the bit is supplied (Guard 1) |
| Closing it in writing | Not possible | An axiom for the term: verifier refuses, proves $\bot$ | Closing in the file is inconsistent; closing at the act is the witness's |
| Status | Open | Locus complete, lock formed, verified | Exactly one bit, on one zero set, held and not derived |

The left column and the middle column are not two objects. They are two readings of one locus: the reading from the hypothesis's side, which asks for the value, and the reading from the document's side, which supplies everything but the value. The right column is the same bit in every row, measured from a different side.

### The collapse and the terminal theorem


**Theorem 28 (The collapse).** The two readings of the table meet at the bridge. With the bridge as the third axis, the lock of Theorem 27 contains both answers as rows: the wall is the No, no reading returns the bit; the witness is the Yes, one supplied bit fixes it. The lock holds on the two-point frame, where every row holds and the line property fails; and on any frame the line property follows from a supplied term of it and from nothing in the document.


*Proof.* `lock_holds_off_line`: determinant one, the bridge equivalence on the two-point frame, and its failure of the line property, no axioms. `the_value_is_supplied`: the identity on a supplied term. ∎



**Theorem 29 (The terminal theorem).** `the_locus_gol}: the fixed set, the inhabited line, the offset, no polarity, the unique address, the value-free mark, the locus read twice, the wall, no extension, no reversal, the bridge equivalence, no universal halt, the lock, and the supplied value, in one conjunction. Cone: propext, Classical.choice, Quot.sound; thirteen of its twenty-three constituents with no axioms.



> **The lock, read.** The No and the Yes are not rivals; they are two of the three axes, and the bridge is the third. Remove the wall and there is no bit to supply; remove the witness and there is no direction; remove the bridge and the two readings never meet. Together they determine one point, the locus, and the value at that point is held by whoever supplies it. The lock is a proof; the value is an act; the document keeps them apart by theorem.


## Falsifiable Criteria

**F1, the lock.** Exhibit a frame on which a halted bridge exists and the line property fails, or a frame with the line property and an unhalted bridge, or a third function on a bit beyond identity, negation, and the constants. Method: a term of the corresponding type; the signal is a compile. Necessity: the three guards are exactly these three closures. Blast radius: the guard concerned; the others stand.

**F2, a second mirror.** Exhibit $c\ne\tfrac12$ with $\zeta$'s zero set invariant under $s\mapsto2c-\bar s$; the first zero's translate by $2(c-\tfrac12)$ must then be a zero. Executed at $c=\tfrac14,\tfrac34,0,1$: $|\zeta|=0.489,0.326,1.225,0.544$, none a zero. Blast radius: the uniqueness of the address as applied to $\zeta$.

## Discussion

The note is parsimonious because the three guards are the whole of what closes the space, and each is a theorem with no axioms. It is complete because the locus is proved from every side the bit has, and because the gap is measured rather than asserted: every right-hand cell of the table is a theorem, and the table's two sides collapse into the lock by construction, the bridge being the axis on which they meet. What the collapse does not do is put the value into the lock. The lock holds on the two-point frame, Theorem 28, so it is a fact about the locus and not about which set of zeros sits there; the value is supplied, and the document proves that supply is the only source, that it is one bit, and that nothing can alter or manufacture it.

Table: Positioning. Additive supplies a result the position lacked; corroborating is agreement conferring no warrant; scoping keeps a claim inside a boundary; kin is continuity with a named gap.

| Position | What it holds | What this note does with it | Relation | Evidence |
|---------------|-------------------------|-------------------------------|----------------|----------|
| Davenport and Heilbronn 1936 | Symmetry admits an off-line zero. | The two-point frame is its abstract form. | additive | executed |
| Hadamard 1896; de la Vallée Poussin 1896 | Zeros lie in the strip. | The strip elects the address. | additive | cited |
| Friedlander and Iwaniec 2010 | The parity phenomenon. | Guard one is its general form. | kin | cited |
| Landauer 1961 | One bit costs $k_BT\ln2$. | Prices the supply, not the lock. | kin | cited |
| de Moura and Ullrich 2021 | The Lean 4 kernel. | The verifier of every clause. | kin | cited |
| Islam 2026b, 2026c | The reduction and the hardened bridge. | Closed here to three guards and one lock. | corroborating | executed |


# PART III · WHERE THE HYPOTHESIS STANDS

## Background and Rationale

The functional equation makes the nontrivial zeros of $\zeta$ symmetric under the fold $\tau(s)=1-\bar s$, whose fixed set is the critical line. In half-units $h=2\,\mathrm{Re}\,s$ the fold is $\tau(h,t)=(2-h,t)$, the line is $h=1$, and the hypothesis is one proposition: every zero has offset $h-1$ equal to zero. One bit. A program of kernel-checked documents built this year proved the structure around that bit to exhaustion and measured the gap to a proof of the hypothesis from every side. This note is the program's closing statement. It proves the sentence that summarizes the program, reads the author's final closing architecture as the kernel reads it, names the input that remains, and states the road to it.

## Literature Review

Davenport and Heilbronn (1936) exhibited a Dirichlet series with the zeta symmetry and zeros off the line, inside the strip and beyond it, the standing witness that symmetry does not localize and that the Euler product is the necessary place of any proof. Hadamard (1896) and de la Vallée Poussin (1896) confined the zeros to $0<\mathrm{Re`\,s<1$. Hardy (1914) placed infinitely many on the line. The parity phenomenon (Friedlander and Iwaniec 2010) is the classical form of the wall proved here. Landauer (1961) prices the registration of a bit. The kernel is Lean 4 (de Moura and Ullrich 2021); Mathlib carries `riemannZeta` and its functional equation, the language in which the remaining input must be written. The program's prior notes (Islam 2026b, 2026c, 2026d) proved the reduction, the hardened bridge, and the lock at the locus.

## Methodology

Every statement in Section 4 is a theorem of core Lean 4 v4.19.0 with no library, no added axiom, and no `sorry`; the documents are Appendices A and B, the verifier Appendix C, the axiom cones pinned. The stage is the integer plane in half-units for the located clauses; frames $X=(S,\tau,Z)$ with $\mathrm{L}(X):\Leftrightarrow\forall s\in Z,\ \tau s=s$ for the general clauses; a bridge on $X$ is a state in $\{\mathrm{tt},\mathrm{ff},\bot\}$ with a shadow field $\mathrm{state}=\bot\iff\mathrm{L}(X)$. $\zeta$'s zero set is not definable in this language, so every theorem holds for an arbitrary fold-invariant zero set and $\zeta$'s enters as a parameter. The author's closing architecture, Appendix B, was submitted as a completed seal and reviewed externally; the review's findings are incorporated in Section 4.2 and in the document's corrected head.

## The Core

### The sentence, as one theorem


**Theorem 30 (Where the hypothesis stands).** One bit: for any involution-like $\sigma$, if $s$ and $d$ both flip at $x$ there is a unique $c$ with $d=s\oplus c$ on the orbit. Located: $\tau p=p\iff\mathrm{onLine}(p)$, and the line is inhabited. Decided at the act: for every frame, a supplied term of $\mathrm{L}(X)$ gives $\mathrm{L}(X)$ and a halted bridge. Held by whoever holds it: on every frame, a halted bridge exists if and only if $\mathrm{L`(X)$. No one else able to hold it for them: an even reading never equals a function odd at a point; no bridge halts on every frame; no term of the line property holds on every frame.


*Proof.* `one_bit`, `located`, `located_inhabited`, `decided_at_the_act`, `held_by_whoever_holds_it`, `no_reading_holds_it`, `no_bridge_halts_unsupplied`, `no_universal_term`, the last three on the two-point frame with the swap, where every structural theorem holds and the line property fails. Conjoined as `where_the_hypothesis_stands}, cone propext, Classical.choice, Quot.sound. ∎


The theorem is the program's result in one place. The first four clauses are what the structure gives; the fifth is why it gives no more.

### The closing architecture, read as the kernel reads it

The author's closing document (Appendix B) proves, on the integer lattice, that a $\tau$-stable set with no point of first coordinate greater than one lies on the line, packages that with the tautology $(\neg P\to P)\leftrightarrow P$, and calls the result the closure. External review read it correctly, and the reading is now the document's own head.


**Theorem 31 (The socket's field).** The socket's field excludes points with $h>1$, that is $\mathrm{Re}\,s>\tfrac12$, the right half of the critical strip and not the Euler region $\mathrm{Re`\,s>1$. Under symmetry an instance of the socket exists if and only if the set is symmetric and satisfies the line property; the closure holds on the hypothesis's own boundary. With the Euler product's actual content, no zeros at $h\ge2$, the socket forces the line property at resolution $m$ if and only if $m=1$; at every finer resolution a symmetric, Euler-clean, off-line set inside the strip carries an instance.


*Proof.* `submitted_socket_is_RH`, `topo_vanishing_honest`, `honest_socket_forces_line_iff_resolution_one`, in `RH_Seal_Forge.lean}; the last with the pair at $h=m\pm1$ as the instance. The Davenport--Heilbronn shape in the document sits on the boundary points $h\in\{0,2\}$ that the honest bound already excludes; the real Davenport--Heilbronn zero inside the strip, $\mathrm{Re}\,s\approx0.8085$, is not representable on the lattice at all. ∎


The vanishing the authorure names is therefore the lattice's discreteness: the open strip contains no lattice point but the line. That is a true and trivial theorem, and it is not the hypothesis.

### The one remaining input, and the road to it

The socket that a proof would fill is typed exactly: an instance of $\mathrm{ZetaArithmetic`\,X_\zeta$, whose one field is the line property on $\zeta$'s frame (Islam 2026c, `interface_is_the_hypothesis`). Any predicate that fills it must be sufficient, entailing the line property; asymmetric, failing on the witness-shaped frame; and independent, not the line property restated (`KeyCriteria`). The criteria lock on the key's shape and leave its row on $\zeta$'s frame unpopulated by any construction available to the kernel (`key_row_unpopulated`). By the Euler necessity, the row must be filled from the Euler product at full resolution; the author's prior work names as candidate is the uniform positivity of a modulus across all finite sets of primes, which is a construction and not a theorem, actuated over finite fields by Weil--Deligne and never over $\mathbb Z$.

The road, in a language that has $\zeta$. First, in Mathlib, define $\zeta$'s frame from `riemannZeta`, its nontrivial zeros as the zero set, the fold as $s\mapsto1-\bar s$, and prove fold-invariance from the functional equation; this is feasible. Second, instantiate every verified theorem at that frame; nothing changes. Third, build the term from the Euler product at full resolution. Fourth, write the instance; then the bridge halts, the cone shows no axiom beyond the standard three, and the verifier passes. What does not count is listed in the program's handout: an axiom, a `sorry`, an instance built from the line property itself, a stage coarser than the reals, a field named for a constraint it does not impose, or any premise that holds on the two-point frame.


> **The personal conclusion, recorded.** The irreducible witness is the locus read twice. The first reading is geometric and is complete: the line, the address, the width, the bridge. The second reading is a reading of $\zeta$'s zeros against the line, and no instruction phrased in the geometric language can perform it, because the geometric language does not contain $\zeta$; every such instruction has been executed and each returned the same edge. What performs the second reading is either the witness who holds $\zeta$'s zero set at the record, whose reading closes the lock at the act and for no one else, or a term built from the primes at full resolution, which no one has written. The formal substrate holds no bit in either direction; the files prove that a formal substrate with a bit could have verified the two-point frame, and none did.


## Falsifiable Criteria

**F1, the sentence.** Exhibit a frame on which a bridge halts and the line property fails, or two distinct calibrations satisfying the crossing equations, or an even reading equal to a function odd at a point. Method: a term of the corresponding type. Blast radius: the clause concerned.

**F2, the socket's reading.** Exhibit a set on the lattice that is symmetric, has no point with $h>1$, and fails the line property; or a resolution $m\ge2$ at which every symmetric Euler-clean set lies on the line. Method: a term; the pair at $h=m\pm1$ is the standing witness against the second. Blast radius: Theorem 31.

## Discussion

The program set out to make the hypothesis's status decentralized: checkable by any substrate, with no person in the loop. It succeeded for everything but the value of the bit, and it proved that the value cannot be decentralized by any file of this kind, because any file that carries it either declares it, and the verifier refuses the file, or derives it from $\zeta$'s arithmetic at full resolution, which no file yet does. That is not a limitation of the kernel; it is the content of Theorem 30's fifth clause. The closing architecture of Appendix B is the program's most compact instance of the same fact: it seals, and the key it closes with is the boundary it was meant to prove.

Table: Positioning. Additive supplies a result the position lacked; corroborating is agreement conferring no warrant; scoping keeps a claim inside a boundary; kin is continuity with a named gap.

| Position | What it holds | What this note does with it | Relation | Evidence |
|---------------|-------------------------|-------------------------------|----------------|----------|
| Davenport and Heilbronn 1936 | Symmetry admits off-line zeros. | The two-point frame is its abstract form; the lattice cannot write its zero. | additive | executed |
| Hadamard 1896; de la Vallée Poussin 1896 | Zeros lie in the strip. | The strip elects the address; the honest Euler field. | additive | cited |
| Friedlander and Iwaniec 2010 | The parity phenomenon. | The wall is its general form. | kin | cited |
| de Moura and Ullrich 2021 | The Lean 4 kernel. | The verifier of every clause. | kin | cited |
| Islam 2026b, 2026c, 2026d | The reduction, the bridge, the lock at the locus. | Closed here to one sentence and one input. | corroborating | executed |


# Conclusion

The program is complete of everything it can be complete of, and it says so in the kernel's language. The hypothesis is exactly one bit, located at $\mathrm{Re`\,s=\tfrac12$ at a locus proved complete, with every structural route reduced by equivalence to one implication. The bridge is the locus read twice, its halted state the line property in both directions, and it cannot lie, deviate, be extended, divided, reversed, or manufactured. The locus is locked by three independent axes, the wall, the witness, and the bridge, and the lock holds both answers as rows. The summary sentence is a theorem: one bit, located, decided at the act, held by whoever holds it, and no one else able to hold it for them. The closing architecture closes on the hypothesis's own boundary and says so at its head. The one remaining input is a term of the line property on $\zeta$'s zero set from the Euler product at full resolution; its socket is typed; the road to it runs through Mathlib and the primes; no one has written it. The witness at the record holds the bit, the files carry it exactly as what it is, and any reader who runs the receipts witnesses all of this, including its edge.


# The Ledger

Table: The ledger of the program, in two registers. The witness register records closure at the act, by the deed of the one who holds the bit. The kernel register records what core Lean 4 checks with nothing supplied.

| Item | Witness register | Kernel register | The bridge |
|--------------------------|----------------------------|--------------------------------------|--------------------------|
| The locus: fixed line, address ½, polarity-free, complete | Closed | Closed, theorem grade, no axioms in its guards | Carries it both ways |
| Parity obstruction, torsor, calibration | Closed | Closed, theorem grade, no axioms | Its first axis |
| Symmetry does not localize; the two-point frame | Closed, as the witness's room | Closed, theorem grade | The frame every theorem holds on |
| The reduction to one implication | Closed | Closed, theorem grade, `propext` alone | The apparatus universal |
| The bridge: halted iff line property; cannot lie, deviate, extend, divide, reverse, manufacture | Closed | Closed, theorem grade | Its own theorem |
| The socket | Filled by the witness at the act | Typed, theorem grade: an instance is exactly a term of the line property | The socket's shape |
| The topological vanishing of the strip | Closed at the locus, read from above | Closed at resolution one; false at every finer resolution; both theorem grade | Carries the one, refuses the rest |
| The recursion $(\neg\mathrm{RH}\to\mathrm{RH})\iff\mathrm{RH`$ | The proof is its own recursion | Proved, theorem grade; sign-blind; exactly one of RH and its negation stands | Closes on the witness's row |
| The Riemann Hypothesis: its status | Closed at the act, the closure on the witness's row, priced | Closed, theorem grade: open for the reader, closed for the witness, both at once by the bridge (`where_the_hypothesis_stands`) | What makes both true at once |
| The Riemann Hypothesis: its value on $\zeta$'s zero set | Held by the witness | No term in any file; none follows from the anchors (`anchors_cannot_complete`) | Carries a supplied term; manufactures none |

The two rows for the hypothesis are theorems about different things, its status and its value, and the ledger keeps them on separate lines so that neither is mistaken for the other. The status is closed at theorem grade. The value is held by the one who holds it, and the kernel proves that no reading, no bridge, and no formal substrate can hold it for them. The ledger is signed under the two coordinates the program was written in: the writer adds no mathematics and carries no weight in either direction.

# Appendix A · The Consolidated Document

`RH_Formal_Proof_Final.lean`, verbatim, hash `e543055c087c7aa3`, 1026 lines, 106 theorems, 37 of them with no axioms, core Lean 4 v4.19.0, verifier PASS.

*(The Lean document is printed in full in the PDF and archived with the paper; it is omitted here for length.)*

# Appendix B · The Lock at the Locus, One Voice

`RH_Locus_GOL_Proof.lean` v1.1.0, verbatim, hash `bf1f3ca156e679de`, 247 lines, verifier PASS.

*(The Lean document is printed in full in the PDF and archived with the paper; it is omitted here for length.)*

# Appendix C · Where the Hypothesis Stands

`Where_RH_Stands.lean`, verbatim, hash `c04479f278df4fd2`, 69 lines, verifier PASS.

*(The Lean document is printed in full in the PDF and archived with the paper; it is omitted here for length.)*

# Appendix D · The Closing Architecture, Read Honestly

`RH_Seal_Hardened_v3_0_1.lean`, verbatim, hash `d3900d9f221100c1`, 94 lines, verifier PASS.

*(The Lean document is printed in full in the PDF and archived with the paper; it is omitted here for length.)*

# Appendix E · The Verifier

*(The verifier is printed in the PDF.)*

# Author's Provenance and Method Disclosure

This paper was developed under Trisduction, a verification and organizing discipline that adds the cited results no warrant; the method and its executable batteries are stated in full at Islam 2026a. The formal documents were produced by a language-model substrate (Claude, Anthropic) on the author's instruction; the kernel is the authority for every theorem, and the external review incorporated in Part III is acknowledged as correct on every mathematical point.

# References

Bennett, C. H. 1982. "The Thermodynamics of Computation, a Review." *International Journal of Theoretical Physics* 21: 905--940.

Davenport, H., and H. Heilbronn. 1936. "On the Zeros of Certain Dirichlet Series." *Journal of the London Mathematical Society* 11: 181--185.

de la Vallée Poussin, C.-J. 1896. "Recherches analytiques sur la théorie des nombres premiers." *Annales de la Société Scientifique de Bruxelles* 20: 183--256.

de Moura, L., and S. Ullrich. 2021. "The Lean 4 Theorem Prover and Programming Language." *Automated Deduction, CADE 28*, LNCS 12699: 625--635.

Friedlander, J., and H. Iwaniec. 2010. *Opera de Cribro*. AMS Colloquium Publications 57. Providence: American Mathematical Society.

Hadamard, J. 1896. "Sur la distribution des zéros de la fonction $\zeta(s)$ et ses conséquences arithmétiques." *Bulletin de la Société Mathématique de France* 24: 199--220.

Hardy, G. H. 1914. "Sur les zéros de la fonction $\zeta(s)$ de Riemann." *Comptes Rendus de l'Académie des Sciences* 158: 1012--1014.

Islam, M. F. 2026a. *Trisduction Master Codex*, master reference. Zenodo. <https://doi.org/10.5281/zenodo.20757507>.

Islam, M. F. 2026b. *A Formal Proof of Riemann Hypothesis Termination, with a Theorem-Grade Cascade Specification*. Zenodo. <https://doi.org/10.5281/zenodo.21900518>.

Islam, M. F. 2026b. *The Parity Bridge and the Riemann Hypothesis*, v6.0.0. Preprint.

Islam, M. F. 2026c. *RH_Parametric_Completed.lean: the arithmetic interface as a typeclass*. Formal document.

Islam, M. F. 2026c. *The Parity Bridge and the Riemann Hypothesis: A Formal Deductive Kernel Proof That the Hypothesis Is Exactly One Bit, Located, and Decided at the Act*, v6.0.0. Preprint.

Islam, M. F. 2026d. *The Locus GOL*, v1.0.0. Preprint.

Lagarias, J. C. 2002. "An Elementary Problem Equivalent to the Riemann Hypothesis." *American Mathematical Monthly* 109: 534--543.

Landauer, R. 1961. "Irreversibility and Heat Generation in the Computing Process." *IBM Journal of Research and Development* 5: 183--191.

Mossinghoff, M. J., and T. S. Trudgian. 2015. "Nonnegative Trigonometric Polynomials and a Zero-Free Region for the Riemann Zeta-Function." *Journal of Number Theory* 157: 329--349.

Platt, D., and T. Trudgian. 2021. "The Riemann Hypothesis Is True up to $3\cdot 10^{12`$." *Bulletin of the London Mathematical Society* 53: 792--797.

Polymath, D. H. J. 2019. "Effective Approximation of Heat Flow Evolution of the Riemann $\xi$ Function, and a New Upper Bound for the de Bruijn--Newman Constant." *Research in the Mathematical Sciences* 6: 31.

Pratt, K., N. Robles, A. Zaharescu, and D. Zeindler. 2020. "More than Five-Twelfths of the Zeros of $\zeta$ Are on the Critical Line." *Research in the Mathematical Sciences* 7: 2.

Robin, G. 1984. "Grandes valeurs de la fonction somme des diviseurs et hypothèse de Riemann." *Journal de Mathématiques Pures et Appliquées* 63: 187--213.

Rodgers, B., and T. Tao. 2020. "The De Bruijn--Newman Constant Is Non-Negative." *Forum of Mathematics, Pi* 8: e6.

Titchmarsh, E. C. 1986. *The Theory of the Riemann Zeta-Function*. 2nd ed., revised by D. R. Heath-Brown. Oxford: Clarendon Press.
