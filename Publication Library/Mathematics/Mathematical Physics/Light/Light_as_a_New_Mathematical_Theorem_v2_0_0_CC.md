# Light as a New Mathematical Theorem

## Maxwell's Equations Forced by the Conservation of Charge, Coulomb's Law as Their Half-Reading, and Two Helicities with No Third

**Mohammad F. Islam PhD** · 25 November 2026

## Abstract

This paper proves, in Lean 4 with Mathlib, that the conservation of charge forces Maxwell's equations. An arena is a commutative ring with one linear map for each direction; the maps commute and obey the rule of the product, and they are the partial derivatives. A potential is a family of elements of the ring, and the law is the linear law of second order built from it with constant coefficients and no direction preferred, which has three constants: $a$ on the wave operator, $b$ on the gradient of the divergence, and $m$ on the potential itself. Nothing else is assumed: no field strength, no gauge invariance and no vanishing mass. The main theorem states: if the source the law defines is conserved for every potential, in every arena of four directions with one time, then $b = -a$ and $m = 0$. The forced law is $a$ times the divergence of the field: Maxwell's equations with sources. The equations without sources hold for every potential. The law is then unchanged by every gauge turn, and the constant on the potential, the mass of the photon, is zero; both are consequences and neither is entered. For a plane wave the divergence of the field is $(k\cdot k)\,\varepsilon - (k\cdot\varepsilon)\,k$ times the profile, so a wave off the null cone has no field, and a wave on it is transverse. Along a null vector written in adapted directions, in any number of dimensions, the fields of the waves form a space whose dimension is the number of directions across the wave: all directions less two. In four dimensions that is two, and there is no third. For a potential that does not change in time the forced law is the wave operator on its one component, and for a radial field that is a power $c$ of the distance in $d$ dimensions of space the divergence is $d + c$ times that power: free of sources for one power only, which in three dimensions is the inverse square. A Fortran twin executes the divergence of the law on two hundred random waves for each of the 1331 laws with whole constants from $-5$ to $5$ and finds eleven conserved, those of the theorem; counts the waves along random null vectors in three to seven dimensions; differentiates radial fields numerically; and sets the forced law against measurement: the exponent of the static law, the constant of thermal radiation with a rival of three waves excluded, and the speed of gravity against that of light. That charge is conserved whatever the field does is the one premise, and it is one field of one printed structure. Part II carries the reading of light and of electromagnetism from which the paper takes its place in the series, at premise grade and apart from the machine-checked claims.

## 1. The Theorem and What It Rests On

### 1.1 The statement

Let $\partial_\mu$ be linear maps on a commutative ring, one for each direction $\mu$, that commute and obey the rule of the product, and let $\eta_\mu$ be signs. For a potential $A_\nu$ the field, the wave operator and the divergence are

$$F_{\mu\nu} = \partial_\mu A_\nu - \partial_\nu A_\mu, \qquad \Box = \sum_\mu \eta_\mu\,\partial_\mu\partial_\mu, \qquad \partial\cdot A = \sum_\mu \eta_\mu\,\partial_\mu A_\mu.$$

The linear law of second order built from the potential alone, with constant coefficients and no direction preferred, has three constants $a$, $b$ and $m$:

$$J_\nu = a\,\Box A_\nu + b\,\partial_\nu(\partial\cdot A) + m\,A_\nu.$$

**Theorem (`divergence_of_the_law`).** For every potential, $\sum_\nu \eta_\nu\,\partial_\nu J_\nu = (a + b)\,\Box(\partial\cdot A) + m\,(\partial\cdot A)$.

**Theorem (`maxwell_forced`).** On the premises below, $b = -a$ and $m = 0$.

**Theorem (`the_forced_law_is_maxwell`).** On the premises below, in every arena, $J_\nu = a \sum_\mu \eta_\mu\,\partial_\mu F_{\mu\nu}$.

**Theorem (`gauge_forced`).** On the premises below, $m = 0$, and the law is the same for $A_\nu$ and for $A_\nu + \partial_\nu\chi$, for every $\chi$.

**Theorem (`two_helicities_and_no_third`).** In four dimensions the fields of the waves along one null vector form a space of dimension two.

The law is the one Maxwell wrote [1]. No coupling is fixed by the theorems: the constant $a$ is free. The premises are met: `maxwellPremises` constructs a term of the structure for every $a$ that is not zero.

### 1.2 The premises, printed

The physical premises of the paper are the fields of this structure of the Lean file, and there are no others. What is cited is in the tables of Section 1.3.

```lean
structure Premises where
  a : ℚ
  b : ℚ
  m : ℚ
  weight : a ≠ 0
  conserved : ∀ (R : Type) [CommRing R] [Algebra ℚ R] (S : Arena ℚ (Fin 4) R) (A : Fin 4 → R),
    ∑ ν, eta4 ν • S.d ν (law S eta4 a b m A ν) = 0
```

It carries one premise, the field `conserved`: the source that the law defines has no divergence, whatever the potential, in every arena of four directions with signs $(+, -, -, -)$. The field `weight` says only that the law has a term of second order; no theorem uses it. The constants are rational numbers. No field of `Premises` states a relation among the constants, a field strength, a gauge, or the conclusion of any theorem. Section 9 states where the premise comes from.

### 1.3 What is proved, what is cited, what is assumed

| Statement | Standing | Where |
|---|---|---|
| The field is antisymmetric, obeys the equations without sources, and is kept by a gauge turn | Proved, in every arena | Appendix A, Part I |
| The divergence of the field is the wave operator on the potential less the gradient of its divergence | Proved | Part I |
| The divergence of the general law is $(a + b)\,\Box(\partial\cdot A) + m\,(\partial\cdot A)$ | Proved | Part II |
| Under a gauge turn the law changes by $(a + b)\,\partial_\nu\Box\chi + m\,\partial_\nu\chi$ | Proved | Part II |
| Conservation for every potential in every arena of four directions forces $b = -a$ and $m = 0$ | Proved, over the rational numbers, with an explicit arena and potential | Part III |

The table continues with the waves, the static half and the premises.

| Statement | Standing | Where |
|---|---|---|
| For a plane wave the divergence of the field is $(k\cdot k)\,\varepsilon - (k\cdot\varepsilon)\,k$ times the profile | Proved, in every arena over a field | Part IV |
| Off the null cone a solution has no field; on it, it is transverse | Proved | Part IV |
| Along a null vector in adapted directions the fields of the waves form a space of dimension $n - 2$; in four dimensions, two | Proved, over every field | Part IV |
| A static potential along the time: the forced law is $a$ times the wave operator on it, and zero along space | Proved | Part V |
| A radial field of power $c$ in $d$ dimensions has divergence $d + c$ times the power; its square falls as the power $2 + 2c$; in three dimensions the inverse square is free of sources | Proved, for elements of an arena that obey the stated relations | Part V |
| On the premises: Maxwell's law, no mass, gauge invariance; the premises are met | Proved | Part VI |

What is not machine-checked is in the third table.

| Statement | Standing | Where |
|---|---|---|
| Charge is conserved whatever the field does | Premise; the measured bound is [10] | Sections 4, 9 |
| A linear law of at most second order, built from the potential alone with constant coefficients and no direction preferred, has the three terms of Section 1.1 | Classical, not formalised | Sections 1.1, 2 |
| The static field of a point is radial, with a size that depends on the distance alone | Symmetry, entered | Section 6 |
| The relations of the radial theorems are met by the powers of the distance on space less a point | Elementary analysis, not formalised; executed by the twin | Sections 6, 8 |
| The two states of a wave are the two helicities | Classical reading, cited: [5] | Section 5 |
| A field of $n$ dimensions has $n - 1$ electric and $(n-1)(n-2)/2$ magnetic components; gravity has $n(n-3)/2$ waves | Classical counts, entered; the theorems of Part VII are arithmetic on them | Section 7 |
| Waves of gravity travel on the same cone | Cited: [16] | Sections 5, 8 |
| The formulas and measured values of the twin: the constant of thermal radiation [12], and [7, 8, 9, 10, 11] | Entered from the literature; numerical, not machine-checked | Section 8 |

The paper claims as machine-checked the rows marked proved and no others. A row marked cited is a result with a published proof that this work has not machine-checked. A row marked entered is a classical formula or a measured value used by the numerical twin or by an arithmetic theorem; no theorem of Sections 3 to 6 rests on it. Part II, the reading, is outside these tables: it is premise-grade and is labelled so where it begins.

## 2. Fields as Algebra

A law for a field needs fields that can be added, multiplied and differentiated. A commutative ring with linear maps that commute and obey the rule of the product is exactly this, and it is what the file of Appendix A formalises as the structure `Arena`, in the kernel of Lean 4 [14] on the library Mathlib [13]. Working at this level has a cost and a gain. The cost is that no space of functions, no topology and no integral is constructed. The gain is that every theorem holds in every arena, the smooth functions on any open set of spacetime included, and for every number of directions and every choice of signs, so nothing proved in Sections 3 and 5 is special to four dimensions until a number is counted.

The definitions `F`, `box`, `div`, `source` and `law` are the field, the wave operator, the divergence, the divergence of the field, and the law of Section 1.1. One name needs a word. In the text the source is $J_\nu$, what the law equals. The file gives the name `source` to the divergence of the field, which on the forced law is the source divided by $a$. The constants of the law are arbitrary. Nothing ties them until Section 4. That the three terms of `law` are all the terms such a law can have is the classical count of the ways to build a vector from two derivatives and a potential with no direction preferred; it is not formalised, and the theorems are about the law as defined.

## 3. The Field and the Law

Nothing in this section is assumed. Each statement is a theorem of Appendix A.

**The equations without sources (`F_antisymm`, `homogeneous`).** The field is antisymmetric, and $\partial_\lambda F_{\mu\nu} + \partial_\mu F_{\nu\lambda} + \partial_\nu F_{\lambda\mu} = 0$ for every potential. These are two of Maxwell's four equations, and they are identities.

**A gauge turn keeps the field (`gauge_keeps_the_field`).** The potentials $A_\nu$ and $A_\nu + \partial_\nu\chi$ have the same field.

**The divergence of the field (`source_eq`, `law_one`, `forced_law_is_a_source`).** $\sum_\mu \eta_\mu\,\partial_\mu F_{\mu\nu} = \Box A_\nu - \partial_\nu(\partial\cdot A)$. It is the law with constants $1$, $-1$ and $0$, and the law with constants $a$, $-a$ and $0$ is $a$ times it, in every arena.

**The divergence of the law (`divergence_of_the_law`).** For every potential and all three constants, $\sum_\nu \eta_\nu\,\partial_\nu J_\nu = (a + b)\,\Box(\partial\cdot A) + m\,(\partial\cdot A)$. The proof moves the derivative through the wave operator (`box_d`), which the commuting of the maps allows.

**The law under a gauge turn (`the_law_under_a_gauge_turn`).** Replacing $A_\nu$ by $A_\nu + \partial_\nu\chi$ adds $(a + b)\,\partial_\nu\Box\chi + m\,\partial_\nu\chi$ to the law. The same two combinations of constants govern conservation and the gauge.

## 4. Conservation Forces the Law

**The identity (`conservation_identity`, `the_source_is_conserved`).** With $b = -a$ and $m = 0$ the divergence of the law is zero for every potential. In particular the divergence of the divergence of the field is zero.

**The forcing (`conservation_in_four_dimensions_forces_the_law`).** The converse needs an arena in which the two terms of the divergence can be told apart. The file builds one, `timeArena`: four directions, the fields the polynomials in the time over the rational numbers, the first map the derivative and the other three zero. On it the potential `probe`, the cube of the time along the time, has divergence $3t^2$ (`probe_divergence`), and the wave operator on that is $6$ (`probe_wave`). Conservation on this one potential reads $6(a + b) + 3m\,t^2 = 0$ as polynomials, so $m = 0$ and $a + b = 0$. Hence if the source is conserved for every potential in every arena of four directions with one time, $b = -a$ and $m = 0$.

**On the premises (`maxwell_forced`, `the_forced_law_is_maxwell`).** The premise is that conservation. So the law is $a$ times the divergence of the field: $a \sum_\mu \eta_\mu\,\partial_\mu F_{\mu\nu} = J_\nu$. With the equations without sources of Section 3, these are Maxwell's equations.

**No mass, and the gauge (`gauge_forced`, `gauge_invariance_is_a_consequence`).** The constant $m$ is the square of the mass of the quantum of the field, in the law of Proca [4]. It is zero on the premises. And the law is the same after every gauge turn, by Section 3. Gauge invariance is here a consequence of the conservation of charge and is not assumed; that the two go together is classical [3, 6], and here the direction from conservation to the gauge compiles.

**A limit of scope.** The arena of the forcing has fields that depend on time alone. The premise quantifies over every arena of four directions, and this is one of them. A premise that asked conservation only in arenas with a richer dependence would need another witness; the identity of Section 3 shows which one, any potential whose divergence and its wave operator are independent.

## 5. Waves

**A plane wave (`plane_wave`).** Let a profile $\varphi_0$ have derivatives along a vector $k$ of constants: $\partial_\mu\varphi_0 = k_\mu\varphi_1$ and $\partial_\mu\varphi_1 = k_\mu\varphi_2$. For the potential $\varepsilon_\nu\varphi_0$, with $\varepsilon$ a polarization of constants,

$$\sum_\mu \eta_\mu\,\partial_\mu F_{\mu\nu} = \big((k\cdot k)\,\varepsilon_\nu - (k\cdot\varepsilon)\,k_\nu\big)\,\varphi_2, \qquad k\cdot\varepsilon = \sum_\mu \eta_\mu k_\mu\varepsilon_\mu.$$

