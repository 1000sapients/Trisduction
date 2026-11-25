# Dark Matter as the Charge-Conjugation Fixed Set and the Dark Force as One Keyed Bit

## A Trisductive Theory of Dark Matter and the Dark Force: Why Only the Fourth Reading Sees It

**Mohammad F. Islam PhD** · 25 November 2026

## Abstract

This paper proves, in Lean 4 with Mathlib, that a state is invisible to every charge-linear reading exactly when charge conjugation fixes it, and that whether such a state carries a dark charge is a bit no visible record contains. A state is four charges, hypercharge, weak isospin, colour and a dark charge, and a mass, in any field of characteristic zero. Conjugation turns the sign of the charges and keeps the mass. It fixes a state exactly when the four charges vanish; every odd reading, linear or not, returns zero there; and any reading at all takes one value on two fixed states of one mass, so the mass is what is left to read. Fixedness splits into two halves: a visible half, which zero electric charge and a zero reading of the Z force at every mixing weight, and a zero dark charge, which nothing visible forces. The anomaly sums of one generation with two singlets vanish exactly when the two dark charges sum to zero, so a pair of charges $q$ and $-q$ closes for every $q$, two worlds that close leave one visible record, and no function of that record says whether a dark charge exists. With the coupling measured a bound inside one quantum is a zero; with the coupling free every charge meets every bound. A mass term that pairs a field with itself is allowed exactly when the charge is zero. Of the 199 renormalizable terms of the Standard Model with a singlet scalar and a singlet fermion, four pass the tests of invariance and join the two sectors, and one survives the parity that keeps the dark matter stable. For any number of canonical fields at positive density the equation of state is at least $-1$, with equality only for the frozen field. The premises are fields of one printed structure: the two measured nulls, no colour, the posit that no member carries a dark charge, and canonical dark energy. The structure is inhabited, and a state is exhibited that meets every measured field and fails the posit. A Fortran twin recounts the census, finds the same sets by search, and sets the consequences against measurement: a deceleration of $-0.527 \pm 0.011$, and a fitted curve of the equation of state that crosses $-1$ at redshift 0.405, below the floor. That crossing is the paper's sharpest exposure and is stated as such. Part II states the reading from which the paper takes its place in the series, at premise grade and apart from the machine-checked claims.

## 1. The Theorem and What It Rests On

### 1.1 The statement

A state $s$ has hypercharge $y$, weak isospin $t$, colour $c$, dark charge $d$ and mass $m$. Conjugation is $C(y, t, c, d, m) = (-y, -t, -c, -d, m)$, and visible conjugation $C_V$ turns $y$, $t$ and $c$ only. A reading $f$ is odd when $f(Cs) = -f(s)$. A charge-linear reading is $a y + b t + k c + e d$. Electric charge is $Q = t + y$ and the reading of the Z at mixing weight $w$ is $Z_w = t - wQ$.

**Theorem (`fixed_iff`).** $Cs = s$ exactly when $y = t = c = d = 0$.

**Theorem (`odd_readings_are_blind`).** If $f$ is odd and $Cs = s$, then $f(s) = 0$.

**Theorem (`dark_is_fixed`).** Every charge-linear reading returns zero on $s$ exactly when $Cs = s$.

**Theorem (`fixed_iff_visible_and_dark`).** $Cs = s$ exactly when $C_V s = s$ and $d = 0$.

**Theorem (`the_two_nulls_force_the_visible_half`).** At any mixing weight, $Q = 0$ and $Z_w = 0$ give $t = 0$ and $y = 0$.

**Theorem (`a_pair_of_singlets_closes_iff`).** One generation with two singlets of dark charges $a$ and $b$ satisfies the eleven anomaly sums and the count of doublets exactly when $a + b = 0$.

**Theorem (`the_visible_record_does_not_decide`).** The world with dark charges 0 and 0 and the world with 1 and $-1$ both close and have one visible record, and no function of the visible record returns whether a dark charge exists.

**Theorem (`the_floor_is_additive`).** For canonical fields with kinetic densities $K_j \ge 0$ and potentials $V_j$, at positive total density, $\sum_j (K_j - V_j) \big/ \sum_j (K_j + V_j) \ge -1$.

**Theorem (`dark_forced`).** On the premises below: conjugation fixes every member of the dark multiplet; every odd reading of a member is zero; a member radiates through no charge; a mass term that pairs a member with itself is allowed; and the equation of state of dark energy is at least $-1$.

That a neutral particle with weak charges is seen through the Z is the criterion of direct detection [8, 9]. That a singlet reaches the Standard Model through the Higgs field is classical [11, 12, 13], and the list of portals is classical [14]. That a canonical field cannot cross $-1$ is classical [27, 28, 29]. What compiles here, in Lean 4 [40] with Mathlib [39], is the equivalence of darkness and fixedness, its two halves, the bit that the anomaly sums cannot set, and the floor. The premises are met: `darkPremises` constructs a term of the structure. The posit is not a consequence of the measured fields: `the_posit_is_not_forced` exhibits a state that meets them and carries a dark charge.

### 1.2 The premises, printed

The physical premises of the paper are the fields of this structure of the Lean file, and there are no others. What is cited is in the tables of Section 1.3.

