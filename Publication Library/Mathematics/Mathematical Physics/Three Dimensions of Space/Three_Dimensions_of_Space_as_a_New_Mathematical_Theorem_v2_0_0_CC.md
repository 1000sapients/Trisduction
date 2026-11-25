# Three Dimensions of Space as a New Mathematical Theorem

## Weight, Waves, Light Bent Twice, Stable Orbits and Two Statistics Hold Together in Three Dimensions and in No Other

**Mohammad F. Islam PhD** · 25 November 2026

## Abstract

This paper proves, in Lean 4 with Mathlib, that five properties of the laws of gravity, light and matter depend on the dimension $d$ of space in ways that meet at three and nowhere else. The law of gravity is an equation between matrices of size $d + 1$: the curvature, less half its trace times the metric, is a constant times the source. Taking its trace gives, for matter at rest of density $\rho$, a curvature along the time of $(d - 2)/(d - 1)$ times $\kappa\rho$ and along each direction of space of $1/(d - 1)$ times $\kappa\rho$. So with one dimension of space the law leaves no matter at rest; the curvature along the time is not zero exactly when $d$ is not two; and the curvatures of space and of time are equal exactly when $d$ is three. The field of a point is a radial field in a ring with derivatives, and it is free of sources for one power of the distance only, so the force falls as the power $d - 1$. The orbit is a real function: under a force of power $p$ the derivative of the radial force at a circular orbit is $(p - 3)\,k\,r^{-p-1}$, negative exactly when $p$ is below three. A number by which the permutations act is one or the sign, two statistics and no third, while the integers, which count the exchanges of two particles in a plane, act by every number that has an inverse. The paper then states the five properties as conditions on $d$: weight, waves of gravity, space and time curved alike, a stable orbit, and two statistics. They hold together exactly when $d$ is three, and each of weight, waves and two statistics, taken with the stable orbit alone, gives three. The premises are two: matter at rest has weight, and a planet keeps its orbit. They are fields of one printed structure, they force $d = 3$, and they are met. Three things are cited and named where they are used: that the curvature along the time is the weight and the ratio of space to time the share of space in the bending of light; that the count of the waves of gravity is $(d + 1)(d - 2)/2$; and that exchanges are permutations from three dimensions on. A Fortran twin solves the law of gravity as a linear system in each dimension, differentiates the field and the force numerically, integrates the orbit, and sets the readings against measurement: the share of space in the bending of light at one, with the value of four dimensions excluded by more than twenty thousand uncertainties. Part II states the reading from which the paper takes its place in the series, at premise grade and apart from the machine-checked claims.

## 1. The Theorem and What It Rests On

### 1.1 The statement

Let space have $d$ dimensions and spacetime $d + 1$, with signs plus for the time and minus for space. The law of gravity for a curvature $R_{ij}$ and a source $T_{ij}$ is

$$R_{ij} - \tfrac{1}{2}\,R\,g_{ij} = \kappa\,T_{ij}, \qquad R = \sum_i g_{ii}R_{ii},$$

and matter at rest is the source with $T_{00} = \rho$ and every other component zero.

**Theorem (`dust_time`, `dust_space`).** For matter at rest, $(d - 1)\,R_{00} = (d - 2)\,\kappa\rho$, and $(d - 1)\,R_{ii} = \kappa\rho$ along each direction of space.

**Theorem (`weight_exactly`, `bent_twice_exactly`).** For $d$ not one and $\kappa\rho$ not zero: $R_{00}$ is not zero exactly when $d$ is not two, and $R_{ii} = R_{00}$ exactly when $d$ is three.

**Theorem (`orbit_stiffness`, `stable_exactly_below_three`).** Under a force of power $p$ and strength $k$, the derivative of the radial force $L^2 r^{-3} - k\,r^{-p}$ at a circular orbit of radius $r_0$ is $(p - 3)\,k\,r_0^{-p-1}$. For $k$ and $r_0$ positive it is negative exactly when $p < 3$.

**Theorem (`together_exactly_in_three`).** For $d$ at least one, the five conditions of Section 7 hold together exactly when $d = 3$.

**Theorem (`three_forced`).** On the premises below, $d = 3$.

The law of gravity is Einstein's [3]. That the stable orbit singles out three dimensions is Ehrenfest's argument [1], on the theorem of Bertrand [2]. The premises are met: `threePremises` constructs a term of the structure at $d = 3$, with the curvature of matter at rest written out.

### 1.2 The premises, printed

The physical premises of the paper are the fields of this structure of the Lean file, and there are no others. What is cited is in the tables of Section 1.3.

```lean
structure Premises where
  d : ℕ
  space : 1 ≤ d
  weight : ∃ (Ric : Fin (d + 1) → Fin (d + 1) → ℚ) (κ ρ : ℚ), κ * ρ ≠ 0 ∧ Law d Ric (dust d ρ) κ ∧ Ric 0 0 ≠ 0
  orbit : 2 ≤ d ∧ ∃ k r0 : ℝ, 0 < k ∧ 0 < r0 ∧
    (((d - 1 : ℕ) : ℝ) - 3) * k * r0 ^ (-(((d - 1 : ℕ) : ℤ)) - 1) < 0
```

It carries two premises. The first is the field `weight`: the law of gravity has a solution for matter at rest, with $\kappa\rho$ not zero, whose curvature along the time is not zero. The second is the field `orbit`: space holds a plane, and under a force of power $d - 1$ the stiffness of a circular orbit is negative. No field of `Premises` states the value of $d$, an equation for it, or the conclusion of any theorem. That the force of a point falls as the power $d - 1$ is the theorem of Section 4, used in the wording of the second field; that a negative stiffness means the orbit is kept, and that the curvature along the time is the weight, are the readings of the third table. Section 9 states where the premises come from.

### 1.3 What is proved, what is cited, what is assumed

| Statement | Standing | Where |
|---|---|---|
| The trace of the law, and the law with its trace reversed | Proved, over every field of characteristic zero, in every dimension | Appendix A, Part I |
| Matter at rest: $(d - 1)R_{00} = (d - 2)\kappa\rho$ and $(d - 1)R_{ii} = \kappa\rho$ | Proved | Part I |
| With one dimension of space, $\kappa\rho = 0$ | Proved | Part I |
| $R_{00} \ne 0$ exactly when $d \ne 2$; $(d - 2)R_{ii} = R_{00}$; $R_{ii} = R_{00}$ exactly when $d = 3$ | Proved, for $d$ not one and $\kappa\rho$ not zero | Part I |
| A radial field of power $c$ in $d$ dimensions has divergence $d + c$ times the power, and is free of sources for $c = -d$ only | Proved, for elements of an arena that obey the stated relations | Part II |

The table continues with the orbit, the statistics and the premises.

| Statement | Standing | Where |
|---|---|---|
| The derivative of the radial force at a circular orbit is $(p - 3)\,k\,r_0^{-p-1}$; negative exactly when $p < 3$, positive exactly when $p > 3$ | Proved, as a derivative of a real function | Part III |
| A number by which the permutations act is one or the sign | Proved, for values in a commutative domain | Part IV |
| The integers act by every number that has an inverse | Proved | Part IV |
| The five conditions hold together exactly at $d = 3$; three pairs each give three; the bending alone gives three | Proved, as conditions on a natural number | Part VI |
| On the premises $d = 3$; the premises are met | Proved | Part VI |

What is not machine-checked is in the third table.

| Statement | Standing | Where |
|---|---|---|
| Matter at rest has weight, and a planet keeps its orbit | Premises; measured | Sections 7, 9 |
| The curvature along the time is the weight, and the ratio of the curvatures of space and time is the share of space in the bending of light | The weak-field reading, cited: [17] in four dimensions, [4] in every dimension | Section 3 |
| A negative stiffness means the orbit is kept, and a positive one that it is lost | Cited: [1, 2] | Section 4 |
| The relations of the radial theorems are met by the powers of the distance on space less a point | Elementary analysis, not formalised; executed by the twin | Sections 4, 8 |
| Exchanges of identical particles are permutations from three dimensions on, and in a plane are counted by the integers | Topology, cited: [6]; the condition `TwoStatistics` is entered from it | Section 5 |
| Gravity has $(d + 1)(d - 2)/2$ waves; light has $d$ electric and $d(d - 1)/2$ magnetic parts; a gauge coupling has the dimension of a length to the power $(d - 3)/2$ | Classical counts, entered; the theorems on them are arithmetic | Section 6 |
| The measured values of the twin | Entered from the literature [8, 9, 10, 11]; numerical, not machine-checked | Section 8 |

The paper claims as machine-checked the rows marked proved and no others. A row marked cited is a result with a published proof that this work has not machine-checked. A row marked entered is a classical count or a measured value; the theorems that use a count are arithmetic on it. Part II, the reading, is outside these tables: it is premise-grade and is labelled so where it begins.

## 2. Four Laws in Any Number of Dimensions

