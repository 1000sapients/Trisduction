/-
  SPHYS_Maxwell_Forced_CC.lean · Maxwell's equations from the seat · core Lean 4, no library.

  RATIONALE. The Geometric Nature of Light and Electromagnetism on the Fixed Line proved what light and charge
  are on the seat and took Maxwell's equations as measured. This file carries the algebra that turns the import
  into a consequence. Charge is conserved on every field, so the law that reads it must be conserved identically.
  Inside the family of laws of second order that are linear in the potential, exactly one line survives: Maxwell's.
  The same forcing removes the mass term, makes gauge invariance a consequence, and fixes the count of helicities.

  DESIGN. Integers and naturals only. No axiom is declared. The kernel line of every theorem is printed at the end.

  WHAT ENTERS AS A DEFINITION, NOT AS A THEOREM (read before editing):
    (1) partial derivatives commute, so the divergence of the wave operator on the potential is the wave operator
        on its divergence: the field `commute` of `Field`. It is the statement that the boundary of a boundary is
        zero, read on the potential;
    (2) a law of second order, linear in a potential with one index, is a combination of two terms, the wave
        operator on the potential and the gradient of its divergence, with a mass term at order zero: the family
        a·□A + b·∂(∂·A) + m·A. That these span the covariant laws is a fact of representation theory, not proved here;
    (3) the counts: a potential in n dimensions has n components; a massless one loses two, to the gauge and to
        the constraint, and a massive one loses one (Wigner, 1939). They are the definitions `polarizations` and
        `massive`;
    (4) the field strength in n dimensions has n(n-1)/2 components, n-1 electric and (n-1)(n-2)/2 magnetic.
  DOMAIN. The count theorems are stated for every n and read as physics for n at least three.
  RISK. A reader may take `conservation_forces_maxwell` as a proof that no nonlinear law is conserved. It is the
  forcing inside the linear family, and linearity is bridge B3 of the paper.
  NON-NEGOTIABLE. No theorem here fixes the value of the coupling. `the_law_fixes_no_scale` proves it cannot.
-/
namespace SPHYS.Maxwell

/-! ## Part I. Nothing escapes the record: conservation of charge forces the law. -/

/-- A field, as far as the law reads it at one point: the wave operator on the divergence of the potential, the
    divergence of the wave operator on the potential, and the divergence of the potential itself, with the one
    identity that ties the first two: derivatives commute. -/
structure Field where
  boxDivA : Int
  divBoxA : Int
  divA    : Int
  commute : divBoxA = boxDivA

/-- The divergence of the candidate law a·□A + b·∂(∂·A) + m·A, every term kept. -/
def div (F : Field) (a b m : Int) : Int := a * F.divBoxA + b * F.boxDivA + m * F.divA

/-- The divergence of the family is two numbers: one times the wave of the gauge part, one times the gauge part. -/
theorem div_eq (F : Field) (a b m : Int) : div F a b m = (a + b) * F.boxDivA + m * F.divA := by
  unfold div; rw [F.commute, Int.add_mul]

/-- Two witnesses that the forcing is not vacuous: a field whose gauge part waves, and one whose gauge part stands. -/
def waving : Field := { boxDivA := 1, divBoxA := 1, divA := 0, commute := rfl }
def standing : Field := { boxDivA := 0, divBoxA := 0, divA := 1, commute := rfl }

/-- CONSERVATION FORCES MAXWELL. If the law is conserved on every field, so that it can equal a conserved charge,
    then b = -a and the mass term is zero: the law is a·(□A - ∂(∂·A)), Maxwell's, and the photon has no mass. -/
theorem conservation_forces_maxwell (a b m : Int) (h : ∀ F : Field, div F a b m = 0) : a + b = 0 ∧ m = 0 := by
  have h1 := h waving
  have h2 := h standing
  rw [div_eq] at h1 h2
  have e1 : (a + b) * 1 + m * 0 = 0 := h1
  have e2 : (a + b) * 0 + m * 1 = 0 := h2
  rw [Int.mul_one, Int.mul_zero, Int.add_zero] at e1
  rw [Int.mul_zero, Int.mul_one, Int.zero_add] at e2
  exact ⟨e1, e2⟩

