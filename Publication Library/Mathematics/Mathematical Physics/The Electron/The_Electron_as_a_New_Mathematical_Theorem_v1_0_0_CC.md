# The Electron as a New Mathematical Theorem

## A Charged State Has a Partner, No Numbers Take the Square Root of the Energy Law, the Full Turn Is Minus One, Two Alike Are Excluded, and Its Charge Is the Least Read Alone

**Mohammad F. Islam PhD** · 26 November 2026

## Abstract

This paper proves, in Lean 4 with Mathlib, what is forced about the electron by five facts taken as given: it carries a charge, conjugation reverses a charge, its law is a square root of the energy law, its amplitude changes sign when two are exchanged, and its charge sits in a table closed by five equations. Each statement is made on the widest structure its proof allows. On any group of charges with no element of order two, a state is its own partner exactly when it is neutral; a charged state therefore has a partner that is another state, with the opposite charge and the same remaining record, and no function of that record returns the charge of both. In any ring, the square of a sum is the sum of the squares exactly when the two anticommute; in a commutative ring with no zero divisors, where two is not zero, no two elements other than zero anticommute, so no numbers take the square root. A matrix that anticommutes with one whose square is one has trace zero. A root of minus one, squared, is not one, and its fourth power is one: the full turn is minus one and the double turn returns. An amplitude antisymmetric in two states of any type is zero on two alike, and a sign whose square is one is one or minus one. In any commutative ring the five equations fix every charge as a whole multiple of one of them; the proton and the electron carry opposite charges; and every set of quarks whose number is a multiple of three carries a whole multiple of the electron's charge. The file has 30 theorems, declares no axiom and leaves no proof open. The mass of the electron is measured and enters no theorem.

## 1. The Theorem and What It Rests On

### 1.1 The statement

The binding theorem `the_electron` states, for any group $Q$ of charges with no element of order two and any type $A$ of further records: (i) a state $(q, a)$ is fixed by conjugation $(q,a) \mapsto (-q,a)$ exactly when $q = 0$; (ii) if $q \ne 0$ the conjugate is another state with charge $-q$ and record $a$; (iii) no function $g$ of the record satisfies $g(a) = q$ for both a charged state and its conjugate; (iv) every amplitude with $\psi(a,b) = -\psi(b,a)$ has $\psi(a,a) = 0$; (v) the charge of the proton plus the charge of the electron is zero for every unit of charge; (vi) if $3$ divides $a + b$ then $6$ divides $4a - 2b$.

### 1.2 What is proved, what is cited, what is assumed

Proved in Appendix A, and checked by the kernel of Lean 4 [10] with the Mathlib library [7]: every statement of Section 1.1 and of Sections 2 to 6. Assumed: the five facts of the abstract. That the law of the electron is a square root of the energy law is the step of Dirac [1]; that there are exactly four components in four dimensions is proved in the companion paper [8] and cited. The five equations of the table are those of the companion paper [9]: three allow mass to be given, two are closures. Cited and not formalised: the discovery of the partner [2]; the connection of spin with statistics [3]. Measured and not derived: the mass of the electron, the size of its charge and its magnetic moment.

### 1.3 What electron means here

The electron means a state with a charge that is not zero, a half spin, an antisymmetric amplitude, and the charge $-6\,y_Q$ of the table of Section 6. The paper proves what follows from these and does not prove that nature contains such a state.

## 2. A Charged State Has a Partner

Conjugation is a fold (`conjugation_is_a_fold`). The theorem `its_own_partner_iff_neutral` states that a state is on its line exactly when its charge is zero. So a charged state has a partner (`a_charged_state_has_a_partner`), and the two together are neutral (`the_pair_together_is_neutral`). The theorem `no_reading_of_the_kept_record_returns_the_charge` states that mass, spin and everything else conjugation keeps cannot give the charge: any function of them takes one value on the pair, and the pair has two charges.

## 3. No Numbers Take the Square Root

