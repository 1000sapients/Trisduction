/-
SPHYS_Magnetism_Theorem_CC.lean · Magnetism as a New Mathematical Theorem. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. Magnetism is stated on any commutative ring and any field of three components with any reversal that keeps the
  electric part and reverses the magnetic part. Nothing is assumed of the ring but, where stated, that it has no element of
  additive order two. DESIGN. Part 0 the seat on any type. Part I the three folds of the field. Part II the readings.
  Part III the force. Part IV the source. Part V the count in n dimensions. Part VI the binding theorem.
RISK. A reader may take the kernel for Maxwell's equations; it is not. The law is forced in SPHYS_Maxwell_Forced_CC.lean.
NON-NEGOTIABLE. No axiom is declared. No proof is left open. No headline theorem takes its conclusion as a field of a structure.
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

namespace SPHYS.Magnetism

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

/-! ## Part I. The field and its three folds, on any commutative ring. -/

/-- Three components over a ring. -/
@[ext] structure V3 (R : Type*) where
  x : R
  y : R
  z : R

variable {R : Type*} [CommRing R]

def V3.neg (a : V3 R) : V3 R := ⟨-a.x, -a.y, -a.z⟩
def V3.add (a b : V3 R) : V3 R := ⟨a.x + b.x, a.y + b.y, a.z + b.z⟩
def V3.smul (c : R) (a : V3 R) : V3 R := ⟨c * a.x, c * a.y, c * a.z⟩
def V3.dot (a b : V3 R) : R := a.x * b.x + a.y * b.y + a.z * b.z
def V3.cross (a b : V3 R) : V3 R := ⟨a.y * b.z - a.z * b.y, a.z * b.x - a.x * b.z, a.x * b.y - a.y * b.x⟩
def V3.zero : V3 R := ⟨0, 0, 0⟩

/-- A field: an electric part and a magnetic part. -/
@[ext] structure EM (R : Type*) where
  E : V3 R
  B : V3 R

/-- The reversal of time keeps the electric part and reverses the magnetic part. -/
def EM.T (f : EM R) : EM R := ⟨f.E, f.B.neg⟩
/-- The reflection of space reverses the electric part and keeps the magnetic part. -/
def EM.P (f : EM R) : EM R := ⟨f.E.neg, f.B⟩
/-- The exchange of charge reverses both. -/
def EM.C (f : EM R) : EM R := ⟨f.E.neg, f.B.neg⟩
/-- The duality turn: the electric part goes to the magnetic, the magnetic to minus the electric. -/
def EM.D (f : EM R) : EM R := ⟨f.B, f.E.neg⟩

theorem neg_neg3 (a : V3 R) : a.neg.neg = a := by ext <;> simp [V3.neg]

theorem the_three_folds_are_involutions (f : EM R) : f.T.T = f ∧ f.P.P = f ∧ f.C.C = f := by
  refine ⟨?_, ?_, ?_⟩ <;> ext <;> simp [EM.T, EM.P, EM.C, V3.neg]

/-- The three folds together are the identity. -/
theorem the_three_folds_together_return_the_field (f : EM R) : f.C.P.T = f := by
  ext <;> simp [EM.T, EM.P, EM.C, V3.neg]

/-- MAGNETISM IS THE PART TIME REVERSES. A field is kept by the reversal of time exactly when it has no magnetic part. -/
theorem kept_by_time_iff_no_magnetic_part (h2 : ∀ v : R, v + v = 0 → v = 0) (f : EM R) :
    OnLine EM.T f ↔ f.B = V3.zero := by
  constructor
  · intro h
    have hB : f.B.neg = f.B := congrArg EM.B h
    have hx := congrArg V3.x hB; have hy := congrArg V3.y hB; have hz := congrArg V3.z hB
    simp only [V3.neg] at hx hy hz
    ext
    · exact h2 _ (by linear_combination -hx)
    · exact h2 _ (by linear_combination -hy)
    · exact h2 _ (by linear_combination -hz)
  · intro h; show f.T = f; ext <;> simp [EM.T, V3.neg, h, V3.zero]

/-- A field is kept by the reflection of space exactly when it has no electric part. -/
theorem kept_by_space_iff_no_electric_part (h2 : ∀ v : R, v + v = 0 → v = 0) (f : EM R) :
    OnLine EM.P f ↔ f.E = V3.zero := by
  constructor
  · intro h
    have hE : f.E.neg = f.E := congrArg EM.E h
    have hx := congrArg V3.x hE; have hy := congrArg V3.y hE; have hz := congrArg V3.z hE
    simp only [V3.neg] at hx hy hz
    ext
    · exact h2 _ (by linear_combination -hx)
    · exact h2 _ (by linear_combination -hy)
    · exact h2 _ (by linear_combination -hz)
  · intro h; show f.P = f; ext <;> simp [EM.P, V3.neg, h, V3.zero]

