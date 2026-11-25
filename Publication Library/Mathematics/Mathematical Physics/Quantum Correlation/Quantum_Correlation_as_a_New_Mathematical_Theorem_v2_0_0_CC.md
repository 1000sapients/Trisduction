# Quantum Correlation as a New Mathematical Theorem

## No Signal Forced by the Registration, Bell's Bound as the Whole Reach of Local Records, and the Outcome as One Keyed Bit

**Mohammad F. Islam PhD** · 25 November 2026

## Abstract

This paper proves, in Lean 4 with Mathlib, three statements about the records of two separated parties, and proves that one printed structure carries all three. A record is a linear functional on a ring of readings. A reading is an element of that ring whose square is one. Nothing else is assumed: no state space, no wave function and no rule for which outcome occurs. First, no signal: if the far party performs any complete operation with elements that commute with a near element, the near record of that element does not move, and between the readings of the premises this needs no further hypothesis. Second, the reach of local records: a table of four answers gives a correlation of plus or minus two, every weighted family of tables stays within two, and every value within two is reached by a family of two tables, so Bell's bound is the whole reach of local records and not only a limit on it. Third, the reach of the quantum: for four readings, two near and two far, the square of the correlation is four less the product of the commutator of the near pair with the commutator of the far pair; eight less $2\sqrt2$ times the correlation is a sum of two squares; and so every record that is not negative on squares holds the correlation between $-2\sqrt2$ and $2\sqrt2$. The bound is Tsirelson's and the identity of the square is Landau's; here both compile, for every ring and every such record. If the two near readings commute, the record stays within two, so a record above two forces each party to hold two readings that do not commute. The premises are met twice. A weighted family of tables is a member whose readings all commute, and it stays within two. A pair of matrices of size four is a member whose record of the correlation is $2\sqrt2$ exactly, with every relation proved. Read along one axis by both parties, that pair gives outcomes that never agree, each of them one half alone: one bit, fair in either record and fixed by the other. A Fortran twin executes the identities on one hundred thousand random records and settings, and sets two rivals against four published experiments: local records, whose bound of two is passed by all four and by more than five uncertainties in three, and no signal alone, whose value of four none approaches. That the pairs of nature are the pair of the model is read from experiment, and that a local account is a weighted family of tables is cited; both are named where they are used. Every premise of the paper is one field of one printed structure. Part II carries the reading of entanglement from which the paper takes its place in the series, at premise grade and apart from the machine-checked claims.

## 1. The Theorem and What It Rests On

### 1.1 The statement

Let $A_0, A_1$ be two readings of a near party and $B_0, B_1$ two readings of a far party: elements of a ring, each of square one, with every near reading commuting with every far reading. Their correlation is

$$S = A_0B_0 + A_0B_1 + A_1B_0 - A_1B_1.$$

A record is a linear map $\varphi$ from the ring to the real numbers with $\varphi(1) = 1$ and $\varphi(X^*X) \ge 0$ for every $X$.

**Theorem (`no_signal_forced`).** Let $E$ be an element of the near party and let the far party act by finitely many elements $K_b$ with companions $L_b$, each $K_b$ commuting with $E$, and $\sum_b L_bK_b = 1$. Then $\sum_b \varphi(L_b E K_b) = \varphi(E)$. On the premises below, with $E$ either near reading and the far party reading either of its own, the hypotheses hold and the conclusion follows from the fields alone (`no_signal_on_the_premises`).

**Theorem (`local_records_stay_within_two`, `every_value_within_two_is_reached`).** A weighted family of tables of four answers, each answer plus or minus one, has a correlation between $-2$ and $2$, and every value between $-2$ and $2$ is the correlation of such a family.

**Theorem (`reach_forced`).** On the premises below, $-2\sqrt2 \le \varphi(S) \le 2\sqrt2$.

**Theorem (`commuting_readings_stay_within_two`, `commuting_far_readings_stay_within_two`).** On the premises below, if $A_0A_1 = A_1A_0$, or if $B_0B_1 = B_1B_0$, then $-2 \le \varphi(S) \le 2$.

**Theorem (`the_bound_is_reached`).** The premises have a member with $\varphi(S) = 2\sqrt2$, and its two near readings do not commute.

The local bound is Bell's [1], in the form of Clauser, Horne, Shimony and Holt [2]. The bound of the quantum is Tsirelson's [3], and the identity from which Section 5 starts is Landau's [15]. The premises are met: `quantumPremises` constructs a term of the structure from matrices of size four over the real numbers, and `localPremises` constructs one from any weighted family of tables.

### 1.2 The premises, printed

The physical premises of the paper are the fields of this structure of the Lean file, and there are no others. What is cited is in the tables of Section 1.3.

