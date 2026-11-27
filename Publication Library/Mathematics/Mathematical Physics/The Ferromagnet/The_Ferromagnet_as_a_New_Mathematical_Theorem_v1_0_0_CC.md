# The Ferromagnet as a New Mathematical Theorem

## The Partition Function Is Its Own Fold for Every System of Spins with a Flip, the Circle Is the Line of That Fold, and the Zeros of Two and of Three Spins Lie on It Exactly Inside the Bound

**Mohammad F. Islam PhD** · 26 November 2026

## Abstract

This paper proves, in Lean 4 with Mathlib, what is forced about a system of spins that has a flip. A system is any finite set of states with a map of the states to themselves that is its own inverse, a weight the map keeps, and a count of up spins that the map sends to its complement. No lattice, no dimension, no range and no sign of the coupling is assumed. For every such system the partition function, as a polynomial in the activity $z$, is its own fold: its value at $1/z$ times $z^n$ is its value at $z$. Its zeros therefore come in folded pairs. The circle of unit modulus is the line of that fold: a point of the plane other than zero is kept by the map $z \mapsto 1/\bar z$ exactly when it is on the circle. For two spins the zeros are on the circle exactly when the coupling is inside its bound, and outside the bound every zero is real and off the circle. For three spins on a triangle the polynomial factors, and its zeros are on the circle inside the corresponding bound. In every such system any reading the flip reverses has total zero against the weight, so a finite system in no field has no net magnetisation. The file has 17 theorems, declares no axiom and leaves no proof open. That the zeros lie on the circle for every number of spins with ferromagnetic coupling is the theorem of Lee and Yang [2]; it is cited and is not proved here.

## 1. The Theorem and What It Rests On

### 1.1 The statement

Let $S$ be a finite set, $\mathrm{flip}$ an involution of $S$, $w$ a function on $S$ with values in a commutative ring and $w(\mathrm{flip}\, s) = w(s)$, and $u$ a count with $u(s) + u(\mathrm{flip}\, s) = n$. Put $Z(z) = \sum_s w(s)\, z^{u(s)}$. The first theorem, `the_partition_function_is_its_own_fold`, states that if $z\,z' = 1$ then $z^n Z(z') = Z(z)$. The second, `two_spins_zeros_on_the_circle`, states over any ordered field that if $a^2 \le 1$ and $x + iy$ is a zero of $z^2 + 2az + 1$ then $x^2 + y^2 = 1$; `outside_the_bound_the_zeros_leave_the_circle` states that if $a^2 > 1$ then $y = 0$ and $x^2 + y^2 \ne 1$. The binding theorem `the_ferromagnet` joins the two.

### 1.2 What is proved, what is cited, what is assumed

Proved in Appendix A, and checked by the kernel of Lean 4 [8] with the Mathlib library [7]: the fold of the partition function for every system with a flip; that zeros come in pairs; that the circle is the line of the fold; the place of the zeros for two and three spins; that an odd reading has total zero. Assumed: that the weight is kept by the flip, which is the statement that the energy in no field does not depend on which way is called up. Cited and not formalised: the Ising model [3]; the theorem of Lee and Yang for every number of spins [1, 2] and its extension [5]; the exact solution in two dimensions [4]. Measured and not derived: every coupling and every temperature.

### 1.3 What ferromagnet means here

A ferromagnet means a system of spins whose weight is kept by the flip and whose coupling lies inside the bound of Section 4. For two spins with coupling $J$ at inverse temperature $\beta$ the number $a$ is $e^{-2\beta J}$, and the bound $a^2 \le 1$ holds exactly when $J \ge 0$.

## 2. The Partition Function Is Its Own Fold

The proof of `the_partition_function_is_its_own_fold` reorders the sum by the flip. The term of $s$ at $z'$, times $z^n$, is $w(s)\, z^{u(\mathrm{flip}\, s)}\,(z z')^{u(s)}$, which is the term of $\mathrm{flip}\, s$ at $z$. Nothing about the states is used beyond the three properties of Section 1.1. The states may be the configurations of a lattice of any dimension, a graph, a spin glass with couplings of mixed sign, or a set with no geometry. The corollary `the_zeros_come_in_folded_pairs` states that a zero at $z'$ gives a zero at $z$. The theorem `a_moved_state_and_its_partner_are_two_on_one_weight` records that a state the flip moves has a partner of equal weight.

