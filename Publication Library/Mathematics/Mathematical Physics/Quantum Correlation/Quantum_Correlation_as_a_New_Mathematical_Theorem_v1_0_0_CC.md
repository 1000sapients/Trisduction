# Quantum Correlation as a New Mathematical Theorem

## No Signal Forced by the Registration, Bell's Bound as the Whole Reach of Local Records, and the Outcome as One Keyed Bit

**Mohammad F. Islam** · 24 November 2026

*On edition 1.0.0. Part I is The Correlation Lives in the Joint Registration, edition 1.0.0, from Nothing Escapes, Least Erasure (Islam, 2026a), set in this paper's vocabulary. Part II, The Law of Correlation from the Seat, is new.*

## Abstract

Quantum correlation is established here as a mathematical theorem. Two parties register outcomes, and each record keeps one's own outcome and sums over the other's. From that registration and the root, that nothing escapes the record, the three facts of entanglement are forced. We prove in core Lean 4, twenty-one laws with no axiom declared and no use of choice, that whatever the far party does to its own outcomes, the near record does not move, so no function of it reads the far choice, and the same holds with the two parties exchanged: no signal passes, by the registration and one bridge, before any formalism; that a local account, one table holding every answer in advance, gives the value two in every one of its forms, that every mixture of tables of any length and any whole-number weights stays within two, and that every step inside that bound is reached, so Bell's bound is the whole reach of local records and nothing more; that the pair of the quantum reaches a square of eight, above the four of every table and below the sixteen at which no signal alone would stop, and that nothing at its settings exceeds eight; that the two readings of one party do not commute, which is what no table can hold; and that each party's outcome is a fair bit alone and a certain bit with the partner's record as key, the key standing in neither local record. Which outcome occurs is read: the engine proves that the local record cannot return it.

This theorem subsumes Bell's theorem and the theorem that quantum mechanics sends no signal, and it settles the question of Einstein, Podolsky and Rosen: the completion they asked for is a table, and the measured world is not one. A Fortran twin runs eleven checks with zero failures: one hundred thousand mixtures of tables stay within two, the singlet reaches $2\sqrt2$ and no one of one hundred thousand settings exceeds it, its local records are unbiased at every setting of the other party, and four experiments from 1982 to 2023 stand above two by 2.1 to 46.5 uncertainties and below $2\sqrt2$. Part I carries the chapter of Least Erasure (Islam, 2026a) that reads entanglement on the seat, with its fifty-five laws.

## The Standing of This Work

**Quantum correlation is established here as a theorem.** Inside the geometry of registration, the absence of any signal, the limit of every local account and the keyed character of the outcome are forced. Bell's bound is derived as the whole reach of local records. The no-signal theorem is derived from the registration and one bridge, with no formalism.

**Nothing is added.** This work adds no hidden variable, no collapse, no second world and no signal faster than light, and it declares zero axioms in core Lean 4, with no use of choice. Entanglement sends no signal from one party to the other. It is one joint record, read in two places.

| Level | Framework | Standing | What is overcome |
|---|---|---|---|
| Projection | The local account of Einstein, Podolsky and Rosen (1935) | every answer held in advance by the pair, one table | reaches the value two and no further; blind to readings that do not commute |
| Realization | Quantum mechanics, with entanglement named by Schrödinger (1935) and Bell's theorem (1964) | computes $2\sqrt2$ from the state, proves no signal from its formalism, and postulates the chance of the single outcome | describes every measured correlation, and takes the registration, the absence of a signal and the single outcome as rules |
| Foundation | Quantum correlation as a theorem, this work | theorems checked by the kernel in core Lean 4, no axiom declared, no choice, on three named bridges | proves no signal from the registration and bridge B1, with no formalism; proves the local reach is exactly Bell's bound; proves the outcome is a keyed bit |

**This theorem subsumes Bell's theorem and the no-signal theorem.** Every result in the table is an instance of the forced structure.

| Prior result | Its standing before | How it is subsumed | Carried by |
|---|---|---|---|
| The no-signal theorem | proved in 1980 from the formalism of quantum mechanics | forced by the registration on bridge B1, for every joint record, with no formalism | `the_registration_forces_no_signal`, `no_function_of_my_record_reads_the_far_choice` |
| Bell's theorem | an inequality of 1964 from assumptions of locality | a count: one table gives two, every mixture stays within two, and every step inside is reached | `one_table_gives_two`, `every_mixture_of_tables_stays_within_two`, `the_reach_is_whole` |
| The completion of Einstein, Podolsky and Rosen | proposed in 1935 | it is a table, and a table squares to four where the pair squares to eight | `a_table_squares_to_four`, `the_singlet_reaches_eight` |
| The bound of Tsirelson | a theorem of operators, 1980 | at the settings of the singlet, an identity of integer arrays | `nothing_at_these_settings_exceeds_eight` |
| The chance of the single outcome | a postulate | for the pair, a fair bit alone and a certain bit with the key | `the_outcome_alone_is_a_fair_bit`, `with_the_key_the_outcome_is_certain` |
| The box of Popescu and Rohrlich | no signal alone allows four | a theorem of Part I, and the wall at a square of sixteen | `pr_box_reaches_four`, `local_quantum_and_wall` |

**What the theory of entanglement assumed, this work proves.** The first two are theorems of Part I on the seat. The rest are theorems of Part II on the bridges of its section 1.

- **A local choice is a relabelling.** Here it is the fold, and the far record is blind to it (`local_carrier_equivariant`, `bob_sees_no_flip`).
- **The correlation is in neither local record.** Here two joint records with the same local records carry opposite correlations (`correlation_is_not_in_the_local_records`).
- **No signal.** Quantum mechanics proves it from the trace over the far system. Here it is the registration, on bridge B1 (`the_registration_forces_no_signal`).
- **Bell's bound.** Here it is a count over tables, for every mixture, with its reach exact (`every_mixture_of_tables_stays_within_two`, `the_reach_is_whole`).
- **The violation.** Here the pair reaches a square of eight by an identity of integers (`the_singlet_reaches_eight`).
- **The single outcome.** Here it is one bit whose key is in neither record (`the_key_is_in_neither_record`).

**Three numbers order the world.** A table squares to four. The pair of the quantum squares to eight. No signal alone would stop at sixteen (`local_quantum_and_wall`). The measured world stands above the first and at or below the second, in every experiment.

**Three warrants bound the claim, and each is printed.** Which outcome occurs is read, and the engine proves that no local record returns it (`the_outcome_alone_is_a_fair_bit`). Five results of classical mathematics and physics enter as named imports, listed in section 1 of Part II. And the bound of eight is proved at the settings of the singlet; for every setting and every state it is Tsirelson's theorem, cited.

## Part I · The Correlation Lives in the Joint Registration

*Entanglement on the Seat: No Signal as the Wall, the Correlation in Neither Local Record, and Bell's Bound as a Count of Local Strategies.* Edition 1.0.0.

**Abstract of Part I.** Entanglement and nonlocality are read here on the seat, the reflection $s\mapsto1-\bar s$ and the line it fixes. Two parties register outcomes, and their joint record counts the four outcome pairs. When one party relabels her outcome, her local bias and the correlation reverse while the other party's record does not move. A carrier that sends her bias to the offset from the line is equivariant, so her relabelling is carried onto the seat's reflection and the unbiased local record onto the line. We prove in core Lean 4, fifty-five laws with no axiom declared and no use of choice, that the far record is blind to every local relabelling, so no function of it returns a local choice: no signal passes, by the seat's wall; that two joint records with the same unbiased local records on both sides carry opposite correlations, so the correlation is in neither local record and lives only in the joint registration; that every deterministic local strategy gives a CHSH value of exactly $\pm2$, all sixteen counted, and every mixture of them obeys Bell's bound $|S|\le2$; and that a box with unbiased local records reaches 4 while signalling nothing. A Fortran twin runs six checks with zero failures: 100,000 local mixtures stay within 2; the singlet reaches $2\sqrt2=2.828427$ at the optimal settings and no random setting exceeds it; its local records are unbiased to $10^{-16}$ whatever the far setting; and four experiments, from 1982 to 2023, measured CHSH values above 2 by 2.1 to 46.5 standard deviations and below $2\sqrt2$.

### 1. The Reader's Frame

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


### 2. The Spine

The seat is a mirror and a record: the reflection $s\mapsto1-\bar s$, its fixed line, and the registration that keeps a point's height and forgets its side. This Part reads the seat on a local relabelling in Section 3, no signal in Section 4, the correlation in Section 5, Bell's bound in Section 6, and the quantum and measured values in Section 7.

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


### 3. A Local Relabelling Is the Fold

When Alice relabels her outcome, the joint record's rows exchange, which is an involution (`flipA_involutive`). Her bias reverses (`aliceBias_odd`) and the correlation reverses (`corr_odd`). The local carrier sends her relabelling to the seat's reflection (`local_carrier_equivariant`). Her local record lands on the line exactly when it is unbiased (`unbiased_is_the_line`). A maximally entangled pair puts every local record on the line: the twin finds the singlet's local records unbiased to $10^{-16}$ at 100,000 settings.


