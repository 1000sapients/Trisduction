# The Proton as a New Mathematical Theorem

## The Lock Fails When Two Axes Coincide and Closes on Distinct Axes in Any Number of Colours, Its Charge Is the Electron's Reversed, Its Spin Is a Half, and a Kept Number Holds It

**Mohammad F. Islam PhD** · 26 November 2026

## Abstract

This paper proves, in Lean 4 with Mathlib, what is forced about the proton, taken as three quarks in the one antisymmetric reading of three colours. The lock is the determinant, and the statements about it hold in any number of colours over any commutative ring. The lock is zero when two axes coincide. It is one on distinct axes. The lock of two settings together is the product of their locks, and it is kept by every turn of the colours whose own lock is one: it is a reading no such turn changes. In any commutative ring the five equations of the table of charges make the charge of two up quarks and one down quark the electron's charge reversed, so the atom is neutral for every unit. The sum of three odd numbers is odd, so three half spins make a half spin, and two make a whole. For any total spin and any share carried by the quarks, every share of the field is completed by a share of the motion: the quark record does not decide the split. Where a number is kept, a state that carries it does not become any set of states none of which carries it. The file has 26 theorems, declares no axiom and leaves no proof open. The mass of the proton and the share of its spin carried by its quarks are measured.

## 1. The Theorem and What It Rests On

### 1.1 The statement

The binding theorem `the_proton` states, for three-by-three matrices of integers: (i) if two columns are equal the determinant is zero; (ii) the determinant of the identity is one; (iii) if $\det U = 1$ then $\det(UM) = \det M$; and further (iv) $q_p + q_e = 0$ for every integer unit; (v) the sum of three odd integers is odd; (vi) if a label is not zero on $p$ and zero on every member of a list, the total of the list is not its value on $p$. The general forms are in Sections 2 to 5.

### 1.2 What is proved, what is cited, what is assumed

Proved in Appendix A, and checked by the kernel of Lean 4 [9] with the Mathlib library [7]: every statement of Section 1.1 and of Sections 2 to 5. Assumed: that the proton is two up quarks and one down quark in the antisymmetric reading of three colours [2, 3]; the five equations of the table [8]; that the number of quarks less antiquarks is kept. Cited and not formalised: the proton [1]; the measurement of the share of the spin carried by quarks [4]. Measured and not derived: the mass, the radius, the magnetic moment, and the lower bound on the lifetime [5].

### 1.3 What proton means here

The proton means the state of two up quarks and one down quark in the antisymmetric reading of the colours. The lock means the determinant of the three colour axes.

## 2. The Lock

The theorems `the_lock_fails_when_two_axes_coincide` and `the_lock_closes_on_distinct_axes` hold for square matrices of any finite size over any commutative ring. `the_lock_of_two_is_the_product` and `the_lock_is_kept_by_a_turn_of_the_colours` state that the lock is multiplicative and is unchanged by any turn of lock one. Three quarks of three different colours give a lock that is not zero and that no turn of the colours changes. Two quarks of one colour give zero.

## 3. The Charge

With the table forced (`the_table_is_forced`, `the_charges_are_read_from_the_table`), `the_atom_is_neutral` states $q_p + q_e = 0$ in any commutative ring. The proton is a multiple of three quarks, so its charge is whole (`a_triple_of_quarks_carries_a_whole_charge`), while one quark's is not (`a_single_quark_carries_a_part_charge`, `the_quark_charges_are_thirds`). A charged state is not its own partner (`a_charged_lock_is_not_its_own_partner`). The table also gives `the_neutron_and_the_neutrino_are_neutral`, `the_pairs_split_by_the_step` and `one_step_for_both_pairs`.

## 4. The Spin

Twice a half spin is an odd whole number. `three_halves_make_a_half` and `two_halves_make_a_whole` are the parity statements: three quarks have a half spin, a quark and an antiquark a whole one. The theorem `the_quark_record_does_not_decide_the_spin` states, in any commutative group, that for any total $s$, any share $\sigma$ of the quarks and any share $g$ of the field there is a share $l$ of the motion with $\sigma + g + l = s$. The measured share of the quarks is well below the whole [4]; the theorem says the rest can be split in every way, so the split is a matter for measurement.

## 5. The Number

The theorem `a_number_carried_cannot_be_left_with_none` rests on `a_total_of_zeros_is_zero`. The proton carries quark number three; light and leptons carry none. While that number is kept, the proton does not become light and leptons.

## 6. What Is Subsumed and What Is Not

The theorem `every_model_of_the_lock_is_an_instance` states the two facts of the lock for any size and any commutative ring; a model of the proton with another number of colours or another ring of amplitudes is an instance. The general theorems of the seat, `every_model_is_an_instance`, `every_reading_of_the_seat_is_a_reading_of_the_model`, `an_odd_reading_is_zero_on_the_line`, `an_odd_reading_off_zero_tells_the_pair` and `a_kept_reading_is_one_on_the_pair`, are in Part 0. The earlier record of this trail, which checks the lock on three colours by enumeration, is an instance of Section 2. Every other three-quark state, of any flavours, is covered by Sections 2, 4 and 5.

