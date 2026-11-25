# The Record as a New Mathematical Theorem

## Why a Horizon Only Grows, Why No Path Returns, and Why Nothing Is Lost: The Step Law and the One Sign Proved for Every Sequence of Registrations

**Mohammad F. Islam PhD** · 25 November 2026

## Abstract

This paper proves, in Lean 4 with Mathlib, that the record of a sequence of registrations changes only by what is registered and never decreases, for every such sequence. A registration is a map whose values are shared exactly by a state and its partner under a fold that is its own inverse: it keeps the height of a state and forgets its side. A history is a sequence of maps of a finite set of states, done in order, and its record is the number of states the history no longer tells apart. Nothing else is assumed, and the gain of an act is not entered: it is computed from the maps. A state shares its registration with another exactly when the fold moves it. A registration never raises the number of states and never takes it below one half, so it erases at most one bit; it erases a whole bit exactly on a set closed under the fold with no state on the line, and nothing on the line. Every fold has a registration. For every history, no act raises the number of states told apart, which is the one sign; the record is the sum of the gains of the acts, which is the step law; a span that starts with an erasing act ends strictly above its start; a span that returns the record erased nothing; and after an erasing act no map of the states, applied at any later time, gives back the history as it was. A share that never decreases takes the majority of a total once and keeps it. Three readings are then fields of one printed structure, with the premise that what happens is a sequence of registrations: the area of a horizon that only registers is a count of the record, so it never decreases; a return in time returns the record, so a path that returns registered nothing; and a process whose record reaches its total passes the majority from one holder to the other once, with nothing left behind. The structure is inhabited by a history that erases one bit. A Fortran twin executes the statements on five hundred generated histories, tests two hundred thousand pairs of times for a map that could undo the history between them and finds none, and sets the first reading against the merger GW150914, whose remnant has a larger area than the two holes together at the central values and at the corner of the printed intervals least favourable to the statement. The direction of time is not derived: the order of the acts is an input. Part II states the reading from which the paper takes its place in the series, at premise grade and apart from the machine-checked claims.

## 1. The Theorem and What It Rests On

### 1.1 The statement

Let $X$ be a finite set of states and $f_0, f_1, \dots$ maps of $X$ to itself, the acts. The history after $n$ acts is $F_n = f_{n-1}\circ\dots\circ f_0$. The states still told apart are the values of $F_n$; write $a_n$ for their number. The gain of act $n$ and the record after $n$ acts are

$$g_n = a_n - a_{n+1}, \qquad \rho_n = |X| - a_n.$$

**Theorem (`the_one_sign`, `step_law`, `record_monotone`).** For every history, $a_{n+1} \le a_n$; the record is $\rho_n = \sum_{i<n} g_i$; and the record never decreases.

**Theorem (`a_span_with_an_erasure_ends_above`, `a_span_that_returns_erased_nothing`).** If $g_n > 0$ and $n < m$ then $\rho_n < \rho_m$. If $\rho_m = \rho_n$ then every act from $n$ to $m$ has gain zero.

**Theorem (`no_map_undoes_an_erasure`).** If $g_n > 0$ and $n < m$, there is no map $h$ of the states with $h\circ F_m = F_n$.

**Theorem (`at_most_one_bit`).** For a registration $q$ and every finite set $S$ of states, $|q(S)| \le |S| \le 2\,|q(S)|$.

**Theorem (`record_forced`, `a_horizon_only_grows`, `no_path_returns`, `nothing_is_lost`).** On the premises below: the record never decreases and each act at most halves the number of states told apart; the area of the horizon never decreases; a return in time holds no erasing act; and a record that reaches a total takes the majority once, with nothing left to the other holder.

That erasure is what cannot be undone, and that it has a cost, is Landauer's [12]. The premises are met: `recordPremises` constructs a term of the structure, and `the_member_erases_one_bit` proves that its first act has gain one.

### 1.2 The premises, printed

The physical premises of the paper are the fields of this structure of the Lean file, and there are no others. What is cited is in the tables of Section 1.3.

```lean
structure Premises where
  State : Type
  fin : Fintype State
  dec : DecidableEq State
  act : ℕ → State → State
  registers : ∀ n, ∃ r : Registration State State, r.reg = act n
  area0 : ℕ
  area : ℕ → ℕ
  horizon : ∀ n, area n = area0 + record act n
  loop : ℕ → ℕ → Prop
  returns : ∀ n m, loop n m → n ≤ m ∧ record act m = record act n
```

It carries three premises. The first is the fields `State`, `act` and `registers`: there is a finite set of states, and what happens is a sequence of acts on it, each of which is a registration. The second is the field `horizon`: the area of a horizon that only registers is a starting value plus the record. The third is the field `returns`: a return in time, from a later act to an earlier one, returns the record. The fields `fin` and `dec` say that the set is finite and that two states can be compared. No field of `Premises` states that the record grows, that the area grows, that a loop is idle, or the conclusion of any theorem. Section 9 states where the premises come from.

### 1.3 What is proved, what is cited, what is assumed

| Statement | Standing | Where |
|---|---|---|
| A registration forgets the side, and no function of it returns the side | Proved, for every registration | Appendix A, Part I |
| A state shares its registration with another exactly when the fold moves it | Proved | Part I |
| A registration never raises the number of states and never takes it below one half | Proved, on every finite set of states | Part I |
| It halves the number exactly on a set closed under the fold with no state on the line, and keeps it on the line | Proved | Part I |
| Every fold has a registration; a renaming after a registration is a registration; the seat is one | Proved | Part I |

The table continues with the record, the turnover and the premises.

| Statement | Standing | Where |
|---|---|---|
| The one sign, the step law, and the record never decreasing | Proved, for every sequence of maps of every finite set | Part II |
| A span that starts with an erasing act ends above its start; a span that returns the record erased nothing | Proved | Part II |
| After an erasing act no map of the states gives back the earlier history | Proved | Part II |
| A share that never decreases and passes half of a total holds the majority from one time on and not before; the other holder ends with nothing | Proved | Part III |
| A boundary of $k$ sites of one bit writes $2^k$ names | Proved | Part IV |
| On the premises: the record, the horizon, the path that returns, the turnover; the premises are met | Proved | Part V |

What is not machine-checked is in the third table.

| Statement | Standing | Where |
|---|---|---|
| What happens is a sequence of registrations on a finite set of states | Premise | Sections 2, 9 |
| The area of a horizon is a count of what is registered on it | Premise; the proportion of entropy to area is [2, 3] | Sections 6, 9 |
| A return in time returns the record | Premise | Sections 5, 9 |
| The radiation of a hole is its record, and the hole holds the rest | Reading, premise-grade; the curve is Page's [5] | Section 7 |
| The two holes before a merger are one registering surface, whose area is the sum of the two | Reading, premise-grade | Section 8 |
| The area of a hole of mass $m$ and spin $\chi$ is proportional to $m^2\big(1 + \sqrt{1 - \chi^2}\big)$ | Classical formula, entered | Section 8 |
| The measured values of the twin | Entered from the literature [9]; numerical, not machine-checked | Section 8 |

The paper claims as machine-checked the rows marked proved and no others. A row marked entered is a classical formula or a measured value used by the numerical twin alone; no theorem rests on it. Part II, the reading, is outside these tables: it is premise-grade and is labelled so where it begins.

## 2. States, Acts and Registrations

A record needs states that can be told apart and acts that change them. A finite set and maps of it are exactly this, and they are what the file of Appendix A formalises, in the kernel of Lean 4 [14] on the library Mathlib [13]. Working at this level has a cost and a gain. The cost is that no space, no time and no dynamics is constructed, and the set of states is finite. The gain is that the theorems of Section 4 hold for every sequence of maps of every finite set, with no hypothesis on what the maps are.

The structure `Registration` is a fold of the states that is its own inverse, with a map whose values are shared exactly by a state and its partner. The definitions `run`, `alive`, `gain` and `record` are $F_n$, the states told apart, $g_n$ and $\rho_n$ of Section 1.1. Three terms are fixed here. A state is on the line when the fold does not move it. An act erases when its gain is positive. And one bit is a factor of two in the number of states: an act erases at most one bit when it takes that number to no less than one half.

