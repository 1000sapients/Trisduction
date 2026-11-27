/-
SPHYS_Birkhoff_CC.lean · the spherical vacuum solution is Schwarzschild and static
RATIONALE. SPHYS_Schwarzschild_CC.lean assumed the solution static and assumed g_rr = 1/g_tt. This file assumes
  neither. Two free functions A and B of the time and the radius are taken, and the vacuum law is shown to force
  B independent of the time, 1/B = 1 - 2m/r with m constant in all four coordinates, and A = (A B)(1 - 2m/r) with
  A B a function of the time alone. This is Birkhoff's theorem in the diagonal areal chart.
DESIGN. A chart is a field K of functions with four commuting derivations D 0..D 3 (t, r, theta, phi). Christoffel
  symbols and Ricci curvature are the textbook coordinate formulas for a diagonal metric. Sine and cosine enter as
  two elements s, c with D 2 s = c and D 2 c = -s; nothing else about them is used.
RISK. One assumption remains: that a spherically symmetric metric can be brought to the diagonal form
  diag(-A, B, r^2, r^2 s^2) with r the areal radius. That reduction is classical and is not formalised here.
  The three curvature identities are closed by explicit certificates (reduction modulo x * x⁻¹ = 1), generated
  by computer algebra and checked by Lean's `ring`; the generator is not trusted, only the check.
  The inverse of zero is zero in a Lean field; r, s, A, B are assumed nonzero.
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

namespace SPHYS.Birkhoff

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

/-- The spherical setting, not assumed static: the radius r, the sine and cosine of the polar angle, and two
functions A and B that may depend on the time and on the radius. -/
structure Sph (K : Type) [Field K] extends Chart K where
  r : K
  s : K
  c : K
  A : K
  B : K
  r_ne : r ≠ 0
  s_ne : s ≠ 0
  A_ne : A ≠ 0
  B_ne : B ≠ 0
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
  A2 : D 2 A = 0
  A3 : D 3 A = 0
  B2 : D 2 B = 0
  B3 : D 3 B = 0

namespace Sph
variable [CharZero K] (S : Sph K)

-- The characteristic-zero assumption is not used by every lemma below.
set_option linter.unusedSectionVars false
set_option maxHeartbeats 1600000

/-- The metric diag(-A, B, r^2, r^2 s^2). -/
def g : Fin 4 → K := ![-S.A, S.B, S.r * S.r, S.r * S.r * (S.s * S.s)]

/-- No entry of the metric vanishes. -/
theorem g_ne (i : Fin 4) : S.g i ≠ 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hA := S.A_ne; have hB := S.B_ne
  fin_cases i <;> simp [g, hr, hs, hA, hB]

/-- THE CONNECTION OF THIS FILE IS THE TORSION-FREE METRIC CONNECTION. Its Christoffel symbols are symmetric and they
carry the derivative of the metric. The curvature below is the curvature of that connection, in coordinates. -/
theorem connection_is_torsion_free_and_metric :
    (∀ k i j, S.toChart.Gam S.g k i j = S.toChart.Gam S.g k j i) ∧
    (∀ k i j, S.D k (Chart.G S.g i j)
      = ∑ l, (Chart.G S.g l j * S.toChart.Gam S.g l k i + Chart.G S.g i l * S.toChart.Gam S.g l k j)) :=
  ⟨fun k i j => S.toChart.Gam_symm S.g k i j,
   fun k i j => S.toChart.Gam_metric S.g S.g_ne (by norm_num) k i j⟩

