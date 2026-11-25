# Quantum Correlation as a New Mathematical Theorem

## No Signal Forced by the Registration, Bell’s Bound as the Whole Reach of Local Records, and the Outcome as One Keyed Bit

**Mohammad F. Islam PhD** · 25 November 2026

*Blog edition of the master, edition 2.0.0 of 25 November 2026. It renders the whole text. The printed files of the appendices stand in the master and in the Journal edition, and are listed at the end.*

## Abstract

This paper proves, in Lean 4 with Mathlib, three statements about the records of two separated parties, and proves that one printed structure carries all three. A record is a linear functional on a ring of readings. A reading is an element of that ring whose square is one. Nothing else is assumed: no state space, no wave function and no rule for which outcome occurs. First, no signal: if the far party performs any complete operation with elements that commute with a near element, the near record of that element does not move, and between the readings of the premises this needs no further hypothesis. Second, the reach of local records: a table of four answers gives a correlation of plus or minus two, every weighted family of tables stays within two, and every value within two is reached by a family of two tables, so Bell’s bound is the whole reach of local records and not only a limit on it. Third, the reach of the quantum: for four readings, two near and two far, the square of the correlation is four less the product of the commutator of the near pair with the commutator of the far pair; eight less 2\[2\]^(1/2) times the correlation is a sum of two squares; and so every record that is not negative on squares holds the correlation between  − 2\[2\]^(1/2) and 2\[2\]^(1/2). The bound is Tsirelson’s and the identity of the square is Landau’s; here both compile, for every ring and every such record. If the two near readings commute, the record stays within two, so a record above two forces each party to hold two readings that do not commute. The premises are met twice. A weighted family of tables is a member whose readings all commute, and it stays within two. A pair of matrices of size four is a member whose record of the correlation is 2\[2\]^(1/2) exactly, with every relation proved. Read along one axis by both parties, that pair gives outcomes that never agree, each of them one half alone: one bit, fair in either record and fixed by the other. A Fortran twin executes the identities on one hundred thousand random records and settings, and sets two rivals against four published experiments: local records, whose bound of two is passed by all four and by more than five uncertainties in three, and no signal alone, whose value of four none approaches. That the pairs of nature are the pair of the model is read from experiment, and that a local account is a weighted family of tables is cited; both are named where they are used. Every premise of the paper is one field of one printed structure. Part II carries the reading of entanglement from which the paper takes its place in the series, at premise grade and apart from the machine-checked claims.

## 1. The Theorem and What It Rests On

### 1.1 The statement

Let *A*₀, *A*₁ be two readings of a near party and *B*₀, *B*₁ two readings of a far party: elements of a ring, each of square one, with every near reading commuting with every far reading. Their correlation is

*S* = *A*₀*B*₀ + *A*₀*B*₁ + *A*₁*B*₀ − *A*₁*B*₁.

A record is a linear map *φ* from the ring to the real numbers with *φ*(1) = 1 and *φ*(*X*^(\)*X*) ≥ 0 for every *X*.

**Theorem (`no_signal_forced`).** Let *E* be an element of the near party and let the far party act by finitely many elements *K*_b with companions *L*_b, each *K*_b commuting with *E*, and ∑_b*L*_b*K*_b = 1. Then ∑_b*φ*(*L*_b*E**K*_b) = *φ*(*E*). On the premises below, with *E* either near reading and the far party reading either of its own, the hypotheses hold and the conclusion follows from the fields alone (`no_signal_on_the_premises`).

**Theorem (`local_records_stay_within_two`, `every_value_within_two_is_reached`).** A weighted family of tables of four answers, each answer plus or minus one, has a correlation between  − 2 and 2, and every value between  − 2 and 2 is the correlation of such a family.

**Theorem (`reach_forced`).** On the premises below,  − 2\[2\]^(1/2) ≤ *φ*(*S*) ≤ 2\[2\]^(1/2).

**Theorem (`commuting_readings_stay_within_two`, `commuting_far_readings_stay_within_two`).** On the premises below, if *A*₀*A*₁ = *A*₁*A*₀, or if *B*₀*B*₁ = *B*₁*B*₀, then  − 2 ≤ *φ*(*S*) ≤ 2.

**Theorem (`the_bound_is_reached`).** The premises have a member with *φ*(*S*) = 2\[2\]^(1/2), and its two near readings do not commute.

The local bound is Bell’s \[1\], in the form of Clauser, Horne, Shimony and Holt \[2\]. The bound of the quantum is Tsirelson’s \[3\], and the identity from which Section 5 starts is Landau’s \[15\]. The premises are met: `quantumPremises` constructs a term of the structure from matrices of size four over the real numbers, and `localPremises` constructs one from any weighted family of tables.

### 1.2 The premises, printed

The physical premises of the paper are the fields of this structure of the Lean file, and there are no others. What is cited is in the tables of Section 1.3.

``` lean
structure Premises (R : Type*) [Ring R] [StarRing R] [Algebra ℝ R] [StarModule ℝ R] where
  A0 : R
  A1 : R
  B0 : R
  B1 : R
  square_one : ∀ x ∈ [A0, A1, B0, B1], x * x = 1
  own_star : ∀ x ∈ [A0, A1, B0, B1], star x = x
  separate : ∀ a ∈ [A0, A1], ∀ b ∈ [B0, B1], b * a = a * b
  record : R →ₗ[ℝ] ℝ
  whole : record 1 = 1
  positive : ∀ X, 0 ≤ record (star X * X)
```

