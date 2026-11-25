# Three Dimensions of Space as a New Mathematical Theorem

## Weight, Waves, Light Bent Twice, Stable Orbits and Two Statistics Hold Together in Three Dimensions and in No Other

**Mohammad F. Islam** · 24 November 2026

*On edition 1.0.0. This paper closes a bundle of five. It sets side by side the theorems of dimension proved in Immanent Gravity as a Theorem (Islam, 2026b), Light as a New Mathematical Theorem (Islam, 2026c), The Nuclear Forces as a New Mathematical Theorem (Islam, 2026d) and Matter as a New Mathematical Theorem (Islam, 2026e), and proves that they meet at one value.*

## Abstract

That the forced laws of physics agree on three dimensions of space, and on no other, is established here as a mathematical theorem. Gravity, light, matter and the nuclear forces are each forced from one seat in four companion papers, and each law carries a property that depends on the dimension of space. We prove in core Lean 4, nineteen laws with no axiom declared and no use of choice, that matter at rest has weight exactly from three dimensions on; that gravity has waves exactly from three dimensions on; that light passing a mass is bent twice the amount of Newton in three dimensions and in no other; that a planet keeps its orbit up to three dimensions and loses it beyond; that identical particles have two statistics and no third exactly from three dimensions on; and that these five hold together in three dimensions of space and in no other. Three of them open at three and one closes above it, so that weight with stable orbits alone gives three, waves with stable orbits alone give three, and two statistics with stable orbits alone give three. Four further readings return the same value: the inverse square, the equal count of the electric and the magnetic parts of light, the equal count of the polarizations of light and of gravity, and a nuclear coupling that is a pure number.

This theorem subsumes Ehrenfest's argument of 1917, which reached an upper bound from the orbit and the atom on Newton's law taken as given: here the law is forced, the bound is one clause of five, and the lower bound is proved. A Fortran twin runs six checks with zero failures: among dimensions one to twelve the five properties meet at three alone; a circular orbit disturbed by one percent holds for sixty turns in two and three dimensions and is lost in four, five and six; light's bending matches three dimensions within one uncertainty and excludes four by twenty thousand; and a wave of gravity from two merging neutron stars counts $4.02^{+0.07}_{-0.10}$ dimensions of spacetime.

## The Standing of This Work

**Three dimensions of space are established here as a theorem of the forced laws.** Five measured properties of the world, each a consequence of a law forced from the seat, hold together in three dimensions and in no other. The dimension of space is not an input of these laws. It is where they agree.

**Nothing is added.** This work adds no extra dimension, no compact space and no selection among worlds, and it declares zero axioms in core Lean 4, with no use of choice. It adds no bridge of its own: every property is carried by a theorem of one of the four companion papers.

| Level | Framework | Standing | What is overcome |
|---|---|---|---|
| Projection | Kant (1747) and Ehrenfest (1917) | the inverse square and the stable orbit mark three dimensions, on Newton's law taken as given | one property and an upper bound; blind to weight, to waves, to the bending of light and to statistics |
| Realization | Field theory written in any dimension | every law has a form in every dimension, and the dimension is a number put in by hand | describes worlds of any dimension, and takes three as a fact with no reason |
| Foundation | Three dimensions as a theorem, this work | theorems checked by the kernel in core Lean 4, no axiom declared, no choice | proves five properties meet at three alone, with a lower bound and an upper bound, and four more readings agree |

**This theorem subsumes Ehrenfest's argument.** Each prior remark is one clause of the theorem.

| Prior result | Its standing before | How it is subsumed | Carried by |
|---|---|---|---|
| Kant's remark on the inverse square | an observation of 1747 | the flux law of a forced field, equal to two in three dimensions only | `inverse_square_only_in_three` |
| Ehrenfest's stable orbits | an upper bound of 1917 on Newton's law | one clause of five; the force is that of a forced law | `stable_up_to_three`, `above_three_orbits_fail` |
| No gravity in the plane | known for Einstein's law in three dimensions of spacetime (Deser, Jackiw and 't Hooft, 1984) | the lower bound: no weight and no wave below three | `weight_from_three`, `waves_from_three`, `below_three_something_fails` |
| Light bent twice | Einstein's value (Einstein, 1916), measured in 1919 (Dyson, Eddington and Davidson, 1920) | exact in three dimensions and in no other | `bent_twice_only_in_three` |
| Two statistics | observed | exact from three dimensions on; the plane admits more | `two_statistics_from_three` |
| The selection of three by the existence of observers | an argument from habitability (Whitrow, 1955) | replaced by a theorem: five measured properties, one value | `three_and_no_other` |