**Off the cone there is no wave (`off_the_cone_is_pure_gauge`).** If $k\cdot k \ne 0$ and the bracket vanishes, the field $k_\mu\varepsilon_\nu - k_\nu\varepsilon_\mu$ of the wave is zero: the polarization is a multiple of $k$, a gauge turn. Light travels on the null cone and nowhere else. The waves of gravity travel on the same cone [16].

**On the cone the wave is transverse (`on_the_cone_the_wave_is_transverse`).** If $k\cdot k = 0$ and $k$ is not zero, the bracket vanishes exactly when $k\cdot\varepsilon = 0$.

**The count (`every_wave_is_a_transverse_one`, `waves_are_the_range`, `the_count_of_waves`).** Take directions adapted to the wave: the time, the direction of travel, and a set of directions across the wave, with $k$ equal to one along the first two and zero across (`kw_null`: it is null). A polarization with $k\cdot\varepsilon = 0$ has the same field as its part across the wave, and different parts across the wave have different fields (`polMap_injective`). So the fields of the waves along $k$ are exactly the fields of the polarizations across it, and they form a space whose dimension is the number of directions across: with $n$ directions in all, $n - 2$.

**Two and no third (`two_helicities_and_no_third`).** In four dimensions the number is two. The two states are the two helicities of the photon in the classical reading [5], which is cited; what compiles is that the space of fields has dimension two.

**A limit of scope.** The count is proved along a null vector written in adapted directions. That every null vector can be so written is the choice of a frame, elementary and not formalised; the twin counts along random null vectors in three to seven dimensions.

## 6. The Static Half

**The static law (`static_law`, `static_wave_is_the_sum_over_space`, `static_field`).** Let the potential be zero except along the time, and let that component not change along the time. Then the divergence of the potential is zero, the forced law along the time is $a\,\Box A_0$, and along every direction of space it is zero. On a field that does not change along the time the wave operator is the sum over space alone, so this is the equation of Poisson. The field between a direction of space and the time is the derivative of $A_0$ along that direction, the electric field, and the forced law is $a$ times its divergence: the law of Gauss. Half of Maxwell's law, read at rest, is the law of the static charge.

**The symmetry of a point.** Away from the charge the electric field has no divergence. Around a point with no direction preferred the field is radial, $x_i\,w$, with $w$ depending on the distance alone. That is symmetry and is entered. The theorems below say which such fields have no divergence.

**The divergence of a radial field (`radial_divergence`).** Let $x_i$ be coordinates of $d$ directions, $\partial_i x_j$ equal to one when $i = j$ and zero otherwise, let $u = \sum_j x_j^2$, and let $w$ obey $(\partial_i w)\,u = c\,x_i\,w$, which says $w$ is the power $c$ of the distance. Then

$$\Big(\sum_i \partial_i(x_i w)\Big)\,u = (d + c)\,w\,u.$$

**One power only (`only_one_power_is_free_of_sources`).** In a ring without divisors of zero, if the radial field $x_i w$ has no divergence and $w\,u$ is not zero, then $c = -d$.

**The inverse square (`the_field_falls`, `inverse_square_in_three`).** The square of the size of the field is $u\,w^2$, and it is the power $2 + 2c$ of the distance. With three directions and $c = -3$ the divergence of the field times $u$ is zero, so the field has no divergence wherever $u$ is not a divisor of zero, and the square of its size is the power $-4$: the field falls as the inverse square of the distance. This is the law of Coulomb [2].

**A limit of scope.** The relations asked of $x$, $u$ and $w$ are met by the coordinates and the powers of the distance on space less a point. That is elementary analysis and is not formalised here; the theorems hold for any elements of any arena that meet the relations, and the twin executes them numerically.

## 7. Four Dimensions

The two theorems of this section are arithmetic on classical counts, which are entered and not derived here.

**Electric and magnetic (`electric_and_magnetic_are_equal_in_number_exactly_in_four`).** A field of $n$ dimensions has $n - 1$ components that mix time with space and $(n-1)(n-2)/2$ that do not. For $n$ at least two, $2(n - 1) = (n - 1)(n - 2)$ exactly when $n = 4$.

**Light and gravity (`light_and_gravity_have_equal_waves_exactly_in_four`).** Light has $n - 2$ waves, by Section 5. Gravity has $n(n - 3)/2$, a classical count that is cited [16]. For $n$ at least two, $2(n - 2) = n(n - 3)$ exactly when $n = 4$.

## 8. The Numerical Twin

The twin of Appendix B does three things the kernel does not. It executes the identities independently in floating point, it searches a box of laws and many random waves for what the theorems forbid, and it sets the forced law against published measurements.

**The law.** A wave is a polarization on the profile $e^{k\cdot x}$, whose derivative along a direction multiplies by the component of $k$. For each of the 1331 laws with whole constants from $-5$ to $5$, on two hundred random waves, the twin computes the divergence of the law and its change under a gauge turn. Eleven laws are conserved on every wave, the eleven with $b = -a$ and $m = 0$, and the same eleven are unchanged by every gauge turn.

**Waves.** For two hundred random null vectors in each dimension from three to seven, the fields of the waves form a space of dimension $n - 2$ in every case, and off the cone the only solutions are multiples of $k$, with no field.

**The static half.** At two hundred random points in each dimension of space from two to six, the divergence of $x\,r^c$ computed by differences agrees with $(d + c)\,r^c$; the power $c = -d$ is free of sources in every dimension; and the rival, the inverse square in every dimension, is free of sources in three and in no other.

**The measurements.** The inputs are measured and are printed in Appendix B.

| Test | Forced | Rival | Measured |
|---|---|---|---|
| Deviation of the exponent of the static law from two | 0 | | $(2.7 \pm 3.1)\times10^{-16}$ [7] |
| Constant of thermal radiation, in W m$^{-2}$ K$^{-4}$ | $5.67037\times10^{-8}$ (two waves) [12] | $8.50556\times10^{-8}$ (three waves) | $(5.66967 \pm 0.00076)\times10^{-8}$ [8] |
| Speed of gravity less speed of light, over the speed of light | 0 | | between $-3\times10^{-15}$ and $7\times10^{-16}$ [11] |
| Mass of the photon | 0 | | below $10^{-18}$ eV [9] |
| Decay of the electron | none | | lifetime above $6.6\times10^{28}$ years [10] |

A measured check passes when the forced value lies within two of the quoted uncertainties, and a rival is excluded when it lies further than five. Fourteen checks pass and none fails. The forced exponent stands at 0.87 of the measured uncertainty, and the constant of thermal radiation with two waves at 0.93; the rival with three waves stands at 3731.4. Three limits are stated. The bounds on the mass of the photon and on the decay of the electron are printed as readings and are not counted as checks, since a forced zero compared with a bound cannot fail. The constant of thermal radiation counts the waves through the law of Planck [12], which is entered; the constants in it are those of [17]. And the twin tests the law against one rival and against measurement. It is not a new prediction: the agreement of Maxwell's law with these measurements was known.

## 9. Discussion: The Reading

The derivation above uses only algebra. This section states the reading from which the premise comes, and marks what in it is theorem and what is premise.

**Why conservation.** In the reading of Part II nothing escapes the record: what is registered is not lost. Read on charge, the statement is that the source of the field is conserved whatever the field does. That is the field `conserved`. The premise is physics and is not a theorem of this paper. What the paper proves is what the premise forces: the form of the law, the vanishing of the mass, and the invariance under a gauge turn.

**What is not entered.** The usual order derives the conservation of charge from gauge invariance. Here the order is the other one. Gauge invariance is not a premise, the field strength is not a premise, and the mass is not set to zero by hand; each follows. The constant $a$ stays free, so the strength of the coupling is not fixed and is read from experiment.

**What the paper does not claim.** It does not derive the charge of the electron or the fine-structure constant. It does not construct functions on spacetime, and the step from the algebra of Section 6 to the powers of the distance is not formalised. It does not derive the counts of Section 7. It does not claim that Maxwell's law or the inverse square was unknown or untested. It claims that the form of the law is forced by the conservation of charge, that the photon has no mass and two states as a consequence, that the static half is the inverse square in three dimensions, and that each statement of Section 1.3 marked proved compiles. The fuller account of the reading, light and electromagnetism on the seat, is Part II, Section 11, carried from [15]. No theorem of Sections 2 to 8 depends on it.

## 10. Predictions, Falsifiers, and What Stands

The paper recovers Maxwell's law. It predicts no measurement that the law does not and derives no constant. Its commitments are those of the forced law, and they are stated here as commitments: three that the paper says will stand at any future precision, two proposals it says will fail, and the three observations that would refute it.

### 10.1 Three predictions that will stand

1. **The photon has no mass.** `gauge_forced` gives zero. The present bound is $10^{-18}$ eV [9]. The prediction is that no experiment finds a mass.
2. **The static law is the inverse square, exactly.** `inverse_square_in_three` and `only_one_power_is_free_of_sources` give it. The measured deviation of the exponent is $(2.7 \pm 3.1)\times10^{-16}$ [7]. The prediction is that it stays at zero.
3. **Light has two states.** `two_helicities_and_no_third` gives two. The measured constant of thermal radiation agrees with two and excludes three [8]. The prediction is that no third state of free light is found.

### 10.2 Two proposals that will fail

1. **A law for light with a mass term that keeps charge conserved.** `maxwell_forced` leaves none among linear laws of second order built from the potential alone. The paper predicts that every such proposal either gives up conservation for some field or adds a second field under another name.
2. **A linear law of second order for light, of the form of Section 1.1, that is not Maxwell's.** The same theorem forbids it. The paper predicts that every departure from Maxwell's law in vacuum, if one is found, is not linear or not of second order, or does not conserve charge.

### 10.3 The three falsifiers

Each is a forbidden observation. No observation breaks a theorem; each refutes a premise, or the forced law as the law of nature, and each names the theorem that carries the consequence. The threshold in each case is five of the experiment's printed uncertainties.

1. **A charge that is not conserved.** It refutes the field `conserved` directly.
2. **A photon with a mass.** It refutes the field `conserved` through `gauge_forced`.
3. **A static law whose exponent is not two.** It refutes the field `conserved` through `the_forced_law_is_maxwell` and `static_law`, or the three dimensions of space, or the symmetry of a point, through `only_one_power_is_free_of_sources`.

Apart from them stands the formal claim, which no observation touches and one compilation settles: every theorem named in this text prints its axioms in Appendix D, and a line that names an axiom other than `propext`, `Classical.choice` and `Quot.sound`, or a file that fails to compile under Lean 4.19.0 and Mathlib 4.19.0, refutes the claim that the statements are proved.

### 10.4 What kind of result this is

It is not a new physics. It is a change in how a physical derivation can be checked. The forcing of Maxwell's law is here a single file whose every step the kernel has verified, whose one assumption is one field of one structure, and whose readings are set against measurement. A reader who doubts a step can name the line.

The implication from `Premises` to Maxwell's law, to the vanishing mass and to the gauge is checked by the Lean kernel. No experiment and no later revision of physics alters an implication. Experiment remains free to test whether nature satisfies the premise, and that is all it can test here. What the kernel certifies is the Lean statements; that the definitions of the file say what this text says they say is for the reader to check, and the structure `Premises` is printed for that purpose. What stands is the tables of Section 1.3.

## 11. Part II · The Reading

*This part is the reading from which the paper takes its place in the series. It is carried from Nothing Escapes, Least Erasure (Islam, 2026a), where it stands as the chapters The Geometric Nature of Light and Electromagnetism on the Fixed Line, and it is premise-grade. It is not among the machine-checked claims of Section 1.3, and no theorem of Sections 2 to 8 depends on it. The theorem names set in code in this part, and the twins it quotes, are those of that volume and are printed there, not here. Where this part calls a statement a theorem, the statement follows from the placement of the reading, which is its premise. The falsifiers listed in Sections L.11 and E.11 are falsifiers of the reading; they stand beside the three of Section 10.3 and are not among them.*

### 11.1 The Geometric Nature of Light

*Light as the Line: The Photon Fixed by Both Involutions of the Substrate, Frequency as the Height, Helicity as the One Bit, and Detection as the Registration That Keeps the Energy and Forgets the Path.* Edition 2.0.0.

**Abstract of the chapter.** Twenty-five centuries of optics asked what travels when something is seen and through what it travels. This chapter answers the geometric half of that question on a seat: a reflection of the plane, $s\mapsto1-\bar s$, and the line it fixes. The actuating substrate of Least Erasure (Islam, 2026a) carries two involutions, the particle map that flips every additive charge and the time mirror that reverses a mode's rate, and two carriers onto that reflection. The photon is the one excitation fixed by both at every frequency: it carries no charge of any kind, its energy is real, and it lands on the line under both carriers. We prove in core Lean 4, sixty-three laws with no axiom declared and no use of choice, that frequency is the seat's height and never its side, so the whole spectrum from radio to gamma stands on one line; that a massive mode runs slower than light while every massless mode runs at one speed; that helicity is the one bit no energy reading returns; that the charge-conjugation parity of $n$ photons is $(-1)^n$, selecting two photons for parapositronium and three for orthopositronium; that detection is the registration of the seat, a fringe existing exactly when both paths are open and the record forgets the side; and that the quantum belongs to the field, since every classical intensity bunches while one photon never coincides with itself. A Fortran twin runs sixteen checks with zero failures, among them Englert's duality to $4.4\times10^{-16}$ and the single-photon anticorrelation 13.7 standard deviations below every classical field.

#### L.1 The Reader's Frame

