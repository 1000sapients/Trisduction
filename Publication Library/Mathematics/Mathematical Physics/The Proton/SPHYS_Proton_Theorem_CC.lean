/-
SPHYS_Proton_Theorem_CC.lean · The Proton as a New Mathematical Theorem. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. The proton is three quarks locked in the one antisymmetric reading of three colours. What is forced: the lock is
  zero when two axes coincide and one on distinct axes, in any number of colours; its charge is the electron's reversed;
  its spin is a half; while its number is kept it does not become states that carry none. DESIGN. Part 0 the seat.
  Part I the lock, as the determinant in any size over any commutative ring. Part II the charge. Part III the spin.
  Part IV the number. RISK. The mass of the proton and the share of its spin carried by the quarks are measured.
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
import Mathlib.Data.Matrix.Basis
import Mathlib.Data.Matrix.Notation
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.FreeModule.Finite.Matrix
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas

namespace SPHYS.Proton

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

/-! ## Part I. The lock, in any number of colours over any commutative ring. -/

section Lock
variable {n R : Type*} [Fintype n] [DecidableEq n] [CommRing R]

/-- THE LOCK FAILS WHEN TWO AXES COINCIDE. -/
theorem the_lock_fails_when_two_axes_coincide (M : Matrix n n R) (i j : n) (hij : i ≠ j) (h : ∀ k, M k i = M k j) :
    M.det = 0 := Matrix.det_zero_of_column_eq hij h

/-- THE LOCK CLOSES ON DISTINCT AXES. -/
theorem the_lock_closes_on_distinct_axes : (1 : Matrix n n R).det = 1 := Matrix.det_one

/-- The lock reads the product: the lock of two settings together is the product of their locks. -/
theorem the_lock_of_two_is_the_product (M N : Matrix n n R) : (M * N).det = M.det * N.det := Matrix.det_mul M N

/-- THE LOCK IS KEPT BY EVERY TURN OF THE COLOURS OF LOCK ONE. It is a reading no such turn changes: a singlet. -/
theorem the_lock_is_kept_by_a_turn_of_the_colours (U M : Matrix n n R) (hU : U.det = 1) : (U * M).det = M.det := by
  rw [Matrix.det_mul, hU, one_mul]

end Lock

/-! ## Part II. The charge. -/

/-! ## The charges, on any commutative ring. Six numbers: the charges of the quark pair `yQ`, of the two single quarks
`yu`, `yd`, of the lepton pair `yL`, of the single lepton `ye`, and of the field that gives mass `yH`. Five equations:
three that let mass be given, and two of closure. -/

section Charges
variable {R : Type*} [CommRing R]

/-- THE TABLE IS FORCED. The five equations fix every charge as a whole multiple of `yQ`, in any commutative ring. -/
theorem the_table_is_forced (yQ yu yd yL ye yH : R)
    (Yu : yQ + yu + yH = 0) (Yd : yQ + yd - yH = 0) (Ye : yL + ye - yH = 0)
    (iso : 3 * yQ + yL = 0) (grav : 6 * yQ + 3 * yu + 3 * yd + 2 * yL + ye = 0) :
    yu = -4 * yQ ∧ yd = 2 * yQ ∧ yL = -3 * yQ ∧ ye = 6 * yQ ∧ yH = 3 * yQ := by
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · linear_combination 4 * Yu + 3 * Yd + Ye + iso - grav
  · linear_combination Yd - 3 * Yu - 3 * Yd - Ye - iso + grav
  · linear_combination iso
  · linear_combination Ye - 3 * Yu - 3 * Yd - Ye - iso + grav - iso
  · linear_combination grav - 3 * Yu - 3 * Yd - Ye - iso

/-- The electric charges read from the table: the up quark `4 yQ`, the down quark `−2 yQ`, the electron `−6 yQ`, and the
neutrino one step of the pair above the electron. -/
def qUp (yQ : R) : R := 4 * yQ
def qDown (yQ : R) : R := -2 * yQ
def qElectron (yQ : R) : R := -6 * yQ
def qNeutrino (yQ : R) : R := qElectron yQ + (qUp yQ - qDown yQ)
def qProton (yQ : R) : R := qUp yQ + qUp yQ + qDown yQ
def qNeutron (yQ : R) : R := qUp yQ + qDown yQ + qDown yQ

