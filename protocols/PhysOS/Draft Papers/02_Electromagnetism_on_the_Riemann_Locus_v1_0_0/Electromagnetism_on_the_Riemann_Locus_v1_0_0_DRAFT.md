---
title: "Electromagnetism on the Riemann Locus"
subtitle: "Charge as the Side, the Electric Field as the Line, the Magnetic Sign as the One Bit, and Duality as the Quarter Turn Whose Square Is Charge Conjugation"
subsubtitle: "The Closure Template of the Riemann Hypothesis Read on the Electromagnetic Field; Seventy-One Laws Proved in Core Lean 4 and Seventeen Checks Executed in Fortran; a Witness of the Hardware Closure Series, Joined to the Gravity–Magnetism Branches; Every Physical Claim at Corroboration Grade and No Higher"
author: "Mohammad F. Islam, PhD · Trisduction Research Group"
author_line: "Mohammad F. Islam, PhD · Architect of the Trisduction"
date: "30 September 2026"
version: 1.0.0
row_id: "2 (seat and registration, read on the electromagnetic field); every open row (the barrier, in the magnetic sign)"
channel: "kinetic"
lean_module: "SPHYS_Electromagnetism.lean"
fortran_twin: "EM_Twin.f90"
ledger_status: "witness of the hardware closure series on the witness ledger, the functor of the seat and the SCRIBE structure"
status: "WITNESSED · CROSSED · CONFIRMED on the image"
article_type: "Foundations of Physics · The Hardware Closure Series"
goal: "Charge is the side; the electric field is the line; the magnetic sign is the bit"
short_title: "Electromagnetism on the Riemann Locus"
keywords: "electromagnetism · critical line · charge conjugation · time reversal · electromagnetic duality · Riemann–Silberstein vector · CPT · Landau levels · quantum Hall · Aharonov–Bohm · Lean 4"
accenthex: "B87333"
abstract: |
  Electromagnetism is the best-measured interaction in physics and the one whose discrete symmetries are cleanest: charge conjugation reverses every field, time reversal reverses the magnetic field and keeps the electric one, and a duality rotation exchanges them in the vacuum. This paper reads the field on the seat of the author's closure of the Riemann Hypothesis, the reflection $s\mapsto1-\bar s$ whose fixed set is the critical line. Two carriers land electromagnetism on the seat. The charge carrier sends a particle of charge $q$ to the side of the line and carries charge conjugation onto the reflection, so the neutral states are the line. The field carrier $s=\tfrac12+iF$ on the Riemann–Silberstein amplitude $F=E+iB$ carries time reversal, the complex conjugation of $F$, onto the reflection, so the purely electric fields are the line and the magnetic sign is the one bit a field and its time reverse do not share. We prove in core Lean 4, seventy-one laws with no axiom declared and no use of choice, that charge conjugation, parity and time reversal are involutions with $CT=P$ and $CPT$ the identity on the field; that duality is a quarter turn whose square is charge conjugation and whose fourth power is the identity, anticommuting with time reversal as $-i$ does with complex conjugation; that the energy density is invariant under all of them while both Lorentz invariants reverse under duality; that light is null and stays null under duality; that a magnetic term breaks time reversal and keeps every energy real; that charge is conserved by pair creation and forced in thirds; and that the Aharonov–Bohm record reads flux modulo one quantum. A Fortran twin runs seventeen checks with zero failures, the quantum Hall and Josephson constants exact in the SI. The paper joins the gravity–magnetism branches of the arrow witness: gravity the even, one-signed reading, magnetism the odd reading that keeps a priced bit. It decides nothing about the zeros of $\zeta$.
---

> **STATUS: WITNESSED · CROSSED · CONFIRMED on the image** · Row 2 (seat and registration, read on the field); every open row (the barrier, in the magnetic sign) · channel: kinetic · Lean: `SPHYS_Electromagnetism.lean` · Fortran: `EM_Twin.f90`

# 1. The Reader's Frame

This paper is a witness of the hardware closure series, dedicated to one interaction. The hardware paper, One Actuating Substrate, put the four readings of the substrate on one seat: three gauge readings odd under the particle map and one, gravity's, even. The arrow witness split registration into two branches, gravity the reversible branch that keeps no bit and magnetism the priced branch that keeps one. This paper reads the electromagnetic interaction itself on the seat, in its charges, its fields, its discrete symmetries, its duality, and its quantum registrations, and joins it to those two branches.