It carries three premises. The first is that a reading has two outcomes: the fields `square_one` and `own_star` say each of the four readings squares to one and is its own star. The second is separation, the field `separate`: a reading of one party commutes with a reading of the other. The third is the registration, the fields `record`, `whole` and `positive`: what is registered is linear in the readings, gives one on the reading that is always one, and is not negative on any *X*^(\)*X*. No field of `Premises` states a bound, a commutator of two readings of one party, a space of states, a vector, or the conclusion of any theorem. The ring is any ring with a star over the real numbers; matrices over the complex numbers are one. Section 9 states where the premises come from.

### 1.3 What is proved, what is cited, what is assumed

- **A complete far reading, and a complete far operation that commutes with the near reading, leave the near record** · Standing: Proved, for every additive record on every ring; Where: Appendix A, Part I
- **A table gives plus or minus two; a weighted family of tables stays within two; every value within two is reached** · Standing: Proved, over every ordered field; Where: Part II
- **The square of the correlation is four less the product of the two commutators** · Standing: Proved, in every ring; Where: Part III
- **Readings of one party that commute give a square of four; readings that anticommute on both sides give a square *Q* with *Q*(*Q*−8) = 0** · Standing: Proved, in every ring; Where: Part III
- **Eight less 2*r* times the correlation is a sum of two squares when *r*² = 2** · Standing: Proved, in every algebra over an ordered field; Where: Part III

The table continues with the bound, the model and the premises.

- **A record not negative on the two squares holds the correlation at or below 2*r** · Standing: Proved; Where: Part III
- **The square of a record is at most the record of the square** · Standing: Proved, for records as in Section 1.1; Where: Part III-b
- **Four matrices of size four are readings, near commuting with far, each pair of one party anticommuting; their correlation carries the pair to 4*s* times itself, where 2*s*² = 1** · Standing: Proved, over every commutative ring with such an *s*; Where: Part IV
- **The pair read along one axis by both parties: the outcomes never agree, and each alone is one half** · Standing: Proved, over the same rings; Where: Part IV
- **On the premises: no signal between the readings, the correlation within 2\[2\]^(1/2), within two when the readings of one party commute, and above two only when neither party’s do; the premises are met by a local member and by a member that reaches 2\[2\]^(1/2)** · Standing: Proved; Where: Part V

What is not machine-checked is in the third table.

- **Readings of separated parties commute** · Standing: Premise; Where: Sections 3, 9
- **What is registered is a linear record, not negative on squares** · Standing: Premise; the rule of Born \[9\] is its usual form; Where: Section 9
- **A local account, in which the answers are fixed in advance or drawn by chance from a shared source, is a weighted family of tables** · Standing: Cited: \[14\]; the theorem here covers finite families; Where: Section 4
- **The pairs of nature are the pair of the model** · Standing: Read from experiment: \[4, 6, 7, 8\]; Where: Sections 6, 8
- **A table of chances with no signal and no readings reaches four** · Standing: Cited: \[5\]; executed by the twin, not machine-checked; Where: Section 8
- **The measured values of the twin** · Standing: Entered from the literature \[4, 6, 7, 8\]; numerical, not machine-checked; Where: Section 8

The paper claims as machine-checked the rows marked proved and no others. A row marked cited is a result with a published proof that this work has not machine-checked. A row marked entered is a measured value used by the numerical twin alone; no theorem rests on it. Part II, the reading, is outside these tables: it is premise-grade and is labelled so where it begins.

## 2. Records and Readings as Algebra

Two parties need readings that can be multiplied and added, and a record that assigns a number to each. A ring and a linear map on it are exactly this, and they are what the file of Appendix A formalises, in the kernel of Lean 4 \[17\] on the library Mathlib \[16\]. Working at this level has a cost and a gain. The cost is that no space of states, no time and no dynamics is constructed. The gain is that every theorem holds in every ring, the matrices over the complex numbers included, and for every record, so nothing proved in Sections 3 and 5 is special to a size, a state or a pair of settings.

Three terms are fixed here. A reading is an element of the ring whose square is one; it has two outcomes, and with a half among the constants they are the elements (1+*A*)/2 and (1−*A*)/2, written `out` in the file. A family of outcomes is complete when it sums to one; the two outcomes of a reading are complete (`out_complete`) and each is its own square (`out_square`). An operation is a finite family of elements *K*_b with companions *L*_b, complete when ∑_b*L*_b*K*_b = 1. The definitions `chsh` and `corr` are the correlation of four answers and of four readings, and `rec` is the record of the model of Section 6.

## 3. No Signal

Nothing in this section is assumed beyond what each theorem states. Each statement is a theorem of Appendix A.

**A far reading (`no_signal_from_a_far_reading`).** Let *φ* be an additive record, *E* a near element and *M*_b a complete family of far outcomes. Then ∑_b*φ*(*E**M*_b) = *φ*(*E*). The near record summed over the far outcomes is the near record, whatever the far reading is.

**No far choice is read (`the_near_record_reads_no_far_choice`).** For two complete families of far outcomes *M* and *M*′ the two sums are equal. The near party cannot tell which the far party chose.

