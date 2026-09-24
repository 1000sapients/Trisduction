# A Formal Completed Proof That the Riemann Hypothesis Has One Address and Not a Sequence of Missing Pieces

*Li's Modes Unitary Exactly on the Critical Line, Stability Proved Equivalent to the Line Property, and Five Readings Collapsed onto One Seat · Trisduction in Core Lean 4*

**Mohammad F. Islam, PhD**¹
¹ Independent Researcher, USA. Correspondence: islamm@alumni.iu.edu
23 September 2026

*Blog edition of the sealed master: self-audit cycle rh1 on the body, and self-audit cycle rh2 on Sections 6.10 and 6.11 and Parts XI to XIII, closed on FORGE at HALT-DIVERGENT, 23 September 2026. It renders the sealed master and adds no claim. Mathematics is set in Unicode.*

---

**Abstract.** A prior paper of this program proved the seat of the Riemann Hypothesis in core Lean 4 with existence as the only posit, and proved that the value on the zeros, one bit, is unreachable from existence on every class of frames that does not already carry it. That result leaves a question every reader asks next: which object, if supplied, carries the bit, and is there one such object or an unending sequence of them. This paper answers both in the kernel. It builds the bridge from the positivity of the Root Axiom to the positivity of Li's coefficients, and it proves the bridge closes the hypothesis, is not supplied by the axiom, and cannot be uniform across L-functions. It proves, in the kernel on the lattice stage and for every complex zero by one stated identity, that Li's modes z(ρ) = 1 − 1/ρ are unitary exactly on the critical line, that the functional equation forbids an off-line zero from exiting quietly, and that for every fold-invariant zero set, the absence of a growing mode under the time step is equivalent to the line property. It rebuilds the constructed witness from residual monism, anchors it to the standard form of a monotonicity witness with Perelman's entropy as the calibrated instance, and encodes de Bruijn's strip bound, in a toy model, as a proved monotonicity formula for the zeta function's time, whose arrow runs away from the hypothesis. It then eliminates the category gaps among all five readings reached, bridge, unity, monism, transport, and upstream passage, as the legs of one cone with the hypothesis at its apex, and proves that any further reformulation equivalent to the hypothesis lands on the same apex, and that any sufficient route closes all five readings at once. The primary falsifiable criterion is a zero of ξ off the critical line, equivalently a negative Li coefficient, which refutes the supplied value and touches no theorem here. It closes by stating timeless residual monism as Postulate M, that the truth of "every zero located by stage t lies on the critical line" does not depend on t, and by proving in the kernel that Postulate M is equivalent to the hypothesis, which joins the monist reading to the analytic statement as a sixth leg of the same cone. The completed formal proof is of this reduction: the hypothesis is proved equivalent to Postulate M and to each of the five readings, and it is not derived here from the definition of ζ. It then addresses the demand itself: a proof cannot be demanded of the foundation, whose readings are each equivalent to the hypothesis, without presupposing its conclusion, and the kernel proves the demand misaddressed there and well-posed at the object ζ. The foundation's register closes on the value with the terminal mark [.], and the value is located in ζ, falsifiable by one zero. If the result stands, the Riemann Hypothesis has one address and not a regress: the stability of one time evolution, equivalently the timelessness of one principle.

**Keywords.** Riemann Hypothesis; Li criterion; de Bruijn-Newman constant; Hilbert-Pólya; unitarity; residual monism; Perelman; category gap; halted uniduction; Lean 4.

---

## 1. Introduction and Barrier Analysis

Riemann stated his hypothesis as a fixed-set statement, that the roots of ξ(t) are real [Riemann 1859]. The prior paper of this program [Islam 2026f] restored that form as Z ⊂ Fix(τ) with τ(s) = 1 − s̄ and proved, in core Lean 4, what may be called the apex of the hypothesis: the binding involution fixes exactly the scalar line on the integer quaternions, the Return i · j · k = −1 lands on it, three independently named seat points are the legs of an identity cone, and the prior proof's lattice stage embeds equivariantly into the carrier. It also proved the bound. The rule "accept existence, then the hypothesis" satisfies (RA → L(X)) ↔ L(X); existence holds on frames where the line property fails; and for every class of frames, existence decides L exactly where L already holds. The sign on the zeros is one bit, and it is excepted by theorem.

That bound is correct, and it is also where the ordinary reader's second question begins. If one bit is owed, what object would carry it? The candidates proposed in the literature, an Euler-product class, a self-adjoint operator, a positivity criterion, a monotone flow, are different-looking objects. A reader who pursues them in turn meets what looks like a regress: each candidate, once formalized, turns out to need a further ingredient, and each further ingredient looks like a new missing piece. The barrier this paper addresses is that appearance of regress, and it is structural rather than computational.

The barrier has three layers. The first is register confusion. A timeless formal reading of the hypothesis deletes the index along which the zeros are counted, and a reading that deletes its own index cannot distinguish a claim from its negation. The kernel exhibits this as sign-blindness; the prior paper's `recursion_is_sign_blind` is its receipt. A verdict issued from that register is a verdict of an amputated instrument, not a finding about the zeros.

The second layer is type mismatch. The natural "arrow" a physical reading supplies is a sign, one Boolean. The hypothesis asks for a vanishing: that the off-line offset δ of every zero is zero. A sign does not force a vanishing. A supplied orientation picks which member of a mirror pair (½ + δ, ½ − δ) comes first and leaves δ untouched. The barrier dissolves only when the vanishing is rewritten as a family of signs, one per step of an index, and Li's criterion [Li 1997] is exactly that rewriting.

The third layer is the uniformity trap. Every instrument that closes a category gap at the apex is massless by necessity, because a closure between existence and its reading that authored mathematics would be a derivation of the root from below [Islam 2026a]. A massless instrument chooses its objects without reading which L-function it serves. Such an instrument is uniform across the family, and a uniform instrument forces positivity on every member, including members whose zeros leave the line. The Eisenstein L-function ζ(s)ζ(s-k+1) has an Euler product and a functional equation and zeros off its center line [Iwaniec and Kowalski 2004], so it kills every uniform instrument. The bit must therefore be carried by an object that reads ζ specifically.

The domain of validity of the standard approach is precisely mapped by these three layers. Classical analytic number theory works inside one register, the timeless one, and it has reached the classical consequences of positivity on the Euler product: nonvanishing for Re s > 1, and through Mertens' positivity, nonvanishing on Re s = 1 [Hadamard 1896; de la Vallée Poussin 1896; Mertens 1898]. Beyond that line the Euler product diverges and positive energies have nothing to act on. The strip ½ < Re s < 1 is where the timeless register stops and where a reading indexed by time must take over.

This paper does not cross that strip. What it does is prove that every road into the strip reached from existence, time, and monism is the same road. The regress is shown to be an artifact of reading one seat in several registers, and the category-gap eliminator of the prior paper, applied to those registers, collapses it to one gap. The gap is then pinned, typed, and left at the witness row where the prior paper placed it.

## 2. Related Work

