/-
SPHYS_Neutron_Theorem_CC.lean · The Neutron as a New Mathematical Theorem. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. The neutron is the lock with one up quark and two down. What is forced: it is neutral; it carries a number and so
  is not its own partner; if it becomes a proton, what leaves with the proton carries the electron's charge and no lepton
  number, so it is not one lepton, it is an even number of them, and it is not one half spin. DESIGN. Part 0 the seat.
  Part I the charge. Part II the neutral lock with a number. Part III the channel: the table of one lepton pair, then any
  list of leptons. Part IV the spin. RISK. That the neutron is heavy enough to decay is measured and enters no theorem.
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

namespace SPHYS.Neutron

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

/-! ## Part I. The charge. -/

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

/-! ## Part II. The neutral lock with a number, on any two groups. -/

/-- NEUTRAL AND NOT ITS OWN PARTNER. A state with no charge and a number that is not zero differs from its partner, and
the charge does not tell the two apart. -/
theorem neutral_and_not_its_own_partner {Q N : Type*} [AddGroup Q] [AddGroup N] (hn : ∀ v : N, v + v = 0 → v = 0)
    (q : Q) (b : N) (hq : q = 0) (hb : b ≠ 0) : ((-q, -b) : Q × N) ≠ (q, b) ∧ -q = q := by
  refine ⟨fun h => hb (hn _ ?_), by rw [hq, neg_zero]⟩
  have h3 : -b = b := congrArg Prod.snd h
  nth_rewrite 1 [← h3]; exact neg_add_cancel _

/-! ## Part III. The channel. One lepton pair: the electron, its partner, the neutral member, its partner. Charges are in
units of the electron's charge reversed. -/

inductive Lep | e | ebar | nu | nubar
  deriving DecidableEq, Repr

def Lep.q : Lep → ℤ
  | .e => -1 | .ebar => 1 | .nu => 0 | .nubar => 0
def Lep.L : Lep → ℤ
  | .e => 1 | .ebar => -1 | .nu => 1 | .nubar => -1

/-- THE ELECTRON DOES NOT LEAVE ALONE. No one lepton carries the charge that must leave and no lepton number. -/
theorem the_electron_does_not_leave_alone : ∀ x : Lep, ¬ (x.q = -1 ∧ x.L = 0) := by
  intro x; cases x <;> decide

/-- THE ONE PAIR. Two leptons carry that charge and no lepton number exactly when they are the electron and the partner
of the neutral member. -/
theorem the_one_pair : ∀ x y : Lep,
    (x.q + y.q = -1 ∧ x.L + y.L = 0) ↔ ((x = Lep.e ∧ y = Lep.nubar) ∨ (x = Lep.nubar ∧ y = Lep.e)) := by
  intro x y; cases x <;> cases y <;> decide

/-- In any list of numbers each odd, the total and the length are of one parity. -/
theorem the_total_of_odds_has_the_parity_of_the_count (l : List ℤ) (h : ∀ x ∈ l, Odd x) :
    Even (l.sum - (l.length : ℤ)) := by
  induction l with
  | nil => simp
  | cons x l ih =>
    obtain ⟨a, ha⟩ := h x (by simp)
    obtain ⟨b, hb⟩ := ih (fun y hy => h y (by simp [hy]))
    refine ⟨a + b, ?_⟩
    simp only [List.sum_cons, List.length_cons, Nat.cast_add, Nat.cast_one]
    omega

/-- THE LEPTONS LEAVE IN EVEN NUMBER. Any list of states each carrying an odd lepton number, with total zero, has even
length: for any table of leptons and any number of generations. -/
theorem the_leptons_leave_in_even_number (l : List ℤ) (h : ∀ x ∈ l, Odd x) (hs : l.sum = 0) : Even l.length := by
  obtain ⟨b, hb⟩ := the_total_of_odds_has_the_parity_of_the_count l h
  rw [hs] at hb
  have h2 : Even ((l.length : ℤ)) := ⟨-b, by omega⟩
  exact (Int.even_coe_nat _).1 h2

/-- And not in number zero, since a charge must leave. -/
theorem something_leaves (l : List ℤ) (hq : l.sum ≠ 0) : l ≠ [] := by
  rintro rfl; exact hq rfl

/-! ## Part IV. The spin. Twice a half spin is odd. -/

/-- NOT TWO BODIES. A half spin does not become two half spins. -/
theorem a_half_does_not_become_two_halves (a b c : ℤ) (ha : Odd a) (hb : Odd b) (hc : Odd c) : a ≠ b + c := by
  obtain ⟨x, hx⟩ := ha; obtain ⟨y, hy⟩ := hb; obtain ⟨z, hz⟩ := hc
  omega

/-- Three bodies can: a half spin may become three half spins. -/
theorem a_half_may_become_three_halves : ∃ a b c d : ℤ, Odd a ∧ Odd b ∧ Odd c ∧ Odd d ∧ a = b + c + d :=
  ⟨1, 1, 1, -1, by decide, by decide, by decide, by decide, by norm_num⟩

/-! ## Part V. The binding theorem and subsumption. -/

