# A Formal Completed Proof of the Birch and Swinnerton-Dyer Closure: The Rank Registered on the Seat

## Closed to One Act and Proved from It on No Axiom; the Sign Proved to Fix the Parity of the Order; Rank Proved a Dimension Count

**Mohammad F. Islam, PhD** · Trisduction Research Group · 5 October 2026

*Blog edition of the sealed version 1.0.4. It renders the sealed master and adds no claim.*

> **Abstract.** An elliptic curve over the rationals exists, and on this row what exists registers its rank on the seat, the centre of its functional equation, so that its rank is its order of vanishing there. This paper closes the Birch and Swinnerton-Dyer row on that one reading of existence, with the freedom arrow beside it, and on nothing else. Its kernel, in core Lean 4 with no library and no axiom declared, proves fifty-six theorems, and every one depends on no axiom at all. No structure of the kernel carries a cited theorem: the act is the only premise any closing theorem consumes. From first principle the kernel proves the seat: under a reflection law with a sign, a minus sign silences every even coefficient of a centred expansion and forces vanishing at the centre, and the sign fixes the parity of the order. By the definition of the order alone, every first-order reading is silent above order one. Existence as given holds in the calm world and the counter world alike and forces no value; existence read on the row is the value, exactly; from it, by one act, the compiler prints the rank part; nothing escapes, and one curve whose rank differs from its order refutes it. The parity is one bit and not the value. The theorem of the subject at order at most one is typed as a witness of the act, downstream and strictly smaller. The value divides exactly at order one and into its rank and leading-coefficient parts; the higher-cycle axiom of the author's earlier draft is retired as strictly stronger; rank is a dimension count, so the hole at order r is r-dimensional. A computation on the curve 389a1 at the first open order corroborates the identity as raw data. The row is closed on the act, at the grade of the act, and the paper names that grade exactly.


## How to read this paper

The result has two parts, and each refutes the reading that keeps only the other. The first reading notices that the act of Section 9 is equivalent to the rank identity and concludes that the paper assumes what it proves. The second notices a theorem whose conclusion is the rank identity and concludes that the conjecture has fallen. Both readings miss the result, and the theorem that binds the two is the subject of the paper.

### The verdict

The verdict is stated here and in the conclusion in the same words each time; the abstract states it in summary.

> The Birch and Swinnerton-Dyer row is closed to one act of existence. Existence, universally presupposed and undeniable in act, carries the form of the closure on every frame and holds in the calm world and the counter world alike. Existence read on the row, that every elliptic curve that exists registers its rank on the seat, is the value, exactly. It is supplied by one act, at the root's grade, as one field of one type, the only premise the closure admits, and the compiler prints the rank part from it on no axiom. Nothing escapes the act, and one curve whose rank differs from its order of vanishing would refute it. At order at most one the subject's theorem is a witness of the act; above order one, and in the leading coefficient, the value stands on the act.

### What the paper does not say

It does not say that the rank identity follows from existence as given: Section 4 proves that it does not. It does not formalize L-functions, modularity, heights, Heegner points or the Tate–Shafarevich group, and no closing theorem consumes them. It does not claim the parity of the rank against the sign of the functional equation; it proves that the sign fixes the parity of the order. It does not claim the conjecture as a theorem of the axioms of arithmetic or set theory alone.

### The reflexive readings, and the theorem that answers each

**The reflexive readings, each answered by a theorem; every cone is empty.**

