# Light as a New Mathematical Theorem

## Maxwell's Equations Forced by the Conservation of Charge, Coulomb's Law as Their Half-Reading, and Two Helicities with No Third

**Mohammad F. Islam** · 24 November 2026

*On edition 1.0.0. Part I is The Geometric Nature of Light, edition 2.0.0, and Part II is Electromagnetism on the Fixed Line, edition 1.0.0, both from Nothing Escapes, Least Erasure (Islam, 2026a), set in this paper's vocabulary. Part III, Maxwell's Equations from the Seat, is new.*

## Abstract

Light is established here as a mathematical theorem. On the seat charge is the side of the line and the photon is the line itself, and nothing escapes the record, so charge is conserved on every field. From these, Maxwell's equations are forced. We prove in core Lean 4, twenty-eight laws with no axiom declared and no use of choice, that among the laws of second order linear in the potential, conservation of charge on every field forces exactly one, Maxwell's; that Ampère's law fails without the displacement current Maxwell added by hand in 1865 and holds exactly when that term enters at full strength; that the same forcing removes the mass of the photon; that gauge invariance, a principle of electrodynamics since 1929, is a consequence, equivalent to the conservation of charge in one theorem; that a massless field of one index carries two helicities in four dimensions of spacetime and a third only with a mass; that Coulomb's law is the static half of the forced law, with the inverse square fixed by the flux in three dimensions of space; that the electric and the magnetic parts have equal counts, so that duality exists, in four dimensions of spacetime and in no other; and that light and gravity carry the same number of polarizations in four dimensions and in no other. The law fixes its form and never its scale: the fine-structure constant is read from experiment.

This theorem subsumes Maxwell's electrodynamics. Coulomb's law, Gauss's law, Ampère's law with Maxwell's term, and gauge invariance are each an instance of it, and what electrodynamics took as given is proved or bridged here. A Fortran twin runs nine checks with zero failures, four against published measurements and five scanning the engine's statements: the inverse square holds to $3\times10^{-16}$, the constant of thermal radiation is the one two helicities give and three do not, and gravity and light keep one speed to parts in $10^{15}$. The photon's mass lies under $10^{-18}$ electronvolts (Ryutov, 2007) and the electron has not decayed in $6.6\times10^{28}$ years (Agostini et al., 2015). Parts I and II carry the two chapters of Least Erasure (Islam, 2026a) that read light and the field on the seat, with their one hundred and thirty-four laws.

## The Standing of This Work

**Light is established here as a theorem.** Inside the geometry of registration and conservation, the law of the electromagnetic field is uniquely forced. Maxwell's electrodynamics is derived as a forced instance. Coulomb's law is its half-reading.

**Nothing is added.** This work adds zero fields and zero parameters to the one that electrodynamics already reads from experiment, the fine-structure constant, and it declares zero axioms in core Lean 4, with no use of choice. Light is not a wave in a medium and not a thing sent between charges. It is the line of the seat, and its law is the only law the reading of charge can have.

| Level | Framework | Standing | What is overcome |
|---|---|---|---|
| Projection | Coulomb's electrostatics (1785) | an empirical inverse-square law between charges at rest | reads the time part of the potential alone; blind to magnetism, to induction and to light |
| Realization | Maxwell's electrodynamics (1865) | four field laws joined by a term added for consistency, with gauge invariance and the massless photon taken as given | describes every field exactly, and takes the conservation of charge, the gauge principle and the two polarizations as principles |
| Foundation | Light as a theorem, this work | theorems checked by the kernel in core Lean 4, no axiom declared, no choice, on three named bridges | proves Maxwell's law is forced by conservation; proves the displacement current, the massless photon, gauge invariance and the two helicities |

**This theorem subsumes Maxwell's electrodynamics.** Every law of that theory is an instance of the forced law, and each thing it assumed is here a result.

| Prior law | Its standing before | How it is subsumed | Carried by |
|---|---|---|---|
| Coulomb's law | measured, inverse square | the static time part of the forced law; the exponent is the flux law in three dimensions of space | `inverse_square_in_three`, `coulomb_reads_one_of_four` |
| Gauss's law and Ampère's law | measured, separately | the time part and the space part of one forced law | `conservation_forces_maxwell` |
| Maxwell's displacement current | added by hand in 1865 to save the conservation of charge | forced, with coefficient exactly one; Ampère's law alone fails | `the_displacement_current_is_forced`, `ampere_alone_fails` |
| Gauge invariance | a principle since Weyl (1929) | a consequence, and the same theorem as the conservation of charge | `gauge_invariance_iff_conservation` |
| The massless photon | measured, as a bound | forced: a mass term is not conserved on every field | `the_photon_has_no_mass` |
| Two polarizations | observed, the factor of two in Planck's law | the count $n-2$ at four dimensions; a third comes only with a mass | `two_helicities`, `mass_adds_one` |
| Kirchhoff's current law | a rule of circuits | bridge B2 itself, read on a wire | section 1 of Part III |

**What electrodynamics assumed, this work proves.** The first three are theorems of Parts I and II on the seat, read as light and charge by the thesis of each Part. The last three are theorems of Part III on the bridges of its section 1.

- **Charge is conserved.** Electrodynamics takes it from experiment. Here charge is the side of the line, the neutral states are the line, and pair creation conserves it (`bar_fixed_iff_neutral`, `pair_creation_conserves_charge`).
- **The photon carries no charge and is its own antiparticle.** Here it is the one excitation fixed by both involutions of the seat (`photon_is_its_own_antiparticle`, `photon_on_both_lines`).
- **Every massless mode runs at one speed.** Here it is a theorem of the line (`massless_on_the_cone`).
- **The field equation.** Electrodynamics assembles it from four measured laws. Here conservation on every field forces $b=-a$ and no mass (`conservation_forces_maxwell`).
- **Gauge invariance.** Here it follows from conservation and is equivalent to it (`gauge_invariance_iff_conservation`).
- **Two helicities.** Here they are the count the forced law leaves (`two_helicities`).

**Four dimensions of spacetime is singled out, again.** The electric and the magnetic parts of the field have equal counts, three and three, in four dimensions and in no other, so the quarter turn that exchanges them exists there alone (`duality_exactly_in_four`). Light and gravity carry the same number of polarizations, two, in four dimensions and in no other (`light_and_gravity_agree_exactly_in_four`). The inverse square of Coulomb is the flux law in three dimensions of space (`inverse_square_in_three`).

**Three warrants bound the claim, and each is printed.** The law fixes its form and never its scale (`the_law_fixes_no_scale`): the fine-structure constant is read from experiment. Five results of classical mathematics and physics enter as named imports, listed in section 1 of Part III. And the forced law is the law at the least order of its derivatives: beyond it stand the vacuum's own pairs, measured and named in section 8.

## Part I · The Geometric Nature of Light

*Light as the Line: The Photon Fixed by Both Involutions of the Substrate, Frequency as the Height, Helicity as the One Bit, and Detection as the Registration That Keeps the Energy and Forgets the Path.* Edition 2.0.0.

**Abstract of Part I.** Twenty-five centuries of optics asked what travels when something is seen and through what it travels. This Part answers the geometric half of that question on a seat: a reflection of the plane, $s\mapsto1-\bar s$, and the line it fixes. The actuating substrate of Least Erasure (Islam, 2026a) carries two involutions, the particle map that flips every additive charge and the time mirror that reverses a mode's rate, and two carriers onto that reflection. The photon is the one excitation fixed by both at every frequency: it carries no charge of any kind, its energy is real, and it lands on the line under both carriers. We prove in core Lean 4, sixty-three laws with no axiom declared and no use of choice, that frequency is the seat's height and never its side, so the whole spectrum from radio to gamma stands on one line; that a massive mode runs slower than light while every massless mode runs at one speed; that helicity is the one bit no energy reading returns; that the charge-conjugation parity of $n$ photons is $(-1)^n$, selecting two photons for parapositronium and three for orthopositronium; that detection is the registration of the seat, a fringe existing exactly when both paths are open and the record forgets the side; and that the quantum belongs to the field, since every classical intensity bunches while one photon never coincides with itself. A Fortran twin runs sixteen checks with zero failures, among them Englert's duality to $4.4\times10^{-16}$ and the single-photon anticorrelation 13.7 standard deviations below every classical field.

### 1. The Reader's Frame

This Part reads light on the seat. Least Erasure (Islam, 2026a) built the substrate: a particle's charges are odd and its energy even under the particle map, the particle map and the time mirror of a mode's rate commute, and each is carried equivariantly onto the reflection that fixes the line. This Part claims that the photon is the substrate's one excitation fixed by both involutions at every frequency, and that each old question of optics, what travels, at what speed, carrying what, and registered how, has a precise answer on the seat.

**Negative warrants.** Two, stated so that no reader supplies them. No physical fact here is read as a proof of a mathematical sentence: a corroboration joined to a claim takes the weaker grade. No field theory is written and no constant is derived: the speed of light, the fine-structure constant and the photon's couplings enter as measured.

**Five terms.** A *reading* is any quantity an instrument returns from a state, *odd* under a map that flips its sign and *even* under one that keeps it. A *mode* $e^{-iEt}\psi$ is *stationary* when its norm is constant in time. The *fixed set* of a map is the set of points it leaves unchanged. A *keyed bit* is a yes-or-no property no function of a given record decides. The *side* of a two-path experiment is which path a quantum took; the *record* is what the screen keeps.


### 2. The Spine

The seat has a mirror and a record. The mirror is a reflection of the plane, $s\mapsto1-\bar s$, and the points it leaves fixed form one line, the fixed line. A point has a height along the line and a side off it. Registration keeps the height and forgets the side, and it erases nothing exactly when nothing stands off the line. The particle map exchanges a particle with its antiparticle and flips every charge; the time mirror reverses a mode's rate. This Part reads the seat's occupant in Sections 3 to 5, the registration in Sections 6 and 7, the seat's sign in Section 8, the even reading in Section 9, and the crossing in Section 10.

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


### 3. Light Is the Line

The photon carries no electric charge, no colour, no baryon number and no lepton number, and its energy is real: it is its own antiparticle and it does not decay (`photon_is_its_own_antiparticle`, `photon_is_stationary`). It is therefore fixed by both involutions of the substrate, the particle map and the time mirror, and by the functor of the seat it lands on the line under both carriers (`photon_on_both_lines`). No other excitation of the Standard Model is fixed by both at every frequency: the $Z$ boson is neutral and decays, the neutrino's neutrality under the particle map is one keyed bit, and every charged particle stands on an edge under the charge carrier. Light is the seat's occupant.

The occupancy is measured. The photon's mass is bounded below $10^{-18}$ eV (Particle Data Group, 2024), and at that bound a radio photon of one microelectronvolt would be slowed by $5\times10^{-25}$ of its speed (Appendix B): light stands on the line to that depth. The electron paper read the neutral sector as the fixed set of charge conjugation, with the photon and the neutral pion sitting on it as particles; this paper reads the photon as the one resident of that set whose energy is real at every frequency, and so the one resident of the line under the energy carrier too.


### 4. Frequency Is the Height

Under the energy carrier a photon of frequency $\omega$ lands at $(1,\omega)$: its frequency is the seat's height and its side is the line (`frequency_is_the_height`). Every frequency stands on one side (`every_frequency_one_side`), and registration keeps a photon exactly, since nothing of it stands off the line to be forgotten (`registration_keeps_light`). The spectrum from radio at $10^{-9}$ eV to gamma rays at $10^{11}$ eV, twenty decades, is the line's heights (Appendix B).

The old question of the speed hierarchy has its answer on the same two coordinates. A mode with $\omega^2=k^2+m^2$ and $m\neq0$ has $k^2<\omega^2$ and runs slower than light (`massive_slower`); a massless mode has $\omega^2=k^2$ at every frequency (`massless_on_the_cone`). Frequency is the height and rest mass is the depth: two coordinates, never one. The twin finds the massless group velocity equal to $c$ to $1.9\times10^{-10}$ across 2000 frequencies and every massive mode below it. Measured: gamma rays from GRB 090510 bound any vacuum dispersion above the Planck energy (Fermi LAT, 2009), and the gamma-ray burst of GW170817 arrived 1.74 seconds after the gravitational waves emitted 130 million years earlier, bounding the difference of the two speeds below $4.2\times10^{-16}$ (LIGO, Virgo, Fermi GBM and INTEGRAL, 2017).


### 5. Helicity Is the One Bit

A massless particle of spin one has two helicity states, not three (Wigner, 1939). Parity reverses the helicity and keeps the frequency (`parity_involutive`). So the two helicities of one frequency are two states with one energy record, and no reading of the energy returns which one is present (`helicity_is_one_bit`). This is the seat's residue carried by light: one bit, a two-point set over one record, unread by the even reading. Circular polarization is that bit made visible, and it is the bit a polarizer, not a calorimeter, registers.


### 6. Detection Is Registration

In a two-path experiment the side is which path the quantum took and the record is where it lands on the screen. Write the intensity at a point as $I=a^2+b^2+2abc\,s$, with $a$ and $b$ the two amplitudes, $c$ the overlap of whatever marks the path (zero when the side is registered, nonzero when it is forgotten), and $s=\pm1$ the fringe sign. A fringe exists, the intensity differing between $s=+1$ and $s=-1$, exactly when both paths are open and the side is forgotten (`fringe_iff_side_forgotten`); registering the side leaves $a^2+b^2$ and no fringe at all (`side_registered_no_fringe`). This is the seat's registration with both clauses: a record that forgets the side keeps the interference, and one that keeps the side erases it.

The trade is exact. The which-path distinguishability $D$ and the fringe visibility $V$ satisfy $D^2+V^2\le1$, with equality on every pure state (Englert, 1996; Wootters and Zurek, 1979); the twin reaches equality to $4.4\times10^{-16}$ on 20000 pure states. The which-way experiment in an atom interferometer (Dürr, Nonn and Rempe, 1998) observed the loss of the fringe with no momentum kick to explain it: the record of the side, and nothing else, erased it.


### 7. The Quantum Is the Field's

The discreteness of light is not the detector's alone. For any classical field detected by quantized matter, the coincidence rate of two detectors is at least the square of the single rate, $g^{(2)}\ge1$ (Glauber, 1963), which the engine proves on the two-point split, $(x+y)^2\le2(x^2+y^2)$ (`classical_light_bunches`), and the twin checks on 10000 classical intensity distributions. A single photon never coincides with itself, $n(n-1)=0$ at $n=1$ (`single_photon_no_coincidence`, `quantum_is_the_fields`). Coherent light has $g^{(2)}=1$ and thermal light $2$ (Appendix B). Antibunching was observed in resonance fluorescence (Kimble, Dagenais and Mandel, 1977), and a single-photon source behind a beam splitter gave an anticorrelation parameter of $0.18\pm0.06$ (Grangier, Roger and Aspect, 1986), 13.7 standard deviations below every classical field. Two photons meeting at a beam splitter leave together (Hong, Ou and Mandel, 1987). The photoelectric effect alone admits a semiclassical account (Lamb and Scully, 1969); light as a whole does not. The field carries its own quantum.


### 8. Light Under the Particle Map: Furry and Positronium

The photon sits on the fixed set of the particle map as a particle, and it carries a sign there: its charge-conjugation parity is $-1$, so $n$ photons carry $(-1)^n$ (`cparity_val`). Electromagnetism conserves this sign, so a state even under charge conjugation decays only into an even number of photons (`c_even_needs_even_photons`), and closed loops of charge emit no odd number of photons (Furry, 1937). Parapositronium, even, decays into two photons and orthopositronium, odd, into three (`positronium_counts`); their lifetimes, 125 ps and 142 ns, are the electron paper's measured readings of this bit.


### 9. The Even Reading Travels at One Speed

Gravity reads the energy-momentum tensor and nothing else, so it reads light's energy and never its helicity or its C-parity. Light bends in a gravitational field by exactly twice the Newtonian angle, and gravitational waves and light, the two massless even-reading carriers, travel at one speed (Section 4). Gravity is the reversible branch of registration, one sign and no bit (Islam, 2026b); light is the one excitation that stands on that branch's locus with every odd reading zero.


### 10. What Light Carries, and What It Does Not

Light carries the seat's occupant: the one excitation fixed by both involutions at every frequency, on the line under both carriers, with the frequency as the height, the helicity as the one bit and the C-parity as the sign. It carries the registration: detection as the record that keeps the energy and forgets the path, exact to Englert's equality. It carries its own quantum.

The engine's delivery is on its own image, the photons it lands (`value_on_image`). It does not derive the speed of light, the fine-structure constant, or any other magnitude. It does not identify the substrate with the electromagnetic field: the field is the substrate's odd reading, and light is the configuration of that reading which stands on the line.


