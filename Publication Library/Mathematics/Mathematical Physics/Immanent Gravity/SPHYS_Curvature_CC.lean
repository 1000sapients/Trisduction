/-
SPHYS_Curvature_CC.lean · The Curvature of the Vacuum Solution, Computed. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. The Schwarzschild kernel computes the Ricci curvature of the static spherical form and stops there. The Ricci
  curvature of the vacuum solution is zero, so it cannot say whether any place of the solution is singular. This file
  computes the whole curvature tensor of the same form from the same Christoffel symbols, all 256 components, and
  from it the full contraction of the curvature with itself: a scalar, the same in every chart by the classical rule
  of transformation. That invariance is cited in the paper and is not proved in this file.
DESIGN. The chart, the Christoffel symbols, the static setting and its metric are those of the Schwarzschild kernel,
  written out again here word for word, so the file stands alone. `Riem` is the coordinate formula whose contraction
  on the first and third places is the `Ric` of that kernel, and the file proves that it is. The 256 components are
  proved equal to a printed table. The invariant is then a sum over the table. For the vacuum solution it is
  `48 m² / r⁶`.
RISK. The form diag(-f, 1/f, r^2, r^2 s^2) is assumed, as in the Schwarzschild kernel, with r, s and f not zero; the
  static chart therefore does not reach the horizon, where f is zero. The value of the invariant at the horizon is
  the value of the formula there, and that the geometry is regular at the horizon is proved in the horizon kernel
  from the falling chart. The file proves that the invariant grows past every bound toward r = 0. It does not make
  r = 0 a point: the solution is derived on r ≠ 0.
NON-NEGOTIABLE. No axiom is declared. No proof is left open. Curvature is computed, never postulated.
SUMMARY RULE. The sentences of this header, and the comment printed above each theorem, are summaries. Each theorem
  states its own conditions in its statement, and where a summary and a statement differ the statement governs.
-/
import Mathlib.Algebra.Field.Basic
import Mathlib.Algebra.CharZero.Defs
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.FinCases
import Mathlib.Data.Real.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity

namespace SPHYS.Curvature

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

/-- The curvature of the chart, by the coordinate formula. -/
def _root_.SPHYS.Curvature.Chart.Riem (C : Chart K) (g : Fin 4 → K) (a b c d : Fin 4) : K :=
  C.D c (C.Gam g a d b) - C.D d (C.Gam g a c b) + ∑ e, (C.Gam g a c e * C.Gam g e d b - C.Gam g a d e * C.Gam g e c b)