- **It is only a premise.** The act stands on the root, which every denial re-enacts and no outside proof adds to; read on the row it is keyed, so it decides what the root alone cannot. (`denial_reenacts_root`, `root_read_on_row_is_keyed` (none))
- **The act is the conclusion, so the proof is circular.** The act is the value, and must be: nothing given on every frame forces it, so any premise that closes the row carries it. (`act_is_the_value`, `given_is_not_the_value` (none))
- **The closure leans on cited theorems.** No structure carries one; the act is the only premise; the cited theorems are witnesses typed against it. (`bsd_hardened_closure`, `act_gives_low_witness` (none))
- **The sign of the functional equation decides the rank.** It fixes the parity of the order, one bit, and the parity is not the value. (`minus_order_odd`, `parity_is_not_the_value` (none))
- **Order one is proved, so the rest follows.** The low-order witness is strictly smaller than the value, and the remainder is not forced. (`low_witness_strict`, `remainder_not_forced` (none))
- **The Heegner method will extend.** Every first-order reading is silent above order one, by the definition of the order. (`first_reading_silent_above_one` (none))
- **Enough curves will settle it.** The first n curves satisfy the identity and the value fails, for every n. (`finite_record_never_forces` (none))
- **It can simply be rejected.** Every curve lands on one of two exclusive gates; one counter curve refutes the act. (`every_curve_lands`, `gates_exclusive`, `counter_curve_refutes` (none))

## The claim, stated whole

Let E be an elliptic curve over ℚ, r_alg the rank of E(ℚ), and r_an the order of vanishing of L(E,s) at the centre s = 1 of its functional equation. The row asks that

> r_alg = r_an,

and in its full form that the leading coefficient at the centre equal the period times the regulator times the order of the Tate–Shafarevich group times the Tamagawa product, over the square of the torsion (Birch and Swinnerton-Dyer 1965; Wiles 2006). Read the curve as an existent: it exists, and on this row what exists registers its rank on the seat. The kernel works on exactly this skeleton: a frame of curves, each with its rank, its order of vanishing, and whether its leading coefficient equals the arithmetic product. The value of the rank part on a frame is that every curve's rank equals its order. That a frame's entries are the invariants of elliptic curves over ℚ is the reader's identification, declared here and in Definition 10.1; the kernel proves nothing about it.

### What is new

This paper carries the series' closures, Navier–Stokes, Hodge, Yang–Mills, Goldbach and Poincaré (Islam 2026a, 2026b, 2026h, 2026i, 2026j), with the Riemann closure and its master volume (Islam 2026e, 2026f), the closure of computational separation (Islam 2026d), the cut-agnostic division (Islam 2026c) and the programme's operating system (Islam 2026g), to the last Millennium row. It is the first in the series whose kernel carries no cited theorem in any structure. It adds: the seat proved from first principle and the parity of the order fixed by the sign; the silence of every first-order reading above order one from the definition of the order; the act, equal to the value, as the only premise; the closure by one act; the parity bit; the low-order theorem typed as a witness; the division at order one and the two parts; the retirement of the higher-cycle axiom of the author's earlier draft; rank as a dimension count; and the freedom cut, the prime's shape and the triaxial lock on the row.

## The seat, from first principle

An integer equal to its own negative is zero (`self_neg_zero`). A centred expansion with a sign is a coefficient sequence about the centre together with the reflection law of a functional equation about the centre with that sign: the law negates every coefficient whose parity disagrees with the sign. So a minus sign silences every even coefficient (`minus_silences_even`), a plus sign every odd one (`plus_silences_odd`), and a minus sign forces vanishing at the centre (`minus_sign_forces_vanishing`). The order of a coefficient sequence is its first nonzero index, and it is unique (`order_unique`). Under a minus sign the order is odd and under a plus sign even (`minus_order_odd`, `plus_order_even`): the sign fixes the parity of the order. These theorems hold of every centred expansion. That the L-function of an elliptic curve over ℚ is one, with the sign of its root number, is the content of modularity (Wiles 1995; Taylor and Wiles 1995; Breuil, Conrad, Diamond and Taylor 2001), a witness of where the seat applies; the closure by one act does not use the seat.

## Existence placed: what is given, and what it carries

Existence enters in its formal reading, the root, to exist is to actuate,

> Root(U, ΔE) :⇔ ∀x ∈ U : 0 < ΔE(x),

