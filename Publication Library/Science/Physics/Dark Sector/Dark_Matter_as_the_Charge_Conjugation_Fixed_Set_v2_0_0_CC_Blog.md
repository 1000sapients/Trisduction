# Dark Matter as the Charge-Conjugation Fixed Set and the Dark Force as One Keyed Bit

## A Trisductive Theory of Dark Matter and the Dark Force: Why Only the Fourth Reading Sees It

**Mohammad F. Islam PhD** · 25 November 2026

*Blog edition of the master, edition 2.0.0 of 25 November 2026. It renders the whole text. The printed files of the appendices stand in the master and in the Journal edition, and are listed at the end.*

## Abstract

This paper proves, in Lean 4 with Mathlib, that a state is invisible to every charge-linear reading exactly when charge conjugation fixes it, and that whether such a state carries a dark charge is a bit no visible record contains. A state is four charges, hypercharge, weak isospin, colour and a dark charge, and a mass, in any field of characteristic zero. Conjugation turns the sign of the charges and keeps the mass. It fixes a state exactly when the four charges vanish; every odd reading, linear or not, returns zero there; and any reading at all takes one value on two fixed states of one mass, so the mass is what is left to read. Fixedness splits into two halves: a visible half, which zero electric charge and a zero reading of the Z force at every mixing weight, and a zero dark charge, which nothing visible forces. The anomaly sums of one generation with two singlets vanish exactly when the two dark charges sum to zero, so a pair of charges *q* and  − *q* closes for every *q*, two worlds that close leave one visible record, and no function of that record says whether a dark charge exists. With the coupling measured a bound inside one quantum is a zero; with the coupling free every charge meets every bound. A mass term that pairs a field with itself is allowed exactly when the charge is zero. Of the 199 renormalizable terms of the Standard Model with a singlet scalar and a singlet fermion, four pass the tests of invariance and join the two sectors, and one survives the parity that keeps the dark matter stable. For any number of canonical fields at positive density the equation of state is at least  − 1, with equality only for the frozen field. The premises are fields of one printed structure: the two measured nulls, no colour, the posit that no member carries a dark charge, and canonical dark energy. The structure is inhabited, and a state is exhibited that meets every measured field and fails the posit. A Fortran twin recounts the census, finds the same sets by search, and sets the consequences against measurement: a deceleration of  − 0.527 ± 0.011, and a fitted curve of the equation of state that crosses  − 1 at redshift 0.405, below the floor. That crossing is the paper’s sharpest exposure and is stated as such. Part II states the reading from which the paper takes its place in the series, at premise grade and apart from the machine-checked claims.

## 1. The Theorem and What It Rests On

### 1.1 The statement

A state *s* has hypercharge *y*, weak isospin *t*, colour *c*, dark charge *d* and mass *m*. Conjugation is *C*(*y*,*t*,*c*,*d*,*m*) = (−*y*,−*t*,−*c*,−*d*,*m*), and visible conjugation *C*_V turns *y*, *t* and *c* only. A reading *f* is odd when *f*(*C**s*) =  − *f*(*s*). A charge-linear reading is *a**y* + *b**t* + *k**c* + *e**d*. Electric charge is *Q* = *t* + *y* and the reading of the Z at mixing weight *w* is *Z*_w = *t* − *w**Q*.

**Theorem (`fixed_iff`).** *C**s* = *s* exactly when *y* = *t* = *c* = *d* = 0.

**Theorem (`odd_readings_are_blind`).** If *f* is odd and *C**s* = *s*, then *f*(*s*) = 0.

**Theorem (`dark_is_fixed`).** Every charge-linear reading returns zero on *s* exactly when *C**s* = *s*.

**Theorem (`fixed_iff_visible_and_dark`).** *C**s* = *s* exactly when *C*_V*s* = *s* and *d* = 0.

**Theorem (`the_two_nulls_force_the_visible_half`).** At any mixing weight, *Q* = 0 and *Z*_w = 0 give *t* = 0 and *y* = 0.

**Theorem (`a_pair_of_singlets_closes_iff`).** One generation with two singlets of dark charges *a* and *b* satisfies the eleven anomaly sums and the count of doublets exactly when *a* + *b* = 0.

**Theorem (`the_visible_record_does_not_decide`).** The world with dark charges 0 and 0 and the world with 1 and  − 1 both close and have one visible record, and no function of the visible record returns whether a dark charge exists.

**Theorem (`the_floor_is_additive`).** For canonical fields with kinetic densities *K*ⱼ ≥ 0 and potentials *V*ⱼ, at positive total density, ∑ⱼ(*K*ⱼ−*V*ⱼ)/∑ⱼ(*K*ⱼ+*V*ⱼ) ≥  − 1.

**Theorem (`dark_forced`).** On the premises below: conjugation fixes every member of the dark multiplet; every odd reading of a member is zero; a member radiates through no charge; a mass term that pairs a member with itself is allowed; and the equation of state of dark energy is at least  − 1.