```lean
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

| Statement | Standing | Where |
|---|---|---|
| Conjugation fixes a state exactly when its four charges vanish; the fixed set splits into a visible half and a zero dark charge, and the first lies strictly inside the second | Proved, over every field of characteristic zero | Appendix A, Part I |
| Every odd reading is zero on a fixed state; a state is blind to every charge-linear reading exactly when it is fixed; any reading takes one value on fixed states of one mass | Proved | Part II |
| The charges of a neutrino are neutral and not fixed; two nulls force zero isospin and hypercharge at every mixing weight | Proved | Part III |
| A whole charge bounded inside one quantum is zero; at a measured coupling a bounded force is the zero charge; at a free coupling every charge meets every bound | Proved | Part III |
| The radiative weight vanishes exactly on the fixed set; one member of a triplet is fixed | Proved | Part IV |

The table continues with the record, the sums, the mass term, the census, the floor and the premises.

| Statement | Standing | Where |
|---|---|---|
| Two worlds with one record and different labels: no function of the record returns the label | Proved | Part V |
| One generation closes; with two singlets it closes exactly when their dark charges sum to zero; no function of the visible record says whether a dark charge exists | Proved | Part VI |
| A self-paired mass term is allowed exactly when hypercharge and dark charge vanish; conjugation is carried to a reflection of the plane | Proved | Part VII |
| Of 199 terms four are portals, and one survives the parity | Proved, by evaluation of a finite list | Part VIII |
| The vacuum repels; at positive density the equation of state of canonical fields is at least $-1$, exactly $-1$ only when frozen; below it the kinetic density is negative | Proved | Part IX |
| On the premises, the five statements of `dark_forced`; the premises are met; the posit is not forced | Proved | Part X |

What is not machine-checked is in the third table.

| Statement | Standing | Where |
|---|---|---|
| The dark matter of the sky answers neither the photon nor the Z and is not coloured | Premise; measured as bounds [3, 7, 16] | Section 3 |
| No member of its multiplets carries a dark charge | Premise; a posit, tested by [20, 21, 24] | Section 5 |
| The anomaly sums, with their weights, must vanish | Classical, entered: [35, 36, 37, 38] | Section 5 |
| A mass term that pairs a field with itself carries twice each of its abelian charges | Classical, entered | Section 5 |
| The three tests of Section 6 are gauge invariance for the terms of the census; a term outside the census starts at dimension five | Classical, entered: [14] | Section 6 |
| The acceleration reads density plus three times pressure; a canonical field has density $K + V$ and pressure $K - V$ | Classical, entered: [26] | Section 7 |
| Dark energy is canonical fields that exchange nothing with matter | Premise | Section 7 |
| The measured values of the twin | Entered from the literature [4, 20, 21, 24, 33]; numerical, not machine-checked | Section 8 |

The paper claims as machine-checked the rows marked proved and no others. A row marked entered is a classical formula or a measured value; the theorems that use a formula are algebra on it. Part II, the reading, is outside these tables: it is premise-grade and is labelled so where it begins.

## 2. States, Conjugation and Readings

The evidence for dark matter is gravitational: the motions of galaxies in clusters [1], the rotation of galaxies [2], and a collision of clusters in which the mass, mapped by lensing, parted from the gas [3]. It makes about five sixths of the matter in the measured budget [4]. No reading other than gravity has found it [7]. The question of this section is what kind of state such a thing can be.

A state is five numbers, and the only structure asked of them is a field of characteristic zero. `conj_involutive` shows that conjugation done twice is the identity. `fixed_iff` finds its fixed set: a charge equal to its own negative is zero, since two is not zero in the field, so $Cs = s$ exactly when all four charges vanish.

A reading is any function of the state. `every_linear_reading_is_odd` shows that $a y + b t + k c + e d$ is odd for every choice of the four weights; these are the couplings of the photon, the Z, the diagonal gluons and a dark photon to the state. `zed_is_odd` shows it of the Z at every mixing weight.

**Theorem (`odd_readings_are_blind`).** An odd reading is zero on every fixed state.

The proof does not use linearity: $f(s) = f(Cs) = -f(s)$. `dark_is_fixed` is the converse for the linear readings, since the four charges are themselves among them. Darkness to every charge-linear reading and membership of the fixed set are one property.

`the_mass_is_even` shows that the mass is kept by conjugation, and `only_the_mass_is_read` that a fixed state is its mass: any reading whatever, of any kind and with any values, agrees on two fixed states of one mass. Gravity reads mass and energy, as the companion paper on gravity derives [43]. Beside the three gauge readings of the Standard Model it is the fourth reading, and among the readings of a state it is the one left to see a fixed state.

## 3. The Visible Half Is Forced

Electric neutrality is not darkness. `neutral_is_not_dark` takes the charges of a neutrino, isospin one half and hypercharge minus one half: the electric charge is zero, the reading of the Z is one half at every mixing weight, and conjugation moves the state. A neutral candidate that carries weak charges scatters through the Z, and candidates of that kind were excluded early [8, 9].

Two nulls together do what one cannot.

**Theorem (`the_two_nulls_force_the_visible_half`).** If $Q = 0$ and $Z_w = 0$, then $t = 0$ and $y = 0$, whatever the mixing weight.

With no colour, `the_nulls_and_no_colour_fix_the_visible_half` gives $C_V s = s$. `fixed_iff_visible_and_dark` then states what is left: conjugation fixes the state exactly when, in addition, its dark charge is zero. `the_dark_half_is_not_the_visible_half` exhibits a state in the visible half and outside the fixed set.

A measurement gives a bound and not a zero. Two theorems say when a bound is a zero. `a_bound_inside_one_quantum_is_a_zero`: a charge counted in whole quanta and bounded strictly inside one is zero. The bounds on an electric charge of the dark matter lie far inside one sixth of the charge of the electron [16], and searches for a Z coupling of full strength exclude it by orders [7], so with charge in quanta the two nulls are exact, and they are the fields `photon` and `zboson`. `a_bound_at_a_measured_coupling_is_a_zero` is the same statement for a force $g q^2$ at a known coupling. One case is outside the Z null and is named: a state that is its own antiparticle has no vector current of the Z, so for it the null bounds nothing directly; its weak charges are reached through its charged partners, and the field `photon` is asked of every member.

**Theorem (`a_free_coupling_meets_every_bound`).** For every whole charge and every positive bound there is a positive coupling at which the force is below the bound.

That is the dark charge. Its coupling is not measured, so no bound on a dark force, however tight, is a zero of the dark charge. Models with a dark charge and a small coupling pass the present bounds [17, 18]. The two halves of the fixed set therefore stand at two grades, and the paper keeps them apart: the visible half is measured, and the dark half is the posit.

Two consequences of the fixed set are separate theorems. `weight_zero_iff_fixed`: the sum of the squares of the charges vanishes exactly on the fixed set. Rates of emission go as the square of a charge, so a fixed state does not cool by radiating through a charge; that the halo is extended and not a disk is then the standard account of cooling, entered. `a_dark_charge_radiates_dark_only` gives the other case: a dark-charged state has no visible weight and a weight of one, the dissipative dark matter of the double-disk proposal [22]. And `one_member_of_a_triplet_is_fixed`: of a triplet of isospin, only the middle member is fixed, so a neutral member of a charged multiplet is not a dark multiplet [10]. The field `photon` is asked of every member.

## 4. What Gravity Cannot Read

**Theorem (`no_reading_returns_what_the_record_forgets`).** If two worlds leave one record and carry different labels, no function of the record returns the label.

`gravity_does_not_read_identity` applies it: two fixed states of one mass and different names are one state, and no reading of the state returns the name. Since a fixed state is its mass, more gravitational evidence of the same kind cannot name the particle. Identity needs a second reading, and Section 6 finds which second readings exist.

## 5. The Dark Charge Is Not in the Record

Is there a dark force, a fifth reading with its own charge? Field theory constrains the charges of a theory through sums that must vanish [35, 36, 37]: for each field, weights from the sizes of its colour and isospin multiplets, times powers of its charges. With hypercharge and a dark charge there are eleven such sums, five that read the Standard Model alone and six that read the dark charge, and the number of isospin doublets must be even [38]. They are entered. `Closes` is their conjunction for a list of left-handed fields.

`one_generation_closes` verifies the five and the count on one generation, the classification of the companion paper on charges [42]. Add two singlets of the Standard Model with dark charges $a$ and $b$.

**Theorem (`a_pair_of_singlets_closes_iff`).** The list closes exactly when $a + b = 0$.

`a_vector_like_pair_closes_for_every_charge` follows: charges $q$ and $-q$ close for every $q$ in the field. `a_chiral_singlet_fails`: one singlet with a dark charge does not. The sums are not empty, since they reject a world; they are not decisive, since they admit a family.

**Theorem (`the_visible_record_does_not_decide`).** The worlds $(0, 0)$ and $(1, -1)$ both close and have the same visible record, and no function of the visible record of a list returns whether the list holds a dark charge.

The visible record of a field is everything about it but its dark charge. Whether a dark charge exists is therefore a bit that the Standard Model's own conditions cannot set and its own readings cannot return. This paper calls such a bit keyed: two admitted worlds, one record. By Section 3 no bound sets it either. It is owed to an observation of another kind: a dark radiation, a self-interaction, a dark disk [19, 22, 23], or the mixing of a dark photon with hypercharge [15].

One observable is named by a theorem. A mass term that pairs a field with itself carries twice each of its abelian charges; that is entered.

**Theorem (`a_self_paired_mass_iff`).** $2y = 0$ and $2d = 0$ exactly when $y = 0$ and $d = 0$.

`on_the_visible_half_self_paired_iff_fixed`: on the visible half, such a mass is allowed exactly when conjugation fixes the state. `a_pair_takes_its_mass_together`: a state with a dark charge takes its mass with a partner of the opposite charge. The bit is therefore whether the dark matter is its own antiparticle. That is a measurement not yet made.

The posit spends the bit. It says that no member carries a dark charge, and it is the field `posit`.

## 6. The Doors

If every member is fixed, the dark matter is a singlet of the Standard Model. How can a singlet be read at all, other than by gravity? Part VIII of the engine counts. Take one generation of fermions, the Higgs doublet, a real singlet scalar $S$ and a singlet fermion $N$. A renormalizable term without derivatives that can be a Lorentz scalar is two to four scalars, or two fermions of one chirality with at most one scalar. `census` lists them: 199.

A term `passes` when its hypercharge sums to zero, its colour triality is zero modulo three, and its doublets pair. These three tests are necessary for invariance; that they are sufficient for the terms of the census is classical and is entered [14]. A `portal` is a term that passes and has a leg in each sector.

**Theorem (`portals_are_derived`).** Of the 199 terms exactly four are portals: $S H^\dagger H$, $S^2 H^\dagger H$, and $L N H$ with its conjugate.

**Theorem (`a_stable_singlet_keeps_one_door`).** Under the parity that keeps the dark matter stable, exactly one portal survives, $S^2 H^\dagger H$, and none that contains $N$.

A stable singlet scalar is therefore read through one coupling to the Higgs field, which ties its scattering on nuclei to the invisible width of the Higgs boson [11, 12, 13]. A stable singlet fermion has no renormalizable door at all. A coupling through a derivative, or of an axion to two photons, starts at dimension five and is outside the census; a mixing of a dark photon needs a dark gauge field, which the posit removes.

## 7. Acceleration

The expansion accelerates [5, 6]. The acceleration reads the active density $\rho + 3p$, entered from general relativity. `the_vacuum_repels`: with $p = -\rho$ the active density is $-2\rho$. `dust_and_radiation_attract`, and `repulsion_iff`: repulsion needs $3p < -\rho$. The dark force in this sense is not a fifth force. It is gravity reading a pressure.

A canonical field with kinetic density $K$ and potential $V$ has density $K + V$ and pressure $K - V$ [26]. `density_plus_pressure`: their sum is $2K$.

**Theorem (`the_floor`).** If $K \ge 0$ and $K + V > 0$, then $(K - V)/(K + V) \ge -1$.

`the_floor_is_exact`: equality holds exactly when $K = 0$, the frozen field, a constant [25]. `below_the_floor_is_a_ghost`: a value below $-1$ at positive density needs $K < 0$ [27, 28]. `the_floor_fails_at_negative_density`: with $K = 1$ and $V = -3$ the value is $-2$, so the hypothesis of positive density is used. `the_floor_is_additive`: the floor holds for any finite number of canonical fields at positive total density, so no count of such fields crosses $-1$; for one field of a more general kind the obstruction is known [29].

`the_sign_is_read`: a flat world of matter alone decelerates, and the measured budget [4] accelerates. The theorems fix the sign of the pull of a vacuum. They do not require a vacuum to be there, and they say nothing of its size. The magnitude of the vacuum density is not derived [25].

## 8. The Numerical Twin

The twin of Appendix B does three things the kernel does not. It finds the sets of Sections 2 to 5 by search, it recounts the census by independent code, and it sets the consequences against measurement.

**The searches.** Of 625 states with whole charges from $-2$ to 2, conjugation fixes one and visible conjugation five, and one is blind to all 625 linear readings: the same one. At the mixing weight 0.2312, of 625 pairs of isospin and hypercharge in sixths, one has both nulls inside half a quantum. Of 121 pairs of dark charges, the 11 that sum to zero close and no other. The census has 199 terms, four portals, one that survives the parity and none of those with the fermion.

**The acceleration.** The inputs are measured and are printed in Appendix B.

| Quantity | Computed | From |
|---|---|---|
| Deceleration of the measured budget | $-0.527 \pm 0.011$ | matter 0.3153, vacuum 0.6847 [4] |
| Redshift at which acceleration begins | 0.632 | the same |
| Redshift at which vacuum overtakes matter | 0.295 | the same |
| Dark matter to baryons | 5.37, and 5.36 in physical densities | 0.2645 and 0.0493; 0.1200 and 0.02237 [4] |
| Vacuum density | (2.24 meV)$^4$, 122.9 orders below the Planck density | the same |

**The floor and the fitted curve.** On a grid of canonical fields at positive density the least equation of state is $-1.00000$, reached only by the frozen field. The fit of the second release of DESI with supernovae, $w_0 = -0.752$ and $w_a = -0.86$ in the form of [31, 32], crosses $-1$ at redshift 0.405 and is at $-1.182$ at redshift 1 [33]. The curve lies below the floor. Section 10 says what follows.

**The bounds on the posit.** The bounds on self-interaction, 1.25 cm$^2$/g from one cluster [20] and 0.47 cm$^2$/g from 72 [21], are 2.23 and 0.84 barn per GeV. A light relic once in equilibrium above the weak scale adds 0.027 to the count of light species for each boson state [23], so a dark photon adds 0.054, and with the standard 3.044 the total 3.098 is inside the measured $2.86 \pm 0.13$ at two of its uncertainties [24]. The posit is not yet tested at its floor.

Sixteen checks pass and none fails. Three limits are stated. A search of a grid is not a proof outside the grid; the statements over every field are the theorems. The census is the engine's list recounted, not an independent derivation of what a renormalizable term is. And every row is a retrodiction: each measurement stood before this work.

## 9. Discussion: The Reading

The derivation above uses only algebra. This section states the reading from which the premises come, and marks what in it is theorem and what is premise.

**What the dark matter is, on this record.** A massive state on the fixed set of visible conjugation, with one bit left open. The halo is dark to every visible reading, and darkness to every charge-linear reading is the fixed set, which is a theorem. The two nulls force the visible half, which is a theorem on measured premises. Whether the state carries a dark charge is not in the record, which is a theorem, and the paper says that it does not, which is the posit.

**Why a posit and not a theorem.** In the reading of Part II nothing stands off the line that a reflection fixes [41]. A dark charge is a point off the line with a partner. The posit is that statement read on the dark sector. Every particle theory of dark matter posits its particle; none derives it from the record, and Section 5 proves that none can.

**What the paper does not claim.** It does not derive the anomaly sums, the list of portals, the form of the acceleration, or any magnitude. It does not claim that the dark matter has been identified. It does not claim that the equivalence of darkness and neutrality under every charge is deep; it is elementary, and its use is to make one condition of two. It claims that each statement of Section 1.3 marked proved compiles. No theorem of Sections 2 to 8 depends on Part II.

## 10. Predictions, Falsifiers, and What Stands

The paper derives no constant. Its commitments are those of the premises, and they are stated here as commitments: three that the paper says will stand at any future precision, two proposals it says will fail, and the three observations that would refute it.

### 10.1 Three predictions that will stand

1. **Every member of the dark multiplet is a singlet.** `dark_forced` fixes every member. The prediction is that no charged or coloured partner of the dark matter is found, and that every signal other than gravity passes through a singlet coupling: for a stable scalar, the one of `a_stable_singlet_keeps_one_door`.
2. **The dark matter is its own antiparticle.** `dark_forced` allows the self-paired mass, and `on_the_visible_half_self_paired_iff_fixed` ties it to the posit. The prediction is that no asymmetry between dark particles and antiparticles, and no vector current of the dark matter, is found.
3. **The equation of state of dark energy does not fall below $-1$.** `the_floor_is_additive` gives it on the premise. The prediction is that the crossing in the present fits [33] does not survive.

### 10.2 Two proposals that will fail

1. **A dark sector with its own light.** Every proposal in which dark matter carries a charge under a dark gauge field, with dark radiation, dark cooling or a dark disk [19, 22], contradicts the field `posit`. The paper predicts that each of those signatures stays absent.
2. **A phantom field.** Every proposal in which dark energy falls below $-1$ at positive density has, by `below_the_floor_is_a_ghost`, a negative kinetic density, or else an exchange with matter [30] or a change of gravity, each of which contradicts the third premise.

### 10.3 The three falsifiers

Each is a forbidden observation. No observation breaks a theorem; each refutes a premise, and each names the theorem that carries the consequence. The threshold in each case is five of the experiment's printed uncertainties.

1. **A crossing of $-1$ that survives.** An equation of state below $-1$ at some redshift, in two reconstructions that do not assume the form $w_0 + w_a z/(1+z)$, each on an independent compilation of supernovae with recalibrated distances, with the final acoustic data. It refutes the fields `canonical` and `dense` with the premise of no exchange, through `the_floor_is_additive`. The present preference for a crossing is at 2.8 to 4.2 of its uncertainties depending on the supernova sample [33], and how much of it rides on calibration is debated [34]. This is the paper's sharpest exposure.
2. **A charge in the multiplet.** A charged partner of the dark matter, a coupling to the photon, the Z or a gluon at tree level, or a charge of any size. It refutes the fields `photon`, `zboson` or `colourless`, through `the_nulls_and_no_colour_fix_the_visible_half`.
3. **A fifth reading.** A self-interaction of the dark matter, a dark radiation, a dark disk, a mixing of a dark photon, or a dark matter distinct from its antiparticle, attributable to a dark charge. It refutes the field `posit`, through `fixed_iff_visible_and_dark`.

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

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file and the Fortran twin are written by a language model under the author's direct supervision. Every theorem named in the text of Sections 1 to 10 and 12 is in Appendix A under that name, and its kernel line is printed in Appendix D. Classical results that are cited and not formalised are named as such in Section 1.3 and wherever they are used. No constant of nature is derived anywhere in this paper; the numbers of the twin are found by search and computed from measured inputs, which Appendix B prints.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1. F. Zwicky, Helv. Phys. Acta 6 (1933) 110.
2. V. C. Rubin and W. K. Ford, Astrophys. J. 159 (1970) 379.
3. D. Clowe et al., Astrophys. J. 648 (2006) L109.
4. N. Aghanim et al. (Planck Collaboration), Astron. Astrophys. 641 (2020) A6.
5. A. G. Riess et al., Astron. J. 116 (1998) 1009.
6. S. Perlmutter et al., Astrophys. J. 517 (1999) 565.
7. J. Aalbers et al. (LZ Collaboration), Phys. Rev. Lett. 135 (2025) 011802.
8. M. W. Goodman and E. Witten, Phys. Rev. D 31 (1985) 3059.
9. T. Falk, K. A. Olive and M. Srednicki, Phys. Lett. B 339 (1994) 248.
10. M. Cirelli, N. Fornengo and A. Strumia, Nucl. Phys. B 753 (2006) 178.
11. V. Silveira and A. Zee, Phys. Lett. B 161 (1985) 136.
12. J. McDonald, Phys. Rev. D 50 (1994) 3637.
13. C. P. Burgess, M. Pospelov and T. ter Veldhuis, Nucl. Phys. B 619 (2001) 709.
14. B. Batell, M. Pospelov and A. Ritz, Phys. Rev. D 80 (2009) 095024.
15. B. Holdom, Phys. Lett. B 166 (1986) 196.
16. S. D. McDermott, H.-B. Yu and K. M. Zurek, Phys. Rev. D 83 (2011) 063509.
17. J. L. Feng, M. Kaplinghat, H. Tu and H.-B. Yu, J. Cosmol. Astropart. Phys. 07 (2009) 004.
18. P. Agrawal, F.-Y. Cyr-Racine, L. Randall and J. Scholtz, J. Cosmol. Astropart. Phys. 05 (2017) 022.
19. D. N. Spergel and P. J. Steinhardt, Phys. Rev. Lett. 84 (2000) 3760.
20. S. W. Randall et al., Astrophys. J. 679 (2008) 1173.
21. D. Harvey et al., Science 347 (2015) 1462.
22. J. Fan, A. Katz, L. Randall and M. Reece, Phys. Dark Univ. 2 (2013) 139.
23. C. Brust, D. E. Kaplan and M. T. Walters, J. High Energy Phys. 12 (2013) 058.
24. E. Calabrese et al. (ACT Collaboration), arXiv:2503.14454 (2025).
25. S. Weinberg, Rev. Mod. Phys. 61 (1989) 1.
26. B. Ratra and P. J. E. Peebles, Phys. Rev. D 37 (1988) 3406.
27. R. R. Caldwell, Phys. Lett. B 545 (2002) 23.
28. S. M. Carroll, M. Hoffman and M. Trodden, Phys. Rev. D 68 (2003) 023509.
29. A. Vikman, Phys. Rev. D 71 (2005) 023515.
30. S. Das, P. S. Corasaniti and J. Khoury, Phys. Rev. D 73 (2006) 083509.
31. M. Chevallier and D. Polarski, Int. J. Mod. Phys. D 10 (2001) 213.
32. E. V. Linder, Phys. Rev. Lett. 90 (2003) 091301.
33. M. Abdul-Karim et al. (DESI Collaboration), arXiv:2503.14738 (2025).
34. S. G. Turyshev, arXiv:2602.05368 (2026).
35. S. L. Adler, Phys. Rev. 177 (1969) 2426.
36. J. S. Bell and R. Jackiw, Nuovo Cimento A 60 (1969) 47.
37. L. Alvarez-Gaumé and E. Witten, Nucl. Phys. B 234 (1984) 269.
38. E. Witten, Phys. Lett. B 117 (1982) 324.
39. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
40. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
41. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
42. M. F. Islam, The Charges of Matter as a New Mathematical Theorem, edition 2.0.0 (2026f).
43. M. F. Islam, Immanent Gravity as a Machine-Checked Mathematical Theorem, edition 4.0.0 (2026b).

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its engine uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main, read at commit 38f6678.

44. Root Axiom and Existence: Publication Library/Philosophy/Metaphysics/Root Axiom/TOE_Zero.lean. Compiled alone in core Lean 4.19.0, exit 0.
45. RH master: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_44_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.
46. Existence, as carried in the RH master: line 6635.
47. Heat Bridge: RH master, Parts VII-c and VII-d.
48. Prime Freedom: RH master, Parts XIII and XIV.
49. Freedom Arrow: RH master, Part XV.
50. Least Erasure: protocols/RH One Bit/Nothing Escapes Three Plus One/Least_Erasure.lean. Compiled alone in core Lean 4.19.0, exit 0.
51. Second Law: Publication Library/Mathematics/Mathematical Physics/Second_Law_Theorem_v1_0_0_CC.pdf, with its Lean file printed inside.
52. P versus NP master: FINAL_BINDING/PNP Binding/PNP_Normal_Form_Paper_v1_14_0_CC.lean
53. ZFC seal: lean/ZFC_Block_Hardened_FINAL_v2_0_0_Hermetically_Sealed.lean
54. No Second Sovereign: Publication Library/Mathematics/Millennium Series/No_Second_Sovereign_v1_0_0_CC.lean
55. Future Proof Empirical Witness Seal: Publication Library/Mathematics/Millennium Series/Future_Proof_Empirical_Witness_Seal_v1_0_0_CC.lean

## Appendix A · SPHYS_Dark_Fixed_Set_CC.lean

Lean 4.19.0 with Mathlib 4.19.0. 50 theorems, no axiom declared, no `sorry`, exit 0 with no warning. The kernel lines are Appendix D.

```lean
/-
SPHYS_Dark_Fixed_Set_CC.lean · dark matter as the fixed set of charge conjugation, on real algebra
RATIONALE. The kernel of the first edition proved its statements over whole numbers in core Lean. This file
  replaces it. A state is four charges and a mass in a field of characteristic zero; conjugation turns the sign
  of the charges and keeps the mass; a reading is any function of the state. The fixed set, the blindness of every
  odd reading, the visible half forced by two nulls, the anomaly sums of one generation with a pair of singlets,
  the mass term that pairs a field with itself, and the floor of the equation of state are theorems on Mathlib.