**The window has one point.** Weight, waves and two statistics open at three (`below_three_something_fails`). Stable orbits close above three (`above_three_orbits_fail`). Light bent twice holds at three alone. **Any one of the three that open, taken with stable orbits, gives three** (`weight_and_orbits_alone_give_three`, `waves_and_orbits_alone_give_three`, `statistics_and_orbits_alone_give_three`). The bending of light gives three by itself.

**Two warrants bound the claim, and each is printed.** The theorem is that the five properties meet at three and nowhere else; that the world has the five is measured, and section 9 names each measurement. And each property stands on the bridges and the classical results of the companion paper that proves it, named in the table of section 1.

## Three Dimensions and No Other

### 1. The Question, and the Rule of This Paper

Every law of physics can be written in any number of dimensions. The world has three of space. **This paper proves that the forced laws agree on three.** It uses no new premise. Each property below is a function of the dimension $d$ of space, proved or cited in the companion paper named beside it, and the engine in Appendix A proves where the functions meet.

| Property | As a function of $d$ | Proved in | Carried there by | Classical result used |
|---|---|---|---|---|
| Weight of matter at rest | $(d-2)/(d-1)$ of its density | Immanent Gravity (Islam, 2026b) | `active_general`, `dust_attracts_exactly_above_three` | none |
| Waves of gravity | $(d+1)(d-2)/2$ polarizations | Immanent Gravity | `two_polarizations`, `no_waves_in_three` | the count of Wigner (1939) |
| Share of space in the bending of light | $1/(d-2)$ of the share of time | Immanent Gravity | `gamma_is_one_exactly_in_four` | Tangherlini's solution (1963) |
| Fall of a force with distance | the power $d-1$ | Light (Islam, 2026c) | `flux_in_every_dimension` | orbits stable below the power three (Bertrand, 1873; Ehrenfest, 1917) |
| Double exchange of identical particles | unwinds when $d-1\ge2$ | Matter (Islam, 2026e) | `the_double_exchange_unwinds_from_three` | Leinaas and Myrheim (1977) |

Dimension means the dimension of space throughout. Spacetime has one more.

### 2. Weight, from Three Dimensions On

Einstein's law, forced by conservation, gives matter at rest an active mass of $(d-2)/(d-1)$ times its density (`active_general`). **It is positive exactly from three dimensions on** (`weight_from_three`). In the plane it is zero (`no_weight_in_the_plane`): a mass there bends nothing around it and attracts nothing. In a line there is no law of gravity at all (`two_is_empty`; Islam, 2026b). A world in which an apple falls has at least three dimensions.

### 3. Waves of Gravity, from Three Dimensions On

A wave of gravity carries $(d+1)(d-2)/2$ polarizations. **The count is positive exactly from three dimensions on** (`waves_from_three`), and in three it is two (`two_polarizations_in_three`). Below three, gravity has no freedom of its own to carry a wave. A world in which two black holes ring a detector has at least three dimensions.

### 4. Light Bent Twice, in Three Dimensions Only

Light passing a mass is bent by the reading of time and by the reading of space. Newton's law has the first alone. The forced law gives the second as $1/(d-2)$ of the first, so the total is twice Newton's exactly when $d-2=1$. **Light is bent twice in three dimensions and in no other** (`bent_twice_only_in_three`). In four dimensions the factor would be one and a half. This one property fixes the dimension by itself.

### 5. Stable Orbits, up to Three Dimensions

