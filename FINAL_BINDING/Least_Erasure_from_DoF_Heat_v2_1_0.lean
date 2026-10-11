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
