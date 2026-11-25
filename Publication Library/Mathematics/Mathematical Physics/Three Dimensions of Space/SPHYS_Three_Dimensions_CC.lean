/-
SPHYS_Three_Dimensions_CC.lean · five properties of the forced laws that depend on the dimension of space, on real algebra
RATIONALE. The engine of edition 1.0.0 proved its statements as arithmetic on formulas entered by hand. This file
  replaces it. The law of gravity is an equation between matrices of any size and its trace is taken; the field of a
  point is a radial field in an arena with derivatives; the orbit is a real function and its derivative; the
  statistics are maps from the permutations and from the integers. What is still entered is named as entered.
DESIGN. Parts, in order.
    Part I    Gravity in d dimensions of space. `trace_of_the_law`, `trace_reversed`, `dust_time`, `dust_space`,
              `no_dust_on_a_line`, `weight_exactly`, `space_over_time`, `bent_twice_exactly`.
    Part II   The field of a point. `radial_divergence`, `the_field_falls`, `only_one_power_is_free_of_sources`:
              the force falls as the power d - 1 of the distance.
    Part III  The orbit. `orbit_stiffness`: the derivative of the radial force at a circular orbit under a force
              of power p. `stable_exactly_below_three`.
    Part IV   Statistics. `two_statistics_and_no_third` for the permutations;
              `in_the_plane_every_phase_is_a_statistics` for the integers.
    Part V    Arithmetic on cited counts.
    Part VI   The five properties as conditions on d; `together_exactly_in_three`; `Premises`; `three_forced`;
              `threePremises`.
WHAT IS NOT PROVED HERE (read before citing).
    (a) That the component of the curvature along the time is the weight, and that the ratio of the components of
        space and time is the share of space in the bending of light. These are the weak-field readings, cited.
    (b) That a negative derivative of the radial force at a circular orbit means the orbit is kept. Cited.
    (c) That exchanges of identical particles form the permutations from three dimensions on and the braids in
        two. Topology, cited. The condition `TwoStatistics` is entered from it.
    (d) The count of the waves of gravity. Classical, entered.
    (e) That the relations of the radial theorems are met by the powers of the distance. Elementary analysis.
RISK. The dimension is a natural number cast into a field of characteristic zero. No magnitude is derived.
NON-NEGOTIABLE. No axiom is declared, no sorry. No headline theorem closes over a structure that carries its
  conclusion. The kernel line of every theorem the paper names is printed at the end.
-/
import Mathlib.Algebra.Algebra.Basic
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Algebra.CharZero.Defs
import Mathlib.GroupTheory.Perm.Sign
import Mathlib.Analysis.Calculus.Deriv.ZPow
import Mathlib.Analysis.Calculus.Deriv.Mul
import Mathlib.Analysis.Calculus.Deriv.Add
import Mathlib.Data.Real.Basic
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Abel
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.IntervalCases

namespace SPHYS.Dimension
open Finset

/-! ## Part I. Gravity in d dimensions of space -/

section Gravity
variable {K : Type*} [Field K] [CharZero K] (d : ℕ)

/-- The signs of d dimensions of space and one of time: plus for the time, minus for space. -/
def sg (i : Fin (d + 1)) : K := if i = 0 then 1 else -1
/-- The trace of a matrix with those signs. -/
def trg (M : Fin (d + 1) → Fin (d + 1) → K) : K := ∑ i, sg d i * M i i
/-- The law of gravity: the curvature less half its trace times the metric is κ times the source. -/
def Law (Ric T : Fin (d + 1) → Fin (d + 1) → K) (κ : K) : Prop :=
  ∀ i j, Ric i j - (1 / 2) * trg d Ric * (if i = j then sg d i else 0) = κ * T i j
/-- Matter at rest: a density along the time and nothing else. -/
def dust (ρ : K) : Fin (d + 1) → Fin (d + 1) → K := fun i j => if i = 0 ∧ j = 0 then ρ else 0

