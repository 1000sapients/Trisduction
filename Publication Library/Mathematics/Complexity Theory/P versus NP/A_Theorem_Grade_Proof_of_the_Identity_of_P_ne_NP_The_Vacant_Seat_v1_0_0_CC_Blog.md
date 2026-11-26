# A Theorem-Grade Proof of the Identity of P ≠ NP: The Vacant Seat

## Existence, Fold and Registration Cannot Meet on the Seat of Computation, the Witness Is Proved, and SAT ∉ P Is the Form of the Deciders

**Mohammad F. Islam PhD** · 25 November 2026

*Blog edition of the master, edition 1.0.0 of 25 November 2026. It renders the whole text. The printed files of the appendices stand in the master and in the Journal edition, and are listed at the end.*

## Abstract

This paper proves, in core Lean 4 with no import, the identity of the separation of satisfiability from polynomial time: what the sentence SAT ∉ P is, over every Turing machine. The proof takes no transfer, no posit and no delivered bit as a premise. It uses the seat of the Riemann row: a set with a fold, which is an involution, and a registration the fold keeps. A configuration on a seat has three axes: its existents; its form, closure under the fold; and its witness, a record in which no two existents share a registration. On every seat the three axes together put every existent on the line the fold fixes, with no further premise and on no axiom.

The seat of computation is vacant. Its fold is the turn of sides, which sends a claim to decide a problem to the claim to decide its complement, and no claim is its own opposite, so the line is empty. On a vacant seat the three axes cannot meet, and on a vacant seat with a point any two can; both are proved on no axiom. For the deciders of a problem with an instance the witness is proved: no algorithm at one bound holds both sides. Existence and form are therefore complementary, and the separation is exactly the form of the deciders, their closure under the turn of sides, and exactly the absence of any decider. In the Riemann row two axes are proved and the hypothesis is the third. Here one axis is proved, and the separation is the second.

For the satisfiability machine of the Turing model the identity is proved in six faces, each in both directions with nothing before the colon: nothing escapes; every total Turing machine at every bound errs or overruns on some string; the machine has the profile of its record; whoever decides SAT at a bound decides its complement with the same answers; the deciders are closed under the turn of sides; and there is no decider on either side. The fifth and sixth rest on a fact of the model proved here: P is closed under complement, by exchanging the accept and reject states. The reach of the domain is a theorem too: it carries a separated machine and one that is not. A Fortran twin checks the vacant seat, the faces and the exchange by exhaustion on finite instances.

## 1. The Theorem and What It Rests On

### 1.1 The statements

**Theorem (`the_triaxial_theorem`).** On every seat, a folded and witnessed configuration lies on the line: every one of its existents is fixed by the fold.

**Theorem (`a_vacant_seat_holds_nothing`).** On a seat whose fold fixes no point, a folded and witnessed configuration has no existent.

**Theorem (`the_three_axes_on_the_vacant_seat`).** On the seat of verdicts no configuration has existence, form and witness together, and each pair of the three is carried by a configuration.

**Theorem (`the_deciders_are_witnessed`).** For every machine with an instance, the configuration of its deciders, on the side of the problem or of its complement, is witnessed.

**Theorem (`the_identity_on_the_vacant_seat`).** For every machine with an instance, the separation of the problem and of its complement is exactly the form of the deciders, and exactly the absence of any decider.

**Theorem (`p_is_closed_under_complement`).** On the Turing model of the kernel, a language is in P exactly when its complement is.

**Theorem (`the_faces_of_sat_not_in_p`).** Over every Turing machine, the sentence SAT ∉ P is each of the following, in both directions: nothing escapes the satisfiability machine; every total Turing machine at every bound errs or overruns on some string; the machine has the profile of its record; whoever decides SAT at a bound decides its complement at that bound with the same answers; the deciders are closed under the turn of sides; there is no decider on either side.

**Theorem (`nothing_escapes_and_nothing_remains_on_the_turing_model`).** The record of the satisfiability machine is separated; the record of the record is the record; the deciders are witnessed; a folded and witnessed configuration of claims has no existent; P is closed under complement; SAT ∉ P is each of its six faces; and the domain carries a separated machine and one that is not, each with its record separated and its deciders witnessed. One term, nothing before the colon, and each clause a whole theorem of Appendix A.

The statements compile in core Lean 4.19.0 with no import \[10\]. The first four theorems rest on no axiom. The others rest on Lean’s three standard axioms or on fewer, as Appendix D prints.