/-- The charges of the single quarks and the single lepton of the table are these, reversed. -/
theorem the_charges_are_read_from_the_table (yQ yu yd yL ye yH : R)
    (Yu : yQ + yu + yH = 0) (Yd : yQ + yd - yH = 0) (Ye : yL + ye - yH = 0)
    (iso : 3 * yQ + yL = 0) (grav : 6 * yQ + 3 * yu + 3 * yd + 2 * yL + ye = 0) :
    -yu = qUp yQ ∧ -yd = qDown yQ ∧ -ye = qElectron yQ := by
  obtain ⟨h1, h2, _, h4, _⟩ := the_table_is_forced yQ yu yd yL ye yH Yu Yd Ye iso grav
  refine ⟨?_, ?_, ?_⟩ <;> simp only [qUp, qDown, qElectron]
  · linear_combination -h1
  · linear_combination -h2
  · linear_combination -h4

/-- THE ATOM IS NEUTRAL. The proton and the electron carry opposite charges, for every value of `yQ`. -/
theorem the_atom_is_neutral (yQ : R) : qProton yQ + qElectron yQ = 0 := by
  simp only [qProton, qUp, qDown, qElectron]; ring

/-- The neutron and the neutrino carry no charge. -/
theorem the_neutron_and_the_neutrino_are_neutral (yQ : R) : qNeutron yQ = 0 ∧ qNeutrino yQ = 0 := by
  constructor <;> simp only [qNeutron, qNeutrino, qUp, qDown, qElectron] <;> ring

/-- The quark charges are thirds of the electron's: three of each make a whole multiple of it. -/
theorem the_quark_charges_are_thirds (yQ : R) :
    3 * qUp yQ = -2 * qElectron yQ ∧ 3 * qDown yQ = qElectron yQ := by
  constructor <;> simp only [qUp, qDown, qElectron] <;> ring

/-- THE PAIRS SPLIT BY ONE STEP. The two members of a pair carry the charge of the pair plus and minus the charge `yH` of
the field that gives mass. With the table forced, the quark pair splits into the up and the down quark, and the lepton pair
into a neutral member and the electron. -/
theorem the_pairs_split_by_the_step (yQ yu yd yL ye yH : R)
    (Yu : yQ + yu + yH = 0) (Yd : yQ + yd - yH = 0) (Ye : yL + ye - yH = 0)
    (iso : 3 * yQ + yL = 0) (grav : 6 * yQ + 3 * yu + 3 * yd + 2 * yL + ye = 0) :
    yQ + yH = qUp yQ ∧ yQ - yH = qDown yQ ∧ yL + yH = 0 ∧ yL - yH = qElectron yQ := by
  obtain ⟨_, _, h3, _, h5⟩ := the_table_is_forced yQ yu yd yL ye yH Yu Yd Ye iso grav
  refine ⟨?_, ?_, ?_, ?_⟩
  · simp only [qUp]; linear_combination h5
  · simp only [qDown]; linear_combination -h5
  · linear_combination h3 + h5
  · simp only [qElectron]; linear_combination h3 - h5

/-- The step of the lepton pair is the step of the quark pair, and it is the electron's charge reversed. -/
theorem one_step_for_both_pairs (yQ : R) :
    qNeutrino yQ - qElectron yQ = qUp yQ - qDown yQ ∧ qUp yQ - qDown yQ = - qElectron yQ := by
  constructor <;> simp only [qNeutrino, qUp, qDown, qElectron] <;> ring

end Charges

/-- EVERY CHARGE READ ALONE IS A WHOLE MULTIPLE OF THE ELECTRON'S. With `a` up quarks and `b` down quarks, antiquarks
counted negative, and the number of quarks a multiple of three, the charge `4a − 2b` is a multiple of `6`. -/
theorem a_triple_of_quarks_carries_a_whole_charge (a b : ℤ) (h3 : (3 : ℤ) ∣ a + b) : (6 : ℤ) ∣ 4 * a - 2 * b := by
  omega

