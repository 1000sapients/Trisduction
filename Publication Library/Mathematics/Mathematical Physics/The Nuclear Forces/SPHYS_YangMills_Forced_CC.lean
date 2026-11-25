/-
SPHYS_YangMills_Forced_CC.lean · the Yang-Mills strength is forced by a charge that does not commute
RATIONALE. The engine of edition 1.0.0 proved its forcing over a structure of integers that carried the pieces of
  the strength as fields. This file replaces it. The charge is a Lie algebra, matter is a module over it, the
  potential is a family of charges, and the derivatives are derivations that commute. Nothing else is assumed.
  From these the file proves that two covariant derivatives differ by the strength, the Bianchi identity, the
  exact change of the strength under a turn of the charge, and that the strength turns as a charge on every
  setting only if the field couples to itself as it couples to matter.
DESIGN. Parts, in order.
    Part I    `Setting`: derivations of the charge and of matter that respect the bracket and commute.
              `strength`, `cov`, `Dad`. Proved: `curvature_on_matter`, `curvature_adjoint`, `bianchi`.
    Part II   A turn of the charge to first order. Proved: `dF_is_the_first_order_change`,
              `the_turn_keeps_the_derivative_of_matter`, `variation_of_strength`, the residue is (t - s) times
              one stray term; `variation_of_the_divergence`, the residue of the law's own term is (r - s) times one; `conservation_identity`; `the_source_is_covariantly_conserved`.
    Part III  Proved: `maxwell_is_the_commuting_half`, `maxwell_homogeneous`, `first_power_is_maxwell`,
              `a_mass_term_changes_under_a_turn`.
    Part IV   An explicit setting: triples of rational polynomials with the cross product, differentiated in one
              of two directions. Every law of a Lie algebra is proved, Jacobi included. `model_stray`: the stray
              term is not zero there. `model_mass`: nor is the change of a mass term.
    Part V    `covariance_on_every_setting_forces_the_self_coupling`; `covariance_on_every_setting_forces_the_law`;
              `Premises`; `yang_mills_forced`;
              `yangMillsPremises`: the structure is inhabited for every coupling.
    Part VI   The count of carriers, proved: the matrices of trace zero of size n have dimension n * n - 1.
    Part VII  Arithmetic on formulas that are cited and not derived here: phases, running, the unit of the
              coupling, the two measured counts of colour. Each theorem there is about the printed formula.
WHAT IS NOT PROVED HERE (read before citing).
    (a) That nature's nuclear charges are the Lie algebras su(3) and su(2). They are read from experiment.
    (b) The premise: the strength turns as a charge under a turn of the charge at every point. It is the field
        `covariant` of `Premises`.
    (c) The field equation is not derived from an action. Its left side is forced within the family d F + r [A, F];
        that the law is of that family and of second order is the premise. Part II proves what any source of the
        covariant divergence of the strength must satisfy.
    (d) The formulas of Part VII: the count of phases of the mixing matrix, the one-loop coefficient, the ratio R
        and the width of the neutral pion. They are classical and cited; only arithmetic on them is proved.
    (e) Part VI counts the matrices of trace zero over the rationals. That su(n) has the same dimension over the
        reals is the standard change of field and is not formalised.
RISK. First order in the turn. Coefficients of the forcing theorem are rational. No magnitude is derived.
NON-NEGOTIABLE. No axiom is declared, no sorry. No headline theorem closes over a structure that carries its
  conclusion. The kernel line of every theorem the paper names is printed at the end.
-/
import Mathlib.Algebra.Lie.Basic
import Mathlib.Tactic.Abel
import Mathlib.Tactic.Module
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Tactic.NormNum
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.FreeModule.Finite.Matrix
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.Data.Matrix.Basis

namespace SPHYS.Gauge

/-! ## Part I. A gauge setting, the strength, and its identities -/

/-- A gauge setting: a Lie algebra of charges over the constants k, a module of matter on which it acts, and
derivations of both that respect the bracket and commute. -/
structure Setting (k : Type*) [CommRing k] (ι : Type*) (𝔊 : Type*) [LieRing 𝔊] [LieAlgebra k 𝔊]
    (M : Type*) [AddCommGroup M] [Module k M] [LieRingModule 𝔊 M] [LieModule k 𝔊 M] where
  d : ι → 𝔊 →ₗ[k] 𝔊
  d_lie : ∀ μ X Y, d μ ⁅X, Y⁆ = ⁅d μ X, Y⁆ + ⁅X, d μ Y⁆
  d_comm : ∀ μ ν X, d μ (d ν X) = d ν (d μ X)
  dM : ι → M →ₗ[k] M
  dM_lie : ∀ μ (X : 𝔊) (m : M), dM μ ⁅X, m⁆ = ⁅d μ X, m⁆ + ⁅X, dM μ m⁆
  dM_comm : ∀ μ ν m, dM μ (dM ν m) = dM ν (dM μ m)

variable {k : Type*} [CommRing k] {ι : Type*} {𝔊 : Type*} [LieRing 𝔊] [LieAlgebra k 𝔊]
variable {M : Type*} [AddCommGroup M] [Module k M] [LieRingModule 𝔊 M] [LieModule k 𝔊 M]
variable (S : Setting k ι 𝔊 M)

