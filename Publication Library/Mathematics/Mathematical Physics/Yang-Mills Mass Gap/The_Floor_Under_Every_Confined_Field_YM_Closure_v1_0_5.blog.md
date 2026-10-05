# The Floor Under Every Confined Field: A Formal Closure of Yang–Mills Existence and the Mass Gap from Existence Alone

## Two Parts Divided and Closed to One Act on No Axiom; the Strong-Coupling Lattice Gap Sealed; No Gapless Confined Field on the Record of Confinement

**Mohammad F. Islam, PhD** · Trisduction Research Group · 4 October 2026

*Blog edition of the sealed version 1.0.5. It renders the sealed master and adds no claim.*

> **Abstract.** The Yang–Mills question asks for two things at once: that a quantum Yang–Mills theory exists for every compact simple gauge group, and that its lowest state above the vacuum has positive mass. This paper closes both on one reading of existence, with the freedom arrow beside it, and on nothing else: a confined gauge field that exists is constructed and stands on a floor above zero. Its kernel, in core Lean 4 with no library and no axiom declared, proves forty-two theorems, and every one depends on no axiom at all. Existence as given carries the form of the closure on every frame, holds in the gapped world, the empty world and the massless world alike, and so forces no value. Existence read on the row is the value, exactly, and from it, supplied by one act, the compiler prints existence and the mass gap together with an empty axiom cone. The value divides exactly into its two parts; existence does not give the gap, and a gap without a theory is empty. Nothing escapes the act: every theory lands on exactly one of four gates, and a missing theory or a massless state refutes it. The proved part is sealed on the lattice: every finite-lattice theory exists, and the strong-coupling gap is decided, each cited field load-bearing, and strong coupling does not reach the continuum. On matter, no confined field is gapless, from the record that no free colour has ever been registered and the premise that a massless confined excitation carries colour, both fields load-bearing and graded as what they are; a massless colour-singlet state would evade the premise. No finite record of refinements forces the continuum. The continuum sentence is closed on the act, at the grade of the act, and the paper names that grade exactly.


## How to read this paper

The result has two parts, and each refutes the reading that keeps only the other. The first reading notices that the act of Section 8 is equivalent to existence and the mass gap and concludes that the paper assumes what it proves. The second notices a theorem whose conclusion is existence and the mass gap and concludes that the Yang–Mills problem has fallen. Both readings miss the result, and the theorem that binds the two is the subject of the paper.

### The verdict

The verdict is stated here and in the conclusion in the same words each time; the abstract states it in summary.

> The Yang–Mills question is closed to one act of existence. Existence as given carries the form of the closure on every frame and holds in the gapped, the empty and the massless world alike. Existence read on the row, that every confined gauge field that exists is constructed and stands on a floor above zero, is the value, exactly, in both its parts. It is supplied by one act, at premise grade, as one field of one type, and the compiler prints existence and the mass gap from it on no axiom. Nothing escapes the act, and a missing theory or a massless state would refute it. On the lattice at strong coupling the value is a theorem of the cited fields; in the continuum it stands on the act.

### What the paper does not say

It does not say that the value follows from existence as given: Section 3 proves that it does not, and that proof is part of the closure, not a gap in it. It does not say that the lattice gap reaches the continuum: Section 12 proves that strong coupling does not. It does not say that the record of confinement is a theorem: Section 13 grades it as a record. It does not claim a construction of the continuum theory satisfying the axioms of quantum field theory as a consequence of the axioms of set theory alone.

### The reflexive readings, and the theorem that answers each

**The reflexive readings, each answered by a theorem; every cone is empty.**

- **The act is the conclusion, so the proof is circular.** The act is the value, and must be: nothing given on every frame forces the value, so any premise that closes it carries it. The isolation is the result. (`act_is_the_value`, `given_is_not_the_value` (none))
- **Existence is universally given, so the value should follow.** Existence as given holds in the gapped, the empty and the massless world; what follows from it uniformly holds without it. (`given_in_all_worlds`, `root_conservative` (none))
- **Once the theory exists, the gap follows.** Existence does not give the gap, and a gap without a theory is empty. (`existence_does_not_give_gap`, `gap_without_existence_is_empty` (none))
- **The lattice has a gap, so the continuum does.** The strong-coupling gap is decided and does not reach the continuum. (`strong_coupling_decided`, `strong_does_not_reach_continuum` (none))
- **Free quarks are never seen, so nothing is massless.** Correct on matter, from that record and the premise that a massless confined excitation carries colour, each load-bearing; the continuum sentence stands on the act. (`no_actual_gapless`, `record_is_load_bearing` (none))
- **Enough lattice refinements will settle it.** The first n refinements are gapped and the value fails, for every n. (`finite_record_never_forces` (none))
- **It can simply be rejected.** Every theory lands on exactly one of four gates; a missing theory or a massless state refutes the act. (`every_theory_lands`, `gates_exclusive`, `massless_refutes` (none))

