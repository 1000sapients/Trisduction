/-
SPHYS_Waves_CC.lean · the plane waves of the linearised law have two polarisations, and both are tensor
RATIONALE. The paper's third falsifier is a polarisation of gravitational waves that is not tensor. Part II of this
  file derives the linearised vacuum law for a plane wave from the Ricci curvature of a metric that is flat plus a
  first-order wave; Part III solves it, removes the freedom of coordinates, and finds two amplitudes.
DESIGN. Flat metric diag(-1, 1, 1, 1); wave vector k = (1, 0, 0, 1), null; amplitude a symmetric array e.
  First order is exact algebra: an element eps with eps * eps = 0. The metric is eta + eps e F, where F is any
  profile of the phase with derivatives F1 and F2 along k. Its inverse, Christoffel symbols and Ricci curvature are
  the coordinate formulas. `linearised_ricci` proves Ric = half * eps * F2 * waveLaw e, so the vanishing of
  waveLaw is the vacuum law to first order. A change of coordinates by x changes e by k_m x_n + k_n x_m.
RISK. The wave travels along one axis and its profile is a function of the phase alone; a general wave is a sum of
  such waves, and that superposition is not formalised. `two_polarisations` is stated over an ordered field.
NON-NEGOTIABLE. No sorry, no axiom beyond Lean's own. The law is derived, not entered.
-/
import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Ring
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum

namespace SPHYS.Waves

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
def kUp : Fin 4 → R := ![1, 0, 0, 1]
def kDn : Fin 4 → R := ![-1, 0, 0, 1]
def v (e : Fin 4 → Fin 4 → R) (n : Fin 4) : R := ∑ a, kUp a * e a n
def T (e : Fin 4 → Fin 4 → R) : R := ∑ a, eta a * e a a
/-- The expression whose vanishing is the linearised vacuum law for a plane wave of amplitude e. -/
def waveLaw (e : Fin 4 → Fin 4 → R) (m n : Fin 4) : R := kDn m * v e n + kDn n * v e m - kDn m * kDn n * T e

/-- A metric that is flat plus a small plane wave: a ring with four derivations, an element eps whose square is
zero (first order), a profile F of the phase with its two derivatives, and a constant symmetric amplitude e. -/
structure LinWave (R : Type) [CommRing R] where
  D : Fin 4 → R → R
  D_add : ∀ i x y, D i (x + y) = D i x + D i y
  D_mul : ∀ i x y, D i (x * y) = D i x * y + x * D i y
  eps : R
  eps_sq : eps * eps = 0
  D_eps : ∀ i, D i eps = 0
  half : R
  two_half : 2 * half = 1
  D_half : ∀ i, D i half = 0
  F : R
  F1 : R
  F2 : R
  D_F : ∀ i, D i F = kDn i * F1
  D_F1 : ∀ i, D i F1 = kDn i * F2
  e : Fin 4 → Fin 4 → R
  e_symm : ∀ a b, e a b = e b a
  D_e : ∀ i a b, D i (e a b) = 0

namespace LinWave
variable (W : LinWave R)

theorem D_zero (i : Fin 4) : W.D i 0 = 0 := by
  have h := W.D_add i 0 0; rw [add_zero] at h; exact left_eq_add.mp h
theorem D_one (i : Fin 4) : W.D i 1 = 0 := by
  have h := W.D_mul i 1 1; simp only [mul_one, one_mul] at h; exact left_eq_add.mp h
theorem D_neg (i : Fin 4) (x : R) : W.D i (-x) = -W.D i x := by
  have h := W.D_add i x (-x); rw [add_neg_cancel, W.D_zero] at h; exact eq_neg_of_add_eq_zero_right h.symm
theorem D_sub (i : Fin 4) (x y : R) : W.D i (x - y) = W.D i x - W.D i y := by
  rw [sub_eq_add_neg, W.D_add, W.D_neg, sub_eq_add_neg]

/-- The metric: flat plus eps times the wave. -/
def gm (i j : Fin 4) : R := (if i = j then eta i else 0) + W.eps * (W.e i j * W.F)
/-- Its inverse to first order. -/
def gi (i j : Fin 4) : R := (if i = j then eta i else 0) - W.eps * (eta i * W.e i j * eta j * W.F)
/-- The Christoffel symbols of the metric, by the coordinate formula. -/
def Gam (k i j : Fin 4) : R :=
  W.half * ∑ l, W.gi k l * (W.D i (W.gm j l) + W.D j (W.gm i l) - W.D l (W.gm i j))