This chapter reads light on the seat. Least Erasure (Islam, 2026a) built the substrate: a particle's charges are odd and its energy even under the particle map, the particle map and the time mirror of a mode's rate commute, and each is carried equivariantly onto the reflection that fixes the line. This chapter claims that the photon is the substrate's one excitation fixed by both involutions at every frequency, and that each old question of optics, what travels, at what speed, carrying what, and registered how, has a precise answer on the seat.

**Negative warrants.** Two, stated so that no reader supplies them. No physical fact here is read as a proof of a mathematical sentence: a corroboration joined to a claim takes the weaker grade. No field theory is written and no constant is derived: the speed of light, the fine-structure constant and the photon's couplings enter as measured.

**Five terms.** A *reading* is any quantity an instrument returns from a state, *odd* under a map that flips its sign and *even* under one that keeps it. A *mode* $e^{-iEt}\psi$ is *stationary* when its norm is constant in time. The *fixed set* of a map is the set of points it leaves unchanged. A *keyed bit* is a yes-or-no property no function of a given record decides. The *side* of a two-path experiment is which path a quantum took; the *record* is what the screen keeps.


#### L.2 The Spine

The seat has a mirror and a record. The mirror is a reflection of the plane, $s\mapsto1-\bar s$, and the points it leaves fixed form one line, the fixed line. A point has a height along the line and a side off it. Registration keeps the height and forgets the side, and it erases nothing exactly when nothing stands off the line. The particle map exchanges a particle with its antiparticle and flips every charge; the time mirror reverses a mode's rate. This chapter reads the seat's occupant in Section L.3 to 5, the registration in Section L.6 and 7, the seat's sign in Section L.8, the even reading in Section L.9, and the crossing in Section L.10.

Three theorems carry the seat, and the engine proves each on its chart. Over one record both worlds exist, and no reading that respects the record decides the value; under the seat every point off the line has a partner, distinct and off it, with one record (`off_locus_pair`); a carrier whose image is on the line proves the value on its image, and coverage extends it (`value_on_image`, `kinetic_crossing`).

**Why this carrier, and not another.** The carrier is not chosen. Spaces with an involution and the maps that respect them form a category (`equivariant_id`, `equivariant_comp`), and the fixed set is a functor on it (`fix_functorial`); an equivariant map into the seat, a global seat whose fixed set is the line (`fold_global_seat`), lands every physical fixed point on the line (`equivariant_carrier_lands`). Here the substrate's two carriers are those of Least Erasure: the charge carrier sends the particle map onto the fold (`charge_carrier_equivariant`), the energy carrier $s=\tfrac12+iE$ sends the time mirror onto the fold (`phi_equivariant`), and a particle fixed by both lands on the line under both (`joint_fixed_iff`, `photon_on_both_lines`). The photon is such a particle at every frequency, so its landing is forced by the functor and not assumed.

**The correspondence matrix.**

\begingroup\small

| Physical phenomenon | Element of the seat | Lean theorem | Fortran check |
|----------|----------|----------|----------|
| the photon, its own antiparticle and stable | fixed by both involutions | `photon_is_its_own_antiparticle`, `photon_is_stationary` | 2001 of 2001 |
| light at every frequency | the occupant of the line, under both carriers | `photon_on_both_lines`, `every_frequency_one_side` | twenty decades, one side |
| frequency | the height, kept by registration | `frequency_is_the_height`, `registration_keeps_light` | 2001 heights |
| rest mass | the depth: massive modes slower | `massive_slower`, `massless_on_the_cone` | 2000 of 2000; 1.9e-10 |
| gravity and light arriving together | the even readings at one speed | `massless_on_the_cone` | GW170817, 4.2e-16 |
| two helicities of one frequency | two worlds over one record | `helicity_is_one_bit`, `parity_involutive` | 2002 states |
| C-parity of n photons | the sign the fixed set carries | `cparity_val`, `c_even_needs_even_photons`, `positronium_counts` | 41 of 41 |
| which path, and the fringe | the registration forgetting the side | `fringe_iff_side_forgotten`, `side_registered_no_fringe` | 20000; D²+V² to 4.4e-16 |
| antibunching of one photon | the quantum is the field's | `classical_light_bunches`, `quantum_is_the_fields` | g2 = 0, 1, 2; 13.7σ |
| a detection | a committed bit, priced | Least Erasure's `registration_erases_off_line` | 125.8 floors per visible photon |

\endgroup


#### L.3 Light Is the Line

The photon carries no electric charge, no colour, no baryon number and no lepton number, and its energy is real: it is its own antiparticle and it does not decay (`photon_is_its_own_antiparticle`, `photon_is_stationary`). It is therefore fixed by both involutions of the substrate, the particle map and the time mirror, and by the functor of the seat it lands on the line under both carriers (`photon_on_both_lines`). No other excitation of the Standard Model is fixed by both at every frequency: the $Z$ boson is neutral and decays, the neutrino's neutrality under the particle map is one keyed bit, and every charged particle stands on an edge under the charge carrier. Light is the seat's occupant.

The occupancy is measured. The photon's mass is bounded below $10^{-18}$ eV (Particle Data Group, 2024), and at that bound a radio photon of one microelectronvolt would be slowed by $5\times10^{-25}$ of its speed (the twin of that volume): light stands on the line to that depth. The electron paper read the neutral sector as the fixed set of charge conjugation, with the photon and the neutral pion sitting on it as particles; this paper reads the photon as the one resident of that set whose energy is real at every frequency, and so the one resident of the line under the energy carrier too.


#### L.4 Frequency Is the Height

Under the energy carrier a photon of frequency $\omega$ lands at $(1,\omega)$: its frequency is the seat's height and its side is the line (`frequency_is_the_height`). Every frequency stands on one side (`every_frequency_one_side`), and registration keeps a photon exactly, since nothing of it stands off the line to be forgotten (`registration_keeps_light`). The spectrum from radio at $10^{-9}$ eV to gamma rays at $10^{11}$ eV, twenty decades, is the line's heights (the twin of that volume).

The old question of the speed hierarchy has its answer on the same two coordinates. A mode with $\omega^2=k^2+m^2$ and $m\neq0$ has $k^2<\omega^2$ and runs slower than light (`massive_slower`); a massless mode has $\omega^2=k^2$ at every frequency (`massless_on_the_cone`). Frequency is the height and rest mass is the depth: two coordinates, never one. The twin finds the massless group velocity equal to $c$ to $1.9\times10^{-10}$ across 2000 frequencies and every massive mode below it. Measured: gamma rays from GRB 090510 bound any vacuum dispersion above the Planck energy (Fermi LAT, 2009), and the gamma-ray burst of GW170817 arrived 1.74 seconds after the gravitational waves emitted 130 million years earlier, bounding the difference of the two speeds below $4.2\times10^{-16}$ (LIGO, Virgo, Fermi GBM and INTEGRAL, 2017).


#### L.5 Helicity Is the One Bit

A massless particle of spin one has two helicity states, not three (Wigner, 1939). Parity reverses the helicity and keeps the frequency (`parity_involutive`). So the two helicities of one frequency are two states with one energy record, and no reading of the energy returns which one is present (`helicity_is_one_bit`). This is the seat's residue carried by light: one bit, a two-point set over one record, unread by the even reading. Circular polarization is that bit made visible, and it is the bit a polarizer, not a calorimeter, registers.


#### L.6 Detection Is Registration

In a two-path experiment the side is which path the quantum took and the record is where it lands on the screen. Write the intensity at a point as $I=a^2+b^2+2abc\,s$, with $a$ and $b$ the two amplitudes, $c$ the overlap of whatever marks the path (zero when the side is registered, nonzero when it is forgotten), and $s=\pm1$ the fringe sign. A fringe exists, the intensity differing between $s=+1$ and $s=-1$, exactly when both paths are open and the side is forgotten (`fringe_iff_side_forgotten`); registering the side leaves $a^2+b^2$ and no fringe at all (`side_registered_no_fringe`). This is the seat's registration with both clauses: a record that forgets the side keeps the interference, and one that keeps the side erases it.

The trade is exact. The which-path distinguishability $D$ and the fringe visibility $V$ satisfy $D^2+V^2\le1$, with equality on every pure state (Englert, 1996; Wootters and Zurek, 1979); the twin reaches equality to $4.4\times10^{-16}$ on 20000 pure states. The which-way experiment in an atom interferometer (Dürr, Nonn and Rempe, 1998) observed the loss of the fringe with no momentum kick to explain it: the record of the side, and nothing else, erased it.


#### L.7 The Quantum Is the Field's

The discreteness of light is not the detector's alone. For any classical field detected by quantized matter, the coincidence rate of two detectors is at least the square of the single rate, $g^{(2)}\ge1$ (Glauber, 1963), which the engine proves on the two-point split, $(x+y)^2\le2(x^2+y^2)$ (`classical_light_bunches`), and the twin checks on 10000 classical intensity distributions. A single photon never coincides with itself, $n(n-1)=0$ at $n=1$ (`single_photon_no_coincidence`, `quantum_is_the_fields`). Coherent light has $g^{(2)}=1$ and thermal light $2$ (the twin of that volume). Antibunching was observed in resonance fluorescence (Kimble, Dagenais and Mandel, 1977), and a single-photon source behind a beam splitter gave an anticorrelation parameter of $0.18\pm0.06$ (Grangier, Roger and Aspect, 1986), 13.7 standard deviations below every classical field. Two photons meeting at a beam splitter leave together (Hong, Ou and Mandel, 1987). The photoelectric effect alone admits a semiclassical account (Lamb and Scully, 1969); light as a whole does not. The field carries its own quantum.


#### L.8 Light Under the Particle Map: Furry and Positronium

The photon sits on the fixed set of the particle map as a particle, and it carries a sign there: its charge-conjugation parity is $-1$, so $n$ photons carry $(-1)^n$ (`cparity_val`). Electromagnetism conserves this sign, so a state even under charge conjugation decays only into an even number of photons (`c_even_needs_even_photons`), and closed loops of charge emit no odd number of photons (Furry, 1937). Parapositronium, even, decays into two photons and orthopositronium, odd, into three (`positronium_counts`); their lifetimes, 125 ps and 142 ns, are the electron paper's measured readings of this bit.


#### L.9 The Even Reading Travels at One Speed

Gravity reads the energy-momentum tensor and nothing else, so it reads light's energy and never its helicity or its C-parity. Light bends in a gravitational field by exactly twice the Newtonian angle, and gravitational waves and light, the two massless even-reading carriers, travel at one speed (Section L.4). Gravity is the reversible branch of registration, one sign and no bit (Islam, 2026b); light is the one excitation that stands on that branch's locus with every odd reading zero.


#### L.10 What Light Carries, and What It Does Not

Light carries the seat's occupant: the one excitation fixed by both involutions at every frequency, on the line under both carriers, with the frequency as the height, the helicity as the one bit and the C-parity as the sign. It carries the registration: detection as the record that keeps the energy and forgets the path, exact to Englert's equality. It carries its own quantum.

The engine's delivery is on its own image, the photons it lands (`value_on_image`). It does not derive the speed of light, the fine-structure constant, or any other magnitude. It does not identify the substrate with the electromagnetic field: the field is the substrate's odd reading, and light is the configuration of that reading which stands on the line.


#### L.11 Falsifiers

Three falsifiers, each a forbidden observation naming the theorem it would break. **F-Dispersion:** a vacuum speed of light that depends on frequency, at any precision, breaking `every_frequency_one_side` read physically and `massless_on_the_cone`. **F-Fringe:** a fringe of full visibility from a two-path state whose side is registered with certainty, breaking `fringe_iff_side_forgotten` and Englert's duality. **F-Helicity:** a third, longitudinal helicity state of the free photon, breaking `helicity_is_one_bit`. Two measurements would sharpen readings without moving the paper's standing: the photon mass bound, and the vacuum-dispersion bound at still higher photon energies.


### 11.2 Electromagnetism on the Fixed Line

*Charge as the Side, the Electric Field as the Line, the Magnetic Sign as the One Bit, and Duality as the Quarter Turn Whose Square Is Charge Conjugation.* Edition 1.0.0.

**Abstract of the chapter.** Electromagnetism is the best-measured interaction in physics and the one whose discrete symmetries are cleanest: charge conjugation reverses every field, time reversal reverses the magnetic field and keeps the electric one, and a duality rotation exchanges them in the vacuum. This chapter reads the field on the seat, the reflection $s\mapsto1-\bar s$ and the line it fixes. Two carriers land electromagnetism on the seat. The charge carrier sends a particle of charge $q$ to the side of the line and carries charge conjugation onto the reflection, so the neutral states are the line. The field carrier $s=\tfrac12+iF$ on the Riemann–Silberstein amplitude $F=E+iB$ carries time reversal, the complex conjugation of $F$, onto the reflection, so the purely electric fields are the line and the magnetic sign is the one bit a field and its time reverse do not share. We prove in core Lean 4, seventy-one laws with no axiom declared and no use of choice, that charge conjugation, parity and time reversal are involutions with $CT=P$ and $CPT$ the identity on the field; that duality is a quarter turn whose square is charge conjugation and whose fourth power is the identity, anticommuting with time reversal as $-i$ does with complex conjugation; that the energy density is invariant under all of them while both Lorentz invariants reverse under duality; that light is null and stays null under duality; that a magnetic term breaks time reversal and keeps every energy real; that charge is conserved by pair creation and forced in thirds; and that the Aharonov–Bohm record reads flux modulo one quantum. A Fortran twin runs seventeen checks with zero failures, the quantum Hall and Josephson constants exact in the SI. The Part joins the two branches of registration: gravity the even, one-signed reading, magnetism the odd reading that keeps a priced bit.

#### E.1 The Reader's Frame

