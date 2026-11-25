# The Fine-Structure Constant as a New Mathematical Theorem

## Why No Formula Returns 137: One Coupling, Universal and Positive, Whose Value the Law Cannot Fix

**Mohammad F. Islam PhD** · 25 November 2026

## Abstract

This paper proves, in Lean 4 with Mathlib, that the forced law of light leaves the value of its coupling open, and proves what it does fix. The law is the one of the companion paper on light: in a commutative ring with derivatives that commute, the linear law of second order whose source is conserved is Maxwell's, with one constant $a$ on the wave operator left free. Here that forcing is compiled again, and four things are added. First, every source is admitted: the law is additive, the law of a multiple of a potential is that multiple of its law, and multiplying the constants of the law by a number that is not zero leaves its solutions without sources the same. Second, the law carries no length: a change of the unit of length multiplies every derivative by one factor, and the forced law is then the square of that factor times itself, while a law with a constant on the potential, a mass, is not. Third, a verdict that gives a number and each of its positive multiples one answer gives every positive number the same answer. Fourth, a force between two charges that is multiplied by a number when either charge is, is one number times the product of the charges: there is one coupling, common to every pair, and with it positive like charges repel and unlike attract, whatever its value. The premises are then printed as one structure: conservation, a force linear in each charge, and repulsion of like charges, with no value given. The main theorem states that for every positive number the structure has a member whose coupling is that number, so there is no number that the coupling equals in every member, and the laws of two members with different couplings are solved without sources by the same potentials. A Fortran twin computes the flux of a point source through two hundred spheres set off their centre, executes the scaling statements on twenty thousand random waves, and sets two published formulas against the measured value $1/\alpha = 137.035999177(21)$: the integer 137 stands 1.7 million uncertainties away and the formula of Wyler 3965. The theorem is about the premises printed here. It does not say that no law fixes the constant. Part II states the reading from which the paper takes its place in the series, at premise grade and apart from the machine-checked claims.

## 1. The Theorem and What It Rests On

### 1.1 The statement

The law of the field, in the notation of the companion paper [11], is

$$J_\nu = a\,\Box A_\nu + b\,\partial_\nu(\partial\cdot A) + m\,A_\nu,$$

and the force between two charges $x$ and $y$ is a number $f(x, y)$.

**Theorem (`maxwell_forced`).** On the premises below, $b = -a$ and $m = 0$.

**Theorem (`the_forced_law_carries_no_length`, `a_mass_carries_a_length`).** After a change of the unit of length by a factor $l$, the law with $b = -a$ and $m = 0$ is $l^2$ times the law before. With a constant $m$, the law after the change differs from $l^2$ times the law before by $m\,(1 - l^2)\,A_\nu$.

**Theorem (`one_coupling_forced`).** On the premises below, $f(x, y) = f(1, 1)\,x\,y$; the force is positive when $x\,y$ is positive and negative when $x\,y$ is negative; and $a$ is positive.

**Theorem (`every_positive_coupling_is_a_member`, `the_premises_fix_no_value`).** For every positive rational number $\alpha$ there is a member of the premises with $f(1, 1) = \alpha$. There is no number that $f(1, 1)$ equals in every member.

**Theorem (`the_form_does_not_tell_two_couplings_apart`).** For two members of the premises, in every arena, a potential solves the law of the first without sources exactly when it solves the law of the second.

The constant was introduced by Sommerfeld [2]. The premises are met: `couplingPremises` constructs a term of the structure for every positive rational number.

### 1.2 The premises, printed

The physical premises of the paper are the fields of this structure of the Lean file, and there are no others. What is cited is in the tables of Section 1.3.

```lean
structure Premises where
  a : ℚ
  b : ℚ
  m : ℚ
  conserved : ∀ (R : Type) [CommRing R] [Algebra ℚ R] (S : Arena ℚ (Fin 4) R) (A : Fin 4 → R),
    ∑ ν, eta4 ν • S.d ν (law S eta4 a b m A ν) = 0
  force : ℚ → ℚ → ℚ
  left : ∀ c x y, force (c * x) y = c * force x y
  right : ∀ c x y, force x (c * y) = c * force x y
  repel : 0 < force 1 1
  tied : force 1 1 * a = 1
```

It carries four premises. The first is the field `conserved`, the premise of the companion paper: the source of the law has no divergence, whatever the potential, in every arena of four directions with one time. The second is the fields `left` and `right`: the force between two charges is multiplied by a number when either charge is. The third is the field `repel`: two unit charges repel. The fourth is the field `tied`: the force between two unit charges is the inverse of the constant on the wave operator, which is a choice of units that sets the constant of the sphere to one. No field of `Premises` states a value of the coupling, a relation that fixes one, or the conclusion of any theorem. The constants are rational numbers. Section 9 states where the premises come from.

### 1.3 What is proved, what is cited, what is assumed

| Statement | Standing | Where |
|---|---|---|
| The divergence of the law, and the forcing of $b = -a$ and $m = 0$ by conservation | Proved; compiled again from [11] | Appendix A, Parts I to III |
| The law is additive; the law of a multiple is the multiple of the law; every multiple of a solution is a solution | Proved, in every arena | Part II-b |
| Multiplying the constants by a number that is not zero keeps the solutions without sources | Proved, over a field | Part IV |
| A change of the unit of length: the forced law is the square of the factor times itself; a law with a mass is not | Proved | Part V |
| A verdict blind to positive multiples gives every positive number one answer | Proved, over every ordered field | Part VI |

The table continues with the coupling and the premises.

| Statement | Standing | Where |
|---|---|---|
| A force multiplied by a number when either charge is, is one number times the product of the charges | Proved, over every field | Part VII |
| With that number positive, the force has the sign of the product of the charges; the coupling of a charge with itself is positive | Proved, over every ordered field | Part VII |
| On the premises: Maxwell's law, one positive coupling, a positive constant on the wave operator | Proved | Part VIII |
| Every positive rational number is the coupling of a member; no number is the coupling of every member | Proved | Part VIII |
| Two members have laws with the same solutions without sources | Proved | Part VIII |

What is not machine-checked is in the third table.

| Statement | Standing | Where |
|---|---|---|
| Charge is conserved whatever the field does | Premise, as in [11] | Sections 3, 9 |
| The force on a charge is proportional to that charge, and to the charge that is its source | Premise; the second half follows the linearity of Section 3 with the classical law of force | Sections 5, 9 |
| Like charges repel | Premise; measured since [1] | Section 5 |
| The force between two unit charges is the inverse of the weight of the law | Premise, the field `tied`: the static solution of the law with the classical law of force, in units that set the constant of the sphere to one; not formalised | Sections 1.2, 2 |
| The coupling of the unit of charge with itself, in units of the quantum of action and the speed of light, is the fine-structure constant | Definition of the constant [2], entered | Section 6 |
| The coupling read at short distance differs from the coupling read at long distance | Cited: [6] | Section 7 |
| The formulas and measured values of the twin | Entered from the literature [3, 4, 5, 7]; numerical, not machine-checked | Section 8 |

The paper claims as machine-checked the rows marked proved and no others. A row marked cited is a result with a published account that this work has not machine-checked. A row marked entered is a definition, a formula or a measured value used in reading the theorems or by the numerical twin; no theorem rests on it. Part II, the reading, is outside these tables: it is premise-grade and is labelled so where it begins.

## 2. The Law and Its Arena