## 3. The Registration

Nothing in this section is assumed. Each statement is a theorem of Appendix A.

**It forgets the side (`forgets_the_side`, `no_reading_returns_the_side`).** A state and its partner have one registration, so every function of the registration gives them one value. No reading of the record returns the side.

**Off the line (`a_bit_is_erased_exactly_off_the_line`).** A state shares its registration with a different state exactly when the fold moves it.

**At most one bit (`fibre_at_most_two`, `at_most_one_bit`).** No value of a registration is taken by more than two states. So on every finite set $S$, $|q(S)| \le |S| \le 2\,|q(S)|$.

**A whole bit, and none (`a_whole_bit_exactly`, `nothing_is_lost_on_the_line`).** On a set closed under the fold with no state on the line, $|S| = 2\,|q(S)|$: one bit exactly. On a set of states on the line, $|q(S)| = |S|$: nothing.

**Registrations exist (`orbitRegistration`, `seat`, `seat_line`, `Registration.rename`).** For every fold, the map of a state to its pair is a registration. The seat is one: states are pairs of whole numbers, a side and a height, the fold reverses the side, the registration keeps the size of the side and the height, and a state is on the line exactly when its side is zero. A registration followed by a renaming that keeps different values different is again a registration.

## 4. The Record

**The one sign (`the_one_sign`).** The states told apart after act $n$ are the images, under that act, of those told apart before it. An image is never larger than its set. So $a_{n+1} \le a_n$, for every act that is a map.

**The step law (`step_law`).** $\rho_n = \sum_{i<n} g_i$: the record is the sum of the gains and changes by nothing else.

**It never decreases (`record_monotone`).** For $n \le m$, $\rho_n \le \rho_m$.

**At most one bit an act (`a_registration_erases_at_most_one_bit`).** If act $n$ is a registration, $a_n \le 2\,a_{n+1}$.

The first three use no premise. They hold because the acts are maps: a map can write two states as one and cannot write one state as two. The last uses the premise that the act is a registration.

## 5. No Path Returns

**A span with an erasure (`a_span_with_an_erasure_ends_above`).** If act $n$ erases and $n < m$, then $\rho_n < \rho_m$.

**A span that returns (`a_span_that_returns_erased_nothing`).** If $\rho_m = \rho_n$, every act from $n$ to $m$ has gain zero.

**No map undoes it (`no_map_undoes_an_erasure`).** If act $n$ erases and $n < m$, there is no map $h$ of the states with $h\circ F_m = F_n$. The statement is stronger than a count: whatever is done to the states afterwards, the history before the erasure is not recovered.

**On the premises (`no_path_returns`).** The field `returns` says that a return in time returns the record. So every act on the loop has gain zero: a path that returns registered nothing. What the theorem allows is a closed path on which nothing is erased. That nature protects its order of time is the conjecture of Hawking [4]; here it is the statement that a trace cannot be carried round a loop, on the premise named.

## 6. A Horizon Only Grows

**On the premises (`a_horizon_only_grows`).** The field `horizon` says that the area is a starting value plus the record. So the area never decreases, and it is strictly larger after a span that starts with an erasing act.

Hawking proved the area theorem in general relativity from the field equations and a condition on the energy of what falls in [1]. That a horizon hides what has crossed it is the setting of Penrose [6]. Here no condition on energy is used: the sign comes from the gain, and the premise is that the area counts the record, in the proportion of Bekenstein and Hawking [2, 3]. A hole that radiates is not a surface that only registers, and its area goes down [3]; the field does not cover it, and Section 7 does.

## 7. Nothing Is Lost

**The majority changes hands once (`the_majority_changes_hands_once`).** Let a share never decrease and pass half of a total $N$ at some time. Then there is one time from which it holds more than half, and before which it does not.

**Nothing is left (`nothing_is_left`, `turnover_of_the_record`).** Let two shares sum to $N$ at every time, the first starting at zero and reaching $N$. The second holds more than half at the start and nothing at the end.

**On the premises (`nothing_is_lost`).** Let the record reach a total $N$, and call the rest, $N$ less the record, the share of the other holder. That the two shares sum to $N$ is the definition of the rest. Then the other holder starts with more than half and ends with nothing, and the record holds more than half from one time on. Read with the radiation of a hole as the record and the hole as the holder of the rest, this is the turnover of Page [5]; that reading is premise-grade and is not a field.

**A boundary (`a_boundary_writes`).** A boundary of $k$ sites of one bit writes $2^k$ names. That the record of a region is a function of its boundary is the proposal of 't Hooft and Susskind [7, 8]; the paper does not derive it.

## 8. The Numerical Twin

The twin of Appendix B does three things the kernel does not. It executes the statements on generated histories, it searches for a map that undoes an erasure, and it sets one reading against a published measurement.

**Histories.** An act is built from a random pairing of 64 states: one time in three it is idle, and otherwise it writes each of a random half of the pairs as one state, and then renames the states. In 500 histories of 40 acts, with 7947 erasing acts, no act raises the number of states told apart and none takes it below one half. Of 410000 spans, 35997 return the record, and none of them holds an erasing act; every span that starts with an erasing act ends strictly above its start. For 203251 pairs of times with an erasing act at the first, the twin tests whether any map of the states could give the earlier history from the later one, and finds none.

**The seat, the turnover, a boundary.** On 451 states of the seat, 440 states off the line give 220 values of the registration, each taken twice, and 11 states on the line give 11, each taken once. A total of 1000 registered act by act, with the gain one or, one time in five, zero, takes 1241 acts; the majority changes hands at act 634, once. A boundary of 12 sites writes 4096 distinct names.

**The measurement.** For the merger GW150914 the two holes had masses 36 and 29 in solar units, with published intervals reaching 41 and 33, and the remnant 62, reaching down to 58, with spin 0.67, reaching up to 0.72 [9]. The initial holes are taken without spin, which makes their areas largest. The two holes before the merger are read as one registering surface whose area is the sum of the two; that reading is premise-grade.

| Case | Sum of the initial areas | Area of the remnant | Ratio |
|---|---|---|---|
| central values | 4274.0 | 6697.6 | 1.567 |
| the corner of the intervals least favourable to the statement | 5540.0 | 5698.5 | 1.029 |

The areas are in units of the square of the solar mass, with a common factor dropped. Ten checks pass and none fails. Three limits are stated. The corner is not a probability; it is the worst case the printed intervals allow. An analysis of the same signal that measures the two areas separately finds agreement with the area statement at 97 per cent probability [10], and a later signal confirms it [11]; these are printed as readings and are not counted. And the measurement precedes this work: the table is agreement with the record, not a new prediction.

## 9. Discussion: The Reading

The derivation above uses only finite sets and maps. This section states the reading from which the premises come, and marks what in it is theorem and what is premise.

**Why registrations.** In the reading of Part II what happens is what is registered, and the registration is the one of the seat: it keeps the height of a state and forgets its side [15]. That is the field `registers`. The premise is physics and is not a theorem of this paper. What the paper proves is what the premise forces: a record that changes only by what is registered, by at most one bit an act, and never downward.

**Why the area and the loop.** A horizon is a surface that registers what crosses it and returns nothing; the reading is that its area counts that record. A return in time brings a system back to an earlier state of the world; the reading is that it brings the record back with it. Those are the fields `horizon` and `returns`. Each is a statement of physics, and each is written as a field so that the theorem that uses it can be checked alone.

**What is not derived: the direction.** The record grows along the order in which the acts are done, and that order is the index of the history: an input of the object, not a consequence of a law. The paper proves that a record cannot be unwound. It does not prove which way the world runs.