/-- A single quark does not: its charge `4` or `−2` is not a multiple of `6`. -/
theorem a_single_quark_carries_a_part_charge : ¬ (6 : ℤ) ∣ 4 ∧ ¬ (6 : ℤ) ∣ -2 := by
  constructor <;> omega

/-! ## Part III. The spin. Twice the spin of a quark is an odd whole number. -/

/-- THREE HALVES MAKE A HALF. The sum of three odd numbers is odd: three quarks have a half spin. -/
theorem three_halves_make_a_half (a b c : ℤ) (ha : Odd a) (hb : Odd b) (hc : Odd c) : Odd (a + b + c) :=
  (ha.add_odd hb).add_odd hc

/-- Two halves make a whole: a quark and an antiquark do not. -/
theorem two_halves_make_a_whole (a b : ℤ) (ha : Odd a) (hb : Odd b) : Even (a + b) := ha.add_odd hb

/-- THE QUARK RECORD DOES NOT DECIDE THE SPIN. For any total and any share of the quarks, every share of the field is
completed by a share of the motion: the split of the rest is free. -/
theorem the_quark_record_does_not_decide_the_spin {V : Type*} [AddCommGroup V] (s σ g : V) : ∃ l : V, σ + g + l = s :=
  ⟨s - σ - g, by abel⟩

/-! ## Part IV. The number, on any monoid of values. -/

theorem a_total_of_zeros_is_zero {V : Type*} [AddMonoid V] (l : List V) (h : ∀ x ∈ l, x = 0) : l.sum = 0 := by
  induction l with
  | nil => rfl
  | cons x l ih =>
    rw [List.sum_cons, h x (by simp), ih (fun y hy => h y (by simp [hy])), add_zero]

/-- WHILE THE NUMBER IS KEPT THE PROTON DOES NOT BECOME LIGHT AND LEPTONS. A state that carries a kept number does not
become any set of states none of which carries it. -/
theorem a_number_carried_cannot_be_left_with_none {P V : Type*} [AddMonoid V] (ℓ : P → V) (p : P) (hp : ℓ p ≠ 0)
    (out : List P) (hout : ∀ x ∈ out, ℓ x = 0) : (out.map ℓ).sum ≠ ℓ p := by
  rw [a_total_of_zeros_is_zero (out.map ℓ) (by
    intro v hv
    obtain ⟨x, hx, rfl⟩ := List.mem_map.1 hv
    exact hout x hx)]
  exact fun h => hp h.symm

/-- A proton, charged, is not its own partner. -/
theorem a_charged_lock_is_not_its_own_partner {Q : Type*} [AddGroup Q] (h2 : ∀ v : Q, v + v = 0 → v = 0) (q : Q)
    (hq : q ≠ 0) : -q ≠ q := by
  intro h
  apply hq; apply h2
  nth_rewrite 1 [← h]; exact neg_add_cancel _

/-! ## Part V. The binding theorem and subsumption. -/

/-- THE PROTON. -/
theorem the_proton :
    (∀ (M : Matrix (Fin 3) (Fin 3) ℤ) (i j : Fin 3), i ≠ j → (∀ k, M k i = M k j) → M.det = 0)
    ∧ ((1 : Matrix (Fin 3) (Fin 3) ℤ).det = 1)
    ∧ (∀ U M : Matrix (Fin 3) (Fin 3) ℤ, U.det = 1 → (U * M).det = M.det)
    ∧ (∀ yQ : ℤ, qProton yQ + qElectron yQ = 0)
    ∧ (∀ a b c : ℤ, Odd a → Odd b → Odd c → Odd (a + b + c))
    ∧ (∀ (ℓ : ℕ → ℤ) (p : ℕ), ℓ p ≠ 0 → ∀ out : List ℕ, (∀ x ∈ out, ℓ x = 0) → (out.map ℓ).sum ≠ ℓ p) :=
  ⟨fun M i j hij h => the_lock_fails_when_two_axes_coincide M i j hij h, the_lock_closes_on_distinct_axes,
   fun U M hU => the_lock_is_kept_by_a_turn_of_the_colours U M hU, the_atom_is_neutral, three_halves_make_a_half,
   fun ℓ p hp out hout => a_number_carried_cannot_be_left_with_none ℓ p hp out hout⟩

