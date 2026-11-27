/-
SPHYS_Schwarzschild_CC.lean · the static spherical solution of the vacuum law, derived
RATIONALE. The twin integrates light and a planet in the Schwarzschild solution. Until this file the solution was
  an import. Here the Ricci curvature of the static spherical form is computed from the metric by the coordinate
  definition, and the vacuum law is shown to hold exactly when (r f)' = 1, which forces f = 1 - 2m/r, m constant.
DESIGN. A chart is a field K of functions with four commuting derivations D 0..D 3 (t, r, theta, phi). Christoffel
  symbols and Ricci curvature are the textbook coordinate formulas for a diagonal metric. Sine and cosine enter as
  two elements s, c with D 2 s = c and D 2 c = -s; nothing else about them is used.
FREE FALL. The last part defines free fall with the same Christoffel symbols, proves the energy, the angular
  momentum and the square of the velocity conserved, and derives the equation of the orbit, u'' + u = m kappa / L^2
  + 3 m u^2, which the numerical twin integrates for Mercury (kappa = 1) and for light (kappa = 0).
RISK. The form diag(-f, 1/f, r^2, r^2 s^2) is assumed: static, spherical, and g_rr = 1/g_tt. This is not the full
  Birkhoff theorem. The inverse of zero is zero in a Lean field; r, s, f are assumed nonzero where it matters.
NON-NEGOTIABLE. No sorry, no axiom beyond Lean's own. Curvature is computed, never postulated.
-/
import Mathlib.Algebra.Field.Basic
import Mathlib.Algebra.CharZero.Defs
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.FinCases

namespace SPHYS.Schwarzschild

/-- A coordinate chart: a field of functions with four commuting derivations. -/
structure Chart (K : Type) [Field K] where
  D : Fin 4 → K → K
  D_add : ∀ i x y, D i (x + y) = D i x + D i y
  D_mul : ∀ i x y, D i (x * y) = D i x * y + x * D i y
  D_comm : ∀ i j x, D i (D j x) = D j (D i x)

variable {K : Type} [Field K]

namespace Chart
variable (C : Chart K)

theorem D_zero (i : Fin 4) : C.D i 0 = 0 := by
  have h := C.D_add i 0 0; rw [add_zero] at h; exact left_eq_add.mp h
theorem D_one (i : Fin 4) : C.D i 1 = 0 := by
  have h := C.D_mul i 1 1; simp only [mul_one, one_mul] at h; exact left_eq_add.mp h
theorem D_neg (i : Fin 4) (x : K) : C.D i (-x) = -C.D i x := by
  have h := C.D_add i x (-x); rw [add_neg_cancel, C.D_zero] at h; exact eq_neg_of_add_eq_zero_right h.symm
theorem D_sub (i : Fin 4) (x y : K) : C.D i (x - y) = C.D i x - C.D i y := by
  rw [sub_eq_add_neg, C.D_add, C.D_neg, sub_eq_add_neg]
theorem D_two (i : Fin 4) : C.D i 2 = 0 := by
  have : (2 : K) = 1 + 1 := by norm_num
  rw [this, C.D_add, C.D_one, add_zero]
/-- The derivative of an inverse. It holds at zero too, where the inverse is zero. -/
theorem D_inv (i : Fin 4) (x : K) : C.D i x⁻¹ = -(C.D i x * x⁻¹ * x⁻¹) := by
  by_cases hx : x = 0
  · subst hx; simp [C.D_zero]
  · have h := C.D_mul i x x⁻¹
    rw [mul_inv_cancel₀ hx, C.D_one] at h
    have e : x⁻¹ * x = 1 := inv_mul_cancel₀ hx
    linear_combination (-x⁻¹) * h - C.D i x⁻¹ * e
theorem D_div (i : Fin 4) (x y : K) : C.D i (x / y) = C.D i x * y⁻¹ - x * (C.D i y * y⁻¹ * y⁻¹) := by
  rw [div_eq_mul_inv, C.D_mul, C.D_inv]; ring

