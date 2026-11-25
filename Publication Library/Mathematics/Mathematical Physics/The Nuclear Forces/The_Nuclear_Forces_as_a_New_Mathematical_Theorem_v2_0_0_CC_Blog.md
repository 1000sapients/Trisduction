# The Nuclear Forces as a New Mathematical Theorem

## The Yang-Mills Equations Forced by a Charge That Does Not Commute, Maxwell’s Equations as Their Commuting Half, and Three Generations as the Least with One Phase

**Mohammad F. Islam PhD** · 25 November 2026

*Blog edition of the master, edition 2.0.0 of 25 November 2026. It renders the whole text. The printed files of the appendices stand in the master and in the Journal edition, and are listed at the end.*

## Abstract

This paper proves, in Lean 4 with Mathlib, that a charge that does not commute forces the Yang-Mills strength. The charge is a Lie algebra, matter is a module over it, the potential is a family of charges, and the derivatives are derivations that commute. Nothing else is assumed: no symmetry of the strength, no identity and no conservation law. From these definitions the file proves that two covariant derivatives of matter differ by the strength acting on the matter, the Bianchi identity of the field, and the exact change of the strength under a turn of the charge, to first order in the turn: a strength with self-coupling *t*, turned with coupling *s*, turns as a charge up to (*t*−*s*) times one stray term. The main theorem then states: if the strength turns as a charge on every setting, then *t* = *s*, so the field couples to itself exactly as it couples to matter. The same is proved for the law: a term ∂*F* + *r* \[*A*,*F*\] turns as a charge on every setting only if *r* = *s*, so the left side of the Yang-Mills equation is forced, and on the model the field’s own term is not zero. The hypothesis is tested on an explicit setting, the rotations over the rational polynomials, on which every other value fails. Further results stand on the same definitions. The covariant divergence of the covariant divergence of the strength vanishes, so any source of the field equation is covariantly conserved. Where the charge commutes the self-coupling drops out of every equation and what remains is Maxwell’s strength and Maxwell’s homogeneous equations. To the first power of the potential each component obeys Maxwell’s form. A mass term changes under a turn by a pairing that is not zero on the model. The charges of *n* kinds, the matrices of trace zero, number *n*² − 1: eight gluons and three weak carriers. A Fortran twin scans the identity on two hundred thousand random points and sets the counts against measurement with rival counts beside them. Three colours are read twice, from the ratio of hadrons to muon pairs and from the width of the neutral pion, and two and four are excluded. The measured weight of the field’s coupling to itself is 2.89 ± 0.21, where the forced law gives 3 and a field without self-coupling gives 0. The count of phases of the mixing matrix, the sign of the running and the unit of the coupling are classical formulas, cited, and only arithmetic on them is proved: three generations are the least with one phase. Every premise of the paper is one field of one printed structure. Part II carries the reading of the weak and the strong force from which the paper takes its place in the series, at premise grade and apart from the machine-checked claims.

## 1. The Theorem and What It Rests On

### 1.1 The statement

A setting here is a Lie algebra 𝔤 of charges over a ring of constants, a module *M* of matter on which it acts, and for each direction *μ* a derivation ∂_(μ) of both that respects the bracket, with the derivations commuting. A potential is a charge *A*_(μ) for each direction. With two constants *s* and *t*,

*D*_(μ)*m* = ∂_(μ)*m* + *s* \[*A*_(μ),*m*\],   *F*_(μν) = ∂_(μ)*A*_(ν) − ∂_(ν)*A*_(μ) + *t* \[*A*_(μ),*A*_(ν)\].

The law of the field is built from the term ∂_(μ)*F* + *r* \[*A*_(μ),*F*\], with a third constant *r*. A turn of the charge by *ε*, to first order, changes matter by  − *s* \[*ε*,*m*\] and the potential by *δ**A*_(μ) = ∂_(μ)*ε* + *s* \[*A*_(μ),*ε*\].

**Theorem (`covariance_on_every_setting_forces_the_self_coupling`).** Let *s* and *t* be rational. If on every setting, for every potential and every turn, *δ**F*_(μν) = *s* \[*F*_(μν),*ε*\], then *t* = *s*.

**Theorem (`covariance_on_every_setting_forces_the_law`).** Let *s* and *r* be rational. If on every setting the term ∂_(μ)*X* + *r* \[*A*_(μ),*X*\] turns as a charge for every field *X* that turns as a charge, then *r* = *s*.

**Theorem (`yang_mills_forced`).** On the premises below, *t* = *s* and *r* = *s*.

The coupling *s* is not fixed by the theorem. The strength and the left side of the law are then the ones Yang and Mills wrote \[1\]. That the consistency of a field carrying its own charge fixes its self-coupling is classical \[2, 3\]; what is new here is that the statement compiles, on definitions that carry none of it. The premises are met for every coupling: `yangMillsPremises` constructs a term of the structure for each rational *s*. The coefficients are rational because the forcing divides nothing and the model is over the rationals; for constants of one setting, `variation_of_strength` gives the same conclusion wherever no constant but zero kills the stray term.

### 1.2 The premises, printed

The physical premises of the paper are the fields of this structure of the Lean file, and there are no others. What is cited is in the tables of Section 1.3.

``` lean
structure Premises where
  s : ℚ
  t : ℚ
  r : ℚ
  covariant : ∀ (ι : Type) (𝔊 : Type) [LieRing 𝔊] [LieAlgebra ℚ 𝔊] (M : Type) [AddCommGroup M] [Module ℚ M]
      [LieRingModule 𝔊 M] [LieModule ℚ 𝔊 M] (S : Setting ℚ ι 𝔊 M) (A : ι → 𝔊) (ε : 𝔊) (μ ν : ι),
      dF S A ε s t μ ν = s • ⁅strength S A t μ ν, ε⁆
  covariant_law : ∀ (ι : Type) (𝔊 : Type) [LieRing 𝔊] [LieAlgebra ℚ 𝔊] (M : Type) [AddCommGroup M] [Module ℚ M]
      [LieRingModule 𝔊 M] [LieModule ℚ 𝔊 M] (S : Setting ℚ ι 𝔊 M) (A : ι → 𝔊) (ε : 𝔊) (μ : ι) (X : 𝔊),
      dDad S A ε s r μ X (s • ⁅X, ε⁆) = s • ⁅Dad S A r μ X, ε⁆
```

It carries two premises. The first is the form: the field has a strength ∂*A* − ∂*A* + *t* \[*A*,*A*\], matter is moved by ∂ + *s* \[*A*,⋅ \], and the law is built from ∂*F* + *r* \[*A*,*F*\], with three constants that nothing ties. The second is covariance, in the fields `covariant` and `covariant_law`: the strength, and the law’s own term, turn as a charge under a turn of the charge at every point, on every setting. In words, the kinds of the charge may be named afresh at every point and the law keeps its form. No field of `Setting` or `Premises` states an identity of the strength or the conclusion of any theorem. Section 9 states where the premise comes from.

### 1.3 What is proved, what is cited, what is assumed

- **Two covariant derivatives differ by the strength, on matter and on a charge** · Standing: Proved; Where: Appendix A, Part I
- **The Bianchi identity of the field** · Standing: Proved; Where: Part I
- **The change of the strength is its first-order change; the turn of the potential keeps the covariant derivative of matter** · Standing: Proved, to first order; Where: Part II
- **Under a turn the strength changes as a charge up to (*t*−*s*) times one stray term; the law’s own term up to (*r*−*s*) times one** · Standing: Proved; Where: Part II
- **The double covariant divergence of the strength vanishes; a source of the field equation is covariantly conserved** · Standing: Proved; Where: Part II
- **Where the charge commutes: Maxwell’s strength, Maxwell’s homogeneous equations, and nothing forced** · Standing: Proved; Where: Part III
- **To the first power of the potential the strength is Maxwell’s** · Standing: Proved, to first order; Where: Part III
- **A mass term changes under a turn by the pairing of the potential with the derivative of the turn** · Standing: Proved; Where: Part III