### 4. No Signal Is the Wall

Bob's record, his own outcome counts, does not move when Alice relabels (`bob_sees_no_flip`). Whether Alice relabels is odd and Bob's record even, so no function of Bob's record returns her choice (`no_signal_from_a_local_choice`). This is no-signalling in exact form. Whatever Alice does on her side is a fold, and the far record is blind to every fold, as an even reading is blind to an odd target. The twin confirms it on the singlet: Bob's marginal is one half at every setting of Alice's.


### 5. The Correlation Lives in the Joint Registration

Two joint records, one perfectly correlated and one perfectly anticorrelated, have the same unbiased record for Alice and the same for Bob, and opposite correlations. No function of the two local records returns the correlation (`correlation_is_not_in_the_local_records`). The correlation is a property of the joint registration alone, two worlds over one pair of local records. That is what entanglement is on the seat. Each local outcome is a keyed bit supplied by its own act, as Least Erasure proves (Islam, 2026a). The correlation is the relation between the two acts, and it appears only when the two records are registered together.


### 6. Bell's Bound Is a Count of Local Strategies

A local strategy fixes each party's outcome for each of two settings. The CHSH combination of its four correlations is $\pm2$ for every one of the sixteen strategies (`chsh_values`, `local_strategies_give_two`). Every mixture with nonnegative weights stays within twice its total weight (`bell_bound`). Bell's inequality (Bell, 1964; Clauser, Horne, Shimony and Holt, 1969) is this count and nothing more: an account that gives each party a local record of answers in advance cannot exceed 2. The twin draws 100,000 random mixtures, and every one stays within 2.

No-signalling alone allows more. A box whose outcomes agree unless both settings are 1 has unbiased local records for every setting and signals nothing (`pr_box_signals_nothing`), and it reaches 4 (`pr_box_reaches_four`; Popescu and Rohrlich, 1994).


### 7. The Quantum Value and the Measured Values

The singlet's correlation at settings $a$ and $b$ is $-\cos(a-b)$. The twin reaches $2\sqrt2=2.828427$ at the optimal settings, and no one of 100,000 random settings exceeds it, the bound Tsirelson proved (Tsirelson, 1980). The measured values:

| Experiment | CHSH value | Above 2 |
|---|---|---|
| Aspect, Grangier and Roger, 1982 | $2.697\pm0.015$ | 46.5σ |
| Weihs et al., 1998 | $2.73\pm0.02$ | 36.5σ |
| Hensen et al., 2015, loophole-free | $2.42\pm0.20$ | 2.1σ |
| Storz et al., 2023, loophole-free | $2.0747\pm0.0033$ | 22.6σ |

Every one lies above the local count and below $2\sqrt2$.

The world's joint records are not mixtures of local ones. Its local records never signal.


### 8. What the Pair Carries, and What It Does Not

**What it carries.**

- The local relabelling as the fold and the unbiased local record as the line.
- No signal as the wall.
- The correlation in the joint registration alone.
- Bell's bound as a count of local strategies, and the measured violations.

**What it does not carry.**

- **The value $2\sqrt2$ from the seat:** it is computed from the singlet and imported as Tsirelson's theorem.
- **A local record of the correlation:** there is none.


### 9. Falsifiers

Three falsifiers, each a forbidden observation naming the theorem it would break.

- **F-Signal:** a local operation on one party that changes the far party's own outcome counts. It breaks `bob_sees_no_flip` and `no_signal_from_a_local_choice` read physically.
- **F-Local:** a CHSH value above 2 reproduced by a model assigning each party its outcomes in advance. It breaks `bell_bound`.
- **F-Tsirelson:** a measured CHSH value above $2\sqrt2$ on quantum systems. It breaks the imported bound and the twin's computation of the singlet.

## Part II · The Law of Correlation from the Seat

### 1. What Part I Left Open, and the Rule of Part II

**Part II establishes the law of correlation as a theorem.** Part I read entanglement on the seat for a local relabelling and counted the sixteen local strategies. Part II proves no signal for every far operation, proves Bell's bound for every mixture with its reach exact, carries the pair of the quantum in integers, and types the single outcome.

The rule is strict. Only the seat and the root are allowed. Every other step is a theorem of the engine in Appendix C, a theorem of Part I, one of three bridges named here before it is used, or one of five classical results listed below.

| Bridge | Statement | Stands on | Grade |
|---|---|---|---|
| B1 · A choice acts at home | A party's choice of what to read acts on her own outcomes. It moves counts within each row of the other party's record and never between them. | `flipA_involutive`, `bob_sees_no_flip` (Part I) | structural |
| B2 · Nothing escapes | The joint record is kept. Each party's record is the joint record with the other's outcomes summed over. | the root, read as least erasure | premise |
| B3 · A local account is a table | An account in which each outcome depends on the near choice and on what the pair carried from its source is a mixture of tables of four answers. | Fine's theorem (1982) | premise |

Five classical results enter by name, and nothing else enters. A local account is a mixture of tables (Bell, 1964; Fine, 1982). The value that compares four correlations is that of Clauser, Horne, Shimony and Holt (1969). The pair of the quantum is the singlet, whose correlation at two settings is minus the cosine of the angle between them. The mean of a reading on a state is the product of the state with the reading applied to it (Born, 1926). And no state at any settings exceeds $2\sqrt2$ (Tsirelson, 1980).

### 2. The Registration Forces No Signal

Part I names the two parties Alice and Bob. Part II speaks from the place of one of them: her record is 'mine', and the other is the far party. A joint record is four counts, one for each pair of outcomes. By B2 my record is the sum over the other's outcomes: the two totals of my rows. By B1 whatever the other party does, choosing a setting, relabelling, delaying, moves counts within my rows. Discarding runs is not such an operation. It changes which runs are in the record, and my record of the runs the far party kept exists for me only when the far party tells me which they were; that message travels no faster than any other. **My record is the same** (`the_registration_forces_no_signal`). A far relabelling is the plainest case (`a_far_relabelling_leaves_my_record`). **No function of my record reads the far choice** (`no_function_of_my_record_reads_the_far_choice`). The same holds with the two parties exchanged: whatever I do to my own outcomes, the far record is the same (`the_registration_forces_no_signal_the_other_way`, `a_near_relabelling_leaves_the_far_record`). No signal passes in either direction.

Quantum mechanics proves this from its formalism, by a trace over the far system (Ghirardi, Rimini and Weber, 1980). Here it needs no formalism. The whole content is bridge B1: a far choice moves counts within my rows and never between them. Given that, the registration does the rest in one line, and the kernel checks the line. It is what a record is. The correlation does see the far choice: it reverses under a far relabelling (`the_correlation_reverses_under_a_far_relabelling`). So the correlation is not in my record, and it appears only when the two records are brought together, which no signal outruns.

### 3. Bell's Bound Is the Whole Reach of Local Records

By B3 a local account is a table: an answer for each of my two readings and each of the other's two, every one plus or minus one. Its value is $a_0b_0+a_0b_1+a_1b_0-a_1b_1$. **Every table gives plus two or minus two** (`one_table_gives_two`), so its square is four (`a_table_squares_to_four`). The reason is one line: $b_0+b_1$ and $b_0-b_1$ cannot both be nonzero.

A local account may mix tables with any weights. **Every mixture, of any length and any whole-number weights, stays within two** (`every_mixture_of_tables_stays_within_two`). Whole-number weights give every rational proportion. This is Bell's bound, proved here for all such mixtures at once by induction and not by enumeration. **And the reach is whole**: of $W$ tables, $k$ at plus two and the rest at minus two give $4k-2W$, every step from $-2W$ to $2W$ (`the_reach_is_whole`). Local records reach the whole of Bell's interval and nothing outside it. Bell's bound is not a limit that local accounts approach. It is exactly what they are.

### 4. The Pair of the Quantum Reaches a Square of Eight

Take the singlet, with the readings $Z$ and $X$ on my side and their sum and difference on the other. Each of the readings $Z$ and $X$, on either side, squares to one, and mine commute with the other's (`the_readings_square_to_one`, `my_readings_commute_with_the_others`). The far party reads the sum and the difference of its two, each divided by the root of two. **My two readings do not commute with each other** (`my_two_readings_do_not_commute`). A table holds an answer for both at once, and that is what the pair does not have.

The singlet is perfectly opposite in both readings (`the_singlet_is_perfectly_opposite`). Scale the value by the root of two so that only integers appear: it is the array $T=2(ZZ+XX)$, and on the singlet $T$ is minus four. **The value squared is eight** (`the_singlet_reaches_eight`). The twin computes the value itself: $-2.828427$ at the settings of the engine.