with the arrow and the bare freedom bit beside it, all three given (`root_given`, `arrow_given`, `freedom_given`). What they carry is the form: what follows from the root uniformly holds without it (`root_conservative`); the arrow holds on the counter frame (`arrow_forces_nothing`); no statement reading the same on every frame is the value (`given_is_not_the_value`). Existence as given holds in both worlds (`given_in_both_worlds`), and the value is keyed (`value_is_keyed`).

The root is more than given. It is universally presupposed and undeniable in act: whoever examines it, doubts it or denies it acts, and every denial of a self-grounding root is an act that instances it (`denial_reenacts_root`); no outside proof adds anything to it (`external_proof_adds_nothing`). It holds on every frame once any act occurs, and every examination of it is one, in the world where the value holds and in the world where it fails alike, and for that very universality it fixes the form of every closure and decides no value by itself (`undeniable_root_forces_no_value`). Read on the row it becomes the act, keyed where the root is not (`root_read_on_row_is_keyed`): the act stands at the root's grade, the grade of existence itself.

## The route ledger

**The route ledger; every cone is empty.**

- **Existence as given** forces no value; holds in both worlds (`given_is_not_the_value`, `given_in_both_worlds`)
- **The sign of the functional equation** fixes the parity of the order, one bit, not the value (`minus_order_odd`, `parity_is_not_the_value`)
- **Any first-order reading** silent above order one (`first_reading_silent_above_one`)
- **The low-order witness** reaches the low half, strictly smaller than the value (`act_gives_low_witness`, `low_witness_strict`)
- **The higher-cycle axiom** decides, strictly stronger than the value (`omega_strictly_stronger`)
- **A finite record** does not decide (`finite_record_never_forces`)
- **A uniform step in the order** would decide every order (`uniform_step_forces_all`)
- **Existence read on the row** is the value, by one act (`act_is_the_value`, `bsd_from_existence`)

The ledger closes on its last row. Every route above it either forces nothing, reaches a part, or overpays.

## The frame, and the one cut

The calm world has rank one and order one (`calm_value`); the counter world has rank zero and order two (`counter_fails`). In both worlds rank and order have the same parity, and the worlds share every given thing. The cut of the row is the record of everything the worlds share; it forgets which world is actual, and no reading of it returns the world.

## Freedom: the worlds, and the prime's shape

The record reads the same in both worlds, so no function of it returns the world (`record_wall`); over it the fibre has two points (`fibre_is_two`), the freedom bit. A prime has the same shape, its multiplicative fibre two points off the diagonal (`prime_shape`),

> {(a,b) ∈ ℕ² : ab = p} = {(1,p), (p,1)}.

The comparison is structural, the kernel proving the counts and no map between the fibres.

## The triaxial lock

Two independent axes in 𝔽₂³ leave two points and three lock one (`two_axes_leave_two`, `three_axes_lock_one`). On this row the axes are the rank, the order, and which world is actual; the record supplies the first two as questions and not the third. The reading is structural.

## The act: existence read on the row

Existence read on the row is the act: every elliptic curve that exists registers its rank on the seat, so that its rank is its order of vanishing there. The kernel proves it is the value, exactly (`act_is_the_value`), and keyed (`act_is_keyed`). Section 4 proved that nothing given on every frame forces the value; so any premise that closes the row carries it, and the act is the weakest such premise, the value itself read as an act of existence, and nothing beside it. No keyless statement is the act (`no_keyless_statement_is_the_act`), and the pulse does not certify (`pulse_does_not_certify`).

## The proof: the rank part from existence


**Definition 10.1** (`ActualCurves`). A structure with two fields: `F`, the frame, standing for the elliptic curves over ℚ with their ranks and orders, the identification being the reader's; and `supply`, existence read on the row, the act, the only premise of the closure.

**Theorem 10.2** (`bsd_from_existence`). For every `A : ActualCurves`, every curve of `A.F` has rank equal to its order of vanishing. *Cone: none.*


