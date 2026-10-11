# Least Erasure from Degrees of Freedom and Heat
## The Vacuum Witness of Irreversible Discard

Mohammad F. Islam, PhD — Independent Researcher · islamm@alumni.iu.edu

Version 2.1.0 — 11 October 2026 — Axiom-free, sorry-free, posit-free formal binding, repaired to compile in core Lean 4.19.0; the finite-sensitivity companion added; the two grades of the vacuum witness kept apart

## Abstract

A degree of freedom is a binary distinction a physical system can carry relative to a record. An irreversible discarding process is a many-to-one map that forgets one such distinction. Relative to the image of the map the forgotten label remains free. We build from first principles a counting model System = {distinct, free, total} with invariant total = distinct * 2^free. A reversible recoding halves distinct and increments free, preserving total. An irreversible erasure decrements free, halves total, and by joint conservation of probability and the second law ΔS_sys + ΔS_bath ≥ 0 forces bath entropy increase ≥ ln 2 per bit, i.e. heat ≥ k_B T ln 2 in the slow limit. Laboratory saturations (Bérut et al. 2012; Jun et al. 2014) anchor the bound. After cosmic microwave background, cosmological constant, and standard radiative corrections are subtracted, the residual heat flux of the vacuum is consistent with zero at present sensitivity. For density, rate, heat > 0, residual = density * rate * heat > 0. Hence an exactly null residual forces zero density of any active, unaccounted erasing population (null_forces_zero), and a residual bounded by ε at finite sensitivity bounds that density, density · r₀ · q₀ ≤ ε for rate ≥ r₀ and heat ≥ q₀ (density_bound_from_residual_bound), without emptying it. The two cases are kept apart: a measurement consistent with zero is the second. Modes carrying the discarded label are absent at exact null, and bounded in number by the sensitivity otherwise. That is physical least erasure, at the grade of the measurement. The same null measurement fixes the boundary: the heat bound operates only where erasure runs. Noether’s theorem, derived from continuous symmetry of the action, recovers conserved quantities that label degrees of freedom; its fixed sets are sectors where no corresponding discard runs. The construction contains Landauer as T = 2.725 K, single-bit special case. The Lean 4 kernel below has no import, no axiom, no sorry, compiles in core Lean 4.19.0, and seals seven claims as one conjunction: the six of the earlier editions and the finite-sensitivity companion. The kernel of v2.0.1 did not compile in core Lean, and the repair is recorded in the appendix.

## Definition — Least Erasure, physical and mathematical, kept apart

**Physical least erasure** is the zero density of every labelled population on which an active, unaccounted discarding process runs in the measured vacuum with heat not already accounted. An exactly null measurement enforces that zero; a measurement bounded at finite sensitivity enforces a bound on the density and not its vanishing. Measurements enforce nothing for labels on which no such process runs. The absence of modes carrying the discarded label is the physical content.

**Mathematical least erasure**, in the companion paper on the Riemann Hypothesis, is a fixed-point proposition on a chart: the registration fixes every point of a configuration. It is not defined as physical least erasure, and this paper does not identify the two. The identification is the bridge of that paper's Section 9.9, six named arrows composed by theorem into a uniform threshold, each arrow a hypothesis a reader grants or refuses; a shared name grants none of them. This paper supplies the counting model and the two cases of the heat theorem that the bridge consumes, and nothing more.

## Historical Development

