/-
SPHYS_Strong_Force_Theorem_CC.lean · The Strong Force as a New Mathematical Theorem. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. What is forced about the strong force: a law a fold keeps has no term the fold reverses, so a strong force that
  reads no orientation has no such term; a coupling equal on the two hands is on the line of the mirror; the count that
  decides freedom at short distance is positive exactly up to sixteen kinds of quark with three colours, and is never
  positive for a charge that commutes; the ratio of the rates counts the colours. DESIGN. Part 0 the seat. Part I the
  orientation, on any type and any ring. Part II the freedom. Part III the colours. Part IV the carriers.
RISK. The count `11 N − 2 f` of Part II is the cited result of Gross, Wilczek and Politzer (1973); it is written out,
  not derived, and the theorems are about its sign. That the term the mirror reverses is absent is a measurement.
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

namespace SPHYS.StrongForce

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

/-! ## Part I. The orientation. -/

/-- A LAW A FOLD KEEPS HAS NO TERM THE FOLD REVERSES. Let `τ` be a reading the fold reverses and not everywhere zero. If
the term `θ · τ` is kept by the fold on every state, then `θ = 0`, where two is not zero and there are no zero divisors. -/
theorem a_law_a_fold_keeps_has_no_term_the_fold_reverses {X K : Type*} [CommRing K] [NoZeroDivisors K]
    (h2 : (2 : K) ≠ 0) (σ : X → X) (τ : X → K) (hodd : ∀ x, τ (σ x) = - τ x) (x₀ : X) (hx₀ : τ x₀ ≠ 0) (θ : K)
    (hkept : ∀ x, θ * τ (σ x) = θ * τ x) : θ = 0 := by
  have h := hkept x₀
  rw [hodd] at h
  have h3 : θ * (2 * τ x₀) = 0 := by linear_combination -h
  rcases mul_eq_zero.1 h3 with h | h
  · exact h
  · rcases mul_eq_zero.1 h with h | h
    · exact absurd h h2
    · exact absurd h hx₀

/-- Conversely, with no such term the law is kept. -/
theorem with_no_such_term_the_law_is_kept {X K : Type*} [CommRing K] (σ : X → X) (τ : X → K) (x : X) :
    (0 : K) * τ (σ x) = 0 * τ x := by rw [zero_mul, zero_mul]

/-- The term in question: the electric part against the magnetic part of the field of the force. The mirror reverses the
first and keeps the second. -/
theorem the_twist_is_reversed_by_the_mirror {K : Type*} [CommRing K] (e b : K) : (-e) * b = -(e * b) := by ring

/-- THE STRONG FORCE READS NO ORIENTATION EXACTLY WHEN THE TWIST TERM IS ABSENT. -/
theorem the_strong_force_reads_no_orientation {K : Type*} [CommRing K] [NoZeroDivisors K] [Nontrivial K]
    (h2 : (2 : K) ≠ 0) (θ : K) :
    (∀ p : K × K, θ * ((-p.1) * p.2) = θ * (p.1 * p.2)) ↔ θ = 0 := by
  constructor
  · intro h
    exact a_law_a_fold_keeps_has_no_term_the_fold_reverses h2 (fun p : K × K => (-p.1, p.2)) (fun p => p.1 * p.2)
      (fun p => by ring) (1, 1) (by simp) θ h
  · rintro rfl p; rw [zero_mul, zero_mul]

/-- The mirror exchanges the two hands. A coupling is on its line exactly when the hands are equal. -/
def swapHands {K : Type*} (g : K × K) : K × K := (g.2, g.1)

theorem on_the_line_of_the_mirror_iff_the_hands_are_equal {K : Type*} (g : K × K) : OnLine swapHands g ↔ g.1 = g.2 := by
  constructor
  · intro h; exact (congrArg Prod.fst h).symm
  · intro h; exact Prod.ext h.symm h

/-! ## Part II. The freedom. The count is `11 N − 2 f` for `N` colours and `f` kinds of quark. -/

def count (N f : ℤ) : ℤ := 11 * N - 2 * f

/-- FREE EXACTLY UP TO SIXTEEN. With three colours the count is positive exactly for sixteen kinds or fewer. -/
theorem free_exactly_up_to_sixteen (f : ℤ) : 0 < count 3 f ↔ f ≤ 16 := by
  simp only [count]; constructor <;> intro h <;> omega