**What the paper does not claim.** It does not derive the area theorem of general relativity, the entropy of a hole, or the curve of Page. It does not prove that the set of states of the world is finite. It does not claim that the area theorem or chronology protection was unknown. It claims that the step law and the one sign hold for every sequence of maps, that a registration erases at most one bit, that no map undoes an erasure, that the three consequences follow from three named premises, and that each statement of Section 1.3 marked proved compiles. No theorem of Sections 2 to 8 depends on Part II.

## 10. Predictions, Falsifiers, and What Stands

The paper recovers the area statement, the protection of the order of time, and the turnover. It predicts no measurement that they do not and derives no constant. Its commitments are those of the premises, and they are stated here as commitments: three that the paper says will stand at any future precision, two proposals it says will fail, and the three observations that would refute it.

### 10.1 Three predictions that will stand

1. **The area of a horizon that only registers never decreases.** `a_horizon_only_grows` gives it. The remnant of GW150914 exceeds the two holes together at the least favourable corner of the intervals [9, 10]. The prediction is that every merger does.
2. **Nothing that leaves a trace returns to its own past.** `no_path_returns` gives it. The prediction is that no process is found that registers and closes on itself in time.
3. **An erased bit is not restored by any later map of the same states.** `no_map_undoes_an_erasure` gives it. The prediction is that every apparent restoration draws on states outside the set, where the bit was kept.

### 10.2 Two proposals that will fail

1. **A hole that ends with part of the record unreturned.** `nothing_is_lost` leaves nothing with the other holder when the record reaches its total. The paper predicts that every account in which a hole ends and information is gone [3] gives up the premise that the process ends with the record complete, or the reading of the radiation as the record.
2. **A machine that carries a record round a loop in time.** `no_path_returns` forbids it. The paper predicts that every such proposal either carries nothing or does not close.

### 10.3 The three falsifiers

Each is a forbidden observation. No observation breaks a theorem; each refutes a premise, and each names the theorem that carries the consequence. The threshold in each case is five of the experiment's printed uncertainties.

1. **A horizon that only registers whose area decreases.** It refutes the field `horizon`, through `a_horizon_only_grows`.
2. **A process that registers and returns to its own past.** It refutes the field `returns` or the field `registers`, through `no_path_returns`.
3. **Two states written as one and told apart again by a later map of the same states.** It refutes the fields `State` and `act`, that what happens is a sequence of maps of one set of states, through `no_map_undoes_an_erasure`.

Apart from them stands the formal claim, which no observation touches and one compilation settles: every theorem named in this text prints its axioms in Appendix D, and a line that names an axiom other than `propext`, `Classical.choice` and `Quot.sound`, or a file that fails to compile under Lean 4.19.0 and Mathlib 4.19.0, refutes the claim that the statements are proved.

### 10.4 What kind of result this is

It is not a new physics. It is a change in how a physical argument can be checked. The growth of a record is here a single file whose every step the kernel has verified, whose every assumption is one field of one structure, and whose first reading is set against measurement. A reader who doubts a step can name the line.

The implication from `Premises` to the growth of the record, of the horizon, to the idle loop and to the turnover is checked by the Lean kernel. No experiment and no later revision of physics alters an implication. Experiment remains free to test whether nature satisfies the premises, and that is all it can test here. What the kernel certifies is the Lean statements; that the definitions of the file say what this text says they say is for the reader to check, and the structure `Premises` is printed for that purpose. What stands is the tables of Section 1.3.

## 11. Part II · The Reading

*This part is the reading from which the paper takes its place in the series. It is premise-grade. It is not among the machine-checked claims of Section 1.3, and no theorem of Sections 2 to 8 depends on it. The seat it names, and the two statements it rests on, are those of Nothing Escapes, Least Erasure (Islam, 2026a), where they are proved in their own domain.*

### 11.1 One Object, Three Old Questions

The series reads physics on one seat: a reflection of the plane, the line it fixes, and a registration that keeps the height of a point and forgets its side. Two statements are proved there in their own domain. Existence: what is registered is not lost. Least Erasure: the registration erases the least that a registration can, the one bit of the side, and no more.

This paper builds one object from that registration and nothing else: the record of a sequence of registrations. Three questions that physics has asked separately are then one question asked three times. Why does a horizon only grow? Because it only registers, and a record changes only by what is registered. Why does no path return to its own past? Because a return would bring the record back, and a record that has gained cannot come back. Why is nothing lost when a hole is gone? Because the record that left it is complete, and what the hole held is the rest.

The reading is that these are not three laws. Each was found in its own setting: the first from the field equations with a condition on energy, the second as a conjecture about the quantum field near a closed path, the third from a count of states in a hole and its radiation. In each the hard part was the sign: that an area does not decrease, that a path does not close, that the information comes out and does not stay. On the seat the sign is one, and it is the sign of the gain. A map can write two states as one. It cannot write one state as two.

### 11.2 What the Reading Adds, and What It Does Not

The reading adds three identifications, and the paper writes two of them as fields so that nothing is hidden: that the area of a horizon counts its record, and that a return in time returns the record. The third, that the radiation of a hole is its record and the hole the holder of the rest, is stated in Section 7 and is not a field. None of the three is a theorem of this paper.

It does not add the direction. The record of a history grows along the order of its acts, and the order is given with the history. The volume the paper stands on proves that a law even under reversal cannot return the arrow (Islam, 2026a). This paper is consistent with that: it proves that a record cannot be unwound, and is silent on which way the world runs.

It does not add a magnitude. The constant that turns a count into an area is measured, and every statement here survives it, since a positive multiple of a count that never decreases never decreases.

One falsifier belongs to the reading and stands beside the three of Section 10.3: a horizon, with nothing radiated, whose area is measured to fall. The mergers observed so far go the other way.

## 12. Closure

The growth of a record is no longer informal prose. From a finite set of states and a sequence of maps of it, and nothing more, Lean 4 with Mathlib compiles the one sign, the step law, the record that never decreases, the span that starts with an erasure and ends above its start, the span that returns and erased nothing, and the absence of any map that undoes an erasure. From a fold that is its own inverse it compiles the registration that forgets the side, the bit that is erased exactly off the line, the bound of one bit, the whole bit on a set closed under the fold, and the existence of a registration for every fold. No axiom is declared. No proof is left open. No headline theorem closes by its own hypothesis or over a structure that carries its conclusion.

The area statement is recovered with no condition on energy, on the premise that an area counts a record. The protection of the order of time is recovered as the statement that a trace is not carried round a loop, on the premise that a return in time returns the record. The turnover is recovered as the one time at which a share that only grows takes the majority. The numerical twin executes the statements on five hundred generated histories, finds no map that undoes an erasure among two hundred thousand pairs of times, and sets the first reading against the merger GW150914, whose remnant is larger than the two holes together at the least favourable corner of the printed intervals.

Every boundary is in plain sight. That what happens is a sequence of registrations on a finite set of states is three fields of one printed structure. That the area of a horizon is a count of its record is one more field, and that a return in time returns the record is another. That the radiation of a hole is its record is a reading, premise-grade, and is not a field. The formula for the area of a hole is classical, entered. The direction of time is not derived, here or anywhere in the paper.

That structure is not an arbitrary postulate. The two statements the reading rests on, Existence and Least Erasure, are theorems in their own domain: each has its own compiled Lean file, with no axiom declared, listed in the Lean Library Reference. There they are proved. The Heat Bridge, which joins erasure to heat, is a theorem there as well; the bridge spoken of below is a different one, from that domain to physics. Here they are used, and the difference is stated. Between that domain and a history of the world lies a physical bridge: that what happens is what is registered, that a horizon counts it, and that a return in time would return it. This paper does not claim the bridge as a theorem. It writes the bridge down as `Premises`, so that the engine imports nothing outside Mathlib and can be checked alone, and so that a reader can see exactly which sentences carry the physics.