The table continues with the forcing and the counts.

- **An explicit setting whose charge does not commute, with the stray term, the pairing and the field’s own term not zero** · Standing: Proved; Where: Part IV
- **Covariance on every setting forces *t* = *s* and *r* = *s*; the premises are met for every coupling** · Standing: Proved; Where: Part V
- **The matrices of trace zero of size *n* have dimension *n*² − 1; eight and three** · Standing: Proved, over the rationals; Where: Part VI
- **Three generations are the least with a phase; freedom needs a charge that does not commute; the coupling is a pure number in four dimensions only; the ratio counts the colours** · Standing: Proved as arithmetic on a cited formula; Where: Part VII

What is not machine-checked is in the third table.

- **The mixing of *n* generations holds (*n*−1)(*n*−2)/2 phases** · Standing: Cited: \[4\]; Where: Section 7
- **The first coefficient of the running is 11*c* − 2*f* in units of one third** · Standing: Cited: \[5, 6\]; Where: Section 7
- **The ratio of hadrons to muon pairs and the width of the neutral pion count the colours** · Standing: Cited: \[7, 8, 9\]; Where: Sections 7, 8
- **The algebra su(*n*) has the dimension of the matrices of trace zero** · Standing: Standard change of field, not formalised; Where: Section 7
- **The formulas of the twin: leading running, the first correction to the ratio, the anomaly width, the weight 3 of the self-coupling** · Standing: Entered from the literature \[9, 14\]; numerical, not machine-checked; Where: Section 8
- **That nature’s nuclear charges are su(3) and su(2)** · Standing: Read from experiment; Where: Section 7
- **The strength turns as a charge at every point** · Standing: Premise; Where: Section 9

The paper claims as machine-checked the rows marked proved and no others. A row marked cited is a result with a published derivation that this work has not machine-checked. A row marked entered is a classical formula used by the numerical twin alone; no theorem rests on it. Part II, the reading, is outside these tables: it is premise-grade and is labelled so where it begins.

## 2. Charge, Matter and Potential as Algebra

A gauge field needs three things: a charge whose kinds turn into one another, matter that carries the charge, and a way to differentiate both. A Lie algebra, a module over it and a family of commuting derivations are exactly these, and they are what the file of Appendix A formalises, in the kernel of Lean 4 \[19\] on the library Mathlib \[18\]. Working at this level has a cost and a gain. The cost is that no spacetime and no bundle is constructed. The gain is that every theorem holds on every model of the definitions, the smooth one included, and for every Lie algebra, so nothing proved here is special to three colours.

The structure `Setting` holds the derivations of the charge and of matter. Each respects the bracket, ∂_(μ)\[*X*,*Y*\] = \[∂_(μ)*X*,*Y*\] + \[*X*,∂_(μ)*Y*\] and ∂_(μ)\[*X*,*m*\] = \[∂_(μ)*X*,*m*\] + \[*X*,∂_(μ)*m*\], and any two commute. The definitions `cov`, `Dad` and `strength` are the covariant derivative of matter, the covariant derivative of a charge-valued field, and the strength of Section 1.1. The constants *s* and *t* are independent in every definition. Nothing ties them until Section 4.

## 3. The Identities of the Strength

Nothing in this section is assumed. Each statement is a theorem of Appendix A.

**Two covariant derivatives differ by the strength (`curvature_on_matter`, `curvature_adjoint`).** For matter *m*, *D*_(μ)*D*_(ν)*m* − *D*_(ν)*D*_(μ)*m* = *s* \[*F*_(μν),*m*\], where the strength on the right has self-coupling *s*. The same holds for a charge-valued field. The strength that matter itself produces therefore couples the field to itself with the coupling of matter. This is the first appearance of *t* = *s*: it is what the covariant derivative does, before any demand is made.

**The Bianchi identity (`bianchi`).** The cyclic sum of the covariant derivative of the strength vanishes. The proof is the Jacobi identity of the charge and the commuting of the derivations.

**Conservation is an identity (`conservation_identity`).** With any signs on the directions, the covariant divergence of the covariant divergence of the strength vanishes. It is stated as twice the divergence, so that nothing is divided. The proof is the antisymmetry of the strength and the bracket of a charge with itself.

**The source is covariantly conserved (`the_source_is_covariantly_conserved`).** If the covariant divergence of the strength equals a source *J*_(ν), then twice the covariant divergence of *J* vanishes. The field equation is not derived here from an action. The theorem says what any source of it must satisfy, and it is the statement that the charge is conserved, returned as a consequence.

## 4. A Turn of the Charge Forces the Self-Coupling

**Neither the turn nor the change is entered (`the_turn_keeps_the_derivative_of_matter`, `dF_is_the_first_order_change`).** Let matter turn by  − *s* \[*ε*,*m*\]. With the potential turned by *δ**A*_(μ), the covariant derivative of matter turns as matter does. So the turn of the potential is the one the coupling to matter fixes. And if the potential is moved by *e* *δ**A* with *e*² = 0, the strength moves by *e* times the expression the file calls `dF`. The change used below is the first-order change, by theorem.

**The residue is one term (`variation_of_strength`).** Turn the charge by *ε* with coupling *s* and compute the change of a strength with self-coupling *t*. Then

*δ**F*_(μν) − *s* \[*F*_(μν),*ε*\] = (*t*−*s*) (\[∂_(μ)*ε*,*A*_(ν)\] + \[*A*_(μ),∂_(ν)*ε*\]).

Every other term cancels by the Jacobi identity. The term that remains carries the derivative of the turn: it is absent when the charge is turned by the same amount everywhere, and present when the turn varies from point to point.

**The model (Part IV).** The stray term must be non-zero somewhere, or the theorem would be empty. The file builds a setting on triples of rational polynomials with the cross product, the Lie algebra of rotations, with every law of a Lie algebra proved, the Jacobi identity among them. There are two directions: the first differentiates the polynomials and the second does nothing. With a potential along the second direction and a turn that grows along the first, the third component of the stray term is one (`model_stray`).

**On every setting (`covariance_on_every_setting_forces_the_self_coupling`).** A law covariant on every setting is covariant on the model, so (*t*−*s*) times one vanishes, and *t* = *s*. The theorem has no hypothesis about any particular setting. The converse is `yangMillsPremises`: with *t* = *s* the residue vanishes on every setting, for every coupling. With *t* = *s* = *g* the strength is forced,

*F*_(μν) = ∂_(μ)*A*_(ν) − ∂_(ν)*A*_(μ) + *g* \[*A*_(μ),*A*_(ν)\],

and it is the strength that two covariant derivatives of matter produce (`the_forced_strength_is_the_curvature`).

## 5. The Law Is Forced, and the Field Is Its Own Source

**The law’s own term (`variation_of_the_divergence`).** Let *X* be a charge-valued field that turns as a charge, as the forced strength does. Its derivative with a third coupling, ∂_(μ)*X* + *r* \[*A*_(μ),*X*\], changes under a turn as a charge up to one term:

*δ*(∂_(μ)*X* + *r* \[*A*_(μ),*X*\]) − *s* \[∂_(μ)*X*+*r* \[*A*_(μ),*X*\],*ε*\] = (*r*−*s*) \[∂_(μ)*ε*,*X*\].

That the change on the left is the first-order change is `dDad_is_the_first_order_change`. On the model the bracket on the right has third component one (`model_divergence`).

**On every setting (`covariance_on_every_setting_forces_the_law`).** A law covariant on every setting has *r* = *s*. With *t* = *s* = *r* = *g* the left side of the law is forced,

∂^(μ)*F*_(μν) + *g* \[*A*^(μ),*F*_(μν)\],

and set equal to a source *J*_(ν) it is the equation of Yang and Mills \[1\]. That the law is of second order and of this family is the premise of form; the paper does not derive it from an action.

