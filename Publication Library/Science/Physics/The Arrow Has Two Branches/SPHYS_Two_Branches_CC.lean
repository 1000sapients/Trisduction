/-
SPHYS_Two_Branches_CC.lean · the priced branch and the reversible branch of one arrow, on real analysis
RATIONALE. The engine of edition 1.4.0 entered the cost of each branch by hand (one and zero) and compared the two
  numbers. This file replaces it. The priced branch is the energy of a single magnetic domain, a function of an
  angle and a field, and its wells are found. The reversible branch is motion under a force that has a potential,
  in any real inner product space, and its energy is differentiated. The difference between the branches is then a
  theorem about maps: a step of a flow is a bijection and the switching of the domain is not.
DESIGN. Parts, in order.
    Part I    The energy of the domain, field along the axis. `energy_hasDerivAt`, `slope_hasDerivAt`.
              `aligned_is_a_minimum`, `aligned_is_a_maximum`, `both_wells_exactly_inside`.
              `the_field_does_not_fix_the_state`. `the_drop_at_switching`.
    Part II   The field at an angle. `energy2_hasDerivAt`, `slope2_hasDerivAt`, `the_switching_curve`,
              `only_the_switching_curve`, `the_switching_curve_is_an_astroid`. The field across the axis:
              `across_the_axis_the_two_wells_have_one_energy`, `at_the_cusp_the_wells_meet`.
    Part III  The record of the domain. `step`, `a_strong_field_erases`, `no_map_undoes_the_reset`,
              `a_switch_costs_at_least_two`, `a_cycle_costs_at_least_four`.
    Part IV   Motion under a potential. `energy_is_constant`, `the_reversed_path_is_a_motion`,
              `the_reversed_path_has_the_same_energy`, `a_closed_path_does_no_work`.
              `the_area_rate_is_constant`. `newton_potential`.
    Part V    The two branches as maps. `Flow`, `a_step_of_a_flow_is_a_bijection`,
              `the_reset_is_no_step_of_a_flow`. `the_magnetic_force_does_no_work`.
    Part VI   `Premises`; `two_branches`; `fallPremises`.
WHAT IS NOT PROVED HERE (read before citing).
    (a) That a magnet is one domain with one axis, and that it stays in its well while the well exists. The first is
        the model of Stoner and Wohlfarth; the second is a field of `Premises`.
    (b) That gravity has a potential. It is a field of `Premises`. The inverse-square law is not derived.
    (c) The bound of Landauer and every number in joules. They are cited and computed in the twin.
RISK. Part I takes the field along the axis; Part II gives the curve for any angle but not the loop. Temperature
  is zero throughout: no thermal switching. The heat of Part III is the heat of the field along the axis and is
  not a floor: across the axis the two wells meet with no energy released (Part II). What holds for every path
  of the field is the statement about maps of Part V.
NON-NEGOTIABLE. No axiom is declared, no sorry. No cost is entered by hand: every energy is a value of `energy`.
  No headline theorem closes over a structure that carries its conclusion. The kernel line of every theorem the
  paper names is printed at the end.
-/
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Deriv
import Mathlib.Analysis.InnerProductSpace.Calculus
import Mathlib.Analysis.Calculus.MeanValue
import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus
import Mathlib.LinearAlgebra.CrossProduct
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Convert

namespace SPHYS.Arrow
open Real Matrix

/-! ## Part I. The energy of the domain, field along the axis -/

/-- Energy of one domain in units of twice the anisotropy energy: `θ` is the angle of the moment from the axis,
`h` the field along the axis in units of the anisotropy field. -/
noncomputable def energy (h θ : ℝ) : ℝ := sin θ ^ 2 / 2 - h * cos θ
/-- Its slope in the angle. -/
noncomputable def slope (h θ : ℝ) : ℝ := sin θ * cos θ + h * sin θ
/-- Its stiffness: the slope of the slope. -/
noncomputable def stiffness (h θ : ℝ) : ℝ := cos θ ^ 2 - sin θ ^ 2 + h * cos θ

theorem energy_hasDerivAt (h θ : ℝ) : HasDerivAt (energy h) (slope h θ) θ := by
  have h1 := ((hasDerivAt_sin θ).pow 2).div_const 2
  have h2 := (hasDerivAt_cos θ).const_mul h
  have := h1.sub h2
  convert this using 1
  unfold slope; ring