omit [CharZero K] in
theorem sg_sq (i : Fin (d + 1)) : (sg d i : K) * sg d i = 1 := by unfold sg; split_ifs <;> ring

/-- THE TRACE OF THE LAW. Twice κ times the trace of the source is one less d, times the trace of the curvature. -/
theorem trace_of_the_law (Ric T : Fin (d + 1) → Fin (d + 1) → K) (κ : K) (h : Law d Ric T κ) :
    2 * κ * trg d T = (1 - (d : K)) * trg d Ric := by
  have e : ∀ i, sg d i * (κ * T i i) = sg d i * Ric i i - 1 / 2 * trg d Ric * (sg d i * sg d i) := by
    intro i
    have := h i i
    rw [if_pos rfl] at this
    rw [← this]; ring
  have s : ∑ i, sg d i * (κ * T i i) = trg d Ric - 1 / 2 * trg d Ric * ((d : K) + 1) := by
    rw [Finset.sum_congr rfl fun i _ => e i, Finset.sum_sub_distrib, ← Finset.mul_sum]
    simp [sg_sq, trg]
  have t : ∑ i, sg d i * (κ * T i i) = κ * trg d T := by
    unfold trg; rw [Finset.mul_sum]; exact Finset.sum_congr rfl fun i _ => by ring
  rw [t] at s
  linear_combination 2 * s

/-- THE LAW WITH THE TRACE REVERSED. -/
theorem trace_reversed (Ric T : Fin (d + 1) → Fin (d + 1) → K) (κ : K) (h : Law d Ric T κ) (i j : Fin (d + 1)) :
    ((d : K) - 1) * Ric i j = κ * (((d : K) - 1) * T i j - trg d T * (if i = j then sg d i else 0)) := by
  have ht := trace_of_the_law d Ric T κ h
  have hij := h i j
  generalize (if i = j then sg d i else (0 : K)) = e at hij ⊢
  linear_combination ((d : K) - 1) * hij + (e / 2) * ht

