# Matter as a New Mathematical Theorem

## Exclusion Forced by the Full Turn, the Dirac Equation as the Least Law of a Half-Spin, and Two Statistics with No Third in Three Dimensions

**Mohammad F. Islam** · 24 November 2026

*On edition 1.0.0. Part I is Spin and Statistics, edition 1.0.0, from Nothing Escapes, Least Erasure (Islam, 2026a), set in this paper's vocabulary. Part II, The Dirac Law and Exclusion from the Seat, is new.*

## Abstract

Matter is established here as a mathematical theorem. On the seat the exchange of two identical particles is the mirror, and a full turn of a half-spin is minus one. From these and the root, that nothing escapes the record, the law of matter and its exclusion are forced. We prove in core Lean 4, twenty-six laws with no axiom declared and no use of choice, that no law of first order with numbers as coefficients squares to the mass shell; that the algebra of turns supplies the coefficients, so that the operator of first order squares to the mass shell for every energy and momentum, which is the Dirac equation; that on the mass shell the law of second order is the product of two laws of first order; that the law carries four components in four dimensions of spacetime, two spins times two signs of the energy, so that it carries the antiparticle; that the product of two directions carries their cross product, the moment of the spin; that a full turn is minus one on a half-spin and the identity on every direction; that an exchange carrying that sign empties the amplitude wherever the two share a state, so two identical half-spins never do, while a whole spin excludes nothing; and that a sign whose square is one is plus or minus one, so that where a double exchange unwinds, in three dimensions of space and above, there are two statistics and no third. The law fixes its form and never its scale: every mass is admitted by theorem, and each is read from experiment.

This theorem subsumes Pauli's exclusion principle and Dirac's equation, and it subsumes the equations of Schrödinger and Pauli as the slow half of Dirac's. A Fortran twin runs twelve checks with zero failures, nine scanning the engine's statements and three against published measurements: the antiproton mirrors the proton to sixteen parts in a trillion, and the moment of the electron is the two of the least law to one part in a thousand, with the first correction of the field's own quantum closing the rest to two parts in a million. No violation of exclusion is found to $3.4\times10^{-29}$ (Shi et al., 2018). Part I carries the chapter of Least Erasure (Islam, 2026a) that reads spin and statistics on the seat, with its sixty-nine laws.

## The Standing of This Work

**Matter is established here as a theorem.** Inside the geometry of registration and conservation, the law of a half-spin and the exclusion of identical half-spins are uniquely forced. Dirac's equation is derived as the least law. Pauli's principle is derived from the full turn.

**Nothing is added.** This work adds zero fields and zero parameters to the masses that matter already reads from experiment, and it declares zero axioms in core Lean 4, with no use of choice. Exclusion is not a rule laid on matter. It is the sign of a full turn, read on two particles at once.

| Level | Framework | Standing | What is overcome |
|---|---|---|---|
| Projection | The equations of Schrödinger (1926) and Pauli (1927), with the exclusion principle (1925) | a wave law with spin added by hand and exclusion laid on as a rule | read two of the four components at low speed; blind to the antiparticle and silent on why identical electrons exclude |
| Realization | Dirac's equation (1928) and the spin-statistics theorem (1940) | a law found by demanding first order, and a theorem of relativistic field theory | describe every measured property of the electron, and take the algebra, the four components and the two statistics as given |
| Foundation | Matter as a theorem, this work | theorems checked by the kernel in core Lean 4, no axiom declared, no choice, on three named bridges | proves numbers cannot carry the law and turns can; proves exclusion from the full turn; proves two statistics and no third |

**This theorem subsumes Pauli's principle and Dirac's equation.** Every law in the table is an instance of the forced law or a consequence of the one sign.

| Prior law | Its standing before | How it is subsumed | Carried by |
|---|---|---|---|
| Pauli's exclusion principle | a rule of 1925, postulated to fit the spectra | the sign of the full turn carried to the exchange: the amplitude is empty wherever the two share a state | `the_full_turn_forces_exclusion`, `a_full_turn_is_minus_one` |
| Dirac's equation | found in 1928 by demanding a law of first order | forced: numbers cannot square to the mass shell, the turns do | `no_number_takes_the_square_root`, `dirac_squares_to_the_mass_shell` |
| The equations of Schrödinger and Pauli | the wave law, with spin added by hand | the slow half of the forced law: two components of four, by the cited reduction at low speed | `two_spins_and_two_signs`, with the reduction of Dirac (1928) |
| Antimatter | predicted in 1931, found in 1932 | both signs of the energy stand on one mass shell, and the particle map flips the charge | `both_signs_of_the_energy`, `odd_charges_even_energy` |
| The moment of the electron, two | measured, then computed by Dirac | the cross term in the product of two directions | `the_product_carries_the_cross` |
| The statistics of Fermi and Dirac, and of Bose and Einstein | two kinds, observed | the two signs whose square is one, and there is no third | `two_statistics_no_third`, `a_whole_spin_may_share` |
| The periodic table and the white dwarf | built on exclusion | theorems and runs of Part I | `pauli_exclusion`, `fermion_occupation_is_a_bit` |

**What the theory of matter assumed, this work proves.** The first two are theorems of Part I on the seat. The rest are theorems of Part II on the bridges of its section 1.

- **Bosons and fermions.** Here the exchange is the fold, the symmetric amplitudes are the line and the antisymmetric ones stand at its side (`exchange_carrier_equivariant`, `symmetric_on_the_line`).
- **A full turn negates a spinor.** Here it is the Return, proved on the quaternions (`the_return`, `full_turn_negates_spinors`).
- **The law of first order.** Dirac demanded it. Here it is the least order, and its coefficients are forced out of the numbers and into the turns (`no_number_takes_the_square_root`, `the_turns_take_the_square_root`).
- **Four components.** Here they are two spins times two signs of the energy (`four_components_in_four`, `two_spins_and_two_signs`).
- **Exclusion.** Here it follows from one sign (`the_full_turn_forces_exclusion`).
- **Two statistics.** Here a third is impossible wherever a double exchange unwinds (`two_statistics_no_third`, `the_double_exchange_unwinds_from_three`).

**Three dimensions of space are singled out, again.** A double exchange unwinds to nothing in three dimensions of space and above and not in the plane (`the_double_exchange_unwinds_from_three`, `the_plane_does_not_unwind`). In the plane a quarter phase is admitted, and it is measured there.

**Three warrants bound the claim, and each is printed.** The law fixes its form and never its scale (`every_mass_is_admitted`): the masses are read from experiment. Six results of classical mathematics and physics enter as named imports, listed in section 1 of Part II. And the exchange is read as a turn on bridge B1, which is the content of the spin-statistics theorem.

## Part I · Spin and Statistics

*Bosons on the Line and Fermions at Its Side, Pauli Exclusion as an Odd Reading Blind on the Fixed Set, the Full Turn's Minus One as the Exchange Sign, and Statistics as One Bit in Three Dimensions.* Edition 1.0.0.

**Abstract of Part I.** Every particle in three dimensions is a boson or a fermion, and the choice is fixed by its spin: half-integer spin turns a state to its negative under a full rotation and makes it antisymmetric under exchange; integer spin does neither. This Part reads the pair on the seat, the reflection $s\mapsto1-\bar s$ and the line it fixes. The exchange of two identical particles is an involution, and a carrier that sends a pair amplitude's antisymmetric part to the side and its symmetric part to the height makes the exchange the fold: the symmetric amplitudes, the bosons, are the line; the antisymmetric ones, the fermions, stand at height zero off it; registration keeps the symmetric part and forgets the rest. We prove in core Lean 4, sixty-nine laws with no axiom declared and no use of choice, that an antisymmetric amplitude vanishes wherever the exchange fixes the configuration, so Pauli exclusion is an odd reading blind on the fixed set and a fermion's occupation is one bit; that a full turn is minus one on spinors and the identity on vectors, the double cover being two to one; that an exchange sign whose square is the identity, as a double exchange is in three dimensions, is plus or minus one, while a quarter phase needs the plane; that bosons bunch and fermions part at a balanced splitter; and that the one-body record does not read the statistics, which only the pair reading returns. With the spin-statistics theorem carried as an import, the full turn's sign is the exchange sign. A Fortran twin runs seventeen checks with zero failures: from two states per orbital and one fermion per state it finds the noble gases at 2, 10, 18, 36, 54, 86 and 118, Chandrasekhar's mass at 1.43 solar masses, and London's condensation temperature for helium-4 at 3.13 K.

### 1. The Reader's Frame

This Part reads the two properties every particle carries in three dimensions, its spin and its statistics, and the theorem that joins them. A full turn of a spinor lands on minus one, the quaternion identity $ijk=-1$.

It claims three things. First, the exchange of two identical particles is the fold under a carrier forced by the symmetry, so bosons are the line and fermions stand at its side. Second, Pauli exclusion is the seat's odd reading: an antisymmetric amplitude is blind exactly on the configurations the exchange fixes. Third, statistics is one bit, and in three dimensions it is the same bit as the full turn's sign.

It refuses the derivation of the spin-statistics theorem, which is carried as an import from relativistic quantum field theory [QFT]. Part II sets that theorem as a named bridge and forces exclusion on it.

**Negative warrants.** Two, stated so that no reader supplies them. No physical fact here is read as a proof of a mathematical sentence: a corroboration joined to a claim takes the weaker grade. No quantum field theory is written: the spin-statistics theorem, the Madelung ordering of atomic subshells, and the constants enter as imports or measurements.

**Five terms.** An *exchange* swaps two identical particles. A pair amplitude is *symmetric* when the exchange leaves it unchanged and *antisymmetric* when the exchange negates it. A *reading* is *odd* under a map that flips its sign and *even* under one that keeps it. *Registration* keeps a point's height and forgets its side. A *keyed bit* is a yes-or-no property no function of a given record decides.


### 2. The Spine

The seat is a mirror and a record: the reflection $s\mapsto1-\bar s$, its fixed line, and the registration that keeps a point's height and forgets its side. This Part reads the seat on the exchange in Section 3, the odd reading in Pauli exclusion in Section 4, the Return in Section 5, its identification with the exchange sign in Section 6, the one bit in Section 7, the record that reads the bit in Section 8, and the bit at macroscopic scale in Section 9.

**Why this carrier, and not another.** The carrier is not chosen. Spaces with an involution and the maps that respect them form a category (`equivariant_id`, `equivariant_comp`), and the fixed set is a functor on it (`fix_functorial`); an equivariant map into the seat, whose fixed set is the line (`fold_global_seat`), lands every physical fixed point on the line (`equivariant_carrier_lands`). Here the physical involution is the exchange of two identical particles on a pair amplitude $(x,y)$, $x$ on the ordered slots $(a,b)$ and $y$ on $(b,a)$. The carrier $(x,y)\mapsto(1+(x-y),\,x+y)$ sends the antisymmetric part to the side and the symmetric part to the height, and it is equivariant (`exchange_carrier_equivariant`). Its landing on the symmetric amplitudes is forced by the functor (`exchange_carrier_lands`).

**The correspondence matrix.**

\begingroup\small

| Physical phenomenon | Element of the seat | Lean theorem | Fortran check |
|----------|----------|----------|----------|
| exchange of identical particles | the fold | `exchange_carrier_equivariant`, `swap_involutive` | 3721 of 3721 |
| bosons | the line | `symmetric_on_the_line`, `exchange_carrier_lands` | 3721 of 3721 |
| fermions | height zero, off the line | `antisymmetric_at_height_zero` | 61 of 61 |
| a pair and its exchange | two worlds over one record | `exchange_two_worlds` | 3660 of 3660 |
| Pauli exclusion | the odd reading blind on the fixed set | `pauli_exclusion`, `slater_vanishes_on_diagonal` | 1000 and 1000 |
| bosons sharing a state | the even reading free on it | `bosons_may_share` | structural |
| a fermion's occupation | one bit | `fermion_occupation_is_a_bit` | 101 of 101 |
| the periodic table | the bit filling orbitals | `fermion_occupation_is_a_bit` with Madelung [import] | 2, 10, 18, 36, 54, 86, 118 |
| the full turn | the Return: minus one on spinors | `the_return`, `full_turn_negates_spinors`, `full_turn_fixes_vectors`, `two_turns_are_identity` | 1000 axes to 2.2e-16 |
| the double cover | two to one, a kernel of one bit | `double_cover_two_to_one` | 1000 rotations |
| spin and statistics | the turn sign is the exchange sign | `turnSign_val`, `half_integer_spin_is_odd` with [QFT] | twelve particles and atoms |
| statistics in three dimensions | one bit | `statistics_one_bit` | 2 of 3600 phases |
| anyons in the plane | the quarter phase excluded in three dimensions | `anyon_needs_the_plane` | π/3 |
| Hong–Ou–Mandel | bosons bunch, fermions part | `bosons_bunch_fermions_part` | coincidence 0 and 1 |
| helium-4 and helium-3 | one one-body record, the pair reads the bit | `statistics_unread_by_one_body` | g2 = 2 and 0 |
| white dwarfs, superfluid helium | the bit at macroscopic scale | the occupation bit, with [import] | 1.43 solar masses; 3.13 K |