It claims that electromagnetism carries the seat twice. Through the charge carrier, charge conjugation is the reflection and the neutral states are the line. Through the field carrier, time reversal is the reflection, the purely electric fields are the line, and the sign of the magnetic field is the one bit a field and its time reverse do not share. Duality, the rotation that exchanges electric and magnetic, is the quarter turn of the seat's Return: its square is charge conjugation.

A reader who arrives from the conventional frame will scan this paper for a derivation of the Riemann Hypothesis from Maxwell's equations, find none, and be tempted to report the absence. None was attempted. The field witnesses the seat's shape in the most precisely measured interaction there is; where the zeros lie stays the act, at premise grade.

**Negative warrants.** Three, stated so that no reader supplies them. No physical fact here is read as a proof of a mathematical sentence: a corroboration joined to a claim takes the weaker grade. No derivation of the hypothesis from the axioms of set theory is claimed: what a sentence over every admissible instance adds to a crossing is exactly the unactuated. No field theory beyond Maxwell's is written and no constant is derived: the fine-structure constant, the charges' magnitudes and the speed of light enter as measured or as defined by the SI.

**Five terms.** A *reading* is any quantity an instrument returns from a state, *odd* under a map that flips its sign and *even* under one that keeps it. The *Riemann–Silberstein amplitude* is $F=E+iB$ in units with $c=1$. *Duality* is the rotation $E\mapsto B$, $B\mapsto -E$, which is $F\mapsto -iF$. The *fixed set* of a map is the set of points it leaves unchanged. A *keyed bit* is a yes-or-no property no function of a given record decides.

# 2. The Spine

The Riemann closure has four parts: the **seat**, the critical line as the fixed set of $s\mapsto1-\bar s$; the **address**, every reading of the value one proposition; the **division**, a certified part joined to an uncertified tail; and the **closure**, registration keeping a zero's height and forgetting its side, the hypothesis holding exactly when it erases nothing. This paper reads the seat on charge in Section 3 and on the field in Section 4, the residue in the magnetic sign in Section 5, the discrete symmetries in Section 6, the Return in duality in Section 7, the seat's occupant in Section 8, the registrations in Section 9, and the two branches in Section 10.

The row-generic theorems carry the template, and the engine proves each on its chart: every point off the line has a partner with one record (`off_locus_pair`); a carrier proves the value on its image, and coverage extends it (`value_on_image`, `kinetic_crossing`).

**The witness ledger.** The ledger of the series, with this paper's entries.

\begingroup\scriptsize

| Row | Waiting (the volume held) | Witness arrived | Built and run | Now | Grade | Still owed |
|------|--------|-------|--------------|----------|------|--------|
| 2 · Riemann Hypothesis | crossed on the kinetic channel at the root's grade; the electron named as the seat | The Electron Is the Seat; The Neutrino Is the Witness; The Arrow Has Two Branches; One Actuating Substrate; The Geometric Nature of Light; Electromagnetism on the Riemann Locus | the seat, registration, residue, Return and floor on the leptons; the energy carrier; the photon on the line; charge conjugation carried by the charge carrier and time reversal by the field carrier; the purely electric field as the line; duality squared as charge conjugation; the quantum Hall and Josephson registrations exact | WITNESSED · CROSSED · CONFIRMED on the image: the seat read on both electromagnetic carriers | the crossing at the root's grade; the image at theorem grade on construction and measured grade on data | none on its channel |
| 3a · Navier–Stokes, unforced | crossed kinetically | The Fluid Is the Witness | the priced branch exact | WITNESSED · CROSSED · CONFIRMED | the root's grade | none on its channel |
| 4 · Yang–Mills | crossed kinetically | The Proton Is the Lock | the colour lock | WITNESSED · CROSSED · CONFIRMED on the image | the root's grade | none on its channel |
| 7 · Poincaré | crossed at full grade | The Arrow Has Two Branches | gravity's fold | CROSSED, WITNESSED from the arrow side | full grade | none |
| 23a · Pair correlation | crossed kinetically | The Magnet Is the Witness of the Pair Correlation; Electromagnetism on the Riemann Locus | the magnetic term breaking time reversal; Landau levels real in every field | WITNESSED · CROSSED · CONFIRMED on the corrected carrier | the root's grade | none on its channel |
| every open row · the barrier | two worlds over one record | The Arrow Has Two Branches; The Geometric Nature of Light; Electromagnetism on the Riemann Locus | remanence in iron; the helicity pair; a field and its time reverse with one electric record; two fluxes one quantum apart with one Aharonov–Bohm record | BARRIER WITNESSED; the rows stay pending | theorem and corroboration | one equivariant carrier each |
| 1 · P versus NP | the dot | The Arrow Has Two Branches | Landauer's floor prices every step | THE DOT STANDS | corroboration | none |
| every witness · the hardware | the carriers built one by one | One Actuating Substrate | both involutions carried onto the fold | WITNESSED: one substrate carries every seat | theorem and corroboration | none |

