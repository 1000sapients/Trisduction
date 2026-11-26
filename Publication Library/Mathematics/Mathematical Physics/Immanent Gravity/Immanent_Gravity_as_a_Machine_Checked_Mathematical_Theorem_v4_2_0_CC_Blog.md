# Immanent Gravity as a Machine-Checked Mathematical Theorem

## Einstein’s Equation Forced by Conservation, Newton’s as Its Half-Reading, and Four Dimensions Singled Out

**Mohammad F. Islam PhD** · 26 November 2026

*Blog edition of the master, edition 4.0.0 of 25 November 2026. It renders the whole text. The printed files of the appendices stand in the master and in the Journal edition, and are listed at the end.*

## Abstract

This paper proves, in Lean 4 with Mathlib, that conservation forces the law of gravity. Curvature is defined from a torsion-free metric connection on a Lie-Rinehart pair, with no curvature identity, symmetry or conservation law assumed. From that definition the file proves both Bianchi identities and the contracted identity, and proves that the curvature offers nothing to contract into a symmetric law except the Ricci curvature and the scalar curvature. The main theorem then states: if a law *a* Ric + *b* *R* *g* + *c* *g* has no divergence on every geometry, then *a* + 2*b* = 0, so the law is Einstein’s with a free vacuum term. The hypothesis is needed only on spacetimes of four dimensions with one time direction, and it is tested on an explicit one of non-constant curvature, on which every other ratio fails. Further results stand on the same curvature. The stress tensor of a scalar field has divergence equal to its field equation times its gradient, so the conservation the main theorem asks for is the matter’s own equation. The law reads a fluid in *n* dimensions as (*n*−3)*ρ* + (*n*−1)*p* along its time and *ρ* − *p* across it, which is *ρ* + 3*p* in four dimensions, and the two readings of matter at rest agree in four dimensions and in no other. The spherical vacuum solution is derived without assuming it static, on a connection proved torsion-free and metric: the law forces it static and forces 1 − 2*m*/*r*. Free fall in that solution is proved to conserve energy and angular momentum and to obey the equation of the orbit. The linearised vacuum law of a plane wave is derived from the Ricci curvature, and it has two polarisations, both tensor. A Fortran twin integrates the equation of the orbit for light past the Sun and for fifty orbits of Mercury, and integrates rival laws beside it. The forced law gives 1.7512 arcseconds and 42.99 arcseconds a century. A law whose space part reads nothing, a scalar-tensor law with *γ* = 0.99, and a scalar law are each excluded by measurement. The weak static field is derived as well: Newton’s equation is the time reading, and the potential of space obeys the same equation. Three classical theorems are cited and not formalised: Lovelock’s, Weyl’s, and the diagonal areal form of a spherical metric. Each is named where it is used, with a route for formalising it. Every premise of the paper is one field of one printed structure. A further kernel, in core Lean, proves what the weight counts. A reading counts a configuration when it gives no two members the same value. Every reading the particle map keeps, gravity’s among them on the premise that it reads the record, counts a configuration that holds the antiparticle of each member only if every member is neutral; nothing computed from the weight tells a charged particle from its antiparticle; and a reading that does tell them apart reads a charge. These statements hold for every reading and every set of values, so a reading proposed later is already inside them. The paper does not claim that the gravitational field is or is not quantized in the canonical sense. Part II carries the reading of gravity from which the paper takes its name, at premise grade and apart from the machine-checked claims.

## 1. The Theorem and What It Rests On

### 1.1 The statement

A geometry here is a commutative ring *A* of functions, a Lie ring *L* of vector fields that is a module over *A*, an action of fields on functions, a torsion-free connection, and a metric that the connection preserves. A frame is a finite family of fields, orthonormal up to sign, that resolves every field. The law with coefficients *a*, *b*, *c* is

Law(*Y*,*Z*) = *a* Ric(*Y*,*Z*) + *b* *R* *g*(*Y*,*Z*) + *c* *g*(*Y*,*Z*).

**Theorem (`conservation_on_every_geometry_forces_the_ratio`).** Let *a*, *b*, *c* be integers. If the divergence of the law vanishes on every geometry, in every frame and in every direction, then *a* + 2*b* = 0.

**Theorem (`conservation_on_every_spacetime_of_four_dimensions_forces_the_ratio`).** The same conclusion holds if the divergence vanishes only on geometries with a frame of four fields, exactly one of them of square minus one, over rings of functions in which 2*x* = 0 gives *x* = 0.

The second theorem has the weaker hypothesis and is the one the premises use. The coefficients are integers because the integers are the constants that every ring of functions has. A rational ratio reduces to an integer one by clearing denominators. For coefficients among the constants of one geometry, `conservation_forces_the_ratio` gives the same conclusion on that geometry.

**Theorem (`einstein_forced`).** On the premises below, on every geometry and in every frame,

2 Law(*Y*,*Z*) = *a* (2 Ric(*Y*,*Z*) − *R* *g*(*Y*,*Z*)) + 2*c* *g*(*Y*,*Z*).

The coefficient *a* is the coupling and *c* is the vacuum term. Neither is fixed by the theorem. The law is the one Einstein reached \[1\] and Hilbert obtained from an action \[5\]. The premises are met, and not only by the zero law: `einsteinPremises` constructs a term of the structure with *a* = 2, *b* =  − 1 and any *c*.

### 1.2 The premises, printed

The physical premises of the paper are the fields of this structure of the Lean file, and there are no others. The main theorem uses its first four fields. What is cited, and what a chart assumes, is in the table of Section 1.3.

``` lean
structure Premises where
  a : ℤ
  b : ℤ
  c : ℤ
  conserved : ∀ (A : Type) [CommRing A] (L : Type) [LieRing L] [Module A L] (G : Geom A L)
      (ι : Type) [Fintype ι] [DecidableEq ι] (F : Frame G ι),
      NoTwoTorsion A → Fintype.card ι = 4 → (Finset.univ.filter (fun i => F.pos i = false)).card = 1 →
      ∀ Z : L, divLaw G F (a : A) (b : A) (c : A) Z = 0
  weight : Particle → ℤ
  reads_record : ∃ f : Pt → ℤ, ∀ p : Particle, weight p = f (reg (seatOf p))
```

It carries three premises. The first is that the law is a member of the three-term family. The second is the field `conserved`: the law has no divergence on every spacetime of four dimensions with one time direction, over rings of functions without two-torsion. It asks nothing of geometries of any other dimension or signature. The third is the pair `weight` and `reads_record`: gravity reads the record, so the weight it gives a particle is some function of the registration of the particle’s point, with `Particle`, `reg` and `seatOf` the definitions of Part IX-b. The function is not named. Section 10 states what this premise means. No field of `Geom`, `Frame` or `Premises` states an identity of curvature or the conclusion of any theorem.

### 1.3 What is proved, what is cited, what is assumed

- **Curvature is tensorial; first and second Bianchi identities** · Standing: Proved; Where: Appendix A, Parts II, V
- **Contracted Bianchi identity, 2 div Ric = *d**R** · Standing: Proved; Where: Part VI
- **Pair symmetry of the curvature; Ricci symmetric** · Standing: Proved; Where: Part VI-b
- **Every contraction of the curvature is  ± Ric or zero; every full contraction  ± *R* or zero** · Standing: Proved; Where: Part VI-b
- **Conservation on every geometry forces *a* + 2*b* = 0; so does conservation on four-dimensional spacetimes alone** · Standing: Proved; Where: Parts VII to IX
- **The stress tensor of a scalar field is conserved exactly on its field equation** · Standing: Proved; Where: Part VII-b
- **Trace reversal; active density (*n*−3)*ρ* + (*n*−1)*p*; the readings agree only for *n* = 4** · Standing: Proved; Where: Part X-b

The table continues with the solutions, the waves, the weak field and the count.

- **On the premise that gravity reads the record: antimatter weighs as matter, weight does not see composition, and the weight is not the charge** · Standing: Proved, from the placement of Part IX-b and the field `reads_record`; the proofs are short; Where: Part XI
- **Every reading the particle map keeps counts a configuration closed under that map only if every member is neutral; nothing computed from the weight counts a charged pair; a reading that counts one reads a charge** · Standing: Proved, for every reading and every set of values, in the particle model of Appendix J; Where: Appendix J
- **The chart connection is torsion-free and preserves the metric** · Standing: Proved; Where: Appendices B, C
- **The spherical vacuum solution is static and is 1 − 2*m*/*r*, in the diagonal areal chart** · Standing: Proved; Where: Appendices B, C
- **Free fall in the solution conserves energy, angular momentum and the square of the velocity, and obeys *u*″ + *u* = *m**κ*/*L*² + 3*m**u*²** · Standing: Proved; Where: Appendix B
- **The linearised Ricci curvature of a plane wave on flat space** · Standing: Proved, to first order in the amplitude; Where: Appendix H
- **A plane wave of the linearised law has two polarisations, both tensor; the scalar mode is not a solution** · Standing: Proved, for one plane wave; the superposition of waves is not formalised; Where: Appendix H
- **The first-order Ricci curvature of a static weak field; Newton’s equation from the time reading; the potential of space equal to it** · Standing: Proved, to first order, static; the condition at infinity is not formalised; Where: Appendix I

What is not machine-checked is in the third table.

- **An invariant linear law is a combination of contractions** · Standing: Cited: Weyl \[4\]; Where: Section 4
- **A conserved law of second order in four dimensions is linear in the curvature** · Standing: Cited: Lovelock \[2, 3\]; Where: Section 4
- **A spherically symmetric metric has the diagonal areal form** · Standing: Cited: \[7, 8\]; Where: Section 8
- **The coordinate formula for the Ricci curvature, used in Appendices B, C, H and I, is the frame contraction of Appendix A written in a chart** · Standing: Standard dictionary, not formalised; Where: Section 8
- **The rival laws of Section 9: their optical indices, their weights *k*, the zero bending of the scalar law; and the isotropic form of the solution used by the first road for light** · Standing: Entered from the literature \[9, 12, 14\]; numerical, not machine-checked; Where: Section 9
- **Conservation of the source for all matter** · Standing: Premise, proved for the scalar field; Where: Section 6

The paper claims as machine-checked the rows marked proved and no others. A row marked cited is a theorem with a published proof that this work has not machine-checked. A row marked entered is a classical formula used by the numerical twin alone; no theorem rests on it. Part II, the reading, is outside this table: it is premise-grade and is labelled so where it begins.

## 2. Geometry as Algebra

Vector fields on a manifold form a Lie algebra that is also a module over the functions, and the two structures are tied by the Leibniz rule. That pair, a Lie-Rinehart pair \[13\], is all the differential geometry the argument of Sections 2 to 7 needs, and it is what the file of Appendix A formalises. Working at this level has a cost and a gain. The cost is that no manifold is constructed. The gain is that every theorem holds on every model of the axioms, the smooth one included, and that the proofs are identities in rings and modules that the kernel of Lean 4 \[16\] checks term by term, on the library Mathlib \[15\].

A connection is a map ∇ : *L* → *L* → *L*, additive in both arguments, with ∇_X*Y* − ∇_Y*X* = \[*X*,*Y*\]. Its curvature is the definition

ℛ(*X*,*Y*)*Z* = ∇_X∇_Y*Z* − ∇_Y∇_X*Z* − ∇_(\[X,Y\])*Z*.

The structure `Geom` adds the action of fields on functions, the two Leibniz rules, the function-linearity of ∇ in its first slot, a symmetric metric *g*, and compatibility, *X* *g*(*Y*,*Z*) = *g*(∇_X*Y*,*Z*) + *g*(*Y*,∇_X*Z*). The structure is inhabited. Part III builds a connection on any rational Lie algebra, Part IV specialises the Bianchi identities to derivations of a commutative algebra, and Part VIII builds a full geometry with a frame on the polynomial ring.

## 3. The Identities of Curvature

Nothing in this section is assumed. Each statement is a theorem of Appendix A.

**First Bianchi identity (`first_bianchi`).** ℛ(*X*,*Y*)*Z* + ℛ(*Y*,*Z*)*X* + ℛ(*Z*,*X*)*Y* = 0. The proof uses torsion-freeness and the Jacobi identity and nothing else. Its kernel line prints no use of choice.

**Second Bianchi identity (`second_bianchi`).** The cyclic sum of the covariant derivative of the curvature vanishes.

**Tensoriality (`curv_smul_left`, `curv_smul_mid`, `curv_smul_right`).** The curvature is linear over functions in each slot. The second-order terms cancel by the Leibniz rules.

**Antisymmetries (`Rm_antisymm12`, `Rm_antisymm34`).** With Rm(*X*,*Y*,*Z*,*W*) = *g*(ℛ(*X*,*Y*)*Z*,*W*), the form is antisymmetric in its first pair by definition and in its last pair by metric compatibility.

**Contracted Bianchi identity (`contracted_bianchi`).** In any frame, 2 div Ric(*Z*) = *Z*(*R*). The proof needs one lemma of independent use, `trace_commute`: for every bilinear form, the terms in which the covariant derivative falls on the frame cancel in the trace. A frame need not be parallel for traces to commute with differentiation.

## 4. There Is Nothing Else to Build a Law From

The family *a* Ric + *b* *R* *g* + *c* *g* is not chosen. Part VI-b proves that the curvature yields no other candidate by contraction.

**Pair symmetry (`pair_symm`).** Rm(*X*,*Y*,*Z*,*W*) = Rm(*Z*,*W*,*X*,*Y*). It is derived from the first Bianchi identity and the two antisymmetries by one explicit linear combination of fourteen instances, printed in the file. The combination yields twice the identity, so the theorem is stated on rings in which 2*x* = 0 gives *x* = 0.

**The six contractions (`contract_12` to `contract_34`).** The four slots of the curvature can be paired in six ways. Contracting slots one and two, or three and four, gives zero. Contracting one and four, or two and three, gives Ric. Contracting one and three, or two and four, gives  − Ric.

**The three full contractions.** Pairing the slots as (14)(23) gives *R*, as (13)(24) gives  − *R*, and as (12)(34) gives zero.

So a symmetric form made by contracting the curvature with the metric is a multiple of Ric plus a multiple of *R* *g*, and the metric itself supplies the third term.

**What remains cited.** Two classical theorems stand between this algebra and the statement that every admissible law lies in the family. Weyl’s first fundamental theorem for the orthogonal group \[4\] states that every invariant linear map from tensors to tensors is a combination of contractions with the metric. Lovelock’s theorem \[2, 3\] states that in four dimensions a symmetric, divergence-free tensor built from the metric and its first two derivatives is linear in the second derivatives, and so in the curvature. Both have complete published proofs. Neither is formalised here, and the paper does not claim them.

**A route for formalising them.** The work divides into four lemmas, each of which can be stated in Lean today. First, the jet lemma: a tensor concomitant of the metric of second order is a function of the metric and the curvature alone, by passing to normal coordinates. Second, the linearity lemma: the divergence condition forces the derivative of the concomitant with respect to the second derivatives of the metric to be divergence-free in its own right, which bounds its degree in the curvature by half the dimension. Third, the dimensional lemma: in four dimensions the one quadratic candidate that survives, the Gauss-Bonnet combination, has vanishing variation. Fourth, the invariant lemma: Weyl’s theorem for forms of the symmetry type of the curvature, which is a finite computation in the representation theory of the orthogonal group. The contraction table of this section is the output the fourth lemma must reproduce.

## 5. Conservation Forces the Ratio

**The divergence of the family (`twice_div_law`).** For constant *a*, *b*, *c*,

2 div Law(*Z*) = (*a*+2*b*) *Z*(*R*).

The term in *c* does not appear, because the metric is parallel. The proof is the contracted Bianchi identity and the resolution of a direction in the frame.

**On one geometry (`conservation_forces_the_ratio`).** If the ring has no zero divisors and the scalar curvature is not constant along some direction, a conserved law of the family has *a* + 2*b* = 0.

**The model geometry (Part VIII).** The hypothesis of non-constant curvature must be met somewhere, or the theorem would be empty. The file builds a geometry on pairs of rational polynomials, with bracket, connection and metric written out and every axiom of `Geom` proved, the Jacobi identity among them. It is the surface *d**x*² + *f*(*x*)² *d**y*² with *f*′/*f* = *x*, in its orthonormal frame, with fields whose coefficients depend on *x* alone. It has two dimensions. Its curvature is *K* =  − (1+*x*²) and its scalar curvature is  − 2(1+*x*²) (`model_scal`), whose derivative along the first field of the frame is not zero (`model_dScal_ne`).

**On every geometry (`conservation_on_every_geometry_forces_the_ratio`).** A law conserved on every geometry is conserved on the model, so *a* + 2*b* = 0 over the polynomials, and evaluation at a point carries the equation to the integers. The theorem has no hypothesis about any particular geometry. The converse is `the_forced_ratio_is_conserved_on_every_geometry`.

**A spacetime of four dimensions (Part VIII-b).** A law of physics is asked to be conserved on spacetimes, and the model above is a surface. Part VIII-b therefore builds a second geometry: the surface times a flat plane of one space and one time direction, *d**x*² + *f*(*x*)² *d**y*² + *d**z*² − *d**t*², with every axiom of `Geom` proved again. Its frame has four fields, one of square minus one (`model4_card`, `model4_one_time`), and its scalar curvature is again  − 2(1+*x*²) (`model4_scal`, `model4_dScal_ne`). On it every ratio but the forced one fails, so the hypothesis can be restricted to four-dimensional spacetimes (`conservation_on_every_spacetime_of_four_dimensions_forces_the_ratio`). This is the form the structure `Premises` carries.

## 6. The Source Is Conserved

The main theorem takes the conservation of the law as its hypothesis. The physical reason for that hypothesis is that the law is equated to a source and the source is conserved. Part VII-b proves the second half for a scalar field, with nothing about conservation assumed.

Let *φ* be a function and *μ* a constant. The Hessian H(*X*,*Y*) = *X*(*Y**φ*) − (∇_X*Y*)*φ* is symmetric because the connection has no torsion (`Hess_symm`). Let □*φ* be its trace and let *T* be the stress tensor, 2*T*(*Y*,*Z*) = 2 (*Y**φ*)(*Z**φ*) − *g*(*Y*,*Z*) (\|*d**φ*\|²+*μ**φ*²).

**Theorem (`div_T2`).** div (2*T*)(*Z*) = 2 (□*φ*−*μ**φ*) (*Z**φ*).

The derivative of \|*d**φ*\|² is computed through `trace_commute`, the same lemma that carries the contracted Bianchi identity. Three corollaries follow. A field on its equation has a conserved source (`field_equation_conserves_the_source`). Where the field varies, conservation of the source is the field equation (`conservation_is_the_field_equation`). A law of the family set equal to a constant multiple of *T*, with the field on its equation, has no divergence (`law_sourced_by_a_field_is_conserved`).

**What stays a premise.** One matter model is treated. That every form of matter has a conserved source is, in the classical account, a consequence of an action principle invariant under change of coordinates. That statement is not formalised here, and the field `conserved` of `Premises` carries it.

## 7. What the Law Reads: Newton’s Half and the Fourth Dimension

**Trace reversal (`trace_reversal`).** Let *n* be the number of fields of the frame. If 2 Ric − *R* *g* = *κ* *T*, then

(*n*−2) ⋅ 2 Ric(*Y*,*Z*) = *κ* ((*n*−2) *T*(*Y*,*Z*) − *g*(*Y*,*Z*) tr *T*).

The proof takes the trace of the law, tr(2 Ric−*R* *g*) = (2−*n*)*R*, which rests on Parseval’s identity in the frame and on tr *g* = *n*, both proved.

**A fluid.** For *T* = (*ρ*+*p*) *u* ⊗ *u* + *p* *g* with *g*(*u*,*u*) =  − 1, the right side is computed in closed form.

**Theorem (`active_density`).** Along the fluid’s own time the curvature reads (*n*−3)*ρ* + (*n*−1)*p*.

**Theorem (`space_reading`).** Along a unit direction at rest with the fluid it reads *ρ* − *p*.

In four dimensions the first is *ρ* + 3*p* (`active_density_in_four`). This is the density that Newton’s potential obeys, and it is half of what the law reads: the other half is the space reading, which a slow body does not feel and light does.

**Theorem (`space_reads_what_time_reads_iff`).** For matter at rest without pressure, the space reading equals the time reading exactly when (*n*−4)*ρ* = 0.

**Theorem (`weight_of_matter_at_rest`).** The time reading of such matter is (*n*−3)*ρ*.

So in three dimensions of spacetime a body at rest has no weight, and in four, and only in four, space reads exactly what time reads. The equality of the two readings is the statement that light is bent by twice the angle a Newtonian body would be. The step from the two readings to the two potentials is classical \[9, 14\]. Appendix I derives it.

**The static weak field (`static_ricci`).** Let the metric be flat plus a first-order static perturbation,  − (1+*ϵ**u*) on the time and (1−*ϵ**w*) on each direction of space, with *ϵ*² = 0. Newton’s potential is *u*/2 and the potential of space is *w*/2. The Ricci curvature given by the coordinate formulas is (1/2) *ϵ* times: ∇²*u* on the time component; zero between time and space; and *δ*ᵢⱼ∇²*w* + ∂ᵢ∂ⱼ(*w*−*u*) on space.

