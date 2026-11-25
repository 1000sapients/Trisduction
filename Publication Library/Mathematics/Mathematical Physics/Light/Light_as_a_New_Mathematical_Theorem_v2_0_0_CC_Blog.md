# Light as a New Mathematical Theorem

## Maxwell’s Equations Forced by the Conservation of Charge, Coulomb’s Law as Their Half-Reading, and Two Helicities with No Third

**Mohammad F. Islam PhD** · 25 November 2026

*Blog edition of the master, edition 2.0.0 of 25 November 2026. It renders the whole text. The printed files of the appendices stand in the master and in the Journal edition, and are listed at the end.*

## Abstract

This paper proves, in Lean 4 with Mathlib, that the conservation of charge forces Maxwell’s equations. An arena is a commutative ring with one linear map for each direction; the maps commute and obey the rule of the product, and they are the partial derivatives. A potential is a family of elements of the ring, and the law is the linear law of second order built from it with constant coefficients and no direction preferred, which has three constants: *a* on the wave operator, *b* on the gradient of the divergence, and *m* on the potential itself. Nothing else is assumed: no field strength, no gauge invariance and no vanishing mass. The main theorem states: if the source the law defines is conserved for every potential, in every arena of four directions with one time, then *b* =  − *a* and *m* = 0. The forced law is *a* times the divergence of the field: Maxwell’s equations with sources. The equations without sources hold for every potential. The law is then unchanged by every gauge turn, and the constant on the potential, the mass of the photon, is zero; both are consequences and neither is entered. For a plane wave the divergence of the field is (*k*⋅*k*) *ε* − (*k*⋅*ε*) *k* times the profile, so a wave off the null cone has no field, and a wave on it is transverse. Along a null vector written in adapted directions, in any number of dimensions, the fields of the waves form a space whose dimension is the number of directions across the wave: all directions less two. In four dimensions that is two, and there is no third. For a potential that does not change in time the forced law is the wave operator on its one component, and for a radial field that is a power *c* of the distance in *d* dimensions of space the divergence is *d* + *c* times that power: free of sources for one power only, which in three dimensions is the inverse square. A Fortran twin executes the divergence of the law on two hundred random waves for each of the 1331 laws with whole constants from  − 5 to 5 and finds eleven conserved, those of the theorem; counts the waves along random null vectors in three to seven dimensions; differentiates radial fields numerically; and sets the forced law against measurement: the exponent of the static law, the constant of thermal radiation with a rival of three waves excluded, and the speed of gravity against that of light. That charge is conserved whatever the field does is the one premise, and it is one field of one printed structure. Part II carries the reading of light and of electromagnetism from which the paper takes its place in the series, at premise grade and apart from the machine-checked claims.

## 1. The Theorem and What It Rests On

### 1.1 The statement

Let ∂_(μ) be linear maps on a commutative ring, one for each direction *μ*, that commute and obey the rule of the product, and let *η*_(μ) be signs. For a potential *A*_(ν) the field, the wave operator and the divergence are

*F*_(μν) = ∂_(μ)*A*_(ν) − ∂_(ν)*A*_(μ),   □ = ∑_(μ)*η*_(μ) ∂_(μ)∂_(μ),   ∂ ⋅ *A* = ∑_(μ)*η*_(μ) ∂_(μ)*A*_(μ).

The linear law of second order built from the potential alone, with constant coefficients and no direction preferred, has three constants *a*, *b* and *m*:

*J*_(ν) = *a* □*A*_(ν) + *b* ∂_(ν)(∂⋅*A*) + *m* *A*_(ν).

**Theorem (`divergence_of_the_law`).** For every potential, ∑_(ν)*η*_(ν) ∂_(ν)*J*_(ν) = (*a*+*b*) □(∂⋅*A*) + *m* (∂⋅*A*).

**Theorem (`maxwell_forced`).** On the premises below, *b* =  − *a* and *m* = 0.

**Theorem (`the_forced_law_is_maxwell`).** On the premises below, in every arena, *J*_(ν) = *a*∑_(μ)*η*_(μ) ∂_(μ)*F*_(μν).

**Theorem (`gauge_forced`).** On the premises below, *m* = 0, and the law is the same for *A*_(ν) and for *A*_(ν) + ∂_(ν)*χ*, for every *χ*.

**Theorem (`two_helicities_and_no_third`).** In four dimensions the fields of the waves along one null vector form a space of dimension two.

The law is the one Maxwell wrote \[1\]. No coupling is fixed by the theorems: the constant *a* is free. The premises are met: `maxwellPremises` constructs a term of the structure for every *a* that is not zero.

### 1.2 The premises, printed

The physical premises of the paper are the fields of this structure of the Lean file, and there are no others. What is cited is in the tables of Section 1.3.

``` lean
structure Premises where
  a : ℚ
  b : ℚ
  m : ℚ
  weight : a ≠ 0
  conserved : ∀ (R : Type) [CommRing R] [Algebra ℚ R] (S : Arena ℚ (Fin 4) R) (A : Fin 4 → R),
    ∑ ν, eta4 ν • S.d ν (law S eta4 a b m A ν) = 0
```

It carries one premise, the field `conserved`: the source that the law defines has no divergence, whatever the potential, in every arena of four directions with signs (+,−,−,−). The field `weight` says only that the law has a term of second order; no theorem uses it. The constants are rational numbers. No field of `Premises` states a relation among the constants, a field strength, a gauge, or the conclusion of any theorem. Section 9 states where the premise comes from.

### 1.3 What is proved, what is cited, what is assumed

- **The field is antisymmetric, obeys the equations without sources, and is kept by a gauge turn** · Standing: Proved, in every arena; Where: Appendix A, Part I
- **The divergence of the field is the wave operator on the potential less the gradient of its divergence** · Standing: Proved; Where: Part I
- **The divergence of the general law is (*a*+*b*) □(∂⋅*A*) + *m* (∂⋅*A*)** · Standing: Proved; Where: Part II
- **Under a gauge turn the law changes by (*a*+*b*) ∂_(ν)□*χ* + *m* ∂_(ν)*χ** · Standing: Proved; Where: Part II
- **Conservation for every potential in every arena of four directions forces *b* =  − *a* and *m* = 0** · Standing: Proved, over the rational numbers, with an explicit arena and potential; Where: Part III

The table continues with the waves, the static half and the premises.

- **For a plane wave the divergence of the field is (*k*⋅*k*) *ε* − (*k*⋅*ε*) *k* times the profile** · Standing: Proved, in every arena over a field; Where: Part IV
- **Off the null cone a solution has no field; on it, it is transverse** · Standing: Proved; Where: Part IV
- **Along a null vector in adapted directions the fields of the waves form a space of dimension *n* − 2; in four dimensions, two** · Standing: Proved, over every field; Where: Part IV
- **A static potential along the time: the forced law is *a* times the wave operator on it, and zero along space** · Standing: Proved; Where: Part V
- **A radial field of power *c* in *d* dimensions has divergence *d* + *c* times the power; its square falls as the power 2 + 2*c*; in three dimensions the inverse square is free of sources** · Standing: Proved, for elements of an arena that obey the stated relations; Where: Part V
- **On the premises: Maxwell’s law, no mass, gauge invariance; the premises are met** · Standing: Proved; Where: Part VI

What is not machine-checked is in the third table.

- **Charge is conserved whatever the field does** · Standing: Premise; the measured bound is \[10\]; Where: Sections 4, 9
- **A linear law of at most second order, built from the potential alone with constant coefficients and no direction preferred, has the three terms of Section 1.1** · Standing: Classical, not formalised; Where: Sections 1.1, 2
- **The static field of a point is radial, with a size that depends on the distance alone** · Standing: Symmetry, entered; Where: Section 6
- **The relations of the radial theorems are met by the powers of the distance on space less a point** · Standing: Elementary analysis, not formalised; executed by the twin; Where: Sections 6, 8
- **The two states of a wave are the two helicities** · Standing: Classical reading, cited: \[5\]; Where: Section 5
- **A field of *n* dimensions has *n* − 1 electric and (*n*−1)(*n*−2)/2 magnetic components; gravity has *n*(*n*−3)/2 waves** · Standing: Classical counts, entered; the theorems of Part VII are arithmetic on them; Where: Section 7
- **Waves of gravity travel on the same cone** · Standing: Cited: \[16\]; Where: Sections 5, 8
- **The formulas and measured values of the twin: the constant of thermal radiation \[12\], and \[7, 8, 9, 10, 11\]** · Standing: Entered from the literature; numerical, not machine-checked; Where: Section 8

The paper claims as machine-checked the rows marked proved and no others. A row marked cited is a result with a published proof that this work has not machine-checked. A row marked entered is a classical formula or a measured value used by the numerical twin or by an arithmetic theorem; no theorem of Sections 3 to 6 rests on it. Part II, the reading, is outside these tables: it is premise-grade and is labelled so where it begins.