### 1.2 The definitions the theorems rest on

They are printed here so that the theorems can be read without the file. The first group is carried from the kernel of the earlier paper (Islam, 2026a), unchanged.

A **machine** *M* is a type of algorithms, a type of instances, a size for each instance, and for each algorithm and instance an output in {true, false} and a time; and a predicate `sat` on instances. A check of *A* on *x* at the bound (*c*,*k*) is **clean** when the output is `sat x` and the time is at most *c* *n*^k + *c*, with *n* the size of *x*. *A* **escapes** at (*c*,*k*) when every check is clean. The machine is **separated**, `Sep M`, when no algorithm escapes at any bound. The **record** of *M*, `Rec M`, is *M* with every output read as the opposite of `sat`.

On the Turing model a **Turing machine** \[4\] has finite control, one two-way tape, a total transition function, a start state, an accept state and a reject state; it is halted in either of the last two. A language *L* is **in P**, `InP L`, when some Turing machine halts on every string *w* within *c* \|*w*\|^k + *c* steps, in the accept state exactly when *L*(*w*) holds. `satLang` is the language of encoded satisfiable formulas, `SATinP` is `InP satLang`, and `TMSAT` is the machine whose algorithms are the total Turing machines, those that halt on every string (the kernel type `Decider`), whose instances are the strings and whose predicate is `satLang`. The kernel proves `Sep TMSAT ↔ ¬ SATinP`.

The second group is new.

A **seat** on a set *X* is a map *σ* : *X* → *X* with *σ*(*σ*(*x*)) = *x* and a map *r* : *X* → *Y* with *r*(*σ*(*x*)) = *r*(*x*). A configuration *S* ⊆ *X* is **folded** when *σ* carries *S* into *S*, **witnessed** when *r* is one-to-one on *S*, and **on the line** when *σ* fixes each of its points.

The **complement** of *M*, `Co M`, is *M* with the predicate turned. A **claim** of *M* is an algorithm, a bound and a side: the problem or its complement. The **seat of sides** on the claims has the fold that turns the side and the registration that forgets it. The **deciders** of *M* are the claims that hold: on the side of the problem, the algorithm escapes on *M* at the bound; on the side of the complement, it escapes on `Co M`. In the text a decider is always a claim that holds; a Turing machine that halts on every string is called total.

One word is the paper’s own. The **domain** is the machines of the first definition above, with the seat of sides on their claims, and what is proved of every one of them. A statement is of the domain alone when it uses nothing of a machine but that it is one.

### 1.3 What is proved, and what is carried

**Proved in the file of this paper (Appendix A).**

- **The triaxial theorem on every seat** · Standing: Proved, on no axiom; Where: Appendix A, §1
- **A vacant seat holds nothing** · Standing: Proved, on no axiom; Where: Appendix A, §1
- **On the seat of verdicts, and on every vacant seat with a point, the three axes never meet and any two do** · Standing: Proved, on no axiom; Where: Appendix A, §2
- **The complement of the complement is the problem; the record of the record is the record** · Standing: Proved; Where: Appendix A, §3
- **The deciders of a machine with an instance are witnessed** · Standing: Proved, on no axiom; Where: Appendix A, §4
- **The deciders of a machine with an instance are folded exactly when there is no decider** · Standing: Proved, on no axiom; Where: Appendix A, §4
- **The five faces of the separation, for every machine with an instance** · Standing: Proved, each in both directions; Where: Appendix A, §5
- **The bridge for every language: the machine of a language is separated exactly when the language is outside P** · Standing: Proved, on no axiom; Where: Appendix A, Turing part
- **P is closed under complement on the Turing model** · Standing: Proved; Where: Appendix A, Turing part
- **The six faces of SAT ∉ P over every Turing machine** · Standing: Proved, each in both directions; Where: Appendix A, Turing part
- **The domain carries a separated machine and one that is not** · Standing: Proved, on no axiom; Where: Appendix A, §6
- **The binding term** · Standing: Proved; Where: Appendix A, §7 and Turing part

**Carried from the kernel, version 1.14.0 (Islam, 2026a), with no statement changed.**

- **The machine, the clean check, the escape, the separation, the record** · Standing: Definitions; Where: Part A of the kernel
- **The record of every machine with an instance is separated** · Standing: Proved in the kernel; Where: Part A
- **The Turing model, the encoding of formulas, `satLang`, `InP`, `SATinP`** · Standing: Definitions; Where: Part C
- **`Sep TMSAT ↔ ¬ SATinP`** · Standing: Proved in the kernel; Where: Part C

