# The Neutrino as a New Mathematical Theorem

## Neutral by the Table, Read by One Hand, Two on One Charge if It Carries a Number and Numberless if It Is Its Own Partner, with a Mixing That Loses Nothing or Erases

**Mohammad F. Islam PhD** · 26 November 2026

## Abstract

This paper proves, in Lean 4 with Mathlib, what is forced about the neutral member of the lepton pair. Its charge is zero for every unit of charge, as a consequence of the five equations that close the table of charges in any commutative ring. On any two groups of labels with no element of order two, a state is its own partner exactly when it carries neither charge nor number. So a neutral state that carries a number is not its own partner, and its charge does not tell it from its partner; and a neutral state that is its own partner carries no number. The file proves both branches and asserts neither. On any commutative ring, the right-hand reading of the neutral current is zero for every neutral state, for every pair charge and every mixing; the two hands differ by the pair charge; and a neutral state with a pair charge is off the line of the mirror. For square matrices over any commutative ring a mixing with a return on one side has it on the other, a map of a finite set into itself that merges no two states reaches all, and any map from more states to fewer merges two. If the squares of two masses differ the two are not both zero; three differences of squares add to zero; and a difference that is not zero has exactly one of two signs. The file has 29 theorems, declares no axiom and leaves no proof open. No mass and no angle is derived.

## 1. The Theorem and What It Rests On

### 1.1 The statement

The binding theorem `the_neutrino` states: (i) the charge of the neutral member of the lepton pair is zero for every integer unit; (ii) a state with charge zero and a number not zero differs from its conjugate, and has the charge of its conjugate; (iii) a state fixed by conjugation has number zero; (iv) the right-hand reading $-q s$ of the neutral current is zero at $q = 0$; (v) a neutral state with pair charge $t \ne 0$ is not fixed by the exchange of the two hands; (vi) for three-by-three matrices over the rationals, $UV = 1$ gives $VU = 1$. The general forms, on any groups, rings and finite types, are in Sections 2 to 5.

### 1.2 What is proved, what is cited, what is assumed

Proved in Appendix A, and checked by the kernel of Lean 4 [12] with the Mathlib library [10]: every statement of Section 1.1 and of Sections 2 to 6. Assumed: that conjugation reverses the charge and the lepton number; that the neutral current reads a state of pair charge $t$, charge $q$ and mixing $s$ as $t - qs$ on the left and $-qs$ on the right, which is the standard form and is not derived here; and the five equations of the table [11]. Cited and not formalised: the proposal and the theory of the neutrino [1]; its detection [2]; its helicity [3]; the possibility that it is its own partner [4]; the mixing matrix [5]; oscillation [6, 7]. Measured and not derived: the differences of the squares of the masses, the angles, and whether the neutrino carries a lepton number, which is open [8].

### 1.3 What neutrino means here

The neutrino means the member of the lepton pair whose charge the table makes zero. Whether it carries a lepton number is not part of the definition.

## 2. A Charge and a Number

Conjugation on a charge, a number and a further record is a fold (`conjugation_is_a_fold`). The theorem `its_own_partner_iff_neutral_and_numberless` gives its line. Two consequences are stated apart. `neutral_with_a_number_is_two_on_one_charge`: a neutral state with a number is one of a pair, and the charge, being zero on both, is a reading that cannot tell them apart. `its_own_partner_carries_no_number`: a state that is its own partner has number zero. A process that changes the lepton number by two is possible only on the second branch. Its observation would settle which branch nature takes; either result is covered.

## 3. One Hand

The theorem `a_neutral_state_has_no_right_hand` holds on any commutative ring. The theorem `the_hands_differ_by_the_pair_charge` states that left minus right is $t$ for every $q$ and $s$, and `a_neutral_state_is_read_by_one_hand` that the pair of readings of a neutral state with $t \ne 0$ is off the line of the mirror. The neutral current reads the neutrino by its left hand only, whatever the mixing.

## 4. Mixing

The theorem `a_mixing_with_a_return_loses_nothing` is stated for square matrices of any finite size over any commutative ring. `a_mixing_that_merges_none_reaches_all` is the same fact for maps of a finite set. `a_mixing_into_fewer_states_erases` states that any map from a finite set to a smaller one sends two states to one. If the three known states mixed with a fourth, the three-by-three part alone would not return.