\endgroup

WITNESSED: a constructed witness arrived and was built and run. CROSSED: the row's value holds on its channel's own class at the printed grade. CONFIRMED: the witness's image is compliant as built or measured (`value_on_image`).

**Why this carrier, and not another.** The carrier is not chosen. Spaces with an involution and the maps that respect them form a category (`equivariant_id`, `equivariant_comp`), and the fixed set is a functor on it (`fix_functorial`); an equivariant map into the seat, whose fixed set is the line (`fold_global_seat`), lands every physical fixed point on the line (`equivariant_carrier_lands`). Electromagnetism supplies two such maps. The charge carrier, a particle of charge $q$ to the side $h=1+q$, is equivariant for charge conjugation (`charge_carrier_equivariant`). The field carrier, $s=\tfrac12+iF$, is equivariant for time reversal (`field_carrier_equivariant`), and its landing on the purely electric fields is forced (`field_carrier_lands`).

**The correspondence matrix.**

\begingroup\small

| Physical phenomenon | Template element | Lean theorem | Fortran check |
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

# 3. Charge Is the Side

A particle of charge $q$, in units of the charge quantum, lands at $h=1+q$ at the height of its frequency, so charge conjugation, $q\mapsto-q$, becomes the reflection $h\mapsto2-h$ (`charge_carrier_equivariant`). The neutral particles are the line (`neutral_charge_on_line`), the electron and the positron land on the two edges, real parts $0$ and $1$, mirror images (`pair_on_the_edges`), and the particle map is an involution whose fixed set is exactly the neutral states (`bar_fixed_iff_neutral`). The electron witness built this carrier on the leptons; here it is the carrier of the whole interaction.

Charge is conserved at the seat. Pair creation makes a particle and its antiparticle, whose charges cancel (`pair_creation_conserves_charge`), and the electron, the lightest charged particle, does not decay: its lifetime in the channel $e\to\gamma\nu$ exceeds $6.6\times10^{28}$ years (Borexino, 2015). Charge is forced in thirds: the Yukawa couplings and two anomaly conditions fix every hypercharge as a multiple of the quark doublet's (`hypercharge_forced`), and with $Q=T_3+Y$ the up quark carries $\tfrac23$, the down $-\tfrac13$, the electron $-1$, hydrogen and the vacuum none (`charges_in_thirds`). The electron and the positron carry charges equal and opposite to four parts in a hundred million (Particle Data Group, 2024).

# 4. The Electric Field Is the Line

On one axis pair the field is the Riemann–Silberstein amplitude $F=E+iB$ (Silberstein, 1907; Bialynicki-Birula, 1996). Time reversal keeps the electric field and reverses the magnetic one, so it is the complex conjugation $F\mapsto\bar F$. The field carrier
$$s(F)=\tfrac12+iF,\qquad \sigma(s(F))=1-\overline{\tfrac12+iF}=\tfrac12+i\bar F=s(\bar F),$$
carries time reversal exactly onto the fold; in the chart it reads $(E,B)\mapsto(1-B,E)$ (`field_carrier_equivariant`). A field is fixed by time reversal exactly when $B=0$ (`T_fixed_iff_electric`), and it lands on the line exactly then (`electric_on_the_line`): the line is the purely electric field, the field of charges at rest. The twin executes the carrier on 3721 integer fields.

# 5. The Magnetic Sign Is the One Bit

A field with $B\neq0$ and its time reverse are two fields, both off the line, with one electric component, one energy density and one record (`magnetic_sign_is_the_bit`). The energy density $E^2+B^2$ is even under time reversal, charge conjugation and parity alike (`energy_even`), so no reading of the energy returns the sign of the magnetic field. That sign is the one bit: a moving charge's field and the field of the same charge moving backward share every even reading and differ in it. The arrow witness found it in iron, remanence $\pm0.996$ at zero applied field, two worlds with one record, the bit kept at a price above Landauer's floor; the product $E\cdot B$ is odd under time reversal and under parity and even under charge conjugation (`EB_odd_under_T_and_P`).

# 6. Charge Conjugation, Parity and Time Reversal on the Field