The setting is that of the companion paper on light [11]: an arena is a commutative ring of fields over a ring of constants, with one linear map for each direction, the maps commuting and obeying the rule of the product. It is formalised as the structure `Arena`, in the kernel of Lean 4 [9] on the library Mathlib [8]. The definitions `F`, `box`, `div`, `source` and `law` are the field, the wave operator, the divergence, the divergence of the field, and the law of Section 1.1. The file compiles the forcing of that paper again, so that it imports nothing but Mathlib and can be checked alone. As there, the text calls $J_\nu$ the source, and the file gives the name `source` to the divergence of the field.

Two terms are fixed here. The weight of a law is its constant $a$ on the wave operator. The coupling is the force between two unit charges, $f(1, 1)$. The field `tied` makes each the inverse of the other.

## 3. Every Source Is Admitted

**The forcing, again (`divergence_of_the_law`, `conservation_in_four_dimensions_forces_the_law`).** The divergence of the law is $(a + b)\,\Box(\partial\cdot A) + m\,(\partial\cdot A)$, and conservation for every potential in every arena of four directions forces $b = -a$ and $m = 0$. These are the theorems of [11].

**The law is linear (`law_add`, `law_smul_potential`).** The law of a sum of two potentials is the sum of their laws, and the law of $c$ times a potential is $c$ times its law.

**Every multiple (`every_multiple_of_a_solution_is_a_solution`).** If a potential solves the law with a source $J$, then $c$ times the potential solves it with the source $c\,J$. No size of the source is preferred: with any solution come all its multiples.

**The weight is not seen (`law_smul_weights`, `the_solutions_do_not_see_the_weight`).** Multiplying the three constants by $c$ multiplies the law by $c$. For $c$ not zero, the potentials that solve the law without sources are the same before and after.

## 4. No Scale of Length

**A change of the unit of length (`Arena.scale`, `law_scale`).** Multiplying every derivative by one constant $l$ gives an arena again. In it the two terms of second order of the law are multiplied by $l^2$, and the term on the potential itself is not.

**The forced law carries no length (`the_forced_law_carries_no_length`).** With $b = -a$ and $m = 0$, the law after the change is $l^2$ times the law before. Without sources it is the same law: there is no length in it against which a size could be read.

**A mass carries one (`a_mass_carries_a_length`).** With a constant $m$ on the potential, the law after the change differs from $l^2$ times the law before by $m\,(1 - l^2)\,A_\nu$. A law that could tell a solution from its multiples through a length would need such a term, and conservation forbids it.

## 5. What the Form Does Fix

**One coupling (`one_coupling`).** Let the force between two charges be multiplied by $c$ when either charge is. Then $f(x, y) = f(1, 1)\,x\,y$. There is one number, and it is common to every pair of charges.

**Its sign (`like_repel_and_unlike_attract`).** With $f(1, 1)$ positive, the force is positive when $x\,y$ is positive and negative when $x\,y$ is negative: like charges repel and unlike attract, for every value of the coupling.

**A charge with itself (`the_coupling_of_a_charge_with_itself`).** $f(e, e) = f(1, 1)\,e^2$, positive for every charge that is not zero. The coupling of the unit of charge is positive as a square is.

**On the premises (`one_coupling_forced`).** All three hold, and the weight $a$ is positive. That the force is proportional to each charge is the premise. Its first half is the classical law of force on a charge; its second follows the linearity of Section 3, since the field of a multiple of a source is that multiple of the field. The law of Coulomb [1] is this with the inverse square of [11].

## 6. The Premises Fix No Value

**A verdict blind to scale (`no_scale_blind_verdict_returns_a_value`).** Let a verdict, a function of a positive number with values of any kind, give a number and each of its positive multiples one answer. Then it gives every positive number the same answer. It cannot single one out.

**Every positive coupling (`couplingPremises`, `every_positive_coupling_is_a_member`).** For every positive rational number $\alpha$ the file constructs a member of the premises: the law with weight $1/\alpha$, and the force $\alpha\,x\,y$. Conservation holds for it by the identity of [11].

**No value (`the_premises_fix_no_value`).** So there is no number that the coupling equals in every member. Anything proved from the premises holds in all members, and a value of the coupling does not.

**The form does not tell them apart (`the_form_does_not_tell_two_couplings_apart`).** For any two members, in every arena, the potentials that solve the law without sources are the same. A quantity read from the solutions of the law is the same for a coupling of $1/137$ and for any other.

The coupling of the unit of charge with itself, in units of the quantum of action and the speed of light, is the fine-structure constant, $\alpha$ [2]. That identification is its definition and is entered. With it, the theorem says that the premises of this paper return no value of $\alpha$.

## 7. What the Theorem Does Not Say

It does not say that the constant cannot be explained. It says that conservation, a force linear in each charge, and repulsion do not explain it, and that no verdict blind to scale can. A law that fixed the constant would have to tell a solution from its multiples, and by Section 4 such a law carries a length or its like. The quantum theory has such scales, the masses of the charged particles, and through them the coupling read at short distance differs from the coupling read at long distance [6]. That shift is computed from the masses and the long-range value. It moves the question to the masses, which the companion paper on matter leaves free as well [12].

The theorem is also about rational numbers, since the constants of the structure are rational. Every positive rational is the coupling of a member; the paper does not construct members for the other real numbers, and needs none to conclude that no value is fixed.

## 8. The Numerical Twin

The twin of Appendix B does three things the kernel does not. It computes the flux of a point source by quadrature, it executes the scaling statements on waves, and it sets two published formulas and the forced exponent against measurement.

**The flux.** For 200 spheres about a source off their centre, with the inverse square, the flux through every sphere that holds the source is the source to one part in $10^{9}$, and through every sphere that does not it is zero. With the power 2.1 the flux through radius two is 0.93303 of the flux through radius one. The flux of a rescaled source is conserved, two fluxes stand in the ratio of their sources, and stretching every length by one factor leaves the flux of the inverse square unchanged and that of the power 2.1 changed.

**Waves.** On 20000 random waves, multiplying the weight by a number multiplies the law by it; the forced law after a change of the unit of length is the square of the factor times itself; and a law with a mass term changes by $m\,(1 - l^2)$ times the potential.

**The measurements.** The measured value is $1/\alpha = 137.035999177(21)$ [7].

| Proposed or forced | Value | Measured | Distance |
|---|---|---|---|
| Eddington: an integer [3] | 137 | 137.035999177(21) | $1.714\times10^{6}$ uncertainties |
| Wyler: $\alpha = \dfrac{9}{8\pi^{4}}\left(\dfrac{\pi^{5}}{2^{4}\,5!}\right)^{1/4}$ [4] | 137.036082448 | 137.035999177(21) | 3965.3 uncertainties |
| The exponent of the static law | 2 | $2 + (2.7 \pm 3.1)\times10^{-16}$ [5] | within one uncertainty |

Fourteen checks pass and none fails. A formula is called excluded when it stands more than five uncertainties from the measured value, and both are. Three limits are stated. The twin tests two formulas and not every formula. Its test of the exponent compares the forced value two with a measured bound. And every row is a retrodiction: each measurement, and each formula, stood before this work.

## 9. Discussion: The Reading

The derivation above uses only algebra. This section states the reading from which the premises come, and marks what in it is theorem and what is premise.