**A far operation (`no_signal_from_a_far_operation`).** Let the far party act by elements *K*_b with companions *L*_b, complete in the sense that ∑_b*L*_b*K*_b = 1, and let each *K*_b commute with *E*. Then ∑_b*φ*(*L*_b*E**K*_b) = *φ*(*E*). With *L*_b = *K*_b^(\) this is the general operation of the quantum theory; the theorem asks less.

**On the premises (`no_signal_forced`, `no_signal_on_the_premises`).** The record of the premises is linear, so the same holds for it. And between the readings of the premises nothing more is asked: let the far party read either of its two readings, with either outcome registered, so that its operation is the two outcomes of that reading. They are complete, and they commute with each near reading by the field `separate`. The near record of either near reading, summed over the two far outcomes, is what it was. No signal is forced by the registration: by the additivity of the record, the completeness of the far operation, and the commuting of far with near. That no signal follows from the trace over the far system is classical \[13\]; here it compiles in every ring.

## 4. Local Records

**A table (`table_is_plus_or_minus_two`).** Let each of the four answers *a*₀, *a*₁, *b*₀, *b*₁ be plus or minus one. Then *a*₀*b*₀ + *a*₀*b*₁ + *a*₁*b*₀ − *a*₁*b*₁ is plus two or minus two. There are sixteen tables.

**A weighted family (`local_records_stay_within_two`).** Let finitely many tables carry weights that are not negative and sum to one. The correlation of the family lies between  − 2 and 2. This is Bell’s bound \[1, 2\].

**The whole reach (`every_value_within_two_is_reached`).** For every *s* between  − 2 and 2, the two tables with correlations 2 and  − 2, with weights (2+*s*)/4 and (2−*s*)/4, have correlation *s*. The bound is therefore not only a limit: the correlations of local records are exactly the interval from  − 2 to 2.

**What a local account is.** An account in which each party’s answer is fixed by its own setting and a shared source, with chance allowed in the source and in each party, has the same correlations as a weighted family of tables. That is Fine’s theorem \[14\], which is cited and not formalised; the theorems of this section cover finite families.

## 5. Four Readings

**The square of the correlation (`square_of_the_correlation`).** For four readings as in Section 1.1, in any ring,

*S*² = 4 − (*A*₀*A*₁−*A*₁*A*₀)(*B*₀*B*₁−*B*₁*B*₀).

**Readings that commute (`commuting_readings_give_four`).** If the two near readings commute, *S*² = 4: the value of a table. **Readings that anticommute (`anticommuting_readings_give_zero_or_eight`).** If the near pair anticommutes and the far pair anticommutes, *Q* = *S*² obeys *Q*(*Q*−8) = 0.

**A sum of two squares (`sum_of_two_squares`).** Let *r* be a constant with *r*² = 2. Then, by the decomposition that is the usual proof of Tsirelson’s bound \[3\],

8 − 2*r* *S* = (*r**A*₀ − (*B*₀+*B*₁))² + (*r**A*₁ − (*B*₀−*B*₁))².

**The reach (`quantum_reach`, `reach_forced`).** A linear record with *φ*(1) = 1 that is not negative on those two squares has *φ*(*S*) ≤ 2*r*. On the premises the two elements are their own stars, so the record is not negative on their squares, and with *r* = \[2\]^(1/2) the correlation is at most 2\[2\]^(1/2). Turning the signs of the two far readings gives the same bound from below. Hence `square_at_most_eight`: the square of the record of the correlation is at most eight. No state is named and no size: the bound holds for every record of every ring.

**Within two when the near readings commute (`record_squared_le`, `commuting_readings_stay_within_two`).** For a record of the premises and an element that is its own star, the square of the record is at most the record of the square. The correlation is its own star (`S_own_star`), and its square is four when the near readings commute. So the record lies between  − 2 and 2. The same holds when it is the two far readings that commute (`commuting_far_readings_stay_within_two`). **Passing two (`passing_two_forces_readings_that_do_not_commute`, `passing_two_forces_both_parties`).** A record of the correlation above two forces *A*₀*A*₁ ≠ *A*₁*A*₀. The premises with the two parties exchanged are premises with the same correlation (`swap`, `swap_S`), so it forces *B*₀*B*₁ ≠ *B*₁*B*₀ as well. What a table cannot hold is two readings of one party that do not commute, and above two each party holds such a pair.

## 6. The Pair

The question of this section is that of Einstein, Podolsky and Rosen \[10\]. The name entanglement is Schrödinger’s \[11\], and the pair of two half-spins is Bohm’s form of the question \[12\].

**The readings of the model (`model_readings`).** Over any commutative ring with an element *s* such that 2*s*² = 1, the file writes matrices of size four: the near readings `nZ` and `nX`, and the far readings `mB0` and `mB1`, which are  − *s* times the sum and the difference of the two far axes. It proves that each of the four squares to one, that near commutes with far, and that each party’s two readings anticommute.

**The model reaches the bound (`model_reaches`).** The correlation of these readings carries the vector `pair`, which is near up and far down less near down and far up, to 4*s* times itself. The record `rec` of the pair on the correlation is 4*s*, and (4*s*)² = 8.

**The outcome (`outcomes_are_complete`, `model_outcomes`).** Let both parties read along the first axis. The outcomes up and down of each party are complete readings. The record of up with up is zero and of down with down is zero; the record of up with down is one half, and of down with up one half; and the record of each party’s own outcome is one half. So the outcome of either party is fair in its own record and is fixed once the other’s is read. This paper calls that one keyed bit: a yes or no that neither record holds alone and that the two hold together. The theorem does not say which outcome occurs, and nothing in the paper does.