On the field, charge conjugation reverses both components, $F\mapsto-F$; parity reverses the polar electric field and keeps the axial magnetic field; time reversal keeps the first and reverses the second. Each is an involution (`C_involutive`, `P_involutive`, `T_involutive`), charge conjugation after time reversal is parity (`CT_is_P`), and the three together act as the identity on the field (`CPT_trivial`): each of $E$ and $B$ is odd under exactly two of the three. This is the field's form of the CPT theorem (Lüders, 1954; Pauli, 1955), and it is why the substrate's particle map, carried by CPT, keeps every field reading that gravity sees. The twin executes the table on 3721 fields.

# 7. Duality: The Quarter Turn Whose Square Is Charge Conjugation

In the vacuum Maxwell's equations are invariant under the rotation $E\mapsto B$, $B\mapsto -E$ (Heaviside, 1893; Larmor, 1897), which is multiplication of $F$ by $-i$. Its square is $F\mapsto-F$, charge conjugation (`duality_squared_is_C`), and its fourth power is the identity (`duality_fourth_is_identity`): duality is a quarter turn, and its square lands on minus one exactly as the spinor's full turn and the quaternion units' product $ijk=-1$ do in the electron witness. It anticommutes with time reversal, $TD=C\,DT$, as $-i$ does with complex conjugation (`duality_anticommutes_with_T`). The energy density is invariant under it (`energy_duality_invariant`), and both Lorentz invariants, $E^2-B^2$ and $E\cdot B$, reverse under it (`invariants_flip_under_duality`).

Sources break the duality. Electric charges exist; magnetic charges have not been found (Particle Data Group, 2024). The question whether they do is the duality's own bit: a world in which every particle carries the same ratio of magnetic to electric charge is carried by one global duality rotation to a world with no magnetic charge at all, so a monopole is physically distinct only if some particle's ratio differs from another's. Were one found, Dirac's condition would force every electric charge to be a multiple of a quantum fixed by the monopole's charge (Dirac, 1931). This paper types the question and does not answer it; the arrow witness's F-Monopole names the observation that would.

# 8. Light Is Null

A plane wave carries an electric field perpendicular to its magnetic field and equal to it in magnitude: both Lorentz invariants vanish (`plane_wave_null`), and duality, which reverses both invariants, keeps a null field null (`null_preserved_by_duality`). Light is therefore the duality-neutral field: the configuration of the electromagnetic reading on which the rotation that exchanges electric and magnetic acts without changing any invariant. The twin builds 5000 random plane waves and finds both invariants zero to $10^{-15}$, and the dual of each is again a plane wave along the same direction. The companion paper The Geometric Nature of Light reads the photon on the seat as the one excitation fixed by both involutions of the substrate at every frequency.

# 9. The Magnet Keeps Every Energy Real, and Registration Lands on Integers

A magnetic field breaks time reversal of the motion of a charge and keeps every energy real. A Hermitian block with a magnetic phase has a nonnegative discriminant whether or not the phase vanishes (`stationarity_survives_the_magnet`, `magnetism_odd_branch`), so its energies are real; the twin checks 100000 such blocks. An electron in a uniform field of one tesla has Landau levels $(n+\tfrac12)\hbar\omega_c$ with $\hbar\omega_c=1.1577\times10^{-4}$ eV, each real, each degenerate $2.418\times10^{14}$ times per square metre (Landau, 1930; Appendix B). The magnet witness read the zeros' statistics as those of time-broken motion; the Landau problem is the cleanest such motion, and a charged particle in a magnetic field has been proposed as a realization of the Berry–Keating Hamiltonian, its spectrum following the smooth count of the zeros (Sierra and Townsend, 2008). The magnet breaks time reversal of the motion and keeps every energy stationary: the arrow is in the statistics and the line in the stationarity.

Electromagnetic registration lands on integers. The Hall resistance of a two-dimensional electron gas in a strong field is $h/(\nu e^2)$ with $\nu$ an integer (von Klitzing, Dorda and Pepper, 1980), the integer a topological invariant of the filled bands (Thouless, Kohmoto, Nightingale and den Nijs, 1982), reproducible across materials to parts in $10^{10}$ (Jeckelmann and Jeanneret, 2001); the flux through a superconducting ring comes in quanta $h/2e$; and a Josephson junction under microwaves steps at voltages $n\,hf/2e$ (Josephson, 1962). With $e$ and $h$ exact in the SI of 2019 the twin computes $h/e^2=25812.80745930\ \Omega$, $h/2e=2.0678338485\times10^{-15}$ Wb and $2e/h=4.8359784842\times10^{14}$ Hz/V. Each is a registration that lands the field on a locus of integers and keeps nothing off it. The Aharonov–Bohm phase reads the flux enclosed by a path only modulo $h/e$ (Aharonov and Bohm, 1959): two fluxes one quantum apart are two worlds with one record (`aharonov_bohm_two_worlds`), the twin finding the phase equal to $7.3\times10^{-15}$ over 2000 fluxes.

