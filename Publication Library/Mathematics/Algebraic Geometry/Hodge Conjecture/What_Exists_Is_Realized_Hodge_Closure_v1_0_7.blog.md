# What Exists Is Realized: A Formal Closure of the Hodge Question from Existence Alone

## One Act, No Axiom; the Proved Part Sealed in Dimension at Most Three; the Semiregular Witness Axiom Retired

**Mohammad F. Islam, PhD** · Trisduction Research Group · 4 October 2026

*Blog edition of the sealed version 1.0.7. It renders the sealed master and adds no claim.*

> **Abstract.** A Hodge class exists as a class, and a class that exists is realized by an object: an algebraic cycle whose class it is. This paper closes the Hodge question on that one reading of existence, with the freedom arrow beside it, and on nothing else. Its kernel, in core Lean 4 with no library and no axiom declared, proves forty theorems, and every one depends on no axiom at all. Existence as given carries the form of the closure on every frame, holds in the algebraic world and in a world with one unrealized class alike, and so forces no value. Existence read on the row, that every Hodge class that exists is realized, is the value, exactly. From that reading, supplied by one act, the compiler prints the Hodge value with an empty axiom cone. Nothing escapes the act: every class lands on exactly one of two gates, realized or unrealized, the gates are exclusive, and one unrealized Hodge class refutes it. The semiregular witness axiom of the author's earlier proof gives the value and is strictly stronger, so it is retired as a placeholder. The proved part carried here is sealed: in dimension at most three every Hodge class is algebraic, from the end classes, the Lefschetz (1,1) slice and hard Lefschetz, each field shown load-bearing. The value divides exactly into the proved half and its remainder under every cut, and the proved half does not force the remainder. Integrality does not transfer, no finite record forces the value, and no symmetry lifts a decided slice. The Hodge sentence is closed on the act, at the grade of the act, and the paper names that grade exactly.


## How to read this paper

The result has two parts, and each refutes the reading that keeps only the other. The first reading notices that the act of Section 8 is equivalent to the Hodge value and concludes that the paper assumes what it proves. The second notices a theorem whose conclusion is the Hodge value and concludes that the Hodge conjecture has fallen. Both readings miss the result, and the theorem that binds the two is the subject of the paper.

### The verdict

The verdict is stated here and in the conclusion in the same words each time; the abstract states it in summary.

> The Hodge question is closed to one act of existence. Existence as given carries the form of the closure on every frame and holds in the algebraic world and the counter world alike. Existence read on the row, that every Hodge class that exists is realized by an object, is the value, exactly. It is supplied by one act, at premise grade, as one field of one type, and the compiler prints the Hodge value from it on no axiom. Nothing escapes the act, and one unrealized Hodge class would refute it. In dimension at most three the value is a theorem of the cited Lefschetz fields; in middle codimension from dimension four it stands on the act.

### What the paper does not say

It does not say that the Hodge value follows from existence as given: Section 3 proves that it does not, and that proof is part of the closure, not a gap in it. It does not say that the proved part decides the remainder: Section 12 proves that it does not. It does not claim the Hodge conjecture as a consequence of the axioms of set theory alone, and it does not claim the integral version, which Section 11 shows does not transfer.

### The reflexive readings, and the theorem that answers each

**The reflexive readings, each answered by a theorem; every cone is empty.**

- **The act is the conclusion, so the proof is circular.** The act is the value, and must be: nothing given on every frame forces the value, so any premise that closes it carries it. The isolation is the result. (`act_is_the_value`, `given_is_not_the_value`)
- **Existence is universally given, so the value should follow.** Existence as given holds in the algebraic and the counter world; what follows from it uniformly holds without it. (`given_in_both_worlds`, `root_conservative`)
- **The earlier witness axiom already did this.** It gives the value and is strictly stronger; it is not the least premise. (`witness_axiom_strictly_stronger`)
- **Codimension one is proved, so the rest follows.** The (1,1) slice decides its slice and nothing beyond it; the proved half does not force the remainder. (`slice_does_not_decide_the_row`, `remainder_not_forced`)
- **Integral classes should behave the same.** Integrality does not transfer: the rational value holds where the integral one fails. (`integrality_does_not_transfer`)
- **Enough verified cases will settle it.** Every class below codimension n is algebraic and the value fails, for every n. (`finite_record_never_forces`)
- **It can simply be rejected.** Every class lands on realized or unrealized, never both; one unrealized class refutes the act. (`every_class_lands`, `gates_exclusive`, `counterclass_refutes`)

