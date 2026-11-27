/-
SPHYS_Gluon_Theorem_CC.lean · The Gluon as a New Mathematical Theorem. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. The gluon is the carrier of a charge with three kinds. What is forced: there are eight; the commutator of two
  carriers is a carrier, so the carriers carry the charge they carry; with two kinds or more they do not commute; the
  commutator obeys the cyclic identity in any ring; a kept gauge leaves them no mass. DESIGN. Part 0 the seat. Part I the
  count, for any number of kinds. Part II the commutator, in any ring. Part III the mass, for any symmetric additive form.
RISK. The count is over the rationals; the strength of the coupling is measured. The equations of the field are forced in
  SPHYS_YangMills_Forced_CC.lean and are not repeated. NON-NEGOTIABLE. No axiom is declared. No proof is left open.
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

namespace SPHYS.Gluon

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

/-! ## The count of the carriers. The carriers of a charge with `n` kinds are the `n × n` matrices of trace zero. -/

/-- The matrices of trace zero, with one more, have dimension `n²`: there are `n² − 1` carriers. -/
theorem the_count_of_the_carriers (n : ℕ) (hn : 0 < n) :
    Module.finrank ℚ (LinearMap.ker (Matrix.traceLinearMap (Fin n) ℚ ℚ)) + 1 = n * n := by
  have hs : Function.Surjective (Matrix.traceLinearMap (Fin n) ℚ ℚ) := by
    intro c
    refine ⟨Matrix.stdBasisMatrix ⟨0, hn⟩ ⟨0, hn⟩ c, ?_⟩
    simp [Matrix.traceLinearMap_apply, Matrix.trace, Matrix.stdBasisMatrix, Finset.sum_ite_eq']
  have hr := LinearMap.finrank_range_add_finrank_ker (Matrix.traceLinearMap (Fin n) ℚ ℚ)
  rw [LinearMap.range_eq_top.mpr hs, finrank_top, Module.finrank_self, Module.finrank_matrix] at hr
  simp at hr
  omega

/-- Three kinds: eight carriers. Two kinds: three carriers. One kind: none of this sort. -/
theorem eight_three_and_none :
    Module.finrank ℚ (LinearMap.ker (Matrix.traceLinearMap (Fin 3) ℚ ℚ)) = 8
    ∧ Module.finrank ℚ (LinearMap.ker (Matrix.traceLinearMap (Fin 2) ℚ ℚ)) = 3
    ∧ Module.finrank ℚ (LinearMap.ker (Matrix.traceLinearMap (Fin 1) ℚ ℚ)) = 0 := by
  have h3 := the_count_of_the_carriers 3 (by norm_num)
  have h2 := the_count_of_the_carriers 2 (by norm_num)
  have h1 := the_count_of_the_carriers 1 (by norm_num)
  refine ⟨?_, ?_, ?_⟩ <;> omega

/-- THE CARRIERS CLOSE. The commutator of any two matrices has trace zero: it is again a carrier. -/
theorem the_commutator_of_two_is_a_carrier {n K : Type*} [Fintype n] [DecidableEq n] [CommRing K] (M N : Matrix n n K) :
    Matrix.trace (M * N - N * M) = 0 := by
  rw [Matrix.trace_sub, Matrix.trace_mul_comm, sub_self]

/-- A COMMUTING CHARGE HAS NO COMMUTATOR. Where the charge is a number, any two commute. -/
theorem a_commuting_charge_has_no_commutator {K : Type*} [CommRing K] (x y : K) : x * y - y * x = 0 := by ring

/-- WITH TWO KINDS OR MORE THE CARRIERS DO NOT COMMUTE: two of trace zero whose commutator is not zero. -/
theorem carriers_that_do_not_commute :
    ∃ M N : Matrix (Fin 2) (Fin 2) ℤ, Matrix.trace M = 0 ∧ Matrix.trace N = 0 ∧ M * N - N * M ≠ 0 := by
  refine ⟨!![0, 1; 0, 0], !![0, 0; 1, 0], ?_, ?_, ?_⟩
  · simp [Matrix.trace, Fin.sum_univ_two]
  · simp [Matrix.trace, Fin.sum_univ_two]
  · intro h
    have h00 := congrFun (congrFun h 0) 0
    simp [Matrix.mul_apply, Fin.sum_univ_two] at h00

/-! ## Part II. The commutator, in any ring. -/

section Commutator
variable {A : Type*} [Ring A]

/-- The charge that one carrier reads on another. -/
def br (x y : A) : A := x * y - y * x

/-- The reading is reversed when the two are exchanged, and a carrier reads none on itself. -/
theorem the_reading_is_antisymmetric (x y : A) : br x y = - br y x ∧ br x x = 0 := by
  constructor <;> simp [br]

/-- THE CYCLIC IDENTITY. The readings of three carriers on one another close, in any ring. -/
theorem the_cyclic_identity (x y z : A) : br (br x y) z + br (br y z) x + br (br z x) y = 0 := by
  simp only [br]; noncomm_ring

/-- The reading of a carrier on a product is taken on each factor in turn. -/
theorem the_reading_on_a_product (x y z : A) : br x (y * z) = br x y * z + y * br x z := by
  simp only [br]; noncomm_ring

/-- THE STRENGTH HAS A TERM OF ITS OWN. The strength of the field of two potentials `a`, `b` with first-order changes
`da`, `db` is `da − db + (a b − b a)`. The last term is zero exactly when the two commute. -/
theorem the_term_of_its_own_is_zero_iff_they_commute (a b : A) : br a b = 0 ↔ a * b = b * a := by
  simp [br, sub_eq_zero]

end Commutator

/-! ## Part III. The mass. -/

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

/-! ## Part IV. The binding theorem and subsumption. -/

/-- THE GLUON. -/
theorem the_gluon :
    (Module.finrank ℚ (LinearMap.ker (Matrix.traceLinearMap (Fin 3) ℚ ℚ)) = 8)
    ∧ (∀ M N : Matrix (Fin 3) (Fin 3) ℚ, Matrix.trace (M * N - N * M) = 0)
    ∧ (∃ M N : Matrix (Fin 2) (Fin 2) ℤ, Matrix.trace M = 0 ∧ Matrix.trace N = 0 ∧ M * N - N * M ≠ 0)
    ∧ (∀ x y z : Matrix (Fin 3) (Fin 3) ℚ, br (br x y) z + br (br y z) x + br (br z x) y = 0)
    ∧ (∀ x y : ℚ, x * y - y * x = 0) :=
  ⟨eight_three_and_none.1, fun M N => the_commutator_of_two_is_a_carrier M N, carriers_that_do_not_commute,
   the_cyclic_identity, a_commuting_charge_has_no_commutator⟩

/-- SUBSUMPTION. Any carriers, in any ring, with any number of kinds, have a commutator that obeys the cyclic identity
and, as matrices over any commutative ring, has trace zero. A model with another group of charge is an instance. -/
theorem every_model_of_the_carriers_is_an_instance {A n K : Type*} [Ring A] [Fintype n] [DecidableEq n] [CommRing K]
    (x y z : A) (M N : Matrix n n K) :
    br (br x y) z + br (br y z) x + br (br z x) y = 0 ∧ Matrix.trace (M * N - N * M) = 0 :=
  ⟨the_cyclic_identity x y z, the_commutator_of_two_is_a_carrier M N⟩


end SPHYS.Gluon

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.Gluon.a_kept_reading_is_one_on_the_pair' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Gluon.a_kept_reading_is_one_on_the_pair
/-- info: 'SPHYS.Gluon.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Gluon.an_odd_reading_is_zero_on_the_line
/-- info: 'SPHYS.Gluon.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Gluon.an_odd_reading_off_zero_tells_the_pair
/-- info: 'SPHYS.Gluon.every_model_is_an_instance' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Gluon.every_model_is_an_instance
/-- info: 'SPHYS.Gluon.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Gluon.every_reading_of_the_seat_is_a_reading_of_the_model
/-- info: 'SPHYS.Gluon.the_count_of_the_carriers' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Gluon.the_count_of_the_carriers
/-- info: 'SPHYS.Gluon.eight_three_and_none' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Gluon.eight_three_and_none
/-- info: 'SPHYS.Gluon.the_commutator_of_two_is_a_carrier' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Gluon.the_commutator_of_two_is_a_carrier
/-- info: 'SPHYS.Gluon.a_commuting_charge_has_no_commutator' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Gluon.a_commuting_charge_has_no_commutator
/-- info: 'SPHYS.Gluon.carriers_that_do_not_commute' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Gluon.carriers_that_do_not_commute
/-- info: 'SPHYS.Gluon.the_reading_is_antisymmetric' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Gluon.the_reading_is_antisymmetric
/-- info: 'SPHYS.Gluon.the_cyclic_identity' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Gluon.the_cyclic_identity
/-- info: 'SPHYS.Gluon.the_reading_on_a_product' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Gluon.the_reading_on_a_product
/-- info: 'SPHYS.Gluon.the_term_of_its_own_is_zero_iff_they_commute' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Gluon.the_term_of_its_own_is_zero_iff_they_commute
/-- info: 'SPHYS.Gluon.a_mass_is_changed_by_a_change_of_gauge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Gluon.a_mass_is_changed_by_a_change_of_gauge
/-- info: 'SPHYS.Gluon.the_gluon' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Gluon.the_gluon
/--
info: 'SPHYS.Gluon.every_model_of_the_carriers_is_an_instance' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Gluon.every_model_of_the_carriers_is_an_instance