## 7. One Structure, Two Members

**The local member (`localPremises`, `local_member_stays_within_two`).** A weighted family of tables is a member of `Premises`: the ring is the ring of real functions on the tables, the readings are the four columns of answers, and the record is the weighted sum. All its readings commute. Its record of the correlation is the correlation of the family, and it lies within two by `commuting_readings_stay_within_two`: Bell’s bound is reached a second way, from inside the premises.

**The member that reaches (`quantumPremises`, `rec_positive`, `the_bound_is_reached`).** The pair of Section 6, over the real numbers with *s* = \[2\]^(1/2)/2, is a member: its record is not negative on any *X*^(\)*X*, being *s*² times a sum of four squares. Its record of the correlation is 2\[2\]^(1/2), and its near readings do not commute.

The two members differ in one thing. In the first, the two readings of each party commute, and the record stays within two. In the second they do not, and the record reaches 2\[2\]^(1/2), which no member passes. The premises do not choose between them. Experiment does.

## 8. The Numerical Twin

The twin of Appendix B does three things the kernel does not. It executes the identities independently in floating point, it searches random records and settings for what the theorems forbid, and it sets two rival bounds against published measurements.

**The registration.** On one hundred thousand random records, each a random positive matrix of trace one, with random near readings and far settings, the near record does not move under a complete far reading or under a far operation of three branches; the largest change is at the level of rounding.

**Local records.** All sixteen tables give plus or minus two, one hundred thousand random weighted families stay within two, and every value from  − 2 to 2 in steps of 0.01 is reached by two tables.

**Four readings.** On one hundred thousand random settings the identity of the square, the sum of two squares, and the square of zero or eight at right angles hold to rounding. The largest record of the correlation found is 2.209971 over random records and 2.826945 for the pair, against 2\[2\]^(1/2) = 2.828427. With the two near readings made to commute, the largest record is 1.968892. The pair at the settings of the engine gives 2.828427. Read along one thousand random common axes, the two outcomes of the pair never agree and each alone is one half.

**The measurements.** The inputs are measured and are printed in Appendix B.

- **Aspect, Grangier and Roger, 1982 \[4\]** · Measured correlation: 2.697 ± 0.015; Above two, in uncertainties: 46.5; Below four, in uncertainties: 86.9
- **Weihs et al., 1998 \[6\]** · Measured correlation: 2.73 ± 0.02; Above two, in uncertainties: 36.5; Below four, in uncertainties: 63.5
- **Hensen et al., 2015 \[7\]** · Measured correlation: 2.42 ± 0.20; Above two, in uncertainties: 2.1; Below four, in uncertainties: 7.9
- **Storz et al., 2023 \[8\]** · Measured correlation: 2.0747 ± 0.0033; Above two, in uncertainties: 22.6; Below four, in uncertainties: 583.4

Two rivals stand beside the theorem. The first is local records, with the bound two. The second keeps no signal and drops the readings: a table of chances in which the outcomes agree unless both settings are the second, which signals nothing and gives a correlation of four \[5\]; the twin builds it and checks both. All four measurements lie above two and none above 2\[2\]^(1/2). Three of them exclude the first rival by more than five of their uncertainties, one of those three free of loopholes \[8\]; all four exclude the value of the second by more than five.

Sixteen checks pass and none fails. Three limits are stated. The experiment of 2015 lies above two by 2.1 of its uncertainties on this simple measure, and is not counted among the three. The search over settings covers readings in one plane; the theorem covers every reading of square one. And the twin tests bounds against two rivals and against measurement. It is not a new prediction: the violation of the local bound and the bound of the quantum were known.

## 9. Discussion: The Reading

The derivation above uses only algebra. This section states the reading from which the premises come, and marks what in it is theorem and what is premise.

**Why a record.** In the reading of Part II what exists is what is registered, and a registration adds: the record of two readings together is the sum of their records. That is the field `record` with `whole` and `positive`. The premise is physics and is not a theorem of this paper; in the quantum theory it is the rule of Born \[9\]. What the paper proves is what the premise forces: no signal, and a correlation within 2\[2\]^(1/2).

**Why separation is commuting.** In the reading two parties are separate when the reading of one does not disturb the record of the other, and in a ring that is the statement that their readings commute. That is the field `separate`. What the paper proves is that separation between the parties is enough for no signal, and that it leaves each party free to hold two readings that do not commute with each other.

**Where the correlation lives.** In the model each party’s own record is one half at every reading, and the two outcomes never agree. The correlation is in neither record alone. It is in the record of the two together, which is the claim the series carries under the name of the joint registration, and here it is the theorem `model_outcomes`.

**What the paper does not claim.** It does not derive which outcome occurs, and it does not derive the rule of Born. It does not prove that a local account must be a family of tables; that is cited. It does not claim that the violation of Bell’s bound or the bound of Tsirelson was unknown or untested. It claims that no signal is forced by the registration, that the local reach is exactly two, that the bound of the quantum is 2\[2\]^(1/2) and is attained, on premises printed in one structure, that passing two forces each party to hold readings that do not commute, and that each statement of Section 1.3 marked proved compiles. The fuller account of the reading, entanglement on the seat, is Part II, Section 11, carried from \[18\]. No theorem of Sections 2 to 8 depends on it.