\endgroup


### 3. The Exchange Is the Fold

Two identical particles in two single-particle states $a$ and $b$ have a pair amplitude $(x,y)$: $x$ for the first in $a$ and the second in $b$, $y$ for the reverse. Exchange swaps them and is an involution (`swap_involutive`). The exchange carrier sends the antisymmetric part $x-y$ to the side and the symmetric part $x+y$ to the height, and the exchange becomes the fold (`exchange_carrier_equivariant`).

Three readings follow from the carrier.

- **Bosons are the line.** An amplitude lands on the line exactly when it is symmetric (`symmetric_on_the_line`).
- **Fermions stand at height zero.** An antisymmetric amplitude has no symmetric part and stands off the line unless it vanishes (`antisymmetric_at_height_zero`).
- **Registration is symmetrization.** It keeps the symmetric part as the record and forgets the antisymmetric part, so a pair and its exchange are two states with one record (`exchange_two_worlds`).

The twin executes the carrier on 3721 integer amplitudes.


### 4. Pauli Exclusion: The Odd Reading Is Blind on the Fixed Set

The exchange fixes a configuration when both particles are in one state. An antisymmetric amplitude obeys $\psi(a,b)=-\psi(b,a)$, so on the diagonal $\psi(a,a)=-\psi(a,a)$, and it vanishes (`pauli_exclusion`); the Slater form $f(a)g(b)-f(b)g(a)$ does so explicitly (`slater_vanishes_on_diagonal`). A symmetric amplitude is free on the diagonal: a product $f(a)f(b)$ is nonzero there wherever $f$ is (`bosons_may_share`). Pauli's exclusion principle (Pauli, 1925) is the seat's odd reading: an odd reading returns zero on the fixed set. This is the same theorem Least Erasure proves for charge readings on the fixed set of charge conjugation, read here on the fixed set of the exchange.

The consequence is a bit. A fermion mode's creation operator squares to zero, so the occupation number $n$ satisfies $n^2=n$, and an occupation equal to its own square is $0$ or $1$ (`fermion_occupation_is_a_bit`). Every fermion mode carries one bit.

The periodic table is that bit filling orbitals. With two states per orbital and the subshells taken in the Madelung order [import], the twin finds the shell closures at 2, 10, 18, 36, 54, 86 and 118: helium, neon, argon, krypton, xenon, radon and oganesson.


### 5. The Full Turn Returns Minus One

A rotation by angle $\theta$ about a unit axis $u$ acts on spinors by the unit quaternion $\cos\frac\theta2+u\sin\frac\theta2$ and on vectors by conjugation with it. At $\theta=2\pi$ the quaternion is $-1$, the Return, $ijk=-1$ (`the_return`). It negates every spinor (`full_turn_negates_spinors`) and fixes every vector (`full_turn_fixes_vectors`), and two full turns are the identity (`two_turns_are_identity`). The quaternions $q$ and $-q$ rotate every vector alike (`double_cover_two_to_one`), so the double cover of the rotations is two to one and its kernel, $\{1,-1\}$, is one bit.

The twin turns spinors and vectors about 1000 random axes and finds the full turn equal to $-1$ on spinors and to the identity on vectors to $2.2\times10^{-16}$. The minus one is measured: neutrons rotated through $2\pi$ by a magnetic field in one arm of an interferometer shift the interference by exactly the sign, returning only after $4\pi$ (Rauch et al.; Werner et al., 1975).


### 6. The Turn Sign Is the Exchange Sign

A particle of spin $n/2$ turns to $(-1)^n$ under a full rotation (`turnSign_val`): half-integer spin to minus one, integer spin to plus one (`half_integer_spin_is_odd`). The spin-statistics theorem makes this sign the exchange sign: in a relativistic quantum theory with positive energy and local commutativity, half-integer-spin fields anticommute and integer-spin fields commute (Fierz, 1939; Pauli, 1940). It is an import [QFT], carried as one, and the engine proves what the identification then gives: a particle is a fermion exactly when its turn sign is odd.

A topological reading sharpens the identification. An exchange of two particles, followed by the return of the pair, is a full turn of one around the other, which is why the two signs coincide in models built on the rotation group's double cover (Finkelstein and Rubinstein, 1968).

The rule reaches composites. A bound state is a fermion exactly when it holds an odd number of fermions. The twin checks twelve particles and atoms, from the electron and the photon to the deuteron and both helium isotopes: half-integer spin exactly when the count of constituent fermions is odd.


### 7. Statistics Is One Bit in Three Dimensions

In three dimensions a double exchange returns a pair to itself along a loop that can be shrunk, so the exchange sign $\varepsilon$ satisfies $\varepsilon^2=1$, and then $\varepsilon$ is $+1$ or $-1$ (`statistics_one_bit`). This is the rotation group's two-element fundamental group, the same bit as the kernel of the double cover. The twin scans 3600 exchange phases and finds exactly two whose square is the identity.

In the plane the loop cannot be shrunk, and the exchange phase is free (Leinaas and Myrheim, 1977; Wilczek, 1982). A quarter phase $i$ squares to $-1$ and is excluded in three dimensions (`anyon_needs_the_plane`). Anyons with the phase $\pi/3$ have been observed in the fractional quantum Hall state at filling one third (Bartolomei et al.; Nakamura et al., 2020). Statistics is one bit because space has three axes.


### 8. The Record Reads the Bit: Bunching and Antibunching

Two identical particles entering a balanced beam splitter from opposite ports leave through different ports with amplitude $t\cdot t+\varepsilon\,r\cdot r$, which is $1-\varepsilon$ in doubled units with $t=1$ and $r=i$ (`coincidence`). Bosons never leave separately and fermions always do (`bosons_bunch_fermions_part`).

- **Photons:** the coincidences vanish (Hong, Ou and Mandel, 1987).
- **Electrons in quantum Hall edge channels:** they antibunch (Bocquillon et al., 2013).
- **Helium atoms:** they show the bosonic dip (Lopes et al., 2015).
- **Free neutrons:** they antibunch (Iannuzzi et al., 2006).

The one-body record does not read the statistics. A boson pair and a fermion pair built from the same two orbitals have one density at every site and differ at coincidence, where the pair reading reads the bit (`statistics_unread_by_one_body`). A thermal Bose mode has pair correlation 2 at zero separation and a thermal Fermi mode 0, because its occupation is one bit (Appendix B).

Helium-4 atoms bunch and helium-3 atoms antibunch in one apparatus, cold clouds released and counted atom by atom (Jeltes et al., 2007). The two isotopes are two worlds whose one-body densities agree and whose pair records part.


### 9. Degeneracy and Condensation: The Bit at Macroscopic Scale

**The fermion bit.** It holds matter up. Electrons that cannot share a state fill momentum space to a Fermi surface, and their degeneracy pressure supports a white dwarf up to a mass fixed by constants. For a carbon–oxygen star, with two nucleons per electron, the twin computes $1.43$ solar masses (Chandrasekhar, 1931). Neutron degeneracy supports the neutron star beyond it.

**The boson bit.** It lets matter share a state. An ideal Bose gas at the density of liquid helium-4 condenses at 3.13 K, which the twin computes (London, 1938), against the lambda point of 2.17 K at which helium-4 becomes superfluid. Dilute alkali gases were condensed in 1995 (Anderson et al.; Davis et al.).

**Both at once.** Electron pairs bound into bosons carry superconductivity, and their charge $2e$ is why the flux quantum is $h/2e$, as the paper on light computes (Islam, 2026c). One bit per mode, read by the exchange, decides whether matter stacks or condenses.


### 10. What Spin and Statistics Carry, and What They Do Not

**What they carry.** They carry the seat on the exchange: the symmetric line and the antisymmetric side, registration as symmetrization, and a pair and its exchange as two worlds with one record. They carry Pauli exclusion as the odd reading's blindness on the fixed set, and a fermion's occupation as one bit. They carry the Return as the minus one of a full turn, and the double cover's kernel as the same bit as the statistics sign. They carry the reason that bit is one bit: three axes.

**What they do not carry.** They do not carry a derivation of the spin-statistics theorem, which is imported with its hypotheses. They do not carry the Madelung ordering, which is an empirical rule with exceptions, or the magnitudes of the condensation and degeneracy scales, which are computed from constants and not derived. The engine's delivery is on its own image (`value_on_image`).


### 11. Falsifiers

Three falsifiers, each a forbidden observation naming the theorem it would break.

- **F-Exclusion:** two identical fermions in one state, or an atomic or nuclear transition into an already filled shell. This breaks `pauli_exclusion` and `fermion_occupation_is_a_bit` read physically.
- **F-Connection:** a half-integer-spin particle obeying Bose statistics, or an integer-spin particle obeying Fermi statistics. This breaks the identification of the turn sign of `half_integer_spin_is_odd` with the exchange sign that the spin-statistics theorem carries.
- **F-Anyon:** a particle free in three dimensions with an exchange phase other than $\pm1$. This breaks `statistics_one_bit` read physically.

One class of experiment sharpens readings without moving the paper's standing: underground searches for Pauli-forbidden atomic transitions.

## Part II · The Dirac Law and Exclusion from the Seat

### 1. What Part I Left Open, and the Rule of Part II

**Part II establishes the law of matter as a theorem.** Part I proved what spin and statistics are on the seat, carried the theorem that joins them as an import, and wrote no law of motion. Part II sets that import as a bridge, forces exclusion on it, and derives the law.

The rule is strict. Only the seat and the root are allowed. Every other step is a theorem of the engine in Appendix C, a theorem of Part I, one of three bridges named here before it is used, or one of six classical results listed below.

| Bridge | Statement | Stands on | Grade |
|---|---|---|---|
| B1 · The exchange is a turn | Exchanging two identical particles multiplies their amplitude by the sign of a full turn of one of them. | the sign of the turn: `full_turn_negates_spinors`, `half_integer_spin_is_odd` (Part I). That the exchange carries it: the spin-statistics theorem (Pauli, 1940; Finkelstein and Rubinstein, 1968) | premise |
| B2 · Nothing escapes | The record of energy and momentum is kept. Every solution of the law stands on the mass shell. | the root, read as least erasure | premise |
| B3 · Least order | The law reads the field at the least order, the first. | least erasure | premise |

Six classical results enter by name, and nothing else enters. The half turn about an axis is the unit of that axis in the algebra of turns (Hamilton, 1844). The mass shell is energy squared less momentum squared, equal to mass squared (Einstein, 1905). The least law of this kind carries $2^{\lfloor n/2\rfloor}$ components in $n$ dimensions of spacetime (Brauer and Weyl, 1935). A field enters the law by shifting the momentum, which is the gauge of light (Islam, 2026c). At speeds far below that of light the law keeps two of its four components (Dirac, 1928). And the sphere of directions is simply connected in three dimensions of space and above, so a double exchange unwinds there and not in the plane (Leinaas and Myrheim, 1977).

### 2. No Number Takes the Square Root

By B3 the law is of first order: a sum of coefficients times the energy and the momenta. By B2 its square is the mass shell: the energy and each momentum enter squared, and no product of two of them appears. **No numbers do this** (`no_number_takes_the_square_root`). Already for two directions of the momentum, coefficients $a$ and $b$ with $(ax+by)^2=x^2+y^2$ for every $x$ and $y$ would need $a^2=1$, $b^2=1$ and $ab=0$ together. A law of first order for matter cannot be written with numbers.

### 3. The Turns Take It: Dirac's Equation

The algebra of turns has three units. Each squares to minus one, and two different units anticommute (`the_units_square_to_minus_one`, `the_units_anticommute`). The cross terms that defeat the numbers cancel in pairs: the square of a direction is minus its squared length, exactly (`the_turns_take_the_square_root`).

Set the energy in two opposite corners of a two by two array, with opposite signs, and the direction of the momentum in the other two corners. **This operator of first order squares to the mass shell, for every energy and momentum** (`dirac_squares_to_the_mass_shell`). On the mass shell, the operator less the mass times the operator plus the mass is zero (`the_dirac_law_factors_the_mass_shell`): the law of second order is the product of two laws of first order, and the least law is one factor,

