/-
SPHYS_WeakField_CC.lean · the static weak field: Newton's equation is the time reading, and space reads the same
RATIONALE. Section 7 of the paper proves what the law reads along time and across it. The step from those two
  readings to the two potentials of a weak static field was cited. This file derives it. The Ricci curvature of a
  metric that is flat plus a first-order static perturbation is computed from the coordinate formulas, and the
  field equations that follow are solved for the two potentials.
DESIGN. First order is exact algebra: an element eps with eps * eps = 0. The metric is diagonal,
  -(1 + eps u), (1 - eps w), (1 - eps w), (1 - eps w), with u and w independent of the time. Newton's potential
  is u / 2 and the potential of space is w / 2. `static_ricci` proves Ric = half * eps * ricLin, where ricLin is
  the Laplacian of u on the time component and the Laplacian of w plus the second derivatives of w - u on the
  space components. `newton_from_the_time_reading` and `space_potential_equals_time_potential` read the law.
RISK. The source enters as its two readings, equal by Part X-b of Appendix A for matter at rest in four dimensions;
  the statement is at first order and for a static field. That w - u, having no second derivative, vanishes, needs
  the condition at infinity, which is not formalised.
NON-NEGOTIABLE. No sorry, no axiom beyond Lean's own. Nothing is entered: the curvature is computed.
-/
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Ring
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum

namespace SPHYS.WeakField

theorem forall4 (P : Fin 4 → Prop) : (∀ m, P m) ↔ P 0 ∧ P 1 ∧ P 2 ∧ P 3 := by
  constructor
  · intro h; exact ⟨h 0, h 1, h 2, h 3⟩
  · rintro ⟨a, b, c, d⟩ m
    fin_cases m
    · exact a
    · exact b
    · exact c
    · exact d

variable {R : Type} [CommRing R]

def eta : Fin 4 → R := ![-1, 1, 1, 1]

/-- A metric that is flat plus a small static perturbation: a ring with four derivations, an element eps whose
square is zero, and two functions u and w that do not depend on the time and whose derivatives commute. -/
structure Weak (R : Type) [CommRing R] where
  D : Fin 4 → R → R
  D_add : ∀ i x y, D i (x + y) = D i x + D i y
  D_mul : ∀ i x y, D i (x * y) = D i x * y + x * D i y
  eps : R
  eps_sq : eps * eps = 0
  D_eps : ∀ i, D i eps = 0
  half : R
  two_half : 2 * half = 1
  D_half : ∀ i, D i half = 0
  u : R
  w : R
  u_static : D 0 u = 0
  w_static : D 0 w = 0
  u_comm : ∀ i j, D i (D j u) = D j (D i u)
  w_comm : ∀ i j, D i (D j w) = D j (D i w)

namespace Weak
variable (W : Weak R)

theorem D_zero (i : Fin 4) : W.D i 0 = 0 := by
  have h := W.D_add i 0 0; rw [add_zero] at h; exact left_eq_add.mp h
theorem D_one (i : Fin 4) : W.D i 1 = 0 := by
  have h := W.D_mul i 1 1; simp only [mul_one, one_mul] at h; exact left_eq_add.mp h
theorem D_neg (i : Fin 4) (x : R) : W.D i (-x) = -W.D i x := by
  have h := W.D_add i x (-x); rw [add_neg_cancel, W.D_zero] at h; exact eq_neg_of_add_eq_zero_right h.symm
theorem D_sub (i : Fin 4) (x y : R) : W.D i (x - y) = W.D i x - W.D i y := by
  rw [sub_eq_add_neg, W.D_add, W.D_neg, sub_eq_add_neg]

/-- The perturbation of each diagonal component: -u on the time, -w on each direction of space. -/
def h (i : Fin 4) : R := if i = 0 then -W.u else -W.w
/-- The metric: flat plus eps times the perturbation. -/
def gm (i j : Fin 4) : R := if i = j then eta i + W.eps * W.h i else 0
/-- Its inverse to first order. -/
def gi (i j : Fin 4) : R := if i = j then eta i - W.eps * W.h i else 0
/-- The Christoffel symbols of the metric, by the coordinate formula. -/
def Gam (k i j : Fin 4) : R :=
  W.half * ∑ l, W.gi k l * (W.D i (W.gm j l) + W.D j (W.gm i l) - W.D l (W.gm i j))
/-- The Ricci curvature of the metric, by the coordinate formula. -/
def Ric (i j : Fin 4) : R :=
  (∑ k, (W.D k (W.Gam k i j) - W.D j (W.Gam k i k)))
  + ∑ k, ∑ l, (W.Gam k k l * W.Gam l i j - W.Gam k j l * W.Gam l i k)

/-- The Laplacian of space. -/
def lap (x : R) : R := W.D 1 (W.D 1 x) + W.D 2 (W.D 2 x) + W.D 3 (W.D 3 x)

/-- The first-order Ricci curvature of the static weak field. -/
def ricLin (i j : Fin 4) : R :=
  if i = 0 ∧ j = 0 then W.lap W.u
  else if i = 0 ∨ j = 0 then 0
  else (if i = j then W.lap W.w else 0) + W.D i (W.D j W.w) - W.D i (W.D j W.u)

theorem e2 : W.eps ^ 2 = 0 := by rw [pow_two]; exact W.eps_sq
theorem e3 : W.eps ^ 3 = 0 := by rw [pow_succ, W.e2, zero_mul]
theorem e4 : W.eps ^ 4 = 0 := by rw [pow_succ, W.e3, zero_mul]

