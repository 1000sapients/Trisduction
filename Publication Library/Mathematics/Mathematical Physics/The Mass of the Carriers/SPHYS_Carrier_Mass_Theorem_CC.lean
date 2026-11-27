/-
SPHYS_Carrier_Mass_Theorem_CC.lean · The Mass of the Carriers as a New Mathematical Theorem. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. What is forced about the mass of a carrier: a kept gauge leaves none; a law that a fold keeps can have its lowest
  states off the line of the fold, in a pair the fold exchanges, with the kept state not lowest; a carrier has a mass term
  exactly when the lowest state carries its charge; the carrier of a charge the lowest state does not carry stays without
  mass; the count of states balances. DESIGN. Part 0 the seat. Part I the mass and the gauge, for any symmetric additive
  form. Part II the law with a fold, over any ordered field. Part III the mass term, in any commutative ring. Part IV the count.
RISK. The value at which the field settles and the strength of the couplings are measured; the file proves the form of
  the mass term and where it vanishes. NON-NEGOTIABLE. No axiom is declared. No proof is left open.
-/
import Mathlib.Algebra.Field.Basic
import Mathlib.Algebra.CharZero.Defs
import Mathlib.Algebra.Order.Field.Rat
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Data.Matrix.Mul
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.GroupTheory.Perm.Sign
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Abel
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NoncommRing
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.LinearCombination
import Mathlib.Data.Matrix.Basis
import Mathlib.Data.Matrix.Notation
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.FreeModule.Finite.Matrix
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas

namespace SPHYS.CarrierMass

/-! ## Part 0. The seat, on any type. Every later part is read on it, and every model of the same subject is an instance. -/

/-- The line of a fold: the points the fold leaves where they are. -/
def OnLine {X : Type*} (σ : X → X) (x : X) : Prop := σ x = x

/-- A reading the fold keeps takes one value on a point and its partner. -/
theorem a_kept_reading_is_one_on_the_pair {X V : Type*} (σ : X → X) (r : X → V)
    (h : ∀ x, r (σ x) = r x) (x : X) : r (σ x) = r x := h x

/-- A reading the fold reverses is zero on the line, where the values have no element of order two. -/
theorem an_odd_reading_is_zero_on_the_line {X V : Type*} [AddGroup V] (h2 : ∀ v : V, v + v = 0 → v = 0)
    (σ : X → X) (r : X → V) (hodd : ∀ x, r (σ x) = - r x) (x : X) (hx : OnLine σ x) : r x = 0 := by
  have h := hodd x
  rw [show σ x = x from hx] at h
  have e : r x + r x = - r x + r x := by rw [← h]
  rw [neg_add_cancel] at e
  exact h2 _ e

/-- Where a reversed reading is not zero, the point is off the line and the reading tells it from its partner. -/
theorem an_odd_reading_off_zero_tells_the_pair {X V : Type*} [AddGroup V] (h2 : ∀ v : V, v + v = 0 → v = 0)
    (σ : X → X) (r : X → V) (hodd : ∀ x, r (σ x) = - r x) (x : X) (hx : r x ≠ 0) :
    ¬ OnLine σ x ∧ r (σ x) ≠ r x := by
  refine ⟨fun h => hx (an_odd_reading_is_zero_on_the_line h2 σ r hodd x h), fun h => hx ?_⟩
  have e : r x + r x = - r x + r x := by rw [← hodd x, h]
  rw [neg_add_cancel] at e
  exact h2 _ e

/-- SUBSUMPTION. Any model carried into the seat by a one-to-one map that respects the folds has its line
exactly over the line of the seat. A model written before this file or after it is an instance. -/
theorem every_model_is_an_instance {X Y : Type*} (σ : X → X) (τ : Y → Y) (φ : Y → X)
    (hφ : Function.Injective φ) (heq : ∀ y, φ (τ y) = σ (φ y)) (y : Y) :
    OnLine τ y ↔ OnLine σ (φ y) := by
  constructor
  · intro h; show σ (φ y) = φ y; rw [← heq, show τ y = y from h]
  · intro h; apply hφ; rw [heq]; exact h

