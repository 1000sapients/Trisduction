# The Record as a New Mathematical Theorem

## Why a Horizon Only Grows, Why No Path Returns, and Why Nothing Is Lost: The Step Law and the One Sign Proved for Every Sequence of Registrations

**Mohammad F. Islam PhD** · 25 November 2026

*Blog edition of the master, edition 2.0.0 of 25 November 2026. It renders the whole text. The printed files of the appendices stand in the master and in the Journal edition, and are listed at the end.*

## Abstract

This paper proves, in Lean 4 with Mathlib, that the record of a sequence of registrations changes only by what is registered and never decreases, for every such sequence. A registration is a map whose values are shared exactly by a state and its partner under a fold that is its own inverse: it keeps the height of a state and forgets its side. A history is a sequence of maps of a finite set of states, done in order, and its record is the number of states the history no longer tells apart. Nothing else is assumed, and the gain of an act is not entered: it is computed from the maps. A state shares its registration with another exactly when the fold moves it. A registration never raises the number of states and never takes it below one half, so it erases at most one bit; it erases a whole bit exactly on a set closed under the fold with no state on the line, and nothing on the line. Every fold has a registration. For every history, no act raises the number of states told apart, which is the one sign; the record is the sum of the gains of the acts, which is the step law; a span that starts with an erasing act ends strictly above its start; a span that returns the record erased nothing; and after an erasing act no map of the states, applied at any later time, gives back the history as it was. A share that never decreases takes the majority of a total once and keeps it. Three readings are then fields of one printed structure, with the premise that what happens is a sequence of registrations: the area of a horizon that only registers is a count of the record, so it never decreases; a return in time returns the record, so a path that returns registered nothing; and a process whose record reaches its total passes the majority from one holder to the other once, with nothing left behind. The structure is inhabited by a history that erases one bit. A Fortran twin executes the statements on five hundred generated histories, tests two hundred thousand pairs of times for a map that could undo the history between them and finds none, and sets the first reading against the merger GW150914, whose remnant has a larger area than the two holes together at the central values and at the corner of the printed intervals least favourable to the statement. The direction of time is not derived: the order of the acts is an input. Part II states the reading from which the paper takes its place in the series, at premise grade and apart from the machine-checked claims.

## 1. The Theorem and What It Rests On

### 1.1 The statement

Let *X* be a finite set of states and *f*₀, *f*₁, … maps of *X* to itself, the acts. The history after *n* acts is *F*ₙ = *f*_(n − 1) ∘ … ∘ *f*₀. The states still told apart are the values of *F*ₙ; write *a*ₙ for their number. The gain of act *n* and the record after *n* acts are

*g*ₙ = *a*ₙ − *a*_(n + 1),   *ρ*ₙ = \|*X*\| − *a*ₙ.

**Theorem (`the_one_sign`, `step_law`, `record_monotone`).** For every history, *a*_(n + 1) ≤ *a*ₙ; the record is *ρ*ₙ = ∑_(i &lt; n)*g*ᵢ; and the record never decreases.

**Theorem (`a_span_with_an_erasure_ends_above`, `a_span_that_returns_erased_nothing`).** If *g*ₙ &gt; 0 and *n* &lt; *m* then *ρ*ₙ &lt; *ρ*ₘ. If *ρ*ₘ = *ρ*ₙ then every act from *n* to *m* has gain zero.

**Theorem (`no_map_undoes_an_erasure`).** If *g*ₙ &gt; 0 and *n* &lt; *m*, there is no map *h* of the states with *h* ∘ *F*ₘ = *F*ₙ.

**Theorem (`at_most_one_bit`).** For a registration *q* and every finite set *S* of states, \|*q*(*S*)\| ≤ \|*S*\| ≤ 2 \|*q*(*S*)\|.

**Theorem (`record_forced`, `a_horizon_only_grows`, `no_path_returns`, `nothing_is_lost`).** On the premises below: the record never decreases and each act at most halves the number of states told apart; the area of the horizon never decreases; a return in time holds no erasing act; and a record that reaches a total takes the majority once, with nothing left to the other holder.