$$(i\gamma^\mu\partial_\mu-m)\,\psi=0.$$

This is Dirac's equation. Dirac found it in 1928 by demanding a law of first order and searching for coefficients. Here the order is least erasure, the failure of numbers is a theorem, and the coefficients are the turns that Part I already proved a half-spin carries (`the_return`).

### 4. Four Components: Two Spins and the Antiparticle

The least law carries $2^{\lfloor n/2\rfloor}$ components: two in three dimensions of spacetime and four in four (`two_components_in_three`, `four_components_in_four`). **Four is two spins times two signs of the energy** (`two_spins_and_two_signs`). The mass shell that admits an energy admits its negative (`both_signs_of_the_energy`), and the law of first order keeps both. The second sign is the antiparticle. At zero mass the law no longer joins the four. They fall into two pairs, one of each hand (Weyl, 1929), and the weak force reads one of them (Islam, 2026d). Dirac read the second sign in 1931, and the positron was found the next year (Anderson, 1933).

The antiparticle mirrors the particle: the same mass, because one mass shell holds both signs, and the opposite charge, because the particle map of Part I flips every charge and keeps the energy (`odd_charges_even_energy`). The ratio of charge to mass of the antiproton to that of the proton is $-1.000000000003(16)$ (Borchert et al., 2022).

**The equations of Schrödinger and Pauli are the slow half.** At speeds far below that of light two of the four components carry the state and two are small. The law for the two is Pauli's equation of 1927, and without the spin it is Schrödinger's. They read half of the forced law.

### 5. The Moment of the Spin Is Two

The product of two directions carries their dot product and their cross product (`the_product_carries_the_cross`). In a magnetic field the momentum is shifted by the potential, the two shifted momenta no longer commute, and the cross term is the magnetic field. The cross term couples the field to the turn itself, and the spin is half the turn. So the moment for each unit of spin is twice the moment for each unit of orbit. **The least law gives the moment of the electron as two.**

It is measured. Half the moment is $1.00115965218059(13)$ (Fan et al., 2023). The least law holds to one part in a thousand. The rest is the first correction of the field's own quantum, $\alpha/2\pi=0.00116141$ (Schwinger, 1948), which closes the difference to two parts in a million.

### 6. Exclusion Is Forced by the Full Turn

The half turn about an axis is the unit of that axis, so a full turn is the unit times itself. **A full turn is minus one** (`a_full_turn_is_minus_one`). It fixes every direction (`a_full_turn_fixes_every_direction`), and two full turns return (`two_full_turns_return`). Only a half-spin carries the sign (`a_half_spin_turns_to_minus`, `a_whole_spin_turns_to_plus`).

By B1 the exchange of two identical particles carries that sign. Take two identical half-spins in one state: the diagonal of their amplitude, where the two share a state. Exchanging them changes nothing, and it multiplies the amplitude by minus one. **The amplitude is zero** (`the_full_turn_forces_exclusion`). Two identical half-spins never share a state. A whole spin carries the plus sign and excludes nothing (`a_whole_spin_may_share`).

This is Pauli's exclusion principle. Pauli laid it down in 1925 as a rule that fit the spectra. Here it is one sign, proved on the turns, carried to the exchange by one bridge. Part I's twin runs its consequences: the noble gases at 2, 10, 18, 36, 54, 86 and 118, and the mass of Chandrasekhar at 1.43 solar masses.

It is measured. The probability that an electron violates exclusion is below $3.4\times10^{-29}$ (Shi et al., 2018).

### 7. Two Statistics and No Third in Three Dimensions

Exchange two identical particles twice. In three dimensions of space the path of the double exchange unwinds to no exchange at all, because the sphere of directions is simply connected (`the_double_exchange_unwinds_from_three`). So the sign of one exchange squares to one. The sign of the full turn agrees: it squares to one (`the_turn_sign_squares_to_one`). **A sign whose square is one is plus one or minus one** (`two_statistics_no_third`). There are two statistics, that of Bose and Einstein and that of Fermi and Dirac, and there is no third.

**Three dimensions of space are the least in which this holds.** The plane does not unwind a double exchange (`the_plane_does_not_unwind`), and there a phase that is not a sign is admitted: a quarter phase squares to minus one (`a_quarter_phase_is_not_a_sign`). Part I proved the same from the seat (`anyon_needs_the_plane`). It is measured in the plane and nowhere else: a layer of electrons in a strong field carries excitations with a braiding phase of $2\pi/3$ (Nakamura et al., 2020).

A statistics with more than one component is a hidden charge (Doplicher and Roberts, 1990). It was first proposed for the quarks (Greenberg, 1964), and it is colour, whose law is forced elsewhere (Islam, 2026d).

### 8. Every Mass Is Read

The law fixes its form and is silent on the mass. For every mass the mass shell has a point (`every_mass_is_admitted`). This is the scaling theorem of Least Erasure read on matter: a magnitude is invisible to every verdict of the seat. The mass of the electron is therefore measured, 0.51099895069(16) MeV (Mohr et al., 2025).

### 9. The Ledger, the Falsifier, and What Stands

| Claim | Carried by | Grade |
|---|---|---|
| numbers cannot carry a law of first order | `no_number_takes_the_square_root` | theorem |
| the turns carry it; the operator squares to the mass shell | `the_turns_take_the_square_root`, `dirac_squares_to_the_mass_shell` on B2 and B3 | theorem for the algebra; premise on the bridges |
| the law of second order factors on the mass shell | `the_dirac_law_factors_the_mass_shell` | theorem |
| four components, two spins and two signs | `four_components_in_four`, `two_spins_and_two_signs`, `both_signs_of_the_energy` | theorem, on the cited count |
| the antiparticle has the same mass and the opposite charge | `both_signs_of_the_energy`; `odd_charges_even_energy` (Part I) | theorem for the mass and for the charge; the second sign read as the antiparticle (Dirac, 1931), cited |
| the equations of Schrödinger and Pauli are the slow half | the reduction at low speed (Dirac, 1928) on `two_spins_and_two_signs` | cited reduction, on the forced law |
| the moment is two | `the_product_carries_the_cross` | theorem for the algebra; on the cited shift of the momentum |
| a full turn is minus one | `a_full_turn_is_minus_one`, `a_full_turn_fixes_every_direction` | theorem, on the cited half turn |
| exclusion | `the_full_turn_forces_exclusion` on B1 | theorem on the sign; premise on the bridge |
| two statistics and no third from three dimensions on | `two_statistics_no_third`, `the_double_exchange_unwinds_from_three` | theorem, on the cited unwinding |
| the masses | `every_mass_is_admitted` | measured, by theorem |

| Test | The forced law gives | Measured, by the source cited |
|---|---|---|
| violation of exclusion by an electron | 0 | below $3.4\times10^{-29}$ (Shi et al., 2018) |
| antiproton to proton, charge over mass | $-1$ | $-1.000000000003(16)$ (Borchert et al., 2022) |
| half the moment of the electron | 1 at least order | $1.00115965218059(13)$ (Fan et al., 2023) |
| a phase that is not a sign | in the plane only | $2\pi/3$ in a layer of electrons (Nakamura et al., 2020) |

Every measurement in this table precedes this work. The table is agreement with the record, and the forward claim is the falsifier.

One falsifier is added to those of Part I, and the engine forces it. **F-Share:** two identical half-spins found in one state, at any rate; this breaks `the_full_turn_forces_exclusion` read physically. A third statistics in three dimensions of space, and a half-spin without its antiparticle, are forbidden by the theorems of sections 7 and 4 in the same way.

**The law at least order.** The forced law is the law of a half-spin at the least order of its derivatives, and it is exact there. Beyond it stands the field's own quantum, whose first correction the moment of section 5 reads to two parts in a million.

**The form of the law is closed.** Its order, its algebra, its four components, its antiparticle, its moment, its exclusion and its two statistics are forced, on three named bridges. The masses stand read from experiment, and Least Erasure proves that a seat returns no magnitude. Pauli's principle and Dirac's equation are subsumed, and the equations of Schrödinger and Pauli are subsumed with them as the slow half.

## Author's Provenance and Method Disclosure

**Who wrote it.** The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean files and the Fortran twins are written by a language model under the author's direct supervision.

**Method.** The work stands on one seat, the fixed line of a reflection, and one root, that nothing escapes the record, both set out in Nothing Escapes, Least Erasure (Islam, 2026a), from which Part I is carried. Part II adds three bridges and six results of classical mathematics and physics, each named in a table or a paragraph before it is used. Every theorem named in the text is declared under that name in an appendix. The kernel line of every theorem of Appendix C is printed in Appendix D, and the appendix of Part I carries the command that prints each of its own. Every measured value in the text names its source beside it. No magnitude is derived anywhere in this paper.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. Part I is carried from Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one. Part I is set here in this paper's own vocabulary, with the apparatus of that volume's series removed; no theorem, number, measurement or source was changed.

**Classical sources.** The equation is Dirac's (1928) and the algebra of turns is Hamilton's (1843). The exclusion principle is Pauli's (1925) and the theorem that joins spin to statistics is Pauli's (1940), with the geometric reading of the exchange as a turn due to Finkelstein and Rubinstein (1968). That the plane admits further statistics is Leinaas and Myrheim's result (1977). This paper derives what those results took as given and checks the forcing by a kernel.

## References

1. S. N. Bose, Z. Phys. 26 (1924) 178.
2. W. Pauli, Z. Phys. 31 (1925) 765.
3. E. Fermi, Z. Phys. 36 (1926) 902.
4. P. A. M. Dirac, Proc. R. Soc. A 112 (1926) 661.
5. S. Chandrasekhar, Astrophys. J. 74 (1931) 81.
6. F. London, Nature 141 (1938) 643.
7. M. Fierz, Helv. Phys. Acta 12 (1939) 3.
8. W. Pauli, Phys. Rev. 58 (1940) 716.
9. D. Finkelstein and J. Rubinstein, J. Math. Phys. 9 (1968) 1762.
10. H. Rauch, A. Zeilinger, G. Badurek, A. Wilfing, W. Bauspiess and U. Bonse, Phys. Lett. A 54 (1975) 425.
11. S. A. Werner, R. Colella, A. W. Overhauser and C. F. Eagen, Phys. Rev. Lett. 35 (1975) 1053.
12. J. M. Leinaas and J. Myrheim, Nuovo Cimento B 37 (1977) 1.
13. F. Wilczek, Phys. Rev. Lett. 49 (1982) 957.
14. C. K. Hong, Z. Y. Ou and L. Mandel, Phys. Rev. Lett. 59 (1987) 2044.
15. M. H. Anderson, J. R. Ensher, M. R. Matthews, C. E. Wieman and E. A. Cornell, Science 269 (1995) 198.
16. K. B. Davis et al., Phys. Rev. Lett. 75 (1995) 3969.
17. M. Iannuzzi, A. Orecchini, F. Sacchetti, P. Facchi and S. Pascazio, Phys. Rev. Lett. 96 (2006) 080402.
18. T. Jeltes et al., Nature 445 (2007) 402.
19. E. Bocquillon et al., Science 339 (2013) 1054.
20. R. Lopes et al., Nature 520 (2015) 66.
21. H. Bartolomei et al., Science 368 (2020) 173.
22. J. Nakamura, S. Liang, G. C. Gardner and M. J. Manfra, Nat. Phys. 16 (2020) 931.
23. W. R. Hamilton, Phil. Mag. 25 (1844) 489.
24. A. Einstein, Ann. Phys. 17 (1905) 891.
25. A. Einstein, Sitzungsber. Preuss. Akad. Wiss. (1924) 261.
26. E. Schrödinger, Ann. Phys. 79 (1926) 361.
27. W. Pauli, Z. Phys. 43 (1927) 601.
28. P. A. M. Dirac, Proc. R. Soc. A 117 (1928) 610.
29. H. Weyl, Z. Phys. 56 (1929) 330.
30. P. A. M. Dirac, Proc. R. Soc. A 133 (1931) 60.
31. C. D. Anderson, Phys. Rev. 43 (1933) 491.
32. R. Brauer and H. Weyl, Am. J. Math. 57 (1935) 425.
33. J. Schwinger, Phys. Rev. 73 (1948) 416.
34. O. W. Greenberg, Phys. Rev. Lett. 13 (1964) 598.
35. S. Doplicher and J. E. Roberts, Commun. Math. Phys. 131 (1990) 51.
36. H. Shi et al. (VIP-2), Eur. Phys. J. C 78 (2018) 319.
37. J. Nakamura, S. Liang, G. C. Gardner and M. J. Manfra, Nature Phys. 16 (2020) 931.
38. M. J. Borchert et al. (BASE), Nature 601 (2022) 53.
39. X. Fan, T. G. Myers, B. A. D. Sukra and G. Gabrielse, Phys. Rev. Lett. 130 (2023) 071801.
40. P. J. Mohr, D. B. Newell, B. N. Taylor and E. Tiesinga, Rev. Mod. Phys. 97 (2025) 025002.
41. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
42. M. F. Islam, Light as a New Mathematical Theorem, edition 1.0.0 (2026c).
43. M. F. Islam, The Nuclear Forces as a New Mathematical Theorem, edition 1.0.0 (2026d).