/-- THE RICCI CURVATURE IS THE CONTRACTION OF THIS CURVATURE on its first and third places, in any chart and for any
diagonal metric. The `Ric` of the Schwarzschild kernel is this one. -/
theorem the_ricci_curvature_is_the_contraction (C : Chart K) (g : Fin 4 → K) (i j : Fin 4) :
    C.Ric g i j = ∑ k, C.Riem g k i k j := by
  unfold Chart.Ric Chart.Riem
  rw [← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun k _ => ?_
  rw [C.Gam_symm g k j i, C.Gam_symm g k k i]
  congr 1
  refine Finset.sum_congr rfl fun l _ => ?_
  rw [C.Gam_symm g l j i, C.Gam_symm g l k i]

/-- The curvature of each pair of directions. -/
def kap (a b : Fin 4) : K :=
  if (a = 0 ∧ b = 1) ∨ (a = 1 ∧ b = 0) then -(S.f'' * 2⁻¹)
  else if (a = 2 ∧ b = 3) ∨ (a = 3 ∧ b = 2) then (1 - S.f) * S.r⁻¹ * S.r⁻¹
  else -(S.f' * 2⁻¹ * S.r⁻¹)

/-- The table of the curvature: all 256 components. A component is zero unless its last two places are its first two,
in either order. -/
def riemTable (a b c d : Fin 4) : K :=
  if a = b then 0
  else S.kap a b * S.g b * ((if c = a ∧ d = b then 1 else 0) - (if d = a ∧ c = b then 1 else 0))

-- One tactic block serves all 256 components, as one block serves the sixteen of the Ricci curvature.
macro "riem_block" : tactic => `(tactic| (
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Riem, Chart.Gam, Chart.G, riemTable, kap, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
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
  all_goals (try ring)))

-- The 256 components, sixteen at a time: one statement for each pair of first places.
theorem riem_00 (c d : Fin 4) : S.toChart.Riem S.g 0 0 c d = S.riemTable 0 0 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_01 (c d : Fin 4) : S.toChart.Riem S.g 0 1 c d = S.riemTable 0 1 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_02 (c d : Fin 4) : S.toChart.Riem S.g 0 2 c d = S.riemTable 0 2 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_03 (c d : Fin 4) : S.toChart.Riem S.g 0 3 c d = S.riemTable 0 3 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_10 (c d : Fin 4) : S.toChart.Riem S.g 1 0 c d = S.riemTable 1 0 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_11 (c d : Fin 4) : S.toChart.Riem S.g 1 1 c d = S.riemTable 1 1 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_12 (c d : Fin 4) : S.toChart.Riem S.g 1 2 c d = S.riemTable 1 2 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_13 (c d : Fin 4) : S.toChart.Riem S.g 1 3 c d = S.riemTable 1 3 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_20 (c d : Fin 4) : S.toChart.Riem S.g 2 0 c d = S.riemTable 2 0 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_21 (c d : Fin 4) : S.toChart.Riem S.g 2 1 c d = S.riemTable 2 1 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_22 (c d : Fin 4) : S.toChart.Riem S.g 2 2 c d = S.riemTable 2 2 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_23 (c d : Fin 4) : S.toChart.Riem S.g 2 3 c d = S.riemTable 2 3 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_30 (c d : Fin 4) : S.toChart.Riem S.g 3 0 c d = S.riemTable 3 0 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_31 (c d : Fin 4) : S.toChart.Riem S.g 3 1 c d = S.riemTable 3 1 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_32 (c d : Fin 4) : S.toChart.Riem S.g 3 2 c d = S.riemTable 3 2 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_33 (c d : Fin 4) : S.toChart.Riem S.g 3 3 c d = S.riemTable 3 3 c d := by
  fin_cases c <;> fin_cases d <;> riem_block

/-- THE CURVATURE, COMPUTED. Every one of the 256 components of the curvature of the static spherical form is the entry
of the table. -/
theorem the_curvature_is_the_table (a b c d : Fin 4) : S.toChart.Riem S.g a b c d = S.riemTable a b c d := by
  fin_cases a <;> fin_cases b <;> first | exact S.riem_00 c d | exact S.riem_01 c d | exact S.riem_02 c d | exact S.riem_03 c d | exact S.riem_10 c d | exact S.riem_11 c d | exact S.riem_12 c d | exact S.riem_13 c d | exact S.riem_20 c d | exact S.riem_21 c d | exact S.riem_22 c d | exact S.riem_23 c d | exact S.riem_30 c d | exact S.riem_31 c d | exact S.riem_32 c d | exact S.riem_33 c d

/-- The invariant of the curvature: the curvature contracted with itself on all four places. -/
def invariant : K :=
  ∑ a, ∑ b, ∑ c, ∑ d, (S.g a * S.toChart.Riem S.g a b c d) ^ 2 * (S.g a)⁻¹ * (S.g b)⁻¹ * (S.g c)⁻¹ * (S.g d)⁻¹

/-- ONE TERM OF THE CONTRACTION. A component of the table, lowered and contracted with itself, is the square of the
curvature of its pair of directions when its last two places are its first two in either order, and zero otherwise. -/
theorem one_term_of_the_contraction (a b c d : Fin 4) :
    (S.g a * S.riemTable a b c d) ^ 2 * (S.g a)⁻¹ * (S.g b)⁻¹ * (S.g c)⁻¹ * (S.g d)⁻¹
      = if a = b then 0
        else S.kap a b ^ 2 * ((if c = a ∧ d = b then 1 else 0) + (if d = a ∧ c = b then 1 else 0)) := by
  have key1 : ∀ x y k : K, x ≠ 0 → y ≠ 0 → (x * (k * y)) ^ 2 * x⁻¹ * y⁻¹ * x⁻¹ * y⁻¹ = k ^ 2 := by
    intro x y k hx hy; field_simp; ring
  have key2 : ∀ x y k : K, x ≠ 0 → y ≠ 0 → (x * (k * y)) ^ 2 * x⁻¹ * y⁻¹ * y⁻¹ * x⁻¹ = k ^ 2 := by
    intro x y k hx hy; field_simp; ring
  by_cases hab : a = b
  · simp [riemTable, hab]
  · by_cases h1 : c = a ∧ d = b
    · obtain ⟨rfl, rfl⟩ := h1
      have h2 : ¬ (d = c ∧ c = d) := fun h => hab h.2
      simpa [riemTable, hab, h2] using key1 (S.g c) (S.g d) (S.kap c d) (S.g_ne c) (S.g_ne d)
    · by_cases h2 : d = a ∧ c = b
      · obtain ⟨rfl, rfl⟩ := h2
        have h3 : ¬ (c = d ∧ d = c) := fun h => hab h.2
        simpa [riemTable, hab, h3] using key2 (S.g d) (S.g c) (S.kap d c) (S.g_ne d) (S.g_ne c)
      · simp [riemTable, hab, h1, h2]

/-- THE INVARIANT OF THE CURVATURE of the static spherical form, for any `f`: the square of `f''`, and four times the
square of `f'` over `r²`, and four times the square of `1 − f` over `r⁴`. -/
theorem the_invariant_of_the_curvature :
    S.invariant = S.f'' ^ 2 + 4 * S.f' ^ 2 * S.r⁻¹ ^ 2 + 4 * (1 - S.f) ^ 2 * S.r⁻¹ ^ 4 := by
  unfold invariant
  simp only [S.the_curvature_is_the_table, S.one_term_of_the_contraction]
  simp [kap, Fin.sum_univ_four]
  ring

/-- THE INVARIANT OF THE VACUUM SOLUTION is `48 m² / r⁶`, for `f = 1 − 2m/r` with `m` constant along the radius. -/
theorem the_invariant_of_the_vacuum_solution (m : K) (hm : S.D 1 m = 0) (hf : S.f = 1 - 2 * m / S.r) :
    S.invariant = 48 * m ^ 2 / S.r ^ 6 := by
  have hf' : S.f = 1 - 2 * m * S.r⁻¹ := by rw [hf, div_eq_mul_inv]
  have e1 : S.f' = 2 * m * S.r⁻¹ ^ 2 := by
    unfold f'; rw [hf']
    simp [S.toChart.D_sub, S.toChart.D_one, S.toChart.D_mul, S.toChart.D_two, S.toChart.D_inv, hm, S.r1]
    all_goals first | ring1 | exact Or.inl (by ring1) | simp [pow_two]
  have e2 : S.f'' = -(4 * m * S.r⁻¹ ^ 3) := by
    have t : S.D 1 S.f = 2 * m * S.r⁻¹ ^ 2 := e1
    unfold f''; rw [t]
    simp [S.toChart.D_mul, S.toChart.D_two, S.toChart.D_inv, hm, S.r1, pow_succ]
    all_goals first | ring1 | exact Or.inl (by ring1) | simp [pow_two]
  rw [S.the_invariant_of_the_curvature, e1, e2, hf']
  ring

/-- THE INVARIANT AT THE HORIZON has the value `3 / (4 m⁴)`: the formula is finite there. -/
theorem the_invariant_at_the_horizon (m : K) (hm : m ≠ 0) : 48 * m ^ 2 / (2 * m) ^ 6 = 3 / (4 * m ^ 4) := by
  field_simp; ring

end Static

/-- THE INVARIANT GROWS PAST EVERY BOUND TOWARD THE CENTRE. On the real numbers, for a mass that is not zero: above any
number `B` the invariant `48 m² / r⁶` rises, for all radii near enough to zero. It has no value at zero. -/
theorem the_invariant_grows_past_every_bound (m : ℝ) (hm : m ≠ 0) (B : ℝ) :
    ∃ δ > 0, ∀ r, 0 < r → r < δ → B < 48 * m ^ 2 / r ^ 6 := by
  have hm2 : 0 < 48 * m ^ 2 := by positivity
  refine ⟨min 1 (48 * m ^ 2 / (|B| + 1)), lt_min one_pos (by positivity), fun r h0 h1 => ?_⟩
  have k1 := min_le_left 1 (48 * m ^ 2 / (|B| + 1))
  have k2 := min_le_right 1 (48 * m ^ 2 / (|B| + 1))
  have hr1 : r ≤ 1 := by linarith
  have hr6 : r ^ 6 ≤ r := by
    calc r ^ 6 ≤ r ^ 1 := pow_le_pow_of_le_one h0.le hr1 (by norm_num)
      _ = r := pow_one r
  have hB : 0 < |B| + 1 := by positivity
  have h2 : r < 48 * m ^ 2 / (|B| + 1) := by linarith
  have h3 : r * (|B| + 1) < 48 * m ^ 2 := by rwa [lt_div_iff₀ hB] at h2
  have hr6pos : 0 < r ^ 6 := by positivity
  rw [lt_div_iff₀ hr6pos]
  have : B ≤ |B| := le_abs_self B
  nlinarith [mul_le_mul_of_nonneg_right hr6 hB.le]

end SPHYS.Curvature

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.Curvature.Chart.D_zero' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Curvature.Chart.D_zero
/-- info: 'SPHYS.Curvature.Chart.D_one' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Curvature.Chart.D_one
/-- info: 'SPHYS.Curvature.Chart.D_neg' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Curvature.Chart.D_neg
/-- info: 'SPHYS.Curvature.Chart.D_sub' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Curvature.Chart.D_sub
/-- info: 'SPHYS.Curvature.Chart.D_two' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Curvature.Chart.D_two
/-- info: 'SPHYS.Curvature.Chart.D_inv' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Chart.D_inv
/-- info: 'SPHYS.Curvature.Chart.D_div' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Chart.D_div
/-- info: 'SPHYS.Curvature.Chart.Gam_symm' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Chart.Gam_symm
/-- info: 'SPHYS.Curvature.Chart.Gam_metric' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Chart.Gam_metric
/-- info: 'SPHYS.Curvature.Static.g_ne' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.g_ne
/--
info: 'SPHYS.Curvature.Static.connection_is_torsion_free_and_metric' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Curvature.Static.connection_is_torsion_free_and_metric
/-- info: 'SPHYS.Curvature.Static.fp0' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.fp0
/-- info: 'SPHYS.Curvature.Static.fp2' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.fp2
/-- info: 'SPHYS.Curvature.Static.fp3' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.fp3
/--
info: 'SPHYS.Curvature.Static.the_ricci_curvature_is_the_contraction' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Curvature.Static.the_ricci_curvature_is_the_contraction
/-- info: 'SPHYS.Curvature.Static.riem_00' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_00
/-- info: 'SPHYS.Curvature.Static.riem_01' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_01
/-- info: 'SPHYS.Curvature.Static.riem_02' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_02
/-- info: 'SPHYS.Curvature.Static.riem_03' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_03
/-- info: 'SPHYS.Curvature.Static.riem_10' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_10
/-- info: 'SPHYS.Curvature.Static.riem_11' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_11
/-- info: 'SPHYS.Curvature.Static.riem_12' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_12
/-- info: 'SPHYS.Curvature.Static.riem_13' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_13
/-- info: 'SPHYS.Curvature.Static.riem_20' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_20
/-- info: 'SPHYS.Curvature.Static.riem_21' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_21
/-- info: 'SPHYS.Curvature.Static.riem_22' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_22
/-- info: 'SPHYS.Curvature.Static.riem_23' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_23
/-- info: 'SPHYS.Curvature.Static.riem_30' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_30
/-- info: 'SPHYS.Curvature.Static.riem_31' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_31
/-- info: 'SPHYS.Curvature.Static.riem_32' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_32
/-- info: 'SPHYS.Curvature.Static.riem_33' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_33
/--
info: 'SPHYS.Curvature.Static.the_curvature_is_the_table' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Curvature.Static.the_curvature_is_the_table
/--
info: 'SPHYS.Curvature.Static.one_term_of_the_contraction' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Curvature.Static.one_term_of_the_contraction
/--
info: 'SPHYS.Curvature.Static.the_invariant_of_the_curvature' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Curvature.Static.the_invariant_of_the_curvature
/--
info: 'SPHYS.Curvature.Static.the_invariant_of_the_vacuum_solution' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Curvature.Static.the_invariant_of_the_vacuum_solution
/--
info: 'SPHYS.Curvature.Static.the_invariant_at_the_horizon' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Curvature.Static.the_invariant_at_the_horizon
/--
info: 'SPHYS.Curvature.the_invariant_grows_past_every_bound' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Curvature.the_invariant_grows_past_every_bound
