/-
SPHYS_Maxwell_Forced_CC.lean · Maxwell's equations forced by the conservation of charge, on real algebra
RATIONALE. The engine of edition 1.0.0 proved its statements over small structures of integers. This file replaces
  it. An arena is a commutative ring with linear maps that commute and obey the rule of the product: the partial
  derivatives. A potential is a family of elements of the ring, the law is the general linear law of second order
  built from it, and a wave is a polarization on a profile. Nothing else is assumed.
DESIGN. Parts, in order.
    Part I    The field. `F_antisymm`, `homogeneous`, `gauge_keeps_the_field`, `source_eq`: the second pair of
              Maxwell's equations and the invariance of the field are identities.
    Part II   The law. `divergence_of_the_law`: the divergence of the general law is (a + b) times the wave
              operator on the divergence of the potential, plus m times that divergence. `the_law_under_a_gauge_turn`.
    Part III  The forcing. `timeArena`, `probe`: an arena of four directions and a potential on it.
              `conservation_in_four_dimensions_forces_the_law`: b = -a and m = 0.
    Part IV   Waves. `plane_wave`, `off_the_cone_is_pure_gauge`, `on_the_cone_the_wave_is_transverse`,
              `every_wave_is_a_transverse_one`, `the_count_of_waves`: in n directions the waves are n - 2.
    Part V    The static half. `static_law`, `radial_divergence`, `the_field_falls`,
              `only_one_power_is_free_of_sources`, `inverse_square_in_three`.
    Part VI   `Premises`; `maxwell_forced`; `the_forced_law_is_maxwell`; `gauge_forced`; `maxwellPremises`.
    Part VII  Arithmetic on cited counts: what singles out four dimensions.
WHAT IS NOT PROVED HERE (read before citing).
    (a) That charge is conserved whatever the field does. It is the field `conserved` of `Premises`.
    (b) That the hypotheses of the radial theorems of Part V are met by functions on space less a point. They are
        the powers of the distance; that step is elementary analysis and is not formalised.
    (c) The counts of Part VII are the classical counts of components; the theorems are arithmetic on them.
RISK. The arena of Part III has fields that depend on time alone; it is one arena among those the premise
  quantifies over. No magnitude is derived.
NON-NEGOTIABLE. No axiom is declared, no sorry. No headline theorem closes over a structure that carries its
  conclusion. The kernel line of every theorem the paper names is printed at the end.
-/
import Mathlib.Algebra.Algebra.Basic
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Algebra.Polynomial.AlgebraMap
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Data.Fintype.BigOperators
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.Data.Matrix.Notation
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Abel
import Mathlib.Tactic.Module
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith

namespace SPHYS.Light
open Finset Polynomial

/-- An arena: a commutative ring of fields over a ring of constants, with one linear map for each direction. The
maps commute and obey the rule of the product. They are the partial derivatives. -/
structure Arena (K : Type*) [CommRing K] (ι : Type*) (R : Type*) [CommRing R] [Algebra K R] where
  d : ι → R →ₗ[K] R
  comm : ∀ μ ν x, d μ (d ν x) = d ν (d μ x)
  leibniz : ∀ μ x y, d μ (x * y) = d μ x * y + x * d μ y

/-! ## Part I. The field -/

section Field
variable {K : Type*} [CommRing K] {ι : Type*} [Fintype ι] {R : Type*} [CommRing R] [Algebra K R]
variable (S : Arena K ι R) (η : ι → K)

/-- The field of a potential. -/
def F (A : ι → R) (μ ν : ι) : R := S.d μ (A ν) - S.d ν (A μ)
/-- The wave operator, with signs η. -/
def box (x : R) : R := ∑ μ, η μ • S.d μ (S.d μ x)
/-- The divergence of a potential, with signs η. -/
def div (A : ι → R) : R := ∑ μ, η μ • S.d μ (A μ)
/-- The divergence of the field: the left side of Maxwell's equations with sources. -/
def source (A : ι → R) (ν : ι) : R := ∑ μ, η μ • S.d μ (F S A μ ν)
/-- The general linear law of second order built from a potential, with three constants. -/
def law (a b m : K) (A : ι → R) (ν : ι) : R := a • box S η (A ν) + b • S.d ν (div S η A) + m • A ν

omit [Fintype ι] in
theorem F_antisymm (A : ι → R) (μ ν : ι) : F S A μ ν = -F S A ν μ := by unfold F; abel