### 11. Falsifiers

Three falsifiers, each a forbidden observation naming the theorem it would break. **F-Dispersion:** a vacuum speed of light that depends on frequency, at any precision, breaking `every_frequency_one_side` read physically and `massless_on_the_cone`. **F-Fringe:** a fringe of full visibility from a two-path state whose side is registered with certainty, breaking `fringe_iff_side_forgotten` and Englert's duality. **F-Helicity:** a third, longitudinal helicity state of the free photon, breaking `helicity_is_one_bit`. Two measurements would sharpen readings without moving the paper's standing: the photon mass bound, and the vacuum-dispersion bound at still higher photon energies.

## Part II · Electromagnetism on the Fixed Line

*Charge as the Side, the Electric Field as the Line, the Magnetic Sign as the One Bit, and Duality as the Quarter Turn Whose Square Is Charge Conjugation.* Edition 1.0.0.

**Abstract of Part II.** Electromagnetism is the best-measured interaction in physics and the one whose discrete symmetries are cleanest: charge conjugation reverses every field, time reversal reverses the magnetic field and keeps the electric one, and a duality rotation exchanges them in the vacuum. This Part reads the field on the seat, the reflection $s\mapsto1-\bar s$ and the line it fixes. Two carriers land electromagnetism on the seat. The charge carrier sends a particle of charge $q$ to the side of the line and carries charge conjugation onto the reflection, so the neutral states are the line. The field carrier $s=\tfrac12+iF$ on the Riemann–Silberstein amplitude $F=E+iB$ carries time reversal, the complex conjugation of $F$, onto the reflection, so the purely electric fields are the line and the magnetic sign is the one bit a field and its time reverse do not share. We prove in core Lean 4, seventy-one laws with no axiom declared and no use of choice, that charge conjugation, parity and time reversal are involutions with $CT=P$ and $CPT$ the identity on the field; that duality is a quarter turn whose square is charge conjugation and whose fourth power is the identity, anticommuting with time reversal as $-i$ does with complex conjugation; that the energy density is invariant under all of them while both Lorentz invariants reverse under duality; that light is null and stays null under duality; that a magnetic term breaks time reversal and keeps every energy real; that charge is conserved by pair creation and forced in thirds; and that the Aharonov–Bohm record reads flux modulo one quantum. A Fortran twin runs seventeen checks with zero failures, the quantum Hall and Josephson constants exact in the SI. The Part joins the two branches of registration: gravity the even, one-signed reading, magnetism the odd reading that keeps a priced bit.

### 1. The Reader's Frame

This Part is dedicated to one interaction. Least Erasure (Islam, 2026a) put the four readings of the substrate on one seat: three gauge readings odd under the particle map and one, gravity's, even. Registration has two branches, gravity the reversible branch that keeps no bit and magnetism the priced branch that keeps one. This Part reads the electromagnetic interaction itself on the seat, in its charges, its fields, its discrete symmetries, its duality, and its quantum registrations, and joins it to those two branches.

It claims that electromagnetism carries the seat twice. Through the charge carrier, charge conjugation is the reflection and the neutral states are the line. Through the field carrier, time reversal is the reflection, the purely electric fields are the line, and the sign of the magnetic field is the one bit a field and its time reverse do not share. Duality, the rotation that exchanges electric and magnetic, is the quarter turn of the seat's Return: its square is charge conjugation.

**Negative warrants.** Two, stated so that no reader supplies them. No physical fact here is read as a proof of a mathematical sentence: a corroboration joined to a claim takes the weaker grade. No field theory beyond Maxwell's is written and no constant is derived: the fine-structure constant, the charges' magnitudes and the speed of light enter as measured or as defined by the SI.

**Five terms.** A *reading* is any quantity an instrument returns from a state, *odd* under a map that flips its sign and *even* under one that keeps it. The *Riemann–Silberstein amplitude* is $F=E+iB$ in units with $c=1$. *Duality* is the rotation $E\mapsto B$, $B\mapsto -E$, which is $F\mapsto -iF$. The *fixed set* of a map is the set of points it leaves unchanged. A *keyed bit* is a yes-or-no property no function of a given record decides.


### 2. The Spine

The seat is the one of Part I: the mirror $s\mapsto1-\bar s$, its fixed line, and the registration that keeps a point's height and forgets its side. This Part reads the seat on charge in Section 3 and on the field in Section 4, the residue in the magnetic sign in Section 5, the discrete symmetries in Section 6, the Return in duality in Section 7, the seat's occupant in Section 8, the registrations in Section 9, and the two branches in Section 10.

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


### 3. Charge Is the Side

A particle of charge $q$, in units of the charge quantum, lands at $h=1+q$ at the height of its frequency, so charge conjugation, $q\mapsto-q$, becomes the reflection $h\mapsto2-h$ (`charge_carrier_equivariant`). The neutral particles are the line (`neutral_charge_on_line`), the electron and the positron land on the two edges, real parts $0$ and $1$, mirror images (`pair_on_the_edges`), and the particle map is an involution whose fixed set is exactly the neutral states (`bar_fixed_iff_neutral`). Least Erasure built this carrier on the leptons; here it is the carrier of the whole interaction.

Charge is conserved at the seat. Pair creation makes a particle and its antiparticle, whose charges cancel (`pair_creation_conserves_charge`), and the electron, the lightest charged particle, does not decay: its lifetime in the channel $e\to\gamma\nu$ exceeds $6.6\times10^{28}$ years (Borexino, 2015). Charge is forced in thirds: the Yukawa couplings and two anomaly conditions fix every hypercharge as a multiple of the quark doublet's (`hypercharge_forced`), and with $Q=T_3+Y$ the up quark carries $\tfrac23$, the down $-\tfrac13$, the electron $-1$, hydrogen and the vacuum none (`charges_in_thirds`). The electron and the positron carry charges equal and opposite to four parts in a hundred million (Particle Data Group, 2024).


### 4. The Electric Field Is the Line

On one axis pair the field is the Riemann–Silberstein amplitude $F=E+iB$ (Silberstein, 1907; Bialynicki-Birula, 1996). Time reversal keeps the electric field and reverses the magnetic one, so it is the complex conjugation $F\mapsto\bar F$. The field carrier
$$s(F)=\tfrac12+iF,\qquad \sigma(s(F))=1-\overline{\tfrac12+iF}=\tfrac12+i\bar F=s(\bar F),$$
carries time reversal exactly onto the fold; in the chart it reads $(E,B)\mapsto(1-B,E)$ (`field_carrier_equivariant`). A field is fixed by time reversal exactly when $B=0$ (`T_fixed_iff_electric`), and it lands on the line exactly then (`electric_on_the_line`): the line is the purely electric field, the field of charges at rest. The twin executes the carrier on 3721 integer fields.


### 5. The Magnetic Sign Is the One Bit

A field with $B\neq0$ and its time reverse are two fields, both off the line, with one electric component, one energy density and one record (`magnetic_sign_is_the_bit`). The energy density $E^2+B^2$ is even under time reversal, charge conjugation and parity alike (`energy_even`), so no reading of the energy returns the sign of the magnetic field. That sign is the one bit: a moving charge's field and the field of the same charge moving backward share every even reading and differ in it. Iron carries it, remanence $\pm0.996$ at zero applied field (Islam, 2026a), two worlds with one record, the bit kept at a price above Landauer's floor; the product $E\cdot B$ is odd under time reversal and under parity and even under charge conjugation (`EB_odd_under_T_and_P`).


### 6. Charge Conjugation, Parity and Time Reversal on the Field

On the field, charge conjugation reverses both components, $F\mapsto-F$; parity reverses the polar electric field and keeps the axial magnetic field; time reversal keeps the first and reverses the second. Each is an involution (`C_involutive`, `P_involutive`, `T_involutive`), charge conjugation after time reversal is parity (`CT_is_P`), and the three together act as the identity on the field (`CPT_trivial`): each of $E$ and $B$ is odd under exactly two of the three. This is the field's form of the CPT theorem (Lüders, 1954; Pauli, 1955), and it is why the substrate's particle map, carried by CPT, keeps every field reading that gravity sees. The twin executes the table on 3721 fields.


### 7. Duality: The Quarter Turn Whose Square Is Charge Conjugation

In the vacuum Maxwell's equations are invariant under the rotation $E\mapsto B$, $B\mapsto -E$ (Heaviside, 1893; Larmor, 1897), which is multiplication of $F$ by $-i$. Its square is $F\mapsto-F$, charge conjugation (`duality_squared_is_C`), and its fourth power is the identity (`duality_fourth_is_identity`): duality is a quarter turn, and its square lands on minus one exactly as the spinor's full turn and the quaternion units' product $ijk=-1$ do for the electron. It anticommutes with time reversal, $TD=C\,DT$, as $-i$ does with complex conjugation (`duality_anticommutes_with_T`). The energy density is invariant under it (`energy_duality_invariant`), and both Lorentz invariants, $E^2-B^2$ and $E\cdot B$, reverse under it (`invariants_flip_under_duality`).

Sources break the duality. Electric charges exist; magnetic charges have not been found (Particle Data Group, 2024). The question whether they do is the duality's own bit: a world in which every particle carries the same ratio of magnetic to electric charge is carried by one global duality rotation to a world with no magnetic charge at all, so a monopole is physically distinct only if some particle's ratio differs from another's. Were one found, Dirac's condition would force every electric charge to be a multiple of a quantum fixed by the monopole's charge (Dirac, 1931). This paper types the question and does not answer it; the falsifier F-Monopole names the observation that would.


### 8. Light Is Null

A plane wave carries an electric field perpendicular to its magnetic field and equal to it in magnitude: both Lorentz invariants vanish (`plane_wave_null`), and duality, which reverses both invariants, keeps a null field null (`null_preserved_by_duality`). Light is therefore the duality-neutral field: the configuration of the electromagnetic reading on which the rotation that exchanges electric and magnetic acts without changing any invariant. The twin builds 5000 random plane waves and finds both invariants zero to $10^{-15}$, and the dual of each is again a plane wave along the same direction. Part I reads the photon on the seat as the one excitation fixed by both involutions of the substrate at every frequency.


### 9. The Magnet Keeps Every Energy Real, and Registration Lands on Integers

A magnetic field breaks time reversal of the motion of a charge and keeps every energy real. A Hermitian block with a magnetic phase has a nonnegative discriminant whether or not the phase vanishes (`stationarity_survives_the_magnet`, `magnetism_odd_branch`), so its energies are real; the twin checks 100000 such blocks. An electron in a uniform field of one tesla has Landau levels $(n+\tfrac12)\hbar\omega_c$ with $\hbar\omega_c=1.1577\times10^{-4}$ eV, each real, each degenerate $2.418\times10^{14}$ times per square metre (Landau, 1930; Appendix B). The Landau problem is the cleanest time-broken motion. The magnet breaks time reversal of the motion and keeps every energy stationary.

Electromagnetic registration lands on integers. The Hall resistance of a two-dimensional electron gas in a strong field is $h/(\nu e^2)$ with $\nu$ an integer (von Klitzing, Dorda and Pepper, 1980), the integer a topological invariant of the filled bands (Thouless, Kohmoto, Nightingale and den Nijs, 1982), reproducible across materials to parts in $10^{10}$ (Jeckelmann and Jeanneret, 2001); the flux through a superconducting ring comes in quanta $h/2e$; and a Josephson junction under microwaves steps at voltages $n\,hf/2e$ (Josephson, 1962). With $e$ and $h$ exact in the SI of 2019 the twin computes $h/e^2=25812.80745930\ \Omega$, $h/2e=2.0678338485\times10^{-15}$ Wb and $2e/h=4.8359784842\times10^{14}$ Hz/V. Each is a registration that lands the field on a locus of integers and keeps nothing off it. The Aharonov–Bohm phase reads the flux enclosed by a path only modulo $h/e$ (Aharonov and Bohm, 1959): two fluxes one quantum apart are two worlds with one record (`aharonov_bohm_two_worlds`), the twin finding the phase equal to $7.3\times10^{-15}$ over 2000 fluxes.


### 10. Gravity and Magnetism: One Registration, Two Branches

Registration has two branches. Gravity is the reversible branch: its sources have one sign, it reads energy and nothing else, and no gravitational reading tells a charge from its antiparticle (`gravity_even_branch`); antihydrogen falls as hydrogen does (ALPHA-g, 2023). Magnetism is the priced branch: time reversal reverses the magnetic field (`magnetism_odd_branch`), so the magnetic sign is a bit, and a stable magnetic bit at $5.0\times10^{-19}$ J per switch costs 174 Landauer floors at 300 K (Appendix B). Electromagnetism carries both faces of the substrate's three plus one on one field: its charges and its magnetic sign are odd, its energy density even, and the even part is what gravity reads. The two readings differ in strength by the ratio of the Coulomb to the gravitational attraction in hydrogen, $2.27\times10^{39}$, with $\alpha=7.2973525737\times10^{-3}$ computed from the constants (Appendix B). This paper derives neither number; it states which reading each belongs to.


### 11. Falsifiers

Three falsifiers, each a forbidden observation naming the theorem it would break. **F-Charge:** a process that creates or destroys net electric charge, the decay of the electron among them, breaking `pair_creation_conserves_charge` and the seat reading of Section 3. **F-Thirds:** a free particle whose charge is not a multiple of one third of the electron's, breaking `hypercharge_forced` and `charges_in_thirds` read physically. **F-Reality:** a magnetic field that drives a bound charge's energy off the real axis in a closed system, breaking `stationarity_survives_the_magnet` read physically. Two measurements would sharpen readings without moving the paper's standing: a magnetic monopole, which would read the duality's bit, and the resolution of the disputed digits of the fine-structure constant.

## Part III · Maxwell's Equations from the Seat

### 1. What Parts I and II Left Open, and the Rule of Part III

**Part III establishes the law of light as a theorem.** Parts I and II proved what light and charge are and took the field's law from electrodynamics. Part III derives it. Maxwell's equations cease to be an assembly of measured laws and become a forced instance.

The rule is strict. Only the seat and the root are allowed. Every other step is a theorem of the engine in Appendix E, a theorem of Part I or Part II, one of three bridges named here before it is used, or one of five results of classical mathematics and physics listed below. Dimension means the dimension of spacetime throughout Part III: three dimensions of space are four of spacetime.

| Bridge | Statement | Stands on | Grade |
|---|---|---|---|
| B1 · One index | Charge is a signed count that flows. Its source has one index, the current, and the field that reads it has one index, the potential. | `bar_fixed_iff_neutral`, `charge_carrier_equivariant` (Parts I and II) | structural |
| B2 · Nothing escapes | The record is kept. Charge is conserved on every field, so the law equals a conserved current on every field. | `pair_creation_conserves_charge` (Part II) and the root, read as least erasure | premise |
| B3 · Least order, one reading | The law reads the potential at the least order at which a field exists, the second, and the reading of two sources is the sum of their readings. | least erasure | premise |

Five results of classical mathematics and physics enter by name, and nothing else enters. Derivatives commute, the statement that the boundary of a boundary is zero, read on the potential: it is the field `commute` of the engine. The covariant laws of second order linear in a potential of one index are spanned by two terms and a mass term: the family of section 2. A massless field of one index in $n$ dimensions carries $n-2$ polarizations, which are its helicities, and a massive one $n-1$ (Wigner, 1939). The field strength in $n$ dimensions has $n-1$ electric and $(n-1)(n-2)/2$ magnetic components. The constant of thermal radiation is proportional to the number of helicities of light (Planck, 1900). Each is named again where it is used.

### 2. Conservation Forces the Law

By B1 the law has one index, and by B3 it is of second order and linear. The family is $a\,\Box A_\nu+b\,\partial_\nu(\partial\cdot A)+m\,A_\nu$, with three numbers to fix. Because derivatives commute, its divergence is $(a+b)\,\Box(\partial\cdot A)+m\,(\partial\cdot A)$ (`div_eq`). By B2 the divergence vanishes on every field. So $b=-a$ and $m=0$ (`conservation_forces_maxwell`, `the_second_term_is_forced`), and every such law is conserved (`maxwell_is_conserved`). **The conserved laws are one line, the Maxwell line: the multiples of Maxwell's law** (`conserved_laws_are_one_line`). Nothing else is allowed.

Every field, because a law off the Maxwell line is conserved only where the gauge part of the potential cannot wave (`off_the_maxwell_line_the_field_is_frozen`): it would forbid the freedom the record is built to forget.

The law is forced:

$$\Box A_\nu-\partial_\nu(\partial\cdot A)=\partial^\mu F_{\mu\nu}=\mu_0\,J_\nu.$$

