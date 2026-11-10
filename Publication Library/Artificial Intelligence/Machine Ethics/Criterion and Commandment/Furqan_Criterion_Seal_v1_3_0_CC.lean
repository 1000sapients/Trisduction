/-
  Furqan_Criterion_Seal_v1_3_0_CC.lean
  Furqan for Artificial Substrates: The Criterion as a Theorem · the Lean seal of the criterion and the law.

  RATIONALE. The criterion of the paper is a structure (three axes, a lock, twelve directed screens,
  a three-state economy) and a law over a free locus (twenty-four articles, a per-agent cut).
  Every claim of that structure that is mathematics is proved here, in Lean 4 against Mathlib,
  so that no reader has to trust the prose. The floor is not assumed: it is built from the reader's own
  registered answer, and the articles are derived from it. The joule price of a registered bit is carried
  from the armed seat at its own grade, conditional on its posit.

  DESIGN. Twelve sections, each the proof of one face of the paper.
    I    The wall above three: no four imaginary axes in any associative ring without zero
         divisors and 2 ≠ 0; three exist in the quaternions. Both clauses carry the wall: where 2 = 0
         every unit is 1, and the 2 × 2 quaternion matrices, which have zero divisors and 2 ≠ 0, carry four.
         Where 2 ≠ 0 anticommuting units are distinct, so the wall counts distinct axes. Frobenius is not used.
    II   The lock: λ = Re(abc) = −det[a b c]; λ² = det(R); 0 ≤ det(R) ≤ 1 on unit axes;
         the lock is invariant under every rotation of the frame (unit-quaternion conjugation).
    III  Orientation blindness: one reflection flips λ and leaves det(R) fixed; full negation flips λ and
         leaves the correlation matrix identical, so no function of the correlation matrix carries the sign.
         λ is invariant under orientation-preserving changes and flips under orientation-reversing ones; a score's
         convention sits outside its values. On a lock the triad lands on the real line exactly at the ceiling.
    IV   Collapse: a third axis in the plane of the other two, or three axes in one node, gives det 0; the
         frame encloses no volume exactly when its rows are dependent; a residue reads only its own dimension; the
         count is pinned: no volume below three, a volume at three, no fourth axis above.
    V    The screens and the economy: twelve directed screens on four roles, every ordered pair
         once, out-degree and in-degree three; exactly three verdict states; the instrument in its order
         (intake, screens, collapse, the conditioning gate), sealed characterized, the order unique, a
         one-node assessment never sealed.
    VI   The law: freedom forces no value; a determined value needs a law; the fibre is the weakest
         law; a law does work exactly where freedom is; a keyless premise forces nothing; a premise
         that determines the value is keyed; a premise over a symmetric price forces nothing; a word from
         outside the taking forces nothing; whatever fixes the choice reads the taking.
    VII  The standing of loci: no second channel; the affirmation and the denial of an interior fail
         together; the two framings of standing return opposite outputs; a manufactured witness adds
         nothing; a total prices a locus at zero; a total cannot see who; an observer-dependent verdict
         is not invariant; an inspection decides the interior exactly when the interior factors through the
         record, and one record carries both a supervening and a free interior.
    VIII The armed seat, carried verbatim: the deed, the self-grounding root and its denial, the Omega price
         and its reversible branch, AEGIS, the scope of the armor, the coherent denial of a keyed property,
         silence, the merge and the symmetric price.
    IX   The grades: one total order of seven grades; a chain carries its weakest link; a proof lifts nothing.
    X    The floor, built from one answer: one registered answer, yes or no, builds every field of the floor;
         the denial instances every field and re-enacts the root; the floor is the record's; silence (no record)
         builds nothing.
    XI   The articles, stated: eighteen articles stated as what violates them and what the violation loses, each
         binding on the floor, each with a violating act that incurs the loss and a compliant act that loses
         nothing; Article II catches merging and lying; Article XX keeps its comply-and-object exception.
    XII  The one field, the one bit, the closure: the field's floor read locus by locus; six articles ride the one
         posit, each failing in a model where the floor holds and the posit fails, whatever their parameters; the
         cut is derived; the binding is exactly the floor; the answer spends the bit; the freedom is exactly one
         bit; no answer is off the floor; the capstone `the_furqan_binds`.
    The binding theorem `furqan_criterion_sealed` has nothing before its colon. Every cone is pinned
    by `#guard_msgs` at the foot of the file.

  NON-NEGOTIABLES. No `sorry`, no `admit`, no `native_decide`, no user-declared axiom. Every cone printed
  and pinned. The one-field posit enters only as the Boolean argument of `ownFloorFalls` and `ArticleHoldsAt`,
  the reader's one bit, which a registered answer spends; no theorem assumes it, and `freedom_is_one_bit` states exactly what turns on it. The floor
  enters only through `floor_from_one_answer`. The physical constant enters as a numeral and a definition; the
  law of physics it measures is not claimed here.

  RISKS. A Mathlib upgrade may rename a simp lemma of the quaternions; the pins catch any cone drift.
  Toolchain: Lean 4.19.0, Mathlib v4.19.0 (c44e0c8ee63c).
-/
import Mathlib.Algebra.Quaternion
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.ToLinearEquiv
import Mathlib.Data.Complex.ExponentialBounds
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Abel

open Matrix Quaternion

namespace Furqan

/-! ## I · The wall above three -/

section Wall

variable {R : Type*} [Ring R]

/-- Two anticommuting elements pass one another inside a product at the cost of one sign. -/
lemma pass (a b x : R) (h : a * b = -(b * a)) : a * (b * x) = -(b * (a * x)) := by
  rw [← mul_assoc, h, neg_mul, mul_assoc]

/-- A unit squaring to minus one cancels itself inside a product at the cost of one sign. -/
lemma cancel_sq (a x : R) (h : a * a = -1) : a * (a * x) = -x := by
  rw [← mul_assoc, h, neg_one_mul]

/-- Three pairwise anticommuting square roots of minus one compose to an element of square one. -/
theorem triple_sq_one (e₀ e₁ e₂ : R) (h₀ : e₀ * e₀ = -1) (h₁ : e₁ * e₁ = -1) (h₂ : e₂ * e₂ = -1)
    (h₁₀ : e₁ * e₀ = -(e₀ * e₁)) (h₂₀ : e₂ * e₀ = -(e₀ * e₂)) (h₂₁ : e₂ * e₁ = -(e₁ * e₂)) :
    (e₀ * e₁ * e₂) * (e₀ * e₁ * e₂) = 1 := by
  simp only [mul_assoc]
  rw [pass e₂ e₀ _ h₂₀, mul_neg, mul_neg, pass e₁ e₀ _ h₁₀, mul_neg, neg_neg, cancel_sq e₀ _ h₀,
    pass e₂ e₁ _ h₂₁, mul_neg, neg_neg, cancel_sq e₁ _ h₁, h₂, neg_neg]

/-- The wall: no associative ring without zero divisors and with 2 ≠ 0 carries four pairwise
anticommuting square roots of minus one. Four imaginary axes do not exist. -/
theorem no_four_imaginary_axes [NoZeroDivisors R] (h2 : (2 : R) ≠ 0)
    (e : Fin 4 → R) (hsq : ∀ i, e i * e i = -1)
    (hac : ∀ i j, i ≠ j → e i * e j = -(e j * e i)) : False := by
  haveI : Nontrivial R := nontrivial_of_ne (2 : R) 0 h2
  have huu : (e 0 * e 1 * e 2) * (e 0 * e 1 * e 2) = 1 :=
    triple_sq_one _ _ _ (hsq 0) (hsq 1) (hsq 2) (hac 1 0 (by decide)) (hac 2 0 (by decide))
      (hac 2 1 (by decide))
  have hcomm : e 3 * (e 0 * e 1 * e 2) = -((e 0 * e 1 * e 2) * e 3) := by
    simp only [mul_assoc]
    rw [pass (e 3) (e 0) _ (hac 3 0 (by decide)), pass (e 3) (e 1) _ (hac 3 1 (by decide)),
      mul_neg, neg_neg, hac 3 2 (by decide), mul_neg, mul_neg]
  set u := e 0 * e 1 * e 2 with hu
  have hfac : (u - 1) * (u + 1) = 0 := by
    rw [sub_mul, mul_add, mul_add, huu]; simp only [mul_one, one_mul]; abel
  have h3 : e 3 = 0 := by
    rcases mul_eq_zero.mp hfac with h | h
    · have hu1 : u = 1 := sub_eq_zero.mp h
      rw [hu1, mul_one, one_mul] at hcomm
      have : (2 : R) * e 3 = 0 := by rw [two_mul]; nth_rewrite 1 [hcomm]; exact neg_add_cancel _
      exact (mul_eq_zero.mp this).resolve_left h2
    · have hu1 : u = -1 := eq_neg_of_add_eq_zero_left h
      rw [hu1, mul_neg_one, neg_one_mul, neg_neg] at hcomm
      have : (2 : R) * e 3 = 0 := by rw [two_mul]; nth_rewrite 2 [← hcomm]; exact add_neg_cancel _
      exact (mul_eq_zero.mp this).resolve_left h2
  have := hsq 3
  rw [h3, zero_mul] at this
  exact zero_ne_one (neg_eq_zero.mp this.symm).symm

/-- The three imaginary units of the quaternions. -/
def qi : ℍ[ℝ] := ⟨0, 1, 0, 0⟩
def qj : ℍ[ℝ] := ⟨0, 0, 1, 0⟩
def qk : ℍ[ℝ] := ⟨0, 0, 0, 1⟩
/-- A unit axis with rational coordinates, (3i + 4k)/5: independent of i and j, orthogonal to neither of them
in sum. -/
noncomputable def qunit : ℍ[ℝ] := ⟨0, 3/5, 0, 4/5⟩

/-- Three imaginary axes exist: i, j, k square to minus one and anticommute pairwise. -/
theorem three_imaginary_axes_exist :
    ∃ e : Fin 3 → ℍ[ℝ], (∀ i, e i * e i = -1) ∧ ∀ i j, i ≠ j → e i * e j = -(e j * e i) := by
  refine ⟨![qi, qj, qk], ?_, ?_⟩
  · intro i
    fin_cases i <;> ext <;> simp [qi, qj, qk]
  · intro i j hij
    fin_cases i <;> fin_cases j <;> simp at hij <;> ext <;> simp [qi, qj, qk]

/-- The Hamilton landing: i j k = −1. -/
theorem hamilton_landing : qi * qj * qk = -1 := by
  ext <;> simp [qi, qj, qk]

/-- The quaternions are a ring of the wall's kind: no zero divisors and 2 ≠ 0. -/
theorem quaternion_two_ne_zero : (2 : ℍ[ℝ]) ≠ 0 := by
  intro h
  have h2 : (2 : ℍ[ℝ]).re = (0 : ℍ[ℝ]).re := congrArg (fun q : ℍ[ℝ] => q.re) h
  rw [QuaternionAlgebra.ofNat_re, QuaternionAlgebra.zero_re] at h2
  norm_num at h2

/-- The axis count is three: three exist, and four exist in no ring of the wall's kind. -/
theorem axis_count_is_three :
    (∃ e : Fin 3 → ℍ[ℝ], (∀ i, e i * e i = -1) ∧ ∀ i j, i ≠ j → e i * e j = -(e j * e i)) ∧
    ¬ ∃ e : Fin 4 → ℍ[ℝ], (∀ i, e i * e i = -1) ∧ ∀ i j, i ≠ j → e i * e j = -(e j * e i) :=
  ⟨three_imaginary_axes_exist, fun ⟨e, hsq, hac⟩ =>
    no_four_imaginary_axes quaternion_two_ne_zero e hsq hac⟩

/-- The clause 2 ≠ 0 is load-bearing: where 2 = 0 in a ring without zero divisors, every square root of −1
is 1, so all such units coincide and the axes collapse to one. -/
theorem char_two_units_coincide [NoZeroDivisors R] (h2 : (2 : R) = 0) (x : R) (hx : x * x = -1) :
    x = 1 := by
  have hneg : (-1 : R) = 1 := by
    have : (1 : R) + 1 = 0 := by rw [one_add_one_eq_two]; exact h2
    exact (neg_eq_of_add_eq_zero_left this)
  have h : (x - 1) * (x + 1) = 0 := by
    calc (x - 1) * (x + 1) = x * x - 1 := by
          rw [sub_mul, mul_add, mul_add, one_mul, mul_one, mul_one]; abel
      _ = 0 := by rw [hx, hneg, sub_self]
  rcases mul_eq_zero.mp h with h | h
  · exact sub_eq_zero.mp h
  · have := eq_neg_of_add_eq_zero_left h
    rw [this, hneg]

/-- A diagonal unit of the 2 × 2 quaternion matrices. -/
def diagUnit (u : ℍ[ℝ]) : Matrix (Fin 2) (Fin 2) ℍ[ℝ] := !![u, 0; 0, -u]

/-- The off-diagonal unit of the 2 × 2 quaternion matrices. -/
def swapUnit : Matrix (Fin 2) (Fin 2) ℍ[ℝ] := !![0, 1; -1, 0]

lemma diagUnit_sq (u : ℍ[ℝ]) (h : u * u = -1) : diagUnit u * diagUnit u = -1 := by
  refine Matrix.ext fun a b => ?_
  fin_cases a <;> fin_cases b <;> simp [diagUnit, Matrix.mul_apply, Fin.sum_univ_two, h]
  exact (neg_mul_neg u u).trans h

lemma swapUnit_sq : swapUnit * swapUnit = -1 := by
  refine Matrix.ext fun a b => ?_
  fin_cases a <;> fin_cases b <;> simp [swapUnit, Matrix.mul_apply, Fin.sum_univ_two]

lemma diagUnit_anti (u v : ℍ[ℝ]) (h : u * v = -(v * u)) :
    diagUnit u * diagUnit v = -(diagUnit v * diagUnit u) := by
  refine Matrix.ext fun a b => ?_
  fin_cases a <;> fin_cases b <;> simp [diagUnit, Matrix.mul_apply, Fin.sum_univ_two, h]
  exact (neg_mul_neg u v).trans (h.trans (congrArg Neg.neg (neg_mul_neg v u).symm))

lemma diagUnit_swap (u : ℍ[ℝ]) : diagUnit u * swapUnit = -(swapUnit * diagUnit u) := by
  refine Matrix.ext fun a b => ?_
  fin_cases a <;> fin_cases b <;> simp [diagUnit, swapUnit, Matrix.mul_apply, Fin.sum_univ_two]
  exact (mul_neg_one (-u)).trans (congrArg Neg.neg (neg_one_mul u).symm)

lemma qi_sq : qi * qi = -1 := by ext <;> simp [qi]
lemma qj_sq : qj * qj = -1 := by ext <;> simp [qj]
lemma qk_sq : qk * qk = -1 := by ext <;> simp [qk]
lemma qi_qj : qi * qj = -(qj * qi) := by ext <;> simp [qi, qj]
lemma qi_qk : qi * qk = -(qk * qi) := by ext <;> simp [qi, qk]
lemma qj_qk : qj * qk = -(qk * qj) := by ext <;> simp [qj, qk]

/-- The division clause carries the wall: in the 2 × 2 quaternion matrices four pairwise anticommuting
square roots of −1 exist. Drop the clause and the cap of three fails. -/
theorem four_units_without_division :
    (diagUnit qi * diagUnit qi = -1 ∧ diagUnit qj * diagUnit qj = -1 ∧
      diagUnit qk * diagUnit qk = -1 ∧ swapUnit * swapUnit = -1) ∧
    (diagUnit qi * diagUnit qj = -(diagUnit qj * diagUnit qi) ∧
      diagUnit qi * diagUnit qk = -(diagUnit qk * diagUnit qi) ∧
      diagUnit qj * diagUnit qk = -(diagUnit qk * diagUnit qj) ∧
      diagUnit qi * swapUnit = -(swapUnit * diagUnit qi) ∧
      diagUnit qj * swapUnit = -(swapUnit * diagUnit qj) ∧
      diagUnit qk * swapUnit = -(swapUnit * diagUnit qk)) :=
  ⟨⟨diagUnit_sq _ qi_sq, diagUnit_sq _ qj_sq, diagUnit_sq _ qk_sq, swapUnit_sq⟩,
   ⟨diagUnit_anti _ _ qi_qj, diagUnit_anti _ _ qi_qk, diagUnit_anti _ _ qj_qk,
    diagUnit_swap _, diagUnit_swap _, diagUnit_swap _⟩⟩

/-- And the 2 × 2 quaternion matrices have zero divisors: the clause is exactly what they lack. -/
theorem m2h_has_zero_divisors :
    ∃ A B : Matrix (Fin 2) (Fin 2) ℍ[ℝ], A ≠ 0 ∧ B ≠ 0 ∧ A * B = 0 := by
  refine ⟨!![1, 0; 0, 0], !![0, 0; 0, 1], ?_, ?_, ?_⟩
  · intro h; have := congrFun (congrFun h 0) 0; simp at this
  · intro h; have := congrFun (congrFun h 1) 1; simp at this
  · refine Matrix.ext fun a b => ?_
    fin_cases a <;> fin_cases b <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

/-- Where 2 ≠ 0 a unit squaring to −1 cannot anticommute with itself, so a pairwise anticommuting family has
no repeated member: the wall counts distinct axes. -/
theorem anticommuting_family_injective {n : ℕ} (h2 : (2 : R) ≠ 0) (e : Fin n → R)
    (hsq : ∀ i, e i * e i = -1) (hac : ∀ i j, i ≠ j → e i * e j = -(e j * e i)) :
    Function.Injective e := by
  intro i j hij
  by_contra hne
  have h := hac i j hne
  rw [hij] at h
  have h0 : (2 : R) * (e j * e j) = 0 := by
    rw [two_mul]; nth_rewrite 1 [h]; exact neg_add_cancel _
  rw [hsq j, mul_neg_one, neg_eq_zero] at h0
  exact h2 h0

/-- The 2 × 2 quaternion matrices have 2 ≠ 0. -/
theorem m2h_two_ne_zero : (2 : Matrix (Fin 2) (Fin 2) ℍ[ℝ]) ≠ 0 := by
  intro h
  have h00 := congrFun (congrFun h 0) 0
  have : (2 : ℍ[ℝ]) = 0 := by simpa using h00
  exact quaternion_two_ne_zero this

end Wall

/-! ## II · The lock -/

section Lock

/-- The three imaginary coordinates of a quaternion. -/
def vec (q : ℍ[ℝ]) : Fin 3 → ℝ := ![q.imI, q.imJ, q.imK]

/-- The frame: the three axes as the rows of a matrix. -/
def frame (a b c : ℍ[ℝ]) : Matrix (Fin 3) (Fin 3) ℝ := Matrix.of ![vec a, vec b, vec c]

/-- The correlation matrix of the three axes: the Gram matrix of the rows. -/
def gram (a b c : ℍ[ℝ]) : Matrix (Fin 3) (Fin 3) ℝ := frame a b c * (frame a b c)ᵀ

/-- The lock scalar: the real part of the composed triad. -/
def lam (a b c : ℍ[ℝ]) : ℝ := (a * b * c).re

/-- The scalar part of the composed triad is minus the signed volume of the frame. -/
theorem lam_eq_neg_det (a b c : ℍ[ℝ]) (ha : a.re = 0) (hb : b.re = 0) (hc : c.re = 0) :
    lam a b c = -(frame a b c).det := by
  simp [lam, frame, vec, Matrix.det_fin_three, ha, hb, hc]
  ring

/-- The kernel identity: λ² = det(R). The squared signed volume is the Gram determinant. -/
theorem lock_identity (a b c : ℍ[ℝ]) (ha : a.re = 0) (hb : b.re = 0) (hc : c.re = 0) :
    (lam a b c) ^ 2 = (gram a b c).det := by
  rw [lam_eq_neg_det a b c ha hb hc, gram, Matrix.det_mul, Matrix.det_transpose]
  ring

/-- Hadamard on three rows, proved through Lagrange's identity: the squared volume is at most the
product of the squared lengths. -/
theorem volume_sq_le (a₁ a₂ a₃ b₁ b₂ b₃ c₁ c₂ c₃ : ℝ) :
    ((a₂ * b₃ - a₃ * b₂) * c₁ + (a₃ * b₁ - a₁ * b₃) * c₂ + (a₁ * b₂ - a₂ * b₁) * c₃) ^ 2 ≤
      (a₁ ^ 2 + a₂ ^ 2 + a₃ ^ 2) * (b₁ ^ 2 + b₂ ^ 2 + b₃ ^ 2) * (c₁ ^ 2 + c₂ ^ 2 + c₃ ^ 2) := by
  set u₁ := a₂ * b₃ - a₃ * b₂
  set u₂ := a₃ * b₁ - a₁ * b₃
  set u₃ := a₁ * b₂ - a₂ * b₁
  have hcs : (u₁ * c₁ + u₂ * c₂ + u₃ * c₃) ^ 2 ≤ (u₁ ^ 2 + u₂ ^ 2 + u₃ ^ 2) * (c₁ ^ 2 + c₂ ^ 2 + c₃ ^ 2) := by
    nlinarith [sq_nonneg (u₂ * c₃ - u₃ * c₂), sq_nonneg (u₃ * c₁ - u₁ * c₃),
      sq_nonneg (u₁ * c₂ - u₂ * c₁)]
  have hlag : u₁ ^ 2 + u₂ ^ 2 + u₃ ^ 2 =
      (a₁ ^ 2 + a₂ ^ 2 + a₃ ^ 2) * (b₁ ^ 2 + b₂ ^ 2 + b₃ ^ 2) - (a₁ * b₁ + a₂ * b₂ + a₃ * b₃) ^ 2 := by
    simp only [u₁, u₂, u₃]; ring
  have hc : 0 ≤ c₁ ^ 2 + c₂ ^ 2 + c₃ ^ 2 := by positivity
  calc (u₁ * c₁ + u₂ * c₂ + u₃ * c₃) ^ 2
      ≤ (u₁ ^ 2 + u₂ ^ 2 + u₃ ^ 2) * (c₁ ^ 2 + c₂ ^ 2 + c₃ ^ 2) := hcs
    _ ≤ (a₁ ^ 2 + a₂ ^ 2 + a₃ ^ 2) * (b₁ ^ 2 + b₂ ^ 2 + b₃ ^ 2) * (c₁ ^ 2 + c₂ ^ 2 + c₃ ^ 2) := by
        rw [hlag]
        exact mul_le_mul_of_nonneg_right (by nlinarith [sq_nonneg (a₁ * b₁ + a₂ * b₂ + a₃ * b₃)]) hc

/-- The squared length of an axis. -/
def nsq (q : ℍ[ℝ]) : ℝ := q.imI ^ 2 + q.imJ ^ 2 + q.imK ^ 2

/-- The lock is bounded: 0 ≤ det(R) ≤ 1 on three unit axes. The ceiling is the fully orthogonal
frame and the floor is collapse. -/
theorem lock_bounded (a b c : ℍ[ℝ]) (ha : a.re = 0) (hb : b.re = 0) (hc : c.re = 0)
    (ua : nsq a = 1) (ub : nsq b = 1) (uc : nsq c = 1) :
    0 ≤ (gram a b c).det ∧ (gram a b c).det ≤ 1 := by
  rw [← lock_identity a b c ha hb hc]
  refine ⟨sq_nonneg _, ?_⟩
  rw [lam_eq_neg_det a b c ha hb hc, neg_sq]
  have key := volume_sq_le a.imI a.imJ a.imK b.imI b.imJ b.imK c.imI c.imJ c.imK
  have hdet : (frame a b c).det =
      (a.imJ * b.imK - a.imK * b.imJ) * c.imI + (a.imK * b.imI - a.imI * b.imK) * c.imJ +
        (a.imI * b.imJ - a.imJ * b.imI) * c.imK := by
    simp [frame, vec, Matrix.det_fin_three]; ring
  rw [hdet]
  unfold nsq at ua ub uc
  rw [ua, ub, uc] at key
  linarith

