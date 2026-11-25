# Three Dimensions of Space as a New Mathematical Theorem

## Weight, Waves, Light Bent Twice, Stable Orbits and Two Statistics Hold Together in Three Dimensions and in No Other

**Mohammad F. Islam PhD** · 25 November 2026

*Blog edition of the master, edition 2.0.0 of 25 November 2026. It renders the whole text. The printed files of the appendices stand in the master and in the Journal edition, and are listed at the end.*

## Abstract

This paper proves, in Lean 4 with Mathlib, that five properties of the laws of gravity, light and matter depend on the dimension *d* of space in ways that meet at three and nowhere else. The law of gravity is an equation between matrices of size *d* + 1: the curvature, less half its trace times the metric, is a constant times the source. Taking its trace gives, for matter at rest of density *ρ*, a curvature along the time of (*d*−2)/(*d*−1) times *κ**ρ* and along each direction of space of 1/(*d*−1) times *κ**ρ*. So with one dimension of space the law leaves no matter at rest; the curvature along the time is not zero exactly when *d* is not two; and the curvatures of space and of time are equal exactly when *d* is three. The field of a point is a radial field in a ring with derivatives, and it is free of sources for one power of the distance only, so the force falls as the power *d* − 1. The orbit is a real function: under a force of power *p* the derivative of the radial force at a circular orbit is (*p*−3) *k* *r*^(−p − 1), negative exactly when *p* is below three. A number by which the permutations act is one or the sign, two statistics and no third, while the integers, which count the exchanges of two particles in a plane, act by every number that has an inverse. The paper then states the five properties as conditions on *d*: weight, waves of gravity, space and time curved alike, a stable orbit, and two statistics. They hold together exactly when *d* is three, and each of weight, waves and two statistics, taken with the stable orbit alone, gives three. The premises are two: matter at rest has weight, and a planet keeps its orbit. They are fields of one printed structure, they force *d* = 3, and they are met. Three things are cited and named where they are used: that the curvature along the time is the weight and the ratio of space to time the share of space in the bending of light; that the count of the waves of gravity is (*d*+1)(*d*−2)/2; and that exchanges are permutations from three dimensions on. A Fortran twin solves the law of gravity as a linear system in each dimension, differentiates the field and the force numerically, integrates the orbit, and sets the readings against measurement: the share of space in the bending of light at one, with the value of four dimensions excluded by more than twenty thousand uncertainties. Part II states the reading from which the paper takes its place in the series, at premise grade and apart from the machine-checked claims.

## 1. The Theorem and What It Rests On

### 1.1 The statement

Let space have *d* dimensions and spacetime *d* + 1, with signs plus for the time and minus for space. The law of gravity for a curvature *R*ᵢⱼ and a source *T*ᵢⱼ is

*R*ᵢⱼ − (1/2)  *R* *g*ᵢⱼ = *κ* *T*ᵢⱼ,   *R* = ∑ᵢ*g*ᵢᵢ*R*ᵢᵢ,

and matter at rest is the source with *T*₀₀ = *ρ* and every other component zero.

**Theorem (`dust_time`, `dust_space`).** For matter at rest, (*d*−1) *R*₀₀ = (*d*−2) *κ**ρ*, and (*d*−1) *R*ᵢᵢ = *κ**ρ* along each direction of space.

**Theorem (`weight_exactly`, `bent_twice_exactly`).** For *d* not one and *κ**ρ* not zero: *R*₀₀ is not zero exactly when *d* is not two, and *R*ᵢᵢ = *R*₀₀ exactly when *d* is three.

**Theorem (`orbit_stiffness`, `stable_exactly_below_three`).** Under a force of power *p* and strength *k*, the derivative of the radial force *L*²*r*⁻³ − *k* *r*^(−p) at a circular orbit of radius *r*₀ is (*p*−3) *k* *r*₀^(−p − 1). For *k* and *r*₀ positive it is negative exactly when *p* &lt; 3.

**Theorem (`together_exactly_in_three`).** For *d* at least one, the five conditions of Section 7 hold together exactly when *d* = 3.

**Theorem (`three_forced`).** On the premises below, *d* = 3.

The law of gravity is Einstein’s \[3\]. That the stable orbit singles out three dimensions is Ehrenfest’s argument \[1\], on the theorem of Bertrand \[2\]. The premises are met: `threePremises` constructs a term of the structure at *d* = 3, with the curvature of matter at rest written out.

