# The Mass of the Carriers as a New Mathematical Theorem

## A Kept Gauge Leaves No Mass, a Law Its Fold Keeps Can Rest off the Line in a Pair the Fold Exchanges, and a Carrier Has a Mass Exactly When the Lowest State Carries Its Charge

**Mohammad F. Islam PhD** · 26 November 2026

## Abstract

This paper proves, in Lean 4 with Mathlib, what is forced about the mass of a carrier. For any symmetric additive form on any additive group, a mass term that a change of gauge keeps is zero, where two is not zero and there are no zero divisors. Over any ordered field, the law $V(\varphi) = (\varphi^2 - v^2)^2$ is kept by the map $\varphi \mapsto -\varphi$, is nowhere below zero, and is zero exactly at $v$ and at $-v$. Where $v \ne 0$ these two lowest states are two, the map exchanges them, neither is on the line of the map, and the one state on the line is not lowest. Where $v = 0$ the lowest state is one and is on the line. In any commutative ring the term $(g\,q\,(v+h))^2$ of a carrier of strength $g$ reading the charge $q$ of the field at $v + h$ is a mass term $(gqv)^2$, a coupling to one $h$ and a coupling to two; where there are no zero divisors the mass term is not zero exactly when $g$, $q$ and $v$ are each not zero; and the carrier of a charge the lowest state does not carry has none. The count of states balances for any number of dimensions, carriers and states of the field: each carrier that gains a mass gains one state, and the field gives up one. The file has 19 theorems, declares no axiom and leaves no proof open. The value $v$ and the strengths are measured.

## 1. The Theorem and What It Rests On

### 1.1 The statement

The binding theorem `the_mass_of_the_carriers` states, over the rationals: (i) for $v \ne 0$: $v \ne -v$, $V(v) = V(-v) = 0$, $v$ is not fixed by $\varphi \mapsto -\varphi$, and $V(0) > 0$; (ii) $V(-\varphi) = V(\varphi)$; (iii) $(gqv)^2 \ne 0$ exactly when $g \ne 0$, $q \ne 0$ and $v \ne 0$; (iv) $(g \cdot 0 \cdot v)^2 = 0$; and over the integers (v) $(c-k)(n-2) + k(n-1) + (s-k) = c(n-2) + s$.

### 1.2 What is proved, what is cited, what is assumed

Proved in Appendix A, and checked by the kernel of Lean 4 [10] with the Mathlib library [9]: every statement of Section 1.1 and of Sections 2 to 5. Assumed: that the field that gives mass has a law of the form of Section 3, kept by a map, and that a carrier reads the charge of that field through the term of Section 4. This is the mechanism of [1, 2, 3], taken in its simplest form: one real component and one map. The paper does not derive it. Cited and not formalised: the massless state that a broken continuous symmetry leaves [4] and its removal in a superconductor [5]; the observation of the scalar [6, 7] and of its couplings [8]. Measured and not derived: $v$, the strengths, and every mass.

### 1.3 What mass of a carrier means here

The mass of a carrier means the coefficient of the term of second order in the carrier with the field at its lowest state. A spent bit means the choice of one of two lowest states that a map exchanges.

## 2. A Kept Gauge Leaves No Mass

The theorem `a_mass_is_changed_by_a_change_of_gauge` is the starting point. If the gauge is kept as it stands, the carrier has no mass. The carriers of the weak force have masses. So for them something is not kept as it stands. Sections 3 and 4 say what.

## 3. The Law and Its Lowest States

`the_law_is_kept_by_the_fold` and `the_law_is_nowhere_below_zero` are immediate. `the_lowest_states_are_a_pair` states that $V(\varphi) = 0$ exactly when $\varphi = v$ or $\varphi = -v$. The theorem `the_spent_bit` collects the case $v \ne 0$: the law is kept by the map and its lowest states are not. The field rests in one of the two. `with_no_settled_value_nothing_is_spent` is the case $v = 0$: one lowest state, on the line.