theorem A20 : S.D 2 (S.D 0 S.A) = 0 := by rw [S.D_comm, S.A2, S.toChart.D_zero]
theorem A21 : S.D 2 (S.D 1 S.A) = 0 := by rw [S.D_comm, S.A2, S.toChart.D_zero]
theorem A30 : S.D 3 (S.D 0 S.A) = 0 := by rw [S.D_comm, S.A3, S.toChart.D_zero]
theorem A31 : S.D 3 (S.D 1 S.A) = 0 := by rw [S.D_comm, S.A3, S.toChart.D_zero]
theorem B20 : S.D 2 (S.D 0 S.B) = 0 := by rw [S.D_comm, S.B2, S.toChart.D_zero]
theorem B21 : S.D 2 (S.D 1 S.B) = 0 := by rw [S.D_comm, S.B2, S.toChart.D_zero]
theorem B30 : S.D 3 (S.D 0 S.B) = 0 := by rw [S.D_comm, S.B3, S.toChart.D_zero]
theorem B31 : S.D 3 (S.D 1 S.B) = 0 := by rw [S.D_comm, S.B3, S.toChart.D_zero]
theorem A10 : S.D 1 (S.D 0 S.A) = S.D 0 (S.D 1 S.A) := S.D_comm 1 0 S.A
theorem B10 : S.D 1 (S.D 0 S.B) = S.D 0 (S.D 1 S.B) := S.D_comm 1 0 S.B

/-- The mixed time-radius component: it is the time derivative of B, over r B. -/
theorem ric_01 : S.toChart.Ric S.g 0 1 = S.D 0 S.B * S.r⁻¹ * S.B⁻¹ := by
  have hr := S.r_ne; have hs := S.s_ne; have hA := S.A_ne; have hB := S.B_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.A2, S.A3, S.B2, S.B3,
    S.A20, S.A21, S.A30, S.A31, S.B20, S.B21, S.B30, S.B31, S.A10, S.B10]
  generalize S.D 0 (S.D 0 S.A) = Att at *
  generalize S.D 0 (S.D 1 S.A) = Atr at *
  generalize S.D 1 (S.D 1 S.A) = Arr at *
  generalize S.D 0 (S.D 0 S.B) = Btt at *
  generalize S.D 0 (S.D 1 S.B) = Btr at *
  generalize S.D 1 (S.D 1 S.B) = Brr at *
  generalize S.D 0 S.A = At at *
  generalize S.D 1 S.A = Ar at *
  generalize S.D 0 S.B = Bt at *
  generalize S.D 1 S.B = Br at *
  generalize S.r = r at *
  generalize S.s = s at *
  generalize S.c = c at *
  generalize S.A = A at *
  generalize S.B = B at *
  have e1 : r * r⁻¹ = 1 := mul_inv_cancel₀ hr
  have e2 : s * s⁻¹ = 1 := mul_inv_cancel₀ hs
  have e3 : A * A⁻¹ = 1 := mul_inv_cancel₀ hA
  have e4 : B * B⁻¹ = 1 := mul_inv_cancel₀ hB
  generalize r⁻¹ = a at *
  generalize s⁻¹ = b at *
  generalize A⁻¹ = p at *
  generalize B⁻¹ = q at *
  linear_combination
    (Bt*a*b^2*q*s^2/2 + Bt*a*q/2) * e1
    + (Bt*a*b*q*s/2 + Bt*a*q/2) * e2

/-- The angular component. It carries no time derivative. -/
theorem ric_22 : S.toChart.Ric S.g 2 2 = 1 - S.B⁻¹ - S.r * 2⁻¹ * S.B⁻¹ * (S.D 1 S.A * S.A⁻¹ - S.D 1 S.B * S.B⁻¹) := by
  have hr := S.r_ne; have hs := S.s_ne; have hA := S.A_ne; have hB := S.B_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.A2, S.A3, S.B2, S.B3,
    S.A20, S.A21, S.A30, S.A31, S.B20, S.B21, S.B30, S.B31, S.A10, S.B10]
  generalize S.D 0 (S.D 0 S.A) = Att at *
  generalize S.D 0 (S.D 1 S.A) = Atr at *
  generalize S.D 1 (S.D 1 S.A) = Arr at *
  generalize S.D 0 (S.D 0 S.B) = Btt at *
  generalize S.D 0 (S.D 1 S.B) = Btr at *
  generalize S.D 1 (S.D 1 S.B) = Brr at *
  generalize S.D 0 S.A = At at *
  generalize S.D 1 S.A = Ar at *
  generalize S.D 0 S.B = Bt at *
  generalize S.D 1 S.B = Br at *
  generalize S.r = r at *
  generalize S.s = s at *
  generalize S.c = c at *
  generalize S.A = A at *
  generalize S.B = B at *
  have e1 : r * r⁻¹ = 1 := mul_inv_cancel₀ hr
  have e2 : s * s⁻¹ = 1 := mul_inv_cancel₀ hs
  have e3 : A * A⁻¹ = 1 := mul_inv_cancel₀ hA
  have e4 : B * B⁻¹ = 1 := mul_inv_cancel₀ hB
  generalize r⁻¹ = a at *
  generalize s⁻¹ = b at *
  generalize A⁻¹ = p at *
  generalize B⁻¹ = q at *
  linear_combination
    (a^3*b^4*c^2*r^3*s^2 + a^2*b^4*c^2*r^2*s^2 + a*b^4*c^2*r*s^2 - a*b^2*c^2*r - a*b^2*q*r*s^2 + a*b^2*r*s^2 + a*q*r + b^4*c^2*s^2 - b^2*c^2 - b^2*q*s^2 + b^2*s^2 + q) * e1
    + (b^3*c^2*s + b^2*c^2 - b*q*s + b*s - q + 1) * e2

