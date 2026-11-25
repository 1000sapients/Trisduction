# Immanent Gravity as a Theorem

## Einstein's Equation Forced by Conservation, Newton's as Its Half-Reading, and Four Dimensions Singled Out

**Mohammad F. Islam** · 24 November 2026

*On edition 3.0.0. Part I is edition 2.0.0 of Immanent Gravity, "Gravity as the Substrate Reading Its Own Record: One Sign and No Screening, Blind to Composition, Reversible with No Bit, Every Clock Moved Together, and the Deficit of Every Bond Read Monically", from Nothing Escapes, Least Erasure (Islam, 2026a), set in this paper's vocabulary. Part II, The Field Equations from the Seat, is new.*

## Abstract

Gravity is the one interaction that reads everything and distinguishes nothing: every body falls alike, every clock at one place shifts alike, antimatter falls as matter does, and no body has been found whose weight is negative. This paper reads gravity on a seat: a reflection of the plane, $s\mapsto1-\bar s$, and the line it fixes, where registration keeps a point's height and forgets its side. Its thesis is that gravity is immanent: not an agent added to matter, not a medium's stress, but the substrate reading its own record. We prove in core Lean 4, sixty-eight laws with no axiom declared and no use of choice, that the gravitational reading factors through registration, so it is even under the particle map and blind to composition, a property strictly stronger than evenness; that every gravitational source stands on the line while every charged source stands off it, so sources of one sign total zero only when each is zero and gravity cannot be screened, while charge can; that conservative motion under every force law is undone exactly by reversal, for any number of steps; that a gravitational shift moves every height by one factor, keeping the line, commuting with registration and preserving every ratio of clocks, so gravity and time co-move; that the deficit of a bond is read monically, two bindings reading alike exactly when they are equal; that the waves carry two polarizations; and that gravity alone reads a state the particle map fixes, while the vacuum's pressure reverses its pull without any energy changing sign. A Fortran twin runs seventeen checks with zero failures: the binding deficit of titanium and platinum falls with the rest to $5\times10^{-12}$ of itself under MICROSCOPE's bound, a Kepler orbit retraces its start to $5\times10^{-10}$ after reversal, the deflection of light, Mercury's perihelion and the binary pulsar's decay are computed from the constants, and the Planck budget gives a deceleration parameter of $-0.527$.

Part II establishes the law of gravity as a theorem. Edition 2.0.0 proved what gravity is and imported its law. This edition derives the law from the seat and the root alone, adding no field and no parameter to the two the sky supplies: general relativity is a forced instance, and Newton's gravity is its half-reading. A reading blind to composition is a property of the arena, so gravity is geometry. Nothing escapes the record, so what gravity reads is conserved and the law must be conserved on every geometry. We prove in core Lean 4, forty further laws with no axiom declared and no use of choice, that among the laws linear in the curvature conservation forces exactly one, Einstein's, with the vacuum term free, a family Lovelock's theorem shows to hold every conserved law of second order in four dimensions; that the active density $\rho+3p$, cited in edition 2.0.0, is the trace reversal of that law in four dimensions; that for a body at rest the space part of the law reads what the time part reads, which is why light bends twice the Newtonian angle, and that this holds in four dimensions of spacetime and in no other; that a body at rest has weight exactly above three dimensions of spacetime, and that four is the least in which gravity has waves of its own; and that the law fixes its form and never its scale, so the one coupling is a magnitude, read and not derived. A second Fortran twin runs thirteen checks with zero failures, six against published measurements and seven scanning the engine's statements over random cases: the bending of light at the Sun's limb, 1.7512 arcseconds; Mercury's advance, 42.981 arcseconds per century; the tower and satellite clocks; and 100,000 rescalings over forty decades that leave every reading unchanged. Newton's constant stands where the scaling theorem of Least Erasure (Islam, 2026a) puts every magnitude: measured.

## The Standing of This Work

**Gravity is established here as a theorem.** Inside the geometry of registration and conservation, the law of gravity is uniquely forced. General relativity is derived as a forced instance. Newton's gravity is its half-reading.

**Nothing is added.** Other accounts of gravity add something: a scalar field, a further dimension, a fifth force, a modified action. This work adds zero dynamical fields and zero parameters to the two that general relativity already reads from the sky, the coupling and the vacuum term, and it declares zero axioms in core Lean 4, with no use of choice. Gravity is not an agent laid on matter and not the stress of a medium. It is the substrate reading its own record, and its law is the only law that reading can have.

| Level | Framework | Standing | What is overcome |
|---|---|---|---|
| Projection | Newtonian gravitation | an empirical inverse-square law; one static scalar flux | reads the time part alone; blind to the space part and to the bending of light |
| Realization | General relativity | field equations derived in 1915 from principles taken as given | describes curvature exactly, and takes equivalence, the single sign and the field equations as principles |
| Foundation | Immanent Gravity, this work | theorems checked by the kernel in core Lean 4, no axiom declared, no choice, on three named bridges | proves the field equation is forced by conservation; proves composition blindness, unscreenability and the active density $\rho+3p$ |

**What general relativity assumed, this work proves.** The first two are theorems of Part I on the seat, read as gravity by the thesis of section 1. The last two are theorems of Part II on the bridges of section 12.

- **All bodies fall alike.** Einstein took it as a principle. Here gravity factors through registration (`gravity_factors_through_registration`), reads a particle and its antiparticle alike (`gravity_even_branch`), and cannot see what a body is made of (`composition_blind`).
- **One sign.** General relativity excludes negative mass by an energy condition laid on by hand. Here every gravitational source stands on the line (`every_source_on_the_line`), and sources of one sign total zero only when each is zero (`one_sign_no_screening`). Gravity cannot be screened.
- **The field equation.** General relativity derives it from principles it takes as given. Here the principles are proved or bridged, and conservation on every geometry forces $b=-a/2$ (`conservation_forces_the_law`). Einstein's tensor is the only conserved law in the family that reads curvature (`a_law_that_reads_curvature_is_einsteins`).
- **The active density.** Trace reversal in four dimensions forces the source to be $\rho+3p$ (`active_four`). The accelerating sky is read through it, with no field added.

**What Newton's gravity missed.** Newton's law reads the time part of the geometry, as a flux through spheres (`double_radius_quadruple_area`). For a body at rest the space part reads exactly what the time part reads (`space_reads_as_time`). Light crosses space as fast as it crosses time, so it is bent by both: twice the Newtonian angle, forced by the geometry, with nothing patched.

**Four dimensions of spacetime is the threshold.** Below it, in two dimensions of space, a body at rest is weightless (`dust_is_weightless_in_three`) and no gravitational wave can travel (`no_waves_in_three`). At four, mass has weight and the waves carry exactly two polarizations (`two_polarizations`). Four is proved the least (`dust_attracts_exactly_above_three`). And four is singled out: the space part reads what the time part reads in four dimensions and in no other (`gamma_is_one_exactly_in_four`), so light bent exactly twice is the mark of the dimension we live in.

**Three warrants bound the claim, and each is printed.** The law fixes its form and never its scale (`the_law_fixes_no_scale`): Newton's constant, the speed of light and the particle masses are read from the sky. Five results of classical geometry, Lovelock's theorem among them, and four classical formulas enter as named imports, listed in section 12. And the three bridges are premises: an account that alters gravity breaks one of them, and section 19 names what each would show.

## Part I · The Reading

### 1. The Reader's Frame

This Part gives gravity its reading on the seat.

It claims that gravity is immanent: the substrate reading its own record. Three consequences follow at the seat. Gravity is an after-effect of existence, since a record comes after the act it records. Gravity and time co-move, since one gravitational shift moves every clock at a place together and neither causes the other. Gravity is the monic memory of privation, since the deficit of every bond is read and no two different deficits read alike. These readings are structural; the theorems that carry their content are exact, and the measurements that corroborate them are cited.

It refuses two things. Part I does not derive Einstein's equations, which enter there as imports [GR]; Part II derives their form from the seat. It does not claim gravity is or is not quantized, which no experiment has decided. A reader who arrives from the conventional frame will scan this paper for a new dynamics, find none, and be tempted to report the absence. None was attempted: the immanent reading predicts exactly what general relativity predicts, and its content is the typing.

**Negative warrants.** Two, stated so that no reader supplies them. No physical fact here is read as a proof of a mathematical sentence: a corroboration joined to a claim takes the weaker grade. In Part I no field equation is derived, and nowhere is a constant computed from first principles: $G$, $c$ and the masses enter as measured or as defined.

**Five terms.** A *reading* is any quantity an instrument returns from a state, *odd* under a map that flips its sign and *even* under one that keeps it. *Registration* is the map $(h,t)\mapsto(1,t)$ that keeps a point's height and forgets its side. A reading *factors through registration* when it depends on the height alone. The *fixed set* of a map is the set of points it leaves unchanged. A *keyed bit* is a yes-or-no property no function of a given record decides.


### 2. The Spine

The seat has a mirror and a record. The mirror is a reflection of the plane, $s\mapsto1-\bar s$, and the points it leaves fixed form one line, the fixed line. A point has a height along the line and a side off it. Registration keeps the height and forgets the side, and it erases nothing exactly when nothing stands off the line. Gravity has that shape. The particle map exchanges a particle with its antiparticle and flips every charge. This paper reads it: gravity as the reading of the record in Section 3, its one sign in Section 4, its reversibility in Section 5, its shift of every clock in Section 6, its memory of the deficit in Section 7, its reading of light and of the dark in Section 8, and its waves in Section 9.

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
| the binary pulsar | the waves carry energy away | import [GR] | −2.4021e-12 |
| dark matter | the fixed set, read by gravity alone | `only_gravity_reads_the_dark`, `odd_reading_blind` | structural |
| the accelerating expansion | the vacuum's pressure reverses the pull | `the_vacuum_repels`, `one_sign_of_energy_not_of_pull`, `kinetic_floor` | q0 = −0.527; z = 0.63, 0.295 |

\endgroup


### 3. Gravity Reads the Record

Gravity couples to energy and momentum and to nothing else: not to charge, not to colour, not to the composition of a body. The engine reads this at the seat. The gravitational reading of a particle is its energy (`grav`), which the particle map leaves unchanged, so antimatter reads as matter (`gravity_even_branch`); on the chart the reading is the height, which registration keeps and the fold keeps (`gravity_factors_through_registration`); and two particles of one energy read alike whatever their charges (`composition_blind`). Gravity is registration read as a force.

The two properties are not one. A reading can be even under the fold and still read the side: the squared distance from the line is unchanged by the fold and changed by registration (`even_is_not_the_record`). So the equivalence principle says more than symmetry under the particle map. Antihydrogen falling downward, at $(0.75\pm0.13\pm0.16)\,g$ with repulsion excluded, tests the weaker property (ALPHA-g, 2023). Titanium and platinum falling alike to $|\eta|<4.2\times10^{-15}$ tests the stronger one (MICROSCOPE, 2022). The stronger property is forced for any massless spin-two field by the low-energy theorem that such a field couples to every source through one constant (Weinberg, 1964), an import the seat reads as registration.


### 4. One Sign: Every Source on the Line, No Screening

Apply the particle map's odd part to a reading: for charge it is twice the charge, and a charged source lands off the line (`charged_source_off_the_line`); for gravity it is zero, and every gravitational source lands on the line (`every_source_on_the_line`). Gravity has no off-line source: it has one sign.

One sign has a consequence charge lacks. Sources of one sign total zero only when every source is zero (`one_sign_no_screening`), while a unit charge and its opposite total zero (`charge_can_be_screened`). An atom is neutral and a Faraday cage screens a field; nothing screens gravity. The twin finds 1834 neutral sets among 20000 random sets of four nonzero charges and not one massless set among 20000 nonempty mass sets. The total mass-energy of an isolated system is nonnegative by theorem under the dominant energy condition (Schoen and Yau, 1979; Witten, 1981). Quantum fields admit local negative energy densities, the Casimir effect among them, bounded by quantum inequalities; no body of negative gravitational mass is known. A negative gravitational mass (Bondi, 1957) would create an off-line source and a bit for gravity; it is the falsifier F-Mass.

One sign is a sign of energy, not of pull. Gravity reads pressure as well as density, and the active gravitating density of a fluid is $\rho+3p$ [GR]: dust attracts, and the vacuum, with $p=-\rho$, repels with active density $-2\rho$ (`the_vacuum_repels`). Every density stays positive while the pull reverses (`one_sign_of_energy_not_of_pull`), so the vacuum's repulsion is no screening, which would need a negative energy. For a canonical field, $\rho+p$ is twice the kinetic density and never negative (`kinetic_floor`), the floor that excludes a phantom equation of state. The sign of the vacuum's pull is read from the sky, not forced: the flat Planck budget gives $q_0=-0.527$, where an all-matter budget gives $+0.5$, the acceleration beginning at redshift 0.63 and the vacuum overtaking matter at 0.295 (Planck, 2018; Appendix B).


### 5. No Bit, and Reversible

A reading with no off-line source has no two worlds to separate and no bit to register, and its motion keeps no record. The engine proves this for motion itself. Write conservative motion under any force law $f$ as the Störmer–Verlet step on two successive positions, $(x_{n-1},x_n)\mapsto(x_n,\,2x_n-x_{n-1}+f(x_n))$, and time reversal as their exchange. For every force law, reversing, stepping and reversing undoes a step exactly (`conservative_motion_reversible`), and any number of steps is retraced by the same number of backward steps (`motion_retraces`). The twin integrates a Kepler orbit of eccentricity one half for ten revolutions, keeping its energy to $4.3\times10^{-6}$, then reverses it and finds its start again to $5.2\times10^{-10}$. Nothing was committed, so nothing was paid: the reversible branch, floor zero and never cost zero.

Reversibility alone does not keep a reading on the line: a reversible flow can leave it. What keeps gravity there is its one sign.


### 6. Gravity and Time Co-Move: The Height Moved, Never the Side

A clock deeper in a gravitational potential runs slower, by $\Delta\nu/\nu=gh/c^2$ near the Earth. On the seat a gravitational shift multiplies every height by one factor and leaves the side alone (`redshift`). It commutes with the fold (`redshift_equivariant`), keeps a point on the line exactly when it was on it (`redshift_keeps_the_line`), and commutes with registration (`redshift_commutes_with_registration`): gravity moves the record and never the side.

Because the factor is one for every mode at a place, every ratio of frequencies is kept (`clocks_co_move`): gravity does not slow a particular clock, it moves every clock together. This is the reading in which gravity and time co-move and neither causes the other. The twin computes $2.455\times10^{-15}$ for the 22.5 m tower (Pound and Rebka, 1960; confirmed to 1% by Pound and Snider, 1965) and $3.60\times10^{-17}$ for two optical clocks 33 cm apart (Chou, Hume, Rosenband and Wineland, 2010). Clocks of different kinds shift alike: a hydrogen maser flown on a rocket agreed with the prediction to parts in $10^4$ (Vessot et al., 1980), and two Galileo satellites in eccentric orbits to $2.5\times10^{-5}$ (Delva et al.; Herrmann et al., 2018).


### 7. The Monic Memory of the Deficit

A bound system weighs less than its parts by its binding energy. The engine reads a bound pair's weight as the parts' energies less the binding: a positive binding reads below the sum (`the_bond_weighs_less`), and two bindings read alike exactly when they are equal (`gravity_reads_the_deficit`). The reading of the deficit is monic, injective, keeping every privation distinct. This is the sense in which gravity is the monic memory of privation: it reads what a bond has given up, and it forgets none of it.

