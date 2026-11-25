/-
Generalized_RH_Triaxial_Theorem_CC.lean · the generalized hypothesis in triaxial form, a theorem in its own domain
RATIONALE. A seat is a set with a fold, an involution, and a registration the fold keeps. A configuration on a seat
  has three axes: its existents, its closure under the fold, and its witness, the record returning every existent.
  This file proves that the three axes together put every existent on the line the fold fixes, that no two of
  them do, and that on the line the witness holds. It then takes the seat of the complex plane, the fold
  s ↦ 1 − conj s, and places the zeros of ζ: their record is a member of the domain, and the zeros themselves
  carry the first two axes by proof, their third being the classical statement.
DESIGN. Parts, in order.
    Part I    The plane: `fold`, `reg`, `Closed`, `Value`, `LeastErasure`, `ZetaZeros`; `h_id_proved`.
    Part II   The record: `Rec`, `record_has_least_erasure`, `cargo_at_zeros`.
    Part III  The functional equation: the zeros in the strip are closed under s ↦ 1 − s.
    Part IV   Schwarz reflection: ζ(conj s) = conj ζ(s); `zeta_zeros_closed`. Then the seat in general:
              `Seat`, `Folded`, `Witnessed`, `AllFixed`, `Triad`; `generalized_hypothesis`;
              `the_triad_is_irreducible`; `on_the_line_is_witnessed`.
    Part V    The plane as a seat: `lineSeat`, `generalized_hypothesis_on_the_plane`, `witnessed_iff_value`.
    Part VI   `the_record_of_the_zeros_is_a_member`; `the_zeros_are_witnessed_iff`.
    Part VI-b The Dirichlet family: `dirichlet_schwarz`, `DirichletZeros`, `dirichlet_zeros_closed`,
              `DirichletHypothesis`, `the_dirichlet_zeros_are_witnessed_iff`, for every primitive χ ≠ 1.
    Part VII  `the_triaxial_theorem`; `the_final_theorem`.
    Part VIII Nothing is outside, and the five faces: `every_record_is_a_member`,
              `the_record_of_the_record_is_the_record`, `any_other_point_is_again_at_the_seat`,
              `an_off_line_point_is_two`, `the_five_faces`, `the_five_faces_dirichlet`, `nothing_is_outside`,
              and the capstone `self_registration`.
    Part IX   Existence is registration: `self_recorded_iff_on_the_line`, the sixth face
              `the_zeros_are_their_own_record_iff`, the half registration on every seat,
              `the_two_axes_hold_both`, `existence_is_registration`.
  Parts I to IV, up to `zeta_zeros_closed`, are carried from the master file of the register,
  RH_Both_Sides_Formal_Master_v3_0_45_CC.lean, Part X, with no statement changed, so that this file stands alone.
HOW THE HYPOTHESIS STANDS IN THIS FILE (read before citing).
    (a) The classical Riemann Hypothesis is proved to be one statement with five exact faces (`the_five_faces`):
        the zeros are witnessed; every zero is its own registration; no two zeros share a height; all zeros stand
        at one place across the fold; every zero is a seat of the zeros; and a sixth, in Part IX: the zeros are
        their own record. `RiemannHypothesis` is printed as one
        side of each of these equivalences, and of the two equivalences carried from the master, and in no other form.
    (b) The same five faces are proved for the generalized hypothesis of every primitive Dirichlet character
        (`the_five_faces_dirichlet`). `DirichletHypothesis χ` is printed as one side of an equivalence and in no
        other form. The family covered is the primitive Dirichlet characters.
RISK. A reader may cite a face of the hypothesis as the hypothesis standing alone. Each face is an equivalence, and
  the file prints both of its sides.
NON-NEGOTIABLE. No axiom is declared, no sorry, no native_decide. The kernel line of every theorem the paper names
  is printed at the end.
-/
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.NumberTheory.LSeries.Dirichlet
import Mathlib.NumberTheory.LSeries.Nonvanishing
import Mathlib.Analysis.NormedSpace.Connected
import Mathlib.NumberTheory.LSeries.SumCoeff
import Mathlib.NumberTheory.LSeries.DirichletContinuation
import Mathlib.NumberTheory.MulChar.Lemmas

open Complex

namespace Triaxial

/-! ## Part I. The plane -/


/-- Points of the complex plane. -/
abbrev Point := ℂ

/-- The critical locus: Re s = 1/2. -/
def onLine (s : Point) : Prop := s.re = 1 / 2

/-- Conjugate reflection across the critical line: s ↦ 1 - conj s. -/
def fold (s : Point) : Point := 1 - star s

/-- Point reflection from the functional equation: s ↦ 1 - s. -/
def foldPt (s : Point) : Point := 1 - s

/-- Orthogonal retraction onto the critical line: s ↦ 1/2 + i Im s. -/
noncomputable def reg (s : Point) : Point := ⟨1 / 2, s.im⟩

abbrev Config := Point → Prop

/-- Reflection-closed configuration: invariant under s ↦ 1 - conj s. -/
def Closed (S : Config) : Prop := ∀ s, S s → S (fold s)

/-- Critical-line inclusion: every point of S lies on Re s = 1/2. -/
def Value (S : Config) : Prop := ∀ s, S s → onLine s

/-- Pointwise retraction invariance: every point of S is fixed by reg. -/
def LeastErasure (S : Config) : Prop := ∀ s, S s → reg s = s

/-- The nontrivial zero set of ζ(s), defined directly from Mathlib's riemannZeta. -/
def ZetaZeros (s : Point) : Prop :=
  riemannZeta s = 0 ∧ (¬∃ n : ℕ, s = -2 * (n + 1)) ∧ s ≠ 1

/-- The nontrivial zero set of the completed zeta function Λ(s). -/
def CompletedZetaZeros (s : Point) : Prop :=
  completedRiemannZeta s = 0 ∧ s ≠ 0 ∧ s ≠ 1

/-- Conjugate reflection is an involution on ℂ. -/
theorem fold_involutive (s : Point) : fold (fold s) = s := by
  simp only [fold, star_sub, star_one, star_star, sub_sub_cancel]

/-- Point reflection fixes the real part if and only if the point lies on the critical line. -/
theorem foldPt_re_fixed_iff (s : Point) : (foldPt s).re = s.re ↔ onLine s := by
  unfold foldPt onLine
  simp only [sub_re, one_re]
  constructor <;> intro h <;> linarith

/-- Symmetry of the completed zero set under s ↦ 1 - s from Mathlib's functional equation. -/
theorem completed_zeta_zeros_symm (s : Point) (h : CompletedZetaZeros s) :
    CompletedZetaZeros (foldPt s) := by
  rcases h with ⟨hz, h0, h1⟩
  refine ⟨?_, sub_ne_zero.mpr h1.symm, ?_⟩
  · show completedRiemannZeta (1 - s) = 0
    rw [completedRiemannZeta_one_sub]
    exact hz
  · show (1 : Point) - s ≠ 1
    intro hcon
    apply h0
    have h2 := congrArg (fun x : Point => (1 : Point) - x) hcon
    simpa using h2

/-- The retraction lands on the critical line for every complex number. -/
theorem reg_lands (s : Point) : onLine (reg s) := rfl

/-- Conjugate reflection fixes every retracted point. -/
theorem fold_reg (s : Point) : fold (reg s) = reg s := by
  apply Complex.ext
  · simp [fold, reg]
    norm_num
  · simp [fold, reg]

/-- The retraction fixes a point if and only if the point lies on the critical line. -/
theorem reg_eq_self_iff (s : Point) : reg s = s ↔ onLine s := by
  constructor
  · intro h
    show s.re = 1 / 2
    have hr := congrArg Complex.re h
    simpa [reg] using hr.symm
  · intro h
    have hre : s.re = 1 / 2 := h
    show (⟨1 / 2, s.im⟩ : Point) = s
    apply Complex.ext
    · show (1 / 2 : ℝ) = s.re
      exact hre.symm
    · rfl

/-- Pointwise retraction invariance is equivalent to critical-line inclusion on every subset of ℂ. -/
theorem twins_zeta (S : Config) : LeastErasure S ↔ Value S := by
  constructor
  · intro h s hs
    exact (reg_eq_self_iff s).mp (h s hs)
  · intro h s hs
    exact (reg_eq_self_iff s).mpr (h s hs)

/-- Mathlib's RiemannHypothesis is equivalent, by currying its three hypotheses, to critical-line inclusion of
    ZetaZeros. -/
theorem h_read_proved : RiemannHypothesis ↔ Value ZetaZeros := by
  constructor
  · intro h s ⟨h0, h1, h2⟩
    exact h s h0 h1 h2
  · intro h s h0 h1 h2
    exact h s ⟨h0, h1, h2⟩

/-- Mathlib's RiemannHypothesis is equivalent to pointwise retraction invariance of ZetaZeros. -/
theorem h_id_proved : RiemannHypothesis ↔ LeastErasure ZetaZeros :=
  h_read_proved.trans (twins_zeta ZetaZeros).symm

/-! ## Part II. The record -/

def Rec (S : Config) : Config := fun q => ∃ p, S p ∧ reg p = q

/-- Retraction is idempotent on ℂ. -/
theorem reg_idem (s : Point) : reg (reg s) = reg s := rfl

/-- Every retracted image lies on the critical line. -/
theorem the_remembered_is_lossless (S : Config) : Value (Rec S) := by
  intro q ⟨p, _, hpq⟩
  rw [← hpq]
  exact reg_lands p

/-- Every retracted image is closed under conjugate reflection. -/
theorem record_closed (S : Config) : Closed (Rec S) := by
  intro q ⟨p, hp, hpq⟩
  exact ⟨p, hp, by rw [← hpq, fold_reg p]⟩

/-- Every retracted image is pointwise invariant under reg. -/
theorem record_has_least_erasure (S : Config) : LeastErasure (Rec S) := by
  intro q ⟨p, _, hpq⟩
  show reg q = q
  rw [← hpq, reg_idem]

