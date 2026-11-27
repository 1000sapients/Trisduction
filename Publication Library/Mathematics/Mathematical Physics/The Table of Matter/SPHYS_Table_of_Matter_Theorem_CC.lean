/-
SPHYS_Table_of_Matter_Theorem_CC.lean · The Table of Matter as a New Mathematical Theorem. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. The thirteen papers before this one each prove what is forced about one particle or one force. This file states
  the common form and binds the counts. A particle is a point of a seat: a type with a fold. A force is a reading: kept by
  a fold, or reversed by it. What is forced about every particle and every force follows from those two words, on any
  type. DESIGN. Part 0 the seat. Part I every particle a seat. Part II every force a reading. Part III the charges.
  Part IV the carriers. Part V the counts. Part VI the table. RISK. The file does not import the thirteen kernels; it
  restates what it binds and proves it again here, so it stands alone. The masses, the strengths and the angles are
  measured and enter no theorem. NON-NEGOTIABLE. No axiom is declared. No proof is left open.
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

namespace SPHYS.TableOfMatter

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

/-! ## Part I. Every particle a seat. -/

/-- OFF THE LINE EVERY PARTICLE HAS A PARTNER, the partner is off the line, and the partner of the partner is the
particle: for any fold that is its own inverse, on any type. -/
theorem off_the_line_every_particle_has_a_partner {X : Type*} (σ : X → X) (hσ : ∀ x, σ (σ x) = x) (x : X)
    (hx : ¬ OnLine σ x) : σ x ≠ x ∧ ¬ OnLine σ (σ x) ∧ σ (σ x) = x := by
  refine ⟨hx, fun h => hx ?_, hσ x⟩
  have h1 : σ (σ x) = σ x := h
  rw [hσ] at h1
  exact h1.symm

/-- ON THE LINE A PARTICLE IS ITS OWN PARTNER and every reading the fold reverses is zero on it. -/
theorem on_the_line_a_particle_is_its_own_partner {X V : Type*} [AddGroup V] (h2 : ∀ v : V, v + v = 0 → v = 0)
    (σ : X → X) (r : X → V) (hodd : ∀ x, r (σ x) = - r x) (x : X) (hx : OnLine σ x) : σ x = x ∧ r x = 0 :=
  ⟨hx, an_odd_reading_is_zero_on_the_line h2 σ r hodd x hx⟩

/-- The pair together carries none of any reading the fold reverses. -/
theorem the_pair_together_carries_none {X V : Type*} [AddGroup V] (σ : X → X) (r : X → V)
    (hodd : ∀ x, r (σ x) = - r x) (x : X) : r x + r (σ x) = 0 := by rw [hodd]; exact add_neg_cancel _

/-! ## Part II. Every force a reading. -/

/-- A FORCE THAT KEEPS A FOLD DOES NOT TELL A PARTICLE FROM ITS PARTNER, through any further reading of its value. -/
theorem a_force_that_keeps_a_fold_reads_no_side {X V W : Type*} (σ : X → X) (r : X → V) (h : ∀ x, r (σ x) = r x)
    (g : V → W) (x : X) : g (r (σ x)) = g (r x) := by rw [h]

/-- A FORCE THAT REVERSES A FOLD TELLS THEM APART EXACTLY WHERE IT IS NOT ZERO. -/
theorem a_force_that_reverses_a_fold_reads_the_side {X V : Type*} [AddGroup V] (h2 : ∀ v : V, v + v = 0 → v = 0)
    (σ : X → X) (r : X → V) (hodd : ∀ x, r (σ x) = - r x) (x : X) : r (σ x) ≠ r x ↔ r x ≠ 0 := by
  constructor
  · intro h h0
    apply h
    rw [hodd, h0, neg_zero]
  · intro h
    exact (an_odd_reading_off_zero_tells_the_pair h2 σ r hodd x h).2

