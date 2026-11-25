# The Charges of Matter as a New Mathematical Theorem

## Why the Lepton Charges Follow from the Quark Charges: Closure of the Record in Every Generation, and No Charge That No Field Reads

**Mohammad F. Islam PhD** · 25 November 2026

*Blog edition of the master, edition 2.0.0 of 25 November 2026. It renders the whole text. The printed files of the appendices stand in the master and in the Journal edition, and are listed at the end.*

## Abstract

This paper proves, in Lean 4 with Mathlib, that four sums fix the charges of a generation of matter. A generation of quarks and leptons carries five hypercharges: of the quark doublet, of the two right-handed quarks, of the lepton doublet and of the right-handed electron. Four sums of them, three of first degree and one of third, must vanish for the readings of the weak field, of the strong field, of gravity and of the hypercharge field itself to be consistent. The table is a point of a field of characteristic zero, the sums are polynomials, and no charge is given. The main theorem finds every table on which the four sums vanish: the lepton doublet is minus three times the quark doublet, the right-handed electron minus six times, and exactly three cases remain. The quark doublet carries no hypercharge and the two right-handed quarks carry opposite values; or the table is the observed one at some scale; or it is the observed one with the two right-handed quarks renamed. The converse is proved, so these are all. With the quark doublet charged, the lepton charges follow from the quark charges. The charges of the proton and the electron cancel on the first sum alone, whatever the scale, and so do those of the neutron and the neutrino. Every multiple of a table that closes also closes, so the four sums fix no unit; the unit is one sixth if the right-handed up quark carries the electric charge of its partner in the doublet, and the charges are then 2/3,  − 1/3, 0 and  − 1. A total over generations can vanish while each generation fails, but sums that vanish at every threshold vanish in each generation. A label that a fold keeps is a function of the registration, so no conserved label is unread. The premises are fields of one printed structure: the four sums vanish at every threshold, each quark doublet is charged, and charge is a label the registration conserves. The structure is inhabited. A Fortran twin searches all 9765625 tables with whole charges from  − 12 to 12 and finds 33 that close, each in one of the three cases, and sets two consequences against measurement: the charge of the neutron and the sum of the charges of the proton and the electron, each zero to parts in 10²¹. That the classification is known is stated, and that the four sums must vanish is entered from field theory. Part II states the reading from which the paper takes its place in the series, at premise grade and apart from the machine-checked claims.

## 1. The Theorem and What It Rests On

### 1.1 The statement

Let *q*, *u*, *d*, *l* and *e* be the hypercharges of the quark doublet, the right-handed up and down quarks, the lepton doublet and the right-handed electron. The four sums are

*S*₁ = 3*q* + *l*,   *S*₂ = 6*q* − 3*u* − 3*d*,

*S*₃ = 6*q* + 2*l* − 3*u* − 3*d* − *e*,   *S*₄ = 6*q*³ + 2*l*³ − 3*u*³ − 3*d*³ − *e*³.

A table closes when all four vanish.

**Theorem (`closure_forces_the_table`).** If a table closes, then *l* =  − 3*q*, *e* =  − 6*q*, *u* + *d* = 2*q*, and one of three cases holds: *q* = 0; or *u* = 4*q* and *d* =  − 2*q*; or *u* =  − 2*q* and *d* = 4*q*.

**Theorem (`closes_iff`).** A table closes exactly when it is (0,*u*,−*u*,0,0) for some *u*, or (*q*,4*q*,−2*q*,−3*q*,−6*q*) for some *q*, or (*q*,−2*q*,4*q*,−3*q*,−6*q*) for some *q*.

**Theorem (`the_atom_is_neutral`).** If *S*₁ = 0, the charges of the proton and the electron cancel, and those of the neutron and the neutrino cancel.

**Theorem (`charges_forced`).** On the premises below, every generation carries the observed table at the scale of its own quark doublet, or its renaming, and its atom is neutral.

**Theorem (`no_charge_is_unread`).** On the premises below, the charge of a state is a function of its registration.