The connection between information and thermodynamics begins with Maxwell’s demon (1867), an imagined agent that sorts molecules by velocity to produce a temperature difference without apparent work, threatening the second law. Szilard (1929) resolved the paradox by noting that the demon’s measurement itself generates entropy. Brillouin’s negentropy principle further linked information gain to entropy decrease. Von Neumann, in notes around 1949, already associated logical irreversibility of computation with thermal cost. Landauer (1961) crystallized the principle: the erasure of one bit of information, a logically irreversible many-to-one operation, necessarily dissipates at least k_B T ln 2 of heat into the environment. The insight is that information is physical; it is encoded in degrees of freedom of a real system, and forgetting a distinction reduces the phase-space volume available to the system, requiring compensatory entropy export to the bath to preserve the second law. Bennett (1982) later emphasized that measurement can be reversible while erasure cannot, completing the exorcism of the demon. Experimental verification arrived with Bérut et al. (2012), who trapped a colloidal particle in a modulated double-well potential and measured heat dissipation saturating the Landauer bound in the slow-erasure limit, and with Jun et al. (2014), who confirmed the bound to high precision in a feedback trap. Parallel developments in stochastic thermodynamics and fluctuation theorems (Jarzynski, Crooks) have refined the understanding of the minimal work cost of information processing. Noether’s theorem (1918), arising from the invariance of the action under continuous symmetry groups, supplies the converse direction: continuous symmetries yield conserved charges that label the sectors in which no corresponding discard can run. Fixed points of the symmetry (vanishing charge, real blocks under time reversal, translational invariance) are precisely the sectors free of active erasure of the associated label.

## 1. Degree of freedom and discarding process — first principle counting

We start with counting, not thermodynamics. A binary degree of freedom is a distinction between two microstates consistent with one macrostate. Let distinct be the number of macro states distinguished by a record, free be the number of binary labels unresolved relative to that record, total be the number of microstates. Axiom (elementary content of information): total = distinct * 2^free. An irreversible recoding DiscardProcess is: before.distinct = 2 * after.distinct, after.free = before.free + 1, before.total = after.total, before.distinct > after.distinct. Interpretation: record content halves, free doubles, total preserved. It is reversible as recoding, irreversible as forgetting if the which-branch label is lost. Theorem discard_is_free proves after.distinct * 2 = before.distinct and after.free = before.free + 1 directly from the structure, with no extra posit. The proof is rfl after unfolding, sealed in Lean as ⟨h_record, h_free⟩.

For heat cost we need erasure: EraseProcess with before.distinct = after.distinct, before.free = after.free + 1, before.total = 2 * after.total, before.total > after.total. Now total microstates halve: one bit of conditional entropy disappears from the system. System entropy scaled: sysEntropy(s) = s.free * ln2_scaled with ln2_scaled = 693147 representing ln 2 * 10^6. Then sysEntropy_decrease proves sysEntropy after + ln2 = before, i.e. ΔS_sys = −ln2_scaled. This is provable by Nat.add_mul.

## 2. Heat price from joint conservation

Let the system be in contact with a bath at measured temperature T. Joint dynamics conserve probability. Second law for closed system + bath: ΔS_sys + ΔS_bath ≥ 0. With erasure ΔS_sys = −k_B ln 2, we must have ΔS_bath ≥ k_B ln 2. Deposited as heat Q = T ΔS_bath ≥ k_B T ln 2 per bit in the slow, quasi-static limit. Scaled in naturals: ∃ heat, heat ≥ T * ln2_scaled. Proof: choose heat = T * ln2_scaled, then heat ≥ T * ln2_scaled by le_refl. This is the existential witness of the lower bound, not an axiom: the bath can supply at least that. Positivity version heat_positive shows if T > 0 then ∃ heat > 0. No import of thermodynamics beyond the second law and measured T. Laboratory T is the bath T, not CMB T; CMB T = 2.725 K is only a universal reference scale for the Landauer special case, not the bath for laboratory experiments. This fixes the v1.0.1 conflation. The formal kernel records the existence of a number meeting the bound; the physical necessity follows from the joint conservation and second-law inequality stated in the prose.

## 3. Noether’s theorem from continuous symmetry

A continuous symmetry is a family of transformations leaving the equations of motion invariant. Let the action be invariant under an infinitesimal generator ξ. Variation reduces to a total divergence, vanishing on-shell, yielding a conserved Noether current J, ∂·J = 0, charge Q. Formally we abstract: ContinuousSymmetry(ξ) := True as existence of such invariance (in a full model would be action preservation), Conserved(curr) := True as constancy along solutions (the zero function is trivially conserved). Then noether_current proves ∀ ξ, ContinuousSymmetry ξ → ∃ curr, Conserved curr by ⟨0, trivial⟩. In a richer setting curr = Noether charge; here the kernel keeps the minimal provable skeleton to avoid axioms. Fixed sets (Q = 0, real block under time reversal, translational invariance) are sectors where the label is not free: no discard runs there. The theorem does not ground conservation; it recovers it from the symmetry already used in counting.

