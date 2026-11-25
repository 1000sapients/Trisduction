# The Fine-Structure Constant as a New Mathematical Theorem

## Why No Formula Returns 137: One Coupling, Universal and Positive, Whose Value the Law Cannot Fix

**Mohammad F. Islam PhD** · 25 November 2026

*Blog edition of the master, edition 2.0.0 of 25 November 2026. It renders the whole text. The printed files of the appendices stand in the master and in the Journal edition, and are listed at the end.*

## Abstract

This paper proves, in Lean 4 with Mathlib, that the forced law of light leaves the value of its coupling open, and proves what it does fix. The law is the one of the companion paper on light: in a commutative ring with derivatives that commute, the linear law of second order whose source is conserved is Maxwell’s, with one constant *a* on the wave operator left free. Here that forcing is compiled again, and four things are added. First, every source is admitted: the law is additive, the law of a multiple of a potential is that multiple of its law, and multiplying the constants of the law by a number that is not zero leaves its solutions without sources the same. Second, the law carries no length: a change of the unit of length multiplies every derivative by one factor, and the forced law is then the square of that factor times itself, while a law with a constant on the potential, a mass, is not. Third, a verdict that gives a number and each of its positive multiples one answer gives every positive number the same answer. Fourth, a force between two charges that is multiplied by a number when either charge is, is one number times the product of the charges: there is one coupling, common to every pair, and with it positive like charges repel and unlike attract, whatever its value. The premises are then printed as one structure: conservation, a force linear in each charge, and repulsion of like charges, with no value given. The main theorem states that for every positive number the structure has a member whose coupling is that number, so there is no number that the coupling equals in every member, and the laws of two members with different couplings are solved without sources by the same potentials. A Fortran twin computes the flux of a point source through two hundred spheres set off their centre, executes the scaling statements on twenty thousand random waves, and sets two published formulas against the measured value 1/*α* = 137.035999177(21): the integer 137 stands 1.7 million uncertainties away and the formula of Wyler 3965. The theorem is about the premises printed here. It does not say that no law fixes the constant. Part II states the reading from which the paper takes its place in the series, at premise grade and apart from the machine-checked claims.

## 1. The Theorem and What It Rests On

### 1.1 The statement

The law of the field, in the notation of the companion paper \[11\], is

*J*_(ν) = *a* □*A*_(ν) + *b* ∂_(ν)(∂⋅*A*) + *m* *A*_(ν),

and the force between two charges *x* and *y* is a number *f*(*x*,*y*).

**Theorem (`maxwell_forced`).** On the premises below, *b* =  − *a* and *m* = 0.

**Theorem (`the_forced_law_carries_no_length`, `a_mass_carries_a_length`).** After a change of the unit of length by a factor *l*, the law with *b* =  − *a* and *m* = 0 is *l*² times the law before. With a constant *m*, the law after the change differs from *l*² times the law before by *m* (1−*l*²) *A*_(ν).

**Theorem (`one_coupling_forced`).** On the premises below, *f*(*x*,*y*) = *f*(1,1) *x* *y*; the force is positive when *x* *y* is positive and negative when *x* *y* is negative; and *a* is positive.

**Theorem (`every_positive_coupling_is_a_member`, `the_premises_fix_no_value`).** For every positive rational number *α* there is a member of the premises with *f*(1,1) = *α*. There is no number that *f*(1,1) equals in every member.

**Theorem (`the_form_does_not_tell_two_couplings_apart`).** For two members of the premises, in every arena, a potential solves the law of the first without sources exactly when it solves the law of the second.

The constant was introduced by Sommerfeld \[2\]. The premises are met: `couplingPremises` constructs a term of the structure for every positive rational number.

### 1.2 The premises, printed

The physical premises of the paper are the fields of this structure of the Lean file, and there are no others. What is cited is in the tables of Section 1.3.

``` lean
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

- **The divergence of the law, and the forcing of *b* =  − *a* and *m* = 0 by conservation** · Standing: Proved; compiled again from \[11\]; Where: Appendix A, Parts I to III
- **The law is additive; the law of a multiple is the multiple of the law; every multiple of a solution is a solution** · Standing: Proved, in every arena; Where: Part II-b
- **Multiplying the constants by a number that is not zero keeps the solutions without sources** · Standing: Proved, over a field; Where: Part IV
- **A change of the unit of length: the forced law is the square of the factor times itself; a law with a mass is not** · Standing: Proved; Where: Part V
- **A verdict blind to positive multiples gives every positive number one answer** · Standing: Proved, over every ordered field; Where: Part VI

The table continues with the coupling and the premises.

- **A force multiplied by a number when either charge is, is one number times the product of the charges** · Standing: Proved, over every field; Where: Part VII
- **With that number positive, the force has the sign of the product of the charges; the coupling of a charge with itself is positive** · Standing: Proved, over every ordered field; Where: Part VII
- **On the premises: Maxwell’s law, one positive coupling, a positive constant on the wave operator** · Standing: Proved; Where: Part VIII
- **Every positive rational number is the coupling of a member; no number is the coupling of every member** · Standing: Proved; Where: Part VIII
- **Two members have laws with the same solutions without sources** · Standing: Proved; Where: Part VIII

What is not machine-checked is in the third table.

- **Charge is conserved whatever the field does** · Standing: Premise, as in \[11\]; Where: Sections 3, 9
- **The force on a charge is proportional to that charge, and to the charge that is its source** · Standing: Premise; the second half follows the linearity of Section 3 with the classical law of force; Where: Sections 5, 9
- **Like charges repel** · Standing: Premise; measured since \[1\]; Where: Section 5
- **The force between two unit charges is the inverse of the weight of the law** · Standing: Premise, the field `tied`: the static solution of the law with the classical law of force, in units that set the constant of the sphere to one; not formalised; Where: Sections 1.2, 2
- **The coupling of the unit of charge with itself, in units of the quantum of action and the speed of light, is the fine-structure constant** · Standing: Definition of the constant \[2\], entered; Where: Section 6
- **The coupling read at short distance differs from the coupling read at long distance** · Standing: Cited: \[6\]; Where: Section 7
- **The formulas and measured values of the twin** · Standing: Entered from the literature \[3, 4, 5, 7\]; numerical, not machine-checked; Where: Section 8

The paper claims as machine-checked the rows marked proved and no others. A row marked cited is a result with a published account that this work has not machine-checked. A row marked entered is a definition, a formula or a measured value used in reading the theorems or by the numerical twin; no theorem rests on it. Part II, the reading, is outside these tables: it is premise-grade and is labelled so where it begins.

## 2. The Law and Its Arena

The setting is that of the companion paper on light \[11\]: an arena is a commutative ring of fields over a ring of constants, with one linear map for each direction, the maps commuting and obeying the rule of the product. It is formalised as the structure `Arena`, in the kernel of Lean 4 \[9\] on the library Mathlib \[8\]. The definitions `F`, `box`, `div`, `source` and `law` are the field, the wave operator, the divergence, the divergence of the field, and the law of Section 1.1. The file compiles the forcing of that paper again, so that it imports nothing but Mathlib and can be checked alone. As there, the text calls *J*_(ν) the source, and the file gives the name `source` to the divergence of the field.

Two terms are fixed here. The weight of a law is its constant *a* on the wave operator. The coupling is the force between two unit charges, *f*(1,1). The field `tied` makes each the inverse of the other.

## 3. Every Source Is Admitted

**The forcing, again (`divergence_of_the_law`, `conservation_in_four_dimensions_forces_the_law`).** The divergence of the law is (*a*+*b*) □(∂⋅*A*) + *m* (∂⋅*A*), and conservation for every potential in every arena of four directions forces *b* =  − *a* and *m* = 0. These are the theorems of \[11\].

**The law is linear (`law_add`, `law_smul_potential`).** The law of a sum of two potentials is the sum of their laws, and the law of *c* times a potential is *c* times its law.

**Every multiple (`every_multiple_of_a_solution_is_a_solution`).** If a potential solves the law with a source *J*, then *c* times the potential solves it with the source *c* *J*. No size of the source is preferred: with any solution come all its multiples.

**The weight is not seen (`law_smul_weights`, `the_solutions_do_not_see_the_weight`).** Multiplying the three constants by *c* multiplies the law by *c*. For *c* not zero, the potentials that solve the law without sources are the same before and after.

## 4. No Scale of Length

**A change of the unit of length (`Arena.scale`, `law_scale`).** Multiplying every derivative by one constant *l* gives an arena again. In it the two terms of second order of the law are multiplied by *l*², and the term on the potential itself is not.

**The forced law carries no length (`the_forced_law_carries_no_length`).** With *b* =  − *a* and *m* = 0, the law after the change is *l*² times the law before. Without sources it is the same law: there is no length in it against which a size could be read.

**A mass carries one (`a_mass_carries_a_length`).** With a constant *m* on the potential, the law after the change differs from *l*² times the law before by *m* (1−*l*²) *A*_(ν). A law that could tell a solution from its multiples through a length would need such a term, and conservation forbids it.

## 5. What the Form Does Fix

**One coupling (`one_coupling`).** Let the force between two charges be multiplied by *c* when either charge is. Then *f*(*x*,*y*) = *f*(1,1) *x* *y*. There is one number, and it is common to every pair of charges.

**Its sign (`like_repel_and_unlike_attract`).** With *f*(1,1) positive, the force is positive when *x* *y* is positive and negative when *x* *y* is negative: like charges repel and unlike attract, for every value of the coupling.

**A charge with itself (`the_coupling_of_a_charge_with_itself`).** *f*(*e*,*e*) = *f*(1,1) *e*², positive for every charge that is not zero. The coupling of the unit of charge is positive as a square is.

**On the premises (`one_coupling_forced`).** All three hold, and the weight *a* is positive. That the force is proportional to each charge is the premise. Its first half is the classical law of force on a charge; its second follows the linearity of Section 3, since the field of a multiple of a source is that multiple of the field. The law of Coulomb \[1\] is this with the inverse square of \[11\].

## 6. The Premises Fix No Value

**A verdict blind to scale (`no_scale_blind_verdict_returns_a_value`).** Let a verdict, a function of a positive number with values of any kind, give a number and each of its positive multiples one answer. Then it gives every positive number the same answer. It cannot single one out.

**Every positive coupling (`couplingPremises`, `every_positive_coupling_is_a_member`).** For every positive rational number *α* the file constructs a member of the premises: the law with weight 1/*α*, and the force *α* *x* *y*. Conservation holds for it by the identity of \[11\].

**No value (`the_premises_fix_no_value`).** So there is no number that the coupling equals in every member. Anything proved from the premises holds in all members, and a value of the coupling does not.

**The form does not tell them apart (`the_form_does_not_tell_two_couplings_apart`).** For any two members, in every arena, the potentials that solve the law without sources are the same. A quantity read from the solutions of the law is the same for a coupling of 1/137 and for any other.

The coupling of the unit of charge with itself, in units of the quantum of action and the speed of light, is the fine-structure constant, *α* \[2\]. That identification is its definition and is entered. With it, the theorem says that the premises of this paper return no value of *α*.

## 7. What the Theorem Does Not Say

It does not say that the constant cannot be explained. It says that conservation, a force linear in each charge, and repulsion do not explain it, and that no verdict blind to scale can. A law that fixed the constant would have to tell a solution from its multiples, and by Section 4 such a law carries a length or its like. The quantum theory has such scales, the masses of the charged particles, and through them the coupling read at short distance differs from the coupling read at long distance \[6\]. That shift is computed from the masses and the long-range value. It moves the question to the masses, which the companion paper on matter leaves free as well \[12\].

The theorem is also about rational numbers, since the constants of the structure are rational. Every positive rational is the coupling of a member; the paper does not construct members for the other real numbers, and needs none to conclude that no value is fixed.

## 8. The Numerical Twin

The twin of Appendix B does three things the kernel does not. It computes the flux of a point source by quadrature, it executes the scaling statements on waves, and it sets two published formulas and the forced exponent against measurement.

**The flux.** For 200 spheres about a source off their centre, with the inverse square, the flux through every sphere that holds the source is the source to one part in 10⁹, and through every sphere that does not it is zero. With the power 2.1 the flux through radius two is 0.93303 of the flux through radius one. The flux of a rescaled source is conserved, two fluxes stand in the ratio of their sources, and stretching every length by one factor leaves the flux of the inverse square unchanged and that of the power 2.1 changed.

**Waves.** On 20000 random waves, multiplying the weight by a number multiplies the law by it; the forced law after a change of the unit of length is the square of the factor times itself; and a law with a mass term changes by *m* (1−*l*²) times the potential.

**The measurements.** The measured value is 1/*α* = 137.035999177(21) \[7\].

- **Eddington: an integer \[3\]** · Value: 137; Measured: 137.035999177(21); Distance: 1.714 × 10⁶ uncertainties
- **Wyler: *α* = (9/8*π*⁴)((*π*⁵/2⁴ 5!))^(1/4) \[4\]** · Value: 137.036082448; Measured: 137.035999177(21); Distance: 3965.3 uncertainties
- **The exponent of the static law** · Value: 2; Measured: 2 + (2.7±3.1) × 10⁻¹⁶ \[5\]; Distance: within one uncertainty

Fourteen checks pass and none fails. A formula is called excluded when it stands more than five uncertainties from the measured value, and both are. Three limits are stated. The twin tests two formulas and not every formula. Its test of the exponent compares the forced value two with a measured bound. And every row is a retrodiction: each measurement, and each formula, stood before this work.

## 9. Discussion: The Reading

The derivation above uses only algebra. This section states the reading from which the premises come, and marks what in it is theorem and what is premise.

**Why these premises.** Conservation is the premise of the companion paper \[11\], read there from the statement that nothing escapes the record \[10\]. That the force on a charge is proportional to the charge is what it means for charge to be the measure of what the field acts on. That like charges repel is measured. None of the three names a number, and that is the point: the reading holds that the form of a law is forced and its magnitude is read.

**Why no formula.** A formula for the constant built from the form of the law alone would be a statement proved from these premises, or a verdict on the solutions of the law. Section 6 closes both roads: the premises have a member for every positive value, and the solutions do not tell two members apart. A formula of integers and *π* can then agree with the measured value only by coincidence, and a coincidence ends when the measurement tightens. Two have ended, in Section 8.

**What the paper does not claim.** It does not claim that the constant has no explanation, or that no theory fixes it. It does not derive the running of the coupling or any mass. It does not claim that the two formulas of Section 8 were not already excluded. It claims that the premises printed here fix no value, that they fix one coupling, positive and common to every pair, and that each statement of Section 1.3 marked proved compiles. No theorem of Sections 2 to 8 depends on Part II.

## 10. Predictions, Falsifiers, and What Stands

The paper recovers the law of Coulomb with its one coupling. It predicts no measurement that the law does not, and it derives no constant: it proves that its premises cannot. Its commitments are stated here as commitments: three that the paper says will stand at any future precision, two proposals it says will fail, and the three observations that would refute it.

### 10.1 Three predictions that will stand

1.  **The static law at long range carries no length.** `the_forced_law_carries_no_length` gives it, with `maxwell_forced`. The measured deviation of the exponent from two is (2.7±3.1) × 10⁻¹⁶ \[5\]. The prediction is that it stays at zero.
2.  **One coupling for every pair of charges.** `one_coupling_forced` gives it. The prediction is that no pair of charges is found whose force at long range is not the common number times the product of the charges.
3.  **The value is read.** `the_premises_fix_no_value` gives it. The prediction is that the measured value of *α* continues to be an input of the law of light and not an output of its form.

### 10.2 Two proposals that will fail

1.  **A formula for the constant from the form of the law of light alone.** `the_form_does_not_tell_two_couplings_apart` forbids it. The integer of Eddington and the formula of Wyler stand 1.7 million and 3965 uncertainties from the measured value. The paper predicts that every such formula, if it agrees today, fails when the measurement tightens.
2.  **A coupling of its own for some pair of charges.** `one_coupling` leaves one. The paper predicts that every such proposal either gives up the proportion of the force to each charge or names a second kind of charge.

### 10.3 The three falsifiers

Each is a forbidden observation. No observation breaks a theorem; each refutes a premise, and each names the theorem that carries the consequence. The threshold in each case is five of the experiment’s printed uncertainties.

1.  **A static law of charge at long range whose exponent is not two.** It refutes the field `conserved`, through `maxwell_forced` and `a_mass_carries_a_length`.
2.  **A force between two charges at rest that is not proportional to each.** It refutes the field `left` or the field `right`, through `one_coupling_forced`.
3.  **Two like charges that attract.** It refutes the field `repel`.

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

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author’s. The Lean file and the Fortran twin are written by a language model under the author’s direct supervision. Every theorem named in the text of Sections 1 to 10 and 12 is in Appendix A under that name, and its kernel line is printed in Appendix D. Classical results that are cited and not formalised are named as such in Section 1.3 and wherever they are used. No constant of nature is derived anywhere in this paper; the numbers of the twin are computed by quadrature, from random data and from measured inputs, which Appendix B prints.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1.  C. A. Coulomb, Mém. Acad. R. Sci. Paris (1785) 569.
2.  A. Sommerfeld, Ann. Phys. 51 (1916) 1.
3.  A. S. Eddington, Fundamental Theory, Cambridge University Press (1946).
4.  A. Wyler, C. R. Acad. Sci. Paris A 269 (1969) 743.
5.  E. R. Williams, J. E. Faller and H. A. Hill, Phys. Rev. Lett. 26 (1971) 721.
6.  S. Navas et al. (Particle Data Group), Phys. Rev. D 110 (2024) 030001.
7.  P. J. Mohr, D. B. Newell, B. N. Taylor and E. Tiesinga, Rev. Mod. Phys. 97 (2025) 025002.
8.  The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
9.  L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
10. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
11. M. F. Islam, Light as a New Mathematical Theorem, edition 2.0.0 (2026c).
12. M. F. Islam, Matter as a New Mathematical Theorem, edition 2.0.0 (2026e).

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

**Appendix A · SPHYS_Coupling_Magnitude_CC.lean.** Lean 4.19.0 with Mathlib 4.19.0. 39 theorems, no axiom declared, no `sorry`, exit 0 with no warning. The kernel lines are Appendix D. *[a printed file, 493 lines, in the master and in the Journal edition]*

**Appendix B · Coupling_Magnitude_Twin_CC.f90.** Fourteen checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix C. *[a printed file, 144 lines, in the master and in the Journal edition]*

**Appendix C · Run of Appendix B.** ```text
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
 BATTERY-JSON: {"checks":14,"failures":0} *[a printed file, 23 lines, in the master and in the Journal edition]*

**Appendix D · Kernel lines of Appendix A.** Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own. *[a printed file, 43 lines, in the master and in the Journal edition]*