omit [Fintype ι] in
/-- THE EQUATIONS WITHOUT SOURCES. They hold for every potential. -/
theorem homogeneous (A : ι → R) (l μ ν : ι) : S.d l (F S A μ ν) + S.d μ (F S A ν l) + S.d ν (F S A l μ) = 0 := by
  unfold F
  simp only [map_sub]
  rw [S.comm l μ (A ν), S.comm l ν (A μ), S.comm μ ν (A l)]
  abel

omit [Fintype ι] in
/-- A GAUGE TURN KEEPS THE FIELD. -/
theorem gauge_keeps_the_field (A : ι → R) (χ : R) (μ ν : ι) :
    F S (fun ν => A ν + S.d ν χ) μ ν = F S A μ ν := by
  unfold F
  simp only [map_add]
  rw [S.comm μ ν χ]
  abel

theorem box_d (ν : ι) (x : R) : box S η (S.d ν x) = S.d ν (box S η x) := by
  unfold box
  rw [map_sum]
  refine Finset.sum_congr rfl fun μ _ => ?_
  rw [map_smul, S.comm μ ν x, S.comm μ ν (S.d μ x)]

theorem box_add (x y : R) : box S η (x + y) = box S η x + box S η y := by
  unfold box; simp only [map_add, smul_add, Finset.sum_add_distrib]

theorem box_smul (c : K) (x : R) : box S η (c • x) = c • box S η x := by
  unfold box; simp only [map_smul, Finset.smul_sum]
  refine Finset.sum_congr rfl fun μ _ => ?_
  rw [smul_comm]

/-- THE DIVERGENCE OF THE FIELD. It is the wave operator on the potential less the gradient of its divergence. -/
theorem source_eq (A : ι → R) (ν : ι) : source S η A ν = box S η (A ν) - S.d ν (div S η A) := by
  unfold source F box div
  simp only [map_sub, smul_sub, Finset.sum_sub_distrib]
  congr 1
  rw [map_sum]
  refine Finset.sum_congr rfl fun μ _ => ?_
  rw [map_smul, S.comm μ ν (A μ)]

theorem law_one (A : ι → R) (ν : ι) : law S η 1 (-1) 0 A ν = source S η A ν := by
  rw [source_eq]; unfold law; rw [one_smul, neg_smul, one_smul, zero_smul, add_zero, sub_eq_add_neg]

/-- The law with constants a, -a and 0 is a times the divergence of the field, in every arena. -/
theorem forced_law_is_a_source (a : K) (A : ι → R) (ν : ι) : law S η a (-a) 0 A ν = a • source S η A ν := by
  rw [source_eq]; unfold law; module

/-! ## Part II. The law -/

/-- THE DIVERGENCE OF THE LAW. For every potential it is (a + b) times the wave operator on the divergence of the
potential, plus m times that divergence. -/
theorem divergence_of_the_law (a b m : K) (A : ι → R) :
    ∑ ν, η ν • S.d ν (law S η a b m A ν) = (a + b) • box S η (div S η A) + m • div S η A := by
  have h1 : ∑ ν, η ν • S.d ν (box S η (A ν)) = box S η (div S η A) := by
    have e : box S η (div S η A) = ∑ ν, η ν • box S η (S.d ν (A ν)) := by
      unfold div
      have hs : ∀ (s : Finset ι), box S η (∑ ν ∈ s, η ν • S.d ν (A ν)) = ∑ ν ∈ s, η ν • box S η (S.d ν (A ν)) := by
        intro s
        classical
        induction s using Finset.induction_on with
        | empty => simp [box]
        | insert _ _ hx ih => rw [Finset.sum_insert hx, Finset.sum_insert hx, box_add, box_smul, ih]
      exact hs _
    rw [e]
    refine Finset.sum_congr rfl fun ν _ => ?_
    rw [box_d]
  have h2 : ∑ ν, η ν • S.d ν (S.d ν (div S η A)) = box S η (div S η A) := rfl
  have h3 : ∑ ν, η ν • S.d ν (A ν) = div S η A := rfl
  unfold law
  simp only [map_add, map_smul, smul_add, Finset.sum_add_distrib]
  have c1 : ∑ ν, η ν • a • S.d ν (box S η (A ν)) = a • box S η (div S η A) := by
    rw [← h1, Finset.smul_sum]; exact Finset.sum_congr rfl fun ν _ => smul_comm _ _ _
  have c2 : ∑ ν, η ν • b • S.d ν (S.d ν (div S η A)) = b • box S η (div S η A) := by
    rw [← h2, Finset.smul_sum]; exact Finset.sum_congr rfl fun ν _ => smul_comm _ _ _
  have c3 : ∑ ν, η ν • m • S.d ν (A ν) = m • div S η A := by
    rw [← h3, Finset.smul_sum]; exact Finset.sum_congr rfl fun ν _ => smul_comm _ _ _
  rw [c1, c2, c3, add_smul]