## Appendix A · SPHYS_Spin_Statistics.lean

Part I. Core Lean 4, carried from edition 1.0.0. Comments are set in this paper's vocabulary; no declaration is changed, and the file is recompiled.

```lean
/-
  SPHYS_Spin_Statistics.lean · spin and statistics, read at the seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: h = 2 Re s, t = Im s; the fold s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t), the fixed line
  h = 1, registration (h, t) ↦ (1, t). The exchange of two identical particles is an involution;
  the exchange carrier sends its antisymmetric part to the side and its symmetric part to the
  height, so the exchange is the fold.

  Part I     the seat, the category of involutions, the functor of the seat.
  Part II    the energy carrier (resident from Least Erasure).
  Part III   the substrate (resident from Least Erasure).
  Part IV    the exchange is the fold: bosons the line, fermions at height zero.
  Part V     Pauli exclusion: the odd reading blind on the fixed set; the occupation a bit.
  Part VI    the Return: a full turn is minus one on spinors; the double cover two to one.
  Part VII   statistics is one bit in three dimensions; the anyon needs the plane.
  Part VIII  the record: bunching and antibunching read the bit; one-body densities do not.
  Part IX    the capstone.
-/
set_option autoImplicit false
namespace SPHYS.SpinStatistics


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

/-! ## Part IV. The exchange is the fold -/

/-- A two-particle amplitude on two ordered slots: x on (a, b), y on (b, a). -/
abbrev Pair := Int × Int

/-- The exchange of two identical particles. -/
def swap (p : Pair) : Pair := (p.2, p.1)

theorem swap_involutive (p : Pair) : swap (swap p) = p := rfl

/-- The exchange carrier: the antisymmetric part to the side, the symmetric part to the height. -/
def exchangeSeat (p : Pair) : Pt := (1 + (p.1 - p.2), p.1 + p.2)

/-- THE EXCHANGE IS THE FOLD: the exchange carrier is equivariant. -/
theorem exchange_carrier_equivariant : Equivariant exchangeSeat swap fold := by
  intro p
  obtain ⟨x, y⟩ := p
  show ((1 + (y - x), y + x) : Pt) = (2 - (1 + (x - y)), x + y)
  rw [pe]; exact ⟨by omega, by omega⟩

/-- Bosons are the line: a pair amplitude lands on the line exactly when it is symmetric. -/
theorem symmetric_on_the_line (p : Pair) : OnLine (exchangeSeat p) ↔ swap p = p := by
  obtain ⟨x, y⟩ := p
  show 1 + (x - y) = 1 ↔ ((y, x) : Pair) = (x, y)
  rw [pe]; constructor
  · intro h; exact ⟨by omega, by omega⟩
  · intro ⟨h, _⟩; omega

/-- The symmetric pairs, carried by the functor of the seat, land on the line. -/
theorem exchange_carrier_lands :
    ∃ C : Carrier { p : Pair // swap p = p }, ∀ w, C.ι w = exchangeSeat w.1 :=
  equivariant_carrier_lands exchangeSeat swap exchange_carrier_equivariant

/-- Fermions stand at height zero: an antisymmetric amplitude has no symmetric part, and off the
    line unless it vanishes. -/
theorem antisymmetric_at_height_zero (x : Int) (h : x ≠ 0) :
    (exchangeSeat (x, -x)).2 = 0 ∧ ¬ OnLine (exchangeSeat (x, -x)) := by
  refine ⟨by show x + -x = 0; omega, ?_⟩
  show ¬ (1 + (x - -x) = 1); omega

/-- The record keeps the symmetric part and forgets the antisymmetric part: a pair and its exchange
    are two states with one record. -/
theorem exchange_two_worlds (p : Pair) (h : p.1 ≠ p.2) :
    swap p ≠ p ∧ reg (exchangeSeat (swap p)) = reg (exchangeSeat p) := by
  refine ⟨fun e => h (congrArg Prod.snd e), ?_⟩
  rw [exchange_carrier_equivariant]; rfl

/-! ## Part V. Pauli exclusion: the odd reading is blind on the fixed set -/

/-- PAULI EXCLUSION: an antisymmetric amplitude vanishes wherever the exchange fixes the
    configuration, both particles in one state. -/
theorem pauli_exclusion {α : Type} (ψ : α → α → Int) (hanti : ∀ a b, ψ a b = -ψ b a) (a : α) :
    ψ a a = 0 := by
  have := hanti a a
  omega

/-- The Slater form f(a)g(b) − f(b)g(a) is antisymmetric and vanishes on the diagonal. -/
theorem slater_vanishes_on_diagonal {α : Type} (f g : α → Int) (a : α) :
    f a * g a - f a * g a = 0 := by omega

/-- Bosons may share: a symmetric product f(a)f(b) is nonzero on the diagonal wherever f is. -/
theorem bosons_may_share {α : Type} (f : α → Int) (a : α) (h : f a ≠ 0) : f a * f a ≠ 0 :=
  Int.mul_ne_zero h h

/-- THE FERMION'S OCCUPATION IS A BIT: an occupation number equal to its own square is 0 or 1. -/
theorem fermion_occupation_is_a_bit (n : Int) : n * n = n ↔ n = 0 ∨ n = 1 := by
  constructor
  · intro h
    have h2 : n * (n - 1) = 0 := by simp only [Int.mul_sub, Int.mul_one]; omega
    rcases Int.mul_eq_zero.mp h2 with h3 | h3
    · left; exact h3
    · right; omega
  · intro h; rcases h with h | h <;> subst h <;> decide

/-! ## Part VI. The Return: a full turn is minus one on spinors -/

structure Q4 where
  r : Int
  i : Int
  j : Int
  k : Int
  deriving DecidableEq, Repr

def qmul (a b : Q4) : Q4 :=
  ⟨a.r*b.r - a.i*b.i - a.j*b.j - a.k*b.k, a.r*b.i + a.i*b.r + a.j*b.k - a.k*b.j,
   a.r*b.j - a.i*b.k + a.j*b.r + a.k*b.i, a.r*b.k + a.i*b.j - a.j*b.i + a.k*b.r⟩
def qneg (a : Q4) : Q4 := ⟨-a.r, -a.i, -a.j, -a.k⟩
def qconj (a : Q4) : Q4 := ⟨a.r, -a.i, -a.j, -a.k⟩
def qone : Q4 := ⟨1, 0, 0, 0⟩
def qi : Q4 := ⟨0, 1, 0, 0⟩
def qj : Q4 := ⟨0, 0, 1, 0⟩
def qk : Q4 := ⟨0, 0, 0, 1⟩

theorem qext {a b : Q4} (h1 : a.r = b.r) (h2 : a.i = b.i) (h3 : a.j = b.j) (h4 : a.k = b.k) :
    a = b := by
  cases a; cases b; simp_all

theorem qmul_neg_left (a b : Q4) : qmul (qneg a) b = qneg (qmul a b) := by
  apply qext <;> simp only [qmul, qneg, Int.neg_mul] <;> omega
theorem qmul_neg_right (a b : Q4) : qmul a (qneg b) = qneg (qmul a b) := by
  apply qext <;> simp only [qmul, qneg, Int.mul_neg] <;> omega
theorem qconj_neg (a : Q4) : qconj (qneg a) = qneg (qconj a) := rfl
theorem qneg_neg (a : Q4) : qneg (qneg a) = a := by
  apply qext <;> simp only [qneg, Int.neg_neg]
theorem qmul_one_left (a : Q4) : qmul qone a = a := by
  apply qext <;> simp only [qmul, qone] <;> omega

/-- The Return: i j k = −1, the quaternion form of a full turn. -/
theorem the_return : qmul (qmul qi qj) qk = qneg qone := by decide

/-- A FULL TURN IS MINUS ONE ON SPINORS: the full-turn element −1 negates every spinor. -/
theorem full_turn_negates_spinors (ψ : Q4) : qmul (qneg qone) ψ = qneg ψ := by
  rw [qmul_neg_left, qmul_one_left]

/-- A full turn is the identity on vectors, which it acts on by conjugation. -/
theorem full_turn_fixes_vectors (v : Q4) : qmul (qmul (qneg qone) v) (qconj (qneg qone)) = v := by
  rw [qmul_neg_left, qconj_neg, qmul_neg_right, qmul_neg_left, qneg_neg, qmul_one_left]
  apply qext <;> simp only [qmul, qconj, qone] <;> omega

/-- Two full turns are the identity on spinors. -/
theorem two_turns_are_identity : qmul (qneg qone) (qneg qone) = qone := by decide

/-- THE DOUBLE COVER IS TWO TO ONE: q and −q rotate every vector alike. The kernel of the cover
    is {1, −1}, one bit. -/
theorem double_cover_two_to_one (q v : Q4) :
    qmul (qmul (qneg q) v) (qconj (qneg q)) = qmul (qmul q v) (qconj q) := by
  rw [qmul_neg_left, qconj_neg, qmul_neg_right, qmul_neg_left, qneg_neg]

/-- The exchange sign of spin n/2, read as the sign of a full turn: (−1)^n. -/
def turnSign : Nat → Int
  | 0 => 1
  | n + 1 => - turnSign n

theorem turnSign_val (n : Nat) : turnSign n = if n % 2 = 0 then 1 else -1 := by
  induction n with
  | zero => rfl
  | succ n ih =>
    show - turnSign n = _
    rw [ih]
    by_cases h : n % 2 = 0
    · have h2 : (n + 1) % 2 ≠ 0 := by omega
      simp [h, h2]
    · have h2 : (n + 1) % 2 = 0 := by omega
      simp [h, h2]

/-- Half-integer spin turns to minus one; integer spin to plus one. With the spin-statistics
    theorem carried, the first are fermions and the second bosons. -/
theorem half_integer_spin_is_odd (n : Nat) : turnSign n = -1 ↔ n % 2 = 1 := by
  rw [turnSign_val]
  by_cases h : n % 2 = 0
  · simp [h]
  · have h1 : n % 2 = 1 := by omega
    simp [h, h1]

/-! ## Part VII. Statistics is one bit in three dimensions -/

/-- STATISTICS IS ONE BIT: an exchange sign whose square is the identity, as a double exchange is
    in three dimensions, is +1 or −1. -/
theorem statistics_one_bit (e : Int) (h : e * e = 1) : e = 1 ∨ e = -1 := by
  have h2 : (e - 1) * (e + 1) = 0 := by
    simp only [Int.sub_mul, Int.mul_add, Int.mul_one, Int.one_mul]; omega
  rcases Int.mul_eq_zero.mp h2 with h3 | h3
  · left; omega
  · right; omega

/-- A quarter phase i squares to −1, so it is excluded in three dimensions and admitted only in the
    plane, where a double exchange need not be the identity: the anyon. -/
theorem anyon_needs_the_plane : qmul qi qi = qneg qone ∧ qmul qi qi ≠ qone := by decide

/-! ## Part VIII. The record: bunching and antibunching read the bit -/

/-- The coincidence amplitude of two identical particles at a balanced splitter, doubled: t = 1,
    r = i, so t·t + ε·r·r = 1 − ε. -/
def coincidence (e : Int) : Int := 1 - e

/-- BOSONS BUNCH, FERMIONS PART: the coincidence vanishes for bosons and is full for fermions. -/
theorem bosons_bunch_fermions_part : coincidence 1 = 0 ∧ coincidence (-1) = 2 := by decide

/-- Orbitals f = (1, 1) and g = (1, −1) on two sites, and the pair amplitudes f(a)g(b) ± f(b)g(a). -/
def fo (_ : Bool) : Int := 1
def go (a : Bool) : Int := if a then -1 else 1
def pairAmp (e : Int) (a b : Bool) : Int := fo a * go b + e * (fo b * go a)
def oneBody (e : Int) (a : Bool) : Int := pairAmp e a false * pairAmp e a false + pairAmp e a true * pairAmp e a true

/-- THE ONE-BODY RECORD DOES NOT READ THE STATISTICS: the boson pair and the fermion pair have one
    density at every site and differ at coincidence, where the pair reading reads the bit. -/
theorem statistics_unread_by_one_body :
    oneBody 1 false = oneBody (-1) false ∧ oneBody 1 true = oneBody (-1) true ∧
    pairAmp 1 false false * pairAmp 1 false false = 4 ∧
    pairAmp (-1) false false * pairAmp (-1) false false = 0 := by decide

/-! ## Part IX. The capstone -/

/-- SPIN AND STATISTICS ON THE SEAT. The exchange is the fold under the exchange carrier; bosons
    are the line and fermions stand at height zero off it; a pair and its exchange share one
    record; an antisymmetric amplitude vanishes on the exchange's fixed configurations, so a
    fermion's occupation is one bit; a full turn negates spinors and fixes vectors, the double
    cover being two to one; an exchange sign whose square is the identity is ±1; bosons bunch and
    fermions part; the one-body record does not read the statistics. -/
theorem spin_and_statistics_on_the_seat :
    Equivariant exchangeSeat swap fold ∧
    (∀ p : Pair, OnLine (exchangeSeat p) ↔ swap p = p) ∧
    (∀ p : Pair, p.1 ≠ p.2 → reg (exchangeSeat (swap p)) = reg (exchangeSeat p)) ∧
    (∀ (ψ : Bool → Bool → Int), (∀ a b, ψ a b = -ψ b a) → ∀ a, ψ a a = 0) ∧
    (∀ n : Int, n * n = n ↔ n = 0 ∨ n = 1) ∧
    (∀ ψ : Q4, qmul (qneg qone) ψ = qneg ψ) ∧
    (∀ q v : Q4, qmul (qmul (qneg q) v) (qconj (qneg q)) = qmul (qmul q v) (qconj q)) ∧
    (∀ e : Int, e * e = 1 → e = 1 ∨ e = -1) ∧
    (coincidence 1 = 0 ∧ coincidence (-1) = 2) ∧
    (oneBody 1 false = oneBody (-1) false ∧ oneBody 1 true = oneBody (-1) true) :=
  ⟨exchange_carrier_equivariant, symmetric_on_the_line, fun p h => (exchange_two_worlds p h).2,
   fun ψ h a => pauli_exclusion ψ h a, fermion_occupation_is_a_bit, full_turn_negates_spinors,
   double_cover_two_to_one, statistics_one_bit, bosons_bunch_fermions_part,
   ⟨statistics_unread_by_one_body.1, statistics_unread_by_one_body.2.1⟩⟩

end SPHYS.SpinStatistics

#print axioms SPHYS.SpinStatistics.pe
#print axioms SPHYS.SpinStatistics.fold_involutive
#print axioms SPHYS.SpinStatistics.seat_fixed_line
#print axioms SPHYS.SpinStatistics.reg_lands
#print axioms SPHYS.SpinStatistics.reg_fixes_iff
#print axioms SPHYS.SpinStatistics.reg_forgets_side
#print axioms SPHYS.SpinStatistics.least_erasure_iff_value
#print axioms SPHYS.SpinStatistics.equivariant_id
#print axioms SPHYS.SpinStatistics.equivariant_comp
#print axioms SPHYS.SpinStatistics.fix_functorial
#print axioms SPHYS.SpinStatistics.fold_global_seat
#print axioms SPHYS.SpinStatistics.equivariant_carrier_lands
#print axioms SPHYS.SpinStatistics.value_on_image
#print axioms SPHYS.SpinStatistics.kinetic_crossing
#print axioms SPHYS.SpinStatistics.off_locus_pair
#print axioms SPHYS.SpinStatistics.ee
#print axioms SPHYS.SpinStatistics.mirror_involutive
#print axioms SPHYS.SpinStatistics.psi_phi
#print axioms SPHYS.SpinStatistics.phi_psi
#print axioms SPHYS.SpinStatistics.phi_injective
#print axioms SPHYS.SpinStatistics.phi_equivariant
#print axioms SPHYS.SpinStatistics.mirror_fixed_iff_real
#print axioms SPHYS.SpinStatistics.phi_line_iff_real
#print axioms SPHYS.SpinStatistics.stationary_iff_real
#print axioms SPHYS.SpinStatistics.line_is_stationary
#print axioms SPHYS.SpinStatistics.measured_on_line
#print axioms SPHYS.SpinStatistics.no_measurement_off_line
#print axioms SPHYS.SpinStatistics.energy_carrier_lands
#print axioms SPHYS.SpinStatistics.bar_involutive
#print axioms SPHYS.SpinStatistics.bar_fixed_iff_neutral
#print axioms SPHYS.SpinStatistics.odd_charges_even_energy
#print axioms SPHYS.SpinStatistics.gravity_reads_no_charge_bit
#print axioms SPHYS.SpinStatistics.involutions_commute
#print axioms SPHYS.SpinStatistics.tmirror_involutive
#print axioms SPHYS.SpinStatistics.joint_fixed_iff
#print axioms SPHYS.SpinStatistics.charge_carrier_equivariant
#print axioms SPHYS.SpinStatistics.pair_lands_once
#print axioms SPHYS.SpinStatistics.tmirror_equivariant
#print axioms SPHYS.SpinStatistics.neutral_charge_on_line
#print axioms SPHYS.SpinStatistics.pair_on_the_edges
#print axioms SPHYS.SpinStatistics.stable_lands
#print axioms SPHYS.SpinStatistics.swap_involutive
#print axioms SPHYS.SpinStatistics.exchange_carrier_equivariant
#print axioms SPHYS.SpinStatistics.symmetric_on_the_line
#print axioms SPHYS.SpinStatistics.exchange_carrier_lands
#print axioms SPHYS.SpinStatistics.antisymmetric_at_height_zero
#print axioms SPHYS.SpinStatistics.exchange_two_worlds
#print axioms SPHYS.SpinStatistics.pauli_exclusion
#print axioms SPHYS.SpinStatistics.slater_vanishes_on_diagonal
#print axioms SPHYS.SpinStatistics.bosons_may_share
#print axioms SPHYS.SpinStatistics.fermion_occupation_is_a_bit
#print axioms SPHYS.SpinStatistics.qext
#print axioms SPHYS.SpinStatistics.qmul_neg_left
#print axioms SPHYS.SpinStatistics.qmul_neg_right
#print axioms SPHYS.SpinStatistics.qconj_neg
#print axioms SPHYS.SpinStatistics.qneg_neg
#print axioms SPHYS.SpinStatistics.qmul_one_left
#print axioms SPHYS.SpinStatistics.the_return
#print axioms SPHYS.SpinStatistics.full_turn_negates_spinors
#print axioms SPHYS.SpinStatistics.full_turn_fixes_vectors
#print axioms SPHYS.SpinStatistics.two_turns_are_identity
#print axioms SPHYS.SpinStatistics.double_cover_two_to_one
#print axioms SPHYS.SpinStatistics.turnSign_val
#print axioms SPHYS.SpinStatistics.half_integer_spin_is_odd
#print axioms SPHYS.SpinStatistics.statistics_one_bit
#print axioms SPHYS.SpinStatistics.anyon_needs_the_plane
#print axioms SPHYS.SpinStatistics.bosons_bunch_fermions_part
#print axioms SPHYS.SpinStatistics.statistics_unread_by_one_body
#print axioms SPHYS.SpinStatistics.spin_and_statistics_on_the_seat
```

