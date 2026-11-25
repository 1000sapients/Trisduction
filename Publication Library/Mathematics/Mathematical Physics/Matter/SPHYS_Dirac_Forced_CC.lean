/-
SPHYS_Dirac_Forced_CC.lean · the Dirac law and exclusion, on real algebra
RATIONALE. The engine of edition 1.0.0 proved its statements over small structures of integers that carried the
  pieces of the law as fields. This file replaces it. The coefficients of the law are elements of a ring, the mass
  shell is a quadratic form, a spinor is a column on which matrices act, and an exchange is a permutation.
  Nothing else is assumed.
DESIGN. Parts, in order.
    Part I    `slash`, `shell`, `Clifford`. Proved: a law of first order squares to the mass shell on every
              momentum if and only if its coefficients obey the Clifford relations
              (`square_forces_the_relations`, `relations_give_the_square`); `the_law_factorises`.
    Part II   `no_numbers_take_the_square_root`: coefficients that commute cannot obey the relations.
    Part III  Matrices over a field. Proved: `trace_zero_of_anticommute`; `no_two_in_odd_size`;
              `no_four_in_size_two`; `four_is_the_least`.
    Part IV   An explicit set of four matrices of size four over any commutative ring with a square root of minus
              one. Every relation is proved (`model_clifford`). `model_energy`: the coefficient of the energy is
              diagonal, twice plus one and twice minus one. `model_spin_commutes_with_energy`.
    Part V    Three directions that anticommute. Proved: `product_of_two_directions`, `the_spin_term`,
              `full_turn`: the rotor of a half turn squares to minus one and turns every direction back;
              `rotor_of_the_law`: the same for two coefficients of the law.
    Part VI   `exclusion`, `a_whole_spin_excludes_nothing`, `a_sign_is_plus_or_minus_one`,
              `two_statistics_and_no_third`: a one-dimensional action of the permutations is trivial or the sign.
    Part VII  `Premises`; `dirac_forced`; `four_components`; `the_two_signs_of_the_energy_balance`;
              `the_forced_law_is_a_half_spin`; `exclusion_forced`; `diracPremises`: the structure
              is inhabited.
WHAT IS NOT PROVED HERE (read before citing).
    (a) That the exchange of two identical particles carries the number of the full turn. It is the field `exchange`
        of `Premises`. In relativistic field theory it is the spin-statistics theorem, cited and not formalised.
    (b) That the law of a half-spin is of first order. It is the field `first_order` of `Premises`.
    (c) That in three dimensions of space and above the exchanges of n particles form the group of permutations,
        and in two dimensions a larger group. It is topology, cited. Part VI proves what follows for permutations.
    (d) That the spin of the law is one half of the generators of Part V, so that the spin term reads as a moment
        of two. The identity `the_spin_term` is proved; the reading of its coefficient is the classical one.
RISK. Part III is over a field in which two is not zero. Part IV needs a square root of minus one. No magnitude
  is derived: every mass is admitted.
NON-NEGOTIABLE. No axiom is declared, no sorry. No headline theorem closes over a structure that carries its
  conclusion. The kernel line of every theorem the paper names is printed at the end.
-/
import Mathlib.Data.Matrix.Notation
import Mathlib.Data.Matrix.Mul
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.LinearIndependent.Lemmas
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.LinearAlgebra.FreeModule.Finite.Matrix
import Mathlib.GroupTheory.Perm.Sign
import Mathlib.Data.Complex.Basic
import Mathlib.Algebra.Algebra.Basic
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Ring
import Mathlib.Tactic.NoncommRing
import Mathlib.Tactic.Module
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith

namespace SPHYS.Matter

/-! ## Part I. A law of first order and the mass shell -/