This chapter is dedicated to one interaction. Least Erasure (Islam, 2026a) put the four readings of the substrate on one seat: three gauge readings odd under the particle map and one, gravity's, even. Registration has two branches, gravity the reversible branch that keeps no bit and magnetism the priced branch that keeps one. This chapter reads the electromagnetic interaction itself on the seat, in its charges, its fields, its discrete symmetries, its duality, and its quantum registrations, and joins it to those two branches.

It claims that electromagnetism carries the seat twice. Through the charge carrier, charge conjugation is the reflection and the neutral states are the line. Through the field carrier, time reversal is the reflection, the purely electric fields are the line, and the sign of the magnetic field is the one bit a field and its time reverse do not share. Duality, the rotation that exchanges electric and magnetic, is the quarter turn of the seat's Return: its square is charge conjugation.

**Negative warrants.** Two, stated so that no reader supplies them. No physical fact here is read as a proof of a mathematical sentence: a corroboration joined to a claim takes the weaker grade. No field theory beyond Maxwell's is written and no constant is derived: the fine-structure constant, the charges' magnitudes and the speed of light enter as measured or as defined by the SI.

**Five terms.** A *reading* is any quantity an instrument returns from a state, *odd* under a map that flips its sign and *even* under one that keeps it. The *Riemann–Silberstein amplitude* is $F=E+iB$ in units with $c=1$. *Duality* is the rotation $E\mapsto B$, $B\mapsto -E$, which is $F\mapsto -iF$. The *fixed set* of a map is the set of points it leaves unchanged. A *keyed bit* is a yes-or-no property no function of a given record decides.


#### E.2 The Spine

The seat is the one of Section 11.1: the mirror $s\mapsto1-\bar s$, its fixed line, and the registration that keeps a point's height and forgets its side. This chapter reads the seat on charge in Section E.3 and on the field in Section E.4, the residue in the magnetic sign in Section E.5, the discrete symmetries in Section E.6, the Return in duality in Section E.7, the seat's occupant in Section E.8, the registrations in Section E.9, and the two branches in Section E.10.

**Why this carrier, and not another.** The carrier is not chosen. Spaces with an involution and the maps that respect them form a category (`equivariant_id`, `equivariant_comp`), and the fixed set is a functor on it (`fix_functorial`); an equivariant map into the seat, whose fixed set is the line (`fold_global_seat`), lands every physical fixed point on the line (`equivariant_carrier_lands`). Electromagnetism supplies two such maps. The charge carrier, a particle of charge $q$ to the side $h=1+q$, is equivariant for charge conjugation (`charge_carrier_equivariant`). The field carrier, $s=\tfrac12+iF$, is equivariant for time reversal (`field_carrier_equivariant`), and its landing on the purely electric fields is forced (`field_carrier_lands`).

**The correspondence matrix.**

\begingroup\small

| Physical phenomenon | Element of the seat | Lean theorem | Fortran check |
|----------|----------|----------|----------|
| charge conjugation | the reflection, read on charge | `charge_carrier_equivariant`, `bar_fixed_iff_neutral` | table |
| electron and positron | the pair on the two edges | `pair_on_the_edges`, `off_locus_pair` | structural |
| time reversal of the field | the fold | `field_carrier_equivariant`, `T_fixed_iff_electric` | 3721 of 3721 |
| a purely electric field | a point on the line | `electric_on_the_line`, `field_carrier_lands` | 3721 of 3721 |
| a magnetic field and its reverse | two worlds over one electric record | `magnetic_sign_is_the_bit`, `energy_even` | 3660 of 3660 |
| C, P, T | three involutions, CT = P, CPT trivial | `CT_is_P`, `CPT_trivial` | 3721 of 3721 |
| E·B | odd under T and P, even under C | `EB_odd_under_T_and_P` | structural |
| duality | the quarter turn, its square C | `duality_squared_is_C`, `duality_fourth_is_identity`, `duality_anticommutes_with_T` | 3721 of 3721 |
| the energy and the invariants | even under duality; reversed by it | `energy_duality_invariant`, `invariants_flip_under_duality` | 3721 of 3721 |
| a plane wave | light null, and null under duality | `plane_wave_null`, `null_preserved_by_duality` | 5000 waves to 1e-15 |
| a magnetic term | time reversal broken, energies real | `magnetism_odd_branch`, `stationarity_survives_the_magnet` | 100000 blocks; Landau levels |
| pair creation | charge conserved | `pair_creation_conserves_charge` | 19 of 19 |
| the Yukawa couplings | charge forced in thirds | `hypercharge_forced`, `charges_in_thirds` | the charges |
| the Aharonov–Bohm phase | flux read modulo one quantum | `aharonov_bohm_two_worlds` | 2000 fluxes to 7e-15 |
| the Hall and Josephson effects | registration onto integers | structural | h/e², h/2e, 2e/h exact |
| gravity and magnetism | the even and the odd branch | `gravity_even_branch`, `magnetism_odd_branch` | 2.27e39; 174 floors |

\endgroup


#### E.3 Charge Is the Side

A particle of charge $q$, in units of the charge quantum, lands at $h=1+q$ at the height of its frequency, so charge conjugation, $q\mapsto-q$, becomes the reflection $h\mapsto2-h$ (`charge_carrier_equivariant`). The neutral particles are the line (`neutral_charge_on_line`), the electron and the positron land on the two edges, real parts $0$ and $1$, mirror images (`pair_on_the_edges`), and the particle map is an involution whose fixed set is exactly the neutral states (`bar_fixed_iff_neutral`). Least Erasure built this carrier on the leptons; here it is the carrier of the whole interaction.

Charge is conserved at the seat. Pair creation makes a particle and its antiparticle, whose charges cancel (`pair_creation_conserves_charge`), and the electron, the lightest charged particle, does not decay: its lifetime in the channel $e\to\gamma\nu$ exceeds $6.6\times10^{28}$ years (Borexino, 2015). Charge is forced in thirds: the Yukawa couplings and two anomaly conditions fix every hypercharge as a multiple of the quark doublet's (`hypercharge_forced`), and with $Q=T_3+Y$ the up quark carries $\tfrac23$, the down $-\tfrac13$, the electron $-1$, hydrogen and the vacuum none (`charges_in_thirds`). The electron and the positron carry charges equal and opposite to four parts in a hundred million (Particle Data Group, 2024).


#### E.4 The Electric Field Is the Line

On one axis pair the field is the Riemann–Silberstein amplitude $F=E+iB$ (Silberstein, 1907; Bialynicki-Birula, 1996). Time reversal keeps the electric field and reverses the magnetic one, so it is the complex conjugation $F\mapsto\bar F$. The field carrier
$$s(F)=\tfrac12+iF,\qquad \sigma(s(F))=1-\overline{\tfrac12+iF}=\tfrac12+i\bar F=s(\bar F),$$
carries time reversal exactly onto the fold; in the chart it reads $(E,B)\mapsto(1-B,E)$ (`field_carrier_equivariant`). A field is fixed by time reversal exactly when $B=0$ (`T_fixed_iff_electric`), and it lands on the line exactly then (`electric_on_the_line`): the line is the purely electric field, the field of charges at rest. The twin executes the carrier on 3721 integer fields.


#### E.5 The Magnetic Sign Is the One Bit

A field with $B\neq0$ and its time reverse are two fields, both off the line, with one electric component, one energy density and one record (`magnetic_sign_is_the_bit`). The energy density $E^2+B^2$ is even under time reversal, charge conjugation and parity alike (`energy_even`), so no reading of the energy returns the sign of the magnetic field. That sign is the one bit: a moving charge's field and the field of the same charge moving backward share every even reading and differ in it. Iron carries it, remanence $\pm0.996$ at zero applied field (Islam, 2026a), two worlds with one record, the bit kept at a price above Landauer's floor; the product $E\cdot B$ is odd under time reversal and under parity and even under charge conjugation (`EB_odd_under_T_and_P`).


#### E.6 Charge Conjugation, Parity and Time Reversal on the Field

On the field, charge conjugation reverses both components, $F\mapsto-F$; parity reverses the polar electric field and keeps the axial magnetic field; time reversal keeps the first and reverses the second. Each is an involution (`C_involutive`, `P_involutive`, `T_involutive`), charge conjugation after time reversal is parity (`CT_is_P`), and the three together act as the identity on the field (`CPT_trivial`): each of $E$ and $B$ is odd under exactly two of the three. This is the field's form of the CPT theorem (Lüders, 1954; Pauli, 1955), and it is why the substrate's particle map, carried by CPT, keeps every field reading that gravity sees. The twin executes the table on 3721 fields.


#### E.7 Duality: The Quarter Turn Whose Square Is Charge Conjugation

In the vacuum Maxwell's equations are invariant under the rotation $E\mapsto B$, $B\mapsto -E$ (Heaviside, 1893; Larmor, 1897), which is multiplication of $F$ by $-i$. Its square is $F\mapsto-F$, charge conjugation (`duality_squared_is_C`), and its fourth power is the identity (`duality_fourth_is_identity`): duality is a quarter turn, and its square lands on minus one exactly as the spinor's full turn and the quaternion units' product $ijk=-1$ do for the electron. It anticommutes with time reversal, $TD=C\,DT$, as $-i$ does with complex conjugation (`duality_anticommutes_with_T`). The energy density is invariant under it (`energy_duality_invariant`), and both Lorentz invariants, $E^2-B^2$ and $E\cdot B$, reverse under it (`invariants_flip_under_duality`).

Sources break the duality. Electric charges exist; magnetic charges have not been found (Particle Data Group, 2024). The question whether they do is the duality's own bit: a world in which every particle carries the same ratio of magnetic to electric charge is carried by one global duality rotation to a world with no magnetic charge at all, so a monopole is physically distinct only if some particle's ratio differs from another's. Were one found, Dirac's condition would force every electric charge to be a multiple of a quantum fixed by the monopole's charge (Dirac, 1931). This paper types the question and does not answer it; the falsifier F-Monopole names the observation that would.


#### E.8 Light Is Null

A plane wave carries an electric field perpendicular to its magnetic field and equal to it in magnitude: both Lorentz invariants vanish (`plane_wave_null`), and duality, which reverses both invariants, keeps a null field null (`null_preserved_by_duality`). Light is therefore the duality-neutral field: the configuration of the electromagnetic reading on which the rotation that exchanges electric and magnetic acts without changing any invariant. The twin builds 5000 random plane waves and finds both invariants zero to $10^{-15}$, and the dual of each is again a plane wave along the same direction. Section 11.1 reads the photon on the seat as the one excitation fixed by both involutions of the substrate at every frequency.


#### E.9 The Magnet Keeps Every Energy Real, and Registration Lands on Integers

A magnetic field breaks time reversal of the motion of a charge and keeps every energy real. A Hermitian block with a magnetic phase has a nonnegative discriminant whether or not the phase vanishes (`stationarity_survives_the_magnet`, `magnetism_odd_branch`), so its energies are real; the twin checks 100000 such blocks. An electron in a uniform field of one tesla has Landau levels $(n+\tfrac12)\hbar\omega_c$ with $\hbar\omega_c=1.1577\times10^{-4}$ eV, each real, each degenerate $2.418\times10^{14}$ times per square metre (Landau, 1930; the twin of that volume). The Landau problem is the cleanest time-broken motion. The magnet breaks time reversal of the motion and keeps every energy stationary.

Electromagnetic registration lands on integers. The Hall resistance of a two-dimensional electron gas in a strong field is $h/(\nu e^2)$ with $\nu$ an integer (von Klitzing, Dorda and Pepper, 1980), the integer a topological invariant of the filled bands (Thouless, Kohmoto, Nightingale and den Nijs, 1982), reproducible across materials to parts in $10^{10}$ (Jeckelmann and Jeanneret, 2001); the flux through a superconducting ring comes in quanta $h/2e$; and a Josephson junction under microwaves steps at voltages $n\,hf/2e$ (Josephson, 1962). With $e$ and $h$ exact in the SI of 2019 the twin computes $h/e^2=25812.80745930\ \Omega$, $h/2e=2.0678338485\times10^{-15}$ Wb and $2e/h=4.8359784842\times10^{14}$ Hz/V. Each is a registration that lands the field on a locus of integers and keeps nothing off it. The Aharonov–Bohm phase reads the flux enclosed by a path only modulo $h/e$ (Aharonov and Bohm, 1959): two fluxes one quantum apart are two worlds with one record (`aharonov_bohm_two_worlds`), the twin finding the phase equal to $7.3\times10^{-15}$ over 2000 fluxes.


#### E.10 Gravity and Magnetism: One Registration, Two Branches

Registration has two branches. Gravity is the reversible branch: its sources have one sign, it reads energy and nothing else, and no gravitational reading tells a charge from its antiparticle (`gravity_even_branch`); antihydrogen falls as hydrogen does (ALPHA-g, 2023). Magnetism is the priced branch: time reversal reverses the magnetic field (`magnetism_odd_branch`), so the magnetic sign is a bit, and a stable magnetic bit at $5.0\times10^{-19}$ J per switch costs 174 Landauer floors at 300 K (the twin of that volume). Electromagnetism carries both faces of the substrate's three plus one on one field: its charges and its magnetic sign are odd, its energy density even, and the even part is what gravity reads. The two readings differ in strength by the ratio of the Coulomb to the gravitational attraction in hydrogen, $2.27\times10^{39}$, with $\alpha=7.2973525737\times10^{-3}$ computed from the constants (the twin of that volume). This paper derives neither number; it states which reading each belongs to.


#### E.11 Falsifiers