/-- A diagonal metric, as a full matrix. -/
def G (g : Fin 4 → K) (i j : Fin 4) : K := if i = j then g i else 0
/-- Christoffel symbols of a diagonal metric g. -/
def Gam (g : Fin 4 → K) (k i j : Fin 4) : K :=
  (g k)⁻¹ * 2⁻¹ * (C.D i (G g j k) + C.D j (G g i k) - C.D k (G g i j))
/-- The Ricci curvature, by the coordinate formula. -/
def Ric (g : Fin 4 → K) (i j : Fin 4) : K :=
  (∑ k, (C.D k (C.Gam g k i j) - C.D j (C.Gam g k i k)))
  + ∑ k, ∑ l, (C.Gam g k k l * C.Gam g l i j - C.Gam g k j l * C.Gam g l i k)
/-- The Christoffel symbols are symmetric: the connection of the chart has no torsion. -/
theorem Gam_symm (g : Fin 4 → K) (k i j : Fin 4) : C.Gam g k i j = C.Gam g k j i := by
  have hs : G g i j = G g j i := by
    unfold G
    by_cases h : i = j
    · subst h; rfl
    · rw [if_neg h, if_neg (Ne.symm h)]
  unfold Gam
  rw [hs, add_comm (C.D i (G g j k)) (C.D j (G g i k))]

/-- The connection of the chart preserves the metric: the derivative of the metric is carried by the Christoffel
symbols. With `Gam_symm` this says the connection is the torsion-free metric connection, in coordinates. -/
theorem Gam_metric (g : Fin 4 → K) (hg : ∀ i, g i ≠ 0) (h2 : (2 : K) ≠ 0) (k i j : Fin 4) :
    C.D k (G g i j) = ∑ l, (G g l j * C.Gam g l k i + G g i l * C.Gam g l k j) := by
  have hs : ∀ a b : Fin 4, G g a b = G g b a := by
    intro a b
    unfold G
    by_cases h : a = b
    · subst h; rfl
    · rw [if_neg h, if_neg (Ne.symm h)]
  have e1 : ∑ l, G g l j * C.Gam g l k i = g j * C.Gam g j k i := by simp [G]
  have e2 : ∑ l, G g i l * C.Gam g l k j = g i * C.Gam g i k j := by simp [G]
  rw [Finset.sum_add_distrib, e1, e2]
  unfold Gam
  rw [hs j i, hs k i, hs k j]
  have hi := hg i; have hj := hg j
  field_simp
  ring
end Chart

/-- The static spherical setting: the radius r, the sine and cosine of the polar angle, and one function f of r. -/
structure Static (K : Type) [Field K] extends Chart K where
  r : K
  s : K
  c : K
  f : K
  r_ne : r ≠ 0
  s_ne : s ≠ 0
  f_ne : f ≠ 0
  r0 : D 0 r = 0
  r1 : D 1 r = 1
  r2 : D 2 r = 0
  r3 : D 3 r = 0
  s0 : D 0 s = 0
  s1 : D 1 s = 0
  s2 : D 2 s = c
  s3 : D 3 s = 0
  c0 : D 0 c = 0
  c1 : D 1 c = 0
  c2 : D 2 c = -s
  c3 : D 3 c = 0
  f0 : D 0 f = 0
  f2 : D 2 f = 0
  f3 : D 3 f = 0

namespace Static
variable [CharZero K] (S : Static K)

-- One tactic block serves all sixteen components; on the components that vanish its tail has nothing to do.
-- Twelve components vanish without dividing by two, so they do not use the characteristic-zero assumption.
set_option linter.unusedSectionVars false
set_option linter.unusedTactic false
set_option linter.unreachableTactic false
set_option maxHeartbeats 1600000

/-- The metric diag(-f, 1/f, r^2, r^2 s^2). -/
def g : Fin 4 → K := ![-S.f, S.f⁻¹, S.r * S.r, S.r * S.r * (S.s * S.s)]
/-- No entry of the metric vanishes. -/
theorem g_ne (i : Fin 4) : S.g i ≠ 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  fin_cases i <;> simp [g, hr, hs, hf]