## 3. The Circle Is the Line of the Fold

With real weights the zeros also come in conjugate pairs, so the map that sends zeros to zeros is $z \mapsto 1/\bar z$. In coordinates it sends $(x, y)$ to $(x, y)/(x^2 + y^2)$. The theorem `kept_by_the_fold_iff_on_the_circle` states, over any ordered field, that a point other than zero is kept exactly when $x^2 + y^2 = 1$. A zero is therefore either on the circle or one of a pair, one inside and one outside.

## 4. Two Spins and Three Spins

For two spins $Z(z) = z^2 + 2az + 1$. At $z = x + iy$ the real part is $x^2 - y^2 + 2ax + 1$ and the imaginary part $2xy + 2ay$. Inside the bound, `two_spins_zeros_on_the_circle` puts every zero on the circle. Outside it, `outside_the_bound_the_zeros_leave_the_circle` makes every zero real and off the circle: the pair has left the line. For three spins on a triangle the polynomial is $z^3 + 3bz^2 + 3bz + 1$, which factors as $(z+1)(z^2 + (3b-1)z + 1)$ in any commutative ring (`three_spins_factor`). The bound for the second factor is $-1/3 \le b \le 1$ (`the_bound_of_three_spins`), and inside it every zero is on the circle (`three_spins_zeros_on_the_circle`).

## 5. No Magnetisation Without a Spent Bit

The theorem `an_odd_reading_has_total_zero` states that for every system with a flip, any function $m$ with $m(\mathrm{flip}\, s) = -m(s)$ has $\sum_s m(s)\, w(s) = 0$, where the ring has no element of additive order two. The magnetisation is such a function. A finite ferromagnet in no field has no net magnetisation in equilibrium. A magnet that points one way has left that equilibrium: one of two equal states has been taken.

## 6. What Is Subsumed and What Is Not

The fold of Section 2 holds for every finite system with a flip, so every lattice, every graph and every range of coupling is an instance, including systems not yet written down. The theorem `every_model_of_spins_is_an_instance` carries the kept states of any model onto those of a system with a flip, by the general theorem `every_model_is_an_instance` of the seat. The earlier kernel of this trail, which checks two spins and a ring of four, is an instance of Sections 2 and 4.

Not subsumed: the statement that all zeros are on the circle for every number of spins with every ferromagnetic coupling. That is the theorem of Lee and Yang. This paper proves the fold for every number and the place of the zeros for two and three. Systems with no flip, such as a magnet in a field at real activity other than one, are outside Section 5.

## 7. The File, Theorem by Theorem

| Theorem | Axioms its proof uses |
|---|---|
| `a_kept_reading_is_one_on_the_pair` | no axiom |
| `an_odd_reading_is_zero_on_the_line` | propext |
| `an_odd_reading_off_zero_tells_the_pair` | propext |
| `every_model_is_an_instance` | no axiom |
| `every_reading_of_the_seat_is_a_reading_of_the_model` | no axiom |
| `a_moved_state_and_its_partner_are_two_on_one_weight` | no axiom |
| `the_partition_function_is_its_own_fold` | propext, Classical.choice, Quot.sound |
| `the_zeros_come_in_folded_pairs` | propext, Classical.choice, Quot.sound |
| `an_odd_reading_has_total_zero` | propext, Classical.choice, Quot.sound |
| `three_spins_factor` | propext, Quot.sound |
| `kept_by_the_fold_iff_on_the_circle` | propext, Classical.choice, Quot.sound |
| `two_spins_zeros_on_the_circle` | propext, Classical.choice, Quot.sound |
| `outside_the_bound_the_zeros_leave_the_circle` | propext,  Classical.choice,  Quot.sound |
| `the_bound_of_three_spins` | propext, Classical.choice, Quot.sound |
| `three_spins_zeros_on_the_circle` | propext, Classical.choice, Quot.sound |
| `the_ferromagnet` | propext, Classical.choice, Quot.sound |
| `every_model_of_spins_is_an_instance` | no axiom |

## 8. Discussion: The Reading