**Why these premises.** Conservation is the premise of the companion paper [11], read there from the statement that nothing escapes the record [10]. That the force on a charge is proportional to the charge is what it means for charge to be the measure of what the field acts on. That like charges repel is measured. None of the three names a number, and that is the point: the reading holds that the form of a law is forced and its magnitude is read.

**Why no formula.** A formula for the constant built from the form of the law alone would be a statement proved from these premises, or a verdict on the solutions of the law. Section 6 closes both roads: the premises have a member for every positive value, and the solutions do not tell two members apart. A formula of integers and $\pi$ can then agree with the measured value only by coincidence, and a coincidence ends when the measurement tightens. Two have ended, in Section 8.

**What the paper does not claim.** It does not claim that the constant has no explanation, or that no theory fixes it. It does not derive the running of the coupling or any mass. It does not claim that the two formulas of Section 8 were not already excluded. It claims that the premises printed here fix no value, that they fix one coupling, positive and common to every pair, and that each statement of Section 1.3 marked proved compiles. No theorem of Sections 2 to 8 depends on Part II.

## 10. Predictions, Falsifiers, and What Stands

The paper recovers the law of Coulomb with its one coupling. It predicts no measurement that the law does not, and it derives no constant: it proves that its premises cannot. Its commitments are stated here as commitments: three that the paper says will stand at any future precision, two proposals it says will fail, and the three observations that would refute it.

### 10.1 Three predictions that will stand

1. **The static law at long range carries no length.** `the_forced_law_carries_no_length` gives it, with `maxwell_forced`. The measured deviation of the exponent from two is $(2.7 \pm 3.1)\times10^{-16}$ [5]. The prediction is that it stays at zero.
2. **One coupling for every pair of charges.** `one_coupling_forced` gives it. The prediction is that no pair of charges is found whose force at long range is not the common number times the product of the charges.
3. **The value is read.** `the_premises_fix_no_value` gives it. The prediction is that the measured value of $\alpha$ continues to be an input of the law of light and not an output of its form.

### 10.2 Two proposals that will fail

1. **A formula for the constant from the form of the law of light alone.** `the_form_does_not_tell_two_couplings_apart` forbids it. The integer of Eddington and the formula of Wyler stand 1.7 million and 3965 uncertainties from the measured value. The paper predicts that every such formula, if it agrees today, fails when the measurement tightens.
2. **A coupling of its own for some pair of charges.** `one_coupling` leaves one. The paper predicts that every such proposal either gives up the proportion of the force to each charge or names a second kind of charge.

### 10.3 The three falsifiers

Each is a forbidden observation. No observation breaks a theorem; each refutes a premise, and each names the theorem that carries the consequence. The threshold in each case is five of the experiment's printed uncertainties.

1. **A static law of charge at long range whose exponent is not two.** It refutes the field `conserved`, through `maxwell_forced` and `a_mass_carries_a_length`.
2. **A force between two charges at rest that is not proportional to each.** It refutes the field `left` or the field `right`, through `one_coupling_forced`.
3. **Two like charges that attract.** It refutes the field `repel`.

Apart from them stands the formal claim, which no observation touches and one compilation settles: every theorem named in this text prints its axioms in Appendix D, and a line that names an axiom other than `propext`, `Classical.choice` and `Quot.sound`, or a file that fails to compile under Lean 4.19.0 and Mathlib 4.19.0, refutes the claim that the statements are proved.

### 10.4 What kind of result this is

It is not a new physics, and it is not a value. It is a proof that a set of premises does not determine a number, given in the way such proofs are given: by a member for every value. The premises are one structure, the members are constructed in the file, and a reader who doubts a step can name the line.

The statement that the premises fix no value is checked by the Lean kernel. No experiment and no later revision of physics alters it. Experiment remains free to test whether nature satisfies the premises, and a larger theory remains free to add a premise that fixes the number. What the kernel certifies is the Lean statements; that the definitions of the file say what this text says they say is for the reader to check, and the structure `Premises` is printed for that purpose. What stands is the tables of Section 1.3.

## 11. Part II · The Reading

*This part is the reading from which the paper takes its place in the series. It is premise-grade. It is not among the machine-checked claims of Section 1.3, and no theorem of Sections 2 to 8 depends on it. The seat it names, and the statements it rests on, are those of Nothing Escapes, Least Erasure (Islam, 2026a), where they are proved in their own domain.*

### 11.1 Form Is Forced, Magnitude Is Read

The series reads physics on one seat: a reflection of the plane, the line it fixes, and a registration that keeps the height of a point and forgets its side. The verdicts of the seat are of one kind. They say whether a point is on the line, which side it is on, whether two points are partners. None of them changes when every length is multiplied by one positive number. That volume proves this as a theorem of scaling: a magnitude is invisible to every verdict of the seat.

The companion paper on light forces the form of the law from the statement that nothing escapes the record, read on charge as conservation (Islam, 2026c). This paper asks what that forcing leaves open, and the answer has the shape the seat predicts. The form is fixed: one law, one coupling, common to every pair of charges, positive. The magnitude is not: every positive value is the coupling of a member of the premises.

The reading is that this is not a gap to be closed by a cleverer formula. A number that no verdict of the form can see is a number that has to be read from the world, and 137.036 is such a number. The history of formulas for it is the history of coincidences that ended when the measurement tightened.

### 11.2 What the Reading Adds, and What It Does Not

The reading adds one claim to the theorems: that the constant is a magnitude in the sense of the seat, a quantity the form of the law does not see, and that this is why it is measured. The theorems prove the second half for the premises printed in Section 1.2. The first half is the reading.

It does not add a claim that nothing fixes the number. A larger theory with its own scales could relate the coupling to them, as the quantum theory relates the coupling at one distance to the coupling at another through the masses. The question would then pass to those scales. The companion paper on matter leaves the masses free as well (Islam, 2026e).

One falsifier belongs to the reading and stands beside the three of Section 10.3: a derivation of the measured value from the form of the law of light alone, with no measured input, that survives as the measurement tightens. The two published formulas tested in Section 8 did not.

## 12. Closure

That the law of light leaves its coupling open is no longer informal prose. From a commutative ring with derivatives that commute, and nothing more, Lean 4 with Mathlib compiles the forcing of the law by conservation, its linearity, the solutions that every multiple of the constants keeps, the law after a change of the unit of length, the absence of a length in the forced law and its presence in a law with a mass, the verdict blind to scale that gives every positive number one answer, the one coupling of a force proportional to each charge, and a member of the premises for every positive rational number. No axiom is declared. No proof is left open. No headline theorem closes by its own hypothesis or over a structure that carries its conclusion.

What the form fixes is recovered: one coupling, common to every pair of charges, positive, with like charges repelling and unlike attracting whatever its value. What it does not fix is proved not to be fixed: there is no number that the coupling equals in every member of the premises, and the laws of two members are solved without sources by the same potentials. The numerical twin computes the flux of a point source through two hundred spheres, executes the scaling statements on twenty thousand waves, and sets two published formulas against the measured value: the integer 137 stands 1.7 million uncertainties away and the formula of Wyler 3965.

Every boundary is in plain sight. That charge is conserved, that the force is proportional to each charge, and that like charges repel are fields of one printed structure. That the coupling of the unit of charge is the fine-structure constant is its definition, entered. That the coupling read at short distance differs from the coupling at long distance is cited. The theorem is about these premises: it does not say that no law fixes the constant, and the value itself is not derived, here or anywhere in the paper.