/-- THE CONNECTION OF THIS FILE IS THE TORSION-FREE METRIC CONNECTION. Its Christoffel symbols are symmetric and they
carry the derivative of the metric. The curvature below is the curvature of that connection, in coordinates. -/
theorem connection_is_torsion_free_and_metric :
    (∀ k i j, S.toChart.Gam S.g k i j = S.toChart.Gam S.g k j i) ∧
    (∀ k i j, S.D k (Chart.G S.g i j)
      = ∑ l, (Chart.G S.g l j * S.toChart.Gam S.g l k i + Chart.G S.g i l * S.toChart.Gam S.g l k j)) :=
  ⟨fun k i j => S.toChart.Gam_symm S.g k i j,
   fun k i j => S.toChart.Gam_metric S.g S.g_ne (by norm_num) k i j⟩

/-- The first and second radial derivatives of f. -/
def f' : K := S.D 1 S.f
def f'' : K := S.D 1 (S.D 1 S.f)

theorem fp0 : S.D 0 (S.D 1 S.f) = 0 := by rw [S.D_comm, S.f0, S.toChart.D_zero]
theorem fp2 : S.D 2 (S.D 1 S.f) = 0 := by rw [S.D_comm, S.f2, S.toChart.D_zero]
theorem fp3 : S.D 3 (S.D 1 S.f) = 0 := by rw [S.D_comm, S.f3, S.toChart.D_zero]

/-- The sixteen components of the Ricci curvature of the static spherical form, computed from the metric. -/
theorem ric_00 : S.toChart.Ric S.g 0 0 = S.f * (S.f'' * 2⁻¹ + S.f' * S.r⁻¹) := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_01 : S.toChart.Ric S.g 0 1 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_02 : S.toChart.Ric S.g 0 2 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_03 : S.toChart.Ric S.g 0 3 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_10 : S.toChart.Ric S.g 1 0 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_11 : S.toChart.Ric S.g 1 1 = -((S.f'' * 2⁻¹ + S.f' * S.r⁻¹) * S.f⁻¹) := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  -- The radial component is closed by an explicit certificate: the identity is reduced modulo the three
  -- relations x * x⁻¹ = 1, with the multipliers written out.
  have e1 : r * r⁻¹ = 1 := mul_inv_cancel₀ hr
  have e2 : s * s⁻¹ = 1 := mul_inv_cancel₀ hs
  have e3 : f * f⁻¹ = 1 := mul_inv_cancel₀ hf
  generalize r⁻¹ = a at *
  generalize s⁻¹ = b at *
  generalize f⁻¹ = e at *
  linear_combination
    (a ^ 2 * (r * a + 1) + a ^ 2 * (s * b) ^ 3 * (r * a * (s * b) + 1) - 2⁻¹ * d * e * a * (1 + (s * b) ^ 2)) * e1
    + (a ^ 2 * (s * b) ^ 2 * (r * a * (s * b) + 1) - 2⁻¹ * d * e * a * (s * b + 1)) * e2
    + (-(4⁻¹ * d ^ 2 * e ^ 2) - 2⁻¹ * d * e * a * (r * a) * (1 + (s * b) ^ 2)) * e3
theorem ric_12 : S.toChart.Ric S.g 1 2 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_13 : S.toChart.Ric S.g 1 3 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_20 : S.toChart.Ric S.g 2 0 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_21 : S.toChart.Ric S.g 2 1 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_22 : S.toChart.Ric S.g 2 2 = 1 - S.f - S.r * S.f' := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_23 : S.toChart.Ric S.g 2 3 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_30 : S.toChart.Ric S.g 3 0 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_31 : S.toChart.Ric S.g 3 1 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_32 : S.toChart.Ric S.g 3 2 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_33 : S.toChart.Ric S.g 3 3 = S.s * S.s * (1 - S.f - S.r * S.f') := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)