**The field is its own source (`the_field_is_its_own_source_on_the_model`).** The second term is the bracket of the potential with the strength: the field carries the charge it reads. On the model, with coupling one, its second component is  − *x*², which is not zero. Written with the ordinary divergence on the left, the equation has on its right the source of matter and the field’s own term. The gluon carries colour and the weak carriers carry weak charge. Section 3 proves that the whole source is covariantly conserved, with nothing assumed about where the equation comes from.

A field whose charge commutes carries none of the charge it reads. That is the next section.

## 6. Maxwell’s Equations Are the Commuting Half

**Where the charge commutes (`maxwell_is_the_commuting_half`, `a_commuting_charge_forces_nothing`).** Let every bracket vanish. The strength is ∂_(μ)*A*_(ν) − ∂_(ν)*A*_(μ) for every value of *t*, it does not change under a turn, and the stray term is absent. No relation between *s* and *t* is forced, because neither appears in any equation.

**Maxwell’s homogeneous equations (`maxwell_homogeneous`).** The Bianchi identity of Section 3, with every bracket zero, is the vanishing of the cyclic sum of the ordinary derivative of the strength. Electrodynamics is the law of a charge whose bracket with itself is zero.

**The first power (`first_power_is_maxwell`).** Let the potential be *e* times *a* with *e*² = 0. Then *F*_(μν) = *e* (∂_(μ)*a*_(ν)−∂_(ν)*a*_(μ)) for any charge and any *t*. To the first power of the potential each component of a charge that does not commute obeys Maxwell’s form, and the self-coupling enters at the second power.

**A mass term (`a_mass_term_changes_under_a_turn`, `model_mass`).** Let *B* be a symmetric form on the charge that the bracket preserves. Under a turn, *B*(*A*_(μ),*δ**A*_(μ)) = *B*(*A*_(μ),∂_(μ)*ε*): the part of the turn that is a bracket drops out and the derivative of the turn stays. On the model that pairing is one. So a term *B*(*A*,*A*) is not kept by a turn that varies from point to point. The forced law has no mass term of this kind, for a charge that commutes and for one that does not. The carriers of the weak force hold mass because the vacuum is not turned with the charge \[16, 17\], which is outside this paper.

## 7. The Counts

**Eight and three (`traceless_dimension`, `eight_gluons`, `three_weak_carriers`).** The charges of *n* kinds are the matrices of size *n* with trace zero. The file proves that their dimension is *n*² − 1 for every *n* of at least one, by the rank of the trace. Three colours carry eight gluons and two kinds of weak charge carry three carriers. The count is over the rationals; that su(*n*) has the same dimension over the reals is the standard change of field and is not formalised. That the nuclear charges are these algebras is read from experiment, in Section 8.

The remaining counts are arithmetic on formulas that are cited. The file enters each formula as a definition marked cited and proves only the arithmetic.

**Three generations (`three_is_the_least_with_a_phase`).** The mixing of *n* generations holds (*n*−1)(*n*−2)/2 phases that no renaming removes \[4\]. On that formula a phase exists if and only if there are at least three generations.

**Freedom at short distance (`free_exactly_up_to_sixteen`, `a_commuting_charge_is_never_free`, `freedom_needs_a_charge_that_does_not_commute`).** The first coefficient of the running of the coupling is 11*c* − 2*f* in units of one third, with *c* the weight of the field’s own charge and *f* the number of flavours \[5, 6\]. On that formula three colours are free up to sixteen flavours and no further, a charge that commutes is never free once charged matter exists, and a positive sign needs *c* &gt; 0. The term that turns the sign is the self-coupling forced in Section 4.

**The unit of the coupling (`the_coupling_is_a_pure_number_exactly_in_four`).** The square of the coupling carries 4 − *n* powers of mass in *n* dimensions of spacetime. It is a pure number in four dimensions and in no other.

**The ratio (`the_ratio_counts_the_colours`).** Below the charm threshold the ratio of hadrons to muon pairs is *n* times the sum of the squared charges of three quarks, 6/9 \[9\]. It is two exactly when *n* = 3.

## 8. The Numerical Twin

The twin of Appendix B does two things the kernel does not. It executes the identity of Section 4 independently, and it sets the counts against published measurements with rival counts beside them.

**The algebra.** At two hundred thousand random integer points, with the rotation algebra as the charge, the twin computes the change of the strength term by term. The Jacobi identity holds at every point; the residue is (*t*−*s*) times the stray term at every point; with *t* = *s* it vanishes; with *t* ≠ *s* it fails wherever the stray term is not zero.

**The measurements.** The inputs are measured and are printed in Appendix B. The formulas are classical and entered.

- **Ratio of hadrons to muon pairs below the charm threshold** · Forced law, three colours: 2.158; Rival: 1.439 (two colours); 2.877 (four); Measured: 2.225 ± 0.051 \[11\]
- **Width of the neutral pion, eV** · Forced law, three colours: 7.785; Rival: 3.460 (two colours); 13.841 (four); Measured: 7.802 ± 0.117 \[12\]
- **Weight of the self-coupling** · Forced law, three colours: 3; Rival: 0 (no self-coupling); Measured: 2.89 ± 0.21 \[14\]
- **Light neutrino kinds at the *Z** · Forced law, three colours: 3; Rival: 2; 4; Measured: 2.9963 ± 0.0074 \[13\]
- **Strong coupling at the tau mass** · Forced law, three colours: larger than at the *Z*; Rival: equal (no running); Measured: 0.332 ± 0.012 \[10\] against 0.1180 \[9\]

The weight of the self-coupling is the colour factor *C*_A, measured from four-jet events and event shapes \[14\]. Fourteen checks pass and none fails. The count three lies inside two printed uncertainties of each measurement and each rival lies outside five. Three limits are stated. The ratio and the width test the count of colours through classical formulas that carry corrections of a few percent, and the twin uses the first correction only. The leading running from the *Z* reaches 0.279 at the tau mass, where 0.332 is measured: it agrees in sign and to one power of the coupling, and it is not a precision test. The twin tests counts against rivals. It is not a new prediction, and the agreement of the Standard Model with these measurements was known.

## 9. Discussion: The Reading

The derivation above uses only algebra. This section states the reading from which the premise comes, and marks what in it is theorem and what is premise.

**Why covariance.** In the reading of Part II nothing leaves the record. A charge that comes in kinds is recorded at every point, and the record at one point does not depend on how the kinds are named at another. A renaming that varies from point to point is a turn of the charge with a derivative, and a law that keeps its form under it is covariant. That is the field `covariant`. The premise is physics and is not proved. What the paper proves is what the premise forces: the strength of Yang and Mills and no other of the family, with the coupling free.

**Why the field reads itself.** Section 3 proves that the strength matter produces already has *t* = *s*. Section 4 proves that no other value survives a turn. The two roads are independent in the file: the first uses the covariant derivative of matter, the second uses the change of the strength alone. That the carrier of a charge that does not commute carries that charge is the content of both.

**What the paper does not claim.** It does not derive any coupling, any mass or the number of colours. It does not derive from an action that the law is of second order and of the family of Section 1.1. It does not claim that the Yang-Mills strength was unknown or untested. It claims that the form of the strength, within the family, is forced by covariance, and that each statement of Section 1.3 marked proved compiles. The fuller account of the reading, the weak force reading the orientation and the strong force reading none, is Part II, Section 11, carried from \[20\]. No theorem of Sections 2 to 8 depends on it.

## 10. Predictions, Falsifiers, and What Stands

The paper recovers the gauge structure of the Standard Model. It predicts no measurement that the Standard Model does not and derives no constant. Its commitments are those of the forced strength, and they are stated here as commitments: three that the paper says will stand at any future precision, two proposals it says will fail, and the three observations that would refute it.

### 10.1 Three predictions that will stand