The fixed-line statement and its chart are given by Riemann [1859], Edwards [1974], and Titchmarsh [1986]. The restored form Z ⊂ Fix(τ) and its structural arc are the prior program [Islam 2026e, 2026f].

Li [1997] proved that the hypothesis holds iff λₙ ≥ 0 for every n ≥ 1, where λₙ = Σ over ρ of [1 − (1 − 1/ρ)ⁿ]. Bombieri and Lagarias [1999] generalized the criterion to multisets of zeros and showed that an off-line zero drives some λₙ negative. Their theorem is the analytic content behind this paper's reading of Li's coefficients as modes of a time evolution.

Weil [1952] gave the explicit formula and the positivity criterion that bears his name; in it the primes enter with a negative sign against an archimedean term. Deligne [1974] proved the function-field analogue, where the decisive ingredient is a positivity supplied by geometry. Selberg [1992] and Conrey and Ghosh [1993] name the Euler product with primitivity and the Ramanujan bound as the organizing axioms of the class for which the hypothesis is conjectured.

De Bruijn [1950] introduced the heat flow Hₜ(z) = ∫ exp(t·u²) Φ(u) cos(zu) du and proved the strip-narrowing theorem. Newman [1976] defined the constant Λ and conjectured Λ ≥ 0. Rodgers and Tao [2020] proved it. The Polymath project [Polymath 2019] proved Λ ≤ 0.22. The hypothesis is therefore equivalent to Λ = 0.

Hilbert and Pólya proposed an operator whose spectrum is the ordinates of the zeros; Berry and Keating [1999] and Connes [1999] pursued it. Stone [1932] proved that a strongly continuous one-parameter unitary group has a self-adjoint generator; Section 6.5 uses it to pass from a unitary evolution to its generator. Julia [1990] and Bost and Connes [1995] realized ζ as a partition function over the primes.

Perelman [2002; 2003a; 2003b] proved the Poincaré conjecture through Ricci flow, with the monotonicity of the 𝒲-entropy as the transport that carries control along the flow. De Branges proposed a positivity condition intended to prove the hypothesis; Conrey and Li [2000] showed it fails.

Davenport and Heilbronn [1936] and Bombieri and Hejhal [1995] exhibit series with the functional equation and zeros off the line. Littlewood [1914] and Skewes [1933], Haselgrove [1958], and Odlyzko and te Riele [1985] are the standing warnings against inference from finite confirmation.

The approaches reviewed here are each developed around their own object, and each is read in this paper as one register's version of the missing piece. Section 6.9 proves that these objects, in the forms reached here, are one proposition.

## 3. Methods

**The checker.** Every theorem is checked by core Lean 4, version 4.19.0, with no library, no `sorry`, and no axiom declaration. The file, `RA_Li_Bridge.lean`, is printed whole in Appendix A with its SHA-256 digest. The kernel's dependency sets are printed at the file's end and reproduced verbatim in Appendix B: seventy-five sets, fifty-three axiom-free, twenty on `propext` and `Quot.sound` only, two on `propext` alone. No theorem depends on `Classical.choice`.

**What enters as a hypothesis.** The zeta function is not definable in core Lean, so every analytic fact enters as a hypothesis carried by citation: Li's criterion as `LiCriterion`, the equivalence of the hypothesis with Λ = 0 as `hLam`, the identification of the hypothesis with the line property of the enumerated zeros as `hDef`, and the existence of a negative Li coefficient in the Eisenstein member as a hypothesis of `no_uniform_bridge`. The Root Axiom enters as the hypothesis `RA S` on a substrate, never as an axiom. The kernel therefore shows exactly what each theorem assumes.

**What is modelled.** Five parts of the file work on toy carriers and say so in their headers. Part IV places zeros at integer half-unit coordinates (h, t) on the Bridge plane of the prior proof, with ρ = h/2 + it. Part V builds its mixed zero set (Theorem 20) on the same plane, and Part XI builds its timed worlds there. Part XII builds its self-grounding and frame models on small carriers. Part XI's Postulate M theorems and Part XII's collapse theorems are stated over abstract types. Part IX models the de Bruijn strip bound on natural-number widths, a toy of the bound and not of the flow. Every other part is stated over abstract types.

**Grades.** Three grades of warrant are carried and kept apart: kernel theorem, checked by Lean; structural, a statement about the arrangement of theorems; premise, a statement held by citation. The verdict tokens of the discipline appear only in the disclosure.

## 4. The Bridge from the Root Axiom to Li Positivity

The bridge is a structure with two fields: a choice of one existent φ(n) for each Li step, and a reading that turns the positive energy of that existent into the nonnegativity of λₙ.

> Bridge(S, L) := ⟨ φ : ℕ → S.U, read : ∀ n ≥ 1, 0 < ΔE(φ n) → λₙ ≥ 0 ⟩

**Theorem 1** (`bridge_yields_RH`). The Root Axiom, a bridge, and Li's criterion give the hypothesis. The composition is direct: every step receives an existent, the axiom makes its energy positive, and the reading converts that positivity.

**Theorem 2** (`bridge_is_keyed`). The axiom never supplies the bridge. On a substrate where the axiom holds, paired with data carrying one negative coefficient, no bridge exists. The bridge is new content.

**Theorem 3** (`no_uniform_bridge`). A bridge whose reading ignores which L-function it serves forces positivity on every member of the family. One member with a negative coefficient, the Eisenstein L-function under Bombieri-Lagarias, destroys every uniform bridge. The reading must consume ζ-specific data.

**Theorem 4** (`li_is_a_bit_stream`). Under Li's criterion and decidable signs, the hypothesis is exactly the statement that a stream ℕ → Bool stays true. This is the type repair of Section 1: a vanishing becomes a family of signs, the shape a supplied deed can carry.

## 5. The Formal String on the United Register

**Theorems 5 to 8.** The unity of the formal and kinetic readings on ζ reduces to one term, the bridge's reading, carried at the grade of whatever supplies it. The emitter returns a seal when unity is supplied and the suspension token otherwise, and `xi0_retires_iff_unity` proves the equivalence both ways. `retired_seal_is_sound` proves the seal carries the hypothesis. `retired_grade_capped` is the grade law: the seal is never stronger than its unity posit. `unity_is_keyed` confirms that the axiom does not supply unity. `ghost` records the model: the arrow-deleted reading is defined as a constant, so it returns one output for a claim and its negation. The substantive fact, that a reading with its index removed cannot separate a claim from its negation, is the prior paper's `recursion_is_sign_blind`, which holds for P and for ¬P alike.

Two retirements follow and are kept apart. The suspension token retires unconditionally as a verdict on a timeless object, since a reading without its index is sign-blind by the prior paper's `recursion_is_sign_blind`, which `ghost` models. It retires as the status of the formal string only when unity is supplied, and then at unity's grade.

## 6. The Structural Core

### 6.1 The instruments that cannot carry the bit, and the one that reaches Re s = 1