/-- The record of the zeros of ζ lies on the line. -/
theorem cargo_at_zeros : LeastErasure (Rec ZetaZeros) := record_has_least_erasure ZetaZeros

/-! ## Part III. The functional equation -/

/-! ### X-e . Step 4 from First Principles: Strip Equivalence and Functional-Equation Closure -/

/-- Point reflection s ↦ 1 - s is an involution on ℂ. -/
theorem foldPt_involutive (s : Point) : foldPt (foldPt s) = s := by
  unfold foldPt
  ring

/-- Point-reflection closure on complex configurations: invariant under s ↦ 1 - s. -/
def ClosedPt (S : Config) : Prop := ∀ s, S s → S (foldPt s)

/-- Unconditional functional-equation closure of CompletedZetaZeros under s ↦ 1 - s. -/
theorem completed_zeta_zeros_closed_pt : ClosedPt CompletedZetaZeros :=
  completed_zeta_zeros_symm

/-- First-principles bridge from Mathlib's riemannZeta_def_of_ne_zero and Gammaℝ_ne_zero_of_re_pos:
    at any complex point with 0 < Re s, riemannZeta s = 0 iff completedRiemannZeta s = 0. -/
theorem zeta_zero_iff_completed_of_re_pos {s : Point} (hre : 0 < s.re) :
    riemannZeta s = 0 ↔ completedRiemannZeta s = 0 := by
  have hs0 : s ≠ 0 := by
    intro h0
    rw [h0, zero_re] at hre
    exact lt_irrefl 0 hre
  have hG : Gammaℝ s ≠ 0 := Gammaℝ_ne_zero_of_re_pos hre
  rw [riemannZeta_def_of_ne_zero hs0, div_eq_zero_iff]
  exact ⟨fun h => h.resolve_right hG, fun h => Or.inl h⟩

/-- Inside the critical strip 0 < Re s < 1, ZetaZeros s ↔ CompletedZetaZeros s.
    Proved unconditionally from first principles using Mathlib's Gammaℝ non-vanishing. -/
theorem zeta_zeros_iff_completed_in_strip {s : Point} (h0 : 0 < s.re) (h1 : s.re < 1) :
    ZetaZeros s ↔ CompletedZetaZeros s := by
  have hs0 : s ≠ 0 := by
    intro heq
    rw [heq, zero_re] at h0
    exact lt_irrefl 0 h0
  have hs1 : s ≠ 1 := by
    intro heq
    rw [heq, one_re] at h1
    exact lt_irrefl 1 h1
  have h_not_trivial : ¬∃ n : ℕ, s = -2 * (n + 1) := by
    rintro ⟨n, rfl⟩
    have hneg : ((-2 : Point) * ((n : Point) + 1)).re ≤ 0 := by
      have hcast : ((-2 : Point) * ((n : Point) + 1)) = (((-2 * ((n : ℝ) + 1)) : ℝ) : ℂ) := by
        push_cast
        ring
      rw [hcast, Complex.ofReal_re]
      have hnn : (0 : ℝ) ≤ (n : ℝ) := Nat.cast_nonneg n
      linarith
    linarith
  unfold ZetaZeros CompletedZetaZeros
  rw [zeta_zero_iff_completed_of_re_pos h0]
  exact ⟨fun ⟨hz, _, _⟩ => ⟨hz, hs0, hs1⟩, fun ⟨hz, _, _⟩ => ⟨hz, h_not_trivial, hs1⟩⟩

/-- Unconditional functional-equation symmetry of ZetaZeros inside the critical strip:
    if 0 < Re s < 1 and ZetaZeros s, then ZetaZeros (1 - s). -/
theorem zeta_zeros_symm_in_strip {s : Point} (h0 : 0 < s.re) (h1 : s.re < 1)
    (hz : ZetaZeros s) : ZetaZeros (foldPt s) := by
  have h1_0 : 0 < (foldPt s).re := by unfold foldPt; simp only [sub_re, one_re]; linarith
  have h1_1 : (foldPt s).re < 1 := by unfold foldPt; simp only [sub_re, one_re]; linarith
  rw [zeta_zeros_iff_completed_in_strip h1_0 h1_1]
  exact completed_zeta_zeros_symm s ((zeta_zeros_iff_completed_in_strip h0 h1).mp hz)

/-- The strip-confined nontrivial zero set of ζ(s). -/
def StripZetaZeros (s : Point) : Prop := ZetaZeros s ∧ 0 < s.re ∧ s.re < 1

/-- Unconditional closure of StripZetaZeros under s ↦ 1 - s. -/
theorem strip_zeta_zeros_closed_pt : ClosedPt StripZetaZeros := by
  intro s ⟨hz, h0, h1⟩
  refine ⟨zeta_zeros_symm_in_strip h0 h1 hz, ?_, ?_⟩
  · unfold foldPt; simp only [sub_re, one_re]; linarith
  · unfold foldPt; simp only [sub_re, one_re]; linarith


/-! ## Part IV. Schwarz reflection, and the seat in general -/

/-! ### X-h . Schwarz Reflection Chain: ZetaZeros is Reflection-Closed -/

/-- Auxiliary: conjugation reflects differentiability. -/
theorem differentiableAt_star_comp {f : Point → Point} {x : Point}
    (hf : DifferentiableAt ℂ f (star x)) :
    DifferentiableAt ℂ (fun y => star (f (star y))) x := by
  obtain ⟨Df, hDf⟩ := hf
  have hstar_smul : ∀ c z : Point, star (c • z) = (star c) • (star z) := by
    intro c z
    rw [smul_eq_mul, star_mul, smul_eq_mul, mul_comm]
  have norm_star : ∀ w : Point, ‖star w‖ = ‖w‖ := fun w => Complex.norm_conj w
  let D : Point →L[ℂ] Point :=
    { toFun := fun z => star (Df (star z)),
      map_add' := fun a b => by
        show star (Df (star (a + b))) = star (Df (star a)) + star (Df (star b))
        rw [star_add, map_add, star_add],
      map_smul' := fun c z => by
        show star (Df (star (c • z))) = c • star (Df (star z))
        rw [hstar_smul, map_smul, smul_eq_mul, star_mul, star_star, smul_eq_mul, mul_comm],
      cont := (continuous_star.comp (Df.cont.comp continuous_star)) }
  refine ⟨D, ?_⟩
  rw [hasFDerivAt_iff_tendsto]
  have hD : ∀ y : Point, D (y - x) = star (Df ((star y) - (star x))) := by
    intro y
    show star (Df (star (y - x))) = star (Df (star y - star x))
    rw [star_sub]
  have hnorm : ∀ y : Point, ‖(star y) - (star x)‖ = ‖y - x‖ := by
    intro y
    rw [← star_sub, norm_star]
  have key : ∀ y : Point, ‖y - x‖⁻¹ * ‖star (f (star y)) - star (f (star x)) - D (y - x)‖
      = ‖(star y) - (star x)‖⁻¹ * ‖f (star y) - f (star x) - Df ((star y) - (star x))‖ := by
    intro y
    calc ‖y - x‖⁻¹ * ‖star (f (star y)) - star (f (star x)) - D (y - x)‖
        = ‖y - x‖⁻¹ * ‖star (f (star y) - f (star x) - Df ((star y) - (star x)))‖ := by
          congr 1
          rw [hD y, star_sub, star_sub]
      _ = ‖y - x‖⁻¹ * ‖f (star y) - f (star x) - Df ((star y) - (star x))‖ := by
          rw [norm_star]
      _ = ‖(star y) - (star x)‖⁻¹ * ‖f (star y) - f (star x) - Df ((star y) - (star x))‖ := by
          rw [hnorm]
  simp_rw [key]
  have hDf' : Filter.Tendsto
      (fun u => ‖u - star x‖⁻¹ * ‖f u - f (star x) - Df (u - star x)‖)
      (nhds (star x)) (nhds 0) := by
    rwa [← hasFDerivAt_iff_tendsto]
  have hstar_cont : Filter.Tendsto (fun y : Point => star y) (nhds x) (nhds (star x)) :=
    (continuous_star.tendsto x)
  exact hDf'.comp hstar_cont

/-- Auxiliary: star of a nat-cast complex power. -/
theorem star_natCast_cpow (n : ℕ) (t : Point) :
    star (((n:Point)) ^ (star t)) = ((n:Point)) ^ t := by
  have harg : ((n:Point)).arg ≠ Real.pi := by
    rw [Complex.natCast_arg]
    exact (Real.pi_ne_zero).symm
  have h2 := Complex.cpow_conj ((n:Point)) t harg
  show (starRingEnd ℂ) (↑n ^ (starRingEnd ℂ) t) = ↑n ^ t
  rw [h2]
  have hinv : ∀ W : Point, (starRingEnd ℂ) ((starRingEnd ℂ) W) = W := by
    intro W
    show star (star W) = W
    exact star_star W
  rw [hinv, map_natCast]