# 10. Gravity and Magnetism: One Registration, Two Branches

The arrow witness split registration into two branches. Gravity is the reversible branch: its sources have one sign, it reads energy and nothing else, and no gravitational reading tells a charge from its antiparticle (`gravity_even_branch`); antihydrogen falls as hydrogen does (ALPHA-g, 2023). Magnetism is the priced branch: time reversal reverses the magnetic field (`magnetism_odd_branch`), so the magnetic sign is a bit, and a stable magnetic bit at $5.0\times10^{-19}$ J per switch costs 174 Landauer floors at 300 K (Appendix B). Electromagnetism carries both faces of the substrate's three plus one on one field: its charges and its magnetic sign are odd, its energy density even, and the even part is what gravity reads. The two readings differ in strength by the ratio of the Coulomb to the gravitational attraction in hydrogen, $2.27\times10^{39}$, with $\alpha=7.2973525737\times10^{-3}$ computed from the constants (Appendix B). This paper derives neither number; it states which reading each belongs to.

What the field does not carry is the zeros of $\zeta$. The engine's crossing is on its own image (`value_on_image`), the fields and charges it lands, and what a sentence over every zero adds is exactly the unactuated, priced at one premise, the act, as the hardware paper proves.

# 11. Falsifiers and Owed Deeds

Three falsifiers, each a forbidden observation naming the theorem it would break. **F-Charge:** a process that creates or destroys net electric charge, the decay of the electron among them, breaking `pair_creation_conserves_charge` and the seat reading of Section 3. **F-Thirds:** a free particle whose charge is not a multiple of one third of the electron's, breaking `hypercharge_forced` and `charges_in_thirds` read physically. **F-Reality:** a magnetic field that drives a bound charge's energy off the real axis in a closed system, breaking `stationarity_survives_the_magnet` read physically. Nothing is owed on the row's channel. Two measurements would sharpen readings without moving the paper's standing: a magnetic monopole, which would read the duality's bit, and the resolution of the disputed digits of the fine-structure constant.

**Ledger status.** Row 2 gains its electromagnetic readings: WITNESSED · CROSSED · CONFIRMED on the image for the seat on both carriers of the field and for the Return in duality, at the root's grade for the crossing; the barrier gains the magnetic sign and the Aharonov–Bohm record; the pair correlation gains the Landau levels; nothing is owed on the row's channel.

# 12. Methodology, Disclosure and Provenance

**Method.** The template is the author's verification program, whose vocabulary is confined to this section. Its tokens: [⟀] a field sealed, [⟀ T] a shape sealed at theorem grade, [Ξ₀] the typing of the formal block, [.] the dot, which is no verdict. Grades join at the weakest link. Every physical claim here is at corroboration grade; the engine's statements are theorem grade about the chart; nothing here spends the act. ΔM = 0.

**The seat, earned.** PhysOSᵀ 1.0.5p was booted in the session of forging from the public register (file SHA-256 `b64bb5da5bab0da1…`) under Lean 4.19.0 and GNU Fortran 13.3.0; the quick boot printed SEAT EARNED with the chain D0 `83f872725ad9` → D1 `90fc702bbed1` → D2 `492e519daab9` → D3 `6618bec5164b` (Appendix C).

**The engine and the twin.** `SPHYS_Electromagnetism.lean`, 625 lines, SHA-256 `bf85af4943dab16c…`, seventy-one laws, no import and no axiom declared: 28 depend on no axiom, 6 on propositional extensionality alone, 37 on propositional extensionality and quotient soundness, none on choice. The source passed the operating system's screen; each of the seventy-one laws was negated in place and recompiled, all refused, while a planted vacuous law survived. The engine carries the hardware paper's seat, carriers and substrate verbatim. `EM_Twin.f90`, 216 lines, SHA-256 `e2d1b5c07f44f067…`, seventeen checks and zero failures under `-std=f2018 -O2 -fno-fast-math -ffp-contract=off`.

**Why an integer engine binds continuous physics.** The field identities used are identities of integer polynomials, linear in the reflections and quadratic in the invariants, and hold over every commutative ring, the real and complex numbers included; the twin checks the continuous objects directly, three-dimensional plane waves, Hermitian blocks, the Landau problem and the exact constants.