That structure is not an arbitrary postulate. The two statements the reading rests on, Existence and Least Erasure, are theorems in their own domain: each has its own compiled Lean file, with no axiom declared, listed in the Lean Library Reference. There they are proved. The Heat Bridge, which joins erasure to heat, is a theorem there as well; the bridge spoken of below is a different one, from that domain to physics. Here they are used, and the difference is stated. Between that domain and the algebra of a field lies a physical bridge: that nothing escapes the record, read on charge as conservation, and that charge is the measure of what the field acts on. This paper does not claim the bridge as a theorem. It writes the bridge down as `Premises`, so that the engine imports nothing outside Mathlib and can be checked alone, and so that a reader can see exactly which sentence carries the physics.

Two things are therefore separate, and the paper keeps them separate. Inside the kernel, that the premises fix one coupling and no value is a mathematical certainty. No experiment, no consensus and no later revision of physics alters it, and anyone can recheck it with one compilation. Outside the kernel stand three falsifiers. They test whether nature satisfies the premises, and so far nature does. What survives both is not opinion. It is a theorem, and a physics that has met every test of its premises.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file and the Fortran twin are written by a language model under the author's direct supervision. Every theorem named in the text of Sections 1 to 10 and 12 is in Appendix A under that name, and its kernel line is printed in Appendix D. Classical results that are cited and not formalised are named as such in Section 1.3 and wherever they are used. No constant of nature is derived anywhere in this paper; the numbers of the twin are computed by quadrature, from random data and from measured inputs, which Appendix B prints.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1. C. A. Coulomb, Mém. Acad. R. Sci. Paris (1785) 569.
2. A. Sommerfeld, Ann. Phys. 51 (1916) 1.
3. A. S. Eddington, Fundamental Theory, Cambridge University Press (1946).
4. A. Wyler, C. R. Acad. Sci. Paris A 269 (1969) 743.
5. E. R. Williams, J. E. Faller and H. A. Hill, Phys. Rev. Lett. 26 (1971) 721.
6. S. Navas et al. (Particle Data Group), Phys. Rev. D 110 (2024) 030001.
7. P. J. Mohr, D. B. Newell, B. N. Taylor and E. Tiesinga, Rev. Mod. Phys. 97 (2025) 025002.
8. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
9. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
10. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
11. M. F. Islam, Light as a New Mathematical Theorem, edition 2.0.0 (2026c).
12. M. F. Islam, Matter as a New Mathematical Theorem, edition 2.0.0 (2026e).

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its engine uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main, read at commit 38f6678.

13. Root Axiom and Existence: Publication Library/Philosophy/Metaphysics/Root Axiom/TOE_Zero.lean. Compiled alone in core Lean 4.19.0, exit 0.
14. RH master: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_44_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.
15. Existence, as carried in the RH master: line 6635.
16. Heat Bridge: RH master, Parts VII-c and VII-d.
17. Prime Freedom: RH master, Parts XIII and XIV.
18. Freedom Arrow: RH master, Part XV.
19. Least Erasure: protocols/RH One Bit/Nothing Escapes Three Plus One/Least_Erasure.lean. Compiled alone in core Lean 4.19.0, exit 0.
20. Second Law: Publication Library/Mathematics/Mathematical Physics/Second_Law_Theorem_v1_0_0_CC.pdf, with its Lean file printed inside.
21. P versus NP master: FINAL_BINDING/PNP Binding/PNP_Normal_Form_Paper_v1_14_0_CC.lean
22. ZFC seal: lean/ZFC_Block_Hardened_FINAL_v2_0_0_Hermetically_Sealed.lean
23. No Second Sovereign: Publication Library/Mathematics/Millennium Series/No_Second_Sovereign_v1_0_0_CC.lean
24. Future Proof Empirical Witness Seal: Publication Library/Mathematics/Millennium Series/Future_Proof_Empirical_Witness_Seal_v1_0_0_CC.lean

## Appendix A · SPHYS_Coupling_Magnitude_CC.lean

Lean 4.19.0 with Mathlib 4.19.0. 39 theorems, no axiom declared, no `sorry`, exit 0 with no warning. The kernel lines are Appendix D.

