/-
SPHYS_Horizon_CC.lean · The Horizon and the Fall. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. The Gravity paper derives the spherical vacuum solution, `f = 1 − 2m/r`, and its free fall. This file adds what
  a clock registers there. Part I: the chart of a falling body is the same geometry as the static chart and is regular
  at every radius above zero, the horizon included; the static chart fails at the horizon. Part II: the falling body
  moves at unit rate by its own clock, its radial velocity is the one the radial equation of the Schwarzschild kernel
  gives for a fall from rest far away, and its own clock registers a finite time from any radius to the horizon,
  through it, and down to any radius above zero, under one bound. Part III: the surface gravity, the first law as
  an exact identity, and the cap on what a merger radiates. Part IV: what an outside clock registers: its rate along
  a ray is one over the function of the solution, and the time it registers for a ray grows past every bound as the
  start of the ray approaches the horizon from outside.
  Part V: the geometry of imaginary time near the horizon is a plane, and the period that closes it is two pi over the
  surface gravity; with the temperature the reciprocal of that period the entropy is a quarter of the area and the mass
  is twice the temperature times the entropy; the ring of light at three times the mass and the shadow at the square
  root of twenty-seven times the mass. That a temperature is the reciprocal of a period of imaginary time is not proved
  here: it is the one hypothesis Part V leaves.
DESIGN. Everything is stated on the real numbers with `m` the mass and `r` the areal radius, in units where the
  constants are one. The two charts are compared as quadratic forms in the time and radius steps; the angular part
  is the same in both and is left out.
RISK. The file does not derive the curvature tensor of the solution. That the falling body's path is free fall is
  taken from the radial equation of the Schwarzschild kernel, which is matched here and not derived again. Part III
  takes two things as given and prints them as hypotheses: that the temperature of a horizon is its surface gravity
  over two pi, and that the area of horizons does not decrease in a merger. Neither is a theorem of this file.
  Parts II and IV are two registrations of two paths: the clock that falls registers a finite time, and no clock
  outside registers the crossing. Neither statement is about the other clock.
NON-NEGOTIABLE. No axiom is declared. No proof is left open. Every hypothesis stands in the statement that uses it.
SUMMARY RULE. The sentences of this header, and the comment printed above each theorem, are summaries. Each theorem
  states its own conditions in its statement, and where a summary and a statement differ the statement governs.
BOUNDARY. The values are the real numbers, which the library builds with the axiom of choice. Every kernel line of
  this file prints it; it enters with the numbers.
-/
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Analysis.SpecialFunctions.Log.Deriv
import Mathlib.Analysis.Calculus.Deriv.Inv
import Mathlib.Analysis.Calculus.Deriv.Add
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Tactic.Ring
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.LinearCombination

namespace SPHYS.Horizon

open Real

/-- The function of the vacuum solution. -/
noncomputable def f (m r : ℝ) : ℝ := 1 - 2 * m / r

/-- The static chart, in the steps of time and radius. -/
noncomputable def staticForm (m r dt dr : ℝ) : ℝ := -(f m r) * dt ^ 2 + dr ^ 2 / f m r

/-- The chart of a falling body, in the steps of its time and of the radius. -/
noncomputable def fallingForm (m r dT dr : ℝ) : ℝ := -(f m r) * dT ^ 2 + 2 * √(2 * m / r) * dT * dr + dr ^ 2

/-! ## Part I. Two charts of one geometry. -/

/-- The square of the fall's rate is what the function of the solution lacks from one. -/
theorem the_square_of_the_rate (m r : ℝ) (hm : 0 < m) (hr : 0 < r) : √(2 * m / r) ^ 2 = 1 - f m r := by
  rw [Real.sq_sqrt (by positivity)]; unfold f; ring

/-- THE FALLING CHART IS THE SAME GEOMETRY. Where the function of the solution is not zero, the falling chart, read with
its time step shifted along the radius, is the static chart. -/
theorem the_falling_chart_is_the_same_geometry (m r : ℝ) (hm : 0 < m) (hr : 0 < r) (hf : f m r ≠ 0) (dt dr : ℝ) :
    fallingForm m r (dt + √(2 * m / r) / f m r * dr) dr = staticForm m r dt dr := by
  have hb := the_square_of_the_rate m r hm hr
  unfold fallingForm staticForm
  generalize √(2 * m / r) = b at hb ⊢
  generalize f m r = F at hb hf ⊢
  have hF : F = 1 - b ^ 2 := by linarith
  subst hF
  field_simp
  ring