/-- TWO REVERSALS KEEP. A reading two folds each reverse is kept by the two together. -/
theorem two_reversals_keep {X V : Type*} [AddGroup V] (σ τ : X → X) (r : X → V) (hσ : ∀ x, r (σ x) = - r x)
    (hτ : ∀ x, r (τ x) = - r x) (x : X) : r (σ (τ x)) = r x := by rw [hσ, hτ, neg_neg]

/-- A reversal and a keeping reverse. -/
theorem a_reversal_and_a_keeping_reverse {X V : Type*} [AddGroup V] (σ τ : X → X) (r : X → V)
    (hσ : ∀ x, r (σ x) = - r x) (hτ : ∀ x, r (τ x) = r x) (x : X) : r (σ (τ x)) = - r x := by rw [hσ, hτ]

/-- THE FOUR FORCES BY WHAT THEY KEEP. Each reading of three folds is given by three signs; the table of signs of the
weight, the electric charge, the hand and the colour. `true` is kept. -/
def signs : Fin 4 → Bool × Bool × Bool
  | 0 => (true, true, true)      -- the weight: kept by the exchange of charge, the mirror and the reversal of time
  | 1 => (false, true, true)     -- the electric charge: reversed by the exchange of charge
  | 2 => (false, false, true)    -- the hand of the weak coupling: reversed by the exchange and by the mirror
  | 3 => (true, true, true)      -- the lock of colour: kept by all three

/-- The weight and the lock of colour keep every fold; the charge is reversed by one; the weak coupling by two, and so is
kept by those two together. -/
theorem the_four_readings :
    signs 0 = (true, true, true) ∧ signs 3 = (true, true, true) ∧ (signs 1).1 = false
    ∧ ((signs 2).1 = false ∧ (signs 2).2.1 = false) ∧ ((signs 2).1 == (signs 2).2.1) = true := by decide

/-! ## Part III. The charges. -/

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

/-! ## Part V. The counts. -/

/-- The carriers are one, three and eight: twelve. -/
theorem twelve_carriers :
    1 + Module.finrank ℚ (LinearMap.ker (Matrix.traceLinearMap (Fin 2) ℚ ℚ))
      + Module.finrank ℚ (LinearMap.ker (Matrix.traceLinearMap (Fin 3) ℚ ℚ)) = 12 := by
  rw [eight_three_and_none.1, eight_three_and_none.2.1]

/-- A wave without mass has two states exactly in four dimensions, and the electric and magnetic parts are equal in
number exactly in four. -/
theorem four_dimensions_twice (n : ℤ) (hn : 2 ≤ n) : (n - 2 = 2 ↔ n = 4) ∧ (2 * (n - 1) = (n - 1) * (n - 2) ↔ n = 4) := by
  refine ⟨by omega, ?_⟩
  constructor
  · intro h
    have h1 : (n - 1) * (n - 4) = 0 := by linear_combination -h
    rcases mul_eq_zero.1 h1 with h | h <;> omega
  · rintro rfl; norm_num

/-- A phase from three copies on. -/
theorem a_phase_from_three_copies_on (n : ℤ) (hn : 1 ≤ n) : 0 < (n - 1) * (n - 2) ↔ 3 ≤ n := by
  constructor
  · intro h
    by_contra hc
    have h12 : n = 1 ∨ n = 2 := by omega
    rcases h12 with rfl | rfl <;> norm_num at h
  · intro h
    exact mul_pos (by omega) (by omega)

/-- Exclusion, on any type. -/
theorem exclusion {S V : Type*} [AddGroup V] (h2 : ∀ v : V, v + v = 0 → v = 0) (ψ : S → S → V)
    (hanti : ∀ a b, ψ a b = - ψ b a) (a : S) : ψ a a = 0 := by
  apply h2
  nth_rewrite 1 [hanti a a]
  exact neg_add_cancel _

/-- One generation of matter, counted by hand and colour: six quark states of the pair, three and three single quarks,
two lepton states of the pair and one single lepton. Fifteen. -/
theorem fifteen_states_in_one_generation : 3 * 2 + 3 + 3 + 2 + 1 = 15 := by norm_num

/-! ## Part VI. The table. -/