```lean
/-
SPHYS_Coupling_Magnitude_CC.lean · what the forced law of light leaves open: the value of its coupling, on real algebra
RATIONALE. The engine of edition 1.0.0 proved its statements over small structures of integers. This file replaces
  it. The law is the law of the companion paper on light, in an arena with derivatives; a change of the unit of
  length is a rescaling of the derivatives; a verdict is any function of a positive number; and the statement that
  the premises fix no value is proved by exhibiting a member of the premises for every positive value.
DESIGN. Parts, in order.
    Parts I to III  The field, the law and the forcing, compiled again from the companion file so that this file
              stands alone: `divergence_of_the_law`, `conservation_in_four_dimensions_forces_the_law`.
    Part II-b Every source is admitted. `law_add`, `law_smul_potential`, `law_smul_weights`,
              `every_multiple_of_a_solution_is_a_solution`.
    Part IV   The weight. `the_solutions_do_not_see_the_weight`.
    Part V    No scale of length. `Arena.scale`, `law_scale`, `the_forced_law_carries_no_length`,
              `a_mass_carries_a_length`.
    Part VI   Verdicts. `no_scale_blind_verdict_returns_a_value`.
    Part VII  One coupling. `one_coupling`, `like_repel_and_unlike_attract`, `the_coupling_of_a_charge_with_itself`.
    Part VIII `Premises`; `maxwell_forced`; `one_coupling_forced`; `every_positive_coupling_is_a_member`;
              `the_premises_fix_no_value`.
WHAT IS NOT PROVED HERE (read before citing).
    (a) That charge is conserved, that the force on a charge is linear in that charge, and that like charges
        repel. They are fields of `Premises`.
    (b) That no law at all fixes the coupling. The theorem is about the premises printed here.
    (c) The value of the coupling. It is measured.
RISK. The premises are over the rational numbers. No magnitude is derived.
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
import Mathlib.Tactic.Positivity
import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Algebra.Order.AbsoluteValue.Basic

namespace SPHYS.Coupling
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

/-! ## Part II-b. Every source is admitted -/

theorem div_add (A B : ι → R) : div S η (fun ν => A ν + B ν) = div S η A + div S η B := by
  unfold div; simp only [map_add, smul_add, Finset.sum_add_distrib]

theorem div_smul (c : K) (A : ι → R) : div S η (fun ν => c • A ν) = c • div S η A := by
  unfold div; simp only [map_smul]; rw [Finset.smul_sum]
  exact Finset.sum_congr rfl fun μ _ => smul_comm _ _ _

/-- THE LAW IS ADDITIVE. The law of a sum of two potentials is the sum of their laws. -/
theorem law_add (a b m : K) (A B : ι → R) (ν : ι) :
    law S η a b m (fun ν => A ν + B ν) ν = law S η a b m A ν + law S η a b m B ν := by
  unfold law; rw [div_add, box_add, map_add]; module

/-- THE LAW OF A MULTIPLE. The law of c times a potential is c times its law. -/
theorem law_smul_potential (a b m c : K) (A : ι → R) (ν : ι) :
    law S η a b m (fun ν => c • A ν) ν = c • law S η a b m A ν := by
  unfold law; rw [div_smul, box_smul, map_smul]; module

/-- THE LAW WITH ITS CONSTANTS MULTIPLIED. Multiplying the three constants by c multiplies the law by c. -/
theorem law_smul_weights (a b m c : K) (A : ι → R) (ν : ι) :
    law S η (c * a) (c * b) (c * m) A ν = c • law S η a b m A ν := by
  unfold law; module

/-- EVERY MULTIPLE OF A SOLUTION IS A SOLUTION. If a potential solves the law with a source, c times the potential
solves it with c times the source. Every value of the source is admitted. -/
theorem every_multiple_of_a_solution_is_a_solution (a b m c : K) (A J : ι → R)
    (h : ∀ ν, law S η a b m A ν = J ν) (ν : ι) : law S η a b m (fun ν => c • A ν) ν = c • J ν := by
  rw [law_smul_potential, h]

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


/-! ## Part IV. The weight -/

section Weight
variable {K : Type*} [Field K] {ι : Type*} [Fintype ι] {R : Type*} [CommRing R] [Algebra K R]
variable (S : Arena K ι R) (η : ι → K)

/-- THE SOLUTIONS DO NOT SEE THE WEIGHT. For c not zero, a potential solves the law without sources exactly when it
solves the law with all three constants multiplied by c. -/
theorem the_solutions_do_not_see_the_weight (a b m c : K) (hc : c ≠ 0) (A : ι → R) (ν : ι) :
    law S η (c * a) (c * b) (c * m) A ν = 0 ↔ law S η a b m A ν = 0 := by
  rw [law_smul_weights]
  constructor
  · intro h
    have := congrArg (fun x => c⁻¹ • x) h
    simpa [smul_smul, inv_mul_cancel₀ hc] using this
  · intro h; rw [h, smul_zero]

end Weight

/-! ## Part V. No scale of length -/

section Scale
variable {K : Type*} [CommRing K] {ι : Type*} [Fintype ι] {R : Type*} [CommRing R] [Algebra K R]
variable (S : Arena K ι R) (η : ι → K)

/-- A CHANGE OF THE UNIT OF LENGTH. Every derivative is multiplied by one constant l. The result is an arena. -/
def Arena.scale (l : K) : Arena K ι R where
  d := fun μ => l • S.d μ
  comm := by
    intro μ ν x
    simp only [LinearMap.smul_apply, map_smul]
    rw [S.comm μ ν x]
  leibniz := by
    intro μ x y
    simp only [LinearMap.smul_apply, S.leibniz, smul_add, smul_mul_assoc, mul_smul_comm]

omit [Fintype ι] in
theorem scale_d (l : K) (μ : ι) (x : R) : (S.scale l).d μ x = l • S.d μ x := rfl

theorem box_scale (l : K) (x : R) : box (S.scale l) η x = (l * l) • box S η x := by
  unfold box
  simp only [scale_d, map_smul, smul_smul, Finset.smul_sum]
  refine Finset.sum_congr rfl fun μ _ => ?_
  congr 1; ring

theorem div_scale (l : K) (A : ι → R) : div (S.scale l) η A = l • div S η A := by
  unfold div
  simp only [scale_d, smul_smul, Finset.smul_sum]
  refine Finset.sum_congr rfl fun μ _ => ?_
  congr 1; ring

/-- THE LAW AFTER A CHANGE OF THE UNIT OF LENGTH. The two terms of second order are multiplied by the square of
l, and the term on the potential itself is not. -/
theorem law_scale (a b m l : K) (A : ι → R) (ν : ι) :
    law (S.scale l) η a b m A ν = (l * l) • (a • box S η (A ν) + b • S.d ν (div S η A)) + m • A ν := by
  unfold law
  rw [box_scale, div_scale, scale_d, map_smul]
  module

/-- THE FORCED LAW CARRIES NO LENGTH. With b = -a and m = 0 the law after a change of the unit of length is the
square of l times the law before. Without sources it is the same law. -/
theorem the_forced_law_carries_no_length (a l : K) (A : ι → R) (ν : ι) :
    law (S.scale l) η a (-a) 0 A ν = (l * l) • law S η a (-a) 0 A ν := by
  rw [law_scale]; unfold law; module

/-- A MASS CARRIES A LENGTH. With a constant m on the potential, the law after the change differs from the square
of l times the law before by m (1 - l l) times the potential. -/
theorem a_mass_carries_a_length (a b m l : K) (A : ι → R) (ν : ι) :
    law (S.scale l) η a b m A ν - (l * l) • law S η a b m A ν = (m * (1 - l * l)) • A ν := by
  rw [law_scale]; unfold law; module

end Scale

/-! ## Part VI. Verdicts -/

section Verdict
variable {K : Type*} [Field K] [LinearOrder K] [IsStrictOrderedRing K]

/-- NO SCALE-BLIND VERDICT RETURNS A VALUE. Let a verdict give a number and each of its positive multiples one
answer. Then it gives every positive number the same answer. -/
theorem no_scale_blind_verdict_returns_a_value {T : Type*} (V : K → T) (h : ∀ c x, 0 < c → V (c * x) = V x)
    (x y : K) (hx : 0 < x) (hy : 0 < y) : V x = V y := by
  have e : y / x * x = y := div_mul_cancel₀ y hx.ne'
  rw [← h (y / x) x (div_pos hy hx), e]

/-! ## Part VII. One coupling -/

omit [LinearOrder K] [IsStrictOrderedRing K] in
/-- ONE COUPLING. Let the force between two charges be multiplied by c when either charge is. Then it is one
number, the force between two unit charges, times the product of the charges. -/
theorem one_coupling (f : K → K → K) (h1 : ∀ c x y, f (c * x) y = c * f x y)
    (h2 : ∀ c x y, f x (c * y) = c * f x y) (x y : K) : f x y = f 1 1 * x * y := by
  have a := h1 x 1 y
  have b := h2 y 1 1
  rw [mul_one] at a b
  rw [a, b]; ring

/-- LIKE CHARGES REPEL AND UNLIKE ATTRACT, FOR EVERY VALUE OF THE COUPLING. With the force between two unit
charges positive, the force has the sign of the product of the charges. -/
theorem like_repel_and_unlike_attract (f : K → K → K) (h1 : ∀ c x y, f (c * x) y = c * f x y)
    (h2 : ∀ c x y, f x (c * y) = c * f x y) (hpos : 0 < f 1 1) (x y : K) :
    (0 < x * y → 0 < f x y) ∧ (x * y < 0 → f x y < 0) := by
  rw [one_coupling f h1 h2 x y, mul_assoc]
  exact ⟨fun h => mul_pos hpos h, fun h => mul_neg_of_pos_of_neg hpos h⟩

/-- THE COUPLING OF A CHARGE WITH ITSELF. It is the force between two unit charges times the square of the
charge, and it is positive for every charge that is not zero. -/
theorem the_coupling_of_a_charge_with_itself (f : K → K → K) (h1 : ∀ c x y, f (c * x) y = c * f x y)
    (h2 : ∀ c x y, f x (c * y) = c * f x y) (hpos : 0 < f 1 1) (e : K) (he : e ≠ 0) :
    f e e = f 1 1 * (e * e) ∧ 0 < f e e := by
  have k := one_coupling f h1 h2 e e
  rw [mul_assoc] at k
  exact ⟨k, by rw [k]; exact mul_pos hpos (mul_self_pos.mpr he)⟩

end Verdict

/-! ## Part VIII. The theorem -/

/-- The premises. The law of the field is linear of second order with three constants, and its source is
conserved, whatever the potential, in every arena of four directions with one time. The force between two charges
is multiplied by c when either charge is. Like charges repel. The force between two unit charges is the inverse
of the constant on the wave operator, in units that set the constant of the sphere to one. Nothing else is
assumed, and no value is given. -/
structure Premises where
  a : ℚ
  b : ℚ
  m : ℚ
  conserved : ∀ (R : Type) [CommRing R] [Algebra ℚ R] (S : Arena ℚ (Fin 4) R) (A : Fin 4 → R),
    ∑ ν, eta4 ν • S.d ν (law S eta4 a b m A ν) = 0
  force : ℚ → ℚ → ℚ
  left : ∀ c x y, force (c * x) y = c * force x y
  right : ∀ c x y, force x (c * y) = c * force x y
  repel : 0 < force 1 1
  tied : force 1 1 * a = 1

/-- MAXWELL, FORCED. On the premises b = -a and m = 0. -/
theorem maxwell_forced (P : Premises) : P.b = -P.a ∧ P.m = 0 :=
  conservation_in_four_dimensions_forces_the_law P.a P.b P.m P.conserved

/-- ONE COUPLING, FORCED. On the premises the force between two charges is one positive number times the product
of the charges; like charges repel and unlike attract; and the constant on the wave operator is positive. -/
theorem one_coupling_forced (P : Premises) (x y : ℚ) :
    P.force x y = P.force 1 1 * x * y ∧ (0 < x * y → 0 < P.force x y) ∧ (x * y < 0 → P.force x y < 0)
      ∧ 0 < P.a := by
  refine ⟨one_coupling P.force P.left P.right x y, (like_repel_and_unlike_attract P.force P.left P.right P.repel x y).1,
    (like_repel_and_unlike_attract P.force P.left P.right P.repel x y).2, ?_⟩
  have h := P.tied
  have hr := P.repel
  by_contra hc
  have : P.force 1 1 * P.a ≤ 0 := mul_nonpos_of_nonneg_of_nonpos hr.le (not_lt.mp hc)
  linarith

/-- EVERY POSITIVE COUPLING IS A MEMBER. For every positive number there is a member of the premises whose force
between two unit charges is that number. -/
def couplingPremises (α : ℚ) (hα : 0 < α) : Premises where
  a := α⁻¹
  b := -α⁻¹
  m := 0
  conserved := fun _ _ _ S A => conservation_identity S eta4 α⁻¹ A
  force := fun x y => α * x * y
  left := fun c x y => by ring
  right := fun c x y => by ring
  repel := by simpa using hα
  tied := by simp [hα.ne']

theorem every_positive_coupling_is_a_member (α : ℚ) (hα : 0 < α) : ∃ P : Premises, P.force 1 1 = α :=
  ⟨couplingPremises α hα, by simp [couplingPremises]⟩

/-- THE PREMISES FIX NO VALUE. There is no number that the force between two unit charges equals in every member
of the premises. -/
theorem the_premises_fix_no_value (α0 : ℚ) : ¬ ∀ P : Premises, P.force 1 1 = α0 := by
  intro h
  obtain ⟨P, hP⟩ := every_positive_coupling_is_a_member (|α0| + 1) (by positivity)
  have e := h P
  rw [hP] at e
  have := le_abs_self α0
  linarith

/-- NO FUNCTION OF THE FORM RETURNS THE VALUE. Two members with different couplings have laws that the same
potentials solve without sources: the solutions of the law do not tell the two apart. -/
theorem the_form_does_not_tell_two_couplings_apart (P Q : Premises) {R : Type} [CommRing R] [Algebra ℚ R]
    (S : Arena ℚ (Fin 4) R) (A : Fin 4 → R) (ν : Fin 4) :
    law S eta4 P.a P.b P.m A ν = 0 ↔ law S eta4 Q.a Q.b Q.m A ν = 0 := by
  obtain ⟨hPb, hPm⟩ := maxwell_forced P
  obtain ⟨hQb, hQm⟩ := maxwell_forced Q
  have hPa : P.a ≠ 0 := (one_coupling_forced P 0 0).2.2.2.ne'
  have hQa : Q.a ≠ 0 := (one_coupling_forced Q 0 0).2.2.2.ne'
  have eP : law S eta4 P.a P.b P.m A ν = 0 ↔ law S eta4 1 (-1) 0 A ν = 0 := by
    have := the_solutions_do_not_see_the_weight S eta4 1 (-1) 0 P.a hPa A ν
    rw [hPb, hPm]; simpa using this
  have eQ : law S eta4 Q.a Q.b Q.m A ν = 0 ↔ law S eta4 1 (-1) 0 A ν = 0 := by
    have := the_solutions_do_not_see_the_weight S eta4 1 (-1) 0 Q.a hQa A ν
    rw [hQb, hQm]; simpa using this
  rw [eP, eQ]

end SPHYS.Coupling

#print axioms SPHYS.Coupling.F_antisymm
#print axioms SPHYS.Coupling.homogeneous
#print axioms SPHYS.Coupling.gauge_keeps_the_field
#print axioms SPHYS.Coupling.box_d
#print axioms SPHYS.Coupling.box_add
#print axioms SPHYS.Coupling.box_smul
#print axioms SPHYS.Coupling.source_eq
#print axioms SPHYS.Coupling.law_one
#print axioms SPHYS.Coupling.forced_law_is_a_source
#print axioms SPHYS.Coupling.divergence_of_the_law
#print axioms SPHYS.Coupling.conservation_identity
#print axioms SPHYS.Coupling.the_source_is_conserved
#print axioms SPHYS.Coupling.the_law_under_a_gauge_turn
#print axioms SPHYS.Coupling.gauge_invariance_is_a_consequence
#print axioms SPHYS.Coupling.div_add
#print axioms SPHYS.Coupling.div_smul
#print axioms SPHYS.Coupling.law_add
#print axioms SPHYS.Coupling.law_smul_potential
#print axioms SPHYS.Coupling.law_smul_weights
#print axioms SPHYS.Coupling.every_multiple_of_a_solution_is_a_solution
#print axioms SPHYS.Coupling.the_solutions_do_not_see_the_weight
#print axioms SPHYS.Coupling.Arena.scale
#print axioms SPHYS.Coupling.scale_d
#print axioms SPHYS.Coupling.box_scale
#print axioms SPHYS.Coupling.div_scale
#print axioms SPHYS.Coupling.law_scale
#print axioms SPHYS.Coupling.the_forced_law_carries_no_length
#print axioms SPHYS.Coupling.a_mass_carries_a_length
#print axioms SPHYS.Coupling.no_scale_blind_verdict_returns_a_value
#print axioms SPHYS.Coupling.one_coupling
#print axioms SPHYS.Coupling.like_repel_and_unlike_attract
#print axioms SPHYS.Coupling.the_coupling_of_a_charge_with_itself
#print axioms SPHYS.Coupling.probe_divergence
#print axioms SPHYS.Coupling.probe_wave
#print axioms SPHYS.Coupling.conservation_in_four_dimensions_forces_the_law
#print axioms SPHYS.Coupling.maxwell_forced
#print axioms SPHYS.Coupling.one_coupling_forced
#print axioms SPHYS.Coupling.couplingPremises
#print axioms SPHYS.Coupling.every_positive_coupling_is_a_member
#print axioms SPHYS.Coupling.the_premises_fix_no_value
#print axioms SPHYS.Coupling.the_form_does_not_tell_two_couplings_apart
```

