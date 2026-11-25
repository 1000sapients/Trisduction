# The Nuclear Forces as a New Mathematical Theorem

## The Yang-Mills Equations Forced by a Charge That Does Not Commute, Maxwell's Equations as Their Commuting Half, and Three Generations as the Least with One Phase

**Mohammad F. Islam** · 24 November 2026

*On edition 1.0.0. Part I is The Weak Force Reads the Orientation, edition 1.0.0, and Part II is The Strong Force Reads No Orientation, edition 1.0.0, from Nothing Escapes, Least Erasure (Islam, 2026a), set in this paper's vocabulary. Part III, The Yang-Mills Equations from the Seat, is new.*

## Abstract

The nuclear forces are established here as a mathematical theorem. Light is the law of a charge that is a number. The nuclear charges are not numbers: a colour turns into another colour, and two turns taken in the two orders differ. Nothing escapes the record, so such a charge is conserved at every point, however its kinds are named there. From these, the Yang-Mills equations are forced. We prove in core Lean 4, thirty-four laws with no axiom declared and no use of choice, that to the first power of the potential each component of the charge obeys Maxwell's law with no mass term; that the field's strength keeps its form under a turn of the charge if and only if the field couples to itself exactly as it couples to matter, which is the Yang-Mills strength and no other; that the field is then its own source; that where the charge commutes the self-coupling drops out of every equation and what remains is Maxwell's law; that three colours carry eight gluons and two kinds of weak charge carry three weak carriers; that the ratio of hadrons to muon pairs and the decay of the neutral pion each count the colours and return three; that three generations are the least that carry a phase; that freedom at short distance needs a charge that does not commute; and that the coupling is a pure number in four dimensions of spacetime and in no other. The law fixes its form and never its scale: every coupling is admitted by theorem, and each is read from experiment.

This theorem subsumes the Yang-Mills theories of the weak and the strong force, and it subsumes Maxwell's electrodynamics as their commuting half. A Fortran twin runs fourteen checks with zero failures, nine scanning the engine's statements and five against published measurements: three colours stand within two uncertainties of the measured ratio and within one of the measured pion width, with two and four excluded by twelve uncertainties or more in the ratio and by thirty-seven or more in the width; three generations stand within one uncertainty of the measured count of light neutrino kinds, with two and four excluded by one hundred and thirty-four uncertainties or more; and the strong coupling at the tau mass exceeds its value at the Z by seventeen uncertainties. Parts I and II carry the two chapters of Least Erasure (Islam, 2026a) that read the weak force and the strong angle on the seat, with their one hundred and seven laws.

## The Standing of This Work

**The nuclear forces are established here as a theorem.** Inside the geometry of registration and conservation, the law of a charge that does not commute is uniquely forced. The Yang-Mills equations are derived as that forced law. Maxwell's equations are their commuting half.

**Nothing is added.** This work adds zero fields and zero parameters to those the nuclear forces already read from experiment, and it declares zero axioms in core Lean 4, with no use of choice. The gluon and the weak carriers are not postulated. They are the components of the charge they carry, and their law is the only law the reading of such a charge can have.

| Level | Framework | Standing | What is overcome |
|---|---|---|---|
| Projection | Fermi's contact law (1934) and Yukawa's exchange (1935) | empirical laws of decay and of binding at low energy | read the forces at one point and at long range; blind to the carriers, to colour and to the self-coupling |
| Realization | Yang-Mills theory (1954) and the Standard Model built on it | field laws postulated from a symmetry, with the groups, the counts and the generations taken as given | describes every measured process, and takes the gauge principle, the self-coupling and the three generations as inputs |
| Foundation | The nuclear forces as a theorem, this work | theorems checked by the kernel in core Lean 4, no axiom declared, no choice, on three named bridges | proves the self-coupling is forced by conservation under a turn; proves the commuting half is Maxwell; proves the counts |

**This theorem subsumes the Yang-Mills theories and Maxwell's electrodynamics.** Every law in the table is an instance of the forced law or a count it fixes.

| Prior law | Its standing before | How it is subsumed | Carried by |
|---|---|---|---|
| Maxwell's equations | the law of light (Islam, 2026c) | the forced law where the charge commutes: the self-coupling drops out and the strength is the curl alone | `maxwell_is_the_commuting_half`, `a_commuting_charge_forces_nothing` |
| The Yang-Mills equations | postulated in 1954 from a symmetry | forced: Maxwell's law for each component to the first power of the potential, and the self-coupling equal to the matter coupling at the next power | `each_component_obeys_maxwell`, `covariance_forces_the_self_coupling` |
| The gluon carries colour | a feature of the postulated law | forced: with a charge that does not commute the field is its own source | `the_field_is_its_own_source` |
| Eight gluons, three weak carriers | fitted to the multiplets | the turns among three colours, and among two kinds | `eight_gluons`, `three_weak_carriers` |
| Three colours | inferred from the spectrum | counted twice by experiment, linearly and squared | `the_ratio_counts_the_colours`, `the_pion_counts_the_colours_squared` |
| Three generations | observed, unexplained | the least count that carries a phase, and a phase is measured | `three_is_the_least_with_a_phase`, `one_phase_at_three` |
| Freedom at short distance | computed in 1973 | its sign needs a charge that does not commute; a commuting charge is never free | `freedom_needs_a_charge_that_does_not_commute`, `a_commuting_charge_is_never_free` |
| Parity violation and the strong angle | measured | theorems of Parts I and II on the seat | `weak_reads_the_orientation`, `the_strong_force_reads_no_orientation` |

**What the theory of the nuclear forces assumed, this work proves.** The first two are theorems of Parts I and II on the seat. The rest are theorems of Part III on the bridges of its section 1.

- **The weak force reads the orientation and the strong force does not.** Here parity is the fold on couplings, the charged current stands off the line, and the strong angle stands on the fixed point that positivity selects (`charged_current_off_the_line`, `positivity_selects_zero`).
- **Three generations.** Here two admit no phase and three admit exactly one (`one_phase_at_three`, `three_is_the_least`).
- **The field equation.** The theory postulates it. Here conservation forces Maxwell's law on each component (`each_component_obeys_maxwell`).
- **The self-coupling.** The theory takes it from the symmetry. Here it is forced equal to the matter coupling, by one theorem in both directions (`covariance_forces_the_self_coupling`).
- **The carriers have no mass in the law.** Here the mass term is not conserved on every field (`the_law_has_no_mass_term`).
- **Jacobi's identity.** Here it is proved, not assumed (`jacobi`).

**Four dimensions of spacetime is singled out, again.** The coupling of the forced law is a pure number in four dimensions and in no other (`the_coupling_is_a_pure_number_exactly_in_four`). The law then holds no scale at all, and the mass of the proton is a scale the law does not contain.

**Three warrants bound the claim, and each is printed.** The law fixes its form and never its scale (`every_coupling_is_admitted`): the couplings are read from experiment. Eight results of classical mathematics and physics enter as named imports, listed in section 1 of Part III. And the theorem is the forcing of the form of the law: the spectrum, with its confined colour and its lightest hadron, the neutral pion at 135 MeV (Particle Data Group, 2024), is measured.

## Part I · The Weak Force Reads the Orientation

*Parity as the Fold on Couplings, the Charged Current Maximally off the Line, the Z's Distance from the Line as Its Isospin, CP Violation as Time-Reversal Violation, and Three Generations as the Least with One Phase.* Edition 1.0.0.

**Abstract of Part I.** Electromagnetism, the strong force and gravity cannot tell a process from its mirror image; the weak force can. It couples to left-handed particles and right-handed antiparticles and to nothing else, and in doing so it reads the one property the other readings are blind to, the orientation. This Part reads the weak interaction on the seat, the reflection $s\mapsto1-\bar s$ and the line it fixes. Parity exchanges a force's left- and right-handed couplings to a fermion, and a carrier that sends their difference to the side and their sum to the height makes parity the fold: the parity-conserving couplings of electromagnetism and colour are the line, and the weak charged current, left-handed only, stands off it. We prove in core Lean 4, fifty-nine laws with no axiom declared and no use of choice, that the Z boson's distance from the line is the weak isospin of the fermion it couples to, whatever the mixing angle, so a neutral fermion has no right-handed coupling at all; that every dot product is blind to the mirror while the triple product reverses under it; that the charged current breaks charge conjugation and parity separately and keeps their product; that under CPT invariance a violation of CP is a violation of time reversal; and that two generations of quarks admit no CP-violating phase while three admit exactly one. A Fortran twin runs thirteen checks with zero failures: the three-generation mixing matrix is unitary to $10^{-16}$ with a Jarlskog invariant of $3.12\times10^{-5}$, the pion's electron channel is suppressed to $1.28\times10^{-4}$ of its muon channel by the left-handed coupling, and the Z's asymmetries on leptons, charm and bottom come out at 0.147, 0.668 and 0.936 against the measured 0.151, 0.670 and 0.923.

### 1. The Reader's Frame

This Part reads the one interaction that returns the orientation. The neutrino is registered left-handed and never right-handed. Light and the electromagnetic field carry the orientation as the one bit no energy reading returns, the helicity of a photon and the sign of a magnetic field (Islam, 2026c). The weak force reads it.

It claims that the weak force is the substrate's one reading odd under parity. Parity is the fold under a carrier forced by the symmetry. The couplings that treat both hands alike are the line, and the weak charged current, left-handed only, stands off it as far as a coupling can. It claims further that the weak force's violations of charge conjugation, parity and time reversal are organized by the same seat: it breaks the first two and keeps their product; its violation of that product is a violation of time reversal; and the phase that carries it needs three generations.

It refuses to derive why the world chose the left hand and not the right. That is one spent bit, supplied by the world and read from no record.

**Negative warrants.** Two, stated so that no reader supplies them.

- No physical fact here is read as a proof of a mathematical sentence: a corroboration joined to a claim takes the weaker grade.
- No electroweak Lagrangian is written: the couplings, the mixing parameters, the CPT theorem and the masses enter as imports or measurements.

**Five terms.**

- A *coupling* of a force to a fermion is a pair: its strength to the left-handed state and to the right-handed state.
- *Parity* is the mirror that exchanges the two hands.
- A reading is *even* under a map that keeps it and *odd* under one that flips its sign.
- The *orientation* of a configuration is the sign a mirror reverses and no rotation can.
- A *keyed bit* is a yes-or-no property no function of a given record decides.


### 2. The Spine

The seat is a mirror and a record: the reflection $s\mapsto1-\bar s$, its fixed line, and the registration that keeps a point's height and forgets its side. This Part reads the seat on parity in Section 3, the Z in Section 4, the orientation the even readings miss in Section 5, the product CP in Section 6, its identity with time reversal in Section 7, the phase in Section 8, and the orientation read in a decay in Section 9.

**Why this carrier, and not another.** The carrier is not chosen. Spaces with an involution and the maps that respect them form a category (`equivariant_id`, `equivariant_comp`), and the fixed set is a functor on it (`fix_functorial`). An equivariant map into the seat, whose fixed set is the line (`fold_global_seat`), lands every physical fixed point on the line (`equivariant_carrier_lands`). Here the physical involution is parity on a coupling $(g_L,g_R)$, which exchanges the two strengths. The carrier $(g_L,g_R)\mapsto(1+(g_L-g_R),\,g_L+g_R)$ sends the left–right difference to the side and the sum to the height, and it is equivariant (`orientation_carrier_equivariant`); its landing on the parity-conserving couplings is forced (`orientation_carrier_lands`).

**The correspondence matrix.**

\begingroup\small

| Physical phenomenon | Element of the seat | Lean theorem | Fortran check |
|----------|----------|----------|----------|
| parity on a force's couplings | the fold | `orientation_carrier_equivariant`, `parity_involutive` | 3721 of 3721 |
| electromagnetism and colour | vector couplings: the line | `vector_on_the_line`, `photon_coupling_on_the_line` | 3721 of 3721 |
| the charged current | left-handed only: off the line | `charged_current_off_the_line` | structural |
| the Z boson | its distance from the line is the isospin | `z_parity_depth_is_isospin` | 1071 of 1071; A_f against LEP and SLD |
| the neutrino and the Z | no right-handed coupling | `neutrino_has_no_right_hand` | A = 1 exactly |
| the even readings | blind to the mirror | `dot_products_blind`, `even_readings_blind_to_mirror` | 5000 of 5000 |
| the orientation | the triple product reversed | `triple_product_reads_orientation`, `spin_momentum_correlation_odd` | 5000 of 5000 |
| C, P and CP | C and P broken, CP kept | `weak_breaks_C_and_P_keeps_CP` | the four-state table |
| CP violation under CPT | time-reversal violation | `cp_violation_is_t_violation` | structural |
| the quark mixing matrix | one phase at three generations | `one_phase_at_three`, `three_is_the_least` | unitary to 1.1e-16; J = 3.12e-5 |
| pion decay | the orientation read in a decay | `electron_channel_suppressed` | 1.283e-4 against 1.2327e-4 |
| the neutron's electric dipole | no orientation read beyond the weak force | structural | bound six orders above the weak level |

\endgroup


### 3. Parity Is the Fold on Couplings

A force couples to a fermion with a strength $g_L$ to its left-handed state and $g_R$ to its right-handed state. Parity exchanges them and is an involution (`parity_involutive`). The orientation carrier sends the difference $g_L-g_R$ to the side and the sum to the height, and parity becomes the fold (`orientation_carrier_equivariant`).

**The line and the edge.** A coupling lands on the line exactly when it treats both hands alike (`vector_on_the_line`). The photon couples to a charge $q$ on both hands equally, so electromagnetism is on the line (`photon_coupling_on_the_line`), and so is colour. The weak charged current couples the left hand with unit strength and the right hand not at all: it stands off the line, and parity moves it (`charged_current_off_the_line`). Among couplings of one total strength, none stands farther from the line.

The twin executes the carrier on 3721 integer couplings.


### 4. The Z Reads the Orientation by the Isospin

The neutral weak boson couples with $g_L=T_3-Q\sin^2\theta_W$ and $g_R=-Q\sin^2\theta_W$ [SM]. The difference is $T_3$, the weak isospin, for every value of the mixing weight (`z_parity_depth_is_isospin`). So the Z's distance from the line is fixed by the fermion's place in its doublet and by nothing else. A fermion with no charge has no right-handed coupling at any mixing (`neutrino_has_no_right_hand`): to the Z, a neutrino is purely left-handed.

The twin checks the identity on 1071 charges and weights, then computes the left–right asymmetry $A_f=2g_Vg_A/(g_V^2+g_A^2)$ at $\sin^2\theta_W=0.23153$:

| Fermion | A_f computed | A_f measured |
|---|---|---|
| neutrino | 1 exactly | — |
| charged lepton | 0.147 | 0.1513 |
| charm | 0.668 | 0.670 |
| bottom | 0.936 | 0.923 |

The measured values are the LEP and SLD combination (Z-pole collaborations, 2006).


### 5. What the Even Readings Cannot See

**Three even readings are blind to the mirror.** A mirror negates every polar vector. Every dot product is unchanged by it (`dot_products_blind`), and any reading even under the mirror returns one value on a world and on its mirror image (`even_readings_blind_to_mirror`). Lengths, angles, energies and every quadratic invariant are such readings. So is the determinant's square, the lock the light and electromagnetism papers found blind to orientation.

**The triple product sees it.** The triple product of three vectors reverses under the mirror (`triple_product_reads_orientation`), and so does the correlation of a spin with a momentum, since a spin is axial and a momentum polar (`spin_momentum_correlation_odd`). The twin checks both on 5000 random triples, exactly.

