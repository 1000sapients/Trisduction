# The Strong Force as a New Mathematical Theorem

## A Law a Fold Keeps Has No Term the Fold Reverses, the Count of Freedom Is Positive Exactly up to Sixteen Kinds of Quark, and a Charge That Commutes Is Never Free

**Mohammad F. Islam PhD** · 26 November 2026

## Abstract

This paper proves, in Lean 4 with Mathlib, what is forced about the strong force. On any type of states, with any map of the states and any reading the map reverses that is not zero everywhere, a law that the map keeps has no term in that reading: its coefficient is zero, where two is not zero and there are no zero divisors. The product of the electric and magnetic parts of the field of the force is such a reading for the mirror, so the strong force reads no orientation exactly when the coefficient of that term is zero. A coupling equal on the two hands is on the line of the mirror. The count that decides freedom at short distance, $11N - 2f$ for $N$ colours and $f$ kinds of quark, is positive with three colours exactly for sixteen kinds or fewer; for any $N$ it is positive exactly when $2f < 11N$; it is never positive for a charge that commutes; and when it is positive there is at least one colour. The ratio of the rate into three kinds of quark to the rate into a lepton pair, computed from the charges of the table, is two exactly with three colours. No reading that every exchange of colours keeps reads a colour, and there are eight carriers. The file has 32 theorems, declares no axiom and leaves no proof open. The count $11N - 2f$ is the cited result of Gross, Wilczek and Politzer [1, 2]; it is written out and not derived here.

## 1. The Theorem and What It Rests On

### 1.1 The statement

The binding theorem `the_strong_force` states, over the integers: (i) $\theta\,(-e)\,b = \theta\,e\,b$ for all $e$, $b$ exactly when $\theta = 0$; (ii) every coupling $(g, g)$ is fixed by the exchange of hands; (iii) $11\cdot 3 - 2f > 0$ exactly when $f \le 16$; (iv) for $f \ge 0$, $-2f$ is not positive; (v) $N(q_u^2 + 2 q_d^2) = 2 q_e^2$ at unit one exactly when $N = 3$; (vi) the $3 \times 3$ rational matrices of trace zero have dimension eight.

### 1.2 What is proved, what is cited, what is assumed

Proved in Appendix A, and checked by the kernel of Lean 4 [7] with the Mathlib library [6]: every statement of Section 1.1 and of Sections 2 to 5. Assumed: that the strong force couples equally to the two hands; the five equations of the table of charges [8]. Cited and not formalised: the count $11N - 2f$ [1, 2]; the rule that a rate into a pair goes as the square of the charge and the number of colours; the proposal that removes the term the mirror reverses [4]. Measured and not derived: the strength of the coupling, the coefficient $\theta$, whose bound comes from the neutron [3], and the ratio of the rates [5].

### 1.3 What strong force means here

The strong force means the force carried by the eight carriers of the charge with three kinds, coupled equally to the two hands.

## 2. The Orientation

The theorem `a_law_a_fold_keeps_has_no_term_the_fold_reverses` is the general statement. If $\tau(\sigma x) = -\tau(x)$, $\tau(x_0) \ne 0$ and $\theta\,\tau(\sigma x) = \theta\,\tau(x)$ for every $x$, then $\theta = 0$. Its converse is `with_no_such_term_the_law_is_kept`. The mirror reverses the electric part and keeps the magnetic part, so their product is reversed (`the_twist_is_reversed_by_the_mirror`), and `the_strong_force_reads_no_orientation` is the equivalence for that term. The theorem `on_the_line_of_the_mirror_iff_the_hands_are_equal` states that a coupling is fixed by the exchange of hands exactly when its two entries are equal. The paper does not explain why the coefficient is zero in nature; it proves that a force that keeps the mirror has none, and that the measured bound [3] is the statement that this force keeps it.

## 3. The Freedom

The count is `count N f = 11 N - 2 f`. `free_exactly_up_to_sixteen`, `free_iff_few_kinds`, `a_commuting_charge_is_never_free` and `freedom_needs_colours` are statements about its sign. Six kinds of quark are known; sixteen is the limit. A force whose charge commutes has $N = 0$ in the count and grows stronger at short distance.

## 4. The Colours