The sums are those of Bouchiat, Iliopoulos and Meyer \[4\] and of the gravitational reading \[6\]. That they fix the hypercharges is classical \[7, 8, 9\]; here every solution is found with its converse, and the statements compile. The premises are met: `chargePremises` constructs a term of the structure with three generations at the scale one sixth.

### 1.2 The premises, printed

The physical premises of the paper are the fields of this structure of the Lean file, and there are no others. What is cited is in the tables of Section 1.3.

``` lean
structure Premises where
  n : ℕ
  T : ℕ → Table ℚ
  weak : ∀ k, k ≤ n → ∑ i ∈ Finset.range k, s1 (T i) = 0
  strong : ∀ k, k ≤ n → ∑ i ∈ Finset.range k, s2 (T i) = 0
  gravity : ∀ k, k ≤ n → ∑ i ∈ Finset.range k, s3 (T i) = 0
  hyper : ∀ k, k ≤ n → ∑ i ∈ Finset.range k, s4 (T i) = 0
  charged : ∀ i, i < n → (T i).q ≠ 0
  State : Type
  Value : Type
  reg : Registration State Value
  charge : State → ℚ
  conserved : ∀ x, charge (reg.fold x) = charge x
```

It carries three premises. The first is the fields `weak`, `strong`, `gravity` and `hyper`: there are *n* generations, and each of the four sums, taken over the first *k* of them, vanishes for every *k* up to *n*. The second is the field `charged`: the quark doublet of every generation carries hypercharge. The third is the fields `reg`, `charge` and `conserved`: there is a registration, and the charge of a state is a label that its fold keeps. No field of `Premises` states a charge, a ratio of charges, or the conclusion of any theorem. The charges are rational numbers. Section 9 states where the premises come from.

### 1.3 What is proved, what is cited, what is assumed

- **A table that closes has *l* =  − 3*q*, *e* =  − 6*q*, *u* + *d* = 2*q*, and is in one of three cases** · Standing: Proved, over every field of characteristic zero; Where: Appendix A, Part II
- **The three kinds of table close; a table closes exactly when it is one of them** · Standing: Proved; Where: Part II
- **A table that closes with its quark doublet charged is the observed one at that scale, or its renaming** · Standing: Proved; Where: Part II
- **Every multiple of a table that closes also closes** · Standing: Proved, over every field; Where: Part III
- **On the first sum alone the proton and the electron cancel, and the neutron and the neutrino** · Standing: Proved; Where: Part IV

The table continues with the unit, the generations, the labels and the premises.

- **On the observed table, if the right-handed up quark carries the charge of the up quark of the doublet, the scale is one sixth; the charges are then 2/3,  − 1/3, 0,  − 1, with the proton 1 and the neutron 0** · Standing: Proved; Where: Part IV
- **Sums that vanish at every threshold vanish term by term; a total can vanish while each part fails** · Standing: Proved; Where: Part V
- **A label is kept by the fold exactly when it takes one value on states with one registration; such a label is a function of the registration; a label that tells a state from its partner is not** · Standing: Proved, for every registration; Where: Part VI
- **On the premises: each generation closes and carries the table; its atom is neutral; the charge is a function of the registration; the premises are met** · Standing: Proved; Where: Part VII

What is not machine-checked is in the third table.

- **The four sums, with their weights, are the conditions for the four readings to be consistent** · Standing: Classical, entered: \[2, 3, 4, 5, 6\]; Where: Section 2
- **The sums vanish in each generation at every threshold, and not only in total** · Standing: Premise; Where: Sections 5, 9
- **The quark doublet of each generation carries hypercharge** · Standing: Premise; measured; Where: Section 3
- **Electric charge is the place in the doublet, plus or minus one half, plus the hypercharge, and for a right-handed field the hypercharge** · Standing: Classical definition, entered: \[1\]; Where: Section 4
- **A label the record carries is a charge that a field reads** · Standing: Reading, premise-grade; in a theory with gravity it is the absence of global symmetry \[10, 13\]; Where: Section 6
- **The measured values of the twin** · Standing: Entered from the literature \[11, 12, 14\]; numerical, not machine-checked; Where: Section 8

The paper claims as machine-checked the rows marked proved and no others. A row marked entered is a classical formula, a definition or a measured value; the theorems that use a formula are algebra on it. Part II, the reading, is outside these tables: it is premise-grade and is labelled so where it begins.