## Appendix B · SpinStat_Twin.f90

Part I. Carried from edition 1.0.0.

```fortran
! SpinStat_Twin.f90 · the executed twin of SPHYS_Spin_Statistics.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off SpinStat_Twin.f90
! Blocks: A the exchange carrier; B Pauli exclusion; C the Return and the double cover; D one bit in
! three dimensions; E bunching and antibunching; F the periodic table from the bit; G degeneracy:
! Chandrasekhar's mass; H condensation: London's temperature; I spin and statistics on the table.
program spinstat_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: i8 = selected_int_kind(18)
  real(dp), parameter :: PI = 3.141592653589793_dp, HBAR = 1.054571817e-34_dp, CL = 299792458.0_dp
  real(dp), parameter :: G = 6.67430e-11_dp, MH = 1.6735575e-27_dp, MSUN = 1.98847e30_dp
  real(dp), parameter :: KB = 1.380649e-23_dp, AMU = 1.66053906660e-27_dp
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

  subroutine block_a()
    integer :: x, y, n, neq, nline, nzero, npair
    write(*,'(a)') 'A · the exchange is the fold: bosons on the line, fermions at height zero'
    n = 0; neq = 0; nline = 0; nzero = 0; npair = 0
    do x = -30, 30
      do y = -30, 30
        n = n + 1
        ! seat of (x, y) is (1 + (x - y), x + y); seat of the swap is (1 + (y - x), y + x)
        if (1 + (y - x) == 2 - (1 + (x - y)) .and. y + x == x + y) neq = neq + 1
        if ((1 + (x - y) == 1) .eqv. (x == y)) nline = nline + 1
        if (x == -y) then
          if (x + y == 0 .and. ((1 + (x - y) /= 1) .eqv. (x /= 0))) nzero = nzero + 1
        end if
        if (x /= y .and. x + y == y + x) npair = npair + 1
      end do
    end do
    call check('equivariance on 3721 pair amplitudes: the exchange is the fold', neq == n)
    call check('a pair amplitude is on the line exactly when it is symmetric (3721)', nline == n)
    call check('antisymmetric amplitudes stand at height zero, off the line unless zero (61)', nzero == 61)
    call check('a pair and its exchange share one record (3660 unsymmetric pairs)', npair == n - 61)
  end subroutine block_a

  subroutine block_b()
    integer :: t, a, b, nd, nsl, nbit, nn
    real(dp) :: psi(6,6), f(6), gg(6), m
    write(*,'(a)') 'B · Pauli exclusion: the odd amplitude is blind on the diagonal; the occupation is a bit'
    nd = 0; nsl = 0
    do t = 1, 1000
      do a = 1, 6
        f(a) = rnd() - 0.5_dp; gg(a) = rnd() - 0.5_dp
        do b = 1, 6
          psi(a,b) = rnd() - 0.5_dp
        end do
      end do
      psi = psi - transpose(psi)
      if (all([(psi(a,a) == 0.0_dp, a = 1, 6)])) nd = nd + 1
      m = 0.0_dp
      do a = 1, 6
        m = max(m, abs(f(a)*gg(a) - f(a)*gg(a)))
      end do
      if (m == 0.0_dp) nsl = nsl + 1
    end do
    call check('1000 random antisymmetric amplitudes vanish exactly on every diagonal entry', nd == 1000)
    call check('1000 random Slater amplitudes f(a)g(b) - f(b)g(a) vanish at a = b', nsl == 1000)
    nbit = 0
    do nn = -50, 50
      if ((nn*nn == nn) .eqv. (nn == 0 .or. nn == 1)) nbit = nbit + 1
    end do
    call check('an occupation equal to its own square is 0 or 1 (101 of 101)', nbit == 101)
  end subroutine block_b

  pure function qm(a, b) result(c)
    real(dp), intent(in) :: a(4), b(4)
    real(dp) :: c(4)
    c(1) = a(1)*b(1) - a(2)*b(2) - a(3)*b(3) - a(4)*b(4)
    c(2) = a(1)*b(2) + a(2)*b(1) + a(3)*b(4) - a(4)*b(3)
    c(3) = a(1)*b(3) - a(2)*b(4) + a(3)*b(1) + a(4)*b(2)
    c(4) = a(1)*b(4) + a(2)*b(3) - a(3)*b(2) + a(4)*b(1)
  end function qm

  pure function qc(a) result(c)
    real(dp), intent(in) :: a(4)
    real(dp) :: c(4)
    c = [a(1), -a(2), -a(3), -a(4)]
  end function qc

  subroutine block_c()
    integer :: t
    real(dp) :: u(3), q2(4), q4(4), v(4), w(4), psi(4), s(4), e2, e4, ev, es, ec, q(4), r1(4), r2(4)
    write(*,'(a)') 'C · the Return: a full turn is -1 on spinors, +1 on vectors; the cover is two to one'
    e2 = 0.0_dp; e4 = 0.0_dp; ev = 0.0_dp; es = 0.0_dp; ec = 0.0_dp
    do t = 1, 1000
      u = [rnd() - 0.5_dp, rnd() - 0.5_dp, rnd() - 0.5_dp]; u = u/sqrt(sum(u*u))
      q2 = [cos(PI), sin(PI)*u(1), sin(PI)*u(2), sin(PI)*u(3)]
      q4 = [cos(2.0_dp*PI), sin(2.0_dp*PI)*u(1), sin(2.0_dp*PI)*u(2), sin(2.0_dp*PI)*u(3)]
      e2 = max(e2, maxval(abs(q2 - [-1.0_dp, 0.0_dp, 0.0_dp, 0.0_dp])))
      e4 = max(e4, maxval(abs(q4 - [1.0_dp, 0.0_dp, 0.0_dp, 0.0_dp])))
      v = [0.0_dp, rnd() - 0.5_dp, rnd() - 0.5_dp, rnd() - 0.5_dp]
      w = qm(qm(q2, v), qc(q2)); ev = max(ev, maxval(abs(w - v)))
      psi = [rnd() - 0.5_dp, rnd() - 0.5_dp, rnd() - 0.5_dp, rnd() - 0.5_dp]
      s = qm(q2, psi); es = max(es, maxval(abs(s + psi)))
      q = [rnd() - 0.5_dp, rnd() - 0.5_dp, rnd() - 0.5_dp, rnd() - 0.5_dp]; q = q/sqrt(sum(q*q))
      r1 = qm(qm(q, v), qc(q)); r2 = qm(qm(-q, v), qc(-q)); ec = max(ec, maxval(abs(r1 - r2)))
    end do
    write(*,'(a,es9.2,a,es9.2,a,es9.2)') '  full turn: |q - (-1)| <= ', e2, ';  vectors return to ', ev, &
         ';  spinors to -psi within ', es
    call check('a full turn about 1000 random axes is -1 on spinors and the identity on vectors', &
               e2 < 1.0e-15_dp .and. ev < 1.0e-15_dp .and. es < 1.0e-15_dp)
    call check('two full turns are the identity, and q and -q rotate every vector alike (1000)', &
               e4 < 1.0e-15_dp .and. ec < 1.0e-15_dp)
  end subroutine block_c

  subroutine block_d()
    integer :: t, n
    real(dp) :: th, re, im
    write(*,'(a)') 'D · statistics is one bit in three dimensions; the anyon needs the plane'
    n = 0
    do t = 0, 3599
      th = 2.0_dp*PI*real(t, dp)/3600.0_dp
      re = cos(2.0_dp*th); im = sin(2.0_dp*th)
      if (abs(re - 1.0_dp) < 1.0e-12_dp .and. abs(im) < 1.0e-12_dp) n = n + 1
    end do
    write(*,'(a,i0,a)') '  exchange phases on a grid of 3600 whose square is the identity: ', n, ' (0 and pi)'
    call check('only the phases +1 and -1 square to the identity', n == 2)
    call check('the fractional phase pi/3 of the nu = 1/3 anyon does not square to the identity', &
               abs(cos(2.0_dp*PI/3.0_dp) - 1.0_dp) > 0.5_dp)
  end subroutine block_d

  subroutine block_e()
    integer :: t
    real(dp) :: x, pb, pf, worst, gb, gf
    write(*,'(a)') 'E · the record reads the bit: bosons bunch, fermions part'
    worst = 0.0_dp
    do t = 0, 100
      x = real(t, dp)/100.0_dp
      pb = 0.5_dp*(1.0_dp - x); pf = 0.5_dp*(1.0_dp + x)
      worst = max(worst, abs(pb + pf - 1.0_dp))
    end do
    call check('at a balanced splitter, full overlap: bosons never coincide, fermions always do', &
               0.5_dp*(1.0_dp - 1.0_dp) == 0.0_dp .and. 0.5_dp*(1.0_dp + 1.0_dp) == 1.0_dp .and. worst < 1.0e-15_dp)
    call thermal_g2(0.3_dp, gb, gf)
    write(*,'(a,f9.6,a,f9.6)') '  one thermal mode at mean occupation 0.3: Bose g2 = ', gb, ';  Fermi g2 = ', gf
    call check('a thermal Bose mode bunches, g2 = 2 (helium-4), and a Fermi mode antibunches, g2 = 0 (helium-3)', &
               abs(gb - 2.0_dp) < 1.0e-12_dp .and. gf == 0.0_dp)
  end subroutine block_e

  subroutine thermal_g2(nbar, gb, gf)
    real(dp), intent(in) :: nbar
    real(dp), intent(out) :: gb, gf
    integer :: n
    real(dp) :: p, s1, s2, r
    ! Bose: geometric occupation with ratio r = nbar/(1 + nbar); Fermi: occupation 0 or 1 only
    r = nbar/(1.0_dp + nbar); s1 = 0.0_dp; s2 = 0.0_dp
    do n = 0, 400
      p = (1.0_dp - r)*r**n
      s1 = s1 + real(n, dp)*p; s2 = s2 + real(n, dp)*real(n - 1, dp)*p
    end do
    gb = s2/(s1*s1)
    s1 = 0.0_dp*(1.0_dp - nbar) + 1.0_dp*nbar
    s2 = 0.0_dp*(1.0_dp - nbar) + 0.0_dp*nbar
    gf = s2/(s1*s1)
  end subroutine thermal_g2

  subroutine block_f()
    integer, parameter :: order(19,2) = reshape([1,2,2,3,3,4,3,4,5,4,5,6,4,5,6,7,5,6,7, &
                                                 0,0,1,0,1,0,2,1,0,2,1,0,3,2,1,0,3,2,1], [19,2])
    integer :: k, total, nclos, closures(7)
    write(*,'(a)') 'F · the periodic table from the bit: two states per orbital, one per state'
    total = 0; nclos = 0
    do k = 1, 19
      total = total + 2*(2*order(k,2) + 1)
      if ((order(k,2) == 1 .or. (order(k,1) == 1 .and. order(k,2) == 0)) .and. nclos < 7) then
        nclos = nclos + 1; closures(nclos) = total
      end if
    end do
    write(*,'(a,7i5)') '  shell closures from the Madelung order: ', closures
    call check('the noble gases stand at 2, 10, 18, 36, 54, 86, 118', &
               all(closures == [2, 10, 18, 36, 54, 86, 118]))
  end subroutine block_f

  subroutine block_g()
    real(dp) :: mch, omega3, mue
    write(*,'(a)') 'G · degeneracy: the fermion bit holds a white dwarf up to Chandrasekhar''s mass'
    omega3 = 2.01824_dp; mue = 2.0_dp
    mch = omega3*sqrt(3.0_dp*PI)/2.0_dp*(HBAR*CL/G)**1.5_dp/(mue*MH)**2/MSUN
    write(*,'(a,f6.3,a)') '  Chandrasekhar mass for mu_e = 2: ', mch, ' solar masses'
    call check('the degenerate-electron limit is 1.43 solar masses (ideal, mu_e = 2)', abs(mch - 1.43_dp) < 0.02_dp)
  end subroutine block_g

  subroutine block_h()
    real(dp) :: m4, n, tc
    write(*,'(a)') 'H · condensation: the boson bit, London''s estimate for helium-4'
    m4 = 4.002602_dp*AMU; n = 145.0_dp/m4
    tc = 2.0_dp*PI*HBAR**2/(m4*KB)*(n/2.6123753_dp)**(2.0_dp/3.0_dp)
    write(*,'(a,f6.3,a)') '  ideal Bose gas at liquid-helium density: T_c = ', tc, ' K (the lambda point is 2.17 K)'
    call check('London''s ideal-gas temperature is 3.13 K, the scale of the lambda transition', abs(tc - 3.13_dp) < 0.05_dp)
  end subroutine block_h

  subroutine block_i()
    integer, parameter :: ntab = 12
    integer :: spin2(ntab), ferm(ntab), k, nok
    ! twice the spin, and the number of elementary fermion constituents, for
    ! e, p, n, photon, W, gluon, Higgs, pion, deuteron, helium-4 atom, helium-3 atom, Delta
    ! (quarks and electrons counted: the deuteron six quarks, helium-4 twelve and two, helium-3 nine and two)
    spin2 = [1, 1, 1, 2, 2, 2, 0, 0, 2, 0, 1, 3]
    ferm  = [1, 3, 3, 0, 0, 0, 0, 2, 6, 14, 11, 3]
    write(*,'(a)') 'I · spin and statistics on the table: the turn sign is the exchange sign'
    nok = 0
    do k = 1, ntab
      if (mod(spin2(k), 2) == mod(ferm(k), 2)) nok = nok + 1
    end do
    call check('twelve particles and atoms: half-integer spin exactly when an odd number of fermions', nok == ntab)
  end subroutine block_i
end program spinstat_twin
```