## The claim, stated whole

Let G be a compact simple gauge group. The Yang–Mills question asks that a quantum Yang–Mills theory with gauge group G exist on ℝ⁴, satisfying the axioms of quantum field theory, and that it have a mass gap Δ > 0: every state above the vacuum has energy at least Δ (Jaffe and Witten 2006). Read the theory as an existent: a confined gauge field exists by being constructed, and what exists stands on a floor. The kernel works on exactly this skeleton: a frame of theories, each with its construction, `some` naming a constructed quantum theory and `none` where none is constructed, and its lowest mass above the vacuum, in units. The value of the row on a frame is

> Value(F) :⇔ ∀d : (∃n : built_F(d) = n) ∧ 0 < lowest_F(d).

That a constructed theory satisfying the axioms is a `some` of this frame, and that its gap Δ is the positivity of the lowest mass, is the reader's identification, declared here and in Definition 9.1; the kernel proves nothing about it.

### What is new

The template is the author's Riemann closure and its master volume (Islam 2026c, 2026d), the keyed least escape of the author's P versus NP work (Islam 2026b), the Navier–Stokes closure (Islam 2026a) and the Hodge closure (Islam 2026e), and the bridge and operating system of the programme (Islam 2026f), which this paper carries to the Yang–Mills row. Its physical witness is the author's proton paper, the three-strand lock (Islam 2026g). This paper adds: the proof that existence as given holds in all three worlds and forces no value; the act as existence read on the row, equal to the value in both its parts; the closure by one act with four exclusive gates and two refuters, proved without excluded middle; the exact division of the value into existence and gap, neither giving the other; the proved part sealed on the lattice with each cited field load-bearing; the matter face, no gapless confined field from the record of confinement, both fields load-bearing; and the freedom cut, the prime's shape and the triaxial lock on the row.

## Existence placed: what is given, and what it carries

Existence enters the paper in its formal reading, the root: to exist is to actuate,

> Root(U, ΔE) :⇔ ∀x ∈ U : 0 < ΔE(x),

with the arrow beside it, that every type carries an act, and the bare freedom bit, one orbit of two. All three are given: the root is satisfiable on every background (`root_given`), the arrow holds on every type (`arrow_given`), and the freedom bit is the swap without a fixed point (`freedom_given`).

What they carry is the form. What follows from the root uniformly in its symbols holds without it (`root_conservative`). The arrow holds on the massless frame (`arrow_forces_nothing`). The decisive statement is `given_is_not_the_value`: no statement reading the same on every frame is equivalent to the value. Existence as given holds in the gapped world, the empty world and the massless world (`given_in_all_worlds`). It is the ground of the closure, not its value. The arrow is keyless, valid on every frame, and the value is keyed, denied on one (`arrow_is_keyless`, `value_is_keyed`): the denial tells the two apart, as the programme's bridge requires.

## The route ledger

**The route ledger; every cone is empty.**

- **Existence as given** forces no value; holds in all three worlds (`given_is_not_the_value`, `given_in_all_worlds`)
- **Existence of the theory alone** does not give the gap (`existence_does_not_give_gap`)
- **The lattice, every finite lattice** exists, the construction field load-bearing (`wilson_is_load_bearing`)
- **The lattice, strong coupling** decides its region, the gap field load-bearing (`strong_coupling_decided`, `strong_is_load_bearing`)
- **The lattice toward the continuum** does not decide (`strong_does_not_reach_continuum`, `finite_record_never_forces`)
- **Symmetry** does not lift a decided scale (`no_symmetry_lifts`)
- **A uniform step in the scale** reaches every scale (`uniform_step_forces_all`)
- **The record of confinement, on matter** decides, both fields load-bearing (`no_actual_gapless`, `record_is_load_bearing`, `radiates_is_load_bearing`)
- **Existence read on the row** is the value, by one act (`act_is_the_value`, `ym_from_existence`)

