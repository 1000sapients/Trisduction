/-
  SPHYS_Three_Dimensions_CC.lean · three dimensions of space, and no other · core Lean 4, no library.

  RATIONALE. Four papers force the laws of gravity, light, matter and the nuclear forces from one seat, and each
  finds, by its own theorem, a property that depends on the dimension of space. This file sets those properties
  side by side as functions of the dimension d and proves that they hold together at d = 3 and at no other value.

  DESIGN. Naturals and integers only. Each property is a definition that carries the formula proved or cited in
  the paper named beside it, and each theorem is a statement about all d. No axiom is declared. The kernel line
  of every theorem is printed at the end. d is the dimension of space; spacetime has d + 1.

  WHAT ENTERS AS A DEFINITION, NOT AS A THEOREM (read before editing):
    (1) weight: the active mass of matter at rest is (d-2)/(d-1) of its density (Immanent Gravity, `active_general`);
    (2) waves of gravity: (d+1)(d-2)/2 polarizations (Immanent Gravity, `two_polarizations`, cited count);
    (3) the share of space in the bending of light is 1/(d-2) of the share of time (Immanent Gravity,
        `gamma_is_one_exactly_in_four`; Tangherlini, 1963);
    (4) a force that loses nothing between spheres falls as the power d-1 of the distance (Light,
        `flux_in_every_dimension`), and a circular orbit under a power p is stable exactly when p < 3
        (Bertrand, 1873; Ehrenfest, 1917); an orbit needs a plane to turn in, so two dimensions at least;
    (5) a double exchange unwinds exactly when the sphere of directions is simply connected, d-1 at least 2
        (Matter, `the_double_exchange_unwinds_from_three`; Leinaas and Myrheim, 1977);
    (6) the field of light has d electric and d(d-1)/2 magnetic parts and d-1 polarizations (Light), and the
        square of a nuclear coupling carries 3-d powers of mass (The Nuclear Forces).
  RISK. A reader may take `three_and_no_other` for a proof that space must have three dimensions. It proves that
  five measured properties hold together in three and in no other. That they are measured is experiment.
  NON-NEGOTIABLE. No definition here may be changed without the theorem of the paper it cites.
-/
namespace SPHYS.Dimension

/-! ## Part I. The five properties. -/

/-- The weight of matter at rest, as a fraction: numerator d - 2 over denominator d - 1 (as integers). -/
def weightNum (d : Nat) : Int := (d : Int) - 2
/-- WEIGHT: matter at rest attracts. -/
def weight (d : Nat) : Prop := 0 < weightNum d

/-- The polarizations of a wave of gravity. -/
def gravityWaves (d : Nat) : Nat := (d + 1) * (d - 2) / 2
/-- WAVES: gravity has a wave. -/
def waves (d : Nat) : Prop := 0 < gravityWaves d

/-- LIGHT BENT TWICE: the share of space equals the share of time, d - 2 = 1, so the bending is twice Newton's. -/
def bentTwice (d : Nat) : Prop := (d : Int) - 2 = 1

/-- The power of the distance by which a force that loses nothing falls. -/
def power (d : Nat) : Nat := d - 1
/-- STABLE ORBITS: an orbit exists, which needs a plane to turn in, and the power is below three. -/
def stableOrbits (d : Nat) : Prop := 2 ≤ d ∧ power d < 3

/-- TWO STATISTICS: the double exchange unwinds. -/
def twoStatistics (d : Nat) : Prop := 2 ≤ d - 1

/-- Matter has weight exactly from three dimensions on. In two it has none. In one
    there is no law of gravity at all (Immanent Gravity, `two_is_empty`). -/
theorem weight_from_three (d : Nat) : weight d ↔ 3 ≤ d := by
  unfold weight weightNum; constructor <;> intro h <;> omega

theorem no_weight_in_the_plane : weightNum 2 = 0 := rfl

/-- Gravity has waves exactly from three dimensions on. -/
theorem waves_from_three (d : Nat) : waves d ↔ 3 ≤ d := by
  unfold waves gravityWaves
  constructor
  · intro h
    apply Nat.le_of_not_lt; intro h3
    have h5 : d = 0 ∨ d = 1 ∨ d = 2 := by omega
    rcases h5 with h5 | h5 | h5 <;> subst h5 <;> exact absurd h (by decide)
  · intro h
    have h1 : 4 ≤ d + 1 := by omega
    have h2 : 1 ≤ d - 2 := by omega
    have h3 : 4 * 1 ≤ (d + 1) * (d - 2) := Nat.mul_le_mul h1 h2
    exact (Nat.le_div_iff_mul_le (by decide)).mpr (by omega)