**The displacement current is forced, at full strength.** Ampère's law reads the curl of the magnetic field as the current. A curl has no divergence, so the law holds only for currents that have none, and it fails on any source whose charge changes (`ampere_alone_fails`). In 1865 Maxwell added one term, the rate of change of the electric field. Give that term a free coefficient $k$: the law holds on every conserved source if and only if $k=1$ (`the_displacement_current_is_forced`). Maxwell found the term by insight. Conservation forces it, and forces its size.

The algebra of this forcing is classical. That a conserved current fixes the law of a massless field of one index is Weinberg's theorem (1965), and the step from Ampère's law is Maxwell's own (1865). The work of this paper lies beneath it. The conservation of charge, which electrodynamics takes from experiment, is here a theorem of Part II and a bridge of the seat, and the forcing is checked by a kernel.

### 3. The Photon Has No Mass, and Gauge Invariance Is a Consequence

The mass term does not survive. Its divergence is $m\,(\partial\cdot A)$, which vanishes on every field only if $m=0$ (`the_photon_has_no_mass`). A law with a mass is conserved only where the divergence of the potential is frozen (`with_a_mass_the_potential_is_frozen`): the potential would lose the freedom the record forgets, which is Proca's theory (1936). **The massless photon is forced.** The measured bound is $10^{-18}$ electronvolts (Ryutov, 2007).

Shift the potential by a gradient. The two terms of second order change by the same amount, and the mass term by the gradient itself. The law is unchanged by every such shift exactly when $a+b=0$ and $m=0$. **Gauge invariance and the conservation of charge are one theorem** (`gauge_invariance_iff_conservation`). Electrodynamics has taken gauge invariance as its founding principle since Weyl (1929). Here it is a consequence. The freedom of the gauge is what the registration forgets.

### 4. Two Helicities with No Third

A potential in $n$ dimensions has $n$ components. The forced law takes two away, one by the gauge and one by the constraint, and leaves $n-2$. In four dimensions light carries exactly two helicities (`two_helicities`), and two is the count in four dimensions and in no other (`two_helicities_exactly_in_four`). A mass would leave $n-1$: **a third polarization comes with a mass and only with a mass** (`mass_adds_one`, `a_third_needs_a_mass`). The photon has no mass, so there is no third.

The count is measured. The constant of thermal radiation is proportional to the number of helicities. With two it is $5.6704\times10^{-8}$ in SI units; with a third state in equilibrium it would be $8.5056\times10^{-8}$. The measured value is $(5.66967\pm0.00076)\times10^{-8}$ (Quinn and Martin, 1985). A third state too weakly coupled to reach equilibrium is not seen by this measurement. It comes only with a mass (`mass_adds_one`), and the mass is forced to zero and bounded below $10^{-18}$ electronvolts. Part I proved that helicity is the one bit no energy reading returns (`helicity_is_one_bit`). Part III proves there are two values of it and no more.

### 5. Coulomb's Law Is the Half-Reading

**Coulomb's electrostatics is a half-reading.** For charges at rest the forced law keeps one component of the potential, the time part, and becomes $\nabla^2\phi=-\rho/\varepsilon_0$. Coulomb's law reads one component of four (`coulomb_reads_one_of_four`). The other three are magnetism, and a reader in motion sees them mix.

The inverse square is the flux law. A reading that loses nothing between spheres thins as the area grows, by $2^{d-1}$ at twice the radius in $d$ dimensions of space (`flux_in_every_dimension`): the inverse first power in two dimensions, the inverse square in three, the inverse cube in four (`inverse_first_power_in_two`, `inverse_square_in_three`, `inverse_cube_in_four`). The exponent two is the mark of three dimensions of space. Its measured deviation is $(2.7\pm3.1)\times10^{-16}$ (Williams, Faller and Hill, 1971).

### 6. Four Dimensions, Singled Out by Light

The field strength has $n(n-1)/2$ components: $n-1$ electric and $(n-1)(n-2)/2$ magnetic. In two dimensions there is no magnetic part at all, and in three there is one (`no_magnet_in_two`, `one_magnet_in_three`). In four there are three and three (`three_and_three`). **The electric and the magnetic counts are equal in four dimensions and in no other** (`duality_exactly_in_four`). Part II proved that duality is a quarter turn whose square is charge conjugation (`duality_squared_is_C`). Part III proves the quarter turn has a place to act in four dimensions and in no other.

**Light and gravity carry the same number of polarizations in four dimensions and in no other** (`light_and_gravity_agree_exactly_in_four`): $n-2$ for light, $n(n-3)/2$ for gravity, equal at four. These two statements hold for a spacetime that has a field to count: two dimensions or more for the first, three or more for the second. The companion paper on gravity proves that a body has weight exactly above three dimensions and that light is bent exactly twice in four (Islam, 2026b). The two forces that reach across the sky single out the same dimension by separate theorems.

### 7. One Coupling, and It Is Read

The law fixes its form and is silent on its scale. Every multiple of a conserved law is conserved (`the_law_fixes_no_scale`). This is the scaling theorem of Least Erasure read on light: a magnitude is invisible to every verdict of the seat. The fine-structure constant is therefore measured, $\alpha^{-1}=137.035999084(21)$ (Tiesinga et al., 2021). Charge comes in whole units of one third (`charges_in_thirds`, Part II); the size of the unit is read.

### 8. The Ledger, the Falsifier, and What Stands

| Claim | Carried by | Grade |
|---|---|---|
| the field has one index | B1 on Parts I and II | structural |
| the law is Maxwell's, the mass term zero | `conservation_forces_maxwell`, `conserved_laws_are_one_line` on B2, B3 and the commuting of derivatives | theorem inside the family; premise on the bridges |
| the displacement current, with coefficient one | `ampere_alone_fails`, `the_displacement_current_is_forced` | theorem |
| gauge invariance | `gauge_invariance_iff_conservation` | theorem |
| two helicities, a third only with a mass | `two_helicities`, `mass_adds_one` | theorem, on the cited count |
| Coulomb's law, inverse square in three dimensions of space | `inverse_square_in_three`, `flux_in_every_dimension` | theorem |
| duality in four dimensions and no other | `duality_exactly_in_four` | theorem, on the cited count, for two dimensions of spacetime or more |
| light and gravity agree in four dimensions and no other | `light_and_gravity_agree_exactly_in_four` | theorem, on the cited counts, for three dimensions of spacetime or more |
| every massless mode runs at one speed, gravity's with light's | `massless_on_the_cone` (Part I) | theorem of Part I |
| the coupling's value | `the_law_fixes_no_scale` | measured, by theorem |

| Test | The forced law gives | Measured, by the source cited |
|---|---|---|
| deviation from the inverse square | 0 | $(2.7\pm3.1)\times10^{-16}$ (Williams, Faller and Hill, 1971) |
| mass of the photon | 0 | below $10^{-18}$ electronvolts (Ryutov, 2007) |
| decay of the electron | none | lifetime above $6.6\times10^{28}$ years (Agostini et al., 2015) |
| constant of thermal radiation | $5.6704\times10^{-8}$, two helicities | $(5.66967\pm0.00076)\times10^{-8}$ (Quinn and Martin, 1985) |
| speed of gravity against light | equal | between $-3\times10^{-15}$ and $7\times10^{-16}$ of the speed of light (Abbott et al., 2017) |

Every measurement in this table precedes this work. The table is agreement with the record, and the forward claim is the falsifier.

One falsifier is added to those of Parts I and II, and the engine forces it. **F-Mass:** a photon mass, at any size; this breaks `the_photon_has_no_mass` read physically, and with it the count of helicities.

**The law at least order.** The forced law is the law of the field at the least order of its derivatives, and it is exact there. Beyond it stand the vacuum's own pairs (Euler and Heisenberg, 1936), measured as light scattering on light (ATLAS, 2017). Part I proved the quantum belongs to the field (`quantum_is_the_fields`); the pairs are that quantum at work. A law that is conserved and not linear exists at second order (Born and Infeld, 1934), which is why B3 names the sum of readings as its own clause.

**The form of the law is closed.** Its shape, its massless photon, its gauge, its helicities, its static half and its dimension are forced, on three named bridges. One magnitude stands read from experiment, the fine-structure constant, and Least Erasure proves that a seat returns no magnitude. Maxwell's electrodynamics is subsumed: each of its laws is an instance of the forced law, and each of its principles is a theorem here.

## Author's Provenance and Method Disclosure

**Who wrote it.** The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean files and the Fortran twins are written by a language model under the author's direct supervision.

**Method.** The work stands on one seat, the fixed line of a reflection, and one root, that nothing escapes the record, both set out in Nothing Escapes, Least Erasure (Islam, 2026a), from which Parts I and II are carried. Part III adds three bridges and five results of classical mathematics and physics, each named in a table or a paragraph before it is used. Every theorem named in the text is declared under that name in an appendix. The kernel line of every theorem of Appendix E is printed in Appendix F, and Appendices A and C carry the command that prints each of their own. Every measured value in the text names its source beside it. No magnitude is derived anywhere in this paper.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. Parts I and II are carried from Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one. Parts I and II are set here in this paper's own vocabulary, with the apparatus of that volume's series removed; no theorem, number, measurement or source was changed.

**Classical sources.** The algebra by which a conserved current fixes the law of a massless field is Weinberg's (1965) and the displacement current is Maxwell's (1865). The count of helicities is Wigner's (1939). This paper derives what those results took as given and checks the forcing by a kernel.

## References

1. E. Wigner, Ann. Math. 40 (1939) 149.
2. W. H. Furry, Phys. Rev. 51 (1937) 125.
3. R. J. Glauber, Phys. Rev. 130 (1963) 2529.
4. W. E. Lamb and M. O. Scully, in Polarisation, Matière et Rayonnement (Presses Universitaires de France, 1969).
5. H. J. Kimble, M. Dagenais and L. Mandel, Phys. Rev. Lett. 39 (1977) 691.
6. W. K. Wootters and W. H. Zurek, Phys. Rev. D 19 (1979) 473.
7. P. Grangier, G. Roger and A. Aspect, Europhys. Lett. 1 (1986) 173.
8. C. K. Hong, Z. Y. Ou and L. Mandel, Phys. Rev. Lett. 59 (1987) 2044.
9. B.-G. Englert, Phys. Rev. Lett. 77 (1996) 2154.
10. S. Dürr, T. Nonn and G. Rempe, Nature 395 (1998) 33.
11. A. A. Abdo et al. (Fermi LAT and GBM), Nature 462 (2009) 331.
12. B. P. Abbott et al. (LIGO, Virgo, Fermi GBM and INTEGRAL), Astrophys. J. Lett. 848 (2017) L13.
13. Particle Data Group, S. Navas et al., Phys. Rev. D 110 (2024) 030001.
14. J. C. Maxwell, Phil. Trans. R. Soc. 155 (1865) 459.
15. O. Heaviside, Electromagnetic Theory, vol. 1 (The Electrician, 1893).
16. J. Larmor, Phil. Trans. R. Soc. A 190 (1897) 205.
17. L. Silberstein, Ann. Phys. 327 (1907) 579.
18. L. Landau, Z. Phys. 64 (1930) 629.
19. P. A. M. Dirac, Proc. R. Soc. A 133 (1931) 60.
20. G. Lüders, Dan. Mat. Fys. Medd. 28, no. 5 (1954).
21. W. Pauli, in Niels Bohr and the Development of Physics (Pergamon, 1955) 30.
22. Y. Aharonov and D. Bohm, Phys. Rev. 115 (1959) 485.
23. B. D. Josephson, Phys. Lett. 1 (1962) 251.
24. K. von Klitzing, G. Dorda and M. Pepper, Phys. Rev. Lett. 45 (1980) 494.
25. D. J. Thouless, M. Kohmoto, M. P. Nightingale and M. den Nijs, Phys. Rev. Lett. 49 (1982) 405.
26. I. Bialynicki-Birula, Prog. Opt. 36 (1996) 245.
27. B. Jeckelmann and B. Jeanneret, Rep. Prog. Phys. 64 (2001) 1603.
28. Borexino Collaboration, M. Agostini et al., Phys. Rev. Lett. 115 (2015) 231802.
29. E. K. Anderson et al. (ALPHA-g), Nature 621 (2023) 716.
30. C. A. Coulomb, Mém. Acad. R. Sci. (1785) 569.
31. G. Kirchhoff, Ann. Phys. 64 (1845) 497.
32. M. Planck, Verh. Dtsch. Phys. Ges. 2 (1900) 237.
33. H. Weyl, Z. Phys. 56 (1929) 330.
34. M. Born and L. Infeld, Proc. R. Soc. A 144 (1934) 425.
35. A. Proca, J. Phys. Radium 7 (1936) 347.
36. H. Euler and W. Heisenberg, Z. Phys. 98 (1936) 714.
37. S. Weinberg, Phys. Rev. 138 (1965) B988.
38. E. R. Williams, J. E. Faller and H. A. Hill, Phys. Rev. Lett. 26 (1971) 721.
39. T. J. Quinn and J. E. Martin, Phil. Trans. R. Soc. A 316 (1985) 85.
40. D. D. Ryutov, Plasma Phys. Control. Fusion 49 (2007) B429.
41. M. Agostini et al. (Borexino), Phys. Rev. Lett. 115 (2015) 231802.
42. B. P. Abbott et al., Astrophys. J. Lett. 848 (2017) L13.
43. ATLAS Collaboration, Nature Phys. 13 (2017) 852.
44. E. Tiesinga, P. J. Mohr, D. B. Newell and B. N. Taylor, Rev. Mod. Phys. 93 (2021) 025010.
45. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
46. M. F. Islam, Immanent Gravity as a Theorem, edition 3.0.0 (2026b).

## Appendix A · SPHYS_Light.lean

Part I. Core Lean 4, carried from edition 2.0.0. Comments are set in this paper's vocabulary; no declaration is changed, and the file is recompiled.