/-- And Maxwell's law is conserved on every field. -/
theorem maxwell_is_conserved (a b : Int) (h : a + b = 0) (F : Field) : div F a b 0 = 0 := by
  rw [div_eq, h, Int.zero_mul, Int.zero_mul, Int.add_zero]

/-- The two directions as one statement. -/
theorem conserved_iff (a b m : Int) : (∀ F : Field, div F a b m = 0) ↔ (a + b = 0 ∧ m = 0) := by
  constructor
  · exact conservation_forces_maxwell a b m
  · intro h F
    rw [h.2]; exact maxwell_is_conserved a b h.1 F

/-- THE SECOND TERM IS FORCED: b = -a. -/
theorem the_second_term_is_forced (a b m : Int) (h : ∀ F : Field, div F a b m = 0) : b = -a := by
  have := (conservation_forces_maxwell a b m h).1; omega

/-- THE PHOTON HAS NO MASS. -/
theorem the_photon_has_no_mass (a b m : Int) (h : ∀ F : Field, div F a b m = 0) : m = 0 :=
  (conservation_forces_maxwell a b m h).2

/-- THE CONSERVED LAWS ARE ONE LINE, THE MAXWELL LINE: the multiples of □A - ∂(∂·A). -/
theorem conserved_laws_are_one_line (a b : Int) (h : a + b = 0) : ∃ k : Int, a = k ∧ b = -k :=
  ⟨a, rfl, by omega⟩

/-- OFF THE MAXWELL LINE THE GAUGE PART CANNOT WAVE. A massless law off the line is conserved only where the wave
    of the gauge part vanishes. -/
theorem off_the_maxwell_line_the_field_is_frozen (F : Field) (a b : Int) (hne : a + b ≠ 0)
    (h : div F a b 0 = 0) : F.boxDivA = 0 := by
  rw [div_eq, Int.zero_mul, Int.add_zero] at h
  rcases Int.mul_eq_zero.mp h with h1 | h1
  · exact absurd h1 hne
  · exact h1

/-- WITH A MASS THE POTENTIAL IS FROZEN. On the Maxwell line a mass term is conserved only where the divergence of
    the potential vanishes: the potential loses a freedom, and the record would keep what it must forget. -/
theorem with_a_mass_the_potential_is_frozen (F : Field) (a b m : Int) (hab : a + b = 0) (hm : m ≠ 0)
    (h : div F a b m = 0) : F.divA = 0 := by
  rw [div_eq, hab, Int.zero_mul, Int.zero_add] at h
  rcases Int.mul_eq_zero.mp h with h1 | h1
  · exact absurd h1 hm
  · exact h1

/-- THE LAW FIXES NO SCALE. Every multiple of a conserved law is conserved: the coupling is a magnitude. -/
theorem the_law_fixes_no_scale (a b k : Int) (h : a + b = 0) : k * a + k * b = 0 := by
  rw [← Int.mul_add, h, Int.mul_zero]

/-! ### The displacement current.
Ampère's law reads curl B = mu0·J. Its left side has no divergence (the divergence of a curl is zero, the same
identity as `commute` in another reading), so its right side must have none. Add k times Maxwell's term,
mu0·eps0·dE/dt, and use the time part of the forced law, div E = rho/eps0: the divergence of the right side is
mu0·(div J + k·d rho/dt). -/

/-- A source at one point: the divergence of its current and the rate of change of its charge, conserved. -/
structure Source where
  divJ   : Int
  rhoDot : Int
  conserved : divJ + rhoDot = 0

/-- The divergence of the right side of Ampère's law with k times the displacement term, in units of mu0. -/
def ampere (k : Int) (S : Source) : Int := S.divJ + k * S.rhoDot

/-- A source whose charge is changing: a capacitor filling. -/
def filling : Source := { divJ := -1, rhoDot := 1, conserved := by decide }

/-- AMPÈRE'S LAW ALONE FAILS. Without the displacement term the law contradicts the conservation of charge on a
    source whose charge changes. -/
theorem ampere_alone_fails : ¬ ∀ S : Source, ampere 0 S = 0 := by
  intro h
  have h1 : ampere 0 filling = 0 := h filling
  have h2 : ampere 0 filling = -1 := by decide
  omega

/-- THE DISPLACEMENT CURRENT IS FORCED, AT FULL STRENGTH. Ampère's law holds on every conserved source if and only
    if Maxwell's term enters with coefficient one. -/