That a neutral particle with weak charges is seen through the Z is the criterion of direct detection \[8, 9\]. That a singlet reaches the Standard Model through the Higgs field is classical \[11, 12, 13\], and the list of portals is classical \[14\]. That a canonical field cannot cross  − 1 is classical \[27, 28, 29\]. What compiles here, in Lean 4 \[40\] with Mathlib \[39\], is the equivalence of darkness and fixedness, its two halves, the bit that the anomaly sums cannot set, and the floor. The premises are met: `darkPremises` constructs a term of the structure. The posit is not a consequence of the measured fields: `the_posit_is_not_forced` exhibits a state that meets them and carries a dark charge.

### 1.2 The premises, printed

The physical premises of the paper are the fields of this structure of the Lean file, and there are no others. What is cited is in the tables of Section 1.3.

``` lean
structure Premises where
  /-- the mixing weight -/
  w : ℝ
  /-- the members of the multiplets of the dark matter -/
  n : ℕ
  member : Fin n → State ℝ
  /-- measured: no member answers the photon or the Z, and none is coloured -/
  photon : ∀ k, charge (member k) = 0
  zboson : ∀ k, zed w (member k) = 0
  colourless : ∀ k, (member k).c = 0
  /-- the posit: no member carries a dark charge -/
  posit : ∀ k, (member k).d = 0
  /-- dark energy is canonical fields with positive total density -/
  N : ℕ
  K : Fin N → ℝ
  V : Fin N → ℝ
  canonical : ∀ j, 0 ≤ K j
  dense : 0 < ∑ j, (K j + V j)
```

It carries three premises. The first is the fields `photon`, `zboson` and `colourless`: no member of the multiplets of the dark matter answers the photon or the Z, and none is coloured. These are measured as bounds, and a bound becomes a zero only because charge comes in quanta; Section 3 says how. The second is the field `posit`: no member carries a dark charge. Nothing measured forces it, and Section 5 proves that nothing in the visible record can. The third is the fields `canonical` and `dense`: dark energy is a finite number of fields with kinetic density at least zero and positive total density. That it exchanges nothing with matter is part of this premise.

### 1.3 What is proved, what is cited, what is assumed

- **Conjugation fixes a state exactly when its four charges vanish; the fixed set splits into a visible half and a zero dark charge, and the first lies strictly inside the second** · Standing: Proved, over every field of characteristic zero; Where: Appendix A, Part I
- **Every odd reading is zero on a fixed state; a state is blind to every charge-linear reading exactly when it is fixed; any reading takes one value on fixed states of one mass** · Standing: Proved; Where: Part II
- **The charges of a neutrino are neutral and not fixed; two nulls force zero isospin and hypercharge at every mixing weight** · Standing: Proved; Where: Part III
- **A whole charge bounded inside one quantum is zero; at a measured coupling a bounded force is the zero charge; at a free coupling every charge meets every bound** · Standing: Proved; Where: Part III
- **The radiative weight vanishes exactly on the fixed set; one member of a triplet is fixed** · Standing: Proved; Where: Part IV

The table continues with the record, the sums, the mass term, the census, the floor and the premises.

- **Two worlds with one record and different labels: no function of the record returns the label** · Standing: Proved; Where: Part V
- **One generation closes; with two singlets it closes exactly when their dark charges sum to zero; no function of the visible record says whether a dark charge exists** · Standing: Proved; Where: Part VI
- **A self-paired mass term is allowed exactly when hypercharge and dark charge vanish; conjugation is carried to a reflection of the plane** · Standing: Proved; Where: Part VII
- **Of 199 terms four are portals, and one survives the parity** · Standing: Proved, by evaluation of a finite list; Where: Part VIII
- **The vacuum repels; at positive density the equation of state of canonical fields is at least  − 1, exactly  − 1 only when frozen; below it the kinetic density is negative** · Standing: Proved; Where: Part IX
- **On the premises, the five statements of `dark_forced`; the premises are met; the posit is not forced** · Standing: Proved; Where: Part X

What is not machine-checked is in the third table.

- **The dark matter of the sky answers neither the photon nor the Z and is not coloured** · Standing: Premise; measured as bounds \[3, 7, 16\]; Where: Section 3
- **No member of its multiplets carries a dark charge** · Standing: Premise; a posit, tested by \[20, 21, 24\]; Where: Section 5
- **The anomaly sums, with their weights, must vanish** · Standing: Classical, entered: \[35, 36, 37, 38\]; Where: Section 5
- **A mass term that pairs a field with itself carries twice each of its abelian charges** · Standing: Classical, entered; Where: Section 5
- **The three tests of Section 6 are gauge invariance for the terms of the census; a term outside the census starts at dimension five** · Standing: Classical, entered: \[14\]; Where: Section 6
- **The acceleration reads density plus three times pressure; a canonical field has density *K* + *V* and pressure *K* − *V** · Standing: Classical, entered: \[26\]; Where: Section 7
- **Dark energy is canonical fields that exchange nothing with matter** · Standing: Premise; Where: Section 7
- **The measured values of the twin** · Standing: Entered from the literature \[4, 20, 21, 24, 33\]; numerical, not machine-checked; Where: Section 8

The paper claims as machine-checked the rows marked proved and no others. A row marked entered is a classical formula or a measured value; the theorems that use a formula are algebra on it. Part II, the reading, is outside these tables: it is premise-grade and is labelled so where it begins.

## 2. States, Conjugation and Readings