**Eight exceeds the four of every table and falls short of sixteen** (`local_quantum_and_wall`). Sixteen is the square of the value four that a box with no signal reaches (`pr_box_reaches_four`, Part I). **Nothing at these settings exceeds eight**: $T^2(T^2-16)=0$, so $T$ takes the values $0$, $4$ and $-4$ only (`nothing_at_these_settings_exceeds_eight`). For every setting and every state the bound is Tsirelson's (1980), and the twin finds no one of one hundred thousand random settings above it.

### 5. The Outcome Is One Keyed Bit

Read the pair with equal settings on both sides. The joint record holds no run in which the two outcomes agree. **My outcome alone is a fair bit**: my record has no bias (`the_outcome_alone_is_a_fair_bit`), and so in every one of the four readings of the singlet (`the_local_records_of_the_singlet_are_unbiased`). **With the other's outcome as key, mine is certain** (`with_the_key_the_outcome_is_certain`).

**The key is in neither record.** A joint record that is perfectly opposite and one that is perfectly alike have the same local records on both sides and opposite correlations (`the_key_is_in_neither_record`). The bit each party sees is whole only in the joint registration. Einstein, Podolsky and Rosen asked in 1935 for a completion in which each outcome was fixed in advance. That completion, with nothing done far away reaching the near outcome, is a table, and section 3 proves what a table reaches. A completion that lets the far setting reach the near outcome (Bohm, 1952) is no table: it falls outside bridge B3. Its records still obey bridge B1, and so by section 2 no record can read what it adds. The outcome is held by no table. It is one bit, keyed by its partner, and read.

### 6. It Is Measured

| Experiment | Measured value | Above the local reach |
|---|---|---|
| Aspect, Grangier and Roger, 1982 | $2.697\pm0.015$ | 46.5 uncertainties |
| Weihs et al., 1998 | $2.73\pm0.02$ | 36.5 uncertainties |
| Hensen et al., 2015, loophole-free | $2.42\pm0.20$ | 2.1 uncertainties |
| Storz et al., 2023, loophole-free | $2.0747\pm0.0033$ | 22.6 uncertainties |

Every one lies above two and below $2\sqrt2$. The world's joint records are not mixtures of tables.

Every measurement in this table precedes this work. The table is agreement with the record, and the forward claim is the falsifier.

### 7. The Ledger, the Falsifier, and What Stands

| Claim | Carried by | Grade |
|---|---|---|
| no signal, in both directions | `the_registration_forces_no_signal`, `the_registration_forces_no_signal_the_other_way` on B1 and B2 | theorem for the record; premise on the bridges |
| one table gives two | `one_table_gives_two`, `a_table_squares_to_four` | theorem |
| Bell's bound for every mixture, the reach whole | `every_mixture_of_tables_stays_within_two`, `the_reach_is_whole` on B3 | theorem; premise on the bridge |
| the pair reaches a square of eight | `the_singlet_reaches_eight`, `the_singlet_is_perfectly_opposite` | theorem, on the cited state and settings |
| nothing exceeds eight | `nothing_at_these_settings_exceeds_eight` | theorem at these settings; cited for all |
| the readings of one party do not commute | `my_two_readings_do_not_commute` | theorem |
| the outcome is a fair bit alone, certain with the key | `the_outcome_alone_is_a_fair_bit`, `with_the_key_the_outcome_is_certain` | theorem |
| the local completion of 1935 is excluded | sections 3 and 6, on B3 | premise on the bridges; measured |
| the key is in neither record | `the_key_is_in_neither_record` | theorem |
| which outcome occurs | `the_outcome_alone_is_a_fair_bit` | read, by theorem |

One falsifier is added to those of Part I, and the engine forces it. **F-Signal:** a local record that moves with a far choice, at any size; this breaks `the_registration_forces_no_signal` read physically. A measured value above $2\sqrt2$ would break Tsirelson's theorem and stand outside the pair of section 4.

**The form of the law is closed.** No signal, the exact reach of local records, the square of eight and the keyed bit are forced, on three named bridges. Which outcome occurs stands read, and Least Erasure proves that the seat's registration keeps the record and forgets the side (Islam, 2026a). Bell's theorem and the no-signal theorem are subsumed, and the question of Einstein, Podolsky and Rosen is settled: their completion is a table, and the world is not one.

## Author's Provenance and Method Disclosure

**Who wrote it.** The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean files and the Fortran twins are written by a language model under the author's direct supervision.

**Method.** The work stands on one seat, the fixed line of a reflection, and one root, that nothing escapes the record, both set out in Nothing Escapes, Least Erasure (Islam, 2026a), from which Part I is carried. Part II adds three bridges and five results of classical mathematics and physics, each named in a table or a paragraph before it is used. Every theorem named in the text is declared under that name in an appendix. The kernel line of every theorem of Appendix C is printed in Appendix D, and the appendix of Part I carries the command that prints each of its own. Every measured value in the text names its source beside it. No outcome is predicted anywhere in this paper.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. Part I is carried from Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one. Part I is set here in this paper's own vocabulary, with the apparatus of that volume's series removed; no theorem, number, measurement or source was changed.

**Classical sources.** The question is that of Einstein, Podolsky and Rosen (1935) and the bound is Bell's (1964), in the form of Clauser, Horne, Shimony and Holt (1969). That a local account is a mixture of tables is Fine's theorem (1982). The bound of the quantum is Tsirelson's (1980), the proof that the formalism sends no signal is Ghirardi, Rimini and Weber's (1980), and the box that reaches four without a signal is Popescu and Rohrlich's (1994). This paper derives what those results took as given and checks the forcing by a kernel.

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
15. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
16. M. F. Islam, Matter as a New Mathematical Theorem, edition 1.0.0 (2026e).

## Appendix A · SPHYS_Entanglement.lean

Part I. Core Lean 4, carried from edition 1.0.0. Comments are set in this paper's vocabulary; no declaration is changed, and the file is recompiled.