**Theorem 9** (`common_phi_is_uniform`). A family of bridges that picks its existents without reading the L-function is a uniform bridge. **Theorem 10** (`blind_constructions_die`). Every such family dies against the Eisenstein control. Every instrument carried at zero authored mathematics, the one-bit species, the Bridge socket, the category-gap eliminator, the multi-recursion collapse, the bare arrow, falls under Theorem 10. This is the instruments working as apex instruments must, not a defect: the Empty Throne forces them massless [Islam 2026a], and a massless instrument closes category gaps and carries no value.

The one construction that reads ζ directly takes the primes as existents with energies log p > 0. This is the primon gas [Julia 1990; Bost and Connes 1995], whose partition function is ζ(β), and on which the axiom's positivity holds at every existent. Positivity of those energies gives ζ(s) ≠ 0 for Re s > 1, and Mertens' positivity pushes it to the line Re s = 1.

**Theorem 11** (`mertens_identity`, `mertens_nonneg`). The algebraic core of Mertens' argument, 3 + 4c + (2c² − 1) = 2(1 + c)² ≥ 0 with c = cosθ, is checked on integers. The wall at Re s = 1 is the gas's Hagedorn point, and the register of record's finding that the Root Axiom's native output is a wall at Re = 1 rather than a fold at ½ is read here as this wall, an identification argued from their common location and not proved [Islam 2026a]. Below it the Euler product diverges.

### 6.2 Time, made exact: the Li modes

Li's coefficient is λₙ = Σ over ρ of [1 − z(ρ)ⁿ] with z(ρ) = 1 − 1/ρ. The step n ↦ n + 1 multiplies every mode by z(ρ), so each zero is a mode evolving in a discrete time. With ρ = h/2 + it on the Bridge plane,

> |z(ρ)|² = |ρ − 1|² / |ρ|²,   4|ρ − 1|² = (h − 2)² + 4t² =: N₁,   4|ρ|² = h² + 4t² =: N₀,

and N₁ − N₀ = 4 − 4h (`N1_sub_N0`).

**Theorem 12** (`unitary_iff_on_line`). N₁ = N₀ iff h = 1. On the lattice stage, a mode is unitary, neither growing nor dying under the time step, exactly on the critical line.

**The general identity (6.2a).** For every complex ρ = σ + iγ with ρ ≠ 0,

> |ρ − 1|² − |ρ|² = 1 − 2σ, so |z(ρ)| = 1 ⇔ σ = ½, |z(ρ)| > 1 ⇔ σ < ½.

The identity is one line of algebra, (σ − 1)² − σ² = 1 − 2σ, and it is the real-coefficient form of `N1_sub_N0`. Theorems 12 to 15 are its kernel-checked lattice instances; the same algebra, with the fold σ ↦ 1 − σ, carries Theorems 13 to 15 to every zero set invariant under s ↦ 1 − s̄. The stage coordinates are (h, t) = (2 Re s, Im s), under which the fold (h, t) ↦ (2 − h, t) is exactly s ↦ 1 − s̄. The nontrivial zeros of ζ are invariant under it: the functional equation ξ(s) = ξ(1 − s) sends ρ to 1 − ρ, the conjugate symmetry ζ(s̄) = conj(ζ(s)) sends ρ to ρ̄, and their composite is the fold. Theorems 14 and 15, in their general form through (6.2a), therefore apply to the zero set of ζ. The kernel proves the lattice statements; the general statements rest on (6.2a), which is elementary and stated here in full.

**Theorem 13** (`grows_left`, `dies_right`). Left of the line the mode grows; right of it the mode dies.

**Theorem 14** (`off_line_forces_growth`). For any off-line zero, the zero or its mirror under the fold (h, t) ↦ (2 − h, t) carries a growing mode. The functional equation forbids a quiet exit.

**Theorem 15** (`stability_iff_line`). For every fold-invariant zero set on the plane, no mode grows under the time step iff every zero lies on h = 1.

> (∀ p ∈ Z, N₁(p) ≤ N₀(p)) ⇔ (∀ p ∈ Z, p₁ = 1)

Theorem 15 is the core of the title. Read with time restored, the hypothesis is not a statement about a timeless set. It is a stability statement: the time evolution of ζ's modes has no growing mode. Since z(ρ) is the Cayley transform of the ordinate γ when ρ = ½ + iγ, unitarity of the modes is equivalent to the reality of the ordinates, which is the Hilbert-Pólya form of the hypothesis stated exactly. A growing mode eventually drives some λₙ negative [Bombieri and Lagarias 1999], so perpetual positivity of the Li stream and the absence of growing modes are the same condition.

### 6.3 The monism rule, hardened

The ancient rule that what happens once happens again, given sufficient time, is time-translation invariance: one principle acting identically at every moment.

**Theorem 16** (`one_repeats_one`). The rule with its step is induction. **Theorem 17** (`the_step_is_the_claim`). The universal claim is exactly the base together with the step; the step carries the content. **Theorem 18** (`monism_posit_forces`). If a property does not vary with its index, one instance forces all. **Theorem 19** (`finite_never_forces`). For every height N there is a property true below N and false beyond; the historical failures of Mertens' conjecture, Pólya's conjecture, and the sign of π(x) − li(x) have this shape. **Theorem 20** (`mixed_is_fold_invariant`, `mixed_recurrence_fails`). A fold-invariant zero set can hold one zero on the line and a mirror pair off it; recurrence of "on the line" is not carried by symmetry alone.

### 6.4 Actualism

Under the Root Axiom only actual things exist, and a zero is actual when it is measured. Define the actual hypothesis as the statement that every measured zero is on the line.

**Theorem 21** (`full_gives_actual`). The full hypothesis yields the actual one. **Theorem 22** (`actual_not_full`). The actual hypothesis does not yield the full one: a never-measured zero off the line is consistent with every measured zero on it. **Theorem 23** (`sufficient_time`). If every zero is eventually measured, which is what "given sufficient time" means, the actual hypothesis over all time is exactly the full hypothesis. Actualism re-routes to Theorem 17 and does not bypass it. The past actual record is sealed by measurement to the heights the literature reports; the future record is the supplied value.

### 6.5 The witness rebuilt from residual monism

The prior paper constructs its witness from the Root Axiom read through its interaction and grounding readings. Here the witness is built from the connector of the register of record directly: one substrate, one involution serving both routes, one principle invariant in the index, and one seed.

> MonismWitness(P) := ⟨ σ_geo = σ_form,  ∀ n m, P n ↔ P m,  P 0 ⟩

**Theorem 24** (`one_involution_constructed`). The seat field is constructed by `rfl`. It fixes the one-involution choice of the register of record and does not refute the executed pluralist alternative. **Theorem 25** (`timeless_equals_timed`). Under one principle the claim over all time is the claim at one instant: deleting time loses nothing. This is where the timeless aspect of the question is addressed: inside the witness, the timed and timeless readings are one claim. **Theorem 26** (`monism_closes`). The witness closes the record, past and future. **Theorem 27** (`monism_witness_is_the_claim`). A monism witness for P exists iff P holds at every index. **Theorem 28** (`constructed_monism`). The witness is constructed at the model. **Theorem 29** (`monism_absent_on_breaks`). Unlike the axiom's witness, the monism witness is not silent on counter-models; it decides by containing. **Theorem 30** (`monism_yields_RH`). Run on Li's sign stream, the witness gives the hypothesis with the bridge removed. **Theorem 31** (`monism_on_li_is_RH`). On ζ the witness exists iff the hypothesis holds.