## 4. The Mass Term

`the_term_written_out` is the expansion. `a_mass_exactly_when_the_lowest_state_carries_the_charge` is the equivalence: a mass needs a strength, a charge of the field under that carrier, and a settled value. `the_carrier_of_a_kept_charge_has_no_mass` is the case of light: the lowest state carries no electric charge, so the photon stays without mass while the three weak carriers gain one. `the_mass_of_matter_written_out` states the same form for what the carriers read: a coupling $y$ gives a mass $yv$ and a coupling $y$ to $h$. In both expansions the coupling to one $h$ is fixed by the mass and $v$.

## 5. The Count

A carrier without mass has $n - 2$ states in $n$ dimensions and one with mass has $n - 1$. `the_count_balances` states that if $k$ of $c$ carriers gain a mass and the field gives up $k$ of its $s$ states, the total is unchanged, for all integers. `twelve_before_and_twelve_after` is the case of four dimensions, four carriers and four states of the field.

## 6. What Is Subsumed and What Is Not

The theorem `every_model_of_a_broken_fold_is_an_instance` states that any model of a field with a map, carried one to one into an ordered field with the maps matched, has its kept states exactly over zero. A model whose lowest states map to $v$ and $-v$ with $v \ne 0$ has therefore spent the bit, whatever its law. A magnet below its critical temperature, a crystal, and a field not yet observed are instances of Section 3. The general theorems of the seat, `every_model_is_an_instance`, `every_reading_of_the_seat_is_a_reading_of_the_model`, `an_odd_reading_is_zero_on_the_line`, `an_odd_reading_off_zero_tells_the_pair` and `a_kept_reading_is_one_on_the_pair`, are in Part 0.

Not subsumed: a field with several components and a continuous family of lowest states, for which the count of Section 5 is stated and the law of Section 3 is the one-component case; the value of $v$; the masses of matter, whose couplings $y$ are measured one by one.

## 7. The File, Theorem by Theorem

| Theorem | Axioms its proof uses |
|---|---|
| `a_kept_reading_is_one_on_the_pair` | no axiom |
| `an_odd_reading_is_zero_on_the_line` | propext |
| `an_odd_reading_off_zero_tells_the_pair` | propext |
| `every_model_is_an_instance` | no axiom |
| `every_reading_of_the_seat_is_a_reading_of_the_model` | no axiom |
| `a_mass_is_changed_by_a_change_of_gauge` | propext, Quot.sound |
| `the_law_is_kept_by_the_fold` | propext, Quot.sound |
| `the_law_is_nowhere_below_zero` | propext, Classical.choice, Quot.sound |
| `the_lowest_states_are_a_pair` | propext, Classical.choice, Quot.sound |
| `the_spent_bit` | propext, Classical.choice, Quot.sound |
| `with_no_settled_value_nothing_is_spent` | propext, Classical.choice, Quot.sound |
| `the_term_written_out` | propext |
| `a_mass_exactly_when_the_lowest_state_carries_the_charge` | propext |
| `the_carrier_of_a_kept_charge_has_no_mass` | propext |
| `the_mass_of_matter_written_out` | propext |
| `the_count_balances` | propext, Quot.sound |
| `twelve_before_and_twelve_after` | propext |
| `the_mass_of_the_carriers` | propext, Classical.choice, Quot.sound |
| `every_model_of_a_broken_fold_is_an_instance` | propext,  Classical.choice,  Quot.sound |

## 8. Discussion: The Reading

The following is a reading and is carried at the grade of a premise. On the seat of this series a point off the line is one of a pair, and to stand at one of them is to have taken one of two. The law of the field is on the line; its lowest state is not. The mass of a carrier is the mark of that: it is there exactly when the lowest state carries the carrier's charge. Nothing in Sections 2 to 6 depends on this paragraph.

## 9. Predictions, Falsifiers, and What Stands

### 9.1 Two predictions that will stand