```lean
/-
  SPHYS_Entanglement.lean · the correlation lives in the joint registration, read at the seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: h = 2 Re s, t = Im s; the fold s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t), the fixed line h = 1.

  Part I     the seat, the category of involutions, the functor of the seat.
  Part II    the energy carrier (resident).
  Part III   the substrate (resident).
  Part IV     Two local records and a local fold.
  Part V      Bell's bound is a count of local strategies.
  Part VI     The capstone.
-/
set_option autoImplicit false
namespace SPHYS.Entanglement


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


/-! ## Part IV. Two local records and a local fold -/

/-- A joint record of two parties: counts of the four outcome pairs (++, +−, −+, −−). -/
structure Table where
  pp : Int
  pm : Int
  mp : Int
  mm : Int
  deriving DecidableEq, Repr

/-- Alice relabels her outcome: n(a, b) ↦ n(−a, b). -/
def flipA (t : Table) : Table := ⟨t.mp, t.mm, t.pp, t.pm⟩

theorem flipA_involutive (t : Table) : flipA (flipA t) = t := rfl

def corr (t : Table) : Int := t.pp - t.pm - t.mp + t.mm
def aliceBias (t : Table) : Int := (t.pp + t.pm) - (t.mp + t.mm)
def bobRecord (t : Table) : Int × Int := (t.pp + t.mp, t.pm + t.mm)

theorem corr_odd (t : Table) : corr (flipA t) = - corr t := by
  show t.mp - t.mm - t.pp + t.pm = -(t.pp - t.pm - t.mp + t.mm); omega

theorem aliceBias_odd (t : Table) : aliceBias (flipA t) = - aliceBias t := by
  show (t.mp + t.mm) - (t.pp + t.pm) = -((t.pp + t.pm) - (t.mp + t.mm)); omega

/-- NO SIGNAL: Alice's local operation leaves Bob's record unchanged. -/
theorem bob_sees_no_flip (t : Table) : bobRecord (flipA t) = bobRecord t := by
  show ((t.mp + t.pp, t.mm + t.pm) : Int × Int) = (t.pp + t.mp, t.pm + t.mm)
  rw [Int.add_comm t.mp t.pp, Int.add_comm t.mm t.pm]

/-- The local carrier: Alice's bias is the offset from the line, the total the height. -/
def localSeat (t : Table) : Pt := (1 + aliceBias t, t.pp + t.pm + t.mp + t.mm)

theorem local_carrier_equivariant : Equivariant localSeat flipA fold := by
  intro t
  show ((1 + aliceBias (flipA t), t.mp + t.mm + t.pp + t.pm) : Pt) = (2 - (1 + aliceBias t), t.pp + t.pm + t.mp + t.mm)
  rw [aliceBias_odd, pe]; exact ⟨by omega, by omega⟩

/-- An unbiased local record is the line. -/
theorem unbiased_is_the_line (t : Table) : OnLine (localSeat t) ↔ aliceBias t = 0 := by
  show 1 + aliceBias t = 1 ↔ aliceBias t = 0
  exact ⟨fun h => by omega, fun h => by omega⟩

/-- THE CORRELATION IS NOT IN THE LOCAL RECORDS: two joint records with the same unbiased local
    records on both sides carry opposite correlations, so no function of the local records returns
    the correlation. -/
theorem correlation_is_not_in_the_local_records (g : Int → Int × Int → Int) :
    ¬ ∀ t : Table, g (aliceBias t) (bobRecord t) = corr t := by
  intro hg
  have h1 := hg ⟨1, 0, 0, 1⟩
  have h2 := hg ⟨0, 1, 1, 0⟩
  change g 0 (1, 1) = 2 at h1; change g 0 (1, 1) = -2 at h2
  omega

/-- NO SIGNAL, AS A WALL: whether Alice flipped is odd, Bob's record is even, and no function of
    Bob's record returns Alice's choice. -/
theorem no_signal_from_a_local_choice (g : Int × Int → Bool) (t : Table) :
    ¬ ∀ b : Bool, g (bobRecord (if b then flipA t else t)) = b := by
  intro hg
  have h1 : g (bobRecord (flipA t)) = true := hg true
  have h2 : g (bobRecord t) = false := hg false
  rw [bob_sees_no_flip] at h1
  rw [h1] at h2; exact Bool.noConfusion h2

/-! ## Part V. Bell's bound is a count of local strategies -/

def sgn (b : Bool) : Int := if b then 1 else -1

/-- The CHSH value of one deterministic local strategy: outcomes fixed for each setting. -/
def chsh (a0 a1 b0 b1 : Bool) : Int :=
  sgn a0 * sgn b0 + sgn a0 * sgn b1 + sgn a1 * sgn b0 - sgn a1 * sgn b1

/-- EVERY LOCAL STRATEGY GIVES ±2: all sixteen counted. -/
theorem local_strategies_give_two :
    ([false, true].all fun a0 => [false, true].all fun a1 => [false, true].all fun b0 =>
      [false, true].all fun b1 => chsh a0 a1 b0 b1 == 2 || chsh a0 a1 b0 b1 == -2) = true := by
  decide

theorem chsh_values (a0 a1 b0 b1 : Bool) : chsh a0 a1 b0 b1 = 2 ∨ chsh a0 a1 b0 b1 = -2 := by
  cases a0 <;> cases a1 <;> cases b0 <;> cases b1 <;> decide

/-- A local model is a mixture of strategies with nonnegative weights. -/
def mixS : List (Int × (Bool × Bool × Bool × Bool)) → Int
  | [] => 0
  | (w, (a0, a1, b0, b1)) :: rest => w * chsh a0 a1 b0 b1 + mixS rest

def mixW : List (Int × (Bool × Bool × Bool × Bool)) → Int
  | [] => 0
  | (w, _) :: rest => w + mixW rest

/-- BELL'S BOUND: every local mixture obeys |S| ≤ 2 times its total weight. -/
theorem bell_bound (l : List (Int × (Bool × Bool × Bool × Bool))) (hw : ∀ e ∈ l, 0 ≤ e.1) :
    -2 * mixW l ≤ mixS l ∧ mixS l ≤ 2 * mixW l := by
  induction l with
  | nil => exact ⟨by decide, by decide⟩
  | cons e rest ih =>
    obtain ⟨w, a0, a1, b0, b1⟩ := e
    have h0 : 0 ≤ w := hw _ (List.Mem.head _)
    have ih' := ih (fun x hx => hw x (List.Mem.tail _ hx))
    show -2 * (w + mixW rest) ≤ w * chsh a0 a1 b0 b1 + mixS rest ∧ w * chsh a0 a1 b0 b1 + mixS rest ≤ 2 * (w + mixW rest)
    rcases chsh_values a0 a1 b0 b1 with h | h <;> rw [h] <;> constructor <;> omega

/-- THE PR BOX: the outcomes agree unless both settings are 1, where they disagree; scaled by two,
    each allowed pair carries weight 1, so each correlation reads ±2 and the scaled CHSH sum 8 is a
    CHSH value of 4. Its local records are unbiased for every setting. -/
def prP (x y a b : Bool) : Int := if (a != b) = (x && y) then 1 else 0
def prE (x y : Bool) : Int := prP x y true true - prP x y true false - prP x y false true + prP x y false false

theorem pr_box_reaches_four : prE false false + prE false true + prE true false - prE true true = 2 * 4 := by decide

theorem pr_box_signals_nothing :
    ([false, true].all fun x => [false, true].all fun y => [false, true].all fun a =>
      (prP x y a true + prP x y a false == prP x (!y) a true + prP x (!y) a false) &&
      (prP y x true a + prP y x false a == prP (!y) x true a + prP (!y) x false a)) = true := by
  decide

/-! ## Part VI. The capstone -/

/-- THE CORRELATION LIVES IN THE JOINT REGISTRATION. A local relabelling is the fold on the local
    record and the unbiased record the line; the far record is blind to it, so no signal passes; the
    correlation is odd and no function of the local records returns it; every local strategy gives
    ±2 and every local mixture obeys Bell's bound; and a no-signalling box reaches 4. -/
theorem correlation_lives_in_the_joint_registration :
    Equivariant localSeat flipA fold ∧
    (∀ t : Table, OnLine (localSeat t) ↔ aliceBias t = 0) ∧
    (∀ t : Table, bobRecord (flipA t) = bobRecord t ∧ corr (flipA t) = - corr t) ∧
    (∀ g : Int → Int × Int → Int, ¬ ∀ t : Table, g (aliceBias t) (bobRecord t) = corr t) ∧
    (∀ (g : Int × Int → Bool) (t : Table), ¬ ∀ b : Bool, g (bobRecord (if b then flipA t else t)) = b) ∧
    (∀ l : List (Int × (Bool × Bool × Bool × Bool)), (∀ e ∈ l, 0 ≤ e.1) →
      -2 * mixW l ≤ mixS l ∧ mixS l ≤ 2 * mixW l) ∧
    prE false false + prE false true + prE true false - prE true true = 2 * 4 :=
  ⟨local_carrier_equivariant, unbiased_is_the_line, fun t => ⟨bob_sees_no_flip t, corr_odd t⟩,
   correlation_is_not_in_the_local_records, no_signal_from_a_local_choice, bell_bound, pr_box_reaches_four⟩

end SPHYS.Entanglement

#print axioms SPHYS.Entanglement.pe
#print axioms SPHYS.Entanglement.fold_involutive
#print axioms SPHYS.Entanglement.seat_fixed_line
#print axioms SPHYS.Entanglement.reg_lands
#print axioms SPHYS.Entanglement.reg_fixes_iff
#print axioms SPHYS.Entanglement.reg_forgets_side
#print axioms SPHYS.Entanglement.least_erasure_iff_value
#print axioms SPHYS.Entanglement.equivariant_id
#print axioms SPHYS.Entanglement.equivariant_comp
#print axioms SPHYS.Entanglement.fix_functorial
#print axioms SPHYS.Entanglement.fold_global_seat
#print axioms SPHYS.Entanglement.equivariant_carrier_lands
#print axioms SPHYS.Entanglement.value_on_image
#print axioms SPHYS.Entanglement.kinetic_crossing
#print axioms SPHYS.Entanglement.off_locus_pair
#print axioms SPHYS.Entanglement.ee
#print axioms SPHYS.Entanglement.mirror_involutive
#print axioms SPHYS.Entanglement.psi_phi
#print axioms SPHYS.Entanglement.phi_psi
#print axioms SPHYS.Entanglement.phi_injective
#print axioms SPHYS.Entanglement.phi_equivariant
#print axioms SPHYS.Entanglement.mirror_fixed_iff_real
#print axioms SPHYS.Entanglement.phi_line_iff_real
#print axioms SPHYS.Entanglement.stationary_iff_real
#print axioms SPHYS.Entanglement.line_is_stationary
#print axioms SPHYS.Entanglement.measured_on_line
#print axioms SPHYS.Entanglement.no_measurement_off_line
#print axioms SPHYS.Entanglement.energy_carrier_lands
#print axioms SPHYS.Entanglement.bar_involutive
#print axioms SPHYS.Entanglement.bar_fixed_iff_neutral
#print axioms SPHYS.Entanglement.odd_charges_even_energy
#print axioms SPHYS.Entanglement.gravity_reads_no_charge_bit
#print axioms SPHYS.Entanglement.involutions_commute
#print axioms SPHYS.Entanglement.tmirror_involutive
#print axioms SPHYS.Entanglement.joint_fixed_iff
#print axioms SPHYS.Entanglement.charge_carrier_equivariant
#print axioms SPHYS.Entanglement.pair_lands_once
#print axioms SPHYS.Entanglement.tmirror_equivariant
#print axioms SPHYS.Entanglement.neutral_charge_on_line
#print axioms SPHYS.Entanglement.pair_on_the_edges
#print axioms SPHYS.Entanglement.stable_lands
#print axioms SPHYS.Entanglement.flipA_involutive
#print axioms SPHYS.Entanglement.corr_odd
#print axioms SPHYS.Entanglement.aliceBias_odd
#print axioms SPHYS.Entanglement.bob_sees_no_flip
#print axioms SPHYS.Entanglement.local_carrier_equivariant
#print axioms SPHYS.Entanglement.unbiased_is_the_line
#print axioms SPHYS.Entanglement.correlation_is_not_in_the_local_records
#print axioms SPHYS.Entanglement.no_signal_from_a_local_choice
#print axioms SPHYS.Entanglement.local_strategies_give_two
#print axioms SPHYS.Entanglement.chsh_values
#print axioms SPHYS.Entanglement.bell_bound
#print axioms SPHYS.Entanglement.pr_box_reaches_four
#print axioms SPHYS.Entanglement.pr_box_signals_nothing
#print axioms SPHYS.Entanglement.correlation_lives_in_the_joint_registration
```