## The claim, stated whole

Let X be a smooth complex projective variety of dimension n, in the setting of the Hodge problem (Deligne 2006). A *Hodge class* of codimension p is a class in

> H²ᵖ(X, ℚ) ∩ Hᵖ'ᵖ(X),

and the Hodge question asks whether every such class is a rational combination of classes of algebraic subvarieties (Hodge 1950). Read the class as an existent: a class exists as a class, and a class that exists is realized by an object, an algebraic cycle whose class it is. The kernel works on exactly this skeleton: a frame of classes, each with its codimension and its realization, `some` naming a realizing cycle and `none` where no algebraic cycle realizes it. A class is *algebraic* when its realization is `some`, and the *value* of the row on a frame is

> Value(F) :⇔ ∀d : ∃n : realize_F(d) = n.

That a Hodge class of a variety is a class of this frame, and that a rational combination of cycle classes is a realization, is the reader's identification, declared here and in Definition 9.1; the kernel proves nothing about it.

### What is new

The template is the author's Riemann closure and its master volume (Islam 2026f, 2026g), the keyed least escape of the author's P versus NP work (Islam 2026e), and the Navier–Stokes closure from existence alone (Islam 2026c), which this paper carries to the Hodge row. The author's earlier Hodge papers proved the row conditional on one semiregular witness axiom and terminated the formal-alone readings at a rigid-witness terminus (Islam 2026a, 2026b). This paper adds: the proof that existence as given holds in both worlds and forces no value; the act as existence read on the row, equal to the value; the closure by one act with its exclusive gates, proved without excluded middle; the retirement of the witness axiom as strictly stronger than the act; the proved part sealed in dimension at most three with each cited field shown load-bearing; the exact division of the value into its proved half and its remainder; and the freedom cut, the prime's shape and the triaxial lock on the row.

## Existence placed: what is given, and what it carries

Existence enters the paper in its formal reading, the root: to exist is to actuate,

> Root(U, ΔE) :⇔ ∀x ∈ U : 0 < ΔE(x),

with the arrow beside it, that every type carries an act, and the bare freedom bit, one orbit of two. All three are given: the root is satisfiable on every background (`root_given`), the arrow holds on every type (`arrow_given`), and the freedom bit is the swap without a fixed point (`freedom_given`).

What they carry is the form. What follows from the root uniformly in its symbols holds without it (`root_conservative`), so the root alone forces nothing the empty background does not. The arrow holds on the counter frame, where a class goes unrealized (`arrow_forces_nothing`). The decisive statement is `given_is_not_the_value`: no statement reading the same on every frame is equivalent to the value, because such a statement would be true in the algebraic world and false in the counter world at once. Existence as given holds in both worlds (`given_in_both_worlds`). It is the ground of the closure, not its value.

## The route ledger

Every route the literature or the author has taken to the value is typed below by what it reaches.

**The route ledger; every cone is empty.**

- **Existence as given:** forces no value; holds in both worlds. (`given_is_not_the_value`, `given_in_both_worlds`)
- **Integral classes:** do not transfer. (`integrality_does_not_transfer`)
- **The (1,1) slice:** decides its slice, and the exponential field is load-bearing. (`slice_decides`, `expo_is_load_bearing`)
- **Dimension at most three:** decides, each field load-bearing. (`low_dim_decided`, `hardL_is_load_bearing`)
- **A finite record:** does not decide. (`finite_record_never_forces`)
- **Symmetry:** does not lift a decided slice. (`no_symmetry_lifts`)
- **A uniform step in the codimension:** reaches every codimension. (`uniform_step_forces_all`)
- **The semiregular witness axiom:** decides, strictly stronger than the act. (`witness_axiom_strictly_stronger`)
- **Existence read on the row:** is the value, by one act. (`act_is_the_value`, `hodge_from_existence`)