/-- The strength of a potential A, with self-coupling t. -/
def strength (A : ι → 𝔊) (t : k) (μ ν : ι) : 𝔊 := S.d μ (A ν) - S.d ν (A μ) + t • ⁅A μ, A ν⁆

/-- The covariant derivative of matter, with coupling s. -/
def cov (A : ι → 𝔊) (s : k) (μ : ι) (m : M) : M := S.dM μ m + s • ⁅A μ, m⁆

/-- THE FIELD COUPLES TO ITSELF AS IT COUPLES TO MATTER. Two covariant derivatives of matter, taken in the two
orders, differ by the strength acting on the matter, and the strength that appears has self-coupling s. -/
theorem curvature_on_matter (A : ι → 𝔊) (s : k) (μ ν : ι) (m : M) :
    cov S A s μ (cov S A s ν m) - cov S A s ν (cov S A s μ m) = s • ⁅strength S A s μ ν, m⁆ := by
  unfold cov strength
  simp only [map_add, map_smul, S.dM_lie, lie_add, lie_smul, add_lie, sub_lie, smul_lie, lie_lie]
  rw [S.dM_comm μ ν m]
  module
/-- The strength is antisymmetric. -/
theorem strength_antisymm (A : ι → 𝔊) (t : k) (μ ν : ι) : strength S A t μ ν = - strength S A t ν μ := by
  unfold strength
  rw [← lie_skew (A μ) (A ν)]
  module

/-- The covariant derivative of a charge-valued field, with coupling s. -/
def Dad (A : ι → 𝔊) (s : k) (μ : ι) (X : 𝔊) : 𝔊 := S.d μ X + s • ⁅A μ, X⁆

theorem Dad_neg (A : ι → 𝔊) (s : k) (μ : ι) (X : 𝔊) : Dad S A s μ (-X) = - Dad S A s μ X := by
  unfold Dad
  simp only [map_neg, lie_neg, smul_neg]
  abel

/-- The same statement for a charge-valued field: two covariant derivatives differ by the bracket with the strength. -/
theorem curvature_adjoint (A : ι → 𝔊) (s : k) (μ ν : ι) (X : 𝔊) :
    Dad S A s μ (Dad S A s ν X) - Dad S A s ν (Dad S A s μ X) = s • ⁅strength S A s μ ν, X⁆ := by
  unfold Dad strength
  simp only [map_add, map_smul, S.d_lie, lie_add, lie_smul, add_lie, sub_lie, smul_lie, lie_lie]
  rw [S.d_comm μ ν X]
  module

/-- THE BIANCHI IDENTITY OF THE FIELD. The cyclic sum of the covariant derivative of the strength vanishes. It is the
Jacobi identity of the charge and nothing else. -/
theorem bianchi (A : ι → 𝔊) (s : k) (l μ ν : ι) :
    Dad S A s l (strength S A s μ ν) + Dad S A s μ (strength S A s ν l) + Dad S A s ν (strength S A s l μ) = 0 := by
  unfold Dad strength
  simp only [map_add, map_sub, map_smul, S.d_lie, lie_add, lie_sub, lie_smul]
  rw [S.d_comm μ l (A ν), S.d_comm ν l (A μ), S.d_comm ν μ (A l)]
  rw [(lie_skew (S.d l (A μ)) (A ν)).symm, (lie_skew (S.d μ (A ν)) (A l)).symm, (lie_skew (S.d ν (A l)) (A μ)).symm]
  have jac := lie_jacobi (A l) (A μ) (A ν)
  rw [eq_neg_of_add_eq_zero_right jac]
  module

/-! ## Part II. A turn of the charge, and what it does to the strength -/

/-- A turn of the charge by ε, to first order, with coupling s. -/
def dA (A : ι → 𝔊) (ε : 𝔊) (s : k) (μ : ι) : 𝔊 := S.d μ ε + s • ⁅A μ, ε⁆
/-- The change of the strength under that turn. -/
def dF (A : ι → 𝔊) (ε : 𝔊) (s t : k) (μ ν : ι) : 𝔊 :=
  S.d μ (dA S A ε s ν) - S.d ν (dA S A ε s μ) + t • (⁅dA S A ε s μ, A ν⁆ + ⁅A μ, dA S A ε s ν⁆)
/-- The term that does not turn with the strength. -/
def stray (A : ι → 𝔊) (ε : 𝔊) (μ ν : ι) : 𝔊 := ⁅S.d μ ε, A ν⁆ + ⁅A μ, S.d ν ε⁆

/-- THE RESIDUE IS ONE TERM. Under a turn with coupling s, a strength with self-coupling t changes by the bracket
with itself, plus (t - s) times one stray term. -/
theorem variation_of_strength (A : ι → 𝔊) (ε : 𝔊) (s t : k) (μ ν : ι) :
    dF S A ε s t μ ν - s • ⁅strength S A t μ ν, ε⁆ = (t - s) • stray S A ε μ ν := by
  unfold dF dA strength stray
  simp only [map_add, map_smul, S.d_lie, lie_add, lie_smul, add_lie, sub_lie, smul_lie, lie_lie,
    show ∀ X : 𝔊, ⁅ε, X⁆ = -⁅X, ε⁆ from fun X => (lie_skew ε X).symm, lie_neg, neg_lie]
  rw [S.d_comm μ ν ε, (lie_skew (S.d μ ε) (A ν)).symm]
  module