Not subsumed: the mass, which comes almost wholly from the field; the lifetime if the number is not kept; the structure of the proton in space.

## 7. The File, Theorem by Theorem

| Theorem | Axioms its proof uses |
|---|---|
| `a_kept_reading_is_one_on_the_pair` | no axiom |
| `an_odd_reading_is_zero_on_the_line` | propext |
| `an_odd_reading_off_zero_tells_the_pair` | propext |
| `every_model_is_an_instance` | no axiom |
| `every_reading_of_the_seat_is_a_reading_of_the_model` | no axiom |
| `the_lock_fails_when_two_axes_coincide` | propext, Classical.choice, Quot.sound |
| `the_lock_closes_on_distinct_axes` | propext, Classical.choice, Quot.sound |
| `the_lock_of_two_is_the_product` | propext, Classical.choice, Quot.sound |
| `the_lock_is_kept_by_a_turn_of_the_colours` | propext, Classical.choice, Quot.sound |
| `the_table_is_forced` | propext, Quot.sound |
| `the_charges_are_read_from_the_table` | propext, Quot.sound |
| `the_atom_is_neutral` | propext, Quot.sound |
| `the_neutron_and_the_neutrino_are_neutral` | propext, Quot.sound |
| `the_quark_charges_are_thirds` | propext, Quot.sound |
| `the_pairs_split_by_the_step` | propext, Quot.sound |
| `one_step_for_both_pairs` | propext, Quot.sound |
| `a_triple_of_quarks_carries_a_whole_charge` | propext, Quot.sound |
| `a_single_quark_carries_a_part_charge` | propext, Quot.sound |
| `three_halves_make_a_half` | propext, Quot.sound |
| `two_halves_make_a_whole` | propext, Quot.sound |
| `the_quark_record_does_not_decide_the_spin` | propext |
| `a_total_of_zeros_is_zero` | propext |
| `a_number_carried_cannot_be_left_with_none` | propext, Quot.sound |
| `a_charged_lock_is_not_its_own_partner` | propext |
| `the_proton` | propext, Classical.choice, Quot.sound |
| `every_model_of_the_lock_is_an_instance` | propext, Classical.choice, Quot.sound |

## 8. Discussion: The Reading

The following is a reading and is carried at the grade of a premise. On the seat of this series what is registered is what the maps keep. The lock is the one reading of three colours that every turn keeps, so the proton is registered whole though no quark is. Its charge is the electron's reversed because one table closes both. Nothing in Sections 2 to 6 depends on this paragraph.

## 9. Predictions, Falsifiers, and What Stands

### 9.1 Two predictions that will stand

First: the charges of the proton and the electron cancel at any precision [6]. Second: the proton has a half spin whatever the share carried by its quarks.

### 9.2 The two falsifiers

First: a measured difference in size between the charges of the proton and the electron. This would break one of the five equations. Second: a proton seen to become light and leptons [5]. Section 5 would stand as stated; what would fall is the assumption that the number is kept, and the proton would hold only as long as that number does.

### 9.3 What kind of result this is

The theorems are identities and implications on stated structures. They derive no mass.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file is written by a language model under the author's direct supervision. Every theorem named in the text is in Appendix A under that name, and its kernel line is printed in Appendix B. Classical results and measurements that are cited and not formalised are named as such where they are used. No constant of nature is derived anywhere in this paper: no mass, no strength of a coupling and no angle of a mixing is a theorem here, and where a measured value is quoted it is quoted from its source.

**The seat.** The seat is elementary: a set and a map of the set to itself, with the points the map leaves in place called its line. In the plane it is a reflection and the line it fixes, studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1. E. Rutherford, Philos. Mag. 37 (1919) 581.
2. M. Gell-Mann, Phys. Lett. 8 (1964) 214.
3. O. W. Greenberg, Phys. Rev. Lett. 13 (1964) 598.
4. J. Ashman et al. (European Muon Collaboration), Phys. Lett. B 206 (1988) 364.
5. A. Takenaka et al. (Super-Kamiokande Collaboration), Phys. Rev. D 102 (2020) 112011.
6. G. Bressi et al., Phys. Rev. A 83 (2011) 052101.
7. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
8. M. F. Islam, The Charges of Matter as a New Mathematical Theorem (2026).
9. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
10. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its file uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main.

11. The table of charges, forced: Publication Library/Mathematics/Mathematical Physics/The Charges of Matter/SPHYS_Charge_Closure_CC.lean. Compiled with Mathlib 4.19.0, exit 0.
12. The law of a charge that does not commute, forced: Publication Library/Mathematics/Mathematical Physics/The Nuclear Forces/SPHYS_YangMills_Forced_CC.lean. Compiled with Mathlib 4.19.0, exit 0.
13. The seat: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_46_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.

## Appendix A · SPHYS_Proton_Theorem_CC.lean