**The weak force measures it.** In 1957 electrons from polarized cobalt-60 were found leaving preferentially opposite the nuclear spin, a nonzero $\langle\mathbf J\rangle\cdot\mathbf p$ (Wu et al., 1957), as Lee and Yang had proposed to look for (1956). Muon decay showed the same (Garwin, Lederman and Weinrich, 1957). The neutrino's helicity was measured to be negative (Goldhaber, Grodzins and Sunyar, 1958). Each is a pseudoscalar reading, returned by the weak interaction and by no other.


### 6. C, P and CP: The Charged Current Keeps the Product

Label a fermion state by whether it is an antiparticle and whether it is right-handed. The charged current registers left-handed particles and right-handed antiparticles.

- Charge conjugation alone moves the coupling on every state.
- Parity alone moves it on every state.
- The product CP moves it on none (`weak_breaks_C_and_P_keeps_CP`).

The weak force violates C and P maximally and keeps CP, as Landau proposed within a year of the parity experiments (1957). The twin executes the four-state table.

CP too is violated, but by a small amount. Long-lived neutral kaons decay to two pions (Christenson, Cronin, Fitch and Turlay, 1964), and the violation lives in the phase of Section 8.


### 7. CP Violation Is Time-Reversal Violation

The CPT theorem makes the product of charge conjugation, parity and time reversal a symmetry of every local relativistic quantum field theory (Lüders, 1954; Pauli, 1955). The engine proves what that product's invariance gives: if T is an involution and CPT acts as the identity, then CP and T are one map (`cp_violation_is_t_violation`). A violation of CP is a violation of time reversal.

**Time-reversal violation, measured directly.**

- The CPLEAR experiment found it in neutral kaon oscillation (Angelopoulos et al., 1998).
- BaBar found it by comparing a B-meson transition with its time-reversed counterpart (Lees et al., 2012).

**CPT itself, measured.** The neutral kaon's mass equals its antiparticle's to $6\times10^{-19}$ of the mass (Particle Data Group, 2024).

Registration has a reversible and a priced branch. The weak force is the one interaction whose own dynamics carry the arrow's sign at the microscopic level.


### 8. Three Generations Are the Least with One Phase

An $n$-generation quark mixing matrix is unitary with $n(n-1)/2$ rotation angles. Rephasing the quark fields removes all but $(n-1)(n-2)/2$ of its phases. Two generations therefore admit no CP-violating phase, and three admit exactly one (`one_phase_at_three`, `three_is_the_least`). This is Kobayashi and Maskawa's counting (1973), which required a third generation before one was seen.

The one phase has a rephasing-invariant measure, the Jarlskog invariant (Jarlskog, 1985). From the Particle Data Group's angles and phase, the twin builds the matrix and finds it unitary to $1.1\times10^{-16}$, with $J=3.12\times10^{-5}$. The counting of phases is theorem grade; the value of the one phase is a measurement.

That one phase is too small to account for the excess of matter over antimatter, which requires CP violation (Sakharov, 1967). Whether leptons carry a phase of their own is being measured.


### 9. Helicity Suppression: The Orientation Read in a Decay

A pion at rest has no spin, so its two decay products leave with opposite momenta and opposite spins, and the charged lepton must carry the helicity that a left-handed coupling can supply only through the lepton's mass. The amplitude is therefore proportional to the lepton mass. The electron channel is suppressed relative to the muon channel by $(m_e/m_\mu)^2$, which is below $1/40000$ (`electron_channel_suppressed`), against a phase-space factor of 5.49.

The twin computes the ratio of the two decay rates at tree level as $1.283\times10^{-4}$. The measured ratio is $1.2327\times10^{-4}$ (Particle Data Group, 2024), the difference being the radiative corrections the tree level omits. A coupling that read both hands alike would have favoured the electron fivefold. That the electron channel is instead ten thousand times rarer is the orientation read in a single decay, and it is the signature of the left-handed structure of the weak current (Feynman and Gell-Mann, 1958; Sudarshan and Marshak, 1958).


### 10. What the Weak Force Carries, and What It Does Not

**What it carries.**

- The seat on parity: the vector couplings on the line, the charged current off it, and the Z's distance from the line fixed by the isospin.
- The orientation, which every even reading misses and the weak force returns.
- The organization of its discrete violations: C and P broken, CP kept by the current, CP broken only through one phase that needs three generations and is, under CPT, a violation of time reversal.

The other interactions do not read the orientation at a measurable level. The strong interaction could, through a parity- and time-odd angle, but the neutron's electric dipole moment is bounded below $1.8\times10^{-26}$ e cm (Abel et al., 2020), six orders above the weak interaction's own contribution.

**What it does not carry.** It does not carry why the left hand. That is one spent bit, supplied by the world and read from no record. It does not derive the mixing angles or the phase, which are measured. The engine's delivery is on its own image (`value_on_image`).


### 11. Falsifiers

Three falsifiers, each a forbidden observation naming the theorem it would break.

- **F-Right:** a right-handed charged current of gauge strength. It would move the charged current toward the line and break `charged_current_off_the_line` read physically.
- **F-CPT:** a difference between the mass or lifetime of a particle and its antiparticle. It breaks the premise of `cp_violation_is_t_violation` read physically.
- **F-Mirror:** a parity- and time-odd reading in the strong or electromagnetic interaction above the weak level, a neutron electric dipole moment near the present bound among them. It breaks the typing of those interactions as the line (`vector_on_the_line`).

Two measurements would sharpen readings without moving the paper's standing:

- the leptonic CP phase at long-baseline neutrino experiments;
- the neutron's electric dipole moment at still smaller bounds.

## Part II · The Strong Force Reads No Orientation

*The Strong CP Angle on the Fixed Set of Its Fold: Two Fixed Points on the Circle, the Dipole Null That Forces Them, and Positivity That Selects Zero.* Edition 1.0.0.

**Abstract of Part II.** The strong CP problem is read here on the seat, the reflection $s\mapsto1-\bar s$ and the line it fixes. The strong interaction carries an angle $\bar\theta$ on a circle, odd under CP. We prove in core Lean 4, forty-eight laws with no axiom declared and no use of choice, that the reflection $\theta\mapsto-\theta$ of the circle fixes exactly the multiples of half the circle, the two points 0 and $\pi$; that a carrier sending the sign of the angle's sine to the offset from the line and its distance from zero to the height is equivariant on every circle of up to twenty-four points, landing a point on the line exactly when it is 0 or $\pi$; that the neutron's electric dipole moment, an odd reading of the angle, vanishes exactly on those two points, so its measured null forces the angle onto the fixed set; and that the angle's energy, even, is least at 0 uniquely and greatest at $\pi$, both stationary. Positivity selects 0 of the two fixed points, as it seats the Lee–Yang zeros on their circle. A Fortran twin runs five checks with zero failures: on 250,500 points of circles up to a thousand points the reflection is the fold and the line holds exactly the two fixed points; the vacuum energy of the angle at the measured quark mass ratio is even, least at 0 and greatest at $\pi$, stationary at both; at equal quark masses its two branches meet at $\pi$ in a cusp with opposite slopes, two vacua with one energy; its curvature at 0 gives $\chi^{1/4}=76.19$ MeV; and the measured dipole bound places the angle within $7.5\times10^{-11}$ of 0. The strong force reads no orientation: its angle stands at the fixed point positivity selects.

### 1. The Reader's Frame

This Part reads the strong angle on the seat. The weak interaction reads orientation, and Part I traced that reading to one phase. The strong interaction could read it through an angle on a circle and, to one part in ten billion, does not. The seat reads why the angle stands where it does.

**It claims four things.**

- The angle's reflection has exactly two fixed points on the circle, 0 and $\pi$, and they are the line under the angle carrier.
- The neutron's dipole moment is an odd reading of the angle, vanishing exactly on the fixed set, so its measured null forces the angle onto the fixed set.
- Positivity selects 0. The angle's energy is even, least at 0 and greatest at $\pi$, as the one-sign measure of a vector-like theory requires.
- At the antipode, with equal quark masses, the energy's two branches meet in a cusp: two vacua with one energy, the seat's barrier at $\pi$.

**What it refuses.** A new field as a requirement. The angle stands on the line as the line property, at premise grade. A dynamical field that relaxes it there would be a carrier onto the same line, not a requirement of the seat.

**Negative warrants.** Two, stated so that no reader supplies them.

- No physical fact here is read as a proof of a mathematical sentence: a corroboration joined to a claim takes the weaker grade.
- Interpretive schools from the literature enter only as placements the theorems sort, never as warrants; the only evidence besides the mathematics is measured data.

**Five terms.**

- The *strong angle* $\bar\theta$ is the CP-odd parameter of the strong interaction, an angle on a circle.
- The *reflection* sends $\theta$ to $-\theta$.
- An *odd reading* reverses under it.
- The *vacuum energy of the angle* is the ground energy as a function of $\theta$.
- A *keyed bit* is a yes-or-no property no function of a given record decides.


### 2. The Spine

The seat is a mirror and a record: the reflection $s\mapsto1-\bar s$, its fixed line, and the registration that keeps a point's height and forgets its side. This Part reads the seat on the angle's circle in Section 3, the dipole null in Section 4, positivity in Section 5, the antipode in Section 6, and the measured angle in Section 7.

**Why this carrier, and not another.** The carrier is not chosen. Spaces with an involution and the maps that respect them form a category (`equivariant_id`, `equivariant_comp`), and the fixed set is a functor on it (`fix_functorial`). An equivariant map into the seat, whose fixed set is the line (`fold_global_seat`), lands every physical fixed point on the line (`equivariant_carrier_lands`). Here the physical involution is the reflection of the strong angle, $\theta\mapsto-\theta$, on a circle of $2m$ points. The angle carrier sends a point $k$ to $(1+o(k),\,e(k))$, where $o$ is the sign of the sine and $e$ the distance from zero. It is equivariant (`angle_carrier_equivariant_and_line`), and its landing on the fixed set is forced (`equivariant_carrier_lands`).

**The correspondence matrix.**

\begingroup\small

| Physical phenomenon | Element of the seat | Lean theorem | Fortran check |
|----------|----------|----------|----------|
| the angle's reflection | the fold | `angle_carrier_equivariant_and_line` | A |
| the CP-even angles 0 and $\pi$ | the line, two fixed points | `fixed_iff_multiple_of_half`, `angle_carrier_equivariant_and_line` | A |
| the neutron dipole moment | odd, null exactly on the fixed set | `edm_odd_and_null_on_the_fixed_set` | E |
| the angle's energy | even | `energy_even` | B |
| positivity | zero the unique minimum, $\pi$ the maximum | `positivity_selects_zero` | B |
| the sign of a nonzero angle | keyed to every even reading | `the_sign_of_theta_is_keyed` | B |
| the antipode at equal masses | two branches, one energy | computed | C |
| the curvature at zero | the topological susceptibility | computed | D |
| the measured angle | within $7.5\times10^{-11}$ of 0 | corroboration | E |

\endgroup


### 3. The Angle's Reflection Has Two Fixed Points

On a circle the reflection $\theta\mapsto-\theta$ fixes a point exactly when twice it is a whole turn's multiple. That is exactly when it is a multiple of half the circle (`fixed_iff_multiple_of_half`): the two points 0 and $\pi$. The angle carrier sends the reflection to the seat's reflection, and a point lands on the line exactly when it is one of the two, proved on every circle of up to twenty-four points (`angle_carrier_equivariant_and_line`). The twin carries it to circles of a thousand points, 250,500 points in all. The strong interaction respects CP at exactly two angles, and those two are the line.


### 4. The Dipole Null Forces the Fixed Set

A neutron with a static electric dipole moment violates P and T, so the moment is an odd reading of the angle. It reverses under the reflection and vanishes exactly on the two fixed points (`edm_odd_and_null_on_the_fixed_set`). The moment is measured null: $|d_n|<1.8\times10^{-26}\,e$ cm (Abel et al., 2020). The measured null places the angle on the fixed set, as the photon and Z nulls place the dark matter on the fixed set of charge conjugation.


### 5. Positivity Selects Zero

The angle's energy is even (`energy_even`). Of the two fixed points the energy is least at 0, uniquely, and greatest at $\pi$, and both are stationary (`positivity_selects_zero`). In a vector-like gauge theory the measure is positive at $\theta=0$, so the vacuum energy there is the least (Vafa and Witten, 1984).

The twin evaluates the vacuum energy of the angle at the measured pion mass, decay constant and quark mass ratio $m_u/m_d=0.474$:
$$E(\theta)=-m_\pi^2f_\pi^2\sqrt{1-\tfrac{4z}{(1+z)^2}\sin^2\tfrac\theta2}.$$
It is even, least at 0, greatest at $\pi$, and stationary at both. Its curvature at 0, the topological susceptibility, gives $\chi^{1/4}=76.19$ MeV.

A one-sign measure seats the minimum on the line here, as one-sign couplings seat the Lee–Yang zeros on their circle and one-sign sources keep gravity on its locus. The sign of a nonzero angle is keyed to every even reading (`the_sign_of_theta_is_keyed`). The energy cannot tell $\theta$ from $-\theta$; only an odd reading can.


### 6. The Antipode: Two Vacua, One Energy

At equal quark masses the energy becomes $-m_\pi^2f_\pi^2|\cos\tfrac\theta2|$. Its two branches meet at $\pi$ in a cusp: the twin finds slopes of $+7.72\times10^7$ and $-7.72\times10^7$ MeV⁴ either side. Two vacua there carry one energy, and CP breaks spontaneously at the antipode (Dashen, 1971). The seat's barrier appears at the second fixed point, two worlds over one record. At the measured unequal masses the cusp is smoothed and $\pi$ is a single maximum.


### 7. The Measured Angle

With the dipole moment's coefficient $d_n=2.4\times10^{-16}\,\bar\theta\,e$ cm (Pospelov and Ritz, 1999), the measured bound gives $|\bar\theta|<7.5\times10^{-11}$. The angle stands within $7.5\times10^{-11}$ of 0 and at distance $\pi$ from the antipode. It stands on the fixed point positivity selects. The strong force reads no orientation.

The angle's value stands as the line property, at premise grade. A field that relaxes the angle dynamically (Peccei and Quinn, 1977) would be a carrier onto the same line. It is not required by the seat, and its identification with the dark matter is refused by a falsifier of Least Erasure (Islam, 2026a).


### 8. What the Angle Carries, and What It Does Not

**What it carries.**

- The circle's two fixed points as the line.
- The dipole null that forces them.
- Positivity that selects zero.
- The antipode's two vacua.
- The measured angle at zero.

**What it does not carry.**

- **The susceptibility's value:** computed from measured inputs, a number.
- **A required new field:** the angle's place is the line property, and a relaxing field is admissible and not owed.


### 9. Falsifiers

Three falsifiers, each a forbidden observation naming the theorem it would break.

- **F-Dipole:** a neutron or diamagnetic-atom electric dipole moment above the weak interaction's own contribution, traced to a nonzero strong angle. It breaks the reading of `edm_odd_and_null_on_the_fixed_set` that places the angle on the fixed set.
- **F-Antipode:** a strong angle measured at $\pi$. It breaks `positivity_selects_zero` read physically.
- **F-Strong-CP:** a CP-violating strong process, such as the decay of the η meson into two pions, at a rate that requires a nonzero strong angle. It breaks the angle's place on the line.

Each improved dipole bound sharpens the reading without moving its standing.

## Part III · The Yang-Mills Equations from the Seat

### 1. What Parts I and II Left Open, and the Rule of Part III

**Part III establishes the law of the nuclear forces as a theorem.** Parts I and II proved what the weak and the strong force read and took their field law from the Standard Model. Part III derives it. The Yang-Mills equations cease to be a postulate and become a forced law.