/-- THE CHANGE IS THE FIRST-ORDER CHANGE. `dF` is not entered: if the potential is moved by e times the turn, with
e * e = 0, the strength moves by e times `dF`. -/
theorem dF_is_the_first_order_change (A : ι → 𝔊) (ε : 𝔊) (s t e : k) (he : e * e = 0) (μ ν : ι) :
    strength S (fun l => A l + e • dA S A ε s l) t μ ν = strength S A t μ ν + e • dF S A ε s t μ ν := by
  unfold strength dF
  simp only [map_add, map_smul, add_lie, lie_add, smul_lie, lie_smul, smul_add, smul_smul, he, zero_smul,
    mul_zero, smul_zero, add_zero, smul_sub]
  module

/-- THE TURN OF THE POTENTIAL IS NOT CHOSEN. Let matter turn by -s [ε, m]. With the potential turned by `dA`, the
covariant derivative of matter turns as matter does: its first-order change is -s [ε, D m]. -/
theorem the_turn_keeps_the_derivative_of_matter (A : ι → 𝔊) (ε : 𝔊) (s : k) (μ : ι) (m : M) :
    S.dM μ (-(s • ⁅ε, m⁆)) + s • (⁅dA S A ε s μ, m⁆ + ⁅A μ, -(s • ⁅ε, m⁆)⁆) = -(s • ⁅ε, cov S A s μ m⁆) := by
  unfold dA cov
  simp only [map_neg, map_smul, S.dM_lie, lie_add, lie_neg, lie_smul, add_lie, smul_lie, lie_lie, smul_add,
    smul_neg, smul_smul]
  module

/-- The first-order change of the covariant derivative, with coupling r, of a charge-valued field X that changes
by δX, when the potential is turned. -/
def dDad (A : ι → 𝔊) (ε : 𝔊) (s r : k) (μ : ι) (X δX : 𝔊) : 𝔊 :=
  S.d μ δX + r • (⁅dA S A ε s μ, X⁆ + ⁅A μ, δX⁆)

/-- It is the first-order change. -/
theorem dDad_is_the_first_order_change (A : ι → 𝔊) (ε : 𝔊) (s r e : k) (he : e * e = 0) (μ : ι) (X δX : 𝔊) :
    Dad S (fun l => A l + e • dA S A ε s l) r μ (X + e • δX) = Dad S A r μ X + e • dDad S A ε s r μ X δX := by
  unfold Dad dDad
  simp only [map_add, map_smul, add_lie, lie_add, smul_lie, lie_smul, smul_add, smul_smul, he, zero_smul,
    mul_zero, smul_zero, add_zero]
  module

/-- THE LAW'S OWN TERM HAS ONE RESIDUE. Let X turn as a charge with coupling s. Its covariant derivative with
coupling r turns as a charge up to (r - s) times the bracket of the derivative of the turn with X. -/
theorem variation_of_the_divergence (A : ι → 𝔊) (ε : 𝔊) (s r : k) (μ : ι) (X : 𝔊) :
    dDad S A ε s r μ X (s • ⁅X, ε⁆) - s • ⁅Dad S A r μ X, ε⁆ = (r - s) • ⁅S.d μ ε, X⁆ := by
  unfold dDad dA Dad
  simp only [map_smul, S.d_lie, lie_add, lie_smul, add_lie, smul_lie, lie_lie, smul_add, smul_smul,
    show ∀ Y : 𝔊, ⁅ε, Y⁆ = -⁅Y, ε⁆ from fun Y => (lie_skew ε Y).symm, lie_neg, neg_lie, smul_neg]
  rw [(lie_skew (S.d μ ε) X).symm]
  module

/-- CONSERVATION IS AN IDENTITY. The covariant divergence of the covariant divergence of the strength vanishes, with
any signs η on the directions: the field's own current is conserved by the antisymmetry of the strength and the
bracket of a charge with itself. Stated as twice the divergence, so that no division is needed. -/
theorem conservation_identity [Fintype ι] (η : ι → k) (A : ι → 𝔊) (s : k) :
    (∑ ν, ∑ μ, (η ν * η μ) • Dad S A s ν (Dad S A s μ (strength S A s μ ν)))
      + (∑ ν, ∑ μ, (η ν * η μ) • Dad S A s ν (Dad S A s μ (strength S A s μ ν))) = 0 := by
  have key : ∀ μ ν, Dad S A s ν (Dad S A s μ (strength S A s μ ν))
      + Dad S A s μ (Dad S A s ν (strength S A s ν μ)) = 0 := by
    intro μ ν
    have c := curvature_adjoint S A s μ ν (strength S A s μ ν)
    rw [lie_self, smul_zero] at c
    rw [strength_antisymm S A s ν μ, Dad_neg, Dad_neg]
    rw [sub_eq_zero] at c
    rw [c]; abel
  nth_rewrite 2 [Finset.sum_comm]
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_eq_zero
  intro ν _
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_eq_zero
  intro μ _
  rw [mul_comm (η μ) (η ν), ← smul_add, key μ ν, smul_zero]