Three falsifiers, each a forbidden observation naming the theorem it would break. **F-Charge:** a process that creates or destroys net electric charge, the decay of the electron among them, breaking `pair_creation_conserves_charge` and the seat reading of Section E.3. **F-Thirds:** a free particle whose charge is not a multiple of one third of the electron's, breaking `hypercharge_forced` and `charges_in_thirds` read physically. **F-Reality:** a magnetic field that drives a bound charge's energy off the real axis in a closed system, breaking `stationarity_survives_the_magnet` read physically. Two measurements would sharpen readings without moving the paper's standing: a magnetic monopole, which would read the duality's bit, and the resolution of the disputed digits of the fine-structure constant.

## 12. Closure

The forcing of the law of light is no longer informal prose. From a commutative ring with derivatives that commute, and nothing more, Lean 4 with Mathlib compiles the equations without sources, the divergence of the general linear law of second order, its change under a gauge turn, the forcing of Maxwell's law by conservation on an explicit arena of four directions, the divergence of the field of a plane wave, the absence of waves off the null cone, the count of the waves along a null vector in every number of dimensions, the static law, and the divergence of a radial field of any power in any number of dimensions. No axiom is declared. No proof is left open. No headline theorem closes by its own hypothesis or over a structure that carries its conclusion.

Maxwell's law is recovered as the one linear law of second order whose source is conserved, with its coupling left free. The vanishing mass of the photon and the invariance under a gauge turn are recovered with it, neither of them entered. The two states of light are recovered as the dimension of a space of fields, and the inverse square as the one power of the distance that is free of sources in three dimensions. The numerical twin finds, among 1331 laws with whole constants, the eleven the theorem names and no other; counts the waves in three to seven dimensions; and sets the law against measurement: the exponent of the static law within its uncertainty of two, and the constant of thermal radiation at two waves with three excluded.

Every boundary is in plain sight. That charge is conserved whatever the field does is one field of one printed structure. That the relations of the radial theorems are met by the powers of the distance is elementary analysis, not formalised. That the two states are the two helicities is the classical reading, cited. The counts of components in $n$ dimensions and the count of the waves of gravity are classical, entered, and the theorems on them are arithmetic. The strength of the coupling is not derived, here or anywhere in the paper.

That structure is not an arbitrary postulate. The two statements the reading rests on, Existence and Least Erasure, are theorems in their own domain: each has its own compiled Lean file, with no axiom declared, listed in the Lean Library Reference. There they are proved. The Heat Bridge, which joins erasure to heat, is a theorem there as well; the bridge spoken of below is a different one, from that domain to physics. Here they are used, and the difference is stated. Between that domain and the algebra of a field lies a physical bridge: that nothing escapes the record, read on charge as the conservation of the source whatever the field does. This paper does not claim the bridge as a theorem. It writes the bridge down as `Premises`, so that the engine imports nothing outside Mathlib and can be checked alone, and so that a reader can see exactly which sentence carries the physics.

Two things are therefore separate, and the paper keeps them separate. Inside the kernel, the implication from `Premises` to Maxwell's law is a mathematical certainty. No experiment, no consensus and no later revision of physics alters it, and anyone can recheck it with one compilation. Outside the kernel stand three falsifiers. They test whether nature satisfies the premise, and so far nature does. What survives both is not opinion. It is a theorem, and a physics that has met every test of its premise.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file and the Fortran twin are written by a language model under the author's direct supervision. Every theorem named in the text of Sections 1 to 10 and 12 is in Appendix A under that name, and its kernel line is printed in Appendix D. Classical results that are cited and not formalised are named as such in Section 1.3 and wherever they are used. No constant of nature is derived anywhere in this paper; the numbers of the twin are computed from random data, from the fixed constants of the units, and from measured inputs, which Appendix B prints.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1. J. C. Maxwell, Phil. Trans. R. Soc. 155 (1865) 459.
2. C. A. Coulomb, Mém. Acad. R. Sci. (1785) 569.
3. H. Weyl, Z. Phys. 56 (1929) 330.
4. A. Proca, J. Phys. Radium 7 (1936) 347.
5. E. Wigner, Ann. Math. 40 (1939) 149.
6. S. Weinberg, Phys. Rev. 138 (1965) B988.
7. E. R. Williams, J. E. Faller and H. A. Hill, Phys. Rev. Lett. 26 (1971) 721.
8. T. J. Quinn and J. E. Martin, Phil. Trans. R. Soc. A 316 (1985) 85.
9. D. D. Ryutov, Plasma Phys. Control. Fusion 49 (2007) B429.
10. M. Agostini et al. (Borexino), Phys. Rev. Lett. 115 (2015) 231802.
11. B. P. Abbott et al. (LIGO, Virgo, Fermi GBM and INTEGRAL), Astrophys. J. Lett. 848 (2017) L13.
12. M. Planck, Verh. Dtsch. Phys. Ges. 2 (1900) 237.
13. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
14. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
15. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
16. M. F. Islam, Immanent Gravity as a Machine-Checked Mathematical Theorem, edition 4.0.0 (2026b).
17. E. Tiesinga, P. J. Mohr, D. B. Newell and B. N. Taylor, Rev. Mod. Phys. 93 (2021) 025010.
18. W. H. Furry, Phys. Rev. 51 (1937) 125.
19. R. J. Glauber, Phys. Rev. 130 (1963) 2529.
20. W. E. Lamb and M. O. Scully, in Polarisation, Matière et Rayonnement (Presses Universitaires de France, 1969).
21. H. J. Kimble, M. Dagenais and L. Mandel, Phys. Rev. Lett. 39 (1977) 691.
22. W. K. Wootters and W. H. Zurek, Phys. Rev. D 19 (1979) 473.
23. P. Grangier, G. Roger and A. Aspect, Europhys. Lett. 1 (1986) 173.
24. C. K. Hong, Z. Y. Ou and L. Mandel, Phys. Rev. Lett. 59 (1987) 2044.
25. B.-G. Englert, Phys. Rev. Lett. 77 (1996) 2154.
26. S. Dürr, T. Nonn and G. Rempe, Nature 395 (1998) 33.
27. A. A. Abdo et al. (Fermi LAT and GBM), Nature 462 (2009) 331.
28. Particle Data Group, S. Navas et al., Phys. Rev. D 110 (2024) 030001.
29. O. Heaviside, Electromagnetic Theory, vol. 1 (The Electrician, 1893).
30. J. Larmor, Phil. Trans. R. Soc. A 190 (1897) 205.
31. L. Silberstein, Ann. Phys. 327 (1907) 579.
32. L. Landau, Z. Phys. 64 (1930) 629.
33. P. A. M. Dirac, Proc. R. Soc. A 133 (1931) 60.
34. G. Lüders, Dan. Mat. Fys. Medd. 28, no. 5 (1954).
35. W. Pauli, in Niels Bohr and the Development of Physics (Pergamon, 1955) 30.
36. Y. Aharonov and D. Bohm, Phys. Rev. 115 (1959) 485.
37. B. D. Josephson, Phys. Lett. 1 (1962) 251.
38. K. von Klitzing, G. Dorda and M. Pepper, Phys. Rev. Lett. 45 (1980) 494.
39. D. J. Thouless, M. Kohmoto, M. P. Nightingale and M. den Nijs, Phys. Rev. Lett. 49 (1982) 405.
40. I. Bialynicki-Birula, Prog. Opt. 36 (1996) 245.
41. B. Jeckelmann and B. Jeanneret, Rep. Prog. Phys. 64 (2001) 1603.
42. E. K. Anderson et al. (ALPHA-g), Nature 621 (2023) 716.
43. G. Kirchhoff, Ann. Phys. 64 (1845) 497.
44. M. Born and L. Infeld, Proc. R. Soc. A 144 (1934) 425.
45. H. Euler and W. Heisenberg, Z. Phys. 98 (1936) 714.
46. ATLAS Collaboration, Nature Phys. 13 (2017) 852.

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its engine uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main, read at commit 38f6678.

47. Root Axiom and Existence: Publication Library/Philosophy/Metaphysics/Root Axiom/TOE_Zero.lean. Compiled alone in core Lean 4.19.0, exit 0.
48. RH master: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_44_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.
49. Existence, as carried in the RH master: line 6635.
50. Heat Bridge: RH master, Parts VII-c and VII-d.
51. Prime Freedom: RH master, Parts XIII and XIV.
52. Freedom Arrow: RH master, Part XV.
53. Least Erasure: protocols/RH One Bit/Nothing Escapes Three Plus One/Least_Erasure.lean. Compiled alone in core Lean 4.19.0, exit 0.
54. Second Law: Publication Library/Mathematics/Mathematical Physics/Second_Law_Theorem_v1_0_0_CC.pdf, with its Lean file printed inside.
55. P versus NP master: FINAL_BINDING/PNP Binding/PNP_Normal_Form_Paper_v1_14_0_CC.lean
56. ZFC seal: lean/ZFC_Block_Hardened_FINAL_v2_0_0_Hermetically_Sealed.lean
57. No Second Sovereign: Publication Library/Mathematics/Millennium Series/No_Second_Sovereign_v1_0_0_CC.lean
58. Future Proof Empirical Witness Seal: Publication Library/Mathematics/Millennium Series/Future_Proof_Empirical_Witness_Seal_v1_0_0_CC.lean

## Appendix A · SPHYS_Maxwell_Forced_CC.lean

Lean 4.19.0 with Mathlib 4.19.0. 40 theorems, no axiom declared, no `sorry`, exit 0 with no warning. The kernel lines are Appendix D.