The energy law is a sum of squares. A linear law whose square is that sum needs coefficients with $(x+y)^2 = x^2 + y^2$. The theorem `the_square_forces_the_relation` states, in any ring, that this holds exactly when $xy + yx = 0$. The theorem `no_numbers_anticommute` states that in a commutative ring with no zero divisors, where two is not zero, this forces $x = 0$ or $y = 0$. So the coefficients are not numbers. They are matrices, and `an_anticommuting_matrix_has_trace_zero` states that each has trace zero, over any commutative ring with no element of additive order two. Two that anticommute and square to minus one have a product that squares to minus one (`the_product_of_two_roots_is_a_root`), and the three close on one another (`the_three_roots_return_minus_one`).

## 4. The Full Turn

A half turn is a root $u$ of minus one. The theorem `the_full_turn_is_minus_one` states that $u^2 \ne 1$ where $1 + 1 \ne 0$, and $u^4 = 1$. A state built on such roots returns to itself after two full turns and not after one.

## 5. Exclusion

The theorem `exclusion` holds for any type of states and any group of amplitudes with no element of order two: $\psi(a,b) = -\psi(b,a)$ gives $\psi(a,a) = 0$. The other sign excludes nothing (`a_kept_sign_excludes_nothing`). The theorem `two_statistics_and_no_third` states that a sign whose square is one, where there are no zero divisors, is one or minus one.

## 6. The Charge

Six charges enter: of the quark pair $y_Q$, the single quarks $y_u$ and $y_d$, the lepton pair $y_L$, the single lepton $y_e$, and the field that gives mass $y_H$. The theorem `the_table_is_forced` states, in any commutative ring, that the five equations give $y_u = -4y_Q$, $y_d = 2y_Q$, $y_L = -3y_Q$, $y_e = 6y_Q$, $y_H = 3y_Q$. No division is used. The electric charges are read off (`the_charges_are_read_from_the_table`): up $4y_Q$, down $-2y_Q$, electron $-6y_Q$. Then `the_atom_is_neutral` states that two up quarks, one down quark and one electron carry total charge zero, for every $y_Q$. The pairs split by one step, the charge of the field that gives mass (`the_pairs_split_by_the_step`, `one_step_for_both_pairs`); the neutron and the neutrino are neutral (`the_neutron_and_the_neutrino_are_neutral`); the quark charges are thirds (`the_quark_charges_are_thirds`). The theorem `a_triple_of_quarks_carries_a_whole_charge` states that any number of up and down quarks, antiquarks counted negative, with total number a multiple of three, carries a whole multiple of the electron's charge, and `a_single_quark_carries_a_part_charge` that one quark does not. In that sense the electron's charge is the least that is read alone.

## 7. What Is Subsumed and What Is Not

The theorem `every_model_of_a_charged_particle_is_an_instance` states that any model, on any type, with any conjugation, carried one to one into a charge and a record with the conjugations matched, is its own partner exactly where its charge is zero. The general theorems of the seat it rests on are `every_model_is_an_instance`, `every_reading_of_the_seat_is_a_reading_of_the_model`, `an_odd_reading_is_zero_on_the_line` and `an_odd_reading_off_zero_tells_the_pair`. The earlier record of this trail, a model with the numbers of the electron entered, is an instance. So is the muon, the tau and any charged state not yet observed: nothing in Sections 2 to 5 uses a mass.

Not subsumed: the number of components, which is proved elsewhere [8]; the value of any constant; and any model in which conjugation does not reverse the charge.

## 8. The File, Theorem by Theorem

