/-
SPHYS_Coupling_Magnitude_CC.lean · what the forced law of light leaves open: the value of its coupling, on real algebra
RATIONALE. The engine of edition 1.0.0 proved its statements over small structures of integers. This file replaces
  it. The law is the law of the companion paper on light, in an arena with derivatives; a change of the unit of
  length is a rescaling of the derivatives; a verdict is any function of a positive number; and the statement that
  the premises fix no value is proved by exhibiting a member of the premises for every positive value.
DESIGN. Parts, in order.
    Parts I to III  The field, the law and the forcing, compiled again from the companion file so that this file
              stands alone: `divergence_of_the_law`, `conservation_in_four_dimensions_forces_the_law`.
    Part II-b Every source is admitted. `law_add`, `law_smul_potential`, `law_smul_weights`,
              `every_multiple_of_a_solution_is_a_solution`.
    Part IV   The weight. `the_solutions_do_not_see_the_weight`.
    Part V    No scale of length. `Arena.scale`, `law_scale`, `the_forced_law_carries_no_length`,
              `a_mass_carries_a_length`.
    Part VI   Verdicts. `no_scale_blind_verdict_returns_a_value`.
    Part VII  One coupling. `one_coupling`, `like_repel_and_unlike_attract`, `the_coupling_of_a_charge_with_itself`.
    Part VIII `Premises`; `maxwell_forced`; `one_coupling_forced`; `every_positive_coupling_is_a_member`;
              `the_premises_fix_no_value`.
WHAT IS NOT PROVED HERE (read before citing).
    (a) That charge is conserved, that the force on a charge is linear in that charge, and that like charges
        repel. They are fields of `Premises`.
    (b) That no law at all fixes the coupling. The theorem is about the premises printed here.
    (c) The value of the coupling. It is measured.
RISK. The premises are over the rational numbers. No magnitude is derived.
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
import Mathlib.Tactic.Positivity
import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Algebra.Order.AbsoluteValue.Basic

namespace SPHYS.Coupling
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

/-! ## Part II-b. Every source is admitted -/

theorem div_add (A B : ι → R) : div S η (fun ν => A ν + B ν) = div S η A + div S η B := by
  unfold div; simp only [map_add, smul_add, Finset.sum_add_distrib]

theorem div_smul (c : K) (A : ι → R) : div S η (fun ν => c • A ν) = c • div S η A := by
  unfold div; simp only [map_smul]; rw [Finset.smul_sum]
  exact Finset.sum_congr rfl fun μ _ => smul_comm _ _ _

/-- THE LAW IS ADDITIVE. The law of a sum of two potentials is the sum of their laws. -/
theorem law_add (a b m : K) (A B : ι → R) (ν : ι) :
    law S η a b m (fun ν => A ν + B ν) ν = law S η a b m A ν + law S η a b m B ν := by
  unfold law; rw [div_add, box_add, map_add]; module

/-- THE LAW OF A MULTIPLE. The law of c times a potential is c times its law. -/
theorem law_smul_potential (a b m c : K) (A : ι → R) (ν : ι) :
    law S η a b m (fun ν => c • A ν) ν = c • law S η a b m A ν := by
  unfold law; rw [div_smul, box_smul, map_smul]; module

/-- THE LAW WITH ITS CONSTANTS MULTIPLIED. Multiplying the three constants by c multiplies the law by c. -/
theorem law_smul_weights (a b m c : K) (A : ι → R) (ν : ι) :
    law S η (c * a) (c * b) (c * m) A ν = c • law S η a b m A ν := by
  unfold law; module

/-- EVERY MULTIPLE OF A SOLUTION IS A SOLUTION. If a potential solves the law with a source, c times the potential
solves it with c times the source. Every value of the source is admitted. -/
theorem every_multiple_of_a_solution_is_a_solution (a b m c : K) (A J : ι → R)
    (h : ∀ ν, law S η a b m A ν = J ν) (ν : ι) : law S η a b m (fun ν => c • A ν) ν = c • J ν := by
  rw [law_smul_potential, h]

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


/-! ## Part IV. The weight -/

section Weight
variable {K : Type*} [Field K] {ι : Type*} [Fintype ι] {R : Type*} [CommRing R] [Algebra K R]
variable (S : Arena K ι R) (η : ι → K)