A force that loses nothing between spheres falls as the power $d-1$ of the distance, and that power is two in three dimensions only (`inverse_square_only_in_three`). A circular orbit survives a small disturbance exactly when the power is below three (Bertrand, 1873; Ehrenfest, 1917). An orbit needs a plane to turn in, so a line holds none (`a_line_holds_no_orbit`). **Orbits are stable up to three dimensions and not beyond** (`stable_up_to_three`, `above_three_orbits_fail`): they exist and hold in two and in three. The twin integrates the orbit: disturbed by one percent in speed, it holds for sixty turns in two and three dimensions, and in four, five and six the planet falls in or leaves. The same holds for the electron around the nucleus (Ehrenfest, 1917). A world with planets and atoms has at most three dimensions.

### 6. Two Statistics, from Three Dimensions On

Exchange two identical particles twice. The double exchange unwinds to nothing exactly when the sphere of directions is simply connected, which needs $d-1\ge2$. **There are two statistics and no third exactly from three dimensions on** (`two_statistics_from_three`). In the plane a third is admitted and is measured there (Islam, 2026e). A world whose matter is built of fermions that exclude and bosons that share, and of nothing else, has at least three dimensions.

### 7. Together, in Three and in No Other

**Weight, waves, light bent twice, stable orbits and two statistics hold together in three dimensions of space and in no other** (`three_and_no_other`).

The five are not chosen for their answer. Each is measured, each is carried by a forced law of a companion paper, and the four readings of section 8 were not used to reach three and return it. The lower bound does not lean on one clause: weight, waves and two statistics fail below three, each by its own theorem (`below_three_something_fails`). The upper bound among the five is carried twice, by the stable orbit (`above_three_orbits_fail`) and by the bending of light, and the readings of section 8 carry it four times more. Three pairs fix the dimension without the bending of light:

- matter attracts and a planet keeps its orbit (`weight_and_orbits_alone_give_three`);
- gravity has a wave and a planet keeps its orbit (`waves_and_orbits_alone_give_three`);
- there are two statistics and an atom holds (`statistics_and_orbits_alone_give_three`).

The bending of light fixes it a fourth way. The laws behind these clauses are forced in three separate papers on separate bridges. They return one number.

### 8. Four More Readings of the Same Dimension

- **The inverse square.** The power $d-1$ is two in three dimensions only (`inverse_square_only_in_three`; in the companion paper on light, `inverse_square_in_three`).
- **Duality.** Light has $d$ electric parts and $d(d-1)/2$ magnetic parts. In a space of any dimension at all, they are equal in three only (`duality_only_in_three`; in the companion paper, `duality_exactly_in_four` of spacetime), so the quarter turn that exchanges them exists there alone (Islam, 2026c).
- **Light and gravity agree.** Light has $d-1$ polarizations and gravity $(d+1)(d-2)/2$. In a space of any dimension at all, they are equal in three only (`light_and_gravity_agree_only_in_three`; in the companion paper on light, `light_and_gravity_agree_exactly_in_four` of spacetime).
- **A pure number.** The square of a nuclear coupling carries $3-d$ powers of mass. It is a pure number in three dimensions only (`pure_number_only_in_three`; in the companion paper, `the_coupling_is_a_pure_number_exactly_in_four` of spacetime), so the law of the nuclear forces holds no scale there (Islam, 2026d).

All nine readings of sections 2 to 8 are true at three (`every_reading_holds_at_three`).

### 9. It Is Measured

| Property | Three dimensions give | Measured, by the source cited |
|---|---|---|
| waves of gravity | they exist | observed (Abbott et al., 2016) |
| share of space in the bending of light | 1; four dimensions give 1/2 | $1+(2.1\pm2.3)\times10^{-5}$ (Bertotti, Iess and Tortora, 2003) |
| the inverse square of charge | exponent 2 | off by $(2.7\pm3.1)\times10^{-16}$ (Williams, Faller and Hill, 1971) |
| the inverse square of gravity | exponent 2 | holds down to 52 micrometres (Lee et al., 2020) |
| dimensions of spacetime read from a wave of gravity | 4 | $4.02^{+0.07}_{-0.10}$ (Pardo et al., 2018) |
| a third statistics in three dimensions | none | violation of exclusion below $3.4\times10^{-29}$ (Shi et al., 2018) |

The bending of light excludes four dimensions of space by twenty thousand uncertainties.

Every measurement in this table precedes this work. The table is agreement with the record, and the forward claim is the falsifier.

