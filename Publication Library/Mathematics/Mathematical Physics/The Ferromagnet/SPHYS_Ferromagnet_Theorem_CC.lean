/-
SPHYS_Ferromagnet_Theorem_CC.lean · The Ferromagnet as a New Mathematical Theorem. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. A system of spins is any finite set of states with a flip, a weight the flip keeps and a count of up spins that the
  flip sends to its complement. No lattice, no dimension and no range of the coupling is assumed. DESIGN. Part 0 the seat.
  Part I the flip and the partition function as its own fold, for every such system. Part II the circle as the line of the
  fold. Part III two and three spins: the zeros on the circle inside the bound, off it outside. Part IV the magnetisation.
RISK. Part III is two and three spins. The statement for every number of spins is the theorem of Lee and Yang (1952) and is
  not proved in this file; Part I is proved for every number.
NON-NEGOTIABLE. No axiom is declared. No proof is left open.
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

namespace SPHYS.Ferromagnet

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

/-! ## Part I. Every system of spins with a flip. -/

/-- A state the flip moves has a partner of the same weight: two states on one weight. -/
theorem a_moved_state_and_its_partner_are_two_on_one_weight {S W : Type*} (flip : S → S) (wt : S → W)
    (hw : ∀ s, wt (flip s) = wt s) (s : S) (hs : flip s ≠ s) : flip s ≠ s ∧ wt (flip s) = wt s := ⟨hs, hw s⟩

section Flip
variable {R : Type*} [CommRing R]

/-- THE PARTITION FUNCTION IS ITS OWN FOLD. For any finite set of states, any flip that is its own inverse, any weight the flip
keeps and any count `u` with `u s + u (flip s) = n`: the polynomial `∑ wt s · z ^ u s`, taken at `w` with `z w = 1` and
multiplied by `z ^ n`, is the polynomial at `z`. -/
theorem the_partition_function_is_its_own_fold {S : Type*} [Fintype S] (flip : S → S)
    (hf : Function.Involutive flip) (wt : S → R) (hw : ∀ s, wt (flip s) = wt s) (u : S → ℕ) (n : ℕ)
    (hu : ∀ s, u s + u (flip s) = n) (z w : R) (hzw : z * w = 1) :
    z ^ n * (∑ s, wt s * w ^ (u s)) = ∑ s, wt s * z ^ (u s) := by
  rw [Finset.mul_sum, ← Equiv.sum_comp (Function.Involutive.toPerm flip hf) (fun s => wt s * z ^ (u s))]
  apply Finset.sum_congr rfl
  intro s _
  show z ^ n * (wt s * w ^ u s) = wt (flip s) * z ^ u (flip s)
  rw [hw, ← hu s, pow_add]
  calc z ^ u s * z ^ u (flip s) * (wt s * w ^ u s) = wt s * z ^ u (flip s) * (z * w) ^ u s := by rw [mul_pow]; ring
    _ = wt s * z ^ u (flip s) := by rw [hzw, one_pow, mul_one]

/-- THE ZEROS COME IN FOLDED PAIRS. A zero at `w` gives a zero at its inverse `z`. -/
theorem the_zeros_come_in_folded_pairs {S : Type*} [Fintype S] (flip : S → S)
    (hf : Function.Involutive flip) (wt : S → R) (hw : ∀ s, wt (flip s) = wt s) (u : S → ℕ) (n : ℕ)
    (hu : ∀ s, u s + u (flip s) = n) (z w : R) (hzw : z * w = 1) (h0 : ∑ s, wt s * w ^ (u s) = 0) :
    ∑ s, wt s * z ^ (u s) = 0 := by
  rw [← the_partition_function_is_its_own_fold flip hf wt hw u n hu z w hzw, h0, mul_zero]

/-- NO MAGNETISATION WITHOUT A SPENT BIT. Any reading the flip reverses has total zero against any weight the flip keeps. -/
theorem an_odd_reading_has_total_zero {S : Type*} [Fintype S] (h2 : ∀ v : R, v + v = 0 → v = 0) (flip : S → S)
    (hf : Function.Involutive flip) (wt m : S → R) (hw : ∀ s, wt (flip s) = wt s) (hm : ∀ s, m (flip s) = - m s) :
    ∑ s, m s * wt s = 0 := by
  apply h2
  have e : ∑ s, m s * wt s = ∑ s, - (m s * wt s) := by
    rw [← Equiv.sum_comp (Function.Involutive.toPerm flip hf) (fun s => m s * wt s)]
    apply Finset.sum_congr rfl
    intro s _
    show m (flip s) * wt (flip s) = - (m s * wt s)
    rw [hw, hm]; ring
  nth_rewrite 1 [e]
  rw [Finset.sum_neg_distrib, neg_add_cancel]

/-- Three spins on a triangle: the polynomial factors, in any commutative ring. -/
theorem three_spins_factor (z b : R) :
    z ^ 3 + 3 * b * z ^ 2 + 3 * b * z + 1 = (z + 1) * (z ^ 2 + (3 * b - 1) * z + 1) := by ring

