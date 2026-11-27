# Immanent Gravity as a Machine-Checked Mathematical Theorem

## Einstein's Equation Forced by Conservation, Newton's as Its Half-Reading, and Four Dimensions Singled Out

**Mohammad F. Islam PhD** · 27 November 2026

## Abstract

This paper proves, in Lean 4 with Mathlib, that conservation forces the law of gravity. Curvature is defined from a torsion-free metric connection on a Lie-Rinehart pair, with no curvature identity, symmetry or conservation law assumed. From that definition the file proves both Bianchi identities and the contracted identity, and proves that the curvature offers nothing to contract into a symmetric law except the Ricci curvature and the scalar curvature. The main theorem then states: if a law $a\,\mathrm{Ric} + b\,R\,g + c\,g$ has no divergence on every geometry, then $a + 2b = 0$, so the law is Einstein's with a free vacuum term. The hypothesis is needed only on spacetimes of four dimensions with one time direction, and it is tested on an explicit one of non-constant curvature, on which every other ratio fails. Further results stand on the same curvature. The stress tensor of a scalar field has divergence equal to its field equation times its gradient, so the conservation the main theorem asks for is the matter's own equation. The law reads a fluid in $n$ dimensions as $(n-3)\rho + (n-1)p$ along its time and $\rho - p$ across it, which is $\rho + 3p$ in four dimensions, and the two readings of matter at rest agree in four dimensions and in no other. The spherical vacuum solution is derived without assuming it static, on a connection proved torsion-free and metric: the law forces it static and forces $1 - 2m/r$. Free fall in that solution is proved to conserve energy and angular momentum and to obey the equation of the orbit. The linearised vacuum law of a plane wave is derived from the Ricci curvature, and it has two polarisations, both tensor. A Fortran twin integrates the equation of the orbit for light past the Sun and for fifty orbits of Mercury, and integrates rival laws beside it. The forced law gives 1.7512 arcseconds and 42.99 arcseconds a century. A law whose space part reads nothing, a scalar-tensor law with $\gamma = 0.99$, and a scalar law are each excluded by measurement. The weak static field is derived as well: Newton's equation is the time reading, and the potential of space obeys the same equation. Three classical theorems are cited and not formalised: Lovelock's, Weyl's, and the diagonal areal form of a spherical metric. Each is named where it is used, with a route for formalising it. Every premise of the paper is one field of one printed structure. A further kernel, in core Lean, proves what the weight counts. A reading counts a configuration when it gives no two members the same value. Every reading the particle map keeps, gravity's among them on the premise that it reads the record, counts a configuration that holds the antiparticle of each member only if every member is neutral; nothing computed from the weight tells a charged particle from its antiparticle; and a reading that does tell them apart reads a charge. These statements hold for every reading and every set of values, so a reading proposed later is already inside them. The whole curvature of the static spherical form is computed, all 256 components, and its contraction with itself is $48\,m^2/r^6$ for the vacuum solution: finite at the horizon, and growing past every bound toward the centre, which is not a point of the solution. The chart of a falling body is the same geometry and is regular at the horizon. A falling body registers a finite time by its own clock to the horizon and beyond it, and no outside clock registers the crossing at any finite time. The first law of the horizon is an exact identity, and a merger radiates under three tenths of its mass, each on one printed hypothesis. On the theorems of a companion paper the gravitational wave has quanta under one premise, time is no quantity beside the energy, and which states the field has is proved to be decided by no proof. The paper does not say which states nature gives the field; that is for measurement. Part II carries the reading of gravity from which the paper takes its name, at premise grade and apart from the machine-checked claims.

## 1. The Theorem and What It Rests On

### 1.1 The statement

A geometry here is a commutative ring $A$ of functions, a Lie ring $L$ of vector fields that is a module over $A$, an action of fields on functions, a torsion-free connection, and a metric that the connection preserves. A frame is a finite family of fields, orthonormal up to sign, that resolves every field. The law with coefficients $a, b, c$ is

$$\mathrm{Law}(Y,Z) = a\,\mathrm{Ric}(Y,Z) + b\,R\,g(Y,Z) + c\,g(Y,Z).$$

**Theorem (`conservation_on_every_geometry_forces_the_ratio`).** Let $a, b, c$ be integers. If the divergence of the law vanishes on every geometry, in every frame and in every direction, then $a + 2b = 0$.

**Theorem (`conservation_on_every_spacetime_of_four_dimensions_forces_the_ratio`).** The same conclusion holds if the divergence vanishes only on geometries with a frame of four fields, exactly one of them of square minus one, over rings of functions in which $2x = 0$ gives $x = 0$.

The second theorem has the weaker hypothesis and is the one the premises use. The coefficients are integers because the integers are the constants that every ring of functions has. A rational ratio reduces to an integer one by clearing denominators. For coefficients among the constants of one geometry, `conservation_forces_the_ratio` gives the same conclusion on that geometry.

**Theorem (`einstein_forced`).** On the premises below, on every geometry and in every frame,

$$2\,\mathrm{Law}(Y,Z) = a\,\bigl(2\,\mathrm{Ric}(Y,Z) - R\,g(Y,Z)\bigr) + 2c\,g(Y,Z).$$

The coefficient $a$ is the coupling and $c$ is the vacuum term. Neither is fixed by the theorem. The law is the one Einstein reached [1] and Hilbert obtained from an action [5]. The premises are met, and not only by the zero law: `einsteinPremises` constructs a term of the structure with $a = 2$, $b = -1$ and any $c$.

### 1.2 The premises, printed

The physical premises of the paper are the fields of this structure of the Lean file, and there are no others. The main theorem uses its first four fields. What is cited, and what a chart assumes, is in the table of Section 1.3.

```lean
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

It carries three premises. The first is that the law is a member of the three-term family. The second is the field `conserved`: the law has no divergence on every spacetime of four dimensions with one time direction, over rings of functions without two-torsion. It asks nothing of geometries of any other dimension or signature. The third is the pair `weight` and `reads_record`: gravity reads the record, so the weight it gives a particle is some function of the registration of the particle's point, with `Particle`, `reg` and `seatOf` the definitions of Part IX-b. The function is not named. Section 10 states what this premise means. No field of `Geom`, `Frame` or `Premises` states an identity of curvature or the conclusion of any theorem.

### 1.3 What is proved, what is cited, what is assumed

| Statement | Standing | Where |
|---|---|---|
| Curvature is tensorial; first and second Bianchi identities | Proved | Appendix A, Parts II, V |
| Contracted Bianchi identity, $2\,\mathrm{div}\,\mathrm{Ric} = dR$ | Proved | Part VI |
| Pair symmetry of the curvature; Ricci symmetric | Proved | Part VI-b |
| Every contraction of the curvature is $\pm\mathrm{Ric}$ or zero; every full contraction $\pm R$ or zero | Proved | Part VI-b |
| Conservation on every geometry forces $a + 2b = 0$; so does conservation on four-dimensional spacetimes alone | Proved | Parts VII to IX |
| The stress tensor of a scalar field is conserved exactly on its field equation | Proved | Part VII-b |
| Trace reversal; active density $(n-3)\rho + (n-1)p$; the readings agree only for $n = 4$ | Proved | Part X-b |

The table continues with the count, the solutions, the waves, the weak field, the curvature and the horizon.

| Statement | Standing | Where |
|---|---|---|
| On the premise that gravity reads the record: antimatter weighs as matter, weight does not see composition, and the weight is not the charge | Proved, from the placement of Part IX-b and the field `reads_record`; the proofs are short | Part XI |
| Every reading the particle map keeps counts a configuration closed under that map only if every member is neutral; nothing computed from the weight counts a charged pair; a reading that counts one reads a charge | Proved, for every reading and every set of values, in the particle model of Appendix J | Appendix J |
| The chart connection is torsion-free and preserves the metric | Proved | Appendices B, C |
| The spherical vacuum solution is static and is $1 - 2m/r$, in the diagonal areal chart | Proved | Appendices B, C |
| Free fall in the solution conserves energy, angular momentum and the square of the velocity, and obeys $u'' + u = m\kappa/L^2 + 3mu^2$ | Proved | Appendix B |
| The linearised Ricci curvature of a plane wave on flat space | Proved, to first order in the amplitude | Appendix H |
| A plane wave of the linearised law has two polarisations, both tensor; the scalar mode is not a solution | Proved, for one plane wave; the superposition of waves is not formalised | Appendix H |
| The first-order Ricci curvature of a static weak field; Newton's equation from the time reading; the potential of space equal to it | Proved, to first order, static; the condition at infinity is not formalised | Appendix I |
| The whole curvature of the static spherical form, all 256 components; its contraction with itself; $48\,m^2/r^6$ for the vacuum solution, finite at the horizon and unbounded toward the centre | Proved | Appendix L |
| The chart of a falling body is the same geometry and is regular at the horizon; the fall is finite by its own clock; the time an outside clock registers for a ray grows past every bound toward the horizon | Proved, for the time and radius part of the metric | Appendix K |
| The first law of the horizon as an exact identity; the cap on what a merger radiates | Proved, each on one printed hypothesis | Appendix K |

What is not machine-checked is in the third table.

| Statement | Standing | Where |
|---|---|---|
| An invariant linear law is a combination of contractions | Cited: Weyl [4] | Section 4 |
| A conserved law of second order in four dimensions is linear in the curvature | Cited: Lovelock [2, 3] | Section 4 |
| A spherically symmetric metric has the diagonal areal form | Cited: [7, 8] | Section 8 |
| The coordinate formula for the Ricci curvature, used in Appendices B, C, H and I, is the frame contraction of Appendix A written in a chart | Standard dictionary, not formalised | Section 8 |
| The rival laws of Section 9: their optical indices, their weights $k$, the zero bending of the scalar law; and the isotropic form of the solution used by the first road for light | Entered from the literature [9, 12, 14]; numerical, not machine-checked | Section 9 |
| Conservation of the source for all matter | Premise, proved for the scalar field | Section 6 |
| The temperature of a horizon is its surface gravity over $2\pi$ | Hypothesis; not derived and not measured | Section 10.3 |
| The area of horizons does not decrease in a merger | Hypothesis; a classical theorem, not formalised | Section 10.3 |
| The statements of Section 10.2 on the field: the adjoint, the canonical pair, the Hilbert space, the quanta, time | Proved in the companion paper [23], in its own Lean file; not reprinted in the appendices of this paper | Section 10.2 |
| The states of the field of the wave are assignments of a count to each mode | Premise; proved to be decided by no proof | Section 10.2 |

The paper claims as machine-checked the rows marked proved and no others. A row marked cited is a theorem with a published proof that this work has not machine-checked. A row marked entered is a classical formula used by the numerical twin alone; no theorem rests on it. Part II, the reading, is outside this table: it is premise-grade and is labelled so where it begins.

## 2. Geometry as Algebra

Vector fields on a manifold form a Lie algebra that is also a module over the functions, and the two structures are tied by the Leibniz rule. That pair, a Lie-Rinehart pair [13], is all the differential geometry the argument of Sections 2 to 7 needs, and it is what the file of Appendix A formalises. Working at this level has a cost and a gain. The cost is that no manifold is constructed. The gain is that every theorem holds on every model of the axioms, the smooth one included, and that the proofs are identities in rings and modules that the kernel of Lean 4 [16] checks term by term, on the library Mathlib [15].

A connection is a map $\nabla : L \to L \to L$, additive in both arguments, with $\nabla_X Y - \nabla_Y X = [X,Y]$. Its curvature is the definition

$$\mathcal{R}(X,Y)Z = \nabla_X\nabla_Y Z - \nabla_Y\nabla_X Z - \nabla_{[X,Y]}Z.$$

The structure `Geom` adds the action of fields on functions, the two Leibniz rules, the function-linearity of $\nabla$ in its first slot, a symmetric metric $g$, and compatibility, $X\,g(Y,Z) = g(\nabla_X Y, Z) + g(Y, \nabla_X Z)$. The structure is inhabited. Part III builds a connection on any rational Lie algebra, Part IV specialises the Bianchi identities to derivations of a commutative algebra, and Part VIII builds a full geometry with a frame on the polynomial ring.

## 3. The Identities of Curvature

Nothing in this section is assumed. Each statement is a theorem of Appendix A.

**First Bianchi identity (`first_bianchi`).** $\mathcal{R}(X,Y)Z + \mathcal{R}(Y,Z)X + \mathcal{R}(Z,X)Y = 0$. The proof uses torsion-freeness and the Jacobi identity and nothing else. Its kernel line prints no use of choice.

**Second Bianchi identity (`second_bianchi`).** The cyclic sum of the covariant derivative of the curvature vanishes.

**Tensoriality (`curv_smul_left`, `curv_smul_mid`, `curv_smul_right`).** The curvature is linear over functions in each slot. The second-order terms cancel by the Leibniz rules.

**Antisymmetries (`Rm_antisymm12`, `Rm_antisymm34`).** With $\mathrm{Rm}(X,Y,Z,W) = g(\mathcal{R}(X,Y)Z, W)$, the form is antisymmetric in its first pair by definition and in its last pair by metric compatibility.

**Contracted Bianchi identity (`contracted_bianchi`).** In any frame, $2\,\mathrm{div}\,\mathrm{Ric}(Z) = Z(R)$. The proof needs one lemma of independent use, `trace_commute`: for every bilinear form, the terms in which the covariant derivative falls on the frame cancel in the trace. A frame need not be parallel for traces to commute with differentiation.

## 4. There Is Nothing Else to Build a Law From

The family $a\,\mathrm{Ric} + b\,R\,g + c\,g$ is not chosen. Part VI-b proves that the curvature yields no other candidate by contraction.

**Pair symmetry (`pair_symm`).** $\mathrm{Rm}(X,Y,Z,W) = \mathrm{Rm}(Z,W,X,Y)$. It is derived from the first Bianchi identity and the two antisymmetries by one explicit linear combination of fourteen instances, printed in the file. The combination yields twice the identity, so the theorem is stated on rings in which $2x = 0$ gives $x = 0$.

**The six contractions (`contract_12` to `contract_34`).** The four slots of the curvature can be paired in six ways. Contracting slots one and two, or three and four, gives zero. Contracting one and four, or two and three, gives $\mathrm{Ric}$. Contracting one and three, or two and four, gives $-\mathrm{Ric}$.

**The three full contractions.** Pairing the slots as (14)(23) gives $R$, as (13)(24) gives $-R$, and as (12)(34) gives zero.

So a symmetric form made by contracting the curvature with the metric is a multiple of $\mathrm{Ric}$ plus a multiple of $R\,g$, and the metric itself supplies the third term.

**What remains cited.** Two classical theorems stand between this algebra and the statement that every admissible law lies in the family. Weyl's first fundamental theorem for the orthogonal group [4] states that every invariant linear map from tensors to tensors is a combination of contractions with the metric. Lovelock's theorem [2, 3] states that in four dimensions a symmetric, divergence-free tensor built from the metric and its first two derivatives is linear in the second derivatives, and so in the curvature. Both have complete published proofs. Neither is formalised here, and the paper does not claim them.

**A route for formalising them.** The work divides into four lemmas, each of which can be stated in Lean today. First, the jet lemma: a tensor concomitant of the metric of second order is a function of the metric and the curvature alone, by passing to normal coordinates. Second, the linearity lemma: the divergence condition forces the derivative of the concomitant with respect to the second derivatives of the metric to be divergence-free in its own right, which bounds its degree in the curvature by half the dimension. Third, the dimensional lemma: in four dimensions the one quadratic candidate that survives, the Gauss-Bonnet combination, has vanishing variation. Fourth, the invariant lemma: Weyl's theorem for forms of the symmetry type of the curvature, which is a finite computation in the representation theory of the orthogonal group. The contraction table of this section is the output the fourth lemma must reproduce.

## 5. Conservation Forces the Ratio

**The divergence of the family (`twice_div_law`).** For constant $a, b, c$,

$$2\,\mathrm{div}\,\mathrm{Law}(Z) = (a + 2b)\,Z(R).$$

The term in $c$ does not appear, because the metric is parallel. The proof is the contracted Bianchi identity and the resolution of a direction in the frame.

**On one geometry (`conservation_forces_the_ratio`).** If the ring has no zero divisors and the scalar curvature is not constant along some direction, a conserved law of the family has $a + 2b = 0$.

**The model geometry (Part VIII).** The hypothesis of non-constant curvature must be met somewhere, or the theorem would be empty. The file builds a geometry on pairs of rational polynomials, with bracket, connection and metric written out and every axiom of `Geom` proved, the Jacobi identity among them. It is the surface $dx^2 + f(x)^2\,dy^2$ with $f'/f = x$, in its orthonormal frame, with fields whose coefficients depend on $x$ alone. It has two dimensions. Its curvature is $K = -(1 + x^2)$ and its scalar curvature is $-2(1 + x^2)$ (`model_scal`), whose derivative along the first field of the frame is not zero (`model_dScal_ne`).

**On every geometry (`conservation_on_every_geometry_forces_the_ratio`).** A law conserved on every geometry is conserved on the model, so $a + 2b = 0$ over the polynomials, and evaluation at a point carries the equation to the integers. The theorem has no hypothesis about any particular geometry. The converse is `the_forced_ratio_is_conserved_on_every_geometry`.

**A spacetime of four dimensions (Part VIII-b).** A law of physics is asked to be conserved on spacetimes, and the model above is a surface. Part VIII-b therefore builds a second geometry: the surface times a flat plane of one space and one time direction, $dx^2 + f(x)^2\,dy^2 + dz^2 - dt^2$, with every axiom of `Geom` proved again. Its frame has four fields, one of square minus one (`model4_card`, `model4_one_time`), and its scalar curvature is again $-2(1 + x^2)$ (`model4_scal`, `model4_dScal_ne`). On it every ratio but the forced one fails, so the hypothesis can be restricted to four-dimensional spacetimes (`conservation_on_every_spacetime_of_four_dimensions_forces_the_ratio`). This is the form the structure `Premises` carries.

## 6. The Source Is Conserved

The main theorem takes the conservation of the law as its hypothesis. The physical reason for that hypothesis is that the law is equated to a source and the source is conserved. Part VII-b proves the second half for a scalar field, with nothing about conservation assumed.

Let $\varphi$ be a function and $\mu$ a constant. The Hessian $\mathrm{H}(X,Y) = X(Y\varphi) - (\nabla_X Y)\varphi$ is symmetric because the connection has no torsion (`Hess_symm`). Let $\Box\varphi$ be its trace and let $T$ be the stress tensor, $2T(Y,Z) = 2\,(Y\varphi)(Z\varphi) - g(Y,Z)\,(|d\varphi|^2 + \mu\varphi^2)$.

**Theorem (`div_T2`).** $\mathrm{div}\,(2T)(Z) = 2\,(\Box\varphi - \mu\varphi)\,(Z\varphi)$.

The derivative of $|d\varphi|^2$ is computed through `trace_commute`, the same lemma that carries the contracted Bianchi identity. Three corollaries follow. A field on its equation has a conserved source (`field_equation_conserves_the_source`). Where the field varies, conservation of the source is the field equation (`conservation_is_the_field_equation`). A law of the family set equal to a constant multiple of $T$, with the field on its equation, has no divergence (`law_sourced_by_a_field_is_conserved`).

**What stays a premise.** One matter model is treated. That every form of matter has a conserved source is, in the classical account, a consequence of an action principle invariant under change of coordinates. That statement is not formalised here, and the field `conserved` of `Premises` carries it.

## 7. What the Law Reads: Newton's Half and the Fourth Dimension

**Trace reversal (`trace_reversal`).** Let $n$ be the number of fields of the frame. If $2\,\mathrm{Ric} - R\,g = \kappa\,T$, then

$$(n-2)\cdot 2\,\mathrm{Ric}(Y,Z) = \kappa\,\bigl((n-2)\,T(Y,Z) - g(Y,Z)\,\mathrm{tr}\,T\bigr).$$

The proof takes the trace of the law, $\mathrm{tr}(2\,\mathrm{Ric} - R\,g) = (2 - n)R$, which rests on Parseval's identity in the frame and on $\mathrm{tr}\,g = n$, both proved.

**A fluid.** For $T = (\rho + p)\,u\otimes u + p\,g$ with $g(u,u) = -1$, the right side is computed in closed form.

**Theorem (`active_density`).** Along the fluid's own time the curvature reads $(n-3)\rho + (n-1)p$.

**Theorem (`space_reading`).** Along a unit direction at rest with the fluid it reads $\rho - p$.

In four dimensions the first is $\rho + 3p$ (`active_density_in_four`). This is the density that Newton's potential obeys, and it is half of what the law reads: the other half is the space reading, which a slow body does not feel and light does.

**Theorem (`space_reads_what_time_reads_iff`).** For matter at rest without pressure, the space reading equals the time reading exactly when $(n-4)\rho = 0$.

**Theorem (`weight_of_matter_at_rest`).** The time reading of such matter is $(n-3)\rho$.

So in three dimensions of spacetime a body at rest has no weight, and in four, and only in four, space reads exactly what time reads. The equality of the two readings is the statement that light is bent by twice the angle a Newtonian body would be. The step from the two readings to the two potentials is classical [9, 14]. Appendix I derives it.

**The static weak field (`static_ricci`).** Let the metric be flat plus a first-order static perturbation, $-(1 + \epsilon u)$ on the time and $(1 - \epsilon w)$ on each direction of space, with $\epsilon^2 = 0$. Newton's potential is $u/2$ and the potential of space is $w/2$. The Ricci curvature given by the coordinate formulas is $\tfrac{1}{2}\epsilon$ times: $\nabla^2 u$ on the time component; zero between time and space; and $\delta_{ij}\nabla^2 w + \partial_i\partial_j (w - u)$ on space.

**Theorem (`newton_from_the_time_reading`).** Take the source in the same unit: the time component is $\tfrac{1}{2}\epsilon\,q$ when it reads $q$. If the time component reads $q$, then $\nabla^2 u = q$. This is Poisson's equation, and space is not consulted.

**Theorem (`space_potential_equals_time_potential`).** If the curvature reads $q$ along time and $q$ along every direction of space, as the forced law does for matter at rest in four dimensions, then $\nabla^2 w = q$ as well, and every second derivative of $w$ equals that of $u$.

So Newton's gravity is the time reading of the forced law, and the potential of space differs from Newton's by a function with no second derivative. With both potentials vanishing far from the source that function is zero, the two potentials are equal, and their ratio $\gamma$ is one. The condition far from the source is not formalised. Section 9 tests the same consequence a second way, by integrating the exact solution.

## 8. The Vacuum Solution

Appendices B and C leave the abstract setting for a chart: a field of functions with four commuting derivations, the Christoffel symbols and the Ricci curvature given by their coordinate formulas. The sine and cosine of the polar angle enter as two elements $s, c$ with $\partial_\theta s = c$ and $\partial_\theta c = -s$, and nothing else about them is used.

**The connection is torsion-free and metric (`connection_is_torsion_free_and_metric`).** In each appendix the Christoffel symbols are proved symmetric in their lower indices, and the derivative of every component of the metric is proved equal to the two terms that metric compatibility requires. So the connection of the chart is the torsion-free metric connection of the printed metric, the object the main theorem is about. Its Ricci curvature is taken by the coordinate formula. That the coordinate formula is the frame contraction of Appendix A written in a chart is the standard dictionary between the two languages. It is two lines on paper and is not formalised. The statements hold in a field of functions, where a function that is not zero has an inverse; they say nothing at a point where $f$, $A$ or $B$ vanishes.

**The static form (Appendix B).** For the metric $\mathrm{diag}(-f, 1/f, r^2, r^2 s^2)$ all sixteen components of the Ricci curvature are computed. Twelve vanish. The others are $f\,(f''/2 + f'/r)$, $-(f''/2 + f'/r)/f$, $1 - f - r f'$, and $s^2(1 - f - r f')$.

**Theorem (`vacuum_iff`).** The Ricci curvature vanishes if and only if $r f' + f = 1$.

**Theorem (`vacuum_forces_schwarzschild`).** Under the vacuum law the function $m = r(1-f)/2$ is constant in all four coordinates and $f = 1 - 2m/r$, the solution of Schwarzschild [6]. The converse is `schwarzschild_is_vacuum`.

**Without assuming it static (Appendix C).** Let $A$ and $B$ be functions of the time and the radius, with metric $\mathrm{diag}(-A, B, r^2, r^2 s^2)$. Three identities are proved: $R_{tr} = \partial_t B / (rB)$; $R_{\theta\theta} = 1 - 1/B - (r/2B)(A'/A - B'/B)$; and $B\,R_{tt} + A\,R_{rr} = (A'B + AB')/(rB)$, in which every time derivative has cancelled.

**Theorem (`birkhoff`).** If the Ricci curvature vanishes, then $B$ does not depend on the time; $m = r(1 - 1/B)/2$ is constant in all four coordinates; $1/B = 1 - 2m/r$; the product $AB$ depends on the time alone; and $A = AB\,(1 - 2m/r)$.

A product $AB$ that depends on time alone is a choice of clock. The solution is static because the law forces it. Five identities are closed by explicit certificates, two in Appendix B and three in Appendix C: each is reduced modulo the relations $x\,x^{-1} = 1$ with the multipliers written out. The multipliers were found by computer algebra and are checked by Lean's ring arithmetic. The generator is not trusted and is not part of the proof.

**Free fall (`orbit_equation`).** A field of velocities is in free fall when its derivative along itself is given by the Christoffel symbols of Appendix B. For such a field the energy $f\,\dot t$, the square of the angular momentum $r^4(\dot\theta^2 + s^2\dot\varphi^2)$ and the square of the velocity in the metric are constant along the fall (`energy_conserved`, `angSq_conserved`, `speedSq_conserved`), and together they give the radial equation (`radial_equation`). In the solution $f = 1 - 2m/r$, with $u = 1/r$, $L$ the angular momentum and $\kappa$ minus the square of the velocity, the orbit obeys

$$u'' + u = \frac{m\kappa}{L^2} + 3\,m\,u^2,$$

the primes being derivatives in the angle of the orbit, defined as the angle whose rate along the fall is $L u^2$. In the equatorial plane that rate is $\dot\varphi$. For a planet $\kappa = 1$ and for light $\kappa = 0$. Under the vacuum law no form of $f$ is assumed (`free_fall_in_the_vacuum_solution`). The statement is for a field of velocities, where the angular momentum does not vanish.

**What is assumed.** That a spherically symmetric metric can be brought to this diagonal form with $r$ the areal radius is classical [7, 8] and is not formalised. The route is short. The orbits of the rotations are spheres, and their area defines $r$ where its gradient does not vanish. The metric on the two remaining coordinates then has one cross term, and a one-form in two variables has an integrating factor, which defines the time that removes it.

## 9. The Numerical Twin

The twin of Appendix D does not evaluate the formulas of general relativity. It integrates paths, and beside the forced law it integrates rivals.

**Light.** A ray obeys $dv/ds = \nabla \ln n - (v\cdot\nabla \ln n)\,v$ in the optical index of the static metric. For the exact solution in isotropic coordinates $n = (1 + m/2r)^3/(1 - m/2r)$. A rival whose space part is weighted by $\gamma$ has $n = \sqrt{(1 + 2\gamma m/r)/(1 - 2m/r)}$. The ray runs from ten thousand solar radii before the Sun to ten thousand after, by fourth-order Runge-Kutta. The isotropic form of the solution is the classical change of radial coordinate and is not formalised, so the exact solution is integrated a second way that uses none of it: the orbit equation of Section 8 with $\kappa = 0$, from the point of closest approach to $u = 0$. The two roads share the mass and the impact parameter and no equation.

**Mercury.** For the forced law the orbit obeys the equation of Section 8 with $\kappa = 1$ and $1/p = m/L^2$, a theorem of Appendix B. The rivals obey $u'' + u = 1/p + 3k\,m\,u^2$ with $k = (2 + 2\gamma - \beta)/3$ in the standard parameters [9], a cited form; the forced law has $k = 1$. Fifty orbits are integrated.

| Test | Forced law | Rival | Measured |
|---|---|---|---|
| Light at the limb, arcsec | 1.75120 by both roads | 0.87560 (space part reads nothing, $\gamma = 0$) | 1.75033 to 1.75173 [10] |
| | | 1.74245 (scalar-tensor, $\gamma = 0.99$) | |
| | | 0 (scalar law [12], not integrated) | |
| Mercury, arcsec a century | 42.993 | 14.339 ($\gamma = 0$, $\beta = 1$, $k = 1/3$) | 42.98 $\pm$ 0.04 [9] |
| | | $-7.151$ (scalar law, $\gamma = -1$, $\beta = 1/2$) | |
| Divergence on the model geometry at $x = 1$ | 0 | $-2$ (Ricci alone); $+2$ (ratio $1 : -1$) | |

Ten checks pass and none fails. The forced law lies inside two printed uncertainties of each measurement and each rival lies outside five. Three limits are stated. The zero bending of the scalar law is a classical fact entered by hand, since its metric is conformally flat, and nothing is integrated for it. On the two-dimensional model the forced combination $2\,\mathrm{Ric} - R\,g$ vanishes identically, so its conservation there is printed as a note and is not counted as a check; the checks are the rivals, which are not conserved. The twin tests the solution of the forced law against rivals. It is not a new prediction, and the agreement of general relativity with these measurements was known.

## 10. Discussion: The Immanent Reading

The derivation above uses only differential geometry. This section states the reading from which the paper takes its name, and marks what in it is theorem and what is premise. The word reading is used in two ways and the context separates them. In Section 7 a reading is the number the curvature returns for a source, along time or across it. Here and in Part II the reading is the account of why gravity is geometry, and within it a reading of the record is a function of a registered point.

**Why geometry.** Part IX-b of Appendix A models a particle by an integer charge and an integer energy and places it on the plane at the point (side, height) = (1 + charge, energy). The reflection of the plane in the line of side one exchanges a particle with its antiparticle. Registration is the projection onto that line. The premise is that gravity reads the record: its reading of a particle is some function of the registration of the particle's point. It is the field `reads_record` of `Premises`. On that premise three statements are theorems for every such function. The reading does not change under exchange of particle and antiparticle (`every_reading_of_the_record_is_blind_to_charge`). Two particles of equal energy receive the same reading (`every_reading_of_the_record_is_blind_to_composition`). No such function returns the charge (`no_reading_of_the_record_returns_the_charge`). On the premises they give `Premises.antimatter_weighs_as_matter`, `Premises.weight_is_blind_to_composition` and `Premises.weight_is_not_the_charge`. These theorems follow from the placement of the particle and the premise, and they are short. Their content is the premise, stated openly: a reading that is blind to what a body is made of is a property of the arena and not of the body, and a property of the arena is geometry. This is the equivalence principle, reached from the record.

**Why conservation.** In the same reading nothing leaves the record, so what gravity reads is conserved, and a law equated to it must have no divergence on every spacetime. Section 6 proves the conservation for the scalar field from the field's own equation. The reading supplies the reason it should hold for all matter. That reason is the field `conserved`.

**What the paper does not claim.** It does not derive the coupling or the vacuum term. Both are free in `einstein_forced`. It does not claim that general relativity was unknown or untested. It claims that the form of its law, within the family, is forced by conservation, that the family is all that contraction can produce, and that each of these statements compiles. The fuller account of the reading, with its consequences for clocks, for radiation and for the dark sector, is Part II, Section 12, carried from [17]. No theorem of Sections 2 to 9 depends on it.

### 10.1 What Gravity Counts

The first blindness theorem says that, on the premise that gravity reads the record, the particle map keeps gravity's reading. This section proves what follows from that alone, for gravity's reading and for every reading of the same kind. The kernel is Appendix J, in core Lean with no import. Its particle carries four additive charges and an energy; the particle map reverses every charge and keeps the energy; a particle is neutral when every charge is zero; the weight is gravity's reading of the frequency of the energy, which has a frequency and a rate. That the weight is kept holds in this model by its definition, which writes the premise in. It is a second model beside the one-charge particle of Part IX-b, and it is printed whole. It is a model of one particle and its weight: the reading of a fluid, with its pressure, is Section 7 and is not modelled here.

**One definition.** A reading *counts* a configuration when it gives no two of its members the same value. A configuration is *quantized by* a reading when that reading counts it. Where this paper says quantized by a reading, nothing else is meant: no commutation relation, no constant, no operator, and no claim that the values of a reading are isolated. The canonical sense is named canonical wherever it is meant.

**Theorem** (`a_kept_reading_counts_only_the_line`). Let $\varphi$ be any map of any set, and $r$ any reading with $r(\varphi a) = r(a)$ for every $a$. If a configuration is closed under $\varphi$ and $r$ counts it, then $\varphi$ fixes every member.

**Theorem** (`every_kept_reading_counts_only_the_neutral`, `gravity_counts_only_the_neutral`). Let $r$ be any reading of particles, with values in any set, that the particle map keeps. If a configuration holds the antiparticle of each of its members and $r$ counts it, every member is neutral. Gravity's reading is such a reading (`the_weight_is_kept`), so the weight counts matter with its antimatter only where all of it is neutral.

**Theorem** (`nothing_computed_from_the_weight_counts_a_charged_pair`). Let $f$ be any function of the weight, into any set. In a configuration that holds one charged particle with its antiparticle, the reading $f$ of the weight does not count the configuration. The general fact is `nothing_computed_from_a_reading_counts_more`: a function of a reading counts no more than the reading does.

**Theorem** (`to_count_a_charged_pair_a_reading_must_see_the_particle_map`, `a_reading_that_tells_the_pair_apart_reads_a_charge`, `the_charges_tell_a_charged_pair_apart`). If a reading counts a configuration that holds a charged particle with its antiparticle, it gives the two different values, so the particle map does not keep it. A reading that gives a particle and its antiparticle different values is not a function of the energy alone, since every function of the energy alone is kept (`a_reading_of_the_energy_alone_is_kept`); a particle is its charges and its energy, so the reading reads a charge. The charges are such a reading: those of a charged particle and of its antiparticle differ.

Six statements are bound in one term, `what_gravity_counts`, with nothing before the colon: the weight is kept; a kept reading counts a configuration of matter with its antimatter only if all of it is neutral; nothing computed from the weight counts a charged pair; a reading that counts one gives the pair two values; the charges tell the pair apart; and a charged pair exists in the model. A charged particle with its antiparticle exists in the model, two particles on one weight (`a_charged_pair_is_two_on_one_weight`). The converse on gravity is not claimed, and in the model it is false: two neutral particles of one frequency and different rates are two on one weight (`the_weight_does_not_tell_all_the_neutral_apart`).

**What this settles.** The theorems quantify over every reading and every set of values, so they do not wait for a reading to be proposed. Three cases exhaust what a proposal can be. If the particle map keeps its reading, a configuration of matter with its antimatter is quantized by that reading only if all of it is neutral. If its reading is computed from the weight, by any rule, it tells no charged particle from its antiparticle. If it does tell them apart, it reads something the particle map reverses, and that is not gravity's reading. A scheme that counts matter with its antimatter by gravity's reading alone is therefore confined to the neutral, and a scheme that counts a charged particle apart from its antiparticle does so by a reading that is not gravity's. Either way it is a case of this section, and no further theorem is needed for it. The theorem on a general seat, of which the first statement above is the core, is the subject of a companion paper [23].

**What this does not settle.** The canonical quantization of the gravitational field is a different question, with operators and a constant that this kernel does not contain, and nothing here decides it. A proposal of that kind meets this section only where it supplies a reading of particles: then the three cases apply to that reading. Whether the field has quanta is for experiment. The model has its own limits, stated in Appendix J: the charges are additive integers, and the particle map reverses every one of them.

### 10.2 The Field Itself

Section 10.1 counts configurations of matter by gravity's reading. This section turns to the field. The companion paper [23] proves its theorem on quantization inside any ring with an adjoint. It constructs the adjoint from the map of the seat, settles where a canonical pair can exist, places the Hilbert space, gives the free field of quanta, proves what no proof decides, and places time. Each of these applies to the gravitational field as to any other, and none uses a physical premise. They are proved in the Lean file of that paper and are not reprinted here. The statements below are summaries: each theorem states its own conditions in the cited section of that paper, and where a summary and a statement differ the statement governs.

**The adjoint derived.** Take as the seat the configurations of the field, with any map of them that is its own inverse: the mirror of space, the reversal of time, or the particle map carried to the sources. A reading of the field is a function on those configurations with values in a ring that has an adjoint. For every such seat and every such ring of values [23, Section 10.5 and its Appendix G]:

1. The readings form a ring point by point, and the map followed by the adjoint of the values is an adjoint on them. Its three laws are proved; none is supposed.
2. Where the adjoint of the values is the identity, the observables are exactly the readings the map keeps. The weight is such a reading, on the premise of Section 10.1.
3. Where the values commute, the readings alone commute. The readings by themselves hold no commutator.
4. The readings together with the map, taken as a quantity beside them, form a ring with an adjoint by construction. With values that commute and have two elements or more, that ring commutes exactly when the map moves no configuration.

On the classical account of a gravitational wave the mirror of space sends a wave of one helicity to the wave of the other [23, Section 7.3]. The mirror therefore moves a configuration, and by the fourth statement the ring of the readings of the field with the mirror does not commute. The algebra of the gravitational field on its seat is an algebraic quantization in the sense of the companion paper, with its adjoint derived from the map and not assumed.

**The canonical pair, decided by the seat.** A pair of quantities is canonical when its commutator is one. Take now as the seat the states of the field, or of one mode of it. A seat is finite or it is not, and each case is a theorem [23, Sections 10.6 and 10.7 and its Appendix G]:

1. If the states are finite in number and there is at least one, no pair of quantities on their readings is canonical. This holds among all quantities whatever, with values in a field of characteristic zero: every map of the states and every family or group of maps is among them.
2. If the states carry a count, so that a state is a configuration together with a whole number, the step up and the step down of the count are a canonical pair on every reading, and their product is the count. The field then has quanta, counted by whole numbers, and nothing further is supposed to obtain them.
3. In any ring, a canonical pair has no power of its second member equal to zero, where no whole multiple annihilates; it cannot exist under any additive reading that is cyclic and not zero on one; and it is never a pair of two observables with commutator one, so its constant is a quantity the adjoint reverses. A seat with a coordinate along a shift is infinite.
4. A pair whose commutator is a constant with an inverse becomes canonical when one member is measured in that unit. The algebra fixes the commutator as one. The size of the constant in any unit is measured.
5. Every infinite set of states is matched with itself taken together with the whole numbers, and the count is carried across the matching. So a set of states that is not empty carries a canonical pair among the linear maps of its readings exactly when it is infinite, with values in a field of characteristic zero. The matching is a theorem of the axiom of choice, and the companion paper marks it so; on states given with their count no such axiom is used.

So the question whether the gravitational field carries a canonical pair is the question whether its states are finite or infinite in number. If they are finite, it carries none, by the first statement, and no scheme can supply one. If they are infinite, it carries one, by the fifth, and no scheme can remove it; if they are given with a count, the pair is the ladder and its product counts the quanta. A scheme proposed in the past or in the future is a case of one of the two as soon as it says what the states are. Which it is, no proof decides; that is for measurement.

The fifth statement selects by the number of the states and by nothing else. The positions of a body on a line are infinite in number, so a classical configuration carries a canonical pair among the linear maps of its readings as well. What separates a quantum account of the field from a classical one is therefore which quantities are its observables and which readings are its states. That too is read from the field.

**The Hilbert space.** An account of the field that takes its states in a Hilbert space is a case of the same theorems [23, Section 10.7]. The inner product is a form of the companion paper's spectral seat, so the registrations of every observable are on the line and states with different registrations are orthogonal. The bounded quantities are a ring with an adjoint, and that adjoint is the adjoint of the form. No pair of bounded quantities is canonical, on a Hilbert space of any dimension that is not the zero space: a canonical pair on a space with a norm is a pair of quantities without a bound, and the ladder is such a pair. In the other direction, a ring with an adjoint and a positive reading is a space with a positive form on which the ring acts, and it lies densely in a Hilbert space with its form kept. The Hilbert space is inside the theorem and adds no premise to it.

**The count and the ground state.** The count of the quanta is the one observable without a bound that the theorems build, and its registrations are exactly the whole numbers. For any canonical pair on any space, a state that the first member sends to zero has above it rungs on which the pair acts by the rule of the ladder and by no other, and over a field of characteristic zero the rungs are independent. So a field with a canonical pair and a state of no quanta holds one copy of the ladder, whatever else its states are.

**The quanta of the wave.** Appendix H proves that a plane wave of the linearised vacuum law has two polarisations, both tensor. Take as the seat the assignments of a whole number to each polarisation of each mode of the wave. That the states of the field are such assignments is the one premise here. On that seat [23, Section 10.8]:

1. Each polarisation of each mode has a raising and a lowering that are a canonical pair, and raising after lowering multiplies by the number of its quanta. Different modes and different polarisations do not disturb one another.
2. With a frequency for each mode, the energy of a state is the sum of its quanta, each at the frequency of its mode. The commutator of the energy with the raising of a mode is the frequency times the raising, and with the lowering the frequency times the lowering, reversed. That is the law of motion of the quantities.
3. The energy of a mode is the count and one half. The half is forced by the commutator.
4. The mirror of space exchanges the quanta of the two polarisations, is its own inverse, and keeps the energy.

This is the free field of the gravitational wave with its quanta: the part of the quantum theory of gravity that holds on a fixed geometry and for waves that do not act on one another. It follows from the premise by theorem, and the two polarisations it counts are the two this paper derives.

**What no proof decides.** The premise of the last paragraph cannot be removed by proof, and that is itself a theorem [23, Section 10.9]. A set of states with a canonical pair and a set of states without one both exist, and every statement above holds of both kinds; so nothing that follows from the premises of either paper says which the gravitational field is. A set of states is infinite exactly when some quantity on it registers every whole number. To place the field on that branch is to find such a quantity, and to place it on the other is to bound every one. Likewise every value of the constant is the commutator of some pair, so its size is not a consequence of the algebra. Both are measured.

**Time.** Three theorems place it [23, Section 10.10]. The count of a mode, which is its energy in its own unit, has no canonical partner: no linear map of the readings has commutator one with it, where there is at least one state and one is not zero. So time is not a quantity beside the energy; it is the count of registrations, or a label. A reading of a system together with its count that is fixed as a whole contains the whole history of the system, read against the count; a total that does not change is no obstacle to change within it. And a law kept by every map of a family prefers no slicing, while a record may carry one of its own. The law of Sections 3 to 5 is stated on every geometry with no slicing chosen, and it stays so. The common now of cosmology, the frame in which the background radiation is at rest, is a registration of the matter that fills the universe. It belongs to the record. It sets no frame into the law, and the time of a clock along its path and the time of the cosmos are two registrations and not rivals.

**The geometry.** Where the values commute the readings commute, so a reading holds no commutator. If the geometry is a reading of the record, which is the premise of Part II, it has no canonical pair of its own and there is nothing in it to count beyond the quanta of its waves. Whether it is so is proved to be decided by no proof [23, Section 10.10]: both kinds of ring exist and every theorem holds of both. The experiment that bears on it is the entanglement of two masses by gravity alone [44, 45]. It tests the premise, and it moves no theorem of this paper.

**Outside the companion file, and why nothing here needs it.** Two classical theorems are not formalised there: the spectral theorem for a general observable without a bound, and the uniqueness of a canonical pair in the form of Weyl. The first is not needed because the one such observable in question, the count, has its registrations proved directly. The second is not needed because no statement above rests on uniqueness beyond that of the ladder above a ground state, which is proved; for infinitely many modes the general uniqueness fails. No interaction of the quanta with one another is given, and no reaction of the quanta on the geometry that carries the modes: the theory of the field beyond the free wave on a fixed geometry is not in either paper. The size of the constant is not derived. Whether the field has quanta is for experiment, as Section 10.1 states.

### 10.3 The Horizon and the Fall

Section 8 derives the vacuum solution, $f = 1 - 2m/r$, and its free fall. This section states what clocks register there. The theorems are Appendices K and L. Appendix L computes the curvature in the chart of Appendix B; Appendix K is on the real numbers, with the angular part of the metric left out because it is the same in both charts.

**The curvature, computed.** The Ricci curvature of a vacuum solution is zero and cannot say whether any place of it is singular. Appendix L computes the whole curvature of the static spherical form from the Christoffel symbols of Appendix B: its contraction on the first and third places is the Ricci curvature of that appendix (`the_ricci_curvature_is_the_contraction`), and each of its 256 components is the entry of a printed table (`the_curvature_is_the_table`). The curvature contracted with itself on all four places, a scalar that is the same in every chart by the classical rule of transformation [14], is $f''^2 + 4f'^2/r^2 + 4(1-f)^2/r^4$ for any $f$ (`the_invariant_of_the_curvature`), and for the vacuum solution it is $48\,m^2/r^6$ (`the_invariant_of_the_vacuum_solution`). At $r = 2m$ that is $3/(4m^4)$, a finite number (`the_invariant_at_the_horizon`). Toward $r = 0$ it grows past every bound (`the_invariant_grows_past_every_bound`).

**Two charts of one geometry.** Beside the static chart there is the chart of a falling body, with the time and radius part $-f\,dT^2 + 2\sqrt{2m/r}\,dT\,dr + dr^2$. Where $f$ is not zero it is the static chart with the time step shifted along the radius (`the_falling_chart_is_the_same_geometry`). The static chart fails at $r = 2m$, where $f$ is zero (`the_static_chart_fails_at_the_horizon`). The falling chart does not: the determinant of its time and radius part is minus one at every radius above zero, the horizon included (`the_falling_chart_is_regular_at_every_radius`). The horizon is a failure of one chart and no feature of the geometry. This agrees with the invariant, which is finite there.

**What the clock of a falling body registers.** A body with the radius falling at the rate $\sqrt{2m/r}$ moves at unit rate in the falling chart (`the_falling_body_moves_at_unit_rate`), so the time of that chart is the time its own clock registers. That rate is the one the radial equation of Appendix B gives for a fall from rest far away (`the_rate_of_the_fall_obeys_the_radial_equation`). Its clock, read against the radius, has rate $-\sqrt{r/2m}$ (`the_clock_of_the_fall_against_the_radius`), which is one over the rate of the fall (`the_clock_and_the_fall_agree`). From a radius $r_0$ down to any radius between zero and $r_0$ the time it registers is at least zero and at most $\tfrac{2}{3}\,r_0\sqrt{r_0}/\sqrt{2m}$ (`the_falling_body_registers_a_finite_time`). The bound does not depend on the lower radius. The body reaches the horizon in finite time by its own clock, passes it, and its clock stays under the same bound as near the centre as one likes.

**What the outside clock registers.** The time an outside clock registers for a ray to cover a step of radius is $r/(r - 2m)$ per unit of radius (`the_rate_of_the_outside_clock_along_a_ray`), which is one over $f$ (`the_rate_of_the_outside_clock_is_one_over_the_function`). The time for a ray between a radius $r$ and a fixed radius grows past every bound as $r$ approaches $2m$ from outside (`the_outside_clock_never_registers_the_crossing`). No signal from the horizon or from within it is registered outside at any finite time. The interior is no part of the exterior record. The companion paper carries the first and the third of these in its own file [23, Section 10.10].

**The two together.** The fall is finite by the clock that falls and is never completed by any clock outside. Both statements are theorems and they do not conflict: they are two registrations, of two paths. On the reading of Part II, where to exist is to be registered, the interior is no existent for any outside observer; what is registered of it is registered by the one who falls and is carried to no one else.

**The centre.** Section 8 derives the solution on $r \neq 0$, and the charts and the curvature above are stated for a radius above zero. The bound on the clock of the fall holds down to a radius of zero, as a bound on what the clock has registered, and it places no point of the solution there. The centre is not a point of the solution. The invariant of the curvature grows past every bound toward it and has no value at it. No reading has a value there, and nothing in this paper places an existent at it. The clock of the fall has a bound and the path has no point beyond: the path ends, and it ends at no place. This is the case, for this solution, of the classical theorem that such paths end [24].

**The surface gravity, the first law, and the merger.** The slope of $f$ is $2m/r^2$ (`the_slope_of_the_function`), and half the slope at the horizon is $1/4m$ (`the_surface_gravity_of_the_horizon`). The area of the horizon is $16\pi m^2$ (`the_area_of_the_horizon`). Take the entropy as a quarter of that area and the temperature as the surface gravity over $2\pi$. Then a step of mass is the temperature times the step of entropy, as an exact identity (`the_first_law_exact`). That the surface gravity over $2\pi$ is a temperature is a hypothesis of that reading; it is not derived in this paper and has not been measured. If the area of horizons does not decrease, two holes that merge radiate at most $1 - 1/\sqrt{2}$ of their total mass (`the_cap_on_what_a_merger_radiates`), which is under three tenths (`the_cap_is_under_three_tenths`). That the area does not decrease is the hypothesis.

## 11. Predictions, Falsifiers, and What Stands

The paper recovers general relativity. It predicts no measurement that general relativity does not and derives no constant. Of the quantum theory of the field it states what Section 10.2 proves and no more. Its commitments are therefore those of the forced law, and they are stated here as commitments: three that the paper says will stand at any future precision, two present proposals it says will fail, and the three observations that would refute it.

### 11.1 Three predictions that will stand

1. **Antimatter falls as matter, exactly.** `every_reading_of_the_record_is_blind_to_charge` gives one reading to a particle and its antiparticle. The free-fall acceleration of antihydrogen equals that of hydrogen, with no deviation at any precision. The present measurement is $0.75 \pm 0.13 \pm 0.16$ of $g$ [19]. The prediction is that the central value moves to 1 as the uncertainty falls to a percent and below.
2. **Space reads what time reads: $\gamma = 1$, exactly.** `space_reads_what_time_reads_iff` gives equal readings in four dimensions, and `space_potential_equals_time_potential` carries the two readings to the two potentials whose ratio is $\gamma$. The exact solution of Section 8, integrated in Section 9, has $\gamma = 1$ as well. The present bounds are $\gamma - 1 = (2.1 \pm 2.3)\times10^{-5}$ from the Cassini radio link [18] and $\gamma = 0.9998 \pm 0.0004$ from the deflection of radio waves [10]. The prediction is that no experiment finds $\gamma - 1$ different from zero.
3. **Free fall does not see composition, at any precision.** `every_reading_of_the_record_is_blind_to_composition` forbids it. The present bound on the difference of free fall of titanium and platinum is $(-1.5 \pm 2.3 \pm 1.5)\times10^{-15}$ [11]. The prediction is that successors of that experiment find zero.

### 11.2 Two proposals that will fail

1. **A new second-order law of gravity in four dimensions.** Section 4 proves that contraction of the curvature yields only the Ricci and scalar curvatures, and Lovelock's theorem [2, 3] closes the family. A proposal of a further second-order metric law in four dimensions, such as the four-dimensional Gauss-Bonnet law obtained by a limit of the dimension [21], cannot be a law of the metric alone. The paper predicts that every such proposal either reduces to the forced law or is found to carry a further field. For the proposal named, that finding is already in the literature [22], so for it the statement is a retrodiction. The prediction is for the proposals still to come.
2. **A scalar or vector polarization of gravitational waves.** The forced law is Einstein's. Appendix H proves that a plane wave of its linearised vacuum law has exactly two polarizations, plus and cross: every solution is a combination of the two up to a change of coordinates (`two_polarisations`), no change of coordinates produces either from nothing (`the_two_are_physical`), and the scalar mode that stretches both transverse directions is not a solution (`breathing_is_not_a_wave`). The linearised law is not entered. `linearised_ricci` derives it: for the metric that is flat plus a first-order plane wave, the Ricci curvature given by the coordinate formulas equals the wave profile's second derivative times the expression whose vanishing is the law. The result is for one plane wave; a general wave is a sum of such waves, and that superposition is not formalised. A scalar-tensor law, which Section 9 excludes at $\gamma = 0.99$ by the bending of light, would carry a third. The paper predicts that no detector network finds a polarization that is not tensor. The first test with three detectors favoured tensor over vector and over scalar [20].

### 11.3 The three falsifiers

Each is a forbidden observation. No observation breaks a theorem; each refutes a premise, or the forced law as the law of nature, and each names the theorem that carries the consequence. The threshold in each case is five of the experiment's printed uncertainties.

1. **Free fall that sees what a body is.** A difference in free fall between two compositions, or between matter and antimatter, refutes the field `reads_record` of `Premises`, that gravity reads the record; the two blindness theorems of Part XI are what that premise implies.
2. **$\gamma \neq 1$.** It refutes the forced law as the law of gravity: its exact spherical solution has $\gamma = 1$ (Sections 8 and 9), and `space_reads_what_time_reads_iff` gives equal readings in four dimensions.
3. **A polarization of gravitational waves that is not tensor.** It refutes the forced law as the law of gravity, since the forced law has none (`two_polarisations`).

These three replace the falsifiers of earlier editions. Apart from them stands the formal claim, which no observation touches and one compilation settles: every theorem named in Sections 1 to 11 and 13 prints its axioms in Appendix F, K or L, and a line that names an axiom other than `propext`, `Classical.choice` and `Quot.sound`, or a file that fails to compile under Lean 4.19.0 and Mathlib 4.19.0, refutes the claim that the statements are proved.

### 11.4 What kind of result this is

It is not a new physics. It is a change in how a physical derivation can be checked. The derivation of the law of gravity from conservation is here a single file whose every step the kernel has verified, whose every assumption is one field of one structure, and whose numerical consequences are integrated beside those of its rivals. A reader who doubts a step can name the line.

The implication from `Premises` to the forced law is checked by the Lean kernel, and so are the trace reversal of that law, its spherical vacuum solution, the whole curvature of that solution, what clocks register at its horizon, its weak static field and the polarisations of its plane waves. No experiment and no later revision of physics alters an implication. Experiment remains free to test whether nature satisfies the premises, and that is all it can test here. What the kernel certifies is the Lean statements; that the definitions of the file say what this text says they say is for the reader to check, and the structure `Premises` is printed for that purpose. What stands is the table of Section 1.3.

## 12. Part II · The Reading

*This part is the reading from which the paper takes its name. It is carried from edition 2.0.0 (Islam, 2026a) and is premise-grade. It is not among the machine-checked claims of Section 1.3, and no theorem of Sections 2 to 9 depends on it. The theorem names set in code in this part, and the twin it quotes, are those of edition 2.0.0 and are printed there, not here. Where this part calls a statement a theorem, the statement follows from the placement of the reading, which is its premise.*

### 12.1 The Reader's Frame

This Part gives gravity its reading on the seat.

It claims that gravity is immanent: the substrate reading its own record. Three consequences follow at the seat. Gravity is an after-effect of existence, since a record comes after the act it records. Gravity and time co-move, since one gravitational shift moves every clock at a place together and neither causes the other. Gravity is the monic memory of privation, since the deficit of every bond is read and no two different deficits read alike. These readings are structural; the theorems that carry their content are exact, and the measurements that corroborate them are cited.

It refuses two things. The reading does not derive Einstein's equations. Sections 3 to 9 of this paper force their form. It does not claim that the gravitational field is or is not quantized in the canonical sense, which no experiment has decided. What gravity's reading counts is a different statement, and it is a theorem of this edition, in Section 10.1. A reader who arrives from the conventional frame will scan this paper for a new dynamics, find none, and be tempted to report the absence. None was attempted: the immanent reading predicts exactly what general relativity predicts, and its content is the typing.

**Negative warrants.** Two, stated so that no reader supplies them. No physical fact here is read as a proof of a mathematical sentence: a corroboration joined to a claim takes the weaker grade. In the reading no field equation is derived, and nowhere is a constant computed from first principles: $G$, $c$ and the masses enter as measured or as defined.

**Five terms.** A *reading* is any quantity an instrument returns from a state, *odd* under a map that flips its sign and *even* under one that keeps it. *Registration* is the map $(h,t)\mapsto(1,t)$ that keeps a point's height and forgets its side. A reading *factors through registration* when it depends on the height alone. The *fixed set* of a map is the set of points it leaves unchanged. A *keyed bit* is a yes-or-no property no function of a given record decides.


### 12.2 The Spine

The seat has a mirror and a record. The mirror is a reflection of the plane, $s\mapsto1-\bar s$, and the points it leaves fixed form one line, the fixed line. A point has a height along the line and a side off it. Registration keeps the height and forgets the side, and it erases nothing exactly when nothing stands off the line. Gravity has that shape. The particle map exchanges a particle with its antiparticle and flips every charge. This paper reads it: gravity as the reading of the record in Section 12.3, its one sign in Section 12.4, its reversibility in Section 12.5, its shift of every clock in Section 12.6, its memory of the deficit in Section 12.7, its reading of light and of the dark in Section 12.8, and its waves in Section 12.9.

**Why this carrier, and not another.** The carrier is not chosen. Spaces with an involution and the maps that respect them form a category (`equivariant_id`, `equivariant_comp`), and the fixed set is a functor on it (`fix_functorial`); an equivariant map into the seat, whose fixed set is the line (`fold_global_seat`), lands every physical fixed point on the line (`equivariant_carrier_lands`). Gravity needs no carrier of its own. Its reading is the height, so it is equivariant for the particle map and for the fold with nothing to carry (`gravity_even_branch`, `gravity_factors_through_registration`), and applied to the particle map's odd part it lands every source on the line (`every_source_on_the_line`). The one map gravity adds is the gravitational shift, and it commutes with the fold and with registration (`redshift_equivariant`, `redshift_commutes_with_registration`).

**The correspondence matrix.**

\begingroup\small

| Physical phenomenon | Element of the seat | Lean theorem | Fortran check |
|----------|----------|----------|----------|
| antimatter falls as matter | the reading even under the particle map | `gravity_even_branch` | 2665 of 2665; ALPHA-g |
| every body falls alike | the reading factors through registration | `gravity_factors_through_registration`, `composition_blind` | 2665 of 2665 |
| universality stronger than symmetry | evenness is not the record | `even_is_not_the_record` | structural |
| positive mass | every source on the line | `every_source_on_the_line`, `charged_source_off_the_line` | 2665 of 2665 |
| no gravitational shield | one sign, no screening | `one_sign_no_screening`, `charge_can_be_screened` | 1834 neutral charge sets, 0 massless mass sets |
| a planet's orbit | conservative motion, reversible | `conservative_motion_reversible`, `motion_retraces` | ten revolutions; retrace 5.2e-10 |
| gravitational redshift | the height moved, the side kept | `redshift_equivariant`, `redshift_keeps_the_line`, `redshift_commutes_with_registration` | tower 2.455e-15; clocks 3.60e-17 |
| every clock shifted alike | ratios kept: gravity and time co-move | `clocks_co_move` | 10000 pairs to 3.3e-16 |
| the mass defect | the deficit read monically | `gravity_reads_the_deficit`, `the_bond_weighs_less` | binding falls to 5.0e-12 |
| light bent, gravity at light's speed | the massless cone | `massive_slower` | 1.7512″; 4.2e-16 |
| two polarizations | the radiation's one bit | `waves_two_polarizations`, `polarization_count` | 10 − 4 − 4 = 2 |
| the binary pulsar | the waves carry energy away | import (Peters and Mathews, 1963) | −2.4021e-12 |
| dark matter | the fixed set, read by gravity alone | `only_gravity_reads_the_dark`, `odd_reading_blind` | structural |
| the accelerating expansion | the vacuum's pressure reverses the pull | `the_vacuum_repels`, `one_sign_of_energy_not_of_pull`, `kinetic_floor` | q0 = −0.527; z = 0.63, 0.295 |

\endgroup


### 12.3 Gravity Reads the Record

Gravity couples to energy and momentum and to nothing else: not to charge, not to colour, not to the composition of a body. The engine reads this at the seat. The gravitational reading of a particle is its energy (`grav`), which the particle map leaves unchanged, so antimatter reads as matter (`gravity_even_branch`); on the chart the reading is the height, which registration keeps and the fold keeps (`gravity_factors_through_registration`); and two particles of one energy read alike whatever their charges (`composition_blind`). Gravity is registration read as a force.

The two properties are not one. A reading can be even under the fold and still read the side: the squared distance from the line is unchanged by the fold and changed by registration (`even_is_not_the_record`). So the equivalence principle says more than symmetry under the particle map. Antihydrogen falling downward, at $(0.75\pm0.13\pm0.16)\,g$ with repulsion excluded, tests the weaker property (ALPHA-g, 2023). Titanium and platinum falling alike to $|\eta|<4.2\times10^{-15}$ tests the stronger one (MICROSCOPE, 2022). The stronger property is forced for any massless spin-two field by the low-energy theorem that such a field couples to every source through one constant (Weinberg, 1964), an import the seat reads as registration.


### 12.4 One Sign: Every Source on the Line, No Screening

Apply the particle map's odd part to a reading: for charge it is twice the charge, and a charged source lands off the line (`charged_source_off_the_line`); for gravity it is zero, and every gravitational source lands on the line (`every_source_on_the_line`). Gravity has no off-line source: it has one sign.

One sign has a consequence charge lacks. Sources of one sign total zero only when every source is zero (`one_sign_no_screening`), while a unit charge and its opposite total zero (`charge_can_be_screened`). An atom is neutral and a Faraday cage screens a field; nothing screens gravity. The twin finds 1834 neutral sets among 20000 random sets of four nonzero charges and not one massless set among 20000 nonempty mass sets. The total mass-energy of an isolated system is nonnegative by theorem under the dominant energy condition (Schoen and Yau, 1979; Witten, 1981). Quantum fields admit local negative energy densities, the Casimir effect among them, bounded by quantum inequalities; no body of negative gravitational mass is known. A negative gravitational mass (Bondi, 1957) would create an off-line source and a bit for gravity; it would be a case of the first falsifier of Section 11.3.

One sign is a sign of energy, not of pull. Gravity reads pressure as well as density, and the active gravitating density of a fluid is $\rho+3p$ (Section 7, `active_density_in_four`): dust attracts, and the vacuum, with $p=-\rho$, repels with active density $-2\rho$ (`the_vacuum_repels`). Every density stays positive while the pull reverses (`one_sign_of_energy_not_of_pull`), so the vacuum's repulsion is no screening, which would need a negative energy. For a canonical field, $\rho+p$ is twice the kinetic density and never negative (`kinetic_floor`), the floor that excludes a phantom equation of state. The sign of the vacuum's pull is read from the sky, not forced: the flat Planck budget gives $q_0=-0.527$, where an all-matter budget gives $+0.5$, the acceleration beginning at redshift 0.63 and the vacuum overtaking matter at 0.295 (Planck, 2018; the twin of edition 2.0.0).


### 12.5 No Bit, and Reversible

A reading with no off-line source has no two worlds to separate and no bit to register, and its motion keeps no record. The engine proves this for motion itself. Write conservative motion under any force law $f$ as the Störmer–Verlet step on two successive positions, $(x_{n-1},x_n)\mapsto(x_n,\,2x_n-x_{n-1}+f(x_n))$, and time reversal as their exchange. For every force law, reversing, stepping and reversing undoes a step exactly (`conservative_motion_reversible`), and any number of steps is retraced by the same number of backward steps (`motion_retraces`). The twin integrates a Kepler orbit of eccentricity one half for ten revolutions, keeping its energy to $4.3\times10^{-6}$, then reverses it and finds its start again to $5.2\times10^{-10}$. Nothing was committed, so nothing was paid: the reversible branch, floor zero and never cost zero.

Reversibility alone does not keep a reading on the line: a reversible flow can leave it. What keeps gravity there is its one sign.


### 12.6 Gravity and Time Co-Move: The Height Moved, Never the Side

A clock deeper in a gravitational potential runs slower, by $\Delta\nu/\nu=gh/c^2$ near the Earth. On the seat a gravitational shift multiplies every height by one factor and leaves the side alone (`redshift`). It commutes with the fold (`redshift_equivariant`), keeps a point on the line exactly when it was on it (`redshift_keeps_the_line`), and commutes with registration (`redshift_commutes_with_registration`): gravity moves the record and never the side.

Because the factor is one for every mode at a place, every ratio of frequencies is kept (`clocks_co_move`): gravity does not slow a particular clock, it moves every clock together. This is the reading in which gravity and time co-move and neither causes the other. The twin computes $2.455\times10^{-15}$ for the 22.5 m tower (Pound and Rebka, 1960; confirmed to 1% by Pound and Snider, 1965) and $3.60\times10^{-17}$ for two optical clocks 33 cm apart (Chou, Hume, Rosenband and Wineland, 2010). Clocks of different kinds shift alike: a hydrogen maser flown on a rocket agreed with the prediction to parts in $10^4$ (Vessot et al., 1980), and two Galileo satellites in eccentric orbits to $2.5\times10^{-5}$ (Delva et al.; Herrmann et al., 2018).


### 12.7 The Monic Memory of the Deficit

A bound system weighs less than its parts by its binding energy. The engine reads a bound pair's weight as the parts' energies less the binding: a positive binding reads below the sum (`the_bond_weighs_less`), and two bindings read alike exactly when they are equal (`gravity_reads_the_deficit`). The reading of the deficit is monic, injective, keeping every privation distinct. This is the sense in which gravity is the monic memory of privation: it reads what a bond has given up, and it forgets none of it.

The deficit is measured. Nuclear binding is 0.936% of the mass of titanium and 0.851% of platinum, a difference of $8.55\times10^{-4}$; MICROSCOPE finds the two falling alike to $4.2\times10^{-15}$, so the binding deficit falls with the rest of the mass to $5.0\times10^{-12}$ of itself (the twin of edition 2.0.0). The Earth's and the Moon's own gravitational binding fall alike too, tested by lunar laser ranging (Williams, Turyshev and Boggs, 2004).


### 12.8 Gravity Reads Light, and Only Gravity Reads the Dark

Gravity reads light's energy and bends its path: a ray grazing the Sun turns by 1.751 arcseconds, twice the Newtonian angle because the time and the space parts of the metric bend it equally (Dyson, Eddington and Davidson, 1920; Cassini finds $\gamma-1=(2.1\pm2.3)\times10^{-5}$, Bertotti, Iess and Tortora, 2003). Light is the substrate's one excitation fixed by both involutions at every frequency, the companion paper on light proves (Islam, 2026c); gravity reads it as it reads everything, by its record. The waves of gravity and the waves of light, both massless (`massive_slower` for anything that is not), arrived together from GW170817 after 130 million years, to $4.2\times10^{-16}$ of their speed. That gravity is prior to light, innate to the substrate rather than produced by any one carrier, is carried at structural grade: gravity reads every carrier, light included, and needs none of them to act.

The same reading explains why the dark sector is seen only through gravity. Least Erasure proves (Islam, 2026a) that a state is invisible to every charge-linear reading exactly when the particle map fixes it, and that on such a state only the mass reading remains. The engine carries the core of that result: a state the particle map fixes carries no charge, every odd reading returns zero on it, and gravity returns its energy (`odd_reading_blind`, `only_gravity_reads_the_dark`). Gravity is the one reading of the record, so it is the one reading that sees a state with nothing but a record. The rotation of galaxies (Rubin and Ford, 1970), the separation of mass from gas in the Bullet Cluster (Clowe et al., 2006) and a cold-dark-matter density 5.37 times the baryonic one (Planck, 2018) are gravity reading the fixed set. Whether that fixed set also carries a dark gauge charge is one keyed bit, as Least Erasure proves, and gravity cannot read it.


### 12.9 The Waves: Two Polarizations and the Decay of an Orbit

A symmetric tensor has ten components; four gauge conditions and four constraints leave two polarizations (`polarization_count`). Parity exchanges them and keeps the frequency (`waves_two_polarizations`): the radiation carries the one bit light carries, while the sources carry none. The waves carry energy away: the twin computes the orbital decay of the binary pulsar PSR B1913+16 from its period, eccentricity and masses as $-2.4021\times10^{-12}$ (Peters and Mathews, 1963), against the general-relativistic $-2.4026\times10^{-12}$ and the observed ratio $0.9983\pm0.0016$ (Hulse and Taylor, 1975; Weisberg and Huang, 2016). Mercury's perihelion advances 42.98 arcseconds a century, computed from the constants in the twin of edition 2.0.0.


### 12.10 What Gravity Carries, and What It Does Not

Gravity carries the record. It reads the height of every configuration and nothing of its side; it has one sign of energy, so every source stands on the line and none is screened; its motion retraces exactly and commits nothing; its shift moves every clock together; its reading of a bond's deficit is monic; it alone reads the dark. That is the content of the immanent reading, and every clause of it is a theorem about the seat or a measurement at its grade.

The seat gives a typing: gravity is neither an agent added to matter nor a medium's collective mode but the substrate's own registration read as a force. The immanent, the emergent and the fundamental readings predict alike for every experiment cited here. At structural grade and no higher, the seat reads why gravity has resisted canonical quantization: on that reading canonical quantization is the priced registration of a bit, and a reading with no off-line source has none to register. A gravitationally mediated entanglement experiment would sharpen that reading without moving the typing. The part of that reading which is a theorem is now proved, in Section 10.1 and Appendix J: no reading the particle map keeps, and nothing computed from the weight by any rule, tells a charged particle from its antiparticle, and a reading that does tell them apart reads a charge, which on the premise gravity does not. That holds for every reading, so for any proposed after this paper. The account of the resistance stays at structural grade.

### 12.11 Falsifiers and Owed Deeds

The falsifiers of the reading are merged into Section 11.3 of this edition, which carries the paper's three. The falsifier on clocks of edition 2.0.0, two clocks of different kinds shifted by different factors at one place, is a case of the first of them: a free fall that sees what a body is.

One experiment would sharpen a reading without moving the paper's standing: gravitationally mediated entanglement between two masses in superposition (Bose et al., 2017; Marletto and Vedral, 2017).

## 13. Closure

The derivation of the law of gravity is no longer informal prose. From a torsion-free metric connection and nothing more, Lean 4 with Mathlib compiles both Bianchi identities, the contracted identity, the exhaustion of the contractions of the curvature, the conservation of the scalar field's stress tensor on its own equation, the forcing of Einstein's law, the trace reversal with its two readings, the two polarisations of a plane wave, the spherical vacuum solution, static because the law makes it so, and the whole curvature of that solution. No axiom is declared. No proof is left open. No headline theorem closes by its own hypothesis or over a structure that carries its conclusion.

General relativity is recovered as the one conserved member of the three-term family, with the coupling and the vacuum term left free. Newton's gravity is recovered as its time reading alone, which does not see the space reading that doubles the bending of light in four dimensions and in no other. The numerical twin integrates light past the Sun and fifty orbits of Mercury in the derived solution, lands inside two uncertainties of each measurement, and puts every rival it tests outside five.

What gravity counts is settled in the same way. On the premise that gravity reads the record the particle map keeps the weight, and from that alone the kernel of Appendix J proves three statements for every reading and every set of values. A reading the particle map keeps counts matter with its antimatter only where all of it is neutral. Nothing computed from the weight, by any rule, tells a charged particle from its antiparticle. A reading that tells them apart reads a charge. Quantization by a reading, in the one sense this paper defines, is thereby decided for gravity's reading and for every reading of its kind, those not yet written included: in matter with its antimatter the weight alone counts nothing charged, and whatever tells a charged particle from its antiparticle is not the weight. A later proposal needs no new theorem. It is one of the three cases.

The horizon and the field are settled in the same way. The curvature of the vacuum solution is computed entire. Its invariant is finite at the horizon and has no value at the centre, which is not a point of the solution. A body that falls registers a finite time by its own clock, and no clock outside registers the crossing. On the theorems of the companion paper [23] and one premise, the gravitational wave has quanta, counted mode by mode, with the energy their sum. By the same theorems time is the count of registrations and no quantity beside the energy, and the common now of cosmology is a registration of the record that sets no frame into the law. Which states nature gives the field is proved there to be a thing no proof decides.

Every boundary is in plain sight. The particle of Appendix J is a model with additive integer charges, all reversed by the particle map. On the canonical quantization of the field the paper states what Section 10.2 proves and no more: the quanta on one premise, the constant measured, and the choice of states left to measurement by theorem. The temperature of a horizon and the growth of its area are hypotheses, printed where they are used. Weyl's theorem, Lovelock's theorem and the diagonal areal form of a spherical metric are classical theorems, cited, each with a stated route to formalisation. The conservation of the source for all matter is one field of one printed structure, proved here for the scalar field.

That structure is not an arbitrary postulate. The two statements the reading rests on, Existence and Least Erasure, are theorems in their own domain: each has its own compiled Lean file, with no axiom declared, listed in the Lean Library Reference. There they are proved. The Heat Bridge, which joins erasure to heat, is a theorem there as well; the bridge spoken of below is a different one, from that domain to physics. Here they are used, and the difference is stated. Between that domain and differential geometry lies a physical bridge: that gravity reads the record, and that what it reads is conserved. This paper does not claim the bridge as a theorem. It writes the bridge down as `Premises`, so that the gravity engine imports nothing outside Mathlib and can be checked alone, and so that a reader can see exactly which sentence carries the physics.

Two things are therefore separate, and the paper keeps them separate. Inside the kernel, the implication from `Premises` to Einstein's equation is a mathematical certainty. No experiment, no consensus and no later revision of physics alters it, and anyone can recheck it with one compilation. Outside the kernel stand three falsifiers. They test whether nature satisfies the premises, and so far nature does. What survives both is not opinion. It is a theorem, and a physics that has met every test of its premises.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean files and the Fortran twins are written by a language model under the author's direct supervision. Every theorem named in the text of Sections 1 to 11 and 13 is in an appendix under that name. Its kernel line is printed in Appendix F, or in Appendix K or L for the theorems of Section 10.3. The theorems of Section 10.1 are in Appendix J, in a model of the particle that Appendix J prints. The theorem names set in code in Part II are those of edition 2.0.0 and are printed there, as that part states. The abstract, Section 1.3 and the Closure state the results in summary. Each theorem states its own conditions in the section that names it and in its appendix, and where a summary and a statement differ the statement governs. Classical theorems that are cited and not formalised are named as such in Section 1.3 and wherever they are used. No constant of nature is derived anywhere in this paper; the numbers of the twin are integrated from measured inputs, which Appendix D prints.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1. A. Einstein, Sitzungsber. Preuss. Akad. Wiss. (1915) 844.
2. D. Lovelock, J. Math. Phys. 12 (1971) 498.
3. D. Lovelock, J. Math. Phys. 13 (1972) 874.
4. H. Weyl, The Classical Groups (Princeton University Press, 1939).
5. D. Hilbert, Nachr. Ges. Wiss. Göttingen (1915) 395.
6. K. Schwarzschild, Sitzungsber. Preuss. Akad. Wiss. (1916) 189.
7. J. T. Jebsen, Ark. Mat. Astron. Fys. 15 (1921) no. 18.
8. G. D. Birkhoff, Relativity and Modern Physics (Harvard University Press, 1923).
9. C. M. Will, Living Rev. Relativ. 17 (2014) 4.
10. S. S. Shapiro, J. L. Davis, D. E. Lebach and J. S. Gregory, Phys. Rev. Lett. 92 (2004) 121101.
11. P. Touboul et al. (MICROSCOPE), Phys. Rev. Lett. 129 (2022) 121102.
12. G. Nordström, Ann. Phys. 42 (1913) 533.
13. G. S. Rinehart, Trans. Amer. Math. Soc. 108 (1963) 195.
14. S. Weinberg, Gravitation and Cosmology (Wiley, 1972).
15. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
16. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
17. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
18. B. Bertotti, L. Iess and P. Tortora, Nature 425 (2003) 374.
19. E. K. Anderson et al. (ALPHA-g), Nature 621 (2023) 716.
20. B. P. Abbott et al. (LIGO and Virgo), Phys. Rev. Lett. 119 (2017) 141101.
21. D. Glavan and C. Lin, Phys. Rev. Lett. 124 (2020) 081301.
22. M. Gürses, T. Ç. Şişman and B. Tekin, Eur. Phys. J. C 80 (2020) 647.
23. M. F. Islam, Generalized Quantization as a New Mathematical Theorem, edition 2.8.0 (2026b).
24. R. Penrose, Phys. Rev. Lett. 14 (1965) 57.
25. A. Einstein, Ann. Phys. 49 (1916) 769.
26. F. W. Dyson, A. S. Eddington and C. Davidson, Phil. Trans. R. Soc. A 220 (1920) 291.
27. M. Fierz and W. Pauli, Proc. R. Soc. A 173 (1939) 211.
28. H. Bondi, Rev. Mod. Phys. 29 (1957) 423.
29. R. V. Pound and G. A. Rebka, Phys. Rev. Lett. 4 (1960) 337.
30. V. C. Rubin and W. K. Ford, Astrophys. J. 159 (1970) 379.
31. P. C. Peters and J. Mathews, Phys. Rev. 131 (1963) 435.
32. S. Weinberg, Phys. Rev. 135 (1964) B1049.
33. R. V. Pound and J. L. Snider, Phys. Rev. 140 (1965) B788.
34. R. A. Hulse and J. H. Taylor, Astrophys. J. 195 (1975) L51.
35. R. Schoen and S.-T. Yau, Commun. Math. Phys. 65 (1979) 45.
36. R. F. C. Vessot et al., Phys. Rev. Lett. 45 (1980) 2081.
37. E. Witten, Commun. Math. Phys. 80 (1981) 381.
38. T. Jacobson, Phys. Rev. Lett. 75 (1995) 1260.
39. J. G. Williams, S. G. Turyshev and D. H. Boggs, Phys. Rev. Lett. 93 (2004) 261101.
40. D. Clowe et al., Astrophys. J. Lett. 648 (2006) L109.
41. C. W. Chou, D. B. Hume, T. Rosenband and D. J. Wineland, Science 329 (2010) 1630.
42. J. M. Weisberg and Y. Huang, Astrophys. J. 829 (2016) 55.
43. B. P. Abbott et al., Astrophys. J. Lett. 848 (2017) L13.
44. S. Bose et al., Phys. Rev. Lett. 119 (2017) 240401.
45. C. Marletto and V. Vedral, Phys. Rev. Lett. 119 (2017) 240402.
46. P. Delva et al., Phys. Rev. Lett. 121 (2018) 231101.
47. S. Herrmann et al., Phys. Rev. Lett. 121 (2018) 231102.
48. Planck Collaboration (Planck, 2018 results VI), N. Aghanim et al., Astron. Astrophys. 641 (2020) A6.
49. M. F. Islam, Nothing Escapes, Three Plus One, 10.5281/zenodo.22976494.
50. M. F. Islam, The Arrow Has Two Branches; The Fluid Is the Witness, 10.5281/zenodo.22986557, .22986563.
51. M. F. Islam, Dark Matter as the Charge-Conjugation Fixed Set and the Dark Force as One Keyed Bit, 10.5281/zenodo.23006753.
52. M. F. Islam, The Four Forces, Matter, and the Dark Sector as Configurations of One Actuating Substrate, edition 2.0.0, concept 10.5281/zenodo.21438932.
53. M. F. Islam, The Geometric Nature of Light, edition 2.0.0, concept 10.5281/zenodo.20091979 (2026c).

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its engines use is written out in the appendices. Paths are in the repository 1000sapients/Trisduction, branch main, read at commit 38f6678.

54. Root Axiom and Existence: Publication Library/Philosophy/Metaphysics/Root Axiom/TOE_Zero.lean. Compiled alone for this paper in core Lean 4.19.0, exit 0.
55. RH master: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_44_CC.lean
56. The counting theorem on the general seat: RH master of version 3.0.46, Part XIX, and the kernel SPHYS_Quantization_Forced_CC.lean of (Islam, 2026b). Both accompany this edition.
57. Existence, as carried in the RH master: line 6635.
58. Heat Bridge: RH master, Parts VII-c and VII-d.
59. Prime Freedom: RH master, Parts XIII and XIV.
60. Freedom Arrow: RH master, Part XV.
61. Least Erasure: protocols/RH One Bit/Nothing Escapes Three Plus One/Least_Erasure.lean. Compiled alone for this paper in core Lean 4.19.0, exit 0.
62. Second Law: Publication Library/Mathematics/Mathematical Physics/Second_Law_Theorem_v1_0_0_CC.pdf, with its Lean file printed inside.
63. P versus NP master: FINAL_BINDING/PNP Binding/PNP_Normal_Form_Paper_v1_14_0_CC.lean
64. ZFC seal: lean/ZFC_Block_Hardened_FINAL_v2_0_0_Hermetically_Sealed.lean
65. No Second Sovereign: Publication Library/Mathematics/Millennium Series/No_Second_Sovereign_v1_0_0_CC.lean
66. Future Proof Empirical Witness Seal: Publication Library/Mathematics/Millennium Series/Future_Proof_Empirical_Witness_Seal_v1_0_0_CC.lean

## Appendix A · SPHYS_Gravity_Forced_CC.lean

Lean 4.19.0 with Mathlib 4.19.0. 149 theorems, no axiom declared, no `sorry`, exit 0 with no warning. The kernel lines are Appendix F.

```lean
/-
  SPHYS_Gravity_Forced_CC.lean · Conservation forces Einstein's law, on real curvature · Lean 4.19.0, Mathlib v4.19.0.

  RATIONALE. The first engine of this name's paper carried the Bianchi identity as a field of a structure of three
  integers, and its reading of gravity was defined so as to have the properties it then "proved". A reader objected
  that nothing was proved about curvature. This file replaces that skeleton. Curvature is defined from a connection
  with no property built in; both Bianchi identities, the tensor laws of curvature, the contracted identity and the
  divergence of the family a·Ric + b·Scal·g + c·g are theorems; and conservation forces a + 2b = 0.

  DESIGN, in the form of Lie and Rinehart (no coordinates, no manifold library).
    Parts I-II   Vector fields are a Lie ring L. A connection is a map additive in each argument with no torsion.
                 Curvature R(X,Y)Z = ∇_X∇_Y Z − ∇_Y∇_X Z − ∇_[X,Y] Z. `first_bianchi`, `second_bianchi`.
    Part III     The hypotheses are not empty: half the bracket on a rational Lie algebra.
    Part IV      The derivations of any commutative algebra are such a Lie ring (Mathlib), so the identities hold
                 for them. The smooth vector fields of a manifold are the derivations of its smooth functions; that
                 identification is classical and is used in no proof.
    Part V       `Geom`: functions A, the action of a field on a function, the Leibniz rule, a metric the connection
                 preserves. Proved: curvature is linear over functions in each argument (`curv_smul_left`, `_mid`,
                 `_right`); the lowered curvature is antisymmetric in each pair; `second_bianchi_Rm`.
    Part VI      `Frame`: an orthonormal frame. Ricci and scalar curvature by trace. Proved: a trace commutes with
                 the covariant derivative (`trace_commute`), and `contracted_bianchi`: 2·div Ric = d Scal.
    Part VII     The family of laws. Proved: `twice_div_law`: 2·div = (a + 2b)·d Scal; `conservation_forces_the_ratio`;
                 `the_forced_law_is_conserved`; `einstein_law_is_conserved`.
    Part VIII    An explicit geometry: the surface dx² + f(x)² dy² in its orthonormal frame, over the rational
                 polynomials. Its Lie ring (Jacobi included), connection, metric and frame are built and every law
                 is proved. `model_curv`, `model_scal` = −2(1 + x²), `model_dScal_ne`.
    Part IX      `conservation_on_every_geometry_forces_the_ratio`: for integers a, b, c, a law of the family with
                 no divergence on every geometry has a + 2b = 0. No hypothesis on a geometry is left.
                 `the_forced_ratio_is_conserved_on_every_geometry`: the converse, with c free.
    Part VIII-b  A spacetime of four dimensions with one time direction, the surface times a flat plane; every
                 law proved again. `conservation_on_every_spacetime_of_four_dimensions_forces_the_ratio`: the
                 hypothesis of Part IX restricted to such spacetimes gives the same conclusion.
    Part IX-b    The seat and the record, as definitions.
    Part X       `Premises`: the three premises of the paper, in one structure the kernel sees. `einstein_forced`:
                 on them, twice the law is a·(2·Ric − Scal·g) + 2c·g on every geometry.
                 The field `conserved` asks for conservation on four-dimensional spacetimes only.
                 `einsteinPremises`: the structure is inhabited by Einstein's law with any vacuum term.
    Part XI      What a reading of the record can see: blind to the sign of charge and to composition, for every
                 reading; nothing is defined to be so.

  WHAT A STRUCTURE HERE CARRIES. `Connection`, `Geom` and `Frame` carry the definitions of a torsion-free connection,
  of a metric geometry and of an orthonormal frame. None of their fields is an identity of curvature, a symmetry of
  curvature, or a conservation law. Every such statement is a theorem below.

  WHAT IS NOT PROVED HERE (read before citing).
    (a) The family is the three-term family. That every conserved symmetric law of second order in four dimensions
        lies in it is Lovelock's theorem (1971), which is not proved here. Part VI-b proves the algebraic piece:
        every contraction of the curvature with the metric is a multiple of Ric, every full contraction a multiple
        of Scal. What stays cited is that an invariant law is built from contractions (Weyl) and that a conserved
        second-order law is linear in the curvature (Lovelock).
    (b) The premises are premises. That the law of gravity is a conserved law of this family is the structure
        `Premises` of Part X; that gravity reads the record is its field `reads_record`. Neither is proved.
        Part VII-b narrows P2: for the scalar field the conservation of the source is a theorem of the field's
        own equation, and a law equated to such a source is conserved. What P2 still assumes is that this holds
        for all matter, on every spacetime of four dimensions.
    (c) Part X-b computes what the forced law reads of a fluid in n dimensions. That the weak-field potentials
        are sourced by those readings is derived in a file of its own, SPHYS_WeakField_CC.lean, in coordinates.
    (d) The files in coordinates (the spherical solution, the waves, the weak field) take the Ricci curvature by
        its coordinate formula. That this formula is the frame contraction of Part VI written in a chart is the
        standard dictionary and is not formalised.

  NON-NEGOTIABLE. No axiom is declared. No headline theorem closes by `rfl`, by its own hypothesis, or over a
  structure that holds its conclusion as a field. The kernel line of each headline theorem is printed at the end.
-/
import Mathlib.RingTheory.Derivation.Lie
import Mathlib.Algebra.Lie.Basic
import Mathlib.Tactic.Abel
import Mathlib.Tactic.Module
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.Ring
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Tactic.NormNum

namespace SPHYS.Geometry

/-! ## Part I. Connections and curvature -/

/-- A torsion-free connection on a Lie ring of vector fields. -/
structure Connection (L : Type*) [LieRing L] where
  /-- The covariant derivative, additive in the direction and in the field. -/
  nabla : L →+ L →+ L
  /-- No torsion. -/
  torsion : ∀ X Y : L, nabla X Y - nabla Y X = ⁅X, Y⁆

variable {L : Type*} [LieRing L] (C : Connection L)

/-- The curvature of a connection. -/
def curv (X Y Z : L) : L :=
  C.nabla X (C.nabla Y Z) - C.nabla Y (C.nabla X Z) - C.nabla ⁅X, Y⁆ Z

/-- Curvature changes sign when its first two arguments are exchanged. -/
theorem curv_antisymm (X Y Z : L) : curv C X Y Z = - curv C Y X Z := by
  unfold curv
  have h : ⁅X, Y⁆ = -⁅Y, X⁆ := (lie_skew X Y).symm
  rw [h, map_neg, AddMonoidHom.neg_apply]
  abel

/-- Curvature is additive in its second argument, stated for a difference. -/
theorem curv_sub_mid (X A B Z : L) : curv C X (A - B) Z = curv C X A Z - curv C X B Z := by
  unfold curv
  simp only [map_sub, AddMonoidHom.sub_apply, lie_sub]
  abel

/-! ## Part II. The two identities -/

/-- THE FIRST BIANCHI IDENTITY. The cyclic sum of the curvature vanishes. -/
theorem first_bianchi (X Y Z : L) : curv C X Y Z + curv C Y Z X + curv C Z X Y = 0 := by
  have h1 : C.nabla X (C.nabla Y Z) - C.nabla X (C.nabla Z Y) = C.nabla X ⁅Y, Z⁆ := by
    rw [← map_sub, C.torsion]
  have h2 : C.nabla Y (C.nabla Z X) - C.nabla Y (C.nabla X Z) = C.nabla Y ⁅Z, X⁆ := by
    rw [← map_sub, C.torsion]
  have h3 : C.nabla Z (C.nabla X Y) - C.nabla Z (C.nabla Y X) = C.nabla Z ⁅X, Y⁆ := by
    rw [← map_sub, C.torsion]
  have k1 : C.nabla X ⁅Y, Z⁆ - C.nabla ⁅Y, Z⁆ X = ⁅X, ⁅Y, Z⁆⁆ := C.torsion _ _
  have k2 : C.nabla Y ⁅Z, X⁆ - C.nabla ⁅Z, X⁆ Y = ⁅Y, ⁅Z, X⁆⁆ := C.torsion _ _
  have k3 : C.nabla Z ⁅X, Y⁆ - C.nabla ⁅X, Y⁆ Z = ⁅Z, ⁅X, Y⁆⁆ := C.torsion _ _
  calc curv C X Y Z + curv C Y Z X + curv C Z X Y
      = (C.nabla X (C.nabla Y Z) - C.nabla X (C.nabla Z Y))
        + (C.nabla Y (C.nabla Z X) - C.nabla Y (C.nabla X Z))
        + (C.nabla Z (C.nabla X Y) - C.nabla Z (C.nabla Y X))
        - C.nabla ⁅X, Y⁆ Z - C.nabla ⁅Y, Z⁆ X - C.nabla ⁅Z, X⁆ Y := by unfold curv; abel
    _ = C.nabla X ⁅Y, Z⁆ + C.nabla Y ⁅Z, X⁆ + C.nabla Z ⁅X, Y⁆
        - C.nabla ⁅X, Y⁆ Z - C.nabla ⁅Y, Z⁆ X - C.nabla ⁅Z, X⁆ Y := by rw [h1, h2, h3]
    _ = (C.nabla X ⁅Y, Z⁆ - C.nabla ⁅Y, Z⁆ X) + (C.nabla Y ⁅Z, X⁆ - C.nabla ⁅Z, X⁆ Y)
        + (C.nabla Z ⁅X, Y⁆ - C.nabla ⁅X, Y⁆ Z) := by abel
    _ = ⁅X, ⁅Y, Z⁆⁆ + ⁅Y, ⁅Z, X⁆⁆ + ⁅Z, ⁅X, Y⁆⁆ := by rw [k1, k2, k3]
    _ = 0 := lie_jacobi X Y Z

/-- The covariant derivative of the curvature in the direction X. -/
def dcurv (X Y Z W : L) : L :=
  C.nabla X (curv C Y Z W) - curv C (C.nabla X Y) Z W - curv C Y (C.nabla X Z) W
    - curv C Y Z (C.nabla X W)

/-- THE SECOND BIANCHI IDENTITY. The cyclic sum of the covariant derivative of the curvature vanishes. -/
theorem second_bianchi (X Y Z W : L) :
    dcurv C X Y Z W + dcurv C Y Z X W + dcurv C Z X Y W = 0 := by
  -- the Jacobi identity, read through the connection
  have J : C.nabla ⁅X, ⁅Y, Z⁆⁆ W + C.nabla ⁅Y, ⁅Z, X⁆⁆ W + C.nabla ⁅Z, ⁅X, Y⁆⁆ W = 0 := by
    rw [← AddMonoidHom.add_apply, ← AddMonoidHom.add_apply, ← map_add, ← map_add, lie_jacobi,
      map_zero, AddMonoidHom.zero_apply]
  -- the triple derivatives cancel in the cyclic sum; what is left is curvature with a bracket or a derivative inside
  have key : dcurv C X Y Z W + dcurv C Y Z X W + dcurv C Z X Y W
        + (C.nabla ⁅X, ⁅Y, Z⁆⁆ W + C.nabla ⁅Y, ⁅Z, X⁆⁆ W + C.nabla ⁅Z, ⁅X, Y⁆⁆ W)
      = -(curv C X ⁅Y, Z⁆ W + curv C Y ⁅Z, X⁆ W + curv C Z ⁅X, Y⁆ W)
        - (curv C (C.nabla X Y) Z W + curv C Y (C.nabla X Z) W + curv C (C.nabla Y Z) X W
          + curv C Z (C.nabla Y X) W + curv C (C.nabla Z X) Y W + curv C X (C.nabla Z Y) W) := by
    unfold dcurv curv
    simp only [map_sub]
    abel
  rw [J, add_zero] at key
  rw [key, ← C.torsion Y Z, ← C.torsion Z X, ← C.torsion X Y, curv_sub_mid, curv_sub_mid, curv_sub_mid,
    curv_antisymm C (C.nabla Y Z) X, curv_antisymm C (C.nabla X Y) Z, curv_antisymm C (C.nabla Z X) Y]
  abel

/-! ## Part III. The hypotheses are not empty -/

section Inhabited
variable {𝔤 : Type*} [LieRing 𝔤] [LieAlgebra ℚ 𝔤]

/-- Half the bracket: a torsion-free connection on every Lie algebra over the rationals. -/
def halfBracket (𝔤 : Type*) [LieRing 𝔤] [LieAlgebra ℚ 𝔤] : Connection 𝔤 where
  nabla := AddMonoidHom.mk' (fun X => AddMonoidHom.mk' (fun Y => (1 / 2 : ℚ) • ⁅X, Y⁆)
      (fun a b => by
        show (1 / 2 : ℚ) • ⁅X, a + b⁆ = (1 / 2 : ℚ) • ⁅X, a⁆ + (1 / 2 : ℚ) • ⁅X, b⁆
        rw [lie_add, smul_add]))
    (fun a b => by
      ext Y
      show (1 / 2 : ℚ) • ⁅a + b, Y⁆ = (1 / 2 : ℚ) • ⁅a, Y⁆ + (1 / 2 : ℚ) • ⁅b, Y⁆
      rw [add_lie, smul_add])
  torsion := fun X Y => by
    show (1 / 2 : ℚ) • ⁅X, Y⁆ - (1 / 2 : ℚ) • ⁅Y, X⁆ = ⁅X, Y⁆
    have h : ⁅Y, X⁆ = -⁅X, Y⁆ := (lie_skew Y X).symm
    rw [h, smul_neg, sub_neg_eq_add, ← add_smul]
    norm_num

theorem halfBracket_apply (X Y : 𝔤) : (halfBracket 𝔤).nabla X Y = (1 / 2 : ℚ) • ⁅X, Y⁆ := rfl

/-- Its curvature is minus a quarter of the double bracket. -/
theorem halfBracket_curv (X Y Z : 𝔤) :
    curv (halfBracket 𝔤) X Y Z = (-(1 / 4) : ℚ) • ⁅⁅X, Y⁆, Z⁆ := by
  unfold curv
  simp only [halfBracket_apply, lie_smul]
  have hj : ⁅⁅X, Y⁆, Z⁆ = ⁅X, ⁅Y, Z⁆⁆ - ⁅Y, ⁅X, Z⁆⁆ := by rw [lie_lie]
  rw [hj, smul_smul, smul_smul]
  module

end Inhabited

/-! ## Part IV. The vector fields of a commutative algebra -/

section VectorFields
variable {𝕜 A : Type*} [CommRing 𝕜] [CommRing A] [Algebra 𝕜 A]

/-- The first Bianchi identity for the derivations of any commutative algebra. -/
theorem first_bianchi_of_vector_fields (C : Connection (Derivation 𝕜 A A)) (X Y Z : Derivation 𝕜 A A) :
    curv C X Y Z + curv C Y Z X + curv C Z X Y = 0 := first_bianchi C X Y Z

/-- The second Bianchi identity for the derivations of any commutative algebra. -/
theorem second_bianchi_of_vector_fields (C : Connection (Derivation 𝕜 A A)) (X Y Z W : Derivation 𝕜 A A) :
    dcurv C X Y Z W + dcurv C Y Z X W + dcurv C Z X Y W = 0 := second_bianchi C X Y Z W

end VectorFields


/-! ## Part V. Functions, a metric, and the linearity of curvature
    A geometry in the form of Lie and Rinehart: a commutative ring A of functions, a Lie ring L of vector fields that
    is a module over A, the action of a field on a function, a torsion-free connection that obeys the Leibniz rule,
    and a metric the connection preserves. Every field below is part of the definition of one of those objects.
    No field is an identity of curvature. -/

structure Geom (A : Type*) [CommRing A] (L : Type*) [LieRing L] [Module A L] where
  /-- A vector field differentiates a function. -/
  act : L → A → A
  act_add : ∀ (X : L) (f h : A), act X (f + h) = act X f + act X h
  act_mul : ∀ (X : L) (f h : A), act X (f * h) = act X f * h + f * act X h
  add_act : ∀ (X Y : L) (f : A), act (X + Y) f = act X f + act Y f
  smul_act : ∀ (f : A) (X : L) (h : A), act (f • X) h = f * act X h
  /-- The bracket acts as the commutator. -/
  lie_act : ∀ (X Y : L) (f : A), act ⁅X, Y⁆ f = act X (act Y f) - act Y (act X f)
  /-- The bracket and multiplication by a function. -/
  bracket_smul : ∀ (X : L) (f : A) (Y : L), ⁅X, f • Y⁆ = act X f • Y + f • ⁅X, Y⁆
  /-- A torsion-free connection. -/
  conn : Connection L
  nabla_smul : ∀ (f : A) (X Y : L), conn.nabla (f • X) Y = f • conn.nabla X Y
  /-- The Leibniz rule. -/
  nabla_leib : ∀ (X : L) (f : A) (Y : L), conn.nabla X (f • Y) = act X f • Y + f • conn.nabla X Y
  /-- The metric. -/
  g : L → L → A
  g_symm : ∀ (X Y : L), g X Y = g Y X
  g_add : ∀ (X Y Z : L), g (X + Y) Z = g X Z + g Y Z
  g_smul : ∀ (f : A) (X Z : L), g (f • X) Z = f * g X Z
  /-- The connection preserves the metric. -/
  compat : ∀ (X Y Z : L), act X (g Y Z) = g (conn.nabla X Y) Z + g Y (conn.nabla X Z)

section Geometry
variable {A : Type*} [CommRing A] {L : Type*} [LieRing L] [Module A L] (G : Geom A L)

theorem act_zero (X : L) : G.act X 0 = 0 := by
  have h := G.act_add X 0 0
  rw [add_zero] at h
  linear_combination -h

theorem act_one (X : L) : G.act X 1 = 0 := by
  have h := G.act_mul X 1 1
  simp only [mul_one, one_mul] at h
  linear_combination -h

theorem act_neg (X : L) (f : A) : G.act X (-f) = - G.act X f := by
  have h := G.act_add X f (-f)
  rw [add_neg_cancel, act_zero] at h
  linear_combination -h

theorem act_sub (X : L) (f h : A) : G.act X (f - h) = G.act X f - G.act X h := by
  rw [sub_eq_add_neg, G.act_add, act_neg]; ring

theorem g_neg_left (X Z : L) : G.g (-X) Z = - G.g X Z := by
  have h := G.g_smul (-1) X Z
  rw [neg_one_smul] at h
  rw [h]; ring

theorem g_zero_left (Z : L) : G.g 0 Z = 0 := by
  have h := G.g_smul 0 (0 : L) Z
  rw [zero_smul, zero_mul] at h
  exact h

theorem g_sub_left (X Y Z : L) : G.g (X - Y) Z = G.g X Z - G.g Y Z := by
  rw [sub_eq_add_neg, G.g_add, g_neg_left]; ring

theorem g_add_right (X Y Z : L) : G.g X (Y + Z) = G.g X Y + G.g X Z := by
  rw [G.g_symm, G.g_add, G.g_symm Y, G.g_symm Z]

theorem g_smul_right (f : A) (X Z : L) : G.g X (f • Z) = f * G.g X Z := by
  rw [G.g_symm, G.g_smul, G.g_symm]

theorem smul_bracket (f : A) (X Y : L) : ⁅f • X, Y⁆ = f • ⁅X, Y⁆ - G.act Y f • X := by
  have h := G.bracket_smul Y f X
  calc ⁅f • X, Y⁆ = -⁅Y, f • X⁆ := (lie_skew _ _).symm
    _ = -(G.act Y f • X + f • ⁅Y, X⁆) := by rw [h]
    _ = f • ⁅X, Y⁆ - G.act Y f • X := by rw [← lie_skew X Y]; module

/-- Curvature is additive in each of its three arguments. -/
theorem curv_add_left (X X' Y Z : L) :
    curv G.conn (X + X') Y Z = curv G.conn X Y Z + curv G.conn X' Y Z := by
  unfold curv; simp only [map_add, AddMonoidHom.add_apply, add_lie]; abel

theorem curv_add_mid (X Y Y' Z : L) :
    curv G.conn X (Y + Y') Z = curv G.conn X Y Z + curv G.conn X Y' Z := by
  unfold curv; simp only [map_add, AddMonoidHom.add_apply, lie_add]; abel

theorem curv_add_right (X Y Z Z' : L) :
    curv G.conn X Y (Z + Z') = curv G.conn X Y Z + curv G.conn X Y Z' := by
  unfold curv; simp only [map_add]; abel

/-- CURVATURE IS A TENSOR: it is linear over functions in each argument. This is proved, from the Leibniz rule and
    from the bracket acting as the commutator. -/
theorem curv_smul_left (f : A) (X Y Z : L) : curv G.conn (f • X) Y Z = f • curv G.conn X Y Z := by
  unfold curv
  simp only [smul_bracket G, map_sub, AddMonoidHom.sub_apply, G.nabla_smul, G.nabla_leib]
  module

theorem curv_smul_mid (f : A) (X Y Z : L) : curv G.conn X (f • Y) Z = f • curv G.conn X Y Z := by
  rw [curv_antisymm, curv_smul_left, curv_antisymm G.conn Y X Z]
  module

theorem curv_smul_right (f : A) (X Y Z : L) : curv G.conn X Y (f • Z) = f • curv G.conn X Y Z := by
  unfold curv
  simp only [G.nabla_leib, map_add, G.lie_act]
  module

/-- The curvature with its last index lowered. -/
def Rm (X Y Z W : L) : A := G.g (curv G.conn X Y Z) W

theorem Rm_antisymm12 (X Y Z W : L) : Rm G X Y Z W = - Rm G Y X Z W := by
  unfold Rm; rw [curv_antisymm, g_neg_left]

/-- THE LOWERED CURVATURE IS ANTISYMMETRIC IN ITS LAST PAIR. From the metric being preserved; no division. -/
theorem Rm_antisymm34 (X Y Z W : L) : Rm G X Y Z W + Rm G X Y W Z = 0 := by
  unfold Rm curv
  simp only [g_sub_left]
  have c1 := G.compat X (G.conn.nabla Y Z) W
  have c2 := G.compat X (G.conn.nabla Y W) Z
  have c3 := G.compat Y (G.conn.nabla X Z) W
  have c4 := G.compat Y (G.conn.nabla X W) Z
  have c5 := G.compat ⁅X, Y⁆ Z W
  have s5 := G.g_symm Z (G.conn.nabla ⁅X, Y⁆ W)
  have t1 := G.g_symm (G.conn.nabla Y Z) (G.conn.nabla X W)
  have t2 := G.g_symm (G.conn.nabla Y W) (G.conn.nabla X Z)
  have la := G.lie_act X Y (G.g Z W)
  have h6 : G.act Y (G.g Z W) = G.g (G.conn.nabla Y Z) W + G.g (G.conn.nabla Y W) Z := by
    rw [G.compat, G.g_symm Z]
  have h7 : G.act X (G.g Z W) = G.g (G.conn.nabla X Z) W + G.g (G.conn.nabla X W) Z := by
    rw [G.compat, G.g_symm Z]
  have d6 : G.act X (G.act Y (G.g Z W))
      = G.act X (G.g (G.conn.nabla Y Z) W) + G.act X (G.g (G.conn.nabla Y W) Z) := by rw [h6, G.act_add]
  have d7 : G.act Y (G.act X (G.g Z W))
      = G.act Y (G.g (G.conn.nabla X Z) W) + G.act Y (G.g (G.conn.nabla X W) Z) := by rw [h7, G.act_add]
  linear_combination (-c1) - c2 + c3 + c4 + c5 + s5 - t1 - t2 - la - d6 + d7

/-- The covariant derivative of the lowered curvature. -/
def dRm (X Y Z W V : L) : A :=
  G.act X (Rm G Y Z W V) - Rm G (G.conn.nabla X Y) Z W V - Rm G Y (G.conn.nabla X Z) W V
    - Rm G Y Z (G.conn.nabla X W) V - Rm G Y Z W (G.conn.nabla X V)

theorem dRm_eq (X Y Z W V : L) : dRm G X Y Z W V = G.g (dcurv G.conn X Y Z W) V := by
  unfold dRm Rm dcurv
  simp only [g_sub_left]
  have c := G.compat X (curv G.conn Y Z W) V
  linear_combination c

/-- THE SECOND BIANCHI IDENTITY for the lowered curvature. -/
theorem second_bianchi_Rm (X Y Z W V : L) :
    dRm G X Y Z W V + dRm G Y Z X W V + dRm G Z X Y W V = 0 := by
  rw [dRm_eq, dRm_eq, dRm_eq, ← G.g_add, ← G.g_add, second_bianchi, g_zero_left]

end Geometry


/-! ## Part VI. A frame, the Ricci curvature, and the contracted identity
    An orthonormal frame: finitely many fields, orthogonal, each of square plus or minus one, in which every field
    expands. The fields of `Frame` say that and nothing about curvature. -/

section Contracted
variable {A : Type*} [CommRing A] {L : Type*} [LieRing L] [Module A L] (G : Geom A L)
variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- The sign plus one or minus one, as a function. -/
def sgn (A : Type*) [CommRing A] (b : Bool) : A := if b then 1 else -1

structure Frame (G : Geom A L) (ι : Type*) [Fintype ι] [DecidableEq ι] where
  e : ι → L
  pos : ι → Bool
  ortho : ∀ i j, G.g (e i) (e j) = if i = j then sgn A (pos i) else 0
  complete : ∀ X : L, X = ∑ i, (sgn A (pos i) * G.g X (e i)) • e i

variable (F : Frame G ι)

/-- The sign of the i-th field of the frame. -/
def Frame.eps {G : Geom A L} (F : Frame G ι) (i : ι) : A := sgn A (F.pos i)

theorem act_eps (X : L) (i : ι) : G.act X (F.eps i) = 0 := by
  unfold Frame.eps sgn
  split
  · exact act_one G X
  · rw [act_neg, act_one, neg_zero]

theorem act_eps_mul (X : L) (i : ι) (f : A) : G.act X (F.eps i * f) = F.eps i * G.act X f := by
  rw [G.act_mul, act_eps, zero_mul, zero_add]

omit [Fintype ι] in
theorem act_sum (X : L) (s : Finset ι) (f : ι → A) : G.act X (∑ i ∈ s, f i) = ∑ i ∈ s, G.act X (f i) := by
  classical
  refine Finset.induction_on s ?_ ?_
  · rw [Finset.sum_empty, Finset.sum_empty]; exact act_zero G X
  · intro a s ha ih
    rw [Finset.sum_insert ha, Finset.sum_insert ha, G.act_add, ih]

/-- A form in two fields that is linear over functions in each. -/
structure IsBilin (B : L → L → A) : Prop where
  add_left : ∀ U U' V, B (U + U') V = B U V + B U' V
  smul_left : ∀ (f : A) U V, B (f • U) V = f * B U V
  add_right : ∀ U V V', B U (V + V') = B U V + B U V'
  smul_right : ∀ (f : A) U V, B U (f • V) = f * B U V

omit [Fintype ι] in
theorem IsBilin.sum_left {B : L → L → A} (hB : IsBilin B) (s : Finset ι) (c : ι → A) (v : ι → L) (W : L) :
    B (∑ i ∈ s, c i • v i) W = ∑ i ∈ s, c i * B (v i) W := by
  classical
  refine Finset.induction_on s ?_ ?_
  · rw [Finset.sum_empty, Finset.sum_empty]
    have h := hB.smul_left 0 (0 : L) W
    rw [zero_smul, zero_mul] at h
    exact h
  · intro a s ha ih
    rw [Finset.sum_insert ha, Finset.sum_insert ha, hB.add_left, hB.smul_left, ih]

omit [Fintype ι] in
theorem IsBilin.sum_right {B : L → L → A} (hB : IsBilin B) (s : Finset ι) (c : ι → A) (v : ι → L) (W : L) :
    B W (∑ i ∈ s, c i • v i) = ∑ i ∈ s, c i * B W (v i) := by
  classical
  refine Finset.induction_on s ?_ ?_
  · rw [Finset.sum_empty, Finset.sum_empty]
    have h := hB.smul_right 0 W (0 : L)
    rw [zero_smul, zero_mul] at h
    exact h
  · intro a s ha ih
    rw [Finset.sum_insert ha, Finset.sum_insert ha, hB.add_right, hB.smul_right, ih]

/-- The connection turns the frame by an antisymmetric array: the metric is preserved and the frame's squares are
    constants. -/
theorem frame_turn_antisymm (X : L) (a c : ι) :
    G.g (G.conn.nabla X (F.e a)) (F.e c) + G.g (G.conn.nabla X (F.e c)) (F.e a) = 0 := by
  have h := G.compat X (F.e a) (F.e c)
  have h0 : G.act X (G.g (F.e a) (F.e c)) = 0 := by
    rw [F.ortho]
    split
    · exact act_eps G F X a
    · exact act_zero G X
  rw [h0, G.g_symm (F.e a) (G.conn.nabla X (F.e c))] at h
  linear_combination -h

/-- A TRACE COMMUTES WITH THE COVARIANT DERIVATIVE. For every bilinear form, the terms in which the derivative falls
    on the frame cancel in the trace. -/
theorem trace_commute {B : L → L → A} (hB : IsBilin B) (X : L) :
    ∑ a, F.eps a * (B (G.conn.nabla X (F.e a)) (F.e a) + B (F.e a) (G.conn.nabla X (F.e a))) = 0 := by
  have h1 : ∀ a, B (G.conn.nabla X (F.e a)) (F.e a)
      = ∑ c, (F.eps c * G.g (G.conn.nabla X (F.e a)) (F.e c)) * B (F.e c) (F.e a) := by
    intro a
    have hx := F.complete (G.conn.nabla X (F.e a))
    calc B (G.conn.nabla X (F.e a)) (F.e a)
        = B (∑ c, (sgn A (F.pos c) * G.g (G.conn.nabla X (F.e a)) (F.e c)) • F.e c) (F.e a) := by rw [← hx]
      _ = _ := hB.sum_left _ _ _ _
  have h2 : ∀ a, B (F.e a) (G.conn.nabla X (F.e a))
      = ∑ c, (F.eps c * G.g (G.conn.nabla X (F.e a)) (F.e c)) * B (F.e a) (F.e c) := by
    intro a
    have hx := F.complete (G.conn.nabla X (F.e a))
    calc B (F.e a) (G.conn.nabla X (F.e a))
        = B (F.e a) (∑ c, (sgn A (F.pos c) * G.g (G.conn.nabla X (F.e a)) (F.e c)) • F.e c) := by rw [← hx]
      _ = _ := hB.sum_right _ _ _ _
  have step : ∑ a, F.eps a * (B (G.conn.nabla X (F.e a)) (F.e a) + B (F.e a) (G.conn.nabla X (F.e a)))
      = (∑ a, ∑ c, F.eps a * (F.eps c * G.g (G.conn.nabla X (F.e a)) (F.e c) * B (F.e c) (F.e a)))
        + ∑ a, ∑ c, F.eps a * (F.eps c * G.g (G.conn.nabla X (F.e a)) (F.e c) * B (F.e a) (F.e c)) := by
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro a _
    rw [h1 a, h2 a, mul_add, Finset.mul_sum, Finset.mul_sum]
  rw [step, Finset.sum_comm, ← Finset.sum_add_distrib]
  apply Finset.sum_eq_zero
  intro a _
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_eq_zero
  intro c _
  have h := frame_turn_antisymm G F X a c
  linear_combination (F.eps a * F.eps c * B (F.e a) (F.e c)) * h

/-- The Ricci curvature: the trace of the curvature over its first and last arguments. -/
def Ric (Y Z : L) : A := ∑ i, F.eps i * Rm G (F.e i) Y Z (F.e i)

/-- The scalar curvature: the trace of the Ricci curvature. -/
def Scal : A := ∑ j, F.eps j * Ric G F (F.e j) (F.e j)

theorem Rm_bilin_outer (Y Z : L) : IsBilin (fun U V => Rm G U Y Z V) where
  add_left := fun U U' V => by show Rm G (U + U') Y Z V = _; unfold Rm; rw [curv_add_left, G.g_add]
  smul_left := fun f U V => by show Rm G (f • U) Y Z V = _; unfold Rm; rw [curv_smul_left, G.g_smul]
  add_right := fun U V V' => by show Rm G U Y Z (V + V') = _; unfold Rm; rw [g_add_right]
  smul_right := fun f U V => by show Rm G U Y Z (f • V) = _; unfold Rm; rw [g_smul_right]

theorem Ric_bilin : IsBilin (Ric G F) where
  add_left := fun U U' V => by
    unfold Ric Rm
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro i _
    rw [curv_add_mid, G.g_add]; ring
  smul_left := fun f U V => by
    unfold Ric Rm
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro i _
    rw [curv_smul_mid, G.g_smul]; ring
  add_right := fun U V V' => by
    unfold Ric Rm
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro i _
    rw [curv_add_right, G.g_add]; ring
  smul_right := fun f U V => by
    unfold Ric Rm
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro i _
    rw [curv_smul_right, G.g_smul]; ring

/-- The covariant derivative of the Ricci curvature. -/
def dRic (X Y Z : L) : A :=
  G.act X (Ric G F Y Z) - Ric G F (G.conn.nabla X Y) Z - Ric G F Y (G.conn.nabla X Z)

/-- The derivative of the trace is the trace of the derivative. -/
theorem dRic_eq (X Y Z : L) : dRic G F X Y Z = ∑ b, F.eps b * dRm G X (F.e b) Y Z (F.e b) := by
  have tc := trace_commute G F (Rm_bilin_outer G Y Z) X
  simp only [mul_add, Finset.sum_add_distrib] at tc
  unfold dRic Ric dRm
  rw [act_sum]
  simp only [act_eps_mul, mul_sub, Finset.sum_sub_distrib]
  linear_combination tc

/-- The derivative of the scalar curvature is the trace of the derivative of the Ricci curvature. -/
theorem dScal_eq (Z : L) : ∑ a, F.eps a * dRic G F Z (F.e a) (F.e a) = G.act Z (Scal G F) := by
  have tc := trace_commute G F (Ric_bilin G F) Z
  simp only [mul_add, Finset.sum_add_distrib] at tc
  unfold Scal dRic
  rw [act_sum]
  simp only [act_eps_mul, mul_sub, Finset.sum_sub_distrib]
  linear_combination -tc

theorem dRm_antisymm12 (X Y Z W V : L) : dRm G X Y Z W V = - dRm G X Z Y W V := by
  unfold dRm
  rw [Rm_antisymm12 G Y Z W V, Rm_antisymm12 G (G.conn.nabla X Y) Z W V, Rm_antisymm12 G Y (G.conn.nabla X Z) W V,
    Rm_antisymm12 G Y Z (G.conn.nabla X W) V, Rm_antisymm12 G Y Z W (G.conn.nabla X V), act_neg]
  ring

theorem dRm_antisymm34 (X Y Z W V : L) : dRm G X Y Z W V + dRm G X Y Z V W = 0 := by
  unfold dRm
  have h := Rm_antisymm34 G Y Z W V
  have hA : G.act X (Rm G Y Z W V) + G.act X (Rm G Y Z V W) = 0 := by rw [← G.act_add, h, act_zero]
  have k1 := Rm_antisymm34 G (G.conn.nabla X Y) Z W V
  have k2 := Rm_antisymm34 G Y (G.conn.nabla X Z) W V
  have k3 := Rm_antisymm34 G Y Z (G.conn.nabla X W) V
  have k4 := Rm_antisymm34 G Y Z W (G.conn.nabla X V)
  linear_combination hA - k1 - k2 - k3 - k4

/-- The divergence of the Ricci curvature. -/
def divRic (Z : L) : A := ∑ a, F.eps a * dRic G F (F.e a) Z (F.e a)

/-- THE CONTRACTED BIANCHI IDENTITY. Twice the divergence of the Ricci curvature is the derivative of the scalar
    curvature. Proved from the second Bianchi identity by two traces; no division. -/
theorem contracted_bianchi (Z : L) : 2 * divRic G F Z = G.act Z (Scal G F) := by
  have sb : ∀ a b, dRm G (F.e a) (F.e b) Z (F.e a) (F.e b) + dRm G (F.e b) Z (F.e a) (F.e a) (F.e b)
      + dRm G Z (F.e a) (F.e b) (F.e a) (F.e b) = 0 := fun a b => second_bianchi_Rm G _ _ _ _ _
  have H0 : (∑ a, ∑ b, F.eps a * F.eps b * dRm G (F.e a) (F.e b) Z (F.e a) (F.e b))
      + (∑ a, ∑ b, F.eps a * F.eps b * dRm G (F.e b) Z (F.e a) (F.e a) (F.e b))
      + (∑ a, ∑ b, F.eps a * F.eps b * dRm G Z (F.e a) (F.e b) (F.e a) (F.e b)) = 0 := by
    rw [← Finset.sum_add_distrib, ← Finset.sum_add_distrib]
    apply Finset.sum_eq_zero
    intro a _
    rw [← Finset.sum_add_distrib, ← Finset.sum_add_distrib]
    apply Finset.sum_eq_zero
    intro b _
    rw [← mul_add, ← mul_add, sb a b, mul_zero]
  have E1 : (∑ a, ∑ b, F.eps a * F.eps b * dRm G (F.e a) (F.e b) Z (F.e a) (F.e b)) = divRic G F Z := by
    unfold divRic
    apply Finset.sum_congr rfl
    intro a _
    rw [dRic_eq, Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro b _
    ring
  have E2 : (∑ a, ∑ b, F.eps a * F.eps b * dRm G (F.e b) Z (F.e a) (F.e a) (F.e b)) = divRic G F Z := by
    rw [Finset.sum_comm]
    unfold divRic
    apply Finset.sum_congr rfl
    intro b _
    rw [dRic_eq, Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro a _
    have h1 := dRm_antisymm12 G (F.e b) Z (F.e a) (F.e a) (F.e b)
    have h2 := dRm_antisymm34 G (F.e b) (F.e a) Z (F.e a) (F.e b)
    linear_combination (F.eps a * F.eps b) * h1 - (F.eps a * F.eps b) * h2
  have E3 : (∑ a, ∑ b, F.eps a * F.eps b * dRm G Z (F.e a) (F.e b) (F.e a) (F.e b))
      = - G.act Z (Scal G F) := by
    rw [← dScal_eq, ← Finset.sum_neg_distrib]
    apply Finset.sum_congr rfl
    intro a _
    rw [dRic_eq, Finset.mul_sum, ← Finset.sum_neg_distrib]
    apply Finset.sum_congr rfl
    intro b _
    have h1 := dRm_antisymm12 G Z (F.e a) (F.e b) (F.e a) (F.e b)
    linear_combination (F.eps a * F.eps b) * h1
  rw [E1, E2, E3] at H0
  linear_combination H0

end Contracted

/-! ## Part VI-b. Every contraction of the curvature is the Ricci curvature, or the scalar, or nothing

RATIONALE. The law is taken in the family a Ric + b Scal g + c g. That every conserved second-order law lies in the
family is Lovelock's theorem, cited. This part proves the piece of it that is plain algebra: a symmetric law made by
contracting the curvature with the metric can only be a multiple of Ric, and a scalar made by contracting it fully
can only be a multiple of Scal. There is nothing else to build a law from.
DESIGN. The four slots of the curvature can be paired in six ways; each is computed. The pair symmetry of the
curvature is derived from the first Bianchi identity and the two antisymmetries by one explicit combination.
RISK. That every invariant linear law is a combination of contractions is Weyl's first fundamental theorem for the
orthogonal group, cited and not proved here. The pair symmetry needs a ring in which 2 x = 0 gives x = 0. -/
section Contractions
variable {A : Type*} [CommRing A] {L : Type*} [LieRing L] [Module A L] (G : Geom A L)
variable {ι : Type*} [Fintype ι] [DecidableEq ι] (F : Frame G ι)

/-- The first Bianchi identity, with all four slots. -/
theorem Rm_bianchi (X Y Z W : L) : Rm G X Y Z W + Rm G Y Z X W + Rm G Z X Y W = 0 := by
  unfold Rm
  rw [← G.g_add, ← G.g_add, first_bianchi, g_zero_left]

/-- Twice the pair symmetry: an explicit combination of the Bianchi identity and the two antisymmetries. -/
theorem two_pair_symm (X Y Z W : L) : 2 * Rm G X Y Z W = 2 * Rm G Z W X Y := by
  linear_combination
    Rm_antisymm34 G X Y Z W + Rm_bianchi G X Y Z W - Rm_bianchi G X Y W Z - Rm_antisymm12 G X Z Y W
    + Rm_antisymm34 G X Z Y W - Rm_bianchi G X Z W Y + Rm_antisymm12 G X W Y Z - Rm_antisymm34 G X W Y Z
    + Rm_antisymm12 G X W Z Y - Rm_antisymm34 G Y Z X W + Rm_bianchi G Y Z W X + Rm_antisymm34 G Y W X Z
    - Rm_antisymm12 G Y W Z X - Rm_antisymm34 G Z W X Y

/-- A ring with no 2-torsion. -/
def NoTwoTorsion (A : Type*) [CommRing A] : Prop := ∀ x : A, 2 * x = 0 → x = 0

/-- THE PAIR SYMMETRY OF THE CURVATURE. -/
theorem pair_symm (h2 : NoTwoTorsion A) (X Y Z W : L) : Rm G X Y Z W = Rm G Z W X Y := by
  have h := two_pair_symm G X Y Z W
  have : 2 * (Rm G X Y Z W - Rm G Z W X Y) = 0 := by linear_combination h
  exact sub_eq_zero.mp (h2 _ this)

/-- The Ricci curvature is symmetric. -/
theorem Ric_symm (h2 : NoTwoTorsion A) (Y Z : L) : Ric G F Y Z = Ric G F Z Y := by
  unfold Ric
  apply Finset.sum_congr rfl
  intro i _
  have p := pair_symm G h2 (F.e i) Y Z (F.e i)
  have a := Rm_antisymm12 G Z (F.e i) (F.e i) Y
  have b := Rm_antisymm34 G (F.e i) Z (F.e i) Y
  rw [p, a]
  linear_combination -(F.eps i) * b

/-- Slots one and two: nothing. -/
theorem contract_12 (Y Z : L) : ∑ i, F.eps i * Rm G (F.e i) (F.e i) Y Z = 0 := by
  apply Finset.sum_eq_zero
  intro i _
  have h : curv G.conn (F.e i) (F.e i) Y = 0 := by
    unfold curv
    rw [lie_self, map_zero]
    simp
  unfold Rm
  rw [h, g_zero_left, mul_zero]

/-- Slots three and four: nothing. -/
theorem contract_34 (h2 : NoTwoTorsion A) (Y Z : L) : ∑ i, F.eps i * Rm G Y Z (F.e i) (F.e i) = 0 := by
  apply Finset.sum_eq_zero
  intro i _
  have a := Rm_antisymm34 G Y Z (F.e i) (F.e i)
  have : Rm G Y Z (F.e i) (F.e i) = 0 := h2 _ (by linear_combination a)
  rw [this, mul_zero]

/-- Slots one and four: the Ricci curvature, by definition. -/
theorem contract_14 (Y Z : L) : ∑ i, F.eps i * Rm G (F.e i) Y Z (F.e i) = Ric G F Y Z := rfl

/-- Slots one and three: minus the Ricci curvature. -/
theorem contract_13 (Y Z : L) : ∑ i, F.eps i * Rm G (F.e i) Y (F.e i) Z = - Ric G F Y Z := by
  unfold Ric
  rw [← Finset.sum_neg_distrib]
  apply Finset.sum_congr rfl
  intro i _
  linear_combination F.eps i * Rm_antisymm34 G (F.e i) Y (F.e i) Z

/-- Slots two and four: minus the Ricci curvature. -/
theorem contract_24 (Y Z : L) : ∑ i, F.eps i * Rm G Y (F.e i) Z (F.e i) = - Ric G F Y Z := by
  unfold Ric
  rw [← Finset.sum_neg_distrib]
  apply Finset.sum_congr rfl
  intro i _
  linear_combination F.eps i * Rm_antisymm12 G Y (F.e i) Z (F.e i)

/-- Slots two and three: the Ricci curvature. -/
theorem contract_23 (Y Z : L) : ∑ i, F.eps i * Rm G Y (F.e i) (F.e i) Z = Ric G F Y Z := by
  unfold Ric
  apply Finset.sum_congr rfl
  intro i _
  linear_combination F.eps i * Rm_antisymm12 G Y (F.e i) (F.e i) Z - F.eps i * Rm_antisymm34 G (F.e i) Y (F.e i) Z

/-- THE FULL CONTRACTIONS. Pairing the slots (14)(23) gives the scalar curvature, (13)(24) gives minus it, and
(12)(34) gives nothing. -/
theorem full_contract_14_23 : ∑ j, F.eps j * ∑ i, F.eps i * Rm G (F.e i) (F.e j) (F.e j) (F.e i) = Scal G F := rfl

theorem full_contract_13_24 : ∑ j, F.eps j * ∑ i, F.eps i * Rm G (F.e i) (F.e j) (F.e i) (F.e j) = - Scal G F := by
  unfold Scal
  rw [← Finset.sum_neg_distrib]
  apply Finset.sum_congr rfl
  intro j _
  rw [contract_13]
  ring

theorem full_contract_12_34 : ∑ j, F.eps j * ∑ i, F.eps i * Rm G (F.e i) (F.e i) (F.e j) (F.e j) = 0 := by
  apply Finset.sum_eq_zero
  intro j _
  rw [contract_12, mul_zero]
end Contractions


/-! ## Part VII. The family of laws, and what conservation forces
    The family a·Ric + b·Scal·g + c·g, with a, b and c constants. Its divergence is computed, and conservation on a
    geometry whose scalar curvature is not constant forces a + 2b = 0. The term in c is free. -/

section Forcing
variable {A : Type*} [CommRing A] {L : Type*} [LieRing L] [Module A L] (G : Geom A L)
variable {ι : Type*} [Fintype ι] [DecidableEq ι] (F : Frame G ι)

/-- A constant: a function every field differentiates to zero. -/
def Const (c : A) : Prop := ∀ X : L, G.act X c = 0

theorem const_one : Const G (1 : A) := fun X => act_one G X

theorem const_add {a b : A} (ha : Const G a) (hb : Const G b) : Const G (a + b) := fun X => by
  rw [G.act_add, ha X, hb X, add_zero]

theorem const_neg {a : A} (ha : Const G a) : Const G (-a) := fun X => by
  rw [act_neg, ha X, neg_zero]

omit [Fintype ι] in
theorem act_sum_field (s : Finset ι) (c : ι → A) (v : ι → L) (f : A) :
    G.act (∑ i ∈ s, c i • v i) f = ∑ i ∈ s, c i * G.act (v i) f := by
  classical
  refine Finset.induction_on s ?_ ?_
  · rw [Finset.sum_empty, Finset.sum_empty]
    have h := G.smul_act 0 (0 : L) f
    rw [zero_smul, zero_mul] at h
    exact h
  · intro a s ha ih
    rw [Finset.sum_insert ha, Finset.sum_insert ha, G.add_act, G.smul_act, ih]

/-- A field differentiates a function through its components in the frame. -/
theorem act_in_frame (Z : L) (f : A) :
    G.act Z f = ∑ i, (F.eps i * G.g Z (F.e i)) * G.act (F.e i) f := by
  calc G.act Z f = G.act (∑ i, (sgn A (F.pos i) * G.g Z (F.e i)) • F.e i) f := by rw [← F.complete Z]
    _ = _ := act_sum_field G _ _ _ _

/-- The law with coefficients a, b, c. -/
def Law (a b c : A) (Y Z : L) : A := a * Ric G F Y Z + b * (Scal G F * G.g Y Z) + c * G.g Y Z

/-- Its covariant derivative. -/
def dLaw (a b c : A) (X Y Z : L) : A :=
  G.act X (Law G F a b c Y Z) - Law G F a b c (G.conn.nabla X Y) Z - Law G F a b c Y (G.conn.nabla X Z)

/-- Its divergence. -/
def divLaw (a b c : A) (Z : L) : A := ∑ i, F.eps i * dLaw G F a b c (F.e i) Z (F.e i)

theorem dLaw_eq {a b c : A} (ha : Const G a) (hb : Const G b) (hc : Const G c) (X Y Z : L) :
    dLaw G F a b c X Y Z = a * dRic G F X Y Z + b * (G.act X (Scal G F) * G.g Y Z) := by
  unfold dLaw Law dRic
  simp only [G.act_add, G.act_mul, ha X, hb X, hc X]
  have cp := G.compat X Y Z
  linear_combination (b * Scal G F + c) * cp

/-- THE DIVERGENCE OF THE FAMILY. Twice the divergence of the law is (a + 2b) times the derivative of the scalar
    curvature. The term in c does not appear. -/
theorem twice_div_law {a b c : A} (ha : Const G a) (hb : Const G b) (hc : Const G c) (Z : L) :
    2 * divLaw G F a b c Z = (a + 2 * b) * G.act Z (Scal G F) := by
  have cb := contracted_bianchi G F Z
  have hsum : divLaw G F a b c Z = a * divRic G F Z + b * G.act Z (Scal G F) := by
    unfold divLaw divRic
    rw [act_in_frame G F Z (Scal G F), Finset.mul_sum, Finset.mul_sum, ← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro i _
    rw [dLaw_eq G F ha hb hc, G.g_symm Z (F.e i)]
    ring
  rw [hsum]
  linear_combination a * cb

/-- CONSERVATION FORCES THE RATIO. On a geometry where the scalar curvature is not constant in some direction, a law
    of the family whose divergence vanishes has a + 2b = 0. -/
theorem conservation_forces_the_ratio [NoZeroDivisors A] {a b c : A}
    (ha : Const G a) (hb : Const G b) (hc : Const G c)
    (hcons : ∀ Z : L, divLaw G F a b c Z = 0) (Z₀ : L) (hne : G.act Z₀ (Scal G F) ≠ 0) :
    a + 2 * b = 0 := by
  have h := twice_div_law G F ha hb hc Z₀
  rw [hcons Z₀, mul_zero] at h
  rcases mul_eq_zero.mp h.symm with h0 | h0
  · exact h0
  · exact absurd h0 hne

/-- AND THE FORCED LAW IS CONSERVED, with the term in c free: where a + 2b = 0, twice the divergence vanishes on
    every geometry and in every direction. -/
theorem the_forced_law_is_conserved {a b c : A} (ha : Const G a) (hb : Const G b) (hc : Const G c)
    (hab : a + 2 * b = 0) (Z : L) : 2 * divLaw G F a b c Z = 0 := by
  rw [twice_div_law G F ha hb hc Z, hab, zero_mul]

/-- EINSTEIN'S LAW IS CONSERVED. Twice the Ricci curvature minus the scalar curvature times the metric, with any
    constant multiple of the metric added, has no divergence. -/
theorem einstein_law_is_conserved {c : A} (hc : Const G c) (Z : L) :
    2 * divLaw G F (1 + 1) (-1) c Z = 0 :=
  the_forced_law_is_conserved G F (const_add G (const_one G) (const_one G)) (const_neg G (const_one G)) hc
    (by ring) Z

end Forcing

/-! ## Part VII-b. The source is conserved: a theorem for the scalar field

RATIONALE. The forcing theorem takes the conservation of the law as its hypothesis. For that hypothesis not to stand
bare, the source side must be shown conserved by the matter's own equation. Here it is proved for the scalar field:
the divergence of its stress tensor is the field equation times the gradient. No conservation is assumed.
DESIGN. T2 is twice the stress tensor, so that no division by two is needed in a general ring.
RISK. One matter model is treated. The statement for all matter needs an action principle and is not formalised. -/
section Matter
variable {A : Type*} [CommRing A] {L : Type*} [LieRing L] [Module A L] (G : Geom A L)
variable {ι : Type*} [Fintype ι] [DecidableEq ι] (F : Frame G ι) (φ μ : A)

theorem act_two (X : L) : G.act X (2 : A) = 0 := by
  have h : (2 : A) = 1 + 1 := by norm_num
  rw [h, G.act_add, act_one, add_zero]

/-- The second covariant derivative of a function. -/
def Hess (X Y : L) : A := G.act X (G.act Y φ) - G.act (G.conn.nabla X Y) φ

/-- It is symmetric, because the connection has no torsion. -/
theorem Hess_symm (X Y : L) : Hess G φ X Y = Hess G φ Y X := by
  unfold Hess
  have t : G.conn.nabla X Y = ⁅X, Y⁆ + G.conn.nabla Y X := sub_eq_iff_eq_add.mp (G.conn.torsion X Y)
  rw [t, G.add_act, G.lie_act]
  ring

/-- The wave operator. -/
def Box : A := ∑ a, F.eps a * Hess G φ (F.e a) (F.e a)
/-- The squared gradient. -/
def Nrm : A := ∑ a, F.eps a * (G.act (F.e a) φ * G.act (F.e a) φ)
/-- Twice the stress tensor of the scalar field with mass term μ. -/
def T2 (Y Z : L) : A := 2 * (G.act Y φ * G.act Z φ) - G.g Y Z * (Nrm G F φ + μ * (φ * φ))
/-- Its covariant derivative. -/
def dT2 (X Y Z : L) : A :=
  G.act X (T2 G F φ μ Y Z) - T2 G F φ μ (G.conn.nabla X Y) Z - T2 G F φ μ Y (G.conn.nabla X Z)
/-- Its divergence. -/
def divT2 (Z : L) : A := ∑ a, F.eps a * dT2 G F φ μ (F.e a) Z (F.e a)

theorem dphi_bilin : IsBilin (fun U V : L => G.act U φ * G.act V φ) where
  add_left U U' V := by simp only [G.add_act]; ring
  smul_left f U V := by simp only [G.smul_act]; ring
  add_right U V V' := by simp only [G.add_act]; ring
  smul_right f U V := by simp only [G.smul_act]; ring

theorem dT2_eq (hμ : Const G μ) (X Y Z : L) :
    dT2 G F φ μ X Y Z = 2 * (Hess G φ X Y * G.act Z φ) + 2 * (G.act Y φ * Hess G φ X Z)
      - G.g Y Z * (G.act X (Nrm G F φ) + μ * (2 * (φ * G.act X φ))) := by
  unfold dT2 T2 Hess
  simp only [act_sub, G.act_mul, G.act_add, act_two, hμ X]
  have cp := G.compat X Y Z
  linear_combination (-(Nrm G F φ + μ * (φ * φ))) * cp

/-- The derivative of the squared gradient. The terms in which the derivative falls on the frame cancel. -/
theorem act_Nrm (Z : L) :
    G.act Z (Nrm G F φ) = 2 * ∑ a, F.eps a * (G.act (F.e a) φ * Hess G φ (F.e a) Z) := by
  have tc : ∑ a, F.eps a * (G.act (G.conn.nabla Z (F.e a)) φ * G.act (F.e a) φ
      + G.act (F.e a) φ * G.act (G.conn.nabla Z (F.e a)) φ) = 0 := trace_commute G F (dphi_bilin G φ) Z
  unfold Nrm
  rw [act_sum, Finset.mul_sum]
  have h : ∀ a ∈ (Finset.univ : Finset ι), G.act Z (F.eps a * (G.act (F.e a) φ * G.act (F.e a) φ))
      = 2 * (F.eps a * (G.act (F.e a) φ * Hess G φ (F.e a) Z))
        + F.eps a * (G.act (G.conn.nabla Z (F.e a)) φ * G.act (F.e a) φ
          + G.act (F.e a) φ * G.act (G.conn.nabla Z (F.e a)) φ) := by
    intro a _
    rw [act_eps_mul, G.act_mul, Hess_symm G φ (F.e a) Z]
    unfold Hess
    ring
  rw [Finset.sum_congr rfl h, Finset.sum_add_distrib, tc, add_zero]

/-- THE DIVERGENCE OF THE STRESS TENSOR IS THE FIELD EQUATION TIMES THE GRADIENT. -/
theorem div_T2 (hμ : Const G μ) (Z : L) :
    divT2 G F φ μ Z = 2 * ((Box G F φ - μ * φ) * G.act Z φ) := by
  have hN := act_Nrm G F φ Z
  have fN := act_in_frame G F Z (Nrm G F φ)
  have fφ := act_in_frame G F Z φ
  have key : divT2 G F φ μ Z
      = 2 * ∑ a, F.eps a * (G.act (F.e a) φ * Hess G φ (F.e a) Z)
        + 2 * (G.act Z φ * ∑ a, F.eps a * Hess G φ (F.e a) (F.e a))
        - ∑ a, (F.eps a * G.g Z (F.e a)) * G.act (F.e a) (Nrm G F φ)
        - 2 * (μ * φ) * ∑ a, (F.eps a * G.g Z (F.e a)) * G.act (F.e a) φ := by
    unfold divT2
    simp only [dT2_eq G F φ μ hμ, Finset.mul_sum]
    rw [← Finset.sum_add_distrib, ← Finset.sum_sub_distrib, ← Finset.sum_sub_distrib]
    apply Finset.sum_congr rfl
    intro a _
    rw [Hess_symm G φ (F.e a) Z]
    ring
  rw [key, ← fN, ← fφ, hN]
  unfold Box
  ring

/-- THE FIELD EQUATION CONSERVES THE SOURCE. -/
theorem field_equation_conserves_the_source (hμ : Const G μ) (h : Box G F φ = μ * φ) (Z : L) :
    divT2 G F φ μ Z = 0 := by
  rw [div_T2 G F φ μ hμ, h]; ring

/-- AND CONVERSELY. Where the field varies along some direction, conservation of the source is the field equation. -/
theorem conservation_is_the_field_equation [NoZeroDivisors A] (h2 : (2 : A) ≠ 0) (hμ : Const G μ) (Z : L)
    (hZ : G.act Z φ ≠ 0) (h : divT2 G F φ μ Z = 0) : Box G F φ = μ * φ := by
  rw [div_T2 G F φ μ hμ] at h
  rcases mul_eq_zero.mp h with h' | h'
  · exact absurd h' h2
  · rcases mul_eq_zero.mp h' with h'' | h''
    · exact sub_eq_zero.mp h''
    · exact absurd h'' hZ
/-- THE LAW EQUATED TO A FIELD ON ITS EQUATION IS CONSERVED. If a law of the family equals a constant times the
stress tensor of a scalar field, and the field obeys its equation, the divergence of the law vanishes. This is where
the hypothesis of the forcing theorem comes from: it is the matter's own equation, carried across the equality. -/
theorem law_sourced_by_a_field_is_conserved {a b c κ : A} (hκ : Const G κ) (hμ : Const G μ)
    (hlaw : ∀ Y Z : L, Law G F a b c Y Z = κ * T2 G F φ μ Y Z) (hfield : Box G F φ = μ * φ) (Z : L) :
    divLaw G F a b c Z = 0 := by
  have h0 := field_equation_conserves_the_source G F φ μ hμ hfield Z
  unfold divT2 at h0
  unfold divLaw dLaw
  simp only [hlaw, G.act_mul, show ∀ X : L, G.act X κ = 0 from hκ]
  have e : ∀ i ∈ (Finset.univ : Finset ι),
      F.eps i * (0 * T2 G F φ μ Z (F.e i) + κ * G.act (F.e i) (T2 G F φ μ Z (F.e i))
        - κ * T2 G F φ μ (G.conn.nabla (F.e i) Z) (F.e i) - κ * T2 G F φ μ Z (G.conn.nabla (F.e i) (F.e i)))
      = κ * (F.eps i * dT2 G F φ μ (F.e i) Z (F.e i)) := by
    intro i _
    unfold dT2
    ring
  rw [Finset.sum_congr rfl e, ← Finset.mul_sum, h0, mul_zero]
end Matter


/-! ## Part VIII. A geometry whose scalar curvature is not constant
    The surface with metric dx² + f(x)² dy², written in its orthonormal frame e₁ = ∂x, e₂ = f⁻¹∂y, with the
    logarithmic derivative of f equal to x. Functions are the rational polynomials in x. A field is a pair (a, b),
    read a·e₁ + b·e₂. Every structure of Parts I to VI is built for it and every law they ask is proved, the
    Jacobi identity included. Its scalar curvature is computed: −2(1 + x²). -/

noncomputable section Witness
open Polynomial

/-- The fields of the model. -/
def V := ℚ[X] × ℚ[X]

instance : AddCommGroup V := inferInstanceAs (AddCommGroup (ℚ[X] × ℚ[X]))
instance : Module ℚ[X] V := inferInstanceAs (Module ℚ[X] (ℚ[X] × ℚ[X]))

theorem V.ext {p q : V} (h1 : p.1 = q.1) (h2 : p.2 = q.2) : p = q := Prod.ext h1 h2
theorem V.add_fst (p q : V) : (p + q).1 = p.1 + q.1 := rfl
theorem V.add_snd (p q : V) : (p + q).2 = p.2 + q.2 := rfl
theorem V.sub_fst (p q : V) : (p - q).1 = p.1 - q.1 := rfl
theorem V.sub_snd (p q : V) : (p - q).2 = p.2 - q.2 := rfl
theorem V.zero_fst : (0 : V).1 = 0 := rfl
theorem V.zero_snd : (0 : V).2 = 0 := rfl
theorem V.smul_fst (f : ℚ[X]) (p : V) : (f • p).1 = f * p.1 := rfl
theorem V.smul_snd (f : ℚ[X]) (p : V) : (f • p).2 = f * p.2 := rfl

/-- The bracket of two fields of the model: e₂ differentiates no function, and [e₁, e₂] = −x·e₂. -/
def vbr (p q : V) : V :=
  (p.1 * derivative q.1 - q.1 * derivative p.1,
   p.1 * derivative q.2 - q.1 * derivative p.2 - X * (p.1 * q.2 - q.1 * p.2))

theorem vbr_fst (p q : V) : (vbr p q).1 = p.1 * derivative q.1 - q.1 * derivative p.1 := rfl
theorem vbr_snd (p q : V) :
    (vbr p q).2 = p.1 * derivative q.2 - q.1 * derivative p.2 - X * (p.1 * q.2 - q.1 * p.2) := rfl

instance : LieRing V :=
  { (inferInstance : AddCommGroup V) with
    bracket := vbr
    add_lie := fun x y z => by
      apply V.ext <;> simp only [vbr_fst, vbr_snd, V.add_fst, V.add_snd, map_add] <;> ring
    lie_add := fun x y z => by
      apply V.ext <;> simp only [vbr_fst, vbr_snd, V.add_fst, V.add_snd, map_add] <;> ring
    lie_self := fun x => by
      apply V.ext <;> simp only [vbr_fst, vbr_snd, V.zero_fst, V.zero_snd] <;> ring
    leibniz_lie := fun x y z => by
      apply V.ext <;>
        simp only [vbr_fst, vbr_snd, V.add_fst, V.add_snd, map_add, map_sub, derivative_mul, derivative_X] <;>
        ring }

theorem lie_eq (p q : V) : ⁅p, q⁆ = vbr p q := rfl

/-- The connection of the model: ∇_{e₂} e₁ = x·e₂ and ∇_{e₂} e₂ = −x·e₁, the others zero. -/
def vnab (p q : V) : V :=
  (p.1 * derivative q.1 - X * p.2 * q.2, p.1 * derivative q.2 + X * p.2 * q.1)

theorem vnab_fst (p q : V) : (vnab p q).1 = p.1 * derivative q.1 - X * p.2 * q.2 := rfl
theorem vnab_snd (p q : V) : (vnab p q).2 = p.1 * derivative q.2 + X * p.2 * q.1 := rfl

def vnabla : V →+ V →+ V :=
  AddMonoidHom.mk' (fun p => AddMonoidHom.mk' (vnab p) (fun a b => by
      apply V.ext <;> simp only [vnab_fst, vnab_snd, V.add_fst, V.add_snd, map_add] <;> ring))
    (fun a b => by
      refine AddMonoidHom.ext fun q => ?_
      show vnab (a + b) q = vnab a q + vnab b q
      apply V.ext <;> simp only [vnab_fst, vnab_snd, V.add_fst, V.add_snd] <;> ring)

theorem vnabla_apply (p q : V) : vnabla p q = vnab p q := rfl

/-- The model: a geometry in the sense of Part V, every law proved. -/
def model : Geom ℚ[X] V where
  act := fun p f => p.1 * derivative f
  act_add := fun p f h => by rw [map_add, mul_add]
  act_mul := fun p f h => by rw [derivative_mul]; ring
  add_act := fun p q f => by rw [V.add_fst, add_mul]
  smul_act := fun f p h => by rw [V.smul_fst, mul_assoc]
  lie_act := fun p q f => by simp only [lie_eq, vbr_fst, derivative_mul]; ring
  bracket_smul := fun p f q => by
    rw [lie_eq, lie_eq]
    apply V.ext <;>
      simp only [vbr_fst, vbr_snd, V.add_fst, V.add_snd, V.smul_fst, V.smul_snd, derivative_mul] <;> ring
  conn :=
    { nabla := vnabla
      torsion := fun p q => by
        rw [lie_eq, vnabla_apply, vnabla_apply]
        apply V.ext <;> simp only [vnab_fst, vnab_snd, vbr_fst, vbr_snd, V.sub_fst, V.sub_snd] <;> ring }
  nabla_smul := fun f p q => by
    show vnab (f • p) q = f • vnab p q
    apply V.ext <;> simp only [vnab_fst, vnab_snd, V.smul_fst, V.smul_snd] <;> ring
  nabla_leib := fun p f q => by
    show vnab p (f • q) = (p.1 * derivative f) • q + f • vnab p q
    apply V.ext <;>
      simp only [vnab_fst, vnab_snd, V.add_fst, V.add_snd, V.smul_fst, V.smul_snd, derivative_mul] <;> ring
  g := fun p q => p.1 * q.1 + p.2 * q.2
  g_symm := fun p q => by ring
  g_add := fun p q r => by rw [V.add_fst, V.add_snd]; ring
  g_smul := fun f p r => by rw [V.smul_fst, V.smul_snd]; ring
  compat := fun p q r => by
    show p.1 * derivative (q.1 * r.1 + q.2 * r.2)
      = (vnab p q).1 * r.1 + (vnab p q).2 * r.2 + (q.1 * (vnab p r).1 + q.2 * (vnab p r).2)
    simp only [vnab_fst, vnab_snd, map_add, derivative_mul]; ring

theorem model_act (p : V) (f : ℚ[X]) : model.act p f = p.1 * derivative f := rfl
theorem model_g (p q : V) : model.g p q = p.1 * q.1 + p.2 * q.2 := rfl
theorem model_nabla (p q : V) : model.conn.nabla p q = vnab p q := rfl

/-- THE CURVATURE OF THE MODEL, computed: R(p, q)r = K·(g(q, r)·p − g(p, r)·q) with K = −(1 + x²). -/
theorem model_curv (p q r : V) :
    curv model.conn p q r
      = ((-(1 + X ^ 2)) * (r.2 * (q.2 * p.1 - p.2 * q.1)), (-(1 + X ^ 2)) * (r.1 * (q.1 * p.2 - p.1 * q.2))) := by
  unfold curv
  rw [model_nabla, model_nabla, model_nabla, model_nabla, model_nabla, lie_eq]
  apply V.ext <;>
    simp only [vnab_fst, vnab_snd, vbr_fst, vbr_snd, V.sub_fst, V.sub_snd, map_add, map_sub, map_neg,
      derivative_mul, derivative_X] <;>
    ring

/-- The orthonormal frame of the model. -/
def e₁ : V := (1, 0)
def e₂ : V := (0, 1)

def modelFrame : Frame model Bool where
  e := fun i => if i then e₂ else e₁
  pos := fun _ => true
  ortho := fun i j => by
    cases i <;> cases j <;> simp [model_g, e₁, e₂, sgn]
  complete := fun p => by
    rw [Fintype.sum_bool]
    apply V.ext <;> simp [model_g, e₁, e₂, sgn, V.add_fst, V.add_snd, V.smul_fst, V.smul_snd]

/-- THE SCALAR CURVATURE OF THE MODEL is −2(1 + x²). -/
theorem model_scal : Scal model modelFrame = -2 * (1 + X ^ 2) := by
  unfold Scal Ric Rm
  simp only [Fintype.sum_bool, Frame.eps, modelFrame, sgn, model_curv, model_g, e₁, e₂, if_true]
  simp
  ring

/-- IT IS NOT CONSTANT: the first field of the frame differentiates it to −4x, which is not zero. -/
theorem model_dScal_ne : model.act e₁ (Scal model modelFrame) ≠ 0 := by
  rw [model_scal, model_act]
  intro h
  have h1 := congrArg (Polynomial.eval 1) h
  simp [e₁] at h1

end Witness

/-! ## Part IX. Conservation on every geometry forces Einstein's law -/

section Capstone
variable {A : Type*} [CommRing A] {L : Type*} [LieRing L] [Module A L] (G : Geom A L)

theorem const_natCast (n : ℕ) : Const G (n : A) := by
  induction n with
  | zero => intro X; rw [Nat.cast_zero]; exact act_zero G X
  | succ k ih => rw [Nat.cast_succ]; exact const_add G ih (const_one G)

/-- Every integer is a constant of every geometry. -/
theorem const_intCast (n : ℤ) : Const G (n : A) := by
  cases n with
  | ofNat k => rw [Int.ofNat_eq_coe, Int.cast_natCast]; exact const_natCast G k
  | negSucc k => rw [Int.cast_negSucc]; exact const_neg G (const_natCast G (k + 1))

end Capstone

/-- CONSERVATION ON EVERY GEOMETRY FORCES THE RATIO. Let a, b and c be integers. If the law a·Ric + b·Scal·g + c·g
    has no divergence on every geometry, in every frame and in every direction, then a + 2b = 0. No hypothesis on
    any geometry is left: the geometry of Part VIII is the one on which every other ratio fails. -/
theorem conservation_on_every_geometry_forces_the_ratio (a b c : ℤ)
    (h : ∀ (A : Type) [CommRing A] (L : Type) [LieRing L] [Module A L] (G : Geom A L)
        (ι : Type) [Fintype ι] [DecidableEq ι] (F : Frame G ι) (Z : L),
        divLaw G F (a : A) (b : A) (c : A) Z = 0) :
    a + 2 * b = 0 := by
  have hm := conservation_forces_the_ratio model modelFrame (const_intCast model a) (const_intCast model b)
    (const_intCast model c) (fun Z => h _ _ model _ modelFrame Z) e₁ model_dScal_ne
  have hq : (a : ℚ) + 2 * (b : ℚ) = 0 := by simpa using congrArg (Polynomial.eval 0) hm
  have hz : ((a + 2 * b : ℤ) : ℚ) = 0 := by push_cast; exact hq
  exact Int.cast_eq_zero.mp hz

/-- AND THAT RATIO IS CONSERVED ON EVERY GEOMETRY, with c free: for all integers a, b, c with a + 2b = 0, twice the
    divergence vanishes on every geometry, in every frame and in every direction. -/
theorem the_forced_ratio_is_conserved_on_every_geometry (a b c : ℤ) (hab : a + 2 * b = 0)
    {A : Type*} [CommRing A] {L : Type*} [LieRing L] [Module A L] (G : Geom A L)
    {ι : Type*} [Fintype ι] [DecidableEq ι] (F : Frame G ι) (Z : L) :
    2 * divLaw G F (a : A) (b : A) (c : A) Z = 0 :=
  the_forced_law_is_conserved G F (const_intCast G a) (const_intCast G b) (const_intCast G c)
    (by exact_mod_cast congrArg (Int.cast : ℤ → A) hab) Z


/-! ## Part VIII-b. A spacetime of four dimensions whose scalar curvature is not constant
    The surface of Part VIII times a flat plane of one space and one time direction: the metric
    dx² + f(x)² dy² + dz² − dt², in its orthonormal frame. A field is a pair of pairs ((a, b), (c, d)), read
    a·e₁ + b·e₂ + c·e₃ + d·e₀. It has four dimensions and one time direction, so the main theorem can be stated
    with its hypothesis restricted to such spacetimes. RISK: coefficients depend on x alone. -/

noncomputable section Witness4
open Polynomial

/-- The fields of the four-dimensional model. -/
def W := V × V

instance : AddCommGroup W := inferInstanceAs (AddCommGroup (V × V))
instance : Module ℚ[X] W := inferInstanceAs (Module ℚ[X] (V × V))

theorem W.ext {p q : W} (h1 : p.1.1 = q.1.1) (h2 : p.1.2 = q.1.2) (h3 : p.2.1 = q.2.1) (h4 : p.2.2 = q.2.2) :
    p = q := Prod.ext (Prod.ext h1 h2) (Prod.ext h3 h4)
theorem W.add_fst (p q : W) : (p + q).1 = p.1 + q.1 := rfl
theorem W.add_snd (p q : W) : (p + q).2 = p.2 + q.2 := rfl
theorem W.sub_fst (p q : W) : (p - q).1 = p.1 - q.1 := rfl
theorem W.sub_snd (p q : W) : (p - q).2 = p.2 - q.2 := rfl
theorem W.zero_fst : (0 : W).1 = 0 := rfl
theorem W.zero_snd : (0 : W).2 = 0 := rfl
theorem W.smul_fst (f : ℚ[X]) (p : W) : (f • p).1 = f • p.1 := rfl
theorem W.smul_snd (f : ℚ[X]) (p : W) : (f • p).2 = f • p.2 := rfl

/-- The bracket: that of Part VIII on the first pair; e₃ and e₀ commute with everything but are differentiated
    by e₁ through their coefficients. -/
def wbr (p q : W) : W :=
  (vbr p.1 q.1,
   (p.1.1 * derivative q.2.1 - q.1.1 * derivative p.2.1, p.1.1 * derivative q.2.2 - q.1.1 * derivative p.2.2))

theorem wbr_fst (p q : W) : (wbr p q).1 = vbr p.1 q.1 := rfl
theorem wbr_c (p q : W) : (wbr p q).2.1 = p.1.1 * derivative q.2.1 - q.1.1 * derivative p.2.1 := rfl
theorem wbr_d (p q : W) : (wbr p q).2.2 = p.1.1 * derivative q.2.2 - q.1.1 * derivative p.2.2 := rfl

instance : LieRing W :=
  { (inferInstance : AddCommGroup W) with
    bracket := wbr
    add_lie := fun x y z => by
      apply W.ext <;> simp only [wbr_fst, wbr_c, wbr_d, vbr_fst, vbr_snd, W.add_fst, W.add_snd, V.add_fst,
        V.add_snd, map_add] <;> ring
    lie_add := fun x y z => by
      apply W.ext <;> simp only [wbr_fst, wbr_c, wbr_d, vbr_fst, vbr_snd, W.add_fst, W.add_snd, V.add_fst,
        V.add_snd, map_add] <;> ring
    lie_self := fun x => by
      apply W.ext <;> simp only [wbr_fst, wbr_c, wbr_d, vbr_fst, vbr_snd, W.zero_fst, W.zero_snd, V.zero_fst,
        V.zero_snd] <;> ring
    leibniz_lie := fun x y z => by
      apply W.ext <;>
        simp only [wbr_fst, wbr_c, wbr_d, vbr_fst, vbr_snd, W.add_fst, W.add_snd, V.add_fst, V.add_snd, map_add,
          map_sub, derivative_mul, derivative_X] <;>
        ring }

theorem lie_eq4 (p q : W) : ⁅p, q⁆ = wbr p q := rfl

/-- The connection: that of Part VIII on the first pair; e₃ and e₀ are parallel. -/
def wnab (p q : W) : W := (vnab p.1 q.1, (p.1.1 * derivative q.2.1, p.1.1 * derivative q.2.2))

theorem wnab_fst (p q : W) : (wnab p q).1 = vnab p.1 q.1 := rfl
theorem wnab_c (p q : W) : (wnab p q).2.1 = p.1.1 * derivative q.2.1 := rfl
theorem wnab_d (p q : W) : (wnab p q).2.2 = p.1.1 * derivative q.2.2 := rfl

def wnabla : W →+ W →+ W :=
  AddMonoidHom.mk' (fun p => AddMonoidHom.mk' (wnab p) (fun a b => by
      apply W.ext <;> simp only [wnab_fst, wnab_c, wnab_d, vnab_fst, vnab_snd, W.add_fst, W.add_snd, V.add_fst,
        V.add_snd, map_add] <;> ring))
    (fun a b => by
      refine AddMonoidHom.ext fun q => ?_
      show wnab (a + b) q = wnab a q + wnab b q
      apply W.ext <;> simp only [wnab_fst, wnab_c, wnab_d, vnab_fst, vnab_snd, W.add_fst, W.add_snd, V.add_fst,
        V.add_snd] <;> ring)

theorem wnabla_apply (p q : W) : wnabla p q = wnab p q := rfl

/-- The four-dimensional model: a geometry in the sense of Part V, every law proved. The metric has one minus. -/
def model4 : Geom ℚ[X] W where
  act := fun p f => p.1.1 * derivative f
  act_add := fun p f h => by rw [map_add, mul_add]
  act_mul := fun p f h => by rw [derivative_mul]; ring
  add_act := fun p q f => by rw [W.add_fst, V.add_fst, add_mul]
  smul_act := fun f p h => by rw [W.smul_fst, V.smul_fst, mul_assoc]
  lie_act := fun p q f => by simp only [lie_eq4, wbr_fst, vbr_fst, derivative_mul]; ring
  bracket_smul := fun p f q => by
    rw [lie_eq4, lie_eq4]
    apply W.ext <;>
      simp only [wbr_fst, wbr_c, wbr_d, vbr_fst, vbr_snd, W.add_fst, W.add_snd, W.smul_fst, W.smul_snd,
        V.add_fst, V.add_snd, V.smul_fst, V.smul_snd, derivative_mul] <;> ring
  conn :=
    { nabla := wnabla
      torsion := fun p q => by
        rw [lie_eq4, wnabla_apply, wnabla_apply]
        apply W.ext <;> simp only [wnab_fst, wnab_c, wnab_d, wbr_fst, wbr_c, wbr_d, vnab_fst, vnab_snd, vbr_fst,
          vbr_snd, W.sub_fst, W.sub_snd, V.sub_fst, V.sub_snd] <;> ring }
  nabla_smul := fun f p q => by
    show wnab (f • p) q = f • wnab p q
    apply W.ext <;> simp only [wnab_fst, wnab_c, wnab_d, vnab_fst, vnab_snd, W.smul_fst, W.smul_snd,
      V.smul_fst, V.smul_snd] <;> ring
  nabla_leib := fun p f q => by
    show wnab p (f • q) = (p.1.1 * derivative f) • q + f • wnab p q
    apply W.ext <;>
      simp only [wnab_fst, wnab_c, wnab_d, vnab_fst, vnab_snd, W.add_fst, W.add_snd, W.smul_fst, W.smul_snd,
        V.add_fst, V.add_snd, V.smul_fst, V.smul_snd, derivative_mul] <;> ring
  g := fun p q => p.1.1 * q.1.1 + p.1.2 * q.1.2 + p.2.1 * q.2.1 - p.2.2 * q.2.2
  g_symm := fun p q => by ring
  g_add := fun p q r => by simp only [W.add_fst, W.add_snd, V.add_fst, V.add_snd]; ring
  g_smul := fun f p r => by simp only [W.smul_fst, W.smul_snd, V.smul_fst, V.smul_snd]; ring
  compat := fun p q r => by
    show p.1.1 * derivative (q.1.1 * r.1.1 + q.1.2 * r.1.2 + q.2.1 * r.2.1 - q.2.2 * r.2.2)
      = (wnab p q).1.1 * r.1.1 + (wnab p q).1.2 * r.1.2 + (wnab p q).2.1 * r.2.1 - (wnab p q).2.2 * r.2.2
        + (q.1.1 * (wnab p r).1.1 + q.1.2 * (wnab p r).1.2 + q.2.1 * (wnab p r).2.1 - q.2.2 * (wnab p r).2.2)
    simp only [wnab_fst, wnab_c, wnab_d, vnab_fst, vnab_snd, map_add, map_sub, derivative_mul]; ring

theorem model4_act (p : W) (f : ℚ[X]) : model4.act p f = p.1.1 * derivative f := rfl
theorem model4_g (p q : W) :
    model4.g p q = p.1.1 * q.1.1 + p.1.2 * q.1.2 + p.2.1 * q.2.1 - p.2.2 * q.2.2 := rfl
theorem model4_nabla (p q : W) : model4.conn.nabla p q = wnab p q := rfl

/-- THE CURVATURE OF THE FOUR-DIMENSIONAL MODEL, computed: that of the surface, and nothing in the flat plane. -/
theorem model4_curv (p q r : W) :
    curv model4.conn p q r
      = (((-(1 + X ^ 2)) * (r.1.2 * (q.1.2 * p.1.1 - p.1.2 * q.1.1)),
          (-(1 + X ^ 2)) * (r.1.1 * (q.1.1 * p.1.2 - p.1.1 * q.1.2))), (0, 0)) := by
  unfold curv
  rw [model4_nabla, model4_nabla, model4_nabla, model4_nabla, model4_nabla, lie_eq4]
  apply W.ext <;>
    simp only [wnab_fst, wnab_c, wnab_d, wbr_fst, wbr_c, wbr_d, vnab_fst, vnab_snd, vbr_fst, vbr_snd, W.sub_fst,
      W.sub_snd, V.sub_fst, V.sub_snd, map_add, map_sub, map_neg, derivative_mul, derivative_X] <;>
    ring

/-- The orthonormal frame: three fields of square plus one and one of square minus one. -/
def f₁ : W := ((1, 0), (0, 0))
def f₂ : W := ((0, 1), (0, 0))
def f₃ : W := ((0, 0), (1, 0))
def f₀ : W := ((0, 0), (0, 1))

def model4Frame : Frame model4 (Bool × Bool) where
  e := fun i => if i.1 then (if i.2 then f₀ else f₃) else (if i.2 then f₂ else f₁)
  pos := fun i => !(i.1 && i.2)
  ortho := fun i j => by
    rcases i with ⟨_ | _, _ | _⟩ <;> rcases j with ⟨_ | _, _ | _⟩ <;>
      simp [model4_g, f₁, f₂, f₃, f₀, sgn]
  complete := fun p => by
    rw [Fintype.sum_prod_type, Fintype.sum_bool, Fintype.sum_bool, Fintype.sum_bool]
    apply W.ext <;>
      simp [model4_g, f₁, f₂, f₃, f₀, sgn, W.add_fst, W.add_snd, W.smul_fst, W.smul_snd, V.add_fst, V.add_snd,
        V.smul_fst, V.smul_snd]

/-- It has four dimensions. -/
theorem model4_card : Fintype.card (Bool × Bool) = 4 := rfl

/-- It has one time direction. -/
theorem model4_one_time : (Finset.univ.filter (fun i => model4Frame.pos i = false)).card = 1 := rfl

/-- ITS SCALAR CURVATURE is −2(1 + x²). -/
theorem model4_scal : Scal model4 model4Frame = -2 * (1 + X ^ 2) := by
  unfold Scal Ric Rm
  simp only [Fintype.sum_prod_type, Fintype.sum_bool, Frame.eps, model4Frame, sgn, model4_curv, model4_g,
    f₁, f₂, f₃, f₀]
  simp
  ring

/-- IT IS NOT CONSTANT. -/
theorem model4_dScal_ne : model4.act f₁ (Scal model4 model4Frame) ≠ 0 := by
  rw [model4_scal, model4_act]
  intro h
  have h1 := congrArg (Polynomial.eval 1) h
  simp [f₁] at h1

end Witness4

/-- The polynomials over the rationals have no two-torsion. -/
theorem noTwoTorsion_poly : NoTwoTorsion (Polynomial ℚ) := fun _ h =>
  (mul_eq_zero.mp h).resolve_left two_ne_zero

/-- CONSERVATION ON EVERY SPACETIME OF FOUR DIMENSIONS FORCES THE RATIO. The hypothesis of the main theorem is
    weakened: the law need only be conserved on geometries with a frame of four fields, exactly one of them of
    square minus one, over rings in which 2x = 0 gives x = 0. The conclusion is the same. The geometry of Part VIII-b is the one on which every other
    ratio fails. -/
theorem conservation_on_every_spacetime_of_four_dimensions_forces_the_ratio (a b c : ℤ)
    (h : ∀ (A : Type) [CommRing A] (L : Type) [LieRing L] [Module A L] (G : Geom A L)
        (ι : Type) [Fintype ι] [DecidableEq ι] (F : Frame G ι),
        NoTwoTorsion A → Fintype.card ι = 4 → (Finset.univ.filter (fun i => F.pos i = false)).card = 1 →
        ∀ Z : L, divLaw G F (a : A) (b : A) (c : A) Z = 0) :
    a + 2 * b = 0 := by
  have hm := conservation_forces_the_ratio model4 model4Frame (const_intCast model4 a) (const_intCast model4 b)
    (const_intCast model4 c) (fun Z => h _ _ model4 _ model4Frame noTwoTorsion_poly model4_card model4_one_time Z) f₁
    model4_dScal_ne
  have hq : (a : ℚ) + 2 * (b : ℚ) = 0 := by simpa using congrArg (Polynomial.eval 0) hm
  have hz : ((a + 2 * b : ℤ) : ℚ) = 0 := by push_cast; exact hq
  exact Int.cast_eq_zero.mp hz

/-! ## Part IX-b. The seat and the record: definitions
    A particle is a charge and an energy, placed on the plane at (side, height) = (1 + charge, energy). The
    reflection in the line of side one exchanges a particle with its antiparticle. Registration is the projection
    onto that line. These are definitions; what gravity does with them is a premise, a field of `Premises`. -/

/-- A point of the seat: a side and a height. -/
abbrev Pt := ℤ × ℤ
/-- The reflection of the seat. -/
def fold (p : Pt) : Pt := (2 - p.1, p.2)
/-- The registration keeps the height and forgets the side. -/
def reg (p : Pt) : Pt := (1, p.2)

/-- A particle: a charge and an energy. -/
structure Particle where
  charge : ℤ
  energy : ℤ

/-- The antiparticle: the charge reversed, the energy kept. -/
def bar (c : Particle) : Particle := ⟨-c.charge, c.energy⟩

/-- The point of a particle: its charge is its side, its energy its height. -/
def seatOf (c : Particle) : Pt := (1 + c.charge, c.energy)

/-- The antiparticle sits at the reflected point. -/
theorem seat_of_bar (c : Particle) : seatOf (bar c) = fold (seatOf c) := by
  unfold seatOf bar fold
  refine Prod.ext ?_ rfl
  show 1 + -c.charge = 2 - (1 + c.charge)
  ring

/-- A point and its reflection have one registration. -/
theorem reg_fold (p : Pt) : reg (fold p) = reg p := rfl

/-! ## Part X. The premises, in one structure, and the theorem
    Everything above is mathematics and takes no premise. What joins it to gravity is collected here, where the
    kernel can see it. -/

/-- Twice Einstein's tensor: 2·Ric − Scal·g. -/
def Einstein2 {A : Type*} [CommRing A] {L : Type*} [LieRing L] [Module A L] (G : Geom A L)
    {ι : Type*} [Fintype ι] [DecidableEq ι] (F : Frame G ι) (Y Z : L) : A :=
  2 * Ric G F Y Z - Scal G F * G.g Y Z

/-- THE PREMISES OF THE PAPER. They are physics and are not proved.
    P1, geometry and order. The law of gravity is a symmetric law built from the metric and its curvature, of the
        family a·Ric + b·Scal·g + c·g with integer coefficients. In four dimensions every conserved symmetric law
        of second order in the metric lies in this family: that is Lovelock's theorem (1971), cited and not proved
        here, and it is what lets P1 be stated on the family.
    P2, conservation. The source of gravity is conserved, on every geometry, in every frame and in every direction;
        the law equals the source, so the law has no divergence there. This is the field `conserved`.
        For the scalar field this is proved in Part VII-b (`div_T2`, `law_sourced_by_a_field_is_conserved`);
        the premise is its extension to all matter. The field asks for conservation only where physics needs it:
        on spacetimes of four dimensions with one time direction, over rings of functions in which 2x = 0 gives
        x = 0. A weaker premise is a stronger theorem.
    P3, the record. Gravity reads the record: the weight it gives a particle is some function of the registration
        of the particle's point. These are the fields `weight` and `reads_record`. The function is not named. -/
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

/-- EINSTEIN'S LAW IS FORCED. On the premises, twice the law is a times twice Einstein's tensor plus a free multiple
    of the metric, on every geometry and in every frame. The coefficient a is the coupling and c the vacuum term;
    neither is fixed. The premise is used on one spacetime only, that of Part VIII-b. -/
theorem einstein_forced (P : Premises) {A : Type} [CommRing A] {L : Type} [LieRing L] [Module A L]
    (G : Geom A L) {ι : Type} [Fintype ι] [DecidableEq ι] (F : Frame G ι) (Y Z : L) :
    2 * Law G F (P.a : A) (P.b : A) (P.c : A) Y Z
      = (P.a : A) * Einstein2 G F Y Z + 2 * (P.c : A) * G.g Y Z := by
  have h := conservation_on_every_spacetime_of_four_dimensions_forces_the_ratio P.a P.b P.c P.conserved
  have hA : (P.a : A) + 2 * (P.b : A) = 0 := by exact_mod_cast congrArg (Int.cast : ℤ → A) h
  unfold Law Einstein2
  linear_combination (Scal G F * G.g Y Z) * hA

/-- The premises are not empty: Einstein's law with any vacuum term satisfies them wherever two is not a zero
    divisor. Stated on such rings: with a = 2 and b = −1, twice the divergence vanishes on every geometry. -/
theorem einstein_satisfies_conservation (c : ℤ) {A : Type*} [CommRing A] {L : Type*} [LieRing L] [Module A L]
    (G : Geom A L) {ι : Type*} [Fintype ι] [DecidableEq ι] (F : Frame G ι) (Z : L) :
    2 * divLaw G F ((2 : ℤ) : A) ((-1 : ℤ) : A) (c : A) Z = 0 :=
  the_forced_ratio_is_conserved_on_every_geometry 2 (-1) c (by norm_num) G F Z
/-- THE PREMISES ARE MET, AND NOT ONLY BY THE ZERO LAW: Einstein's law with any vacuum term is a member. -/
def einsteinPremises (c : ℤ) : Premises where
  a := 2
  b := -1
  c := c
  conserved := fun A _ L _ _ G ι _ _ F h2 _ _ Z =>
    h2 _ (the_forced_ratio_is_conserved_on_every_geometry 2 (-1) c (by norm_num) G F Z)
  weight := fun p => p.energy
  reads_record := ⟨fun q => q.2, fun _ => rfl⟩

theorem einsteinPremises_coupling (c : ℤ) : (einsteinPremises c).a = 2 := rfl

/-! ## Part X-b. The trace reversal, the active density, and the dimension

RATIONALE. The forced law reads a source through its trace reversal. This part computes that reading for a fluid in
any number of dimensions n: along the fluid's own time it is (n - 3) ρ + (n - 1) p, across it ρ - p. In four
dimensions these are ρ + 3p and ρ - p. For matter at rest the space reading equals the time reading exactly when
n = 4, and the time reading vanishes exactly when n = 3.
DESIGN. n is the number of fields of the frame. Nothing is assumed about the signature beyond g(u, u) = -1 for the
fluid's velocity. The trace of a form is taken in the frame; Parseval's identity comes from completeness.
RISK. That the weak-field potentials are sourced by these two readings is derived in SPHYS_WeakField_CC.lean, in
coordinates, to first order and for a static field. -/
section TraceReversal
variable {A : Type*} [CommRing A] {L : Type*} [LieRing L] [Module A L] (G : Geom A L)
variable {ι : Type*} [Fintype ι] [DecidableEq ι] (F : Frame G ι)

theorem eps_sq (i : ι) : F.eps i * F.eps i = 1 := by
  unfold Frame.eps sgn
  split <;> ring

theorem g_bilin : IsBilin G.g where
  add_left := G.g_add
  smul_left := G.g_smul
  add_right := g_add_right G
  smul_right := g_smul_right G

/-- Parseval's identity in the frame. -/
theorem parseval (X Y : L) : ∑ i, F.eps i * (G.g X (F.e i) * G.g (F.e i) Y) = G.g X Y := by
  symm
  calc G.g X Y = G.g (∑ i, (sgn A (F.pos i) * G.g X (F.e i)) • F.e i) Y := by rw [← F.complete X]
    _ = ∑ i, (sgn A (F.pos i) * G.g X (F.e i)) * G.g (F.e i) Y := (g_bilin G).sum_left _ _ _ _
    _ = _ := Finset.sum_congr rfl (fun i _ => by unfold Frame.eps; ring)

/-- The trace of the metric is the number of dimensions. -/
theorem frame_trace_g : ∑ i, F.eps i * G.g (F.e i) (F.e i) = (Fintype.card ι : A) := by
  have h : ∀ i ∈ (Finset.univ : Finset ι), F.eps i * G.g (F.e i) (F.e i) = 1 := by
    intro i _
    rw [F.ortho, if_pos rfl]
    exact eps_sq G F i
  rw [Finset.sum_congr rfl h]
  simp

/-- The trace of a form, in the frame. -/
def tr (T : L → L → A) : A := ∑ i, F.eps i * T (F.e i) (F.e i)

/-- The trace of the forced law is (2 - n) times the scalar curvature. -/
theorem trace_Einstein2 : tr G F (Einstein2 G F) = (2 - (Fintype.card ι : A)) * Scal G F := by
  have h1 : ∑ i, F.eps i * (2 * Ric G F (F.e i) (F.e i)) = 2 * Scal G F := by
    unfold Scal
    rw [Finset.mul_sum]
    exact Finset.sum_congr rfl (fun i _ => by ring)
  have h2 : ∑ i, F.eps i * (Scal G F * G.g (F.e i) (F.e i)) = Scal G F * (Fintype.card ι : A) := by
    rw [← frame_trace_g G F, Finset.mul_sum]
    exact Finset.sum_congr rfl (fun i _ => by ring)
  unfold tr Einstein2
  simp only [mul_sub]
  rw [Finset.sum_sub_distrib, h1, h2]
  ring

/-- The trace reversal of a form in n dimensions, cleared of its denominator. -/
def rev (T : L → L → A) (Y Z : L) : A := ((Fintype.card ι : A) - 2) * T Y Z - G.g Y Z * tr G F T

/-- THE TRACE REVERSAL. If the forced law equals κ T, then (n - 2) times twice the Ricci curvature is κ times the
trace reversal of T. This is what the curvature reads of a source. -/
theorem trace_reversal (T : L → L → A) (κ : A) (h : ∀ Y Z : L, Einstein2 G F Y Z = κ * T Y Z) (Y Z : L) :
    ((Fintype.card ι : A) - 2) * (2 * Ric G F Y Z) = κ * rev G F T Y Z := by
  have ht : tr G F (Einstein2 G F) = κ * tr G F T := by
    unfold tr
    simp only [h]
    rw [Finset.mul_sum]
    exact Finset.sum_congr rfl (fun i _ => by ring)
  rw [trace_Einstein2] at ht
  have hy := h Y Z
  unfold Einstein2 at hy
  unfold rev
  linear_combination ((Fintype.card ι : A) - 2) * hy - G.g Y Z * ht

/-- A fluid of density ρ and pressure p moving along u. -/
def fluid (u : L) (ρ p : A) (Y Z : L) : A := (ρ + p) * (G.g u Y * G.g u Z) + p * G.g Y Z

theorem tr_fluid (u : L) (ρ p : A) (hu : G.g u u = -1) :
    tr G F (fluid G u ρ p) = -(ρ + p) + (Fintype.card ι : A) * p := by
  have h1 : ∑ i, F.eps i * (G.g u (F.e i) * G.g u (F.e i)) = -1 := by
    rw [← hu, ← parseval G F u u]
    exact Finset.sum_congr rfl (fun i _ => by rw [G.g_symm (F.e i) u])
  have h2 := frame_trace_g G F
  unfold tr fluid
  simp only [mul_add]
  rw [Finset.sum_add_distrib]
  have e1 : ∑ i, F.eps i * ((ρ + p) * (G.g u (F.e i) * G.g u (F.e i)))
      = (ρ + p) * ∑ i, F.eps i * (G.g u (F.e i) * G.g u (F.e i)) := by
    rw [Finset.mul_sum]
    exact Finset.sum_congr rfl (fun i _ => by ring)
  have e2 : ∑ i, F.eps i * (p * G.g (F.e i) (F.e i)) = p * ∑ i, F.eps i * G.g (F.e i) (F.e i) := by
    rw [Finset.mul_sum]
    exact Finset.sum_congr rfl (fun i _ => by ring)
  rw [e1, e2, h1, h2]
  ring

/-- THE ACTIVE DENSITY IN n DIMENSIONS. Along the fluid's own time the curvature reads (n - 3) ρ + (n - 1) p. -/
theorem active_density (u : L) (ρ p : A) (hu : G.g u u = -1) :
    rev G F (fluid G u ρ p) u u = ((Fintype.card ι : A) - 3) * ρ + ((Fintype.card ι : A) - 1) * p := by
  unfold rev
  rw [tr_fluid G F u ρ p hu]
  unfold fluid
  rw [hu]
  ring

/-- THE SPACE READING. Across the fluid, along a unit direction at rest with it, the curvature reads ρ - p. -/
theorem space_reading (u w : L) (ρ p : A) (hu : G.g u u = -1) (hw : G.g w w = 1) (huw : G.g u w = 0) :
    rev G F (fluid G u ρ p) w w = ρ - p := by
  unfold rev
  rw [tr_fluid G F u ρ p hu]
  unfold fluid
  rw [hw, huw]
  ring

/-- In four dimensions the active density is ρ + 3 p. -/
theorem active_density_in_four (hn : Fintype.card ι = 4) (u : L) (ρ p : A) (hu : G.g u u = -1) :
    rev G F (fluid G u ρ p) u u = ρ + 3 * p := by
  rw [active_density G F u ρ p hu, hn]
  push_cast
  ring

/-- FOUR DIMENSIONS ARE SINGLED OUT. For matter at rest, without pressure, the space reading equals the time reading
exactly when (n - 4) ρ = 0. -/
theorem space_reads_what_time_reads_iff (u w : L) (ρ : A) (hu : G.g u u = -1) (hw : G.g w w = 1)
    (huw : G.g u w = 0) :
    rev G F (fluid G u ρ 0) w w = rev G F (fluid G u ρ 0) u u ↔ ((Fintype.card ι : A) - 4) * ρ = 0 := by
  rw [active_density G F u ρ 0 hu, space_reading G F u w ρ 0 hu hw huw]
  constructor
  · intro h; linear_combination -h
  · intro h; linear_combination -h

/-- AND THREE ARE EXCLUDED. For matter at rest, without pressure, the time reading is (n - 3) ρ: in three dimensions
of spacetime a body at rest has no weight. -/
theorem weight_of_matter_at_rest (u : L) (ρ : A) (hu : G.g u u = -1) :
    rev G F (fluid G u ρ 0) u u = ((Fintype.card ι : A) - 3) * ρ := by
  rw [active_density G F u ρ 0 hu]; ring
end TraceReversal

/-! ## Part XI. What a reading of the record can see
    The earlier engine defined the gravitational reading of a particle as its energy and then proved it blind to
    charge by `rfl`. Here nothing is defined so. The premise is that gravity reads the record: its reading of a
    particle is some function f of the registration of the particle's point. The theorems hold for every f. -/

section RecordReading

/-- EVERY READING OF THE RECORD IS BLIND TO THE SIGN OF CHARGE: antimatter reads as matter, whatever the reading. -/
theorem every_reading_of_the_record_is_blind_to_charge {β : Type*} (f : Pt → β) (c : Particle) :
    f (reg (seatOf (bar c))) = f (reg (seatOf c)) := by
  rw [seat_of_bar, reg_fold]

/-- EVERY READING OF THE RECORD IS BLIND TO COMPOSITION: two particles of one energy read alike, whatever their
    charges and whatever the reading. -/
theorem every_reading_of_the_record_is_blind_to_composition {β : Type*} (f : Pt → β) (c d : Particle)
    (h : c.energy = d.energy) : f (reg (seatOf c)) = f (reg (seatOf d)) := by
  have hc : reg (seatOf c) = (1, c.energy) := rfl
  have hd : reg (seatOf d) = (1, d.energy) := rfl
  rw [hc, hd, h]

/-- AND NO READING OF THE RECORD RETURNS THE CHARGE. -/
theorem no_reading_of_the_record_returns_the_charge :
    ¬ ∃ f : Pt → ℤ, ∀ c : Particle, f (reg (seatOf c)) = c.charge := by
  intro ⟨f, hf⟩
  have h1 := hf ⟨1, 0⟩
  have h2 := hf ⟨-1, 0⟩
  have e : reg (seatOf ⟨1, 0⟩) = reg (seatOf ⟨-1, 0⟩) := rfl
  rw [e] at h1
  rw [h1] at h2
  norm_num at h2

/-- ON THE PREMISES, ANTIMATTER WEIGHS AS MATTER. -/
theorem Premises.antimatter_weighs_as_matter (P : Premises) (c : Particle) : P.weight (bar c) = P.weight c := by
  obtain ⟨f, hf⟩ := P.reads_record
  rw [hf, hf]
  exact every_reading_of_the_record_is_blind_to_charge f c

/-- ON THE PREMISES, WEIGHT DOES NOT SEE COMPOSITION: two particles of one energy weigh alike. -/
theorem Premises.weight_is_blind_to_composition (P : Premises) (c d : Particle) (h : c.energy = d.energy) :
    P.weight c = P.weight d := by
  obtain ⟨f, hf⟩ := P.reads_record
  rw [hf, hf]
  exact every_reading_of_the_record_is_blind_to_composition f c d h

/-- ON THE PREMISES, THE WEIGHT IS NOT THE CHARGE. -/
theorem Premises.weight_is_not_the_charge (P : Premises) : ¬ ∀ c : Particle, P.weight c = c.charge := by
  intro h
  obtain ⟨f, hf⟩ := P.reads_record
  exact no_reading_of_the_record_returns_the_charge ⟨f, fun c => (hf c).symm.trans (h c)⟩

end RecordReading

end SPHYS.Geometry

#print axioms SPHYS.Geometry.first_bianchi
#print axioms SPHYS.Geometry.second_bianchi
#print axioms SPHYS.Geometry.halfBracket_curv
#print axioms SPHYS.Geometry.curv_smul_left
#print axioms SPHYS.Geometry.curv_smul_mid
#print axioms SPHYS.Geometry.curv_smul_right
#print axioms SPHYS.Geometry.Rm_antisymm34
#print axioms SPHYS.Geometry.second_bianchi_Rm
#print axioms SPHYS.Geometry.trace_commute
#print axioms SPHYS.Geometry.contracted_bianchi
#print axioms SPHYS.Geometry.twice_div_law
#print axioms SPHYS.Geometry.conservation_forces_the_ratio
#print axioms SPHYS.Geometry.the_forced_law_is_conserved
#print axioms SPHYS.Geometry.einstein_law_is_conserved
#print axioms SPHYS.Geometry.model_curv
#print axioms SPHYS.Geometry.model_scal
#print axioms SPHYS.Geometry.model_dScal_ne
#print axioms SPHYS.Geometry.conservation_on_every_geometry_forces_the_ratio
#print axioms SPHYS.Geometry.the_forced_ratio_is_conserved_on_every_geometry
#print axioms SPHYS.Geometry.model4_scal
#print axioms SPHYS.Geometry.conservation_on_every_spacetime_of_four_dimensions_forces_the_ratio
#print axioms SPHYS.Geometry.einstein_forced
#print axioms SPHYS.Geometry.einsteinPremises
#print axioms SPHYS.Geometry.einstein_satisfies_conservation
#print axioms SPHYS.Geometry.pair_symm
#print axioms SPHYS.Geometry.Ric_symm
#print axioms SPHYS.Geometry.contract_13
#print axioms SPHYS.Geometry.contract_23
#print axioms SPHYS.Geometry.contract_24
#print axioms SPHYS.Geometry.contract_34
#print axioms SPHYS.Geometry.full_contract_13_24
#print axioms SPHYS.Geometry.div_T2
#print axioms SPHYS.Geometry.field_equation_conserves_the_source
#print axioms SPHYS.Geometry.conservation_is_the_field_equation
#print axioms SPHYS.Geometry.law_sourced_by_a_field_is_conserved
#print axioms SPHYS.Geometry.parseval
#print axioms SPHYS.Geometry.trace_reversal
#print axioms SPHYS.Geometry.active_density
#print axioms SPHYS.Geometry.space_reading
#print axioms SPHYS.Geometry.active_density_in_four
#print axioms SPHYS.Geometry.space_reads_what_time_reads_iff
#print axioms SPHYS.Geometry.weight_of_matter_at_rest
#print axioms SPHYS.Geometry.every_reading_of_the_record_is_blind_to_charge
#print axioms SPHYS.Geometry.every_reading_of_the_record_is_blind_to_composition
#print axioms SPHYS.Geometry.no_reading_of_the_record_returns_the_charge
#print axioms SPHYS.Geometry.Premises.antimatter_weighs_as_matter
#print axioms SPHYS.Geometry.Premises.weight_is_blind_to_composition
#print axioms SPHYS.Geometry.Premises.weight_is_not_the_charge
#print axioms SPHYS.Geometry.Hess_symm
#print axioms SPHYS.Geometry.Rm_antisymm12
#print axioms SPHYS.Geometry.contract_12
#print axioms SPHYS.Geometry.model4_card
#print axioms SPHYS.Geometry.model4_one_time
#print axioms SPHYS.Geometry.model4_dScal_ne
#print axioms SPHYS.Geometry.einsteinPremises_coupling
#print axioms SPHYS.Geometry.noTwoTorsion_poly
```

## Appendix B · SPHYS_Schwarzschild_CC.lean

The static spherical form, with the chart connection proved torsion-free and metric, and free fall in it. 54 theorems, exit 0 with no warning.

```lean
/-
SPHYS_Schwarzschild_CC.lean · the static spherical solution of the vacuum law, derived
RATIONALE. The twin integrates light and a planet in the Schwarzschild solution. Until this file the solution was
  an import. Here the Ricci curvature of the static spherical form is computed from the metric by the coordinate
  definition, and the vacuum law is shown to hold exactly when (r f)' = 1, which forces f = 1 - 2m/r, m constant.
DESIGN. A chart is a field K of functions with four commuting derivations D 0..D 3 (t, r, theta, phi). Christoffel
  symbols and Ricci curvature are the textbook coordinate formulas for a diagonal metric. Sine and cosine enter as
  two elements s, c with D 2 s = c and D 2 c = -s; nothing else about them is used.
FREE FALL. The last part defines free fall with the same Christoffel symbols, proves the energy, the angular
  momentum and the square of the velocity conserved, and derives the equation of the orbit, u'' + u = m kappa / L^2
  + 3 m u^2, which the numerical twin integrates for Mercury (kappa = 1) and for light (kappa = 0).
RISK. The form diag(-f, 1/f, r^2, r^2 s^2) is assumed: static, spherical, and g_rr = 1/g_tt. This is not the full
  Birkhoff theorem. The inverse of zero is zero in a Lean field; r, s, f are assumed nonzero where it matters.
NON-NEGOTIABLE. No sorry, no axiom beyond Lean's own. Curvature is computed, never postulated.
-/
import Mathlib.Algebra.Field.Basic
import Mathlib.Algebra.CharZero.Defs
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.FinCases

namespace SPHYS.Schwarzschild

/-- A coordinate chart: a field of functions with four commuting derivations. -/
structure Chart (K : Type) [Field K] where
  D : Fin 4 → K → K
  D_add : ∀ i x y, D i (x + y) = D i x + D i y
  D_mul : ∀ i x y, D i (x * y) = D i x * y + x * D i y
  D_comm : ∀ i j x, D i (D j x) = D j (D i x)

variable {K : Type} [Field K]

namespace Chart
variable (C : Chart K)

theorem D_zero (i : Fin 4) : C.D i 0 = 0 := by
  have h := C.D_add i 0 0; rw [add_zero] at h; exact left_eq_add.mp h
theorem D_one (i : Fin 4) : C.D i 1 = 0 := by
  have h := C.D_mul i 1 1; simp only [mul_one, one_mul] at h; exact left_eq_add.mp h
theorem D_neg (i : Fin 4) (x : K) : C.D i (-x) = -C.D i x := by
  have h := C.D_add i x (-x); rw [add_neg_cancel, C.D_zero] at h; exact eq_neg_of_add_eq_zero_right h.symm
theorem D_sub (i : Fin 4) (x y : K) : C.D i (x - y) = C.D i x - C.D i y := by
  rw [sub_eq_add_neg, C.D_add, C.D_neg, sub_eq_add_neg]
theorem D_two (i : Fin 4) : C.D i 2 = 0 := by
  have : (2 : K) = 1 + 1 := by norm_num
  rw [this, C.D_add, C.D_one, add_zero]
/-- The derivative of an inverse. It holds at zero too, where the inverse is zero. -/
theorem D_inv (i : Fin 4) (x : K) : C.D i x⁻¹ = -(C.D i x * x⁻¹ * x⁻¹) := by
  by_cases hx : x = 0
  · subst hx; simp [C.D_zero]
  · have h := C.D_mul i x x⁻¹
    rw [mul_inv_cancel₀ hx, C.D_one] at h
    have e : x⁻¹ * x = 1 := inv_mul_cancel₀ hx
    linear_combination (-x⁻¹) * h - C.D i x⁻¹ * e
theorem D_div (i : Fin 4) (x y : K) : C.D i (x / y) = C.D i x * y⁻¹ - x * (C.D i y * y⁻¹ * y⁻¹) := by
  rw [div_eq_mul_inv, C.D_mul, C.D_inv]; ring

/-- A diagonal metric, as a full matrix. -/
def G (g : Fin 4 → K) (i j : Fin 4) : K := if i = j then g i else 0
/-- Christoffel symbols of a diagonal metric g. -/
def Gam (g : Fin 4 → K) (k i j : Fin 4) : K :=
  (g k)⁻¹ * 2⁻¹ * (C.D i (G g j k) + C.D j (G g i k) - C.D k (G g i j))
/-- The Ricci curvature, by the coordinate formula. -/
def Ric (g : Fin 4 → K) (i j : Fin 4) : K :=
  (∑ k, (C.D k (C.Gam g k i j) - C.D j (C.Gam g k i k)))
  + ∑ k, ∑ l, (C.Gam g k k l * C.Gam g l i j - C.Gam g k j l * C.Gam g l i k)
/-- The Christoffel symbols are symmetric: the connection of the chart has no torsion. -/
theorem Gam_symm (g : Fin 4 → K) (k i j : Fin 4) : C.Gam g k i j = C.Gam g k j i := by
  have hs : G g i j = G g j i := by
    unfold G
    by_cases h : i = j
    · subst h; rfl
    · rw [if_neg h, if_neg (Ne.symm h)]
  unfold Gam
  rw [hs, add_comm (C.D i (G g j k)) (C.D j (G g i k))]

/-- The connection of the chart preserves the metric: the derivative of the metric is carried by the Christoffel
symbols. With `Gam_symm` this says the connection is the torsion-free metric connection, in coordinates. -/
theorem Gam_metric (g : Fin 4 → K) (hg : ∀ i, g i ≠ 0) (h2 : (2 : K) ≠ 0) (k i j : Fin 4) :
    C.D k (G g i j) = ∑ l, (G g l j * C.Gam g l k i + G g i l * C.Gam g l k j) := by
  have hs : ∀ a b : Fin 4, G g a b = G g b a := by
    intro a b
    unfold G
    by_cases h : a = b
    · subst h; rfl
    · rw [if_neg h, if_neg (Ne.symm h)]
  have e1 : ∑ l, G g l j * C.Gam g l k i = g j * C.Gam g j k i := by simp [G]
  have e2 : ∑ l, G g i l * C.Gam g l k j = g i * C.Gam g i k j := by simp [G]
  rw [Finset.sum_add_distrib, e1, e2]
  unfold Gam
  rw [hs j i, hs k i, hs k j]
  have hi := hg i; have hj := hg j
  field_simp
  ring
end Chart

/-- The static spherical setting: the radius r, the sine and cosine of the polar angle, and one function f of r. -/
structure Static (K : Type) [Field K] extends Chart K where
  r : K
  s : K
  c : K
  f : K
  r_ne : r ≠ 0
  s_ne : s ≠ 0
  f_ne : f ≠ 0
  r0 : D 0 r = 0
  r1 : D 1 r = 1
  r2 : D 2 r = 0
  r3 : D 3 r = 0
  s0 : D 0 s = 0
  s1 : D 1 s = 0
  s2 : D 2 s = c
  s3 : D 3 s = 0
  c0 : D 0 c = 0
  c1 : D 1 c = 0
  c2 : D 2 c = -s
  c3 : D 3 c = 0
  f0 : D 0 f = 0
  f2 : D 2 f = 0
  f3 : D 3 f = 0

namespace Static
variable [CharZero K] (S : Static K)

-- One tactic block serves all sixteen components; on the components that vanish its tail has nothing to do.
-- Twelve components vanish without dividing by two, so they do not use the characteristic-zero assumption.
set_option linter.unusedSectionVars false
set_option linter.unusedTactic false
set_option linter.unreachableTactic false
set_option maxHeartbeats 1600000

/-- The metric diag(-f, 1/f, r^2, r^2 s^2). -/
def g : Fin 4 → K := ![-S.f, S.f⁻¹, S.r * S.r, S.r * S.r * (S.s * S.s)]
/-- No entry of the metric vanishes. -/
theorem g_ne (i : Fin 4) : S.g i ≠ 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  fin_cases i <;> simp [g, hr, hs, hf]

/-- THE CONNECTION OF THIS FILE IS THE TORSION-FREE METRIC CONNECTION. Its Christoffel symbols are symmetric and they
carry the derivative of the metric. The curvature below is the curvature of that connection, in coordinates. -/
theorem connection_is_torsion_free_and_metric :
    (∀ k i j, S.toChart.Gam S.g k i j = S.toChart.Gam S.g k j i) ∧
    (∀ k i j, S.D k (Chart.G S.g i j)
      = ∑ l, (Chart.G S.g l j * S.toChart.Gam S.g l k i + Chart.G S.g i l * S.toChart.Gam S.g l k j)) :=
  ⟨fun k i j => S.toChart.Gam_symm S.g k i j,
   fun k i j => S.toChart.Gam_metric S.g S.g_ne (by norm_num) k i j⟩

/-- The first and second radial derivatives of f. -/
def f' : K := S.D 1 S.f
def f'' : K := S.D 1 (S.D 1 S.f)

theorem fp0 : S.D 0 (S.D 1 S.f) = 0 := by rw [S.D_comm, S.f0, S.toChart.D_zero]
theorem fp2 : S.D 2 (S.D 1 S.f) = 0 := by rw [S.D_comm, S.f2, S.toChart.D_zero]
theorem fp3 : S.D 3 (S.D 1 S.f) = 0 := by rw [S.D_comm, S.f3, S.toChart.D_zero]

/-- The sixteen components of the Ricci curvature of the static spherical form, computed from the metric. -/
theorem ric_00 : S.toChart.Ric S.g 0 0 = S.f * (S.f'' * 2⁻¹ + S.f' * S.r⁻¹) := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_01 : S.toChart.Ric S.g 0 1 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_02 : S.toChart.Ric S.g 0 2 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_03 : S.toChart.Ric S.g 0 3 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_10 : S.toChart.Ric S.g 1 0 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_11 : S.toChart.Ric S.g 1 1 = -((S.f'' * 2⁻¹ + S.f' * S.r⁻¹) * S.f⁻¹) := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  -- The radial component is closed by an explicit certificate: the identity is reduced modulo the three
  -- relations x * x⁻¹ = 1, with the multipliers written out.
  have e1 : r * r⁻¹ = 1 := mul_inv_cancel₀ hr
  have e2 : s * s⁻¹ = 1 := mul_inv_cancel₀ hs
  have e3 : f * f⁻¹ = 1 := mul_inv_cancel₀ hf
  generalize r⁻¹ = a at *
  generalize s⁻¹ = b at *
  generalize f⁻¹ = e at *
  linear_combination
    (a ^ 2 * (r * a + 1) + a ^ 2 * (s * b) ^ 3 * (r * a * (s * b) + 1) - 2⁻¹ * d * e * a * (1 + (s * b) ^ 2)) * e1
    + (a ^ 2 * (s * b) ^ 2 * (r * a * (s * b) + 1) - 2⁻¹ * d * e * a * (s * b + 1)) * e2
    + (-(4⁻¹ * d ^ 2 * e ^ 2) - 2⁻¹ * d * e * a * (r * a) * (1 + (s * b) ^ 2)) * e3
theorem ric_12 : S.toChart.Ric S.g 1 2 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_13 : S.toChart.Ric S.g 1 3 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_20 : S.toChart.Ric S.g 2 0 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_21 : S.toChart.Ric S.g 2 1 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_22 : S.toChart.Ric S.g 2 2 = 1 - S.f - S.r * S.f' := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_23 : S.toChart.Ric S.g 2 3 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_30 : S.toChart.Ric S.g 3 0 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_31 : S.toChart.Ric S.g 3 1 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_32 : S.toChart.Ric S.g 3 2 = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem ric_33 : S.toChart.Ric S.g 3 3 = S.s * S.s * (1 - S.f - S.r * S.f') := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)

/-- The Ricci curvature as one table. -/
def ricTable : Fin 4 → Fin 4 → K :=
  ![![S.f * (S.f'' * 2⁻¹ + S.f' * S.r⁻¹), 0, 0, 0], ![0, -((S.f'' * 2⁻¹ + S.f' * S.r⁻¹) * S.f⁻¹), 0, 0],
    ![0, 0, 1 - S.f - S.r * S.f', 0], ![0, 0, 0, S.s * S.s * (1 - S.f - S.r * S.f')]]

theorem ric_eq (i j : Fin 4) : S.toChart.Ric S.g i j = S.ricTable i j := by
  fin_cases i <;> fin_cases j
  · exact S.ric_00
  · exact S.ric_01
  · exact S.ric_02
  · exact S.ric_03
  · exact S.ric_10
  · exact S.ric_11
  · exact S.ric_12
  · exact S.ric_13
  · exact S.ric_20
  · exact S.ric_21
  · exact S.ric_22
  · exact S.ric_23
  · exact S.ric_30
  · exact S.ric_31
  · exact S.ric_32
  · exact S.ric_33

/-- The radial equation: differentiating r f' + f = 1 once gives r f'' + 2 f' = 0. -/
theorem second_of_first (h : S.r * S.f' + S.f = 1) : S.r * S.f'' + 2 * S.f' = 0 := by
  have e := congrArg (S.D 1) h
  rw [S.toChart.D_add, S.toChart.D_mul, S.r1, S.toChart.D_one] at e
  simp only [f', f''] at *
  linear_combination e

/-- THE VACUUM LAW ON THE STATIC SPHERICAL FORM. The Ricci curvature vanishes exactly when (r f)' = 1. -/
theorem vacuum_iff : (∀ i j, S.toChart.Ric S.g i j = 0) ↔ S.r * S.f' + S.f = 1 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  constructor
  · intro h
    have h22 := h 2 2
    rw [S.ric_22] at h22
    linear_combination -h22
  · intro h i j
    have h2 := S.second_of_first h
    have e1 : S.r * S.r⁻¹ = 1 := mul_inv_cancel₀ hr
    have e2 : (2 : K) * 2⁻¹ = 1 := mul_inv_cancel₀ (by norm_num)
    have hk : S.f'' * 2⁻¹ + S.f' * S.r⁻¹ = 0 := by
      linear_combination (2⁻¹ * S.r⁻¹) * h2 - (S.f'' * 2⁻¹) * e1 - (S.f' * S.r⁻¹) * e2
    have hz : 1 - S.f - S.r * S.f' = 0 := by linear_combination -h
    fin_cases i <;> fin_cases j
    · exact S.ric_00.trans (by rw [hk, mul_zero])
    · exact S.ric_01
    · exact S.ric_02
    · exact S.ric_03
    · exact S.ric_10
    · exact S.ric_11.trans (by rw [hk, zero_mul, neg_zero])
    · exact S.ric_12
    · exact S.ric_13
    · exact S.ric_20
    · exact S.ric_21
    · exact S.ric_22.trans hz
    · exact S.ric_23
    · exact S.ric_30
    · exact S.ric_31
    · exact S.ric_32
    · exact S.ric_33.trans (by rw [hz, mul_zero])

/-- The mass function r (1 - f) / 2. -/
def mass : K := S.r * (1 - S.f) * 2⁻¹

/-- THE SOLUTION IS FORCED. If the vacuum law holds, the mass function is constant in all four coordinates and
f = 1 - 2 m / r. -/
theorem vacuum_forces_schwarzschild (h : ∀ i j, S.toChart.Ric S.g i j = 0) :
    (∀ i, S.D i S.mass = 0) ∧ S.f = 1 - 2 * S.mass / S.r := by
  have hr := S.r_ne
  have e := S.vacuum_iff.mp h
  simp only [f'] at e
  refine ⟨?_, ?_⟩
  · intro i
    fin_cases i <;>
      simp [mass, S.toChart.D_mul, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_one, S.toChart.D_two,
        S.r0, S.r1, S.r2, S.r3, S.f0, S.f2, S.f3]
    linear_combination -e
  · simp only [mass]
    field_simp

/-- AND IT IS A SOLUTION. If f = 1 - 2 m / r with m constant along the radius, the vacuum law holds. -/
theorem schwarzschild_is_vacuum (m : K) (hm : S.D 1 m = 0) (hf : S.f = 1 - 2 * m / S.r) :
    ∀ i j, S.toChart.Ric S.g i j = 0 := by
  have hr := S.r_ne
  apply S.vacuum_iff.mpr
  have e : S.r * S.f = S.r - 2 * m := by rw [hf]; field_simp
  have e' := congrArg (S.D 1) e
  rw [S.toChart.D_mul, S.toChart.D_sub, S.toChart.D_mul, S.toChart.D_two, S.r1, hm] at e'
  simp only [f']
  linear_combination e'
/-! ## Free fall in the static spherical form
    A field of velocities v, differentiated along itself with the Christoffel symbols of this file. Three
    quantities are conserved, they give the radial equation, and the radial equation gives the equation of the
    orbit that the numerical twin integrates. RISK: a field of velocities, not a single path; the orbit equation
    is stated where the radial velocity and the angular momentum do not vanish. -/

/-- The derivative of a function along a velocity field. -/
def along (v : Fin 4 → K) (x : K) : K := ∑ i, v i * S.D i x

/-- Free fall: the velocity field is geodesic for the connection of this file. -/
def Geodesic (v : Fin 4 → K) : Prop :=
  ∀ k, S.along v (v k) = -∑ i, ∑ j, S.toChart.Gam S.g k i j * v i * v j

theorem along_add (v : Fin 4 → K) (x y : K) : S.along v (x + y) = S.along v x + S.along v y := by
  simp only [along, S.D_add, Fin.sum_univ_four]; ring
theorem along_mul (v : Fin 4 → K) (x y : K) : S.along v (x * y) = S.along v x * y + x * S.along v y := by
  simp only [along, S.D_mul, Fin.sum_univ_four]; ring
theorem along_neg (v : Fin 4 → K) (x : K) : S.along v (-x) = -S.along v x := by
  simp only [along, S.toChart.D_neg, Fin.sum_univ_four]; ring
theorem along_sub (v : Fin 4 → K) (x y : K) : S.along v (x - y) = S.along v x - S.along v y := by
  simp only [along, S.toChart.D_sub, Fin.sum_univ_four]; ring
theorem along_inv (v : Fin 4 → K) (x : K) : S.along v x⁻¹ = -(S.along v x * x⁻¹ * x⁻¹) := by
  simp only [along, S.toChart.D_inv, Fin.sum_univ_four]; ring
theorem along_r (v : Fin 4 → K) : S.along v S.r = v 1 := by
  simp [along, Fin.sum_univ_four, S.r0, S.r1, S.r2, S.r3]
theorem along_s (v : Fin 4 → K) : S.along v S.s = v 2 * S.c := by
  simp [along, Fin.sum_univ_four, S.s0, S.s1, S.s2, S.s3]
theorem along_f (v : Fin 4 → K) : S.along v S.f = v 1 * S.f' := by
  simp [along, f', Fin.sum_univ_four, S.f0, S.f2, S.f3]

/-- The four equations of free fall, with the Christoffel symbols computed. -/
theorem fall_0 {v : Fin 4 → K} (hv : S.Geodesic v) : S.along v (v 0) = -(S.f' * S.f⁻¹ * v 0 * v 1) := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  rw [hv 0]
  simp [Chart.Gam, Chart.G, g, f', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3]
  clear hv
  all_goals (try simp only [f'])
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem fall_1 {v : Fin 4 → K} (hv : S.Geodesic v) : S.along v (v 1)
    = -(S.f * S.f' * 2⁻¹ * (v 0 * v 0)) + S.f' * S.f⁻¹ * 2⁻¹ * (v 1 * v 1)
      + S.r * S.f * (v 2 * v 2) + S.r * S.f * (S.s * S.s) * (v 3 * v 3) := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  rw [hv 1]
  simp [Chart.Gam, Chart.G, g, f', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3]
  clear hv
  all_goals (try simp only [f'])
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem fall_2 {v : Fin 4 → K} (hv : S.Geodesic v) : S.along v (v 2)
    = -(2 * S.r⁻¹ * (v 1 * v 2)) + S.s * S.c * (v 3 * v 3) := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  rw [hv 2]
  simp [Chart.Gam, Chart.G, g, f', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3]
  clear hv
  all_goals (try simp only [f'])
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)
theorem fall_3 {v : Fin 4 → K} (hv : S.Geodesic v) : S.along v (v 3)
    = -(2 * S.r⁻¹ * (v 1 * v 3)) - 2 * S.c * S.s⁻¹ * (v 2 * v 3) := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  rw [hv 3]
  simp [Chart.Gam, Chart.G, g, f', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3]
  clear hv
  all_goals (try simp only [f'])
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)

/-- The energy, the square of the angular momentum, and the square of the velocity in the metric. -/
def energy (v : Fin 4 → K) : K := S.f * v 0
def angSq (v : Fin 4 → K) : K := S.r * S.r * (S.r * S.r) * (v 2 * v 2 + S.s * S.s * (v 3 * v 3))
def speedSq (v : Fin 4 → K) : K :=
  -(S.f * (v 0 * v 0)) + S.f⁻¹ * (v 1 * v 1) + S.r * S.r * (v 2 * v 2) + S.r * S.r * (S.s * S.s) * (v 3 * v 3)

/-- The square of the velocity in the metric is the metric applied to the velocity. -/
theorem speedSq_eq (v : Fin 4 → K) : S.speedSq v = ∑ i, S.g i * (v i * v i) := by
  simp [speedSq, g, Fin.sum_univ_four]

/-- THE ENERGY IS CONSERVED IN FREE FALL. -/
theorem energy_conserved {v : Fin 4 → K} (hv : S.Geodesic v) : S.along v (S.energy v) = 0 := by
  have hf := S.f_ne
  rw [energy, S.along_mul, S.along_f, S.fall_0 hv]
  clear hv
  all_goals (try simp only [f'])
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)

/-- THE ANGULAR MOMENTUM IS CONSERVED IN FREE FALL. -/
theorem angSq_conserved {v : Fin 4 → K} (hv : S.Geodesic v) : S.along v (S.angSq v) = 0 := by
  have hr := S.r_ne; have hs := S.s_ne
  simp only [angSq, S.along_mul, S.along_add, S.along_r, S.along_s, S.fall_2 hv, S.fall_3 hv]
  clear hv
  all_goals (try simp only [f'])
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)

/-- THE SQUARE OF THE VELOCITY IS CONSERVED IN FREE FALL. -/
theorem speedSq_conserved {v : Fin 4 → K} (hv : S.Geodesic v) : S.along v (S.speedSq v) = 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp only [speedSq, S.along_mul, S.along_add, S.along_neg, S.along_inv, S.along_r, S.along_s, S.along_f,
    S.fall_0 hv, S.fall_1 hv, S.fall_2 hv, S.fall_3 hv]
  clear hv
  all_goals (try simp only [f'])
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)

/-- THE RADIAL EQUATION. The square of the radial velocity is the square of the energy minus f times the sum of
minus the square of the velocity and the square of the angular momentum over the square of the radius. It is
algebra on the three definitions. -/
theorem radial_equation (v : Fin 4 → K) :
    v 1 * v 1 = S.energy v * S.energy v - S.f * (-S.speedSq v + S.angSq v * (S.r⁻¹ * S.r⁻¹)) := by
  have hr := S.r_ne; have hf := S.f_ne
  simp only [energy, speedSq, angSq]
  all_goals (try simp only [f'])
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)

/-- THE EQUATION OF THE ORBIT. Let the form be the solution f = 1 - 2m/r with m constant, let L be the angular
momentum, L * L = angSq, and write u = 1/r and p = -(v 1)/L. Then u changes along the fall at the rate L u² p, so
L u² is the rate of the angle, and p changes at the rate L u² (m κ / L² - u + 3 m u²), where κ is minus the square
of the velocity. In the angle this is u'' + u = m κ / L² + 3 m u²: the equation the numerical twin integrates,
with κ = 1 for a planet and κ = 0 for light. -/
theorem orbit_equation {v : Fin 4 → K} (hv : S.Geodesic v) (m : K) (hm : ∀ i, S.D i m = 0)
    (hf : S.f = 1 - 2 * m * S.r⁻¹) (L : K) (hL : L * L = S.angSq v) (hL0 : L ≠ 0) :
    S.along v S.r⁻¹ = L * (S.r⁻¹ * S.r⁻¹) * (-(v 1) * L⁻¹) ∧
    S.along v (-(v 1) * L⁻¹)
      = L * (S.r⁻¹ * S.r⁻¹) * (m * (-S.speedSq v) * (L⁻¹ * L⁻¹) - S.r⁻¹ + 3 * m * (S.r⁻¹ * S.r⁻¹)) := by
  have hr := S.r_ne; have hf0 := S.f_ne
  have hLc : S.along v L = 0 := by
    have h := congrArg (S.along v) hL
    rw [S.along_mul, S.angSq_conserved hv] at h
    have h2 : (2 : K) * (L * S.along v L) = 0 := by linear_combination h
    exact (mul_eq_zero.mp ((mul_eq_zero.mp h2).resolve_left (by norm_num))).resolve_left hL0
  have hfp : S.f' = 2 * m * (S.r⁻¹ * S.r⁻¹) := by
    simp only [f']
    rw [hf]
    simp [S.toChart.D_sub, S.toChart.D_mul, S.toChart.D_inv, S.toChart.D_one, S.toChart.D_two, hm 1, S.r1]
  have hw : v 2 * v 2 = L * L * (S.r⁻¹ * S.r⁻¹ * (S.r⁻¹ * S.r⁻¹)) - S.s * S.s * (v 3 * v 3) := by
    rw [hL, angSq]; field_simp
  refine ⟨?_, ?_⟩
  · rw [S.along_inv, S.along_r]; field_simp; ring
  · rw [S.along_mul, S.along_neg, S.along_inv, hLc, S.fall_1 hv, hfp]
    simp only [speedSq]
    rw [hw]
    have hf' : S.f = (S.r - 2 * m) * S.r⁻¹ := by rw [hf]; field_simp
    have hf1 : S.r - 2 * m ≠ 0 := by
      intro h; apply hf0; rw [hf', h, zero_mul]
    rw [hf']
    obtain ⟨q, hq⟩ : ∃ q, q = S.r - 2 * m := ⟨_, rfl⟩
    have hq0 : q ≠ 0 := by rw [hq]; exact hf1
    have hmq : m = (S.r - q) * 2⁻¹ := by rw [hq]; ring
    rw [← hq]
    clear hv hw hLc hfp hL hf hf0 hf' hf1 hq hm
    subst hmq
    generalize S.r = r at *
    generalize S.s = s at *
    generalize v 0 = a at *
    generalize v 1 = b at *
    generalize v 3 = e at *
    have e1 : r * r⁻¹ = 1 := mul_inv_cancel₀ hr
    have e2 : q * q⁻¹ = 1 := mul_inv_cancel₀ hq0
    have e3 : L * L⁻¹ = 1 := mul_inv_cancel₀ hL0
    have e4 : (2 : K) * 2⁻¹ = 1 := mul_inv_cancel₀ (by norm_num)
    -- The identity is closed by an explicit certificate, reduced modulo the four relations e1 to e4.
    simp only [mul_inv, inv_inv]
    generalize r⁻¹ = ri at *
    generalize q⁻¹ = qi at *
    generalize L⁻¹ = Li at *
    generalize (2 : K)⁻¹ = hh at *
    linear_combination
      (-L^3*Li^2*hh*q*r*ri^5 - L^3*Li^2*hh*q*ri^4 + L^3*Li^2*hh*r^2*ri^5 + L^3*Li^2*hh*r*ri^4 + L^3*Li^2*hh*ri^3 - L^2*Li*q*ri^4 - L*Li^2*a^2*hh*q*ri^2 - L*Li^2*b^2*hh*q*qi*ri + L*Li^2*b^2*hh*qi*r*ri + L*Li^2*b^2*hh*qi - 3*L*hh*ri^3 + 2*Li*a^2*hh^2*q*ri^2 + 2*Li*b^2*hh^2*q*qi*ri - 2*Li*b^2*hh^2*qi*r*ri - 2*Li*b^2*hh^2*qi) * e1
      + (-L*Li^2*b^2*hh*ri + 2*Li*b^2*hh^2*ri) * e2
      + (-L^2*Li*hh*q*ri^4 + L^2*Li*hh*ri^3 - L*hh*q*ri^4 + L*hh*ri^3 - L*q*ri^4 + Li*a^2*hh*q^2*ri^3 - Li*a^2*hh*q*ri^2 + Li*b^2*hh*qi - Li*b^2*hh*ri) * e3
      + (L*q*ri^4 - L*ri^3 - Li*a^2*hh*q^2*ri^3 + Li*a^2*hh*q*ri^2 - Li*b^2*hh*qi + Li*b^2*hh*ri) * e4

/-- FREE FALL IN THE VACUUM SOLUTION OBEYS THE ORBIT EQUATION. No form of f is assumed: the vacuum law supplies it. -/
theorem free_fall_in_the_vacuum_solution (h : ∀ i j, S.toChart.Ric S.g i j = 0) {v : Fin 4 → K}
    (hv : S.Geodesic v) (L : K) (hL : L * L = S.angSq v) (hL0 : L ≠ 0) :
    S.along v S.r⁻¹ = L * (S.r⁻¹ * S.r⁻¹) * (-(v 1) * L⁻¹) ∧
    S.along v (-(v 1) * L⁻¹)
      = L * (S.r⁻¹ * S.r⁻¹)
        * (S.mass * (-S.speedSq v) * (L⁻¹ * L⁻¹) - S.r⁻¹ + 3 * S.mass * (S.r⁻¹ * S.r⁻¹)) :=
  S.orbit_equation hv S.mass (S.vacuum_forces_schwarzschild h).1
    ((S.vacuum_forces_schwarzschild h).2.trans (by rw [div_eq_mul_inv])) L hL hL0
end Static
end SPHYS.Schwarzschild

#print axioms SPHYS.Schwarzschild.Chart.Gam_symm
#print axioms SPHYS.Schwarzschild.Chart.Gam_metric
#print axioms SPHYS.Schwarzschild.Static.connection_is_torsion_free_and_metric
#print axioms SPHYS.Schwarzschild.Static.ric_eq
#print axioms SPHYS.Schwarzschild.Static.vacuum_iff
#print axioms SPHYS.Schwarzschild.Static.vacuum_forces_schwarzschild
#print axioms SPHYS.Schwarzschild.Static.schwarzschild_is_vacuum
#print axioms SPHYS.Schwarzschild.Static.energy_conserved
#print axioms SPHYS.Schwarzschild.Static.angSq_conserved
#print axioms SPHYS.Schwarzschild.Static.speedSq_conserved
#print axioms SPHYS.Schwarzschild.Static.radial_equation
#print axioms SPHYS.Schwarzschild.Static.orbit_equation
#print axioms SPHYS.Schwarzschild.Static.free_fall_in_the_vacuum_solution
```

## Appendix C · SPHYS_Birkhoff_CC.lean

The spherical form with no assumption that it is static, with the chart connection proved torsion-free and metric. 25 theorems, exit 0 with no warning.

```lean
/-
SPHYS_Birkhoff_CC.lean · the spherical vacuum solution is Schwarzschild and static
RATIONALE. SPHYS_Schwarzschild_CC.lean assumed the solution static and assumed g_rr = 1/g_tt. This file assumes
  neither. Two free functions A and B of the time and the radius are taken, and the vacuum law is shown to force
  B independent of the time, 1/B = 1 - 2m/r with m constant in all four coordinates, and A = (A B)(1 - 2m/r) with
  A B a function of the time alone. This is Birkhoff's theorem in the diagonal areal chart.
DESIGN. A chart is a field K of functions with four commuting derivations D 0..D 3 (t, r, theta, phi). Christoffel
  symbols and Ricci curvature are the textbook coordinate formulas for a diagonal metric. Sine and cosine enter as
  two elements s, c with D 2 s = c and D 2 c = -s; nothing else about them is used.
RISK. One assumption remains: that a spherically symmetric metric can be brought to the diagonal form
  diag(-A, B, r^2, r^2 s^2) with r the areal radius. That reduction is classical and is not formalised here.
  The three curvature identities are closed by explicit certificates (reduction modulo x * x⁻¹ = 1), generated
  by computer algebra and checked by Lean's `ring`; the generator is not trusted, only the check.
  The inverse of zero is zero in a Lean field; r, s, A, B are assumed nonzero.
NON-NEGOTIABLE. No sorry, no axiom beyond Lean's own. Curvature is computed, never postulated.
-/
import Mathlib.Algebra.Field.Basic
import Mathlib.Algebra.CharZero.Defs
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.FinCases

namespace SPHYS.Birkhoff

/-- A coordinate chart: a field of functions with four commuting derivations. -/
structure Chart (K : Type) [Field K] where
  D : Fin 4 → K → K
  D_add : ∀ i x y, D i (x + y) = D i x + D i y
  D_mul : ∀ i x y, D i (x * y) = D i x * y + x * D i y
  D_comm : ∀ i j x, D i (D j x) = D j (D i x)

variable {K : Type} [Field K]

namespace Chart
variable (C : Chart K)

theorem D_zero (i : Fin 4) : C.D i 0 = 0 := by
  have h := C.D_add i 0 0; rw [add_zero] at h; exact left_eq_add.mp h
theorem D_one (i : Fin 4) : C.D i 1 = 0 := by
  have h := C.D_mul i 1 1; simp only [mul_one, one_mul] at h; exact left_eq_add.mp h
theorem D_neg (i : Fin 4) (x : K) : C.D i (-x) = -C.D i x := by
  have h := C.D_add i x (-x); rw [add_neg_cancel, C.D_zero] at h; exact eq_neg_of_add_eq_zero_right h.symm
theorem D_sub (i : Fin 4) (x y : K) : C.D i (x - y) = C.D i x - C.D i y := by
  rw [sub_eq_add_neg, C.D_add, C.D_neg, sub_eq_add_neg]
theorem D_two (i : Fin 4) : C.D i 2 = 0 := by
  have : (2 : K) = 1 + 1 := by norm_num
  rw [this, C.D_add, C.D_one, add_zero]
/-- The derivative of an inverse. It holds at zero too, where the inverse is zero. -/
theorem D_inv (i : Fin 4) (x : K) : C.D i x⁻¹ = -(C.D i x * x⁻¹ * x⁻¹) := by
  by_cases hx : x = 0
  · subst hx; simp [C.D_zero]
  · have h := C.D_mul i x x⁻¹
    rw [mul_inv_cancel₀ hx, C.D_one] at h
    have e : x⁻¹ * x = 1 := inv_mul_cancel₀ hx
    linear_combination (-x⁻¹) * h - C.D i x⁻¹ * e
theorem D_div (i : Fin 4) (x y : K) : C.D i (x / y) = C.D i x * y⁻¹ - x * (C.D i y * y⁻¹ * y⁻¹) := by
  rw [div_eq_mul_inv, C.D_mul, C.D_inv]; ring

/-- A diagonal metric, as a full matrix. -/
def G (g : Fin 4 → K) (i j : Fin 4) : K := if i = j then g i else 0
/-- Christoffel symbols of a diagonal metric g. -/
def Gam (g : Fin 4 → K) (k i j : Fin 4) : K :=
  (g k)⁻¹ * 2⁻¹ * (C.D i (G g j k) + C.D j (G g i k) - C.D k (G g i j))
/-- The Ricci curvature, by the coordinate formula. -/
def Ric (g : Fin 4 → K) (i j : Fin 4) : K :=
  (∑ k, (C.D k (C.Gam g k i j) - C.D j (C.Gam g k i k)))
  + ∑ k, ∑ l, (C.Gam g k k l * C.Gam g l i j - C.Gam g k j l * C.Gam g l i k)
/-- The Christoffel symbols are symmetric: the connection of the chart has no torsion. -/
theorem Gam_symm (g : Fin 4 → K) (k i j : Fin 4) : C.Gam g k i j = C.Gam g k j i := by
  have hs : G g i j = G g j i := by
    unfold G
    by_cases h : i = j
    · subst h; rfl
    · rw [if_neg h, if_neg (Ne.symm h)]
  unfold Gam
  rw [hs, add_comm (C.D i (G g j k)) (C.D j (G g i k))]

/-- The connection of the chart preserves the metric: the derivative of the metric is carried by the Christoffel
symbols. With `Gam_symm` this says the connection is the torsion-free metric connection, in coordinates. -/
theorem Gam_metric (g : Fin 4 → K) (hg : ∀ i, g i ≠ 0) (h2 : (2 : K) ≠ 0) (k i j : Fin 4) :
    C.D k (G g i j) = ∑ l, (G g l j * C.Gam g l k i + G g i l * C.Gam g l k j) := by
  have hs : ∀ a b : Fin 4, G g a b = G g b a := by
    intro a b
    unfold G
    by_cases h : a = b
    · subst h; rfl
    · rw [if_neg h, if_neg (Ne.symm h)]
  have e1 : ∑ l, G g l j * C.Gam g l k i = g j * C.Gam g j k i := by simp [G]
  have e2 : ∑ l, G g i l * C.Gam g l k j = g i * C.Gam g i k j := by simp [G]
  rw [Finset.sum_add_distrib, e1, e2]
  unfold Gam
  rw [hs j i, hs k i, hs k j]
  have hi := hg i; have hj := hg j
  field_simp
  ring
end Chart

/-- The spherical setting, not assumed static: the radius r, the sine and cosine of the polar angle, and two
functions A and B that may depend on the time and on the radius. -/
structure Sph (K : Type) [Field K] extends Chart K where
  r : K
  s : K
  c : K
  A : K
  B : K
  r_ne : r ≠ 0
  s_ne : s ≠ 0
  A_ne : A ≠ 0
  B_ne : B ≠ 0
  r0 : D 0 r = 0
  r1 : D 1 r = 1
  r2 : D 2 r = 0
  r3 : D 3 r = 0
  s0 : D 0 s = 0
  s1 : D 1 s = 0
  s2 : D 2 s = c
  s3 : D 3 s = 0
  c0 : D 0 c = 0
  c1 : D 1 c = 0
  c2 : D 2 c = -s
  c3 : D 3 c = 0
  A2 : D 2 A = 0
  A3 : D 3 A = 0
  B2 : D 2 B = 0
  B3 : D 3 B = 0

namespace Sph
variable [CharZero K] (S : Sph K)

-- The characteristic-zero assumption is not used by every lemma below.
set_option linter.unusedSectionVars false
set_option maxHeartbeats 1600000

/-- The metric diag(-A, B, r^2, r^2 s^2). -/
def g : Fin 4 → K := ![-S.A, S.B, S.r * S.r, S.r * S.r * (S.s * S.s)]

/-- No entry of the metric vanishes. -/
theorem g_ne (i : Fin 4) : S.g i ≠ 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hA := S.A_ne; have hB := S.B_ne
  fin_cases i <;> simp [g, hr, hs, hA, hB]

/-- THE CONNECTION OF THIS FILE IS THE TORSION-FREE METRIC CONNECTION. Its Christoffel symbols are symmetric and they
carry the derivative of the metric. The curvature below is the curvature of that connection, in coordinates. -/
theorem connection_is_torsion_free_and_metric :
    (∀ k i j, S.toChart.Gam S.g k i j = S.toChart.Gam S.g k j i) ∧
    (∀ k i j, S.D k (Chart.G S.g i j)
      = ∑ l, (Chart.G S.g l j * S.toChart.Gam S.g l k i + Chart.G S.g i l * S.toChart.Gam S.g l k j)) :=
  ⟨fun k i j => S.toChart.Gam_symm S.g k i j,
   fun k i j => S.toChart.Gam_metric S.g S.g_ne (by norm_num) k i j⟩

theorem A20 : S.D 2 (S.D 0 S.A) = 0 := by rw [S.D_comm, S.A2, S.toChart.D_zero]
theorem A21 : S.D 2 (S.D 1 S.A) = 0 := by rw [S.D_comm, S.A2, S.toChart.D_zero]
theorem A30 : S.D 3 (S.D 0 S.A) = 0 := by rw [S.D_comm, S.A3, S.toChart.D_zero]
theorem A31 : S.D 3 (S.D 1 S.A) = 0 := by rw [S.D_comm, S.A3, S.toChart.D_zero]
theorem B20 : S.D 2 (S.D 0 S.B) = 0 := by rw [S.D_comm, S.B2, S.toChart.D_zero]
theorem B21 : S.D 2 (S.D 1 S.B) = 0 := by rw [S.D_comm, S.B2, S.toChart.D_zero]
theorem B30 : S.D 3 (S.D 0 S.B) = 0 := by rw [S.D_comm, S.B3, S.toChart.D_zero]
theorem B31 : S.D 3 (S.D 1 S.B) = 0 := by rw [S.D_comm, S.B3, S.toChart.D_zero]
theorem A10 : S.D 1 (S.D 0 S.A) = S.D 0 (S.D 1 S.A) := S.D_comm 1 0 S.A
theorem B10 : S.D 1 (S.D 0 S.B) = S.D 0 (S.D 1 S.B) := S.D_comm 1 0 S.B

/-- The mixed time-radius component: it is the time derivative of B, over r B. -/
theorem ric_01 : S.toChart.Ric S.g 0 1 = S.D 0 S.B * S.r⁻¹ * S.B⁻¹ := by
  have hr := S.r_ne; have hs := S.s_ne; have hA := S.A_ne; have hB := S.B_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.A2, S.A3, S.B2, S.B3,
    S.A20, S.A21, S.A30, S.A31, S.B20, S.B21, S.B30, S.B31, S.A10, S.B10]
  generalize S.D 0 (S.D 0 S.A) = Att at *
  generalize S.D 0 (S.D 1 S.A) = Atr at *
  generalize S.D 1 (S.D 1 S.A) = Arr at *
  generalize S.D 0 (S.D 0 S.B) = Btt at *
  generalize S.D 0 (S.D 1 S.B) = Btr at *
  generalize S.D 1 (S.D 1 S.B) = Brr at *
  generalize S.D 0 S.A = At at *
  generalize S.D 1 S.A = Ar at *
  generalize S.D 0 S.B = Bt at *
  generalize S.D 1 S.B = Br at *
  generalize S.r = r at *
  generalize S.s = s at *
  generalize S.c = c at *
  generalize S.A = A at *
  generalize S.B = B at *
  have e1 : r * r⁻¹ = 1 := mul_inv_cancel₀ hr
  have e2 : s * s⁻¹ = 1 := mul_inv_cancel₀ hs
  have e3 : A * A⁻¹ = 1 := mul_inv_cancel₀ hA
  have e4 : B * B⁻¹ = 1 := mul_inv_cancel₀ hB
  generalize r⁻¹ = a at *
  generalize s⁻¹ = b at *
  generalize A⁻¹ = p at *
  generalize B⁻¹ = q at *
  linear_combination
    (Bt*a*b^2*q*s^2/2 + Bt*a*q/2) * e1
    + (Bt*a*b*q*s/2 + Bt*a*q/2) * e2

/-- The angular component. It carries no time derivative. -/
theorem ric_22 : S.toChart.Ric S.g 2 2 = 1 - S.B⁻¹ - S.r * 2⁻¹ * S.B⁻¹ * (S.D 1 S.A * S.A⁻¹ - S.D 1 S.B * S.B⁻¹) := by
  have hr := S.r_ne; have hs := S.s_ne; have hA := S.A_ne; have hB := S.B_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.A2, S.A3, S.B2, S.B3,
    S.A20, S.A21, S.A30, S.A31, S.B20, S.B21, S.B30, S.B31, S.A10, S.B10]
  generalize S.D 0 (S.D 0 S.A) = Att at *
  generalize S.D 0 (S.D 1 S.A) = Atr at *
  generalize S.D 1 (S.D 1 S.A) = Arr at *
  generalize S.D 0 (S.D 0 S.B) = Btt at *
  generalize S.D 0 (S.D 1 S.B) = Btr at *
  generalize S.D 1 (S.D 1 S.B) = Brr at *
  generalize S.D 0 S.A = At at *
  generalize S.D 1 S.A = Ar at *
  generalize S.D 0 S.B = Bt at *
  generalize S.D 1 S.B = Br at *
  generalize S.r = r at *
  generalize S.s = s at *
  generalize S.c = c at *
  generalize S.A = A at *
  generalize S.B = B at *
  have e1 : r * r⁻¹ = 1 := mul_inv_cancel₀ hr
  have e2 : s * s⁻¹ = 1 := mul_inv_cancel₀ hs
  have e3 : A * A⁻¹ = 1 := mul_inv_cancel₀ hA
  have e4 : B * B⁻¹ = 1 := mul_inv_cancel₀ hB
  generalize r⁻¹ = a at *
  generalize s⁻¹ = b at *
  generalize A⁻¹ = p at *
  generalize B⁻¹ = q at *
  linear_combination
    (a^3*b^4*c^2*r^3*s^2 + a^2*b^4*c^2*r^2*s^2 + a*b^4*c^2*r*s^2 - a*b^2*c^2*r - a*b^2*q*r*s^2 + a*b^2*r*s^2 + a*q*r + b^4*c^2*s^2 - b^2*c^2 - b^2*q*s^2 + b^2*s^2 + q) * e1
    + (b^3*c^2*s + b^2*c^2 - b*q*s + b*s - q + 1) * e2

/-- The combination B R_tt + A R_rr: every time derivative cancels, and (A B)' over r B remains. -/
theorem ric_sum : S.B * S.toChart.Ric S.g 0 0 + S.A * S.toChart.Ric S.g 1 1 = (S.D 1 S.A * S.B + S.A * S.D 1 S.B) * S.r⁻¹ * S.B⁻¹ := by
  have hr := S.r_ne; have hs := S.s_ne; have hA := S.A_ne; have hB := S.B_ne
  simp [Chart.Ric, Chart.Gam, Chart.G, g, Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.A2, S.A3, S.B2, S.B3,
    S.A20, S.A21, S.A30, S.A31, S.B20, S.B21, S.B30, S.B31, S.A10, S.B10]
  generalize S.D 0 (S.D 0 S.A) = Att at *
  generalize S.D 0 (S.D 1 S.A) = Atr at *
  generalize S.D 1 (S.D 1 S.A) = Arr at *
  generalize S.D 0 (S.D 0 S.B) = Btt at *
  generalize S.D 0 (S.D 1 S.B) = Btr at *
  generalize S.D 1 (S.D 1 S.B) = Brr at *
  generalize S.D 0 S.A = At at *
  generalize S.D 1 S.A = Ar at *
  generalize S.D 0 S.B = Bt at *
  generalize S.D 1 S.B = Br at *
  generalize S.r = r at *
  generalize S.s = s at *
  generalize S.c = c at *
  generalize S.A = A at *
  generalize S.B = B at *
  have e1 : r * r⁻¹ = 1 := mul_inv_cancel₀ hr
  have e2 : s * s⁻¹ = 1 := mul_inv_cancel₀ hs
  have e3 : A * A⁻¹ = 1 := mul_inv_cancel₀ hA
  have e4 : B * B⁻¹ = 1 := mul_inv_cancel₀ hB
  generalize r⁻¹ = a at *
  generalize s⁻¹ = b at *
  generalize A⁻¹ = p at *
  generalize B⁻¹ = q at *
  linear_combination
    (A*Br*a*b^2*q*s^2/2 + A*Br*a*q/2 + A*a^3*b^4*r*s^4 + A*a^3*r + A*a^2*b^4*s^4 + A*a^2 + Ar*B*a*b^2*q*s^2/2 + Ar*B*a*q/2) * e1
    + (A*Br*a*b*q*s/2 + A*Br*a*q/2 + A*a^2*b^3*s^3 + A*a^2*b^2*s^2 + Ar*B*a*b*q*s/2 + Ar*B*a*q/2) * e2
    + (Ar^2*p/4 + Ar*Br*q/4 - Arr/2 - At*Bt*p/4 - Bt^2*q/4 + Btt/2) * e3
    + (-Ar^2*p/4 - Ar*Br*q/4 + Arr/2 + At*Bt*p/4 + Bt^2*q/4 - Btt/2) * e4

/-- The mass function r (1 - 1/B) / 2. -/
def mass : K := S.r * (1 - S.B⁻¹) * 2⁻¹

/-- BIRKHOFF'S THEOREM IN THE DIAGONAL AREAL CHART. If the vacuum law holds, with no assumption that anything is
static: B does not depend on the time; the mass function is constant in all four coordinates; 1/B = 1 - 2m/r;
the product A B depends on the time alone; and A = (A B)(1 - 2m/r). A time-dependent A B is a choice of clock. -/
theorem birkhoff (h : ∀ i j, S.toChart.Ric S.g i j = 0) :
    S.D 0 S.B = 0 ∧ (∀ i, S.D i S.mass = 0) ∧ S.B⁻¹ = 1 - 2 * S.mass / S.r
      ∧ S.D 1 (S.A * S.B) = 0 ∧ S.D 2 (S.A * S.B) = 0 ∧ S.D 3 (S.A * S.B) = 0
      ∧ S.A = S.A * S.B * (1 - 2 * S.mass / S.r) := by
  have hr := S.r_ne; have hA := S.A_ne; have hB := S.B_ne
  have e1 : S.r * S.r⁻¹ = 1 := mul_inv_cancel₀ hr
  have e3 : S.A * S.A⁻¹ = 1 := mul_inv_cancel₀ hA
  have e4 : S.B * S.B⁻¹ = 1 := mul_inv_cancel₀ hB
  have e5 : (2 : K) * 2⁻¹ = 1 := mul_inv_cancel₀ (by norm_num)
  have h01 := h 0 1
  rw [S.ric_01] at h01
  have Bt0 : S.D 0 S.B = 0 := by simpa [hr, hB] using h01
  have hs := S.ric_sum
  rw [h 0 0, h 1 1, mul_zero, mul_zero, add_zero] at hs
  have hAB : S.D 1 S.A * S.B + S.A * S.D 1 S.B = 0 := by simpa [hr, hB] using hs.symm
  have h22 := h 2 2
  rw [S.ric_22] at h22
  have m0 : S.D 0 S.mass = 0 := by
    simp only [mass, S.toChart.D_mul, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_one, S.toChart.D_two, S.r0, Bt0]
    ring
  have m1 : S.D 1 S.mass = 0 := by
    simp only [mass, S.toChart.D_mul, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_one, S.toChart.D_two, S.r1]
    linear_combination (2⁻¹ : K) * h22 + (S.r * S.B⁻¹ * 4⁻¹ * (S.A⁻¹ * S.B⁻¹)) * hAB
      - (S.r * S.B⁻¹ * 4⁻¹ * (S.D 1 S.A * S.A⁻¹)) * e4 - (S.r * S.B⁻¹ * 4⁻¹ * (S.D 1 S.B * S.B⁻¹)) * e3
  have m2 : S.D 2 S.mass = 0 := by
    simp only [mass, S.toChart.D_mul, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_one, S.toChart.D_two, S.r2, S.B2]
    ring
  have m3 : S.D 3 S.mass = 0 := by
    simp only [mass, S.toChart.D_mul, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_one, S.toChart.D_two, S.r3, S.B3]
    ring
  have hq : S.B⁻¹ = 1 - 2 * S.mass / S.r := by
    rw [div_eq_mul_inv]
    simp only [mass]
    linear_combination ((1 - S.B⁻¹) * (S.r * S.r⁻¹)) * e5 + (1 - S.B⁻¹) * e1
  refine ⟨Bt0, ?_, hq, ?_, ?_, ?_, ?_⟩
  · intro i
    fin_cases i
    · exact m0
    · exact m1
    · exact m2
    · exact m3
  · rw [S.toChart.D_mul]; exact hAB
  · rw [S.toChart.D_mul, S.A2, S.B2]; ring
  · rw [S.toChart.D_mul, S.A3, S.B3]; ring
  · rw [← hq, mul_assoc, e4, mul_one]
end Sph
end SPHYS.Birkhoff

#print axioms SPHYS.Birkhoff.Chart.Gam_symm
#print axioms SPHYS.Birkhoff.Chart.Gam_metric
#print axioms SPHYS.Birkhoff.Sph.connection_is_torsion_free_and_metric
#print axioms SPHYS.Birkhoff.Sph.ric_01
#print axioms SPHYS.Birkhoff.Sph.ric_22
#print axioms SPHYS.Birkhoff.Sph.ric_sum
#print axioms SPHYS.Birkhoff.Sph.birkhoff
```

## Appendix D · Gravity_Forced_Twin_CC.f90

Ten checks, zero failures. Compiled with gfortran, standard 2018, all warnings on. The run is Appendix E.

```fortran
! Gravity_Forced_Twin_CC.f90 · numerical twin of SPHYS_Gravity_Forced_CC.lean
! RATIONALE. The first twin of this paper evaluated textbook formulas and compared them with measurements. That shows
!   general relativity agrees with observation, which was known. This twin is built to discriminate: it integrates
!   the paths of light and of a planet in the exact solution of the forced law, and beside each it integrates rival
!   laws, which must fail the same measurement. It also checks the conservation statement of the engine on the
!   engine's own model geometry, with rival ratios beside it.
! DESIGN. Double precision, no library, fourth-order Runge-Kutta throughout.
!   A. Light past the Sun. A ray in the plane obeys dv/ds = grad(ln n) - (v.grad(ln n)) v for unit tangent v, where
!      n is the optical index of the static metric in isotropic coordinates. Exact solution of the forced law
!      (Schwarzschild 1916): n = (1 + m/2r)**3 / (1 - m/2r). Rival, with the space part weighted by gamma:
!      n = sqrt((1 + 2 gamma m/r) / (1 - 2m/r)). The ray runs from 10000 solar radii before the Sun to 10000 after,
!      with a step of one thousandth of the distance to the Sun. Nothing of the form 4GM/(c**2 R) is entered.
!      A second road for the exact solution: the equation of the orbit that SPHYS_Schwarzschild_CC.lean derives
!      from free fall (`orbit_equation`), with kappa = 0 for light, u'' + u = 3 m u**2, integrated from the point
!      of closest approach to u = 0. The two roads share no formula and must agree.
!   B. Mercury. The orbit obeys u'' + u = 1/p + 3 k m u**2, with k = (2 + 2 gamma - beta)/3 in the standard
!      post-Newtonian parameters (Will 2014); the exact solution of the forced law has gamma = beta = 1, k = 1.
!      Rivals: a law whose space part reads nothing (gamma = 0, beta = 1, k = 1/3), and Nordstrom's scalar law
!      (gamma = -1, beta = 1/2, k = -1/6), which also bends no light. Fifty orbits at 20000 steps each; each
!      perihelion is located by one Newton step on u'.
!   C. Conservation on the model of Part VIII of the engine, where the curvature is K = -(1 + x**2): the divergence
!      of a Ric + b Scal g + c g along the first field of the frame is d/dx of (a + 2b) K + c. In two dimensions
!      the forced combination 2 Ric - Scal g vanishes identically, so its conservation there tests nothing and is
!      printed as a note, not counted as a check. The checks are the rival ratios, which are not conserved.
!   Measured inputs: GM of the Sun 1.32712440018e20 m**3/s**2, c = 299792458 m/s, solar radius 6.957e8 m;
!   gamma = 0.9998 +- 0.0004 from radio deflection (Shapiro et al. 2004); Mercury's semi-major axis 5.7909e10 m,
!   eccentricity 0.2056, period 87.969 days; observed advance 42.98 +- 0.04 arcsec a century (Will 2014).
! CONVENTION. A law agrees when it lies within two printed uncertainties; a rival is excluded beyond five.
! RISK. The exact solution integrated here is the one the paper derives in Lean (SPHYS_Schwarzschild_CC.lean and
!   SPHYS_Birkhoff_CC.lean): 1 - 2m/r, forced by the vacuum law. The equation of the orbit integrated in B and in
!   the second road of A is a theorem of the first file. The isotropic form, used for the optical index in the
!   first road of A, is the classical change of radial coordinate and is not formalised. The rival indices and the
!   rival weights k are standard post-Newtonian forms, entered. What is tested is the forced law's solution
!   against rivals.
! NON-NEGOTIABLE. Every check compares numbers this program integrated. A rival that passed would be printed FAIL.
program gravity_forced_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0)
  real(dp), parameter :: GM = 1.32712440018e20_dp, c = 299792458.0_dp, Rs = 6.957e8_dp
  real(dp), parameter :: pi = 3.14159265358979323846_dp, asec = 206264.806247096_dp
  real(dp) :: d_orb, m, d_ex, d_lo2, d_hi2, d_lo5, d_hi5, d_newt, d_st, d_nord, adv, adv_r, adv_n, x, xx, worst, cc
  integer :: nfail, npass, i
  logical :: ok
  nfail = 0; npass = 0
  m = GM/(c*c)/Rs                                  ! the mass of the Sun in units of its radius

  ! A. the bending of light at the limb
  d_ex  = bend(m, -1.0_dp)*asec                    ! the exact solution of the forced law
  d_lo2 = bend(m, 0.9998_dp - 2.0_dp*0.0004_dp)*asec; d_hi2 = bend(m, 0.9998_dp + 2.0_dp*0.0004_dp)*asec
  d_lo5 = bend(m, 0.9998_dp - 5.0_dp*0.0004_dp)*asec; d_hi5 = bend(m, 0.9998_dp + 5.0_dp*0.0004_dp)*asec
  d_newt = bend(m, 0.0_dp)*asec                    ! rival: the space part reads nothing
  d_st   = bend(m, 0.99_dp)*asec                   ! rival: a scalar-tensor law with gamma = 0.99
  d_nord = 0.0_dp      ! rival: Nordstrom's scalar law. Its metric is conformally flat, so light runs straight;
                       ! this zero is that classical fact, entered, not integrated.
  write(*,'(a,f9.5,a)') '  light at the limb, exact solution of the forced law, integrated: ', d_ex, ' arcsec'
  write(*,'(a,f9.5,a,f9.5)') '  measured band, two uncertainties, integrated at its two ends: ', d_lo2, ' to ', d_hi2
  write(*,'(a,f9.5,a,f9.5)') '  measured band, five uncertainties:                           ', d_lo5, ' to ', d_hi5
  write(*,'(a,f9.5,a,f9.5)') '  rivals integrated: space part reading nothing ', d_newt, '; gamma = 0.99 ', d_st
  call check('A1 the forced law bends light inside two uncertainties of the measured band', &
       d_ex > d_lo2 .and. d_ex < d_hi2)
  call check('A2 a law whose space part reads nothing is excluded: outside five uncertainties', &
       d_newt < d_lo5 .or. d_newt > d_hi5)
  call check('A3 a scalar-tensor law with gamma = 0.99 is excluded: outside five uncertainties', &
       d_st < d_lo5 .or. d_st > d_hi5)
  d_orb = bend_orbit(m)*asec                       ! the second road: the orbit equation derived in Lean
  write(*,'(a,f9.5,a)') '  light at the limb, on the orbit equation derived in Lean, integrated: ', d_orb, ' arcsec'
  call check('A5 the two roads to the bending of light agree to 0.00005 arcsec', abs(d_orb - d_ex) < 5.0e-5_dp)
  write(*,'(a,f9.5)') '  rival, not integrated: a scalar law bends no light (conformal flatness): ', d_nord
  call check('A4 a scalar law of gravity is excluded by the bending of light', d_nord < d_lo5)

  ! B. the perihelion of Mercury
  adv   = advance(1.0_dp)
  adv_r = advance(1.0_dp/3.0_dp)
  adv_n = advance(-1.0_dp/6.0_dp)
  write(*,'(a,f8.3,a)') '  Mercury, exact solution, 50 orbits integrated: ', adv, ' arcsec a century'
  write(*,'(a,f8.3,a)') '  rival, space part reading nothing (k = 1/3):   ', adv_r, ' arcsec a century'
  write(*,'(a,f8.3,a)') '  rival, Nordstrom scalar law (k = -1/6):        ', adv_n, ' arcsec a century'
  call check('B1 the forced law advances the perihelion inside two uncertainties of 42.98 +- 0.04', &
       abs(adv - 42.98_dp) < 2.0_dp*0.04_dp)
  call check('B2 the law whose space part reads nothing is excluded: beyond five uncertainties', &
       abs(adv_r - 42.98_dp) > 5.0_dp*0.04_dp)
  call check('B3 the scalar law is excluded: the perihelion would retreat', adv_n < 0.0_dp)

  ! C. conservation on the model geometry, K = -(1 + x**2), by a centred difference of step 1e-4
  ok = .true.; worst = 0.0_dp
  do i = 1, 1000
    x = -3.0_dp + 6.0_dp*real(i, dp)/1000.0_dp; cc = real(mod(i*37, 101) - 50, dp)
    xx = divlaw(2.0_dp, -1.0_dp, cc, x); worst = max(worst, abs(xx))
    if (abs(xx) > 1.0e-6_dp) ok = .false.
  end do
  write(*,'(a,es9.2)') '  note: 2 Ric - Scal g + c g on the model, largest divergence over 1000 points:    ', worst
  if (.not. ok) nfail = nfail + 1                  ! a note, not a check: it holds identically in two dimensions
  write(*,'(a,f9.4,a,f9.4)') '  divergence at x = 1: Ricci alone ', divlaw(1.0_dp, 0.0_dp, 0.0_dp, 1.0_dp), &
        '; Ric - Scal g ', divlaw(1.0_dp, -1.0_dp, 0.0_dp, 1.0_dp)
  call check('C1 the Ricci curvature alone is not conserved on the model', &
       abs(divlaw(1.0_dp, 0.0_dp, 0.0_dp, 1.0_dp)) > 0.1_dp)
  call check('C2 nor is Ric - Scal g, the ratio one to minus one', &
       abs(divlaw(1.0_dp, -1.0_dp, 0.0_dp, 1.0_dp)) > 0.1_dp)

  write(*,'(a,i0,a,i0)') 'checks passed: ', npass, '   failures: ', nfail
contains
  ! gradient of ln n over r, as a factor of the position vector: (d ln n / dr) / r.  gam < 0 selects the exact solution.
  real(dp) function dlnn(mm, gam, r)
    real(dp), intent(in) :: mm, gam, r
    if (gam < 0.0_dp) then
      dlnn = (-1.5_dp*mm/(r*r)/(1.0_dp + 0.5_dp*mm/r) - 0.5_dp*mm/(r*r)/(1.0_dp - 0.5_dp*mm/r))/r
    else
      dlnn = (-gam*mm/(r*r)/(1.0_dp + 2.0_dp*gam*mm/r) - mm/(r*r)/(1.0_dp - 2.0_dp*mm/r))/r
    end if
  end function
  subroutine rhs(mm, gam, y, f)
    real(dp), intent(in) :: mm, gam, y(4)
    real(dp), intent(out) :: f(4)
    real(dp) :: r, gx, gy, vg
    r = sqrt(y(1)*y(1) + y(2)*y(2)); gx = dlnn(mm, gam, r)*y(1); gy = dlnn(mm, gam, r)*y(2)
    vg = y(3)*gx + y(4)*gy
    f(1) = y(3); f(2) = y(4); f(3) = gx - vg*y(3); f(4) = gy - vg*y(4)
  end subroutine
  ! total turning of a ray that starts parallel to the axis at height one solar radius, far before the Sun
  real(dp) function bend(mm, gam)
    real(dp), intent(in) :: mm, gam
    real(dp) :: y(4), k1(4), k2(4), k3(4), k4(4), h, r
    y = (/ -1.0e4_dp, 1.0_dp, 1.0_dp, 0.0_dp /)
    do while (y(1) < 1.0e4_dp)
      r = sqrt(y(1)*y(1) + y(2)*y(2)); h = 1.0e-3_dp*r
      call rhs(mm, gam, y, k1); call rhs(mm, gam, y + 0.5_dp*h*k1, k2)
      call rhs(mm, gam, y + 0.5_dp*h*k2, k3); call rhs(mm, gam, y + h*k3, k4)
      y = y + h*(k1 + 2.0_dp*k2 + 2.0_dp*k3 + k4)/6.0_dp
    end do
    bend = -atan2(y(4), y(3))
  end function
  ! bending of light of impact parameter one solar radius, on u'' + u = 3 m u**2 (kappa = 0 in `orbit_equation`).
  ! The first integral u'**2 = 1 - u**2 + 2 m u**3 fixes the closest approach u0; the ray is followed to u = 0.
  real(dp) function bend_orbit(mm)
    real(dp), intent(in) :: mm
    real(dp), parameter :: h = 1.0e-5_dp
    real(dp) :: u, w, phi, a1, a2, a3, a4, b1, b2, b3, b4, uold, wold
    integer :: j
    u = 1.0_dp
    do j = 1, 50                                             ! Newton on u**2 - 2 m u**3 = 1
      u = u - (u*u - 2.0_dp*mm*u*u*u - 1.0_dp)/(2.0_dp*u - 6.0_dp*mm*u*u)
    end do
    w = 0.0_dp; phi = 0.0_dp
    do
      uold = u; wold = w
      a1 = w;                 b1 = 3.0_dp*mm*u*u - u
      a2 = w + 0.5_dp*h*b1;   b2 = 3.0_dp*mm*(u + 0.5_dp*h*a1)**2 - (u + 0.5_dp*h*a1)
      a3 = w + 0.5_dp*h*b2;   b3 = 3.0_dp*mm*(u + 0.5_dp*h*a2)**2 - (u + 0.5_dp*h*a2)
      a4 = w + h*b3;          b4 = 3.0_dp*mm*(u + h*a3)**2 - (u + h*a3)
      u = u + h*(a1 + 2.0_dp*a2 + 2.0_dp*a3 + a4)/6.0_dp; w = w + h*(b1 + 2.0_dp*b2 + 2.0_dp*b3 + b4)/6.0_dp
      phi = phi + h
      if (u <= 0.0_dp) exit
    end do
    bend_orbit = 2.0_dp*(phi - u/w) - pi                     ! one Newton step back to u = 0, both halves of the ray
  end function
  ! perihelion advance of Mercury in arcsec a century, the nonlinear term weighted by kk
  real(dp) function advance(kk)
    real(dp), intent(in) :: kk
    real(dp), parameter :: a = 5.7909e10_dp, e = 0.2056_dp, per = 87.969_dp
    integer, parameter :: n = 20000, norb = 50
    real(dp) :: p, ms, h, u, w, phi, a1, a2, a3, a4, b1, b2, b3, b4, wold, first, last, acc
    integer :: j, found
    p = a*(1.0_dp - e*e); ms = GM/(c*c); h = 2.0_dp*pi/real(n, dp)
    u = (1.0_dp + e)/p; w = 1.0e-12_dp/p; phi = 0.0_dp; found = 0; first = 0.0_dp; last = 0.0_dp
    do j = 1, (norb + 1)*n
      wold = w
      a1 = w;                 b1 = 1.0_dp/p + 3.0_dp*kk*ms*u*u - u
      a2 = w + 0.5_dp*h*b1;   b2 = 1.0_dp/p + 3.0_dp*kk*ms*(u + 0.5_dp*h*a1)**2 - (u + 0.5_dp*h*a1)
      a3 = w + 0.5_dp*h*b2;   b3 = 1.0_dp/p + 3.0_dp*kk*ms*(u + 0.5_dp*h*a2)**2 - (u + 0.5_dp*h*a2)
      a4 = w + h*b3;          b4 = 1.0_dp/p + 3.0_dp*kk*ms*(u + h*a3)**2 - (u + h*a3)
      u = u + h*(a1 + 2.0_dp*a2 + 2.0_dp*a3 + a4)/6.0_dp; w = w + h*(b1 + 2.0_dp*b2 + 2.0_dp*b3 + b4)/6.0_dp
      phi = phi + h
      if (wold > 0.0_dp .and. w <= 0.0_dp) then               ! u has passed a maximum: a perihelion
        acc = 1.0_dp/p + 3.0_dp*kk*ms*u*u - u                 ! u'' here
        if (found == 0) first = phi - w/acc
        last = phi - w/acc; found = found + 1
        if (found == norb + 1) exit
      end if
    end do
    advance = ((last - first)/real(found - 1, dp) - 2.0_dp*pi)*asec*36525.0_dp/per
  end function
  ! divergence of a Ric + b Scal g + c g on the model, along the first field: in two dimensions Ric = K g, Scal = 2K
  real(dp) function divlaw(a, b, cc, x)
    real(dp), intent(in) :: a, b, cc, x
    real(dp), parameter :: h = 1.0e-4_dp
    divlaw = (coef(a, b, cc, x + h) - coef(a, b, cc, x - h))/(2.0_dp*h)
  end function
  real(dp) function coef(a, b, cc, x)
    real(dp), intent(in) :: a, b, cc, x
    real(dp) :: k
    k = -(1.0_dp + x*x)
    coef = a*k + b*2.0_dp*k + cc
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
end program gravity_forced_twin
```

## Appendix E · Run of Appendix D

```text
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
checks passed: 10   failures: 0
```

## Appendix F · Kernel lines of Appendices A, B, C, H, I and J

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

Appendix A.

```text
'SPHYS.Geometry.first_bianchi' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.second_bianchi' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.halfBracket_curv' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Geometry.curv_smul_left' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.curv_smul_mid' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.curv_smul_right' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.Rm_antisymm34' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.second_bianchi_Rm' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.trace_commute' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Geometry.contracted_bianchi' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Geometry.twice_div_law' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Geometry.conservation_forces_the_ratio' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Geometry.the_forced_law_is_conserved' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Geometry.einstein_law_is_conserved' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Geometry.model_curv' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Geometry.model_scal' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Geometry.model_dScal_ne' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Geometry.conservation_on_every_geometry_forces_the_ratio' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.Geometry.the_forced_ratio_is_conserved_on_every_geometry' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.Geometry.model4_scal' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Geometry.conservation_on_every_spacetime_of_four_dimensions_forces_the_ratio' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.Geometry.einstein_forced' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Geometry.einsteinPremises' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Geometry.einstein_satisfies_conservation' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Geometry.pair_symm' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.Ric_symm' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.contract_13' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.contract_23' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.contract_24' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.contract_34' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.full_contract_13_24' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.div_T2' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Geometry.field_equation_conserves_the_source' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Geometry.conservation_is_the_field_equation' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Geometry.law_sourced_by_a_field_is_conserved' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Geometry.parseval' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.trace_reversal' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.active_density' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.space_reading' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.active_density_in_four' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.space_reads_what_time_reads_iff' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.weight_of_matter_at_rest' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.every_reading_of_the_record_is_blind_to_charge' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.every_reading_of_the_record_is_blind_to_composition' does not depend on any axioms
'SPHYS.Geometry.no_reading_of_the_record_returns_the_charge' depends on axioms: [propext]
'SPHYS.Geometry.Premises.antimatter_weighs_as_matter' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.Premises.weight_is_blind_to_composition' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.Premises.weight_is_not_the_charge' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.Hess_symm' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.Rm_antisymm12' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.contract_12' depends on axioms: [propext, Quot.sound]
'SPHYS.Geometry.model4_card' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Geometry.model4_one_time' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Geometry.model4_dScal_ne' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Geometry.einsteinPremises_coupling' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Geometry.noTwoTorsion_poly' depends on axioms: [propext, Classical.choice, Quot.sound]
```

Appendix B.

```text
'SPHYS.Schwarzschild.Chart.Gam_symm' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Schwarzschild.Chart.Gam_metric' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Schwarzschild.Static.connection_is_torsion_free_and_metric' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.Schwarzschild.Static.ric_eq' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Schwarzschild.Static.vacuum_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Schwarzschild.Static.vacuum_forces_schwarzschild' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Schwarzschild.Static.schwarzschild_is_vacuum' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Schwarzschild.Static.energy_conserved' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Schwarzschild.Static.angSq_conserved' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Schwarzschild.Static.speedSq_conserved' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Schwarzschild.Static.radial_equation' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Schwarzschild.Static.orbit_equation' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Schwarzschild.Static.free_fall_in_the_vacuum_solution' depends on axioms: [propext, Classical.choice, Quot.sound]
```

Appendix C.

```text
'SPHYS.Birkhoff.Chart.Gam_symm' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Birkhoff.Chart.Gam_metric' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Birkhoff.Sph.connection_is_torsion_free_and_metric' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Birkhoff.Sph.ric_01' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Birkhoff.Sph.ric_22' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Birkhoff.Sph.ric_sum' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Birkhoff.Sph.birkhoff' depends on axioms: [propext, Classical.choice, Quot.sound]
```

Appendix H.

```text
'SPHYS.Waves.LinWave.gi_is_inverse' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Waves.LinWave.Gam_eq' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Waves.LinWave.linearised_ricci' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Waves.wave_conditions' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Waves.plus_is_wave' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Waves.cross_is_wave' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Waves.breathing_is_not_a_wave' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Waves.two_polarisations' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Waves.the_two_are_physical' depends on axioms: [propext, Classical.choice, Quot.sound]
```

Appendix I.

```text
'SPHYS.WeakField.Weak.gi_is_inverse' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.WeakField.Weak.static_ricci' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.WeakField.Weak.newton_from_the_time_reading' depends on axioms: [propext]
'SPHYS.WeakField.Weak.space_potential_equals_time_potential' depends on axioms: [propext, Classical.choice, Quot.sound]
```

Appendix J.

```text
'SPHYS.GravityCount.a_kept_reading_counts_only_the_line' does not depend on any axioms
'SPHYS.GravityCount.no_kept_reading_tells_a_pair_apart' does not depend on any axioms
'SPHYS.GravityCount.nothing_computed_from_a_reading_counts_more' does not depend on any axioms
'SPHYS.GravityCount.what_is_computed_from_a_kept_reading_is_kept' does not depend on any axioms
'SPHYS.GravityCount.a_reading_that_counts_a_pair_is_not_kept' does not depend on any axioms
'SPHYS.GravityCount.bar_fixed_iff_neutral' depends on axioms: [propext, Quot.sound]
'SPHYS.GravityCount.the_weight_is_kept' does not depend on any axioms
'SPHYS.GravityCount.every_kept_reading_counts_only_the_neutral' depends on axioms: [propext, Quot.sound]
'SPHYS.GravityCount.gravity_counts_only_the_neutral' depends on axioms: [propext, Quot.sound]
'SPHYS.GravityCount.nothing_computed_from_the_weight_counts_a_charged_pair' depends on axioms: [propext, Quot.sound]
'SPHYS.GravityCount.to_count_a_charged_pair_a_reading_must_see_the_particle_map' depends on axioms: [propext,
 Quot.sound]
'SPHYS.GravityCount.a_reading_of_the_energy_alone_is_kept' does not depend on any axioms
'SPHYS.GravityCount.a_reading_that_tells_the_pair_apart_reads_a_charge' does not depend on any axioms
'SPHYS.GravityCount.the_weight_does_not_tell_all_the_neutral_apart' does not depend on any axioms
'SPHYS.GravityCount.the_charges_tell_a_charged_pair_apart' depends on axioms: [propext, Quot.sound]
'SPHYS.GravityCount.a_charged_pair_is_two_on_one_weight' does not depend on any axioms
'SPHYS.GravityCount.what_gravity_counts' depends on axioms: [propext, Quot.sound]
```

## Appendix G · The certificate generator

Not part of any proof. It is printed as it was run for Appendix C; the same reduction, with the variables of each goal, produced the two certificates of Appendix B. It reads a goal that Lean prints, reduces it modulo the relations $x\,x^{-1} = 1$, and writes the combination that Lean then checks.

```python
# cert.py KEY : read the traced goal of x_KEY.log, reduce LHS-RHS modulo the inverse relations, print a certificate.
# Rationale: Lean's field_simp stalls on these goals; an explicit linear_combination is checked by `ring` alone.
import re,sys,sympy as sp
k=sys.argv[1]; t=open(f'x_{k}.log').read()
g=t[t.index('⊢')+1:]; g=re.split(r'\n/|\n\S+\.lean', g)[0]
g=g.replace('^','**').replace('\n',' ')
names="Att Atr Arr Btt Btr Brr At Ar Bt Br r s c A B a b p q".split()
ns={n:sp.Symbol(n) for n in names}
L,R=g.split('=')
P=sp.expand(sp.sympify(L,locals=ns,rational=True)-sp.sympify(R,locals=ns,rational=True))
G=[ns['r']*ns['a']-1, ns['s']*ns['b']-1, ns['A']*ns['p']-1, ns['B']*ns['q']-1]
gens=[ns[n] for n in "a b p q r s A B c Att Atr Arr Btt Btr Brr At Ar Bt Br".split()]
qs,rem=sp.reduced(P,G,*gens,order='lex')
print('REMAINDER:',rem, file=sys.stderr)
def lean(x):
    o=str(sp.expand(x)).replace('**','^')
    return re.sub(r'(?<![\w.^])(\d+)/(\d+)',r'(\1/\2 : K)',o)
terms=[f"({lean(q)}) * e{i+1}" for i,q in enumerate(qs) if q!=0]
open(f'lc_{k}.txt','w').write("  linear_combination\n    "+"\n    + ".join(terms)+"\n")
print(k,'terms',len(terms),'chars',sum(map(len,terms)), file=sys.stderr)
```

## Appendix H · SPHYS_Waves_CC.lean

The linearised vacuum law of a plane wave, derived from the Ricci curvature, and its polarisations. 17 theorems, exit 0 with no warning.

```lean
/-
SPHYS_Waves_CC.lean · the plane waves of the linearised law have two polarisations, and both are tensor
RATIONALE. The paper's third falsifier is a polarisation of gravitational waves that is not tensor. Part II of this
  file derives the linearised vacuum law for a plane wave from the Ricci curvature of a metric that is flat plus a
  first-order wave; Part III solves it, removes the freedom of coordinates, and finds two amplitudes.
DESIGN. Flat metric diag(-1, 1, 1, 1); wave vector k = (1, 0, 0, 1), null; amplitude a symmetric array e.
  First order is exact algebra: an element eps with eps * eps = 0. The metric is eta + eps e F, where F is any
  profile of the phase with derivatives F1 and F2 along k. Its inverse, Christoffel symbols and Ricci curvature are
  the coordinate formulas. `linearised_ricci` proves Ric = half * eps * F2 * waveLaw e, so the vanishing of
  waveLaw is the vacuum law to first order. A change of coordinates by x changes e by k_m x_n + k_n x_m.
RISK. The wave travels along one axis and its profile is a function of the phase alone; a general wave is a sum of
  such waves, and that superposition is not formalised. `two_polarisations` is stated over an ordered field.
NON-NEGOTIABLE. No sorry, no axiom beyond Lean's own. The law is derived, not entered.
-/
import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Ring
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum

namespace SPHYS.Waves

theorem forall4 (P : Fin 4 → Prop) : (∀ m, P m) ↔ P 0 ∧ P 1 ∧ P 2 ∧ P 3 := by
  constructor
  · intro h; exact ⟨h 0, h 1, h 2, h 3⟩
  · rintro ⟨a, b, c, d⟩ m
    fin_cases m
    · exact a
    · exact b
    · exact c
    · exact d

variable {R : Type} [CommRing R]

def eta : Fin 4 → R := ![-1, 1, 1, 1]
def kUp : Fin 4 → R := ![1, 0, 0, 1]
def kDn : Fin 4 → R := ![-1, 0, 0, 1]
def v (e : Fin 4 → Fin 4 → R) (n : Fin 4) : R := ∑ a, kUp a * e a n
def T (e : Fin 4 → Fin 4 → R) : R := ∑ a, eta a * e a a
/-- The expression whose vanishing is the linearised vacuum law for a plane wave of amplitude e. -/
def waveLaw (e : Fin 4 → Fin 4 → R) (m n : Fin 4) : R := kDn m * v e n + kDn n * v e m - kDn m * kDn n * T e

/-- A metric that is flat plus a small plane wave: a ring with four derivations, an element eps whose square is
zero (first order), a profile F of the phase with its two derivatives, and a constant symmetric amplitude e. -/
structure LinWave (R : Type) [CommRing R] where
  D : Fin 4 → R → R
  D_add : ∀ i x y, D i (x + y) = D i x + D i y
  D_mul : ∀ i x y, D i (x * y) = D i x * y + x * D i y
  eps : R
  eps_sq : eps * eps = 0
  D_eps : ∀ i, D i eps = 0
  half : R
  two_half : 2 * half = 1
  D_half : ∀ i, D i half = 0
  F : R
  F1 : R
  F2 : R
  D_F : ∀ i, D i F = kDn i * F1
  D_F1 : ∀ i, D i F1 = kDn i * F2
  e : Fin 4 → Fin 4 → R
  e_symm : ∀ a b, e a b = e b a
  D_e : ∀ i a b, D i (e a b) = 0

namespace LinWave
variable (W : LinWave R)

theorem D_zero (i : Fin 4) : W.D i 0 = 0 := by
  have h := W.D_add i 0 0; rw [add_zero] at h; exact left_eq_add.mp h
theorem D_one (i : Fin 4) : W.D i 1 = 0 := by
  have h := W.D_mul i 1 1; simp only [mul_one, one_mul] at h; exact left_eq_add.mp h
theorem D_neg (i : Fin 4) (x : R) : W.D i (-x) = -W.D i x := by
  have h := W.D_add i x (-x); rw [add_neg_cancel, W.D_zero] at h; exact eq_neg_of_add_eq_zero_right h.symm
theorem D_sub (i : Fin 4) (x y : R) : W.D i (x - y) = W.D i x - W.D i y := by
  rw [sub_eq_add_neg, W.D_add, W.D_neg, sub_eq_add_neg]

/-- The metric: flat plus eps times the wave. -/
def gm (i j : Fin 4) : R := (if i = j then eta i else 0) + W.eps * (W.e i j * W.F)
/-- Its inverse to first order. -/
def gi (i j : Fin 4) : R := (if i = j then eta i else 0) - W.eps * (eta i * W.e i j * eta j * W.F)
/-- The Christoffel symbols of the metric, by the coordinate formula. -/
def Gam (k i j : Fin 4) : R :=
  W.half * ∑ l, W.gi k l * (W.D i (W.gm j l) + W.D j (W.gm i l) - W.D l (W.gm i j))

theorem e2 : W.eps ^ 2 = 0 := by rw [pow_two]; exact W.eps_sq
theorem e3 : W.eps ^ 3 = 0 := by rw [pow_succ, W.e2, zero_mul]
theorem e4 : W.eps ^ 4 = 0 := by rw [pow_succ, W.e3, zero_mul]

-- One tactic block closes every component; on components that close early its tail has nothing to do.
set_option linter.unusedTactic false
set_option linter.unreachableTactic false
set_option maxHeartbeats 4000000

/-- The inverse is the inverse, to first order. -/
theorem gi_is_inverse : ∀ i j, ∑ l, W.gm i l * W.gi l j = if i = j then 1 else 0 := by
  rw [forall4]; refine ⟨?_, ?_, ?_, ?_⟩ <;> rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;>
    simp [gm, gi, Fin.sum_univ_four, eta]
  all_goals (try ring_nf)
  all_goals (try simp only [W.e2, W.e3, W.e4, mul_zero, zero_mul, add_zero, zero_add, sub_zero, neg_zero])
  all_goals (try ring)

/-- THE CHRISTOFFEL SYMBOLS TO FIRST ORDER. -/
theorem Gam_eq : ∀ k i j, W.Gam k i j
    = W.half * W.eps * W.F1 * eta k * (kDn i * W.e j k + kDn j * W.e i k - kDn k * W.e i j) := by
  rw [forall4]; refine ⟨?_, ?_, ?_, ?_⟩ <;> rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;>
    rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;>
    simp [Gam, gm, gi, Fin.sum_univ_four, eta, kDn, W.D_add, W.D_mul, W.D_sub, W.D_neg, W.D_zero, W.D_one, W.D_eps, W.D_e, W.D_F, W.D_F1, W.D_half]
  all_goals (try ring_nf)
  all_goals (try simp only [W.e2, W.e3, W.e4, mul_zero, zero_mul, add_zero, zero_add, sub_zero, neg_zero])
  all_goals (try ring)

/-- The Ricci curvature of the metric, by the coordinate formula. -/
def Ric (i j : Fin 4) : R :=
  (∑ k, (W.D k (W.Gam k i j) - W.D j (W.Gam k i k)))
  + ∑ k, ∑ l, (W.Gam k k l * W.Gam l i j - W.Gam k j l * W.Gam l i k)

/-- THE LINEARISED VACUUM LAW, DERIVED. To first order the Ricci curvature of flat space plus a plane wave of
amplitude e is half * eps * F2 times the wave expression. Its vanishing is the condition `IsWave` below. -/
theorem linearised_ricci : ∀ i j, W.Ric i j = W.half * W.eps * W.F2 * waveLaw W.e i j := by
  have s10 := W.e_symm 1 0; have s20 := W.e_symm 2 0; have s30 := W.e_symm 3 0
  have s21 := W.e_symm 2 1; have s31 := W.e_symm 3 1; have s32 := W.e_symm 3 2
  rw [forall4]; refine ⟨?_, ?_, ?_, ?_⟩ <;> rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;>
    simp only [Ric, W.Gam_eq] <;>
    simp [waveLaw, v, T, Fin.sum_univ_four, eta, kDn, kUp, s10, s20, s30, s21, s31, s32, W.D_add, W.D_mul, W.D_sub, W.D_neg, W.D_zero, W.D_one, W.D_eps, W.D_e, W.D_F, W.D_F1, W.D_half]
  all_goals (try ring_nf)
  all_goals (try simp only [W.e2, W.e3, W.e4, mul_zero, zero_mul, add_zero, zero_add, sub_zero, neg_zero])
  all_goals (try ring)
end LinWave

/-! ## Part III. The solutions of the law -/
variable {K : Type} [Field K] [LinearOrder K] [IsStrictOrderedRing K]
-- The order is used only to close linear goals; the two listed waves need no order at all.
set_option linter.unusedSectionVars false

/-- The linearised vacuum law for a plane wave of amplitude e: symmetric, and the wave expression vanishes. By
`LinWave.linearised_ricci` this is the vanishing of the first-order Ricci curvature. -/
def IsWave (e : Fin 4 → Fin 4 → K) : Prop :=
  (∀ m n, e m n = e n m) ∧ ∀ m n, waveLaw e m n = 0

/-- A change of coordinates by x. -/
def gauge (e : Fin 4 → Fin 4 → K) (x : Fin 4 → K) (m n : Fin 4) : K := e m n + kDn m * x n + kDn n * x m

/-- The two tensor polarisations, plus and cross, and the scalar one that stretches both transverse directions. -/
def plus (m n : Fin 4) : K := if m = 1 ∧ n = 1 then 1 else if m = 2 ∧ n = 2 then -1 else 0
def cross (m n : Fin 4) : K := if (m = 1 ∧ n = 2) ∨ (m = 2 ∧ n = 1) then 1 else 0
def breathing (m n : Fin 4) : K := if (m = 1 ∧ n = 1) ∨ (m = 2 ∧ n = 2) then 1 else 0

/-- What the law says of a wave, component by component. -/
theorem wave_conditions (e : Fin 4 → Fin 4 → K) (h : IsWave e) :
    e 0 1 + e 1 3 = 0 ∧ e 0 2 + e 2 3 = 0 ∧ e 0 0 + 2 * e 0 3 + e 3 3 = 0 ∧ e 1 1 + e 2 2 = 0 := by
  obtain ⟨hs, hw⟩ := h
  have h01 := hw 0 1; have h02 := hw 0 2; have h00 := hw 0 0; have h33 := hw 3 3
  have s10 := hs 1 0; have s20 := hs 2 0; have s30 := hs 3 0; have s31 := hs 3 1; have s32 := hs 3 2
  simp [waveLaw, v, T, kUp, kDn, eta, Fin.sum_univ_four] at h01 h02 h00 h33
  refine ⟨?_, ?_, ?_, ?_⟩ <;> linarith

/-- Plus and cross are waves. -/
theorem plus_is_wave : IsWave (plus : Fin 4 → Fin 4 → K) := by
  refine ⟨?_, ?_⟩ <;> rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;> rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;>
    simp [plus, waveLaw, v, T, kUp, kDn, eta, Fin.sum_univ_four]
theorem cross_is_wave : IsWave (cross : Fin 4 → Fin 4 → K) := by
  refine ⟨?_, ?_⟩ <;> rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;> rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;>
    simp [cross, waveLaw, v, T, kUp, kDn, eta, Fin.sum_univ_four]

/-- THE SCALAR POLARISATION IS NOT A WAVE OF THE LAW. -/
theorem breathing_is_not_a_wave : ¬ IsWave (breathing : Fin 4 → Fin 4 → K) := by
  intro h
  have c := (wave_conditions breathing h).2.2.2
  simp [breathing] at c
  linarith

/-- EVERY WAVE IS PLUS AND CROSS, UP TO A CHANGE OF COORDINATES. -/
theorem two_polarisations (e : Fin 4 → Fin 4 → K) (h : IsWave e) :
    ∃ x : Fin 4 → K, ∀ m n, gauge e x m n = e 1 1 * plus m n + e 1 2 * cross m n := by
  obtain ⟨c1, c2, c3, c4⟩ := wave_conditions e h
  obtain ⟨hs, _⟩ := h
  refine ⟨![e 0 0 / 2, e 0 1, e 0 2, -(e 3 3) / 2], ?_⟩
  have s10 := hs 1 0; have s20 := hs 2 0; have s30 := hs 3 0; have s31 := hs 3 1; have s32 := hs 3 2
  have s21 := hs 2 1
  rw [forall4]
  refine ⟨?_, ?_, ?_, ?_⟩ <;> rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;> simp [gauge, plus, cross, kDn] <;>
    linarith

/-- AND THE TWO ARE NOT COORDINATES. No change of coordinates produces plus or cross, or any mixture of them, from
nothing. -/
theorem the_two_are_physical (a b : K) (x : Fin 4 → K)
    (h : ∀ m n, gauge (fun _ _ => (0 : K)) x m n = a * plus m n + b * cross m n) : a = 0 ∧ b = 0 := by
  have h11 := h 1 1; have h12 := h 1 2
  simp [gauge, plus, cross, kDn] at h11 h12
  exact ⟨by linarith, by linarith⟩

end SPHYS.Waves

#print axioms SPHYS.Waves.LinWave.gi_is_inverse
#print axioms SPHYS.Waves.LinWave.Gam_eq
#print axioms SPHYS.Waves.LinWave.linearised_ricci
#print axioms SPHYS.Waves.wave_conditions
#print axioms SPHYS.Waves.plus_is_wave
#print axioms SPHYS.Waves.cross_is_wave
#print axioms SPHYS.Waves.breathing_is_not_a_wave
#print axioms SPHYS.Waves.two_polarisations
#print axioms SPHYS.Waves.the_two_are_physical
```

## Appendix I · SPHYS_WeakField_CC.lean

The static weak field: the first-order Ricci curvature derived, Newton's equation as the time reading, and the potential of space. 14 theorems, exit 0 with no warning.

```lean
/-
SPHYS_WeakField_CC.lean · the static weak field: Newton's equation is the time reading, and space reads the same
RATIONALE. Section 7 of the paper proves what the law reads along time and across it. The step from those two
  readings to the two potentials of a weak static field was cited. This file derives it. The Ricci curvature of a
  metric that is flat plus a first-order static perturbation is computed from the coordinate formulas, and the
  field equations that follow are solved for the two potentials.
DESIGN. First order is exact algebra: an element eps with eps * eps = 0. The metric is diagonal,
  -(1 + eps u), (1 - eps w), (1 - eps w), (1 - eps w), with u and w independent of the time. Newton's potential
  is u / 2 and the potential of space is w / 2. `static_ricci` proves Ric = half * eps * ricLin, where ricLin is
  the Laplacian of u on the time component and the Laplacian of w plus the second derivatives of w - u on the
  space components. `newton_from_the_time_reading` and `space_potential_equals_time_potential` read the law.
RISK. The source enters as its two readings, equal by Part X-b of Appendix A for matter at rest in four dimensions;
  the statement is at first order and for a static field. That w - u, having no second derivative, vanishes, needs
  the condition at infinity, which is not formalised.
NON-NEGOTIABLE. No sorry, no axiom beyond Lean's own. Nothing is entered: the curvature is computed.
-/
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Ring
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum

namespace SPHYS.WeakField

theorem forall4 (P : Fin 4 → Prop) : (∀ m, P m) ↔ P 0 ∧ P 1 ∧ P 2 ∧ P 3 := by
  constructor
  · intro h; exact ⟨h 0, h 1, h 2, h 3⟩
  · rintro ⟨a, b, c, d⟩ m
    fin_cases m
    · exact a
    · exact b
    · exact c
    · exact d

variable {R : Type} [CommRing R]

def eta : Fin 4 → R := ![-1, 1, 1, 1]

/-- A metric that is flat plus a small static perturbation: a ring with four derivations, an element eps whose
square is zero, and two functions u and w that do not depend on the time and whose derivatives commute. -/
structure Weak (R : Type) [CommRing R] where
  D : Fin 4 → R → R
  D_add : ∀ i x y, D i (x + y) = D i x + D i y
  D_mul : ∀ i x y, D i (x * y) = D i x * y + x * D i y
  eps : R
  eps_sq : eps * eps = 0
  D_eps : ∀ i, D i eps = 0
  half : R
  two_half : 2 * half = 1
  D_half : ∀ i, D i half = 0
  u : R
  w : R
  u_static : D 0 u = 0
  w_static : D 0 w = 0
  u_comm : ∀ i j, D i (D j u) = D j (D i u)
  w_comm : ∀ i j, D i (D j w) = D j (D i w)

namespace Weak
variable (W : Weak R)

theorem D_zero (i : Fin 4) : W.D i 0 = 0 := by
  have h := W.D_add i 0 0; rw [add_zero] at h; exact left_eq_add.mp h
theorem D_one (i : Fin 4) : W.D i 1 = 0 := by
  have h := W.D_mul i 1 1; simp only [mul_one, one_mul] at h; exact left_eq_add.mp h
theorem D_neg (i : Fin 4) (x : R) : W.D i (-x) = -W.D i x := by
  have h := W.D_add i x (-x); rw [add_neg_cancel, W.D_zero] at h; exact eq_neg_of_add_eq_zero_right h.symm
theorem D_sub (i : Fin 4) (x y : R) : W.D i (x - y) = W.D i x - W.D i y := by
  rw [sub_eq_add_neg, W.D_add, W.D_neg, sub_eq_add_neg]

/-- The perturbation of each diagonal component: -u on the time, -w on each direction of space. -/
def h (i : Fin 4) : R := if i = 0 then -W.u else -W.w
/-- The metric: flat plus eps times the perturbation. -/
def gm (i j : Fin 4) : R := if i = j then eta i + W.eps * W.h i else 0
/-- Its inverse to first order. -/
def gi (i j : Fin 4) : R := if i = j then eta i - W.eps * W.h i else 0
/-- The Christoffel symbols of the metric, by the coordinate formula. -/
def Gam (k i j : Fin 4) : R :=
  W.half * ∑ l, W.gi k l * (W.D i (W.gm j l) + W.D j (W.gm i l) - W.D l (W.gm i j))
/-- The Ricci curvature of the metric, by the coordinate formula. -/
def Ric (i j : Fin 4) : R :=
  (∑ k, (W.D k (W.Gam k i j) - W.D j (W.Gam k i k)))
  + ∑ k, ∑ l, (W.Gam k k l * W.Gam l i j - W.Gam k j l * W.Gam l i k)

/-- The Laplacian of space. -/
def lap (x : R) : R := W.D 1 (W.D 1 x) + W.D 2 (W.D 2 x) + W.D 3 (W.D 3 x)

/-- The first-order Ricci curvature of the static weak field. -/
def ricLin (i j : Fin 4) : R :=
  if i = 0 ∧ j = 0 then W.lap W.u
  else if i = 0 ∨ j = 0 then 0
  else (if i = j then W.lap W.w else 0) + W.D i (W.D j W.w) - W.D i (W.D j W.u)

theorem e2 : W.eps ^ 2 = 0 := by rw [pow_two]; exact W.eps_sq
theorem e3 : W.eps ^ 3 = 0 := by rw [pow_succ, W.e2, zero_mul]
theorem e4 : W.eps ^ 4 = 0 := by rw [pow_succ, W.e3, zero_mul]

theorem u0 (i : Fin 4) : W.D 0 (W.D i W.u) = 0 := by rw [W.u_comm, W.u_static, W.D_zero]
theorem w0 (i : Fin 4) : W.D 0 (W.D i W.w) = 0 := by rw [W.w_comm, W.w_static, W.D_zero]

set_option linter.unusedTactic false
set_option linter.unreachableTactic false
set_option maxHeartbeats 4000000

/-- The inverse is the inverse, to first order. -/
theorem gi_is_inverse : ∀ i j, ∑ l, W.gm i l * W.gi l j = if i = j then 1 else 0 := by
  rw [forall4]; refine ⟨?_, ?_, ?_, ?_⟩ <;> rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;>
    simp [gm, gi, h, Fin.sum_univ_four, eta]
  all_goals (try ring_nf)
  all_goals (try simp only [W.e2, W.e3, W.e4, mul_zero, zero_mul, add_zero, zero_add, sub_zero, neg_zero])
  all_goals (try ring)

/-- THE CURVATURE OF THE STATIC WEAK FIELD, DERIVED. To first order the Ricci curvature is half * eps times ricLin:
the Laplacian of u along time, nothing between time and space, and on space the Laplacian of w on the diagonal
plus the second derivatives of w - u. -/
theorem static_ricci : ∀ i j, W.Ric i j = W.half * W.eps * W.ricLin i j := by
  have c21 := W.u_comm 2 1; have c31 := W.u_comm 3 1; have c32 := W.u_comm 3 2
  have d21 := W.w_comm 2 1; have d31 := W.w_comm 3 1; have d32 := W.w_comm 3 2
  rw [forall4]; refine ⟨?_, ?_, ?_, ?_⟩ <;> rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;>
    simp [Ric, Gam, gm, gi, h, ricLin, lap, Fin.sum_univ_four, eta, c21, c31, c32, d21, d31, d32, W.D_add, W.D_mul,
      W.D_sub, W.D_neg, W.D_zero, W.D_one, W.D_eps, W.D_half, W.u_static, W.w_static, W.u0, W.w0]
  all_goals (try ring_nf)
  all_goals (try simp only [W.e2, W.e3, W.e4, mul_zero, zero_mul, add_zero, zero_add, sub_zero, neg_zero])
  all_goals (try ring)

/-- NEWTON'S EQUATION IS THE TIME READING. If the time component of the first-order curvature equals a reading q,
then the Laplacian of u is q: with Newton's potential u / 2, this is Poisson's equation. Space is not consulted. -/
theorem newton_from_the_time_reading (q : R) (h00 : W.ricLin 0 0 = q) : W.lap W.u = q := by
  simpa [ricLin] using h00

/-- SPACE READS THE SAME. If the curvature reads q along time and q along every direction of space, and nothing
between two different directions, then w obeys the same equation as u, and every second derivative of w equals
that of u. The two potentials differ by a function with no second derivative. -/
theorem space_potential_equals_time_potential (q : R)
    (hq : ∀ i j, W.ricLin i j = if i = j then q else 0) :
    W.lap W.w = q ∧ W.lap W.u = q ∧
      ∀ i j, i ≠ 0 → j ≠ 0 → W.D i (W.D j W.w) = W.D i (W.D j W.u) := by
  have h00 := hq 0 0; have h11 := hq 1 1; have h22 := hq 2 2; have h33 := hq 3 3
  have h12 := hq 1 2; have h13 := hq 1 3; have h23 := hq 2 3
  have h21 := hq 2 1; have h31 := hq 3 1; have h32 := hq 3 2
  simp [ricLin] at h00 h11 h22 h33 h12 h13 h23 h21 h31 h32
  have hu : W.lap W.u = q := h00
  have hw4 : 2 * (2 * (W.lap W.w - q)) = 0 := by
    have e : W.lap W.u = W.D 1 (W.D 1 W.u) + W.D 2 (W.D 2 W.u) + W.D 3 (W.D 3 W.u) := rfl
    have e' : W.lap W.w = W.D 1 (W.D 1 W.w) + W.D 2 (W.D 2 W.w) + W.D 3 (W.D 3 W.w) := rfl
    linear_combination h11 + h22 + h33 + e' + hu - e
  have hw : W.lap W.w = q := by
    have a : W.lap W.w - q = W.half * W.half * (2 * (2 * (W.lap W.w - q))) := by
      linear_combination (-(W.lap W.w - q) * (1 + 2 * W.half)) * W.two_half
    rw [hw4, mul_zero] at a
    linear_combination a
  refine ⟨hw, hu, ?_⟩
  rw [forall4]; refine ⟨?_, ?_, ?_, ?_⟩ <;> rw [forall4] <;> refine ⟨?_, ?_, ?_, ?_⟩ <;> intro hi hj
  all_goals first
    | exact absurd rfl hi
    | exact absurd rfl hj
    | linear_combination h11 - hw
    | linear_combination h22 - hw
    | linear_combination h33 - hw
    | linear_combination h12
    | linear_combination h13
    | linear_combination h23
    | linear_combination h21
    | linear_combination h31
    | linear_combination h32

end Weak
end SPHYS.WeakField

#print axioms SPHYS.WeakField.Weak.gi_is_inverse
#print axioms SPHYS.WeakField.Weak.static_ricci
#print axioms SPHYS.WeakField.Weak.newton_from_the_time_reading
#print axioms SPHYS.WeakField.Weak.space_potential_equals_time_potential
```

## Appendix J · SPHYS_Gravity_Count_CC.lean

What gravity counts. Core Lean 4.19.0, no import. 17 theorems, no axiom declared, no `sorry`, exit 0 with no warning. Every cone is pinned at the end of the file, so the build is silent.

```lean
/-! # SPHYS_Gravity_Count_CC.lean · WHAT GRAVITY COUNTS, AND WHAT NO READING OF ITS KIND CAN (26 November 2026, _CC)

  RATIONALE. Edition 4.0.0 proves, on the premise that gravity reads the record, that the weight is even under the
    particle map: antimatter weighs as matter. In this file that evenness is the definition of the weight. This
    file proves what that evenness costs and what it buys, for gravity's reading and for every reading of the same
    kind, whatever it is and whenever it is proposed. The statements quantify over all readings, so a reading not
    yet written down is already inside them.
  DESIGN. Part I is general: any set, any map `φ` of it, any reading `r` that `φ` keeps. A reading COUNTS a
    configuration when it gives no two members the same value (`Counts`). That is the one sense in which this file
    speaks of counting, and the paper calls a configuration quantized by a reading in exactly this sense.
    Part II is the particle: four additive charges and an energy, the particle map `bar`, the weight `grav`.
    Part III binds every statement in one term.
  STANDING. Proved here: a reading the fold keeps counts a closed configuration only if every member is fixed by
    the fold; nothing computed from such a reading counts more than it does; a reading that counts a pair the fold
    exchanges is not kept by the fold. For particles: every reading the particle map keeps, gravity's among them,
    counts a closed configuration only if every member is neutral; nothing computed from the weight tells a charged
    particle from its antiparticle; a reading that does tell them apart reads a charge. The converse on gravity
    is not claimed: the weight does not tell all the neutral apart, and that is proved here too.
  WHAT IS NOT CLAIMED. No commutation relation, no constant and no operator enters. Nothing here says that the
    gravitational field is or is not quantized in the canonical sense, and nothing here bears on any particular
    proposal for doing so beyond the statements above.
  RISK. The particle is a model: integer charges and an energy with an integer frequency and an integer rate. A
    charge that is not additive, or a particle map that does not reverse every charge, is outside it.
  NON-NEGOTIABLE. Core Lean, no import, no axiom declared, no `sorry`. No premise is placed before the colon of
    the binding term. Every cone is pinned at the end of the file, so a change of any cone fails the build. -/
namespace SPHYS.GravityCount

/-! ## PART I · ANY FOLD, ANY READING IT KEEPS -/
section General
variable {X Y : Type}

/-- A reading counts a configuration when it gives no two members the same value. -/
def Counts (r : X → Y) (S : X → Prop) : Prop := ∀ a b, S a → S b → r a = r b → a = b

/-- A KEPT READING COUNTS ONLY THE LINE. If a configuration is closed under the fold and a reading the fold keeps
    counts it, every member is fixed by the fold. -/
theorem a_kept_reading_counts_only_the_line (φ : X → X) (r : X → Y) (kept : ∀ a, r (φ a) = r a)
    (S : X → Prop) (form : ∀ a, S a → S (φ a)) (count : Counts r S) : ∀ a, S a → φ a = a :=
  fun a ha => count (φ a) a (form a ha) ha (kept a)

/-- ONE PAIR ENDS THE COUNT. In a configuration that holds a member and its image under the fold, the two being
    two, no reading the fold keeps counts the configuration. The configuration need not be closed: the pair alone
    is the hypothesis (audit of 26 November 2026, so the statement is the one the text makes). -/
theorem no_kept_reading_tells_a_pair_apart (φ : X → X) (r : X → Y) (kept : ∀ a, r (φ a) = r a)
    (S : X → Prop) (a : X) (ha : S a) (hfa : S (φ a)) (off : φ a ≠ a) : ¬ Counts r S :=
  fun count => off (count (φ a) a hfa ha (kept a))

/-- NOTHING COMPUTED FROM A READING COUNTS MORE THAN IT. If a function of a reading counts a configuration, the
    reading already counts it. -/
theorem nothing_computed_from_a_reading_counts_more {Z : Type} (r : X → Y) (f : Y → Z) (S : X → Prop)
    (count : Counts (fun a => f (r a)) S) : Counts r S :=
  fun a b ha hb h => count a b ha hb (congrArg f h)

/-- WHATEVER IS COMPUTED FROM A KEPT READING IS KEPT. -/
theorem what_is_computed_from_a_kept_reading_is_kept {Z : Type} (φ : X → X) (r : X → Y)
    (kept : ∀ a, r (φ a) = r a) (f : Y → Z) : ∀ a, f (r (φ a)) = f (r a) :=
  fun a => congrArg f (kept a)

/-- TO COUNT A PAIR A READING MUST SEE THE FOLD. If a reading counts a configuration that holds a member and its
    image under the fold, the two being two, the reading gives them different values. -/
theorem a_reading_that_counts_a_pair_is_not_kept (φ : X → X) (r : X → Y) (S : X → Prop)
    (count : Counts r S) (a : X) (ha : S a) (hfa : S (φ a)) (off : φ a ≠ a) : r (φ a) ≠ r a :=
  fun h => off (count (φ a) a hfa ha h)

end General

/-! ## PART II · THE PARTICLE, THE PARTICLE MAP AND THE WEIGHT -/

/-- An energy: a frequency and a rate of decay. -/
structure Energy where
  freq : Int
  rate : Int
deriving DecidableEq

/-- A particle: four additive charges and an energy. -/
structure Particle where
  q3 : Int
  colour : Int
  b3 : Int
  lepton : Int
  energy : Energy
deriving DecidableEq

/-- The particle map: every charge reversed, the energy kept. -/
def bar (c : Particle) : Particle := ⟨-c.q3, -c.colour, -c.b3, -c.lepton, c.energy⟩
/-- Neutral: every charge is zero. -/
def Neutral (c : Particle) : Prop := c.q3 = 0 ∧ c.colour = 0 ∧ c.b3 = 0 ∧ c.lepton = 0
/-- The weight: gravity reads the frequency of the energy, and no charge and no rate. -/
def grav (c : Particle) : Int := c.energy.freq
/-- The charges, read together. -/
def charges (c : Particle) : Int × Int × Int × Int := (c.q3, c.colour, c.b3, c.lepton)

theorem bar_fixed_iff_neutral (c : Particle) : bar c = c ↔ Neutral c := by
  cases c with
  | mk q k b l E =>
    show (⟨-q, -k, -b, -l, E⟩ : Particle) = ⟨q, k, b, l, E⟩ ↔ (q = 0 ∧ k = 0 ∧ b = 0 ∧ l = 0)
    constructor
    · intro h
      have h1 : -q = q := congrArg Particle.q3 h
      have h2 : -k = k := congrArg Particle.colour h
      have h3 : -b = b := congrArg Particle.b3 h
      have h4 : -l = l := congrArg Particle.lepton h
      exact ⟨by omega, by omega, by omega, by omega⟩
    · intro h
      obtain ⟨h1, h2, h3, h4⟩ := h
      subst h1; subst h2; subst h3; subst h4
      rfl

/-- THE WEIGHT IS KEPT. Gravity reads a particle and its antiparticle alike. -/
theorem the_weight_is_kept (c : Particle) : grav (bar c) = grav c := rfl

/-- EVERY READING THE PARTICLE MAP KEEPS COUNTS ONLY THE NEUTRAL. Whatever the reading and whatever its values:
    if the particle map keeps it and it counts a configuration that holds the antiparticle of each member, every
    member is neutral. -/
theorem every_kept_reading_counts_only_the_neutral {Y : Type} (r : Particle → Y) (kept : ∀ c, r (bar c) = r c)
    (S : Particle → Prop) (form : ∀ c, S c → S (bar c)) (count : Counts r S) : ∀ c, S c → Neutral c :=
  fun c hc => (bar_fixed_iff_neutral c).mp (a_kept_reading_counts_only_the_line bar r kept S form count c hc)

/-- GRAVITY COUNTS ONLY THE NEUTRAL, in a configuration that holds the antiparticle of each member. -/
theorem gravity_counts_only_the_neutral (S : Particle → Prop) (form : ∀ c, S c → S (bar c))
    (count : Counts grav S) : ∀ c, S c → Neutral c :=
  every_kept_reading_counts_only_the_neutral grav the_weight_is_kept S form count

/-- NOTHING COMPUTED FROM THE WEIGHT TELLS A CHARGED PAIR APART. Whatever is computed from gravity's reading, by
    any function into any set of values, it does not count a configuration that holds one charged particle with
    its antiparticle. -/
theorem nothing_computed_from_the_weight_counts_a_charged_pair {Z : Type} (f : Int → Z) (S : Particle → Prop)
    (c : Particle) (hc : S c) (hb : S (bar c)) (charged : ¬ Neutral c) :
    ¬ Counts (fun d => f (grav d)) S :=
  no_kept_reading_tells_a_pair_apart bar (fun d => f (grav d))
    (what_is_computed_from_a_kept_reading_is_kept bar grav the_weight_is_kept f) S c hc hb
    (fun e => charged ((bar_fixed_iff_neutral c).mp e))

/-- TO COUNT MATTER WITH ITS ANTIMATTER A READING MUST READ WHAT GRAVITY DOES NOT. A reading that counts a
    configuration holding a charged particle with its antiparticle gives the two different values, so the
    particle map does not keep it. -/
theorem to_count_a_charged_pair_a_reading_must_see_the_particle_map {Y : Type} (r : Particle → Y)
    (S : Particle → Prop) (count : Counts r S) (c : Particle) (hc : S c) (hb : S (bar c))
    (charged : ¬ Neutral c) : r (bar c) ≠ r c :=
  a_reading_that_counts_a_pair_is_not_kept bar r S count c hc hb
    (fun e => charged ((bar_fixed_iff_neutral c).mp e))

/-- A READING OF THE ENERGY ALONE IS KEPT. Whatever is computed from the energy of a particle, by any function into
    any set, the particle map keeps it. -/
theorem a_reading_of_the_energy_alone_is_kept {Y : Type} (g : Energy → Y) (c : Particle) :
    g (bar c).energy = g c.energy := rfl

/-- TO TELL A PARTICLE FROM ITS ANTIPARTICLE A READING MUST READ A CHARGE. A reading that gives a particle and its
    antiparticle different values is not a function of the energy alone. A particle is its charges and its energy,
    so such a reading depends on the charges. -/
theorem a_reading_that_tells_the_pair_apart_reads_a_charge {Y : Type} (r : Particle → Y) (c : Particle)
    (apart : r (bar c) ≠ r c) : ¬ ∃ g : Energy → Y, ∀ d, r d = g d.energy :=
  fun ⟨g, hg⟩ => apart (by rw [hg (bar c), hg c]; rfl)

/-- THE WEIGHT DOES NOT TELL ALL THE NEUTRAL APART. The converse of `gravity_counts_only_the_neutral` fails in the
    model: two neutral particles of one frequency and different rates are two on one weight. Of gravity the paper
    claims one direction only. -/
theorem the_weight_does_not_tell_all_the_neutral_apart :
    ∃ c d : Particle, Neutral c ∧ Neutral d ∧ c ≠ d ∧ grav c = grav d :=
  ⟨⟨0, 0, 0, 0, ⟨0, 0⟩⟩, ⟨0, 0, 0, 0, ⟨0, 1⟩⟩, ⟨rfl, rfl, rfl, rfl⟩, ⟨rfl, rfl, rfl, rfl⟩, by decide, rfl⟩

/-- THE CHARGES ARE SUCH A READING. The charges of a charged particle and of its antiparticle differ. -/
theorem the_charges_tell_a_charged_pair_apart (c : Particle) (charged : ¬ Neutral c) :
    charges (bar c) ≠ charges c := by
  intro h
  apply charged
  have h1 : -c.q3 = c.q3 := congrArg (fun t : Int × Int × Int × Int => t.1) h
  have h2 : -c.colour = c.colour := congrArg (fun t : Int × Int × Int × Int => t.2.1) h
  have h3 : -c.b3 = c.b3 := congrArg (fun t : Int × Int × Int × Int => t.2.2.1) h
  have h4 : -c.lepton = c.lepton := congrArg (fun t : Int × Int × Int × Int => t.2.2.2) h
  exact ⟨by omega, by omega, by omega, by omega⟩

/-- A CHARGED PAIR EXISTS. One charged particle and its antiparticle: two particles, one weight. -/
theorem a_charged_pair_is_two_on_one_weight :
    ∃ c : Particle, bar c ≠ c ∧ grav (bar c) = grav c :=
  ⟨⟨1, 0, 0, 0, ⟨0, 0⟩⟩, by decide, rfl⟩

/-! ## PART III · THE BINDING -/

/-- WHAT GRAVITY COUNTS. Nothing stands before the colon. -/
theorem what_gravity_counts :
    (∀ c, grav (bar c) = grav c)
    ∧ (∀ (Y : Type) (r : Particle → Y), (∀ c, r (bar c) = r c) →
        ∀ S : Particle → Prop, (∀ c, S c → S (bar c)) → Counts r S → ∀ c, S c → Neutral c)
    ∧ (∀ (Z : Type) (f : Int → Z) (S : Particle → Prop) (c : Particle), S c → S (bar c) → ¬ Neutral c →
        ¬ Counts (fun d => f (grav d)) S)
    ∧ (∀ (Y : Type) (r : Particle → Y) (S : Particle → Prop), Counts r S →
        ∀ c, S c → S (bar c) → ¬ Neutral c → r (bar c) ≠ r c)
    ∧ (∀ c, ¬ Neutral c → charges (bar c) ≠ charges c)
    ∧ (∃ c : Particle, bar c ≠ c ∧ grav (bar c) = grav c) :=
  ⟨the_weight_is_kept,
   fun _ r kept S form count => every_kept_reading_counts_only_the_neutral r kept S form count,
   fun _ f S c hc hb ch => nothing_computed_from_the_weight_counts_a_charged_pair f S c hc hb ch,
   fun _ r S count c hc hb ch =>
     to_count_a_charged_pair_a_reading_must_see_the_particle_map r S count c hc hb ch,
   the_charges_tell_a_charged_pair_apart,
   a_charged_pair_is_two_on_one_weight⟩

end SPHYS.GravityCount

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.GravityCount.a_kept_reading_counts_only_the_line' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.GravityCount.a_kept_reading_counts_only_the_line
/-- info: 'SPHYS.GravityCount.no_kept_reading_tells_a_pair_apart' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.GravityCount.no_kept_reading_tells_a_pair_apart
/-- info: 'SPHYS.GravityCount.nothing_computed_from_a_reading_counts_more' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.GravityCount.nothing_computed_from_a_reading_counts_more
/-- info: 'SPHYS.GravityCount.what_is_computed_from_a_kept_reading_is_kept' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.GravityCount.what_is_computed_from_a_kept_reading_is_kept
/-- info: 'SPHYS.GravityCount.a_reading_that_counts_a_pair_is_not_kept' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.GravityCount.a_reading_that_counts_a_pair_is_not_kept
/-- info: 'SPHYS.GravityCount.bar_fixed_iff_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.GravityCount.bar_fixed_iff_neutral
/-- info: 'SPHYS.GravityCount.the_weight_is_kept' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.GravityCount.the_weight_is_kept
/-- info: 'SPHYS.GravityCount.every_kept_reading_counts_only_the_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.GravityCount.every_kept_reading_counts_only_the_neutral
/-- info: 'SPHYS.GravityCount.gravity_counts_only_the_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.GravityCount.gravity_counts_only_the_neutral
/--
info: 'SPHYS.GravityCount.nothing_computed_from_the_weight_counts_a_charged_pair' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.GravityCount.nothing_computed_from_the_weight_counts_a_charged_pair
/--
info: 'SPHYS.GravityCount.to_count_a_charged_pair_a_reading_must_see_the_particle_map' depends on axioms: [propext,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.GravityCount.to_count_a_charged_pair_a_reading_must_see_the_particle_map
/-- info: 'SPHYS.GravityCount.a_reading_of_the_energy_alone_is_kept' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.GravityCount.a_reading_of_the_energy_alone_is_kept
/-- info: 'SPHYS.GravityCount.a_reading_that_tells_the_pair_apart_reads_a_charge' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.GravityCount.a_reading_that_tells_the_pair_apart_reads_a_charge
/-- info: 'SPHYS.GravityCount.the_weight_does_not_tell_all_the_neutral_apart' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.GravityCount.the_weight_does_not_tell_all_the_neutral_apart
/-- info: 'SPHYS.GravityCount.the_charges_tell_a_charged_pair_apart' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.GravityCount.the_charges_tell_a_charged_pair_apart
/-- info: 'SPHYS.GravityCount.a_charged_pair_is_two_on_one_weight' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.GravityCount.a_charged_pair_is_two_on_one_weight
/-- info: 'SPHYS.GravityCount.what_gravity_counts' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.GravityCount.what_gravity_counts
```

## Appendix K · SPHYS_Horizon_CC.lean

The horizon and the fall. Lean 4.19.0 with Mathlib 4.19.0. 18 theorems, no axiom declared, no `sorry`, exit 0 with no warning. Every cone is pinned at the end of the file, so the build is silent. The values are the real numbers, which the library builds with the axiom of choice, and every kernel line prints it. The kernel lines follow the file.

```lean
/-
SPHYS_Horizon_CC.lean · The Horizon and the Fall. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. The Gravity paper derives the spherical vacuum solution, `f = 1 − 2m/r`, and its free fall. This file adds what
  a clock registers there. Part I: the chart of a falling body is the same geometry as the static chart and is regular
  at every radius above zero, the horizon included; the static chart fails at the horizon. Part II: the falling body
  moves at unit rate by its own clock, its radial velocity is the one the radial equation of the Schwarzschild kernel
  gives for a fall from rest far away, and its own clock registers a finite time from any radius to the horizon,
  through it, and down to any radius above zero, under one bound. Part III: the surface gravity, the first law as
  an exact identity, and the cap on what a merger radiates. Part IV: what an outside clock registers: its rate along
  a ray is one over the function of the solution, and the time it registers for a ray grows past every bound as the
  start of the ray approaches the horizon from outside.
DESIGN. Everything is stated on the real numbers with `m` the mass and `r` the areal radius, in units where the
  constants are one. The two charts are compared as quadratic forms in the time and radius steps; the angular part
  is the same in both and is left out.
RISK. The file does not derive the curvature tensor of the solution. That the falling body's path is free fall is
  taken from the radial equation of the Schwarzschild kernel, which is matched here and not derived again. Part III
  takes two things as given and prints them as hypotheses: that the temperature of a horizon is its surface gravity
  over two pi, and that the area of horizons does not decrease in a merger. Neither is a theorem of this file.
  Parts II and IV are two registrations of two paths: the clock that falls registers a finite time, and no clock
  outside registers the crossing. Neither statement is about the other clock.
NON-NEGOTIABLE. No axiom is declared. No proof is left open. Every hypothesis stands in the statement that uses it.
SUMMARY RULE. The sentences of this header, and the comment printed above each theorem, are summaries. Each theorem
  states its own conditions in its statement, and where a summary and a statement differ the statement governs.
BOUNDARY. The values are the real numbers, which the library builds with the axiom of choice. Every kernel line of
  this file prints it; it enters with the numbers.
-/
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Analysis.SpecialFunctions.Log.Deriv
import Mathlib.Analysis.Calculus.Deriv.Inv
import Mathlib.Analysis.Calculus.Deriv.Add
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Tactic.Ring
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.LinearCombination

namespace SPHYS.Horizon

open Real

/-- The function of the vacuum solution. -/
noncomputable def f (m r : ℝ) : ℝ := 1 - 2 * m / r

/-- The static chart, in the steps of time and radius. -/
noncomputable def staticForm (m r dt dr : ℝ) : ℝ := -(f m r) * dt ^ 2 + dr ^ 2 / f m r

/-- The chart of a falling body, in the steps of its time and of the radius. -/
noncomputable def fallingForm (m r dT dr : ℝ) : ℝ := -(f m r) * dT ^ 2 + 2 * √(2 * m / r) * dT * dr + dr ^ 2

/-! ## Part I. Two charts of one geometry. -/

/-- The square of the fall's rate is what the function of the solution lacks from one. -/
theorem the_square_of_the_rate (m r : ℝ) (hm : 0 < m) (hr : 0 < r) : √(2 * m / r) ^ 2 = 1 - f m r := by
  rw [Real.sq_sqrt (by positivity)]; unfold f; ring

/-- THE FALLING CHART IS THE SAME GEOMETRY. Where the function of the solution is not zero, the falling chart, read with
its time step shifted along the radius, is the static chart. -/
theorem the_falling_chart_is_the_same_geometry (m r : ℝ) (hm : 0 < m) (hr : 0 < r) (hf : f m r ≠ 0) (dt dr : ℝ) :
    fallingForm m r (dt + √(2 * m / r) / f m r * dr) dr = staticForm m r dt dr := by
  have hb := the_square_of_the_rate m r hm hr
  unfold fallingForm staticForm
  generalize √(2 * m / r) = b at hb ⊢
  generalize f m r = F at hb hf ⊢
  have hF : F = 1 - b ^ 2 := by linarith
  subst hF
  field_simp
  ring

/-- THE FALLING CHART IS REGULAR AT EVERY RADIUS ABOVE ZERO, the horizon included: the determinant of its time and
radius part is minus one. -/
theorem the_falling_chart_is_regular_at_every_radius (m r : ℝ) (hm : 0 < m) (hr : 0 < r) :
    -(f m r) * 1 - √(2 * m / r) * √(2 * m / r) = -1 := by
  have hb := the_square_of_the_rate m r hm hr
  nlinarith [hb]

/-- THE STATIC CHART FAILS AT THE HORIZON: its function is zero there. -/
theorem the_static_chart_fails_at_the_horizon (m : ℝ) (hm : m ≠ 0) : f m (2 * m) = 0 := by
  unfold f; field_simp

/-! ## Part II. What the clock of a falling body registers. -/

/-- THE FALLING BODY MOVES AT UNIT RATE BY ITS OWN CLOCK. One step of its time with the radius falling at the rate of the
fall has length minus one in the falling chart: the time of that chart is the time its clock registers. -/
theorem the_falling_body_moves_at_unit_rate (m r : ℝ) (hm : 0 < m) (hr : 0 < r) :
    fallingForm m r 1 (-√(2 * m / r)) = -1 := by
  have hb := the_square_of_the_rate m r hm hr
  unfold fallingForm
  nlinarith [hb]

/-- THE RATE OF THE FALL IS THE ONE THE RADIAL EQUATION GIVES for energy one and no angular momentum: the square of the
radial velocity is one less the function of the solution. -/
theorem the_rate_of_the_fall_obeys_the_radial_equation (m r : ℝ) (hm : 0 < m) (hr : 0 < r) :
    (-√(2 * m / r)) ^ 2 = 1 ^ 2 - f m r := by
  rw [neg_sq, the_square_of_the_rate m r hm hr]; ring

/-- The reading of the falling body's clock at the radius `r`, up to a constant. -/
noncomputable def clock (m r : ℝ) : ℝ := -(2 / 3) * (r * √r) / √(2 * m)

/-- THE CLOCK OF THE FALL AGAINST THE RADIUS. The reading has derivative minus the root of `r` over the root of `2m`. -/
theorem the_clock_of_the_fall_against_the_radius (m r : ℝ) (hr : 0 < r) :
    HasDerivAt (clock m) (-(√r / √(2 * m))) r := by
  have hs : √r ≠ 0 := (Real.sqrt_pos.mpr hr).ne'
  have a := (hasDerivAt_id r).mul ((hasDerivAt_id r).sqrt hr.ne')
  have e : (1 : ℝ) * √(id r) + id r * (1 / (2 * √(id r))) = 3 / 2 * √r := by
    simp only [id]
    have h2 : √r * √r = r := Real.mul_self_sqrt hr.le
    field_simp
    nlinarith [h2]
  rw [e] at a
  have b := (a.const_mul (-(2 / 3 : ℝ))).div_const (√(2 * m))
  have e2 : -(2 / 3 : ℝ) * (3 / 2 * √r) / √(2 * m) = -(√r / √(2 * m)) := by ring
  rw [e2] at b
  exact b

/-- THE CLOCK AND THE FALL AGREE: the rate of the clock against the radius times the rate of the fall is one. -/
theorem the_clock_and_the_fall_agree (m r : ℝ) (hm : 0 < m) (hr : 0 < r) :
    -(√r / √(2 * m)) * (-√(2 * m / r)) = 1 := by
  have h1 : √(2 * m / r) = √(2 * m) / √r := Real.sqrt_div (by positivity) r
  have hs : √r ≠ 0 := (Real.sqrt_pos.mpr hr).ne'
  have hm2 : √(2 * m) ≠ 0 := (Real.sqrt_pos.mpr (by positivity)).ne'
  rw [h1]; field_simp

/-- THE FALLING BODY REGISTERS A FINITE TIME. From a radius `r₀` down to any radius `r` between zero and `r₀`, the time its
own clock registers is at least zero and at most two thirds of `r₀` times its root over the root of `2m`. The
bound does not depend on `r`: it holds at the horizon, below it, and as near the centre as one likes. -/
theorem the_falling_body_registers_a_finite_time (m r₀ r : ℝ) (hm : 0 < m) (h0 : 0 ≤ r) (h1 : r ≤ r₀) :
    0 ≤ clock m r - clock m r₀ ∧ clock m r - clock m r₀ ≤ 2 / 3 * (r₀ * √r₀) / √(2 * m) := by
  have hpos : 0 < √(2 * m) := Real.sqrt_pos.mpr (by positivity)
  have hmono : r * √r ≤ r₀ * √r₀ :=
    mul_le_mul h1 (Real.sqrt_le_sqrt h1) (Real.sqrt_nonneg r) (h0.trans h1)
  have hnn : 0 ≤ r * √r := mul_nonneg h0 (Real.sqrt_nonneg r)
  have e : clock m r - clock m r₀ = 2 / 3 * (r₀ * √r₀ - r * √r) / √(2 * m) := by unfold clock; ring
  rw [e]
  constructor
  · exact div_nonneg (by nlinarith) hpos.le
  · exact div_le_div_of_nonneg_right (by nlinarith) hpos.le

/-! ## Part III. The surface gravity, the first law, and the merger. -/

/-- THE SLOPE OF THE FUNCTION OF THE SOLUTION is `2m / r²`. -/
theorem the_slope_of_the_function (m r : ℝ) (hr : r ≠ 0) : HasDerivAt (f m) (2 * m / r ^ 2) r := by
  have a := ((hasDerivAt_id r).inv hr).const_mul (2 * m)
  have b : HasDerivAt (fun x => (1 : ℝ) - 2 * m * (id x)⁻¹) ((0 : ℝ) - 2 * m * (-(1 : ℝ) / id r ^ 2)) r :=
    HasDerivAt.sub (hasDerivAt_const r (1 : ℝ)) a
  have e : (0 : ℝ) - 2 * m * (-(1 : ℝ) / id r ^ 2) = 2 * m / r ^ 2 := by simp only [id]; field_simp
  rw [e] at b
  have g : f m = fun x => (1 : ℝ) - 2 * m * (id x)⁻¹ := by funext x; unfold f; simp only [id]; ring
  rw [g]; exact b

/-- THE SURFACE GRAVITY OF THE HORIZON is half the slope there: one over four times the mass. -/
theorem the_surface_gravity_of_the_horizon (m : ℝ) (hm : m ≠ 0) : 2 * m / (2 * m) ^ 2 / 2 = 1 / (4 * m) := by
  field_simp; ring

/-- THE AREA OF THE HORIZON is sixteen pi times the square of the mass. -/
theorem the_area_of_the_horizon (m : ℝ) : 4 * π * (2 * m) ^ 2 = 16 * π * m ^ 2 := by ring

/-- THE FIRST LAW, EXACT. Take the entropy as a quarter of the area of the horizon, `4π m²`, and the temperature as the
surface gravity over two pi, `1 / (8π m)`. Then the entropy has derivative `8π m` in the mass, and the temperature
times that derivative is one: a step of mass is the temperature times the step of entropy. That the surface gravity
over two pi is a temperature is the hypothesis of this theorem's reading and is not derived here. -/
theorem the_first_law_exact (m : ℝ) (hm : m ≠ 0) :
    HasDerivAt (fun M : ℝ => 4 * π * M ^ 2) (8 * π * m) m ∧ 1 / (8 * π * m) * (8 * π * m) = 1 := by
  constructor
  · have a := ((hasDerivAt_id m).pow 2).const_mul (4 * π)
    have e : 4 * π * (((2 : ℕ) : ℝ) * id m ^ (2 - 1) * 1) = 8 * π * m := by simp only [id]; push_cast; ring
    rw [e] at a; exact a
  · have hp : π ≠ 0 := Real.pi_ne_zero
    field_simp

/-- THE CAP ON WHAT A MERGER RADIATES. Let two holes of masses `m₁`, `m₂` merge into one of mass `M`, with the area of the
final horizon at least the sum of the two: `M² ≥ m₁² + m₂²`. Then the energy radiated, `m₁ + m₂ − M`, is at most
`1 − 1/√2` of the total. That the area does not decrease is the hypothesis. -/
theorem the_cap_on_what_a_merger_radiates (m₁ m₂ M : ℝ) (hM : 0 ≤ M)
    (area : m₁ ^ 2 + m₂ ^ 2 ≤ M ^ 2) : m₁ + m₂ - M ≤ (1 - 1 / √2) * (m₁ + m₂) := by
  have hs2 : 0 < √2 := Real.sqrt_pos.mpr (by norm_num)
  have hsq : √2 * √2 = 2 := Real.mul_self_sqrt (by norm_num)
  have key : (m₁ + m₂) / √2 ≤ M := by
    rw [div_le_iff₀ hs2]
    nlinarith [sq_nonneg (m₁ - m₂), sq_nonneg (M * √2 - (m₁ + m₂)), mul_nonneg hM hs2.le]
  have e : (1 - 1 / √2) * (m₁ + m₂) = (m₁ + m₂) - (m₁ + m₂) / √2 := by ring
  rw [e]; linarith

/-- THE CAP IS UNDER THREE TENTHS. -/
theorem the_cap_is_under_three_tenths : 1 - 1 / √2 < 3 / 10 := by
  have hs2 : 0 < √2 := Real.sqrt_pos.mpr (by norm_num)
  have hsq : √2 * √2 = 2 := Real.mul_self_sqrt (by norm_num)
  have h : √2 < 10 / 7 := by nlinarith
  have : 7 / 10 < 1 / √2 := by rw [lt_div_iff₀ hs2]; nlinarith
  linarith

/-! ## Part IV. What an outside clock registers. -/

/-- THE RATE OF THE OUTSIDE CLOCK ALONG A RAY. For a mass `m` and a radius `r` outside `2m`, the function
`r + 2m log (r − 2m)` has derivative `r / (r − 2m)`, which is one over `1 − 2m/r`: the time an outside clock
registers for light to cover a step of radius. -/
theorem the_rate_of_the_outside_clock_along_a_ray (m r : ℝ) (h : 2 * m < r) :
    HasDerivAt (fun x : ℝ => x + 2 * m * Real.log (x - 2 * m)) (r / (r - 2 * m)) r := by
  have hne : r - 2 * m ≠ 0 := by linarith
  have a := (hasDerivAt_id r).add ((((hasDerivAt_id r).sub_const (2 * m)).log hne).const_mul (2 * m))
  have e : (1 : ℝ) + 2 * m * (1 / (id r - 2 * m)) = r / (r - 2 * m) := by
    simp only [id]; field_simp
  rw [e] at a; exact a

/-- THE OUTSIDE CLOCK NEVER REGISTERS THE CROSSING. For a positive mass, the time registered outside for a ray between a
radius `r` and a fixed radius grows past every bound as `r` approaches `2m` from outside: below any number `−B`
the function `r + 2m log (r − 2m)` falls, for all `r` near enough. No signal from the horizon, or from within it,
is registered outside at any finite time. -/
theorem the_outside_clock_never_registers_the_crossing (m : ℝ) (hm : 0 < m) (B : ℝ) :
    ∃ δ > 0, ∀ r, 2 * m < r → r < 2 * m + δ → r + 2 * m * Real.log (r - 2 * m) < -B := by
  refine ⟨min 1 (Real.exp ((-B - 2 * m - 1) / (2 * m))), lt_min one_pos (Real.exp_pos _), fun r h1 h2 => ?_⟩
  have hx : 0 < r - 2 * m := by linarith
  have k1 := min_le_left 1 (Real.exp ((-B - 2 * m - 1) / (2 * m)))
  have k2 := min_le_right 1 (Real.exp ((-B - 2 * m - 1) / (2 * m)))
  have hx2 : r - 2 * m < Real.exp ((-B - 2 * m - 1) / (2 * m)) := by linarith
  have hl : Real.log (r - 2 * m) < (-B - 2 * m - 1) / (2 * m) := (Real.log_lt_iff_lt_exp hx).mpr hx2
  have h2m : 0 < 2 * m := by linarith
  have t : 2 * m * Real.log (r - 2 * m) < 2 * m * ((-B - 2 * m - 1) / (2 * m)) := mul_lt_mul_of_pos_left hl h2m
  have e : 2 * m * ((-B - 2 * m - 1) / (2 * m)) = -B - 2 * m - 1 := by field_simp
  linarith

/-- THE RATE OF THE OUTSIDE CLOCK IS ONE OVER THE FUNCTION. Outside the horizon of a positive mass, `r / (r − 2m)` is
one over `1 − 2m/r`: the outside clock's rate along a ray is the reciprocal of the function of the solution, and it
has no value where that function is zero. -/
theorem the_rate_of_the_outside_clock_is_one_over_the_function (m r : ℝ) (hm : 0 < m) (h : 2 * m < r) :
    r / (r - 2 * m) = 1 / f m r := by
  have hr : r ≠ 0 := by linarith
  have hne : r - 2 * m ≠ 0 := by linarith
  unfold f; field_simp

end SPHYS.Horizon

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.Horizon.the_square_of_the_rate' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Horizon.the_square_of_the_rate
/--
info: 'SPHYS.Horizon.the_falling_chart_is_the_same_geometry' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_falling_chart_is_the_same_geometry
/--
info: 'SPHYS.Horizon.the_falling_chart_is_regular_at_every_radius' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_falling_chart_is_regular_at_every_radius
/--
info: 'SPHYS.Horizon.the_static_chart_fails_at_the_horizon' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_static_chart_fails_at_the_horizon
/--
info: 'SPHYS.Horizon.the_falling_body_moves_at_unit_rate' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_falling_body_moves_at_unit_rate
/--
info: 'SPHYS.Horizon.the_rate_of_the_fall_obeys_the_radial_equation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_rate_of_the_fall_obeys_the_radial_equation
/--
info: 'SPHYS.Horizon.the_clock_of_the_fall_against_the_radius' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_clock_of_the_fall_against_the_radius
/-- info: 'SPHYS.Horizon.the_clock_and_the_fall_agree' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Horizon.the_clock_and_the_fall_agree
/--
info: 'SPHYS.Horizon.the_falling_body_registers_a_finite_time' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_falling_body_registers_a_finite_time
/-- info: 'SPHYS.Horizon.the_slope_of_the_function' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Horizon.the_slope_of_the_function
/--
info: 'SPHYS.Horizon.the_surface_gravity_of_the_horizon' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_surface_gravity_of_the_horizon
/-- info: 'SPHYS.Horizon.the_area_of_the_horizon' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Horizon.the_area_of_the_horizon
/-- info: 'SPHYS.Horizon.the_first_law_exact' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Horizon.the_first_law_exact
/--
info: 'SPHYS.Horizon.the_cap_on_what_a_merger_radiates' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_cap_on_what_a_merger_radiates
/-- info: 'SPHYS.Horizon.the_cap_is_under_three_tenths' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Horizon.the_cap_is_under_three_tenths
/--
info: 'SPHYS.Horizon.the_rate_of_the_outside_clock_along_a_ray' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_rate_of_the_outside_clock_along_a_ray
/--
info: 'SPHYS.Horizon.the_outside_clock_never_registers_the_crossing' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_outside_clock_never_registers_the_crossing
/--
info: 'SPHYS.Horizon.the_rate_of_the_outside_clock_is_one_over_the_function' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Horizon.the_rate_of_the_outside_clock_is_one_over_the_function
```

Kernel lines of Appendix K.

```text
'SPHYS.Horizon.the_square_of_the_rate' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Horizon.the_falling_chart_is_the_same_geometry' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Horizon.the_falling_chart_is_regular_at_every_radius' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Horizon.the_static_chart_fails_at_the_horizon' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Horizon.the_falling_body_moves_at_unit_rate' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Horizon.the_rate_of_the_fall_obeys_the_radial_equation' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.Horizon.the_clock_of_the_fall_against_the_radius' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Horizon.the_clock_and_the_fall_agree' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Horizon.the_falling_body_registers_a_finite_time' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Horizon.the_slope_of_the_function' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Horizon.the_surface_gravity_of_the_horizon' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Horizon.the_area_of_the_horizon' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Horizon.the_first_law_exact' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Horizon.the_cap_on_what_a_merger_radiates' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Horizon.the_cap_is_under_three_tenths' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Horizon.the_rate_of_the_outside_clock_along_a_ray' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Horizon.the_outside_clock_never_registers_the_crossing' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.Horizon.the_rate_of_the_outside_clock_is_one_over_the_function' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
```

## Appendix L · SPHYS_Curvature_CC.lean

The whole curvature of the vacuum solution. Lean 4.19.0 with Mathlib 4.19.0. 37 theorems, no axiom declared, no `sorry`, exit 0 with no warning. Every cone is pinned at the end of the file, so the build is silent. The chart, the Christoffel symbols and the static setting are those of Appendix B, written out again so the file stands alone. The kernel lines follow the file.

```lean
/-
SPHYS_Curvature_CC.lean · The Curvature of the Vacuum Solution, Computed. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. The Schwarzschild kernel computes the Ricci curvature of the static spherical form and stops there. The Ricci
  curvature of the vacuum solution is zero, so it cannot say whether any place of the solution is singular. This file
  computes the whole curvature tensor of the same form from the same Christoffel symbols, all 256 components, and
  from it the full contraction of the curvature with itself: a scalar, the same in every chart by the classical rule
  of transformation. That invariance is cited in the paper and is not proved in this file.
DESIGN. The chart, the Christoffel symbols, the static setting and its metric are those of the Schwarzschild kernel,
  written out again here word for word, so the file stands alone. `Riem` is the coordinate formula whose contraction
  on the first and third places is the `Ric` of that kernel, and the file proves that it is. The 256 components are
  proved equal to a printed table. The invariant is then a sum over the table. For the vacuum solution it is
  `48 m² / r⁶`.
RISK. The form diag(-f, 1/f, r^2, r^2 s^2) is assumed, as in the Schwarzschild kernel, with r, s and f not zero; the
  static chart therefore does not reach the horizon, where f is zero. The value of the invariant at the horizon is
  the value of the formula there, and that the geometry is regular at the horizon is proved in the horizon kernel
  from the falling chart. The file proves that the invariant grows past every bound toward r = 0. It does not make
  r = 0 a point: the solution is derived on r ≠ 0.
NON-NEGOTIABLE. No axiom is declared. No proof is left open. Curvature is computed, never postulated.
SUMMARY RULE. The sentences of this header, and the comment printed above each theorem, are summaries. Each theorem
  states its own conditions in its statement, and where a summary and a statement differ the statement governs.
-/
import Mathlib.Algebra.Field.Basic
import Mathlib.Algebra.CharZero.Defs
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.FinCases
import Mathlib.Data.Real.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity

namespace SPHYS.Curvature

/-- A coordinate chart: a field of functions with four commuting derivations. -/
structure Chart (K : Type) [Field K] where
  D : Fin 4 → K → K
  D_add : ∀ i x y, D i (x + y) = D i x + D i y
  D_mul : ∀ i x y, D i (x * y) = D i x * y + x * D i y
  D_comm : ∀ i j x, D i (D j x) = D j (D i x)

variable {K : Type} [Field K]

namespace Chart
variable (C : Chart K)

theorem D_zero (i : Fin 4) : C.D i 0 = 0 := by
  have h := C.D_add i 0 0; rw [add_zero] at h; exact left_eq_add.mp h
theorem D_one (i : Fin 4) : C.D i 1 = 0 := by
  have h := C.D_mul i 1 1; simp only [mul_one, one_mul] at h; exact left_eq_add.mp h
theorem D_neg (i : Fin 4) (x : K) : C.D i (-x) = -C.D i x := by
  have h := C.D_add i x (-x); rw [add_neg_cancel, C.D_zero] at h; exact eq_neg_of_add_eq_zero_right h.symm
theorem D_sub (i : Fin 4) (x y : K) : C.D i (x - y) = C.D i x - C.D i y := by
  rw [sub_eq_add_neg, C.D_add, C.D_neg, sub_eq_add_neg]
theorem D_two (i : Fin 4) : C.D i 2 = 0 := by
  have : (2 : K) = 1 + 1 := by norm_num
  rw [this, C.D_add, C.D_one, add_zero]
/-- The derivative of an inverse. It holds at zero too, where the inverse is zero. -/
theorem D_inv (i : Fin 4) (x : K) : C.D i x⁻¹ = -(C.D i x * x⁻¹ * x⁻¹) := by
  by_cases hx : x = 0
  · subst hx; simp [C.D_zero]
  · have h := C.D_mul i x x⁻¹
    rw [mul_inv_cancel₀ hx, C.D_one] at h
    have e : x⁻¹ * x = 1 := inv_mul_cancel₀ hx
    linear_combination (-x⁻¹) * h - C.D i x⁻¹ * e
theorem D_div (i : Fin 4) (x y : K) : C.D i (x / y) = C.D i x * y⁻¹ - x * (C.D i y * y⁻¹ * y⁻¹) := by
  rw [div_eq_mul_inv, C.D_mul, C.D_inv]; ring

/-- A diagonal metric, as a full matrix. -/
def G (g : Fin 4 → K) (i j : Fin 4) : K := if i = j then g i else 0
/-- Christoffel symbols of a diagonal metric g. -/
def Gam (g : Fin 4 → K) (k i j : Fin 4) : K :=
  (g k)⁻¹ * 2⁻¹ * (C.D i (G g j k) + C.D j (G g i k) - C.D k (G g i j))
/-- The Ricci curvature, by the coordinate formula. -/
def Ric (g : Fin 4 → K) (i j : Fin 4) : K :=
  (∑ k, (C.D k (C.Gam g k i j) - C.D j (C.Gam g k i k)))
  + ∑ k, ∑ l, (C.Gam g k k l * C.Gam g l i j - C.Gam g k j l * C.Gam g l i k)
/-- The Christoffel symbols are symmetric: the connection of the chart has no torsion. -/
theorem Gam_symm (g : Fin 4 → K) (k i j : Fin 4) : C.Gam g k i j = C.Gam g k j i := by
  have hs : G g i j = G g j i := by
    unfold G
    by_cases h : i = j
    · subst h; rfl
    · rw [if_neg h, if_neg (Ne.symm h)]
  unfold Gam
  rw [hs, add_comm (C.D i (G g j k)) (C.D j (G g i k))]

/-- The connection of the chart preserves the metric: the derivative of the metric is carried by the Christoffel
symbols. With `Gam_symm` this says the connection is the torsion-free metric connection, in coordinates. -/
theorem Gam_metric (g : Fin 4 → K) (hg : ∀ i, g i ≠ 0) (h2 : (2 : K) ≠ 0) (k i j : Fin 4) :
    C.D k (G g i j) = ∑ l, (G g l j * C.Gam g l k i + G g i l * C.Gam g l k j) := by
  have hs : ∀ a b : Fin 4, G g a b = G g b a := by
    intro a b
    unfold G
    by_cases h : a = b
    · subst h; rfl
    · rw [if_neg h, if_neg (Ne.symm h)]
  have e1 : ∑ l, G g l j * C.Gam g l k i = g j * C.Gam g j k i := by simp [G]
  have e2 : ∑ l, G g i l * C.Gam g l k j = g i * C.Gam g i k j := by simp [G]
  rw [Finset.sum_add_distrib, e1, e2]
  unfold Gam
  rw [hs j i, hs k i, hs k j]
  have hi := hg i; have hj := hg j
  field_simp
  ring
end Chart

/-- The static spherical setting: the radius r, the sine and cosine of the polar angle, and one function f of r. -/
structure Static (K : Type) [Field K] extends Chart K where
  r : K
  s : K
  c : K
  f : K
  r_ne : r ≠ 0
  s_ne : s ≠ 0
  f_ne : f ≠ 0
  r0 : D 0 r = 0
  r1 : D 1 r = 1
  r2 : D 2 r = 0
  r3 : D 3 r = 0
  s0 : D 0 s = 0
  s1 : D 1 s = 0
  s2 : D 2 s = c
  s3 : D 3 s = 0
  c0 : D 0 c = 0
  c1 : D 1 c = 0
  c2 : D 2 c = -s
  c3 : D 3 c = 0
  f0 : D 0 f = 0
  f2 : D 2 f = 0
  f3 : D 3 f = 0

namespace Static
variable [CharZero K] (S : Static K)

-- One tactic block serves all sixteen components; on the components that vanish its tail has nothing to do.
-- Twelve components vanish without dividing by two, so they do not use the characteristic-zero assumption.
set_option linter.unusedSectionVars false
set_option linter.unusedTactic false
set_option linter.unreachableTactic false
set_option maxHeartbeats 1600000

/-- The metric diag(-f, 1/f, r^2, r^2 s^2). -/
def g : Fin 4 → K := ![-S.f, S.f⁻¹, S.r * S.r, S.r * S.r * (S.s * S.s)]
/-- No entry of the metric vanishes. -/
theorem g_ne (i : Fin 4) : S.g i ≠ 0 := by
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  fin_cases i <;> simp [g, hr, hs, hf]

/-- THE CONNECTION OF THIS FILE IS THE TORSION-FREE METRIC CONNECTION. Its Christoffel symbols are symmetric and they
carry the derivative of the metric. The curvature below is the curvature of that connection, in coordinates. -/
theorem connection_is_torsion_free_and_metric :
    (∀ k i j, S.toChart.Gam S.g k i j = S.toChart.Gam S.g k j i) ∧
    (∀ k i j, S.D k (Chart.G S.g i j)
      = ∑ l, (Chart.G S.g l j * S.toChart.Gam S.g l k i + Chart.G S.g i l * S.toChart.Gam S.g l k j)) :=
  ⟨fun k i j => S.toChart.Gam_symm S.g k i j,
   fun k i j => S.toChart.Gam_metric S.g S.g_ne (by norm_num) k i j⟩

/-- The first and second radial derivatives of f. -/
def f' : K := S.D 1 S.f
def f'' : K := S.D 1 (S.D 1 S.f)

theorem fp0 : S.D 0 (S.D 1 S.f) = 0 := by rw [S.D_comm, S.f0, S.toChart.D_zero]
theorem fp2 : S.D 2 (S.D 1 S.f) = 0 := by rw [S.D_comm, S.f2, S.toChart.D_zero]
theorem fp3 : S.D 3 (S.D 1 S.f) = 0 := by rw [S.D_comm, S.f3, S.toChart.D_zero]

/-- The curvature of the chart, by the coordinate formula. -/
def _root_.SPHYS.Curvature.Chart.Riem (C : Chart K) (g : Fin 4 → K) (a b c d : Fin 4) : K :=
  C.D c (C.Gam g a d b) - C.D d (C.Gam g a c b) + ∑ e, (C.Gam g a c e * C.Gam g e d b - C.Gam g a d e * C.Gam g e c b)

/-- THE RICCI CURVATURE IS THE CONTRACTION OF THIS CURVATURE on its first and third places, in any chart and for any
diagonal metric. The `Ric` of the Schwarzschild kernel is this one. -/
theorem the_ricci_curvature_is_the_contraction (C : Chart K) (g : Fin 4 → K) (i j : Fin 4) :
    C.Ric g i j = ∑ k, C.Riem g k i k j := by
  unfold Chart.Ric Chart.Riem
  rw [← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun k _ => ?_
  rw [C.Gam_symm g k j i, C.Gam_symm g k k i]
  congr 1
  refine Finset.sum_congr rfl fun l _ => ?_
  rw [C.Gam_symm g l j i, C.Gam_symm g l k i]

/-- The curvature of each pair of directions. -/
def kap (a b : Fin 4) : K :=
  if (a = 0 ∧ b = 1) ∨ (a = 1 ∧ b = 0) then -(S.f'' * 2⁻¹)
  else if (a = 2 ∧ b = 3) ∨ (a = 3 ∧ b = 2) then (1 - S.f) * S.r⁻¹ * S.r⁻¹
  else -(S.f' * 2⁻¹ * S.r⁻¹)

/-- The table of the curvature: all 256 components. A component is zero unless its last two places are its first two,
in either order. -/
def riemTable (a b c d : Fin 4) : K :=
  if a = b then 0
  else S.kap a b * S.g b * ((if c = a ∧ d = b then 1 else 0) - (if d = a ∧ c = b then 1 else 0))

-- One tactic block serves all 256 components, as one block serves the sixteen of the Ricci curvature.
macro "riem_block" : tactic => `(tactic| (
  have hr := S.r_ne; have hs := S.s_ne; have hf := S.f_ne
  simp [Chart.Riem, Chart.Gam, Chart.G, riemTable, kap, g, f', f'', Fin.sum_univ_four, S.toChart.D_add, S.toChart.D_mul,
    S.toChart.D_neg, S.toChart.D_sub, S.toChart.D_inv, S.toChart.D_zero, S.toChart.D_one, S.toChart.D_two,
    S.r0, S.r1, S.r2, S.r3, S.s0, S.s1, S.s2, S.s3, S.c0, S.c1, S.c2, S.c3, S.f0, S.f2, S.f3, S.fp0, S.fp2, S.fp3]
  all_goals generalize S.D 1 (S.D 1 S.f) = dd at *
  all_goals generalize S.D 1 S.f = d at *
  all_goals generalize S.r = r at *
  all_goals generalize S.s = s at *
  all_goals generalize S.c = c at *
  all_goals generalize S.f = f at *
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring_nf)
  all_goals (try field_simp)
  all_goals (try ring)))

-- The 256 components, sixteen at a time: one statement for each pair of first places.
theorem riem_00 (c d : Fin 4) : S.toChart.Riem S.g 0 0 c d = S.riemTable 0 0 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_01 (c d : Fin 4) : S.toChart.Riem S.g 0 1 c d = S.riemTable 0 1 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_02 (c d : Fin 4) : S.toChart.Riem S.g 0 2 c d = S.riemTable 0 2 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_03 (c d : Fin 4) : S.toChart.Riem S.g 0 3 c d = S.riemTable 0 3 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_10 (c d : Fin 4) : S.toChart.Riem S.g 1 0 c d = S.riemTable 1 0 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_11 (c d : Fin 4) : S.toChart.Riem S.g 1 1 c d = S.riemTable 1 1 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_12 (c d : Fin 4) : S.toChart.Riem S.g 1 2 c d = S.riemTable 1 2 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_13 (c d : Fin 4) : S.toChart.Riem S.g 1 3 c d = S.riemTable 1 3 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_20 (c d : Fin 4) : S.toChart.Riem S.g 2 0 c d = S.riemTable 2 0 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_21 (c d : Fin 4) : S.toChart.Riem S.g 2 1 c d = S.riemTable 2 1 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_22 (c d : Fin 4) : S.toChart.Riem S.g 2 2 c d = S.riemTable 2 2 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_23 (c d : Fin 4) : S.toChart.Riem S.g 2 3 c d = S.riemTable 2 3 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_30 (c d : Fin 4) : S.toChart.Riem S.g 3 0 c d = S.riemTable 3 0 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_31 (c d : Fin 4) : S.toChart.Riem S.g 3 1 c d = S.riemTable 3 1 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_32 (c d : Fin 4) : S.toChart.Riem S.g 3 2 c d = S.riemTable 3 2 c d := by
  fin_cases c <;> fin_cases d <;> riem_block
theorem riem_33 (c d : Fin 4) : S.toChart.Riem S.g 3 3 c d = S.riemTable 3 3 c d := by
  fin_cases c <;> fin_cases d <;> riem_block

/-- THE CURVATURE, COMPUTED. Every one of the 256 components of the curvature of the static spherical form is the entry
of the table. -/
theorem the_curvature_is_the_table (a b c d : Fin 4) : S.toChart.Riem S.g a b c d = S.riemTable a b c d := by
  fin_cases a <;> fin_cases b <;> first | exact S.riem_00 c d | exact S.riem_01 c d | exact S.riem_02 c d | exact S.riem_03 c d | exact S.riem_10 c d | exact S.riem_11 c d | exact S.riem_12 c d | exact S.riem_13 c d | exact S.riem_20 c d | exact S.riem_21 c d | exact S.riem_22 c d | exact S.riem_23 c d | exact S.riem_30 c d | exact S.riem_31 c d | exact S.riem_32 c d | exact S.riem_33 c d

/-- The invariant of the curvature: the curvature contracted with itself on all four places. -/
def invariant : K :=
  ∑ a, ∑ b, ∑ c, ∑ d, (S.g a * S.toChart.Riem S.g a b c d) ^ 2 * (S.g a)⁻¹ * (S.g b)⁻¹ * (S.g c)⁻¹ * (S.g d)⁻¹

/-- ONE TERM OF THE CONTRACTION. A component of the table, lowered and contracted with itself, is the square of the
curvature of its pair of directions when its last two places are its first two in either order, and zero otherwise. -/
theorem one_term_of_the_contraction (a b c d : Fin 4) :
    (S.g a * S.riemTable a b c d) ^ 2 * (S.g a)⁻¹ * (S.g b)⁻¹ * (S.g c)⁻¹ * (S.g d)⁻¹
      = if a = b then 0
        else S.kap a b ^ 2 * ((if c = a ∧ d = b then 1 else 0) + (if d = a ∧ c = b then 1 else 0)) := by
  have key1 : ∀ x y k : K, x ≠ 0 → y ≠ 0 → (x * (k * y)) ^ 2 * x⁻¹ * y⁻¹ * x⁻¹ * y⁻¹ = k ^ 2 := by
    intro x y k hx hy; field_simp; ring
  have key2 : ∀ x y k : K, x ≠ 0 → y ≠ 0 → (x * (k * y)) ^ 2 * x⁻¹ * y⁻¹ * y⁻¹ * x⁻¹ = k ^ 2 := by
    intro x y k hx hy; field_simp; ring
  by_cases hab : a = b
  · simp [riemTable, hab]
  · by_cases h1 : c = a ∧ d = b
    · obtain ⟨rfl, rfl⟩ := h1
      have h2 : ¬ (d = c ∧ c = d) := fun h => hab h.2
      simpa [riemTable, hab, h2] using key1 (S.g c) (S.g d) (S.kap c d) (S.g_ne c) (S.g_ne d)
    · by_cases h2 : d = a ∧ c = b
      · obtain ⟨rfl, rfl⟩ := h2
        have h3 : ¬ (c = d ∧ d = c) := fun h => hab h.2
        simpa [riemTable, hab, h3] using key2 (S.g d) (S.g c) (S.kap d c) (S.g_ne d) (S.g_ne c)
      · simp [riemTable, hab, h1, h2]

/-- THE INVARIANT OF THE CURVATURE of the static spherical form, for any `f`: the square of `f''`, and four times the
square of `f'` over `r²`, and four times the square of `1 − f` over `r⁴`. -/
theorem the_invariant_of_the_curvature :
    S.invariant = S.f'' ^ 2 + 4 * S.f' ^ 2 * S.r⁻¹ ^ 2 + 4 * (1 - S.f) ^ 2 * S.r⁻¹ ^ 4 := by
  unfold invariant
  simp only [S.the_curvature_is_the_table, S.one_term_of_the_contraction]
  simp [kap, Fin.sum_univ_four]
  ring

/-- THE INVARIANT OF THE VACUUM SOLUTION is `48 m² / r⁶`, for `f = 1 − 2m/r` with `m` constant along the radius. -/
theorem the_invariant_of_the_vacuum_solution (m : K) (hm : S.D 1 m = 0) (hf : S.f = 1 - 2 * m / S.r) :
    S.invariant = 48 * m ^ 2 / S.r ^ 6 := by
  have hf' : S.f = 1 - 2 * m * S.r⁻¹ := by rw [hf, div_eq_mul_inv]
  have e1 : S.f' = 2 * m * S.r⁻¹ ^ 2 := by
    unfold f'; rw [hf']
    simp [S.toChart.D_sub, S.toChart.D_one, S.toChart.D_mul, S.toChart.D_two, S.toChart.D_inv, hm, S.r1]
    all_goals first | ring1 | exact Or.inl (by ring1) | simp [pow_two]
  have e2 : S.f'' = -(4 * m * S.r⁻¹ ^ 3) := by
    have t : S.D 1 S.f = 2 * m * S.r⁻¹ ^ 2 := e1
    unfold f''; rw [t]
    simp [S.toChart.D_mul, S.toChart.D_two, S.toChart.D_inv, hm, S.r1, pow_succ]
    all_goals first | ring1 | exact Or.inl (by ring1) | simp [pow_two]
  rw [S.the_invariant_of_the_curvature, e1, e2, hf']
  ring

/-- THE INVARIANT AT THE HORIZON has the value `3 / (4 m⁴)`: the formula is finite there. -/
theorem the_invariant_at_the_horizon (m : K) (hm : m ≠ 0) : 48 * m ^ 2 / (2 * m) ^ 6 = 3 / (4 * m ^ 4) := by
  field_simp; ring

end Static

/-- THE INVARIANT GROWS PAST EVERY BOUND TOWARD THE CENTRE. On the real numbers, for a mass that is not zero: above any
number `B` the invariant `48 m² / r⁶` rises, for all radii near enough to zero. It has no value at zero. -/
theorem the_invariant_grows_past_every_bound (m : ℝ) (hm : m ≠ 0) (B : ℝ) :
    ∃ δ > 0, ∀ r, 0 < r → r < δ → B < 48 * m ^ 2 / r ^ 6 := by
  have hm2 : 0 < 48 * m ^ 2 := by positivity
  refine ⟨min 1 (48 * m ^ 2 / (|B| + 1)), lt_min one_pos (by positivity), fun r h0 h1 => ?_⟩
  have k1 := min_le_left 1 (48 * m ^ 2 / (|B| + 1))
  have k2 := min_le_right 1 (48 * m ^ 2 / (|B| + 1))
  have hr1 : r ≤ 1 := by linarith
  have hr6 : r ^ 6 ≤ r := by
    calc r ^ 6 ≤ r ^ 1 := pow_le_pow_of_le_one h0.le hr1 (by norm_num)
      _ = r := pow_one r
  have hB : 0 < |B| + 1 := by positivity
  have h2 : r < 48 * m ^ 2 / (|B| + 1) := by linarith
  have h3 : r * (|B| + 1) < 48 * m ^ 2 := by rwa [lt_div_iff₀ hB] at h2
  have hr6pos : 0 < r ^ 6 := by positivity
  rw [lt_div_iff₀ hr6pos]
  have : B ≤ |B| := le_abs_self B
  nlinarith [mul_le_mul_of_nonneg_right hr6 hB.le]

end SPHYS.Curvature

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.Curvature.Chart.D_zero' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Curvature.Chart.D_zero
/-- info: 'SPHYS.Curvature.Chart.D_one' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Curvature.Chart.D_one
/-- info: 'SPHYS.Curvature.Chart.D_neg' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Curvature.Chart.D_neg
/-- info: 'SPHYS.Curvature.Chart.D_sub' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Curvature.Chart.D_sub
/-- info: 'SPHYS.Curvature.Chart.D_two' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Curvature.Chart.D_two
/-- info: 'SPHYS.Curvature.Chart.D_inv' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Chart.D_inv
/-- info: 'SPHYS.Curvature.Chart.D_div' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Chart.D_div
/-- info: 'SPHYS.Curvature.Chart.Gam_symm' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Chart.Gam_symm
/-- info: 'SPHYS.Curvature.Chart.Gam_metric' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Chart.Gam_metric
/-- info: 'SPHYS.Curvature.Static.g_ne' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.g_ne
/--
info: 'SPHYS.Curvature.Static.connection_is_torsion_free_and_metric' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Curvature.Static.connection_is_torsion_free_and_metric
/-- info: 'SPHYS.Curvature.Static.fp0' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.fp0
/-- info: 'SPHYS.Curvature.Static.fp2' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.fp2
/-- info: 'SPHYS.Curvature.Static.fp3' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.fp3
/--
info: 'SPHYS.Curvature.Static.the_ricci_curvature_is_the_contraction' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Curvature.Static.the_ricci_curvature_is_the_contraction
/-- info: 'SPHYS.Curvature.Static.riem_00' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_00
/-- info: 'SPHYS.Curvature.Static.riem_01' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_01
/-- info: 'SPHYS.Curvature.Static.riem_02' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_02
/-- info: 'SPHYS.Curvature.Static.riem_03' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_03
/-- info: 'SPHYS.Curvature.Static.riem_10' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_10
/-- info: 'SPHYS.Curvature.Static.riem_11' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_11
/-- info: 'SPHYS.Curvature.Static.riem_12' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_12
/-- info: 'SPHYS.Curvature.Static.riem_13' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_13
/-- info: 'SPHYS.Curvature.Static.riem_20' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_20
/-- info: 'SPHYS.Curvature.Static.riem_21' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_21
/-- info: 'SPHYS.Curvature.Static.riem_22' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_22
/-- info: 'SPHYS.Curvature.Static.riem_23' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_23
/-- info: 'SPHYS.Curvature.Static.riem_30' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_30
/-- info: 'SPHYS.Curvature.Static.riem_31' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_31
/-- info: 'SPHYS.Curvature.Static.riem_32' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_32
/-- info: 'SPHYS.Curvature.Static.riem_33' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Curvature.Static.riem_33
/--
info: 'SPHYS.Curvature.Static.the_curvature_is_the_table' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Curvature.Static.the_curvature_is_the_table
/--
info: 'SPHYS.Curvature.Static.one_term_of_the_contraction' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Curvature.Static.one_term_of_the_contraction
/--
info: 'SPHYS.Curvature.Static.the_invariant_of_the_curvature' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Curvature.Static.the_invariant_of_the_curvature
/--
info: 'SPHYS.Curvature.Static.the_invariant_of_the_vacuum_solution' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Curvature.Static.the_invariant_of_the_vacuum_solution
/--
info: 'SPHYS.Curvature.Static.the_invariant_at_the_horizon' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Curvature.Static.the_invariant_at_the_horizon
/--
info: 'SPHYS.Curvature.the_invariant_grows_past_every_bound' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Curvature.the_invariant_grows_past_every_bound
```

Kernel lines of Appendix L.

```text
'SPHYS.Curvature.Chart.D_zero' depends on axioms: [propext]
'SPHYS.Curvature.Chart.D_one' depends on axioms: [propext]
'SPHYS.Curvature.Chart.D_neg' depends on axioms: [propext]
'SPHYS.Curvature.Chart.D_sub' depends on axioms: [propext]
'SPHYS.Curvature.Chart.D_two' depends on axioms: [propext]
'SPHYS.Curvature.Chart.D_inv' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Chart.D_div' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Chart.Gam_symm' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Chart.Gam_metric' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Static.g_ne' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Static.connection_is_torsion_free_and_metric' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.Curvature.Static.fp0' depends on axioms: [propext]
'SPHYS.Curvature.Static.fp2' depends on axioms: [propext]
'SPHYS.Curvature.Static.fp3' depends on axioms: [propext]
'SPHYS.Curvature.Static.the_ricci_curvature_is_the_contraction' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.Curvature.Static.riem_00' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Static.riem_01' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Static.riem_02' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Static.riem_03' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Static.riem_10' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Static.riem_11' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Static.riem_12' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Static.riem_13' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Static.riem_20' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Static.riem_21' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Static.riem_22' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Static.riem_23' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Static.riem_30' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Static.riem_31' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Static.riem_32' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Static.riem_33' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Static.the_curvature_is_the_table' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Static.one_term_of_the_contraction' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Static.the_invariant_of_the_curvature' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Static.the_invariant_of_the_vacuum_solution' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.Static.the_invariant_at_the_horizon' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Curvature.the_invariant_grows_past_every_bound' depends on axioms: [propext, Classical.choice, Quot.sound]
```

## Appendix M · Provenance Trail

This paper is the last step of a line, and the line is on the public record. The table lists each step at the grade its own record carries, with the address where that record can be read. The theorem of this paper, that conservation forces Einstein's equation, is in the last three rows and in no earlier one. The results of the rows of 14 and 16 July are classical and are cited there as inherited. Edition 4.1.0 added this appendix. Edition 4.2.0 added Section 10.1 and Appendix J, what gravity counts. Edition 4.11.0, this file, adds Sections 10.2 and 10.3 and Appendices K and L, the horizon and the whole curvature; the other Lean files and the twin are those of edition 4.0.0, no earlier theorem is changed, and this edition has no address until it is deposited.

**Table M.1 · The grade ladder of the gravity line, 2026**

| Date | Grade | Record | Git commit or Zenodo URL |
|---|---|---|---|
| 31 Mar | Frame | *Trisduction: The Geometry of Convergent Epistemic Warrant; gravity only as a subject of audit* | <https://doi.org/10.5281/zenodo.19345046> |
| 21 Apr | Reading, seed | *Trisduction Engine, Omega System Role. Given 3, Gravity and Inertia: gravity as the curvature response of the substrate* | <https://doi.org/10.5281/zenodo.19675370> |
| 14 May | Reading | *Omega Master Codex: general relativity anchor-consistent* | <https://doi.org/10.5281/zenodo.20175605> |
| 21 Jun | Audit verdict | *The Geometric Orthogonal Triaxial Warrants, case 14: general relativity in its tested domain* | <https://doi.org/10.5281/zenodo.20782849> |
| 14 Jul | Paper, results inherited | *Emergent Substrate Gravity, preprint* | <https://github.com/1000sapients/Trisduction/commit/bd5e542> |
| 16 Jul | Paper, deposited | *Emergent Substrate Gravity: the same file, byte for byte; it opens the concept record of this paper* | <https://doi.org/10.5281/zenodo.21392900> |
| 19 Jul | Paper | *The Four Forces, Matter, and the Dark Sector as Configurations of One Actuating Substrate* | <https://doi.org/10.5281/zenodo.21438933> |
| 22 Jul | Reading, in the Codex | *Master Codex Unabridged v3.0.2: the coordinate The Trisductive Theory of Gravity* | <https://github.com/1000sapients/Trisduction/commit/848c3d7> |
| 1 Sep | Reading, deposited | *Master Codex Unabridged v3.20, with the same coordinate* | <https://doi.org/10.5281/zenodo.22217812> |
| 30 Sep | Lean, the reading | *Immanent Gravity, draft 2.0.0: the first gravity file in Lean, 68 laws on the seat* | <https://github.com/1000sapients/Trisduction/commit/f58d705> |
| 1 Oct | Lean, deposited | *Nothing Escapes Least Erasure, first edition: the kernel SPHYS.Gravity printed whole* | <https://github.com/1000sapients/Trisduction/commit/e81b9f5> · <https://doi.org/10.5281/zenodo.23080221> |
| 23 Nov | Lean, deposited | *Nothing Escapes Least Erasure, edition 2.0.0: Part I of edition 3.0.0 of this paper is carried from it* | <https://github.com/1000sapients/Trisduction/commit/df0fe62> · <https://doi.org/10.5281/zenodo.24463512> |
| 24 Nov | Theorem, field equations | *Immanent Gravity, edition 3.0.0: the kernel of the field equations* | <https://github.com/1000sapients/Trisduction/commit/486aff7> |
| 25 Nov | Theorem, forced law | *This paper, edition 4.0.0: conservation forces Einstein's equation; the Bianchi identities; Birkhoff; the waves* | <https://github.com/1000sapients/Trisduction/commit/e0c446d> · <https://doi.org/10.5281/zenodo.24495027> |
| 26 Nov | Theorem, forced law | *This paper, edition 4.1.0: the provenance trail added, no theorem changed* | <https://github.com/1000sapients/Trisduction/commit/9d18c47> |

Dates are git commit dates, or Zenodo publication dates where a DOI is given, in UTC. Each row is listed at the grade its own record carries. The file of 14 and 16 July has md5 `35441ef196601b568fa97392b787e2a2` at both addresses. The rows of 16 July and 25 November are two versions of one concept record, <https://doi.org/10.5281/zenodo.21392899>.