## 2. Fields as Algebra

A law for a field needs fields that can be added, multiplied and differentiated. A commutative ring with linear maps that commute and obey the rule of the product is exactly this, and it is what the file of Appendix A formalises as the structure `Arena`, in the kernel of Lean 4 \[14\] on the library Mathlib \[13\]. Working at this level has a cost and a gain. The cost is that no space of functions, no topology and no integral is constructed. The gain is that every theorem holds in every arena, the smooth functions on any open set of spacetime included, and for every number of directions and every choice of signs, so nothing proved in Sections 3 and 5 is special to four dimensions until a number is counted.

The definitions `F`, `box`, `div`, `source` and `law` are the field, the wave operator, the divergence, the divergence of the field, and the law of Section 1.1. One name needs a word. In the text the source is *J*_(ν), what the law equals. The file gives the name `source` to the divergence of the field, which on the forced law is the source divided by *a*. The constants of the law are arbitrary. Nothing ties them until Section 4. That the three terms of `law` are all the terms such a law can have is the classical count of the ways to build a vector from two derivatives and a potential with no direction preferred; it is not formalised, and the theorems are about the law as defined.

## 3. The Field and the Law

Nothing in this section is assumed. Each statement is a theorem of Appendix A.

**The equations without sources (`F_antisymm`, `homogeneous`).** The field is antisymmetric, and ∂_(λ)*F*_(μν) + ∂_(μ)*F*_(νλ) + ∂_(ν)*F*_(λμ) = 0 for every potential. These are two of Maxwell’s four equations, and they are identities.

**A gauge turn keeps the field (`gauge_keeps_the_field`).** The potentials *A*_(ν) and *A*_(ν) + ∂_(ν)*χ* have the same field.

**The divergence of the field (`source_eq`, `law_one`, `forced_law_is_a_source`).** ∑_(μ)*η*_(μ) ∂_(μ)*F*_(μν) = □*A*_(ν) − ∂_(ν)(∂⋅*A*). It is the law with constants 1,  − 1 and 0, and the law with constants *a*,  − *a* and 0 is *a* times it, in every arena.

**The divergence of the law (`divergence_of_the_law`).** For every potential and all three constants, ∑_(ν)*η*_(ν) ∂_(ν)*J*_(ν) = (*a*+*b*) □(∂⋅*A*) + *m* (∂⋅*A*). The proof moves the derivative through the wave operator (`box_d`), which the commuting of the maps allows.

**The law under a gauge turn (`the_law_under_a_gauge_turn`).** Replacing *A*_(ν) by *A*_(ν) + ∂_(ν)*χ* adds (*a*+*b*) ∂_(ν)□*χ* + *m* ∂_(ν)*χ* to the law. The same two combinations of constants govern conservation and the gauge.

## 4. Conservation Forces the Law

**The identity (`conservation_identity`, `the_source_is_conserved`).** With *b* =  − *a* and *m* = 0 the divergence of the law is zero for every potential. In particular the divergence of the divergence of the field is zero.

**The forcing (`conservation_in_four_dimensions_forces_the_law`).** The converse needs an arena in which the two terms of the divergence can be told apart. The file builds one, `timeArena`: four directions, the fields the polynomials in the time over the rational numbers, the first map the derivative and the other three zero. On it the potential `probe`, the cube of the time along the time, has divergence 3*t*² (`probe_divergence`), and the wave operator on that is 6 (`probe_wave`). Conservation on this one potential reads 6(*a*+*b*) + 3*m* *t*² = 0 as polynomials, so *m* = 0 and *a* + *b* = 0. Hence if the source is conserved for every potential in every arena of four directions with one time, *b* =  − *a* and *m* = 0.

**On the premises (`maxwell_forced`, `the_forced_law_is_maxwell`).** The premise is that conservation. So the law is *a* times the divergence of the field: *a*∑_(μ)*η*_(μ) ∂_(μ)*F*_(μν) = *J*_(ν). With the equations without sources of Section 3, these are Maxwell’s equations.

**No mass, and the gauge (`gauge_forced`, `gauge_invariance_is_a_consequence`).** The constant *m* is the square of the mass of the quantum of the field, in the law of Proca \[4\]. It is zero on the premises. And the law is the same after every gauge turn, by Section 3. Gauge invariance is here a consequence of the conservation of charge and is not assumed; that the two go together is classical \[3, 6\], and here the direction from conservation to the gauge compiles.

**A limit of scope.** The arena of the forcing has fields that depend on time alone. The premise quantifies over every arena of four directions, and this is one of them. A premise that asked conservation only in arenas with a richer dependence would need another witness; the identity of Section 3 shows which one, any potential whose divergence and its wave operator are independent.

## 5. Waves

**A plane wave (`plane_wave`).** Let a profile *φ*₀ have derivatives along a vector *k* of constants: ∂_(μ)*φ*₀ = *k*_(μ)*φ*₁ and ∂_(μ)*φ*₁ = *k*_(μ)*φ*₂. For the potential *ε*_(ν)*φ*₀, with *ε* a polarization of constants,

∑_(μ)*η*_(μ) ∂_(μ)*F*_(μν) = ((*k*⋅*k*) *ε*_(ν) − (*k*⋅*ε*) *k*_(ν)) *φ*₂,   *k* ⋅ *ε* = ∑_(μ)*η*_(μ)*k*_(μ)*ε*_(μ).

**Off the cone there is no wave (`off_the_cone_is_pure_gauge`).** If *k* ⋅ *k* ≠ 0 and the bracket vanishes, the field *k*_(μ)*ε*_(ν) − *k*_(ν)*ε*_(μ) of the wave is zero: the polarization is a multiple of *k*, a gauge turn. Light travels on the null cone and nowhere else. The waves of gravity travel on the same cone \[16\].

**On the cone the wave is transverse (`on_the_cone_the_wave_is_transverse`).** If *k* ⋅ *k* = 0 and *k* is not zero, the bracket vanishes exactly when *k* ⋅ *ε* = 0.

**The count (`every_wave_is_a_transverse_one`, `waves_are_the_range`, `the_count_of_waves`).** Take directions adapted to the wave: the time, the direction of travel, and a set of directions across the wave, with *k* equal to one along the first two and zero across (`kw_null`: it is null). A polarization with *k* ⋅ *ε* = 0 has the same field as its part across the wave, and different parts across the wave have different fields (`polMap_injective`). So the fields of the waves along *k* are exactly the fields of the polarizations across it, and they form a space whose dimension is the number of directions across: with *n* directions in all, *n* − 2.

**Two and no third (`two_helicities_and_no_third`).** In four dimensions the number is two. The two states are the two helicities of the photon in the classical reading \[5\], which is cited; what compiles is that the space of fields has dimension two.

**A limit of scope.** The count is proved along a null vector written in adapted directions. That every null vector can be so written is the choice of a frame, elementary and not formalised; the twin counts along random null vectors in three to seven dimensions.

## 6. The Static Half

**The static law (`static_law`, `static_wave_is_the_sum_over_space`, `static_field`).** Let the potential be zero except along the time, and let that component not change along the time. Then the divergence of the potential is zero, the forced law along the time is *a* □*A*₀, and along every direction of space it is zero. On a field that does not change along the time the wave operator is the sum over space alone, so this is the equation of Poisson. The field between a direction of space and the time is the derivative of *A*₀ along that direction, the electric field, and the forced law is *a* times its divergence: the law of Gauss. Half of Maxwell’s law, read at rest, is the law of the static charge.

**The symmetry of a point.** Away from the charge the electric field has no divergence. Around a point with no direction preferred the field is radial, *x*ᵢ *w*, with *w* depending on the distance alone. That is symmetry and is entered. The theorems below say which such fields have no divergence.

**The divergence of a radial field (`radial_divergence`).** Let *x*ᵢ be coordinates of *d* directions, ∂ᵢ*x*ⱼ equal to one when *i* = *j* and zero otherwise, let *u* = ∑ⱼ*x*ⱼ², and let *w* obey (∂ᵢ*w*) *u* = *c* *x*ᵢ *w*, which says *w* is the power *c* of the distance. Then

(∑ᵢ∂ᵢ(*x*ᵢ*w*)) *u* = (*d*+*c*) *w* *u*.

**One power only (`only_one_power_is_free_of_sources`).** In a ring without divisors of zero, if the radial field *x*ᵢ*w* has no divergence and *w* *u* is not zero, then *c* =  − *d*.