DESIGN. Parts, in order.
    Part I    States and conjugation. `conj_involutive`, `fixed_iff`, `fixed_iff_visible_and_dark`.
    Part II   Readings. `odd_readings_are_blind`, `dark_is_fixed`, `only_the_mass_is_read`.
    Part III  The visible half. `neutral_is_not_dark`, `the_two_nulls_force_the_visible_half`,
              `a_bound_inside_one_quantum_is_a_zero`, `a_bound_at_a_measured_coupling_is_a_zero`,
              `a_free_coupling_meets_every_bound`.
    Part IV   `weight_zero_iff_fixed`. A triplet: `one_member_of_a_triplet_is_fixed`.
    Part V    Records that forget. `no_reading_returns_what_the_record_forgets`,
              `gravity_does_not_read_identity`.
    Part VI   The anomaly sums. `one_generation_closes`, `a_pair_of_singlets_closes_iff`,
              `a_vector_like_pair_closes_for_every_charge`, `a_chiral_singlet_fails`,
              `the_visible_record_does_not_decide`.
    Part VII  `a_self_paired_mass_iff`. The side of the line: `conj_is_the_fold`.
    Part VIII The census of renormalizable terms. `portals_are_derived`, `a_stable_singlet_keeps_one_door`.
    Part IX   Acceleration. `the_vacuum_repels`, `the_floor`, `the_floor_is_exact`, `below_the_floor_is_a_ghost`,
              `the_floor_fails_at_negative_density`, `the_floor_is_additive`, `the_sign_is_read`.
    Part X    `Premises`; `dark_forced`; `darkPremises`; `the_posit_is_not_forced`.