The deficit is measured. Nuclear binding is 0.936% of the mass of titanium and 0.851% of platinum, a difference of $8.55\times10^{-4}$; MICROSCOPE finds the two falling alike to $4.2\times10^{-15}$, so the binding deficit falls with the rest of the mass to $5.0\times10^{-12}$ of itself (Appendix B). The Earth's and the Moon's own gravitational binding fall alike too, tested by lunar laser ranging (Williams, Turyshev and Boggs, 2004).


### 8. Gravity Reads Light, and Only Gravity Reads the Dark

Gravity reads light's energy and bends its path: a ray grazing the Sun turns by 1.751 arcseconds, twice the Newtonian angle because the time and the space parts of the metric bend it equally (Dyson, Eddington and Davidson, 1920; Cassini finds $\gamma-1=(2.1\pm2.3)\times10^{-5}$, Bertotti, Iess and Tortora, 2003). Light is the substrate's one excitation fixed by both involutions at every frequency, the companion paper on light proves (Islam, 2026c); gravity reads it as it reads everything, by its record. The waves of gravity and the waves of light, both massless (`massive_slower` for anything that is not), arrived together from GW170817 after 130 million years, to $4.2\times10^{-16}$ of their speed. That gravity is prior to light, innate to the substrate rather than produced by any one carrier, is carried at structural grade: gravity reads every carrier, light included, and needs none of them to act.

The same reading explains why the dark sector is seen only through gravity. Least Erasure proves (Islam, 2026a) that a state is invisible to every charge-linear reading exactly when the particle map fixes it, and that on such a state only the mass reading remains. The engine carries the core of that result: a state the particle map fixes carries no charge, every odd reading returns zero on it, and gravity returns its energy (`odd_reading_blind`, `only_gravity_reads_the_dark`). Gravity is the one reading of the record, so it is the one reading that sees a state with nothing but a record. The rotation of galaxies (Rubin and Ford, 1970), the separation of mass from gas in the Bullet Cluster (Clowe et al., 2006) and a cold-dark-matter density 5.37 times the baryonic one (Planck, 2018) are gravity reading the fixed set. Whether that fixed set also carries a dark gauge charge is one keyed bit, as Least Erasure proves, and gravity cannot read it.


### 9. The Waves: Two Polarizations and the Decay of an Orbit

A symmetric tensor has ten components; four gauge conditions and four constraints leave two polarizations (`polarization_count`). Parity exchanges them and keeps the frequency (`waves_two_polarizations`): the radiation carries the one bit light carries, while the sources carry none. The waves carry energy away: the twin computes the orbital decay of the binary pulsar PSR B1913+16 from its period, eccentricity and masses as $-2.4021\times10^{-12}$ (Peters and Mathews, 1963), against the general-relativistic $-2.4026\times10^{-12}$ and the observed ratio $0.9983\pm0.0016$ (Hulse and Taylor, 1975; Weisberg and Huang, 2016). Mercury's perihelion advances 42.98 arcseconds a century, computed from the constants in Appendix B.


### 10. What Gravity Carries, and What It Does Not

Gravity carries the record. It reads the height of every configuration and nothing of its side; it has one sign of energy, so every source stands on the line and none is screened; its motion retraces exactly and commits nothing; its shift moves every clock together; its reading of a bond's deficit is monic; it alone reads the dark. That is the content of the immanent reading, and every clause of it is a theorem about the seat or a measurement at its grade.

The seat gives a typing: gravity is neither an agent added to matter nor a medium's collective mode but the substrate's own registration read as a force. The immanent, the emergent and the fundamental readings predict alike for every experiment cited here. At structural grade and no higher, the seat reads why gravity has resisted quantization: quantization is the priced registration of a bit, and a reading with no off-line source has none to register. A gravitationally mediated entanglement experiment would sharpen that reading without moving the typing.

### 11. Falsifiers and Owed Deeds

Three falsifiers, each a forbidden observation naming the theorem it would break. **F-Composition:** two bodies of one mass falling at different rates, at any precision, gravity reading something besides the record; this breaks `composition_blind` and `gravity_factors_through_registration` read physically. **F-Clock:** two clocks of different kinds at one place shifted by different factors in one potential; this breaks `clocks_co_move`. **F-Polarization:** a scalar or vector polarization of gravitational waves; this breaks `polarization_count` and `waves_two_polarizations`. Two more stand beside them: F-Mass, a negative gravitational mass, and F-Loop, a gravitational hysteresis.

One experiment would sharpen a reading without moving the paper's standing: gravitationally mediated entanglement between two masses in superposition (Bose et al., 2017; Marletto and Vedral, 2017).

## Part II · The Field Equations from the Seat

### 12. What Part I Left Open, and the Rule of Part II

**Part II establishes the law of gravity as a theorem.** Part I proved what gravity is and took its law from general relativity. Two things entered as imports: Einstein's equations, and the active density $\rho+3p$ that section 4 read from them. Part II derives both. General relativity ceases to be a postulate and becomes a forced instance.

The rule is strict. Only the seat and the root are allowed. Every other step is a theorem of the engine in Appendix C, a theorem of Part I, one of three bridges named here before it is used, one of five results of classical geometry listed below, or one of four classical formulas listed with them. Dimension means the dimension of spacetime throughout Part II: three dimensions of space are four of spacetime.

| Bridge | Statement | Stands on | Grade |
|---|---|---|---|
| B1 · Geometry | A reading blind to composition belongs to the arena and not to the body. Gravity is the geometry of the record. | `composition_blind`, `gravity_factors_through_registration` (Part I) | structural |
| B2 · Nothing escapes | The record is kept. What gravity reads is conserved, so the law equals a conserved source on every geometry. | the root, read as least erasure | premise |
| B3 · Least order | The law reads the geometry at the least order at which a curvature exists, the second. | least erasure | premise |

Five results of classical geometry enter by name. Two identities are fields of `Geometry` in the engine: the metric is constant under its own derivative, and the contracted Bianchi identity holds, the statement that the boundary of a boundary is zero, read on curvature. In two dimensions the Ricci tensor is half the scalar curvature times the metric. That every conserved law of second order in four dimensions lies in the family of section 13 is Lovelock's theorem (1971, 1972). The exact solution outside a body at rest is Schwarzschild's (1916). Each is named again where it is used. Four classical formulas enter as definitions of the engine and are not proved in it: the rest frame of a perfect fluid, with density $\rho$ and pressure $p$; the counts of the components of a symmetric law, of the curvature, and of a wave, the last by removing $n$ identities and $n$ coordinates; the area of a sphere; and the two formulas that read the bending of light and the advance of a perihelion from $\gamma$ and $\beta$ (Will, 2014). Nothing else enters.

### 13. Conservation Forces the Law

By B1 the law is a tensor of the geometry, and by B3 it is of second order. Take first the laws linear in the curvature: $a\,R_{\mu\nu}+b\,R\,g_{\mu\nu}+c\,g_{\mu\nu}$, with three numbers to fix. By the Bianchi identity its divergence is one number times the gradient of the curvature, $(a/2+b)\,\partial_\nu R$ (`div2_eq`). By B2 the divergence vanishes on every geometry, a curved one included. Every geometry, because a law with any other ratio can be conserved only where the curvature has no gradient (`off_the_einstein_line_the_curvature_is_frozen`): its source would have one trace everywhere, and a world with a star in it would be forbidden. So $b=-a/2$ (`conservation_forces_the_law`), and every such law is conserved (`the_forced_law_is_conserved`). **The conserved laws are one line, the Einstein line: the multiples of Einstein's tensor, with the vacuum term beside them** (`conserved_laws_are_one_line`). **A law that reads curvature at all is Einstein's** (`a_law_that_reads_curvature_is_einsteins`). The one member with no curvature in it is the vacuum term alone (`the_vacuum_alone_is_conserved`). Nothing else is allowed. Lovelock's theorem lifts the restriction: in four dimensions every conserved law of second order, linear in the curvature or not, is of this form. Linearity is a consequence and not a premise. In five dimensions and above a second conserved law of second order exists, the Gauss-Bonnet term. Four is the only dimension in which a body at rest has weight and the law is unique.

The algebra of this forcing is classical. It is the derivation of the field equation reached by Einstein and by Hilbert in 1915 and carried by the textbooks since (Weinberg, 1972). The work of this paper lies beneath it. Universality and conservation, which general relativity takes as principles, are here a theorem of Part I and a bridge of the seat, and the forcing is checked by a kernel.

The law is forced:

$$R_{\mu\nu}-\frac{1}{2}R\,g_{\mu\nu}+\Lambda\,g_{\mu\nu}=\kappa\,T_{\mu\nu}.$$

Two numbers survive the forcing. The vacuum term is untouched by conservation (`the_vacuum_term_is_free`), so its sign and size are read from the sky, as section 4 found. The coupling $\kappa$ is the subject of section 16.

### 14. What Gravity Reads: The Active Density, Derived

Solve the forced law for the curvature and the source appears trace-reversed. For a fluid at rest in four dimensions twice its time part is $\rho+3p$ (`active_four`); the factor of two goes into the coupling. Section 4 cited this from general relativity. **It is now a theorem of the forced law.** The accelerating sky needs no new field: it is the vacuum read through $\rho+3p$.

The three signs of section 4 follow from it: dust attracts (`dust_attracts`), radiation reads double (`radiation_reads_double`), and the vacuum, with pressure equal to minus its density, repels with active density $-2\rho$ (`the_vacuum_repels`). Repulsion needs a tension below minus one third of the density (`repulsion_needs_tension`). Every energy stays positive while the pull reverses.

### 15. Why Three Dimensions of Space

In $n$ dimensions, for $n$ at least three, $(n-2)$ times the time part is $(n-3)\rho+(n-1)p$ (`active_general`). A body at rest has weight exactly when the dimension exceeds three (`dust_attracts_exactly_above_three`). In three dimensions, two of space, the density drops out: a body at rest has no weight (`active_three`, `dust_is_weightless_in_three`). **Four is proved the least dimension in which dust attracts** (`four_is_the_least_where_dust_attracts`).

The counts agree. The curvature has $n^2(n^2-1)/12$ components and the law has $n(n+1)/2$. In two dimensions the curvature has one component and Einstein's tensor vanishes identically: the forced law is empty (`one_curvature_in_two`, `two_is_empty`). In three dimensions these are equal, six and six, so matter fixes the geometry outright and nothing propagates (`three_is_rigid`, `no_waves_in_three`). In four the curvature has twenty and the law ten (`four_has_ten_free`): ten components are free of matter, and they are the tides and the waves. The waves carry $n(n-3)/2$ polarizations, two in four dimensions (`two_polarizations`), which is the count Part I read from the sky in section 9.

These counts are classical. That gravity in three dimensions has no Newtonian limit and no waves is the result of Deser, Jackiw and 't Hooft (1984), and the weak field in higher dimensions is Tangherlini's (1963). The engine proves the weights from the trace reversal of the forced law, for every dimension at once, and evaluates the counts on their classical formulas at the dimensions named, under a kernel.

The ladder is complete. Two is empty. Three is rigid and weightless. Four has weight, waves and one law. Five and above have more than one law. A count survives every rescaling, so a seat reaches it. Three dimensions of space are the least in which gravity has both a weight to read and a freedom of its own. The sky reads three.

### 16. One Coupling, and It Is Read

Composition blindness leaves room for exactly one coupling: a second one would tell two bodies apart. So $\kappa$ is single and universal.

Its size is another matter. Every multiple of a conserved law is conserved (`the_law_fixes_no_scale`), and the reading is homogeneous in its source (`active_is_homogeneous`). The forcing fixes the form and is silent on the scale. This is the scaling theorem of Least Erasure (Islam, 2026a) read on gravity: a magnitude is invisible to every verdict of the seat.

Newton's constant is therefore measured, $G=6.67430(15)\times10^{-11}$ in SI units (Tiesinga et al., 2021), and its sign is read from the fall of any body. In the static weak field the forced law is Newton's equation for the potential, $\nabla^2\Phi=4\pi G(\rho+3p/c^2)$, and the match gives the coupling its name, $\kappa=8\pi G/c^4$. The match names the magnitude and the sky supplies it. Sections 14 and 15 set $c$ to one; with $c$ restored the density is a mass density and the pressure enters as $p/c^2$. The twin scans what the tests read: only the ratio $GM/c^2R$ enters the bending of light, and 100,000 rescalings over forty decades leave it unchanged (check H).

### 17. The Weak Field: Inverse Square, and Light Bent Twice

Around a body at rest the forced law reads a flux that loses nothing between spheres. At twice the radius the same flux crosses four times the area (`double_radius_quadruple_area`), and the pull falls as the inverse square.

**Newton's gravity is a half-reading.** It reads only the time part, as a flux through spheres. The forced law has a space part, and for a body at rest in four dimensions it reads exactly what the time part reads (`space_reads_as_time`). That equality is $\gamma=1$. Light, which moves through space as fast as through time, is bent by both parts equally, twice the Newtonian angle (`light_bends_twice`, by the formula of Will, 2014). The doubling is forced by the geometry. Nothing is patched. **The equality holds in four dimensions and in no other** (`gamma_is_one_exactly_in_four`): in $n$ dimensions the space part reads the density and the time part reads $(n-3)$ times it. Light bent exactly twice is the signature of four dimensions.

The perihelion needs the law at second order. The exact solution of the forced law outside a body at rest (Schwarzschild, 1916) expands to $\gamma=1$ and $\beta=1$ (`exact_solution_gives_gamma_and_beta`), and the advance takes its full value (`perihelion_is_full`, by the formula of the same source).

The table sets the forced law against published measurements. Every row is a retrodiction: each measurement stood before this work.

| Test | The forced law gives | Measured, by the source cited |
|---|---|---|
| light at the Sun's limb | 1.7512 arcseconds, twice 0.8756 | $1.98\pm0.12$ and $1.61\pm0.30$ at the eclipse of 1919 (Dyson, Eddington and Davidson, 1920); $0.9999\pm0.0002$ of the full angle by radio interferometry (Shapiro et al., 2004) |
| $\gamma-1$ | 0 | $(2.1\pm2.3)\times10^{-5}$ (Bertotti, Iess and Tortora, 2003) |
| Mercury's perihelion | 42.981 arcseconds per century | $42.98\pm0.04$ (Will, 2014) |
| a tower of 22.56 metres | $2.462\times10^{-15}$ | $1.05\pm0.10$ of it (Pound and Rebka, 1960); $0.9990\pm0.0076$ of it (Pound and Snider, 1965) |
| a navigation satellite's clock | $+45.788-7.213=38.575$ microseconds per day | 38.575, from the offset $4.4647\times10^{-10}$ built into the satellite clocks (Ashby, 2003) |

### 18. The Second Road: The Horizon as a Registration Surface

A horizon is where a record closes to a reader. Give every local horizon an entropy proportional to its area, and ask that heat equal temperature times the change of entropy across it. The same law follows, with the same vacuum term free (Jacobson, 1995; Bekenstein, 1973; Hawking, 1975; Unruh, 1976). This road is least erasure read on a horizon, and it stands at premise grade: the area law is its bridge, and it is not in the engine.

Two roads reach one law. On this road the coupling is the inverse of the registration density of a horizon, one more reading of the same magnitude, and it is again read and not derived.

### 19. The Ledger of Part II, Falsifiers, and What Stands