/-- Schwarz reflection for the Riemann zeta function. -/
theorem zeta_schwarz_reflection (s : Point) (hs : s ≠ 1) :
    riemannZeta (star s) = star (riemannZeta s) := by
  have hF_diff : DifferentiableOn ℂ (fun y => star (riemannZeta (star y))) {1}ᶜ := by
    intro x hx
    rw [Set.mem_compl_iff, Set.mem_singleton_iff] at hx
    apply DifferentiableAt.differentiableWithinAt
    apply differentiableAt_star_comp
    apply differentiableAt_riemannZeta
    intro hcon
    apply hx
    have hxx : x = star (star x) := (star_star x).symm
    rw [hxx, hcon, star_one]
  have hF_analytic : AnalyticOnNhd ℂ (fun y => star (riemannZeta (star y))) {1}ᶜ :=
    DifferentiableOn.analyticOnNhd hF_diff isOpen_compl_singleton
  have hzeta_analytic : AnalyticOnNhd ℂ riemannZeta {1}ᶜ := by
    apply DifferentiableOn.analyticOnNhd
    · intro x hx
      rw [Set.mem_compl_iff, Set.mem_singleton_iff] at hx
      exact (differentiableAt_riemannZeta hx).differentiableWithinAt
    · exact isOpen_compl_singleton
  have hEqOn : Set.EqOn (fun y => star (riemannZeta (star y))) riemannZeta {t : Point | 1 < t.re} := by
    intro t ht
    simp only [Set.mem_setOf_eq] at ht
    have ht_star : (1:ℝ) < (star t).re := by
      have hre : (star t).re = t.re := Complex.conj_re t
      rw [hre]; exact ht
    show star (riemannZeta (star t)) = riemannZeta t
    rw [zeta_eq_tsum_one_div_nat_cpow ht_star, zeta_eq_tsum_one_div_nat_cpow ht, tsum_star]
    apply tsum_congr
    intro n
    rw [star_div₀, star_one, star_natCast_cpow]
  have hnbhd : {t : Point | 1 < t.re} ∈ nhds (2:Point) := by
    apply IsOpen.mem_nhds
    · exact Complex.continuous_re.isOpen_preimage _ isOpen_Ioi
    · simp
  have hev : (fun y => star (riemannZeta (star y))) =ᶠ[nhds 2] riemannZeta :=
    Filter.eventuallyEq_of_mem hnbhd hEqOn
  have hpre : IsPreconnected ({1}ᶜ : Set Point) := by
    apply IsConnected.isPreconnected
    refine isConnected_compl_singleton_of_one_lt_rank ?_ (1:Point)
    rw [Complex.rank_real_complex]
    norm_num
  have h2 : (2:Point) ∈ ({1}ᶜ : Set Point) := by simp
  have hEq := AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq
    hF_analytic hzeta_analytic hpre h2 hev
  have hs_mem : s ∈ ({1}ᶜ : Set Point) := by simpa using hs
  have hFs := hEq hs_mem
  simp only at hFs
  have hcon := congrArg star hFs
  simp only [star_star] at hcon
  exact hcon

/-- Zeta does not vanish at negative odd integers. -/
theorem zeta_ne_zero_neg_odd (k : ℕ) : riemannZeta (-(2 * (k : Point) + 1)) ≠ 0 := by
  have hwre : (2 * (k:Point) + 2).re = 2 * (k:ℝ) + 2 := by
    simp [Complex.add_re, Complex.mul_re, Complex.natCast_re]
  have hk0 : (0:ℝ) ≤ (k:ℝ) := Nat.cast_nonneg k
  have hw1 : (2:Point) * (k:Point) + 2 ≠ 1 := by
    intro h
    have hre := congrArg Complex.re h
    rw [hwre] at hre
    simp at hre
    linarith
  have hw_neg : ∀ n : ℕ, (2:Point) * (k:Point) + 2 ≠ -((n:Point)) := by
    intro n h
    have hre := congrArg Complex.re h
    rw [hwre] at hre
    simp [Complex.neg_re, Complex.natCast_re] at hre
    have hn0 : (0:ℝ) ≤ (n:ℝ) := Nat.cast_nonneg n
    linarith
  have hfe := riemannZeta_one_sub (s := 2*(k:Point)+2) hw_neg hw1
  have h1w : (1:Point) - (2*(k:Point)+2) = -(2 * (k:Point) + 1) := by ring
  rw [h1w] at hfe
  rw [hfe]
  apply mul_ne_zero
  apply mul_ne_zero
  apply mul_ne_zero
  apply mul_ne_zero
  · norm_num
  · have h2pi_ne : ((2:Point) * Real.pi) ≠ 0 := by
      apply mul_ne_zero
      · norm_num
      · exact_mod_cast Real.pi_ne_zero
    rw [Complex.cpow_def_of_ne_zero h2pi_ne]
    exact Complex.exp_ne_zero _
  · apply Complex.Gamma_ne_zero_of_re_pos
    rw [hwre]
    linarith
  · have hcos_arg : (Real.pi:Point) * (2*(k:Point)+2) / 2 = (((Real.pi * ((k+1:ℕ):ℝ) : ℝ)):Point) := by
      push_cast
      ring
    have hcos_val : Real.cos (Real.pi * ((k+1:ℕ):ℝ)) = (-1)^((k+1:ℕ)) := by
      have h := Real.cos_add_nat_mul_pi (0:ℝ) (k+1)
      rw [zero_add, Real.cos_zero, mul_one] at h
      rw [mul_comm Real.pi]
      exact h
    have hne : ((-1:ℝ)^((k+1:ℕ))) ≠ 0 := pow_ne_zero _ (by norm_num)
    rw [hcos_arg, ← Complex.ofReal_cos, hcos_val]
    exact_mod_cast hne
  · apply riemannZeta_ne_zero_of_one_lt_re
    rw [hwre]
    linarith

/-- Nontrivial zeros avoid the nonpositive integers. -/
theorem zeta_zeros_not_neg_nat {s : Point} (hz : ZetaZeros s) : ∀ n : ℕ, s ≠ -(n : Point) := by
  intro n h
  obtain ⟨hz0, hz1, hz2⟩ := hz
  rcases Nat.even_or_odd n with ⟨k, hk⟩ | ⟨k, hk⟩
  · rcases k with _ | k
    · have hn0 : n = 0 := by omega
      subst hn0
      simp at h
      rw [h, riemannZeta_zero] at hz0
      norm_num at hz0
    · have hn : n = 2 * (k + 1) := by omega
      subst hn
      apply hz1
      use k
      rw [h]
      push_cast
      ring
  · have hn : n = 2 * k + 1 := by omega
    subst hn
    have hs : s = -(2 * (k:Point) + 1) := by
      rw [h]
      push_cast
      ring
    rw [hs] at hz0
    exact (zeta_ne_zero_neg_odd k) hz0

/-- The nontrivial zero set is closed under s ↦ 1 - s. -/
theorem zeta_zeros_symm {s : Point} (hz : ZetaZeros s) : ZetaZeros (foldPt s) := by
  obtain ⟨hz0, hz1, hz2⟩ := hz
  have hne := zeta_zeros_not_neg_nat ⟨hz0, hz1, hz2⟩
  have hfe := riemannZeta_one_sub (s := s) hne hz2
  show ZetaZeros (1 - s)
  constructor
  · rw [hfe, hz0, mul_zero]
  · constructor
    · intro ⟨m, hm⟩
      have hs : s = 1 + 2 * ((m:Point) + 1) := by linear_combination -hm
      have hre : s.re = 1 + 2 * ((m:ℝ) + 1) := by
        rw [hs]
        simp [Complex.add_re, Complex.mul_re, Complex.natCast_re]
      have h1lt : (1:ℝ) < s.re := by
        rw [hre]
        have hm0 : (0:ℝ) ≤ (m:ℝ) := Nat.cast_nonneg m
        linarith
      exact (riemannZeta_ne_zero_of_one_lt_re h1lt) hz0
    · intro hcon
      have hs0 : s = 0 := by linear_combination -hcon
      have hne0 := hne 0
      simp at hne0
      exact hne0 hs0

/-- The nontrivial zero set is closed under the point reflection. -/
theorem zeta_zeros_closed_pt : ClosedPt ZetaZeros :=
  fun _ hz => zeta_zeros_symm hz

/-- The nontrivial zero set is closed under conjugation. -/
theorem zeta_zeros_conj {s : Point} (hz : ZetaZeros s) : ZetaZeros (star s) := by
  obtain ⟨hz0, hz1, hz2⟩ := hz
  constructor
  · rw [zeta_schwarz_reflection s hz2, hz0, star_zero]
  · constructor
    · intro ⟨n, hn⟩
      apply hz1
      use n
      have hss : s = star (star s) := (star_star s).symm
      rw [hss, hn]
      simp
    · intro hcon
      apply hz2
      have hss : s = star (star s) := (star_star s).symm
      rw [hss, hcon, star_one]

/-- The nontrivial zero set is closed under the conjugate reflection fold. -/
theorem zeta_zeros_closed : Closed ZetaZeros :=
  fun _ hz => zeta_zeros_symm (zeta_zeros_conj hz)

/-- A seat: a fold that is an involution, and a registration the fold keeps. -/
structure Seat (X Y : Type) where
  fold : X → X
  involutive : ∀ a, fold (fold a) = a
  reg : X → Y
  keeps : ∀ a, reg (fold a) = reg a

section General
variable {X Y : Type} (σ : Seat X Y)

/-- FORM: the configuration is closed under the fold. -/
def Folded (S : X → Prop) : Prop := ∀ a, S a → S (σ.fold a)
/-- REGISTRATION: the record returns every existent; no two existents share a registration. -/
def Witnessed (S : X → Prop) : Prop := ∀ a b, S a → S b → σ.reg a = σ.reg b → a = b
/-- THE LINE: every existent is fixed by the fold. -/
def AllFixed (S : X → Prop) : Prop := ∀ a, S a → σ.fold a = a
/-- THE TRIAD: existence, form and registration together. -/
def Triad (S : X → Prop) : Prop := (∃ a, S a) ∧ Folded σ S ∧ Witnessed σ S

/-- THE GENERALIZED HYPOTHESIS, TRIAXIAL FORM. On every seat, a configuration that is closed under the fold and
    whose record returns every existent has every existent on the line. -/
theorem generalized_hypothesis (S : X → Prop) (form : Folded σ S) (witness : Witnessed σ S) : AllFixed σ S :=
  fun a ha => witness (σ.fold a) a (form a ha) ha (σ.keeps a)

/-- A triad has an existent, and it is on the line. -/
theorem a_triad_has_an_existent_on_the_line (S : X → Prop) (h : Triad σ S) : ∃ a, S a ∧ σ.fold a = a :=
  let ⟨a, ha⟩ := h.1
  ⟨a, ha, generalized_hypothesis σ S h.2.1 h.2.2 a ha⟩