/-- THE IDENTITY OF CONSERVATION. With b = -a and m = 0 the divergence of the law is zero for every potential. -/
theorem conservation_identity (a : K) (A : ι → R) : ∑ ν, η ν • S.d ν (law S η a (-a) 0 A ν) = 0 := by
  rw [divergence_of_the_law, add_neg_cancel, zero_smul, zero_smul, add_zero]

/-- The divergence of the divergence of the field is zero. -/
theorem the_source_is_conserved (A : ι → R) : ∑ ν, η ν • S.d ν (source S η A ν) = 0 := by
  have h := conservation_identity S η (1 : K) A
  simpa only [law_one] using h

/-- THE LAW UNDER A GAUGE TURN. It changes by (a + b) times the gradient of the wave operator on the turn, plus m
times the gradient of the turn. -/
theorem the_law_under_a_gauge_turn (a b m : K) (A : ι → R) (χ : R) (ν : ι) :
    law S η a b m (fun ν => A ν + S.d ν χ) ν = law S η a b m A ν + ((a + b) • S.d ν (box S η χ) + m • S.d ν χ) := by
  have hd : div S η (fun ν => A ν + S.d ν χ) = div S η A + box S η χ := by
    unfold div box; simp only [map_add, smul_add, Finset.sum_add_distrib]
  unfold law
  rw [hd, box_add, box_d, map_add]
  module

/-- GAUGE INVARIANCE IS A CONSEQUENCE. With b = -a and m = 0 the law is the same after every gauge turn. -/
theorem gauge_invariance_is_a_consequence (a : K) (A : ι → R) (χ : R) (ν : ι) :
    law S η a (-a) 0 (fun ν => A ν + S.d ν χ) ν = law S η a (-a) 0 A ν := by
  rw [the_law_under_a_gauge_turn, add_neg_cancel, zero_smul, zero_smul, add_zero, add_zero]

end Field

/-! ## Part III. The forcing -/

/-- The signs of four dimensions with one time. -/
def eta4 : Fin 4 → ℚ := ![1, -1, -1, -1]

/-- AN ARENA OF FOUR DIRECTIONS. Its fields are the polynomials in the time; the first direction differentiates
them and the other three give zero. -/
noncomputable def timeArena : Arena ℚ (Fin 4) ℚ[X] where
  d := fun μ => if μ = 0 then Polynomial.derivative else 0
  comm := by
    intro μ ν x
    by_cases hμ : μ = 0 <;> by_cases hν : ν = 0 <;> simp [hμ, hν]
  leibniz := by
    intro μ x y
    by_cases hμ : μ = 0
    · simp [hμ, Polynomial.derivative_mul]
    · simp [hμ]

/-- A potential on that arena: the cube of the time along the time, zero along space. -/
noncomputable def probe : Fin 4 → ℚ[X] := fun μ => if μ = 0 then X ^ 3 else 0

theorem probe_divergence : div timeArena eta4 probe = C 3 * X ^ 2 := by
  simp [div, timeArena, probe, eta4, Fin.sum_univ_four, Polynomial.derivative_X_pow]
  rw [← C_1, ← C_add]; norm_num

theorem probe_wave : box timeArena eta4 (C 3 * X ^ 2 : ℚ[X]) = C 6 := by
  simp [box, timeArena, eta4, Fin.sum_univ_four, Polynomial.derivative_X_pow]
  rw [← C_1, ← C_add, ← C_mul]; norm_num