## 4. Vacuum witness — null residual forces zero

After CMB (Planck 2018), Λ, and standard radiative corrections are subtracted, residual heat flux of the vacuum is consistent with zero at current cosmological and laboratory sensitivity. Define residual(density, rate, heat) = density * rate * heat. Lemma residual_pos: density > 0 ∧ rate > 0 ∧ heat > 0 → residual > 0, proved by Nat.mul_pos twice. Contrapositive null_forces_zero: if rate > 0, heat > 0, residual = 0 → density = 0. Proof by contradiction using pos_of_ne_zero. Interpretation: suppose irreversible erasure runs in the vacuum at positive rate on a labelled population of positive density, with heat not already accounted. Then it would contribute positive residual flux. An exactly null measurement forces density zero. This corrects the v1.0.1 formal statement which proved the converse trivially; the implication direction now matches physics.

**The finite-sensitivity case, added in this edition.** A measurement consistent with zero at present sensitivity is not the statement residual = 0; it is the statement 0 ≤ residual ≤ ε for the ε of the dataset, its window, its background model and its uncertainty treatment. For that case the kernel proves the companion density_bound_from_residual_bound: residual ≤ ε, rate ≥ r₀, heat ≥ q₀ give density · r₀ · q₀ ≤ ε. The bound is stated multiplicatively so that no integer division rounds anything; the quotient form density_le_div, density ≤ ε / (r₀ q₀), is a corollary whose cone carries propext through the core lemma on division and is pinned as it prints. The companion bounds the population and does not empty it. The paper never rewrites a bound as exact zero. To exclude every member of a population from a bound at finite sensitivity one needs, in addition, a uniform positive threshold δ > ε that any member would produce; that threshold is not a theorem of this kernel, it is composed from named hypotheses in the companion paper's Part VII (off_line_zero_forces_observable_signal), and this paper claims no part of it.

**The integer representation.** The kernel counts in naturals, ln 2 scaled by 10⁶ and temperatures in millikelvin. A natural-number encoding establishes nothing about the quantization of a physical flux; the calibrated relation between the encoded quantities and the observable, with its units, its uncertainty and its rounding, belongs to the measurement and is stated there, not here. The claim that residual flux is consistent with zero is an empirical statement at present sensitivity, not a derived theorem; a detection of unaccounted flux above the stated bound would refute the bound, and the attribution of such a flux to an erasing population would be the work of the bridge's arrows, not of this kernel.

## 5. Boundary fixed by same measurements

The heat bound operates only where erasure runs. Define Discards(p, label) := label < p.before.distinct ∧ p.before.distinct > 0. Define NullForcesZeroOn(label) := ∃ p, Discards p label ∧ residual > 0. Theorem boundary_holds: ∀ label, ¬(∃ p, Discards p label) → ¬NullForcesZeroOn label. Proof: NullForcesZeroOn implies ∃ p Discards p label, contradicting the premise. Examples: e⁺e⁻ annihilation produces photons accounted in the EM sector — the which-particle label is erased, price on the books, not unaccounted. Neutrino oscillation probabilities sum to one; a sterile admixture leaking active flavour at continuous positive rate would be an unaccounted discard — null residual forces rate zero. Level repulsion follows Hamiltonian symmetry; a magnetic time-odd term moves the spectrum off real blocks, repulsion linear → quadratic, change is a priced consequence, not an unaccounted vacuum rate. None supplies an unaccounted discarding rate on a hidden vacuum population.

## 6. Subsumption — Landauer as special case

The Landauer bound is EraseProcess with before.free = 1, heat ≥ k_B T ln 2. In Lean, landauer_special_case proves from heat_from_joint_conservation with T = cmb_mK = 2725 (mK representation of 2.725 K) that ∃ heat ≥ cmb_mK * ln2_scaled. Scaling: physical heat = T * k_B ln 2, scaled heat = T_mK * ln2_scaled * k_B / 1e9. Existence is provable. Laboratory measurements saturating the bound confirm the price in the slow limit; they are empirical anchors, not premises.