**Theorem (`newton_from_the_time_reading`).** Take the source in the same unit: the time component is (1/2) *ϵ* *q* when it reads *q*. If the time component reads *q*, then ∇²*u* = *q*. This is Poisson’s equation, and space is not consulted.

**Theorem (`space_potential_equals_time_potential`).** If the curvature reads *q* along time and *q* along every direction of space, as the forced law does for matter at rest in four dimensions, then ∇²*w* = *q* as well, and every second derivative of *w* equals that of *u*.

So Newton’s gravity is the time reading of the forced law, and the potential of space differs from Newton’s by a function with no second derivative. With both potentials vanishing far from the source that function is zero, the two potentials are equal, and their ratio *γ* is one. The condition far from the source is not formalised. Section 9 tests the same consequence a second way, by integrating the exact solution.

## 8. The Vacuum Solution

Appendices B and C leave the abstract setting for a chart: a field of functions with four commuting derivations, the Christoffel symbols and the Ricci curvature given by their coordinate formulas. The sine and cosine of the polar angle enter as two elements *s*, *c* with ∂_(θ)*s* = *c* and ∂_(θ)*c* =  − *s*, and nothing else about them is used.

**The connection is torsion-free and metric (`connection_is_torsion_free_and_metric`).** In each appendix the Christoffel symbols are proved symmetric in their lower indices, and the derivative of every component of the metric is proved equal to the two terms that metric compatibility requires. So the connection of the chart is the torsion-free metric connection of the printed metric, the object the main theorem is about. Its Ricci curvature is taken by the coordinate formula. That the coordinate formula is the frame contraction of Appendix A written in a chart is the standard dictionary between the two languages. It is two lines on paper and is not formalised. The statements hold in a field of functions, where a function that is not zero has an inverse; they say nothing at a point where *f*, *A* or *B* vanishes.