Two things are therefore separate, and the paper keeps them separate. Inside the kernel, the implication from `Premises` to a record that only grows is a mathematical certainty. No experiment, no consensus and no later revision of physics alters it, and anyone can recheck it with one compilation. Outside the kernel stand three falsifiers. They test whether nature satisfies the premises, and so far nature does. What survives both is not opinion. It is a theorem, and a physics that has met every test of its premises.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file and the Fortran twin are written by a language model under the author's direct supervision. Every theorem named in the text of Sections 1 to 10 and 12 is in Appendix A under that name, and its kernel line is printed in Appendix D. Classical results that are cited and not formalised are named as such in Section 1.3 and wherever they are used. No constant of nature is derived anywhere in this paper; the numbers of the twin are computed from generated histories and from measured inputs, which Appendix B prints.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1. S. W. Hawking, Phys. Rev. Lett. 26 (1971) 1344.
2. J. D. Bekenstein, Phys. Rev. D 7 (1973) 2333.
3. S. W. Hawking, Commun. Math. Phys. 43 (1975) 199.
4. S. W. Hawking, Phys. Rev. D 46 (1992) 603.
5. D. N. Page, Phys. Rev. Lett. 71 (1993) 3743.
6. R. Penrose, Riv. Nuovo Cimento 1 (1969) 252.
7. G. 't Hooft, Dimensional reduction in quantum gravity, arXiv:gr-qc/9310026 (1993).
8. L. Susskind, J. Math. Phys. 36 (1995) 6377.
9. B. P. Abbott et al. (LIGO and Virgo), Phys. Rev. Lett. 116 (2016) 061102.
10. M. Isi, W. M. Farr, M. Giesler, M. A. Scheel and S. A. Teukolsky, Phys. Rev. Lett. 127 (2021) 011103.
11. A. G. Abac et al. (LIGO, Virgo and KAGRA), Phys. Rev. Lett. 135 (2025) 111403.
12. R. Landauer, IBM J. Res. Dev. 5 (1961) 183.
13. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
14. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
15. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its engine uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main, read at commit 38f6678.

16. Root Axiom and Existence: Publication Library/Philosophy/Metaphysics/Root Axiom/TOE_Zero.lean. Compiled alone in core Lean 4.19.0, exit 0.
17. RH master: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_44_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.
18. Existence, as carried in the RH master: line 6635.
19. Heat Bridge: RH master, Parts VII-c and VII-d.
20. Prime Freedom: RH master, Parts XIII and XIV.
21. Freedom Arrow: RH master, Part XV.
22. Least Erasure: protocols/RH One Bit/Nothing Escapes Three Plus One/Least_Erasure.lean. Compiled alone in core Lean 4.19.0, exit 0.
23. Second Law: Publication Library/Mathematics/Mathematical Physics/Second_Law_Theorem_v1_0_0_CC.pdf, with its Lean file printed inside.
24. P versus NP master: FINAL_BINDING/PNP Binding/PNP_Normal_Form_Paper_v1_14_0_CC.lean
25. ZFC seal: lean/ZFC_Block_Hardened_FINAL_v2_0_0_Hermetically_Sealed.lean
26. No Second Sovereign: Publication Library/Mathematics/Millennium Series/No_Second_Sovereign_v1_0_0_CC.lean
27. Future Proof Empirical Witness Seal: Publication Library/Mathematics/Millennium Series/Future_Proof_Empirical_Witness_Seal_v1_0_0_CC.lean

## Appendix A · SPHYS_Record_Forced_CC.lean

Lean 4.19.0 with Mathlib 4.19.0. 29 theorems, no axiom declared, no `sorry`, exit 0 with no warning. The kernel lines are Appendix D.