The evidence for dark matter is gravitational: the motions of galaxies in clusters \[1\], the rotation of galaxies \[2\], and a collision of clusters in which the mass, mapped by lensing, parted from the gas \[3\]. It makes about five sixths of the matter in the measured budget \[4\]. No reading other than gravity has found it \[7\]. The question of this section is what kind of state such a thing can be.

A state is five numbers, and the only structure asked of them is a field of characteristic zero. `conj_involutive` shows that conjugation done twice is the identity. `fixed_iff` finds its fixed set: a charge equal to its own negative is zero, since two is not zero in the field, so *C**s* = *s* exactly when all four charges vanish.

A reading is any function of the state. `every_linear_reading_is_odd` shows that *a**y* + *b**t* + *k**c* + *e**d* is odd for every choice of the four weights; these are the couplings of the photon, the Z, the diagonal gluons and a dark photon to the state. `zed_is_odd` shows it of the Z at every mixing weight.

**Theorem (`odd_readings_are_blind`).** An odd reading is zero on every fixed state.

The proof does not use linearity: *f*(*s*) = *f*(*C**s*) =  − *f*(*s*). `dark_is_fixed` is the converse for the linear readings, since the four charges are themselves among them. Darkness to every charge-linear reading and membership of the fixed set are one property.

`the_mass_is_even` shows that the mass is kept by conjugation, and `only_the_mass_is_read` that a fixed state is its mass: any reading whatever, of any kind and with any values, agrees on two fixed states of one mass. Gravity reads mass and energy, as the companion paper on gravity derives \[43\]. Beside the three gauge readings of the Standard Model it is the fourth reading, and among the readings of a state it is the one left to see a fixed state.

## 3. The Visible Half Is Forced

Electric neutrality is not darkness. `neutral_is_not_dark` takes the charges of a neutrino, isospin one half and hypercharge minus one half: the electric charge is zero, the reading of the Z is one half at every mixing weight, and conjugation moves the state. A neutral candidate that carries weak charges scatters through the Z, and candidates of that kind were excluded early \[8, 9\].

Two nulls together do what one cannot.

**Theorem (`the_two_nulls_force_the_visible_half`).** If *Q* = 0 and *Z*_w = 0, then *t* = 0 and *y* = 0, whatever the mixing weight.

With no colour, `the_nulls_and_no_colour_fix_the_visible_half` gives *C*_V*s* = *s*. `fixed_iff_visible_and_dark` then states what is left: conjugation fixes the state exactly when, in addition, its dark charge is zero. `the_dark_half_is_not_the_visible_half` exhibits a state in the visible half and outside the fixed set.

A measurement gives a bound and not a zero. Two theorems say when a bound is a zero. `a_bound_inside_one_quantum_is_a_zero`: a charge counted in whole quanta and bounded strictly inside one is zero. The bounds on an electric charge of the dark matter lie far inside one sixth of the charge of the electron \[16\], and searches for a Z coupling of full strength exclude it by orders \[7\], so with charge in quanta the two nulls are exact, and they are the fields `photon` and `zboson`. `a_bound_at_a_measured_coupling_is_a_zero` is the same statement for a force *g**q*² at a known coupling. One case is outside the Z null and is named: a state that is its own antiparticle has no vector current of the Z, so for it the null bounds nothing directly; its weak charges are reached through its charged partners, and the field `photon` is asked of every member.

**Theorem (`a_free_coupling_meets_every_bound`).** For every whole charge and every positive bound there is a positive coupling at which the force is below the bound.

That is the dark charge. Its coupling is not measured, so no bound on a dark force, however tight, is a zero of the dark charge. Models with a dark charge and a small coupling pass the present bounds \[17, 18\]. The two halves of the fixed set therefore stand at two grades, and the paper keeps them apart: the visible half is measured, and the dark half is the posit.

Two consequences of the fixed set are separate theorems. `weight_zero_iff_fixed`: the sum of the squares of the charges vanishes exactly on the fixed set. Rates of emission go as the square of a charge, so a fixed state does not cool by radiating through a charge; that the halo is extended and not a disk is then the standard account of cooling, entered. `a_dark_charge_radiates_dark_only` gives the other case: a dark-charged state has no visible weight and a weight of one, the dissipative dark matter of the double-disk proposal \[22\]. And `one_member_of_a_triplet_is_fixed`: of a triplet of isospin, only the middle member is fixed, so a neutral member of a charged multiplet is not a dark multiplet \[10\]. The field `photon` is asked of every member.

## 4. What Gravity Cannot Read

**Theorem (`no_reading_returns_what_the_record_forgets`).** If two worlds leave one record and carry different labels, no function of the record returns the label.

`gravity_does_not_read_identity` applies it: two fixed states of one mass and different names are one state, and no reading of the state returns the name. Since a fixed state is its mass, more gravitational evidence of the same kind cannot name the particle. Identity needs a second reading, and Section 6 finds which second readings exist.

## 5. The Dark Charge Is Not in the Record

Is there a dark force, a fifth reading with its own charge? Field theory constrains the charges of a theory through sums that must vanish \[35, 36, 37\]: for each field, weights from the sizes of its colour and isospin multiplets, times powers of its charges. With hypercharge and a dark charge there are eleven such sums, five that read the Standard Model alone and six that read the dark charge, and the number of isospin doublets must be even \[38\]. They are entered. `Closes` is their conjunction for a list of left-handed fields.