### 1.2 The premises, printed

The physical premises of the paper are the fields of this structure of the Lean file, and there are no others. What is cited is in the tables of Section 1.3.

``` lean
structure Premises where
  d : ℕ
  space : 1 ≤ d
  weight : ∃ (Ric : Fin (d + 1) → Fin (d + 1) → ℚ) (κ ρ : ℚ), κ * ρ ≠ 0 ∧ Law d Ric (dust d ρ) κ ∧ Ric 0 0 ≠ 0
  orbit : 2 ≤ d ∧ ∃ k r0 : ℝ, 0 < k ∧ 0 < r0 ∧
    (((d - 1 : ℕ) : ℝ) - 3) * k * r0 ^ (-(((d - 1 : ℕ) : ℤ)) - 1) < 0
```

It carries two premises. The first is the field `weight`: the law of gravity has a solution for matter at rest, with *κ**ρ* not zero, whose curvature along the time is not zero. The second is the field `orbit`: space holds a plane, and under a force of power *d* − 1 the stiffness of a circular orbit is negative. No field of `Premises` states the value of *d*, an equation for it, or the conclusion of any theorem. That the force of a point falls as the power *d* − 1 is the theorem of Section 4, used in the wording of the second field; that a negative stiffness means the orbit is kept, and that the curvature along the time is the weight, are the readings of the third table. Section 9 states where the premises come from.

### 1.3 What is proved, what is cited, what is assumed

- **The trace of the law, and the law with its trace reversed** · Standing: Proved, over every field of characteristic zero, in every dimension; Where: Appendix A, Part I
- **Matter at rest: (*d*−1)*R*₀₀ = (*d*−2)*κ**ρ* and (*d*−1)*R*ᵢᵢ = *κ**ρ** · Standing: Proved; Where: Part I
- **With one dimension of space, *κ**ρ* = 0** · Standing: Proved; Where: Part I
- **R*₀₀ ≠ 0 exactly when *d* ≠ 2; (*d*−2)*R*ᵢᵢ = *R*₀₀; *R*ᵢᵢ = *R*₀₀ exactly when *d* = 3** · Standing: Proved, for *d* not one and *κ**ρ* not zero; Where: Part I
- **A radial field of power *c* in *d* dimensions has divergence *d* + *c* times the power, and is free of sources for *c* =  − *d* only** · Standing: Proved, for elements of an arena that obey the stated relations; Where: Part II

The table continues with the orbit, the statistics and the premises.

- **The derivative of the radial force at a circular orbit is (*p*−3) *k* *r*₀^(−p − 1); negative exactly when *p* &lt; 3, positive exactly when *p* &gt; 3** · Standing: Proved, as a derivative of a real function; Where: Part III
- **A number by which the permutations act is one or the sign** · Standing: Proved, for values in a commutative domain; Where: Part IV
- **The integers act by every number that has an inverse** · Standing: Proved; Where: Part IV
- **The five conditions hold together exactly at *d* = 3; three pairs each give three; the bending alone gives three** · Standing: Proved, as conditions on a natural number; Where: Part VI
- **On the premises *d* = 3; the premises are met** · Standing: Proved; Where: Part VI

What is not machine-checked is in the third table.

- **Matter at rest has weight, and a planet keeps its orbit** · Standing: Premises; measured; Where: Sections 7, 9
- **The curvature along the time is the weight, and the ratio of the curvatures of space and time is the share of space in the bending of light** · Standing: The weak-field reading, cited: \[17\] in four dimensions, \[4\] in every dimension; Where: Section 3
- **A negative stiffness means the orbit is kept, and a positive one that it is lost** · Standing: Cited: \[1, 2\]; Where: Section 4
- **The relations of the radial theorems are met by the powers of the distance on space less a point** · Standing: Elementary analysis, not formalised; executed by the twin; Where: Sections 4, 8
- **Exchanges of identical particles are permutations from three dimensions on, and in a plane are counted by the integers** · Standing: Topology, cited: \[6\]; the condition `TwoStatistics` is entered from it; Where: Section 5
- **Gravity has (*d*+1)(*d*−2)/2 waves; light has *d* electric and *d*(*d*−1)/2 magnetic parts; a gauge coupling has the dimension of a length to the power (*d*−3)/2** · Standing: Classical counts, entered; the theorems on them are arithmetic; Where: Section 6
- **The measured values of the twin** · Standing: Entered from the literature \[8, 9, 10, 11\]; numerical, not machine-checked; Where: Section 8