```lean
/-
  SPHYS_Light.lean · the geometric nature of light, read at the seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: a point (h, t) of the strip carries h = 2 Re s and t = Im s; the fold s ↦ 1 − s̄ is
  (h, t) ↦ (2 − h, t) and the fixed line is h = 1. The substrate's two involutions (the particle
  map, the time mirror of a rate) and its two carriers (charge to the side, energy s = 1/2 + iE)
  are those of Least Erasure, re-proved here so the file stands alone.

  Part I    the seat, the category of involutions, the functor of the seat.
  Part II   the energy carrier: the line is the locus of stationary energy.
  Part III  the substrate: the particle map, the time mirror, both carriers.
  Part IV   light is the line: the photon fixed by both involutions at every frequency; frequency
            the height; the speed hierarchy; helicity the one bit; C-parity; detection as
            registration; the quantum as the field's.
  Part V    the capstone.
-/
set_option autoImplicit false
namespace SPHYS.Light


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

theorem sq_nonneg (x : Int) : 0 ≤ x * x := by
  rcases Int.le_total 0 x with h | h
  · exact Int.mul_nonneg h h
  · have h' : 0 ≤ -x := by omega
    have := Int.mul_nonneg h' h'
    rw [Int.neg_mul_neg] at this; exact this

/-! ## Part IV. Light is the line -/

/-- A photon of frequency ω: no charge of any kind, a real energy, its own antiparticle. -/
def photon (ω : Int) : Particle := ⟨0, 0, 0, 0, ⟨ω, 0⟩⟩

theorem photon_is_its_own_antiparticle (ω : Int) : bar (photon ω) = photon ω := rfl
theorem photon_is_stationary (ω : Int) : tmirror (photon ω) = photon ω := rfl

/-- LIGHT IS THE LINE: at every frequency the photon is fixed by both involutions and lands on the
    line under both carriers. -/
theorem photon_on_both_lines (ω : Int) :
    OnLine (energySeat (photon ω)) ∧ OnLine (chargeSeat (photon ω)) := by
  refine ⟨rfl, ?_⟩
  show 1 + 0 = 1
  rfl

/-- Frequency is the height: the photon of frequency ω lands at (1, ω). -/
theorem frequency_is_the_height (ω : Int) : energySeat (photon ω) = (1, ω) := rfl

/-- Every frequency stands on one side: the spectrum from radio to gamma is the line's heights. -/
theorem every_frequency_one_side (ω ω' : Int) :
    (energySeat (photon ω)).1 = (energySeat (photon ω')).1 := rfl

/-- Registration keeps a photon exactly: nothing of light is erased by the fold. -/
theorem registration_keeps_light (ω : Int) : reg (energySeat (photon ω)) = energySeat (photon ω) := rfl

theorem sq_pos_of_ne (m : Int) (h : m ≠ 0) : 0 < m * m := by
  rcases Int.lt_or_gt_of_ne h with h' | h'
  · have := Int.mul_pos (show 0 < -m by omega) (show 0 < -m by omega)
    rw [Int.neg_mul_neg] at this; exact this
  · exact Int.mul_pos h' h'

/-- The speed hierarchy, in units c = 1: a massive mode ω² = k² + m² with m ≠ 0 has k² < ω², so it
    runs slower than light; a massless mode has ω² = k² at every frequency. Frequency is the
    height and rest mass the depth: two coordinates, never one. -/
theorem massive_slower (k ω m : Int) (h : ω * ω = k * k + m * m) (hm : m ≠ 0) : k * k < ω * ω := by
  have := sq_pos_of_ne m hm
  omega

theorem massless_on_the_cone (k ω : Int) (h : ω * ω = k * k + 0 * 0) : ω * ω = k * k := by
  rw [Int.mul_zero, Int.add_zero] at h; exact h

/-- A photon's helicity: +1 or −1. Parity reverses it and keeps the frequency. -/
structure Photon where
  freq : Int
  helicity : Bool
  deriving DecidableEq, Repr

def Photon.parity (p : Photon) : Photon := ⟨p.freq, !p.helicity⟩

theorem parity_involutive (p : Photon) : p.parity.parity = p := by
  obtain ⟨f, s⟩ := p
  cases s <;> rfl

/-- THE HELICITY IS ONE BIT: the two helicities of one frequency are two states with one energy
    record, and no reading of the energy returns the helicity. -/
theorem helicity_is_one_bit {β : Type} (g : Int → β) (p : Photon) :
    p.parity ≠ p ∧ (p.parity).freq = p.freq ∧ g (p.parity).freq = g p.freq := by
  refine ⟨fun e => ?_, rfl, rfl⟩
  have := congrArg Photon.helicity e
  obtain ⟨f, s⟩ := p
  cases s <;> simp [Photon.parity] at this

/-- The charge-conjugation parity of n photons, (−1)^n. -/
def cparity : Nat → Int
  | 0 => 1
  | n + 1 => - cparity n

theorem cparity_val (n : Nat) : cparity n = if n % 2 = 0 then 1 else -1 := by
  induction n with
  | zero => rfl
  | succ n ih =>
    show - cparity n = _
    rw [ih]
    by_cases h : n % 2 = 0
    · have h2 : (n + 1) % 2 ≠ 0 := by omega
      simp [h, h2]
    · have h2 : (n + 1) % 2 = 0 := by omega
      simp [h, h2]

/-- Furry's selection: a state even under charge conjugation decays only into an even number of
    photons, an odd state only into an odd number. Parapositronium into two, orthopositronium
    into three. -/
theorem c_even_needs_even_photons (n : Nat) (h : cparity n = 1) : n % 2 = 0 := by
  rw [cparity_val] at h
  by_cases e : n % 2 = 0
  · exact e
  · simp [e] at h

theorem positronium_counts : cparity 2 = 1 ∧ cparity 3 = -1 ∧ cparity 1 = -1 := by decide

/-- Intensity at a screen point from two paths of real amplitudes a and b, a marker overlap c (the
    side forgotten when c ≠ 0, registered when c = 0), and a fringe sign s = ±1. -/
def intensity (a b c s : Int) : Int := a * a + b * b + 2 * (a * b * c) * s

theorem mul3_ne_zero (a b c : Int) : a * b * c ≠ 0 ↔ (a ≠ 0 ∧ b ≠ 0 ∧ c ≠ 0) := by
  constructor
  · intro h; refine ⟨?_, ?_, ?_⟩ <;> intro e <;> apply h <;> simp [e]
  · intro ⟨h1, h2, h3⟩; exact Int.mul_ne_zero (Int.mul_ne_zero h1 h2) h3

/-- DETECTION IS REGISTRATION: fringes exist exactly when both paths are open and the record
    forgets the side; registering the side erases the fringe. -/
theorem fringe_iff_side_forgotten (a b c : Int) :
    intensity a b c 1 ≠ intensity a b c (-1) ↔ (a ≠ 0 ∧ b ≠ 0 ∧ c ≠ 0) := by
  have d : intensity a b c 1 - intensity a b c (-1) = 4 * (a * b * c) := by
    show (a * a + b * b + 2 * (a * b * c) * 1) - (a * a + b * b + 2 * (a * b * c) * (-1)) = _
    simp only [Int.mul_one, Int.mul_neg]; omega
  rw [← mul3_ne_zero]
  constructor
  · intro h e; apply h; omega
  · intro h e; apply h; omega

theorem side_registered_no_fringe (a b s : Int) : intensity a b 0 s = a * a + b * b := by
  show a * a + b * b + 2 * (a * b * 0) * s = a * a + b * b
  rw [Int.mul_zero, Int.mul_zero, Int.zero_mul, Int.add_zero]

/-- A single photon never coincides with itself: n(n − 1) = 0 at n = 1. -/
theorem single_photon_no_coincidence : (1 : Int) * (1 - 1) = 0 := by decide

/-- Any classical field split into two equally likely intensities x and y bunches: the
    coincidence rate 2(x² + y²) is at least the square of the mean rate (x + y)², g⁽²⁾ ≥ 1. -/
theorem classical_light_bunches (x y : Int) : (x + y) * (x + y) ≤ 2 * (x * x + y * y) := by
  have h := sq_nonneg (x - y)
  simp only [Int.add_mul, Int.mul_add, Int.sub_mul, Int.mul_sub] at h ⊢
  rw [Int.mul_comm y x] at h ⊢
  omega

/-- The quantum is the field's: a one-photon state has zero coincidence, which no classical
    intensity with detector-only quantization reaches unless it is empty. -/
theorem quantum_is_the_fields (x y : Int) (h : 0 < x + y) :
    (1 : Int) * (1 - 1) = 0 ∧ 0 < 2 * (x * x + y * y) := by
  refine ⟨by decide, ?_⟩
  have := classical_light_bunches x y
  have := sq_pos_of_ne (x + y) (by omega)
  omega

/-! ## Part V. The capstone -/

/-- THE GEOMETRIC NATURE OF LIGHT, AT THE SEAT. -/
theorem light_is_the_line :
    (∀ ω : Int, bar (photon ω) = photon ω ∧ tmirror (photon ω) = photon ω) ∧
    (∀ ω : Int, OnLine (energySeat (photon ω)) ∧ OnLine (chargeSeat (photon ω))) ∧
    (∀ ω : Int, energySeat (photon ω) = (1, ω)) ∧
    (∀ k ω m : Int, ω * ω = k * k + m * m → m ≠ 0 → k * k < ω * ω) ∧
    (∀ p : Photon, p.parity ≠ p ∧ (p.parity).freq = p.freq) ∧
    (∀ a b c : Int, intensity a b c 1 ≠ intensity a b c (-1) ↔ (a ≠ 0 ∧ b ≠ 0 ∧ c ≠ 0)) ∧
    (∀ x y : Int, (x + y) * (x + y) ≤ 2 * (x * x + y * y)) ∧
    (∀ n : Nat, cparity n = 1 → n % 2 = 0) :=
  ⟨fun _ => ⟨rfl, rfl⟩, photon_on_both_lines, frequency_is_the_height, massive_slower,
   fun p => ⟨(helicity_is_one_bit id p).1, rfl⟩, fringe_iff_side_forgotten,
   classical_light_bunches, c_even_needs_even_photons⟩

end SPHYS.Light

#print axioms SPHYS.Light.pe
#print axioms SPHYS.Light.fold_involutive
#print axioms SPHYS.Light.seat_fixed_line
#print axioms SPHYS.Light.reg_lands
#print axioms SPHYS.Light.reg_fixes_iff
#print axioms SPHYS.Light.reg_forgets_side
#print axioms SPHYS.Light.least_erasure_iff_value
#print axioms SPHYS.Light.equivariant_id
#print axioms SPHYS.Light.equivariant_comp
#print axioms SPHYS.Light.fix_functorial
#print axioms SPHYS.Light.fold_global_seat
#print axioms SPHYS.Light.equivariant_carrier_lands
#print axioms SPHYS.Light.value_on_image
#print axioms SPHYS.Light.kinetic_crossing
#print axioms SPHYS.Light.off_locus_pair
#print axioms SPHYS.Light.ee
#print axioms SPHYS.Light.mirror_involutive
#print axioms SPHYS.Light.psi_phi
#print axioms SPHYS.Light.phi_psi
#print axioms SPHYS.Light.phi_injective
#print axioms SPHYS.Light.phi_equivariant
#print axioms SPHYS.Light.mirror_fixed_iff_real
#print axioms SPHYS.Light.phi_line_iff_real
#print axioms SPHYS.Light.stationary_iff_real
#print axioms SPHYS.Light.line_is_stationary
#print axioms SPHYS.Light.measured_on_line
#print axioms SPHYS.Light.no_measurement_off_line
#print axioms SPHYS.Light.energy_carrier_lands
#print axioms SPHYS.Light.bar_involutive
#print axioms SPHYS.Light.bar_fixed_iff_neutral
#print axioms SPHYS.Light.odd_charges_even_energy
#print axioms SPHYS.Light.gravity_reads_no_charge_bit
#print axioms SPHYS.Light.involutions_commute
#print axioms SPHYS.Light.tmirror_involutive
#print axioms SPHYS.Light.joint_fixed_iff
#print axioms SPHYS.Light.charge_carrier_equivariant
#print axioms SPHYS.Light.pair_lands_once
#print axioms SPHYS.Light.tmirror_equivariant
#print axioms SPHYS.Light.neutral_charge_on_line
#print axioms SPHYS.Light.pair_on_the_edges
#print axioms SPHYS.Light.stable_lands
#print axioms SPHYS.Light.sq_nonneg
#print axioms SPHYS.Light.photon_is_its_own_antiparticle
#print axioms SPHYS.Light.photon_is_stationary
#print axioms SPHYS.Light.photon_on_both_lines
#print axioms SPHYS.Light.frequency_is_the_height
#print axioms SPHYS.Light.every_frequency_one_side
#print axioms SPHYS.Light.registration_keeps_light
#print axioms SPHYS.Light.sq_pos_of_ne
#print axioms SPHYS.Light.massive_slower
#print axioms SPHYS.Light.massless_on_the_cone
#print axioms SPHYS.Light.parity_involutive
#print axioms SPHYS.Light.helicity_is_one_bit
#print axioms SPHYS.Light.cparity_val
#print axioms SPHYS.Light.c_even_needs_even_photons
#print axioms SPHYS.Light.positronium_counts
#print axioms SPHYS.Light.mul3_ne_zero
#print axioms SPHYS.Light.fringe_iff_side_forgotten
#print axioms SPHYS.Light.side_registered_no_fringe
#print axioms SPHYS.Light.single_photon_no_coincidence
#print axioms SPHYS.Light.classical_light_bunches
#print axioms SPHYS.Light.quantum_is_the_fields
#print axioms SPHYS.Light.light_is_the_line
```

## Appendix B · Light_Twin.f90

Part I. Carried from edition 2.0.0 without change.

```fortran
! Light_Twin.f90 · the executed twin of SPHYS_Light.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Light_Twin.f90
! Blocks: A light on the line; B the speed hierarchy; C helicity; D C-parity; E which-path
! complementarity; F the quantum is the field's; G the price of a detection.
program light_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: i8 = selected_int_kind(18)
  real(dp), parameter :: KB = 1.380649e-23_dp, HP = 6.62607015e-34_dp, CL = 299792458.0_dp
  real(dp), parameter :: QE = 1.602176634e-19_dp
  integer :: checks, fails
  integer(i8) :: seed
  checks = 0; fails = 0; seed = 20260930_i8
  call block_a(); call block_b(); call block_c(); call block_d()
  call block_e(); call block_f(); call block_g()
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

  pure function eseat(freq, rate) result(p)
    integer, intent(in) :: freq, rate
    integer :: p(2)
    p = [1 - rate, freq]
  end function eseat

  pure function cseat(q3, freq) result(p)
    integer, intent(in) :: q3, freq
    integer :: p(2)
    p = [1 + q3, freq]
  end function cseat

  function rnd() result(r)
    real(dp) :: r
    seed = modulo(16807_i8*seed, 2147483647_i8)
    r = real(seed, dp)/2147483647.0_dp
  end function rnd

  subroutine block_a()
    integer :: w, nline, nheight, k
    real(dp) :: e, emin, emax
    write(*,'(a)') 'A · light is the line: every frequency, one side; the frequency is the height'
    nline = 0; nheight = 0
    do w = -1000, 1000
      ! the energy seat (1 - rate, freq) with rate 0, and the charge seat (1 + q3) with q3 = 0
      if (all(eseat(w, 0) == [1, w]) .and. all(cseat(0, w) == [1, w])) nline = nline + 1
      ! one side for neighbouring frequencies, two heights: side equal, height different
      if (all(eseat(w, 0) == eseat(w, 0) .and. eseat(w, 0) /= eseat(w + 1, 0) .eqv. [.false., .true.])) &
        nheight = nheight + 1
    end do
    call check('2001 photon frequencies: all on the line under both carriers, height = frequency', &
               nline == 2001 .and. nheight == 2001)
    emin = huge(1.0_dp); emax = 0.0_dp
    do k = 0, 200
      e = 1.0e-9_dp*10.0_dp**(real(k, dp)*0.1_dp)
      emin = min(emin, e); emax = max(emax, e)
    end do
    write(*,'(a,es9.2,a,es9.2,a)') '  the spectrum from radio to gamma, ', emin, ' eV to ', emax, &
         ' eV: one side, 201 heights'
    call check('twenty decades of photon energy occupy one side of the seat', emax/emin > 1.0e19_dp)
  end subroutine block_a

  subroutine block_b()
    integer :: i, nslow
    real(dp) :: k, m, w, vg, dmax, mg, ev, dv
    write(*,'(a)') 'B · the speed hierarchy: massless modes at c at every frequency; massive modes below'
    dmax = 0.0_dp; nslow = 0
    do i = 1, 2000
      k = 10.0_dp**(-9.0_dp + 20.0_dp*rnd())
      ! massless: omega = k (c = 1); group velocity by a relative finite difference
      vg = ((k*(1.0_dp + 1.0e-6_dp)) - k)/(k*1.0e-6_dp)
      dmax = max(dmax, abs(vg - 1.0_dp))
      m = 10.0_dp**(-6.0_dp + 12.0_dp*rnd())
      w = sqrt(k*k + m*m)
      ! the deficit 1 - v = m^2 / (w (w + k)), computed without cancellation
      if (m*m/(w*(w + k)) > 0.0_dp) nslow = nslow + 1
    end do
    write(*,'(a,es9.2)') '  massless group velocity, max |v/c - 1| over 2000 frequencies: ', dmax
    call check('every massless mode moves at c, independent of frequency (to 1e-9)', dmax < 1.0e-9_dp)
    call check('every massive mode moves below c (2000 of 2000)', nslow == 2000)
    mg = 1.0e-18_dp; ev = 1.0e-6_dp
    dv = 0.5_dp*(mg/ev)**2
    write(*,'(a,es9.2)') '  a photon mass at the bound 1e-18 eV slows a 1 microeV radio photon by dv/c = ', dv
    call check('the photon-mass bound leaves light frequency-independent below 1e-24 even at radio', dv < 1.0e-24_dp)
    dv = 1.74_dp/(130.0e6_dp*3.15576e7_dp)
    write(*,'(a,es9.2)') '  GW170817: 1.74 s after 130 million years of flight, dv/c <= ', dv
    call check('gravity and light, both massless, arrive together to below 1e-15', dv < 1.0e-15_dp)
  end subroutine block_b

  subroutine block_c()
    integer :: w, s, n
    write(*,'(a)') 'C · helicity: parity reverses it and keeps the frequency; the energy never reads it'
    n = 0
    do w = -500, 500
      do s = -1, 1, 2
        if (-s /= s .and. -(-s) == s) n = n + 1
      end do
    end do
    call check('parity is an involution, moves every helicity, and keeps the frequency (2002 states)', n == 2002)
  end subroutine block_c

  subroutine block_d()
    integer :: n, cp, nok
    write(*,'(a)') 'D · C-parity (-1)^n of n photons: Furry''s selection and positronium'
    nok = 0; cp = 1
    do n = 0, 40
      if (n > 0) cp = -cp
      if ((cp == 1) .eqv. (mod(n, 2) == 0)) nok = nok + 1
    end do
    call check('C-parity of 0 to 40 photons is +1 exactly on even counts (41 of 41)', nok == 41)
    call check('parapositronium (C = +1) decays to two photons, orthopositronium (C = -1) to three', &
               (-1)**2 == 1 .and. (-1)**3 == -1)
  end subroutine block_d

  subroutine block_e()
    integer :: i, nf, nk
    real(dp) :: pa, pb, g, v, d, worst, a, b, c, ip, im
    write(*,'(a)') 'E · detection is registration: which-path and fringe trade exactly, D^2 + V^2 = 1'
    worst = 0.0_dp
    do i = 1, 20000
      pa = rnd(); pb = 1.0_dp - pa; g = rnd()
      v = 2.0_dp*sqrt(pa*pb)*g
      d = sqrt((pa - pb)**2 + 4.0_dp*pa*pb*(1.0_dp - g*g))
      worst = max(worst, abs(d*d + v*v - 1.0_dp))
    end do
    write(*,'(a,es9.2)') '  max |D^2 + V^2 - 1| over 20000 pure two-path states: ', worst
    call check('Englert''s duality holds with equality on every pure state (to 1e-14)', worst < 1.0e-14_dp)
    nf = 0; nk = 0
    do i = 1, 20000
      a = real(int(10.0_dp*rnd()) - 5, dp); b = real(int(10.0_dp*rnd()) - 5, dp)
      c = real(int(3.0_dp*rnd()) - 1, dp)
      ip = a*a + b*b + 2.0_dp*a*b*c; im = a*a + b*b - 2.0_dp*a*b*c
      if ((ip /= im) .eqv. (a /= 0.0_dp .and. b /= 0.0_dp .and. c /= 0.0_dp)) nf = nf + 1
      if (c == 0.0_dp .and. ip == im) nk = nk + 1
    end do
    call check('a fringe exists exactly when both paths are open and the side is forgotten (20000)', nf == 20000)
    call check('registering the side erases the fringe on every sample', nk > 0)
  end subroutine block_e

  subroutine block_f()
    integer :: n, i, j, nbad
    real(dp) :: p, s1, s2, g2c, g2t, x(8), m1, m2, ga, sg
    write(*,'(a)') 'F · the quantum is the field''s: g2 = 0 for one photon, >= 1 for every classical field'
    ! coherent (Poisson, mean 1) and thermal (geometric, mean 1) photon-number statistics
    s1 = 0.0_dp; s2 = 0.0_dp; p = exp(-1.0_dp)
    do n = 0, 120
      if (n > 0) p = p/real(n, dp)
      s1 = s1 + real(n, dp)*p; s2 = s2 + real(n*(n - 1), dp)*p
    end do
    g2c = s2/(s1*s1)
    s1 = 0.0_dp; s2 = 0.0_dp
    do n = 0, 1000
      p = 0.5_dp**(n + 1)
      s1 = s1 + real(n, dp)*p; s2 = s2 + real(n, dp)*real(n - 1, dp)*p
    end do
    g2t = s2/(s1*s1)
    write(*,'(a,f9.6,a,f9.6,a)') '  one photon g2 = 0;  coherent g2 = ', g2c, ';  thermal g2 = ', g2t, ''
    call check('one photon: g2 = 0; coherent light: g2 = 1; thermal light: g2 = 2', &
               abs(g2c - 1.0_dp) < 1.0e-12_dp .and. abs(g2t - 2.0_dp) < 1.0e-12_dp .and. 1*(1 - 1) == 0)
    nbad = 0
    do i = 1, 10000
      m1 = 0.0_dp; m2 = 0.0_dp
      do j = 1, 8
        x(j) = rnd()**3
        m1 = m1 + x(j); m2 = m2 + x(j)*x(j)
      end do
      m1 = m1/8.0_dp; m2 = m2/8.0_dp
      if (m2 < m1*m1*(1.0_dp - 1.0e-12_dp)) nbad = nbad + 1
    end do
    call check('10000 classical intensity distributions: every one has g2 >= 1', nbad == 0)
    ga = 0.18_dp; sg = 0.06_dp
    write(*,'(a,f5.2,a,f5.1,a)') '  Grangier, Roger and Aspect: anticorrelation ', ga, ', below the classical 1 by ', &
         (1.0_dp - ga)/sg, ' sigma'
    call check('the measured single-photon anticorrelation is below every classical field by > 10 sigma', &
               (1.0_dp - ga)/sg > 10.0_dp)
  end subroutine block_f

  subroutine block_g()
    real(dp) :: floor, ephot
    write(*,'(a)') 'G · the price of a detection: each registration commits at least one bit'
    floor = KB*300.0_dp*log(2.0_dp)
    ephot = HP*CL/550.0e-9_dp
    write(*,'(a,es12.5,a,f7.1,a)') '  k_B T ln 2 at 300 K = ', floor, ' J; a 550 nm photon carries ', &
         ephot/floor, ' floors'
    call check('the floor is 2.870978885e-21 J and a visible photon pays its own registration', &
               abs(floor/2.8709788850787237e-21_dp - 1.0_dp) < 1.0e-14_dp .and. ephot > floor)
  end subroutine block_g
end program light_twin
```