`one_generation_closes` verifies the five and the count on one generation, the classification of the companion paper on charges \[42\]. Add two singlets of the Standard Model with dark charges *a* and *b*.

**Theorem (`a_pair_of_singlets_closes_iff`).** The list closes exactly when *a* + *b* = 0.

`a_vector_like_pair_closes_for_every_charge` follows: charges *q* and  − *q* close for every *q* in the field. `a_chiral_singlet_fails`: one singlet with a dark charge does not. The sums are not empty, since they reject a world; they are not decisive, since they admit a family.

**Theorem (`the_visible_record_does_not_decide`).** The worlds (0,0) and (1,−1) both close and have the same visible record, and no function of the visible record of a list returns whether the list holds a dark charge.

The visible record of a field is everything about it but its dark charge. Whether a dark charge exists is therefore a bit that the Standard Model’s own conditions cannot set and its own readings cannot return. This paper calls such a bit keyed: two admitted worlds, one record. By Section 3 no bound sets it either. It is owed to an observation of another kind: a dark radiation, a self-interaction, a dark disk \[19, 22, 23\], or the mixing of a dark photon with hypercharge \[15\].

One observable is named by a theorem. A mass term that pairs a field with itself carries twice each of its abelian charges; that is entered.

**Theorem (`a_self_paired_mass_iff`).** 2*y* = 0 and 2*d* = 0 exactly when *y* = 0 and *d* = 0.

`on_the_visible_half_self_paired_iff_fixed`: on the visible half, such a mass is allowed exactly when conjugation fixes the state. `a_pair_takes_its_mass_together`: a state with a dark charge takes its mass with a partner of the opposite charge. The bit is therefore whether the dark matter is its own antiparticle. That is a measurement not yet made.

The posit spends the bit. It says that no member carries a dark charge, and it is the field `posit`.

## 6. The Doors

If every member is fixed, the dark matter is a singlet of the Standard Model. How can a singlet be read at all, other than by gravity? Part VIII of the engine counts. Take one generation of fermions, the Higgs doublet, a real singlet scalar *S* and a singlet fermion *N*. A renormalizable term without derivatives that can be a Lorentz scalar is two to four scalars, or two fermions of one chirality with at most one scalar. `census` lists them: 199.

A term `passes` when its hypercharge sums to zero, its colour triality is zero modulo three, and its doublets pair. These three tests are necessary for invariance; that they are sufficient for the terms of the census is classical and is entered \[14\]. A `portal` is a term that passes and has a leg in each sector.

**Theorem (`portals_are_derived`).** Of the 199 terms exactly four are portals: *S**H*^(†)*H*, *S*²*H*^(†)*H*, and *L**N**H* with its conjugate.

**Theorem (`a_stable_singlet_keeps_one_door`).** Under the parity that keeps the dark matter stable, exactly one portal survives, *S*²*H*^(†)*H*, and none that contains *N*.

A stable singlet scalar is therefore read through one coupling to the Higgs field, which ties its scattering on nuclei to the invisible width of the Higgs boson \[11, 12, 13\]. A stable singlet fermion has no renormalizable door at all. A coupling through a derivative, or of an axion to two photons, starts at dimension five and is outside the census; a mixing of a dark photon needs a dark gauge field, which the posit removes.

## 7. Acceleration

The expansion accelerates \[5, 6\]. The acceleration reads the active density *ρ* + 3*p*, entered from general relativity. `the_vacuum_repels`: with *p* =  − *ρ* the active density is  − 2*ρ*. `dust_and_radiation_attract`, and `repulsion_iff`: repulsion needs 3*p* &lt;  − *ρ*. The dark force in this sense is not a fifth force. It is gravity reading a pressure.

A canonical field with kinetic density *K* and potential *V* has density *K* + *V* and pressure *K* − *V* \[26\]. `density_plus_pressure`: their sum is 2*K*.

**Theorem (`the_floor`).** If *K* ≥ 0 and *K* + *V* &gt; 0, then (*K*−*V*)/(*K*+*V*) ≥  − 1.

`the_floor_is_exact`: equality holds exactly when *K* = 0, the frozen field, a constant \[25\]. `below_the_floor_is_a_ghost`: a value below  − 1 at positive density needs *K* &lt; 0 \[27, 28\]. `the_floor_fails_at_negative_density`: with *K* = 1 and *V* =  − 3 the value is  − 2, so the hypothesis of positive density is used. `the_floor_is_additive`: the floor holds for any finite number of canonical fields at positive total density, so no count of such fields crosses  − 1; for one field of a more general kind the obstruction is known \[29\].

`the_sign_is_read`: a flat world of matter alone decelerates, and the measured budget \[4\] accelerates. The theorems fix the sign of the pull of a vacuum. They do not require a vacuum to be there, and they say nothing of its size. The magnitude of the vacuum density is not derived \[25\].

## 8. The Numerical Twin

The twin of Appendix B does three things the kernel does not. It finds the sets of Sections 2 to 5 by search, it recounts the census by independent code, and it sets the consequences against measurement.

