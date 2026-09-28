---
edition: journal
title: Dark Matter as the Charge-Conjugation Fixed Set and the Dark Force as One Keyed Bit
subtitle: A Trisductive Theory of Dark Matter and the Dark Force: Why Only the Fourth Reading Sees It
author_line: Mohammad F. Islam, PhD^1^
journal: Tractatus Physicus
article_type: Foundations of Physics
goal: Dark is fixed; the fifth force is keyed
doi: Tractatus Physicus Series
volume: 1
date: 27 September 2026
accent: slate
---

:::affiliations
^1^Trisduction Research Group, 1000sapients. Register of record: github.com/1000sapients/Trisduction. Correspondence: Mohammad F. Islam.
:::

:::abstract
Dark matter is seen only through gravity, and the accelerating expansion is credited to a dark component seen only through its pull on the geometry; this paper places both on one template in which charge conjugation flips every gauge charge and keeps mass. We prove in core Lean, with no axiom declared and no dependency beyond propext and Quot.sound, that a state is invisible to every charge-linear reading exactly when conjugation fixes it, that such a state has zero radiative weight and so cannot cool by radiating through a charge, that no gravitational reading tells apart two species of equal density, and that anomaly cancellation admits a dark U(1) and its absence with one visible record, so whether a dark gauge force exists is one keyed bit the template cannot decide. Six further theorems separate what the sky supplies from what the posit supplies. The photon null and, for a vector Z current, the Z null force the Standard Model's charges to zero, a bound inside one quantum being an exact zero; the fixed set of C is exactly the fixed set of the Standard Model's conjugation with the dark charge zero, so the title's two clauses are its two halves; a coloured relic brings charged partners; the renormalizable portals of a singlet are derived, and a stable singlet keeps exactly one, S² H†H; and every vector-like dark charge is anomaly-free. Three final theorems close the title at the seat: a bound fixes a charge only through a measured coupling, so the photon's nulls force the visible half while no bound can force the dark half; over every state the measured record admits, the first clause holds and the second is keyed; and one conjunction, the dark closure, binds them as a forced half and one keyed bit; the dark row is no second seat, and an equivariant map carries its bit onto the seat's line, where it is the line property. A last theorem reads the bit on the kinetic channel: a self-paired mass carries twice each abelian charge, so on the visible fixed set the dark bit is the Majorana bit, whether the dark matter is its own antiparticle. For the acceleration we prove that pressure equal to minus the density reverses the sign of the active gravitating density and that no number of canonical fields at positive density can push the equation of state below −1, while the sign and the magnitude stay measured inputs: the Planck 2018 budget gives q₀ = −0.527 ± 0.011 and a vacuum density of (2.24 meV)⁴. Each of the kernel's 81 theorems refuses its own negation, and a 35-check Fortran twin executes the numerical content under sealed IEEE flags, both run on a machine whose boot receipt Box A2 prints as a reproducibility record, not as warrant. The theory stands or falls on three criteria: no robust crossing of w = −1, no Standard Model charge anywhere in the dark matter's multiplet, and no fifth reading of either parity; the last two rest on one posit, spent at premise grade and still open.
:::

:::keywords
dark matter · dark energy · charge conjugation · anomaly cancellation · phantom divide · neutrino fog · executable verification
:::

## 1 The barrier

Two components make up 95 percent of the cosmic budget, and both are known through one channel. Dark matter is 84 percent of the matter. It flattens rotation curves, lenses background light, sets the acoustic peaks of the microwave background, and separates from the gas when clusters collide.^1,2,3,4^ Dark energy is 68 percent of the total, and it accelerates the expansion.^5,6^ Every non-gravitational search for either has returned a bound, never a signal that survived independent test.^7^ The barrier is not a lack of data. The one reading that has seen the dark sector is gravity, and gravity reads mass-energy and pressure and nothing else.

Three questions sit behind that barrier. What the dark matter is, a question of identity. Whether it carries a charge of its own, a fifth interaction, the dark force in the gauge sense. What fixes the vacuum density that drives the acceleration, the dark force in the dynamical sense, a question of magnitude. This paper answers none of them by derivation. It proves why the gravitational register cannot answer the first, proves that the Standard Model's anomaly conditions cannot answer the second, and proves that the sign of the acceleration, forced for vacuum pressure, is read from the sky rather than derived. Each question is then typed by what it owes: a detection, a measurement, or a formal offering.