## 7. Conclusion

From counting distinct * 2^free, through second-law joint conservation, to the measured residual, we obtain physical least erasure at the grade of the measurement: any unaccounted erasure running at positive rate would deposit heat; at exact null its population density is zero, and under a bound ε its population is bounded by ε against the floors of its rate and its heat. The derivation uses no axiom, no sorry, no posit. The Lean kernel seals seven claims as one conjunction the_master_seal, checked by #print axioms to have no axioms, and it compiles in core Lean 4.19.0, which the kernel of v2.0.1 did not. Measurements are the bit, and they enter as what they are: a bound with its uncertainty. A residual unaccounted heat flux above the stated bound, or a laboratory process discarding a bit below k_B T ln 2 in the slow limit, refutes it.

## Falsification Criteria (typed for necessity)

1. Detection of unaccounted residual heat flux in the vacuum (after CMB, Λ, and standard radiative corrections) above the stated bound ε, with its dataset and window named. Geometric necessity: residual_pos, null_forces_zero and density_bound_from_residual_bound.  
2. Laboratory observation of bit erasure in the slow limit dissipating less than k_B T ln 2. Geometric necessity: heat_from_joint_conservation and landauer_special_case.  
3. Construction of a continuous symmetry whose fixed set nevertheless hosts an active discard of the associated label. Geometric necessity: noether_current and boundary_holds.

## 8. What the kernel proves, and what it does not

| Declaration | What it proves | What it does not prove |
|---|---|---|
| discard_is_free | a discard halves the record and frees one label, from the structure's fields | anything about a physical process instantiating the structure |
| sysEntropy_decrease | one scaled ln 2 of system entropy leaves at an erasure | the second law; the bath |
| heat_from_joint_conservation, heat_positive | that a natural number meeting the floor T · ln2_scaled exists; the proof chooses it and does not consult the process | that heat is deposited: the necessity is joint conservation with the second law, carried in the prose at its grade, and the laboratory saturations are its anchors |
| landauer_special_case | the same existence at T = 2.725 K | the bath of any laboratory experiment, whose T is its own |
| residual_pos | positive factors give a positive residual | that the residual observable of any dataset is this product |
| null_forces_zero | exact null with positive rate and heat forces zero population | anything from a bound ε > 0 |
| density_bound_from_residual_bound | a bound ε with floors r₀, q₀ gives density · r₀ · q₀ ≤ ε | that the population is empty |
| boundary_holds | where no erasure runs, no null forces anything | which labels have an erasure running |
| noether_current | a skeleton whose predicates are True | any dynamics, any conserved charge |
| the_master_seal | the conjunction of seven claims, with no axiom | any of the physical statements above; an empty cone names the axioms a proof uses and discharges no hypothesis |

"Axiom-free" in this project means that `#print axioms` on the master seal names no axiom: not propext, not Quot.sound, not Classical.choice, and no declared axiom. It does not mean premise-free. Every physical statement of this paper is a premise or a measurement at its own grade, and the kernel's theorems are the arithmetic those premises consume.

## References

Bérut, A., Arakelyan, A., Petrosyan, A., Ciliberto, S., Dillenschneider, R. & Lutz, E. Experimental verification of Landauer’s principle linking information and thermodynamics. Nature 483, 187–189 (2012).  
Bennett, C. H. The thermodynamics of computation—a review. Int. J. Theor. Phys. 21, 905–940 (1982).  
Brillouin, L. Science and Information Theory. Academic Press (1956).  
Jun, Y., Gavrilov, M. & Bechhoefer, J. High-precision test of Landauer’s principle in a feedback trap. Phys. Rev. Lett. 113, 190601 (2014).  
Landauer, R. Irreversibility and heat generation in the computing process. IBM J. Res. Dev. 5, 183–191 (1961).  
Maxwell, J. C. Letter to P. G. Tait (1867); Theory of Heat (1871).  
Noether, E. Invariante Variationsprobleme. Göttinger Nachr. 235–257 (1918).  
Planck Collaboration. Planck 2018 results. VI. Cosmological parameters. A&A 641, A6 (2020).  
Szilard, L. Über die Entropieverminderung in einem thermodynamischen System bei Eingriffen intelligenter Wesen. Z. Phys. 53, 840–856 (1929).  
von Neumann, J. Notes on the relation between entropy and information (c. 1949).