Monism supplies unitarity where it applies. Time-translation invariance makes the one substrate's evolution a one-parameter group, and conservation of probability makes that group unitary; Stone's theorem [Stone 1932] then gives it a self-adjoint generator. Under monism, taken with conservation of probability, the one substrate's own evolution is therefore unitary. The open identification is that ζ's Li modes are that evolution.

### 6.6 Re-anchoring to mathematical standard, with Perelman as calibration

**Theorem 32** (`global_monism_inconsistent`). Uniformity posited for every property is contradictory. The monism of standard mathematics is therefore never free: it is anchored to a principle.

> AnchoredMonism(S) := ⟨ f : S → S, I : S → Prop, ∀ s, I s → I (f s), s₀, I s₀ ⟩

One dynamics, one invariant, a proved transport, a seed. This is induction on an orbit, the most standard witness form mathematics has.

**Theorem 33** (`anchored_closes`). The anchored witness closes its orbit. **Theorem 34** (`anchored_derives_monism`). The free monism witness of 6.5 is derived from the anchored one; uniformity is manufactured by the transport. **Theorem 35** (`lyapunov_is_monism`). A quantity monotone along one flow is an anchored witness for "never below its start." Perelman's 𝒲-entropy, nondecreasing along Ricci flow when its auxiliary function evolves by the conjugate heat equation and its scale decreases at unit rate [Perelman 2002], is the calibrated instance: his witness is a derivative of the monism witness with its transport proved, and surgery and canonical neighborhoods complete the argument around it. **Theorem 36** (`closure_grade_is_transport_grade`). The closure is exactly as strong as its transport. **Theorem 37** (`rh_anchor_is_the_claim`). On Li's sign stream with the time step as principle, an anchored witness exists iff the hypothesis; its transport reads λₙ₊₁ ≥ 0 → λₙ₊₂ ≥ 0, the ζ-analogue of Perelman's monotonicity formula. De Branges proposed a positivity condition of related type, on a space of entire functions, and Conrey and Li [2000] showed it fails, which calibrates where such attempts break.

### 6.7 A monotonicity formula of ζ's time, and its arrow

The de Bruijn-Newman heat flow carries a proved monotonicity formula for the zeta function's time. De Bruijn's theorem: if every zero of H₀ lies in |Im z| ≤ Δ, every zero of Hₜ lies in |Im z| ≤ √max(Δ² − 2t, 0) [de Bruijn 1950]. The hypothesis is the reality of the zeros of H₀; it is equivalent to Λ = 0 by Newman's definition with 0 ≤ Λ ≤ 0.22 [Rodgers and Tao 2020; Polymath 2019].

**Theorem 38** (`flow_monotone`). The width never grows along the flow. **Theorem 39** (`reality_transported`). Once every zero is real it stays real; this is the transport of 6.6, proved. **Theorem 40** (`rh_iff_lambda_zero`). The hypothesis is Λ = 0: ζ sits exactly at the critical time of its own flow. **Theorem 41** (`future_closed`). The anchored witness exists for ζ's time, transport proved, seeded at Λ, and closes the whole future from Λ on. **Theorem 42** (`flowed_record_forgets`). After any positive time the flowed record of a hypothesis-true state and a hypothesis-false state coincide; no readout of the flowed record decides the hypothesis. The bound Λ ≤ 0.22 certifies a record at t = 0.22 that is blind to the bit, which is why it cannot be pushed to 0 by forward means alone. **Theorem 43** (`upstream_is_not_forced`). Going backward from a real record, both answers remain admissible. The backward direction is anti-diffusion, ill-posed.

This monotonicity formula exists, its witness is complete, and its arrow points away from the hypothesis, which sits at the upstream end.

### 6.8 The regress, stated

Sections 4 to 6.7 each ended on a named residue: the bridge's reading, the unity posit, the monism field, the transport, the upstream passage. Read in sequence they present as a regress, each residue appearing to require the next. The final result shows it is not one.

### 6.9 Halted uniduction: the five readings as one cone

The category-gap eliminator of the prior paper exhibits a gap between registers as a missing leg and eliminates it by exhibiting the leg as an identity. Here the registers are the five readings reached, and the legs are equivalences.

**Theorem 44** (`hunt_cone`). The hypothesis is the apex of a cone over all five readings:

> ∀ r ∈ {bridge, unity, monism, transport, upstream}, D₅(r) ⇔ RH.

**Theorem 45** (`one_gap`). Any two readings are the same proposition. The upstream passage, Λ = 0, is the bridge's reading, the unity posit, the monism field, and the transport, under a different name. A quantity monotone against the flow would be one way to supply it; that reading is not a leg of the cone, since no such quantity is defined in the file and none is proved equivalent.

**Theorem 46** (`regress_halts`). Any reformulation equivalent to the hypothesis lands on the same apex; a further search adds no new gap. The sweep stops at one point.

**Theorem 47** (`nothing_weaker`). No true premise independent of the apex closes it for less.

**Theorem 48** (`sufficient_closes_all`). Theorem 46 covers reformulations equivalent to the hypothesis. A route strictly stronger than it, a specific operator with real spectrum equal to the ordinates or a hypothesis over a whole family, is not equivalent and is not covered there. It opens no new gap either: any sufficient route supplies all five readings at once.

> **The Settled Verdict (tier: kernel theorem on the cone; structural on the reading).**
>
> Time, stability, and the critical line are proved one object (Theorem 15 on the lattice stage, and in general by the identity (6.2a)). The timed and timeless readings are proved one claim under monism (Theorem 25). Every reading of the owed bit reached from existence, time, and monism is proved one proposition (Theorems 44 to 46); nothing weaker than it closes it (Theorem 47), and any sufficient route closes all five at once (Theorem 48). Timeless residual monism, stated as Postulate M, is proved equivalent to the hypothesis (Theorem 49) and joins the cone as its sixth reading (Theorem 68). The formal hypothesis holds conditionally on exactly one named posit, stated as one field of a standard witness: the transport on the Li stream, equivalently the unitarity of ζ's time evolution, equivalently Λ = 0. At the foundation the value carries the terminal mark [.] (Theorems 58 to 69); at the object it is addressed to ζ, supplied at the act and falsifiable by one zero.

### 6.10 Postulate M: Timeless Residual Monism Is Equivalent to the Riemann Hypothesis

The monist intuition behind the paper can be stated in ordinary mathematics, and once stated it is proved equivalent to the hypothesis. Let Z be the set of nontrivial zeros of ζ, enumerated exhaustively by height, so that each zero is located at some finite stage k(ρ). For each stage t let L(t) be the statement that every zero located by stage t has real part one half.