The ledger closes on its last two rows. The witness axiom decides and is not the least premise; the reading on the row decides and is.

## The frame, and the one cut

A frame records every class and its realization. The two coherent worlds are the algebraic world, where every class is realized (`calm_value`), and the counter world, where one Hodge class of codimension two is realized by nothing (`counter_fails`). The cut of the row is the record of everything the two worlds share: the classes, their codimensions, the arrow, the root. It keeps everything the two worlds share and forgets which world is actual. No reading of that record returns the world.

## Freedom: the two worlds, and the prime's shape

The record reads the same in both worlds, so no function of the record returns the world (`record_wall`). Over the record the fibre has exactly two points (`fibre_is_two`), neither its own denial: the freedom bit of Section 3. A prime has the same shape. Its multiplicative fibre is two points off the diagonal,

> {(a,b) ∈ ℕ² : ab = p} = {(1,p), (p,1)},

and the kernel checks at p = 7 that the two counts agree (`prime_shape`). This is the freedom of the row, and it has the shape of a prime; the comparison is structural, the kernel proving the two counts and the orbit structure and no map between the fibres. One free orbit carries one bit. The record leaves exactly that bit, as a prime leaves exactly one.

## The triaxial lock

Two independent axes in 𝔽₂³ leave two points, and three lock one,

> #{x ∈ 𝔽₂³ : r₁·x = t₁, r₂·x = t₂} = 2,  #{x ∈ 𝔽₂³ : rᵢ·x = tᵢ, i = 1,2,3} = 1,

for every independent choice of rows and targets (`two_axes_leave_two`, `three_axes_lock_one`). The record supplies two axes, the classes and their codimensions; the third, which world is actual, is the one the record cannot supply. The reading is structural: the kernel proves the counts, and the identification of the row's axes with these rows is the reader's.

## The act: existence read on the row

Existence read on the row is the act: every Hodge class that exists is realized by an object,

> Realized(F) :⇔ ∀d ∃n : realize_F(d) = n.

The kernel proves it is the value, exactly (`act_is_the_value`), and that it is keyed: it holds in the algebraic world and fails in the counter world (`act_is_keyed`). The equivalence is the strength of the closure, as the equivalence of least erasure with the critical line is the strength of the author's Riemann closure (Islam 2026f). Section 3 proved that nothing given on every frame forces the value; so any premise that closes the row carries the value, and the act is the weakest such premise, the value itself, read as an act of existence, and nothing beside it in the kernel; the reading of the frame as the classes of a variety is the reader's identification, declared in Section 2. No keyless statement is the act (`no_keyless_statement_is_the_act`), and the pulse of existence does not certify: the root holds on a background beside a world whose value fails (`pulse_does_not_certify`).

## The proof: the Hodge value from existence


**Definition 9.1** (`ActualClasses`). A structure with two fields: `F`, the frame, standing for the rational Hodge classes of smooth complex projective varieties with their realizations, the identification being the reader's; and `supply`, existence read on the row, the act.

**Theorem 9.2** (`hodge_from_existence`). For every `A : ActualClasses`, every Hodge class of `A.F` is algebraic. *Cone: none.*


The proof of the Hodge value is Theorem 9.2. Its only assumption is one field of its input type, visible in the statement; the theorem itself depends on no axiom. Its supply is self-grounding: an act exists on a frame exactly when the value holds there (`supply_iff`).

## Nothing escapes

Every class lands on exactly one gate, realized or unrealized (`every_class_lands`), and the gates are exclusive (`gates_exclusive`). The dichotomy is proved without excluded middle, because a realization is a value and not a proposition. Under the act every class is realized (`nothing_escapes`), and one unrealized class refutes the act (`counterclass_refutes`). The closure is universal over the row, and there is one form, an unrealized Hodge class, in which it could be refuted.

## The price: what does not decide

**Integrality does not transfer.** The integral version of the question fails: torsion classes need not be algebraic (Atiyah and Hirzebruch 1962). The kernel exhibits the shape: a world where the rational value holds and the integral one fails (`integrality_does_not_transfer`). The row's value is rational, and the closure is stated for it alone.