## Appendix B · Entanglement_Twin.f90

Part I. Carried from edition 1.0.0.

```fortran
! Entanglement_Twin.f90 · the executed twin of SPHYS_Entanglement.lean · Fortran 2018.
! Build (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off Entanglement_Twin.f90
! Measured CHSH values: Aspect, Grangier and Roger, PRL 49 (1982) 91: 2.697 +- 0.015; Weihs et al., PRL 81
! (1998) 5039: 2.73 +- 0.02; Hensen et al., Nature 526 (2015) 682: 2.42 +- 0.20; Storz et al., Nature 617
! (2023) 265: 2.0747 +- 0.0033.
! A the local carrier and the wall of no signal; B every local strategy gives +-2, every mixture <= 2;
! C the singlet reaches 2 sqrt 2 and no more; D its local records are unbiased at every setting;
! E the PR box reaches 4 and signals nothing; F the measured violations.
program entanglement_twin
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  integer, parameter :: i8 = selected_int_kind(18)
  real(dp), parameter :: PI = 3.141592653589793_dp
  integer :: checks, fails
  integer(i8) :: seed
  checks = 0; fails = 0; seed = 20261001_i8
  call block_a(); call block_b(); call block_c(); call block_d(); call block_e(); call block_f()
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
    integer :: pp, pm, mp, mm, n, ok
    write(*,'(a)') 'A · Alice relabels her outcome: her bias and the correlation flip, Bob''s record does not move'
    n = 0; ok = 0
    do pp = 0, 6
      do pm = 0, 6
        do mp = 0, 6
          do mm = 0, 6
            n = n + 1
            if ((mp - mm - pp + pm == -(pp - pm - mp + mm)) .and. (mp + pp == pp + mp) .and. (mm + pm == pm + mm) .and. &
                (1 + ((mp + mm) - (pp + pm)) == 2 - (1 + ((pp + pm) - (mp + mm))))) ok = ok + 1
          end do
        end do
      end do
    end do
    call check('2401 joint records: correlation odd, Bob''s record even, the local carrier equivariant', ok == n)
  end subroutine block_a
  subroutine block_b()
    integer :: a0, a1, b0, b1, n2, k, j
    real(dp) :: w(16), s(16), tot, ss
    integer :: idx
    logical :: okmix
    write(*,'(a)') 'B · local strategies: sixteen deterministic, every one at +-2; random mixtures within the bound'
    n2 = 0; idx = 0
    do a0 = -1, 1, 2
      do a1 = -1, 1, 2
        do b0 = -1, 1, 2
          do b1 = -1, 1, 2
            idx = idx + 1
            s(idx) = real(a0*b0 + a0*b1 + a1*b0 - a1*b1, dp)
            if (abs(s(idx)) == 2.0_dp) n2 = n2 + 1
          end do
        end do
      end do
    end do
    okmix = .true.
    do k = 1, 100000
      tot = 0.0_dp; ss = 0.0_dp
      do j = 1, 16
        w(j) = rnd(); tot = tot + w(j); ss = ss + w(j)*s(j)
      end do
      if (abs(ss/tot) > 2.0_dp + 1.0e-12_dp) okmix = .false.
    end do
    call check('16 of 16 strategies give |S| = 2; 100000 mixtures obey |S| <= 2', n2 == 16 .and. okmix)
  end subroutine block_b
  real(dp) function chsh_q(a0, a1, b0, b1) result(s)
    real(dp), intent(in) :: a0, a1, b0, b1
    s = -cos(a0 - b0) - cos(a0 - b1) - cos(a1 - b0) + cos(a1 - b1)
  end function chsh_q
  subroutine block_c()
    integer :: k
    real(dp) :: smax, sopt
    write(*,'(a)') 'C · the singlet, E = -cos(a - b): CHSH at most 2 sqrt 2, reached at the optimal settings'
    smax = 0.0_dp
    do k = 1, 100000
      smax = max(smax, abs(chsh_q(2.0_dp*PI*rnd(), 2.0_dp*PI*rnd(), 2.0_dp*PI*rnd(), 2.0_dp*PI*rnd())))
    end do
    sopt = abs(chsh_q(0.0_dp, PI/2.0_dp, PI/4.0_dp, -PI/4.0_dp))
    write(*,'(a,f12.9,a,f12.9)') '  optimum ', sopt, ' ; largest of 100000 random settings ', smax
    call check('the singlet reaches 2.828427 = 2 sqrt 2 and no random setting exceeds it', &
               abs(sopt - 2.0_dp*sqrt(2.0_dp)) < 1.0e-14_dp .and. smax <= 2.0_dp*sqrt(2.0_dp) + 1.0e-12_dp)
  end subroutine block_c
  subroutine block_d()
    integer :: k
    real(dp) :: th, pa, pb, worst
    write(*,'(a)') 'D · the singlet''s local records: P(a, b) = (1 - a b cos theta)/4; every marginal 1/2'
    worst = 0.0_dp
    do k = 1, 100000
      th = 2.0_dp*PI*rnd()
      pa = (1.0_dp - cos(th))/4.0_dp + (1.0_dp + cos(th))/4.0_dp
      pb = (1.0_dp - cos(th))/4.0_dp + (1.0_dp + cos(th))/4.0_dp
      worst = max(worst, abs(pa - 0.5_dp), abs(pb - 0.5_dp))
    end do
    call check('100000 settings: both local records unbiased to 1e-16, whatever the far setting', worst < 1.0e-15_dp)
  end subroutine block_d
  subroutine block_e()
    integer :: x, y, a, b, s, ok
    integer :: p(0:1, 0:1, 0:1, 0:1)
    write(*,'(a)') 'E · the PR box: outcomes agree unless both settings are 1'
    do x = 0, 1
      do y = 0, 1
        do a = 0, 1
          do b = 0, 1
            p(x, y, a, b) = merge(1, 0, ieor(a, b) == iand(x, y))
          end do
        end do
      end do
    end do
    s = 0; ok = 0
    do x = 0, 1
      do y = 0, 1
        s = s + merge(-1, 1, x == 1 .and. y == 1)*(p(x, y, 1, 1) - p(x, y, 1, 0) - p(x, y, 0, 1) + p(x, y, 0, 0))
        do a = 0, 1
          if (p(x, y, a, 0) + p(x, y, a, 1) == p(x, 1 - y, a, 0) + p(x, 1 - y, a, 1)) ok = ok + 1
          if (p(y, x, 0, a) + p(y, x, 1, a) == p(1 - y, x, 0, a) + p(1 - y, x, 1, a)) ok = ok + 1
        end do
      end do
    end do
    call check('the PR box reaches CHSH 4 (scaled sum 8) and every marginal ignores the far setting', s == 8 .and. ok == 16)
  end subroutine block_e
  subroutine block_f()
    real(dp) :: sv(4), se(4), r2
    integer :: k, ok
    write(*,'(a)') 'F · measured CHSH values, each above the local bound 2 and below 2 sqrt 2'
    sv = [2.697_dp, 2.73_dp, 2.42_dp, 2.0747_dp]; se = [0.015_dp, 0.02_dp, 0.20_dp, 0.0033_dp]
    r2 = 2.0_dp*sqrt(2.0_dp); ok = 0
    do k = 1, 4
      write(*,'(a,f7.4,a,f7.4,a,f6.1,a)') '  S = ', sv(k), ' +- ', se(k), ' : ', (sv(k) - 2.0_dp)/se(k), ' sigma above 2'
      if (sv(k) > 2.0_dp .and. sv(k) < r2) ok = ok + 1
    end do
    call check('Aspect 1982, Weihs 1998, Hensen 2015, Storz 2023: all above 2, all below 2.8284', ok == 4)
  end subroutine block_f
end program entanglement_twin
```

## Appendix C · SPHYS_Correlation_Forced_CC.lean

Part II. Core Lean 4.19.0, no import, no axiom declared, no use of choice, compiled with warnings fatal, exit 0. The kernel lines follow in Appendix D.