end Flip

/-! ## Part II. The circle is the line of the fold. A point `x + iy` of the plane, over any ordered field. -/

section Circle
variable {K : Type*} [Field K] [LinearOrder K] [IsStrictOrderedRing K]

/-- The fold of the plane sends `x + iy` to the inverse of its conjugate. A point other than zero is kept exactly on the circle. -/
theorem kept_by_the_fold_iff_on_the_circle (x y : K) (h : x ≠ 0 ∨ y ≠ 0) :
    (x / (x ^ 2 + y ^ 2) = x ∧ y / (x ^ 2 + y ^ 2) = y) ↔ x ^ 2 + y ^ 2 = 1 := by
  have hn : 0 < x ^ 2 + y ^ 2 := by
    rcases h with h | h
    · have := mul_self_pos.2 h; nlinarith [sq_nonneg y]
    · have := mul_self_pos.2 h; nlinarith [sq_nonneg x]
  constructor
  · rintro ⟨h1, h2⟩
    rw [div_eq_iff hn.ne'] at h1 h2
    by_contra hne
    have hx : x = 0 := by
      have e : x * (x ^ 2 + y ^ 2 - 1) = 0 := by linear_combination -h1
      rcases mul_eq_zero.1 e with h | h
      · exact h
      · exact absurd (by linear_combination h) hne
    have hy : y = 0 := by
      have e : y * (x ^ 2 + y ^ 2 - 1) = 0 := by linear_combination -h2
      rcases mul_eq_zero.1 e with h | h
      · exact h
      · exact absurd (by linear_combination h) hne
    rcases h with h | h
    · exact h hx
    · exact h hy
  · intro h1; rw [h1]; simp

/-! ## Part III. Two spins and three spins. The polynomial of two spins is `z² + 2 a z + 1`; at `z = x + iy` its real part is
`x² − y² + 2 a x + 1` and its imaginary part is `2 x y + 2 a y`. -/

/-- INSIDE THE BOUND EVERY ZERO IS ON THE CIRCLE. -/
theorem two_spins_zeros_on_the_circle (a x y : K) (ha : a ^ 2 ≤ 1)
    (hre : x ^ 2 - y ^ 2 + 2 * a * x + 1 = 0) (him : 2 * x * y + 2 * a * y = 0) : x ^ 2 + y ^ 2 = 1 := by
  have h : y * (x + a) = 0 := by linear_combination him / 2
  rcases mul_eq_zero.1 h with hy | hx
  · subst hy
    have h1 : (x + a) * (x + a) = a ^ 2 - 1 := by linear_combination hre
    have h2 : (x + a) * (x + a) = 0 := le_antisymm (by linarith) (mul_self_nonneg _)
    have h3 : x + a = 0 := mul_self_eq_zero.1 h2
    have h4 : a ^ 2 = 1 := by linarith
    have h5 : x = -a := by linarith
    subst h5
    linear_combination h4
  · have h5 : x = -a := by linarith
    subst h5
    linear_combination -hre

/-- OUTSIDE THE BOUND EVERY ZERO IS REAL AND OFF THE CIRCLE. -/
theorem outside_the_bound_the_zeros_leave_the_circle (a x y : K) (ha : 1 < a ^ 2)
    (hre : x ^ 2 - y ^ 2 + 2 * a * x + 1 = 0) (him : 2 * x * y + 2 * a * y = 0) : y = 0 ∧ x ^ 2 + y ^ 2 ≠ 1 := by
  have h : y * (x + a) = 0 := by linear_combination him / 2
  have hy : y = 0 := by
    rcases mul_eq_zero.1 h with hy | hx
    · exact hy
    · exfalso
      have h5 : x = -a := by linarith
      subst h5
      nlinarith [sq_nonneg y]
  refine ⟨hy, ?_⟩
  subst hy
  intro h1
  have hax : a * x = -1 := by linear_combination (hre - h1) / 2
  have hx2 : x ^ 2 = 1 := by linear_combination h1
  have e : a ^ 2 * x ^ 2 = 1 := by rw [← mul_pow, hax]; norm_num
  rw [hx2, mul_one] at e
  linarith

/-- The bound, for three spins with `2 a = 3 b − 1`. -/
theorem the_bound_of_three_spins (b : K) : ((3 * b - 1) / 2) ^ 2 ≤ 1 ↔ -(1 / 3) ≤ b ∧ b ≤ 1 := by
  constructor
  · intro h
    have h' := abs_le_of_sq_le_sq' (by simpa using h : ((3 * b - 1) / 2) ^ 2 ≤ (1 : K) ^ 2) zero_le_one
    constructor <;> linarith [h'.1, h'.2]
  · rintro ⟨h1, h2⟩
    have := sq_le_sq' (by linarith : -(1 : K) ≤ (3 * b - 1) / 2) (by linarith : (3 * b - 1) / 2 ≤ 1)
    simpa using this

/-- THREE SPINS. Its zeros are `−1`, which is on the circle, and the zeros of the second factor, which are on the circle
inside the bound. -/
theorem three_spins_zeros_on_the_circle (b x y : K) (hb : -(1 / 3) ≤ b ∧ b ≤ 1)
    (hre : x ^ 2 - y ^ 2 + 2 * ((3 * b - 1) / 2) * x + 1 = 0) (him : 2 * x * y + 2 * ((3 * b - 1) / 2) * y = 0) :
    x ^ 2 + y ^ 2 = 1 ∧ (-1 : K) ^ 2 + 0 ^ 2 = 1 :=
  ⟨two_spins_zeros_on_the_circle _ x y ((the_bound_of_three_spins b).2 hb) hre him, by norm_num⟩

/-- THE FERROMAGNET OF TWO SPINS WITNESSES THE CIRCLE: on the circle exactly inside the bound. -/
theorem the_ferromagnet (a : K) :
    (a ^ 2 ≤ 1 → ∀ x y : K, x ^ 2 - y ^ 2 + 2 * a * x + 1 = 0 → 2 * x * y + 2 * a * y = 0 → x ^ 2 + y ^ 2 = 1)
    ∧ (1 < a ^ 2 → ∀ x y : K, x ^ 2 - y ^ 2 + 2 * a * x + 1 = 0 → 2 * x * y + 2 * a * y = 0 → x ^ 2 + y ^ 2 ≠ 1) :=
  ⟨fun ha x y h1 h2 => two_spins_zeros_on_the_circle a x y ha h1 h2,
   fun ha x y h1 h2 => (outside_the_bound_the_zeros_leave_the_circle a x y ha h1 h2).2⟩

end Circle

/-- SUBSUMPTION. Any model of spins carried one to one into a system with a flip, flips matched, has its kept states
exactly over the kept states of that system. -/
theorem every_model_of_spins_is_an_instance {S Y : Type*} (flip : S → S) (τ : Y → Y) (φ : Y → S)
    (hφ : Function.Injective φ) (heq : ∀ y, φ (τ y) = flip (φ y)) (y : Y) : OnLine τ y ↔ OnLine flip (φ y) :=
  every_model_is_an_instance flip τ φ hφ heq y


end SPHYS.Ferromagnet

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.Ferromagnet.a_kept_reading_is_one_on_the_pair' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Ferromagnet.a_kept_reading_is_one_on_the_pair
/-- info: 'SPHYS.Ferromagnet.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Ferromagnet.an_odd_reading_is_zero_on_the_line
/-- info: 'SPHYS.Ferromagnet.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Ferromagnet.an_odd_reading_off_zero_tells_the_pair
/-- info: 'SPHYS.Ferromagnet.every_model_is_an_instance' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Ferromagnet.every_model_is_an_instance
/-- info: 'SPHYS.Ferromagnet.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Ferromagnet.every_reading_of_the_seat_is_a_reading_of_the_model
/-- info: 'SPHYS.Ferromagnet.a_moved_state_and_its_partner_are_two_on_one_weight' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Ferromagnet.a_moved_state_and_its_partner_are_two_on_one_weight
/--
info: 'SPHYS.Ferromagnet.the_partition_function_is_its_own_fold' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Ferromagnet.the_partition_function_is_its_own_fold
/--
info: 'SPHYS.Ferromagnet.the_zeros_come_in_folded_pairs' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Ferromagnet.the_zeros_come_in_folded_pairs
/--
info: 'SPHYS.Ferromagnet.an_odd_reading_has_total_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Ferromagnet.an_odd_reading_has_total_zero
/-- info: 'SPHYS.Ferromagnet.three_spins_factor' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Ferromagnet.three_spins_factor
/--
info: 'SPHYS.Ferromagnet.kept_by_the_fold_iff_on_the_circle' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Ferromagnet.kept_by_the_fold_iff_on_the_circle
/--
info: 'SPHYS.Ferromagnet.two_spins_zeros_on_the_circle' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Ferromagnet.two_spins_zeros_on_the_circle
/--
info: 'SPHYS.Ferromagnet.outside_the_bound_the_zeros_leave_the_circle' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Ferromagnet.outside_the_bound_the_zeros_leave_the_circle
/-- info: 'SPHYS.Ferromagnet.the_bound_of_three_spins' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Ferromagnet.the_bound_of_three_spins
/--
info: 'SPHYS.Ferromagnet.three_spins_zeros_on_the_circle' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Ferromagnet.three_spins_zeros_on_the_circle
/-- info: 'SPHYS.Ferromagnet.the_ferromagnet' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Ferromagnet.the_ferromagnet
/-- info: 'SPHYS.Ferromagnet.every_model_of_spins_is_an_instance' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Ferromagnet.every_model_of_spins_is_an_instance