**The inverse square (`the_field_falls`, `inverse_square_in_three`).** The square of the size of the field is *u* *w*², and it is the power 2 + 2*c* of the distance. With three directions and *c* =  − 3 the divergence of the field times *u* is zero, so the field has no divergence wherever *u* is not a divisor of zero, and the square of its size is the power  − 4: the field falls as the inverse square of the distance. This is the law of Coulomb \[2\].

**A limit of scope.** The relations asked of *x*, *u* and *w* are met by the coordinates and the powers of the distance on space less a point. That is elementary analysis and is not formalised here; the theorems hold for any elements of any arena that meet the relations, and the twin executes them numerically.

## 7. Four Dimensions

The two theorems of this section are arithmetic on classical counts, which are entered and not derived here.

**Electric and magnetic (`electric_and_magnetic_are_equal_in_number_exactly_in_four`).** A field of *n* dimensions has *n* − 1 components that mix time with space and (*n*−1)(*n*−2)/2 that do not. For *n* at least two, 2(*n*−1) = (*n*−1)(*n*−2) exactly when *n* = 4.

**Light and gravity (`light_and_gravity_have_equal_waves_exactly_in_four`).** Light has *n* − 2 waves, by Section 5. Gravity has *n*(*n*−3)/2, a classical count that is cited \[16\]. For *n* at least two, 2(*n*−2) = *n*(*n*−3) exactly when *n* = 4.

## 8. The Numerical Twin

The twin of Appendix B does three things the kernel does not. It executes the identities independently in floating point, it searches a box of laws and many random waves for what the theorems forbid, and it sets the forced law against published measurements.

**The law.** A wave is a polarization on the profile *e*^(k ⋅ x), whose derivative along a direction multiplies by the component of *k*. For each of the 1331 laws with whole constants from  − 5 to 5, on two hundred random waves, the twin computes the divergence of the law and its change under a gauge turn. Eleven laws are conserved on every wave, the eleven with *b* =  − *a* and *m* = 0, and the same eleven are unchanged by every gauge turn.

**Waves.** For two hundred random null vectors in each dimension from three to seven, the fields of the waves form a space of dimension *n* − 2 in every case, and off the cone the only solutions are multiples of *k*, with no field.

**The static half.** At two hundred random points in each dimension of space from two to six, the divergence of *x* *r*^c computed by differences agrees with (*d*+*c*) *r*^c; the power *c* =  − *d* is free of sources in every dimension; and the rival, the inverse square in every dimension, is free of sources in three and in no other.

**The measurements.** The inputs are measured and are printed in Appendix B.

- **Deviation of the exponent of the static law from two** · Forced: 0; Measured: (2.7±3.1) × 10⁻¹⁶ \[7\]
- **Constant of thermal radiation, in W m⁻² K⁻⁴** · Forced: 5.67037 × 10⁻⁸ (two waves) \[12\]; Rival: 8.50556 × 10⁻⁸ (three waves); Measured: (5.66967±0.00076) × 10⁻⁸ \[8\]
- **Speed of gravity less speed of light, over the speed of light** · Forced: 0; Measured: between  − 3 × 10⁻¹⁵ and 7 × 10⁻¹⁶ \[11\]
- **Mass of the photon** · Forced: 0; Measured: below 10⁻¹⁸ eV \[9\]
- **Decay of the electron** · Forced: none; Measured: lifetime above 6.6 × 10²⁸ years \[10\]

A measured check passes when the forced value lies within two of the quoted uncertainties, and a rival is excluded when it lies further than five. Fourteen checks pass and none fails. The forced exponent stands at 0.87 of the measured uncertainty, and the constant of thermal radiation with two waves at 0.93; the rival with three waves stands at 3731.4. Three limits are stated. The bounds on the mass of the photon and on the decay of the electron are printed as readings and are not counted as checks, since a forced zero compared with a bound cannot fail. The constant of thermal radiation counts the waves through the law of Planck \[12\], which is entered; the constants in it are those of \[17\]. And the twin tests the law against one rival and against measurement. It is not a new prediction: the agreement of Maxwell’s law with these measurements was known.

## 9. Discussion: The Reading

The derivation above uses only algebra. This section states the reading from which the premise comes, and marks what in it is theorem and what is premise.

**Why conservation.** In the reading of Part II nothing escapes the record: what is registered is not lost. Read on charge, the statement is that the source of the field is conserved whatever the field does. That is the field `conserved`. The premise is physics and is not a theorem of this paper. What the paper proves is what the premise forces: the form of the law, the vanishing of the mass, and the invariance under a gauge turn.

**What is not entered.** The usual order derives the conservation of charge from gauge invariance. Here the order is the other one. Gauge invariance is not a premise, the field strength is not a premise, and the mass is not set to zero by hand; each follows. The constant *a* stays free, so the strength of the coupling is not fixed and is read from experiment.

**What the paper does not claim.** It does not derive the charge of the electron or the fine-structure constant. It does not construct functions on spacetime, and the step from the algebra of Section 6 to the powers of the distance is not formalised. It does not derive the counts of Section 7. It does not claim that Maxwell’s law or the inverse square was unknown or untested. It claims that the form of the law is forced by the conservation of charge, that the photon has no mass and two states as a consequence, that the static half is the inverse square in three dimensions, and that each statement of Section 1.3 marked proved compiles. The fuller account of the reading, light and electromagnetism on the seat, is Part II, Section 11, carried from \[15\]. No theorem of Sections 2 to 8 depends on it.

## 10. Predictions, Falsifiers, and What Stands

The paper recovers Maxwell’s law. It predicts no measurement that the law does not and derives no constant. Its commitments are those of the forced law, and they are stated here as commitments: three that the paper says will stand at any future precision, two proposals it says will fail, and the three observations that would refute it.

### 10.1 Three predictions that will stand

1.  **The photon has no mass.** `gauge_forced` gives zero. The present bound is 10⁻¹⁸ eV \[9\]. The prediction is that no experiment finds a mass.
2.  **The static law is the inverse square, exactly.** `inverse_square_in_three` and `only_one_power_is_free_of_sources` give it. The measured deviation of the exponent is (2.7±3.1) × 10⁻¹⁶ \[7\]. The prediction is that it stays at zero.
3.  **Light has two states.** `two_helicities_and_no_third` gives two. The measured constant of thermal radiation agrees with two and excludes three \[8\]. The prediction is that no third state of free light is found.

### 10.2 Two proposals that will fail

1.  **A law for light with a mass term that keeps charge conserved.** `maxwell_forced` leaves none among linear laws of second order built from the potential alone. The paper predicts that every such proposal either gives up conservation for some field or adds a second field under another name.
2.  **A linear law of second order for light, of the form of Section 1.1, that is not Maxwell’s.** The same theorem forbids it. The paper predicts that every departure from Maxwell’s law in vacuum, if one is found, is not linear or not of second order, or does not conserve charge.

### 10.3 The three falsifiers

Each is a forbidden observation. No observation breaks a theorem; each refutes a premise, or the forced law as the law of nature, and each names the theorem that carries the consequence. The threshold in each case is five of the experiment’s printed uncertainties.

1.  **A charge that is not conserved.** It refutes the field `conserved` directly.
2.  **A photon with a mass.** It refutes the field `conserved` through `gauge_forced`.
3.  **A static law whose exponent is not two.** It refutes the field `conserved` through `the_forced_law_is_maxwell` and `static_law`, or the three dimensions of space, or the symmetry of a point, through `only_one_power_is_free_of_sources`.

Apart from them stands the formal claim, which no observation touches and one compilation settles: every theorem named in this text prints its axioms in Appendix D, and a line that names an axiom other than `propext`, `Classical.choice` and `Quot.sound`, or a file that fails to compile under Lean 4.19.0 and Mathlib 4.19.0, refutes the claim that the statements are proved.

### 10.4 What kind of result this is

It is not a new physics. It is a change in how a physical derivation can be checked. The forcing of Maxwell’s law is here a single file whose every step the kernel has verified, whose one assumption is one field of one structure, and whose readings are set against measurement. A reader who doubts a step can name the line.

The implication from `Premises` to Maxwell’s law, to the vanishing mass and to the gauge is checked by the Lean kernel. No experiment and no later revision of physics alters an implication. Experiment remains free to test whether nature satisfies the premise, and that is all it can test here. What the kernel certifies is the Lean statements; that the definitions of the file say what this text says they say is for the reader to check, and the structure `Premises` is printed for that purpose. What stands is the tables of Section 1.3.

## 11. Part II · The Reading

*This part is the reading from which the paper takes its place in the series. It is carried from Nothing Escapes, Least Erasure (Islam, 2026a), where it stands as the chapters The Geometric Nature of Light and Electromagnetism on the Fixed Line, and it is premise-grade. It is not among the machine-checked claims of Section 1.3, and no theorem of Sections 2 to 8 depends on it. The theorem names set in code in this part, and the twins it quotes, are those of that volume and are printed there, not here. Where this part calls a statement a theorem, the statement follows from the placement of the reading, which is its premise. The falsifiers listed in Sections L.11 and E.11 are falsifiers of the reading; they stand beside the three of Section 10.3 and are not among them.*