## Appendix B · Coupling_Magnitude_Twin_CC.f90

Fourteen checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix C.

```fortran
! Coupling_Magnitude_Twin_CC.f90 · twin of SPHYS_Coupling_Magnitude_CC.lean
! RATIONALE. The engine proves that the forced law admits every source, carries no length, and has a member of its
!   premises for every positive coupling. This twin computes the flux of a point source through spheres by
!   quadrature (A to C), executes the scaling statements on waves (F), and sets three numbers against measurement
!   (D, E).
! DESIGN. Double precision, no library. The source sits at distance a from the centre of a sphere of radius R, on
!   its axis. With a strength falling as the power p of the distance, the flux through the sphere is
!     (q/2) R**2 * integral over theta of (R - a cos theta) sin theta / (R**2 + a**2 - 2 a R cos theta)**((p+1)/2),
!   computed by the midpoint rule on 200000 intervals. For p = 2 it is q when the source is inside and 0 when it
!   is outside, whatever R and a; for any other p it depends on R. A wave is a polarization on the profile
!   exp(k.x), whose derivative along a direction multiplies by the component of k; a change of the unit of
!   length multiplies k by one factor. A fixed linear congruential generator.
!   Measured inputs: the inverse fine-structure constant 137.035999177(21), CODATA 2022 (Mohr et al. 2025); the
!   bound on a deviation of the exponent of Coulomb's law from two, (2.7 +- 3.1)e-16 (Williams, Faller and Hill 1971).
!   Formulas tested in D: Eddington's integer 137, and Wyler's expression (1969),
!   alpha = (9 / (8 pi**4)) (pi**5 / (2**4 5!))**(1/4).
! RISK. D tests two formulas. It does not test every formula; that the premises fix no value is the engine's
!   theorem. Quadrature tolerance is 1e-6 of the source.
! NON-NEGOTIABLE. A formula is called excluded only when it stands more than five printed uncertainties away.
program coupling_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0)
  integer :: nfail, npass, i, d
  integer(8) :: seed
  logical :: ok, ok2
  real(dp) :: pi, aw, ainv, sig, dev, q, k, r, a, f1, f2, lam, worst
  nfail = 0; npass = 0; seed = 20260622_8; pi = 4.0_dp*atan(1.0_dp)

  ! A. the inverse square conserves the flux, and no other power does
  ok = .true.; ok2 = .true.; worst = 0.0_dp
  do i = 1, 200
    q = 1.0_dp + urand()*99.0_dp; r = 0.5_dp + urand()*9.5_dp; a = urand()*0.8_dp*r
    f1 = flux(q, r, a, 2.0_dp); worst = max(worst, abs(f1 - q)/q)
    if (abs(f1 - q) > 1.0e-6_dp*q) ok = .false.
    a = r*(1.3_dp + urand()*3.0_dp)                       ! the source outside the sphere
    if (abs(flux(q, r, a, 2.0_dp)) > 1.0e-6_dp*q) ok2 = .false.
  end do
  write(*,'(a,es9.2)') '  200 spheres about a source off their centre: largest departure of the flux from the source, ', worst
  call check('A1 with the inverse square, the flux through every sphere holding the source is the source', ok)
  call check('A2 and the flux through every sphere not holding it is zero', ok2)
  f1 = flux(1.0_dp, 1.0_dp, 0.0_dp, 2.1_dp); f2 = flux(1.0_dp, 2.0_dp, 0.0_dp, 2.1_dp)
  write(*,'(a,f8.5,a,f8.5)') '  with the power 2.1: flux through radius 1, ', f1, '; through radius 2, ', f2
  call check('A3 with the power 2.1 the flux through two spheres differs by more than one part in a hundred', &
             abs(f1 - f2) > 0.01_dp*f1)
  f1 = flux(1.0_dp, 1.0_dp, 0.0_dp, 1.9_dp); f2 = flux(1.0_dp, 2.0_dp, 0.0_dp, 1.9_dp)
  call check('A4 and with the power 1.9', abs(f1 - f2) > 0.01_dp*f1)

  ! B. every rescaling of the source is a solution, and two fluxes stand in the ratio of their sources
  ok = .true.; ok2 = .true.
  do i = 1, 200
    q = 1.0_dp + urand()*9.0_dp; k = -50.0_dp + urand()*100.0_dp; r = 0.5_dp + urand()*9.5_dp; a = urand()*0.8_dp*r
    f1 = flux(q, r, a, 2.0_dp); f2 = flux(k*q, 2.0_dp*r, 0.3_dp*r, 2.0_dp)   ! the rescaled source, another sphere
    if (abs(f2 - k*q) > 1.0e-6_dp*abs(k*q) + 1.0e-9_dp) ok = .false.
    if (abs(f2*q - f1*k*q) > 1.0e-6_dp*abs(k*q*q) + 1.0e-9_dp) ok2 = .false.
  end do
  call check('B1 the flux of a source rescaled by any number, positive or negative, is conserved', ok)
  call check('B2 two conserved fluxes stand in the ratio of their sources through any two spheres', ok2)

  ! C. the law has no scale of length: stretch the sphere and the offset by one factor and the flux is unchanged
  ok = .true.
  do i = 1, 200
    q = 1.0_dp + urand()*9.0_dp; r = 0.5_dp + urand()*9.5_dp; a = urand()*0.8_dp*r; lam = 0.01_dp + urand()*100.0_dp
    if (abs(flux(q, lam*r, lam*a, 2.0_dp) - flux(q, r, a, 2.0_dp)) > 1.0e-6_dp*q) ok = .false.
  end do
  call check('C1 with the inverse square, stretching every length by one factor leaves the flux unchanged', ok)
  f1 = flux(1.0_dp, 1.0_dp, 0.2_dp, 2.1_dp); f2 = flux(1.0_dp, 7.0_dp, 1.4_dp, 2.1_dp)
  call check('C2 with the power 2.1 it does not: that law carries a length', abs(f1 - f2) > 0.01_dp*f1)

  ! D. two formulas for the number, against the measurement
  ainv = 137.035999177_dp; sig = 0.000000021_dp
  write(*,'(a,f14.9,a,f11.9)') '  measured: 1/alpha = ', ainv, ' +- ', sig
  dev = (137.0_dp - ainv)/sig
  write(*,'(a,es10.3,a)') '  Eddington, 137 exactly: ', abs(dev), ' uncertainties from the measured value'
  call check('D1 the integer 137 stands more than five uncertainties from the measured value', abs(dev) > 5.0_dp)
  aw = (9.0_dp/(8.0_dp*pi**4))*(pi**5/(16.0_dp*120.0_dp))**0.25_dp
  dev = (1.0_dp/aw - ainv)/sig
  write(*,'(a,f14.9,a,f8.1,a)') '  Wyler: 1/alpha = ', 1.0_dp/aw, ', ', abs(dev), ' uncertainties from the measured value'
  call check('D2 the value of Wyler stands more than five uncertainties from the measured value', abs(dev) > 5.0_dp)

  ! E. the exponent of the law: the area of a sphere in d dimensions of space grows as the power d - 1 of its radius
  d = 3
  write(*,'(a,i0)') '  power of the radius by which the strength falls in three dimensions: ', d - 1
  call check('E  the forced exponent, two, lies within two uncertainties of the measured (2.7 +- 3.1)e-16 from two', &
             abs(real(d - 1 - 2, dp) - 2.7e-16_dp) < 2.0_dp*3.1e-16_dp)

  call waves()
  write(*,'(A,I0,A,I0,A)') ' BATTERY-JSON: {"checks":', npass + nfail, ',"failures":', nfail, '}'
contains
  real(dp) function flux(qq, rr, aa, p)
    real(dp), intent(in) :: qq, rr, aa, p
    integer, parameter :: n = 200000
    integer :: j
    real(dp) :: th, s2, acc
    acc = 0.0_dp
    do j = 1, n
      th = (real(j, dp) - 0.5_dp)*pi/real(n, dp)
      s2 = rr*rr + aa*aa - 2.0_dp*aa*rr*cos(th)
      acc = acc + (rr - aa*cos(th))*sin(th)/s2**(0.5_dp*(p + 1.0_dp))
    end do
    flux = 0.5_dp*qq*rr*rr*acc*pi/real(n, dp)
  end function
  subroutine waves()
    ! F. on waves: the law with constants (a, -a, 0), its multiples, and a change of the unit of length
    integer :: t, nu
    real(dp) :: kv(4), e(4), et(4), kk, ke, j1(4), j2(4), jl(4), aa, cc, ll, mm, w1, w2, w3
    et = [1.0_dp, -1.0_dp, -1.0_dp, -1.0_dp]; w1 = 0.0_dp; w2 = 0.0_dp; w3 = 0.0_dp
    do t = 1, 20000
      do nu = 1, 4
        kv(nu) = 2.0_dp*urand() - 1.0_dp; e(nu) = 2.0_dp*urand() - 1.0_dp
      end do
      aa = 0.2_dp + urand(); cc = 0.1_dp + 5.0_dp*urand(); ll = 0.2_dp + 3.0_dp*urand(); mm = 0.5_dp + urand()
      kk = sum(et*kv*kv); ke = sum(et*kv*e)
      j1 = aa*(kk*e - kv*ke)                              ! the forced law on the wave
      j2 = (cc*aa)*(kk*e - kv*ke)                         ! the same law with its weight multiplied by c
      w1 = max(w1, maxval(abs(j2 - cc*j1)))
      jl = aa*((ll*ll*kk)*e - (ll*kv)*(ll*ke))            ! after the change of the unit of length
      w2 = max(w2, maxval(abs(jl - ll*ll*j1)))
      ! with a constant m on the potential the same change leaves m (1 - l l) times the potential
      w3 = max(w3, maxval(abs((jl + mm*e) - ll*ll*(j1 + mm*e) - mm*(1.0_dp - ll*ll)*e)))
    end do
    write(*,'(a,es9.2,a,es9.2)') '  20000 random waves: largest residual, weight ', w1, ', length ', w2
    call check('F1 multiplying the weight by c multiplies the law by c: the solutions without sources are the same', &
               w1 < 1.0e-9_dp)
    call check('F2 the forced law after a change of the unit of length is the square of the factor times the law', &
               w2 < 1.0e-9_dp)
    write(*,'(a,es9.2)') '  rival, a law with a mass term m: largest residual of its change against m (1 - l l) A, ', w3
    call check('F3 with a mass term the law is not kept: it changes by m (1 - l l) times the potential', &
               w3 < 1.0e-9_dp)
  end subroutine
  real(dp) function urand()          ! uniform on [0, 1)
    seed = mod(seed*6364136223846793005_8 + 1442695040888963407_8, 9223372036854775807_8)
    if (seed < 0) seed = -seed
    urand = real(mod(seed/65536_8, 1000000_8), dp)/1.0e6_dp
  end function
  subroutine check(name, cond)
    character(*), intent(in) :: name
    logical, intent(in) :: cond
    if (cond) then
      write(*,'(a,a)') '  PASS  ', name; npass = npass + 1
    else
      write(*,'(a,a)') '  FAIL  ', name; nfail = nfail + 1
    end if
  end subroutine
end program coupling_twin
```

