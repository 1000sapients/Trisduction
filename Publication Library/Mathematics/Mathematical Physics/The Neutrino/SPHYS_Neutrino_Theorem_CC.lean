/-
SPHYS_Neutrino_Theorem_CC.lean · The Neutrino as a New Mathematical Theorem. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. The neutrino is the neutral member of the lepton pair. What is forced: its charge is zero; a neutral state that
  carries a number is still not its own partner; a neutral state is read by one hand only; a mixing that loses nothing one
  way loses nothing the other; a mixing into fewer states erases. DESIGN. Part 0 the seat. Part I two labels, on any groups.
  Part II the hand, on any commutative ring. Part III mixing, on any commutative ring and any finite number of states.
  Part IV the masses. Part V the charge. RISK. Whether the neutrino carries a lepton number is an open measurement; the
  file proves the consequence of each answer and asserts neither. The masses and angles are measured.
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

namespace SPHYS.Neutrino

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

/-! ## Part I. A state with a charge and a number, on any two groups. -/

section TwoLabels
variable {Q N A : Type*} [AddGroup Q] [AddGroup N]

/-- Conjugation reverses the charge and the number and keeps the rest. -/
def conj2 (p : Q × N × A) : Q × N × A := (-p.1, -p.2.1, p.2.2)

theorem conjugation_is_a_fold (p : Q × N × A) : conj2 (conj2 p) = p := by simp [conj2]

/-- ITS OWN PARTNER EXACTLY WHEN IT CARRIES NEITHER. -/
theorem its_own_partner_iff_neutral_and_numberless (hq : ∀ v : Q, v + v = 0 → v = 0) (hn : ∀ v : N, v + v = 0 → v = 0)
    (p : Q × N × A) : OnLine conj2 p ↔ p.1 = 0 ∧ p.2.1 = 0 := by
  constructor
  · intro h
    have h1 : -p.1 = p.1 := congrArg Prod.fst h
    have h3 : -p.2.1 = p.2.1 := congrArg (fun x => x.2.1) h
    refine ⟨hq _ ?_, hn _ ?_⟩
    · nth_rewrite 1 [← h1]; exact neg_add_cancel _
    · nth_rewrite 1 [← h3]; exact neg_add_cancel _
  · rintro ⟨h1, h3⟩
    show conj2 p = p
    obtain ⟨q, n, a⟩ := p
    simp only at h1 h3
    simp [conj2, h1, h3]

/-- A NEUTRAL STATE THAT CARRIES A NUMBER IS NOT ITS OWN PARTNER, and its charge does not tell the two apart. -/
theorem neutral_with_a_number_is_two_on_one_charge (hn : ∀ v : N, v + v = 0 → v = 0) (p : Q × N × A) (h0 : p.1 = 0)
    (hL : p.2.1 ≠ 0) : conj2 p ≠ p ∧ (conj2 p).1 = p.1 := by
  refine ⟨fun h => hL (hn _ ?_), ?_⟩
  · have h3 : -p.2.1 = p.2.1 := congrArg (fun x => x.2.1) h
    nth_rewrite 1 [← h3]; exact neg_add_cancel _
  · show -p.1 = p.1
    rw [h0, neg_zero]

/-- A NEUTRAL STATE THAT IS ITS OWN PARTNER CARRIES NO NUMBER. -/
theorem its_own_partner_carries_no_number (hn : ∀ v : N, v + v = 0 → v = 0) (p : Q × N × A) (h : OnLine conj2 p) :
    p.2.1 = 0 := by
  have h3 : -p.2.1 = p.2.1 := congrArg (fun x => x.2.1) h
  apply hn
  nth_rewrite 1 [← h3]; exact neg_add_cancel _

end TwoLabels

/-! ## Part II. The hand. The neutral current reads a state of pair charge `t`, electric charge `q` and mixing `s` by
the left hand as `t − q s` and by the right hand as `−q s`. -/

section Hand
variable {R : Type*} [CommRing R]

def zLeft (t q s : R) : R := t - q * s
def zRight (_t q s : R) : R := -(q * s)
/-- The mirror exchanges the two hands. -/
def swapHands (g : R × R) : R × R := (g.2, g.1)

/-- A NEUTRAL STATE HAS NO RIGHT HAND, for every pair charge and every mixing. -/
theorem a_neutral_state_has_no_right_hand (t s : R) : zRight t 0 s = 0 := by simp [zRight]

/-- The two hands differ by the pair charge, for every charge and every mixing. -/
theorem the_hands_differ_by_the_pair_charge (t q s : R) : zLeft t q s - zRight t q s = t := by
  simp [zLeft, zRight]