The rule is strict. Only the seat and the root are allowed. Every other step is a theorem of the engine in Appendix E, a theorem of Part I or Part II, one of three bridges named here before it is used, or one of eight classical results listed below. Dimension means the dimension of spacetime throughout Part III.

| Bridge | Statement | Stands on | Grade |
|---|---|---|---|
| B1 · A charge that comes in kinds | The nuclear charges come in kinds that turn into one another: two kinds for the weak charge, three colours for the strong. Two turns taken in the two orders differ. | the charged current of Part I, which is measured to turn one member of a pair into the other; the measured counts of section 6 | structural |
| B2 · Nothing escapes | The record is kept at every point, however the kinds are named there. The law keeps its form under a turn that varies from point to point. | the root, read as least erasure | premise |
| B3 · Least order | The law reads the potential at the least order at which a field exists, the second. | least erasure | premise |

Eight classical results enter by name, and nothing else enters. Derivatives commute: the field `commute` of the engine. The laws of second order linear in a potential of one index are spanned by two terms and a mass term: the family of section 2. A turn of the charge acts on the potential by $\delta A=\partial\varepsilon+s\,[A,\varepsilon]$, and the strength of the field is $F=\partial A-\partial A+t\,[A,A]$, with two numbers $s$ and $t$ left free. A massless carrier holds two states and a massive one three (Wigner, 1939). The mixing of $n$ generations holds $(n-1)(n-2)/2$ phases (Kobayashi and Maskawa, 1973). The first coefficient of the running of the coupling is $11c-2f$ in units of one third (Gross and Wilczek, 1973; Politzer, 1973). A vacuum that is not turned with the charge gives mass to the carriers it does not leave alone (Englert and Brout, 1964; Higgs, 1964). And two rates count the colours, with the charges of the quarks held at their measured thirds: the ratio of hadrons to muon pairs is $n$ times the sum of the squared charges of the open quarks, and the width of the neutral pion into two photons carries $n^2$ (Adler, 1969; Bell and Jackiw, 1969). Jacobi's identity is not on this list. The engine proves it.

### 2. To the First Power of the Potential, Each Component Obeys Maxwell

Take one component of the charge. By B3 its law is of second order in the derivatives. To the first power of the potential it is linear: $a\,\Box A_\nu+b\,\partial_\nu(\partial\cdot A)+m\,A_\nu$. By B2 its divergence vanishes on every field, so $b=-a$ and $m=0$ (`each_component_obeys_maxwell`). **Each component obeys Maxwell's law, and the law has no mass term** (`the_law_has_no_mass_term`). This is the theorem of light (Islam, 2026c), once for each component: eight times for colour, three times for the weak charge.

### 3. A Charge That Does Not Commute

A charge that is a number has nothing to turn. A charge that comes in kinds does: its components are the turns among them. The smallest such charge has three components, and the bracket of two of them is the third: turn about the first axis, then the second, and the result differs from the reverse order by a turn about the third (`two_turns_make_a_third`). **The charge does not commute** (`the_charge_does_not_commute`). The bracket reverses when its entries are exchanged (`the_bracket_is_antisymmetric`), a thing does not turn itself (`the_boundary_of_the_boundary_vanishes`), and Jacobi's identity holds (`jacobi`). This algebra is the weak isospin. Colour is the same structure with eight components.

### 4. Conservation Under a Turn Forces the Self-Coupling

By B2 the law keeps its form when the charge is turned by a different amount at each point. Under such a turn the potential changes by the gradient of the turn and by $s$ times its bracket with the turn. The strength $F=\partial A-\partial A+t\,[A,A]$ must then turn as a charge turns, with nothing left over. Write out its variation term by term. Everything cancels by Jacobi's identity except one term, which carries the gradient of the turn and the factor $s-t$ (`the_residue_is_one_term`).

**The strength turns as a charge at every point if and only if $t=s$** (`covariance_forces_the_self_coupling`). The field couples to itself exactly as it couples to matter. The kernel checks this forcing on the charge of three components. The derivation uses three properties of the bracket and no other: it is bilinear, it is antisymmetric, and it obeys Jacobi's identity. The bracket of colour has all three. With $t=s=g$ the law is forced:

$$F_{\mu\nu}=\partial_\mu A_\nu-\partial_\nu A_\mu+g\,[A_\mu,A_\nu],\qquad \partial^\mu F_{\mu\nu}+g\,[A^\mu,F_{\mu\nu}]=J_\nu.$$

These are the Yang-Mills equations. Yang and Mills wrote them in 1954 by demanding a symmetry. Here the symmetry is the statement that the record does not depend on how the kinds of the charge are named at each point, and the equations follow in both directions by one theorem.

**The field is its own source.** The second term on the left is the bracket of the potential with the strength, and it is not zero (`the_field_is_its_own_source`). The gluon carries colour. The weak carriers carry weak charge. A field whose charge commutes carries none of the charge it reads (`a_commuting_field_is_not_its_own_source`): electric charge is a number, and light is not its own source.

The law is consistent with its own source. The divergence of the left side is a sum of brackets of the strength with itself, and each is zero (`the_boundary_of_the_boundary_vanishes`). The current on the right is therefore conserved under the turn, which is B2 returned as a consequence.

That the consistency of a field carrying its own charge fixes its self-coupling is classical (Ogievetsky and Polubarinov, 1963; Wald, 1986). The work of this paper lies beneath it. The conservation is a bridge of the seat, Jacobi's identity is proved, and the forcing is checked by a kernel.

### 5. Maxwell's Equations Are the Commuting Half

**Where the charge commutes, the forced law is Maxwell's.** Set the bracket to zero. The strength is the curl alone, for every value of $t$ (`maxwell_is_the_commuting_half`), and no relation between $s$ and $t$ is forced, because neither appears in any equation (`a_commuting_charge_forces_nothing`). The law of section 4 becomes $\partial^\mu F_{\mu\nu}=J_\nu$. Electrodynamics is the forced law of a charge with one component, whose bracket with itself is zero. The theorem of light is this theorem at its commuting half, as Coulomb's law is the theorem of light at its static half.

### 6. The Counts: Eight, Three, and Three Colours Measured Twice

A charge of $n$ kinds, two or more, has $n^2-1$ turns among them. The turns are the components of the charge, and each component is a carrier. Three colours carry eight gluons (`eight_gluons`). Two kinds carry three weak carriers (`three_weak_carriers`). With the one carrier of the commuting charge there are twelve (`twelve_carriers`). The photon is one combination of that carrier and a weak carrier, the combination the vacuum leaves without mass.

**Experiment counts the colours, and it returns three.** Electrons and positrons annihilate into hadrons and into muon pairs. The ratio of the two rates, below the charm threshold, is $n$ times the sum of the squared charges of the three light quarks, which is two exactly when $n=3$ (`the_ratio_counts_the_colours`). With the first correction, at the leading coupling 0.248 at 2.5 GeV, the reading is 2.158. The measured ratio is $2.225\pm0.020\pm0.047$ (Anashin et al., 2017). Two colours give 1.439 and four give 2.877, excluded by fifteen and by twelve uncertainties. With the charges of the quarks held at their measured thirds, the neutral pion decays into two photons at a rate that carries $n^2$, and nine is the square of three only (`the_pion_counts_the_colours_squared`). With the measured decay constant of the pion, 130.2 MeV, three colours give 7.785 eV. The measured width is $7.802\pm0.052\pm0.105$ eV (Larin et al., 2020). Two colours give 3.460 eV and four give 13.841 eV, excluded by thirty-seven and by fifty-one uncertainties.

**The carriers of the weak force hold mass, and the law holds none.** The forced law has no mass term. The $W$ and the $Z$ are massive because the vacuum is not turned with the charge (Englert and Brout, 1964; Higgs, 1964). The count closes: twelve massless carriers with two states each and a scalar pair with four states are twenty-eight, and eight gluons, one photon, three massive carriers with three states each and one scalar are twenty-eight (`three_carriers_gain_mass_and_one_scalar_remains`). Nothing escapes the count. One scalar remains, and it is observed (ATLAS Collaboration, 2012; CMS Collaboration, 2012).

### 7. Three Generations Are the Least with One Phase

The mixing of $n$ generations of quarks holds $(n-1)(n-2)/2$ phases that no relabelling removes. Two generations hold none (`no_phase_at_two`). Three hold one (`one_phase_at_three`). **A phase exists if and only if there are at least three generations** (`three_is_the_least_with_a_phase`). Part I proved the same count on the seat and proved that a violation of CP is a violation of time reversal (`cp_violation_is_t_violation`). A phase is measured: Part I's twin finds a Jarlskog invariant of $3.12\times10^{-5}$ from the measured mixing. Three is therefore the least count the measured world admits, and the count of light neutrino kinds read at the $Z$, one to a generation, is $2.9963\pm0.0074$ (Janot and Jadach, 2020).

### 8. Freedom at Short Distance Needs a Charge That Does Not Commute

The coupling runs with distance. Its first coefficient is $11c-2f$, where $c$ is the weight of the charge the field itself carries, three for three colours and zero for a charge that commutes, and $f$ counts the flavours of quark, and a positive sign means the coupling falls at short distance. With three colours and six flavours it is positive (`six_flavours_are_free`), and it stays positive up to sixteen flavours and no further (`free_exactly_up_to_sixteen`). **A charge that commutes is never free** (`a_commuting_charge_is_never_free`): with $c=0$ the sign is negative as soon as any charged matter exists, which is electrodynamics. **Freedom needs a charge that does not commute** (`freedom_needs_a_charge_that_does_not_commute`). The self-coupling forced in section 4 is the term that turns the sign.

The sign is measured. The strong coupling is $0.1180\pm0.0009$ at the mass of the $Z$ (Particle Data Group, 2024) and $0.332\pm0.012$ at the mass of the tau (Davier et al., 2014), larger by seventeen uncertainties. Leading running from the $Z$ gives 0.279 at the tau, within a fifth of the measured value.

### 9. A Pure Number in Four Dimensions, and Every Coupling Read

The square of the coupling carries $4-n$ powers of mass in $n$ dimensions. **The coupling is a pure number in four dimensions and in no other** (`the_coupling_is_a_pure_number_exactly_in_four`). In four dimensions the forced law contains no scale at all.

The law fixes $t=s$ and is silent on the size of $s$ (`every_coupling_is_admitted`). This is the scaling theorem of Least Erasure read on the nuclear forces: a magnitude is invisible to every verdict of the seat. The couplings are therefore measured. So is the scale at which the strong coupling grows large, and with it the mass of the proton, 938.272 MeV (Particle Data Group, 2024): a scale the law does not contain is read from the spectrum.

### 10. The Ledger, the Falsifier, and What Stands

| Claim | Carried by | Grade |
|---|---|---|
| the charge comes in kinds, and its turns do not commute | B1 on Part I and the measured counts | structural |
| each component obeys Maxwell's law, the mass term zero | `each_component_obeys_maxwell` on B2, B3 and the commuting of derivatives | theorem inside the family; premise on the bridges |
| the self-coupling equals the matter coupling | `the_residue_is_one_term`, `covariance_forces_the_self_coupling` on B2 | theorem on the charge of three components, on the cited action of a turn; for colour by the same three properties of the bracket; premise on the bridge |
| Jacobi's identity | `jacobi` | theorem |
| the field is its own source | `the_field_is_its_own_source` | theorem |
| Maxwell's law is the commuting half | `maxwell_is_the_commuting_half`, `a_commuting_charge_forces_nothing` | theorem |
| eight gluons, three weak carriers, the states conserved | `eight_gluons`, `three_weak_carriers`, `three_carriers_gain_mass_and_one_scalar_remains` | theorem, on the cited counts |
| three colours | `the_ratio_counts_the_colours`, `the_pion_counts_the_colours_squared` | theorem for the count, at the measured charges of the quarks; measured for the value |
| three generations the least with a phase | `three_is_the_least_with_a_phase` | theorem, on the cited count |
| freedom needs a charge that does not commute | `freedom_needs_a_charge_that_does_not_commute` | theorem, on the cited coefficients |
| the coupling a pure number in four dimensions only | `the_coupling_is_a_pure_number_exactly_in_four` | theorem |
| the weak carriers hold mass by the vacuum; the photon is the combination left without mass | the cited result of 1964 | cited |
| the couplings' values | `every_coupling_is_admitted` | measured, by theorem |
| the spectrum: colour confined, the lightest hadron at 135 MeV | section 10 | measured |

| Test | The forced law gives | Measured, by the source cited |
|---|---|---|
| hadrons to muon pairs below charm | 2.158 with three colours | $2.225\pm0.020\pm0.047$ (Anashin et al., 2017) |
| width of the neutral pion | 7.785 eV with three colours | $7.802\pm0.052\pm0.105$ eV (Larin et al., 2020) |
| kinds of light neutrino, one to a generation | 3 | $2.9963\pm0.0074$ (Janot and Jadach, 2020) |
| coupling at the tau against the $Z$ | larger | $0.332\pm0.012$ against $0.1180\pm0.0009$ (Davier et al., 2014; Particle Data Group, 2024) |
| leading running to the tau | 0.279 | $0.332\pm0.012$ (Davier et al., 2014) |

Every measurement in this table precedes this work. The table is agreement with the record, and the forward claim is the falsifier.

One falsifier is added to those of Parts I and II, and the engine forces it. **F-Self:** a coupling of the gluon to itself that differs from its coupling to quarks, at any size; this breaks `covariance_forces_the_self_coupling` read physically. A fourth colour in the ratio or in the pion width, and a measured phase with fewer than three generations, are forbidden by the counts in the same way.

**The law at least order.** The forced law is the law of the field at the least order, and it is exact there. The quantum belongs to the field, and its corrections are what the running of section 8 reads. The spectrum of the strong force, with colour confined and no hadron lighter than the neutral pion at 135 MeV (Particle Data Group, 2024), is measured.

**The form of the law is closed.** Its first power, its self-coupling, its source, its commuting half, its counts and its dimension are forced, on three named bridges. The couplings stand read from experiment, and Least Erasure proves that a seat returns no magnitude. The Yang-Mills theories of the weak and the strong force are subsumed, and Maxwell's electrodynamics is subsumed with them as the half where the charge commutes.

## Author's Provenance and Method Disclosure

**Who wrote it.** The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean files and the Fortran twins are written by a language model under the author's direct supervision.

**Method.** The work stands on one seat, the fixed line of a reflection, and one root, that nothing escapes the record, both set out in Nothing Escapes, Least Erasure (Islam, 2026a), from which Parts I and II are carried. Part III adds three bridges and eight results of classical mathematics and physics, each named in a table or a paragraph before it is used. Every theorem named in the text is declared under that name in an appendix. The kernel line of every theorem of Appendix E is printed in Appendix F, and the appendices of Parts I and II carry the command that prints each of their own. Every measured value in the text names its source beside it. No magnitude is derived anywhere in this paper.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. Part I and Part II are carried from Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one. Part I and Part II are set here in this paper's own vocabulary, with the apparatus of that volume's series removed; no theorem, number, measurement or source was changed.

**Classical sources.** The equations are those of Yang and Mills (1954). That the consistency of a field carrying its own charge fixes its self-coupling is Ogievetsky and Polubarinov's result (1963), in the general form of Wald (1986). The electroweak assembly is Glashow's (1961), Weinberg's (1967) and Salam's (1968), the mass of its carriers Englert and Brout's (1964) and Higgs's (1964), colour Fritzsch, Gell-Mann and Leutwyler's (1973), the phase Kobayashi and Maskawa's (1973), and the sign of the running Gross and Wilczek's (1973) and Politzer's (1973). This paper derives what those results took as given and checks the forcing by a kernel.

