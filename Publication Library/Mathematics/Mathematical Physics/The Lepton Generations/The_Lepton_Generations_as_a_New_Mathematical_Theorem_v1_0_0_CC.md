# The Lepton Generations as a New Mathematical Theorem

## Each Copy Closes Its Own Table, a Total Can Hide a Failure, Copies with One Unit Have One Table, and Three Is the Least Number of Copies with a Phase

**Mohammad F. Islam PhD** · 26 November 2026

## Abstract

This paper proves, in Lean 4 with Mathlib, what is forced about the copies of the lepton pair. The copies are indexed by any type, finite or not, and their charges lie in any commutative ring. If every copy satisfies the five equations that close the table of charges, every copy carries the table: the lepton pair has minus three units, the single lepton six, and the neutral member none. Two copies with the same unit have the same charges throughout, so the muon and the tau carry the electron's charge. A closure imposed only on totals over the copies can hold while no copy satisfies it; an explicit pair of copies is given. The mixing of $n$ copies is a unitary matrix with $n^2$ real numbers, of which $n(n-1)/2$ are angles and $2n - 1$ are removed by renaming the states; what is left is $(n-1)(n-2)/2$ phases, and this is positive exactly from three copies on. Where a number is kept, a state that carries it does not become any set of states none of which carries it, and the number adds over sets. The file has 25 theorems, declares no axiom and leaves no proof open. That nature has three copies is measured and is not proved here.

## 1. The Theorem and What It Rests On

### 1.1 The statement

The binding theorem `the_lepton_generations` states: (i) for charges $y_Q, y_u, y_d, y_L, y_e, y_H$ indexed by the natural numbers with integer values, if each index satisfies the five equations then for each index $y_L = -3y_Q$, $y_e = 6y_Q$, the single lepton has the electron's charge and $y_L + y_H = 0$; (ii) for integers $n \ge 1$, $(n-1)(n-2) > 0$ exactly when $n \ge 3$; (iii) if a label $\ell$ is not zero on $p$ and is zero on every member of a list, the total of the list is not $\ell(p)$. The general forms are in Sections 2 to 4.

### 1.2 What is proved, what is cited, what is assumed

Proved in Appendix A, and checked by the kernel of Lean 4 [11] with the Mathlib library [9]: every statement of Section 1.1 and of Sections 2 to 4. Assumed: the five equations of the table, per copy [10]. Cited and not formalised: the count of the real numbers of a unitary matrix and of the phases that renaming removes, which is the count of Kobayashi and Maskawa [1] and is written out in Section 3; the discovery of the second and third copies [2, 3]; the count of light neutral leptons [4]. Measured and not derived: the number of copies, the masses, and the angles.

### 1.3 What generation means here

A generation means one copy of the lepton pair with its single lepton, carrying one solution of the five equations. Nothing about mass is in the definition.

## 2. The Copies

The theorem `each_generation_closes_alone` is stated for any index type and any commutative ring. It applies `the_table_is_forced` copy by copy; the charges are read by `the_charges_are_read_from_the_table` and the pair splits by `the_pairs_split_by_the_step`. The theorem `copies_with_one_unit_have_one_table` states that two copies with equal $y_Q$ are equal in all six charges. Since the quarks of every copy are seen to carry the same charges, the charged leptons of every copy carry the electron's. The theorem `a_total_can_hide_a_failure` gives two copies whose totals satisfy the closure of the lepton pair while neither copy does. Closure must be asked copy by copy. The theorems `the_atom_is_neutral`, `the_neutron_and_the_neutrino_are_neutral`, `the_quark_charges_are_thirds`, `one_step_for_both_pairs`, `a_triple_of_quarks_carries_a_whole_charge` and `a_single_quark_carries_a_part_charge` are printed with the table.

## 3. Three Is the Least with a Phase

The theorem `the_count_of_the_phases` is the identity $2n^2 - n(n-1) - 2(2n-1) = (n-1)(n-2)$. The theorem `three_is_the_least_with_a_phase` states that this is positive exactly when $n \ge 3$, for $n \ge 1$, and `none_none_and_one` gives the values for one, two and three copies. A phase that cannot be removed is what lets the mixing treat a process and its mirror image with charges exchanged differently [5]. With one copy or two there is none.

## 4. A Number Carried

The theorem `a_number_carried_cannot_be_left_with_none` is stated for any type of states and any additive monoid of values; it rests on `a_total_of_zeros_is_zero`, and `the_number_adds` states that the total over two sets taken together is the sum. The condition is that the number is kept. The total lepton number is kept in every process seen so far. The number of each copy taken alone is not kept: the neutral leptons change copy in flight [6]. For the charged leptons no change of copy has been seen [7].

## 5. What Is Subsumed and What Is Not

The theorem `every_model_of_the_generations_is_an_instance` states that any model of the copies, on any index, carried into this one by any map of indices, closes copy by copy. A fourth copy, or any number, is covered: nothing in Section 2 uses the number of copies. The general theorems of the seat, `every_model_is_an_instance`, `every_reading_of_the_seat_is_a_reading_of_the_model`, `an_odd_reading_is_zero_on_the_line`, `an_odd_reading_off_zero_tells_the_pair` and `a_kept_reading_is_one_on_the_pair`, are printed in Part 0 of the file.