## 2. Tables and Sums as Algebra

A generation needs five numbers and four conditions on them. A point of a field and four polynomials are exactly this, and they are what the file of Appendix A formalises, in the kernel of Lean 4 \[16\] on the library Mathlib \[15\]. The structure `Table` holds the five hypercharges. The definitions `s1`, `s2`, `s3` and `s4` are the sums of Section 1.1, and `Closes` is their vanishing. The definitions `observed`, `renamed` and `idle` are the three kinds of table of the theorem.

The sums are taken left-handed less right-handed, each field counted with its multiplicity: three colours times two for the quark doublet, two for the lepton doublet, three for each right-handed quark, one for the right-handed electron. Each sum is the condition for one reading to be consistent: the weak field twice with the hypercharge once, the strong field twice with the hypercharge once, gravity twice with the hypercharge once, and the hypercharge three times. That is field theory \[2, 3, 4, 5, 6\], on the laws of the companion paper \[18\], and it is entered. The theorems are about the sums as written. A threshold is a number *k* of generations taken in order, the first *k* of them.

## 3. Closure Forces the Table

Nothing in this section is assumed. Each statement is a theorem of Appendix A.

**The three linear sums.** *S*₁ = 0 gives *l* =  − 3*q*. *S*₂ = 0 gives *u* + *d* = 2*q*. With them *S*₃ = 0 gives *e* =  − 6*q*.

**The cubic sum (`closure_forces_the_table`).** Putting these into *S*₄ leaves  − 18 *q* (*u*−4*q*)(*u*+2*q*) = 0. In a field of characteristic zero one of the three factors vanishes: *q* = 0; or *u* = 4*q*, and then *d* =  − 2*q*; or *u* =  − 2*q*, and then *d* = 4*q*.

**The converse (`the_observed_table_closes`, `the_renamed_table_closes`, `the_idle_table_closes`, `closes_iff`).** Each of the three kinds of table closes, for every value of its one free number. So a table closes exactly when it is one of them.

**A charged generation (`a_charged_generation_carries_the_table`).** If the quark doublet carries hypercharge, the first case is excluded, and the table is the observed one at the scale *q*, or its renaming. The two differ only in which right-handed quark is called up. In units of the quark doublet the table is (1,4,−2,−3,−6): the lepton charges follow from the quark charges.

**The first case.** A table (0,*u*,−*u*,0,0) closes for every *u*. It is a world whose doublets carry no hypercharge. The premise `charged` excludes it, and that premise is measured, not derived.

## 4. The Atom, and the Unit

Electric charge is the place in the doublet, plus or minus one half, plus the hypercharge, and for a right-handed field the hypercharge itself \[1\]. That is the classical definition and is entered as the definitions `upCharge`, `downCharge`, `neutrinoCharge`, `electronCharge`, `protonCharge` and `neutronCharge`.

**The atom is neutral (`the_atom_is_neutral`).** If *S*₁ = 0, the charge of the proton plus that of the electron is zero, and the charge of the neutron plus that of the neutrino is zero. Only the first sum is used, and no scale.

**No unit (`every_multiple_closes`).** If a table closes, every multiple of it closes. The four sums fix the ratios of the charges and not their unit.

**The unit from one charge (`the_unit_from_one_charge`, `the_observed_charges`).** On the observed table, if the right-handed up quark carries the electric charge of the up quark of the doublet, then *q* = 1/6. At that scale the charges of the up quark, the down quark, the neutrino and the electron are 2/3,  − 1/3, 0 and  − 1, the proton has 1 and the neutron 0, and each right-handed field carries the charge of its partner. The condition is that the two hands of a quark have one electric charge, as a quark with a mass has in the classical account; it is a hypothesis of the theorem and not a field of the premises.

## 5. Every Generation

**A total can hide a failure (`a_total_can_hide_a_failure`).** Two generations with lepton doublets of  − 2 and  − 4, in units where the quark doublet is one, each fail the first sum, by one unit in opposite directions, and their total satisfies it. Consistency in total does not force each generation.