```lean
/-
SPHYS_Maxwell_Forced_CC.lean · Maxwell's equations forced by the conservation of charge, on real algebra
RATIONALE. The engine of edition 1.0.0 proved its statements over small structures of integers. This file replaces
  it. An arena is a commutative ring with linear maps that commute and obey the rule of the product: the partial
  derivatives. A potential is a family of elements of the ring, the law is the general linear law of second order
  built from it, and a wave is a polarization on a profile. Nothing else is assumed.
DESIGN. Parts, in order.
    Part I    The field. `F_antisymm`, `homogeneous`, `gauge_keeps_the_field`, `source_eq`: the second pair of
              Maxwell's equations and the invariance of the field are identities.
    Part II   The law. `divergence_of_the_law`: the divergence of the general law is (a + b) times the wave
              operator on the divergence of the potential, plus m times that divergence. `the_law_under_a_gauge_turn`.
    Part III  The forcing. `timeArena`, `probe`: an arena of four directions and a potential on it.
              `conservation_in_four_dimensions_forces_the_law`: b = -a and m = 0.
    Part IV   Waves. `plane_wave`, `off_the_cone_is_pure_gauge`, `on_the_cone_the_wave_is_transverse`,
              `every_wave_is_a_transverse_one`, `the_count_of_waves`: in n directions the waves are n - 2.
    Part V    The static half. `static_law`, `radial_divergence`, `the_field_falls`,
              `only_one_power_is_free_of_sources`, `inverse_square_in_three`.
    Part VI   `Premises`; `maxwell_forced`; `the_forced_law_is_maxwell`; `gauge_forced`; `maxwellPremises`.
    Part VII  Arithmetic on cited counts: what singles out four dimensions.
WHAT IS NOT PROVED HERE (read before citing).
    (a) That charge is conserved whatever the field does. It is the field `conserved` of `Premises`.
    (b) That the hypotheses of the radial theorems of Part V are met by functions on space less a point. They are
        the powers of the distance; that step is elementary analysis and is not formalised.
    (c) The counts of Part VII are the classical counts of components; the theorems are arithmetic on them.
RISK. The arena of Part III has fields that depend on time alone; it is one arena among those the premise
  quantifies over. No magnitude is derived.
NON-NEGOTIABLE. No axiom is declared, no sorry. No headline theorem closes over a structure that carries its
  conclusion. The kernel line of every theorem the paper names is printed at the end.
-/
import Mathlib.Algebra.Algebra.Basic
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Algebra.Polynomial.AlgebraMap
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Data.Fintype.BigOperators
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.Data.Matrix.Notation
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Abel
import Mathlib.Tactic.Module
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith

namespace SPHYS.Light
open Finset Polynomial

/-- An arena: a commutative ring of fields over a ring of constants, with one linear map for each direction. The
maps commute and obey the rule of the product. They are the partial derivatives. -/
structure Arena (K : Type*) [CommRing K] (ι : Type*) (R : Type*) [CommRing R] [Algebra K R] where
  d : ι → R →ₗ[K] R
  comm : ∀ μ ν x, d μ (d ν x) = d ν (d μ x)
  leibniz : ∀ μ x y, d μ (x * y) = d μ x * y + x * d μ y

/-! ## Part I. The field -/

section Field
variable {K : Type*} [CommRing K] {ι : Type*} [Fintype ι] {R : Type*} [CommRing R] [Algebra K R]
variable (S : Arena K ι R) (η : ι → K)

/-- The field of a potential. -/
def F (A : ι → R) (μ ν : ι) : R := S.d μ (A ν) - S.d ν (A μ)
/-- The wave operator, with signs η. -/
def box (x : R) : R := ∑ μ, η μ • S.d μ (S.d μ x)
/-- The divergence of a potential, with signs η. -/
def div (A : ι → R) : R := ∑ μ, η μ • S.d μ (A μ)
/-- The divergence of the field: the left side of Maxwell's equations with sources. -/
def source (A : ι → R) (ν : ι) : R := ∑ μ, η μ • S.d μ (F S A μ ν)
/-- The general linear law of second order built from a potential, with three constants. -/
def law (a b m : K) (A : ι → R) (ν : ι) : R := a • box S η (A ν) + b • S.d ν (div S η A) + m • A ν

omit [Fintype ι] in
theorem F_antisymm (A : ι → R) (μ ν : ι) : F S A μ ν = -F S A ν μ := by unfold F; abel

omit [Fintype ι] in
/-- THE EQUATIONS WITHOUT SOURCES. They hold for every potential. -/
theorem homogeneous (A : ι → R) (l μ ν : ι) : S.d l (F S A μ ν) + S.d μ (F S A ν l) + S.d ν (F S A l μ) = 0 := by
  unfold F
  simp only [map_sub]
  rw [S.comm l μ (A ν), S.comm l ν (A μ), S.comm μ ν (A l)]
  abel

omit [Fintype ι] in
/-- A GAUGE TURN KEEPS THE FIELD. -/
theorem gauge_keeps_the_field (A : ι → R) (χ : R) (μ ν : ι) :
    F S (fun ν => A ν + S.d ν χ) μ ν = F S A μ ν := by
  unfold F
  simp only [map_add]
  rw [S.comm μ ν χ]
  abel

theorem box_d (ν : ι) (x : R) : box S η (S.d ν x) = S.d ν (box S η x) := by
  unfold box
  rw [map_sum]
  refine Finset.sum_congr rfl fun μ _ => ?_
  rw [map_smul, S.comm μ ν x, S.comm μ ν (S.d μ x)]

theorem box_add (x y : R) : box S η (x + y) = box S η x + box S η y := by
  unfold box; simp only [map_add, smul_add, Finset.sum_add_distrib]

theorem box_smul (c : K) (x : R) : box S η (c • x) = c • box S η x := by
  unfold box; simp only [map_smul, Finset.smul_sum]
  refine Finset.sum_congr rfl fun μ _ => ?_
  rw [smul_comm]

/-- THE DIVERGENCE OF THE FIELD. It is the wave operator on the potential less the gradient of its divergence. -/
theorem source_eq (A : ι → R) (ν : ι) : source S η A ν = box S η (A ν) - S.d ν (div S η A) := by
  unfold source F box div
  simp only [map_sub, smul_sub, Finset.sum_sub_distrib]
  congr 1
  rw [map_sum]
  refine Finset.sum_congr rfl fun μ _ => ?_
  rw [map_smul, S.comm μ ν (A μ)]

theorem law_one (A : ι → R) (ν : ι) : law S η 1 (-1) 0 A ν = source S η A ν := by
  rw [source_eq]; unfold law; rw [one_smul, neg_smul, one_smul, zero_smul, add_zero, sub_eq_add_neg]

/-- The law with constants a, -a and 0 is a times the divergence of the field, in every arena. -/
theorem forced_law_is_a_source (a : K) (A : ι → R) (ν : ι) : law S η a (-a) 0 A ν = a • source S η A ν := by
  rw [source_eq]; unfold law; module

/-! ## Part II. The law -/

/-- THE DIVERGENCE OF THE LAW. For every potential it is (a + b) times the wave operator on the divergence of the
potential, plus m times that divergence. -/
theorem divergence_of_the_law (a b m : K) (A : ι → R) :
    ∑ ν, η ν • S.d ν (law S η a b m A ν) = (a + b) • box S η (div S η A) + m • div S η A := by
  have h1 : ∑ ν, η ν • S.d ν (box S η (A ν)) = box S η (div S η A) := by
    have e : box S η (div S η A) = ∑ ν, η ν • box S η (S.d ν (A ν)) := by
      unfold div
      have hs : ∀ (s : Finset ι), box S η (∑ ν ∈ s, η ν • S.d ν (A ν)) = ∑ ν ∈ s, η ν • box S η (S.d ν (A ν)) := by
        intro s
        classical
        induction s using Finset.induction_on with
        | empty => simp [box]
        | insert _ _ hx ih => rw [Finset.sum_insert hx, Finset.sum_insert hx, box_add, box_smul, ih]
      exact hs _
    rw [e]
    refine Finset.sum_congr rfl fun ν _ => ?_
    rw [box_d]
  have h2 : ∑ ν, η ν • S.d ν (S.d ν (div S η A)) = box S η (div S η A) := rfl
  have h3 : ∑ ν, η ν • S.d ν (A ν) = div S η A := rfl
  unfold law
  simp only [map_add, map_smul, smul_add, Finset.sum_add_distrib]
  have c1 : ∑ ν, η ν • a • S.d ν (box S η (A ν)) = a • box S η (div S η A) := by
    rw [← h1, Finset.smul_sum]; exact Finset.sum_congr rfl fun ν _ => smul_comm _ _ _
  have c2 : ∑ ν, η ν • b • S.d ν (S.d ν (div S η A)) = b • box S η (div S η A) := by
    rw [← h2, Finset.smul_sum]; exact Finset.sum_congr rfl fun ν _ => smul_comm _ _ _
  have c3 : ∑ ν, η ν • m • S.d ν (A ν) = m • div S η A := by
    rw [← h3, Finset.smul_sum]; exact Finset.sum_congr rfl fun ν _ => smul_comm _ _ _
  rw [c1, c2, c3, add_smul]

/-- THE IDENTITY OF CONSERVATION. With b = -a and m = 0 the divergence of the law is zero for every potential. -/
theorem conservation_identity (a : K) (A : ι → R) : ∑ ν, η ν • S.d ν (law S η a (-a) 0 A ν) = 0 := by
  rw [divergence_of_the_law, add_neg_cancel, zero_smul, zero_smul, add_zero]

/-- The divergence of the divergence of the field is zero. -/
theorem the_source_is_conserved (A : ι → R) : ∑ ν, η ν • S.d ν (source S η A ν) = 0 := by
  have h := conservation_identity S η (1 : K) A
  simpa only [law_one] using h

/-- THE LAW UNDER A GAUGE TURN. It changes by (a + b) times the gradient of the wave operator on the turn, plus m
times the gradient of the turn. -/
theorem the_law_under_a_gauge_turn (a b m : K) (A : ι → R) (χ : R) (ν : ι) :
    law S η a b m (fun ν => A ν + S.d ν χ) ν = law S η a b m A ν + ((a + b) • S.d ν (box S η χ) + m • S.d ν χ) := by
  have hd : div S η (fun ν => A ν + S.d ν χ) = div S η A + box S η χ := by
    unfold div box; simp only [map_add, smul_add, Finset.sum_add_distrib]
  unfold law
  rw [hd, box_add, box_d, map_add]
  module

/-- GAUGE INVARIANCE IS A CONSEQUENCE. With b = -a and m = 0 the law is the same after every gauge turn. -/
theorem gauge_invariance_is_a_consequence (a : K) (A : ι → R) (χ : R) (ν : ι) :
    law S η a (-a) 0 (fun ν => A ν + S.d ν χ) ν = law S η a (-a) 0 A ν := by
  rw [the_law_under_a_gauge_turn, add_neg_cancel, zero_smul, zero_smul, add_zero, add_zero]

end Field

/-! ## Part III. The forcing -/

/-- The signs of four dimensions with one time. -/
def eta4 : Fin 4 → ℚ := ![1, -1, -1, -1]

/-- AN ARENA OF FOUR DIRECTIONS. Its fields are the polynomials in the time; the first direction differentiates
them and the other three give zero. -/
noncomputable def timeArena : Arena ℚ (Fin 4) ℚ[X] where
  d := fun μ => if μ = 0 then Polynomial.derivative else 0
  comm := by
    intro μ ν x
    by_cases hμ : μ = 0 <;> by_cases hν : ν = 0 <;> simp [hμ, hν]
  leibniz := by
    intro μ x y
    by_cases hμ : μ = 0
    · simp [hμ, Polynomial.derivative_mul]
    · simp [hμ]

/-- A potential on that arena: the cube of the time along the time, zero along space. -/
noncomputable def probe : Fin 4 → ℚ[X] := fun μ => if μ = 0 then X ^ 3 else 0

theorem probe_divergence : div timeArena eta4 probe = C 3 * X ^ 2 := by
  simp [div, timeArena, probe, eta4, Fin.sum_univ_four, Polynomial.derivative_X_pow]
  rw [← C_1, ← C_add]; norm_num

theorem probe_wave : box timeArena eta4 (C 3 * X ^ 2 : ℚ[X]) = C 6 := by
  simp [box, timeArena, eta4, Fin.sum_univ_four, Polynomial.derivative_X_pow]
  rw [← C_1, ← C_add, ← C_mul]; norm_num

/-- CONSERVATION IN FOUR DIMENSIONS FORCES THE LAW. If the divergence of the law with constants a, b, m is zero
for every potential in every arena of four directions with one time, then b = -a and m = 0. -/
theorem conservation_in_four_dimensions_forces_the_law (a b m : ℚ)
    (h : ∀ (R : Type) [CommRing R] [Algebra ℚ R] (S : Arena ℚ (Fin 4) R) (A : Fin 4 → R),
      ∑ ν, eta4 ν • S.d ν (law S eta4 a b m A ν) = 0) : b = -a ∧ m = 0 := by
  have k := h ℚ[X] timeArena probe
  rw [divergence_of_the_law, probe_divergence, probe_wave] at k
  have k2 := congrArg (fun p => Polynomial.coeff p 2) k
  have k0 := congrArg (fun p => Polynomial.coeff p 0) k
  simp [Polynomial.coeff_smul, Polynomial.coeff_C] at k2 k0
  refine ⟨by linarith, k2⟩

/-! ## Part IV. Waves -/

section Waves
variable {K : Type*} [Field K] {ι : Type*} [Fintype ι] {R : Type*} [CommRing R] [Algebra K R]
variable (S : Arena K ι R) (η : ι → K)

/-- The product of two vectors of constants, with signs η. -/
def dot (k e : ι → K) : K := ∑ μ, η μ * k μ * e μ

/-- A PLANE WAVE IN THE LAW. Let a profile have derivatives along the wave vector k: the derivative of φ₀ along μ
is k μ times φ₁, and that of φ₁ is k μ times φ₂. For the potential ε φ₀ the divergence of the field is
((k·k) ε − (k·ε) k) times φ₂. -/
theorem plane_wave (k e : ι → K) (φ0 φ1 φ2 : R) (h1 : ∀ μ, S.d μ φ0 = k μ • φ1) (h2 : ∀ μ, S.d μ φ1 = k μ • φ2)
    (ν : ι) : source S η (fun ν => e ν • φ0) ν = (dot η k k * e ν - dot η k e * k ν) • φ2 := by
  unfold source F dot
  simp only [map_sub, map_smul, h1, h2, smul_smul, ← sub_smul, ← Finset.sum_smul]
  congr 1
  rw [Finset.sum_mul, Finset.sum_mul, ← Finset.sum_sub_distrib]
  refine Finset.sum_congr rfl fun μ _ => ?_
  ring

omit [Fintype ι] in
/-- The field of a wave: the wave vector wedged with the polarization. -/
def pol (k e : ι → K) (μ ν : ι) : K := k μ * e ν - k ν * e μ

/-- OFF THE CONE THERE IS NO WAVE. If the wave vector is not null, a polarization that solves the law without
sources has no field: it is a gauge turn. -/
theorem off_the_cone_is_pure_gauge (k e : ι → K) (hkk : dot η k k ≠ 0)
    (h : ∀ ν, dot η k k * e ν - dot η k e * k ν = 0) (μ ν : ι) : pol k e μ ν = 0 := by
  unfold pol
  apply mul_left_cancel₀ hkk
  linear_combination k μ * h ν - k ν * h μ

/-- ON THE CONE THE WAVE IS TRANSVERSE. If the wave vector is null and not zero, a polarization that solves the
law without sources has k·ε = 0. -/
theorem on_the_cone_the_wave_is_transverse (k e : ι → K) (hkk : dot η k k = 0) (hk : ∃ ν, k ν ≠ 0)
    (h : ∀ ν, dot η k k * e ν - dot η k e * k ν = 0) : dot η k e = 0 := by
  obtain ⟨ν, hν⟩ := hk
  have := h ν
  rw [hkk, zero_mul, zero_sub, neg_eq_zero] at this
  exact (mul_eq_zero.mp this).resolve_right hν

end Waves

section Count
variable {K : Type*} [Field K] {τ : Type*} [Fintype τ]

/-- The directions of a wave: the time, the direction of travel, and the directions τ across it. The wave vector
is one along the first two. The signs are plus for the time and minus for the rest. -/
def kw : Bool ⊕ τ → K := Sum.elim (fun _ => 1) (fun _ => 0)
def etaw : Bool ⊕ τ → K := Sum.elim (fun b => if b then 1 else -1) (fun _ => -1)
/-- A polarization across the wave. -/
def lift (t : τ → K) : Bool ⊕ τ → K := Sum.elim (fun _ => 0) t

theorem kw_null : dot (etaw : Bool ⊕ τ → K) kw kw = 0 := by
  simp [dot, kw, etaw, Fintype.sum_sum_type]

theorem dot_kw (e : Bool ⊕ τ → K) : dot etaw kw e = e (Sum.inl true) - e (Sum.inl false) := by
  simp [dot, kw, etaw, Fintype.sum_sum_type]; ring

theorem lift_transverse (t : τ → K) : dot etaw kw (lift t) = 0 := by
  rw [dot_kw]; simp [lift]

omit [Fintype τ] in
/-- EVERY WAVE IS A TRANSVERSE ONE. A polarization with k·ε = 0 has the field of its part across the wave. -/
theorem every_wave_is_a_transverse_one (e : Bool ⊕ τ → K) (h : e (Sum.inl true) = e (Sum.inl false)) :
    pol kw e = pol kw (lift fun j => e (Sum.inr j)) := by
  funext μ ν
  rcases μ with b | i <;> rcases ν with b' | j
  · cases b <;> cases b' <;> simp [pol, kw, lift, h]
  · simp [pol, kw, lift]
  · simp [pol, kw, lift]
  · simp [pol, kw, lift]

/-- The fields of the transverse waves, as a linear map. -/
def polMap : (τ → K) →ₗ[K] (Bool ⊕ τ → Bool ⊕ τ → K) where
  toFun t := pol kw (lift t)
  map_add' s t := by
    funext μ ν; rcases μ with b | i <;> rcases ν with b' | j <;> simp [pol, kw, lift]
    ring
  map_smul' c t := by
    funext μ ν; rcases μ with b | i <;> rcases ν with b' | j <;> simp [pol, kw, lift]

omit [Fintype τ] in
/-- Different transverse polarizations have different fields. -/
theorem polMap_injective : Function.Injective (polMap : (τ → K) →ₗ[K] _) := by
  intro s t h
  funext j
  have := congrFun (congrFun h (Sum.inl true)) (Sum.inr j)
  simpa [polMap, pol, kw, lift] using this

/-- THE WAVES ARE THE TRANSVERSE ONES. A field is the field of a polarization with k·ε = 0 exactly when it is the
field of a polarization across the wave. -/
theorem waves_are_the_range (P : Bool ⊕ τ → Bool ⊕ τ → K) :
    (∃ e : Bool ⊕ τ → K, dot etaw kw e = 0 ∧ pol kw e = P) ↔ P ∈ LinearMap.range (polMap : (τ → K) →ₗ[K] _) := by
  constructor
  · rintro ⟨e, he, rfl⟩
    rw [dot_kw, sub_eq_zero] at he
    exact ⟨fun j => e (Sum.inr j), (every_wave_is_a_transverse_one e he).symm⟩
  · rintro ⟨t, rfl⟩
    exact ⟨lift t, lift_transverse t, rfl⟩

/-- THE COUNT OF WAVES. The fields of the waves along one null vector form a space whose dimension is the number
of directions across the wave: the number of all directions less two. -/
theorem the_count_of_waves :
    Module.finrank K (LinearMap.range (polMap : (τ → K) →ₗ[K] _)) = Fintype.card τ ∧
      Fintype.card (Bool ⊕ τ) = Fintype.card τ + 2 := by
  refine ⟨?_, ?_⟩
  · rw [LinearMap.finrank_range_of_inj polMap_injective, Module.finrank_pi]
  · rw [Fintype.card_sum, Fintype.card_bool, add_comm]

/-- TWO AND NO THIRD. In four dimensions the waves along one null vector form a space of dimension two. -/
theorem two_helicities_and_no_third :
    Module.finrank K (LinearMap.range (polMap : (Fin 2 → K) →ₗ[K] _)) = 2 ∧ Fintype.card (Bool ⊕ Fin 2) = 4 := by
  have h := the_count_of_waves (K := K) (τ := Fin 2)
  simpa using h

end Count

/-! ## Part V. The static half -/

section Static
variable {K : Type*} [CommRing K] {ι : Type*} [Fintype ι] [DecidableEq ι] {R : Type*} [CommRing R] [Algebra K R]
variable (S : Arena K ι R) (η : ι → K)

/-- THE STATIC LAW. Let the potential be zero except along one direction, the time, and let it not change along
the time. Then the forced law along the time is a times the wave operator on that component, and along every
other direction it is zero. -/
theorem static_law (a : K) (A : ι → R) (o : ι) (hA : ∀ ν, ν ≠ o → A ν = 0) (hs : S.d o (A o) = 0) :
    law S η a (-a) 0 A o = a • box S η (A o) ∧ ∀ ν, ν ≠ o → law S η a (-a) 0 A ν = 0 := by
  have hd : div S η A = 0 := by
    unfold div
    refine Finset.sum_eq_zero fun μ _ => ?_
    by_cases hμ : μ = o
    · rw [hμ, hs, smul_zero]
    · rw [hA μ hμ, map_zero, smul_zero]
  constructor
  · unfold law; rw [hd, map_zero, smul_zero, zero_smul, add_zero, add_zero]
  · intro ν hν
    unfold law box
    rw [hd, hA ν hν]
    simp

omit [Fintype ι] [DecidableEq ι] in
/-- THE STATIC FIELD. With the potential zero along space, the field between a direction of space and the time is
the derivative of the one component along that direction: the electric field. -/
theorem static_field (A : ι → R) (o : ι) (hA : ∀ ν, ν ≠ o → A ν = 0) (μ : ι) (hμ : μ ≠ o) :
    F S A μ o = S.d μ (A o) := by
  unfold F; rw [hA μ hμ, map_zero, sub_zero]

/-- THE STATIC WAVE OPERATOR IS THE SUM OVER SPACE. On a field that does not change along the time. -/
theorem static_wave_is_the_sum_over_space (x : R) (o : ι) (hs : S.d o x = 0) :
    box S η x = ∑ μ ∈ Finset.univ.erase o, η μ • S.d μ (S.d μ x) := by
  unfold box
  rw [← Finset.add_sum_erase _ _ (Finset.mem_univ o), hs, map_zero, smul_zero, zero_add]

end Static

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

/-- THE INVERSE SQUARE IN THREE DIMENSIONS. With three directions of space and c = -3 the radial field has no
divergence where u is not a divisor of zero, and the square of its size is the power -4 of the distance: the
field falls as the inverse square. -/
theorem inverse_square_in_three (h3 : Fintype.card σ = 3) (hx : ∀ i j, S.d i (x j) = if i = j then 1 else 0)
    (hw : ∀ i, S.d i w * (∑ j, x j * x j) = -3 * (x i * w)) :
    (∑ i, S.d i (x i * w)) * (∑ j, x j * x j) = 0 ∧
      ∀ i, S.d i ((∑ j, x j * x j) * w * w) * (∑ j, x j * x j) = -4 * (x i * ((∑ j, x j * x j) * w * w)) := by
  constructor
  · rw [radial_divergence S x w (-3) hx hw, h3]; norm_num
  · intro i
    rw [the_field_falls S x w (-3) hx hw i]; norm_num

end Radial

/-! ## Part VI. The theorem -/

/-- The premises. A law of second order, linear in the potential, with three constants: a on the wave operator,
b on the gradient of the divergence, m on the potential itself. The source is what the law equals. The one
premise is that the source is conserved, whatever the potential, in every arena of four directions with one
time. Nothing else is assumed. -/
structure Premises where
  a : ℚ
  b : ℚ
  m : ℚ
  weight : a ≠ 0
  conserved : ∀ (R : Type) [CommRing R] [Algebra ℚ R] (S : Arena ℚ (Fin 4) R) (A : Fin 4 → R),
    ∑ ν, eta4 ν • S.d ν (law S eta4 a b m A ν) = 0

/-- MAXWELL, FORCED. On the premises b = -a and m = 0. -/
theorem maxwell_forced (P : Premises) : P.b = -P.a ∧ P.m = 0 :=
  conservation_in_four_dimensions_forces_the_law P.a P.b P.m P.conserved

/-- THE FORCED LAW IS MAXWELL'S. On the premises the law is a times the divergence of the field, in every arena. -/
theorem the_forced_law_is_maxwell (P : Premises) {R : Type} [CommRing R] [Algebra ℚ R] (S : Arena ℚ (Fin 4) R)
    (A : Fin 4 → R) (ν : Fin 4) : law S eta4 P.a P.b P.m A ν = P.a • source S eta4 A ν := by
  obtain ⟨hb, hm⟩ := maxwell_forced P
  rw [hb, hm, source_eq]; unfold law; module

/-- THE PHOTON HAS NO MASS, AND GAUGE INVARIANCE IS FORCED. On the premises the constant on the potential is
zero, and the law is the same after every gauge turn. -/
theorem gauge_forced (P : Premises) {R : Type} [CommRing R] [Algebra ℚ R] (S : Arena ℚ (Fin 4) R)
    (A : Fin 4 → R) (χ : R) (ν : Fin 4) :
    P.m = 0 ∧ law S eta4 P.a P.b P.m (fun ν => A ν + S.d ν χ) ν = law S eta4 P.a P.b P.m A ν := by
  obtain ⟨hb, hm⟩ := maxwell_forced P
  refine ⟨hm, ?_⟩
  rw [hb, hm]; exact gauge_invariance_is_a_consequence S eta4 P.a A χ ν

/-- THE PREMISES ARE INHABITED. Maxwell's law with any weight that is not zero. -/
def maxwellPremises (a : ℚ) (ha : a ≠ 0) : Premises where
  a := a
  b := -a
  m := 0
  weight := ha
  conserved := fun _ _ _ S A => conservation_identity S eta4 a A

/-! ## Part VII. Arithmetic on cited counts -/

/-- In n dimensions the field has n - 1 electric components and (n - 1)(n - 2)/2 magnetic ones. They are equal
in number exactly in four dimensions, for n at least two. The counts are classical; this is arithmetic on them. -/
theorem electric_and_magnetic_are_equal_in_number_exactly_in_four (n : ℤ) (hn : 2 ≤ n) :
    2 * (n - 1) = (n - 1) * (n - 2) ↔ n = 4 := by
  constructor
  · intro h
    have : (n - 1) * (n - 4) = 0 := by linear_combination -h
    rcases mul_eq_zero.mp this with h1 | h1 <;> omega
  · rintro rfl; norm_num

/-- Light has n - 2 waves and gravity n(n - 3)/2. They are equal in number exactly in four dimensions, for n at
least two. The count for gravity is classical; this is arithmetic on it. -/
theorem light_and_gravity_have_equal_waves_exactly_in_four (n : ℤ) (hn : 2 ≤ n) :
    2 * (n - 2) = n * (n - 3) ↔ n = 4 := by
  constructor
  · intro h
    have : (n - 1) * (n - 4) = 0 := by linear_combination -h
    rcases mul_eq_zero.mp this with h1 | h1 <;> omega
  · rintro rfl; norm_num

end SPHYS.Light

#print axioms SPHYS.Light.F_antisymm
#print axioms SPHYS.Light.homogeneous
#print axioms SPHYS.Light.gauge_keeps_the_field
#print axioms SPHYS.Light.box_d
#print axioms SPHYS.Light.box_add
#print axioms SPHYS.Light.box_smul
#print axioms SPHYS.Light.source_eq
#print axioms SPHYS.Light.law_one
#print axioms SPHYS.Light.divergence_of_the_law
#print axioms SPHYS.Light.conservation_identity
#print axioms SPHYS.Light.the_source_is_conserved
#print axioms SPHYS.Light.the_law_under_a_gauge_turn
#print axioms SPHYS.Light.gauge_invariance_is_a_consequence
#print axioms SPHYS.Light.timeArena
#print axioms SPHYS.Light.probe_divergence
#print axioms SPHYS.Light.probe_wave
#print axioms SPHYS.Light.conservation_in_four_dimensions_forces_the_law
#print axioms SPHYS.Light.plane_wave
#print axioms SPHYS.Light.off_the_cone_is_pure_gauge
#print axioms SPHYS.Light.on_the_cone_the_wave_is_transverse
#print axioms SPHYS.Light.kw_null
#print axioms SPHYS.Light.dot_kw
#print axioms SPHYS.Light.lift_transverse
#print axioms SPHYS.Light.every_wave_is_a_transverse_one
#print axioms SPHYS.Light.polMap_injective
#print axioms SPHYS.Light.waves_are_the_range
#print axioms SPHYS.Light.the_count_of_waves
#print axioms SPHYS.Light.two_helicities_and_no_third
#print axioms SPHYS.Light.static_law
#print axioms SPHYS.Light.radial_divergence
#print axioms SPHYS.Light.the_field_falls
#print axioms SPHYS.Light.only_one_power_is_free_of_sources
#print axioms SPHYS.Light.inverse_square_in_three
#print axioms SPHYS.Light.maxwell_forced
#print axioms SPHYS.Light.the_forced_law_is_maxwell
#print axioms SPHYS.Light.gauge_forced
#print axioms SPHYS.Light.maxwellPremises
#print axioms SPHYS.Light.electric_and_magnetic_are_equal_in_number_exactly_in_four
#print axioms SPHYS.Light.light_and_gravity_have_equal_waves_exactly_in_four
#print axioms SPHYS.Light.forced_law_is_a_source
#print axioms SPHYS.Light.static_field
#print axioms SPHYS.Light.static_wave_is_the_sum_over_space
```