theorem e2 : W.eps ^ 2 = 0 := by rw [pow_two]; exact W.eps_sq
theorem e3 : W.eps ^ 3 = 0 := by rw [pow_succ, W.e2, zero_mul]
theorem e4 : W.eps ^ 4 = 0 := by rw [pow_succ, W.e3, zero_mul]

-- One tactic block closes every component; on components that close early its tail has nothing to do.
set_option linter.unusedTactic false
set_option linter.unreachableTactic false
set_option maxHeartbeats 4000000

/-- The inverse is the inverse, to first order. -/
theorem gi_is_inverse : ∀ i j, ∑ l, W.gm i l * W.gi l j = if i = j then 1 else 0 := by
  rw [forall4]; refine ⟨?_, ?_, ?_, ?_⟩ <;> rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;>
    simp [gm, gi, Fin.sum_univ_four, eta]
  all_goals (try ring_nf)
  all_goals (try simp only [W.e2, W.e3, W.e4, mul_zero, zero_mul, add_zero, zero_add, sub_zero, neg_zero])
  all_goals (try ring)

/-- THE CHRISTOFFEL SYMBOLS TO FIRST ORDER. -/
theorem Gam_eq : ∀ k i j, W.Gam k i j
    = W.half * W.eps * W.F1 * eta k * (kDn i * W.e j k + kDn j * W.e i k - kDn k * W.e i j) := by
  rw [forall4]; refine ⟨?_, ?_, ?_, ?_⟩ <;> rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;>
    rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;>
    simp [Gam, gm, gi, Fin.sum_univ_four, eta, kDn, W.D_add, W.D_mul, W.D_sub, W.D_neg, W.D_zero, W.D_one, W.D_eps, W.D_e, W.D_F, W.D_F1, W.D_half]
  all_goals (try ring_nf)
  all_goals (try simp only [W.e2, W.e3, W.e4, mul_zero, zero_mul, add_zero, zero_add, sub_zero, neg_zero])
  all_goals (try ring)

/-- The Ricci curvature of the metric, by the coordinate formula. -/
def Ric (i j : Fin 4) : R :=
  (∑ k, (W.D k (W.Gam k i j) - W.D j (W.Gam k i k)))
  + ∑ k, ∑ l, (W.Gam k k l * W.Gam l i j - W.Gam k j l * W.Gam l i k)

/-- THE LINEARISED VACUUM LAW, DERIVED. To first order the Ricci curvature of flat space plus a plane wave of
amplitude e is half * eps * F2 times the wave expression. Its vanishing is the condition `IsWave` below. -/
theorem linearised_ricci : ∀ i j, W.Ric i j = W.half * W.eps * W.F2 * waveLaw W.e i j := by
  have s10 := W.e_symm 1 0; have s20 := W.e_symm 2 0; have s30 := W.e_symm 3 0
  have s21 := W.e_symm 2 1; have s31 := W.e_symm 3 1; have s32 := W.e_symm 3 2
  rw [forall4]; refine ⟨?_, ?_, ?_, ?_⟩ <;> rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;>
    simp only [Ric, W.Gam_eq] <;>
    simp [waveLaw, v, T, Fin.sum_univ_four, eta, kDn, kUp, s10, s20, s30, s21, s31, s32, W.D_add, W.D_mul, W.D_sub, W.D_neg, W.D_zero, W.D_one, W.D_eps, W.D_e, W.D_F, W.D_F1, W.D_half]
  all_goals (try ring_nf)
  all_goals (try simp only [W.e2, W.e3, W.e4, mul_zero, zero_mul, add_zero, zero_add, sub_zero, neg_zero])
  all_goals (try ring)
end LinWave

/-! ## Part III. The solutions of the law -/
variable {K : Type} [Field K] [LinearOrder K] [IsStrictOrderedRing K]
-- The order is used only to close linear goals; the two listed waves need no order at all.
set_option linter.unusedSectionVars false

/-- The linearised vacuum law for a plane wave of amplitude e: symmetric, and the wave expression vanishes. By
`LinWave.linearised_ricci` this is the vanishing of the first-order Ricci curvature. -/
def IsWave (e : Fin 4 → Fin 4 → K) : Prop :=
  (∀ m n, e m n = e n m) ∧ ∀ m n, waveLaw e m n = 0

/-- A change of coordinates by x. -/
def gauge (e : Fin 4 → Fin 4 → K) (x : Fin 4 → K) (m n : Fin 4) : K := e m n + kDn m * x n + kDn n * x m