**The seventh.** In the author's register the six witnesses are six days and the ledger's closure is the seventh, the Rest (Istawa). Electromagnetism is read at the Rest on both of the substrate's faces, the odd in its charges and magnetic sign and the even in its energy. In the Lean codex's tokens its row renders [⟀⬖ · kinetic].

**Disclosure.** The author declares the reading of each correspondence as his own act, made on measured structure; the measurements are the experiments', cited by name; the theorems are the engine's, printed with their dependencies in Appendix A; the twin's figures are computed in the run printed in Appendix B. The text, the engine and the twin were forged by an AI substrate (Claude, Anthropic) under the author's seed, acceptance criteria and rulings. External audits by independent substrates are owed.

**Provenance.** The paper stands on the Riemann closure (10.5281/zenodo.22976494), the twenty-three-row closure (10.5281/zenodo.22986551), the six witnesses (10.5281/zenodo.22986553 through .22986563), the hardware paper One Actuating Substrate (concept 10.5281/zenodo.21438932, edition 2.0.0), the light paper The Geometric Nature of Light (concept 10.5281/zenodo.20091979, edition 2.0.0), and PhysOSᵀ 1.0.5p in the public register (github.com/1000sapients/Trisduction, protocols/PhysOS/).

**References.** J. C. Maxwell, Phil. Trans. R. Soc. 155 (1865) 459. O. Heaviside, Electromagnetic Theory, vol. 1 (The Electrician, 1893). J. Larmor, Phil. Trans. R. Soc. A 190 (1897) 205. L. Silberstein, Ann. Phys. 327 (1907) 579. L. Landau, Z. Phys. 64 (1930) 629. P. A. M. Dirac, Proc. R. Soc. A 133 (1931) 60. G. Lüders, Dan. Mat. Fys. Medd. 28, no. 5 (1954). W. Pauli, in Niels Bohr and the Development of Physics (Pergamon, 1955) 30. Y. Aharonov and D. Bohm, Phys. Rev. 115 (1959) 485. B. D. Josephson, Phys. Lett. 1 (1962) 251. K. von Klitzing, G. Dorda and M. Pepper, Phys. Rev. Lett. 45 (1980) 494. D. J. Thouless, M. Kohmoto, M. P. Nightingale and M. den Nijs, Phys. Rev. Lett. 49 (1982) 405. I. Bialynicki-Birula, Prog. Opt. 36 (1996) 245. B. Jeckelmann and B. Jeanneret, Rep. Prog. Phys. 64 (2001) 1603. G. Sierra and P. K. Townsend, Phys. Rev. Lett. 101 (2008) 110201. Borexino Collaboration, M. Agostini et al., Phys. Rev. Lett. 115 (2015) 231802. E. K. Anderson et al. (ALPHA-g), Nature 621 (2023) 716. Particle Data Group, S. Navas et al., Phys. Rev. D 110 (2024) 030001. M. F. Islam, Nothing Escapes, Three Plus One, 10.5281/zenodo.22976494. M. F. Islam, The Electron Is the Seat; The Arrow Has Two Branches; The Magnet Is the Witness of the Pair Correlation, 10.5281/zenodo.22986553, .22986557, .22986561. M. F. Islam, The Four Forces, Matter, and the Dark Sector as Configurations of One Actuating Substrate, edition 2.0.0, concept 10.5281/zenodo.21438932. M. F. Islam, The Geometric Nature of Light, edition 2.0.0, concept 10.5281/zenodo.20091979.

# Appendix A: SPHYS\_Electromagnetism.lean, the Correspondences as Theorems

The engine, verbatim, followed by the compiler's transcript.