theorem slope_hasDerivAt (h θ : ℝ) : HasDerivAt (slope h) (stiffness h θ) θ := by
  have h1 := (hasDerivAt_sin θ).mul (hasDerivAt_cos θ)
  have h2 := (hasDerivAt_sin θ).const_mul h
  have := h1.add h2
  convert this using 1
  unfold stiffness; ring

/-- The two states along the axis are stationary at every field. -/
theorem the_axis_is_stationary (h : ℝ) : slope h 0 = 0 ∧ slope h π = 0 := by simp [slope]

theorem stiffness_on_the_axis (h : ℝ) : stiffness h 0 = 1 + h ∧ stiffness h π = 1 - h := by
  refine ⟨by simp [stiffness], ?_⟩
  simp [stiffness]; ring

/-- The energy above the aligned state, factored. -/
theorem energy_above_aligned (h θ : ℝ) :
    energy h θ - energy h 0 = (1 - cos θ) * ((1 + cos θ) / 2 + h) := by
  have := sin_sq_add_cos_sq θ
  simp only [energy, sin_zero, cos_zero]; nlinarith

theorem energy_above_reversed (h θ : ℝ) :
    energy h θ - energy h π = (1 + cos θ) * ((1 - cos θ) / 2 - h) := by
  have := sin_sq_add_cos_sq θ
  simp only [energy, sin_pi, cos_pi]; nlinarith

/-- With the field above minus one, the aligned state is a minimum over every angle near it:
every angle whose cosine exceeds `-1 - 2h`. With the field at zero or above, that is every angle. -/
theorem aligned_is_a_minimum {h θ : ℝ} (hc : -1 - 2 * h ≤ cos θ) : energy h 0 ≤ energy h θ := by
  have h1 := energy_above_aligned h θ
  have h2 : 0 ≤ 1 - cos θ := by linarith [cos_le_one θ]
  have h3 : 0 ≤ (1 + cos θ) / 2 + h := by linarith
  nlinarith [mul_nonneg h2 h3]

/-- With the field below minus one, the aligned state is the maximum over every angle: its well is gone. -/
theorem aligned_is_a_maximum {h : ℝ} (hh : h ≤ -1) (θ : ℝ) : energy h θ ≤ energy h 0 := by
  have h1 := energy_above_aligned h θ
  have h2 : 0 ≤ 1 - cos θ := by linarith [cos_le_one θ]
  have h3 : (1 + cos θ) / 2 + h ≤ 0 := by linarith [cos_le_one θ]
  nlinarith [mul_nonneg h2 (neg_nonneg.mpr h3)]

theorem reversed_is_a_minimum {h θ : ℝ} (hc : cos θ ≤ 1 - 2 * h) : energy h π ≤ energy h θ := by
  have h1 := energy_above_reversed h θ
  have h2 : 0 ≤ 1 + cos θ := by linarith [neg_one_le_cos θ]
  have h3 : 0 ≤ (1 - cos θ) / 2 - h := by linarith
  nlinarith [mul_nonneg h2 h3]

theorem reversed_is_a_maximum {h : ℝ} (hh : 1 ≤ h) (θ : ℝ) : energy h θ ≤ energy h π := by
  have h1 := energy_above_reversed h θ
  have h2 : 0 ≤ 1 + cos θ := by linarith [neg_one_le_cos θ]
  have h3 : (1 - cos θ) / 2 - h ≤ 0 := by linarith [neg_one_le_cos θ]
  nlinarith [mul_nonneg h2 (neg_nonneg.mpr h3)]

/-- A well: a stationary state with positive stiffness. -/
def Well (h θ : ℝ) : Prop := slope h θ = 0 ∧ 0 < stiffness h θ

/-- Both states along the axis are wells exactly when the field lies strictly between minus one and one. -/
theorem both_wells_exactly_inside (h : ℝ) : (Well h 0 ∧ Well h π) ↔ -1 < h ∧ h < 1 := by
  obtain ⟨s0, sp⟩ := the_axis_is_stationary h
  obtain ⟨k0, kp⟩ := stiffness_on_the_axis h
  unfold Well; rw [s0, sp, k0, kp]
  constructor
  · rintro ⟨⟨-, a⟩, -, b⟩; constructor <;> linarith
  · rintro ⟨a, b⟩; exact ⟨⟨rfl, by linarith⟩, rfl, by linarith⟩