/-- THE SOURCE IS COVARIANTLY CONSERVED. If the covariant divergence of the strength equals a source J, then twice
the covariant divergence of J vanishes. The field equation is not assumed to come from anything. -/
theorem the_source_is_covariantly_conserved [Fintype ι] (η : ι → k) (A : ι → 𝔊) (s : k) (J : ι → 𝔊)
    (h : ∀ ν, ∑ μ, η μ • Dad S A s μ (strength S A s μ ν) = J ν) :
    (∑ ν, η ν • Dad S A s ν (J ν)) + (∑ ν, η ν • Dad S A s ν (J ν)) = 0 := by
  have hD : ∀ ν (X Y : 𝔊), Dad S A s ν (X + Y) = Dad S A s ν X + Dad S A s ν Y := by
    intro ν X Y; unfold Dad; simp only [map_add, lie_add, smul_add]; abel
  have hDs : ∀ ν (c : k) (X : 𝔊), Dad S A s ν (c • X) = c • Dad S A s ν X := by
    intro ν c X; unfold Dad; simp only [map_smul, lie_smul, smul_add]; rw [smul_comm s c]
  have hDsum : ∀ ν (f : ι → 𝔊), Dad S A s ν (∑ μ, f μ) = ∑ μ, Dad S A s ν (f μ) := by
    intro ν f
    have h0 : Dad S A s ν 0 = 0 := by unfold Dad; simp
    exact map_sum (AddMonoidHom.mk' (Dad S A s ν) (hD ν)) f Finset.univ
  have e : ∀ ν, η ν • Dad S A s ν (J ν) = ∑ μ, (η ν * η μ) • Dad S A s ν (Dad S A s μ (strength S A s μ ν)) := by
    intro ν
    rw [← h ν, hDsum, Finset.smul_sum]
    apply Finset.sum_congr rfl
    intro μ _
    rw [hDs, smul_smul]
  simp only [e]
  exact conservation_identity S η A s

/-! ## Part III. The commuting half, the first power, and the mass term -/

/-- Where the charge commutes, the strength is Maxwell's: the self-coupling drops out, whatever it is. -/
theorem maxwell_is_the_commuting_half (hab : ∀ X Y : 𝔊, ⁅X, Y⁆ = 0) (A : ι → 𝔊) (t : k) (μ ν : ι) :
    strength S A t μ ν = S.d μ (A ν) - S.d ν (A μ) := by
  unfold strength; rw [hab, smul_zero, add_zero]

/-- A commuting strength does not change under a turn, and the stray term is absent. -/
theorem a_commuting_charge_forces_nothing (hab : ∀ X Y : 𝔊, ⁅X, Y⁆ = 0) (A : ι → 𝔊) (ε : 𝔊) (s t : k) (μ ν : ι) :
    dF S A ε s t μ ν = 0 ∧ stray S A ε μ ν = 0 := by
  unfold dF dA stray
  simp only [hab, smul_zero, add_zero]
  rw [S.d_comm μ ν ε]
  exact ⟨sub_self _, trivial⟩

/-- Maxwell's homogeneous equations: the cyclic sum of the derivative of a commuting strength vanishes. -/
theorem maxwell_homogeneous (hab : ∀ X Y : 𝔊, ⁅X, Y⁆ = 0) (A : ι → 𝔊) (t : k) (l μ ν : ι) :
    S.d l (strength S A t μ ν) + S.d μ (strength S A t ν l) + S.d ν (strength S A t l μ) = 0 := by
  have b := bianchi S A t l μ ν
  unfold Dad at b
  simp only [hab, smul_zero, add_zero] at b
  exact b

/-- TO THE FIRST POWER OF THE POTENTIAL THE STRENGTH IS MAXWELL'S. If the potential is e times a, with e * e = 0,
the self-coupling does not appear: each component of the charge obeys Maxwell's form. -/
theorem first_power_is_maxwell (a : ι → 𝔊) (e t : k) (he : e * e = 0) (μ ν : ι) :
    strength S (fun l => e • a l) t μ ν = e • (S.d μ (a ν) - S.d ν (a μ)) := by
  unfold strength
  simp only [map_smul, smul_lie, lie_smul, smul_smul, he, mul_zero, zero_smul, smul_zero, add_zero, smul_sub]

/-- A MASS TERM CHANGES UNDER A TURN. Let B be a symmetric form on the charge that the bracket preserves. Under a
turn, B(A, A) changes by twice B(A, dε): the part of the turn that is a bracket drops out and the derivative of
the turn stays. So a term B(A, A) in the law is not kept by a turn unless that pairing vanishes. -/
theorem a_mass_term_changes_under_a_turn {N : Type*} [AddCommGroup N] [Module k N] (B : 𝔊 → 𝔊 → N)
    (B_add : ∀ x y z, B x (y + z) = B x y + B x z) (B_smul : ∀ (c : k) x y, B x (c • y) = c • B x y)
    (B_symm : ∀ x y, B x y = B y x) (B_inv : ∀ x y z : 𝔊, B x ⁅y, z⁆ = B ⁅x, y⁆ z) (A : ι → 𝔊) (ε : 𝔊) (s : k)
    (μ : ι) :
    B (A μ) (dA S A ε s μ) = B (A μ) (S.d μ ε) := by
  unfold dA
  rw [B_add, B_smul, B_inv, lie_self]
  have z : B 0 ε = 0 := by
    have h := B_add ε 0 0
    rw [add_zero] at h
    rw [B_symm]; exact left_eq_add.mp h
  rw [z, smul_zero, add_zero]


/-! ## Part IV. A setting whose charge does not commute
    The charge is a triple of rational polynomials with the cross product, the Lie algebra of rotations. There
    are two directions: the first differentiates the polynomials and the second does nothing. Matter is the
    charge itself. Every law is proved. -/

noncomputable section Witness
open Polynomial

/-- The charges of the model. -/
def C3 := ℚ[X] × ℚ[X] × ℚ[X]

instance : AddCommGroup C3 := inferInstanceAs (AddCommGroup (ℚ[X] × ℚ[X] × ℚ[X]))
instance : Module ℚ C3 := inferInstanceAs (Module ℚ (ℚ[X] × ℚ[X] × ℚ[X]))

theorem C3.ext {p q : C3} (h1 : p.1 = q.1) (h2 : p.2.1 = q.2.1) (h3 : p.2.2 = q.2.2) : p = q :=
  Prod.ext h1 (Prod.ext h2 h3)
theorem C3.add_1 (p q : C3) : (p + q).1 = p.1 + q.1 := rfl
theorem C3.add_2 (p q : C3) : (p + q).2.1 = p.2.1 + q.2.1 := rfl
theorem C3.add_3 (p q : C3) : (p + q).2.2 = p.2.2 + q.2.2 := rfl
theorem C3.zero_1 : (0 : C3).1 = 0 := rfl
theorem C3.zero_2 : (0 : C3).2.1 = 0 := rfl
theorem C3.zero_3 : (0 : C3).2.2 = 0 := rfl
theorem C3.smul_1 (c : ℚ) (p : C3) : (c • p).1 = c • p.1 := rfl
theorem C3.smul_2 (c : ℚ) (p : C3) : (c • p).2.1 = c • p.2.1 := rfl
theorem C3.smul_3 (c : ℚ) (p : C3) : (c • p).2.2 = c • p.2.2 := rfl

/-- The bracket of the model: the cross product. -/
def cr (p q : C3) : C3 :=
  (p.2.1 * q.2.2 - p.2.2 * q.2.1, p.2.2 * q.1 - p.1 * q.2.2, p.1 * q.2.1 - p.2.1 * q.1)

theorem cr_1 (p q : C3) : (cr p q).1 = p.2.1 * q.2.2 - p.2.2 * q.2.1 := rfl
theorem cr_2 (p q : C3) : (cr p q).2.1 = p.2.2 * q.1 - p.1 * q.2.2 := rfl
theorem cr_3 (p q : C3) : (cr p q).2.2 = p.1 * q.2.1 - p.2.1 * q.1 := rfl

instance : LieRing C3 :=
  { (inferInstance : AddCommGroup C3) with
    bracket := cr
    add_lie := fun x y z => by
      apply C3.ext <;> simp only [cr_1, cr_2, cr_3, C3.add_1, C3.add_2, C3.add_3] <;> ring
    lie_add := fun x y z => by
      apply C3.ext <;> simp only [cr_1, cr_2, cr_3, C3.add_1, C3.add_2, C3.add_3] <;> ring
    lie_self := fun x => by
      apply C3.ext <;> simp only [cr_1, cr_2, cr_3, C3.zero_1, C3.zero_2, C3.zero_3] <;> ring
    leibniz_lie := fun x y z => by
      apply C3.ext <;> simp only [cr_1, cr_2, cr_3, C3.add_1, C3.add_2, C3.add_3] <;> ring }

theorem lie_eq3 (p q : C3) : ⁅p, q⁆ = cr p q := rfl

instance : LieAlgebra ℚ C3 :=
  { (inferInstance : Module ℚ C3) with
    lie_smul := fun c x y => by
      rw [lie_eq3, lie_eq3]
      apply C3.ext <;>
        simp only [cr_1, cr_2, cr_3, C3.smul_1, C3.smul_2, C3.smul_3, mul_smul_comm, smul_sub] }

/-- The derivative of the model, on each of the three polynomials. -/
def dC : C3 →ₗ[ℚ] C3 :=
  { toFun := fun p => (derivative p.1, derivative p.2.1, derivative p.2.2)
    map_add' := fun p q => by
      apply C3.ext <;> simp only [C3.add_1, C3.add_2, C3.add_3, map_add]
    map_smul' := fun c p => by
      apply C3.ext <;> simp only [C3.smul_1, C3.smul_2, C3.smul_3, derivative_smul, RingHom.id_apply] }

theorem dC_1 (p : C3) : (dC p).1 = derivative p.1 := rfl
theorem dC_2 (p : C3) : (dC p).2.1 = derivative p.2.1 := rfl
theorem dC_3 (p : C3) : (dC p).2.2 = derivative p.2.2 := rfl

theorem dC_lie (X Y : C3) : dC ⁅X, Y⁆ = ⁅dC X, Y⁆ + ⁅X, dC Y⁆ := by
  simp only [lie_eq3]
  apply C3.ext <;>
    simp only [cr_1, cr_2, cr_3, dC_1, dC_2, dC_3, C3.add_1, C3.add_2, C3.add_3, map_sub, derivative_mul] <;> ring

/-- The model: two directions, the first a derivative and the second nothing; matter is the charge. -/
def model : Setting ℚ Bool C3 C3 where
  d := fun b => if b then 0 else dC
  d_lie := fun b X Y => by
    cases b
    · simpa using dC_lie X Y
    · simp
  d_comm := fun b c X => by cases b <;> cases c <;> simp
  dM := fun b => if b then 0 else dC
  dM_lie := fun b X m => by
    cases b
    · simpa using dC_lie X m
    · simp
  dM_comm := fun b c m => by cases b <;> cases c <;> simp

/-- The probe: a potential along the second direction and a turn that grows along the first. -/
def probeA : Bool → C3 := fun b => if b then (0, 1, 0) else (1, 0, 0)
def probeE : C3 := (X, 0, 0)

/-- THE STRAY TERM IS NOT ZERO ON THE MODEL: its third component is one. -/
theorem model_stray : (stray model probeA probeE false true).2.2 = 1 := by
  unfold stray model probeA probeE
  simp [lie_eq3, cr_3, dC_1, dC_2, dC_3, C3.add_3, C3.zero_1, C3.zero_2, C3.zero_3]

/-- THE RESIDUE OF THE LAW'S OWN TERM IS NOT ZERO ON THE MODEL: its third component is one. -/
theorem model_divergence : (⁅model.d false probeE, probeA true⁆ : C3).2.2 = 1 := by
  unfold model probeA probeE
  simp [lie_eq3, cr_3, dC_1, dC_2, dC_3]

/-- THE FIELD IS ITS OWN SOURCE ON THE MODEL. With the potential (X, 0, 0) along the first direction and (0, 1, 0)
along the second, the bracket of the potential with the strength is not zero: its second component is -X². -/
def selfA : Bool → C3 := fun b => if b then (0, 1, 0) else (X, 0, 0)
theorem the_field_is_its_own_source_on_the_model :
    (⁅selfA false, strength model selfA 1 false true⁆ : C3).2.1 = -(X * X) := by
  unfold strength model selfA
  simp [lie_eq3, cr_1, cr_2, cr_3, dC_1, dC_2, dC_3, C3.add_1, C3.add_2, C3.add_3, C3.smul_1, C3.smul_2,
    C3.smul_3, C3.zero_1, C3.zero_2, C3.zero_3]

/-- The dot product of two charges of the model, which the cross product preserves. -/
def dot (p q : C3) : ℚ[X] := p.1 * q.1 + p.2.1 * q.2.1 + p.2.2 * q.2.2

theorem dot_inv (x y z : C3) : dot x ⁅y, z⁆ = dot ⁅x, y⁆ z := by
  simp only [dot, lie_eq3, cr_1, cr_2, cr_3]; ring

/-- A MASS TERM IS NOT KEPT ON THE MODEL: the pairing of the potential with the derivative of the turn is one. -/
theorem model_mass : dot (probeA false) (model.d false probeE) = 1 := by
  unfold dot model probeA probeE
  simp [dC_1, dC_2, dC_3]

end Witness

/-! ## Part V. Covariance on every setting forces the self-coupling -/

/-- COVARIANCE ON EVERY SETTING FORCES THE SELF-COUPLING. Let s and t be rational. If on every setting, for every
potential and every turn, the strength with self-coupling t turns as a charge with coupling s, then t = s. No
hypothesis on any setting is left: the setting of Part IV is the one on which every other value fails. -/
theorem covariance_on_every_setting_forces_the_self_coupling (s t : ℚ)
    (h : ∀ (ι : Type) (𝔊 : Type) [LieRing 𝔊] [LieAlgebra ℚ 𝔊] (M : Type) [AddCommGroup M] [Module ℚ M]
        [LieRingModule 𝔊 M] [LieModule ℚ 𝔊 M] (S : Setting ℚ ι 𝔊 M) (A : ι → 𝔊) (ε : 𝔊) (μ ν : ι),
        dF S A ε s t μ ν = s • ⁅strength S A t μ ν, ε⁆) :
    t = s := by
  have v := variation_of_strength model probeA probeE s t false true
  rw [h Bool C3 C3 model probeA probeE false true, sub_self] at v
  have v3 := congrArg (fun p : C3 => p.2.2) v.symm
  simp only [C3.smul_3, model_stray, C3.zero_3] at v3
  have e := congrArg (fun p : Polynomial ℚ => p.coeff 0) v3
  simp only [Polynomial.coeff_smul, Polynomial.coeff_one_zero, smul_eq_mul, mul_one, Polynomial.coeff_zero] at e
  linarith

/-- COVARIANCE OF THE LAW ON EVERY SETTING FORCES ITS OWN TERM. Let s and r be rational. If on every setting the
covariant derivative with coupling r of every field that turns as a charge turns as a charge, then r = s. -/
theorem covariance_on_every_setting_forces_the_law (s r : ℚ)
    (h : ∀ (ι : Type) (𝔊 : Type) [LieRing 𝔊] [LieAlgebra ℚ 𝔊] (M : Type) [AddCommGroup M] [Module ℚ M]
        [LieRingModule 𝔊 M] [LieModule ℚ 𝔊 M] (S : Setting ℚ ι 𝔊 M) (A : ι → 𝔊) (ε : 𝔊) (μ : ι) (X : 𝔊),
        dDad S A ε s r μ X (s • ⁅X, ε⁆) = s • ⁅Dad S A r μ X, ε⁆) :
    r = s := by
  have v := variation_of_the_divergence model probeA probeE s r false (probeA true)
  rw [h Bool C3 C3 model probeA probeE false (probeA true), sub_self] at v
  have v3 := congrArg (fun p : C3 => p.2.2) v.symm
  simp only [C3.smul_3, model_divergence, C3.zero_3] at v3
  have e := congrArg (fun p : Polynomial ℚ => p.coeff 0) v3
  simp only [Polynomial.coeff_smul, Polynomial.coeff_one_zero, smul_eq_mul, mul_one, Polynomial.coeff_zero] at e
  linarith

/-- THE PREMISES OF THE PAPER. They are physics and are not proved.
    P1. The form. The field has a strength d A - d A + t [A, A]; matter is moved by d + s [A, ·]; the law of the
        field is built from d F + r [A, F]. Three constants, independent.
    P2. The strength turns as a charge under a turn of the charge at every point, on every setting: the kinds of
        charge may be named afresh at every point and the law keeps its form. This is the field `covariant`.
    P3. The same for the law's own term: the field `covariant_law`. -/
structure Premises where
  s : ℚ
  t : ℚ
  r : ℚ
  covariant : ∀ (ι : Type) (𝔊 : Type) [LieRing 𝔊] [LieAlgebra ℚ 𝔊] (M : Type) [AddCommGroup M] [Module ℚ M]
      [LieRingModule 𝔊 M] [LieModule ℚ 𝔊 M] (S : Setting ℚ ι 𝔊 M) (A : ι → 𝔊) (ε : 𝔊) (μ ν : ι),
      dF S A ε s t μ ν = s • ⁅strength S A t μ ν, ε⁆
  covariant_law : ∀ (ι : Type) (𝔊 : Type) [LieRing 𝔊] [LieAlgebra ℚ 𝔊] (M : Type) [AddCommGroup M] [Module ℚ M]
      [LieRingModule 𝔊 M] [LieModule ℚ 𝔊 M] (S : Setting ℚ ι 𝔊 M) (A : ι → 𝔊) (ε : 𝔊) (μ : ι) (X : 𝔊),
      dDad S A ε s r μ X (s • ⁅X, ε⁆) = s • ⁅Dad S A r μ X, ε⁆

/-- THE YANG-MILLS STRENGTH AND LAW ARE FORCED. On the premises the field couples to itself exactly as it couples
to matter, in its strength and in its law. The coupling s is not fixed. -/
theorem yang_mills_forced (P : Premises) : P.t = P.s ∧ P.r = P.s :=
  ⟨covariance_on_every_setting_forces_the_self_coupling P.s P.t P.covariant,
   covariance_on_every_setting_forces_the_law P.s P.r P.covariant_law⟩

/-- On the premises, the strength is the one that two covariant derivatives of matter produce. -/
theorem the_forced_strength_is_the_curvature (P : Premises) {ι : Type} {𝔊 : Type} [LieRing 𝔊] [LieAlgebra ℚ 𝔊]
    {M : Type} [AddCommGroup M] [Module ℚ M] [LieRingModule 𝔊 M] [LieModule ℚ 𝔊 M] (S : Setting ℚ ι 𝔊 M)
    (A : ι → 𝔊) (μ ν : ι) (m : M) :
    cov S A P.s μ (cov S A P.s ν m) - cov S A P.s ν (cov S A P.s μ m) = P.s • ⁅strength S A P.t μ ν, m⁆ := by
  rw [(yang_mills_forced P).1]; exact curvature_on_matter S A P.s μ ν m

/-- THE PREMISES ARE MET FOR EVERY COUPLING: the Yang-Mills strength and law with any s are a member. -/
def yangMillsPremises (s : ℚ) : Premises where
  s := s
  t := s
  r := s
  covariant := fun ι 𝔊 _ _ M _ _ _ _ S A ε μ ν => by
    have v := variation_of_strength S A ε s s μ ν
    rw [sub_self, zero_smul, sub_eq_zero] at v
    exact v
  covariant_law := fun ι 𝔊 _ _ M _ _ _ _ S A ε μ X => by
    have v := variation_of_the_divergence S A ε s s μ X
    rw [sub_self, zero_smul, sub_eq_zero] at v
    exact v

/-! ## Part VI. The count of carriers
    The charges of n colours are the matrices of size n with trace zero. Their number is n * n - 1. -/

open Module in
/-- THE MATRICES OF TRACE ZERO OF SIZE n HAVE DIMENSION n * n - 1, for n at least one. -/
theorem traceless_dimension (n : ℕ) (hn : 0 < n) :
    finrank ℚ (LinearMap.ker (Matrix.traceLinearMap (Fin n) ℚ ℚ)) + 1 = n * n := by
  have hs : Function.Surjective (Matrix.traceLinearMap (Fin n) ℚ ℚ) := by
    intro c
    refine ⟨Matrix.stdBasisMatrix ⟨0, hn⟩ ⟨0, hn⟩ c, ?_⟩
    simp [Matrix.traceLinearMap_apply, Matrix.trace, Matrix.stdBasisMatrix, Finset.sum_ite_eq']
  have hr := LinearMap.finrank_range_add_finrank_ker (Matrix.traceLinearMap (Fin n) ℚ ℚ)
  rw [LinearMap.range_eq_top.mpr hs, finrank_top, finrank_self, Module.finrank_matrix] at hr
  simp at hr
  omega

/-- Eight gluons: three colours. -/
theorem eight_gluons : Module.finrank ℚ (LinearMap.ker (Matrix.traceLinearMap (Fin 3) ℚ ℚ)) = 8 := by
  have h := traceless_dimension 3 (by norm_num); omega
/-- Three weak carriers: two kinds of weak charge. -/
theorem three_weak_carriers : Module.finrank ℚ (LinearMap.ker (Matrix.traceLinearMap (Fin 2) ℚ ℚ)) = 3 := by
  have h := traceless_dimension 2 (by norm_num); omega

/-! ## Part VII. Arithmetic on cited formulas
    Each definition below is a classical formula entered from the literature. The theorems are arithmetic on it
    and claim nothing about where the formula comes from. -/

/-- CITED: the number of phases of a mixing matrix of n generations that no renaming removes. -/
def phases (n : ℕ) : ℕ := (n - 1) * (n - 2) / 2

theorem three_is_the_least_with_a_phase (n : ℕ) : 1 ≤ phases n ↔ 3 ≤ n := by
  unfold phases
  constructor
  · intro h
    by_contra hc
    have : n = 0 ∨ n = 1 ∨ n = 2 := by omega
    rcases this with rfl | rfl | rfl <;> simp at h
  · intro h
    obtain ⟨m, rfl⟩ : ∃ m, n = m + 3 := ⟨n - 3, by omega⟩
    have e : (m + 3 - 1) * (m + 3 - 2) = (m + 2) * (m + 1) := by
      have a : m + 3 - 1 = m + 2 := by omega
      have b : m + 3 - 2 = m + 1 := by omega
      rw [a, b]
    rw [e]
    have : 2 ≤ (m + 2) * (m + 1) := by nlinarith
    omega

/-- CITED: the sign of the one-loop running, 11 c - 2 f, for a charge of c colours with f flavours. -/
def running (c f : ℤ) : ℤ := 11 * c - 2 * f

theorem free_exactly_up_to_sixteen (f : ℤ) : 0 < running 3 f ↔ f ≤ 16 := by unfold running; omega
theorem a_commuting_charge_is_never_free (f : ℤ) (hf : 0 < f) : running 0 f < 0 := by unfold running; omega
theorem freedom_needs_a_charge_that_does_not_commute (c f : ℤ) (hf : 0 ≤ f) (h : 0 < running c f) : 0 < c := by
  unfold running at h; omega

/-- CITED: twice the dimension of the coupling in units of mass, in n dimensions of spacetime. -/
def couplingDimension (n : ℤ) : ℤ := 4 - n

theorem the_coupling_is_a_pure_number_exactly_in_four (n : ℤ) : couplingDimension n = 0 ↔ n = 4 := by
  unfold couplingDimension; omega

/-- CITED: nine times the ratio of hadrons to muon pairs below the charm threshold, for n colours: the squares
of the charges of three quarks, 4 + 1 + 1, counted once for each colour. -/
def ratio9 (n : ℕ) : ℕ := n * (4 + 1 + 1)

theorem the_ratio_counts_the_colours (n : ℕ) : ratio9 n = 2 * 9 ↔ n = 3 := by unfold ratio9; omega

end SPHYS.Gauge

#print axioms SPHYS.Gauge.curvature_on_matter
#print axioms SPHYS.Gauge.curvature_adjoint
#print axioms SPHYS.Gauge.bianchi
#print axioms SPHYS.Gauge.variation_of_strength
#print axioms SPHYS.Gauge.conservation_identity
#print axioms SPHYS.Gauge.the_source_is_covariantly_conserved
#print axioms SPHYS.Gauge.maxwell_is_the_commuting_half
#print axioms SPHYS.Gauge.a_commuting_charge_forces_nothing
#print axioms SPHYS.Gauge.maxwell_homogeneous
#print axioms SPHYS.Gauge.first_power_is_maxwell
#print axioms SPHYS.Gauge.a_mass_term_changes_under_a_turn
#print axioms SPHYS.Gauge.model_stray
#print axioms SPHYS.Gauge.model_mass
#print axioms SPHYS.Gauge.covariance_on_every_setting_forces_the_self_coupling
#print axioms SPHYS.Gauge.yang_mills_forced
#print axioms SPHYS.Gauge.the_forced_strength_is_the_curvature
#print axioms SPHYS.Gauge.yangMillsPremises
#print axioms SPHYS.Gauge.traceless_dimension
#print axioms SPHYS.Gauge.eight_gluons
#print axioms SPHYS.Gauge.three_weak_carriers
#print axioms SPHYS.Gauge.three_is_the_least_with_a_phase
#print axioms SPHYS.Gauge.free_exactly_up_to_sixteen
#print axioms SPHYS.Gauge.a_commuting_charge_is_never_free
#print axioms SPHYS.Gauge.freedom_needs_a_charge_that_does_not_commute
#print axioms SPHYS.Gauge.the_coupling_is_a_pure_number_exactly_in_four
#print axioms SPHYS.Gauge.the_ratio_counts_the_colours
#print axioms SPHYS.Gauge.dF_is_the_first_order_change
#print axioms SPHYS.Gauge.the_turn_keeps_the_derivative_of_matter
#print axioms SPHYS.Gauge.dDad_is_the_first_order_change
#print axioms SPHYS.Gauge.variation_of_the_divergence
#print axioms SPHYS.Gauge.model_divergence
#print axioms SPHYS.Gauge.the_field_is_its_own_source_on_the_model
#print axioms SPHYS.Gauge.covariance_on_every_setting_forces_the_law