| Theorem | Axioms its proof uses |
|---|---|
| `a_kept_reading_is_one_on_the_pair` | no axiom |
| `an_odd_reading_is_zero_on_the_line` | propext |
| `an_odd_reading_off_zero_tells_the_pair` | propext |
| `every_model_is_an_instance` | no axiom |
| `every_reading_of_the_seat_is_a_reading_of_the_model` | no axiom |
| `conjugation_is_a_fold` | propext |
| `its_own_partner_iff_neutral` | propext |
| `a_charged_state_has_a_partner` | propext |
| `no_reading_of_the_kept_record_returns_the_charge` | propext |
| `the_pair_together_is_neutral` | propext |
| `the_square_forces_the_relation` | propext |
| `the_product_of_two_roots_is_a_root` | propext |
| `the_three_roots_return_minus_one` | propext |
| `no_numbers_anticommute` | propext, Quot.sound |
| `an_anticommuting_matrix_has_trace_zero` | propext, Classical.choice, Quot.sound |
| `the_full_turn_is_minus_one` | propext |
| `exclusion` | propext |
| `a_kept_sign_excludes_nothing` | propext |
| `two_statistics_and_no_third` | propext, Quot.sound |
| `the_table_is_forced` | propext, Quot.sound |
| `the_charges_are_read_from_the_table` | propext, Quot.sound |
| `the_atom_is_neutral` | propext, Quot.sound |
| `the_neutron_and_the_neutrino_are_neutral` | propext, Quot.sound |
| `the_quark_charges_are_thirds` | propext, Quot.sound |
| `the_pairs_split_by_the_step` | propext, Quot.sound |
| `one_step_for_both_pairs` | propext, Quot.sound |
| `a_triple_of_quarks_carries_a_whole_charge` | propext, Quot.sound |
| `a_single_quark_carries_a_part_charge` | propext, Quot.sound |
| `the_electron` | propext, Quot.sound |
| `every_model_of_a_charged_particle_is_an_instance` | propext |

## 9. Discussion: The Reading

The following is a reading and is carried at the grade of a premise. On the seat of this series a point off the line is one of a pair that a kept reading cannot tell apart. The electron is a point off the line of conjugation; the positron is its partner; the mass is a kept reading and the charge is the item the map moves. Nothing in Sections 2 to 7 depends on this paragraph.

## 10. Predictions, Falsifiers, and What Stands

### 10.1 Two predictions that will stand

First: the charges of the proton and the electron are opposite and equal in size, at any precision. The neutrality of matter has been tested to parts in $10^{21}$ [4]. Second: the electron and its partner have the same mass. The comparison for the proton and its partner stands at parts in $10^{11}$ [5].

### 10.2 The two falsifiers

First: a measured difference between the sizes of the charges of the proton and the electron. This would break the table of Section 6, and with it one of the five equations. Second: two electrons found in one state. This would break the antisymmetry assumed in Section 1.2; searches have found none [6].

### 10.3 What kind of result this is

The theorems are identities, equivalences and implications from stated facts. They say what any state with those facts must be. They do not derive a mass or the size of the unit of charge.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file is written by a language model under the author's direct supervision. Every theorem named in the text is in Appendix A under that name, and its kernel line is printed in Appendix B. Classical results and measurements that are cited and not formalised are named as such where they are used. No constant of nature is derived anywhere in this paper: no mass, no strength of a coupling and no angle of a mixing is a theorem here, and where a measured value is quoted it is quoted from its source.

**The seat.** The seat is elementary: a set and a map of the set to itself, with the points the map leaves in place called its line. In the plane it is a reflection and the line it fixes, studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1. P. A. M. Dirac, Proc. R. Soc. A 117 (1928) 610.
2. C. D. Anderson, Phys. Rev. 43 (1933) 491.
3. W. Pauli, Phys. Rev. 58 (1940) 716.
4. G. Bressi et al., Phys. Rev. A 83 (2011) 052101.
5. M. J. Borchert et al., Nature 601 (2022) 53.
6. C. Curceanu et al. (VIP-2 Collaboration), Entropy 19 (2017) 300.
7. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
8. M. F. Islam, Matter as a New Mathematical Theorem (2026).
9. M. F. Islam, The Charges of Matter as a New Mathematical Theorem (2026).
10. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
11. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its file uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main.

12. The law of a half spin, forced: Publication Library/Mathematics/Mathematical Physics/Matter/SPHYS_Dirac_Forced_CC.lean. Compiled with Mathlib 4.19.0, exit 0.
13. The table of charges, forced: Publication Library/Mathematics/Mathematical Physics/The Charges of Matter/SPHYS_Charge_Closure_CC.lean. Compiled with Mathlib 4.19.0, exit 0.
14. The seat: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_46_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.

## Appendix A · SPHYS_Electron_Theorem_CC.lean