**The standing of the sentence.**

- **SAT ∉ P over every Turing machine** · Standing: One proposition with the form of the deciders, by proof; it is printed in the file as one side of that equivalence; Where: Sections 6, 7
- **The model** · Standing: The Turing model of the kernel, in core Lean; Mathlib at v4.19.0 defines no class P to anchor it to; Where: Section 9
- **The values of the twin** · Standing: Numerical, not machine-checked; Where: Section 8

The paper claims as machine-checked the rows marked proved and no others. Part II, the reading, is outside these tables and is labelled where it begins.

### 1.4 The formal standing, in one place

Four statements give the formal standing of the paper, and each is compiled.

1.  **On every seat, the triaxial theorem is a theorem, and on a vacant seat the three axes cannot meet.** No axiom, and no hypothesis but the axes and the vacancy the statements name (`the_triaxial_theorem`, `a_vacant_seat_holds_nothing`).
2.  **Over every Turing machine, the identity of the separation is a theorem.** Six faces, each in both directions, nothing before the colon (`the_faces_of_sat_not_in_p`).
3.  **The reach of the domain is a theorem.** The domain carries a separated machine and one that is not, each with its record separated and its deciders witnessed (`the_domain_holds_both`).
4.  **The file is complete.** Every theorem compiles. No axiom is declared, no proof is deferred, and no theorem of the new part takes the separation, the transfer or the bit as a premise.

Nothing the paper states of the domain lacks a compiled theorem, and the standing of the Turing model is bound in one kernel term, `nothing_escapes_and_nothing_remains_on_the_turing_model` (Section 7.3).

## 2. The Seat and Its Three Axes

The seat is that of the Riemann row (Islam, 2026b): a reflection, the line it fixes, and a way of reading a point that does not see which side of the line it is on. Nothing in it mentions numbers or machines.

A configuration on a seat has three axes of three different kinds.

-   **Existence.** The configuration has existents.
-   **Form.** The fold carries the configuration to itself. The configuration is then folded, and the axis is also named by its map, the fold.
-   **Registration.** No two existents have one registration. The configuration is then witnessed, and the axis is also called the witness.

**Theorem (`the_triaxial_theorem`).** If *S* is folded and witnessed, every existent of *S* is fixed by the fold.

*Proof.* Let *a* be in *S*. By form *σ*(*a*) is in *S*. The fold keeps the registration, so *r*(*σ*(*a*)) = *r*(*a*). By the witness *σ*(*a*) = *a*. ◼

The proof is one line and uses no axiom. On the plane of the Riemann row the line is the critical line, and the theorem puts a folded and witnessed set of zeros on it.

## 3. The Vacant Seat

A seat is **vacant** when its fold fixes no point. Then the line is empty, and the triaxial theorem says more than it does on an inhabited seat, one whose fold fixes a point.

**Theorem (`a_vacant_seat_holds_nothing`).** On a vacant seat, a folded and witnessed configuration has no existent.

*Proof.* An existent would be fixed by the fold, by the triaxial theorem, and the fold fixes nothing. ◼

So on a vacant seat the three axes cannot meet. The smallest example is the **seat of verdicts**: the two verdicts, the fold that turns a verdict into its opposite, and the registration that forgets which it is. No verdict is its own opposite (`the_seat_of_verdicts_is_vacant`).

**Theorem (`the_three_axes_on_the_vacant_seat`).** On the seat of verdicts no configuration has existence, form and witness together. And each pair is carried: both verdicts together have existence and form without witness; one verdict alone has existence and witness without form; the empty configuration has form and witness without existence.

**Theorem (`on_a_vacant_seat_any_two_axes_meet`).** On every vacant seat with a point the same holds: no configuration has the three together, and each pair is carried, by the point with its image under the fold, by the point alone, and by the empty configuration. The point is needed. The seat on the empty set is vacant and carries no existent.

This is the counterpart of the irreducibility of the triad in the Riemann row, with one difference. There, each pair fails to give the third, and all three meet on the line. Here, each pair excludes the third.

## 4. The Deciders