/-- Inside, one field carries two wells with opposite moments: the field does not fix the state. -/
theorem the_field_does_not_fix_the_state {h : ℝ} (h1 : -1 < h) (h2 : h < 1) :
    Well h 0 ∧ Well h π ∧ cos 0 ≠ cos π := by
  obtain ⟨a, b⟩ := (both_wells_exactly_inside h).mpr ⟨h1, h2⟩
  exact ⟨a, b, by simp; norm_num⟩

/-- The energy that the reversed state stands above the aligned one is twice the field. At the field one,
where the reversed well ends, it is two. -/
theorem the_drop_at_switching (h : ℝ) : energy h π - energy h 0 = 2 * h := by
  simp [energy]; ring

/-! ## Part II. The field at an angle -/

/-- Energy with a field of components `hx` along the axis and `hy` across it. -/
noncomputable def energy2 (hx hy θ : ℝ) : ℝ := sin θ ^ 2 / 2 - hx * cos θ - hy * sin θ
noncomputable def slope2 (hx hy θ : ℝ) : ℝ := sin θ * cos θ + hx * sin θ - hy * cos θ
noncomputable def stiffness2 (hx hy θ : ℝ) : ℝ := cos θ ^ 2 - sin θ ^ 2 + hx * cos θ + hy * sin θ

theorem energy2_hasDerivAt (hx hy θ : ℝ) : HasDerivAt (energy2 hx hy) (slope2 hx hy θ) θ := by
  have h1 := ((hasDerivAt_sin θ).pow 2).div_const 2
  have h2 := (hasDerivAt_cos θ).const_mul hx
  have h3 := (hasDerivAt_sin θ).const_mul hy
  have := (h1.sub h2).sub h3
  convert this using 1
  unfold slope2; ring

theorem slope2_hasDerivAt (hx hy θ : ℝ) : HasDerivAt (slope2 hx hy) (stiffness2 hx hy θ) θ := by
  have h1 := (hasDerivAt_sin θ).mul (hasDerivAt_cos θ)
  have h2 := (hasDerivAt_sin θ).const_mul hx
  have h3 := (hasDerivAt_cos θ).const_mul hy
  have := (h1.add h2).sub h3
  convert this using 1
  unfold stiffness2; ring

/-- The switching curve. At the field `(-cos³ θ, sin³ θ)` the state at angle `θ` is stationary and has lost its
stiffness: a well ends there. -/
theorem the_switching_curve (θ : ℝ) :
    slope2 (-cos θ ^ 3) (sin θ ^ 3) θ = 0 ∧ stiffness2 (-cos θ ^ 3) (sin θ ^ 3) θ = 0 := by
  have h := sin_sq_add_cos_sq θ
  constructor
  · unfold slope2
    have : sin θ * cos θ + -cos θ ^ 3 * sin θ - sin θ ^ 3 * cos θ
        = sin θ * cos θ * (1 - (sin θ ^ 2 + cos θ ^ 2)) := by ring
    rw [this, h]; ring
  · unfold stiffness2
    have : cos θ ^ 2 - sin θ ^ 2 + -cos θ ^ 3 * cos θ + sin θ ^ 3 * sin θ
        = (cos θ ^ 2 - sin θ ^ 2) * (1 - (sin θ ^ 2 + cos θ ^ 2)) := by ring
    rw [this, h]; ring