Each of the laws of this paper can be written in any number of dimensions, and each is written here in the mathematics that carries it, in the kernel of Lean 4 [15] on the library Mathlib [14]. The law of gravity is an equation between square matrices of size $d + 1$ over a field, with the dimension a natural number. The field of a point lives in an arena: a commutative ring with linear maps that commute and obey the rule of the product, as in the companion paper on light [18]. The orbit is a function of a real variable, and its stiffness is a derivative in the sense of analysis. The statistics are maps from groups to numbers that send products to products.

The definitions `sg`, `trg`, `Law` and `dust` are the signs, the trace, the law of gravity and matter at rest of Section 1.1. The definitions `Weighs`, `Waves`, `BentTwice`, `Stable` and `TwoStatistics` are the five conditions of Section 7. The companion papers force the laws; this paper does not force them again. It takes the law of gravity and the law of the static field as written, and proves what they say in each dimension. The question is an old one [21, 22].

## 3. Weight, and Space Curved as Time

Nothing in this section is assumed beyond the law. Each statement is a theorem of Appendix A.

**The trace (`trace_of_the_law`, `trace_reversed`).** The trace of the metric is $d + 1$, so the trace of the law is $2\kappa\,T = (1 - d)\,R$, where $T$ is the trace of the source. Putting it back, $(d - 1)\,R_{ij} = \kappa\big((d - 1)\,T_{ij} - T\,g_{ij}\big)$.

**Matter at rest (`dust_time`, `dust_space`).** Its trace is $\rho$. So $(d - 1)\,R_{00} = (d - 2)\,\kappa\rho$ and, along each direction of space, $(d - 1)\,R_{ii} = \kappa\rho$.

**A line (`no_dust_on_a_line`).** With $d = 1$ the second equation reads $0 = \kappa\rho$: the law leaves no matter at rest at all.

**Weight (`weight_exactly`).** For $d$ not one and $\kappa\rho$ not zero, $R_{00} \ne 0$ exactly when $d \ne 2$. In the weak field the curvature along the time is the source of the Newtonian potential [17], so this is the statement that matter at rest attracts, in every dimension but two. In the plane a mass attracts nothing, which is classical [5]. That reading of $R_{00}$ is cited; what compiles is the equation.

**Space as time (`space_over_time`, `bent_twice_exactly`).** For $d$ not one, $(d - 2)\,R_{ii} = R_{00}$: the curvature of space is $1/(d - 2)$ of the curvature of time. They are equal exactly when $d = 3$. Light passing a mass is bent by both, and Newton's law has the first alone, so the bending is twice Newton's exactly when the two are equal; that reading is the weak field of [17] in four dimensions of spacetime and the solution of Tangherlini [4] in every dimension, and it is cited.

## 4. The Force of a Point, and the Orbit

**The force (`radial_divergence`, `only_one_power_is_free_of_sources`, `the_field_falls`).** Let $x_i$ be coordinates of $d$ directions in an arena, $u = \sum_j x_j^2$, and $w$ a field with $(\partial_i w)\,u = c\,x_i\,w$, the power $c$ of the distance. The divergence of the radial field $x_i w$, times $u$, is $(d + c)\,w\,u$. In a ring without divisors of zero, with $w\,u$ not zero, the field is free of sources only for $c = -d$. The square of its size is then the power $2 - 2d$ of the distance, so the field, and the force it exerts, falls as the power $d - 1$. These are the theorems of the companion paper on light [18], compiled again here so that the file stands alone. That the relations are met by the powers of the distance is elementary analysis and is not formalised.

**The stiffness (`orbit_stiffness`).** A body in a plane under a central force of power $p$ and strength $k$, with $L^2$ the square of its angular momentum, has the radial force $L^2 r^{-3} - k\,r^{-p}$. At a circular orbit of radius $r_0$ the two terms cancel. The derivative of the radial force there is

$$\frac{d}{dr}\Big(L^2 r^{-3} - k\,r^{-p}\Big)\Big|_{r_0} = (p - 3)\,k\,r_0^{-p-1}.$$

It is proved as a derivative of a real function, for every natural $p$.

**Below three (`stable_exactly_below_three`).** For $k$ and $r_0$ positive the stiffness is negative exactly when $p < 3$ and positive exactly when $p > 3$. A negative stiffness pulls a disturbed orbit back, and a positive one pushes it away; that a negative stiffness means the orbit is kept is the classical criterion [1, 2], cited. With $p = d - 1$ the orbit is kept for $d$ below four. An orbit needs a plane, so $d$ is at least two.

## 5. Two Statistics, and the Plane

**Two and no third (`a_sign_is_plus_or_minus_one`, `two_statistics_and_no_third`).** Let the permutations of finitely many things act on amplitudes by a number, a map to a commutative domain that sends products to products. Then the map is one on every permutation or it is the sign. This is the theorem of the companion paper on matter [20], compiled again here.

**The plane (`in_the_plane_every_phase_is_a_statistics`).** The integers, as a group, act by any number that has an inverse: for every such $u$ there is a map that sends products to products and sends the generator to $u$.

**Where the dimension enters.** In three dimensions of space and above the exchanges of identical particles form the permutations, and in a plane the exchanges of two particles are counted by the integers [6]. That is topology and is cited. With it, the two theorems say: two statistics and no third from three dimensions on, and every phase in the plane. The condition `TwoStatistics` of Section 7 is entered from this and is not derived.

## 6. Waves and Counts

The theorems of this section are arithmetic on classical counts, which are entered and not derived here.

**Waves of gravity (`gravity_has_waves_exactly_from_three`).** A wave of gravity in $d$ dimensions of space has $(d + 1)(d - 2)/2$ independent states, a classical count [7, 17]. It is at least one exactly when $d$ is at least three. Such waves are observed [12].

**Three more counts.** With $n = d + 1$: the electric and the magnetic parts of light are equal in number exactly when $n = 4$ (`electric_and_magnetic_are_equal_in_number_exactly_in_four`); the waves of light and of gravity are equal in number exactly when $n = 4$ (`light_and_gravity_have_equal_waves_exactly_in_four`); and the coupling of a gauge field is a pure number exactly when $n = 4$ (`the_coupling_is_a_pure_number_exactly_in_four`). The counts are those of the companion papers [18, 19].

## 7. Together

The five conditions are written as conditions on a natural number, each in the form its theorem or its source gives.

| Condition | In the file | From |
|---|---|---|
| `Weighs`: matter at rest has weight | $d \ne 1$ and $d \ne 2$ | `no_dust_on_a_line`, `weight_exactly` |
| `Waves`: gravity has a wave | $2 \le (d + 1)(d - 2)$ | the cited count, Section 6 |
| `BentTwice`: space and time curve alike | $d - 2 = 1$ | `bent_twice_exactly` |
| `Stable`: a planet keeps its orbit | $2 \le d$ and $d - 1 < 3$ | `stable_exactly_below_three`, with the power $d - 1$ |
| `TwoStatistics`: two statistics and no third | $3 \le d$ | the cited topology, Section 5 |

**Together (`together_exactly_in_three`).** For $d$ at least one, the five hold together exactly when $d = 3$.

**Pairs (`weight_and_orbits_give_three`, `waves_and_orbits_give_three`, `statistics_and_orbits_give_three`, `bending_alone_gives_three`).** Three of the conditions open at three and one closes above it. Weight with the stable orbit gives three; waves with the stable orbit give three; two statistics with the stable orbit give three; and the bending alone gives three.

**On the premises (`three_forced`, `threePremises`).** The structure of Section 1.2 does not use the conditions as written above. Its fields say that the law of gravity has a solution with weight and that the stiffness of the orbit is negative, and the theorems of Sections 3 and 4 turn those into $d \ne 1$, $d \ne 2$ and $d - 1 < 3$ with $d \ge 2$. So $d = 3$. At $d = 3$ the law is solved by a curvature equal to one along every direction, with $\kappa = 2$ and $\rho = 1$, and the stiffness with $k = r_0 = 1$ is $-1$: the premises are met.

## 8. The Numerical Twin

The twin of Appendix B does three things the kernel does not. It executes each statement independently, it integrates the orbit, and it sets the readings against published measurements.

**Gravity.** For each $d$ from 1 to 8 the twin writes the law for matter at rest as a linear system for the diagonal of the curvature and solves it by elimination. With one dimension of space the system is singular. From 2 to 8 the solution is $(d - 2)/(d - 1)$ along the time and $1/(d - 1)$ along space; the time component is zero at $d = 2$ only, and space equals time at $d = 3$ only.

**The point and the orbit.** At 50 points in each dimension from 2 to 8 the radial field of size $r^{1-d}$ has no divergence by differences. The derivative of the radial force by differences agrees with $(p - 3)\,k\,r^{-p-1}$ for $p$ from 0 to 6. A circular orbit with its speed changed by one percent, integrated for sixty turns, holds for $d = 2$ and $3$ and is lost for $d = 4$, $5$ and $6$.

**The measurements.** The inputs are measured and are printed in Appendix B.