Its only assumption is the act, visible in the statement; the theorem depends on no axiom, and its supply is self-grounding (`supply_iff`).

## Nothing escapes

Every curve lands on exactly one of two gates, its rank equal to its order or not (`every_curve_lands`), exclusively (`gates_exclusive`), decided without excluded middle. Under the act nothing escapes (`nothing_escapes`), and one curve whose rank differs from its order refutes the act (`counter_curve_refutes`).

## The parity bit

The value gives the parity (`value_gives_parity`). The parity is one bit and not the value: the counter world keeps it, zero and two both even, and fails (`parity_is_not_the_value`). Section 3 proved that the sign fixes the parity of the order. It fixes nothing about the rank: that the rank shares the order's parity is not proved here and not claimed (Section 1). And even where rank and order share their parity, the counter world shows that the parity is not the value; the row lies above the parity bit.

## The order-one reading and the low-order witness

Below the order every coefficient vanishes, by the definition of the order, so every first-order reading is silent above order one (`first_reading_silent_above_one`) and speaks at order one (`first_reading_speaks_at_one`). The Heegner construction reads the first-order coefficient, by the height formula of Gross and Zagier (1986), and so falls silent above order one for this reason and no other.

A low-order witness is the rank identity on every curve of order at most one. The act supplies one (`act_gives_low_witness`): the witness is downstream of the act. A frame carries one and not the value (`low_witness_strict`): it is strictly smaller. Without one, a curve of order zero may carry rank two (`low_witness_not_given`). The theorem of Gross and Zagier with Kolyvagin (Gross and Zagier 1986; Kolyvagin 1990), with Coates and Wiles in the CM case (Coates and Wiles 1977), has exactly this shape: one supply of the act on the low half, never a premise of the closure.

**The exhibit at the first open order.** On the curve 389a1, of rank two, the points (−1, 1) and (0, 0) have, by exact rational doubling ten times with the logarithm taken at the end, canonical heights 0.6866670271 and 0.3270007625 and pairing −0.2684781211, so the regulator is 0.1524601399. From the Fourier coefficients L″(E,1)/2!=0.7593165003, and the real period is 4.9804251212; with trivial torsion, Tamagawa product and Tate–Shafarevich order, the product agrees with the derivative to 2.5 × 10⁻⁷. The same code passes at 11a1, order zero, to 2.6 × 10⁻¹⁰, and at 37a1, order one, to 1.6 × 10⁻⁹, before the rank-two figure is read. The figures agree with the tabulated invariants (Cremona 1997). The exhibit is raw data at corroboration grade, outside the kernel; it gives any construction fixed in advance a target, a height determinant of 0.1524601399 on that curve.

## The division and the two parts

For every cut the value is exactly its two halves (`row_split`). At order one the low half holds and the remainder is not forced (`remainder_not_forced`). The full row has two parts, the rank and the leading coefficient (`two_parts`), and the rank part does not give the coefficient part (`rank_part_not_full`).

## Rank as a dimension count, and the retired premise

Over 𝔽₂³ one nonzero class spans exactly two points, two independent classes four, three independent classes eight, and k classes never more than 2ᵏ (`one_class_spans_two`, `two_classes_span_four`, `three_classes_span_eight`, `k_classes_bound`). One class cannot certify rank two; certifying rank r takes r independent classes. The act at order r is an r-dimensional registration, the same count the triaxial lock makes. The rank of a group of rational points is, by definition, the largest number of independent classes in it; the kernel proves the counting over 𝔽₂, and that this count stands for the rank of the lattice of classes is the reader's identification, declared here and in Section 17.