First: the photon has no mass, at any precision. Second: the coupling of the scalar to each carrier and to each kind of matter is fixed by that particle's mass and one value $v$. The measured couplings follow this [8].

### 9.2 The two falsifiers

First: a measured mass of the photon. By Section 4 this would mean the lowest state carries electric charge. Second: a measured coupling of the scalar to a carrier or to a kind of matter that departs from the one fixed by its mass and $v$. This would break the term of Section 4 as the source of that mass.

### 9.3 What kind of result this is

The theorems are identities and equivalences over any ordered field and any commutative ring. They derive no mass.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file is written by a language model under the author's direct supervision. Every theorem named in the text is in Appendix A under that name, and its kernel line is printed in Appendix B. Classical results and measurements that are cited and not formalised are named as such where they are used. No constant of nature is derived anywhere in this paper: no mass, no strength of a coupling and no angle of a mixing is a theorem here, and where a measured value is quoted it is quoted from its source.

**The seat.** The seat is elementary: a set and a map of the set to itself, with the points the map leaves in place called its line. In the plane it is a reflection and the line it fixes, studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1. F. Englert and R. Brout, Phys. Rev. Lett. 13 (1964) 321.
2. P. W. Higgs, Phys. Rev. Lett. 13 (1964) 508.
3. G. S. Guralnik, C. R. Hagen and T. W. B. Kibble, Phys. Rev. Lett. 13 (1964) 585.
4. J. Goldstone, Nuovo Cimento 19 (1961) 154.
5. P. W. Anderson, Phys. Rev. 130 (1963) 439.
6. G. Aad et al. (ATLAS Collaboration), Phys. Lett. B 716 (2012) 1.
7. S. Chatrchyan et al. (CMS Collaboration), Phys. Lett. B 716 (2012) 30.
8. ATLAS Collaboration, Nature 607 (2022) 52.
9. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
10. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
11. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its file uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main.

12. The law of a charge that does not commute, forced: Publication Library/Mathematics/Mathematical Physics/The Nuclear Forces/SPHYS_YangMills_Forced_CC.lean. Compiled with Mathlib 4.19.0, exit 0.
13. The seat: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_46_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.

## Appendix A · SPHYS_Carrier_Mass_Theorem_CC.lean

Lean 4.19.0 with Mathlib 4.19.0. 19 theorems, no axiom declared, no `sorry`, exit 0 with no warning. Every cone is pinned at the end of the file, so the build is silent. The kernel lines are Appendix B.