### 11.1 The Geometric Nature of Light

*Light as the Line: The Photon Fixed by Both Involutions of the Substrate, Frequency as the Height, Helicity as the One Bit, and Detection as the Registration That Keeps the Energy and Forgets the Path.* Edition 2.0.0.

**Abstract of the chapter.** Twenty-five centuries of optics asked what travels when something is seen and through what it travels. This chapter answers the geometric half of that question on a seat: a reflection of the plane, *s* ↦ 1 − *s̄*, and the line it fixes. The actuating substrate of Least Erasure (Islam, 2026a) carries two involutions, the particle map that flips every additive charge and the time mirror that reverses a mode’s rate, and two carriers onto that reflection. The photon is the one excitation fixed by both at every frequency: it carries no charge of any kind, its energy is real, and it lands on the line under both carriers. We prove in core Lean 4, sixty-three laws with no axiom declared and no use of choice, that frequency is the seat’s height and never its side, so the whole spectrum from radio to gamma stands on one line; that a massive mode runs slower than light while every massless mode runs at one speed; that helicity is the one bit no energy reading returns; that the charge-conjugation parity of *n* photons is (−1)ⁿ, selecting two photons for parapositronium and three for orthopositronium; that detection is the registration of the seat, a fringe existing exactly when both paths are open and the record forgets the side; and that the quantum belongs to the field, since every classical intensity bunches while one photon never coincides with itself. A Fortran twin runs sixteen checks with zero failures, among them Englert’s duality to 4.4 × 10⁻¹⁶ and the single-photon anticorrelation 13.7 standard deviations below every classical field.

#### L.1 The Reader’s Frame

This chapter reads light on the seat. Least Erasure (Islam, 2026a) built the substrate: a particle’s charges are odd and its energy even under the particle map, the particle map and the time mirror of a mode’s rate commute, and each is carried equivariantly onto the reflection that fixes the line. This chapter claims that the photon is the substrate’s one excitation fixed by both involutions at every frequency, and that each old question of optics, what travels, at what speed, carrying what, and registered how, has a precise answer on the seat.

**Negative warrants.** Two, stated so that no reader supplies them. No physical fact here is read as a proof of a mathematical sentence: a corroboration joined to a claim takes the weaker grade. No field theory is written and no constant is derived: the speed of light, the fine-structure constant and the photon’s couplings enter as measured.

**Five terms.** A *reading* is any quantity an instrument returns from a state, *odd* under a map that flips its sign and *even* under one that keeps it. A *mode* *e*^(−iEt)*ψ* is *stationary* when its norm is constant in time. The *fixed set* of a map is the set of points it leaves unchanged. A *keyed bit* is a yes-or-no property no function of a given record decides. The *side* of a two-path experiment is which path a quantum took; the *record* is what the screen keeps.

#### L.2 The Spine

The seat has a mirror and a record. The mirror is a reflection of the plane, *s* ↦ 1 − *s̄*, and the points it leaves fixed form one line, the fixed line. A point has a height along the line and a side off it. Registration keeps the height and forgets the side, and it erases nothing exactly when nothing stands off the line. The particle map exchanges a particle with its antiparticle and flips every charge; the time mirror reverses a mode’s rate. This chapter reads the seat’s occupant in Section L.3 to 5, the registration in Section L.6 and 7, the seat’s sign in Section L.8, the even reading in Section L.9, and the crossing in Section L.10.

Three theorems carry the seat, and the engine proves each on its chart. Over one record both worlds exist, and no reading that respects the record decides the value; under the seat every point off the line has a partner, distinct and off it, with one record (`off_locus_pair`); a carrier whose image is on the line proves the value on its image, and coverage extends it (`value_on_image`, `kinetic_crossing`).

**Why this carrier, and not another.** The carrier is not chosen. Spaces with an involution and the maps that respect them form a category (`equivariant_id`, `equivariant_comp`), and the fixed set is a functor on it (`fix_functorial`); an equivariant map into the seat, a global seat whose fixed set is the line (`fold_global_seat`), lands every physical fixed point on the line (`equivariant_carrier_lands`). Here the substrate’s two carriers are those of Least Erasure: the charge carrier sends the particle map onto the fold (`charge_carrier_equivariant`), the energy carrier *s* = (1/2) + *i**E* sends the time mirror onto the fold (`phi_equivariant`), and a particle fixed by both lands on the line under both (`joint_fixed_iff`, `photon_on_both_lines`). The photon is such a particle at every frequency, so its landing is forced by the functor and not assumed.

**The correspondence matrix.**

- **the photon, its own antiparticle and stable** · Element of the seat: fixed by both involutions; Lean theorem: `photon_is_its_own_antiparticle`, `photon_is_stationary`; Fortran check: 2001 of 2001
- **light at every frequency** · Element of the seat: the occupant of the line, under both carriers; Lean theorem: `photon_on_both_lines`, `every_frequency_one_side`; Fortran check: twenty decades, one side
- **frequency** · Element of the seat: the height, kept by registration; Lean theorem: `frequency_is_the_height`, `registration_keeps_light`; Fortran check: 2001 heights
- **rest mass** · Element of the seat: the depth: massive modes slower; Lean theorem: `massive_slower`, `massless_on_the_cone`; Fortran check: 2000 of 2000; 1.9e-10
- **gravity and light arriving together** · Element of the seat: the even readings at one speed; Lean theorem: `massless_on_the_cone`; Fortran check: GW170817, 4.2e-16
- **two helicities of one frequency** · Element of the seat: two worlds over one record; Lean theorem: `helicity_is_one_bit`, `parity_involutive`; Fortran check: 2002 states
- **C-parity of n photons** · Element of the seat: the sign the fixed set carries; Lean theorem: `cparity_val`, `c_even_needs_even_photons`, `positronium_counts`; Fortran check: 41 of 41
- **which path, and the fringe** · Element of the seat: the registration forgetting the side; Lean theorem: `fringe_iff_side_forgotten`, `side_registered_no_fringe`; Fortran check: 20000; D²+V² to 4.4e-16
- **antibunching of one photon** · Element of the seat: the quantum is the field’s; Lean theorem: `classical_light_bunches`, `quantum_is_the_fields`; Fortran check: g2 = 0, 1, 2; 13.7σ
- **a detection** · Element of the seat: a committed bit, priced; Lean theorem: Least Erasure’s `registration_erases_off_line`; Fortran check: 125.8 floors per visible photon

#### L.3 Light Is the Line

The photon carries no electric charge, no colour, no baryon number and no lepton number, and its energy is real: it is its own antiparticle and it does not decay (`photon_is_its_own_antiparticle`, `photon_is_stationary`). It is therefore fixed by both involutions of the substrate, the particle map and the time mirror, and by the functor of the seat it lands on the line under both carriers (`photon_on_both_lines`). No other excitation of the Standard Model is fixed by both at every frequency: the *Z* boson is neutral and decays, the neutrino’s neutrality under the particle map is one keyed bit, and every charged particle stands on an edge under the charge carrier. Light is the seat’s occupant.

The occupancy is measured. The photon’s mass is bounded below 10⁻¹⁸ eV (Particle Data Group, 2024), and at that bound a radio photon of one microelectronvolt would be slowed by 5 × 10⁻²⁵ of its speed (the twin of that volume): light stands on the line to that depth. The electron paper read the neutral sector as the fixed set of charge conjugation, with the photon and the neutral pion sitting on it as particles; this paper reads the photon as the one resident of that set whose energy is real at every frequency, and so the one resident of the line under the energy carrier too.

#### L.4 Frequency Is the Height

Under the energy carrier a photon of frequency *ω* lands at (1,*ω*): its frequency is the seat’s height and its side is the line (`frequency_is_the_height`). Every frequency stands on one side (`every_frequency_one_side`), and registration keeps a photon exactly, since nothing of it stands off the line to be forgotten (`registration_keeps_light`). The spectrum from radio at 10⁻⁹ eV to gamma rays at 10¹¹ eV, twenty decades, is the line’s heights (the twin of that volume).