```lean
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

It carries three premises. The first is that a reading has two outcomes: the fields `square_one` and `own_star` say each of the four readings squares to one and is its own star. The second is separation, the field `separate`: a reading of one party commutes with a reading of the other. The third is the registration, the fields `record`, `whole` and `positive`: what is registered is linear in the readings, gives one on the reading that is always one, and is not negative on any $X^*X$. No field of `Premises` states a bound, a commutator of two readings of one party, a space of states, a vector, or the conclusion of any theorem. The ring is any ring with a star over the real numbers; matrices over the complex numbers are one. Section 9 states where the premises come from.

### 1.3 What is proved, what is cited, what is assumed

| Statement | Standing | Where |
|---|---|---|
| A complete far reading, and a complete far operation that commutes with the near reading, leave the near record | Proved, for every additive record on every ring | Appendix A, Part I |
| A table gives plus or minus two; a weighted family of tables stays within two; every value within two is reached | Proved, over every ordered field | Part II |
| The square of the correlation is four less the product of the two commutators | Proved, in every ring | Part III |
| Readings of one party that commute give a square of four; readings that anticommute on both sides give a square $Q$ with $Q(Q - 8) = 0$ | Proved, in every ring | Part III |
| Eight less $2r$ times the correlation is a sum of two squares when $r^2 = 2$ | Proved, in every algebra over an ordered field | Part III |

The table continues with the bound, the model and the premises.

| Statement | Standing | Where |
|---|---|---|
| A record not negative on the two squares holds the correlation at or below $2r$ | Proved | Part III |
| The square of a record is at most the record of the square | Proved, for records as in Section 1.1 | Part III-b |
| Four matrices of size four are readings, near commuting with far, each pair of one party anticommuting; their correlation carries the pair to $4s$ times itself, where $2s^2 = 1$ | Proved, over every commutative ring with such an $s$ | Part IV |
| The pair read along one axis by both parties: the outcomes never agree, and each alone is one half | Proved, over the same rings | Part IV |
| On the premises: no signal between the readings, the correlation within $2\sqrt2$, within two when the readings of one party commute, and above two only when neither party's do; the premises are met by a local member and by a member that reaches $2\sqrt2$ | Proved | Part V |

What is not machine-checked is in the third table.

| Statement | Standing | Where |
|---|---|---|
| Readings of separated parties commute | Premise | Sections 3, 9 |
| What is registered is a linear record, not negative on squares | Premise; the rule of Born [9] is its usual form | Section 9 |
| A local account, in which the answers are fixed in advance or drawn by chance from a shared source, is a weighted family of tables | Cited: [14]; the theorem here covers finite families | Section 4 |
| The pairs of nature are the pair of the model | Read from experiment: [4, 6, 7, 8] | Sections 6, 8 |
| A table of chances with no signal and no readings reaches four | Cited: [5]; executed by the twin, not machine-checked | Section 8 |
| The measured values of the twin | Entered from the literature [4, 6, 7, 8]; numerical, not machine-checked | Section 8 |

The paper claims as machine-checked the rows marked proved and no others. A row marked cited is a result with a published proof that this work has not machine-checked. A row marked entered is a measured value used by the numerical twin alone; no theorem rests on it. Part II, the reading, is outside these tables: it is premise-grade and is labelled so where it begins.

## 2. Records and Readings as Algebra

Two parties need readings that can be multiplied and added, and a record that assigns a number to each. A ring and a linear map on it are exactly this, and they are what the file of Appendix A formalises, in the kernel of Lean 4 [17] on the library Mathlib [16]. Working at this level has a cost and a gain. The cost is that no space of states, no time and no dynamics is constructed. The gain is that every theorem holds in every ring, the matrices over the complex numbers included, and for every record, so nothing proved in Sections 3 and 5 is special to a size, a state or a pair of settings.

Three terms are fixed here. A reading is an element of the ring whose square is one; it has two outcomes, and with a half among the constants they are the elements $(1 + A)/2$ and $(1 - A)/2$, written `out` in the file. A family of outcomes is complete when it sums to one; the two outcomes of a reading are complete (`out_complete`) and each is its own square (`out_square`). An operation is a finite family of elements $K_b$ with companions $L_b$, complete when $\sum_b L_bK_b = 1$. The definitions `chsh` and `corr` are the correlation of four answers and of four readings, and `rec` is the record of the model of Section 6.

## 3. No Signal

Nothing in this section is assumed beyond what each theorem states. Each statement is a theorem of Appendix A.

**A far reading (`no_signal_from_a_far_reading`).** Let $\varphi$ be an additive record, $E$ a near element and $M_b$ a complete family of far outcomes. Then $\sum_b \varphi(E M_b) = \varphi(E)$. The near record summed over the far outcomes is the near record, whatever the far reading is.

**No far choice is read (`the_near_record_reads_no_far_choice`).** For two complete families of far outcomes $M$ and $M'$ the two sums are equal. The near party cannot tell which the far party chose.

**A far operation (`no_signal_from_a_far_operation`).** Let the far party act by elements $K_b$ with companions $L_b$, complete in the sense that $\sum_b L_bK_b = 1$, and let each $K_b$ commute with $E$. Then $\sum_b \varphi(L_b E K_b) = \varphi(E)$. With $L_b = K_b^*$ this is the general operation of the quantum theory; the theorem asks less.

**On the premises (`no_signal_forced`, `no_signal_on_the_premises`).** The record of the premises is linear, so the same holds for it. And between the readings of the premises nothing more is asked: let the far party read either of its two readings, with either outcome registered, so that its operation is the two outcomes of that reading. They are complete, and they commute with each near reading by the field `separate`. The near record of either near reading, summed over the two far outcomes, is what it was. No signal is forced by the registration: by the additivity of the record, the completeness of the far operation, and the commuting of far with near. That no signal follows from the trace over the far system is classical [13]; here it compiles in every ring.

## 4. Local Records

**A table (`table_is_plus_or_minus_two`).** Let each of the four answers $a_0, a_1, b_0, b_1$ be plus or minus one. Then $a_0b_0 + a_0b_1 + a_1b_0 - a_1b_1$ is plus two or minus two. There are sixteen tables.

**A weighted family (`local_records_stay_within_two`).** Let finitely many tables carry weights that are not negative and sum to one. The correlation of the family lies between $-2$ and $2$. This is Bell's bound [1, 2].

**The whole reach (`every_value_within_two_is_reached`).** For every $s$ between $-2$ and $2$, the two tables with correlations $2$ and $-2$, with weights $(2 + s)/4$ and $(2 - s)/4$, have correlation $s$. The bound is therefore not only a limit: the correlations of local records are exactly the interval from $-2$ to $2$.

**What a local account is.** An account in which each party's answer is fixed by its own setting and a shared source, with chance allowed in the source and in each party, has the same correlations as a weighted family of tables. That is Fine's theorem [14], which is cited and not formalised; the theorems of this section cover finite families.

## 5. Four Readings

**The square of the correlation (`square_of_the_correlation`).** For four readings as in Section 1.1, in any ring,

$$S^2 = 4 - (A_0A_1 - A_1A_0)(B_0B_1 - B_1B_0).$$

**Readings that commute (`commuting_readings_give_four`).** If the two near readings commute, $S^2 = 4$: the value of a table. **Readings that anticommute (`anticommuting_readings_give_zero_or_eight`).** If the near pair anticommutes and the far pair anticommutes, $Q = S^2$ obeys $Q(Q - 8) = 0$.

**A sum of two squares (`sum_of_two_squares`).** Let $r$ be a constant with $r^2 = 2$. Then, by the decomposition that is the usual proof of Tsirelson's bound [3],

$$8 - 2r\,S = \big(rA_0 - (B_0 + B_1)\big)^2 + \big(rA_1 - (B_0 - B_1)\big)^2.$$

**The reach (`quantum_reach`, `reach_forced`).** A linear record with $\varphi(1) = 1$ that is not negative on those two squares has $\varphi(S) \le 2r$. On the premises the two elements are their own stars, so the record is not negative on their squares, and with $r = \sqrt2$ the correlation is at most $2\sqrt2$. Turning the signs of the two far readings gives the same bound from below. Hence `square_at_most_eight`: the square of the record of the correlation is at most eight. No state is named and no size: the bound holds for every record of every ring.

**Within two when the near readings commute (`record_squared_le`, `commuting_readings_stay_within_two`).** For a record of the premises and an element that is its own star, the square of the record is at most the record of the square. The correlation is its own star (`S_own_star`), and its square is four when the near readings commute. So the record lies between $-2$ and $2$. The same holds when it is the two far readings that commute (`commuting_far_readings_stay_within_two`). **Passing two (`passing_two_forces_readings_that_do_not_commute`, `passing_two_forces_both_parties`).** A record of the correlation above two forces $A_0A_1 \ne A_1A_0$. The premises with the two parties exchanged are premises with the same correlation (`swap`, `swap_S`), so it forces $B_0B_1 \ne B_1B_0$ as well. What a table cannot hold is two readings of one party that do not commute, and above two each party holds such a pair.

## 6. The Pair

The question of this section is that of Einstein, Podolsky and Rosen [10]. The name entanglement is Schrödinger's [11], and the pair of two half-spins is Bohm's form of the question [12].

**The readings of the model (`model_readings`).** Over any commutative ring with an element $s$ such that $2s^2 = 1$, the file writes matrices of size four: the near readings `nZ` and `nX`, and the far readings `mB0` and `mB1`, which are $-s$ times the sum and the difference of the two far axes. It proves that each of the four squares to one, that near commutes with far, and that each party's two readings anticommute.

**The model reaches the bound (`model_reaches`).** The correlation of these readings carries the vector `pair`, which is near up and far down less near down and far up, to $4s$ times itself. The record `rec` of the pair on the correlation is $4s$, and $(4s)^2 = 8$.

**The outcome (`outcomes_are_complete`, `model_outcomes`).** Let both parties read along the first axis. The outcomes up and down of each party are complete readings. The record of up with up is zero and of down with down is zero; the record of up with down is one half, and of down with up one half; and the record of each party's own outcome is one half. So the outcome of either party is fair in its own record and is fixed once the other's is read. This paper calls that one keyed bit: a yes or no that neither record holds alone and that the two hold together. The theorem does not say which outcome occurs, and nothing in the paper does.

## 7. One Structure, Two Members

**The local member (`localPremises`, `local_member_stays_within_two`).** A weighted family of tables is a member of `Premises`: the ring is the ring of real functions on the tables, the readings are the four columns of answers, and the record is the weighted sum. All its readings commute. Its record of the correlation is the correlation of the family, and it lies within two by `commuting_readings_stay_within_two`: Bell's bound is reached a second way, from inside the premises.

**The member that reaches (`quantumPremises`, `rec_positive`, `the_bound_is_reached`).** The pair of Section 6, over the real numbers with $s = \sqrt2/2$, is a member: its record is not negative on any $X^*X$, being $s^2$ times a sum of four squares. Its record of the correlation is $2\sqrt2$, and its near readings do not commute.

The two members differ in one thing. In the first, the two readings of each party commute, and the record stays within two. In the second they do not, and the record reaches $2\sqrt2$, which no member passes. The premises do not choose between them. Experiment does.

## 8. The Numerical Twin

The twin of Appendix B does three things the kernel does not. It executes the identities independently in floating point, it searches random records and settings for what the theorems forbid, and it sets two rival bounds against published measurements.

**The registration.** On one hundred thousand random records, each a random positive matrix of trace one, with random near readings and far settings, the near record does not move under a complete far reading or under a far operation of three branches; the largest change is at the level of rounding.

**Local records.** All sixteen tables give plus or minus two, one hundred thousand random weighted families stay within two, and every value from $-2$ to $2$ in steps of $0.01$ is reached by two tables.

**Four readings.** On one hundred thousand random settings the identity of the square, the sum of two squares, and the square of zero or eight at right angles hold to rounding. The largest record of the correlation found is 2.209971 over random records and 2.826945 for the pair, against $2\sqrt2 = 2.828427$. With the two near readings made to commute, the largest record is 1.968892. The pair at the settings of the engine gives 2.828427. Read along one thousand random common axes, the two outcomes of the pair never agree and each alone is one half.

**The measurements.** The inputs are measured and are printed in Appendix B.

| Experiment | Measured correlation | Above two, in uncertainties | Below four, in uncertainties |
|---|---|---|---|
| Aspect, Grangier and Roger, 1982 [4] | $2.697 \pm 0.015$ | 46.5 | 86.9 |
| Weihs et al., 1998 [6] | $2.73 \pm 0.02$ | 36.5 | 63.5 |
| Hensen et al., 2015 [7] | $2.42 \pm 0.20$ | 2.1 | 7.9 |
| Storz et al., 2023 [8] | $2.0747 \pm 0.0033$ | 22.6 | 583.4 |

Two rivals stand beside the theorem. The first is local records, with the bound two. The second keeps no signal and drops the readings: a table of chances in which the outcomes agree unless both settings are the second, which signals nothing and gives a correlation of four [5]; the twin builds it and checks both. All four measurements lie above two and none above $2\sqrt2$. Three of them exclude the first rival by more than five of their uncertainties, one of those three free of loopholes [8]; all four exclude the value of the second by more than five.

Sixteen checks pass and none fails. Three limits are stated. The experiment of 2015 lies above two by 2.1 of its uncertainties on this simple measure, and is not counted among the three. The search over settings covers readings in one plane; the theorem covers every reading of square one. And the twin tests bounds against two rivals and against measurement. It is not a new prediction: the violation of the local bound and the bound of the quantum were known.

## 9. Discussion: The Reading

The derivation above uses only algebra. This section states the reading from which the premises come, and marks what in it is theorem and what is premise.

**Why a record.** In the reading of Part II what exists is what is registered, and a registration adds: the record of two readings together is the sum of their records. That is the field `record` with `whole` and `positive`. The premise is physics and is not a theorem of this paper; in the quantum theory it is the rule of Born [9]. What the paper proves is what the premise forces: no signal, and a correlation within $2\sqrt2$.

**Why separation is commuting.** In the reading two parties are separate when the reading of one does not disturb the record of the other, and in a ring that is the statement that their readings commute. That is the field `separate`. What the paper proves is that separation between the parties is enough for no signal, and that it leaves each party free to hold two readings that do not commute with each other.

**Where the correlation lives.** In the model each party's own record is one half at every reading, and the two outcomes never agree. The correlation is in neither record alone. It is in the record of the two together, which is the claim the series carries under the name of the joint registration, and here it is the theorem `model_outcomes`.

**What the paper does not claim.** It does not derive which outcome occurs, and it does not derive the rule of Born. It does not prove that a local account must be a family of tables; that is cited. It does not claim that the violation of Bell's bound or the bound of Tsirelson was unknown or untested. It claims that no signal is forced by the registration, that the local reach is exactly two, that the bound of the quantum is $2\sqrt2$ and is attained, on premises printed in one structure, that passing two forces each party to hold readings that do not commute, and that each statement of Section 1.3 marked proved compiles. The fuller account of the reading, entanglement on the seat, is Part II, Section 11, carried from [18]. No theorem of Sections 2 to 8 depends on it.

## 10. Predictions, Falsifiers, and What Stands

The paper recovers no signal, Bell's bound and Tsirelson's bound. It predicts no measurement that the quantum theory does not and derives no constant. Its commitments are those of the premises, and they are stated here as commitments: three that the paper says will stand at any future precision, two proposals it says will fail, and the three observations that would refute it.

### 10.1 Three predictions that will stand

1. **No signal.** `no_signal_on_the_premises` gives equality between the readings, and `no_signal_forced` for every far operation that commutes with the near element. The prediction is that no choice of a far reading or a far operation changes the record of a near reading, at any distance and any precision.
2. **No correlation above $2\sqrt2$.** `reach_forced` gives the bound. The four measurements of Section 8 lie at or below it. The prediction is that no experiment on two-valued readings of two separated parties finds more.
3. **Above two, the readings of each party do not commute.** `passing_two_forces_both_parties` gives it. The prediction is that every experiment that passes two uses, for each party, two readings that cannot be made together.

### 10.2 Two proposals that will fail

1. **A local account of the measured correlations.** `local_records_stay_within_two` leaves it at two, and three of the four measurements pass two by more than five uncertainties. The paper predicts that every such account either gives up the measured values or is not a family of tables under another name.
2. **A correlation of four from separated readings.** No signal alone allows it [5]; `reach_forced` does not. The paper predicts that no pair of separated two-valued readings reaches it, and that every device that does carries a signal or is not separate.

### 10.3 The three falsifiers

Each is a forbidden observation. No observation breaks a theorem; each refutes a premise, or the premises as the law of nature, and each names the theorem that carries the consequence. The threshold in each case is five of the experiment's printed uncertainties.

1. **A near record that changes with the far choice.** It refutes the field `separate` or the field `record`, through `no_signal_on_the_premises`.
2. **A correlation above $2\sqrt2$.** It refutes one of the fields `square_one`, `separate` and `positive`, through `reach_forced`.
3. **A correlation above two between parties whose two readings can each be made together.** It refutes the same fields through `commuting_readings_stay_within_two`.

Apart from them stands the formal claim, which no observation touches and one compilation settles: every theorem named in this text prints its axioms in Appendix D, and a line that names an axiom other than `propext`, `Classical.choice` and `Quot.sound`, or a file that fails to compile under Lean 4.19.0 and Mathlib 4.19.0, refutes the claim that the statements are proved.

### 10.4 What kind of result this is

It is not a new physics. It is a change in how a physical derivation can be checked. No signal, the local bound and the bound of the quantum are here a single file whose every step the kernel has verified, whose every assumption is one field of one structure, and whose bounds are set against measurement. A reader who doubts a step can name the line.

The implication from `Premises` to no signal, to the bound of $2\sqrt2$ and to the bound of two for readings that commute is checked by the Lean kernel. No experiment and no later revision of physics alters an implication. Experiment remains free to test whether nature satisfies the premises, and that is all it can test here. What the kernel certifies is the Lean statements; that the definitions of the file say what this text says they say is for the reader to check, and the structure `Premises` is printed for that purpose. What stands is the tables of Section 1.3.

## 11. Part II · The Reading

*This part is the reading from which the paper takes its place in the series. It is carried from Nothing Escapes, Least Erasure (Islam, 2026a), where it stands as the chapter The Correlation Lives in the Joint Registration, and it is premise-grade. It is not among the machine-checked claims of Section 1.3, and no theorem of Sections 2 to 8 depends on it. The theorem names set in code in this part, and the twin it quotes, are those of that volume and are printed there, not here. Where this part calls a statement a theorem, the statement follows from the placement of the reading, which is its premise. The value $2\sqrt2$, which this part takes as an import, is proved in Section 5 of this paper. The falsifiers listed in Section E.9 are falsifiers of the reading; they stand beside the three of Section 10.3 and are not among them.*

### 11.1 The Correlation Lives in the Joint Registration

*Entanglement on the Seat: No Signal as the Wall, the Correlation in Neither Local Record, and Bell's Bound as a Count of Local Strategies.* Edition 1.0.0.

**Abstract of the chapter.** Entanglement and nonlocality are read here on the seat, the reflection $s\mapsto1-\bar s$ and the line it fixes. Two parties register outcomes, and their joint record counts the four outcome pairs. When one party relabels her outcome, her local bias and the correlation reverse while the other party's record does not move. A carrier that sends her bias to the offset from the line is equivariant, so her relabelling is carried onto the seat's reflection and the unbiased local record onto the line. We prove in core Lean 4, fifty-five laws with no axiom declared and no use of choice, that the far record is blind to every local relabelling, so no function of it returns a local choice: no signal passes, by the seat's wall; that two joint records with the same unbiased local records on both sides carry opposite correlations, so the correlation is in neither local record and lives only in the joint registration; that every deterministic local strategy gives a CHSH value of exactly $\pm2$, all sixteen counted, and every mixture of them obeys Bell's bound $|S|\le2$; and that a box with unbiased local records reaches 4 while signalling nothing. A Fortran twin runs six checks with zero failures: 100,000 local mixtures stay within 2; the singlet reaches $2\sqrt2=2.828427$ at the optimal settings and no random setting exceeds it; its local records are unbiased to $10^{-16}$ whatever the far setting; and four experiments, from 1982 to 2023, measured CHSH values above 2 by 2.1 to 46.5 standard deviations and below $2\sqrt2$.

#### E.1 The Reader's Frame

Two distant parties register outcomes whose correlation no local account reproduces, and neither can use it to send the other a message. The seat reads both facts as one structure: a local relabelling is a fold the far record cannot see.

**It claims four things.**

- A local relabelling is the fold on the local record, and the unbiased local record is the line.
- No signal passes. The far record is even under every local relabelling and a local choice is odd, so the seat's wall stands between them.
- The correlation is in neither local record. Two joint records with the same local records carry opposite correlations, so the correlation lives only in the joint registration.
- Bell's bound is a count of local strategies: each of the sixteen gives exactly $\pm2$, so every mixture stays within 2.

**What it refuses.** A local record that carries the correlation. The engine proves there is none.

**Negative warrants.** Two, stated so that no reader supplies them.

- No physical fact here is read as a proof of a mathematical sentence: a corroboration joined to a claim takes the weaker grade.
- Interpretive schools from the literature enter only as placements the theorems sort, never as warrants; the only evidence besides the mathematics is measured data.

**Five terms.**

- A *joint record* counts the four outcome pairs of two parties.
- A *local record* is one party's own outcome counts.
- The *correlation* is the agreements minus the disagreements.
- A *local strategy* fixes each party's outcome for each of its settings.
- A *keyed bit* is a yes-or-no property no function of a given record decides.


#### E.2 The Spine

The seat is a mirror and a record: the reflection $s\mapsto1-\bar s$, its fixed line, and the registration that keeps a point's height and forgets its side. This Part reads the seat on a local relabelling in Section E.3, no signal in Section E.4, the correlation in Section E.5, Bell's bound in Section E.6, and the quantum and measured values in Section E.7.

**Why this carrier, and not another.** The carrier is not chosen. Spaces with an involution and the maps that respect them form a category (`equivariant_id`, `equivariant_comp`), and the fixed set is a functor on it (`fix_functorial`). An equivariant map into the seat, whose fixed set is the line (`fold_global_seat`), lands every physical fixed point on the line (`equivariant_carrier_lands`). Here the physical involution is one party's relabelling of her outcome, which exchanges the rows of the joint record (`flipA_involutive`). The local carrier sends a joint record to $(1+b_A,\,N)$, her bias $b_A$ the offset from the line and the total count the height. It is equivariant (`local_carrier_equivariant`), and its landing on the fixed set is forced (`equivariant_carrier_lands`).

**The correspondence matrix.**

\begingroup\small

| Physical phenomenon | Element of the seat | Lean theorem | Fortran check |
|----------|----------|----------|----------|
| a local relabelling | the fold | `local_carrier_equivariant`, `flipA_involutive` | A |
| an unbiased local record | the line | `unbiased_is_the_line` | A, D |
| the far record | even under the local fold | `bob_sees_no_flip` | A, D |
| no signal | the wall | `no_signal_from_a_local_choice` | D |
| the correlation | odd, in neither local record | `corr_odd`, `correlation_is_not_in_the_local_records` | A |
| a local strategy | $\pm2$ exactly | `chsh_values`, `local_strategies_give_two` | B |
| a local model | Bell's bound | `bell_bound` | B |
| a maximal no-signalling box | 4, signalling nothing | `pr_box_reaches_four`, `pr_box_signals_nothing` | E |
| the singlet | $2\sqrt2$ | computed | C |
| the measured violations | above 2, below $2\sqrt2$ | corroboration | F |

\endgroup


#### E.3 A Local Relabelling Is the Fold

When Alice relabels her outcome, the joint record's rows exchange, which is an involution (`flipA_involutive`). Her bias reverses (`aliceBias_odd`) and the correlation reverses (`corr_odd`). The local carrier sends her relabelling to the seat's reflection (`local_carrier_equivariant`). Her local record lands on the line exactly when it is unbiased (`unbiased_is_the_line`). A maximally entangled pair puts every local record on the line: the twin finds the singlet's local records unbiased to $10^{-16}$ at 100,000 settings.


#### E.4 No Signal Is the Wall

Bob's record, his own outcome counts, does not move when Alice relabels (`bob_sees_no_flip`). Whether Alice relabels is odd and Bob's record even, so no function of Bob's record returns her choice (`no_signal_from_a_local_choice`). This is no-signalling in exact form. Whatever Alice does on her side is a fold, and the far record is blind to every fold, as an even reading is blind to an odd target. The twin confirms it on the singlet: Bob's marginal is one half at every setting of Alice's.


#### E.5 The Correlation Lives in the Joint Registration

Two joint records, one perfectly correlated and one perfectly anticorrelated, have the same unbiased record for Alice and the same for Bob, and opposite correlations. No function of the two local records returns the correlation (`correlation_is_not_in_the_local_records`). The correlation is a property of the joint registration alone, two worlds over one pair of local records. That is what entanglement is on the seat. Each local outcome is a keyed bit supplied by its own act, as Least Erasure proves (Islam, 2026a). The correlation is the relation between the two acts, and it appears only when the two records are registered together.


#### E.6 Bell's Bound Is a Count of Local Strategies

A local strategy fixes each party's outcome for each of two settings. The CHSH combination of its four correlations is $\pm2$ for every one of the sixteen strategies (`chsh_values`, `local_strategies_give_two`). Every mixture with nonnegative weights stays within twice its total weight (`bell_bound`). Bell's inequality (Bell, 1964; Clauser, Horne, Shimony and Holt, 1969) is this count and nothing more: an account that gives each party a local record of answers in advance cannot exceed 2. The twin draws 100,000 random mixtures, and every one stays within 2.

No-signalling alone allows more. A box whose outcomes agree unless both settings are 1 has unbiased local records for every setting and signals nothing (`pr_box_signals_nothing`), and it reaches 4 (`pr_box_reaches_four`; Popescu and Rohrlich, 1994).


#### E.7 The Quantum Value and the Measured Values

The singlet's correlation at settings $a$ and $b$ is $-\cos(a-b)$. The twin reaches $2\sqrt2=2.828427$ at the optimal settings, and no one of 100,000 random settings exceeds it, the bound Tsirelson proved (Tsirelson, 1980). The measured values:

| Experiment | CHSH value | Above 2 |
|---|---|---|
| Aspect, Grangier and Roger, 1982 | $2.697\pm0.015$ | 46.5σ |
| Weihs et al., 1998 | $2.73\pm0.02$ | 36.5σ |
| Hensen et al., 2015, loophole-free | $2.42\pm0.20$ | 2.1σ |
| Storz et al., 2023, loophole-free | $2.0747\pm0.0033$ | 22.6σ |

Every one lies above the local count and below $2\sqrt2$.

The world's joint records are not mixtures of local ones. Its local records never signal.


#### E.8 What the Pair Carries, and What It Does Not

**What it carries.**

- The local relabelling as the fold and the unbiased local record as the line.
- No signal as the wall.
- The correlation in the joint registration alone.
- Bell's bound as a count of local strategies, and the measured violations.

**What it does not carry.**

- **The value $2\sqrt2$ from the seat:** it is computed from the singlet and imported as Tsirelson's theorem.
- **A local record of the correlation:** there is none.


#### E.9 Falsifiers

Three falsifiers, each a forbidden observation naming the theorem it would break.

- **F-Signal:** a local operation on one party that changes the far party's own outcome counts. It breaks `bob_sees_no_flip` and `no_signal_from_a_local_choice` read physically.
- **F-Local:** a CHSH value above 2 reproduced by a model assigning each party its outcomes in advance. It breaks `bell_bound`.
- **F-Tsirelson:** a measured CHSH value above $2\sqrt2$ on quantum systems. It breaks the imported bound and the twin's computation of the singlet.

## 12. Closure

The law of correlation between two separated parties is no longer informal prose. From a ring of readings and a linear record on it, and nothing more, Lean 4 with Mathlib compiles no signal under every complete far operation, the value of every table and the whole reach of local records, the square of the correlation as four less the product of two commutators, eight less $2\sqrt2$ times the correlation as a sum of two squares, the bound of $2\sqrt2$ for every record that is not negative on squares, the bound of two when the readings of one party commute, an explicit pair of size four that reaches $2\sqrt2$, and its outcome as one bit that neither record holds alone. No axiom is declared. No proof is left open. No headline theorem closes by its own hypothesis or over a structure that carries its conclusion.

No signal is recovered from the registration, with no state named. Bell's bound is recovered as the whole reach of local records, every value within it reached. Tsirelson's bound is recovered for every record of every ring, and the step between the two bounds is located: it is a pair of readings that do not commute, held by each party. The numerical twin executes the identities on one hundred thousand random records and settings, finds nothing that the theorems forbid, and sets two rivals against four published experiments: the local bound, passed by all four and by more than five uncertainties in three, and the value four of no signal alone, which none approaches.

Every boundary is in plain sight. That readings of separated parties commute is one field of one printed structure. That what is registered is a linear record, not negative on squares, is three more fields of the same structure. That a local account is a weighted family of tables is Fine's theorem, cited. That the pairs of nature are the pair of the model is read from experiment. Which outcome occurs is not derived, here or anywhere in the paper.

That structure is not an arbitrary postulate. The two statements the reading rests on, Existence and Least Erasure, are theorems in their own domain: each has its own compiled Lean file, with no axiom declared, listed in the Lean Library Reference. There they are proved. The Heat Bridge, which joins erasure to heat, is a theorem there as well; the bridge spoken of below is a different one, from that domain to physics. Here they are used, and the difference is stated. Between that domain and the algebra of readings lies a physical bridge: that what exists is what is registered, that a registration adds, and that two parties are separate when their readings commute. This paper does not claim the bridge as a theorem. It writes the bridge down as `Premises`, so that the engine imports nothing outside Mathlib and can be checked alone, and so that a reader can see exactly which sentence carries the physics.

Two things are therefore separate, and the paper keeps them separate. Inside the kernel, the implication from `Premises` to no signal and to the two bounds is a mathematical certainty. No experiment, no consensus and no later revision of physics alters it, and anyone can recheck it with one compilation. Outside the kernel stand three falsifiers. They test whether nature satisfies the premises, and so far nature does. What survives both is not opinion. It is a theorem, and a physics that has met every test of its premises.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file and the Fortran twin are written by a language model under the author's direct supervision. Every theorem named in the text of Sections 1 to 10 and 12 is in Appendix A under that name, and its kernel line is printed in Appendix D. Classical results that are cited and not formalised are named as such in Section 1.3 and wherever they are used. No constant of nature is derived anywhere in this paper; the numbers of the twin are computed from random data and from measured inputs, which Appendix B prints.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1. J. S. Bell, Physics 1 (1964) 195.
2. J. F. Clauser, M. A. Horne, A. Shimony and R. A. Holt, Phys. Rev. Lett. 23 (1969) 880.
3. B. S. Tsirelson, Lett. Math. Phys. 4 (1980) 93.
4. A. Aspect, P. Grangier and G. Roger, Phys. Rev. Lett. 49 (1982) 91.
5. S. Popescu and D. Rohrlich, Found. Phys. 24 (1994) 379.
6. G. Weihs et al., Phys. Rev. Lett. 81 (1998) 5039.
7. B. Hensen et al., Nature 526 (2015) 682.
8. S. Storz et al., Nature 617 (2023) 265.
9. M. Born, Z. Phys. 37 (1926) 863.
10. A. Einstein, B. Podolsky and N. Rosen, Phys. Rev. 47 (1935) 777.
11. E. Schrödinger, Naturwissenschaften 23 (1935) 807.
12. D. Bohm, Phys. Rev. 85 (1952) 166.
13. G. C. Ghirardi, A. Rimini and T. Weber, Lett. Nuovo Cimento 27 (1980) 293.
14. A. Fine, Phys. Rev. Lett. 48 (1982) 291.
15. L. J. Landau, Phys. Lett. A 120 (1987) 54.
16. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
17. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
18. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its engine uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main, read at commit 38f6678.

19. Root Axiom and Existence: Publication Library/Philosophy/Metaphysics/Root Axiom/TOE_Zero.lean. Compiled alone in core Lean 4.19.0, exit 0.
20. RH master: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_44_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.
21. Existence, as carried in the RH master: line 6635.
22. Heat Bridge: RH master, Parts VII-c and VII-d.
23. Prime Freedom: RH master, Parts XIII and XIV.
24. Freedom Arrow: RH master, Part XV.
25. Least Erasure: protocols/RH One Bit/Nothing Escapes Three Plus One/Least_Erasure.lean. Compiled alone in core Lean 4.19.0, exit 0.
26. Second Law: Publication Library/Mathematics/Mathematical Physics/Second_Law_Theorem_v1_0_0_CC.pdf, with its Lean file printed inside.
27. P versus NP master: FINAL_BINDING/PNP Binding/PNP_Normal_Form_Paper_v1_14_0_CC.lean
28. ZFC seal: lean/ZFC_Block_Hardened_FINAL_v2_0_0_Hermetically_Sealed.lean
29. No Second Sovereign: Publication Library/Mathematics/Millennium Series/No_Second_Sovereign_v1_0_0_CC.lean
30. Future Proof Empirical Witness Seal: Publication Library/Mathematics/Millennium Series/Future_Proof_Empirical_Witness_Seal_v1_0_0_CC.lean

## Appendix A · SPHYS_Correlation_Forced_CC.lean

Lean 4.19.0 with Mathlib 4.19.0. 43 theorems, no axiom declared, no `sorry`, exit 0 with no warning. The kernel lines are Appendix D.

```lean
/-
SPHYS_Correlation_Forced_CC.lean · no signal, the reach of local records, and the reach of the quantum, on real algebra
RATIONALE. The engine of edition 1.0.0 proved its statements over small structures of integers. This file replaces
  it. A record is a linear functional on a ring of readings, a far operation is a family of elements of that ring,
  a local account is a weighted family of tables over an ordered field, and the pair of the quantum is a set of
  matrices. Nothing else is assumed.