/-- Conversely, a field at which the state at `θ` is stationary without stiffness is that field. -/
theorem only_the_switching_curve {hx hy θ : ℝ} (h1 : slope2 hx hy θ = 0) (h2 : stiffness2 hx hy θ = 0) :
    hx = -cos θ ^ 3 ∧ hy = sin θ ^ 3 := by
  have h := sin_sq_add_cos_sq θ
  unfold slope2 at h1; unfold stiffness2 at h2
  constructor
  · -- hx = hx (s² + c²) = s (hx s) + c (hx c)
    have e1 : hx = sin θ * (hx * sin θ - hy * cos θ) + cos θ * (hx * cos θ + hy * sin θ) := by
      have : sin θ * (hx * sin θ - hy * cos θ) + cos θ * (hx * cos θ + hy * sin θ)
          = hx * (sin θ ^ 2 + cos θ ^ 2) := by ring
      rw [this, h, mul_one]
    have a : hx * sin θ - hy * cos θ = -(sin θ * cos θ) := by linarith
    have b : hx * cos θ + hy * sin θ = -(cos θ ^ 2 - sin θ ^ 2) := by linarith
    rw [e1, a, b]; ring
  · have e1 : hy = sin θ * (hx * cos θ + hy * sin θ) - cos θ * (hx * sin θ - hy * cos θ) := by
      have : sin θ * (hx * cos θ + hy * sin θ) - cos θ * (hx * sin θ - hy * cos θ)
          = hy * (sin θ ^ 2 + cos θ ^ 2) := by ring
      rw [this, h, mul_one]
    have a : hx * sin θ - hy * cos θ = -(sin θ * cos θ) := by linarith
    have b : hx * cos θ + hy * sin θ = -(cos θ ^ 2 - sin θ ^ 2) := by linarith
    rw [e1, a, b]; ring

/-- The curve is an astroid: the squares of the components, as cubes of `cos² θ` and `sin² θ`, have
cube roots that sum to one. -/
theorem the_switching_curve_is_an_astroid (θ : ℝ) :
    (-cos θ ^ 3) ^ 2 = (cos θ ^ 2) ^ 3 ∧ (sin θ ^ 3) ^ 2 = (sin θ ^ 2) ^ 3 ∧ cos θ ^ 2 + sin θ ^ 2 = 1 := by
  refine ⟨by ring, by ring, ?_⟩
  linarith [sin_sq_add_cos_sq θ]

/-- With the field across the axis, the energy is a square in the sine of the angle. -/
theorem across_the_axis (hy θ : ℝ) : energy2 0 hy θ = (sin θ - hy) ^ 2 / 2 - hy ^ 2 / 2 := by
  unfold energy2; ring

/-- Across the axis the two wells have one energy: the angle and its mirror in the axis across. -/
theorem across_the_axis_the_two_wells_have_one_energy (hy θ : ℝ) :
    energy2 0 hy (π - θ) = energy2 0 hy θ := by
  simp [energy2, sin_pi_sub]

/-- Across the axis, an angle whose sine is the field is a minimum over every angle. -/
theorem across_the_axis_minimum {hy θ : ℝ} (h : sin θ = hy) (φ : ℝ) : energy2 0 hy θ ≤ energy2 0 hy φ := by
  rw [across_the_axis, across_the_axis, h]
  nlinarith [sq_nonneg (sin φ - hy)]

/-- At the field one across the axis the two wells meet: the moment has no part along the axis, and the angle
and its mirror carry one moment. No energy is released there. -/
theorem at_the_cusp_the_wells_meet {θ : ℝ} (h : sin θ = 1) : cos θ = 0 ∧ cos (π - θ) = cos θ := by
  have h2 := sin_sq_add_cos_sq θ
  have c : cos θ = 0 := by
    have : cos θ ^ 2 = 0 := by rw [h] at h2; linarith
    exact pow_eq_zero_iff (two_ne_zero) |>.mp this
  exact ⟨c, by rw [cos_pi_sub, c, neg_zero]⟩

/-! ## Part III. The record of the domain -/

/-- One step of the record: the state `true` is the aligned well, `false` the reversed one. A well that the
field has ended is left; a well that stands is kept. -/
noncomputable def step (h : ℝ) (s : Bool) : Bool := if 1 ≤ h then true else if h ≤ -1 then false else s

theorem a_weak_field_keeps {h : ℝ} (h1 : -1 < h) (h2 : h < 1) (s : Bool) : step h s = s := by
  unfold step; rw [if_neg (not_le.mpr h2), if_neg (not_le.mpr h1)]

/-- A strong field sends both states to one: the bit is erased. -/
theorem a_strong_field_erases {h : ℝ} (hh : 1 ≤ h) : step h true = step h false := by
  unfold step; rw [if_pos hh, if_pos hh]