/-- THE SOLUTIONS DO NOT SEE THE WEIGHT. For c not zero, a potential solves the law without sources exactly when it
solves the law with all three constants multiplied by c. -/
theorem the_solutions_do_not_see_the_weight (a b m c : K) (hc : c ≠ 0) (A : ι → R) (ν : ι) :
    law S η (c * a) (c * b) (c * m) A ν = 0 ↔ law S η a b m A ν = 0 := by
  rw [law_smul_weights]
  constructor
  · intro h
    have := congrArg (fun x => c⁻¹ • x) h
    simpa [smul_smul, inv_mul_cancel₀ hc] using this
  · intro h; rw [h, smul_zero]

end Weight

/-! ## Part V. No scale of length -/

section Scale
variable {K : Type*} [CommRing K] {ι : Type*} [Fintype ι] {R : Type*} [CommRing R] [Algebra K R]
variable (S : Arena K ι R) (η : ι → K)

/-- A CHANGE OF THE UNIT OF LENGTH. Every derivative is multiplied by one constant l. The result is an arena. -/
def Arena.scale (l : K) : Arena K ι R where
  d := fun μ => l • S.d μ
  comm := by
    intro μ ν x
    simp only [LinearMap.smul_apply, map_smul]
    rw [S.comm μ ν x]
  leibniz := by
    intro μ x y
    simp only [LinearMap.smul_apply, S.leibniz, smul_add, smul_mul_assoc, mul_smul_comm]

omit [Fintype ι] in
theorem scale_d (l : K) (μ : ι) (x : R) : (S.scale l).d μ x = l • S.d μ x := rfl

theorem box_scale (l : K) (x : R) : box (S.scale l) η x = (l * l) • box S η x := by
  unfold box
  simp only [scale_d, map_smul, smul_smul, Finset.smul_sum]
  refine Finset.sum_congr rfl fun μ _ => ?_
  congr 1; ring

theorem div_scale (l : K) (A : ι → R) : div (S.scale l) η A = l • div S η A := by
  unfold div
  simp only [scale_d, smul_smul, Finset.smul_sum]
  refine Finset.sum_congr rfl fun μ _ => ?_
  congr 1; ring

/-- THE LAW AFTER A CHANGE OF THE UNIT OF LENGTH. The two terms of second order are multiplied by the square of
l, and the term on the potential itself is not. -/
theorem law_scale (a b m l : K) (A : ι → R) (ν : ι) :
    law (S.scale l) η a b m A ν = (l * l) • (a • box S η (A ν) + b • S.d ν (div S η A)) + m • A ν := by
  unfold law
  rw [box_scale, div_scale, scale_d, map_smul]
  module

/-- THE FORCED LAW CARRIES NO LENGTH. With b = -a and m = 0 the law after a change of the unit of length is the
square of l times the law before. Without sources it is the same law. -/
theorem the_forced_law_carries_no_length (a l : K) (A : ι → R) (ν : ι) :
    law (S.scale l) η a (-a) 0 A ν = (l * l) • law S η a (-a) 0 A ν := by
  rw [law_scale]; unfold law; module

/-- A MASS CARRIES A LENGTH. With a constant m on the potential, the law after the change differs from the square
of l times the law before by m (1 - l l) times the potential. -/
theorem a_mass_carries_a_length (a b m l : K) (A : ι → R) (ν : ι) :
    law (S.scale l) η a b m A ν - (l * l) • law S η a b m A ν = (m * (1 - l * l)) • A ν := by
  rw [law_scale]; unfold law; module

end Scale

/-! ## Part VI. Verdicts -/

section Verdict
variable {K : Type*} [Field K] [LinearOrder K] [IsStrictOrderedRing K]

/-- NO SCALE-BLIND VERDICT RETURNS A VALUE. Let a verdict give a number and each of its positive multiples one
answer. Then it gives every positive number the same answer. -/
theorem no_scale_blind_verdict_returns_a_value {T : Type*} (V : K → T) (h : ∀ c x, 0 < c → V (c * x) = V x)
    (x y : K) (hx : 0 < x) (hy : 0 < y) : V x = V y := by
  have e : y / x * x = y := div_mul_cancel₀ y hx.ne'
  rw [← h (y / x) x (div_pos hy hx), e]

/-! ## Part VII. One coupling -/

omit [LinearOrder K] [IsStrictOrderedRing K] in
/-- ONE COUPLING. Let the force between two charges be multiplied by c when either charge is. Then it is one
number, the force between two unit charges, times the product of the charges. -/
theorem one_coupling (f : K → K → K) (h1 : ∀ c x y, f (c * x) y = c * f x y)
    (h2 : ∀ c x y, f x (c * y) = c * f x y) (x y : K) : f x y = f 1 1 * x * y := by
  have a := h1 x 1 y
  have b := h2 y 1 1
  rw [mul_one] at a b
  rw [a, b]; ring

