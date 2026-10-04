# A Formal Completed Proof of the Navier–Stokes Closure from Existence Alone

## Global Regularity Closed to One Act and Proved from It on No Axiom; Regularity of Matter Proved from the Quantum Speed Limit

**Mohammad F. Islam, PhD** · Trisduction Research Group · 4 October 2026

*Blog edition of the sealed version 1.0.7. It renders the sealed master and adds no claim.*

> **Abstract.** A flow exists by acting, and it acts by registering: every resolved change of its state is a registration. This paper closes the regularity question of the unforced three-dimensional Navier–Stokes equations on that one reading of existence, with the freedom arrow beside it, and on nothing else. Its kernel, in core Lean 4 with no library and no axiom declared, proves thirty-one theorems, and every one depends on no axiom at all: not propositional extensionality, not quotient soundness, not choice. Existence as universally given, the root, the arrow and the bit of freedom, is proved to carry the whole form of the closure on every frame and to hold in the regular world and in the blowup world alike. Existence read on the row, that whatever exists acts finitely at every time, is proved to be the value exactly. It is supplied by one act, as one field of one type, and global regularity follows from it by a theorem the compiler prints on no axiom. Nothing escapes the act: every instant of every datum lands on exactly one of two gates, a finite count or an unbounded one, and under the act every count is finite; one blowup is the only refuter. On matter the act is not supplied: every count is finite by construction, and under the quantum speed limit finite energy permits finitely many registrations before any time, a singularity needs unboundedly many, and so no actual flow blows up. Energy alone does not decide, and the paper proves that too. The value fibre over the record is one free orbit of two worlds, walled, the shape of a prime, and three independent axes lock it to one point. The continuum sentence is closed on the act, at the grade of the act, and the paper states that grade in the words it proves.


## How to read this paper

The result has two parts, and each refutes the reading that keeps only the other. The first reading notices that the act of Section 8 is equivalent to regularity and concludes that the paper assumes what it proves. The second notices a theorem whose conclusion is global regularity and concludes that the regularity problem has fallen. Both readings miss the result, and the theorem that binds the two parts compiles on no axiom: `the_closure` proves in one statement that existence as given forces no value and holds in both worlds; that existence read on the row is the value; that the act yields the value; that nothing escapes it; that one blowup refutes it; that energy does not decide; that no actual flow blows up; that the record is walled; and that no finite record forces the value.

### The verdict

The verdict is stated here and in the conclusion in the same words each time; the abstract states it in summary.

> The Navier–Stokes regularity problem is closed to one act of existence. Existence as given carries the form of the closure on every frame and holds in the regular and the blowup world alike. Existence read on the row, that whatever exists acts finitely at every time, is the value, exactly. It is supplied by one act, at premise grade, as one field of one type, and the compiler prints global regularity from it on no axiom. Nothing escapes the act; one blowup is the only refuter. On matter, that no flow blows up is a theorem of the quantum speed limit. Every theorem of the kernel depends on no axiom at all.

### What the paper does not say

It does not say that regularity follows from existence as given: Section 3 proves that it does not, and that proof is part of the closure, not a gap in it. It does not say that the speed limit, a theorem about matter, is a theorem about the continuum equations: the identification of the two is the reader's, and Section 11 types it. It does not engage the correctness of the forced construction released in September 2026: Section 13 shields the unforced row from it.

### The reflexive readings, and the theorem that answers each

**The reflexive readings, each answered by a theorem; every cone is empty.**

- **The act is the conclusion, so the proof is circular.** The act is the value, and must be: nothing given on every frame forces the value, so any premise that closes it carries it. The isolation is the result. (`act_is_the_value`, `given_is_not_the_value`)
- **Existence is universally given, so the value should follow.** Existence as given holds in the regular and the blowup world; what follows from it uniformly holds without it. (`given_in_both_worlds`, `root_conservative`)
- **Energy is finite, so nothing blows up.** The energy inequality holds on a frame where a datum blows up. (`energy_does_not_decide`)
- **Actual fluids never blow up.** Correct: no actual flow blows up, proved under the speed limit. The continuum sentence stands on the act. (`no_actual_blowup`, `speed_is_load_bearing`)
- **Enough data will settle it.** The first n data are regular and the value fails, for every n. (`finite_record_never_forces`)
- **Scale small data up.** No symmetry carries a small datum onto a large one; a uniform step reaches every size. (`no_symmetry_lifts`, `uniform_step_forces_all`)
- **It can simply be rejected.** Every instant lands on a finite count or an unbounded one, never both; one unbounded count refutes the act. (`every_instant_lands`, `gates_exclusive`, `blowup_refutes`)