/-- No map undoes the reset. -/
theorem no_map_undoes_the_reset {h : ℝ} (hh : 1 ≤ h) : ¬ ∃ g : Bool → Bool, ∀ s, g (step h s) = s := by
  rintro ⟨g, hg⟩
  have a := hg true; have b := hg false
  rw [a_strong_field_erases hh] at a
  exact absurd (a.symm.trans b) (by decide)

/-- The energy released at a step: the energy of the state left minus that of the state reached, at the field
of the step. The energies are values of `energy`. -/
noncomputable def angle (s : Bool) : ℝ := if s then 0 else π
noncomputable def released (h : ℝ) (s : Bool) : ℝ := energy h (angle s) - energy h (angle (step h s))

theorem released_nonneg (h : ℝ) (s : Bool) : 0 ≤ released h s := by
  unfold released step
  by_cases h1 : 1 ≤ h
  · rw [if_pos h1]; cases s
    · have := the_drop_at_switching h; simp only [angle, Bool.false_eq_true, if_false, if_true]; linarith
    · simp [angle]
  · rw [if_neg h1]
    by_cases h2 : h ≤ -1
    · rw [if_pos h2]; cases s
      · simp [angle]
      · have := the_drop_at_switching h; simp only [angle, Bool.false_eq_true, if_false, if_true]; linarith
    · rw [if_neg h2]; simp

/-- A step that changes the state releases at least two units. -/
theorem a_switch_costs_at_least_two {h : ℝ} {s : Bool} (hs : step h s ≠ s) : 2 ≤ released h s := by
  unfold released
  unfold step at hs ⊢
  by_cases h1 : 1 ≤ h
  · rw [if_pos h1] at hs ⊢; cases s
    · have := the_drop_at_switching h; simp only [angle, Bool.false_eq_true, if_false, if_true]; linarith
    · exact absurd rfl hs
  · rw [if_neg h1] at hs ⊢
    by_cases h2 : h ≤ -1
    · rw [if_pos h2] at hs ⊢; cases s
      · exact absurd rfl hs
      · have := the_drop_at_switching h; simp only [angle, Bool.false_eq_true, if_false, if_true]; linarith
    · rw [if_neg h2] at hs; exact absurd rfl hs

/-- The record after a history of fields, and the energy released along it. -/
noncomputable def run (h : ℕ → ℝ) (s0 : Bool) : ℕ → Bool
  | 0 => s0
  | n + 1 => step (h n) (run h s0 n)
noncomputable def heat (h : ℕ → ℝ) (s0 : Bool) : ℕ → ℝ
  | 0 => 0
  | n + 1 => heat h s0 n + released (h n) (run h s0 n)

theorem heat_monotone (h : ℕ → ℝ) (s0 : Bool) (n : ℕ) : heat h s0 n ≤ heat h s0 (n + 1) := by
  show heat h s0 n ≤ heat h s0 n + released (h n) (run h s0 n)
  linarith [released_nonneg (h n) (run h s0 n)]

/-- A cycle: two steps that change the state, one after the other. It releases at least four units. -/
theorem a_cycle_costs_at_least_four (h : ℕ → ℝ) (s0 : Bool) (n : ℕ)
    (c1 : run h s0 (n + 1) ≠ run h s0 n) (c2 : run h s0 (n + 2) ≠ run h s0 (n + 1)) :
    heat h s0 n + 4 ≤ heat h s0 (n + 2) := by
  have a := a_switch_costs_at_least_two (h := h n) (s := run h s0 n) c1
  have b := a_switch_costs_at_least_two (h := h (n + 1)) (s := run h s0 (n + 1)) c2
  show heat h s0 n + 4 ≤ heat h s0 n + released (h n) (run h s0 n) + released (h (n + 1)) (run h s0 (n + 1))
  linarith

/-! ## Part IV. Motion under a potential -/

section Motion
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- A motion under the potential `V` with gradient `g`: position `x`, velocity `v`, and the law that the rate of
the velocity is minus the gradient at the position. The gradient is asked for only along the path. -/
structure Motion (V : E → ℝ) (g : E → E) (x v : ℝ → E) : Prop where
  pos : ∀ t, HasDerivAt x (v t) t
  law : ∀ t, HasDerivAt v (-g (x t)) t
  grad : ∀ t, HasFDerivAt V (innerSL ℝ (g (x t))) (x t)