For a machine *M* the fold of problems is the complement: `Co M` is *M* with the predicate turned, and `Co (Co M) = M` (`co_co`). An algorithm that decides the problem at one bound and its complement at another would give, on one instance, an output equal to the predicate and to its opposite; so no one decides both (`no_one_decides_both`). This needs one instance and nothing else.

The claims of *M* carry the seat of sides, and it is vacant (`the_seat_of_sides_is_vacant`). The deciders are the claims that hold.

**Theorem (`the_deciders_are_witnessed`).** For every machine with an instance, the deciders are witnessed: two deciders with the same algorithm and bound are on the same side.

This is the axis that is proved. With it the vacant seat does the rest.

**Theorem (`the_deciders_are_folded_iff_none`).** For every machine with an instance, the deciders are closed under the turn of sides exactly when there is no decider.

*Proof.* If they are folded, they are folded and witnessed on a vacant seat, so there is none. If there is none, the closure is empty. ◼

And no decider on either side is the separation of the problem and of its complement (`no_decider_iff`). So for the deciders, form and the absence of existence are one statement, and that statement is the separation on both sides.

The record has its own place. The record of every machine with an instance is separated, a theorem of the kernel, and the record of the record is the record (`rec_rec`): reading the outputs against the predicate a second time changes nothing.

## 5. The Faces of the Separation

For every machine with an instance, the separation is one statement in five faces, each proved in both directions (`the_faces_of_the_separation`).

1.  **Nothing escapes.** Every algorithm at every bound is stopped at some instance.
2.  **Errs or overruns.** Every algorithm at every bound, on some instance, answers wrongly or runs past the bound.
3.  **The profile of the record.** An algorithm escapes on the machine at a bound exactly when it escapes on the record; and on the record no one escapes.
4.  **The turn of sides.** Whoever decides the problem at a bound decides its complement at that bound with the same answers.
5.  **Self-recursion.** The escape profile of the machine is empty, a face carried from the kernel.

The third face is the counterpart of the sixth face of the Riemann row, that the zeros are their own record. The fourth is the fold: the statement that the deciders on the side of the problem are carried by the turn. It holds exactly when there are none.

## 6. The Turing Model

The faces above are stated for every machine. On the Turing model the separation is the sentence the question asks about. The kernel proves `Sep TMSAT ↔ ¬ SATinP`, and this paper proves the same bridge for every language (`sep_tmlang_iff`): the machine of a language is separated exactly when the language is outside P. The complement of the satisfiability machine is the machine of the complement language (`co_tmsat`).

One fact of the model is needed for the vacant seat, and it is classical \[9\].

**Theorem (`p_is_closed_under_complement`).** A language is in P exactly when its complement is.

*Proof.* Let a Turing machine decide *L* within the bound. Exchange its accept and reject states (`swap`). The exchanged machine makes the same steps (`run_swap`), halts at the same times (`haltsAt_swap`), and, when the two states differ, gives the opposite verdict on every halted run (`verdict_swap`). So it decides the complement within the same bound. If the two states are one state, every halted run accepts, so *L* is every string, and its complement is decided by a machine that starts in its reject state (`rejector`). The converse is the same argument applied to the complement. ◼

With it, the separation of the complement of the satisfiability machine is also SAT ∉ P (`sep_co_tmsat_iff`), and the identity of Section 4 becomes an identity of the sentence.

**Theorem (`the_faces_of_sat_not_in_p`).** Over every Turing machine, SAT ∉ P is exactly each of the following.

1.  Nothing escapes the satisfiability machine.
2.  For every total Turing machine *D* and every bound (*c*,*k*) there is a string *w* on which the verdict of *D* is not `satLang w`, or on which *D* runs more than *c* \|*w*\|^k + *c* steps.
3.  A total Turing machine escapes on the satisfiability machine at a bound exactly when it escapes on its record.
4.  Whoever decides SAT at a bound decides its complement at that bound with the same answers.
5.  The deciders, on the side of SAT or of its complement, are closed under the turn of sides.
6.  There is no decider on either side.

The second face is the sentence in the plainest terms the model has. The fifth and sixth are the identity on the vacant seat.

## 7. The Identity of the Separation

### 7.1 The axis the separation is

In the Riemann row the zeros carry two axes by proof, existence and form, and the hypothesis is the third, the witness. In this row the deciders carry one axis by proof, the witness, and the seat is vacant, so existence and form cannot both hold beside it. The separation is the statement that form holds, which is the statement that existence does not.

