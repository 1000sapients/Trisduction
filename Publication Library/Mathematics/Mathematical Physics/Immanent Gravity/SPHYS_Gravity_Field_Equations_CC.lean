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
    (1) two identities of Riemannian geometry are fields of `Geometry` and are not proved here: the metric is
        constant under its own derivative (`compat`), and the contracted Bianchi identity, twice div Ric = d R
        (`bianchi`), which is the statement that the boundary of a boundary is zero;
    (2) the family a·Ric + b·R·g + c·g holds the laws of second order that are linear in the curvature. That in
        four dimensions every conserved law of second order lies in it, linear or not, is Lovelock's theorem
        (1971, 1972), not proved here;
    (3) the rest frame of a perfect fluid, T = diag(rho, p, ..., p), with signature (-, +, ..., +);
    (4) the exact solution of the forced law outside a body at rest, in isotropic coordinates (Schwarzschild, 1916):
        its two metric functions are the inputs of `exact_solution_gives_gamma_and_beta`, which checks their
        expansion and not that they solve the law;
    (5) in two dimensions the Ricci tensor is half the scalar curvature times the metric, a fact of geometry and
        the definition of `twoDim`;
    (6) the counts of Part III: n(n + 1)/2 components of a symmetric law, n²(n² - 1)/12 of the curvature, and the
        polarizations of a wave by removing n identities and n coordinates. They are classical counts, entered as
        definitions; the theorems of Part III evaluate them at the dimensions named;
    (7) the area of a sphere in three dimensions of space, as the square of its radius (`area`);
    (8) two formulas of the post-Newtonian expansion (Will, 2014): light bends as 1 + gamma (`bending`) and a
        perihelion advances as 2 + 2·gamma - beta (`perihelion`).
  DOMAIN. The dimension theorems are stated for every integer n because the algebra holds for every n. Their
  meaning as geometry begins at n = 3, where a trace reversal exists; n = 2 is treated on its own by `two_is_empty`.
  RISK. A reader may take `conservation_forces_the_law` as a proof of Lovelock's theorem. It is the forcing inside
  the family, and the docstring says so.
  NON-NEGOTIABLE. No theorem here fixes the value of the coupling. `the_law_fixes_no_scale` proves it cannot.
-/
namespace SPHYS.FieldEq

/-! ## Part I. Nothing escapes the record: conservation forces the law. -/

/-- A geometry, as far as the law reads it at one point and in one direction: the divergence of the Ricci tensor,
    the gradient of the scalar curvature and the divergence of the metric, with the two identities that tie them:
    the metric is constant under its own derivative, and the contracted Bianchi identity (doubled to stay in Int). -/
structure Geometry where
  divRic : Int
  dR     : Int
  divMetric : Int
  compat  : divMetric = 0
  bianchi : 2 * divRic = dR

/-- Twice the divergence of the candidate law a·Ric + b·R·g + c·g, every term kept: the term in b contributes
    b·dR, and the term in c contributes c times the divergence of the metric. -/
def div2 (G : Geometry) (a b c : Int) : Int := 2 * (a * G.divRic + b * G.dR) + 2 * (c * G.divMetric)

/-- The divergence of the family is one number times the gradient of the curvature. -/
theorem div2_eq (G : Geometry) (a b c : Int) : div2 G a b c = (a + 2 * b) * G.dR := by
  unfold div2
  rw [G.compat, Int.mul_zero, Int.mul_zero, Int.add_zero, Int.mul_add, ← Int.mul_assoc, Int.mul_comm 2 a, Int.mul_assoc, G.bianchi, ← Int.mul_assoc, Int.mul_comm 2 b,
      Int.add_mul, Int.mul_comm b 2]

/-- A geometry whose curvature has a gradient: the witness that the forcing is not vacuous. -/
def curved : Geometry := { divRic := 1, dR := 2, divMetric := 0, compat := rfl, bianchi := by decide }

/-- CONSERVATION FORCES THE LAW. If the law is divergence-free on every geometry, so that it can equal a conserved
    source, then b = -a/2: the law is a·(Ric - R·g/2) + c·g. Inside the linear family nothing else is allowed. -/
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

/-- The cosmological term is free: no value of c is touched by conservation. It follows from the constancy of the
    metric, which is now a field of the geometry and no longer a silence of the definition. -/