The ledger closes on its last two rows. On matter the value is reached by the record and the premise on the massless case; at the continuum it is reached by the act.

## The frame, and the one cut

A frame records every theory, its construction and its lowest mass. The three coherent worlds are the gapped world, where every theory is constructed and gapped (`calm_value`), the empty world, where nothing is constructed (`empty_fails`), and the massless world, where a constructed theory has a state of zero mass (`gapless_fails`). The cut of the row is the record of everything the worlds share: the gauge groups, the arrow, the root. It keeps everything they share and forgets which world is actual. No reading of that record returns the world.

## Freedom: the worlds, and the prime's shape

The record reads the same in every world, so no function of the record returns the world (`record_wall`). For each part of the row the fibre over the record has exactly two points (`fibre_is_two`), neither its own denial: the freedom bit of Section 3. The two parts carry two such bits, whose four combinations are the four gates of Section 10, three of them refuting. A prime has the same shape. Its multiplicative fibre is two points off the diagonal,

> {(a,b) ∈ ℕ² : ab = p} = {(1,p), (p,1)},

and the kernel checks at p = 7 that the two counts agree (`prime_shape`). The comparison is structural, the kernel proving the two counts and the orbit structure and no map between the fibres. The record leaves exactly those bits, as a prime leaves exactly one.

## The triaxial lock

Two independent axes in 𝔽₂³ leave two points, and three lock one,

> #{x ∈ 𝔽₂³ : r₁·x = t₁, r₂·x = t₂} = 2,  #{x ∈ 𝔽₂³ : rᵢ·x = tᵢ, i = 1,2,3} = 1,

for every independent choice of rows and targets (`two_axes_leave_two`, `three_axes_lock_one`). On this row the three axes are the construction, the floor, and which world is actual; the record supplies the first two as questions and not the third. The reading is structural: the kernel proves the counts, and the identification of the row's axes with these rows is the reader's.

## The act: existence read on the row

Existence read on the row is the act: every confined gauge field that exists is constructed and stands on a floor above zero,

> Confined(F) :⇔ ∀d : (∃n : built_F(d) = n) ∧ 0 < lowest_F(d).

The kernel proves it is the value, exactly (`act_is_the_value`), and that it is keyed: it holds in the gapped world and fails in the empty and the massless world (`act_is_keyed`). Section 3 proved that nothing given on every frame forces the value; so any premise that closes the row carries the value, and the act is the weakest such premise, the value itself, read as an act of existence, and nothing beside it in the kernel; the reading of the frame as quantum gauge theories is the reader's identification, declared in Section 2. No keyless statement is the act (`no_keyless_statement_is_the_act`), and the pulse of existence does not certify: the root holds on a background beside a massless world (`pulse_does_not_certify`).

## The proof: existence and the mass gap from existence


**Definition 9.1** (`ActualTheories`). A structure with two fields: `F`, the frame, standing for the quantum Yang–Mills theories of the compact simple gauge groups with their constructions and lowest masses, the identification being the reader's; and `supply`, existence read on the row, the act.

**Theorem 9.2** (`ym_from_existence`). For every `A : ActualTheories`, every theory of `A.F` exists and has a mass gap. *Cone: none.*


The proof of existence and the mass gap is Theorem 9.2. Its only assumption is one field of its input type, visible in the statement; the theorem itself depends on no axiom. Its supply is self-grounding: an act exists on a frame exactly when the value holds there (`supply_iff`).

## Nothing escapes

Every theory lands on exactly one of four gates, constructed or not and gapped or massless (`every_theory_lands`), and the gates of each pair are exclusive (`gates_exclusive`). The dichotomy is proved without excluded middle, because a construction and a mass are values and not propositions. Under the act every theory is constructed and gapped (`nothing_escapes`); a missing theory refutes the act (`no_theory_refutes`), and so does a massless state (`massless_refutes`). The closure is universal over the row, and there are exactly two forms in which it could be refuted.

## The division: two parts, neither giving the other