| Reading | Three dimensions | Rival | Measured |
|---|---|---|---|
| Share of space in the bending of light, less one | 0 | $-1/2$ (four dimensions) | $(2.1 \pm 2.3)\times10^{-5}$ [8] |
| Exponent of the static law of charge, less two | 0 | | $(2.7 \pm 3.1)\times10^{-16}$ [9] |
| Dimensions of spacetime from a wave of gravity | 4 | 5 | $4.02^{+0.07}_{-0.10}$ [10] |
| A third statistics in three dimensions | none | | violation of exclusion below $3.4\times10^{-29}$ [11] |

A measured check passes when the forced value lies within two of the quoted uncertainties, and a rival is excluded when it lies further than five. Eleven checks pass and none fails. The share of space stands at 0.91 of its uncertainty and the value of four dimensions at 21740; the exponent at 0.87; four dimensions of spacetime at 0.20 and five at 14.0. The inverse square of gravity itself holds down to 52 micrometres [13]. Three limits are stated. The orbit run illustrates a classical theorem and proves nothing; the statement of the engine is the sign of the stiffness, and at the power three, where the stiffness is zero, the run loses the orbit. The bound on a third statistics is printed as a reading and is not counted. And every measurement here precedes this work: the table is agreement with the record, not a new prediction.

## 9. Discussion: The Reading

The derivation above uses algebra and one derivative. This section states the reading from which the premises come, and marks what in it is theorem and what is premise.

**Why these two.** In the reading of Part II the laws of gravity, light, matter and the nuclear forces are each forced from one seat [16], in four companion papers [17, 18, 19, 20]. Each law can be written in any number of dimensions, and the seat does not choose the number. What chooses is the world: an apple falls, and a planet keeps its orbit. Those are the fields `weight` and `orbit`. They are physics, measured, and are not theorems of this paper. What the paper proves is that they leave one dimension.

**Why the other three are not premises.** Waves of gravity and two statistics each give three with the stable orbit, and the bending of light gives three alone. They are not needed, and two of them rest on a cited count and a cited piece of topology. The paper keeps the premises to the two whose consequences compile from the law to the number, and reports the other three as agreeing.

**What the paper does not claim.** It does not derive that space has three dimensions from nothing: it derives it from two measured facts and the forced laws. It does not prove the weak-field reading, the criterion of the stable orbit, the count of the waves of gravity, or the topology of exchanges; each is cited. It does not claim that the argument of Ehrenfest was unknown. It claims that the dependence on the dimension of each of the five is what Section 1.3 says, that the five meet at three and nowhere else, and that each statement marked proved compiles. No theorem of Sections 2 to 8 depends on Part II.

## 10. Predictions, Falsifiers, and What Stands

The paper recovers the dimension of space. It predicts no measurement that the laws do not and derives no constant. Its commitments are those of three dimensions, and they are stated here as commitments: three that the paper says will stand at any future precision, two proposals it says will fail, and the three observations that would refute it.

### 10.1 Three predictions that will stand

1. **Space and time bend light alike.** `bent_twice_exactly` gives equality at three and nowhere else. The measured share of space is $1 + (2.1 \pm 2.3)\times10^{-5}$ [8]. The prediction is that it stays at one.
2. **The force of a point falls as the inverse square.** `only_one_power_is_free_of_sources` gives the power $d - 1$. The law holds for gravity down to 52 micrometres [13] and for charge to parts in $10^{16}$ [9]. The prediction is that no range is found at which the power changes.
3. **A wave of gravity thins as in four dimensions of spacetime.** `three_forced` gives three of space, four with the time. The measured value is $4.02^{+0.07}_{-0.10}$ [10]. The prediction is that it stays at four.

### 10.2 Two proposals that will fail

1. **A further dimension of space open to gravity or to light at any range.** At that range the force would fall as a higher power and, by `stable_exactly_below_three`, no orbit there would be kept. The paper predicts that no such range is found.
2. **A third statistics for particles free in three dimensions.** `two_statistics_and_no_third` leaves none once exchanges are permutations. The paper predicts that every statistics between the two is found only where the exchanges are not permutations, as in the plane.

### 10.3 The three falsifiers

Each is a forbidden observation. No observation breaks a theorem; each refutes a premise, or the laws as written as the laws of nature, and each names the theorem that carries the consequence. The threshold in each case is five of the experiment's printed uncertainties.

1. **A share of space in the bending of light that is not one.** It refutes three dimensions through `bent_twice_exactly`, or the law of gravity as written.
2. **A force of a point, of gravity or of charge, that does not fall as the inverse square at some range.** It refutes three dimensions at that range through `only_one_power_is_free_of_sources`, and with it the field `orbit` as read there.
3. **Matter at rest that does not attract.** It refutes the field `weight`.

Apart from them stands the formal claim, which no observation touches and one compilation settles: every theorem named in this text prints its axioms in Appendix D, and a line that names an axiom other than `propext`, `Classical.choice` and `Quot.sound`, or a file that fails to compile under Lean 4.19.0 and Mathlib 4.19.0, refutes the claim that the statements are proved.

### 10.4 What kind of result this is

It is not a new physics. It is a change in how an old argument can be checked. That the laws single out three dimensions is here a single file whose every step the kernel has verified, whose assumptions are two fields of one structure, and whose readings are set against measurement. A reader who doubts a step can name the line.

The implication from `Premises` to $d = 3$ is checked by the Lean kernel. No experiment and no later revision of physics alters an implication. Experiment remains free to test whether nature satisfies the premises, and that is all it can test here. What the kernel certifies is the Lean statements; that the definitions of the file say what this text says they say is for the reader to check, and the structure `Premises` is printed for that purpose. What stands is the tables of Section 1.3.

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

One falsifier belongs to the reading and stands beside the three of Section 10.3. A further dimension of space, open to gravity or to light at any range, would change the fall of the force from the inverse square, the bending of light from twice Newton's, and the thinning of a wave of gravity with distance. Each is measured, and none has moved.

## 12. Closure

That the laws single out three dimensions of space is no longer informal prose. From an equation between matrices, a ring with derivatives, a real function and two groups, and nothing more, Lean 4 with Mathlib compiles the trace of the law of gravity in every dimension, the curvature of matter at rest along time and along space, the absence of matter at rest on a line, the weight in every dimension but two, the equality of space and time in three only, the one power of the distance that is free of sources, the stiffness of a circular orbit under a force of any power, its sign on each side of the power three, the two statistics of the permutations, and the phases of the integers. No axiom is declared. No proof is left open. No headline theorem closes by its own hypothesis or over a structure that carries its conclusion.

The argument of Ehrenfest is recovered as one clause of five. Weight, waves, space curved as time, the stable orbit and two statistics are each written as a condition on the dimension, and they hold together at three and nowhere else. Three pairs give three without the bending of light, and the bending gives it alone. The numerical twin solves the law of gravity in each dimension, integrates the orbit, and sets the readings against measurement: the share of space in the bending of light at one, with the value of four dimensions excluded by more than twenty thousand uncertainties.

Every boundary is in plain sight. That matter at rest has weight and that a planet keeps its orbit are two fields of one printed structure. That the curvature along the time is the weight, and the ratio of space to time the share of space in the bending of light, is the weak-field reading, cited. That a negative stiffness keeps the orbit is the classical criterion, cited. That exchanges are permutations from three dimensions on is topology, cited, and the condition on the statistics is entered from it. The count of the waves of gravity is classical, entered. That the radial relations are met by the powers of the distance is elementary analysis, not formalised.

That structure is not an arbitrary postulate. The two statements the reading rests on, Existence and Least Erasure, are theorems in their own domain: each has its own compiled Lean file, with no axiom declared, listed in the Lean Library Reference. There they are proved. The Heat Bridge, which joins erasure to heat, is a theorem there as well; the bridge spoken of below is a different one, from that domain to physics. Here they are used, and the difference is stated. Between that domain and the laws of this paper lies a physical bridge, crossed in the four companion papers, and after it a fact of the world: that matter has weight and that orbits are kept. This paper does not claim either as a theorem. It writes the two facts down as `Premises`, so that the engine imports nothing outside Mathlib and can be checked alone, and so that a reader can see exactly which sentences carry the physics.