The paper claims as machine-checked the rows marked proved and no others. A row marked cited is a result with a published proof that this work has not machine-checked. A row marked entered is a classical count or a measured value; the theorems that use a count are arithmetic on it. Part II, the reading, is outside these tables: it is premise-grade and is labelled so where it begins.

## 2. Four Laws in Any Number of Dimensions

Each of the laws of this paper can be written in any number of dimensions, and each is written here in the mathematics that carries it, in the kernel of Lean 4 \[15\] on the library Mathlib \[14\]. The law of gravity is an equation between square matrices of size *d* + 1 over a field, with the dimension a natural number. The field of a point lives in an arena: a commutative ring with linear maps that commute and obey the rule of the product, as in the companion paper on light \[18\]. The orbit is a function of a real variable, and its stiffness is a derivative in the sense of analysis. The statistics are maps from groups to numbers that send products to products.

The definitions `sg`, `trg`, `Law` and `dust` are the signs, the trace, the law of gravity and matter at rest of Section 1.1. The definitions `Weighs`, `Waves`, `BentTwice`, `Stable` and `TwoStatistics` are the five conditions of Section 7. The companion papers force the laws; this paper does not force them again. It takes the law of gravity and the law of the static field as written, and proves what they say in each dimension. The question is an old one \[21, 22\].

## 3. Weight, and Space Curved as Time

Nothing in this section is assumed beyond the law. Each statement is a theorem of Appendix A.

**The trace (`trace_of_the_law`, `trace_reversed`).** The trace of the metric is *d* + 1, so the trace of the law is 2*κ* *T* = (1−*d*) *R*, where *T* is the trace of the source. Putting it back, (*d*−1) *R*ᵢⱼ = *κ*((*d*−1) *T*ᵢⱼ − *T* *g*ᵢⱼ).

**Matter at rest (`dust_time`, `dust_space`).** Its trace is *ρ*. So (*d*−1) *R*₀₀ = (*d*−2) *κ**ρ* and, along each direction of space, (*d*−1) *R*ᵢᵢ = *κ**ρ*.

**A line (`no_dust_on_a_line`).** With *d* = 1 the second equation reads 0 = *κ**ρ*: the law leaves no matter at rest at all.

**Weight (`weight_exactly`).** For *d* not one and *κ**ρ* not zero, *R*₀₀ ≠ 0 exactly when *d* ≠ 2. In the weak field the curvature along the time is the source of the Newtonian potential \[17\], so this is the statement that matter at rest attracts, in every dimension but two. In the plane a mass attracts nothing, which is classical \[5\]. That reading of *R*₀₀ is cited; what compiles is the equation.

**Space as time (`space_over_time`, `bent_twice_exactly`).** For *d* not one, (*d*−2) *R*ᵢᵢ = *R*₀₀: the curvature of space is 1/(*d*−2) of the curvature of time. They are equal exactly when *d* = 3. Light passing a mass is bent by both, and Newton’s law has the first alone, so the bending is twice Newton’s exactly when the two are equal; that reading is the weak field of \[17\] in four dimensions of spacetime and the solution of Tangherlini \[4\] in every dimension, and it is cited.

## 4. The Force of a Point, and the Orbit

**The force (`radial_divergence`, `only_one_power_is_free_of_sources`, `the_field_falls`).** Let *x*ᵢ be coordinates of *d* directions in an arena, *u* = ∑ⱼ*x*ⱼ², and *w* a field with (∂ᵢ*w*) *u* = *c* *x*ᵢ *w*, the power *c* of the distance. The divergence of the radial field *x*ᵢ*w*, times *u*, is (*d*+*c*) *w* *u*. In a ring without divisors of zero, with *w* *u* not zero, the field is free of sources only for *c* =  − *d*. The square of its size is then the power 2 − 2*d* of the distance, so the field, and the force it exerts, falls as the power *d* − 1. These are the theorems of the companion paper on light \[18\], compiled again here so that the file stands alone. That the relations are met by the powers of the distance is elementary analysis and is not formalised.

**The stiffness (`orbit_stiffness`).** A body in a plane under a central force of power *p* and strength *k*, with *L*² the square of its angular momentum, has the radial force *L*²*r*⁻³ − *k* *r*^(−p). At a circular orbit of radius *r*₀ the two terms cancel. The derivative of the radial force there is