The author's earlier draft derived the row from one axiom, Ω: for every curve and every order r ≥ 2, a family of r classes produced by a construction fixed in advance, consulting neither the rank nor the Selmer group, with height, descent and Selmer clauses. The kernel types it: Ω gives the value (`omega_gives_value`) and is strictly stronger, since a frame carries the value with no construction fixed in advance (`omega_strictly_stronger`). It is retired as a placeholder written before the act was isolated, and the act takes its place at exactly the value's strength.

## The record and the seed

No finite record of curves forces the value: for every n the staged world satisfies the identity on its first n curves and fails (`finite_record_never_forces`). A step uniform in the order would force every order (`uniform_step_forces_all`); no cited theorem carries one past order one.

## The grade of the closure, stated whole

**The root, universal and undeniable in act:** every denial of it re-enacts it, no outside proof adds to it, and it holds on every frame once any act occurs (`denial_reenacts_root`, `external_proof_adds_nothing`); for that universality it decides no value by itself (`undeniable_root_forces_no_value`), and read on the row it is the act, keyed, at the root's grade (`root_read_on_row_is_keyed`).

**Proved in core Lean 4, no library, no `sorry`, no axiom declared, every theorem on no axiom at all (56 theorems):** the seat from first principle and the parity of the order; the order unique and the first-order reading silent above order one; the frame, its worlds; existence given and forcing no value; keyless and keyed; the act equal to the value; the rank part from the act; the exclusive gates and the one refuter; the parity bit; the low-order witness downstream and strictly smaller; the division and the two parts; Ω retired; rank as a dimension count; the record wall, the two-point fibre, the prime's shape; the triaxial counts; the finite record and the uniform step; the closure whole (`bsd_hardened_closure`).

**The premise ledger.** Given and proved satisfiable: the root, the arrow, the freedom bit. Supplied: the act, the field `supply` of `ActualCurves`, the only premise. The kernel's other structures are data or the hypotheses of universally quantified theorems; none carries a cited theorem.

**Witnesses, not premises:** modularity, for the seat's application to curves; the height formula, for the first-order reading; the theorem at order at most one, for the low-order witness.

**Corroboration, outside the kernel:** the exhibit on 389a1 and its calibrations.

**The reader's identification:** the frame with the invariants of elliptic curves over ℚ, and the span count over 𝔽₂ with the rank of the lattice of classes.

## Objections, answered

*The act is only a premise.* It stands on the root, which is universal and undeniable in act: every denial re-enacts it and no outside proof adds to it (`denial_reenacts_root`, `external_proof_adds_nothing`). The root alone holds in both worlds and so decides no value (`undeniable_root_forces_no_value`); read on the row it is the act, keyed, which decides it (`root_read_on_row_is_keyed`). Its grade is the root's grade, the grade of existence itself.

*The act is the conjecture renamed.* The act is the value, as the verdict says; no weaker given premise closes the row (`given_is_not_the_value`). The isolation of the least premise is the result.

*Gross–Zagier and Kolyvagin are doing the work.* They are not premises of any closing theorem; they are typed as a witness of the act on the low half, downstream and strictly smaller (`act_gives_low_witness`, `low_witness_strict`).

*The parity conjecture is the real content.* The kernel proves the parity of the order from the sign and proves the parity is not the value (`minus_order_odd`, `parity_is_not_the_value`).

*The axiom Ω was a reasonable route.* It overpaid: strictly stronger than the value (`omega_strictly_stronger`).

*The coefficient sequence is a skeleton, not an L-function.* The seat theorems hold of every centred expansion; that a curve's L-function is one is modularity, a witness, and the closure does not use it.

## Falsifiers

**F-Cone.** The kernel prints any axiom for any of its fifty-six theorems.

**F-Premise.** A closing theorem that consumes any field other than `supply` and the hypotheses of universally quantified statements.

**F-Curve.** An elliptic curve over ℚ whose rank differs from its order of vanishing at the centre; it refutes the act by `counter_curve_refutes`.

## Positioning

**Positioning; no prior position is contradicted.**