## 10. Predictions, Falsifiers, and What Stands

The paper recovers no signal, Bell’s bound and Tsirelson’s bound. It predicts no measurement that the quantum theory does not and derives no constant. Its commitments are those of the premises, and they are stated here as commitments: three that the paper says will stand at any future precision, two proposals it says will fail, and the three observations that would refute it.

### 10.1 Three predictions that will stand

1.  **No signal.** `no_signal_on_the_premises` gives equality between the readings, and `no_signal_forced` for every far operation that commutes with the near element. The prediction is that no choice of a far reading or a far operation changes the record of a near reading, at any distance and any precision.
2.  **No correlation above 2\[2\]^(1/2).** `reach_forced` gives the bound. The four measurements of Section 8 lie at or below it. The prediction is that no experiment on two-valued readings of two separated parties finds more.
3.  **Above two, the readings of each party do not commute.** `passing_two_forces_both_parties` gives it. The prediction is that every experiment that passes two uses, for each party, two readings that cannot be made together.

### 10.2 Two proposals that will fail

1.  **A local account of the measured correlations.** `local_records_stay_within_two` leaves it at two, and three of the four measurements pass two by more than five uncertainties. The paper predicts that every such account either gives up the measured values or is not a family of tables under another name.
2.  **A correlation of four from separated readings.** No signal alone allows it \[5\]; `reach_forced` does not. The paper predicts that no pair of separated two-valued readings reaches it, and that every device that does carries a signal or is not separate.

### 10.3 The three falsifiers

Each is a forbidden observation. No observation breaks a theorem; each refutes a premise, or the premises as the law of nature, and each names the theorem that carries the consequence. The threshold in each case is five of the experiment’s printed uncertainties.

1.  **A near record that changes with the far choice.** It refutes the field `separate` or the field `record`, through `no_signal_on_the_premises`.
2.  **A correlation above 2\[2\]^(1/2).** It refutes one of the fields `square_one`, `separate` and `positive`, through `reach_forced`.
3.  **A correlation above two between parties whose two readings can each be made together.** It refutes the same fields through `commuting_readings_stay_within_two`.

Apart from them stands the formal claim, which no observation touches and one compilation settles: every theorem named in this text prints its axioms in Appendix D, and a line that names an axiom other than `propext`, `Classical.choice` and `Quot.sound`, or a file that fails to compile under Lean 4.19.0 and Mathlib 4.19.0, refutes the claim that the statements are proved.

### 10.4 What kind of result this is

It is not a new physics. It is a change in how a physical derivation can be checked. No signal, the local bound and the bound of the quantum are here a single file whose every step the kernel has verified, whose every assumption is one field of one structure, and whose bounds are set against measurement. A reader who doubts a step can name the line.

The implication from `Premises` to no signal, to the bound of 2\[2\]^(1/2) and to the bound of two for readings that commute is checked by the Lean kernel. No experiment and no later revision of physics alters an implication. Experiment remains free to test whether nature satisfies the premises, and that is all it can test here. What the kernel certifies is the Lean statements; that the definitions of the file say what this text says they say is for the reader to check, and the structure `Premises` is printed for that purpose. What stands is the tables of Section 1.3.

## 11. Part II · The Reading

*This part is the reading from which the paper takes its place in the series. It is carried from Nothing Escapes, Least Erasure (Islam, 2026a), where it stands as the chapter The Correlation Lives in the Joint Registration, and it is premise-grade. It is not among the machine-checked claims of Section 1.3, and no theorem of Sections 2 to 8 depends on it. The theorem names set in code in this part, and the twin it quotes, are those of that volume and are printed there, not here. Where this part calls a statement a theorem, the statement follows from the placement of the reading, which is its premise. The value 2\[2\]^(1/2), which this part takes as an import, is proved in Section 5 of this paper. The falsifiers listed in Section E.9 are falsifiers of the reading; they stand beside the three of Section 10.3 and are not among them.*

### 11.1 The Correlation Lives in the Joint Registration

*Entanglement on the Seat: No Signal as the Wall, the Correlation in Neither Local Record, and Bell’s Bound as a Count of Local Strategies.* Edition 1.0.0.

**Abstract of the chapter.** Entanglement and nonlocality are read here on the seat, the reflection *s* ↦ 1 − *s̄* and the line it fixes. Two parties register outcomes, and their joint record counts the four outcome pairs. When one party relabels her outcome, her local bias and the correlation reverse while the other party’s record does not move. A carrier that sends her bias to the offset from the line is equivariant, so her relabelling is carried onto the seat’s reflection and the unbiased local record onto the line. We prove in core Lean 4, fifty-five laws with no axiom declared and no use of choice, that the far record is blind to every local relabelling, so no function of it returns a local choice: no signal passes, by the seat’s wall; that two joint records with the same unbiased local records on both sides carry opposite correlations, so the correlation is in neither local record and lives only in the joint registration; that every deterministic local strategy gives a CHSH value of exactly  ± 2, all sixteen counted, and every mixture of them obeys Bell’s bound \|*S*\| ≤ 2; and that a box with unbiased local records reaches 4 while signalling nothing. A Fortran twin runs six checks with zero failures: 100,000 local mixtures stay within 2; the singlet reaches 2\[2\]^(1/2) = 2.828427 at the optimal settings and no random setting exceeds it; its local records are unbiased to 10⁻¹⁶ whatever the far setting; and four experiments, from 1982 to 2023, measured CHSH values above 2 by 2.1 to 46.5 standard deviations and below 2\[2\]^(1/2).