/-- For any number of colours the count is positive exactly when twice the kinds are fewer than eleven times the colours. -/
theorem free_iff_few_kinds (N f : ℤ) : 0 < count N f ↔ 2 * f < 11 * N := by
  simp only [count]; constructor <;> intro h <;> omega

/-- A COMMUTING CHARGE IS NEVER FREE. With no colour to commute against, the count is not positive for any kinds. -/
theorem a_commuting_charge_is_never_free (f : ℤ) (hf : 0 ≤ f) : ¬ 0 < count 0 f := by
  simp only [count]; omega

/-- FREEDOM NEEDS A CHARGE THAT DOES NOT COMMUTE. -/
theorem freedom_needs_colours (N f : ℤ) (hf : 0 ≤ f) (h : 0 < count N f) : 0 < N := by
  simp only [count] at h; omega

/-! ## Part III. The colours. -/

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

/-- THE RATIO COUNTS THE COLOURS. The rate into quarks of three kinds against the rate into a lepton pair is `N` times the
sum of the squares of the quark charges over the square of the lepton charge. It is two exactly with three colours. -/
theorem the_ratio_counts_the_colours (N : ℤ) :
    N * (qUp 1 ^ 2 + qDown 1 ^ 2 + qDown 1 ^ 2) = 2 * qElectron 1 ^ 2 ↔ N = 3 := by
  simp only [qUp, qDown, qElectron]; constructor <;> intro h <;> omega

/-- NO KEPT READING READS A COLOUR. -/
theorem no_kept_reading_reads_a_colour {C W : Type*} [DecidableEq C] (r : C → W)
    (h : ∀ (a b x : C), r (Equiv.swap a b x) = r x) (a b : C) : r a = r b := by
  have e := h a b a
  rw [Equiv.swap_apply_left] at e
  exact e.symm

/-! ## Part IV. The carriers. -/

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

/-! ## Part V. The binding theorem and subsumption. -/

/-- THE STRONG FORCE. -/
theorem the_strong_force :
    (∀ θ : ℤ, (∀ p : ℤ × ℤ, θ * ((-p.1) * p.2) = θ * (p.1 * p.2)) ↔ θ = 0)
    ∧ (∀ g : ℤ, OnLine swapHands (g, g))
    ∧ (∀ f : ℤ, 0 < count 3 f ↔ f ≤ 16)
    ∧ (∀ f : ℤ, 0 ≤ f → ¬ 0 < count 0 f)
    ∧ (∀ N : ℤ, N * (qUp 1 ^ 2 + qDown 1 ^ 2 + qDown 1 ^ 2) = 2 * qElectron 1 ^ 2 ↔ N = 3)
    ∧ (Module.finrank ℚ (LinearMap.ker (Matrix.traceLinearMap (Fin 3) ℚ ℚ)) = 8) :=
  ⟨fun θ => the_strong_force_reads_no_orientation (by norm_num) θ,
   fun g => (on_the_line_of_the_mirror_iff_the_hands_are_equal (g, g)).2 rfl,
   free_exactly_up_to_sixteen, a_commuting_charge_is_never_free, the_ratio_counts_the_colours, eight_three_and_none.1⟩

/-- SUBSUMPTION. Any law, on any type of states, with any fold and any reading the fold reverses, loses the term in that
reading when the fold is kept. A model of the strong force with another fold or another field is an instance. -/
theorem every_law_with_a_kept_fold_is_an_instance {X K : Type*} [CommRing K] [NoZeroDivisors K] (h2 : (2 : K) ≠ 0)
    (σ : X → X) (τ : X → K) (hodd : ∀ x, τ (σ x) = - τ x) (x₀ : X) (hx₀ : τ x₀ ≠ 0) (θ : K) :
    (∀ x, θ * τ (σ x) = θ * τ x) ↔ θ = 0 :=
  ⟨a_law_a_fold_keeps_has_no_term_the_fold_reverses h2 σ τ hodd x₀ hx₀ θ, fun h x => by rw [h, zero_mul, zero_mul]⟩