/-- THE NEUTRON. -/
theorem the_neutron :
    (∀ yQ : ℤ, qNeutron yQ = 0)
    ∧ (∀ yQ : ℤ, qNeutron yQ - qProton yQ = qElectron yQ)
    ∧ (∀ b : ℤ, b ≠ 0 → (((-(0:ℤ)), -b) : ℤ × ℤ) ≠ (0, b))
    ∧ (∀ x : Lep, ¬ (x.q = -1 ∧ x.L = 0))
    ∧ (∀ x y : Lep, (x.q + y.q = -1 ∧ x.L + y.L = 0) ↔ ((x = Lep.e ∧ y = Lep.nubar) ∨ (x = Lep.nubar ∧ y = Lep.e)))
    ∧ (∀ l : List ℤ, (∀ x ∈ l, Odd x) → l.sum = 0 → Even l.length)
    ∧ (∀ a b c : ℤ, Odd a → Odd b → Odd c → a ≠ b + c) :=
  ⟨fun yQ => (the_neutron_and_the_neutrino_are_neutral yQ).1,
   fun yQ => by simp only [qNeutron, qProton, qUp, qDown, qElectron]; ring,
   fun b hb => (neutral_and_not_its_own_partner (fun v hv => by omega) (0:ℤ) b rfl hb).1,
   the_electron_does_not_leave_alone, the_one_pair, the_leptons_leave_in_even_number,
   a_half_does_not_become_two_halves⟩

/-- SUBSUMPTION. Any table of leptons, with any number of generations and any further neutral states, whose lepton
numbers are odd, obeys the even count: a model with more generations is an instance. -/
theorem every_table_of_leptons_is_an_instance {P : Type*} (L : P → ℤ) (hodd : ∀ p, Odd (L p)) (out : List P)
    (h0 : (out.map L).sum = 0) : Even out.length := by
  have h := the_leptons_leave_in_even_number (out.map L) (by
    intro v hv
    obtain ⟨x, _, rfl⟩ := List.mem_map.1 hv
    exact hodd x) h0
  rwa [List.length_map] at h


end SPHYS.Neutron

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.Neutron.a_kept_reading_is_one_on_the_pair' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Neutron.a_kept_reading_is_one_on_the_pair
/-- info: 'SPHYS.Neutron.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Neutron.an_odd_reading_is_zero_on_the_line
/-- info: 'SPHYS.Neutron.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Neutron.an_odd_reading_off_zero_tells_the_pair
/-- info: 'SPHYS.Neutron.every_model_is_an_instance' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Neutron.every_model_is_an_instance
/-- info: 'SPHYS.Neutron.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Neutron.every_reading_of_the_seat_is_a_reading_of_the_model
/-- info: 'SPHYS.Neutron.the_table_is_forced' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutron.the_table_is_forced
/-- info: 'SPHYS.Neutron.the_charges_are_read_from_the_table' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutron.the_charges_are_read_from_the_table
/-- info: 'SPHYS.Neutron.the_atom_is_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutron.the_atom_is_neutral
/-- info: 'SPHYS.Neutron.the_neutron_and_the_neutrino_are_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutron.the_neutron_and_the_neutrino_are_neutral
/-- info: 'SPHYS.Neutron.the_quark_charges_are_thirds' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutron.the_quark_charges_are_thirds
/-- info: 'SPHYS.Neutron.the_pairs_split_by_the_step' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutron.the_pairs_split_by_the_step
/-- info: 'SPHYS.Neutron.one_step_for_both_pairs' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutron.one_step_for_both_pairs
/-- info: 'SPHYS.Neutron.a_triple_of_quarks_carries_a_whole_charge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutron.a_triple_of_quarks_carries_a_whole_charge
/-- info: 'SPHYS.Neutron.a_single_quark_carries_a_part_charge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutron.a_single_quark_carries_a_part_charge
/-- info: 'SPHYS.Neutron.neutral_and_not_its_own_partner' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Neutron.neutral_and_not_its_own_partner
/-- info: 'SPHYS.Neutron.the_electron_does_not_leave_alone' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Neutron.the_electron_does_not_leave_alone
/-- info: 'SPHYS.Neutron.the_one_pair' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Neutron.the_one_pair
/-- info: 'SPHYS.Neutron.the_total_of_odds_has_the_parity_of_the_count' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutron.the_total_of_odds_has_the_parity_of_the_count
/-- info: 'SPHYS.Neutron.the_leptons_leave_in_even_number' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutron.the_leptons_leave_in_even_number
/-- info: 'SPHYS.Neutron.something_leaves' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Neutron.something_leaves
/-- info: 'SPHYS.Neutron.a_half_does_not_become_two_halves' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutron.a_half_does_not_become_two_halves
/-- info: 'SPHYS.Neutron.a_half_may_become_three_halves' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutron.a_half_may_become_three_halves
/-- info: 'SPHYS.Neutron.the_neutron' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutron.the_neutron
/-- info: 'SPHYS.Neutron.every_table_of_leptons_is_an_instance' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Neutron.every_table_of_leptons_is_an_instance