## 5. The Masses

`oscillation_forces_a_mass`: if $m_1^2 \ne m_2^2$ then $m_1 \ne 0$ or $m_2 \ne 0$. `three_differences_two_free`: the three differences of three squares add to zero, so two are free. `the_ordering_is_one_bit`: a difference that is not zero is below zero or above it and not both. The ordering of the masses is one such sign.

## 6. The Charge

The table is forced in any commutative ring (`the_table_is_forced`), the charges are read from it (`the_charges_are_read_from_the_table`), and the pairs split by one step (`the_pairs_split_by_the_step`): the lepton pair has charge $y_L = -3y_Q$ and the step is $y_H = 3y_Q$, so its upper member has charge zero. That is `the_neutron_and_the_neutrino_are_neutral`. The same table gives `the_atom_is_neutral`, `the_quark_charges_are_thirds`, `one_step_for_both_pairs`, `a_triple_of_quarks_carries_a_whole_charge` and `a_single_quark_carries_a_part_charge`, which are used in other papers of this series and are printed here so the file stands alone.

## 7. What Is Subsumed and What Is Not

The theorem `every_model_of_a_neutral_particle_is_an_instance` states that any model, on any type, with any conjugation, carried one to one into a charge, a number and a record with the conjugations matched, is its own partner exactly where its image carries neither. It rests on `every_model_is_an_instance`; readings are carried by `every_reading_of_the_seat_is_a_reading_of_the_model`; a reversed reading is zero on the line (`an_odd_reading_is_zero_on_the_line`) and tells the pair apart off it (`an_odd_reading_off_zero_tells_the_pair`); a kept reading is one on the pair (`a_kept_reading_is_one_on_the_pair`). The earlier record of this trail, a model with two labels entered, is an instance, and so is any further neutral state, with any number of generations.

Not subsumed: the values of the masses and angles; the question of the lepton number; and a neutral current of another form.

## 8. The File, Theorem by Theorem

| Theorem | Axioms its proof uses |
|---|---|
| `a_kept_reading_is_one_on_the_pair` | no axiom |
| `an_odd_reading_is_zero_on_the_line` | propext |
| `an_odd_reading_off_zero_tells_the_pair` | propext |
| `every_model_is_an_instance` | no axiom |
| `every_reading_of_the_seat_is_a_reading_of_the_model` | no axiom |
| `conjugation_is_a_fold` | propext |
| `its_own_partner_iff_neutral_and_numberless` | propext |
| `neutral_with_a_number_is_two_on_one_charge` | propext |
| `its_own_partner_carries_no_number` | propext |
| `a_neutral_state_has_no_right_hand` | propext |
| `the_hands_differ_by_the_pair_charge` | propext |
| `a_neutral_state_is_read_by_one_hand` | propext |
| `a_mixing_with_a_return_loses_nothing` | propext, Classical.choice, Quot.sound |
| `a_mixing_that_merges_none_reaches_all` | propext, Classical.choice, Quot.sound |
| `a_mixing_into_fewer_states_erases` | propext, Classical.choice, Quot.sound |
| `oscillation_forces_a_mass` | propext, Classical.choice, Quot.sound |
| `three_differences_two_free` | propext |
| `the_ordering_is_one_bit` | propext |
| `the_table_is_forced` | propext, Quot.sound |
| `the_charges_are_read_from_the_table` | propext, Quot.sound |
| `the_atom_is_neutral` | propext, Quot.sound |
| `the_neutron_and_the_neutrino_are_neutral` | propext, Quot.sound |
| `the_quark_charges_are_thirds` | propext, Quot.sound |
| `the_pairs_split_by_the_step` | propext, Quot.sound |
| `one_step_for_both_pairs` | propext, Quot.sound |
| `a_triple_of_quarks_carries_a_whole_charge` | propext, Quot.sound |
| `a_single_quark_carries_a_part_charge` | propext, Quot.sound |
| `the_neutrino` | propext, Classical.choice, Quot.sound |
| `every_model_of_a_neutral_particle_is_an_instance` | propext |

## 9. Discussion: The Reading