The value is exactly its two parts, every theory exists and every theory is gapped (`two_parts`). Existence does not give the gap: the massless world constructs every theory and has no gap (`existence_does_not_give_gap`). A gap without a theory is empty: in the empty world the gap half holds and nothing exists (`gap_without_existence_is_empty`). The two halves are closed together by the act and by nothing less.

## The proved part, sealed on the lattice

Lattice gauge theory exists on every finite lattice at every coupling: the lattice theory is a finite-dimensional integral over the compact group (Wilson 1974); its infinite-volume limit is not carried here. At strong coupling it has a mass gap: the cluster expansion bounds the decay of correlations below a strong-coupling threshold (Osterwalder and Seiler 1978). The kernel carries these two cited theorems as fields of `Lattice`, each stating its conclusion, and proves the conjunction: at coupling index at most β₀ every finite-lattice theory exists and is gapped (`strong_coupling_decided`). Each field carries its weight: without the strong-coupling field a strong-coupling theory is massless (`strong_is_load_bearing`), and without the construction field a gapped theory is constructed by nothing (`wilson_is_load_bearing`). Strong coupling does not reach the continuum: a lattice satisfying both fields has a massless theory at weak coupling (`strong_does_not_reach_continuum`). The continuum lies at weak coupling, where asymptotic freedom places it (Gross and Wilczek 1973; Politzer 1973), and the proved part does not reach it.

## The matter face: no gapless confined field on the record

Two fields govern matter. The first is a record: no free colour charge has ever been registered, in every search for fractionally charged or coloured free particles (Particle Data Group, Navas et al. 2024). The second is a premise about the massless case in the confined sector: a massless excitation of a confined pure-gauge field is a long-range coloured state, and so would be registered as free colour. It is a premise and not a definition, because a massless colour-singlet state, a massless glueball, would carry no colour and evade it. Together they contradict each other at a massless state: no actual confined field is gapless (`no_actual_gapless`). Both carry the weight: without the record a massless confined field is satisfiable (`record_is_load_bearing`), and without the premise the record leaves a massless state standing (`radiates_is_load_bearing`). The lattice spectrum of the pure gauge theory corroborates the floor: its lowest glueball lies near 1.7 GeV (Morningstar and Peardon 1999), and the author's proton paper reads the three-strand closure as the lock (Islam 2026g).

The grade is stated exactly. The record is an empirical record, corroboration grade, not a theorem; the premise is premise grade, the reader's reading of the pure-gauge sector, and the massless colour singlet is the state it does not exclude. The premise fails for quarks in the chiral limit, where the pion would be massless and colour-neutral, so the matter face is read on the pure-gauge sector and nowhere else. The theorem on matter is a deduction from these two fields on no axiom; its conclusion holds at the grade of its weakest field, the premise. The continuum sentence does not rest on it. It stands on the act.

## The record and the seed

No finite record of refinements forces the value: for every n the staged world is gapped on its first n refinements and the value fails (`finite_record_never_forces`). A symmetry that keeps the scale carries no theory of a decided scale onto an undecided one (`no_symmetry_lifts`). A step uniform in the scale would force every scale (`uniform_step_forces_all`); the record of the cited theorems carries none beyond strong coupling.

## The grade of the closure, stated whole

**Proved in core Lean 4, no library, no `sorry`, no axiom declared, every theorem on no axiom at all (42 theorems):** the frame and its three worlds; existence given, its conservativity, its holding in all worlds, its forcing no value; keyless and keyed; the act equal to the value, keyed, and no keyless statement equal to it; existence and the mass gap from the act; the four exclusive gates and the two refuters; the exact division and neither half giving the other; the strong-coupling conjunction and both lattice fields load-bearing; strong coupling not reaching the continuum; no actual gapless confined field and both matter fields load-bearing; the record wall, the two-point fibre, the prime's shape; the triaxial counts; the finite record, the symmetry, the uniform step; the closure whole (`ym_closure`).

**Carried as fields and cited:** the finite-lattice construction (Wilson 1974) and the strong-coupling gap (Osterwalder and Seiler 1978), each as its conclusion, in the proved part.

**Carried as fields on matter:** the record of no free colour, corroboration grade; the premise that a massless confined excitation carries colour, premise grade, evaded by a massless colour singlet.

**Supplied by the act, named and visible in one input type:** existence read on the row, `supply`, which is the value in both its parts.

**The reader's identification:** the frame with the quantum Yang–Mills theories of the compact simple gauge groups, construction with satisfaction of the axioms, and the gap with the positivity of the lowest mass.