**The static form (Appendix B).** For the metric diag(−*f*,1/*f*,*r*²,*r*²*s*²) all sixteen components of the Ricci curvature are computed. Twelve vanish. The others are *f* (*f*″/2+*f*′/*r*),  − (*f*″/2+*f*′/*r*)/*f*, 1 − *f* − *r**f*′, and *s*²(1−*f*−*r**f*′).

**Theorem (`vacuum_iff`).** The Ricci curvature vanishes if and only if *r**f*′ + *f* = 1.

**Theorem (`vacuum_forces_schwarzschild`).** Under the vacuum law the function *m* = *r*(1−*f*)/2 is constant in all four coordinates and *f* = 1 − 2*m*/*r*, the solution of Schwarzschild \[6\]. The converse is `schwarzschild_is_vacuum`.

**Without assuming it static (Appendix C).** Let *A* and *B* be functions of the time and the radius, with metric diag(−*A*,*B*,*r*²,*r*²*s*²). Three identities are proved: *R*_tr = ∂ₜ*B*/(*r**B*); *R*_(θθ) = 1 − 1/*B* − (*r*/2*B*)(*A*′/*A*−*B*′/*B*); and *B* *R*ₜₜ + *A* *R*_rr = (*A*′*B*+*A**B*′)/(*r**B*), in which every time derivative has cancelled.

**Theorem (`birkhoff`).** If the Ricci curvature vanishes, then *B* does not depend on the time; *m* = *r*(1−1/*B*)/2 is constant in all four coordinates; 1/*B* = 1 − 2*m*/*r*; the product *A**B* depends on the time alone; and *A* = *A**B* (1−2*m*/*r*).

A product *A**B* that depends on time alone is a choice of clock. The solution is static because the law forces it. Five identities are closed by explicit certificates, two in Appendix B and three in Appendix C: each is reduced modulo the relations *x* *x*⁻¹ = 1 with the multipliers written out. The multipliers were found by computer algebra and are checked by Lean’s ring arithmetic. The generator is not trusted and is not part of the proof.

**Free fall (`orbit_equation`).** A field of velocities is in free fall when its derivative along itself is given by the Christoffel symbols of Appendix B. For such a field the energy *f* *ṫ*, the square of the angular momentum *r*⁴(*θ̇*²+*s*²*φ̇*²) and the square of the velocity in the metric are constant along the fall (`energy_conserved`, `angSq_conserved`, `speedSq_conserved`), and together they give the radial equation (`radial_equation`). In the solution *f* = 1 − 2*m*/*r*, with *u* = 1/*r*, *L* the angular momentum and *κ* minus the square of the velocity, the orbit obeys

*u*″ + *u* = *m**κ*/*L*² + 3 *m* *u*²,

the primes being derivatives in the angle of the orbit, defined as the angle whose rate along the fall is *L**u*². In the equatorial plane that rate is *φ̇*. For a planet *κ* = 1 and for light *κ* = 0. Under the vacuum law no form of *f* is assumed (`free_fall_in_the_vacuum_solution`). The statement is for a field of velocities, where the angular momentum does not vanish.

**What is assumed.** That a spherically symmetric metric can be brought to this diagonal form with *r* the areal radius is classical \[7, 8\] and is not formalised. The route is short. The orbits of the rotations are spheres, and their area defines *r* where its gradient does not vanish. The metric on the two remaining coordinates then has one cross term, and a one-form in two variables has an integrating factor, which defines the time that removes it.

## 9. The Numerical Twin

The twin of Appendix D does not evaluate the formulas of general relativity. It integrates paths, and beside the forced law it integrates rivals.

**Light.** A ray obeys *d**v*/*d**s* = ∇ln *n* − (*v*⋅∇ln*n*) *v* in the optical index of the static metric. For the exact solution in isotropic coordinates *n* = (1+*m*/2*r*)³/(1−*m*/2*r*). A rival whose space part is weighted by *γ* has *n* = \[(1+2*γ**m*/*r*)/(1−2*m*/*r*)\]^(1/2). The ray runs from ten thousand solar radii before the Sun to ten thousand after, by fourth-order Runge-Kutta. The isotropic form of the solution is the classical change of radial coordinate and is not formalised, so the exact solution is integrated a second way that uses none of it: the orbit equation of Section 8 with *κ* = 0, from the point of closest approach to *u* = 0. The two roads share the mass and the impact parameter and no equation.

**Mercury.** For the forced law the orbit obeys the equation of Section 8 with *κ* = 1 and 1/*p* = *m*/*L*², a theorem of Appendix B. The rivals obey *u*″ + *u* = 1/*p* + 3*k* *m* *u*² with *k* = (2+2*γ*−*β*)/3 in the standard parameters \[9\], a cited form; the forced law has *k* = 1. Fifty orbits are integrated.

- **Light at the limb, arcsec** · Forced law: 1.75120 by both roads; Rival: 0.87560 (space part reads nothing, *γ* = 0); Measured: 1.75033 to 1.75173 \[10\]
- **** · Rival: 1.74245 (scalar-tensor, *γ* = 0.99)
- **** · Rival: 0 (scalar law \[12\], not integrated)
- **Mercury, arcsec a century** · Forced law: 42.993; Rival: 14.339 (*γ* = 0, *β* = 1, *k* = 1/3); Measured: 42.98 ± 0.04 \[9\]
- **** · Rival: − 7.151 (scalar law, *γ* =  − 1, *β* = 1/2)
- **Divergence on the model geometry at *x* = 1** · Forced law: 0; Rival: − 2 (Ricci alone);  + 2 (ratio 1 :  − 1)

Ten checks pass and none fails. The forced law lies inside two printed uncertainties of each measurement and each rival lies outside five. Three limits are stated. The zero bending of the scalar law is a classical fact entered by hand, since its metric is conformally flat, and nothing is integrated for it. On the two-dimensional model the forced combination 2 Ric − *R* *g* vanishes identically, so its conservation there is printed as a note and is not counted as a check; the checks are the rivals, which are not conserved. The twin tests the solution of the forced law against rivals. It is not a new prediction, and the agreement of general relativity with these measurements was known.

## 10. Discussion: The Immanent Reading

The derivation above uses only differential geometry. This section states the reading from which the paper takes its name, and marks what in it is theorem and what is premise. The word reading is used in two ways and the context separates them. In Section 7 a reading is the number the curvature returns for a source, along time or across it. Here and in Part II the reading is the account of why gravity is geometry, and within it a reading of the record is a function of a registered point.

**Why geometry.** Part IX-b of Appendix A models a particle by an integer charge and an integer energy and places it on the plane at the point (side, height) = (1 + charge, energy). The reflection of the plane in the line of side one exchanges a particle with its antiparticle. Registration is the projection onto that line. The premise is that gravity reads the record: its reading of a particle is some function of the registration of the particle’s point. It is the field `reads_record` of `Premises`. On that premise three statements are theorems for every such function. The reading does not change under exchange of particle and antiparticle (`every_reading_of_the_record_is_blind_to_charge`). Two particles of equal energy receive the same reading (`every_reading_of_the_record_is_blind_to_composition`). No such function returns the charge (`no_reading_of_the_record_returns_the_charge`). On the premises they give `Premises.antimatter_weighs_as_matter`, `Premises.weight_is_blind_to_composition` and `Premises.weight_is_not_the_charge`. These theorems follow from the placement of the particle and the premise, and they are short. Their content is the premise, stated openly: a reading that is blind to what a body is made of is a property of the arena and not of the body, and a property of the arena is geometry. This is the equivalence principle, reached from the record.

**Why conservation.** In the same reading nothing leaves the record, so what gravity reads is conserved, and a law equated to it must have no divergence on every spacetime. Section 6 proves the conservation for the scalar field from the field’s own equation. The reading supplies the reason it should hold for all matter. That reason is the field `conserved`.

**What the paper does not claim.** It does not derive the coupling or the vacuum term. Both are free in `einstein_forced`. It does not claim that general relativity was unknown or untested. It claims that the form of its law, within the family, is forced by conservation, that the family is all that contraction can produce, and that each of these statements compiles. The fuller account of the reading, with its consequences for clocks, for radiation and for the dark sector, is Part II, Section 12, carried from \[17\]. No theorem of Sections 2 to 9 depends on it.

### 10.1 What Gravity Counts

The first blindness theorem says that, on the premise that gravity reads the record, the particle map keeps gravity’s reading. This section proves what follows from that alone, for gravity’s reading and for every reading of the same kind. The kernel is Appendix J, in core Lean with no import. Its particle carries four additive charges and an energy; the particle map reverses every charge and keeps the energy; a particle is neutral when every charge is zero; the weight is gravity’s reading of the frequency of the energy, which has a frequency and a rate. That the weight is kept holds in this model by its definition, which writes the premise in. It is a second model beside the one-charge particle of Part IX-b, and it is printed whole. It is a model of one particle and its weight: the reading of a fluid, with its pressure, is Section 7 and is not modelled here.

**One definition.** A reading *counts* a configuration when it gives no two of its members the same value. A configuration is *quantized by* a reading when that reading counts it. Where this paper says quantized by a reading, nothing else is meant: no commutation relation, no constant, no operator, and no claim that the values of a reading are isolated. The canonical sense is named canonical wherever it is meant.

**Theorem** (`a_kept_reading_counts_only_the_line`). Let *φ* be any map of any set, and *r* any reading with *r*(*φ**a*) = *r*(*a*) for every *a*. If a configuration is closed under *φ* and *r* counts it, then *φ* fixes every member.

**Theorem** (`every_kept_reading_counts_only_the_neutral`, `gravity_counts_only_the_neutral`). Let *r* be any reading of particles, with values in any set, that the particle map keeps. If a configuration holds the antiparticle of each of its members and *r* counts it, every member is neutral. Gravity’s reading is such a reading (`the_weight_is_kept`), so the weight counts matter with its antimatter only where all of it is neutral.

**Theorem** (`nothing_computed_from_the_weight_counts_a_charged_pair`). Let *f* be any function of the weight, into any set. In a configuration that holds one charged particle with its antiparticle, the reading *f* of the weight does not count the configuration. The general fact is `nothing_computed_from_a_reading_counts_more`: a function of a reading counts no more than the reading does.

**Theorem** (`to_count_a_charged_pair_a_reading_must_see_the_particle_map`, `a_reading_that_tells_the_pair_apart_reads_a_charge`, `the_charges_tell_a_charged_pair_apart`). If a reading counts a configuration that holds a charged particle with its antiparticle, it gives the two different values, so the particle map does not keep it. A reading that gives a particle and its antiparticle different values is not a function of the energy alone, since every function of the energy alone is kept (`a_reading_of_the_energy_alone_is_kept`); a particle is its charges and its energy, so the reading reads a charge. The charges are such a reading: those of a charged particle and of its antiparticle differ.

Six statements are bound in one term, `what_gravity_counts`, with nothing before the colon: the weight is kept; a kept reading counts a configuration of matter with its antimatter only if all of it is neutral; nothing computed from the weight counts a charged pair; a reading that counts one gives the pair two values; the charges tell the pair apart; and a charged pair exists in the model. A charged particle with its antiparticle exists in the model, two particles on one weight (`a_charged_pair_is_two_on_one_weight`). The converse on gravity is not claimed, and in the model it is false: two neutral particles of one frequency and different rates are two on one weight (`the_weight_does_not_tell_all_the_neutral_apart`).

**What this settles.** The theorems quantify over every reading and every set of values, so they do not wait for a reading to be proposed. Three cases exhaust what a proposal can be. If the particle map keeps its reading, a configuration of matter with its antimatter is quantized by that reading only if all of it is neutral. If its reading is computed from the weight, by any rule, it tells no charged particle from its antiparticle. If it does tell them apart, it reads something the particle map reverses, and that is not gravity’s reading. A scheme that counts matter with its antimatter by gravity’s reading alone is therefore confined to the neutral, and a scheme that counts a charged particle apart from its antiparticle does so by a reading that is not gravity’s. Either way it is a case of this section, and no further theorem is needed for it. The theorem on a general seat, of which the first statement above is the core, is the subject of a companion paper \[23\].

**What this does not settle.** The canonical quantization of the gravitational field is a different question, with operators and a constant that this kernel does not contain, and nothing here decides it. A proposal of that kind meets this section only where it supplies a reading of particles: then the three cases apply to that reading. Whether the field has quanta is for experiment. The model has its own limits, stated in Appendix J: the charges are additive integers, and the particle map reverses every one of them.

## 11. Predictions, Falsifiers, and What Stands

The paper recovers general relativity. It predicts no measurement that general relativity does not, derives no constant, and says nothing of quantum gravity. Its commitments are therefore those of the forced law, and they are stated here as commitments: three that the paper says will stand at any future precision, two present proposals it says will fail, and the three observations that would refute it.

### 11.1 Three predictions that will stand

1.  **Antimatter falls as matter, exactly.** `every_reading_of_the_record_is_blind_to_charge` gives one reading to a particle and its antiparticle. The free-fall acceleration of antihydrogen equals that of hydrogen, with no deviation at any precision. The present measurement is 0.75 ± 0.13 ± 0.16 of *g* \[19\]. The prediction is that the central value moves to 1 as the uncertainty falls to a percent and below.
2.  **Space reads what time reads: *γ* = 1, exactly.** `space_reads_what_time_reads_iff` gives equal readings in four dimensions, and `space_potential_equals_time_potential` carries the two readings to the two potentials whose ratio is *γ*. The exact solution of Section 8, integrated in Section 9, has *γ* = 1 as well. The present bounds are *γ* − 1 = (2.1±2.3) × 10⁻⁵ from the Cassini radio link \[18\] and *γ* = 0.9998 ± 0.0004 from the deflection of radio waves \[10\]. The prediction is that no experiment finds *γ* − 1 different from zero.
3.  **Free fall does not see composition, at any precision.** `every_reading_of_the_record_is_blind_to_composition` forbids it. The present bound on the difference of free fall of titanium and platinum is (−1.5±2.3±1.5) × 10⁻¹⁵ \[11\]. The prediction is that successors of that experiment find zero.

### 11.2 Two proposals that will fail

1.  **A new second-order law of gravity in four dimensions.** Section 4 proves that contraction of the curvature yields only the Ricci and scalar curvatures, and Lovelock’s theorem \[2, 3\] closes the family. A proposal of a further second-order metric law in four dimensions, such as the four-dimensional Gauss-Bonnet law obtained by a limit of the dimension \[21\], cannot be a law of the metric alone. The paper predicts that every such proposal either reduces to the forced law or is found to carry a further field. For the proposal named, that finding is already in the literature \[22\], so for it the statement is a retrodiction. The prediction is for the proposals still to come.
2.  **A scalar or vector polarization of gravitational waves.** The forced law is Einstein’s. Appendix H proves that a plane wave of its linearised vacuum law has exactly two polarizations, plus and cross: every solution is a combination of the two up to a change of coordinates (`two_polarisations`), no change of coordinates produces either from nothing (`the_two_are_physical`), and the scalar mode that stretches both transverse directions is not a solution (`breathing_is_not_a_wave`). The linearised law is not entered. `linearised_ricci` derives it: for the metric that is flat plus a first-order plane wave, the Ricci curvature given by the coordinate formulas equals the wave profile’s second derivative times the expression whose vanishing is the law. The result is for one plane wave; a general wave is a sum of such waves, and that superposition is not formalised. A scalar-tensor law, which Section 9 excludes at *γ* = 0.99 by the bending of light, would carry a third. The paper predicts that no detector network finds a polarization that is not tensor. The first test with three detectors favoured tensor over vector and over scalar \[20\].

### 11.3 The three falsifiers

Each is a forbidden observation. No observation breaks a theorem; each refutes a premise, or the forced law as the law of nature, and each names the theorem that carries the consequence. The threshold in each case is five of the experiment’s printed uncertainties.

1.  **Free fall that sees what a body is.** A difference in free fall between two compositions, or between matter and antimatter, refutes the field `reads_record` of `Premises`, that gravity reads the record; the two blindness theorems of Part XI are what that premise implies.
2.  ***γ* ≠ 1.** It refutes the forced law as the law of gravity: its exact spherical solution has *γ* = 1 (Sections 8 and 9), and `space_reads_what_time_reads_iff` gives equal readings in four dimensions.
3.  **A polarization of gravitational waves that is not tensor.** It refutes the forced law as the law of gravity, since the forced law has none (`two_polarisations`).

These three replace the falsifiers of earlier editions. Apart from them stands the formal claim, which no observation touches and one compilation settles: every theorem named in this text prints its axioms in Appendix F, and a line that names an axiom other than `propext`, `Classical.choice` and `Quot.sound`, or a file that fails to compile under Lean 4.19.0 and Mathlib 4.19.0, refutes the claim that the statements are proved.

### 11.4 What kind of result this is

It is not a new physics. It is a change in how a physical derivation can be checked. The derivation of the law of gravity from conservation is here a single file whose every step the kernel has verified, whose every assumption is one field of one structure, and whose numerical consequences are integrated beside those of its rivals. A reader who doubts a step can name the line.

The implication from `Premises` to the forced law is checked by the Lean kernel, and so are the trace reversal of that law, its spherical vacuum solution, its weak static field and the polarisations of its plane waves. No experiment and no later revision of physics alters an implication. Experiment remains free to test whether nature satisfies the premises, and that is all it can test here. What the kernel certifies is the Lean statements; that the definitions of the file say what this text says they say is for the reader to check, and the structure `Premises` is printed for that purpose. What stands is the table of Section 1.3.

## 12. Part II · The Reading

*This part is the reading from which the paper takes its name. It is carried from edition 2.0.0 (Islam, 2026a) and is premise-grade. It is not among the machine-checked claims of Section 1.3, and no theorem of Sections 2 to 9 depends on it. The theorem names set in code in this part, and the twin it quotes, are those of edition 2.0.0 and are printed there, not here. Where this part calls a statement a theorem, the statement follows from the placement of the reading, which is its premise.*

### 12.1 The Reader’s Frame

This Part gives gravity its reading on the seat.

It claims that gravity is immanent: the substrate reading its own record. Three consequences follow at the seat. Gravity is an after-effect of existence, since a record comes after the act it records. Gravity and time co-move, since one gravitational shift moves every clock at a place together and neither causes the other. Gravity is the monic memory of privation, since the deficit of every bond is read and no two different deficits read alike. These readings are structural; the theorems that carry their content are exact, and the measurements that corroborate them are cited.

It refuses two things. The reading does not derive Einstein’s equations. Sections 3 to 9 of this paper force their form. It does not claim that the gravitational field is or is not quantized in the canonical sense, which no experiment has decided. What gravity’s reading counts is a different statement, and it is a theorem of this edition, in Section 10.1. A reader who arrives from the conventional frame will scan this paper for a new dynamics, find none, and be tempted to report the absence. None was attempted: the immanent reading predicts exactly what general relativity predicts, and its content is the typing.

**Negative warrants.** Two, stated so that no reader supplies them. No physical fact here is read as a proof of a mathematical sentence: a corroboration joined to a claim takes the weaker grade. In the reading no field equation is derived, and nowhere is a constant computed from first principles: *G*, *c* and the masses enter as measured or as defined.

**Five terms.** A *reading* is any quantity an instrument returns from a state, *odd* under a map that flips its sign and *even* under one that keeps it. *Registration* is the map (*h*,*t*) ↦ (1,*t*) that keeps a point’s height and forgets its side. A reading *factors through registration* when it depends on the height alone. The *fixed set* of a map is the set of points it leaves unchanged. A *keyed bit* is a yes-or-no property no function of a given record decides.

### 12.2 The Spine

The seat has a mirror and a record. The mirror is a reflection of the plane, *s* ↦ 1 − *s̄*, and the points it leaves fixed form one line, the fixed line. A point has a height along the line and a side off it. Registration keeps the height and forgets the side, and it erases nothing exactly when nothing stands off the line. Gravity has that shape. The particle map exchanges a particle with its antiparticle and flips every charge. This paper reads it: gravity as the reading of the record in Section 12.3, its one sign in Section 12.4, its reversibility in Section 12.5, its shift of every clock in Section 12.6, its memory of the deficit in Section 12.7, its reading of light and of the dark in Section 12.8, and its waves in Section 12.9.

**Why this carrier, and not another.** The carrier is not chosen. Spaces with an involution and the maps that respect them form a category (`equivariant_id`, `equivariant_comp`), and the fixed set is a functor on it (`fix_functorial`); an equivariant map into the seat, whose fixed set is the line (`fold_global_seat`), lands every physical fixed point on the line (`equivariant_carrier_lands`). Gravity needs no carrier of its own. Its reading is the height, so it is equivariant for the particle map and for the fold with nothing to carry (`gravity_even_branch`, `gravity_factors_through_registration`), and applied to the particle map’s odd part it lands every source on the line (`every_source_on_the_line`). The one map gravity adds is the gravitational shift, and it commutes with the fold and with registration (`redshift_equivariant`, `redshift_commutes_with_registration`).

**The correspondence matrix.**

- **antimatter falls as matter** · Element of the seat: the reading even under the particle map; Lean theorem: `gravity_even_branch`; Fortran check: 2665 of 2665; ALPHA-g
- **every body falls alike** · Element of the seat: the reading factors through registration; Lean theorem: `gravity_factors_through_registration`, `composition_blind`; Fortran check: 2665 of 2665
- **universality stronger than symmetry** · Element of the seat: evenness is not the record; Lean theorem: `even_is_not_the_record`; Fortran check: structural
- **positive mass** · Element of the seat: every source on the line; Lean theorem: `every_source_on_the_line`, `charged_source_off_the_line`; Fortran check: 2665 of 2665
- **no gravitational shield** · Element of the seat: one sign, no screening; Lean theorem: `one_sign_no_screening`, `charge_can_be_screened`; Fortran check: 1834 neutral charge sets, 0 massless mass sets
- **a planet’s orbit** · Element of the seat: conservative motion, reversible; Lean theorem: `conservative_motion_reversible`, `motion_retraces`; Fortran check: ten revolutions; retrace 5.2e-10
- **gravitational redshift** · Element of the seat: the height moved, the side kept; Lean theorem: `redshift_equivariant`, `redshift_keeps_the_line`, `redshift_commutes_with_registration`; Fortran check: tower 2.455e-15; clocks 3.60e-17
- **every clock shifted alike** · Element of the seat: ratios kept: gravity and time co-move; Lean theorem: `clocks_co_move`; Fortran check: 10000 pairs to 3.3e-16
- **the mass defect** · Element of the seat: the deficit read monically; Lean theorem: `gravity_reads_the_deficit`, `the_bond_weighs_less`; Fortran check: binding falls to 5.0e-12
- **light bent, gravity at light’s speed** · Element of the seat: the massless cone; Lean theorem: `massive_slower`; Fortran check: 1.7512″; 4.2e-16
- **two polarizations** · Element of the seat: the radiation’s one bit; Lean theorem: `waves_two_polarizations`, `polarization_count`; Fortran check: 10 − 4 − 4 = 2
- **the binary pulsar** · Element of the seat: the waves carry energy away; Lean theorem: import (Peters and Mathews, 1963); Fortran check: −2.4021e-12
- **dark matter** · Element of the seat: the fixed set, read by gravity alone; Lean theorem: `only_gravity_reads_the_dark`, `odd_reading_blind`; Fortran check: structural
- **the accelerating expansion** · Element of the seat: the vacuum’s pressure reverses the pull; Lean theorem: `the_vacuum_repels`, `one_sign_of_energy_not_of_pull`, `kinetic_floor`; Fortran check: q0 = −0.527; z = 0.63, 0.295

### 12.3 Gravity Reads the Record

Gravity couples to energy and momentum and to nothing else: not to charge, not to colour, not to the composition of a body. The engine reads this at the seat. The gravitational reading of a particle is its energy (`grav`), which the particle map leaves unchanged, so antimatter reads as matter (`gravity_even_branch`); on the chart the reading is the height, which registration keeps and the fold keeps (`gravity_factors_through_registration`); and two particles of one energy read alike whatever their charges (`composition_blind`). Gravity is registration read as a force.

The two properties are not one. A reading can be even under the fold and still read the side: the squared distance from the line is unchanged by the fold and changed by registration (`even_is_not_the_record`). So the equivalence principle says more than symmetry under the particle map. Antihydrogen falling downward, at (0.75±0.13±0.16) *g* with repulsion excluded, tests the weaker property (ALPHA-g, 2023). Titanium and platinum falling alike to \|*η*\| &lt; 4.2 × 10⁻¹⁵ tests the stronger one (MICROSCOPE, 2022). The stronger property is forced for any massless spin-two field by the low-energy theorem that such a field couples to every source through one constant (Weinberg, 1964), an import the seat reads as registration.

### 12.4 One Sign: Every Source on the Line, No Screening

Apply the particle map’s odd part to a reading: for charge it is twice the charge, and a charged source lands off the line (`charged_source_off_the_line`); for gravity it is zero, and every gravitational source lands on the line (`every_source_on_the_line`). Gravity has no off-line source: it has one sign.

One sign has a consequence charge lacks. Sources of one sign total zero only when every source is zero (`one_sign_no_screening`), while a unit charge and its opposite total zero (`charge_can_be_screened`). An atom is neutral and a Faraday cage screens a field; nothing screens gravity. The twin finds 1834 neutral sets among 20000 random sets of four nonzero charges and not one massless set among 20000 nonempty mass sets. The total mass-energy of an isolated system is nonnegative by theorem under the dominant energy condition (Schoen and Yau, 1979; Witten, 1981). Quantum fields admit local negative energy densities, the Casimir effect among them, bounded by quantum inequalities; no body of negative gravitational mass is known. A negative gravitational mass (Bondi, 1957) would create an off-line source and a bit for gravity; it would be a case of the first falsifier of Section 11.3.

One sign is a sign of energy, not of pull. Gravity reads pressure as well as density, and the active gravitating density of a fluid is *ρ* + 3*p* (Section 7, `active_density_in_four`): dust attracts, and the vacuum, with *p* =  − *ρ*, repels with active density  − 2*ρ* (`the_vacuum_repels`). Every density stays positive while the pull reverses (`one_sign_of_energy_not_of_pull`), so the vacuum’s repulsion is no screening, which would need a negative energy. For a canonical field, *ρ* + *p* is twice the kinetic density and never negative (`kinetic_floor`), the floor that excludes a phantom equation of state. The sign of the vacuum’s pull is read from the sky, not forced: the flat Planck budget gives *q*₀ =  − 0.527, where an all-matter budget gives  + 0.5, the acceleration beginning at redshift 0.63 and the vacuum overtaking matter at 0.295 (Planck, 2018; the twin of edition 2.0.0).

### 12.5 No Bit, and Reversible

A reading with no off-line source has no two worlds to separate and no bit to register, and its motion keeps no record. The engine proves this for motion itself. Write conservative motion under any force law *f* as the Störmer–Verlet step on two successive positions, (*x*_(n − 1),*x*ₙ) ↦ (*x*ₙ, 2*x*ₙ−*x*_(n − 1)+*f*(*x*ₙ)), and time reversal as their exchange. For every force law, reversing, stepping and reversing undoes a step exactly (`conservative_motion_reversible`), and any number of steps is retraced by the same number of backward steps (`motion_retraces`). The twin integrates a Kepler orbit of eccentricity one half for ten revolutions, keeping its energy to 4.3 × 10⁻⁶, then reverses it and finds its start again to 5.2 × 10⁻¹⁰. Nothing was committed, so nothing was paid: the reversible branch, floor zero and never cost zero.

Reversibility alone does not keep a reading on the line: a reversible flow can leave it. What keeps gravity there is its one sign.

### 12.6 Gravity and Time Co-Move: The Height Moved, Never the Side

A clock deeper in a gravitational potential runs slower, by *Δ**ν*/*ν* = *g**h*/*c*² near the Earth. On the seat a gravitational shift multiplies every height by one factor and leaves the side alone (`redshift`). It commutes with the fold (`redshift_equivariant`), keeps a point on the line exactly when it was on it (`redshift_keeps_the_line`), and commutes with registration (`redshift_commutes_with_registration`): gravity moves the record and never the side.

Because the factor is one for every mode at a place, every ratio of frequencies is kept (`clocks_co_move`): gravity does not slow a particular clock, it moves every clock together. This is the reading in which gravity and time co-move and neither causes the other. The twin computes 2.455 × 10⁻¹⁵ for the 22.5 m tower (Pound and Rebka, 1960; confirmed to 1% by Pound and Snider, 1965) and 3.60 × 10⁻¹⁷ for two optical clocks 33 cm apart (Chou, Hume, Rosenband and Wineland, 2010). Clocks of different kinds shift alike: a hydrogen maser flown on a rocket agreed with the prediction to parts in 10⁴ (Vessot et al., 1980), and two Galileo satellites in eccentric orbits to 2.5 × 10⁻⁵ (Delva et al.; Herrmann et al., 2018).

### 12.7 The Monic Memory of the Deficit

A bound system weighs less than its parts by its binding energy. The engine reads a bound pair’s weight as the parts’ energies less the binding: a positive binding reads below the sum (`the_bond_weighs_less`), and two bindings read alike exactly when they are equal (`gravity_reads_the_deficit`). The reading of the deficit is monic, injective, keeping every privation distinct. This is the sense in which gravity is the monic memory of privation: it reads what a bond has given up, and it forgets none of it.

The deficit is measured. Nuclear binding is 0.936% of the mass of titanium and 0.851% of platinum, a difference of 8.55 × 10⁻⁴; MICROSCOPE finds the two falling alike to 4.2 × 10⁻¹⁵, so the binding deficit falls with the rest of the mass to 5.0 × 10⁻¹² of itself (the twin of edition 2.0.0). The Earth’s and the Moon’s own gravitational binding fall alike too, tested by lunar laser ranging (Williams, Turyshev and Boggs, 2004).

### 12.8 Gravity Reads Light, and Only Gravity Reads the Dark

Gravity reads light’s energy and bends its path: a ray grazing the Sun turns by 1.751 arcseconds, twice the Newtonian angle because the time and the space parts of the metric bend it equally (Dyson, Eddington and Davidson, 1920; Cassini finds *γ* − 1 = (2.1±2.3) × 10⁻⁵, Bertotti, Iess and Tortora, 2003). Light is the substrate’s one excitation fixed by both involutions at every frequency, the companion paper on light proves (Islam, 2026c); gravity reads it as it reads everything, by its record. The waves of gravity and the waves of light, both massless (`massive_slower` for anything that is not), arrived together from GW170817 after 130 million years, to 4.2 × 10⁻¹⁶ of their speed. That gravity is prior to light, innate to the substrate rather than produced by any one carrier, is carried at structural grade: gravity reads every carrier, light included, and needs none of them to act.

The same reading explains why the dark sector is seen only through gravity. Least Erasure proves (Islam, 2026a) that a state is invisible to every charge-linear reading exactly when the particle map fixes it, and that on such a state only the mass reading remains. The engine carries the core of that result: a state the particle map fixes carries no charge, every odd reading returns zero on it, and gravity returns its energy (`odd_reading_blind`, `only_gravity_reads_the_dark`). Gravity is the one reading of the record, so it is the one reading that sees a state with nothing but a record. The rotation of galaxies (Rubin and Ford, 1970), the separation of mass from gas in the Bullet Cluster (Clowe et al., 2006) and a cold-dark-matter density 5.37 times the baryonic one (Planck, 2018) are gravity reading the fixed set. Whether that fixed set also carries a dark gauge charge is one keyed bit, as Least Erasure proves, and gravity cannot read it.

### 12.9 The Waves: Two Polarizations and the Decay of an Orbit

A symmetric tensor has ten components; four gauge conditions and four constraints leave two polarizations (`polarization_count`). Parity exchanges them and keeps the frequency (`waves_two_polarizations`): the radiation carries the one bit light carries, while the sources carry none. The waves carry energy away: the twin computes the orbital decay of the binary pulsar PSR B1913+16 from its period, eccentricity and masses as  − 2.4021 × 10⁻¹² (Peters and Mathews, 1963), against the general-relativistic  − 2.4026 × 10⁻¹² and the observed ratio 0.9983 ± 0.0016 (Hulse and Taylor, 1975; Weisberg and Huang, 2016). Mercury’s perihelion advances 42.98 arcseconds a century, computed from the constants in the twin of edition 2.0.0.

### 12.10 What Gravity Carries, and What It Does Not

Gravity carries the record. It reads the height of every configuration and nothing of its side; it has one sign of energy, so every source stands on the line and none is screened; its motion retraces exactly and commits nothing; its shift moves every clock together; its reading of a bond’s deficit is monic; it alone reads the dark. That is the content of the immanent reading, and every clause of it is a theorem about the seat or a measurement at its grade.

The seat gives a typing: gravity is neither an agent added to matter nor a medium’s collective mode but the substrate’s own registration read as a force. The immanent, the emergent and the fundamental readings predict alike for every experiment cited here. At structural grade and no higher, the seat reads why gravity has resisted canonical quantization: on that reading canonical quantization is the priced registration of a bit, and a reading with no off-line source has none to register. A gravitationally mediated entanglement experiment would sharpen that reading without moving the typing. The part of that reading which is a theorem is now proved, in Section 10.1 and Appendix J: no reading the particle map keeps, and nothing computed from the weight by any rule, tells a charged particle from its antiparticle, and a reading that does tell them apart reads a charge, which on the premise gravity does not. That holds for every reading, so for any proposed after this paper. The account of the resistance stays at structural grade.

### 12.11 Falsifiers and Owed Deeds

The falsifiers of the reading are merged into Section 11.3 of this edition, which carries the paper’s three. The falsifier on clocks of edition 2.0.0, two clocks of different kinds shifted by different factors at one place, is a case of the first of them: a free fall that sees what a body is.

One experiment would sharpen a reading without moving the paper’s standing: gravitationally mediated entanglement between two masses in superposition (Bose et al., 2017; Marletto and Vedral, 2017).

## 13. Closure

The derivation of the law of gravity is no longer informal prose. From a torsion-free metric connection and nothing more, Lean 4 with Mathlib compiles both Bianchi identities, the contracted identity, the exhaustion of the contractions of the curvature, the conservation of the scalar field’s stress tensor on its own equation, the forcing of Einstein’s law, the trace reversal with its two readings, the two polarisations of a plane wave, and the spherical vacuum solution, static because the law makes it so. No axiom is declared. No proof is left open. No headline theorem closes by its own hypothesis or over a structure that carries its conclusion.

General relativity is recovered as the one conserved member of the three-term family, with the coupling and the vacuum term left free. Newton’s gravity is recovered as its time reading alone, which does not see the space reading that doubles the bending of light in four dimensions and in no other. The numerical twin integrates light past the Sun and fifty orbits of Mercury in the derived solution, lands inside two uncertainties of each measurement, and puts every rival it tests outside five.

What gravity counts is settled in the same way. On the premise that gravity reads the record the particle map keeps the weight, and from that alone the kernel of Appendix J proves three statements for every reading and every set of values. A reading the particle map keeps counts matter with its antimatter only where all of it is neutral. Nothing computed from the weight, by any rule, tells a charged particle from its antiparticle. A reading that tells them apart reads a charge. Quantization by a reading, in the one sense this paper defines, is thereby decided for gravity’s reading and for every reading of its kind, those not yet written included: in matter with its antimatter the weight alone counts nothing charged, and whatever tells a charged particle from its antiparticle is not the weight. A later proposal needs no new theorem. It is one of the three cases.

Every boundary is in plain sight. The particle of Appendix J is a model with additive integer charges, all reversed by the particle map. The canonical quantization of the field, with its operators and its constant, is another statement, and this paper makes none about it. Weyl’s theorem, Lovelock’s theorem and the diagonal areal form of a spherical metric are classical theorems, cited, each with a stated route to formalisation. The conservation of the source for all matter is one field of one printed structure, proved here for the scalar field.

That structure is not an arbitrary postulate. The two statements the reading rests on, Existence and Least Erasure, are theorems in their own domain: each has its own compiled Lean file, with no axiom declared, listed in the Lean Library Reference. There they are proved. The Heat Bridge, which joins erasure to heat, is a theorem there as well; the bridge spoken of below is a different one, from that domain to physics. Here they are used, and the difference is stated. Between that domain and differential geometry lies a physical bridge: that gravity reads the record, and that what it reads is conserved. This paper does not claim the bridge as a theorem. It writes the bridge down as `Premises`, so that the gravity engine imports nothing outside Mathlib and can be checked alone, and so that a reader can see exactly which sentence carries the physics.

Two things are therefore separate, and the paper keeps them separate. Inside the kernel, the implication from `Premises` to Einstein’s equation is a mathematical certainty. No experiment, no consensus and no later revision of physics alters it, and anyone can recheck it with one compilation. Outside the kernel stand three falsifiers. They test whether nature satisfies the premises, and so far nature does. What survives both is not opinion. It is a theorem, and a physics that has met every test of its premises.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author’s. The Lean files and the Fortran twins are written by a language model under the author’s direct supervision. Every theorem named in the text is in an appendix under that name, and the kernel line of every theorem named in the text of Sections 1 to 11 and 13 is printed in Appendix F. The theorems of Section 10.1 are in Appendix J, in a model of the particle that Appendix J prints. Classical theorems that are cited and not formalised are named as such in Section 1.3 and wherever they are used. No constant of nature is derived anywhere in this paper; the numbers of the twin are integrated from measured inputs, which Appendix D prints.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1.  A. Einstein, Sitzungsber. Preuss. Akad. Wiss. (1915) 844.
2.  D. Lovelock, J. Math. Phys. 12 (1971) 498.
3.  D. Lovelock, J. Math. Phys. 13 (1972) 874.
4.  H. Weyl, The Classical Groups (Princeton University Press, 1939).
5.  D. Hilbert, Nachr. Ges. Wiss. Göttingen (1915) 395.
6.  K. Schwarzschild, Sitzungsber. Preuss. Akad. Wiss. (1916) 189.
7.  J. T. Jebsen, Ark. Mat. Astron. Fys. 15 (1921) no. 18.
8.  G. D. Birkhoff, Relativity and Modern Physics (Harvard University Press, 1923).
9.  C. M. Will, Living Rev. Relativ. 17 (2014) 4.
10. S. S. Shapiro, J. L. Davis, D. E. Lebach and J. S. Gregory, Phys. Rev. Lett. 92 (2004) 121101.
11. P. Touboul et al. (MICROSCOPE), Phys. Rev. Lett. 129 (2022) 121102.
12. G. Nordström, Ann. Phys. 42 (1913) 533.
13. G. S. Rinehart, Trans. Amer. Math. Soc. 108 (1963) 195.
14. S. Weinberg, Gravitation and Cosmology (Wiley, 1972).
15. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
16. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
17. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
18. B. Bertotti, L. Iess and P. Tortora, Nature 425 (2003) 374.
19. E. K. Anderson et al. (ALPHA-g), Nature 621 (2023) 716.
20. B. P. Abbott et al. (LIGO and Virgo), Phys. Rev. Lett. 119 (2017) 141101.
21. D. Glavan and C. Lin, Phys. Rev. Lett. 124 (2020) 081301.
22. M. Gürses, T. Ç. Şişman and B. Tekin, Eur. Phys. J. C 80 (2020) 647.
23. M. F. Islam, Generalized Quantization as a New Mathematical Theorem, edition 1.0.0 (2026b).
24. A. Einstein, Ann. Phys. 49 (1916) 769.
25. F. W. Dyson, A. S. Eddington and C. Davidson, Phil. Trans. R. Soc. A 220 (1920) 291.
26. M. Fierz and W. Pauli, Proc. R. Soc. A 173 (1939) 211.
27. H. Bondi, Rev. Mod. Phys. 29 (1957) 423.
28. R. V. Pound and G. A. Rebka, Phys. Rev. Lett. 4 (1960) 337.
29. V. C. Rubin and W. K. Ford, Astrophys. J. 159 (1970) 379.
30. P. C. Peters and J. Mathews, Phys. Rev. 131 (1963) 435.
31. S. Weinberg, Phys. Rev. 135 (1964) B1049.
32. R. V. Pound and J. L. Snider, Phys. Rev. 140 (1965) B788.
33. R. A. Hulse and J. H. Taylor, Astrophys. J. 195 (1975) L51.
34. R. Schoen and S.-T. Yau, Commun. Math. Phys. 65 (1979) 45.
35. R. F. C. Vessot et al., Phys. Rev. Lett. 45 (1980) 2081.
36. E. Witten, Commun. Math. Phys. 80 (1981) 381.
37. T. Jacobson, Phys. Rev. Lett. 75 (1995) 1260.
38. J. G. Williams, S. G. Turyshev and D. H. Boggs, Phys. Rev. Lett. 93 (2004) 261101.
39. D. Clowe et al., Astrophys. J. Lett. 648 (2006) L109.
40. C. W. Chou, D. B. Hume, T. Rosenband and D. J. Wineland, Science 329 (2010) 1630.
41. J. M. Weisberg and Y. Huang, Astrophys. J. 829 (2016) 55.
42. B. P. Abbott et al., Astrophys. J. Lett. 848 (2017) L13.
43. S. Bose et al., Phys. Rev. Lett. 119 (2017) 240401.
44. C. Marletto and V. Vedral, Phys. Rev. Lett. 119 (2017) 240402.
45. P. Delva et al., Phys. Rev. Lett. 121 (2018) 231101.
46. S. Herrmann et al., Phys. Rev. Lett. 121 (2018) 231102.
47. Planck Collaboration (Planck, 2018 results VI), N. Aghanim et al., Astron. Astrophys. 641 (2020) A6.
48. M. F. Islam, Nothing Escapes, Three Plus One, 10.5281/zenodo.22976494.
49. M. F. Islam, The Arrow Has Two Branches; The Fluid Is the Witness, 10.5281/zenodo.22986557, .22986563.
50. M. F. Islam, Dark Matter as the Charge-Conjugation Fixed Set and the Dark Force as One Keyed Bit, 10.5281/zenodo.23006753.
51. M. F. Islam, The Four Forces, Matter, and the Dark Sector as Configurations of One Actuating Substrate, edition 2.0.0, concept 10.5281/zenodo.21438932.
52. M. F. Islam, The Geometric Nature of Light, edition 2.0.0, concept 10.5281/zenodo.20091979 (2026c).

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its engines use is written out in the appendices. Paths are in the repository 1000sapients/Trisduction, branch main, read at commit 38f6678.

1.  Root Axiom and Existence: Publication Library/Philosophy/Metaphysics/Root Axiom/TOE\_Zero.lean. Compiled alone for this paper in core Lean 4.19.0, exit 0.
2.  RH master: Publication Library/Mathematics/Millennium Series/RH\_Both\_Sides\_Formal\_Master\_v3\_0\_44\_CC.lean
3.  The counting theorem on the general seat: RH master of version 3.0.46, Part XIX, and the kernel SPHYS\_Quantization\_Forced\_CC.lean of (Islam, 2026b). Both accompany this edition.
4.  Existence, as carried in the RH master: line 6635.
5.  Heat Bridge: RH master, Parts VII-c and VII-d.
6.  Prime Freedom: RH master, Parts XIII and XIV.
7.  Freedom Arrow: RH master, Part XV.
8.  Least Erasure: protocols/RH One Bit/Nothing Escapes Three Plus One/Least\_Erasure.lean. Compiled alone for this paper in core Lean 4.19.0, exit 0.
9.  Second Law: Publication Library/Mathematics/Mathematical Physics/Second\_Law\_Theorem\_v1\_0\_0\_CC.pdf, with its Lean file printed inside.
10. P versus NP master: FINAL\_BINDING/PNP Binding/PNP\_Normal\_Form\_Paper\_v1\_14\_0\_CC.lean
11. ZFC seal: lean/ZFC\_Block\_Hardened\_FINAL\_v2\_0\_0\_Hermetically\_Sealed.lean
12. No Second Sovereign: Publication Library/Mathematics/Millennium Series/No\_Second\_Sovereign\_v1\_0\_0\_CC.lean
13. Future Proof Empirical Witness Seal: Publication Library/Mathematics/Millennium Series/Future\_Proof\_Empirical\_Witness\_Seal\_v1\_0\_0\_CC.lean

## Appendices

**Appendix A · SPHYS_Gravity_Forced_CC.lean.** Lean 4.19.0 with Mathlib 4.19.0. 149 theorems, no axiom declared, no `sorry`, exit 0 with no warning. The kernel lines are Appendix F. *[a printed file, 1659 lines, in the master and in the Journal edition]*

**Appendix B · SPHYS_Schwarzschild_CC.lean.** The static spherical form, with the chart connection proved torsion-free and metric, and free fall in it. 54 theorems, exit 0 with no warning. *[a printed file, 788 lines, in the master and in the Journal edition]*

**Appendix C · SPHYS_Birkhoff_CC.lean.** The spherical form with no assumption that it is static, with the chart connection proved torsion-free and metric. 25 theorems, exit 0 with no warning. *[a printed file, 329 lines, in the master and in the Journal edition]*

**Appendix D · Gravity_Forced_Twin_CC.f90.** Ten checks, zero failures. Compiled with gfortran, standard 2018, all warnings on. The run is Appendix E. *[a printed file, 203 lines, in the master and in the Journal edition]*

**Appendix E · Run of Appendix D.** ```text
  light at the limb, exact solution of the forced law, integrated:   1.75120 arcsec
  measured band, two uncertainties, integrated at its two ends:   1.75033 to   1.75173
  measured band, five uncertainties:                             1.74928 to   1.75278
  rivals integrated: space part reading nothing   0.87560; gamma = 0.99   1.74245
  PASS  A1 the forced law bends light inside two uncertainties of the measured band
  PASS  A2 a law whose space part reads nothing is excluded: outside five uncertainties
  PASS  A3 a scalar-tensor law with gamma = 0.99 is excluded: outside five uncertainties
  light at the limb, on the orbit equation derived in Lean, integrated:   1.75120 arcsec
  PASS  A5 the two roads to the bending of light agree to 0.00005 arcsec
  rival, not integrated: a scalar law bends no light (conformal flatness):   0.00000
  PASS  A4 a scalar law of gravity is excluded by the bending of light
  Mercury, exact solution, 50 orbits integrated:   42.993 arcsec a century
  rival, space part reading nothing (k = 1/3):     14.339 arcsec a century
  rival, Nordstrom scalar law (k = -1/6):          -7.151 arcsec a century
  PASS  B1 the forced law advances the perihelion inside two uncertainties of 42.98 +- 0.04
  PASS  B2 the law whose space part reads nothing is excluded: beyond five uncertainties
  PASS  B3 the scalar law is excluded: the perihelion would retreat
  note: 2 Ric - Scal g + c g on the model, largest divergence over 1000 points:     0.00E+00
  divergence at x = 1: Ricci alone   -2.0000; Ric - Scal g    2.0000
  PASS  C1 the Ricci curvature alone is not conserved on the model
  PASS  C2 nor is Ric - Scal g, the ratio one to minus one
checks passed: 10   failures: 0 *[a printed file, 22 lines, in the master and in the Journal edition]*

**Appendix F · Kernel lines of Appendices A, B, C, H, I and J.** Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own. *[a printed file, 115 lines, in the master and in the Journal edition]*

**Appendix G · The certificate generator.** Not part of any proof. It is printed as it was run for Appendix C; the same reduction, with the variables of each goal, produced the two certificates of Appendix B. It reads a goal that Lean prints, reduces it modulo the relations x·x⁻¹ = 1, and writes the combination that Lean then checks. *[a printed file, 20 lines, in the master and in the Journal edition]*

**Appendix H · SPHYS_Waves_CC.lean.** The linearised vacuum law of a plane wave, derived from the Ricci curvature, and its polarisations. 17 theorems, exit 0 with no warning. *[a printed file, 204 lines, in the master and in the Journal edition]*

**Appendix I · SPHYS_WeakField_CC.lean.** The static weak field: the first-order Ricci curvature derived, Newton's equation as the time reading, and the potential of space. 14 theorems, exit 0 with no warning. *[a printed file, 172 lines, in the master and in the Journal edition]*

**Appendix J · SPHYS_Gravity_Count_CC.lean.** What gravity counts. Core Lean 4.19.0, no import. 17 theorems, no axiom declared, no `sorry`, exit 0 with no warning. Every cone is pinned at the end of the file, so the build is silent. *[a printed file, 240 lines, in the master and in the Journal edition]*

**Appendix K · Provenance Trail.** This paper is the last step of a line, and the line is on the public record. The table lists each step at the grade its own record carries, with the address where that record can be read. The theorem of this paper, that conservation forces Einstein's equation, is in the last three rows and in no earlier one. The results of the rows of 14 and 16 July are classical and are cited there as inherited. Edition 4.1.0 added this appendix. Edition 4.2.0 adds Section 10.1 and Appendix J, what gravity counts; the other Lean files and the twin are those of edition 4.0.0, and no earlier theorem is changed. *[a printed file, 0 lines, in the master and in the Journal edition]*