```lean
/-
SPHYS_Carrier_Mass_Theorem_CC.lean · The Mass of the Carriers as a New Mathematical Theorem. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. What is forced about the mass of a carrier: a kept gauge leaves none; a law that a fold keeps can have its lowest
  states off the line of the fold, in a pair the fold exchanges, with the kept state not lowest; a carrier has a mass term
  exactly when the lowest state carries its charge; the carrier of a charge the lowest state does not carry stays without
  mass; the count of states balances. DESIGN. Part 0 the seat. Part I the mass and the gauge, for any symmetric additive
  form. Part II the law with a fold, over any ordered field. Part III the mass term, in any commutative ring. Part IV the count.
RISK. The value at which the field settles and the strength of the couplings are measured; the file proves the form of
  the mass term and where it vanishes. NON-NEGOTIABLE. No axiom is declared. No proof is left open.
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

namespace SPHYS.CarrierMass

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

/-! ## Part I. The mass and the gauge. -/

/-- A MASS IS CHANGED BY A CHANGE OF GAUGE. Let `B` be additive in its first place and symmetric, on any additive group,
let `k` be null, and let some `a₀` not be across `k`. If `m · B(a + k, a + k) = m · B(a, a)` for every `a`, then `m = 0`,
where two is not zero and there are no zero divisors. The carrier of a gauge that is kept has no mass. -/
theorem a_mass_is_changed_by_a_change_of_gauge {V K : Type*} [AddCommGroup V] [CommRing K] [NoZeroDivisors K]
    (h2 : (2 : K) ≠ 0) (B : V → V → K) (hl : ∀ a b c, B (a + b) c = B a c + B b c)
    (hs : ∀ a b, B a b = B b a) (k : V) (hk : B k k = 0) (a₀ : V) (ha₀ : B a₀ k ≠ 0) (m : K)
    (hm : ∀ a, m * B (a + k) (a + k) = m * B a a) : m = 0 := by
  have e : B (a₀ + k) (a₀ + k) = B a₀ a₀ + 2 * B a₀ k := by
    rw [hl, hs (a₀) (a₀ + k), hs k (a₀ + k), hl, hl, hk, hs k a₀]; ring
  have h := hm a₀
  rw [e] at h
  have h3 : m * (2 * B a₀ k) = 0 := by linear_combination h
  rcases mul_eq_zero.1 h3 with h | h
  · exact h
  · rcases mul_eq_zero.1 h with h | h
    · exact absurd h h2
    · exact absurd h ha₀

/-! ## Part II. A law with a fold, over any ordered field. The fold reverses the field `φ`; the law is
`V φ = (φ² − v²)²`. -/

section Law
variable {K : Type*} [Field K] [LinearOrder K] [IsStrictOrderedRing K]

def V (v φ : K) : K := (φ ^ 2 - v ^ 2) ^ 2

omit [LinearOrder K] [IsStrictOrderedRing K] in
/-- THE LAW IS KEPT BY THE FOLD. -/
theorem the_law_is_kept_by_the_fold (v φ : K) : V v (-φ) = V v φ := by simp only [V]; ring

/-- The law is nowhere below zero. -/
theorem the_law_is_nowhere_below_zero (v φ : K) : 0 ≤ V v φ := sq_nonneg _

/-- THE LOWEST STATES ARE A PAIR. The law is zero exactly at `v` and at `−v`. -/
theorem the_lowest_states_are_a_pair (v φ : K) : V v φ = 0 ↔ φ = v ∨ φ = -v := by
  simp only [V]
  constructor
  · intro h
    have h1 : (φ ^ 2 - v ^ 2) * (φ ^ 2 - v ^ 2) = 0 := by linear_combination h
    have h2 : (φ - v) * (φ + v) = 0 := by linear_combination mul_self_eq_zero.1 h1
    rcases mul_eq_zero.1 h2 with h | h
    · left; linear_combination h
    · right; linear_combination h
  · rintro (rfl | rfl) <;> ring

/-- THE SPENT BIT. Where `v` is not zero: the two lowest states are two; the fold exchanges them; neither is kept by the
fold; and the one state the fold keeps is not lowest. -/
theorem the_spent_bit (v : K) (hv : v ≠ 0) :
    v ≠ -v ∧ V v v = 0 ∧ V v (-v) = 0 ∧ ¬ OnLine (fun φ : K => -φ) v ∧ 0 < V v 0 := by
  have hvv : v ≠ -v := by
    intro h
    have : 2 * v = 0 := by linear_combination h
    rcases mul_eq_zero.1 this with h | h
    · exact two_ne_zero h
    · exact hv h
  refine ⟨hvv, (the_lowest_states_are_a_pair v v).2 (Or.inl rfl), (the_lowest_states_are_a_pair v (-v)).2 (Or.inr rfl),
    fun h => hvv (Eq.symm h), ?_⟩
  have h0 : V v 0 ≠ 0 := by
    intro h
    rcases (the_lowest_states_are_a_pair v 0).1 h with h | h
    · exact hv h.symm
    · exact hv (by linear_combination h)
  exact lt_of_le_of_ne (the_law_is_nowhere_below_zero v 0) (Ne.symm h0)

/-- WITH NO SETTLED VALUE NOTHING IS SPENT. Where `v` is zero the lowest state is one, and the fold keeps it. -/
theorem with_no_settled_value_nothing_is_spent (φ : K) : V 0 φ = 0 ↔ φ = 0 := by
  rw [the_lowest_states_are_a_pair]; simp

end Law

/-! ## Part III. The mass term, in any commutative ring. A carrier of strength `g` reads the charge `q` of the field; with
the field at `v + h` its term is `(g q (v + h))²`. -/

section Term
variable {R : Type*} [CommRing R]

/-- The term, written out: a mass term, a coupling to one `h` and a coupling to two. -/
theorem the_term_written_out (g q v h : R) :
    (g * q * (v + h)) ^ 2 = (g * q * v) ^ 2 + 2 * (g * q) ^ 2 * v * h + (g * q) ^ 2 * h ^ 2 := by ring

/-- A CARRIER HAS A MASS EXACTLY WHEN THE LOWEST STATE CARRIES ITS CHARGE. Where there are no zero divisors, the mass term
is not zero exactly when the strength, the charge and the settled value are each not zero. -/
theorem a_mass_exactly_when_the_lowest_state_carries_the_charge [NoZeroDivisors R] (g q v : R) :
    (g * q * v) ^ 2 ≠ 0 ↔ g ≠ 0 ∧ q ≠ 0 ∧ v ≠ 0 := by
  rw [Ne, sq, mul_self_eq_zero, mul_eq_zero, mul_eq_zero]
  constructor
  · intro h
    exact ⟨fun a => h (Or.inl (Or.inl a)), fun a => h (Or.inl (Or.inr a)), fun a => h (Or.inr a)⟩
  · rintro ⟨h1, h2, h3⟩ ((h | h) | h)
    · exact h1 h
    · exact h2 h
    · exact h3 h

/-- THE CARRIER OF A CHARGE THE LOWEST STATE DOES NOT CARRY STAYS WITHOUT MASS. -/
theorem the_carrier_of_a_kept_charge_has_no_mass (g v : R) : (g * 0 * v) ^ 2 = 0 := by ring

/-- The mass of what the carrier reads comes in the same way: a coupling `y` to the field gives the term `y (v + h)`. -/
theorem the_mass_of_matter_written_out (y v h : R) : y * (v + h) = y * v + y * h := by ring

end Term

/-! ## Part IV. The count. A carrier without mass has `n − 2` states and one with mass has `n − 1`. -/

/-- THE COUNT BALANCES. If `k` carriers gain a mass, the states they gain are `k`, and they are the `k` states the field
gives up, in any number of dimensions and for any number of carriers and of states of the field. -/
theorem the_count_balances (n c k s : ℤ) :
    (c - k) * (n - 2) + k * (n - 1) + (s - k) = c * (n - 2) + s := by ring

/-- In four dimensions with four carriers and four states of the field, three carriers with mass, one without and one
state left: twelve states before and twelve after. -/
theorem twelve_before_and_twelve_after : (3 * 3 + 1 * 2 + 1 : ℤ) = 4 * 2 + 4 := by norm_num

/-! ## Part V. The binding theorem and subsumption. -/

/-- THE MASS OF THE CARRIERS. -/
theorem the_mass_of_the_carriers :
    (∀ v : ℚ, v ≠ 0 → v ≠ -v ∧ V v v = 0 ∧ V v (-v) = 0 ∧ ¬ OnLine (fun φ : ℚ => -φ) v ∧ 0 < V v 0)
    ∧ (∀ v φ : ℚ, V v (-φ) = V v φ)
    ∧ (∀ g q v : ℚ, (g * q * v) ^ 2 ≠ 0 ↔ g ≠ 0 ∧ q ≠ 0 ∧ v ≠ 0)
    ∧ (∀ g v : ℚ, (g * 0 * v) ^ 2 = 0)
    ∧ (∀ n c k s : ℤ, (c - k) * (n - 2) + k * (n - 1) + (s - k) = c * (n - 2) + s) :=
  ⟨the_spent_bit, the_law_is_kept_by_the_fold, a_mass_exactly_when_the_lowest_state_carries_the_charge,
   the_carrier_of_a_kept_charge_has_no_mass, the_count_balances⟩

/-- SUBSUMPTION. Any model of a field with a fold, carried one to one into the ordered field with the folds matched, has
its kept states exactly over zero; so a model whose lowest states map to `v` and `−v`, `v` not zero, has spent the bit. -/
theorem every_model_of_a_broken_fold_is_an_instance {K Y : Type*} [Field K] [LinearOrder K] [IsStrictOrderedRing K]
    (τ : Y → Y) (f : Y → K) (hf : Function.Injective f) (heq : ∀ y, f (τ y) = -(f y)) (y : Y) :
    OnLine τ y ↔ f y = 0 := by
  rw [every_model_is_an_instance (fun φ : K => -φ) τ f hf heq y]
  constructor
  · intro h
    have h1 : -(f y) = f y := h
    have : 2 * f y = 0 := by linear_combination -h1
    rcases mul_eq_zero.1 this with h | h
    · exact absurd h two_ne_zero
    · exact h
  · intro h; show -(f y) = f y; rw [h, neg_zero]


end SPHYS.CarrierMass

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.CarrierMass.a_kept_reading_is_one_on_the_pair' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.CarrierMass.a_kept_reading_is_one_on_the_pair
/-- info: 'SPHYS.CarrierMass.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.an_odd_reading_is_zero_on_the_line
/-- info: 'SPHYS.CarrierMass.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.an_odd_reading_off_zero_tells_the_pair
/-- info: 'SPHYS.CarrierMass.every_model_is_an_instance' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.CarrierMass.every_model_is_an_instance
/-- info: 'SPHYS.CarrierMass.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.CarrierMass.every_reading_of_the_seat_is_a_reading_of_the_model
/-- info: 'SPHYS.CarrierMass.a_mass_is_changed_by_a_change_of_gauge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.a_mass_is_changed_by_a_change_of_gauge
/-- info: 'SPHYS.CarrierMass.the_law_is_kept_by_the_fold' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.the_law_is_kept_by_the_fold
/--
info: 'SPHYS.CarrierMass.the_law_is_nowhere_below_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.CarrierMass.the_law_is_nowhere_below_zero
/-- info: 'SPHYS.CarrierMass.the_lowest_states_are_a_pair' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.the_lowest_states_are_a_pair
/-- info: 'SPHYS.CarrierMass.the_spent_bit' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.the_spent_bit
/--
info: 'SPHYS.CarrierMass.with_no_settled_value_nothing_is_spent' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.CarrierMass.with_no_settled_value_nothing_is_spent
/-- info: 'SPHYS.CarrierMass.the_term_written_out' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.the_term_written_out
/-- info: 'SPHYS.CarrierMass.a_mass_exactly_when_the_lowest_state_carries_the_charge' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.a_mass_exactly_when_the_lowest_state_carries_the_charge
/-- info: 'SPHYS.CarrierMass.the_carrier_of_a_kept_charge_has_no_mass' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.the_carrier_of_a_kept_charge_has_no_mass
/-- info: 'SPHYS.CarrierMass.the_mass_of_matter_written_out' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.the_mass_of_matter_written_out
/-- info: 'SPHYS.CarrierMass.the_count_balances' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.the_count_balances
/-- info: 'SPHYS.CarrierMass.twelve_before_and_twelve_after' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.twelve_before_and_twelve_after
/-- info: 'SPHYS.CarrierMass.the_mass_of_the_carriers' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.CarrierMass.the_mass_of_the_carriers
/--
info: 'SPHYS.CarrierMass.every_model_of_a_broken_fold_is_an_instance' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.CarrierMass.every_model_of_a_broken_fold_is_an_instance
```