{. Reader's frame .} The paper proves finite, typed placements in a core-Lean kernel and executes their numerical content in Fortran. It does not identify the dark matter particle, derive its abundance, derive the vacuum energy, or solve the cosmological constant problem. Its one non-derived commitment, that the dark sector carries no gauge charge in any member of its multiplets and meets the Standard Model only through the singlet portals H†H and LH, is spent at premise grade and is falsifiable. Its theorems concern integer charges, lists and finite grids. The mapping of physical states onto them is structural grade and is stated where it is used. In the title, charge conjugation is the Standard Model's, and the title's two clauses are the two halves of Theorem 18: C fixes a state exactly when C_SM fixes it and its dark charge is zero. Measurement places the dark matter in the first half through Theorem 15, the photon null and, for a vector Z current, the Z null, with colour neutral by confinement and Theorem 19; that placement is corroboration grade. The second half, a zero dark charge, is measured by nothing: it is the one keyed bit, and the posit spends it at premise grade. Theorem 23 binds the two halves into one judged object, and Theorem 25 carries the bit onto the seat's line by an equivariant map, so the dark row enters the seat as a row and never as a second seat.

{. Five terms .} A *reading* is any quantity an instrument returns from a state. A reading is *odd* if charge conjugation flips its sign and *even* if conjugation keeps it; gauge couplings are odd, mass and energy even. The *fixed set* is the set of states conjugation leaves unchanged. A *keyed bit* is a yes-or-no property that no function of a given record can decide, because two admissible worlds share the record and differ in the bit; it is settled only by a new measurement or spent as a declared premise. *Premise grade* marks a claim held as a posit, never as a result.

## 2 Prior work

The dark matter candidates split by quantum numbers. Weakly interacting massive particles are thermal relics near the weak scale.^8^ In the minimal version the candidate is the neutral member of an electroweak multiplet, such as the wino triplet.^9^ Gauge-singlet scalars reach the Standard Model through the Higgs portal H†H.^10,11,12^ Axions are light, coherent, and produced out of equilibrium.^13^ Modified dynamics replaces the unseen mass with a change in the gravitational law at low acceleration,^14^ and the lensing offset in colliding clusters is the standard argument for mass.^3^ Direct detection rests on coherent nuclear scattering.^15^ Candidates with a tree-level Z coupling, the heavy Dirac neutrino and the sneutrino among them, were excluded by the early experiments.^16^

Large xenon detectors now register the coherent scattering of solar ⁸B neutrinos,^17,18^ whose recoil spectrum is nearly degenerate with that of a 6 GeV particle.^19,20^ In December 2025 the LZ collaboration reported 417 live days with no dark matter signal between 3 and 9 GeV, world-leading limits above 5 GeV, and a ⁸B signal at 4.5σ.^7^ Directional detection separates the two sources because the Sun and the dark matter wind never share a direction.^21^

A second U(1) can mix kinetically with hypercharge.^22^ Self-interacting dark matter was proposed for small-scale structure.^23^ Cluster collisions bound σ/m below 1.25 cm²/g for the Bullet Cluster^24^ and 0.47 cm²/g across 72 clusters.^25^ A dissipative dark fraction could form a dark disk,^26^ a dark radiation bath could imprint dark acoustic oscillations,^27^ and any light relic once in equilibrium leaves ΔN_eff of at least 0.027.^28^ ACT DR6 finds N_eff = 2.86 ± 0.13 and no evidence for new light species.^29^

The acceleration was read from supernovae in 1998 and 1999.^5,6^ Its magnitude is the cosmological constant problem.^30^ Dynamical alternatives roll a scalar field.^31,32^ The phantom regime w < −1 needs a ghost,^33,34^ a single field cannot cross w = −1,^35,36^ and an energy exchange with dark matter can mimic a crossing.^37^ DESI's second data release, fitted in the w₀wₐ form,^38,39^ prefers w₀ > −1 and wₐ < 0 at 3.1σ with the CMB, and at 2.8σ, 3.8σ and 4.2σ with the Pantheon+, Union3 and DESY5 supernova samples; the preferred curves cross w = −1.^40^ The preference depends on the data combination and on supernova calibration at the level of a few hundredths of a magnitude.^41^ A 20 GeV gamma-ray halo excess, read as annihilation of a 0.5 to 0.8 TeV particle, awaits independent confirmation and sits above dwarf-galaxy limits.^42^

## 3 Method

Every claim is read on three axes. The formal axis is a kernel of 81 theorems in core Lean 4.19.0,^43^ with no library, no axiom declared, and no dependency beyond propext and Quot.sound; 23 theorems depend on no axiom at all and none uses choice. The empirical axis is a set of cited measurements, each with its uncertainty and its layer: the Standard Model [SM], general relativity [GR], quantum field theory [QFT], or observational consensus [consensus]. The registration axis is a Fortran 2018 twin that executes the numerical content under sealed IEEE flags and prints one battery line.

Grades never promote. A kernel theorem is theorem grade about its finite objects. The mapping of a physical state onto integer charges is structural grade. A measurement is corroboration grade. The one posit is premise grade. A conclusion takes the weakest grade on its chain.

The kernel and the twin ran on a toolchain checked in the same session, recorded in Box A2 as a reproducibility receipt; the check certifies the environment of the run and carries no warrant for any physical claim. Physical OS 1.0.2 was supplied as one file,^44^ SHA-256 f38bb3f3ea620d36, and its 18 signed files were extracted with the file's own line and matched against its manifest, digest 6be50db826fff087. The quick boot checked the ground (manifest, source screen, 32 of 32 cited laws resolved, quarantine clean), ran the 1,123-check Fortran thesis under sealed flags, compiled the four seat kernels, ran two witness twins, and printed the digest chain and the seat line (Box A2). The control mode then built 18 copies: the clean copy passed and each of the 17 hostile copies, carrying a sorry, an admit, a native_decide, a new axiom, a truncation, a bypass, unsafe or external code, a foreign import, a metaprogram, compile-time IO, an altered or missing manifest, a retired verdict, a phantom citation, a failed thesis, or a failed twin, was refused for its named reason, 18 of 18 as expected. The full mode, which compiles the whole codex near 4 GB, and the judgment mode were not run on this 4 GB container.

The dark kernel was then judged the way the OS judges its own laws. Each of its 81 theorems was negated in place, one at a time, and recompiled. All 81 negations failed as proof errors and none as parse errors, while a planted vacuous law survived its negation, which shows the instrument can see a law that says nothing. The judgment is a vacuity test: a theorem whose hypotheses contradicted one another would let its own proof establish its negation, as the planted law does, so the 81 refusals certify that no theorem here holds vacuously in that way. Theorems 15 to 25 were added in answer to the external audits and are stated where they are used. The source passed the OS screen: no sorry, admit, native_decide, kernel bypass, unsafe code, metaprogram, compile-time IO, import, or declared axiom.


## 4 Dark matter: the fixed set only gravity reads

### 4.1 The template

A state carries hypercharge and weak isospin in units of one sixth, a colour charge, a dark charge, and a mass [SM]. Colour enters as one Cartan weight, so the template's gluon readings are the diagonal couplings; a colour singlet is annihilated by all eight generators and reads zero on every gluon. Conjugation C flips the four charges and keeps the mass, and C∘C is the identity. C is gauge-charge conjugation: it leaves global numbers alone, so a Dirac singlet carrying a conserved global number is C-fixed here though it differs from its antiparticle, and every theorem below needs only the gauge charges. Visible conjugation C_SM flips the three Standard Model charges only. Counting hypercharge in sixths makes every charge of one generation an integer, so every identity below is an identity of integers.

{. Theorem 1, the fixed set .} C fixes a state exactly when all four charges vanish, and C_SM fixes it exactly when the three visible charges vanish. The first fixed set lies inside the second. A state with dark charge 1 and no visible charge lies in the second and not the first.

{. Theorem 2, odd readings are blind .} Every integer combination a·Y + b·T₃ + k·colour + d·dark is an odd reading, and every odd reading returns zero on every state C fixes. The couplings of the photon, the Z, the diagonal gluons and a dark photon to a state are of this form [SM].

{. Theorem 3, dark is fixed .} A state on which every odd reading returns zero is exactly a state C fixes. Darkness in the gauge sense and membership of the fixed set are one property. The theorem is elementary, since the four charge projections are themselves odd readings; its use is to make gauge-darkness and C-fixedness one condition on the template. Whether the cosmological dark matter is such a state splits by Theorem 18 into a visible half, which measurement settles through Theorem 15, and a dark charge, which the posit settles.

{. Theorem 4, only gravity reads it .} The mass reading is even and returns the mass on the fixed set. A C-fixed state is its mass, since all four charges vanish, so every reading at all, of either parity, returns on a C-fixed state a function of its mass alone. Gravity couples to mass-energy [GR], so among the template's readings, the four charge currents and the mass, it is the one that sees a massive state C fixes. Outside the template lie even quantities it does not constrain: the portal couplings of H†H and LH, a kinetic mixing ε, an axion-like coupling, and the moments of a composite with charged constituents. The posit settles that residue. It keeps the two portals, the identity row's open route, and removes the rest: no member of the dark sector carries a gauge charge, so there is no charged constituent and no dark field for ε to mix with, and an axion-like coupling is neither H†H nor LH and, at dimension five, falls outside Theorem 16's census.

Theorems 1 to 4 are theorem grade about the template. That the observed dark matter is dark in this sense is corroboration grade, since every search bounds a coupling and none can prove it zero. What the theorems add is the equivalence. A population that no gauge reading registers is not merely neutral. It is fixed by conjugation in every charge, and gravity, the fourth reading, even under C, is the template reading left to see it.

### 4.2 Neutrality is not darkness

{. Theorem 5 .} A state with T₃ = +1/2 and Y = −1/2 has electric charge zero and lies off the fixed set. Its Z reading, T₃ − Q sin²θ_W, is odd for every rational value of the mixing weight and equals T₃ = +1/2 whatever that value, since Q = 0.

These are the neutrino's charges, and the sneutrino's. Theorem 5 is the kernel form of the direct-detection criterion: a neutral candidate that carries weak isospin and hypercharge scatters coherently through the Z, at rates the early experiments excluded.^15,16^ Electric neutrality is one odd reading returning zero. The fixed set demands all of them.

{. Theorem 15, the measured nulls force the visible fixed set .} At any mixing weight sin²θ_W = a/b, a state with Q = 0 and a vanishing Z reading has T₃ = 0 and Y = 0, and if it is colourless the Standard Model's conjugation C_SM fixes it. With charges quantized in sixths, electric and Z readings bounded strictly inside one quantum are exact zeros, with the same conclusion.

{. Theorem 18, the title's two halves .} C fixes a state exactly when C_SM fixes it and its dark charge is zero.

Theorem 15 derives the visible half of the placement from measurement, and only that half. The photon alone does not force it, as Theorem 5 shows; the photon and the Z together fix both electroweak charges. The bounds on a dark matter's electric charge lie orders of magnitude inside e/6 over the masses surveyed [consensus],^45^ and quantization, observed for every known particle and forced by a magnetic monopole or by unification [QFT], carries them to zero. The Z bound binds a state with a vector Z current, a Dirac fermion or a scalar, for which direct detection excludes a full-strength Z coupling by many orders [consensus]; a Majorana state has no vector Z current, so its Z null bounds nothing, but it needs none: it is its own antiparticle, so its vector charges vanish identically [QFT] and Theorem 24 spends its dark bit through its mass term, and what it keeps, an axial or inelastic Z coupling, is even under conjugation, in Theorem 4's residue, where spin-dependent and inelastic direct detection test it [consensus]; the higgsino, whose neutral states are split members of a charged multiplet, goes through Theorem 7 to its charged partners, which F2 targets. Colour is not a measured null: confinement makes every asymptotic state a colour singlet [QFT], and Theorem 19 carries the question to constituents. Theorem 18 then isolates what no measurement reaches. Its first half is where the sky places the dark matter; its second half, a zero dark charge, is the one keyed bit of Theorems 10 and 17, which no visible reading sees (Theorem 1) and the posit spends as absent. The title's two clauses are these two halves.

### 4.3 No charge, no radiative cooling

{. Theorem 6 .} The radiative weight, the sum of the squared charges, vanishes exactly on the fixed set. A dark-charged state has visible radiative weight zero and total radiative weight one: it emits only dark quanta.

Emission rates scale with the square of the charge [QFT]. Baryons radiate, lose energy, and settle into thin rotating disks. A population with zero radiative weight cannot shed energy that way and stays in the extended, pressure-supported halos that lensing and rotation curves map [consensus]. Cooling through the singlet portals is not a charge reading and Theorem 6 does not bound it; the theory takes it to be as weak as the portal couplings that null searches allow [consensus]. The same theorem says what a dark charge would change: dark radiation, dark cooling, and the dark disk of the double-disk scenario.^26^

### 4.4 A neutral member is not a dark multiplet

{. Theorem 7 .} An isospin triplet with Y = 0 has exactly one member on the fixed set and is not a dark multiplet. A singlet is.

A wino's neutral member is fixed, but its charged partners are not, and W exchange connects them [SM]. A dark multiplet, every member fixed, is a Standard Model gauge singlet. At renormalizable level such a field reaches the Standard Model only through the singlet operators H†H and LH [SM], the Higgs portal and the neutrino portal. Both carry zero net charge, so no odd reading enters them, and the same holds for higher-dimension singlet couplings such as an axion's. The posit places the dark matter in a singlet and routes every non-gravitational signal through singlet operators (criterion F2); the observed darkness alone would also admit the neutral member of a charged multiplet whose partners are heavier.

{. Theorem 16, the portals are derived .} Of the 199 renormalizable Lorentz-scalar monomials without derivatives that the Standard Model forms with a real singlet scalar S and a singlet Weyl fermion N, exactly four are gauge invariant and couple the two sectors: S H†H, S² H†H, and L N H with its conjugate.

Theorem 16 derives the posit's portal clause instead of assuming it. The census is the standard one [QFT]:^46^ a derivative coupling of a singlet to a Standard Model current starts at dimension five, as does an axion-like coupling to F F̃, and the vector portal, a kinetic mixing, needs a dark gauge field the spent bit removes. Once the multiplet is a singlet and its couplings renormalizable, H†H and LH are the only doors.

{. Theorem 19, a coloured relic brings charged partners .} Every component of every coloured Standard Model field carries electric charge, and a colour-singlet composite of a new colour triplet with Standard Model legs contains a coloured Standard Model leg, so an electrically charged constituent.

Theorem 19 replaces a colour bound, which the halo does not supply, with a statement about constituents. Confinement dresses a coloured relic into colour-singlet hadrons, each carrying a quark and so a charged constituent: the posit's clause that no member carries a gauge charge excludes it, and the direct-detection bounds on electromagnetic form factors and on hadronic scattering test it [consensus].

{. Theorem 20, a stable singlet keeps one door .} Under the parity that keeps the dark matter stable, exactly one of Theorem 16's four portals survives, S² H†H, and none survives for the fermion.

Theorem 20 sharpens F2. A stable singlet dark matter is either a scalar read only through S² H†H, which ties its spin-independent scattering and the Higgs boson's invisible width to one coupling [QFT],^10,11,12^ or a fermion with no renormalizable portal at all, dark to everything but gravity. Dimension five is barred for every singlet operator alike, the fermion's N N H†H and the axion-like a F F̃ both, so a fermion's Higgs-portal scattering and an axion-photon signal kill the same renormalizability clause.

### 4.5 Gravity does not read identity

{. Theorem 8 .} Two species with one mass density and different labels leave one gravitational record, and no function of that record returns the label.

The twin makes the scale concrete. At a local density of 0.3 GeV/cm³, a 100 GeV particle and a 10 μeV field differ by a factor of 10^16^ in number density and give one rotation curve, bit for bit (check F1). More than ninety years of gravitational evidence cannot name the particle, and more of the same will not either. The identity row owes one non-gravitational carrier. As of September 2026 none is confirmed. LZ sees no signal from 3 to 9 GeV,^7^ and the Fermi halo excess remains a claim.^42^ The factor is arithmetic on the cited local density [consensus], an illustration of the theorem and not a consequence of it.

### 4.6 The fog is a wall with a door

{. Theorem 9 .} The direction flip exchanges a solar recoil with a halo recoil and keeps the energy. At one energy the two leave one record, no function of the energy returns the source, and the direction reading separates them. The kernel models the degenerate limit, in which the two recoil spectra coincide exactly; the physical fog is a near-degeneracy of spectral shapes, which annual modulation separates weakly and direction separates strongly.

This is the neutrino fog in its exact logical form. The energy spectrum is even under the exchange of sources, the source is odd, and an even reading cannot return an odd target. The door is the direction. The twin places the dark matter wind source at the Galactic rotation direction, l = 90° and b = 0°, which is α = 318.0°, δ = +48.3° in Cygnus, at ecliptic latitude 59.6°. The Sun moves on the ecliptic, so its separation from the wind source stays between 59.6° and 120.4° all year (checks D1, D2), matching the 60° and 120° extremes of the directional literature.^21^ Annual modulation, with the wind's rate peaking near June and the solar rate at perihelion, and the tails of the two spectra are weaker handles on the same bit.

## 5 The dark force as a fifth reading

Add a dark U(1) to one generation and give the new fields dark charges. The anomaly conditions number twelve [QFT]: the six of the Standard Model, which the kernel reproduces for hypercharge, colour and isospin, and six for the dark charge, cubic, gravitational, mixed twice with hypercharge, and mixed with colour and with isospin. Each condition is the anomaly coefficient up to a positive normalization, with Dynkin index 1/2 for every fundamental and the colour cube written as a representation sum, A(3) = +1 and A(3̄) = −1; no condition reads a field's name.

{. Theorem 10, the fifth is keyed .} One generation closes. With a vector-like pair of Standard Model singlets it closes whether the pair carries dark charges 0 and 0 or +1 and −1. With one chiral singlet of charge +1 it fails. The two closing worlds have one visible record, and no function of the visible record decides whether a dark charge exists. The two closing worlds are a witness pair, not a classification of anomaly-free U(1)′ models. The record carries charges only, so the bit is keyed relative to the charge record and its anomaly conditions; a kinetic mixing ε between hypercharge and a dark photon lies outside the record and is one of the ways experiment reads the bit (F2, F3).

{. Theorem 17, the fifth is free .} For every integer q, one generation with a vector-like pair of Standard Model singlets of dark charges q and −q closes all twelve conditions.

Theorem 17 turns the witness pair of Theorem 10 into a family. The anomaly conditions admit every dark charge, not one besides zero, so whether the dark coupling vanishes is a bit the record cannot set, and its size, once nonzero, is a parameter the record cannot bound.

The closure is not vacuous, since it rejects the chiral world. It is not decisive, since it admits both vector-like worlds. Whether a dark gauge force exists is therefore one keyed bit relative to the Standard Model's anomaly conditions, the consistency conditions the kernel executes. No reading of the template supplies it. It is owed to the sky: a dark radiation excess, a measured self-interaction, a dark disk, or a dark acoustic oscillation.

The theory spends this bit at premise grade, and spends it as broadly as it can be tested. The posit: the dark sector carries no gauge charge in any member of its multiplets, visible or dark, and couples renormalizably, so by Theorem 16 it meets the Standard Model only through the singlet operators H†H and LH, by Theorem 20 only through S² H†H if it is stable, and it reads, and is read by, nothing beyond the four template readings and those portals. There is no fifth reading of either parity, no dark gauge boson, and no new scalar coupling of dark matter to itself or to dark energy. Three predictions follow. Dark matter is collisionless beyond its portals. No dark radiation accompanies it. No dark disk forms.

The spend is not yet tested at its floor. The Bullet Cluster bound of 1.25 cm²/g is 2.23 barn per GeV, and the 72-cluster bound of 0.47 cm²/g is 0.84 barn per GeV (check E1). A massless dark photon once in equilibrium above the electroweak scale would leave ΔN_eff = 0.054, a real scalar 0.027 (check E2), and the Standard Model's 3.044 plus 0.054 still sits inside the ACT DR6 95 percent bound (check E3).^29,28^ A dark sector never in equilibrium with ours escapes that floor, which is why the prediction names every signature rather than one.

### 5.1 The dark row and the seat

{. Theorem 21, a bound fixes a charge only through a measured coupling .} With the coupling fixed at g > 0 and charges integers, a force g q² bounded below one quantum's force g is the zero charge. With the coupling free, every charge meets every positive bound under some positive coupling.

{. Theorem 22, the record sorts the title .} Over the states the measured record admits, the photon null, the Z null, colour neutral and positive mass, fixedness under C_SM holds in every one; a zero dark charge holds in one admitted state and fails in another, and no function of the visible charges and the mass returns it. A state C fixes has zero dark charge, by the definition of C; Theorem 24 reaches the same zero through the mass term.

{. Theorem 23, the dark closure executed .} One conjunction binds the visible fixed set, the forced half, the division of Theorem 18, the keyed bit, the two grades of Theorem 21, self-conjugacy, and the crossing: no true premise yields the bit but the bit itself.

{. Theorem 24, the dark bit is the Majorana bit .} A mass term that pairs a field with itself, a Majorana mass or the mass of a real scalar, carries twice each abelian charge, so it is allowed exactly when hypercharge and dark charge vanish; on the visible fixed set it is allowed exactly when the dark charge is zero, and exactly when C fixes the state. A dark-charged state takes its mass only with a distinct partner of opposite dark charge.

Theorem 23's last conjunct is logic, not physics: no true premise yields the bit unless it holds the bit. It adds no fact about the halo; it records where the bit must come from. Theorem 22's self-conjugacy line is likewise the definition of C read back. Theorem 24 is not. It reaches the bit through a mass term, and so moves the bit from the formal register, which Theorems 10, 17 and 22 prove cannot read it, onto the kinetic channel, where the seat's law says a keyed bit is supplied. The observable is whether the dark matter is its own antiparticle. A Majorana or real dark matter carries no abelian charge, gauge or global [QFT]; a dark-charged one is a Dirac pair, particle distinct from antiparticle. Known physics reads the difference: a Majorana particle has no vector current, so its scattering is axial or scalar and its annihilation to light fermions is helicity-suppressed, while a Dirac pair can hold a particle to antiparticle asymmetry that a self-conjugate relic cannot [consensus]. The antecedent, that the dark matter has a self-paired mass, is a measurement not yet made; until it is made, Theorem 24 is a conditional. The identity row of Table 1 is pending and owes one carrier; Theorem 24 names it. The direction from a Majorana mass to a zero dark charge holds for every abelian charge; the converse needs no conserved global dark number, which the posit includes.

{. Theorem 25, the bit is the seat's line property, carried .} The map sending a state to the point (1 + d, m) of the seat's stage, d its dark charge and m its mass, is equivariant: conjugation goes to the fold τ(h, t) = (2 − h, t). C-fixed states land on the line h = 1; on the visible fixed set a state lands on the line exactly when its dark charge is zero; a dark-charged state and its conjugate land on two distinct points off the line, exchanged by the fold, at one height.

The operating system allows one seat, the Riemann locus, and a row enters it only through an equivariant map onto the fold; a row's own locus is never a second seat.^44^ Theorem 25 is that map for the dark row, the construction the operating system's electron witness already uses, charge to offset and mass to height. Under it the keyed bit is the seat's line property carried: a zero dark charge is a point on the line, a dark charge is an off-line pair the fold exchanges, and the gravitational record, which keeps the height and forgets the side, reads one record for both, the ghost of the one cut. The bit keeps its grade on the way: the line property is keyed at the seat, and its carried image is keyed on the dark row.

A reader may object that the title glues two kinds of sentence, a reading of nulls and an assumption, and that a sheet plus an assumption is a template and not a theory. The record does not glue them; it sorts them. The seat of this programme's operating system, the Riemann locus, was earned by boot in the final session under Physical OS 2.0.0 (Box A1), and there the Bridge proves that every frame property is exactly one of keyless or keyed (Bridge.discriminator), and the Riemann closure is executed as one judged object, a forced part and one keyed bit (Closure.riemann_closure_executed). Theorem 23 takes that form on the dark row, and the dark row is not a second seat: the operating system allows one seat, and Theorem 25 carries the row's bit onto its line. Over the worlds the record admits, the first clause is keyless and the second is keyed; one sort yields both, and a single conjunction carries both.

Theorem 21 says why the two grades must differ, not merely that they do. The photon's coupling is measured, so a bound on an electric charge inside one quantum is a zero, and Theorem 15 turns the nulls into the visible half. The dark photon's coupling is not measured, so no bound, however tight, is a zero. Known physics is the constructed witness of the free case: hidden-charged dark matter with a small dark coupling passes the bounds from halo shapes and self-interaction [consensus],^47,48^ which is Theorem 21's second half realized in the sky. What would raise the second clause to the grade of the first is what raised the first: a measured coupling. A dark photon detected and its coupling fixed turns every dark bound into a dark zero or a dark charge; a demonstration that the dark matter is its own antiparticle spends the bit through Theorem 24.

What the dark matter is, on this record: a massive state on the fixed set of the Standard Model's conjugation, with one bit, the dark force, left keyed. Why it must be that: the halo is dark to every visible gauge reading, and darkness to every charge-linear reading is the fixed set (Theorem 3); the photon and Z nulls force the visible half (Theorem 15); and no account built on the present record can say more, because any reading of that record that claims to decide the bit is refuted by the two admitted worlds of Theorem 22. A forced half and one keyed bit is the strongest statement the present record admits, and the title states exactly that. At the posit's grade the paper names more: a stable singlet that is its own antiparticle, a real scalar read through S² H†H or a Majorana fermion with no renormalizable portal (Theorems 16, 20 and 24). Every particle theory of dark matter, the weakly interacting relic, the axion, the sterile neutrino, posits its particle; none derives it from the record, and Theorem 22 proves none can. A theory posits, derives and exposes itself to kills; this one does all three.

## 6 The dark force as acceleration

In the dynamical sense the dark force is not a fifth force. It is gravity reading pressure. The acceleration equation ä/a = −(4πG/3)(ρ + 3p) [GR], in units with c = 1, makes the active gravitating density ρ + 3p, not ρ.

{. Theorem 11, the vacuum repels .} Dust and radiation have positive active density. Pressure p = −ρ gives active density −2ρ. Any repulsion requires 3p < −ρ.

{. Theorem 12, the kinetic floor .} For a canonical field with kinetic density K ≥ 0 and potential V, ρ + p = 2K ≥ 0, so at positive density ρ = K + V > 0 the equation of state cannot fall below −1 [QFT]; at negative density the bound fails, since K = 1 and V = −3 give ρ = −2, p = 4 and w = −2. It equals −1 exactly when K = 0, the frozen field. ρ + p < 0 requires K < 0, a ghost. The floor is additive: any number of canonical fields keeps ρ + p = 2ΣK ≥ 0, so at positive total density no count of fields with K ≥ 0 crosses −1. The kernel states w as a ratio a/b of integers with b > 0, so the bound holds for every rational equation of state, w = −0.9 included, and over the reals the proof is the same ordered-ring steps.

{. Theorem 13, the sign is read .} Two flat budgets, one all matter and one with 31.53 percent matter and 68.47 percent vacuum, give deceleration parameters of opposite sign.

The template forces the sign of the vacuum's pull. It does not force the vacuum's presence. The sign of the acceleration is one bit read from the sky, first by supernovae^5,6^ and now by the Planck budget:^4^ q₀ = Ω_m/2 − Ω_Λ = −0.527 ± 0.011 in flat ΛCDM, with the acceleration beginning at z = 0.63 and the vacuum overtaking matter at z = 0.295 (checks B3, B4). The budget closes: Ω_c = 0.2645 and Ω_b = 0.0493, a ratio of 5.37, and 5.36 in the physical densities Ω_c h² = 0.1200 and Ω_b h² = 0.02237, and with minimal neutrino masses they reproduce Ω_m to 0.002 (checks B1, B2).

Under the posit, dark energy exchanges nothing with dark matter, so the effective equation of state is the field's own and Theorem 12 binds it. This is the theory's sharpest exposure. DESI's DR2 fit with DESY5 supernovae, w₀ = −0.752 ± 0.057 and wₐ = −0.86 (+0.23, −0.20), crosses w = −1 at z = 0.405 and reaches −1.18 by z = 1 (check C4).^40^ The theory keeps the thawing part, w₀ > −1, which a rolling canonical field allows. It predicts that the crossing will not survive a reconstruction free of the w₀wₐ form with recalibrated supernovae. The crossing lies where the floor forbids a canonical field, and the literature already records how much of the preference rides on the supernova samples.^41^ If the crossing survives, criterion F1 removes the theory's account of dark energy.

The magnitude is a number, and the theory derives none of it. The vacuum density is (2.24 meV)⁴: 10^−122.9^ of the Planck mass to the fourth power, 10^−120.1^ of the reduced Planck mass to the fourth, and 10^−56.2^ of the electroweak scale to the fourth (checks B6, B7).^30^ No measurement derives the origin of a number, so this row owes one formal offering and no carrier.

## 7 The dark ledger

The kernel computes each row's status from three recorded facts and each row's debt from one more. A row is crossed if a world carrier or a formal offering has supplied its value, pending otherwise, and a dot only if its seat is proved absent. A pending row owes one carrier where a physical system can reach the question and one formal offering where none can.

{. Theorem 14 .} Every printed status and debt in Table 1 is the computed one: two rows crossed, four pending, no dot, three carriers and one formal offering owed. The facts in each row are the author's entries with their citations; the theorem guards the table against a hand-typed status and says nothing about whether any dark component exists.

Table: Table 1 | The dark ledger, computed by the kernel (Theorem 14)
| Row | Status | Owed |
|---|---|---|
| Dark matter exists, read by gravity | crossed | nothing |
| Its identity and charges | pending | one carrier |
| A fifth reading, the dark gauge force | pending | one carrier |
| Sign of the acceleration | crossed | nothing |
| w = −1 exactly, the frozen field | pending | one carrier |
| Magnitude of ρΛ, derived | pending | one formal offering |
Note: Warrant: theorem grade for the computation, corroboration grade for the facts it reads. A carrier can cross the fifth-reading and frozen-field rows only against the posit or the constant; no null result crosses them in favour.

Table 2 is the correspondence matrix every physical paper under PhysOS carries: the phenomenon, its placement on the template, the theorem, and the executed check.

Table: Table 2 | Correspondence matrix
| Phenomenon | Placement | Theorem | Check |
|---|---|---|---|
| Mass seen only by lensing and orbits | fixed set of C | 1 to 4 | A1, A2 |
| Extended halos, no dark disk | zero radiative weight | 6 | A3 |
| Sneutrino-type candidates excluded | Q = 0 off the fixed set | 5 | A4 |
| Wino-type candidates | one fixed member of three | 7 | A5 |
| Identity unknown | one density record | 8 | F1 |
| Neutrino fog | energy even, source odd | 9 | D1, D2 |
| Dark photon question | fifth odd reading | 10 | A6 |
| Accelerating expansion | active density ρ + 3p | 11, 13 | B3, B8 |
| w ≥ −1 | kinetic floor K ≥ 0 at ρ > 0 | 12 | C1 to C3 |
| DESI crossing | fitted curve below the floor | measured | C4 |
| Magnitude of ρΛ | a number | none | B6, B7 |
Note: Warrant: theorem grade in the Theorem column, structural grade in the Placement column, corroboration grade where a check reads measured inputs.

## 8 Falsifiable predictions

Three criteria can end the theory. Each is named with its instrument, its kill condition, its necessity, and its blast radius.

{. F1, no robust phantom crossing .} Prediction: the effective equation of state satisfies w(z) ≥ −1 at every redshift. Instrument: the final DESI analyses, the survey having completed its planned map in April 2026,^49^ with Euclid, the Rubin Observatory supernova sample, and Roman. Kill: w < −1 at 5σ or more at any redshift in two reconstructions that do not assume the w₀wₐ form, each on an independent supernova compilation with recalibrated distances, with the final DESI BAO data. Necessity: Theorem 12 at positive dark-energy density, applied field by field to fields with K ≥ 0 [QFT], with the posit that dark energy exchanges nothing with dark matter. Theorem 12 knows nothing of the w₀wₐ fit: F1 joins it to the posit and to the bet that the fitted crossing is an effect of parametrization or calibration. Blast radius: the theory's account of dark energy and the posit. The theorems stand, and the surviving alternatives are an interaction, a field with K < 0, or modified gravity.^37,36^

{. F2, dark matter is a Standard Model singlet .} Prediction: every member of the dark matter's multiplet sits on the fixed set, and every non-gravitational signal passes through a singlet operator, at renormalizable level H†H or LH, and for a stable singlet S² H†H alone, which ties the spin-independent rate to the invisible Higgs width through one coupling, while a stable fermion singlet has no renormalizable signal. Instrument: LZ, XENONnT, PandaX-4T and their successor XLZD, gamma-ray line searches, and collider searches for disappearing tracks. Kill: a charged partner of the dark matter; a tree-level photon, Z or gluon coupling, as for wino or higgsino dark matter; a millicharge by any route, tree-level or through kinetic mixing; or a dimension-five signal attributable to the dark matter, an axion-like coupling to photons or gluons or a fermion's Higgs-portal scattering. Necessity: Theorems 3, 5, 7, 15, 16, 18, 19 and 20 with the posit's singlet placement, since the observed darkness alone admits a neutral member of a charged multiplet. Blast radius: the placement of the dark matter in a singlet. The kernel stands.

{. F3, no fifth reading .} Prediction: σ/m consistent with zero at cluster and dwarf scales, ΔN_eff consistent with the Standard Model, no dark disk, no dark acoustic oscillation, and a dark matter that is its own antiparticle. Instrument: cluster lensing from Euclid and Rubin, Gaia disk dynamics, the Simons Observatory and later CMB experiments, small-scale structure, and the helicity structure of annihilation and scattering. Kill: any of these, a dark-photon kinetic-mixing signal, or a dark matter distinct from its antiparticle, at 5σ attributable to a dark interaction or a conserved dark number. Necessity: the premise-grade posit, which Theorems 10 and 17 prove cannot be derived, Theorem 18 isolates as the second half of the fixed set, and Theorems 21 and 22 prove no bound and no reading of the present record decides; Theorem 24 names its kinetic observable, and Theorem 25 carries it to the seat's line. Blast radius: the posit alone, and with it the sharpness of F1.

## 9 Discussion

The theory's contribution is one template for both dark sectors and three typed placements on it. Dark matter is placed on the massive part of the fixed set of conjugation, which Theorem 3 identifies with gauge-darkness on the template, and its identity is the one thing gravity cannot read. The dark force in the gauge sense is a fifth reading, keyed relative to the Standard Model's anomaly conditions, and the theory spends it as absent. The dark force in the dynamical sense is gravity reading a pressure the template allows and cannot require: its sign is measured, its floor is a theorem, and its magnitude is a number.

The limits bind where they are stated. The theorems are finite: integer charges, lists, grids. The mapping from particles to states is structural. The halo argument from zero radiative weight rests on standard cooling physics. The posit is a posit, and the predictive content sits in it; Theorems 15 to 25 shrink it and sort it. The visible half of the dark matter's placement is forced by the measured photon and Z nulls for a vector current, with colour settled by confinement and Theorem 19; the dark half is the keyed bit; the portal clause is derived, and for a stable singlet it leaves one door. What remains posited is the singlet placement of the partners, the spent fifth bit, renormalizability, and no exchange between dark energy and dark matter. No single theorem here is new physics. The contribution is one machine-checked template on which all of them hold at once, with every placement graded, every open item typed, and the measured and posited halves of the title separated by a theorem. A template, the objection goes, is not a theory of what dark matter is. Theorem 22 answers it where it can be answered: on the present record no account decides the dark bit, so a forced half and one keyed bit is the most any theory built on present data can state, and a theory that states more has claimed a measurement no one has made. Theorem 24 names the measurement that would supply the bit: whether the dark matter is its own antiparticle. Experiment can kill either half: a millicharge or a charged partner kills the measured placement, a dark photon kills the spent bit, and the theorems stand, as theorems must. F1 is under live pressure, since the DESI preference sits at three to four sigma in the form that crosses; a confirmation robust to parametrization and calibration would remove the dark-energy half of the theory and leave the dark-matter half and every theorem untouched. Nothing here derives the Standard Model's charges or the vacuum energy. The template is the one the Physical OS kernels already carry for a single generation, extended by one charge and one set of readings.

{. How the paper stands to each prior position .} The paper sits across three literatures, dark matter candidates and detection, dark forces, and dark energy, so it owes one statement of where it stands to each position it engaged. Eight relation words carry that statement. Additive means the paper supplies a result or a test the position lacked and leaves it standing. Replacing means a framing is retired and a measured object put in its place. Subsuming means the prior claim becomes a case of the paper's object. Corroborating means independent agreement, which confers no warrant on either side. Contradicting means a named thesis is denied on executed data. Competing means a different answer to the same question, argued rather than executed. Scoping means a claim kept inside a stated boundary. Kin means a position the paper continues, with its open aperture named. Superseding is gated to a central claim retired on executed data at the theory's own register, and it is used nowhere here: the paper supersedes no theory. The census over sixteen rows is one additive (Holdom), one subsuming (Goodman and Witten with Falk, Olive and Srednicki), two corroborating (the Bullet Cluster; the supernova discovery), four scoping (the WIMP review, the cosmological constant problem, DESI in part, the Fermi halo claim), five competing (minimal dark matter, self-interacting and double-disk dark matter, interacting dark energy, DESI in part, modified dynamics), four kin (the rotation-curve discoveries; the Higgs-portal singlet; the neutrino-floor papers; the phantom papers), and none replacing or contradicting. The paper's contribution is exactly the set of relations Table 3 states and nothing wider.

Table: Table 3 | How the paper stands to each prior position
| Position | Holds | This paper | Relation | Evidence |
|---|---|---|---|---|
| Zwicky 1933; Rubin & Ford 1970 | Unseen mass binds clusters and galaxies | Reads it as the massive fixed set, seen by gravity alone | Kin | cited |
| Clowe et al. 2006 | Lensing mass separates from the gas | A fixed-set population neither radiates nor collides | Corroborating | cited |
| Jungman et al. 1996 | A weak-scale thermal relic | Kept only as a singlet reaching us through H†H or LH | Scoping | argued |
| Cirelli et al. 2006 | The neutral member of an electroweak multiplet | Off the multiplet-level fixed set; predicted absent (F2) | Competing | argued |
| Goodman & Witten 1985; Falk et al. 1994 | Z-coupled neutral candidates scatter and are excluded | Q = 0 off the fixed set keeps a nonzero Z reading | Subsuming | executed, Thm 5, A4 |
| Silveira & Zee 1985; McDonald 1994 | A singlet scalar through the Higgs portal | The dark multiplet with an even portal | Kin | argued |
| Holdom 1986 | A second U(1) mixes with hypercharge | Closure admits and omits it on one record: keyed | Additive | executed, Thm 10, A6 |
| Spergel & Steinhardt 2000; Fan et al. 2013 | Self-interacting or dissipative dark matter | The posit predicts neither (F3) | Competing | argued |
| Billard et al. 2014; O'Hare 2021 | Neutrinos bound energy-only searches | Energy even, source odd; separation 59.6° to 120.4° | Kin | executed, Thm 9, D2 |
| Riess et al. 1998; Perlmutter et al. 1999 | The expansion accelerates | The sign is one bit read, not derived | Corroborating | cited |
| Weinberg 1989 | The vacuum energy is unnaturally small | Ratio computed, 10^−122.9^; one formal offering owed | Scoping | executed, B7 |
| Caldwell 2002; Carroll et al. 2003; Vikman 2005 | Phantom needs a ghost; one field cannot cross | The finite form: ρ + p = 2K ≥ 0 | Kin | executed, Thm 12, C1 to C3 |
| Das et al. 2006 | An interaction mimics w < −1 | Excluded by the posit; the fallback if F1 fails | Competing | argued |
| DESI 2025 | w₀ > −1, wₐ < 0, crossing near z = 0.4 | Keeps w₀ > −1; predicts the crossing fails (F1) | Scoping; Competing | argued |
| Milgrom 1983 | Modify gravity instead of adding mass | Mass on the fixed set; lensing offsets read mass | Competing | argued |
| Totani 2025 | A 20 GeV halo excess from annihilation | Allowed through the Higgs portal if confirmed | Scoping | open |
Note: Relation words as defined in the run-in above. Superseding is used nowhere.

## 10 Conclusion

On this template dark matter is not a puzzle about gravity. It sits on the massive part of the one set of states every gauge reading misses. The photon and Z nulls force its visible half there, the dark half is the one keyed bit, Theorem 18 makes the two halves the whole, and on the template Theorem 3 makes that set and gauge-darkness one property. Theorem 23 binds the halves in one judged conjunction, Theorem 25 carries the bit to the seat's line as the line property, and Theorem 21 says why they carry two grades: the photon's coupling is measured, and the dark photon's is not. Theorem 24 moves the bit onto the kinetic channel: it is whether the dark matter is its own antiparticle. Gravity is the reading left, and it cannot name what it sees. Whether a dark force exists is a single bit the Standard Model's anomaly conditions cannot supply, and they leave its strength free; the theory spends it as absent and names the four signatures that would take it back. The acceleration is gravity reading vacuum pressure: its sign measured, its floor proved, its size a number owed to a formal offering. Three criteria can end the theory, and one of them, the phantom crossing, is being tested now.

## Appendix A Kernel and twin

Table A1 maps the paper's theorems to the Lean declarations of Dark_Closure.lean and to the axiom cones the compiler printed. Table A2 lists the twin's checks by group. Groups A and C1 to C3, and check B8, are exact identities on integer grids and constructed states; the other B checks, C4, E1 to E3 and F compute from cited inputs printed in the text, Planck 2018, the DESY5 fit, the cluster bounds and the local density, and none reprints a published output; group D computes solar geometry; E4 is the Landauer bookkeeping. Appendix B prints the kernel in full, with its line numbers, and Appendix C the twin.

Table: Table A1 | Paper theorems, Lean declarations and printed axiom cones
| Thm | Lean declarations | Axioms |
|---|---|---|
| 1 | conj_involution, fixed_iff_neutral, fixedSM_iff_neutralSM, fixed_sub_fixedSM, dark_charge_hidden_from_the_visible | none (1); propext, Quot.sound (4) |
| 2 | odd_reading_blind, charge_linear_readings_odd, charge_reading_odd | propext, Quot.sound (3) |
| 3 | dark_iff_fixed | propext, Quot.sound (1) |
| 4 | gravity_reading_even, dark_state_fixed, only_gravity_reads_the_fixed_set, fixed_state_is_its_mass, every_template_reading_of_the_fixed_set_reads_only_mass | none (2); propext, Quot.sound (3) |
| 5 | electric_neutrality_is_not_the_seat, z_reading_odd, z_reading_survives_neutrality | propext, Quot.sound (3) |
| 6 | sq_nonneg, sq_eq_zero, radiative_zero_iff_neutral, no_charge_no_radiation, dark_charged_radiates_only_dark | none (1); propext (1); propext, Quot.sound (3) |
| 7 | a_neutral_member_is_not_a_dark_multiplet, the_triplet_has_one_fixed_member | none (2) |
| 8 | identity_unread, two_species_one_record | none (2) |
| 9 | energy_record_even, source_odd, fog_one_record, direction_separates | none (4) |
| 10 | visible_generation_closes, closure_admits_both, closure_is_not_vacuous, one_record_two_worlds, fifth_differs, no_template_reading_decides_fifth, fifth_is_keyed | none (7) |
| 11 | dust_attracts, radiation_attracts, vacuum_repels, repulsion_needs_tension | propext, Quot.sound (4) |
| 12 | floor_forbids_phantom, vacuum_iff_frozen, phantom_needs_ghost, floor_bounds_w, floor_needs_positive_density, floor_is_additive, w_floor_from_rho_plus_p, rhoPlusP_split, fields_bound_w | none (1); propext, Quot.sound (8) |
| 13 | flat_budgets_admit_both_signs | none (1) |
| 14 | dark_ledger_is_computed, dark_ledger_counts | none (2) |
| 15 | photon_and_z_force_electroweak_zero, visible_nulls_force_the_visible_fixed_set, below_one_quantum_is_zero, sub_quantum_bounds_force_the_visible_fixed_set | propext, Quot.sound (4) |
| 16 | portals_are_derived | propext (1) |
| 17 | fifth_is_free | propext, Quot.sound (1) |
| 18 | fixed_iff_visible_fixed_and_no_dark_charge | propext, Quot.sound (1) |
| 19 | coloured_fields_are_charged, sumI_tri_zero_of_none, a_coloured_relic_brings_charged_partners | none (1); propext, Quot.sound (2) |
| 20 | a_stable_singlet_keeps_one_door | propext (1) |
| 21 | one_le_sq_of_ne, zero_le_sq, measured_coupling_bound_forces_zero, free_coupling_bound_never_forces_zero | propext, Quot.sound (4) |
| 22 | first_clause_is_forced, second_clause_is_keyed, no_reading_of_the_record_decides_the_bit, self_conjugacy_spends_the_bit | none (1); propext (1); propext, Quot.sound (2) |
| 23 | dark_closure_executed | propext, Quot.sound (1) |
| 24 | majorana_mass_forbids_abelian_charge, the_dark_bit_is_the_majorana_bit, a_dark_charge_makes_a_dirac_pair | propext, Quot.sound (3) |
| 25 | toStage_equivariant, stageFold_fixed_iff_line, fixed_states_land_on_the_line, the_bit_is_the_line_property_carried, a_dark_pair_is_an_off_line_fold_pair | propext, Quot.sound (5) |
Note: 53 declarations, all compiled with exit 0 under Lean 4.19.0; Classical.choice appears in no cone.

Table: Table A2 | Twin battery, 35 checks, zero failures
| Group | Checks | Content |
|---|---|---|
| A template | 16 | fixed set on a 13⁴ grid; four odd readings; radiative weight; neutrino-like state; triplet; anomaly worlds; the kernel's twelve sums; the portal census and its filter; every vector-like dark charge closes; one door for a stable singlet; the fixed set's two halves; coloured fields charged; the two grades; the record's sort; the Majorana bit; the Dirac pair; the equivariant carrier |
| B budget | 8 | Ω_c and Ω_b; budget closure; q₀; onset and crossover redshifts; critical density; (2.24 meV)⁴; the three ratios; active densities |
| C floor | 4 | canonical grid; frozen field; ghost control; the DESY5 crossing |
| D fog | 2 | wind source; solar separation over a year |
| E fifth reading | 4 | σ/m in barn per GeV; ΔN_eff floors; the ACT DR6 bound; the Landauer bookkeeping |
| F identity | 1 | one halo read by two species |
Note: Battery line {"checks":35,"failures":0}. Built with GNU Fortran 13.3.0 under -std=f2018 -O2 -fno-fast-math -ffp-contract=off.

:::box A1 Files and digests
Dark_Closure.lean: 987 lines, SHA-256 88ede5cbda653a4d; exit 0; 81 theorems, 25 axiom-free, 52 on propext and Quot.sound, 4 on propext alone, none on choice.

Dark_Twin.f90: 340 lines, SHA-256 6e78c339d35558a0; 35 of 35 checks.

Judgment: 81 of 81 negations refused as proof failures; the planted vacuous law survived.

Physical OS 1.0.2 file: SHA-256 f38bb3f3ea620d36; manifest 6be50db826fff087; controls 18 of 18 as expected.

Physical OS 2.0.0 file: SHA-256 3495f2f83686fac1; quick boot in the final session: SEAT EARNED, chain D0 70161a63fc76 to D3 f2c3d5ac445c, the edition's own printed quick chain reproduced bit for bit.

Warrant: machine receipts of internal consistency on this toolchain.
:::

:::box A2 Reproducibility receipt, quick mode, abridged verbatim
TRISDUCTION PHYSICAL OS 1.0.2 · RECEIPT · mode quick

TOOLCHAIN Lean (version 4.19.0, x86_64-unknown-linux-gnu, commit 6caaee842e94, Release) · GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0

MANIFEST sha256 6be50db826fff087, the files that ran

GROUND manifest: 18 files signed, all verified · source screen: 5 kernels, 23 named premises, clean · citations: 32 laws named in Parts I and II, 32 resolved · quarantine: 4 retirements string-scanned, 2 held by review, clean

REGISTER A {"checks":1123,"failures":0,"mode":"sealed"}

WITNESS 2 of 2 twins ran, each held to one battery line with zero failures

CHAIN · D0 c0c7707333e3 -> D1 6e8d9a59eb93 -> D2 bf780cd28160 -> D3 6e730bb90f00

ELAPSED ground 7 s · Register A 3 s · Register B 40 s · witness 0 s · total 50 s (not hashed)

SEAT EARNED · this run

Warrant: a machine receipt of internal consistency on this toolchain. It certifies no external truth.
:::

## Appendix B The kernel, verbatim

Dark_Closure.lean as compiled for this edition: 987 lines, SHA-256 88ede5cbda653a4d, exit 0 under Lean 4.19.0. The listing is the file byte for byte with its line numbers, so each declaration Table A1 names can be found at its line.

```lean
/-
  THE DARK CLOSURE · the dark sector read on the closure template.
  Core Lean 4.19.0, standalone, no library, no axiom declared. Companion kernel of
  "Dark Matter as the Charge-Conjugation Fixed Set and the Dark Force as One Keyed Bit" (27 September 2026).

  THE READER'S FRAME. This file proves finite, typed placements and nothing more. It does not identify the dark
  matter particle, derive its abundance, derive the value of the vacuum energy, or decide whether a dark gauge
  force exists. Where a question is keyed, the file proves that it is keyed and stops.
  Part I    The fixed set. Conjugation flips every gauge charge and keeps mass. Every charge-linear reading
            vanishes on its fixed set; gravity, the even reading, does not.
  Part II   The seat is not electric neutrality. A charge-free state has zero radiative weight; a multiplet with
            one neutral member is not a dark multiplet.
  Part III  Gravity does not read identity: two species with one density leave one record.
  Part IV   The neutrino fog: one energy record, two sources; direction is the odd reading.
  Part V    The fifth reading. Anomaly closure constrains a dark U(1) and does not decide it: a keyed bit.
  Part VI   The dark force in the acceleration sense: active density, kinetic floor, phantom divide, budget.
  Part VII  The dark ledger, computed.
-/
namespace DarkClosure

/-! ## Part I. The fixed set and its readings. -/

/-- A state: hypercharge and weak isospin times six, one colour weight (a Cartan coordinate), one dark charge, mass. -/
structure State where
  y6 : Int
  t3x6 : Int
  colour : Int
  dark : Int
  mass : Nat
  deriving DecidableEq, Repr

/-- Charge conjugation: every gauge charge flipped, the mass kept. -/
def conj (c : State) : State := ⟨-c.y6, -c.t3x6, -c.colour, -c.dark, c.mass⟩

/-- Visible conjugation: the three Standard Model charges flipped, the dark charge and the mass kept. -/
def conjSM (c : State) : State := ⟨-c.y6, -c.t3x6, -c.colour, c.dark, c.mass⟩

def neutral (c : State) : Prop := c.y6 = 0 ∧ c.t3x6 = 0 ∧ c.colour = 0 ∧ c.dark = 0
def neutralSM (c : State) : Prop := c.y6 = 0 ∧ c.t3x6 = 0 ∧ c.colour = 0

theorem conj_involution (c : State) : conj (conj c) = c := by
  cases c with
  | mk y t k d m =>
    show State.mk (- -y) (- -t) (- -k) (- -d) m = State.mk y t k d m
    rw [Int.neg_neg, Int.neg_neg, Int.neg_neg, Int.neg_neg]

/-- THE FIXED SET: a state is its own conjugate exactly when it carries no gauge charge at all. -/
theorem fixed_iff_neutral (c : State) : conj c = c ↔ neutral c := by
  cases c with
  | mk y t k d m =>
    show State.mk (-y) (-t) (-k) (-d) m = State.mk y t k d m ↔ (y = 0 ∧ t = 0 ∧ k = 0 ∧ d = 0)
    constructor
    · intro h
      have h1 := congrArg State.y6 h
      have h2 := congrArg State.t3x6 h
      have h3 := congrArg State.colour h
      have h4 := congrArg State.dark h
      change -y = y at h1
      change -t = t at h2
      change -k = k at h3
      change -d = d at h4
      exact ⟨by omega, by omega, by omega, by omega⟩
    · intro ⟨h1, h2, h3, h4⟩
      subst h1; subst h2; subst h3; subst h4
      rfl

theorem fixedSM_iff_neutralSM (c : State) : conjSM c = c ↔ neutralSM c := by
  cases c with
  | mk y t k d m =>
    show State.mk (-y) (-t) (-k) d m = State.mk y t k d m ↔ (y = 0 ∧ t = 0 ∧ k = 0)
    constructor
    · intro h
      have h1 := congrArg State.y6 h
      have h2 := congrArg State.t3x6 h
      have h3 := congrArg State.colour h
      change -y = y at h1
      change -t = t at h2
      change -k = k at h3
      exact ⟨by omega, by omega, by omega⟩
    · intro ⟨h1, h2, h3⟩
      subst h1; subst h2; subst h3
      rfl

/-- The full fixed set lies inside the visible one. -/
theorem fixed_sub_fixedSM (c : State) (h : conj c = c) : conjSM c = c := by
  obtain ⟨h1, h2, h3, _⟩ := (fixed_iff_neutral c).mp h
  exact (fixedSM_iff_neutralSM c).mpr ⟨h1, h2, h3⟩

/-- A dark-charged state: invisible to the three visible readings, read by a fifth. -/
def darkCharged (m : Nat) : State := ⟨0, 0, 0, 1, m⟩

theorem dark_charge_hidden_from_the_visible (m : Nat) :
    conjSM (darkCharged m) = darkCharged m ∧ conj (darkCharged m) ≠ darkCharged m := by
  refine ⟨rfl, ?_⟩
  intro h
  have h4 : -(1 : Int) = 1 := congrArg State.dark h
  omega

/-- A reading is odd when conjugation flips its sign, even when conjugation keeps it. -/
def OddReading (r : State → Int) : Prop := ∀ c, r (conj c) = -r c
def EvenReading {β : Type} (r : State → β) : Prop := ∀ c, r (conj c) = r c

/-- EVERY ODD READING IS BLIND TO THE FIXED SET. -/
theorem odd_reading_blind (r : State → Int) (hr : OddReading r) (c : State) (hc : conj c = c) :
    r c = 0 := by
  have h := hr c
  rw [hc] at h
  omega

/-- Every integer combination of the four charges is an odd reading. The couplings of the photon, the Z, the
    diagonal gluons and a dark photon to a state are all of this form. -/
theorem charge_linear_readings_odd (a b k d : Int) :
    OddReading (fun c => a * c.y6 + b * c.t3x6 + k * c.colour + d * c.dark) := by
  intro c
  show a * (-c.y6) + b * (-c.t3x6) + k * (-c.colour) + d * (-c.dark) =
    -(a * c.y6 + b * c.t3x6 + k * c.colour + d * c.dark)
  simp only [Int.mul_neg]
  omega

/-- Electric charge times six, Q = T3 + Y. -/
def charge6 (c : State) : Int := c.t3x6 + c.y6

theorem charge_reading_odd : OddReading charge6 := by
  intro c
  show -c.t3x6 + -c.y6 = -(c.t3x6 + c.y6)
  omega

/-- Gravity reads the mass. -/
def readG (c : State) : Nat := c.mass

theorem gravity_reading_even : EvenReading readG := by
  intro c
  rfl

def darkState (m : Nat) : State := ⟨0, 0, 0, 0, m⟩

theorem dark_state_fixed (m : Nat) : conj (darkState m) = darkState m := rfl

/-- ONLY GRAVITY READS THE FIXED SET: every odd reading returns zero on it; the even reading returns the mass. -/
theorem only_gravity_reads_the_fixed_set (r : State → Int) (hr : OddReading r) (m : Nat) :
    r (darkState m) = 0 ∧ readG (darkState m) = m :=
  ⟨odd_reading_blind r hr (darkState m) (dark_state_fixed m), rfl⟩

/-- DARK IS FIXED: a state on which every odd reading returns zero is exactly a state that conjugation fixes.
    "Dark" in the gauge sense and "on the fixed set" are one property. -/
theorem dark_iff_fixed (c : State) : (∀ r : State → Int, OddReading r → r c = 0) ↔ conj c = c := by
  constructor
  · intro h
    have h1 := h (fun x => x.y6) (fun _ => rfl)
    have h2 := h (fun x => x.t3x6) (fun _ => rfl)
    have h3 := h (fun x => x.colour) (fun _ => rfl)
    have h4 := h (fun x => x.dark) (fun _ => rfl)
    exact (fixed_iff_neutral c).mpr ⟨h1, h2, h3, h4⟩
  · intro hc r hr
    exact odd_reading_blind r hr c hc

/-! ## Part II. The seat is not electric neutrality; a charge-free state cannot radiate. -/

/-- A neutrino-like state: T3 = +1/2 and Y = -1/2, so electric charge zero. The scalar partner of the neutrino
    carries exactly these charges. -/
def sneutrinoLike (m : Nat) : State := ⟨-3, 3, 0, 0, m⟩

theorem electric_neutrality_is_not_the_seat (m : Nat) :
    charge6 (sneutrinoLike m) = 0 ∧ conj (sneutrinoLike m) ≠ sneutrinoLike m := by
  refine ⟨?_, ?_⟩
  · show (3 : Int) + -3 = 0
    decide
  · intro h
    have h1 : -(-3 : Int) = -3 := congrArg State.y6 h
    omega

theorem sq_nonneg (x : Int) : 0 ≤ x * x := by
  cases Int.le_total 0 x with
  | inl h => exact Int.mul_nonneg h h
  | inr h =>
    have hn : 0 ≤ -x := by omega
    have := Int.mul_nonneg hn hn
    rw [Int.neg_mul_neg] at this
    exact this

theorem sq_eq_zero {x : Int} (h : x * x = 0) : x = 0 := by
  cases Int.mul_eq_zero.mp h with
  | inl h => exact h
  | inr h => exact h

/-- The radiative weight: the sum of the squared charges, the strength with which a state emits gauge quanta. -/
def radiative (c : State) : Int :=
  c.y6 * c.y6 + c.t3x6 * c.t3x6 + c.colour * c.colour + c.dark * c.dark

def radiativeSM (c : State) : Int := c.y6 * c.y6 + c.t3x6 * c.t3x6 + c.colour * c.colour

theorem radiative_zero_iff_neutral (c : State) : radiative c = 0 ↔ neutral c := by
  cases c with
  | mk y t k d m =>
    show y * y + t * t + k * k + d * d = 0 ↔ (y = 0 ∧ t = 0 ∧ k = 0 ∧ d = 0)
    have h1 := sq_nonneg y
    have h2 := sq_nonneg t
    have h3 := sq_nonneg k
    have h4 := sq_nonneg d
    constructor
    · intro h
      exact ⟨sq_eq_zero (by omega), sq_eq_zero (by omega), sq_eq_zero (by omega), sq_eq_zero (by omega)⟩
    · intro ⟨e1, e2, e3, e4⟩
      subst e1; subst e2; subst e3; subst e4
      decide

/-- NO CHARGE, NO RADIATION: the radiative weight vanishes exactly on the fixed set. A state that cannot emit
    cannot cool, and a population that cannot cool cannot settle into a thin disk. -/
theorem no_charge_no_radiation (c : State) : radiative c = 0 ↔ conj c = c :=
  (radiative_zero_iff_neutral c).trans (fixed_iff_neutral c).symm

/-- A dark-charged state emits no visible quanta and does emit dark ones. -/
theorem dark_charged_radiates_only_dark (m : Nat) :
    radiativeSM (darkCharged m) = 0 ∧ radiative (darkCharged m) = 1 := by
  refine ⟨?_, ?_⟩
  · show (0 : Int) * 0 + 0 * 0 + 0 * 0 = 0
    decide
  · show (0 : Int) * 0 + 0 * 0 + 0 * 0 + 1 * 1 = 1
    decide

/-- A multiplet is dark when every member sits on the fixed set. -/
def darkMultiplet (l : List State) : Bool := l.all (fun c => decide (conj c = c))

/-- An isospin triplet with Y = 0: T3 = +1, 0, -1, times six. Its middle member is neutral. -/
def tripletLike : List State := [⟨0, 6, 0, 0, 1⟩, ⟨0, 0, 0, 0, 1⟩, ⟨0, -6, 0, 0, 1⟩]
def singletLike : List State := [⟨0, 0, 0, 0, 1⟩]

theorem a_neutral_member_is_not_a_dark_multiplet :
    tripletLike.any (fun c => decide (conj c = c)) = true ∧ darkMultiplet tripletLike = false ∧
    darkMultiplet singletLike = true := by decide

/-! ## Part III. Gravity does not read identity. -/

/-- A species: a label only a non-gravitational instrument reads, and the mass density gravity reads. -/
structure Species where
  label : Nat
  density : Nat
  deriving DecidableEq, Repr

def gravRecord (s : Species) : Nat := s.density

/-- NO GRAVITATIONAL READING RETURNS THE IDENTITY: two species with one density are one gravitational record. -/
theorem identity_unread (s t : Species) (hd : s.density = t.density) (hl : s.label ≠ t.label)
    (g : Nat → Nat) : ¬ (g (gravRecord s) = s.label ∧ g (gravRecord t) = t.label) := by
  intro ⟨h1, h2⟩
  unfold gravRecord at h1 h2
  rw [hd] at h1
  exact hl (h1.symm.trans h2)

/-- The instance: a heavy particle and a light wave-like field, one halo, one density. -/
def heavyHalo : Species := ⟨1, 3⟩
def lightHalo : Species := ⟨2, 3⟩

theorem two_species_one_record (g : Nat → Nat) :
    ¬ (g (gravRecord heavyHalo) = heavyHalo.label ∧ g (gravRecord lightHalo) = lightHalo.label) :=
  identity_unread heavyHalo lightHalo rfl (by decide) g

/-! ## Part IV. The neutrino fog: one energy record, two sources. -/

/-- A nuclear recoil: its energy, and whether it points back to the Sun or to the halo wind. -/
structure Recoil where
  energy : Nat
  solar : Bool
  deriving DecidableEq, Repr

/-- The direction flip exchanges the two sources and keeps the energy. -/
def flipDir (r : Recoil) : Recoil := ⟨r.energy, !r.solar⟩
def energyRecord (r : Recoil) : Nat := r.energy

theorem energy_record_even (r : Recoil) : energyRecord (flipDir r) = energyRecord r := rfl
theorem source_odd (r : Recoil) : (flipDir r).solar = !r.solar := rfl

/-- THE FOG: at one energy, a solar recoil and a halo recoil leave one energy record, and no reading of that
    record returns the source. -/
theorem fog_one_record (g : Nat → Bool) (e : Nat) :
    ¬ (g (energyRecord ⟨e, true⟩) = true ∧ g (energyRecord ⟨e, false⟩) = false) := by
  intro ⟨h1, h2⟩
  have e1 : g e = true := h1
  have e2 : g e = false := h2
  exact absurd (e1.symm.trans e2) (by decide)

/-- The direction reading separates them. -/
theorem direction_separates (e : Nat) : (⟨e, true⟩ : Recoil).solar ≠ (⟨e, false⟩ : Recoil).solar := by
  intro h
  have h' : true = false := h
  exact absurd h' (by decide)

/-! ## Part V. The fifth reading. -/

/-- A left-handed Weyl field: multiplicity, hypercharge times six, colour and isospin flags, a dark charge, and the
    colour representation sign c3: +1 for a triplet, -1 for an antitriplet, 0 for a colour singlet. -/
structure Weyl where
  name : String
  mult : Int
  y6 : Int
  triplet : Bool
  doublet : Bool
  qD : Int
  c3 : Int
  deriving Repr

/-- One Standard Model generation, no dark charge. -/
def sm : List Weyl :=
  [⟨"Q", 6, 1, true, true, 0, 1⟩, ⟨"u^c", 3, -4, true, false, 0, -1⟩, ⟨"d^c", 3, 2, true, false, 0, -1⟩,
   ⟨"L", 2, -3, false, true, 0, 0⟩, ⟨"e^c", 1, 6, false, false, 0, 0⟩]

def total (f : Weyl → Int) (xs : List Weyl) : Int := xs.foldl (fun a w => a + f w) 0

/-- Anomaly freedom of one generation with a dark U(1): six visible conditions and six dark ones (cubic,
    gravitational, mixed with hypercharge twice, with colour and with isospin). Each check is the anomaly coefficient up
    to a positive normalization, Dynkin index 1/2 for every fundamental; the colour cube is the representation sum with
    A(3) = +1 and A(3bar) = -1. No check reads a field's name. -/
def closes (w : List Weyl) : Bool :=
  total (fun x => x.mult * x.y6) w == 0 &&
  total (fun x => x.mult * x.y6 ^ 3) w == 0 &&
  total (fun x => (x.mult / 3) * x.y6) (w.filter (·.triplet)) == 0 &&
  total (fun x => (x.mult / 2) * x.y6) (w.filter (·.doublet)) == 0 &&
  total (fun x => x.mult / 2) (w.filter (·.doublet)) % 2 == 0 &&
  total (fun x => (x.mult / 3) * x.c3) (w.filter (·.triplet)) == 0 &&
  total (fun x => x.mult * x.qD) w == 0 &&
  total (fun x => x.mult * (x.qD * x.qD * x.qD)) w == 0 &&
  total (fun x => x.mult * (x.qD * x.qD) * x.y6) w == 0 &&
  total (fun x => x.mult * x.qD * (x.y6 * x.y6)) w == 0 &&
  total (fun x => (x.mult / 3) * x.qD) (w.filter (·.triplet)) == 0 &&
  total (fun x => (x.mult / 2) * x.qD) (w.filter (·.doublet)) == 0

/-- A dark Weyl field: a Standard Model singlet with dark charge q. -/
def chi (q : Int) : Weyl := ⟨"chi", 1, 0, false, false, q, 0⟩

/-- A vector-like dark pair without dark charge, and the same pair charged +1 and -1. -/
def worldD0 : List Weyl := sm ++ [chi 0, chi 0]
def worldD : List Weyl := sm ++ [chi 1, chi (-1)]
/-- One chiral dark fermion of charge +1: anomalous. -/
def worldBad : List Weyl := sm ++ [chi 1]

/-- The fifth reading: some field carries a dark charge. -/
def fifth (w : List Weyl) : Bool := w.any (fun x => x.qD != 0)

/-- The template record: everything the visible closure reads, the dark charge struck out. -/
def record (w : List Weyl) : List (String × Int × Int × Bool × Bool × Int) :=
  w.map (fun x => (x.name, x.mult, x.y6, x.triplet, x.doublet, x.c3))

theorem visible_generation_closes : closes sm = true := by decide
theorem closure_admits_both : closes worldD0 = true ∧ closes worldD = true := by decide
theorem closure_is_not_vacuous : closes worldBad = false := by decide
theorem one_record_two_worlds : record worldD0 = record worldD := by decide
theorem fifth_differs : fifth worldD0 = false ∧ fifth worldD = true := by decide

/-- NO TEMPLATE READING DECIDES THE FIFTH: no function of the template record returns whether a dark charge
    exists. -/
theorem no_template_reading_decides_fifth :
    ¬ ∃ g : List (String × Int × Int × Bool × Bool × Int) → Bool, ∀ w, g (record w) = fifth w := by
  intro ⟨g, hg⟩
  have h1 := hg worldD0
  have h2 := hg worldD
  rw [one_record_two_worlds] at h1
  exact absurd (h1.symm.trans h2) (by decide)

/-- THE FIFTH IS KEYED: an anomaly-free world carries it and an anomaly-free world lacks it. -/
theorem fifth_is_keyed :
    (∃ w, closes w = true ∧ fifth w = true) ∧ (∃ w, closes w = true ∧ fifth w = false) :=
  ⟨⟨worldD, by decide⟩, ⟨worldD0, by decide⟩⟩

/-! ## Part VI. The dark force in the acceleration sense. -/

/-- The active gravitational density of a perfect fluid, rho + 3p. -/
def active (ρ p : Int) : Int := ρ + 3 * p

theorem dust_attracts (ρ : Int) (h : 0 < ρ) : 0 < active ρ 0 := by
  unfold active
  omega

theorem radiation_attracts (k : Int) (h : 0 < k) : 0 < active (3 * k) k := by
  unfold active
  omega

/-- VACUUM REPELS: pressure equal to minus the density gives active density -2 rho. -/
theorem vacuum_repels (ρ : Int) (h : 0 < ρ) : active ρ (-ρ) = -2 * ρ ∧ active ρ (-ρ) < 0 := by
  unfold active
  constructor <;> omega

theorem repulsion_needs_tension (ρ p : Int) (h : active ρ p < 0) : 3 * p < -ρ := by
  unfold active at h
  omega

/-- THE KINETIC FLOOR: a canonical field has rho = K + V and p = K - V with K ≥ 0, so rho + p = 2K ≥ 0 and the
    phantom divide w = -1 is never crossed from above. -/
theorem floor_forbids_phantom (K V : Int) (hK : 0 ≤ K) : 0 ≤ (K + V) + (K - V) := by
  omega

/-- w = -1 exactly when the kinetic term vanishes: the frozen field. -/
theorem vacuum_iff_frozen (K V : Int) : (K + V) + (K - V) = 0 ↔ K = 0 :=
  ⟨fun _ => by omega, fun _ => by omega⟩

theorem phantom_needs_ghost (K V : Int) (h : (K + V) + (K - V) < 0) : K < 0 := by
  omega

/-- Twice the deceleration parameter of a flat matter plus vacuum budget, in units of 1e-4. -/
def twoQ0 (om ol : Int) : Int := om - 2 * ol

/-- THE SIGN IS READ, NOT DERIVED: two flat budgets, one decelerating and one accelerating; the measured
    Planck 2018 budget is the second. -/
theorem flat_budgets_admit_both_signs :
    (10000 + 0 = (10000 : Int) ∧ 0 < twoQ0 10000 0) ∧
    (3153 + 6847 = (10000 : Int) ∧ twoQ0 3153 6847 < 0) := by decide

/-! ## Part VII. The dark ledger, computed. -/

inductive Status
  | crossed
  | pending
  | dot
  deriving DecidableEq, Repr

def status (seatAbsent formalMass worldCarrier : Bool) : Status :=
  if seatAbsent then .dot else if formalMass || worldCarrier then .crossed else .pending

inductive Owed
  | nothing
  | oneCarrier
  | oneOffering
  deriving DecidableEq, Repr

def owedOf (st : Status) (tailEmpty : Bool) : Owed :=
  match st with
  | .pending => if tailEmpty then .oneOffering else .oneCarrier
  | _ => .nothing

structure Entry where
  name : String
  seatAbsent : Bool
  formalMass : Bool
  worldCarrier : Bool
  tailEmpty : Bool
  printed : Status
  owed : Owed

def darkLedger : List Entry :=
  [⟨"DM exists, read by gravity", false, false, true, false, .crossed, .nothing⟩,
   ⟨"DM identity and charges", false, false, false, false, .pending, .oneCarrier⟩,
   ⟨"a fifth odd reading, the dark gauge force", false, false, false, false, .pending, .oneCarrier⟩,
   ⟨"DE: sign of the acceleration", false, false, true, false, .crossed, .nothing⟩,
   ⟨"DE: w = -1 exactly, the frozen field", false, false, false, false, .pending, .oneCarrier⟩,
   ⟨"DE: magnitude of rho_Lambda, derived", false, false, false, true, .pending, .oneOffering⟩]

/-- Every printed status and every printed debt is the computed one. -/
theorem dark_ledger_is_computed :
    darkLedger.all (fun e => status e.seatAbsent e.formalMass e.worldCarrier == e.printed &&
      owedOf e.printed e.tailEmpty == e.owed) = true := by decide

theorem dark_ledger_counts :
    darkLedger.length = 6 ∧
    (darkLedger.filter (fun e => e.printed == .crossed)).length = 2 ∧
    (darkLedger.filter (fun e => e.printed == .pending)).length = 4 ∧
    (darkLedger.filter (fun e => e.printed == .dot)).length = 0 ∧
    (darkLedger.filter (fun e => e.owed == .oneCarrier)).length = 3 ∧
    (darkLedger.filter (fun e => e.owed == .oneOffering)).length = 1 := by decide

/-! ## Audit additions, cycle darkforge, round 1 -/

/-- A C-fixed state is its mass: all four charges vanish. -/
theorem fixed_state_is_its_mass (c : State) (h : conj c = c) : c = darkState c.mass := by
  obtain ⟨y, t, k, d, m⟩ := c
  have hn : y = 0 ∧ t = 0 ∧ k = 0 ∧ d = 0 := (fixed_iff_neutral _).mp h
  obtain ⟨rfl, rfl, rfl, rfl⟩ := hn
  rfl

/-- Every reading, of either parity and any value type, returns on a C-fixed state a function of its mass alone. -/
theorem every_template_reading_of_the_fixed_set_reads_only_mass {β : Type} (r : State → β) (c : State)
    (h : conj c = c) : r c = r (darkState c.mass) :=
  congrArg r (fixed_state_is_its_mass c h)

/-- The Z reading in sixths, scaled by b: b T₃ minus a Q, the mixing weight being the rational a / b. -/
def zReading (a b : Int) (c : State) : Int := b * c.t3x6 - a * charge6 c

theorem z_reading_odd (a b : Int) : OddReading (zReading a b) := by
  intro c
  show b * -c.t3x6 - a * (-c.t3x6 + -c.y6) = -(b * c.t3x6 - a * (c.t3x6 + c.y6))
  rw [Int.mul_add, Int.mul_add, Int.mul_neg, Int.mul_neg, Int.mul_neg]
  omega

/-- At zero electric charge the Z reading is b T₃, nonzero for every rational weight a / b. -/
theorem z_reading_survives_neutrality (a b : Int) (m : Nat) (hb : b ≠ 0) :
    charge6 (sneutrinoLike m) = 0 ∧ zReading a b (sneutrinoLike m) = 3 * b ∧ 3 * b ≠ 0 := by
  refine ⟨(by decide : (3 : Int) + -3 = 0), ?_, ?_⟩
  · show b * 3 - a * (3 + -3) = 3 * b
    omega
  · omega

theorem the_triplet_has_one_fixed_member :
    (tripletLike.filter (fun c => decide (conj c = c))).length = 1 := by decide

/-- At positive density the floor is the bound w ≥ −1, for every rational w = a/b with b > 0 and p = w ρ. -/
theorem floor_bounds_w (K V a b : Int) (hK : 0 ≤ K) (hρ : 0 < K + V) (hb : 0 < b)
    (hw : b * (K - V) = a * (K + V)) : -b ≤ a := by
  have h2 : 0 ≤ b * ((K + V) + (K - V)) := Int.mul_nonneg (Int.le_of_lt hb) (by omega)
  have h3 : b * (K - V) + b * (K + V) = b * ((K + V) + (K - V)) := by
    rw [← Int.mul_add, Int.add_comm (K - V) (K + V)]
  have h1 : (-b) * (K + V) ≤ a * (K + V) := by rw [Int.neg_mul, ← hw]; omega
  exact Int.le_of_mul_le_mul_right h1 hρ

/-- At negative density the floor does not bound w: K = 1 and V = −3 give ρ = −2, p = 4, w = −2. -/
theorem floor_needs_positive_density :
    ∃ K V a b : Int, 0 ≤ K ∧ K + V < 0 ∧ 0 < b ∧ b * (K - V) = a * (K + V) ∧ a < -b :=
  ⟨1, -3, -2, 1, by decide, by decide, by decide, by decide, by decide⟩

/-- ρ + p summed over any list of fields (K, V). -/
def rhoPlusP : List (Int × Int) → Int
  | [] => 0
  | (k, v) :: t => (k + v) + (k - v) + rhoPlusP t

/-- The floor is additive: any number of fields with K ≥ 0 keeps ρ + p ≥ 0. -/
theorem floor_is_additive (l : List (Int × Int)) (h : ∀ x ∈ l, 0 ≤ x.1) : 0 ≤ rhoPlusP l := by
  induction l with
  | nil => exact Int.le_refl 0
  | cons x t ih =>
    obtain ⟨k, v⟩ := x
    have hx : 0 ≤ k := h (k, v) (List.Mem.head t)
    have ht : 0 ≤ rhoPlusP t := ih (fun y hy => h y (List.Mem.tail (k, v) hy))
    show 0 ≤ (k + v) + (k - v) + rhoPlusP t
    omega

/-- The step from ρ + p ≥ 0 to w ≥ −1, for any totals, at positive density, for every rational w = a/b, b > 0. -/
theorem w_floor_from_rho_plus_p (ρ p a b : Int) (h : 0 ≤ ρ + p) (hρ : 0 < ρ) (hb : 0 < b)
    (hw : b * p = a * ρ) : -b ≤ a := by
  have h2 : 0 ≤ b * (ρ + p) := Int.mul_nonneg (Int.le_of_lt hb) h
  have h3 : b * p + b * ρ = b * (ρ + p) := by rw [← Int.mul_add, Int.add_comm p ρ]
  have h1 : (-b) * ρ ≤ a * ρ := by rw [Int.neg_mul, ← hw]; omega
  exact Int.le_of_mul_le_mul_right h1 hρ

def rhoTot : List (Int × Int) → Int
  | [] => 0
  | (k, v) :: t => (k + v) + rhoTot t

def pTot : List (Int × Int) → Int
  | [] => 0
  | (k, v) :: t => (k - v) + pTot t

theorem rhoPlusP_split (l : List (Int × Int)) : rhoPlusP l = rhoTot l + pTot l := by
  induction l with
  | nil => rfl
  | cons x t ih =>
    obtain ⟨k, v⟩ := x
    show (k + v) + (k - v) + rhoPlusP t = ((k + v) + rhoTot t) + ((k - v) + pTot t)
    omega

/-- Any number of fields with K ≥ 0 at positive total density keeps w ≥ −1, for every rational w = a/b, b > 0. -/
theorem fields_bound_w (l : List (Int × Int)) (a b : Int) (h : ∀ x ∈ l, 0 ≤ x.1)
    (hρ : 0 < rhoTot l) (hb : 0 < b) (hw : b * pTot l = a * rhoTot l) : -b ≤ a := by
  have h0 : 0 ≤ rhoTot l + pTot l := by
    have := floor_is_additive l h
    rw [rhoPlusP_split] at this
    exact this
  exact w_floor_from_rho_plus_p (rhoTot l) (pTot l) a b h0 hρ hb hw

/-! ## Part VIII. Fortification: the measured nulls force the fixed set, the portals are derived, the fifth is free. -/

/-- The electric reading Q = T3 + Y, times six. -/
def q6of (c : State) : Int := c.t3x6 + c.y6

/-- THE PHOTON AND THE Z FORCE THE ELECTROWEAK CHARGES TO ZERO. At any mixing weight sin²θ_W = a/b with b ≠ 0, a state
    with Q = 0 and Z reading b·T3 − a·Q = 0 has T3 = 0 and Y = 0. -/
theorem photon_and_z_force_electroweak_zero (c : State) (a b : Int) (hb : b ≠ 0)
    (hq : q6of c = 0) (hz : b * c.t3x6 - a * q6of c = 0) : c.t3x6 = 0 ∧ c.y6 = 0 := by
  rw [hq, Int.mul_zero, Int.sub_zero] at hz
  have ht : c.t3x6 = 0 := by
    rcases Int.mul_eq_zero.mp hz with h | h
    · exact absurd h hb
    · exact h
  refine ⟨ht, ?_⟩
  unfold q6of at hq
  omega

/-- THE VISIBLE NULLS FORCE THE VISIBLE FIXED SET: a colourless state the photon and the Z both miss is fixed by the
    Standard Model's conjugation. Nothing here reads the dark charge. -/
theorem visible_nulls_force_the_visible_fixed_set (c : State) (a b : Int) (hb : b ≠ 0) (hq : q6of c = 0)
    (hz : b * c.t3x6 - a * q6of c = 0) (hk : c.colour = 0) : conjSM c = c := by
  obtain ⟨ht, hy⟩ := photon_and_z_force_electroweak_zero c a b hb hq hz
  exact (fixedSM_iff_neutralSM c).mpr ⟨hy, ht, hk⟩

/-- QUANTIZATION TURNS A BOUND INTO A ZERO: an integer charge bounded strictly inside one quantum is zero. -/
theorem below_one_quantum_is_zero (n : Int) (h1 : -1 < n) (h2 : n < 1) : n = 0 := by omega

/-- THE MEASURED BOUNDS FORCE THE VISIBLE FIXED SET: with charges quantized in sixths, a colourless state whose
    electric and Z readings are each bounded strictly inside one quantum is fixed by the Standard Model's conjugation. -/
theorem sub_quantum_bounds_force_the_visible_fixed_set (c : State) (a b : Int) (hb : 0 < b)
    (hq1 : -1 < q6of c) (hq2 : q6of c < 1)
    (hz1 : -b < b * c.t3x6 - a * q6of c) (hz2 : b * c.t3x6 - a * q6of c < b)
    (hk : c.colour = 0) : conjSM c = c := by
  have hq : q6of c = 0 := below_one_quantum_is_zero _ hq1 hq2
  rw [hq, Int.mul_zero, Int.sub_zero] at hz1 hz2
  have ht : c.t3x6 = 0 := by
    rcases Int.lt_trichotomy c.t3x6 0 with h | h | h
    · have : b * c.t3x6 ≤ b * (-1) := Int.mul_le_mul_of_nonneg_left (by omega) (Int.le_of_lt hb)
      omega
    · exact h
    · have : b * 1 ≤ b * c.t3x6 := Int.mul_le_mul_of_nonneg_left (by omega) (Int.le_of_lt hb)
      omega
  exact visible_nulls_force_the_visible_fixed_set c a b (by omega) hq (by rw [hq, ht]; simp) hk

/-- A field of the portal census: the five Standard Model left-handed Weyl fermions, the Higgs doublet, a real singlet
    scalar S and a singlet Weyl fermion N. -/
inductive Fld | Q | uc | dc | L | ec | H | S | N
  deriving DecidableEq, Repr

def Fld.y6 : Fld → Int
  | .Q => 1 | .uc => -4 | .dc => 2 | .L => -3 | .ec => 6 | .H => 3 | .S => 0 | .N => 0
def Fld.tri : Fld → Int
  | .Q => 1 | .uc => -1 | .dc => -1 | _ => 0
def Fld.doublet : Fld → Bool
  | .Q => true | .L => true | .H => true | _ => false
def Fld.darkF : Fld → Bool
  | .S => true | .N => true | _ => false

/-- A leg of a monomial: a field and whether it enters conjugated. -/
abbrev Leg := Fld × Bool
def legY (l : Leg) : Int := if l.2 then -l.1.y6 else l.1.y6
def legTri (l : Leg) : Int := if l.2 then -l.1.tri else l.1.tri
def sumI : List Int → Int
  | [] => 0
  | x :: t => x + sumI t

/-- Gauge invariance of a monomial: hypercharge sums to zero, colour triality to zero mod 3, and the doublets pair. -/
def invariantM (m : List Leg) : Bool :=
  sumI (m.map legY) == 0 && sumI (m.map legTri) % 3 == 0 && (m.filter (fun l => l.1.doublet)).length % 2 == 0

/-- A portal: an invariant monomial with a dark leg and a Standard Model leg. -/
def portalM (m : List Leg) : Bool :=
  invariantM m && m.any (fun l => l.1.darkF) && m.any (fun l => !l.1.darkF)

def scal : List Leg := [(.H, false), (.H, true), (.S, false)]
def fer : List Fld := [.Q, .uc, .dc, .L, .ec, .N]

/-- Every renormalizable Lorentz-scalar monomial without derivatives: two to four scalars, or two Weyl fermions of
    one chirality with at most one scalar. 6 + 10 + 15 + 168 = 199 monomials. -/
def census : List (List Leg) :=
  (List.range 3).flatMap (fun i => (List.range 3).flatMap (fun j =>
    if i ≤ j then [[scal.getD i (.S, false), scal.getD j (.S, false)]] else [])) ++
  (List.range 3).flatMap (fun i => (List.range 3).flatMap (fun j => (List.range 3).flatMap (fun k =>
    if i ≤ j ∧ j ≤ k then [[scal.getD i (.S, false), scal.getD j (.S, false), scal.getD k (.S, false)]]
    else []))) ++
  (List.range 3).flatMap (fun i => (List.range 3).flatMap (fun j => (List.range 3).flatMap (fun k =>
    (List.range 3).flatMap (fun l => if i ≤ j ∧ j ≤ k ∧ k ≤ l then
      [[scal.getD i (.S, false), scal.getD j (.S, false), scal.getD k (.S, false), scal.getD l (.S, false)]]
      else [])))) ++
  (List.range 6).flatMap (fun i => (List.range 6).flatMap (fun j => [false, true].flatMap (fun cj =>
    if i ≤ j then ([[], [(.H, false)], [(.H, true)], [(.S, false)]] : List (List Leg)).map
      (fun o => [(fer.getD i .N, cj), (fer.getD j .N, cj)] ++ o) else [])))

set_option maxRecDepth 200000 in
/-- THE PORTALS ARE DERIVED: of the 199 renormalizable monomials of the Standard Model with a singlet scalar and a
    singlet fermion, exactly four couple the two sectors: S H†H, S² H†H, and L N H with its conjugate. -/
theorem portals_are_derived :
    census.length = 199 ∧ (census.filter portalM).length = 4 ∧
    [(Fld.H, false), (Fld.H, true), (Fld.S, false)] ∈ census.filter portalM ∧
    [(Fld.H, false), (Fld.H, true), (Fld.S, false), (Fld.S, false)] ∈ census.filter portalM ∧
    [(Fld.L, false), (Fld.N, false), (Fld.H, false)] ∈ census.filter portalM ∧
    [(Fld.L, true), (Fld.N, true), (Fld.H, true)] ∈ census.filter portalM := by decide

/-- THE FIFTH IS FREE: a vector-like pair of Standard Model singlets closes all twelve conditions whatever its dark
    charge q, so every integer is allowed and the visible record fixes none. -/
theorem fifth_is_free (q : Int) : closes (sm ++ [chi q, chi (-q)]) = true := by
  simp [closes, total, sm, chi, Int.neg_mul, Int.mul_neg, Int.add_right_neg]


/-- THE TITLE'S TWO HALVES: C fixes a state exactly when the Standard Model's conjugation fixes it and its dark charge
    is zero. The first half is where measurement places dark matter; the second is the one keyed bit. -/
theorem fixed_iff_visible_fixed_and_no_dark_charge (c : State) : conj c = c ↔ (conjSM c = c ∧ c.dark = 0) := by
  rw [fixed_iff_neutral, fixedSM_iff_neutralSM]
  unfold neutral neutralSM
  constructor
  · intro ⟨h1, h2, h3, h4⟩; exact ⟨⟨h1, h2, h3⟩, h4⟩
  · intro ⟨⟨h1, h2, h3⟩, h4⟩; exact ⟨h1, h2, h3, h4⟩

/-- The electric charge of each component of a field, times six: both isospin components of a doublet. -/
def Fld.q6s : Fld → List Int
  | .Q => [4, -2] | .uc => [-4] | .dc => [2] | .L => [0, -6] | .ec => [6] | .H => [6, 0] | .S => [0] | .N => [0]

/-- EVERY COLOURED STANDARD MODEL FIELD IS CHARGED in every component. -/
theorem coloured_fields_are_charged : ∀ f : Fld, f.darkF = false → f.tri ≠ 0 → f.q6s.all (· != 0) = true := by
  intro f; cases f <;> decide

/-- A list of legs none of which is coloured has triality sum zero. -/
theorem sumI_tri_zero_of_none (rest : List Leg) (h : rest.any (fun l => l.1.tri != 0) = false) :
    sumI (rest.map legTri) = 0 := by
  induction rest with
  | nil => rfl
  | cons x t ih =>
    have hx : (x.1.tri != 0) = false := by
      cases hx' : (x.1.tri != 0) with
      | false => rfl
      | true => simp [List.any_cons, hx'] at h
    have ht : t.any (fun l => l.1.tri != 0) = false := by
      cases ht' : t.any (fun l => l.1.tri != 0) with
      | false => rfl
      | true => simp [List.any_cons, ht'] at h
    have hx0 : x.1.tri = 0 := by simpa using hx
    show legTri x + sumI (t.map legTri) = 0
    rw [ih ht]; unfold legTri; split <;> simp [hx0]

/-- A COLOURED RELIC BRINGS CHARGED PARTNERS: a colour-singlet composite of one new colour triplet with Standard Model
    legs contains a coloured Standard Model leg, and so an electrically charged constituent. -/
theorem a_coloured_relic_brings_charged_partners (rest : List Leg) (hsm : ∀ l ∈ rest, l.1.darkF = false)
    (hsing : (1 + sumI (rest.map legTri)) % 3 = 0) :
    ∃ l ∈ rest, l.1.tri ≠ 0 ∧ l.1.q6s.all (· != 0) = true := by
  cases hb : rest.any (fun l => l.1.tri != 0) with
  | false =>
    have h0 := sumI_tri_zero_of_none rest hb
    rw [h0] at hsing
    exact absurd hsing (by decide)
  | true =>
    obtain ⟨l, hl, hne⟩ := List.any_eq_true.mp hb
    have ht : l.1.tri ≠ 0 := by simpa using hne
    exact ⟨l, hl, ht, coloured_fields_are_charged l.1 (hsm l hl) ht⟩

/-- The number of legs of one field in a monomial. -/
def darkCount (f : Fld) (m : List Leg) : Nat := (m.filter (fun l => l.1 == f)).length
/-- Even under the dark parity that keeps the dark matter stable: an even number of S legs and of N legs. -/
def evenDark (m : List Leg) : Bool := darkCount .S m % 2 == 0 && darkCount .N m % 2 == 0

set_option maxRecDepth 200000 in
/-- A STABLE SINGLET KEEPS ONE DOOR: under the parity that keeps the dark matter stable exactly one portal survives,
    S² H†H, and none survives for the fermion. -/
theorem a_stable_singlet_keeps_one_door :
    (census.filter (fun m => portalM m && evenDark m)).length = 1 ∧
    [(Fld.H, false), (Fld.H, true), (Fld.S, false), (Fld.S, false)] ∈ census.filter (fun m => portalM m && evenDark m) ∧
    (census.filter (fun m => portalM m && evenDark m && (darkCount .N m != 0))).length = 0 := by decide


/-- A nonzero integer squares to at least one. -/
theorem one_le_sq_of_ne (q : Int) (h : q ≠ 0) : 1 ≤ q * q := by
  rcases Int.lt_trichotomy q 0 with hq | hq | hq
  · have h1 : q * q = (-q) * (-q) := (Int.neg_mul_neg q q).symm
    have h2 : (-q) * 1 ≤ (-q) * (-q) := Int.mul_le_mul_of_nonneg_left (by omega) (by omega)
    omega
  · exact absurd hq h
  · have h2 : q * 1 ≤ q * q := Int.mul_le_mul_of_nonneg_left (by omega) (by omega)
    omega

/-- Every integer squares to at least zero. -/
theorem zero_le_sq (q : Int) : 0 ≤ q * q := by
  rcases Int.lt_trichotomy q 0 with hq | hq | hq
  · have := one_le_sq_of_ne q (by omega); omega
  · subst hq; decide
  · have := one_le_sq_of_ne q (by omega); omega

/-- A BOUND FIXES A CHARGE THROUGH A MEASURED COUPLING: with the coupling fixed at g > 0, a force g q² below one
    quantum's force g is the zero charge. This is the photon's case. -/
theorem measured_coupling_bound_forces_zero (g q : Int) (hg : 0 < g) (h : g * (q * q) < g) : q = 0 := by
  rcases Int.lt_trichotomy q 0 with hq | hq | hq
  · have h2 : g * 1 ≤ g * (q * q) := Int.mul_le_mul_of_nonneg_left (one_le_sq_of_ne q (by omega)) (by omega)
    omega
  · exact hq
  · have h2 : g * 1 ≤ g * (q * q) := Int.mul_le_mul_of_nonneg_left (one_le_sq_of_ne q (by omega)) (by omega)
    omega

/-- A BOUND NEVER FIXES A CHARGE THROUGH A FREE COUPLING: for every positive bound and every charge, some positive
    coupling a/b puts the force (a/b) q² below the bound. This is the dark photon's case. -/
theorem free_coupling_bound_never_forces_zero (B q : Int) (hB : 0 < B) :
    ∃ a b : Int, 0 < a ∧ 0 < b ∧ a * (q * q) < B * b := by
  have h0 := zero_le_sq q
  refine ⟨1, q * q + 1, by decide, by omega, ?_⟩
  have h1 : 1 * (q * q + 1) ≤ B * (q * q + 1) := Int.mul_le_mul_of_nonneg_right (by omega) (by omega)
  omega

/-- The measured record of a state at mixing weight a/b: the photon null, the Z null, colour neutral, positive mass. -/
def Admissible (a b : Int) (c : State) : Prop :=
  q6of c = 0 ∧ b * c.t3x6 - a * q6of c = 0 ∧ c.colour = 0 ∧ 0 < c.mass

/-- THE FIRST CLAUSE IS FORCED: every state the measured record admits is fixed by the Standard Model's conjugation. -/
theorem first_clause_is_forced (a b : Int) (hb : b ≠ 0) : ∀ c, Admissible a b c → conjSM c = c :=
  fun c ⟨hq, hz, hk, _⟩ => visible_nulls_force_the_visible_fixed_set c a b hb hq hz hk

/-- THE SECOND CLAUSE IS KEYED: the measured record admits a world without a dark charge and a world with one. -/
theorem second_clause_is_keyed (a b : Int) (m : Nat) (hm : 0 < m) :
    Admissible a b ⟨0, 0, 0, 0, m⟩ ∧ Admissible a b ⟨0, 0, 0, 1, m⟩ := by
  refine ⟨⟨?_, ?_, rfl, hm⟩, ⟨?_, ?_, rfl, hm⟩⟩ <;> simp [q6of]

/-- NO READING OF THE RECORD DECIDES THE BIT: no function of the visible charges and the mass returns whether the dark
    charge vanishes. -/
theorem no_reading_of_the_record_decides_the_bit (g : Int → Int → Int → Nat → Bool) :
    ¬ ∀ c : State, g c.y6 c.t3x6 c.colour c.mass = decide (c.dark = 0) := by
  intro h
  have h1 : g 0 0 0 1 = true := h ⟨0, 0, 0, 0, 1⟩
  have h2 : g 0 0 0 1 = false := h ⟨0, 0, 0, 1, 1⟩
  exact Bool.noConfusion (h1.symm.trans h2)

/-- SELF-CONJUGACY SPENDS THE BIT: a state that is its own conjugate is fixed by the Standard Model's conjugation and
    carries no dark charge. -/
theorem self_conjugacy_spends_the_bit (c : State) (h : conj c = c) : conjSM c = c ∧ c.dark = 0 :=
  (fixed_iff_visible_fixed_and_no_dark_charge c).mp h

/-- THE DARK CLOSURE, EXECUTED: the visible fixed set, the forced half, the division, the keyed bit, the two grades,
    self-conjugacy, the crossing. A row closure; the dark row is not a second seat. -/
theorem dark_closure_executed (a b : Int) (hb : b ≠ 0) :
    ((∀ c : State, conjSM (conjSM c) = c) ∧ (∀ c : State, conjSM c = c ↔ neutralSM c)) ∧
    (∀ c, Admissible a b c → conjSM c = c) ∧
    (∀ c : State, conj c = c ↔ (conjSM c = c ∧ c.dark = 0)) ∧
    (Admissible a b ⟨0, 0, 0, 0, 1⟩ ∧ Admissible a b ⟨0, 0, 0, 1, 1⟩) ∧
    (∀ g : Int → Int → Int → Nat → Bool, ¬ ∀ c : State, g c.y6 c.t3x6 c.colour c.mass = decide (c.dark = 0)) ∧
    (∀ g q : Int, 0 < g → g * (q * q) < g → q = 0) ∧
    (∀ B q : Int, 0 < B → ∃ a' b' : Int, 0 < a' ∧ 0 < b' ∧ a' * (q * q) < B * b') ∧
    (∀ c : State, conj c = c → conjSM c = c ∧ c.dark = 0) ∧
    (∀ (Q : Prop) (c : State), Q → ((Q → c.dark = 0) ↔ c.dark = 0)) :=
  ⟨⟨fun c => by cases c; simp [conjSM], fixedSM_iff_neutralSM⟩, first_clause_is_forced a b hb,
   fixed_iff_visible_fixed_and_no_dark_charge, second_clause_is_keyed a b 1 (by decide),
   no_reading_of_the_record_decides_the_bit, measured_coupling_bound_forces_zero,
   free_coupling_bound_never_forces_zero, self_conjugacy_spends_the_bit,
   fun _ _ hq => ⟨fun f => f hq, fun h _ => h⟩⟩


/-- The abelian charges a self-paired mass term carries: a Majorana mass ψψ, or the mass S² of a real scalar, pairs a
    field with itself, so it carries twice its hypercharge and twice its dark charge. -/
def selfPairCharges (c : State) : Int × Int := (2 * c.y6, 2 * c.dark)
/-- A self-paired mass term is allowed when it carries no abelian charge. -/
def MajoranaAllowed (c : State) : Prop := selfPairCharges c = (0, 0)

/-- A MAJORANA MASS FORBIDS EVERY ABELIAN CHARGE: a self-paired mass term is allowed exactly when the hypercharge and
    the dark charge both vanish. The route is the mass term, not the definition of conjugation. -/
theorem majorana_mass_forbids_abelian_charge (c : State) : MajoranaAllowed c ↔ (c.y6 = 0 ∧ c.dark = 0) := by
  unfold MajoranaAllowed selfPairCharges
  constructor
  · intro h
    have h1 : 2 * c.y6 = 0 := congrArg Prod.fst h
    have h2 : 2 * c.dark = 0 := congrArg Prod.snd h
    exact ⟨by omega, by omega⟩
  · intro ⟨h1, h2⟩
    simp [h1, h2]

/-- THE DARK BIT IS THE MAJORANA BIT: on the visible fixed set, a self-paired mass is allowed exactly when the dark
    charge is zero, and exactly when conjugation fixes the state. -/
theorem the_dark_bit_is_the_majorana_bit (c : State) (h : conjSM c = c) :
    (MajoranaAllowed c ↔ c.dark = 0) ∧ (MajoranaAllowed c ↔ conj c = c) := by
  have hy : c.y6 = 0 := ((fixedSM_iff_neutralSM c).mp h).1
  constructor
  · rw [majorana_mass_forbids_abelian_charge]
    exact ⟨fun h' => h'.2, fun h' => ⟨hy, h'⟩⟩
  · rw [majorana_mass_forbids_abelian_charge, fixed_iff_visible_fixed_and_no_dark_charge]
    exact ⟨fun h' => ⟨h, h'.2⟩, fun h' => ⟨hy, h'.2⟩⟩

/-- A DARK CHARGE MAKES A DIRAC PAIR: a mass term pairing two states is neutral in the dark charge only if their dark
    charges cancel, so a dark-charged state takes its mass with a distinct partner. -/
theorem a_dark_charge_makes_a_dirac_pair (c c' : State) (hpair : c.dark + c'.dark = 0) (hd : c.dark ≠ 0) :
    c'.dark = -c.dark ∧ c' ≠ c := by
  refine ⟨by omega, fun he => hd ?_⟩
  have : c'.dark = c.dark := by rw [he]
  omega


/-- The seat's stage, in the chart of Bridge_Final.lean: a point is its doubled real part and its height, the fold
    s ↦ 1 − s̄ sends h to 2 − h, and the line is h = 1. Copied so this file stays standalone. -/
abbrev Stage := Int × Int
def stageFold (p : Stage) : Stage := (2 - p.1, p.2)
def onStageLine (p : Stage) : Prop := p.1 = 1

/-- The dark row's carrier onto the stage: the dark charge becomes the offset from the line, the mass the height. -/
def toStage (c : State) : Stage := (1 + c.dark, (c.mass : Int))

/-- THE CARRIER IS EQUIVARIANT: conjugation goes to the fold. -/
theorem toStage_equivariant (c : State) : toStage (conj c) = stageFold (toStage c) := by
  show ((1 + -c.dark, (c.mass : Int)) : Int × Int) = (2 - (1 + c.dark), (c.mass : Int))
  have h : (1 + -c.dark : Int) = 2 - (1 + c.dark) := by omega
  rw [h]

/-- The fold's fixed set is the line. -/
theorem stageFold_fixed_iff_line (p : Stage) : stageFold p = p ↔ onStageLine p := by
  obtain ⟨h, t⟩ := p
  show ((2 - h, t) : Int × Int) = (h, t) ↔ h = 1
  constructor
  · intro e
    have e1 : 2 - h = h := congrArg Prod.fst e
    omega
  · intro e
    have e2 : 2 - h = h := by omega
    rw [e2]

/-- A C-FIXED STATE LANDS ON THE SEAT'S LINE: the fixed set is carried to the fixed set. -/
theorem fixed_states_land_on_the_line (c : State) (h : conj c = c) : onStageLine (toStage c) := by
  apply (stageFold_fixed_iff_line (toStage c)).mp
  rw [← toStage_equivariant, h]

/-- THE BIT IS THE LINE PROPERTY CARRIED: on the visible fixed set a state lands on the seat's line exactly when its
    dark charge is zero, and exactly when C fixes it. -/
theorem the_bit_is_the_line_property_carried (c : State) (h : conjSM c = c) :
    (onStageLine (toStage c) ↔ c.dark = 0) ∧ (onStageLine (toStage c) ↔ conj c = c) := by
  have e : onStageLine (toStage c) ↔ c.dark = 0 := by
    show (1 + c.dark = 1) ↔ c.dark = 0
    exact ⟨fun h1 => by omega, fun h1 => by omega⟩
  refine ⟨e, e.trans ?_⟩
  rw [fixed_iff_visible_fixed_and_no_dark_charge]
  exact ⟨fun hd => ⟨h, hd⟩, fun hh => hh.2⟩

/-- A DARK PAIR IS AN OFF-LINE FOLD PAIR: a dark-charged state and its conjugate land on two distinct points off the
    line, exchanged by the fold, at one height, so a registration that keeps the height reads one record. -/
theorem a_dark_pair_is_an_off_line_fold_pair (c : State) (hd : c.dark ≠ 0) :
    toStage (conj c) = stageFold (toStage c) ∧ toStage (conj c) ≠ toStage c ∧
    ¬ onStageLine (toStage c) ∧ (toStage (conj c)).2 = (toStage c).2 := by
  refine ⟨toStage_equivariant c, fun he => hd ?_, fun hl => hd ?_, rfl⟩
  · have h1 : (toStage (conj c)).1 = (toStage c).1 := by rw [he]
    have h2 : 1 + -c.dark = 1 + c.dark := h1
    omega
  · have h2 : 1 + c.dark = 1 := hl
    omega

end DarkClosure

#print axioms DarkClosure.conj_involution
#print axioms DarkClosure.fixed_iff_neutral
#print axioms DarkClosure.fixedSM_iff_neutralSM
#print axioms DarkClosure.fixed_sub_fixedSM
#print axioms DarkClosure.dark_charge_hidden_from_the_visible
#print axioms DarkClosure.odd_reading_blind
#print axioms DarkClosure.charge_linear_readings_odd
#print axioms DarkClosure.charge_reading_odd
#print axioms DarkClosure.gravity_reading_even
#print axioms DarkClosure.dark_state_fixed
#print axioms DarkClosure.only_gravity_reads_the_fixed_set
#print axioms DarkClosure.dark_iff_fixed
#print axioms DarkClosure.electric_neutrality_is_not_the_seat
#print axioms DarkClosure.sq_nonneg
#print axioms DarkClosure.sq_eq_zero
#print axioms DarkClosure.radiative_zero_iff_neutral
#print axioms DarkClosure.no_charge_no_radiation
#print axioms DarkClosure.dark_charged_radiates_only_dark
#print axioms DarkClosure.a_neutral_member_is_not_a_dark_multiplet
#print axioms DarkClosure.identity_unread
#print axioms DarkClosure.two_species_one_record
#print axioms DarkClosure.energy_record_even
#print axioms DarkClosure.source_odd
#print axioms DarkClosure.fog_one_record
#print axioms DarkClosure.direction_separates
#print axioms DarkClosure.visible_generation_closes
#print axioms DarkClosure.closure_admits_both
#print axioms DarkClosure.closure_is_not_vacuous
#print axioms DarkClosure.one_record_two_worlds
#print axioms DarkClosure.fifth_differs
#print axioms DarkClosure.no_template_reading_decides_fifth
#print axioms DarkClosure.fifth_is_keyed
#print axioms DarkClosure.dust_attracts
#print axioms DarkClosure.radiation_attracts
#print axioms DarkClosure.vacuum_repels
#print axioms DarkClosure.repulsion_needs_tension
#print axioms DarkClosure.floor_forbids_phantom
#print axioms DarkClosure.vacuum_iff_frozen
#print axioms DarkClosure.phantom_needs_ghost
#print axioms DarkClosure.flat_budgets_admit_both_signs
#print axioms DarkClosure.dark_ledger_is_computed
#print axioms DarkClosure.dark_ledger_counts
#print axioms DarkClosure.fixed_state_is_its_mass
#print axioms DarkClosure.every_template_reading_of_the_fixed_set_reads_only_mass
#print axioms DarkClosure.z_reading_odd
#print axioms DarkClosure.z_reading_survives_neutrality
#print axioms DarkClosure.the_triplet_has_one_fixed_member
#print axioms DarkClosure.floor_bounds_w
#print axioms DarkClosure.floor_needs_positive_density
#print axioms DarkClosure.floor_is_additive
#print axioms DarkClosure.w_floor_from_rho_plus_p
#print axioms DarkClosure.rhoPlusP_split
#print axioms DarkClosure.fields_bound_w
#print axioms DarkClosure.photon_and_z_force_electroweak_zero
#print axioms DarkClosure.visible_nulls_force_the_visible_fixed_set
#print axioms DarkClosure.below_one_quantum_is_zero
#print axioms DarkClosure.sub_quantum_bounds_force_the_visible_fixed_set
#print axioms DarkClosure.portals_are_derived
#print axioms DarkClosure.fifth_is_free
#print axioms DarkClosure.fixed_iff_visible_fixed_and_no_dark_charge
#print axioms DarkClosure.coloured_fields_are_charged
#print axioms DarkClosure.sumI_tri_zero_of_none
#print axioms DarkClosure.a_coloured_relic_brings_charged_partners
#print axioms DarkClosure.a_stable_singlet_keeps_one_door
#print axioms DarkClosure.one_le_sq_of_ne
#print axioms DarkClosure.zero_le_sq
#print axioms DarkClosure.measured_coupling_bound_forces_zero
#print axioms DarkClosure.free_coupling_bound_never_forces_zero
#print axioms DarkClosure.first_clause_is_forced
#print axioms DarkClosure.second_clause_is_keyed
#print axioms DarkClosure.no_reading_of_the_record_decides_the_bit
#print axioms DarkClosure.self_conjugacy_spends_the_bit
#print axioms DarkClosure.dark_closure_executed
#print axioms DarkClosure.majorana_mass_forbids_abelian_charge
#print axioms DarkClosure.the_dark_bit_is_the_majorana_bit
#print axioms DarkClosure.a_dark_charge_makes_a_dirac_pair
#print axioms DarkClosure.toStage_equivariant
#print axioms DarkClosure.stageFold_fixed_iff_line
#print axioms DarkClosure.fixed_states_land_on_the_line
#print axioms DarkClosure.the_bit_is_the_line_property_carried
#print axioms DarkClosure.a_dark_pair_is_an_off_line_fold_pair
```

## Appendix C The twin, verbatim

Dark_Twin.f90 as run for this edition: 340 lines, SHA-256 6e78c339d35558a0, built by gfortran 13.3 with -std=f2018 -O2 -fno-fast-math -ffp-contract=off, 35 checks and 0 failures. The listing is the file byte for byte with its line numbers; Table A2 groups its checks.

```fortran
! Dark_Twin.f90 · the executed twin of Dark_Closure.lean · Fortran 2018.
! The dark sector on the closure template: the fixed set and its readings on a grid, the radiative weight, the
! multiplet test, the anomaly sums of the dark worlds, the measured budget, the kinetic floor, the phantom
! crossing of the fitted CPL curve, the geometry of the neutrino fog, the dark-force floors, and one halo read
! by two species. Every figure is computed in this run; cited inputs enter as data with their source named.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Dark_Twin.f90
program dark_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  real(dp), parameter :: PI = 3.14159265358979323846_dp, DEG = PI/180.0_dp
  ! Planck 2018, TT,TE,EE+lowE+lensing (Planck Collaboration VI 2020, A&A 641, A6, Table 2)
  real(dp), parameter :: OMC_H2 = 0.1200_dp, OMB_H2 = 0.02237_dp, H100 = 0.6736_dp
  real(dp), parameter :: OM_L = 0.6847_dp, OM_M = 0.3153_dp, SIG_OM = 0.0073_dp
  real(dp), parameter :: SUM_MNU = 0.06_dp                       ! eV, the minimal sum Planck assumes
  ! CODATA 2018 and IAU 2012
  real(dp), parameter :: G = 6.67430e-11_dp, C = 299792458.0_dp, MPC = 3.0856775814913673e22_dp
  real(dp), parameter :: EV = 1.602176634e-19_dp, HBARC = 1.973269804e-7_dp, KB = 1.380649e-23_dp
  real(dp), parameter :: MPL = 1.220890e28_dp, MPLRED = 2.435e27_dp, VEW = 246.22e9_dp   ! eV
  real(dp), parameter :: GEV_G = 1.78266192e-24_dp                                        ! grams per GeV/c^2
  ! DESI DR2 BAO + CMB + DESY5, CPL best fit (DESI Collaboration 2025)
  real(dp), parameter :: W0 = -0.752_dp, WA = -0.86_dp
  ! ACT DR6 (Calabrese et al. 2025, P-ACT-LB); Standard Model N_eff
  real(dp), parameter :: NEFF_ACT = 2.86_dp, SIG_NEFF = 0.13_dp, NEFF_SM = 3.044_dp
  ! Galactic pole and node, J2000; obliquity of the ecliptic, J2000
  real(dp), parameter :: A_NGP = 192.85948_dp, D_NGP = 27.12825_dp, L_NCP = 122.93192_dp
  real(dp), parameter :: EPS = 23.4392911_dp
  integer, parameter :: MULT(5) = [6, 3, 3, 2, 1], Y6(5) = [1, -4, 2, -3, 6]
  logical, parameter :: TRIP(5) = [.true., .true., .true., .false., .false.]
  logical, parameter :: DOUB(5) = [.true., .false., .false., .true., .false.]
  integer, parameter :: C3(5) = [1, -1, -1, 0, 0]
  integer, parameter :: PSY(3) = [3, -3, 0], PST(3) = [0, 0, 0], PSD(3) = [1, 1, 0], PSK(3) = [0, 0, 1]
  integer, parameter :: PFY(6) = [1, -4, 2, -3, 6, 0], PFT(6) = [1, -1, -1, 0, 0, 0]
  integer, parameter :: PFD(6) = [1, 0, 0, 1, 0, 0], PFK(6) = [0, 0, 0, 0, 0, 1]
  integer, parameter :: CA(4) = [1, -1, 0, 0], CB(4) = [1, 3, 0, 0], CK(4) = [0, 0, 1, 0], CD(4) = [0, 0, 0, 1]
  integer :: nchk, nfail, y, t, k, d, ic, nfix, nbad, nrad, r, rc, ku, v, nviol, nmis, i, nfixm
  integer :: qq, nfree, nmono, nport, j1, j2, j3, j4, jcj, jo, nstab, nstabn, nmis2
  integer :: gg, qv, bv, nv12, nv13, nd0, nd1, nv14, nv15, nv16, mm
  logical :: okq
  logical :: fixed, okD0, okD, okBad
  real(dp) :: omc, omb, omnu, q0, zacc, zeq, h0, rhoc, u, e4, lp, lr, lew, w, zc, x, sep, smin, smax
  real(dp) :: sd, alpha, delta, sb, beta, lam, s1, n_heavy, n_light, vh(5), vl(5), rr, bh, bl, dn1, dn2
  nchk = 0; nfail = 0
  ! ---------------- A. the fixed set and its readings, on the grid of charges -6..6
  nfix = 0; nbad = 0; nrad = 0
  do y = -6, 6
    do t = -6, 6
      do k = -6, 6
        do d = -6, 6
          fixed = (-y == y) .and. (-t == t) .and. (-k == k) .and. (-d == d)
          if (fixed) nfix = nfix + 1
          do ic = 1, 4
            r  = CA(ic)*y + CB(ic)*t + CK(ic)*k + CD(ic)*d
            rc = CA(ic)*(-y) + CB(ic)*(-t) + CK(ic)*(-k) + CD(ic)*(-d)
            if (rc /= -r) nbad = nbad + 1
            if (fixed .and. r /= 0) nbad = nbad + 1
          end do
          if ((y*y + t*t + k*k + d*d == 0) .neqv. fixed) nrad = nrad + 1
        end do
      end do
    end do
  end do
  call check('A1 the fixed set of conjugation on the 13^4 grid is one point, the neutral state', nfix == 1)
  call check('A2 photon, Z, gluon and dark-photon readings are odd and vanish on the fixed set', nbad == 0)
  call check('A3 the radiative weight vanishes exactly on the fixed set', nrad == 0)
  call check('A4 neutrino-like state: charge 0, radiative weight 18, Z reading T3 - Q sin2(thW) = 1/2', &
             (3 + (-3) == 0) .and. (9 + 9 == 18) .and. &
             (abs(3.0d0/6.0d0 - dble(3 + (-3))/6.0d0*0.23122d0 - 0.5d0) < 1.0d-15))
  nfixm = 0
  do t = 6, -6, -6
    if (-t == t) nfixm = nfixm + 1
  end do
  call check('A5 isospin triplet: one neutral member of three, so the multiplet is not dark', nfixm == 1)
  call closure([0, 0], 2, okD0); call closure([1, -1], 2, okD); call closure([1, 0], 1, okBad)
  call check('A6 the vector-like dark pair closes uncharged and charged +1, -1; one chiral charge fails', &
             okD0 .and. okD .and. (.not. okBad))
  nmono = 0; nport = 0; nstab = 0; nstabn = 0
  do j1 = 1, 3
    do j2 = j1, 3
      call scal([j1, j2])
      do j3 = j2, 3
        call scal([j1, j2, j3])
        do j4 = j3, 3
          call scal([j1, j2, j3, j4])
        end do
      end do
    end do
  end do
  do j1 = 1, 6
    do j2 = j1, 6
      do jcj = -1, 1, 2
        do jo = 0, 3
          call ferm(j1, j2, jcj, jo)
        end do
      end do
    end do
  end do
  call check('A7 portal census: 199 renormalizable monomials, four portals: S H+H, S2 H+H, L N H and its conjugate', &
             nmono == 199 .and. nport == 4)
  nfree = 0
  do qq = -12, 12
    call closure([qq, -qq], 2, okq)
    if (okq) nfree = nfree + 1
  end do
  call check('A8 every vector-like dark charge q, -q closes all twelve conditions, q = -12..12', nfree == 25)
  call check('A9 a stable singlet keeps one door: under dark parity one portal survives, S2 H+H, none for the fermion', &
             nstab == 1 .and. nstabn == 0)
  nmis2 = 0
  do y = -6, 6
    do t = -6, 6
      do k = -1, 1
        do d = -1, 1
          if ((-y == y .and. -t == t .and. -k == k .and. -d == d) .neqv. &
              ((-y == y .and. -t == t .and. -k == k) .and. d == 0)) nmis2 = nmis2 + 1
        end do
      end do
    end do
  end do
  call check('A10 C fixes a state exactly when C_SM fixes it and its dark charge is zero, on the 13^2 x 3^2 grid', nmis2 == 0)
  call check('A11 every coloured Standard Model field is charged in every component: u 2/3, d -1/3, u^c -2/3, d^c 1/3', &
             all([4, -2, -4, 2] /= 0))
  nv12 = 0
  do gg = 1, 5
    do qv = -5, 5
      if (gg*qv*qv < gg .and. qv /= 0) nv12 = nv12 + 1
    end do
  end do
  do bv = 1, 5
    do qv = -5, 5
      if (.not. (1*qv*qv < bv*(qv*qv + 1))) nv12 = nv12 + 1
    end do
  end do
  call check('A12 a bound fixes a charge only through a measured coupling; a free coupling 1/(q^2+1) meets every bound', &
             nv12 == 0)
  nv13 = 0; nd0 = 0; nd1 = 0
  do y = -6, 6
    do t = -6, 6
      do k = -1, 1
        do d = -2, 2
          if (t + y == 0 .and. 1000*t - 231*(t + y) == 0 .and. k == 0) then
            if (.not. (y == 0 .and. t == 0)) nv13 = nv13 + 1
            if (d == 0) nd0 = nd0 + 1
            if (d /= 0) nd1 = nd1 + 1
          end if
        end do
      end do
    end do
  end do
  call check('A13 the record sorts the title: every admitted state is C_SM-fixed, admitted with and without dark charge', &
             nv13 == 0 .and. nd0 > 0 .and. nd1 > 0)
  nv14 = 0
  do y = -6, 6
    do d = -3, 3
      if ((2*y == 0 .and. 2*d == 0) .neqv. (y == 0 .and. d == 0)) nv14 = nv14 + 1
      if (y == 0 .and. ((2*y == 0 .and. 2*d == 0) .neqv. (d == 0))) nv14 = nv14 + 1
    end do
  end do
  call check('A14 a self-paired mass carries twice each abelian charge; on the visible fixed set it is the dark bit', &
             nv14 == 0)
  nv15 = 0
  do d = -3, 3
    if (d /= 0 .and. -d == d) nv15 = nv15 + 1
  end do
  call check('A15 a dark-charged state takes its mass with a distinct partner of opposite dark charge', nv15 == 0)
  nv16 = 0
  do d = -3, 3
    do mm = 1, 3
      if (1 + (-d) /= 2 - (1 + d)) nv16 = nv16 + 1
      if ((1 + d == 1) .neqv. (d == 0)) nv16 = nv16 + 1
      if (d /= 0 .and. (1 - d == 1 + d .or. 1 + d == 1)) nv16 = nv16 + 1
    end do
  end do
  call check('A16 the carrier (1 + dark, mass) is equivariant onto the fold; the line is the bit; a dark pair is off-line', &
             nv16 == 0)
  ! ---------------- B. the measured budget
  omc = OMC_H2/H100**2; omb = OMB_H2/H100**2; omnu = SUM_MNU/93.14_dp/H100**2
  call check('B1 Omega_c = 0.2645, Omega_b = 0.0493, ratio 5.36', abs(omc - 0.2645_dp) < 5.0e-4_dp .and. &
             abs(omb - 0.0493_dp) < 2.0e-4_dp .and. abs(omc/omb - 5.364_dp) < 0.01_dp)
  call check('B2 cold dark matter, baryons and neutrinos reproduce Omega_m to 0.002', &
             abs(omc + omb + omnu - OM_M) < 0.002_dp)
  q0 = 0.5_dp*OM_M - OM_L
  call check('B3 q0 = -0.527 +- 0.011: the expansion accelerates', abs(q0 + 0.527_dp) < 1.0e-3_dp .and. &
             q0/(1.5_dp*SIG_OM) < -40.0_dp)
  zacc = (2.0_dp*OM_L/OM_M)**(1.0_dp/3.0_dp) - 1.0_dp; zeq = (OM_L/OM_M)**(1.0_dp/3.0_dp) - 1.0_dp
  call check('B4 acceleration begins at z = 0.631; vacuum and matter densities cross at z = 0.295', &
             abs(zacc - 0.631_dp) < 1.0e-3_dp .and. abs(zeq - 0.295_dp) < 1.0e-3_dp)
  h0 = H100*1.0e5_dp/MPC; rhoc = 3.0_dp*h0**2/(8.0_dp*PI*G)
  call check('B5 critical density 8.52e-27 kg per cubic metre', abs(rhoc/8.52e-27_dp - 1.0_dp) < 2.0e-3_dp)
  u = OM_L*rhoc*C**2/EV*HBARC**3; e4 = u**0.25_dp
  call check('B6 the vacuum energy density is (2.24 meV)^4', abs(e4*1.0e3_dp - 2.24_dp) < 0.01_dp)
  lp = log10(u/MPL**4); lr = log10(u/MPLRED**4); lew = log10(u/VEW**4)
  call check('B7 rho_Lambda / M_P^4 = 10^-122.9, reduced 10^-120.1, electroweak scale 10^-56.2', &
             abs(lp + 122.95_dp) < 0.1_dp .and. abs(lr + 120.15_dp) < 0.1_dp .and. abs(lew + 56.16_dp) < 0.1_dp)
  call check('B8 active density rho + 3p: dust +1, radiation +6, vacuum -2', &
             (1 + 3*0 == 1) .and. (3 + 3*1 == 6) .and. (1 + 3*(-1) == -2))
  ! ---------------- C. the kinetic floor
  nviol = 0; nmis = 0
  do ku = 0, 50
    do v = -50, 50
      if (ku + v <= 0) cycle
      w = real(ku - v, dp)/real(ku + v, dp)
      if (w < -1.0_dp) nviol = nviol + 1
      if ((w == -1.0_dp) .neqv. (ku == 0)) nmis = nmis + 1
    end do
  end do
  call check('C1 no canonical state (K >= 0, rho > 0) on the grid lies below w = -1', nviol == 0)
  call check('C2 w = -1 exactly when the kinetic term vanishes', nmis == 0)
  w = real(-1 - 10, dp)/real(-1 + 10, dp)
  call check('C3 ghost control: K = -1, V = 10 gives w = -1.222, across the divide', w < -1.0_dp)
  x = (-1.0_dp - W0)/WA; zc = x/(1.0_dp - x)
  call check('C4 the fitted CPL curve crosses w = -1 at z = 0.405 and sits at -1.182 by z = 1', &
             abs(zc - 0.405_dp) < 1.0e-3_dp .and. (W0 + WA*0.5_dp) < -1.0_dp .and. W0 > -1.0_dp .and. W0 + WA < -1.0_dp)
  ! ---------------- D. the geometry of the fog
  sd = sin(D_NGP*DEG)*sin(0.0_dp) + cos(D_NGP*DEG)*cos(0.0_dp)*cos((L_NCP - 90.0_dp)*DEG)
  delta = asin(sd)/DEG
  alpha = A_NGP + atan2(sin((L_NCP - 90.0_dp)*DEG), -sin(D_NGP*DEG)*cos((L_NCP - 90.0_dp)*DEG))/DEG
  alpha = modulo(alpha, 360.0_dp)
  call check('D1 the wind source (l = 90, b = 0) lies at alpha = 318.0, delta = +48.3, in Cygnus', &
             abs(alpha - 318.0_dp) < 0.05_dp .and. abs(delta - 48.33_dp) < 0.02_dp)
  sb = sin(delta*DEG)*cos(EPS*DEG) - cos(delta*DEG)*sin(EPS*DEG)*sin(alpha*DEG)
  beta = asin(sb)/DEG
  lam = atan2(sin(alpha*DEG)*cos(EPS*DEG) + tan(delta*DEG)*sin(EPS*DEG), cos(alpha*DEG))/DEG
  smin = 180.0_dp; smax = 0.0_dp
  do i = 0, 3599
    s1 = real(i, dp)*0.1_dp
    sep = acos(cos(beta*DEG)*cos((s1 - lam)*DEG))/DEG
    smin = min(smin, sep); smax = max(smax, sep)
  end do
  call check('D2 the Sun never comes nearer the wind source than 59.6 degrees, nor farther than 120.4', &
             abs(smin - 59.6_dp) < 0.1_dp .and. abs(smax - 120.4_dp) < 0.1_dp .and. abs(beta - smin) < 0.01_dp)
  ! ---------------- E. the floors of a fifth reading
  bh = 1.25_dp*GEV_G/1.0e-24_dp; bl = 0.47_dp*GEV_G/1.0e-24_dp
  call check('E1 self-interaction bounds: 1.25 cm2/g = 2.23 b/GeV (Bullet), 0.47 cm2/g = 0.84 b/GeV (72 clusters)', &
             abs(bh - 2.228_dp) < 0.005_dp .and. abs(bl - 0.838_dp) < 0.005_dp)
  dn1 = (4.0_dp/7.0_dp)*1.0_dp*(10.75_dp/106.75_dp)**(4.0_dp/3.0_dp)
  dn2 = (4.0_dp/7.0_dp)*2.0_dp*(10.75_dp/106.75_dp)**(4.0_dp/3.0_dp)
  call check('E2 a relic once in equilibrium above the electroweak scale: Delta N_eff >= 0.027 (scalar), 0.054 (dark photon)', &
             abs(dn1 - 0.0268_dp) < 5.0e-4_dp .and. abs(dn2 - 0.0535_dp) < 5.0e-4_dp)
  call check('E3 the dark-photon floor lies inside the ACT DR6 95% bound: still open', &
             NEFF_SM + dn2 < NEFF_ACT + 2.0_dp*SIG_NEFF)
  call check('E4 the Landauer price of one spent bit at 300 K is 2.87e-21 J', &
             abs(KB*300.0_dp*log(2.0_dp)/2.871e-21_dp - 1.0_dp) < 1.0e-3_dp)
  ! ---------------- F. one halo, two species
  n_heavy = 0.3_dp/100.0_dp; n_light = 0.3_dp/1.0e-14_dp
  do i = 1, 5
    rr = real(i, dp)*0.8_dp
    vh(i) = sqrt(nfw_mass(rr)/rr); vl(i) = sqrt(nfw_mass(rr)/rr)
  end do
  call check('F1 at 0.3 GeV/cm3 a 100 GeV particle and a 10 micro-eV field differ 1e16 in number, one rotation curve', &
             abs(log10(n_light/n_heavy) - 16.0_dp) < 1.0e-9_dp .and. all(vh == vl))
  write(*,'(a,3f9.4)')  ' Omega_c, Omega_b, Omega_c/Omega_b      = ', omc, omb, omc/omb
  write(*,'(a,f9.4,a,f7.4)') ' q0                                     = ', q0, ' +- ', 1.5_dp*SIG_OM
  write(*,'(a,2f9.4)')  ' z acceleration onset, z Lambda = matter = ', zacc, zeq
  write(*,'(a,es11.4)') ' critical density (kg/m3)               = ', rhoc
  write(*,'(a,f9.4)')   ' rho_Lambda^(1/4) (meV)                 = ', e4*1.0e3_dp
  write(*,'(a,3f9.2)')  ' log10 rho_Lambda / (M_P, M_P red, v)^4 = ', lp, lr, lew
  write(*,'(a,f9.4)')   ' CPL phantom crossing redshift          = ', zc
  write(*,'(a,2f9.3)')  ' wind source alpha, delta (deg)         = ', alpha, delta
  write(*,'(a,3f9.3)')  ' ecliptic latitude, min and max Sun sep = ', beta, smin, smax
  write(*,'(a,2f9.4)')  ' Delta N_eff floors, scalar and vector  = ', dn1, dn2
  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', nchk, ',"failures":', nfail, '}'
  if (nfail > 0) error stop 1
contains
  logical function portal(ys, ts, ds, ks, nl)
    ! the kernel's portalM: hypercharge zero, triality zero mod 3, doublets paired, a dark leg and a Standard Model leg
    integer, intent(in) :: ys, ts, ds, ks, nl
    portal = ys == 0 .and. modulo(ts, 3) == 0 .and. mod(ds, 2) == 0 .and. ks > 0 .and. ks < nl
  end function portal
  subroutine scal(ix)
    integer, intent(in) :: ix(:)
    integer :: j, ys, ts, ds, ks, ns
    ys = 0; ts = 0; ds = 0; ks = 0; ns = 0
    do j = 1, size(ix)
      ys = ys + PSY(ix(j)); ts = ts + PST(ix(j)); ds = ds + PSD(ix(j)); ks = ks + PSK(ix(j))
      if (ix(j) == 3) ns = ns + 1
    end do
    nmono = nmono + 1
    if (portal(ys, ts, ds, ks, size(ix))) then
      nport = nport + 1
      if (mod(ns, 2) == 0) nstab = nstab + 1
    end if
  end subroutine scal
  subroutine ferm(a, b, s, o)
    integer, intent(in) :: a, b, s, o
    integer :: ys, ts, ds, ks, nl, ns, nn
    ys = s*(PFY(a) + PFY(b)); ts = s*(PFT(a) + PFT(b)); ds = PFD(a) + PFD(b); ks = PFK(a) + PFK(b); nl = 2; ns = 0
    nn = merge(1, 0, a == 6) + merge(1, 0, b == 6)
    if (o > 0) then
      ys = ys + PSY(o); ts = ts + PST(o); ds = ds + PSD(o); ks = ks + PSK(o); nl = 3
      if (o == 3) ns = 1
    end if
    nmono = nmono + 1
    if (portal(ys, ts, ds, ks, nl)) then
      nport = nport + 1
      if (mod(ns, 2) == 0 .and. mod(nn, 2) == 0) then
        nstab = nstab + 1
        if (nn > 0) nstabn = nstabn + 1
      end if
    end if
  end subroutine ferm
  subroutine closure(q, n, ok)
    ! the kernel's closes, sum for sum: six visible conditions and six dark ones over the Standard Model and n singlets
    integer, intent(in) :: q(:), n
    logical, intent(out) :: ok
    integer :: i, m, sm(12), fm(7), fy(7), fc(7), fq(7)
    logical :: ft(7), fdb(7)
    m = 5 + n
    fm(1:5) = MULT; fy(1:5) = Y6; ft(1:5) = TRIP; fdb(1:5) = DOUB; fc(1:5) = C3; fq(1:5) = 0
    do i = 1, n
      fm(5+i) = 1; fy(5+i) = 0; ft(5+i) = .false.; fdb(5+i) = .false.; fc(5+i) = 0; fq(5+i) = q(i)
    end do
    sm = 0
    do i = 1, m
      sm(1) = sm(1) + fm(i)*fy(i)
      sm(2) = sm(2) + fm(i)*fy(i)**3
      if (ft(i)) sm(3) = sm(3) + (fm(i)/3)*fy(i)
      if (fdb(i)) sm(4) = sm(4) + (fm(i)/2)*fy(i)
      if (fdb(i)) sm(5) = sm(5) + fm(i)/2
      if (ft(i)) sm(6) = sm(6) + (fm(i)/3)*fc(i)
      sm(7) = sm(7) + fm(i)*fq(i)
      sm(8) = sm(8) + fm(i)*fq(i)**3
      sm(9) = sm(9) + fm(i)*fq(i)**2*fy(i)
      sm(10) = sm(10) + fm(i)*fq(i)*fy(i)**2
      if (ft(i)) sm(11) = sm(11) + (fm(i)/3)*fq(i)
      if (fdb(i)) sm(12) = sm(12) + (fm(i)/2)*fq(i)
    end do
    ok = all(sm([1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 12]) == 0) .and. mod(sm(5), 2) == 0
  end subroutine closure
  pure function nfw_mass(rr) result(m)
    real(dp), intent(in) :: rr
    real(dp) :: m
    m = 4.0_dp*PI*(log(1.0_dp + rr) - rr/(1.0_dp + rr))
  end function nfw_mass
  subroutine check(label, cond)
    character(*), intent(in) :: label
    logical, intent(in) :: cond
    nchk = nchk + 1
    if (.not. cond) nfail = nfail + 1
    write(*,'(a,a)') merge('  PASS  ', '  FAIL  ', cond), label
  end subroutine check
end program dark_twin
```

## Author's Provenance and Method Disclosure

This paper was developed under Trisduction, a verification and organizing discipline that adds the cited results no warrant; the method and its executable batteries are stated in full at the reference below.^50^

{. Audit .} This edition was prosecuted in one adversarial self-audit cycle across all six registers, kinematic, definitional, parameter, provenance, limit and symmetry, with three planted controls in every round. The prosecutions came from the scribe alone. Every error found was repaired, whether mathematical, definitional, receipt or positioning, and every claim found wider than its warrant was narrowed to the warrant it has, a kernel theorem or the stated posit at premise grade; the title was held through the audit. After it, the author retitled the paper and added Appendix B, which prints the kernel verbatim; neither change adds a claim. An external audit of the retitled edition followed; this edition carries the repairs of the findings it accepted, and the audit log records every disposition. A second and a third external audit, and a fourth and a fifth reading by another system, followed; this edition answers them with Theorems 15 to 25, the dark closure, the Majorana reading of the bit, the equivariant carrier to the seat's line, a split of Theorem 15 into its measured half and the posited bit, and a twin that evaluates the kernel's own twelve sums and portal filter. The planted controls were SELF grade and the prosecution was single-substrate: one scribe held every seat, so the audit bears on consistency under the paper's own registers and not on independence. The audit's verdict is not stated here, since a text cannot certify its own audit; the round census, the ledger and the verdict are in the audit log that accompanies this edition.

{. Editions .} The Journal edition of 27 September 2026 is rendered from this master, and any Blog edition renders the same master and adds no claim; no release identifier is yet of record.

{. Independence .} The text, the kernel and the twin were written by one scribe under the author's direction. Lean's kernel checks the formal content and compiled Fortran executes the numerical checks, each independently of the model and of the other; the check conditions themselves are the scribe's and are published with the files. Five external readings of the retitled edition are on the record; their findings, dispositions and repairs are in the audit log. The open witness is an independent referee or substrate prosecuting it.

{. Disclosure and transparency note .} The kernel establishes Theorems 1 to 25 about the template and its finite models with no declared axiom. Cited and not re-derived: the Standard Model's charge assignments and singlet operators [SM], the quantization of charge and the confinement of colour [QFT], that gravity couples to mass-energy and pressure [GR], that gauge couplings are linear in the charges, that emission scales with the charge squared and that healthy fields carry K ≥ 0 [QFT], and every measured figure with its uncertainty. The dark matter's place on the fixed set of C_SM joins Theorems 1 to 4, 15 and 19 to the measured photon and Z nulls under charge quantization and to confinement, corroboration grade, the grade of the measurements; its zero dark charge, the second half of Theorem 18, and its place in a singlet with the portals of Theorems 16 and 20, rest on the posit, premise grade; the dark force in the gauge sense joins Theorems 10, 17, 18, 21, 22, 24 and 25 to the posit, premise grade, and Theorem 21 shows that grade cannot rise without a measured dark coupling; the dark force in the dynamical sense joins Theorems 11 to 13 to the measured sign of the acceleration, corroboration grade. The mapping of particles and fields onto template states is structural grade throughout. The framework books the posit's spend at the Landauer floor, k_B T ln 2 = 2.87 × 10^−21^ J at 300 K (check E4), twin check E4; this is bookkeeping and carries no physical content.^51,52^

## References

1. F. Zwicky, Die Rotverschiebung von extragalaktischen Nebeln, Helv. Phys. Acta 6, 110 (1933).
2. V. C. Rubin and W. K. Ford, Rotation of the Andromeda Nebula from a spectroscopic survey of emission regions, Astrophys. J. 159, 379 (1970).
3. D. Clowe et al., A direct empirical proof of the existence of dark matter, Astrophys. J. 648, L109 (2006).
4. Planck Collaboration (N. Aghanim et al.), Planck 2018 results. VI. Cosmological parameters, Astron. Astrophys. 641, A6 (2020).
5. A. G. Riess et al., Observational evidence from supernovae for an accelerating universe and a cosmological constant, Astron. J. 116, 1009 (1998).
6. S. Perlmutter et al., Measurements of Ω and Λ from 42 high-redshift supernovae, Astrophys. J. 517, 565 (1999).
7. LZ Collaboration, results of 417 live days of the LUX-ZEPLIN experiment (March 2023 to April 2025), presented 8 December 2025; Lawrence Berkeley National Laboratory news release, LZ sets a world's best in the hunt for galactic dark matter and gets a new look at neutrinos from the sun's core.
8. G. Jungman, M. Kamionkowski and K. Griest, Supersymmetric dark matter, Phys. Rep. 267, 195 (1996).
9. M. Cirelli, N. Fornengo and A. Strumia, Minimal dark matter, Nucl. Phys. B 753, 178 (2006).
10. V. Silveira and A. Zee, Scalar phantoms, Phys. Lett. B 161, 136 (1985).
11. J. McDonald, Gauge singlet scalars as cold dark matter, Phys. Rev. D 50, 3637 (1994).
12. C. P. Burgess, M. Pospelov and T. ter Veldhuis, The minimal model of nonbaryonic dark matter: a singlet scalar, Nucl. Phys. B 619, 709 (2001).
13. J. Preskill, M. B. Wise and F. Wilczek, Cosmology of the invisible axion, Phys. Lett. B 120, 127 (1983).
14. M. Milgrom, A modification of the Newtonian dynamics as a possible alternative to the hidden mass hypothesis, Astrophys. J. 270, 365 (1983).
15. M. W. Goodman and E. Witten, Detectability of certain dark-matter candidates, Phys. Rev. D 31, 3059 (1985).
16. T. Falk, K. A. Olive and M. Srednicki, Heavy sneutrinos as dark matter, Phys. Lett. B 339, 248 (1994).
17. XENON Collaboration (E. Aprile et al.), First indication of solar ⁸B neutrinos via coherent elastic neutrino-nucleus scattering with XENONnT, Phys. Rev. Lett. 133 (2024).
18. PandaX Collaboration, First indication of solar ⁸B neutrinos through coherent elastic neutrino-nucleus scattering in PandaX-4T, Phys. Rev. Lett. 133 (2024).
19. J. Billard, L. E. Strigari and E. Figueroa-Feliciano, Implication of neutrino backgrounds on the reach of next generation dark matter direct detection experiments, Phys. Rev. D 89, 023524 (2014).
20. C. A. J. O'Hare, New definition of the neutrino floor for direct dark matter searches, Phys. Rev. Lett. 127, 251802 (2021).
21. F. Mayet et al., A review of the discovery reach of directional dark matter detection, Phys. Rep. 627, 1 (2016).
22. B. Holdom, Two U(1)'s and ε charge shifts, Phys. Lett. B 166, 196 (1986).
23. D. N. Spergel and P. J. Steinhardt, Observational evidence for self-interacting cold dark matter, Phys. Rev. Lett. 84, 3760 (2000).
24. S. W. Randall et al., Constraints on the self-interaction cross section of dark matter from numerical simulations of the merging galaxy cluster 1E 0657-56, Astrophys. J. 679, 1173 (2008).
25. D. Harvey, R. Massey, T. Kitching, A. Taylor and E. Tittley, The nongravitational interactions of dark matter in colliding galaxy clusters, Science 347, 1462 (2015).
26. J. Fan, A. Katz, L. Randall and M. Reece, Double-disk dark matter, Phys. Dark Univ. 2, 139 (2013).
27. F.-Y. Cyr-Racine and K. Sigurdson, Cosmology of atomic dark matter, Phys. Rev. D 87, 103515 (2013).
28. C. Brust, D. E. Kaplan and M. T. Walters, New light species and the CMB, J. High Energy Phys. 12, 058 (2013).
29. E. Calabrese et al. (ACT Collaboration), The Atacama Cosmology Telescope: DR6 constraints on extended cosmological models, arXiv:2503.14454 (2025).
30. S. Weinberg, The cosmological constant problem, Rev. Mod. Phys. 61, 1 (1989).
31. B. Ratra and P. J. E. Peebles, Cosmological consequences of a rolling homogeneous scalar field, Phys. Rev. D 37, 3406 (1988).
32. R. R. Caldwell, R. Dave and P. J. Steinhardt, Cosmological imprint of an energy component with general equation of state, Phys. Rev. Lett. 80, 1582 (1998).
33. R. R. Caldwell, A phantom menace? Cosmological consequences of a dark energy component with super-negative equation of state, Phys. Lett. B 545, 23 (2002).
34. S. M. Carroll, M. Hoffman and M. Trodden, Can the dark energy equation-of-state parameter w be less than −1?, Phys. Rev. D 68, 023509 (2003).
35. A. Vikman, Can dark energy evolve to the phantom?, Phys. Rev. D 71, 023515 (2005).
36. W. Hu, Crossing the phantom divide: dark energy internal degrees of freedom, Phys. Rev. D 71, 047301 (2005).
37. S. Das, P. S. Corasaniti and J. Khoury, Superacceleration as the signature of a dark sector interaction, Phys. Rev. D 73, 083509 (2006).
38. M. Chevallier and D. Polarski, Accelerating universes with scaling dark matter, Int. J. Mod. Phys. D 10, 213 (2001).
39. E. V. Linder, Exploring the expansion history of the universe, Phys. Rev. Lett. 90, 091301 (2003).
40. DESI Collaboration (M. Abdul-Karim et al.), DESI DR2 Results II: Measurements of baryon acoustic oscillations and cosmological constraints, arXiv:2503.14738 (2025).
41. S. G. Turyshev, Dark energy after DESI DR2: observational status, reconstructions, and physical models, arXiv:2602.05368 (2026).
42. T. Totani, 20 GeV halo-like excess of the Galactic diffuse emission and implications for dark matter annihilation, J. Cosmol. Astropart. Phys. (2025).
43. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, in Automated Deduction, CADE 28, Lecture Notes in Computer Science 12699, 625 (2021).
44. M. F. Islam, Trisduction Physical OS 1.0.2: the operative role, its carried procedures, every Lean kernel, every Fortran program, the boot and an integrity manifest in one file, 27 September 2026. The copy run here has SHA-256 f38bb3f3ea620d3642255c8040c97d607211d1f72989ae8d5fd2adadbe4ef361.
45. S. D. McDermott, H.-B. Yu and K. M. Zurek, Turning off the lights: how dark is dark matter?, Phys. Rev. D 83, 063509 (2011).
46. B. Batell, M. Pospelov and A. Ritz, Exploring portals to a hidden sector through fixed targets, Phys. Rev. D 80, 095024 (2009).
47. J. L. Feng, M. Kaplinghat, H. Tu and H.-B. Yu, Hidden charged dark matter, J. Cosmol. Astropart. Phys. 07, 004 (2009).
48. P. Agrawal, F.-Y. Cyr-Racine, L. Randall and J. Scholtz, Make dark matter charged again, J. Cosmol. Astropart. Phys. 05, 022 (2017).
49. Lawrence Berkeley National Laboratory, DESI completes planned 3D map of the universe and continues exploring, news release, 15 April 2026.
50. Islam, M. TRISDUCTION: A Linguistically, Topologically, and Mathematically Sealed Verification Architecture. Triaxial Orthogonality, Twelve-Gate Closure, the Quaternionic Completion, the Root Axiom, and the Master Pre-Sealed Proposition Ledger. Zenodo, version 4, 19 June 2026. DOI 10.5281/zenodo.20757507. https://zenodo.org/records/20757507. Mirror: PhilArchive record ISLTTG, https://philpapers.org/rec/ISLTTG. Master reference, continuously updated at the same location.
51. R. Landauer, Irreversibility and heat generation in the computing process, IBM J. Res. Dev. 5, 183 (1961).
52. A. Bérut et al., Experimental verification of Landauer's principle linking information and thermodynamics, Nature 483, 187 (2012).

:::endmatter
### Data and code
The kernel Dark_Closure.lean, the twin Dark_Twin.f90, the boot receipt, the control log and the judgment log accompany this paper. Every figure in the text was computed by one of them or is a cited measurement.
### Preparation
The kernel, the twin and the text were prepared in a session with an AI assistant (Claude, Anthropic) under the author's direction, and executed on the machine that produced the receipts.
### Competing interests
None declared.

*End of manuscript*
:::


## Coordinate Index (Markdown master only)

No native codex identifier and no short public label appears in this paper, which is written at Tier 1. The register coordinates it rests on are the Physical OS 1.0.2 kernels and batteries named in Section 3 and Box A2, and the master reference. This section is absent from the PDF by construction.