The following is a reading and is carried at the grade of a premise. On the seat of this series a map and its line are given, and a kept quantity cannot tell a point from its partner. The flip is such a map on the states and the fold of the circle is such a map on the plane of the activity; the first induces the second. A ferromagnet is the case where the zeros stay on the line. When the coupling leaves the bound the zeros leave the line in pairs. Nothing in Sections 2 to 6 depends on this paragraph.

## 9. Predictions, Falsifiers, and What Stands

### 9.1 Two predictions that will stand

First: the zeros of a ferromagnetic pair of spins, measured in the plane of the activity, lie on the circle. Zeros of this kind have been observed on the circle [6]. Second: a finite ferromagnet in no field, in equilibrium, shows no net magnetisation.

### 9.2 The two falsifiers

First: a pair of spins with ferromagnetic coupling whose measured zeros lie off the circle. Since Section 4 is an identity, this would show that the weight of that system is not kept by the flip. Second: a finite system in no field, in equilibrium, with a net magnetisation. This would break the assumption of Section 1.2.

### 9.3 What kind of result this is

The theorems are identities and equivalences about a stated structure. They hold for every system with a flip. They do not compute a critical temperature and they do not derive a coupling.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file is written by a language model under the author's direct supervision. Every theorem named in the text is in Appendix A under that name, and its kernel line is printed in Appendix B. Classical results and measurements that are cited and not formalised are named as such where they are used. No constant of nature is derived anywhere in this paper: no mass, no strength of a coupling and no angle of a mixing is a theorem here, and where a measured value is quoted it is quoted from its source.

**The seat.** The seat is elementary: a set and a map of the set to itself, with the points the map leaves in place called its line. In the plane it is a reflection and the line it fixes, studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1. C. N. Yang and T. D. Lee, Phys. Rev. 87 (1952) 404.
2. T. D. Lee and C. N. Yang, Phys. Rev. 87 (1952) 410.
3. E. Ising, Z. Phys. 31 (1925) 253.
4. L. Onsager, Phys. Rev. 65 (1944) 117.
5. T. Asano, Phys. Rev. Lett. 24 (1970) 1409.
6. X. Peng et al., Phys. Rev. Lett. 114 (2015) 010601.
7. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
8. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
9. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its file uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main.

10. The seat: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_46_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.

## Appendix A · SPHYS_Ferromagnet_Theorem_CC.lean

Lean 4.19.0 with Mathlib 4.19.0. 17 theorems, no axiom declared, no `sorry`, exit 0 with no warning. Every cone is pinned at the end of the file, so the build is silent. The kernel lines are Appendix B.