## Appendix B · Kernel lines of Appendix A

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

```text
'SPHYS.CarrierMass.a_kept_reading_is_one_on_the_pair' does not depend on any axioms
'SPHYS.CarrierMass.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext]
'SPHYS.CarrierMass.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext]
'SPHYS.CarrierMass.every_model_is_an_instance' does not depend on any axioms
'SPHYS.CarrierMass.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms
'SPHYS.CarrierMass.a_mass_is_changed_by_a_change_of_gauge' depends on axioms: [propext, Quot.sound]
'SPHYS.CarrierMass.the_law_is_kept_by_the_fold' depends on axioms: [propext, Quot.sound]
'SPHYS.CarrierMass.the_law_is_nowhere_below_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.CarrierMass.the_lowest_states_are_a_pair' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.CarrierMass.the_spent_bit' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.CarrierMass.with_no_settled_value_nothing_is_spent' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.CarrierMass.the_term_written_out' depends on axioms: [propext]
'SPHYS.CarrierMass.a_mass_exactly_when_the_lowest_state_carries_the_charge' depends on axioms: [propext]
'SPHYS.CarrierMass.the_carrier_of_a_kept_charge_has_no_mass' depends on axioms: [propext]
'SPHYS.CarrierMass.the_mass_of_matter_written_out' depends on axioms: [propext]
'SPHYS.CarrierMass.the_count_balances' depends on axioms: [propext, Quot.sound]
'SPHYS.CarrierMass.twelve_before_and_twelve_after' depends on axioms: [propext]
'SPHYS.CarrierMass.the_mass_of_the_carriers' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.CarrierMass.every_model_of_a_broken_fold_is_an_instance' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
```