omit [CharZero K] in
theorem trg_dust (ρ : K) : trg d (dust d ρ) = ρ := by
  unfold trg
  have : ∀ i : Fin (d + 1), sg d i * dust d ρ i i = if i = 0 then ρ else 0 := by
    intro i; by_cases hi : i = 0 <;> simp [sg, dust, hi]
  rw [Finset.sum_congr rfl fun i _ => this i, Finset.sum_ite_eq' Finset.univ (0 : Fin (d + 1))]
  simp

/-- MATTER AT REST, ALONG THE TIME. One less d, times the curvature along the time, is two less d, times κρ. -/
theorem dust_time (Ric : Fin (d + 1) → Fin (d + 1) → K) (κ ρ : K) (h : Law d Ric (dust d ρ) κ) :
    ((d : K) - 1) * Ric 0 0 = ((d : K) - 2) * (κ * ρ) := by
  have k := trace_reversed d Ric (dust d ρ) κ h 0 0
  rw [trg_dust, if_pos rfl] at k
  simp only [dust, sg, and_self, if_true] at k
  linear_combination k

/-- MATTER AT REST, ALONG SPACE. One less d, times the curvature along a direction of space, is κρ. -/
theorem dust_space (Ric : Fin (d + 1) → Fin (d + 1) → K) (κ ρ : K) (h : Law d Ric (dust d ρ) κ)
    (i : Fin (d + 1)) (hi : i ≠ 0) : ((d : K) - 1) * Ric i i = κ * ρ := by
  have k := trace_reversed d Ric (dust d ρ) κ h i i
  rw [trg_dust, if_pos rfl] at k
  simp only [dust, sg, hi, false_and, if_false] at k
  linear_combination k

/-- NO MATTER AT REST ON A LINE. With one dimension of space the law leaves no source: κρ is zero. -/
theorem no_dust_on_a_line (Ric : Fin 2 → Fin 2 → K) (κ ρ : K) (h : Law 1 Ric (dust 1 ρ) κ) : κ * ρ = 0 := by
  have k := dust_space 1 Ric κ ρ h 1 (by decide)
  rw [← k]; norm_num

/-- WEIGHT EXACTLY OFF TWO. With d not one and κρ not zero, the curvature along the time is not zero exactly when
d is not two. -/
theorem weight_exactly (hd : d ≠ 1) (Ric : Fin (d + 1) → Fin (d + 1) → K) (κ ρ : K) (hk : κ * ρ ≠ 0)
    (h : Law d Ric (dust d ρ) κ) : Ric 0 0 ≠ 0 ↔ d ≠ 2 := by
  have k := dust_time d Ric κ ρ h
  have h1 : (d : K) - 1 ≠ 0 := by
    intro e; apply hd; have : (d : K) = 1 := by linear_combination e
    exact_mod_cast this
  constructor
  · intro hr hd2
    apply hr
    have : (d : K) - 2 = 0 := by rw [hd2]; norm_num
    rw [this, zero_mul] at k
    exact (mul_eq_zero.mp k).resolve_left h1
  · intro hd2 hr
    rw [hr, mul_zero] at k
    have h2 : (d : K) - 2 ≠ 0 := by
      intro e; apply hd2; have : (d : K) = 2 := by linear_combination e
      exact_mod_cast this
    exact (mul_ne_zero h2 hk) k.symm

/-- SPACE OVER TIME. With d not one, two less d, times the curvature along a direction of space, is the curvature
along the time. -/
theorem space_over_time (hd : d ≠ 1) (Ric : Fin (d + 1) → Fin (d + 1) → K) (κ ρ : K)
    (h : Law d Ric (dust d ρ) κ) (i : Fin (d + 1)) (hi : i ≠ 0) : ((d : K) - 2) * Ric i i = Ric 0 0 := by
  have h1 : (d : K) - 1 ≠ 0 := by
    intro e; apply hd; have : (d : K) = 1 := by linear_combination e
    exact_mod_cast this
  apply mul_left_cancel₀ h1
  linear_combination ((d : K) - 2) * dust_space d Ric κ ρ h i hi - dust_time d Ric κ ρ h

/-- SPACE EQUALS TIME EXACTLY IN THREE. With d not one and κρ not zero, the curvature along a direction of space
equals the curvature along the time exactly when d is three. -/
theorem bent_twice_exactly (hd : d ≠ 1) (Ric : Fin (d + 1) → Fin (d + 1) → K) (κ ρ : K) (hk : κ * ρ ≠ 0)
    (h : Law d Ric (dust d ρ) κ) (i : Fin (d + 1)) (hi : i ≠ 0) : Ric i i = Ric 0 0 ↔ d = 3 := by
  have h1 : (d : K) - 1 ≠ 0 := by
    intro e; apply hd; have : (d : K) = 1 := by linear_combination e
    exact_mod_cast this
  have ks := dust_space d Ric κ ρ h i hi
  have kt := dust_time d Ric κ ρ h
  constructor
  · intro e
    rw [e, kt] at ks
    have : ((d : K) - 3) * (κ * ρ) = 0 := by linear_combination ks
    have : (d : K) = 3 := by linear_combination (mul_eq_zero.mp this).resolve_right hk
    exact_mod_cast this
  · intro e
    apply mul_left_cancel₀ h1
    rw [ks, kt, e]; push_cast; ring

end Gravity

/-! ## Part II. The field of a point -/

/-- An arena: a commutative ring of fields over a ring of constants, with one linear map for each direction. The
maps commute and obey the rule of the product. They are the partial derivatives. -/
structure Arena (K : Type*) [CommRing K] (ι : Type*) (R : Type*) [CommRing R] [Algebra K R] where
  d : ι → R →ₗ[K] R
  comm : ∀ μ ν x, d μ (d ν x) = d ν (d μ x)
  leibniz : ∀ μ x y, d μ (x * y) = d μ x * y + x * d μ y


section Radial
variable {K : Type*} [CommRing K] {σ : Type*} [Fintype σ] [DecidableEq σ] {R : Type*} [CommRing R] [Algebra K R]
variable (S : Arena K σ R) (x : σ → R) (w c : R)

/-- THE DIVERGENCE OF A RADIAL FIELD. Let x be coordinates, u the sum of their squares, and w a field with
(∂ᵢ w) u = c xᵢ w: a power c of the distance. The divergence of the field x w, times u, is the number of
directions plus c, times w u. -/
theorem radial_divergence (hx : ∀ i j, S.d i (x j) = if i = j then 1 else 0)
    (hw : ∀ i, S.d i w * (∑ j, x j * x j) = c * (x i * w)) :
    (∑ i, S.d i (x i * w)) * (∑ j, x j * x j) = ((Fintype.card σ : R) + c) * (w * ∑ j, x j * x j) := by
  have e : ∀ i, S.d i (x i * w) * (∑ j, x j * x j) = w * (∑ j, x j * x j) + c * (x i * x i * w) := by
    intro i
    rw [S.leibniz, hx, if_pos rfl]
    linear_combination x i * hw i
  rw [Finset.sum_mul, Finset.sum_congr rfl fun i _ => e i, Finset.sum_add_distrib, Finset.sum_const,
    Finset.card_univ, nsmul_eq_mul, ← Finset.mul_sum, ← Finset.sum_mul]
  ring

/-- THE FIELD FALLS AS A POWER. The square of the size of the field x w is u w w, and it is a power 2 + 2c of the
distance: (∂ᵢ (u w w)) u = (2 + 2c) xᵢ (u w w). -/
theorem the_field_falls (hx : ∀ i j, S.d i (x j) = if i = j then 1 else 0)
    (hw : ∀ i, S.d i w * (∑ j, x j * x j) = c * (x i * w)) (i : σ) :
    S.d i ((∑ j, x j * x j) * w * w) * (∑ j, x j * x j) = (2 + 2 * c) * (x i * ((∑ j, x j * x j) * w * w)) := by
  have hu : S.d i (∑ j, x j * x j) = 2 * x i := by
    rw [map_sum]
    have : ∀ j, S.d i (x j * x j) = if i = j then 2 * x i else 0 := by
      intro j
      rw [S.leibniz, hx]
      by_cases hij : i = j
      · rw [if_pos hij, if_pos hij, hij]; ring
      · rw [if_neg hij, if_neg hij]; ring
    rw [Finset.sum_congr rfl fun j _ => this j, Finset.sum_ite_eq, if_pos (Finset.mem_univ i)]
  rw [S.leibniz, S.leibniz, hu]
  linear_combination (2 * (∑ j, x j * x j) * w) * hw i

/-- ONLY ONE POWER IS FREE OF SOURCES. In a ring without divisors of zero, if the radial field x w has no
divergence and w u is not zero, then c is minus the number of directions. -/
theorem only_one_power_is_free_of_sources [IsDomain R] (hx : ∀ i j, S.d i (x j) = if i = j then 1 else 0)
    (hw : ∀ i, S.d i w * (∑ j, x j * x j) = c * (x i * w)) (hne : w * (∑ j, x j * x j) ≠ 0)
    (h0 : ∑ i, S.d i (x i * w) = 0) : c = -(Fintype.card σ : R) := by
  have h := radial_divergence S x w c hx hw
  rw [h0, zero_mul] at h
  have := (mul_eq_zero.mp h.symm).resolve_right hne
  linear_combination this

end Radial

/-! ## Part III. The orbit -/

/-- THE STIFFNESS OF A CIRCULAR ORBIT. A body moves in a plane under a force that falls as the power p of the
distance, with strength k and with L2 the square of its angular momentum; its radial force is
L2 r^(-3) - k r^(-p). At a circular orbit of radius r₀, where that force is zero, its derivative is
(p - 3) k r₀^(-p-1). -/
theorem orbit_stiffness (p : ℕ) (k L2 r0 : ℝ) (hr : 0 < r0)
    (hc : L2 * r0 ^ (-3 : ℤ) = k * r0 ^ (-(p : ℤ))) :
    HasDerivAt (fun r : ℝ => L2 * r ^ (-3 : ℤ) - k * r ^ (-(p : ℤ)))
      (((p : ℝ) - 3) * k * r0 ^ (-(p : ℤ) - 1)) r0 := by
  have h1 := (hasDerivAt_zpow (-3) r0 (Or.inl hr.ne')).const_mul L2
  have h2 := (hasDerivAt_zpow (-(p : ℤ)) r0 (Or.inl hr.ne')).const_mul k
  have h := h1.sub h2
  convert h using 1
  have e1 : r0 ^ ((-3 : ℤ) - 1) = r0 ^ (-3 : ℤ) * r0 ^ (-1 : ℤ) := by rw [← zpow_add₀ hr.ne']; norm_num
  have e2 : r0 ^ (-(p : ℤ) - 1) = r0 ^ (-(p : ℤ)) * r0 ^ (-1 : ℤ) := by rw [← zpow_add₀ hr.ne']; ring_nf
  rw [e1, e2]; push_cast
  linear_combination (3 * r0 ^ (-1 : ℤ)) * hc

/-- THE ORBIT IS KEPT EXACTLY BELOW THE POWER THREE. With k and r₀ positive, the stiffness is negative exactly
when p is less than three, and positive exactly when p is more. -/
theorem stable_exactly_below_three (p : ℕ) (k r0 : ℝ) (hk : 0 < k) (hr : 0 < r0) :
    (((p : ℝ) - 3) * k * r0 ^ (-(p : ℤ) - 1) < 0 ↔ p < 3) ∧ (0 < ((p : ℝ) - 3) * k * r0 ^ (-(p : ℤ) - 1) ↔ 3 < p) := by
  have hz : 0 < k * r0 ^ (-(p : ℤ) - 1) := mul_pos hk (zpow_pos hr _)
  have e : ((p : ℝ) - 3) * k * r0 ^ (-(p : ℤ) - 1) = ((p : ℝ) - 3) * (k * r0 ^ (-(p : ℤ) - 1)) := by ring
  rw [e]
  constructor
  · rw [mul_neg_iff]
    constructor
    · rintro (⟨_, h⟩ | ⟨h, _⟩)
      · exact absurd h (not_lt.mpr hz.le)
      · have : (p : ℝ) < 3 := by linarith
        exact_mod_cast this
    · intro h
      right
      have : (p : ℝ) < 3 := by exact_mod_cast h
      exact ⟨by linarith, hz⟩
  · rw [mul_pos_iff]
    constructor
    · rintro (⟨h, _⟩ | ⟨_, h⟩)
      · have : (3 : ℝ) < p := by linarith
        exact_mod_cast this
      · exact absurd h (not_lt.mpr hz.le)
    · intro h
      left
      have : (3 : ℝ) < p := by exact_mod_cast h
      exact ⟨by linarith, hz⟩

/-! ## Part IV. Statistics -/

/-- A SIGN WHOSE SQUARE IS ONE IS PLUS OR MINUS ONE. -/
theorem a_sign_is_plus_or_minus_one {F : Type*} [CommRing F] [IsDomain F] (c : F) (h : c * c = 1) :
    c = 1 ∨ c = -1 := by
  have e : (c - 1) * (c + 1) = 0 := by linear_combination h
  rcases mul_eq_zero.mp e with h0 | h0
  · exact Or.inl (sub_eq_zero.mp h0)
  · exact Or.inr (eq_neg_of_add_eq_zero_left h0)

open Equiv in
/-- TWO STATISTICS AND NO THIRD. Let the permutations of finitely many things act on amplitudes by a number: a
map f from permutations to a commutative domain that sends products to products and the identity to one. Then
either f is one on every permutation, or f is the sign of the permutation. -/
theorem two_statistics_and_no_third {α : Type*} [Fintype α] [DecidableEq α] {F : Type*} [CommRing F] [IsDomain F]
    (f : Perm α →* F) : (∀ σ, f σ = 1) ∨ (∀ σ, f σ = ((Perm.sign σ : ℤˣ) : ℤ)) := by
  by_cases hex : ∃ a b : α, a ≠ b
  · obtain ⟨a, b, hab⟩ := hex
    have hc : f (swap a b) * f (swap a b) = 1 := by rw [← map_mul, swap_mul_self, map_one]
    have all : ∀ x y : α, x ≠ y → f (swap x y) = f (swap a b) := by
      intro x y hxy
      obtain ⟨u, hu⟩ := isConj_iff.mp (Perm.isConj_swap hxy hab)
      have e : f u * f (swap x y) * f u⁻¹ = f (swap a b) := by rw [← map_mul, ← map_mul, hu]
      have ui : f u * f u⁻¹ = 1 := by rw [← map_mul, mul_inv_cancel, map_one]
      calc f (swap x y) = f (swap x y) * (f u * f u⁻¹) := by rw [ui, mul_one]
        _ = f u * f (swap x y) * f u⁻¹ := by ring
        _ = f (swap a b) := e
    rcases a_sign_is_plus_or_minus_one _ hc with h1 | h1
    · left
      intro σ
      induction σ using Perm.swap_induction_on with
      | one => exact map_one f
      | swap_mul τ x y hxy ih => rw [map_mul, all x y hxy, h1, ih, mul_one]
    · right
      intro σ
      induction σ using Perm.swap_induction_on with
      | one => simp
      | swap_mul τ x y hxy ih =>
        rw [map_mul, all x y hxy, h1, ih, Perm.sign_mul, Perm.sign_swap hxy]
        simp
  · left
    intro σ
    have hs : σ = 1 := by
      ext x
      by_contra hne
      exact hex ⟨σ x, x, hne⟩
    rw [hs, map_one]

/-- IN THE PLANE EVERY PHASE IS A STATISTICS. The exchanges of two particles in a plane are counted by the
integers. For every number u that has an inverse there is a map from the integers, written as a group under
multiplication, that sends products to products and sends one exchange to u. -/
theorem in_the_plane_every_phase_is_a_statistics {F : Type*} [CommRing F] (u : Fˣ) :
    ∃ f : Multiplicative ℤ →* Fˣ, f (Multiplicative.ofAdd 1) = u :=
  ⟨{ toFun := fun n => u ^ (Multiplicative.toAdd n)
     map_one' := by simp
     map_mul' := fun a b => by simp [zpow_add] }, by simp⟩

/-! ## Part V. Arithmetic on cited counts -/

/-- Gravity in d dimensions of space has (d + 1)(d - 2)/2 waves. There is at least one exactly from three
dimensions on. The count is classical; this is arithmetic on it. -/
theorem gravity_has_waves_exactly_from_three (d : ℕ) : 2 ≤ (d + 1) * (d - 2) ↔ 3 ≤ d := by
  constructor
  · intro h
    by_contra hc
    have : d < 3 := by omega
    interval_cases d <;> simp at h
  · intro h
    have h1 : 1 ≤ d - 2 := by omega
    calc 2 ≤ (d + 1) * 1 := by omega
      _ ≤ (d + 1) * (d - 2) := Nat.mul_le_mul_left _ h1

/-- In n dimensions of spacetime the field of light has n - 1 electric components and (n - 1)(n - 2)/2 magnetic
ones; they are equal in number exactly when n is four. The counts are classical; this is arithmetic on them. -/
theorem electric_and_magnetic_are_equal_in_number_exactly_in_four (n : ℤ) (hn : 2 ≤ n) :
    2 * (n - 1) = (n - 1) * (n - 2) ↔ n = 4 := by
  constructor
  · intro h
    have : (n - 1) * (n - 4) = 0 := by linear_combination -h
    rcases mul_eq_zero.mp this with h1 | h1 <;> omega
  · rintro rfl; norm_num

/-- Light has n - 2 waves and gravity n(n - 3)/2; they are equal in number exactly when n is four. -/
theorem light_and_gravity_have_equal_waves_exactly_in_four (n : ℤ) (hn : 2 ≤ n) :
    2 * (n - 2) = n * (n - 3) ↔ n = 4 := by
  constructor
  · intro h
    have : (n - 1) * (n - 4) = 0 := by linear_combination -h
    rcases mul_eq_zero.mp this with h1 | h1 <;> omega
  · rintro rfl; norm_num

/-- The coupling of a gauge field in n dimensions of spacetime has the dimension of a length to the power
(n - 4)/2; it is a pure number exactly when n is four. The formula is classical; this is arithmetic on it. -/
theorem the_coupling_is_a_pure_number_exactly_in_four (n : ℤ) : n - 4 = 0 ↔ n = 4 := by omega

/-! ## Part VI. Together -/

/-- Matter at rest has weight: the condition of `weight_exactly` and `no_dust_on_a_line`. -/
def Weighs (d : ℕ) : Prop := d ≠ 1 ∧ d ≠ 2
/-- Gravity has waves: the condition of `gravity_has_waves_exactly_from_three`, on a cited count. -/
def Waves (d : ℕ) : Prop := 2 ≤ (d + 1) * (d - 2)
/-- Space and time curve alike: the condition of `bent_twice_exactly`, that two less d is one. -/
def BentTwice (d : ℕ) : Prop := (d : ℤ) - 2 = 1
/-- A planet keeps its orbit: an orbit needs a plane, and the power d - 1 of the force is below three, the
condition of `stable_exactly_below_three`. -/
def Stable (d : ℕ) : Prop := 2 ≤ d ∧ d - 1 < 3
/-- Identical particles have two statistics and no third: entered from the topology of exchanges, which are
permutations from three dimensions on. -/
def TwoStatistics (d : ℕ) : Prop := 3 ≤ d

/-- TOGETHER, EXACTLY IN THREE. For a space of at least one dimension the five conditions hold together exactly
when d is three. -/
theorem together_exactly_in_three (d : ℕ) (hd : 1 ≤ d) :
    (Weighs d ∧ Waves d ∧ BentTwice d ∧ Stable d ∧ TwoStatistics d) ↔ d = 3 := by
  unfold Weighs Waves BentTwice Stable TwoStatistics
  constructor
  · rintro ⟨_, _, h, _, _⟩; omega
  · rintro rfl; refine ⟨⟨by omega, by omega⟩, by norm_num, by norm_num, ⟨by omega, by omega⟩, le_refl _⟩

/-- Each of the three conditions that open at three, with the one that closes above it, gives three. -/
theorem weight_and_orbits_give_three (d : ℕ) (h : Weighs d ∧ Stable d) : d = 3 := by
  unfold Weighs Stable at h; omega
theorem waves_and_orbits_give_three (d : ℕ) (h : Waves d ∧ Stable d) : d = 3 := by
  obtain ⟨hw, hs⟩ := h
  have := (gravity_has_waves_exactly_from_three d).mp hw
  unfold Stable at hs; omega
theorem statistics_and_orbits_give_three (d : ℕ) (h : TwoStatistics d ∧ Stable d) : d = 3 := by
  unfold TwoStatistics Stable at h; omega
theorem bending_alone_gives_three (d : ℕ) (h : BentTwice d) : d = 3 := by unfold BentTwice at h; omega

/-- The premises. Space has d dimensions, at least one. Matter at rest has weight: there is a curvature that
solves the law of gravity for matter at rest with κρ not zero, and its component along the time is not zero. A
planet keeps its orbit: space has a plane, and under a force that falls as the power d - 1 the stiffness of a
circular orbit is negative. Nothing else is assumed. -/
structure Premises where
  d : ℕ
  space : 1 ≤ d
  weight : ∃ (Ric : Fin (d + 1) → Fin (d + 1) → ℚ) (κ ρ : ℚ), κ * ρ ≠ 0 ∧ Law d Ric (dust d ρ) κ ∧ Ric 0 0 ≠ 0
  orbit : 2 ≤ d ∧ ∃ k r0 : ℝ, 0 < k ∧ 0 < r0 ∧
    (((d - 1 : ℕ) : ℝ) - 3) * k * r0 ^ (-(((d - 1 : ℕ) : ℤ)) - 1) < 0

/-- THREE, FORCED. On the premises the dimension of space is three. -/
theorem three_forced (P : Premises) : P.d = 3 := by
  obtain ⟨Ric, κ, ρ, hk, hl, hr⟩ := P.weight
  obtain ⟨h2, k, r0, hk0, hr0, hs⟩ := P.orbit
  have hd1 : P.d ≠ 1 := by omega
  have hd2 : P.d ≠ 2 := (weight_exactly P.d hd1 Ric κ ρ hk hl).mp hr
  have hp : P.d - 1 < 3 := ((stable_exactly_below_three (P.d - 1) k r0 hk0 hr0).1).mp hs
  omega

/-- THE PREMISES ARE INHABITED. Three dimensions of space, with the curvature of matter at rest written out. -/
noncomputable def threePremises : Premises where
  d := 3
  space := by norm_num
  weight := ⟨fun i j => if i = j then 1 else 0, 2, 1, by norm_num, by
    intro i j
    fin_cases i <;> fin_cases j <;> simp [trg, sg, dust, Fin.sum_univ_four] <;> norm_num, by simp⟩
  orbit := ⟨by norm_num, 1, 1, by norm_num, by norm_num, by norm_num⟩

end SPHYS.Dimension

#print axioms SPHYS.Dimension.sg_sq
#print axioms SPHYS.Dimension.trace_of_the_law
#print axioms SPHYS.Dimension.trace_reversed
#print axioms SPHYS.Dimension.trg_dust
#print axioms SPHYS.Dimension.dust_time
#print axioms SPHYS.Dimension.dust_space
#print axioms SPHYS.Dimension.no_dust_on_a_line
#print axioms SPHYS.Dimension.weight_exactly
#print axioms SPHYS.Dimension.space_over_time
#print axioms SPHYS.Dimension.bent_twice_exactly
#print axioms SPHYS.Dimension.radial_divergence
#print axioms SPHYS.Dimension.the_field_falls
#print axioms SPHYS.Dimension.only_one_power_is_free_of_sources
#print axioms SPHYS.Dimension.orbit_stiffness
#print axioms SPHYS.Dimension.stable_exactly_below_three
#print axioms SPHYS.Dimension.a_sign_is_plus_or_minus_one
#print axioms SPHYS.Dimension.two_statistics_and_no_third
#print axioms SPHYS.Dimension.in_the_plane_every_phase_is_a_statistics
#print axioms SPHYS.Dimension.gravity_has_waves_exactly_from_three
#print axioms SPHYS.Dimension.electric_and_magnetic_are_equal_in_number_exactly_in_four
#print axioms SPHYS.Dimension.light_and_gravity_have_equal_waves_exactly_in_four
#print axioms SPHYS.Dimension.the_coupling_is_a_pure_number_exactly_in_four
#print axioms SPHYS.Dimension.together_exactly_in_three
#print axioms SPHYS.Dimension.weight_and_orbits_give_three
#print axioms SPHYS.Dimension.waves_and_orbits_give_three
#print axioms SPHYS.Dimension.statistics_and_orbits_give_three
#print axioms SPHYS.Dimension.bending_alone_gives_three
#print axioms SPHYS.Dimension.three_forced
#print axioms SPHYS.Dimension.threePremises