/-- SUBSUMPTION. Any lock in any number of colours, over any commutative ring, with any two axes equal, fails; a model
of the proton with another number of colours or another ring of amplitudes is an instance. -/
theorem every_model_of_the_lock_is_an_instance {m S : Type*} [Fintype m] [DecidableEq m] [CommRing S]
    (M : Matrix m m S) (i j : m) (hij : i ≠ j) (h : ∀ k, M k i = M k j) : M.det = 0 ∧ (1 : Matrix m m S).det = 1 :=
  ⟨Matrix.det_zero_of_column_eq hij h, Matrix.det_one⟩


end SPHYS.Proton

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.Proton.a_kept_reading_is_one_on_the_pair' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Proton.a_kept_reading_is_one_on_the_pair
/-- info: 'SPHYS.Proton.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Proton.an_odd_reading_is_zero_on_the_line
/-- info: 'SPHYS.Proton.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Proton.an_odd_reading_off_zero_tells_the_pair
/-- info: 'SPHYS.Proton.every_model_is_an_instance' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Proton.every_model_is_an_instance
/-- info: 'SPHYS.Proton.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Proton.every_reading_of_the_seat_is_a_reading_of_the_model
/--
info: 'SPHYS.Proton.the_lock_fails_when_two_axes_coincide' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Proton.the_lock_fails_when_two_axes_coincide
/-- info: 'SPHYS.Proton.the_lock_closes_on_distinct_axes' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Proton.the_lock_closes_on_distinct_axes
/-- info: 'SPHYS.Proton.the_lock_of_two_is_the_product' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Proton.the_lock_of_two_is_the_product
/--
info: 'SPHYS.Proton.the_lock_is_kept_by_a_turn_of_the_colours' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Proton.the_lock_is_kept_by_a_turn_of_the_colours
/-- info: 'SPHYS.Proton.the_table_is_forced' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Proton.the_table_is_forced
/-- info: 'SPHYS.Proton.the_charges_are_read_from_the_table' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Proton.the_charges_are_read_from_the_table
/-- info: 'SPHYS.Proton.the_atom_is_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Proton.the_atom_is_neutral
/-- info: 'SPHYS.Proton.the_neutron_and_the_neutrino_are_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Proton.the_neutron_and_the_neutrino_are_neutral
/-- info: 'SPHYS.Proton.the_quark_charges_are_thirds' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Proton.the_quark_charges_are_thirds
/-- info: 'SPHYS.Proton.the_pairs_split_by_the_step' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Proton.the_pairs_split_by_the_step
/-- info: 'SPHYS.Proton.one_step_for_both_pairs' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Proton.one_step_for_both_pairs
/-- info: 'SPHYS.Proton.a_triple_of_quarks_carries_a_whole_charge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Proton.a_triple_of_quarks_carries_a_whole_charge
/-- info: 'SPHYS.Proton.a_single_quark_carries_a_part_charge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Proton.a_single_quark_carries_a_part_charge
/-- info: 'SPHYS.Proton.three_halves_make_a_half' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Proton.three_halves_make_a_half
/-- info: 'SPHYS.Proton.two_halves_make_a_whole' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Proton.two_halves_make_a_whole
/-- info: 'SPHYS.Proton.the_quark_record_does_not_decide_the_spin' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Proton.the_quark_record_does_not_decide_the_spin
/-- info: 'SPHYS.Proton.a_total_of_zeros_is_zero' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Proton.a_total_of_zeros_is_zero
/-- info: 'SPHYS.Proton.a_number_carried_cannot_be_left_with_none' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Proton.a_number_carried_cannot_be_left_with_none
/-- info: 'SPHYS.Proton.a_charged_lock_is_not_its_own_partner' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Proton.a_charged_lock_is_not_its_own_partner
/-- info: 'SPHYS.Proton.the_proton' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Proton.the_proton
/--
info: 'SPHYS.Proton.every_model_of_the_lock_is_an_instance' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Proton.every_model_of_the_lock_is_an_instance