**A threshold cannot (`partial_sums_zero`, `each_generation_closes`).** If each sum, taken over the first *k* generations, vanishes for every *k* up to *n*, it vanishes in each generation. This uses only that each sum is added over generations.

**On the premises (`charges_forced`).** Each generation closes, its quark doublet is charged, and so it carries the observed table at its own scale, or its renaming, with a neutral atom. Closure does not make the scales of the generations equal; that they are equal is measured.

The premise is that the sums vanish at every threshold. It is not a statement about scales of mass: the members of a generation do not share one mass, and the measured order of masses interleaves the generations \[14\]. It says that each generation is a complete copy of the reading and closes as one.

## 6. No Conserved Label Is Unread

A label is a value assigned to each state. A registration is a map whose values are shared exactly by a state and its partner under a fold, as in the structure `Registration`.

**Conserved exactly when read (`conserved_iff_read`).** A label has one value on every state and its partner exactly when it has one value on every two states with one registration.

**No conserved label is unread (`no_conserved_label_is_unread`, `the_side_is_unread`).** A label the fold keeps is a function of the registration. A label that tells some state from its partner is not.

**On the premises (`no_charge_is_unread`).** The charge is a label the fold keeps, so it is a function of the registration.

The reading is that a label the record carries is a charge that a field reads. With it, there is no conserved charge that no field reads. In a theory with gravity this is the statement that there is no global symmetry \[10, 13\]. The reading is premise-grade and is not a field. One consequence is not tested: the number of baryons is a label that no field reads, and on the reading it is not exactly conserved. No decay of the proton has been observed, and the statement stands open.

## 7. What Is Not Fixed

Three things are left open by the theorems, and each is stated. The unit of charge is not fixed by the four sums. The number of generations is not fixed: the count three is an input, and it agrees with the measured number of light neutrinos, 2.9963 ± 0.0074 \[12\]. And the first case of Section 3 is not excluded by closure: it is excluded by the measured fact that the quark doublets carry hypercharge.

## 8. The Numerical Twin

The twin of Appendix B does three things the kernel does not. It finds every solution in a box by search, it scans the statements on generations and labels, and it sets two consequences against measurement.

**The search.** Hypercharges are carried times six, as whole numbers. Of the 9765625 tables with charges from  − 12 to 12, 33 close: 25 in which the doublets carry no hypercharge, 4 that are the observed table at the scales  ± 1 and  ± 2, and 4 that are its renaming. No table outside the three cases closes.

**Generations and labels.** There are 18 pairs of generations in the scan that each fail the first sum while their total satisfies it. Of 2197 triples of values of a sum, one closes at every threshold, the triple of zeros. Of five labels on a grid of states, the fold keeps exactly the three that do not read the side, and a label is kept by the fold exactly when it takes one value on states with one registration.

**The measurements.** The inputs are measured and are printed in Appendix B.

- **Charge of the neutron, in units of the electron’s** · Forced: 0; Measured: (−0.2±0.8) × 10⁻²¹ \[14\]
- **Sum of the charges of the proton and the electron** · Forced: 0; Measured: below 10⁻²¹ in magnitude \[11\]

Nine checks pass and none fails. Three limits are stated. A search of a box is not a proof outside the box; the classification is the theorem of Section 3. The number of light neutrinos is printed as a reading and is not counted. And every row is a retrodiction: each measurement stood before this work.

## 9. Discussion: The Reading

The derivation above uses only algebra. This section states the reading from which the premises come, and marks what in it is theorem and what is premise.

**Why the sums vanish.** In the reading of Part II nothing escapes the record \[17\]. A reading of a field that did not close would lose what it registered: a charge would be counted by one reading and not returned by another. That is the first premise, the fields `weak`, `strong`, `gravity` and `hyper`. In field theory the same four conditions are the cancellation of anomalies, and they are needed for the theory to be consistent. The premise is physics and is not a theorem of this paper. What the paper proves is what it forces: the whole table from the charge of one doublet.

**Why every threshold.** Field theory asks that the sums vanish in total. The reading asks more: that each generation, as a complete copy of the reading, closes as one. That is why the premise is stated at every threshold, and Section 5 shows that the weaker premise would not force the table.

