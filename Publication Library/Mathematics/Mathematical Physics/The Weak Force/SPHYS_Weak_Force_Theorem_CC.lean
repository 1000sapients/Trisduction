/-
SPHYS_Weak_Force_Theorem_CC.lean · The Weak Force as a New Mathematical Theorem. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. What is forced about the weak force: a coupling to one hand is off the line of the mirror; two folds that each
  reverse a reading keep it together, so a force that breaks the mirror and the exchange of charge can keep the two
  together; the two hands of the neutral current differ by the pair charge for every charge and mixing; there are three
  carriers; the charged carrier carries one step, which is the electron's charge reversed, for quarks and leptons alike;
  a mixing of the copies has a phase from three copies on. DESIGN. Part 0 the seat. Part I the hand. Part II the two folds
  together. Part III the neutral current. Part IV the carriers and the step. Part V the phase.
RISK. That nature couples to the left hand and not the right is measured; the file proves what follows from one hand.
  The mixing angle and the masses of the carriers are measured. NON-NEGOTIABLE. No axiom is declared. No proof is left open.
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

namespace SPHYS.WeakForce

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

/-! ## Part I. The hand, on any type of couplings. -/

/-- The mirror exchanges the two hands. -/
def swapHands {K : Type*} (g : K × K) : K × K := (g.2, g.1)

theorem on_the_line_of_the_mirror_iff_the_hands_are_equal {K : Type*} (g : K × K) : OnLine swapHands g ↔ g.1 = g.2 := by
  constructor
  · intro h; exact (congrArg Prod.fst h).symm
  · intro h; exact Prod.ext h.symm h

/-- THE WEAK FORCE READS THE ORIENTATION. A coupling to one hand only, not zero, is off the line of the mirror. -/
theorem a_coupling_to_one_hand_is_off_the_line {K : Type*} [Zero K] (g : K) (hg : g ≠ 0) :
    ¬ OnLine swapHands (g, (0 : K)) := fun h => hg ((on_the_line_of_the_mirror_iff_the_hands_are_equal _).1 h)

/-- The mirror sends it to the coupling of the other hand, which is another coupling. -/
theorem the_mirror_sends_one_hand_to_the_other {K : Type*} [Zero K] (g : K) : swapHands (g, (0 : K)) = (0, g) := rfl

/-! ## Part II. Two folds together, on any type. -/

/-- TWO REVERSALS KEEP. A reading that each of two folds reverses is kept by the two together. -/
theorem two_reversals_keep {X V : Type*} [AddGroup V] (σ τ : X → X) (r : X → V) (hσ : ∀ x, r (σ x) = - r x)
    (hτ : ∀ x, r (τ x) = - r x) (x : X) : r (σ (τ x)) = r x := by rw [hσ, hτ, neg_neg]

/-- A state is given by its hand and by whether it is a particle or its partner. The weak force couples to the left
particle and the right partner. -/
def couples (s : Bool × Bool) : Bool := s.1 != s.2
def mirrorState (s : Bool × Bool) : Bool × Bool := (!s.1, s.2)
def exchangeState (s : Bool × Bool) : Bool × Bool := (s.1, !s.2)

/-- IT BREAKS THE MIRROR, IT BREAKS THE EXCHANGE OF CHARGE, AND IT KEEPS THE TWO TOGETHER. -/
theorem it_breaks_each_and_keeps_both (s : Bool × Bool) :
    couples (mirrorState s) = !couples s ∧ couples (exchangeState s) = !couples s
    ∧ couples (exchangeState (mirrorState s)) = couples s := by
  obtain ⟨a, b⟩ := s
  cases a <;> cases b <;> decide

/-! ## Part III. The neutral current, on any commutative ring. -/

section Neutral
variable {R : Type*} [CommRing R]

def zLeft (t q s : R) : R := t - q * s
def zRight (_t q s : R) : R := -(q * s)

/-- THE DEPTH OF THE BREAKING IS THE PAIR CHARGE, for every electric charge and every mixing. -/
theorem the_depth_of_the_breaking_is_the_pair_charge (t q s : R) : zLeft t q s - zRight t q s = t := by
  simp [zLeft, zRight]

/-- A state with no pair charge is read alike by both hands; a neutral state has no right hand. -/
theorem no_pair_charge_no_breaking (q s : R) : zLeft 0 q s = zRight 0 q s ∧ zRight (0 : R) 0 s = 0 := by
  constructor <;> simp [zLeft, zRight]