/-- CONSERVATION IN FOUR DIMENSIONS FORCES THE LAW. If the divergence of the law with constants a, b, m is zero
for every potential in every arena of four directions with one time, then b = -a and m = 0. -/
theorem conservation_in_four_dimensions_forces_the_law (a b m : ℚ)
    (h : ∀ (R : Type) [CommRing R] [Algebra ℚ R] (S : Arena ℚ (Fin 4) R) (A : Fin 4 → R),
      ∑ ν, eta4 ν • S.d ν (law S eta4 a b m A ν) = 0) : b = -a ∧ m = 0 := by
  have k := h ℚ[X] timeArena probe
  rw [divergence_of_the_law, probe_divergence, probe_wave] at k
  have k2 := congrArg (fun p => Polynomial.coeff p 2) k
  have k0 := congrArg (fun p => Polynomial.coeff p 0) k
  simp [Polynomial.coeff_smul, Polynomial.coeff_C] at k2 k0
  refine ⟨by linarith, k2⟩

/-! ## Part IV. Waves -/

section Waves
variable {K : Type*} [Field K] {ι : Type*} [Fintype ι] {R : Type*} [CommRing R] [Algebra K R]
variable (S : Arena K ι R) (η : ι → K)

/-- The product of two vectors of constants, with signs η. -/
def dot (k e : ι → K) : K := ∑ μ, η μ * k μ * e μ

/-- A PLANE WAVE IN THE LAW. Let a profile have derivatives along the wave vector k: the derivative of φ₀ along μ
is k μ times φ₁, and that of φ₁ is k μ times φ₂. For the potential ε φ₀ the divergence of the field is
((k·k) ε − (k·ε) k) times φ₂. -/
theorem plane_wave (k e : ι → K) (φ0 φ1 φ2 : R) (h1 : ∀ μ, S.d μ φ0 = k μ • φ1) (h2 : ∀ μ, S.d μ φ1 = k μ • φ2)
    (ν : ι) : source S η (fun ν => e ν • φ0) ν = (dot η k k * e ν - dot η k e * k ν) • φ2 := by
  unfold source F dot
  simp only [map_sub, map_smul, h1, h2, smul_smul, ← sub_smul, ← Finset.sum_smul]
  congr 1
  rw [Finset.sum_mul, Finset.sum_mul, ← Finset.sum_sub_distrib]
  refine Finset.sum_congr rfl fun μ _ => ?_
  ring

omit [Fintype ι] in
/-- The field of a wave: the wave vector wedged with the polarization. -/
def pol (k e : ι → K) (μ ν : ι) : K := k μ * e ν - k ν * e μ

/-- OFF THE CONE THERE IS NO WAVE. If the wave vector is not null, a polarization that solves the law without
sources has no field: it is a gauge turn. -/
theorem off_the_cone_is_pure_gauge (k e : ι → K) (hkk : dot η k k ≠ 0)
    (h : ∀ ν, dot η k k * e ν - dot η k e * k ν = 0) (μ ν : ι) : pol k e μ ν = 0 := by
  unfold pol
  apply mul_left_cancel₀ hkk
  linear_combination k μ * h ν - k ν * h μ

/-- ON THE CONE THE WAVE IS TRANSVERSE. If the wave vector is null and not zero, a polarization that solves the
law without sources has k·ε = 0. -/
theorem on_the_cone_the_wave_is_transverse (k e : ι → K) (hkk : dot η k k = 0) (hk : ∃ ν, k ν ≠ 0)
    (h : ∀ ν, dot η k k * e ν - dot η k e * k ν = 0) : dot η k e = 0 := by
  obtain ⟨ν, hν⟩ := hk
  have := h ν
  rw [hkk, zero_mul, zero_sub, neg_eq_zero] at this
  exact (mul_eq_zero.mp this).resolve_right hν

end Waves

section Count
variable {K : Type*} [Field K] {τ : Type*} [Fintype τ]

/-- The directions of a wave: the time, the direction of travel, and the directions τ across it. The wave vector
is one along the first two. The signs are plus for the time and minus for the rest. -/
def kw : Bool ⊕ τ → K := Sum.elim (fun _ => 1) (fun _ => 0)
def etaw : Bool ⊕ τ → K := Sum.elim (fun b => if b then 1 else -1) (fun _ => -1)
/-- A polarization across the wave. -/
def lift (t : τ → K) : Bool ⊕ τ → K := Sum.elim (fun _ => 0) t

theorem kw_null : dot (etaw : Bool ⊕ τ → K) kw kw = 0 := by
  simp [dot, kw, etaw, Fintype.sum_sum_type]

theorem dot_kw (e : Bool ⊕ τ → K) : dot etaw kw e = e (Sum.inl true) - e (Sum.inl false) := by
  simp [dot, kw, etaw, Fintype.sum_sum_type]; ring