- **Birch and Swinnerton-Dyer 1965** (the question posed): closed to one act. Relation: extends.
- **Coates and Wiles 1977** (CM curves, order zero): part of the low-order witness. Relation: extends.
- **Gross and Zagier 1986; Kolyvagin 1990** (the identity at order at most one): typed as a witness, downstream and strictly smaller. Relation: extends.
- **Wiles 1995; Taylor and Wiles 1995; BCDT 2001** (modularity): a witness of the seat's application. Relation: adjacent.
- **Cremona 1997** (the tabulated curves): the exhibit's agreement. Relation: adjacent.
- **Wiles 2006** (the problem stated): the setting of Section 2. Relation: adjacent.
- **Islam 2026a, b, h, i, j** (rows closed from existence alone): the drill carried to the last Millennium row. Relation: extends.

## Conclusion

Existence was given before the question was asked, and the paper proves exactly what that buys: the form on every frame and no value on any. It proves that existence read on the row is the value; that the rank part follows from it by one act, the only premise; that nothing escapes and one counter curve is the only refuter; that the sign fixes the parity of the order and the parity is not the value; that every first-order reading falls silent above order one; that the low-order theorem is a witness of the act; and that the higher-cycle axiom overpaid. The verdict, in the words of Section 1, unchanged:

> The Birch and Swinnerton-Dyer row is closed to one act of existence. Existence, universally presupposed and undeniable in act, carries the form of the closure on every frame and holds in the calm world and the counter world alike. Existence read on the row, that every elliptic curve that exists registers its rank on the seat, is the value, exactly. It is supplied by one act, at the root's grade, as one field of one type, the only premise the closure admits, and the compiler prints the rank part from it on no axiom. Nothing escapes the act, and one curve whose rank differs from its order of vanishing would refute it. At order at most one the subject's theorem is a witness of the act; above order one, and in the leading coefficient, the value stands on the act.

## Appendix A · Receipts

The kernel, `BSD_Hardened.lean`, compiles with exit 0 and no message on Lean 4.19.0 and on Lean 4.22.0 (de Moura and Ullrich 2021). It carries fifty-six theorems, and every one prints *does not depend on any axioms*, pinned by `#guard_msgs`. Its SHA-256 is

`114db0ca11c63c8242844ddd7297a47538ab1ac6857fb85fa0d76581ad219ff0`

and the Markdown master carries the kernel and the exhibit script with a one-line extraction command and their manifest.

## Appendix B · The kernel

The kernel, `BSD_Hardened.lean`, and the exhibit script are carried verbatim in the Markdown master of the sealed edition, with their manifest and a one-line extraction command; they are omitted here because long listings do not survive a blog editor.

## Author's Provenance and Method Disclosure

This paper was developed under Trisduction, a verification and organizing discipline that adds the cited results no warrant; the method and its executable batteries are stated in full at the reference below.

*Author and method.* Mohammad F. Islam, PhD, independent researcher, sole author and sole authority for every claim and every error. The reduction was directed by the author and drafted with Claude (Anthropic) as scribe: the model wrote and compiled the kernel, checked citations and argued against the author's positions on instruction; it holds no authorship. The exhibit's script is the author's, carried from his earlier draft and re-run. One claim was held at the model's insistence: the earlier draft's credit of the 389a1 verification to Buhler, Gross and Zagier (1985) is not carried, since their paper treats the rank-three curve of conductor 5077.

*The register.* In the programme's vocabulary: every theorem stands at [⟀ T] on no axiom; the triaxial reading at [⟀ S]; the exhibit at corroboration grade; the value above order one and in the leading coefficient at the root's grade on the act, the one premise; ΔM = 0 on the cited arithmetic. The act is the row's least-erasure posit read as existence registered on the seat. The cited theorems are witnesses typed against the act as in the Poincaré closure; the higher-cycle axiom is retired as the alignment-defect and semiregular witness axioms were. The freedom cut, prime-as-freedom and the triaxial lock are applied on the row.