/-- The combination B R_tt + A R_rr: every time derivative cancels, and (A B)' over r B remains. -/
theorem ric_sum : S.B * S.toChart.Ric S.g 0 0 + S.A * S.toChart.Ric S.g 1 1 = (S.D 1 S.A * S.B + S.A * S.D 1 S.B) * S.r⁻¹ * S.B⁻¹ := by
  have hr := S.r_ne; have hs := S.s_ne; have hA := S.A_ne; have hB := S.B_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.A2, S.A3, S.B2, S.B3,
    S.A20, S.A21, S.A30, S.A31, S.B20, S.B21, S.B30, S.B31, S.A10, S.B10]
  generalize S.D 0 (S.D 0 S.A) = Att at *
  generalize S.D 0 (S.D 1 S.A) = Atr at *
  generalize S.D 1 (S.D 1 S.A) = Arr at *
  generalize S.D 0 (S.D 0 S.B) = Btt at *
  generalize S.D 0 (S.D 1 S.B) = Btr at *
  generalize S.D 1 (S.D 1 S.B) = Brr at *
  generalize S.D 0 S.A = At at *
  generalize S.D 1 S.A = Ar at *
  generalize S.D 0 S.B = Bt at *
  generalize S.D 1 S.B = Br at *
  generalize S.r = r at *
  generalize S.s = s at *
  generalize S.c = c at *
  generalize S.A = A at *
  generalize S.B = B at *
  have e1 : r * r⁻¹ = 1 := mul_inv_cancel₀ hr
  have e2 : s * s⁻¹ = 1 := mul_inv_cancel₀ hs
  have e3 : A * A⁻¹ = 1 := mul_inv_cancel₀ hA
  have e4 : B * B⁻¹ = 1 := mul_inv_cancel₀ hB
  generalize r⁻¹ = a at *
  generalize s⁻¹ = b at *
  generalize A⁻¹ = p at *
  generalize B⁻¹ = q at *
  linear_combination
    (A*Br*a*b^2*q*s^2/2 + A*Br*a*q/2 + A*a^3*b^4*r*s^4 + A*a^3*r + A*a^2*b^4*s^4 + A*a^2 + Ar*B*a*b^2*q*s^2/2 + Ar*B*a*q/2) * e1
    + (A*Br*a*b*q*s/2 + A*Br*a*q/2 + A*a^2*b^3*s^3 + A*a^2*b^2*s^2 + Ar*B*a*b*q*s/2 + Ar*B*a*q/2) * e2
    + (Ar^2*p/4 + Ar*Br*q/4 - Arr/2 - At*Bt*p/4 - Bt^2*q/4 + Btt/2) * e3
    + (-Ar^2*p/4 - Ar*Br*q/4 + Arr/2 + At*Bt*p/4 + Bt^2*q/4 - Btt/2) * e4

/-- The mass function r (1 - 1/B) / 2. -/
def mass : K := S.r * (1 - S.B⁻¹) * 2⁻¹