The following is a reading and is carried at the grade of a premise. On the seat of this series a neutral state is on the line of the conjugation of charge. The neutrino is on that line. Whether it is also on the line of the conjugation of number is the open question, and the two answers are the two branches of Section 2. Nothing in Sections 2 to 7 depends on this paragraph.

## 10. Predictions, Falsifiers, and What Stands

### 10.1 Two predictions that will stand

First: the neutrino carries no electric charge at any precision. Second: the neutral current does not read a right-handed neutrino.

### 10.2 The two falsifiers

First: a measured electric charge of a neutrino. This would break the table of Section 6. Second: a measured right-hand reading of a neutral state by the neutral current. This would break the form of the current assumed in Section 1.2.

### 10.3 What kind of result this is

The theorems are identities, equivalences and implications from stated facts. They cover both answers to the open question and derive no mass. Direct bounds on the mass are measurements [9].

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file is written by a language model under the author's direct supervision. Every theorem named in the text is in Appendix A under that name, and its kernel line is printed in Appendix B. Classical results and measurements that are cited and not formalised are named as such where they are used. No constant of nature is derived anywhere in this paper: no mass, no strength of a coupling and no angle of a mixing is a theorem here, and where a measured value is quoted it is quoted from its source.

**The seat.** The seat is elementary: a set and a map of the set to itself, with the points the map leaves in place called its line. In the plane it is a reflection and the line it fixes, studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1. E. Fermi, Z. Phys. 88 (1934) 161.
2. C. L. Cowan et al., Science 124 (1956) 103.
3. M. Goldhaber, L. Grodzins and A. W. Sunyar, Phys. Rev. 109 (1958) 1015.
4. E. Majorana, Nuovo Cimento 14 (1937) 171.
5. Z. Maki, M. Nakagawa and S. Sakata, Prog. Theor. Phys. 28 (1962) 870.
6. Y. Fukuda et al. (Super-Kamiokande Collaboration), Phys. Rev. Lett. 81 (1998) 1562.
7. Q. R. Ahmad et al. (SNO Collaboration), Phys. Rev. Lett. 89 (2002) 011301.
8. S. Abe et al. (KamLAND-Zen Collaboration), Phys. Rev. Lett. 130 (2023) 051801.
9. M. Aker et al. (KATRIN Collaboration), Nat. Phys. 18 (2022) 160.
10. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
11. M. F. Islam, The Charges of Matter as a New Mathematical Theorem (2026).
12. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
13. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its file uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main.

14. The table of charges, forced: Publication Library/Mathematics/Mathematical Physics/The Charges of Matter/SPHYS_Charge_Closure_CC.lean. Compiled with Mathlib 4.19.0, exit 0.
15. The seat: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_46_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.

## Appendix A · SPHYS_Neutrino_Theorem_CC.lean

Lean 4.19.0 with Mathlib 4.19.0. 29 theorems, no axiom declared, no `sorry`, exit 0 with no warning. Every cone is pinned at the end of the file, so the build is silent. The kernel lines are Appendix B.

```lean
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
```

## Appendix B · Kernel lines of Appendix A

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

