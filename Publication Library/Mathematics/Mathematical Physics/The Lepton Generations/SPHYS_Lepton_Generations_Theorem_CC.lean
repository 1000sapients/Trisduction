/-
SPHYS_Lepton_Generations_Theorem_CC.lean · The Lepton Generations as a New Mathematical Theorem. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. What is forced about the copies of the lepton pair: each copy closes its own table, a total over copies can hide a
  failure, copies with one unit have one table, a number carried by one copy cannot be left with none, and the mixing of
  the copies carries a phase from three copies on and from no fewer. DESIGN. Part 0 the seat. Part I the charge. Part II the
  copies, on any index. Part III the count of the phases, in any number of copies. Part IV the family number.
RISK. The number of copies in nature is measured; the file proves that three is the least with a phase and does not prove
  that there are three. The counts of Part III are the counts of the parameters of a unitary matrix, written out and summed.
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

namespace SPHYS.LeptonGenerations

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

/-! ## Part II. The copies, on any index and any commutative ring. -/

section Copies
variable {ι R : Type*} [CommRing R]

/-- EACH GENERATION CLOSES ALONE. If every copy satisfies the five equations, every copy carries the table. -/
theorem each_generation_closes_alone (yQ yu yd yL ye yH : ι → R)
    (Yu : ∀ g, yQ g + yu g + yH g = 0) (Yd : ∀ g, yQ g + yd g - yH g = 0) (Ye : ∀ g, yL g + ye g - yH g = 0)
    (iso : ∀ g, 3 * yQ g + yL g = 0) (grav : ∀ g, 6 * yQ g + 3 * yu g + 3 * yd g + 2 * yL g + ye g = 0) (g : ι) :
    yL g = -3 * yQ g ∧ ye g = 6 * yQ g ∧ -ye g = qElectron (yQ g) ∧ yL g + yH g = 0 := by
  obtain ⟨_, _, h3, h4, h5⟩ := the_table_is_forced _ _ _ _ _ _ (Yu g) (Yd g) (Ye g) (iso g) (grav g)
  refine ⟨h3, h4, ?_, ?_⟩
  · simp only [qElectron]; linear_combination -h4
  · linear_combination h3 + h5