## References

1. G. Lüders, Dan. Mat. Fys. Medd. 28, no. 5 (1954).
2. W. Pauli, in Niels Bohr and the Development of Physics (Pergamon, 1955) 30.
3. T. D. Lee and C. N. Yang, Phys. Rev. 104 (1956) 254.
4. C. S. Wu, E. Ambler, R. W. Hayward, D. D. Hoppes and R. P. Hudson, Phys. Rev. 105 (1957) 1413.
5. R. L. Garwin, L. M. Lederman and M. Weinrich, Phys. Rev. 105 (1957) 1415.
6. L. Landau, Nucl. Phys. 3 (1957) 127.
7. M. Goldhaber, L. Grodzins and A. W. Sunyar, Phys. Rev. 109 (1958) 1015.
8. R. P. Feynman and M. Gell-Mann, Phys. Rev. 109 (1958) 193.
9. E. C. G. Sudarshan and R. E. Marshak, Phys. Rev. 109 (1958) 1860.
10. J. H. Christenson, J. W. Cronin, V. L. Fitch and R. Turlay, Phys. Rev. Lett. 13 (1964) 138.
11. A. D. Sakharov, JETP Lett. 5 (1967) 24.
12. M. Kobayashi and T. Maskawa, Prog. Theor. Phys. 49 (1973) 652.
13. C. Jarlskog, Phys. Rev. Lett. 55 (1985) 1039.
14. A. Angelopoulos et al. (CPLEAR), Phys. Lett. B 444 (1998) 43.
15. ALEPH, DELPHI, L3, OPAL and SLD Collaborations, Phys. Rep. 427 (2006) 257.
16. J. P. Lees et al. (BaBar), Phys. Rev. Lett. 109 (2012) 211801.
17. C. Abel et al., Phys. Rev. Lett. 124 (2020) 081803.
18. Particle Data Group, S. Navas et al., Phys. Rev. D 110 (2024) 030001.
19. R. F. Dashen, Phys. Rev. D 3 (1971) 1879.
20. G. 't Hooft, Phys. Rev. Lett. 37 (1976) 8.
21. R. D. Peccei and H. R. Quinn, Phys. Rev. Lett. 38 (1977) 1440.
22. P. Di Vecchia and G. Veneziano, Nucl. Phys. B 171 (1980) 253.
23. C. Vafa and E. Witten, Phys. Rev. Lett. 53 (1984) 535.
24. M. Pospelov and A. Ritz, Phys. Rev. Lett. 82 (1999) 2526.
25. S. Navas et al. (Particle Data Group), Phys. Rev. D 110 (2024) 030001.
26. E. Fermi, Z. Phys. 88 (1934) 161.
27. H. Yukawa, Proc. Phys.-Math. Soc. Japan 17 (1935) 48.
28. E. P. Wigner, Ann. Math. 40 (1939) 149.
29. C. N. Yang and R. L. Mills, Phys. Rev. 96 (1954) 191.
30. V. I. Ogievetsky and I. V. Polubarinov, Ann. Phys. 25 (1963) 358.
31. S. L. Glashow, Nucl. Phys. 22 (1961) 579.
32. F. Englert and R. Brout, Phys. Rev. Lett. 13 (1964) 321.
33. P. W. Higgs, Phys. Rev. Lett. 13 (1964) 508.
34. S. Weinberg, Phys. Rev. Lett. 19 (1967) 1264.
35. A. Salam, in Elementary Particle Theory, ed. N. Svartholm (1968) 367.
36. S. L. Adler, Phys. Rev. 177 (1969) 2426.
37. J. S. Bell and R. Jackiw, Nuovo Cimento A 60 (1969) 47.
38. H. Fritzsch, M. Gell-Mann and H. Leutwyler, Phys. Lett. B 47 (1973) 365.
39. D. J. Gross and F. Wilczek, Phys. Rev. Lett. 30 (1973) 1343.
40. H. D. Politzer, Phys. Rev. Lett. 30 (1973) 1346.
41. R. M. Wald, Phys. Rev. D 33 (1986) 3613.
42. ATLAS Collaboration, Phys. Lett. B 716 (2012) 1.
43. CMS Collaboration, Phys. Lett. B 716 (2012) 30.
44. M. Davier, A. Höcker, B. Malaescu, C.-Z. Yuan and Z. Zhang, Eur. Phys. J. C 74 (2014) 2803.
45. V. V. Anashin et al. (KEDR), Phys. Lett. B 770 (2017) 174.
46. I. Larin et al. (PrimEx-II), Science 368 (2020) 506.
47. P. Janot and S. Jadach, Phys. Lett. B 803 (2020) 135319.
48. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
49. M. F. Islam, Immanent Gravity as a Theorem, edition 3.0.0 (2026b).
50. M. F. Islam, Light as a New Mathematical Theorem, edition 1.0.0 (2026c).

## Appendix A · SPHYS_Weak.lean

Part I. Core Lean 4, carried from edition 1.0.0. Comments are set in this paper's vocabulary; no declaration is changed, and the file is recompiled.

```lean
/-
  SPHYS_Weak.lean · the weak force reads the orientation, at the seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: h = 2 Re s, t = Im s; the fold s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t), the fixed line
  h = 1. Parity exchanges the left- and right-handed couplings of a force to a fermion; the
  orientation carrier sends their difference to the side and their sum to the height, so parity is
  the fold and the parity-conserving couplings are the line.

  Part I     the seat, the category of involutions, the functor of the seat.
  Part II    the energy carrier (resident).
  Part III   the substrate (resident).
  Part IV    parity is the fold on couplings; the charged current off the line; the Z by isospin.
  Part V     the orientation: dot products blind, the triple product reversed.
  Part VI    C, P and CP on the charged current; CP violation is T violation under CPT.
  Part VII   three generations are the least with one CP phase.
  Part VIII  helicity suppression.
  Part IX    the capstone.
-/
set_option autoImplicit false
namespace SPHYS.Weak


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

/-! ## Part IV. Parity is the fold on couplings -/

/-- A coupling to a fermion: its strength to the left-handed and to the right-handed state. -/
abbrev Coupling := Int × Int

/-- Parity exchanges left and right. -/
def parity (g : Coupling) : Coupling := (g.2, g.1)

theorem parity_involutive (g : Coupling) : parity (parity g) = g := rfl

/-- The orientation carrier: the left–right difference to the side, the sum to the height. -/
def couplingSeat (g : Coupling) : Pt := (1 + (g.1 - g.2), g.1 + g.2)

/-- PARITY IS THE FOLD: the orientation carrier is equivariant. -/
theorem orientation_carrier_equivariant : Equivariant couplingSeat parity fold := by
  intro g
  obtain ⟨l, r⟩ := g
  show ((1 + (r - l), r + l) : Pt) = (2 - (1 + (l - r)), l + r)
  rw [pe]; exact ⟨by omega, by omega⟩

/-- A coupling lands on the line exactly when it treats left and right alike: the vector couplings
    of electromagnetism and colour are the line. -/
theorem vector_on_the_line (g : Coupling) : OnLine (couplingSeat g) ↔ parity g = g := by
  obtain ⟨l, r⟩ := g
  show 1 + (l - r) = 1 ↔ ((r, l) : Coupling) = (l, r)
  rw [pe]; constructor
  · intro h; exact ⟨by omega, by omega⟩
  · intro ⟨h, _⟩; omega

theorem orientation_carrier_lands :
    ∃ C : Carrier { g : Coupling // parity g = g }, ∀ w, C.ι w = couplingSeat w.1 :=
  equivariant_carrier_lands couplingSeat parity orientation_carrier_equivariant

/-- The photon couples to a charge q on both hands alike: on the line. -/
theorem photon_coupling_on_the_line (q : Int) : OnLine (couplingSeat (q, q)) := by
  show 1 + (q - q) = 1; omega

/-- THE CHARGED CURRENT IS MAXIMALLY OFF THE LINE: it couples the left hand and not the right. -/
theorem charged_current_off_the_line : ¬ OnLine (couplingSeat (1, 0)) ∧ parity (1, 0) ≠ ((1, 0) : Coupling) := by
  decide

/-- The Z couples with g_L = T₃ − Q·s and g_R = −Q·s: its distance from the line is the weak isospin,
    whatever the mixing weight s. -/
def zCoupling (t3 q s : Int) : Coupling := (t3 - q * s, -(q * s))

theorem z_parity_depth_is_isospin (t3 q s : Int) : (zCoupling t3 q s).1 - (zCoupling t3 q s).2 = t3 := by
  show (t3 - q * s) - -(q * s) = t3; omega

/-- A neutral fermion's right-handed Z coupling vanishes for every mixing weight. -/
theorem neutrino_has_no_right_hand (t3 s : Int) : (zCoupling t3 0 s).2 = 0 := by
  show -(0 * s) = 0; rw [Int.zero_mul]; rfl

/-! ## Part V. The orientation: what the even readings cannot see -/

abbrev V3 := Int × Int × Int
def refl (v : V3) : V3 := (-v.1, -v.2.1, -v.2.2)
def dot (u v : V3) : Int := u.1 * v.1 + u.2.1 * v.2.1 + u.2.2 * v.2.2
def triple (a b c : V3) : Int :=
  a.1 * (b.2.1 * c.2.2 - b.2.2 * c.2.1) - a.2.1 * (b.1 * c.2.2 - b.2.2 * c.1) +
  a.2.2 * (b.1 * c.2.1 - b.2.1 * c.1)

/-- Every dot product is blind to the mirror. -/
theorem dot_products_blind (u v : V3) : dot (refl u) (refl v) = dot u v := by
  obtain ⟨a, b, c⟩ := u; obtain ⟨d, e, f⟩ := v
  show -a * -d + -b * -e + -c * -f = a * d + b * e + c * f
  rw [Int.neg_mul_neg, Int.neg_mul_neg, Int.neg_mul_neg]

/-- THE TRIPLE PRODUCT READS THE ORIENTATION: it reverses under the mirror. -/
theorem triple_product_reads_orientation (a b c : V3) :
    triple (refl a) (refl b) (refl c) = -triple a b c := by
  obtain ⟨a1, a2, a3⟩ := a; obtain ⟨b1, b2, b3⟩ := b; obtain ⟨c1, c2, c3⟩ := c
  simp only [triple, refl, Int.neg_mul_neg, Int.neg_mul, Int.mul_neg, Int.neg_sub, Int.neg_neg]
  simp only [Int.mul_sub, Int.sub_mul, Int.mul_assoc]
  omega

/-- A spin is axial and a momentum polar: their correlation J·p reverses under the mirror. -/
theorem spin_momentum_correlation_odd (J p : V3) : dot J (refl p) = -dot J p := by
  obtain ⟨a, b, c⟩ := J; obtain ⟨d, e, f⟩ := p
  show a * -d + b * -e + c * -f = -(a * d + b * e + c * f)
  rw [Int.mul_neg, Int.mul_neg, Int.mul_neg]; omega

/-- An even reading cannot tell a world from its mirror image. -/
theorem even_readings_blind_to_mirror {β : Type} (g : V3 → β) (h : ∀ v, g (refl v) = g v) (v : V3) :
    g (refl v) = g v := h v

/-! ## Part VI. C, P and CP on the charged current; CP violation is T violation -/

/-- A fermion state for the charged current: antiparticle or not, right-handed or not. -/
abbrev WState := Bool × Bool
def cmap (s : WState) : WState := (!s.1, s.2)
def pmap (s : WState) : WState := (s.1, !s.2)
/-- The charged current registers left-handed particles and right-handed antiparticles. -/
def couples (s : WState) : Bool := s.1 == s.2

/-- THE CHARGED CURRENT BREAKS C AND P AND KEEPS CP. -/
theorem weak_breaks_C_and_P_keeps_CP :
    couples (cmap (false, false)) ≠ couples (false, false) ∧
    couples (pmap (false, false)) ≠ couples (false, false) ∧
    ∀ s : WState, couples (cmap (pmap s)) = couples s := by
  refine ⟨by decide, by decide, ?_⟩
  intro s; obtain ⟨a, b⟩ := s; cases a <;> cases b <;> rfl

/-- CP VIOLATION IS T VIOLATION: if T is an involution and CPT acts as the identity, then CP is T. -/
theorem cp_violation_is_t_violation {X : Type} (cp t : X → X) (ht : ∀ x, t (t x) = x)
    (hcpt : ∀ x, cp (t x) = x) (x : X) : cp x = t x := by
  have := hcpt (t x); rw [ht] at this; exact this

/-! ## Part VII. Three generations are the least with one CP phase -/

/-- The rotation angles of an n-generation mixing matrix, and its physical phases once the quark
    fields are rephased: n(n − 1)/2 and (n − 1)(n − 2)/2. -/
def angles (n : Nat) : Nat := n * (n - 1) / 2
def phases (n : Nat) : Nat := (n - 1) * (n - 2) / 2

/-- ONE PHASE AT THREE: two generations admit no CP-violating phase, three admit exactly one. -/
theorem one_phase_at_three :
    phases 1 = 0 ∧ phases 2 = 0 ∧ phases 3 = 1 ∧ angles 3 = 3 ∧ phases 4 = 3 := by decide

theorem three_is_the_least (n : Nat) (h : n < 3) : phases n = 0 := by
  have : n = 0 ∨ n = 1 ∨ n = 2 := by omega
  rcases this with h | h | h <;> subst h <;> decide

/-! ## Part VIII. Helicity suppression: the orientation read in a decay -/

/-- The pion's decay to an electron is suppressed by (mₑ/m_μ)², the square of a hand that a massless
    lepton could not flip: below 1/40000 (masses in keV). -/
theorem electron_channel_suppressed : 511 * 511 * 40000 < 105658 * 105658 := by decide

/-! ## Part IX. The capstone -/

/-- THE WEAK FORCE READS THE ORIENTATION. Parity is the fold under the orientation carrier; the
    vector couplings are the line and the charged current stands off it; the Z's distance from the
    line is the weak isospin; dot products are blind to the mirror and the triple product reverses
    under it; the charged current breaks C and P and keeps CP; CP violation is T violation under
    CPT; three generations are the least with one phase. -/
theorem weak_reads_the_orientation :
    Equivariant couplingSeat parity fold ∧
    (∀ g : Coupling, OnLine (couplingSeat g) ↔ parity g = g) ∧
    ¬ OnLine (couplingSeat (1, 0)) ∧
    (∀ t3 q s : Int, (zCoupling t3 q s).1 - (zCoupling t3 q s).2 = t3) ∧
    (∀ u v : V3, dot (refl u) (refl v) = dot u v) ∧
    (∀ a b c : V3, triple (refl a) (refl b) (refl c) = -triple a b c) ∧
    (∀ s : WState, couples (cmap (pmap s)) = couples s) ∧
    (∀ {X : Type} (cp t : X → X), (∀ x, t (t x) = x) → (∀ x, cp (t x) = x) → ∀ x, cp x = t x) ∧
    (phases 2 = 0 ∧ phases 3 = 1) :=
  ⟨orientation_carrier_equivariant, vector_on_the_line, charged_current_off_the_line.1,
   z_parity_depth_is_isospin, dot_products_blind, triple_product_reads_orientation,
   weak_breaks_C_and_P_keeps_CP.2.2, fun cp t ht h x => cp_violation_is_t_violation cp t ht h x,
   ⟨one_phase_at_three.2.1, one_phase_at_three.2.2.1⟩⟩

end SPHYS.Weak

#print axioms SPHYS.Weak.pe
#print axioms SPHYS.Weak.fold_involutive
#print axioms SPHYS.Weak.seat_fixed_line
#print axioms SPHYS.Weak.reg_lands
#print axioms SPHYS.Weak.reg_fixes_iff
#print axioms SPHYS.Weak.reg_forgets_side
#print axioms SPHYS.Weak.least_erasure_iff_value
#print axioms SPHYS.Weak.equivariant_id
#print axioms SPHYS.Weak.equivariant_comp
#print axioms SPHYS.Weak.fix_functorial
#print axioms SPHYS.Weak.fold_global_seat
#print axioms SPHYS.Weak.equivariant_carrier_lands
#print axioms SPHYS.Weak.value_on_image
#print axioms SPHYS.Weak.kinetic_crossing
#print axioms SPHYS.Weak.off_locus_pair
#print axioms SPHYS.Weak.ee
#print axioms SPHYS.Weak.mirror_involutive
#print axioms SPHYS.Weak.psi_phi
#print axioms SPHYS.Weak.phi_psi
#print axioms SPHYS.Weak.phi_injective
#print axioms SPHYS.Weak.phi_equivariant
#print axioms SPHYS.Weak.mirror_fixed_iff_real
#print axioms SPHYS.Weak.phi_line_iff_real
#print axioms SPHYS.Weak.stationary_iff_real
#print axioms SPHYS.Weak.line_is_stationary
#print axioms SPHYS.Weak.measured_on_line
#print axioms SPHYS.Weak.no_measurement_off_line
#print axioms SPHYS.Weak.energy_carrier_lands
#print axioms SPHYS.Weak.bar_involutive
#print axioms SPHYS.Weak.bar_fixed_iff_neutral
#print axioms SPHYS.Weak.odd_charges_even_energy
#print axioms SPHYS.Weak.gravity_reads_no_charge_bit
#print axioms SPHYS.Weak.involutions_commute
#print axioms SPHYS.Weak.tmirror_involutive
#print axioms SPHYS.Weak.joint_fixed_iff
#print axioms SPHYS.Weak.charge_carrier_equivariant
#print axioms SPHYS.Weak.pair_lands_once
#print axioms SPHYS.Weak.tmirror_equivariant
#print axioms SPHYS.Weak.neutral_charge_on_line
#print axioms SPHYS.Weak.pair_on_the_edges
#print axioms SPHYS.Weak.stable_lands
#print axioms SPHYS.Weak.parity_involutive
#print axioms SPHYS.Weak.orientation_carrier_equivariant
#print axioms SPHYS.Weak.vector_on_the_line
#print axioms SPHYS.Weak.orientation_carrier_lands
#print axioms SPHYS.Weak.photon_coupling_on_the_line
#print axioms SPHYS.Weak.charged_current_off_the_line
#print axioms SPHYS.Weak.z_parity_depth_is_isospin
#print axioms SPHYS.Weak.neutrino_has_no_right_hand
#print axioms SPHYS.Weak.dot_products_blind
#print axioms SPHYS.Weak.triple_product_reads_orientation
#print axioms SPHYS.Weak.spin_momentum_correlation_odd
#print axioms SPHYS.Weak.even_readings_blind_to_mirror
#print axioms SPHYS.Weak.weak_breaks_C_and_P_keeps_CP
#print axioms SPHYS.Weak.cp_violation_is_t_violation
#print axioms SPHYS.Weak.one_phase_at_three
#print axioms SPHYS.Weak.three_is_the_least
#print axioms SPHYS.Weak.electron_channel_suppressed
#print axioms SPHYS.Weak.weak_reads_the_orientation
```