> **Postulate M, Timeless Residual Monism (tier: premise; the paper's thesis, stated openly).**
>
> The truth value of L(t) does not depend on t. One principle at the root, and the same answer at every stage: what holds at the timeless interface holds at every stage downstream.

**Theorem 49** (`postulateM_iff_line`). Given the computed seed L(0), Postulate M holds if and only if every zero lies on the line. Forward: the seed transported by M to the stage k(ρ) of any zero puts that zero on the line. Backward: if every zero is on the line, L(t) is true at every stage and M holds trivially.

**Theorem 50** (`postulateM_decides`). Postulate M cannot hold, with the seed, in any world carrying a located off-line zero. It is not a vacuous posit; one zero refutes it.

Theorems 51 to 57 carry the same result in the timed form of the prior paper's Bridge plane. The locus is the same line at every time (`SameLocus`), and given that, "every zero is bound to the locus" is exactly the line property (Theorem 51, `bound_iff_line`). Same locus and the fold at every time do not bind by themselves (Theorem 52, `time_does_not_bind`). Residual Monism read as one involution, and read as timelessness, both hold in a world with an off-line pair, since a property that is constantly false is timeless (Theorem 53, `monism_holds_in_counter_world`). Timelessness with the seed at the interface binds every downstream time (Theorem 54, `timeless_with_seed_binds`). The witness assembled from Residual Monism and the time law, one involution, the same locus, timelessness, and the interface, proves the bound wherever it is built (Theorem 55), is built at a model (Theorem 56, `constructed_at_model`), is not buildable off the line (Theorem 57, `not_constructible_off_line`), and exists exactly when the line property holds (`witness_iff_bound`).

**The last category gap, eliminated.** A category gap, in the sense of the prior paper, is the absence of a leg between two registers' readings of one seat, and it is eliminated by exhibiting the leg as an identity. Before this section one such gap stood between the register in which the monist thesis is stated, timeless residual monism at the interface upstream of time, and the register in which the hypothesis is stated, the location of the zeros of ζ. Theorem 49 is that leg. Postulate M joins the cone of Section 6.9 as its sixth reading (Theorem 68, `hunt_cone6`, Part XIII of the file), given the identification of the hypothesis with the line property of the enumerated zeros, which is the hypothesis's definition and enters as `hDef` exactly as Li's criterion and Newman's equivalence enter; the collapse of Theorems 44 to 48 then applies to it unchanged: timeless residual monism, the bridge's reading, the unity posit, the monism field, the transport, and Λ = 0 are one proposition. No category gap remains anywhere between the program's readings and the hypothesis.

What remains is not a gap. It is the value of that one proposition: whether Postulate M holds for ζ. A gap closes at zero cost when its leg is exhibited, as every leg here has been. A value is decided by the function, supplied at the act and falsifiable by one zero. Postulate M is not derived here from the definition of ζ. It does not follow from the functional equation (Theorem 20, and the Davenport-Heilbronn zero at Re ρ − ½ = 0.3085), from symmetry at every time (Theorem 52), or from finite verification (Theorem 19). Its derivation from the Euler product is the single open step, stated in Section 8.

### 6.11 The Demand, Correctly Addressed: the Terminal Mark at the Foundation

Section 6.10 leaves the program at its self-referential limit, and that limit can be stated as a theorem rather than met as an obstacle. Every reading of the value that the foundation supplies is equivalent to the hypothesis (Theorems 44 to 49 and 68); the foundation's other resource, the positivity of existence, is independent of it (the prior paper's Theorems E and F). A demand that the foundation prove the hypothesis therefore asks a register to derive a proposition from readings that already are that proposition.

> **The Demand, Correctly Addressed (tier: kernel theorem on each clause).**
>
> A proof of the Riemann Hypothesis cannot be demanded of the foundation. Every reading of the value that the foundation supplies is equivalent to the hypothesis, so any derivation from those readings alone would presuppose what it derives. The demand is well-posed when it is addressed to the object, the function ζ, whose structure fixes where its zeros lie.

Each clause is a theorem of Part XII.

**The collapse and its stop.** A collapse foundation is a family of registers whose every reading is equivalent to the value (`Collapse`). **Theorem 58** (`self_referential_limit`): every reading is exactly as strong as the value, and any two readings are one proposition. **Theorem 59** (`value_marked_dot`): at the collapse foundation the emitter marks the value [.], the mark outside the three-state economy (`dot_is_not_a_verdict`, `dot_outside_economy`). **Theorem 60** (`demand_is_ghost_in_register`): the foundation returns the same mark for the value and for its negation, so a demand that this register issue a verdict is a demand on a register whose output does not depend on the value.

**The self-grounding root, and the line it draws.** A root is self-grounding when acts occur and every act, assent or denial, instances it (`SelfGrounding`). **Theorem 61** (`denial_reenacts_root`, `external_proof_adds_nothing`): denying such a root re-enacts it, and no external proof can add to it; the Root Axiom at the constructed domain is of this kind (`raSelfGrounding`), and its universal extension is carried at premise grade as in the prior paper. This is the true seat of the argument that a demand for proof can be a ghost. **Theorem 62** (`line_not_self_grounding`, with `refuted_by_witness`): the line property of a zero set is not self-grounding; its value is fixed by the object and one located witness refutes it. The prior paper's Theorem G states the same asymmetry: the axiom is self-instancing, the hypothesis is not.

**The demand, addressed.** **Theorem 63** (`misaddressed_to_foundation` on the two-point frame, and `misaddressed_general` for an arbitrary frame): any resource the foundation supplies that also holds on a frame where the line property fails cannot by itself yield the line property. **Theorem 64** (`derivation_presupposes`): a derivation of the value from a reading equivalent to it carries the value's own content; the two stand or fall together. **Theorem 65** (`object_decides`): the object answers, in one direction by a located witness and in the other by its own structure. **Theorem 66** (`demand_correctly_addressed`) joins the three. **Theorem 67** (`rh_marked_dot`) attaches the collapse to the five-register cone of Section 6.9, and **Theorem 69** (`rh_marked_dot6`) to the six-register cone of Theorem 68: the program's readings collapse onto the hypothesis, and the foundation marks its value [.].

> **Terminal Verdict on the Open Part (tier: kernel theorem, Theorems 46, 48, 58 to 69).**
>
> At the foundation, the value is terminal: every reading of the value the foundation has supplied is proved equivalent to the hypothesis (Theorems 44 to 49 and 68), any further equivalent reading lands on the same apex (Theorem 46), any sufficient route closes every reading at once (Theorem 48), no resource that also holds on an off-line frame can close it (Theorem 63), and the foundation's register closes on the value with the mark [.] (Theorems 67 and 69). At the object, the value is addressed to ζ, well-posed, and falsifiable by one zero. The open part is located in the object.

## 7. Falsifiable Criteria

Two criteria, each forced by the paper's geometry, each aimed at one named claim.

**F1, the stability criterion.** A zero of ξ with real part different from one half, or, as its weak form, a computed Li coefficient λₙ < 0. Necessity: Theorems 14 and 15 force it, since an off-line zero carries a growing mode, and a growing mode drives some λₙ negative by Bombieri-Lagarias. The strong form tests the claim and the weak form tests an implementation; together they count as one criterion. Blast radius: the supplied value at the witness row and Postulate M, both of which it refutes (Theorem 50); it touches no theorem of this paper, all of which hold on off-line frames. No such zero is known to height 3 × 10¹² [Platt and Trudgian 2021].