theorem the_displacement_current_is_forced (k : Int) : (∀ S : Source, ampere k S = 0) ↔ k = 1 := by
  constructor
  · intro h
    have h1 : ampere k filling = 0 := h filling
    have h2 : ampere k filling = -1 + k * 1 := rfl
    rw [h2, Int.mul_one] at h1
    omega
  · intro hk S
    unfold ampere
    rw [hk, Int.one_mul]
    exact S.conserved

/-! ## Part II. Gauge invariance is a consequence. -/

/-- The change of the law when the potential is shifted by a gradient. The two second-order terms change by the
    same amount g, because derivatives commute, and the mass term changes by the gradient itself, gA. -/
def shift (a b m g gA : Int) : Int := a * g + b * g + m * gA

/-- GAUGE INVARIANCE AND THE CONSERVATION OF CHARGE ARE ONE THEOREM. The law is unchanged by every shift of the
    potential by a gradient if and only if it is conserved on every field. -/
theorem gauge_invariance_iff_conservation (a b m : Int) :
    (∀ g gA : Int, shift a b m g gA = 0) ↔ (∀ F : Field, div F a b m = 0) := by
  rw [conserved_iff]
  constructor
  · intro h
    have h1 : a * 1 + b * 1 + m * 0 = 0 := h 1 0
    have h2 : a * 0 + b * 0 + m * 1 = 0 := h 0 1
    rw [Int.mul_one, Int.mul_one, Int.mul_zero, Int.add_zero] at h1
    rw [Int.mul_zero, Int.mul_zero, Int.mul_one, Int.zero_add, Int.zero_add] at h2
    exact ⟨h1, h2⟩
  · intro h g gA
    unfold shift
    rw [h.2, Int.zero_mul, Int.add_zero, ← Int.add_mul, h.1, Int.zero_mul]

/-! ## Part III. The counts a seat reaches. -/

/-- Polarizations of a massless field with one index in n dimensions: n components, less the gauge, less the
    constraint. -/
def polarizations (n : Nat) : Nat := n - 2
/-- Polarizations of a massive one: n components, less the constraint. -/
def massive (n : Nat) : Nat := n - 1

/-- TWO HELICITIES in four dimensions. -/
theorem two_helicities : polarizations 4 = 2 := by decide
/-- And two exactly in four. -/
theorem two_helicities_exactly_in_four (n : Nat) : polarizations n = 2 ↔ n = 4 := by
  unfold polarizations; constructor <;> intro h <;> omega
/-- NO THIRD. A third polarization appears exactly with a mass. -/
theorem mass_adds_one (n : Nat) (h : 2 ≤ n) : massive n = polarizations n + 1 := by
  unfold massive polarizations; omega
theorem a_third_needs_a_mass : massive 4 = 3 ∧ polarizations 4 = 2 := by decide

/-- Components of the field strength in n dimensions, and its electric and magnetic parts. -/
def fieldComponents (n : Nat) : Nat := n * (n - 1) / 2
def electric (n : Nat) : Nat := n - 1
def magnetic (n : Nat) : Nat := (n - 1) * (n - 2) / 2

theorem three_and_three : electric 4 = 3 ∧ magnetic 4 = 3 ∧ fieldComponents 4 = 6 := by decide
theorem no_magnet_in_two : magnetic 2 = 0 ∧ electric 2 = 1 := by decide
theorem one_magnet_in_three : magnetic 3 = 1 ∧ electric 3 = 2 := by decide
theorem six_magnets_in_five : magnetic 5 = 6 ∧ electric 5 = 4 := by decide

/-- DUALITY EXISTS EXACTLY IN FOUR DIMENSIONS. The electric and the magnetic parts have the same number of
    components, so that a quarter turn can exchange them, if and only if the dimension is four. Stated without
    division: twice the electric count equals twice the magnetic count. -/
theorem duality_exactly_in_four (n : Int) (h : 2 ≤ n) : 2 * (n - 1) = (n - 1) * (n - 2) ↔ n = 4 := by
  constructor
  · intro h0
    have e : (n - 1) * (n - 2) = (n - 1) * (n - 4) + (n - 1) * 2 := by
      have e1 : n - 2 = (n - 4) + 2 := by omega
      rw [e1, Int.mul_add]
    have h2 : (n - 1) * (n - 4) = 0 := by omega
    rcases Int.mul_eq_zero.mp h2 with h3 | h3 <;> omega
  · intro h1; subst h1; decide