**What the paper does not claim.** It does not derive the four sums from the laws of the fields, the unit of charge, or the number of generations. It does not claim that the classification of the tables that close was unknown \[7, 8, 9\]. It does not claim that the number of baryons is not conserved; that is a consequence of a reading and is open. It claims that every table on which the four sums vanish is found, with the converse, that the atom is neutral on the first sum alone, that closure at every threshold forces each generation, and that each statement of Section 1.3 marked proved compiles. No theorem of Sections 2 to 8 depends on Part II.

## 10. Predictions, Falsifiers, and What Stands

The paper recovers the charges of a generation. It predicts no measurement that the standard table does not and derives no constant. Its commitments are those of the forced table, and they are stated here as commitments: three that the paper says will stand at any future precision, two proposals it says will fail, and the three observations that would refute it.

### 10.1 Three predictions that will stand

1.  **The neutron is neutral.** `the_observed_charges` gives zero. The measured charge is (−0.2±0.8) × 10⁻²¹ of the electron’s \[14\]. The prediction is that it stays at zero.
2.  **The proton and the electron cancel.** `the_atom_is_neutral` gives it. The measured sum is below 10⁻²¹ \[11\]. The prediction is that it stays at zero.
3.  **A further generation, if one is found, is complete.** `charges_forced` gives each generation the whole table. The prediction is that no charged quark doublet is found without its lepton doublet and right-handed electron in the ratios  − 3 and  − 6.

### 10.2 Two proposals that will fail

1.  **A generation of quarks without leptons, or of leptons without quarks.** `closure_forces_the_table` leaves no such table with a charged doublet. The paper predicts that every such proposal either fails a sum or adds fields that restore it.
2.  **Matter with a small net charge.** `the_atom_is_neutral` gives exact cancellation at every scale. The paper predicts that every proposal in which the proton and the electron fail to cancel by a small amount gives up the first sum.

### 10.3 The three falsifiers

Each is a forbidden observation. No observation breaks a theorem; each refutes a premise, and each names the theorem that carries the consequence. The threshold in each case is five of the experiment’s printed uncertainties.

1.  **A neutron with a charge.** It refutes the fields of the four sums, through `charges_forced` and `the_observed_charges`.
2.  **A proton and an electron that do not cancel.** It refutes the field `weak`, through `the_atom_is_neutral`.
3.  **A generation whose charges are not in the ratios of the table.** It refutes the fields of the four sums at that threshold, through `charges_forced`.

Apart from them stands the formal claim, which no observation touches and one compilation settles: every theorem named in this text prints its axioms in Appendix D, and a line that names an axiom other than `propext`, `Classical.choice` and `Quot.sound`, or a file that fails to compile under Lean 4.19.0 and Mathlib 4.19.0, refutes the claim that the statements are proved.

### 10.4 What kind of result this is

It is not a new physics. It is a change in how a known classification can be checked. That four sums fix the charges of a generation is here a single file whose every step the kernel has verified, whose every assumption is one field of one structure, and whose consequences are set against measurement. A reader who doubts a step can name the line.

The implication from `Premises` to the table of each generation and to the neutral atom is checked by the Lean kernel. No experiment and no later revision of physics alters an implication. Experiment remains free to test whether nature satisfies the premises, and that is all it can test here. What the kernel certifies is the Lean statements; that the definitions of the file say what this text says they say is for the reader to check, and the structure `Premises` is printed for that purpose. What stands is the tables of Section 1.3.

## 11. Part II · The Reading

*This part is the reading from which the paper takes its place in the series. It is premise-grade. It is not among the machine-checked claims of Section 1.3, and no theorem of Sections 2 to 8 depends on it. The seat it names, and the statements it rests on, are those of Nothing Escapes, Least Erasure (Islam, 2026a), where they are proved in their own domain.*

### 11.1 The Record Closes, in Every Copy

The series reads physics on one seat: a reflection of the plane, the line it fixes, and a registration that keeps the height of a point and forgets its side. One statement proved there in its own domain is that nothing escapes the record: what is registered is not lost.