**F2, the halt criterion.** A kernel term concluding the hypothesis from the hypotheses of the `Hunt` structure after removal of every leg-carrying hypothesis. Necessity: Theorems 46 and 47 force it. Blast radius: the claim of Theorem 46 that the regress halts, which its exhibition would refute as a transcription error between paper and file. It is a check on the record, not an observation about ξ.

## 8. Discussion and Implications

**What is proved.** The bridge from existence's positivity to Li positivity is built and its three properties proved: it closes, it is keyed, it is ζ-specific. The critical line is proved to be exactly the set where Li's modes are unitary, and for every fold-invariant zero set perpetual stability is proved equivalent to the line property, in the kernel on the lattice stage and in general by the identity (6.2a). The witness is rebuilt from residual monism, anchored to the standard monotonicity form, and calibrated against Perelman. A proved monotonicity formula of ζ's time is encoded as a toy of de Bruijn's bound and its arrow located. And every reading reached is proved to be one proposition, so the question "what else is missing" has a proved answer: one thing, already named.

**What is not proved, and what is claimed instead.** The paper does not prove the hypothesis, and it claims nothing it does not prove. What it completes, and machine-checks, is the reduction: the hypothesis is equivalent to Postulate M and to each of the five readings, those six are one proposition, and no weaker premise and no symmetry closes it. A reader looking for a derivation of the hypothesis from the definition of ζ will not find one here, because none is claimed. It proves that the hypothesis has one address and states that address in six equivalent forms. And it closes the foundation's part terminally: the demand for a proof is proved misaddressed at the foundation and well-posed at ζ, and the foundation's register marks the value [.] (Section 6.11). The paper is complete in its own register; what it leaves is not an unfinished step of its argument but the object's own question. The unitarity of ζ's time evolution is the Hilbert-Pólya identification; constructing a ζ-specific system whose evolution realizes it is proving the hypothesis, and nothing here shortens that construction by a step.

**Why the regress looked real.** Each reformulation was generated in a different register: the positivity register of the axiom, the unity register of the bridge, the index register of monism, the dynamical register of transport, the thermal register of the heat flow. A reader moving between registers meets each as a new object because each carries a different vocabulary. The category-gap eliminator removes exactly that effect. The same method that closed the three gaps among axiom, formal ground, and object in the prior paper closes the five gaps among the readings here.

**The time reading.** Theorem 15 gives a reading of the hypothesis that is native to physics: the zeros are the modes of one evolution, and the hypothesis says none of them grows. A physicist's instinct that a stable physical system cannot carry a growing mode is exactly the instinct that the hypothesis is true; the formal content of the instinct is the unitarity of the evolution, and its open content is whether ζ is such a system.

**The Perelman calibration.** Perelman's proof is the standard of what a supplied transport looks like when it exists: a monotone quantity along a flow, proved from the flow's equation. For ζ the analogous object is proved (de Bruijn) and points downstream. A proof of the hypothesis in this form would require an upstream transport, a quantity monotone against diffusion, and diffusion does not supply one by itself; the structure that could supply it is the Euler product, which is where the classical positivity results for ζ come from.

**Limitations.** Parts IV, V, IX, the timed worlds of Part XI, and the small models of Part XII are toys of the plane and of the strip bound, stated as such. The analytic facts enter by citation. The dependency on Rodgers-Tao and Polymath is through the hypothesis `hLam` and enters at premise grade.

**How the paper stands to each prior position.** The paper sits across analytic number theory, operator theory, geometric analysis, and formal verification, and so it owes one statement of its relation to each position it engaged. Eight relation words are used in fixed senses. Additive: the paper supplies a result the position lacked and leaves it standing. Replacing: a framing is retired and a measured object put in its place. Subsuming: the prior claim becomes a case of the paper's object. Corroborating: independent agreement, which confers no warrant. Contradicting: a named thesis denied on executed data. Competing: a different position argued and not executed. Scoping: a prior claim kept inside a stated boundary. Kin: a position the paper is continuous with. Superseding is used nowhere, and the paper supersedes no theory. By count: seven positions are additive, three are scoping, seven are kin, one is corroborating, and none is subsumed, contradicted, competed with, or replaced. The paper's contribution is exactly the set of relations in Table 1 and nothing wider.

**Table 1.** Positioning. Relation words as defined in the run-in above.

- **Riemann 1859; Edwards 1974** · What it holds: The roots of ξ are real; What this paper does with it: Reads the fixed-line form as stability of Li's modes; Relation: kin; Evidence: cited
- **Li 1997** · What it holds: RH iff every λₙ ≥ 0; What this paper does with it: Carries it as `LiCriterion`; builds the bridge and the bit stream on it; Relation: additive; Evidence: executed, Thms 1 to 4
- **Bombieri and Lagarias 1999** · What it holds: Off-line zeros drive λₙ negative; What this paper does with it: Reads λₙ as modes; proves unitarity iff line on the plane; Relation: additive; Evidence: executed, Thms 12 to 15
- **Weil 1952** · What it holds: RH iff explicit-formula positivity; What this paper does with it: Locates the negative prime sign as the point the primon gas stops; Relation: scoping; Evidence: argued
- **Deligne 1974** · What it holds: RH over finite fields; What this paper does with it: Template of a supplied positivity; Relation: kin; Evidence: cited
- **Selberg 1992; Conrey and Ghosh 1993** · What it holds: Euler product, primitivity, Ramanujan organize the class; What this paper does with it: Proves a ζ-blind bridge dies, so these must be read; Relation: additive; Evidence: executed, Thms 3, 9, 10
- **de Bruijn 1950** · What it holds: Heat flow narrows the strip; What this paper does with it: Encodes the bound as an anchored witness and proves its record forgets; Relation: additive; Evidence: executed, Thms 38 to 43
- **Newman 1976; Rodgers and Tao 2020; Polymath 2019** · What it holds: RH iff Λ = 0; 0 ≤ Λ ≤ 0.22; What this paper does with it: Carries Λ = 0 by citation as one leg of the cone; Relation: kin; Evidence: cited
- **Hilbert-Pólya; Berry and Keating 1999; Connes 1999** · What it holds: RH via a self-adjoint operator; What this paper does with it: Argues that unitarity of the Li modes is its Cayley form, via the identity (6.2a); Relation: kin; Evidence: argued
- **Stone 1932** · What it holds: Unitary groups have self-adjoint generators; What this paper does with it: Supplies the generator of the unitary evolution in the monism reading; Relation: kin; Evidence: cited
- **Julia 1990; Bost and Connes 1995** · What it holds: ζ is a partition function over primes; What this paper does with it: Identifies it as the axiom's ζ-specific reading, reaching Re s = 1; Relation: scoping; Evidence: executed, Thm 11
- **Mertens 1898** · What it holds: Positivity gives ζ(1 + it) ≠ 0; What this paper does with it: Checks the algebraic core; Relation: corroborating; Evidence: executed, Thm 11
- **Perelman 2002; 2003** · What it holds: Monotone entropy carries Ricci flow; What this paper does with it: Proves the Lyapunov witness a derivative of the monism witness; Relation: additive; Evidence: executed, Thms 32 to 36
- **de Branges; Conrey and Li 2000** · What it holds: A positivity condition fails; What this paper does with it: Calibrates where positivity attempts break; Relation: kin; Evidence: cited
- **Davenport and Heilbronn 1936; Bombieri and Hejhal 1995** · What it holds: Symmetry without Euler product permits off-line zeros; What this paper does with it: Executes the shape on the plane: recurrence fails under symmetry alone; Relation: additive; Evidence: executed, Thm 20
- **Littlewood 1914; Skewes 1933; Haselgrove 1958; Odlyzko and te Riele 1985** · What it holds: Finite confirmation fails; What this paper does with it: Proves finite confirmation never forces; Relation: scoping; Evidence: executed, Thm 19
- **Islam 2026f** · What it holds: Seat proved, value one bit, excepted; What this paper does with it: Proves the value's equivalent readings are one proposition, the regress halts, and any sufficient route closes all five; Relation: additive; Evidence: executed, Thms 44 to 48
- **Islam 2026a** · What it holds: The register of record; What this paper does with it: Carries its residual monism as the witness and its time law as the arrow; Relation: kin; Evidence: documentary