```lean
/-
SPHYS_Ferromagnet_Theorem_CC.lean · The Ferromagnet as a New Mathematical Theorem. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. A system of spins is any finite set of states with a flip, a weight the flip keeps and a count of up spins that the
  flip sends to its complement. No lattice, no dimension and no range of the coupling is assumed. DESIGN. Part 0 the seat.
  Part I the flip and the partition function as its own fold, for every such system. Part II the circle as the line of the
  fold. Part III two and three spins: the zeros on the circle inside the bound, off it outside. Part IV the magnetisation.
RISK. Part III is two and three spins. The statement for every number of spins is the theorem of Lee and Yang (1952) and is
  not proved in this file; Part I is proved for every number.
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

namespace SPHYS.Ferromagnet

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

/-! ## Part I. Every system of spins with a flip. -/

/-- A state the flip moves has a partner of the same weight: two states on one weight. -/
theorem a_moved_state_and_its_partner_are_two_on_one_weight {S W : Type*} (flip : S → S) (wt : S → W)
    (hw : ∀ s, wt (flip s) = wt s) (s : S) (hs : flip s ≠ s) : flip s ≠ s ∧ wt (flip s) = wt s := ⟨hs, hw s⟩

section Flip
variable {R : Type*} [CommRing R]

/-- THE PARTITION FUNCTION IS ITS OWN FOLD. For any finite set of states, any flip that is its own inverse, any weight the flip
keeps and any count `u` with `u s + u (flip s) = n`: the polynomial `∑ wt s · z ^ u s`, taken at `w` with `z w = 1` and
multiplied by `z ^ n`, is the polynomial at `z`. -/
theorem the_partition_function_is_its_own_fold {S : Type*} [Fintype S] (flip : S → S)
    (hf : Function.Involutive flip) (wt : S → R) (hw : ∀ s, wt (flip s) = wt s) (u : S → ℕ) (n : ℕ)
    (hu : ∀ s, u s + u (flip s) = n) (z w : R) (hzw : z * w = 1) :
    z ^ n * (∑ s, wt s * w ^ (u s)) = ∑ s, wt s * z ^ (u s) := by
  rw [Finset.mul_sum, ← Equiv.sum_comp (Function.Involutive.toPerm flip hf) (fun s => wt s * z ^ (u s))]
  apply Finset.sum_congr rfl
  intro s _
  show z ^ n * (wt s * w ^ u s) = wt (flip s) * z ^ u (flip s)
  rw [hw, ← hu s, pow_add]
  calc z ^ u s * z ^ u (flip s) * (wt s * w ^ u s) = wt s * z ^ u (flip s) * (z * w) ^ u s := by rw [mul_pow]; ring
    _ = wt s * z ^ u (flip s) := by rw [hzw, one_pow, mul_one]

/-- THE ZEROS COME IN FOLDED PAIRS. A zero at `w` gives a zero at its inverse `z`. -/
theorem the_zeros_come_in_folded_pairs {S : Type*} [Fintype S] (flip : S → S)
    (hf : Function.Involutive flip) (wt : S → R) (hw : ∀ s, wt (flip s) = wt s) (u : S → ℕ) (n : ℕ)
    (hu : ∀ s, u s + u (flip s) = n) (z w : R) (hzw : z * w = 1) (h0 : ∑ s, wt s * w ^ (u s) = 0) :
    ∑ s, wt s * z ^ (u s) = 0 := by
  rw [← the_partition_function_is_its_own_fold flip hf wt hw u n hu z w hzw, h0, mul_zero]

/-- NO MAGNETISATION WITHOUT A SPENT BIT. Any reading the flip reverses has total zero against any weight the flip keeps. -/
theorem an_odd_reading_has_total_zero {S : Type*} [Fintype S] (h2 : ∀ v : R, v + v = 0 → v = 0) (flip : S → S)
    (hf : Function.Involutive flip) (wt m : S → R) (hw : ∀ s, wt (flip s) = wt s) (hm : ∀ s, m (flip s) = - m s) :
    ∑ s, m s * wt s = 0 := by
  apply h2
  have e : ∑ s, m s * wt s = ∑ s, - (m s * wt s) := by
    rw [← Equiv.sum_comp (Function.Involutive.toPerm flip hf) (fun s => m s * wt s)]
    apply Finset.sum_congr rfl
    intro s _
    show m (flip s) * wt (flip s) = - (m s * wt s)
    rw [hw, hm]; ring
  nth_rewrite 1 [e]
  rw [Finset.sum_neg_distrib, neg_add_cancel]

/-- Three spins on a triangle: the polynomial factors, in any commutative ring. -/
theorem three_spins_factor (z b : R) :
    z ^ 3 + 3 * b * z ^ 2 + 3 * b * z + 1 = (z + 1) * (z ^ 2 + (3 * b - 1) * z + 1) := by ring

end Flip

/-! ## Part II. The circle is the line of the fold. A point `x + iy` of the plane, over any ordered field. -/

section Circle
variable {K : Type*} [Field K] [LinearOrder K] [IsStrictOrderedRing K]

/-- The fold of the plane sends `x + iy` to the inverse of its conjugate. A point other than zero is kept exactly on the circle. -/
theorem kept_by_the_fold_iff_on_the_circle (x y : K) (h : x ≠ 0 ∨ y ≠ 0) :
    (x / (x ^ 2 + y ^ 2) = x ∧ y / (x ^ 2 + y ^ 2) = y) ↔ x ^ 2 + y ^ 2 = 1 := by
  have hn : 0 < x ^ 2 + y ^ 2 := by
    rcases h with h | h
    · have := mul_self_pos.2 h; nlinarith [sq_nonneg y]
    · have := mul_self_pos.2 h; nlinarith [sq_nonneg x]
  constructor
  · rintro ⟨h1, h2⟩
    rw [div_eq_iff hn.ne'] at h1 h2
    by_contra hne
    have hx : x = 0 := by
      have e : x * (x ^ 2 + y ^ 2 - 1) = 0 := by linear_combination -h1
      rcases mul_eq_zero.1 e with h | h
      · exact h
      · exact absurd (by linear_combination h) hne
    have hy : y = 0 := by
      have e : y * (x ^ 2 + y ^ 2 - 1) = 0 := by linear_combination -h2
      rcases mul_eq_zero.1 e with h | h
      · exact h
      · exact absurd (by linear_combination h) hne
    rcases h with h | h
    · exact h hx
    · exact h hy
  · intro h1; rw [h1]; simp

/-! ## Part III. Two spins and three spins. The polynomial of two spins is `z² + 2 a z + 1`; at `z = x + iy` its real part is
`x² − y² + 2 a x + 1` and its imaginary part is `2 x y + 2 a y`. -/

/-- INSIDE THE BOUND EVERY ZERO IS ON THE CIRCLE. -/
theorem two_spins_zeros_on_the_circle (a x y : K) (ha : a ^ 2 ≤ 1)
    (hre : x ^ 2 - y ^ 2 + 2 * a * x + 1 = 0) (him : 2 * x * y + 2 * a * y = 0) : x ^ 2 + y ^ 2 = 1 := by
  have h : y * (x + a) = 0 := by linear_combination him / 2
  rcases mul_eq_zero.1 h with hy | hx
  · subst hy
    have h1 : (x + a) * (x + a) = a ^ 2 - 1 := by linear_combination hre
    have h2 : (x + a) * (x + a) = 0 := le_antisymm (by linarith) (mul_self_nonneg _)
    have h3 : x + a = 0 := mul_self_eq_zero.1 h2
    have h4 : a ^ 2 = 1 := by linarith
    have h5 : x = -a := by linarith
    subst h5
    linear_combination h4
  · have h5 : x = -a := by linarith
    subst h5
    linear_combination -hre

/-- OUTSIDE THE BOUND EVERY ZERO IS REAL AND OFF THE CIRCLE. -/
theorem outside_the_bound_the_zeros_leave_the_circle (a x y : K) (ha : 1 < a ^ 2)
    (hre : x ^ 2 - y ^ 2 + 2 * a * x + 1 = 0) (him : 2 * x * y + 2 * a * y = 0) : y = 0 ∧ x ^ 2 + y ^ 2 ≠ 1 := by
  have h : y * (x + a) = 0 := by linear_combination him / 2
  have hy : y = 0 := by
    rcases mul_eq_zero.1 h with hy | hx
    · exact hy
    · exfalso
      have h5 : x = -a := by linarith
      subst h5
      nlinarith [sq_nonneg y]
  refine ⟨hy, ?_⟩
  subst hy
  intro h1
  have hax : a * x = -1 := by linear_combination (hre - h1) / 2
  have hx2 : x ^ 2 = 1 := by linear_combination h1
  have e : a ^ 2 * x ^ 2 = 1 := by rw [← mul_pow, hax]; norm_num
  rw [hx2, mul_one] at e
  linarith

/-- The bound, for three spins with `2 a = 3 b − 1`. -/
theorem the_bound_of_three_spins (b : K) : ((3 * b - 1) / 2) ^ 2 ≤ 1 ↔ -(1 / 3) ≤ b ∧ b ≤ 1 := by
  constructor
  · intro h
    have h' := abs_le_of_sq_le_sq' (by simpa using h : ((3 * b - 1) / 2) ^ 2 ≤ (1 : K) ^ 2) zero_le_one
    constructor <;> linarith [h'.1, h'.2]
  · rintro ⟨h1, h2⟩
    have := sq_le_sq' (by linarith : -(1 : K) ≤ (3 * b - 1) / 2) (by linarith : (3 * b - 1) / 2 ≤ 1)
    simpa using this

/-- THREE SPINS. Its zeros are `−1`, which is on the circle, and the zeros of the second factor, which are on the circle
inside the bound. -/
theorem three_spins_zeros_on_the_circle (b x y : K) (hb : -(1 / 3) ≤ b ∧ b ≤ 1)
    (hre : x ^ 2 - y ^ 2 + 2 * ((3 * b - 1) / 2) * x + 1 = 0) (him : 2 * x * y + 2 * ((3 * b - 1) / 2) * y = 0) :
    x ^ 2 + y ^ 2 = 1 ∧ (-1 : K) ^ 2 + 0 ^ 2 = 1 :=
  ⟨two_spins_zeros_on_the_circle _ x y ((the_bound_of_three_spins b).2 hb) hre him, by norm_num⟩

/-- THE FERROMAGNET OF TWO SPINS WITNESSES THE CIRCLE: on the circle exactly inside the bound. -/
theorem the_ferromagnet (a : K) :
    (a ^ 2 ≤ 1 → ∀ x y : K, x ^ 2 - y ^ 2 + 2 * a * x + 1 = 0 → 2 * x * y + 2 * a * y = 0 → x ^ 2 + y ^ 2 = 1)
    ∧ (1 < a ^ 2 → ∀ x y : K, x ^ 2 - y ^ 2 + 2 * a * x + 1 = 0 → 2 * x * y + 2 * a * y = 0 → x ^ 2 + y ^ 2 ≠ 1) :=
  ⟨fun ha x y h1 h2 => two_spins_zeros_on_the_circle a x y ha h1 h2,
   fun ha x y h1 h2 => (outside_the_bound_the_zeros_leave_the_circle a x y ha h1 h2).2⟩

end Circle

/-- SUBSUMPTION. Any model of spins carried one to one into a system with a flip, flips matched, has its kept states
exactly over the kept states of that system. -/
theorem every_model_of_spins_is_an_instance {S Y : Type*} (flip : S → S) (τ : Y → Y) (φ : Y → S)
    (hφ : Function.Injective φ) (heq : ∀ y, φ (τ y) = flip (φ y)) (y : Y) : OnLine τ y ↔ OnLine flip (φ y) :=
  every_model_is_an_instance flip τ φ hφ heq y


end SPHYS.Ferromagnet

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.Ferromagnet.a_kept_reading_is_one_on_the_pair' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Ferromagnet.a_kept_reading_is_one_on_the_pair
/-- info: 'SPHYS.Ferromagnet.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Ferromagnet.an_odd_reading_is_zero_on_the_line
/-- info: 'SPHYS.Ferromagnet.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Ferromagnet.an_odd_reading_off_zero_tells_the_pair
/-- info: 'SPHYS.Ferromagnet.every_model_is_an_instance' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Ferromagnet.every_model_is_an_instance
/-- info: 'SPHYS.Ferromagnet.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Ferromagnet.every_reading_of_the_seat_is_a_reading_of_the_model
/-- info: 'SPHYS.Ferromagnet.a_moved_state_and_its_partner_are_two_on_one_weight' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Ferromagnet.a_moved_state_and_its_partner_are_two_on_one_weight
/--
info: 'SPHYS.Ferromagnet.the_partition_function_is_its_own_fold' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Ferromagnet.the_partition_function_is_its_own_fold
/--
info: 'SPHYS.Ferromagnet.the_zeros_come_in_folded_pairs' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Ferromagnet.the_zeros_come_in_folded_pairs
/--
info: 'SPHYS.Ferromagnet.an_odd_reading_has_total_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Ferromagnet.an_odd_reading_has_total_zero
/-- info: 'SPHYS.Ferromagnet.three_spins_factor' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Ferromagnet.three_spins_factor
/--
info: 'SPHYS.Ferromagnet.kept_by_the_fold_iff_on_the_circle' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Ferromagnet.kept_by_the_fold_iff_on_the_circle
/--
info: 'SPHYS.Ferromagnet.two_spins_zeros_on_the_circle' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Ferromagnet.two_spins_zeros_on_the_circle
/--
info: 'SPHYS.Ferromagnet.outside_the_bound_the_zeros_leave_the_circle' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Ferromagnet.outside_the_bound_the_zeros_leave_the_circle
/-- info: 'SPHYS.Ferromagnet.the_bound_of_three_spins' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Ferromagnet.the_bound_of_three_spins
/--
info: 'SPHYS.Ferromagnet.three_spins_zeros_on_the_circle' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Ferromagnet.three_spins_zeros_on_the_circle
/-- info: 'SPHYS.Ferromagnet.the_ferromagnet' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Ferromagnet.the_ferromagnet
/-- info: 'SPHYS.Ferromagnet.every_model_of_spins_is_an_instance' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Ferromagnet.every_model_of_spins_is_an_instance
```