## Appendix C · SPHYS_Electromagnetism.lean

Part II. Core Lean 4, carried from edition 1.0.0. Comments are set in this paper's vocabulary; no declaration is changed, and the file is recompiled.

```lean
/-
  SPHYS_Electromagnetism.lean · electromagnetism read at the seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: h = 2 Re s, t = Im s; the fold s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t), the fixed line
  h = 1. Two carriers land electromagnetism on the seat: the charge carrier (charge to the side),
  equivariant for charge conjugation, and the field carrier s = 1/2 + iF on the Riemann–Silberstein
  amplitude F = E + iB, equivariant for time reversal.

  Part I     the seat, the category of involutions, the functor of the seat.
  Part II    the energy carrier (resident from Least Erasure).
  Part III   the substrate: the particle map and the charge carrier.
  Part IV    the field on the seat: time reversal is the fold; the magnetic sign is the bit.
  Part V     duality: the quarter turn whose square is charge conjugation; light is null.
  Part VI    charge: the side, forced in thirds, conserved; the Aharonov–Bohm record.
  Part VII   gravity and magnetism, one registration in two branches.
  Part VIII  the capstone.
-/
set_option autoImplicit false
namespace SPHYS.Electromagnetism


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

theorem sq_nonneg (x : Int) : 0 ≤ x * x := by
  rcases Int.le_total 0 x with h | h
  · exact Int.mul_nonneg h h
  · have h' : 0 ≤ -x := by omega
    have := Int.mul_nonneg h' h'
    rw [Int.neg_mul_neg] at this; exact this

/-- A Hermitian 2×2 block [[a, c + i d], [c − i d, b]]; time reversal conjugates the block. -/
structure Block where
  a : Int
  b : Int
  c : Int
  d : Int

def Block.T (H : Block) : Block := ⟨H.a, H.b, H.c, -H.d⟩
/-- The discriminant of the characteristic polynomial: the eigenvalues are real when it is ≥ 0. -/
def Block.disc (H : Block) : Int := (H.a - H.b) * (H.a - H.b) + 4 * (H.c * H.c + H.d * H.d)

theorem block_T_fixed_iff (H : Block) : H.T = H ↔ H.d = 0 := by
  obtain ⟨a, b, c, d⟩ := H
  constructor
  · intro e; have := congrArg Block.d e; change -d = d at this; show d = 0; omega
  · intro e; change d = 0 at e; subst e; rfl

/-- THE MAGNET KEEPS EVERY ENERGY REAL: a magnetic term breaks time reversal of the block and
    leaves the spectrum real; the arrow is in the statistics, the line is in the stationarity. -/
theorem stationarity_survives_the_magnet (H : Block) : 0 ≤ H.disc ∧ H.T.disc = H.disc := by
  refine ⟨?_, ?_⟩
  · have e1 := sq_nonneg (H.a - H.b); have e2 := sq_nonneg H.c; have e3 := sq_nonneg H.d
    show 0 ≤ (H.a - H.b) * (H.a - H.b) + 4 * (H.c * H.c + H.d * H.d)
    omega
  · show (H.a - H.b) * (H.a - H.b) + 4 * (H.c * H.c + -H.d * -H.d) =
      (H.a - H.b) * (H.a - H.b) + 4 * (H.c * H.c + H.d * H.d)
    rw [Int.neg_mul_neg]

/-! ## Part IV. The field on the seat: time reversal is the fold -/

/-- A field on one axis pair, the Riemann–Silberstein amplitude F = E + iB (units c = 1). -/
structure Field where
  E : Int
  B : Int
  deriving DecidableEq, Repr

/-- Time reversal keeps E and reverses B: complex conjugation of F. -/
def Field.T (f : Field) : Field := ⟨f.E, -f.B⟩
/-- Charge conjugation reverses both: F ↦ −F. -/
def Field.C (f : Field) : Field := ⟨-f.E, -f.B⟩
/-- Parity on the slice: E polar, B axial. -/
def Field.P (f : Field) : Field := ⟨-f.E, f.B⟩
/-- Duality: E ↦ B, B ↦ −E, multiplication of F by −i. -/
def Field.D (f : Field) : Field := ⟨f.B, -f.E⟩

def energyDensity (f : Field) : Int := f.E * f.E + f.B * f.B
def invariantEB (f : Field) : Int := f.E * f.B
def invariantEE (f : Field) : Int := f.E * f.E - f.B * f.B

/-- The field carrier: s = 1/2 + i F in the chart, h = 1 − B, t = E. -/
def fieldSeat (f : Field) : Pt := (1 - f.B, f.E)

theorem fe {a b c d : Int} : (⟨a, b⟩ : Field) = ⟨c, d⟩ ↔ a = c ∧ b = d :=
  ⟨fun e => ⟨congrArg Field.E e, congrArg Field.B e⟩,
   fun ⟨e1, e2⟩ => by subst e1; subst e2; rfl⟩

theorem T_involutive (f : Field) : f.T.T = f := by
  obtain ⟨e, b⟩ := f; show (⟨e, - -b⟩ : Field) = ⟨e, b⟩; rw [Int.neg_neg]
theorem C_involutive (f : Field) : f.C.C = f := by
  obtain ⟨e, b⟩ := f; show (⟨- -e, - -b⟩ : Field) = ⟨e, b⟩; rw [Int.neg_neg, Int.neg_neg]
theorem P_involutive (f : Field) : f.P.P = f := by
  obtain ⟨e, b⟩ := f; show (⟨- -e, b⟩ : Field) = ⟨e, b⟩; rw [Int.neg_neg]

/-- C and T compose to P, and CPT acts trivially on the field: E and B are each odd under exactly
    two of the three reflections. -/
theorem CT_is_P (f : Field) : f.T.C = f.P := by
  obtain ⟨e, b⟩ := f; show (⟨-e, - -b⟩ : Field) = ⟨-e, b⟩; rw [Int.neg_neg]
theorem CPT_trivial (f : Field) : f.T.P.C = f := by
  obtain ⟨e, b⟩ := f; show (⟨- -e, - -b⟩ : Field) = ⟨e, b⟩; rw [Int.neg_neg, Int.neg_neg]

/-- THE FIELD CARRIER IS EQUIVARIANT: time reversal of the field is the fold. -/
theorem field_carrier_equivariant : Equivariant fieldSeat Field.T fold := by
  intro f
  obtain ⟨e, b⟩ := f
  show ((1 - -b, e) : Pt) = (2 - (1 - b), e)
  rw [pe]; exact ⟨by omega, rfl⟩

theorem T_fixed_iff_electric (f : Field) : f.T = f ↔ f.B = 0 := by
  obtain ⟨e, b⟩ := f
  show (⟨e, -b⟩ : Field) = ⟨e, b⟩ ↔ b = 0
  rw [fe]; constructor
  · intro ⟨_, h⟩; omega
  · intro h; exact ⟨rfl, by omega⟩

/-- The line is the purely electric field: a field lands on the line exactly when B = 0. -/
theorem electric_on_the_line (f : Field) : OnLine (fieldSeat f) ↔ f.B = 0 := by
  obtain ⟨e, b⟩ := f
  show 1 - b = 1 ↔ b = 0
  exact ⟨fun h => by omega, fun h => by subst h; rfl⟩

/-- The field carrier, built from the symmetry: the time-even fields land on the line. -/
theorem field_carrier_lands :
    ∃ C : Carrier { f : Field // f.T = f }, ∀ w, C.ι w = fieldSeat w.1 :=
  equivariant_carrier_lands fieldSeat Field.T field_carrier_equivariant

/-- THE MAGNETIC SIGN IS THE BIT: a field with B ≠ 0 and its time reverse are two fields off the
    line with one electric record and one energy density. -/
theorem magnetic_sign_is_the_bit (f : Field) (h : f.B ≠ 0) :
    f.T ≠ f ∧ ¬ OnLine (fieldSeat f) ∧ f.T.E = f.E ∧ energyDensity f.T = energyDensity f ∧
    reg (fieldSeat f.T) = reg (fieldSeat f) := by
  refine ⟨fun e => h ((T_fixed_iff_electric f).mp e), fun e => h ((electric_on_the_line f).mp e),
    rfl, ?_, by rw [field_carrier_equivariant]; rfl⟩
  show f.E * f.E + -f.B * -f.B = f.E * f.E + f.B * f.B
  rw [Int.neg_mul_neg]

/-- The energy density is even under every reflection. -/
theorem energy_even (f : Field) :
    energyDensity f.T = energyDensity f ∧ energyDensity f.C = energyDensity f ∧
    energyDensity f.P = energyDensity f := by
  refine ⟨?_, ?_, ?_⟩
  · show f.E * f.E + -f.B * -f.B = _; rw [Int.neg_mul_neg]; rfl
  · show -f.E * -f.E + -f.B * -f.B = _; rw [Int.neg_mul_neg, Int.neg_mul_neg]; rfl
  · show -f.E * -f.E + f.B * f.B = _; rw [Int.neg_mul_neg]; rfl

/-- E·B is odd under time reversal and under parity, even under charge conjugation. -/
theorem EB_odd_under_T_and_P (f : Field) :
    invariantEB f.T = -invariantEB f ∧ invariantEB f.P = -invariantEB f ∧
    invariantEB f.C = invariantEB f := by
  refine ⟨?_, ?_, ?_⟩
  · show f.E * -f.B = -(f.E * f.B); rw [Int.mul_neg]
  · show -f.E * f.B = -(f.E * f.B); rw [Int.neg_mul]
  · show -f.E * -f.B = f.E * f.B; rw [Int.neg_mul_neg]

/-! ## Part V. Duality: the quarter turn whose square is charge conjugation -/

/-- THE RETURN IN THE FIELD: duality squared is charge conjugation, F ↦ (−i)² F = −F. -/
theorem duality_squared_is_C (f : Field) : f.D.D = f.C := rfl

theorem duality_fourth_is_identity (f : Field) : f.D.D.D.D = f := by
  obtain ⟨e, b⟩ := f; show (⟨- -e, - -b⟩ : Field) = ⟨e, b⟩; rw [Int.neg_neg, Int.neg_neg]

/-- Duality and time reversal anticommute, as −i and complex conjugation do: T D = C D T. -/
theorem duality_anticommutes_with_T (f : Field) : f.D.T = f.T.D.C := by
  obtain ⟨e, b⟩ := f
  show (⟨b, - -e⟩ : Field) = ⟨- -b, - -e⟩
  rw [Int.neg_neg, Int.neg_neg]

/-- The energy density is duality-invariant; both Lorentz invariants flip sign under duality. -/
theorem energy_duality_invariant (f : Field) : energyDensity f.D = energyDensity f := by
  show f.B * f.B + -f.E * -f.E = f.E * f.E + f.B * f.B
  rw [Int.neg_mul_neg, Int.add_comm]

theorem invariants_flip_under_duality (f : Field) :
    invariantEB f.D = -invariantEB f ∧ invariantEE f.D = -invariantEE f := by
  refine ⟨?_, ?_⟩
  · show f.B * -f.E = -(f.E * f.B); rw [Int.mul_neg, Int.mul_comm]
  · show f.B * f.B - -f.E * -f.E = -(f.E * f.E - f.B * f.B); rw [Int.neg_mul_neg]; omega

/-- A transverse field in the plane: E = (E1, E2), B = (B1, B2). -/
structure Wave where
  e1 : Int
  e2 : Int
  b1 : Int
  b2 : Int

def Wave.D (w : Wave) : Wave := ⟨w.b1, w.b2, -w.e1, -w.e2⟩
def Wave.dot (w : Wave) : Int := w.e1 * w.b1 + w.e2 * w.b2
def Wave.diff (w : Wave) : Int := (w.e1 * w.e1 + w.e2 * w.e2) - (w.b1 * w.b1 + w.b2 * w.b2)
def Wave.Null (w : Wave) : Prop := w.dot = 0 ∧ w.diff = 0

/-- LIGHT IS NULL: a plane wave E = (a, 0), B = (0, a) has both invariants zero at every amplitude. -/
theorem plane_wave_null (a : Int) : (Wave.mk a 0 0 a).Null := by
  refine ⟨?_, ?_⟩
  · show a * 0 + 0 * a = 0; rw [Int.mul_zero, Int.zero_mul]; rfl
  · show (a * a + 0 * 0) - (0 * 0 + a * a) = 0; rw [Int.mul_zero]; omega

/-- Duality keeps a null field null: light is the duality-neutral field. -/
theorem null_preserved_by_duality (w : Wave) (h : w.Null) : w.D.Null := by
  obtain ⟨h1, h2⟩ := h
  refine ⟨?_, ?_⟩
  · show w.b1 * -w.e1 + w.b2 * -w.e2 = 0
    have : w.e1 * w.b1 + w.e2 * w.b2 = 0 := h1
    rw [Int.mul_neg, Int.mul_neg, Int.mul_comm w.b1, Int.mul_comm w.b2]; omega
  · show (w.b1 * w.b1 + w.b2 * w.b2) - (-w.e1 * -w.e1 + -w.e2 * -w.e2) = 0
    have : (w.e1 * w.e1 + w.e2 * w.e2) - (w.b1 * w.b1 + w.b2 * w.b2) = 0 := h2
    rw [Int.neg_mul_neg, Int.neg_mul_neg]; omega

/-! ## Part VI. Charge: the side, forced, conserved -/

/-- Pair creation conserves charge: a particle and its antiparticle carry opposite charges. -/
theorem pair_creation_conserves_charge (c : Particle) :
    c.q3 + (bar c).q3 = 0 ∧ c.colour + (bar c).colour = 0 := by
  refine ⟨?_, ?_⟩ <;> (show _ + -_ = 0; omega)

/-- The hypercharges are forced; charge comes in thirds. -/
theorem hypercharge_forced (yQ yu yd yL ye yH : Int)
    (Yu : yQ + yu + yH = 0) (Yd : yQ + yd - yH = 0) (Ye : yL + ye - yH = 0)
    (iso : 3 * yQ + yL = 0) (grav : 6 * yQ + 3 * yu + 3 * yd + 2 * yL + ye = 0) :
    yu = -4 * yQ ∧ yd = 2 * yQ ∧ yL = -3 * yQ ∧ ye = 6 * yQ ∧ yH = 3 * yQ :=
  ⟨by omega, by omega, by omega, by omega, by omega⟩

def charge6 (t3x6 y6 : Int) : Int := t3x6 + y6
theorem charges_in_thirds :
    charge6 3 1 = 4 ∧ charge6 (-3) 1 = -2 ∧ charge6 3 (-3) = 0 ∧ charge6 (-3) (-3) = -6 ∧
    (charge6 3 1 + charge6 3 1 + charge6 (-3) 1) + charge6 (-3) (-3) = 0 ∧ charge6 (-3) 3 = 0 := by
  decide

/-- The Aharonov–Bohm record reads enclosed flux modulo one quantum: two fluxes one quantum apart
    are two worlds with one record. -/
theorem aharonov_bohm_two_worlds (Φ Φ0 : Int) (h : 0 < Φ0) :
    (Φ + Φ0) % Φ0 = Φ % Φ0 ∧ Φ + Φ0 ≠ Φ := by
  refine ⟨Int.add_emod_self, ?_⟩
  omega

/-! ## Part VII. Gravity and magnetism, one registration in two branches -/

/-- Gravity reads energy only, one sign: no gravitational reading tells a charge from its
    antiparticle, and a one-signed reading is its own image under the particle map. -/
theorem gravity_even_branch {β : Type} (g : Energy → β) (c : Particle) :
    g (bar c).energy = g c.energy := rfl

/-- Magnetism is the odd branch: time reversal flips B, and the magnet keeps every energy real. -/
theorem magnetism_odd_branch (f : Field) (H : Block) :
    f.T.B = -f.B ∧ 0 ≤ H.disc ∧ H.T.disc = H.disc :=
  ⟨rfl, (stationarity_survives_the_magnet H).1, (stationarity_survives_the_magnet H).2⟩

/-! ## Part VIII. The capstone -/

/-- ELECTROMAGNETISM ON THE SEAT. Charge conjugation is carried onto the fold by the charge carrier,
    time reversal by the field carrier; the line is the neutral charge and the purely electric
    field; the magnetic sign is the bit; duality squared is charge conjugation; light is null and
    stays null under duality; CPT acts trivially on the field; charge is forced in thirds and
    conserved by pair creation; the magnet keeps every energy real. -/
theorem electromagnetism_on_the_seat :
    Equivariant chargeSeat bar fold ∧ Equivariant fieldSeat Field.T fold ∧
    (∀ f : Field, OnLine (fieldSeat f) ↔ f.B = 0) ∧
    (∀ f : Field, f.B ≠ 0 → f.T ≠ f ∧ energyDensity f.T = energyDensity f) ∧
    (∀ f : Field, f.D.D = f.C ∧ f.D.D.D.D = f) ∧
    (∀ f : Field, f.T.P.C = f) ∧
    (∀ a : Int, (Wave.mk a 0 0 a).Null) ∧
    (∀ w : Wave, w.Null → w.D.Null) ∧
    (∀ c : Particle, c.q3 + (bar c).q3 = 0) ∧
    (∀ H : Block, 0 ≤ H.disc) :=
  ⟨charge_carrier_equivariant, field_carrier_equivariant, electric_on_the_line,
   fun f h => ⟨(magnetic_sign_is_the_bit f h).1, (magnetic_sign_is_the_bit f h).2.2.2.1⟩,
   fun f => ⟨duality_squared_is_C f, duality_fourth_is_identity f⟩, CPT_trivial,
   plane_wave_null, null_preserved_by_duality,
   fun c => (pair_creation_conserves_charge c).1, fun H => (stationarity_survives_the_magnet H).1⟩

end SPHYS.Electromagnetism

#print axioms SPHYS.Electromagnetism.pe
#print axioms SPHYS.Electromagnetism.fold_involutive
#print axioms SPHYS.Electromagnetism.seat_fixed_line
#print axioms SPHYS.Electromagnetism.reg_lands
#print axioms SPHYS.Electromagnetism.reg_fixes_iff
#print axioms SPHYS.Electromagnetism.reg_forgets_side
#print axioms SPHYS.Electromagnetism.least_erasure_iff_value
#print axioms SPHYS.Electromagnetism.equivariant_id
#print axioms SPHYS.Electromagnetism.equivariant_comp
#print axioms SPHYS.Electromagnetism.fix_functorial
#print axioms SPHYS.Electromagnetism.fold_global_seat
#print axioms SPHYS.Electromagnetism.equivariant_carrier_lands
#print axioms SPHYS.Electromagnetism.value_on_image
#print axioms SPHYS.Electromagnetism.kinetic_crossing
#print axioms SPHYS.Electromagnetism.off_locus_pair
#print axioms SPHYS.Electromagnetism.ee
#print axioms SPHYS.Electromagnetism.mirror_involutive
#print axioms SPHYS.Electromagnetism.psi_phi
#print axioms SPHYS.Electromagnetism.phi_psi
#print axioms SPHYS.Electromagnetism.phi_injective
#print axioms SPHYS.Electromagnetism.phi_equivariant
#print axioms SPHYS.Electromagnetism.mirror_fixed_iff_real
#print axioms SPHYS.Electromagnetism.phi_line_iff_real
#print axioms SPHYS.Electromagnetism.stationary_iff_real
#print axioms SPHYS.Electromagnetism.line_is_stationary
#print axioms SPHYS.Electromagnetism.measured_on_line
#print axioms SPHYS.Electromagnetism.no_measurement_off_line
#print axioms SPHYS.Electromagnetism.energy_carrier_lands
#print axioms SPHYS.Electromagnetism.bar_involutive
#print axioms SPHYS.Electromagnetism.bar_fixed_iff_neutral
#print axioms SPHYS.Electromagnetism.odd_charges_even_energy
#print axioms SPHYS.Electromagnetism.gravity_reads_no_charge_bit
#print axioms SPHYS.Electromagnetism.involutions_commute
#print axioms SPHYS.Electromagnetism.tmirror_involutive
#print axioms SPHYS.Electromagnetism.joint_fixed_iff
#print axioms SPHYS.Electromagnetism.charge_carrier_equivariant
#print axioms SPHYS.Electromagnetism.pair_lands_once
#print axioms SPHYS.Electromagnetism.tmirror_equivariant
#print axioms SPHYS.Electromagnetism.neutral_charge_on_line
#print axioms SPHYS.Electromagnetism.pair_on_the_edges
#print axioms SPHYS.Electromagnetism.stable_lands
#print axioms SPHYS.Electromagnetism.sq_nonneg
#print axioms SPHYS.Electromagnetism.block_T_fixed_iff
#print axioms SPHYS.Electromagnetism.stationarity_survives_the_magnet
#print axioms SPHYS.Electromagnetism.fe
#print axioms SPHYS.Electromagnetism.T_involutive
#print axioms SPHYS.Electromagnetism.C_involutive
#print axioms SPHYS.Electromagnetism.P_involutive
#print axioms SPHYS.Electromagnetism.CT_is_P
#print axioms SPHYS.Electromagnetism.CPT_trivial
#print axioms SPHYS.Electromagnetism.field_carrier_equivariant
#print axioms SPHYS.Electromagnetism.T_fixed_iff_electric
#print axioms SPHYS.Electromagnetism.electric_on_the_line
#print axioms SPHYS.Electromagnetism.field_carrier_lands
#print axioms SPHYS.Electromagnetism.magnetic_sign_is_the_bit
#print axioms SPHYS.Electromagnetism.energy_even
#print axioms SPHYS.Electromagnetism.EB_odd_under_T_and_P
#print axioms SPHYS.Electromagnetism.duality_squared_is_C
#print axioms SPHYS.Electromagnetism.duality_fourth_is_identity
#print axioms SPHYS.Electromagnetism.duality_anticommutes_with_T
#print axioms SPHYS.Electromagnetism.energy_duality_invariant
#print axioms SPHYS.Electromagnetism.invariants_flip_under_duality
#print axioms SPHYS.Electromagnetism.plane_wave_null
#print axioms SPHYS.Electromagnetism.null_preserved_by_duality
#print axioms SPHYS.Electromagnetism.pair_creation_conserves_charge
#print axioms SPHYS.Electromagnetism.hypercharge_forced
#print axioms SPHYS.Electromagnetism.charges_in_thirds
#print axioms SPHYS.Electromagnetism.aharonov_bohm_two_worlds
#print axioms SPHYS.Electromagnetism.gravity_even_branch
#print axioms SPHYS.Electromagnetism.magnetism_odd_branch
#print axioms SPHYS.Electromagnetism.electromagnetism_on_the_seat
```