The old question of the speed hierarchy has its answer on the same two coordinates. A mode with *ω*² = *k*² + *m*² and *m* ≠ 0 has *k*² &lt; *ω*² and runs slower than light (`massive_slower`); a massless mode has *ω*² = *k*² at every frequency (`massless_on_the_cone`). Frequency is the height and rest mass is the depth: two coordinates, never one. The twin finds the massless group velocity equal to *c* to 1.9 × 10⁻¹⁰ across 2000 frequencies and every massive mode below it. Measured: gamma rays from GRB 090510 bound any vacuum dispersion above the Planck energy (Fermi LAT, 2009), and the gamma-ray burst of GW170817 arrived 1.74 seconds after the gravitational waves emitted 130 million years earlier, bounding the difference of the two speeds below 4.2 × 10⁻¹⁶ (LIGO, Virgo, Fermi GBM and INTEGRAL, 2017).

#### L.5 Helicity Is the One Bit

A massless particle of spin one has two helicity states, not three (Wigner, 1939). Parity reverses the helicity and keeps the frequency (`parity_involutive`). So the two helicities of one frequency are two states with one energy record, and no reading of the energy returns which one is present (`helicity_is_one_bit`). This is the seat’s residue carried by light: one bit, a two-point set over one record, unread by the even reading. Circular polarization is that bit made visible, and it is the bit a polarizer, not a calorimeter, registers.

#### L.6 Detection Is Registration

In a two-path experiment the side is which path the quantum took and the record is where it lands on the screen. Write the intensity at a point as *I* = *a*² + *b*² + 2*a**b**c* *s*, with *a* and *b* the two amplitudes, *c* the overlap of whatever marks the path (zero when the side is registered, nonzero when it is forgotten), and *s* =  ± 1 the fringe sign. A fringe exists, the intensity differing between *s* =  + 1 and *s* =  − 1, exactly when both paths are open and the side is forgotten (`fringe_iff_side_forgotten`); registering the side leaves *a*² + *b*² and no fringe at all (`side_registered_no_fringe`). This is the seat’s registration with both clauses: a record that forgets the side keeps the interference, and one that keeps the side erases it.

The trade is exact. The which-path distinguishability *D* and the fringe visibility *V* satisfy *D*² + *V*² ≤ 1, with equality on every pure state (Englert, 1996; Wootters and Zurek, 1979); the twin reaches equality to 4.4 × 10⁻¹⁶ on 20000 pure states. The which-way experiment in an atom interferometer (Dürr, Nonn and Rempe, 1998) observed the loss of the fringe with no momentum kick to explain it: the record of the side, and nothing else, erased it.

#### L.7 The Quantum Is the Field’s

The discreteness of light is not the detector’s alone. For any classical field detected by quantized matter, the coincidence rate of two detectors is at least the square of the single rate, *g*⁽²⁾ ≥ 1 (Glauber, 1963), which the engine proves on the two-point split, (*x*+*y*)² ≤ 2(*x*²+*y*²) (`classical_light_bunches`), and the twin checks on 10000 classical intensity distributions. A single photon never coincides with itself, *n*(*n*−1) = 0 at *n* = 1 (`single_photon_no_coincidence`, `quantum_is_the_fields`). Coherent light has *g*⁽²⁾ = 1 and thermal light 2 (the twin of that volume). Antibunching was observed in resonance fluorescence (Kimble, Dagenais and Mandel, 1977), and a single-photon source behind a beam splitter gave an anticorrelation parameter of 0.18 ± 0.06 (Grangier, Roger and Aspect, 1986), 13.7 standard deviations below every classical field. Two photons meeting at a beam splitter leave together (Hong, Ou and Mandel, 1987). The photoelectric effect alone admits a semiclassical account (Lamb and Scully, 1969); light as a whole does not. The field carries its own quantum.

#### L.8 Light Under the Particle Map: Furry and Positronium

The photon sits on the fixed set of the particle map as a particle, and it carries a sign there: its charge-conjugation parity is  − 1, so *n* photons carry (−1)ⁿ (`cparity_val`). Electromagnetism conserves this sign, so a state even under charge conjugation decays only into an even number of photons (`c_even_needs_even_photons`), and closed loops of charge emit no odd number of photons (Furry, 1937). Parapositronium, even, decays into two photons and orthopositronium, odd, into three (`positronium_counts`); their lifetimes, 125 ps and 142 ns, are the electron paper’s measured readings of this bit.

#### L.9 The Even Reading Travels at One Speed

Gravity reads the energy-momentum tensor and nothing else, so it reads light’s energy and never its helicity or its C-parity. Light bends in a gravitational field by exactly twice the Newtonian angle, and gravitational waves and light, the two massless even-reading carriers, travel at one speed (Section L.4). Gravity is the reversible branch of registration, one sign and no bit (Islam, 2026b); light is the one excitation that stands on that branch’s locus with every odd reading zero.

#### L.10 What Light Carries, and What It Does Not

Light carries the seat’s occupant: the one excitation fixed by both involutions at every frequency, on the line under both carriers, with the frequency as the height, the helicity as the one bit and the C-parity as the sign. It carries the registration: detection as the record that keeps the energy and forgets the path, exact to Englert’s equality. It carries its own quantum.

The engine’s delivery is on its own image, the photons it lands (`value_on_image`). It does not derive the speed of light, the fine-structure constant, or any other magnitude. It does not identify the substrate with the electromagnetic field: the field is the substrate’s odd reading, and light is the configuration of that reading which stands on the line.

#### L.11 Falsifiers

Three falsifiers, each a forbidden observation naming the theorem it would break. **F-Dispersion:** a vacuum speed of light that depends on frequency, at any precision, breaking `every_frequency_one_side` read physically and `massless_on_the_cone`. **F-Fringe:** a fringe of full visibility from a two-path state whose side is registered with certainty, breaking `fringe_iff_side_forgotten` and Englert’s duality. **F-Helicity:** a third, longitudinal helicity state of the free photon, breaking `helicity_is_one_bit`. Two measurements would sharpen readings without moving the paper’s standing: the photon mass bound, and the vacuum-dispersion bound at still higher photon energies.

### 11.2 Electromagnetism on the Fixed Line

*Charge as the Side, the Electric Field as the Line, the Magnetic Sign as the One Bit, and Duality as the Quarter Turn Whose Square Is Charge Conjugation.* Edition 1.0.0.

**Abstract of the chapter.** Electromagnetism is the best-measured interaction in physics and the one whose discrete symmetries are cleanest: charge conjugation reverses every field, time reversal reverses the magnetic field and keeps the electric one, and a duality rotation exchanges them in the vacuum. This chapter reads the field on the seat, the reflection *s* ↦ 1 − *s̄* and the line it fixes. Two carriers land electromagnetism on the seat. The charge carrier sends a particle of charge *q* to the side of the line and carries charge conjugation onto the reflection, so the neutral states are the line. The field carrier *s* = (1/2) + *i**F* on the Riemann–Silberstein amplitude *F* = *E* + *i**B* carries time reversal, the complex conjugation of *F*, onto the reflection, so the purely electric fields are the line and the magnetic sign is the one bit a field and its time reverse do not share. We prove in core Lean 4, seventy-one laws with no axiom declared and no use of choice, that charge conjugation, parity and time reversal are involutions with *C**T* = *P* and *C**P**T* the identity on the field; that duality is a quarter turn whose square is charge conjugation and whose fourth power is the identity, anticommuting with time reversal as  − *i* does with complex conjugation; that the energy density is invariant under all of them while both Lorentz invariants reverse under duality; that light is null and stays null under duality; that a magnetic term breaks time reversal and keeps every energy real; that charge is conserved by pair creation and forced in thirds; and that the Aharonov–Bohm record reads flux modulo one quantum. A Fortran twin runs seventeen checks with zero failures, the quantum Hall and Josephson constants exact in the SI. The Part joins the two branches of registration: gravity the even, one-signed reading, magnetism the odd reading that keeps a priced bit.

#### E.1 The Reader’s Frame

This chapter is dedicated to one interaction. Least Erasure (Islam, 2026a) put the four readings of the substrate on one seat: three gauge readings odd under the particle map and one, gravity’s, even. Registration has two branches, gravity the reversible branch that keeps no bit and magnetism the priced branch that keeps one. This chapter reads the electromagnetic interaction itself on the seat, in its charges, its fields, its discrete symmetries, its duality, and its quantum registrations, and joins it to those two branches.

It claims that electromagnetism carries the seat twice. Through the charge carrier, charge conjugation is the reflection and the neutral states are the line. Through the field carrier, time reversal is the reflection, the purely electric fields are the line, and the sign of the magnetic field is the one bit a field and its time reverse do not share. Duality, the rotation that exchanges electric and magnetic, is the quarter turn of the seat’s Return: its square is charge conjugation.

**Negative warrants.** Two, stated so that no reader supplies them. No physical fact here is read as a proof of a mathematical sentence: a corroboration joined to a claim takes the weaker grade. No field theory beyond Maxwell’s is written and no constant is derived: the fine-structure constant, the charges’ magnitudes and the speed of light enter as measured or as defined by the SI.