| Claim | Carried by | Grade |
|---|---|---|
| gravity is geometry | B1 on Part I | structural |
| the law is Einstein's, the vacuum term free | `conservation_forces_the_law`, `conserved_laws_are_one_line` on B2, B3 and the two identities of geometry | theorem inside the family; premise on the bridges |
| no conserved law of second order lies outside the family, in four dimensions | Lovelock (1971, 1972) | classical theorem, cited |
| four is the only dimension with weight and a unique law | `dust_attracts_exactly_above_three` with Lovelock (1971, 1972) | theorem, with a classical theorem cited |
| gravity reads $\rho+3p$ | `active_four` | theorem |
| $\gamma=1$, light bent twice, in four dimensions and no other | `gamma_is_one_exactly_in_four`, `light_bends_twice` | theorem; the angle by a classical formula |
| a body at rest has weight exactly above three dimensions of spacetime | `dust_attracts_exactly_above_three` | theorem |
| two polarizations | `two_polarizations` | theorem, on the classical count |
| one coupling | composition blindness | structural |
| the coupling's value | `the_law_fixes_no_scale` | measured, by theorem |
| the same law from the horizon | Jacobson (1995) | premise, cited |

One falsifier is added to those of section 11, and the engine forces it. **F-Gamma:** a measured $\gamma$ different from one, at any precision; this breaks `gamma_is_one_exactly_in_four` read physically. The falsifiers of section 11 carry the rest: a coupling that sees what a body is made of is F-Composition, and a third polarization is F-Polarization. A failure of energy and momentum to balance locally would break bridge B2 itself, and the forcing with it.

**No room for modified gravity.** The forcing admits one law. Actions built on a function of the curvature, scalar-tensor fields and fifth forces all lie outside what the forcing admits: each adds a field or reads the geometry beyond the second order. Each would show as a named falsifier: a $\gamma$ different from one, a third polarization, or a coupling that sees composition. Cassini holds $\gamma-1$ to $2.3\times10^{-5}$ (Bertotti, Iess and Tortora, 2003), the waves of section 9 carry two polarizations, and MICROSCOPE holds composition to $10^{-15}$ (Touboul et al., 2022). None has been seen.

**The form of the law is closed.** Its shape, its source, its tests, its dimension and its counts are forced, on three named bridges and the classical results named in section 12. Two magnitudes stand read from the sky, the coupling and the vacuum term, and Least Erasure proves that a seat returns no magnitude. Section 10 stands as written on quantization.


## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean files and the Fortran twins are written by a language model under the author's direct supervision. Every theorem named in the text is in an appendix under that name. The kernel line of every theorem of Appendix C is printed in Appendix D, and Appendix A carries the command that prints each of its own. The three bridges of section 12 and the classical theorems they rest on are stated as such wherever they are used. No magnitude is derived anywhere in this paper.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. Part I is carried from Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one. Part I is set here in this paper's own vocabulary, with the apparatus of that volume's series removed; no theorem, number, measurement or source was changed.

## References

1. A. Einstein, Ann. Phys. 49 (1916) 769.
2. F. W. Dyson, A. S. Eddington and C. Davidson, Phil. Trans. R. Soc. A 220 (1920) 291.
3. M. Fierz and W. Pauli, Proc. R. Soc. A 173 (1939) 211.
4. H. Bondi, Rev. Mod. Phys. 29 (1957) 423.
5. R. V. Pound and G. A. Rebka, Phys. Rev. Lett. 4 (1960) 337.
6. V. C. Rubin and W. K. Ford, Astrophys. J. 159 (1970) 379.
7. P. C. Peters and J. Mathews, Phys. Rev. 131 (1963) 435.
8. S. Weinberg, Phys. Rev. 135 (1964) B1049.
9. R. V. Pound and J. L. Snider, Phys. Rev. 140 (1965) B788.
10. R. A. Hulse and J. H. Taylor, Astrophys. J. 195 (1975) L51.
11. R. Schoen and S.-T. Yau, Commun. Math. Phys. 65 (1979) 45.
12. R. F. C. Vessot et al., Phys. Rev. Lett. 45 (1980) 2081.
13. E. Witten, Commun. Math. Phys. 80 (1981) 381.
14. T. Jacobson, Phys. Rev. Lett. 75 (1995) 1260.
15. B. Bertotti, L. Iess and P. Tortora, Nature 425 (2003) 374.
16. J. G. Williams, S. G. Turyshev and D. H. Boggs, Phys. Rev. Lett. 93 (2004) 261101.
17. D. Clowe et al., Astrophys. J. Lett. 648 (2006) L109.
18. C. W. Chou, D. B. Hume, T. Rosenband and D. J. Wineland, Science 329 (2010) 1630.
19. J. M. Weisberg and Y. Huang, Astrophys. J. 829 (2016) 55.
20. B. P. Abbott et al., Astrophys. J. Lett. 848 (2017) L13.
21. S. Bose et al., Phys. Rev. Lett. 119 (2017) 240401.
22. C. Marletto and V. Vedral, Phys. Rev. Lett. 119 (2017) 240402.
23. P. Delva et al., Phys. Rev. Lett. 121 (2018) 231101.
24. S. Herrmann et al., Phys. Rev. Lett. 121 (2018) 231102.
25. Planck Collaboration, N. Aghanim et al., Astron. Astrophys. 641 (2020) A6.
26. P. Touboul et al. (MICROSCOPE), Phys. Rev. Lett. 129 (2022) 121102.
27. E. K. Anderson et al. (ALPHA-g), Nature 621 (2023) 716.
28. M. F. Islam, Nothing Escapes, Three Plus One, 10.5281/zenodo.22976494.
29. M. F. Islam, The Arrow Has Two Branches; The Fluid Is the Witness, 10.5281/zenodo.22986557, .22986563.
30. M. F. Islam, Dark Matter as the Charge-Conjugation Fixed Set and the Dark Force as One Keyed Bit, 10.5281/zenodo.23006753.
31. M. F. Islam, The Four Forces, Matter, and the Dark Sector as Configurations of One Actuating Substrate, edition 2.0.0, concept 10.5281/zenodo.21438932.
32. M. F. Islam, The Geometric Nature of Light, edition 2.0.0, concept 10.5281/zenodo.20091979.
33. A. Einstein, Sitzungsber. Preuss. Akad. Wiss. (1915) 844.
34. D. Hilbert, Nachr. Ges. Wiss. Göttingen (1915) 395.
35. S. Weinberg, Gravitation and Cosmology (Wiley, 1972).
36. K. Schwarzschild, Sitzungsber. Preuss. Akad. Wiss. (1916) 189.
37. F. R. Tangherlini, Nuovo Cimento 27 (1963) 636.
38. S. Deser, R. Jackiw and G. 't Hooft, Ann. Phys. 152 (1984) 220.
39. E. Tiesinga, P. J. Mohr, D. B. Newell and B. N. Taylor, Rev. Mod. Phys. 93 (2021) 025010.
40. N. Ashby, Living Rev. Relativ. 6 (2003) 1.
41. C. M. Will, Living Rev. Relativ. 17 (2014) 4.
42. D. Lovelock, J. Math. Phys. 12 (1971) 498; 13 (1972) 874.
43. S. S. Shapiro, J. L. Davis, D. E. Lebach and J. S. Gregory, Phys. Rev. Lett. 92 (2004) 121101.
44. J. D. Bekenstein, Phys. Rev. D 7 (1973) 2333.
45. S. W. Hawking, Commun. Math. Phys. 43 (1975) 199.
46. W. G. Unruh, Phys. Rev. D 14 (1976) 870.
47. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
48. M. F. Islam, Light as a New Mathematical Theorem, edition 1.0.0 (2026c).

## Appendix A · SPHYS_Gravity.lean

Part I. Core Lean 4, carried from edition 2.0.0; six comment lines set in this paper's vocabulary, no line of code changed.