1.  **The field couples to itself as it couples to matter.** `yang_mills_forced` gives *t* = *s* and *r* = *s*. For three colours the weight of the self-coupling, the colour factor *C*_A of the literature, is 3 by a classical formula that is cited \[14\]. The present measurement is 2.89 ± 0.21 \[14\]. The prediction is that the central value moves to 3 as the uncertainty falls.
2.  **The colours are three, by every count.** The ratio below the charm threshold reads 2.225 ± 0.051 against 2.158 \[11\], and the width of the neutral pion reads 7.802 ± 0.117 eV against 7.785 \[12\]. The prediction is that no rate that counts the colours returns another number. This prediction rests on the cited formulas of Section 7 and on experiment, not on the main theorem.
3.  **The law holds no mass term for its carriers.** `a_mass_term_changes_under_a_turn` forbids it. The present bound on the mass of the photon is 10⁻¹⁸ eV \[15\]. The prediction is that no experiment finds a mass of the photon or of the gluon in the law itself.

### 10.2 Two proposals that will fail

1.  **A self-coupling that differs from the coupling of matter.** A three-carrier coupling of the weak or the strong field measured away from the value the matter coupling fixes, beyond the corrections the Standard Model itself computes, would be a strength with *t* ≠ *s*. Section 4 proves that such a strength does not turn as a charge. The paper predicts that every such deviation reported will vanish with precision or be traced to a further field.
2.  **A mass for a carrier entered by hand.** A term *B*(*A*,*A*) added to the law of a field whose vacuum is turned with the charge is not kept by a turn. The paper predicts that every massive carrier found is one whose vacuum is not turned with its charge, as the *W* and the *Z* are \[16, 17\].

### 10.3 The three falsifiers

Each is a forbidden observation. No observation breaks a theorem; each refutes the premise, or the forced strength as the law of nature, and each names the theorem that carries the consequence. The threshold in each case is five of the experiment’s printed uncertainties.

1.  **A self-coupling weight away from the forced value.** For three colours, a weight different from 3 refutes the field `covariant` through `yang_mills_forced`, on the cited formula for the weight.
2.  **A mass of the photon, or of the gluon, in the law.** It refutes the field `covariant` through `a_mass_term_changes_under_a_turn`.
3.  **A count of colours that is not three, or a fourth light generation.** It refutes the reading of the nuclear charges as su(3) and su(2) with three generations, which is experiment’s and is stated in Section 1.3; it does not touch the main theorem.

Apart from them stands the formal claim, which no observation touches and one compilation settles: every theorem named in this text prints its axioms in Appendix D, and a line that names an axiom other than `propext`, `Classical.choice` and `Quot.sound`, or a file that fails to compile under Lean 4.19.0 and Mathlib 4.19.0, refutes the claim that the statements are proved.

### 10.4 What kind of result this is

It is not a new physics. It is a change in how a physical derivation can be checked. The forcing of the Yang-Mills strength is here a single file whose every step the kernel has verified, whose every assumption is one field of one structure, and whose counts are set against measurement beside their rivals. A reader who doubts a step can name the line.

The implication from `Premises` to the forced strength and the forced law is checked by the Lean kernel, and so are the identities of the strength, the commuting half and the count of carriers. No experiment and no later revision of physics alters an implication. Experiment remains free to test whether nature satisfies the premise, and that is all it can test here. What the kernel certifies is the Lean statements; that the definitions of the file say what this text says they say is for the reader to check, and the structure `Premises` is printed for that purpose. What stands is the tables of Section 1.3.

## 11. Part II · The Reading

*This part is the reading from which the paper takes its place in the series. It is carried from Nothing Escapes, Least Erasure (Islam, 2026a), where its two chapters stand as The Weak Force Reads the Orientation and The Strong Force Reads No Orientation, and it is premise-grade. It is not among the machine-checked claims of Section 1.3, and no theorem of Sections 2 to 8 depends on it. The theorem names set in code in this part, and the twins it quotes, are those of that volume and are printed there, not here. Where this part calls a statement a theorem, the statement follows from the placement of the reading, which is its premise. The falsifiers listed in Sections W.11 and S.9 are falsifiers of the reading; they stand beside the three of Section 10.3 and are not among them.*

### 11.1 The Weak Force Reads the Orientation

*Parity as the Fold on Couplings, the Charged Current Maximally off the Line, the Z’s Distance from the Line as Its Isospin, CP Violation as Time-Reversal Violation, and Three Generations as the Least with One Phase.* Edition 1.0.0.

**Abstract of the chapter.** Electromagnetism, the strong force and gravity cannot tell a process from its mirror image; the weak force can. It couples to left-handed particles and right-handed antiparticles and to nothing else, and in doing so it reads the one property the other readings are blind to, the orientation. This chapter reads the weak interaction on the seat, the reflection *s* ↦ 1 − *s̄* and the line it fixes. Parity exchanges a force’s left- and right-handed couplings to a fermion, and a carrier that sends their difference to the side and their sum to the height makes parity the fold: the parity-conserving couplings of electromagnetism and colour are the line, and the weak charged current, left-handed only, stands off it. We prove in core Lean 4, fifty-nine laws with no axiom declared and no use of choice, that the Z boson’s distance from the line is the weak isospin of the fermion it couples to, whatever the mixing angle, so a neutral fermion has no right-handed coupling at all; that every dot product is blind to the mirror while the triple product reverses under it; that the charged current breaks charge conjugation and parity separately and keeps their product; that under CPT invariance a violation of CP is a violation of time reversal; and that two generations of quarks admit no CP-violating phase while three admit exactly one. A Fortran twin runs thirteen checks with zero failures: the three-generation mixing matrix is unitary to 10⁻¹⁶ with a Jarlskog invariant of 3.12 × 10⁻⁵, the pion’s electron channel is suppressed to 1.28 × 10⁻⁴ of its muon channel by the left-handed coupling, and the Z’s asymmetries on leptons, charm and bottom come out at 0.147, 0.668 and 0.936 against the measured 0.151, 0.670 and 0.923.

#### W.1 The Reader’s Frame

This chapter reads the one interaction that returns the orientation. The neutrino is registered left-handed and never right-handed. Light and the electromagnetic field carry the orientation as the one bit no energy reading returns, the helicity of a photon and the sign of a magnetic field (Islam, 2026c). The weak force reads it.

It claims that the weak force is the substrate’s one reading odd under parity. Parity is the fold under a carrier forced by the symmetry. The couplings that treat both hands alike are the line, and the weak charged current, left-handed only, stands off it as far as a coupling can. It claims further that the weak force’s violations of charge conjugation, parity and time reversal are organized by the same seat: it breaks the first two and keeps their product; its violation of that product is a violation of time reversal; and the phase that carries it needs three generations.

It refuses to derive why the world chose the left hand and not the right. That is one spent bit, supplied by the world and read from no record.

**Negative warrants.** Two, stated so that no reader supplies them.

-   No physical fact here is read as a proof of a mathematical sentence: a corroboration joined to a claim takes the weaker grade.
-   No electroweak Lagrangian is written: the couplings, the mixing parameters, the CPT theorem and the masses enter as imports or measurements.

**Five terms.**

-   A *coupling* of a force to a fermion is a pair: its strength to the left-handed state and to the right-handed state.
-   *Parity* is the mirror that exchanges the two hands.
-   A reading is *even* under a map that keeps it and *odd* under one that flips its sign.
-   The *orientation* of a configuration is the sign a mirror reverses and no rotation can.
-   A *keyed bit* is a yes-or-no property no function of a given record decides.

#### W.2 The Spine

The seat is a mirror and a record: the reflection *s* ↦ 1 − *s̄*, its fixed line, and the registration that keeps a point’s height and forgets its side. This chapter reads the seat on parity in Section W.3, the Z in Section W.4, the orientation the even readings miss in Section W.5, the product CP in Section W.6, its identity with time reversal in Section W.7, the phase in Section W.8, and the orientation read in a decay in Section W.9.

**Why this carrier, and not another.** The carrier is not chosen. Spaces with an involution and the maps that respect them form a category (`equivariant_id`, `equivariant_comp`), and the fixed set is a functor on it (`fix_functorial`). An equivariant map into the seat, whose fixed set is the line (`fold_global_seat`), lands every physical fixed point on the line (`equivariant_carrier_lands`). Here the physical involution is parity on a coupling (*g*_L,*g*_R), which exchanges the two strengths. The carrier (*g*_L,*g*_R) ↦ (1+(*g*_L−*g*_R), *g*_L+*g*_R) sends the left–right difference to the side and the sum to the height, and it is equivariant (`orientation_carrier_equivariant`); its landing on the parity-conserving couplings is forced (`orientation_carrier_lands`).