**The searches.** Of 625 states with whole charges from  − 2 to 2, conjugation fixes one and visible conjugation five, and one is blind to all 625 linear readings: the same one. At the mixing weight 0.2312, of 625 pairs of isospin and hypercharge in sixths, one has both nulls inside half a quantum. Of 121 pairs of dark charges, the 11 that sum to zero close and no other. The census has 199 terms, four portals, one that survives the parity and none of those with the fermion.

**The acceleration.** The inputs are measured and are printed in Appendix B.

- **Deceleration of the measured budget** · Computed: − 0.527 ± 0.011; From: matter 0.3153, vacuum 0.6847 \[4\]
- **Redshift at which acceleration begins** · Computed: 0.632; From: the same
- **Redshift at which vacuum overtakes matter** · Computed: 0.295; From: the same
- **Dark matter to baryons** · Computed: 5.37, and 5.36 in physical densities; From: 0.2645 and 0.0493; 0.1200 and 0.02237 \[4\]
- **Vacuum density** · Computed: (2.24 meV)⁴, 122.9 orders below the Planck density; From: the same

**The floor and the fitted curve.** On a grid of canonical fields at positive density the least equation of state is  − 1.00000, reached only by the frozen field. The fit of the second release of DESI with supernovae, *w*₀ =  − 0.752 and *w*ₐ =  − 0.86 in the form of \[31, 32\], crosses  − 1 at redshift 0.405 and is at  − 1.182 at redshift 1 \[33\]. The curve lies below the floor. Section 10 says what follows.

**The bounds on the posit.** The bounds on self-interaction, 1.25 cm²/g from one cluster \[20\] and 0.47 cm²/g from 72 \[21\], are 2.23 and 0.84 barn per GeV. A light relic once in equilibrium above the weak scale adds 0.027 to the count of light species for each boson state \[23\], so a dark photon adds 0.054, and with the standard 3.044 the total 3.098 is inside the measured 2.86 ± 0.13 at two of its uncertainties \[24\]. The posit is not yet tested at its floor.

Sixteen checks pass and none fails. Three limits are stated. A search of a grid is not a proof outside the grid; the statements over every field are the theorems. The census is the engine’s list recounted, not an independent derivation of what a renormalizable term is. And every row is a retrodiction: each measurement stood before this work.

## 9. Discussion: The Reading

The derivation above uses only algebra. This section states the reading from which the premises come, and marks what in it is theorem and what is premise.

**What the dark matter is, on this record.** A massive state on the fixed set of visible conjugation, with one bit left open. The halo is dark to every visible reading, and darkness to every charge-linear reading is the fixed set, which is a theorem. The two nulls force the visible half, which is a theorem on measured premises. Whether the state carries a dark charge is not in the record, which is a theorem, and the paper says that it does not, which is the posit.

**Why a posit and not a theorem.** In the reading of Part II nothing stands off the line that a reflection fixes \[41\]. A dark charge is a point off the line with a partner. The posit is that statement read on the dark sector. Every particle theory of dark matter posits its particle; none derives it from the record, and Section 5 proves that none can.

**What the paper does not claim.** It does not derive the anomaly sums, the list of portals, the form of the acceleration, or any magnitude. It does not claim that the dark matter has been identified. It does not claim that the equivalence of darkness and neutrality under every charge is deep; it is elementary, and its use is to make one condition of two. It claims that each statement of Section 1.3 marked proved compiles. No theorem of Sections 2 to 8 depends on Part II.

## 10. Predictions, Falsifiers, and What Stands

The paper derives no constant. Its commitments are those of the premises, and they are stated here as commitments: three that the paper says will stand at any future precision, two proposals it says will fail, and the three observations that would refute it.

### 10.1 Three predictions that will stand

1.  **Every member of the dark multiplet is a singlet.** `dark_forced` fixes every member. The prediction is that no charged or coloured partner of the dark matter is found, and that every signal other than gravity passes through a singlet coupling: for a stable scalar, the one of `a_stable_singlet_keeps_one_door`.
2.  **The dark matter is its own antiparticle.** `dark_forced` allows the self-paired mass, and `on_the_visible_half_self_paired_iff_fixed` ties it to the posit. The prediction is that no asymmetry between dark particles and antiparticles, and no vector current of the dark matter, is found.
3.  **The equation of state of dark energy does not fall below  − 1.** `the_floor_is_additive` gives it on the premise. The prediction is that the crossing in the present fits \[33\] does not survive.

### 10.2 Two proposals that will fail

1.  **A dark sector with its own light.** Every proposal in which dark matter carries a charge under a dark gauge field, with dark radiation, dark cooling or a dark disk \[19, 22\], contradicts the field `posit`. The paper predicts that each of those signatures stays absent.
2.  **A phantom field.** Every proposal in which dark energy falls below  − 1 at positive density has, by `below_the_floor_is_a_ghost`, a negative kinetic density, or else an exchange with matter \[30\] or a change of gravity, each of which contradicts the third premise.

### 10.3 The three falsifiers

Each is a forbidden observation. No observation breaks a theorem; each refutes a premise, and each names the theorem that carries the consequence. The threshold in each case is five of the experiment’s printed uncertainties.