/-- LIKE CHARGES REPEL AND UNLIKE ATTRACT, FOR EVERY VALUE OF THE COUPLING. With the force between two unit
charges positive, the force has the sign of the product of the charges. -/
theorem like_repel_and_unlike_attract (f : K → K → K) (h1 : ∀ c x y, f (c * x) y = c * f x y)
    (h2 : ∀ c x y, f x (c * y) = c * f x y) (hpos : 0 < f 1 1) (x y : K) :
    (0 < x * y → 0 < f x y) ∧ (x * y < 0 → f x y < 0) := by
  rw [one_coupling f h1 h2 x y, mul_assoc]
  exact ⟨fun h => mul_pos hpos h, fun h => mul_neg_of_pos_of_neg hpos h⟩

/-- THE COUPLING OF A CHARGE WITH ITSELF. It is the force between two unit charges times the square of the
charge, and it is positive for every charge that is not zero. -/
theorem the_coupling_of_a_charge_with_itself (f : K → K → K) (h1 : ∀ c x y, f (c * x) y = c * f x y)
    (h2 : ∀ c x y, f x (c * y) = c * f x y) (hpos : 0 < f 1 1) (e : K) (he : e ≠ 0) :
    f e e = f 1 1 * (e * e) ∧ 0 < f e e := by
  have k := one_coupling f h1 h2 e e
  rw [mul_assoc] at k
  exact ⟨k, by rw [k]; exact mul_pos hpos (mul_self_pos.mpr he)⟩

end Verdict

/-! ## Part VIII. The theorem -/

/-- The premises. The law of the field is linear of second order with three constants, and its source is
conserved, whatever the potential, in every arena of four directions with one time. The force between two charges
is multiplied by c when either charge is. Like charges repel. The force between two unit charges is the inverse
of the constant on the wave operator, in units that set the constant of the sphere to one. Nothing else is
assumed, and no value is given. -/
structure Premises where
  a : ℚ
  b : ℚ
  m : ℚ
  conserved : ∀ (R : Type) [CommRing R] [Algebra ℚ R] (S : Arena ℚ (Fin 4) R) (A : Fin 4 → R),
    ∑ ν, eta4 ν • S.d ν (law S eta4 a b m A ν) = 0
  force : ℚ → ℚ → ℚ
  left : ∀ c x y, force (c * x) y = c * force x y
  right : ∀ c x y, force x (c * y) = c * force x y
  repel : 0 < force 1 1
  tied : force 1 1 * a = 1

/-- MAXWELL, FORCED. On the premises b = -a and m = 0. -/
theorem maxwell_forced (P : Premises) : P.b = -P.a ∧ P.m = 0 :=
  conservation_in_four_dimensions_forces_the_law P.a P.b P.m P.conserved

/-- ONE COUPLING, FORCED. On the premises the force between two charges is one positive number times the product
of the charges; like charges repel and unlike attract; and the constant on the wave operator is positive. -/
theorem one_coupling_forced (P : Premises) (x y : ℚ) :
    P.force x y = P.force 1 1 * x * y ∧ (0 < x * y → 0 < P.force x y) ∧ (x * y < 0 → P.force x y < 0)
      ∧ 0 < P.a := by
  refine ⟨one_coupling P.force P.left P.right x y, (like_repel_and_unlike_attract P.force P.left P.right P.repel x y).1,
    (like_repel_and_unlike_attract P.force P.left P.right P.repel x y).2, ?_⟩
  have h := P.tied
  have hr := P.repel
  by_contra hc
  have : P.force 1 1 * P.a ≤ 0 := mul_nonpos_of_nonneg_of_nonpos hr.le (not_lt.mp hc)
  linarith