## Appendix B · Kernel lines of Appendix A

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

```text
'SPHYS.Ferromagnet.a_kept_reading_is_one_on_the_pair' does not depend on any axioms
'SPHYS.Ferromagnet.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext]
'SPHYS.Ferromagnet.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext]
'SPHYS.Ferromagnet.every_model_is_an_instance' does not depend on any axioms
'SPHYS.Ferromagnet.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms
'SPHYS.Ferromagnet.a_moved_state_and_its_partner_are_two_on_one_weight' does not depend on any axioms
'SPHYS.Ferromagnet.the_partition_function_is_its_own_fold' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Ferromagnet.the_zeros_come_in_folded_pairs' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Ferromagnet.an_odd_reading_has_total_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Ferromagnet.three_spins_factor' depends on axioms: [propext, Quot.sound]
'SPHYS.Ferromagnet.kept_by_the_fold_iff_on_the_circle' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Ferromagnet.two_spins_zeros_on_the_circle' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Ferromagnet.outside_the_bound_the_zeros_leave_the_circle' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.Ferromagnet.the_bound_of_three_spins' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Ferromagnet.three_spins_zeros_on_the_circle' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Ferromagnet.the_ferromagnet' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Ferromagnet.every_model_of_spins_is_an_instance' does not depend on any axioms
```