1.  **A crossing of  − 1 that survives.** An equation of state below  − 1 at some redshift, in two reconstructions that do not assume the form *w*₀ + *w*ₐ*z*/(1+*z*), each on an independent compilation of supernovae with recalibrated distances, with the final acoustic data. It refutes the fields `canonical` and `dense` with the premise of no exchange, through `the_floor_is_additive`. The present preference for a crossing is at 2.8 to 4.2 of its uncertainties depending on the supernova sample \[33\], and how much of it rides on calibration is debated \[34\]. This is the paper’s sharpest exposure.
2.  **A charge in the multiplet.** A charged partner of the dark matter, a coupling to the photon, the Z or a gluon at tree level, or a charge of any size. It refutes the fields `photon`, `zboson` or `colourless`, through `the_nulls_and_no_colour_fix_the_visible_half`.
3.  **A fifth reading.** A self-interaction of the dark matter, a dark radiation, a dark disk, a mixing of a dark photon, or a dark matter distinct from its antiparticle, attributable to a dark charge. It refutes the field `posit`, through `fixed_iff_visible_and_dark`.

Apart from them stands the formal claim, which no observation touches and one compilation settles: every theorem named in this text prints its axioms in Appendix D, and a line that names an axiom other than `propext`, `Classical.choice` and `Quot.sound`, or a file that fails to compile under Lean 4.19.0 and Mathlib 4.19.0, refutes the claim that the statements are proved.

### 10.4 What kind of result this is

It is a placement, and a proof of what the placement leaves open. That darkness is fixedness, that two nulls force half of it, that the other half is a bit outside the record, and that canonical dark energy has a floor is here a single file whose every step the kernel has verified, whose every assumption is one field of one structure, and whose consequences are set against measurement, one of them against a measurement that presently disfavours it. A reader who doubts a step can name the line.

The implication from `Premises` to the five statements of `dark_forced` is checked by the Lean kernel. No experiment and no later revision of physics alters an implication. Experiment remains free to test whether nature satisfies the premises, and that is all it can test here. What the kernel certifies is the Lean statements; that the definitions of the file say what this text says they say is for the reader to check, and the structure `Premises` is printed for that purpose. What stands is the tables of Section 1.3.

## 11. Part II · The Reading

*This part is the reading from which the paper takes its place in the series. It is premise-grade. It is not among the machine-checked claims of Section 1.3, and no theorem of Sections 2 to 8 depends on it. The seat it names, and the statements it rests on, are those of Nothing Escapes, Least Erasure (Islam, 2026a), where they are proved in their own domain.*

### 11.1 Dark Is Fixed; the Fifth Is Keyed

The series reads physics on one seat: a reflection of the plane, the line it fixes, and a registration that keeps the height of a point and forgets its side. A point off the line has a partner, and the registration gives the two one value. A point on the line is its own partner.

Charge conjugation is that reflection, read on matter. The engine carries the statement as two theorems of Part VII. Send a state to the point whose height is its mass and whose distance from the line is its dark charge. `conj_is_the_fold`: conjugation of the state is the reflection of the point. `on_the_line_iff`: the state lies on the line exactly when its dark charge is zero. A state with a dark charge and its conjugate are two points off the line at one height, exchanged by the reflection.

Gravity is the registration. It keeps the height and forgets the side: it reads the mass, which conjugation keeps, and no charge, which conjugation turns. A fixed state is its mass, so gravity reads all of it. That is the first clause of the title. Dark matter is what the registration reads completely and every other reading reads as nothing: the fixed set.

The second clause is the side. Whether the dark matter stands on the line or is a pair off it is the dark charge, and Section 5 proves that the record does not hold it. The series calls a bit of that kind keyed: the record admits both worlds, and the bit is supplied by an observation of another kind or not at all. One statement proved on the seat in its own domain is that the least erasure is none: nothing stands off the line. Read on the dark sector, that is the posit. It is not derived here. It is spent, as one field of the structure, and exposed to three falsifiers.

The acceleration belongs to the same reading. The fourth reading, gravity, reads pressure as well as density, and a pressure below minus a third of the density is read as a push. The floor of Section 7 is the frozen field, with nothing kinetic left.

### 11.2 What the Reading Adds, and What It Does Not

The reading adds two identifications to the theorems. The first is that gravity is the registration of the seat, so that what it reads of a state is its height; the companion paper on gravity is where that is argued (Islam, 2026b). The second is that the least erasure, read on the dark sector, is the absence of a dark charge; the paper writes it as the field `posit`. Neither is a theorem of this paper.

The reading does not add the identity of the dark matter, the mass of any particle, or the size of the vacuum density. The first two are owed to a second reading, through one of the doors of Section 6. The third is a number, and no measurement derives the origin of a number.

One falsifier belongs to the reading and stands beside the three of Section 10.3: a fifth reading of either parity. It is the third falsifier seen from the seat, and it is listed once.

## 12. Closure

The placement of dark matter on the fixed set of conjugation is no longer informal prose. From five numbers in a field and a change of sign, and nothing more, Lean 4 with Mathlib compiles the fixed set, the blindness of every odd reading, the equivalence of darkness and fixedness, its two halves, the two nulls that force the visible half at every mixing weight, the bound that is a zero at a measured coupling and is nothing at a free one, the radiative weight, the closing of one generation with two singlets exactly when their dark charges sum to zero, the visible record that does not decide, the self-paired mass, the census of 199 terms and its four portals, and the floor of the equation of state with its exact case. No axiom is declared. No proof is left open. No headline theorem closes by its own hypothesis or over a structure that carries its conclusion.