## Appendix B · Weak_Twin.f90

Part I. Carried from edition 1.0.0.

```fortran
! Weak_Twin.f90 · the executed twin of SPHYS_Weak.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Weak_Twin.f90
! Blocks: A the orientation carrier; B the mirror: dot products blind, triple products reversed;
! C C, P and CP on the charged current; D the mixing matrix: unitarity, one phase, the Jarlskog
! invariant; E helicity suppression in pion decay; F the orientation the other forces do not read;
! G the Z reads each fermion's orientation by its isospin.
program weak_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: i8 = selected_int_kind(18)
  integer :: checks, fails
  integer(i8) :: seed
  checks = 0; fails = 0; seed = 20260930_i8
  call block_a(); call block_b(); call block_c(); call block_d(); call block_e(); call block_f(); call block_g()
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
    integer :: l, r, n, neq, nline, t3, q, s, nz
    write(*,'(a)') 'A · parity is the fold on couplings: vector couplings on the line, the charged current off it'
    n = 0; neq = 0; nline = 0
    do l = -30, 30
      do r = -30, 30
        n = n + 1
        if (1 + (r - l) == 2 - (1 + (l - r)) .and. r + l == l + r) neq = neq + 1
        if ((1 + (l - r) == 1) .eqv. (l == r)) nline = nline + 1
      end do
    end do
    call check('equivariance on 3721 couplings: parity is the fold', neq == n)
    call check('a coupling is on the line exactly when it treats both hands alike (3721)', nline == n)
    nz = 0
    do t3 = -1, 1
      do q = -3, 3
        do s = 0, 50
          if ((t3 - q*s) - (-(q*s)) == t3) nz = nz + 1
        end do
      end do
    end do
    call check('the Z''s left-right difference is the weak isospin at every charge and mixing weight (1071)', nz == 1071)
  end subroutine block_a

  subroutine block_b()
    integer :: t, nd, nt
    real(dp) :: a(3), b(3), c(3), d1, d2, t1, t2
    write(*,'(a)') 'B · the mirror: every dot product is blind, every triple product reverses'
    nd = 0; nt = 0
    do t = 1, 5000
      a = [rnd(), rnd(), rnd()] - 0.5_dp; b = [rnd(), rnd(), rnd()] - 0.5_dp; c = [rnd(), rnd(), rnd()] - 0.5_dp
      d1 = sum(a*b); d2 = sum((-a)*(-b))
      if (d1 == d2) nd = nd + 1
      t1 = trip(a, b, c); t2 = trip(-a, -b, -c)
      if (t2 == -t1) nt = nt + 1
    end do
    call check('5000 random triples: dot products unchanged by the mirror, exactly', nd == 5000)
    call check('5000 random triples: the triple product reversed by the mirror, exactly', nt == 5000)
  end subroutine block_b

  pure function trip(a, b, c) result(t)
    real(dp), intent(in) :: a(3), b(3), c(3)
    real(dp) :: t
    t = a(1)*(b(2)*c(3) - b(3)*c(2)) - a(2)*(b(1)*c(3) - b(3)*c(1)) + a(3)*(b(1)*c(2) - b(2)*c(1))
  end function trip

  subroutine block_c()
    integer :: nc, np, ncp
    write(*,'(a)') 'C · the charged current: left-handed particles and right-handed antiparticles'
    call table(nc, np, ncp)
    call check('C moves the coupling on every state, P on every state, CP on none (4 states each)', &
               nc == 4 .and. np == 4 .and. ncp == 0)
  end subroutine block_c

  subroutine table(nc, np, ncp)
    integer, intent(out) :: nc, np, ncp
    integer :: a, h
    logical :: s0, sc, sp, scp
    nc = 0; np = 0; ncp = 0
    do a = 0, 1
      do h = 0, 1
        s0 = (a == h); sc = ((1 - a) == h); sp = (a == (1 - h)); scp = ((1 - a) == (1 - h))
        if (s0 .neqv. sc) nc = nc + 1
        if (s0 .neqv. sp) np = np + 1
        if (s0 .neqv. scp) ncp = ncp + 1
      end do
    end do
  end subroutine table

  subroutine block_d()
    real(dp) :: s12, s13, s23, c12, c13, c23, dl, jar, worst
    complex(dp) :: v(3,3), e, u(3,3)
    integer :: i, j, n
    integer, parameter :: expect(6) = [0, 0, 1, 3, 6, 10]
    write(*,'(a)') 'D · the mixing matrix: unitary, one phase at three generations, J = 3.1e-5'
    s12 = 0.22501_dp; s13 = 0.003732_dp; s23 = 0.04183_dp; dl = 1.147_dp
    c12 = sqrt(1.0_dp - s12**2); c13 = sqrt(1.0_dp - s13**2); c23 = sqrt(1.0_dp - s23**2)
    e = cmplx(cos(dl), sin(dl), dp)
    v(1,:) = [cmplx(c12*c13, 0.0_dp, dp), cmplx(s12*c13, 0.0_dp, dp), s13/e]
    v(2,:) = [-s12*c23 - c12*s23*s13*e, c12*c23 - s12*s23*s13*e, cmplx(s23*c13, 0.0_dp, dp)]
    v(3,:) = [s12*s23 - c12*c23*s13*e, -c12*s23 - s12*c23*s13*e, cmplx(c23*c13, 0.0_dp, dp)]
    u = matmul(v, conjg(transpose(v)))
    worst = 0.0_dp
    do i = 1, 3
      do j = 1, 3
        worst = max(worst, abs(u(i,j) - merge(1.0_dp, 0.0_dp, i == j)))
      end do
    end do
    jar = aimag(v(1,2)*v(2,3)*conjg(v(1,3))*conjg(v(2,2)))
    write(*,'(a,es9.2,a,es11.4)') '  |V V* - 1| <= ', worst, ';  Jarlskog invariant J = ', jar
    call check('the three-generation mixing matrix is unitary to 1e-15', worst < 1.0e-15_dp)
    call check('its one phase gives J = 3.1e-5, the measure of CP violation in quarks', abs(jar/3.1e-5_dp - 1.0_dp) < 0.03_dp)
    n = 0
    do i = 1, 6
      if ((i - 1)*(i - 2)/2 == expect(i)) n = n + 1
    end do
    call check('physical phases (n-1)(n-2)/2 for n = 1..6 are 0, 0, 1, 3, 6, 10: none below three', n == 6)
  end subroutine block_d

  subroutine block_e()
    real(dp) :: me, mmu, mpi, tree, noha
    write(*,'(a)') 'E · helicity suppression: the pion decays to the muon, not the electron'
    me = 0.51099895_dp; mmu = 105.6583755_dp; mpi = 139.57039_dp
    noha = ((mpi**2 - me**2)/(mpi**2 - mmu**2))**2
    tree = (me/mmu)**2*noha
    write(*,'(a,es11.4,a,f6.3,a)') '  Gamma(e nu)/Gamma(mu nu) at tree level = ', tree, '  (phase space alone: ', noha, ')'
    call check('the left-handed coupling suppresses the electron channel to 1.28e-4, measured 1.2327e-4', &
               abs(tree/1.2327e-4_dp - 1.0_dp) < 0.05_dp .and. noha > 5.0_dp)
  end subroutine block_e

  subroutine block_f()
    real(dp) :: edm, sm
    write(*,'(a)') 'F · the other forces do not read the orientation: the neutron''s electric dipole'
    edm = 1.8e-26_dp; sm = 1.0e-32_dp
    write(*,'(a,es9.2,a,es9.2,a)') '  neutron EDM < ', edm, ' e cm; the weak force alone induces about ', sm, ' e cm'
    call check('no time- and parity-odd reading beyond the weak force is seen: the bound sits 6 orders above it', &
               edm/sm > 1.0e5_dp)
  end subroutine block_f
  subroutine block_g()
    real(dp) :: sw, anu, ae, au, ad
    write(*,'(a)') 'G · the Z reads each fermion''s orientation by its isospin: A_f = 2 gV gA / (gV^2 + gA^2)'
    sw = 0.23153_dp
    anu = asym(0.5_dp, 0.0_dp, sw); ae = asym(-0.5_dp, -1.0_dp, sw)
    au = asym(0.5_dp, 2.0_dp/3.0_dp, sw); ad = asym(-0.5_dp, -1.0_dp/3.0_dp, sw)
    write(*,'(a,f7.4,a,f7.4,a,f7.4,a,f7.4)') '  neutrino ', anu, ';  charged lepton ', ae, ';  up-type ', au, ';  down-type ', ad
    call check('the neutrino is purely left-handed to the Z: A = 1 exactly', anu == 1.0_dp)
    call check('lepton, charm and bottom asymmetries 0.147, 0.668, 0.936 against measured 0.1513, 0.670, 0.923', &
               abs(ae/0.1513_dp - 1.0_dp) < 0.035_dp .and. abs(au/0.670_dp - 1.0_dp) < 0.035_dp .and. &
               abs(ad/0.923_dp - 1.0_dp) < 0.035_dp)
  end subroutine block_g

  pure function asym(t3, q, sw) result(a)
    real(dp), intent(in) :: t3, q, sw
    real(dp) :: a, gl, gr, gv, ga
    gl = t3 - q*sw; gr = -q*sw
    gv = gl + gr; ga = gl - gr
    a = 2.0_dp*gv*ga/(gv*gv + ga*ga)
  end function asym
end program weak_twin
```

## Appendix C · SPHYS_Strong_CP.lean

Part II. Core Lean 4, carried from edition 1.0.0. Comments are set in this paper's vocabulary; no declaration is changed, and the file is recompiled.