/-! ## Part II. The readings. -/

def EM.energy (f : EM R) : R := f.E.dot f.E + f.B.dot f.B
def EM.flow (f : EM R) : V3 R := f.E.cross f.B
/-- The pseudoscalar: the electric part against the magnetic part. -/
def EM.twist (f : EM R) : R := f.E.dot f.B
def EM.balance (f : EM R) : R := f.E.dot f.E - f.B.dot f.B

/-- The energy is kept by every fold and by the duality turn. -/
theorem the_energy_is_kept_by_every_fold (f : EM R) :
    f.T.energy = f.energy ∧ f.P.energy = f.energy ∧ f.C.energy = f.energy ∧ f.D.energy = f.energy := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;> (simp [EM.energy, EM.T, EM.P, EM.C, EM.D, V3.dot, V3.neg]; try ring)

/-- The flow of energy is reversed by time and by space, and kept by the exchange of charge. -/
theorem the_flow_is_reversed_by_time (f : EM R) :
    f.T.flow = f.flow.neg ∧ f.P.flow = f.flow.neg ∧ f.C.flow = f.flow := by
  refine ⟨?_, ?_, ?_⟩ <;> ext <;> simp [EM.flow, EM.T, EM.P, EM.C, V3.cross, V3.neg] <;> ring

/-- The twist is reversed by time and by space. -/
theorem the_twist_is_reversed_by_time_and_by_space (f : EM R) :
    f.T.twist = - f.twist ∧ f.P.twist = - f.twist ∧ f.C.twist = f.twist := by
  refine ⟨?_, ?_, ?_⟩ <;> simp [EM.twist, EM.T, EM.P, EM.C, V3.dot, V3.neg] <;> ring

/-- A magnet and its reversal in time are two fields on one energy: the energy does not carry the sign. -/
theorem a_magnet_and_its_reversal_are_two_on_one_energy (h2 : ∀ v : R, v + v = 0 → v = 0) (f : EM R)
    (hB : f.B ≠ V3.zero) : f.T ≠ f ∧ f.T.energy = f.energy :=
  ⟨fun h => hB ((kept_by_time_iff_no_magnetic_part h2 f).1 h), (the_energy_is_kept_by_every_fold f).1⟩

/-- No reading through the energy tells a magnet from its reversal. -/
theorem no_reading_of_the_energy_tells_the_sign {W : Type*} (g : R → W) (f : EM R) :
    g f.T.energy = g f.energy := by rw [(the_energy_is_kept_by_every_fold f).1]

/-- The duality turn done twice is the exchange of charge, and done four times it returns the field. -/
theorem the_duality_turn_has_period_four (f : EM R) : f.D.D = f.C ∧ f.D.D.D.D = f := by
  refine ⟨?_, ?_⟩ <;> ext <;> simp [EM.D, EM.C, V3.neg]

/-- The duality turn reverses the balance and the twist. -/
theorem the_duality_turn_reverses_the_balance (f : EM R) : f.D.balance = - f.balance ∧ f.D.twist = - f.twist := by
  refine ⟨?_, ?_⟩ <;> (simp [EM.balance, EM.twist, EM.D, V3.dot, V3.neg]; try ring)

/-! ## Part III. The force on a moving charge. -/

/-- The force on a charge `q` moving at `v`: the electric part, and the velocity across the magnetic part. -/
def force (q : R) (v : V3 R) (f : EM R) : V3 R := V3.smul q (f.E.add (v.cross f.B))

/-- THE LAW OF MOTION SURVIVES THE MAGNET. With the velocity reversed and the field reversed in time, the force is the same. -/
theorem the_force_is_kept_when_time_is_reversed (q : R) (v : V3 R) (f : EM R) : force q v.neg f.T = force q v f := by
  ext <;> simp [force, EM.T, V3.smul, V3.add, V3.cross, V3.neg]

/-- Without reversing the field, the reversed motion feels a different force exactly by the magnetic term. -/
theorem the_magnetic_term_is_what_time_reversal_sees (q : R) (v : V3 R) (f : EM R) :
    (force q v.neg f).add (force q v f).neg = V3.smul q ((v.cross f.B).add (v.cross f.B)).neg := by
  ext <;> simp [force, V3.smul, V3.add, V3.cross, V3.neg] <;> ring