/-- In three dimensions the waves of gravity have two polarizations. -/
theorem two_polarizations_in_three : gravityWaves 3 = 2 := rfl

/-- Light is bent twice in three dimensions and in no other. -/
theorem bent_twice_only_in_three (d : Nat) : bentTwice d ↔ d = 3 := by
  unfold bentTwice; constructor <;> intro h <;> omega

/-- Orbits exist and are stable in two and three dimensions, and in no other. -/
theorem stable_up_to_three (d : Nat) : stableOrbits d ↔ 2 ≤ d ∧ d ≤ 3 := by
  unfold stableOrbits power
  constructor
  · intro h; have h2 := h.2; exact ⟨h.1, by omega⟩
  · intro h; have h2 := h.2; exact ⟨h.1, by omega⟩

/-- The inverse square is the law of three dimensions. -/
theorem inverse_square_only_in_three (d : Nat) : power d = 2 ↔ d = 3 := by
  unfold power; constructor <;> intro h <;> omega

/-- There are two statistics and no third exactly from three dimensions on. -/
theorem two_statistics_from_three (d : Nat) : twoStatistics d ↔ 3 ≤ d := by
  unfold twoStatistics; constructor <;> intro h <;> omega

/-! ## Part II. Together, in three and in no other. -/

/-- THREE AND NO OTHER. Weight, waves, light bent twice, stable orbits and two statistics hold together in three
    dimensions of space and in no other. -/
theorem three_and_no_other (d : Nat) :
    (weight d ∧ waves d ∧ bentTwice d ∧ stableOrbits d ∧ twoStatistics d) ↔ d = 3 := by
  constructor
  · intro h; exact (bent_twice_only_in_three d).mp h.2.2.1
  · intro h; subst h
    exact ⟨(weight_from_three 3).mpr (Nat.le_refl 3), (waves_from_three 3).mpr (Nat.le_refl 3),
      (bent_twice_only_in_three 3).mpr rfl, (stable_up_to_three 3).mpr ⟨by decide, Nat.le_refl 3⟩,
      (two_statistics_from_three 3).mpr (Nat.le_refl 3)⟩

/-- WEIGHT AND ORBITS ALONE GIVE THREE. A world in which matter attracts and a planet keeps its orbit has three
    dimensions of space. -/
theorem weight_and_orbits_alone_give_three (d : Nat) : (weight d ∧ stableOrbits d) ↔ d = 3 := by
  rw [weight_from_three, stable_up_to_three]; constructor
  · intro h; exact Nat.le_antisymm h.2.2 h.1
  · intro h; subst h; exact ⟨Nat.le_refl 3, by decide, Nat.le_refl 3⟩

/-- WAVES AND ORBITS ALONE GIVE THREE. -/
theorem waves_and_orbits_alone_give_three (d : Nat) : (waves d ∧ stableOrbits d) ↔ d = 3 := by
  rw [waves_from_three, stable_up_to_three]; constructor
  · intro h; exact Nat.le_antisymm h.2.2 h.1
  · intro h; subst h; exact ⟨Nat.le_refl 3, by decide, Nat.le_refl 3⟩

/-- STATISTICS AND ORBITS ALONE GIVE THREE. The atom that excludes and the atom that holds need the same space. -/
theorem statistics_and_orbits_alone_give_three (d : Nat) : (twoStatistics d ∧ stableOrbits d) ↔ d = 3 := by
  rw [two_statistics_from_three, stable_up_to_three]; constructor
  · intro h; exact Nat.le_antisymm h.2.2 h.1
  · intro h; subst h; exact ⟨Nat.le_refl 3, by decide, Nat.le_refl 3⟩

/-- THE WINDOW HAS ONE POINT. Three properties open at three and one closes above it. -/
theorem below_three_something_fails (d : Nat) (h : d < 3) : ¬ weight d ∧ ¬ waves d ∧ ¬ twoStatistics d := by
  rw [weight_from_three, waves_from_three, two_statistics_from_three]
  exact ⟨by omega, by omega, by omega⟩

