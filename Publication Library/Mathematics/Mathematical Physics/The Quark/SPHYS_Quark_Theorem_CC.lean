/-
SPHYS_Quark_Theorem_CC.lean · The Quark as a New Mathematical Theorem. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. What is forced about the quark: its charge is a third part of the electron's; a set of quarks whose number is a
  multiple of three carries a whole charge and a single quark does not; no reading that every exchange of colours keeps
  reads a colour; an amplitude antisymmetric in more quarks than there are colours is zero. DESIGN. Part 0 the seat.
  Part I the charge. Part II the colour, on any type of colours. Part III the antisymmetric amplitude, on any finite types.
RISK. That quarks are not seen alone is an observation; the file proves that no kept reading reads a colour and that a
  single quark carries a part charge, and does not derive confinement from the equations of the strong force.
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

namespace SPHYS.Quark

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

/-! ## Part II. The colour, on any type of colours. -/

/-- NO KEPT READING READS A COLOUR. A reading that every exchange of two colours keeps takes one value on every colour. -/
theorem no_kept_reading_reads_a_colour {C W : Type*} [DecidableEq C] (r : C → W)
    (h : ∀ (a b x : C), r (Equiv.swap a b x) = r x) (a b : C) : r a = r b := by
  have e := h a b a
  rw [Equiv.swap_apply_left] at e
  exact e.symm

/-- A reading of several quarks that every exchange of colours keeps takes one value on a set of quarks and on the same
set with two colours exchanged throughout. -/
theorem a_kept_reading_of_many_is_one_on_exchanged_colours {C I W : Type*} [DecidableEq C] (r : (I → C) → W)
    (h : ∀ (a b : C) (c : I → C), r (fun i => Equiv.swap a b (c i)) = r c) (a b : C) (c : I → C) :
    r (fun i => Equiv.swap a b (c i)) = r c := h a b c

/-! ## Part III. The antisymmetric amplitude, on any finite types of places and colours. -/

/-- TWO ALIKE ARE EXCLUDED. An amplitude that changes sign when two places are exchanged is zero on any colouring that
gives those two places one colour. -/
theorem two_alike_are_excluded {I C V : Type*} [DecidableEq I] [AddGroup V] (h2 : ∀ v : V, v + v = 0 → v = 0)
    (ψ : (I → C) → V) (hanti : ∀ (i j : I), i ≠ j → ∀ c : I → C, ψ (fun x => c (Equiv.swap i j x)) = - ψ c)
    (c : I → C) (i j : I) (hij : i ≠ j) (hc : c i = c j) : ψ c = 0 := by
  have e : (fun x => c (Equiv.swap i j x)) = c := by
    funext x
    by_cases hxi : x = i
    · rw [hxi, Equiv.swap_apply_left, hc]
    · by_cases hxj : x = j
      · rw [hxj, Equiv.swap_apply_right, hc]
      · rw [Equiv.swap_apply_of_ne_of_ne hxi hxj]
  have h := hanti i j hij c
  rw [e] at h
  apply h2
  nth_rewrite 1 [h]
  exact neg_add_cancel _

/-- NO MORE QUARKS THAN COLOURS IN ONE LOCK. With more places than colours, every such amplitude is zero everywhere. -/
theorem no_more_places_than_colours {I C V : Type*} [DecidableEq I] [Fintype I] [Fintype C] [AddGroup V]
    (h2 : ∀ v : V, v + v = 0 → v = 0) (hcard : Fintype.card C < Fintype.card I)
    (ψ : (I → C) → V) (hanti : ∀ (i j : I), i ≠ j → ∀ c : I → C, ψ (fun x => c (Equiv.swap i j x)) = - ψ c)
    (c : I → C) : ψ c = 0 := by
  have hex : ∃ i j, i ≠ j ∧ c i = c j := by
    by_contra hc
    push_neg at hc
    have hinj : Function.Injective c := fun a b hab => by_contra fun hne => hc a b hne hab
    exact absurd (Fintype.card_le_of_injective c hinj) (not_le.2 hcard)
  obtain ⟨i, j, hij, hc⟩ := hex
  exact two_alike_are_excluded h2 ψ hanti c i j hij hc

/-- With three colours, four quarks cannot be locked. -/
theorem four_quarks_cannot_be_locked_in_three_colours {V : Type*} [AddGroup V] (h2 : ∀ v : V, v + v = 0 → v = 0)
    (ψ : (Fin 4 → Fin 3) → V)
    (hanti : ∀ (i j : Fin 4), i ≠ j → ∀ c : Fin 4 → Fin 3, ψ (fun x => c (Equiv.swap i j x)) = - ψ c)
    (c : Fin 4 → Fin 3) : ψ c = 0 :=
  no_more_places_than_colours h2 (by simp) ψ hanti c