```lean
/-
SPHYS_Record_Forced_CC.lean · the record of a sequence of registrations, on real structures
RATIONALE. The engine of edition 1.0.0 proved its statements for a gain entered by hand as zero or one on a small
  structure of integers. This file replaces it. A registration is a map whose fibres are the pairs of an
  involution; a history is a sequence of maps of a finite set; the record is the number of states the history can
  no longer tell apart. The gain is not entered: it is computed from the maps.
DESIGN. Parts, in order.
    Part I    The registration. `forgets_the_side`, `no_reading_returns_the_side`,
              `a_bit_is_erased_exactly_off_the_line`, `at_most_one_bit`, `a_whole_bit_exactly`,
              `nothing_is_lost_on_the_line`; `orbitRegistration`: every involution has one; `seat`.
    Part II   The record of a history. `the_one_sign`, `step_law`, `record_monotone`,
              `a_span_with_an_erasure_ends_above`, `a_span_that_returns_erased_nothing`,
              `no_map_undoes_an_erasure`, `a_registration_erases_at_most_one_bit`.
    Part III  The turnover. `the_majority_changes_hands_once`, `nothing_is_left`, `turnover_of_the_record`.
    Part IV   `a_boundary_writes`.
    Part V    `Premises`; `record_forced`; `recordPremises`; `the_member_erases_one_bit`.
WHAT IS NOT PROVED HERE (read before citing).
    (a) That what happens in the world is a sequence of registrations on a finite set of states. It is the
        structure `Premises`.
    (b) That the area of a horizon is a count of what is registered on it, that a return in time returns the
        record, and that the radiation of a hole is its record. These are the readings of the paper, cited or
        premise-grade, and no theorem here states them.
    (c) The direction. The order of the acts is an input of a history.
RISK. Finite sets of states throughout. No magnitude is derived.
NON-NEGOTIABLE. No axiom is declared, no sorry. No headline theorem closes over a structure that carries its
  conclusion. The kernel line of every theorem the paper names is printed at the end.
-/
import Mathlib.Data.Finset.Card
import Mathlib.Data.Finset.Image
import Mathlib.Data.Fintype.Card
import Mathlib.Data.Fintype.Pi
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Order.Monotone.Basic
import Mathlib.Logic.Function.Basic
import Mathlib.Data.Int.Basic
import Mathlib.Data.Nat.Find
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum

namespace SPHYS.Record
open Finset

/-! ## Part I. The registration -/

/-- A registration: a fold of the states that is its own inverse, and a map that gives two states one value
exactly when they are the same state or partners under the fold. It keeps the height and forgets the side. -/
structure Registration (X Y : Type*) where
  fold : X → X
  involutive : Function.Involutive fold
  reg : X → Y
  spec : ∀ x y, reg x = reg y ↔ y = x ∨ y = fold x

section Reg
variable {X Y : Type*} (r : Registration X Y)

/-- THE REGISTRATION FORGETS THE SIDE. -/
theorem forgets_the_side (x : X) : r.reg (r.fold x) = r.reg x :=
  ((r.spec x (r.fold x)).mpr (Or.inr rfl)).symm

/-- NO READING OF THE RECORD RETURNS THE SIDE. Every function of the registration gives a state and its partner
one value. -/
theorem no_reading_returns_the_side {Z : Type*} (g : Y → Z) (x : X) : g (r.reg (r.fold x)) = g (r.reg x) := by
  rw [forgets_the_side]

/-- A BIT IS ERASED EXACTLY OFF THE LINE. A state shares its registration with another state exactly when the
fold moves it. -/
theorem a_bit_is_erased_exactly_off_the_line (x : X) : (∃ y, y ≠ x ∧ r.reg y = r.reg x) ↔ r.fold x ≠ x := by
  constructor
  · rintro ⟨y, hne, he⟩ hfix
    rcases (r.spec x y).mp he.symm with h | h
    · exact hne h
    · exact hne (h.trans hfix)
  · intro h
    exact ⟨r.fold x, h, forgets_the_side r x⟩

variable [DecidableEq X] [DecidableEq Y]

/-- No value of the registration is taken by more than two states. -/
theorem fibre_at_most_two (S : Finset X) (a : Y) : (S.filter fun x => r.reg x = a).card ≤ 2 := by
  by_cases hne : (S.filter fun x => r.reg x = a).Nonempty
  · obtain ⟨x0, hx0⟩ := hne
    have h0 : r.reg x0 = a := (Finset.mem_filter.mp hx0).2
    have sub : (S.filter fun x => r.reg x = a) ⊆ {x0, r.fold x0} := by
      intro y hy
      have hy' : r.reg y = a := (Finset.mem_filter.mp hy).2
      rcases (r.spec x0 y).mp (h0.trans hy'.symm) with h | h
      · simp [h]
      · simp [h]
    exact (Finset.card_le_card sub).trans Finset.card_le_two
  · rw [Finset.not_nonempty_iff_eq_empty.mp hne]; simp

/-- AT MOST ONE BIT. A registration never raises the number of states, and never takes it below one half. -/
theorem at_most_one_bit (S : Finset X) : (S.image r.reg).card ≤ S.card ∧ S.card ≤ 2 * (S.image r.reg).card :=
  ⟨Finset.card_image_le, Finset.card_le_mul_card_image S 2 fun a _ => fibre_at_most_two r S a⟩

/-- A WHOLE BIT, EXACTLY. On a set of states closed under the fold and with no state on the line, the
registration halves the number of states. -/
theorem a_whole_bit_exactly (S : Finset X) (hS : ∀ x ∈ S, r.fold x ∈ S) (hfree : ∀ x ∈ S, r.fold x ≠ x) :
    S.card = 2 * (S.image r.reg).card := by
  rw [Finset.card_eq_sum_card_image r.reg S]
  have each : ∀ a ∈ S.image r.reg, (S.filter fun x => r.reg x = a).card = 2 := by
    intro a ha
    obtain ⟨x0, hx0, rfl⟩ := Finset.mem_image.mp ha
    have e : (S.filter fun x => r.reg x = r.reg x0) = {x0, r.fold x0} := by
      ext y
      simp only [Finset.mem_filter, Finset.mem_insert, Finset.mem_singleton]
      constructor
      · rintro ⟨_, hy⟩; exact (r.spec x0 y).mp hy.symm
      · rintro (h | h)
        · rw [h]; exact ⟨hx0, rfl⟩
        · rw [h]; exact ⟨hS x0 hx0, forgets_the_side r x0⟩
    rw [e, Finset.card_pair (fun h => hfree x0 hx0 h.symm)]
  rw [Finset.sum_congr rfl each, Finset.sum_const]
  simp [mul_comm]

omit [DecidableEq X] in
/-- NOTHING IS LOST ON THE LINE. On a set of states that the fold does not move, the registration keeps the number
of states. -/
theorem nothing_is_lost_on_the_line (S : Finset X) (hfix : ∀ x ∈ S, r.fold x = x) :
    (S.image r.reg).card = S.card := by
  apply Finset.card_image_of_injOn
  intro x hx y _ he
  rcases (r.spec x y).mp he with h | h
  · exact h.symm
  · exact (h.trans (hfix x hx)).symm

end Reg

/-- A RENAMING AFTER A REGISTRATION IS A REGISTRATION. Following a registration by a map that sends different
values to different values gives a registration with the same fold. -/
def Registration.rename {X Y Z : Type*} (r : Registration X Y) (e : Y → Z) (he : Function.Injective e) :
    Registration X Z where
  fold := r.fold
  involutive := r.involutive
  reg := e ∘ r.reg
  spec := fun x y => ⟨fun h => (r.spec x y).mp (he h), fun h => congrArg e ((r.spec x y).mpr h)⟩

/-- The relation of a state to itself and to its partner. -/
def orbitSetoid {X : Type*} (σ : X → X) (h : Function.Involutive σ) : Setoid X where
  r x y := y = x ∨ y = σ x
  iseqv :=
    { refl := fun _ => Or.inl rfl
      symm := by
        rintro x y (rfl | rfl)
        · exact Or.inl rfl
        · exact Or.inr (h x).symm
      trans := by
        rintro x y z (rfl | rfl) (rfl | rfl)
        · exact Or.inl rfl
        · exact Or.inr rfl
        · exact Or.inr rfl
        · exact Or.inl (h x) }

/-- EVERY FOLD HAS A REGISTRATION. For every map that is its own inverse, the map to the set of pairs is a
registration. -/
def orbitRegistration {X : Type*} (σ : X → X) (h : Function.Involutive σ) :
    Registration X (Quotient (orbitSetoid σ h)) where
  fold := σ
  involutive := h
  reg := fun x => Quotient.mk (orbitSetoid σ h) x
  spec := fun _ _ => ⟨fun e => Quotient.exact e, fun e => Quotient.sound e⟩

/-- THE SEAT. States are pairs of whole numbers, a side and a height. The fold reverses the side; the
registration keeps the size of the side and the height. -/
def seat : Registration (ℤ × ℤ) (ℕ × ℤ) where
  fold := fun p => (-p.1, p.2)
  involutive := fun p => by simp
  reg := fun p => (p.1.natAbs, p.2)
  spec := by
    rintro ⟨s, h⟩ ⟨s', h'⟩
    simp only [Prod.mk.injEq, Int.natAbs_eq_natAbs_iff]
    constructor
    · rintro ⟨hs | hs, hh⟩
      · exact Or.inl ⟨hs.symm, hh.symm⟩
      · exact Or.inr ⟨by omega, hh.symm⟩
    · rintro (⟨hs, hh⟩ | ⟨hs, hh⟩)
      · exact ⟨Or.inl hs.symm, hh.symm⟩
      · exact ⟨Or.inr (by omega), hh.symm⟩

/-- On the seat a state is on the line exactly when its side is zero. -/
theorem seat_line (p : ℤ × ℤ) : seat.fold p = p ↔ p.1 = 0 := by
  obtain ⟨s, h⟩ := p
  simp only [seat, Prod.mk.injEq, and_true]
  omega

/-! ## Part II. The record of a history -/

section History
variable {X : Type*} [Fintype X] [DecidableEq X] (f : ℕ → X → X)

/-- A history: the acts f 0, f 1, ... done in order. -/
def run : ℕ → X → X
  | 0 => id
  | n + 1 => f n ∘ run n

/-- The states that are still told apart after n acts. -/
def alive (n : ℕ) : Finset X := Finset.univ.image (run f n)

/-- The gain of act n: the number of states it stops telling apart. -/
def gain (n : ℕ) : ℕ := (alive f n).card - (alive f (n + 1)).card

/-- The record after n acts: the number of states no longer told apart. -/
def record (n : ℕ) : ℕ := Fintype.card X - (alive f n).card

theorem alive_succ (n : ℕ) : alive f (n + 1) = (alive f n).image (f n) := by
  unfold alive; rw [Finset.image_image]; rfl

/-- THE ONE SIGN. No act raises the number of states told apart. -/
theorem the_one_sign (n : ℕ) : (alive f (n + 1)).card ≤ (alive f n).card := by
  rw [alive_succ]; exact Finset.card_image_le

theorem alive_le (n : ℕ) : (alive f n).card ≤ Fintype.card X := Finset.card_le_univ _

theorem alive_antitone {n m : ℕ} (h : n ≤ m) : (alive f m).card ≤ (alive f n).card := by
  induction h with
  | refl => exact le_refl _
  | step _ ih => exact (the_one_sign f _).trans ih

/-- THE STEP LAW. The record of a history is the sum of the gains of its acts. -/
theorem step_law (n : ℕ) : record f n = ∑ i ∈ Finset.range n, gain f i := by
  induction n with
  | zero => simp [record, alive, run]
  | succ n ih =>
    rw [Finset.sum_range_succ, ← ih]
    unfold record gain
    have := the_one_sign f n
    have := alive_le f n
    omega

/-- THE RECORD NEVER DECREASES. -/
theorem record_monotone : Monotone (record f) := by
  intro n m h
  unfold record
  have := alive_antitone f h
  omega

/-- A SPAN WITH AN ERASURE ENDS ABOVE ITS START. -/
theorem a_span_with_an_erasure_ends_above (n m : ℕ) (hnm : n < m) (h : 0 < gain f n) : record f n < record f m := by
  have h1 : record f n < record f (n + 1) := by
    unfold record; unfold gain at h
    have := alive_le f n
    omega
  exact lt_of_lt_of_le h1 (record_monotone f hnm)

/-- A SPAN THAT RETURNS THE RECORD ERASED NOTHING. -/
theorem a_span_that_returns_erased_nothing (n m : ℕ) (h : record f m = record f n) (i : ℕ) (hi : n ≤ i)
    (him : i < m) : gain f i = 0 := by
  by_contra hne
  have h1 := a_span_with_an_erasure_ends_above f i m him (Nat.pos_of_ne_zero hne)
  have h2 := record_monotone f hi
  omega

/-- NO MAP UNDOES AN ERASURE. After an act that erased, no map of the states, applied to the history at any later
time, gives back the history as it was before that act. -/
theorem no_map_undoes_an_erasure (n m : ℕ) (hnm : n < m) (h : 0 < gain f n) :
    ¬ ∃ g : X → X, g ∘ run f m = run f n := by
  rintro ⟨g, hg⟩
  have e : alive f n = (alive f m).image g := by
    unfold alive; rw [Finset.image_image, hg]
  have c1 : (alive f n).card ≤ (alive f m).card := by rw [e]; exact Finset.card_image_le
  have c2 := alive_antitone f (show n + 1 ≤ m from hnm)
  unfold gain at h
  omega

/-- A REGISTRATION ERASES AT MOST ONE BIT. If act n is a registration, the number of states told apart falls to
no less than one half. -/
theorem a_registration_erases_at_most_one_bit (n : ℕ) (r : Registration X X) (hr : r.reg = f n) :
    (alive f n).card ≤ 2 * (alive f (n + 1)).card := by
  rw [alive_succ, ← hr]; exact (at_most_one_bit r (alive f n)).2

end History

/-! ## Part III. The turnover -/

/-- THE MAJORITY CHANGES HANDS ONCE. Let a share never decrease, and let it pass half of a total N at some time.
Then there is one time from which it holds more than half, and before which it does not. -/
theorem the_majority_changes_hands_once (rad : ℕ → ℕ) (hm : Monotone rad) (N T : ℕ) (hT : N < 2 * rad T) :
    ∃ t0, ∀ t, N < 2 * rad t ↔ t0 ≤ t := by
  have ex : ∃ t, N < 2 * rad t := ⟨T, hT⟩
  refine ⟨Nat.find ex, fun t => ⟨fun h => Nat.find_min' ex h, fun h => ?_⟩⟩
  have h0 := Nat.find_spec ex
  have := hm h
  omega

/-- NOTHING IS LEFT. If two shares sum to N at every time and one reaches N, the other is zero then; and if the
first starts at zero and N is positive, the other holds more than half at the start. -/
theorem nothing_is_left (rad hole : ℕ → ℕ) (N T : ℕ) (hsum : ∀ t, hole t + rad t = N) (hT : rad T = N)
    (h0 : rad 0 = 0) (hN : 0 < N) : hole T = 0 ∧ N < 2 * hole 0 := by
  have a := hsum T
  have b := hsum 0
  omega

/-- THE TURNOVER OF THE RECORD. Let the record of a history reach a total N at some time, N positive, and let the
rest be held elsewhere. The holder of the rest has more than half at the start and nothing at that time, and the
record holds more than half from one time on and not before. -/
theorem turnover_of_the_record {X : Type*} [Fintype X] [DecidableEq X] (f : ℕ → X → X) (N T : ℕ) (hN : 0 < N)
    (hT : record f T = N) :
    (N - record f T = 0 ∧ N < 2 * (N - record f 0)) ∧ ∃ t0, ∀ t, N < 2 * record f t ↔ t0 ≤ t := by
  have z : record f 0 = 0 := by simp [record, alive, run]
  refine ⟨by omega, the_majority_changes_hands_once (record f) (record_monotone f) N T (by omega)⟩

/-! ## Part IV. A boundary -/

/-- A BOUNDARY OF k SITES OF ONE BIT WRITES 2^k NAMES. -/
theorem a_boundary_writes (k : ℕ) : Fintype.card (Fin k → Bool) = 2 ^ k := by simp

/-! ## Part V. The theorem -/

/-- The premises. There is a finite set of states, and what happens is a sequence of acts on it, each of which
is a registration. The area of a horizon that only registers is a count: a starting value plus the record. A
return in time, from a later act to an earlier one, returns the record. Nothing else is assumed. -/
structure Premises where
  State : Type
  fin : Fintype State
  dec : DecidableEq State
  act : ℕ → State → State
  registers : ∀ n, ∃ r : Registration State State, r.reg = act n
  area0 : ℕ
  area : ℕ → ℕ
  horizon : ∀ n, area n = area0 + record act n
  loop : ℕ → ℕ → Prop
  returns : ∀ n m, loop n m → n ≤ m ∧ record act m = record act n

attribute [instance] Premises.fin Premises.dec

/-- THE RECORD, FORCED. On the premises the record never decreases; each act takes the number of states told
apart to no less than one half; a span with an erasure ends above its start; and no map undoes an erasure. -/
theorem record_forced (P : Premises) :
    Monotone (record P.act) ∧ (∀ n, (alive P.act n).card ≤ 2 * (alive P.act (n + 1)).card)
      ∧ (∀ n m, n < m → 0 < gain P.act n → record P.act n < record P.act m)
      ∧ (∀ n m, n < m → 0 < gain P.act n → ¬ ∃ g : P.State → P.State, g ∘ run P.act m = run P.act n) := by
  refine ⟨record_monotone P.act, fun n => ?_, a_span_with_an_erasure_ends_above P.act, no_map_undoes_an_erasure P.act⟩
  obtain ⟨r, hr⟩ := P.registers n
  exact a_registration_erases_at_most_one_bit P.act n r hr

/-- A HORIZON ONLY GROWS. On the premises the area never decreases, and it is strictly larger after a span that
starts with an erasing act. -/
theorem a_horizon_only_grows (P : Premises) :
    Monotone P.area ∧ ∀ n m, n < m → 0 < gain P.act n → P.area n < P.area m := by
  constructor
  · intro n m h
    rw [P.horizon, P.horizon]
    exact Nat.add_le_add_left (record_monotone P.act h) _
  · intro n m h hg
    rw [P.horizon, P.horizon]
    exact Nat.add_lt_add_left (a_span_with_an_erasure_ends_above P.act n m h hg) _

/-- NO PATH RETURNS. On the premises a return in time holds no erasing act: every act on the loop has gain
zero. -/
theorem no_path_returns (P : Premises) (n m : ℕ) (h : P.loop n m) (i : ℕ) (hi : n ≤ i) (him : i < m) :
    gain P.act i = 0 :=
  a_span_that_returns_erased_nothing P.act n m (P.returns n m h).2 i hi him

/-- NOTHING IS LOST. On the premises, if the record reaches a total N, the holder of the rest starts with more
than half and ends with nothing, and the record holds more than half from one time on and not before. -/
theorem nothing_is_lost (P : Premises) (N T : ℕ) (hN : 0 < N) (hT : record P.act T = N) :
    (N - record P.act T = 0 ∧ N < 2 * (N - record P.act 0)) ∧ ∃ t0, ∀ t, N < 2 * record P.act t ↔ t0 ≤ t :=
  turnover_of_the_record P.act N T hN hT

/-- The fold of two states, and the registration that writes both as one. -/
def bitRegistration : Registration Bool Bool where
  fold := not
  involutive := Bool.not_not
  reg := fun _ => true
  spec := by decide

/-- The registration that moves nothing. -/
def idleRegistration : Registration Bool Bool where
  fold := id
  involutive := fun _ => rfl
  reg := id
  spec := by decide

/-- The acts of the member: the first writes both states as one, and every later act is idle. -/
def memberAct : ℕ → Bool → Bool := fun n => if n = 0 then (fun _ => true) else id

theorem member_alive (n : ℕ) : alive memberAct (n + 1) = {true} := by
  induction n with
  | zero => decide
  | succ n ih => rw [alive_succ, ih]; simp [memberAct]

theorem member_record (n : ℕ) : record memberAct (n + 1) = 1 := by
  unfold record; rw [member_alive]; simp

/-- THE PREMISES ARE INHABITED. Two states; the first act writes both as one, and every later act is idle. The
area is the record, and the loops are the spans that start after the first act. -/
def recordPremises : Premises where
  State := Bool
  fin := inferInstance
  dec := inferInstance
  act := memberAct
  registers := fun n => by
    by_cases h : n = 0
    · exact ⟨bitRegistration, by simp [h, bitRegistration, memberAct]⟩
    · exact ⟨idleRegistration, by simp [h, idleRegistration, memberAct]⟩
  area0 := 0
  area := record memberAct
  horizon := fun n => (Nat.zero_add _).symm
  loop := fun n m => 1 ≤ n ∧ n ≤ m
  returns := by
    rintro n m ⟨h1, h2⟩
    obtain ⟨n', rfl⟩ : ∃ k, n = k + 1 := ⟨n - 1, by omega⟩
    obtain ⟨m', rfl⟩ : ∃ k, m = k + 1 := ⟨m - 1, by omega⟩
    exact ⟨h2, by rw [member_record, member_record]⟩

/-- THE MEMBER ERASES ONE BIT. Its first act has gain one, and its record is one from then on. -/
theorem the_member_erases_one_bit : gain recordPremises.act 0 = 1 ∧ ∀ n, record recordPremises.act (n + 1) = 1 := by
  refine ⟨by decide, member_record⟩

end SPHYS.Record

#print axioms SPHYS.Record.forgets_the_side
#print axioms SPHYS.Record.no_reading_returns_the_side
#print axioms SPHYS.Record.a_bit_is_erased_exactly_off_the_line
#print axioms SPHYS.Record.fibre_at_most_two
#print axioms SPHYS.Record.at_most_one_bit
#print axioms SPHYS.Record.a_whole_bit_exactly
#print axioms SPHYS.Record.nothing_is_lost_on_the_line
#print axioms SPHYS.Record.Registration.rename
#print axioms SPHYS.Record.orbitRegistration
#print axioms SPHYS.Record.seat
#print axioms SPHYS.Record.seat_line
#print axioms SPHYS.Record.alive_succ
#print axioms SPHYS.Record.the_one_sign
#print axioms SPHYS.Record.alive_le
#print axioms SPHYS.Record.alive_antitone
#print axioms SPHYS.Record.step_law
#print axioms SPHYS.Record.record_monotone
#print axioms SPHYS.Record.a_span_with_an_erasure_ends_above
#print axioms SPHYS.Record.a_span_that_returns_erased_nothing
#print axioms SPHYS.Record.no_map_undoes_an_erasure
#print axioms SPHYS.Record.a_registration_erases_at_most_one_bit
#print axioms SPHYS.Record.the_majority_changes_hands_once
#print axioms SPHYS.Record.nothing_is_left
#print axioms SPHYS.Record.turnover_of_the_record
#print axioms SPHYS.Record.a_boundary_writes
#print axioms SPHYS.Record.record_forced
#print axioms SPHYS.Record.a_horizon_only_grows
#print axioms SPHYS.Record.no_path_returns
#print axioms SPHYS.Record.nothing_is_lost
#print axioms SPHYS.Record.member_alive
#print axioms SPHYS.Record.member_record
#print axioms SPHYS.Record.recordPremises
#print axioms SPHYS.Record.the_member_erases_one_bit
```