Two things are therefore separate, and the paper keeps them separate. Inside the kernel, the implication from `Premises` to three dimensions is a mathematical certainty. No experiment, no consensus and no later revision of physics alters it, and anyone can recheck it with one compilation. Outside the kernel stand three falsifiers. They test whether nature satisfies the premises, and so far nature does. What survives both is not opinion. It is a theorem, and a physics that has met every test of its premises.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file and the Fortran twin are written by a language model under the author's direct supervision. Every theorem named in the text of Sections 1 to 10 and 12 is in Appendix A under that name, and its kernel line is printed in Appendix D. Classical results that are cited and not formalised are named as such in Section 1.3 and wherever they are used. No constant of nature is derived anywhere in this paper; the numbers of the twin are computed from the laws as written and from measured inputs, which Appendix B prints.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1. P. Ehrenfest, Proc. Amsterdam Acad. 20 (1917) 200.
2. J. Bertrand, C. R. Acad. Sci. 77 (1873) 849.
3. A. Einstein, Ann. Phys. 49 (1916) 769.
4. F. R. Tangherlini, Nuovo Cimento 27 (1963) 636.
5. S. Deser, R. Jackiw and G. 't Hooft, Ann. Phys. 152 (1984) 220.
6. J. M. Leinaas and J. Myrheim, Nuovo Cimento B 37 (1977) 1.
7. E. P. Wigner, Ann. Math. 40 (1939) 149.
8. B. Bertotti, L. Iess and P. Tortora, Nature 425 (2003) 374.
9. E. R. Williams, J. E. Faller and H. A. Hill, Phys. Rev. Lett. 26 (1971) 721.
10. K. Pardo, M. Fishbach, D. E. Holz and D. N. Spergel, J. Cosmol. Astropart. Phys. 07 (2018) 048.
11. H. Shi et al. (VIP-2), Eur. Phys. J. C 78 (2018) 319.
12. B. P. Abbott et al. (LIGO and Virgo), Phys. Rev. Lett. 116 (2016) 061102.
13. J. G. Lee, E. G. Adelberger, T. S. Cook, S. M. Fleischer and B. R. Heckel, Phys. Rev. Lett. 124 (2020) 101101.
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

23. Root Axiom and Existence: Publication Library/Philosophy/Metaphysics/Root Axiom/TOE_Zero.lean. Compiled alone in core Lean 4.19.0, exit 0.
24. RH master: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_44_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.
25. Existence, as carried in the RH master: line 6635.
26. Heat Bridge: RH master, Parts VII-c and VII-d.
27. Prime Freedom: RH master, Parts XIII and XIV.
28. Freedom Arrow: RH master, Part XV.
29. Least Erasure: protocols/RH One Bit/Nothing Escapes Three Plus One/Least_Erasure.lean. Compiled alone in core Lean 4.19.0, exit 0.
30. Second Law: Publication Library/Mathematics/Mathematical Physics/Second_Law_Theorem_v1_0_0_CC.pdf, with its Lean file printed inside.
31. P versus NP master: FINAL_BINDING/PNP Binding/PNP_Normal_Form_Paper_v1_14_0_CC.lean
32. ZFC seal: lean/ZFC_Block_Hardened_FINAL_v2_0_0_Hermetically_Sealed.lean
33. No Second Sovereign: Publication Library/Mathematics/Millennium Series/No_Second_Sovereign_v1_0_0_CC.lean
34. Future Proof Empirical Witness Seal: Publication Library/Mathematics/Millennium Series/Future_Proof_Empirical_Witness_Seal_v1_0_0_CC.lean

## Appendix A · SPHYS_Three_Dimensions_CC.lean

Lean 4.19.0 with Mathlib 4.19.0. 28 theorems, no axiom declared, no `sorry`, exit 0 with no warning. The kernel lines are Appendix D.