DESIGN. Parts, in order.
    Part I    The registration. `no_signal_from_a_far_reading`, `no_signal_from_a_far_operation`: the near record
              does not move, whatever complete reading or operation the far party performs.
    Part II   Local records. `table_is_plus_or_minus_two`, `local_records_stay_within_two`,
              `every_value_within_two_is_reached`: Bell's bound is the whole reach of local records.
    Part III  Four readings in a ring, two near and two far, each of square one, near commuting with far.
              `square_of_the_correlation`: S² = 4 − [A₀, A₁][B₀, B₁]. `commuting_readings_give_four`.
              `anticommuting_readings_give_zero_or_eight`. `sum_of_two_squares`: 8 − 2r S is a sum of two squares
              when r² = 2. `quantum_reach`: every record positive on those squares has |S| at most 2r.
    Part IV   The pair of the quantum, as matrices of size four over any commutative ring. `model_readings`,
              `model_reaches`: the singlet is carried to minus four times itself. `model_outcomes`: at equal
              settings the two outcomes never agree and each alone is fair.
    Part V    `Premises`; `no_signal_forced`; `reach_forced`; `quantumPremises`: the structure is inhabited over
              the reals, and its member reaches the bound.
WHAT IS NOT PROVED HERE (read before citing).
    (a) That a record is a linear functional, positive on squares of readings, and that the readings of two parties
        commute. These are the fields of `Premises`.
    (b) That nature's pairs are the pair of Part IV. It is read from experiment.
    (c) Which outcome occurs. Part IV proves each is fair alone; nothing here selects one.