## Appendix B · Record_Forced_Twin_CC.f90

Ten checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix C.

```fortran
! Record_Forced_Twin_CC.f90 · twin of SPHYS_Record_Forced_CC.lean
! RATIONALE. The engine proves its statements for every history of maps of every finite set. This twin executes
!   them on generated histories as an independent run; tests, for every pair of times, whether any map could undo
!   the history between them; generates an evaporation act by act; and sets one reading against a published
!   measurement.
! DESIGN. A state is a number from 1 to NS. An act is built from a random pairing of the states, the fold: with
!   chance one in three it is idle, and otherwise it writes each of a random half of the pairs as one state, and
!   then renames the states by a random permutation. Such an act is a registration followed by a renaming.
!   Integers throughout, double precision for the areas; one generator, fixed seed.
! NON-NEGOTIABLE. Every check computes both sides. A line marked "reading" is printed and not counted.
! RISK. The scans cover generated histories only. The areas are computed from printed central values and from the
!   corner of the printed intervals least favourable to the statement; the corner is not a probability. The area of
!   a hole of mass m and spin chi is proportional to m**2 (1 + sqrt(1 - chi**2)); the common factor is dropped, and
!   the initial holes are taken without spin, which makes their areas largest.
program record_twin
  implicit none
  integer, parameter :: i8 = selected_int_kind(18), dp = kind(1.0d0), NS = 64, L = 40, NH = 500
  integer(i8) :: seed = 20260622_i8
  integer :: checks = 0, failures = 0
  call histories()
  call seat()
  call turnover()
  call names()
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
  function rnd(n) result(k)                        ! 0 .. n-1
    integer, intent(in) :: n
    integer :: k
    seed = mod(seed * 6364136223846793005_i8 + 1442695040888963407_i8, 9223372036854775807_i8)
    k = int(mod(abs(seed / 65536_i8), int(n, i8)))
  end function
  subroutine shuffle(p)
    integer, intent(out) :: p(NS)
    integer :: i, j, t
    do i = 1, NS
      p(i) = i
    end do
    do i = NS, 2, -1
      j = 1 + rnd(i); t = p(i); p(i) = p(j); p(j) = t
    end do
  end subroutine
  subroutine make_act(f)                           ! a registration followed by a renaming
    integer, intent(out) :: f(NS)
    integer :: p(NS), q(NS), i
    call shuffle(p)                                ! the fold pairs p(1) with p(2), p(3) with p(4), ...
    do i = 1, NS
      f(i) = i
    end do
    if (rnd(3) /= 0) then
      do i = 1, NS - 1, 2
        if (rnd(2) == 0) f(p(i + 1)) = p(i)        ! this pair is written as one state
      end do
    end if
    call shuffle(q)
    do i = 1, NS
      f(i) = q(f(i))
    end do
  end subroutine
  function count_alive(s) result(c)
    integer, intent(in) :: s(NS)
    integer :: c, i
    logical :: seen(NS)
    seen = .false.
    do i = 1, NS
      seen(s(i)) = .true.
    end do
    c = count(seen)
  end function
  subroutine histories()
    integer :: f(NS), run(NS, 0:L), al(0:L), h, n, m, i, j
    integer :: bad_sign, bad_half, bad_span, bad_ret, bad_undo, erasing, spans, returned, pairs_tested
    logical :: undo
    bad_sign = 0; bad_half = 0; bad_span = 0; bad_ret = 0; bad_undo = 0; erasing = 0; spans = 0; returned = 0
    pairs_tested = 0
    do h = 1, NH
      do i = 1, NS
        run(i, 0) = i
      end do
      al(0) = NS
      do n = 1, L
        call make_act(f)
        do i = 1, NS
          run(i, n) = f(run(i, n - 1))
        end do
        al(n) = count_alive(run(:, n))
        if (al(n) > al(n - 1)) bad_sign = bad_sign + 1
        if (al(n - 1) > 2*al(n)) bad_half = bad_half + 1
        if (al(n) < al(n - 1)) erasing = erasing + 1
      end do
      do n = 0, L - 1
        do m = n + 1, L
          spans = spans + 1
          if (al(m) == al(n)) then
            returned = returned + 1
            if (any(al(n + 1:m) /= al(n))) bad_ret = bad_ret + 1
          end if
          if (al(n + 1) < al(n)) then
            if (.not. (NS - al(m) > NS - al(n))) bad_span = bad_span + 1
            ! could any map g give run(., n) from run(., m)? Only if states equal at m are equal at n
            undo = .true.; pairs_tested = pairs_tested + 1
            do i = 1, NS
              do j = i + 1, NS
                if (run(i, m) == run(j, m) .and. run(i, n) /= run(j, n)) undo = .false.
              end do
            end do
            if (undo) bad_undo = bad_undo + 1
          end if
        end do
      end do
    end do
    write(*,'(A,I0,A,I0,A,I0,A)') ' A. ', NH, ' histories of ', L, ' acts on ', NS, ' states'
    write(*,'(A,I0,A,I0,A,I0)') '   erasing acts: ', erasing, '   spans: ', spans, '   spans that returned the record: ', returned
    call check('no act raises the number of states told apart', bad_sign == 0)
    call check('no act takes that number below one half', bad_half == 0)
    call check('a span that returns the record holds no erasing act', bad_ret == 0)
    call check('a span that starts with an erasing act ends strictly above its start', bad_span == 0)
    write(*,'(A,I0)') '   pairs of times tested for a map that undoes the history between them: ', pairs_tested
    call check('after an erasing act no map of the states gives back the earlier history', bad_undo == 0 .and. pairs_tested > 0)
  end subroutine
  subroutine seat()
    integer :: s, h, cnt(0:20, -5:5), bad, off, on
    cnt = 0; bad = 0; off = 0; on = 0
    do s = -20, 20
      do h = -5, 5
        cnt(abs(s), h) = cnt(abs(s), h) + 1
      end do
    end do
    do s = 0, 20
      do h = -5, 5
        if (s == 0) then
          on = on + 1
          if (cnt(s, h) /= 1) bad = bad + 1
        else
          off = off + 1
          if (cnt(s, h) /= 2) bad = bad + 1
        end if
      end do
    end do
    write(*,'(A)') ' B. The seat: 451 states, a side from -20 to 20 and a height from -5 to 5'
    write(*,'(A,I0,A,I0)') '   values of the registration taken twice: ', off, '   taken once: ', on
    call check('a value is taken by two states off the line and by one on it; 440 states off the line give 220 values', &
               bad == 0 .and. off == 220 .and. on == 11)
  end subroutine
  subroutine turnover()
    integer :: t, m, r1, r2, turn, k, idle
    logical :: ok, first
    t = 1000; ok = .true.; first = .true.; turn = 0; k = 0; r1 = 0; m = 0; idle = 0
    do while (r1 < t)
      m = m + 1
      r2 = r1 + merge(0, 1, rnd(5) == 0)             ! the gain of this act: zero one time in five
      if (r2 < r1) ok = .false.
      if (m == 1 .and. .not. (2*(t - r1) > t)) first = .false.
      if (2*r1 <= t .and. 2*r2 > t) then
        turn = m; k = k + 1
      end if
      if (2*r1 > t .and. 2*r2 <= t) k = k + 100       ! the majority going back would be counted here
      if (r2 == r1) idle = idle + 1
      r1 = r2
    end do
    write(*,'(A)') ' C. The turnover'
    write(*,'(A,I0,A,I0,A,I0)') '   a total of ', t, ' in ', m, ' acts, idle acts ', idle
    write(*,'(A,I0,A,I0)') '   the majority changes hands at act ', turn, '; times it changes hands: ', k
    call check('the share that only grows takes the majority once and keeps it; the other starts with it and ends with none', &
               ok .and. first .and. k == 1 .and. t - r1 == 0)
  end subroutine
  subroutine names()
    integer :: nm(4096), cnt, k, i
    logical :: seen(0:4095), ok
    ok = .true.; nm(1) = 0; cnt = 1
    do k = 1, 12
      do i = 1, cnt
        nm(cnt + i) = 2*nm(i) + 1; nm(i) = 2*nm(i)
      end do
      cnt = 2*cnt
      seen = .false.
      do i = 1, cnt
        if (seen(nm(i))) ok = .false.
        seen(nm(i)) = .true.
      end do
      if (cnt /= 2**k) ok = .false.
    end do
    write(*,'(A)') ' D. A boundary'
    write(*,'(A,I0)') '   names written by a boundary of 12 sites, all distinct: ', cnt
    call check('a boundary of k sites of one bit writes 2**k distinct names, k = 1 to 12', ok)
  end subroutine
  function area(mm, chi) result(a)
    real(dp), intent(in) :: mm, chi
    real(dp) :: a
    a = mm*mm*(1 + sqrt(1 - chi*chi))
  end function
  subroutine measured()
    real(dp) :: ai, af
    write(*,'(A)') ' E. Against a published measurement: the merger GW150914'
    ai = area(36.0d0, 0.0d0) + area(29.0d0, 0.0d0); af = area(62.0d0, 0.67d0)
    write(*,'(A,F8.1,A,F8.1,A,F6.3)') '   central values: initial ', ai, ', final ', af, ', ratio ', af/ai
    call check('the area of the remnant exceeds the sum of the initial areas at the central values', af > ai)
    ai = area(41.0d0, 0.0d0) + area(33.0d0, 0.0d0); af = area(58.0d0, 0.72d0)
    write(*,'(A,F8.1,A,F8.1,A,F6.3)') '   least favourable corner: initial ', ai, ', final ', af, ', ratio ', af/ai
    call check('and at the corner of the printed intervals least favourable to it', af > ai)
    write(*,'(A)') '   reading, not a check: Isi et al. (2021) find agreement with the area law at 97 per cent probability'
  end subroutine
end program
```