/-- THREE IS THE LEAST. A number of quarks that is a multiple of three and is not zero is at least three. -/
theorem three_is_the_least_number_read_alone (n : ℕ) (h0 : 0 < n) (h3 : 3 ∣ n) : 3 ≤ n := Nat.le_of_dvd h0 h3

/-! ## Part IV. The binding theorem and subsumption. -/

/-- THE QUARK. -/
theorem the_quark :
    (∀ yQ : ℤ, 3 * qUp yQ = -2 * qElectron yQ ∧ 3 * qDown yQ = qElectron yQ)
    ∧ (∀ a b : ℤ, (3 : ℤ) ∣ a + b → (6 : ℤ) ∣ 4 * a - 2 * b)
    ∧ (¬ (6 : ℤ) ∣ 4 ∧ ¬ (6 : ℤ) ∣ -2)
    ∧ (∀ (r : Fin 3 → ℤ), (∀ a b x : Fin 3, r (Equiv.swap a b x) = r x) → ∀ a b : Fin 3, r a = r b)
    ∧ (∀ (ψ : (Fin 4 → Fin 3) → ℤ),
        (∀ (i j : Fin 4), i ≠ j → ∀ c : Fin 4 → Fin 3, ψ (fun x => c (Equiv.swap i j x)) = - ψ c) → ∀ c, ψ c = 0) :=
  ⟨the_quark_charges_are_thirds, a_triple_of_quarks_carries_a_whole_charge, a_single_quark_carries_a_part_charge,
   fun r h a b => no_kept_reading_reads_a_colour r h a b,
   fun ψ h c => four_quarks_cannot_be_locked_in_three_colours (fun v hv => by omega) ψ h c⟩

/-- SUBSUMPTION. Any model of colour, on any type, carried into another by any map, has every kept reading of the second
as a reading of the first that takes one value wherever the second does. -/
theorem every_model_of_colour_is_an_instance {C D W : Type*} [DecidableEq C] (φ : D → C) (r : C → W)
    (h : ∀ (a b x : C), r (Equiv.swap a b x) = r x) (d d' : D) : r (φ d) = r (φ d') :=
  no_kept_reading_reads_a_colour r h (φ d) (φ d')


end SPHYS.Quark

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.Quark.a_kept_reading_is_one_on_the_pair' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Quark.a_kept_reading_is_one_on_the_pair
/-- info: 'SPHYS.Quark.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Quark.an_odd_reading_is_zero_on_the_line
/-- info: 'SPHYS.Quark.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Quark.an_odd_reading_off_zero_tells_the_pair
/-- info: 'SPHYS.Quark.every_model_is_an_instance' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Quark.every_model_is_an_instance
/-- info: 'SPHYS.Quark.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Quark.every_reading_of_the_seat_is_a_reading_of_the_model
/-- info: 'SPHYS.Quark.the_table_is_forced' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.the_table_is_forced
/-- info: 'SPHYS.Quark.the_charges_are_read_from_the_table' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.the_charges_are_read_from_the_table
/-- info: 'SPHYS.Quark.the_atom_is_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.the_atom_is_neutral
/-- info: 'SPHYS.Quark.the_neutron_and_the_neutrino_are_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.the_neutron_and_the_neutrino_are_neutral
/-- info: 'SPHYS.Quark.the_quark_charges_are_thirds' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.the_quark_charges_are_thirds
/-- info: 'SPHYS.Quark.the_pairs_split_by_the_step' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.the_pairs_split_by_the_step
/-- info: 'SPHYS.Quark.one_step_for_both_pairs' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.one_step_for_both_pairs
/-- info: 'SPHYS.Quark.a_triple_of_quarks_carries_a_whole_charge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.a_triple_of_quarks_carries_a_whole_charge
/-- info: 'SPHYS.Quark.a_single_quark_carries_a_part_charge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.a_single_quark_carries_a_part_charge
/-- info: 'SPHYS.Quark.no_kept_reading_reads_a_colour' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.no_kept_reading_reads_a_colour
/-- info: 'SPHYS.Quark.a_kept_reading_of_many_is_one_on_exchanged_colours' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.a_kept_reading_of_many_is_one_on_exchanged_colours
/-- info: 'SPHYS.Quark.two_alike_are_excluded' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.two_alike_are_excluded
/-- info: 'SPHYS.Quark.no_more_places_than_colours' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.no_more_places_than_colours
/--
info: 'SPHYS.Quark.four_quarks_cannot_be_locked_in_three_colours' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Quark.four_quarks_cannot_be_locked_in_three_colours
/-- info: 'SPHYS.Quark.three_is_the_least_number_read_alone' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Quark.three_is_the_least_number_read_alone
/-- info: 'SPHYS.Quark.the_quark' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.the_quark
/-- info: 'SPHYS.Quark.every_model_of_colour_is_an_instance' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.every_model_of_colour_is_an_instance