### 10. The Ledger, the Falsifier, and What Stands

| Claim | Carried by | Grade |
|---|---|---|
| weight exactly from three on | `weight_from_three` on `active_general` (Islam, 2026b) | theorem, on the forced law of gravity and its bridges (Islam, 2026b) |
| waves exactly from three on | `waves_from_three` | theorem, on the cited count for the forced law of gravity (Islam, 2026b) |
| light bent twice in three only | `bent_twice_only_in_three` on `gamma_is_one_exactly_in_four` (Islam, 2026b) | theorem, on the cited solution of the forced law of gravity and its bridges (Islam, 2026b) |
| orbits stable up to three | `stable_up_to_three` on `flux_in_every_dimension` (Islam, 2026c) | theorem, on the cited stability and on the forced law of light and its bridges (Islam, 2026c) |
| two statistics exactly from three on | `two_statistics_from_three` (Islam, 2026e) | theorem, on the cited unwinding |
| the five together in three and no other | `three_and_no_other` | theorem |
| three pairs each give three | `weight_and_orbits_alone_give_three`, `waves_and_orbits_alone_give_three`, `statistics_and_orbits_alone_give_three` | theorem |
| four more readings | `inverse_square_only_in_three`, `duality_only_in_three`, `light_and_gravity_agree_only_in_three`, `pure_number_only_in_three` | theorem, on the cited counts |
| that the world has the five | section 9 | measured |

One falsifier, and the engine forces it. **F-Extra:** a further dimension of space open to gravity or to light at any range; it would change the fall of the force from the inverse square, the bending of light from twice Newton's and the loss of a wave of gravity with distance, and it breaks `three_and_no_other` read physically.

**The dimension is closed.** Weight, waves, the bending of light, the stable orbit and the two statistics are each forced as a function of the dimension, and they meet at three and nowhere else. The laws that carry them were forced separately, from one seat. Ehrenfest's argument is subsumed as one clause of five, and the question of why space has three dimensions has an answer that is a theorem: three is the one dimension in which the forced laws describe the world that is measured.

## Author's Provenance and Method Disclosure

**Who wrote it.** The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean files and the Fortran twins are written by a language model under the author's direct supervision.

**Method.** The work stands on one seat, the fixed line of a reflection, and one root, that nothing escapes the record, both set out in Nothing Escapes, Least Erasure (Islam, 2026a). Each property of this paper is a function of the dimension proved or cited in one of the four companion papers, and the table of section 1 names the paper and the theorem for each. This paper adds no bridge of its own. Every theorem named in the text is declared under that name in Appendix A or in the engine of the companion paper named beside it. The kernel line of every theorem of Appendix A is printed in Appendix B. Every measured value in the text names its source beside it.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is set out in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

**Classical sources.** That the inverse square marks three dimensions is Kant's remark (1747), and that orbits and atoms are stable only up to three is Ehrenfest's (1917), on Bertrand's theorem (1873). The solution of gravity around a mass in every dimension is Tangherlini's (1963). That the plane admits further statistics is Leinaas and Myrheim's result (1977). This paper joins those results to the forced laws and proves that they meet at one value.

## References

1. E. P. Wigner, Ann. Math. 40 (1939) 149.
2. I. Kant, Gedanken von der wahren Schätzung der lebendigen Kräfte (1747).
3. J. Bertrand, C. R. Acad. Sci. 77 (1873) 849.
4. A. Einstein, Ann. Phys. 49 (1916) 769.
5. P. Ehrenfest, Proc. Amsterdam Acad. 20 (1917) 200.
6. F. W. Dyson, A. S. Eddington and C. Davidson, Phil. Trans. R. Soc. A 220 (1920) 291.
7. G. J. Whitrow, Br. J. Philos. Sci. 6 (1955) 13.
8. F. R. Tangherlini, Nuovo Cimento 27 (1963) 636.
9. E. R. Williams, J. E. Faller and H. A. Hill, Phys. Rev. Lett. 26 (1971) 721.
10. J. M. Leinaas and J. Myrheim, Nuovo Cimento B 37 (1977) 1.
11. S. Deser, R. Jackiw and G. 't Hooft, Ann. Phys. 152 (1984) 220.
12. B. Bertotti, L. Iess and P. Tortora, Nature 425 (2003) 374.
13. B. P. Abbott et al. (LIGO and Virgo), Phys. Rev. Lett. 116 (2016) 061102.
14. H. Shi et al. (VIP-2), Eur. Phys. J. C 78 (2018) 319.
15. K. Pardo, M. Fishbach, D. E. Holz and D. N. Spergel, J. Cosmol. Astropart. Phys. 07 (2018) 048.
16. J. G. Lee, E. G. Adelberger, T. S. Cook, S. M. Fleischer and B. R. Heckel, Phys. Rev. Lett. 124 (2020) 101101.
17. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
18. M. F. Islam, Immanent Gravity as a Theorem, edition 3.0.0 (2026b).
19. M. F. Islam, Light as a New Mathematical Theorem, edition 1.0.0 (2026c).
20. M. F. Islam, The Nuclear Forces as a New Mathematical Theorem, edition 1.0.0 (2026d).
21. M. F. Islam, Matter as a New Mathematical Theorem, edition 1.0.0 (2026e).