theorem u0 (i : Fin 4) : W.D 0 (W.D i W.u) = 0 := by rw [W.u_comm, W.u_static, W.D_zero]
theorem w0 (i : Fin 4) : W.D 0 (W.D i W.w) = 0 := by rw [W.w_comm, W.w_static, W.D_zero]

set_option linter.unusedTactic false
set_option linter.unreachableTactic false
set_option maxHeartbeats 4000000

/-- The inverse is the inverse, to first order. -/
theorem gi_is_inverse : ∀ i j, ∑ l, W.gm i l * W.gi l j = if i = j then 1 else 0 := by
  rw [forall4]; refine ⟨?_, ?_, ?_, ?_⟩ <;> rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;>
    simp [gm, gi, h, Fin.sum_univ_four, eta]
  all_goals (try ring_nf)
  all_goals (try simp only [W.e2, W.e3, W.e4, mul_zero, zero_mul, add_zero, zero_add, sub_zero, neg_zero])
  all_goals (try ring)

/-- THE CURVATURE OF THE STATIC WEAK FIELD, DERIVED. To first order the Ricci curvature is half * eps times ricLin:
the Laplacian of u along time, nothing between time and space, and on space the Laplacian of w on the diagonal
plus the second derivatives of w - u. -/
theorem static_ricci : ∀ i j, W.Ric i j = W.half * W.eps * W.ricLin i j := by
  have c21 := W.u_comm 2 1; have c31 := W.u_comm 3 1; have c32 := W.u_comm 3 2
  have d21 := W.w_comm 2 1; have d31 := W.w_comm 3 1; have d32 := W.w_comm 3 2
  rw [forall4]; refine ⟨?_, ?_, ?_, ?_⟩ <;> rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;>
    simp [Ric, Gam, gm, gi, h, ricLin, lap, Fin.sum_univ_four, eta, c21, c31, c32, d21, d31, d32, W.D_add, W.D_mul,
      W.D_sub, W.D_neg, W.D_zero, W.D_one, W.D_eps, W.D_half, W.u_static, W.w_static, W.u0, W.w0]
  all_goals (try ring_nf)
  all_goals (try simp only [W.e2, W.e3, W.e4, mul_zero, zero_mul, add_zero, zero_add, sub_zero, neg_zero])
  all_goals (try ring)

/-- NEWTON'S EQUATION IS THE TIME READING. If the time component of the first-order curvature equals a reading q,
then the Laplacian of u is q: with Newton's potential u / 2, this is Poisson's equation. Space is not consulted. -/
theorem newton_from_the_time_reading (q : R) (h00 : W.ricLin 0 0 = q) : W.lap W.u = q := by
  simpa [ricLin] using h00

/-- SPACE READS THE SAME. If the curvature reads q along time and q along every direction of space, and nothing
between two different directions, then w obeys the same equation as u, and every second derivative of w equals
that of u. The two potentials differ by a function with no second derivative. -/
theorem space_potential_equals_time_potential (q : R)
    (hq : ∀ i j, W.ricLin i j = if i = j then q else 0) :
    W.lap W.w = q ∧ W.lap W.u = q ∧
      ∀ i j, i ≠ 0 → j ≠ 0 → W.D i (W.D j W.w) = W.D i (W.D j W.u) := by
  have h00 := hq 0 0; have h11 := hq 1 1; have h22 := hq 2 2; have h33 := hq 3 3
  have h12 := hq 1 2; have h13 := hq 1 3; have h23 := hq 2 3
  have h21 := hq 2 1; have h31 := hq 3 1; have h32 := hq 3 2
  simp [ricLin] at h00 h11 h22 h33 h12 h13 h23 h21 h31 h32
  have hu : W.lap W.u = q := h00
  have hw4 : 2 * (2 * (W.lap W.w - q)) = 0 := by
    have e : W.lap W.u = W.D 1 (W.D 1 W.u) + W.D 2 (W.D 2 W.u) + W.D 3 (W.D 3 W.u) := rfl
    have e' : W.lap W.w = W.D 1 (W.D 1 W.w) + W.D 2 (W.D 2 W.w) + W.D 3 (W.D 3 W.w) := rfl
    linear_combination h11 + h22 + h33 + e' + hu - e
  have hw : W.lap W.w = q := by
    have a : W.lap W.w - q = W.half * W.half * (2 * (2 * (W.lap W.w - q))) := by
      linear_combination (-(W.lap W.w - q) * (1 + 2 * W.half)) * W.two_half
    rw [hw4, mul_zero] at a
    linear_combination a
  refine ⟨hw, hu, ?_⟩
  rw [forall4]; refine ⟨?_, ?_, ?_, ?_⟩ <;> rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;> intro hi hj
  all_goals first
    | exact absurd rfl hi
    | exact absurd rfl hj
    | linear_combination h11 - hw
    | linear_combination h22 - hw
    | linear_combination h33 - hw
    | linear_combination h12
    | linear_combination h13
    | linear_combination h23
    | linear_combination h21
    | linear_combination h31
    | linear_combination h32

end Weak
end SPHYS.WeakField

#print axioms SPHYS.WeakField.Weak.gi_is_inverse
#print axioms SPHYS.WeakField.Weak.static_ricci
#print axioms SPHYS.WeakField.Weak.newton_from_the_time_reading
#print axioms SPHYS.WeakField.Weak.space_potential_equals_time_potential