With the table forced (`the_table_is_forced`, `the_charges_are_read_from_the_table`), the sum of the squares of the charges of the up quark and two down-type quarks is twenty-four at unit one and the square of the electron's charge is thirty-six. `the_ratio_counts_the_colours` states that $24N = 72$ exactly when $N = 3$. The theorem `no_kept_reading_reads_a_colour` is the statement of another paper of this series, printed again here. The table also gives `the_atom_is_neutral`, `the_neutron_and_the_neutrino_are_neutral`, `the_quark_charges_are_thirds`, `the_pairs_split_by_the_step`, `one_step_for_both_pairs`, `a_triple_of_quarks_carries_a_whole_charge` and `a_single_quark_carries_a_part_charge`.

## 5. The Carriers

`the_count_of_the_carriers` and `eight_three_and_none` give eight. `the_commutator_of_two_is_a_carrier`, `a_commuting_charge_has_no_commutator` and `carriers_that_do_not_commute` state that the carriers read one another, which is what makes the count of Section 3 positive.

## 6. What Is Subsumed and What Is Not

The theorem `every_law_with_a_kept_fold_is_an_instance` states the equivalence of Section 2 for any type of states, any map and any reversed reading. A law with a term that the reversal of time reverses, a model on a lattice, or a force not yet observed, is an instance once its map and reading are named. The general theorems of the seat, `every_model_is_an_instance`, `every_reading_of_the_seat_is_a_reading_of_the_model`, `an_odd_reading_is_zero_on_the_line`, `an_odd_reading_off_zero_tells_the_pair` and `a_kept_reading_is_one_on_the_pair`, are in Part 0.

Not subsumed: the derivation of the count of Section 3; confinement; the reason the coefficient is zero.

## 7. The File, Theorem by Theorem

| Theorem | Axioms its proof uses |
|---|---|
| `a_kept_reading_is_one_on_the_pair` | no axiom |
| `an_odd_reading_is_zero_on_the_line` | propext |
| `an_odd_reading_off_zero_tells_the_pair` | propext |
| `every_model_is_an_instance` | no axiom |
| `every_reading_of_the_seat_is_a_reading_of_the_model` | no axiom |
| `a_law_a_fold_keeps_has_no_term_the_fold_reverses` | propext, Quot.sound |
| `with_no_such_term_the_law_is_kept` | no axiom |
| `the_twist_is_reversed_by_the_mirror` | propext, Quot.sound |
| `the_strong_force_reads_no_orientation` | propext, Quot.sound |
| `on_the_line_of_the_mirror_iff_the_hands_are_equal` | no axiom |
| `free_exactly_up_to_sixteen` | propext, Quot.sound |
| `free_iff_few_kinds` | propext, Quot.sound |
| `a_commuting_charge_is_never_free` | propext, Quot.sound |
| `freedom_needs_colours` | propext, Quot.sound |
| `the_table_is_forced` | propext, Quot.sound |
| `the_charges_are_read_from_the_table` | propext, Quot.sound |
| `the_atom_is_neutral` | propext, Quot.sound |
| `the_neutron_and_the_neutrino_are_neutral` | propext, Quot.sound |
| `the_quark_charges_are_thirds` | propext, Quot.sound |
| `the_pairs_split_by_the_step` | propext, Quot.sound |
| `one_step_for_both_pairs` | propext, Quot.sound |
| `a_triple_of_quarks_carries_a_whole_charge` | propext, Quot.sound |
| `a_single_quark_carries_a_part_charge` | propext, Quot.sound |
| `the_ratio_counts_the_colours` | propext, Quot.sound |
| `no_kept_reading_reads_a_colour` | propext, Quot.sound |
| `the_count_of_the_carriers` | propext, Classical.choice, Quot.sound |
| `eight_three_and_none` | propext, Classical.choice, Quot.sound |
| `the_commutator_of_two_is_a_carrier` | propext, Classical.choice, Quot.sound |
| `a_commuting_charge_has_no_commutator` | propext, Quot.sound |
| `carriers_that_do_not_commute` | propext, Classical.choice, Quot.sound |
| `the_strong_force` | propext, Classical.choice, Quot.sound |
| `every_law_with_a_kept_fold_is_an_instance` | propext, Quot.sound |

## 8. Discussion: The Reading

The following is a reading and is carried at the grade of a premise. On the seat of this series a force is a reading, kept or reversed by each map. The strong force keeps the mirror, so it has no term the mirror reverses and reads no orientation. The weak force is the opposite case and is the subject of the next paper; the equations of both are forced elsewhere [9]. Nothing in Sections 2 to 6 depends on this paragraph.