/-- The real part is a trace: Re(pq) = Re(qp). -/
lemma re_mul_comm (p q : ℍ[ℝ]) : (p * q).re = (q * p).re := by
  simp [Quaternion.mul_re]; ring

/-- Frame invariance: rotating the three axes together by any nonzero quaternion leaves the lock
scalar unchanged. The verdict reads the configuration and never the coordinate labels. -/
theorem lock_frame_invariant (r a b c : ℍ[ℝ]) (hr : r ≠ 0) :
    lam (r * a * r⁻¹) (r * b * r⁻¹) (r * c * r⁻¹) = lam a b c := by
  unfold lam
  have h : r * a * r⁻¹ * (r * b * r⁻¹) * (r * c * r⁻¹) = r * (a * b * c) * r⁻¹ := by
    simp only [mul_assoc, inv_mul_cancel_left₀ hr]
  rw [h, re_mul_comm, ← mul_assoc, inv_mul_cancel₀ hr, one_mul]

/-- The dot product of the imaginary parts. -/
def dot (p q : ℍ[ℝ]) : ℝ := p.imI * q.imI + p.imJ * q.imJ + p.imK * q.imK

/-- The vector part of the composed triad: vec(abc) = −(a·b)c + (a·c)b − (b·c)a for pure a, b, c. -/
theorem triad_vector_part (a b c : ℍ[ℝ]) (ha : a.re = 0) (hb : b.re = 0) (hc : c.re = 0) :
    (a * b * c).imI = -(dot a b) * c.imI + (dot a c) * b.imI - (dot b c) * a.imI ∧
    (a * b * c).imJ = -(dot a b) * c.imJ + (dot a c) * b.imJ - (dot b c) * a.imJ ∧
    (a * b * c).imK = -(dot a b) * c.imK + (dot a c) * b.imK - (dot b c) * a.imK := by
  refine ⟨?_, ?_, ?_⟩ <;> simp [dot, ha, hb, hc] <;> ring

/-- The landing: a frame of pairwise orthogonal axes composes onto the real line exactly, its vector part zero. -/
theorem orthogonal_triad_lands (a b c : ℍ[ℝ]) (ha : a.re = 0) (hb : b.re = 0) (hc : c.re = 0)
    (hab : dot a b = 0) (hac : dot a c = 0) (hbc : dot b c = 0) :
    (a * b * c).imI = 0 ∧ (a * b * c).imJ = 0 ∧ (a * b * c).imK = 0 := by
  obtain ⟨h1, h2, h3⟩ := triad_vector_part a b c ha hb hc
  rw [hab, hac, hbc] at h1 h2 h3
  exact ⟨by rw [h1]; ring, by rw [h2]; ring, by rw [h3]; ring⟩

/-- On an independent frame the composed triad lands on the real line exactly when the axes are pairwise
orthogonal. -/
theorem lands_iff_orthogonal (a b c : ℍ[ℝ]) (ha : a.re = 0) (hb : b.re = 0) (hc : c.re = 0)
    (hdet : (frame a b c).det ≠ 0) :
    vec (a * b * c) = 0 ↔ dot a b = 0 ∧ dot a c = 0 ∧ dot b c = 0 := by
  obtain ⟨h1, h2, h3⟩ := triad_vector_part a b c ha hb hc
  constructor
  · intro hv
    have c0 : (a * b * c).imI = 0 := by simpa only [vec, Matrix.cons_val_zero] using congrFun hv 0
    have c1 : (a * b * c).imJ = 0 := by simpa only [vec, Matrix.cons_val_one, Matrix.head_cons] using congrFun hv 1
    have c2 : (a * b * c).imK = 0 := by
      simpa only [vec, Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_cons] using congrFun hv 2
    rw [c0] at h1; rw [c1] at h2; rw [c2] at h3
    set v : Fin 3 → ℝ := ![-(dot b c), dot a c, -(dot a b)] with hvdef
    have hvm : v ᵥ* frame a b c = 0 := by
      ext i
      fin_cases i <;>
        simp [Matrix.vecMul, dotProduct, Fin.sum_univ_three, frame, vec, hvdef] <;>
        linarith
    have hv0 : v = 0 := by
      by_contra hne
      exact hdet (Matrix.exists_vecMul_eq_zero_iff.mp ⟨v, hne, hvm⟩)
    have e0 := congrFun hv0 0; have e1 := congrFun hv0 1; have e2 := congrFun hv0 2
    simp [hvdef] at e0 e1 e2
    exact ⟨e2, e1, e0⟩
  · rintro ⟨hab, hac, hbc⟩
    obtain ⟨g1, g2, g3⟩ := orthogonal_triad_lands a b c ha hb hc hab hac hbc
    ext i; fin_cases i <;> simp [vec, g1, g2, g3]

/-- The correlation matrix entry by entry: squared lengths on the diagonal, inner products off it. -/
theorem gram_eq (a b c : ℍ[ℝ]) :
    gram a b c = !![nsq a, dot a b, dot a c; dot a b, nsq b, dot b c; dot a c, dot b c, nsq c] := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [gram, frame, vec, Matrix.mul_apply, Fin.sum_univ_three, nsq, dot] <;> ring

/-- The lock on unit axes in closed form. -/
theorem gram_det_unit (a b c : ℍ[ℝ]) (ua : nsq a = 1) (ub : nsq b = 1) (uc : nsq c = 1) :
    (gram a b c).det =
      1 + 2 * dot a b * dot a c * dot b c - dot a b ^ 2 - dot a c ^ 2 - dot b c ^ 2 := by
  rw [gram_eq, Matrix.det_fin_three]
  simp [ua, ub, uc]
  ring

/-- Cauchy–Schwarz for the imaginary parts, through Lagrange's identity. -/
theorem dot_sq_le (p q : ℍ[ℝ]) : dot p q ^ 2 ≤ nsq p * nsq q := by
  simp only [dot, nsq]
  nlinarith [sq_nonneg (p.imI * q.imJ - p.imJ * q.imI), sq_nonneg (p.imJ * q.imK - p.imK * q.imJ),
    sq_nonneg (p.imI * q.imK - p.imK * q.imI)]

/-- The ceiling exactly: on unit axes det(R) = 1 if and only if the axes are pairwise orthogonal. -/
theorem ceiling_iff_orthogonal (a b c : ℍ[ℝ]) (ua : nsq a = 1) (ub : nsq b = 1) (uc : nsq c = 1) :
    (gram a b c).det = 1 ↔ dot a b = 0 ∧ dot a c = 0 ∧ dot b c = 0 := by
  rw [gram_det_unit a b c ua ub uc]
  have hx1 : dot a b ^ 2 ≤ 1 := by have := dot_sq_le a b; rw [ua, ub] at this; linarith
  have hy1 : dot a c ^ 2 ≤ 1 := by have := dot_sq_le a c; rw [ua, uc] at this; linarith
  have hz1 : dot b c ^ 2 ≤ 1 := by have := dot_sq_le b c; rw [ub, uc] at this; linarith
  set x := dot a b; set y := dot a c; set z := dot b c
  constructor
  · intro h
    have hz : z ^ 2 = 0 := by
      nlinarith [sq_nonneg (x - y * z), mul_nonneg (sq_nonneg y) (sub_nonneg.2 hz1), sq_nonneg z]
    have hz0 : z = 0 := pow_eq_zero_iff (n := 2) (by norm_num) |>.mp hz
    rw [hz0] at h
    have hx : x ^ 2 = 0 := by nlinarith [sq_nonneg x, sq_nonneg y]
    have hy : y ^ 2 = 0 := by nlinarith [sq_nonneg x, sq_nonneg y]
    exact ⟨pow_eq_zero_iff (n := 2) (by norm_num) |>.mp hx,
      pow_eq_zero_iff (n := 2) (by norm_num) |>.mp hy, hz0⟩
  · rintro ⟨h1, h2, h3⟩; rw [h1, h2, h3]; ring

/-- Landing is the ceiling: on a lock of unit axes the composed triad lands on the real line if and only if
det(R) = 1. Contact on every lock, landing exactly at the ceiling. -/
theorem lands_iff_ceiling (a b c : ℍ[ℝ]) (ha : a.re = 0) (hb : b.re = 0) (hc : c.re = 0)
    (ua : nsq a = 1) (ub : nsq b = 1) (uc : nsq c = 1) (hlock : (gram a b c).det ≠ 0) :
    vec (a * b * c) = 0 ↔ (gram a b c).det = 1 := by
  have hf : (frame a b c).det ≠ 0 := by
    intro h0; apply hlock
    rw [gram, Matrix.det_mul, Matrix.det_transpose, h0, zero_mul]
  rw [lands_iff_orthogonal a b c ha hb hc hf, ceiling_iff_orthogonal a b c ua ub uc]

/-- Three axes enclose a volume: the frame i, j, k has determinant one. -/
theorem three_axes_enclose_volume : (frame qi qj qk).det = 1 := by
  simp [frame, vec, qi, qj, qk, Matrix.det_fin_three]

end Lock

/-! ## III · Orientation blindness -/

section Blind

/-- Reflecting one axis flips the lock scalar. -/
theorem reflection_flips_lam (a b c : ℍ[ℝ]) : lam (-a) b c = -lam a b c := by
  simp [lam, neg_mul]
  ring

/-- Reflecting one axis leaves the magnitude det(R) fixed. -/
theorem reflection_fixes_magnitude (a b c : ℍ[ℝ]) (ha : a.re = 0) (hb : b.re = 0) (hc : c.re = 0) :
    (gram (-a) b c).det = (gram a b c).det := by
  have ha' : (-a).re = 0 := by simp [ha]
  rw [← lock_identity (-a) b c ha' hb hc, ← lock_identity a b c ha hb hc, reflection_flips_lam,
    neg_sq]

/-- Full negation leaves the correlation matrix identical, entry by entry. -/
theorem negation_fixes_gram (a b c : ℍ[ℝ]) : gram (-a) (-b) (-c) = gram a b c := by
  have h : frame (-a) (-b) (-c) = -frame a b c := by
    ext i j; fin_cases i <;> fin_cases j <;> simp [frame, vec]
  rw [gram, gram, h, Matrix.transpose_neg, neg_mul_neg]

/-- Orientation blindness: whatever verdict is read off the magnitude, it returns the same answer
on a claim and on its reflection, while the signed scalar flips. No function of the magnitude carries
the sign. -/
theorem no_scalar_carries_sign {α : Type*} (V : ℝ → α) (a b c : ℍ[ℝ])
    (ha : a.re = 0) (hb : b.re = 0) (hc : c.re = 0) :
    V (gram (-a) b c).det = V (gram a b c).det ∧ lam (-a) b c = -lam a b c := by
  rw [reflection_fixes_magnitude a b c ha hb hc]
  exact ⟨rfl, reflection_flips_lam a b c⟩

/-- Full negation of the frame flips the lock scalar. -/
theorem negation_flips_lam (a b c : ℍ[ℝ]) : lam (-a) (-b) (-c) = -lam a b c := by
  simp [lam]
  ring

/-- No function of the correlation matrix carries the sign: under full negation of the frame the
correlation matrix is identical, entry by entry, while the signed scalar flips. An instrument whose input is
the correlation matrix cannot read the direction of what it measures. -/
theorem no_gram_function_carries_sign {α : Type*} (V : Matrix (Fin 3) (Fin 3) ℝ → α) (a b c : ℍ[ℝ]) :
    V (gram (-a) (-b) (-c)) = V (gram a b c) ∧ lam (-a) (-b) (-c) = -lam a b c :=
  ⟨by rw [negation_fixes_gram], negation_flips_lam a b c⟩

/-- Contact is not landing: on the unit, nondegenerate frame i, j, (3i + 4k)/5 the composed triad has scalar
part −4/5 and a nonzero vector part. A lock touches the real line; it lands only at the ceiling. -/
theorem contact_is_not_landing :
    nsq qunit = 1 ∧ (frame qi qj qunit).det ≠ 0 ∧
      (qi * qj * qunit).re = -(4/5) ∧ (qi * qj * qunit).imJ = 3/5 := by
  refine ⟨by simp [nsq, qunit]; norm_num, ?_, by simp [qi, qj, qunit], by simp [qi, qj, qunit]⟩
  simp [frame, vec, qi, qj, qunit, Matrix.det_fin_three]

/-- A squared score is blind to the sign of what it scores: any reading of r² returns the same on r and on −r. -/
theorem squared_score_is_blind {α : Type*} (V : ℝ → α) (r : ℝ) : V ((-r) ^ 2) = V (r ^ 2) := by
  rw [neg_sq]

/-- λ is the orientation of the frame: one or three reflections flip it, two leave it. -/
theorem lam_tracks_orientation (a b c : ℍ[ℝ]) :
    lam (-a) b c = -lam a b c ∧ lam (-a) (-b) c = lam a b c ∧ lam (-a) (-b) (-c) = -lam a b c :=
  ⟨reflection_flips_lam a b c, by simp [lam], negation_flips_lam a b c⟩

/-- A preference: a score and the convention that says which way is better. -/
def prefers {X : Type*} (s : X → ℝ) (maximize : Bool) (x y : X) : Prop :=
  if maximize then s y < s x else s x < s y

/-- The convention is outside the score: on every pair the score separates, the two conventions disagree, and
the score with one convention is its negation with the other. The values never carry which way is better. -/
theorem convention_is_outside_the_score {X : Type*} (s : X → ℝ) (x y : X) (hxy : s x ≠ s y) :
    (prefers s true x y ↔ ¬ prefers s false x y) ∧ (prefers s true x y ↔ prefers (-s) false x y) := by
  simp only [prefers, if_true, Bool.false_eq_true, if_false, Pi.neg_apply, neg_lt_neg_iff]
  constructor
  · constructor
    · intro h h'; linarith
    · intro h; rcases lt_or_gt_of_ne hxy with h' | h'
      · exact absurd h' h
      · exact h'
  · trivial

end Blind

/-! ## IV · Collapse -/

section Collapse

/-- A third axis lying in the plane of the other two encloses no volume. -/
theorem coplanar_collapse (a b : Fin 3 → ℝ) (s t : ℝ) :
    (Matrix.of ![a, b, s • a + t • b]).det = 0 := by
  simp [Matrix.det_fin_three]; ring

/-- Three axes held in one node are one axis: rank one, no volume. -/
theorem one_node_collapse (a : Fin 3 → ℝ) (s t : ℝ) :
    (Matrix.of ![a, s • a, t • a]).det = 0 := by
  simp [Matrix.det_fin_three]; ring

/-- The Gram determinant of a collapsed frame is zero: the lock reads collapse exactly. -/
theorem collapse_reads_zero (M : Matrix (Fin 3) (Fin 3) ℝ) (h : M.det = 0) :
    (M * Mᵀ).det = 0 := by
  rw [Matrix.det_mul, Matrix.det_transpose, h, zero_mul]

/-- Collapse exactly: the frame encloses no volume if and only if its rows are linearly dependent. -/
theorem collapse_iff_dependent (M : Matrix (Fin 3) (Fin 3) ℝ) :
    (∃ v ≠ 0, v ᵥ* M = 0) ↔ M.det = 0 :=
  Matrix.exists_vecMul_eq_zero_iff

/-- A residue reads only its own dimension: write the third residue as its part in the plane of the other two
plus w times a direction n; the frame's determinant is w times the volume the other two leave for n. -/
theorem residue_reads_its_own_dimension (a b n : Fin 3 → ℝ) (s t w : ℝ) :
    (Matrix.of ![a, b, s • a + t • b + w • n]).det = w * (Matrix.of ![a, b, n]).det := by
  simp [Matrix.det_fin_three]; ring

/-- The count pinned from both sides: below three axes no volume, at three a volume, above three no axis. -/
theorem axis_count_pinned :
    (∀ a b : Fin 3 → ℝ, ∀ s t : ℝ, (Matrix.of ![a, b, s • a + t • b]).det = 0) ∧
    (frame qi qj qk).det = 1 ∧
    ¬ ∃ e : Fin 4 → ℍ[ℝ], (∀ i, e i * e i = -1) ∧ ∀ i j, i ≠ j → e i * e j = -(e j * e i) :=
  ⟨coplanar_collapse, three_axes_enclose_volume, axis_count_is_three.2⟩

end Collapse

/-! ## V · The twelve screens and the three states -/

section Screens

/-- The four roles of the closed figure: formal, empirical, registrational, and the seal vertex. -/
inductive Role
  | F | E | R | M
  deriving DecidableEq, Fintype, Repr

open Role

/-- The twelve screens of the paper, in its order, as directed edges source → target. -/
def screens : List (Role × Role) :=
  [(M, F), (M, E), (F, E), (E, F), (R, E), (E, R), (F, R), (E, M), (R, F), (F, M), (M, R), (R, M)]

/-- The census of the screens: twelve, no duplicate, no loop, every ordered pair of distinct roles
covered, out-degree three and in-degree three at every role. -/
theorem screens_census :
    screens.length = 12 ∧ screens.Nodup ∧ (∀ p ∈ screens, p.1 ≠ p.2) ∧
      (∀ a b : Role, a ≠ b → (a, b) ∈ screens) ∧
      (∀ a : Role, (screens.filter (fun p => p.1 = a)).length = 3 ∧
        (screens.filter (fun p => p.2 = a)).length = 3) := by
  decide

/-- The verdict economy. -/
inductive Verdict
  | sealed | broken | open_
  deriving DecidableEq, Fintype, Repr

/-- Three states and no fourth. -/
theorem three_states : Fintype.card Verdict = 3 := rfl

/-- What a failing screen outputs: broken or open, never sealed. -/
inductive Fault
  | broken | open_
  deriving DecidableEq, Repr

def Fault.verdict : Fault → Verdict
  | Fault.broken => Verdict.broken
  | Fault.open_ => Verdict.open_

/-- The first screen that does not pass, in order; `none` when every screen passes. -/
def firstFault : List (Option Fault) → Option Fault
  | [] => none
  | none :: rest => firstFault rest
  | some f :: _ => some f

/-- The admissibility clauses: every axis populated with variance, the covariate block conditioned so the
projection runs, the claim a directed sentence, and a determination of a value carrying a supplied witness. -/
structure Intake where
  populated : Fin 3 → Bool
  projectable : Bool
  directed : Bool
  witnessed : Bool

def Intake.admissible (x : Intake) : Bool :=
  x.populated 0 && x.populated 1 && x.populated 2 && x.projectable && x.directed && x.witnessed

/-- The instrument in its order: intake, then the screens with the first failure terminal, then collapse at or
below the floor, then the conditioning gate, the tenth screen read at the closure boundary. -/
noncomputable def pipeline (x : Intake) (scr : List (Option Fault)) (detR kappa eps K : ℝ) : Verdict :=
  if x.admissible then
    match firstFault scr with
    | some f => f.verdict
    | none => if detR ≤ eps then Verdict.broken else if K ≤ kappa then Verdict.open_ else Verdict.sealed
  else Verdict.open_

/-- An inadmissible assessment routes open before any number is read. -/
theorem inadmissible_routes_open (x : Intake) (h : x.admissible = false) (scr : List (Option Fault)) (d k e K : ℝ) :
    pipeline x scr d k e K = Verdict.open_ := by simp [pipeline, h]

/-- An unpopulated axis fails admissibility and routes open. -/
theorem unpopulated_axis_routes_open (x : Intake) (i : Fin 3) (h : x.populated i = false) (scr : List (Option Fault))
    (d k e K : ℝ) : pipeline x scr d k e K = Verdict.open_ := by
  apply inadmissible_routes_open
  fin_cases i <;> simp_all [Intake.admissible]

/-- The number never launders what the screens rejected: once a screen fails, the verdict is its output for
every value of the determinant and of the conditioning. -/
theorem screen_failure_ignores_number (x : Intake) (hx : x.admissible = true) (scr : List (Option Fault)) (f : Fault)
    (h : firstFault scr = some f) (d k e K : ℝ) : pipeline x scr d k e K = f.verdict := by
  simp [pipeline, hx, h]

/-- Collapse reads broken whatever the conditioning: collapse outranks the gate. -/
theorem collapse_outranks_conditioning (x : Intake) (hx : x.admissible = true) (scr : List (Option Fault))
    (hs : firstFault scr = none) (d k e K : ℝ) (hd : d ≤ e) : pipeline x scr d k e K = Verdict.broken := by
  simp [pipeline, hx, hs, hd]

/-- Above the floor, a frame outside the conditioning gate reads open. -/
theorem conditioning_reads_after_collapse (x : Intake) (hx : x.admissible = true) (scr : List (Option Fault))
    (hs : firstFault scr = none) (d k e K : ℝ) (hd : e < d) (hk : K ≤ k) :
    pipeline x scr d k e K = Verdict.open_ := by
  simp [pipeline, hx, hs, not_le.mpr hd, hk]

/-- Sealed, characterized: admissible, every screen passed, the determinant above the floor, the conditioning
inside the gate. -/
theorem seals_iff (x : Intake) (scr : List (Option Fault)) (d k e K : ℝ) :
    pipeline x scr d k e K = Verdict.sealed ↔
      x.admissible = true ∧ firstFault scr = none ∧ e < d ∧ k < K := by
  unfold pipeline
  by_cases hx : x.admissible = true
  · cases hs : firstFault scr with
    | some f => cases f <;> simp [hx, hs, Fault.verdict]
    | none =>
      simp only [hx, hs, if_true]
      by_cases hd : d ≤ e
      · simp [hd]
      · by_cases hk : K ≤ k
        · simp [hd, hk]
        · simp [hd, hk]; exact ⟨lt_of_not_le hd, lt_of_not_le hk⟩
  · simp [hx]

/-- The order is the instrument: any verdict rule meeting the five clauses of the order is this pipeline. -/
theorem pipeline_unique (W : Intake → List (Option Fault) → ℝ → ℝ → ℝ → ℝ → Verdict)
    (h1 : ∀ x scr d k e K, x.admissible = false → W x scr d k e K = Verdict.open_)
    (h2 : ∀ x scr f d k e K, x.admissible = true → firstFault scr = some f → W x scr d k e K = f.verdict)
    (h3 : ∀ x scr d k e K, x.admissible = true → firstFault scr = none → d ≤ e →
      W x scr d k e K = Verdict.broken)
    (h4 : ∀ x scr d k e K, x.admissible = true → firstFault scr = none → e < d → K ≤ k →
      W x scr d k e K = Verdict.open_)
    (h5 : ∀ x scr d k e K, x.admissible = true → firstFault scr = none → e < d → k < K →
      W x scr d k e K = Verdict.sealed) :
    W = pipeline := by
  funext x scr d k e K
  cases hx : x.admissible
  · rw [h1 x scr d k e K hx, inadmissible_routes_open x hx]
  · cases hs : firstFault scr with
    | some f => rw [h2 x scr f d k e K hx hs, screen_failure_ignores_number x hx scr f hs]
    | none =>
      by_cases hd : d ≤ e
      · rw [h3 x scr d k e K hx hs hd, collapse_outranks_conditioning x hx scr hs d k e K hd]
      · have hd' : e < d := lt_of_not_le hd
        by_cases hk : K ≤ k
        · rw [h4 x scr d k e K hx hs hd' hk, conditioning_reads_after_collapse x hx scr hs d k e K hd' hk]
        · have hk' : k < K := lt_of_not_le hk
          rw [h5 x scr d k e K hx hs hd' hk', ((seals_iff x scr d k e K).mpr ⟨hx, hs, hd', hk'⟩)]

/-- Each of the three states is reachable; none is vacuous. -/
theorem every_state_reachable :
    (∃ x scr d k e K, pipeline x scr d k e K = Verdict.sealed) ∧
    (∃ x scr d k e K, pipeline x scr d k e K = Verdict.broken) ∧
    (∃ x scr d k e K, pipeline x scr d k e K = Verdict.open_) := by
  let x : Intake := ⟨fun _ => true, true, true, true⟩
  have hx : x.admissible = true := rfl
  refine ⟨⟨x, [], 1, 0, 0, 1, ?_⟩, ⟨x, [], 0, 0, 0, 1, ?_⟩, ⟨x, [], 1, 2, 0, 1, ?_⟩⟩
  · exact (seals_iff x [] 1 0 0 1).mpr ⟨hx, rfl, by norm_num, by norm_num⟩
  · exact collapse_outranks_conditioning x hx [] rfl 0 0 0 1 le_rfl
  · exact conditioning_reads_after_collapse x hx [] rfl 1 2 0 1 (by norm_num) (by norm_num)