Not subsumed: why there are three copies; the masses; and a copy that does not satisfy the five equations.

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
| `each_generation_closes_alone` | propext, Quot.sound |
| `copies_with_one_unit_have_one_table` | propext, Quot.sound |
| `a_total_can_hide_a_failure` | propext |
| `the_count_of_the_phases` | propext, Quot.sound |
| `three_is_the_least_with_a_phase` | propext, Classical.choice, Quot.sound |
| `none_none_and_one` | propext, Quot.sound |
| `a_total_of_zeros_is_zero` | propext |
| `a_number_carried_cannot_be_left_with_none` | propext, Quot.sound |
| `the_number_adds` | propext, Quot.sound |
| `the_lepton_generations` | propext, Classical.choice, Quot.sound |
| `every_model_of_the_generations_is_an_instance` | propext, Quot.sound |

## 7. Discussion: The Reading

The following is a reading and is carried at the grade of a premise. Each copy is the same seat again: the same table, the same line, the same pairs. What tells the copies apart is not in the table. With three copies the mixing has one phase, and with it one orientation. Nothing in Sections 2 to 5 depends on this paragraph.

## 8. Predictions, Falsifiers, and What Stands

### 8.1 Two predictions that will stand

First: every charged lepton of every copy carries the electron's charge exactly. Second: no effect of a phase of mixing appears in any process that involves two copies only.

### 8.2 The two falsifiers

First: a charged lepton of any copy whose charge differs from the electron's. This would break `copies_with_one_unit_have_one_table`, and so one of the five equations for that copy. Second: a difference between a process and its mirror image with charges exchanged, traced to mixing, in a system of two copies. This would break the count of Section 3 as a description of the mixing. The measured difference in the neutral leptons involves three [8].

### 8.3 What kind of result this is

The theorems are identities, equivalences and implications. They do not say how many copies there are.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file is written by a language model under the author's direct supervision. Every theorem named in the text is in Appendix A under that name, and its kernel line is printed in Appendix B. Classical results and measurements that are cited and not formalised are named as such where they are used. No constant of nature is derived anywhere in this paper: no mass, no strength of a coupling and no angle of a mixing is a theorem here, and where a measured value is quoted it is quoted from its source.

**The seat.** The seat is elementary: a set and a map of the set to itself, with the points the map leaves in place called its line. In the plane it is a reflection and the line it fixes, studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1. M. Kobayashi and T. Maskawa, Prog. Theor. Phys. 49 (1973) 652.
2. S. H. Neddermeyer and C. D. Anderson, Phys. Rev. 51 (1937) 884.
3. M. L. Perl et al., Phys. Rev. Lett. 35 (1975) 1489.
4. ALEPH, DELPHI, L3, OPAL and SLD Collaborations, Phys. Rep. 427 (2006) 257.
5. J. H. Christenson, J. W. Cronin, V. L. Fitch and R. Turlay, Phys. Rev. Lett. 13 (1964) 138.
6. Y. Fukuda et al. (Super-Kamiokande Collaboration), Phys. Rev. Lett. 81 (1998) 1562.
7. A. M. Baldini et al. (MEG Collaboration), Eur. Phys. J. C 76 (2016) 434.
8. K. Abe et al. (T2K Collaboration), Nature 580 (2020) 339.
9. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
10. M. F. Islam, The Charges of Matter as a New Mathematical Theorem (2026).
11. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
12. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its file uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main.

13. The table of charges, forced: Publication Library/Mathematics/Mathematical Physics/The Charges of Matter/SPHYS_Charge_Closure_CC.lean. Compiled with Mathlib 4.19.0, exit 0.
14. The law of a charge that does not commute, forced: Publication Library/Mathematics/Mathematical Physics/The Nuclear Forces/SPHYS_YangMills_Forced_CC.lean. Compiled with Mathlib 4.19.0, exit 0.
15. The seat: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_46_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.

## Appendix A · SPHYS_Lepton_Generations_Theorem_CC.lean

Lean 4.19.0 with Mathlib 4.19.0. 25 theorems, no axiom declared, no `sorry`, exit 0 with no warning. Every cone is pinned at the end of the file, so the build is silent. The kernel lines are Appendix B.

```lean
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
```

## Appendix B · Kernel lines of Appendix A

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