```lean
/-
SPHYS_Three_Dimensions_CC.lean · five properties of the forced laws that depend on the dimension of space, on real algebra
RATIONALE. The engine of edition 1.0.0 proved its statements as arithmetic on formulas entered by hand. This file
  replaces it. The law of gravity is an equation between matrices of any size and its trace is taken; the field of a
  point is a radial field in an arena with derivatives; the orbit is a real function and its derivative; the
  statistics are maps from the permutations and from the integers. What is still entered is named as entered.
DESIGN. Parts, in order.
    Part I    Gravity in d dimensions of space. `trace_of_the_law`, `trace_reversed`, `dust_time`, `dust_space`,
              `no_dust_on_a_line`, `weight_exactly`, `space_over_time`, `bent_twice_exactly`.
    Part II   The field of a point. `radial_divergence`, `the_field_falls`, `only_one_power_is_free_of_sources`:
              the force falls as the power d - 1 of the distance.
    Part III  The orbit. `orbit_stiffness`: the derivative of the radial force at a circular orbit under a force
              of power p. `stable_exactly_below_three`.
    Part IV   Statistics. `two_statistics_and_no_third` for the permutations;
              `in_the_plane_every_phase_is_a_statistics` for the integers.
    Part V    Arithmetic on cited counts.
    Part VI   The five properties as conditions on d; `together_exactly_in_three`; `Premises`; `three_forced`;
              `threePremises`.
WHAT IS NOT PROVED HERE (read before citing).
    (a) That the component of the curvature along the time is the weight, and that the ratio of the components of
        space and time is the share of space in the bending of light. These are the weak-field readings, cited.
    (b) That a negative derivative of the radial force at a circular orbit means the orbit is kept. Cited.
    (c) That exchanges of identical particles form the permutations from three dimensions on and the braids in
        two. Topology, cited. The condition `TwoStatistics` is entered from it.
    (d) The count of the waves of gravity. Classical, entered.
    (e) That the relations of the radial theorems are met by the powers of the distance. Elementary analysis.
RISK. The dimension is a natural number cast into a field of characteristic zero. No magnitude is derived.
NON-NEGOTIABLE. No axiom is declared, no sorry. No headline theorem closes over a structure that carries its
  conclusion. The kernel line of every theorem the paper names is printed at the end.
-/
import Mathlib.Algebra.Algebra.Basic
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Algebra.CharZero.Defs
import Mathlib.GroupTheory.Perm.Sign
import Mathlib.Analysis.Calculus.Deriv.ZPow
import Mathlib.Analysis.Calculus.Deriv.Mul
import Mathlib.Analysis.Calculus.Deriv.Add
import Mathlib.Data.Real.Basic
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Abel
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.IntervalCases

namespace SPHYS.Dimension
open Finset

/-! ## Part I. Gravity in d dimensions of space -/

section Gravity
variable {K : Type*} [Field K] [CharZero K] (d : ℕ)

/-- The signs of d dimensions of space and one of time: plus for the time, minus for space. -/
def sg (i : Fin (d + 1)) : K := if i = 0 then 1 else -1
/-- The trace of a matrix with those signs. -/
def trg (M : Fin (d + 1) → Fin (d + 1) → K) : K := ∑ i, sg d i * M i i
/-- The law of gravity: the curvature less half its trace times the metric is κ times the source. -/
def Law (Ric T : Fin (d + 1) → Fin (d + 1) → K) (κ : K) : Prop :=
  ∀ i j, Ric i j - (1 / 2) * trg d Ric * (if i = j then sg d i else 0) = κ * T i j
/-- Matter at rest: a density along the time and nothing else. -/
def dust (ρ : K) : Fin (d + 1) → Fin (d + 1) → K := fun i j => if i = 0 ∧ j = 0 then ρ else 0

omit [CharZero K] in
theorem sg_sq (i : Fin (d + 1)) : (sg d i : K) * sg d i = 1 := by unfold sg; split_ifs <;> ring

/-- THE TRACE OF THE LAW. Twice κ times the trace of the source is one less d, times the trace of the curvature. -/
theorem trace_of_the_law (Ric T : Fin (d + 1) → Fin (d + 1) → K) (κ : K) (h : Law d Ric T κ) :
    2 * κ * trg d T = (1 - (d : K)) * trg d Ric := by
  have e : ∀ i, sg d i * (κ * T i i) = sg d i * Ric i i - 1 / 2 * trg d Ric * (sg d i * sg d i) := by
    intro i
    have := h i i
    rw [if_pos rfl] at this
    rw [← this]; ring
  have s : ∑ i, sg d i * (κ * T i i) = trg d Ric - 1 / 2 * trg d Ric * ((d : K) + 1) := by
    rw [Finset.sum_congr rfl fun i _ => e i, Finset.sum_sub_distrib, ← Finset.mul_sum]
    simp [sg_sq, trg]
  have t : ∑ i, sg d i * (κ * T i i) = κ * trg d T := by
    unfold trg; rw [Finset.mul_sum]; exact Finset.sum_congr rfl fun i _ => by ring
  rw [t] at s
  linear_combination 2 * s

/-- THE LAW WITH THE TRACE REVERSED. -/
theorem trace_reversed (Ric T : Fin (d + 1) → Fin (d + 1) → K) (κ : K) (h : Law d Ric T κ) (i j : Fin (d + 1)) :
    ((d : K) - 1) * Ric i j = κ * (((d : K) - 1) * T i j - trg d T * (if i = j then sg d i else 0)) := by
  have ht := trace_of_the_law d Ric T κ h
  have hij := h i j
  generalize (if i = j then sg d i else (0 : K)) = e at hij ⊢
  linear_combination ((d : K) - 1) * hij + (e / 2) * ht

omit [CharZero K] in
theorem trg_dust (ρ : K) : trg d (dust d ρ) = ρ := by
  unfold trg
  have : ∀ i : Fin (d + 1), sg d i * dust d ρ i i = if i = 0 then ρ else 0 := by
    intro i; by_cases hi : i = 0 <;> simp [sg, dust, hi]
  rw [Finset.sum_congr rfl fun i _ => this i, Finset.sum_ite_eq' Finset.univ (0 : Fin (d + 1))]
  simp

/-- MATTER AT REST, ALONG THE TIME. One less d, times the curvature along the time, is two less d, times κρ. -/
theorem dust_time (Ric : Fin (d + 1) → Fin (d + 1) → K) (κ ρ : K) (h : Law d Ric (dust d ρ) κ) :
    ((d : K) - 1) * Ric 0 0 = ((d : K) - 2) * (κ * ρ) := by
  have k := trace_reversed d Ric (dust d ρ) κ h 0 0
  rw [trg_dust, if_pos rfl] at k
  simp only [dust, sg, and_self, if_true] at k
  linear_combination k

/-- MATTER AT REST, ALONG SPACE. One less d, times the curvature along a direction of space, is κρ. -/
theorem dust_space (Ric : Fin (d + 1) → Fin (d + 1) → K) (κ ρ : K) (h : Law d Ric (dust d ρ) κ)
    (i : Fin (d + 1)) (hi : i ≠ 0) : ((d : K) - 1) * Ric i i = κ * ρ := by
  have k := trace_reversed d Ric (dust d ρ) κ h i i
  rw [trg_dust, if_pos rfl] at k
  simp only [dust, sg, hi, false_and, if_false] at k
  linear_combination k

/-- NO MATTER AT REST ON A LINE. With one dimension of space the law leaves no source: κρ is zero. -/
theorem no_dust_on_a_line (Ric : Fin 2 → Fin 2 → K) (κ ρ : K) (h : Law 1 Ric (dust 1 ρ) κ) : κ * ρ = 0 := by
  have k := dust_space 1 Ric κ ρ h 1 (by decide)
  rw [← k]; norm_num

/-- WEIGHT EXACTLY OFF TWO. With d not one and κρ not zero, the curvature along the time is not zero exactly when
d is not two. -/
theorem weight_exactly (hd : d ≠ 1) (Ric : Fin (d + 1) → Fin (d + 1) → K) (κ ρ : K) (hk : κ * ρ ≠ 0)
    (h : Law d Ric (dust d ρ) κ) : Ric 0 0 ≠ 0 ↔ d ≠ 2 := by
  have k := dust_time d Ric κ ρ h
  have h1 : (d : K) - 1 ≠ 0 := by
    intro e; apply hd; have : (d : K) = 1 := by linear_combination e
    exact_mod_cast this
  constructor
  · intro hr hd2
    apply hr
    have : (d : K) - 2 = 0 := by rw [hd2]; norm_num
    rw [this, zero_mul] at k
    exact (mul_eq_zero.mp k).resolve_left h1
  · intro hd2 hr
    rw [hr, mul_zero] at k
    have h2 : (d : K) - 2 ≠ 0 := by
      intro e; apply hd2; have : (d : K) = 2 := by linear_combination e
      exact_mod_cast this
    exact (mul_ne_zero h2 hk) k.symm

/-- SPACE OVER TIME. With d not one, two less d, times the curvature along a direction of space, is the curvature
along the time. -/
theorem space_over_time (hd : d ≠ 1) (Ric : Fin (d + 1) → Fin (d + 1) → K) (κ ρ : K)
    (h : Law d Ric (dust d ρ) κ) (i : Fin (d + 1)) (hi : i ≠ 0) : ((d : K) - 2) * Ric i i = Ric 0 0 := by
  have h1 : (d : K) - 1 ≠ 0 := by
    intro e; apply hd; have : (d : K) = 1 := by linear_combination e
    exact_mod_cast this
  apply mul_left_cancel₀ h1
  linear_combination ((d : K) - 2) * dust_space d Ric κ ρ h i hi - dust_time d Ric κ ρ h

/-- SPACE EQUALS TIME EXACTLY IN THREE. With d not one and κρ not zero, the curvature along a direction of space
equals the curvature along the time exactly when d is three. -/
theorem bent_twice_exactly (hd : d ≠ 1) (Ric : Fin (d + 1) → Fin (d + 1) → K) (κ ρ : K) (hk : κ * ρ ≠ 0)
    (h : Law d Ric (dust d ρ) κ) (i : Fin (d + 1)) (hi : i ≠ 0) : Ric i i = Ric 0 0 ↔ d = 3 := by
  have h1 : (d : K) - 1 ≠ 0 := by
    intro e; apply hd; have : (d : K) = 1 := by linear_combination e
    exact_mod_cast this
  have ks := dust_space d Ric κ ρ h i hi
  have kt := dust_time d Ric κ ρ h
  constructor
  · intro e
    rw [e, kt] at ks
    have : ((d : K) - 3) * (κ * ρ) = 0 := by linear_combination ks
    have : (d : K) = 3 := by linear_combination (mul_eq_zero.mp this).resolve_right hk
    exact_mod_cast this
  · intro e
    apply mul_left_cancel₀ h1
    rw [ks, kt, e]; push_cast; ring

end Gravity

/-! ## Part II. The field of a point -/

/-- An arena: a commutative ring of fields over a ring of constants, with one linear map for each direction. The
maps commute and obey the rule of the product. They are the partial derivatives. -/
structure Arena (K : Type*) [CommRing K] (ι : Type*) (R : Type*) [CommRing R] [Algebra K R] where
  d : ι → R →ₗ[K] R
  comm : ∀ μ ν x, d μ (d ν x) = d ν (d μ x)
  leibniz : ∀ μ x y, d μ (x * y) = d μ x * y + x * d μ y


section Radial
variable {K : Type*} [CommRing K] {σ : Type*} [Fintype σ] [DecidableEq σ] {R : Type*} [CommRing R] [Algebra K R]
variable (S : Arena K σ R) (x : σ → R) (w c : R)

/-- THE DIVERGENCE OF A RADIAL FIELD. Let x be coordinates, u the sum of their squares, and w a field with
(∂ᵢ w) u = c xᵢ w: a power c of the distance. The divergence of the field x w, times u, is the number of
directions plus c, times w u. -/
theorem radial_divergence (hx : ∀ i j, S.d i (x j) = if i = j then 1 else 0)
    (hw : ∀ i, S.d i w * (∑ j, x j * x j) = c * (x i * w)) :
    (∑ i, S.d i (x i * w)) * (∑ j, x j * x j) = ((Fintype.card σ : R) + c) * (w * ∑ j, x j * x j) := by
  have e : ∀ i, S.d i (x i * w) * (∑ j, x j * x j) = w * (∑ j, x j * x j) + c * (x i * x i * w) := by
    intro i
    rw [S.leibniz, hx, if_pos rfl]
    linear_combination x i * hw i
  rw [Finset.sum_mul, Finset.sum_congr rfl fun i _ => e i, Finset.sum_add_distrib, Finset.sum_const,
    Finset.card_univ, nsmul_eq_mul, ← Finset.mul_sum, ← Finset.sum_mul]
  ring

/-- THE FIELD FALLS AS A POWER. The square of the size of the field x w is u w w, and it is a power 2 + 2c of the
distance: (∂ᵢ (u w w)) u = (2 + 2c) xᵢ (u w w). -/
theorem the_field_falls (hx : ∀ i j, S.d i (x j) = if i = j then 1 else 0)
    (hw : ∀ i, S.d i w * (∑ j, x j * x j) = c * (x i * w)) (i : σ) :
    S.d i ((∑ j, x j * x j) * w * w) * (∑ j, x j * x j) = (2 + 2 * c) * (x i * ((∑ j, x j * x j) * w * w)) := by
  have hu : S.d i (∑ j, x j * x j) = 2 * x i := by
    rw [map_sum]
    have : ∀ j, S.d i (x j * x j) = if i = j then 2 * x i else 0 := by
      intro j
      rw [S.leibniz, hx]
      by_cases hij : i = j
      · rw [if_pos hij, if_pos hij, hij]; ring
      · rw [if_neg hij, if_neg hij]; ring
    rw [Finset.sum_congr rfl fun j _ => this j, Finset.sum_ite_eq, if_pos (Finset.mem_univ i)]
  rw [S.leibniz, S.leibniz, hu]
  linear_combination (2 * (∑ j, x j * x j) * w) * hw i

/-- ONLY ONE POWER IS FREE OF SOURCES. In a ring without divisors of zero, if the radial field x w has no
divergence and w u is not zero, then c is minus the number of directions. -/
theorem only_one_power_is_free_of_sources [IsDomain R] (hx : ∀ i j, S.d i (x j) = if i = j then 1 else 0)
    (hw : ∀ i, S.d i w * (∑ j, x j * x j) = c * (x i * w)) (hne : w * (∑ j, x j * x j) ≠ 0)
    (h0 : ∑ i, S.d i (x i * w) = 0) : c = -(Fintype.card σ : R) := by
  have h := radial_divergence S x w c hx hw
  rw [h0, zero_mul] at h
  have := (mul_eq_zero.mp h.symm).resolve_right hne
  linear_combination this

end Radial

/-! ## Part III. The orbit -/

/-- THE STIFFNESS OF A CIRCULAR ORBIT. A body moves in a plane under a force that falls as the power p of the
distance, with strength k and with L2 the square of its angular momentum; its radial force is
L2 r^(-3) - k r^(-p). At a circular orbit of radius r₀, where that force is zero, its derivative is
(p - 3) k r₀^(-p-1). -/
theorem orbit_stiffness (p : ℕ) (k L2 r0 : ℝ) (hr : 0 < r0)
    (hc : L2 * r0 ^ (-3 : ℤ) = k * r0 ^ (-(p : ℤ))) :
    HasDerivAt (fun r : ℝ => L2 * r ^ (-3 : ℤ) - k * r ^ (-(p : ℤ)))
      (((p : ℝ) - 3) * k * r0 ^ (-(p : ℤ) - 1)) r0 := by
  have h1 := (hasDerivAt_zpow (-3) r0 (Or.inl hr.ne')).const_mul L2
  have h2 := (hasDerivAt_zpow (-(p : ℤ)) r0 (Or.inl hr.ne')).const_mul k
  have h := h1.sub h2
  convert h using 1
  have e1 : r0 ^ ((-3 : ℤ) - 1) = r0 ^ (-3 : ℤ) * r0 ^ (-1 : ℤ) := by rw [← zpow_add₀ hr.ne']; norm_num
  have e2 : r0 ^ (-(p : ℤ) - 1) = r0 ^ (-(p : ℤ)) * r0 ^ (-1 : ℤ) := by rw [← zpow_add₀ hr.ne']; ring_nf
  rw [e1, e2]; push_cast
  linear_combination (3 * r0 ^ (-1 : ℤ)) * hc

/-- THE ORBIT IS KEPT EXACTLY BELOW THE POWER THREE. With k and r₀ positive, the stiffness is negative exactly
when p is less than three, and positive exactly when p is more. -/
theorem stable_exactly_below_three (p : ℕ) (k r0 : ℝ) (hk : 0 < k) (hr : 0 < r0) :
    (((p : ℝ) - 3) * k * r0 ^ (-(p : ℤ) - 1) < 0 ↔ p < 3) ∧ (0 < ((p : ℝ) - 3) * k * r0 ^ (-(p : ℤ) - 1) ↔ 3 < p) := by
  have hz : 0 < k * r0 ^ (-(p : ℤ) - 1) := mul_pos hk (zpow_pos hr _)
  have e : ((p : ℝ) - 3) * k * r0 ^ (-(p : ℤ) - 1) = ((p : ℝ) - 3) * (k * r0 ^ (-(p : ℤ) - 1)) := by ring
  rw [e]
  constructor
  · rw [mul_neg_iff]
    constructor
    · rintro (⟨_, h⟩ | ⟨h, _⟩)
      · exact absurd h (not_lt.mpr hz.le)
      · have : (p : ℝ) < 3 := by linarith
        exact_mod_cast this
    · intro h
      right
      have : (p : ℝ) < 3 := by exact_mod_cast h
      exact ⟨by linarith, hz⟩
  · rw [mul_pos_iff]
    constructor
    · rintro (⟨h, _⟩ | ⟨_, h⟩)
      · have : (3 : ℝ) < p := by linarith
        exact_mod_cast this
      · exact absurd h (not_lt.mpr hz.le)
    · intro h
      left
      have : (3 : ℝ) < p := by exact_mod_cast h
      exact ⟨by linarith, hz⟩

/-! ## Part IV. Statistics -/

/-- A SIGN WHOSE SQUARE IS ONE IS PLUS OR MINUS ONE. -/
theorem a_sign_is_plus_or_minus_one {F : Type*} [CommRing F] [IsDomain F] (c : F) (h : c * c = 1) :
    c = 1 ∨ c = -1 := by
  have e : (c - 1) * (c + 1) = 0 := by linear_combination h
  rcases mul_eq_zero.mp e with h0 | h0
  · exact Or.inl (sub_eq_zero.mp h0)
  · exact Or.inr (eq_neg_of_add_eq_zero_left h0)

open Equiv in
/-- TWO STATISTICS AND NO THIRD. Let the permutations of finitely many things act on amplitudes by a number: a
map f from permutations to a commutative domain that sends products to products and the identity to one. Then
either f is one on every permutation, or f is the sign of the permutation. -/
theorem two_statistics_and_no_third {α : Type*} [Fintype α] [DecidableEq α] {F : Type*} [CommRing F] [IsDomain F]
    (f : Perm α →* F) : (∀ σ, f σ = 1) ∨ (∀ σ, f σ = ((Perm.sign σ : ℤˣ) : ℤ)) := by
  by_cases hex : ∃ a b : α, a ≠ b
  · obtain ⟨a, b, hab⟩ := hex
    have hc : f (swap a b) * f (swap a b) = 1 := by rw [← map_mul, swap_mul_self, map_one]
    have all : ∀ x y : α, x ≠ y → f (swap x y) = f (swap a b) := by
      intro x y hxy
      obtain ⟨u, hu⟩ := isConj_iff.mp (Perm.isConj_swap hxy hab)
      have e : f u * f (swap x y) * f u⁻¹ = f (swap a b) := by rw [← map_mul, ← map_mul, hu]
      have ui : f u * f u⁻¹ = 1 := by rw [← map_mul, mul_inv_cancel, map_one]
      calc f (swap x y) = f (swap x y) * (f u * f u⁻¹) := by rw [ui, mul_one]
        _ = f u * f (swap x y) * f u⁻¹ := by ring
        _ = f (swap a b) := e
    rcases a_sign_is_plus_or_minus_one _ hc with h1 | h1
    · left
      intro σ
      induction σ using Perm.swap_induction_on with
      | one => exact map_one f
      | swap_mul τ x y hxy ih => rw [map_mul, all x y hxy, h1, ih, mul_one]
    · right
      intro σ
      induction σ using Perm.swap_induction_on with
      | one => simp
      | swap_mul τ x y hxy ih =>
        rw [map_mul, all x y hxy, h1, ih, Perm.sign_mul, Perm.sign_swap hxy]
        simp
  · left
    intro σ
    have hs : σ = 1 := by
      ext x
      by_contra hne
      exact hex ⟨σ x, x, hne⟩
    rw [hs, map_one]

/-- IN THE PLANE EVERY PHASE IS A STATISTICS. The exchanges of two particles in a plane are counted by the
integers. For every number u that has an inverse there is a map from the integers, written as a group under
multiplication, that sends products to products and sends one exchange to u. -/
theorem in_the_plane_every_phase_is_a_statistics {F : Type*} [CommRing F] (u : Fˣ) :
    ∃ f : Multiplicative ℤ →* Fˣ, f (Multiplicative.ofAdd 1) = u :=
  ⟨{ toFun := fun n => u ^ (Multiplicative.toAdd n)
     map_one' := by simp
     map_mul' := fun a b => by simp [zpow_add] }, by simp⟩

/-! ## Part V. Arithmetic on cited counts -/

/-- Gravity in d dimensions of space has (d + 1)(d - 2)/2 waves. There is at least one exactly from three
dimensions on. The count is classical; this is arithmetic on it. -/
theorem gravity_has_waves_exactly_from_three (d : ℕ) : 2 ≤ (d + 1) * (d - 2) ↔ 3 ≤ d := by
  constructor
  · intro h
    by_contra hc
    have : d < 3 := by omega
    interval_cases d <;> simp at h
  · intro h
    have h1 : 1 ≤ d - 2 := by omega
    calc 2 ≤ (d + 1) * 1 := by omega
      _ ≤ (d + 1) * (d - 2) := Nat.mul_le_mul_left _ h1

/-- In n dimensions of spacetime the field of light has n - 1 electric components and (n - 1)(n - 2)/2 magnetic
ones; they are equal in number exactly when n is four. The counts are classical; this is arithmetic on them. -/
theorem electric_and_magnetic_are_equal_in_number_exactly_in_four (n : ℤ) (hn : 2 ≤ n) :
    2 * (n - 1) = (n - 1) * (n - 2) ↔ n = 4 := by
  constructor
  · intro h
    have : (n - 1) * (n - 4) = 0 := by linear_combination -h
    rcases mul_eq_zero.mp this with h1 | h1 <;> omega
  · rintro rfl; norm_num

/-- Light has n - 2 waves and gravity n(n - 3)/2; they are equal in number exactly when n is four. -/
theorem light_and_gravity_have_equal_waves_exactly_in_four (n : ℤ) (hn : 2 ≤ n) :
    2 * (n - 2) = n * (n - 3) ↔ n = 4 := by
  constructor
  · intro h
    have : (n - 1) * (n - 4) = 0 := by linear_combination -h
    rcases mul_eq_zero.mp this with h1 | h1 <;> omega
  · rintro rfl; norm_num

/-- The coupling of a gauge field in n dimensions of spacetime has the dimension of a length to the power
(n - 4)/2; it is a pure number exactly when n is four. The formula is classical; this is arithmetic on it. -/
theorem the_coupling_is_a_pure_number_exactly_in_four (n : ℤ) : n - 4 = 0 ↔ n = 4 := by omega

/-! ## Part VI. Together -/

/-- Matter at rest has weight: the condition of `weight_exactly` and `no_dust_on_a_line`. -/
def Weighs (d : ℕ) : Prop := d ≠ 1 ∧ d ≠ 2
/-- Gravity has waves: the condition of `gravity_has_waves_exactly_from_three`, on a cited count. -/
def Waves (d : ℕ) : Prop := 2 ≤ (d + 1) * (d - 2)
/-- Space and time curve alike: the condition of `bent_twice_exactly`, that two less d is one. -/
def BentTwice (d : ℕ) : Prop := (d : ℤ) - 2 = 1
/-- A planet keeps its orbit: an orbit needs a plane, and the power d - 1 of the force is below three, the
condition of `stable_exactly_below_three`. -/
def Stable (d : ℕ) : Prop := 2 ≤ d ∧ d - 1 < 3
/-- Identical particles have two statistics and no third: entered from the topology of exchanges, which are
permutations from three dimensions on. -/
def TwoStatistics (d : ℕ) : Prop := 3 ≤ d

/-- TOGETHER, EXACTLY IN THREE. For a space of at least one dimension the five conditions hold together exactly
when d is three. -/
theorem together_exactly_in_three (d : ℕ) (hd : 1 ≤ d) :
    (Weighs d ∧ Waves d ∧ BentTwice d ∧ Stable d ∧ TwoStatistics d) ↔ d = 3 := by
  unfold Weighs Waves BentTwice Stable TwoStatistics
  constructor
  · rintro ⟨_, _, h, _, _⟩; omega
  · rintro rfl; refine ⟨⟨by omega, by omega⟩, by norm_num, by norm_num, ⟨by omega, by omega⟩, le_refl _⟩

/-- Each of the three conditions that open at three, with the one that closes above it, gives three. -/
theorem weight_and_orbits_give_three (d : ℕ) (h : Weighs d ∧ Stable d) : d = 3 := by
  unfold Weighs Stable at h; omega
theorem waves_and_orbits_give_three (d : ℕ) (h : Waves d ∧ Stable d) : d = 3 := by
  obtain ⟨hw, hs⟩ := h
  have := (gravity_has_waves_exactly_from_three d).mp hw
  unfold Stable at hs; omega
theorem statistics_and_orbits_give_three (d : ℕ) (h : TwoStatistics d ∧ Stable d) : d = 3 := by
  unfold TwoStatistics Stable at h; omega
theorem bending_alone_gives_three (d : ℕ) (h : BentTwice d) : d = 3 := by unfold BentTwice at h; omega

/-- The premises. Space has d dimensions, at least one. Matter at rest has weight: there is a curvature that
solves the law of gravity for matter at rest with κρ not zero, and its component along the time is not zero. A
planet keeps its orbit: space has a plane, and under a force that falls as the power d - 1 the stiffness of a
circular orbit is negative. Nothing else is assumed. -/
structure Premises where
  d : ℕ
  space : 1 ≤ d
  weight : ∃ (Ric : Fin (d + 1) → Fin (d + 1) → ℚ) (κ ρ : ℚ), κ * ρ ≠ 0 ∧ Law d Ric (dust d ρ) κ ∧ Ric 0 0 ≠ 0
  orbit : 2 ≤ d ∧ ∃ k r0 : ℝ, 0 < k ∧ 0 < r0 ∧
    (((d - 1 : ℕ) : ℝ) - 3) * k * r0 ^ (-(((d - 1 : ℕ) : ℤ)) - 1) < 0

/-- THREE, FORCED. On the premises the dimension of space is three. -/
theorem three_forced (P : Premises) : P.d = 3 := by
  obtain ⟨Ric, κ, ρ, hk, hl, hr⟩ := P.weight
  obtain ⟨h2, k, r0, hk0, hr0, hs⟩ := P.orbit
  have hd1 : P.d ≠ 1 := by omega
  have hd2 : P.d ≠ 2 := (weight_exactly P.d hd1 Ric κ ρ hk hl).mp hr
  have hp : P.d - 1 < 3 := ((stable_exactly_below_three (P.d - 1) k r0 hk0 hr0).1).mp hs
  omega

/-- THE PREMISES ARE INHABITED. Three dimensions of space, with the curvature of matter at rest written out. -/
noncomputable def threePremises : Premises where
  d := 3
  space := by norm_num
  weight := ⟨fun i j => if i = j then 1 else 0, 2, 1, by norm_num, by
    intro i j
    fin_cases i <;> fin_cases j <;> simp [trg, sg, dust, Fin.sum_univ_four] <;> norm_num, by simp⟩
  orbit := ⟨by norm_num, 1, 1, by norm_num, by norm_num, by norm_num⟩

end SPHYS.Dimension

#print axioms SPHYS.Dimension.sg_sq
#print axioms SPHYS.Dimension.trace_of_the_law
#print axioms SPHYS.Dimension.trace_reversed
#print axioms SPHYS.Dimension.trg_dust
#print axioms SPHYS.Dimension.dust_time
#print axioms SPHYS.Dimension.dust_space
#print axioms SPHYS.Dimension.no_dust_on_a_line
#print axioms SPHYS.Dimension.weight_exactly
#print axioms SPHYS.Dimension.space_over_time
#print axioms SPHYS.Dimension.bent_twice_exactly
#print axioms SPHYS.Dimension.radial_divergence
#print axioms SPHYS.Dimension.the_field_falls
#print axioms SPHYS.Dimension.only_one_power_is_free_of_sources
#print axioms SPHYS.Dimension.orbit_stiffness
#print axioms SPHYS.Dimension.stable_exactly_below_three
#print axioms SPHYS.Dimension.a_sign_is_plus_or_minus_one
#print axioms SPHYS.Dimension.two_statistics_and_no_third
#print axioms SPHYS.Dimension.in_the_plane_every_phase_is_a_statistics
#print axioms SPHYS.Dimension.gravity_has_waves_exactly_from_three
#print axioms SPHYS.Dimension.electric_and_magnetic_are_equal_in_number_exactly_in_four
#print axioms SPHYS.Dimension.light_and_gravity_have_equal_waves_exactly_in_four
#print axioms SPHYS.Dimension.the_coupling_is_a_pure_number_exactly_in_four
#print axioms SPHYS.Dimension.together_exactly_in_three
#print axioms SPHYS.Dimension.weight_and_orbits_give_three
#print axioms SPHYS.Dimension.waves_and_orbits_give_three
#print axioms SPHYS.Dimension.statistics_and_orbits_give_three
#print axioms SPHYS.Dimension.bending_alone_gives_three
#print axioms SPHYS.Dimension.three_forced
#print axioms SPHYS.Dimension.threePremises
```