/-- The Ricci curvature as one table. -/
def ricTable : Fin 4 → Fin 4 → K :=
  ![![S.f * (S.f'' * 2⁻¹ + S.f' * S.r⁻¹), 0, 0, 0], ![0, -((S.f'' * 2⁻¹ + S.f' * S.r⁻¹) * S.f⁻¹), 0, 0],
    ![0, 0, 1 - S.f - S.r * S.f', 0], ![0, 0, 0, S.s * S.s * (1 - S.f - S.r * S.f')]]

theorem ric_eq (i j : Fin 4) : S.toChart.Ric S.g i j = S.ricTable i j := by
  fin_cases i <;> fin_cases j
  · exact S.ric_00
  · exact S.ric_01
  · exact S.ric_02
  · exact S.ric_03
  · exact S.ric_10
  · exact S.ric_11
  · exact S.ric_12
  · exact S.ric_13
  · exact S.ric_20
  · exact S.ric_21
  · exact S.ric_22
  · exact S.ric_23
  · exact S.ric_30
  · exact S.ric_31
  · exact S.ric_32
  · exact S.ric_33

/-- The radial equation: differentiating r f' + f = 1 once gives r f'' + 2 f' = 0. -/
theorem second_of_first (h : S.r * S.f' + S.f = 1) : S.r * S.f'' + 2 * S.f' = 0 := by
  have e := congrArg (S.D 1) h
  rw [S.toChart.D_add, S.toChart.D_mul, S.r1, S.toChart.D_one] at e
  simp only [f', f''] at *
  linear_combination e

/-- THE VACUUM LAW ON THE STATIC SPHERICAL FORM. The Ricci curvature vanishes exactly when (r f)' = 1. -/
theorem vacuum_iff : (∀ i j, S.toChart.Ric S.g i j = 0) ↔ S.r * S.f' + S.f = 1 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  constructor
  · intro h
    have h22 := h 2 2
    rw [S.ric_22] at h22
    linear_combination -h22
  · intro h i j
    have h2 := S.second_of_first h
    have e1 : S.r * S.r⁻¹ = 1 := mul_inv_cancel₀ hr
    have e2 : (2 : K) * 2⁻¹ = 1 := mul_inv_cancel₀ (by norm_num)
    have hk : S.f'' * 2⁻¹ + S.f' * S.r⁻¹ = 0 := by
      linear_combination (2⁻¹ * S.r⁻¹) * h2 - (S.f'' * 2⁻¹) * e1 - (S.f' * S.r⁻¹) * e2
    have hz : 1 - S.f - S.r * S.f' = 0 := by linear_combination -h
    fin_cases i <;> fin_cases j
    · exact S.ric_00.trans (by rw [hk, mul_zero])
    · exact S.ric_01
    · exact S.ric_02
    · exact S.ric_03
    · exact S.ric_10
    · exact S.ric_11.trans (by rw [hk, zero_mul, neg_zero])
    · exact S.ric_12
    · exact S.ric_13
    · exact S.ric_20
    · exact S.ric_21
    · exact S.ric_22.trans hz
    · exact S.ric_23
    · exact S.ric_30
    · exact S.ric_31
    · exact S.ric_32
    · exact S.ric_33.trans (by rw [hz, mul_zero])

/-- The mass function r (1 - f) / 2. -/
def mass : K := S.r * (1 - S.f) * 2⁻¹

/-- THE SOLUTION IS FORCED. If the vacuum law holds, the mass function is constant in all four coordinates and
f = 1 - 2 m / r. -/
theorem vacuum_forces_schwarzschild (h : ∀ i j, S.toChart.Ric S.g i j = 0) :
    (∀ i, S.D i S.mass = 0) ∧ S.f = 1 - 2 * S.mass / S.r := by
  have hr := S.r_ne
  have e := S.vacuum_iff.mp h
  simp only [f'] at e
  refine ⟨?_, ?_⟩
  · intro i
    fin_cases i <;>
      simp [mass, S.toChart.D_mul, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_one, S.toChart.D_two,
        S.r0, S.r1, S.r2, S.r3, S.f0, S.f2, S.f3]
    linear_combination -e
  · simp only [mass]
    field_simp

/-- AND IT IS A SOLUTION. If f = 1 - 2 m / r with m constant along the radius, the vacuum law holds. -/
theorem schwarzschild_is_vacuum (m : K) (hm : S.D 1 m = 0) (hf : S.f = 1 - 2 * m / S.r) :
    ∀ i j, S.toChart.Ric S.g i j = 0 := by
  have hr := S.r_ne
  apply S.vacuum_iff.mpr
  have e : S.r * S.f = S.r - 2 * m := by rw [hf]; field_simp
  have e' := congrArg (S.D 1) e
  rw [S.toChart.D_mul, S.toChart.D_sub, S.toChart.D_mul, S.toChart.D_two, S.r1, hm] at e'
  simp only [f']
  linear_combination e'
/-! ## Free fall in the static spherical form
    A field of velocities v, differentiated along itself with the Christoffel symbols of this file. Three
    quantities are conserved, they give the radial equation, and the radial equation gives the equation of the
    orbit that the numerical twin integrates. RISK: a field of velocities, not a single path; the orbit equation
    is stated where the radial velocity and the angular momentum do not vanish. -/

/-- The derivative of a function along a velocity field. -/
def along (v : Fin 4 → K) (x : K) : K := ∑ i, v i * S.D i x

/-- Free fall: the velocity field is geodesic for the connection of this file. -/
def Geodesic (v : Fin 4 → K) : Prop :=
  ∀ k, S.along v (v k) = -∑ i, ∑ j, S.toChart.Gam S.g k i j * v i * v j

theorem along_add (v : Fin 4 → K) (x y : K) : S.along v (x + y) = S.along v x + S.along v y := by
  simp only [along, S.D_add, Fin.sum_univ_four]; ring
theorem along_mul (v : Fin 4 → K) (x y : K) : S.along v (x * y) = S.along v x * y + x * S.along v y := by
  simp only [along, S.D_mul, Fin.sum_univ_four]; ring
theorem along_neg (v : Fin 4 → K) (x : K) : S.along v (-x) = -S.along v x := by
  simp only [along, S.toChart.D_neg, Fin.sum_univ_four]; ring
theorem along_sub (v : Fin 4 → K) (x y : K) : S.along v (x - y) = S.along v x - S.along v y := by
  simp only [along, S.toChart.D_sub, Fin.sum_univ_four]; ring
theorem along_inv (v : Fin 4 → K) (x : K) : S.along v x⁻¹ = -(S.along v x * x⁻¹ * x⁻¹) := by
  simp only [along, S.toChart.D_inv, Fin.sum_univ_four]; ring
theorem along_r (v : Fin 4 → K) : S.along v S.r = v 1 := by
  simp [along, Fin.sum_univ_four, S.r0, S.r1, S.r2, S.r3]
theorem along_s (v : Fin 4 → K) : S.along v S.s = v 2 * S.c := by
  simp [along, Fin.sum_univ_four, S.s0, S.s1, S.s2, S.s3]
theorem along_f (v : Fin 4 → K) : S.along v S.f = v 1 * S.f' := by
  simp [along, f', Fin.sum_univ_four, S.f0, S.f2, S.f3]

/-- The four equations of free fall, with the Christoffel symbols computed. -/
theorem fall_0 {v : Fin 4 → K} (hv : S.Geodesic v) : S.along v (v 0) = -(S.f' * S.f⁻¹ * v 0 * v 1) := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  rw [hv 0]
  simp [Chart.Gam, Chart.G, g, f', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3]
  clear hv
  all_goals (try simp only [f'])
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem fall_1 {v : Fin 4 → K} (hv : S.Geodesic v) : S.along v (v 1)
    = -(S.f * S.f' * 2⁻¹ * (v 0 * v 0)) + S.f' * S.f⁻¹ * 2⁻¹ * (v 1 * v 1)
      + S.r * S.f * (v 2 * v 2) + S.r * S.f * (S.s * S.s) * (v 3 * v 3) := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  rw [hv 1]
  simp [Chart.Gam, Chart.G, g, f', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3]
  clear hv
  all_goals (try simp only [f'])
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem fall_2 {v : Fin 4 → K} (hv : S.Geodesic v) : S.along v (v 2)
    = -(2 * S.r⁻¹ * (v 1 * v 2)) + S.s * S.c * (v 3 * v 3) := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  rw [hv 2]
  simp [Chart.Gam, Chart.G, g, f', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3]
  clear hv
  all_goals (try simp only [f'])
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem fall_3 {v : Fin 4 → K} (hv : S.Geodesic v) : S.along v (v 3)
    = -(2 * S.r⁻¹ * (v 1 * v 3)) - 2 * S.c * S.s⁻¹ * (v 2 * v 3) := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  rw [hv 3]
  simp [Chart.Gam, Chart.G, g, f', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3]
  clear hv
  all_goals (try simp only [f'])
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)

/-- The energy, the square of the angular momentum, and the square of the velocity in the metric. -/
def energy (v : Fin 4 → K) : K := S.f * v 0
def angSq (v : Fin 4 → K) : K := S.r * S.r * (S.r * S.r) * (v 2 * v 2 + S.s * S.s * (v 3 * v 3))
def speedSq (v : Fin 4 → K) : K :=
  -(S.f * (v 0 * v 0)) + S.f⁻¹ * (v 1 * v 1) + S.r * S.r * (v 2 * v 2) + S.r * S.r * (S.s * S.s) * (v 3 * v 3)

/-- The square of the velocity in the metric is the metric applied to the velocity. -/
theorem speedSq_eq (v : Fin 4 → K) : S.speedSq v = ∑ i, S.g i * (v i * v i) := by
  simp [speedSq, g, Fin.sum_univ_four]

/-- THE ENERGY IS CONSERVED IN FREE FALL. -/
theorem energy_conserved {v : Fin 4 → K} (hv : S.Geodesic v) : S.along v (S.energy v) = 0 := by
  have hf := S.f_ne
  rw [energy, S.along_mul, S.along_f, S.fall_0 hv]
  clear hv
  all_goals (try simp only [f'])
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)

/-- THE ANGULAR MOMENTUM IS CONSERVED IN FREE FALL. -/
theorem angSq_conserved {v : Fin 4 → K} (hv : S.Geodesic v) : S.along v (S.angSq v) = 0 := by
  have hr := S.r_ne; have hs := S.s_ne
  simp only [angSq, S.along_mul, S.along_add, S.along_r, S.along_s, S.fall_2 hv, S.fall_3 hv]
  clear hv
  all_goals (try simp only [f'])
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)

/-- THE SQUARE OF THE VELOCITY IS CONSERVED IN FREE FALL. -/
theorem speedSq_conserved {v : Fin 4 → K} (hv : S.Geodesic v) : S.along v (S.speedSq v) = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp only [speedSq, S.along_mul, S.along_add, S.along_neg, S.along_inv, S.along_r, S.along_s, S.along_f,
    S.fall_0 hv, S.fall_1 hv, S.fall_2 hv, S.fall_3 hv]
  clear hv
  all_goals (try simp only [f'])
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)

/-- THE RADIAL EQUATION. The square of the radial velocity is the square of the energy minus f times the sum of
minus the square of the velocity and the square of the angular momentum over the square of the radius. It is
algebra on the three definitions. -/
theorem radial_equation (v : Fin 4 → K) :
    v 1 * v 1 = S.energy v * S.energy v - S.f * (-S.speedSq v + S.angSq v * (S.r⁻¹ * S.r⁻¹)) := by
  have hr := S.r_ne; have hf := S.f_ne
  simp only [energy, speedSq, angSq]
  all_goals (try simp only [f'])
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)

/-- THE EQUATION OF THE ORBIT. Let the form be the solution f = 1 - 2m/r with m constant, let L be the angular
momentum, L * L = angSq, and write u = 1/r and p = -(v 1)/L. Then u changes along the fall at the rate L u² p, so
L u² is the rate of the angle, and p changes at the rate L u² (m κ / L² - u + 3 m u²), where κ is minus the square
of the velocity. In the angle this is u'' + u = m κ / L² + 3 m u²: the equation the numerical twin integrates,
with κ = 1 for a planet and κ = 0 for light. -/
theorem orbit_equation {v : Fin 4 → K} (hv : S.Geodesic v) (m : K) (hm : ∀ i, S.D i m = 0)
    (hf : S.f = 1 - 2 * m * S.r⁻¹) (L : K) (hL : L * L = S.angSq v) (hL0 : L ≠ 0) :
    S.along v S.r⁻¹ = L * (S.r⁻¹ * S.r⁻¹) * (-(v 1) * L⁻¹) ∧
    S.along v (-(v 1) * L⁻¹)
      = L * (S.r⁻¹ * S.r⁻¹) * (m * (-S.speedSq v) * (L⁻¹ * L⁻¹) - S.r⁻¹ + 3 * m * (S.r⁻¹ * S.r⁻¹)) := by
  have hr := S.r_ne; have hf0 := S.f_ne
  have hLc : S.along v L = 0 := by
    have h := congrArg (S.along v) hL
    rw [S.along_mul, S.angSq_conserved hv] at h
    have h2 : (2 : K) * (L * S.along v L) = 0 := by linear_combination h
    exact (mul_eq_zero.mp ((mul_eq_zero.mp h2).resolve_left (by norm_num))).resolve_left hL0
  have hfp : S.f' = 2 * m * (S.r⁻¹ * S.r⁻¹) := by
    simp only [f']
    rw [hf]
    simp [S.toChart.D_sub, S.toChart.D_mul, S.toChart.D_inv, S.toChart.D_one, S.toChart.D_two, hm 1, S.r1]
  have hw : v 2 * v 2 = L * L * (S.r⁻¹ * S.r⁻¹ * (S.r⁻¹ * S.r⁻¹)) - S.s * S.s * (v 3 * v 3) := by
    rw [hL, angSq]; field_simp
  refine ⟨?_, ?_⟩
  · rw [S.along_inv, S.along_r]; field_simp; ring
  · rw [S.along_mul, S.along_neg, S.along_inv, hLc, S.fall_1 hv, hfp]
    simp only [speedSq]
    rw [hw]
    have hf' : S.f = (S.r - 2 * m) * S.r⁻¹ := by rw [hf]; field_simp
    have hf1 : S.r - 2 * m ≠ 0 := by
      intro h; apply hf0; rw [hf', h, zero_mul]
    rw [hf']
    obtain ⟨q, hq⟩ : ∃ q, q = S.r - 2 * m := ⟨_, rfl⟩
    have hq0 : q ≠ 0 := by rw [hq]; exact hf1
    have hmq : m = (S.r - q) * 2⁻¹ := by rw [hq]; ring
    rw [← hq]
    clear hv hw hLc hfp hL hf hf0 hf' hf1 hq hm
    subst hmq
    generalize S.r = r at *
    generalize S.s = s at *
    generalize v 0 = a at *
    generalize v 1 = b at *
    generalize v 3 = e at *
    have e1 : r * r⁻¹ = 1 := mul_inv_cancel₀ hr
    have e2 : q * q⁻¹ = 1 := mul_inv_cancel₀ hq0
    have e3 : L * L⁻¹ = 1 := mul_inv_cancel₀ hL0
    have e4 : (2 : K) * 2⁻¹ = 1 := mul_inv_cancel₀ (by norm_num)
    -- The identity is closed by an explicit certificate, reduced modulo the four relations e1 to e4.
    simp only [mul_inv, inv_inv]
    generalize r⁻¹ = ri at *
    generalize q⁻¹ = qi at *
    generalize L⁻¹ = Li at *
    generalize (2 : K)⁻¹ = hh at *
    linear_combination
      (-L^3*Li^2*hh*q*r*ri^5 - L^3*Li^2*hh*q*ri^4 + L^3*Li^2*hh*r^2*ri^5 + L^3*Li^2*hh*r*ri^4 + L^3*Li^2*hh*ri^3 - L^2*Li*q*ri^4 - L*Li^2*a^2*hh*q*ri^2 - L*Li^2*b^2*hh*q*qi*ri + L*Li^2*b^2*hh*qi*r*ri + L*Li^2*b^2*hh*qi - 3*L*hh*ri^3 + 2*Li*a^2*hh^2*q*ri^2 + 2*Li*b^2*hh^2*q*qi*ri - 2*Li*b^2*hh^2*qi*r*ri - 2*Li*b^2*hh^2*qi) * e1
      + (-L*Li^2*b^2*hh*ri + 2*Li*b^2*hh^2*ri) * e2
      + (-L^2*Li*hh*q*ri^4 + L^2*Li*hh*ri^3 - L*hh*q*ri^4 + L*hh*ri^3 - L*q*ri^4 + Li*a^2*hh*q^2*ri^3 - Li*a^2*hh*q*ri^2 + Li*b^2*hh*qi - Li*b^2*hh*ri) * e3
      + (L*q*ri^4 - L*ri^3 - Li*a^2*hh*q^2*ri^3 + Li*a^2*hh*q*ri^2 - Li*b^2*hh*qi + Li*b^2*hh*ri) * e4

/-- FREE FALL IN THE VACUUM SOLUTION OBEYS THE ORBIT EQUATION. No form of f is assumed: the vacuum law supplies it. -/
theorem free_fall_in_the_vacuum_solution (h : ∀ i j, S.toChart.Ric S.g i j = 0) {v : Fin 4 → K}
    (hv : S.Geodesic v) (L : K) (hL : L * L = S.angSq v) (hL0 : L ≠ 0) :
    S.along v S.r⁻¹ = L * (S.r⁻¹ * S.r⁻¹) * (-(v 1) * L⁻¹) ∧
    S.along v (-(v 1) * L⁻¹)
      = L * (S.r⁻¹ * S.r⁻¹)
        * (S.mass * (-S.speedSq v) * (L⁻¹ * L⁻¹) - S.r⁻¹ + 3 * S.mass * (S.r⁻¹ * S.r⁻¹)) :=
  S.orbit_equation hv S.mass (S.vacuum_forces_schwarzschild h).1
    ((S.vacuum_forces_schwarzschild h).2.trans (by rw [div_eq_mul_inv])) L hL hL0
end Static
end SPHYS.Schwarzschild

#print axioms SPHYS.Schwarzschild.Chart.Gam_symm
#print axioms SPHYS.Schwarzschild.Chart.Gam_metric
#print axioms SPHYS.Schwarzschild.Static.connection_is_torsion_free_and_metric
#print axioms SPHYS.Schwarzschild.Static.ric_eq
#print axioms SPHYS.Schwarzschild.Static.vacuum_iff
#print axioms SPHYS.Schwarzschild.Static.vacuum_forces_schwarzschild
#print axioms SPHYS.Schwarzschild.Static.schwarzschild_is_vacuum
#print axioms SPHYS.Schwarzschild.Static.energy_conserved
#print axioms SPHYS.Schwarzschild.Static.angSq_conserved
#print axioms SPHYS.Schwarzschild.Static.speedSq_conserved
#print axioms SPHYS.Schwarzschild.Static.radial_equation
#print axioms SPHYS.Schwarzschild.Static.orbit_equation
#print axioms SPHYS.Schwarzschild.Static.free_fall_in_the_vacuum_solution