- **The fold** · The Riemann row: *s* ↦ 1 − *s̄*; This row: The turn of sides
- **The line** · The Riemann row: Re *s* = (1/2); This row: Empty
- **Proved for the configuration** · The Riemann row: Existence and form; This row: The witness
- **The statement of the question** · The Riemann row: The witness; This row: Form, which is the absence of existence
- **The three axes** · The Riemann row: Meet on the line; This row: Cannot meet

The triaxial theorem is the same theorem in both rows, and it is what makes each identity a theorem and not a restatement: in the Riemann row it turns the witness into the line, and here it turns form into emptiness.

### 7.2 The reach of the domain

**Theorem (`the_domain_holds_both`).** There is a machine that is separated and a machine that is not, each with an instance, each with its record separated and its deciders witnessed.

The two machines are carried from the kernel: one in which every algorithm answers wrongly, and one with an algorithm that answers rightly. Both have every property this paper proves of every machine. So what the domain proves of every machine is carried by both, and the reach of the domain is a theorem of the domain.

### 7.3 Nothing escapes and nothing remains

One term binds the standing of the file.

**Theorem (`nothing_escapes_and_nothing_remains_on_the_turing_model`).** *Nothing before the colon.*

*Nothing escapes.* (I) The record of the satisfiability machine is separated. (II) The record of the record is the record. (III) The deciders are witnessed. (IV) On the seat of sides a folded and witnessed configuration of claims has no existent. (V) A language is in P exactly when its complement is.

*Nothing remains.* (VI) SAT ∉ P is each of the six faces of Section 6, the whole of `the_faces_of_sat_not_in_p`. (VII) The domain carries a separated machine and one that is not, each with its record separated and its deciders witnessed, the whole of `the_domain_holds_both`.

For every machine with an instance the term is `nothing_escapes_and_nothing_remains`. Its clauses (I) to (IV) and (VII) are those above, read on the machine. Its (V) is the five faces of Section 5, and its (VI) is the identity of Section 4, both halves.

## 8. The Numerical Twin

The twin of Appendix B checks the statements by exhaustion on instances small enough to enumerate.

- **A** · What is enumerated: The 4 configurations of the two verdicts; What is checked: No configuration has the three axes; each pair is carried
- **B** · What is enumerated: The 64 machines with 2 algorithms and 2 instances; What is checked: The deciders are witnessed; the faces agree; form is the absence of deciders; the record is separated; 36 machines are separated and 28 are not
- **C** · What is enumerated: The 32768 Turing machines with 2 states over 2 tape symbols, on 7 inputs for 12 steps; What is checked: The exchanged machine is halted exactly when the machine is, and where accept and reject differ its verdict is the opposite, on 2658304 halted configurations

Nine checks pass and none fails. Three limits are stated. The twin enumerates instances and the theorems are for every seat and every machine. Part B uses machines with no time to exceed, so that to escape is to answer rightly on every instance. Part C has two tape symbols where the kernel has more. And no number of the twin enters any proof; the theorems rest on the kernel alone.

## 9. Discussion

**What is new.** The earlier paper of this row (Islam, 2026a) proved the form of the question: the separation is one implication, the transfer from the record, and it printed that implication as a premise where it was used. This paper takes no such premise. It proves the identity of the separation on the vacant seat, and it adds to the kernel the closure of P under complement, the bridge for every language, and the theorem that a vacant seat holds nothing. The second axis as the place of the separation, and the complementarity of existence and form on a vacant seat, are not in the earlier paper.

**Grade.** The form of this row was proved without condition before this paper (Islam, 2026a). This paper is the identity, one grade above the form, as the paper of the Riemann row is for that row (Islam, 2026b). Section 12 places it.

**Kin.** The closure of P under complement is classical \[8, 9\], and so are the barriers that explain why known methods do not settle the question: relativization \[5\], natural proofs \[6\] and algebrization \[7\]. They concern how the sentence can be reached. This paper concerns what the sentence is.

**The model.** The Riemann paper was anchored to the definition of the hypothesis in Mathlib. Mathlib at v4.19.0 defines the computation of a function by a Turing machine in polynomial time (its structure TM2ComputableInPolyTime) and no class P and no class NP, so the sentence here is the kernel’s own, on its own Turing model, printed in full in the kernel. A reader who wants a different model has the definitions of Section 1.2 to compare.