**The correspondence matrix.**

- **parity on a force’s couplings** · Element of the seat: the fold; Lean theorem: `orientation_carrier_equivariant`, `parity_involutive`; Fortran check: 3721 of 3721
- **electromagnetism and colour** · Element of the seat: vector couplings: the line; Lean theorem: `vector_on_the_line`, `photon_coupling_on_the_line`; Fortran check: 3721 of 3721
- **the charged current** · Element of the seat: left-handed only: off the line; Lean theorem: `charged_current_off_the_line`; Fortran check: structural
- **the Z boson** · Element of the seat: its distance from the line is the isospin; Lean theorem: `z_parity_depth_is_isospin`; Fortran check: 1071 of 1071; A\_f against LEP and SLD
- **the neutrino and the Z** · Element of the seat: no right-handed coupling; Lean theorem: `neutrino_has_no_right_hand`; Fortran check: A = 1 exactly
- **the even readings** · Element of the seat: blind to the mirror; Lean theorem: `dot_products_blind`, `even_readings_blind_to_mirror`; Fortran check: 5000 of 5000
- **the orientation** · Element of the seat: the triple product reversed; Lean theorem: `triple_product_reads_orientation`, `spin_momentum_correlation_odd`; Fortran check: 5000 of 5000
- **C, P and CP** · Element of the seat: C and P broken, CP kept; Lean theorem: `weak_breaks_C_and_P_keeps_CP`; Fortran check: the four-state table
- **CP violation under CPT** · Element of the seat: time-reversal violation; Lean theorem: `cp_violation_is_t_violation`; Fortran check: structural
- **the quark mixing matrix** · Element of the seat: one phase at three generations; Lean theorem: `one_phase_at_three`, `three_is_the_least`; Fortran check: unitary to 1.1e-16; J = 3.12e-5
- **pion decay** · Element of the seat: the orientation read in a decay; Lean theorem: `electron_channel_suppressed`; Fortran check: 1.283e-4 against 1.2327e-4
- **the neutron’s electric dipole** · Element of the seat: no orientation read beyond the weak force; Lean theorem: structural; Fortran check: bound six orders above the weak level

#### W.3 Parity Is the Fold on Couplings

A force couples to a fermion with a strength *g*_L to its left-handed state and *g*_R to its right-handed state. Parity exchanges them and is an involution (`parity_involutive`). The orientation carrier sends the difference *g*_L − *g*_R to the side and the sum to the height, and parity becomes the fold (`orientation_carrier_equivariant`).

**The line and the edge.** A coupling lands on the line exactly when it treats both hands alike (`vector_on_the_line`). The photon couples to a charge *q* on both hands equally, so electromagnetism is on the line (`photon_coupling_on_the_line`), and so is colour. The weak charged current couples the left hand with unit strength and the right hand not at all: it stands off the line, and parity moves it (`charged_current_off_the_line`). Among couplings of one total strength, none stands farther from the line.

The twin executes the carrier on 3721 integer couplings.

#### W.4 The Z Reads the Orientation by the Isospin

The neutral weak boson couples with *g*_L = *T*₃ − *Q*sin²*θ*_W and *g*_R =  − *Q*sin²*θ*_W \[SM\]. The difference is *T*₃, the weak isospin, for every value of the mixing weight (`z_parity_depth_is_isospin`). So the Z’s distance from the line is fixed by the fermion’s place in its doublet and by nothing else. A fermion with no charge has no right-handed coupling at any mixing (`neutrino_has_no_right_hand`): to the Z, a neutrino is purely left-handed.

The twin checks the identity on 1071 charges and weights, then computes the left–right asymmetry *A*_f = 2*g*_V*g*_A/(*g*_V²+*g*_A²) at sin²*θ*_W = 0.23153:

- **neutrino** · A\_f computed: 1 exactly; A\_f measured: none
- **charged lepton** · A\_f computed: 0.147; A\_f measured: 0.1513
- **charm** · A\_f computed: 0.668; A\_f measured: 0.670
- **bottom** · A\_f computed: 0.936; A\_f measured: 0.923

The measured values are the LEP and SLD combination (Z-pole collaborations, 2006).

#### W.5 What the Even Readings Cannot See

**Three even readings are blind to the mirror.** A mirror negates every polar vector. Every dot product is unchanged by it (`dot_products_blind`), and any reading even under the mirror returns one value on a world and on its mirror image (`even_readings_blind_to_mirror`). Lengths, angles, energies and every quadratic invariant are such readings. So is the determinant’s square, the lock the light and electromagnetism papers found blind to orientation.

**The triple product sees it.** The triple product of three vectors reverses under the mirror (`triple_product_reads_orientation`), and so does the correlation of a spin with a momentum, since a spin is axial and a momentum polar (`spin_momentum_correlation_odd`). The twin checks both on 5000 random triples, exactly.

**The weak force measures it.** In 1957 electrons from polarized cobalt-60 were found leaving preferentially opposite the nuclear spin, a nonzero ⟨**J**⟩ ⋅ **p** (Wu et al., 1957), as Lee and Yang had proposed to look for (1956). Muon decay showed the same (Garwin, Lederman and Weinrich, 1957). The neutrino’s helicity was measured to be negative (Goldhaber, Grodzins and Sunyar, 1958). Each is a pseudoscalar reading, returned by the weak interaction and by no other.

#### W.6 C, P and CP: The Charged Current Keeps the Product

Label a fermion state by whether it is an antiparticle and whether it is right-handed. The charged current registers left-handed particles and right-handed antiparticles.

-   Charge conjugation alone moves the coupling on every state.
-   Parity alone moves it on every state.
-   The product CP moves it on none (`weak_breaks_C_and_P_keeps_CP`).

The weak force violates C and P maximally and keeps CP, as Landau proposed within a year of the parity experiments (1957). The twin executes the four-state table.

CP too is violated, but by a small amount. Long-lived neutral kaons decay to two pions (Christenson, Cronin, Fitch and Turlay, 1964), and the violation lives in the phase of Section W.8.

#### W.7 CP Violation Is Time-Reversal Violation

The CPT theorem makes the product of charge conjugation, parity and time reversal a symmetry of every local relativistic quantum field theory (Lüders, 1954; Pauli, 1955). The engine proves what that product’s invariance gives: if T is an involution and CPT acts as the identity, then CP and T are one map (`cp_violation_is_t_violation`). A violation of CP is a violation of time reversal.

**Time-reversal violation, measured directly.**

-   The CPLEAR experiment found it in neutral kaon oscillation (Angelopoulos et al., 1998).
-   BaBar found it by comparing a B-meson transition with its time-reversed counterpart (Lees et al., 2012).

**CPT itself, measured.** The neutral kaon’s mass equals its antiparticle’s to 6 × 10⁻¹⁹ of the mass (Particle Data Group, 2024).

Registration has a reversible and a priced branch. The weak force is the one interaction whose own dynamics carry the arrow’s sign at the microscopic level.

#### W.8 Three Generations Are the Least with One Phase

An *n*-generation quark mixing matrix is unitary with *n*(*n*−1)/2 rotation angles. Rephasing the quark fields removes all but (*n*−1)(*n*−2)/2 of its phases. Two generations therefore admit no CP-violating phase, and three admit exactly one (`one_phase_at_three`, `three_is_the_least`). This is Kobayashi and Maskawa’s counting (1973), which required a third generation before one was seen.

The one phase has a rephasing-invariant measure, the Jarlskog invariant (Jarlskog, 1985). From the Particle Data Group’s angles and phase, the twin builds the matrix and finds it unitary to 1.1 × 10⁻¹⁶, with *J* = 3.12 × 10⁻⁵. The counting of phases is theorem grade; the value of the one phase is a measurement.