## Appendix C · Run of Appendix B

```text
 A. 500 histories of 40 acts on 64 states
   erasing acts: 7947   spans: 410000   spans that returned the record: 35997
  PASS  no act raises the number of states told apart
  PASS  no act takes that number below one half
  PASS  a span that returns the record holds no erasing act
  PASS  a span that starts with an erasing act ends strictly above its start
   pairs of times tested for a map that undoes the history between them: 203251
  PASS  after an erasing act no map of the states gives back the earlier history
 B. The seat: 451 states, a side from -20 to 20 and a height from -5 to 5
   values of the registration taken twice: 220   taken once: 11
  PASS  a value is taken by two states off the line and by one on it; 440 states off the line give 220 values
 C. The turnover
   a total of 1000 in 1241 acts, idle acts 241
   the majority changes hands at act 634; times it changes hands: 1
  PASS  the share that only grows takes the majority once and keeps it; the other starts with it and ends with none
 D. A boundary
   names written by a boundary of 12 sites, all distinct: 4096
  PASS  a boundary of k sites of one bit writes 2**k distinct names, k = 1 to 12
 E. Against a published measurement: the merger GW150914
   central values: initial   4274.0, final   6697.6, ratio  1.567
  PASS  the area of the remnant exceeds the sum of the initial areas at the central values
   least favourable corner: initial   5540.0, final   5698.5, ratio  1.029
  PASS  and at the corner of the printed intervals least favourable to it
   reading, not a check: Isi et al. (2021) find agreement with the area law at 97 per cent probability
 BATTERY-JSON: {"checks":10,"failures":0}
```