The numerical twin finds the same sets by search, recounts the census by independent code, and sets the consequences against measurement: a deceleration of minus 0.527, a ratio of dark matter to baryons of 5.37, a vacuum density of (2.24 meV) to the fourth, and a fitted curve of the equation of state that crosses the floor at redshift 0.405.

Every boundary is in plain sight. That the dark matter answers neither the photon nor the Z and is not coloured is three fields of one printed structure, measured as bounds. That no member carries a dark charge is a fourth, a posit, and a theorem of this paper shows that the measured fields do not force it. That dark energy is canonical fields at positive density exchanging nothing with matter is the last two. That the anomaly sums must vanish, that the three tests are invariance, and that the acceleration reads density plus three times pressure are classical, entered. The present fits of the equation of state cross the floor; the paper says so, names the observation that would refute its third premise, and does not soften the premise. No magnitude is derived, here or anywhere in the paper.

That structure is not an arbitrary postulate. The two statements the reading rests on, Existence and Least Erasure, are theorems in their own domain: each has its own compiled Lean file, with no axiom declared, listed in the Lean Library Reference. There they are proved. The Heat Bridge, which joins erasure to heat, is a theorem there as well; the bridge spoken of below is a different one, from that domain to physics. Here they are used, and the difference is stated. Between that domain and the dark sector lies a physical bridge: that conjugation is the reflection, that gravity is the registration, and that nothing stands off the line. This paper does not claim the bridge as a theorem. It writes the bridge down as `Premises`, so that the engine imports nothing outside Mathlib and can be checked alone, and so that a reader can see exactly which sentence carries the physics.

Two things are therefore separate, and the paper keeps them separate. Inside the kernel, the implication from `Premises` to the fixed set, the blind readings and the floor is a mathematical certainty. No experiment, no consensus and no later revision of physics alters it, and anyone can recheck it with one compilation. Outside the kernel stand three falsifiers. They test whether nature satisfies the premises. Two of the premises have met every test so far, and the third stands against a present fit that it predicts will not survive. What survives both is not opinion. It is a theorem, and a physics whose premises are stated where they can be struck.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author’s. The Lean file and the Fortran twin are written by a language model under the author’s direct supervision. Every theorem named in the text of Sections 1 to 10 and 12 is in Appendix A under that name, and its kernel line is printed in Appendix D. Classical results that are cited and not formalised are named as such in Section 1.3 and wherever they are used. No constant of nature is derived anywhere in this paper; the numbers of the twin are found by search and computed from measured inputs, which Appendix B prints.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1.  F. Zwicky, Helv. Phys. Acta 6 (1933) 110.
2.  V. C. Rubin and W. K. Ford, Astrophys. J. 159 (1970) 379.
3.  D. Clowe et al., Astrophys. J. 648 (2006) L109.
4.  N. Aghanim et al. (Planck Collaboration), Astron. Astrophys. 641 (2020) A6.
5.  A. G. Riess et al., Astron. J. 116 (1998) 1009.
6.  S. Perlmutter et al., Astrophys. J. 517 (1999) 565.
7.  J. Aalbers et al. (LZ Collaboration), Phys. Rev. Lett. 135 (2025) 011802.
8.  M. W. Goodman and E. Witten, Phys. Rev. D 31 (1985) 3059.
9.  T. Falk, K. A. Olive and M. Srednicki, Phys. Lett. B 339 (1994) 248.
10. M. Cirelli, N. Fornengo and A. Strumia, Nucl. Phys. B 753 (2006) 178.
11. V. Silveira and A. Zee, Phys. Lett. B 161 (1985) 136.
12. J. McDonald, Phys. Rev. D 50 (1994) 3637.
13. C. P. Burgess, M. Pospelov and T. ter Veldhuis, Nucl. Phys. B 619 (2001) 709.
14. B. Batell, M. Pospelov and A. Ritz, Phys. Rev. D 80 (2009) 095024.
15. B. Holdom, Phys. Lett. B 166 (1986) 196.
16. S. D. McDermott, H.-B. Yu and K. M. Zurek, Phys. Rev. D 83 (2011) 063509.
17. J. L. Feng, M. Kaplinghat, H. Tu and H.-B. Yu, J. Cosmol. Astropart. Phys. 07 (2009) 004.
18. P. Agrawal, F.-Y. Cyr-Racine, L. Randall and J. Scholtz, J. Cosmol. Astropart. Phys. 05 (2017) 022.
19. D. N. Spergel and P. J. Steinhardt, Phys. Rev. Lett. 84 (2000) 3760.
20. S. W. Randall et al., Astrophys. J. 679 (2008) 1173.
21. D. Harvey et al., Science 347 (2015) 1462.
22. J. Fan, A. Katz, L. Randall and M. Reece, Phys. Dark Univ. 2 (2013) 139.
23. C. Brust, D. E. Kaplan and M. T. Walters, J. High Energy Phys. 12 (2013) 058.
24. E. Calabrese et al. (ACT Collaboration), arXiv:2503.14454 (2025).
25. S. Weinberg, Rev. Mod. Phys. 61 (1989) 1.
26. B. Ratra and P. J. E. Peebles, Phys. Rev. D 37 (1988) 3406.
27. R. R. Caldwell, Phys. Lett. B 545 (2002) 23.
28. S. M. Carroll, M. Hoffman and M. Trodden, Phys. Rev. D 68 (2003) 023509.
29. A. Vikman, Phys. Rev. D 71 (2005) 023515.
30. S. Das, P. S. Corasaniti and J. Khoury, Phys. Rev. D 73 (2006) 083509.
31. M. Chevallier and D. Polarski, Int. J. Mod. Phys. D 10 (2001) 213.
32. E. V. Linder, Phys. Rev. Lett. 90 (2003) 091301.
33. M. Abdul-Karim et al. (DESI Collaboration), arXiv:2503.14738 (2025).
34. S. G. Turyshev, arXiv:2602.05368 (2026).
35. S. L. Adler, Phys. Rev. 177 (1969) 2426.
36. J. S. Bell and R. Jackiw, Nuovo Cimento A 60 (1969) 47.
37. L. Alvarez-Gaumé and E. Witten, Nucl. Phys. B 234 (1984) 269.
38. E. Witten, Phys. Lett. B 117 (1982) 324.
39. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
40. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
41. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
42. M. F. Islam, The Charges of Matter as a New Mathematical Theorem, edition 2.0.0 (2026f).
43. M. F. Islam, Immanent Gravity as a Machine-Checked Mathematical Theorem, edition 4.0.0 (2026b).

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