## Appendix C · Provenance Trail

The frame, the reading and the special cases of this paper are on the public record before it. The table lists each step at the grade its own record carries, with the address where that record can be read. The theorems of this paper, in the generality of Appendix A, are in the last row and in no earlier one. A row marked frame or reading states no theorem of this paper; a row marked special case proves or checks the subject on one model; a row marked kernel, structural carries Lean theorems on printed models; a row marked theorem on premises carries a law forced from named premises. The third column gives, for each row, the term of that record which is the precursor, and why the row is on the trail.

**Table C.1 · The grade ladder of the line of the mass of the carriers, 2026**

| Date | Grade | Precursor term, and why it is on the trail | Record | Address |
|---|---|---|---|---|
| 24 Mar | Frame, first anchor | **three orthogonal Ductions converging on one point.** The frame of the series: a point fixed by three independent axes, with the witness outside them | *Trisduction, A Geometric Epistemology of Absolute Convergence* | <https://trisduction.blogspot.com/2026/03/trisduction-geometric-epistemology-of.html> |
| 19 Jul | Reading | **the four forces and matter as configurations of one substrate.** The forces and the particles read as one kind of thing, in prose | *The Four Forces, Matter, and the Dark Sector as Configurations of One Actuating Substrate* | <https://doi.org/10.5281/zenodo.21438933> |
| 22 Oct | Kernel, structural | **the drafts of the physical series, with their Lean files.** Symmetry breaking as the spent bit, with a Lean file: a law kept by a map whose lowest states are not | *Draft papers of the physical series, with a Lean file each, at* `protocols/PhysOS/Draft Papers/` | <https://github.com/1000sapients/Trisduction/commit/ca67284> |
| 25 Nov | Theorem on premises | **a charge that does not commute.** The equations of the nuclear forces forced; eight and three carriers; three the least with a phase | *The Nuclear Forces as a New Mathematical Theorem* | <https://doi.org/10.5281/zenodo.24524874> |
| 26 Nov | Theorem | **a carrier has a mass exactly when the lowest state carries its charge.** For any symmetric form, any ordered field and any commutative ring: no mass under a kept gauge, the pair of lowest states, the mass term, the count | *This paper, edition 1.0.0: the mass of the carriers* | `not yet deposited` |

Dates are Zenodo publication dates where a DOI is given and the date printed on its page for the row of 24 March. The date of the row of 22 October is the git commit date. The Lean files of the rows of 22 October and 25 November were compiled again for this paper on Lean 4.19.0, from the copies in the repository 1000sapients/Trisduction, branch main, and compiled without error. The terms of the rows of 19 July are taken from the titles of their records. This paper has no address until it is deposited.