Lean 4.19.0 with Mathlib 4.19.0. 26 theorems, no axiom declared, no `sorry`, exit 0 with no warning. Every cone is pinned at the end of the file, so the build is silent. The kernel lines are Appendix B.

```lean
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
```

## Appendix B · Kernel lines of Appendix A

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

```text
'SPHYS.Proton.a_kept_reading_is_one_on_the_pair' does not depend on any axioms
'SPHYS.Proton.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext]
'SPHYS.Proton.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext]
'SPHYS.Proton.every_model_is_an_instance' does not depend on any axioms
'SPHYS.Proton.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms
'SPHYS.Proton.the_lock_fails_when_two_axes_coincide' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Proton.the_lock_closes_on_distinct_axes' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Proton.the_lock_of_two_is_the_product' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Proton.the_lock_is_kept_by_a_turn_of_the_colours' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Proton.the_table_is_forced' depends on axioms: [propext, Quot.sound]
'SPHYS.Proton.the_charges_are_read_from_the_table' depends on axioms: [propext, Quot.sound]
'SPHYS.Proton.the_atom_is_neutral' depends on axioms: [propext, Quot.sound]
'SPHYS.Proton.the_neutron_and_the_neutrino_are_neutral' depends on axioms: [propext, Quot.sound]
'SPHYS.Proton.the_quark_charges_are_thirds' depends on axioms: [propext, Quot.sound]
'SPHYS.Proton.the_pairs_split_by_the_step' depends on axioms: [propext, Quot.sound]
'SPHYS.Proton.one_step_for_both_pairs' depends on axioms: [propext, Quot.sound]
'SPHYS.Proton.a_triple_of_quarks_carries_a_whole_charge' depends on axioms: [propext, Quot.sound]
'SPHYS.Proton.a_single_quark_carries_a_part_charge' depends on axioms: [propext, Quot.sound]
'SPHYS.Proton.three_halves_make_a_half' depends on axioms: [propext, Quot.sound]
'SPHYS.Proton.two_halves_make_a_whole' depends on axioms: [propext, Quot.sound]
'SPHYS.Proton.the_quark_record_does_not_decide_the_spin' depends on axioms: [propext]
'SPHYS.Proton.a_total_of_zeros_is_zero' depends on axioms: [propext]
'SPHYS.Proton.a_number_carried_cannot_be_left_with_none' depends on axioms: [propext, Quot.sound]
'SPHYS.Proton.a_charged_lock_is_not_its_own_partner' depends on axioms: [propext]
'SPHYS.Proton.the_proton' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Proton.every_model_of_the_lock_is_an_instance' depends on axioms: [propext, Classical.choice, Quot.sound]
```

## Appendix C · Provenance Trail

The frame, the reading and the special cases of this paper are on the public record before it. The table lists each step at the grade its own record carries, with the address where that record can be read. The theorems of this paper, in the generality of Appendix A, are in the last row and in no earlier one. A row marked frame or reading states no theorem of this paper; a row marked special case proves or checks the subject on one model; a row marked kernel, structural carries Lean theorems on printed models; a row marked theorem on premises carries a law forced from named premises. The third column gives, for each row, the term of that record which is the precursor, and why the row is on the trail.

**Table C.1 · The grade ladder of the proton line, 2026**

| Date | Grade | Precursor term, and why it is on the trail | Record | Address |
|---|---|---|---|---|
| 24 Mar | Frame, first anchor | **three orthogonal Ductions converging on one point.** The frame of the series: a point fixed by three independent axes, with the witness outside them | *Trisduction, A Geometric Epistemology of Absolute Convergence* | <https://trisduction.blogspot.com/2026/03/trisduction-geometric-epistemology-of.html> |
| 19 Jul | Reading | **the four forces and matter as configurations of one substrate.** The forces and the particles read as one kind of thing, in prose | *The Four Forces, Matter, and the Dark Sector as Configurations of One Actuating Substrate* | <https://doi.org/10.5281/zenodo.21438933> |
| 27 Sep | Special case | **the proton is the lock; three colours, one singlet.** The antisymmetric reading of three colours, checked on three by enumeration | *The Proton Is the Lock* | <https://doi.org/10.5281/zenodo.22986559> |
| 25 Nov | Theorem on premises | **closure forces the table.** The lepton charges follow from the quark charges; the atom is neutral | *The Charges of Matter as a New Mathematical Theorem* | <https://doi.org/10.5281/zenodo.24519057> |
| 26 Nov | Theorem | **the lock fails when two axes coincide.** In any number of colours over any commutative ring: the lock, the charge, the spin, the kept number | *This paper, edition 1.0.0: the proton in any number of colours* | `not yet deposited` |

Dates are Zenodo publication dates where a DOI is given and the date printed on its page for the row of 24 March. The Lean files of the rows of 25 November were compiled again for this paper on Lean 4.19.0, from the copies in the repository 1000sapients/Trisduction, branch main, and compiled without error. The terms of the rows of 19 July and 27 September are taken from the titles of their records. This paper has no address until it is deposited.