/-- THE MAGNETIC FORCE DOES NO WORK. -/
theorem the_magnetic_force_does_no_work (v b : V3 R) : v.dot (v.cross b) = 0 := by
  simp [V3.dot, V3.cross]; ring

/-- The work done on a charge is done by the electric part alone. -/
theorem the_work_is_electric (q : R) (v : V3 R) (f : EM R) : v.dot (force q v f) = q * v.dot f.E := by
  simp [force, V3.dot, V3.smul, V3.add, V3.cross]; ring

/-- The magnetic force is across the magnetic part as well. -/
theorem the_magnetic_force_is_across_the_field (v b : V3 R) : b.dot (v.cross b) = 0 := by
  simp [V3.dot, V3.cross]; ring

/-! ## Part IV. The source. A wave of wave vector `k` and potential `a` has magnetic part `k` across `a`. -/

/-- NO MAGNETIC CHARGE. A magnetic part that comes from a potential has no source, for every wave vector and every potential. -/
theorem a_magnetic_part_from_a_potential_has_no_source (k a : V3 R) : k.dot (k.cross a) = 0 := by
  simp [V3.dot, V3.cross]; ring

/-- A change of the potential along the wave vector changes no magnetic part. -/
theorem the_magnetic_part_is_kept_by_a_change_of_gauge (k a : V3 R) (c : R) :
    k.cross (a.add (V3.smul c k)) = k.cross a := by
  ext <;> simp [V3.cross, V3.add, V3.smul] <;> ring

/-- A magnetic source would be reversed by time and by space together with the field: a magnetic charge is an odd reading,
and it is zero on every field that time keeps. -/
theorem a_magnetic_charge_is_zero_where_time_is_kept (h2 : ∀ v : R, v + v = 0 → v = 0)
    (g : EM R → R) (hodd : ∀ f, g f.T = - g f) (f : EM R) (hf : OnLine EM.T f) : g f = 0 :=
  an_odd_reading_is_zero_on_the_line h2 EM.T g hodd f hf

/-! ## Part V. The count, in any number of dimensions. In `n` dimensions of space and time the electric part has
`n - 1` components and the magnetic part has `(n - 1)(n - 2) / 2`. -/

/-- The two parts are equal in number exactly in four dimensions. -/
theorem electric_and_magnetic_are_equal_in_number_exactly_in_four (n : ℤ) (hn : 2 ≤ n) :
    2 * (n - 1) = (n - 1) * (n - 2) ↔ n = 4 := by
  constructor
  · intro h
    have h1 : (n - 1) * (n - 4) = 0 := by linear_combination -h
    rcases mul_eq_zero.1 h1 with h | h
    · omega
    · omega
  · rintro rfl; norm_num

/-- In three dimensions of space and time the magnetic part is one number, and in two there is none. -/
theorem the_magnetic_part_in_low_dimensions : ((3:ℤ) - 1) * (3 - 2) = 2 * 1 ∧ ((2:ℤ) - 1) * (2 - 2) = 0 := by
  constructor <;> norm_num

/-! ## Part VI. The binding theorem. -/

/-- MAGNETISM, ON ANY COMMUTATIVE RING WITH NO ELEMENT OF ORDER TWO. -/
theorem magnetism (h2 : ∀ v : R, v + v = 0 → v = 0) :
    (∀ f : EM R, OnLine EM.T f ↔ f.B = V3.zero)
    ∧ (∀ f : EM R, f.B ≠ V3.zero → f.T ≠ f ∧ f.T.energy = f.energy)
    ∧ (∀ (q : R) (v : V3 R) (f : EM R), force q v.neg f.T = force q v f)
    ∧ (∀ v b : V3 R, v.dot (v.cross b) = 0)
    ∧ (∀ k a : V3 R, k.dot (k.cross a) = 0)
    ∧ (∀ f : EM R, f.C.P.T = f)
    ∧ (∀ n : ℤ, 2 ≤ n → (2 * (n - 1) = (n - 1) * (n - 2) ↔ n = 4)) :=
  ⟨kept_by_time_iff_no_magnetic_part h2, a_magnet_and_its_reversal_are_two_on_one_energy h2,
   the_force_is_kept_when_time_is_reversed, the_magnetic_force_does_no_work,
   a_magnetic_part_from_a_potential_has_no_source, the_three_folds_together_return_the_field,
   electric_and_magnetic_are_equal_in_number_exactly_in_four⟩