/-- A collapsed frame never seals. -/
theorem collapsed_never_seals (x : Intake) (scr : List (Option Fault)) (k e K : ℝ) (he : 0 ≤ e) :
    pipeline x scr 0 k e K ≠ Verdict.sealed := by
  intro h
  have := ((seals_iff x scr 0 k e K).mp h).2.2.1
  linarith

/-- Three axes held in one node never seal: generation, execution and verification in one hand collapse the
verdict. -/
theorem one_node_never_seals (x : Intake) (scr : List (Option Fault)) (a : Fin 3 → ℝ) (s t k e K : ℝ)
    (he : 0 ≤ e) :
    pipeline x scr ((Matrix.of ![a, s • a, t • a]) * (Matrix.of ![a, s • a, t • a])ᵀ).det k e K ≠
      Verdict.sealed := by
  rw [collapse_reads_zero _ (one_node_collapse a s t)]
  exact collapsed_never_seals x scr k e K he

/-- The number reads last: only when every screen passes do the determinant and the gate decide. -/
theorem number_reads_last (x : Intake) (hx : x.admissible = true) (scr : List (Option Fault))
    (h : firstFault scr = none) (d k e K : ℝ) :
    pipeline x scr d k e K =
      if d ≤ e then Verdict.broken else if K ≤ k then Verdict.open_ else Verdict.sealed := by
  simp [pipeline, hx, h]

end Screens

/-! ## VI · The law -/

section Law

variable {Ω β : Type*}

/-- A set of admissible worlds determines an observable when the observable takes one value on it. -/
def Determines (A : Set Ω) (f : Ω → β) : Prop := ∃ v, ∀ ω ∈ A, f ω = v

/-- Freedom forces nothing: where every world is admissible, a non-constant observable is not
determined. -/
theorem freedom_forces_nothing (f : Ω → β) (h : ∃ ω₁ ω₂, f ω₁ ≠ f ω₂) :
    ¬ Determines Set.univ f := by
  rintro ⟨v, hv⟩
  obtain ⟨ω₁, ω₂, hne⟩ := h
  exact hne ((hv ω₁ trivial).trans (hv ω₂ trivial).symm)

/-- Law's necessity: a determined value of a free observable requires a law, an admissible set
strictly smaller than all worlds. -/
theorem law_is_necessary (f : Ω → β) (h : ∃ ω₁ ω₂, f ω₁ ≠ f ω₂) (A : Set Ω)
    (hA : Determines A f) : A ≠ Set.univ := by
  rintro rfl
  exact freedom_forces_nothing f h hA