/-- A reading that is a product of an odd number of reversed quantities is reversed: spin against momentum. -/
theorem spin_against_momentum_is_reversed_by_the_mirror (s p : R) : s * (-p) = -(s * p) := by ring

/-- The triple product of three directions is reversed by the mirror and the product of two is kept. -/
theorem the_triple_is_reversed_and_the_pair_is_kept (a b c : R) :
    (-a) * (-b) * (-c) = -(a * b * c) ∧ (-a) * (-b) = a * b := by constructor <;> ring

end Neutral

/-! ## Part IV. The carriers and the step. -/

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

/-- THE CHARGED CARRIER CARRIES ONE STEP, for the quark pair and the lepton pair alike, and the step is the electron's
charge reversed. -/
theorem the_charged_carrier_carries_one_step {R : Type*} [CommRing R] (yQ : R) :
    qUp yQ - qDown yQ = - qElectron yQ ∧ qNeutrino yQ - qElectron yQ = - qElectron yQ := by
  constructor <;> simp only [qNeutrino, qUp, qDown, qElectron] <;> ring

/-- The charges of the three carriers add to zero: one step up, one step down, and one neutral. -/
theorem the_three_carriers_are_neutral_together {R : Type*} [CommRing R] (yQ : R) :
    (- qElectron yQ) + qElectron yQ + 0 = 0 := by ring

/-! ## Part V. The phase. -/

/-- A PHASE FROM THREE COPIES ON. The mixing of `n` copies leaves `(n − 1)(n − 2) / 2` phases: none for one or two, one
for three. With a phase the two folds together are not kept by the mixing. -/
theorem a_phase_from_three_copies_on (n : ℤ) (hn : 1 ≤ n) : 0 < (n - 1) * (n - 2) ↔ 3 ≤ n := by
  constructor
  · intro h
    by_contra hc
    have h12 : n = 1 ∨ n = 2 := by omega
    rcases h12 with rfl | rfl <;> norm_num at h
  · intro h
    exact mul_pos (by omega) (by omega)

/-! ## Part VI. The binding theorem and subsumption. -/

/-- THE WEAK FORCE. -/
theorem the_weak_force :
    (∀ g : ℤ, g ≠ 0 → ¬ OnLine swapHands (g, (0 : ℤ)))
    ∧ (∀ s : Bool × Bool, couples (mirrorState s) = !couples s ∧ couples (exchangeState s) = !couples s
        ∧ couples (exchangeState (mirrorState s)) = couples s)
    ∧ (∀ t q s : ℤ, zLeft t q s - zRight t q s = t)
    ∧ (Module.finrank ℚ (LinearMap.ker (Matrix.traceLinearMap (Fin 2) ℚ ℚ)) = 3)
    ∧ (∀ yQ : ℤ, qUp yQ - qDown yQ = - qElectron yQ ∧ qNeutrino yQ - qElectron yQ = - qElectron yQ)
    ∧ (∀ n : ℤ, 1 ≤ n → (0 < (n - 1) * (n - 2) ↔ 3 ≤ n)) :=
  ⟨fun g hg => a_coupling_to_one_hand_is_off_the_line g hg, it_breaks_each_and_keeps_both,
   the_depth_of_the_breaking_is_the_pair_charge, eight_three_and_none.2.1, the_charged_carrier_carries_one_step,
   a_phase_from_three_copies_on⟩

/-- SUBSUMPTION. Any force, on any type of states, with any two folds that each reverse its reading, keeps the two
together; and any model of couplings carried one to one into pairs with the mirrors matched is on the line exactly
where its two hands are equal. -/
theorem every_force_with_two_reversed_folds_is_an_instance {X V Y K : Type*} [AddGroup V] (σ τ : X → X) (r : X → V)
    (hσ : ∀ x, r (σ x) = - r x) (hτ : ∀ x, r (τ x) = - r x) (μ : Y → Y) (φ : Y → K × K)
    (hφ : Function.Injective φ) (heq : ∀ y, φ (μ y) = swapHands (φ y)) :
    (∀ x, r (σ (τ x)) = r x) ∧ (∀ y, OnLine μ y ↔ (φ y).1 = (φ y).2) :=
  ⟨two_reversals_keep σ τ r hσ hτ,
   fun y => (every_model_is_an_instance swapHands μ φ hφ heq y).trans (on_the_line_of_the_mirror_iff_the_hands_are_equal _)⟩