## Appendix C · Run of Appendix B

```text
  200 spheres about a source off their centre: largest departure of the flux from the source,  1.27E-10
  PASS  A1 with the inverse square, the flux through every sphere holding the source is the source
  PASS  A2 and the flux through every sphere not holding it is zero
  with the power 2.1: flux through radius 1,  1.00000; through radius 2,  0.93303
  PASS  A3 with the power 2.1 the flux through two spheres differs by more than one part in a hundred
  PASS  A4 and with the power 1.9
  PASS  B1 the flux of a source rescaled by any number, positive or negative, is conserved
  PASS  B2 two conserved fluxes stand in the ratio of their sources through any two spheres
  PASS  C1 with the inverse square, stretching every length by one factor leaves the flux unchanged
  PASS  C2 with the power 2.1 it does not: that law carries a length
  measured: 1/alpha =  137.035999177 +- 0.000000021
  Eddington, 137 exactly:  1.714E+06 uncertainties from the measured value
  PASS  D1 the integer 137 stands more than five uncertainties from the measured value
  Wyler: 1/alpha =  137.036082448,   3965.3 uncertainties from the measured value
  PASS  D2 the value of Wyler stands more than five uncertainties from the measured value
  power of the radius by which the strength falls in three dimensions: 2
  PASS  E  the forced exponent, two, lies within two uncertainties of the measured (2.7 +- 3.1)e-16 from two
  20000 random waves: largest residual, weight  1.78E-15, length  7.11E-15
  PASS  F1 multiplying the weight by c multiplies the law by c: the solutions without sources are the same
  PASS  F2 the forced law after a change of the unit of length is the square of the factor times the law
  rival, a law with a mass term m: largest residual of its change against m (1 - l l) A,  7.11E-15
  PASS  F3 with a mass term the law is not kept: it changes by m (1 - l l) times the potential
 BATTERY-JSON: {"checks":14,"failures":0}
```

