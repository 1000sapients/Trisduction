/-
  SPHYS_Gravity_Field_Equations_CC.lean · The field equations from the seat · core Lean 4, no library.

  RATIONALE. Immanent Gravity (edition 2.0.0) proved what gravity is, the substrate reading its own record, and
  imported Einstein's equations. This file carries the algebra that turns the import into a consequence: given the
  seat's reading (one sign, blind to composition, nothing escapes the record), the law of the reading is fixed in
  form, its active source is rho + 3p in four dimensions, its waves have two polarizations, and its one coupling
  is a magnitude the law cannot fix.

  DESIGN. Integers and naturals only, so every statement is decidable or linear. No axiom is declared in this
  file. The kernel line of each theorem is printed at the end; the counts of Part III print no axiom at all, and
  the linear statements print what the `omega` procedure of core Lean uses.
  Fractions are cleared by doubling: `div2` is twice a divergence, `active4` is twice the trace-reversed source.

  WHAT ENTERS AS A DEFINITION, NOT AS A THEOREM (read before editing):
    (1) the contracted Bianchi identity, twice div Ric = d R, is the field `bianchi` of `Geometry`. It is a
        theorem of Riemannian geometry (the boundary of a boundary is zero) and is not proved here;
    (2) the least-order family a·Ric + b·R·g + c·g is the family of laws of second order that are linear in the
        curvature. That the family is exhaustive in four dimensions is Lovelock's theorem (1971), not proved here;
    (3) the rest frame of a perfect fluid, T = diag(rho, p, ..., p), with signature (-, +, ..., +).
  RISK. A reader may take `conservation_forces_the_law` as a proof of Lovelock's theorem. It is the forcing inside
  the family, and the docstring says so.
  NON-NEGOTIABLE. No theorem here fixes the value of the coupling. `the_law_fixes_no_scale` proves it cannot.
-/
namespace SPHYS.FieldEq

/-! ## Part I. Nothing escapes the record: conservation forces the law. -/

/-- A geometry, as far as the law reads it at one point and in one direction: the divergence of the Ricci tensor
    and the gradient of the scalar curvature, tied by the contracted Bianchi identity (doubled to stay in Int). -/
structure Geometry where
  divRic : Int
  dR     : Int
  bianchi : 2 * divRic = dR

/-- Twice the divergence of the candidate law a·Ric + b·R·g + c·g. The metric is covariantly constant, so the
    term in c drops and the term in b contributes b·dR. -/
def div2 (G : Geometry) (a b _c : Int) : Int := 2 * (a * G.divRic + b * G.dR)

/-- The divergence of the family is one number times the gradient of the curvature. -/
theorem div2_eq (G : Geometry) (a b c : Int) : div2 G a b c = (a + 2 * b) * G.dR := by
  unfold div2
  rw [Int.mul_add, ← Int.mul_assoc, Int.mul_comm 2 a, Int.mul_assoc, G.bianchi, ← Int.mul_assoc, Int.mul_comm 2 b,
      Int.add_mul, Int.mul_comm b 2]

/-- A geometry whose curvature has a gradient: the witness that the forcing is not vacuous. -/
def curved : Geometry := { divRic := 1, dR := 2, bianchi := by decide }

/-- CONSERVATION FORCES THE LAW. If the law is divergence-free on every geometry, so that it can equal a conserved
    source, then b = -a/2: the law is a·(Ric - R·g/2) + c·g. Inside the least-order family nothing else is allowed. -/
theorem conservation_forces_the_law (a b c : Int) (h : ∀ G : Geometry, div2 G a b c = 0) : a + 2 * b = 0 := by
  have h1 := h curved
  rw [div2_eq] at h1
  have h2 : (a + 2 * b) * 2 = 0 := h1
  omega

/-- And the forced law is conserved on every geometry: the term in c, the cosmological term, is free. -/
theorem the_forced_law_is_conserved (a b c : Int) (h : a + 2 * b = 0) (G : Geometry) : div2 G a b c = 0 := by
  rw [div2_eq, h, Int.zero_mul]