## Appendix — Formal binding v2.1.0 — axiom-free, sorry-free Lean 4 kernel, compiled

This kernel carries no import, no axiom declaration, no sorry. The master seal is one conjunction of seven claims. Every cited theorem is closed on a constructed domain. The cone is empty by proof, not by placeholder. `#print axioms` shows no axioms for the seal; every pin passes. Physics as measured supply, formal side as counting and the two cases of the residual.

**The repair.** The kernel of v2.0.1 (and of v1.1.0, the same text) did not compile under core Lean 4.19.0: `discard_is_free` closed its first conjunct with `rw` and then supplied only the second to a goal that was still the conjunction, and `null_forces_zero` used `by_contra`, a tactic of Mathlib, which core Lean does not provide. Under Lean 4.19.0 both declarations elaborated with errors and `the_master_seal` depended on `sorryAx`; the claim "#print axioms shows no axioms" was therefore not true of the shipped artifact. The repair proves the first by the anonymous constructor and the second by a case split on the population, and changes no statement. The repaired text is byte-identical to Part VII-a of `RH_Both_Sides_Seed_v2.0.3.lean`, the seed of the companion paper's third edition, where it compiles inside the whole and under its judgment.

**The receipt.** Lean 4.19.0 (x86_64-unknown-linux-gnu, commit 6caaee842e94, Release). `lean Least_Erasure_from_DoF_Heat_v2_1_0.lean`: exit 0, 0.5 s, no error, no warning. sha256 of the kernel file: `ce11b0d415f0c33282d208080d07c6013f0073ecb382b12ffa276ce7e55fe64d`. Source screen on the comment-stripped file: 0 hits for sorry, admit, native_decide, unsafe, implemented_by, extern, #exit, import, axiom. Printed: `'LeastErasureDoF.the_master_seal' does not depend on any axioms`.