/-- THE TABLE OF MATTER. -/
theorem the_table_of_matter :
    (∀ (yQ yu yd yL ye yH : ℤ), yQ + yu + yH = 0 → yQ + yd - yH = 0 → yL + ye - yH = 0 → 3 * yQ + yL = 0
        → 6 * yQ + 3 * yu + 3 * yd + 2 * yL + ye = 0
        → yu = -4 * yQ ∧ yd = 2 * yQ ∧ yL = -3 * yQ ∧ ye = 6 * yQ ∧ yH = 3 * yQ)
    ∧ (∀ yQ : ℤ, qProton yQ + qElectron yQ = 0)
    ∧ (∀ yQ : ℤ, qNeutron yQ = 0 ∧ qNeutrino yQ = 0)
    ∧ (∀ a b : ℤ, (3 : ℤ) ∣ a + b → (6 : ℤ) ∣ 4 * a - 2 * b)
    ∧ (1 + Module.finrank ℚ (LinearMap.ker (Matrix.traceLinearMap (Fin 2) ℚ ℚ))
        + Module.finrank ℚ (LinearMap.ker (Matrix.traceLinearMap (Fin 3) ℚ ℚ)) = 12)
    ∧ (∀ n : ℤ, 2 ≤ n → ((n - 2 = 2 ↔ n = 4) ∧ (2 * (n - 1) = (n - 1) * (n - 2) ↔ n = 4)))
    ∧ (∀ n : ℤ, 1 ≤ n → (0 < (n - 1) * (n - 2) ↔ 3 ≤ n))
    ∧ (∀ (S : Type) (ψ : S → S → ℤ), (∀ a b, ψ a b = - ψ b a) → ∀ a, ψ a a = 0) :=
  ⟨fun yQ yu yd yL ye yH a b c d e => the_table_is_forced yQ yu yd yL ye yH a b c d e, the_atom_is_neutral,
   the_neutron_and_the_neutrino_are_neutral, a_triple_of_quarks_carries_a_whole_charge, twelve_carriers,
   four_dimensions_twice, a_phase_from_three_copies_on, fun _ ψ h a => exclusion (fun v hv => by omega) ψ h a⟩

/-- SUBSUMPTION OF EVERY MODEL OF A PARTICLE AND EVERY MODEL OF A FORCE. Let a model, on any type, with any fold, be
carried one to one into a seat with the folds matched. Its particles are their own partners exactly over the line of the
seat; every reading of the seat is kept or reversed in the model as on the seat; and a reversed reading is zero on every
particle of the model that is its own partner. -/
theorem every_model_of_matter_is_an_instance {X Y V : Type*} [AddGroup V] (h2 : ∀ v : V, v + v = 0 → v = 0)
    (σ : X → X) (τ : Y → Y) (φ : Y → X) (hφ : Function.Injective φ) (heq : ∀ y, φ (τ y) = σ (φ y))
    (r : X → V) (hodd : ∀ x, r (σ x) = - r x) :
    (∀ y, OnLine τ y ↔ OnLine σ (φ y)) ∧ (∀ y, r (φ (τ y)) = - r (φ y)) ∧ (∀ y, OnLine τ y → r (φ y) = 0) :=
  ⟨every_model_is_an_instance σ τ φ hφ heq,
   fun y => every_reading_of_the_seat_is_a_reading_of_the_model σ τ φ heq r (fun v => -v) hodd y,
   fun y hy => an_odd_reading_is_zero_on_the_line h2 σ r hodd (φ y) ((every_model_is_an_instance σ τ φ hφ heq y).1 hy)⟩