The companion paper on the nuclear forces forces the laws of the strong and the weak field (Islam, 2026d). This paper asks what charges matter can carry under those laws, and the reading gives the question a form. A charge is what a field reads. If the readings of the fields did not close, a charge would be registered by one reading and lost to another, and the record would not hold. Closure of the record is then four sums, one for each way the fields can read the hypercharge, and the theorem of Section 3 finds every table on which they vanish.

The reading asks closure of each generation and not only of the total. A generation is a complete copy of the reading: its own quarks and its own leptons, read by the same fields. A copy that closed only with the help of another would be a copy in which something escaped until the other arrived. That is why the premise is stated at every threshold. Section 5 shows the difference is real: totals can hide a failure, and thresholds cannot.

The answer has one bit and one magnitude. The bit is whether the quark doublet carries hypercharge at all. If it does, everything else follows in fixed ratios, and the leptons are not an independent family: their charges are forced by the quarks they stand beside. The magnitude is the unit, which the sums do not see, as the companion paper on the coupling proves for the strength of the force.

### 11.2 What the Reading Adds, and What It Does Not

The reading adds two identifications to the theorems. The first is that the four sums are the closure of the record; the paper writes it as the first four fields of the structure. The second is that a label the record carries is a charge that a field reads; it is stated in Section 6 and is not a field. Neither is a theorem of this paper.

The second has a consequence the paper does not test. A conserved label that no field reads would be a label the record does not carry, and Section 6 proves there is none among the labels the fold keeps. The number of baryons is read by no field. On the reading it is not exactly conserved. No decay of the proton has been seen, and the consequence stands open.

The reading does not add the unit of charge or the number of generations. Both are measured.

One falsifier belongs to the reading and stands beside the three of Section 10.3: a charge that is exactly conserved and that no field reads. The present bounds on the decay of the proton do not settle it.

## 12. Closure

The forcing of the charges of matter is no longer informal prose. From five numbers in a field and four polynomials in them, and nothing more, Lean 4 with Mathlib compiles the three linear relations, the factoring of the cubic, the three kinds of table that close and the proof that there is no other, the neutral atom on the first sum alone, the freedom of the unit, the unit of one sixth from one electric charge, the generations that each close when the sums vanish at every threshold, and the label that a fold keeps as a function of the registration. No axiom is declared. No proof is left open. No headline theorem closes by its own hypothesis or over a structure that carries its conclusion.

The table of a generation is recovered from the charge of one doublet: the lepton doublet at minus three times the quark doublet, the right-handed electron at minus six, the right-handed quarks at four and minus two. The lepton charges follow from the quark charges, and the atom is neutral whatever the unit. The numerical twin searches all 9765625 tables with whole charges from minus twelve to twelve and finds 33 that close, each in one of the three cases, and sets two consequences against measurement: the neutron and the hydrogen atom are neutral to parts in ten to the twenty-one.

Every boundary is in plain sight. That the four sums vanish at every threshold is four fields of one printed structure, and that each quark doublet is charged is a fifth. That the four sums are the conditions of field theory is classical, entered. That electric charge is the place in the doublet plus the hypercharge is the classical definition, entered. That a label the record carries is a charge a field reads is a reading, premise-grade, and its consequence for the number of baryons is open. The unit of charge and the number of generations are not derived, here or anywhere in the paper.

That structure is not an arbitrary postulate. The two statements the reading rests on, Existence and Least Erasure, are theorems in their own domain: each has its own compiled Lean file, with no axiom declared, listed in the Lean Library Reference. There they are proved. The Heat Bridge, which joins erasure to heat, is a theorem there as well; the bridge spoken of below is a different one, from that domain to physics. Here they are used, and the difference is stated. Between that domain and the charges of a generation lies a physical bridge: that nothing escapes the record, read on the charges as the closure of every reading in every copy. This paper does not claim the bridge as a theorem. It writes the bridge down as `Premises`, so that the engine imports nothing outside Mathlib and can be checked alone, and so that a reader can see exactly which sentence carries the physics.