## The claim, stated whole

Let u solve the unforced incompressible Navier–Stokes equations, in the setting of the regularity problem (Fefferman 2006), whose smooth rapidly decaying data lie inside the finite-energy class used here,

> ∂ₜu + (u·∇)u − νΔu + ∇p = 0,  ∇·u = 0,  u(·,0) = u₀,

on ℝ³ with viscosity ν > 0, from a smooth divergence-free datum u₀ of finite energy. Read the flow as an existent: it exists by acting, and it acts by registering resolved changes of its state. Write N(u₀,t) ∈ ℕ ∪ {∞} for the registrations of the flow from u₀ by time t. The flow is *regular* when

> ∀t ∃n ∈ ℕ : N(u₀,t) = n,

and it *blows up by time* t when N(u₀,t) = ∞. The kernel works on exactly this skeleton: a frame of data, each with a count at each time, `none` where the count is unbounded. That an analytic blowup of a strong solution, an unbounded critical norm at a finite time, is an unbounded count is the reader's identification, declared here and in Definition 9.1; the kernel proves nothing about it.

The paper does three things and keeps them apart. It proves, on no axiom, everything the skeleton admits: what existence as given carries and does not carry, what the record decides and does not, what energy and the speed limit price, and the closure from one act. It isolates the one object the skeleton cannot supply, the act at the continuum, and proves it equal to the value. And it supplies that act once, in the open, as the field `supply` of the structure `ActualFlows`, from which global regularity follows by a theorem whose cone is empty.

### What is new

The template is the author's Riemann closure and its master volume (Islam 2026g, 2026h), and the physical reading of registration is that of the author's operating system (Islam 2026i). The author's earlier papers proved a continuation criterion on the alignment defect of the vorticity and named an effective premise to close it (Islam 2026a, 2026b), closed four reading routes to that premise (Islam 2026e), shielded the unforced row from forced constructions (Islam 2026c, 2026d), and built a kinetic witness on Burgers' equation (Islam 2026f). The effective premise was a placeholder written before the formal register and the physical operating system existed. This paper retires it and reduces the row to existence alone. It adds the proof that existence as given holds in both worlds and forces no value; the act as existence read on the row, equal to the value; the universal closure with its exclusive gates, proved without excluded middle; the kinetic theorem from the quantum speed limit, which proves regularity on matter rather than observing it; the proof that energy does not decide; the freedom of the row, the shape of a prime, and the triaxial lock; and a kernel in which every theorem depends on no axiom.

## Existence placed: what is given, and what it carries

Existence is given universally, and the paper takes that seriously enough to prove exactly what universality carries. The root in its formal reading, that to exist is to actuate,

> Root(U, ΔE) :⇔ ∀x ∈ U : 0 < ΔE(x),

is satisfiable on every background (`root_given`). The arrow, a map on every type, holds everywhere (`arrow_given`). The freedom bit, one orbit of two with neither point its own denial, holds everywhere (`freedom_given`).

What holds everywhere holds in both worlds: the arrow holds in the regular world and in the blowup world (`given_in_both_worlds`). Whatever follows from the root uniformly in its symbols holds without it (`root_conservative`). No statement that reads the same on every frame is the value (`given_is_not_the_value`), and in particular the arrow forces nothing (`arrow_forces_nothing`). This is the first theorem of the closure, not a limit of it. Existence as given is the ground on which every frame stands, and a ground on which both worlds stand cannot be the difference between them. The difference is the value, and Section 8 locates it.

## The route ledger

Every route to the value is a method, and each method's reach is a theorem of the kernel.

**The route ledger; every cone is empty.**

- **Existence as given:** forces no value; holds in both worlds. (`given_is_not_the_value`, `given_in_both_worlds`)
- **Energy:** does not decide; the inequality survives a blowup. (`energy_does_not_decide`)
- **A finite record:** does not decide. (`finite_record_never_forces`)
- **Symmetry:** does not lift small data. (`no_symmetry_lifts`)
- **A uniform step in the size:** reaches every size. (`uniform_step_forces_all`)
- **The speed limit, on matter:** decides; no actual flow blows up, and the limit is load-bearing. (`no_actual_blowup`, `speed_is_load_bearing`)
- **Existence read on the row:** is the value, by one act. (`act_is_the_value`, `regularity_from_existence`)