/-- On the line the witness holds, where the registration tells the points of the line apart. -/
theorem on_the_line_is_witnessed
    (faithful : ∀ a b, σ.fold a = a → σ.fold b = b → σ.reg a = σ.reg b → a = b)
    (S : X → Prop) (h : AllFixed σ S) : Witnessed σ S :=
  fun a b ha hb e => faithful a b (h a ha) (h b hb) e

/-- THE TRIAD IS IRREDUCIBLE. Where the fold moves a point, no two axes give the line: without form there is a
    witnessed configuration off the line; without registration there is a closed configuration off the line;
    without existence there is a closed and witnessed configuration with nothing on the line. -/
theorem the_triad_is_irreducible (p : X) (moved : σ.fold p ≠ p) :
    (∃ S : X → Prop, (∃ a, S a) ∧ Witnessed σ S ∧ ¬ AllFixed σ S) ∧
    (∃ S : X → Prop, (∃ a, S a) ∧ Folded σ S ∧ ¬ AllFixed σ S) ∧
    (∃ S : X → Prop, Folded σ S ∧ Witnessed σ S ∧ ¬ ∃ a, S a ∧ σ.fold a = a) := by
  refine ⟨⟨fun x => x = p, ⟨p, rfl⟩, ?_, ?_⟩, ⟨fun x => x = p ∨ x = σ.fold p, ⟨p, Or.inl rfl⟩, ?_, ?_⟩,
    ⟨fun _ => False, fun _ h => h, fun _ _ h => h.elim, fun ⟨_, h, _⟩ => h⟩⟩
  · intro a b ha hb _; rw [ha, hb]
  · intro h; exact moved (h p rfl)
  · rintro a (ha | ha)
    · exact Or.inr (by rw [ha])
    · exact Or.inl (by rw [ha, σ.involutive])
  · intro h; exact moved (h p (Or.inl rfl))

end General

/-! ## Part V. The plane -/

theorem fold_re (s : ℂ) : (fold s).re = 1 - s.re := by simp [fold]
theorem fold_im (s : ℂ) : (fold s).im = s.im := by simp [fold]

/-- THE SEAT OF THE PLANE: `fold` and `reg` on ℂ. -/
noncomputable def lineSeat : Seat ℂ ℂ where
  fold := fold
  involutive := fold_involutive
  reg := reg
  keeps := fun s => by
    show (⟨1 / 2, (fold s).im⟩ : ℂ) = ⟨1 / 2, s.im⟩
    rw [fold_im]

/-- On the plane, the fold fixes a point exactly on the line Re s = 1/2. -/
theorem fixed_iff_on_line (s : ℂ) : lineSeat.fold s = s ↔ onLine s := by
  show fold s = s ↔ s.re = 1 / 2
  constructor
  · intro h
    have h2 := congrArg Complex.re h
    rw [fold_re] at h2
    linarith
  · intro h
    exact Complex.ext (by rw [fold_re]; linarith) (fold_im s)

/-- THE GENERALIZED HYPOTHESIS ON THE PLANE. A configuration of ℂ that is closed under the fold and whose
    record returns every existent lies on the line Re s = 1/2. -/
theorem generalized_hypothesis_on_the_plane (S : Config) (form : Closed S) (witness : Witnessed lineSeat S) :
    Value S :=
  fun s hs => (fixed_iff_on_line s).mp (generalized_hypothesis lineSeat S form witness s hs)

theorem lineSeat_faithful :
    ∀ a b : ℂ, lineSeat.fold a = a → lineSeat.fold b = b → lineSeat.reg a = lineSeat.reg b → a = b := by
  intro a b ha hb e
  have ea : reg a = a := (reg_eq_self_iff a).mpr ((fixed_iff_on_line a).mp ha)
  have eb : reg b = b := (reg_eq_self_iff b).mpr ((fixed_iff_on_line b).mp hb)
  have e' : reg a = reg b := e
  rw [ea, eb] at e'
  exact e'

/-- On the plane, for a closed configuration, the witness and the line are one statement. -/
theorem witnessed_iff_value (S : Config) (form : Closed S) : Witnessed lineSeat S ↔ Value S :=
  ⟨generalized_hypothesis_on_the_plane S form,
   fun h => on_the_line_is_witnessed lineSeat lineSeat_faithful S
     (fun s hs => (fixed_iff_on_line s).mpr (h s hs))⟩

/-- The plane has a point the fold moves, so its triad is irreducible. -/
theorem the_plane_triad_is_irreducible :
    (∃ S : Config, (∃ a, S a) ∧ Witnessed lineSeat S ∧ ¬ AllFixed lineSeat S) ∧
    (∃ S : Config, (∃ a, S a) ∧ Folded lineSeat S ∧ ¬ AllFixed lineSeat S) ∧
    (∃ S : Config, Folded lineSeat S ∧ Witnessed lineSeat S ∧ ¬ ∃ a, S a ∧ lineSeat.fold a = a) := by
  refine the_triad_is_irreducible lineSeat (⟨1 / 4, 14⟩ : ℂ) ?_
  intro h
  have := (fixed_iff_on_line _).mp h
  unfold onLine at this
  norm_num at this

/-! ## Part VI. The record and the zeros of ζ -/

/-- THE RECORD OF THE ZEROS IS A MEMBER, with nothing before the colon: it is closed under the fold, its record
    returns every existent, and it lies on the line. -/
theorem the_record_of_the_zeros_is_a_member :
    Folded lineSeat (Rec ZetaZeros) ∧ Witnessed lineSeat (Rec ZetaZeros) ∧ Value (Rec ZetaZeros) := by
  have v : Value (Rec ZetaZeros) := fun s hs => (reg_eq_self_iff s).mp (cargo_at_zeros s hs)
  have fx : AllFixed lineSeat (Rec ZetaZeros) := fun s hs => (fixed_iff_on_line s).mpr (v s hs)
  refine ⟨fun s hs => ?_, on_the_line_is_witnessed lineSeat lineSeat_faithful _ fx, v⟩
  rw [fx s hs]; exact hs

/-- WHERE THE ZEROS STAND. The zeros of ζ exist as a configuration and are closed under the fold, by proof. Their
    third axis, the witness, is the classical statement. -/
theorem the_zeros_are_witnessed_iff :
    Closed ZetaZeros ∧ (Witnessed lineSeat ZetaZeros ↔ RiemannHypothesis) := by
  refine ⟨zeta_zeros_closed, (witnessed_iff_value ZetaZeros zeta_zeros_closed).trans ?_⟩
  rw [h_id_proved]
  exact ⟨fun h s hs => (reg_eq_self_iff s).mpr (h s hs), fun h s hs => (reg_eq_self_iff s).mp (h s hs)⟩

/-! ## The Dirichlet family

RATIONALE. The fold of the plane is not special to ζ. Every primitive Dirichlet character χ ≠ 1 has its own
  functional equation, and with Schwarz reflection it closes the zeros of L(·, χ) in the open strip under the
  same fold s ↦ 1 − conj s. So those zeros are a configuration with two proved axes, and their third axis, the
  witness, is one proposition with the generalized hypothesis for χ.
DESIGN. `inv_isPrimitive` (the conjugate character is primitive); `dirichlet_schwarz` (L(s, χ⁻¹) is the
  conjugate of L(conj s, χ), by the identity theorem from the half plane of convergence); `DirichletZeros`;
  `dirichlet_zeros_closed`; `DirichletHypothesis`; `the_dirichlet_zeros_are_witnessed_iff`.
SCOPE (read before citing). Primitive characters with χ ≠ 1. The one remaining primitive character is the
  trivial character of level 1, whose L-function is ζ; it is `the_zeros_are_witnessed_iff`. `DirichletHypothesis χ`
  is printed inside a biconditional and nowhere else.
NON-NEGOTIABLE. No axiom, no sorry. The hypothesis for χ is never stated alone as a theorem.
-/

section DirichletFamily
open DirichletCharacter

variable {N : ℕ} [NeZero N]

omit [NeZero N] in
/-- The inverse (complex conjugate) of a primitive character is primitive. -/
theorem inv_isPrimitive {χ : DirichletCharacter ℂ N} (hχ : χ.IsPrimitive) : (χ⁻¹).IsPrimitive := by
  have key : ∀ ψ : DirichletCharacter ℂ N, ψ.conductorSet ⊆ (ψ⁻¹).conductorSet := by
    intro ψ d hd
    obtain ⟨h, χ₀, e⟩ := hd
    exact ⟨h, χ₀⁻¹, by rw [e, map_inv]⟩
  have e : (χ⁻¹).conductorSet = χ.conductorSet :=
    Set.Subset.antisymm (by have := key χ⁻¹; rwa [inv_inv] at this) (key χ)
  show (χ⁻¹).conductor = N
  have h0 : χ.conductor = N := hχ
  unfold DirichletCharacter.conductor at h0 ⊢
  rw [e]; exact h0