/-- SUBSUMPTION. Any model of a field, on any type, with any reversal, that is carried one to one into this one with the
reversals matched, is kept by its reversal exactly where its image has no magnetic part. -/
theorem every_model_of_magnetism_is_an_instance {Y : Type*} (h2 : ∀ v : R, v + v = 0 → v = 0) (τ : Y → Y) (φ : Y → EM R)
    (hφ : Function.Injective φ) (heq : ∀ y, φ (τ y) = (φ y).T) (y : Y) :
    OnLine τ y ↔ (φ y).B = V3.zero :=
  (every_model_is_an_instance EM.T τ φ hφ heq y).trans (kept_by_time_iff_no_magnetic_part h2 (φ y))

end SPHYS.Magnetism

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.Magnetism.a_kept_reading_is_one_on_the_pair' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Magnetism.a_kept_reading_is_one_on_the_pair
/-- info: 'SPHYS.Magnetism.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Magnetism.an_odd_reading_is_zero_on_the_line
/-- info: 'SPHYS.Magnetism.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Magnetism.an_odd_reading_off_zero_tells_the_pair
/-- info: 'SPHYS.Magnetism.every_model_is_an_instance' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Magnetism.every_model_is_an_instance
/-- info: 'SPHYS.Magnetism.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Magnetism.every_reading_of_the_seat_is_a_reading_of_the_model
/-- info: 'SPHYS.Magnetism.neg_neg3' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Magnetism.neg_neg3
/-- info: 'SPHYS.Magnetism.the_three_folds_are_involutions' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_three_folds_are_involutions
/-- info: 'SPHYS.Magnetism.the_three_folds_together_return_the_field' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_three_folds_together_return_the_field
/-- info: 'SPHYS.Magnetism.kept_by_time_iff_no_magnetic_part' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.kept_by_time_iff_no_magnetic_part
/-- info: 'SPHYS.Magnetism.kept_by_space_iff_no_electric_part' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.kept_by_space_iff_no_electric_part
/-- info: 'SPHYS.Magnetism.the_energy_is_kept_by_every_fold' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_energy_is_kept_by_every_fold
/-- info: 'SPHYS.Magnetism.the_flow_is_reversed_by_time' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_flow_is_reversed_by_time
/-- info: 'SPHYS.Magnetism.the_twist_is_reversed_by_time_and_by_space' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_twist_is_reversed_by_time_and_by_space
/-- info: 'SPHYS.Magnetism.a_magnet_and_its_reversal_are_two_on_one_energy' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.a_magnet_and_its_reversal_are_two_on_one_energy
/-- info: 'SPHYS.Magnetism.no_reading_of_the_energy_tells_the_sign' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Magnetism.no_reading_of_the_energy_tells_the_sign
/-- info: 'SPHYS.Magnetism.the_duality_turn_has_period_four' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_duality_turn_has_period_four
/-- info: 'SPHYS.Magnetism.the_duality_turn_reverses_the_balance' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_duality_turn_reverses_the_balance
/-- info: 'SPHYS.Magnetism.the_force_is_kept_when_time_is_reversed' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_force_is_kept_when_time_is_reversed
/-- info: 'SPHYS.Magnetism.the_magnetic_term_is_what_time_reversal_sees' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_magnetic_term_is_what_time_reversal_sees
/-- info: 'SPHYS.Magnetism.the_magnetic_force_does_no_work' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_magnetic_force_does_no_work
/-- info: 'SPHYS.Magnetism.the_work_is_electric' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_work_is_electric
/-- info: 'SPHYS.Magnetism.the_magnetic_force_is_across_the_field' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_magnetic_force_is_across_the_field
/-- info: 'SPHYS.Magnetism.a_magnetic_part_from_a_potential_has_no_source' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.a_magnetic_part_from_a_potential_has_no_source
/-- info: 'SPHYS.Magnetism.the_magnetic_part_is_kept_by_a_change_of_gauge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_magnetic_part_is_kept_by_a_change_of_gauge
/-- info: 'SPHYS.Magnetism.a_magnetic_charge_is_zero_where_time_is_kept' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Magnetism.a_magnetic_charge_is_zero_where_time_is_kept
/--
info: 'SPHYS.Magnetism.electric_and_magnetic_are_equal_in_number_exactly_in_four' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Magnetism.electric_and_magnetic_are_equal_in_number_exactly_in_four
/-- info: 'SPHYS.Magnetism.the_magnetic_part_in_low_dimensions' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_magnetic_part_in_low_dimensions
/-- info: 'SPHYS.Magnetism.magnetism' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.magnetism
/-- info: 'SPHYS.Magnetism.every_model_of_magnetism_is_an_instance' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.every_model_of_magnetism_is_an_instance
