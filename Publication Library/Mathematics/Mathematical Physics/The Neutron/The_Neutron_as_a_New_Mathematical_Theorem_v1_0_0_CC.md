# The Neutron as a New Mathematical Theorem

## Neutral by the Table and Not Its Own Partner, and If It Becomes a Proton the Electron Does Not Leave Alone: the Leptons Leave in Even Number and the Bodies Are Not Two

**Mohammad F. Islam PhD** · 26 November 2026

## Abstract

This paper proves, in Lean 4 with Mathlib, what is forced about the neutron, taken as one up quark and two down quarks in the lock of three colours. In any commutative ring the five equations of the table of charges make its charge zero, and make the difference between its charge and the proton's equal to the electron's charge. On any two groups of labels, a state with no charge and a number that is not zero differs from its partner, and its charge does not tell the two apart: the neutron is neutral and is not its own partner. If a neutron becomes a proton, what leaves with the proton carries the electron's charge and no lepton number. In the table of one lepton pair no single lepton does that, and exactly one pair does: the electron with the partner of the neutral lepton. For any table of leptons, with any number of generations, any list of states of odd lepton number whose total is zero has even length, and a list that carries a charge is not empty. A half spin does not become two half spins, and it may become three. The file has 24 theorems, declares no axiom and leaves no proof open. That the neutron is heavy enough to change is measured and enters no theorem.

## 1. The Theorem and What It Rests On

### 1.1 The statement

The binding theorem `the_neutron` states: (i) $q_n = 0$ for every integer unit; (ii) $q_n - q_p = q_e$; (iii) for an integer $b \ne 0$, $(0, -b) \ne (0, b)$; (iv) no lepton $x$ of the pair has $q(x) = -1$ and $L(x) = 0$; (v) two leptons have total charge $-1$ and total number zero exactly when they are the electron and the partner of the neutral lepton, in either order; (vi) a list of odd integers with total zero has even length; (vii) for odd $a$, $b$, $c$, $a \ne b + c$.

### 1.2 What is proved, what is cited, what is assumed

Proved in Appendix A, and checked by the kernel of Lean 4 [7] with the Mathlib library [6]: every statement of Section 1.1 and of Sections 2 to 5. Assumed: that the neutron is one up and two down quarks [8]; the five equations of the table [9]; that charge, lepton number and spin are kept in the change. Cited and not formalised: the neutron [1]; the theory of its change [2]; the detection of the neutral lepton [3]. Measured and not derived: the masses, the lifetime, and the bounds on the charge [4] and on the change of a neutron into its partner [5].

### 1.3 What neutron means here

The neutron means the state of one up quark and two down quarks in the lock of the colours. A lepton number means a label that is plus one on a lepton and minus one on its partner.

## 2. Neutral, and Not Its Own Partner

With the table forced (`the_table_is_forced`, `the_charges_are_read_from_the_table`), `the_neutron_and_the_neutrino_are_neutral` gives $q_n = 0$. The neutron still carries quark number three. The theorem `neutral_and_not_its_own_partner` states, on any two groups where the second has no element of order two, that such a state differs from its conjugate while its charge is the same. The neutron and its partner are two states on one charge. The table also gives `the_atom_is_neutral`, `the_quark_charges_are_thirds`, `the_pairs_split_by_the_step`, `one_step_for_both_pairs`, `a_triple_of_quarks_carries_a_whole_charge` and `a_single_quark_carries_a_part_charge`.

## 3. The Channel

The proton's charge is the neutron's less the electron's. So what leaves with the proton carries the electron's charge. If it is made of leptons and the lepton number is kept, its number is zero. The theorem `the_electron_does_not_leave_alone` states that no one lepton of the pair has that charge and that number. The theorem `the_one_pair` states that among pairs exactly one does. This is the argument by which the neutral lepton was proposed, as a theorem.

The general form is `the_leptons_leave_in_even_number`: any list of odd integers with total zero has even length. It rests on `the_total_of_odds_has_the_parity_of_the_count`. It holds for any table of leptons whatever, since every lepton number is odd. `something_leaves` adds that a list with a total that is not zero is not empty. So the leptons leave in a number that is even and not zero.

## 4. The Spin

`a_half_does_not_become_two_halves`: for odd integers, $a \ne b + c$. A neutron cannot become a proton and an electron alone. `a_half_may_become_three_halves`: three bodies are allowed. Charge, number and spin each require the third body, by separate arguments.

## 5. What Is Subsumed and What Is Not

The theorem `every_table_of_leptons_is_an_instance` states the even count for any type of leptons with any odd numbers; a table with more generations or further neutral states is an instance. The general theorems of the seat, `every_model_is_an_instance`, `every_reading_of_the_seat_is_a_reading_of_the_model`, `an_odd_reading_is_zero_on_the_line`, `an_odd_reading_off_zero_tells_the_pair` and `a_kept_reading_is_one_on_the_pair`, are in Part 0. The same sections cover every change of a neutral lock into a charged one, including the changes of heavier neutral states.