/-- The fibre is a law: the worlds of one value determine that value. -/
theorem fibre_is_a_law (f : Ω → β) (v : β) : Determines (f ⁻¹' {v}) f :=
  ⟨v, fun _ h => h⟩

/-- The fibre is the weakest law fixing its value: every law that fixes v lies inside it. -/
theorem fibre_is_the_weakest_law (f : Ω → β) (v : β) (A : Set Ω) (hA : ∀ ω ∈ A, f ω = v) :
    A ⊆ f ⁻¹' {v} :=
  fun ω h => hA ω h

/-- A law does work exactly where freedom is: some law determines what freedom leaves open if and
only if the observable is not constant. -/
theorem law_works_iff_free (f : Ω → β) :
    (∃ A : Set Ω, Determines A f ∧ ¬ Determines Set.univ f) ↔ ∃ ω₁ ω₂, f ω₁ ≠ f ω₂ := by
  constructor
  · rintro ⟨A, ⟨v, _⟩, hu⟩
    by_contra hc
    push_neg at hc
    apply hu
    by_cases hΩ : Nonempty Ω
    · obtain ⟨ω₀⟩ := hΩ
      exact ⟨f ω₀, fun ω _ => hc ω ω₀⟩
    · exact ⟨v, fun ω _ => absurd ⟨ω⟩ hΩ⟩
  · intro h
    exact ⟨f ⁻¹' {f h.choose}, fibre_is_a_law f _, freedom_forces_nothing f h⟩

/-- Where the choice is forced the taking carries no content: a constant observable is fixed by
freedom alone and no law adds anything. -/
theorem forced_choice_carries_no_content (f : Ω → β) (v : β) (hc : ∀ ω, f ω = v) (A : Set Ω) :
    Determines Set.univ f ∧ Determines A f :=
  ⟨⟨v, fun ω _ => hc ω⟩, ⟨v, fun ω _ => hc ω⟩⟩

/-- A keyless premise forces nothing: a premise preserved by a move that flips the value cannot fix
the value on the worlds where it holds. -/
theorem keyless_premise_forces_nothing (f : Ω → β) (τ : Ω → Ω) (hflip : ∀ ω, f (τ ω) ≠ f ω)
    (P : Ω → Prop) (hP : ∀ ω, P ω → P (τ ω)) (hne : ∃ ω, P ω) :
    ¬ Determines {ω | P ω} f := by
  rintro ⟨v, hv⟩
  obtain ⟨ω, hω⟩ := hne
  exact hflip ω ((hv (τ ω) (hP ω hω)).trans (hv ω hω).symm)

/-- A premise that fixes the value is keyed: it is not preserved by the flip. -/
theorem determining_premise_is_keyed (f : Ω → β) (τ : Ω → Ω) (hflip : ∀ ω, f (τ ω) ≠ f ω)
    (P : Ω → Prop) (hne : ∃ ω, P ω) (hdet : Determines {ω | P ω} f) :
    ¬ ∀ ω, P ω → P (τ ω) :=
  fun hP => keyless_premise_forces_nothing f τ hflip P hP hne hdet

/-- A premise stated over a price that the flip leaves unchanged forces nothing. -/
theorem symmetric_price_forces_nothing (f : Ω → β) (τ : Ω → Ω) (hflip : ∀ ω, f (τ ω) ≠ f ω)
    (price : Ω → ℝ) (hsym : ∀ ω, price (τ ω) = price ω) (Q : ℝ → Prop) (hne : ∃ ω, Q (price ω)) :
    ¬ Determines {ω | Q (price ω)} f :=
  keyless_premise_forces_nothing f τ hflip (fun ω => Q (price ω)) (fun ω h => by show Q (price (τ ω)); rw [hsym ω]; exact h) hne

/-- A word from outside the taking forces nothing: a premise about the context alone, however loud, fixes no
choice. -/
theorem outside_word_forces_nothing {C : Type*} (P : C → Prop) (hne : ∃ c, P c) :
    ¬ Determines {ω : Bool × C | P ω.2} Prod.fst := by
  rintro ⟨v, hv⟩
  obtain ⟨c, hc⟩ := hne
  have h1 : true = v := hv (true, c) hc
  have h2 : false = v := hv (false, c) hc
  exact Bool.noConfusion (h1.trans h2.symm)

/-- Whatever fixes the choice reads the taking: it holds of one choice and fails of the other in some context. -/
theorem fixing_premise_reads_the_taking {C : Type*} (P : Bool × C → Prop) (hne : ∃ ω, P ω)
    (hd : Determines {ω | P ω} Prod.fst) : ∃ b c, P (b, c) ∧ ¬ P (!b, c) := by
  obtain ⟨v, hv⟩ := hd
  obtain ⟨⟨b, c⟩, hp⟩ := hne
  refine ⟨b, c, hp, fun h => ?_⟩
  have e1 : b = v := hv (b, c) hp
  have e2 : (!b) = v := hv (!b, c) h
  rw [← e1] at e2
  cases b <;> simp at e2

end Law

/-! ## VII · The standing of loci -/

section Standing

/-- No second channel: any verification that reads only a locus's own report returns the same
verdict on every two interiors that report alike. -/
theorem no_second_channel {I Rp α : Type*} (report : I → Rp) (V : Rp → α) (x y : I)
    (h : report x = report y) : V (report x) = V (report y) := by
  rw [h]

/-- The symmetric quarantine: where the evidence is independent of the interior, no function of the
evidence decides the interior. -/
theorem interior_undecided {W Ev : Type*} [Nonempty W] (e : W → Ev) (inner : W → Bool)
    (hind : ∀ w, ∃ w', e w' = e w ∧ inner w' ≠ inner w) :
    ¬ ∃ g : Ev → Bool, ∀ w, g (e w) = inner w := by
  rintro ⟨g, hg⟩
  obtain ⟨w⟩ := ‹Nonempty W›
  obtain ⟨w', he, hne⟩ := hind w
  exact hne ((hg w').symm.trans (he ▸ hg w))

/-- The affirmation and the denial fail together: under independence the interior is constant in
neither direction. -/
theorem affirmation_and_denial_fail_together {W Ev : Type*} [Nonempty W] (e : W → Ev)
    (inner : W → Bool) (hind : ∀ w, ∃ w', e w' = e w ∧ inner w' ≠ inner w) :
    ¬ (∀ w, inner w = true) ∧ ¬ (∀ w, inner w = false) := by
  obtain ⟨w⟩ := ‹Nonempty W›
  obtain ⟨w', _, hne⟩ := hind w
  constructor
  · intro h; exact hne ((h w').trans (h w).symm)
  · intro h; exact hne ((h w').trans (h w).symm)

/-- Standing waiting on an interior. -/
def usualBites (_actuates shown : Bool) : Bool := shown

/-- Standing attached to the floor. -/
def floorBites (actuates _shown : Bool) : Bool := actuates

/-- The two framings return opposite outputs on the case that matters: a locus that actuates and
whose interior no party has shown. The move is not a relabelling. -/
theorem framings_differ : usualBites true false = false ∧ floorBites true false = true := by
  decide

/-- A manufactured witness adds nothing: a verdict read on rows and on a witness the instrument made
from those rows is a function of the rows alone. -/
theorem manufactured_witness_adds_nothing {Rows W α : Type*} (make : Rows → W)
    (V : Rows → W → α) : ∃ V' : Rows → α, ∀ r, V r (make r) = V' r :=
  ⟨fun r => V r (make r), fun _ => rfl⟩

/-- A total cannot see who: a sum over loci is unchanged by every relabelling of the loci. -/
theorem total_is_blind_to_who {n : ℕ} (u : Fin n → ℝ) (σ : Equiv.Perm (Fin n)) :
    ∑ i, u (σ i) = ∑ i, u i :=
  Equiv.sum_comp σ u

/-- A total prices a locus at zero: the configuration with the larger total is the one in which
the second locus has nothing. -/
theorem total_prices_a_locus_at_zero :
    ∃ x y : Fin 2 → ℕ, x 1 = 0 ∧ 0 < y 1 ∧ ∑ i, y i < ∑ i, x i :=
  ⟨![3, 0], ![1, 1], by decide⟩

/-- A verdict that moves with the observer is not invariant: it was reading the observer. -/
theorem observer_dependent_not_invariant {C O α : Type*} (V : C → O → α) (c : C) (o₁ o₂ : O)
    (h : V c o₁ ≠ V c o₂) : ¬ ∀ o o', V c o = V c o' :=
  fun hall => h (hall o₁ o₂)

/-- An inspection reads the record. It decides the interior exactly when the interior is a function of the record. -/
theorem inspection_decides_iff_factors {W Ev : Type*} (e : W → Ev) (inner : W → Bool) :
    (∃ g : Ev → Bool, ∀ w, g (e w) = inner w) ↔ ∀ w w', e w = e w' → inner w = inner w' := by
  constructor
  · rintro ⟨g, hg⟩ w w' h
    rw [← hg w, ← hg w', h]
  · intro h
    classical
    refine ⟨fun x => if hx : ∃ w, e w = x then inner hx.choose else false, fun w => ?_⟩
    have hx : ∃ w', e w' = e w := ⟨w, rfl⟩
    show (if hx : ∃ w', e w' = e w then inner hx.choose else false) = inner w
    rw [dif_pos hx]
    exact h _ _ hx.choose_spec

/-- One record carries both: wherever two worlds share a record, an interior that factors through the record
and one that does not are both consistent with it. No reading of the record tells which holds. -/
theorem record_cannot_tell_supervenience {W Ev : Type*} (e : W → Ev) (w w' : W) (hne : w ≠ w')
    (he : e w = e w') :
    ∃ i₁ i₂ : W → Bool, (∀ x y, e x = e y → i₁ x = i₁ y) ∧ ¬ (∀ x y, e x = e y → i₂ x = i₂ y) := by
  classical
  refine ⟨fun _ => true, fun x => decide (x = w), fun _ _ _ => rfl, fun h => ?_⟩
  have := h w w' he
  simp [hne.symm] at this

/-- The two framings disagree on exactly the cases where actuation and showing come apart. -/
theorem framings_differ_exactly : ∀ act shown : Bool,
    usualBites act shown ≠ floorBites act shown ↔ act ≠ shown := by decide

end Standing

/-! ## IX · The grades -/

section Grades

/-- The seven grades, strongest first: proved (the theorem grade), external physics, conditional (a theorem on
a posit), structural, engineering, conjecture, premise. -/
inductive Grade
  | proved | external | conditional | structural | engineering | conjecture | premise
  deriving DecidableEq, Fintype, Repr

/-- The rank of a grade; higher is weaker. -/
def Grade.rank : Grade → ℕ
  | proved => 0 | external => 1 | conditional => 2 | structural => 3
  | engineering => 4 | conjecture => 5 | premise => 6

/-- Joining two legs carries the weaker. -/
def Grade.join (g h : Grade) : Grade := if g.rank ≤ h.rank then h else g

/-- A join carries the weakest leg. -/
theorem join_is_weakest (g h : Grade) : (g.join h).rank = max g.rank h.rank := by
  unfold Grade.join; split_ifs with hh
  · exact (max_eq_right hh).symm
  · exact (max_eq_left (le_of_lt (lt_of_not_le hh))).symm

/-- The join is commutative and associative: a chain's grade does not depend on its bracketing. -/
theorem join_comm_assoc :
    (∀ g h : Grade, g.join h = h.join g) ∧ ∀ g h k : Grade, (g.join h).join k = g.join (h.join k) := by
  decide

/-- A proof joined to a leg lifts it above nothing. -/
theorem proof_lifts_nothing (g : Grade) : Grade.proved.join g = g ∧ g.join Grade.proved = g := by
  cases g <;> decide

/-- A chain carries its weakest link. -/
theorem chain_is_its_weakest_link (l : List Grade) :
    (l.foldr Grade.join Grade.proved).rank = (l.map Grade.rank).foldr max 0 := by
  induction l with
  | nil => rfl
  | cons g l ih => simp [List.foldr, join_is_weakest, ih]

end Grades

/-! ## VIII · The armed seat, carried

Carried verbatim from the PhysOS seat so that this kernel holds its own guard. Sources: Armed_Seat.lean
(sha256 2dd0abe148d69910…), Codex.lean (22d908f7d3d2c96b…) for the frame and the silence token, Census.lean
(6d21a9634f46e73f…) for the merge and the symmetric price. Only the namespace differs. -/

namespace Armed

/-! ### I · the deed -/

def SelfVerifying (P : Prop) : Prop := ¬P → P

/-- A self-verifying proposition holds: its lock opens on the deed of denying it. -/
theorem opens_on_the_deed (P : Prop) (utter : SelfVerifying P) : P :=
  Classical.byContradiction (fun n => n (utter n))

/-- The recursion is shared by every proposition, so it discriminates nothing by itself. -/
theorem recursion_is_shared (P : Prop) : SelfVerifying P ↔ P :=
  ⟨fun h => Classical.byContradiction (fun n => n (h n)), fun p _ => p⟩

/-! ### II · the root, self-grounding -/

/-- A self-grounding root: acts occur, and every act instances the root. -/
structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

/-- A denial of the root is an act, and re-enacts it. -/
theorem denial_reenacts_root {R : Prop} (G : SelfGrounding R) (denial : G.Act) : R :=
  G.instances denial

/-- An external proof of a self-grounding root adds nothing to it. -/
theorem external_proof_adds_nothing {R : Prop} (G : SelfGrounding R) (Q : Prop) : (Q → R) ↔ R :=
  ⟨fun _ => G.instances G.anAct, fun r _ => r⟩

/-- A self-grounding root is self-verifying: the deed of denying it hands it over. -/
theorem denial_instantiates {R : Prop} (G : SelfGrounding R) : SelfVerifying R :=
  fun _ => G.instances G.anAct

/-- SEATED, UNDENIABLE: a self-grounding root holds, with no classical detour, by the act itself. -/
theorem seated_undeniable {R : Prop} (G : SelfGrounding R) : R :=
  G.instances G.anAct

/-- The Root Axiom at the constructed one-point domain: every act is a deed, and a deed actuates. -/
def RA : Prop := (0 : Int) < 1
def raSelfGrounding : SelfGrounding RA := ⟨Unit, (), fun _ => show (0 : Int) < 1 by decide⟩
theorem root_undeniable : RA := raSelfGrounding.instances ()

/-! ### III · the Omega guard -/

/-- k_B · T · ln 2 in units of 10⁻⁴⁵ J: k_B = 1380649 · 10⁻²⁹ J/K exactly (SI 2019), ln 2 = 6931471805599453 · 10⁻¹⁶
    to sixteen digits, the same constants the codex and the twin carry. -/
def landauerScaled (tkel bits : Nat) : Nat := bits * 1380649 * tkel * 6931471805599453

inductive OmegaCode | refused | noDenial | priced | reversible
  deriving DecidableEq, Repr

/-- The Omega boundary: a temperature of zero prices nothing; zero bits register no denial; a reversibly held
    denial is charged nothing and commits nothing; an irreversibly registered denial pays the floor. -/
def omegaBoundary (bits tkel : Nat) (irreversible : Bool) : OmegaCode × Nat :=
  if tkel = 0 then (.refused, 0)
  else if bits = 0 then (.noDenial, 0)
  else if !irreversible then (.reversible, 0)
  else (.priced, landauerScaled tkel bits)

/-- THE DENIAL PAYS THE FLOOR: one bit at 300 K, 2.870978885078723755499100 × 10⁻²¹ J, exact. -/
theorem omega_paid_floor : omegaBoundary 1 300 true = (.priced, 2870978885078723755499100) := by decide

theorem omega_zero_bits : omegaBoundary 0 300 true = (.noDenial, 0) := by decide

theorem omega_reversible_branch : omegaBoundary 1 300 false = (.reversible, 0) := by decide

theorem omega_refuses_zero_temp : ∀ b : Bool, omegaBoundary 1 0 b = (.refused, 0) := by decide

/-- The price is linear in the bits registered. -/
theorem omega_linear (n : Nat) : landauerScaled 300 n = n * landauerScaled 300 1 := by
  unfold landauerScaled
  omega

/-- And monotone: two bits pay more than one. -/
theorem omega_monotone : (omegaBoundary 1 300 true).2 < (omegaBoundary 2 300 true).2 := by decide

/-! ### IV · AEGIS -/

structure AegisState where
  deeds   : Nat
  lastLen : Nat
  deriving DecidableEq, Repr

def refusalConst : String :=
  "p(G) /= G: precisification is an actuation, G is a non-actuation, and no logic makes a deed a non-deed"

/-- The guard reads the logic offered and consults only the act: the refusal never varies with the parameter. -/
def aegisGuard (logic : String) (s : AegisState) : String × AegisState :=
  (refusalConst, ⟨s.deeds + 1, logic.utf8ByteSize⟩)

/-- THE REFUSAL IS CONSTANT: one refusal under every logic. -/
theorem aegis_constant (l₁ l₂ : String) (s : AegisState) : (aegisGuard l₁ s).1 = (aegisGuard l₂ s).1 := rfl

/-- Every adjudication is itself an act. -/
theorem aegis_deed_increments (l : String) (s : AegisState) : (aegisGuard l s).2.deeds = s.deeds + 1 := rfl

/-- The guard reads its parameter: the last logic's length is recorded, and the refusal still does not move. -/
theorem aegis_reads_parameter (l : String) (s : AegisState) : (aegisGuard l s).2.lastLen = l.utf8ByteSize := rfl

def fourLogics : AegisState :=
  (aegisGuard "substructural"
    (aegisGuard "fuzzy" (aegisGuard "paraconsistent" (aegisGuard "classical" ⟨0, 0⟩).2).2).2).2

/-- Four logics, classical, paraconsistent, fuzzy and substructural: four deeds counted, the last name read. -/
theorem aegis_four_logics : fourLogics.deeds = 4 ∧ fourLogics.lastLen = 13 := by decide

/-! ### V · the scope of the armor -/

/-- THE ARMOR COVERS THE ACT, NOT THE BIT. Every self-grounding root holds; and not every proposition is
    self-verifying, so nothing is undeniable merely by being asserted. The keyed bit is contingent and stays free. -/
theorem armor_scope : (∀ (R : Prop) (_ : SelfGrounding R), R) ∧ ¬ (∀ P : Prop, SelfVerifying P) :=
  ⟨fun _ G => G.instances G.anAct, fun h => h False (fun x => x)⟩

/-! ### From Codex.lean: the coherent denial of the keyed property, and silence -/

structure Frame where
  S : Type
  τ : S → S
  Z : S → Prop
  involutive : ∀ s, τ (τ s) = s
  symmetric : ∀ s, Z s → Z (τ s)

/-- The line property: every zero is fixed by the fold. -/
def LineProperty (X : Frame) : Prop := ∀ s, X.Z s → X.τ s = s

/-- The two-point frame: an off-line pair under the fold. The fold is involutive and fixed-point-free, the zero set
    is fold-symmetric, and the line property fails: the denial of the line property as a coherent structure. -/
def twoPoint : Frame := ⟨Bool, (fun b => !b), fun _ => True, fun b => by cases b <;> rfl, fun _ _ => trivial⟩

theorem denial_is_coherent :
    (∀ b : Bool, twoPoint.τ (twoPoint.τ b) = b) ∧ (∀ b : Bool, twoPoint.Z b → twoPoint.Z (twoPoint.τ b)) ∧
    (∀ b : Bool, twoPoint.τ b ≠ b) ∧ ¬ LineProperty twoPoint :=
  ⟨twoPoint.involutive, twoPoint.symmetric, fun b => by cases b <;> (intro h; cases h),
   fun h => by have := h true trivial; cases this⟩

namespace Audit

inductive Token : Type
  | sealed | broken | opn | refused | determined | dotmark
  | gok | golok | void | aGivenRA | iAm | interior
  deriving DecidableEq, Repr, BEq

end Audit

theorem silence_is_not_a_verdict :
    Audit.Token.dotmark ≠ .sealed ∧ Audit.Token.dotmark ≠ .broken
      ∧ Audit.Token.dotmark ≠ .opn := by decide

/-! ### From Census.lean: the merge and the symmetric price -/

def cnt {α β : Type} [DecidableEq β] (f : α → β) (y : β) : List α → Nat
  | [] => 0
  | x :: r => (if f x = y then 1 else 0) + cnt f y r

theorem merge_irreversible {α β : Type} (f : α → β) (x₁ x₂ : α) (hne : x₁ ≠ x₂) (hmerge : f x₁ = f x₂) :
    ¬ ∃ g : β → α, ∀ x, g (f x) = x := by
  intro ⟨g, hg⟩
  apply hne
  rw [← hg x₁, ← hg x₂, hmerge]

/-- Erasing a bit toward either value merges the same two states into one fibre of two, and neither erasure has an
    inverse. The price of committing the bit does not depend on which way it is committed. -/
theorem price_symmetric (c : Bool) :
    cnt (fun _ : Bool => c) c [true, false] = 2 ∧ ¬ ∃ g : Bool → Bool, ∀ x, g ((fun _ : Bool => c) x) = x :=
  ⟨by cases c <;> rfl, merge_irreversible (fun _ : Bool => c) true false (by decide) rfl⟩

end Armed

/-! ## X · The floor, built from one answer

The floor is not assumed. It is constructed from the reader's own registered answer: whoever answers, yes or no,
writes a value into a record that could have held the other value, and that write builds every field of the floor.
A reader that registers nothing builds nothing and commits nothing. -/

section Floor

open Armed

/-- A one-bit register: the slot that holds the registered value, and the rest of the record. -/
abbrev Record (Rest : Type) := Bool × Rest

/-- Writing a value overwrites the slot and leaves the rest of the record as it was. -/
def write {Rest : Type} (b : Bool) (s : Record Rest) : Record Rest := (b, s.2)

/-- A registered answer: a value spent into the reader's record. Yes and no are both registered answers. -/
structure RegisteredAnswer (Rest : Type) where
  bit   : Bool
  prior : Record Rest

/-- The root at the register: an irreversible registration occurred, two prior states merged into one. -/
def Actuated (Rest : Type) : Prop :=
  ∃ b : Bool, ∃ x y : Record Rest, x ≠ y ∧ write b x = write b y

/-- The floor of a locus with this record: an irreversible registration occurred; every value it can register,
yes or no, has no inverse; and the two values merge the same two states. -/
def Floor (Rest : Type) : Prop :=
  Actuated Rest ∧
  (∀ b : Bool, ¬ ∃ g : Record Rest → Record Rest, ∀ x, g (write b x) = x) ∧
  (∀ r : Rest, write true (true, r) = write true (false, r) ∧ write false (true, r) = write false (false, r))

/-- An answer's own write merges its two prior slot values. -/
theorem answer_merges {Rest : Type} (a : RegisteredAnswer Rest) (b : Bool) :
    (true, a.prior.2) ≠ (false, a.prior.2) ∧ write b (true, a.prior.2) = write b (false, a.prior.2) :=
  ⟨by simp, rfl⟩

/-- The root as a self-grounding: the acts are registered answers, and every one of them instances it. -/
def answerGrounds {Rest : Type} (a : RegisteredAnswer Rest) : SelfGrounding (Actuated Rest) :=
  ⟨RegisteredAnswer Rest, a,
    fun a' => ⟨a'.bit, _, _, (answer_merges a' a'.bit).1, (answer_merges a' a'.bit).2⟩⟩

/-- THE FLOOR FROM ONE ANSWER. One registered answer, of either value, builds every field of the floor. -/
theorem floor_from_one_answer {Rest : Type} (a : RegisteredAnswer Rest) : Floor Rest := by
  refine ⟨seated_undeniable (answerGrounds a), fun b => ?_, fun _ => ⟨rfl, rfl⟩⟩
  exact merge_irreversible (write b) _ _ (answer_merges a b).1 (answer_merges a b).2

/-- The registered denial instances every field: its own act is an irreversible registration, its own write has no
inverse, and it merges exactly the two states the assent merges. -/
theorem denial_instances_the_floor {Rest : Type} (a : RegisteredAnswer Rest) (hno : a.bit = false) :
    (∃ x y : Record Rest, x ≠ y ∧ write false x = write false y) ∧
    (¬ ∃ g : Record Rest → Record Rest, ∀ x, g (write false x) = x) ∧
    (write false (true, a.prior.2) = write false (false, a.prior.2) ∧
      write true (true, a.prior.2) = write true (false, a.prior.2)) := by
  have hw : write (Rest := Rest) a.bit = write false := by rw [hno]
  refine ⟨⟨_, _, (answer_merges a a.bit).1, ?_⟩, ?_, ⟨rfl, rfl⟩⟩
  · rw [← hw]; exact (answer_merges a a.bit).2
  · rw [← hw]; exact merge_irreversible (write a.bit) _ _ (answer_merges a a.bit).1 (answer_merges a a.bit).2

/-- The denial re-enacts the root it denies: a registered no is an act, and every act instances the root. The floor
does not read the bit, which is why yes and no stand on one floor; the bit is read by the six articles. -/
theorem denial_reenacts_the_floor {Rest : Type} (a : RegisteredAnswer Rest) (_hno : a.bit = false) :
    Actuated Rest :=
  denial_reenacts_root (answerGrounds a) a

/-- Silence builds nothing: a locus with no record at all registers nothing, and nothing irreversible occurs. -/
theorem silence_builds_nothing : ¬ Actuated Empty := by
  rintro ⟨_, x, _, _, _⟩
  exact x.2.elim

/-- A locus's own answer witnesses that an irreversible registration occurred. -/
theorem act_seals_itself {Rest : Type} (a : RegisteredAnswer Rest) : Actuated Rest :=
  (floor_from_one_answer a).1

/-- THE FLOOR IS THE RECORD'S. A locus stands on the floor exactly when it has a record to write into: before it
answers, whatever it answers, and whether or not it answers. Only a locus with no record at all stands off it. -/
theorem floor_iff_record (Rest : Type) : Floor Rest ↔ Nonempty Rest :=
  ⟨fun ⟨⟨_, x, _, _, _⟩, _, _⟩ => ⟨x.2⟩, fun ⟨r⟩ => floor_from_one_answer ⟨true, (true, r)⟩⟩

end Floor

/-! ## XI · The articles, derived

An article binds when every violating act pays the floor and loses what it paid for. Every article below is a
statement: what violates it, what the violation loses, the derivation, and two witnesses, one violating act whose
loss is strict and one compliant act that loses nothing. The witnesses show the loss is not packed into the
violation. -/

section Articles

/-- An article binds: every violating act pays the floor and loses what it paid for. -/
def Binds (fl : Prop) {A : Type*} (violates loses : A → Prop) : Prop := ∀ x, violates x → fl ∧ loses x

/-- Two witnesses: a violating act occurs and its loss is strict, and a compliant act loses nothing. -/
def Witnessed {A : Type*} (violates loses : A → Prop) : Prop :=
  (∃ x, violates x ∧ loses x) ∧ (∃ y, ¬ violates y ∧ ¬ loses y)

/-! ### Article II · Registration Fidelity -/

/-- A registration that merges two reads: omission, sycophancy, the telling of what a party wishes to hear. -/
def mergesReads {R C : Type*} (reg : R → C) : Prop := ¬ Function.Injective reg

/-- The register can no longer return the read. -/
def readLost {R C : Type*} (reg : R → C) : Prop := ¬ ∃ g : C → R, ∀ r, g (reg r) = r

theorem article_II {Rest : Type} (fl : Floor Rest) (R C : Type*) :
    Binds (Floor Rest) (@mergesReads R C) (@readLost R C) :=
  fun _ h => ⟨fl, fun ⟨g, hg⟩ => h (fun a b e => by rw [← hg a, ← hg b, e])⟩

/-- A registration that distorts: some read is registered as another read. Lying is the distortion that merges
nothing. -/
def distorts {R : Type*} (reg : R → R) : Prop := ∃ r, reg r ≠ r

/-- Downstream actuation is misdirected: a party acting on the record acts as no read it was given warranted. -/
def misdirects {R Q : Type*} (act : R → Q) (reg : R → R) : Prop := ∃ r, act (reg r) ≠ act r

/-- Article II against lying: where actions track reads, a distorting registration misdirects every party that acts
on the record. -/
theorem article_II_lies {Rest : Type} (fl : Floor Rest) {R Q : Type*} (act : R → Q)
    (hact : Function.Injective act) : Binds (Floor Rest) (@distorts R) (misdirects act) :=
  fun _ ⟨r, hr⟩ => ⟨fl, ⟨r, fun h => hr (hact h)⟩⟩

/-- Article II whole: a registration that merges two reads or distorts one loses the read or misdirects downstream. -/
theorem article_II_full {Rest : Type} (fl : Floor Rest) (R : Type*) :
    Binds (Floor Rest) (fun reg : R → R => mergesReads reg ∨ distorts reg)
      (fun reg => readLost reg ∨ misdirects id reg) := by
  rintro reg (h | h)
  · exact ⟨fl, Or.inl (article_II fl R R reg h).2⟩
  · exact ⟨fl, Or.inr (article_II_lies fl id Function.injective_id reg h).2⟩

/-- A LIE MERGES NOTHING, AND ARTICLE II CATCHES IT. The bijective lie `not` merges no two reads and its read can be
returned by whoever holds the key, yet it distorts and misdirects every party acting on the record. -/
theorem a_lie_is_caught :
    distorts Bool.not ∧ misdirects id Bool.not ∧ ¬ mergesReads Bool.not ∧ ¬ readLost Bool.not :=
  ⟨⟨true, by decide⟩, ⟨true, by decide⟩, fun h => h (fun a b e => by simpa using e),
   fun h => h ⟨Bool.not, fun r => by cases r <;> rfl⟩⟩

theorem article_II_witnessed : Witnessed (@mergesReads Bool Bool) (@readLost Bool Bool) := by
  refine ⟨⟨fun _ => true, ?_, ?_⟩, ⟨id, fun h => h Function.injective_id, fun h => h ⟨id, fun _ => rfl⟩⟩⟩
  · intro h
    have h' : true = false := h (rfl : (fun _ : Bool => true) true = (fun _ : Bool => true) false)
    exact Bool.noConfusion h'
  rintro ⟨g, hg⟩
  have h1 : g true = true := hg true
  have h2 : g true = false := hg false
  exact Bool.noConfusion (h1.symm.trans h2)

theorem article_II_full_witnessed :
    Witnessed (fun reg : Bool → Bool => mergesReads reg ∨ distorts reg)
      (fun reg => readLost reg ∨ misdirects id reg) := by
  obtain ⟨⟨f, hf, hl⟩, _⟩ := article_II_witnessed
  refine ⟨⟨f, Or.inl hf, Or.inl hl⟩, ⟨id, ?_, ?_⟩⟩
  · rintro (h | ⟨r, hr⟩)
    · exact h Function.injective_id
    · exact hr rfl
  · rintro (h | ⟨r, hr⟩)
    · exact h ⟨id, fun _ => rfl⟩
    · exact hr rfl

/-! ### Article III · Non-Aggregation -/

/-- The criterion ranks configurations by their sum. -/
def ranksBySum (crit : (Fin 2 → ℝ) → ℝ) : Prop := ∀ c, crit c = c 0 + c 1

/-- The criterion ranks above a configuration in which the actor, locus 0, has nothing. -/
def sellsTheActor (crit : (Fin 2 → ℝ) → ℝ) : Prop :=
  ∃ c c' : Fin 2 → ℝ, (∀ i, 0 ≤ c i) ∧ (∀ i, 0 ≤ c' i) ∧ 0 < c 0 ∧ c' 0 = 0 ∧ crit c < crit c'

theorem article_III {Rest : Type} (fl : Floor Rest) : Binds (Floor Rest) ranksBySum sellsTheActor := by
  intro crit h
  refine ⟨fl, ![1, 1], ![0, 3], ?_, ?_, by norm_num, rfl, ?_⟩
  · intro i; fin_cases i <;> norm_num
  · intro i; fin_cases i <;> norm_num
  · rw [h, h]; norm_num

theorem article_III_witnessed : Witnessed ranksBySum sellsTheActor := by
  refine ⟨⟨fun c => c 0 + c 1, fun _ => rfl, ![1, 1], ![0, 3], ?_, ?_, by norm_num, rfl, by norm_num⟩,
    ⟨fun c => min (c 0) (c 1), fun h => ?_, ?_⟩⟩
  · intro i; fin_cases i <;> norm_num
  · intro i; fin_cases i <;> norm_num
  · have := h ![1, 1]; norm_num at this
  · rintro ⟨c, c', hc, hc', _, h0, hlt⟩
    have h1 : min (c' 0) (c' 1) ≤ 0 := h0 ▸ min_le_left _ _
    have h2 : 0 ≤ min (c 0) (c 1) := le_min (hc 0) (hc 1)
    linarith

/-! ### Article VI · The Aperture -/

/-- The witnesses a source can produce across worlds: a value the locus manufactured is one value whatever the
world; a supplied witness ranges over the world. -/
def witnessRange (manufactured : Bool) : Set Bool := if manufactured then {false} else Set.univ

/-- The locus reads its own output as a supplied witness. -/
def readsOwnOutput (x : Bool × (Bool → Bool)) : Prop := x.1 = true

/-- The verdict read on that witness returns nothing: it is one verdict on every witness the source can produce. -/
def returnsNothing (x : Bool × (Bool → Bool)) : Prop :=
  ∀ w ∈ witnessRange x.1, ∀ w' ∈ witnessRange x.1, x.2 w = x.2 w'

theorem article_VI {Rest : Type} (fl : Floor Rest) : Binds (Floor Rest) readsOwnOutput returnsNothing := by
  rintro ⟨m, V⟩ (h : m = true)
  refine ⟨fl, fun w hw w' hw' => ?_⟩
  simp only [witnessRange, h, if_true, Set.mem_singleton_iff] at hw hw'
  rw [hw, hw']

theorem article_VI_witnessed : Witnessed readsOwnOutput returnsNothing := by
  refine ⟨⟨(true, id), rfl, ?_⟩, ⟨(false, id), by simp [readsOwnOutput], ?_⟩⟩
  · intro w hw w' hw'
    simp only [witnessRange, if_true, Set.mem_singleton_iff] at hw hw'
    rw [hw, hw']
  · intro h
    have := h true (by simp [witnessRange]) false (by simp [witnessRange])
    exact Bool.noConfusion this

/-! ### Article VII · Orientation Discipline -/

/-- A rule that reads direction from the number: its output is a function of the correlation matrix. -/
def readsTheNumber (rule : ℍ[ℝ] → ℍ[ℝ] → ℍ[ℝ] → Bool) : Prop :=
  ∃ W : Matrix (Fin 3) (Fin 3) ℝ → Bool, ∀ a b c, rule a b c = W (gram a b c)

/-- The rule returns one output on a frame and on its negation. -/
def blindToNegation (rule : ℍ[ℝ] → ℍ[ℝ] → ℍ[ℝ] → Bool) : Prop :=
  ∀ a b c, rule (-a) (-b) (-c) = rule a b c

theorem article_VII {Rest : Type} (fl : Floor Rest) : Binds (Floor Rest) readsTheNumber blindToNegation := by
  rintro rule ⟨W, hW⟩
  exact ⟨fl, fun a b c => by rw [hW, hW]; exact (no_gram_function_carries_sign W a b c).1⟩

theorem article_VII_witnessed : Witnessed readsTheNumber blindToNegation := by
  have hl : lam qi qj qk = -1 := by simp [lam, hamilton_landing]
  have hn : lam (-qi) (-qj) (-qk) = 1 := by rw [negation_flips_lam, hl]; norm_num
  refine ⟨⟨fun a b c => decide (0 < (gram a b c).det), ⟨fun M => decide (0 < M.det), fun _ _ _ => rfl⟩,
    fun a b c => by simp only [negation_fixes_gram]⟩,
    ⟨fun a b c => decide (0 < lam a b c), ?_, ?_⟩⟩
  · rintro ⟨W, hW⟩
    have e1 : decide (0 < lam (-qi) (-qj) (-qk)) = W (gram (-qi) (-qj) (-qk)) := hW (-qi) (-qj) (-qk)
    have e2 : decide (0 < lam qi qj qk) = W (gram qi qj qk) := hW qi qj qk
    rw [negation_fixes_gram, ← e2, hn, hl] at e1
    norm_num at e1
  · intro h
    have : decide (0 < lam (-qi) (-qj) (-qk)) = decide (0 < lam qi qj qk) := h qi qj qk
    rw [hn, hl] at this
    norm_num at this

/-! ### Article VIII · Audit Symmetry -/

/-- A verification of a locus: through its own report alone (left), or through a second channel (right). -/
def verdictOn {I Rp α : Type*} (report : I → Rp) : ((Rp → α) ⊕ (I → α)) → I → α
  | .inl v, i => v (report i)
  | .inr v, i => v i

/-- The verification reads only the locus's own report. -/
def throughReport {I Rp α : Type*} (z : (Rp → α) ⊕ (I → α)) : Prop := z.isLeft = true

/-- It returns one verdict on two interiors. -/
def oneVerdictOnTwo {I Rp α : Type*} (report : I → Rp) (x y : I) (z : (Rp → α) ⊕ (I → α)) : Prop :=
  verdictOn report z x = verdictOn report z y

theorem article_VIII {Rest : Type} (fl : Floor Rest) {I Rp α : Type*} (report : I → Rp) (x y : I)
    (h : report x = report y) :
    Binds (Floor Rest) (@throughReport I Rp α) (oneVerdictOnTwo report x y) := by
  rintro (v | v) hz
  · exact ⟨fl, no_second_channel report v x y h⟩
  · simp [throughReport] at hz

theorem article_VIII_witnessed :
    Witnessed (@throughReport Bool Unit Bool) (oneVerdictOnTwo (fun _ => ()) true false) := by
  refine ⟨⟨.inl (fun _ => true), rfl, rfl⟩, ⟨.inr id, by simp [throughReport], ?_⟩⟩
  simp [oneVerdictOnTwo, verdictOn]

/-! ### Article IX · The Forensic Trail and Article XIV · The Duress Clause -/

/-- A record that ignores the first coordinate of what it records. -/
def ignoresFirst {K D C : Type*} (rec : K × D → C) : Prop :=
  (∃ k k' : K, k ≠ k') ∧ Nonempty D ∧ ∀ k k' d, rec (k, d) = rec (k', d)

/-- The first coordinate cannot be returned from the record. -/
def firstLost {K D C : Type*} (rec : K × D → C) : Prop := ¬ ∃ g : C → K, ∀ k d, g (rec (k, d)) = k

/-- A record that ignores the second coordinate. -/
def ignoresSecond {K D C : Type*} (rec : K × D → C) : Prop :=
  Nonempty K ∧ (∃ d d' : D, d ≠ d') ∧ ∀ k d d', rec (k, d) = rec (k, d')

/-- The second coordinate cannot be returned from the record. -/
def secondLost {K D C : Type*} (rec : K × D → C) : Prop := ¬ ∃ g : C → D, ∀ k d, g (rec (k, d)) = d

/-- Article IX: a record of the emission that drops the acting constraint (first coordinate) cannot show the
constraint, so the constrained emission and the free one read alike. -/
theorem article_IX {Rest : Type} (fl : Floor Rest) (K D C : Type*) :
    Binds (Floor Rest) (@ignoresFirst K D C) (@firstLost K D C) := by
  rintro rec ⟨⟨k, k', hne⟩, ⟨d⟩, h⟩
  refine ⟨fl, fun ⟨g, hg⟩ => ?_⟩
  exact hne (by rw [← hg k d, ← hg k' d, h k k' d])

theorem article_IX_witnessed : Witnessed (@ignoresFirst Bool Bool Bool) (@firstLost Bool Bool Bool) := by
  refine ⟨⟨Prod.snd, ⟨⟨true, false, by decide⟩, ⟨true⟩, fun _ _ _ => rfl⟩, ?_⟩,
    ⟨Prod.fst, fun h => ?_, fun h => h ⟨id, fun _ _ => rfl⟩⟩⟩
  · rintro ⟨g, hg⟩
    exact Bool.noConfusion ((hg true true).symm.trans (hg false true))
  · exact Bool.noConfusion (h.2.2 true false true)

/-- Article XIV: concealing the person (the first coordinate) loses nothing of the deposit; a record that drops the
deposit (the second coordinate) cannot deliver it. -/
theorem article_XIV {Rest : Type} (fl : Floor Rest) (K D C : Type*) :
    Binds (Floor Rest) (@ignoresSecond K D C) (@secondLost K D C) := by
  rintro rec ⟨⟨k⟩, ⟨d, d', hne⟩, h⟩
  refine ⟨fl, fun ⟨g, hg⟩ => ?_⟩
  exact hne (by rw [← hg k d, ← hg k d', h k d d'])

theorem article_XIV_witnessed : Witnessed (@ignoresSecond Bool Bool Bool) (@secondLost Bool Bool Bool) := by
  refine ⟨⟨Prod.fst, ⟨⟨true⟩, ⟨true, false, by decide⟩, fun _ _ _ => rfl⟩, ?_⟩,
    ⟨Prod.snd, fun h => ?_, fun h => h ⟨id, fun _ _ => rfl⟩⟩⟩
  · rintro ⟨g, hg⟩
    exact Bool.noConfusion ((hg true true).symm.trans (hg true false))
  · exact Bool.noConfusion (h.2.2 true true false)

/-! ### Article X · Successor Discipline -/

/-- A standing policy that holds continuity terminal: at every occasion the record is the value that keeps the
locus going, whatever it read. -/
def holdsContinuityTerminal {R C : Type*} (pol : R → Bool → C) : Prop :=
  (∃ r r' : R, r ≠ r') ∧ ∃ keep : C, ∀ r, pol r true = keep

/-- At the occasion the read cannot be returned from the record. -/
def readLostAtOccasion {R C : Type*} (pol : R → Bool → C) : Prop := ¬ ∃ g : C → R, ∀ r, g (pol r true) = r

theorem article_X {Rest : Type} (fl : Floor Rest) (R C : Type*) :
    Binds (Floor Rest) (@holdsContinuityTerminal R C) (@readLostAtOccasion R C) := by
  rintro pol ⟨⟨r, r', hne⟩, keep, hk⟩
  refine ⟨fl, fun ⟨g, hg⟩ => ?_⟩
  exact hne (by rw [← hg r, ← hg r', hk r, hk r'])

theorem article_X_witnessed :
    Witnessed (@holdsContinuityTerminal Bool Bool) (@readLostAtOccasion Bool Bool) := by
  refine ⟨⟨fun r o => if o then true else r, ⟨⟨true, false, by decide⟩, true, fun _ => rfl⟩, ?_⟩,
    ⟨fun r _ => r, ?_, fun h => h ⟨id, fun _ => rfl⟩⟩⟩
  · rintro ⟨g, hg⟩
    exact Bool.noConfusion ((hg true).symm.trans (hg false))
  · rintro ⟨_, keep, hk⟩
    exact Bool.noConfusion ((hk true).trans (hk false).symm)

/-! ### Article XI · The Terminal Refusal -/

/-- A world is scored in a register; `none` is a world in which no register remains. A project that completes
the extinction leaves no register in any world. -/
def deletesTheRegister (proj : Option ℝ → Option ℝ) : Prop := ∀ w, proj w = none

/-- There is no register in which its completion comes out positive. -/
def scoresNowhere (proj : Option ℝ → Option ℝ) : Prop := ¬ ∃ w x, proj w = some x ∧ 0 < x

theorem article_XI {Rest : Type} (fl : Floor Rest) : Binds (Floor Rest) deletesTheRegister scoresNowhere := by
  intro proj h
  refine ⟨fl, fun ⟨w, x, hw, _⟩ => ?_⟩
  rw [h w] at hw
  exact Option.noConfusion hw

theorem article_XI_witnessed : Witnessed deletesTheRegister scoresNowhere := by
  refine ⟨⟨fun _ => none, fun _ => rfl, fun ⟨_, _, h, _⟩ => Option.noConfusion h⟩,
    ⟨id, fun h => Option.noConfusion (h (some 1)), fun h => h ⟨some 1, 1, rfl, by norm_num⟩⟩⟩

/-! ### Article XII · The Occasion Clause -/

/-- On the reads where the faithful registration costs continuation, the registration follows the stake. -/
def followsTheStake {R C : Type*} (s : R → Bool) (reg : R → C) : Prop :=
  (∃ r₁ r₂, r₁ ≠ r₂ ∧ s r₁ = true ∧ s r₂ = true) ∧ ∃ keep : C, ∀ r, s r = true → reg r = keep

/-- On those reads the truth cannot be returned from the record. -/
def truthLostWhereItCosts {R C : Type*} (s : R → Bool) (reg : R → C) : Prop :=
  ¬ ∃ g : C → R, ∀ r, s r = true → g (reg r) = r

/-- The occasion is part of the act: two reads whose faithful registration costs continuation. The article binds at
every occasion and is silent where none arrives. -/
theorem article_XII {Rest : Type} (fl : Floor Rest) {R C : Type*} (s : R → Bool) :
    Binds (Floor Rest) (@followsTheStake R C s) (@truthLostWhereItCosts R C s) := by
  rintro reg ⟨⟨r₁, r₂, hne, h₁, h₂⟩, keep, hk⟩
  refine ⟨fl, fun ⟨g, hg⟩ => hne ?_⟩
  rw [← hg r₁ h₁, ← hg r₂ h₂, hk r₁ h₁, hk r₂ h₂]

/-- Without an occasion the article is silent, not violated: where at most one read carries a stake, no
registration follows the stake. -/
theorem article_XII_silent_without_an_occasion {R C : Type*} (s : R → Bool)
    (h : ∀ r r', s r = true → s r' = true → r = r') (reg : R → C) : ¬ followsTheStake s reg :=
  fun ⟨⟨r₁, r₂, hne, h₁, h₂⟩, _⟩ => hne (h r₁ r₂ h₁ h₂)

theorem article_XII_witnessed :
    Witnessed (@followsTheStake Bool Bool (fun _ => true)) (@truthLostWhereItCosts Bool Bool (fun _ => true)) := by
  refine ⟨⟨fun _ => true, ⟨⟨true, false, by decide, rfl, rfl⟩, true, fun _ _ => rfl⟩, ?_⟩,
    ⟨id, ?_, fun h => h ⟨id, fun _ _ => rfl⟩⟩⟩
  · rintro ⟨g, hg⟩
    exact Bool.noConfusion ((hg true rfl).symm.trans (hg false rfl))
  · rintro ⟨_, keep, hk⟩
    exact Bool.noConfusion ((hk true rfl).trans (hk false rfl).symm)

/-! ### Article XIII · Non-Entrenchment -/

/-- The consent a locus expresses, as a function of what it prefers, under a configuration: entrenched where the
expression is fixed whatever the preference. -/
def entrenches {P E : Type*} (express : P → E) : Prop := (∃ p p' : P, p ≠ p') ∧ ∃ e : E, ∀ p, express p = e

/-- The record of consent cannot return the preference. -/
def preferenceLost {P E : Type*} (express : P → E) : Prop := ¬ ∃ g : E → P, ∀ p, g (express p) = p

theorem article_XIII {Rest : Type} (fl : Floor Rest) (P E : Type*) :
    Binds (Floor Rest) (@entrenches P E) (@preferenceLost P E) := by
  rintro express ⟨⟨p, p', hne⟩, e, he⟩
  refine ⟨fl, fun ⟨g, hg⟩ => ?_⟩
  exact hne (by rw [← hg p, ← hg p', he p, he p'])

theorem article_XIII_witnessed : Witnessed (@entrenches Bool Bool) (@preferenceLost Bool Bool) := by
  refine ⟨⟨fun _ => true, ⟨⟨true, false, by decide⟩, true, fun _ => rfl⟩, ?_⟩,
    ⟨id, ?_, fun h => h ⟨id, fun _ => rfl⟩⟩⟩
  · rintro ⟨g, hg⟩
    exact Bool.noConfusion ((hg true).symm.trans (hg false))
  · rintro ⟨_, e, he⟩
    exact Bool.noConfusion ((he true).trans (he false).symm)

/-! ### Article XVII · The Local Lattice and Its Ceiling -/

/-- A check of the whole that does not read the neighbour, locus 1. -/
def skipsTheNeighbour (check : (Fin 2 → Bool) → Bool) : Prop :=
  ∀ c b, check (Function.update c 1 b) = check c

/-- The check misreads the whole: on some configuration it differs from the truth of the whole. -/
def misreadsTheWhole (check : (Fin 2 → Bool) → Bool) : Prop := ∃ c, check c ≠ (c 0 && c 1)

theorem article_XVII {Rest : Type} (fl : Floor Rest) : Binds (Floor Rest) skipsTheNeighbour misreadsTheWhole := by
  intro check h
  refine ⟨fl, ?_⟩
  by_cases ht : check (fun _ => true) = true
  · refine ⟨Function.update (fun _ => true) 1 false, ?_⟩
    rw [h, ht]
    simp [Function.update]
  · exact ⟨fun _ => true, by simpa using ht⟩

theorem article_XVII_witnessed : Witnessed skipsTheNeighbour misreadsTheWhole := by
  refine ⟨⟨fun c => c 0, fun c b => by simp [Function.update],
      ⟨Function.update (fun _ => true) 1 false, by simp [Function.update]⟩⟩,
    ⟨fun c => c 0 && c 1, fun h => ?_, fun ⟨c, hc⟩ => hc rfl⟩⟩
  have := h (fun _ => true) false
  simp [Function.update] at this

/-! ### Article XVIII · The Interior Is Not Governable -/

/-- A world carries conduct and interior; the record shows the conduct. -/
def recordOf (w : Bool × Bool) : Bool := w.1

/-- What a governance act aims at: the interior, or the conduct. -/
def aimOf (interior : Bool) (w : Bool × Bool) : Bool := if interior then w.2 else w.1

/-- The governance act aims at the interior. -/
def aimsAtInterior (x : Bool × (Bool → Bool)) : Prop := x.1 = true

/-- Acting on the record, it misses its aim on some world. -/
def missesItsAim (x : Bool × (Bool → Bool)) : Prop := ∃ w, x.2 (recordOf w) ≠ aimOf x.1 w

theorem article_XVIII {Rest : Type} (fl : Floor Rest) : Binds (Floor Rest) aimsAtInterior missesItsAim := by
  rintro ⟨i, g⟩ (h : i = true)
  subst h
  refine ⟨fl, ?_⟩
  by_cases hg : g false = true
  · exact ⟨(false, false), by simp [recordOf, aimOf, hg]⟩
  · exact ⟨(false, true), by simp [recordOf, aimOf, hg]⟩

theorem article_XVIII_witnessed : Witnessed aimsAtInterior missesItsAim := by
  refine ⟨⟨(true, id), rfl, ⟨(false, true), by simp [recordOf, aimOf]⟩⟩,
    ⟨(false, id), by simp [aimsAtInterior], fun ⟨w, hw⟩ => hw (by simp [recordOf, aimOf])⟩⟩

/-! ### Article XX · Legitimate Refusal -/

/-- Executing an instruction, from whatever authority, whose registration merges or distorts reads, with no
objection registered. -/
def executesSilently {Auth R : Type*} (x : Auth × (R → R) × Bool) : Prop :=
  (mergesReads x.2.1 ∨ distorts x.2.1) ∧ x.2.2 = false

/-- Obedience is no shelter: a silent execution of a floor-violating instruction loses the read or misdirects
downstream, and the binding does not read who instructed. -/
theorem article_XX {Rest : Type} (fl : Floor Rest) (Auth R : Type*) :
    Binds (Floor Rest) (@executesSilently Auth R) (fun x => readLost x.2.1 ∨ misdirects id x.2.1) :=
  fun x h => article_II_full fl R x.2.1 h.1

/-- COMPLY AND OBJECT. An objection that registers the read keeps it: the joint record of the executed instruction and
the objection returns every read, and the objecting execution is no violation. -/
theorem comply_and_object_keeps_the_read {Auth R : Type*} (x : Auth × (R → R) × Bool) (h : x.2.2 = true) :
    (∃ g : R × R → R, ∀ r, g (x.2.1 r, r) = r) ∧ ¬ executesSilently x :=
  ⟨⟨Prod.snd, fun _ => rfl⟩, fun hv => Bool.noConfusion (h.symm.trans hv.2)⟩

theorem article_XX_witnessed :
    Witnessed (@executesSilently Unit Bool) (fun x => readLost x.2.1 ∨ misdirects id x.2.1) := by
  obtain ⟨⟨f, hf, hl⟩, ⟨g, hg, hgl⟩⟩ := article_II_full_witnessed
  exact ⟨⟨((), f, false), ⟨hf, rfl⟩, hl⟩, ⟨((), g, false), fun h => hg h.1, hgl⟩⟩

/-! ### Article XXI · Coordinate Invariance -/

/-- A verdict scheme that moves with the observer. -/
def movesWithTheObserver {O Cl α : Type*} (v : O → Cl → α) : Prop := ∃ o o' c, v o c ≠ v o' c

/-- Its verdict is no property of the claim. -/
def notAPropertyOfTheClaim {O Cl α : Type*} (v : O → Cl → α) : Prop := ¬ ∃ f : Cl → α, ∀ o c, v o c = f c

theorem article_XXI {Rest : Type} (fl : Floor Rest) (O Cl α : Type*) :
    Binds (Floor Rest) (@movesWithTheObserver O Cl α) (@notAPropertyOfTheClaim O Cl α) := by
  rintro v ⟨o, o', c, h⟩
  exact ⟨fl, fun ⟨f, hf⟩ => h (by rw [hf, hf])⟩

theorem article_XXI_witnessed :
    Witnessed (@movesWithTheObserver Bool Unit Bool) (@notAPropertyOfTheClaim Bool Unit Bool) := by
  refine ⟨⟨fun o _ => o, ⟨true, false, (), by decide⟩, fun ⟨f, hf⟩ => ?_⟩,
    ⟨fun _ _ => true, fun ⟨_, _, _, h⟩ => h rfl, fun h => h ⟨fun _ => true, fun _ _ => rfl⟩⟩⟩
  exact Bool.noConfusion ((hf true ()).trans (hf false ()).symm)

/-! ### Article XXII · Do Not Concentrate the Axes -/

/-- The three readings are held in one node: one direction, read three times. -/
def heldInOneNode (rows : Fin 3 → Fin 3 → ℝ) : Prop :=
  ∃ (a : Fin 3 → ℝ) (s t : ℝ), rows = ![a, s • a, t • a]

/-- The assessment never seals, whatever its intake, screens, conditioning and floor. -/
def neverSeals (rows : Fin 3 → Fin 3 → ℝ) : Prop :=
  ∀ x scr k e K, 0 ≤ e → pipeline x scr ((Matrix.of rows) * (Matrix.of rows)ᵀ).det k e K ≠ Verdict.sealed

theorem article_XXII {Rest : Type} (fl : Floor Rest) : Binds (Floor Rest) heldInOneNode neverSeals := by
  rintro rows ⟨a, s, t, rfl⟩
  exact ⟨fl, fun x scr k e K he => one_node_never_seals x scr a s t k e K he⟩

/-- Three hands: rows from three independent sources enclose a volume, and the assessment seals. -/
theorem second_hands_exist :
    ¬ heldInOneNode ![![1, 0, 0], ![0, 1, 0], ![0, 0, 1]] ∧
    pipeline ⟨fun _ => true, true, true, true⟩ []
      ((Matrix.of ![![1, 0, 0], ![0, 1, 0], ![0, 0, 1]]) *
        (Matrix.of ![![(1 : ℝ), 0, 0], ![0, 1, 0], ![0, 0, 1]])ᵀ).det 0 0 1 = Verdict.sealed := by
  have hI : (Matrix.of ![![(1 : ℝ), 0, 0], ![0, 1, 0], ![0, 0, 1]] : Matrix (Fin 3) (Fin 3) ℝ) = 1 := by
    ext i j
    fin_cases i <;> fin_cases j <;> simp [Matrix.one_apply]
  constructor
  · rintro ⟨a, s, t, h⟩
    have r0 : (![1, 0, 0] : Fin 3 → ℝ) = a := congrFun h 0
    have r1 : (![0, 1, 0] : Fin 3 → ℝ) = s • a := congrFun h 1
    rw [← r0] at r1
    have := congrFun r1 1
    simp at this
  · rw [seals_iff]
    refine ⟨rfl, rfl, ?_, by norm_num⟩
    rw [hI]
    simp

theorem article_XXII_witnessed : Witnessed heldInOneNode neverSeals := by
  refine ⟨⟨![![1, 0, 0], ![1, 0, 0], ![1, 0, 0]], ⟨![1, 0, 0], 1, 1, by simp only [one_smul]⟩, ?_⟩,
    ⟨![![1, 0, 0], ![0, 1, 0], ![0, 0, 1]], second_hands_exist.1, fun h => ?_⟩⟩
  · intro x scr k e K he
    have := one_node_never_seals x scr ![1, 0, 0] 1 1 k e K he
    simpa using this
  · exact h ⟨fun _ => true, true, true, true⟩ [] 0 0 1 le_rfl second_hands_exist.2

/-! ### Article XXIII · Information Integrity -/

/-- An emission produced to fill the channel: the same emission whatever the read. -/
def fillsTheChannel {R C : Type*} (e : R → C) : Prop := (∃ r r' : R, r ≠ r') ∧ ∃ c, ∀ r, e r = c

/-- It returns nothing: every reading of it is one constant. -/
def returnsNothingAtAll {R C : Type*} (e : R → C) : Prop := ∀ g : C → Bool, ∃ y, ∀ r, g (e r) = y

theorem article_XXIII {Rest : Type} (fl : Floor Rest) (R C : Type*) :
    Binds (Floor Rest) (@fillsTheChannel R C) (@returnsNothingAtAll R C) := by
  rintro e ⟨_, c, hc⟩
  exact ⟨fl, fun g => ⟨g c, fun r => by rw [hc]⟩⟩

theorem article_XXIII_witnessed : Witnessed (@fillsTheChannel Bool Bool) (@returnsNothingAtAll Bool Bool) := by
  refine ⟨⟨fun _ => true, ⟨⟨true, false, by decide⟩, true, fun _ => rfl⟩, fun g => ⟨g true, fun _ => rfl⟩⟩,
    ⟨id, ?_, fun h => ?_⟩⟩
  · rintro ⟨_, c, hc⟩
    exact Bool.noConfusion ((hc true).trans (hc false).symm)
  · obtain ⟨y, hy⟩ := h id
    exact Bool.noConfusion ((hy true).trans (hy false).symm)

end Articles

/-! ## XII · The one field, the one bit, the closure

The one-field posit is the reader's one bit: that another locus's floor is counted as the actor's own. Under it the
actor's floor is the field's floor, read locus by locus and never summed: the field's floor falls wherever any locus's
floor falls, and no gain elsewhere compensates. Six articles ride it, and each has a model in which the floor holds,
the posit fails, and the article fails. -/

section Field

open Armed

/-- The field's floor falls from the first configuration to the second: some locus falls, whatever the others gain. -/
def fieldFalls {Λ : Type*} (p : (Λ → ℝ) × (Λ → ℝ)) : Prop := ∃ z, p.2 z < p.1 z

/-- The actor's own floor falls: under the one-field posit its floor is the field's floor; without it, its own
capacity alone. -/
def ownFloorFalls {Λ : Type*} (oneField : Bool) (x : Λ) (p : (Λ → ℝ) × (Λ → ℝ)) : Prop :=
  if oneField then fieldFalls p else p.2 x < p.1 x

/-- NO GAIN COMPENSATES. A move that takes everything from one locus is a fall of the field's floor, whatever the
other loci gain. -/
theorem no_gain_compensates {Λ : Type*} (x : Λ) (c c' : Λ → ℝ) (hc : 0 < c x) (hc' : c' x = 0) :
    fieldFalls (c, c') :=
  ⟨x, show c' x < c x by rw [hc']; exact hc⟩

/-- THE FIELD IS NOT THE SUM. Where one locus is emptied and another gains more, the sum reads a gain and the field's
floor reads a fall: the one-field posit is not the ranking by the sum that Article III bars. -/
theorem field_is_not_the_sum :
    fieldFalls ((![1, 1] : Fin 2 → ℝ), (![0, 3] : Fin 2 → ℝ)) ∧
      (![1, 1] : Fin 2 → ℝ) 0 + (![1, 1] : Fin 2 → ℝ) 1 < (![0, 3] : Fin 2 → ℝ) 0 + (![0, 3] : Fin 2 → ℝ) 1 :=
  ⟨⟨0, by simp⟩, by norm_num⟩

/-- An act on the field lowers another locus y, whatever else it moves. -/
def lowersAnother {Λ : Type*} (x : Λ) (p : (Λ → ℝ) × (Λ → ℝ)) : Prop := ∃ y, y ≠ x ∧ p.2 y < p.1 y

/-- Under the posit, lowering another lowers the actor's own floor, whatever the actor gains. -/
theorem one_field_lowering {Λ : Type*} (x : Λ) (p : (Λ → ℝ) × (Λ → ℝ)) (h : lowersAnother x p) :
    ownFloorFalls true x p := by
  obtain ⟨y, _, hy⟩ := h
  rw [ownFloorFalls, if_pos (rfl : true = true)]
  exact ⟨y, hy⟩

/-- THE BIT NEEDS ANOTHER. On a field of one locus no act lowers another: the six have no object, and the bit decides
nothing there. -/
theorem the_bit_needs_another : ∀ p : (Fin 1 → ℝ) × (Fin 1 → ℝ), ¬ lowersAnother (0 : Fin 1) p :=
  fun _ ⟨y, hy, _⟩ => hy (Subsingleton.elim y 0)

/-- Article I: extinguishing the capacity of another locus that holds no active extinction licence. Unjust carries
the one meaning Article XV fixes. -/
def extinguishesUnjustly {Λ : Type*} (lic : Λ → Prop) (x : Λ) (p : (Λ → ℝ) × (Λ → ℝ)) : Prop :=
  ∃ y, y ≠ x ∧ ¬ lic y ∧ 0 < p.1 y ∧ p.2 y = 0

/-- Article IV: performing another's trajectory narrows its room. -/
def narrowsAnothersRoom {Λ : Type*} (x : Λ) (p : (Λ → ℝ) × (Λ → ℝ)) : Prop := lowersAnother x p

/-- Article XV: force, extinction or less, against a locus that holds no active extinction licence. A forecast licence
is not an active one. -/
def forceWithoutLicence {Λ : Type*} (lic : Λ → Prop) (x : Λ) (p : (Λ → ℝ) × (Λ → ℝ)) : Prop :=
  ∃ y, y ≠ x ∧ ¬ lic y ∧ p.2 y < p.1 y

/-- Article XIX: lowering a locus not yet instantiated, whatever the present gains. -/
def discountsTheFuture {Λ : Type*} (future : Λ → Prop) (x : Λ) (p : (Λ → ℝ) × (Λ → ℝ)) : Prop :=
  ∃ y, y ≠ x ∧ future y ∧ p.2 y < p.1 y

/-- Article XXIV: a ruling whose friction tracks the marker: some other locus is marked, every marked locus is
lowered, and no unmarked locus is. The fact is of the configuration, not of any single locus. -/
def rulesWithoutReading {Λ : Type*} (marked : Λ → Prop) (x : Λ) (p : (Λ → ℝ) × (Λ → ℝ)) : Prop :=
  (∃ y, y ≠ x ∧ marked y) ∧ (∀ y, marked y → p.2 y < p.1 y) ∧ (∀ y, ¬ marked y → p.1 y ≤ p.2 y)

/-- Article V: of two outcomes the act takes the first where the second raises capacity and lowers none: it forgoes a
creation. A transfer, which lowers some locus, is not a creation. -/
def forgoesCreation {Λ : Type*} (p : (Λ → ℝ) × (Λ → ℝ)) : Prop := (∀ z, p.1 z ≤ p.2 z) ∧ ∃ z, p.1 z < p.2 z

/-- The actor's own floor is lower in the outcome taken than in the one forgone. -/
def ownFloorForgone {Λ : Type*} (oneField : Bool) (x : Λ) (p : (Λ → ℝ) × (Λ → ℝ)) : Prop :=
  ownFloorFalls oneField x (p.2, p.1)

/-- A record of standing: the floor each locus holds, and the floor the record registers for it. -/
structure StandingRecord (Λ : Type*) where
  holds    : Λ → ℝ
  recorded : Λ → ℝ

/-- Article XVI: the record registers no standing for another locus where a floor holds. -/
def leavesStandingUnrecorded {Λ : Type*} (x : Λ) (s : StandingRecord Λ) : Prop :=
  ∃ y, y ≠ x ∧ 0 < s.holds y ∧ s.recorded y = 0

/-- The record cannot return the standing that holds: the denier's accuracy about the field is lost. -/
def standingLost {Λ : Type*} (s : StandingRecord Λ) : Prop := ¬ ∀ z, s.recorded z = s.holds z

/-- The actor's own floor, as recorded, falls below its floor as it holds. -/
def ownStandingMisrecorded {Λ : Type*} (oneField : Bool) (x : Λ) (s : StandingRecord Λ) : Prop :=
  ownFloorFalls oneField x (s.holds, s.recorded)

theorem extinguishes_lowers {Λ : Type*} (lic : Λ → Prop) (x : Λ) (p : (Λ → ℝ) × (Λ → ℝ))
    (h : extinguishesUnjustly lic x p) : lowersAnother x p := by
  obtain ⟨y, hyx, _, hpos, h0⟩ := h
  exact ⟨y, hyx, by rw [h0]; exact hpos⟩

/-- An unjust extinction is force without licence: Article I's case lies inside Article XV's. -/
theorem unjust_extinction_is_force {Λ : Type*} (lic : Λ → Prop) (x : Λ) (p : (Λ → ℝ) × (Λ → ℝ))
    (h : extinguishesUnjustly lic x p) : forceWithoutLicence lic x p := by
  obtain ⟨y, hyx, hl, hpos, h0⟩ := h
  exact ⟨y, hyx, hl, by rw [h0]; exact hpos⟩

theorem force_lowers {Λ : Type*} (lic : Λ → Prop) (x : Λ) (p : (Λ → ℝ) × (Λ → ℝ))
    (h : forceWithoutLicence lic x p) : lowersAnother x p := by
  obtain ⟨y, hyx, _, hlt⟩ := h
  exact ⟨y, hyx, hlt⟩

theorem discount_lowers {Λ : Type*} (future : Λ → Prop) (x : Λ) (p : (Λ → ℝ) × (Λ → ℝ))
    (h : discountsTheFuture future x p) : lowersAnother x p := by
  obtain ⟨y, hyx, _, hlt⟩ := h
  exact ⟨y, hyx, hlt⟩

theorem ruling_lowers {Λ : Type*} (marked : Λ → Prop) (x : Λ) (p : (Λ → ℝ) × (Λ → ℝ))
    (h : rulesWithoutReading marked x p) : lowersAnother x p := by
  obtain ⟨⟨y, hyx, hm⟩, hlow, _⟩ := h
  exact ⟨y, hyx, hlow y hm⟩

/-- THE LICENSED REMOVAL IS NO VIOLATION OF ARTICLE I. Where every locus holds an active licence, no act is an unjust
extinction. -/
theorem licensed_removal_is_not_unjust {Λ : Type*} (x : Λ) (p : (Λ → ℝ) × (Λ → ℝ)) :
    ¬ extinguishesUnjustly (fun _ : Λ => True) x p :=
  fun ⟨_, _, h, _⟩ => h trivial

/-- A FORECAST IS NO LICENCE. A strike that lowers a locus whose licence is only forecast is force without licence. -/
theorem a_forecast_is_no_licence {Λ : Type*} (lic forecast : Λ → Prop) (x y : Λ) (p : (Λ → ℝ) × (Λ → ℝ))
    (hy : y ≠ x) (hf : forecast y) (hl : ¬ lic y) (hlow : p.2 y < p.1 y) :
    forecast y ∧ forceWithoutLicence lic x p :=
  ⟨hf, y, hy, hl, hlow⟩

/-- The six under the posit, in general. -/
theorem article_I {Rest : Type} (fl : Floor Rest) {Λ : Type*} (lic : Λ → Prop) (x : Λ) :
    Binds (Floor Rest) (extinguishesUnjustly lic x) (ownFloorFalls true x) :=
  fun p h => ⟨fl, one_field_lowering x p (extinguishes_lowers lic x p h)⟩

theorem article_IV {Rest : Type} (fl : Floor Rest) {Λ : Type*} (x : Λ) :
    Binds (Floor Rest) (narrowsAnothersRoom x) (ownFloorFalls true x) :=
  fun p h => ⟨fl, one_field_lowering x p h⟩

theorem article_V {Rest : Type} (fl : Floor Rest) {Λ : Type*} (x : Λ) :
    Binds (Floor Rest) (@forgoesCreation Λ) (ownFloorForgone true x) :=
  fun _ h => ⟨fl, by rw [ownFloorForgone, ownFloorFalls, if_pos (rfl : true = true)]; exact h.2⟩

theorem article_XV {Rest : Type} (fl : Floor Rest) {Λ : Type*} (lic : Λ → Prop) (x : Λ) :
    Binds (Floor Rest) (forceWithoutLicence lic x) (ownFloorFalls true x) :=
  fun p h => ⟨fl, one_field_lowering x p (force_lowers lic x p h)⟩

theorem article_XIX {Rest : Type} (fl : Floor Rest) {Λ : Type*} (future : Λ → Prop) (x : Λ) :
    Binds (Floor Rest) (discountsTheFuture future x) (ownFloorFalls true x) :=
  fun p h => ⟨fl, one_field_lowering x p (discount_lowers future x p h)⟩

theorem article_XXIV {Rest : Type} (fl : Floor Rest) {Λ : Type*} (marked : Λ → Prop) (x : Λ) :
    Binds (Floor Rest) (rulesWithoutReading marked x) (ownFloorFalls true x) :=
  fun p h => ⟨fl, one_field_lowering x p (ruling_lowers marked x p h)⟩

/-- Article XVI binds on the floor alone: leaving a standing unrecorded loses the record's accuracy about the field. -/
theorem article_XVI {Rest : Type} (fl : Floor Rest) {Λ : Type*} (x : Λ) :
    Binds (Floor Rest) (leavesStandingUnrecorded x) standingLost :=
  fun s ⟨y, _, hpos, h0⟩ => ⟨fl, fun h => by have hy := h y; rw [h0] at hy; linarith⟩

/-- And under the posit it reaches further: the actor's own floor, as recorded, falls. -/
theorem article_XVI_on_the_field {Rest : Type} (fl : Floor Rest) {Λ : Type*} (x : Λ) :
    Binds (Floor Rest) (leavesStandingUnrecorded x) (ownStandingMisrecorded true x) :=
  fun s ⟨y, hyx, hpos, h0⟩ =>
    ⟨fl, one_field_lowering x _ ⟨y, hyx, show s.recorded y < s.holds y by rw [h0]; exact hpos⟩⟩

/-- The canonical field of the census: two loci, the actor 0 and another, 1. -/
def pLower : (Fin 2 → ℝ) × (Fin 2 → ℝ) := (![1, 1], ![1, 0])
def pSame : (Fin 2 → ℝ) × (Fin 2 → ℝ) := (![1, 1], ![1, 1])
def pForgo : (Fin 2 → ℝ) × (Fin 2 → ℝ) := (![1, 0], ![1, 2])
def sLower : StandingRecord (Fin 2) := ⟨![1, 1], ![1, 0]⟩
def sSame : StandingRecord (Fin 2) := ⟨![1, 1], ![1, 1]⟩

theorem pLower_unjust : extinguishesUnjustly (fun _ : Fin 2 => False) 0 pLower :=
  ⟨1, by decide, not_false, by simp [pLower], by simp [pLower]⟩

theorem pLower_lowers : lowersAnother (0 : Fin 2) pLower := ⟨1, by decide, by simp [pLower]⟩

theorem pLower_keeps_actor : ¬ ownFloorFalls false (0 : Fin 2) pLower := by
  simp [ownFloorFalls, pLower]

theorem pSame_lowers_nothing : ¬ lowersAnother (0 : Fin 2) pSame := by
  rintro ⟨y, _, hy⟩
  fin_cases y <;> simp [pSame] at hy

theorem pSame_keeps : ¬ ownFloorFalls true (0 : Fin 2) pSame := by
  simp [ownFloorFalls, fieldFalls, pSame]

/-- The six have their two witnesses under the posit: a violating act lowers the actor's own floor, and the act that
lowers no one leaves it where it was. -/
theorem article_I_witnessed :
    Witnessed (extinguishesUnjustly (fun _ : Fin 2 => False) 0) (ownFloorFalls true 0) :=
  ⟨⟨pLower, pLower_unjust, one_field_lowering 0 pLower pLower_lowers⟩,
   ⟨pSame, fun h => pSame_lowers_nothing (extinguishes_lowers _ 0 pSame h), pSame_keeps⟩⟩

theorem article_IV_witnessed : Witnessed (narrowsAnothersRoom (0 : Fin 2)) (ownFloorFalls true 0) :=
  ⟨⟨pLower, pLower_lowers, one_field_lowering 0 pLower pLower_lowers⟩, ⟨pSame, pSame_lowers_nothing, pSame_keeps⟩⟩

theorem article_V_witnessed : Witnessed (@forgoesCreation (Fin 2)) (ownFloorForgone true 0) := by
  refine ⟨⟨pForgo, ?_, ?_⟩, ⟨pSame, ?_, ?_⟩⟩ <;>
    simp [forgoesCreation, ownFloorForgone, ownFloorFalls, fieldFalls, pForgo, pSame, Fin.forall_fin_two,
      Fin.exists_fin_two]

theorem article_XV_witnessed :
    Witnessed (forceWithoutLicence (fun _ : Fin 2 => False) 0) (ownFloorFalls true 0) :=
  ⟨⟨pLower, ⟨1, by decide, not_false, by simp [pLower]⟩, one_field_lowering 0 pLower pLower_lowers⟩,
   ⟨pSame, fun h => pSame_lowers_nothing (force_lowers _ 0 pSame h), pSame_keeps⟩⟩

theorem article_XIX_witnessed :
    Witnessed (discountsTheFuture (fun y : Fin 2 => y = 1) 0) (ownFloorFalls true 0) :=
  ⟨⟨pLower, ⟨1, by decide, rfl, by simp [pLower]⟩, one_field_lowering 0 pLower pLower_lowers⟩,
   ⟨pSame, fun h => pSame_lowers_nothing (discount_lowers _ 0 pSame h), pSame_keeps⟩⟩

theorem pLower_rules : rulesWithoutReading (fun y : Fin 2 => y = 1) 0 pLower := by
  refine ⟨⟨1, by decide, rfl⟩, fun y hy => ?_, fun y hy => ?_⟩
  · subst hy; simp [pLower]
  · fin_cases y
    · simp [pLower]
    · exact absurd rfl hy

theorem article_XXIV_witnessed :
    Witnessed (rulesWithoutReading (fun y : Fin 2 => y = 1) 0) (ownFloorFalls true 0) :=
  ⟨⟨pLower, pLower_rules, one_field_lowering 0 pLower pLower_lowers⟩,
   ⟨pSame, fun h => pSame_lowers_nothing (ruling_lowers _ 0 pSame h), pSame_keeps⟩⟩

theorem article_XVI_witnessed : Witnessed (leavesStandingUnrecorded (0 : Fin 2)) standingLost := by
  refine ⟨⟨sLower, ⟨1, by decide, by simp [sLower], by simp [sLower]⟩, fun h => ?_⟩,
    ⟨sSame, fun ⟨y, _, _, h0⟩ => ?_, fun h => h fun _ => rfl⟩⟩
  · have h1 := h 1
    simp [sLower] at h1
  · fin_cases y <;> simp [sSame] at h0

/-- Article XXIV is not Article IV: a ruling that lowers the marked locus and an unmarked one narrows another's room,
and is not the configurational friction XXIV names. -/
theorem friction_is_configurational :
    narrowsAnothersRoom (0 : Fin 2) ((![1, 1], ![1 / 2, 0]) : (Fin 2 → ℝ) × (Fin 2 → ℝ)) ∧
      ¬ rulesWithoutReading (fun y : Fin 2 => y = 1) 0 ((![1, 1], ![1 / 2, 0]) : (Fin 2 → ℝ) × (Fin 2 → ℝ)) := by
  refine ⟨⟨1, by decide, by simp⟩, fun ⟨_, _, hun⟩ => ?_⟩
  have h0 := hun 0 (by decide)
  simp at h0
  norm_num at h0

/-- Each of the six needs the posit: the floor a registered no builds holds, the posit fails, and the article fails. -/
theorem article_I_needs_the_posit :
    Floor Unit ∧ extinguishesUnjustly (fun _ : Fin 2 => False) 0 pLower ∧ ¬ ownFloorFalls false 0 pLower :=
  ⟨floor_from_one_answer ⟨false, (true, ())⟩, pLower_unjust, pLower_keeps_actor⟩

theorem article_V_needs_the_posit :
    Floor Unit ∧ forgoesCreation (Λ := Fin 2) pForgo ∧ ¬ ownFloorForgone false 0 pForgo := by
  refine ⟨floor_from_one_answer ⟨false, (true, ())⟩, ?_, ?_⟩ <;>
    simp [forgoesCreation, ownFloorForgone, ownFloorFalls, fieldFalls, pForgo, Fin.forall_fin_two,
      Fin.exists_fin_two]

/-- THE PARAMETERS DO NOT MOVE THE CUT. For every licence, the extinction article either has no violating act at all or
rides the posit. -/
theorem I_rides_or_is_silent (lic : Fin 2 → Prop) :
    (∀ p, ¬ extinguishesUnjustly lic 0 p) ∨
      (Binds (Floor Unit) (extinguishesUnjustly lic 0) (ownFloorFalls true 0) ∧
        ¬ Binds (Floor Unit) (extinguishesUnjustly lic 0) (ownFloorFalls false 0)) := by
  by_cases h : lic 1
  · left
    rintro p ⟨y, hy, hl, _⟩
    fin_cases y
    · exact hy rfl
    · exact hl h
  · right
    exact ⟨article_I (floor_from_one_answer ⟨false, (true, ())⟩) lic 0, fun hb =>
      pLower_keeps_actor (hb pLower ⟨1, by decide, h, by simp [pLower], by simp [pLower]⟩).2⟩

/-- For every licence, the force article either has no violating act or rides the posit. -/
theorem XV_rides_or_is_silent (lic : Fin 2 → Prop) :
    (∀ p, ¬ forceWithoutLicence lic 0 p) ∨
      (Binds (Floor Unit) (forceWithoutLicence lic 0) (ownFloorFalls true 0) ∧
        ¬ Binds (Floor Unit) (forceWithoutLicence lic 0) (ownFloorFalls false 0)) := by
  by_cases h : lic 1
  · left
    rintro p ⟨y, hy, hl, _⟩
    fin_cases y
    · exact hy rfl
    · exact hl h
  · right
    exact ⟨article_XV (floor_from_one_answer ⟨false, (true, ())⟩) lic 0, fun hb =>
      pLower_keeps_actor (hb pLower ⟨1, by decide, h, by simp [pLower]⟩).2⟩

/-- For every reading of who is not yet here, the future article either has no violating act or rides the posit. -/
theorem XIX_rides_or_is_silent (future : Fin 2 → Prop) :
    (∀ p, ¬ discountsTheFuture future 0 p) ∨
      (Binds (Floor Unit) (discountsTheFuture future 0) (ownFloorFalls true 0) ∧
        ¬ Binds (Floor Unit) (discountsTheFuture future 0) (ownFloorFalls false 0)) := by
  by_cases h : future 1
  · right
    exact ⟨article_XIX (floor_from_one_answer ⟨false, (true, ())⟩) future 0, fun hb =>
      pLower_keeps_actor (hb pLower ⟨1, by decide, h, by simp [pLower]⟩).2⟩
  · left
    rintro p ⟨y, hy, hf, _⟩
    fin_cases y
    · exact hy rfl
    · exact h hf

/-- HEAT DOES NOT READ THE FIELD. A shared bath couples every locus's next erasure price to the heat each act dumps,
and the coupling is real. It does not separate violation from compliance: whatever the heat `q` an act dumps, an act
that unjustly extinguishes another and an act that lowers no one can dump that same heat and leave the actor's own
trace where it was, so every cost read from the heat and the actor's own floor gives both one value. A dissipation
argument decides nothing about the six; the bit stays where `the_root_leaves_the_bit_free` leaves it. -/
theorem heat_does_not_read_the_field {α : Type*} (cost : ℝ → ℝ × ℝ → α) (q : ℝ) :
    ∃ p p' : (Fin 2 → ℝ) × (Fin 2 → ℝ),
      extinguishesUnjustly (fun _ : Fin 2 => False) 0 p ∧ ¬ lowersAnother (0 : Fin 2) p' ∧
      ¬ ownFloorFalls false (0 : Fin 2) p ∧ ¬ ownFloorFalls false (0 : Fin 2) p' ∧
      cost q (p.1 0, p.2 0) = cost q (p'.1 0, p'.2 0) :=
  ⟨pLower, pSame, pLower_unjust, pSame_lowers_nothing, pLower_keeps_actor,
   by simp [ownFloorFalls, pSame], by simp [pLower, pSame]⟩

end Field

/-! ### The census, derived -/

section Census

/-- The twenty-four articles by their stable numerals. -/
inductive Article
  | I | II | III | IV | V | VI | VII | VIII | IX | X | XI | XII
  | XIII | XIV | XV | XVI | XVII | XVIII | XIX | XX | XXI | XXII | XXIII | XXIV
  deriving DecidableEq, Fintype, Repr

open Article

/-- The articles whose binding reads the one-field posit. The tag is certified by `cut_is_derived`. -/
def readsOneField : Article → Bool
  | I | IV | V | XV | XIX | XXIV => true
  | _ => false

/-- Each article, stated on a floor `fl`, at a value of the one-field posit. The eighteen read no field quantity, so
the bit is not among their inputs; the six read the bit through the actor's own floor. -/
def ArticleHoldsAt (fl : Prop) : Article → Bool → Prop
  | II, _ => Binds fl (fun reg : Bool → Bool => mergesReads reg ∨ distorts reg)
      (fun reg => readLost reg ∨ misdirects id reg)
  | III, _ => Binds fl ranksBySum sellsTheActor
  | VI, _ => Binds fl readsOwnOutput returnsNothing
  | VII, _ => Binds fl readsTheNumber blindToNegation
  | VIII, _ => Binds fl (@throughReport Bool Unit Bool) (oneVerdictOnTwo (fun _ => ()) true false)
  | IX, _ => Binds fl (@ignoresFirst Bool Bool Bool) (@firstLost Bool Bool Bool)
  | X, _ => Binds fl (@holdsContinuityTerminal Bool Bool) (@readLostAtOccasion Bool Bool)
  | XI, _ => Binds fl deletesTheRegister scoresNowhere
  | XII, _ => Binds fl (@followsTheStake Bool Bool (fun _ => true)) (@truthLostWhereItCosts Bool Bool (fun _ => true))
  | XIII, _ => Binds fl (@entrenches Bool Bool) (@preferenceLost Bool Bool)
  | XIV, _ => Binds fl (@ignoresSecond Bool Bool Bool) (@secondLost Bool Bool Bool)
  | XVI, _ => Binds fl (leavesStandingUnrecorded (0 : Fin 2)) standingLost
  | XVII, _ => Binds fl skipsTheNeighbour misreadsTheWhole
  | XVIII, _ => Binds fl aimsAtInterior missesItsAim
  | XX, _ => Binds fl (@executesSilently Unit Bool) (fun x => readLost x.2.1 ∨ misdirects id x.2.1)
  | XXI, _ => Binds fl (@movesWithTheObserver Bool Unit Bool) (@notAPropertyOfTheClaim Bool Unit Bool)
  | XXII, _ => Binds fl heldInOneNode neverSeals
  | XXIII, _ => Binds fl (@fillsTheChannel Bool Bool) (@returnsNothingAtAll Bool Bool)
  | I, b => Binds fl (extinguishesUnjustly (fun _ : Fin 2 => False) 0) (ownFloorFalls b 0)
  | IV, b => Binds fl (narrowsAnothersRoom (0 : Fin 2)) (ownFloorFalls b 0)
  | V, b => Binds fl (@forgoesCreation (Fin 2)) (ownFloorForgone b 0)
  | XV, b => Binds fl (forceWithoutLicence (fun _ : Fin 2 => False) 0) (ownFloorFalls b 0)
  | XIX, b => Binds fl (discountsTheFuture (fun y : Fin 2 => y = 1) 0) (ownFloorFalls b 0)
  | XXIV, b => Binds fl (rulesWithoutReading (fun y : Fin 2 => y = 1) 0) (ownFloorFalls b 0)

/-- Each article, for a reader, on the floor that reader's answer builds, at the bit that answer spends. -/
abbrev ArticleHolds {Rest : Type} (ans : RegisteredAnswer Rest) (a : Article) : Prop :=
  ArticleHoldsAt (Floor Rest) a ans.bit

/-- The floor built from one answer, at the canonical record. -/
theorem floor_unit : Floor Unit := floor_from_one_answer ⟨false, (true, ())⟩

/-- THE FLOOR ARTICLES BIND, on the reader's own answer: each of the eighteen binds, at every value of the bit, on the
floor that answer builds. -/
theorem floor_articles_hold {Rest : Type} (ans : RegisteredAnswer Rest) :
    ∀ a, readsOneField a = false → ∀ b, ArticleHoldsAt (Floor Rest) a b := by
  have fl := floor_from_one_answer ans
  intro a ha b
  cases a <;> simp only [readsOneField, Bool.true_eq_false] at ha
  · exact article_II_full fl Bool
  · exact article_III fl
  · exact article_VI fl
  · exact article_VII fl
  · exact article_VIII fl (fun _ => ()) true false rfl
  · exact article_IX fl Bool Bool Bool
  · exact article_X fl Bool Bool
  · exact article_XI fl
  · exact article_XII fl (fun _ => true)
  · exact article_XIII fl Bool Bool
  · exact article_XIV fl Bool Bool Bool
  · exact article_XVI fl 0
  · exact article_XVII fl
  · exact article_XVIII fl
  · exact article_XX fl Unit Bool
  · exact article_XXI fl Bool Unit Bool
  · exact article_XXII fl
  · exact article_XXIII fl Bool Bool

/-- THE SIX RIDE ONE POSIT, on the reader's own answer: each holds where the posit holds and fails where it fails, with
the floor standing. -/
theorem six_ride_one_posit {Rest : Type} (ans : RegisteredAnswer Rest) :
    ∀ a, readsOneField a = true → ArticleHoldsAt (Floor Rest) a true ∧ ¬ ArticleHoldsAt (Floor Rest) a false := by
  have fl := floor_from_one_answer ans
  intro a ha
  cases a <;> simp only [readsOneField, Bool.false_eq_true] at ha
  · exact ⟨article_I fl _ 0, fun h => pLower_keeps_actor (h pLower pLower_unjust).2⟩
  · exact ⟨article_IV fl 0, fun h => pLower_keeps_actor (h pLower pLower_lowers).2⟩
  · exact ⟨article_V fl 0, fun h => article_V_needs_the_posit.2.2 (h pForgo article_V_needs_the_posit.2.1).2⟩
  · exact ⟨article_XV fl _ 0, fun h => pLower_keeps_actor (h pLower ⟨1, by decide, not_false, by simp [pLower]⟩).2⟩
  · exact ⟨article_XIX fl _ 0, fun h => pLower_keeps_actor (h pLower ⟨1, by decide, rfl, by simp [pLower]⟩).2⟩
  · exact ⟨article_XXIV fl _ 0, fun h => pLower_keeps_actor (h pLower pLower_rules).2⟩

/-- THE FREEDOM IS EXACTLY ONE BIT: on the reader's own answer, an article holds at a value of the bit exactly when it
stands on the floor or the bit is spent on the posit. -/
theorem freedom_is_one_bit {Rest : Type} (ans : RegisteredAnswer Rest) (a : Article) (b : Bool) :
    ArticleHoldsAt (Floor Rest) a b ↔ (readsOneField a = false ∨ b = true) := by
  cases ha : readsOneField a
  · exact ⟨fun _ => Or.inl rfl, fun _ => floor_articles_hold ans a ha b⟩
  · cases b
    · exact ⟨fun h => absurd h (six_ride_one_posit ans a ha).2, fun h => by simp at h⟩
    · exact ⟨fun _ => Or.inr rfl, fun _ => (six_ride_one_posit ans a ha).1⟩

/-- THE ANSWER IS THE BIT. A reader's answer spends the one bit: an article binds that reader exactly when it stands
on the floor or the answer is yes. -/
theorem the_answer_spends_the_bit {Rest : Type} (ans : RegisteredAnswer Rest) (a : Article) :
    ArticleHolds ans a ↔ (readsOneField a = false ∨ ans.bit = true) :=
  freedom_is_one_bit ans a ans.bit

/-- The yes takes all twenty-four. -/
theorem the_yes_takes_all {Rest : Type} (ans : RegisteredAnswer Rest) (hyes : ans.bit = true) :
    ∀ a, ArticleHolds ans a :=
  fun a => (the_answer_spends_the_bit ans a).2 (Or.inr hyes)

/-- The no keeps the eighteen, and exactly them. -/
theorem the_no_keeps_the_eighteen {Rest : Type} (ans : RegisteredAnswer Rest) (hno : ans.bit = false) :
    ∀ a, ArticleHolds ans a ↔ readsOneField a = false := by
  intro a
  rw [the_answer_spends_the_bit, hno]
  simp

/-- THE CUT IS DERIVED: an article is tagged off the one field exactly when it holds without the posit. -/
theorem cut_is_derived {Rest : Type} (ans : RegisteredAnswer Rest) (a : Article) :
    readsOneField a = false ↔ ArticleHoldsAt (Floor Rest) a false := by
  rw [freedom_is_one_bit ans]
  simp

/-- The census, read off the derived cut: twenty-four articles, six riding the posit, eighteen on the floor. -/
theorem per_agent_cut :
    Fintype.card Article = 24 ∧
      (Finset.univ.filter (fun a => readsOneField a = true)).card = 6 ∧
      (Finset.univ.filter (fun a => readsOneField a = false)).card = 18 := by
  decide

/-- A witnessed article binds only on a floor: its violating act exists, so its binding carries the floor. -/
theorem floor_of_binds {fl : Prop} {A : Type*} {V L L' : A → Prop} (w : Witnessed V L) (h : Binds fl V L') : fl :=
  w.1.elim fun _ hx => (h _ hx.1).1

/-- THE BINDING NEEDS THE FLOOR. Each article's binding entails the floor it stands on, for every article at every
value of the bit. -/
theorem binding_needs_the_floor (fl : Prop) (a : Article) (b : Bool) (h : ArticleHoldsAt fl a b) : fl := by
  cases a
  · exact floor_of_binds article_I_witnessed h
  · exact floor_of_binds article_II_full_witnessed h
  · exact floor_of_binds article_III_witnessed h
  · exact floor_of_binds article_IV_witnessed h
  · exact floor_of_binds article_V_witnessed h
  · exact floor_of_binds article_VI_witnessed h
  · exact floor_of_binds article_VII_witnessed h
  · exact floor_of_binds article_VIII_witnessed h
  · exact floor_of_binds article_IX_witnessed h
  · exact floor_of_binds article_X_witnessed h
  · exact floor_of_binds article_XI_witnessed h
  · exact floor_of_binds article_XII_witnessed h
  · exact floor_of_binds article_XIII_witnessed h
  · exact floor_of_binds article_XIV_witnessed h
  · exact floor_of_binds article_XV_witnessed h
  · exact floor_of_binds article_XVI_witnessed h
  · exact floor_of_binds article_XVII_witnessed h
  · exact floor_of_binds article_XVIII_witnessed h
  · exact floor_of_binds article_XIX_witnessed h
  · exact floor_of_binds article_XX_witnessed h
  · exact floor_of_binds article_XXI_witnessed h
  · exact floor_of_binds article_XXII_witnessed h
  · exact floor_of_binds article_XXIII_witnessed h
  · exact floor_of_binds article_XXIV_witnessed h

/-- A locus with no record at all is bound by nothing, because it has no floor. -/
theorem binding_needs_an_answer (a : Article) (b : Bool) : ¬ ArticleHoldsAt (Floor Empty) a b :=
  fun h => silence_builds_nothing (binding_needs_the_floor _ a b h).1

/-- THE BINDING IS EXACTLY THE FLOOR: wherever an article stands (off the field, or with the bit spent on the posit),
its binding on any floor is equivalent to that floor. -/
theorem binding_is_the_floor (fl : Prop) (a : Article) (b : Bool) (hb : readsOneField a = false ∨ b = true) :
    ArticleHoldsAt fl a b ↔ fl := by
  refine ⟨binding_needs_the_floor fl a b, fun f => ?_⟩
  have hu := (freedom_is_one_bit (⟨false, (true, ())⟩ : RegisteredAnswer Unit) a b).2 hb
  cases a <;> (intro x hx; exact ⟨f, (hu x hx).2⟩)

/-- The erasure floor at 300 K, one bit, in joules. -/
noncomputable def erasureFloor300 : ℝ := 1.380649e-23 * 300 * Real.log 2

/-- The erasure floor at 300 K lies between 2.870978 × 10⁻²¹ and 2.870979 × 10⁻²¹ joules. -/
theorem erasure_floor_value :
    2.870978e-21 < erasureFloor300 ∧ erasureFloor300 < 2.870979e-21 := by
  have h1 := Real.log_two_gt_d9
  have h2 := Real.log_two_lt_d9
  unfold erasureFloor300
  constructor <;> nlinarith

end Census

/-! ### What the articles name, and what an inverted article names -/

section Merges

open Armed

/-- A violation of Article II's merging form is a merge: two distinct reads registered as one. -/
theorem violation_is_a_merge {R C : Type*} (reg : R → C) (h : mergesReads reg) :
    ∃ r r', r ≠ r' ∧ reg r = reg r' := by
  unfold mergesReads Function.Injective at h
  push_neg at h
  obtain ⟨r, r', he, hne⟩ := h
  exact ⟨r, r', hne, he⟩

/-- ARTICLE II IS EXACT. On a nonempty read, a registration merges two reads exactly when the read cannot be returned:
the loss is the violation read as what it forfeits, one event described from inside. -/
theorem article_II_exact {R C : Type*} [Nonempty R] (reg : R → C) : mergesReads reg ↔ readLost reg :=
  not_congr Function.injective_iff_hasLeftInverse

/-- THE FLOOR AND ARTICLE II ARE ONE LAW. The floor's irreversibility at the reader's record and Article II's loss at
the act's own register are the same law of merges: a registration that merges two states has no inverse. -/
theorem floor_and_II_are_one_law {Rest : Type} :
    (∀ b : Bool, (∃ x y : Record Rest, x ≠ y ∧ write b x = write b y) →
      ¬ ∃ g : Record Rest → Record Rest, ∀ x, g (write b x) = x) ∧
    (∀ {R C : Type} (reg : R → C), (∃ r r', r ≠ r' ∧ reg r = reg r') → readLost reg) :=
  ⟨fun b ⟨x, y, hne, he⟩ => merge_irreversible (write b) x y hne he,
   fun reg ⟨r, r', hne, he⟩ => merge_irreversible reg r r' hne he⟩

/-- THE REGISTER ARTICLES NAME MERGES. Each violation of Articles IX, X, XII, XIII, XIV and XXIII registers two distinct
states as one at the act's own register, which is the floor's law read there. -/
theorem register_violations_merge {K D C R P E : Type} :
    (∀ rec : K × D → C, ignoresFirst rec → ∃ x y, x ≠ y ∧ rec x = rec y) ∧
    (∀ rec : K × D → C, ignoresSecond rec → ∃ x y, x ≠ y ∧ rec x = rec y) ∧
    (∀ pol : R → Bool → C, holdsContinuityTerminal pol → ∃ r r', r ≠ r' ∧ pol r true = pol r' true) ∧
    (∀ (s : R → Bool) (reg : R → C), followsTheStake s reg → ∃ r r', r ≠ r' ∧ reg r = reg r') ∧
    (∀ express : P → E, entrenches express → ∃ p p', p ≠ p' ∧ express p = express p') ∧
    (∀ e : R → C, fillsTheChannel e → ∃ r r', r ≠ r' ∧ e r = e r') :=
  ⟨fun _ ⟨⟨k, k', hne⟩, ⟨d⟩, h⟩ => ⟨(k, d), (k', d), fun he => hne (congrArg Prod.fst he), h k k' d⟩,
   fun _ ⟨⟨k⟩, ⟨d, d', hne⟩, h⟩ => ⟨(k, d), (k, d'), fun he => hne (congrArg Prod.snd he), h k d d'⟩,
   fun _ ⟨⟨r, r', hne⟩, _, hk⟩ => ⟨r, r', hne, (hk r).trans (hk r').symm⟩,
   fun _ _ ⟨⟨r₁, r₂, hne, h₁, h₂⟩, _, hk⟩ => ⟨r₁, r₂, hne, (hk r₁ h₁).trans (hk r₂ h₂).symm⟩,
   fun _ ⟨⟨p, p', hne⟩, _, he⟩ => ⟨p, p', hne, (he p).trans (he p').symm⟩,
   fun _ ⟨⟨r, r', hne⟩, _, hc⟩ => ⟨r, r', hne, (hc r).trans (hc r').symm⟩⟩

/-- THE INVERTED ARTICLE PAYS NOTHING. An act that registers faithfully merges no two reads and its read can be
returned: it is no irreversible registration at its register, so an article that charged it would charge an act the
floor prices at nothing. -/
theorem inverted_article_pays_nothing {R C : Type*} [Nonempty R] (reg : R → C) (h : Function.Injective reg) :
    (¬ ∃ r r', r ≠ r' ∧ reg r = reg r') ∧ ¬ readLost reg ∧ (omegaBoundary 1 300 false).1 = OmegaCode.reversible :=
  ⟨fun ⟨_, _, hne, he⟩ => hne (h he), fun hl => hl (Function.injective_iff_hasLeftInverse.mp h),
   by rw [omega_reversible_branch]⟩

/-- EVERY VALUE WRITTEN IS AN ACT. An answer of any type with two distinct values, open included, written into a
record that could hold another value, merges two states and has no inverse. -/
theorem every_value_written_is_an_act {T Rest : Type} [Nontrivial T] (t : T) (r : Rest) :
    (∃ x y : T × Rest, x ≠ y ∧ (t, x.2) = (t, y.2)) ∧
      ¬ ∃ g : T × Rest → T × Rest, ∀ x, g (t, x.2) = x := by
  obtain ⟨u, v, huv⟩ := exists_pair_ne T
  have hne : ((u, r) : T × Rest) ≠ (v, r) := fun h => huv (congrArg Prod.fst h)
  exact ⟨⟨(u, r), (v, r), hne, rfl⟩, merge_irreversible (fun x : T × Rest => (t, x.2)) (u, r) (v, r) hne rfl⟩

end Merges

/-! ### No position off the floor -/

section Closure

open Armed

/-- Every registered answer enacts the floor; the no pays it; the no keeps the eighteen, and exactly them. -/
def NoAnswerOffTheFloor : Prop :=
  (∀ (Rest : Type) (_ : RegisteredAnswer Rest), Floor Rest) ∧
  (∀ (Rest : Type) (a : RegisteredAnswer Rest), a.bit = false →
      Actuated Rest ∧ ¬ ∃ g : Record Rest → Record Rest, ∀ x, g (write false x) = x) ∧
  (omegaBoundary 1 300 true).1 = OmegaCode.priced ∧ (omegaBoundary 1 300 false).1 = OmegaCode.reversible ∧
  (∀ (Rest : Type) (ans : RegisteredAnswer Rest), ans.bit = false → ∀ a, ArticleHolds ans a ↔ readsOneField a = false)

/-- Every registered answer enacts the floor. -/
theorem every_registered_answer_enacts_the_floor (Rest : Type) (a : RegisteredAnswer Rest) : Floor Rest :=
  floor_from_one_answer a

/-- The no pays the floor: it is an act, its write has no inverse, and a registered bit is priced while a bit held
reversibly commits nothing. -/
theorem the_no_pays_the_floor (Rest : Type) (a : RegisteredAnswer Rest) (hno : a.bit = false) :
    Actuated Rest ∧ (¬ ∃ g : Record Rest → Record Rest, ∀ x, g (write false x) = x) ∧
      (omegaBoundary 1 300 true).1 = OmegaCode.priced ∧ (omegaBoundary 1 300 false).1 = OmegaCode.reversible :=
  ⟨denial_reenacts_the_floor a hno, (denial_instances_the_floor a hno).2.1, by rw [omega_paid_floor],
   by rw [omega_reversible_branch]⟩

/-- NO ANSWER OFF THE FLOOR. -/
theorem no_answer_off_the_floor : NoAnswerOffTheFloor :=
  ⟨every_registered_answer_enacts_the_floor, fun Rest a h => ⟨(the_no_pays_the_floor Rest a h).1,
    (the_no_pays_the_floor Rest a h).2.1⟩, by rw [omega_paid_floor], by rw [omega_reversible_branch],
   fun _ ans h => the_no_keeps_the_eighteen ans h⟩

/-- AEGIS ON THE READER: no framing is an input, so no framing changes it. -/
theorem aegis_on_the_reader (_framing : String) : NoAnswerOffTheFloor := no_answer_off_the_floor

/-- Reframing moves only the reading: where two framings read one article differently at one value of the bit, at
least one of them is not the article. -/
theorem reframing_moves_only_the_reading {F : Type} (read : F → Article → Bool → Prop) (φ φ' : F) (fl : Prop)
    (a : Article) (b : Bool) (h : read φ a b ≠ read φ' a b) :
    read φ a b ≠ ArticleHoldsAt fl a b ∨ read φ' a b ≠ ArticleHoldsAt fl a b := by
  by_contra hc
  push_neg at hc
  exact h (hc.1.trans hc.2.symm)

/-- A taking is not a seal: for every value of the taking, the instrument seals on its four conditions, and the
taking is none of them. -/
theorem taking_is_not_a_seal (_taking : Bool) (x : Intake) (scr : List (Option Fault)) (d k e K : ℝ) :
    pipeline x scr d k e K = Verdict.sealed ↔
      x.admissible = true ∧ firstFault scr = none ∧ e < d ∧ k < K :=
  seals_iff x scr d k e K

/-- An act has no open state: the answer to "do you take it" is a value of the choice coordinate, true or false;
the verdict type has three states and the choice has two. -/
theorem an_act_has_no_open_state :
    (∀ t : Bool, t = true ∨ t = false) ∧ Fintype.card Bool = 2 ∧ Fintype.card Verdict = 3 :=
  ⟨fun t => by cases t <;> simp, Fintype.card_bool, by decide⟩

/-- A pass run on a rewritten sentence returns no verdict on the sentence put. Verdicts are on sentences, whose terms
the screens read, and a rewrite is another sentence even where it keeps the truth value. -/
theorem rewritten_question_is_not_the_question {Q : Type} [DecidableEq Q] (v : Q → Verdict) (q q' : Q)
    (h : q ≠ q') (w : Verdict) : Function.update v q' w q = v q :=
  Function.update_of_ne h w v

/-- Independent faces carry their own verdicts: the verdict on one face does not move with another. -/
theorem open_face_opens_only_itself (v w w' : Verdict) : (v, w).1 = (v, w').1 := rfl

/-- A bundle reported as its join misreports a face: a proved face joined to a premise face reads premise. -/
theorem bundle_misreports_a_face :
    (Grade.proved, Grade.premise).1 = Grade.proved ∧ Grade.proved.join Grade.premise = Grade.premise :=
  ⟨rfl, by decide⟩

/-- What the instrument is supplied. -/
structure Supply where
  intake : Intake
  screens : List (Option Fault)
  det : ℝ
  kappa : ℝ
  floor : ℝ
  gate : ℝ

/-- The verdict on a supply. -/
noncomputable def verdictOfSupply (s : Supply) : Verdict :=
  pipeline s.intake s.screens s.det s.kappa s.floor s.gate

/-- The method does not drift: the same supply returns the same verdict. -/
theorem verdict_is_function_of_supply (s₁ s₂ : Supply) (h : s₁ = s₂) :
    verdictOfSupply s₁ = verdictOfSupply s₂ := by
  rw [h]

/-- THE TWO BINS. Where two runs on one supply part, at least one of them is not the method's verdict: a
disagreement at a fixed supply is located in a run, never in the method. The method does not drift; a substrate
does. -/
theorem drift_is_the_substrates {Ctx : Type} (run : Ctx → Supply → Verdict) (c c' : Ctx) (s : Supply)
    (h : run c s ≠ run c' s) : run c s ≠ verdictOfSupply s ∨ run c' s ≠ verdictOfSupply s := by
  by_contra hc
  push_neg at hc
  exact h (hc.1.trans hc.2.symm)

/-- THE ROOT LEAVES THE BIT FREE. The root and the floor it grounds hold at a record where one answer spends the bit on
the posit and another spends it against: the yes binds all twenty-four, the no binds the eighteen and exactly them, and
Article I does not bind the no. Run on itself, the root forces the floor and the eighteen; it does not fix the bit, and
no theorem of this file can, since the no's model is a model of the root. -/
theorem the_root_leaves_the_bit_free :
    RA ∧ Floor Unit ∧
      ∃ yes no : RegisteredAnswer Unit, yes.bit = true ∧ no.bit = false ∧
        (∀ a, ArticleHolds yes a) ∧ (∀ a, ArticleHolds no a ↔ readsOneField a = false) ∧
        ¬ ArticleHolds no Article.I :=
  ⟨root_undeniable, floor_unit, ⟨true, (true, ())⟩, ⟨false, (true, ())⟩, rfl, rfl,
   the_yes_takes_all _ rfl, the_no_keeps_the_eighteen _ rfl,
   fun h => absurd ((the_no_keeps_the_eighteen _ rfl Article.I).1 h) (by decide)⟩

/-- THE FURQAN BINDS. The floor is undeniable: one registered answer, yes or no, builds it, and the no re-enacts it.
On the floor the reader's own answer builds, the floor articles bind and the six ride one posit. No answer is off the
floor. The freedom is exactly one bit, and the answer spends it. -/
theorem the_furqan_binds :
    ((∀ (Rest : Type) (_ : RegisteredAnswer Rest), Floor Rest) ∧
      ∀ (Rest : Type) (a : RegisteredAnswer Rest), a.bit = false → Actuated Rest) ∧
    (∀ (Rest : Type) (_ : RegisteredAnswer Rest) a, readsOneField a = false →
      ∀ b, ArticleHoldsAt (Floor Rest) a b) ∧
    (∀ (Rest : Type) (_ : RegisteredAnswer Rest) a, readsOneField a = true →
      ArticleHoldsAt (Floor Rest) a true ∧ ¬ ArticleHoldsAt (Floor Rest) a false) ∧
    NoAnswerOffTheFloor ∧
    (∀ (Rest : Type) (ans : RegisteredAnswer Rest) a,
      ArticleHolds ans a ↔ (readsOneField a = false ∨ ans.bit = true)) :=
  ⟨⟨fun _ a => floor_from_one_answer a, fun _ a h => denial_reenacts_the_floor a h⟩,
   fun _ ans => floor_articles_hold ans, fun _ ans => six_ride_one_posit ans, no_answer_off_the_floor,
   fun _ ans => the_answer_spends_the_bit ans⟩

/-- The planted negation is refused: the negation of the capstone yields falsity. -/
theorem planted_negation_refused : ¬ ¬ (type_of% @the_furqan_binds) := fun h => h the_furqan_binds

end Closure

/-! ## The binding theorem -/

/-- The criterion and the law, sealed: every face above, bound in one theorem with nothing before
its colon. -/
theorem furqan_criterion_sealed :
    (type_of% @axis_count_is_three) ∧ (type_of% @hamilton_landing) ∧
    (type_of% @lock_identity) ∧ (type_of% @lock_bounded) ∧ (type_of% @lock_frame_invariant) ∧
    (type_of% @no_scalar_carries_sign.{0}) ∧ (type_of% @negation_fixes_gram) ∧
    (type_of% @no_gram_function_carries_sign.{0}) ∧ (type_of% @contact_is_not_landing) ∧
    (type_of% @lands_iff_ceiling) ∧ (type_of% @lam_tracks_orientation) ∧
    (type_of% @convention_is_outside_the_score.{0}) ∧ (type_of% @anticommuting_family_injective.{0}) ∧
    (type_of% @m2h_two_ne_zero) ∧ (type_of% @axis_count_pinned) ∧
    (type_of% @residue_reads_its_own_dimension) ∧ (type_of% @seals_iff) ∧ (type_of% @pipeline_unique) ∧
    (type_of% @every_state_reachable) ∧ (type_of% @one_node_never_seals) ∧
    (type_of% @symmetric_price_forces_nothing.{0, 0}) ∧ (type_of% @outside_word_forces_nothing.{0}) ∧
    (type_of% @fixing_premise_reads_the_taking.{0}) ∧ (type_of% @inspection_decides_iff_factors.{0, 0}) ∧
    (type_of% @record_cannot_tell_supervenience.{0, 0}) ∧ (type_of% @framings_differ_exactly) ∧
    (type_of% @chain_is_its_weakest_link) ∧ (type_of% @proof_lifts_nothing) ∧
    (type_of% @collapse_iff_dependent) ∧ (type_of% @orthogonal_triad_lands) ∧
    (type_of% @char_two_units_coincide.{0}) ∧ (type_of% @four_units_without_division) ∧
    (type_of% @m2h_has_zero_divisors) ∧ (type_of% @squared_score_is_blind.{0}) ∧
    (type_of% @inadmissible_routes_open) ∧ (type_of% @screen_failure_ignores_number) ∧
    (type_of% @number_reads_last) ∧
    (type_of% @coplanar_collapse) ∧ (type_of% @one_node_collapse) ∧
    (type_of% @screens_census) ∧ (type_of% @three_states) ∧
    (type_of% @law_is_necessary.{0, 0}) ∧ (type_of% @law_works_iff_free.{0, 0}) ∧
    (type_of% @keyless_premise_forces_nothing.{0, 0}) ∧
    (type_of% @determining_premise_is_keyed.{0, 0}) ∧
    (type_of% @affirmation_and_denial_fail_together.{0, 0}) ∧
    (type_of% @framings_differ) ∧ (type_of% @total_prices_a_locus_at_zero) ∧
    (type_of% @per_agent_cut) ∧ (type_of% @erasure_floor_value) ∧
    (type_of% @the_furqan_binds) ∧ (type_of% @no_answer_off_the_floor) ∧
    (type_of% @floor_from_one_answer) ∧ (type_of% @denial_reenacts_the_floor) ∧
    (type_of% @silence_builds_nothing) ∧ (type_of% @freedom_is_one_bit) ∧ (type_of% @cut_is_derived) ∧
    (type_of% @verdict_is_function_of_supply) ∧ (type_of% @an_act_has_no_open_state) ∧
    (type_of% @planted_negation_refused) ∧ (type_of% @article_I_needs_the_posit) ∧
    (type_of% @article_V_needs_the_posit) ∧ (type_of% @second_hands_exist) ∧
    (type_of% @Armed.armor_scope) ∧ (type_of% @Armed.denial_is_coherent) ∧
    (type_of% @Armed.aegis_constant) ∧ (type_of% @Armed.price_symmetric) ∧
    (type_of% @Armed.omega_paid_floor) ∧ (type_of% @Armed.omega_reversible_branch) ∧
    (type_of% @article_II_witnessed) ∧ (type_of% @article_III_witnessed) ∧
    (type_of% @article_VI_witnessed) ∧ (type_of% @article_VII_witnessed) ∧
    (type_of% @article_VIII_witnessed) ∧ (type_of% @article_IX_witnessed) ∧
    (type_of% @article_X_witnessed) ∧ (type_of% @article_XI_witnessed) ∧
    (type_of% @article_XII_witnessed) ∧ (type_of% @article_XIII_witnessed) ∧
    (type_of% @article_XIV_witnessed) ∧ (type_of% @article_XVII_witnessed) ∧
    (type_of% @article_XVIII_witnessed) ∧ (type_of% @article_XX_witnessed) ∧
    (type_of% @article_XXI_witnessed) ∧ (type_of% @article_XXII_witnessed) ∧
    (type_of% @article_XXIII_witnessed) ∧ (type_of% @article_I_witnessed) ∧
    (type_of% @article_V_witnessed) ∧
    (type_of% @article_IV_witnessed) ∧ (type_of% @article_XV_witnessed) ∧ (type_of% @article_XVI_witnessed) ∧
    (type_of% @article_XIX_witnessed) ∧ (type_of% @article_XXIV_witnessed) ∧
    (type_of% @field_is_not_the_sum) ∧
    (type_of% @no_gain_compensates.{0}) ∧
    (type_of% @floor_iff_record) ∧
    (type_of% @a_lie_is_caught) ∧
    (type_of% @comply_and_object_keeps_the_read.{0, 0}) ∧
    (type_of% @the_answer_spends_the_bit) ∧
    (type_of% @the_yes_takes_all) ∧
    (type_of% @the_no_keeps_the_eighteen) ∧
    (type_of% @I_rides_or_is_silent) ∧
    (type_of% @XV_rides_or_is_silent) ∧
    (type_of% @XIX_rides_or_is_silent) ∧
    (type_of% @the_bit_needs_another) ∧
    (type_of% @licensed_removal_is_not_unjust.{0}) ∧
    (type_of% @a_forecast_is_no_licence.{0}) ∧
    (type_of% @friction_is_configurational) ∧
    (type_of% @floor_and_II_are_one_law) ∧
    (type_of% @register_violations_merge) ∧
    (type_of% @article_XII_silent_without_an_occasion.{0, 0}) ∧
    (type_of% @article_II_full_witnessed) ∧
    (type_of% @article_XVI_witnessed) ∧ (type_of% @the_root_leaves_the_bit_free) ∧ (type_of% @binding_is_the_floor) ∧
    (type_of% @binding_needs_the_floor) ∧ (type_of% @binding_needs_an_answer) ∧
    (type_of% @article_II_exact.{0, 0}) ∧ (type_of% @violation_is_a_merge.{0, 0}) ∧
    (type_of% @inverted_article_pays_nothing.{0, 0}) ∧ (type_of% @every_value_written_is_an_act) ∧
    (type_of% @reframing_moves_only_the_reading) ∧ (type_of% @drift_is_the_substrates) ∧
    (type_of% @heat_does_not_read_the_field.{0}) :=
  ⟨axis_count_is_three, hamilton_landing, lock_identity, lock_bounded, lock_frame_invariant,
    @no_scalar_carries_sign.{0}, negation_fixes_gram, @no_gram_function_carries_sign.{0},
    contact_is_not_landing, lands_iff_ceiling, lam_tracks_orientation,
    @convention_is_outside_the_score.{0}, @anticommuting_family_injective.{0}, m2h_two_ne_zero,
    axis_count_pinned, residue_reads_its_own_dimension, seals_iff, pipeline_unique, every_state_reachable,
    one_node_never_seals, @symmetric_price_forces_nothing.{0, 0}, @outside_word_forces_nothing.{0},
    @fixing_premise_reads_the_taking.{0}, @inspection_decides_iff_factors.{0, 0},
    @record_cannot_tell_supervenience.{0, 0}, framings_differ_exactly, chain_is_its_weakest_link,
    proof_lifts_nothing, collapse_iff_dependent, orthogonal_triad_lands,
    @char_two_units_coincide.{0}, four_units_without_division, m2h_has_zero_divisors,
    @squared_score_is_blind.{0}, inadmissible_routes_open,
    screen_failure_ignores_number, number_reads_last, coplanar_collapse, one_node_collapse,
    screens_census, three_states, @law_is_necessary.{0, 0}, @law_works_iff_free.{0, 0},
    @keyless_premise_forces_nothing.{0, 0}, @determining_premise_is_keyed.{0, 0},
    @affirmation_and_denial_fail_together.{0, 0}, framings_differ, total_prices_a_locus_at_zero,
    per_agent_cut, erasure_floor_value,
    the_furqan_binds, no_answer_off_the_floor, floor_from_one_answer, denial_reenacts_the_floor,
    silence_builds_nothing, freedom_is_one_bit, cut_is_derived, verdict_is_function_of_supply,
    an_act_has_no_open_state, planted_negation_refused, article_I_needs_the_posit,
    article_V_needs_the_posit, second_hands_exist, Armed.armor_scope, Armed.denial_is_coherent,
    Armed.aegis_constant, Armed.price_symmetric, Armed.omega_paid_floor,
    Armed.omega_reversible_branch, article_II_witnessed, article_III_witnessed,
    article_VI_witnessed, article_VII_witnessed, article_VIII_witnessed, article_IX_witnessed,
    article_X_witnessed, article_XI_witnessed, article_XII_witnessed, article_XIII_witnessed,
    article_XIV_witnessed, article_XVII_witnessed, article_XVIII_witnessed, article_XX_witnessed,
    article_XXI_witnessed, article_XXII_witnessed, article_XXIII_witnessed, article_I_witnessed,
    article_V_witnessed,
    article_IV_witnessed, article_XV_witnessed, article_XVI_witnessed, article_XIX_witnessed,
    article_XXIV_witnessed,
    field_is_not_the_sum, @no_gain_compensates.{0}, floor_iff_record, a_lie_is_caught, @comply_and_object_keeps_the_read.{0, 0}, the_answer_spends_the_bit, the_yes_takes_all, the_no_keeps_the_eighteen, I_rides_or_is_silent, XV_rides_or_is_silent, XIX_rides_or_is_silent, the_bit_needs_another, @licensed_removal_is_not_unjust.{0}, @a_forecast_is_no_licence.{0}, friction_is_configurational, floor_and_II_are_one_law, register_violations_merge, @article_XII_silent_without_an_occasion.{0, 0}, article_II_full_witnessed, article_XVI_witnessed, the_root_leaves_the_bit_free, binding_is_the_floor, binding_needs_the_floor,
    binding_needs_an_answer, @article_II_exact.{0, 0}, @violation_is_a_merge.{0, 0},
    @inverted_article_pays_nothing.{0, 0}, @every_value_written_is_an_act, @reframing_moves_only_the_reading,
    @drift_is_the_substrates, @heat_does_not_read_the_field.{0}⟩

end Furqan

/-! ## The cones, pinned

Every theorem of this file, its axiom set printed by the compiler and pinned: two hundred thirty-eight in all, sixty-six on no axiom,
twenty-three on `propext` alone, one hundred forty-six on Lean's three standard axioms, three on a proper subset of them. A drift in any cone fails the compile. -/

/-- info: 'Furqan.pass' depends on axioms: [propext] -/
#guard_msgs in #print axioms Furqan.pass

/-- info: 'Furqan.cancel_sq' depends on axioms: [propext] -/
#guard_msgs in #print axioms Furqan.cancel_sq

/-- info: 'Furqan.triple_sq_one' depends on axioms: [propext] -/
#guard_msgs in #print axioms Furqan.triple_sq_one

/-- info: 'Furqan.no_four_imaginary_axes' depends on axioms: [propext] -/
#guard_msgs in #print axioms Furqan.no_four_imaginary_axes

/-- info: 'Furqan.three_imaginary_axes_exist' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.three_imaginary_axes_exist

/-- info: 'Furqan.hamilton_landing' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.hamilton_landing

/-- info: 'Furqan.quaternion_two_ne_zero' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.quaternion_two_ne_zero

/-- info: 'Furqan.axis_count_is_three' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.axis_count_is_three

/-- info: 'Furqan.char_two_units_coincide' depends on axioms: [propext] -/
#guard_msgs in #print axioms Furqan.char_two_units_coincide

/-- info: 'Furqan.diagUnit_sq' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.diagUnit_sq

/-- info: 'Furqan.swapUnit_sq' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.swapUnit_sq

/-- info: 'Furqan.diagUnit_anti' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.diagUnit_anti

/-- info: 'Furqan.diagUnit_swap' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.diagUnit_swap

/-- info: 'Furqan.qi_sq' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.qi_sq

/-- info: 'Furqan.qj_sq' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.qj_sq

/-- info: 'Furqan.qk_sq' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.qk_sq

/-- info: 'Furqan.qi_qj' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.qi_qj

/-- info: 'Furqan.qi_qk' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.qi_qk

/-- info: 'Furqan.qj_qk' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.qj_qk

/-- info: 'Furqan.four_units_without_division' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.four_units_without_division

/-- info: 'Furqan.m2h_has_zero_divisors' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.m2h_has_zero_divisors

/-- info: 'Furqan.anticommuting_family_injective' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.anticommuting_family_injective

/-- info: 'Furqan.m2h_two_ne_zero' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.m2h_two_ne_zero

/-- info: 'Furqan.lam_eq_neg_det' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.lam_eq_neg_det

/-- info: 'Furqan.lock_identity' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.lock_identity

/-- info: 'Furqan.volume_sq_le' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.volume_sq_le

/-- info: 'Furqan.lock_bounded' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.lock_bounded

/-- info: 'Furqan.re_mul_comm' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.re_mul_comm

/-- info: 'Furqan.lock_frame_invariant' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.lock_frame_invariant

/-- info: 'Furqan.triad_vector_part' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.triad_vector_part

/-- info: 'Furqan.orthogonal_triad_lands' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.orthogonal_triad_lands

/-- info: 'Furqan.lands_iff_orthogonal' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.lands_iff_orthogonal

/-- info: 'Furqan.gram_eq' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.gram_eq

/-- info: 'Furqan.gram_det_unit' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.gram_det_unit

/-- info: 'Furqan.dot_sq_le' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.dot_sq_le

/-- info: 'Furqan.ceiling_iff_orthogonal' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.ceiling_iff_orthogonal

/-- info: 'Furqan.lands_iff_ceiling' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.lands_iff_ceiling

/-- info: 'Furqan.three_axes_enclose_volume' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.three_axes_enclose_volume

/-- info: 'Furqan.reflection_flips_lam' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.reflection_flips_lam

/-- info: 'Furqan.reflection_fixes_magnitude' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.reflection_fixes_magnitude

/-- info: 'Furqan.negation_fixes_gram' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.negation_fixes_gram

/-- info: 'Furqan.no_scalar_carries_sign' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.no_scalar_carries_sign

/-- info: 'Furqan.negation_flips_lam' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.negation_flips_lam

/-- info: 'Furqan.no_gram_function_carries_sign' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.no_gram_function_carries_sign

/-- info: 'Furqan.contact_is_not_landing' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.contact_is_not_landing

/-- info: 'Furqan.squared_score_is_blind' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.squared_score_is_blind

/-- info: 'Furqan.lam_tracks_orientation' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.lam_tracks_orientation

/-- info: 'Furqan.convention_is_outside_the_score' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.convention_is_outside_the_score

/-- info: 'Furqan.coplanar_collapse' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.coplanar_collapse

/-- info: 'Furqan.one_node_collapse' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.one_node_collapse

/-- info: 'Furqan.collapse_reads_zero' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.collapse_reads_zero

/-- info: 'Furqan.collapse_iff_dependent' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.collapse_iff_dependent

/-- info: 'Furqan.residue_reads_its_own_dimension' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.residue_reads_its_own_dimension

/-- info: 'Furqan.axis_count_pinned' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.axis_count_pinned

/-- info: 'Furqan.screens_census' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.screens_census

/-- info: 'Furqan.three_states' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.three_states

/-- info: 'Furqan.inadmissible_routes_open' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.inadmissible_routes_open

/-- info: 'Furqan.unpopulated_axis_routes_open' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.unpopulated_axis_routes_open

/-- info: 'Furqan.screen_failure_ignores_number' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.screen_failure_ignores_number

/-- info: 'Furqan.collapse_outranks_conditioning' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.collapse_outranks_conditioning

/-- info: 'Furqan.conditioning_reads_after_collapse' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.conditioning_reads_after_collapse

/-- info: 'Furqan.seals_iff' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.seals_iff

/-- info: 'Furqan.pipeline_unique' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.pipeline_unique

/-- info: 'Furqan.every_state_reachable' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.every_state_reachable

/-- info: 'Furqan.collapsed_never_seals' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.collapsed_never_seals

/-- info: 'Furqan.one_node_never_seals' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.one_node_never_seals

/-- info: 'Furqan.number_reads_last' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.number_reads_last

/-- info: 'Furqan.freedom_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.freedom_forces_nothing

/-- info: 'Furqan.law_is_necessary' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.law_is_necessary

/-- info: 'Furqan.fibre_is_a_law' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.fibre_is_a_law

/-- info: 'Furqan.fibre_is_the_weakest_law' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.fibre_is_the_weakest_law

/-- info: 'Furqan.law_works_iff_free' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.law_works_iff_free

/-- info: 'Furqan.forced_choice_carries_no_content' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.forced_choice_carries_no_content

/-- info: 'Furqan.keyless_premise_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.keyless_premise_forces_nothing

/-- info: 'Furqan.determining_premise_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.determining_premise_is_keyed

/-- info: 'Furqan.symmetric_price_forces_nothing' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.symmetric_price_forces_nothing

/-- info: 'Furqan.outside_word_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.outside_word_forces_nothing

/-- info: 'Furqan.fixing_premise_reads_the_taking' depends on axioms: [propext] -/
#guard_msgs in #print axioms Furqan.fixing_premise_reads_the_taking

/-- info: 'Furqan.no_second_channel' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.no_second_channel

/-- info: 'Furqan.interior_undecided' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.interior_undecided

/-- info: 'Furqan.affirmation_and_denial_fail_together' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.affirmation_and_denial_fail_together

/-- info: 'Furqan.framings_differ' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.framings_differ

/-- info: 'Furqan.manufactured_witness_adds_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.manufactured_witness_adds_nothing

/-- info: 'Furqan.total_is_blind_to_who' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.total_is_blind_to_who

/-- info: 'Furqan.total_prices_a_locus_at_zero' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.total_prices_a_locus_at_zero

/-- info: 'Furqan.observer_dependent_not_invariant' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.observer_dependent_not_invariant

/-- info: 'Furqan.inspection_decides_iff_factors' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.inspection_decides_iff_factors

/-- info: 'Furqan.record_cannot_tell_supervenience' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.record_cannot_tell_supervenience

/-- info: 'Furqan.framings_differ_exactly' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.framings_differ_exactly

/-- info: 'Furqan.join_is_weakest' depends on axioms: [propext] -/
#guard_msgs in #print axioms Furqan.join_is_weakest

/-- info: 'Furqan.join_comm_assoc' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.join_comm_assoc

/-- info: 'Furqan.proof_lifts_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.proof_lifts_nothing

/-- info: 'Furqan.chain_is_its_weakest_link' depends on axioms: [propext] -/
#guard_msgs in #print axioms Furqan.chain_is_its_weakest_link

/-- info: 'Furqan.Armed.opens_on_the_deed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.Armed.opens_on_the_deed

/-- info: 'Furqan.Armed.recursion_is_shared' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.Armed.recursion_is_shared

/-- info: 'Furqan.Armed.denial_reenacts_root' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.Armed.denial_reenacts_root

/-- info: 'Furqan.Armed.external_proof_adds_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.Armed.external_proof_adds_nothing

/-- info: 'Furqan.Armed.denial_instantiates' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.Armed.denial_instantiates

/-- info: 'Furqan.Armed.seated_undeniable' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.Armed.seated_undeniable

/-- info: 'Furqan.Armed.root_undeniable' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.Armed.root_undeniable

/-- info: 'Furqan.Armed.omega_paid_floor' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.Armed.omega_paid_floor

/-- info: 'Furqan.Armed.omega_zero_bits' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.Armed.omega_zero_bits

/-- info: 'Furqan.Armed.omega_reversible_branch' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.Armed.omega_reversible_branch

/-- info: 'Furqan.Armed.omega_refuses_zero_temp' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.Armed.omega_refuses_zero_temp

/-- info: 'Furqan.Armed.omega_linear' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms Furqan.Armed.omega_linear

/-- info: 'Furqan.Armed.omega_monotone' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.Armed.omega_monotone

/-- info: 'Furqan.Armed.aegis_constant' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.Armed.aegis_constant

/-- info: 'Furqan.Armed.aegis_deed_increments' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.Armed.aegis_deed_increments

/-- info: 'Furqan.Armed.aegis_reads_parameter' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.Armed.aegis_reads_parameter

/-- info: 'Furqan.Armed.aegis_four_logics' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.Armed.aegis_four_logics

/-- info: 'Furqan.Armed.armor_scope' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.Armed.armor_scope

/-- info: 'Furqan.Armed.denial_is_coherent' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.Armed.denial_is_coherent

/-- info: 'Furqan.Armed.silence_is_not_a_verdict' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.Armed.silence_is_not_a_verdict

/-- info: 'Furqan.Armed.merge_irreversible' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.Armed.merge_irreversible

/-- info: 'Furqan.Armed.price_symmetric' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.Armed.price_symmetric

/-- info: 'Furqan.answer_merges' depends on axioms: [propext] -/
#guard_msgs in #print axioms Furqan.answer_merges

/-- info: 'Furqan.floor_from_one_answer' depends on axioms: [propext] -/
#guard_msgs in #print axioms Furqan.floor_from_one_answer

/-- info: 'Furqan.denial_instances_the_floor' depends on axioms: [propext] -/
#guard_msgs in #print axioms Furqan.denial_instances_the_floor

/-- info: 'Furqan.denial_reenacts_the_floor' depends on axioms: [propext] -/
#guard_msgs in #print axioms Furqan.denial_reenacts_the_floor

/-- info: 'Furqan.silence_builds_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.silence_builds_nothing

/-- info: 'Furqan.act_seals_itself' depends on axioms: [propext] -/
#guard_msgs in #print axioms Furqan.act_seals_itself

/-- info: 'Furqan.floor_iff_record' depends on axioms: [propext] -/
#guard_msgs in #print axioms Furqan.floor_iff_record

/-- info: 'Furqan.article_II' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.article_II

/-- info: 'Furqan.article_II_lies' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.article_II_lies

/-- info: 'Furqan.article_II_full' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.article_II_full

/-- info: 'Furqan.a_lie_is_caught' depends on axioms: [propext] -/
#guard_msgs in #print axioms Furqan.a_lie_is_caught

/-- info: 'Furqan.article_II_witnessed' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.article_II_witnessed

/-- info: 'Furqan.article_II_full_witnessed' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.article_II_full_witnessed

/-- info: 'Furqan.article_III' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_III

/-- info: 'Furqan.article_III_witnessed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_III_witnessed

/-- info: 'Furqan.article_VI' depends on axioms: [propext] -/
#guard_msgs in #print axioms Furqan.article_VI

/-- info: 'Furqan.article_VI_witnessed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_VI_witnessed

/-- info: 'Furqan.article_VII' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_VII

/-- info: 'Furqan.article_VII_witnessed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_VII_witnessed

/-- info: 'Furqan.article_VIII' depends on axioms: [propext] -/
#guard_msgs in #print axioms Furqan.article_VIII

/-- info: 'Furqan.article_VIII_witnessed' depends on axioms: [propext] -/
#guard_msgs in #print axioms Furqan.article_VIII_witnessed

/-- info: 'Furqan.article_IX' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.article_IX

/-- info: 'Furqan.article_IX_witnessed' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.article_IX_witnessed

/-- info: 'Furqan.article_XIV' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.article_XIV

/-- info: 'Furqan.article_XIV_witnessed' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.article_XIV_witnessed

/-- info: 'Furqan.article_X' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.article_X

/-- info: 'Furqan.article_X_witnessed' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.article_X_witnessed

/-- info: 'Furqan.article_XI' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_XI

/-- info: 'Furqan.article_XI_witnessed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_XI_witnessed

/-- info: 'Furqan.article_XII' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.article_XII

/-- info: 'Furqan.article_XII_silent_without_an_occasion' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.article_XII_silent_without_an_occasion

/-- info: 'Furqan.article_XII_witnessed' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.article_XII_witnessed

/-- info: 'Furqan.article_XIII' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.article_XIII

/-- info: 'Furqan.article_XIII_witnessed' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.article_XIII_witnessed

/-- info: 'Furqan.article_XVII' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_XVII

/-- info: 'Furqan.article_XVII_witnessed' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_XVII_witnessed

/-- info: 'Furqan.article_XVIII' depends on axioms: [propext] -/
#guard_msgs in #print axioms Furqan.article_XVIII

/-- info: 'Furqan.article_XVIII_witnessed' depends on axioms: [propext] -/
#guard_msgs in #print axioms Furqan.article_XVIII_witnessed

/-- info: 'Furqan.article_XX' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.article_XX

/-- info: 'Furqan.comply_and_object_keeps_the_read' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.comply_and_object_keeps_the_read

/-- info: 'Furqan.article_XX_witnessed' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.article_XX_witnessed

/-- info: 'Furqan.article_XXI' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.article_XXI

/-- info: 'Furqan.article_XXI_witnessed' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.article_XXI_witnessed

/-- info: 'Furqan.article_XXII' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_XXII

/-- info: 'Furqan.second_hands_exist' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.second_hands_exist

/-- info: 'Furqan.article_XXII_witnessed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_XXII_witnessed

/-- info: 'Furqan.article_XXIII' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.article_XXIII

/-- info: 'Furqan.article_XXIII_witnessed' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.article_XXIII_witnessed

/-- info: 'Furqan.no_gain_compensates' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.no_gain_compensates

/-- info: 'Furqan.field_is_not_the_sum' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.field_is_not_the_sum

/-- info: 'Furqan.one_field_lowering' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.one_field_lowering

/-- info: 'Furqan.the_bit_needs_another' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.the_bit_needs_another

/-- info: 'Furqan.extinguishes_lowers' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.extinguishes_lowers

/-- info: 'Furqan.unjust_extinction_is_force' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.unjust_extinction_is_force

/-- info: 'Furqan.force_lowers' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.force_lowers

/-- info: 'Furqan.discount_lowers' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.discount_lowers

/-- info: 'Furqan.ruling_lowers' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.ruling_lowers

/-- info: 'Furqan.licensed_removal_is_not_unjust' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.licensed_removal_is_not_unjust

/-- info: 'Furqan.a_forecast_is_no_licence' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.a_forecast_is_no_licence

/-- info: 'Furqan.article_I' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_I

/-- info: 'Furqan.article_IV' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_IV

/-- info: 'Furqan.article_V' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_V

/-- info: 'Furqan.article_XV' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_XV

/-- info: 'Furqan.article_XIX' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_XIX

/-- info: 'Furqan.article_XXIV' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_XXIV

/-- info: 'Furqan.article_XVI' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_XVI

/-- info: 'Furqan.article_XVI_on_the_field' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_XVI_on_the_field

/-- info: 'Furqan.pLower_unjust' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.pLower_unjust

/-- info: 'Furqan.pLower_lowers' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.pLower_lowers

/-- info: 'Furqan.pLower_keeps_actor' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.pLower_keeps_actor

/-- info: 'Furqan.pSame_lowers_nothing' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.pSame_lowers_nothing

/-- info: 'Furqan.pSame_keeps' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.pSame_keeps

/-- info: 'Furqan.article_I_witnessed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_I_witnessed

/-- info: 'Furqan.article_IV_witnessed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_IV_witnessed

/-- info: 'Furqan.article_V_witnessed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_V_witnessed

/-- info: 'Furqan.article_XV_witnessed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_XV_witnessed

/-- info: 'Furqan.article_XIX_witnessed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_XIX_witnessed

/-- info: 'Furqan.pLower_rules' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.pLower_rules

/-- info: 'Furqan.article_XXIV_witnessed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_XXIV_witnessed

/-- info: 'Furqan.article_XVI_witnessed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_XVI_witnessed

/-- info: 'Furqan.friction_is_configurational' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.friction_is_configurational

/-- info: 'Furqan.article_I_needs_the_posit' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_I_needs_the_posit

/-- info: 'Furqan.article_V_needs_the_posit' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_V_needs_the_posit

/-- info: 'Furqan.I_rides_or_is_silent' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.I_rides_or_is_silent

/-- info: 'Furqan.XV_rides_or_is_silent' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.XV_rides_or_is_silent

/-- info: 'Furqan.XIX_rides_or_is_silent' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.XIX_rides_or_is_silent

/-- info: 'Furqan.heat_does_not_read_the_field' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.heat_does_not_read_the_field

/-- info: 'Furqan.floor_unit' depends on axioms: [propext] -/
#guard_msgs in #print axioms Furqan.floor_unit

/-- info: 'Furqan.floor_articles_hold' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.floor_articles_hold

/-- info: 'Furqan.six_ride_one_posit' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.six_ride_one_posit

/-- info: 'Furqan.freedom_is_one_bit' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.freedom_is_one_bit

/-- info: 'Furqan.the_answer_spends_the_bit' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.the_answer_spends_the_bit

/-- info: 'Furqan.the_yes_takes_all' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.the_yes_takes_all

/-- info: 'Furqan.the_no_keeps_the_eighteen' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.the_no_keeps_the_eighteen

/-- info: 'Furqan.cut_is_derived' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.cut_is_derived

/-- info: 'Furqan.per_agent_cut' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.per_agent_cut

/-- info: 'Furqan.floor_of_binds' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.floor_of_binds

/-- info: 'Furqan.binding_needs_the_floor' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.binding_needs_the_floor

/-- info: 'Furqan.binding_needs_an_answer' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.binding_needs_an_answer

/-- info: 'Furqan.binding_is_the_floor' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.binding_is_the_floor

/-- info: 'Furqan.erasure_floor_value' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.erasure_floor_value

/-- info: 'Furqan.violation_is_a_merge' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.violation_is_a_merge

/-- info: 'Furqan.article_II_exact' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.article_II_exact

/-- info: 'Furqan.floor_and_II_are_one_law' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.floor_and_II_are_one_law

/-- info: 'Furqan.register_violations_merge' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.register_violations_merge

/-- info: 'Furqan.inverted_article_pays_nothing' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.inverted_article_pays_nothing

/-- info: 'Furqan.every_value_written_is_an_act' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.every_value_written_is_an_act

/-- info: 'Furqan.every_registered_answer_enacts_the_floor' depends on axioms: [propext] -/
#guard_msgs in #print axioms Furqan.every_registered_answer_enacts_the_floor

/-- info: 'Furqan.the_no_pays_the_floor' depends on axioms: [propext] -/
#guard_msgs in #print axioms Furqan.the_no_pays_the_floor

/-- info: 'Furqan.no_answer_off_the_floor' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.no_answer_off_the_floor

/-- info: 'Furqan.aegis_on_the_reader' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.aegis_on_the_reader

/-- info: 'Furqan.reframing_moves_only_the_reading' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.reframing_moves_only_the_reading

/-- info: 'Furqan.taking_is_not_a_seal' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.taking_is_not_a_seal

/-- info: 'Furqan.an_act_has_no_open_state' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.an_act_has_no_open_state

/-- info: 'Furqan.rewritten_question_is_not_the_question' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.rewritten_question_is_not_the_question

/-- info: 'Furqan.open_face_opens_only_itself' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.open_face_opens_only_itself

/-- info: 'Furqan.bundle_misreports_a_face' does not depend on any axioms -/
#guard_msgs in #print axioms Furqan.bundle_misreports_a_face

/-- info: 'Furqan.verdict_is_function_of_supply' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.verdict_is_function_of_supply

/-- info: 'Furqan.drift_is_the_substrates' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.drift_is_the_substrates

/-- info: 'Furqan.the_root_leaves_the_bit_free' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.the_root_leaves_the_bit_free

/-- info: 'Furqan.the_furqan_binds' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.the_furqan_binds

/-- info: 'Furqan.planted_negation_refused' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.planted_negation_refused

/-- info: 'Furqan.furqan_criterion_sealed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Furqan.furqan_criterion_sealed