/-- A line holds no orbit: there is no plane to turn in. -/
theorem a_line_holds_no_orbit : ¬ stableOrbits 1 := by
  rw [stable_up_to_three]; intro h; exact absurd h.1 (by decide)

theorem above_three_orbits_fail (d : Nat) (h : 3 < d) : ¬ stableOrbits d := by
  rw [stable_up_to_three]; intro h2; exact absurd h2.2 (by omega)

/-! ## Part III. Four more readings of the same dimension. -/

/-- DUALITY ONLY IN THREE. Light has d electric parts and d(d-1)/2 magnetic parts. Twice the one equals twice the
    other, in a space that has any dimension, in three only. -/
theorem duality_only_in_three (d : Nat) (hd : 0 < d) : 2 * d = d * (d - 1) ↔ d = 3 := by
  constructor
  · intro h
    have h1 : d * 2 = d * (d - 1) := by rw [Nat.mul_comm d 2]; exact h
    have h2 : 2 = d - 1 := Nat.eq_of_mul_eq_mul_left hd h1
    omega
  · intro h; subst h; rfl

/-- LIGHT AND GRAVITY AGREE ONLY IN THREE. Light has d - 1 polarizations and gravity (d+1)(d-2)/2. Twice the one
    equals twice the other, in a space that has any dimension, in three only. -/
theorem light_and_gravity_agree_only_in_three (d : Int) (hd : 0 < d) : 2 * (d - 1) = (d + 1) * (d - 2) ↔ d = 3 := by
  constructor
  · intro h
    have h1 : d * (d - 3) = 0 := by
      simp only [Int.mul_sub, Int.add_mul, Int.one_mul, Int.mul_one] at h ⊢; omega
    rcases Int.mul_eq_zero.mp h1 with h2 | h2 <;> omega
  · intro h; subst h; rfl

/-- The powers of mass carried by the square of a nuclear coupling. -/
def couplingDimension (d : Int) : Int := 3 - d

/-- THE COUPLING IS A PURE NUMBER ONLY IN THREE. -/
theorem pure_number_only_in_three (d : Int) : couplingDimension d = 0 ↔ d = 3 := by
  unfold couplingDimension; constructor <;> intro h <;> omega

/-- Space has one point of agreement: all nine readings above are true at three. -/
theorem every_reading_holds_at_three :
    weight 3 ∧ waves 3 ∧ bentTwice 3 ∧ stableOrbits 3 ∧ twoStatistics 3 ∧ power 3 = 2 ∧ 2 * 3 = 3 * (3 - 1) ∧
    couplingDimension 3 = 0 ∧ (2 : Int) * (3 - 1) = (3 + 1) * (3 - 2) :=
  ⟨(weight_from_three 3).mpr (Nat.le_refl 3), (waves_from_three 3).mpr (Nat.le_refl 3),
   (bent_twice_only_in_three 3).mpr rfl, (stable_up_to_three 3).mpr ⟨by decide, Nat.le_refl 3⟩,
   (two_statistics_from_three 3).mpr (Nat.le_refl 3), rfl, rfl, rfl, by decide⟩

end SPHYS.Dimension

#print axioms SPHYS.Dimension.weight_from_three
#print axioms SPHYS.Dimension.no_weight_in_the_plane
#print axioms SPHYS.Dimension.waves_from_three
#print axioms SPHYS.Dimension.two_polarizations_in_three
#print axioms SPHYS.Dimension.bent_twice_only_in_three
#print axioms SPHYS.Dimension.stable_up_to_three
#print axioms SPHYS.Dimension.inverse_square_only_in_three
#print axioms SPHYS.Dimension.two_statistics_from_three
#print axioms SPHYS.Dimension.three_and_no_other
#print axioms SPHYS.Dimension.weight_and_orbits_alone_give_three
#print axioms SPHYS.Dimension.waves_and_orbits_alone_give_three
#print axioms SPHYS.Dimension.statistics_and_orbits_alone_give_three
#print axioms SPHYS.Dimension.below_three_something_fails
#print axioms SPHYS.Dimension.a_line_holds_no_orbit
#print axioms SPHYS.Dimension.above_three_orbits_fail
#print axioms SPHYS.Dimension.duality_only_in_three
#print axioms SPHYS.Dimension.light_and_gravity_agree_only_in_three
#print axioms SPHYS.Dimension.pure_number_only_in_three
#print axioms SPHYS.Dimension.every_reading_holds_at_three