end SPHYS.StrongForce

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.StrongForce.a_kept_reading_is_one_on_the_pair' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.StrongForce.a_kept_reading_is_one_on_the_pair
/-- info: 'SPHYS.StrongForce.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.StrongForce.an_odd_reading_is_zero_on_the_line
/-- info: 'SPHYS.StrongForce.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.StrongForce.an_odd_reading_off_zero_tells_the_pair
/-- info: 'SPHYS.StrongForce.every_model_is_an_instance' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.StrongForce.every_model_is_an_instance
/-- info: 'SPHYS.StrongForce.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.StrongForce.every_reading_of_the_seat_is_a_reading_of_the_model
/--
info: 'SPHYS.StrongForce.a_law_a_fold_keeps_has_no_term_the_fold_reverses' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.StrongForce.a_law_a_fold_keeps_has_no_term_the_fold_reverses
/-- info: 'SPHYS.StrongForce.with_no_such_term_the_law_is_kept' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.StrongForce.with_no_such_term_the_law_is_kept
/-- info: 'SPHYS.StrongForce.the_twist_is_reversed_by_the_mirror' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.StrongForce.the_twist_is_reversed_by_the_mirror
/-- info: 'SPHYS.StrongForce.the_strong_force_reads_no_orientation' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.StrongForce.the_strong_force_reads_no_orientation
/-- info: 'SPHYS.StrongForce.on_the_line_of_the_mirror_iff_the_hands_are_equal' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.StrongForce.on_the_line_of_the_mirror_iff_the_hands_are_equal
/-- info: 'SPHYS.StrongForce.free_exactly_up_to_sixteen' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.StrongForce.free_exactly_up_to_sixteen
/-- info: 'SPHYS.StrongForce.free_iff_few_kinds' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.StrongForce.free_iff_few_kinds
/-- info: 'SPHYS.StrongForce.a_commuting_charge_is_never_free' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.StrongForce.a_commuting_charge_is_never_free
/-- info: 'SPHYS.StrongForce.freedom_needs_colours' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.StrongForce.freedom_needs_colours
/-- info: 'SPHYS.StrongForce.the_table_is_forced' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.StrongForce.the_table_is_forced
/-- info: 'SPHYS.StrongForce.the_charges_are_read_from_the_table' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.StrongForce.the_charges_are_read_from_the_table
/-- info: 'SPHYS.StrongForce.the_atom_is_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.StrongForce.the_atom_is_neutral
/-- info: 'SPHYS.StrongForce.the_neutron_and_the_neutrino_are_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.StrongForce.the_neutron_and_the_neutrino_are_neutral
/-- info: 'SPHYS.StrongForce.the_quark_charges_are_thirds' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.StrongForce.the_quark_charges_are_thirds
/-- info: 'SPHYS.StrongForce.the_pairs_split_by_the_step' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.StrongForce.the_pairs_split_by_the_step
/-- info: 'SPHYS.StrongForce.one_step_for_both_pairs' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.StrongForce.one_step_for_both_pairs
/-- info: 'SPHYS.StrongForce.a_triple_of_quarks_carries_a_whole_charge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.StrongForce.a_triple_of_quarks_carries_a_whole_charge
/-- info: 'SPHYS.StrongForce.a_single_quark_carries_a_part_charge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.StrongForce.a_single_quark_carries_a_part_charge
/-- info: 'SPHYS.StrongForce.the_ratio_counts_the_colours' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.StrongForce.the_ratio_counts_the_colours
/-- info: 'SPHYS.StrongForce.no_kept_reading_reads_a_colour' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.StrongForce.no_kept_reading_reads_a_colour
/-- info: 'SPHYS.StrongForce.the_count_of_the_carriers' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.StrongForce.the_count_of_the_carriers
/-- info: 'SPHYS.StrongForce.eight_three_and_none' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.StrongForce.eight_three_and_none
/--
info: 'SPHYS.StrongForce.the_commutator_of_two_is_a_carrier' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.StrongForce.the_commutator_of_two_is_a_carrier
/-- info: 'SPHYS.StrongForce.a_commuting_charge_has_no_commutator' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.StrongForce.a_commuting_charge_has_no_commutator
/-- info: 'SPHYS.StrongForce.carriers_that_do_not_commute' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.StrongForce.carriers_that_do_not_commute
/-- info: 'SPHYS.StrongForce.the_strong_force' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.StrongForce.the_strong_force
/-- info: 'SPHYS.StrongForce.every_law_with_a_kept_fold_is_an_instance' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.StrongForce.every_law_with_a_kept_fold_is_an_instance