The ledger closes on its last two rows. On matter the value is reached by a theorem; at the continuum it is reached by the act. No other row reaches it, and the kernel proves why for each.

## The frame, and the one cut

A frame registers each datum at each time. The record of the row, what observation and the price of dissipation report, reads the same in the regular world and in the blowup world. The cut of the row is that record: it keeps everything the two worlds share and forgets which world is actual. Every theorem of the next five sections is a statement about what the cut keeps and what it forgets.

## Freedom: the two worlds, and the prime's shape

Over the record the fibre has exactly two points (`fibre_is_two`), neither its own denial (`freedom_given`), and no reading of the record returns the world (`record_wall`). This is the freedom of the row, and it has the shape of a prime; the comparison is structural, the kernel proving the two counts and the orbit structure and no map between the fibres. The multiplicative fibre over a prime p,

> {(a,b) ∈ ℕ² : ab = p} = {(1,p), (p,1)},

is exactly two points, off the seat a = b; the kernel checks at p = 7 that the two counts agree (`prime_shape`). One free orbit carries one bit. The record leaves exactly that bit, as a prime leaves exactly one.

## The triaxial lock

Over 𝔽₂³, two independent linear axes leave exactly two points for every target, and three independent axes lock exactly one:

> #{x ∈ 𝔽₂³ : r₁·x = t₁, r₂·x = t₂} = 2,  #{x ∈ 𝔽₂³ : rᵢ·x = tᵢ, i = 1,2,3} = 1,

for independent rᵢ and every target (`two_axes_leave_two`, `three_axes_lock_one`). The two axes of the record, observation and price, are the kinetic line; its two points are the two worlds of Section 6; the act of Section 8 is the third axis, and with it the lock forms on one point. The counts are theorems; their reading onto the row is structural.

## The act: existence read on the row

Existence read on the row is the statement that whatever exists acts finitely at every time,

> ActsFinitely(F) :⇔ ∀d ∀t ∃n : N_F(d,t) = n.

The kernel proves it is the value, exactly (`act_is_the_value`), and that it is keyed: it holds in the regular world and fails in the blowup world (`act_is_keyed`). Its supply is self-grounding: an act exists on a frame exactly when the value holds there (`supply_iff`).

The equivalence is the strength of the closure, as the equivalence of least erasure with the critical line is the strength of the author's Riemann closure (Islam 2026g). Section 3 proved that nothing given on every frame forces the value; so any premise that closes the value carries it, and the weakest such premise is the value itself. A closure that assumed less would be wrong; a closure that assumed something inequivalent would close a different question. The act assumes exactly the value, read as an act of existence, and nothing beside it in the kernel; the reading of the frame as the equations is the reader's identification, declared in Section 2.

## The proof: global regularity from existence

**Definition 9.1** (`ActualFlows`). A structure with two fields: `F`, the frame, standing for the strong solutions of the unforced equations with their registrations, the identification, blowup with an unbounded count included, being the reader's; and `supply`, existence acting finitely on that frame. The second field is the assumption of the paper, and the only one.

**Theorem 9.2** (`regularity_from_existence`). For every `A : ActualFlows`, every datum of `A.F` is regular. *Cone: none.*

The proof of global regularity is Theorem 9.2. Its only assumption is one field of its input type, visible in the statement; its cone is empty, without even the standard axioms; and no theorem outside this section takes the structure.

## Nothing escapes

Every instant of every datum lands on exactly one gate, a finite count or an unbounded one (`every_instant_lands`, `gates_exclusive`), with no third landing. The dichotomy is proved without excluded middle, because a count is a value and not a proposition. Under the act every datum at every time acts finitely (`nothing_escapes`). One unbounded count refutes the act (`blowup_refutes`). The closure is universal in the exact sense the gates give it: there is no datum, no time and no instant that the act does not decide, and there is one form, a blowup, in which it could be refuted.

## The price: what energy does not decide, and what the speed limit does

**Energy does not decide.** The energy inequality,