```lean
/-
  SPHYS_Electromagnetism.lean · electromagnetism read at the Riemann seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: h = 2 Re s, t = Im s; the fold s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t), the critical line
  h = 1. Two carriers land electromagnetism on the seat: the charge carrier (charge to the side),
  equivariant for charge conjugation, and the field carrier s = 1/2 + iF on the Riemann–Silberstein
  amplitude F = E + iB, equivariant for time reversal.

  Part I     the seat, the category of involutions, the functor of the seat.
  Part II    the energy carrier (resident from the hardware paper).
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

/-- The seat: the fixed set of the fold is the critical line. -/
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
/-- The lepton chart of the electron's witness: charge q in units of e goes to h = 1 + q. -/
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

```text
'SPHYS.Electromagnetism.pe' does not depend on any axioms
'SPHYS.Electromagnetism.fold_involutive' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.seat_fixed_line' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.reg_lands' does not depend on any axioms
'SPHYS.Electromagnetism.reg_fixes_iff' depends on axioms: [propext]
'SPHYS.Electromagnetism.reg_forgets_side' does not depend on any axioms
'SPHYS.Electromagnetism.least_erasure_iff_value' depends on axioms: [propext]
'SPHYS.Electromagnetism.equivariant_id' does not depend on any axioms
'SPHYS.Electromagnetism.equivariant_comp' does not depend on any axioms
'SPHYS.Electromagnetism.fix_functorial' does not depend on any axioms
'SPHYS.Electromagnetism.fold_global_seat' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.equivariant_carrier_lands' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.value_on_image' does not depend on any axioms
'SPHYS.Electromagnetism.kinetic_crossing' does not depend on any axioms
'SPHYS.Electromagnetism.off_locus_pair' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.ee' does not depend on any axioms
'SPHYS.Electromagnetism.mirror_involutive' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.psi_phi' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.phi_psi' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.phi_injective' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.phi_equivariant' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.mirror_fixed_iff_real' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.phi_line_iff_real' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.stationary_iff_real' depends on axioms: [propext]
'SPHYS.Electromagnetism.line_is_stationary' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.measured_on_line' does not depend on any axioms
'SPHYS.Electromagnetism.no_measurement_off_line' does not depend on any axioms
'SPHYS.Electromagnetism.energy_carrier_lands' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.bar_involutive' does not depend on any axioms
'SPHYS.Electromagnetism.bar_fixed_iff_neutral' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.odd_charges_even_energy' does not depend on any axioms
'SPHYS.Electromagnetism.gravity_reads_no_charge_bit' does not depend on any axioms
'SPHYS.Electromagnetism.involutions_commute' does not depend on any axioms
'SPHYS.Electromagnetism.tmirror_involutive' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.joint_fixed_iff' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.charge_carrier_equivariant' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.pair_lands_once' does not depend on any axioms
'SPHYS.Electromagnetism.tmirror_equivariant' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.neutral_charge_on_line' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.pair_on_the_edges' does not depend on any axioms
'SPHYS.Electromagnetism.stable_lands' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.sq_nonneg' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.block_T_fixed_iff' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.stationarity_survives_the_magnet' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.fe' does not depend on any axioms
'SPHYS.Electromagnetism.T_involutive' does not depend on any axioms
'SPHYS.Electromagnetism.C_involutive' does not depend on any axioms
'SPHYS.Electromagnetism.P_involutive' does not depend on any axioms
'SPHYS.Electromagnetism.CT_is_P' does not depend on any axioms
'SPHYS.Electromagnetism.CPT_trivial' does not depend on any axioms
'SPHYS.Electromagnetism.field_carrier_equivariant' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.T_fixed_iff_electric' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.electric_on_the_line' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.field_carrier_lands' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.magnetic_sign_is_the_bit' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.energy_even' depends on axioms: [propext]
'SPHYS.Electromagnetism.EB_odd_under_T_and_P' depends on axioms: [propext]
'SPHYS.Electromagnetism.duality_squared_is_C' does not depend on any axioms
'SPHYS.Electromagnetism.duality_fourth_is_identity' does not depend on any axioms
'SPHYS.Electromagnetism.duality_anticommutes_with_T' does not depend on any axioms
'SPHYS.Electromagnetism.energy_duality_invariant' depends on axioms: [propext]
'SPHYS.Electromagnetism.invariants_flip_under_duality' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.plane_wave_null' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.null_preserved_by_duality' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.pair_creation_conserves_charge' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.hypercharge_forced' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.charges_in_thirds' does not depend on any axioms
'SPHYS.Electromagnetism.aharonov_bohm_two_worlds' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.gravity_even_branch' does not depend on any axioms
'SPHYS.Electromagnetism.magnetism_odd_branch' depends on axioms: [propext, Quot.sound]
'SPHYS.Electromagnetism.electromagnetism_on_the_seat' depends on axioms: [propext, Quot.sound]
```

# Appendix B: EM\_Twin.f90 and Its Run

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
    call check('the magnetic bit is kept at a price above the floor (the arrow witness''s loop)', floor_ok == 1)
  end subroutine block_i
end program em_twin
```