**The (1,1) slice decides its slice.** An integral class of codimension one is the first Chern class of a line bundle, by the exponential sequence (Lefschetz 1924), and a rational one has such a multiple, so every rational class of codimension one is algebraic (`slice_decides`). The exponential field carries the weight: without it a codimension-one class goes unrealized (`expo_is_load_bearing`). And the slice decides nothing beyond itself: a frame satisfying the slice's fields has an unrealized class of codimension two (`slice_does_not_decide_the_row`).

**Projectivity is part of the setting.** The question is posed for projective varieties; on compact Kähler manifolds its analogue fails (Voisin 2002). The kernel carries no theorem on this point, and the closure is stated for the projective setting alone.

## The proved part, sealed

The proved part carried here is the part these cited fields reach; further proved cases, on special classes of varieties, lie outside the kernel and are not claimed by it. On a variety of dimension at most three every codimension is an end, one, or one below the dimension (`small_cases`). The end classes, the fundamental class and the points, are algebraic; the (1,1) slice is Lefschetz; and hard Lefschetz carries codimension one to codimension n − 1. The kernel carries these three cited theorems as fields of `LowDim`, each stating its conclusion, and proves the covering: in dimension at most three every Hodge class is algebraic (`low_dim_decided`). The transport itself is cited, not modelled. The hard Lefschetz field carries its weight: without it a codimension-two class on a threefold goes unrealized while the ends and the (1,1) slice hold (`hardL_is_load_bearing`).

**The division.** For every cut of the classes the value is exactly its two halves (`row_split`), the division of the author's cut-agnostic theorem (Islam 2026d) carried to the row. The codimension-one half is proved on every slice frame (`proved_half`), and the proved half does not force the remainder: in the counter world the codimension-one half holds, vacuously since that world has no class of codimension one, and the remainder fails (`remainder_not_forced`). The proved part is sealed at the grade of its cited fields; the remainder, the middle codimension from dimension four, stands on the act.

## The retired premise

The author's earlier proof derived the row from one semiregular witness axiom (Islam 2026a). The kernel types it: the witness axiom gives the value (`witness_axiom_gives_value`) and is strictly stronger, since a world carries the value with no semiregular witness (`witness_axiom_strictly_stronger`). A premise strictly stronger than the value is not the least premise. The witness axiom is retired as a placeholder written before the act was isolated, and the act takes its place at exactly the strength of the value.

## The record and the seed

No finite record forces the value: for every n the staged world is algebraic below codimension n and the value fails (`finite_record_never_forces`). Conjugation keeps the type of a (p,p) class, and a symmetry that keeps the codimension carries no class of a decided codimension onto an undecided one (`no_symmetry_lifts`). A step uniform in the codimension would force every codimension (`uniform_step_forces_all`). The seed of every forcing is such a step, and the record of the cited theorems carries none beyond the slices of Section 12.

## The grade of the closure, stated whole

**Proved in core Lean 4, no library, no `sorry`, no axiom declared, every theorem on no axiom at all (40 theorems):** the frame and its two worlds; existence given, its conservativity, its holding in both worlds, its forcing no value; the act equal to the value, keyed, and no keyless statement equal to it; the Hodge value from the act; nothing escapes, the exclusive gates, one counter class refuting; the witness axiom strictly stronger; integrality not transferring; the slice deciding its slice and its exponential field load-bearing; dimension at most three decided and its hard Lefschetz field load-bearing; the exact division and the remainder not forced; the record wall, the two-point fibre, the prime's shape; the triaxial counts; the finite record, the symmetry, the uniform step; the closure whole (`hodge_closure`).

**Carried as fields and cited:** the end classes, the Lefschetz (1,1) slice by the exponential sequence, and hard Lefschetz, each as its conclusion, in the proved part; the kernel proves the covering of every codimension in dimension at most three and that each field is load-bearing.

**Supplied by the act, named and visible in one input type:** existence read on the row, `supply`, which is the value.