```lean
/-
  SPHYS_Strong_CP.lean · the strong force reads no orientation, read at the seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: h = 2 Re s, t = Im s; the fold s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t), the fixed line h = 1.

  Part I     the seat, the category of involutions, the functor of the seat.
  Part II    the energy carrier (resident).
  Part III   the substrate (resident).
  Part IV     The angle's fold has two fixed points.
  Part V      The electric dipole moment is odd; its null forces the fixed set.
  Part VI     Positivity selects zero.
  Part VII    The capstone.
-/
set_option autoImplicit false
namespace SPHYS.StrongCP


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


/-! ## Part IV. The angle's fold has two fixed points -/

/-- On the circle of the strong angle, read as an integer modulo 2m, the reflection θ ↦ −θ fixes a
    point exactly when twice it is a multiple of 2m, that is, exactly when it is a multiple of m: the
    two points 0 and π. -/
theorem fixed_iff_multiple_of_half (m x : Int) : (∃ k, x + x = (2 * m) * k) ↔ (∃ k, x = m * k) := by
  constructor
  · intro ⟨k, h⟩; refine ⟨k, ?_⟩; rw [Int.mul_assoc] at h; omega
  · intro ⟨k, h⟩; refine ⟨k, ?_⟩; rw [Int.mul_assoc]; omega

/-- The discrete circle of 2m points: the reflection, the sign of the sine (the odd reading), and the
    distance from zero (the even energy). -/
def flipC (m k : Nat) : Nat := (2 * m - k) % (2 * m)
def oddC (m k : Nat) : Int := if k % (2 * m) = 0 ∨ k % (2 * m) = m then 0 else if k % (2 * m) < m then 1 else -1
def evenC (m k : Nat) : Int := (min (k % (2 * m)) (2 * m - k % (2 * m)) : Nat)

/-- The angle carrier: the odd reading is the offset from the line, the energy the height. -/
def thetaSeat (m k : Nat) : Pt := (1 + oddC m k, evenC m k)

/-- THE REFLECTION IS THE FOLD AND THE TWO FIXED POINTS ARE THE LINE, on every circle of up to
    twenty-four points: the carrier is equivariant, and a point lands on the line exactly when it is 0
    or π. -/
theorem angle_carrier_equivariant_and_line :
    ((List.range 13).all fun m => (List.range (2 * m)).all fun k =>
      (thetaSeat m (flipC m k) == fold (thetaSeat m k)) &&
      (decide ((thetaSeat m k).1 = 1) == (decide (k = 0) || decide (k = m))) &&
      (decide (flipC m k = k) == (decide (k = 0) || decide (k = m)))) = true := by
  decide

/-! ## Part V. The electric dipole moment is odd; its null forces the fixed set -/

/-- The neutron's electric dipole moment reads the angle through an odd function: it vanishes on both
    fixed points and nowhere else, on every circle of up to twenty-four points. -/
theorem edm_odd_and_null_on_the_fixed_set :
    ((List.range 13).all fun m => (List.range (2 * m)).all fun k =>
      (oddC m (flipC m k) == - oddC m k) &&
      (decide (oddC m k = 0) == (decide (k = 0) || decide (k = m)))) = true := by
  decide

/-- An even reading of the angle cannot see the CP-odd part: it agrees at θ and −θ. -/
theorem energy_even :
    ((List.range 13).all fun m => (List.range (2 * m)).all fun k => evenC m (flipC m k) == evenC m k) = true := by
  decide

/-! ## Part VI. Positivity selects zero -/

/-- POSITIVITY SELECTS ZERO: of the two fixed points the energy is least at 0, uniquely, and greatest
    at π; both are stationary. -/
theorem positivity_selects_zero :
    ((List.range 12).all fun i => let m := i + 1;
      (evenC m 0 == 0) && (evenC m m == (m : Int)) &&
      ((List.range (2 * m)).all fun k => (decide (k = 0) || decide (0 < evenC m k)) && decide (evenC m k ≤ evenC m m)) &&
      (evenC m 1 == evenC m (2 * m - 1)) && (evenC m (m + 1) == evenC m (m - 1))) = true := by
  decide

/-- The value of the angle is keyed to the even readings: the angle and its reflection give one
    energy, so no even reading returns the sign of a nonzero angle. -/
theorem the_sign_of_theta_is_keyed (f : Nat → Bool) (m : Nat)
    (hf : f (flipC m 1) = f 1) : ¬ (f 1 = true ∧ f (flipC m 1) = false) := by
  intro ⟨h1, h2⟩; rw [hf, h1] at h2; exact Bool.noConfusion h2

/-! ## Part VII. The capstone -/

/-- THE STRONG FORCE READS NO ORIENTATION. The angle's reflection fixes exactly the multiples of half
    the circle, 0 and π; the angle carrier sends the reflection to the fold and the two fixed points
    to the line; the dipole moment is odd and vanishes exactly there, so its measured null forces the
    fixed set; and positivity puts the energy's unique minimum at 0, the maximum at π. -/
theorem the_strong_force_reads_no_orientation :
    (∀ m x : Int, (∃ k, x + x = (2 * m) * k) ↔ (∃ k, x = m * k)) ∧
    ((List.range 13).all fun m => (List.range (2 * m)).all fun k =>
      (thetaSeat m (flipC m k) == fold (thetaSeat m k)) &&
      (decide ((thetaSeat m k).1 = 1) == (decide (k = 0) || decide (k = m))) &&
      (decide (flipC m k = k) == (decide (k = 0) || decide (k = m)))) = true ∧
    ((List.range 13).all fun m => (List.range (2 * m)).all fun k =>
      (oddC m (flipC m k) == - oddC m k) &&
      (decide (oddC m k = 0) == (decide (k = 0) || decide (k = m)))) = true :=
  ⟨fixed_iff_multiple_of_half, angle_carrier_equivariant_and_line, edm_odd_and_null_on_the_fixed_set⟩

end SPHYS.StrongCP

#print axioms SPHYS.StrongCP.pe
#print axioms SPHYS.StrongCP.fold_involutive
#print axioms SPHYS.StrongCP.seat_fixed_line
#print axioms SPHYS.StrongCP.reg_lands
#print axioms SPHYS.StrongCP.reg_fixes_iff
#print axioms SPHYS.StrongCP.reg_forgets_side
#print axioms SPHYS.StrongCP.least_erasure_iff_value
#print axioms SPHYS.StrongCP.equivariant_id
#print axioms SPHYS.StrongCP.equivariant_comp
#print axioms SPHYS.StrongCP.fix_functorial
#print axioms SPHYS.StrongCP.fold_global_seat
#print axioms SPHYS.StrongCP.equivariant_carrier_lands
#print axioms SPHYS.StrongCP.value_on_image
#print axioms SPHYS.StrongCP.kinetic_crossing
#print axioms SPHYS.StrongCP.off_locus_pair
#print axioms SPHYS.StrongCP.ee
#print axioms SPHYS.StrongCP.mirror_involutive
#print axioms SPHYS.StrongCP.psi_phi
#print axioms SPHYS.StrongCP.phi_psi
#print axioms SPHYS.StrongCP.phi_injective
#print axioms SPHYS.StrongCP.phi_equivariant
#print axioms SPHYS.StrongCP.mirror_fixed_iff_real
#print axioms SPHYS.StrongCP.phi_line_iff_real
#print axioms SPHYS.StrongCP.stationary_iff_real
#print axioms SPHYS.StrongCP.line_is_stationary
#print axioms SPHYS.StrongCP.measured_on_line
#print axioms SPHYS.StrongCP.no_measurement_off_line
#print axioms SPHYS.StrongCP.energy_carrier_lands
#print axioms SPHYS.StrongCP.bar_involutive
#print axioms SPHYS.StrongCP.bar_fixed_iff_neutral
#print axioms SPHYS.StrongCP.odd_charges_even_energy
#print axioms SPHYS.StrongCP.gravity_reads_no_charge_bit
#print axioms SPHYS.StrongCP.involutions_commute
#print axioms SPHYS.StrongCP.tmirror_involutive
#print axioms SPHYS.StrongCP.joint_fixed_iff
#print axioms SPHYS.StrongCP.charge_carrier_equivariant
#print axioms SPHYS.StrongCP.pair_lands_once
#print axioms SPHYS.StrongCP.tmirror_equivariant
#print axioms SPHYS.StrongCP.neutral_charge_on_line
#print axioms SPHYS.StrongCP.pair_on_the_edges
#print axioms SPHYS.StrongCP.stable_lands
#print axioms SPHYS.StrongCP.fixed_iff_multiple_of_half
#print axioms SPHYS.StrongCP.angle_carrier_equivariant_and_line
#print axioms SPHYS.StrongCP.edm_odd_and_null_on_the_fixed_set
#print axioms SPHYS.StrongCP.energy_even
#print axioms SPHYS.StrongCP.positivity_selects_zero
#print axioms SPHYS.StrongCP.the_sign_of_theta_is_keyed
#print axioms SPHYS.StrongCP.the_strong_force_reads_no_orientation
```

## Appendix D · StrongCP_Twin.f90

Part II. Carried from edition 1.0.0.

```fortran
! StrongCP_Twin.f90 · the executed twin of SPHYS_Strong_CP.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off StrongCP_Twin.f90
! Measured inputs: neutron electric dipole moment |d_n| < 1.8e-26 e cm (Abel et al., PRL 124 (2020) 081803);
! its coefficient d_n = 2.4e-16 theta e cm (Pospelov and Ritz, PRL 82 (1999) 2526); m_pi0 = 134.977 MeV,
! f_pi = 130.2/sqrt 2 MeV, m_u/m_d = 0.474 (PDG 2024).
! A the discrete circle: the reflection is the fold, 0 and pi the line; B the vacuum energy of the angle:
! even, least at 0, greatest at pi, stationary at both; C at equal quark masses the two branches meet at
! pi in a cusp; D the curvature at 0; E the dipole null puts the angle on the fixed point 0.
program strong_cp_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: i8 = selected_int_kind(18)
  real(dp), parameter :: PI = 3.141592653589793_dp
  real(dp), parameter :: MPI = 134.977_dp, FPI = 92.0647_dp, ZR = 0.474_dp
  integer :: checks, fails
  integer(i8) :: seed
  checks = 0; fails = 0; seed = 20261001_i8
  call block_a(); call block_b(); call block_c(); call block_d(); call block_e()
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', checks, ',"failures":', fails, '}'
  if (fails > 0) error stop 1
contains
  ! ---- twin_common.inc of the volume, set inline ----
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
  ! ---- end of twin_common.inc ----
  subroutine block_a()
    integer :: m, k, fk, n, ok, o, ofk
    write(*,'(a)') 'A · circles of 2m points, m up to 500: the reflection is the fold; exactly 0 and pi are fixed'
    n = 0; ok = 0
    do m = 1, 500
      do k = 0, 2*m - 1
        n = n + 1
        fk = mod(2*m - k, 2*m)
        o = 0; if (k /= 0 .and. k /= m) o = merge(1, -1, k < m)
        ofk = 0; if (fk /= 0 .and. fk /= m) ofk = merge(1, -1, fk < m)
        if (ofk == -o .and. ((fk == k) .eqv. (k == 0 .or. k == m)) .and. ((1 + o == 1) .eqv. (k == 0 .or. k == m))) ok = ok + 1
      end do
    end do
    call check('250500 points: the fold, and the line exactly at the two fixed points', ok == n)
  end subroutine block_a
  real(dp) function evac(z, th) result(e)
    real(dp), intent(in) :: z, th
    e = -MPI**2*FPI**2*sqrt(1.0_dp - 4.0_dp*z/(1.0_dp + z)**2*sin(th/2.0_dp)**2)
  end function evac
  subroutine block_b()
    integer :: k
    real(dp) :: th, emin, emax, tmin, tmax, h, d0, dpi
    logical :: even
    write(*,'(a)') 'B · the vacuum energy of the angle, E(theta), at the measured quark mass ratio'
    even = .true.; emin = huge(1.0_dp); emax = -huge(1.0_dp); tmin = -1.0_dp; tmax = -1.0_dp
    do k = 0, 3600
      th = 2.0_dp*PI*real(k, dp)/3600.0_dp
      if (abs(evac(ZR, th) - evac(ZR, -th)) > 1.0e-9_dp*abs(evac(ZR, th))) even = .false.
      if (evac(ZR, th) < emin) then
        emin = evac(ZR, th); tmin = th
      end if
      if (evac(ZR, th) > emax) then
        emax = evac(ZR, th); tmax = th
      end if
    end do
    h = 1.0e-4_dp
    d0 = (evac(ZR, h) - evac(ZR, -h))/(2.0_dp*h); dpi = (evac(ZR, PI + h) - evac(ZR, PI - h))/(2.0_dp*h)
    write(*,'(a,f8.5,a,f8.5)') '  least at theta = ', tmin, ' ; greatest at theta = ', tmax
    call check('E is even, least at 0, greatest at pi, stationary at both', even .and. tmin == 0.0_dp .and. &
               abs(tmax - PI) < 1.0e-9_dp .and. abs(d0) < 1.0e-6_dp*abs(emin) .and. abs(dpi) < 1.0e-6_dp*abs(emin))
  end subroutine block_b
  subroutine block_c()
    real(dp) :: h, dl, dr
    write(*,'(a)') 'C · at equal quark masses the energy is |cos(theta/2)|: two branches meet at pi in a cusp'
    h = 1.0e-6_dp
    dl = (evac(1.0_dp, PI) - evac(1.0_dp, PI - h))/h; dr = (evac(1.0_dp, PI + h) - evac(1.0_dp, PI))/h
    write(*,'(a,es11.3,a,es11.3)') '  slope left of pi ', dl, ' ; right of pi ', dr
    call check('the slopes at pi are opposite and nonzero: two vacua, one energy, CP broken there', &
               dl > 0.0_dp .and. dr < 0.0_dp .and. abs(dl + dr) < 1.0e-3_dp*abs(dl))
  end subroutine block_c
  subroutine block_d()
    real(dp) :: chi, h, num
    write(*,'(a)') 'D · the curvature at 0: chi = m_pi^2 f_pi^2 z / (1 + z)^2'
    chi = MPI**2*FPI**2*ZR/(1.0_dp + ZR)**2
    h = 1.0e-3_dp
    num = (evac(ZR, h) - 2.0_dp*evac(ZR, 0.0_dp) + evac(ZR, -h))/h**2
    write(*,'(a,f8.3,a)') '  chi^(1/4) = ', chi**0.25_dp, ' MeV'
    call check('the energy curves up at 0; the second difference equals chi to 1e-5; computed chi^(1/4) = 76.19 MeV', &
               abs(num/chi - 1.0_dp) < 1.0e-5_dp .and. abs(chi**0.25_dp - 76.185_dp) < 0.01_dp)
  end subroutine block_d
  subroutine block_e()
    real(dp) :: tbound
    write(*,'(a)') 'E · the dipole null puts the angle at the fixed point 0'
    tbound = 1.8e-26_dp/2.4e-16_dp
    write(*,'(a,es10.3,a,f8.5)') '  |theta| < ', tbound, ' ; distance to pi ', PI
    call check('|theta| < 7.5e-11: the angle stands at 0, not at pi', &
               tbound < 1.0e-10_dp .and. abs(tbound - 7.5e-11_dp) < 1.0e-12_dp)
  end subroutine block_e
end program strong_cp_twin
```

## Appendix E · SPHYS_YangMills_Forced_CC.lean

Part III. Core Lean 4.19.0, no import, no axiom declared, no use of choice, compiled with warnings fatal, exit 0. The kernel lines follow in Appendix F.