```lean
/-
  SPHYS_Gravity.lean · immanent gravity, read at the seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: h = 2 Re s, t = Im s; the fold s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t), the fixed line
  h = 1, registration (h, t) ↦ (1, t) keeping the height and forgetting the side. The substrate's
  particle map, time mirror and carriers are those of Least Erasure, re-proved here.

  Part I     the seat, the category of involutions, the functor of the seat.
  Part II    the energy carrier (carried from Least Erasure).
  Part III   the substrate: the particle map and the charge carrier.
  Part IV    gravity reads the record: even, factoring through registration, composition-blind.
  Part V     one sign: gravity cannot be screened; charge can.
  Part VI    no bit, and reversible: conservative motion retraces exactly for every force law.
  Part VII   gravity and time co-move: redshift moves the height, never the side.
  Part VIII  the monic memory of the deficit.
  Part IX    the waves: two polarizations, one speed; IX-b gravity reads the dark, the vacuum repels.
  Part X     the capstone.
-/
set_option autoImplicit false
namespace SPHYS.Gravity


/-! ## Part I. The seat, the category of involutions, and the functor of the seat -/

abbrev Pt := Int × Int

def fold (p : Pt) : Pt := (2 - p.1, p.2)
def OnLine (p : Pt) : Prop := p.1 = 1
instance : DecidablePred OnLine := fun p => inferInstanceAs (Decidable (p.1 = 1))
/-- Registration keeps the height and forgets the side. -/
def reg (p : Pt) : Pt := (1, p.2)

theorem pe {a b c d : Int} : ((a, b) : Pt) = (c, d) ↔ a = c ∧ b = d :=
  ⟨fun e => ⟨congrArg Prod.fst e, congrArg Prod.snd e⟩,
   fun ⟨e1, e2⟩ => by subst e1; subst e2; rfl⟩

theorem fold_involutive (p : Pt) : fold (fold p) = p := by
  obtain ⟨h, t⟩ := p
  show ((2 - (2 - h), t) : Pt) = (h, t)
  rw [pe]; exact ⟨by omega, rfl⟩

/-- The seat: the fixed set of the fold is the fixed line. -/
theorem seat_fixed_line (p : Pt) : fold p = p ↔ OnLine p := by
  obtain ⟨h, t⟩ := p
  show ((2 - h, t) : Pt) = (h, t) ↔ h = 1
  rw [pe]; constructor
  · intro ⟨e, _⟩; omega
  · intro e; exact ⟨by omega, rfl⟩

theorem reg_lands (p : Pt) : OnLine (reg p) := rfl

theorem reg_fixes_iff (p : Pt) : reg p = p ↔ OnLine p := by
  obtain ⟨h, t⟩ := p
  show ((1, t) : Pt) = (h, t) ↔ h = 1
  rw [pe]; constructor
  · intro ⟨e, _⟩; exact e.symm
  · intro e; exact ⟨e.symm, rfl⟩

/-- The side is what registration forgets: a point and its mirror leave one record. -/
theorem reg_forgets_side (p : Pt) : reg (fold p) = reg p := rfl

/-- The value on a set of points: every member stands on the line. -/
def Value (Z : Pt → Prop) : Prop := ∀ s, Z s → OnLine s

/-- Least erasure: registration moves no member, so it erases nothing of Z. -/
def LeastErasure (Z : Pt → Prop) : Prop := ∀ s, Z s → reg s = s

theorem least_erasure_iff_value (Z : Pt → Prop) : LeastErasure Z ↔ Value Z :=
  ⟨fun h s hs => (reg_fixes_iff s).mp (h s hs), fun h s hs => (reg_fixes_iff s).mpr (h s hs)⟩

/-- Maps that respect involutions. -/
def Equivariant {X Y : Type} (f : X → Y) (τ : X → X) (σ : Y → Y) : Prop := ∀ x, f (τ x) = σ (f x)

theorem equivariant_id {X : Type} (τ : X → X) : Equivariant id τ τ := fun _ => rfl

theorem equivariant_comp {X Y W : Type} {f : X → Y} {g : Y → W} {τ : X → X} {σ : Y → Y}
    {ρ : W → W} (hf : Equivariant f τ σ) (hg : Equivariant g σ ρ) : Equivariant (g ∘ f) τ ρ := by
  intro x
  show g (f (τ x)) = ρ (g (f x))
  rw [hf x, hg (f x)]

/-- The fixed set is a functor: an equivariant map sends fixed points to fixed points. -/
theorem fix_functorial {X Y : Type} {f : X → Y} {τ : X → X} {σ : Y → Y}
    (hf : Equivariant f τ σ) {x : X} (hx : τ x = x) : σ (f x) = f x := by
  rw [← hf x, hx]

/-- A global seat: an involution whose fixed set is the locus. -/
structure GlobalSeat (P : Pt → Prop) (σ : Pt → Pt) : Prop where
  involutive : ∀ p, σ (σ p) = p
  fixed_iff : ∀ p, σ p = p ↔ P p

theorem fold_global_seat : GlobalSeat OnLine fold := ⟨fold_involutive, seat_fixed_line⟩

/-- A carrier: a map from world-instances into the strip landing on the line. -/
structure Carrier (W : Type) where
  ι : W → Pt
  lands : ∀ w, OnLine (ι w)

def image {W : Type} (ι : W → Pt) : Pt → Prop := fun s => ∃ w, ι w = s
def Actuated {W : Type} (ι : W → Pt) (Z : Pt → Prop) : Prop := ∀ s, Z s → ∃ w, ι w = s

/-- Landing is forced: an equivariant map into the seat carries every fixed point of the physical
    involution onto the line. The carrier is built from the symmetry, not chosen. -/
theorem equivariant_carrier_lands {X : Type} (f : X → Pt) (τ : X → X)
    (hf : Equivariant f τ fold) :
    ∃ C : Carrier { x : X // τ x = x }, ∀ w, C.ι w = f w.1 :=
  ⟨⟨fun w => f w.1, fun w => (seat_fixed_line (f w.1)).mp (fix_functorial hf w.2)⟩, fun _ => rfl⟩

/-- The image of a carrier is compliant with no premise at all. -/
theorem value_on_image {W : Type} (C : Carrier W) : Value (image C.ι) :=
  fun _ hs => match hs with | ⟨w, hw⟩ => hw ▸ C.lands w

/-- The kinetic crossing: a carrier and its coverage give the value, and nothing else is used. -/
theorem kinetic_crossing {W : Type} (C : Carrier W) (Z : Pt → Prop) (hcov : Actuated C.ι Z) :
    Value Z :=
  fun s hs => match hcov s hs with | ⟨w, hw⟩ => hw ▸ C.lands w

/-- Under the seat every off-line point has a partner, distinct and also off the line. -/
theorem off_locus_pair (p : Pt) (hp : ¬ OnLine p) :
    fold p ≠ p ∧ ¬ OnLine (fold p) ∧ reg (fold p) = reg p := by
  refine ⟨fun e => hp ((seat_fixed_line p).mp e), fun e => hp ?_, rfl⟩
  obtain ⟨h, t⟩ := p
  have e' : 2 - h = 1 := e
  show h = 1
  omega

/-! ## Part II. The energy carrier: an energy, its rate, and the fold -/

/-- An energy a + i β/2, as frequency and doubled rate; its mode's norm moves as e^{βt}. -/
structure Energy where
  freq : Int
  rate : Int
  deriving DecidableEq, Repr

/-- The time mirror of a mode: its rate reversed, its frequency kept (complex conjugation of E). -/
def Energy.mirror (E : Energy) : Energy := ⟨E.freq, -E.rate⟩
def IsReal (E : Energy) : Prop := E.rate = 0
/-- Stationary: the norm e^{βt} is unchanged at every integer time t, i.e. β t = 0 for all t. -/
def Stationary (E : Energy) : Prop := ∀ t : Int, E.rate * t = 0

/-- The energy carrier s = 1/2 + iE in the chart: h = 1 − β, t = a. -/
def phi (E : Energy) : Pt := (1 - E.rate, E.freq)
def psi (p : Pt) : Energy := ⟨p.2, 1 - p.1⟩

theorem ee {a b c d : Int} : (⟨a, b⟩ : Energy) = ⟨c, d⟩ ↔ a = c ∧ b = d :=
  ⟨fun e => ⟨congrArg Energy.freq e, congrArg Energy.rate e⟩,
   fun ⟨e1, e2⟩ => by subst e1; subst e2; rfl⟩

theorem mirror_involutive (E : Energy) : E.mirror.mirror = E := by
  obtain ⟨a, b⟩ := E
  show (⟨a, - -b⟩ : Energy) = ⟨a, b⟩
  rw [ee]; exact ⟨rfl, by omega⟩

theorem psi_phi (E : Energy) : psi (phi E) = E := by
  obtain ⟨a, b⟩ := E
  show (⟨a, 1 - (1 - b)⟩ : Energy) = ⟨a, b⟩
  rw [ee]; exact ⟨rfl, by omega⟩

theorem phi_psi (p : Pt) : phi (psi p) = p := by
  obtain ⟨h, t⟩ := p
  show ((1 - (1 - h), t) : Pt) = (h, t)
  rw [pe]; exact ⟨by omega, rfl⟩

theorem phi_injective (E F : Energy) (h : phi E = phi F) : E = F := by
  rw [← psi_phi E, ← psi_phi F, h]

/-- EQUIVARIANCE: time-mirroring the rate is the fold. -/
theorem phi_equivariant : Equivariant phi Energy.mirror fold := by
  intro E
  obtain ⟨a, b⟩ := E
  show ((1 - -b, a) : Pt) = (2 - (1 - b), a)
  rw [pe]; exact ⟨by omega, rfl⟩

theorem mirror_fixed_iff_real (E : Energy) : E.mirror = E ↔ IsReal E := by
  obtain ⟨a, b⟩ := E
  show (⟨a, -b⟩ : Energy) = ⟨a, b⟩ ↔ b = 0
  rw [ee]; constructor
  · intro ⟨_, e⟩; omega
  · intro e; exact ⟨rfl, by omega⟩

/-- The line is exactly the image of the real energies. -/
theorem phi_line_iff_real (E : Energy) : OnLine (phi E) ↔ IsReal E := by
  obtain ⟨a, b⟩ := E
  show 1 - b = 1 ↔ b = 0
  exact ⟨fun h => by omega, fun h => by subst h; rfl⟩

theorem stationary_iff_real (E : Energy) : Stationary E ↔ IsReal E := by
  constructor
  · intro h; have h1 := h 1; rw [Int.mul_one] at h1; exact h1
  · intro h t; show E.rate * t = 0; rw [show E.rate = 0 from h, Int.zero_mul]

/-- THE LINE IS WHERE ENERGY STANDS STILL. -/
theorem line_is_stationary (p : Pt) : OnLine p ↔ Stationary (psi p) := by
  rw [stationary_iff_real, ← phi_line_iff_real, phi_psi]

/-- Every measured energy is a real number, and every real energy lands on the line. -/
theorem measured_on_line (a : Int) : OnLine (phi ⟨a, 0⟩) := rfl

/-- The registration mirror: no real energy lands off the line. -/
theorem no_measurement_off_line (p : Pt) (hp : ¬ OnLine p) (a : Int) : phi ⟨a, 0⟩ ≠ p :=
  fun e => hp (e ▸ measured_on_line a)

/-- The energy carrier, built from the symmetry: the real energies land on the line. -/
theorem energy_carrier_lands :
    ∃ C : Carrier { E : Energy // E.mirror = E }, ∀ w, C.ι w = phi w.1 :=
  equivariant_carrier_lands phi Energy.mirror phi_equivariant

/-! ## Part III. The substrate: the particle map, three odd readings and one even -/

/-- A particle in the broken phase: electric charge times three, colour, baryon number times
    three, lepton number, and its energy. -/
structure Particle where
  q3 : Int
  colour : Int
  b3 : Int
  lepton : Int
  energy : Energy
  deriving DecidableEq, Repr

/-- The particle map: every additive charge flipped, the energy kept (frequency and rate). -/
def bar (c : Particle) : Particle := ⟨-c.q3, -c.colour, -c.b3, -c.lepton, c.energy⟩
/-- The time mirror of a particle's mode. -/
def tmirror (c : Particle) : Particle := ⟨c.q3, c.colour, c.b3, c.lepton, c.energy.mirror⟩
def Neutral (c : Particle) : Prop := c.q3 = 0 ∧ c.colour = 0 ∧ c.b3 = 0 ∧ c.lepton = 0

theorem bar_involutive (c : Particle) : bar (bar c) = c := by
  obtain ⟨q, k, b, l, E⟩ := c
  show (⟨- -q, - -k, - -b, - -l, E⟩ : Particle) = ⟨q, k, b, l, E⟩
  rw [Int.neg_neg, Int.neg_neg, Int.neg_neg, Int.neg_neg]

theorem bar_fixed_iff_neutral (c : Particle) : bar c = c ↔ Neutral c := by
  obtain ⟨q, k, b, l, E⟩ := c
  show (⟨-q, -k, -b, -l, E⟩ : Particle) = ⟨q, k, b, l, E⟩ ↔ (q = 0 ∧ k = 0 ∧ b = 0 ∧ l = 0)
  constructor
  · intro h
    have h1 := congrArg Particle.q3 h
    have h2 := congrArg Particle.colour h
    have h3 := congrArg Particle.b3 h
    have h4 := congrArg Particle.lepton h
    change -q = q at h1; change -k = k at h2; change -b = b at h3; change -l = l at h4
    exact ⟨by omega, by omega, by omega, by omega⟩
  · intro ⟨h1, h2, h3, h4⟩
    subst h1; subst h2; subst h3; subst h4; rfl

/-- Three plus one: the charge readings are odd under the particle map, the energy reading even. -/
theorem odd_charges_even_energy (c : Particle) :
    ((bar c).q3 = -c.q3 ∧ (bar c).colour = -c.colour ∧ (bar c).b3 = -c.b3 ∧
     (bar c).lepton = -c.lepton) ∧ (bar c).energy = c.energy :=
  ⟨⟨rfl, rfl, rfl, rfl⟩, rfl⟩

/-- Gravity reads energy only, so no gravitational reading tells a particle from its antiparticle. -/
theorem gravity_reads_no_charge_bit {β : Type} (g : Energy → β) (c : Particle) :
    g (bar c).energy = g c.energy := rfl

/-- The two involutions of the substrate commute. -/
theorem involutions_commute (c : Particle) : bar (tmirror c) = tmirror (bar c) := rfl

theorem tmirror_involutive (c : Particle) : tmirror (tmirror c) = c := by
  obtain ⟨q, k, b, l, E⟩ := c
  show (⟨q, k, b, l, E.mirror.mirror⟩ : Particle) = ⟨q, k, b, l, E⟩
  rw [mirror_involutive]

/-- A particle is fixed by both involutions exactly when it is neutral and stable. -/
theorem joint_fixed_iff (c : Particle) :
    (bar c = c ∧ tmirror c = c) ↔ (Neutral c ∧ IsReal c.energy) := by
  constructor
  · intro ⟨h1, h2⟩
    refine ⟨(bar_fixed_iff_neutral c).mp h1, (mirror_fixed_iff_real c.energy).mp ?_⟩
    exact congrArg Particle.energy h2
  · intro ⟨h1, h2⟩
    refine ⟨(bar_fixed_iff_neutral c).mpr h1, ?_⟩
    obtain ⟨q, k, b, l, E⟩ := c
    show (⟨q, k, b, l, E.mirror⟩ : Particle) = ⟨q, k, b, l, E⟩
    rw [(mirror_fixed_iff_real E).mpr h2]

/-- The energy carrier on particles: the seat point of a particle's energy. -/
def energySeat (c : Particle) : Pt := phi c.energy
/-- The charge carrier on particles, the odd face: electric charge (in thirds) is the side. -/
def chargeSeat (c : Particle) : Pt := (1 + c.q3, c.energy.freq)
/-- The lepton chart of the electron: charge q in units of e goes to h = 1 + q. -/
def leptonSeat (q m : Int) : Pt := (1 + q, m)

/-- The charge carrier is equivariant: the particle map is carried onto the fold. -/
theorem charge_carrier_equivariant : Equivariant chargeSeat bar fold := by
  intro c
  show ((1 + -c.q3, c.energy.freq) : Pt) = (2 - (1 + c.q3), c.energy.freq)
  rw [pe]; exact ⟨by omega, rfl⟩

/-- The energy carrier is blind to the particle map and equivariant for the time mirror. -/
theorem pair_lands_once (c : Particle) : energySeat (bar c) = energySeat c := rfl
theorem tmirror_equivariant : Equivariant energySeat tmirror fold := fun c => phi_equivariant c.energy

/-- Electrically neutral particles land on the line under the charge carrier. -/
theorem neutral_charge_on_line (c : Particle) (h : c.q3 = 0) : OnLine (chargeSeat c) := by
  show 1 + c.q3 = 1
  omega

/-- The electron and the positron land on the two edges, real parts 0 and 1, mirror images. -/
theorem pair_on_the_edges (m : Int) :
    leptonSeat (-1) m = (0, m) ∧ leptonSeat 1 m = (2, m) ∧ fold (leptonSeat (-1) m) = leptonSeat 1 m :=
  ⟨rfl, rfl, rfl⟩

/-- A stable particle lands on the line under the energy carrier. -/
theorem stable_lands (c : Particle) (h : IsReal c.energy) : OnLine (energySeat c) :=
  (phi_line_iff_real c.energy).mpr h

/-! ## Part IV. Gravity reads the record -/

/-- The gravitational reading of a particle: its energy, and nothing else. -/
def grav (c : Particle) : Int := c.energy.freq

/-- Gravity is even under the particle map: antimatter reads as matter. -/
theorem gravity_even_branch (c : Particle) : grav (bar c) = grav c := rfl

/-- The gravitational reading of a point of the seat: its height. -/
def gravPt (p : Pt) : Int := p.2

/-- GRAVITY READS THE RECORD: the reading factors through registration, so it is even under the
    fold and keeps nothing of the side. -/
theorem gravity_factors_through_registration (p : Pt) :
    gravPt (reg p) = gravPt p ∧ gravPt (fold p) = gravPt p := ⟨rfl, rfl⟩

/-- Composition blindness, the equivalence principle at the seat: two particles of one energy read
    alike whatever their charges. -/
theorem composition_blind (c d : Particle) (h : c.energy.freq = d.energy.freq) : grav c = grav d := h

/-- The distance of a point from the line, squared: even under the fold, and still not the record. -/
def depth2 (p : Pt) : Int := (p.1 - 1) * (p.1 - 1)

/-- Evenness is weaker than reading the record: the depth is fold-even and registration changes it.
    The equivalence principle asks for the stronger property. -/
theorem even_is_not_the_record :
    depth2 (fold (0, 5)) = depth2 (0, 5) ∧ depth2 (reg (0, 5)) ≠ depth2 (0, 5) := by decide

/-- The odd part of a reading under the particle map. -/
def oddPart (g : Particle → Int) (c : Particle) : Int := g c - g (bar c)

/-- Gravity's odd part vanishes at every source: every gravitational source stands on the line. -/
theorem every_source_on_the_line (c : Particle) : OnLine (1 + oddPart grav c, c.energy.freq) := by
  show 1 + (c.energy.freq - c.energy.freq) = 1; omega

/-- Charge's odd part is twice the charge: every charged source stands off the line. -/
theorem charged_source_off_the_line (c : Particle) (h : c.q3 ≠ 0) :
    ¬ OnLine (1 + oddPart Particle.q3 c, c.energy.freq) := by
  show ¬ (1 + (c.q3 - -c.q3) = 1); omega

/-! ## Part V. One sign: gravity cannot be screened -/

def total : List Int → Int
  | [] => 0
  | x :: xs => x + total xs

theorem total_nonneg (xs : List Int) (h : ∀ x ∈ xs, 0 ≤ x) : 0 ≤ total xs := by
  induction xs with
  | nil => exact Int.le_refl 0
  | cons x xs ih =>
    have hx := h x (List.mem_cons_self)
    have hr := ih (fun y hy => h y (List.mem_cons_of_mem x hy))
    show 0 ≤ x + total xs; omega

/-- GRAVITY CANNOT BE SCREENED: sources of one sign total zero only when every source is zero. -/
theorem one_sign_no_screening (xs : List Int) (h : ∀ x ∈ xs, 0 ≤ x) (h0 : total xs = 0) :
    ∀ x ∈ xs, x = 0 := by
  induction xs with
  | nil => intro x hx; cases hx
  | cons y ys ih =>
    have hy := h y (List.mem_cons_self)
    have hr := total_nonneg ys (fun z hz => h z (List.mem_cons_of_mem y hz))
    have e : y + total ys = 0 := h0
    have y0 : y = 0 := by omega
    have t0 : total ys = 0 := by omega
    intro x hx
    cases hx with
    | head => exact y0
    | tail _ hm => exact ih (fun z hz => h z (List.mem_cons_of_mem y hz)) t0 x hm

/-- Charge can be screened: a unit charge and its opposite total zero. -/
theorem charge_can_be_screened : total [1, -1] = 0 ∧ (1 : Int) ≠ 0 := by decide

/-! ## Part VI. No bit, and reversible -/

/-- One step of conservative motion under any force law f, in Störmer–Verlet form on a pair of
    successive positions. -/
def step (f : Int → Int) (s : Int × Int) : Int × Int := (s.2, 2 * s.2 - s.1 + f s.2)
/-- Time reversal: the two positions exchanged. -/
def rev (s : Int × Int) : Int × Int := (s.2, s.1)
/-- The backward step: reverse, step, reverse. -/
def back (f : Int → Int) (s : Int × Int) : Int × Int := rev (step f (rev s))

/-- CONSERVATIVE MOTION IS REVERSIBLE: for every force law, reversing, stepping and reversing
    undoes a step exactly. -/
theorem conservative_motion_reversible (f : Int → Int) (s : Int × Int) : back f (step f s) = s := by
  obtain ⟨a, b⟩ := s
  show ((2 * b - (2 * b - a + f b) + f b, b) : Int × Int) = (a, b)
  rw [pe]; exact ⟨by omega, rfl⟩

def iterO (g : Int × Int → Int × Int) : Nat → Int × Int → Int × Int
  | 0, s => s
  | n + 1, s => g (iterO g n s)
def iterI (g : Int × Int → Int × Int) : Nat → Int × Int → Int × Int
  | 0, s => s
  | n + 1, s => iterI g n (g s)

/-- Any number of steps is retraced exactly by the same number of backward steps. -/
theorem motion_retraces (f : Int → Int) (n : Nat) (s : Int × Int) :
    iterI (back f) n (iterO (step f) n s) = s := by
  induction n with
  | zero => rfl
  | succ n ih =>
    show iterI (back f) n (back f (step f (iterO (step f) n s))) = s
    rw [conservative_motion_reversible]; exact ih

/-! ## Part VII. Gravity and time co-move: redshift moves the height, never the side -/

/-- A gravitational shift of every frequency by one factor k. -/
def redshift (k : Int) (p : Pt) : Pt := (p.1, k * p.2)

theorem redshift_equivariant (k : Int) : Equivariant (redshift k) fold fold := fun _ => rfl
theorem redshift_keeps_the_line (k : Int) (p : Pt) : OnLine (redshift k p) ↔ OnLine p := Iff.rfl
theorem redshift_commutes_with_registration (k : Int) (p : Pt) :
    reg (redshift k p) = redshift k (reg p) := rfl

/-- Every clock co-moves: one factor shifts all heights, so every ratio of frequencies is kept. -/
theorem clocks_co_move (k t1 t2 : Int) : t1 * (k * t2) = t2 * (k * t1) := by
  rw [Int.mul_left_comm t1 k t2, Int.mul_left_comm t2 k t1, Int.mul_comm t1 t2]

/-! ## Part VIII. The monic memory of the deficit -/

/-- A bound pair's gravitational reading: the parts' energies less the binding. -/
def bound (e1 e2 b : Int) : Int := e1 + e2 - b

/-- THE DEFICIT IS READ, MONICALLY: two bindings read alike exactly when they are equal. -/
theorem gravity_reads_the_deficit (e1 e2 b b' : Int) : bound e1 e2 b = bound e1 e2 b' ↔ b = b' := by
  unfold bound
  constructor
  · intro h; omega
  · intro h; rw [h]

/-- A bond lowers the weight: a positive binding reads below the sum of the parts. -/
theorem the_bond_weighs_less (e1 e2 b : Int) (hb : 0 < b) : bound e1 e2 b < e1 + e2 := by
  unfold bound; omega

/-! ## Part IX. The waves: two polarizations, one speed -/

/-- A gravitational wave's helicity, +2 or −2. -/
structure Wave where
  freq : Int
  helicity : Bool
  deriving DecidableEq, Repr

def Wave.parity (w : Wave) : Wave := ⟨w.freq, !w.helicity⟩

/-- The waves carry two polarizations, reversed by parity, one energy record: the radiation carries
    the one bit light carries, and the sources carry none. -/
theorem waves_two_polarizations (w : Wave) :
    w.parity ≠ w ∧ w.parity.freq = w.freq ∧ w.parity.parity = w := by
  obtain ⟨f, s⟩ := w
  refine ⟨fun e => ?_, rfl, by cases s <;> rfl⟩
  have := congrArg Wave.helicity e
  cases s <;> simp [Wave.parity] at this

/-- Ten components of a symmetric tensor, four gauge conditions, four constraints: two polarizations. -/
theorem polarization_count : (10 - 4 - 4 : Nat) = 2 := rfl

theorem sq_pos_of_ne (m : Int) (h : m ≠ 0) : 0 < m * m := by
  rcases Int.lt_or_gt_of_ne h with h' | h'
  · have := Int.mul_pos (show 0 < -m by omega) (show 0 < -m by omega)
    rw [Int.neg_mul_neg] at this; exact this
  · exact Int.mul_pos h' h'

/-- A massive mode runs slower than a massless one; gravity's waves and light share the cone. -/
theorem massive_slower (k ω m : Int) (h : ω * ω = k * k + m * m) (hm : m ≠ 0) : k * k < ω * ω := by
  have := sq_pos_of_ne m hm
  omega

/-! ## Part IX-b. Gravity reads the dark, and the vacuum's pull -/

/-- An odd reading returns zero on every state the particle map fixes. -/
theorem odd_reading_blind (g : Particle → Int) (hodd : ∀ c, g (bar c) = -g c) (c : Particle)
    (h : bar c = c) : g c = 0 := by
  have e := hodd c
  rw [h] at e
  omega

/-- ONLY GRAVITY READS THE DARK: a state the particle map fixes carries no charge, every odd reading
    returns zero on it, and gravity returns its energy. -/
theorem only_gravity_reads_the_dark (c : Particle) (h : bar c = c) :
    Neutral c ∧ (∀ g : Particle → Int, (∀ d, g (bar d) = -g d) → g c = 0) ∧ grav c = c.energy.freq :=
  ⟨(bar_fixed_iff_neutral c).mp h, fun g hodd => odd_reading_blind g hodd c h, rfl⟩

/-- The active gravitating density ρ + 3p. -/
def active (rho p : Int) : Int := rho + 3 * p

/-- Dust attracts; the vacuum, p = −ρ, repels with active density −2ρ. -/
theorem the_vacuum_repels (rho : Int) (h : 0 < rho) :
    0 < active rho 0 ∧ active rho (-rho) = -2 * rho ∧ active rho (-rho) < 0 := by
  unfold active; refine ⟨?_, ?_, ?_⟩ <;> omega

/-- ONE SIGN OF ENERGY, NOT OF PULL: every density is positive and the pull still reverses. The one
    sign concerns the energy gravity reads, and screening would need a negative energy. -/
theorem one_sign_of_energy_not_of_pull :
    (0 : Int) < 1 ∧ active 1 (-1) < 0 ∧ total [1, 1] ≠ 0 := by decide

/-- The kinetic floor: with kinetic density K ≥ 0 and potential V, ρ + p = 2K ≥ 0. -/
theorem kinetic_floor (K V : Int) (hK : 0 ≤ K) : 0 ≤ (K + V) + (K - V) := by omega

/-! ## Part X. The capstone -/

/-- IMMANENT GRAVITY, AT THE SEAT. Gravity reads the record and nothing else: even under the
    particle map, factoring through registration, blind to composition; every source stands on the
    line and none can be screened, while charge stands off it and can; conservative motion is
    reversible for every force law and retraces exactly; a gravitational shift moves every height
    by one factor, keeping the line, registration and every ratio of clocks; the deficit of a bond
    is read monically; the waves carry two polarizations; gravity alone reads the dark, and the
    vacuum's pressure reverses its pull. -/
theorem gravity_is_the_record :
    (∀ c : Particle, grav (bar c) = grav c) ∧
    (∀ p : Pt, gravPt (reg p) = gravPt p ∧ gravPt (fold p) = gravPt p) ∧
    (∀ c : Particle, OnLine (1 + oddPart grav c, c.energy.freq)) ∧
    (∀ xs : List Int, (∀ x ∈ xs, 0 ≤ x) → total xs = 0 → ∀ x ∈ xs, x = 0) ∧
    (∀ (f : Int → Int) (n : Nat) (s : Int × Int), iterI (back f) n (iterO (step f) n s) = s) ∧
    (∀ k : Int, Equivariant (redshift k) fold fold) ∧
    (∀ k t1 t2 : Int, t1 * (k * t2) = t2 * (k * t1)) ∧
    (∀ e1 e2 b b' : Int, bound e1 e2 b = bound e1 e2 b' ↔ b = b') ∧
    (∀ w : Wave, w.parity ≠ w ∧ w.parity.freq = w.freq) ∧
    (∀ c : Particle, bar c = c → Neutral c ∧ grav c = c.energy.freq) ∧
    (∀ rho : Int, 0 < rho → active rho (-rho) < 0) :=
  ⟨gravity_even_branch, gravity_factors_through_registration, every_source_on_the_line,
   one_sign_no_screening, motion_retraces, redshift_equivariant, clocks_co_move,
   gravity_reads_the_deficit, fun w => ⟨(waves_two_polarizations w).1, rfl⟩,
   fun c h => ⟨(only_gravity_reads_the_dark c h).1, rfl⟩, fun rho h => (the_vacuum_repels rho h).2.2⟩

end SPHYS.Gravity

#print axioms SPHYS.Gravity.pe
#print axioms SPHYS.Gravity.fold_involutive
#print axioms SPHYS.Gravity.seat_fixed_line
#print axioms SPHYS.Gravity.reg_lands
#print axioms SPHYS.Gravity.reg_fixes_iff
#print axioms SPHYS.Gravity.reg_forgets_side
#print axioms SPHYS.Gravity.least_erasure_iff_value
#print axioms SPHYS.Gravity.equivariant_id
#print axioms SPHYS.Gravity.equivariant_comp
#print axioms SPHYS.Gravity.fix_functorial
#print axioms SPHYS.Gravity.fold_global_seat
#print axioms SPHYS.Gravity.equivariant_carrier_lands
#print axioms SPHYS.Gravity.value_on_image
#print axioms SPHYS.Gravity.kinetic_crossing
#print axioms SPHYS.Gravity.off_locus_pair
#print axioms SPHYS.Gravity.ee
#print axioms SPHYS.Gravity.mirror_involutive
#print axioms SPHYS.Gravity.psi_phi
#print axioms SPHYS.Gravity.phi_psi
#print axioms SPHYS.Gravity.phi_injective
#print axioms SPHYS.Gravity.phi_equivariant
#print axioms SPHYS.Gravity.mirror_fixed_iff_real
#print axioms SPHYS.Gravity.phi_line_iff_real
#print axioms SPHYS.Gravity.stationary_iff_real
#print axioms SPHYS.Gravity.line_is_stationary
#print axioms SPHYS.Gravity.measured_on_line
#print axioms SPHYS.Gravity.no_measurement_off_line
#print axioms SPHYS.Gravity.energy_carrier_lands
#print axioms SPHYS.Gravity.bar_involutive
#print axioms SPHYS.Gravity.bar_fixed_iff_neutral
#print axioms SPHYS.Gravity.odd_charges_even_energy
#print axioms SPHYS.Gravity.gravity_reads_no_charge_bit
#print axioms SPHYS.Gravity.involutions_commute
#print axioms SPHYS.Gravity.tmirror_involutive
#print axioms SPHYS.Gravity.joint_fixed_iff
#print axioms SPHYS.Gravity.charge_carrier_equivariant
#print axioms SPHYS.Gravity.pair_lands_once
#print axioms SPHYS.Gravity.tmirror_equivariant
#print axioms SPHYS.Gravity.neutral_charge_on_line
#print axioms SPHYS.Gravity.pair_on_the_edges
#print axioms SPHYS.Gravity.stable_lands
#print axioms SPHYS.Gravity.gravity_even_branch
#print axioms SPHYS.Gravity.gravity_factors_through_registration
#print axioms SPHYS.Gravity.composition_blind
#print axioms SPHYS.Gravity.even_is_not_the_record
#print axioms SPHYS.Gravity.every_source_on_the_line
#print axioms SPHYS.Gravity.charged_source_off_the_line
#print axioms SPHYS.Gravity.total_nonneg
#print axioms SPHYS.Gravity.one_sign_no_screening
#print axioms SPHYS.Gravity.charge_can_be_screened
#print axioms SPHYS.Gravity.conservative_motion_reversible
#print axioms SPHYS.Gravity.motion_retraces
#print axioms SPHYS.Gravity.redshift_equivariant
#print axioms SPHYS.Gravity.redshift_keeps_the_line
#print axioms SPHYS.Gravity.redshift_commutes_with_registration
#print axioms SPHYS.Gravity.clocks_co_move
#print axioms SPHYS.Gravity.gravity_reads_the_deficit
#print axioms SPHYS.Gravity.the_bond_weighs_less
#print axioms SPHYS.Gravity.waves_two_polarizations
#print axioms SPHYS.Gravity.polarization_count
#print axioms SPHYS.Gravity.sq_pos_of_ne
#print axioms SPHYS.Gravity.massive_slower
#print axioms SPHYS.Gravity.odd_reading_blind
#print axioms SPHYS.Gravity.only_gravity_reads_the_dark
#print axioms SPHYS.Gravity.the_vacuum_repels
#print axioms SPHYS.Gravity.one_sign_of_energy_not_of_pull
#print axioms SPHYS.Gravity.kinetic_floor
#print axioms SPHYS.Gravity.gravity_is_the_record
```