**The sentence P ≠ NP.** The kernel builds a verifier and proves SAT ∈ NP (`satLang_in_NP`), so SAT ∉ P gives P ≠ NP in the kernel. The other direction is the hardness of SAT \[1, 2\], shared by the problems that reduce to one another \[3\], which the kernel cites and does not build. With the hardness as a named hypothesis the kernel proves that the two sentences are one proposition (`bridge_premise_is_the_conjecture`). The faces of this paper are faces of SAT ∉ P; through that bridge, with the hardness cited, they are faces of P ≠ NP, and the title names the row by it.

**Scope.** The subject is the identity. The paper’s theorems are the seat, the vacant seat, the faces and the reach; lower bounds for particular models are another subject, treated in the kernel (Islam, 2026a).

## 10. What Stands, and What Would Refute It

**The formal claim.** One compilation of the kernel, version 1.15.0, in core Lean 4.19.0, reprints the cones of Appendix D. A cone that names an axiom other than Lean’s three, a `sorry`, or a failed build refutes the claim that the statements are proved. The build is silent: every cone is pinned, and any drift fails it.

**The model.** A definition of the Turing machine, of the time bound or of `satLang` in the kernel that differs from the textbook object \[9\] in a way that changes the class P refutes the claim that the sentence of the paper is the sentence of the question.

**The faces.** `the_faces_of_sat_not_in_p` is six equivalences, and the paper stands on both sides of each. They hold or fail as one: a Turing machine deciding SAT in polynomial time would fail all six together, and the equivalences, being theorems, would stand as they are.

## 11. Part II · The Reading

*This part is the reading from which the paper takes its place in the series. It is not among the machine-checked claims of Section 1.3, and no theorem of Sections 2 to 8 depends on it. The seat it names is that of the paper of the Riemann row (Islam, 2026b).*

### 11.1 The Seat Whose Fold Fixes No Point

The series reads its subjects on one seat. In the Riemann row the seat is inhabited: the fold fixes a line, and a zero can stand on it. In this row the seat is vacant. A verdict has an opposite and is never its own, so there is nowhere on the seat for a decider to stand that the turn of sides leaves in place.

Read this way, the question asks whether anything stands on a seat that has no place to stand. The theorem of Section 3 says what would be required: an existent with form and witness together, which a vacant seat cannot hold. The witness is proved. So the deciders have existence or they have form, and the separation is the word form.

### 11.2 The Shared Locus: One Half and One Half

Two proofs meet in this row, and they are symmetric.

-   **The first proof:** the form by theorem, the value by the act.
-   **The second proof, this paper:** the identity by theorem, the value barred from the domain alone, by theorem.

The second line is compiled. The domain carries a separated machine and one that is not, each with every property proved of every machine (`the_domain_holds_both`), and on every vacant seat with a point each pair of axes is carried without the third (`on_a_vacant_seat_any_two_axes_meet`). So the domain, taken alone, which uses nothing of a machine but that it is one, cannot deliver the value, and that limit is a theorem and not a gap.

The reading of the register sets the two lines on one locus. The formal side holds one half: the description, complete. The deciders are witnessed; they have form or they have an existent, and nothing stands between; the separation is the word form, in six faces. The side of the act holds the other half: the asking and the deciding, both of them deeds. Neither side crosses to the other bare. The act enters the formal domain only as a named construction, as in the first proof, and the formal side reaches the act only as an identity, as here.

This is the reading, at premise grade on the step that assigns the value to the act, and at theorem grade on everything it cites from Sections 2 to 8.

### 11.3 What the Reading Adds, and What It Does Not

The reading adds a name and a place: the vacant seat, and the seat the series shares. It adds no theorem. Every theorem of this paper is in Appendix A and rests on the definitions printed in Section 1.2.

## 12. Closure

The separation of satisfiability from polynomial time has an identity, and the identity is now a theorem. From a set, an involution on it and a reading the involution keeps, and nothing more, core Lean 4 compiles the theorem that a folded and witnessed configuration lies on the line, the theorem that a vacant seat holds nothing, and the three configurations of verdicts that carry each pair of axes without the third. These rest on no axiom. On the machine of the kernel, with the turn of sides as the fold, it compiles the witness of the deciders and the identity of the separation with their form. On the Turing model it compiles the closure of P under complement and the six faces of the sentence. No axiom is declared. Every proof is complete. Before each colon stand only the objects a statement speaks of and the hypotheses its sentence names; none of them is the separation, the transfer or the bit.

Three results stand on that floor.