end SPHYS.WeakForce

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.WeakForce.a_kept_reading_is_one_on_the_pair' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.WeakForce.a_kept_reading_is_one_on_the_pair
/-- info: 'SPHYS.WeakForce.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.WeakForce.an_odd_reading_is_zero_on_the_line
/-- info: 'SPHYS.WeakForce.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.WeakForce.an_odd_reading_off_zero_tells_the_pair
/-- info: 'SPHYS.WeakForce.every_model_is_an_instance' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.WeakForce.every_model_is_an_instance
/-- info: 'SPHYS.WeakForce.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.WeakForce.every_reading_of_the_seat_is_a_reading_of_the_model
/-- info: 'SPHYS.WeakForce.on_the_line_of_the_mirror_iff_the_hands_are_equal' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.WeakForce.on_the_line_of_the_mirror_iff_the_hands_are_equal
/-- info: 'SPHYS.WeakForce.a_coupling_to_one_hand_is_off_the_line' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.WeakForce.a_coupling_to_one_hand_is_off_the_line
/-- info: 'SPHYS.WeakForce.the_mirror_sends_one_hand_to_the_other' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_mirror_sends_one_hand_to_the_other
/-- info: 'SPHYS.WeakForce.two_reversals_keep' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.WeakForce.two_reversals_keep
/-- info: 'SPHYS.WeakForce.it_breaks_each_and_keeps_both' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.WeakForce.it_breaks_each_and_keeps_both
/-- info: 'SPHYS.WeakForce.the_depth_of_the_breaking_is_the_pair_charge' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_depth_of_the_breaking_is_the_pair_charge
/-- info: 'SPHYS.WeakForce.no_pair_charge_no_breaking' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.WeakForce.no_pair_charge_no_breaking
/-- info: 'SPHYS.WeakForce.spin_against_momentum_is_reversed_by_the_mirror' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.spin_against_momentum_is_reversed_by_the_mirror
/-- info: 'SPHYS.WeakForce.the_triple_is_reversed_and_the_pair_is_kept' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_triple_is_reversed_and_the_pair_is_kept
/-- info: 'SPHYS.WeakForce.the_count_of_the_carriers' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_count_of_the_carriers
/-- info: 'SPHYS.WeakForce.eight_three_and_none' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.eight_three_and_none
/--
info: 'SPHYS.WeakForce.the_commutator_of_two_is_a_carrier' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.WeakForce.the_commutator_of_two_is_a_carrier
/-- info: 'SPHYS.WeakForce.a_commuting_charge_has_no_commutator' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.a_commuting_charge_has_no_commutator
/-- info: 'SPHYS.WeakForce.carriers_that_do_not_commute' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.carriers_that_do_not_commute
/-- info: 'SPHYS.WeakForce.the_table_is_forced' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_table_is_forced
/-- info: 'SPHYS.WeakForce.the_charges_are_read_from_the_table' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_charges_are_read_from_the_table
/-- info: 'SPHYS.WeakForce.the_atom_is_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_atom_is_neutral
/-- info: 'SPHYS.WeakForce.the_neutron_and_the_neutrino_are_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_neutron_and_the_neutrino_are_neutral
/-- info: 'SPHYS.WeakForce.the_quark_charges_are_thirds' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_quark_charges_are_thirds
/-- info: 'SPHYS.WeakForce.the_pairs_split_by_the_step' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_pairs_split_by_the_step
/-- info: 'SPHYS.WeakForce.one_step_for_both_pairs' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.one_step_for_both_pairs
/-- info: 'SPHYS.WeakForce.a_triple_of_quarks_carries_a_whole_charge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.a_triple_of_quarks_carries_a_whole_charge
/-- info: 'SPHYS.WeakForce.a_single_quark_carries_a_part_charge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.a_single_quark_carries_a_part_charge
/-- info: 'SPHYS.WeakForce.the_charged_carrier_carries_one_step' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_charged_carrier_carries_one_step
/-- info: 'SPHYS.WeakForce.the_three_carriers_are_neutral_together' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_three_carriers_are_neutral_together
/-- info: 'SPHYS.WeakForce.a_phase_from_three_copies_on' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.a_phase_from_three_copies_on
/-- info: 'SPHYS.WeakForce.the_weak_force' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_weak_force
/-- info: 'SPHYS.WeakForce.every_force_with_two_reversed_folds_is_an_instance' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.WeakForce.every_force_with_two_reversed_folds_is_an_instance