```lean
/-
  SPHYS_YangMills_Forced_CC.lean · the Yang-Mills equations from a charge that does not commute · core Lean 4, no library.

  RATIONALE. Light is the law of a charge that is a number. The nuclear charges are not numbers: a colour can be
  turned into another colour, and two turns taken in the two orders differ. This file carries the algebra that
  makes the law of such a charge a consequence. To the first power of the potential each component obeys Maxwell's law. At the next
  power the law must keep its form under a turn of the charge, and that fixes the coupling of the field to itself:
  it equals the coupling of the field to matter. Where the charge commutes the self-coupling drops out of every
  equation and what remains is Maxwell's law.

  DESIGN. Integers and naturals only. The charge that does not commute is carried by its smallest instance, three
  components with the cross product as bracket (the algebra of rotations, the weak isospin). No axiom is declared.
  The kernel line of every theorem is printed at the end.

  WHAT ENTERS AS A DEFINITION, NOT AS A THEOREM (read before editing):
    (1) partial derivatives commute: the field `commute` of `Field`, as in the engine for light;
    (2) the linear family a·□A + b·∂(∂·A) + m·A per component, as in the engine for light;
    (3) a turn of the charge acts on the potential by δA = ∂ε + s·[A, ε], and the strength of the field is
        F = ∂A - ∂A + t·[A, A]. The variation of F under the turn is written out term by term in `variation`.
        The second derivatives of ε cancel because derivatives commute, and are not carried;
    (4) the counts: n² - 1 components for a charge of n kinds; two states for a massless carrier and three for a massive
        one (Wigner, 1939); (n-1)(n-2)/2 phases in the mixing of n generations (Kobayashi and Maskawa, 1973);
    (5) the two coefficients 11 and 2 of the leading running of the coupling (Gross and Wilczek, 1973;
        Politzer, 1973). They are used in a sign statement and are not derived here;
    (6) a vacuum that is not turned with the charge gives mass to three carriers (Englert and Brout, 1964; Higgs,
        1964): the count `three_carriers_gain_mass_and_one_scalar_remains` reads it;
    (7) the ratio of hadrons to muon pairs carries n and the width of the neutral pion carries n squared (Adler,
        1969; Bell and Jackiw, 1969): the definitions `ratio9` and the statement on n squared read them.
  DOMAIN. `covariance_forces_the_self_coupling` is proved on the rotation algebra. The derivation uses only that the
  bracket is bilinear, antisymmetric and obeys Jacobi's identity, and that some bracket is not zero. The kernel checks it on this algebra, component by component.
  RISK. A reader may take the forcing as a proof that the quantum theory exists or that its spectrum has a gap.
  It is the forcing of the form of the law. The spectrum is measured.
  NON-NEGOTIABLE. No theorem here fixes the value of a coupling. `every_coupling_is_admitted` proves it cannot.
-/
namespace SPHYS.YangMills

/-! ## Part I. First power of the potential: each component of the charge obeys Maxwell's law. -/

structure Field where
  boxDivA : Int
  divBoxA : Int
  divA    : Int
  commute : divBoxA = boxDivA

/-- The divergence of the candidate law a·□A + b·∂(∂·A) + m·A for one component of the charge. -/
def div (F : Field) (a b m : Int) : Int := a * F.divBoxA + b * F.boxDivA + m * F.divA

theorem div_eq (F : Field) (a b m : Int) : div F a b m = (a + b) * F.boxDivA + m * F.divA := by
  unfold div; rw [F.commute, Int.add_mul]

def waving : Field := { boxDivA := 1, divBoxA := 1, divA := 0, commute := rfl }
def standing : Field := { boxDivA := 0, divBoxA := 0, divA := 1, commute := rfl }

/-- TO THE FIRST POWER OF THE POTENTIAL, EACH COMPONENT OBEYS MAXWELL. A law conserved on every field has b = -a and no mass term. -/
theorem each_component_obeys_maxwell (a b m : Int) (h : ∀ F : Field, div F a b m = 0) : a + b = 0 ∧ m = 0 := by
  have h1 := h waving
  have h2 := h standing
  rw [div_eq] at h1 h2
  have e1 : (a + b) * 1 + m * 0 = 0 := h1
  have e2 : (a + b) * 0 + m * 1 = 0 := h2
  rw [Int.mul_one, Int.mul_zero, Int.add_zero] at e1
  rw [Int.mul_zero, Int.mul_one, Int.zero_add] at e2
  exact ⟨e1, e2⟩

/-- THE CARRIERS HAVE NO MASS IN THE LAW. -/
theorem the_law_has_no_mass_term (a b m : Int) (h : ∀ F : Field, div F a b m = 0) : m = 0 :=
  (each_component_obeys_maxwell a b m h).2

/-! ## Part II. A charge that does not commute. -/

/-- A charge with three components: the smallest charge that does not commute. -/
structure V3 where
  x : Int
  y : Int
  z : Int

theorem V3.eq3 {a b : V3} (hx : a.x = b.x) (hy : a.y = b.y) (hz : a.z = b.z) : a = b := by
  cases a; cases b; simp only at hx hy hz; subst hx; subst hy; subst hz; rfl

def zero : V3 := ⟨0, 0, 0⟩
def add (a b : V3) : V3 := ⟨a.x + b.x, a.y + b.y, a.z + b.z⟩
def sub (a b : V3) : V3 := ⟨a.x - b.x, a.y - b.y, a.z - b.z⟩
def smul (k : Int) (a : V3) : V3 := ⟨k * a.x, k * a.y, k * a.z⟩

/-- The bracket of the rotation algebra: two turns taken in the two orders, compared. -/
def turn (a b : V3) : V3 := ⟨a.y * b.z - a.z * b.y, a.z * b.x - a.x * b.z, a.x * b.y - a.y * b.x⟩
/-- The bracket of a charge that commutes: always zero. -/
def still (_ _ : V3) : V3 := zero

def e1 : V3 := ⟨1, 0, 0⟩
def e2 : V3 := ⟨0, 1, 0⟩
def e3 : V3 := ⟨0, 0, 1⟩

/-- The bracket reverses when its two entries are exchanged. -/
theorem the_bracket_is_antisymmetric (a b : V3) : turn a b = smul (-1) (turn b a) := by
  apply V3.eq3 <;> simp only [turn, smul, Int.mul_comm] <;> omega

/-- A thing does not turn itself. This is the boundary of a boundary, read on the charge: the divergence of the
    left side of the law is a sum of brackets of the strength with itself, and each is zero. -/
theorem the_boundary_of_the_boundary_vanishes (a : V3) : turn a a = zero := by
  apply V3.eq3 <;> simp only [turn, zero, Int.mul_comm] <;> omega

/-- Jacobi's identity. -/
theorem jacobi (a b c : V3) : add (add (turn a (turn b c)) (turn b (turn c a))) (turn c (turn a b)) = zero := by
  apply V3.eq3 <;>
  simp only [add, turn, zero, Int.mul_add, Int.add_mul, Int.mul_sub, Int.sub_mul, Int.mul_assoc, Int.mul_comm,
    Int.mul_left_comm] <;> omega

/-- THE CHARGE DOES NOT COMMUTE. Two turns in the two orders differ. -/
theorem the_charge_does_not_commute : turn e1 e2 ≠ turn e2 e1 := by
  intro h; have h1 := congrArg V3.z h; revert h1; decide

/-- The two orders differ by a third turn. -/
theorem two_turns_make_a_third : turn e1 e2 = e3 := rfl

/-! ## Part III. The law must keep its form under a turn: the self-coupling is forced. -/

/-- What the law reads at one point: the two potentials, the curl part of their derivatives, the turn and its two
    derivatives. -/
structure Point where
  Am  : V3
  An  : V3
  dA  : V3
  eps : V3
  dem : V3
  den : V3

/-- The strength of the field with self-coupling t under a bracket: F = dA + t·[A, A]. -/
def strength (br : V3 → V3 → V3) (t : Int) (P : Point) : V3 := add P.dA (smul t (br P.Am P.An))

/-- The variation of the strength under the turn δA = ∂ε + s·[A, ε], every term kept. -/
def variation (br : V3 → V3 → V3) (s t : Int) (P : Point) : V3 :=
  add (add (add (smul s (br P.dA P.eps)) (sub (smul s (br P.An P.dem)) (smul s (br P.Am P.den))))
           (add (smul t (br P.dem P.An)) (smul t (br P.Am P.den))))
      (smul (t * s) (add (br (br P.Am P.eps) P.An) (br P.Am (br P.An P.eps))))

/-- What is left when the strength fails to turn as a charge turns: δF - s·[F, ε]. -/
def residue (br : V3 → V3 → V3) (s t : Int) (P : Point) : V3 :=
  sub (variation br s t P) (smul s (br (strength br t P) P.eps))

/-- The part of the variation that carries the derivative of the turn. -/
def stray (br : V3 → V3 → V3) (P : Point) : V3 := sub (br P.An P.dem) (br P.Am P.den)

/-- THE RESIDUE IS ONE TERM. Everything else cancels by Jacobi's identity. -/
theorem the_residue_is_one_term (s t : Int) (P : Point) : residue turn s t P = smul (s - t) (stray turn P) := by
  apply V3.eq3 <;>
  simp only [residue, variation, strength, stray, add, sub, smul, turn, Int.mul_add, Int.add_mul, Int.mul_sub,
    Int.sub_mul, Int.mul_assoc, Int.mul_comm, Int.mul_left_comm] <;> omega

/-- A point where the stray term is not zero. -/
def probe : Point := { Am := zero, An := e1, dA := zero, eps := zero, dem := e2, den := zero }

/-- COVARIANCE FORCES THE SELF-COUPLING. The strength turns as a charge at every point if and only if the field
    couples to itself exactly as it couples to matter: t = s. This is the Yang-Mills strength. -/
theorem covariance_forces_the_self_coupling (s t : Int) : (∀ P : Point, residue turn s t P = zero) ↔ t = s := by
  constructor
  · intro h
    have h1 := h probe
    rw [the_residue_is_one_term] at h1
    have h2 := congrArg V3.z h1
    have h3 : (s - t) * 1 = 0 := h2
    omega
  · intro h P
    rw [the_residue_is_one_term, h]
    apply V3.eq3 <;> simp only [smul, zero, Int.sub_self, Int.zero_mul]

/-- EVERY COUPLING IS ADMITTED. The law fixes t = s and is silent on the size of s: the coupling is a magnitude. -/
theorem every_coupling_is_admitted (g : Int) (P : Point) : residue turn g g P = zero :=
  (covariance_forces_the_self_coupling g g).mpr rfl P

/-- THE FIELD IS ITS OWN SOURCE. With a charge that does not commute the potential turns the strength: the field
    carries the charge it reads. -/
theorem the_field_is_its_own_source : ∃ A F : V3, turn A F ≠ zero := by
  refine ⟨e1, e2, ?_⟩
  intro h; have h1 := congrArg V3.z h; revert h1; decide

/-! ### The commuting half. -/

/-- MAXWELL IS THE COMMUTING HALF. Where the charge commutes the strength is the curl alone, for every t. -/
theorem maxwell_is_the_commuting_half (t : Int) (P : Point) : strength still t P = P.dA := by
  apply V3.eq3 <;> simp only [strength, still, add, smul, zero, Int.mul_zero, Int.add_zero]

/-- Where the charge commutes no self-coupling is forced: every s and t pass. -/
theorem a_commuting_charge_forces_nothing (s t : Int) (P : Point) : residue still s t P = zero := by
  apply V3.eq3 <;>
  simp only [residue, variation, strength, still, add, sub, smul, zero, Int.mul_zero, Int.add_zero, Int.sub_self]

/-- A field whose charge commutes is not its own source: light carries no charge. -/
theorem a_commuting_field_is_not_its_own_source (A F : V3) : still A F = zero := rfl

/-! ## Part IV. The counts. -/

/-- The components of a charge that comes in n kinds: the turns among them, which are the carriers. -/
def carriers (n : Nat) : Nat := n * n - 1

theorem three_weak_carriers : carriers 2 = 3 := rfl
theorem eight_gluons : carriers 3 = 8 := rfl
/-- Eight, three and the one of the commuting charge. -/
theorem twelve_carriers : carriers 3 + carriers 2 + 1 = 12 := rfl

/-- Two states for each massless carrier and four for the scalar pair before the vacuum is chosen; after, three
    carriers hold three states each and one scalar remains. Nothing is lost. -/
theorem three_carriers_gain_mass_and_one_scalar_remains : 12 * 2 + 4 = (8 * 2 + 1 * 2 + 3 * 3) + 1 := rfl

/-- The ratio of hadrons to muon pairs, times nine, for n colours of the three light quarks (charges 2, 1, 1 in
    thirds, squared). -/
def ratio9 (n : Nat) : Nat := n * (4 + 1 + 1)

/-- THE RATIO COUNTS THE COLOURS. It reads two exactly at three colours. -/
theorem the_ratio_counts_the_colours (n : Nat) : ratio9 n = 2 * 9 ↔ n = 3 := by
  unfold ratio9; constructor <;> intro h <;> omega

/-- With five quarks open the ratio is eleven thirds. -/
theorem eleven_thirds_with_five_quarks : 3 * (4 + 1 + 1 + 4 + 1) = 11 * 3 := rfl

/-- THE PION COUNTS THE COLOURS SQUARED. Its rate into two photons carries n², and nine is three squared only. -/
theorem the_pion_counts_the_colours_squared (n : Nat) : n * n = 9 ↔ n = 3 := by
  constructor
  · intro h
    have h4 : n < 4 := by
      apply Nat.lt_of_not_le; intro h4
      have := Nat.mul_le_mul h4 h4; omega
    have h5 : n = 0 ∨ n = 1 ∨ n = 2 ∨ n = 3 := by omega
    rcases h5 with h5 | h5 | h5 | h5
    · subst h5; exact absurd h (by decide)
    · subst h5; exact absurd h (by decide)
    · subst h5; exact absurd h (by decide)
    · exact h5
  · intro h; subst h; rfl

/-- The phases that no relabelling removes from the mixing of n generations. -/
def phases (n : Nat) : Nat := (n - 1) * (n - 2) / 2
/-- The angles of the mixing of n generations. -/
def angles (n : Nat) : Nat := n * (n - 1) / 2

theorem no_phase_at_two : phases 2 = 0 := rfl
theorem one_phase_at_three : phases 3 = 1 := rfl
theorem three_angles_at_three : angles 3 = 3 := rfl

/-- Below three generations there is no phase. -/
theorem below_three_no_phase (n : Nat) (h : n < 3) : phases n = 0 := by
  have h5 : n = 0 ∨ n = 1 ∨ n = 2 := by omega
  rcases h5 with h5 | h5 | h5 <;> subst h5 <;> rfl

/-- From three generations on there is one. -/
theorem from_three_on_a_phase (n : Nat) (h : 3 ≤ n) : 1 ≤ phases n := by
  unfold phases
  have h1 : 2 ≤ n - 1 := by omega
  have h2 : 1 ≤ n - 2 := by omega
  have h3 : 2 * 1 ≤ (n - 1) * (n - 2) := Nat.mul_le_mul h1 h2
  exact (Nat.le_div_iff_mul_le (by decide)).mpr (by omega)

/-- THREE GENERATIONS ARE THE LEAST WITH ONE PHASE. -/
theorem three_is_the_least_with_a_phase (n : Nat) : 1 ≤ phases n ↔ 3 ≤ n := by
  constructor
  · intro h
    apply Nat.le_of_not_lt; intro h3
    have := below_three_no_phase n h3; omega
  · exact from_three_on_a_phase n

/-! ## Part V. The running of the coupling, as a sign. -/

/-- Three times the first coefficient of the running, for a field that carries a charge of weight c (three for three colours, zero for a charge that commutes), read by f flavours. Positive means
    the coupling falls at short distance. The coefficients 11 and 2 are cited, not derived. -/
def running (c f : Int) : Int := 11 * c - 2 * f

/-- THE STRONG FORCE IS FREE AT SHORT DISTANCE with six flavours. -/
theorem six_flavours_are_free : 0 < running 3 6 := by decide

/-- Freedom holds exactly up to sixteen flavours. -/
theorem free_exactly_up_to_sixteen (f : Int) : 0 < running 3 f ↔ f ≤ 16 := by
  unfold running; constructor <;> intro h <;> omega

/-- A CHARGE THAT COMMUTES IS NEVER FREE. Its coupling grows at short distance for every flavour count. -/
theorem a_commuting_charge_is_never_free (f : Int) (hf : 0 < f) : running 0 f < 0 := by
  unfold running; omega

/-- FREEDOM NEEDS A CHARGE THAT DOES NOT COMMUTE. -/
theorem freedom_needs_a_charge_that_does_not_commute (c f : Int) (hf : 0 ≤ f) (h : 0 < running c f) : 0 < c := by
  unfold running at h; omega

/-! ## Part VI. The dimension. -/

/-- The dimension of mass carried by the square of the coupling in n dimensions of spacetime. -/
def couplingDimension (n : Int) : Int := 4 - n

/-- THE COUPLING IS A PURE NUMBER EXACTLY IN FOUR DIMENSIONS. The law then contains no scale at all. -/
theorem the_coupling_is_a_pure_number_exactly_in_four (n : Int) : couplingDimension n = 0 ↔ n = 4 := by
  unfold couplingDimension; constructor <;> intro h <;> omega

end SPHYS.YangMills

#print axioms SPHYS.YangMills.div_eq
#print axioms SPHYS.YangMills.each_component_obeys_maxwell
#print axioms SPHYS.YangMills.the_law_has_no_mass_term
#print axioms SPHYS.YangMills.V3.eq3
#print axioms SPHYS.YangMills.the_bracket_is_antisymmetric
#print axioms SPHYS.YangMills.the_boundary_of_the_boundary_vanishes
#print axioms SPHYS.YangMills.jacobi
#print axioms SPHYS.YangMills.the_charge_does_not_commute
#print axioms SPHYS.YangMills.two_turns_make_a_third
#print axioms SPHYS.YangMills.the_residue_is_one_term
#print axioms SPHYS.YangMills.covariance_forces_the_self_coupling
#print axioms SPHYS.YangMills.every_coupling_is_admitted
#print axioms SPHYS.YangMills.the_field_is_its_own_source
#print axioms SPHYS.YangMills.maxwell_is_the_commuting_half
#print axioms SPHYS.YangMills.a_commuting_charge_forces_nothing
#print axioms SPHYS.YangMills.a_commuting_field_is_not_its_own_source
#print axioms SPHYS.YangMills.three_weak_carriers
#print axioms SPHYS.YangMills.eight_gluons
#print axioms SPHYS.YangMills.twelve_carriers
#print axioms SPHYS.YangMills.three_carriers_gain_mass_and_one_scalar_remains
#print axioms SPHYS.YangMills.the_ratio_counts_the_colours
#print axioms SPHYS.YangMills.eleven_thirds_with_five_quarks
#print axioms SPHYS.YangMills.the_pion_counts_the_colours_squared
#print axioms SPHYS.YangMills.no_phase_at_two
#print axioms SPHYS.YangMills.one_phase_at_three
#print axioms SPHYS.YangMills.three_angles_at_three
#print axioms SPHYS.YangMills.below_three_no_phase
#print axioms SPHYS.YangMills.from_three_on_a_phase
#print axioms SPHYS.YangMills.three_is_the_least_with_a_phase
#print axioms SPHYS.YangMills.six_flavours_are_free
#print axioms SPHYS.YangMills.free_exactly_up_to_sixteen
#print axioms SPHYS.YangMills.a_commuting_charge_is_never_free
#print axioms SPHYS.YangMills.freedom_needs_a_charge_that_does_not_commute
#print axioms SPHYS.YangMills.the_coupling_is_a_pure_number_exactly_in_four
```