section Clifford
variable {k : Type*} [CommRing k] {R : Type*} [Ring R] [Algebra k R] {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- The operator of first order with coefficients γ, at the momentum p. -/
def slash (γ : ι → R) (p : ι → k) : R := ∑ μ, p μ • γ μ
/-- The mass shell: the quadratic form with signs η, at the momentum p. -/
def shell (η p : ι → k) : k := ∑ μ, η μ * (p μ * p μ)
/-- The Clifford relations: each coefficient squares to its sign and two different ones anticommute. -/
def Clifford (γ : ι → R) (η : ι → k) : Prop :=
  (∀ μ, γ μ * γ μ = algebraMap k R (η μ)) ∧ ∀ μ ν, μ ≠ ν → γ μ * γ ν + γ ν * γ μ = 0

theorem slash_unit (γ : ι → R) (μ : ι) : slash γ (fun κ => if κ = μ then (1 : k) else 0) = γ μ := by
  unfold slash
  simp [ite_smul, Finset.sum_ite_eq']

theorem shell_unit (η : ι → k) (μ : ι) : shell η (fun κ => if κ = μ then (1 : k) else 0) = η μ := by
  unfold shell
  simp [Finset.sum_ite_eq']

theorem slash_pair (γ : ι → R) (μ ν : ι) :
    slash γ (fun κ => (if κ = μ then (1 : k) else 0) + (if κ = ν then 1 else 0)) = γ μ + γ ν := by
  unfold slash
  simp [add_smul, ite_smul, Finset.sum_add_distrib, Finset.sum_ite_eq']

theorem shell_pair (η : ι → k) (μ ν : ι) (h : μ ≠ ν) :
    shell η (fun κ => (if κ = μ then (1 : k) else 0) + (if κ = ν then 1 else 0)) = η μ + η ν := by
  unfold shell
  have e : ∀ κ, η κ * (((if κ = μ then (1 : k) else 0) + (if κ = ν then 1 else 0))
        * ((if κ = μ then (1 : k) else 0) + (if κ = ν then 1 else 0)))
      = (if κ = μ then η κ else 0) + (if κ = ν then η κ else 0) := by
    intro κ
    by_cases h1 : κ = μ <;> by_cases h2 : κ = ν
    · exact absurd (h1.symm.trans h2) h
    · subst h1; simp [h2]
    · subst h2; simp [h1]
    · simp [h1, h2]
  simp only [e, Finset.sum_add_distrib, Finset.sum_ite_eq', Finset.mem_univ, if_true]

/-- THE SQUARE FORCES THE RELATIONS. If the operator of first order squares to the mass shell at every momentum,
its coefficients obey the Clifford relations. Nothing is divided. -/
theorem square_forces_the_relations (γ : ι → R) (η : ι → k)
    (h : ∀ p : ι → k, slash γ p * slash γ p = algebraMap k R (shell η p)) : Clifford γ η := by
  have sq : ∀ μ, γ μ * γ μ = algebraMap k R (η μ) := by
    intro μ
    have e := h (fun κ => if κ = μ then (1 : k) else 0)
    rwa [slash_unit, shell_unit] at e
  refine ⟨sq, ?_⟩
  intro μ ν hne
  have e := h (fun κ => (if κ = μ then (1 : k) else 0) + (if κ = ν then 1 else 0))
  rw [slash_pair, shell_pair η μ ν hne, map_add, ← sq μ, ← sq ν] at e
  have x : (γ μ + γ ν) * (γ μ + γ ν) = γ μ * γ μ + γ ν * γ ν + (γ μ * γ ν + γ ν * γ μ) := by noncomm_ring
  rw [x] at e
  exact add_eq_left.mp e

/-- THE RELATIONS GIVE THE SQUARE, in a ring where x + x = 0 gives x = 0. -/
theorem relations_give_the_square (h2 : ∀ x : R, x + x = 0 → x = 0) (γ : ι → R) (η : ι → k)
    (hc : Clifford γ η) (p : ι → k) : slash γ p * slash γ p = algebraMap k R (shell η p) := by
  have e : slash γ p * slash γ p = ∑ μ, ∑ ν, (p μ * p ν) • (γ μ * γ ν) := by
    unfold slash
    rw [Finset.sum_mul]
    apply Finset.sum_congr rfl; intro μ _
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl; intro ν _
    rw [smul_mul_smul_comm]
  have d : ∀ μ ν, (p μ * p ν) • (γ μ * γ ν) + (p ν * p μ) • (γ ν * γ μ)
      = if μ = ν then (p μ * p μ) • (algebraMap k R (η μ) + algebraMap k R (η μ)) else 0 := by
    intro μ ν
    split_ifs with hh
    · subst hh; rw [hc.1 μ, smul_add]
    · rw [mul_comm (p ν) (p μ), ← smul_add, hc.2 μ ν hh, smul_zero]
  have t : algebraMap k R (shell η p) = ∑ μ, (p μ * p μ) • algebraMap k R (η μ) := by
    unfold shell
    rw [map_sum]
    apply Finset.sum_congr rfl; intro μ _
    rw [map_mul, Algebra.smul_def]
    exact Algebra.commutes (η μ) _
  have e' : slash γ p * slash γ p = ∑ μ, ∑ ν, (p ν * p μ) • (γ ν * γ μ) := by rw [e, Finset.sum_comm]
  have s : slash γ p * slash γ p + slash γ p * slash γ p
      = algebraMap k R (shell η p) + algebraMap k R (shell η p) := by
    have c := congrArg₂ (· + ·) e e'
    simp only at c
    rw [c, t, ← Finset.sum_add_distrib, ← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl; intro μ _
    rw [← Finset.sum_add_distrib]
    simp only [d, Finset.sum_ite_eq, Finset.mem_univ, if_true, smul_add]
  have z := h2 (slash γ p * slash γ p - algebraMap k R (shell η p)) (by
    have : slash γ p * slash γ p - algebraMap k R (shell η p)
        + (slash γ p * slash γ p - algebraMap k R (shell η p))
        = (slash γ p * slash γ p + slash γ p * slash γ p)
          - (algebraMap k R (shell η p) + algebraMap k R (shell η p)) := by abel
    rw [this, s, sub_self])
  exact sub_eq_zero.mp z

/-- THE LAW FACTORISES. The operator of first order less the mass, times the operator plus the mass, is the square
less the square of the mass. On the mass shell the law of second order is the product of two laws of first order,
for every mass. -/
theorem the_law_factorises (D : R) (m : k) :
    (D - algebraMap k R m) * (D + algebraMap k R m) = D * D - algebraMap k R (m * m) := by
  have c : algebraMap k R m * D = D * algebraMap k R m := Algebra.commutes m D
  rw [map_mul]
  have x : (D - algebraMap k R m) * (D + algebraMap k R m)
      = D * D + (D * algebraMap k R m - algebraMap k R m * D) - algebraMap k R m * algebraMap k R m := by
    noncomm_ring
  rw [x, c, sub_self, add_zero]

end Clifford

/-! ## Part II. No numbers take the square root -/

/-- NO NUMBERS TAKE THE SQUARE ROOT. In a commutative domain where two is not zero, two elements whose squares are
not zero cannot anticommute. With two directions or more, the coefficients of the law cannot commute. -/
theorem no_numbers_take_the_square_root {F : Type*} [CommRing F] [IsDomain F] (a b : F) (h2 : (2 : F) ≠ 0)
    (ha : a * a ≠ 0) (hb : b * b ≠ 0) : a * b + b * a ≠ 0 := by
  intro h
  have e : 2 * (a * b) = 0 := by linear_combination h
  rcases mul_eq_zero.mp ((mul_eq_zero.mp e).resolve_left h2) with h0 | h0
  · exact ha (by rw [h0, zero_mul])
  · exact hb (by rw [h0, zero_mul])

/-! ## Part III. The least size of the coefficients -/

section Size
variable {K : Type*} [Field K] {n : ℕ}
open Matrix

/-- A matrix that anticommutes with one whose square is a scalar that is not zero has trace zero. -/
theorem trace_zero_of_anticommute (h2 : (2 : K) ≠ 0) (A B : Matrix (Fin n) (Fin n) K) (β : K) (hβ : β ≠ 0)
    (hB : B * B = β • (1 : Matrix (Fin n) (Fin n) K)) (h : A * B + B * A = 0) : A.trace = 0 := by
  have e1 : (A * B * B).trace = β * A.trace := by
    rw [mul_assoc, hB, mul_smul_comm, mul_one, trace_smul, smul_eq_mul]
  have e2 : (A * B * B).trace = -(β * A.trace) := by
    have hBA : B * A = -(A * B) := eq_neg_of_add_eq_zero_right h
    rw [trace_mul_comm (A * B) B, ← mul_assoc, hBA, neg_mul, trace_neg, e1]
  have e3 : 2 * (β * A.trace) = 0 := by linear_combination e2 - e1
  exact (mul_eq_zero.mp ((mul_eq_zero.mp e3).resolve_left h2)).resolve_left hβ

/-- The product of two matrices that anticommute has trace zero. -/
theorem trace_mul_zero_of_anticommute (h2 : (2 : K) ≠ 0) (A B : Matrix (Fin n) (Fin n) K)
    (h : A * B + B * A = 0) : (A * B).trace = 0 := by
  have e : (A * B).trace + (B * A).trace = 0 := by rw [← trace_add, h, trace_zero]
  rw [trace_mul_comm B A] at e
  have e3 : 2 * (A * B).trace = 0 := by linear_combination e
  exact (mul_eq_zero.mp e3).resolve_left h2

/-- NO TWO IN ODD SIZE. Two matrices of odd size whose squares are scalars that are not zero cannot anticommute. -/
theorem no_two_in_odd_size (h2 : (2 : K) ≠ 0) (hn : Odd n) (A B : Matrix (Fin n) (Fin n) K) (α β : K)
    (hα : α ≠ 0) (hβ : β ≠ 0) (hA : A * A = α • (1 : Matrix (Fin n) (Fin n) K))
    (hB : B * B = β • (1 : Matrix (Fin n) (Fin n) K)) : A * B + B * A ≠ 0 := by
  intro h
  have hAB : A * B = -(B * A) := eq_neg_of_add_eq_zero_left h
  have d := congrArg det hAB
  rw [det_neg, det_mul, det_mul, Fintype.card_fin, hn.neg_one_pow] at d
  have e : 2 * (A.det * B.det) = 0 := by linear_combination d
  have dA : A.det * A.det = α ^ n := by
    rw [← det_mul, hA, det_smul, det_one, mul_one, Fintype.card_fin]
  have dB : B.det * B.det = β ^ n := by
    rw [← det_mul, hB, det_smul, det_one, mul_one, Fintype.card_fin]
  rcases mul_eq_zero.mp ((mul_eq_zero.mp e).resolve_left h2) with h0 | h0
  · rw [h0, zero_mul] at dA; exact pow_ne_zero n hα dA.symm
  · rw [h0, zero_mul] at dB; exact pow_ne_zero n hβ dB.symm

/-- NO FOUR IN SIZE TWO. Four matrices of size two whose squares are scalars that are not zero cannot anticommute
in pairs: with the unit matrix they would be five matrices orthogonal for the trace form, in a space of
dimension four. -/
theorem no_four_in_size_two (h2 : (2 : K) ≠ 0) (γ : Fin 4 → Matrix (Fin 2) (Fin 2) K) (η : Fin 4 → K)
    (hη : ∀ μ, η μ ≠ 0) (hsq : ∀ μ, γ μ * γ μ = η μ • (1 : Matrix (Fin 2) (Fin 2) K))
    (hac : ∀ μ ν, μ ≠ ν → γ μ * γ ν + γ ν * γ μ = 0) : False := by
  let v : Option (Fin 4) → Matrix (Fin 2) (Fin 2) K := fun o => o.elim 1 γ
  have tr0 : ∀ μ, (γ μ).trace = 0 := by
    intro μ
    obtain ⟨ν, hν⟩ : ∃ ν : Fin 4, μ ≠ ν := by
      by_cases h0 : μ = 0
      · exact ⟨1, by rw [h0]; decide⟩
      · exact ⟨0, h0⟩
    exact trace_zero_of_anticommute h2 (γ μ) (γ ν) (η ν) (hη ν) (hsq ν) (hac μ ν hν)
  have ortho : ∀ i j, i ≠ j → (v i * v j).trace = 0 := by
    intro i j hij
    cases i with
    | none =>
      cases j with
      | none => exact absurd rfl hij
      | some ν => simpa [v] using tr0 ν
    | some μ =>
      cases j with
      | none => simpa [v] using tr0 μ
      | some ν =>
        have hne : μ ≠ ν := fun hh => hij (by rw [hh])
        simpa [v] using trace_mul_zero_of_anticommute h2 (γ μ) (γ ν) (hac μ ν hne)
  have nonis : ∀ i, (v i * v i).trace ≠ 0 := by
    intro i hi
    cases i with
    | none =>
      simp [v, trace_one] at hi
      exact h2 (by exact_mod_cast hi)
    | some μ =>
      simp only [v, Option.elim] at hi
      rw [hsq μ, trace_smul, trace_one, Fintype.card_fin, smul_eq_mul] at hi
      rcases mul_eq_zero.mp hi with h0 | h0
      · exact hη μ h0
      · exact h2 (by exact_mod_cast h0)
  have li : LinearIndependent K v := by
    rw [Fintype.linearIndependent_iff]
    intro g hg j
    have e := congrArg (fun X => (v j * X).trace) hg
    simp only [Finset.mul_sum, mul_smul_comm, trace_sum, trace_smul, smul_eq_mul, mul_zero, trace_zero] at e
    rw [Finset.sum_eq_single j (fun i _ hi => by rw [ortho j i (Ne.symm hi), mul_zero])
      (fun hj => absurd (Finset.mem_univ j) hj)] at e
    exact (mul_eq_zero.mp e).resolve_right (nonis j)
  have c := li.fintype_card_le_finrank
  rw [Module.finrank_matrix, Module.finrank_self] at c
  simp at c

/-- FOUR IS THE LEAST. Four matrices of size one, two or three whose squares are scalars that are not zero cannot
anticommute in pairs. -/
theorem four_is_the_least (h2 : (2 : K) ≠ 0) (hpos : 0 < n) (hn : n < 4) (γ : Fin 4 → Matrix (Fin n) (Fin n) K)
    (η : Fin 4 → K) (hη : ∀ μ, η μ ≠ 0) (hsq : ∀ μ, γ μ * γ μ = η μ • (1 : Matrix (Fin n) (Fin n) K))
    (hac : ∀ μ ν, μ ≠ ν → γ μ * γ ν + γ ν * γ μ = 0) : False := by
  have hcase : n = 1 ∨ n = 2 ∨ n = 3 := by omega
  rcases hcase with rfl | rfl | rfl
  · exact no_two_in_odd_size h2 (by decide) (γ 0) (γ 1) (η 0) (η 1) (hη 0) (hη 1) (hsq 0) (hsq 1)
      (hac 0 1 (by decide))
  · exact no_four_in_size_two h2 γ η hη hsq hac
  · exact no_two_in_odd_size h2 (by decide) (γ 0) (γ 1) (η 0) (η 1) (hη 0) (hη 1) (hsq 0) (hsq 1)
      (hac 0 1 (by decide))

end Size
/-! ## Part IV. Four coefficients of size four
    Over any commutative ring with an element whose square is minus one. The signs are plus for the energy and
    minus for the three directions of space. -/

section Model
variable {C : Type} [CommRing C]
open Matrix

/-- The signs of the mass shell: energy squared less the three squares of the momentum. -/
def eta : Fin 4 → C := ![1, -1, -1, -1]

def g0 : Matrix (Fin 4) (Fin 4) C := !![1,0,0,0; 0,1,0,0; 0,0,-1,0; 0,0,0,-1]
def g1 : Matrix (Fin 4) (Fin 4) C := !![0,0,0,1; 0,0,1,0; 0,-1,0,0; -1,0,0,0]
def g2 (i : C) : Matrix (Fin 4) (Fin 4) C := !![0,0,0,-i; 0,0,i,0; 0,i,0,0; -i,0,0,0]
def g3 : Matrix (Fin 4) (Fin 4) C := !![0,0,1,0; 0,0,0,-1; -1,0,0,0; 0,1,0,0]
/-- The four coefficients of the model. -/
def gam (i : C) : Fin 4 → Matrix (Fin 4) (Fin 4) C := ![g0, g1, g2 i, g3]

set_option maxHeartbeats 2000000 in
theorem model_squares (i : C) (hi : i * i = -1) :
    (g0 : Matrix (Fin 4) (Fin 4) C) * g0 = 1 ∧ (g1 : Matrix (Fin 4) (Fin 4) C) * g1 = -1
      ∧ g2 i * g2 i = -1 ∧ (g3 : Matrix (Fin 4) (Fin 4) C) * g3 = -1 := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;> ext a b <;> fin_cases a <;> fin_cases b <;>
    simp [g0, g1, g2, g3, Matrix.mul_apply, Fin.sum_univ_four, hi]

set_option maxHeartbeats 4000000 in
theorem model_anticommute (i : C) :
    (g0 : Matrix (Fin 4) (Fin 4) C) * g1 + g1 * g0 = 0 ∧ g0 * g2 i + g2 i * g0 = 0
      ∧ (g0 : Matrix (Fin 4) (Fin 4) C) * g3 + g3 * g0 = 0 ∧ g1 * g2 i + g2 i * g1 = 0
      ∧ (g1 : Matrix (Fin 4) (Fin 4) C) * g3 + g3 * g1 = 0 ∧ g2 i * g3 + g3 * g2 i = 0 := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩ <;> ext a b <;> fin_cases a <;> fin_cases b <;>
    simp [g0, g1, g2, g3, Matrix.mul_apply, Fin.sum_univ_four]

/-- THE MODEL OBEYS EVERY RELATION. -/
theorem model_clifford (i : C) (hi : i * i = -1) : Clifford (k := C) (gam i) eta := by
  obtain ⟨s0, s1, s2, s3⟩ := model_squares i hi
  obtain ⟨a01, a02, a03, a12, a13, a23⟩ := model_anticommute i
  have am : ∀ r : C, algebraMap C (Matrix (Fin 4) (Fin 4) C) r = r • (1 : Matrix (Fin 4) (Fin 4) C) :=
    fun r => Algebra.algebraMap_eq_smul_one r
  constructor
  · intro μ
    fin_cases μ
    · show (g0 : Matrix (Fin 4) (Fin 4) C) * g0 = algebraMap C _ (1 : C); rw [am, one_smul]; exact s0
    · show (g1 : Matrix (Fin 4) (Fin 4) C) * g1 = algebraMap C _ (-1 : C); rw [am, neg_one_smul]; exact s1
    · show g2 i * g2 i = algebraMap C _ (-1 : C); rw [am, neg_one_smul]; exact s2
    · show (g3 : Matrix (Fin 4) (Fin 4) C) * g3 = algebraMap C _ (-1 : C); rw [am, neg_one_smul]; exact s3
  · intro μ ν h
    fin_cases μ <;> fin_cases ν
    · exact absurd rfl h
    · show (g0 : Matrix (Fin 4) (Fin 4) C) * g1 + g1 * g0 = 0; exact a01
    · show (g0 : Matrix (Fin 4) (Fin 4) C) * g2 i + g2 i * g0 = 0; exact a02
    · show (g0 : Matrix (Fin 4) (Fin 4) C) * g3 + g3 * g0 = 0; exact a03
    · show (g1 : Matrix (Fin 4) (Fin 4) C) * g0 + g0 * g1 = 0; rw [add_comm]; exact a01
    · exact absurd rfl h
    · show (g1 : Matrix (Fin 4) (Fin 4) C) * g2 i + g2 i * g1 = 0; exact a12
    · show (g1 : Matrix (Fin 4) (Fin 4) C) * g3 + g3 * g1 = 0; exact a13
    · show g2 i * (g0 : Matrix (Fin 4) (Fin 4) C) + g0 * g2 i = 0; rw [add_comm]; exact a02
    · show g2 i * (g1 : Matrix (Fin 4) (Fin 4) C) + g1 * g2 i = 0; rw [add_comm]; exact a12
    · exact absurd rfl h
    · show g2 i * (g3 : Matrix (Fin 4) (Fin 4) C) + g3 * g2 i = 0; exact a23
    · show (g3 : Matrix (Fin 4) (Fin 4) C) * g0 + g0 * g3 = 0; rw [add_comm]; exact a03
    · show (g3 : Matrix (Fin 4) (Fin 4) C) * g1 + g1 * g3 = 0; rw [add_comm]; exact a13
    · show (g3 : Matrix (Fin 4) (Fin 4) C) * g2 i + g2 i * g3 = 0; rw [add_comm]; exact a23
    · exact absurd rfl h

/-- TWO SIGNS OF THE ENERGY, TWICE EACH. The coefficient of the energy is diagonal, with plus one on two
components and minus one on two. -/
theorem model_energy : (g0 : Matrix (Fin 4) (Fin 4) C) = Matrix.diagonal ![1, 1, -1, -1] := by
  ext a b; fin_cases a <;> fin_cases b <;> simp [g0, Matrix.diagonal]

/-- THE HALF TURN ACTS WITHIN EACH SIGN OF THE ENERGY: in the model the rotor of the first two directions of space
commutes with the coefficient of the energy. -/
theorem model_spin_commutes_with_energy (i : C) :
    (g0 : Matrix (Fin 4) (Fin 4) C) * (g1 * g2 i) = (g1 * g2 i) * g0 := by
  ext a b; fin_cases a <;> fin_cases b <;> simp [g0, g1, g2, Matrix.mul_apply, Fin.sum_univ_four]

end Model

/-! ## Part V. Three directions that anticommute -/

section Spin
variable {k : Type*} [CommRing k] {R : Type*} [Ring R] [Algebra k R]
variable (e1 e2 e3 : R) (h11 : e1 * e1 = 1) (h22 : e2 * e2 = 1) (h33 : e3 * e3 = 1)
variable (h21 : e2 * e1 = -(e1 * e2)) (h32 : e3 * e2 = -(e2 * e3)) (h13 : e1 * e3 = -(e3 * e1))
include h11 h22 h33 h21 h32 h13

/-- THE PRODUCT OF TWO DIRECTIONS. It is their dot product, plus their cross product carried by the products of
pairs of the three generators. -/
theorem product_of_two_directions (a1 a2 a3 b1 b2 b3 : k) :
    (a1 • e1 + a2 • e2 + a3 • e3) * (b1 • e1 + b2 • e2 + b3 • e3)
      = (a1 * b1 + a2 * b2 + a3 * b3) • (1 : R) + (a2 * b3 - a3 * b2) • (e2 * e3)
        + (a3 * b1 - a1 * b3) • (e3 * e1) + (a1 * b2 - a2 * b1) • (e1 * e2) := by
  simp only [add_mul, mul_add, smul_mul_smul_comm, h11, h22, h33, h21, h32, h13]
  module

omit [Algebra k R] in
/-- THE SPIN TERM. Let three momenta commute with the generators and not with one another. The square of the
operator is the sum of the squares of the momenta plus the commutators of the momenta, each carried by a product
of two generators. -/
theorem the_spin_term (p1 p2 p3 : R)
    (c : ∀ e ∈ [e1, e2, e3], ∀ p ∈ [p1, p2, p3], p * e = e * p) :
    (e1 * p1 + e2 * p2 + e3 * p3) * (e1 * p1 + e2 * p2 + e3 * p3)
      = p1 * p1 + p2 * p2 + p3 * p3 + e1 * e2 * (p1 * p2 - p2 * p1) + e2 * e3 * (p2 * p3 - p3 * p2)
        + e3 * e1 * (p3 * p1 - p1 * p3) := by
  have sw : ∀ x p y q : R, p * y = y * p → x * p * (y * q) = x * y * (p * q) := by
    intro x p y q hh
    rw [mul_assoc, ← mul_assoc p, hh, mul_assoc, ← mul_assoc]
  have cc : ∀ e p, e ∈ [e1, e2, e3] → p ∈ [p1, p2, p3] → p * e = e * p := fun e p he hp => c e he p hp
  simp only [add_mul, mul_add]
  rw [sw e1 p1 e1 p1 (cc _ _ (by simp) (by simp)), sw e1 p1 e2 p2 (cc _ _ (by simp) (by simp)),
    sw e1 p1 e3 p3 (cc _ _ (by simp) (by simp)), sw e2 p2 e1 p1 (cc _ _ (by simp) (by simp)),
    sw e2 p2 e2 p2 (cc _ _ (by simp) (by simp)), sw e2 p2 e3 p3 (cc _ _ (by simp) (by simp)),
    sw e3 p3 e1 p1 (cc _ _ (by simp) (by simp)), sw e3 p3 e2 p2 (cc _ _ (by simp) (by simp)),
    sw e3 p3 e3 p3 (cc _ _ (by simp) (by simp)), h11, h22, h33, h21, h32, h13]
  noncomm_ring

omit [Algebra k R] h33 in
/-- THE FULL TURN. Let r = e1 e2. It is the rotor of a half turn in the plane of e1 and e2: it reverses those two
directions and keeps the third. Its square, the full turn, is minus one. And the full turn returns every element
to itself. -/
theorem full_turn :
    (e1 * e2) * (e1 * e2) = -1
      ∧ (e1 * e2) * e1 * -(e1 * e2) = -e1 ∧ (e1 * e2) * e2 * -(e1 * e2) = -e2
      ∧ (e1 * e2) * e3 * -(e1 * e2) = e3
      ∧ ∀ x : R, ((e1 * e2) * (e1 * e2)) * x * ((e1 * e2) * (e1 * e2)) = x := by
  have rr : (e1 * e2) * (e1 * e2) = -1 := by
    calc (e1 * e2) * (e1 * e2) = e1 * (e2 * e1) * e2 := by noncomm_ring
      _ = -((e1 * e1) * (e2 * e2)) := by rw [h21]; noncomm_ring
      _ = -1 := by rw [h11, h22, mul_one]
  have t1 : (e1 * e2) * e1 = -e2 := by
    calc (e1 * e2) * e1 = e1 * (e2 * e1) := by noncomm_ring
      _ = -((e1 * e1) * e2) := by rw [h21]; noncomm_ring
      _ = -e2 := by rw [h11, one_mul]
  have t2 : (e1 * e2) * e2 = e1 := by rw [mul_assoc, h22, mul_one]
  have h31 : e3 * e1 = -(e1 * e3) := by rw [h13, neg_neg]
  have t3 : (e1 * e2) * e3 = e3 * (e1 * e2) := by
    calc (e1 * e2) * e3 = e1 * (e2 * e3) := by noncomm_ring
      _ = -(e1 * (e3 * e2)) := by rw [h32]; noncomm_ring
      _ = -((e1 * e3) * e2) := by noncomm_ring
      _ = (e3 * e1) * e2 := by rw [h13]; noncomm_ring
      _ = e3 * (e1 * e2) := by noncomm_ring
  refine ⟨rr, ?_, ?_, ?_, ?_⟩
  · rw [t1]
    calc -e2 * -(e1 * e2) = (e2 * e1) * e2 := by noncomm_ring
      _ = -(e1 * (e2 * e2)) := by rw [h21]; noncomm_ring
      _ = -e1 := by rw [h22, mul_one]
  · rw [t2]
    calc e1 * -(e1 * e2) = -((e1 * e1) * e2) := by noncomm_ring
      _ = -e2 := by rw [h11, one_mul]
  · rw [t3]
    calc e3 * (e1 * e2) * -(e1 * e2) = -(e3 * ((e1 * e2) * (e1 * e2))) := by noncomm_ring
      _ = e3 := by rw [rr]; noncomm_ring
  · intro x; rw [rr]; noncomm_ring

end Spin

/-- THE ROTOR OF THE LAW. Let a and b anticommute and each square to minus one, as two coefficients of space of the
law do. Their product squares to minus one, and it reverses a and b: it is the rotor of a half turn in their
plane, and its square, the full turn, is minus one. -/
theorem rotor_of_the_law {R : Type*} [Ring R] (a b : R) (ha : a * a = -1) (hb : b * b = -1)
    (hba : b * a = -(a * b)) :
    (a * b) * (a * b) = -1 ∧ (a * b) * a * -(a * b) = -a ∧ (a * b) * b * -(a * b) = -b := by
  have rr : (a * b) * (a * b) = -1 := by
    calc (a * b) * (a * b) = a * (b * a) * b := by noncomm_ring
      _ = -((a * a) * (b * b)) := by rw [hba]; noncomm_ring
      _ = -1 := by rw [ha, hb]; noncomm_ring
  have t1 : (a * b) * a = b := by
    calc (a * b) * a = a * (b * a) := by noncomm_ring
      _ = -((a * a) * b) := by rw [hba]; noncomm_ring
      _ = b := by rw [ha]; noncomm_ring
  have t2 : (a * b) * b = -a := by rw [mul_assoc, hb]; noncomm_ring
  refine ⟨rr, ?_, ?_⟩
  · rw [t1]
    calc b * -(a * b) = -((b * a) * b) := by noncomm_ring
      _ = a * (b * b) := by rw [hba]; noncomm_ring
      _ = -a := by rw [hb]; noncomm_ring
  · rw [t2]
    calc -a * -(a * b) = (a * a) * b := by noncomm_ring
      _ = -b := by rw [ha]; noncomm_ring

/-! ## Part VI. Exchange and statistics -/

/-- EXCLUSION. An amplitude that changes sign when its two arguments are exchanged vanishes where they are equal. -/
theorem exclusion {S V : Type*} [AddCommGroup V] (h2 : ∀ v : V, v + v = 0 → v = 0) (ψ : S → S → V)
    (h : ∀ x y, ψ x y = -ψ y x) (x : S) : ψ x x = 0 :=
  h2 _ (by have e := h x x; nth_rewrite 1 [e]; exact neg_add_cancel _)

/-- A WHOLE SPIN EXCLUDES NOTHING. An amplitude that keeps its sign under exchange need not vanish where its
arguments are equal. -/
theorem a_whole_spin_excludes_nothing : ∃ ψ : Unit → Unit → ℤ, (∀ x y, ψ x y = ψ y x) ∧ ψ () () ≠ 0 :=
  ⟨fun _ _ => 1, fun _ _ => rfl, one_ne_zero⟩

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

/-! ## Part VII. The premises, in one structure, and the theorems -/

/-- THE PREMISES OF THE PAPER. They are physics and are not proved.
    P1, least order. The law of a half-spin is of first order: an operator with matrix coefficients on n
        components, n at least one, whose square is the mass shell at every momentum. This is `first_order`.
    P2, the exchange is the turn. Two identical particles of the law have an amplitude on pairs of states, and
        exchanging the two multiplies it by the number by which the full turn acts on the components of the law,
        whatever that number is. This is `exchange`. The number is not entered: `the_forced_law_is_a_half_spin`
        proves it is minus one. -/
structure Premises (K : Type) [Field K] where
  n : ℕ
  pos : 0 < n
  γ : Fin 4 → Matrix (Fin n) (Fin n) K
  first_order : ∀ p : Fin 4 → K,
    slash γ p * slash γ p = algebraMap K (Matrix (Fin n) (Fin n) K) (shell eta p)
  State : Type
  amp : State → State → K
  exchange : ∀ c : K, (γ 1 * γ 2) * (γ 1 * γ 2) = c • (1 : Matrix (Fin n) (Fin n) K) →
    ∀ x y, amp x y = c * amp y x

variable {K : Type} [Field K]

/-- THE DIRAC LAW IS FORCED. On the premises the coefficients obey the Clifford relations. -/
theorem dirac_forced (P : Premises K) : Clifford P.γ (eta : Fin 4 → K) :=
  square_forces_the_relations P.γ eta P.first_order

/-- FOUR COMPONENTS AT THE LEAST. On the premises, where two is not zero, the law has at least four components. -/
theorem four_components (P : Premises K) (h2 : (2 : K) ≠ 0) : 4 ≤ P.n := by
  by_contra hlt
  have hc := dirac_forced P
  have am : ∀ r : K, algebraMap K (Matrix (Fin P.n) (Fin P.n) K) r = r • (1 : Matrix (Fin P.n) (Fin P.n) K) :=
    fun r => Algebra.algebraMap_eq_smul_one r
  refine four_is_the_least h2 P.pos (by omega) P.γ eta ?_ (fun μ => by rw [hc.1 μ, am]) hc.2
  intro μ
  fin_cases μ <;> simp [eta]

/-- THE FORCED LAW IS A HALF-SPIN. On the premises the product of the first two coefficients of space is the rotor
of a half turn, and the full turn is minus one on the components of the law. -/
theorem the_forced_law_is_a_half_spin (P : Premises K) :
    (P.γ 1 * P.γ 2) * (P.γ 1 * P.γ 2) = -1 ∧ (P.γ 1 * P.γ 2) * P.γ 1 * -(P.γ 1 * P.γ 2) = -P.γ 1
      ∧ (P.γ 1 * P.γ 2) * P.γ 2 * -(P.γ 1 * P.γ 2) = -P.γ 2 := by
  have hc := dirac_forced P
  have h1 : P.γ 1 * P.γ 1 = -1 := by rw [hc.1 1]; simp [eta]
  have h2 : P.γ 2 * P.γ 2 = -1 := by rw [hc.1 2]; simp [eta]
  exact rotor_of_the_law (P.γ 1) (P.γ 2) h1 h2 (eq_neg_of_add_eq_zero_left (hc.2 2 1 (by decide)))

/-- THE TWO SIGNS OF THE ENERGY BALANCE. On the premises, where two is not zero, the coefficient of the energy has
trace zero. Its square is one, so plus one and minus one occur equally among its values. -/
theorem the_two_signs_of_the_energy_balance (P : Premises K) (h2 : (2 : K) ≠ 0) :
    (P.γ 0).trace = 0 ∧ P.γ 0 * P.γ 0 = 1 := by
  have hc := dirac_forced P
  have h1 : P.γ 1 * P.γ 1 = (-1 : K) • (1 : Matrix (Fin P.n) (Fin P.n) K) := by
    rw [hc.1 1, Algebra.algebraMap_eq_smul_one]; simp [eta]
  refine ⟨trace_zero_of_anticommute h2 (P.γ 0) (P.γ 1) (-1) (by norm_num) h1 (hc.2 0 1 (by decide)), ?_⟩
  rw [hc.1 0]; simp [eta]

/-- EXCLUSION IS FORCED BY THE FULL TURN. On the premises, where two is not zero, the amplitude of two identical
particles of the law vanishes wherever the two share a state: the exchange carries the number of the full turn,
and that number is minus one. -/
theorem exclusion_forced (P : Premises K) (h2 : (2 : K) ≠ 0) (x : P.State) : P.amp x x = 0 := by
  have ht : (P.γ 1 * P.γ 2) * (P.γ 1 * P.γ 2) = (-1 : K) • (1 : Matrix (Fin P.n) (Fin P.n) K) := by
    rw [(the_forced_law_is_a_half_spin P).1, neg_one_smul]
  have hx := P.exchange (-1) ht
  exact exclusion (fun v hv => by
    have e : 2 * v = 0 := by linear_combination hv
    exact (mul_eq_zero.mp e).resolve_left h2) P.amp (fun a b => by rw [hx a b, neg_one_mul]) x

/-- THE PREMISES ARE MET: over any field with a square root of minus one in which two is not zero, by the model of Part IV and an amplitude
on two states that is not zero. -/
def diracPremises (i : K) (hi : i * i = -1) (h2 : (2 : K) ≠ 0) : Premises K where
  n := 4
  pos := by norm_num
  γ := gam i
  first_order := fun p =>
    relations_give_the_square (fun x hx => by
      have e : (2 : K) • x = 0 := by rw [two_smul]; exact hx
      exact (smul_eq_zero.mp e).resolve_left h2) (gam i) eta (model_clifford i hi) p
  State := Bool
  amp := fun x y => if x = y then 0 else if x then 1 else -1
  exchange := fun c hc x y => by
    have hcl := model_clifford i hi
    have h1 : gam i 1 * gam i 1 = -1 := by rw [hcl.1 1]; simp [eta]
    have h2' : gam i 2 * gam i 2 = -1 := by rw [hcl.1 2]; simp [eta]
    have rr := (rotor_of_the_law (gam i 1) (gam i 2) h1 h2'
      (eq_neg_of_add_eq_zero_left (hcl.2 2 1 (by decide)))).1
    rw [rr] at hc
    have e := congrFun (congrFun hc 0) 0
    simp at e
    have hc1 : c = -1 := by linear_combination -e
    subst hc1
    cases x <;> cases y <;> simp

/-- The complex numbers carry a square root of minus one, so the premises are inhabited. -/
noncomputable def diracPremisesComplex : Premises ℂ := diracPremises Complex.I Complex.I_mul_I two_ne_zero

end SPHYS.Matter
#print axioms SPHYS.Matter.square_forces_the_relations
#print axioms SPHYS.Matter.relations_give_the_square
#print axioms SPHYS.Matter.the_law_factorises
#print axioms SPHYS.Matter.no_numbers_take_the_square_root
#print axioms SPHYS.Matter.trace_zero_of_anticommute
#print axioms SPHYS.Matter.trace_mul_zero_of_anticommute
#print axioms SPHYS.Matter.no_two_in_odd_size
#print axioms SPHYS.Matter.no_four_in_size_two
#print axioms SPHYS.Matter.four_is_the_least
#print axioms SPHYS.Matter.model_squares
#print axioms SPHYS.Matter.model_anticommute
#print axioms SPHYS.Matter.model_clifford
#print axioms SPHYS.Matter.model_energy
#print axioms SPHYS.Matter.product_of_two_directions
#print axioms SPHYS.Matter.the_spin_term
#print axioms SPHYS.Matter.full_turn
#print axioms SPHYS.Matter.exclusion
#print axioms SPHYS.Matter.a_whole_spin_excludes_nothing
#print axioms SPHYS.Matter.a_sign_is_plus_or_minus_one
#print axioms SPHYS.Matter.two_statistics_and_no_third
#print axioms SPHYS.Matter.dirac_forced
#print axioms SPHYS.Matter.four_components
#print axioms SPHYS.Matter.exclusion_forced
#print axioms SPHYS.Matter.diracPremises
#print axioms SPHYS.Matter.diracPremisesComplex
#print axioms SPHYS.Matter.rotor_of_the_law
#print axioms SPHYS.Matter.the_forced_law_is_a_half_spin
#print axioms SPHYS.Matter.model_spin_commutes_with_energy
#print axioms SPHYS.Matter.the_two_signs_of_the_energy_balance