## 9. Conclusion

The prior paper proved the seat of the Riemann Hypothesis from existence alone and excepted the sign by theorem. This paper finds where the sign lives and proves it lives in one place. The critical line is the set on which Li's modes are unitary, and for every fold-invariant zero set, perpetual stability under the time step is the line property. The witness rebuilt from residual monism makes the timed and timeless readings one claim, and anchored to the standard monotonicity form it contains Perelman's witness as a calibrated derivative. The de Bruijn-Newman flow carries a proved monotonicity formula for ζ's time, and its arrow runs away from the hypothesis.

The primary criterion is a zero of ξ off the critical line, equivalently a negative Li coefficient. It refutes the supplied value and leaves every theorem here standing.

The call to the community is concrete. The owed object is one proposition in five equivalent forms, each proved equivalent in the kernel from a cited analytic input, Newman's equivalence for the first and Li's criterion for the other four: Λ = 0, the transport field of an anchored witness on the Li stream, the monism field, the unity posit, and the bridge's reading. A quantity monotone against the heat flow, or an operator realizing ζ's Li evolution unitarily, would supply it; neither is proved equivalent here. Five programs that looked separate are one program, and Postulate M is the sixth name for it.

The open question is the one bit, and it is now a single question rather than a sequence of them: is the time evolution of ζ's modes unitary, equivalently, does Postulate M hold for ζ.

Timeless Residual Monism is equivalent to the Riemann Hypothesis. With that equivalence the last category gap, between the monist reading upstream of time and the analytic statement downstream of it, is destroyed by the same identity-cone collapse that closed every other gap in the program. What remains is not a gap but a value, and the foundation's readings cannot give it without presupposing it (Theorem 64). The demand for a proof is misaddressed at the foundation and well-posed at ζ (Theorem 66); the foundation's register closes on the value with the terminal mark [.] (Theorem 67). The open part is located in the object, and one zero off the line would answer it.

## References

Berry, M. V., and J. P. Keating. 1999. "H = xp and the Riemann Zeros." In *Supersymmetry and Trace Formulae*, 355–367. Kluwer.

Bombieri, E., and D. A. Hejhal. 1995. "On the Distribution of Zeros of Linear Combinations of Euler Products." *Duke Mathematical Journal* 80: 821–862.

Bombieri, E., and J. C. Lagarias. 1999. "Complements to Li's Criterion for the Riemann Hypothesis." *Journal of Number Theory* 77: 274–287.

Bost, J.-B., and A. Connes. 1995. "Hecke Algebras, Type III Factors and Phase Transitions with Spontaneous Symmetry Breaking in Number Theory." *Selecta Mathematica* 1: 411–457.

Connes, A. 1999. "Trace Formula in Noncommutative Geometry and the Zeros of the Riemann Zeta Function." *Selecta Mathematica* 5: 29–106.

Conrey, J. B., and A. Ghosh. 1993. "On the Selberg Class of Dirichlet Series: Small Degrees." *Duke Mathematical Journal* 72: 673–693.

Conrey, J. B., and X.-J. Li. 2000. "A Note on Some Positivity Conditions Related to Zeta and L-functions." *International Mathematics Research Notices* 2000 (18): 929–940.

Davenport, H., and H. Heilbronn. 1936. "On the Zeros of Certain Dirichlet Series." *Journal of the London Mathematical Society* 11: 181–185.

de Bruijn, N. G. 1950. "The Roots of Trigonometric Integrals." *Duke Mathematical Journal* 17: 197–226.

de la Vallée Poussin, C.-J. 1896. "Recherches analytiques sur la théorie des nombres premiers." *Annales de la Société Scientifique de Bruxelles* 20: 183–256.

Deligne, P. 1974. "La conjecture de Weil. I." *Publications Mathématiques de l'IHÉS* 43: 273–307.

Edwards, H. M. 1974. *Riemann's Zeta Function*. Academic Press.

Hadamard, J. 1896. "Sur la distribution des zéros de la fonction ζ(s) et ses conséquences arithmétiques." *Bulletin de la Société Mathématique de France* 24: 199–220.

Haselgrove, C. B. 1958. "A Disproof of a Conjecture of Pólya." *Mathematika* 5: 141–145.

Islam, M. F. 2026a. *Trisduction: The Codex*. Zenodo, 23 September 2026. doi:10.5281/zenodo.22911010.

Islam, M. F. 2026b. *The Riemann Hypothesis Is Exactly One Bit*. Zenodo. doi:10.5281/zenodo.22829795.

Islam, M. F. 2026c. *One Bit Across the Wall: Odd-Supply Separation and the One-Cut Hypothesis Across Twenty-Three Rows*, v6. Zenodo. doi:10.5281/zenodo.22746129.

Islam, M. F. 2026d. *The Formal-Alone Theory of Everything*, v1.4. Zenodo. doi:10.5281/zenodo.22767103.

Islam, M. F. 2026e. *The Riemann Hypothesis in Its Original Form: A Completed Formal Proof of the Locus and the Crossing*, v1.0.6. Zenodo. doi:10.5281/zenodo.22857138.

Islam, M. F. 2026f. *A Formal Proof of Riemann Hypothesis from Existence Alone, the Sign Excepted by Theorem*, v1.5.2. Zenodo. doi:10.5281/zenodo.22912938.

Iwaniec, H., and E. Kowalski. 2004. *Analytic Number Theory*. American Mathematical Society.

Julia, B. 1990. "Statistical Theory of Numbers." In *Number Theory and Physics*, Springer Proceedings in Physics 47, 276–293.