**The reader's identification:** the frame with the rational Hodge classes of smooth complex projective varieties, and realization with a rational combination of cycle classes.

## Objections, answered

*The act is the conjecture renamed.* The act is the value, and the paper says so in its verdict. The theorem is that no weaker given premise closes the row (`given_is_not_the_value`); the isolation of the least premise is the result.

*The witness axiom was enough.* It was more than enough: it is strictly stronger than the value (`witness_axiom_strictly_stronger`), so it overpaid. The act pays exactly.

*The kernel's frame is a skeleton.* It is the skeleton of every frame the row admits, and the identification with the classes of a variety is declared as the reader's in Section 2, Definition 9.1 and Section 15.

*The proved part is the whole problem in small dimension and nothing in large.* Exactly, and the division theorem says so: the value is its two halves, the proved half is sealed, and it does not force the remainder (`row_split`, `remainder_not_forced`).

*There is no physics here.* There is no theorem on matter on this row, unlike the Navier–Stokes row; integral classes realized by charges (Dirac flux quantization) corroborate the integral shape, which Section 11 shows is not the row's value. The closure stands on the act.

## Falsifiers

**F-Cone.** The kernel, compiled on a stock toolchain, prints any axiom for any of its forty theorems. It refutes the paper's grade.

**F-Counter.** A Hodge class on a smooth complex projective variety that is not a rational combination of algebraic cycle classes. It refutes the act by `counterclass_refutes`, and it is the one channel the closure leaves open.

**F-Slice.** A Hodge class of codimension one, or any Hodge class on a variety of dimension at most three, that is not algebraic. It refutes the cited fields, and with them the proved part.

## Positioning

**Positioning; no prior position is contradicted.**

- **Lefschetz 1924** ((1,1) classes are algebraic): the slice, carried as a field, load-bearing. Relation: extends.
- **Hodge 1950** (the question posed): closed to one act. Relation: extends.
- **Atiyah and Hirzebruch 1962** (the integral version fails): integrality shown not to transfer. Relation: bounds.
- **Voisin 2002** (the Kähler analogue fails): the projective setting kept. Relation: adjacent.
- **Deligne 2006** (the problem stated): the setting of Section 2. Relation: adjacent.
- **Islam 2026f, the Riemann closure** (one bit, closed by one act): the template carried to this row. Relation: extends.
- **Islam 2026c, the Navier–Stokes closure** (the row closed from existence alone): the drill carried to this row. Relation: extends.
- **Islam 2026a–b, the Hodge papers** (a witness axiom; a terminus): the axiom retired; the row reduced to existence. Relation: extends.

## Conclusion

Existence was given before the question was asked, and the paper proves exactly what that buys: the form on every frame and no value on any. It proves that existence read on the row is the value; that the value follows from that reading by one act; that nothing escapes the act; that one unrealized class is the only refuter; that the earlier witness axiom overpaid; and that the proved part, dimension at most three, is sealed and does not force the remainder. The verdict, in the words of Section 1, unchanged:

> The Hodge question is closed to one act of existence. Existence as given carries the form of the closure on every frame and holds in the algebraic world and the counter world alike. Existence read on the row, that every Hodge class that exists is realized by an object, is the value, exactly. It is supplied by one act, at premise grade, as one field of one type, and the compiler prints the Hodge value from it on no axiom. Nothing escapes the act, and one unrealized Hodge class would refute it. In dimension at most three the value is a theorem of the cited Lefschetz fields; in middle codimension from dimension four it stands on the act.

## Appendix A · Receipts

The kernel, `Hodge_Existence_Closure.lean`, compiles with exit 0 and no message on Lean 4.19.0 and on Lean 4.22.0 (de Moura and Ullrich 2021). It carries forty theorems, and every one prints *does not depend on any axioms*, pinned by `#guard_msgs` so that a drifted cone fails the compile. Its SHA-256 is

`fcd27c175ada39a389d5ca5e05d1573198e91e81539afb760daa3158e911ac6c`

and the Markdown master of this paper carries the kernel with a one-line extraction command and its manifest.

## Appendix B · The kernel