/-- SUBSUMPTION OF READINGS. A reading of the seat, pulled back along such a map, is kept or reversed in
the model exactly as it is on the seat. -/
theorem every_reading_of_the_seat_is_a_reading_of_the_model {X Y V : Type*} (σ : X → X) (τ : Y → Y) (φ : Y → X)
    (heq : ∀ y, φ (τ y) = σ (φ y)) (r : X → V) (s : V → V) (h : ∀ x, r (σ x) = s (r x)) (y : Y) :
    r (φ (τ y)) = s (r (φ y)) := by rw [heq]; exact h _

/-! ## Part I. The mass and the gauge. -/

/-- A MASS IS CHANGED BY A CHANGE OF GAUGE. Let `B` be additive in its first place and symmetric, on any additive group,
let `k` be null, and let some `a₀` not be across `k`. If `m · B(a + k, a + k) = m · B(a, a)` for every `a`, then `m = 0`,
where two is not zero and there are no zero divisors. The carrier of a gauge that is kept has no mass. -/
theorem a_mass_is_changed_by_a_change_of_gauge {V K : Type*} [AddCommGroup V] [CommRing K] [NoZeroDivisors K]
    (h2 : (2 : K) ≠ 0) (B : V → V → K) (hl : ∀ a b c, B (a + b) c = B a c + B b c)
    (hs : ∀ a b, B a b = B b a) (k : V) (hk : B k k = 0) (a₀ : V) (ha₀ : B a₀ k ≠ 0) (m : K)
    (hm : ∀ a, m * B (a + k) (a + k) = m * B a a) : m = 0 := by
  have e : B (a₀ + k) (a₀ + k) = B a₀ a₀ + 2 * B a₀ k := by
    rw [hl, hs (a₀) (a₀ + k), hs k (a₀ + k), hl, hl, hk, hs k a₀]; ring
  have h := hm a₀
  rw [e] at h
  have h3 : m * (2 * B a₀ k) = 0 := by linear_combination h
  rcases mul_eq_zero.1 h3 with h | h
  · exact h
  · rcases mul_eq_zero.1 h with h | h
    · exact absurd h h2
    · exact absurd h ha₀

/-! ## Part II. A law with a fold, over any ordered field. The fold reverses the field `φ`; the law is
`V φ = (φ² − v²)²`. -/

section Law
variable {K : Type*} [Field K] [LinearOrder K] [IsStrictOrderedRing K]

def V (v φ : K) : K := (φ ^ 2 - v ^ 2) ^ 2

omit [LinearOrder K] [IsStrictOrderedRing K] in
/-- THE LAW IS KEPT BY THE FOLD. -/
theorem the_law_is_kept_by_the_fold (v φ : K) : V v (-φ) = V v φ := by simp only [V]; ring

/-- The law is nowhere below zero. -/
theorem the_law_is_nowhere_below_zero (v φ : K) : 0 ≤ V v φ := sq_nonneg _

/-- THE LOWEST STATES ARE A PAIR. The law is zero exactly at `v` and at `−v`. -/
theorem the_lowest_states_are_a_pair (v φ : K) : V v φ = 0 ↔ φ = v ∨ φ = -v := by
  simp only [V]
  constructor
  · intro h
    have h1 : (φ ^ 2 - v ^ 2) * (φ ^ 2 - v ^ 2) = 0 := by linear_combination h
    have h2 : (φ - v) * (φ + v) = 0 := by linear_combination mul_self_eq_zero.1 h1
    rcases mul_eq_zero.1 h2 with h | h
    · left; linear_combination h
    · right; linear_combination h
  · rintro (rfl | rfl) <;> ring

/-- THE SPENT BIT. Where `v` is not zero: the two lowest states are two; the fold exchanges them; neither is kept by the
fold; and the one state the fold keeps is not lowest. -/
theorem the_spent_bit (v : K) (hv : v ≠ 0) :
    v ≠ -v ∧ V v v = 0 ∧ V v (-v) = 0 ∧ ¬ OnLine (fun φ : K => -φ) v ∧ 0 < V v 0 := by
  have hvv : v ≠ -v := by
    intro h
    have : 2 * v = 0 := by linear_combination h
    rcases mul_eq_zero.1 this with h | h
    · exact two_ne_zero h
    · exact hv h
  refine ⟨hvv, (the_lowest_states_are_a_pair v v).2 (Or.inl rfl), (the_lowest_states_are_a_pair v (-v)).2 (Or.inr rfl),
    fun h => hvv (Eq.symm h), ?_⟩
  have h0 : V v 0 ≠ 0 := by
    intro h
    rcases (the_lowest_states_are_a_pair v 0).1 h with h | h
    · exact hv h.symm
    · exact hv (by linear_combination h)
  exact lt_of_le_of_ne (the_law_is_nowhere_below_zero v 0) (Ne.symm h0)