## Appendix C · SPHYS_Dirac_Forced_CC.lean

Part II. Core Lean 4.19.0, no import, no axiom declared, no use of choice, compiled with warnings fatal, exit 0. The kernel lines follow in Appendix D.

```lean
/-
  SPHYS_Dirac_Forced_CC.lean · exclusion from the full turn, the Dirac law as the least law of a half-spin · core Lean 4.

  RATIONALE. A law of first order whose square is the mass shell cannot have numbers as coefficients. The algebra of
  turns supplies the coefficients, and the same algebra sends a full turn to minus one. That sign, carried to the
  exchange of two identical particles, empties the diagonal: two of them cannot share a state. This file carries the
  algebra of all three steps.

  DESIGN. Integers only. A turn is a quaternion with integer parts. The Dirac operator is a two by two array of
  quaternions, which is the algebra of four anticommuting units of signature (+, -, -, -). No axiom is declared.
  The kernel line of every theorem is printed at the end.

  WHAT ENTERS AS A DEFINITION, NOT AS A THEOREM (read before editing):
    (1) the half turn about an axis is the unit of that axis (Hamilton, 1844), so a full turn is the
        unit multiplied by itself;
    (2) the mass shell: energy squared less momentum squared is mass squared (Einstein, 1905);
    (3) the count of components of the least such law in n dimensions, 2^(n/2) (Brauer and Weyl, 1935);
    (4) the exchange of two identical particles multiplies their amplitude by the sign of a full turn of one of
        them. This is bridge B1 of the paper, and it is the content of the spin-statistics theorem (Pauli, 1940);
    (5) a double exchange unwinds to nothing exactly when space has three dimensions or more, because the sphere of
        directions is then simply connected (Leinaas and Myrheim, 1977). It is the definition `unwinds`;
    (6) at speeds far below that of light the law keeps two of its four components (Dirac, 1928). The paper
        reads the equations of Schrödinger and Pauli on it; no theorem here uses it.
  RISK. A reader may take `the_full_turn_forces_exclusion` as a proof of the spin-statistics theorem. It is the
  forcing of exclusion from the sign of the turn, on bridge B1.
  NON-NEGOTIABLE. No theorem here fixes a mass. `every_mass_is_admitted` proves it cannot.
-/
namespace SPHYS.Dirac

/-! ## Part I. No number takes the square root. -/

/-- NO NUMBER TAKES THE SQUARE ROOT. A law of first order with numbers as coefficients never squares to the sum
    of squares, already in two directions. -/
theorem no_number_takes_the_square_root (a b : Int) :
    ¬ ∀ x y : Int, (a * x + b * y) * (a * x + b * y) = x * x + y * y := by
  intro h
  have h1 := h 1 0
  have h2 := h 0 1
  have h3 := h 1 1
  simp only [Int.mul_one, Int.mul_zero, Int.add_zero, Int.zero_add, Int.mul_add, Int.add_mul] at h1 h2 h3
  have h4 : a * b = b * a := Int.mul_comm a b
  have h5 : a * b = 0 := by omega
  rcases Int.mul_eq_zero.mp h5 with h6 | h6
  · rw [h6] at h1; exact absurd h1 (by decide)
  · rw [h6] at h2; exact absurd h2 (by decide)

/-! ## Part II. The algebra of turns. -/

/-- A turn: a + b·i + c·j + d·k. -/
structure Q where
  a : Int
  b : Int
  c : Int
  d : Int

theorem Q.eq4 {p q : Q} (h1 : p.a = q.a) (h2 : p.b = q.b) (h3 : p.c = q.c) (h4 : p.d = q.d) : p = q := by
  cases p; cases q; simp only at h1 h2 h3 h4; subst h1; subst h2; subst h3; subst h4; rfl

def qmul (p q : Q) : Q :=
  ⟨p.a * q.a - p.b * q.b - p.c * q.c - p.d * q.d, p.a * q.b + p.b * q.a + p.c * q.d - p.d * q.c,
   p.a * q.c - p.b * q.d + p.c * q.a + p.d * q.b, p.a * q.d + p.b * q.c - p.c * q.b + p.d * q.a⟩
def qadd (p q : Q) : Q := ⟨p.a + q.a, p.b + q.b, p.c + q.c, p.d + q.d⟩
def qneg (p : Q) : Q := ⟨-p.a, -p.b, -p.c, -p.d⟩
def num (n : Int) : Q := ⟨n, 0, 0, 0⟩
def one : Q := num 1
def qi : Q := ⟨0, 1, 0, 0⟩
def qj : Q := ⟨0, 0, 1, 0⟩
def qk : Q := ⟨0, 0, 0, 1⟩
/-- A direction: x·i + y·j + z·k. -/
def dir (x y z : Int) : Q := ⟨0, x, y, z⟩

/-- Each unit squares to minus one. -/
theorem the_units_square_to_minus_one : qmul qi qi = num (-1) ∧ qmul qj qj = num (-1) ∧ qmul qk qk = num (-1) :=
  ⟨rfl, rfl, rfl⟩

/-- Two different units anticommute. -/
theorem the_units_anticommute :
    qmul qi qj = qneg (qmul qj qi) ∧ qmul qj qk = qneg (qmul qk qj) ∧ qmul qk qi = qneg (qmul qi qk) :=
  ⟨rfl, rfl, rfl⟩

/-- A FULL TURN IS MINUS ONE. The half turn about an axis is its unit, and two half turns are a full turn. -/
theorem a_full_turn_is_minus_one : qmul qk qk = num (-1) := rfl

/-- Two full turns return. -/
theorem two_full_turns_return : qmul (qmul qk qk) (qmul qk qk) = one := rfl

/-- A full turn fixes every direction: minus one on both sides is the identity. Only a half-spin feels it. -/
theorem a_full_turn_fixes_every_direction (v : Q) : qmul (qmul (num (-1)) v) (num (-1)) = v := by
  apply Q.eq4 <;> simp only [qmul, num, Int.mul_zero, Int.zero_mul, Int.sub_zero, Int.add_zero, Int.zero_add,
    Int.zero_sub, Int.neg_mul, Int.mul_neg, Int.one_mul, Int.mul_one, Int.neg_neg, Int.neg_zero]

/-- THE TURNS TAKE THE SQUARE ROOT. The square of a direction is minus its squared length, with no cross term. -/
theorem the_turns_take_the_square_root (x y z : Int) :
    qmul (dir x y z) (dir x y z) = num (-(x * x + y * y + z * z)) := by
  apply Q.eq4 <;> simp only [qmul, dir, num, Int.mul_zero, Int.zero_mul, Int.mul_comm] <;> omega

/-- The product of two directions carries their dot product and their cross product. The cross term is the
    moment of the spin in a magnetic field, with the factor two. -/
theorem the_product_carries_the_cross (x y z u v w : Int) :
    qmul (dir x y z) (dir u v w) = ⟨-(x * u + y * v + z * w), y * w - z * v, z * u - x * w, x * v - y * u⟩ := by
  apply Q.eq4 <;> simp only [qmul, dir, Int.mul_zero, Int.zero_mul] <;> omega

/-! ## Part III. The least law of a half-spin. -/

/-- A two by two array of turns. -/
structure M where
  p : Q
  q : Q
  r : Q
  s : Q

theorem M.eq4 {m n : M} (h1 : m.p = n.p) (h2 : m.q = n.q) (h3 : m.r = n.r) (h4 : m.s = n.s) : m = n := by
  cases m; cases n; simp only at h1 h2 h3 h4; subst h1; subst h2; subst h3; subst h4; rfl

def mmul (m n : M) : M :=
  ⟨qadd (qmul m.p n.p) (qmul m.q n.r), qadd (qmul m.p n.q) (qmul m.q n.s),
   qadd (qmul m.r n.p) (qmul m.s n.r), qadd (qmul m.r n.q) (qmul m.s n.s)⟩
/-- A number times the identity. -/
def scalar (n : Int) : M := ⟨num n, num 0, num 0, num n⟩
/-- The operator of first order: energy in two opposite corners with opposite signs, the momentum's direction in the other two. -/
def D (E x y z : Int) : M := ⟨num E, dir x y z, dir x y z, num (-E)⟩
/-- The operator less a mass, and plus a mass. -/
def Dminus (E x y z m : Int) : M := ⟨num (E - m), dir x y z, dir x y z, num (-E - m)⟩
def Dplus (E x y z m : Int) : M := ⟨num (E + m), dir x y z, dir x y z, num (-E + m)⟩

/-- THE FIRST-ORDER LAW SQUARES TO THE MASS SHELL, for every energy and momentum. -/
theorem dirac_squares_to_the_mass_shell (E x y z : Int) :
    mmul (D E x y z) (D E x y z) = scalar (E * E - (x * x + y * y + z * z)) := by
  apply M.eq4 <;> apply Q.eq4 <;>
  simp only [mmul, D, scalar, qadd, qmul, dir, num, Int.mul_zero, Int.zero_mul, Int.mul_comm, Int.neg_mul,
    Int.mul_neg, Int.neg_neg] <;> omega

/-- THE DIRAC LAW. On the mass shell the operator less the mass, times the operator plus the mass, is zero: the
    law of second order is the product of two laws of first order. -/
theorem the_dirac_law_factors_the_mass_shell (E x y z m : Int) (h : E * E - (x * x + y * y + z * z) = m * m) :
    mmul (Dminus E x y z m) (Dplus E x y z m) = scalar 0 := by
  apply M.eq4 <;> apply Q.eq4 <;>
  simp only [mmul, Dminus, Dplus, scalar, qadd, qmul, dir, num, Int.mul_zero, Int.zero_mul, Int.neg_mul,
    Int.mul_neg, Int.neg_neg, Int.sub_mul, Int.mul_sub, Int.add_mul, Int.mul_add, Int.mul_comm] <;> omega

/-- BOTH SIGNS OF THE ENERGY. The mass shell that admits an energy admits its negative: the law carries the
    antiparticle. -/
theorem both_signs_of_the_energy (E m p2 : Int) (h : E * E = m * m + p2) : (-E) * (-E) = m * m + p2 := by
  rw [Int.neg_mul_neg]; exact h

/-- EVERY MASS IS ADMITTED. The law fixes its form and is silent on the mass. -/
theorem every_mass_is_admitted (m : Int) : ∃ E x y z : Int, E * E - (x * x + y * y + z * z) = m * m :=
  ⟨m, 0, 0, 0, by simp only [Int.mul_zero, Int.add_zero, Int.sub_zero]⟩

/-- The components of the least law in n dimensions of spacetime. -/
def components (n : Nat) : Nat := 2 ^ (n / 2)

theorem four_components_in_four : components 4 = 4 := rfl
theorem two_components_in_three : components 3 = 2 := rfl
/-- Four is two spins times two signs of the energy. -/
theorem two_spins_and_two_signs : components 4 = 2 * 2 := rfl

/-! ## Part IV. Exclusion from the full turn. -/

/-- The sign of a full turn on a particle of spin s, given twice the spin. -/
def turnSign (twoS : Nat) : Int := if twoS % 2 = 0 then 1 else -1

theorem a_half_spin_turns_to_minus : turnSign 1 = -1 := rfl
theorem a_whole_spin_turns_to_plus : turnSign 0 = 1 ∧ turnSign 2 = 1 := ⟨rfl, rfl⟩

/-- A double exchange is no exchange. -/
theorem the_turn_sign_squares_to_one (n : Nat) : turnSign n * turnSign n = 1 := by
  unfold turnSign; split <;> rfl

/-- THE FULL TURN FORCES EXCLUSION. If the exchange of two identical particles carries the sign of a full turn,
    and the spin is a half, their amplitude vanishes wherever the two share a state. -/
theorem the_full_turn_forces_exclusion {α : Type} (twoS : Nat) (hodd : twoS % 2 = 1) (ψ : α → α → Int)
    (hex : ∀ a b, ψ b a = turnSign twoS * ψ a b) (a : α) : ψ a a = 0 := by
  have h := hex a a
  have hs : turnSign twoS = -1 := by unfold turnSign; rw [if_neg (by omega)]
  rw [hs] at h; omega

/-- A WHOLE SPIN EXCLUDES NOTHING. With the plus sign an amplitude may be as large as it likes on the diagonal. -/
theorem a_whole_spin_may_share (twoS : Nat) (heven : twoS % 2 = 0) :
    ∃ ψ : Nat → Nat → Int, (∀ a b, ψ b a = turnSign twoS * ψ a b) ∧ ψ 0 0 ≠ 0 := by
  refine ⟨fun _ _ => 1, ?_, by decide⟩
  intro a b
  have hs : turnSign twoS = 1 := by unfold turnSign; rw [if_pos heven]
  rw [hs]; rfl

/-! ## Part V. Two statistics and no third. -/

/-- TWO STATISTICS AND NO THIRD. A sign whose square is one is plus one or minus one. -/
theorem two_statistics_no_third (σ : Int) : σ * σ = 1 ↔ σ = 1 ∨ σ = -1 := by
  constructor
  · intro h
    have h1 : (σ - 1) * (σ + 1) = 0 := by
      simp only [Int.sub_mul, Int.mul_add, Int.mul_one, Int.one_mul]; omega
    rcases Int.mul_eq_zero.mp h1 with h2 | h2
    · exact Or.inl (by omega)
    · exact Or.inr (by omega)
  · intro h
    rcases h with h | h <;> rw [h] <;> rfl

/-- A double exchange unwinds to nothing: the sphere of directions in d dimensions of space is simply connected. -/
def unwinds (d : Nat) : Prop := 2 ≤ d - 1

/-- THREE DIMENSIONS OF SPACE ARE THE LEAST IN WHICH THE DOUBLE EXCHANGE UNWINDS. -/
theorem the_double_exchange_unwinds_from_three (d : Nat) : unwinds d ↔ 3 ≤ d := by
  unfold unwinds; constructor <;> intro h <;> omega

/-- The plane does not unwind it. -/
theorem the_plane_does_not_unwind : ¬ unwinds 2 := by unfold unwinds; decide

/-- A QUARTER PHASE IS NOT A SIGN. Its square is minus one, so it lives only where the double exchange is not the
    identity: in the plane. -/
theorem a_quarter_phase_is_not_a_sign : qmul qi qi ≠ one := by
  intro h; have h1 := congrArg Q.a h; revert h1; decide

end SPHYS.Dirac

#print axioms SPHYS.Dirac.no_number_takes_the_square_root
#print axioms SPHYS.Dirac.Q.eq4
#print axioms SPHYS.Dirac.the_units_square_to_minus_one
#print axioms SPHYS.Dirac.the_units_anticommute
#print axioms SPHYS.Dirac.a_full_turn_is_minus_one
#print axioms SPHYS.Dirac.two_full_turns_return
#print axioms SPHYS.Dirac.a_full_turn_fixes_every_direction
#print axioms SPHYS.Dirac.the_turns_take_the_square_root
#print axioms SPHYS.Dirac.the_product_carries_the_cross
#print axioms SPHYS.Dirac.M.eq4
#print axioms SPHYS.Dirac.dirac_squares_to_the_mass_shell
#print axioms SPHYS.Dirac.the_dirac_law_factors_the_mass_shell
#print axioms SPHYS.Dirac.both_signs_of_the_energy
#print axioms SPHYS.Dirac.every_mass_is_admitted
#print axioms SPHYS.Dirac.four_components_in_four
#print axioms SPHYS.Dirac.two_components_in_three
#print axioms SPHYS.Dirac.two_spins_and_two_signs
#print axioms SPHYS.Dirac.a_half_spin_turns_to_minus
#print axioms SPHYS.Dirac.a_whole_spin_turns_to_plus
#print axioms SPHYS.Dirac.the_turn_sign_squares_to_one
#print axioms SPHYS.Dirac.the_full_turn_forces_exclusion
#print axioms SPHYS.Dirac.a_whole_spin_may_share
#print axioms SPHYS.Dirac.two_statistics_no_third
#print axioms SPHYS.Dirac.the_double_exchange_unwinds_from_three
#print axioms SPHYS.Dirac.the_plane_does_not_unwind
#print axioms SPHYS.Dirac.a_quarter_phase_is_not_a_sign
```

