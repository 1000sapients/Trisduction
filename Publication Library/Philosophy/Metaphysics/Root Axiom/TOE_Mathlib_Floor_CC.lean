/-
TOE_Mathlib_Floor_CC.lean · the floor of the Root Axiom on Mathlib: the bridge lemma, the algebra, the kernel
RATIONALE. The zero-axiom kernel TOE_Zero.lean proves the floor on no axiom and no import, on integer charts. This
  file is its companion on Mathlib and changes nothing in it. It proves, on the real quaternions and on complex
  inner product spaces, the statements the paper's body states in prose: the Frozen Substrate Lemma, the Return and
  the line as the fixed set of conjugation and the centre of the algebra, the invariance of the scalar part under
  every frame, Scalar Exit, Fertile Orthogonality, the closure failure of three dimensions, the kernel identity
  with its bound, its blindness to orientation and its full Return on the axiom, and the twelve.
DESIGN. Parts, in order.
    Part I    The root. `SelfGrounding`, `grounding_is_the_root_itself`, `no_level_above`.
    Part II   The Frozen Substrate Lemma. `exp_of_an_eigenstate`, `an_eigenstate_survives`,
              `whatever_registers_is_no_eigenstate`, `zero_spread_iff_eigenstate`,
              `whatever_registers_carries_spread`.
    Part III  The Return and the line. `the_return`, `units_square_to_minus_one`, `conj_involutive`,
              `the_line_is_the_fixed_set`, `the_line_is_the_centre`, `the_scalar_part_is_frame_invariant`,
              `no_frame_moves_the_line`. The seat: `conj_reflects_every_plane`,
              `the_line_is_fixed_in_every_plane`.
    Part IV   The anatomy of the algebra. `scalar_exit`, `fertile_orthogonality`, `orthogonal_axes_anticommute`,
              `composition_is_order_sensitive`, `the_quaternions_carry_the_composition_law`,
              `no_algebra_on_the_ground_and_two_axes`.
    Part V    The kernel. `kernel_identity`, `the_lock_iff`, `the_number_is_orientation_blind`,
              `full_negation_keeps_the_gram`, `a_deleted_slot_collapses_the_volume`, `the_lock_is_at_most_one`,
              `the_axiom_at_the_full_return`.
    Part VI   The twelve. `twelve_directed_gates`, `twelve_even_permutations`.
WHAT IS NOT PROVED HERE (read before citing).
    (a) The classification of Frobenius: that the reals, the complexes and the quaternions are the only
        finite-dimensional associative real division algebras. It is cited. What is proved is that the quaternions
        carry the composition law, that composition on them is order-sensitive, and that no algebra of the stated
        kind lives on the ground and two axes.
    (b) The Heisenberg floor and the quantum speed limit for unbounded operators. They are cited. The Frozen
        Substrate Lemma is proved here for every bounded generator on every complex Hilbert space.
RISK. Part II takes the generator bounded. Part V reads three rows; the reading of physical rows is the body's.
NON-NEGOTIABLE. No axiom is declared, no sorry. TOE_Zero.lean is not edited and is not imported. The kernel line of
  every theorem the paper names is printed at the end.
-/
import Mathlib.Algebra.Quaternion
import Mathlib.Analysis.Normed.Algebra.Exponential
import Mathlib.Analysis.SpecialFunctions.Exponential
import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.Data.Complex.Trigonometric
import Mathlib.GroupTheory.SpecificGroups.Alternating
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Data.Matrix.Notation
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Module

namespace TOE.Floor
open Quaternion

/-! ## Part I. The root -/

/-- A self-grounding root: acts occur, and every act instances the root. As in TOE_Zero.lean. -/
structure SelfGrounding (R : Prop) where
  Act : Type
  anAct : Act
  instances : Act → R