/-- WITH NO SETTLED VALUE NOTHING IS SPENT. Where `v` is zero the lowest state is one, and the fold keeps it. -/
theorem with_no_settled_value_nothing_is_spent (φ : K) : V 0 φ = 0 ↔ φ = 0 := by
  rw [the_lowest_states_are_a_pair]; simp

end Law

/-! ## Part III. The mass term, in any commutative ring. A carrier of strength `g` reads the charge `q` of the field; with
the field at `v + h` its term is `(g q (v + h))²`. -/

section Term
variable {R : Type*} [CommRing R]

/-- The term, written out: a mass term, a coupling to one `h` and a coupling to two. -/
theorem the_term_written_out (g q v h : R) :
    (g * q * (v + h)) ^ 2 = (g * q * v) ^ 2 + 2 * (g * q) ^ 2 * v * h + (g * q) ^ 2 * h ^ 2 := by ring

/-- A CARRIER HAS A MASS EXACTLY WHEN THE LOWEST STATE CARRIES ITS CHARGE. Where there are no zero divisors, the mass term
is not zero exactly when the strength, the charge and the settled value are each not zero. -/
theorem a_mass_exactly_when_the_lowest_state_carries_the_charge [NoZeroDivisors R] (g q v : R) :
    (g * q * v) ^ 2 ≠ 0 ↔ g ≠ 0 ∧ q ≠ 0 ∧ v ≠ 0 := by
  rw [Ne, sq, mul_self_eq_zero, mul_eq_zero, mul_eq_zero]
  constructor
  · intro h
    exact ⟨fun a => h (Or.inl (Or.inl a)), fun a => h (Or.inl (Or.inr a)), fun a => h (Or.inr a)⟩
  · rintro ⟨h1, h2, h3⟩ ((h | h) | h)
    · exact h1 h
    · exact h2 h
    · exact h3 h

/-- THE CARRIER OF A CHARGE THE LOWEST STATE DOES NOT CARRY STAYS WITHOUT MASS. -/
theorem the_carrier_of_a_kept_charge_has_no_mass (g v : R) : (g * 0 * v) ^ 2 = 0 := by ring

/-- The mass of what the carrier reads comes in the same way: a coupling `y` to the field gives the term `y (v + h)`. -/
theorem the_mass_of_matter_written_out (y v h : R) : y * (v + h) = y * v + y * h := by ring

end Term

/-! ## Part IV. The count. A carrier without mass has `n − 2` states and one with mass has `n − 1`. -/

/-- THE COUNT BALANCES. If `k` carriers gain a mass, the states they gain are `k`, and they are the `k` states the field
gives up, in any number of dimensions and for any number of carriers and of states of the field. -/
theorem the_count_balances (n c k s : ℤ) :
    (c - k) * (n - 2) + k * (n - 1) + (s - k) = c * (n - 2) + s := by ring

/-- In four dimensions with four carriers and four states of the field, three carriers with mass, one without and one
state left: twelve states before and twelve after. -/
theorem twelve_before_and_twelve_after : (3 * 3 + 1 * 2 + 1 : ℤ) = 4 * 2 + 4 := by norm_num

/-! ## Part V. The binding theorem and subsumption. -/