```text
'SPHYS.Neutrino.a_kept_reading_is_one_on_the_pair' does not depend on any axioms
'SPHYS.Neutrino.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext]
'SPHYS.Neutrino.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext]
'SPHYS.Neutrino.every_model_is_an_instance' does not depend on any axioms
'SPHYS.Neutrino.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms
'SPHYS.Neutrino.conjugation_is_a_fold' depends on axioms: [propext]
'SPHYS.Neutrino.its_own_partner_iff_neutral_and_numberless' depends on axioms: [propext]
'SPHYS.Neutrino.neutral_with_a_number_is_two_on_one_charge' depends on axioms: [propext]
'SPHYS.Neutrino.its_own_partner_carries_no_number' depends on axioms: [propext]
'SPHYS.Neutrino.a_neutral_state_has_no_right_hand' depends on axioms: [propext]
'SPHYS.Neutrino.the_hands_differ_by_the_pair_charge' depends on axioms: [propext]
'SPHYS.Neutrino.a_neutral_state_is_read_by_one_hand' depends on axioms: [propext]
'SPHYS.Neutrino.a_mixing_with_a_return_loses_nothing' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Neutrino.a_mixing_that_merges_none_reaches_all' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Neutrino.a_mixing_into_fewer_states_erases' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Neutrino.oscillation_forces_a_mass' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Neutrino.three_differences_two_free' depends on axioms: [propext]
'SPHYS.Neutrino.the_ordering_is_one_bit' depends on axioms: [propext]
'SPHYS.Neutrino.the_table_is_forced' depends on axioms: [propext, Quot.sound]
'SPHYS.Neutrino.the_charges_are_read_from_the_table' depends on axioms: [propext, Quot.sound]
'SPHYS.Neutrino.the_atom_is_neutral' depends on axioms: [propext, Quot.sound]
'SPHYS.Neutrino.the_neutron_and_the_neutrino_are_neutral' depends on axioms: [propext, Quot.sound]
'SPHYS.Neutrino.the_quark_charges_are_thirds' depends on axioms: [propext, Quot.sound]
'SPHYS.Neutrino.the_pairs_split_by_the_step' depends on axioms: [propext, Quot.sound]
'SPHYS.Neutrino.one_step_for_both_pairs' depends on axioms: [propext, Quot.sound]
'SPHYS.Neutrino.a_triple_of_quarks_carries_a_whole_charge' depends on axioms: [propext, Quot.sound]
'SPHYS.Neutrino.a_single_quark_carries_a_part_charge' depends on axioms: [propext, Quot.sound]
'SPHYS.Neutrino.the_neutrino' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Neutrino.every_model_of_a_neutral_particle_is_an_instance' depends on axioms: [propext]
```

## Appendix C · Provenance Trail

The frame, the reading and the special cases of this paper are on the public record before it. The table lists each step at the grade its own record carries, with the address where that record can be read. The theorems of this paper, in the generality of Appendix A, are in the last row and in no earlier one. A row marked frame or reading states no theorem of this paper; a row marked special case proves or checks the subject on one model; a row marked kernel, structural carries Lean theorems on printed models; a row marked theorem on premises carries a law forced from named premises. The third column gives, for each row, the term of that record which is the precursor, and why the row is on the trail.

**Table C.1 · The grade ladder of the neutrino line, 2026**

| Date | Grade | Precursor term, and why it is on the trail | Record | Address |
|---|---|---|---|---|
| 24 Mar | Frame, first anchor | **three orthogonal Ductions converging on one point.** The frame of the series: a point fixed by three independent axes, with the witness outside them | *Trisduction, A Geometric Epistemology of Absolute Convergence* | <https://trisduction.blogspot.com/2026/03/trisduction-geometric-epistemology-of.html> |
| 19 Jul | Reading | **the four forces and matter as configurations of one substrate.** The forces and the particles read as one kind of thing, in prose | *The Four Forces, Matter, and the Dark Sector as Configurations of One Actuating Substrate* | <https://doi.org/10.5281/zenodo.21438933> |
| 27 Sep | Special case | **the neutrino is the witness.** The neutral lepton read on the fixed line, on one model | *The Neutrino Is the Witness* | <https://doi.org/10.5281/zenodo.22986555> |
| 22 Oct | Kernel, structural | **the drafts of the physical series, with their Lean files.** The weak force on the seat, with a Lean file: the neutral lepton has no right hand | *Draft papers of the physical series, with a Lean file each, at* `protocols/PhysOS/Draft Papers/` | <https://github.com/1000sapients/Trisduction/commit/ca67284> |
| 25 Nov | Theorem on premises | **closure forces the table.** The lepton charges follow from the quark charges; the atom is neutral | *The Charges of Matter as a New Mathematical Theorem* | <https://doi.org/10.5281/zenodo.24519057> |
| 26 Nov | Theorem | **neutral by the table, read by one hand.** On any groups and rings: the two branches of the lepton number, the hand, the mixing, the masses | *This paper, edition 1.0.0: the neutrino on any two groups of labels* | `not yet deposited` |

Dates are Zenodo publication dates where a DOI is given and the date printed on its page for the row of 24 March. The date of the row of 22 October is the git commit date. The Lean files of the rows of 22 October and 25 November were compiled again for this paper on Lean 4.19.0, from the copies in the repository 1000sapients/Trisduction, branch main, and compiled without error. The terms of the rows of 19 July and 27 September are taken from the titles of their records. This paper has no address until it is deposited.