/-- The energy of a motion: half the square of the speed plus the potential. -/
noncomputable def mech (V : E → ℝ) (x v : ℝ → E) (t : ℝ) : ℝ := ‖v t‖ ^ 2 / 2 + V (x t)

theorem mech_hasDerivAt {V : E → ℝ} {g : E → E} {x v : ℝ → E} (m : Motion V g x v) (t : ℝ) :
    HasDerivAt (mech V x v) 0 t := by
  have h1 : HasDerivAt (fun s => ‖v s‖ ^ 2) (2 * inner (v t) (-g (x t)) : ℝ) t := by
    have := (m.law t).norm_sq
    simpa using this
  have h2 : HasDerivAt (fun s => V (x s)) (inner (g (x t)) (v t) : ℝ) t := by
    have := (m.grad t).comp_hasDerivAt t (m.pos t)
    simpa using this
  have := (h1.div_const 2).add h2
  convert this using 1
  rw [inner_neg_right, real_inner_comm (g (x t)) (v t)]; ring

/-- The energy of a motion is the same at every time. -/
theorem energy_is_constant {V : E → ℝ} {g : E → E} {x v : ℝ → E} (m : Motion V g x v) (s t : ℝ) :
    mech V x v s = mech V x v t :=
  is_const_of_deriv_eq_zero (fun u => (mech_hasDerivAt m u).differentiableAt)
    (fun u => (mech_hasDerivAt m u).deriv) s t

/-- The path run backwards, with the velocity turned, is a motion under the same potential. -/
theorem the_reversed_path_is_a_motion {V : E → ℝ} {g : E → E} {x v : ℝ → E} (m : Motion V g x v) :
    Motion V g (fun t => x (-t)) (fun t => -v (-t)) where
  pos t := by
    have := (m.pos (-t)).scomp t (hasDerivAt_neg t)
    simpa using this
  law t := by
    have := ((m.law (-t)).scomp t (hasDerivAt_neg t)).neg
    simpa using this
  grad t := m.grad (-t)

omit [InnerProductSpace ℝ E] in
theorem the_reversed_path_has_the_same_energy (V : E → ℝ) (x v : ℝ → E) (t : ℝ) :
    mech V (fun t => x (-t)) (fun t => -v (-t)) t = mech V x v (-t) := by
  simp [mech]

/-- Around a closed path the force does no work: the integral of the gradient against the velocity is the
difference of the potential at the ends, and the ends are one point. -/
theorem a_closed_path_does_no_work {V : E → ℝ} {g : E → E} {x v : ℝ → E} {a b : ℝ}
    (pos : ∀ t, HasDerivAt x (v t) t) (grad : ∀ t, HasFDerivAt V (innerSL ℝ (g (x t))) (x t))
    (hi : IntervalIntegrable (fun t => (inner (g (x t)) (v t) : ℝ)) MeasureTheory.volume a b)
    (closed : x a = x b) : ∫ t in a..b, (inner (g (x t)) (v t) : ℝ) = 0 := by
  have h2 : ∀ t ∈ Set.uIcc a b, HasDerivAt (fun s => V (x s)) (inner (g (x t)) (v t) : ℝ) t := by
    intro t _
    have := (grad t).comp_hasDerivAt t (pos t)
    simpa using this
  rw [intervalIntegral.integral_eq_sub_of_hasDerivAt h2 hi, closed, sub_self]

end Motion

/-- In a plane, under a force along the line to the centre, the area swept in unit time is constant. -/
theorem the_area_rate_is_constant {x y u w f : ℝ → ℝ}
    (hx : ∀ t, HasDerivAt x (u t) t) (hy : ∀ t, HasDerivAt y (w t) t)
    (hu : ∀ t, HasDerivAt u (-(f t * x t)) t) (hw : ∀ t, HasDerivAt w (-(f t * y t)) t) (s t : ℝ) :
    x s * w s - y s * u s = x t * w t - y t * u t := by
  have d : ∀ r, HasDerivAt (fun r => x r * w r - y r * u r) 0 r := by
    intro r
    have := ((hx r).mul (hw r)).sub ((hy r).mul (hu r))
    convert this using 1; ring
  exact is_const_of_deriv_eq_zero (fun r => (d r).differentiableAt) (fun r => (d r).deriv) s t