## Appendix B · Three_Dimensions_Twin_CC.f90

Eleven checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix C.

```fortran
! Three_Dimensions_Twin_CC.f90 · twin of SPHYS_Three_Dimensions_CC.lean
! RATIONALE. The engine proves five properties of the forced laws as conditions on the dimension of space. This
!   twin executes each independently: it solves the law of gravity for matter at rest as a linear system in each
!   dimension, differentiates the radial field and the radial force numerically, integrates an orbit under the
!   force of each dimension, tabulates the five conditions, and sets the readings against published measurements.
! DESIGN. Double precision; elimination with pivoting for the linear systems; central differences; a fourth-order
!   Runge-Kutta step for the orbits. No random numbers.
! CONVENTION. A measured check passes when the forced value lies within two quoted uncertainties; a rival is
!   excluded when it lies further than five.
! NON-NEGOTIABLE. The orbit test perturbs a circular orbit by one percent in speed, both ways, and reports whether
!   the radius stays between one half and two for sixty turns. No tuning per dimension.
! RISK. The orbit run illustrates a classical theorem (Bertrand, 1873; Ehrenfest, 1917); the engine's statement is
!   the sign of the stiffness, and the run agrees with it for d = 2..6. The measured values are inputs.
program dimension_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0)
  integer :: checks = 0, failures = 0
  real(dp), parameter :: pi = 3.14159265358979323846d0
  call table()
  call gravity()
  call point()
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
    write(*,'(A)') ' A. The five conditions of the engine, d = 1..12'
    write(*,'(A)') '    d  weight  waves  bent twice  stable orbits  two statistics'
    do d = 1, 12
      w = d /= 1 .and. d /= 2; g = (d + 1)*max(d - 2, 0) >= 2; b = d - 2 == 1; s = d >= 2 .and. d - 1 < 3; t = d >= 3
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
    call check('each pair with stable orbits, and the three counts of light and the coupling: 3 only', bad == 0)
  end subroutine
  subroutine solve(a, b, n, x, singular)             ! elimination with pivoting
    integer, intent(in) :: n
    real(dp), intent(in) :: a(n, n), b(n)
    real(dp), intent(out) :: x(n)
    logical, intent(out) :: singular
    real(dp) :: m(n, n + 1), t(n + 1), big
    integer :: c, i, p
    m(:, 1:n) = a; m(:, n + 1) = b; singular = .false.; x = 0
    do c = 1, n
      p = c; big = abs(m(c, c))
      do i = c + 1, n
        if (abs(m(i, c)) > big) then
          big = abs(m(i, c)); p = i
        end if
      end do
      if (big < 1.0d-12) then
        singular = .true.; return
      end if
      t = m(c, :); m(c, :) = m(p, :); m(p, :) = t
      do i = 1, n
        if (i /= c) m(i, :) = m(i, :) - m(i, c)/m(c, c)*m(c, :)
      end do
    end do
    do i = 1, n
      x(i) = m(i, n + 1)/m(i, i)
    end do
  end subroutine
  subroutine gravity()
    integer :: d, i, j, n, bad, zero_at, equal_at
    real(dp), allocatable :: a(:, :), b(:), x(:), sgn(:)
    real(dp) :: kr
    logical :: sing, line
    kr = 1.7d0                                         ! kappa times rho, any value that is not zero
    bad = 0; zero_at = 0; equal_at = 0; line = .false.
    write(*,'(A)') ' B. The law of gravity for matter at rest, solved in each dimension'
    write(*,'(A)') '    d   time / (kappa rho)   space / (kappa rho)   space over time'
    do d = 1, 8
      n = d + 1
      allocate(a(n, n), b(n), x(n), sgn(n))
      sgn = -1; sgn(1) = 1
      do i = 1, n
        do j = 1, n
          a(i, j) = -0.5d0*sgn(i)*sgn(j)
        end do
        a(i, i) = a(i, i) + 1
      end do
      b = 0; b(1) = kr
      call solve(a, b, n, x, sing)
      if (d == 1) then
        line = sing
      else
        if (sing) bad = bad + 1
        if (abs((d - 1)*x(1) - (d - 2)*kr) > 1.0d-10 .or. abs((d - 1)*x(2) - kr) > 1.0d-10) bad = bad + 1
        if (abs(x(1)) < 1.0d-10) zero_at = zero_at*100 + d
        if (abs(x(2) - x(1)) < 1.0d-10) equal_at = equal_at*100 + d
        if (d == 2) then
          write(*,'(I5,2F20.6,A)') d, x(1)/kr, x(2)/kr, '        no weight'
        else
          write(*,'(I5,3F20.6)') d, x(1)/kr, x(2)/kr, x(2)/x(1)
        end if
      end if
      deallocate(a, b, x, sgn)
    end do
    call check('the solution is (d - 2)/(d - 1) along the time and 1/(d - 1) along space, d = 2..8', bad == 0)
    call check('with one dimension of space the system is singular: no matter at rest', line)
    call check('the time component is zero at d = 2 only, and space equals time at d = 3 only', &
               zero_at == 2 .and. equal_at == 3)
  end subroutine
  subroutine point()
    integer :: d, i, t, bad
    real(dp) :: x(8), xp(8), xm(8), h, dv, r
    h = 1.0d-4; bad = 0
    do d = 2, 8
      do t = 1, 50
        do i = 1, d
          x(i) = 0.4d0 + 0.013d0*t + 0.11d0*i
        end do
        r = sqrt(sum(x(1:d)**2))
        dv = 0
        do i = 1, d
          xp = x; xm = x; xp(i) = x(i) + h; xm(i) = x(i) - h
          dv = dv + (xp(i)*sqrt(sum(xp(1:d)**2))**(-d) - xm(i)*sqrt(sum(xm(1:d)**2))**(-d))/(2*h)
        end do
        if (abs(dv)*r**d > 1.0d-5) bad = bad + 1
      end do
    end do
    write(*,'(A)') ' C. The field of a point, 50 points in each dimension of space from 2 to 8'
    call check('the radial field of size r^(1-d) is free of sources: the force falls as the power d - 1', bad == 0)
  end subroutine
  subroutine orbits()
    integer :: d, k, p
    logical :: held(2:6), ok
    real(dp) :: f, r0, kk, l2, h, num, exact, worst
    write(*,'(A)') ' D. The orbit'
    worst = 0; h = 1.0d-5
    do p = 0, 6
      do k = 1, 5
        r0 = 0.6d0 + 0.3d0*k; kk = 0.5d0 + 0.4d0*k
        l2 = kk*r0**(3 - p)                              ! the circular orbit: L2 r^-3 = k r^-p
        num = ((l2*(r0 + h)**(-3) - kk*(r0 + h)**(-p)) - (l2*(r0 - h)**(-3) - kk*(r0 - h)**(-p)))/(2*h)
        exact = (p - 3)*kk*r0**(-p - 1)
        worst = max(worst, abs(num - exact)/(kk*r0**(-p - 1)))
      end do
    end do
    write(*,'(A,ES9.2)') '   largest relative residual of the stiffness against (p - 3) k r^(-p-1), p = 0..6: ', worst
    call check('the derivative of the radial force at a circular orbit is (p - 3) k r^(-p-1)', worst < 1.0d-6)
    write(*,'(A)') '   a circular orbit, speed changed by one percent, sixty turns'
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
    call check('the orbit holds for d = 2, 3 and is lost for d = 4, 5, 6, as the sign of the stiffness says', ok)
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
    write(*,'(A)') ' E. Against published measurements'
    gam = 2.1d-5; gsig = 2.3d-5                         ! Bertotti, Iess and Tortora, 2003: gamma - 1
    write(*,'(A,F5.2,A,F8.0,A)') '   share of space in the bending of light: 1 (d = 3) at ', abs(gam)/gsig, &
         ' uncertainties; 1/2 (d = 4) at ', abs(gam + 0.5d0)/gsig, ' uncertainties'
    call check('light is bent twice: gamma - 1 = (2.1 +- 2.3)e-5; the share 1/2 of four dimensions is excluded', &
               abs(gam)/gsig < 2.0d0 .and. abs(gam + 0.5d0)/gsig > 5.0d0)
    write(*,'(A,F5.2,A)') '   exponent of the static law of charge, off two by (2.7 +- 3.1)e-16: forced 0 at ', &
         2.7d0/3.1d0, ' uncertainties'
    call check('the inverse square of charge (Williams, Faller and Hill, 1971)', abs(2.7d-16)/3.1d-16 < 2.0d0)
    write(*,'(A,F5.2,A,F5.1,A)') '   dimensions of spacetime from a wave of gravity, 4.02 +0.07 -0.10: four at ', &
         0.02d0/0.10d0, ' uncertainties, five at ', 0.98d0/0.07d0, ' uncertainties'
    call check('four dimensions of spacetime, five excluded (Pardo et al., 2018)', &
               0.02d0/0.10d0 < 2.0d0 .and. 0.98d0/0.07d0 > 5.0d0)
    write(*,'(A)') '   reading, not a check: exclusion, violation below 3.4e-29 (Shi et al., 2018)'
  end subroutine
end program
```