**Five terms.** A *reading* is any quantity an instrument returns from a state, *odd* under a map that flips its sign and *even* under one that keeps it. The *Riemann–Silberstein amplitude* is *F* = *E* + *i**B* in units with *c* = 1. *Duality* is the rotation *E* ↦ *B*, *B* ↦  − *E*, which is *F* ↦  − *i**F*. The *fixed set* of a map is the set of points it leaves unchanged. A *keyed bit* is a yes-or-no property no function of a given record decides.

#### E.2 The Spine

The seat is the one of Section 11.1: the mirror *s* ↦ 1 − *s̄*, its fixed line, and the registration that keeps a point’s height and forgets its side. This chapter reads the seat on charge in Section E.3 and on the field in Section E.4, the residue in the magnetic sign in Section E.5, the discrete symmetries in Section E.6, the Return in duality in Section E.7, the seat’s occupant in Section E.8, the registrations in Section E.9, and the two branches in Section E.10.

**Why this carrier, and not another.** The carrier is not chosen. Spaces with an involution and the maps that respect them form a category (`equivariant_id`, `equivariant_comp`), and the fixed set is a functor on it (`fix_functorial`); an equivariant map into the seat, whose fixed set is the line (`fold_global_seat`), lands every physical fixed point on the line (`equivariant_carrier_lands`). Electromagnetism supplies two such maps. The charge carrier, a particle of charge *q* to the side *h* = 1 + *q*, is equivariant for charge conjugation (`charge_carrier_equivariant`). The field carrier, *s* = (1/2) + *i**F*, is equivariant for time reversal (`field_carrier_equivariant`), and its landing on the purely electric fields is forced (`field_carrier_lands`).

**The correspondence matrix.**

- **charge conjugation** · Element of the seat: the reflection, read on charge; Lean theorem: `charge_carrier_equivariant`, `bar_fixed_iff_neutral`; Fortran check: table
- **electron and positron** · Element of the seat: the pair on the two edges; Lean theorem: `pair_on_the_edges`, `off_locus_pair`; Fortran check: structural
- **time reversal of the field** · Element of the seat: the fold; Lean theorem: `field_carrier_equivariant`, `T_fixed_iff_electric`; Fortran check: 3721 of 3721
- **a purely electric field** · Element of the seat: a point on the line; Lean theorem: `electric_on_the_line`, `field_carrier_lands`; Fortran check: 3721 of 3721
- **a magnetic field and its reverse** · Element of the seat: two worlds over one electric record; Lean theorem: `magnetic_sign_is_the_bit`, `energy_even`; Fortran check: 3660 of 3660
- **C, P, T** · Element of the seat: three involutions, CT = P, CPT trivial; Lean theorem: `CT_is_P`, `CPT_trivial`; Fortran check: 3721 of 3721
- **E·B** · Element of the seat: odd under T and P, even under C; Lean theorem: `EB_odd_under_T_and_P`; Fortran check: structural
- **duality** · Element of the seat: the quarter turn, its square C; Lean theorem: `duality_squared_is_C`, `duality_fourth_is_identity`, `duality_anticommutes_with_T`; Fortran check: 3721 of 3721
- **the energy and the invariants** · Element of the seat: even under duality; reversed by it; Lean theorem: `energy_duality_invariant`, `invariants_flip_under_duality`; Fortran check: 3721 of 3721
- **a plane wave** · Element of the seat: light null, and null under duality; Lean theorem: `plane_wave_null`, `null_preserved_by_duality`; Fortran check: 5000 waves to 1e-15
- **a magnetic term** · Element of the seat: time reversal broken, energies real; Lean theorem: `magnetism_odd_branch`, `stationarity_survives_the_magnet`; Fortran check: 100000 blocks; Landau levels
- **pair creation** · Element of the seat: charge conserved; Lean theorem: `pair_creation_conserves_charge`; Fortran check: 19 of 19
- **the Yukawa couplings** · Element of the seat: charge forced in thirds; Lean theorem: `hypercharge_forced`, `charges_in_thirds`; Fortran check: the charges
- **the Aharonov–Bohm phase** · Element of the seat: flux read modulo one quantum; Lean theorem: `aharonov_bohm_two_worlds`; Fortran check: 2000 fluxes to 7e-15
- **the Hall and Josephson effects** · Element of the seat: registration onto integers; Lean theorem: structural; Fortran check: h/e², h/2e, 2e/h exact
- **gravity and magnetism** · Element of the seat: the even and the odd branch; Lean theorem: `gravity_even_branch`, `magnetism_odd_branch`; Fortran check: 2.27e39; 174 floors

#### E.3 Charge Is the Side

A particle of charge *q*, in units of the charge quantum, lands at *h* = 1 + *q* at the height of its frequency, so charge conjugation, *q* ↦  − *q*, becomes the reflection *h* ↦ 2 − *h* (`charge_carrier_equivariant`). The neutral particles are the line (`neutral_charge_on_line`), the electron and the positron land on the two edges, real parts 0 and 1, mirror images (`pair_on_the_edges`), and the particle map is an involution whose fixed set is exactly the neutral states (`bar_fixed_iff_neutral`). Least Erasure built this carrier on the leptons; here it is the carrier of the whole interaction.

Charge is conserved at the seat. Pair creation makes a particle and its antiparticle, whose charges cancel (`pair_creation_conserves_charge`), and the electron, the lightest charged particle, does not decay: its lifetime in the channel *e* → *γ**ν* exceeds 6.6 × 10²⁸ years (Borexino, 2015). Charge is forced in thirds: the Yukawa couplings and two anomaly conditions fix every hypercharge as a multiple of the quark doublet’s (`hypercharge_forced`), and with *Q* = *T*₃ + *Y* the up quark carries (2/3), the down  − (1/3), the electron  − 1, hydrogen and the vacuum none (`charges_in_thirds`). The electron and the positron carry charges equal and opposite to four parts in a hundred million (Particle Data Group, 2024).

#### E.4 The Electric Field Is the Line

On one axis pair the field is the Riemann–Silberstein amplitude *F* = *E* + *i**B* (Silberstein, 1907; Bialynicki-Birula, 1996). Time reversal keeps the electric field and reverses the magnetic one, so it is the complex conjugation *F* ↦ *F̄*. The field carrier
*s*(*F*) = (1/2) + *i**F*,   *σ*(*s*(*F*)) = 1 − conj((1/2)+*i**F*) = (1/2) + *i**F̄* = *s*(*F̄*),
carries time reversal exactly onto the fold; in the chart it reads (*E*,*B*) ↦ (1−*B*,*E*) (`field_carrier_equivariant`). A field is fixed by time reversal exactly when *B* = 0 (`T_fixed_iff_electric`), and it lands on the line exactly then (`electric_on_the_line`): the line is the purely electric field, the field of charges at rest. The twin executes the carrier on 3721 integer fields.

#### E.5 The Magnetic Sign Is the One Bit

A field with *B* ≠ 0 and its time reverse are two fields, both off the line, with one electric component, one energy density and one record (`magnetic_sign_is_the_bit`). The energy density *E*² + *B*² is even under time reversal, charge conjugation and parity alike (`energy_even`), so no reading of the energy returns the sign of the magnetic field. That sign is the one bit: a moving charge’s field and the field of the same charge moving backward share every even reading and differ in it. Iron carries it, remanence  ± 0.996 at zero applied field (Islam, 2026a), two worlds with one record, the bit kept at a price above Landauer’s floor; the product *E* ⋅ *B* is odd under time reversal and under parity and even under charge conjugation (`EB_odd_under_T_and_P`).

#### E.6 Charge Conjugation, Parity and Time Reversal on the Field

On the field, charge conjugation reverses both components, *F* ↦  − *F*; parity reverses the polar electric field and keeps the axial magnetic field; time reversal keeps the first and reverses the second. Each is an involution (`C_involutive`, `P_involutive`, `T_involutive`), charge conjugation after time reversal is parity (`CT_is_P`), and the three together act as the identity on the field (`CPT_trivial`): each of *E* and *B* is odd under exactly two of the three. This is the field’s form of the CPT theorem (Lüders, 1954; Pauli, 1955), and it is why the substrate’s particle map, carried by CPT, keeps every field reading that gravity sees. The twin executes the table on 3721 fields.

#### E.7 Duality: The Quarter Turn Whose Square Is Charge Conjugation