Lean 4.19.0 with Mathlib 4.19.0. 30 theorems, no axiom declared, no `sorry`, exit 0 with no warning. Every cone is pinned at the end of the file, so the build is silent. The kernel lines are Appendix B.

```lean
/-
SPHYS_Electron_Theorem_CC.lean · The Electron as a New Mathematical Theorem. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. The electron is stated by what is forced about it: a charge that conjugation reverses, a square root of the energy
  law that no numbers supply, a full turn that is minus one, an amplitude that vanishes on two alike, and a charge that is
  the least read alone. Each is on any ring or any type the proof allows. DESIGN. Part 0 the seat. Part I the charged state on
  any group of charges. Part II the square root, in any ring. Part III the full turn. Part IV exclusion. Part V the charge.
RISK. The mass of the electron is measured and enters no theorem. The four components are proved in
  SPHYS_Dirac_Forced_CC.lean and are cited, not repeated.
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

namespace SPHYS.Electron

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

/-! ## Part I. The charged state, on any group of charges and any other record. -/

section Charged
variable {Q A : Type*} [AddGroup Q]

/-- Conjugation reverses the charge and keeps the rest of the record. -/
def conj (p : Q × A) : Q × A := (-p.1, p.2)

theorem conjugation_is_a_fold (p : Q × A) : conj (conj p) = p := by
  simp [conj]

/-- A STATE IS ITS OWN PARTNER EXACTLY WHEN IT IS NEUTRAL. -/
theorem its_own_partner_iff_neutral (h2 : ∀ v : Q, v + v = 0 → v = 0) (p : Q × A) : OnLine conj p ↔ p.1 = 0 := by
  constructor
  · intro h
    have h1 : -p.1 = p.1 := congrArg Prod.fst h
    apply h2
    nth_rewrite 1 [← h1]
    exact neg_add_cancel _
  · intro h
    show conj p = p
    ext
    · show -p.1 = p.1
      rw [h, neg_zero]
    · rfl

/-- THE PARTNER IS FORCED. A charged state has a partner that is another state, with the opposite charge and the same record. -/
theorem a_charged_state_has_a_partner (h2 : ∀ v : Q, v + v = 0 → v = 0) (p : Q × A) (hq : p.1 ≠ 0) :
    conj p ≠ p ∧ (conj p).1 = -p.1 ∧ (conj p).2 = p.2 :=
  ⟨fun h => hq ((its_own_partner_iff_neutral h2 p).1 h), rfl, rfl⟩

/-- NO READING OF THE REST OF THE RECORD RETURNS THE CHARGE. Mass, spin and every other kept record are the same for the
two; no function of them is the charge of both. -/
theorem no_reading_of_the_kept_record_returns_the_charge (h2 : ∀ v : Q, v + v = 0 → v = 0) (g : A → Q) (p : Q × A)
    (hq : p.1 ≠ 0) : ¬ (g p.2 = p.1 ∧ g (conj p).2 = (conj p).1) := by
  rintro ⟨h1, h3⟩
  have h4 : p.1 = -p.1 := h1.symm.trans h3
  apply hq; apply h2
  nth_rewrite 2 [h4]
  exact add_neg_cancel _

/-- The pair together is neutral. -/
theorem the_pair_together_is_neutral (p : Q × A) : p.1 + (conj p).1 = 0 := add_neg_cancel _

end Charged

/-! ## Part II. The square root of the energy law, in any ring. -/

section Root
variable {A : Type*} [Ring A]

/-- THE SQUARE FORCES THE RELATION. The square of a sum is the sum of the squares exactly when the two anticommute. -/
theorem the_square_forces_the_relation (x y : A) : (x + y) * (x + y) = x * x + y * y ↔ x * y + y * x = 0 := by
  have e : (x + y) * (x + y) = x * x + y * y + (x * y + y * x) := by noncomm_ring
  rw [e]
  constructor
  · intro h; exact add_left_cancel (a := x * x + y * y) (by rw [h, add_zero])
  · intro h; rw [h, add_zero]

/-- Two that anticommute and square to minus one have a product that squares to minus one. -/
theorem the_product_of_two_roots_is_a_root (i j : A) (hi : i * i = -1) (hj : j * j = -1) (hij : i * j = -(j * i)) :
    (i * j) * (i * j) = -1 := by
  have hji : j * i = -(i * j) := by rw [hij, neg_neg]
  calc (i * j) * (i * j) = i * (j * i) * j := by noncomm_ring
    _ = i * (-(i * j)) * j := by rw [hji]
    _ = -((i * i) * (j * j)) := by noncomm_ring
    _ = -1 := by rw [hi, hj]; noncomm_ring

/-- The three together return minus one. -/
theorem the_three_roots_return_minus_one (i j : A) (hi : i * i = -1) (hj : j * j = -1) (hij : i * j = -(j * i)) :
    i * j * (i * j) = -1 ∧ i * (i * j) = -j ∧ (i * j) * j = -i := by
  refine ⟨the_product_of_two_roots_is_a_root i j hi hj hij, ?_, ?_⟩
  · rw [← mul_assoc, hi]; noncomm_ring
  · rw [mul_assoc, hj]; noncomm_ring

end Root

/-- NO NUMBERS TAKE THE SQUARE ROOT. In a commutative ring with no zero divisors where two is not zero, two that
anticommute are not both other than zero. -/
theorem no_numbers_anticommute {K : Type*} [CommRing K] [NoZeroDivisors K] (h2 : (2 : K) ≠ 0) (x y : K)
    (h : x * y + y * x = 0) : x = 0 ∨ y = 0 := by
  have e : 2 * (x * y) = 0 := by linear_combination h
  rcases mul_eq_zero.1 e with h | h
  · exact absurd h h2
  · exact mul_eq_zero.1 h

/-- A matrix that anticommutes with one whose square is one has trace zero. -/
theorem an_anticommuting_matrix_has_trace_zero {n K : Type*} [Fintype n] [DecidableEq n] [CommRing K]
    (h2 : ∀ v : K, v + v = 0 → v = 0) (M N : Matrix n n K) (hN : N * N = 1) (h : M * N = -(N * M)) :
    Matrix.trace M = 0 := by
  apply h2
  have e : Matrix.trace M = - Matrix.trace M := by
    calc Matrix.trace M = Matrix.trace ((M * N) * N) := by rw [mul_assoc, hN, mul_one]
      _ = Matrix.trace (-(N * M) * N) := by rw [h]
      _ = - Matrix.trace ((N * M) * N) := by rw [neg_mul, Matrix.trace_neg]
      _ = - Matrix.trace (N * (N * M)) := by rw [Matrix.trace_mul_comm]
      _ = - Matrix.trace M := by rw [← mul_assoc, hN, one_mul]
  nth_rewrite 1 [e]
  exact neg_add_cancel _

/-! ## Part III. The full turn. -/

/-- THE FULL TURN IS MINUS ONE AND THE DOUBLE TURN RETURNS. A half turn is a root of minus one: done twice it is minus one,
which is not one where two is not zero, and done four times it is one. -/
theorem the_full_turn_is_minus_one {A : Type*} [Ring A] (h2 : (1 : A) + 1 ≠ 0) (u : A) (hu : u * u = -1) :
    u * u ≠ 1 ∧ (u * u) * (u * u) = 1 := by
  refine ⟨fun h => h2 ?_, by rw [hu]; noncomm_ring⟩
  rw [hu] at h
  nth_rewrite 1 [← h]
  exact neg_add_cancel _

/-! ## Part IV. Exclusion, on any type of states and any group of amplitudes. -/

/-- EXCLUSION. An amplitude that changes sign when two are exchanged is zero when the two are alike. -/
theorem exclusion {S V : Type*} [AddGroup V] (h2 : ∀ v : V, v + v = 0 → v = 0) (ψ : S → S → V)
    (hanti : ∀ a b, ψ a b = - ψ b a) (a : S) : ψ a a = 0 := by
  apply h2
  nth_rewrite 1 [hanti a a]
  exact neg_add_cancel _

/-- An amplitude that keeps its sign excludes nothing: one exists that is not zero on two alike. -/
theorem a_kept_sign_excludes_nothing {S V : Type*} [AddGroup V] (v : V) (hv : v ≠ 0) (a : S) :
    ∃ ψ : S → S → V, (∀ a b, ψ a b = ψ b a) ∧ ψ a a ≠ 0 := ⟨fun _ _ => v, fun _ _ => rfl, hv⟩

/-- TWO STATISTICS AND NO THIRD. A sign whose square is one, where there are no zero divisors, is one or minus one. -/
theorem two_statistics_and_no_third {K : Type*} [CommRing K] [NoZeroDivisors K] (s : K) (hs : s * s = 1) :
    s = 1 ∨ s = -1 := by
  have e : (s - 1) * (s + 1) = 0 := by linear_combination hs
  rcases mul_eq_zero.1 e with h | h
  · left; linear_combination h
  · right; linear_combination h

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

/-- THE ELECTRON. -/
theorem the_electron {Q A : Type*} [AddGroup Q] (h2 : ∀ v : Q, v + v = 0 → v = 0) :
    (∀ p : Q × A, OnLine conj p ↔ p.1 = 0)
    ∧ (∀ p : Q × A, p.1 ≠ 0 → conj p ≠ p ∧ (conj p).1 = -p.1 ∧ (conj p).2 = p.2)
    ∧ (∀ (g : A → Q) (p : Q × A), p.1 ≠ 0 → ¬ (g p.2 = p.1 ∧ g (conj p).2 = (conj p).1))
    ∧ (∀ (S : Type) (ψ : S → S → Q), (∀ a b, ψ a b = - ψ b a) → ∀ a, ψ a a = 0)
    ∧ (∀ yQ : ℤ, qProton yQ + qElectron yQ = 0)
    ∧ (∀ a b : ℤ, (3 : ℤ) ∣ a + b → (6 : ℤ) ∣ 4 * a - 2 * b) :=
  ⟨its_own_partner_iff_neutral h2, a_charged_state_has_a_partner h2,
   fun g p hq => no_reading_of_the_kept_record_returns_the_charge h2 g p hq,
   fun _ ψ h a => exclusion h2 ψ h a, the_atom_is_neutral, a_triple_of_quarks_carries_a_whole_charge⟩

/-- SUBSUMPTION. Any model of a charged particle, on any type, with any conjugation, carried one to one into a charge and
a record with the conjugations matched, is its own partner exactly where its charge is zero. -/
theorem every_model_of_a_charged_particle_is_an_instance {Q A Y : Type*} [AddGroup Q]
    (h2 : ∀ v : Q, v + v = 0 → v = 0) (τ : Y → Y) (φ : Y → Q × A) (hφ : Function.Injective φ)
    (heq : ∀ y, φ (τ y) = conj (φ y)) (y : Y) : OnLine τ y ↔ (φ y).1 = 0 :=
  (every_model_is_an_instance conj τ φ hφ heq y).trans (its_own_partner_iff_neutral h2 (φ y))


end SPHYS.Electron

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.Electron.a_kept_reading_is_one_on_the_pair' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Electron.a_kept_reading_is_one_on_the_pair
/-- info: 'SPHYS.Electron.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Electron.an_odd_reading_is_zero_on_the_line
/-- info: 'SPHYS.Electron.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Electron.an_odd_reading_off_zero_tells_the_pair
/-- info: 'SPHYS.Electron.every_model_is_an_instance' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Electron.every_model_is_an_instance
/-- info: 'SPHYS.Electron.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Electron.every_reading_of_the_seat_is_a_reading_of_the_model
/-- info: 'SPHYS.Electron.conjugation_is_a_fold' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Electron.conjugation_is_a_fold
/-- info: 'SPHYS.Electron.its_own_partner_iff_neutral' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Electron.its_own_partner_iff_neutral
/-- info: 'SPHYS.Electron.a_charged_state_has_a_partner' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Electron.a_charged_state_has_a_partner
/-- info: 'SPHYS.Electron.no_reading_of_the_kept_record_returns_the_charge' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Electron.no_reading_of_the_kept_record_returns_the_charge
/-- info: 'SPHYS.Electron.the_pair_together_is_neutral' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Electron.the_pair_together_is_neutral
/-- info: 'SPHYS.Electron.the_square_forces_the_relation' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Electron.the_square_forces_the_relation
/-- info: 'SPHYS.Electron.the_product_of_two_roots_is_a_root' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Electron.the_product_of_two_roots_is_a_root
/-- info: 'SPHYS.Electron.the_three_roots_return_minus_one' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Electron.the_three_roots_return_minus_one
/-- info: 'SPHYS.Electron.no_numbers_anticommute' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Electron.no_numbers_anticommute
/--
info: 'SPHYS.Electron.an_anticommuting_matrix_has_trace_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Electron.an_anticommuting_matrix_has_trace_zero
/-- info: 'SPHYS.Electron.the_full_turn_is_minus_one' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Electron.the_full_turn_is_minus_one
/-- info: 'SPHYS.Electron.exclusion' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Electron.exclusion
/-- info: 'SPHYS.Electron.a_kept_sign_excludes_nothing' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Electron.a_kept_sign_excludes_nothing
/-- info: 'SPHYS.Electron.two_statistics_and_no_third' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Electron.two_statistics_and_no_third
/-- info: 'SPHYS.Electron.the_table_is_forced' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Electron.the_table_is_forced
/-- info: 'SPHYS.Electron.the_charges_are_read_from_the_table' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Electron.the_charges_are_read_from_the_table
/-- info: 'SPHYS.Electron.the_atom_is_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Electron.the_atom_is_neutral
/-- info: 'SPHYS.Electron.the_neutron_and_the_neutrino_are_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Electron.the_neutron_and_the_neutrino_are_neutral
/-- info: 'SPHYS.Electron.the_quark_charges_are_thirds' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Electron.the_quark_charges_are_thirds
/-- info: 'SPHYS.Electron.the_pairs_split_by_the_step' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Electron.the_pairs_split_by_the_step
/-- info: 'SPHYS.Electron.one_step_for_both_pairs' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Electron.one_step_for_both_pairs
/-- info: 'SPHYS.Electron.a_triple_of_quarks_carries_a_whole_charge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Electron.a_triple_of_quarks_carries_a_whole_charge
/-- info: 'SPHYS.Electron.a_single_quark_carries_a_part_charge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Electron.a_single_quark_carries_a_part_charge
/-- info: 'SPHYS.Electron.the_electron' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Electron.the_electron
/-- info: 'SPHYS.Electron.every_model_of_a_charged_particle_is_an_instance' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Electron.every_model_of_a_charged_particle_is_an_instance
```