/-- EVERY POSITIVE COUPLING IS A MEMBER. For every positive number there is a member of the premises whose force
between two unit charges is that number. -/
def couplingPremises (α : ℚ) (hα : 0 < α) : Premises where
  a := α⁻¹
  b := -α⁻¹
  m := 0
  conserved := fun _ _ _ S A => conservation_identity S eta4 α⁻¹ A
  force := fun x y => α * x * y
  left := fun c x y => by ring
  right := fun c x y => by ring
  repel := by simpa using hα
  tied := by simp [hα.ne']

theorem every_positive_coupling_is_a_member (α : ℚ) (hα : 0 < α) : ∃ P : Premises, P.force 1 1 = α :=
  ⟨couplingPremises α hα, by simp [couplingPremises]⟩

/-- THE PREMISES FIX NO VALUE. There is no number that the force between two unit charges equals in every member
of the premises. -/
theorem the_premises_fix_no_value (α0 : ℚ) : ¬ ∀ P : Premises, P.force 1 1 = α0 := by
  intro h
  obtain ⟨P, hP⟩ := every_positive_coupling_is_a_member (|α0| + 1) (by positivity)
  have e := h P
  rw [hP] at e
  have := le_abs_self α0
  linarith

/-- NO FUNCTION OF THE FORM RETURNS THE VALUE. Two members with different couplings have laws that the same
potentials solve without sources: the solutions of the law do not tell the two apart. -/
theorem the_form_does_not_tell_two_couplings_apart (P Q : Premises) {R : Type} [CommRing R] [Algebra ℚ R]
    (S : Arena ℚ (Fin 4) R) (A : Fin 4 → R) (ν : Fin 4) :
    law S eta4 P.a P.b P.m A ν = 0 ↔ law S eta4 Q.a Q.b Q.m A ν = 0 := by
  obtain ⟨hPb, hPm⟩ := maxwell_forced P
  obtain ⟨hQb, hQm⟩ := maxwell_forced Q
  have hPa : P.a ≠ 0 := (one_coupling_forced P 0 0).2.2.2.ne'
  have hQa : Q.a ≠ 0 := (one_coupling_forced Q 0 0).2.2.2.ne'
  have eP : law S eta4 P.a P.b P.m A ν = 0 ↔ law S eta4 1 (-1) 0 A ν = 0 := by
    have := the_solutions_do_not_see_the_weight S eta4 1 (-1) 0 P.a hPa A ν
    rw [hPb, hPm]; simpa using this
  have eQ : law S eta4 Q.a Q.b Q.m A ν = 0 ↔ law S eta4 1 (-1) 0 A ν = 0 := by
    have := the_solutions_do_not_see_the_weight S eta4 1 (-1) 0 Q.a hQa A ν
    rw [hQb, hQm]; simpa using this
  rw [eP, eQ]

end SPHYS.Coupling

#print axioms SPHYS.Coupling.F_antisymm
#print axioms SPHYS.Coupling.homogeneous
#print axioms SPHYS.Coupling.gauge_keeps_the_field
#print axioms SPHYS.Coupling.box_d
#print axioms SPHYS.Coupling.box_add
#print axioms SPHYS.Coupling.box_smul
#print axioms SPHYS.Coupling.source_eq
#print axioms SPHYS.Coupling.law_one
#print axioms SPHYS.Coupling.forced_law_is_a_source
#print axioms SPHYS.Coupling.divergence_of_the_law
#print axioms SPHYS.Coupling.conservation_identity
#print axioms SPHYS.Coupling.the_source_is_conserved
#print axioms SPHYS.Coupling.the_law_under_a_gauge_turn
#print axioms SPHYS.Coupling.gauge_invariance_is_a_consequence
#print axioms SPHYS.Coupling.div_add
#print axioms SPHYS.Coupling.div_smul
#print axioms SPHYS.Coupling.law_add
#print axioms SPHYS.Coupling.law_smul_potential
#print axioms SPHYS.Coupling.law_smul_weights
#print axioms SPHYS.Coupling.every_multiple_of_a_solution_is_a_solution
#print axioms SPHYS.Coupling.the_solutions_do_not_see_the_weight
#print axioms SPHYS.Coupling.Arena.scale
#print axioms SPHYS.Coupling.scale_d
#print axioms SPHYS.Coupling.box_scale
#print axioms SPHYS.Coupling.div_scale
#print axioms SPHYS.Coupling.law_scale
#print axioms SPHYS.Coupling.the_forced_law_carries_no_length
#print axioms SPHYS.Coupling.a_mass_carries_a_length
#print axioms SPHYS.Coupling.no_scale_blind_verdict_returns_a_value
#print axioms SPHYS.Coupling.one_coupling
#print axioms SPHYS.Coupling.like_repel_and_unlike_attract
#print axioms SPHYS.Coupling.the_coupling_of_a_charge_with_itself
#print axioms SPHYS.Coupling.probe_divergence
#print axioms SPHYS.Coupling.probe_wave
#print axioms SPHYS.Coupling.conservation_in_four_dimensions_forces_the_law
#print axioms SPHYS.Coupling.maxwell_forced
#print axioms SPHYS.Coupling.one_coupling_forced
#print axioms SPHYS.Coupling.couplingPremises
#print axioms SPHYS.Coupling.every_positive_coupling_is_a_member
#print axioms SPHYS.Coupling.the_premises_fix_no_value
#print axioms SPHYS.Coupling.the_form_does_not_tell_two_couplings_apart