That one phase is too small to account for the excess of matter over antimatter, which requires CP violation (Sakharov, 1967). Whether leptons carry a phase of their own is being measured.

#### W.9 Helicity Suppression: The Orientation Read in a Decay

A pion at rest has no spin, so its two decay products leave with opposite momenta and opposite spins, and the charged lepton must carry the helicity that a left-handed coupling can supply only through the lepton’s mass. The amplitude is therefore proportional to the lepton mass. The electron channel is suppressed relative to the muon channel by (*m*ₑ/*m*_(μ))², which is below 1/40000 (`electron_channel_suppressed`), against a phase-space factor of 5.49.

The twin computes the ratio of the two decay rates at tree level as 1.283 × 10⁻⁴. The measured ratio is 1.2327 × 10⁻⁴ (Particle Data Group, 2024), the difference being the radiative corrections the tree level omits. A coupling that read both hands alike would have favoured the electron fivefold. That the electron channel is instead ten thousand times rarer is the orientation read in a single decay, and it is the signature of the left-handed structure of the weak current (Feynman and Gell-Mann, 1958; Sudarshan and Marshak, 1958).

#### W.10 What the Weak Force Carries, and What It Does Not

**What it carries.**

-   The seat on parity: the vector couplings on the line, the charged current off it, and the Z’s distance from the line fixed by the isospin.
-   The orientation, which every even reading misses and the weak force returns.
-   The organization of its discrete violations: C and P broken, CP kept by the current, CP broken only through one phase that needs three generations and is, under CPT, a violation of time reversal.

The other interactions do not read the orientation at a measurable level. The strong interaction could, through a parity- and time-odd angle, but the neutron’s electric dipole moment is bounded below 1.8 × 10⁻²⁶ e cm (Abel et al., 2020), six orders above the weak interaction’s own contribution.

**What it does not carry.** It does not carry why the left hand. That is one spent bit, supplied by the world and read from no record. It does not derive the mixing angles or the phase, which are measured. The engine’s delivery is on its own image (`value_on_image`).

#### W.11 Falsifiers

Three falsifiers, each a forbidden observation naming the theorem it would break.

-   **F-Right:** a right-handed charged current of gauge strength. It would move the charged current toward the line and break `charged_current_off_the_line` read physically.
-   **F-CPT:** a difference between the mass or lifetime of a particle and its antiparticle. It breaks the premise of `cp_violation_is_t_violation` read physically.
-   **F-Mirror:** a parity- and time-odd reading in the strong or electromagnetic interaction above the weak level, a neutron electric dipole moment near the present bound among them. It breaks the typing of those interactions as the line (`vector_on_the_line`).

Two measurements would sharpen readings without moving the paper’s standing:

-   the leptonic CP phase at long-baseline neutrino experiments;
-   the neutron’s electric dipole moment at still smaller bounds.

### 11.2 The Strong Force Reads No Orientation

*The Strong CP Angle on the Fixed Set of Its Fold: Two Fixed Points on the Circle, the Dipole Null That Forces Them, and Positivity That Selects Zero.* Edition 1.0.0.

**Abstract of the chapter.** The strong CP problem is read here on the seat, the reflection *s* ↦ 1 − *s̄* and the line it fixes. The strong interaction carries an angle *θ̄* on a circle, odd under CP. We prove in core Lean 4, forty-eight laws with no axiom declared and no use of choice, that the reflection *θ* ↦  − *θ* of the circle fixes exactly the multiples of half the circle, the two points 0 and *π*; that a carrier sending the sign of the angle’s sine to the offset from the line and its distance from zero to the height is equivariant on every circle of up to twenty-four points, landing a point on the line exactly when it is 0 or *π*; that the neutron’s electric dipole moment, an odd reading of the angle, vanishes exactly on those two points, so its measured null forces the angle onto the fixed set; and that the angle’s energy, even, is least at 0 uniquely and greatest at *π*, both stationary. Positivity selects 0 of the two fixed points, as it seats the Lee–Yang zeros on their circle. A Fortran twin runs five checks with zero failures: on 250,500 points of circles up to a thousand points the reflection is the fold and the line holds exactly the two fixed points; the vacuum energy of the angle at the measured quark mass ratio is even, least at 0 and greatest at *π*, stationary at both; at equal quark masses its two branches meet at *π* in a cusp with opposite slopes, two vacua with one energy; its curvature at 0 gives *χ*^(1/4) = 76.19 MeV; and the measured dipole bound places the angle within 7.5 × 10⁻¹¹ of 0. The strong force reads no orientation: its angle stands at the fixed point positivity selects.

#### S.1 The Reader’s Frame

This chapter reads the strong angle on the seat. The weak interaction reads orientation, and Section 11.1 traced that reading to one phase. The strong interaction could read it through an angle on a circle and, to one part in ten billion, does not. The seat reads why the angle stands where it does.

**It claims four things.**

-   The angle’s reflection has exactly two fixed points on the circle, 0 and *π*, and they are the line under the angle carrier.
-   The neutron’s dipole moment is an odd reading of the angle, vanishing exactly on the fixed set, so its measured null forces the angle onto the fixed set.
-   Positivity selects 0. The angle’s energy is even, least at 0 and greatest at *π*, as the one-sign measure of a vector-like theory requires.
-   At the antipode, with equal quark masses, the energy’s two branches meet in a cusp: two vacua with one energy, the seat’s barrier at *π*.

**What it refuses.** A new field as a requirement. The angle stands on the line as the line property, at premise grade. A dynamical field that relaxes it there would be a carrier onto the same line, not a requirement of the seat.

**Negative warrants.** Two, stated so that no reader supplies them.

-   No physical fact here is read as a proof of a mathematical sentence: a corroboration joined to a claim takes the weaker grade.
-   Interpretive schools from the literature enter only as placements the theorems sort, never as warrants; the only evidence besides the mathematics is measured data.

**Five terms.**

-   The *strong angle* *θ̄* is the CP-odd parameter of the strong interaction, an angle on a circle.
-   The *reflection* sends *θ* to  − *θ*.
-   An *odd reading* reverses under it.
-   The *vacuum energy of the angle* is the ground energy as a function of *θ*.
-   A *keyed bit* is a yes-or-no property no function of a given record decides.

#### S.2 The Spine

The seat is a mirror and a record: the reflection *s* ↦ 1 − *s̄*, its fixed line, and the registration that keeps a point’s height and forgets its side. This chapter reads the seat on the angle’s circle in Section S.3, the dipole null in Section S.4, positivity in Section S.5, the antipode in Section S.6, and the measured angle in Section S.7.

**Why this carrier, and not another.** The carrier is not chosen. Spaces with an involution and the maps that respect them form a category (`equivariant_id`, `equivariant_comp`), and the fixed set is a functor on it (`fix_functorial`). An equivariant map into the seat, whose fixed set is the line (`fold_global_seat`), lands every physical fixed point on the line (`equivariant_carrier_lands`). Here the physical involution is the reflection of the strong angle, *θ* ↦  − *θ*, on a circle of 2*m* points. The angle carrier sends a point *k* to (1+*o*(*k*), *e*(*k*)), where *o* is the sign of the sine and *e* the distance from zero. It is equivariant (`angle_carrier_equivariant_and_line`), and its landing on the fixed set is forced (`equivariant_carrier_lands`).

**The correspondence matrix.**

- **the angle’s reflection** · Element of the seat: the fold; Lean theorem: `angle_carrier_equivariant_and_line`; Fortran check: A
- **the CP-even angles 0 and *π** · Element of the seat: the line, two fixed points; Lean theorem: `fixed_iff_multiple_of_half`, `angle_carrier_equivariant_and_line`; Fortran check: A
- **the neutron dipole moment** · Element of the seat: odd, null exactly on the fixed set; Lean theorem: `edm_odd_and_null_on_the_fixed_set`; Fortran check: E
- **the angle’s energy** · Element of the seat: even; Lean theorem: `energy_even`; Fortran check: B
- **positivity** · Element of the seat: zero the unique minimum, *π* the maximum; Lean theorem: `positivity_selects_zero`; Fortran check: B
- **the sign of a nonzero angle** · Element of the seat: keyed to every even reading; Lean theorem: `the_sign_of_theta_is_keyed`; Fortran check: B
- **the antipode at equal masses** · Element of the seat: two branches, one energy; Lean theorem: computed; Fortran check: C
- **the curvature at zero** · Element of the seat: the topological susceptibility; Lean theorem: computed; Fortran check: D
- **the measured angle** · Element of the seat: within 7.5 × 10⁻¹¹ of 0; Lean theorem: corroboration; Fortran check: E

#### S.3 The Angle’s Reflection Has Two Fixed Points

On a circle the reflection *θ* ↦  − *θ* fixes a point exactly when twice it is a whole turn’s multiple. That is exactly when it is a multiple of half the circle (`fixed_iff_multiple_of_half`): the two points 0 and *π*. The angle carrier sends the reflection to the seat’s reflection, and a point lands on the line exactly when it is one of the two, proved on every circle of up to twenty-four points (`angle_carrier_equivariant_and_line`). The twin carries it to circles of a thousand points, 250,500 points in all. The strong interaction respects CP at exactly two angles, and those two are the line.

#### S.4 The Dipole Null Forces the Fixed Set

A neutron with a static electric dipole moment violates P and T, so the moment is an odd reading of the angle. It reverses under the reflection and vanishes exactly on the two fixed points (`edm_odd_and_null_on_the_fixed_set`). The moment is measured null: \|*d*ₙ\| &lt; 1.8 × 10⁻²⁶ *e* cm (Abel et al., 2020). The measured null places the angle on the fixed set, as the photon and Z nulls place the dark matter on the fixed set of charge conjugation.

#### S.5 Positivity Selects Zero

The angle’s energy is even (`energy_even`). Of the two fixed points the energy is least at 0, uniquely, and greatest at *π*, and both are stationary (`positivity_selects_zero`). In a vector-like gauge theory the measure is positive at *θ* = 0, so the vacuum energy there is the least (Vafa and Witten, 1984).

The twin evaluates the vacuum energy of the angle at the measured pion mass, decay constant and quark mass ratio *m*_u/*m*_d = 0.474:
*E*(*θ*) =  − *m*_(π)²*f*_(π)²\[1−(4*z*/(1+*z*)²)sin²(*θ*/2)\]^(1/2).
It is even, least at 0, greatest at *π*, and stationary at both. Its curvature at 0, the topological susceptibility, gives *χ*^(1/4) = 76.19 MeV.