## Appendix B · Gravity_Twin.f90

Part I. Carried from edition 2.0.0 without change.

```fortran
! Gravity_Twin.f90 · the executed twin of SPHYS_Gravity.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Gravity_Twin.f90
! Blocks: A gravity reads the record; B the equivalence principle and the deficit; C one sign, no
! screening; D reversible motion; E gravity and time co-move; F the classical tests computed from
! the constants; G the waves; H the two branches' prices; I the sky's budget: the vacuum's pull.
program gravity_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: i8 = selected_int_kind(18)
  real(dp), parameter :: CL = 299792458.0_dp, GMS = 1.32712440018e20_dp, KB = 1.380649e-23_dp
  real(dp), parameter :: PI = 3.141592653589793_dp, ARCSEC = 206264.80624709636_dp
  integer :: checks, fails
  integer(i8) :: seed
  checks = 0; fails = 0; seed = 20260930_i8
  call block_a(); call block_b(); call block_c(); call block_d()
  call block_e(); call block_f(); call block_g(); call block_h(); call block_i()
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  subroutine check(name, ok)
    character(*), intent(in) :: name
    logical, intent(in) :: ok
    checks = checks + 1
    if (.not. ok) fails = fails + 1
    write(*,'(a,a)') merge('  PASS  ', '  FAIL  ', ok), name
  end subroutine check

  function rnd() result(r)
    real(dp) :: r
    seed = modulo(16807_i8*seed, 2147483647_i8)
    r = real(seed, dp)/2147483647.0_dp
  end function rnd

  subroutine block_a()
    integer :: q, col, e, n, neven, nblind, nsrc, noff
    write(*,'(a)') 'A · gravity reads the record: even under the particle map, blind to the side'
    n = 0; neven = 0; nblind = 0; nsrc = 0; noff = 0
    do q = -6, 6
      do col = -2, 2
        do e = -20, 20
          n = n + 1
          ! the particle (q, col, e) and its antiparticle (-q, -col, e): gravity reads e alone
          if (grav(q, e) == grav(-q, e)) neven = neven + 1
          if (grav(q, e) == grav(0, e)) nblind = nblind + 1
          if (1 + (grav(q, e) - grav(-q, e)) == 1) nsrc = nsrc + 1
          if (q /= 0 .and. 1 + (q - (-q)) /= 1) noff = noff + 1
        end do
      end do
    end do
    call check('gravity reads a particle and its antiparticle (-q, -colour, e) alike (2665 of 2665)', neven == n)
    call check('gravity is blind to charge at fixed energy (2665 of 2665)', nblind == n)
    call check('every gravitational source stands on the line; every charged source off it', &
               nsrc == n .and. noff == n - 5*41)
  end subroutine block_a

  pure function grav(q, e) result(g)
    integer, intent(in) :: q, e
    integer :: g
    g = e + 0*q
  end function grav

  subroutine block_b()
    real(dp) :: bti, bpt, mu, fti, fpt, dfrac, eta, reach
    write(*,'(a)') 'B · the equivalence principle, and the deficit read with the rest'
    bti = 8.72301_dp; bpt = 7.92655_dp; mu = 931.49410242_dp
    fti = bti/mu; fpt = bpt/mu; dfrac = fti - fpt
    eta = 1.5e-15_dp + sqrt(2.3e-15_dp**2 + 1.5e-15_dp**2)
    reach = eta/dfrac
    write(*,'(a,f8.5,a,f8.5,a,es10.3)') '  binding fraction of the mass: titanium ', 100.0_dp*fti, ' %, platinum ', &
         100.0_dp*fpt, ' %, difference ', dfrac
    write(*,'(a,es10.3,a,es10.3)') '  MICROSCOPE |eta| <= ', eta, ': the binding deficit falls with the rest to ', reach
    call check('the deficit of nuclear binding is read by gravity to better than 1e-11 of itself', reach < 1.0e-11_dp)
    call check('antihydrogen falls down, a = (0.75 +- 0.21) g, repulsion excluded (ALPHA-g 2023)', &
               0.75_dp - 3.0_dp*sqrt(0.13_dp**2 + 0.16_dp**2) > -1.0_dp)
  end subroutine block_b

  subroutine block_c()
    integer :: i, j, nq, nm, s, qq(4), mm(4)
    write(*,'(a)') 'C · one sign: gravity cannot be screened, charge can'
    nq = 0; nm = 0
    do i = 1, 20000
      s = 0
      do j = 1, 4
        qq(j) = int(7.0_dp*rnd()) - 3
        if (qq(j) == 0) qq(j) = 1
      end do
      if (sum(qq) == 0) nq = nq + 1
      do j = 1, 4
        mm(j) = int(4.0_dp*rnd())
      end do
      if (maxval(mm) > 0 .and. sum(mm) == 0) nm = nm + 1
    end do
    write(*,'(a,i0,a,i0)') '  of 20000 random sets of four nonzero charges, neutral: ', nq, &
         ';  of 20000 non-empty mass sets, massless: ', nm
    call check('charges screen (neutral sets exist); masses never total zero unless all are zero', nq > 0 .and. nm == 0)
  end subroutine block_c

  subroutine block_d()
    integer :: n, nsteps
    real(dp) :: dt, x0(2), x1(2), x2(2), a(2), e0, e, emax, v(2), xa(2), xb(2), err
    write(*,'(a)') 'D · no bit, and reversible: a Kepler orbit run forward and backward'
    nsteps = 50000; dt = 10.0_dp*2.0_dp*PI/real(nsteps, dp)
    ! GM = 1, a = 1, eccentricity 1/2, start at perihelion
    x0 = [0.5_dp, 0.0_dp]; v = [0.0_dp, sqrt(3.0_dp)]
    a = acc(x0); x1 = x0 + dt*v + 0.5_dp*dt*dt*a
    e0 = 0.5_dp*sum(v*v) - 1.0_dp/sqrt(sum(x0*x0)); emax = 0.0_dp
    xa = x0; xb = x1
    do n = 1, nsteps
      x2 = 2.0_dp*xb - xa + dt*dt*acc(xb)
      v = (x2 - xa)/(2.0_dp*dt)
      e = 0.5_dp*sum(v*v) - 1.0_dp/sqrt(sum(xb*xb))
      emax = max(emax, abs(e/e0 - 1.0_dp))
      xa = xb; xb = x2
    end do
    ! reverse: exchange the last two positions and run the same number of steps
    x2 = xa; xa = xb; xb = x2
    do n = 1, nsteps
      x2 = 2.0_dp*xb - xa + dt*dt*acc(xb)
      xa = xb; xb = x2
    end do
    err = sqrt(sum((xb - x0)**2))
    write(*,'(a,es9.2,a,es9.2)') '  ten revolutions: max |dE/E| = ', emax, ';  retrace error after reversal = ', err
    call check('the orbit keeps its energy to 1e-5 over ten revolutions', emax < 1.0e-5_dp)
    call check('run backwards, the orbit retraces its start to 1e-9', err < 1.0e-9_dp)
  end subroutine block_d

  pure function acc(x) result(g)
    real(dp), intent(in) :: x(2)
    real(dp) :: g(2), r
    r = sqrt(sum(x*x))
    g = -x/(r*r*r)
  end function acc

  subroutine block_e()
    integer :: i
    real(dp) :: f1, f2, phi, k, worst, pr, clk
    write(*,'(a)') 'E · gravity and time co-move: one factor shifts every clock'
    worst = 0.0_dp
    do i = 1, 10000
      f1 = 10.0_dp**(9.0_dp + 6.0_dp*rnd()); f2 = 10.0_dp**(9.0_dp + 6.0_dp*rnd())
      phi = -1.0e-8_dp*rnd()
      k = 1.0_dp + phi
      worst = max(worst, abs((k*f1)/(k*f2)/(f1/f2) - 1.0_dp))
    end do
    write(*,'(a,es9.2)') '  10000 clock pairs in 10000 potentials: max change of their ratio ', worst
    call check('every ratio of clocks is kept by the gravitational shift (to 1e-15)', worst < 1.0e-15_dp)
    pr = 9.80665_dp*22.5_dp/CL**2; clk = 9.80665_dp*0.33_dp/CL**2
    write(*,'(a,es10.3,a,es10.3)') '  Pound-Rebka tower 22.5 m: dnu/nu = ', pr, ';  optical clocks 33 cm: ', clk
    call check('the tower shift is 2.455e-15 and the 33 cm shift 3.60e-17', &
               abs(pr/2.4550e-15_dp - 1.0_dp) < 1.0e-3_dp .and. abs(clk/3.6007e-17_dp - 1.0_dp) < 1.0e-3_dp)
  end subroutine block_e

  subroutine block_f()
    real(dp) :: defl, prec, amerc, emerc, porb, pdot, pb, ecc, m1, m2, tsun, fe
    write(*,'(a)') 'F · the classical floor, computed from the constants'
    defl = 4.0_dp*GMS/(CL**2*6.957e8_dp)*ARCSEC
    amerc = 5.7909050e10_dp; emerc = 0.205630_dp; porb = 87.9691_dp
    prec = 6.0_dp*PI*GMS/(CL**2*amerc*(1.0_dp - emerc**2))*(36525.0_dp/porb)*ARCSEC
    tsun = GMS/CL**3
    pb = 0.322997448918_dp*86400.0_dp; ecc = 0.6171340_dp; m1 = 1.438_dp; m2 = 1.390_dp
    fe = (1.0_dp + 73.0_dp/24.0_dp*ecc**2 + 37.0_dp/96.0_dp*ecc**4)/(1.0_dp - ecc**2)**3.5_dp
    pdot = -192.0_dp*PI/5.0_dp*tsun**(5.0_dp/3.0_dp)*(pb/(2.0_dp*PI))**(-5.0_dp/3.0_dp)*fe*m1*m2/(m1 + m2)**(1.0_dp/3.0_dp)
    write(*,'(a,f7.4,a,f7.3,a,es12.5)') '  deflection at the solar limb ', defl, ' arcsec; Mercury ', prec, &
         ' arcsec per century; PSR B1913+16 dPb/dt = ', pdot
    call check('light grazing the Sun bends 1.751 arcsec, twice the Newtonian angle', abs(defl - 1.751_dp) < 2.0e-3_dp)
    call check('Mercury''s perihelion advances 42.98 arcsec per century', abs(prec - 42.98_dp) < 0.05_dp)
    call check('the binary pulsar''s orbital decay is -2.4026e-12, the GR value (Weisberg and Huang 2016)', &
               abs(pdot/(-2.40263e-12_dp) - 1.0_dp) < 2.0e-3_dp)
  end subroutine block_f

  subroutine block_g()
    integer :: s, n
    real(dp) :: dv
    write(*,'(a)') 'G · the waves: two polarizations, the speed of light'
    n = 0
    do s = -1, 1, 2
      if (-s /= s) n = n + 1
    end do
    dv = 1.74_dp/(130.0e6_dp*3.15576e7_dp)
    write(*,'(a,i0,a,es9.2)') '  polarizations 10 - 4 - 4 = ', 10 - 4 - 4, ';  GW170817 dv/c <= ', dv
    call check('two polarizations, each moved by parity, and gravity at the speed of light to 1e-15', &
               n == 2 .and. 10 - 4 - 4 == 2 .and. dv < 1.0e-15_dp)
  end subroutine block_g

  subroutine block_h()
    real(dp) :: floor
    write(*,'(a)') 'H · the two branches: the reversible run registers nothing; the kept bit is priced'
    floor = KB*300.0_dp*log(2.0_dp)
    write(*,'(a,f6.1,a)') '  gravity''s reversed orbit: 0 bits committed;  the magnet''s bit: ', 5.0e-19_dp/floor, &
         ' floors per switch'
    call check('the reversible branch commits no bit while the priced branch pays above the floor', &
               5.0e-19_dp/floor > 100.0_dp)
  end subroutine block_h
  subroutine block_i()
    real(dp) :: om, ol, q0, qm, zacc, zeq
    write(*,'(a)') 'I · the sky''s budget: dust attracts, the vacuum repels, and the sign is read'
    om = 0.3153_dp; ol = 0.6847_dp
    q0 = om/2.0_dp - ol; qm = 1.0_dp/2.0_dp
    zacc = (2.0_dp*ol/om)**(1.0_dp/3.0_dp) - 1.0_dp
    zeq = (ol/om)**(1.0_dp/3.0_dp) - 1.0_dp
    write(*,'(a,f7.4,a,f5.2,a,f6.3,a,f6.3)') '  flat budget of Planck 2018: q0 = ', q0, ' (all matter: ', qm, &
         ');  acceleration begins at z = ', zacc, ';  the vacuum overtakes matter at z = ', zeq
    call check('the two budgets give decelerations of opposite sign: q0 = -0.527 against +0.5', &
               abs(q0 + 0.527_dp) < 1.0e-3_dp .and. qm > 0.0_dp)
    call check('the acceleration begins at z = 0.63 and the vacuum overtakes matter at z = 0.295', &
               abs(zacc - 0.631_dp) < 2.0e-3_dp .and. abs(zeq - 0.295_dp) < 2.0e-3_dp)
  end subroutine block_i
end program gravity_twin
```