## 9. Predictions, Falsifiers, and What Stands

### 9.1 Two predictions that will stand

First: the neutron shows no electric moment from the strong force. Second: the strong force weakens at short distance for as long as the known kinds of quark are sixteen or fewer.

### 9.2 The two falsifiers

First: a measured electric moment of the neutron traced to the term of Section 2. By the equivalence this would show that the strong force does not keep the mirror. Second: a measured strengthening of the force at short distance with six kinds of quark. This would break the cited count.

### 9.3 What kind of result this is

The theorems are an equivalence on any type, sign statements about a cited count, and a count of colours from a ratio. They derive no strength.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file is written by a language model under the author's direct supervision. Every theorem named in the text is in Appendix A under that name, and its kernel line is printed in Appendix B. Classical results and measurements that are cited and not formalised are named as such where they are used. No constant of nature is derived anywhere in this paper: no mass, no strength of a coupling and no angle of a mixing is a theorem here, and where a measured value is quoted it is quoted from its source.

**The seat.** The seat is elementary: a set and a map of the set to itself, with the points the map leaves in place called its line. In the plane it is a reflection and the line it fixes, studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1. D. J. Gross and F. Wilczek, Phys. Rev. Lett. 30 (1973) 1343.
2. H. D. Politzer, Phys. Rev. Lett. 30 (1973) 1346.
3. C. Abel et al., Phys. Rev. Lett. 124 (2020) 081803.
4. R. D. Peccei and H. R. Quinn, Phys. Rev. Lett. 38 (1977) 1440.
5. R. L. Workman et al. (Particle Data Group), Prog. Theor. Exp. Phys. 2022 (2022) 083C01.
6. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
7. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
8. M. F. Islam, The Charges of Matter as a New Mathematical Theorem (2026).
9. M. F. Islam, The Nuclear Forces as a New Mathematical Theorem (2026).
10. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its file uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main.

11. The law of a charge that does not commute, forced: Publication Library/Mathematics/Mathematical Physics/The Nuclear Forces/SPHYS_YangMills_Forced_CC.lean. Compiled with Mathlib 4.19.0, exit 0.
12. The table of charges, forced: Publication Library/Mathematics/Mathematical Physics/The Charges of Matter/SPHYS_Charge_Closure_CC.lean. Compiled with Mathlib 4.19.0, exit 0.
13. The seat: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_46_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.

## Appendix A · SPHYS_Strong_Force_Theorem_CC.lean

Lean 4.19.0 with Mathlib 4.19.0. 32 theorems, no axiom declared, no `sorry`, exit 0 with no warning. Every cone is pinned at the end of the file, so the build is silent. The kernel lines are Appendix B.

```lean
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
```

## Appendix B · Kernel lines of Appendix A

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

```text
'SPHYS.StrongForce.a_kept_reading_is_one_on_the_pair' does not depend on any axioms
'SPHYS.StrongForce.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext]
'SPHYS.StrongForce.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext]
'SPHYS.StrongForce.every_model_is_an_instance' does not depend on any axioms
'SPHYS.StrongForce.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms
'SPHYS.StrongForce.a_law_a_fold_keeps_has_no_term_the_fold_reverses' depends on axioms: [propext, Quot.sound]
'SPHYS.StrongForce.with_no_such_term_the_law_is_kept' does not depend on any axioms
'SPHYS.StrongForce.the_twist_is_reversed_by_the_mirror' depends on axioms: [propext, Quot.sound]
'SPHYS.StrongForce.the_strong_force_reads_no_orientation' depends on axioms: [propext, Quot.sound]
'SPHYS.StrongForce.on_the_line_of_the_mirror_iff_the_hands_are_equal' does not depend on any axioms
'SPHYS.StrongForce.free_exactly_up_to_sixteen' depends on axioms: [propext, Quot.sound]
'SPHYS.StrongForce.free_iff_few_kinds' depends on axioms: [propext, Quot.sound]
'SPHYS.StrongForce.a_commuting_charge_is_never_free' depends on axioms: [propext, Quot.sound]
'SPHYS.StrongForce.freedom_needs_colours' depends on axioms: [propext, Quot.sound]
'SPHYS.StrongForce.the_table_is_forced' depends on axioms: [propext, Quot.sound]
'SPHYS.StrongForce.the_charges_are_read_from_the_table' depends on axioms: [propext, Quot.sound]
'SPHYS.StrongForce.the_atom_is_neutral' depends on axioms: [propext, Quot.sound]
'SPHYS.StrongForce.the_neutron_and_the_neutrino_are_neutral' depends on axioms: [propext, Quot.sound]
'SPHYS.StrongForce.the_quark_charges_are_thirds' depends on axioms: [propext, Quot.sound]
'SPHYS.StrongForce.the_pairs_split_by_the_step' depends on axioms: [propext, Quot.sound]
'SPHYS.StrongForce.one_step_for_both_pairs' depends on axioms: [propext, Quot.sound]
'SPHYS.StrongForce.a_triple_of_quarks_carries_a_whole_charge' depends on axioms: [propext, Quot.sound]
'SPHYS.StrongForce.a_single_quark_carries_a_part_charge' depends on axioms: [propext, Quot.sound]
'SPHYS.StrongForce.the_ratio_counts_the_colours' depends on axioms: [propext, Quot.sound]
'SPHYS.StrongForce.no_kept_reading_reads_a_colour' depends on axioms: [propext, Quot.sound]
'SPHYS.StrongForce.the_count_of_the_carriers' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.StrongForce.eight_three_and_none' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.StrongForce.the_commutator_of_two_is_a_carrier' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.StrongForce.a_commuting_charge_has_no_commutator' depends on axioms: [propext, Quot.sound]
'SPHYS.StrongForce.carriers_that_do_not_commute' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.StrongForce.the_strong_force' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.StrongForce.every_law_with_a_kept_fold_is_an_instance' depends on axioms: [propext, Quot.sound]
```