theorem lift_transverse (t : τ → K) : dot etaw kw (lift t) = 0 := by
  rw [dot_kw]; simp [lift]

omit [Fintype τ] in
/-- EVERY WAVE IS A TRANSVERSE ONE. A polarization with k·ε = 0 has the field of its part across the wave. -/
theorem every_wave_is_a_transverse_one (e : Bool ⊕ τ → K) (h : e (Sum.inl true) = e (Sum.inl false)) :
    pol kw e = pol kw (lift fun j => e (Sum.inr j)) := by
  funext μ ν
  rcases μ with b | i <;> rcases ν with b' | j
  · cases b <;> cases b' <;> simp [pol, kw, lift, h]
  · simp [pol, kw, lift]
  · simp [pol, kw, lift]
  · simp [pol, kw, lift]

/-- The fields of the transverse waves, as a linear map. -/
def polMap : (τ → K) →ₗ[K] (Bool ⊕ τ → Bool ⊕ τ → K) where
  toFun t := pol kw (lift t)
  map_add' s t := by
    funext μ ν; rcases μ with b | i <;> rcases ν with b' | j <;> simp [pol, kw, lift]
    ring
  map_smul' c t := by
    funext μ ν; rcases μ with b | i <;> rcases ν with b' | j <;> simp [pol, kw, lift]

omit [Fintype τ] in
/-- Different transverse polarizations have different fields. -/
theorem polMap_injective : Function.Injective (polMap : (τ → K) →ₗ[K] _) := by
  intro s t h
  funext j
  have := congrFun (congrFun h (Sum.inl true)) (Sum.inr j)
  simpa [polMap, pol, kw, lift] using this

/-- THE WAVES ARE THE TRANSVERSE ONES. A field is the field of a polarization with k·ε = 0 exactly when it is the
field of a polarization across the wave. -/
theorem waves_are_the_range (P : Bool ⊕ τ → Bool ⊕ τ → K) :
    (∃ e : Bool ⊕ τ → K, dot etaw kw e = 0 ∧ pol kw e = P) ↔ P ∈ LinearMap.range (polMap : (τ → K) →ₗ[K] _) := by
  constructor
  · rintro ⟨e, he, rfl⟩
    rw [dot_kw, sub_eq_zero] at he
    exact ⟨fun j => e (Sum.inr j), (every_wave_is_a_transverse_one e he).symm⟩
  · rintro ⟨t, rfl⟩
    exact ⟨lift t, lift_transverse t, rfl⟩

/-- THE COUNT OF WAVES. The fields of the waves along one null vector form a space whose dimension is the number
of directions across the wave: the number of all directions less two. -/
theorem the_count_of_waves :
    Module.finrank K (LinearMap.range (polMap : (τ → K) →ₗ[K] _)) = Fintype.card τ ∧
      Fintype.card (Bool ⊕ τ) = Fintype.card τ + 2 := by
  refine ⟨?_, ?_⟩
  · rw [LinearMap.finrank_range_of_inj polMap_injective, Module.finrank_pi]
  · rw [Fintype.card_sum, Fintype.card_bool, add_comm]

/-- TWO AND NO THIRD. In four dimensions the waves along one null vector form a space of dimension two. -/
theorem two_helicities_and_no_third :
    Module.finrank K (LinearMap.range (polMap : (Fin 2 → K) →ₗ[K] _)) = 2 ∧ Fintype.card (Bool ⊕ Fin 2) = 4 := by
  have h := the_count_of_waves (K := K) (τ := Fin 2)
  simpa using h

end Count

/-! ## Part V. The static half -/

section Static
variable {K : Type*} [CommRing K] {ι : Type*} [Fintype ι] [DecidableEq ι] {R : Type*} [CommRing R] [Algebra K R]
variable (S : Arena K ι R) (η : ι → K)

/-- THE STATIC LAW. Let the potential be zero except along one direction, the time, and let it not change along
the time. Then the forced law along the time is a times the wave operator on that component, and along every
other direction it is zero. -/
theorem static_law (a : K) (A : ι → R) (o : ι) (hA : ∀ ν, ν ≠ o → A ν = 0) (hs : S.d o (A o) = 0) :
    law S η a (-a) 0 A o = a • box S η (A o) ∧ ∀ ν, ν ≠ o → law S η a (-a) 0 A ν = 0 := by
  have hd : div S η A = 0 := by
    unfold div
    refine Finset.sum_eq_zero fun μ _ => ?_
    by_cases hμ : μ = o
    · rw [hμ, hs, smul_zero]
    · rw [hA μ hμ, map_zero, smul_zero]
  constructor
  · unfold law; rw [hd, map_zero, smul_zero, zero_smul, add_zero, add_zero]
  · intro ν hν
    unfold law box
    rw [hd, hA ν hν]
    simp