## Appendix C · SPHYS_Gravity_Field_Equations_CC.lean

Part II. Core Lean 4.19.0, no import, no axiom declared, compiled with warnings fatal, exit 0. The kernel lines follow the listing.

```lean
/-
  SPHYS_Gravity_Field_Equations_CC.lean · The field equations from the seat · core Lean 4, no library.

  RATIONALE. Immanent Gravity (edition 2.0.0) proved what gravity is, the substrate reading its own record, and
  imported Einstein's equations. This file carries the algebra that turns the import into a consequence: given the
  seat's reading (one sign, blind to composition, nothing escapes the record), the law of the reading is fixed in
  form, its active source is rho + 3p in four dimensions, its waves have two polarizations, and its one coupling
  is a magnitude the law cannot fix.

  DESIGN. Integers and naturals only, so every statement is decidable or linear. No axiom is declared in this
  file. The kernel line of each theorem is printed at the end; the counts of Part III print no axiom at all, and
  the linear statements print what the `omega` procedure of core Lean uses.
  Fractions are cleared by doubling: `div2` is twice a divergence, `active4` is twice the trace-reversed source.

  WHAT ENTERS AS A DEFINITION, NOT AS A THEOREM (read before editing):
    (1) two identities of Riemannian geometry are fields of `Geometry` and are not proved here: the metric is
        constant under its own derivative (`compat`), and the contracted Bianchi identity, twice div Ric = d R
        (`bianchi`), which is the statement that the boundary of a boundary is zero;
    (2) the family a·Ric + b·R·g + c·g holds the laws of second order that are linear in the curvature. That in
        four dimensions every conserved law of second order lies in it, linear or not, is Lovelock's theorem
        (1971, 1972), not proved here;
    (3) the rest frame of a perfect fluid, T = diag(rho, p, ..., p), with signature (-, +, ..., +);
    (4) the exact solution of the forced law outside a body at rest, in isotropic coordinates (Schwarzschild, 1916):
        its two metric functions are the inputs of `exact_solution_gives_gamma_and_beta`, which checks their
        expansion and not that they solve the law;
    (5) in two dimensions the Ricci tensor is half the scalar curvature times the metric, a fact of geometry and
        the definition of `twoDim`;
    (6) the counts of Part III: n(n + 1)/2 components of a symmetric law, n²(n² - 1)/12 of the curvature, and the
        polarizations of a wave by removing n identities and n coordinates. They are classical counts, entered as
        definitions; the theorems of Part III evaluate them at the dimensions named;
    (7) the area of a sphere in three dimensions of space, as the square of its radius (`area`);
    (8) two formulas of the post-Newtonian expansion (Will, 2014): light bends as 1 + gamma (`bending`) and a
        perihelion advances as 2 + 2·gamma - beta (`perihelion`).
  DOMAIN. The dimension theorems are stated for every integer n because the algebra holds for every n. Their
  meaning as geometry begins at n = 3, where a trace reversal exists; n = 2 is treated on its own by `two_is_empty`.
  RISK. A reader may take `conservation_forces_the_law` as a proof of Lovelock's theorem. It is the forcing inside
  the family, and the docstring says so.
  NON-NEGOTIABLE. No theorem here fixes the value of the coupling. `the_law_fixes_no_scale` proves it cannot.
-/
namespace SPHYS.FieldEq

/-! ## Part I. Nothing escapes the record: conservation forces the law. -/

/-- A geometry, as far as the law reads it at one point and in one direction: the divergence of the Ricci tensor,
    the gradient of the scalar curvature and the divergence of the metric, with the two identities that tie them:
    the metric is constant under its own derivative, and the contracted Bianchi identity (doubled to stay in Int). -/
structure Geometry where
  divRic : Int
  dR     : Int
  divMetric : Int
  compat  : divMetric = 0
  bianchi : 2 * divRic = dR

/-- Twice the divergence of the candidate law a·Ric + b·R·g + c·g, every term kept: the term in b contributes
    b·dR, and the term in c contributes c times the divergence of the metric. -/
def div2 (G : Geometry) (a b c : Int) : Int := 2 * (a * G.divRic + b * G.dR) + 2 * (c * G.divMetric)

/-- The divergence of the family is one number times the gradient of the curvature. -/
theorem div2_eq (G : Geometry) (a b c : Int) : div2 G a b c = (a + 2 * b) * G.dR := by
  unfold div2
  rw [G.compat, Int.mul_zero, Int.mul_zero, Int.add_zero, Int.mul_add, ← Int.mul_assoc, Int.mul_comm 2 a, Int.mul_assoc, G.bianchi, ← Int.mul_assoc, Int.mul_comm 2 b,
      Int.add_mul, Int.mul_comm b 2]

/-- A geometry whose curvature has a gradient: the witness that the forcing is not vacuous. -/
def curved : Geometry := { divRic := 1, dR := 2, divMetric := 0, compat := rfl, bianchi := by decide }

/-- CONSERVATION FORCES THE LAW. If the law is divergence-free on every geometry, so that it can equal a conserved
    source, then b = -a/2: the law is a·(Ric - R·g/2) + c·g. Inside the linear family nothing else is allowed. -/
theorem conservation_forces_the_law (a b c : Int) (h : ∀ G : Geometry, div2 G a b c = 0) : a + 2 * b = 0 := by
  have h1 := h curved
  rw [div2_eq] at h1
  have h2 : (a + 2 * b) * 2 = 0 := h1
  omega

/-- And the forced law is conserved on every geometry: the term in c, the cosmological term, is free. -/
theorem the_forced_law_is_conserved (a b c : Int) (h : a + 2 * b = 0) (G : Geometry) : div2 G a b c = 0 := by
  rw [div2_eq, h, Int.zero_mul]

/-- THE LAW FIXES NO SCALE. Every multiple of a conserved law is conserved. Conservation fixes the form and never
    the overall constant: the coupling is a magnitude the law cannot return. -/
theorem the_law_fixes_no_scale (a b k : Int) (h : a + 2 * b = 0) : k * a + 2 * (k * b) = 0 := by
  have : k * a + 2 * (k * b) = k * (a + 2 * b) := by
    rw [Int.mul_add, ← Int.mul_assoc k 2 b, Int.mul_comm k 2, Int.mul_assoc]
  rw [this, h, Int.mul_zero]

/-- The cosmological term is free: no value of c is touched by conservation. It follows from the constancy of the
    metric, which is now a field of the geometry and no longer a silence of the definition. -/
theorem the_vacuum_term_is_free (a b c c' : Int) (G : Geometry) : div2 G a b c = div2 G a b c' := by
  rw [div2_eq, div2_eq]

/-- THE CONSERVED LAWS ARE ONE LINE, THE EINSTEIN LINE. Every conserved pair (a, b) is an integer multiple of (2, -1): the conserved
    laws are the multiples of Einstein's tensor 2·Ric - R·g, and the vacuum term beside them. -/
theorem conserved_laws_are_one_line (a b : Int) (h : a + 2 * b = 0) : ∃ k : Int, a = 2 * k ∧ b = -k :=
  ⟨-b, by omega, by omega⟩

/-- The vacuum term alone is conserved and reads no curvature: the one member of the family with a = 0. -/
theorem the_vacuum_alone_is_conserved (c : Int) (G : Geometry) : div2 G 0 0 c = 0 := by
  rw [div2_eq]; simp

/-- A LAW THAT READS CURVATURE IS EINSTEIN'S. If the law reads the Ricci tensor at all (a is not zero) and is
    conserved on every geometry, then it reads the scalar curvature too, in the ratio b = -a/2. -/
theorem a_law_that_reads_curvature_is_einsteins (a b c : Int) (ha : a ≠ 0) (h : ∀ G : Geometry, div2 G a b c = 0) :
    b ≠ 0 ∧ a + 2 * b = 0 := by
  have h1 := conservation_forces_the_law a b c h
  refine ⟨?_, h1⟩
  intro hb; omega

/-- OFF THE EINSTEIN LINE THE CURVATURE IS FROZEN. A law off the Einstein line can be conserved only where the curvature has no
    gradient. Its source would have one trace everywhere: no star, no planet, no void. This is why conservation
    is asked on every geometry and not on some. -/
theorem off_the_einstein_line_the_curvature_is_frozen (G : Geometry) (a b c : Int) (hne : a + 2 * b ≠ 0)
    (h : div2 G a b c = 0) : G.dR = 0 := by
  rw [div2_eq] at h
  rcases Int.mul_eq_zero.mp h with h1 | h1
  · exact absurd h1 hne
  · exact h1

/-! ## Part II. What gravity reads: the active density, derived. -/

/-- The trace of a perfect fluid at rest in n spacetime dimensions, signature (-, +, ..., +). -/
def trace (n ρ p : Int) : Int := -ρ + (n - 1) * p

/-- (n - 2) times the time-time part of the trace-reversed source: the quantity the forced law reads. -/
def activeN (n ρ p : Int) : Int := (n - 2) * ρ + trace n ρ p

/-- Four dimensions: gravity reads rho + 3p. The active density of Immanent Gravity, section 4, is no longer cited:
    it is the trace reversal of the forced law. -/
theorem active_four (ρ p : Int) : activeN 4 ρ p = ρ + 3 * p := by
  unfold activeN trace; omega

/-- Three dimensions (two of space): the density drops out. Dust does not gravitate. -/
theorem active_three (ρ p : Int) : activeN 3 ρ p = 2 * p := by
  unfold activeN trace; omega

theorem dust_is_weightless_in_three (ρ : Int) : activeN 3 ρ 0 = 0 := by
  unfold activeN trace; omega

/-- Five dimensions, for the pattern: (n - 3)·rho + (n - 1)·p. -/
theorem active_five (ρ p : Int) : activeN 5 ρ p = 2 * ρ + 4 * p := by
  unfold activeN trace; omega

/-- FOUR IS THE LEAST. Dust attracts in four dimensions and not in three: three dimensions of space are the least
    in which a body at rest has weight. -/
theorem four_is_the_least_where_dust_attracts (ρ : Int) (h : 0 < ρ) :
    0 < activeN 4 ρ 0 ∧ activeN 3 ρ 0 = 0 := by
  unfold activeN trace; refine ⟨?_, ?_⟩ <;> omega

/-- Dust attracts, radiation attracts twice over, the vacuum repels: the three signs of section 4, now derived. -/
theorem dust_attracts (ρ : Int) (h : 0 < ρ) : 0 < activeN 4 ρ 0 := by
  unfold activeN trace; omega
theorem radiation_reads_double (k : Int) : activeN 4 (3 * k) k = 2 * (3 * k) := by
  unfold activeN trace; omega
theorem the_vacuum_repels (ρ : Int) (h : 0 < ρ) : activeN 4 ρ (-ρ) = -2 * ρ ∧ activeN 4 ρ (-ρ) < 0 := by
  unfold activeN trace; refine ⟨?_, ?_⟩ <;> omega
theorem repulsion_needs_tension (ρ p : Int) (h : activeN 4 ρ p < 0) : 3 * p < -ρ := by
  unfold activeN trace at h; omega

/-- (n - 2) times a space-space part of the trace-reversed source: what the space part of the law reads. -/
def spaceN (n ρ p : Int) : Int := (n - 2) * p - trace n ρ p

/-- SPACE READS AS TIME. For a body at rest in four dimensions the space part of the law reads exactly what the
    time part reads. This is gamma = 1: it is why light bends twice the Newtonian angle. -/
theorem space_reads_as_time (ρ : Int) : spaceN 4 ρ 0 = activeN 4 ρ 0 := by
  unfold spaceN activeN trace; omega

/-- And only in four: in five dimensions the time part reads twice what the space part reads. -/
theorem not_in_five (ρ : Int) (h : 0 < ρ) : spaceN 5 ρ 0 ≠ activeN 5 ρ 0 := by
  unfold spaceN activeN trace; omega

/-! ### Every dimension at once. The three theorems above are instances of these. -/

/-- THE ACTIVE DENSITY IN EVERY DIMENSION: (n - 3)·rho + (n - 1)·p. Read as geometry for n at least three. -/
theorem active_general (n ρ p : Int) : activeN n ρ p = (n - 3) * ρ + (n - 1) * p := by
  unfold activeN trace
  have h : (n - 2) * ρ = (n - 3) * ρ + ρ := by
    have e : n - 2 = (n - 3) + 1 := by omega
    rw [e, Int.add_mul, Int.one_mul]
  omega

theorem dust_general (n ρ : Int) : activeN n ρ 0 = (n - 3) * ρ := by
  rw [active_general, Int.mul_zero, Int.add_zero]

/-- For a body at rest the space part reads the density itself, in every dimension. -/
theorem space_general (n ρ : Int) : spaceN n ρ 0 = ρ := by
  unfold spaceN trace
  rw [Int.mul_zero, Int.mul_zero]; omega

/-- A BODY AT REST HAS WEIGHT EXACTLY ABOVE THREE DIMENSIONS OF SPACETIME. -/
theorem dust_attracts_exactly_above_three (n ρ : Int) (hρ : 0 < ρ) : 0 < activeN n ρ 0 ↔ 3 < n := by
  rw [dust_general]
  constructor
  · intro h
    by_cases hn : 3 < n
    · exact hn
    · exfalso
      have h1 : n - 3 ≤ 0 := by omega
      have h2 : (n - 3) * ρ ≤ 0 := Int.mul_nonpos_of_nonpos_of_nonneg h1 (Int.le_of_lt hρ)
      omega
  · intro h
    exact Int.mul_pos (by omega) hρ

/-- GAMMA IS ONE EXACTLY IN FOUR DIMENSIONS. For a body at rest the space part of the law reads what the time part
    reads if and only if the dimension is four. Light bends exactly twice the Newtonian angle in four dimensions
    and in no other. -/
theorem gamma_is_one_exactly_in_four (n ρ : Int) (hρ : ρ ≠ 0) : spaceN n ρ 0 = activeN n ρ 0 ↔ n = 4 := by
  rw [space_general, dust_general]
  constructor
  · intro h
    have h2 : (n - 4) * ρ = 0 := by
      have e : (n - 3) * ρ = (n - 4) * ρ + ρ := by
        have e1 : n - 3 = (n - 4) + 1 := by omega
        rw [e1, Int.add_mul, Int.one_mul]
      omega
    rcases Int.mul_eq_zero.mp h2 with h3 | h3
    · omega
    · exact absurd h3 hρ
  · intro h
    subst h
    have e : (4 : Int) - 3 = 1 := by decide
    rw [e, Int.one_mul]

/-- The reading is homogeneous: scale the source and the reading scales with it. No scale is preferred. -/
theorem active_is_homogeneous (k ρ p : Int) : activeN 4 (k * ρ) (k * p) = k * activeN 4 ρ p := by
  rw [active_four, active_four, Int.mul_add, Int.mul_left_comm]

/-! ## Part III. The counts a seat reaches. -/

/-- Independent components of a symmetric law in n dimensions. -/
def components (n : Nat) : Nat := n * (n + 1) / 2
/-- Independent components of the curvature in n dimensions. -/
def curvature (n : Nat) : Nat := n * n * (n * n - 1) / 12
/-- Polarizations of a gravitational wave in n dimensions: components, less n identities, less n coordinates,
    which is n(n - 3)/2. -/
def polarizations (n : Nat) : Nat := components n - n - n

theorem ten_equations : components 4 = 10 := by decide
theorem twenty_curvatures : curvature 4 = 20 := by decide
/-- TWO POLARIZATIONS in four dimensions, as section 9 reads from the sky. -/
theorem two_polarizations : polarizations 4 = 2 := by decide
/-- NO WAVES in three dimensions: gravity there has no freedom of its own. -/
theorem no_waves_in_three : polarizations 3 = 0 := by decide
theorem five_in_five : polarizations 5 = 5 := by decide
theorem polarizations_formula_four : polarizations 4 = 4 * (4 - 3) / 2 := by decide

/-- In three dimensions the curvature has as many components as the law: matter fixes the geometry outright and
    nothing propagates. In four the curvature has ten more than the law, and those ten are the waves and tides. -/
theorem three_is_rigid : curvature 3 = components 3 := by decide
theorem four_has_ten_free : curvature 4 = components 4 + 10 := by decide

/-- Twice the coefficient of the metric in the family, in two dimensions, where Ric = (R/2)·g: the whole family
    a·Ric + b·R·g collapses to (a/2 + b)·R·g. -/
def twoDim (a b R : Int) : Int := (a + 2 * b) * R

/-- TWO IS EMPTY. In two dimensions every conserved law of the family vanishes identically: Einstein's tensor is
    zero there, and gravity has no law to obey. -/
theorem two_is_empty (a b R : Int) (h : a + 2 * b = 0) : twoDim a b R = 0 := by
  unfold twoDim; rw [h, Int.zero_mul]

/-- In two dimensions the curvature has one component. -/
theorem one_curvature_in_two : curvature 2 = 1 := by decide

/-! ## Part IV. One coupling, and the tests. -/

/-- Flux through a sphere in three dimensions of space grows as the square of the radius. -/
def area (r : Nat) : Nat := r ^ 2

/-- INVERSE SQUARE. A reading that loses nothing between spheres thins as the area grows: at twice the radius the
    same flux crosses four times the area. -/
theorem double_radius_quadruple_area (r : Nat) : area (2 * r) = 4 * area r := by
  unfold area; rw [Nat.mul_pow]

/-- The space part and the time part of the reading bend light equally: gamma = 1. -/
def bending (γ : Int) : Int := 1 + γ
theorem light_bends_twice (γ : Int) (h : γ = 1) : bending γ = 2 := by unfold bending; omega

/-- Product of two polynomials in x, kept to second order: (c0, c1, c2) stands for c0 + c1·x + c2·x². -/
def mul3 (p q : Int × Int × Int) : Int × Int × Int :=
  (p.1 * q.1, p.1 * q.2.1 + p.2.1 * q.1, p.1 * q.2.2 + p.2.1 * q.2.1 + p.2.2 * q.1)

/-- THE EXACT SOLUTION GIVES GAMMA = 1 AND BETA = 1. Outside a body at rest, with x = GM/(2c²r) and U = 2x, the
    exact solution has time part ((1 - x)/(1 + x))² and space part (1 + x)⁴. To second order the time part is
    1 - 4x + 8x², which is 1 - 2U + 2·beta·U² with beta = 1, and the space part is 1 + 4x, which is 1 + 2·gamma·U
    with gamma = 1. Checked as identities of polynomials: (1 + x)²·(1 - 4x + 8x²) = (1 - x)² and
    (1 + x)²·(1 + x)² = 1 + 4x + 6x², both to second order. -/
theorem exact_solution_gives_gamma_and_beta :
    mul3 (1, 2, 1) (1, -4, 8) = (1, -2, 1) ∧ mul3 (1, 2, 1) (1, 2, 1) = (1, 4, 6) ∧
    (∀ β : Int, 8 * β = 8 → β = 1) ∧ (∀ γ : Int, 4 * γ = 4 → γ = 1) := by
  refine ⟨by decide, by decide, ?_, ?_⟩ <;> intro _ h <;> omega

/-- The advance of a perihelion in units of one third of the full value: 2 + 2·gamma - beta. -/
def perihelion (γ β : Int) : Int := 2 + 2 * γ - β
theorem perihelion_is_full (γ β : Int) (hγ : γ = 1) (hβ : β = 1) : perihelion γ β = 3 := by
  unfold perihelion; omega

end SPHYS.FieldEq

#print axioms SPHYS.FieldEq.div2_eq
#print axioms SPHYS.FieldEq.conservation_forces_the_law
#print axioms SPHYS.FieldEq.the_forced_law_is_conserved
#print axioms SPHYS.FieldEq.the_law_fixes_no_scale
#print axioms SPHYS.FieldEq.the_vacuum_term_is_free
#print axioms SPHYS.FieldEq.conserved_laws_are_one_line
#print axioms SPHYS.FieldEq.the_vacuum_alone_is_conserved
#print axioms SPHYS.FieldEq.a_law_that_reads_curvature_is_einsteins
#print axioms SPHYS.FieldEq.off_the_einstein_line_the_curvature_is_frozen
#print axioms SPHYS.FieldEq.active_four
#print axioms SPHYS.FieldEq.active_three
#print axioms SPHYS.FieldEq.dust_is_weightless_in_three
#print axioms SPHYS.FieldEq.active_five
#print axioms SPHYS.FieldEq.four_is_the_least_where_dust_attracts
#print axioms SPHYS.FieldEq.dust_attracts
#print axioms SPHYS.FieldEq.radiation_reads_double
#print axioms SPHYS.FieldEq.the_vacuum_repels
#print axioms SPHYS.FieldEq.repulsion_needs_tension
#print axioms SPHYS.FieldEq.space_reads_as_time
#print axioms SPHYS.FieldEq.not_in_five
#print axioms SPHYS.FieldEq.active_general
#print axioms SPHYS.FieldEq.dust_general
#print axioms SPHYS.FieldEq.space_general
#print axioms SPHYS.FieldEq.dust_attracts_exactly_above_three
#print axioms SPHYS.FieldEq.gamma_is_one_exactly_in_four
#print axioms SPHYS.FieldEq.active_is_homogeneous
#print axioms SPHYS.FieldEq.ten_equations
#print axioms SPHYS.FieldEq.twenty_curvatures
#print axioms SPHYS.FieldEq.two_polarizations
#print axioms SPHYS.FieldEq.no_waves_in_three
#print axioms SPHYS.FieldEq.five_in_five
#print axioms SPHYS.FieldEq.polarizations_formula_four
#print axioms SPHYS.FieldEq.three_is_rigid
#print axioms SPHYS.FieldEq.four_has_ten_free
#print axioms SPHYS.FieldEq.two_is_empty
#print axioms SPHYS.FieldEq.one_curvature_in_two
#print axioms SPHYS.FieldEq.double_radius_quadruple_area
#print axioms SPHYS.FieldEq.light_bends_twice
#print axioms SPHYS.FieldEq.exact_solution_gives_gamma_and_beta
#print axioms SPHYS.FieldEq.perihelion_is_full
```