## Appendix D · Kernel lines of Appendix A

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

```text
'SPHYS.Record.forgets_the_side' does not depend on any axioms
'SPHYS.Record.no_reading_returns_the_side' does not depend on any axioms
'SPHYS.Record.a_bit_is_erased_exactly_off_the_line' does not depend on any axioms
'SPHYS.Record.fibre_at_most_two' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.at_most_one_bit' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.a_whole_bit_exactly' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.nothing_is_lost_on_the_line' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.Registration.rename' does not depend on any axioms
'SPHYS.Record.orbitRegistration' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.seat' depends on axioms: [propext, Quot.sound]
'SPHYS.Record.seat_line' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.alive_succ' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.the_one_sign' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.alive_le' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.alive_antitone' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.step_law' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.record_monotone' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.a_span_with_an_erasure_ends_above' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.a_span_that_returns_erased_nothing' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.no_map_undoes_an_erasure' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.a_registration_erases_at_most_one_bit' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.the_majority_changes_hands_once' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.nothing_is_left' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.turnover_of_the_record' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.a_boundary_writes' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.record_forced' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.a_horizon_only_grows' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.no_path_returns' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.nothing_is_lost' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.member_alive' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.member_record' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.recordPremises' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Record.the_member_erases_one_bit' depends on axioms: [propext, Classical.choice, Quot.sound]
```