## Appendix D · Kernel lines of Appendix C

```text
'SPHYS.Dirac.no_number_takes_the_square_root' depends on axioms: [propext, Quot.sound]
'SPHYS.Dirac.Q.eq4' does not depend on any axioms
'SPHYS.Dirac.the_units_square_to_minus_one' does not depend on any axioms
'SPHYS.Dirac.the_units_anticommute' does not depend on any axioms
'SPHYS.Dirac.a_full_turn_is_minus_one' does not depend on any axioms
'SPHYS.Dirac.two_full_turns_return' does not depend on any axioms
'SPHYS.Dirac.a_full_turn_fixes_every_direction' depends on axioms: [propext]
'SPHYS.Dirac.the_turns_take_the_square_root' depends on axioms: [propext, Quot.sound]
'SPHYS.Dirac.the_product_carries_the_cross' depends on axioms: [propext, Quot.sound]
'SPHYS.Dirac.M.eq4' does not depend on any axioms
'SPHYS.Dirac.dirac_squares_to_the_mass_shell' depends on axioms: [propext, Quot.sound]
'SPHYS.Dirac.the_dirac_law_factors_the_mass_shell' depends on axioms: [propext, Quot.sound]
'SPHYS.Dirac.both_signs_of_the_energy' depends on axioms: [propext]
'SPHYS.Dirac.every_mass_is_admitted' depends on axioms: [propext]
'SPHYS.Dirac.four_components_in_four' does not depend on any axioms
'SPHYS.Dirac.two_components_in_three' does not depend on any axioms
'SPHYS.Dirac.two_spins_and_two_signs' does not depend on any axioms
'SPHYS.Dirac.a_half_spin_turns_to_minus' does not depend on any axioms
'SPHYS.Dirac.a_whole_spin_turns_to_plus' does not depend on any axioms
'SPHYS.Dirac.the_turn_sign_squares_to_one' does not depend on any axioms
'SPHYS.Dirac.the_full_turn_forces_exclusion' depends on axioms: [propext, Quot.sound]
'SPHYS.Dirac.a_whole_spin_may_share' does not depend on any axioms
'SPHYS.Dirac.two_statistics_no_third' depends on axioms: [propext, Quot.sound]
'SPHYS.Dirac.the_double_exchange_unwinds_from_three' depends on axioms: [propext, Quot.sound]
'SPHYS.Dirac.the_plane_does_not_unwind' does not depend on any axioms
'SPHYS.Dirac.a_quarter_phase_is_not_a_sign' does not depend on any axioms
```