## Appendix B · Kernel lines of Appendix A

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

```text
'SPHYS.Electron.a_kept_reading_is_one_on_the_pair' does not depend on any axioms
'SPHYS.Electron.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext]
'SPHYS.Electron.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext]
'SPHYS.Electron.every_model_is_an_instance' does not depend on any axioms
'SPHYS.Electron.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms
'SPHYS.Electron.conjugation_is_a_fold' depends on axioms: [propext]
'SPHYS.Electron.its_own_partner_iff_neutral' depends on axioms: [propext]
'SPHYS.Electron.a_charged_state_has_a_partner' depends on axioms: [propext]
'SPHYS.Electron.no_reading_of_the_kept_record_returns_the_charge' depends on axioms: [propext]
'SPHYS.Electron.the_pair_together_is_neutral' depends on axioms: [propext]
'SPHYS.Electron.the_square_forces_the_relation' depends on axioms: [propext]
'SPHYS.Electron.the_product_of_two_roots_is_a_root' depends on axioms: [propext]
'SPHYS.Electron.the_three_roots_return_minus_one' depends on axioms: [propext]
'SPHYS.Electron.no_numbers_anticommute' depends on axioms: [propext, Quot.sound]
'SPHYS.Electron.an_anticommuting_matrix_has_trace_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Electron.the_full_turn_is_minus_one' depends on axioms: [propext]
'SPHYS.Electron.exclusion' depends on axioms: [propext]
'SPHYS.Electron.a_kept_sign_excludes_nothing' depends on axioms: [propext]
'SPHYS.Electron.two_statistics_and_no_third' depends on axioms: [propext, Quot.sound]
'SPHYS.Electron.the_table_is_forced' depends on axioms: [propext, Quot.sound]
'SPHYS.Electron.the_charges_are_read_from_the_table' depends on axioms: [propext, Quot.sound]
'SPHYS.Electron.the_atom_is_neutral' depends on axioms: [propext, Quot.sound]
'SPHYS.Electron.the_neutron_and_the_neutrino_are_neutral' depends on axioms: [propext, Quot.sound]
'SPHYS.Electron.the_quark_charges_are_thirds' depends on axioms: [propext, Quot.sound]
'SPHYS.Electron.the_pairs_split_by_the_step' depends on axioms: [propext, Quot.sound]
'SPHYS.Electron.one_step_for_both_pairs' depends on axioms: [propext, Quot.sound]
'SPHYS.Electron.a_triple_of_quarks_carries_a_whole_charge' depends on axioms: [propext, Quot.sound]
'SPHYS.Electron.a_single_quark_carries_a_part_charge' depends on axioms: [propext, Quot.sound]
'SPHYS.Electron.the_electron' depends on axioms: [propext, Quot.sound]
'SPHYS.Electron.every_model_of_a_charged_particle_is_an_instance' depends on axioms: [propext]
```