/-- ONE UNIT, ONE TABLE. Two copies with the same charge of the quark pair have the same charges throughout. -/
theorem copies_with_one_unit_have_one_table (yQ yu yd yL ye yH : ι → R)
    (Yu : ∀ g, yQ g + yu g + yH g = 0) (Yd : ∀ g, yQ g + yd g - yH g = 0) (Ye : ∀ g, yL g + ye g - yH g = 0)
    (iso : ∀ g, 3 * yQ g + yL g = 0) (grav : ∀ g, 6 * yQ g + 3 * yu g + 3 * yd g + 2 * yL g + ye g = 0)
    (g g' : ι) (h : yQ g = yQ g') : yu g = yu g' ∧ yd g = yd g' ∧ yL g = yL g' ∧ ye g = ye g' ∧ yH g = yH g' := by
  obtain ⟨a1, a2, a3, a4, a5⟩ := the_table_is_forced _ _ _ _ _ _ (Yu g) (Yd g) (Ye g) (iso g) (grav g)
  obtain ⟨b1, b2, b3, b4, b5⟩ := the_table_is_forced _ _ _ _ _ _ (Yu g') (Yd g') (Ye g') (iso g') (grav g')
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · rw [a1, b1, h]
  · rw [a2, b2, h]
  · rw [a3, b3, h]
  · rw [a4, b4, h]
  · rw [a5, b5, h]

end Copies

/-- A TOTAL CAN HIDE A FAILURE. Two copies whose totals satisfy the closure of the lepton pair while neither copy does. -/
theorem a_total_can_hide_a_failure :
    ∃ yQ yL : Fin 2 → ℤ, (3 * (yQ 0 + yQ 1) + (yL 0 + yL 1) = 0) ∧ 3 * yQ 0 + yL 0 ≠ 0 ∧ 3 * yQ 1 + yL 1 ≠ 0 := by
  refine ⟨![1, 1], ![-2, -4], ?_, ?_, ?_⟩ <;> simp

/-! ## Part III. The phases of the mixing of `n` copies. A unitary matrix of size `n` has `n²` real numbers; `n (n − 1) / 2`
are angles; `2 n − 1` phases are removed by renaming the states. -/

/-- THE COUNT. What is left is `(n − 1)(n − 2) / 2` phases. -/
theorem the_count_of_the_phases (n : ℤ) : 2 * (n * n) - n * (n - 1) - 2 * (2 * n - 1) = (n - 1) * (n - 2) := by ring

/-- THREE IS THE LEAST WITH A PHASE. For one copy or more, a phase is left exactly from three copies on. -/
theorem three_is_the_least_with_a_phase (n : ℤ) (hn : 1 ≤ n) : 0 < (n - 1) * (n - 2) ↔ 3 ≤ n := by
  constructor
  · intro h
    by_contra hc
    have h12 : n = 1 ∨ n = 2 := by omega
    rcases h12 with rfl | rfl <;> norm_num at h
  · intro h
    exact mul_pos (by omega) (by omega)

/-- One, two and three copies leave none, none and one. -/
theorem none_none_and_one : ((1 : ℤ) - 1) * (1 - 2) = 0 ∧ ((2 : ℤ) - 1) * (2 - 2) = 0 ∧ ((3 : ℤ) - 1) * (3 - 2) = 2 * 1 := by
  refine ⟨?_, ?_, ?_⟩ <;> norm_num

/-! ## Part IV. The family number, on any group of values. -/

/-- A list of zeros sums to zero. -/
theorem a_total_of_zeros_is_zero {V : Type*} [AddMonoid V] (l : List V) (h : ∀ x ∈ l, x = 0) : l.sum = 0 := by
  induction l with
  | nil => rfl
  | cons x l ih =>
    rw [List.sum_cons, h x (by simp), ih (fun y hy => h y (by simp [hy])), add_zero]

/-- A NUMBER CARRIED BY ONE CANNOT BE LEFT WITH NONE. Where a number is kept, a state that carries it does not become any
set of states none of which carries it. -/
theorem a_number_carried_cannot_be_left_with_none {P V : Type*} [AddMonoid V] (ℓ : P → V) (p : P) (hp : ℓ p ≠ 0)
    (out : List P) (hout : ∀ x ∈ out, ℓ x = 0) : (out.map ℓ).sum ≠ ℓ p := by
  rw [a_total_of_zeros_is_zero (out.map ℓ) (by
    intro v hv
    obtain ⟨x, hx, rfl⟩ := List.mem_map.1 hv
    exact hout x hx)]
  exact fun h => hp h.symm

/-- The total of a number over two sets of states taken together is the sum of the totals. -/
theorem the_number_adds {P V : Type*} [AddMonoid V] (ℓ : P → V) (a b : List P) :
    ((a ++ b).map ℓ).sum = (a.map ℓ).sum + (b.map ℓ).sum := by
  rw [List.map_append, List.sum_append]

/-! ## Part V. The binding theorem and subsumption. -/

/-- THE LEPTON GENERATIONS. -/
theorem the_lepton_generations :
    (∀ (yQ yu yd yL ye yH : ℕ → ℤ), (∀ g, yQ g + yu g + yH g = 0) → (∀ g, yQ g + yd g - yH g = 0)
        → (∀ g, yL g + ye g - yH g = 0) → (∀ g, 3 * yQ g + yL g = 0)
        → (∀ g, 6 * yQ g + 3 * yu g + 3 * yd g + 2 * yL g + ye g = 0)
        → ∀ g, yL g = -3 * yQ g ∧ ye g = 6 * yQ g ∧ -ye g = qElectron (yQ g) ∧ yL g + yH g = 0)
    ∧ (∀ n : ℤ, 1 ≤ n → (0 < (n - 1) * (n - 2) ↔ 3 ≤ n))
    ∧ (∀ (ℓ : ℕ → ℤ) (p : ℕ), ℓ p ≠ 0 → ∀ out : List ℕ, (∀ x ∈ out, ℓ x = 0) → (out.map ℓ).sum ≠ ℓ p) :=
  ⟨fun yQ yu yd yL ye yH a b c d e g => each_generation_closes_alone yQ yu yd yL ye yH a b c d e g,
   three_is_the_least_with_a_phase, fun ℓ p hp out hout => a_number_carried_cannot_be_left_with_none ℓ p hp out hout⟩

/-- SUBSUMPTION. Any model of the copies, on any index, carried into this one by any map of the indices, closes copy
by copy as this one does. -/
theorem every_model_of_the_generations_is_an_instance {ι κ R : Type*} [CommRing R] (f : κ → ι) (yQ yu yd yL ye yH : ι → R)
    (Yu : ∀ g, yQ g + yu g + yH g = 0) (Yd : ∀ g, yQ g + yd g - yH g = 0) (Ye : ∀ g, yL g + ye g - yH g = 0)
    (iso : ∀ g, 3 * yQ g + yL g = 0) (grav : ∀ g, 6 * yQ g + 3 * yu g + 3 * yd g + 2 * yL g + ye g = 0) (k : κ) :
    yL (f k) = -3 * yQ (f k) ∧ ye (f k) = 6 * yQ (f k) :=
  ⟨(each_generation_closes_alone yQ yu yd yL ye yH Yu Yd Ye iso grav (f k)).1,
   (each_generation_closes_alone yQ yu yd yL ye yH Yu Yd Ye iso grav (f k)).2.1⟩


end SPHYS.LeptonGenerations

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.LeptonGenerations.a_kept_reading_is_one_on_the_pair' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.a_kept_reading_is_one_on_the_pair
/-- info: 'SPHYS.LeptonGenerations.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.an_odd_reading_is_zero_on_the_line
/-- info: 'SPHYS.LeptonGenerations.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.an_odd_reading_off_zero_tells_the_pair
/-- info: 'SPHYS.LeptonGenerations.every_model_is_an_instance' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.every_model_is_an_instance
/-- info: 'SPHYS.LeptonGenerations.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.every_reading_of_the_seat_is_a_reading_of_the_model
/-- info: 'SPHYS.LeptonGenerations.the_table_is_forced' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.the_table_is_forced
/-- info: 'SPHYS.LeptonGenerations.the_charges_are_read_from_the_table' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.the_charges_are_read_from_the_table
/-- info: 'SPHYS.LeptonGenerations.the_atom_is_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.the_atom_is_neutral
/-- info: 'SPHYS.LeptonGenerations.the_neutron_and_the_neutrino_are_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.the_neutron_and_the_neutrino_are_neutral
/-- info: 'SPHYS.LeptonGenerations.the_quark_charges_are_thirds' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.the_quark_charges_are_thirds
/-- info: 'SPHYS.LeptonGenerations.the_pairs_split_by_the_step' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.the_pairs_split_by_the_step
/-- info: 'SPHYS.LeptonGenerations.one_step_for_both_pairs' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.one_step_for_both_pairs
/--
info: 'SPHYS.LeptonGenerations.a_triple_of_quarks_carries_a_whole_charge' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.a_triple_of_quarks_carries_a_whole_charge
/-- info: 'SPHYS.LeptonGenerations.a_single_quark_carries_a_part_charge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.a_single_quark_carries_a_part_charge
/-- info: 'SPHYS.LeptonGenerations.each_generation_closes_alone' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.each_generation_closes_alone
/-- info: 'SPHYS.LeptonGenerations.copies_with_one_unit_have_one_table' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.copies_with_one_unit_have_one_table
/-- info: 'SPHYS.LeptonGenerations.a_total_can_hide_a_failure' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.a_total_can_hide_a_failure
/-- info: 'SPHYS.LeptonGenerations.the_count_of_the_phases' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.the_count_of_the_phases
/--
info: 'SPHYS.LeptonGenerations.three_is_the_least_with_a_phase' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.three_is_the_least_with_a_phase
/-- info: 'SPHYS.LeptonGenerations.none_none_and_one' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.none_none_and_one
/-- info: 'SPHYS.LeptonGenerations.a_total_of_zeros_is_zero' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.a_total_of_zeros_is_zero
/--
info: 'SPHYS.LeptonGenerations.a_number_carried_cannot_be_left_with_none' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.a_number_carried_cannot_be_left_with_none
/-- info: 'SPHYS.LeptonGenerations.the_number_adds' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.the_number_adds
/-- info: 'SPHYS.LeptonGenerations.the_lepton_generations' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.the_lepton_generations
/--
info: 'SPHYS.LeptonGenerations.every_model_of_the_generations_is_an_instance' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.LeptonGenerations.every_model_of_the_generations_is_an_instance