A one-sign measure seats the minimum on the line here, as one-sign couplings seat the Lee–Yang zeros on their circle and one-sign sources keep gravity on its locus. The sign of a nonzero angle is keyed to every even reading (`the_sign_of_theta_is_keyed`). The energy cannot tell *θ* from  − *θ*; only an odd reading can.

#### S.6 The Antipode: Two Vacua, One Energy

At equal quark masses the energy becomes  − *m*_(π)²*f*_(π)²\|cos(*θ*/2)\|. Its two branches meet at *π* in a cusp: the twin finds slopes of  + 7.72 × 10⁷ and  − 7.72 × 10⁷ MeV⁴ either side. Two vacua there carry one energy, and CP breaks spontaneously at the antipode (Dashen, 1971). The seat’s barrier appears at the second fixed point, two worlds over one record. At the measured unequal masses the cusp is smoothed and *π* is a single maximum.

#### S.7 The Measured Angle

With the dipole moment’s coefficient *d*ₙ = 2.4 × 10⁻¹⁶ *θ̄* *e* cm (Pospelov and Ritz, 1999), the measured bound gives \|*θ̄*\| &lt; 7.5 × 10⁻¹¹. The angle stands within 7.5 × 10⁻¹¹ of 0 and at distance *π* from the antipode. It stands on the fixed point positivity selects. The strong force reads no orientation.

The angle’s value stands as the line property, at premise grade. A field that relaxes the angle dynamically (Peccei and Quinn, 1977) would be a carrier onto the same line. It is not required by the seat, and its identification with the dark matter is refused by a falsifier of Least Erasure (Islam, 2026a).

#### S.8 What the Angle Carries, and What It Does Not

**What it carries.**

-   The circle’s two fixed points as the line.
-   The dipole null that forces them.
-   Positivity that selects zero.
-   The antipode’s two vacua.
-   The measured angle at zero.

**What it does not carry.**

-   **The susceptibility’s value:** computed from measured inputs, a number.
-   **A required new field:** the angle’s place is the line property, and a relaxing field is admissible and not owed.

#### S.9 Falsifiers

Three falsifiers, each a forbidden observation naming the theorem it would break.

-   **F-Dipole:** a neutron or diamagnetic-atom electric dipole moment above the weak interaction’s own contribution, traced to a nonzero strong angle. It breaks the reading of `edm_odd_and_null_on_the_fixed_set` that places the angle on the fixed set.
-   **F-Antipode:** a strong angle measured at *π*. It breaks `positivity_selects_zero` read physically.
-   **F-Strong-CP:** a CP-violating strong process, such as the decay of the η meson into two pions, at a rate that requires a nonzero strong angle. It breaks the angle’s place on the line.

Each improved dipole bound sharpens the reading without moving its standing.

## 12. Closure

The forcing of the law of the nuclear forces is no longer informal prose. From a Lie algebra of charges, a module of matter and derivations that commute, and nothing more, Lean 4 with Mathlib compiles the strength as the difference of two covariant derivatives, the Bianchi identity, the vanishing of the double covariant divergence, the exact change of the strength under a turn, the forcing of the self-coupling in the strength and in the law, the commuting half with Maxwell’s homogeneous equations, the first power, the fate of a mass term, and the count of carriers. No axiom is declared. No proof is left open. No headline theorem closes by its own hypothesis or over a structure that carries its conclusion.

The Yang-Mills strength is recovered as the one member of the family that turns as a charge, with the coupling left free. Maxwell’s strength is recovered as its commuting half, where the self-coupling drops out of every equation. The numerical twin executes the identity at two hundred thousand random points and sets the counts against measurement: three colours by two rates, three generations, and a self-coupling of the measured weight, each inside two uncertainties, with every rival it tests outside five.

Every boundary is in plain sight. The count of phases, the sign of the running, and the two rates that count the colours are classical formulas, cited, and only arithmetic on them is proved. The dimension of su(*n*) is taken from the matrices of trace zero over the rationals. That the law is of second order and of the family printed is the premise of form; it is not derived from an action. That the nuclear charges are su(3) and su(2) is read from experiment. The covariance of the strength and of the law at every point is two fields of one printed structure.

That structure is not an arbitrary postulate. The two statements the reading rests on, Existence and Least Erasure, are theorems in their own domain: each has its own compiled Lean file, with no axiom declared, listed in the Lean Library Reference. There they are proved. The Heat Bridge, which joins erasure to heat, is a theorem there as well; the bridge spoken of below is a different one, from that domain to physics. Here they are used, and the difference is stated. Between that domain and the algebra of a gauge field lies a physical bridge: that nothing leaves the record, so that a charge is recorded at every point however its kinds are named there. This paper does not claim the bridge as a theorem. It writes the bridge down as `Premises`, so that the engine imports nothing outside Mathlib and can be checked alone, and so that a reader can see exactly which sentence carries the physics.