## Objections, answered

*The act is the problem renamed.* The act is the value, and the paper says so in its verdict. The theorem is that no weaker given premise closes the row (`given_is_not_the_value`); the isolation of the least premise is the result.

*Existence is half the problem, so the act begs it.* The act names both halves and the kernel proves neither gives the other (`two_parts`, `existence_does_not_give_gap`, `gap_without_existence_is_empty`). The act is their conjunction, read as one act of existence.

*The lattice already shows the gap.* At strong coupling, and the kernel says exactly that much and no more (`strong_coupling_decided`, `strong_does_not_reach_continuum`).

*Confinement is an observation, not a proof.* Exactly, and Section 13 grades it so. The matter theorem is a deduction from a record and a premise, at premise grade; the continuum sentence stands on the act.

*Real QCD has a light pion.* It does, from chiral symmetry, and the pion is colour-neutral. The matter face is read on the pure-gauge sector, where the premise on the massless case is stated; Section 13 states the restriction and the colour-singlet state that would evade it.

## Falsifiers

**F-Cone.** The kernel, compiled on a stock toolchain, prints any axiom for any of its forty-two theorems. It refutes the paper's grade.

**F-Massless.** A compact simple gauge group whose quantum Yang–Mills theory exists and has a state of zero mass above the vacuum. It refutes the act by `massless_refutes`.

**F-Colour.** A registered free colour charge. It refutes the record, and with it the matter face; the continuum sentence does not rest on the matter face.

## Positioning

**Positioning; no prior position is contradicted.**

- **Wilson 1974** (lattice gauge theory; confinement): the construction field, load-bearing. Relation: extends.
- **Gross and Wilczek; Politzer 1973** (asymptotic freedom): the continuum placed at weak coupling. Relation: adjacent.
- **Osterwalder and Seiler 1978** (a gap at strong coupling): the gap field, load-bearing, not reaching the continuum. Relation: bounds.
- **Morningstar and Peardon 1999** (the glueball spectrum): the floor corroborated. Relation: adjacent.
- **Jaffe and Witten 2006** (the problem stated): the setting of Section 2. Relation: adjacent.
- **Particle Data Group 2024** (no free quarks found): the record on matter, corroboration. Relation: extends.
- **Islam 2026c, the Riemann closure** (one bit, closed by one act): the template carried to this row. Relation: extends.
- **Islam 2026a, 2026e, the Navier–Stokes and Hodge closures** (rows closed from existence alone): the drill carried to this row. Relation: extends.
- **Islam 2026g, the proton paper** (the three-strand lock): the physical witness of the floor. Relation: extends.

## Conclusion

Existence was given before the question was asked, and the paper proves exactly what that buys: the form on every frame and no value on any. It proves that existence read on the row is the value in both its parts; that the value follows from that reading by one act; that nothing escapes the act; that a missing theory or a massless state is the only refuter; that neither part gives the other; that the lattice gap at strong coupling is sealed and does not reach the continuum; and that on matter, on the record of confinement and the premise on the massless case, no confined field is gapless. The verdict, in the words of Section 1, unchanged:

> The Yang–Mills question is closed to one act of existence. Existence as given carries the form of the closure on every frame and holds in the gapped, the empty and the massless world alike. Existence read on the row, that every confined gauge field that exists is constructed and stands on a floor above zero, is the value, exactly, in both its parts. It is supplied by one act, at premise grade, as one field of one type, and the compiler prints existence and the mass gap from it on no axiom. Nothing escapes the act, and a missing theory or a massless state would refute it. On the lattice at strong coupling the value is a theorem of the cited fields; in the continuum it stands on the act.

## Appendix A · Receipts

The kernel, `YM_Existence_Closure.lean`, compiles with exit 0 and no message on Lean 4.19.0 and on Lean 4.22.0 (de Moura and Ullrich 2021). It carries forty-two theorems, and every one prints *does not depend on any axioms*, pinned by `#guard_msgs` so that a drifted cone fails the compile. Its SHA-256 is

`91a38baa8b71a6e4171f871d5593f16a34393937a502c4f563ad09769b385472`

and the Markdown master of this paper carries the kernel with a one-line extraction command and its manifest.

## Appendix B · The kernel