#### E.1 The Reader’s Frame

Two distant parties register outcomes whose correlation no local account reproduces, and neither can use it to send the other a message. The seat reads both facts as one structure: a local relabelling is a fold the far record cannot see.

**It claims four things.**

-   A local relabelling is the fold on the local record, and the unbiased local record is the line.
-   No signal passes. The far record is even under every local relabelling and a local choice is odd, so the seat’s wall stands between them.
-   The correlation is in neither local record. Two joint records with the same local records carry opposite correlations, so the correlation lives only in the joint registration.
-   Bell’s bound is a count of local strategies: each of the sixteen gives exactly  ± 2, so every mixture stays within 2.

**What it refuses.** A local record that carries the correlation. The engine proves there is none.

**Negative warrants.** Two, stated so that no reader supplies them.

-   No physical fact here is read as a proof of a mathematical sentence: a corroboration joined to a claim takes the weaker grade.
-   Interpretive schools from the literature enter only as placements the theorems sort, never as warrants; the only evidence besides the mathematics is measured data.

**Five terms.**

-   A *joint record* counts the four outcome pairs of two parties.
-   A *local record* is one party’s own outcome counts.
-   The *correlation* is the agreements minus the disagreements.
-   A *local strategy* fixes each party’s outcome for each of its settings.
-   A *keyed bit* is a yes-or-no property no function of a given record decides.

#### E.2 The Spine

The seat is a mirror and a record: the reflection *s* ↦ 1 − *s̄*, its fixed line, and the registration that keeps a point’s height and forgets its side. This Part reads the seat on a local relabelling in Section E.3, no signal in Section E.4, the correlation in Section E.5, Bell’s bound in Section E.6, and the quantum and measured values in Section E.7.

**Why this carrier, and not another.** The carrier is not chosen. Spaces with an involution and the maps that respect them form a category (`equivariant_id`, `equivariant_comp`), and the fixed set is a functor on it (`fix_functorial`). An equivariant map into the seat, whose fixed set is the line (`fold_global_seat`), lands every physical fixed point on the line (`equivariant_carrier_lands`). Here the physical involution is one party’s relabelling of her outcome, which exchanges the rows of the joint record (`flipA_involutive`). The local carrier sends a joint record to (1+*b*_A, *N*), her bias *b*_A the offset from the line and the total count the height. It is equivariant (`local_carrier_equivariant`), and its landing on the fixed set is forced (`equivariant_carrier_lands`).

**The correspondence matrix.**

- **a local relabelling** · Element of the seat: the fold; Lean theorem: `local_carrier_equivariant`, `flipA_involutive`; Fortran check: A
- **an unbiased local record** · Element of the seat: the line; Lean theorem: `unbiased_is_the_line`; Fortran check: A, D
- **the far record** · Element of the seat: even under the local fold; Lean theorem: `bob_sees_no_flip`; Fortran check: A, D
- **no signal** · Element of the seat: the wall; Lean theorem: `no_signal_from_a_local_choice`; Fortran check: D
- **the correlation** · Element of the seat: odd, in neither local record; Lean theorem: `corr_odd`, `correlation_is_not_in_the_local_records`; Fortran check: A
- **a local strategy** · Element of the seat: ± 2 exactly; Lean theorem: `chsh_values`, `local_strategies_give_two`; Fortran check: B
- **a local model** · Element of the seat: Bell’s bound; Lean theorem: `bell_bound`; Fortran check: B
- **a maximal no-signalling box** · Element of the seat: 4, signalling nothing; Lean theorem: `pr_box_reaches_four`, `pr_box_signals_nothing`; Fortran check: E
- **the singlet** · Element of the seat: 2\[2\]^(1/2); Lean theorem: computed; Fortran check: C
- **the measured violations** · Element of the seat: above 2, below 2\[2\]^(1/2); Lean theorem: corroboration; Fortran check: F

#### E.3 A Local Relabelling Is the Fold

When Alice relabels her outcome, the joint record’s rows exchange, which is an involution (`flipA_involutive`). Her bias reverses (`aliceBias_odd`) and the correlation reverses (`corr_odd`). The local carrier sends her relabelling to the seat’s reflection (`local_carrier_equivariant`). Her local record lands on the line exactly when it is unbiased (`unbiased_is_the_line`). A maximally entangled pair puts every local record on the line: the twin finds the singlet’s local records unbiased to 10⁻¹⁶ at 100,000 settings.

#### E.4 No Signal Is the Wall

Bob’s record, his own outcome counts, does not move when Alice relabels (`bob_sees_no_flip`). Whether Alice relabels is odd and Bob’s record even, so no function of Bob’s record returns her choice (`no_signal_from_a_local_choice`). This is no-signalling in exact form. Whatever Alice does on her side is a fold, and the far record is blind to every fold, as an even reading is blind to an odd target. The twin confirms it on the singlet: Bob’s marginal is one half at every setting of Alice’s.

#### E.5 The Correlation Lives in the Joint Registration