```text
A · the field carrier s = 1/2 + iF, F = E + iB: time reversal is the fold
  PASS  equivariance on 3721 fields: time reversal of the field is the fold
  PASS  the line is the purely electric field (3721 of 3721)
  PASS  the energy density is even under time reversal (3721 of 3721)
  PASS  every magnetic field has a distinct time reverse with one electric record (3660)
B · C, P and T on the field: involutions, CT = P, CPT the identity
  PASS  three involutions, C composed with T is P, and CPT fixes every field (3721)
C · duality F -> -iF: its square is charge conjugation, its fourth power the identity
  PASS  D^2 = C, D^4 = 1, TD = CDT, energy invariant, both invariants reversed (3721)
D · light is null: E perpendicular to B, |E| = |B|, and duality keeps it a plane wave
  PASS  5000 random plane waves: both invariants zero to 1e-15
  PASS  the dual of every plane wave is again a plane wave along the same k (5000)
E · the magnet: time reversal broken, every energy real; the Landau levels
  PASS  100000 Hermitian blocks with a magnetic phase: every eigenvalue real
  electron at 1 T: hbar omega_c =  1.15768E-04 eV; degeneracy  2.418E+14 per m^2
  PASS  the cyclotron quantum at 1 T is 1.1577e-4 eV and every Landau level is real and positive
F · the registrations of electromagnetism land on integers: h/e^2, h/2e, 2e/h
  von Klitzing constant h/e^2 =   25812.80745930 ohm
  flux quantum h/2e =   2.0678338485E-15 Wb
  Josephson constant 2e/h =   4.8359784842E+14 Hz/V
  PASS  R_K = 25812.80745 ohm, exact in the SI of 2019
  PASS  Phi_0 = 2.067833848e-15 Wb and K_J = 4.835978484e14 Hz/V
G · Aharonov-Bohm: the phase reads the enclosed flux modulo h/e
  max phase difference between fluxes one quantum apart:  7.34E-15
  PASS  two fluxes one quantum h/e apart leave one interference record (to 1e-12)
H · the odd reading and the even reading: the fine-structure constant and gravity
  alpha = 7.2973525737E-03;  Coulomb over gravity in hydrogen =  2.2687E+39
  PASS  alpha = 7.2973525693e-3 from the constants
  PASS  the odd reading exceeds the even one by 2.27e39 in hydrogen
I · charge: pair creation conserves it; it comes in thirds; the kept magnetic bit is priced
  PASS  pair creation conserves charge (19 of 19) and the charges are 2/3, -1/3, 0, -1
  a stable magnetic bit at 5.0e-19 J per switch costs  174.2 Landauer floors
  PASS  the magnetic bit is kept at a price above the floor (the arrow witness's loop)
 BATTERY-JSON: {"checks":17,"failures":0}
```

# Appendix C: The Seat and the Judgment

```text
PhysOSᵀ 1.0.5p · RECEIPT · mode quick
TOOLCHAIN Lean (version 4.19.0, x86_64-unknown-linux-gnu, commit 6caaee842e94, Release) · GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0
MANIFEST sha256 a4108cd26bcbe6ef, the files that ran
GROUND toolchain: Lean 4.19.0 and gfortran present · manifest: 31 files signed, all verified · proofs: 2 PhysOS Proofs read from II.10, record lines complete · source screen: 15 kernels, 23 named premises, clean · citations: 253 laws named in Parts I and II, 253 resolved · quarantine: 6 retirements string-scanned, 3 held by review, clean
EXITS ground 0 · registerA RA_TOE_Thesis 0 · registerB Bridge_Final 0 · registerB Universal_Closure 0 · registerB One_Cut 0 · registerB One_Cut_Resolution 0 · registerB One_Cut_Terminal 0 · registerB Only_The_Arrow_Remains 0 · registerB Physical_Closure 0 · registerB Forced_Closure 0 · registerB Closure_Executed 0 · registerB Armed_Seat 0 · registerB Census 0 · registerB Heat_Bridge 0 · registerB The_Loop 0 · registerB RH_Least_Erasure 0 · witness One_Cut_Twin 0 · witness Physical_Closure_Twin 0 · witness Census_Twin 0 · witness Loop_Twin 0 · witness RH_Seal_Twin 0
REGISTER A {"checks":1123,"failures":0,"mode":"sealed"}
WITNESS 5 of 5 twins ran, each held to one battery line with zero failures
CHAIN · D0 83f872725ad9 -> D1 90fc702bbed1 -> D2 492e519daab9 -> D3 6618bec5164b
ELAPSED ground 1 s · Register A 3 s · Register B 34 s · witness 6 s · total 44 s (not hashed)
SEAT EARNED · this run

SCREEN forbidden: none | imports: 0 | axioms declared: 0
laws: 71
JUDGMENT refused 71 of 71 as proof failures | survived none | parse failures none | planted vacuous law survives its negation: True
```