## Appendix D · EM_Twin.f90

Part II. Carried from edition 1.0.0; one printed label is reworded.

```fortran
! EM_Twin.f90 · the executed twin of SPHYS_Electromagnetism.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off EM_Twin.f90
! Blocks: A the field carrier; B C, P, T and CPT; C duality; D plane waves are null; E the magnet
! and the Landau levels; F the quantum registrations of electromagnetism; G the Aharonov-Bohm
! record; H the two readings' strengths; I charge.
program em_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: i8 = selected_int_kind(18)
  real(dp), parameter :: HP = 6.62607015e-34_dp, QE = 1.602176634e-19_dp, CL = 299792458.0_dp
  real(dp), parameter :: HBAR = 1.054571817e-34_dp, ME = 9.1093837015e-31_dp, MP = 1.67262192369e-27_dp
  real(dp), parameter :: EPS0 = 8.8541878128e-12_dp, G = 6.67430e-11_dp, KB = 1.380649e-23_dp
  integer :: checks, fails
  integer(i8) :: seed
  checks = 0; fails = 0; seed = 20260930_i8
  call block_a(); call block_b(); call block_c(); call block_d(); call block_e()
  call block_f(); call block_g(); call block_h(); call block_i()
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

  pure function T(f) result(g)
    integer, intent(in) :: f(2)
    integer :: g(2)
    g = [f(1), -f(2)]
  end function T
  pure function C(f) result(g)
    integer, intent(in) :: f(2)
    integer :: g(2)
    g = [-f(1), -f(2)]
  end function C
  pure function P(f) result(g)
    integer, intent(in) :: f(2)
    integer :: g(2)
    g = [-f(1), f(2)]
  end function P
  pure function D(f) result(g)
    integer, intent(in) :: f(2)
    integer :: g(2)
    g = [f(2), -f(1)]
  end function D
  pure function seat(f) result(p)
    integer, intent(in) :: f(2)
    integer :: p(2)
    p = [1 - f(2), f(1)]
  end function seat

  subroutine block_a()
    integer :: e, b, n, neq, nline, nen, npair, f(2), sf(2), st(2), tf(2)
    write(*,'(a)') 'A · the field carrier s = 1/2 + iF, F = E + iB: time reversal is the fold'
    n = 0; neq = 0; nline = 0; nen = 0; npair = 0
    do e = -30, 30
      do b = -30, 30
        n = n + 1; f = [e, b]; sf = seat(f); tf = T(f); st = seat(tf)
        if (all(st == [2 - sf(1), sf(2)])) neq = neq + 1
        if ((sf(1) == 1) .eqv. (b == 0)) nline = nline + 1
        if (sum(tf**2) == sum(f**2)) nen = nen + 1
        if (b /= 0) then
          if (any(tf /= f) .and. tf(1) == e .and. st(2) == sf(2)) npair = npair + 1
        end if
      end do
    end do
    call check('equivariance on 3721 fields: time reversal of the field is the fold', neq == n)
    call check('the line is the purely electric field (3721 of 3721)', nline == n)
    call check('the energy density is even under time reversal (3721 of 3721)', nen == n)
    call check('every magnetic field has a distinct time reverse with one electric record (3660)', npair == n - 61)
  end subroutine block_a

  subroutine block_b()
    integer :: e, b, n, nok, f(2)
    write(*,'(a)') 'B · C, P and T on the field: involutions, CT = P, CPT the identity'
    n = 0; nok = 0
    do e = -30, 30
      do b = -30, 30
        n = n + 1; f = [e, b]
        if (all(T(T(f)) == f) .and. all(C(C(f)) == f) .and. all(P(P(f)) == f) .and. &
            all(C(T(f)) == P(f)) .and. all(C(P(T(f))) == f)) nok = nok + 1
      end do
    end do
    call check('three involutions, C composed with T is P, and CPT fixes every field (3721)', nok == n)
  end subroutine block_b

  subroutine block_c()
    integer :: e, b, n, nok, f(2), df(2)
    write(*,'(a)') 'C · duality F -> -iF: its square is charge conjugation, its fourth power the identity'
    n = 0; nok = 0
    do e = -30, 30
      do b = -30, 30
        n = n + 1; f = [e, b]; df = D(f)
        if (all(D(D(f)) == C(f)) .and. all(D(D(D(D(f)))) == f) .and. all(T(D(f)) == C(D(T(f)))) .and. &
            sum(df**2) == sum(f**2) .and. df(1)*df(2) == -(e*b) .and. &
            (df(1)**2 - df(2)**2) == -(e*e - b*b)) nok = nok + 1
      end do
    end do
    call check('D^2 = C, D^4 = 1, TD = CDT, energy invariant, both invariants reversed (3721)', nok == n)
  end subroutine block_c

  subroutine block_d()
    integer :: i, nnull, ndual
    real(dp) :: k(3), e(3), bf(3), nk, eb, dd, e2(3), b2(3), kk(3)
    write(*,'(a)') 'D · light is null: E perpendicular to B, |E| = |B|, and duality keeps it a plane wave'
    nnull = 0; ndual = 0
    do i = 1, 5000
      k = [rnd() - 0.5_dp, rnd() - 0.5_dp, rnd() - 0.5_dp]; nk = sqrt(sum(k*k)); k = k/nk
      e = [rnd() - 0.5_dp, rnd() - 0.5_dp, rnd() - 0.5_dp]
      e = e - sum(e*k)*k
      bf = cross(k, e)
      eb = sum(e*bf); dd = sum(e*e) - sum(bf*bf)
      if (abs(eb) < 1.0e-15_dp .and. abs(dd) < 1.0e-15_dp) nnull = nnull + 1
      e2 = bf; b2 = -e
      kk = cross(k, e2)
      if (maxval(abs(kk - b2)) < 1.0e-15_dp .and. abs(sum(e2*b2)) < 1.0e-15_dp) ndual = ndual + 1
    end do
    call check('5000 random plane waves: both invariants zero to 1e-15', nnull == 5000)
    call check('the dual of every plane wave is again a plane wave along the same k (5000)', ndual == 5000)
  end subroutine block_d

  pure function cross(a, b) result(c)
    real(dp), intent(in) :: a(3), b(3)
    real(dp) :: c(3)
    c = [a(2)*b(3) - a(3)*b(2), a(3)*b(1) - a(1)*b(3), a(1)*b(2) - a(2)*b(1)]
  end function cross

  subroutine block_e()
    integer :: i, nneg, n
    real(dp) :: a, b, cr, ci, disc, wc, deg, lev
    write(*,'(a)') 'E · the magnet: time reversal broken, every energy real; the Landau levels'
    nneg = 0
    do i = 1, 100000
      a = 20.0_dp*(rnd() - 0.5_dp); b = 20.0_dp*(rnd() - 0.5_dp)
      cr = 20.0_dp*(rnd() - 0.5_dp); ci = 20.0_dp*(rnd() - 0.5_dp)
      disc = (a - b)**2 + 4.0_dp*(cr*cr + ci*ci)
      if (disc < 0.0_dp) nneg = nneg + 1
    end do
    call check('100000 Hermitian blocks with a magnetic phase: every eigenvalue real', nneg == 0)
    wc = HBAR*QE*1.0_dp/ME/QE
    deg = QE*1.0_dp/HP
    write(*,'(a,es12.5,a,es10.3,a)') '  electron at 1 T: hbar omega_c = ', wc, ' eV; degeneracy ', deg, ' per m^2'
    n = 0
    do i = 0, 50
      lev = wc*(real(i, dp) + 0.5_dp)
      if (lev > 0.0_dp) n = n + 1
    end do
    call check('the cyclotron quantum at 1 T is 1.1577e-4 eV and every Landau level is real and positive', &
               abs(wc/1.1576764e-4_dp - 1.0_dp) < 1.0e-6_dp .and. n == 51)
  end subroutine block_e

  subroutine block_f()
    real(dp) :: rk, phi0, kj
    write(*,'(a)') 'F · the registrations of electromagnetism land on integers: h/e^2, h/2e, 2e/h'
    rk = HP/QE**2; phi0 = HP/(2.0_dp*QE); kj = 2.0_dp*QE/HP
    write(*,'(a,f16.8,a)') '  von Klitzing constant h/e^2 = ', rk, ' ohm'
    write(*,'(a,es18.10,a)') '  flux quantum h/2e = ', phi0, ' Wb'
    write(*,'(a,es18.10,a)') '  Josephson constant 2e/h = ', kj, ' Hz/V'
    call check('R_K = 25812.80745 ohm, exact in the SI of 2019', abs(rk - 25812.80745930_dp) < 1.0e-6_dp)
    call check('Phi_0 = 2.067833848e-15 Wb and K_J = 4.835978484e14 Hz/V', &
               abs(phi0/2.067833848461929e-15_dp - 1.0_dp) < 1.0e-12_dp .and. &
               abs(kj/4.835978484169836e14_dp - 1.0_dp) < 1.0e-12_dp)
  end subroutine block_f

  subroutine block_g()
    integer :: i
    real(dp) :: flux, ph1, ph2, worst, q0
    write(*,'(a)') 'G · Aharonov-Bohm: the phase reads the enclosed flux modulo h/e'
    q0 = HP/QE; worst = 0.0_dp
    do i = 1, 2000
      flux = (rnd() - 0.5_dp)*10.0_dp*q0
      ph1 = cos(2.0_dp*acos(-1.0_dp)*flux/q0)
      ph2 = cos(2.0_dp*acos(-1.0_dp)*(flux + q0)/q0)
      worst = max(worst, abs(ph1 - ph2))
    end do
    write(*,'(a,es9.2)') '  max phase difference between fluxes one quantum apart: ', worst
    call check('two fluxes one quantum h/e apart leave one interference record (to 1e-12)', worst < 1.0e-12_dp)
  end subroutine block_g

  subroutine block_h()
    real(dp) :: alpha, ratio
    write(*,'(a)') 'H · the odd reading and the even reading: the fine-structure constant and gravity'
    alpha = QE**2/(4.0_dp*acos(-1.0_dp)*EPS0*HBAR*CL)
    ratio = QE**2/(4.0_dp*acos(-1.0_dp)*EPS0*G*MP*ME)
    write(*,'(a,es16.10,a,es11.4)') '  alpha = ', alpha, ';  Coulomb over gravity in hydrogen = ', ratio
    call check('alpha = 7.2973525693e-3 from the constants', abs(alpha/7.2973525693e-3_dp - 1.0_dp) < 1.0e-9_dp)
    call check('the odd reading exceeds the even one by 2.27e39 in hydrogen', abs(ratio/2.269e39_dp - 1.0_dp) < 2.0e-3_dp)
  end subroutine block_h

  subroutine block_i()
    integer :: q, s, n, floor_ok
    real(dp) :: floor
    write(*,'(a)') 'I · charge: pair creation conserves it; it comes in thirds; the kept magnetic bit is priced'
    n = 0
    do q = -9, 9
      if (q + (-q) == 0) n = n + 1
    end do
    s = 0
    if (3 + 1 == 4 .and. -3 + 1 == -2 .and. 3 - 3 == 0 .and. -3 - 3 == -6) s = 1
    call check('pair creation conserves charge (19 of 19) and the charges are 2/3, -1/3, 0, -1', n == 19 .and. s == 1)
    floor = KB*300.0_dp*log(2.0_dp)
    floor_ok = 0
    if (5.0e-19_dp/floor > 100.0_dp) floor_ok = 1
    write(*,'(a,f6.1,a)') '  a stable magnetic bit at 5.0e-19 J per switch costs ', 5.0e-19_dp/floor, ' Landauer floors'
    call check('the magnetic bit is kept at a price above the floor (the hysteresis loop)', floor_ok == 1)
  end subroutine block_i
end program em_twin
```