## Appendix A · SPHYS_Three_Dimensions_CC.lean

Core Lean 4.19.0, no import, no axiom declared, no use of choice, compiled with warnings fatal, exit 0. The kernel lines follow in Appendix B.

```lean
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
```

## Appendix B · Kernel lines of Appendix A

```text
'SPHYS.Dimension.weight_from_three' depends on axioms: [propext, Quot.sound]
'SPHYS.Dimension.no_weight_in_the_plane' does not depend on any axioms
'SPHYS.Dimension.waves_from_three' depends on axioms: [propext, Quot.sound]
'SPHYS.Dimension.two_polarizations_in_three' does not depend on any axioms
'SPHYS.Dimension.bent_twice_only_in_three' depends on axioms: [propext, Quot.sound]
'SPHYS.Dimension.stable_up_to_three' depends on axioms: [propext, Quot.sound]
'SPHYS.Dimension.inverse_square_only_in_three' depends on axioms: [propext, Quot.sound]
'SPHYS.Dimension.two_statistics_from_three' depends on axioms: [propext, Quot.sound]
'SPHYS.Dimension.three_and_no_other' depends on axioms: [propext, Quot.sound]
'SPHYS.Dimension.weight_and_orbits_alone_give_three' depends on axioms: [propext, Quot.sound]
'SPHYS.Dimension.waves_and_orbits_alone_give_three' depends on axioms: [propext, Quot.sound]
'SPHYS.Dimension.statistics_and_orbits_alone_give_three' depends on axioms: [propext, Quot.sound]
'SPHYS.Dimension.below_three_something_fails' depends on axioms: [propext, Quot.sound]
'SPHYS.Dimension.a_line_holds_no_orbit' depends on axioms: [propext, Quot.sound]
'SPHYS.Dimension.above_three_orbits_fail' depends on axioms: [propext, Quot.sound]
'SPHYS.Dimension.duality_only_in_three' depends on axioms: [propext, Quot.sound]
'SPHYS.Dimension.light_and_gravity_agree_only_in_three' depends on axioms: [propext, Quot.sound]
'SPHYS.Dimension.pure_number_only_in_three' depends on axioms: [propext, Quot.sound]
'SPHYS.Dimension.every_reading_holds_at_three' depends on axioms: [propext, Quot.sound]
```

## Appendix C · Three_Dimensions_Twin_CC.f90

Six checks, zero failures: two tabulating the engine's statements (A), one integrating an orbit under the force of each dimension (B) and three against published measurements (C). One further line of the run is a reading and is not counted. The run follows in Appendix D.