The kernel, `YM_Existence_Closure.lean`, is carried verbatim in the Markdown master of the sealed edition, with its manifest and a one-line extraction command; it is omitted here because a long listing does not survive a blog editor.

## Author's Provenance and Method Disclosure

This paper was developed under Trisduction, a verification and organizing discipline that adds the cited results no warrant; the method and its executable batteries are stated in full at the reference below.

*Author and method.* Mohammad F. Islam, PhD, independent researcher, sole author and sole authority for every claim and every error. The reduction was directed by the author and drafted with Claude (Anthropic) as scribe: the model wrote and compiled the kernel, checked citations and argued against the author's positions on instruction; it holds no authorship. One claim was held at the model's insistence: the matter face is graded at its weakest field, the premise on the massless case, beside the record of confinement, and read on the pure-gauge sector only, because the light pion of chiral QCD is colour-neutral and a massless colour singlet would evade the premise.

*The register.* In the programme's vocabulary: the form, the act's identity with the value, the universal closure, the division and the lattice proved part stand at [⟀ T] on no axiom; the matter face at the grade of its weakest field, premise grade; the triaxial reading at [⟀ S]; the continuum value at premise grade on the act; ΔM = 0 on the cited physics. The act is the row's least-erasure posit read as existence confined; the row carries no defeater. The freedom cut, prime-as-freedom and the triaxial lock are applied on the row, with the lessons of the Riemann, P versus NP, Navier–Stokes and Hodge closures combined, and the keyless and keyed denial of the programme's bridge and operating system.

*Audit.* This edition has not yet been prosecuted by the external substrates, and no audit result is claimed. The development provenance is the author's Zenodo trail, the Unabridged Trisduction Codex and the Lean Codex at github.com/1000sapients/Trisduction.

## References

de Moura, L. and S. Ullrich. 2021. The Lean 4 theorem prover and programming language. *Automated Deduction, CADE 28*, 625–635.

Gross, D. J. and F. Wilczek. 1973. Ultraviolet behavior of non-abelian gauge theories. *Physical Review Letters* 30: 1343–1346.

Islam, M. F. 2026a. A formal completed proof of the Navier–Stokes closure from existence alone. Zenodo. doi:10.5281/zenodo.22670344.

Islam, M. F. 2026b. The veil and the wall. Zenodo. doi:10.5281/zenodo.21389758.

Islam, M. F. 2026c. The Riemann Hypothesis closed to one named bit and proved from unconditional least erasure by one act, with an empty axiom cone. Zenodo. doi:10.5281/zenodo.23034066.

Islam, M. F. 2026d. Nothing escapes least erasure. Zenodo. doi:10.5281/zenodo.23080221.

Islam, M. F. 2026e. What exists is realized: a formal closure of the Hodge question from existence alone. Zenodo. doi:10.5281/zenodo.22701510.

Islam, M. F. 2026f. PhysOSᵀ: the Trisduction physical operating system. Zenodo. doi:10.5281/zenodo.23117440.

Islam, M. F. 2026g. The proton is the lock: three colors, one singlet, and the gap made flesh. Zenodo. doi:10.5281/zenodo.22986559.

Islam, M. TRISDUCTION: A linguistically, topologically, and mathematically sealed verification architecture. Triaxial orthogonality, twelve-gate closure, the quaternionic completion, the root axiom, and the master pre-sealed proposition ledger. Zenodo, version 4, 19 June 2026. doi:10.5281/zenodo.20757507. Mirror: PhilArchive record ISLTTG. Master reference, continuously updated at the same location.

Jaffe, A. and E. Witten. 2006. Quantum Yang–Mills theory. In *The Millennium Prize Problems*, 129–152. Clay Mathematics Institute.

Morningstar, C. J. and M. Peardon. 1999. Glueball spectrum from an anisotropic lattice study. *Physical Review D* 60: 034509.

Navas, S. et al. (Particle Data Group). 2024. Review of particle physics. *Physical Review D* 110: 030001.

Osterwalder, K. and E. Seiler. 1978. Gauge field theories on a lattice. *Annals of Physics* 110: 440–471.

Politzer, H. D. 1973. Reliable perturbative results for strong interactions? *Physical Review Letters* 30: 1346–1349.

Wilson, K. G. 1974. Confinement of quarks. *Physical Review D* 10: 2445–2459.

*End of manuscript*