In the vacuum Maxwell’s equations are invariant under the rotation *E* ↦ *B*, *B* ↦  − *E* (Heaviside, 1893; Larmor, 1897), which is multiplication of *F* by  − *i*. Its square is *F* ↦  − *F*, charge conjugation (`duality_squared_is_C`), and its fourth power is the identity (`duality_fourth_is_identity`): duality is a quarter turn, and its square lands on minus one exactly as the spinor’s full turn and the quaternion units’ product *i**j**k* =  − 1 do for the electron. It anticommutes with time reversal, *T**D* = *C* *D**T*, as  − *i* does with complex conjugation (`duality_anticommutes_with_T`). The energy density is invariant under it (`energy_duality_invariant`), and both Lorentz invariants, *E*² − *B*² and *E* ⋅ *B*, reverse under it (`invariants_flip_under_duality`).

Sources break the duality. Electric charges exist; magnetic charges have not been found (Particle Data Group, 2024). The question whether they do is the duality’s own bit: a world in which every particle carries the same ratio of magnetic to electric charge is carried by one global duality rotation to a world with no magnetic charge at all, so a monopole is physically distinct only if some particle’s ratio differs from another’s. Were one found, Dirac’s condition would force every electric charge to be a multiple of a quantum fixed by the monopole’s charge (Dirac, 1931). This paper types the question and does not answer it; the falsifier F-Monopole names the observation that would.

#### E.8 Light Is Null

A plane wave carries an electric field perpendicular to its magnetic field and equal to it in magnitude: both Lorentz invariants vanish (`plane_wave_null`), and duality, which reverses both invariants, keeps a null field null (`null_preserved_by_duality`). Light is therefore the duality-neutral field: the configuration of the electromagnetic reading on which the rotation that exchanges electric and magnetic acts without changing any invariant. The twin builds 5000 random plane waves and finds both invariants zero to 10⁻¹⁵, and the dual of each is again a plane wave along the same direction. Section 11.1 reads the photon on the seat as the one excitation fixed by both involutions of the substrate at every frequency.

#### E.9 The Magnet Keeps Every Energy Real, and Registration Lands on Integers

A magnetic field breaks time reversal of the motion of a charge and keeps every energy real. A Hermitian block with a magnetic phase has a nonnegative discriminant whether or not the phase vanishes (`stationarity_survives_the_magnet`, `magnetism_odd_branch`), so its energies are real; the twin checks 100000 such blocks. An electron in a uniform field of one tesla has Landau levels (*n*+(1/2))ℏ*ω*_c with ℏ*ω*_c = 1.1577 × 10⁻⁴ eV, each real, each degenerate 2.418 × 10¹⁴ times per square metre (Landau, 1930; the twin of that volume). The Landau problem is the cleanest time-broken motion. The magnet breaks time reversal of the motion and keeps every energy stationary.

Electromagnetic registration lands on integers. The Hall resistance of a two-dimensional electron gas in a strong field is *h*/(*ν**e*²) with *ν* an integer (von Klitzing, Dorda and Pepper, 1980), the integer a topological invariant of the filled bands (Thouless, Kohmoto, Nightingale and den Nijs, 1982), reproducible across materials to parts in 10¹⁰ (Jeckelmann and Jeanneret, 2001); the flux through a superconducting ring comes in quanta *h*/2*e*; and a Josephson junction under microwaves steps at voltages *n* *h**f*/2*e* (Josephson, 1962). With *e* and *h* exact in the SI of 2019 the twin computes *h*/*e*² = 25812.80745930 *Ω*, *h*/2*e* = 2.0678338485 × 10⁻¹⁵ Wb and 2*e*/*h* = 4.8359784842 × 10¹⁴ Hz/V. Each is a registration that lands the field on a locus of integers and keeps nothing off it. The Aharonov–Bohm phase reads the flux enclosed by a path only modulo *h*/*e* (Aharonov and Bohm, 1959): two fluxes one quantum apart are two worlds with one record (`aharonov_bohm_two_worlds`), the twin finding the phase equal to 7.3 × 10⁻¹⁵ over 2000 fluxes.

#### E.10 Gravity and Magnetism: One Registration, Two Branches

Registration has two branches. Gravity is the reversible branch: its sources have one sign, it reads energy and nothing else, and no gravitational reading tells a charge from its antiparticle (`gravity_even_branch`); antihydrogen falls as hydrogen does (ALPHA-g, 2023). Magnetism is the priced branch: time reversal reverses the magnetic field (`magnetism_odd_branch`), so the magnetic sign is a bit, and a stable magnetic bit at 5.0 × 10⁻¹⁹ J per switch costs 174 Landauer floors at 300 K (the twin of that volume). Electromagnetism carries both faces of the substrate’s three plus one on one field: its charges and its magnetic sign are odd, its energy density even, and the even part is what gravity reads. The two readings differ in strength by the ratio of the Coulomb to the gravitational attraction in hydrogen, 2.27 × 10³⁹, with *α* = 7.2973525737 × 10⁻³ computed from the constants (the twin of that volume). This paper derives neither number; it states which reading each belongs to.

#### E.11 Falsifiers

Three falsifiers, each a forbidden observation naming the theorem it would break. **F-Charge:** a process that creates or destroys net electric charge, the decay of the electron among them, breaking `pair_creation_conserves_charge` and the seat reading of Section E.3. **F-Thirds:** a free particle whose charge is not a multiple of one third of the electron’s, breaking `hypercharge_forced` and `charges_in_thirds` read physically. **F-Reality:** a magnetic field that drives a bound charge’s energy off the real axis in a closed system, breaking `stationarity_survives_the_magnet` read physically. Two measurements would sharpen readings without moving the paper’s standing: a magnetic monopole, which would read the duality’s bit, and the resolution of the disputed digits of the fine-structure constant.

## 12. Closure

The forcing of the law of light is no longer informal prose. From a commutative ring with derivatives that commute, and nothing more, Lean 4 with Mathlib compiles the equations without sources, the divergence of the general linear law of second order, its change under a gauge turn, the forcing of Maxwell’s law by conservation on an explicit arena of four directions, the divergence of the field of a plane wave, the absence of waves off the null cone, the count of the waves along a null vector in every number of dimensions, the static law, and the divergence of a radial field of any power in any number of dimensions. No axiom is declared. No proof is left open. No headline theorem closes by its own hypothesis or over a structure that carries its conclusion.

Maxwell’s law is recovered as the one linear law of second order whose source is conserved, with its coupling left free. The vanishing mass of the photon and the invariance under a gauge turn are recovered with it, neither of them entered. The two states of light are recovered as the dimension of a space of fields, and the inverse square as the one power of the distance that is free of sources in three dimensions. The numerical twin finds, among 1331 laws with whole constants, the eleven the theorem names and no other; counts the waves in three to seven dimensions; and sets the law against measurement: the exponent of the static law within its uncertainty of two, and the constant of thermal radiation at two waves with three excluded.

Every boundary is in plain sight. That charge is conserved whatever the field does is one field of one printed structure. That the relations of the radial theorems are met by the powers of the distance is elementary analysis, not formalised. That the two states are the two helicities is the classical reading, cited. The counts of components in *n* dimensions and the count of the waves of gravity are classical, entered, and the theorems on them are arithmetic. The strength of the coupling is not derived, here or anywhere in the paper.

That structure is not an arbitrary postulate. The two statements the reading rests on, Existence and Least Erasure, are theorems in their own domain: each has its own compiled Lean file, with no axiom declared, listed in the Lean Library Reference. There they are proved. The Heat Bridge, which joins erasure to heat, is a theorem there as well; the bridge spoken of below is a different one, from that domain to physics. Here they are used, and the difference is stated. Between that domain and the algebra of a field lies a physical bridge: that nothing escapes the record, read on charge as the conservation of the source whatever the field does. This paper does not claim the bridge as a theorem. It writes the bridge down as `Premises`, so that the engine imports nothing outside Mathlib and can be checked alone, and so that a reader can see exactly which sentence carries the physics.