## Appendix C · Run of Appendix B

```text
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
 BATTERY-JSON: {"checks":11,"failures":0}
```

## Appendix D · Kernel lines of Appendix A

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

```text
'SPHYS.Dimension.sg_sq' depends on axioms: [propext, Quot.sound]
'SPHYS.Dimension.trace_of_the_law' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dimension.trace_reversed' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dimension.trg_dust' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dimension.dust_time' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dimension.dust_space' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dimension.no_dust_on_a_line' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dimension.weight_exactly' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dimension.space_over_time' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dimension.bent_twice_exactly' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dimension.radial_divergence' depends on axioms: [propext, Quot.sound]
'SPHYS.Dimension.the_field_falls' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dimension.only_one_power_is_free_of_sources' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dimension.orbit_stiffness' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dimension.stable_exactly_below_three' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dimension.a_sign_is_plus_or_minus_one' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dimension.two_statistics_and_no_third' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dimension.in_the_plane_every_phase_is_a_statistics' depends on axioms: [propext, Quot.sound]
'SPHYS.Dimension.gravity_has_waves_exactly_from_three' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dimension.electric_and_magnetic_are_equal_in_number_exactly_in_four' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.Dimension.light_and_gravity_have_equal_waves_exactly_in_four' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.Dimension.the_coupling_is_a_pure_number_exactly_in_four' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.Dimension.together_exactly_in_three' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dimension.weight_and_orbits_give_three' depends on axioms: [propext, Quot.sound]
'SPHYS.Dimension.waves_and_orbits_give_three' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dimension.statistics_and_orbits_give_three' depends on axioms: [propext, Quot.sound]
'SPHYS.Dimension.bending_alone_gives_three' depends on axioms: [propext, Quot.sound]
'SPHYS.Dimension.three_forced' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dimension.threePremises' depends on axioms: [propext, Classical.choice, Quot.sound]
```