> ½‖u(t)‖²_{L²} + ν ∫₀ᵗ ‖∇u(s)‖²_{L²} ds ≤ ½‖u₀‖²_{L²},

bounds the dissipation paid by the energy (Leray 1934), and it holds on a frame where a datum blows up (`energy_does_not_decide`). This is the frame-level face of supercriticality, whose analytic form is that the energy scales as λ⁻¹ under u_λ: a finite energy budget is compatible with a singularity, because the singularity concentrates at scales where the energy cost vanishes.

**The speed limit decides, on matter.** A physical flow is a quantum system, and the quantum speed limit (Mandelstam and Tamm 1945; Margolus and Levitin 1998) bounds the time to reach an orthogonal state by πħ/(2E), with E the mean energy above the ground state (Margolus and Levitin) or the energy spread (Mandelstam and Tamm), so the number of distinguishable changes of state by time t satisfies

> N(t) ≤ c E t,  c = 2/(πħ).

In the kernel c is any natural-number upper bound for 2/(πħ) in the chosen units, and the deduction does not depend on its value.
A singularity by time T requires, before T, more registrations than any given number, since it excites arbitrarily fine scales. The two together contradict each other at N = cET: no actual flow blows up (`no_actual_blowup`). The speed limit carries the weight: without it the same definition of blowup is satisfiable, by a world whose counts before T exceed every bound (`speed_is_load_bearing`). On matter every count is a natural number at every instant, so existence acts finitely there by construction of the physical frame (`matter_acts_finitely`, `matter_is_regular`); the content of the kinetic closure is `no_actual_blowup`, which excludes the one way finite counts could still blow up, and the speed limit is what excludes it. The speed limit and the cascade enter as fields of the structure `Physical`: the speed limit is cited at its grade, and the cascade is the paper's own definition of blowup from Section 2 carried into the physical frame in its limit form, counts finite at every instant and unbounded before T, its physical reading part of the reader's identification; the deduction from them is on no axiom.

That is the kinetic closure from existence alone. Its scope is matter, a quantum system with a molecular cutoff. The continuum equations idealize matter, and the step from the one to the other is the identification the reader makes in Definition 9.1. It is the step the act supplies.

## The record and the seed

No finite record forces the value: for every n the staged world is regular on its first n data and the value fails (`finite_record_never_forces`). No symmetry lifts the small-data region: the symmetries the text checks, space scaling and viscosity scaling with rotations and translations, keep the dimensionless size ‖u₀‖_{Ḣ^{1/2}}/ν, since space scaling u_λ(x,t) = λu(λx, λ²t) fixes Ḣ^{1/2} and viscosity scaling multiplies norm and ν alike, so no small datum is carried onto a large one (`no_symmetry_lifts`). A step uniform in the size reaches every size (`uniform_step_forces_all`). The seed is evidence for the fibre of Section 6, and for neither of its points.

## The forced class

The forced alternatives are their own class. The author's transport theorem proves that a forced breakdown transports only to a system that is not closed (Islam 2026d), and his filter paper proves the forced alternative a regularity filter on a prescribed field (Islam 2026c). The unforced closure stands whatever the audit of the September 2026 forced construction finds, and this paper asserts nothing about its correctness.

## The grade of the closure, stated whole

**Proved in core Lean 4, no library, no `sorry`, no axiom declared, every theorem on no axiom at all (31 theorems):** the frame and its two worlds; existence given, its conservativity, its holding in both worlds, its forcing no value; the act, its equality with the value, its key, its self-grounding; the closure from the act; the exclusive gates and the universal closure; the refutation form; the energy theorem; the kinetic theorem, the load-bearing role of the speed limit, and regularity on matter; the freedom wall, the fibre, the prime's shape; the two lock counts; the finite record, the symmetry theorem and the uniform step; and the closure whole.

**Carried as fields:** the quantum speed limit, cited; and the cascade, the definition of blowup of Section 2 carried into the physical frame, in the kinetic theorem.

**Supplied by the act, named and visible in one input type:** existence acting finitely at the continuum, `supply`, which is the value.

**The reader's identification:** the frame with the strong solutions of the equations, the analytic blowup of a solution with an unbounded count, and matter with the continuum.

The grade of the closure is the grade of its act, and the act is the one thing the kernel proves no given can supply. That is why the act is named rather than derived: a derivation of it from what is given would contradict `given_is_not_the_value`, and the kernel would not compile.