/-- THE NEUTRINO IS READ BY ONE HAND. A neutral state with a pair charge is off the line of the mirror. -/
theorem a_neutral_state_is_read_by_one_hand (t s : R) (ht : t ≠ 0) :
    ¬ OnLine swapHands (zLeft t 0 s, zRight t 0 s) := by
  intro h
  have h1 : zRight t 0 s = zLeft t 0 s := congrArg Prod.fst h
  simp [zLeft, zRight] at h1
  exact ht h1.symm

end Hand

/-! ## Part III. Mixing. -/

/-- A MIXING THAT LOSES NOTHING ONE WAY LOSES NOTHING THE OTHER. For square matrices over any commutative ring, a return
on one side is a return on the other. -/
theorem a_mixing_with_a_return_loses_nothing {n R : Type*} [Fintype n] [DecidableEq n] [CommRing R]
    (U V : Matrix n n R) (h : U * V = 1) : V * U = 1 := Matrix.mul_eq_one_comm.1 h

/-- A map of the states of one finite set into itself that sends no two to one reaches every state. -/
theorem a_mixing_that_merges_none_reaches_all {S : Type*} [Finite S] (f : S → S) (hf : Function.Injective f) :
    Function.Surjective f := Finite.injective_iff_surjective.1 hf

/-- A MIXING INTO FEWER STATES ERASES. Any map from more states to fewer sends two to one. -/
theorem a_mixing_into_fewer_states_erases {S T : Type*} [Fintype S] [Fintype T] (f : S → T)
    (h : Fintype.card T < Fintype.card S) : ∃ a b, a ≠ b ∧ f a = f b := by
  by_contra hc
  push_neg at hc
  have hinj : Function.Injective f := fun a b hab => by_contra fun hne => hc a b hne hab
  exact absurd (Fintype.card_le_of_injective f hinj) (not_le.2 h)

/-! ## Part IV. The masses. -/

/-- OSCILLATION FORCES A MASS. If the squares of two masses differ, the two are not both zero. -/
theorem oscillation_forces_a_mass {K : Type*} [MulZeroClass K] (m₁ m₂ : K) (h : m₁ * m₁ ≠ m₂ * m₂) : m₁ ≠ 0 ∨ m₂ ≠ 0 := by
  by_contra hc
  push_neg at hc
  exact h (by rw [hc.1, hc.2])

/-- THREE DIFFERENCES, TWO FREE. The three differences of three squares add to zero. -/
theorem three_differences_two_free {K : Type*} [AddCommGroup K] (a b c : K) : (a - b) + (b - c) + (c - a) = 0 := by abel

/-- THE ORDERING IS ONE BIT. A difference that is not zero has exactly one of two signs. -/
theorem the_ordering_is_one_bit {K : Type*} [AddCommGroup K] [LinearOrder K] (d : K) (hd : d ≠ 0) :
    (d < 0 ∨ 0 < d) ∧ ¬ (d < 0 ∧ 0 < d) :=
  ⟨lt_or_gt_of_ne hd, fun h => lt_asymm h.1 h.2⟩

/-! ## Part V. The charge. -/

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

/-! ## Part VI. The binding theorem and subsumption. -/

/-- THE NEUTRINO. -/
theorem the_neutrino :
    (∀ yQ : ℤ, qNeutrino yQ = 0)
    ∧ (∀ p : ℤ × ℤ × Unit, p.1 = 0 → p.2.1 ≠ 0 → conj2 p ≠ p ∧ (conj2 p).1 = p.1)
    ∧ (∀ p : ℤ × ℤ × Unit, OnLine conj2 p → p.2.1 = 0)
    ∧ (∀ t s : ℤ, zRight t 0 s = 0)
    ∧ (∀ t s : ℤ, t ≠ 0 → ¬ OnLine swapHands (zLeft t 0 s, zRight t 0 s))
    ∧ (∀ U V : Matrix (Fin 3) (Fin 3) ℚ, U * V = 1 → V * U = 1) :=
  ⟨fun yQ => (the_neutron_and_the_neutrino_are_neutral yQ).2,
   fun p h0 hL => neutral_with_a_number_is_two_on_one_charge (fun v hv => by omega) p h0 hL,
   fun p h => its_own_partner_carries_no_number (fun v hv => by omega) p h,
   a_neutral_state_has_no_right_hand, a_neutral_state_is_read_by_one_hand,
   fun U V h => a_mixing_with_a_return_loses_nothing U V h⟩