## Appendix C · Provenance Trail

The frame, the reading and the special cases of this paper are on the public record before it. The table lists each step at the grade its own record carries, with the address where that record can be read. The theorems of this paper, in the generality of Appendix A, are in the last row and in no earlier one. A row marked frame or reading states no theorem of this paper; a row marked special case proves or checks the subject on one model; a row marked kernel, structural carries Lean theorems on printed models; a row marked theorem on premises carries a law forced from named premises. The third column gives, for each row, the term of that record which is the precursor, and why the row is on the trail.

**Table C.1 · The grade ladder of the ferromagnet line, 2026**

| Date | Grade | Precursor term, and why it is on the trail | Record | Address |
|---|---|---|---|---|
| 24 Mar | Frame, first anchor | **three orthogonal Ductions converging on one point.** The frame of the series: a point fixed by three independent axes, with the witness outside them | *Trisduction, A Geometric Epistemology of Absolute Convergence* | <https://trisduction.blogspot.com/2026/03/trisduction-geometric-epistemology-of.html> |
| 19 Jul | Reading | **the four forces and matter as configurations of one substrate.** The forces and the particles read as one kind of thing, in prose | *The Four Forces, Matter, and the Dark Sector as Configurations of One Actuating Substrate* | <https://doi.org/10.5281/zenodo.21438933> |
| 27 Sep | Special case | **time reversal broken by a magnetic term.** The magnetic term as what the reversal of time moves, on two-by-two blocks | *The Magnet Is the Witness of the Pair Correlation* | <https://doi.org/10.5281/zenodo.22986561> |
| 22 Oct | Kernel, structural | **the drafts of the physical series, with their Lean files.** The ferromagnet as the witness of the circle, with a Lean file: two spins and a ring of four, checked | *Draft papers of the physical series, with a Lean file each, at* `protocols/PhysOS/Draft Papers/` | <https://github.com/1000sapients/Trisduction/commit/ca67284> |
| 26 Nov | Theorem | **the partition function is its own fold.** For every system of spins with a flip; the circle as the line; two and three spins on it inside the bound | *This paper, edition 1.0.0: the ferromagnet for every system with a flip* | `not yet deposited` |

Dates are Zenodo publication dates where a DOI is given and the date printed on its page for the row of 24 March. The date of the row of 22 October is the git commit date. The Lean files of the rows of 22 October were compiled again for this paper on Lean 4.19.0, from the copies in the repository 1000sapients/Trisduction, branch main, and compiled without error. The terms of the rows of 19 July and 27 September are taken from the titles of their records. This paper has no address until it is deposited.