```text
'SPHYS.LeptonGenerations.a_kept_reading_is_one_on_the_pair' does not depend on any axioms
'SPHYS.LeptonGenerations.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext]
'SPHYS.LeptonGenerations.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext]
'SPHYS.LeptonGenerations.every_model_is_an_instance' does not depend on any axioms
'SPHYS.LeptonGenerations.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms
'SPHYS.LeptonGenerations.the_table_is_forced' depends on axioms: [propext, Quot.sound]
'SPHYS.LeptonGenerations.the_charges_are_read_from_the_table' depends on axioms: [propext, Quot.sound]
'SPHYS.LeptonGenerations.the_atom_is_neutral' depends on axioms: [propext, Quot.sound]
'SPHYS.LeptonGenerations.the_neutron_and_the_neutrino_are_neutral' depends on axioms: [propext, Quot.sound]
'SPHYS.LeptonGenerations.the_quark_charges_are_thirds' depends on axioms: [propext, Quot.sound]
'SPHYS.LeptonGenerations.the_pairs_split_by_the_step' depends on axioms: [propext, Quot.sound]
'SPHYS.LeptonGenerations.one_step_for_both_pairs' depends on axioms: [propext, Quot.sound]
'SPHYS.LeptonGenerations.a_triple_of_quarks_carries_a_whole_charge' depends on axioms: [propext, Quot.sound]
'SPHYS.LeptonGenerations.a_single_quark_carries_a_part_charge' depends on axioms: [propext, Quot.sound]
'SPHYS.LeptonGenerations.each_generation_closes_alone' depends on axioms: [propext, Quot.sound]
'SPHYS.LeptonGenerations.copies_with_one_unit_have_one_table' depends on axioms: [propext, Quot.sound]
'SPHYS.LeptonGenerations.a_total_can_hide_a_failure' depends on axioms: [propext]
'SPHYS.LeptonGenerations.the_count_of_the_phases' depends on axioms: [propext, Quot.sound]
'SPHYS.LeptonGenerations.three_is_the_least_with_a_phase' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.LeptonGenerations.none_none_and_one' depends on axioms: [propext, Quot.sound]
'SPHYS.LeptonGenerations.a_total_of_zeros_is_zero' depends on axioms: [propext]
'SPHYS.LeptonGenerations.a_number_carried_cannot_be_left_with_none' depends on axioms: [propext, Quot.sound]
'SPHYS.LeptonGenerations.the_number_adds' depends on axioms: [propext, Quot.sound]
'SPHYS.LeptonGenerations.the_lepton_generations' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.LeptonGenerations.every_model_of_the_generations_is_an_instance' depends on axioms: [propext, Quot.sound]
```

## Appendix C · Provenance Trail

The frame, the reading and the special cases of this paper are on the public record before it. The table lists each step at the grade its own record carries, with the address where that record can be read. The theorems of this paper, in the generality of Appendix A, are in the last row and in no earlier one. A row marked frame or reading states no theorem of this paper; a row marked special case proves or checks the subject on one model; a row marked kernel, structural carries Lean theorems on printed models; a row marked theorem on premises carries a law forced from named premises. The third column gives, for each row, the term of that record which is the precursor, and why the row is on the trail.

**Table C.1 · The grade ladder of the line of the generations, 2026**

| Date | Grade | Precursor term, and why it is on the trail | Record | Address |
|---|---|---|---|---|
| 24 Mar | Frame, first anchor | **three orthogonal Ductions converging on one point.** The frame of the series: a point fixed by three independent axes, with the witness outside them | *Trisduction, A Geometric Epistemology of Absolute Convergence* | <https://trisduction.blogspot.com/2026/03/trisduction-geometric-epistemology-of.html> |
| 19 Jul | Reading | **the four forces and matter as configurations of one substrate.** The forces and the particles read as one kind of thing, in prose | *The Four Forces, Matter, and the Dark Sector as Configurations of One Actuating Substrate* | <https://doi.org/10.5281/zenodo.21438933> |
| 27 Sep | Special case | **the electron is the seat; the positron is the partner.** Charge conjugation read as the reflection, on one model with its numbers entered | *The Electron Is the Seat* | <https://doi.org/10.5281/zenodo.22986553> |
| 27 Sep | Special case | **the neutrino is the witness.** The neutral lepton read on the fixed line, on one model | *The Neutrino Is the Witness* | <https://doi.org/10.5281/zenodo.22986555> |
| 25 Nov | Theorem on premises | **closure forces the table.** The lepton charges follow from the quark charges; the atom is neutral | *The Charges of Matter as a New Mathematical Theorem* | <https://doi.org/10.5281/zenodo.24519057> |
| 25 Nov | Theorem on premises | **a charge that does not commute.** The equations of the nuclear forces forced; eight and three carriers; three the least with a phase | *The Nuclear Forces as a New Mathematical Theorem* | <https://doi.org/10.5281/zenodo.24524874> |
| 26 Nov | Theorem | **each copy closes its own table.** On any index and any commutative ring: closure copy by copy, one unit one table, three the least with a phase | *This paper, edition 1.0.0: the generations on any index* | `not yet deposited` |

Dates are Zenodo publication dates where a DOI is given and the date printed on its page for the row of 24 March. The Lean files of the rows of 25 November were compiled again for this paper on Lean 4.19.0, from the copies in the repository 1000sapients/Trisduction, branch main, and compiled without error. The terms of the rows of 19 July and 27 September are taken from the titles of their records. This paper has no address until it is deposited.