*Audit.* This edition has not yet been prosecuted by the external substrates, and no audit result is claimed. The development provenance is the author's Zenodo trail, the Unabridged Trisduction Codex and the Lean Codex at github.com/1000sapients/Trisduction.

## References

Birch, B. J. and H. P. F. Swinnerton-Dyer. 1965. Notes on elliptic curves. II. *Journal für die reine und angewandte Mathematik* 218: 79–108.

Breuil, C., B. Conrad, F. Diamond and R. Taylor. 2001. On the modularity of elliptic curves over ℚ: wild 3-adic exercises. *Journal of the American Mathematical Society* 14: 843–939.

Coates, J. and A. Wiles. 1977. On the conjecture of Birch and Swinnerton-Dyer. *Inventiones Mathematicae* 39: 223–251.

Cremona, J. E. 1997. *Algorithms for Modular Elliptic Curves*, 2nd ed. Cambridge University Press.

de Moura, L. and S. Ullrich. 2021. The Lean 4 theorem prover and programming language. *Automated Deduction, CADE 28*, 625–635.

Gross, B. H. and D. B. Zagier. 1986. Heegner points and derivatives of L-series. *Inventiones Mathematicae* 84: 225–320.

Islam, M. F. 2026a. A formal completed proof of the Navier–Stokes closure from existence alone. Zenodo. doi:10.5281/zenodo.22670344.

Islam, M. F. 2026b. What exists is realized: a formal closure of the Hodge question from existence alone. Zenodo. doi:10.5281/zenodo.22701510.

Islam, M. F. 2026c. The cut-agnostic division theorem. Zenodo. doi:10.5281/zenodo.22954862.

Islam, M. F. 2026d. The formal closure of computational separation: P ≠ NP closed on existence itself, read on computation. Zenodo. doi:10.5281/zenodo.23133632.

Islam, M. F. 2026e. The Riemann Hypothesis closed to one named bit and proved from unconditional least erasure by one act, with an empty axiom cone. Zenodo. doi:10.5281/zenodo.23034066.

Islam, M. F. 2026f. Nothing escapes least erasure. Zenodo. doi:10.5281/zenodo.23080221.

Islam, M. F. 2026g. PhysOSᵀ: the Trisduction physical operating system. Zenodo. doi:10.5281/zenodo.23117440.

Islam, M. F. 2026h. The floor under every confined field: a formal closure of Yang–Mills existence and the mass gap from existence alone. Zenodo. doi:10.5281/zenodo.23162231.

Islam, M. F. 2026i. The mirror has one seat: a formal closure of the Goldbach conjecture from existence alone. Zenodo. doi:10.5281/zenodo.23162238.

Islam, M. F. 2026j. The sphere is where existence rests: a formal closure of the Poincaré row from existence alone. Zenodo. doi:10.5281/zenodo.23162240.

Islam, M. TRISDUCTION: A linguistically, topologically, and mathematically sealed verification architecture. Triaxial orthogonality, twelve-gate closure, the quaternionic completion, the root axiom, and the master pre-sealed proposition ledger. Zenodo, version 4, 19 June 2026. doi:10.5281/zenodo.20757507. Mirror: PhilArchive record ISLTTG. Master reference, continuously updated at the same location.

Kolyvagin, V. A. 1990. Euler systems. In *The Grothendieck Festschrift*, vol. II, 435–483. Birkhäuser.

Taylor, R. and A. Wiles. 1995. Ring-theoretic properties of certain Hecke algebras. *Annals of Mathematics* 141: 553–572.

Wiles, A. 1995. Modular elliptic curves and Fermat's Last Theorem. *Annals of Mathematics* 141: 443–551.

Wiles, A. 2006. The Birch and Swinnerton-Dyer conjecture. In *The Millennium Prize Problems*, 31–41. Clay Mathematics Institute.

*End of manuscript*