/-- The potential of Newton along a ray: the slope of `-k / r` is `k / r²`. -/
theorem newton_potential (k : ℝ) {r : ℝ} (hr : r ≠ 0) : HasDerivAt (fun r => -k / r) (k / r ^ 2) r := by
  have := (hasDerivAt_inv hr).const_mul (-k)
  convert this using 1
  rw [div_eq_mul_inv]; ring

/-! ## Part V. The two branches as maps -/

/-- A flow on a set of states: a step for every time, the step of no time doing nothing, steps composing. -/
structure Flow (S : Type*) where
  φ : ℝ → S → S
  zero : ∀ s, φ 0 s = s
  add : ∀ a b s, φ (a + b) s = φ a (φ b s)

/-- Every step of a flow is a bijection: it is undone by the step of the opposite time. -/
theorem a_step_of_a_flow_is_a_bijection {S : Type*} (F : Flow S) (t : ℝ) : Function.Bijective (F.φ t) := by
  have l : ∀ s, F.φ (-t) (F.φ t s) = s := fun s => by rw [← F.add, neg_add_cancel, F.zero]
  have r : ∀ s, F.φ t (F.φ (-t) s) = s := fun s => by rw [← F.add, add_neg_cancel, F.zero]
  exact ⟨Function.LeftInverse.injective l, Function.RightInverse.surjective r⟩

/-- The reset of the record is a step of no flow. -/
theorem the_reset_is_no_step_of_a_flow {h : ℝ} (hh : 1 ≤ h) (F : Flow Bool) (t : ℝ) : F.φ t ≠ step h := by
  intro e
  have inj := (a_step_of_a_flow_is_a_bijection F t).1
  rw [e] at inj
  exact absurd (inj (a_strong_field_erases hh)) (by decide)

/-- The magnetic force on a moving charge is across its velocity: it does no work. -/
theorem the_magnetic_force_does_no_work (v B : Fin 3 → ℝ) : v ⬝ᵥ (v ×₃ B) = 0 :=
  dot_self_cross v B

/-! ## Part VI. The premises -/

/-- The physical premises of the paper. -/
structure Premises (E : Type) [NormedAddCommGroup E] [InnerProductSpace ℝ E] where
  /-- the history of the field on the domain, and the state it starts in -/
  field : ℕ → ℝ
  start : Bool
  /-- the record of the domain: it keeps its well while the well stands and leaves it when the field ends it -/
  record : ℕ → Bool
  wells : ∀ n, record n = run field start n
  /-- gravity has a potential, and the body moves by it -/
  V : E → ℝ
  g : E → E
  x : ℝ → E
  v : ℝ → E
  moves : Motion V g x v

variable {E : Type} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- On the premises: the energy of the body is constant and its path reversed is a motion; the heat of the
domain never decreases, every change of the record releases at least two units, and a strong field erases. -/
theorem two_branches (P : Premises E) :
    (∀ s t, mech P.V P.x P.v s = mech P.V P.x P.v t) ∧
    Motion P.V P.g (fun t => P.x (-t)) (fun t => -P.v (-t)) ∧
    (∀ n, heat P.field P.start n ≤ heat P.field P.start (n + 1)) ∧
    (∀ n, P.record (n + 1) ≠ P.record n → heat P.field P.start n + 2 ≤ heat P.field P.start (n + 1)) ∧
    (∀ n, 1 ≤ P.field n → P.record (n + 1) = true) := by
  refine ⟨energy_is_constant P.moves, the_reversed_path_is_a_motion P.moves, heat_monotone _ _, ?_, ?_⟩
  · intro n hn
    rw [P.wells, P.wells] at hn
    have := a_switch_costs_at_least_two (h := P.field n) (s := run P.field P.start n) hn
    show heat P.field P.start n + 2 ≤ heat P.field P.start n + released (P.field n) (run P.field P.start n)
    linarith
  · intro n hn
    rw [P.wells]
    show step (P.field n) (run P.field P.start n) = true
    unfold step; rw [if_pos hn]