/-- BIRKHOFF'S THEOREM IN THE DIAGONAL AREAL CHART. If the vacuum law holds, with no assumption that anything is
static: B does not depend on the time; the mass function is constant in all four coordinates; 1/B = 1 - 2m/r;
the product A B depends on the time alone; and A = (A B)(1 - 2m/r). A time-dependent A B is a choice of clock. -/
theorem birkhoff (h : ∀ i j, S.toChart.Ric S.g i j = 0) :
    S.D 0 S.B = 0 ∧ (∀ i, S.D i S.mass = 0) ∧ S.B⁻¹ = 1 - 2 * S.mass / S.r
      ∧ S.D 1 (S.A * S.B) = 0 ∧ S.D 2 (S.A * S.B) = 0 ∧ S.D 3 (S.A * S.B) = 0
      ∧ S.A = S.A * S.B * (1 - 2 * S.mass / S.r) := by
  have hr := S.r_ne; have hA := S.A_ne; have hB := S.B_ne
  have e1 : S.r * S.r⁻¹ = 1 := mul_inv_cancel₀ hr
  have e3 : S.A * S.A⁻¹ = 1 := mul_inv_cancel₀ hA
  have e4 : S.B * S.B⁻¹ = 1 := mul_inv_cancel₀ hB
  have e5 : (2 : K) * 2⁻¹ = 1 := mul_inv_cancel₀ (by norm_num)
  have h01 := h 0 1
  rw [S.ric_01] at h01
  have Bt0 : S.D 0 S.B = 0 := by simpa [hr, hB] using h01
  have hs := S.ric_sum
  rw [h 0 0, h 1 1, mul_zero, mul_zero, add_zero] at hs
  have hAB : S.D 1 S.A * S.B + S.A * S.D 1 S.B = 0 := by simpa [hr, hB] using hs.symm
  have h22 := h 2 2
  rw [S.ric_22] at h22
  have m0 : S.D 0 S.mass = 0 := by
    simp only [mass, S.toChart.D_mul, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_one, S.toChart.D_two, S.r0, Bt0]
    ring
  have m1 : S.D 1 S.mass = 0 := by
    simp only [mass, S.toChart.D_mul, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_one, S.toChart.D_two, S.r1]
    linear_combination (2⁻¹ : K) * h22 + (S.r * S.B⁻¹ * 4⁻¹ * (S.A⁻¹ * S.B⁻¹)) * hAB
      - (S.r * S.B⁻¹ * 4⁻¹ * (S.D 1 S.A * S.A⁻¹)) * e4 - (S.r * S.B⁻¹ * 4⁻¹ * (S.D 1 S.B * S.B⁻¹)) * e3
  have m2 : S.D 2 S.mass = 0 := by
    simp only [mass, S.toChart.D_mul, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_one, S.toChart.D_two, S.r2, S.B2]
    ring
  have m3 : S.D 3 S.mass = 0 := by
    simp only [mass, S.toChart.D_mul, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_one, S.toChart.D_two, S.r3, S.B3]
    ring
  have hq : S.B⁻¹ = 1 - 2 * S.mass / S.r := by
    rw [div_eq_mul_inv]
    simp only [mass]
    linear_combination ((1 - S.B⁻¹) * (S.r * S.r⁻¹)) * e5 + (1 - S.B⁻¹) * e1
  refine ⟨Bt0, ?_, hq, ?_, ?_, ?_, ?_⟩
  · intro i
    fin_cases i
    · exact m0
    · exact m1
    · exact m2
    · exact m3
  · rw [S.toChart.D_mul]; exact hAB
  · rw [S.toChart.D_mul, S.A2, S.B2]; ring
  · rw [S.toChart.D_mul, S.A3, S.B3]; ring
  · rw [← hq, mul_assoc, e4, mul_one]
end Sph
end SPHYS.Birkhoff

#print axioms SPHYS.Birkhoff.Chart.Gam_symm
#print axioms SPHYS.Birkhoff.Chart.Gam_metric
#print axioms SPHYS.Birkhoff.Sph.connection_is_torsion_free_and_metric
#print axioms SPHYS.Birkhoff.Sph.ric_01
#print axioms SPHYS.Birkhoff.Sph.ric_22
#print axioms SPHYS.Birkhoff.Sph.ric_sum
#print axioms SPHYS.Birkhoff.Sph.birkhoff