WHAT IS NOT PROVED HERE (read before citing).
    (a) That the dark matter of the sky is a state of this kind. Its photon and Z nulls are measured bounds; its
        zero dark charge is a posit. Both are fields of `Premises`.
    (b) That the anomaly sums must vanish, and the weights in them. They are entered from field theory.
    (c) That the three tests of Part VIII are gauge invariance. They are necessary conditions; that they suffice
        for the terms of the census is classical and is entered.
    (d) That dark energy is canonical fields that exchange nothing with matter. It is a field of `Premises`.
    (e) Every magnitude. None is derived.
RISK. The premises are over the real numbers. The census is finite and is decided by evaluation.
NON-NEGOTIABLE. No axiom is declared, no sorry. No headline theorem closes over a structure that carries its
  conclusion. The kernel line of every theorem the paper names is printed at the end.
-/
import Mathlib.Algebra.Field.Basic
import Mathlib.Algebra.CharZero.Defs
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Data.Real.Basic
import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Logic.Function.Basic
import Mathlib.Tactic.Ring
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity

namespace SPHYS.Dark

/-! ## Part I. States and conjugation -/

/-- A state: hypercharge `y`, weak isospin `t`, colour `c`, dark charge `d`, mass `m`. -/
@[ext] structure State (K : Type*) where
  y : K
  t : K
  c : K
  d : K
  m : K

variable {K : Type*} [Field K] [CharZero K]

/-- Conjugation turns the sign of the four charges and keeps the mass. -/
def conj (s : State K) : State K := ⟨-s.y, -s.t, -s.c, -s.d, s.m⟩
/-- Visible conjugation turns the three charges of the Standard Model only. -/
def conjV (s : State K) : State K := ⟨-s.y, -s.t, -s.c, s.d, s.m⟩
/-- Dark conjugation turns the dark charge only. -/
def conjD (s : State K) : State K := ⟨s.y, s.t, s.c, -s.d, s.m⟩

omit [CharZero K] in
theorem conj_involutive (s : State K) : conj (conj s) = s := by
  ext <;> simp [conj]

theorem two_ne : (2 : K) ≠ 0 := by
  have h : ((2 : ℕ) : K) ≠ 0 := Nat.cast_ne_zero.mpr (by decide)
  exact_mod_cast h

theorem neg_eq_self_iff' (a : K) : -a = a ↔ a = 0 := by
  constructor
  · intro h
    have h2 : (2 : K) * a = 0 := by linear_combination -h
    rcases mul_eq_zero.mp h2 with h3 | h3
    · exact absurd h3 two_ne
    · exact h3
  · rintro rfl; simp