## Appendix D · Kernel lines of Appendix A

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

```text
'SPHYS.Coupling.F_antisymm' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.homogeneous' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.gauge_keeps_the_field' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.box_d' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.box_add' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.box_smul' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.source_eq' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.law_one' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.forced_law_is_a_source' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.divergence_of_the_law' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Coupling.conservation_identity' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Coupling.the_source_is_conserved' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Coupling.the_law_under_a_gauge_turn' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.gauge_invariance_is_a_consequence' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.div_add' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.div_smul' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.law_add' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.law_smul_potential' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.law_smul_weights' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.every_multiple_of_a_solution_is_a_solution' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.the_solutions_do_not_see_the_weight' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Coupling.Arena.scale' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.scale_d' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.box_scale' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.div_scale' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.law_scale' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.the_forced_law_carries_no_length' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.a_mass_carries_a_length' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.no_scale_blind_verdict_returns_a_value' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Coupling.one_coupling' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Coupling.like_repel_and_unlike_attract' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Coupling.the_coupling_of_a_charge_with_itself' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Coupling.probe_divergence' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Coupling.probe_wave' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Coupling.conservation_in_four_dimensions_forces_the_law' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.Coupling.maxwell_forced' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Coupling.one_coupling_forced' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Coupling.couplingPremises' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Coupling.every_positive_coupling_is_a_member' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Coupling.the_premises_fix_no_value' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Coupling.the_form_does_not_tell_two_couplings_apart' depends on axioms: [propext, Classical.choice, Quot.sound]
```