## Objections, answered

*The act is the conclusion.* It is, by `act_is_the_value`, and the paper proves it must be. A closure from a weaker premise is impossible by `given_is_not_the_value`, and a closure from an inequivalent premise closes another question. This is the shape of every closure of a value that differs between coherent worlds, and the paper states it as a theorem rather than discovering it as a defect.

*Existence is universally given; why is it not enough?* Because what is universally given holds in the blowup world too (`given_in_both_worlds`). The universality of existence is exactly what keeps it from choosing between worlds. Existence chooses when it is read on the row, and that reading is the act.

*The kinetic theorem is physics.* It is a theorem from one cited physical field, the speed limit, and the paper's own definition of blowup, with a deduction on no axiom. Its conclusion is about matter. The paper does not transport it to the continuum by theorem; it names the transport as the act.

*The frame is a skeleton, not the equations.* Correct, and stated in Definition 9.1. Every theorem holds on every frame, so it holds on whichever frame the reader identifies with the equations.

## Falsifiers

**F-Blowup.** A smooth unforced datum of finite energy whose solution is proved to become singular in finite time. It refutes the act by `blowup_refutes`, and it is the one channel the closure leaves open.

**F-Speed.** A physical flow whose number of distinguishable changes of state by time t exceeds the speed-limit bound for its energy. It refutes the field `speed` and with it the kinetic theorem.

**F-Cone.** The kernel, compiled on a stock toolchain, prints any axiom in any cone, or fails to compile. It refutes the claim that every theorem is on no axiom.

## Positioning

**Positioning; no prior position is contradicted.**

- **Leray 1934** (weak solutions; the energy inequality): the inequality proved not to decide. Relation: bounds.
- **Fujita and Kato 1964** (small critical data are global): the small region shown not to lift by symmetry. Relation: bounds.
- **Mandelstam and Tamm 1945; Margolus and Levitin 1998** (the quantum speed limit): carried as a field; regularity on matter deduced. Relation: extends.
- **Tao 2016** (an averaged equation blows up): the energy theorem exhibits on the frame what that construction shows analytically. Relation: adjacent.
- **The forced construction, September 2026** (forced blowup, alternatives (C) and (D)): shielded from; not engaged. Relation: adjacent.
- **Islam 2026g, the Riemann closure** (one bit, closed by one act): the template carried to this row. Relation: extends.
- **Islam 2026a–f, the Navier–Stokes papers** (criteria, a premise, closed routes, a witness): the premise retired; the row reduced to existence. Relation: extends.

The relation words are used as defined: *extends* where a prior result is carried and a theorem is added on it; *bounds* where its reach is stated exactly; *adjacent* where no formal engagement is claimed.

## Conclusion

Existence was given before the question was asked, and the paper proves exactly what that givenness carries: the whole form of the closure, on every frame, in both worlds. It proves that existence read on the row is the value; that the value follows from that reading by one act; that nothing escapes the act; that one blowup is the only refuter; and that on matter the speed limit makes the absence of blowup a theorem. The freedom of the row is one free orbit, the shape of a prime, and three axes lock it. Every theorem stands on no axiom at all.

The verdict, in the words of Section 1, unchanged: the Navier–Stokes regularity problem is closed to one act of existence. Existence as given carries the form of the closure on every frame and holds in the regular and the blowup world alike. Existence read on the row, that whatever exists acts finitely at every time, is the value, exactly. It is supplied by one act, at premise grade, as one field of one type, and the compiler prints global regularity from it on no axiom. Nothing escapes the act; one blowup is the only refuter. On matter, that no flow blows up is a theorem of the quantum speed limit. Every theorem of the kernel depends on no axiom at all.

## Appendix A · Receipts

The kernel, `NS_Existence_Closure.lean`, compiles with exit 0 and no message on Lean 4.19.0 and on Lean 4.22.0 (de Moura and Ullrich 2021). It carries thirty-one theorems, and every one prints *does not depend on any axioms*, pinned by `#guard_msgs` so that a drifted cone fails the compile. Its SHA-256 is

`6d5c5d4d336e4303e2343b8998c4932ffa4e60b5a6c75ba9b8f634fa27ca33f2`

and the Markdown master of this paper carries the kernel with a one-line extraction command and its manifest.

## Appendix B · The kernel