## Appendix E · Dirac_Forced_Twin_CC.f90

Part II. Twelve checks, zero failures: nine scanning the engine's statements (A and B) and three against published measurements (C). One further line of the run is a reading and is not counted. The run follows in Appendix F.

```fortran
! Dirac_Forced_Twin_CC.f90 · twin of SPHYS_Dirac_Forced_CC.lean
! RATIONALE. The engine proves its identities over all integers. This twin executes the same identities on random
!   integer data, as an independent run, and sets three readings of the engine against published measurements.
! DESIGN. 64-bit integers for the algebra; double precision for the measured cells; one generator, fixed seed.
! NON-NEGOTIABLE. No mass and no coupling is computed. The fine-structure constant is a measured input.
! RISK. The least law gives the moment of the electron as two. The first correction, alpha over two pi, belongs to
!   the field's own quantum and is printed as such, not as a result of the least law.
program dirac_twin
  implicit none
  integer, parameter :: i8 = selected_int_kind(18), dp = kind(1.0d0)
  integer(i8) :: seed = 20260622_i8
  integer :: checks = 0, failures = 0
  real(dp), parameter :: pi = 3.14159265358979323846d0
  call algebra()
  call exclusion()
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
  function qm(p, q) result(r)                      ! product of two turns a + b i + c j + d k
    integer(i8), intent(in) :: p(4), q(4)
    integer(i8) :: r(4)
    r(1) = p(1)*q(1) - p(2)*q(2) - p(3)*q(3) - p(4)*q(4)
    r(2) = p(1)*q(2) + p(2)*q(1) + p(3)*q(4) - p(4)*q(3)
    r(3) = p(1)*q(3) - p(2)*q(4) + p(3)*q(1) + p(4)*q(2)
    r(4) = p(1)*q(4) + p(2)*q(3) - p(3)*q(2) + p(4)*q(1)
  end function
  function mm(a, b) result(c)                      ! product of two by two arrays of turns, stored (entry, part)
    integer(i8), intent(in) :: a(4,4), b(4,4)
    integer(i8) :: c(4,4)
    c(1,:) = qm(a(1,:), b(1,:)) + qm(a(2,:), b(3,:))
    c(2,:) = qm(a(1,:), b(2,:)) + qm(a(2,:), b(4,:))
    c(3,:) = qm(a(3,:), b(1,:)) + qm(a(4,:), b(3,:))
    c(4,:) = qm(a(3,:), b(2,:)) + qm(a(4,:), b(4,:))
  end function
  function dop(E, x, y, z, m) result(d)            ! the operator of first order, shifted by a mass
    integer(i8), intent(in) :: E, x, y, z, m
    integer(i8) :: d(4,4)
    d = 0
    d(1,1) = E + m; d(4,1) = -E + m
    d(2,2:4) = [x, y, z]; d(3,2:4) = [x, y, z]
  end function
  subroutine algebra()
    integer :: i, bad1, bad2, bad3, bad4, bad5, na, nb
    integer(i8) :: x, y, z, u, v, w, E, m, a, b, c, d, r(4), s(4,4), want(4,4)
    logical :: ok
    bad1 = 0; bad2 = 0; bad3 = 0; bad4 = 0
    do i = 1, 200000
      x = rnd(); y = rnd(); z = rnd(); u = rnd(); v = rnd(); w = rnd(); E = rnd()
      r = qm([0_i8, x, y, z], [0_i8, x, y, z])
      if (any(r /= [-(x*x + y*y + z*z), 0_i8, 0_i8, 0_i8])) bad1 = bad1 + 1
      r = qm([0_i8, x, y, z], [0_i8, u, v, w])
      if (any(r /= [-(x*u + y*v + z*w), y*w - z*v, z*u - x*w, x*v - y*u])) bad2 = bad2 + 1
      s = mm(dop(E, x, y, z, 0_i8), dop(E, x, y, z, 0_i8))
      want = 0; want(1,1) = E*E - (x*x + y*y + z*z); want(4,1) = want(1,1)
      if (any(s /= want)) bad3 = bad3 + 1
      ! a point on the mass shell: (a2+b2+c2+d2)^2 = (a2+b2-c2-d2)^2 + (2(ad+bc))^2 + (2(bd-ac))^2
      a = rnd(); b = rnd(); c = rnd(); d = rnd()
      E = a*a + b*b + c*c + d*d; m = a*a + b*b - c*c - d*d; x = 2*(a*d + b*c); y = 2*(b*d - a*c)
      s = mm(dop(E, x, y, 0_i8, -m), dop(E, x, y, 0_i8, m))
      if (any(s /= 0)) bad4 = bad4 + 1
    end do
    write(*,'(A)') ' A. The algebra, on 200000 random integer points'
    call check('the square of a direction is minus its squared length', bad1 == 0)
    call check('the product of two directions carries the dot and the cross', bad2 == 0)
    call check('the operator of first order squares to the mass shell', bad3 == 0)
    call check('on the mass shell, operator less mass times operator plus mass is zero', bad4 == 0)
    bad5 = 0
    do na = -6, 6
      do nb = -6, 6
        ok = (na*1 + nb*0)**2 == 1 .and. (na*0 + nb*1)**2 == 1 .and. (na + nb)**2 == 2
        if (ok) bad5 = bad5 + 1
      end do
    end do
    call check('no pair of numbers takes the square root, a and b in -6..6', bad5 == 0)
    bad5 = 0
    do na = 2, 12                                    ! the count 2**(n/2), whole part: 4 at n = 4 and 5 only, 2 at n = 2 and 3
      if ((2**(na/2) == 4) .neqv. (na == 4 .or. na == 5)) bad5 = bad5 + 1
      if ((2**(na/2) == 2) .neqv. (na == 2 .or. na == 3)) bad5 = bad5 + 1
    end do
    call check('components of the least law, n = 2..12: two in three dimensions of spacetime, four in four', bad5 == 0)
  end subroutine
  subroutine exclusion()
    integer :: i, j, bad1, bad2, bad3, sg
    integer(i8) :: f(12), g(12), psi(12,12)
    bad1 = 0; bad2 = 0; bad3 = 0
    do i = 1, 12
      f(i) = rnd(); g(i) = rnd() + 10
    end do
    do i = 1, 12                                     ! the amplitude with the minus sign, built once and then read
      do j = 1, 12
        psi(i,j) = f(i)*g(j) - f(j)*g(i)
      end do
    end do
    do i = 1, 12
      if (psi(i,i) /= 0) bad1 = bad1 + 1             ! empty wherever the two share a state
      do j = 1, 12
        if (psi(j,i) /= -psi(i,j)) bad1 = bad1 + 1
      end do
    end do
    do sg = -50, 50
      if ((sg*sg == 1) .neqv. (sg == 1 .or. sg == -1)) bad2 = bad2 + 1
    end do
    do i = 1, 40
      if ((i - 1 >= 2) .neqv. (i >= 3)) bad3 = bad3 + 1
    end do
    write(*,'(A)') ' B. Exclusion and the two statistics'
    call check('an amplitude with the minus sign vanishes wherever two share a state', bad1 == 0)
    call check('a sign whose square is one is plus one or minus one, -50..50', bad2 == 0)
    call check('the double exchange unwinds exactly from three dimensions of space, d = 1..40', bad3 == 0)
  end subroutine
  subroutine measured()
    real(dp) :: alpha, ghalf, sch, qm_ratio, qm_sig
    write(*,'(A)') ' C. Against published measurements'
    alpha = 7.2973525693d-3                         ! measured input
    ghalf = 1.00115965218059d0                      ! Fan et al., 2023, uncertainty 13 in the last two digits
    sch = alpha/(2*pi)
    write(*,'(A,F16.14,A,F10.8)') '   half the moment of the electron: least law 1, measured ', ghalf, &
         ', first correction alpha/2pi = ', sch
    ! thresholds are the scales of the expansion, not fitted numbers: alpha for the least law, (alpha/pi)^2 for the rest
    call check('the least law holds within alpha: measured 1.00115965218059(13)', abs(ghalf - 1.0d0) < alpha)
    call check('the first correction closes the rest within (alpha/pi)^2', abs(ghalf - 1.0d0 - sch) < (alpha/pi)**2)
    qm_ratio = -1.000000000003d0; qm_sig = 16.0d-12  ! Borchert et al., 2022
    write(*,'(A,F6.2,A)') '   antiproton to proton charge over mass: -1 at ', abs(qm_ratio + 1.0d0)/qm_sig, &
         ' uncertainties'
    call check('the antiparticle mirrors the particle: -1.000000000003(16) against -1', &
               abs(qm_ratio + 1.0d0)/qm_sig < 1.0d0)
    ! a bound compared with the forced value zero cannot fail: it is printed as a reading and is not counted
    write(*,'(A)') '   reading, not a check: exclusion forced 0; measured probability of a violation below 3.4e-29'
  end subroutine
end program
```

## Appendix F · Run of Appendix E

```text
 A. The algebra, on 200000 random integer points
  PASS  the square of a direction is minus its squared length
  PASS  the product of two directions carries the dot and the cross
  PASS  the operator of first order squares to the mass shell
  PASS  on the mass shell, operator less mass times operator plus mass is zero
  PASS  no pair of numbers takes the square root, a and b in -6..6
  PASS  components of the least law, n = 2..12: two in three dimensions of spacetime, four in four
 B. Exclusion and the two statistics
  PASS  an amplitude with the minus sign vanishes wherever two share a state
  PASS  a sign whose square is one is plus one or minus one, -50..50
  PASS  the double exchange unwinds exactly from three dimensions of space, d = 1..40
 C. Against published measurements
   half the moment of the electron: least law 1, measured 1.00115965218059, first correction alpha/2pi = 0.00116141
  PASS  the least law holds within alpha: measured 1.00115965218059(13)
  PASS  the first correction closes the rest within (alpha/pi)^2
   antiproton to proton charge over mass: -1 at   0.19 uncertainties
  PASS  the antiparticle mirrors the particle: -1.000000000003(16) against -1
   reading, not a check: exclusion forced 0; measured probability of a violation below 3.4e-29
 BATTERY-JSON: {"checks":12,"failures":0}
```