theorem the_vacuum_term_is_free (a b c c' : Int) (G : Geometry) : div2 G a b c = div2 G a b c' := by
  rw [div2_eq, div2_eq]

/-- THE CONSERVED LAWS ARE ONE LINE, THE EINSTEIN LINE. Every conserved pair (a, b) is an integer multiple of (2, -1): the conserved
    laws are the multiples of Einstein's tensor 2·Ric - R·g, and the vacuum term beside them. -/
theorem conserved_laws_are_one_line (a b : Int) (h : a + 2 * b = 0) : ∃ k : Int, a = 2 * k ∧ b = -k :=
  ⟨-b, by omega, by omega⟩

/-- The vacuum term alone is conserved and reads no curvature: the one member of the family with a = 0. -/
theorem the_vacuum_alone_is_conserved (c : Int) (G : Geometry) : div2 G 0 0 c = 0 := by
  rw [div2_eq]; simp

/-- A LAW THAT READS CURVATURE IS EINSTEIN'S. If the law reads the Ricci tensor at all (a is not zero) and is
    conserved on every geometry, then it reads the scalar curvature too, in the ratio b = -a/2. -/
theorem a_law_that_reads_curvature_is_einsteins (a b c : Int) (ha : a ≠ 0) (h : ∀ G : Geometry, div2 G a b c = 0) :
    b ≠ 0 ∧ a + 2 * b = 0 := by
  have h1 := conservation_forces_the_law a b c h
  refine ⟨?_, h1⟩
  intro hb; omega

/-- OFF THE EINSTEIN LINE THE CURVATURE IS FROZEN. A law off the Einstein line can be conserved only where the curvature has no
    gradient. Its source would have one trace everywhere: no star, no planet, no void. This is why conservation
    is asked on every geometry and not on some. -/
theorem off_the_einstein_line_the_curvature_is_frozen (G : Geometry) (a b c : Int) (hne : a + 2 * b ≠ 0)
    (h : div2 G a b c = 0) : G.dR = 0 := by
  rw [div2_eq] at h
  rcases Int.mul_eq_zero.mp h with h1 | h1
  · exact absurd h1 hne
  · exact h1

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

/-! ### Every dimension at once. The three theorems above are instances of these. -/

/-- THE ACTIVE DENSITY IN EVERY DIMENSION: (n - 3)·rho + (n - 1)·p. Read as geometry for n at least three. -/
theorem active_general (n ρ p : Int) : activeN n ρ p = (n - 3) * ρ + (n - 1) * p := by
  unfold activeN trace
  have h : (n - 2) * ρ = (n - 3) * ρ + ρ := by
    have e : n - 2 = (n - 3) + 1 := by omega
    rw [e, Int.add_mul, Int.one_mul]
  omega

theorem dust_general (n ρ : Int) : activeN n ρ 0 = (n - 3) * ρ := by
  rw [active_general, Int.mul_zero, Int.add_zero]

/-- For a body at rest the space part reads the density itself, in every dimension. -/
theorem space_general (n ρ : Int) : spaceN n ρ 0 = ρ := by
  unfold spaceN trace
  rw [Int.mul_zero, Int.mul_zero]; omega

/-- A BODY AT REST HAS WEIGHT EXACTLY ABOVE THREE DIMENSIONS OF SPACETIME. -/
theorem dust_attracts_exactly_above_three (n ρ : Int) (hρ : 0 < ρ) : 0 < activeN n ρ 0 ↔ 3 < n := by
  rw [dust_general]
  constructor
  · intro h
    by_cases hn : 3 < n
    · exact hn
    · exfalso
      have h1 : n - 3 ≤ 0 := by omega
      have h2 : (n - 3) * ρ ≤ 0 := Int.mul_nonpos_of_nonpos_of_nonneg h1 (Int.le_of_lt hρ)
      omega
  · intro h
    exact Int.mul_pos (by omega) hρ

/-- GAMMA IS ONE EXACTLY IN FOUR DIMENSIONS. For a body at rest the space part of the law reads what the time part
    reads if and only if the dimension is four. Light bends exactly twice the Newtonian angle in four dimensions
    and in no other. -/
theorem gamma_is_one_exactly_in_four (n ρ : Int) (hρ : ρ ≠ 0) : spaceN n ρ 0 = activeN n ρ 0 ↔ n = 4 := by
  rw [space_general, dust_general]
  constructor
  · intro h
    have h2 : (n - 4) * ρ = 0 := by
      have e : (n - 3) * ρ = (n - 4) * ρ + ρ := by
        have e1 : n - 3 = (n - 4) + 1 := by omega
        rw [e1, Int.add_mul, Int.one_mul]
      omega
    rcases Int.mul_eq_zero.mp h2 with h3 | h3
    · omega
    · exact absurd h3 hρ
  · intro h
    subst h
    have e : (4 : Int) - 3 = 1 := by decide
    rw [e, Int.one_mul]

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

/-- Twice the coefficient of the metric in the family, in two dimensions, where Ric = (R/2)·g: the whole family
    a·Ric + b·R·g collapses to (a/2 + b)·R·g. -/
def twoDim (a b R : Int) : Int := (a + 2 * b) * R

/-- TWO IS EMPTY. In two dimensions every conserved law of the family vanishes identically: Einstein's tensor is
    zero there, and gravity has no law to obey. -/
theorem two_is_empty (a b R : Int) (h : a + 2 * b = 0) : twoDim a b R = 0 := by
  unfold twoDim; rw [h, Int.zero_mul]

/-- In two dimensions the curvature has one component. -/
theorem one_curvature_in_two : curvature 2 = 1 := by decide

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

/-- Product of two polynomials in x, kept to second order: (c0, c1, c2) stands for c0 + c1·x + c2·x². -/
def mul3 (p q : Int × Int × Int) : Int × Int × Int :=
  (p.1 * q.1, p.1 * q.2.1 + p.2.1 * q.1, p.1 * q.2.2 + p.2.1 * q.2.1 + p.2.2 * q.1)

/-- THE EXACT SOLUTION GIVES GAMMA = 1 AND BETA = 1. Outside a body at rest, with x = GM/(2c²r) and U = 2x, the
    exact solution has time part ((1 - x)/(1 + x))² and space part (1 + x)⁴. To second order the time part is
    1 - 4x + 8x², which is 1 - 2U + 2·beta·U² with beta = 1, and the space part is 1 + 4x, which is 1 + 2·gamma·U
    with gamma = 1. Checked as identities of polynomials: (1 + x)²·(1 - 4x + 8x²) = (1 - x)² and
    (1 + x)²·(1 + x)² = 1 + 4x + 6x², both to second order. -/
theorem exact_solution_gives_gamma_and_beta :
    mul3 (1, 2, 1) (1, -4, 8) = (1, -2, 1) ∧ mul3 (1, 2, 1) (1, 2, 1) = (1, 4, 6) ∧
    (∀ β : Int, 8 * β = 8 → β = 1) ∧ (∀ γ : Int, 4 * γ = 4 → γ = 1) := by
  refine ⟨by decide, by decide, ?_, ?_⟩ <;> intro _ h <;> omega

/-- The advance of a perihelion in units of one third of the full value: 2 + 2·gamma - beta. -/
def perihelion (γ β : Int) : Int := 2 + 2 * γ - β
theorem perihelion_is_full (γ β : Int) (hγ : γ = 1) (hβ : β = 1) : perihelion γ β = 3 := by
  unfold perihelion; omega

end SPHYS.FieldEq

#print axioms SPHYS.FieldEq.div2_eq
#print axioms SPHYS.FieldEq.conservation_forces_the_law
#print axioms SPHYS.FieldEq.the_forced_law_is_conserved
#print axioms SPHYS.FieldEq.the_law_fixes_no_scale
#print axioms SPHYS.FieldEq.the_vacuum_term_is_free
#print axioms SPHYS.FieldEq.conserved_laws_are_one_line
#print axioms SPHYS.FieldEq.the_vacuum_alone_is_conserved
#print axioms SPHYS.FieldEq.a_law_that_reads_curvature_is_einsteins
#print axioms SPHYS.FieldEq.off_the_einstein_line_the_curvature_is_frozen
#print axioms SPHYS.FieldEq.active_four
#print axioms SPHYS.FieldEq.active_three
#print axioms SPHYS.FieldEq.dust_is_weightless_in_three
#print axioms SPHYS.FieldEq.active_five
#print axioms SPHYS.FieldEq.four_is_the_least_where_dust_attracts
#print axioms SPHYS.FieldEq.dust_attracts
#print axioms SPHYS.FieldEq.radiation_reads_double
#print axioms SPHYS.FieldEq.the_vacuum_repels
#print axioms SPHYS.FieldEq.repulsion_needs_tension
#print axioms SPHYS.FieldEq.space_reads_as_time
#print axioms SPHYS.FieldEq.not_in_five
#print axioms SPHYS.FieldEq.active_general
#print axioms SPHYS.FieldEq.dust_general
#print axioms SPHYS.FieldEq.space_general
#print axioms SPHYS.FieldEq.dust_attracts_exactly_above_three
#print axioms SPHYS.FieldEq.gamma_is_one_exactly_in_four
#print axioms SPHYS.FieldEq.active_is_homogeneous
#print axioms SPHYS.FieldEq.ten_equations
#print axioms SPHYS.FieldEq.twenty_curvatures
#print axioms SPHYS.FieldEq.two_polarizations
#print axioms SPHYS.FieldEq.no_waves_in_three
#print axioms SPHYS.FieldEq.five_in_five
#print axioms SPHYS.FieldEq.polarizations_formula_four
#print axioms SPHYS.FieldEq.three_is_rigid
#print axioms SPHYS.FieldEq.four_has_ten_free
#print axioms SPHYS.FieldEq.two_is_empty
#print axioms SPHYS.FieldEq.one_curvature_in_two
#print axioms SPHYS.FieldEq.double_radius_quadruple_area
#print axioms SPHYS.FieldEq.light_bends_twice
#print axioms SPHYS.FieldEq.exact_solution_gives_gamma_and_beta
#print axioms SPHYS.FieldEq.perihelion_is_full