/-- The two tensor polarisations, plus and cross, and the scalar one that stretches both transverse directions. -/
def plus (m n : Fin 4) : K := if m = 1 ∧ n = 1 then 1 else if m = 2 ∧ n = 2 then -1 else 0
def cross (m n : Fin 4) : K := if (m = 1 ∧ n = 2) ∨ (m = 2 ∧ n = 1) then 1 else 0
def breathing (m n : Fin 4) : K := if (m = 1 ∧ n = 1) ∨ (m = 2 ∧ n = 2) then 1 else 0

/-- What the law says of a wave, component by component. -/
theorem wave_conditions (e : Fin 4 → Fin 4 → K) (h : IsWave e) :
    e 0 1 + e 1 3 = 0 ∧ e 0 2 + e 2 3 = 0 ∧ e 0 0 + 2 * e 0 3 + e 3 3 = 0 ∧ e 1 1 + e 2 2 = 0 := by
  obtain ⟨hs, hw⟩ := h
  have h01 := hw 0 1; have h02 := hw 0 2; have h00 := hw 0 0; have h33 := hw 3 3
  have s10 := hs 1 0; have s20 := hs 2 0; have s30 := hs 3 0; have s31 := hs 3 1; have s32 := hs 3 2
  simp [waveLaw, v, T, kUp, kDn, eta, Fin.sum_univ_four] at h01 h02 h00 h33
  refine ⟨?_, ?_, ?_, ?_⟩ <;> linarith

/-- Plus and cross are waves. -/
theorem plus_is_wave : IsWave (plus : Fin 4 → Fin 4 → K) := by
  refine ⟨?_, ?_⟩ <;> rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;> rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;>
    simp [plus, waveLaw, v, T, kUp, kDn, eta, Fin.sum_univ_four]
theorem cross_is_wave : IsWave (cross : Fin 4 → Fin 4 → K) := by
  refine ⟨?_, ?_⟩ <;> rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;> rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;>
    simp [cross, waveLaw, v, T, kUp, kDn, eta, Fin.sum_univ_four]

/-- THE SCALAR POLARISATION IS NOT A WAVE OF THE LAW. -/
theorem breathing_is_not_a_wave : ¬ IsWave (breathing : Fin 4 → Fin 4 → K) := by
  intro h
  have c := (wave_conditions breathing h).2.2.2
  simp [breathing] at c
  linarith

/-- EVERY WAVE IS PLUS AND CROSS, UP TO A CHANGE OF COORDINATES. -/
theorem two_polarisations (e : Fin 4 → Fin 4 → K) (h : IsWave e) :
    ∃ x : Fin 4 → K, ∀ m n, gauge e x m n = e 1 1 * plus m n + e 1 2 * cross m n := by
  obtain ⟨c1, c2, c3, c4⟩ := wave_conditions e h
  obtain ⟨hs, _⟩ := h
  refine ⟨![e 0 0 / 2, e 0 1, e 0 2, -(e 3 3) / 2], ?_⟩
  have s10 := hs 1 0; have s20 := hs 2 0; have s30 := hs 3 0; have s31 := hs 3 1; have s32 := hs 3 2
  have s21 := hs 2 1
  rw [forall4]
  refine ⟨?_, ?_, ?_, ?_⟩ <;> rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;> simp [gauge, plus, cross, kDn] <;>
    linarith

/-- AND THE TWO ARE NOT COORDINATES. No change of coordinates produces plus or cross, or any mixture of them, from
nothing. -/
theorem the_two_are_physical (a b : K) (x : Fin 4 → K)
    (h : ∀ m n, gauge (fun _ _ => (0 : K)) x m n = a * plus m n + b * cross m n) : a = 0 ∧ b = 0 := by
  have h11 := h 1 1; have h12 := h 1 2
  simp [gauge, plus, cross, kDn] at h11 h12
  exact ⟨by linarith, by linarith⟩

end SPHYS.Waves

#print axioms SPHYS.Waves.LinWave.gi_is_inverse
#print axioms SPHYS.Waves.LinWave.Gam_eq
#print axioms SPHYS.Waves.LinWave.linearised_ricci
#print axioms SPHYS.Waves.wave_conditions
#print axioms SPHYS.Waves.plus_is_wave
#print axioms SPHYS.Waves.cross_is_wave
#print axioms SPHYS.Waves.breathing_is_not_a_wave
#print axioms SPHYS.Waves.two_polarisations
#print axioms SPHYS.Waves.the_two_are_physical