Two things are therefore separate, and the paper keeps them separate. Inside the kernel, the implication from `Premises` to the table of every generation is a mathematical certainty. No experiment, no consensus and no later revision of physics alters it, and anyone can recheck it with one compilation. Outside the kernel stand three falsifiers. They test whether nature satisfies the premises, and so far nature does. What survives both is not opinion. It is a theorem, and a physics that has met every test of its premises.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author’s. The Lean file and the Fortran twin are written by a language model under the author’s direct supervision. Every theorem named in the text of Sections 1 to 10 and 12 is in Appendix A under that name, and its kernel line is printed in Appendix D. Classical results that are cited and not formalised are named as such in Section 1.3 and wherever they are used. No constant of nature is derived anywhere in this paper; the numbers of the twin are found by search and computed from measured inputs, which Appendix B prints.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1.  S. Weinberg, Phys. Rev. Lett. 19 (1967) 1264.
2.  S. L. Adler, Phys. Rev. 177 (1969) 2426.
3.  J. S. Bell and R. Jackiw, Nuovo Cimento A 60 (1969) 47.
4.  C. Bouchiat, J. Iliopoulos and Ph. Meyer, Phys. Lett. B 38 (1972) 519.
5.  D. J. Gross and R. Jackiw, Phys. Rev. D 6 (1972) 477.
6.  L. Alvarez-Gaumé and E. Witten, Nucl. Phys. B 234 (1984) 269.
7.  C. Q. Geng and R. E. Marshak, Phys. Rev. D 39 (1989) 693.
8.  K. S. Babu and R. N. Mohapatra, Phys. Rev. Lett. 63 (1989) 938.
9.  J. A. Minahan, P. Ramond and R. C. Warner, Phys. Rev. D 41 (1990) 715.
10. T. Banks and N. Seiberg, Phys. Rev. D 83 (2011) 084019.
11. G. Bressi et al., Phys. Rev. A 83 (2011) 052101.
12. P. Janot and S. Jadach, Phys. Lett. B 803 (2020) 135319.
13. D. Harlow and H. Ooguri, Commun. Math. Phys. 383 (2021) 1669.
14. S. Navas et al. (Particle Data Group), Phys. Rev. D 110 (2024) 030001.
15. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
16. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
17. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
18. M. F. Islam, The Nuclear Forces as a New Mathematical Theorem, edition 2.0.0 (2026d).

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

**Appendix A · SPHYS_Charge_Closure_CC.lean.** Lean 4.19.0 with Mathlib 4.19.0. 18 theorems, no axiom declared, no `sorry`, exit 0 with no warning. The kernel lines are Appendix D. *[a printed file, 339 lines, in the master and in the Journal edition]*

**Appendix B · Charge_Closure_Twin_CC.f90.** Nine checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix C. *[a printed file, 162 lines, in the master and in the Journal edition]*

**Appendix C · Run of Appendix B.** ```text
  tables searched: 25**5 = 9765625
  tables that close: 33; doublets without hypercharge: 25; the observed table at some scale: 4; the same with the right-handed quarks renamed: 4
  PASS  A1 every table in the box that closes is one of the three cases of the engine
  PASS  A2 the observed table closes at every scale the box holds, and so does the renamed one
  pairs of generations that fail singly and close in total: 18
  PASS  B  there are pairs of generations that each fail a condition while their total satisfies it
  triples tried: 2197; triples that close at every threshold: 1
  PASS  C  a sum that closes with one, with two and with three generations closes in each
  PASS  D1 of five labels, the fold keeps exactly the three that do not read the side
  PASS  D2 a label is kept by the fold exactly when it takes one value on states with one registration
  PASS  D3 the label x tells a state from its partner and is not a function of the registration
  charges times 6 on the forced table: proton 6, neutron 0, electron -6
  PASS  E1 the neutron of the forced table is neutral: measured (-0.2 +- 0.8)e-21 (Navas et al. 2024)
  PASS  E2 the proton and the electron of the forced table cancel: measured below 1e-21 (Bressi et al. 2011)
  reading: the number of light neutrinos is 2.9963 +- 0.0074 (Janot and Jadach 2020); the count three is an input
 BATTERY-JSON: {"checks":9,"failures":0} *[a printed file, 16 lines, in the master and in the Journal edition]*

**Appendix D · Kernel lines of Appendix A.** Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own. *[a printed file, 19 lines, in the master and in the Journal edition]*