## Appendix C · Provenance Trail

The frame, the reading and the special cases of this paper are on the public record before it. The table lists each step at the grade its own record carries, with the address where that record can be read. The theorems of this paper, in the generality of Appendix A, are in the last row and in no earlier one. A row marked frame or reading states no theorem of this paper; a row marked special case proves or checks the subject on one model; a row marked kernel, structural carries Lean theorems on printed models; a row marked theorem on premises carries a law forced from named premises. The third column gives, for each row, the term of that record which is the precursor, and why the row is on the trail.

**Table C.1 · The grade ladder of the line of the strong force, 2026**

| Date | Grade | Precursor term, and why it is on the trail | Record | Address |
|---|---|---|---|---|
| 24 Mar | Frame, first anchor | **three orthogonal Ductions converging on one point.** The frame of the series: a point fixed by three independent axes, with the witness outside them | *Trisduction, A Geometric Epistemology of Absolute Convergence* | <https://trisduction.blogspot.com/2026/03/trisduction-geometric-epistemology-of.html> |
| 19 Jul | Reading | **the four forces and matter as configurations of one substrate.** The forces and the particles read as one kind of thing, in prose | *The Four Forces, Matter, and the Dark Sector as Configurations of One Actuating Substrate* | <https://doi.org/10.5281/zenodo.21438933> |
| 22 Oct | Kernel, structural | **the drafts of the physical series, with their Lean files.** The strong force reads no orientation, with a Lean file: the sign of the term the mirror reverses | *Draft papers of the physical series, with a Lean file each, at* `protocols/PhysOS/Draft Papers/` | <https://github.com/1000sapients/Trisduction/commit/ca67284> |
| 25 Nov | Theorem on premises | **closure forces the table.** The lepton charges follow from the quark charges; the atom is neutral | *The Charges of Matter as a New Mathematical Theorem* | <https://doi.org/10.5281/zenodo.24519057> |
| 25 Nov | Theorem on premises | **a charge that does not commute.** The equations of the nuclear forces forced; eight and three carriers; three the least with a phase | *The Nuclear Forces as a New Mathematical Theorem* | <https://doi.org/10.5281/zenodo.24524874> |
| 26 Nov | Theorem | **a law a fold keeps has no term the fold reverses.** On any type of states: the orientation, the sign of the count of freedom, the colours from the ratio | *This paper, edition 1.0.0: the strong force on any type of states* | `not yet deposited` |

Dates are Zenodo publication dates where a DOI is given and the date printed on its page for the row of 24 March. The date of the row of 22 October is the git commit date. The Lean files of the rows of 22 October and 25 November were compiled again for this paper on Lean 4.19.0, from the copies in the repository 1000sapients/Trisduction, branch main, and compiled without error. The terms of the rows of 19 July are taken from the titles of their records. This paper has no address until it is deposited.