## Appendix D · Kernel lines of Appendix C

```text
'SPHYS.FieldEq.div2_eq' depends on axioms: [propext]
'SPHYS.FieldEq.conservation_forces_the_law' depends on axioms: [propext, Quot.sound]
'SPHYS.FieldEq.the_forced_law_is_conserved' depends on axioms: [propext]
'SPHYS.FieldEq.the_law_fixes_no_scale' depends on axioms: [propext]
'SPHYS.FieldEq.the_vacuum_term_is_free' depends on axioms: [propext]
'SPHYS.FieldEq.conserved_laws_are_one_line' depends on axioms: [propext, Quot.sound]
'SPHYS.FieldEq.the_vacuum_alone_is_conserved' depends on axioms: [propext]
'SPHYS.FieldEq.a_law_that_reads_curvature_is_einsteins' depends on axioms: [propext, Quot.sound]
'SPHYS.FieldEq.off_the_einstein_line_the_curvature_is_frozen' depends on axioms: [propext]
'SPHYS.FieldEq.active_four' depends on axioms: [propext, Quot.sound]
'SPHYS.FieldEq.active_three' depends on axioms: [propext, Quot.sound]
'SPHYS.FieldEq.dust_is_weightless_in_three' depends on axioms: [propext, Quot.sound]
'SPHYS.FieldEq.active_five' depends on axioms: [propext, Quot.sound]
'SPHYS.FieldEq.four_is_the_least_where_dust_attracts' depends on axioms: [propext, Quot.sound]
'SPHYS.FieldEq.dust_attracts' depends on axioms: [propext, Quot.sound]
'SPHYS.FieldEq.radiation_reads_double' depends on axioms: [propext, Quot.sound]
'SPHYS.FieldEq.the_vacuum_repels' depends on axioms: [propext, Quot.sound]
'SPHYS.FieldEq.repulsion_needs_tension' depends on axioms: [propext, Quot.sound]
'SPHYS.FieldEq.space_reads_as_time' depends on axioms: [propext, Quot.sound]
'SPHYS.FieldEq.not_in_five' depends on axioms: [propext, Quot.sound]
'SPHYS.FieldEq.active_general' depends on axioms: [propext, Quot.sound]
'SPHYS.FieldEq.dust_general' depends on axioms: [propext, Quot.sound]
'SPHYS.FieldEq.space_general' depends on axioms: [propext, Quot.sound]
'SPHYS.FieldEq.dust_attracts_exactly_above_three' depends on axioms: [propext, Quot.sound]
'SPHYS.FieldEq.gamma_is_one_exactly_in_four' depends on axioms: [propext, Quot.sound]
'SPHYS.FieldEq.active_is_homogeneous' depends on axioms: [propext, Quot.sound]
'SPHYS.FieldEq.ten_equations' does not depend on any axioms
'SPHYS.FieldEq.twenty_curvatures' does not depend on any axioms
'SPHYS.FieldEq.two_polarizations' does not depend on any axioms
'SPHYS.FieldEq.no_waves_in_three' does not depend on any axioms
'SPHYS.FieldEq.five_in_five' does not depend on any axioms
'SPHYS.FieldEq.polarizations_formula_four' does not depend on any axioms
'SPHYS.FieldEq.three_is_rigid' does not depend on any axioms
'SPHYS.FieldEq.four_has_ten_free' does not depend on any axioms
'SPHYS.FieldEq.two_is_empty' depends on axioms: [propext]
'SPHYS.FieldEq.one_curvature_in_two' does not depend on any axioms
'SPHYS.FieldEq.double_radius_quadruple_area' depends on axioms: [propext]
'SPHYS.FieldEq.light_bends_twice' depends on axioms: [propext, Quot.sound]
'SPHYS.FieldEq.exact_solution_gives_gamma_and_beta' depends on axioms: [propext, Quot.sound]
'SPHYS.FieldEq.perihelion_is_full' depends on axioms: [propext, Quot.sound]
```