/-- Conjugation fixes a state exactly when its four charges vanish. -/
theorem fixed_iff (s : State K) : conj s = s ↔ s.y = 0 ∧ s.t = 0 ∧ s.c = 0 ∧ s.d = 0 := by
  rw [State.ext_iff]
  simp only [conj, neg_eq_self_iff', and_true]

theorem visible_fixed_iff (s : State K) : conjV s = s ↔ s.y = 0 ∧ s.t = 0 ∧ s.c = 0 := by
  rw [State.ext_iff]
  simp only [conjV, neg_eq_self_iff', and_true]

theorem dark_fixed_iff (s : State K) : conjD s = s ↔ s.d = 0 := by
  rw [State.ext_iff]
  simp only [conjD, neg_eq_self_iff', and_true, true_and]

/-- The two halves: conjugation fixes a state exactly when visible conjugation fixes it and its dark charge
is zero. -/
theorem fixed_iff_visible_and_dark (s : State K) : conj s = s ↔ conjV s = s ∧ s.d = 0 := by
  rw [fixed_iff, visible_fixed_iff]; tauto

/-- The first fixed set lies strictly inside the second. -/
theorem the_dark_half_is_not_the_visible_half : ∃ s : State K, conjV s = s ∧ conj s ≠ s := by
  refine ⟨⟨0, 0, 0, 1, 1⟩, by simp [conjV], ?_⟩
  rw [Ne, fixed_iff]; simp

/-! ## Part II. Readings -/

/-- A reading is odd when conjugation turns its sign, and even when conjugation keeps it. -/
def Odd' (f : State K → K) : Prop := ∀ s, f (conj s) = -f s
def Even' {α : Type*} (f : State K → α) : Prop := ∀ s, f (conj s) = f s

/-- A charge-linear reading: a combination of the four charges. -/
def lin (a b k e : K) (s : State K) : K := a * s.y + b * s.t + k * s.c + e * s.d

omit [CharZero K] in
theorem every_linear_reading_is_odd (a b k e : K) : Odd' (lin a b k e) := by
  intro s; simp only [lin, conj]; ring

/-- Every odd reading, linear or not, returns zero on every state conjugation fixes. -/
theorem odd_readings_are_blind {f : State K → K} (hf : Odd' f) {s : State K} (hs : conj s = s) : f s = 0 := by
  have h := hf s
  rw [hs] at h
  exact (neg_eq_self_iff' (f s)).mp h.symm

/-- Dark is fixed: every charge-linear reading returns zero on a state exactly when conjugation fixes it. -/
theorem dark_is_fixed (s : State K) : (∀ a b k e : K, lin a b k e s = 0) ↔ conj s = s := by
  constructor
  · intro h
    rw [fixed_iff]
    refine ⟨?_, ?_, ?_, ?_⟩
    · simpa [lin] using h 1 0 0 0
    · simpa [lin] using h 0 1 0 0
    · simpa [lin] using h 0 0 1 0
    · simpa [lin] using h 0 0 0 1
  · intro h a b k e
    exact odd_readings_are_blind (every_linear_reading_is_odd a b k e) h

omit [CharZero K] in
theorem the_mass_is_even : Even' (fun s : State K => s.m) := fun _ => rfl

/-- A state that conjugation fixes is its mass: any reading at all, of any kind, takes one value on two fixed
states of one mass. -/
theorem only_the_mass_is_read {α : Type*} (f : State K → α) {s s' : State K}
    (hs : conj s = s) (hs' : conj s' = s') (hm : s.m = s'.m) : f s = f s' := by
  obtain ⟨a, b, c, d⟩ := (fixed_iff s).mp hs
  obtain ⟨a', b', c', d'⟩ := (fixed_iff s').mp hs'
  have : s = s' := by ext <;> simp [*]
  rw [this]

/-! ## Part III. The visible half -/

/-- Electric charge, and the reading of the Z at mixing weight `w`. -/
def charge (s : State K) : K := s.t + s.y
def zed (w : K) (s : State K) : K := s.t - w * charge s

omit [CharZero K] in
theorem zed_is_odd (w : K) : Odd' (zed w) := by
  intro s; simp only [zed, charge, conj]; ring

/-- Neutral is not dark: the charges of a neutrino give zero electric charge, a Z reading of one half at every
mixing weight, and a state that conjugation moves. -/
theorem neutral_is_not_dark (w m : K) :
    charge (⟨-(1 / 2), 1 / 2, 0, 0, m⟩ : State K) = 0 ∧ zed w (⟨-(1 / 2), 1 / 2, 0, 0, m⟩ : State K) = 1 / 2 ∧
    conj (⟨-(1 / 2), 1 / 2, 0, 0, m⟩ : State K) ≠ ⟨-(1 / 2), 1 / 2, 0, 0, m⟩ := by
  refine ⟨by simp [charge], by simp [zed, charge], ?_⟩
  rw [Ne, fixed_iff]; norm_num

omit [CharZero K] in
/-- The two nulls force the visible half: at any mixing weight, zero electric charge and a zero Z reading give
zero isospin and zero hypercharge. -/
theorem the_two_nulls_force_the_visible_half (w : K) {s : State K} (hq : charge s = 0) (hz : zed w s = 0) :
    s.t = 0 ∧ s.y = 0 := by
  have ht : s.t = 0 := by
    have := hz; simp only [zed, hq, mul_zero, sub_zero] at this; exact this
  refine ⟨ht, ?_⟩
  have := hq; simp only [charge, ht, zero_add] at this; exact this

theorem the_nulls_and_no_colour_fix_the_visible_half (w : K) {s : State K} (hq : charge s = 0)
    (hz : zed w s = 0) (hc : s.c = 0) : conjV s = s := by
  obtain ⟨a, b⟩ := the_two_nulls_force_the_visible_half w hq hz
  exact (visible_fixed_iff s).mpr ⟨b, a, hc⟩

/-- A charge counted in whole quanta and bounded strictly inside one quantum is zero. -/
theorem a_bound_inside_one_quantum_is_a_zero (n : ℤ) (h : |n| < 1) : n = 0 := Int.abs_lt_one_iff.mp h

/-- With the coupling measured, a force bounded below the force of one quantum is the zero charge. -/
theorem a_bound_at_a_measured_coupling_is_a_zero {g : ℝ} (hg : 0 < g) (n : ℤ)
    (h : g * (n : ℝ) ^ 2 < g) : n = 0 := by
  have h1 : (n : ℝ) ^ 2 < 1 := by
    by_contra hc
    have : g * 1 ≤ g * (n : ℝ) ^ 2 := mul_le_mul_of_nonneg_left (not_lt.mp hc) hg.le
    linarith
  have h2 : (n ^ 2 : ℤ) < 1 := by exact_mod_cast h1
  have h3 : n ^ 2 = 0 := le_antisymm (by omega) (sq_nonneg n)
  exact pow_eq_zero_iff (two_ne_zero) |>.mp h3

/-- With the coupling free, every charge meets every positive bound at some positive coupling. -/
theorem a_free_coupling_meets_every_bound (n : ℤ) {ε : ℝ} (hε : 0 < ε) :
    ∃ g : ℝ, 0 < g ∧ g * (n : ℝ) ^ 2 < ε := by
  have hp : 0 < (n : ℝ) ^ 2 + 1 := by positivity
  refine ⟨ε / (2 * ((n : ℝ) ^ 2 + 1)), by positivity, ?_⟩
  rw [div_mul_eq_mul_div, div_lt_iff₀ (by positivity)]
  nlinarith [sq_nonneg (n : ℝ)]

/-! ## Part IV. Radiative weight, and a triplet -/

/-- The radiative weight: the sum of the squares of the charges. -/
def weight (s : State ℝ) : ℝ := s.y ^ 2 + s.t ^ 2 + s.c ^ 2 + s.d ^ 2

/-- The weight vanishes exactly on the fixed set. -/
theorem weight_zero_iff_fixed (s : State ℝ) : weight s = 0 ↔ conj s = s := by
  rw [fixed_iff]; unfold weight
  constructor
  · intro h
    have a := sq_nonneg s.y; have b := sq_nonneg s.t; have c := sq_nonneg s.c; have d := sq_nonneg s.d
    refine ⟨?_, ?_, ?_, ?_⟩ <;> exact pow_eq_zero_iff (two_ne_zero) |>.mp (by linarith)
  · rintro ⟨a, b, c, d⟩; rw [a, b, c, d]; ring

/-- A state with a dark charge of one and no visible charge has no visible weight and a weight of one. -/
theorem a_dark_charge_radiates_dark_only (m : ℝ) :
    (⟨0, 0, 0, 1, m⟩ : State ℝ).y ^ 2 + (⟨0, 0, 0, 1, m⟩ : State ℝ).t ^ 2 + (⟨0, 0, 0, 1, m⟩ : State ℝ).c ^ 2 = 0
    ∧ weight ⟨0, 0, 0, 1, m⟩ = 1 := by
  constructor <;> norm_num [weight]

/-- A triplet of isospin without hypercharge: exactly the middle member is fixed. -/
theorem one_member_of_a_triplet_is_fixed (m : K) (t : K) :
    conj (⟨0, t, 0, 0, m⟩ : State K) = ⟨0, t, 0, 0, m⟩ ↔ t = 0 := by
  rw [fixed_iff]; simp

/-! ## Part V. Records that forget -/

/-- If two worlds leave one record and carry different labels, no function of the record returns the label. -/
theorem no_reading_returns_what_the_record_forgets {W R L : Type*} (rec : W → R) (lab : W → L) {a b : W}
    (h : rec a = rec b) (hl : lab a ≠ lab b) : ¬ ∃ f : R → L, ∀ w, f (rec w) = lab w := by
  rintro ⟨f, hf⟩
  exact hl (by rw [← hf a, ← hf b, h])

omit [CharZero K] in
/-- Two fixed states of one mass and different names: no reading of the state returns the name. -/
theorem gravity_does_not_read_identity {L : Type*} (name : Bool → L) (hn : name true ≠ name false) (m : K) :
    ¬ ∃ f : State K → L, ∀ b : Bool, f (⟨0, 0, 0, 0, m⟩ : State K) = name b := by
  rintro ⟨f, hf⟩
  exact hn ((hf true).symm.trans (hf false))

/-! ## Part VI. The anomaly sums -/

/-- A left-handed Weyl field: the sizes of its colour and isospin multiplets, their indices, the cubic colour
coefficient, its hypercharge and its dark charge, and its count of isospin doublets. -/
structure Weyl (K : Type*) where
  n3 : K
  n2 : K
  i3 : K
  i2 : K
  a3 : K
  y : K
  d : K
  dbl : ℕ

def tot (f : Weyl K → K) (l : List (Weyl K)) : K := (l.map f).sum

omit [CharZero K] in
theorem tot_append (f : Weyl K → K) (l l' : List (Weyl K)) : tot f (l ++ l') = tot f l + tot f l' := by
  simp [tot]

/-- The eleven sums, and the count of doublets. Five read the Standard Model alone; six read the dark charge. -/
def Closes (l : List (Weyl K)) : Prop :=
  tot (fun w => w.n2 * w.a3) l = 0 ∧ tot (fun w => w.n2 * w.i3 * w.y) l = 0 ∧
  tot (fun w => w.n3 * w.i2 * w.y) l = 0 ∧ tot (fun w => w.n3 * w.n2 * w.y ^ 3) l = 0 ∧
  tot (fun w => w.n3 * w.n2 * w.y) l = 0 ∧
  tot (fun w => w.n3 * w.n2 * w.d ^ 3) l = 0 ∧ tot (fun w => w.n3 * w.n2 * w.d) l = 0 ∧
  tot (fun w => w.n3 * w.n2 * w.d ^ 2 * w.y) l = 0 ∧ tot (fun w => w.n3 * w.n2 * w.d * w.y ^ 2) l = 0 ∧
  tot (fun w => w.n2 * w.i3 * w.d) l = 0 ∧ tot (fun w => w.n3 * w.i2 * w.d) l = 0 ∧
  Even ((l.map Weyl.dbl).sum)

/-- One generation, left-handed, with no dark charge: the quark doublet, the two conjugate quarks, the lepton
doublet and the conjugate electron. -/
def gen : List (Weyl K) :=
  [⟨3, 2, 1 / 2, 1 / 2, 1, 1 / 6, 0, 3⟩, ⟨3, 1, 1 / 2, 0, -1, -(2 / 3), 0, 0⟩, ⟨3, 1, 1 / 2, 0, -1, 1 / 3, 0, 0⟩,
   ⟨1, 2, 0, 1 / 2, 0, -(1 / 2), 0, 1⟩, ⟨1, 1, 0, 0, 0, 1, 0, 0⟩]

/-- A singlet of the Standard Model with dark charge `q`. -/
def singlet (q : K) : Weyl K := ⟨1, 1, 0, 0, 0, 0, q, 0⟩

theorem one_generation_closes : Closes (gen : List (Weyl K)) := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ⟨2, rfl⟩⟩ <;>
    (simp only [tot, gen, List.map, List.sum_cons, List.sum_nil]; norm_num)

/-- One generation with two singlets of dark charges `a` and `b` closes exactly when `a + b = 0`. -/
theorem a_pair_of_singlets_closes_iff (a b : K) :
    Closes (gen ++ [singlet a, singlet b] : List (Weyl K)) ↔ a + b = 0 := by
  obtain ⟨g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12⟩ := one_generation_closes (K := K)
  have e : ∀ (f : Weyl K → K) (u v : Weyl K), tot f [u, v] = f u + f v := by
    intro f u v; simp [tot]
  unfold Closes
  simp only [tot_append, e, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, singlet, zero_add]
  constructor
  · intro h
    have := h.2.2.2.2.2.2.1
    linear_combination this
  · intro h
    have hb : b = -a := by linear_combination h
    subst hb
    refine ⟨by ring, by ring, by ring, by ring, by ring, by ring, by ring, by ring, by ring, by ring, by ring, ?_⟩
    simpa [List.map_append, List.sum_append, singlet] using g12

/-- The fifth is free: a vector-like pair closes for every dark charge. -/
theorem a_vector_like_pair_closes_for_every_charge (q : K) :
    Closes (gen ++ [singlet q, singlet (-q)] : List (Weyl K)) :=
  (a_pair_of_singlets_closes_iff q (-q)).mpr (by ring)

/-- One chiral singlet with a dark charge fails. -/
theorem a_chiral_singlet_fails {q : K} (hq : q ≠ 0) : ¬ Closes (gen ++ [singlet q, singlet 0] : List (Weyl K)) := by
  rw [a_pair_of_singlets_closes_iff]; simpa using hq

/-- The visible record of a field: everything but its dark charge. -/
def visible (w : Weyl K) : K × K × K × K × K × K × ℕ := (w.n3, w.n2, w.i3, w.i2, w.a3, w.y, w.dbl)

/-- Two worlds that both close, one with no dark charge and one with a dark charge, leave one visible record:
no function of the visible record says whether a dark charge exists. -/
theorem the_visible_record_does_not_decide :
    Closes (gen ++ [singlet 0, singlet 0] : List (Weyl K)) ∧
    Closes (gen ++ [singlet 1, singlet (-1)] : List (Weyl K)) ∧
    (gen ++ [singlet 0, singlet 0] : List (Weyl K)).map visible
      = (gen ++ [singlet 1, singlet (-1)] : List (Weyl K)).map visible ∧
    ¬ ∃ f : List (K × K × K × K × K × K × ℕ) → Prop, ∀ l : List (Weyl K), f (l.map visible) ↔ ∃ w ∈ l, w.d ≠ 0 := by
  have hrec : (gen ++ [singlet 0, singlet 0] : List (Weyl K)).map visible
      = (gen ++ [singlet 1, singlet (-1)] : List (Weyl K)).map visible := by
    simp [visible, singlet]
  refine ⟨by simpa using a_vector_like_pair_closes_for_every_charge (0 : K),
    a_vector_like_pair_closes_for_every_charge 1, hrec, ?_⟩
  rintro ⟨f, hf⟩
  have a0 : ¬ ∃ w ∈ (gen ++ [singlet 0, singlet 0] : List (Weyl K)), w.d ≠ 0 := by
    simp [gen, singlet]
  have a1 : ∃ w ∈ (gen ++ [singlet 1, singlet (-1)] : List (Weyl K)), w.d ≠ 0 :=
    ⟨singlet 1, by simp, by simp [singlet]⟩
  have h1 := (hf _).mpr a1
  rw [← hrec] at h1
  exact a0 ((hf _).mp h1)

/-! ## Part VII. The mass term that pairs a field with itself; the side of the line -/

/-- A mass term that pairs a field with itself carries twice each abelian charge. It is allowed exactly when
hypercharge and dark charge vanish. -/
theorem a_self_paired_mass_iff (s : State K) : (2 * s.y = 0 ∧ 2 * s.d = 0) ↔ (s.y = 0 ∧ s.d = 0) := by
  constructor
  · rintro ⟨a, b⟩
    exact ⟨(mul_eq_zero.mp a).resolve_left two_ne, (mul_eq_zero.mp b).resolve_left two_ne⟩
  · rintro ⟨a, b⟩; rw [a, b]; simp

/-- On the visible fixed set, a self-paired mass is allowed exactly when conjugation fixes the state. -/
theorem on_the_visible_half_self_paired_iff_fixed {s : State K} (hv : conjV s = s) :
    (2 * s.y = 0 ∧ 2 * s.d = 0) ↔ conj s = s := by
  obtain ⟨a, b, c⟩ := (visible_fixed_iff s).mp hv
  rw [a_self_paired_mass_iff, fixed_iff]; tauto

omit [CharZero K] in
/-- A pair of opposite dark charges carries none in total: a mass term that pairs the two is allowed. -/
theorem a_pair_takes_its_mass_together (q : K) : q + -q = 0 := by ring

/-- The point of a state on the plane: its dark charge beside the line `h = 1`, its mass as height. -/
def point (s : State K) : K × K := (1 + s.d, s.m)
/-- The fold of the plane across the line `h = 1`. -/
def fold (p : K × K) : K × K := (2 - p.1, p.2)

omit [CharZero K] in
/-- Conjugation is carried to the fold. -/
theorem conj_is_the_fold (s : State K) : point (conj s) = fold (point s) := by
  simp only [point, conj, fold]; ext <;> simp; ring

/-- A state lies on the line exactly when its dark charge is zero. -/
theorem on_the_line_iff (s : State K) : fold (point s) = point s ↔ s.d = 0 := by
  simp only [point, fold, Prod.mk.injEq, and_true]
  constructor
  · intro h
    have h2 : (2 : K) * s.d = 0 := by linear_combination -h
    exact (mul_eq_zero.mp h2).resolve_left two_ne
  · intro h; rw [h]; ring

/-! ## Part VIII. The census of renormalizable terms -/

/-- A field of the census: the five left-handed Weyl fermions of one generation, the Higgs doublet, a real
singlet scalar `S` and a singlet Weyl fermion `N`. -/
inductive Fld | Q | uc | dc | L | ec | H | S | N
  deriving DecidableEq, Repr

/-- Hypercharge in sixths. -/
def Fld.y6 : Fld → Int
  | .Q => 1 | .uc => -4 | .dc => 2 | .L => -3 | .ec => 6 | .H => 3 | .S => 0 | .N => 0
def Fld.tri : Fld → Int
  | .Q => 1 | .uc => -1 | .dc => -1 | _ => 0
def Fld.doublet : Fld → Bool
  | .Q => true | .L => true | .H => true | _ => false
def Fld.darkF : Fld → Bool
  | .S => true | .N => true | _ => false

/-- A leg of a term: a field and whether it enters conjugated. -/
abbrev Leg := Fld × Bool
def legY (l : Leg) : Int := if l.2 then -l.1.y6 else l.1.y6
def legTri (l : Leg) : Int := if l.2 then -l.1.tri else l.1.tri
def sumI : List Int → Int
  | [] => 0
  | x :: t => x + sumI t

/-- The three tests of a term: its hypercharge sums to zero, its colour triality is zero modulo three, and its
doublets pair. -/
def passes (m : List Leg) : Bool :=
  sumI (m.map legY) == 0 && sumI (m.map legTri) % 3 == 0 && (m.filter (fun l => l.1.doublet)).length % 2 == 0

/-- A portal: a term that passes, with a dark leg and a leg of the Standard Model. -/
def portal (m : List Leg) : Bool :=
  passes m && m.any (fun l => l.1.darkF) && m.any (fun l => !l.1.darkF)

def scal : List Leg := [(.H, false), (.H, true), (.S, false)]
def fer : List Fld := [.Q, .uc, .dc, .L, .ec, .N]

/-- Every renormalizable term without derivatives that can be a Lorentz scalar: two to four scalars, or two Weyl
fermions of one chirality with at most one scalar. 6 + 10 + 15 + 168 = 199 terms. -/
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
/-- Of the 199 terms, exactly four are portals: `S H†H`, `S² H†H`, and `L N H` with its conjugate. -/
theorem portals_are_derived :
    census.length = 199 ∧ (census.filter portal).length = 4 ∧
    [(Fld.H, false), (Fld.H, true), (Fld.S, false)] ∈ census.filter portal ∧
    [(Fld.H, false), (Fld.H, true), (Fld.S, false), (Fld.S, false)] ∈ census.filter portal ∧
    [(Fld.L, false), (Fld.N, false), (Fld.H, false)] ∈ census.filter portal ∧
    [(Fld.L, true), (Fld.N, true), (Fld.H, true)] ∈ census.filter portal := by decide

/-- The number of legs of one field in a term. -/
def count (f : Fld) (m : List Leg) : Nat := (m.filter (fun l => l.1 == f)).length
/-- Even under the parity that keeps the dark matter stable: an even number of `S` legs and of `N` legs. -/
def evenDark (m : List Leg) : Bool := count .S m % 2 == 0 && count .N m % 2 == 0

set_option maxRecDepth 200000 in
/-- Under that parity exactly one portal survives, `S² H†H`, and none with the fermion. -/
theorem a_stable_singlet_keeps_one_door :
    (census.filter (fun m => portal m && evenDark m)).length = 1 ∧
    [(Fld.H, false), (Fld.H, true), (Fld.S, false), (Fld.S, false)] ∈ census.filter (fun m => portal m && evenDark m) ∧
    (census.filter (fun m => portal m && evenDark m && (count .N m != 0))).length = 0 := by decide

/-! ## Part IX. Acceleration -/

/-- The active density that the acceleration reads: density plus three times the pressure. -/
def active (ρ p : ℝ) : ℝ := ρ + 3 * p

theorem the_vacuum_repels (ρ : ℝ) : active ρ (-ρ) = -2 * ρ := by unfold active; ring
theorem dust_and_radiation_attract {ρ : ℝ} (h : 0 < ρ) : 0 < active ρ 0 ∧ 0 < active ρ (ρ / 3) := by
  unfold active; constructor <;> linarith
theorem repulsion_iff (ρ p : ℝ) : active ρ p < 0 ↔ 3 * p < -ρ := by unfold active; constructor <;> intro h <;> linarith

/-- A canonical field of kinetic density `K` and potential `V` has density `K + V` and pressure `K - V`. -/
theorem density_plus_pressure (K V : ℝ) : (K + V) + (K - V) = 2 * K := by ring

/-- The floor: with `K ≥ 0` and positive density, the equation of state is at least minus one. -/
theorem the_floor {K V : ℝ} (hK : 0 ≤ K) (hρ : 0 < K + V) : -1 ≤ (K - V) / (K + V) := by
  rw [le_div_iff₀ hρ]; linarith

/-- It is minus one exactly for the frozen field. -/
theorem the_floor_is_exact {K V : ℝ} (hρ : 0 < K + V) : (K - V) / (K + V) = -1 ↔ K = 0 := by
  rw [div_eq_iff hρ.ne']
  constructor <;> intro h <;> linarith

/-- Below the floor at positive density, the kinetic density is negative. -/
theorem below_the_floor_is_a_ghost {K V : ℝ} (hρ : 0 < K + V) (h : (K - V) / (K + V) < -1) : K < 0 := by
  rw [div_lt_iff₀ hρ] at h; linarith

/-- At negative density the floor fails. -/
theorem the_floor_fails_at_negative_density : ((1 : ℝ) - -3) / (1 + -3) < -1 := by norm_num

/-- The floor is additive: any number of canonical fields with positive total density stays at or above it. -/
theorem the_floor_is_additive {n : ℕ} (K V : Fin n → ℝ) (hK : ∀ j, 0 ≤ K j) (hρ : 0 < ∑ j, (K j + V j)) :
    -1 ≤ (∑ j, (K j - V j)) / (∑ j, (K j + V j)) := by
  rw [le_div_iff₀ hρ]
  have h : ∑ j, (K j - V j) + ∑ j, (K j + V j) = 2 * ∑ j, K j := by
    rw [← Finset.sum_add_distrib, Finset.mul_sum]
    exact Finset.sum_congr rfl (fun j _ => by ring)
  have h2 : 0 ≤ ∑ j, K j := Finset.sum_nonneg (fun j _ => hK j)
  linarith

/-- The deceleration of a flat world of matter and vacuum. -/
noncomputable def decel (Ωm ΩΛ : ℝ) : ℝ := Ωm / 2 - ΩΛ

/-- The sign is read: all matter decelerates, and the measured budget accelerates. -/
theorem the_sign_is_read : 0 < decel 1 0 ∧ decel 0.3153 0.6847 < 0 := by
  unfold decel; constructor <;> norm_num

/-! ## Part X. The premises -/

/-- The physical premises of the paper. -/
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

/-- On the premises: conjugation fixes every member; every odd reading of a member is zero; a member radiates
through no charge; a self-paired mass is allowed; and the equation of state of dark energy is at least minus one. -/
theorem dark_forced (P : Premises) :
    (∀ k, conj (P.member k) = P.member k) ∧
    (∀ k (f : State ℝ → ℝ), Odd' f → f (P.member k) = 0) ∧
    (∀ k, weight (P.member k) = 0) ∧
    (∀ k, 2 * (P.member k).y = 0 ∧ 2 * (P.member k).d = 0) ∧
    -1 ≤ (∑ j, (P.K j - P.V j)) / (∑ j, (P.K j + P.V j)) := by
  have fx : ∀ k, conj (P.member k) = P.member k := fun k =>
    (fixed_iff_visible_and_dark _).mpr
      ⟨the_nulls_and_no_colour_fix_the_visible_half P.w (P.photon k) (P.zboson k) (P.colourless k), P.posit k⟩
  refine ⟨fx, fun k f hf => odd_readings_are_blind hf (fx k), fun k => (weight_zero_iff_fixed _).mpr (fx k),
    fun k => ?_, the_floor_is_additive P.K P.V P.canonical P.dense⟩
  obtain ⟨a, -, -, d⟩ := (fixed_iff _).mp (fx k)
  rw [a, d]; simp

/-- The premises are met: one massive singlet, and one rolling field. -/
noncomputable def darkPremises : Premises where
  w := 0.2312
  n := 1
  member := fun _ => ⟨0, 0, 0, 0, 1⟩
  photon := fun _ => by simp [charge]
  zboson := fun _ => by simp [zed, charge]
  colourless := fun _ => rfl
  posit := fun _ => rfl
  N := 1
  K := fun _ => 1
  V := fun _ => 2
  canonical := fun _ => by norm_num
  dense := by simp; norm_num

/-- The posit is not forced: a state passes every measured field of the premises and carries a dark charge. -/
theorem the_posit_is_not_forced (w : ℝ) :
    ∃ s : State ℝ, charge s = 0 ∧ zed w s = 0 ∧ s.c = 0 ∧ s.d ≠ 0 ∧ conj s ≠ s :=
  ⟨⟨0, 0, 0, 1, 1⟩, by simp [charge], by simp [zed, charge], rfl, by norm_num, by rw [Ne, fixed_iff]; norm_num⟩

end SPHYS.Dark

#print axioms SPHYS.Dark.conj_involutive
#print axioms SPHYS.Dark.two_ne
#print axioms SPHYS.Dark.neg_eq_self_iff'
#print axioms SPHYS.Dark.fixed_iff
#print axioms SPHYS.Dark.visible_fixed_iff
#print axioms SPHYS.Dark.dark_fixed_iff
#print axioms SPHYS.Dark.fixed_iff_visible_and_dark
#print axioms SPHYS.Dark.the_dark_half_is_not_the_visible_half
#print axioms SPHYS.Dark.every_linear_reading_is_odd
#print axioms SPHYS.Dark.odd_readings_are_blind
#print axioms SPHYS.Dark.dark_is_fixed
#print axioms SPHYS.Dark.the_mass_is_even
#print axioms SPHYS.Dark.only_the_mass_is_read
#print axioms SPHYS.Dark.zed_is_odd
#print axioms SPHYS.Dark.neutral_is_not_dark
#print axioms SPHYS.Dark.the_two_nulls_force_the_visible_half
#print axioms SPHYS.Dark.the_nulls_and_no_colour_fix_the_visible_half
#print axioms SPHYS.Dark.a_bound_inside_one_quantum_is_a_zero
#print axioms SPHYS.Dark.a_bound_at_a_measured_coupling_is_a_zero
#print axioms SPHYS.Dark.a_free_coupling_meets_every_bound
#print axioms SPHYS.Dark.weight_zero_iff_fixed
#print axioms SPHYS.Dark.a_dark_charge_radiates_dark_only
#print axioms SPHYS.Dark.one_member_of_a_triplet_is_fixed
#print axioms SPHYS.Dark.no_reading_returns_what_the_record_forgets
#print axioms SPHYS.Dark.gravity_does_not_read_identity
#print axioms SPHYS.Dark.tot_append
#print axioms SPHYS.Dark.one_generation_closes
#print axioms SPHYS.Dark.a_pair_of_singlets_closes_iff
#print axioms SPHYS.Dark.a_vector_like_pair_closes_for_every_charge
#print axioms SPHYS.Dark.a_chiral_singlet_fails
#print axioms SPHYS.Dark.the_visible_record_does_not_decide
#print axioms SPHYS.Dark.a_self_paired_mass_iff
#print axioms SPHYS.Dark.on_the_visible_half_self_paired_iff_fixed
#print axioms SPHYS.Dark.a_pair_takes_its_mass_together
#print axioms SPHYS.Dark.conj_is_the_fold
#print axioms SPHYS.Dark.on_the_line_iff
#print axioms SPHYS.Dark.portals_are_derived
#print axioms SPHYS.Dark.a_stable_singlet_keeps_one_door
#print axioms SPHYS.Dark.the_vacuum_repels
#print axioms SPHYS.Dark.dust_and_radiation_attract
#print axioms SPHYS.Dark.repulsion_iff
#print axioms SPHYS.Dark.density_plus_pressure
#print axioms SPHYS.Dark.the_floor
#print axioms SPHYS.Dark.the_floor_is_exact
#print axioms SPHYS.Dark.below_the_floor_is_a_ghost
#print axioms SPHYS.Dark.the_floor_fails_at_negative_density
#print axioms SPHYS.Dark.the_floor_is_additive
#print axioms SPHYS.Dark.the_sign_is_read
#print axioms SPHYS.Dark.dark_forced
#print axioms SPHYS.Dark.the_posit_is_not_forced
#print axioms SPHYS.Dark.darkPremises
```

## Appendix B · Dark_Fixed_Set_Twin_CC.f90

Sixteen checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix C.

```fortran
! Dark_Fixed_Set_Twin_CC.f90 · twin of SPHYS_Dark_Fixed_Set_CC.lean
! RATIONALE. The engine proves the fixed set of conjugation, the blindness of odd readings, the visible half forced
!   by two nulls, the anomaly sums with a pair of singlets, the census of renormalizable terms and the floor of the
!   equation of state. This twin finds the same things by search on grids (A), recounts the census by independent
!   code (B), and sets the consequences against measured cosmology (C, D) and measured bounds (E).
! DESIGN. Whole numbers in A and B; double precision in C to E. Hypercharge is carried in sixths.
!   Measured inputs, each printed where it is used:
!   Planck 2018: matter 0.3153 +- 0.0073, vacuum 0.6847, cold dark matter 0.2645, baryons 0.0493,
!     physical densities 0.1200 and 0.02237, h = 0.6736.
!   DESI second release with the DES five-year supernovae: w0 = -0.752, wa = -0.86.
!   Bounds on self-interaction: 1.25 cm2/g (one cluster) and 0.47 cm2/g (72 clusters).
!   ACT sixth release: N_eff = 2.86 +- 0.13. Standard value 3.044.
!   Constants: critical density 1.05371e-5 h**2 GeV/cm3; hbar c = 1.973269804e-14 GeV cm;
!     Planck mass 1.220890e19 GeV; 1 g = 5.609589e23 GeV; 1 barn = 1e-24 cm2.
! RISK. A search of a grid is not a proof outside the grid; the statements over every field of characteristic zero
!   are the engine's theorems. The rows of C to E are retrodictions: each measurement stood before this work.
! NON-NEGOTIABLE. Every count printed by A and B is found by the search, not entered.
program dark_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0)
  integer :: nfail, npass, y, t, c, d, a, b, k, e, nfix, nvis, ndark, nz, i, j, l, cj, o, nmono, nport, neven, nevenN
  integer :: ncl, nbad, nfl, s3(3), tr(3), f(5), cnj(5), nl, ntrip
  integer, parameter :: y6(8) = [1, -4, 2, -3, 6, 3, 0, 0], tri(8) = [1, -1, -1, 0, 0, 0, 0, 0]
  logical, parameter :: dbl(8) = [.true., .false., .false., .true., .false., .true., .false., .false.]
  real(dp) :: w, z, q0, om, ol, rho, mev, wmin, kk, vv, w0, wa, zc, dn, x
  logical :: ok, blind
  nfail = 0; npass = 0

  ! A. states with whole charges from -2 to 2
  nfix = 0; nvis = 0; ndark = 0
  do y = -2, 2; do t = -2, 2; do c = -2, 2; do d = -2, 2
    if (-y == y .and. -t == t .and. -c == c .and. -d == d) nfix = nfix + 1
    if (-y == y .and. -t == t .and. -c == c) nvis = nvis + 1
    blind = .true.
    do a = -2, 2; do b = -2, 2; do k = -2, 2; do e = -2, 2
      if (a*y + b*t + k*c + e*d /= 0) blind = .false.
    end do; end do; end do; end do
    if (blind) ndark = ndark + 1
    if (blind .neqv. (y == 0 .and. t == 0 .and. c == 0 .and. d == 0)) nfail = nfail + 1
  end do; end do; end do; end do
  write(*,'(a,i0,a,i0,a,i0)') '  of 625 states: fixed by conjugation: ', nfix, '; fixed by visible conjugation: ', nvis, &
    '; blind to all 625 linear readings: ', ndark
  call check('A1 conjugation fixes exactly the state of no charge; visible conjugation fixes five', nfix == 1 .and. nvis == 5)
  call check('A2 a state is blind to every linear reading exactly when conjugation fixes it', ndark == 1)
  ok = .true.
  do i = 0, 100
    w = i / 100.0_dp
    x = 0.5_dp; q0 = -0.5_dp                 ! isospin and hypercharge of a neutrino
    z = x - w * (x + q0)
    if (abs(x + q0) > 0 .or. abs(z - 0.5_dp) > 0) ok = .false.
  end do
  call check('A3 the charges of a neutrino: no electric charge, a Z reading of one half at 101 mixing weights', ok)
  nz = 0
  do t = -12, 12; do y = -12, 12          ! isospin and hypercharge in sixths
    if (t + y == 0 .and. abs(t - 0.2312_dp * (t + y)) < 0.5_dp) nz = nz + 1
  end do; end do
  write(*,'(a,f7.4,a,i0)') '  mixing weight ', 0.2312_dp, &
    '; of 625 pairs of isospin and hypercharge in sixths, with both nulls inside half a quantum: ', nz
  call check('A4 the photon null and the Z null leave one pair: no isospin and no hypercharge', nz == 1)
  ntrip = 0
  do t = -1, 1
    if (-t == t) ntrip = ntrip + 1
  end do
  call check('A5 one member of a triplet of isospin is fixed', ntrip == 1)
  ! the anomaly sums of one generation, hypercharge in sixths, weights: colour 3, isospin 2
  s3 = [2*1 - 1 - 1, 2*y6(1) + y6(2) + y6(3), 3*y6(1) + y6(4)]
  tr = [6*y6(1)**3 + 3*y6(2)**3 + 3*y6(3)**3 + 2*y6(4)**3 + y6(5)**3, 6*y6(1) + 3*y6(2) + 3*y6(3) + 2*y6(4) + y6(5), 0]
  write(*,'(a,5(1x,i0))') '  the five sums of one generation:', s3(1), s3(2), s3(3), tr(1), tr(2)
  ncl = 0; nbad = 0
  do a = -5, 5; do b = -5, 5
    ok = (a**3 + b**3 == 0) .and. (a + b == 0)
    if (ok) ncl = ncl + 1
    if (ok .neqv. (a + b == 0)) nbad = nbad + 1
  end do; end do
  write(*,'(a,i0,a)') '  of 121 pairs of dark charges of two singlets, closing: ', ncl, ', those that sum to zero'
  call check('A6 one generation closes; with two singlets it closes exactly when their dark charges sum to zero', &
    all(s3 == 0) .and. all(tr == 0) .and. ncl == 11 .and. nbad == 0)

  ! B. the census: fields 1 Q, 2 uc, 3 dc, 4 L, 5 ec, 6 H, 7 S, 8 N
  nmono = 0; nport = 0; neven = 0; nevenN = 0
  do i = 1, 3; do j = i, 3
    f(1:2) = [sc(i), sc(j)]; cnj(1:2) = [scj(i), scj(j)]; call term(2)
  end do; end do
  do i = 1, 3; do j = i, 3; do k = j, 3
    f(1:3) = [sc(i), sc(j), sc(k)]; cnj(1:3) = [scj(i), scj(j), scj(k)]; call term(3)
  end do; end do; end do
  do i = 1, 3; do j = i, 3; do k = j, 3; do l = k, 3
    f(1:4) = [sc(i), sc(j), sc(k), sc(l)]; cnj(1:4) = [scj(i), scj(j), scj(k), scj(l)]; call term(4)
  end do; end do; end do; end do
  do i = 1, 6; do j = i, 6; do cj = 0, 1; do o = 0, 3
    f(1:2) = [fe(i), fe(j)]; cnj(1:2) = cj; nl = 2
    if (o > 0) then
      nl = 3; f(3) = merge(7, 6, o == 3); cnj(3) = merge(1, 0, o == 2)
    end if
    call term(nl)
  end do; end do; end do; end do
  write(*,'(a,i0,a,i0,a,i0,a,i0)') '  terms: ', nmono, '; portals: ', nport, '; portals even under the parity: ', neven, &
    '; of those with the fermion: ', nevenN
  call check('B1 of 199 terms four are portals', nmono == 199 .and. nport == 4)
  call check('B2 under the parity that keeps the dark matter stable one portal survives, and none with the fermion', &
    neven == 1 .and. nevenN == 0)

  ! C. the acceleration
  om = 0.3153_dp; ol = 0.6847_dp
  q0 = om / 2 - ol
  write(*,'(a,f7.4,a,f7.4,a,f7.4,a,f7.4,a,f7.4)') '  inputs: matter ', om, ' +- ', 0.0073_dp, '; vacuum ', ol, &
    '; cold dark matter ', 0.2645_dp, '; baryons ', 0.0493_dp
  write(*,'(a,f7.4,a,f8.5,a,f7.4)') '  inputs: physical densities ', 0.1200_dp, ' and ', 0.02237_dp, '; h ', 0.6736_dp
  write(*,'(a,f7.3,a,f6.3,a,f6.3)') '  deceleration: all matter ', 0.5_dp, '; measured budget ', q0, ' +- ', 1.5_dp * 0.0073_dp
  call check('C1 all matter decelerates and the measured budget accelerates', 0.5_dp > 0 .and. q0 < 0)
  write(*,'(a,f6.3,a,f6.3)') '  acceleration begins at redshift ', (2 * ol / om)**(1.0_dp/3) - 1, &
    '; vacuum overtakes matter at ', (ol / om)**(1.0_dp/3) - 1
  write(*,'(a,f5.2,a,f5.2)') '  dark matter to baryons: ', 0.2645_dp / 0.0493_dp, &
    '; in physical densities: ', 0.1200_dp / 0.02237_dp
  call check('C2 the budget: five times as much dark matter as baryons, by both measures', &
    abs(0.2645_dp / 0.0493_dp - 0.1200_dp / 0.02237_dp) < 0.01_dp)
  rho = ol * 1.05371e-5_dp * 0.6736_dp**2 * 1.973269804e-14_dp**3      ! GeV**4
  mev = rho**0.25_dp * 1.0e12_dp
  write(*,'(a,f5.2,a,f7.1)') '  vacuum density: (', mev, ' meV)**4; log10 of its ratio to the Planck mass**4: ', &
    log10(rho / 1.220890e19_dp**4)
  call check('C3 the vacuum density is a number near (2.2 meV)**4, 123 orders below the Planck density', &
    abs(mev - 2.24_dp) < 0.02_dp .and. abs(log10(rho / 1.220890e19_dp**4) + 122.9_dp) < 0.1_dp)

  ! D. the floor of the equation of state
  wmin = 1; nfl = 0; nbad = 0
  do i = 0, 60; do j = -60, 60
    kk = i * 0.05_dp; vv = j * 0.05_dp
    if (kk + vv <= 1e-12_dp) cycle
    w = (kk - vv) / (kk + vv); wmin = min(wmin, w)
    if (w < -1 - 1e-12_dp) nbad = nbad + 1
    if (abs(w + 1) < 1e-12_dp .and. i /= 0) nfl = nfl + 1
  end do; end do
  write(*,'(a,f8.5,a,i0,a,i0)') '  canonical fields on a grid: least equation of state ', wmin, '; below -1: ', nbad, &
    '; at -1 with motion: ', nfl
  call check('D1 at positive density no canonical field falls below -1, and only the frozen field reaches it', &
    nbad == 0 .and. nfl == 0 .and. abs(wmin + 1) < 1e-12_dp)
  write(*,'(a,f6.2)') '  kinetic 1, potential -3, density -2: equation of state ', (1.0_dp + 3) / (1.0_dp - 3)
  call check('D2 at negative density the floor fails', (1.0_dp + 3) / (1.0_dp - 3) < -1)
  w0 = -0.752_dp; wa = -0.86_dp
  x = (-1 - w0) / wa; zc = x / (1 - x)
  write(*,'(a,f7.3,a,f6.2)') '  inputs: w0 ', w0, '; wa ', wa
  write(*,'(a,f6.3,a,f7.3)') '  the fitted curve w0 + wa z/(1+z) crosses -1 at redshift ', zc, &
    ' and is at redshift 1: ', w0 + wa / 2
  call check('D3 the fitted curve of the second release lies below the floor beyond redshift 0.4', &
    abs(zc - 0.405_dp) < 0.002_dp .and. w0 + wa / 2 < -1)

  ! E. the measured bounds the posit must meet
  write(*,'(a,f5.2,a,f5.2,a)') '  bounds on self-interaction: ', 1.25_dp / 0.5609589_dp, ' and ', 0.47_dp / 0.5609589_dp, &
    ' barn per GeV'
  write(*,'(a,f5.2,a,f5.2,a,f6.3,a,f5.2,a,f5.2)') '  inputs: bounds ', 1.25_dp, ' and ', 0.47_dp, &
    ' cm2/g; standard count ', 3.044_dp, '; measured count ', 2.86_dp, ' +- ', 0.13_dp
  dn = (4.0_dp / 7) * (10.75_dp / 106.75_dp)**(4.0_dp / 3)
  write(*,'(a,f6.3,a,f6.3,a,f6.3)') '  a light relic decoupled above the weak scale adds per boson state ', dn, &
    '; a dark photon ', 2 * dn, '; with the standard value: ', 3.044_dp + 2 * dn
  call check('E1 a dark photon once in equilibrium would still lie inside the measured count of light species', &
    3.044_dp + 2 * dn < 2.86_dp + 2 * 0.13_dp .and. abs(dn - 0.027_dp) < 0.001_dp)
  write(*,'(a,es8.1)') '  one density, two particles of 100 GeV and 10 micro-eV: ratio of their numbers ', 100.0e9_dp / 10.0e-6_dp
  call check('E2 two particles sixteen orders apart in number leave one density', &
    abs(100.0e9_dp / 10.0e-6_dp / 1e16_dp - 1) < 1e-12_dp)

  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', npass + nfail, ',"failures":', nfail, '}'
  if (nfail /= 0) stop 1
contains
  integer function sc(i)               ! the scalars: H, H conjugate, S
    integer, intent(in) :: i
    sc = merge(7, 6, i == 3)
  end function
  integer function scj(i)
    integer, intent(in) :: i
    scj = merge(1, 0, i == 2)
  end function
  integer function fe(i)               ! the fermions: Q, uc, dc, L, ec, N
    integer, intent(in) :: i
    fe = merge(8, i, i == 6)
  end function
  subroutine term(n)                   ! one term of n legs held in f and cnj
    integer, intent(in) :: n
    integer :: ys, ts, ds, nd, ns, nn, m
    logical :: port
    ys = 0; ts = 0; ds = 0; nd = 0; ns = 0; nn = 0
    do m = 1, n
      ys = ys + merge(-y6(f(m)), y6(f(m)), cnj(m) == 1); ts = ts + merge(-tri(f(m)), tri(f(m)), cnj(m) == 1)
      if (dbl(f(m))) ds = ds + 1
      if (f(m) >= 7) nd = nd + 1
      if (f(m) == 7) ns = ns + 1
      if (f(m) == 8) nn = nn + 1
    end do
    nmono = nmono + 1
    port = ys == 0 .and. modulo(ts, 3) == 0 .and. mod(ds, 2) == 0 .and. nd > 0 .and. nd < n
    if (port) nport = nport + 1
    if (port .and. mod(ns, 2) == 0 .and. mod(nn, 2) == 0) then
      neven = neven + 1
      if (nn /= 0) nevenN = nevenN + 1
    end if
  end subroutine
  subroutine check(name, cond)
    character(*), intent(in) :: name
    logical, intent(in) :: cond
    if (cond) then
      write(*,'(a,a)') '  PASS  ', name; npass = npass + 1
    else
      write(*,'(a,a)') '  FAIL  ', name; nfail = nfail + 1
    end if
  end subroutine
end program dark_twin
```

## Appendix C · Run of Appendix B

```text
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
 BATTERY-JSON: {"checks":16,"failures":0}
```

## Appendix D · Kernel lines of Appendix A

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

```text
'SPHYS.Dark.conj_involutive' depends on axioms: [propext]
'SPHYS.Dark.two_ne' depends on axioms: [propext]
'SPHYS.Dark.neg_eq_self_iff'' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.fixed_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.visible_fixed_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.dark_fixed_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.fixed_iff_visible_and_dark' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.the_dark_half_is_not_the_visible_half' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.every_linear_reading_is_odd' depends on axioms: [propext, Quot.sound]
'SPHYS.Dark.odd_readings_are_blind' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.dark_is_fixed' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.the_mass_is_even' depends on axioms: [propext]
'SPHYS.Dark.only_the_mass_is_read' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.zed_is_odd' depends on axioms: [propext, Quot.sound]
'SPHYS.Dark.neutral_is_not_dark' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.the_two_nulls_force_the_visible_half' depends on axioms: [propext]
'SPHYS.Dark.the_nulls_and_no_colour_fix_the_visible_half' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.a_bound_inside_one_quantum_is_a_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.a_bound_at_a_measured_coupling_is_a_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.a_free_coupling_meets_every_bound' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.weight_zero_iff_fixed' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.a_dark_charge_radiates_dark_only' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.one_member_of_a_triplet_is_fixed' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.no_reading_returns_what_the_record_forgets' does not depend on any axioms
'SPHYS.Dark.gravity_does_not_read_identity' depends on axioms: [propext]
'SPHYS.Dark.tot_append' depends on axioms: [propext, Quot.sound]
'SPHYS.Dark.one_generation_closes' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.a_pair_of_singlets_closes_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.a_vector_like_pair_closes_for_every_charge' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.a_chiral_singlet_fails' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.the_visible_record_does_not_decide' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.a_self_paired_mass_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.on_the_visible_half_self_paired_iff_fixed' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.a_pair_takes_its_mass_together' depends on axioms: [propext, Quot.sound]
'SPHYS.Dark.conj_is_the_fold' depends on axioms: [propext, Quot.sound]
'SPHYS.Dark.on_the_line_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.portals_are_derived' depends on axioms: [propext]
'SPHYS.Dark.a_stable_singlet_keeps_one_door' depends on axioms: [propext]
'SPHYS.Dark.the_vacuum_repels' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.dust_and_radiation_attract' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.repulsion_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.density_plus_pressure' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.the_floor' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.the_floor_is_exact' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.below_the_floor_is_a_ghost' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.the_floor_fails_at_negative_density' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.the_floor_is_additive' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.the_sign_is_read' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.dark_forced' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.the_posit_is_not_forced' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Dark.darkPremises' depends on axioms: [propext, Classical.choice, Quot.sound]
```