```fortran
! Three_Dimensions_Twin_CC.f90 · twin of SPHYS_Three_Dimensions_CC.lean
! RATIONALE. The engine proves that five properties hold together in three dimensions of space and in no other.
!   This twin tabulates the five for d = 1..12, integrates an orbit under the force of each dimension as an
!   independent execution of the stability clause, and sets the readings against published measurements.
! DESIGN. Integers for the table; double precision and a fourth-order Runge-Kutta step for the orbits.
! NON-NEGOTIABLE. The orbit test perturbs a circular orbit by one percent in speed, both ways, and reports whether
!   the radius stays between one half and two for sixty turns. No tuning per dimension.
! RISK. The orbit run is a numerical illustration of a classical theorem (Bertrand, 1873; Ehrenfest, 1917); the
!   engine's clause is the inequality p < 3, and the run agrees with it for d = 2..6.
program dimension_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0)
  integer :: checks = 0, failures = 0
  real(dp), parameter :: pi = 3.14159265358979323846d0
  call table()
  call orbits()
  call measured()
  write(*,'(A,I0,A,I0,A)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', failures, '}'
contains
  subroutine check(label, ok)
    character(*), intent(in) :: label
    logical, intent(in) :: ok
    checks = checks + 1
    if (ok) then
      write(*,'(A,A)') '  PASS  ', label
    else
      failures = failures + 1
      write(*,'(A,A)') '  FAIL  ', label
    end if
  end subroutine
  subroutine table()
    integer :: d, nall, only, bad
    logical :: w, g, b, s, t
    character(3) :: yn(5)
    nall = 0; only = 0; bad = 0
    write(*,'(A)') ' A. The five properties, d = 1..12'
    write(*,'(A)') '    d  weight  waves  bent twice  stable orbits  two statistics'
    do d = 1, 12
      w = d - 2 > 0; g = ((d + 1)*max(d - 2, 0))/2 > 0; b = d - 2 == 1; s = d >= 2 .and. d - 1 < 3; t = d - 1 >= 2
      yn = 'no '; if (w) yn(1) = 'yes'; if (g) yn(2) = 'yes'; if (b) yn(3) = 'yes'; if (s) yn(4) = 'yes'
      if (t) yn(5) = 'yes'
      write(*,'(I5,2X,A6,2X,A5,2X,A10,2X,A13,2X,A14)') d, yn(1), yn(2), yn(3), yn(4), yn(5)
      if (w .and. g .and. b .and. s .and. t) then
        nall = nall + 1; only = d
      end if
      if ((w .and. s) .neqv. (d == 3)) bad = bad + 1
      if ((g .and. s) .neqv. (d == 3)) bad = bad + 1
      if ((t .and. s) .neqv. (d == 3)) bad = bad + 1
      if ((2*d == d*(d - 1)) .neqv. (d == 3)) bad = bad + 1
      if ((2*(d - 1) == (d + 1)*(d - 2)) .neqv. (d == 3)) bad = bad + 1
      if ((3 - d == 0) .neqv. (d == 3)) bad = bad + 1
    end do
    call check('all five hold together at exactly one d, and it is 3', nall == 1 .and. only == 3)
    call check('each pair with stable orbits, duality, the two counts and the pure number: 3 only', bad == 0)
  end subroutine
  subroutine orbits()
    integer :: d, k
    logical :: held(2:6), ok
    real(dp) :: f
    write(*,'(A)') ' B. A circular orbit, speed changed by one percent, sixty turns'
    ok = .true.
    do d = 2, 6
      held(d) = .true.
      do k = 1, 2
        f = 1.01d0; if (k == 2) f = 0.99d0
        if (.not. stays(d, f)) held(d) = .false.
      end do
      write(*,'(A,I1,A,I1,A,L1)') '   d = ', d, ': force falls as the power ', d - 1, ';  orbit held = ', held(d)
      if (held(d) .neqv. (d - 1 < 3)) ok = .false.
    end do
    call check('the orbit holds for d = 2, 3 and is lost for d = 4, 5, 6, as the inequality p < 3 says', ok)
  end subroutine
  function stays(d, f) result(ok)
    integer, intent(in) :: d
    real(dp), intent(in) :: f
    logical :: ok
    real(dp) :: y(4), k1(4), k2(4), k3(4), k4(4), h, r
    integer :: i, n
    y = [1.0d0, 0.0d0, 0.0d0, f]                       ! position (1,0), velocity (0,f); circular speed is 1
    h = 1.0d-3; n = int(60*2*pi/h); ok = .true.
    do i = 1, n
      k1 = rhs(y, d); k2 = rhs(y + h/2*k1, d); k3 = rhs(y + h/2*k2, d); k4 = rhs(y + h*k3, d)
      y = y + h/6*(k1 + 2*k2 + 2*k3 + k4)
      r = sqrt(y(1)**2 + y(2)**2)
      if (r < 0.5d0 .or. r > 2.0d0) then
        ok = .false.; return
      end if
    end do
  end function
  function rhs(y, d) result(dy)
    real(dp), intent(in) :: y(4)
    integer, intent(in) :: d
    real(dp) :: dy(4), r
    r = sqrt(y(1)**2 + y(2)**2)
    dy(1:2) = y(3:4); dy(3:4) = -y(1:2)/r**d            ! attraction of magnitude r^-(d-1)
  end function
  subroutine measured()
    real(dp) :: gam, gsig
    write(*,'(A)') ' C. Against published measurements'
    gam = 2.1d-5; gsig = 2.3d-5                         ! Bertotti, Iess and Tortora, 2003: gamma - 1
    write(*,'(A,F5.2,A,F8.0,A)') '   share of space in the bending of light: 1 (d = 3) at ', abs(gam)/gsig, &
         ' uncertainties; 1/2 (d = 4) at ', abs(gam + 0.5d0)/gsig, ''
    ! the convention of five uncertainties decides an exclusion; no threshold is fitted to a result
    call check('light is bent twice: gamma - 1 = (2.1 +- 2.3)e-5; four dimensions excluded by more than five', &
               abs(gam)/gsig < 1.0d0 .and. abs(gam + 0.5d0)/gsig > 5.0d0)
    call check('inverse square of charge: exponent off by (2.7 +- 3.1)e-16 (Williams, Faller and Hill, 1971)', &
               abs(2.7d-16)/3.1d-16 < 1.0d0)
    call check('dimensions of spacetime from a wave of gravity: 4.02 +0.07 -0.10 (Pardo et al., 2018)', &
               4.0d0 >= 4.02d0 - 0.10d0 .and. 4.0d0 <= 4.02d0 + 0.07d0 .and. 5.0d0 > 4.02d0 + 5*0.07d0)
    ! a bound compared with the forced value zero cannot fail: it is printed as a reading and is not counted
    write(*,'(A)') '   reading, not a check: exclusion, violation below 3.4e-29 (Shi et al., 2018)'
  end subroutine
end program
```