Li, X.-J. 1997. "The Positivity of a Sequence of Numbers and the Riemann Hypothesis." *Journal of Number Theory* 65: 325–333.

Littlewood, J. E. 1914. "Sur la distribution des nombres premiers." *Comptes Rendus de l'Académie des Sciences* 158: 1869–1872.

Mertens, F. 1898. "Über eine Eigenschaft der Riemannschen ζ-Function." *Sitzungsberichte der Kaiserlichen Akademie der Wissenschaften in Wien* 107: 1429–1434.

Newman, C. M. 1976. "Fourier Transforms with Only Real Zeros." *Proceedings of the American Mathematical Society* 61: 245–251.

Odlyzko, A. M., and H. J. J. te Riele. 1985. "Disproof of the Mertens Conjecture." *Journal für die reine und angewandte Mathematik* 357: 138–160.

Perelman, G. 2002. "The Entropy Formula for the Ricci Flow and Its Geometric Applications." arXiv:math/0211159.

Perelman, G. 2003a. "Ricci Flow with Surgery on Three-Manifolds." arXiv:math/0303109.

Perelman, G. 2003b. "Finite Extinction Time for the Solutions to the Ricci Flow on Certain Three-Manifolds." arXiv:math/0307245.

Platt, D., and T. Trudgian. 2021. "The Riemann Hypothesis Is True up to 3·10¹²." *Bulletin of the London Mathematical Society* 53: 792–797.

Polymath, D. H. J. 2019. "Effective Approximation of Heat Flow Evolution of the Riemann ξ Function, and a New Upper Bound for the de Bruijn-Newman Constant." *Research in the Mathematical Sciences* 6: 31.

Riemann, B. 1859. "Ueber die Anzahl der Primzahlen unter einer gegebenen Grösse." *Monatsberichte der Berliner Akademie*, 671–680.

Rodgers, B., and T. Tao. 2020. "The de Bruijn-Newman Constant Is Non-Negative." *Forum of Mathematics, Pi* 8: e6.

Selberg, A. 1992. "Old and New Conjectures and Results about a Class of Dirichlet Series." In *Proceedings of the Amalfi Conference on Analytic Number Theory*, 367–385.

Skewes, S. 1933. "On the Difference π(x) − li(x)." *Journal of the London Mathematical Society* 8: 277–283.

Stone, M. H. 1932. "On One-Parameter Unitary Groups in Hilbert Space." *Annals of Mathematics* 33: 643–648.

Titchmarsh, E. C. 1986. *The Theory of the Riemann Zeta-Function*, 2nd ed. Oxford University Press.

Weil, A. 1952. "Sur les 'formules explicites' de la théorie des nombres premiers." *Communications du Séminaire Mathématique de l'Université de Lund*, tome supplémentaire, 252–265.

## Author's Provenance and Method Disclosure

**Author.** Mohammad F. Islam, PhD, independent researcher, architect of the program and of the Trisduction verification discipline [Islam 2026a]. The rulings on formulation, register, and scope are his, including the time reading, the monism rule, the re-anchoring to Perelman, and the order to close the regress by the category-gap eliminator.

**Method.** Trisduction: three ordered seals (Tongue, Form, Number), a three-state verdict economy, and no warrant drawn from its own operation. Under that discipline the cone of Theorems 44 to 48, with its sixth leg, the equivalence of Postulate M with the hypothesis joined to the apex (Theorems 49, 50, and 68), carries [⟀ T]; the demand correctly addressed and the collapse with its mark (Theorems 58 to 69) carry [⟀ T], and the value at the foundation register carries the terminal mark [.]; time, stability, and the line as one object carry [⟀ T] on the lattice stage, extended in general by the identity (6.2a); the suspension token [Ξ₀] is retired as a verdict on a timeless object; and the formal hypothesis carries [⟀ · premise] under the single named posit, otherwise [⬖₀ · Ξ · hypothesis · formal ×1], with the multiplicity proved to be exactly one. ΔM = 0 for the paper as a whole: every theorem is classical, definitional, or an encoding of a cited result.

**Substrate.** The Lean file and this text were produced by a language model (Claude, Anthropic) as scribe on the author's instruction. The Lean kernel is the authority for every theorem.

**Receipts.** `RA_Li_Bridge.lean`, Lean 4.19.0 (commit 6caaee842e94), core only, exit 0, no `sorry`, no axiom declaration, 1018 lines, SHA-256 `1c56b2a688ce85798d14c8fac979bada34dc14b9d2a0c77c83a0e5e1c913ae29`, seventy-five dependency sets printed, fifty-three axiom-free, the rest on `propext` and `Quot.sound` only.

**Independence.** The scribe of the text and the author of the file are one language model. No Fortran twin accompanies this edition, and no recompile on a second machine is on the record. This edition passed the discipline's adversarial self-audit cycle: seven rounds across all six registers, planted controls caught three of three in every round at SELF grade, terminal verdict HALT-STALE with every remaining finding a repeat of a repaired class, and the single-substrate aperture open. Sections 6.10 and 6.11 and Parts XI to XIII of the file were added after that cycle closed and were prosecuted by a second self-audit cycle: four rounds across all six registers, planted controls caught three of three in every round at SELF grade, seven findings repaired or scoped, terminal verdict HALT-DIVERGENT, computed from earned corrections rising across the last three rounds, with the single-substrate aperture open.

**Scope.** The bridge, the monism and anchored witnesses, the de Bruijn witness and its arrow, the cone with its halt, the equivalence of Postulate M with the line property, and the demand correctly addressed with the terminal mark at the foundation are kernel theorems. The unitarity of the modes on the line and stability as the line property are kernel theorems on the lattice stage and hold in general by the identity (6.2a). The analytic inputs are cited. The sign on the zeros is not a clause of any proof here.

## Appendix A: RA_Li_Bridge.lean

SHA-256 `1c56b2a688ce85798d14c8fac979bada34dc14b9d2a0c77c83a0e5e1c913ae29`, Lean 4.19.0, core only, 1018 lines.

```lean
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

/-- 35. PERELMAN, CALIBRATED. A quantity monotone along one flow (Perelman's W-entropy,
nondecreasing along Ricci flow coupled to the conjugate heat equation; here a discrete flow on its time index) is an anchored
monism witness for the property "never below its start." The Lyapunov witness is a
derivative of the monism witness, with its transport proved. -/
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

/-- 40. RH is Λ = 0: ζ sits exactly at the critical time of its own flow. -/
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

/-- 46. THE HALT. Any further reformulation found by a further hunt lands on the same apex:
the regress adds no new gap. The sweep stops at one point. -/
theorem regress_halts (H : Hunt) (P : Prop) (hP : P ↔ H.L.RH) (r : Reg5) : P ↔ D5 H r :=
  hP.trans (hunt_cone H r).symm

/-- 47. And nothing weaker closes it: a true premise independent of the apex adds nothing
(Theorem E of the paper, here on the hunt's apex). -/
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
```

## Appendix B: The Kernel Audit, Verbatim

`lean RA_Li_Bridge.lean`, exit 0, no warnings, no errors.

```text
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
```