/-- THE MASS OF THE CARRIERS. -/
theorem the_mass_of_the_carriers :
    (∀ v : ℚ, v ≠ 0 → v ≠ -v ∧ V v v = 0 ∧ V v (-v) = 0 ∧ ¬ OnLine (fun φ : ℚ => -φ) v ∧ 0 < V v 0)
    ∧ (∀ v φ : ℚ, V v (-φ) = V v φ)
    ∧ (∀ g q v : ℚ, (g * q * v) ^ 2 ≠ 0 ↔ g ≠ 0 ∧ q ≠ 0 ∧ v ≠ 0)
    ∧ (∀ g v : ℚ, (g * 0 * v) ^ 2 = 0)
    ∧ (∀ n c k s : ℤ, (c - k) * (n - 2) + k * (n - 1) + (s - k) = c * (n - 2) + s) :=
  ⟨the_spent_bit, the_law_is_kept_by_the_fold, a_mass_exactly_when_the_lowest_state_carries_the_charge,
   the_carrier_of_a_kept_charge_has_no_mass, the_count_balances⟩

/-- SUBSUMPTION. Any model of a field with a fold, carried one to one into the ordered field with the folds matched, has
its kept states exactly over zero; so a model whose lowest states map to `v` and `−v`, `v` not zero, has spent the bit. -/
theorem every_model_of_a_broken_fold_is_an_instance {K Y : Type*} [Field K] [LinearOrder K] [IsStrictOrderedRing K]
    (τ : Y → Y) (f : Y → K) (hf : Function.Injective f) (heq : ∀ y, f (τ y) = -(f y)) (y : Y) :
    OnLine τ y ↔ f y = 0 := by
  rw [every_model_is_an_instance (fun φ : K => -φ) τ f hf heq y]
  constructor
  · intro h
    have h1 : -(f y) = f y := h
    have : 2 * f y = 0 := by linear_combination -h1
    rcases mul_eq_zero.1 this with h | h
    · exact absurd h two_ne_zero
    · exact h
  · intro h; show -(f y) = f y; rw [h, neg_zero]


end SPHYS.CarrierMass

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.CarrierMass.a_kept_reading_is_one_on_the_pair' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.CarrierMass.a_kept_reading_is_one_on_the_pair
/-- info: 'SPHYS.CarrierMass.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.an_odd_reading_is_zero_on_the_line
/-- info: 'SPHYS.CarrierMass.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.an_odd_reading_off_zero_tells_the_pair
/-- info: 'SPHYS.CarrierMass.every_model_is_an_instance' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.CarrierMass.every_model_is_an_instance
/-- info: 'SPHYS.CarrierMass.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.CarrierMass.every_reading_of_the_seat_is_a_reading_of_the_model
/-- info: 'SPHYS.CarrierMass.a_mass_is_changed_by_a_change_of_gauge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.a_mass_is_changed_by_a_change_of_gauge
/-- info: 'SPHYS.CarrierMass.the_law_is_kept_by_the_fold' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.the_law_is_kept_by_the_fold
/--
info: 'SPHYS.CarrierMass.the_law_is_nowhere_below_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.CarrierMass.the_law_is_nowhere_below_zero
/-- info: 'SPHYS.CarrierMass.the_lowest_states_are_a_pair' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.the_lowest_states_are_a_pair
/-- info: 'SPHYS.CarrierMass.the_spent_bit' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.the_spent_bit
/--
info: 'SPHYS.CarrierMass.with_no_settled_value_nothing_is_spent' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.CarrierMass.with_no_settled_value_nothing_is_spent
/-- info: 'SPHYS.CarrierMass.the_term_written_out' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.the_term_written_out
/-- info: 'SPHYS.CarrierMass.a_mass_exactly_when_the_lowest_state_carries_the_charge' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.a_mass_exactly_when_the_lowest_state_carries_the_charge
/-- info: 'SPHYS.CarrierMass.the_carrier_of_a_kept_charge_has_no_mass' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.the_carrier_of_a_kept_charge_has_no_mass
/-- info: 'SPHYS.CarrierMass.the_mass_of_matter_written_out' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.the_mass_of_matter_written_out
/-- info: 'SPHYS.CarrierMass.the_count_balances' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.the_count_balances
/-- info: 'SPHYS.CarrierMass.twelve_before_and_twelve_after' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.twelve_before_and_twelve_after
/-- info: 'SPHYS.CarrierMass.the_mass_of_the_carriers' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.the_mass_of_the_carriers
/--
info: 'SPHYS.CarrierMass.every_model_of_a_broken_fold_is_an_instance' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.CarrierMass.every_model_of_a_broken_fold_is_an_instance