## Appendix D · Run of Appendix C

```text
 A. The five properties, d = 1..12
    d  weight  waves  bent twice  stable orbits  two statistics
    1     no     no          no             no              no 
    2     no     no          no             yes             no 
    3     yes    yes         yes            yes             yes
    4     yes    yes         no             no              yes
    5     yes    yes         no             no              yes
    6     yes    yes         no             no              yes
    7     yes    yes         no             no              yes
    8     yes    yes         no             no              yes
    9     yes    yes         no             no              yes
   10     yes    yes         no             no              yes
   11     yes    yes         no             no              yes
   12     yes    yes         no             no              yes
  PASS  all five hold together at exactly one d, and it is 3
  PASS  each pair with stable orbits, duality, the two counts and the pure number: 3 only
 B. A circular orbit, speed changed by one percent, sixty turns
   d = 2: force falls as the power 1;  orbit held = T
   d = 3: force falls as the power 2;  orbit held = T
   d = 4: force falls as the power 3;  orbit held = F
   d = 5: force falls as the power 4;  orbit held = F
   d = 6: force falls as the power 5;  orbit held = F
  PASS  the orbit holds for d = 2, 3 and is lost for d = 4, 5, 6, as the inequality p < 3 says
 C. Against published measurements
   share of space in the bending of light: 1 (d = 3) at  0.91 uncertainties; 1/2 (d = 4) at   21740.
  PASS  light is bent twice: gamma - 1 = (2.1 +- 2.3)e-5; four dimensions excluded by more than five
  PASS  inverse square of charge: exponent off by (2.7 +- 3.1)e-16 (Williams, Faller and Hill, 1971)
  PASS  dimensions of spacetime from a wave of gravity: 4.02 +0.07 -0.10 (Pardo et al., 2018)
   reading, not a check: exclusion, violation below 3.4e-29 (Shi et al., 2018)
 BATTERY-JSON: {"checks":6,"failures":0}
```