Two joint records, one perfectly correlated and one perfectly anticorrelated, have the same unbiased record for Alice and the same for Bob, and opposite correlations. No function of the two local records returns the correlation (`correlation_is_not_in_the_local_records`). The correlation is a property of the joint registration alone, two worlds over one pair of local records. That is what entanglement is on the seat. Each local outcome is a keyed bit supplied by its own act, as Least Erasure proves (Islam, 2026a). The correlation is the relation between the two acts, and it appears only when the two records are registered together.

#### E.6 Bell’s Bound Is a Count of Local Strategies

A local strategy fixes each party’s outcome for each of two settings. The CHSH combination of its four correlations is  ± 2 for every one of the sixteen strategies (`chsh_values`, `local_strategies_give_two`). Every mixture with nonnegative weights stays within twice its total weight (`bell_bound`). Bell’s inequality (Bell, 1964; Clauser, Horne, Shimony and Holt, 1969) is this count and nothing more: an account that gives each party a local record of answers in advance cannot exceed 2. The twin draws 100,000 random mixtures, and every one stays within 2.

No-signalling alone allows more. A box whose outcomes agree unless both settings are 1 has unbiased local records for every setting and signals nothing (`pr_box_signals_nothing`), and it reaches 4 (`pr_box_reaches_four`; Popescu and Rohrlich, 1994).

#### E.7 The Quantum Value and the Measured Values

The singlet’s correlation at settings *a* and *b* is  − cos (*a*−*b*). The twin reaches 2\[2\]^(1/2) = 2.828427 at the optimal settings, and no one of 100,000 random settings exceeds it, the bound Tsirelson proved (Tsirelson, 1980). The measured values:

- **Aspect, Grangier and Roger, 1982** · CHSH value: 2.697 ± 0.015; Above 2: 46.5σ
- **Weihs et al., 1998** · CHSH value: 2.73 ± 0.02; Above 2: 36.5σ
- **Hensen et al., 2015, loophole-free** · CHSH value: 2.42 ± 0.20; Above 2: 2.1σ
- **Storz et al., 2023, loophole-free** · CHSH value: 2.0747 ± 0.0033; Above 2: 22.6σ

Every one lies above the local count and below 2\[2\]^(1/2).

The world’s joint records are not mixtures of local ones. Its local records never signal.

#### E.8 What the Pair Carries, and What It Does Not

**What it carries.**

-   The local relabelling as the fold and the unbiased local record as the line.
-   No signal as the wall.
-   The correlation in the joint registration alone.
-   Bell’s bound as a count of local strategies, and the measured violations.

**What it does not carry.**

-   **The value 2\[2\]^(1/2) from the seat:** it is computed from the singlet and imported as Tsirelson’s theorem.
-   **A local record of the correlation:** there is none.

#### E.9 Falsifiers

Three falsifiers, each a forbidden observation naming the theorem it would break.

-   **F-Signal:** a local operation on one party that changes the far party’s own outcome counts. It breaks `bob_sees_no_flip` and `no_signal_from_a_local_choice` read physically.
-   **F-Local:** a CHSH value above 2 reproduced by a model assigning each party its outcomes in advance. It breaks `bell_bound`.
-   **F-Tsirelson:** a measured CHSH value above 2\[2\]^(1/2) on quantum systems. It breaks the imported bound and the twin’s computation of the singlet.

## 12. Closure

The law of correlation between two separated parties is no longer informal prose. From a ring of readings and a linear record on it, and nothing more, Lean 4 with Mathlib compiles no signal under every complete far operation, the value of every table and the whole reach of local records, the square of the correlation as four less the product of two commutators, eight less 2\[2\]^(1/2) times the correlation as a sum of two squares, the bound of 2\[2\]^(1/2) for every record that is not negative on squares, the bound of two when the readings of one party commute, an explicit pair of size four that reaches 2\[2\]^(1/2), and its outcome as one bit that neither record holds alone. No axiom is declared. No proof is left open. No headline theorem closes by its own hypothesis or over a structure that carries its conclusion.

No signal is recovered from the registration, with no state named. Bell’s bound is recovered as the whole reach of local records, every value within it reached. Tsirelson’s bound is recovered for every record of every ring, and the step between the two bounds is located: it is a pair of readings that do not commute, held by each party. The numerical twin executes the identities on one hundred thousand random records and settings, finds nothing that the theorems forbid, and sets two rivals against four published experiments: the local bound, passed by all four and by more than five uncertainties in three, and the value four of no signal alone, which none approaches.

Every boundary is in plain sight. That readings of separated parties commute is one field of one printed structure. That what is registered is a linear record, not negative on squares, is three more fields of the same structure. That a local account is a weighted family of tables is Fine’s theorem, cited. That the pairs of nature are the pair of the model is read from experiment. Which outcome occurs is not derived, here or anywhere in the paper.

That structure is not an arbitrary postulate. The two statements the reading rests on, Existence and Least Erasure, are theorems in their own domain: each has its own compiled Lean file, with no axiom declared, listed in the Lean Library Reference. There they are proved. The Heat Bridge, which joins erasure to heat, is a theorem there as well; the bridge spoken of below is a different one, from that domain to physics. Here they are used, and the difference is stated. Between that domain and the algebra of readings lies a physical bridge: that what exists is what is registered, that a registration adds, and that two parties are separate when their readings commute. This paper does not claim the bridge as a theorem. It writes the bridge down as `Premises`, so that the engine imports nothing outside Mathlib and can be checked alone, and so that a reader can see exactly which sentence carries the physics.