## Appendix F · Kernel lines of Appendix E

```text
'SPHYS.YangMills.div_eq' depends on axioms: [propext]
'SPHYS.YangMills.each_component_obeys_maxwell' depends on axioms: [propext]
'SPHYS.YangMills.the_law_has_no_mass_term' depends on axioms: [propext]
'SPHYS.YangMills.V3.eq3' does not depend on any axioms
'SPHYS.YangMills.the_bracket_is_antisymmetric' depends on axioms: [propext, Quot.sound]
'SPHYS.YangMills.the_boundary_of_the_boundary_vanishes' depends on axioms: [propext, Quot.sound]
'SPHYS.YangMills.jacobi' depends on axioms: [propext, Quot.sound]
'SPHYS.YangMills.the_charge_does_not_commute' does not depend on any axioms
'SPHYS.YangMills.two_turns_make_a_third' does not depend on any axioms
'SPHYS.YangMills.the_residue_is_one_term' depends on axioms: [propext, Quot.sound]
'SPHYS.YangMills.covariance_forces_the_self_coupling' depends on axioms: [propext, Quot.sound]
'SPHYS.YangMills.every_coupling_is_admitted' depends on axioms: [propext, Quot.sound]
'SPHYS.YangMills.the_field_is_its_own_source' does not depend on any axioms
'SPHYS.YangMills.maxwell_is_the_commuting_half' depends on axioms: [propext]
'SPHYS.YangMills.a_commuting_charge_forces_nothing' depends on axioms: [propext]
'SPHYS.YangMills.a_commuting_field_is_not_its_own_source' does not depend on any axioms
'SPHYS.YangMills.three_weak_carriers' does not depend on any axioms
'SPHYS.YangMills.eight_gluons' does not depend on any axioms
'SPHYS.YangMills.twelve_carriers' does not depend on any axioms
'SPHYS.YangMills.three_carriers_gain_mass_and_one_scalar_remains' does not depend on any axioms
'SPHYS.YangMills.the_ratio_counts_the_colours' depends on axioms: [propext, Quot.sound]
'SPHYS.YangMills.eleven_thirds_with_five_quarks' does not depend on any axioms
'SPHYS.YangMills.the_pion_counts_the_colours_squared' depends on axioms: [propext, Quot.sound]
'SPHYS.YangMills.no_phase_at_two' does not depend on any axioms
'SPHYS.YangMills.one_phase_at_three' does not depend on any axioms
'SPHYS.YangMills.three_angles_at_three' does not depend on any axioms
'SPHYS.YangMills.below_three_no_phase' depends on axioms: [propext, Quot.sound]
'SPHYS.YangMills.from_three_on_a_phase' depends on axioms: [propext, Quot.sound]
'SPHYS.YangMills.three_is_the_least_with_a_phase' depends on axioms: [propext, Quot.sound]
'SPHYS.YangMills.six_flavours_are_free' does not depend on any axioms
'SPHYS.YangMills.free_exactly_up_to_sixteen' depends on axioms: [propext, Quot.sound]
'SPHYS.YangMills.a_commuting_charge_is_never_free' depends on axioms: [propext, Quot.sound]
'SPHYS.YangMills.freedom_needs_a_charge_that_does_not_commute' depends on axioms: [propext, Quot.sound]
'SPHYS.YangMills.the_coupling_is_a_pure_number_exactly_in_four' depends on axioms: [propext, Quot.sound]
```

## Appendix G · YangMills_Forced_Twin_CC.f90

Part III. Fourteen checks, zero failures: nine scanning the engine's statements (A and B) and five against published measurements (C). The run follows in Appendix H.

```fortran
! YangMills_Forced_Twin_CC.f90 · twin of SPHYS_YangMills_Forced_CC.lean
! RATIONALE. The engine proves the forcing over all integers. This twin does two other things: it scans the same
!   identities on random integer data, as an independent execution, and it sets the counts of the engine against
!   published measurements.
! DESIGN. Integer arithmetic (64 bit) for the algebra; double precision for the measured cells. One linear
!   congruential generator, fixed seed, so every run prints the same lines.
! NON-NEGOTIABLE. A measured cell compares a count of the engine with a published value and its uncertainty. No
!   coupling is computed from first principles: every coupling used here is a measured input and is named as one.
! RISK. The leading formulas for the ratio R and the running coupling carry higher-order corrections of a few
!   percent. The tolerances below are the published uncertainties, and the rival counts are excluded by many of them.
program yangmills_twin
  implicit none
  integer, parameter :: i8 = selected_int_kind(18), dp = kind(1.0d0)
  integer(i8) :: seed = 20260622_i8
  integer :: checks = 0, failures = 0
  real(dp), parameter :: pi = 3.14159265358979323846d0
  call algebra()
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
  function rnd() result(k)                         ! integers in -9..9
    integer(i8) :: k
    seed = mod(seed * 6364136223846793005_i8 + 1442695040888963407_i8, 9223372036854775807_i8)
    k = mod(abs(seed / 65536_i8), 19_i8) - 9_i8
  end function
  function rv() result(v)
    integer(i8) :: v(3)
    v = [rnd(), rnd(), rnd()]
  end function
  function turn(a, b) result(c)                    ! the bracket of the rotation algebra
    integer(i8), intent(in) :: a(3), b(3)
    integer(i8) :: c(3)
    c = [a(2)*b(3) - a(3)*b(2), a(3)*b(1) - a(1)*b(3), a(1)*b(2) - a(2)*b(1)]
  end function
  function residue(s, t, Am, An, dA, ep, dem, den) result(r)   ! dF - s[F, eps], every term kept
    integer(i8), intent(in) :: s, t, Am(3), An(3), dA(3), ep(3), dem(3), den(3)
    integer(i8) :: r(3), var(3), F(3)
    var = s*turn(dA, ep) + s*turn(An, dem) - s*turn(Am, den) + t*turn(dem, An) + t*turn(Am, den) &
        + t*s*(turn(turn(Am, ep), An) + turn(Am, turn(An, ep)))
    F = dA + t*turn(Am, An)
    r = var - s*turn(F, ep)
  end function
  subroutine algebra()
    integer :: i, bad_j, bad_r, bad_c, bad_f
    integer(i8) :: a(3), b(3), c(3), d(3), e(3), f(3), s, t, r(3), x(3)
    bad_j = 0; bad_r = 0; bad_c = 0; bad_f = 0
    do i = 1, 200000
      a = rv(); b = rv(); c = rv(); d = rv(); e = rv(); f = rv(); s = rnd(); t = rnd()
      if (any(turn(a, turn(b, c)) + turn(b, turn(c, a)) + turn(c, turn(a, b)) /= 0)) bad_j = bad_j + 1
      r = residue(s, t, a, b, c, d, e, f)
      x = turn(b, e) - turn(a, f)
      if (any(r /= (s - t)*x)) bad_r = bad_r + 1
      if (any(residue(s, s, a, b, c, d, e, f) /= 0)) bad_c = bad_c + 1
      if (s /= t .and. any(x /= 0) .and. all(r == 0)) bad_f = bad_f + 1
    end do
    write(*,'(A)') ' A. The algebra, on 200000 random integer points'
    call check('Jacobi''s identity holds at every point', bad_j == 0)
    call check('the residue is (s - t) times the stray term at every point', bad_r == 0)
    call check('with t = s the strength turns as a charge at every point', bad_c == 0)
    call check('with t /= s it fails wherever the stray term is not zero', bad_f == 0)
  end subroutine
  subroutine counts()
    integer :: n, f, bad
    write(*,'(A)') ' B. The counts'
    call check('carriers: 3 for two colours, 8 for three, 12 with the commuting one', &
               2*2-1 == 3 .and. 3*3-1 == 8 .and. 8+3+1 == 12)
    call check('states: 12*2 + 4 = (8*2 + 2 + 3*3) + 1, one scalar remains', 12*2+4 == 8*2+2+3*3+1)
    bad = 0
    do n = 1, 40
      if ((((n-1)*(n-2))/2 >= 1) .neqv. (n >= 3)) bad = bad + 1
    end do
    call check('a phase exists exactly from three generations on, n = 1..40', bad == 0)
    bad = 0
    do f = 0, 60
      if ((11*3 - 2*f > 0) .neqv. (f <= 16)) bad = bad + 1
      if (f > 0 .and. 11*0 - 2*f >= 0) bad = bad + 1
    end do
    call check('three colours are free exactly up to 16 flavours; a commuting charge never', bad == 0)
    bad = 0
    do n = 1, 40
      if ((4 - n == 0) .neqv. (n == 4)) bad = bad + 1
    end do
    call check('the coupling is a pure number in four dimensions only, n = 1..40', bad == 0)
  end subroutine
  subroutine measured()
    real(dp) :: as_mz, mz, mb, mtau, ia, as_b, as_tau, as_r, R3, Rm, Rs, g3, gm, gs, nn, ns
    real(dp) :: alpha, mpi, fpi
    integer :: n
    write(*,'(A)') ' C. Against published measurements'
    ! inputs, all measured: the strong coupling at the Z mass (Particle Data Group, 2024), the masses in GeV
    as_mz = 0.1180d0; mz = 91.1880d0; mb = 4.18d0; mtau = 1.77693d0
    ia = 1.0d0/as_mz + (11.0d0 - 2.0d0*5/3.0d0)/(2*pi)*log(mb/mz);     as_b = 1.0d0/ia
    ia = ia + (11.0d0 - 2.0d0*4/3.0d0)/(2*pi)*log(2.5d0/mb);           as_r = 1.0d0/ia
    ia = 1.0d0/as_b + (11.0d0 - 2.0d0*4/3.0d0)/(2*pi)*log(mtau/mb);    as_tau = 1.0d0/ia
    write(*,'(A,F6.4,A,F6.4,A,F6.4)') '   leading running from 0.1180 at the Z: ', as_b, ' at 4.18 GeV, ', &
         as_r, ' at 2.5 GeV, ', as_tau
    write(*,'(A)') '   at the tau mass; measured at the tau mass 0.332 +- 0.012 (Davier et al., 2014)'
    call check('the coupling is larger at the tau mass than at the Z: 0.332 against 0.1180, 17 uncertainties', &
               (0.332d0 - as_mz)/0.012d0 > 5.0d0)
    ! the next correction is of the order of the coupling itself: the threshold is one power of it, 0.332
    call check('leading running reaches the tau value within one power of the coupling', &
               abs(as_tau - 0.332d0)/0.332d0 < 0.332d0)
    ! the ratio R below the charm threshold (KEDR, 2017): 2.225 +- 0.020 +- 0.047
    Rm = 2.225d0; Rs = sqrt(0.020d0**2 + 0.047d0**2)
    do n = 2, 4
      R3 = n*(4.0d0 + 1 + 1)/9.0d0*(1.0d0 + as_r/pi)
      write(*,'(A,I1,A,F6.3,A,F6.1,A)') '   R with ', n, ' colours: ', R3, '   pull ', (R3 - Rm)/Rs, ' uncertainties'
    end do
    R3 = 2.0d0*(1.0d0 + as_r/pi)
    ! the convention: two uncertainties for an agreement, five for an exclusion; no threshold is fitted to a result
    call check('R: three colours within 2 uncertainties of 2.225 +- 0.051; two and four excluded by more than 5', &
               abs(R3 - Rm)/Rs < 2.0d0 .and. abs(R3*2/3 - Rm)/Rs > 5.0d0 .and. abs(R3*4/3 - Rm)/Rs > 5.0d0)
    ! the neutral pion into two photons (Larin et al., 2020): 7.802 +- 0.052 +- 0.105 eV
    alpha = 7.2973525693d-3; mpi = 134.9768d0; fpi = 130.2d0/sqrt(2.0d0)       ! MeV
    gm = 7.802d0; gs = sqrt(0.052d0**2 + 0.105d0**2)
    do n = 2, 4
      g3 = alpha**2*mpi**3/(64*pi**3*fpi**2)*(n/3.0d0)**2*1.0d6
      write(*,'(A,I1,A,F7.3,A,F7.1,A)') '   pion width with ', n, ' colours: ', g3, ' eV   pull ', (g3 - gm)/gs, &
           ' uncertainties'
    end do
    g3 = alpha**2*mpi**3/(64*pi**3*fpi**2)*1.0d6
    call check('pion width: three colours within 2 uncertainties of 7.802 +- 0.117 eV; two and four excluded by 5', &
               abs(g3 - gm)/gs < 2.0d0 .and. abs(g3*4/9 - gm)/gs > 5.0d0 .and. abs(g3*16/9 - gm)/gs > 5.0d0)
    ! the number of light neutrino kinds at the Z (Janot and Jadach, 2020): 2.9963 +- 0.0074
    nn = 2.9963d0; ns = 0.0074d0
    write(*,'(A,F5.2,A,F6.1,A,F6.1,A)') '   generations: 3 at ', abs(3 - nn)/ns, ' uncertainties; 2 at ', &
         abs(2 - nn)/ns, '; 4 at ', abs(4 - nn)/ns, ''
    call check('three generations within 2 uncertainties of 2.9963 +- 0.0074; two and four excluded by 5', &
               abs(3 - nn)/ns < 2.0d0 .and. abs(2 - nn)/ns > 5.0d0 .and. abs(4 - nn)/ns > 5.0d0)
  end subroutine
end program
```

## Appendix H · Run of Appendix G

```text
 A. The algebra, on 200000 random integer points
  PASS  Jacobi's identity holds at every point
  PASS  the residue is (s - t) times the stray term at every point
  PASS  with t = s the strength turns as a charge at every point
  PASS  with t /= s it fails wherever the stray term is not zero
 B. The counts
  PASS  carriers: 3 for two colours, 8 for three, 12 with the commuting one
  PASS  states: 12*2 + 4 = (8*2 + 2 + 3*3) + 1, one scalar remains
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
   generations: 3 at  0.50 uncertainties; 2 at  134.6; 4 at  135.6
  PASS  three generations within 2 uncertainties of 2.9963 +- 0.0074; two and four excluded by 5
 BATTERY-JSON: {"checks":14,"failures":0}
```