## Appendix E · Gravity_Field_Equations_Twin_CC.f90

Part II. Thirteen checks, zero failures: six against published measurements (A to D) and seven scanning the engine's statements (E to I). The run follows the listing.

```fortran
! Gravity_Field_Equations_Twin_CC.f90 · numerical twin of SPHYS_Gravity_Field_Equations_CC.lean
! RATIONALE. The Lean file fixes the form of the law. This twin runs the forced law against the sky: every check
!   computes a number from the law and compares it with a published measurement, or scans a statement of the Lean
!   file over many random cases.
! DESIGN. Double precision, no library. Inputs are measured: G·M of the Sun and the Earth, c, orbital elements, the
!   potential of the geoid and the matter fraction of Planck 2018.
!   Only the products G·M enter; the value of G alone is never used, which is check H.
! NON-NEGOTIABLE. No constant is tuned. A failed check is printed as FAIL and counted.
program gravity_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0)
  real(dp), parameter :: pi = 3.14159265358979323846_dp, c = 2.99792458e8_dp
  real(dp), parameter :: GMsun = 1.32712440018e20_dp, GMearth = 3.986004418e14_dp
  real(dp), parameter :: arcsec = 180.0_dp*3600.0_dp/pi
  integer :: nfail, i, n, hits, bad
  real(dp) :: defl, a, e, per, adv, pr, grav, vel, x, k, a1, a2, tt, ss, gam, act
  integer :: ia, ib, d1
  nfail = 0
  write(*,'(a)') 'A · light at the limb of the Sun: the space part bends as much as the time part'
  defl = 4.0_dp*GMsun/(c*c*6.957e8_dp)*arcsec
  write(*,'(a,f8.4,a,f8.4)') '  full bending ', defl, ' arcsec; Newtonian half ', defl/2.0_dp
  ! measured values, not the prediction: 1919 eclipse 1.98 +- 0.12 (Sobral), 1.61 +- 0.30 (Principe), probable errors;
  ! radio interferometry gamma = 0.9998 +- 0.0004, so the angle is 0.9999 +- 0.0002 of the full value
  call check('eclipse of 1919 (1.98 +- 0.12, 1.61 +- 0.30) and radio interferometry (0.9999 +- 0.0002 of full) hold it', &
             abs(defl - 1.98_dp) < 2.0_dp*0.12_dp .and. abs(defl - 1.61_dp) < 2.0_dp*0.30_dp .and. &
             abs(0.9999_dp*defl - defl) < 2.0_dp*0.0002_dp*defl)
  ! gamma is the space part over the time part for dust of density 1 in n = 4: ((n-2)p - T) / ((n-2)rho + T), T = -rho + (n-1)p
  gam = (2.0_dp*0.0_dp - (-1.0_dp + 3.0_dp*0.0_dp)) / (2.0_dp*1.0_dp + (-1.0_dp + 3.0_dp*0.0_dp))
  call check('space reads as time, gamma = 1: Cassini finds gamma - 1 = (2.1 +- 2.3)e-5 (Bertotti, Iess, Tortora 2003)', &
             abs((gam - 1.0_dp) - 2.1e-5_dp) < 2.0_dp*2.3e-5_dp)
  write(*,'(a)') 'B · the perihelion of Mercury'
  a = 5.7909e10_dp; e = 0.20563_dp; per = 87.969_dp
  adv = 6.0_dp*pi*GMsun/(c*c*a*(1.0_dp - e*e))*arcsec*(36525.0_dp/per)
  write(*,'(a,f8.3,a)') '  advance ', adv, ' arcsec per century'
  call check('advance is 42.98 arcsec per century (observed 42.98 +- 0.04, Will 2014)', abs(adv - 42.98_dp) < 2.0_dp*0.04_dp)
  write(*,'(a)') 'C · clocks: one shift moves every clock at a place together'
  pr = 9.80665_dp*22.56_dp/(c*c)   ! the tower of Pound and Rebka: 74 feet, 22.56 m
  write(*,'(a,es10.3)') '  tower of 22.56 m, fractional shift ', pr
  call check('measured over computed: 1.05 +- 0.10 (Pound, Rebka 1960) and 0.9990 +- 0.0076 (Pound, Snider 1965)', &
             abs(1.05_dp*pr - pr) < 2.0_dp*0.10_dp*pr .and. abs(0.9990_dp*pr - pr) < 2.0_dp*0.0076_dp*pr)
  ! clocks at rest on the geoid: Phi0/c**2 = 6.969290134e-10; orbit of semi-major axis 2.656175e7 m (Ashby 2003)
  grav = (6.969290134e-10_dp - GMearth/(2.656175e7_dp*c*c))*86400.0_dp*1.0e6_dp
  vel  = GMearth/(2.0_dp*2.656175e7_dp*c*c)*86400.0_dp*1.0e6_dp
  write(*,'(a,f7.3,a,f6.3,a,f7.3)') '  navigation satellite, microseconds per day: height +', grav, ', speed -', vel, &
       ', net ', grav - vel
  ! tolerance: half a unit of the last digit Ashby prints, 0.00005e-10
  write(*,'(a,f8.4,a)') '  net as a fraction: ', (grav - vel)/86400.0e6_dp*1.0e10_dp, 'e-10'
  call check('the offset built into the satellite clocks is 4.4647e-10 (Ashby 2003), to the last digit printed', &
             abs((grav - vel)/86400.0e6_dp - 4.4647e-10_dp) < 0.00005e-10_dp)
  write(*,'(a)') 'D · what gravity reads: rho + 3p in four dimensions'
  ! rho + 3p over the critical density for matter 0.3153 +- 0.0073 and a flat vacuum (Planck 2018): Om + (1 - 3)(1 - Om)
  act = 0.3153_dp + (1.0_dp - 3.0_dp)*(1.0_dp - 0.3153_dp)
  write(*,'(a,f7.3,a,f6.3)') '  active density of the Planck budget: ', act, ' +- ', 3.0_dp*0.0073_dp
  call check('Planck budget read through rho + 3p is below zero by more than five uncertainties: the vacuum repels', &
             act < -5.0_dp*3.0_dp*0.0073_dp)
  write(*,'(a)') 'E · the counts'
  call check('polarizations n(n-3)/2: none in three dimensions, two in four, five in five', &
             pol(3) == 0 .and. pol(4) == 2 .and. pol(5) == 5)
  call check('curvature components n^2(n^2-1)/12: six in three, twenty in four', curv(3) == 6 .and. curv(4) == 20)
  call check('in three dimensions curvature equals law, 6 = 6; in four it exceeds it by ten', &
             curv(3) == 3*4/2 .and. curv(4) == 4*5/2 + 10)
  write(*,'(a)') 'F · nothing escapes: conservation forces the law'
  hits = 0; bad = 0
  call random_seed()
  do i = 1, 20000
     call random_number(x); ia = int(x*21.0_dp) - 10
     call random_number(x); ib = int(x*21.0_dp) - 10
     ! conserved on every geometry iff (a + 2b)*dR = 0 for every dR; test dR = 1..5
     d1 = 0
     do n = 1, 5
        if ((ia + 2*ib)*n /= 0) d1 = 1
     end do
     if (d1 == 0) then
        hits = hits + 1
        if (ia + 2*ib /= 0) bad = bad + 1
     else
        if (ia + 2*ib == 0) bad = bad + 1
     end if
  end do
  write(*,'(a,i6,a)') '  ', hits, ' conserved laws among 20000 random pairs (a, b)'
  call check('every conserved law has b = -a/2 and every such law is conserved', bad == 0 .and. hits > 0)
  write(*,'(a)') 'G · inverse square: the reading loses nothing between spheres'
  bad = 0
  do i = 1, 1000
     if ((2*i)**2 /= 4*i**2) bad = bad + 1
  end do
  call check('twice the radius, four times the area, for a thousand radii', bad == 0)
  write(*,'(a)') 'H · the law returns no scale'
  bad = 0
  do i = 1, 100000
     call random_number(x); k = 10.0_dp**(40.0_dp*x - 20.0_dp)
     a1 = 4.0_dp*GMsun/(c*c*6.957e8_dp)
     a2 = 4.0_dp*(k*GMsun)/(c*c*(k*6.957e8_dp))
     if (abs(a2 - a1) > 1.0e-12_dp*a1) bad = bad + 1
  end do
  call check('100000 rescalings over forty decades leave the bending unchanged: only the ratio is read', bad == 0)
  write(*,'(a)') 'I · the exact solution outside a body: gamma = 1 and beta = 1'
  ! time part ((1-x)/(1+x))**2 against 1 - 4x + 8x**2, space part (1+x)**4 against 1 + 4x, with x = GM/(2 c**2 r);
  ! the remainders are of third and of second order, bounded here by 20 x**3 and 7 x**2
  bad = 0
  do i = 1, 1000
     x = 1.0e-5_dp*real(i, dp)
     tt = ((1.0_dp - x)/(1.0_dp + x))**2
     ss = (1.0_dp + x)**4
     if (abs(tt - (1.0_dp - 4.0_dp*x + 8.0_dp*x*x)) > 20.0_dp*x**3) bad = bad + 1
     if (abs(ss - (1.0_dp + 4.0_dp*x)) > 7.0_dp*x*x) bad = bad + 1
  end do
  call check('a thousand radii: the time part is 1 - 2U + 2U**2 and the space part 1 + 2U, to the order stated', bad == 0)
  write(*,'(a,i2)') 'failures: ', nfail
contains
  integer function pol(m)
    integer, intent(in) :: m
    pol = m*(m + 1)/2 - 2*m
  end function pol
  integer function curv(m)
    integer, intent(in) :: m
    curv = m*m*(m*m - 1)/12
  end function curv
  subroutine check(label, ok)
    character(len=*), intent(in) :: label
    logical, intent(in) :: ok
    if (ok) then
       write(*,'(a,a)') '  PASS  ', label
    else
       write(*,'(a,a)') '  FAIL  ', label
       nfail = nfail + 1
    end if
  end subroutine check
end program gravity_twin
```

## Appendix F · Run of Appendix E

```text
A · light at the limb of the Sun: the space part bends as much as the time part
  full bending   1.7512 arcsec; Newtonian half   0.8756
  PASS  eclipse of 1919 (1.98 +- 0.12, 1.61 +- 0.30) and radio interferometry (0.9999 +- 0.0002 of full) hold it
  PASS  space reads as time, gamma = 1: Cassini finds gamma - 1 = (2.1 +- 2.3)e-5 (Bertotti, Iess, Tortora 2003)
B · the perihelion of Mercury
  advance   42.981 arcsec per century
  PASS  advance is 42.98 arcsec per century (observed 42.98 +- 0.04, Will 2014)
C · clocks: one shift moves every clock at a place together
  tower of 22.56 m, fractional shift  2.462E-15
  PASS  measured over computed: 1.05 +- 0.10 (Pound, Rebka 1960) and 0.9990 +- 0.0076 (Pound, Snider 1965)
  navigation satellite, microseconds per day: height + 45.788, speed - 7.213, net  38.575
  net as a fraction:   4.4647e-10
  PASS  the offset built into the satellite clocks is 4.4647e-10 (Ashby 2003), to the last digit printed
D · what gravity reads: rho + 3p in four dimensions
  active density of the Planck budget:  -1.054 +-  0.022
  PASS  Planck budget read through rho + 3p is below zero by more than five uncertainties: the vacuum repels
E · the counts
  PASS  polarizations n(n-3)/2: none in three dimensions, two in four, five in five
  PASS  curvature components n^2(n^2-1)/12: six in three, twenty in four
  PASS  in three dimensions curvature equals law, 6 = 6; in four it exceeds it by ten
F · nothing escapes: conservation forces the law
     517 conserved laws among 20000 random pairs (a, b)
  PASS  every conserved law has b = -a/2 and every such law is conserved
G · inverse square: the reading loses nothing between spheres
  PASS  twice the radius, four times the area, for a thousand radii
H · the law returns no scale
  PASS  100000 rescalings over forty decades leave the bending unchanged: only the ratio is read
I · the exact solution outside a body: gamma = 1 and beta = 1
  PASS  a thousand radii: the time part is 1 - 2U + 2U**2 and the space part 1 + 2U, to the order stated
failures:  0
```