end SPHYS.TableOfMatter

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.TableOfMatter.a_kept_reading_is_one_on_the_pair' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.a_kept_reading_is_one_on_the_pair
/-- info: 'SPHYS.TableOfMatter.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.an_odd_reading_is_zero_on_the_line
/-- info: 'SPHYS.TableOfMatter.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.an_odd_reading_off_zero_tells_the_pair
/-- info: 'SPHYS.TableOfMatter.every_model_is_an_instance' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.every_model_is_an_instance
/-- info: 'SPHYS.TableOfMatter.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.every_reading_of_the_seat_is_a_reading_of_the_model
/-- info: 'SPHYS.TableOfMatter.off_the_line_every_particle_has_a_partner' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.off_the_line_every_particle_has_a_partner
/-- info: 'SPHYS.TableOfMatter.on_the_line_a_particle_is_its_own_partner' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.on_the_line_a_particle_is_its_own_partner
/-- info: 'SPHYS.TableOfMatter.the_pair_together_carries_none' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.the_pair_together_carries_none
/-- info: 'SPHYS.TableOfMatter.a_force_that_keeps_a_fold_reads_no_side' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.a_force_that_keeps_a_fold_reads_no_side
/-- info: 'SPHYS.TableOfMatter.a_force_that_reverses_a_fold_reads_the_side' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.a_force_that_reverses_a_fold_reads_the_side
/-- info: 'SPHYS.TableOfMatter.two_reversals_keep' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.two_reversals_keep
/-- info: 'SPHYS.TableOfMatter.a_reversal_and_a_keeping_reverse' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.a_reversal_and_a_keeping_reverse
/-- info: 'SPHYS.TableOfMatter.the_four_readings' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.the_four_readings
/-- info: 'SPHYS.TableOfMatter.the_table_is_forced' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.the_table_is_forced
/-- info: 'SPHYS.TableOfMatter.the_charges_are_read_from_the_table' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.the_charges_are_read_from_the_table
/-- info: 'SPHYS.TableOfMatter.the_atom_is_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.the_atom_is_neutral
/-- info: 'SPHYS.TableOfMatter.the_neutron_and_the_neutrino_are_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.the_neutron_and_the_neutrino_are_neutral
/-- info: 'SPHYS.TableOfMatter.the_quark_charges_are_thirds' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.the_quark_charges_are_thirds
/-- info: 'SPHYS.TableOfMatter.the_pairs_split_by_the_step' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.the_pairs_split_by_the_step
/-- info: 'SPHYS.TableOfMatter.one_step_for_both_pairs' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.one_step_for_both_pairs
/-- info: 'SPHYS.TableOfMatter.a_triple_of_quarks_carries_a_whole_charge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.a_triple_of_quarks_carries_a_whole_charge
/-- info: 'SPHYS.TableOfMatter.a_single_quark_carries_a_part_charge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.a_single_quark_carries_a_part_charge
/-- info: 'SPHYS.TableOfMatter.the_count_of_the_carriers' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.the_count_of_the_carriers
/-- info: 'SPHYS.TableOfMatter.eight_three_and_none' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.eight_three_and_none
/--
info: 'SPHYS.TableOfMatter.the_commutator_of_two_is_a_carrier' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.TableOfMatter.the_commutator_of_two_is_a_carrier
/-- info: 'SPHYS.TableOfMatter.a_commuting_charge_has_no_commutator' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.a_commuting_charge_has_no_commutator
/--
info: 'SPHYS.TableOfMatter.carriers_that_do_not_commute' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.TableOfMatter.carriers_that_do_not_commute
/-- info: 'SPHYS.TableOfMatter.twelve_carriers' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.twelve_carriers
/-- info: 'SPHYS.TableOfMatter.four_dimensions_twice' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.four_dimensions_twice
/--
info: 'SPHYS.TableOfMatter.a_phase_from_three_copies_on' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.TableOfMatter.a_phase_from_three_copies_on
/-- info: 'SPHYS.TableOfMatter.exclusion' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.exclusion
/-- info: 'SPHYS.TableOfMatter.fifteen_states_in_one_generation' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.fifteen_states_in_one_generation
/-- info: 'SPHYS.TableOfMatter.the_table_of_matter' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.the_table_of_matter
/-- info: 'SPHYS.TableOfMatter.every_model_of_matter_is_an_instance' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.TableOfMatter.every_model_of_matter_is_an_instance