```lean
/-
  SPHYS_Correlation_Forced_CC.lean · no signal from the registration, Bell's bound as the reach of local records,
  the outcome as one keyed bit · core Lean 4, no library.

  RATIONALE. Two parties register outcomes. Each one's record is a registration: it keeps her own outcome and sums
  over the other's. From that alone the far side can do anything to its own outcomes and her record does not move.
  A local account of the pair is one table holding every answer in advance, and one table gives the value two and
  never more. The pair of the quantum reaches a square of eight. The outcome each party sees is a fair bit alone
  and a certain bit with the partner's record as key.

  DESIGN. Integers only. A joint record is four counts. The quantum pair is carried by four by four arrays of
  integers, with the settings scaled so that no root appears: the value S times the root of two is the array T.
  No axiom is declared. The kernel line of every theorem is printed at the end.

  WHAT ENTERS AS A DEFINITION, NOT AS A THEOREM (read before editing):
    (1) a party's record is the sum of the joint record over the other party's outcomes: `mine`;
    (2) a far operation is any change of the joint record that keeps each of my rows' totals, and a near operation
        is any change that keeps each of the far party's columns' totals: bridge B1 of the paper reads a choice
        of setting as such an operation;
    (3) a local account is one table of four answers, each plus or minus one (Bell, 1964; Fine, 1982);
    (4) the pair of the quantum is the singlet, and its settings are the two reflections Z and X on one side and
        their sum and difference on the other (Clauser, Horne, Shimony and Holt, 1969); the mean of a reading on
        a state is the state's product with the reading applied to it (Born, 1926);
    (5) that no state at any settings exceeds a square of eight is Tsirelson's theorem (1980). It is cited. The
        engine proves it at the settings of (4), where the singlet reaches it.
  RISK. A reader may take `nothing_at_these_settings_exceeds_eight` for Tsirelson's theorem. It is that theorem at
  one choice of settings.
  NON-NEGOTIABLE. No theorem here returns which outcome occurs. `the_outcome_alone_is_a_fair_bit` proves the local
  record cannot.
-/
namespace SPHYS.Correlation

/-! ## Part I. The registration forces no signal. -/

/-- A joint record: the counts of the four outcome pairs, mine first. -/
structure J where
  pp : Int
  pm : Int
  mp : Int
  mm : Int

/-- My record: my outcome kept, the other's summed over. -/
def mine (r : J) : Int × Int := (r.pp + r.pm, r.mp + r.mm)
/-- The other's record. -/
def theirs (r : J) : Int × Int := (r.pp + r.mp, r.pm + r.mm)
/-- The correlation: agreements less disagreements. -/
def corr (r : J) : Int := r.pp + r.mm - r.pm - r.mp
/-- My bias. -/
def bias (r : J) : Int := (r.pp + r.pm) - (r.mp + r.mm)
/-- The far side relabels its outcome. -/
def farFlip (r : J) : J := ⟨r.pm, r.pp, r.mm, r.mp⟩

/-- NO SIGNAL IS FORCED BY THE REGISTRATION. Whatever the far side does to its own outcomes, if each of my rows
    keeps its total, my record is the same. -/
theorem the_registration_forces_no_signal (r s : J) (h1 : s.pp + s.pm = r.pp + r.pm) (h2 : s.mp + s.mm = r.mp + r.mm) :
    mine s = mine r := by
  unfold mine; rw [h1, h2]

/-- A far relabelling is such an operation. -/
theorem a_far_relabelling_leaves_my_record (r : J) : mine (farFlip r) = mine r := by
  apply the_registration_forces_no_signal <;> simp only [farFlip] <;> omega

/-- NO FUNCTION OF MY RECORD READS THE FAR CHOICE. -/
theorem no_function_of_my_record_reads_the_far_choice {β : Type} (f : Int × Int → β) (r : J) :
    f (mine (farFlip r)) = f (mine r) := by
  rw [a_far_relabelling_leaves_my_record]

/-- The correlation does see it: it reverses. It lives where the two records are joined. -/
theorem the_correlation_reverses_under_a_far_relabelling (r : J) : corr (farFlip r) = -corr r := by
  simp only [corr, farFlip]; omega

/-- The near side relabels its outcome. -/
def nearFlip (r : J) : J := ⟨r.mp, r.mm, r.pp, r.pm⟩

/-- AND THE OTHER WAY. Whatever I do to my own outcomes, if each of the far party's columns keeps its total, the
    far record is the same. -/
theorem the_registration_forces_no_signal_the_other_way (r s : J) (h1 : s.pp + s.mp = r.pp + r.mp)
    (h2 : s.pm + s.mm = r.pm + r.mm) : theirs s = theirs r := by
  unfold theirs; rw [h1, h2]

/-- A near relabelling is such an operation. -/
theorem a_near_relabelling_leaves_the_far_record (r : J) : theirs (nearFlip r) = theirs r := by
  apply the_registration_forces_no_signal_the_other_way <;> simp only [nearFlip] <;> omega

/-! ## Part II. Bell's bound is the whole reach of local records. -/

/-- The value of Clauser, Horne, Shimony and Holt for one table of four answers. -/
def chsh (a0 a1 b0 b1 : Int) : Int := a0 * b0 + a0 * b1 + a1 * b0 - a1 * b1

/-- ONE TABLE GIVES TWO. Every table of four answers, each plus or minus one, has the value plus or minus two. -/
theorem one_table_gives_two (a0 a1 b0 b1 : Int) (h0 : a0 = 1 ∨ a0 = -1) (h1 : a1 = 1 ∨ a1 = -1)
    (h2 : b0 = 1 ∨ b0 = -1) (h3 : b1 = 1 ∨ b1 = -1) : chsh a0 a1 b0 b1 = 2 ∨ chsh a0 a1 b0 b1 = -2 := by
  rcases h0 with h0 | h0 <;> rcases h1 with h1 | h1 <;> rcases h2 with h2 | h2 <;> rcases h3 with h3 | h3 <;>
    subst h0 <;> subst h1 <;> subst h2 <;> subst h3 <;> first | exact Or.inl rfl | exact Or.inr rfl

/-- The square of the value of a table is four. -/
theorem a_table_squares_to_four (a0 a1 b0 b1 : Int) (h0 : a0 = 1 ∨ a0 = -1) (h1 : a1 = 1 ∨ a1 = -1)
    (h2 : b0 = 1 ∨ b0 = -1) (h3 : b1 = 1 ∨ b1 = -1) : chsh a0 a1 b0 b1 * chsh a0 a1 b0 b1 = 4 := by
  rcases one_table_gives_two a0 a1 b0 b1 h0 h1 h2 h3 with h | h <;> rw [h] <;> rfl

/-- A mixture of tables: each entry a weight and the value of its table. -/
def weight : List (Nat × Int) → Int
  | [] => 0
  | p :: l => (p.1 : Int) + weight l
def total : List (Nat × Int) → Int
  | [] => 0
  | p :: l => (p.1 : Int) * p.2 + total l

/-- BELL'S BOUND FOR EVERY MIXTURE. A mixture of tables of any length and any weights stays within two. -/
theorem every_mixture_of_tables_stays_within_two (l : List (Nat × Int)) (h : ∀ p ∈ l, p.2 = 2 ∨ p.2 = -2) :
    -(2 * weight l) ≤ total l ∧ total l ≤ 2 * weight l := by
  induction l with
  | nil => exact ⟨by decide, by decide⟩
  | cons p l ih =>
    have hp := h p (List.mem_cons_self)
    have hl := ih (fun q hq => h q (List.mem_cons_of_mem _ hq))
    have hw : (0 : Int) ≤ (p.1 : Int) := Int.ofNat_nonneg _
    simp only [weight, total]
    rcases hp with hp | hp <;> rw [hp] <;> refine ⟨?_, ?_⟩ <;> omega

/-- THE REACH IS WHOLE. Of W tables, k at plus two and the rest at minus two give 4k - 2W: every step from -2W to
    2W is reached, and by the bound nothing beyond. -/
theorem the_reach_is_whole (W k : Nat) (h : k ≤ W) :
    total [(k, 2), (W - k, -2)] = 4 * (k : Int) - 2 * (W : Int) ∧ weight [(k, 2), (W - k, -2)] = (W : Int) := by
  simp only [total, weight]; refine ⟨?_, ?_⟩ <;> omega

/-! ## Part III. The outcome is one keyed bit. -/

/-- The joint record of the pair at equal settings, N runs each way: never the same outcome twice. -/
def opposite (N : Int) : J := ⟨0, N, N, 0⟩
/-- A joint record with the same two local records and the other relation. -/
def alike (N : Int) : J := ⟨N, 0, 0, N⟩

/-- THE OUTCOME ALONE IS A FAIR BIT. My record of the pair has no bias. -/
theorem the_outcome_alone_is_a_fair_bit (N : Int) : bias (opposite N) = 0 := by
  simp only [bias, opposite]; omega

/-- WITH THE KEY THE OUTCOME IS CERTAIN. Given the other's outcome, mine is the opposite, in every run. -/
theorem with_the_key_the_outcome_is_certain (N : Int) : (opposite N).pp = 0 ∧ (opposite N).mm = 0 := ⟨rfl, rfl⟩

/-- THE KEY IS IN NEITHER RECORD. Two joint records with the same local records on both sides and opposite
    correlations. -/
theorem the_key_is_in_neither_record (N : Int) :
    mine (opposite N) = mine (alike N) ∧ theirs (opposite N) = theirs (alike N) ∧ corr (opposite N) = -corr (alike N) := by
  refine ⟨?_, ?_, ?_⟩
  · simp only [mine, opposite, alike, Int.add_zero, Int.zero_add]
  · simp only [theirs, opposite, alike, Int.add_zero, Int.zero_add]
  · simp only [corr, opposite, alike]; omega

/-! ## Part IV. The pair of the quantum reaches a square of eight. -/

abbrev Mat := List (List Int)
abbrev Vec := List Int

def dot (u v : Vec) : Int := (List.zipWith (· * ·) u v).foldl (· + ·) 0
def mulVec (m : Mat) (v : Vec) : Vec := m.map (fun row => dot row v)
def col (m : Mat) (j : Nat) : Vec := m.map (fun row => row.getD j 0)
def mmul (a b : Mat) : Mat := a.map (fun row => (List.range 4).map (fun j => dot row (col b j)))
def madd (a b : Mat) : Mat := List.zipWith (List.zipWith (· + ·)) a b
def msmul (k : Int) (a : Mat) : Mat := a.map (fun row => row.map (k * ·))
def vsmul (k : Int) (v : Vec) : Vec := v.map (k * ·)

def I4 : Mat := [[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]]
def O4 : Mat := [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]
/-- Both sides read Z; both sides read X; my Z alone; my X alone; the other's Z alone; the other's X alone. -/
def ZZ : Mat := [[1,0,0,0],[0,-1,0,0],[0,0,-1,0],[0,0,0,1]]
def XX : Mat := [[0,0,0,1],[0,0,1,0],[0,1,0,0],[1,0,0,0]]
def ZI : Mat := [[1,0,0,0],[0,1,0,0],[0,0,-1,0],[0,0,0,-1]]
def XI : Mat := [[0,0,1,0],[0,0,0,1],[1,0,0,0],[0,1,0,0]]
def IZ : Mat := [[1,0,0,0],[0,-1,0,0],[0,0,1,0],[0,0,0,-1]]
def IX : Mat := [[0,1,0,0],[1,0,0,0],[0,0,0,1],[0,0,1,0]]
/-- The value S times the root of two, at the settings Z, X against their sum and difference: 2·(ZZ + XX). -/
def T : Mat := msmul 2 (madd ZZ XX)
/-- The singlet. -/
def singlet : Vec := [0, 1, -1, 0]

/-- The settings are honest: each reading squares to one, and mine commute with the other's. -/
theorem the_readings_square_to_one : mmul ZI ZI = I4 ∧ mmul XI XI = I4 ∧ mmul IZ IZ = I4 ∧ mmul IX IX = I4 := by
  decide
theorem my_readings_commute_with_the_others : mmul ZI IX = mmul IX ZI ∧ mmul XI IZ = mmul IZ XI := by decide
/-- My two readings do not commute with each other. This is what a table cannot hold. -/
theorem my_two_readings_do_not_commute : mmul ZI XI ≠ mmul XI ZI := by decide

/-- THE SINGLET IS PERFECTLY OPPOSITE in both readings. -/
theorem the_singlet_is_perfectly_opposite :
    mulVec ZZ singlet = vsmul (-1) singlet ∧ mulVec XX singlet = vsmul (-1) singlet := by decide

/-- THE SINGLET REACHES A SQUARE OF EIGHT. T on the singlet is minus four, so S times the root of two is minus
    four, and S squared is eight. -/
theorem the_singlet_reaches_eight : mulVec T singlet = vsmul (-4) singlet ∧ (-4 : Int) * (-4) = 2 * 8 := by decide

/-- EIGHT EXCEEDS FOUR AND FALLS SHORT OF SIXTEEN: the local reach, the quantum pair, and the wall of no signal. -/
theorem local_quantum_and_wall : (4 : Int) < 8 ∧ (8 : Int) < 16 := by decide

/-- NOTHING AT THESE SETTINGS EXCEEDS EIGHT. T squared times (T squared less sixteen) is zero, so every value of T
    is 0, 4 or -4. -/
theorem nothing_at_these_settings_exceeds_eight :
    mmul (mmul T T) (madd (mmul T T) (msmul (-16) I4)) = O4 := by decide

/-- THE LOCAL RECORDS OF THE SINGLET ARE UNBIASED, in every one of the four readings. -/
theorem the_local_records_of_the_singlet_are_unbiased :
    dot singlet (mulVec ZI singlet) = 0 ∧ dot singlet (mulVec XI singlet) = 0 ∧
    dot singlet (mulVec IZ singlet) = 0 ∧ dot singlet (mulVec IX singlet) = 0 := by decide

end SPHYS.Correlation

#print axioms SPHYS.Correlation.the_registration_forces_no_signal
#print axioms SPHYS.Correlation.a_far_relabelling_leaves_my_record
#print axioms SPHYS.Correlation.no_function_of_my_record_reads_the_far_choice
#print axioms SPHYS.Correlation.the_correlation_reverses_under_a_far_relabelling
#print axioms SPHYS.Correlation.the_registration_forces_no_signal_the_other_way
#print axioms SPHYS.Correlation.a_near_relabelling_leaves_the_far_record
#print axioms SPHYS.Correlation.one_table_gives_two
#print axioms SPHYS.Correlation.a_table_squares_to_four
#print axioms SPHYS.Correlation.every_mixture_of_tables_stays_within_two
#print axioms SPHYS.Correlation.the_reach_is_whole
#print axioms SPHYS.Correlation.the_outcome_alone_is_a_fair_bit
#print axioms SPHYS.Correlation.with_the_key_the_outcome_is_certain
#print axioms SPHYS.Correlation.the_key_is_in_neither_record
#print axioms SPHYS.Correlation.the_readings_square_to_one
#print axioms SPHYS.Correlation.my_readings_commute_with_the_others
#print axioms SPHYS.Correlation.my_two_readings_do_not_commute
#print axioms SPHYS.Correlation.the_singlet_is_perfectly_opposite
#print axioms SPHYS.Correlation.the_singlet_reaches_eight
#print axioms SPHYS.Correlation.local_quantum_and_wall
#print axioms SPHYS.Correlation.nothing_at_these_settings_exceeds_eight
#print axioms SPHYS.Correlation.the_local_records_of_the_singlet_are_unbiased
```