The kernel, `Hodge_Existence_Closure.lean`, is carried verbatim in the Markdown master of the sealed edition, with its manifest and a one-line extraction command; it is omitted here because a long listing does not survive a blog editor.

## Author's Provenance and Method Disclosure

This paper was developed under Trisduction, a verification and organizing discipline that adds the cited results no warrant; the method and its executable batteries are stated in full at the reference below.

*Author and method.* Mohammad F. Islam, PhD, independent researcher, sole author and sole authority for every claim and every error. The reduction was directed by the author and drafted with Claude (Anthropic) as scribe: the model wrote and compiled the kernel, checked citations and argued against the author's positions on instruction; it holds no authorship. One claim was held at the model's insistence: the paper does not state that the Hodge value follows from existence as given, because the kernel's own `given_is_not_the_value` proves the contrary.

*The register.* In the programme's vocabulary: the form, the act's identity with the value, the universal closure, the retirement of the witness axiom and the proved part stand at [⟀ T] on no axiom; the triaxial reading at [⟀ S]; the value in middle codimension from dimension four at premise grade on the act; ΔM = 0 on the cited geometry. The act is the row's least-erasure posit read as existence realized; the row carries no defeater. The freedom cut, prime-as-freedom and the triaxial lock are applied on the row, with the lessons of the Riemann, P versus NP and Navier–Stokes closures combined: the division of the Riemann closure, the keyed least escape of the P versus NP work, and the load-bearing check of the Navier–Stokes closure. The semiregular witness axiom of the earlier paper is retired as a placeholder.

*Audit.* This edition has not yet been prosecuted by the external substrates, and no audit result is claimed. The development provenance is the author's Zenodo trail, the Unabridged Trisduction Codex and the Lean Codex at github.com/1000sapients/Trisduction.

## References

Atiyah, M. F. and F. Hirzebruch. 1962. Analytic cycles on complex manifolds. *Topology* 1: 25–45.

de Moura, L. and S. Ullrich. 2021. The Lean 4 theorem prover and programming language. *Automated Deduction, CADE 28*, 625–635.

Deligne, P. 2006. The Hodge conjecture. In *The Millennium Prize Problems*, 45–53. Clay Mathematics Institute.

Hodge, W. V. D. 1950. The topological invariants of algebraic varieties. *Proceedings of the International Congress of Mathematicians*, Cambridge, MA, 1: 182–192.

Islam, M. F. 2026a. A proof of the Hodge conjecture derived from one semiregular witness axiom. Zenodo. doi:10.5281/zenodo.22701510.

Islam, M. F. 2026b. A formal proof of Hodge conjecture termination at the formal-alone register. Zenodo. doi:10.5281/zenodo.22705460.

Islam, M. F. 2026c. A formal completed proof of the Navier–Stokes closure from existence alone. Zenodo. doi:10.5281/zenodo.22670344.

Islam, M. F. 2026d. The cut-agnostic division theorem: why every open problem is exactly its proved part and its unicorn. Zenodo. doi:10.5281/zenodo.22954862.

Islam, M. F. 2026e. The veil and the wall. Zenodo. doi:10.5281/zenodo.21389758.

Islam, M. F. 2026f. The Riemann Hypothesis closed to one named bit and proved from unconditional least erasure by one act, with an empty axiom cone. Zenodo. doi:10.5281/zenodo.23034066.

Islam, M. F. 2026g. Nothing escapes least erasure. Zenodo. doi:10.5281/zenodo.23080221.

Islam, M. TRISDUCTION: A linguistically, topologically, and mathematically sealed verification architecture. Triaxial orthogonality, twelve-gate closure, the quaternionic completion, the root axiom, and the master pre-sealed proposition ledger. Zenodo, version 4, 19 June 2026. doi:10.5281/zenodo.20757507. Mirror: PhilArchive record ISLTTG. Master reference, continuously updated at the same location.

Lefschetz, S. 1924. *L'Analysis situs et la géométrie algébrique*. Paris: Gauthier-Villars.

Voisin, C. 2002. A counterexample to the Hodge conjecture extended to Kähler varieties. *International Mathematics Research Notices* 2002 (20): 1057–1075.

*End of manuscript*