/-- SUBSUMPTION. Any model of a neutral particle, carried one to one into a charge, a number and a record with the
conjugations matched, is its own partner exactly where its image carries neither charge nor number. -/
theorem every_model_of_a_neutral_particle_is_an_instance {Q N A Y : Type*} [AddGroup Q] [AddGroup N]
    (hq : ∀ v : Q, v + v = 0 → v = 0) (hn : ∀ v : N, v + v = 0 → v = 0) (τ : Y → Y) (φ : Y → Q × N × A)
    (hφ : Function.Injective φ) (heq : ∀ y, φ (τ y) = conj2 (φ y)) (y : Y) :
    OnLine τ y ↔ (φ y).1 = 0 ∧ (φ y).2.1 = 0 :=
  (every_model_is_an_instance conj2 τ φ hφ heq y).trans (its_own_partner_iff_neutral_and_numberless hq hn (φ y))


end SPHYS.Neutrino

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.Neutrino.a_kept_reading_is_one_on_the_pair' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Neutrino.a_kept_reading_is_one_on_the_pair
/-- info: 'SPHYS.Neutrino.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Neutrino.an_odd_reading_is_zero_on_the_line
/-- info: 'SPHYS.Neutrino.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Neutrino.an_odd_reading_off_zero_tells_the_pair
/-- info: 'SPHYS.Neutrino.every_model_is_an_instance' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Neutrino.every_model_is_an_instance
/-- info: 'SPHYS.Neutrino.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Neutrino.every_reading_of_the_seat_is_a_reading_of_the_model
/-- info: 'SPHYS.Neutrino.conjugation_is_a_fold' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Neutrino.conjugation_is_a_fold
/-- info: 'SPHYS.Neutrino.its_own_partner_iff_neutral_and_numberless' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Neutrino.its_own_partner_iff_neutral_and_numberless
/-- info: 'SPHYS.Neutrino.neutral_with_a_number_is_two_on_one_charge' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Neutrino.neutral_with_a_number_is_two_on_one_charge
/-- info: 'SPHYS.Neutrino.its_own_partner_carries_no_number' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Neutrino.its_own_partner_carries_no_number
/-- info: 'SPHYS.Neutrino.a_neutral_state_has_no_right_hand' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Neutrino.a_neutral_state_has_no_right_hand
/-- info: 'SPHYS.Neutrino.the_hands_differ_by_the_pair_charge' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Neutrino.the_hands_differ_by_the_pair_charge
/-- info: 'SPHYS.Neutrino.a_neutral_state_is_read_by_one_hand' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Neutrino.a_neutral_state_is_read_by_one_hand
/--
info: 'SPHYS.Neutrino.a_mixing_with_a_return_loses_nothing' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Neutrino.a_mixing_with_a_return_loses_nothing
/--
info: 'SPHYS.Neutrino.a_mixing_that_merges_none_reaches_all' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Neutrino.a_mixing_that_merges_none_reaches_all
/--
info: 'SPHYS.Neutrino.a_mixing_into_fewer_states_erases' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Neutrino.a_mixing_into_fewer_states_erases
/-- info: 'SPHYS.Neutrino.oscillation_forces_a_mass' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutrino.oscillation_forces_a_mass
/-- info: 'SPHYS.Neutrino.three_differences_two_free' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Neutrino.three_differences_two_free
/-- info: 'SPHYS.Neutrino.the_ordering_is_one_bit' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Neutrino.the_ordering_is_one_bit
/-- info: 'SPHYS.Neutrino.the_table_is_forced' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutrino.the_table_is_forced
/-- info: 'SPHYS.Neutrino.the_charges_are_read_from_the_table' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutrino.the_charges_are_read_from_the_table
/-- info: 'SPHYS.Neutrino.the_atom_is_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutrino.the_atom_is_neutral
/-- info: 'SPHYS.Neutrino.the_neutron_and_the_neutrino_are_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutrino.the_neutron_and_the_neutrino_are_neutral
/-- info: 'SPHYS.Neutrino.the_quark_charges_are_thirds' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutrino.the_quark_charges_are_thirds
/-- info: 'SPHYS.Neutrino.the_pairs_split_by_the_step' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutrino.the_pairs_split_by_the_step
/-- info: 'SPHYS.Neutrino.one_step_for_both_pairs' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutrino.one_step_for_both_pairs
/-- info: 'SPHYS.Neutrino.a_triple_of_quarks_carries_a_whole_charge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutrino.a_triple_of_quarks_carries_a_whole_charge
/-- info: 'SPHYS.Neutrino.a_single_quark_carries_a_part_charge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutrino.a_single_quark_carries_a_part_charge
/-- info: 'SPHYS.Neutrino.the_neutrino' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutrino.the_neutrino
/-- info: 'SPHYS.Neutrino.every_model_of_a_neutral_particle_is_an_instance' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Neutrino.every_model_of_a_neutral_particle_is_an_instance