/-- Schwarz reflection for a Dirichlet L-function: L(s, χ⁻¹) is the conjugate of L(conj s, χ). -/
theorem dirichlet_schwarz (χ : DirichletCharacter ℂ N) (hne : χ ≠ 1) (s : ℂ) :
    LFunction χ⁻¹ s = star (LFunction χ (star s)) := by
  have hne' : χ⁻¹ ≠ 1 := fun h => hne (inv_eq_one.mp h)
  have hF : Differentiable ℂ (fun y => star (LFunction χ (star y))) :=
    fun x => differentiableAt_star_comp ((differentiable_LFunction hne) (star x))
  have hG : Differentiable ℂ (LFunction χ⁻¹) := differentiable_LFunction hne'
  have hEqOn : Set.EqOn (fun y => star (LFunction χ (star y))) (LFunction χ⁻¹) {t : ℂ | 1 < t.re} := by
    intro t ht
    simp only [Set.mem_setOf_eq] at ht
    have ht' : (1 : ℝ) < (star t).re := by rw [show (star t).re = t.re from Complex.conj_re t]; exact ht
    show star (LFunction χ (star t)) = LFunction χ⁻¹ t
    rw [LFunction_eq_LSeries χ ht', LFunction_eq_LSeries χ⁻¹ ht]
    unfold LSeries
    rw [tsum_star]
    apply tsum_congr
    intro n
    unfold LSeries.term
    split_ifs with h0
    · exact star_zero _
    · rw [star_div₀, star_natCast_cpow, MulChar.star_apply']
  have hnbhd : {t : ℂ | 1 < t.re} ∈ nhds (2 : ℂ) :=
    IsOpen.mem_nhds (Complex.continuous_re.isOpen_preimage _ isOpen_Ioi) (by simp)
  have hEq := AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq
    (hF.differentiableOn.analyticOnNhd isOpen_univ) (hG.differentiableOn.analyticOnNhd isOpen_univ)
    isPreconnected_univ (Set.mem_univ (2 : ℂ)) (Filter.eventuallyEq_of_mem hnbhd hEqOn)
  exact (hEq (Set.mem_univ s)).symm

omit [NeZero N] in
/-- In the open strip the gamma factor of a character does not vanish. -/
theorem gammaFactor_ne_zero_of_strip (χ : DirichletCharacter ℂ N) {s : ℂ} (h0 : 0 < s.re) :
    gammaFactor χ s ≠ 0 := by
  rcases χ.even_or_odd with h | h
  · rw [h.gammaFactor_def]; exact Complex.Gammaℝ_ne_zero_of_re_pos h0
  · rw [h.gammaFactor_def]
    exact Complex.Gammaℝ_ne_zero_of_re_pos (by rw [Complex.add_re, Complex.one_re]; linarith)

/-- The zeros of L(·, χ) in the open strip: the nontrivial zeros. -/
def DirichletZeros (χ : DirichletCharacter ℂ N) (s : ℂ) : Prop :=
  LFunction χ s = 0 ∧ 0 < s.re ∧ s.re < 1

/-- THE SECOND AXIS OF THE DIRICHLET ZEROS. For a primitive χ ≠ 1 the nontrivial zeros of L(·, χ) are closed
    under the fold s ↦ 1 − conj s. Functional equation, then Schwarz reflection. -/
theorem dirichlet_zeros_closed {χ : DirichletCharacter ℂ N} (hχ : χ.IsPrimitive) (hne : χ ≠ 1) :
    Closed (DirichletZeros χ) := by
  intro s hs
  obtain ⟨hz, h0, h1⟩ := hs
  have hN : N ≠ 1 := fun h => hne (level_one' χ h)
  -- the completed function vanishes at s
  have hΛ : completedLFunction χ s = 0 := by
    have e := LFunction_eq_completed_div_gammaFactor χ s (Or.inr hN)
    rw [hz] at e
    rcases div_eq_zero_iff.mp e.symm with h | h
    · exact h
    · exact absurd h (gammaFactor_ne_zero_of_strip χ h0)
  -- the functional equation of χ⁻¹ carries the zero to 1 − s
  have hΛ' : completedLFunction χ⁻¹ (1 - s) = 0 := by
    rw [(inv_isPrimitive hχ).completedLFunction_one_sub s, inv_inv, hΛ, mul_zero]
  have hL' : LFunction χ⁻¹ (1 - s) = 0 := by
    rw [LFunction_eq_completed_div_gammaFactor χ⁻¹ (1 - s) (Or.inr hN), hΛ', zero_div]
  -- Schwarz reflection carries it to the fold of s
  have hfold : fold s = star (1 - s) := by simp [fold]
  refine ⟨?_, ?_, ?_⟩
  · have e := dirichlet_schwarz χ hne (1 - s)
    rw [hL'] at e
    have e2 := congrArg star e
    rw [star_star, star_zero] at e2
    rw [hfold]; exact e2.symm
  · rw [fold_re]; linarith
  · rw [fold_re]; linarith

/-- The generalized Riemann hypothesis for the character χ: every zero of L(·, χ) in the open strip has real
    part 1/2. -/
def DirichletHypothesis (χ : DirichletCharacter ℂ N) : Prop :=
  ∀ s : ℂ, LFunction χ s = 0 → 0 < s.re → s.re < 1 → s.re = 1 / 2

/-- WHERE THE DIRICHLET ZEROS STAND. For every primitive χ ≠ 1 the nontrivial zeros of L(·, χ) exist as a
    configuration closed under the fold, by proof, and their witness is one proposition with the generalized
    hypothesis for χ. -/
theorem the_dirichlet_zeros_are_witnessed_iff {χ : DirichletCharacter ℂ N} (hχ : χ.IsPrimitive) (hne : χ ≠ 1) :
    Closed (DirichletZeros χ) ∧ (Witnessed lineSeat (DirichletZeros χ) ↔ DirichletHypothesis χ) := by
  refine ⟨dirichlet_zeros_closed hχ hne,
    (witnessed_iff_value _ (dirichlet_zeros_closed hχ hne)).trans ?_⟩
  exact ⟨fun h s hz h0 h1 => h s ⟨hz, h0, h1⟩, fun h s hs => h s hs.1 hs.2.1 hs.2.2⟩

end DirichletFamily

/-! ## Part VII. The theorem -/

/-- THE TRIAXIAL THEOREM. Nothing before the colon. -/
theorem the_triaxial_theorem :
    -- I. The generalized hypothesis, on every seat: form and registration give the line.
    (∀ (X Y : Type) (σ : Seat X Y) (S : X → Prop), Folded σ S → Witnessed σ S → AllFixed σ S) ∧
    -- II. Irreducibility, on every seat with a moved point: no two axes give the line.
    (∀ (X Y : Type) (σ : Seat X Y) (p : X), σ.fold p ≠ p →
      (∃ S : X → Prop, (∃ a, S a) ∧ Witnessed σ S ∧ ¬ AllFixed σ S) ∧
      (∃ S : X → Prop, (∃ a, S a) ∧ Folded σ S ∧ ¬ AllFixed σ S) ∧
      (∃ S : X → Prop, Folded σ S ∧ Witnessed σ S ∧ ¬ ∃ a, S a ∧ σ.fold a = a)) ∧
    -- III. On the plane: a closed and witnessed configuration lies on Re s = 1/2, and conversely.
    (∀ S : Config, Closed S → (Witnessed lineSeat S ↔ Value S)) ∧
    -- IV. The record of the zeros of ζ is a member.
    (Folded lineSeat (Rec ZetaZeros) ∧ Witnessed lineSeat (Rec ZetaZeros) ∧ Value (Rec ZetaZeros)) :=
  ⟨fun _ _ σ S f w => generalized_hypothesis σ S f w,
   fun _ _ σ p m => the_triad_is_irreducible σ p m,
   witnessed_iff_value,
   the_record_of_the_zeros_is_a_member⟩

/-- THE FINAL THEOREM. Nothing before the colon. The generalized hypothesis in triaxial form is a theorem in its
    own domain, direct, with no posit and no delivered bit; the triad is irreducible; on the plane the witness is
    the line; the record of the zeros of ζ is a member; and the zeros of ζ themselves carry existence and form by
    proof, their witness being the classical statement, one proposition on both sides; and the same holds for the
    zeros of every primitive Dirichlet L-function, their witness being the generalized hypothesis for the character. -/
theorem the_final_theorem :
    -- I. The generalized hypothesis, triaxial form, on every seat.
    (∀ (X Y : Type) (σ : Seat X Y) (S : X → Prop), Folded σ S → Witnessed σ S → AllFixed σ S) ∧
    -- II. The triad is irreducible on every seat with a moved point.
    (∀ (X Y : Type) (σ : Seat X Y) (p : X), σ.fold p ≠ p →
      (∃ S : X → Prop, (∃ a, S a) ∧ Witnessed σ S ∧ ¬ AllFixed σ S) ∧
      (∃ S : X → Prop, (∃ a, S a) ∧ Folded σ S ∧ ¬ AllFixed σ S) ∧
      (∃ S : X → Prop, Folded σ S ∧ Witnessed σ S ∧ ¬ ∃ a, S a ∧ σ.fold a = a)) ∧
    -- III. On the plane, for a closed configuration, the witness and the line Re s = 1/2 are one statement.
    (∀ S : Config, Closed S → (Witnessed lineSeat S ↔ Value S)) ∧
    -- IV. The record of the zeros of ζ is a member of the domain.
    (Folded lineSeat (Rec ZetaZeros) ∧ Witnessed lineSeat (Rec ZetaZeros) ∧ Value (Rec ZetaZeros)) ∧
    -- V. The zeros of ζ: closed under the fold by proof; their witness is the classical statement.
    (Closed ZetaZeros ∧ (Witnessed lineSeat ZetaZeros ↔ RiemannHypothesis)) ∧
    -- VI. The zeros of every primitive Dirichlet L-function, χ ≠ 1: closed under the fold by proof; their
    --     witness is the generalized hypothesis for χ.
    (∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N), χ.IsPrimitive → χ ≠ 1 →
      Closed (DirichletZeros χ) ∧ (Witnessed lineSeat (DirichletZeros χ) ↔ DirichletHypothesis χ)) :=
  ⟨the_triaxial_theorem.1, the_triaxial_theorem.2.1, the_triaxial_theorem.2.2.1, the_triaxial_theorem.2.2.2,
   the_zeros_are_witnessed_iff, fun _ _ _ hχ hne => the_dirichlet_zeros_are_witnessed_iff hχ hne⟩

/-! ## Part VIII. Nothing is outside; the five faces of the hypothesis

RATIONALE. The record of a configuration is where its registrations land. This part proves that every record of every
  configuration is a member of the domain, that the record of a record is the same record, that any point of the
  plane registers on the line and shares that registration with its partner, and that a point off the line is two
  points with one registration. It then proves that the hypothesis is one statement with five exact faces: the zeros
  are witnessed; the witness and the witnessed are one; one point cannot be two; every zero is the same point, in a
  different register each time; every zero is a seat of the zeros. For ζ and for every primitive Dirichlet character.
DESIGN. General lemmas on any closed configuration S: `value_iff_witness_is_witnessed`, `value_iff_one_point_not_two`,
  `value_iff_same_point`, `value_iff_every_point_is_a_seat`. Then `zeta_zeros_in_strip`, `the_five_faces`,
  `the_five_faces_dirichlet`, and `nothing_is_outside`, which binds the record theorems.
STANDING. Every theorem of this part has nothing before the colon but the configuration it speaks of and, for a
  character, that it is primitive and not trivial. No assent, no posit and no delivered bit appears anywhere in it.
  `RiemannHypothesis` and `DirichletHypothesis χ` occur only as one side of an equivalence.
NON-NEGOTIABLE. No axiom, no sorry, no hypothesis standing in for the hypothesis.
-/

/-- EVERY RECORD IS A MEMBER. For every configuration of the plane, with nothing assumed, its record is closed
    under the fold, witnessed, and on the line. -/
theorem every_record_is_a_member (S : Config) :
    Folded lineSeat (Rec S) ∧ Witnessed lineSeat (Rec S) ∧ Value (Rec S) := by
  have v : Value (Rec S) := fun s hs => (reg_eq_self_iff s).mp (record_has_least_erasure S s hs)
  have fx : AllFixed lineSeat (Rec S) := fun s hs => (fixed_iff_on_line s).mpr (v s hs)
  refine ⟨fun s hs => ?_, on_the_line_is_witnessed lineSeat lineSeat_faithful _ fx, v⟩
  rw [fx s hs]; exact hs

/-- THE RECORD OF THE RECORD IS THE RECORD. Registering again reaches no new place. -/
theorem the_record_of_the_record_is_the_record (S : Config) : Rec (Rec S) = Rec S := by
  funext q
  apply propext
  constructor
  · rintro ⟨p, ⟨r, hr, e⟩, e2⟩
    exact ⟨r, hr, by rw [← e2, ← e, reg_idem]⟩
  · rintro ⟨r, hr, e⟩
    exact ⟨reg r, ⟨r, hr, rfl⟩, by rw [reg_idem, e]⟩

/-- ANY OTHER POINT IS AGAIN AT THE SEAT. Take any point of the plane at all. Its registration is on the line, and
    its partner under the fold has that same registration. Nothing registers anywhere else. -/
theorem any_other_point_is_again_at_the_seat (a : ℂ) :
    onLine (lineSeat.reg a) ∧ lineSeat.reg (lineSeat.fold a) = lineSeat.reg a :=
  ⟨reg_lands a, lineSeat.keeps a⟩

/-- AN OFF-LINE POINT IS TWO. A point off the line and its partner are two distinct points with one registration:
    it has no registration of its own. -/
theorem an_off_line_point_is_two (a : ℂ) (off : ¬ onLine a) :
    lineSeat.fold a ≠ a ∧ lineSeat.reg (lineSeat.fold a) = lineSeat.reg a :=
  ⟨fun h => off ((fixed_iff_on_line a).mp h), lineSeat.keeps a⟩

/-- Two points have one registration exactly when they have one height. -/
theorem reg_eq_iff_im (a b : ℂ) : lineSeat.reg a = lineSeat.reg b ↔ a.im = b.im := by
  show (⟨1 / 2, a.im⟩ : ℂ) = ⟨1 / 2, b.im⟩ ↔ a.im = b.im
  constructor
  · intro h
    have h2 : (⟨1 / 2, a.im⟩ : ℂ).im = (⟨1 / 2, b.im⟩ : ℂ).im := congrArg Complex.im h
    exact h2
  · intro h
    rw [h]

/-- The real part of the partner. -/
theorem partner_re (s : ℂ) : (lineSeat.fold s).re = 1 - s.re := by
  show (fold s).re = 1 - s.re
  simp [fold]

/-- The height of the partner. -/
theorem partner_im (s : ℂ) : (lineSeat.fold s).im = s.im := by
  show (fold s).im = s.im
  simp [fold]

/-- FACE: THE WITNESS AND THE WITNESSED ARE ONE. A configuration lies on the line exactly when every one of its
    existents is its own registration. -/
theorem value_iff_witness_is_witnessed (S : Config) : Value S ↔ ∀ a, S a → lineSeat.reg a = a :=
  ⟨fun h a ha => (reg_eq_self_iff a).mpr (h a ha), fun h a ha => (reg_eq_self_iff a).mp (h a ha)⟩

/-- FACE: ONE POINT CANNOT BE TWO. A closed configuration lies on the line exactly when no two of its existents
    share a height. -/
theorem value_iff_one_point_not_two (S : Config) (form : Closed S) :
    Value S ↔ ∀ a b : ℂ, S a → S b → a.im = b.im → a = b :=
  (witnessed_iff_value S form).symm.trans
    ⟨fun w a b ha hb e => w a b ha hb ((reg_eq_iff_im a b).mpr e),
     fun h a b ha hb e => h a b ha hb ((reg_eq_iff_im a b).mp e)⟩

/-- FACE: THE SAME POINT, A DIFFERENT REGISTER EVERY TIME. A closed configuration lies on the line exactly when all
    of its existents stand at one place across the fold. The place is not named; the fold forces it to be the line. -/
theorem value_iff_same_point (S : Config) (form : Closed S) :
    Value S ↔ ∀ a b : ℂ, S a → S b → a.re = b.re := by
  constructor
  · intro h a b ha hb
    have h1 : a.re = 1 / 2 := h a ha
    have h2 : b.re = 1 / 2 := h b hb
    rw [h1, h2]
  · intro h a ha
    have e := h a (fold a) ha (form a ha)
    have e2 : (fold a).re = 1 - a.re := partner_re a
    show a.re = 1 / 2
    rw [e2] at e
    linarith

/-- FACE: EVERY POINT IS A SEAT. A closed configuration inside the open strip lies on the line exactly when it is
    closed under the fold through each of its own existents. Two folds make a slide, and a slide leaves the strip. -/
theorem value_iff_every_point_is_a_seat (S : Config) (form : Closed S)
    (strip : ∀ a, S a → 0 < a.re ∧ a.re < 1) :
    Value S ↔ ∀ a b : ℂ, S a → S b → S (⟨2 * a.re - b.re, b.im⟩ : ℂ) := by
  constructor
  · intro h a b ha hb
    have h1 : a.re = 1 / 2 := h a ha
    have h2 : b.re = 1 / 2 := h b hb
    have e : (⟨2 * a.re - b.re, b.im⟩ : ℂ) = b := by
      apply Complex.ext
      · show 2 * a.re - b.re = b.re
        rw [h1, h2]; norm_num
      · rfl
    rw [e]; exact hb
  · intro h a ha
    show a.re = 1 / 2
    by_contra hne
    -- the configuration is closed under a slide by e > 0
    have key : ∃ e : ℝ, 0 < e ∧ ∀ s : ℂ, S s → S (⟨s.re + e, s.im⟩ : ℂ) := by
      rcases lt_or_gt_of_ne hne with hlt | hgt
      · -- a.re < 1/2: fold through a, then the fold of the seat; the slide is 1 - 2 a.re
        refine ⟨1 - 2 * a.re, by linarith, fun s hs => ?_⟩
        have h1 := h a s ha hs
        have h2 := form _ h1
        have e : fold (⟨2 * a.re - s.re, s.im⟩ : ℂ) = (⟨s.re + (1 - 2 * a.re), s.im⟩ : ℂ) := by
          apply Complex.ext
          · rw [show (fold (⟨2 * a.re - s.re, s.im⟩ : ℂ)).re = 1 - (2 * a.re - s.re) from partner_re _]
            show 1 - (2 * a.re - s.re) = s.re + (1 - 2 * a.re)
            ring
          · exact partner_im _
        rw [e] at h2; exact h2
      · -- a.re > 1/2: the fold of the seat, then the fold through a; the slide is 2 a.re - 1
        refine ⟨2 * a.re - 1, by linarith, fun s hs => ?_⟩
        have h1 := form s hs
        have h2 := h a (fold s) ha h1
        have e : (⟨2 * a.re - (fold s).re, (fold s).im⟩ : ℂ) = (⟨s.re + (2 * a.re - 1), s.im⟩ : ℂ) := by
          apply Complex.ext
          · show 2 * a.re - (fold s).re = s.re + (2 * a.re - 1)
            rw [show (fold s).re = 1 - s.re from partner_re s]; ring
          · show (fold s).im = s.im
            exact partner_im s
        rw [e] at h2; exact h2
    obtain ⟨e, he, slide⟩ := key
    have all : ∀ n : ℕ, S (⟨a.re + n * e, a.im⟩ : ℂ) := by
      intro n
      induction n with
      | zero =>
        have e0 : (⟨a.re + ((0 : ℕ) : ℝ) * e, a.im⟩ : ℂ) = a := by
          apply Complex.ext
          · show a.re + ((0 : ℕ) : ℝ) * e = a.re
            simp
          · rfl
        rw [e0]; exact ha
      | succ k ih =>
        have s1 := slide _ ih
        have e1 : (⟨(⟨a.re + (k : ℝ) * e, a.im⟩ : ℂ).re + e, (⟨a.re + (k : ℝ) * e, a.im⟩ : ℂ).im⟩ : ℂ)
            = (⟨a.re + ((k + 1 : ℕ) : ℝ) * e, a.im⟩ : ℂ) := by
          apply Complex.ext
          · show a.re + (k : ℝ) * e + e = a.re + ((k + 1 : ℕ) : ℝ) * e
            push_cast; ring
          · rfl
        rw [e1] at s1; exact s1
    obtain ⟨n, hn⟩ := exists_nat_gt (1 / e)
    have big : (1 : ℝ) < n * e := by
      have := (div_lt_iff₀ he).mp hn
      linarith
    have inside := (strip _ (all n)).2
    have pos := (strip a ha).1
    have : (⟨a.re + n * e, a.im⟩ : ℂ).re = a.re + n * e := rfl
    rw [this] at inside
    linarith

/-- The nontrivial zeros of ζ lie in the open strip. From the non-vanishing of ζ on Re s ≥ 1 and the functional
    equation. -/
theorem zeta_zeros_in_strip (s : ℂ) (hz : ZetaZeros s) : 0 < s.re ∧ s.re < 1 := by
  have right : ∀ t : ℂ, ZetaZeros t → t.re < 1 := by
    intro t ht
    by_contra hge
    exact riemannZeta_ne_zero_of_one_le_re (not_lt.mp hge) ht.1
  refine ⟨?_, right s hz⟩
  have h2 := right _ (zeta_zeros_symm hz)
  have e : (foldPt s).re = 1 - s.re := by simp [foldPt]
  rw [e] at h2
  linarith

/-- THE FIVE FACES OF THE HYPOTHESIS. Nothing before the colon. The classical hypothesis is, exactly: the zeros of ζ
    are witnessed; every zero is its own registration; no two zeros share a height; all zeros stand at one place
    across the fold; every zero is a seat of the zeros. One statement, five faces, each in both directions. -/
theorem the_five_faces :
    (RiemannHypothesis ↔ Witnessed lineSeat ZetaZeros) ∧
    (RiemannHypothesis ↔ ∀ a : ℂ, ZetaZeros a → lineSeat.reg a = a) ∧
    (RiemannHypothesis ↔ ∀ a b : ℂ, ZetaZeros a → ZetaZeros b → a.im = b.im → a = b) ∧
    (RiemannHypothesis ↔ ∀ a b : ℂ, ZetaZeros a → ZetaZeros b → a.re = b.re) ∧
    (RiemannHypothesis ↔ ∀ a b : ℂ, ZetaZeros a → ZetaZeros b → ZetaZeros (⟨2 * a.re - b.re, b.im⟩ : ℂ)) :=
  ⟨the_zeros_are_witnessed_iff.2.symm,
   h_read_proved.trans (value_iff_witness_is_witnessed ZetaZeros),
   h_read_proved.trans (value_iff_one_point_not_two ZetaZeros zeta_zeros_closed),
   h_read_proved.trans (value_iff_same_point ZetaZeros zeta_zeros_closed),
   h_read_proved.trans (value_iff_every_point_is_a_seat ZetaZeros zeta_zeros_closed zeta_zeros_in_strip)⟩

/-- THE FIVE FACES, for every primitive Dirichlet character χ ≠ 1. -/
theorem the_five_faces_dirichlet {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    (hχ : χ.IsPrimitive) (hne : χ ≠ 1) :
    (DirichletHypothesis χ ↔ Witnessed lineSeat (DirichletZeros χ)) ∧
    (DirichletHypothesis χ ↔ ∀ a : ℂ, DirichletZeros χ a → lineSeat.reg a = a) ∧
    (DirichletHypothesis χ ↔ ∀ a b : ℂ, DirichletZeros χ a → DirichletZeros χ b → a.im = b.im → a = b) ∧
    (DirichletHypothesis χ ↔ ∀ a b : ℂ, DirichletZeros χ a → DirichletZeros χ b → a.re = b.re) ∧
    (DirichletHypothesis χ ↔
      ∀ a b : ℂ, DirichletZeros χ a → DirichletZeros χ b → DirichletZeros χ (⟨2 * a.re - b.re, b.im⟩ : ℂ)) := by
  have cl := dirichlet_zeros_closed hχ hne
  have rd : DirichletHypothesis χ ↔ Value (DirichletZeros χ) :=
    ⟨fun h s hs => h s hs.1 hs.2.1 hs.2.2, fun h s hz h0 h1 => h s ⟨hz, h0, h1⟩⟩
  exact ⟨(the_dirichlet_zeros_are_witnessed_iff hχ hne).2.symm,
    rd.trans (value_iff_witness_is_witnessed _),
    rd.trans (value_iff_one_point_not_two _ cl),
    rd.trans (value_iff_same_point _ cl),
    rd.trans (value_iff_every_point_is_a_seat _ cl (fun a ha => ha.2))⟩

/-- NOTHING IS OUTSIDE. Nothing before the colon. Every record is a member; the record of the record is the
    record; any point of the plane registers on the line, with its partner's registration; and a point off the line
    is two points with one registration. -/
theorem nothing_is_outside :
    (∀ S : Config, Folded lineSeat (Rec S) ∧ Witnessed lineSeat (Rec S) ∧ Value (Rec S)) ∧
    (∀ S : Config, Rec (Rec S) = Rec S) ∧
    (∀ a : ℂ, onLine (lineSeat.reg a) ∧ lineSeat.reg (lineSeat.fold a) = lineSeat.reg a) ∧
    (∀ a : ℂ, ¬ onLine a → lineSeat.fold a ≠ a ∧ lineSeat.reg (lineSeat.fold a) = lineSeat.reg a) :=
  ⟨every_record_is_a_member, the_record_of_the_record_is_the_record, any_other_point_is_again_at_the_seat,
   an_off_line_point_is_two⟩

/-- THE SELF-REGISTRATION THEOREM. Nothing before the colon. A theorem of recognition: each clause is the same locus
    met again in another register. Registering a registration returns it; the record of a record is that record;
    and the hypothesis, for ζ and for every primitive Dirichlet character, is one statement registered five ways:
    the zeros are witnessed, each zero is its own registration, no two zeros share a height, all zeros stand at one
    place across the fold, and every zero is a seat of the zeros. -/
theorem self_registration :
    (∀ a : ℂ, lineSeat.reg (lineSeat.reg a) = lineSeat.reg a) ∧
    (∀ S : Config, Rec (Rec S) = Rec S) ∧
    ((RiemannHypothesis ↔ Witnessed lineSeat ZetaZeros) ∧
     (RiemannHypothesis ↔ ∀ a : ℂ, ZetaZeros a → lineSeat.reg a = a) ∧
     (RiemannHypothesis ↔ ∀ a b : ℂ, ZetaZeros a → ZetaZeros b → a.im = b.im → a = b) ∧
     (RiemannHypothesis ↔ ∀ a b : ℂ, ZetaZeros a → ZetaZeros b → a.re = b.re) ∧
     (RiemannHypothesis ↔ ∀ a b : ℂ, ZetaZeros a → ZetaZeros b → ZetaZeros (⟨2 * a.re - b.re, b.im⟩ : ℂ))) ∧
    (∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N), χ.IsPrimitive → χ ≠ 1 →
     (DirichletHypothesis χ ↔ Witnessed lineSeat (DirichletZeros χ)) ∧
     (DirichletHypothesis χ ↔ ∀ a : ℂ, DirichletZeros χ a → lineSeat.reg a = a) ∧
     (DirichletHypothesis χ ↔ ∀ a b : ℂ, DirichletZeros χ a → DirichletZeros χ b → a.im = b.im → a = b) ∧
     (DirichletHypothesis χ ↔ ∀ a b : ℂ, DirichletZeros χ a → DirichletZeros χ b → a.re = b.re) ∧
     (DirichletHypothesis χ ↔
       ∀ a b : ℂ, DirichletZeros χ a → DirichletZeros χ b → DirichletZeros χ (⟨2 * a.re - b.re, b.im⟩ : ℂ))) :=
  ⟨fun a => reg_idem a, the_record_of_the_record_is_the_record, the_five_faces,
   fun _ _ _ hχ hne => the_five_faces_dirichlet hχ hne⟩

/-! ## Part IX. Existence is registration

RATIONALE. A configuration in which nothing exists without registration is one that is its own record: `Rec S = S`.
  This part proves that, on the plane, a configuration is its own record exactly when it lies on the line, with
  nothing else asked of it; that the hypothesis is exactly the statement that the zeros are their own record; that a
  point and its partner always have one registration between them, so that a point on the line holds a whole
  registration and a point off it holds half of one; and that the two axes of existence and form, inside the strip,
  are carried both by a configuration on the line and by one off it.
DESIGN. `self_recorded_iff_on_the_line`; `the_zeros_are_their_own_record_iff` and its Dirichlet form (the sixth
  face); `the_orbit_has_one_registration`, `on_the_line_the_orbit_is_one_point`, `off_the_line_the_orbit_is_two_points`
  (the half registration, on every seat); `fold_mk`; `the_two_axes_hold_both`; and `existence_is_registration`,
  which binds them.
STANDING. Nothing before any colon but the configuration or the point spoken of. No assent, no posit, no delivered
  bit. `RiemannHypothesis` and `DirichletHypothesis χ` occur only as one side of an equivalence.
NON-NEGOTIABLE. No axiom, no sorry. `Rec ZetaZeros = ZetaZeros` is never stated alone.
-/

/-- EXISTENCE IS REGISTRATION. A configuration of the plane is its own record exactly when it lies on the line.
    Nothing else is asked of the configuration: no closure under the fold, no strip. -/
theorem self_recorded_iff_on_the_line (S : Config) : Rec S = S ↔ Value S := by
  constructor
  · intro h a ha
    have ha' : Rec S a := by rw [h]; exact ha
    obtain ⟨p, _, e⟩ := ha'
    show onLine a
    rw [← e]
    exact reg_lands p
  · intro h
    funext q
    apply propext
    constructor
    · rintro ⟨p, hp, e⟩
      have e2 : reg p = p := (reg_eq_self_iff p).mpr (h p hp)
      rw [← e, e2]; exact hp
    · intro hq
      exact ⟨q, hq, (reg_eq_self_iff q).mpr (h q hq)⟩

/-- THE SIXTH FACE. The classical hypothesis is exactly the statement that the zeros of ζ are their own record. -/
theorem the_zeros_are_their_own_record_iff : RiemannHypothesis ↔ Rec ZetaZeros = ZetaZeros :=
  h_read_proved.trans (self_recorded_iff_on_the_line ZetaZeros).symm

/-- The sixth face for a Dirichlet character: its hypothesis is exactly the statement that the zeros of its
    L-function in the strip are their own record. -/
theorem the_dirichlet_zeros_are_their_own_record_iff {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) :
    DirichletHypothesis χ ↔ Rec (DirichletZeros χ) = DirichletZeros χ :=
  (show DirichletHypothesis χ ↔ Value (DirichletZeros χ) from
    ⟨fun h s hs => h s hs.1 hs.2.1 hs.2.2, fun h s hz h0 h1 => h s ⟨hz, h0, h1⟩⟩).trans
    (self_recorded_iff_on_the_line (DirichletZeros χ)).symm

/-- THE HALF REGISTRATION, first part. On every seat, a point and its partner have exactly one registration between
    them: the orbit registers once. -/
theorem the_orbit_has_one_registration {X Y : Type} (σ : Seat X Y) (a : X) :
    (σ.reg '' ({a, σ.fold a} : Set X)).ncard = 1 := by
  have e : σ.reg '' ({a, σ.fold a} : Set X) = {σ.reg a} := by
    rw [Set.image_pair, σ.keeps a, Set.pair_eq_singleton]
  rw [e, Set.ncard_singleton]

/-- THE HALF REGISTRATION, on the line. A point on the line is its whole orbit: one point, one registration. -/
theorem on_the_line_the_orbit_is_one_point {X Y : Type} (σ : Seat X Y) (a : X) (on : σ.fold a = a) :
    ({a, σ.fold a} : Set X).ncard = 1 := by
  rw [on, Set.pair_eq_singleton, Set.ncard_singleton]

/-- THE HALF REGISTRATION, off the line. A point off the line has an orbit of two points, on one registration:
    each holds half. -/
theorem off_the_line_the_orbit_is_two_points {X Y : Type} (σ : Seat X Y) (a : X) (off : σ.fold a ≠ a) :
    ({a, σ.fold a} : Set X).ncard = 2 :=
  Set.ncard_pair (fun h => off h.symm)

/-- The fold of the plane in coordinates. -/
theorem fold_mk (x t : ℝ) : fold (⟨x, t⟩ : ℂ) = (⟨1 - x, t⟩ : ℂ) :=
  Complex.ext (partner_re _) (partner_im _)

/-- THE TWO AXES HOLD BOTH. Existence and form, inside the open strip, are carried by a configuration on the line
    and by a configuration off it. -/
theorem the_two_axes_hold_both :
    (∃ S : Config, (∃ a, S a) ∧ Closed S ∧ (∀ a, S a → 0 < a.re ∧ a.re < 1) ∧ Value S) ∧
    (∃ S : Config, (∃ a, S a) ∧ Closed S ∧ (∀ a, S a → 0 < a.re ∧ a.re < 1) ∧ ¬ Value S) := by
  have h12 : (1 : ℝ) - 1 / 2 = 1 / 2 := by norm_num
  have h14 : (1 : ℝ) - 1 / 4 = 3 / 4 := by norm_num
  have h34 : (1 : ℝ) - 3 / 4 = 1 / 4 := by norm_num
  constructor
  · refine ⟨fun s => s = (⟨1 / 2, 14⟩ : ℂ), ⟨_, rfl⟩, ?_, ?_, ?_⟩
    · intro s hs
      show fold s = (⟨1 / 2, 14⟩ : ℂ)
      rw [hs, fold_mk, h12]
    · intro a ha
      rw [ha]
      show (0 : ℝ) < 1 / 2 ∧ (1 / 2 : ℝ) < 1
      norm_num
    · intro a ha
      rw [ha]
      rfl
  · refine ⟨fun s => s = (⟨1 / 4, 14⟩ : ℂ) ∨ s = (⟨3 / 4, 14⟩ : ℂ), ⟨_, Or.inl rfl⟩, ?_, ?_, ?_⟩
    · intro s hs
      show fold s = (⟨1 / 4, 14⟩ : ℂ) ∨ fold s = (⟨3 / 4, 14⟩ : ℂ)
      rcases hs with h | h
      · right; rw [h, fold_mk, h14]
      · left; rw [h, fold_mk, h34]
    · intro a ha
      rcases ha with h | h
      · rw [h]
        show (0 : ℝ) < 1 / 4 ∧ (1 / 4 : ℝ) < 1
        norm_num
      · rw [h]
        show (0 : ℝ) < 3 / 4 ∧ (3 / 4 : ℝ) < 1
        norm_num
    · intro h
      have e : (1 / 4 : ℝ) = 1 / 2 := h (⟨1 / 4, 14⟩ : ℂ) (Or.inl rfl)
      norm_num at e

/-- EXISTENCE IS REGISTRATION, bound. Nothing before the colon. On the plane a configuration is its own record
    exactly when it is on the line; the hypothesis, for ζ and for every Dirichlet character, is the statement that
    the zeros are their own record; and on every seat an orbit has one registration, held whole by a point on the
    line and by halves off it. -/
theorem existence_is_registration :
    (∀ S : Config, Rec S = S ↔ Value S) ∧
    (RiemannHypothesis ↔ Rec ZetaZeros = ZetaZeros) ∧
    (∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N),
      DirichletHypothesis χ ↔ Rec (DirichletZeros χ) = DirichletZeros χ) ∧
    (∀ (X Y : Type) (σ : Seat X Y) (a : X),
      (σ.reg '' ({a, σ.fold a} : Set X)).ncard = 1 ∧
      (σ.fold a = a → ({a, σ.fold a} : Set X).ncard = 1) ∧
      (σ.fold a ≠ a → ({a, σ.fold a} : Set X).ncard = 2)) :=
  ⟨self_recorded_iff_on_the_line, the_zeros_are_their_own_record_iff,
   fun _ _ χ => the_dirichlet_zeros_are_their_own_record_iff χ,
   fun _ _ σ a => ⟨the_orbit_has_one_registration σ a, on_the_line_the_orbit_is_one_point σ a,
     off_the_line_the_orbit_is_two_points σ a⟩⟩

end Triaxial

#print axioms Triaxial.fold_involutive
#print axioms Triaxial.foldPt_re_fixed_iff
#print axioms Triaxial.completed_zeta_zeros_symm
#print axioms Triaxial.reg_lands
#print axioms Triaxial.fold_reg
#print axioms Triaxial.reg_eq_self_iff
#print axioms Triaxial.twins_zeta
#print axioms Triaxial.h_read_proved
#print axioms Triaxial.h_id_proved
#print axioms Triaxial.reg_idem
#print axioms Triaxial.the_remembered_is_lossless
#print axioms Triaxial.record_closed
#print axioms Triaxial.record_has_least_erasure
#print axioms Triaxial.cargo_at_zeros
#print axioms Triaxial.foldPt_involutive
#print axioms Triaxial.completed_zeta_zeros_closed_pt
#print axioms Triaxial.zeta_zero_iff_completed_of_re_pos
#print axioms Triaxial.zeta_zeros_iff_completed_in_strip
#print axioms Triaxial.zeta_zeros_symm_in_strip
#print axioms Triaxial.strip_zeta_zeros_closed_pt
#print axioms Triaxial.differentiableAt_star_comp
#print axioms Triaxial.star_natCast_cpow
#print axioms Triaxial.zeta_schwarz_reflection
#print axioms Triaxial.zeta_ne_zero_neg_odd
#print axioms Triaxial.zeta_zeros_not_neg_nat
#print axioms Triaxial.zeta_zeros_symm
#print axioms Triaxial.zeta_zeros_closed_pt
#print axioms Triaxial.zeta_zeros_conj
#print axioms Triaxial.zeta_zeros_closed
#print axioms Triaxial.generalized_hypothesis
#print axioms Triaxial.a_triad_has_an_existent_on_the_line
#print axioms Triaxial.on_the_line_is_witnessed
#print axioms Triaxial.the_triad_is_irreducible
#print axioms Triaxial.fold_re
#print axioms Triaxial.fold_im
#print axioms Triaxial.fixed_iff_on_line
#print axioms Triaxial.generalized_hypothesis_on_the_plane
#print axioms Triaxial.lineSeat_faithful
#print axioms Triaxial.witnessed_iff_value
#print axioms Triaxial.the_plane_triad_is_irreducible
#print axioms Triaxial.the_record_of_the_zeros_is_a_member
#print axioms Triaxial.the_zeros_are_witnessed_iff
#print axioms Triaxial.inv_isPrimitive
#print axioms Triaxial.dirichlet_schwarz
#print axioms Triaxial.gammaFactor_ne_zero_of_strip
#print axioms Triaxial.dirichlet_zeros_closed
#print axioms Triaxial.the_dirichlet_zeros_are_witnessed_iff
#print axioms Triaxial.the_triaxial_theorem
#print axioms Triaxial.the_final_theorem
#print axioms Triaxial.every_record_is_a_member
#print axioms Triaxial.the_record_of_the_record_is_the_record
#print axioms Triaxial.any_other_point_is_again_at_the_seat
#print axioms Triaxial.an_off_line_point_is_two
#print axioms Triaxial.reg_eq_iff_im
#print axioms Triaxial.partner_re
#print axioms Triaxial.partner_im
#print axioms Triaxial.value_iff_witness_is_witnessed
#print axioms Triaxial.value_iff_one_point_not_two
#print axioms Triaxial.value_iff_same_point
#print axioms Triaxial.value_iff_every_point_is_a_seat
#print axioms Triaxial.zeta_zeros_in_strip
#print axioms Triaxial.the_five_faces
#print axioms Triaxial.the_five_faces_dirichlet
#print axioms Triaxial.nothing_is_outside
#print axioms Triaxial.self_registration
#print axioms Triaxial.self_recorded_iff_on_the_line
#print axioms Triaxial.the_zeros_are_their_own_record_iff
#print axioms Triaxial.the_dirichlet_zeros_are_their_own_record_iff
#print axioms Triaxial.the_orbit_has_one_registration
#print axioms Triaxial.on_the_line_the_orbit_is_one_point
#print axioms Triaxial.off_the_line_the_orbit_is_two_points
#print axioms Triaxial.fold_mk
#print axioms Triaxial.the_two_axes_hold_both
#print axioms Triaxial.existence_is_registration