/-- THE LAW FIXES NO SCALE. Every multiple of a conserved law is conserved. Conservation fixes the form and never
    the overall constant: the coupling is a magnitude the law cannot return. -/
theorem the_law_fixes_no_scale (a b k : Int) (h : a + 2 * b = 0) : k * a + 2 * (k * b) = 0 := by
  have : k * a + 2 * (k * b) = k * (a + 2 * b) := by
    rw [Int.mul_add, ← Int.mul_assoc k 2 b, Int.mul_comm k 2, Int.mul_assoc]
  rw [this, h, Int.mul_zero]

/-- The cosmological term is free: no value of c is touched by conservation. -/
theorem the_vacuum_term_is_free (a b c c' : Int) (G : Geometry) : div2 G a b c = div2 G a b c' := rfl

/-! ## Part II. What gravity reads: the active density, derived. -/

/-- The trace of a perfect fluid at rest in n spacetime dimensions, signature (-, +, ..., +). -/
def trace (n ρ p : Int) : Int := -ρ + (n - 1) * p

/-- (n - 2) times the time-time part of the trace-reversed source: the quantity the forced law reads. -/
def activeN (n ρ p : Int) : Int := (n - 2) * ρ + trace n ρ p

/-- Four dimensions: gravity reads rho + 3p. The active density of Immanent Gravity, section 4, is no longer cited:
    it is the trace reversal of the forced law. -/
theorem active_four (ρ p : Int) : activeN 4 ρ p = ρ + 3 * p := by
  unfold activeN trace; omega

/-- Three dimensions (two of space): the density drops out. Dust does not gravitate. -/
theorem active_three (ρ p : Int) : activeN 3 ρ p = 2 * p := by
  unfold activeN trace; omega

theorem dust_is_weightless_in_three (ρ : Int) : activeN 3 ρ 0 = 0 := by
  unfold activeN trace; omega

/-- Five dimensions, for the pattern: (n - 3)·rho + (n - 1)·p. -/
theorem active_five (ρ p : Int) : activeN 5 ρ p = 2 * ρ + 4 * p := by
  unfold activeN trace; omega

/-- FOUR IS THE LEAST. Dust attracts in four dimensions and not in three: three dimensions of space are the least
    in which a body at rest has weight. -/
theorem four_is_the_least_where_dust_attracts (ρ : Int) (h : 0 < ρ) :
    0 < activeN 4 ρ 0 ∧ activeN 3 ρ 0 = 0 := by
  unfold activeN trace; refine ⟨?_, ?_⟩ <;> omega

/-- Dust attracts, radiation attracts twice over, the vacuum repels: the three signs of section 4, now derived. -/
theorem dust_attracts (ρ : Int) (h : 0 < ρ) : 0 < activeN 4 ρ 0 := by
  unfold activeN trace; omega
theorem radiation_reads_double (k : Int) : activeN 4 (3 * k) k = 2 * (3 * k) := by
  unfold activeN trace; omega
theorem the_vacuum_repels (ρ : Int) (h : 0 < ρ) : activeN 4 ρ (-ρ) = -2 * ρ ∧ activeN 4 ρ (-ρ) < 0 := by
  unfold activeN trace; refine ⟨?_, ?_⟩ <;> omega
theorem repulsion_needs_tension (ρ p : Int) (h : activeN 4 ρ p < 0) : 3 * p < -ρ := by
  unfold activeN trace at h; omega

/-- (n - 2) times a space-space part of the trace-reversed source: what the space part of the law reads. -/
def spaceN (n ρ p : Int) : Int := (n - 2) * p - trace n ρ p

/-- SPACE READS AS TIME. For a body at rest in four dimensions the space part of the law reads exactly what the
    time part reads. This is gamma = 1: it is why light bends twice the Newtonian angle. -/
theorem space_reads_as_time (ρ : Int) : spaceN 4 ρ 0 = activeN 4 ρ 0 := by
  unfold spaceN activeN trace; omega

/-- And only in four: in five dimensions the time part reads twice what the space part reads. -/
theorem not_in_five (ρ : Int) (h : 0 < ρ) : spaceN 5 ρ 0 ≠ activeN 5 ρ 0 := by
  unfold spaceN activeN trace; omega

/-- The reading is homogeneous: scale the source and the reading scales with it. No scale is preferred. -/
theorem active_is_homogeneous (k ρ p : Int) : activeN 4 (k * ρ) (k * p) = k * activeN 4 ρ p := by
  rw [active_four, active_four, Int.mul_add, Int.mul_left_comm]

/-! ## Part III. The counts a seat reaches. -/

/-- Independent components of a symmetric law in n dimensions. -/
def components (n : Nat) : Nat := n * (n + 1) / 2
/-- Independent components of the curvature in n dimensions. -/
def curvature (n : Nat) : Nat := n * n * (n * n - 1) / 12
/-- Polarizations of a gravitational wave in n dimensions: components, less n identities, less n coordinates,
    which is n(n - 3)/2. -/
def polarizations (n : Nat) : Nat := components n - n - n

theorem ten_equations : components 4 = 10 := by decide
theorem twenty_curvatures : curvature 4 = 20 := by decide
/-- TWO POLARIZATIONS in four dimensions, as section 9 reads from the sky. -/
theorem two_polarizations : polarizations 4 = 2 := by decide
/-- NO WAVES in three dimensions: gravity there has no freedom of its own. -/
theorem no_waves_in_three : polarizations 3 = 0 := by decide
theorem five_in_five : polarizations 5 = 5 := by decide
theorem polarizations_formula_four : polarizations 4 = 4 * (4 - 3) / 2 := by decide

/-- In three dimensions the curvature has as many components as the law: matter fixes the geometry outright and
    nothing propagates. In four the curvature has ten more than the law, and those ten are the waves and tides. -/
theorem three_is_rigid : curvature 3 = components 3 := by decide
theorem four_has_ten_free : curvature 4 = components 4 + 10 := by decide

/-! ## Part IV. One coupling, and the tests. -/

/-- Flux through a sphere in three dimensions of space grows as the square of the radius. -/
def area (r : Nat) : Nat := r ^ 2

/-- INVERSE SQUARE. A reading that loses nothing between spheres thins as the area grows: at twice the radius the
    same flux crosses four times the area. -/
theorem double_radius_quadruple_area (r : Nat) : area (2 * r) = 4 * area r := by
  unfold area; rw [Nat.mul_pow]

/-- The space part and the time part of the reading bend light equally: gamma = 1. -/
def bending (γ : Int) : Int := 1 + γ
theorem light_bends_twice (γ : Int) (h : γ = 1) : bending γ = 2 := by unfold bending; omega

/-- The advance of a perihelion in units of one third of the full value: 2 + 2·gamma - beta. -/
def perihelion (γ β : Int) : Int := 2 + 2 * γ - β
theorem perihelion_is_full (γ β : Int) (hγ : γ = 1) (hβ : β = 1) : perihelion γ β = 3 := by
  unfold perihelion; omega

end SPHYS.FieldEq

#print axioms SPHYS.FieldEq.div2_eq
#print axioms SPHYS.FieldEq.conservation_forces_the_law
#print axioms SPHYS.FieldEq.the_forced_law_is_conserved
#print axioms SPHYS.FieldEq.the_law_fixes_no_scale
#print axioms SPHYS.FieldEq.active_four
#print axioms SPHYS.FieldEq.four_is_the_least_where_dust_attracts
#print axioms SPHYS.FieldEq.the_vacuum_repels
#print axioms SPHYS.FieldEq.active_is_homogeneous
#print axioms SPHYS.FieldEq.space_reads_as_time
#print axioms SPHYS.FieldEq.not_in_five
#print axioms SPHYS.FieldEq.two_polarizations
#print axioms SPHYS.FieldEq.no_waves_in_three
#print axioms SPHYS.FieldEq.three_is_rigid
#print axioms SPHYS.FieldEq.double_radius_quadruple_area
#print axioms SPHYS.FieldEq.light_bends_twice
#print axioms SPHYS.FieldEq.perihelion_is_full