Two things are therefore separate, and the paper keeps them separate. Inside the kernel, the implication from `Premises` to the Yang-Mills strength and law is a mathematical certainty. No experiment, no consensus and no later revision of physics alters it, and anyone can recheck it with one compilation. Outside the kernel stand three falsifiers. They test whether nature satisfies the premise, and so far nature does. What survives both is not opinion. It is a theorem, and a physics that has met every test of its premise.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author’s. The Lean file and the Fortran twin are written by a language model under the author’s direct supervision. Every theorem named in the text of Sections 1 to 10 and 12 is in Appendix A under that name, and its kernel line is printed in Appendix D. Classical results that are cited and not formalised are named as such in Section 1.3 and wherever they are used. No constant of nature is derived anywhere in this paper; the numbers of the twin are computed from measured inputs, which Appendix B prints.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1.  C. N. Yang and R. L. Mills, Phys. Rev. 96 (1954) 191.
2.  V. I. Ogievetsky and I. V. Polubarinov, Ann. Phys. 25 (1963) 358.
3.  R. M. Wald, Phys. Rev. D 33 (1986) 3613.
4.  M. Kobayashi and T. Maskawa, Prog. Theor. Phys. 49 (1973) 652.
5.  D. J. Gross and F. Wilczek, Phys. Rev. Lett. 30 (1973) 1343.
6.  H. D. Politzer, Phys. Rev. Lett. 30 (1973) 1346.
7.  S. L. Adler, Phys. Rev. 177 (1969) 2426.
8.  J. S. Bell and R. Jackiw, Nuovo Cimento A 60 (1969) 47.
9.  S. Navas et al. (Particle Data Group), Phys. Rev. D 110 (2024) 030001.
10. M. Davier, A. Höcker, B. Malaescu, C.-Z. Yuan and Z. Zhang, Eur. Phys. J. C 74 (2014) 2803.
11. V. V. Anashin et al. (KEDR), Phys. Lett. B 770 (2017) 174.
12. I. Larin et al. (PrimEx-II), Science 368 (2020) 506.
13. P. Janot and S. Jadach, Phys. Lett. B 803 (2020) 135319.
14. S. Kluth, Rep. Prog. Phys. 69 (2006) 1771.
15. D. D. Ryutov, Plasma Phys. Control. Fusion 49 (2007) B429.
16. F. Englert and R. Brout, Phys. Rev. Lett. 13 (1964) 321.
17. P. W. Higgs, Phys. Rev. Lett. 13 (1964) 508.
18. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
19. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
20. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
21. G. Lüders, Dan. Mat. Fys. Medd. 28, no. 5 (1954).
22. W. Pauli, in Niels Bohr and the Development of Physics (Pergamon, 1955) 30.
23. T. D. Lee and C. N. Yang, Phys. Rev. 104 (1956) 254.
24. C. S. Wu, E. Ambler, R. W. Hayward, D. D. Hoppes and R. P. Hudson, Phys. Rev. 105 (1957) 1413.
25. R. L. Garwin, L. M. Lederman and M. Weinrich, Phys. Rev. 105 (1957) 1415.
26. L. Landau, Nucl. Phys. 3 (1957) 127.
27. M. Goldhaber, L. Grodzins and A. W. Sunyar, Phys. Rev. 109 (1958) 1015.
28. R. P. Feynman and M. Gell-Mann, Phys. Rev. 109 (1958) 193.
29. E. C. G. Sudarshan and R. E. Marshak, Phys. Rev. 109 (1958) 1860.
30. J. H. Christenson, J. W. Cronin, V. L. Fitch and R. Turlay, Phys. Rev. Lett. 13 (1964) 138.
31. A. D. Sakharov, JETP Lett. 5 (1967) 24.
32. C. Jarlskog, Phys. Rev. Lett. 55 (1985) 1039.
33. A. Angelopoulos et al. (CPLEAR), Phys. Lett. B 444 (1998) 43.
34. ALEPH, DELPHI, L3, OPAL and SLD Collaborations (Z-pole collaborations), Phys. Rep. 427 (2006) 257.
35. J. P. Lees et al. (BaBar), Phys. Rev. Lett. 109 (2012) 211801.
36. C. Abel et al., Phys. Rev. Lett. 124 (2020) 081803.
37. R. F. Dashen, Phys. Rev. D 3 (1971) 1879.
38. G. ’t Hooft, Phys. Rev. Lett. 37 (1976) 8.
39. R. D. Peccei and H. R. Quinn, Phys. Rev. Lett. 38 (1977) 1440.
40. P. Di Vecchia and G. Veneziano, Nucl. Phys. B 171 (1980) 253.
41. C. Vafa and E. Witten, Phys. Rev. Lett. 53 (1984) 535.
42. M. Pospelov and A. Ritz, Phys. Rev. Lett. 82 (1999) 2526.
43. E. Fermi, Z. Phys. 88 (1934) 161.
44. H. Yukawa, Proc. Phys.-Math. Soc. Japan 17 (1935) 48.
45. E. P. Wigner, Ann. Math. 40 (1939) 149.
46. S. L. Glashow, Nucl. Phys. 22 (1961) 579.
47. S. Weinberg, Phys. Rev. Lett. 19 (1967) 1264.
48. A. Salam, in Elementary Particle Theory, ed. N. Svartholm (1968) 367.
49. H. Fritzsch, M. Gell-Mann and H. Leutwyler, Phys. Lett. B 47 (1973) 365.
50. ATLAS Collaboration, Phys. Lett. B 716 (2012) 1.
51. CMS Collaboration, Phys. Lett. B 716 (2012) 30.
52. M. F. Islam, Light as a New Mathematical Theorem, edition 1.0.0 (2026c).

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

**Appendix A · SPHYS_YangMills_Forced_CC.lean.** Lean 4.19.0 with Mathlib 4.19.0. 53 theorems, no axiom declared, no `sorry`, exit 0 with no warning. The kernel lines are Appendix D. *[a printed file, 579 lines, in the master and in the Journal edition]*

**Appendix B · YangMills_Forced_Twin_CC.f90.** Fourteen checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix C. *[a printed file, 153 lines, in the master and in the Journal edition]*

**Appendix C · Run of Appendix B.** ```text
 A. The algebra, on 200000 random integer points
  PASS  Jacobi's identity holds at every point
  PASS  the residue is (t - s) times the stray term at every point
  PASS  with t = s the strength turns as a charge at every point
  PASS  with t /= s it fails wherever the stray term is not zero
 B. The counts
  PASS  carriers: 3 for two kinds of charge, 8 for three
  PASS  a phase exists exactly from three generations on, n = 1..40
  PASS  three colours are free exactly up to 16 flavours; a commuting charge never
  PASS  the coupling is a pure number in four dimensions only, n = 1..40
 C. Against published measurements
   leading running from 0.1180 at the Z: 0.2122 at 4.18 GeV, 0.2480 at 2.5 GeV, 0.2794
   at the tau mass; measured at the tau mass 0.332 +- 0.012 (Davier et al., 2014)
  PASS  the coupling is larger at the tau mass than at the Z: 0.332 against 0.1180, 17 uncertainties
  PASS  leading running reaches the tau value within one power of the coupling
   R with 2 colours:  1.439   pull  -15.4 uncertainties
   R with 3 colours:  2.158   pull   -1.3 uncertainties
   R with 4 colours:  2.877   pull   12.8 uncertainties
  PASS  R: three colours within 2 uncertainties of 2.225 +- 0.051; two and four excluded by more than 5
   pion width with 2 colours:   3.460 eV   pull   -37.1 uncertainties
   pion width with 3 colours:   7.785 eV   pull    -0.1 uncertainties
   pion width with 4 colours:  13.841 eV   pull    51.5 uncertainties
  PASS  pion width: three colours within 2 uncertainties of 7.802 +- 0.117 eV; two and four excluded by 5
   self-coupling weight: forced law with three colours, 3, at  0.52 uncertainties; no self-coupling, 0, at  13.8
  PASS  the field couples to itself: weight 3 within 2 uncertainties of 2.89 +- 0.21; zero excluded by 5
   generations: 3 at  0.50 uncertainties; 2 at  134.6; 4 at  135.6
  PASS  three generations within 2 uncertainties of 2.9963 +- 0.0074; two and four excluded by 5
 BATTERY-JSON: {"checks":14,"failures":0} *[a printed file, 28 lines, in the master and in the Journal edition]*

**Appendix D · Kernel lines of Appendix A.** Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own. *[a printed file, 35 lines, in the master and in the Journal edition]*