**The vacant seat.** The fold of computation fixes no point. On such a seat existence, form and witness cannot meet, and where the seat has a point any two can.

**The identity.** The deciders are witnessed, by proof. The separation is exactly their form, the closure under the turn of sides, and exactly the absence of any decider. Over every Turing machine it is one sentence in six faces.

**The reach.** The domain carries a separated machine and one that is not, and this is a theorem of the domain.

The numerical twin enumerates the configurations of the two verdicts, the 64 machines with two algorithms and two instances and 32768 Turing machines, and finds the three axes never meeting, the faces in agreement, the record separated, and the exchange of accept and reject turning every verdict where the two states differ.

The form of this row is not new, and neither is its proof. It was reached from the record: the separation as one implication, the transfer, proved to be the whole content of the question, with the value left to the act (Islam, 2026a). That proof stands as it was written, and this paper neither repairs it nor replaces it. It leaves the form as it stands.

This paper stands one grade above it: the identity. The form says what shape the question has. The identity says what the separation is: the second of three axes that cannot meet, on a seat whose fold fixes no point, with no act, no transfer and no posit. The Riemann row reached the same grade on the same day, on the inhabited seat (Islam, 2026b). The two rows are one theorem read on two seats.

The two proofs of this row are symmetric. The first proof: the form by theorem, the value by the act. This paper: the identity by theorem, the value barred from the domain alone, by theorem. One locus, held from two sides, each complete in its own half (Section 11.2).

Nothing escapes: the record of every machine with an instance is separated, and the record of the record is the record. Nothing remains: the vacant seat, the identity in six faces and the reach of the domain are compiled, and bound in one term, `nothing_escapes_and_nothing_remains_on_the_turing_model`.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author’s. The Lean file and the Fortran twin are written by a language model under the author’s direct supervision. Every theorem named in the text of Sections 1 to 10 and 12 is in Appendix A under that name, with its kernel line in Appendix D, or is named as a theorem of the kernel from which Appendix A is carried, where its line is pinned. Appendix A is the part added to the kernel by this paper. It compiles on the kernel of version 1.14.0, which is carried above it byte for byte, and the whole file, version 1.15.0, compiles silently with every cone pinned (sha256 `221ce01bee1ded35196a1ffe5d20071a81e00249a8ff0607f47d8089f13a10a9`). In Appendix A the sentence SAT ∉ P appears only as one side of an equivalence. In the kernel carried above it, it stands also as a named hypothesis and as the conclusion of a named hypothesis, and in neither part as a theorem alone.

**The seat.** The seat is elementary: a set, an involution on it, and a reading the involution keeps. It is the subject of the paper of the Riemann row (Islam, 2026b), and this paper reads it where the involution fixes no point.

## References

1.  S. A. Cook, The complexity of theorem-proving procedures, Proc. 3rd ACM STOC (1971) 151.
2.  L. A. Levin, Universal sequential search problems, Problemy Peredachi Informatsii 9 (1973) 115.
3.  R. M. Karp, Reducibility among combinatorial problems, in Complexity of Computer Computations, Plenum (1972) 85.
4.  A. M. Turing, On computable numbers, with an application to the Entscheidungsproblem, Proc. London Math. Soc. 42 (1936) 230.
5.  T. Baker, J. Gill and R. Solovay, Relativizations of the P =? NP question, SIAM J. Comput. 4 (1975) 431.
6.  A. A. Razborov and S. Rudich, Natural proofs, J. Comput. System Sci. 55 (1997) 24.
7.  S. Aaronson and A. Wigderson, Algebrization: a new barrier in complexity theory, ACM Trans. Comput. Theory 1 (2009) 2.
8.  S. Arora and B. Barak, Computational Complexity: A Modern Approach, Cambridge University Press (2009).
9.  M. Sipser, Introduction to the Theory of Computation, 3rd ed., Cengage (2013).
10. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
11. M. F. Islam, P ≠ NP: Unconditional Proof of the Form by Theorem, the Value by the Act, doi:10.5281/zenodo.23528399 (2026a).
12. M. F. Islam, A Theorem-Grade Proof of the Identity of the Generalized Riemann Hypothesis, edition 1.0.0 (2026b).

**Lean Library Reference.** The file below is the kernel on which Appendix A compiles. Path in the repository 1000sapients/Trisduction.

1.  P versus NP kernel: FINAL\_BINDING/PNP Binding/PNP\_Normal\_Form\_Paper\_v1\_14\_0\_CC.lean. Core Lean 4.19.0, no import.