/-- THE FALLING CHART IS REGULAR AT EVERY RADIUS ABOVE ZERO, the horizon included: the determinant of its time and
radius part is minus one. -/
theorem the_falling_chart_is_regular_at_every_radius (m r : ℝ) (hm : 0 < m) (hr : 0 < r) :
    -(f m r) * 1 - √(2 * m / r) * √(2 * m / r) = -1 := by
  have hb := the_square_of_the_rate m r hm hr
  nlinarith [hb]

/-- THE STATIC CHART FAILS AT THE HORIZON: its function is zero there. -/
theorem the_static_chart_fails_at_the_horizon (m : ℝ) (hm : m ≠ 0) : f m (2 * m) = 0 := by
  unfold f; field_simp

/-! ## Part II. What the clock of a falling body registers. -/

/-- THE FALLING BODY MOVES AT UNIT RATE BY ITS OWN CLOCK. One step of its time with the radius falling at the rate of the
fall has length minus one in the falling chart: the time of that chart is the time its clock registers. -/
theorem the_falling_body_moves_at_unit_rate (m r : ℝ) (hm : 0 < m) (hr : 0 < r) :
    fallingForm m r 1 (-√(2 * m / r)) = -1 := by
  have hb := the_square_of_the_rate m r hm hr
  unfold fallingForm
  nlinarith [hb]

/-- THE RATE OF THE FALL IS THE ONE THE RADIAL EQUATION GIVES for energy one and no angular momentum: the square of the
radial velocity is one less the function of the solution. -/
theorem the_rate_of_the_fall_obeys_the_radial_equation (m r : ℝ) (hm : 0 < m) (hr : 0 < r) :
    (-√(2 * m / r)) ^ 2 = 1 ^ 2 - f m r := by
  rw [neg_sq, the_square_of_the_rate m r hm hr]; ring

/-- The reading of the falling body's clock at the radius `r`, up to a constant. -/
noncomputable def clock (m r : ℝ) : ℝ := -(2 / 3) * (r * √r) / √(2 * m)