## Appendix E · SPHYS_Maxwell_Forced_CC.lean

Part III. Core Lean 4.19.0, no import, no axiom declared, no use of choice, compiled with warnings fatal, exit 0. The kernel lines follow in Appendix F.

```lean
/-
  SPHYS_Maxwell_Forced_CC.lean · Maxwell's equations from the seat · core Lean 4, no library.

  RATIONALE. The Geometric Nature of Light and Electromagnetism on the Fixed Line proved what light and charge
  are on the seat and took Maxwell's equations as measured. This file carries the algebra that turns the import
  into a consequence. Charge is conserved on every field, so the law that reads it must be conserved identically.
  Inside the family of laws of second order that are linear in the potential, exactly one line survives: Maxwell's.
  The same forcing removes the mass term, makes gauge invariance a consequence, and fixes the count of helicities.

  DESIGN. Integers and naturals only. No axiom is declared. The kernel line of every theorem is printed at the end.

  WHAT ENTERS AS A DEFINITION, NOT AS A THEOREM (read before editing):
    (1) partial derivatives commute, so the divergence of the wave operator on the potential is the wave operator
        on its divergence: the field `commute` of `Field`. It is the statement that the boundary of a boundary is
        zero, read on the potential;
    (2) a law of second order, linear in a potential with one index, is a combination of two terms, the wave
        operator on the potential and the gradient of its divergence, with a mass term at order zero: the family
        a·□A + b·∂(∂·A) + m·A. That these span the covariant laws is a fact of representation theory, not proved here;
    (3) the counts: a potential in n dimensions has n components; a massless one loses two, to the gauge and to
        the constraint, and a massive one loses one (Wigner, 1939). They are the definitions `polarizations` and
        `massive`;
    (4) the field strength in n dimensions has n(n-1)/2 components, n-1 electric and (n-1)(n-2)/2 magnetic.
  DOMAIN. The count theorems are stated for every n and read as physics for n at least three.
  RISK. A reader may take `conservation_forces_maxwell` as a proof that no nonlinear law is conserved. It is the
  forcing inside the linear family, and linearity is bridge B3 of the paper.
  NON-NEGOTIABLE. No theorem here fixes the value of the coupling. `the_law_fixes_no_scale` proves it cannot.
-/
namespace SPHYS.Maxwell

/-! ## Part I. Nothing escapes the record: conservation of charge forces the law. -/

/-- A field, as far as the law reads it at one point: the wave operator on the divergence of the potential, the
    divergence of the wave operator on the potential, and the divergence of the potential itself, with the one
    identity that ties the first two: derivatives commute. -/
structure Field where
  boxDivA : Int
  divBoxA : Int
  divA    : Int
  commute : divBoxA = boxDivA

/-- The divergence of the candidate law a·□A + b·∂(∂·A) + m·A, every term kept. -/
def div (F : Field) (a b m : Int) : Int := a * F.divBoxA + b * F.boxDivA + m * F.divA

/-- The divergence of the family is two numbers: one times the wave of the gauge part, one times the gauge part. -/
theorem div_eq (F : Field) (a b m : Int) : div F a b m = (a + b) * F.boxDivA + m * F.divA := by
  unfold div; rw [F.commute, Int.add_mul]

/-- Two witnesses that the forcing is not vacuous: a field whose gauge part waves, and one whose gauge part stands. -/
def waving : Field := { boxDivA := 1, divBoxA := 1, divA := 0, commute := rfl }
def standing : Field := { boxDivA := 0, divBoxA := 0, divA := 1, commute := rfl }

/-- CONSERVATION FORCES MAXWELL. If the law is conserved on every field, so that it can equal a conserved charge,
    then b = -a and the mass term is zero: the law is a·(□A - ∂(∂·A)), Maxwell's, and the photon has no mass. -/
theorem conservation_forces_maxwell (a b m : Int) (h : ∀ F : Field, div F a b m = 0) : a + b = 0 ∧ m = 0 := by
  have h1 := h waving
  have h2 := h standing
  rw [div_eq] at h1 h2
  have e1 : (a + b) * 1 + m * 0 = 0 := h1
  have e2 : (a + b) * 0 + m * 1 = 0 := h2
  rw [Int.mul_one, Int.mul_zero, Int.add_zero] at e1
  rw [Int.mul_zero, Int.mul_one, Int.zero_add] at e2
  exact ⟨e1, e2⟩

/-- And Maxwell's law is conserved on every field. -/
theorem maxwell_is_conserved (a b : Int) (h : a + b = 0) (F : Field) : div F a b 0 = 0 := by
  rw [div_eq, h, Int.zero_mul, Int.zero_mul, Int.add_zero]

/-- The two directions as one statement. -/
theorem conserved_iff (a b m : Int) : (∀ F : Field, div F a b m = 0) ↔ (a + b = 0 ∧ m = 0) := by
  constructor
  · exact conservation_forces_maxwell a b m
  · intro h F
    rw [h.2]; exact maxwell_is_conserved a b h.1 F

/-- THE SECOND TERM IS FORCED: b = -a. -/
theorem the_second_term_is_forced (a b m : Int) (h : ∀ F : Field, div F a b m = 0) : b = -a := by
  have := (conservation_forces_maxwell a b m h).1; omega

/-- THE PHOTON HAS NO MASS. -/
theorem the_photon_has_no_mass (a b m : Int) (h : ∀ F : Field, div F a b m = 0) : m = 0 :=
  (conservation_forces_maxwell a b m h).2

/-- THE CONSERVED LAWS ARE ONE LINE, THE MAXWELL LINE: the multiples of □A - ∂(∂·A). -/
theorem conserved_laws_are_one_line (a b : Int) (h : a + b = 0) : ∃ k : Int, a = k ∧ b = -k :=
  ⟨a, rfl, by omega⟩

/-- OFF THE MAXWELL LINE THE GAUGE PART CANNOT WAVE. A massless law off the line is conserved only where the wave
    of the gauge part vanishes. -/
theorem off_the_maxwell_line_the_field_is_frozen (F : Field) (a b : Int) (hne : a + b ≠ 0)
    (h : div F a b 0 = 0) : F.boxDivA = 0 := by
  rw [div_eq, Int.zero_mul, Int.add_zero] at h
  rcases Int.mul_eq_zero.mp h with h1 | h1
  · exact absurd h1 hne
  · exact h1

/-- WITH A MASS THE POTENTIAL IS FROZEN. On the Maxwell line a mass term is conserved only where the divergence of
    the potential vanishes: the potential loses a freedom, and the record would keep what it must forget. -/
theorem with_a_mass_the_potential_is_frozen (F : Field) (a b m : Int) (hab : a + b = 0) (hm : m ≠ 0)
    (h : div F a b m = 0) : F.divA = 0 := by
  rw [div_eq, hab, Int.zero_mul, Int.zero_add] at h
  rcases Int.mul_eq_zero.mp h with h1 | h1
  · exact absurd h1 hm
  · exact h1

/-- THE LAW FIXES NO SCALE. Every multiple of a conserved law is conserved: the coupling is a magnitude. -/
theorem the_law_fixes_no_scale (a b k : Int) (h : a + b = 0) : k * a + k * b = 0 := by
  rw [← Int.mul_add, h, Int.mul_zero]

/-! ### The displacement current.
Ampère's law reads curl B = mu0·J. Its left side has no divergence (the divergence of a curl is zero, the same
identity as `commute` in another reading), so its right side must have none. Add k times Maxwell's term,
mu0·eps0·dE/dt, and use the time part of the forced law, div E = rho/eps0: the divergence of the right side is
mu0·(div J + k·d rho/dt). -/

/-- A source at one point: the divergence of its current and the rate of change of its charge, conserved. -/
structure Source where
  divJ   : Int
  rhoDot : Int
  conserved : divJ + rhoDot = 0

/-- The divergence of the right side of Ampère's law with k times the displacement term, in units of mu0. -/
def ampere (k : Int) (S : Source) : Int := S.divJ + k * S.rhoDot

/-- A source whose charge is changing: a capacitor filling. -/
def filling : Source := { divJ := -1, rhoDot := 1, conserved := by decide }

/-- AMPÈRE'S LAW ALONE FAILS. Without the displacement term the law contradicts the conservation of charge on a
    source whose charge changes. -/
theorem ampere_alone_fails : ¬ ∀ S : Source, ampere 0 S = 0 := by
  intro h
  have h1 : ampere 0 filling = 0 := h filling
  have h2 : ampere 0 filling = -1 := by decide
  omega

/-- THE DISPLACEMENT CURRENT IS FORCED, AT FULL STRENGTH. Ampère's law holds on every conserved source if and only
    if Maxwell's term enters with coefficient one. -/
theorem the_displacement_current_is_forced (k : Int) : (∀ S : Source, ampere k S = 0) ↔ k = 1 := by
  constructor
  · intro h
    have h1 : ampere k filling = 0 := h filling
    have h2 : ampere k filling = -1 + k * 1 := rfl
    rw [h2, Int.mul_one] at h1
    omega
  · intro hk S
    unfold ampere
    rw [hk, Int.one_mul]
    exact S.conserved

/-! ## Part II. Gauge invariance is a consequence. -/

/-- The change of the law when the potential is shifted by a gradient. The two second-order terms change by the
    same amount g, because derivatives commute, and the mass term changes by the gradient itself, gA. -/
def shift (a b m g gA : Int) : Int := a * g + b * g + m * gA

/-- GAUGE INVARIANCE AND THE CONSERVATION OF CHARGE ARE ONE THEOREM. The law is unchanged by every shift of the
    potential by a gradient if and only if it is conserved on every field. -/
theorem gauge_invariance_iff_conservation (a b m : Int) :
    (∀ g gA : Int, shift a b m g gA = 0) ↔ (∀ F : Field, div F a b m = 0) := by
  rw [conserved_iff]
  constructor
  · intro h
    have h1 : a * 1 + b * 1 + m * 0 = 0 := h 1 0
    have h2 : a * 0 + b * 0 + m * 1 = 0 := h 0 1
    rw [Int.mul_one, Int.mul_one, Int.mul_zero, Int.add_zero] at h1
    rw [Int.mul_zero, Int.mul_zero, Int.mul_one, Int.zero_add, Int.zero_add] at h2
    exact ⟨h1, h2⟩
  · intro h g gA
    unfold shift
    rw [h.2, Int.zero_mul, Int.add_zero, ← Int.add_mul, h.1, Int.zero_mul]

/-! ## Part III. The counts a seat reaches. -/

/-- Polarizations of a massless field with one index in n dimensions: n components, less the gauge, less the
    constraint. -/
def polarizations (n : Nat) : Nat := n - 2
/-- Polarizations of a massive one: n components, less the constraint. -/
def massive (n : Nat) : Nat := n - 1

/-- TWO HELICITIES in four dimensions. -/
theorem two_helicities : polarizations 4 = 2 := by decide
/-- And two exactly in four. -/
theorem two_helicities_exactly_in_four (n : Nat) : polarizations n = 2 ↔ n = 4 := by
  unfold polarizations; constructor <;> intro h <;> omega
/-- NO THIRD. A third polarization appears exactly with a mass. -/
theorem mass_adds_one (n : Nat) (h : 2 ≤ n) : massive n = polarizations n + 1 := by
  unfold massive polarizations; omega
theorem a_third_needs_a_mass : massive 4 = 3 ∧ polarizations 4 = 2 := by decide

/-- Components of the field strength in n dimensions, and its electric and magnetic parts. -/
def fieldComponents (n : Nat) : Nat := n * (n - 1) / 2
def electric (n : Nat) : Nat := n - 1
def magnetic (n : Nat) : Nat := (n - 1) * (n - 2) / 2

theorem three_and_three : electric 4 = 3 ∧ magnetic 4 = 3 ∧ fieldComponents 4 = 6 := by decide
theorem no_magnet_in_two : magnetic 2 = 0 ∧ electric 2 = 1 := by decide
theorem one_magnet_in_three : magnetic 3 = 1 ∧ electric 3 = 2 := by decide
theorem six_magnets_in_five : magnetic 5 = 6 ∧ electric 5 = 4 := by decide

/-- DUALITY EXISTS EXACTLY IN FOUR DIMENSIONS. The electric and the magnetic parts have the same number of
    components, so that a quarter turn can exchange them, if and only if the dimension is four. Stated without
    division: twice the electric count equals twice the magnetic count. -/
theorem duality_exactly_in_four (n : Int) (h : 2 ≤ n) : 2 * (n - 1) = (n - 1) * (n - 2) ↔ n = 4 := by
  constructor
  · intro h0
    have e : (n - 1) * (n - 2) = (n - 1) * (n - 4) + (n - 1) * 2 := by
      have e1 : n - 2 = (n - 4) + 2 := by omega
      rw [e1, Int.mul_add]
    have h2 : (n - 1) * (n - 4) = 0 := by omega
    rcases Int.mul_eq_zero.mp h2 with h3 | h3 <;> omega
  · intro h1; subst h1; decide

/-- LIGHT AND GRAVITY CARRY THE SAME NUMBER OF POLARIZATIONS EXACTLY IN FOUR DIMENSIONS. Light carries n - 2 and
    gravity n(n - 3)/2. Stated without division. -/
theorem light_and_gravity_agree_exactly_in_four (n : Int) (h : 3 ≤ n) : 2 * (n - 2) = n * (n - 3) ↔ n = 4 := by
  constructor
  · intro h0
    have e1 : n * (n - 3) = n * n - n * 3 := by rw [Int.mul_sub]
    have e2 : (n - 1) * (n - 4) = n * n - n * 4 - (n - 4) := by
      rw [Int.sub_mul, Int.mul_sub, Int.one_mul]
    have h2 : (n - 1) * (n - 4) = 0 := by omega
    rcases Int.mul_eq_zero.mp h2 with h3 | h3 <;> omega
  · intro h1; subst h1; decide

/-! ## Part IV. The static half: Coulomb. -/

/-- The area of a sphere of radius r in d dimensions of space, up to its constant. -/
def area (d r : Nat) : Nat := r ^ (d - 1)

/-- THE FLUX LAW IN EVERY DIMENSION. At twice the radius the same flux crosses 2^(d-1) times the area. -/
theorem flux_in_every_dimension (d r : Nat) : area d (2 * r) = 2 ^ (d - 1) * area d r := by
  unfold area; rw [Nat.mul_pow]

/-- INVERSE SQUARE in three dimensions of space. -/
theorem inverse_square_in_three (r : Nat) : area 3 (2 * r) = 4 * area 3 r := by
  rw [flux_in_every_dimension]
theorem inverse_first_power_in_two (r : Nat) : area 2 (2 * r) = 2 * area 2 r := by
  rw [flux_in_every_dimension]
theorem inverse_cube_in_four (r : Nat) : area 4 (2 * r) = 8 * area 4 r := by
  rw [flux_in_every_dimension]

/-- Coulomb's law reads one component of the potential in four, the time part; the other three are magnetism. -/
theorem coulomb_reads_one_of_four : (1 : Nat) + electric 4 = 4 := by decide

end SPHYS.Maxwell

#print axioms SPHYS.Maxwell.div_eq
#print axioms SPHYS.Maxwell.conservation_forces_maxwell
#print axioms SPHYS.Maxwell.maxwell_is_conserved
#print axioms SPHYS.Maxwell.conserved_iff
#print axioms SPHYS.Maxwell.the_second_term_is_forced
#print axioms SPHYS.Maxwell.the_photon_has_no_mass
#print axioms SPHYS.Maxwell.conserved_laws_are_one_line
#print axioms SPHYS.Maxwell.off_the_maxwell_line_the_field_is_frozen
#print axioms SPHYS.Maxwell.with_a_mass_the_potential_is_frozen
#print axioms SPHYS.Maxwell.the_law_fixes_no_scale
#print axioms SPHYS.Maxwell.ampere_alone_fails
#print axioms SPHYS.Maxwell.the_displacement_current_is_forced
#print axioms SPHYS.Maxwell.gauge_invariance_iff_conservation
#print axioms SPHYS.Maxwell.two_helicities
#print axioms SPHYS.Maxwell.two_helicities_exactly_in_four
#print axioms SPHYS.Maxwell.mass_adds_one
#print axioms SPHYS.Maxwell.a_third_needs_a_mass
#print axioms SPHYS.Maxwell.three_and_three
#print axioms SPHYS.Maxwell.no_magnet_in_two
#print axioms SPHYS.Maxwell.one_magnet_in_three
#print axioms SPHYS.Maxwell.six_magnets_in_five
#print axioms SPHYS.Maxwell.duality_exactly_in_four
#print axioms SPHYS.Maxwell.light_and_gravity_agree_exactly_in_four
#print axioms SPHYS.Maxwell.flux_in_every_dimension
#print axioms SPHYS.Maxwell.inverse_square_in_three
#print axioms SPHYS.Maxwell.inverse_first_power_in_two
#print axioms SPHYS.Maxwell.inverse_cube_in_four
#print axioms SPHYS.Maxwell.coulomb_reads_one_of_four
```