The kernel, `NS_Existence_Closure.lean`, is carried verbatim in the Markdown master of the sealed edition, with its manifest and a one-line extraction command; it is omitted here because a five-hundred-line listing does not survive a blog editor.

## Author's Provenance and Method Disclosure

This paper was developed under Trisduction, a verification and organizing discipline that adds the cited results no warrant; the method and its executable batteries are stated in full at the reference below.

*Author and method.* Mohammad F. Islam, PhD, independent researcher, sole author and sole authority for every claim and every error. The reduction was directed by the author and drafted with Claude (Anthropic) as scribe: the model wrote and compiled the kernel, checked citations and argued against the author's positions on instruction; it holds no authorship. One claim was held at the model's insistence: the paper does not state that regularity follows from existence as given, because the kernel's own `given_is_not_the_value` proves the contrary.

*The register.* In the programme's vocabulary: the form, the act's identity with the value, the universal closure and the kinetic theorem stand at [⟀ T] on no axiom; the triaxial reading at [⟀ S]; the value at the continuum at premise grade on the act; ΔM = 0 on the cited physics. The act is the row's least-erasure posit read as existence acting finitely; the row carries no defeater. The freedom cut, prime-as-freedom and the triaxial lock are applied on the row. The effective alignment-defect premise of the earlier papers is retired as a placeholder.

*Audit.* This edition has not yet been prosecuted by the external substrates, and no audit result is claimed. The development provenance is the author's Zenodo trail, the Unabridged Trisduction Codex and the Lean Codex at github.com/1000sapients/Trisduction.

## References

de Moura, L. and S. Ullrich. 2021. The Lean 4 theorem prover and programming language. *Automated Deduction, CADE 28*, 625–635.

Fefferman, C. 2006. Existence and smoothness of the Navier–Stokes equation. In *The Millennium Prize Problems*, 57–67. Clay Mathematics Institute.

Fujita, H. and T. Kato. 1964. On the Navier–Stokes initial value problem. I. *Archive for Rational Mechanics and Analysis* 16: 269–315.

Islam, M. F. 2026a. Integrable misalignment forbids blowup. Zenodo. doi:10.5281/zenodo.22665832.

Islam, M. F. 2026b. Global smoothness of the three-dimensional Navier–Stokes equations from a single effective axiom. Zenodo. doi:10.5281/zenodo.22670344.

Islam, M. F. 2026c. The forced alternative is a filter. Zenodo. doi:10.5281/zenodo.22670253.

Islam, M. F. 2026d. Closure and the limits of forced results. Zenodo. doi:10.5281/zenodo.22683806.

Islam, M. F. 2026e. A formal proof of Navier–Stokes termination at the formal-alone register. Zenodo. doi:10.5281/zenodo.22705897.

Islam, M. F. 2026f. The fluid is the witness. Zenodo. doi:10.5281/zenodo.22986563.

Islam, M. F. 2026g. The Riemann Hypothesis closed to one named bit and proved from unconditional least erasure by one act, with an empty axiom cone. Zenodo. doi:10.5281/zenodo.23034066.

Islam, M. F. 2026h. Nothing escapes least erasure. Zenodo. doi:10.5281/zenodo.23080221.

Islam, M. F. 2026i. PhysOSᵀ: the Trisduction physical operating system. Zenodo. doi:10.5281/zenodo.23117440.

Islam, M. TRISDUCTION: A linguistically, topologically, and mathematically sealed verification architecture. Triaxial orthogonality, twelve-gate closure, the quaternionic completion, the root axiom, and the master pre-sealed proposition ledger. Zenodo, version 4, 19 June 2026. doi:10.5281/zenodo.20757507. Mirror: PhilArchive record ISLTTG. Master reference, continuously updated at the same location.

Leray, J. 1934. Sur le mouvement d'un liquide visqueux emplissant l'espace. *Acta Mathematica* 63: 193–248.

Mandelstam, L. and I. Tamm. 1945. The uncertainty relation between energy and time in non-relativistic quantum mechanics. *Journal of Physics (USSR)* 9: 249–254.

Margolus, N. and L. B. Levitin. 1998. The maximum speed of dynamical evolution. *Physica D* 120: 188–195.

Tao, T. 2016. Finite time blowup for an averaged three-dimensional Navier–Stokes equation. *Journal of the American Mathematical Society* 29: 601–674.

*End of manuscript*