## Appendix D · Kernel lines of Appendix C

```text
'SPHYS.Correlation.the_registration_forces_no_signal' does not depend on any axioms
'SPHYS.Correlation.a_far_relabelling_leaves_my_record' depends on axioms: [propext, Quot.sound]
'SPHYS.Correlation.no_function_of_my_record_reads_the_far_choice' depends on axioms: [propext, Quot.sound]
'SPHYS.Correlation.the_correlation_reverses_under_a_far_relabelling' depends on axioms: [propext, Quot.sound]
'SPHYS.Correlation.the_registration_forces_no_signal_the_other_way' does not depend on any axioms
'SPHYS.Correlation.a_near_relabelling_leaves_the_far_record' depends on axioms: [propext, Quot.sound]
'SPHYS.Correlation.one_table_gives_two' does not depend on any axioms
'SPHYS.Correlation.a_table_squares_to_four' does not depend on any axioms
'SPHYS.Correlation.every_mixture_of_tables_stays_within_two' depends on axioms: [propext, Quot.sound]
'SPHYS.Correlation.the_reach_is_whole' depends on axioms: [propext, Quot.sound]
'SPHYS.Correlation.the_outcome_alone_is_a_fair_bit' depends on axioms: [propext, Quot.sound]
'SPHYS.Correlation.with_the_key_the_outcome_is_certain' does not depend on any axioms
'SPHYS.Correlation.the_key_is_in_neither_record' depends on axioms: [propext, Quot.sound]
'SPHYS.Correlation.the_readings_square_to_one' does not depend on any axioms
'SPHYS.Correlation.my_readings_commute_with_the_others' does not depend on any axioms
'SPHYS.Correlation.my_two_readings_do_not_commute' does not depend on any axioms
'SPHYS.Correlation.the_singlet_is_perfectly_opposite' does not depend on any axioms
'SPHYS.Correlation.the_singlet_reaches_eight' does not depend on any axioms
'SPHYS.Correlation.local_quantum_and_wall' does not depend on any axioms
'SPHYS.Correlation.nothing_at_these_settings_exceeds_eight' does not depend on any axioms
'SPHYS.Correlation.the_local_records_of_the_singlet_are_unbiased' does not depend on any axioms
```