Not subsumed: the rate of the change; the masses; a change in which the lepton number is not kept.

## 6. The File, Theorem by Theorem

| Theorem | Axioms its proof uses |
|---|---|
| `a_kept_reading_is_one_on_the_pair` | no axiom |
| `an_odd_reading_is_zero_on_the_line` | propext |
| `an_odd_reading_off_zero_tells_the_pair` | propext |
| `every_model_is_an_instance` | no axiom |
| `every_reading_of_the_seat_is_a_reading_of_the_model` | no axiom |
| `the_table_is_forced` | propext, Quot.sound |
| `the_charges_are_read_from_the_table` | propext, Quot.sound |
| `the_atom_is_neutral` | propext, Quot.sound |
| `the_neutron_and_the_neutrino_are_neutral` | propext, Quot.sound |
| `the_quark_charges_are_thirds` | propext, Quot.sound |
| `the_pairs_split_by_the_step` | propext, Quot.sound |
| `one_step_for_both_pairs` | propext, Quot.sound |
| `a_triple_of_quarks_carries_a_whole_charge` | propext, Quot.sound |
| `a_single_quark_carries_a_part_charge` | propext, Quot.sound |
| `neutral_and_not_its_own_partner` | propext |
| `the_electron_does_not_leave_alone` | no axiom |
| `the_one_pair` | no axiom |
| `the_total_of_odds_has_the_parity_of_the_count` | propext, Quot.sound |
| `the_leptons_leave_in_even_number` | propext, Quot.sound |
| `something_leaves` | propext |
| `a_half_does_not_become_two_halves` | propext, Quot.sound |
| `a_half_may_become_three_halves` | propext, Quot.sound |
| `the_neutron` | propext, Quot.sound |
| `every_table_of_leptons_is_an_instance` | propext, Quot.sound |

## 7. Discussion: The Reading

The following is a reading and is carried at the grade of a premise. On the seat of this series the neutron is on the line of the conjugation of charge and off the line of the conjugation of number. A reading of charge cannot tell it from its partner; a reading of number can. Nothing in Sections 2 to 5 depends on this paragraph.

## 8. Predictions, Falsifiers, and What Stands

### 8.1 Two predictions that will stand

First: the neutron carries no charge at any precision [4]. Second: the electrons from the change of the neutron have a spread of energies, as three bodies give, and never one energy.

### 8.2 The two falsifiers

First: a measured charge of the neutron. This would break one of the five equations. Second: a neutron seen to become a proton and an electron and nothing else. This would break the keeping of the lepton number and of the spin together, which Section 1.2 assumes.

### 8.3 What kind of result this is

The theorems are identities, a finite classification, and parity statements. They derive no lifetime.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file is written by a language model under the author's direct supervision. Every theorem named in the text is in Appendix A under that name, and its kernel line is printed in Appendix B. Classical results and measurements that are cited and not formalised are named as such where they are used. No constant of nature is derived anywhere in this paper: no mass, no strength of a coupling and no angle of a mixing is a theorem here, and where a measured value is quoted it is quoted from its source.

**The seat.** The seat is elementary: a set and a map of the set to itself, with the points the map leaves in place called its line. In the plane it is a reflection and the line it fixes, studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1. J. Chadwick, Nature 129 (1932) 312.
2. E. Fermi, Z. Phys. 88 (1934) 161.
3. C. L. Cowan et al., Science 124 (1956) 103.
4. J. Baumann et al., Phys. Rev. D 37 (1988) 3107.
5. M. Baldo-Ceolin et al., Z. Phys. C 63 (1994) 409.
6. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
7. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
8. M. Gell-Mann, Phys. Lett. 8 (1964) 214.
9. M. F. Islam, The Charges of Matter as a New Mathematical Theorem (2026).
10. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its file uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main.

11. The table of charges, forced: Publication Library/Mathematics/Mathematical Physics/The Charges of Matter/SPHYS_Charge_Closure_CC.lean. Compiled with Mathlib 4.19.0, exit 0.
12. The seat: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_46_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.

## Appendix A · SPHYS_Neutron_Theorem_CC.lean

Lean 4.19.0 with Mathlib 4.19.0. 24 theorems, no axiom declared, no `sorry`, exit 0 with no warning. Every cone is pinned at the end of the file, so the build is silent. The kernel lines are Appendix B.

```lean
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
```

## Appendix B · Kernel lines of Appendix A

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