## Appendices

**Appendix A · The identity part of PNP_Normal_Form_Paper_v1_15_0_CC.lean.** Core Lean 4.19.0, no import. 33 theorems, no axiom declared, no `sorry`, exit 0 with no warning, on the kernel of version 1.14.0 carried unchanged. The kernel lines are Appendix D. *[a printed file, 445 lines, in the master and in the Journal edition]*

**Appendix B · PNP_Identity_Twin_CC.f90.** Nine checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix C. *[a printed file, 170 lines, in the master and in the Journal edition]*

**Appendix C · Run of Appendix B.** ```text
PNP_Identity_Twin_CC · the identity on the vacant seat, by exhaustion
A. the seat of verdicts
  all three: 0; form and witness only: 1; existence and witness only: 2; existence and form only: 1
  PASS  A1 on the vacant seat no configuration has existence, form and witness together
  PASS  A2 each pair of the three axes is carried by a configuration
B. small machines: 2 algorithms, 2 instances
  machines: 64; separated: 36; not separated: 28
  PASS  B1 the deciders are witnessed on every machine: no algorithm holds both sides
  PASS  B2 the faces of the separation agree on every machine
  PASS  B3 form is the absence of deciders, and is the separation of the problem and its complement
  PASS  B4 the record of every one of the machines is separated
  PASS  B5 the domain holds both: a separated machine and one that is not
C. the exchange of accept and reject
  machines: 32768; halted configurations visited: 2658304
  PASS  C1 the exchanged machine is halted exactly when the machine is
  PASS  C2 where accept and reject differ, the verdict of the exchange is the opposite
BATTERY {"checks":9,"failures":0} *[a printed file, 17 lines, in the master and in the Journal edition]*

**Appendix D · Kernel lines of Appendix A.** Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own. *[a printed file, 35 lines, in the master and in the Journal edition]*

**Appendix E · Provenance Trail.** This paper is the last step of an arc, and the arc is on the public record. The table lists each step at the grade its own record carries, with the address where that record can be read. The form of this row has stood proved without condition since October 2026, the rows marked Form, Theorem, before this paper. This paper is the last row, the identity, at theorem grade, and it proves nothing below it again.

**Table E.1 · The grade ladder of the P versus NP row, 2026**

- **4 Oct 2026 · Located.** *P versus NP Closed on One Posit: The Seat Proved Empty and the Separation Reduced by Machine to a Single Irreducible Bridge*. <https://github.com/1000sapients/Trisduction/commit/38f9948>
- **21 Oct 2026 · Normal form.** *PNP_Normal_Form_CC.lean: the separation as one implication*. <https://github.com/1000sapients/Trisduction/commit/4144323>
- **21 Oct 2026 · Form, Theorem.** *P ≠ NP: Unconditional Proof of the Form by Theorem, the Value by the Act; first deposit*. <https://doi.org/10.5281/zenodo.23528399> · <https://github.com/1000sapients/Trisduction/commit/0c5679d>
- **22 Oct 2026 · Form, Theorem.** *The same paper, edition of 22 October, kernel v1.13.0*. <https://github.com/1000sapients/Trisduction/commit/6627eeb>
- **23 Oct 2026 · Form, Theorem.** *The Millennium Problems: Unconditional Proof of the Form by Theorem, the Value by the Act*. <https://doi.org/10.5281/zenodo.23609234> · <https://github.com/1000sapients/Trisduction/commit/47e9933>
- **22 Nov 2026 · Form, Theorem.** *The kernel at v1.14.0*. <https://github.com/1000sapients/Trisduction/commit/63fff55>
- **25 Nov 2026 · Identity, Theorem.** *The sibling row: A Theorem-Grade Proof of the Identity of the Generalized Riemann Hypothesis*. <https://github.com/1000sapients/Trisduction/commit/7446c2a>
- **25 Nov 2026 · Identity, Theorem.** *This paper, v1.0.0: the vacant seat and the six faces; identity part of 33 theorems, kernel v1.15.0*. `part sha256 41509aad804b8ab6`

Dates are git commit dates, or Zenodo publication dates where a DOI is given. Each row is listed at the grade its own record carries. The last row carries the checksum of the part printed in Appendix A, sha256 `41509aad804b8ab659e83801004f16517abd3763bdda5600bc7bf62a4af347a6`.