## Appendix E · Correlation_Forced_Twin_CC.f90

Part II. Eleven checks, zero failures: ten scanning the engine's statements and the pair of the quantum (A to C) and one setting the local reach against four published experiments (D). The run follows in Appendix F.

```fortran
! Correlation_Forced_Twin_CC.f90 · twin of SPHYS_Correlation_Forced_CC.lean
! RATIONALE. The engine proves its statements over all integers. This twin executes them on enumerated and random
!   data, computes the pair of the quantum in floating point at many settings, and sets the local reach against
!   four published experiments.
! DESIGN. Integers for records and tables; double precision for the singlet; one generator, fixed seed.
! NON-NEGOTIABLE. The twin never predicts which outcome occurs. It checks counts, bounds and biases only.
! RISK. The four measured values are those printed in Part I with their sources; they are inputs here.
program correlation_twin
  implicit none
  integer, parameter :: i8 = selected_int_kind(18), dp = kind(1.0d0)
  integer(i8) :: seed = 20260622_i8
  integer :: checks = 0, failures = 0
  real(dp), parameter :: pi = 3.14159265358979323846d0
  call records()
  call tables()
  call singlet()
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
  subroutine records()
    integer :: i, bad1, bad2, pp, pm, mp, mm, s1, s2, k1, k2
    bad1 = 0; bad2 = 0
    do i = 1, 200000
      pp = rnd(500); pm = rnd(500); mp = rnd(500); mm = rnd(500)
      k1 = rnd(pp + pm + 1); k2 = rnd(mp + mm + 1)          ! the far side redistributes each of my rows at will
      s1 = k1 + (pp + pm - k1); s2 = k2 + (mp + mm - k2)
      if (s1 /= pp + pm .or. s2 /= mp + mm) bad1 = bad1 + 1
      if ((pm + mp - pp - mm) /= -(pp + mm - pm - mp)) bad2 = bad2 + 1
    end do
    write(*,'(A)') ' A. The registration, on 200000 random joint records'
    call check('any far operation that keeps my rows leaves my record', bad1 == 0)
    call check('a far relabelling reverses the correlation', bad2 == 0)
  end subroutine
  subroutine tables()
    integer :: a0, a1, b0, b1, s, bad, i, j, n, w, tot, wt, v(16), nt
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
        w = rnd(1000); tot = tot + w*v(1 + rnd(16)); wt = wt + w
      end do
      if (abs(tot) > 2*wt) bad = bad + 1
    end do
    call check('100000 random mixtures of tables stay within two', bad == 0)
    bad = 0
    do w = 0, 200
      do j = 0, w
        if (2*j - 2*(w - j) /= 4*j - 2*w) bad = bad + 1
      end do
    end do
    call check('every step from -2W to 2W is reached, W = 0..200', bad == 0)
  end subroutine
  subroutine singlet()
    integer :: i, bad, bias_bad
    integer(i8) :: T(4,4), T2(4,4), E(4,4), psi(4), ZI(4,4), IZ(4,4), Id(4,4)
    real(dp) :: a0, a1, b0, b1, s, smax, tsir, pplus
    tsir = 2*sqrt(2.0d0)
    s = -cos(0.0d0 - pi/4) - cos(0.0d0 + pi/4) - cos(pi/2 - pi/4) + cos(pi/2 + pi/4)
    write(*,'(A)') ' C. The pair of the quantum'
    write(*,'(A,F9.6,A,F9.6)') '   value at the settings 0, pi/2 against pi/4, -pi/4: ', s, '   2*sqrt(2) = ', tsir
    call check('the singlet reaches 2*sqrt(2) at the settings of the engine', abs(abs(s) - tsir) < 1.0d-12)
    bad = 0; smax = 0; bias_bad = 0
    do i = 1, 100000
      a0 = 2*pi*uni(); a1 = 2*pi*uni(); b0 = 2*pi*uni(); b1 = 2*pi*uni()
      s = -cos(a0 - b0) - cos(a0 - b1) - cos(a1 - b0) + cos(a1 - b1)
      smax = max(smax, abs(s))
      if (abs(s) > tsir + 1.0d-12) bad = bad + 1
      pplus = (1 + cos(a0 - b0))/4 + (1 - cos(a0 - b0))/4      ! my plus outcome, summed over the other's
      if (abs(pplus - 0.5d0) > 1.0d-15) bias_bad = bias_bad + 1
    end do
    write(*,'(A,F9.6)') '   largest value over 100000 random settings: ', smax
    call check('no one of 100000 random settings exceeds 2*sqrt(2)', bad == 0)
    call check('my record of the singlet is unbiased at every setting of the other', bias_bad == 0)
    T = 0; T(1,1) = 2; T(2,2) = -2; T(3,3) = -2; T(4,4) = 2; T(1,4) = 2; T(2,3) = 2; T(3,2) = 2; T(4,1) = 2
    psi = [0_i8, 1_i8, -1_i8, 0_i8]
    E = 0; E(1,1) = 16; E(2,2) = 16; E(3,3) = 16; E(4,4) = 16
    T2 = matmul(T, T)
    call check('integer form: T on the singlet is -4, and T^2 (T^2 - 16) = 0', &
               all(matmul(T, psi) == -4*psi) .and. all(matmul(T2, T2 - E) == 0))
    ! the pair read with Z on both sides: the chance of plus-plus and of minus-minus (times four), and my bias,
    ! computed from the singlet and the two readings; a wrong state or a wrong reading makes this fail
    ZI = 0; ZI(1,1) = 1; ZI(2,2) = 1; ZI(3,3) = -1; ZI(4,4) = -1
    IZ = 0; IZ(1,1) = 1; IZ(2,2) = -1; IZ(3,3) = 1; IZ(4,4) = -1
    Id = E/16
    call check('the pair at equal settings: same outcome never, my record unbiased (from the arrays)', &
               dot_product(psi, matmul(Id + ZI, matmul(Id + IZ, psi))) == 0 .and. &
               dot_product(psi, matmul(Id - ZI, matmul(Id - IZ, psi))) == 0 .and. dot_product(psi, matmul(ZI, psi)) == 0)
  end subroutine
  subroutine measured()
    real(dp) :: val(4), sig(4), tsir
    character(40) :: nm(4)
    integer :: i
    logical :: ok
    tsir = 2*sqrt(2.0d0)
    nm = [character(40) :: 'Aspect, Grangier and Roger, 1982', 'Weihs et al., 1998', 'Hensen et al., 2015', &
          'Storz et al., 2023']
    val = [2.697d0, 2.73d0, 2.42d0, 2.0747d0]; sig = [0.015d0, 0.02d0, 0.20d0, 0.0033d0]
    write(*,'(A)') ' D. Against published measurements'
    ok = .true.
    do i = 1, 4
      write(*,'(A,A,F7.4,A,F5.1,A)') '   ', nm(i), val(i), '   above the local reach by ', (val(i) - 2)/sig(i), &
           ' uncertainties'
      if (val(i) <= 2 .or. val(i) >= tsir) ok = .false.
    end do
    ! the convention of five uncertainties is asked of the loophole-free result of 2023; no threshold is fitted
    call check('four experiments lie above two and below 2*sqrt(2); the loophole-free one of 2023 by more than five', &
               ok .and. (val(4) - 2)/sig(4) > 5.0d0)
  end subroutine
end program
```

## Appendix F · Run of Appendix E

```text
 A. The registration, on 200000 random joint records
  PASS  any far operation that keeps my rows leaves my record
  PASS  a far relabelling reverses the correlation
 B. Local records
  PASS  all sixteen tables give plus or minus two
  PASS  100000 random mixtures of tables stay within two
  PASS  every step from -2W to 2W is reached, W = 0..200
 C. The pair of the quantum
   value at the settings 0, pi/2 against pi/4, -pi/4: -2.828427   2*sqrt(2) =  2.828427
  PASS  the singlet reaches 2*sqrt(2) at the settings of the engine
   largest value over 100000 random settings:  2.827788
  PASS  no one of 100000 random settings exceeds 2*sqrt(2)
  PASS  my record of the singlet is unbiased at every setting of the other
  PASS  integer form: T on the singlet is -4, and T^2 (T^2 - 16) = 0
  PASS  the pair at equal settings: same outcome never, my record unbiased (from the arrays)
 D. Against published measurements
   Aspect, Grangier and Roger, 1982         2.6970   above the local reach by  46.5 uncertainties
   Weihs et al., 1998                       2.7300   above the local reach by  36.5 uncertainties
   Hensen et al., 2015                      2.4200   above the local reach by   2.1 uncertainties
   Storz et al., 2023                       2.0747   above the local reach by  22.6 uncertainties
  PASS  four experiments lie above two and below 2*sqrt(2); the loophole-free one of 2023 by more than five
 BATTERY-JSON: {"checks":11,"failures":0}
```