## Appendix C · Provenance Trail

The frame, the reading and the special cases of this paper are on the public record before it. The table lists each step at the grade its own record carries, with the address where that record can be read. The theorems of this paper, in the generality of Appendix A, are in the last row and in no earlier one. A row marked frame or reading states no theorem of this paper; a row marked special case proves or checks the subject on one model; a row marked kernel, structural carries Lean theorems on printed models; a row marked theorem on premises carries a law forced from named premises. The third column gives, for each row, the term of that record which is the precursor, and why the row is on the trail.

**Table C.1 · The grade ladder of the electron line, 2026**

| Date | Grade | Precursor term, and why it is on the trail | Record | Address |
|---|---|---|---|---|
| 24 Mar | Frame, first anchor | **three orthogonal Ductions converging on one point.** The frame of the series: a point fixed by three independent axes, with the witness outside them | *Trisduction, A Geometric Epistemology of Absolute Convergence* | <https://trisduction.blogspot.com/2026/03/trisduction-geometric-epistemology-of.html> |
| 19 Jul | Reading | **the four forces and matter as configurations of one substrate.** The forces and the particles read as one kind of thing, in prose | *The Four Forces, Matter, and the Dark Sector as Configurations of One Actuating Substrate* | <https://doi.org/10.5281/zenodo.21438933> |
| 27 Sep | Special case | **the electron is the seat; the positron is the partner.** Charge conjugation read as the reflection, on one model with its numbers entered | *The Electron Is the Seat* | <https://doi.org/10.5281/zenodo.22986553> |
| 25 Nov | Theorem on premises | **exclusion forced by the full turn.** The least law of a half spin; four components; exclusion | *Matter as a New Mathematical Theorem* | <https://doi.org/10.5281/zenodo.24519034> |
| 25 Nov | Theorem on premises | **closure forces the table.** The lepton charges follow from the quark charges; the atom is neutral | *The Charges of Matter as a New Mathematical Theorem* | <https://doi.org/10.5281/zenodo.24519057> |
| 26 Nov | Theorem | **a charged state has a partner.** On any group of charges and any ring: the partner, the square root, the full turn, exclusion, the least charge read alone | *This paper, edition 1.0.0: the electron on any group of charges* | `not yet deposited` |

Dates are Zenodo publication dates where a DOI is given and the date printed on its page for the row of 24 March. The Lean files of the rows of 25 November were compiled again for this paper on Lean 4.19.0, from the copies in the repository 1000sapients/Trisduction, branch main, and compiled without error. The terms of the rows of 19 July and 27 September are taken from the titles of their records. This paper has no address until it is deposited.