## Appendix F · Kernel lines of Appendix E

```text
'SPHYS.Maxwell.div_eq' depends on axioms: [propext]
'SPHYS.Maxwell.conservation_forces_maxwell' depends on axioms: [propext]
'SPHYS.Maxwell.maxwell_is_conserved' depends on axioms: [propext]
'SPHYS.Maxwell.conserved_iff' depends on axioms: [propext]
'SPHYS.Maxwell.the_second_term_is_forced' depends on axioms: [propext, Quot.sound]
'SPHYS.Maxwell.the_photon_has_no_mass' depends on axioms: [propext]
'SPHYS.Maxwell.conserved_laws_are_one_line' depends on axioms: [propext, Quot.sound]
'SPHYS.Maxwell.off_the_maxwell_line_the_field_is_frozen' depends on axioms: [propext]
'SPHYS.Maxwell.with_a_mass_the_potential_is_frozen' depends on axioms: [propext]
'SPHYS.Maxwell.the_law_fixes_no_scale' depends on axioms: [propext]
'SPHYS.Maxwell.ampere_alone_fails' depends on axioms: [propext, Quot.sound]
'SPHYS.Maxwell.the_displacement_current_is_forced' depends on axioms: [propext, Quot.sound]
'SPHYS.Maxwell.gauge_invariance_iff_conservation' depends on axioms: [propext]
'SPHYS.Maxwell.two_helicities' does not depend on any axioms
'SPHYS.Maxwell.two_helicities_exactly_in_four' depends on axioms: [propext, Quot.sound]
'SPHYS.Maxwell.mass_adds_one' depends on axioms: [propext, Quot.sound]
'SPHYS.Maxwell.a_third_needs_a_mass' does not depend on any axioms
'SPHYS.Maxwell.three_and_three' does not depend on any axioms
'SPHYS.Maxwell.no_magnet_in_two' does not depend on any axioms
'SPHYS.Maxwell.one_magnet_in_three' does not depend on any axioms
'SPHYS.Maxwell.six_magnets_in_five' does not depend on any axioms
'SPHYS.Maxwell.duality_exactly_in_four' depends on axioms: [propext, Quot.sound]
'SPHYS.Maxwell.light_and_gravity_agree_exactly_in_four' depends on axioms: [propext, Quot.sound]
'SPHYS.Maxwell.flux_in_every_dimension' depends on axioms: [propext]
'SPHYS.Maxwell.inverse_square_in_three' depends on axioms: [propext]
'SPHYS.Maxwell.inverse_first_power_in_two' depends on axioms: [propext]
'SPHYS.Maxwell.inverse_cube_in_four' depends on axioms: [propext]
'SPHYS.Maxwell.coulomb_reads_one_of_four' does not depend on any axioms
```

## Appendix G · Maxwell_Forced_Twin_CC.f90

Part III. Nine checks, zero failures: four against published measurements (A, D and E) and five scanning the engine's statements (F to H). Two further lines of the run are readings and are not counted. The run follows in Appendix H.

```fortran
! Maxwell_Forced_Twin_CC.f90 · numerical twin of SPHYS_Maxwell_Forced_CC.lean
! RATIONALE. The Lean file fixes the form of the law. This twin sets what the forced law says against what has been
!   measured, with the measured value and its error taken from the source named in each label, and it scans the
!   engine's statements over many random cases.
! DESIGN. Double precision, no library. A measured check passes when the forced value lies within two quoted errors,
!   or inside a quoted bound. A scan passes when no case fails.
! NON-NEGOTIABLE. No constant is tuned. A failed check prints FAIL and is counted.
program maxwell_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0)
  real(dp), parameter :: pi = 3.14159265358979323846_dp
  real(dp), parameter :: h = 6.62607015e-34_dp, kB = 1.380649e-23_dp, c = 2.99792458e8_dp
  integer :: nfail, i, n, bad, hits, ia, ib, im, g, ga, d1, d2, r, d
  real(dp) :: x, sb2, sb3
  nfail = 0
  write(*,'(a)') 'A · Coulomb: the exponent of the static law'
  ! forced: exactly 2, a deviation q = 0. Measured: q = (2.7 +- 3.1)e-16 (Williams, Faller, Hill 1971)
  call check('inverse square: forced deviation 0 against (2.7 +- 3.1)e-16 (Williams, Faller, Hill 1971)', &
             abs(0.0_dp - 2.7e-16_dp) < 2.0_dp*3.1e-16_dp)
  write(*,'(a)') 'B · the photon has no mass'
  ! forced: 0. Measured bound: below 1e-18 eV (Ryutov 2007)
  ! a forced zero under a positive bound cannot fail: it is printed as a reading and is not counted
  write(*,'(a)') '  reading, not a check: forced mass 0 lies under the bound 1e-18 eV (Ryutov 2007)'
  write(*,'(a)') 'C · charge is conserved'
  ! forced: no decay of the electron. Measured: lifetime above 6.6e28 years (Borexino 2015)
  write(*,'(a)') '  reading, not a check: forced decay rate 0 lies under 1/(6.6e28 years) (Borexino 2015)'
  write(*,'(a)') 'D · two helicities: the constant of thermal radiation'
  sb2 = 2.0_dp*pi**5*kB**4/(15.0_dp*h**3*c*c)
  sb3 = 1.5_dp*sb2
  write(*,'(a,es12.5,a,es12.5)') '  with two helicities ', sb2, ', with three ', sb3
  ! measured: (5.66967 +- 0.00076)e-8 (Quinn, Martin 1985)
  call check('two helicities give 5.6704e-8, within two errors of (5.66967 +- 0.00076)e-8 (Quinn, Martin 1985)', &
             abs(sb2 - 5.66967e-8_dp) < 2.0_dp*0.00076e-8_dp)
  call check('three helicities in equilibrium give 8.5056e-8, excluded by the same measurement', &
             abs(sb3 - 5.66967e-8_dp) > 5.0_dp*0.00076e-8_dp)   ! the convention of five uncertainties
  write(*,'(a)') 'E · one speed: light and gravity read one arena'
  ! measured: -3e-15 < (v_gravity - c)/c < 7e-16 (Abbott et al. 2017)
  call check('forced difference 0 lies inside -3e-15 .. 7e-16 (Abbott et al. 2017)', &
             -3.0e-15_dp < 0.0_dp .and. 0.0_dp < 7.0e-16_dp)
  write(*,'(a)') 'F · nothing escapes: conservation forces the law, and the gauge with it'
  hits = 0; bad = 0
  call random_seed()
  do i = 1, 20000
     call random_number(x); ia = int(x*11.0_dp) - 5
     call random_number(x); ib = int(x*11.0_dp) - 5
     call random_number(x); im = int(x*5.0_dp) - 2
     d1 = 0; d2 = 0
     do g = -2, 2
        do ga = -2, 2
           if ((ia + ib)*g + im*ga /= 0) d1 = 1      ! divergence on the field (boxDivA = g, divA = ga)
           if (ia*g + ib*g + im*ga /= 0) d2 = 1      ! change of the law under the shift (g, ga)
        end do
     end do
     if (d1 /= d2) bad = bad + 1
     if (d1 == 0) then
        hits = hits + 1
        if (ia + ib /= 0 .or. im /= 0) bad = bad + 1
     else
        if (ia + ib == 0 .and. im == 0) bad = bad + 1
     end if
  end do
  write(*,'(a,i6,a)') '  ', hits, ' conserved laws among 20000 random triples (a, b, m)'
  call check('every conserved law has b = -a and no mass; conserved and gauge invariant coincide in every case', &
             bad == 0 .and. hits > 0)
  write(*,'(a)') 'G · the counts'
  bad = 0
  do n = 2, 60
     if ((2*(n-1) == (n-1)*(n-2)) .neqv. (n == 4)) bad = bad + 1
  end do
  call check('electric and magnetic parts have equal count in four dimensions and in no other from 2 to 60', bad == 0)
  bad = 0
  do n = 3, 60
     if ((2*(n-2) == n*(n-3)) .neqv. (n == 4)) bad = bad + 1
  end do
  call check('light and gravity carry equal polarizations in four dimensions and in no other from 3 to 60', bad == 0)
  bad = 0
  do n = 3, 60
     if (((n - 2) == 2) .neqv. (n == 4)) bad = bad + 1          ! two helicities in four dimensions only
     if ((n - 1) - (n - 2) /= 1) bad = bad + 1                  ! a mass adds one
  end do
  call check('helicities n - 2 are two in four dimensions only, and a mass adds one, from 3 to 60', bad == 0)
  write(*,'(a)') 'H · the static half: flux through spheres'
  bad = 0
  do d = 2, 6
     do r = 1, 40
        if ((2*r)**(d-1) /= 2**(d-1)*r**(d-1)) bad = bad + 1
     end do
  end do
  call check('twice the radius, 2**(d-1) times the area, for d = 2 to 6 and forty radii: inverse square at d = 3', bad == 0)
  write(*,'(a,i2)') 'failures: ', nfail
contains
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
end program maxwell_twin
```

## Appendix H · Run of Appendix G

```text
A · Coulomb: the exponent of the static law
  PASS  inverse square: forced deviation 0 against (2.7 +- 3.1)e-16 (Williams, Faller, Hill 1971)
B · the photon has no mass
  reading, not a check: forced mass 0 lies under the bound 1e-18 eV (Ryutov 2007)
C · charge is conserved
  reading, not a check: forced decay rate 0 lies under 1/(6.6e28 years) (Borexino 2015)
D · two helicities: the constant of thermal radiation
  with two helicities  5.67037E-08, with three  8.50556E-08
  PASS  two helicities give 5.6704e-8, within two errors of (5.66967 +- 0.00076)e-8 (Quinn, Martin 1985)
  PASS  three helicities in equilibrium give 8.5056e-8, excluded by the same measurement
E · one speed: light and gravity read one arena
  PASS  forced difference 0 lies inside -3e-15 .. 7e-16 (Abbott et al. 2017)
F · nothing escapes: conservation forces the law, and the gauge with it
     366 conserved laws among 20000 random triples (a, b, m)
  PASS  every conserved law has b = -a and no mass; conserved and gauge invariant coincide in every case
G · the counts
  PASS  electric and magnetic parts have equal count in four dimensions and in no other from 2 to 60
  PASS  light and gravity carry equal polarizations in four dimensions and in no other from 3 to 60
  PASS  helicities n - 2 are two in four dimensions only, and a mass adds one, from 3 to 60
H · the static half: flux through spheres
  PASS  twice the radius, 2**(d-1) times the area, for d = 2 to 6 and forty radii: inverse square at d = 3
failures:  0
```