(*d*/*d**r*)(*L*²*r*⁻³ − *k* *r*^(−p))\|_(r₀) = (*p*−3) *k* *r*₀^(−p − 1).

It is proved as a derivative of a real function, for every natural *p*.

**Below three (`stable_exactly_below_three`).** For *k* and *r*₀ positive the stiffness is negative exactly when *p* &lt; 3 and positive exactly when *p* &gt; 3. A negative stiffness pulls a disturbed orbit back, and a positive one pushes it away; that a negative stiffness means the orbit is kept is the classical criterion \[1, 2\], cited. With *p* = *d* − 1 the orbit is kept for *d* below four. An orbit needs a plane, so *d* is at least two.

## 5. Two Statistics, and the Plane

**Two and no third (`a_sign_is_plus_or_minus_one`, `two_statistics_and_no_third`).** Let the permutations of finitely many things act on amplitudes by a number, a map to a commutative domain that sends products to products. Then the map is one on every permutation or it is the sign. This is the theorem of the companion paper on matter \[20\], compiled again here.

**The plane (`in_the_plane_every_phase_is_a_statistics`).** The integers, as a group, act by any number that has an inverse: for every such *u* there is a map that sends products to products and sends the generator to *u*.

**Where the dimension enters.** In three dimensions of space and above the exchanges of identical particles form the permutations, and in a plane the exchanges of two particles are counted by the integers \[6\]. That is topology and is cited. With it, the two theorems say: two statistics and no third from three dimensions on, and every phase in the plane. The condition `TwoStatistics` of Section 7 is entered from this and is not derived.

## 6. Waves and Counts

The theorems of this section are arithmetic on classical counts, which are entered and not derived here.

**Waves of gravity (`gravity_has_waves_exactly_from_three`).** A wave of gravity in *d* dimensions of space has (*d*+1)(*d*−2)/2 independent states, a classical count \[7, 17\]. It is at least one exactly when *d* is at least three. Such waves are observed \[12\].

**Three more counts.** With *n* = *d* + 1: the electric and the magnetic parts of light are equal in number exactly when *n* = 4 (`electric_and_magnetic_are_equal_in_number_exactly_in_four`); the waves of light and of gravity are equal in number exactly when *n* = 4 (`light_and_gravity_have_equal_waves_exactly_in_four`); and the coupling of a gauge field is a pure number exactly when *n* = 4 (`the_coupling_is_a_pure_number_exactly_in_four`). The counts are those of the companion papers \[18, 19\].

## 7. Together

The five conditions are written as conditions on a natural number, each in the form its theorem or its source gives.

- **`Weighs`: matter at rest has weight** · In the file: *d* ≠ 1 and *d* ≠ 2; From: `no_dust_on_a_line`, `weight_exactly`
- **`Waves`: gravity has a wave** · In the file: 2 ≤ (*d*+1)(*d*−2); From: the cited count, Section 6
- **`BentTwice`: space and time curve alike** · In the file: *d* − 2 = 1; From: `bent_twice_exactly`
- **`Stable`: a planet keeps its orbit** · In the file: 2 ≤ *d* and *d* − 1 &lt; 3; From: `stable_exactly_below_three`, with the power *d* − 1
- **`TwoStatistics`: two statistics and no third** · In the file: 3 ≤ *d*; From: the cited topology, Section 5

**Together (`together_exactly_in_three`).** For *d* at least one, the five hold together exactly when *d* = 3.

**Pairs (`weight_and_orbits_give_three`, `waves_and_orbits_give_three`, `statistics_and_orbits_give_three`, `bending_alone_gives_three`).** Three of the conditions open at three and one closes above it. Weight with the stable orbit gives three; waves with the stable orbit give three; two statistics with the stable orbit give three; and the bending alone gives three.

**On the premises (`three_forced`, `threePremises`).** The structure of Section 1.2 does not use the conditions as written above. Its fields say that the law of gravity has a solution with weight and that the stiffness of the orbit is negative, and the theorems of Sections 3 and 4 turn those into *d* ≠ 1, *d* ≠ 2 and *d* − 1 &lt; 3 with *d* ≥ 2. So *d* = 3. At *d* = 3 the law is solved by a curvature equal to one along every direction, with *κ* = 2 and *ρ* = 1, and the stiffness with *k* = *r*₀ = 1 is  − 1: the premises are met.

## 8. The Numerical Twin

The twin of Appendix B does three things the kernel does not. It executes each statement independently, it integrates the orbit, and it sets the readings against published measurements.

**Gravity.** For each *d* from 1 to 8 the twin writes the law for matter at rest as a linear system for the diagonal of the curvature and solves it by elimination. With one dimension of space the system is singular. From 2 to 8 the solution is (*d*−2)/(*d*−1) along the time and 1/(*d*−1) along space; the time component is zero at *d* = 2 only, and space equals time at *d* = 3 only.

**The point and the orbit.** At 50 points in each dimension from 2 to 8 the radial field of size *r*^(1 − d) has no divergence by differences. The derivative of the radial force by differences agrees with (*p*−3) *k* *r*^(−p − 1) for *p* from 0 to 6. A circular orbit with its speed changed by one percent, integrated for sixty turns, holds for *d* = 2 and 3 and is lost for *d* = 4, 5 and 6.

**The measurements.** The inputs are measured and are printed in Appendix B.

- **Share of space in the bending of light, less one** · Three dimensions: 0; Rival: − 1/2 (four dimensions); Measured: (2.1±2.3) × 10⁻⁵ \[8\]
- **Exponent of the static law of charge, less two** · Three dimensions: 0; Measured: (2.7±3.1) × 10⁻¹⁶ \[9\]
- **Dimensions of spacetime from a wave of gravity** · Three dimensions: 4; Rival: 5; Measured: 4.02_(−0.10)^(+0.07) \[10\]
- **A third statistics in three dimensions** · Three dimensions: none; Measured: violation of exclusion below 3.4 × 10⁻²⁹ \[11\]

A measured check passes when the forced value lies within two of the quoted uncertainties, and a rival is excluded when it lies further than five. Eleven checks pass and none fails. The share of space stands at 0.91 of its uncertainty and the value of four dimensions at 21740; the exponent at 0.87; four dimensions of spacetime at 0.20 and five at 14.0. The inverse square of gravity itself holds down to 52 micrometres \[13\]. Three limits are stated. The orbit run illustrates a classical theorem and proves nothing; the statement of the engine is the sign of the stiffness, and at the power three, where the stiffness is zero, the run loses the orbit. The bound on a third statistics is printed as a reading and is not counted. And every measurement here precedes this work: the table is agreement with the record, not a new prediction.

## 9. Discussion: The Reading

The derivation above uses algebra and one derivative. This section states the reading from which the premises come, and marks what in it is theorem and what is premise.

**Why these two.** In the reading of Part II the laws of gravity, light, matter and the nuclear forces are each forced from one seat \[16\], in four companion papers \[17, 18, 19, 20\]. Each law can be written in any number of dimensions, and the seat does not choose the number. What chooses is the world: an apple falls, and a planet keeps its orbit. Those are the fields `weight` and `orbit`. They are physics, measured, and are not theorems of this paper. What the paper proves is that they leave one dimension.

**Why the other three are not premises.** Waves of gravity and two statistics each give three with the stable orbit, and the bending of light gives three alone. They are not needed, and two of them rest on a cited count and a cited piece of topology. The paper keeps the premises to the two whose consequences compile from the law to the number, and reports the other three as agreeing.

**What the paper does not claim.** It does not derive that space has three dimensions from nothing: it derives it from two measured facts and the forced laws. It does not prove the weak-field reading, the criterion of the stable orbit, the count of the waves of gravity, or the topology of exchanges; each is cited. It does not claim that the argument of Ehrenfest was unknown. It claims that the dependence on the dimension of each of the five is what Section 1.3 says, that the five meet at three and nowhere else, and that each statement marked proved compiles. No theorem of Sections 2 to 8 depends on Part II.

## 10. Predictions, Falsifiers, and What Stands

The paper recovers the dimension of space. It predicts no measurement that the laws do not and derives no constant. Its commitments are those of three dimensions, and they are stated here as commitments: three that the paper says will stand at any future precision, two proposals it says will fail, and the three observations that would refute it.

### 10.1 Three predictions that will stand

1.  **Space and time bend light alike.** `bent_twice_exactly` gives equality at three and nowhere else. The measured share of space is 1 + (2.1±2.3) × 10⁻⁵ \[8\]. The prediction is that it stays at one.
2.  **The force of a point falls as the inverse square.** `only_one_power_is_free_of_sources` gives the power *d* − 1. The law holds for gravity down to 52 micrometres \[13\] and for charge to parts in 10¹⁶ \[9\]. The prediction is that no range is found at which the power changes.
3.  **A wave of gravity thins as in four dimensions of spacetime.** `three_forced` gives three of space, four with the time. The measured value is 4.02_(−0.10)^(+0.07) \[10\]. The prediction is that it stays at four.

### 10.2 Two proposals that will fail

1.  **A further dimension of space open to gravity or to light at any range.** At that range the force would fall as a higher power and, by `stable_exactly_below_three`, no orbit there would be kept. The paper predicts that no such range is found.
2.  **A third statistics for particles free in three dimensions.** `two_statistics_and_no_third` leaves none once exchanges are permutations. The paper predicts that every statistics between the two is found only where the exchanges are not permutations, as in the plane.

### 10.3 The three falsifiers

Each is a forbidden observation. No observation breaks a theorem; each refutes a premise, or the laws as written as the laws of nature, and each names the theorem that carries the consequence. The threshold in each case is five of the experiment’s printed uncertainties.

1.  **A share of space in the bending of light that is not one.** It refutes three dimensions through `bent_twice_exactly`, or the law of gravity as written.
2.  **A force of a point, of gravity or of charge, that does not fall as the inverse square at some range.** It refutes three dimensions at that range through `only_one_power_is_free_of_sources`, and with it the field `orbit` as read there.
3.  **Matter at rest that does not attract.** It refutes the field `weight`.

Apart from them stands the formal claim, which no observation touches and one compilation settles: every theorem named in this text prints its axioms in Appendix D, and a line that names an axiom other than `propext`, `Classical.choice` and `Quot.sound`, or a file that fails to compile under Lean 4.19.0 and Mathlib 4.19.0, refutes the claim that the statements are proved.

### 10.4 What kind of result this is

It is not a new physics. It is a change in how an old argument can be checked. That the laws single out three dimensions is here a single file whose every step the kernel has verified, whose assumptions are two fields of one structure, and whose readings are set against measurement. A reader who doubts a step can name the line.

The implication from `Premises` to *d* = 3 is checked by the Lean kernel. No experiment and no later revision of physics alters an implication. Experiment remains free to test whether nature satisfies the premises, and that is all it can test here. What the kernel certifies is the Lean statements; that the definitions of the file say what this text says they say is for the reader to check, and the structure `Premises` is printed for that purpose. What stands is the tables of Section 1.3.

## 11. Part II · The Reading

*This part is the reading from which the paper takes its place in the series. It is premise-grade. It is not among the machine-checked claims of Section 1.3, and no theorem of Sections 2 to 8 depends on it. The seat it names is that of Nothing Escapes, Least Erasure (Islam, 2026a), and the four laws it names are forced in the four companion papers, each on its own premises, which are printed there and not here.*

### 11.1 One Seat, Four Laws, One Number

The series reads physics on one seat: a reflection of the plane, the line it fixes, and a record that keeps what is registered. On that seat four laws are forced, each in its own paper and each on its own printed premise. The law of gravity is forced by the conservation of its source (Islam, 2026b). The law of light is forced by the conservation of charge (Islam, 2026c). The law of the nuclear forces is forced by the invariance of the field under a turn of the charge (Islam, 2026d). The law of matter is forced by least order (Islam, 2026e).

None of the four chooses the dimension of space. Each can be written in any number of dimensions, and in each the forcing goes through as it does in three. The seat is silent on the number.

The reading of this paper is that the number is not a further law. It is where the four laws, once forced, describe one world. Each carries a property that changes with the dimension. Gravity gives matter weight from three dimensions on, gives itself a wave from three on, and curves space as it curves time in three only. Light gives the force of a point the power one less than the dimension, and with it an orbit that is kept up to three dimensions and no further. Matter has two statistics and no third from three on. The properties were not chosen for their answer: each is the first thing its law says about the dimension, and each is measured.

Three of them open at three and one closes above it. That is why the answer is a single number and not a range, and why it does not lean on one clause. Below three, weight, waves and two statistics each fail by its own theorem. Above three the orbit fails, and the bending of light fails with it. The four further counts of Section 6, which were not used to reach three, return it.

### 11.2 What the Reading Adds, and What It Does Not

The reading adds one claim to the theorems: that the dimension of space is not an independent fact about the world, but the one value at which laws forced separately agree with one another and with what is measured. That claim is not machine-checked and is not a theorem of this paper. It is a statement about the series, and it stands or falls with the four companion papers and their premises.

It does not add a derivation of three from the seat alone. The paper takes two measured facts, that matter at rest has weight and that a planet keeps its orbit, and the theorems of Sections 3 and 4 do the rest.

One falsifier belongs to the reading and stands beside the three of Section 10.3. A further dimension of space, open to gravity or to light at any range, would change the fall of the force from the inverse square, the bending of light from twice Newton’s, and the thinning of a wave of gravity with distance. Each is measured, and none has moved.

## 12. Closure

That the laws single out three dimensions of space is no longer informal prose. From an equation between matrices, a ring with derivatives, a real function and two groups, and nothing more, Lean 4 with Mathlib compiles the trace of the law of gravity in every dimension, the curvature of matter at rest along time and along space, the absence of matter at rest on a line, the weight in every dimension but two, the equality of space and time in three only, the one power of the distance that is free of sources, the stiffness of a circular orbit under a force of any power, its sign on each side of the power three, the two statistics of the permutations, and the phases of the integers. No axiom is declared. No proof is left open. No headline theorem closes by its own hypothesis or over a structure that carries its conclusion.

The argument of Ehrenfest is recovered as one clause of five. Weight, waves, space curved as time, the stable orbit and two statistics are each written as a condition on the dimension, and they hold together at three and nowhere else. Three pairs give three without the bending of light, and the bending gives it alone. The numerical twin solves the law of gravity in each dimension, integrates the orbit, and sets the readings against measurement: the share of space in the bending of light at one, with the value of four dimensions excluded by more than twenty thousand uncertainties.

Every boundary is in plain sight. That matter at rest has weight and that a planet keeps its orbit are two fields of one printed structure. That the curvature along the time is the weight, and the ratio of space to time the share of space in the bending of light, is the weak-field reading, cited. That a negative stiffness keeps the orbit is the classical criterion, cited. That exchanges are permutations from three dimensions on is topology, cited, and the condition on the statistics is entered from it. The count of the waves of gravity is classical, entered. That the radial relations are met by the powers of the distance is elementary analysis, not formalised.

That structure is not an arbitrary postulate. The two statements the reading rests on, Existence and Least Erasure, are theorems in their own domain: each has its own compiled Lean file, with no axiom declared, listed in the Lean Library Reference. There they are proved. The Heat Bridge, which joins erasure to heat, is a theorem there as well; the bridge spoken of below is a different one, from that domain to physics. Here they are used, and the difference is stated. Between that domain and the laws of this paper lies a physical bridge, crossed in the four companion papers, and after it a fact of the world: that matter has weight and that orbits are kept. This paper does not claim either as a theorem. It writes the two facts down as `Premises`, so that the engine imports nothing outside Mathlib and can be checked alone, and so that a reader can see exactly which sentences carry the physics.

Two things are therefore separate, and the paper keeps them separate. Inside the kernel, the implication from `Premises` to three dimensions is a mathematical certainty. No experiment, no consensus and no later revision of physics alters it, and anyone can recheck it with one compilation. Outside the kernel stand three falsifiers. They test whether nature satisfies the premises, and so far nature does. What survives both is not opinion. It is a theorem, and a physics that has met every test of its premises.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author’s. The Lean file and the Fortran twin are written by a language model under the author’s direct supervision. Every theorem named in the text of Sections 1 to 10 and 12 is in Appendix A under that name, and its kernel line is printed in Appendix D. Classical results that are cited and not formalised are named as such in Section 1.3 and wherever they are used. No constant of nature is derived anywhere in this paper; the numbers of the twin are computed from the laws as written and from measured inputs, which Appendix B prints.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1.  P. Ehrenfest, Proc. Amsterdam Acad. 20 (1917) 200.
2.  J. Bertrand, C. R. Acad. Sci. 77 (1873) 849.
3.  A. Einstein, Ann. Phys. 49 (1916) 769.
4.  F. R. Tangherlini, Nuovo Cimento 27 (1963) 636.
5.  S. Deser, R. Jackiw and G. ’t Hooft, Ann. Phys. 152 (1984) 220.
6.  J. M. Leinaas and J. Myrheim, Nuovo Cimento B 37 (1977) 1.
7.  E. P. Wigner, Ann. Math. 40 (1939) 149.
8.  B. Bertotti, L. Iess and P. Tortora, Nature 425 (2003) 374.
9.  E. R. Williams, J. E. Faller and H. A. Hill, Phys. Rev. Lett. 26 (1971) 721.
10. K. Pardo, M. Fishbach, D. E. Holz and D. N. Spergel, J. Cosmol. Astropart. Phys. 07 (2018) 048.
11. H. Shi et al. (VIP-2), Eur. Phys. J. C 78 (2018) 319.
12. B. P. Abbott et al. (LIGO and Virgo), Phys. Rev. Lett. 116 (2016) 061102.
13. J. G. Lee, E. G. Adelberger, T. S. Cook, S. M. Fleischer and B. R. Heckel, Phys. Rev. Lett. 124 (2020) 101101.
14. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
15. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
16. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
17. M. F. Islam, Immanent Gravity as a Machine-Checked Mathematical Theorem, edition 4.0.0 (2026b).
18. M. F. Islam, Light as a New Mathematical Theorem, edition 2.0.0 (2026c).
19. M. F. Islam, The Nuclear Forces as a New Mathematical Theorem, edition 2.0.0 (2026d).
20. M. F. Islam, Matter as a New Mathematical Theorem, edition 2.0.0 (2026e).
21. I. Kant, Gedanken von der wahren Schätzung der lebendigen Kräfte (1747).
22. G. J. Whitrow, Br. J. Philos. Sci. 6 (1955) 13.

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

**Appendix A · SPHYS_Three_Dimensions_CC.lean.** Lean 4.19.0 with Mathlib 4.19.0. 28 theorems, no axiom declared, no `sorry`, exit 0 with no warning. The kernel lines are Appendix D. *[a printed file, 470 lines, in the master and in the Journal edition]*

**Appendix B · Three_Dimensions_Twin_CC.f90.** Eleven checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix C. *[a printed file, 222 lines, in the master and in the Journal edition]*

**Appendix C · Run of Appendix B.** ```text
 A. The five conditions of the engine, d = 1..12
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
  PASS  each pair with stable orbits, and the three counts of light and the coupling: 3 only
 B. The law of gravity for matter at rest, solved in each dimension
    d   time / (kappa rho)   space / (kappa rho)   space over time
    2            0.000000            1.000000        no weight
    3            0.500000            0.500000            1.000000
    4            0.666667            0.333333            0.500000
    5            0.750000            0.250000            0.333333
    6            0.800000            0.200000            0.250000
    7            0.833333            0.166667            0.200000
    8            0.857143            0.142857            0.166667
  PASS  the solution is (d - 2)/(d - 1) along the time and 1/(d - 1) along space, d = 2..8
  PASS  with one dimension of space the system is singular: no matter at rest
  PASS  the time component is zero at d = 2 only, and space equals time at d = 3 only
 C. The field of a point, 50 points in each dimension of space from 2 to 8
  PASS  the radial field of size r^(1-d) is free of sources: the force falls as the power d - 1
 D. The orbit
   largest relative residual of the stiffness against (p - 3) k r^(-p-1), p = 0..6:  5.67E-09
  PASS  the derivative of the radial force at a circular orbit is (p - 3) k r^(-p-1)
   a circular orbit, speed changed by one percent, sixty turns
   d = 2: force falls as the power 1;  orbit held = T
   d = 3: force falls as the power 2;  orbit held = T
   d = 4: force falls as the power 3;  orbit held = F
   d = 5: force falls as the power 4;  orbit held = F
   d = 6: force falls as the power 5;  orbit held = F
  PASS  the orbit holds for d = 2, 3 and is lost for d = 4, 5, 6, as the sign of the stiffness says
 E. Against published measurements
   share of space in the bending of light: 1 (d = 3) at  0.91 uncertainties; 1/2 (d = 4) at   21740. uncertainties
  PASS  light is bent twice: gamma - 1 = (2.1 +- 2.3)e-5; the share 1/2 of four dimensions is excluded
   exponent of the static law of charge, off two by (2.7 +- 3.1)e-16: forced 0 at  0.87 uncertainties
  PASS  the inverse square of charge (Williams, Faller and Hill, 1971)
   dimensions of spacetime from a wave of gravity, 4.02 +0.07 -0.10: four at  0.20 uncertainties, five at  14.0 uncertainties
  PASS  four dimensions of spacetime, five excluded (Pardo et al., 2018)
   reading, not a check: exclusion, violation below 3.4e-29 (Shi et al., 2018)
 BATTERY-JSON: {"checks":11,"failures":0} *[a printed file, 49 lines, in the master and in the Journal edition]*

**Appendix D · Kernel lines of Appendix A.** Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own. *[a printed file, 35 lines, in the master and in the Journal edition]*