**Appendix A · SPHYS_Dark_Fixed_Set_CC.lean.** Lean 4.19.0 with Mathlib 4.19.0. 50 theorems, no axiom declared, no `sorry`, exit 0 with no warning. The kernel lines are Appendix D. *[a printed file, 616 lines, in the master and in the Journal edition]*

**Appendix B · Dark_Fixed_Set_Twin_CC.f90.** Sixteen checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix C. *[a printed file, 205 lines, in the master and in the Journal edition]*

**Appendix C · Run of Appendix B.** ```text
  of 625 states: fixed by conjugation: 1; fixed by visible conjugation: 5; blind to all 625 linear readings: 1
  PASS  A1 conjugation fixes exactly the state of no charge; visible conjugation fixes five
  PASS  A2 a state is blind to every linear reading exactly when conjugation fixes it
  PASS  A3 the charges of a neutrino: no electric charge, a Z reading of one half at 101 mixing weights
  mixing weight  0.2312; of 625 pairs of isospin and hypercharge in sixths, with both nulls inside half a quantum: 1
  PASS  A4 the photon null and the Z null leave one pair: no isospin and no hypercharge
  PASS  A5 one member of a triplet of isospin is fixed
  the five sums of one generation: 0 0 0 0 0
  of 121 pairs of dark charges of two singlets, closing: 11, those that sum to zero
  PASS  A6 one generation closes; with two singlets it closes exactly when their dark charges sum to zero
  terms: 199; portals: 4; portals even under the parity: 1; of those with the fermion: 0
  PASS  B1 of 199 terms four are portals
  PASS  B2 under the parity that keeps the dark matter stable one portal survives, and none with the fermion
  inputs: matter  0.3153 +-  0.0073; vacuum  0.6847; cold dark matter  0.2645; baryons  0.0493
  inputs: physical densities  0.1200 and  0.02237; h  0.6736
  deceleration: all matter   0.500; measured budget -0.527 +-  0.011
  PASS  C1 all matter decelerates and the measured budget accelerates
  acceleration begins at redshift  0.632; vacuum overtakes matter at  0.295
  dark matter to baryons:  5.37; in physical densities:  5.36
  PASS  C2 the budget: five times as much dark matter as baryons, by both measures
  vacuum density: ( 2.24 meV)**4; log10 of its ratio to the Planck mass**4:  -122.9
  PASS  C3 the vacuum density is a number near (2.2 meV)**4, 123 orders below the Planck density
  canonical fields on a grid: least equation of state -1.00000; below -1: 0; at -1 with motion: 0
  PASS  D1 at positive density no canonical field falls below -1, and only the frozen field reaches it
  kinetic 1, potential -3, density -2: equation of state  -2.00
  PASS  D2 at negative density the floor fails
  inputs: w0  -0.752; wa  -0.86
  the fitted curve w0 + wa z/(1+z) crosses -1 at redshift  0.405 and is at redshift 1:  -1.182
  PASS  D3 the fitted curve of the second release lies below the floor beyond redshift 0.4
  bounds on self-interaction:  2.23 and  0.84 barn per GeV
  inputs: bounds  1.25 and  0.47 cm2/g; standard count  3.044; measured count  2.86 +-  0.13
  a light relic decoupled above the weak scale adds per boson state  0.027; a dark photon  0.054; with the standard value:  3.098
  PASS  E1 a dark photon once in equilibrium would still lie inside the measured count of light species
  one density, two particles of 100 GeV and 10 micro-eV: ratio of their numbers  1.0E+16
  PASS  E2 two particles sixteen orders apart in number leave one density
 BATTERY-JSON: {"checks":16,"failures":0} *[a printed file, 36 lines, in the master and in the Journal edition]*

**Appendix D · Kernel lines of Appendix A.** Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own. *[a printed file, 51 lines, in the master and in the Journal edition]*