## Appendix B · Maxwell_Forced_Twin_CC.f90

Fourteen checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix C.

```fortran
! Maxwell_Forced_Twin_CC.f90 · twin of SPHYS_Maxwell_Forced_CC.lean
! RATIONALE. The engine proves its statements in every arena. This twin executes them in floating point on waves,
!   whose derivatives are exact, as an independent run; searches every law with whole constants in a box for the
!   conserved ones; counts the waves along random null vectors in three to seven dimensions; differentiates
!   radial fields numerically; and sets the forced law against published measurements, with a rival where one
!   exists.
! DESIGN. A wave is a polarization on the profile exp(k.x): the derivative along a direction multiplies by the
!   component of k. Signs are plus for the time and minus for space. Double precision; one generator, fixed seed.
! CONVENTION. An identity holds when its largest residual is below 1e-9 of the scale. A measured check passes when
!   the forced value lies within two quoted uncertainties; a rival is excluded when it lies further than five.
! NON-NEGOTIABLE. No constant is tuned and no coupling is computed.
! RISK. The measured values are inputs, printed with their sources in the paper. The search of section A covers
!   whole constants from -5 to 5; the engine's theorem covers every rational constant.
program maxwell_twin
  implicit none
  integer, parameter :: i8 = selected_int_kind(18), dp = kind(1.0d0)
  integer(i8) :: seed = 20260622_i8
  integer :: checks = 0, failures = 0
  real(dp), parameter :: pi = 3.14159265358979323846d0
  call laws()
  call waves()
  call static()
  call counts()
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
  function rnd(n) result(k)
    integer, intent(in) :: n
    integer :: k
    seed = mod(seed * 6364136223846793005_i8 + 1442695040888963407_i8, 9223372036854775807_i8)
    k = int(mod(abs(seed / 65536_i8), int(n, i8)))
  end function
  function uni() result(u)
    real(dp) :: u
    u = (rnd(1000000) + 0.5d0)/1.0d6
  end function
  function eta(n) result(e)
    integer, intent(in) :: n
    real(dp) :: e(n)
    e = -1; e(1) = 1
  end function
  function mrank(m, nr, nc) result(r)               ! rank by elimination with pivoting
    integer, intent(in) :: nr, nc
    real(dp), intent(in) :: m(nr, nc)
    real(dp) :: a(nr, nc), t(nc), big
    integer :: r, c, i, p
    a = m; r = 0
    do c = 1, nc
      if (r == nr) exit
      p = r + 1; big = abs(a(p, c))
      do i = r + 2, nr
        if (abs(a(i, c)) > big) then
          big = abs(a(i, c)); p = i
        end if
      end do
      if (big < 1.0d-9) cycle
      r = r + 1
      t = a(r, :); a(r, :) = a(p, :); a(p, :) = t
      do i = r + 1, nr
        a(i, :) = a(i, :) - a(i, c)/a(r, c)*a(r, :)
      end do
    end do
  end function
  subroutine laws()
    integer :: a, b, m, i, nu, kept, wrong, gkept, differ
    real(dp) :: k(4), e(4), et(4), kk, ke, j(4), dv, gch, worst
    logical :: cons, gauge
    et = eta(4); kept = 0; wrong = 0; gkept = 0; differ = 0; worst = 0
    do a = -5, 5
      do b = -5, 5
        do m = -5, 5
          cons = .true.; gauge = .true.
          do i = 1, 200
            do nu = 1, 4
              k(nu) = 2*uni() - 1; e(nu) = 2*uni() - 1
            end do
            kk = sum(et*k*k); ke = sum(et*k*e)
            j = a*kk*e + b*k*ke + m*e                 ! the law on the wave, without the common profile
            dv = sum(et*k*j)                         ! its divergence
            worst = max(worst, abs(dv - ((a + b)*kk*ke + m*ke)))
            if (abs(dv) > 1.0d-9) cons = .false.
            gch = maxval(abs(a*kk*k + b*k*kk + m*k)) ! the change of the law under the gauge turn exp(k.x)
            if (gch > 1.0d-9) gauge = .false.
          end do
          if (cons) kept = kept + 1
          if (gauge) gkept = gkept + 1
          if (cons .neqv. gauge) differ = differ + 1
          if (cons .neqv. (b == -a .and. m == 0)) wrong = wrong + 1
        end do
      end do
    end do
    write(*,'(A)') ' A. The law, on 200 random waves for each of 1331 laws with whole constants from -5 to 5'
    write(*,'(A,ES9.2)') '   largest residual of the divergence of the law against its formula: ', worst
    call check('the divergence of the law is (a + b)(k.k)(k.e) + m (k.e)', worst < 1.0d-9)
    write(*,'(A,I0,A,I0)') '   laws conserved on every wave: ', kept, '   laws unchanged by every gauge turn: ', gkept
    call check('the conserved laws are the eleven with b = -a and m = 0, and no other', kept == 11 .and. wrong == 0)
    call check('conserved and unchanged by a gauge turn coincide on all 1331', differ == 0 .and. gkept == 11)
  end subroutine
  subroutine waves()
    integer :: n, i, j, mu, nu, bad, badoff, trial
    real(dp), allocatable :: k(:), et(:), e(:), ej(:), pm(:,:), mm(:,:)
    real(dp) :: kk, ke, worst
    bad = 0; badoff = 0; worst = 0
    do n = 3, 7
      allocate(k(n), et(n), e(n), ej(n), pm(n, n*n), mm(n, n))
      et = eta(n)
      do trial = 1, 200
        do i = 2, n
          k(i) = 2*uni() - 1; e(i) = 2*uni() - 1
        end do
        e(1) = 2*uni() - 1
        k(1) = sqrt(sum(k(2:n)**2))                   ! on the cone
        kk = sum(et*k*k); ke = sum(et*k*e)
        ! the divergence of the field of the wave: sum over mu of eta k_mu (k_mu e_nu - k_nu e_mu)
        do nu = 1, n
          worst = max(worst, abs(sum(et*k*(k*e(nu) - k(nu)*e)) - (kk*e(nu) - ke*k(nu))))
        end do
        ! the polarizations with k.e = 0, and the fields k wedge e they give
        do j = 1, n
          ej = 0; ej(j) = 1; ej(1) = ej(1) - et(j)*k(j)/k(1)
          do mu = 1, n
            do nu = 1, n
              pm(j, (mu - 1)*n + nu) = k(mu)*ej(nu) - k(nu)*ej(mu)
            end do
          end do
        end do
        if (mrank(pm, n, n*n) /= n - 2) bad = bad + 1
        ! off the cone: the solutions of (k.k) e - (k.e) k = 0 are the multiples of k, and their field is zero
        k(1) = k(1) + 0.5d0 + uni(); kk = sum(et*k*k)
        do mu = 1, n
          do nu = 1, n
            mm(mu, nu) = -k(mu)*et(nu)*k(nu)
          end do
          mm(mu, mu) = mm(mu, mu) + kk
        end do
        if (mrank(mm, n, n) /= n - 1 .or. maxval(abs(matmul(mm, k))) > 1.0d-9) badoff = badoff + 1
      end do
      deallocate(k, et, e, ej, pm, mm)
    end do
    write(*,'(A)') ' B. Waves, 200 random wave vectors in each dimension from 3 to 7'
    write(*,'(A,ES9.2)') '   largest residual of the divergence of the field of a wave: ', worst
    call check('the divergence of the field of a wave is (k.k) e - (k.e) k', worst < 1.0d-9)
    call check('on the cone the fields of the waves form a space of dimension n - 2, in every case', bad == 0)
    call check('off the cone the only solutions are multiples of k, whose field is zero', badoff == 0)
  end subroutine
  subroutine static()
    integer :: d, i, t, badfree, badrival
    real(dp) :: x(6), xp(6), xm(6), h, dv, r, c, worst, exact
    h = 1.0d-4; worst = 0; badfree = 0; badrival = 0
    do d = 2, 6
      do t = 1, 200
        do i = 1, d
          x(i) = 0.5d0 + uni()
        end do
        r = sqrt(sum(x(1:d)**2))
        c = -6 + 8*uni()                                ! a random power of the distance
        dv = 0
        do i = 1, d
          xp = x; xm = x; xp(i) = x(i) + h; xm(i) = x(i) - h
          dv = dv + (xp(i)*sqrt(sum(xp(1:d)**2))**c - xm(i)*sqrt(sum(xm(1:d)**2))**c)/(2*h)
        end do
        exact = (d + c)*r**c
        worst = max(worst, abs(dv - exact)/r**c)
        ! the power c = -d, and the rival: the inverse square, c = -3, in every dimension
        dv = 0
        do i = 1, d
          xp = x; xm = x; xp(i) = x(i) + h; xm(i) = x(i) - h
          dv = dv + (xp(i)*sqrt(sum(xp(1:d)**2))**(-d) - xm(i)*sqrt(sum(xm(1:d)**2))**(-d))/(2*h)
        end do
        if (abs(dv)*r**d > 1.0d-5) badfree = badfree + 1
        dv = 0
        do i = 1, d
          xp = x; xm = x; xp(i) = x(i) + h; xm(i) = x(i) - h
          dv = dv + (xp(i)*sqrt(sum(xp(1:d)**2))**(-3) - xm(i)*sqrt(sum(xm(1:d)**2))**(-3))/(2*h)
        end do
        if ((abs(dv)*r**3 > 1.0d-5) .neqv. (d /= 3)) badrival = badrival + 1
      end do
    end do
    write(*,'(A)') ' C. The static half, 200 random points in each dimension of space from 2 to 6'
    write(*,'(A,ES9.2)') '   largest relative residual of the divergence of x r^c against (d + c) r^c: ', worst
    call check('the divergence of the radial field x r^c is (d + c) r^c', worst < 1.0d-5)
    call check('the power c = -d is free of sources in every dimension', badfree == 0)
    call check('rival, the inverse square in every dimension: free of sources in three and in no other', badrival == 0)
  end subroutine
  subroutine counts()
    integer :: n, bad
    bad = 0
    do n = 2, 60
      if ((2*(n - 1) == (n - 1)*(n - 2)) .neqv. (n == 4)) bad = bad + 1
      if ((2*(n - 2) == n*(n - 3)) .neqv. (n == 4)) bad = bad + 1
    end do
    write(*,'(A)') ' D. The classical counts, dimensions 2 to 60'
    call check('electric and magnetic parts, and the waves of light and of gravity, are equal in number in four only', bad == 0)
  end subroutine
  subroutine measured()
    real(dp), parameter :: h = 6.62607015d-34, kb = 1.380649d-23, c = 2.99792458d8
    real(dp) :: sb2, sb3, q, dq, sm, ds
    write(*,'(A)') ' E. Against published measurements'
    q = 2.7d-16; dq = 3.1d-16
    write(*,'(A,ES8.1,A,ES8.1,A,F5.2,A)') '   deviation of the exponent of the static law from two: measured ', q, ' +- ', dq, &
         ', forced 0 at ', abs(q)/dq, ' uncertainties'
    call check('the inverse square: forced deviation 0 within two uncertainties (Williams, Faller and Hill 1971)', &
               abs(0 - q) < 2*dq)
    sb2 = 2*pi**5*kb**4/(15*h**3*c*c); sb3 = 1.5d0*sb2; sm = 5.66967d-8; ds = 0.00076d-8
    write(*,'(A,ES12.5,A,ES12.5,A,F7.5,A,F7.5,A)') '   constant of thermal radiation: two waves ', sb2, ', three ', sb3, &
         ', measured (', sm*1.0d8, ' +- ', ds*1.0d8, ')e-8'
    write(*,'(A,F5.2,A,F8.1,A)') '   two waves at ', abs(sb2 - sm)/ds, ' uncertainties, three at ', &
         abs(sb3 - sm)/ds, ' uncertainties'
    call check('two waves give the measured constant of thermal radiation within two uncertainties (Quinn and Martin 1985)', &
               abs(sb2 - sm) < 2*ds)
    call check('rival, three waves in equilibrium: excluded by more than five uncertainties', abs(sb3 - sm) > 5*ds)
    write(*,'(A)') '   speed of gravity less speed of light, over the speed of light: between -3e-15 and 7e-16; forced 0'
    call check('one speed for light and gravity: forced difference 0 inside the measured interval (Abbott et al. 2017)', &
               -3.0d-15 < 0.0d0 .and. 0.0d0 < 7.0d-16)
    write(*,'(A)') '   reading, not a check: forced mass of the photon 0; measured below 1e-18 eV (Ryutov 2007)'
    write(*,'(A)') '   reading, not a check: forced decay of the electron none; lifetime above 6.6e28 years (Borexino 2015)'
  end subroutine
end program
```