RISK. Finite families throughout. The bound of Part III is stated for records positive on two named squares.
  No magnitude is derived.
NON-NEGOTIABLE. No axiom is declared, no sorry. No headline theorem closes over a structure that carries its
  conclusion. The kernel line of every theorem the paper names is printed at the end.
-/
import Mathlib.Data.Matrix.Notation
import Mathlib.Data.Matrix.Mul
import Mathlib.Algebra.Algebra.Basic
import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Algebra.Order.BigOperators.Ring.Finset
import Mathlib.Data.Real.Sqrt
import Mathlib.Data.Real.Star
import Mathlib.Data.Matrix.ConjTranspose
import Mathlib.Algebra.Star.Module
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Ring
import Mathlib.Tactic.NoncommRing
import Mathlib.Tactic.Module
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity

namespace SPHYS.Correlation

/-! ## Part I. The registration forces no signal -/

section Registration
variable {R : Type*} [Ring R] {V : Type*} [AddCommGroup V] {β : Type*} [Fintype β]

/-- NO SIGNAL FROM A FAR READING. Let φ be an additive record, E a near element, and M a complete family of far
outcomes: a finite family that sums to one. The near record, summed over the far outcomes, is φ(E), whatever M is. -/
theorem no_signal_from_a_far_reading (φ : R →+ V) (E : R) (M : β → R) (hM : ∑ b, M b = 1) :
    ∑ b, φ (E * M b) = φ E := by
  rw [← map_sum, ← Finset.mul_sum, hM, mul_one]

/-- NO SIGNAL FROM A FAR OPERATION. Let the far party act by a finite family K with companions L, complete in the
sense that the sum of L b * K b is one, and let every K b commute with the near element E. The near record after
the operation, summed over its branches, is φ(E). -/
theorem no_signal_from_a_far_operation (φ : R →+ V) (E : R) (K L : β → R) (hc : ∑ b, L b * K b = 1)
    (hloc : ∀ b, K b * E = E * K b) : ∑ b, φ (L b * E * K b) = φ E := by
  have e : ∀ b, L b * E * K b = L b * K b * E := fun b => by rw [mul_assoc, ← hloc b, mul_assoc]
  simp only [e]
  rw [← map_sum, ← Finset.sum_mul, hc, one_mul]