That erasure is what cannot be undone, and that it has a cost, is Landauer’s \[12\]. The premises are met: `recordPremises` constructs a term of the structure, and `the_member_erases_one_bit` proves that its first act has gain one.

### 1.2 The premises, printed

The physical premises of the paper are the fields of this structure of the Lean file, and there are no others. What is cited is in the tables of Section 1.3.

``` lean
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

- **A registration forgets the side, and no function of it returns the side** · Standing: Proved, for every registration; Where: Appendix A, Part I
- **A state shares its registration with another exactly when the fold moves it** · Standing: Proved; Where: Part I
- **A registration never raises the number of states and never takes it below one half** · Standing: Proved, on every finite set of states; Where: Part I
- **It halves the number exactly on a set closed under the fold with no state on the line, and keeps it on the line** · Standing: Proved; Where: Part I
- **Every fold has a registration; a renaming after a registration is a registration; the seat is one** · Standing: Proved; Where: Part I

The table continues with the record, the turnover and the premises.

- **The one sign, the step law, and the record never decreasing** · Standing: Proved, for every sequence of maps of every finite set; Where: Part II
- **A span that starts with an erasing act ends above its start; a span that returns the record erased nothing** · Standing: Proved; Where: Part II
- **After an erasing act no map of the states gives back the earlier history** · Standing: Proved; Where: Part II
- **A share that never decreases and passes half of a total holds the majority from one time on and not before; the other holder ends with nothing** · Standing: Proved; Where: Part III
- **A boundary of *k* sites of one bit writes 2^k names** · Standing: Proved; Where: Part IV
- **On the premises: the record, the horizon, the path that returns, the turnover; the premises are met** · Standing: Proved; Where: Part V

What is not machine-checked is in the third table.

- **What happens is a sequence of registrations on a finite set of states** · Standing: Premise; Where: Sections 2, 9
- **The area of a horizon is a count of what is registered on it** · Standing: Premise; the proportion of entropy to area is \[2, 3\]; Where: Sections 6, 9
- **A return in time returns the record** · Standing: Premise; Where: Sections 5, 9
- **The radiation of a hole is its record, and the hole holds the rest** · Standing: Reading, premise-grade; the curve is Page’s \[5\]; Where: Section 7
- **The two holes before a merger are one registering surface, whose area is the sum of the two** · Standing: Reading, premise-grade; Where: Section 8
- **The area of a hole of mass *m* and spin *χ* is proportional to *m*²(1 + \[1−*χ*²\]^(1/2))** · Standing: Classical formula, entered; Where: Section 8
- **The measured values of the twin** · Standing: Entered from the literature \[9\]; numerical, not machine-checked; Where: Section 8

The paper claims as machine-checked the rows marked proved and no others. A row marked entered is a classical formula or a measured value used by the numerical twin alone; no theorem rests on it. Part II, the reading, is outside these tables: it is premise-grade and is labelled so where it begins.

## 2. States, Acts and Registrations

A record needs states that can be told apart and acts that change them. A finite set and maps of it are exactly this, and they are what the file of Appendix A formalises, in the kernel of Lean 4 \[14\] on the library Mathlib \[13\]. Working at this level has a cost and a gain. The cost is that no space, no time and no dynamics is constructed, and the set of states is finite. The gain is that the theorems of Section 4 hold for every sequence of maps of every finite set, with no hypothesis on what the maps are.

The structure `Registration` is a fold of the states that is its own inverse, with a map whose values are shared exactly by a state and its partner. The definitions `run`, `alive`, `gain` and `record` are *F*ₙ, the states told apart, *g*ₙ and *ρ*ₙ of Section 1.1. Three terms are fixed here. A state is on the line when the fold does not move it. An act erases when its gain is positive. And one bit is a factor of two in the number of states: an act erases at most one bit when it takes that number to no less than one half.

## 3. The Registration

Nothing in this section is assumed. Each statement is a theorem of Appendix A.

**It forgets the side (`forgets_the_side`, `no_reading_returns_the_side`).** A state and its partner have one registration, so every function of the registration gives them one value. No reading of the record returns the side.

**Off the line (`a_bit_is_erased_exactly_off_the_line`).** A state shares its registration with a different state exactly when the fold moves it.

**At most one bit (`fibre_at_most_two`, `at_most_one_bit`).** No value of a registration is taken by more than two states. So on every finite set *S*, \|*q*(*S*)\| ≤ \|*S*\| ≤ 2 \|*q*(*S*)\|.

**A whole bit, and none (`a_whole_bit_exactly`, `nothing_is_lost_on_the_line`).** On a set closed under the fold with no state on the line, \|*S*\| = 2 \|*q*(*S*)\|: one bit exactly. On a set of states on the line, \|*q*(*S*)\| = \|*S*\|: nothing.

**Registrations exist (`orbitRegistration`, `seat`, `seat_line`, `Registration.rename`).** For every fold, the map of a state to its pair is a registration. The seat is one: states are pairs of whole numbers, a side and a height, the fold reverses the side, the registration keeps the size of the side and the height, and a state is on the line exactly when its side is zero. A registration followed by a renaming that keeps different values different is again a registration.

## 4. The Record

**The one sign (`the_one_sign`).** The states told apart after act *n* are the images, under that act, of those told apart before it. An image is never larger than its set. So *a*_(n + 1) ≤ *a*ₙ, for every act that is a map.

**The step law (`step_law`).** *ρ*ₙ = ∑_(i &lt; n)*g*ᵢ: the record is the sum of the gains and changes by nothing else.

**It never decreases (`record_monotone`).** For *n* ≤ *m*, *ρ*ₙ ≤ *ρ*ₘ.

**At most one bit an act (`a_registration_erases_at_most_one_bit`).** If act *n* is a registration, *a*ₙ ≤ 2 *a*_(n + 1).

The first three use no premise. They hold because the acts are maps: a map can write two states as one and cannot write one state as two. The last uses the premise that the act is a registration.

## 5. No Path Returns

**A span with an erasure (`a_span_with_an_erasure_ends_above`).** If act *n* erases and *n* &lt; *m*, then *ρ*ₙ &lt; *ρ*ₘ.

**A span that returns (`a_span_that_returns_erased_nothing`).** If *ρ*ₘ = *ρ*ₙ, every act from *n* to *m* has gain zero.

**No map undoes it (`no_map_undoes_an_erasure`).** If act *n* erases and *n* &lt; *m*, there is no map *h* of the states with *h* ∘ *F*ₘ = *F*ₙ. The statement is stronger than a count: whatever is done to the states afterwards, the history before the erasure is not recovered.

**On the premises (`no_path_returns`).** The field `returns` says that a return in time returns the record. So every act on the loop has gain zero: a path that returns registered nothing. What the theorem allows is a closed path on which nothing is erased. That nature protects its order of time is the conjecture of Hawking \[4\]; here it is the statement that a trace cannot be carried round a loop, on the premise named.

## 6. A Horizon Only Grows

**On the premises (`a_horizon_only_grows`).** The field `horizon` says that the area is a starting value plus the record. So the area never decreases, and it is strictly larger after a span that starts with an erasing act.

Hawking proved the area theorem in general relativity from the field equations and a condition on the energy of what falls in \[1\]. That a horizon hides what has crossed it is the setting of Penrose \[6\]. Here no condition on energy is used: the sign comes from the gain, and the premise is that the area counts the record, in the proportion of Bekenstein and Hawking \[2, 3\]. A hole that radiates is not a surface that only registers, and its area goes down \[3\]; the field does not cover it, and Section 7 does.

## 7. Nothing Is Lost

**The majority changes hands once (`the_majority_changes_hands_once`).** Let a share never decrease and pass half of a total *N* at some time. Then there is one time from which it holds more than half, and before which it does not.

**Nothing is left (`nothing_is_left`, `turnover_of_the_record`).** Let two shares sum to *N* at every time, the first starting at zero and reaching *N*. The second holds more than half at the start and nothing at the end.

**On the premises (`nothing_is_lost`).** Let the record reach a total *N*, and call the rest, *N* less the record, the share of the other holder. That the two shares sum to *N* is the definition of the rest. Then the other holder starts with more than half and ends with nothing, and the record holds more than half from one time on. Read with the radiation of a hole as the record and the hole as the holder of the rest, this is the turnover of Page \[5\]; that reading is premise-grade and is not a field.

**A boundary (`a_boundary_writes`).** A boundary of *k* sites of one bit writes 2^k names. That the record of a region is a function of its boundary is the proposal of ’t Hooft and Susskind \[7, 8\]; the paper does not derive it.

## 8. The Numerical Twin

The twin of Appendix B does three things the kernel does not. It executes the statements on generated histories, it searches for a map that undoes an erasure, and it sets one reading against a published measurement.

**Histories.** An act is built from a random pairing of 64 states: one time in three it is idle, and otherwise it writes each of a random half of the pairs as one state, and then renames the states. In 500 histories of 40 acts, with 7947 erasing acts, no act raises the number of states told apart and none takes it below one half. Of 410000 spans, 35997 return the record, and none of them holds an erasing act; every span that starts with an erasing act ends strictly above its start. For 203251 pairs of times with an erasing act at the first, the twin tests whether any map of the states could give the earlier history from the later one, and finds none.

**The seat, the turnover, a boundary.** On 451 states of the seat, 440 states off the line give 220 values of the registration, each taken twice, and 11 states on the line give 11, each taken once. A total of 1000 registered act by act, with the gain one or, one time in five, zero, takes 1241 acts; the majority changes hands at act 634, once. A boundary of 12 sites writes 4096 distinct names.

**The measurement.** For the merger GW150914 the two holes had masses 36 and 29 in solar units, with published intervals reaching 41 and 33, and the remnant 62, reaching down to 58, with spin 0.67, reaching up to 0.72 \[9\]. The initial holes are taken without spin, which makes their areas largest. The two holes before the merger are read as one registering surface whose area is the sum of the two; that reading is premise-grade.

- **central values** · Sum of the initial areas: 4274.0; Area of the remnant: 6697.6; Ratio: 1.567
- **the corner of the intervals least favourable to the statement** · Sum of the initial areas: 5540.0; Area of the remnant: 5698.5; Ratio: 1.029

The areas are in units of the square of the solar mass, with a common factor dropped. Ten checks pass and none fails. Three limits are stated. The corner is not a probability; it is the worst case the printed intervals allow. An analysis of the same signal that measures the two areas separately finds agreement with the area statement at 97 per cent probability \[10\], and a later signal confirms it \[11\]; these are printed as readings and are not counted. And the measurement precedes this work: the table is agreement with the record, not a new prediction.

## 9. Discussion: The Reading

The derivation above uses only finite sets and maps. This section states the reading from which the premises come, and marks what in it is theorem and what is premise.

**Why registrations.** In the reading of Part II what happens is what is registered, and the registration is the one of the seat: it keeps the height of a state and forgets its side \[15\]. That is the field `registers`. The premise is physics and is not a theorem of this paper. What the paper proves is what the premise forces: a record that changes only by what is registered, by at most one bit an act, and never downward.

**Why the area and the loop.** A horizon is a surface that registers what crosses it and returns nothing; the reading is that its area counts that record. A return in time brings a system back to an earlier state of the world; the reading is that it brings the record back with it. Those are the fields `horizon` and `returns`. Each is a statement of physics, and each is written as a field so that the theorem that uses it can be checked alone.

**What is not derived: the direction.** The record grows along the order in which the acts are done, and that order is the index of the history: an input of the object, not a consequence of a law. The paper proves that a record cannot be unwound. It does not prove which way the world runs.

**What the paper does not claim.** It does not derive the area theorem of general relativity, the entropy of a hole, or the curve of Page. It does not prove that the set of states of the world is finite. It does not claim that the area theorem or chronology protection was unknown. It claims that the step law and the one sign hold for every sequence of maps, that a registration erases at most one bit, that no map undoes an erasure, that the three consequences follow from three named premises, and that each statement of Section 1.3 marked proved compiles. No theorem of Sections 2 to 8 depends on Part II.

## 10. Predictions, Falsifiers, and What Stands

The paper recovers the area statement, the protection of the order of time, and the turnover. It predicts no measurement that they do not and derives no constant. Its commitments are those of the premises, and they are stated here as commitments: three that the paper says will stand at any future precision, two proposals it says will fail, and the three observations that would refute it.

### 10.1 Three predictions that will stand

1.  **The area of a horizon that only registers never decreases.** `a_horizon_only_grows` gives it. The remnant of GW150914 exceeds the two holes together at the least favourable corner of the intervals \[9, 10\]. The prediction is that every merger does.
2.  **Nothing that leaves a trace returns to its own past.** `no_path_returns` gives it. The prediction is that no process is found that registers and closes on itself in time.
3.  **An erased bit is not restored by any later map of the same states.** `no_map_undoes_an_erasure` gives it. The prediction is that every apparent restoration draws on states outside the set, where the bit was kept.

### 10.2 Two proposals that will fail

1.  **A hole that ends with part of the record unreturned.** `nothing_is_lost` leaves nothing with the other holder when the record reaches its total. The paper predicts that every account in which a hole ends and information is gone \[3\] gives up the premise that the process ends with the record complete, or the reading of the radiation as the record.
2.  **A machine that carries a record round a loop in time.** `no_path_returns` forbids it. The paper predicts that every such proposal either carries nothing or does not close.

### 10.3 The three falsifiers

Each is a forbidden observation. No observation breaks a theorem; each refutes a premise, and each names the theorem that carries the consequence. The threshold in each case is five of the experiment’s printed uncertainties.

1.  **A horizon that only registers whose area decreases.** It refutes the field `horizon`, through `a_horizon_only_grows`.
2.  **A process that registers and returns to its own past.** It refutes the field `returns` or the field `registers`, through `no_path_returns`.
3.  **Two states written as one and told apart again by a later map of the same states.** It refutes the fields `State` and `act`, that what happens is a sequence of maps of one set of states, through `no_map_undoes_an_erasure`.

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

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author’s. The Lean file and the Fortran twin are written by a language model under the author’s direct supervision. Every theorem named in the text of Sections 1 to 10 and 12 is in Appendix A under that name, and its kernel line is printed in Appendix D. Classical results that are cited and not formalised are named as such in Section 1.3 and wherever they are used. No constant of nature is derived anywhere in this paper; the numbers of the twin are computed from generated histories and from measured inputs, which Appendix B prints.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1.  S. W. Hawking, Phys. Rev. Lett. 26 (1971) 1344.
2.  J. D. Bekenstein, Phys. Rev. D 7 (1973) 2333.
3.  S. W. Hawking, Commun. Math. Phys. 43 (1975) 199.
4.  S. W. Hawking, Phys. Rev. D 46 (1992) 603.
5.  D. N. Page, Phys. Rev. Lett. 71 (1993) 3743.
6.  R. Penrose, Riv. Nuovo Cimento 1 (1969) 252.
7.  G. ’t Hooft, Dimensional reduction in quantum gravity, arXiv:gr-qc/9310026 (1993).
8.  L. Susskind, J. Math. Phys. 36 (1995) 6377.
9.  B. P. Abbott et al. (LIGO and Virgo), Phys. Rev. Lett. 116 (2016) 061102.
10. M. Isi, W. M. Farr, M. Giesler, M. A. Scheel and S. A. Teukolsky, Phys. Rev. Lett. 127 (2021) 011103.
11. A. G. Abac et al. (LIGO, Virgo and KAGRA), Phys. Rev. Lett. 135 (2025) 111403.
12. R. Landauer, IBM J. Res. Dev. 5 (1961) 183.
13. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
14. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
15. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).

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

**Appendix A · SPHYS_Record_Forced_CC.lean.** Lean 4.19.0 with Mathlib 4.19.0. 29 theorems, no axiom declared, no `sorry`, exit 0 with no warning. The kernel lines are Appendix D. *[a printed file, 447 lines, in the master and in the Journal edition]*

**Appendix B · Record_Forced_Twin_CC.f90.** Ten checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix C. *[a printed file, 214 lines, in the master and in the Journal edition]*

**Appendix C · Run of Appendix B.** ```text
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
 BATTERY-JSON: {"checks":10,"failures":0} *[a printed file, 25 lines, in the master and in the Journal edition]*

**Appendix D · Kernel lines of Appendix A.** Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own. *[a printed file, 33 lines, in the master and in the Journal edition]*