omit [Fintype ι] [DecidableEq ι] in
/-- THE STATIC FIELD. With the potential zero along space, the field between a direction of space and the time is
the derivative of the one component along that direction: the electric field. -/
theorem static_field (A : ι → R) (o : ι) (hA : ∀ ν, ν ≠ o → A ν = 0) (μ : ι) (hμ : μ ≠ o) :
    F S A μ o = S.d μ (A o) := by
  unfold F; rw [hA μ hμ, map_zero, sub_zero]

/-- THE STATIC WAVE OPERATOR IS THE SUM OVER SPACE. On a field that does not change along the time. -/
theorem static_wave_is_the_sum_over_space (x : R) (o : ι) (hs : S.d o x = 0) :
    box S η x = ∑ μ ∈ Finset.univ.erase o, η μ • S.d μ (S.d μ x) := by
  unfold box
  rw [← Finset.add_sum_erase _ _ (Finset.mem_univ o), hs, map_zero, smul_zero, zero_add]

end Static

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

/-- THE INVERSE SQUARE IN THREE DIMENSIONS. With three directions of space and c = -3 the radial field has no
divergence where u is not a divisor of zero, and the square of its size is the power -4 of the distance: the
field falls as the inverse square. -/
theorem inverse_square_in_three (h3 : Fintype.card σ = 3) (hx : ∀ i j, S.d i (x j) = if i = j then 1 else 0)
    (hw : ∀ i, S.d i w * (∑ j, x j * x j) = -3 * (x i * w)) :
    (∑ i, S.d i (x i * w)) * (∑ j, x j * x j) = 0 ∧
      ∀ i, S.d i ((∑ j, x j * x j) * w * w) * (∑ j, x j * x j) = -4 * (x i * ((∑ j, x j * x j) * w * w)) := by
  constructor
  · rw [radial_divergence S x w (-3) hx hw, h3]; norm_num
  · intro i
    rw [the_field_falls S x w (-3) hx hw i]; norm_num

end Radial

/-! ## Part VI. The theorem -/

/-- The premises. A law of second order, linear in the potential, with three constants: a on the wave operator,
b on the gradient of the divergence, m on the potential itself. The source is what the law equals. The one
premise is that the source is conserved, whatever the potential, in every arena of four directions with one
time. Nothing else is assumed. -/
structure Premises where
  a : ℚ
  b : ℚ
  m : ℚ
  weight : a ≠ 0
  conserved : ∀ (R : Type) [CommRing R] [Algebra ℚ R] (S : Arena ℚ (Fin 4) R) (A : Fin 4 → R),
    ∑ ν, eta4 ν • S.d ν (law S eta4 a b m A ν) = 0

/-- MAXWELL, FORCED. On the premises b = -a and m = 0. -/
theorem maxwell_forced (P : Premises) : P.b = -P.a ∧ P.m = 0 :=
  conservation_in_four_dimensions_forces_the_law P.a P.b P.m P.conserved

/-- THE FORCED LAW IS MAXWELL'S. On the premises the law is a times the divergence of the field, in every arena. -/
theorem the_forced_law_is_maxwell (P : Premises) {R : Type} [CommRing R] [Algebra ℚ R] (S : Arena ℚ (Fin 4) R)
    (A : Fin 4 → R) (ν : Fin 4) : law S eta4 P.a P.b P.m A ν = P.a • source S eta4 A ν := by
  obtain ⟨hb, hm⟩ := maxwell_forced P
  rw [hb, hm, source_eq]; unfold law; module

/-- THE PHOTON HAS NO MASS, AND GAUGE INVARIANCE IS FORCED. On the premises the constant on the potential is
zero, and the law is the same after every gauge turn. -/
theorem gauge_forced (P : Premises) {R : Type} [CommRing R] [Algebra ℚ R] (S : Arena ℚ (Fin 4) R)
    (A : Fin 4 → R) (χ : R) (ν : Fin 4) :
    P.m = 0 ∧ law S eta4 P.a P.b P.m (fun ν => A ν + S.d ν χ) ν = law S eta4 P.a P.b P.m A ν := by
  obtain ⟨hb, hm⟩ := maxwell_forced P
  refine ⟨hm, ?_⟩
  rw [hb, hm]; exact gauge_invariance_is_a_consequence S eta4 P.a A χ ν