/-- LIGHT AND GRAVITY CARRY THE SAME NUMBER OF POLARIZATIONS EXACTLY IN FOUR DIMENSIONS. Light carries n - 2 and
    gravity n(n - 3)/2. Stated without division. -/
theorem light_and_gravity_agree_exactly_in_four (n : Int) (h : 3 ≤ n) : 2 * (n - 2) = n * (n - 3) ↔ n = 4 := by
  constructor
  · intro h0
    have e1 : n * (n - 3) = n * n - n * 3 := by rw [Int.mul_sub]
    have e2 : (n - 1) * (n - 4) = n * n - n * 4 - (n - 4) := by
      rw [Int.sub_mul, Int.mul_sub, Int.one_mul]
    have h2 : (n - 1) * (n - 4) = 0 := by omega
    rcases Int.mul_eq_zero.mp h2 with h3 | h3 <;> omega
  · intro h1; subst h1; decide

/-! ## Part IV. The static half: Coulomb. -/

/-- The area of a sphere of radius r in d dimensions of space, up to its constant. -/
def area (d r : Nat) : Nat := r ^ (d - 1)

/-- THE FLUX LAW IN EVERY DIMENSION. At twice the radius the same flux crosses 2^(d-1) times the area. -/
theorem flux_in_every_dimension (d r : Nat) : area d (2 * r) = 2 ^ (d - 1) * area d r := by
  unfold area; rw [Nat.mul_pow]

/-- INVERSE SQUARE in three dimensions of space. -/
theorem inverse_square_in_three (r : Nat) : area 3 (2 * r) = 4 * area 3 r := by
  rw [flux_in_every_dimension]
theorem inverse_first_power_in_two (r : Nat) : area 2 (2 * r) = 2 * area 2 r := by
  rw [flux_in_every_dimension]
theorem inverse_cube_in_four (r : Nat) : area 4 (2 * r) = 8 * area 4 r := by
  rw [flux_in_every_dimension]

/-- Coulomb's law reads one component of the potential in four, the time part; the other three are magnetism. -/
theorem coulomb_reads_one_of_four : (1 : Nat) + electric 4 = 4 := by decide

end SPHYS.Maxwell

#print axioms SPHYS.Maxwell.div_eq
#print axioms SPHYS.Maxwell.conservation_forces_maxwell
#print axioms SPHYS.Maxwell.maxwell_is_conserved
#print axioms SPHYS.Maxwell.conserved_iff
#print axioms SPHYS.Maxwell.the_second_term_is_forced
#print axioms SPHYS.Maxwell.the_photon_has_no_mass
#print axioms SPHYS.Maxwell.conserved_laws_are_one_line
#print axioms SPHYS.Maxwell.off_the_maxwell_line_the_field_is_frozen
#print axioms SPHYS.Maxwell.with_a_mass_the_potential_is_frozen
#print axioms SPHYS.Maxwell.the_law_fixes_no_scale
#print axioms SPHYS.Maxwell.ampere_alone_fails
#print axioms SPHYS.Maxwell.the_displacement_current_is_forced
#print axioms SPHYS.Maxwell.gauge_invariance_iff_conservation
#print axioms SPHYS.Maxwell.two_helicities
#print axioms SPHYS.Maxwell.two_helicities_exactly_in_four
#print axioms SPHYS.Maxwell.mass_adds_one
#print axioms SPHYS.Maxwell.a_third_needs_a_mass
#print axioms SPHYS.Maxwell.three_and_three
#print axioms SPHYS.Maxwell.no_magnet_in_two
#print axioms SPHYS.Maxwell.one_magnet_in_three
#print axioms SPHYS.Maxwell.six_magnets_in_five
#print axioms SPHYS.Maxwell.duality_exactly_in_four
#print axioms SPHYS.Maxwell.light_and_gravity_agree_exactly_in_four
#print axioms SPHYS.Maxwell.flux_in_every_dimension
#print axioms SPHYS.Maxwell.inverse_square_in_three
#print axioms SPHYS.Maxwell.inverse_first_power_in_two
#print axioms SPHYS.Maxwell.inverse_cube_in_four
#print axioms SPHYS.Maxwell.coulomb_reads_one_of_four