/-- THE CLOCK OF THE FALL AGAINST THE RADIUS. The reading has derivative minus the root of `r` over the root of `2m`. -/
theorem the_clock_of_the_fall_against_the_radius (m r : ℝ) (hr : 0 < r) :
    HasDerivAt (clock m) (-(√r / √(2 * m))) r := by
  have hs : √r ≠ 0 := (Real.sqrt_pos.mpr hr).ne'
  have a := (hasDerivAt_id r).mul ((hasDerivAt_id r).sqrt hr.ne')
  have e : (1 : ℝ) * √(id r) + id r * (1 / (2 * √(id r))) = 3 / 2 * √r := by
    simp only [id]
    have h2 : √r * √r = r := Real.mul_self_sqrt hr.le
    field_simp
    nlinarith [h2]
  rw [e] at a
  have b := (a.const_mul (-(2 / 3 : ℝ))).div_const (√(2 * m))
  have e2 : -(2 / 3 : ℝ) * (3 / 2 * √r) / √(2 * m) = -(√r / √(2 * m)) := by ring
  rw [e2] at b
  exact b

/-- THE CLOCK AND THE FALL AGREE: the rate of the clock against the radius times the rate of the fall is one. -/
theorem the_clock_and_the_fall_agree (m r : ℝ) (hm : 0 < m) (hr : 0 < r) :
    -(√r / √(2 * m)) * (-√(2 * m / r)) = 1 := by
  have h1 : √(2 * m / r) = √(2 * m) / √r := Real.sqrt_div (by positivity) r
  have hs : √r ≠ 0 := (Real.sqrt_pos.mpr hr).ne'
  have hm2 : √(2 * m) ≠ 0 := (Real.sqrt_pos.mpr (by positivity)).ne'
  rw [h1]; field_simp

/-- THE FALLING BODY REGISTERS A FINITE TIME. From a radius `r₀` down to any radius `r` between zero and `r₀`, the time its
own clock registers is at least zero and at most two thirds of `r₀` times its root over the root of `2m`. The
bound does not depend on `r`: it holds at the horizon, below it, and as near the centre as one likes. -/
theorem the_falling_body_registers_a_finite_time (m r₀ r : ℝ) (hm : 0 < m) (h0 : 0 ≤ r) (h1 : r ≤ r₀) :
    0 ≤ clock m r - clock m r₀ ∧ clock m r - clock m r₀ ≤ 2 / 3 * (r₀ * √r₀) / √(2 * m) := by
  have hpos : 0 < √(2 * m) := Real.sqrt_pos.mpr (by positivity)
  have hmono : r * √r ≤ r₀ * √r₀ :=
    mul_le_mul h1 (Real.sqrt_le_sqrt h1) (Real.sqrt_nonneg r) (h0.trans h1)
  have hnn : 0 ≤ r * √r := mul_nonneg h0 (Real.sqrt_nonneg r)
  have e : clock m r - clock m r₀ = 2 / 3 * (r₀ * √r₀ - r * √r) / √(2 * m) := by unfold clock; ring
  rw [e]
  constructor
  · exact div_nonneg (by nlinarith) hpos.le
  · exact div_le_div_of_nonneg_right (by nlinarith) hpos.le

/-! ## Part III. The surface gravity, the first law, and the merger. -/

/-- THE SLOPE OF THE FUNCTION OF THE SOLUTION is `2m / r²`. -/
theorem the_slope_of_the_function (m r : ℝ) (hr : r ≠ 0) : HasDerivAt (f m) (2 * m / r ^ 2) r := by
  have a := ((hasDerivAt_id r).inv hr).const_mul (2 * m)
  have b : HasDerivAt (fun x => (1 : ℝ) - 2 * m * (id x)⁻¹) ((0 : ℝ) - 2 * m * (-(1 : ℝ) / id r ^ 2)) r :=
    HasDerivAt.sub (hasDerivAt_const r (1 : ℝ)) a
  have e : (0 : ℝ) - 2 * m * (-(1 : ℝ) / id r ^ 2) = 2 * m / r ^ 2 := by simp only [id]; field_simp
  rw [e] at b
  have g : f m = fun x => (1 : ℝ) - 2 * m * (id x)⁻¹ := by funext x; unfold f; simp only [id]; ring
  rw [g]; exact b

/-- THE SURFACE GRAVITY OF THE HORIZON is half the slope there: one over four times the mass. -/
theorem the_surface_gravity_of_the_horizon (m : ℝ) (hm : m ≠ 0) : 2 * m / (2 * m) ^ 2 / 2 = 1 / (4 * m) := by
  field_simp; ring

/-- THE AREA OF THE HORIZON is sixteen pi times the square of the mass. -/
theorem the_area_of_the_horizon (m : ℝ) : 4 * π * (2 * m) ^ 2 = 16 * π * m ^ 2 := by ring

/-- THE FIRST LAW, EXACT. Take the entropy as a quarter of the area of the horizon, `4π m²`, and the temperature as the
surface gravity over two pi, `1 / (8π m)`. Then the entropy has derivative `8π m` in the mass, and the temperature
times that derivative is one: a step of mass is the temperature times the step of entropy. That the surface gravity
over two pi is a temperature is the hypothesis of this theorem's reading and is not derived here. -/
theorem the_first_law_exact (m : ℝ) (hm : m ≠ 0) :
    HasDerivAt (fun M : ℝ => 4 * π * M ^ 2) (8 * π * m) m ∧ 1 / (8 * π * m) * (8 * π * m) = 1 := by
  constructor
  · have a := ((hasDerivAt_id m).pow 2).const_mul (4 * π)
    have e : 4 * π * (((2 : ℕ) : ℝ) * id m ^ (2 - 1) * 1) = 8 * π * m := by simp only [id]; push_cast; ring
    rw [e] at a; exact a
  · have hp : π ≠ 0 := Real.pi_ne_zero
    field_simp

/-- THE CAP ON WHAT A MERGER RADIATES. Let two holes of masses `m₁`, `m₂` merge into one of mass `M`, with the area of the
final horizon at least the sum of the two: `M² ≥ m₁² + m₂²`. Then the energy radiated, `m₁ + m₂ − M`, is at most
`1 − 1/√2` of the total. That the area does not decrease is the hypothesis. -/
theorem the_cap_on_what_a_merger_radiates (m₁ m₂ M : ℝ) (hM : 0 ≤ M)
    (area : m₁ ^ 2 + m₂ ^ 2 ≤ M ^ 2) : m₁ + m₂ - M ≤ (1 - 1 / √2) * (m₁ + m₂) := by
  have hs2 : 0 < √2 := Real.sqrt_pos.mpr (by norm_num)
  have hsq : √2 * √2 = 2 := Real.mul_self_sqrt (by norm_num)
  have key : (m₁ + m₂) / √2 ≤ M := by
    rw [div_le_iff₀ hs2]
    nlinarith [sq_nonneg (m₁ - m₂), sq_nonneg (M * √2 - (m₁ + m₂)), mul_nonneg hM hs2.le]
  have e : (1 - 1 / √2) * (m₁ + m₂) = (m₁ + m₂) - (m₁ + m₂) / √2 := by ring
  rw [e]; linarith

/-- THE CAP IS UNDER THREE TENTHS. -/
theorem the_cap_is_under_three_tenths : 1 - 1 / √2 < 3 / 10 := by
  have hs2 : 0 < √2 := Real.sqrt_pos.mpr (by norm_num)
  have hsq : √2 * √2 = 2 := Real.mul_self_sqrt (by norm_num)
  have h : √2 < 10 / 7 := by nlinarith
  have : 7 / 10 < 1 / √2 := by rw [lt_div_iff₀ hs2]; nlinarith
  linarith

/-! ## Part IV. What an outside clock registers. -/

/-- THE RATE OF THE OUTSIDE CLOCK ALONG A RAY. For a mass `m` and a radius `r` outside `2m`, the function
`r + 2m log (r − 2m)` has derivative `r / (r − 2m)`, which is one over `1 − 2m/r`: the time an outside clock
registers for light to cover a step of radius. -/
theorem the_rate_of_the_outside_clock_along_a_ray (m r : ℝ) (h : 2 * m < r) :
    HasDerivAt (fun x : ℝ => x + 2 * m * Real.log (x - 2 * m)) (r / (r - 2 * m)) r := by
  have hne : r - 2 * m ≠ 0 := by linarith
  have a := (hasDerivAt_id r).add ((((hasDerivAt_id r).sub_const (2 * m)).log hne).const_mul (2 * m))
  have e : (1 : ℝ) + 2 * m * (1 / (id r - 2 * m)) = r / (r - 2 * m) := by
    simp only [id]; field_simp
  rw [e] at a; exact a

/-- THE OUTSIDE CLOCK NEVER REGISTERS THE CROSSING. For a positive mass, the time registered outside for a ray between a
radius `r` and a fixed radius grows past every bound as `r` approaches `2m` from outside: below any number `−B`
the function `r + 2m log (r − 2m)` falls, for all `r` near enough. No signal from the horizon, or from within it,
is registered outside at any finite time. -/
theorem the_outside_clock_never_registers_the_crossing (m : ℝ) (hm : 0 < m) (B : ℝ) :
    ∃ δ > 0, ∀ r, 2 * m < r → r < 2 * m + δ → r + 2 * m * Real.log (r - 2 * m) < -B := by
  refine ⟨min 1 (Real.exp ((-B - 2 * m - 1) / (2 * m))), lt_min one_pos (Real.exp_pos _), fun r h1 h2 => ?_⟩
  have hx : 0 < r - 2 * m := by linarith
  have k1 := min_le_left 1 (Real.exp ((-B - 2 * m - 1) / (2 * m)))
  have k2 := min_le_right 1 (Real.exp ((-B - 2 * m - 1) / (2 * m)))
  have hx2 : r - 2 * m < Real.exp ((-B - 2 * m - 1) / (2 * m)) := by linarith
  have hl : Real.log (r - 2 * m) < (-B - 2 * m - 1) / (2 * m) := (Real.log_lt_iff_lt_exp hx).mpr hx2
  have h2m : 0 < 2 * m := by linarith
  have t : 2 * m * Real.log (r - 2 * m) < 2 * m * ((-B - 2 * m - 1) / (2 * m)) := mul_lt_mul_of_pos_left hl h2m
  have e : 2 * m * ((-B - 2 * m - 1) / (2 * m)) = -B - 2 * m - 1 := by field_simp
  linarith

/-- THE RATE OF THE OUTSIDE CLOCK IS ONE OVER THE FUNCTION. Outside the horizon of a positive mass, `r / (r − 2m)` is
one over `1 − 2m/r`: the outside clock's rate along a ray is the reciprocal of the function of the solution, and it
has no value where that function is zero. -/
theorem the_rate_of_the_outside_clock_is_one_over_the_function (m r : ℝ) (hm : 0 < m) (h : 2 * m < r) :
    r / (r - 2 * m) = 1 / f m r := by
  have hr : r ≠ 0 := by linarith
  have hne : r - 2 * m ≠ 0 := by linarith
  unfold f; field_simp

/-! ## Part V. The period of the horizon, the entropy, and the numbers of the solution. -/

/-- NEAR THE HORIZON THE GEOMETRY OF IMAGINARY TIME IS A PLANE. Take the function of the solution to first order at the
horizon, `(r − 2m) / (2m)`, and put `r − 2m = ρ² / (8m)`. Then the function is `(ρ / 4m)²`, and the square of the rate
of `r` in `ρ`, which is `(ρ / 4m)²`, divided by the function is one. So the part of the metric in time and radius, with
the sign of time turned, is `dρ² + ρ² d(τ / 4m)²`: a plane in polar form, with `τ / 4m` its angle. -/
theorem near_the_horizon_the_geometry_of_imaginary_time_is_a_plane (m ρ : ℝ) (hm : m ≠ 0) (hρ : ρ ≠ 0) :
    ρ ^ 2 / (8 * m) / (2 * m) = (ρ / (4 * m)) ^ 2 ∧ (ρ / (4 * m)) ^ 2 / (ρ ^ 2 / (8 * m) / (2 * m)) = 1 := by
  constructor
  · field_simp; ring
  · field_simp; ring

/-- THE PERIOD THAT CLOSES THE PLANE. The angle `τ / 4m` goes once round when `τ` runs through `8π m`, which is two pi
over the surface gravity. -/
theorem the_period_that_closes_the_plane (m : ℝ) (hm : m ≠ 0) :
    2 * π / (1 / (4 * m)) = 8 * π * m ∧ 8 * π * m / (4 * m) = 2 * π := by
  constructor
  · field_simp; ring
  · field_simp; ring

/-- THE RECIPROCAL OF THE PERIOD IS THE SURFACE GRAVITY OVER TWO PI. -/
theorem the_reciprocal_of_the_period_is_the_surface_gravity_over_two_pi (m : ℝ) (hm : m ≠ 0) :
    1 / (8 * π * m) = 1 / (4 * m) / (2 * π) := by
  have : π ≠ 0 := Real.pi_ne_zero
  field_simp; ring

/-- THE ENTROPY IS A QUARTER OF THE AREA. With the temperature the reciprocal of the period, the first law gives the
entropy the derivative `8π m` in the mass; `4π m²` has that derivative, by the first law above, and it is a quarter of
the area of the horizon. -/
theorem the_entropy_is_a_quarter_of_the_area (m : ℝ) : 4 * π * m ^ 2 = 16 * π * m ^ 2 / 4 := by ring

/-- THE MASS IS TWICE THE TEMPERATURE TIMES THE ENTROPY. -/
theorem the_mass_is_twice_the_temperature_times_the_entropy (m : ℝ) (hm : m ≠ 0) :
    2 * (1 / (8 * π * m)) * (4 * π * m ^ 2) = m := by
  have : π ≠ 0 := Real.pi_ne_zero
  field_simp; ring

/-- THE RING OF LIGHT. The function of the solution over the square of the radius has derivative `2 (3m − r) / r⁴`. It
is zero at `r = 3m` and nowhere else: the one radius at which light can circle. -/
theorem the_ring_of_light (m r : ℝ) (hr : r ≠ 0) :
    HasDerivAt (fun x => f m x / x ^ 2) (2 * (3 * m - r) / r ^ 4) r
      ∧ (2 * (3 * m - r) / r ^ 4 = 0 ↔ r = 3 * m) := by
  constructor
  · have a := (the_slope_of_the_function m r hr).div (hasDerivAt_pow 2 r) (pow_ne_zero 2 hr)
    convert a using 1
    unfold f; push_cast; field_simp; ring
  · rw [div_eq_zero_iff]
    constructor
    · rintro (h | h)
      · linarith
      · exact absurd h (pow_ne_zero 4 hr)
    · intro h; left; rw [h]; ring

/-- THE SHADOW. At the ring of light the square of the radius over the function is `27 m²`: a ray passes the mass or
falls to it as its distance of approach from far away is above or below `3√3 m`. -/
theorem the_shadow_of_the_solution (m : ℝ) (hm : m ≠ 0) : (3 * m) ^ 2 / f m (3 * m) = 27 * m ^ 2 := by
  have h : f m (3 * m) = 1 / 3 := by unfold f; field_simp; ring
  rw [h]; ring

end SPHYS.Horizon

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.Horizon.the_square_of_the_rate' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Horizon.the_square_of_the_rate
/--
info: 'SPHYS.Horizon.the_falling_chart_is_the_same_geometry' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_falling_chart_is_the_same_geometry
/--
info: 'SPHYS.Horizon.the_falling_chart_is_regular_at_every_radius' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_falling_chart_is_regular_at_every_radius
/--
info: 'SPHYS.Horizon.the_static_chart_fails_at_the_horizon' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_static_chart_fails_at_the_horizon
/--
info: 'SPHYS.Horizon.the_falling_body_moves_at_unit_rate' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_falling_body_moves_at_unit_rate
/--
info: 'SPHYS.Horizon.the_rate_of_the_fall_obeys_the_radial_equation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_rate_of_the_fall_obeys_the_radial_equation
/--
info: 'SPHYS.Horizon.the_clock_of_the_fall_against_the_radius' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_clock_of_the_fall_against_the_radius
/-- info: 'SPHYS.Horizon.the_clock_and_the_fall_agree' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Horizon.the_clock_and_the_fall_agree
/--
info: 'SPHYS.Horizon.the_falling_body_registers_a_finite_time' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_falling_body_registers_a_finite_time
/-- info: 'SPHYS.Horizon.the_slope_of_the_function' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Horizon.the_slope_of_the_function
/--
info: 'SPHYS.Horizon.the_surface_gravity_of_the_horizon' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_surface_gravity_of_the_horizon
/-- info: 'SPHYS.Horizon.the_area_of_the_horizon' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Horizon.the_area_of_the_horizon
/-- info: 'SPHYS.Horizon.the_first_law_exact' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Horizon.the_first_law_exact
/--
info: 'SPHYS.Horizon.the_cap_on_what_a_merger_radiates' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_cap_on_what_a_merger_radiates
/-- info: 'SPHYS.Horizon.the_cap_is_under_three_tenths' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Horizon.the_cap_is_under_three_tenths
/--
info: 'SPHYS.Horizon.the_rate_of_the_outside_clock_along_a_ray' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_rate_of_the_outside_clock_along_a_ray
/--
info: 'SPHYS.Horizon.the_outside_clock_never_registers_the_crossing' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_outside_clock_never_registers_the_crossing
/--
info: 'SPHYS.Horizon.the_rate_of_the_outside_clock_is_one_over_the_function' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_rate_of_the_outside_clock_is_one_over_the_function
/--
info: 'SPHYS.Horizon.near_the_horizon_the_geometry_of_imaginary_time_is_a_plane' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.near_the_horizon_the_geometry_of_imaginary_time_is_a_plane
/-- info: 'SPHYS.Horizon.the_period_that_closes_the_plane' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Horizon.the_period_that_closes_the_plane
/--
info: 'SPHYS.Horizon.the_reciprocal_of_the_period_is_the_surface_gravity_over_two_pi' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_reciprocal_of_the_period_is_the_surface_gravity_over_two_pi
/--
info: 'SPHYS.Horizon.the_entropy_is_a_quarter_of_the_area' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_entropy_is_a_quarter_of_the_area
/--
info: 'SPHYS.Horizon.the_mass_is_twice_the_temperature_times_the_entropy' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_mass_is_twice_the_temperature_times_the_entropy
/-- info: 'SPHYS.Horizon.the_ring_of_light' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Horizon.the_ring_of_light
/-- info: 'SPHYS.Horizon.the_shadow_of_the_solution' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Horizon.the_shadow_of_the_solution