```text
'SPHYS.Neutron.a_kept_reading_is_one_on_the_pair' does not depend on any axioms
'SPHYS.Neutron.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext]
'SPHYS.Neutron.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext]
'SPHYS.Neutron.every_model_is_an_instance' does not depend on any axioms
'SPHYS.Neutron.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms
'SPHYS.Neutron.the_table_is_forced' depends on axioms: [propext, Quot.sound]
'SPHYS.Neutron.the_charges_are_read_from_the_table' depends on axioms: [propext, Quot.sound]
'SPHYS.Neutron.the_atom_is_neutral' depends on axioms: [propext, Quot.sound]
'SPHYS.Neutron.the_neutron_and_the_neutrino_are_neutral' depends on axioms: [propext, Quot.sound]
'SPHYS.Neutron.the_quark_charges_are_thirds' depends on axioms: [propext, Quot.sound]
'SPHYS.Neutron.the_pairs_split_by_the_step' depends on axioms: [propext, Quot.sound]
'SPHYS.Neutron.one_step_for_both_pairs' depends on axioms: [propext, Quot.sound]
'SPHYS.Neutron.a_triple_of_quarks_carries_a_whole_charge' depends on axioms: [propext, Quot.sound]
'SPHYS.Neutron.a_single_quark_carries_a_part_charge' depends on axioms: [propext, Quot.sound]
'SPHYS.Neutron.neutral_and_not_its_own_partner' depends on axioms: [propext]
'SPHYS.Neutron.the_electron_does_not_leave_alone' does not depend on any axioms
'SPHYS.Neutron.the_one_pair' does not depend on any axioms
'SPHYS.Neutron.the_total_of_odds_has_the_parity_of_the_count' depends on axioms: [propext, Quot.sound]
'SPHYS.Neutron.the_leptons_leave_in_even_number' depends on axioms: [propext, Quot.sound]
'SPHYS.Neutron.something_leaves' depends on axioms: [propext]
'SPHYS.Neutron.a_half_does_not_become_two_halves' depends on axioms: [propext, Quot.sound]
'SPHYS.Neutron.a_half_may_become_three_halves' depends on axioms: [propext, Quot.sound]
'SPHYS.Neutron.the_neutron' depends on axioms: [propext, Quot.sound]
'SPHYS.Neutron.every_table_of_leptons_is_an_instance' depends on axioms: [propext, Quot.sound]
```

## Appendix C · Provenance Trail

The frame, the reading and the special cases of this paper are on the public record before it. The table lists each step at the grade its own record carries, with the address where that record can be read. The theorems of this paper, in the generality of Appendix A, are in the last row and in no earlier one. A row marked frame or reading states no theorem of this paper; a row marked special case proves or checks the subject on one model; a row marked kernel, structural carries Lean theorems on printed models; a row marked theorem on premises carries a law forced from named premises. The third column gives, for each row, the term of that record which is the precursor, and why the row is on the trail.

**Table C.1 · The grade ladder of the neutron line, 2026**

| Date | Grade | Precursor term, and why it is on the trail | Record | Address |
|---|---|---|---|---|
| 24 Mar | Frame, first anchor | **three orthogonal Ductions converging on one point.** The frame of the series: a point fixed by three independent axes, with the witness outside them | *Trisduction, A Geometric Epistemology of Absolute Convergence* | <https://trisduction.blogspot.com/2026/03/trisduction-geometric-epistemology-of.html> |
| 19 Jul | Reading | **the four forces and matter as configurations of one substrate.** The forces and the particles read as one kind of thing, in prose | *The Four Forces, Matter, and the Dark Sector as Configurations of One Actuating Substrate* | <https://doi.org/10.5281/zenodo.21438933> |
| 27 Sep | Special case | **the proton is the lock; three colours, one singlet.** The antisymmetric reading of three colours, checked on three by enumeration | *The Proton Is the Lock* | <https://doi.org/10.5281/zenodo.22986559> |
| 27 Sep | Special case | **the neutrino is the witness.** The neutral lepton read on the fixed line, on one model | *The Neutrino Is the Witness* | <https://doi.org/10.5281/zenodo.22986555> |
| 25 Nov | Theorem on premises | **closure forces the table.** The lepton charges follow from the quark charges; the atom is neutral | *The Charges of Matter as a New Mathematical Theorem* | <https://doi.org/10.5281/zenodo.24519057> |
| 26 Nov | Theorem | **the electron does not leave alone.** Neutral by the table and not its own partner; for any table of leptons the leptons leave in even number; the bodies are not two | *This paper, edition 1.0.0: the neutron and its channel* | `not yet deposited` |

Dates are Zenodo publication dates where a DOI is given and the date printed on its page for the row of 24 March. The Lean files of the rows of 25 November were compiled again for this paper on Lean 4.19.0, from the copies in the repository 1000sapients/Trisduction, branch main, and compiled without error. The terms of the rows of 19 July and 27 September are taken from the titles of their records. This paper has no address until it is deposited.