Two things are therefore separate, and the paper keeps them separate. Inside the kernel, the implication from `Premises` to no signal and to the two bounds is a mathematical certainty. No experiment, no consensus and no later revision of physics alters it, and anyone can recheck it with one compilation. Outside the kernel stand three falsifiers. They test whether nature satisfies the premises, and so far nature does. What survives both is not opinion. It is a theorem, and a physics that has met every test of its premises.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author’s. The Lean file and the Fortran twin are written by a language model under the author’s direct supervision. Every theorem named in the text of Sections 1 to 10 and 12 is in Appendix A under that name, and its kernel line is printed in Appendix D. Classical results that are cited and not formalised are named as such in Section 1.3 and wherever they are used. No constant of nature is derived anywhere in this paper; the numbers of the twin are computed from random data and from measured inputs, which Appendix B prints.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1.  J. S. Bell, Physics 1 (1964) 195.
2.  J. F. Clauser, M. A. Horne, A. Shimony and R. A. Holt, Phys. Rev. Lett. 23 (1969) 880.
3.  B. S. Tsirelson, Lett. Math. Phys. 4 (1980) 93.
4.  A. Aspect, P. Grangier and G. Roger, Phys. Rev. Lett. 49 (1982) 91.
5.  S. Popescu and D. Rohrlich, Found. Phys. 24 (1994) 379.
6.  G. Weihs et al., Phys. Rev. Lett. 81 (1998) 5039.
7.  B. Hensen et al., Nature 526 (2015) 682.
8.  S. Storz et al., Nature 617 (2023) 265.
9.  M. Born, Z. Phys. 37 (1926) 863.
10. A. Einstein, B. Podolsky and N. Rosen, Phys. Rev. 47 (1935) 777.
11. E. Schrödinger, Naturwissenschaften 23 (1935) 807.
12. D. Bohm, Phys. Rev. 85 (1952) 166.
13. G. C. Ghirardi, A. Rimini and T. Weber, Lett. Nuovo Cimento 27 (1980) 293.
14. A. Fine, Phys. Rev. Lett. 48 (1982) 291.
15. L. J. Landau, Phys. Lett. A 120 (1987) 54.
16. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
17. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
18. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).

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

**Appendix A · SPHYS_Correlation_Forced_CC.lean.** Lean 4.19.0 with Mathlib 4.19.0. 43 theorems, no axiom declared, no `sorry`, exit 0 with no warning. The kernel lines are Appendix D. *[a printed file, 698 lines, in the master and in the Journal edition]*

**Appendix B · Correlation_Forced_Twin_CC.f90.** Sixteen checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix C. *[a printed file, 257 lines, in the master and in the Journal edition]*

**Appendix C · Run of Appendix B.** ```text
 A. The registration, on 100000 random records, near readings and far settings
   largest change of the near record: far reading  4.44E-16   far operation  5.55E-16
  PASS  a complete far reading leaves the near record
  PASS  a complete far operation of three branches leaves the near record
 B. Local records
  PASS  all sixteen tables give plus or minus two
  PASS  100000 random weighted families of tables stay within two
  PASS  every value from -2 to 2 in steps of 0.01 is reached by two tables
 C. Four readings, 100000 random settings and records
   largest residual: square  3.11E-15   two squares  7.11E-15   zero or eight  1.78E-14
  PASS  the square of the correlation is four less the product of the two commutators
  PASS  eight less 2*sqrt(2) times the correlation is the sum of the two squares
  PASS  readings at right angles on both sides: the square is zero or eight
   largest record of the correlation: random records  2.209971   the pair  2.826945   2*sqrt(2) =  2.828427
  PASS  no record of the correlation exceeds 2*sqrt(2)
   largest record when the two near readings commute:  1.968892
  PASS  near readings that commute stay within two, on every record
   the pair at the settings of the engine:  2.828427
  PASS  the pair of the engine reaches 2*sqrt(2), and is carried to that multiple of itself
 D. The outcome, the pair read along 1000 random common axes
  PASS  the two outcomes never agree, and each alone is one half
 E. Against published measurements, with two rivals
   rival, no signal alone: correlation  4.0000   change of the near record  0.00E+00
  PASS  a table of chances with no signal and no readings reaches four
   Aspect, Grangier and Roger, 1982         2.6970 +- 0.0150   above two by   46.5, below four by    86.9 uncertainties
   Weihs et al., 1998                       2.7300 +- 0.0200   above two by   36.5, below four by    63.5 uncertainties
   Hensen et al., 2015                      2.4200 +- 0.2000   above two by    2.1, below four by     7.9 uncertainties
   Storz et al., 2023                       2.0747 +- 0.0033   above two by   22.6, below four by   583.4 uncertainties
  PASS  four experiments lie above two and not above 2*sqrt(2)
  PASS  rival, local records: excluded by more than five uncertainties in three experiments, one of them free of loopholes
  PASS  rival, no signal alone: its value four is excluded by more than five uncertainties in all four
 BATTERY-JSON: {"checks":16,"failures":0} *[a printed file, 32 lines, in the master and in the Journal edition]*

**Appendix D · Kernel lines of Appendix A.** Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own. *[a printed file, 51 lines, in the master and in the Journal edition]*