/-- The premises are met: a body falling in a uniform field `c`, and a domain driven round a loop. -/
noncomputable def fallPremises (c : E) : Premises E where
  field := fun n => if n % 2 = 0 then 2 else -2
  start := false
  record := run (fun n => if n % 2 = 0 then 2 else -2) false
  wells := fun _ => rfl
  V := fun y => inner c y
  g := fun _ => c
  x := fun t => -(t ^ 2 / 2) • c
  v := fun t => -t • c
  moves :=
    { pos := fun t => by
        have h : HasDerivAt (fun s : ℝ => -(s ^ 2 / 2)) (-t) t := by
          have := ((hasDerivAt_id t).pow 2).div_const 2 |>.neg
          convert this using 1; simp
        simpa using h.smul_const c
      law := fun t => by
        have h : HasDerivAt (fun s : ℝ => -s) (-1) t := (hasDerivAt_id t).neg
        simpa using h.smul_const c
      grad := fun t => (innerSL ℝ c).hasFDerivAt }

/-- The member is not idle: its record changes at the first step and its heat rises by at least two. -/
theorem the_member_pays (c : E) :
    (fallPremises c).record 1 ≠ (fallPremises c).record 0 ∧
    heat (fallPremises c).field (fallPremises c).start 0 + 2 ≤ heat (fallPremises c).field (fallPremises c).start 1 := by
  have h : (fallPremises c).record 1 ≠ (fallPremises c).record 0 := by
    show step (if 0 % 2 = 0 then (2 : ℝ) else -2) false ≠ false
    unfold step; norm_num
  exact ⟨h, (two_branches (fallPremises c)).2.2.2.1 0 h⟩

end SPHYS.Arrow

#print axioms SPHYS.Arrow.energy_hasDerivAt
#print axioms SPHYS.Arrow.slope_hasDerivAt
#print axioms SPHYS.Arrow.the_axis_is_stationary
#print axioms SPHYS.Arrow.stiffness_on_the_axis
#print axioms SPHYS.Arrow.energy_above_aligned
#print axioms SPHYS.Arrow.energy_above_reversed
#print axioms SPHYS.Arrow.aligned_is_a_minimum
#print axioms SPHYS.Arrow.aligned_is_a_maximum
#print axioms SPHYS.Arrow.reversed_is_a_minimum
#print axioms SPHYS.Arrow.reversed_is_a_maximum
#print axioms SPHYS.Arrow.both_wells_exactly_inside
#print axioms SPHYS.Arrow.the_field_does_not_fix_the_state
#print axioms SPHYS.Arrow.the_drop_at_switching
#print axioms SPHYS.Arrow.energy2_hasDerivAt
#print axioms SPHYS.Arrow.slope2_hasDerivAt
#print axioms SPHYS.Arrow.the_switching_curve
#print axioms SPHYS.Arrow.only_the_switching_curve
#print axioms SPHYS.Arrow.the_switching_curve_is_an_astroid
#print axioms SPHYS.Arrow.across_the_axis
#print axioms SPHYS.Arrow.across_the_axis_the_two_wells_have_one_energy
#print axioms SPHYS.Arrow.across_the_axis_minimum
#print axioms SPHYS.Arrow.at_the_cusp_the_wells_meet
#print axioms SPHYS.Arrow.a_weak_field_keeps
#print axioms SPHYS.Arrow.a_strong_field_erases
#print axioms SPHYS.Arrow.no_map_undoes_the_reset
#print axioms SPHYS.Arrow.released_nonneg
#print axioms SPHYS.Arrow.a_switch_costs_at_least_two
#print axioms SPHYS.Arrow.heat_monotone
#print axioms SPHYS.Arrow.a_cycle_costs_at_least_four
#print axioms SPHYS.Arrow.mech_hasDerivAt
#print axioms SPHYS.Arrow.energy_is_constant
#print axioms SPHYS.Arrow.the_reversed_path_is_a_motion
#print axioms SPHYS.Arrow.the_reversed_path_has_the_same_energy
#print axioms SPHYS.Arrow.a_closed_path_does_no_work
#print axioms SPHYS.Arrow.the_area_rate_is_constant
#print axioms SPHYS.Arrow.newton_potential
#print axioms SPHYS.Arrow.a_step_of_a_flow_is_a_bijection
#print axioms SPHYS.Arrow.the_reset_is_no_step_of_a_flow
#print axioms SPHYS.Arrow.the_magnetic_force_does_no_work
#print axioms SPHYS.Arrow.two_branches
#print axioms SPHYS.Arrow.fallPremises
#print axioms SPHYS.Arrow.the_member_pays