```lean
/-
  Least_Erasure_from_DoF_Heat.lean v2.1.0 · 11 October 2026
  Core Lean 4.19.0, standalone: no import, no axiom declared, no sorry, no admit, no native_decide.
  Repaired from v2.0.1, which did not compile in core Lean (by_contra is a Mathlib tactic; discard_is_free left
  one conjunction unsolved), so that its master seal depended on sorryAx. Added: density_bound_from_residual_bound,
  the finite-sensitivity companion of null_forces_zero, and the seventh claim of the master seal.
  This text is byte-identical to Part VII-a of RH_Both_Sides_Seed_v2.0.3.lean.
-/
namespace LeastErasureDoF

def ln2_scaled : Nat := 693147
def scale : Nat := 1000000
def cmb_mK : Nat := 2725

/-- A system relative to a record: macro states distinguished, binary labels free, micro states in total. -/
structure System where
  distinct : Nat
  free : Nat
  total : Nat
  inv : total = distinct * (2 ^ free)

/-- A recoding that halves the record and frees one label, total preserved. -/
structure DiscardProcess where
  before : System
  after : System
  h_distinct : before.distinct = 2 * after.distinct
  h_free : after.free = before.free + 1
  h_total : before.total = after.total
  h_gt : before.distinct > after.distinct

/-- An erasure: the record kept, one free label lost, the total halved. -/
structure EraseProcess where
  before : System
  after : System
  h_distinct : before.distinct = after.distinct
  h_free : before.free = after.free + 1
  h_total : before.total = 2 * after.total
  h_gt : before.total > after.total

/-- A discard halves the record and frees one label. Repaired: the shipped proof left this conjunction open. -/
theorem discard_is_free (p : DiscardProcess) :
    p.after.distinct * 2 = p.before.distinct ∧
    p.after.free = p.before.free + 1 :=
  ⟨by rw [p.h_distinct, Nat.mul_comm], p.h_free⟩

def sysEntropy (s : System) : Nat := s.free * ln2_scaled

theorem sysEntropy_decrease (p : EraseProcess) :
    sysEntropy p.after + ln2_scaled = sysEntropy p.before := by
  unfold sysEntropy
  rw [p.h_free, Nat.succ_mul]

/-- The lower bound is witnessed by the choice heat = T · ln2_scaled. The process is not consulted: the kernel
    records that a number meeting the bound exists, nothing more. The physical necessity, joint conservation of
    probability with the second law, is carried in the prose of the companion paper at its own grade. -/
theorem heat_from_joint_conservation (_p : EraseProcess) (T : Nat) :
    ∃ heat : Nat, heat ≥ T * ln2_scaled :=
  ⟨T * ln2_scaled, Nat.le_refl _⟩

theorem heat_positive (_p : EraseProcess) (T : Nat) (hT : T > 0) :
    ∃ heat : Nat, heat > 0 ∧ heat ≥ T * ln2_scaled :=
  ⟨T * ln2_scaled, Nat.mul_pos hT (by decide), Nat.le_refl _⟩

theorem landauer_special_case (p : EraseProcess) (_h : p.before.free = 1) :
    ∃ heat : Nat, heat ≥ cmb_mK * ln2_scaled :=
  heat_from_joint_conservation p cmb_mK

/-- The residual observable of the counting model: population × rate × heat per event. -/
def residual (density rate heat : Nat) : Nat := density * rate * heat

theorem residual_pos {density rate heat : Nat}
    (hd : density > 0) (hr : rate > 0) (hh : heat > 0) :
    residual density rate heat > 0 := by
  unfold residual
  have h1 : density * rate > 0 := Nat.mul_pos hd hr
  exact Nat.mul_pos h1 hh

/-- THE EXACT-NULL CASE. Residual exactly zero, rate and heat positive: the population is zero. Repaired: the
    shipped proof used by_contra, a Mathlib tactic, and so did not compile in core Lean. -/
theorem null_forces_zero {density rate heat : Nat}
    (hr : rate > 0) (hh : heat > 0) (h0 : residual density rate heat = 0) :
    density = 0 := by
  cases density with
  | zero => rfl
  | succ d =>
    have hpos := residual_pos (Nat.succ_pos d) hr hh
    rw [h0] at hpos
    exact absurd hpos (Nat.lt_irrefl 0)

/-- THE FINITE-SENSITIVITY CASE, the quantitative companion. Residual at most ε, rate at least r₀, heat at
    least q₀: the population times the two floors, ρ · r₀ · q₀, is at most ε. This is what a null result at finite sensitivity
    supports. It is not density = 0, and the paper never rewrites it as density = 0. Stated multiplicatively so
    that no integer division rounds anything: the bound is exact in the kernel's units. -/
theorem density_bound_from_residual_bound {density rate heat r0 q0 ε : Nat}
    (hR : residual density rate heat ≤ ε) (hr : rate ≥ r0) (hq : heat ≥ q0) :
    density * r0 * q0 ≤ ε :=
  Nat.le_trans (Nat.mul_le_mul (Nat.mul_le_mul_left density hr) hq) hR

/-- The same bound read as a quotient, density ≤ ε / (r₀ q₀), for positive floors. Integer division floors, so
    this form is weaker than the multiplicative one; it is the form the Recommendation names. Its cone carries
    propext through the core lemma on division, and is pinned below as such. -/
theorem density_le_div {density rate heat r0 q0 ε : Nat}
    (hR : residual density rate heat ≤ ε) (hr : rate ≥ r0) (hq : heat ≥ q0)
    (hr0 : r0 > 0) (hq0 : q0 > 0) :
    density ≤ ε / (r0 * q0) :=
  (Nat.le_div_iff_mul_le (Nat.mul_pos hr0 hq0)).mpr
    (Nat.mul_assoc density r0 q0 ▸ density_bound_from_residual_bound hR hr hq)

def Discards (p : EraseProcess) (label : Nat) : Prop :=
  label < p.before.distinct ∧ p.before.distinct > 0

def NullForcesZeroOn (label : Nat) : Prop :=
  ∃ p : EraseProcess, Discards p label ∧ residual 1 1 ln2_scaled > 0

theorem boundary_holds :
    ∀ (label : Nat), ¬ (∃ p : EraseProcess, Discards p label) →
      ¬ NullForcesZeroOn label := by
  intro label hNo hYes
  unfold NullForcesZeroOn at hYes
  obtain ⟨p, hp, _⟩ := hYes
  exact hNo ⟨p, hp⟩

/-- The Noether skeleton. Both predicates are True: the kernel keeps only the shape of the statement, a
    symmetry yields a conserved current, and proves nothing about any dynamics. Stated so, not otherwise. -/
def ContinuousSymmetry (_ξ : Nat) : Prop := True
def Conserved (_curr : Nat) : Prop := True

theorem noether_current :
    ∀ (ξ : Nat), ContinuousSymmetry ξ →
      ∃ curr : Nat, Conserved curr :=
  fun _ _ => ⟨0, trivial⟩

/-- THE MASTER SEAL, seven claims: the six of the companion paper and the quantitative companion. -/
theorem the_master_seal :
    (∀ p : DiscardProcess, p.after.distinct * 2 = p.before.distinct ∧ p.after.free = p.before.free + 1) ∧
    (∀ _p : EraseProcess, ∀ T : Nat, ∃ heat : Nat, heat ≥ T * ln2_scaled) ∧
    (∀ p : EraseProcess, p.before.free = 1 → ∃ heat : Nat, heat ≥ cmb_mK * ln2_scaled) ∧
    (∀ density rate heat : Nat, density > 0 → rate > 0 → heat > 0 → residual density rate heat > 0) ∧
    (∀ label : Nat, ¬ (∃ p : EraseProcess, Discards p label) → ¬ NullForcesZeroOn label) ∧
    (∀ ξ : Nat, ContinuousSymmetry ξ → ∃ curr : Nat, Conserved curr) ∧
    (∀ density rate heat r0 q0 ε : Nat, residual density rate heat ≤ ε → rate ≥ r0 → heat ≥ q0 →
      density * r0 * q0 ≤ ε) := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · exact fun p => discard_is_free p
  · exact fun p T => heat_from_joint_conservation p T
  · exact fun p h => landauer_special_case p h
  · exact fun _ _ _ hd hr hh => residual_pos hd hr hh
  · exact fun label => boundary_holds label
  · exact fun ξ h => noether_current ξ h
  · exact fun _ _ _ _ _ _ hR hr hq => density_bound_from_residual_bound hR hr hq

end LeastErasureDoF

/-- info: 'LeastErasureDoF.discard_is_free' does not depend on any axioms -/
#guard_msgs in #print axioms LeastErasureDoF.discard_is_free
/-- info: 'LeastErasureDoF.sysEntropy_decrease' does not depend on any axioms -/
#guard_msgs in #print axioms LeastErasureDoF.sysEntropy_decrease
/-- info: 'LeastErasureDoF.null_forces_zero' does not depend on any axioms -/
#guard_msgs in #print axioms LeastErasureDoF.null_forces_zero
/-- info: 'LeastErasureDoF.density_bound_from_residual_bound' does not depend on any axioms -/
#guard_msgs in #print axioms LeastErasureDoF.density_bound_from_residual_bound
/-- info: 'LeastErasureDoF.density_le_div' depends on axioms: [propext] -/
#guard_msgs in #print axioms LeastErasureDoF.density_le_div
/-- info: 'LeastErasureDoF.boundary_holds' does not depend on any axioms -/
#guard_msgs in #print axioms LeastErasureDoF.boundary_holds
/-- info: 'LeastErasureDoF.the_master_seal' does not depend on any axioms -/
#guard_msgs in #print axioms LeastErasureDoF.the_master_seal

#print axioms LeastErasureDoF.the_master_seal
```

---

*End of the 2.1.0 manuscript. Spine intact. The kernel repaired to compile, the finite-sensitivity companion added, the two grades of the vacuum witness kept apart, the integer representation and the uniform threshold named as what they are. No new mathematics beyond the companion the audit of 10 October 2026 named (ΔM = 0). Measurements remain the bit, as a bound with its uncertainty.*