Two things are therefore separate, and the paper keeps them separate. Inside the kernel, the implication from `Premises` to Maxwell’s law is a mathematical certainty. No experiment, no consensus and no later revision of physics alters it, and anyone can recheck it with one compilation. Outside the kernel stand three falsifiers. They test whether nature satisfies the premise, and so far nature does. What survives both is not opinion. It is a theorem, and a physics that has met every test of its premise.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author’s. The Lean file and the Fortran twin are written by a language model under the author’s direct supervision. Every theorem named in the text of Sections 1 to 10 and 12 is in Appendix A under that name, and its kernel line is printed in Appendix D. Classical results that are cited and not formalised are named as such in Section 1.3 and wherever they are used. No constant of nature is derived anywhere in this paper; the numbers of the twin are computed from random data, from the fixed constants of the units, and from measured inputs, which Appendix B prints.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1.  J. C. Maxwell, Phil. Trans. R. Soc. 155 (1865) 459.
2.  C. A. Coulomb, Mém. Acad. R. Sci. (1785) 569.
3.  H. Weyl, Z. Phys. 56 (1929) 330.
4.  A. Proca, J. Phys. Radium 7 (1936) 347.
5.  E. Wigner, Ann. Math. 40 (1939) 149.
6.  S. Weinberg, Phys. Rev. 138 (1965) B988.
7.  E. R. Williams, J. E. Faller and H. A. Hill, Phys. Rev. Lett. 26 (1971) 721.
8.  T. J. Quinn and J. E. Martin, Phil. Trans. R. Soc. A 316 (1985) 85.
9.  D. D. Ryutov, Plasma Phys. Control. Fusion 49 (2007) B429.
10. M. Agostini et al. (Borexino), Phys. Rev. Lett. 115 (2015) 231802.
11. B. P. Abbott et al. (LIGO, Virgo, Fermi GBM and INTEGRAL), Astrophys. J. Lett. 848 (2017) L13.
12. M. Planck, Verh. Dtsch. Phys. Ges. 2 (1900) 237.
13. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
14. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
15. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
16. M. F. Islam, Immanent Gravity as a Machine-Checked Mathematical Theorem, edition 4.0.0 (2026b).
17. E. Tiesinga, P. J. Mohr, D. B. Newell and B. N. Taylor, Rev. Mod. Phys. 93 (2021) 025010.
18. W. H. Furry, Phys. Rev. 51 (1937) 125.
19. R. J. Glauber, Phys. Rev. 130 (1963) 2529.
20. W. E. Lamb and M. O. Scully, in Polarisation, Matière et Rayonnement (Presses Universitaires de France, 1969).
21. H. J. Kimble, M. Dagenais and L. Mandel, Phys. Rev. Lett. 39 (1977) 691.
22. W. K. Wootters and W. H. Zurek, Phys. Rev. D 19 (1979) 473.
23. P. Grangier, G. Roger and A. Aspect, Europhys. Lett. 1 (1986) 173.
24. C. K. Hong, Z. Y. Ou and L. Mandel, Phys. Rev. Lett. 59 (1987) 2044.
25. B.-G. Englert, Phys. Rev. Lett. 77 (1996) 2154.
26. S. Dürr, T. Nonn and G. Rempe, Nature 395 (1998) 33.
27. A. A. Abdo et al. (Fermi LAT and GBM), Nature 462 (2009) 331.
28. Particle Data Group, S. Navas et al., Phys. Rev. D 110 (2024) 030001.
29. O. Heaviside, Electromagnetic Theory, vol. 1 (The Electrician, 1893).
30. J. Larmor, Phil. Trans. R. Soc. A 190 (1897) 205.
31. L. Silberstein, Ann. Phys. 327 (1907) 579.
32. L. Landau, Z. Phys. 64 (1930) 629.
33. P. A. M. Dirac, Proc. R. Soc. A 133 (1931) 60.
34. G. Lüders, Dan. Mat. Fys. Medd. 28, no. 5 (1954).
35. W. Pauli, in Niels Bohr and the Development of Physics (Pergamon, 1955) 30.
36. Y. Aharonov and D. Bohm, Phys. Rev. 115 (1959) 485.
37. B. D. Josephson, Phys. Lett. 1 (1962) 251.
38. K. von Klitzing, G. Dorda and M. Pepper, Phys. Rev. Lett. 45 (1980) 494.
39. D. J. Thouless, M. Kohmoto, M. P. Nightingale and M. den Nijs, Phys. Rev. Lett. 49 (1982) 405.
40. I. Bialynicki-Birula, Prog. Opt. 36 (1996) 245.
41. B. Jeckelmann and B. Jeanneret, Rep. Prog. Phys. 64 (2001) 1603.
42. E. K. Anderson et al. (ALPHA-g), Nature 621 (2023) 716.
43. G. Kirchhoff, Ann. Phys. 64 (1845) 497.
44. M. Born and L. Infeld, Proc. R. Soc. A 144 (1934) 425.
45. H. Euler and W. Heisenberg, Z. Phys. 98 (1936) 714.
46. ATLAS Collaboration, Nature Phys. 13 (2017) 852.

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its engine uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main, read at commit 38f6678.

1.  Root Axiom and Existence: Publication Library/Philosophy/Metaphysics/Root Axiom/TOE\_Zero.lean. Compiled alone in core Lean 4.19.0, exit 0.
2.  RH master: Publication Library/Mathematics/Millennium Series/RH\_Both\_Sides\_Formal\_Master\_v3\_0\_44\_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.
3.  Existence, as carried in the RH master: line 6635.
4.  Heat Bridge: RH master, Parts VII-c and VII-d.
5.  Prime Freedom: RH master, Parts XIII and XIV.
6.  Freedom Arrow: RH master, Part XV.
7.  Least Erasure: protocols/RH One Bit/Nothing Escapes Three Plus One/Least\_Erasure.lean. Compiled alone in core Lean 4.19.0, exit 0.
8.  Second Law: Publication Library/Mathematics/Mathematical Physics/Second\_Law\_Theorem\_v1\_0\_0\_CC.pdf, with its Lean file printed inside.
9.  P versus NP master: FINAL\_BINDING/PNP Binding/PNP\_Normal\_Form\_Paper\_v1\_14\_0\_CC.lean
10. ZFC seal: lean/ZFC\_Block\_Hardened\_FINAL\_v2\_0\_0\_Hermetically\_Sealed.lean
11. No Second Sovereign: Publication Library/Mathematics/Millennium Series/No\_Second\_Sovereign\_v1\_0\_0\_CC.lean
12. Future Proof Empirical Witness Seal: Publication Library/Mathematics/Millennium Series/Future\_Proof\_Empirical\_Witness\_Seal\_v1\_0\_0\_CC.lean

## Appendices

**Appendix A · SPHYS_Maxwell_Forced_CC.lean.** Lean 4.19.0 with Mathlib 4.19.0. 40 theorems, no axiom declared, no `sorry`, exit 0 with no warning. The kernel lines are Appendix D. *[a printed file, 546 lines, in the master and in the Journal edition]*

**Appendix B · Maxwell_Forced_Twin_CC.f90.** Fourteen checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix C. *[a printed file, 229 lines, in the master and in the Journal edition]*

**Appendix C · Run of Appendix B.** ```text
 A. The law, on 200 random waves for each of 1331 laws with whole constants from -5 to 5
   largest residual of the divergence of the law against its formula:  1.42E-14
  PASS  the divergence of the law is (a + b)(k.k)(k.e) + m (k.e)
   laws conserved on every wave: 11   laws unchanged by every gauge turn: 11
  PASS  the conserved laws are the eleven with b = -a and m = 0, and no other
  PASS  conserved and unchanged by a gauge turn coincide on all 1331
 B. Waves, 200 random wave vectors in each dimension from 3 to 7
   largest residual of the divergence of the field of a wave:  1.78E-15
  PASS  the divergence of the field of a wave is (k.k) e - (k.e) k
  PASS  on the cone the fields of the waves form a space of dimension n - 2, in every case
  PASS  off the cone the only solutions are multiples of k, whose field is zero
 C. The static half, 200 random points in each dimension of space from 2 to 6
   largest relative residual of the divergence of x r^c against (d + c) r^c:  6.06E-08
  PASS  the divergence of the radial field x r^c is (d + c) r^c
  PASS  the power c = -d is free of sources in every dimension
  PASS  rival, the inverse square in every dimension: free of sources in three and in no other
 D. The classical counts, dimensions 2 to 60
  PASS  electric and magnetic parts, and the waves of light and of gravity, are equal in number in four only
 E. Against published measurements
   deviation of the exponent of the static law from two: measured  2.7E-16 +-  3.1E-16, forced 0 at  0.87 uncertainties
  PASS  the inverse square: forced deviation 0 within two uncertainties (Williams, Faller and Hill 1971)
   constant of thermal radiation: two waves  5.67037E-08, three  8.50556E-08, measured (5.66967 +- 0.00076)e-8
   two waves at  0.93 uncertainties, three at   3731.4 uncertainties
  PASS  two waves give the measured constant of thermal radiation within two uncertainties (Quinn and Martin 1985)
  PASS  rival, three waves in equilibrium: excluded by more than five uncertainties
   speed of gravity less speed of light, over the speed of light: between -3e-15 and 7e-16; forced 0
  PASS  one speed for light and gravity: forced difference 0 inside the measured interval (Abbott et al. 2017)
   reading, not a check: forced mass of the photon 0; measured below 1e-18 eV (Ryutov 2007)
   reading, not a check: forced decay of the electron none; lifetime above 6.6e28 years (Borexino 2015)
 BATTERY-JSON: {"checks":14,"failures":0} *[a printed file, 30 lines, in the master and in the Journal edition]*

**Appendix D · Kernel lines of Appendix A.** Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own. *[a printed file, 46 lines, in the master and in the Journal edition]*