/-- The same for two different complete families of far outcomes: the near record cannot tell them apart. -/
theorem the_near_record_reads_no_far_choice {β' : Type*} [Fintype β'] (φ : R →+ V) (E : R) (M : β → R)
    (M' : β' → R) (hM : ∑ b, M b = 1) (hM' : ∑ b, M' b = 1) : ∑ b, φ (E * M b) = ∑ b, φ (E * M' b) := by
  rw [no_signal_from_a_far_reading φ E M hM, no_signal_from_a_far_reading φ E M' hM']

end Registration

/-! ## Part II. Local records -/

section Local
variable {K : Type*} [Field K] [LinearOrder K] [IsStrictOrderedRing K]

/-- The correlation of four answers. -/
def chsh (a0 a1 b0 b1 : K) : K := a0 * b0 + a0 * b1 + a1 * b0 - a1 * b1

/-- A TABLE GIVES PLUS OR MINUS TWO. If each of the four answers is plus or minus one, the correlation is plus or
minus two. -/
theorem table_is_plus_or_minus_two (a0 a1 b0 b1 : K) (h0 : a0 = 1 ∨ a0 = -1) (h1 : a1 = 1 ∨ a1 = -1)
    (h2 : b0 = 1 ∨ b0 = -1) (h3 : b1 = 1 ∨ b1 = -1) : chsh a0 a1 b0 b1 = 2 ∨ chsh a0 a1 b0 b1 = -2 := by
  unfold chsh
  rcases h0 with rfl | rfl <;> rcases h1 with rfl | rfl <;> rcases h2 with rfl | rfl <;>
    rcases h3 with rfl | rfl <;> norm_num

/-- LOCAL RECORDS STAY WITHIN TWO. A local account is a finite family of tables with weights that are not negative
and sum to one. Its correlation lies between minus two and two. -/
theorem local_records_stay_within_two {Λ : Type*} [Fintype Λ] (w a0 a1 b0 b1 : Λ → K) (hw : ∀ l, 0 ≤ w l)
    (hsum : ∑ l, w l = 1) (h0 : ∀ l, a0 l = 1 ∨ a0 l = -1) (h1 : ∀ l, a1 l = 1 ∨ a1 l = -1)
    (h2 : ∀ l, b0 l = 1 ∨ b0 l = -1) (h3 : ∀ l, b1 l = 1 ∨ b1 l = -1) :
    -2 ≤ ∑ l, w l * chsh (a0 l) (a1 l) (b0 l) (b1 l) ∧ ∑ l, w l * chsh (a0 l) (a1 l) (b0 l) (b1 l) ≤ 2 := by
  have up : ∀ l, w l * chsh (a0 l) (a1 l) (b0 l) (b1 l) ≤ w l * 2 := by
    intro l
    apply mul_le_mul_of_nonneg_left _ (hw l)
    rcases table_is_plus_or_minus_two _ _ _ _ (h0 l) (h1 l) (h2 l) (h3 l) with e | e <;>
      first | exact e.le | exact e.ge | (rw [e]; norm_num)
  have lo : ∀ l, w l * (-2) ≤ w l * chsh (a0 l) (a1 l) (b0 l) (b1 l) := by
    intro l
    apply mul_le_mul_of_nonneg_left _ (hw l)
    rcases table_is_plus_or_minus_two _ _ _ _ (h0 l) (h1 l) (h2 l) (h3 l) with e | e <;>
      first | exact e.le | exact e.ge | (rw [e]; norm_num)
  constructor
  · calc (-2 : K) = ∑ l, w l * (-2) := by rw [← Finset.sum_mul, hsum, one_mul]
      _ ≤ _ := Finset.sum_le_sum (fun l _ => lo l)
  · calc _ ≤ ∑ l, w l * 2 := Finset.sum_le_sum (fun l _ => up l)
      _ = 2 := by rw [← Finset.sum_mul, hsum, one_mul]

/-- EVERY VALUE WITHIN TWO IS REACHED. For every s between minus two and two there is a local account of two
tables whose correlation is s. Bell's bound is the whole reach of local records. -/
theorem every_value_within_two_is_reached (s : K) (hlo : -2 ≤ s) (hhi : s ≤ 2) :
    ∃ w a0 a1 b0 b1 : Bool → K, (∀ l, 0 ≤ w l) ∧ ∑ l, w l = 1 ∧ (∀ l, a0 l = 1 ∨ a0 l = -1)
      ∧ (∀ l, a1 l = 1 ∨ a1 l = -1) ∧ (∀ l, b0 l = 1 ∨ b0 l = -1) ∧ (∀ l, b1 l = 1 ∨ b1 l = -1)
      ∧ ∑ l, w l * chsh (a0 l) (a1 l) (b0 l) (b1 l) = s := by
  refine ⟨fun l => if l then (2 + s) / 4 else (2 - s) / 4, fun l => if l then 1 else -1,
    fun l => if l then 1 else -1, fun _ => 1, fun _ => 1, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · intro l; cases l <;> simp <;> linarith
  · simp [Fintype.sum_bool]; ring
  · intro l; cases l <;> simp
  · intro l; cases l <;> simp
  · intro l; exact Or.inl rfl
  · intro l; exact Or.inl rfl
  · simp [Fintype.sum_bool, chsh]; ring

end Local

/-! ## Part III. Four readings in a ring -/

section Readings
variable {R : Type*} [Ring R] (A0 A1 B0 B1 : R)
variable (hA0 : A0 * A0 = 1) (hA1 : A1 * A1 = 1) (hB0 : B0 * B0 = 1) (hB1 : B1 * B1 = 1)
variable (hloc : ∀ a ∈ [A0, A1], ∀ b ∈ [B0, B1], b * a = a * b)

/-- The correlation of four readings. -/
def corr : R := A0 * B0 + A0 * B1 + A1 * B0 - A1 * B1

include hA0 hA1 hB0 hB1 hloc

/-- THE SQUARE OF THE CORRELATION. It is four, less the product of the commutator of the two near readings with
the commutator of the two far readings. -/
theorem square_of_the_correlation :
    corr A0 A1 B0 B1 * corr A0 A1 B0 B1 = 4 - (A0 * A1 - A1 * A0) * (B0 * B1 - B1 * B0) := by
  have sw : ∀ x p y q : R, p * y = y * p → x * p * (y * q) = x * y * (p * q) := by
    intro x p y q hh
    rw [mul_assoc, ← mul_assoc p, hh, mul_assoc, ← mul_assoc]
  have c : ∀ a b, a ∈ [A0, A1] → b ∈ [B0, B1] → b * a = a * b := fun a b ha hb => hloc a ha b hb
  have e4 : (4 : R) = 1 + 1 + 1 + 1 := by norm_num
  unfold corr
  rw [e4]
  simp only [add_mul, mul_add, sub_mul, mul_sub]
  rw [sw A0 B0 A0 B0 (c _ _ (by simp) (by simp)), sw A0 B0 A0 B1 (c _ _ (by simp) (by simp)),
    sw A0 B0 A1 B0 (c _ _ (by simp) (by simp)), sw A0 B0 A1 B1 (c _ _ (by simp) (by simp)),
    sw A0 B1 A0 B0 (c _ _ (by simp) (by simp)), sw A0 B1 A0 B1 (c _ _ (by simp) (by simp)),
    sw A0 B1 A1 B0 (c _ _ (by simp) (by simp)), sw A0 B1 A1 B1 (c _ _ (by simp) (by simp)),
    sw A1 B0 A0 B0 (c _ _ (by simp) (by simp)), sw A1 B0 A0 B1 (c _ _ (by simp) (by simp)),
    sw A1 B0 A1 B0 (c _ _ (by simp) (by simp)), sw A1 B0 A1 B1 (c _ _ (by simp) (by simp)),
    sw A1 B1 A0 B0 (c _ _ (by simp) (by simp)), sw A1 B1 A0 B1 (c _ _ (by simp) (by simp)),
    sw A1 B1 A1 B0 (c _ _ (by simp) (by simp)), sw A1 B1 A1 B1 (c _ _ (by simp) (by simp)),
    hA0, hA1, hB0, hB1]
  noncomm_ring

/-- READINGS THAT COMMUTE GIVE FOUR. If the two near readings commute, the square of the correlation is four: the
value of a table. What no table can hold is two readings of one party that do not commute. -/
theorem commuting_readings_give_four (h : A0 * A1 = A1 * A0) : corr A0 A1 B0 B1 * corr A0 A1 B0 B1 = 4 := by
  rw [square_of_the_correlation A0 A1 B0 B1 hA0 hA1 hB0 hB1 hloc, h, sub_self, zero_mul, sub_zero]

/-- READINGS THAT ANTICOMMUTE GIVE ZERO OR EIGHT. If the two near readings anticommute and the two far readings
anticommute, the square of the correlation, call it Q, obeys Q (Q − 8) = 0. -/
theorem anticommuting_readings_give_zero_or_eight (ha : A1 * A0 = -(A0 * A1)) (hb : B1 * B0 = -(B0 * B1)) :
    (corr A0 A1 B0 B1 * corr A0 A1 B0 B1) * (corr A0 A1 B0 B1 * corr A0 A1 B0 B1 - 8) = 0 := by
  have c : ∀ a b, a ∈ [A0, A1] → b ∈ [B0, B1] → b * a = a * b := fun a b ha hb => hloc a ha b hb
  have e4 : (4 : R) = 1 + 1 + 1 + 1 := by norm_num
  have e8 : (8 : R) = (1 + 1) * (1 + 1 + 1 + 1) := by norm_num
  rw [square_of_the_correlation A0 A1 B0 B1 hA0 hA1 hB0 hB1 hloc, ha, hb]
  have x : (A0 * A1 - -(A0 * A1)) * (B0 * B1 - -(B0 * B1)) = (1 + 1 + 1 + 1) * (A0 * A1 * (B0 * B1)) := by
    noncomm_ring
  have aa : (A0 * A1) * (A0 * A1) = -1 := by
    calc (A0 * A1) * (A0 * A1) = A0 * (A1 * A0) * A1 := by noncomm_ring
      _ = -((A0 * A0) * (A1 * A1)) := by rw [ha]; noncomm_ring
      _ = -1 := by rw [hA0, hA1, mul_one]
  have bb : (B0 * B1) * (B0 * B1) = -1 := by
    calc (B0 * B1) * (B0 * B1) = B0 * (B1 * B0) * B1 := by noncomm_ring
      _ = -((B0 * B0) * (B1 * B1)) := by rw [hb]; noncomm_ring
      _ = -1 := by rw [hB0, hB1, mul_one]
  have cc : (B0 * B1) * (A0 * A1) = (A0 * A1) * (B0 * B1) := by
    calc (B0 * B1) * (A0 * A1) = B0 * (B1 * A0) * A1 := by noncomm_ring
      _ = B0 * (A0 * B1) * A1 := by rw [c A0 B1 (by simp) (by simp)]
      _ = (B0 * A0) * (B1 * A1) := by noncomm_ring
      _ = (A0 * B0) * (A1 * B1) := by rw [c A0 B0 (by simp) (by simp), c A1 B1 (by simp) (by simp)]
      _ = A0 * (B0 * A1) * B1 := by noncomm_ring
      _ = A0 * (A1 * B0) * B1 := by rw [c A1 B0 (by simp) (by simp)]
      _ = (A0 * A1) * (B0 * B1) := by noncomm_ring
  have xx : (A0 * A1 * (B0 * B1)) * (A0 * A1 * (B0 * B1)) = 1 := by
    calc (A0 * A1 * (B0 * B1)) * (A0 * A1 * (B0 * B1))
        = (A0 * A1) * ((B0 * B1) * (A0 * A1)) * (B0 * B1) := by noncomm_ring
      _ = ((A0 * A1) * (A0 * A1)) * ((B0 * B1) * (B0 * B1)) := by rw [cc]; noncomm_ring
      _ = 1 := by rw [aa, bb]; noncomm_ring
  rw [x, e4, e8]
  generalize A0 * A1 * (B0 * B1) = T at xx ⊢
  have fin : (1 + 1 + 1 + 1 - (1 + 1 + 1 + 1) * T) * (1 + 1 + 1 + 1 - (1 + 1 + 1 + 1) * T
      - (1 + 1) * (1 + 1 + 1 + 1)) = (1 + 1 + 1 + 1) * (1 + 1 + 1 + 1) * (T * T - 1) := by noncomm_ring
  rw [fin, xx, sub_self, mul_zero]

end Readings

section Reach
variable {K : Type*} [Field K] [LinearOrder K] [IsStrictOrderedRing K] {R : Type*} [Ring R] [Algebra K R]
variable (A0 A1 B0 B1 : R)
variable (hA0 : A0 * A0 = 1) (hA1 : A1 * A1 = 1) (hB0 : B0 * B0 = 1) (hB1 : B1 * B1 = 1)
variable (hloc : ∀ a ∈ [A0, A1], ∀ b ∈ [B0, B1], b * a = a * b)
include hA0 hA1 hB0 hB1 hloc

/-- A SUM OF TWO SQUARES. Let r be a constant with r * r = 2. Then eight less 2r times the correlation is the sum
of the squares of r A₀ − (B₀ + B₁) and r A₁ − (B₀ − B₁). -/
theorem sum_of_two_squares (r : K) (hr : r * r = 2) :
    (r • A0 - (B0 + B1)) * (r • A0 - (B0 + B1)) + (r • A1 - (B0 - B1)) * (r • A1 - (B0 - B1))
      = (8 : K) • (1 : R) - (2 * r) • corr A0 A1 B0 B1 := by
  have c00 : B0 * A0 = A0 * B0 := hloc A0 (by simp) B0 (by simp)
  have c01 : B1 * A0 = A0 * B1 := hloc A0 (by simp) B1 (by simp)
  have c10 : B0 * A1 = A1 * B0 := hloc A1 (by simp) B0 (by simp)
  have c11 : B1 * A1 = A1 * B1 := hloc A1 (by simp) B1 (by simp)
  unfold corr
  simp only [sub_mul, mul_sub, add_mul, mul_add, smul_mul_assoc, mul_smul_comm, smul_smul, hA0, hA1, hB0, hB1,
    c00, c01, c10, c11, hr]
  match_scalars <;> first | ring1 | linear_combination 2 * hr

/-- THE REACH OF THE QUANTUM. Let φ be a linear record with φ(1) = 1 that is not negative on the two squares
above. Then the correlation lies between −2r and 2r, where r * r = 2 and r is positive: the square of the
correlation is at most eight. -/
theorem quantum_reach (φ : R →ₗ[K] K) (h1 : φ 1 = 1) (r : K) (hr : r * r = 2) (hr0 : 0 < r)
    (hP : 0 ≤ φ ((r • A0 - (B0 + B1)) * (r • A0 - (B0 + B1))))
    (hQ : 0 ≤ φ ((r • A1 - (B0 - B1)) * (r • A1 - (B0 - B1)))) :
    φ (corr A0 A1 B0 B1) ≤ 2 * r := by
  have e := congrArg φ (sum_of_two_squares A0 A1 B0 B1 hA0 hA1 hB0 hB1 hloc r hr)
  rw [map_add, map_sub, map_smul, map_smul, h1, smul_eq_mul, smul_eq_mul, mul_one] at e
  have h : 0 ≤ 8 - 2 * r * φ (corr A0 A1 B0 B1) := by rw [← e]; exact add_nonneg hP hQ
  nlinarith

end Reach

/-! ## Part III-b. A record that is positive, and readings of one party that commute -/

section Positive
variable {R : Type*} [Ring R] [StarRing R] [Algebra ℝ R] [StarModule ℝ R]

/-- THE SQUARE OF A RECORD IS AT MOST THE RECORD OF THE SQUARE. For a linear record φ with φ(1) = 1 that is not
negative on every star X * X, and a reading S with star S = S. -/
theorem record_squared_le (φ : R →ₗ[ℝ] ℝ) (h1 : φ 1 = 1) (hpos : ∀ X, 0 ≤ φ (star X * X)) (S : R)
    (hS : star S = S) : φ S * φ S ≤ φ (S * S) := by
  have hX : star (S - (φ S) • (1 : R)) = S - (φ S) • (1 : R) := by
    rw [star_sub, star_smul, star_one, hS, star_trivial]
  have h := hpos (S - (φ S) • (1 : R))
  rw [hX] at h
  have e : (S - (φ S) • (1 : R)) * (S - (φ S) • (1 : R))
      = S * S - (2 * φ S) • S + (φ S * φ S) • (1 : R) := by
    simp only [sub_mul, mul_sub, smul_mul_assoc, mul_smul_comm, smul_smul, one_mul, mul_one]
    module
  rw [e, map_add, map_sub, map_smul, map_smul, h1, smul_eq_mul, smul_eq_mul] at h
  nlinarith

end Positive

/-! ## Part IV. The pair of the quantum, as matrices of size four -/

section Model
variable {K : Type*} [CommRing K]

/-- The near reading along the first axis. Rows and columns are ordered: both up, near up and far down, near down
and far up, both down. -/
def nZ : Matrix (Fin 4) (Fin 4) K := !![1, 0, 0, 0; 0, 1, 0, 0; 0, 0, -1, 0; 0, 0, 0, -1]
/-- The near reading along the second axis. -/
def nX : Matrix (Fin 4) (Fin 4) K := !![0, 0, 1, 0; 0, 0, 0, 1; 1, 0, 0, 0; 0, 1, 0, 0]
/-- The far reading along the first axis. -/
def fZ : Matrix (Fin 4) (Fin 4) K := !![1, 0, 0, 0; 0, -1, 0, 0; 0, 0, 1, 0; 0, 0, 0, -1]
/-- The sum of the two far axes. -/
def fP : Matrix (Fin 4) (Fin 4) K := !![1, 1, 0, 0; 1, -1, 0, 0; 0, 0, 1, 1; 0, 0, 1, -1]
/-- The difference of the two far axes. -/
def fM : Matrix (Fin 4) (Fin 4) K := !![1, -1, 0, 0; -1, -1, 0, 0; 0, 0, 1, -1; 0, 0, -1, -1]
/-- The pair: near up and far down, less near down and far up. -/
def pair : Fin 4 → K := ![0, 1, -1, 0]

/-- The record of the pair on a matrix M, where s is a constant with 2 s s = 1: s s times the value of M on the
pair. -/
def rec (s : K) : Matrix (Fin 4) (Fin 4) K →ₗ[K] K where
  toFun M := s * s * (M 1 1 - M 1 2 - M 2 1 + M 2 2)
  map_add' M N := by simp only [Matrix.add_apply]; ring
  map_smul' c M := by simp only [Matrix.smul_apply, smul_eq_mul, RingHom.id_apply]; ring

/-- The record is the value on the pair. -/
theorem rec_is_the_value_on_the_pair (s : K) (M : Matrix (Fin 4) (Fin 4) K) :
    rec s M = s * s * (pair ⬝ᵥ M.mulVec pair) := by
  simp [rec, pair, Matrix.mulVec, dotProduct, Fin.sum_univ_four]; ring

theorem nZ_sq : (nZ : Matrix (Fin 4) (Fin 4) K) * nZ = 1 := by
  ext a b; fin_cases a <;> fin_cases b <;> simp [nZ, Matrix.mul_apply, Fin.sum_univ_four, Matrix.one_apply]
theorem nX_sq : (nX : Matrix (Fin 4) (Fin 4) K) * nX = 1 := by
  ext a b; fin_cases a <;> fin_cases b <;> simp [nX, Matrix.mul_apply, Fin.sum_univ_four, Matrix.one_apply]
theorem fP_sq : (fP : Matrix (Fin 4) (Fin 4) K) * fP = (2 : K) • 1 := by
  ext a b; fin_cases a <;> fin_cases b <;>
    simp [fP, Matrix.mul_apply, Fin.sum_univ_four, Matrix.one_apply] <;> norm_num
theorem fM_sq : (fM : Matrix (Fin 4) (Fin 4) K) * fM = (2 : K) • 1 := by
  ext a b; fin_cases a <;> fin_cases b <;>
    simp [fM, Matrix.mul_apply, Fin.sum_univ_four, Matrix.one_apply] <;> norm_num
theorem near_anticommute : (nX : Matrix (Fin 4) (Fin 4) K) * nZ = -(nZ * nX) := by
  ext a b; fin_cases a <;> fin_cases b <;> simp [nZ, nX, Matrix.mul_apply, Fin.sum_univ_four]
theorem far_anticommute : (fM : Matrix (Fin 4) (Fin 4) K) * fP = -(fP * fM) := by
  ext a b; fin_cases a <;> fin_cases b <;>
    simp [fP, fM, Matrix.mul_apply, Fin.sum_univ_four]
theorem fP_nZ : (fP : Matrix (Fin 4) (Fin 4) K) * nZ = nZ * fP := by
  ext a b; fin_cases a <;> fin_cases b <;> simp [nZ, fP, Matrix.mul_apply, Fin.sum_univ_four]
theorem fP_nX : (fP : Matrix (Fin 4) (Fin 4) K) * nX = nX * fP := by
  ext a b; fin_cases a <;> fin_cases b <;> simp [nX, fP, Matrix.mul_apply, Fin.sum_univ_four]
theorem fM_nZ : (fM : Matrix (Fin 4) (Fin 4) K) * nZ = nZ * fM := by
  ext a b; fin_cases a <;> fin_cases b <;> simp [nZ, fM, Matrix.mul_apply, Fin.sum_univ_four]
theorem fM_nX : (fM : Matrix (Fin 4) (Fin 4) K) * nX = nX * fM := by
  ext a b; fin_cases a <;> fin_cases b <;> simp [nX, fM, Matrix.mul_apply, Fin.sum_univ_four]

variable (s : K)

/-- The two far readings of the model: the two diagonals between the axes, turned to face the pair. -/
def mB0 : Matrix (Fin 4) (Fin 4) K := (-s) • fP
def mB1 : Matrix (Fin 4) (Fin 4) K := (-s) • fM

/-- THE READINGS OF THE MODEL. Each of the four squares to one, near commutes with far, the two near readings
anticommute and the two far readings anticommute. -/
theorem model_readings (hs : 2 * s * s = 1) :
    (nZ : Matrix (Fin 4) (Fin 4) K) * nZ = 1 ∧ (nX : Matrix (Fin 4) (Fin 4) K) * nX = 1
      ∧ mB0 s * mB0 s = 1 ∧ mB1 s * mB1 s = 1
      ∧ (∀ a ∈ [(nZ : Matrix (Fin 4) (Fin 4) K), nX], ∀ b ∈ [mB0 s, mB1 s], b * a = a * b)
      ∧ (nX : Matrix (Fin 4) (Fin 4) K) * nZ = -(nZ * nX) ∧ mB1 s * mB0 s = -(mB0 s * mB1 s) := by
  have k : -s * -s * 2 = 1 := by linear_combination hs
  refine ⟨nZ_sq, nX_sq, ?_, ?_, ?_, near_anticommute, ?_⟩
  · unfold mB0; rw [smul_mul_smul_comm, fP_sq, smul_smul, k, one_smul]
  · unfold mB1; rw [smul_mul_smul_comm, fM_sq, smul_smul, k, one_smul]
  · intro a ha b hb
    simp only [List.mem_cons, List.mem_singleton, List.not_mem_nil, or_false] at ha hb
    rcases ha with rfl | rfl <;> rcases hb with rfl | rfl <;>
      simp only [mB0, mB1, smul_mul_assoc, mul_smul_comm, fP_nZ, fP_nX, fM_nZ, fM_nX]
  · unfold mB0 mB1; rw [smul_mul_smul_comm, smul_mul_smul_comm, far_anticommute, smul_neg]

/-- THE MODEL REACHES THE BOUND. The correlation of the four readings carries the pair to 4 s times itself, and
the record of the correlation is 4 s. With 2 s s = 1, the square of 4 s is eight. -/
theorem model_reaches (hs : 2 * s * s = 1) :
    (corr nZ nX (mB0 s) (mB1 s)).mulVec pair = (4 * s) • (pair : Fin 4 → K)
      ∧ rec s (corr nZ nX (mB0 s) (mB1 s)) = 4 * s ∧ (4 * s) * (4 * s) = 8 := by
  refine ⟨?_, ?_, by linear_combination 8 * hs⟩
  · ext i; fin_cases i <;>
      simp [corr, nZ, nX, mB0, mB1, fP, fM, pair, Matrix.mulVec, dotProduct, Fin.sum_univ_four,
        Matrix.mul_apply] <;> ring
  · simp [rec, corr, nZ, nX, mB0, mB1, fP, fM, Matrix.mul_apply, Fin.sum_univ_four]
    linear_combination (4 * s) * hs

/-- The four outcomes of reading both parties along the first axis. -/
def nearUp : Matrix (Fin 4) (Fin 4) K := !![1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 0, 0; 0, 0, 0, 0]
def nearDown : Matrix (Fin 4) (Fin 4) K := !![0, 0, 0, 0; 0, 0, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1]
def farUp : Matrix (Fin 4) (Fin 4) K := !![1, 0, 0, 0; 0, 0, 0, 0; 0, 0, 1, 0; 0, 0, 0, 0]
def farDown : Matrix (Fin 4) (Fin 4) K := !![0, 0, 0, 0; 0, 1, 0, 0; 0, 0, 0, 0; 0, 0, 0, 1]

/-- The outcomes are complete readings of the first axis. -/
theorem outcomes_are_complete :
    (nearUp : Matrix (Fin 4) (Fin 4) K) + nearDown = 1 ∧ (farUp : Matrix (Fin 4) (Fin 4) K) + farDown = 1
      ∧ (nearUp : Matrix (Fin 4) (Fin 4) K) - nearDown = nZ ∧ (farUp : Matrix (Fin 4) (Fin 4) K) - farDown = fZ := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;> ext a b <;> fin_cases a <;> fin_cases b <;>
    simp [nearUp, nearDown, farUp, farDown, nZ, fZ, Matrix.one_apply]

/-- THE OUTCOME IS ONE KEYED BIT. Read both parties of the pair along the same axis. The two outcomes never
agree: the record of up with up is zero and of down with down is zero. Each outcome alone has record one half.
Either party's outcome is fair alone and is fixed by the partner's. -/
theorem model_outcomes (hs : 2 * s * s = 1) :
    rec s (nearUp * farUp) = 0 ∧ rec s (nearDown * farDown) = 0
      ∧ 2 * rec s (nearUp * farDown) = 1 ∧ 2 * rec s (nearDown * farUp) = 1
      ∧ 2 * rec s nearUp = 1 ∧ 2 * rec s nearDown = 1 ∧ 2 * rec s farUp = 1 ∧ 2 * rec s farDown = 1 := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩ <;>
    simp [rec, nearUp, nearDown, farUp, farDown, Matrix.mul_apply, Fin.sum_univ_four] <;>
    linear_combination hs

end Model

/-! ## Part V. The theorem -/

/-- The premises. Four readings in a star ring over the reals, two near and two far; each squares to one and is
its own star; near commutes with far; the record is linear, takes one to one, and is not negative on any
star X * X. Nothing else is assumed. -/
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

namespace Premises
variable {R : Type*} [Ring R] [StarRing R] [Algebra ℝ R] [StarModule ℝ R] (P : Premises R)

/-- The correlation of the premises. -/
def S : R := corr P.A0 P.A1 P.B0 P.B1

/-- NO SIGNAL, FORCED. Whatever complete operation the far party performs with elements that commute with a near
element E, the near record is unchanged. -/
theorem no_signal_forced {β : Type*} [Fintype β] (E : R) (K L : β → R) (hc : ∑ b, L b * K b = 1)
    (hloc : ∀ b, K b * E = E * K b) : ∑ b, P.record (L b * E * K b) = P.record E :=
  no_signal_from_a_far_operation P.record.toAddMonoidHom E K L hc hloc

/-- The two outcomes of a reading b: half of one plus b, and half of one less b. -/
noncomputable def out (b : R) (e : Bool) : R := (1 / 2 : ℝ) • (1 + (if e then b else -b))

omit [StarRing R] [StarModule ℝ R] in
theorem out_complete (b : R) : out b true + out b false = 1 := by
  unfold out; simp only [if_true, Bool.false_eq_true, if_false]; module

omit [StarRing R] [StarModule ℝ R] in
theorem out_square (b : R) (hb : b * b = 1) (e : Bool) : out b e * out b e = out b e := by
  unfold out
  cases e <;>
    simp only [if_true, Bool.false_eq_true, if_false, smul_mul_assoc, mul_smul_comm, smul_smul, add_mul, mul_add,
      one_mul, mul_one, neg_mul_neg, hb] <;> module

/-- NO SIGNAL BETWEEN THE READINGS OF THE PREMISES. Let the far party read either of its readings, with either
outcome registered. The near record of either near reading, summed over the two far outcomes, is what it was.
Only the fields of the premises are used. -/
theorem no_signal_on_the_premises (a : R) (ha : a ∈ [P.A0, P.A1]) (b : R) (hb : b ∈ [P.B0, P.B1]) :
    ∑ e : Bool, P.record (out b e * a * out b e) = P.record a := by
  have hb1 : b * b = 1 := P.square_one b (by
    simp only [List.mem_cons, List.mem_singleton, List.not_mem_nil, or_false] at hb ⊢; tauto)
  have c := P.separate a ha b hb
  apply P.no_signal_forced a (out b) (out b)
  · simp only [out_square b hb1, Fintype.sum_bool, out_complete]
  · intro e; unfold out
    cases e <;>
      simp only [if_true, Bool.false_eq_true, if_false, smul_mul_assoc, mul_smul_comm, add_mul, mul_add, one_mul,
        mul_one, neg_mul, mul_neg, c]

/-- THE REACH, FORCED. The record of the correlation lies between minus 2√2 and 2√2. -/
theorem reach_forced : -(2 * Real.sqrt 2) ≤ P.record P.S ∧ P.record P.S ≤ 2 * Real.sqrt 2 := by
  have hr : Real.sqrt 2 * Real.sqrt 2 = 2 := Real.mul_self_sqrt (by norm_num)
  have hr0 : (0 : ℝ) < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
  have a0 := P.square_one P.A0 (by simp); have a1 := P.square_one P.A1 (by simp)
  have b0 := P.square_one P.B0 (by simp); have b1 := P.square_one P.B1 (by simp)
  have s0 := P.own_star P.A0 (by simp); have s1 := P.own_star P.A1 (by simp)
  have t0 := P.own_star P.B0 (by simp); have t1 := P.own_star P.B1 (by simp)
  constructor
  · -- the same bound for the far readings with their signs turned
    have nb0 : (-P.B0) * (-P.B0) = 1 := by rw [neg_mul_neg, b0]
    have nb1 : (-P.B1) * (-P.B1) = 1 := by rw [neg_mul_neg, b1]
    have nloc : ∀ a ∈ [P.A0, P.A1], ∀ b ∈ [-P.B0, -P.B1], b * a = a * b := by
      intro a ha b hb
      simp only [List.mem_cons, List.mem_singleton, List.not_mem_nil, or_false] at hb
      rcases hb with rfl | rfl
      · rw [neg_mul, mul_neg, P.separate a ha P.B0 (by simp)]
      · rw [neg_mul, mul_neg, P.separate a ha P.B1 (by simp)]
    have hP := P.positive (Real.sqrt 2 • P.A0 - (-P.B0 + -P.B1))
    have hQ := P.positive (Real.sqrt 2 • P.A1 - (-P.B0 - -P.B1))
    have eP : star (Real.sqrt 2 • P.A0 - (-P.B0 + -P.B1)) = Real.sqrt 2 • P.A0 - (-P.B0 + -P.B1) := by
      simp only [star_sub, star_add, star_neg, star_smul, star_trivial, s0, t0, t1]
    have eQ : star (Real.sqrt 2 • P.A1 - (-P.B0 - -P.B1)) = Real.sqrt 2 • P.A1 - (-P.B0 - -P.B1) := by
      simp only [star_sub, star_neg, star_smul, star_trivial, s1, t0, t1]
    rw [eP] at hP; rw [eQ] at hQ
    have h := quantum_reach P.A0 P.A1 (-P.B0) (-P.B1) a0 a1 nb0 nb1 nloc P.record P.whole (Real.sqrt 2) hr hr0
      hP hQ
    have e : corr P.A0 P.A1 (-P.B0) (-P.B1) = -P.S := by unfold S corr; noncomm_ring
    rw [e, map_neg] at h
    linarith
  · have hP := P.positive (Real.sqrt 2 • P.A0 - (P.B0 + P.B1))
    have hQ := P.positive (Real.sqrt 2 • P.A1 - (P.B0 - P.B1))
    have eP : star (Real.sqrt 2 • P.A0 - (P.B0 + P.B1)) = Real.sqrt 2 • P.A0 - (P.B0 + P.B1) := by
      simp only [star_sub, star_add, star_smul, star_trivial, s0, t0, t1]
    have eQ : star (Real.sqrt 2 • P.A1 - (P.B0 - P.B1)) = Real.sqrt 2 • P.A1 - (P.B0 - P.B1) := by
      simp only [star_sub, star_smul, star_trivial, s1, t0, t1]
    rw [eP] at hP; rw [eQ] at hQ
    exact quantum_reach P.A0 P.A1 P.B0 P.B1 a0 a1 b0 b1 P.separate P.record P.whole (Real.sqrt 2) hr hr0 hP hQ

/-- THE SQUARE IS AT MOST EIGHT. -/
theorem square_at_most_eight : P.record P.S * P.record P.S ≤ 8 := by
  have hr : Real.sqrt 2 * Real.sqrt 2 = 2 := Real.mul_self_sqrt (by norm_num)
  obtain ⟨lo, hi⟩ := P.reach_forced
  nlinarith

/-- THE CORRELATION IS ITS OWN STAR. -/
theorem S_own_star : star P.S = P.S := by
  have s0 := P.own_star P.A0 (by simp); have s1 := P.own_star P.A1 (by simp)
  have t0 := P.own_star P.B0 (by simp); have t1 := P.own_star P.B1 (by simp)
  unfold S corr
  simp only [star_sub, star_add, star_mul, s0, s1, t0, t1, P.separate P.A0 (by simp) P.B0 (by simp),
    P.separate P.A0 (by simp) P.B1 (by simp), P.separate P.A1 (by simp) P.B0 (by simp),
    P.separate P.A1 (by simp) P.B1 (by simp)]

/-- READINGS THAT COMMUTE STAY WITHIN TWO. If the two near readings commute, the record of the correlation lies
between minus two and two: the bound of local records, inside the same premises. To pass two, one party must
hold two readings that do not commute. -/
theorem commuting_readings_stay_within_two (h : P.A0 * P.A1 = P.A1 * P.A0) :
    -2 ≤ P.record P.S ∧ P.record P.S ≤ 2 := by
  have sq : P.S * P.S = 4 := commuting_readings_give_four P.A0 P.A1 P.B0 P.B1 (P.square_one _ (by simp))
    (P.square_one _ (by simp)) (P.square_one _ (by simp)) (P.square_one _ (by simp)) P.separate h
  have k := record_squared_le P.record P.whole P.positive P.S P.S_own_star
  have four : P.record (4 : R) = 4 := by
    have : (4 : R) = 1 + 1 + 1 + 1 := by norm_num
    rw [this, map_add, map_add, map_add, P.whole]; norm_num
  rw [sq, four] at k
  constructor <;> nlinarith

/-- PASSING TWO FORCES READINGS THAT DO NOT COMMUTE. -/
theorem passing_two_forces_readings_that_do_not_commute (h : 2 < P.record P.S) :
    P.A0 * P.A1 ≠ P.A1 * P.A0 := fun e => absurd (P.commuting_readings_stay_within_two e).2 (not_le.mpr h)

/-- THE TWO PARTIES EXCHANGED. The premises with near and far exchanged are premises, with the same correlation. -/
def swap : Premises R where
  A0 := P.B0
  A1 := P.B1
  B0 := P.A0
  B1 := P.A1
  square_one := fun x hx => P.square_one x (by
    simp only [List.mem_cons, List.mem_singleton, List.not_mem_nil, or_false] at hx ⊢; tauto)
  own_star := fun x hx => P.own_star x (by
    simp only [List.mem_cons, List.mem_singleton, List.not_mem_nil, or_false] at hx ⊢; tauto)
  separate := fun a ha b hb => (P.separate b hb a ha).symm
  record := P.record
  whole := P.whole
  positive := P.positive

theorem swap_S : P.swap.S = P.S := by
  show corr P.B0 P.B1 P.A0 P.A1 = corr P.A0 P.A1 P.B0 P.B1
  unfold corr
  rw [P.separate P.A0 (by simp) P.B0 (by simp), P.separate P.A1 (by simp) P.B0 (by simp),
    P.separate P.A0 (by simp) P.B1 (by simp), P.separate P.A1 (by simp) P.B1 (by simp)]
  abel

/-- THE SAME FOR THE FAR PARTY. If the two far readings commute, the record of the correlation lies between minus
two and two. -/
theorem commuting_far_readings_stay_within_two (h : P.B0 * P.B1 = P.B1 * P.B0) :
    -2 ≤ P.record P.S ∧ P.record P.S ≤ 2 := by
  have k := P.swap.commuting_readings_stay_within_two h
  rw [P.swap_S] at k
  exact k

/-- PASSING TWO FORCES BOTH PARTIES. A record of the correlation above two forces the two near readings not to
commute, and the two far readings not to commute. -/
theorem passing_two_forces_both_parties (h : 2 < P.record P.S) :
    P.A0 * P.A1 ≠ P.A1 * P.A0 ∧ P.B0 * P.B1 ≠ P.B1 * P.B0 :=
  ⟨P.passing_two_forces_readings_that_do_not_commute h,
    P.swap.passing_two_forces_readings_that_do_not_commute (by rw [P.swap_S]; exact h)⟩

end Premises

/-! ### The premises are inhabited, and their member reaches the bound -/

/-- A LOCAL ACCOUNT IS A MEMBER WHOSE READINGS ALL COMMUTE. A weighted family of tables is a member of the
premises: the ring is the ring of functions on the tables, and the record is the weighted sum. -/
noncomputable def localPremises {Λ : Type*} [Fintype Λ] (w a0 a1 b0 b1 : Λ → ℝ) (hw : ∀ l, 0 ≤ w l)
    (hsum : ∑ l, w l = 1) (h0 : ∀ l, a0 l = 1 ∨ a0 l = -1) (h1 : ∀ l, a1 l = 1 ∨ a1 l = -1)
    (h2 : ∀ l, b0 l = 1 ∨ b0 l = -1) (h3 : ∀ l, b1 l = 1 ∨ b1 l = -1) : Premises (Λ → ℝ) where
  A0 := a0
  A1 := a1
  B0 := b0
  B1 := b1
  square_one := by
    intro x hx
    simp only [List.mem_cons, List.mem_singleton, List.not_mem_nil, or_false] at hx
    funext l
    rcases hx with rfl | rfl | rfl | rfl
    · rcases h0 l with e | e <;> simp [e]
    · rcases h1 l with e | e <;> simp [e]
    · rcases h2 l with e | e <;> simp [e]
    · rcases h3 l with e | e <;> simp [e]
  own_star := fun x _ => by funext l; simp
  separate := fun a _ b _ => mul_comm b a
  record :=
    { toFun := fun f => ∑ l, w l * f l
      map_add' := fun f g => by simp [mul_add, Finset.sum_add_distrib]
      map_smul' := fun c f => by simp [Finset.mul_sum, mul_left_comm] }
  whole := by simpa using hsum
  positive := fun X => Finset.sum_nonneg fun l _ => mul_nonneg (hw l) (by simpa using mul_self_nonneg (X l))

/-- The record of the local member is the weighted sum of its tables, and it lies within two by the theorem on
readings that commute: Bell's bound, reached a second way. -/
theorem local_member_stays_within_two {Λ : Type*} [Fintype Λ] (w a0 a1 b0 b1 : Λ → ℝ) (hw : ∀ l, 0 ≤ w l)
    (hsum : ∑ l, w l = 1) (h0 : ∀ l, a0 l = 1 ∨ a0 l = -1) (h1 : ∀ l, a1 l = 1 ∨ a1 l = -1)
    (h2 : ∀ l, b0 l = 1 ∨ b0 l = -1) (h3 : ∀ l, b1 l = 1 ∨ b1 l = -1) :
    (localPremises w a0 a1 b0 b1 hw hsum h0 h1 h2 h3).record (localPremises w a0 a1 b0 b1 hw hsum h0 h1 h2 h3).S
        = ∑ l, w l * chsh (a0 l) (a1 l) (b0 l) (b1 l)
      ∧ -2 ≤ ∑ l, w l * chsh (a0 l) (a1 l) (b0 l) (b1 l) ∧ ∑ l, w l * chsh (a0 l) (a1 l) (b0 l) (b1 l) ≤ 2 := by
  have e : (localPremises w a0 a1 b0 b1 hw hsum h0 h1 h2 h3).record
      (localPremises w a0 a1 b0 b1 hw hsum h0 h1 h2 h3).S = ∑ l, w l * chsh (a0 l) (a1 l) (b0 l) (b1 l) := rfl
  have k := (localPremises w a0 a1 b0 b1 hw hsum h0 h1 h2 h3).commuting_readings_stay_within_two (mul_comm _ _)
  rw [e] at k
  exact ⟨e, k⟩

/-- The constant of the model over the reals: half the square root of two. -/
noncomputable def sR : ℝ := Real.sqrt 2 / 2

theorem sR_spec : 2 * sR * sR = 1 := by
  have hr : Real.sqrt 2 * Real.sqrt 2 = 2 := Real.mul_self_sqrt (by norm_num)
  unfold sR; nlinarith

/-- The record of the pair is not negative on star X * X. -/
theorem rec_positive (X : Matrix (Fin 4) (Fin 4) ℝ) : 0 ≤ rec sR (star X * X) := by
  have e : rec sR (star X * X) = sR * sR * ((X 0 1 - X 0 2) ^ 2 + (X 1 1 - X 1 2) ^ 2 + (X 2 1 - X 2 2) ^ 2
      + (X 3 1 - X 3 2) ^ 2) := by
    simp only [rec, LinearMap.coe_mk, AddHom.coe_mk, Matrix.mul_apply, Matrix.star_apply, Fin.sum_univ_four,
      star_trivial]
    ring
  rw [e]; exact mul_nonneg (mul_self_nonneg _) (by positivity)

/-- THE PREMISES ARE INHABITED. The pair of Part IV, over the reals. -/
noncomputable def quantumPremises : Premises (Matrix (Fin 4) (Fin 4) ℝ) where
  A0 := nZ
  A1 := nX
  B0 := mB0 sR
  B1 := mB1 sR
  square_one := by
    obtain ⟨h1, h2, h3, h4, -⟩ := model_readings sR sR_spec
    intro x hx
    simp only [List.mem_cons, List.mem_singleton, List.not_mem_nil, or_false] at hx
    rcases hx with rfl | rfl | rfl | rfl <;> assumption
  own_star := by
    intro x hx
    simp only [List.mem_cons, List.mem_singleton, List.not_mem_nil, or_false] at hx
    rcases hx with rfl | rfl | rfl | rfl <;> ext a b <;> fin_cases a <;> fin_cases b <;>
      simp [nZ, nX, mB0, mB1, fP, fM, Matrix.star_apply]
  separate := (model_readings sR sR_spec).2.2.2.2.1
  record := rec sR
  whole := by simp [rec, Matrix.one_apply]; linear_combination sR_spec
  positive := rec_positive

/-- THE BOUND IS REACHED. The member's record of the correlation is 2√2, and its two near readings do not
commute. -/
theorem the_bound_is_reached :
    quantumPremises.record quantumPremises.S = 2 * Real.sqrt 2
      ∧ quantumPremises.A0 * quantumPremises.A1 ≠ quantumPremises.A1 * quantumPremises.A0 := by
  have e : quantumPremises.record quantumPremises.S = 2 * Real.sqrt 2 := by
    have := (model_reaches sR sR_spec).2.1
    show rec sR (corr nZ nX (mB0 sR) (mB1 sR)) = _
    rw [this]; unfold sR; ring
  refine ⟨e, ?_⟩
  apply Premises.passing_two_forces_readings_that_do_not_commute
  rw [e]
  have : (1 : ℝ) < Real.sqrt 2 := by
    rw [show (1 : ℝ) = Real.sqrt 1 by simp]; exact Real.sqrt_lt_sqrt (by norm_num) (by norm_num)
  linarith

end SPHYS.Correlation

#print axioms SPHYS.Correlation.no_signal_from_a_far_reading
#print axioms SPHYS.Correlation.no_signal_from_a_far_operation
#print axioms SPHYS.Correlation.the_near_record_reads_no_far_choice
#print axioms SPHYS.Correlation.table_is_plus_or_minus_two
#print axioms SPHYS.Correlation.local_records_stay_within_two
#print axioms SPHYS.Correlation.every_value_within_two_is_reached
#print axioms SPHYS.Correlation.square_of_the_correlation
#print axioms SPHYS.Correlation.commuting_readings_give_four
#print axioms SPHYS.Correlation.anticommuting_readings_give_zero_or_eight
#print axioms SPHYS.Correlation.sum_of_two_squares
#print axioms SPHYS.Correlation.quantum_reach
#print axioms SPHYS.Correlation.record_squared_le
#print axioms SPHYS.Correlation.rec_is_the_value_on_the_pair
#print axioms SPHYS.Correlation.nZ_sq
#print axioms SPHYS.Correlation.nX_sq
#print axioms SPHYS.Correlation.fP_sq
#print axioms SPHYS.Correlation.fM_sq
#print axioms SPHYS.Correlation.near_anticommute
#print axioms SPHYS.Correlation.far_anticommute
#print axioms SPHYS.Correlation.fP_nZ
#print axioms SPHYS.Correlation.fP_nX
#print axioms SPHYS.Correlation.fM_nZ
#print axioms SPHYS.Correlation.fM_nX
#print axioms SPHYS.Correlation.model_readings
#print axioms SPHYS.Correlation.model_reaches
#print axioms SPHYS.Correlation.outcomes_are_complete
#print axioms SPHYS.Correlation.model_outcomes
#print axioms SPHYS.Correlation.Premises.no_signal_forced
#print axioms SPHYS.Correlation.Premises.reach_forced
#print axioms SPHYS.Correlation.Premises.square_at_most_eight
#print axioms SPHYS.Correlation.Premises.S_own_star
#print axioms SPHYS.Correlation.Premises.commuting_readings_stay_within_two
#print axioms SPHYS.Correlation.Premises.passing_two_forces_readings_that_do_not_commute
#print axioms SPHYS.Correlation.localPremises
#print axioms SPHYS.Correlation.local_member_stays_within_two
#print axioms SPHYS.Correlation.sR_spec
#print axioms SPHYS.Correlation.rec_positive
#print axioms SPHYS.Correlation.quantumPremises
#print axioms SPHYS.Correlation.the_bound_is_reached
#print axioms SPHYS.Correlation.Premises.out_complete
#print axioms SPHYS.Correlation.Premises.out_square
#print axioms SPHYS.Correlation.Premises.no_signal_on_the_premises
#print axioms SPHYS.Correlation.Premises.swap_S
#print axioms SPHYS.Correlation.Premises.passing_two_forces_both_parties
#print axioms SPHYS.Correlation.Premises.commuting_far_readings_stay_within_two
```

## Appendix B · Correlation_Forced_Twin_CC.f90

Sixteen checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix C.

```fortran
! Correlation_Forced_Twin_CC.f90 · twin of SPHYS_Correlation_Forced_CC.lean
! RATIONALE. The engine proves its statements in every ring and for every record. This twin executes them in
!   floating point on random readings, random records and enumerated tables, as an independent run; searches for
!   what the engine proves cannot exist; and sets two rival bounds against four published experiments.
! DESIGN. Readings are real matrices of size four: a near reading at angle a is cos(a) Z + sin(a) X on the first
!   factor, a far reading the same on the second. A record is a random positive matrix of trace one, or a random
!   vector. Double precision; one generator, fixed seed.
! CONVENTION. An identity holds when its largest residual over the run is below 1e-10. A rival bound is excluded
!   by a measurement that lies further from it than five of its stated uncertainties.
! NON-NEGOTIABLE. The twin never predicts which outcome occurs. It checks identities, bounds and frequencies only.
! RISK. The four measured values are inputs, printed with their sources in the paper. The search of section C
!   covers readings in one plane; the engine's theorem covers every reading that squares to one.
program correlation_twin
  implicit none
  integer, parameter :: i8 = selected_int_kind(18), dp = kind(1.0d0)
  integer(i8) :: seed = 20260622_i8
  integer :: checks = 0, failures = 0
  real(dp), parameter :: pi = 3.14159265358979323846d0
  real(dp) :: Id(4,4), ZI(4,4), XI(4,4), IZ(4,4), IX(4,4)
  call setup()
  call registration()
  call tables()
  call readings()
  call outcome()
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
  function rnd(n) result(k)                        ! integers in 0..n-1
    integer, intent(in) :: n
    integer :: k
    seed = mod(seed * 6364136223846793005_i8 + 1442695040888963407_i8, 9223372036854775807_i8)
    k = int(mod(abs(seed / 65536_i8), int(n, i8)))
  end function
  function uni() result(u)
    real(dp) :: u
    u = (rnd(1000000) + 0.5d0)/1.0d6
  end function
  subroutine setup()
    integer :: i
    Id = 0; ZI = 0; XI = 0; IZ = 0; IX = 0
    do i = 1, 4
      Id(i,i) = 1
    end do
    ZI(1,1) = 1; ZI(2,2) = 1; ZI(3,3) = -1; ZI(4,4) = -1
    IZ(1,1) = 1; IZ(2,2) = -1; IZ(3,3) = 1; IZ(4,4) = -1
    XI(1,3) = 1; XI(2,4) = 1; XI(3,1) = 1; XI(4,2) = 1
    IX(1,2) = 1; IX(2,1) = 1; IX(3,4) = 1; IX(4,3) = 1
  end subroutine
  function near(a) result(m)
    real(dp), intent(in) :: a
    real(dp) :: m(4,4)
    m = cos(a)*ZI + sin(a)*XI
  end function
  function far(b) result(m)
    real(dp), intent(in) :: b
    real(dp) :: m(4,4)
    m = cos(b)*IZ + sin(b)*IX
  end function
  function tr(m) result(t)
    real(dp), intent(in) :: m(4,4)
    real(dp) :: t
    t = m(1,1) + m(2,2) + m(3,3) + m(4,4)
  end function
  function randstate() result(rho)                 ! a random positive matrix of trace one
    real(dp) :: rho(4,4), g(4,4)
    integer :: i, j
    do i = 1, 4
      do j = 1, 4
        g(i,j) = 2*uni() - 1
      end do
    end do
    rho = matmul(g, transpose(g))
    rho = rho/tr(rho)
  end function
  function corr(a0, a1, b0, b1) result(s)
    real(dp), intent(in) :: a0, a1, b0, b1
    real(dp) :: s(4,4), n0(4,4), n1(4,4), f0(4,4), f1(4,4)
    n0 = near(a0); n1 = near(a1); f0 = far(b0); f1 = far(b1)
    s = matmul(n0, f0) + matmul(n0, f1) + matmul(n1, f0) - matmul(n1, f1)
  end function
  subroutine registration()
    integer :: i, k
    real(dp) :: rho(4,4), e(4,4), f(4,4), q(4,4), kr(4,4,3), lsum(4,4), worst1, worst2, acc, c, s, t
    worst1 = 0; worst2 = 0
    do i = 1, 100000
      rho = randstate(); e = (Id + near(2*pi*uni()))/2
      ! a complete far reading at a random angle: the near record summed over the two far outcomes
      f = far(2*pi*uni()); q = (Id + f)/2
      acc = tr(matmul(rho, matmul(e, q))) + tr(matmul(rho, matmul(e, Id - q)))
      worst1 = max(worst1, abs(acc - tr(matmul(rho, e))))
      ! a far operation of three branches K with K1'K1 + K2'K2 + K3'K3 = 1: a far turn mixed with two far readings
      c = uni(); s = sqrt(1 - c); c = sqrt(c); t = 2*pi*uni()
      kr(:,:,1) = c*(cos(t)*Id + sin(t)*matmul(IZ, IX))
      kr(:,:,2) = s*q
      kr(:,:,3) = s*(Id - q)
      acc = 0; lsum = 0
      do k = 1, 3
        acc = acc + tr(matmul(rho, matmul(transpose(kr(:,:,k)), matmul(e, kr(:,:,k)))))
        lsum = lsum + matmul(transpose(kr(:,:,k)), kr(:,:,k))
      end do
      worst2 = max(worst2, abs(acc - tr(matmul(rho, e))), maxval(abs(lsum - Id)))
    end do
    write(*,'(A)') ' A. The registration, on 100000 random records, near readings and far settings'
    write(*,'(A,ES9.2,A,ES9.2)') '   largest change of the near record: far reading ', worst1, '   far operation ', worst2
    call check('a complete far reading leaves the near record', worst1 < 1.0d-10)
    call check('a complete far operation of three branches leaves the near record', worst2 < 1.0d-10)
  end subroutine
  subroutine tables()
    integer :: a0, a1, b0, b1, s, bad, i, j, n, nt, v(16)
    real(dp) :: w, tot, wt, target, got, worst
    bad = 0; nt = 0
    do a0 = -1, 1, 2
      do a1 = -1, 1, 2
        do b0 = -1, 1, 2
          do b1 = -1, 1, 2
            s = a0*b0 + a0*b1 + a1*b0 - a1*b1
            nt = nt + 1; v(nt) = s
            if (abs(s) /= 2) bad = bad + 1
          end do
        end do
      end do
    end do
    write(*,'(A)') ' B. Local records'
    call check('all sixteen tables give plus or minus two', bad == 0 .and. nt == 16)
    bad = 0
    do i = 1, 100000
      n = 1 + rnd(12); tot = 0; wt = 0
      do j = 1, n
        w = uni(); tot = tot + w*v(1 + rnd(16)); wt = wt + w
      end do
      if (abs(tot/wt) > 2 + 1.0d-12) bad = bad + 1
    end do
    call check('100000 random weighted families of tables stay within two', bad == 0)
    worst = 0
    do i = 0, 400
      target = -2 + i*0.01d0
      got = (2 + target)/4*2 + (2 - target)/4*(-2)        ! the two tables of the engine, with its weights
      worst = max(worst, abs(got - target))
    end do
    call check('every value from -2 to 2 in steps of 0.01 is reached by two tables', worst < 1.0d-12)
  end subroutine
  subroutine readings()
    integer :: i
    real(dp) :: a0, a1, b0, b1, s(4,4), s2(4,4), ca(4,4), cb(4,4), n0(4,4), n1(4,4), f0(4,4), f1(4,4), p(4,4), &
                q(4,4), rho(4,4), r, w1, w2, w3, smax, cmax, val, psi(4), tsir, e8(4,4), pmax
    r = sqrt(2.0d0); tsir = 2*r
    w1 = 0; w2 = 0; smax = 0; cmax = 0; w3 = 0; pmax = 0
    psi = [0.0d0, 1.0d0, -1.0d0, 0.0d0]
    do i = 1, 100000
      a0 = 2*pi*uni(); a1 = 2*pi*uni(); b0 = 2*pi*uni(); b1 = 2*pi*uni()
      n0 = near(a0); n1 = near(a1); f0 = far(b0); f1 = far(b1)
      s = corr(a0, a1, b0, b1); s2 = matmul(s, s)
      ca = matmul(n0, n1) - matmul(n1, n0); cb = matmul(f0, f1) - matmul(f1, f0)
      w1 = max(w1, maxval(abs(s2 - (4*Id - matmul(ca, cb)))))
      p = r*n0 - (f0 + f1); q = r*n1 - (f0 - f1)
      w2 = max(w2, maxval(abs(matmul(p, p) + matmul(q, q) - (8*Id - 2*r*s))))
      rho = randstate()
      val = tr(matmul(rho, s)); smax = max(smax, abs(val))
      pmax = max(pmax, abs(dot_product(psi, matmul(s, psi))/2))
      ! the two near readings made to commute: the second equal to the first, or its reverse
      if (mod(i, 2) == 0) then
        s = corr(a0, a0, b0, b1)
      else
        s = corr(a0, a0 + pi, b0, b1)
      end if
      cmax = max(cmax, abs(tr(matmul(rho, s))))
      ! the two near readings at right angles, and the two far readings at right angles
      s = corr(a0, a0 + pi/2, b0, b0 + pi/2); s2 = matmul(s, s); e8 = 8*Id
      w3 = max(w3, maxval(abs(matmul(s2, s2 - e8))))
    end do
    write(*,'(A)') ' C. Four readings, 100000 random settings and records'
    write(*,'(A,ES9.2,A,ES9.2,A,ES9.2)') '   largest residual: square ', w1, '   two squares ', w2, '   zero or eight ', w3
    call check('the square of the correlation is four less the product of the two commutators', w1 < 1.0d-10)
    call check('eight less 2*sqrt(2) times the correlation is the sum of the two squares', w2 < 1.0d-10)
    call check('readings at right angles on both sides: the square is zero or eight', w3 < 1.0d-10)
    write(*,'(A,F9.6,A,F9.6,A,F9.6)') '   largest record of the correlation: random records ', smax, &
         '   the pair ', pmax, '   2*sqrt(2) = ', tsir
    call check('no record of the correlation exceeds 2*sqrt(2)', max(smax, pmax) <= tsir + 1.0d-10)
    write(*,'(A,F9.6)') '   largest record when the two near readings commute: ', cmax
    call check('near readings that commute stay within two, on every record', cmax <= 2 + 1.0d-10)
    s = corr(0.0d0, pi/2, 5*pi/4, 3*pi/4)                  ! the far readings of the engine: -(Z+X)/r and -(Z-X)/r
    val = dot_product(psi, matmul(s, psi))/2
    write(*,'(A,F9.6)') '   the pair at the settings of the engine: ', val
    call check('the pair of the engine reaches 2*sqrt(2), and is carried to that multiple of itself', &
               abs(val - tsir) < 1.0d-12 .and. maxval(abs(matmul(s, psi) - tsir*psi)) < 1.0d-12)
  end subroutine
  subroutine outcome()
    real(dp) :: psi(4), nu(4,4), nd(4,4), fu(4,4), fd(4,4), puu, pdd, pud, pdu, a, worst
    integer :: i
    psi = [0.0d0, 1.0d0, -1.0d0, 0.0d0]
    worst = 0
    do i = 1, 1000
      a = 2*pi*uni()                                       ! both parties read along the same random axis
      nu = (Id + near(a))/2; nd = Id - nu; fu = (Id + far(a))/2; fd = Id - fu
      puu = dot_product(psi, matmul(matmul(nu, fu), psi))/2; pdd = dot_product(psi, matmul(matmul(nd, fd), psi))/2
      pud = dot_product(psi, matmul(matmul(nu, fd), psi))/2; pdu = dot_product(psi, matmul(matmul(nd, fu), psi))/2
      worst = max(worst, abs(puu), abs(pdd), abs(pud - 0.5d0), abs(pdu - 0.5d0))
    end do
    write(*,'(A)') ' D. The outcome, the pair read along 1000 random common axes'
    call check('the two outcomes never agree, and each alone is one half', worst < 1.0d-12)
  end subroutine
  subroutine measured()
    real(dp) :: val(4), sig(4), tsir, pr(2,2,2,2), s, m, worst
    character(40) :: nm(4)
    integer :: i, x, y, a, b
    logical :: ok
    tsir = 2*sqrt(2.0d0)
    ! the rival that keeps no signal and drops the readings: outcome a, b in {0,1} at settings x, y in {0,1},
    ! with probability one half when a + b = x y (mod 2), else zero
    s = 0; worst = 0
    do x = 0, 1
      do y = 0, 1
        do a = 0, 1
          do b = 0, 1
            pr(a+1, b+1, x+1, y+1) = merge(0.5d0, 0.0d0, mod(a + b, 2) == x*y)
            s = s + merge(1, -1, x*y == 1 .eqv. .false.)*merge(1, -1, a == b)*pr(a+1, b+1, x+1, y+1)
          end do
        end do
      end do
    end do
    do x = 0, 1
      do a = 0, 1
        m = pr(a+1, 1, x+1, 1) + pr(a+1, 2, x+1, 1)
        worst = max(worst, abs(m - (pr(a+1, 1, x+1, 2) + pr(a+1, 2, x+1, 2))))
      end do
    end do
    write(*,'(A)') ' E. Against published measurements, with two rivals'
    write(*,'(A,F7.4,A,ES9.2)') '   rival, no signal alone: correlation ', s, '   change of the near record ', worst
    call check('a table of chances with no signal and no readings reaches four', abs(s - 4) < 1.0d-12 .and. worst < 1.0d-12)
    nm = [character(40) :: 'Aspect, Grangier and Roger, 1982', 'Weihs et al., 1998', 'Hensen et al., 2015', &
          'Storz et al., 2023']
    val = [2.697d0, 2.73d0, 2.42d0, 2.0747d0]; sig = [0.015d0, 0.02d0, 0.20d0, 0.0033d0]
    ok = .true.
    do i = 1, 4
      write(*,'(A,A,F7.4,A,F6.4,A,F6.1,A,F7.1,A)') '   ', nm(i), val(i), ' +- ', sig(i), '   above two by ', (val(i) - 2)/sig(i), &
           ', below four by ', (4 - val(i))/sig(i), ' uncertainties'
      if (val(i) <= 2 .or. val(i) > tsir) ok = .false.
    end do
    call check('four experiments lie above two and not above 2*sqrt(2)', ok)
    call check('rival, local records: excluded by more than five uncertainties in three experiments, '// &
               'one of them free of loopholes', &
               count((val - 2)/sig > 5.0d0) == 3 .and. (val(4) - 2)/sig(4) > 5.0d0)
    call check('rival, no signal alone: its value four is excluded by more than five uncertainties in all four', &
               all((4 - val)/sig > 5.0d0))
  end subroutine
end program
```

## Appendix C · Run of Appendix B

```text
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
 BATTERY-JSON: {"checks":16,"failures":0}
```

## Appendix D · Kernel lines of Appendix A

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

```text
'SPHYS.Correlation.no_signal_from_a_far_reading' depends on axioms: [propext, Quot.sound]
'SPHYS.Correlation.no_signal_from_a_far_operation' depends on axioms: [propext, Quot.sound]
'SPHYS.Correlation.the_near_record_reads_no_far_choice' depends on axioms: [propext, Quot.sound]
'SPHYS.Correlation.table_is_plus_or_minus_two' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.local_records_stay_within_two' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.every_value_within_two_is_reached' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.square_of_the_correlation' depends on axioms: [propext]
'SPHYS.Correlation.commuting_readings_give_four' depends on axioms: [propext]
'SPHYS.Correlation.anticommuting_readings_give_zero_or_eight' depends on axioms: [propext]
'SPHYS.Correlation.sum_of_two_squares' depends on axioms: [propext, Quot.sound]
'SPHYS.Correlation.quantum_reach' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.record_squared_le' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.rec_is_the_value_on_the_pair' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.nZ_sq' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.nX_sq' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.fP_sq' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.fM_sq' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.near_anticommute' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.far_anticommute' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.fP_nZ' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.fP_nX' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.fM_nZ' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.fM_nX' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.model_readings' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.model_reaches' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.outcomes_are_complete' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.model_outcomes' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.Premises.no_signal_forced' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.Premises.reach_forced' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.Premises.square_at_most_eight' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.Premises.S_own_star' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.Premises.commuting_readings_stay_within_two' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.Correlation.Premises.passing_two_forces_readings_that_do_not_commute' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.Correlation.localPremises' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.local_member_stays_within_two' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.sR_spec' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.rec_positive' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.quantumPremises' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.the_bound_is_reached' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.Premises.out_complete' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.Premises.out_square' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.Premises.no_signal_on_the_premises' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.Premises.swap_S' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.Premises.passing_two_forces_both_parties' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Correlation.Premises.commuting_far_readings_stay_within_two' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
```