/-- THE PREMISES ARE INHABITED. Maxwell's law with any weight that is not zero. -/
def maxwellPremises (a : ℚ) (ha : a ≠ 0) : Premises where
  a := a
  b := -a
  m := 0
  weight := ha
  conserved := fun _ _ _ S A => conservation_identity S eta4 a A

/-! ## Part VII. Arithmetic on cited counts -/

/-- In n dimensions the field has n - 1 electric components and (n - 1)(n - 2)/2 magnetic ones. They are equal
in number exactly in four dimensions, for n at least two. The counts are classical; this is arithmetic on them. -/
theorem electric_and_magnetic_are_equal_in_number_exactly_in_four (n : ℤ) (hn : 2 ≤ n) :
    2 * (n - 1) = (n - 1) * (n - 2) ↔ n = 4 := by
  constructor
  · intro h
    have : (n - 1) * (n - 4) = 0 := by linear_combination -h
    rcases mul_eq_zero.mp this with h1 | h1 <;> omega
  · rintro rfl; norm_num

/-- Light has n - 2 waves and gravity n(n - 3)/2. They are equal in number exactly in four dimensions, for n at
least two. The count for gravity is classical; this is arithmetic on it. -/
theorem light_and_gravity_have_equal_waves_exactly_in_four (n : ℤ) (hn : 2 ≤ n) :
    2 * (n - 2) = n * (n - 3) ↔ n = 4 := by
  constructor
  · intro h
    have : (n - 1) * (n - 4) = 0 := by linear_combination -h
    rcases mul_eq_zero.mp this with h1 | h1 <;> omega
  · rintro rfl; norm_num

end SPHYS.Light

#print axioms SPHYS.Light.F_antisymm
#print axioms SPHYS.Light.homogeneous
#print axioms SPHYS.Light.gauge_keeps_the_field
#print axioms SPHYS.Light.box_d
#print axioms SPHYS.Light.box_add
#print axioms SPHYS.Light.box_smul
#print axioms SPHYS.Light.source_eq
#print axioms SPHYS.Light.law_one
#print axioms SPHYS.Light.divergence_of_the_law
#print axioms SPHYS.Light.conservation_identity
#print axioms SPHYS.Light.the_source_is_conserved
#print axioms SPHYS.Light.the_law_under_a_gauge_turn
#print axioms SPHYS.Light.gauge_invariance_is_a_consequence
#print axioms SPHYS.Light.timeArena
#print axioms SPHYS.Light.probe_divergence
#print axioms SPHYS.Light.probe_wave
#print axioms SPHYS.Light.conservation_in_four_dimensions_forces_the_law
#print axioms SPHYS.Light.plane_wave
#print axioms SPHYS.Light.off_the_cone_is_pure_gauge
#print axioms SPHYS.Light.on_the_cone_the_wave_is_transverse
#print axioms SPHYS.Light.kw_null
#print axioms SPHYS.Light.dot_kw
#print axioms SPHYS.Light.lift_transverse
#print axioms SPHYS.Light.every_wave_is_a_transverse_one
#print axioms SPHYS.Light.polMap_injective
#print axioms SPHYS.Light.waves_are_the_range
#print axioms SPHYS.Light.the_count_of_waves
#print axioms SPHYS.Light.two_helicities_and_no_third
#print axioms SPHYS.Light.static_law
#print axioms SPHYS.Light.radial_divergence
#print axioms SPHYS.Light.the_field_falls
#print axioms SPHYS.Light.only_one_power_is_free_of_sources
#print axioms SPHYS.Light.inverse_square_in_three
#print axioms SPHYS.Light.maxwell_forced
#print axioms SPHYS.Light.the_forced_law_is_maxwell
#print axioms SPHYS.Light.gauge_forced
#print axioms SPHYS.Light.maxwellPremises
#print axioms SPHYS.Light.electric_and_magnetic_are_equal_in_number_exactly_in_four
#print axioms SPHYS.Light.light_and_gravity_have_equal_waves_exactly_in_four
#print axioms SPHYS.Light.forced_law_is_a_source
#print axioms SPHYS.Light.static_field
#print axioms SPHYS.Light.static_wave_is_the_sum_over_space