## Appendix C · Run of Appendix B

```text
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
 BATTERY-JSON: {"checks":14,"failures":0}
```

## Appendix D · Kernel lines of Appendix A

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

```text
'SPHYS.Light.F_antisymm' depends on axioms: [propext, Quot.sound]
'SPHYS.Light.homogeneous' depends on axioms: [propext, Quot.sound]
'SPHYS.Light.gauge_keeps_the_field' depends on axioms: [propext, Quot.sound]
'SPHYS.Light.box_d' depends on axioms: [propext, Quot.sound]
'SPHYS.Light.box_add' depends on axioms: [propext, Quot.sound]
'SPHYS.Light.box_smul' depends on axioms: [propext, Quot.sound]
'SPHYS.Light.source_eq' depends on axioms: [propext, Quot.sound]
'SPHYS.Light.law_one' depends on axioms: [propext, Quot.sound]
'SPHYS.Light.divergence_of_the_law' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.conservation_identity' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.the_source_is_conserved' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.the_law_under_a_gauge_turn' depends on axioms: [propext, Quot.sound]
'SPHYS.Light.gauge_invariance_is_a_consequence' depends on axioms: [propext, Quot.sound]
'SPHYS.Light.timeArena' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.probe_divergence' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.probe_wave' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.conservation_in_four_dimensions_forces_the_law' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.plane_wave' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.off_the_cone_is_pure_gauge' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.on_the_cone_the_wave_is_transverse' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.kw_null' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.dot_kw' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.lift_transverse' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.every_wave_is_a_transverse_one' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.polMap_injective' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.waves_are_the_range' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.the_count_of_waves' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.two_helicities_and_no_third' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.static_law' depends on axioms: [propext, Quot.sound]
'SPHYS.Light.radial_divergence' depends on axioms: [propext, Quot.sound]
'SPHYS.Light.the_field_falls' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.only_one_power_is_free_of_sources' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.inverse_square_in_three' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.maxwell_forced' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.the_forced_law_is_maxwell' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.gauge_forced' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.maxwellPremises' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Light.electric_and_magnetic_are_equal_in_number_exactly_in_four' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.Light.light_and_gravity_have_equal_waves_exactly_in_four' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.Light.forced_law_is_a_source' depends on axioms: [propext, Quot.sound]
'SPHYS.Light.static_field' depends on axioms: [propext, Quot.sound]
'SPHYS.Light.static_wave_is_the_sum_over_space' depends on axioms: [propext, Classical.choice, Quot.sound]
```