/-- Grounding is the root itself: a root grounds itself exactly when it holds. The structure asks nothing of a
root but the root, and nothing beneath it is called. -/
theorem grounding_is_the_root_itself (R : Prop) : Nonempty (SelfGrounding R) ↔ R :=
  ⟨fun ⟨G⟩ => G.instances G.anAct, fun r => ⟨⟨Unit, (), fun _ => r⟩⟩⟩

/-- No level stands above a root that grounds itself: whatever is offered as its further ground is idle. -/
theorem no_level_above {R : Prop} (G : SelfGrounding R) : ∀ Q : Prop, (Q → R) ↔ R :=
  fun _ => ⟨fun _ => G.instances G.anAct, fun r _ => r⟩

/-! ## Part II. The Frozen Substrate Lemma -/

section Frozen
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
open scoped InnerProductSpace

omit [CompleteSpace E] in
theorem pow_of_an_eigenstate {H : E →L[ℂ] E} {ψ : E} {e : ℂ} (h : H ψ = e • ψ) (n : ℕ) :
    (H ^ n) ψ = e ^ n • ψ := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [pow_succ, ContinuousLinearMap.mul_apply, h, map_smul, ih, smul_smul, pow_succ, mul_comm]

set_option maxHeartbeats 1000000 in
/-- On an eigenstate the exponential of the generator is a number. -/
theorem exp_of_an_eigenstate {H : E →L[ℂ] E} {ψ : E} {e : ℂ} (h : H ψ = e • ψ) :
    (NormedSpace.exp ℂ H) ψ = Complex.exp e • ψ := by
  have h0 : HasSum (fun n : ℕ => ((n.factorial : ℂ)⁻¹ • H ^ n)) (NormedSpace.exp ℂ H) :=
    NormedSpace.exp_series_hasSum_exp' (𝕂 := ℂ) H
  have h1 : HasSum (fun n : ℕ => ((n.factorial : ℂ)⁻¹ • H ^ n) ψ) ((NormedSpace.exp ℂ H) ψ) :=
    h0.mapL (ContinuousLinearMap.apply ℂ E ψ)
  have h2 : HasSum (fun n : ℕ => ((n.factorial : ℂ)⁻¹ • e ^ n) • ψ) (NormedSpace.exp ℂ e • ψ) :=
    (NormedSpace.exp_series_hasSum_exp' (𝕂 := ℂ) e).smul_const ψ
  have h3 : (fun n : ℕ => ((n.factorial : ℂ)⁻¹ • H ^ n) ψ) = fun n : ℕ => ((n.factorial : ℂ)⁻¹ • e ^ n) • ψ := by
    funext n
    rw [ContinuousLinearMap.smul_apply, pow_of_an_eigenstate h, smul_smul, smul_eq_mul]
  rw [h3] at h1
  rw [h1.unique h2, Complex.exp_eq_exp_ℂ]

/-- The evolution generated by `H` for the time `t`. -/
noncomputable def evolve (H : E →L[ℂ] E) (t : ℝ) : E →L[ℂ] E := NormedSpace.exp ℂ ((-(Complex.I * t)) • H)

/-- The Frozen Substrate Lemma. A state of one energy survives every evolution whole: its overlap with its own
future has the size of its own square, at every time. It reaches no state orthogonal to itself. -/
theorem an_eigenstate_survives {H : E →L[ℂ] E} {ψ : E} {en : ℝ} (h : H ψ = (en : ℂ) • ψ) (t : ℝ) :
    ‖⟪ψ, evolve H t ψ⟫_ℂ‖ = ‖ψ‖ ^ 2 := by
  have h' : ((-(Complex.I * t)) • H) ψ = (-(Complex.I * t) * en) • ψ := by
    rw [ContinuousLinearMap.smul_apply, h, smul_smul]
  have hz : -(Complex.I * (t : ℂ)) * (en : ℂ) = ((-(t * en) : ℝ) : ℂ) * Complex.I := by
    push_cast; ring
  rw [evolve, exp_of_an_eigenstate h', inner_smul_right, norm_mul, hz, Complex.norm_exp_ofReal_mul_I, one_mul,
    inner_self_eq_norm_sq_to_K]
  simp

/-- Whatever registers is no eigenstate: a state that reaches a state orthogonal to itself has no single energy. -/
theorem whatever_registers_is_no_eigenstate {H : E →L[ℂ] E} {ψ : E} (hψ : ψ ≠ 0) {t : ℝ}
    (reg : ⟪ψ, evolve H t ψ⟫_ℂ = 0) : ¬ ∃ en : ℝ, H ψ = (en : ℂ) • ψ := by
  rintro ⟨en, h⟩
  have := an_eigenstate_survives h t
  rw [reg, norm_zero] at this
  exact hψ (norm_eq_zero.mp (pow_eq_zero_iff (two_ne_zero) |>.mp this.symm))

/-- The mean energy of a state, and its energy spread. -/
noncomputable def mean (H : E →L[ℂ] E) (ψ : E) : ℝ := (⟪ψ, H ψ⟫_ℂ).re
noncomputable def spread (H : E →L[ℂ] E) (ψ : E) : ℝ := ‖H ψ - (mean H ψ : ℂ) • ψ‖

omit [CompleteSpace E] in
/-- The spread is zero exactly on the states of one energy, the mean. -/
theorem zero_spread_iff_eigenstate (H : E →L[ℂ] E) (ψ : E) : spread H ψ = 0 ↔ H ψ = (mean H ψ : ℂ) • ψ := by
  rw [spread, norm_eq_zero, sub_eq_zero]

/-- The bridge: whatever registers carries a positive energy spread. -/
theorem whatever_registers_carries_spread {H : E →L[ℂ] E} {ψ : E} (hψ : ψ ≠ 0) {t : ℝ}
    (reg : ⟪ψ, evolve H t ψ⟫_ℂ = 0) : 0 < spread H ψ := by
  rcases (norm_nonneg (H ψ - (mean H ψ : ℂ) • ψ)).lt_or_eq with h | h
  · exact h
  · exact absurd ⟨mean H ψ, (zero_spread_iff_eigenstate H ψ).mp h.symm⟩ (whatever_registers_is_no_eigenstate hψ reg)

end Frozen

/-! ## Part III. The Return and the line -/

def qi : ℍ[ℝ] := ⟨0, 1, 0, 0⟩
def qj : ℍ[ℝ] := ⟨0, 0, 1, 0⟩
def qk : ℍ[ℝ] := ⟨0, 0, 0, 1⟩

/-- The Return: `i · j · k = −1`. -/
theorem the_return : qi * qj * qk = -1 := by
  ext <;> simp [qi, qj, qk]

theorem units_square_to_minus_one : qi * qi = -1 ∧ qj * qj = -1 ∧ qk * qk = -1 := by
  refine ⟨?_, ?_, ?_⟩ <;> ext <;> simp [qi, qj, qk]

/-- Conjugation is an involution on the whole algebra. -/
theorem conj_involutive (q : ℍ[ℝ]) : star (star q) = q := star_star q

/-- The line: conjugation fixes exactly the scalars, on the whole algebra. -/
theorem the_line_is_the_fixed_set (q : ℍ[ℝ]) : star q = q ↔ q.imI = 0 ∧ q.imJ = 0 ∧ q.imK = 0 := by
  constructor
  · intro h
    have a := congrArg (fun x : ℍ[ℝ] => x.imI) h; have b := congrArg (fun x : ℍ[ℝ] => x.imJ) h
    have c := congrArg (fun x : ℍ[ℝ] => x.imK) h
    simp only [Quaternion.star_imI, Quaternion.star_imJ, Quaternion.star_imK] at a b c
    exact ⟨by linarith, by linarith, by linarith⟩
  · rintro ⟨a, b, c⟩
    ext <;> simp [a, b, c]

/-- The line is the centre: a quaternion commutes with every quaternion exactly when it is a scalar. -/
theorem the_line_is_the_centre (q : ℍ[ℝ]) : (∀ p : ℍ[ℝ], p * q = q * p) ↔ q.imI = 0 ∧ q.imJ = 0 ∧ q.imK = 0 := by
  constructor
  · intro h
    have a := congrArg (fun x : ℍ[ℝ] => x.imJ) (h qi); have b := congrArg (fun x : ℍ[ℝ] => x.imK) (h qi)
    have c := congrArg (fun x : ℍ[ℝ] => x.imK) (h qj)
    simp [qi, qj] at a b c
    exact ⟨by linarith, by linarith, by linarith⟩
  · rintro ⟨a, b, c⟩ p
    ext <;> simp [a, b, c] <;> ring

theorem the_scalar_part_is_a_trace (p q : ℍ[ℝ]) : (p * q).re = (q * p).re := by
  simp only [Quaternion.mul_re]; ring

/-- The scalar part is the same in every frame: conjugation by any nonzero quaternion keeps it. -/
theorem the_scalar_part_is_frame_invariant {u : ℍ[ℝ]} (hu : u ≠ 0) (q : ℍ[ℝ]) : (u * q * u⁻¹).re = q.re := by
  rw [the_scalar_part_is_a_trace (u * q) u⁻¹, ← mul_assoc, inv_mul_cancel₀ hu, one_mul]

/-- No frame moves a point of the line. -/
theorem no_frame_moves_the_line {u : ℍ[ℝ]} (hu : u ≠ 0) (r : ℝ) : u * (r : ℍ[ℝ]) * u⁻¹ = (r : ℍ[ℝ]) := by
  rw [← Quaternion.coe_commutes, mul_assoc, mul_inv_cancel₀ hu, mul_one]

/-- The seat in every plane. Take any plane through the line: the scalars and one pure axis `n`. Conjugation
folds that plane onto itself, turning the sign of the part along the axis: it is the reflection of the plane. -/
theorem conj_reflects_every_plane {n : ℍ[ℝ]} (hn : n.re = 0) (a b : ℝ) :
    star ((a : ℍ[ℝ]) + b • n) = (a : ℍ[ℝ]) - b • n := by
  ext <;> simp [hn]

/-- In every such plane the fixed set of the reflection is the line. -/
theorem the_line_is_fixed_in_every_plane {n : ℍ[ℝ]} (hn : n.re = 0) (hne : n ≠ 0) (a b : ℝ) :
    star ((a : ℍ[ℝ]) + b • n) = (a : ℍ[ℝ]) + b • n ↔ b = 0 := by
  rw [the_line_is_the_fixed_set]
  constructor
  · rintro ⟨h1, h2, h3⟩
    simp at h1 h2 h3
    by_contra hb
    apply hne
    ext
    · simpa using hn
    · simpa using h1.resolve_left hb
    · simpa using h2.resolve_left hb
    · simpa using h3.resolve_left hb
  · rintro rfl; simp

/-! ## Part IV. The anatomy of the algebra -/

/-- The inner product of the pure parts of two quaternions. -/
def dot (a b : ℍ[ℝ]) : ℝ := a.imI * b.imI + a.imJ * b.imJ + a.imK * b.imK

/-- Scalar Exit: a pure quaternion squares onto the scalar line, at minus its own square length. -/
theorem scalar_exit {q : ℍ[ℝ]} (h : q.re = 0) :
    (q * q).re = -dot q q ∧ (q * q).imI = 0 ∧ (q * q).imJ = 0 ∧ (q * q).imK = 0 := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;> simp [dot, h] <;> ring

/-- Fertile Orthogonality: the product of two orthogonal pure quaternions is pure, orthogonal to both, and
of the product of their lengths. Two orthogonal axes beget a third. -/
theorem fertile_orthogonality {a b : ℍ[ℝ]} (ha : a.re = 0) (hb : b.re = 0) (hab : dot a b = 0) :
    (a * b).re = 0 ∧ dot (a * b) a = 0 ∧ dot (a * b) b = 0 ∧ dot (a * b) (a * b) = dot a a * dot b b := by
  unfold dot at *
  refine ⟨?_, ?_, ?_, ?_⟩
  · simp [ha, hb]; linarith
  · simp [ha, hb]; ring
  · simp [ha, hb]; ring
  · simp [ha, hb]
    linear_combination (-(a.imI * b.imI + a.imJ * b.imJ + a.imK * b.imK)) * hab

/-- Two orthogonal axes anticommute: their composition read in the other order is the opposite. -/
theorem orthogonal_axes_anticommute {a b : ℍ[ℝ]} (ha : a.re = 0) (hb : b.re = 0) (hab : dot a b = 0) :
    a * b = -(b * a) := by
  unfold dot at hab
  ext <;> simp [ha, hb] <;> linarith

/-- Composition is order-sensitive. -/
theorem composition_is_order_sensitive : qi * qj ≠ qj * qi := by
  intro h
  have := congrArg (fun x : ℍ[ℝ] => x.imK) h
  simp [qi, qj] at this
  linarith

/-- The quaternions carry the composition law: four real dimensions, one ground and three axes; no nonzero
warrants compose to zero; and the order of composition matters. Associativity, linearity and the ground identity
are the ring and algebra structure Mathlib carries on them. -/
theorem the_quaternions_carry_the_composition_law :
    Module.finrank ℝ ℍ[ℝ] = 4 ∧ (∀ a b : ℍ[ℝ], a * b = 0 → a = 0 ∨ b = 0) ∧
    (∀ a b c : ℍ[ℝ], a * b * c = a * (b * c)) ∧ (∀ a : ℍ[ℝ], 1 * a = a ∧ a * 1 = a) ∧
    ∃ a b : ℍ[ℝ], a * b ≠ b * a :=
  ⟨Quaternion.finrank_eq_four, fun _ _ h => mul_eq_zero.mp h, mul_assoc, fun a => ⟨one_mul a, mul_one a⟩,
    qi, qj, composition_is_order_sensitive⟩

/-- The closure failure of three dimensions. No associative unital real algebra lives on the ground and two
independent axes one of which squares to minus one: the product of the two axes cannot fall back on the three. -/
theorem no_algebra_on_the_ground_and_two_axes {A : Type*} [Ring A] [Algebra ℝ A] (i j : A)
    (hi : i * i = -1)
    (ind : ∀ a b c : ℝ, a • (1 : A) + b • i + c • j = 0 → a = 0 ∧ b = 0 ∧ c = 0)
    (closed : ∃ a b c : ℝ, i * j = a • (1 : A) + b • i + c • j) : False := by
  obtain ⟨a, b, c, e⟩ := closed
  have h1 : i * (i * j) = -j := by rw [← mul_assoc, hi]; simp
  have h2 : i * (i * j) = a • i + b • (-1 : A) + c • (a • (1 : A) + b • i + c • j) := by
    conv_lhs => rw [e]
    rw [mul_add, mul_add, mul_smul_comm, mul_smul_comm, mul_smul_comm, mul_one, hi, e]
  have key : (c * a - b) • (1 : A) + (a + c * b) • i + (c * c + 1) • j = 0 := by
    have : (c * a - b) • (1 : A) + (a + c * b) • i + (c * c + 1) • j
        = (a • i + b • (-1 : A) + c • (a • (1 : A) + b • i + c • j)) + j := by module
    rw [this, ← h2, h1]; simp
  have := (ind _ _ _ key).2.2
  nlinarith [mul_self_nonneg c]

/-! ## Part V. The kernel -/

/-- The signed volume of three rows read as quaternions, and their Gram matrix. -/
def lam (a b c : ℍ[ℝ]) : ℝ := (a * b * c).re
def gram (a b c : ℍ[ℝ]) : Matrix (Fin 3) (Fin 3) ℝ :=
  !![dot a a, dot a b, dot a c; dot b a, dot b b, dot b c; dot c a, dot c b, dot c c]

/-- The kernel identity: for three pure rows, `λ² = det R`. -/
theorem kernel_identity {a b c : ℍ[ℝ]} (ha : a.re = 0) (hb : b.re = 0) (hc : c.re = 0) :
    lam a b c ^ 2 = (gram a b c).det := by
  rw [Matrix.det_fin_three]
  simp [lam, gram, dot, ha, hb, hc]
  ring

/-- The lock: the determinant is positive exactly when the signed volume is not zero. -/
theorem the_lock_iff {a b c : ℍ[ℝ]} (ha : a.re = 0) (hb : b.re = 0) (hc : c.re = 0) :
    0 < (gram a b c).det ↔ lam a b c ≠ 0 := by
  rw [← kernel_identity ha hb hc]
  exact ⟨fun h e => by rw [e] at h; simp at h, fun h => by positivity⟩

theorem the_determinant_is_never_negative {a b c : ℍ[ℝ]} (ha : a.re = 0) (hb : b.re = 0) (hc : c.re = 0) :
    0 ≤ (gram a b c).det := by
  rw [← kernel_identity ha hb hc]; positivity

/-- Reflecting one axis turns the sign of the volume. -/
theorem reflection_turns_the_sign (a b c : ℍ[ℝ]) : lam (-a) b c = -lam a b c := by
  simp [lam]; ring

/-- The Number is blind to orientation: reflecting one axis leaves the determinant where it was. -/
theorem the_number_is_orientation_blind {a b c : ℍ[ℝ]} (ha : a.re = 0) (hb : b.re = 0) (hc : c.re = 0) :
    (gram (-a) b c).det = (gram a b c).det := by
  rw [← kernel_identity (by simpa using ha) hb hc, ← kernel_identity ha hb hc, reflection_turns_the_sign]
  ring

/-- Full negation keeps the Gram matrix entry for entry. -/
theorem full_negation_keeps_the_gram (a b c : ℍ[ℝ]) : gram (-a) (-b) (-c) = gram a b c := by
  simp [gram, dot]

/-- A deleted slot collapses the volume. -/
theorem a_deleted_slot_collapses_the_volume (b c : ℍ[ℝ]) :
    lam 0 b c = 0 ∧ lam b 0 c = 0 ∧ lam b c 0 = 0 := by
  simp [lam]

/-- For unit rows the lock is at most one. -/
theorem the_lock_is_at_most_one {a b c : ℍ[ℝ]} (ha : a.re = 0) (hb : b.re = 0) (hc : c.re = 0)
    (ua : dot a a = 1) (ub : dot b b = 1) (uc : dot c c = 1) : (gram a b c).det ≤ 1 := by
  rw [← kernel_identity ha hb hc]
  -- the volume is minus the row a against the cross product v of b and c
  set v1 := b.imJ * c.imK - b.imK * c.imJ with hv1
  set v2 := b.imK * c.imI - b.imI * c.imK with hv2
  set v3 := b.imI * c.imJ - b.imJ * c.imI with hv3
  have hl : lam a b c = -(a.imI * v1 + a.imJ * v2 + a.imK * v3) := by
    simp [lam, ha, hb, hc, hv1, hv2, hv3]; ring
  have hv : v1 ^ 2 + v2 ^ 2 + v3 ^ 2 = dot b b * dot c c - dot b c ^ 2 := by
    simp only [dot, hv1, hv2, hv3]; ring
  have hv' : v1 ^ 2 + v2 ^ 2 + v3 ^ 2 ≤ 1 := by rw [hv, ub, uc]; nlinarith [sq_nonneg (dot b c)]
  have cs : (a.imI * v1 + a.imJ * v2 + a.imK * v3) ^ 2 ≤ dot a a * (v1 ^ 2 + v2 ^ 2 + v3 ^ 2) := by
    unfold dot
    nlinarith [sq_nonneg (a.imI * v2 - a.imJ * v1), sq_nonneg (a.imI * v3 - a.imK * v1),
      sq_nonneg (a.imJ * v3 - a.imK * v2)]
  rw [hl, ua, one_mul] at *
  nlinarith [cs]

/-- The axiom at the full Return: the three axes compose to minus one and lock at one. -/
theorem the_axiom_at_the_full_return : lam qi qj qk = -1 ∧ (gram qi qj qk).det = 1 := by
  have h : lam qi qj qk = -1 := by simp [lam, the_return]
  refine ⟨h, ?_⟩
  rw [← kernel_identity (by simp [qi]) (by simp [qj]) (by simp [qk]), h]; norm_num

/-! ## Part VI. The twelve -/

/-- The twelve directed gates: the ordered pairs of distinct vertices among four. -/
theorem twelve_directed_gates : Fintype.card {p : Fin 4 × Fin 4 // p.1 ≠ p.2} = 12 := by decide

/-- The twelve even permutations of four points. -/
theorem twelve_even_permutations : Fintype.card (alternatingGroup (Fin 4)) = 12 := by
  have h := two_mul_card_alternatingGroup (α := Fin 4)
  rw [Fintype.card_perm, Fintype.card_fin] at h
  have : Nat.factorial 4 = 24 := by decide
  omega

end TOE.Floor

#print axioms TOE.Floor.grounding_is_the_root_itself
#print axioms TOE.Floor.no_level_above
#print axioms TOE.Floor.pow_of_an_eigenstate
#print axioms TOE.Floor.exp_of_an_eigenstate
#print axioms TOE.Floor.an_eigenstate_survives
#print axioms TOE.Floor.whatever_registers_is_no_eigenstate
#print axioms TOE.Floor.zero_spread_iff_eigenstate
#print axioms TOE.Floor.whatever_registers_carries_spread
#print axioms TOE.Floor.the_return
#print axioms TOE.Floor.units_square_to_minus_one
#print axioms TOE.Floor.conj_involutive
#print axioms TOE.Floor.the_line_is_the_fixed_set
#print axioms TOE.Floor.the_line_is_the_centre
#print axioms TOE.Floor.the_scalar_part_is_a_trace
#print axioms TOE.Floor.the_scalar_part_is_frame_invariant
#print axioms TOE.Floor.no_frame_moves_the_line
#print axioms TOE.Floor.conj_reflects_every_plane
#print axioms TOE.Floor.the_line_is_fixed_in_every_plane
#print axioms TOE.Floor.scalar_exit
#print axioms TOE.Floor.fertile_orthogonality
#print axioms TOE.Floor.orthogonal_axes_anticommute
#print axioms TOE.Floor.composition_is_order_sensitive
#print axioms TOE.Floor.the_quaternions_carry_the_composition_law
#print axioms TOE.Floor.no_algebra_on_the_ground_and_two_axes
#print axioms TOE.Floor.kernel_identity
#print axioms TOE.Floor.the_lock_iff
#print axioms TOE.Floor.the_determinant_is_never_negative
#print axioms TOE.Floor.reflection_turns_the_sign
#print axioms TOE.Floor.the_number_is_orientation_blind
#print axioms TOE.Floor.full_negation_keeps_the_gram
#print axioms TOE.Floor.a_deleted_slot_collapses_the_volume
#print axioms TOE.Floor.the_lock_is_at_most_one
#print axioms TOE.Floor.the_axiom_at_the_full_return
#print axioms TOE.Floor.twelve_directed_gates
#print axioms TOE.Floor.twelve_even_permutations
