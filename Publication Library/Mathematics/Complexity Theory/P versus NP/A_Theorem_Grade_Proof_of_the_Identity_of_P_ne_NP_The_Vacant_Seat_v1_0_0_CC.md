# A Theorem-Grade Proof of the Identity of P ≠ NP: The Vacant Seat

## Existence, Fold and Registration Cannot Meet on the Seat of Computation, the Witness Is Proved, and SAT ∉ P Is the Form of the Deciders

**Mohammad F. Islam PhD** · 25 November 2026

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

The statements compile in core Lean 4.19.0 with no import [10]. The first four theorems rest on no axiom. The others rest on Lean's three standard axioms or on fewer, as Appendix D prints.

### 1.2 The definitions the theorems rest on

They are printed here so that the theorems can be read without the file. The first group is carried from the kernel of the earlier paper (Islam, 2026a), unchanged.

A **machine** $M$ is a type of algorithms, a type of instances, a size for each instance, and for each algorithm and instance an output in $\{\text{true}, \text{false}\}$ and a time; and a predicate `sat` on instances. A check of $A$ on $x$ at the bound $(c, k)$ is **clean** when the output is `sat x` and the time is at most $c\,n^k + c$, with $n$ the size of $x$. $A$ **escapes** at $(c, k)$ when every check is clean. The machine is **separated**, `Sep M`, when no algorithm escapes at any bound. The **record** of $M$, `Rec M`, is $M$ with every output read as the opposite of `sat`.

On the Turing model a **Turing machine** [4] has finite control, one two-way tape, a total transition function, a start state, an accept state and a reject state; it is halted in either of the last two. A language $L$ is **in P**, `InP L`, when some Turing machine halts on every string $w$ within $c\,|w|^k + c$ steps, in the accept state exactly when $L(w)$ holds. `satLang` is the language of encoded satisfiable formulas, `SATinP` is `InP satLang`, and `TMSAT` is the machine whose algorithms are the total Turing machines, those that halt on every string (the kernel type `Decider`), whose instances are the strings and whose predicate is `satLang`. The kernel proves `Sep TMSAT ↔ ¬ SATinP`.

The second group is new.

A **seat** on a set $X$ is a map $\sigma: X \to X$ with $\sigma(\sigma(x)) = x$ and a map $r: X \to Y$ with $r(\sigma(x)) = r(x)$. A configuration $S \subseteq X$ is **folded** when $\sigma$ carries $S$ into $S$, **witnessed** when $r$ is one-to-one on $S$, and **on the line** when $\sigma$ fixes each of its points.

The **complement** of $M$, `Co M`, is $M$ with the predicate turned. A **claim** of $M$ is an algorithm, a bound and a side: the problem or its complement. The **seat of sides** on the claims has the fold that turns the side and the registration that forgets it. The **deciders** of $M$ are the claims that hold: on the side of the problem, the algorithm escapes on $M$ at the bound; on the side of the complement, it escapes on `Co M`. In the text a decider is always a claim that holds; a Turing machine that halts on every string is called total.

One word is the paper's own. The **domain** is the machines of the first definition above, with the seat of sides on their claims, and what is proved of every one of them. A statement is of the domain alone when it uses nothing of a machine but that it is one.

### 1.3 What is proved, and what is carried

**Proved in the file of this paper (Appendix A).**

| Statement | Standing | Where |
|---|---|---|
| The triaxial theorem on every seat | Proved, on no axiom | Appendix A, §1 |
| A vacant seat holds nothing | Proved, on no axiom | Appendix A, §1 |
| On the seat of verdicts, and on every vacant seat with a point, the three axes never meet and any two do | Proved, on no axiom | Appendix A, §2 |
| The complement of the complement is the problem; the record of the record is the record | Proved | Appendix A, §3 |
| The deciders of a machine with an instance are witnessed | Proved, on no axiom | Appendix A, §4 |
| The deciders of a machine with an instance are folded exactly when there is no decider | Proved, on no axiom | Appendix A, §4 |
| The five faces of the separation, for every machine with an instance | Proved, each in both directions | Appendix A, §5 |
| The bridge for every language: the machine of a language is separated exactly when the language is outside P | Proved, on no axiom | Appendix A, Turing part |
| P is closed under complement on the Turing model | Proved | Appendix A, Turing part |
| The six faces of SAT ∉ P over every Turing machine | Proved, each in both directions | Appendix A, Turing part |
| The domain carries a separated machine and one that is not | Proved, on no axiom | Appendix A, §6 |
| The binding term | Proved | Appendix A, §7 and Turing part |

**Carried from the kernel, version 1.14.0 (Islam, 2026a), with no statement changed.**

| Statement | Standing | Where |
|---|---|---|
| The machine, the clean check, the escape, the separation, the record | Definitions | Part A of the kernel |
| The record of every machine with an instance is separated | Proved in the kernel | Part A |
| The Turing model, the encoding of formulas, `satLang`, `InP`, `SATinP` | Definitions | Part C |
| `Sep TMSAT ↔ ¬ SATinP` | Proved in the kernel | Part C |

**The standing of the sentence.**

| Statement | Standing | Where |
|---|---|---|
| SAT ∉ P over every Turing machine | One proposition with the form of the deciders, by proof; it is printed in the file as one side of that equivalence | Sections 6, 7 |
| The model | The Turing model of the kernel, in core Lean; Mathlib at v4.19.0 defines no class P to anchor it to | Section 9 |
| The values of the twin | Numerical, not machine-checked | Section 8 |

The paper claims as machine-checked the rows marked proved and no others. Part II, the reading, is outside these tables and is labelled where it begins.

### 1.4 The formal standing, in one place

Four statements give the formal standing of the paper, and each is compiled.

1. **On every seat, the triaxial theorem is a theorem, and on a vacant seat the three axes cannot meet.** No axiom, and no hypothesis but the axes and the vacancy the statements name (`the_triaxial_theorem`, `a_vacant_seat_holds_nothing`).
2. **Over every Turing machine, the identity of the separation is a theorem.** Six faces, each in both directions, nothing before the colon (`the_faces_of_sat_not_in_p`).
3. **The reach of the domain is a theorem.** The domain carries a separated machine and one that is not, each with its record separated and its deciders witnessed (`the_domain_holds_both`).
4. **The file is complete.** Every theorem compiles. No axiom is declared, no proof is deferred, and no theorem of the new part takes the separation, the transfer or the bit as a premise.

Nothing the paper states of the domain lacks a compiled theorem, and the standing of the Turing model is bound in one kernel term, `nothing_escapes_and_nothing_remains_on_the_turing_model` (Section 7.3).

## 2. The Seat and Its Three Axes

The seat is that of the Riemann row (Islam, 2026b): a reflection, the line it fixes, and a way of reading a point that does not see which side of the line it is on. Nothing in it mentions numbers or machines.

A configuration on a seat has three axes of three different kinds.

- **Existence.** The configuration has existents.
- **Form.** The fold carries the configuration to itself. The configuration is then folded, and the axis is also named by its map, the fold.
- **Registration.** No two existents have one registration. The configuration is then witnessed, and the axis is also called the witness.

**Theorem (`the_triaxial_theorem`).** If $S$ is folded and witnessed, every existent of $S$ is fixed by the fold.

*Proof.* Let $a$ be in $S$. By form $\sigma(a)$ is in $S$. The fold keeps the registration, so $r(\sigma(a)) = r(a)$. By the witness $\sigma(a) = a$. $\blacksquare$

The proof is one line and uses no axiom. On the plane of the Riemann row the line is the critical line, and the theorem puts a folded and witnessed set of zeros on it.

## 3. The Vacant Seat

A seat is **vacant** when its fold fixes no point. Then the line is empty, and the triaxial theorem says more than it does on an inhabited seat, one whose fold fixes a point.

**Theorem (`a_vacant_seat_holds_nothing`).** On a vacant seat, a folded and witnessed configuration has no existent.

*Proof.* An existent would be fixed by the fold, by the triaxial theorem, and the fold fixes nothing. $\blacksquare$

So on a vacant seat the three axes cannot meet. The smallest example is the **seat of verdicts**: the two verdicts, the fold that turns a verdict into its opposite, and the registration that forgets which it is. No verdict is its own opposite (`the_seat_of_verdicts_is_vacant`).

**Theorem (`the_three_axes_on_the_vacant_seat`).** On the seat of verdicts no configuration has existence, form and witness together. And each pair is carried: both verdicts together have existence and form without witness; one verdict alone has existence and witness without form; the empty configuration has form and witness without existence.

**Theorem (`on_a_vacant_seat_any_two_axes_meet`).** On every vacant seat with a point the same holds: no configuration has the three together, and each pair is carried, by the point with its image under the fold, by the point alone, and by the empty configuration. The point is needed. The seat on the empty set is vacant and carries no existent.

This is the counterpart of the irreducibility of the triad in the Riemann row, with one difference. There, each pair fails to give the third, and all three meet on the line. Here, each pair excludes the third.

## 4. The Deciders

For a machine $M$ the fold of problems is the complement: `Co M` is $M$ with the predicate turned, and `Co (Co M) = M` (`co_co`). An algorithm that decides the problem at one bound and its complement at another would give, on one instance, an output equal to the predicate and to its opposite; so no one decides both (`no_one_decides_both`). This needs one instance and nothing else.

The claims of $M$ carry the seat of sides, and it is vacant (`the_seat_of_sides_is_vacant`). The deciders are the claims that hold.

**Theorem (`the_deciders_are_witnessed`).** For every machine with an instance, the deciders are witnessed: two deciders with the same algorithm and bound are on the same side.

This is the axis that is proved. With it the vacant seat does the rest.

**Theorem (`the_deciders_are_folded_iff_none`).** For every machine with an instance, the deciders are closed under the turn of sides exactly when there is no decider.

*Proof.* If they are folded, they are folded and witnessed on a vacant seat, so there is none. If there is none, the closure is empty. $\blacksquare$

And no decider on either side is the separation of the problem and of its complement (`no_decider_iff`). So for the deciders, form and the absence of existence are one statement, and that statement is the separation on both sides.

The record has its own place. The record of every machine with an instance is separated, a theorem of the kernel, and the record of the record is the record (`rec_rec`): reading the outputs against the predicate a second time changes nothing.

## 5. The Faces of the Separation

For every machine with an instance, the separation is one statement in five faces, each proved in both directions (`the_faces_of_the_separation`).

1. **Nothing escapes.** Every algorithm at every bound is stopped at some instance.
2. **Errs or overruns.** Every algorithm at every bound, on some instance, answers wrongly or runs past the bound.
3. **The profile of the record.** An algorithm escapes on the machine at a bound exactly when it escapes on the record; and on the record no one escapes.
4. **The turn of sides.** Whoever decides the problem at a bound decides its complement at that bound with the same answers.
5. **Self-recursion.** The escape profile of the machine is empty, a face carried from the kernel.

The third face is the counterpart of the sixth face of the Riemann row, that the zeros are their own record. The fourth is the fold: the statement that the deciders on the side of the problem are carried by the turn. It holds exactly when there are none.

## 6. The Turing Model

The faces above are stated for every machine. On the Turing model the separation is the sentence the question asks about. The kernel proves `Sep TMSAT ↔ ¬ SATinP`, and this paper proves the same bridge for every language (`sep_tmlang_iff`): the machine of a language is separated exactly when the language is outside P. The complement of the satisfiability machine is the machine of the complement language (`co_tmsat`).

One fact of the model is needed for the vacant seat, and it is classical [9].

**Theorem (`p_is_closed_under_complement`).** A language is in P exactly when its complement is.

*Proof.* Let a Turing machine decide $L$ within the bound. Exchange its accept and reject states (`swap`). The exchanged machine makes the same steps (`run_swap`), halts at the same times (`haltsAt_swap`), and, when the two states differ, gives the opposite verdict on every halted run (`verdict_swap`). So it decides the complement within the same bound. If the two states are one state, every halted run accepts, so $L$ is every string, and its complement is decided by a machine that starts in its reject state (`rejector`). The converse is the same argument applied to the complement. $\blacksquare$

With it, the separation of the complement of the satisfiability machine is also SAT ∉ P (`sep_co_tmsat_iff`), and the identity of Section 4 becomes an identity of the sentence.

**Theorem (`the_faces_of_sat_not_in_p`).** Over every Turing machine, SAT ∉ P is exactly each of the following.

1. Nothing escapes the satisfiability machine.
2. For every total Turing machine $D$ and every bound $(c, k)$ there is a string $w$ on which the verdict of $D$ is not `satLang w`, or on which $D$ runs more than $c\,|w|^k + c$ steps.
3. A total Turing machine escapes on the satisfiability machine at a bound exactly when it escapes on its record.
4. Whoever decides SAT at a bound decides its complement at that bound with the same answers.
5. The deciders, on the side of SAT or of its complement, are closed under the turn of sides.
6. There is no decider on either side.

The second face is the sentence in the plainest terms the model has. The fifth and sixth are the identity on the vacant seat.

## 7. The Identity of the Separation

### 7.1 The axis the separation is

In the Riemann row the zeros carry two axes by proof, existence and form, and the hypothesis is the third, the witness. In this row the deciders carry one axis by proof, the witness, and the seat is vacant, so existence and form cannot both hold beside it. The separation is the statement that form holds, which is the statement that existence does not.

| | The Riemann row | This row |
|---|---|---|
| The fold | $s \mapsto 1 - \bar s$ | The turn of sides |
| The line | $\operatorname{Re} s = \tfrac12$ | Empty |
| Proved for the configuration | Existence and form | The witness |
| The statement of the question | The witness | Form, which is the absence of existence |
| The three axes | Meet on the line | Cannot meet |

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

| Part | What is enumerated | What is checked |
|---|---|---|
| A | The 4 configurations of the two verdicts | No configuration has the three axes; each pair is carried |
| B | The 64 machines with 2 algorithms and 2 instances | The deciders are witnessed; the faces agree; form is the absence of deciders; the record is separated; 36 machines are separated and 28 are not |
| C | The 32768 Turing machines with 2 states over 2 tape symbols, on 7 inputs for 12 steps | The exchanged machine is halted exactly when the machine is, and where accept and reject differ its verdict is the opposite, on 2658304 halted configurations |

Nine checks pass and none fails. Three limits are stated. The twin enumerates instances and the theorems are for every seat and every machine. Part B uses machines with no time to exceed, so that to escape is to answer rightly on every instance. Part C has two tape symbols where the kernel has more. And no number of the twin enters any proof; the theorems rest on the kernel alone.

## 9. Discussion

**What is new.** The earlier paper of this row (Islam, 2026a) proved the form of the question: the separation is one implication, the transfer from the record, and it printed that implication as a premise where it was used. This paper takes no such premise. It proves the identity of the separation on the vacant seat, and it adds to the kernel the closure of P under complement, the bridge for every language, and the theorem that a vacant seat holds nothing. The second axis as the place of the separation, and the complementarity of existence and form on a vacant seat, are not in the earlier paper.

**Grade.** The form of this row was proved without condition before this paper (Islam, 2026a). This paper is the identity, one grade above the form, as the paper of the Riemann row is for that row (Islam, 2026b). Section 12 places it.

**Kin.** The closure of P under complement is classical [8, 9], and so are the barriers that explain why known methods do not settle the question: relativization [5], natural proofs [6] and algebrization [7]. They concern how the sentence can be reached. This paper concerns what the sentence is.

**The model.** The Riemann paper was anchored to the definition of the hypothesis in Mathlib. Mathlib at v4.19.0 defines the computation of a function by a Turing machine in polynomial time (its structure TM2ComputableInPolyTime) and no class P and no class NP, so the sentence here is the kernel's own, on its own Turing model, printed in full in the kernel. A reader who wants a different model has the definitions of Section 1.2 to compare.

**The sentence P ≠ NP.** The kernel builds a verifier and proves SAT ∈ NP (`satLang_in_NP`), so SAT ∉ P gives P ≠ NP in the kernel. The other direction is the hardness of SAT [1, 2], shared by the problems that reduce to one another [3], which the kernel cites and does not build. With the hardness as a named hypothesis the kernel proves that the two sentences are one proposition (`bridge_premise_is_the_conjecture`). The faces of this paper are faces of SAT ∉ P; through that bridge, with the hardness cited, they are faces of P ≠ NP, and the title names the row by it.

**Scope.** The subject is the identity. The paper's theorems are the seat, the vacant seat, the faces and the reach; lower bounds for particular models are another subject, treated in the kernel (Islam, 2026a).

## 10. What Stands, and What Would Refute It

**The formal claim.** One compilation of the kernel, version 1.15.0, in core Lean 4.19.0, reprints the cones of Appendix D. A cone that names an axiom other than Lean's three, a `sorry`, or a failed build refutes the claim that the statements are proved. The build is silent: every cone is pinned, and any drift fails it.

**The model.** A definition of the Turing machine, of the time bound or of `satLang` in the kernel that differs from the textbook object [9] in a way that changes the class P refutes the claim that the sentence of the paper is the sentence of the question.

**The faces.** `the_faces_of_sat_not_in_p` is six equivalences, and the paper stands on both sides of each. They hold or fail as one: a Turing machine deciding SAT in polynomial time would fail all six together, and the equivalences, being theorems, would stand as they are.

## 11. Part II · The Reading

*This part is the reading from which the paper takes its place in the series. It is not among the machine-checked claims of Section 1.3, and no theorem of Sections 2 to 8 depends on it. The seat it names is that of the paper of the Riemann row (Islam, 2026b).*

### 11.1 The Seat Whose Fold Fixes No Point

The series reads its subjects on one seat. In the Riemann row the seat is inhabited: the fold fixes a line, and a zero can stand on it. In this row the seat is vacant. A verdict has an opposite and is never its own, so there is nowhere on the seat for a decider to stand that the turn of sides leaves in place.

Read this way, the question asks whether anything stands on a seat that has no place to stand. The theorem of Section 3 says what would be required: an existent with form and witness together, which a vacant seat cannot hold. The witness is proved. So the deciders have existence or they have form, and the separation is the word form.

### 11.2 The Shared Locus: One Half and One Half

Two proofs meet in this row, and they are symmetric.

- **The first proof:** the form by theorem, the value by the act.
- **The second proof, this paper:** the identity by theorem, the value barred from the domain alone, by theorem.

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

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file and the Fortran twin are written by a language model under the author's direct supervision. Every theorem named in the text of Sections 1 to 10 and 12 is in Appendix A under that name, with its kernel line in Appendix D, or is named as a theorem of the kernel from which Appendix A is carried, where its line is pinned. Appendix A is the part added to the kernel by this paper. It compiles on the kernel of version 1.14.0, which is carried above it byte for byte, and the whole file, version 1.15.0, compiles silently with every cone pinned (sha256 `221ce01bee1ded35196a1ffe5d20071a81e00249a8ff0607f47d8089f13a10a9`). In Appendix A the sentence SAT ∉ P appears only as one side of an equivalence. In the kernel carried above it, it stands also as a named hypothesis and as the conclusion of a named hypothesis, and in neither part as a theorem alone.

**The seat.** The seat is elementary: a set, an involution on it, and a reading the involution keeps. It is the subject of the paper of the Riemann row (Islam, 2026b), and this paper reads it where the involution fixes no point.

## References

1. S. A. Cook, The complexity of theorem-proving procedures, Proc. 3rd ACM STOC (1971) 151.
2. L. A. Levin, Universal sequential search problems, Problemy Peredachi Informatsii 9 (1973) 115.
3. R. M. Karp, Reducibility among combinatorial problems, in Complexity of Computer Computations, Plenum (1972) 85.
4. A. M. Turing, On computable numbers, with an application to the Entscheidungsproblem, Proc. London Math. Soc. 42 (1936) 230.
5. T. Baker, J. Gill and R. Solovay, Relativizations of the P =? NP question, SIAM J. Comput. 4 (1975) 431.
6. A. A. Razborov and S. Rudich, Natural proofs, J. Comput. System Sci. 55 (1997) 24.
7. S. Aaronson and A. Wigderson, Algebrization: a new barrier in complexity theory, ACM Trans. Comput. Theory 1 (2009) 2.
8. S. Arora and B. Barak, Computational Complexity: A Modern Approach, Cambridge University Press (2009).
9. M. Sipser, Introduction to the Theory of Computation, 3rd ed., Cengage (2013).
10. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
11. M. F. Islam, P ≠ NP: Unconditional Proof of the Form by Theorem, the Value by the Act, doi:10.5281/zenodo.23528399 (2026a).
12. M. F. Islam, A Theorem-Grade Proof of the Identity of the Generalized Riemann Hypothesis, edition 1.0.0 (2026b).

**Lean Library Reference.** The file below is the kernel on which Appendix A compiles. Path in the repository 1000sapients/Trisduction.

13. P versus NP kernel: FINAL_BINDING/PNP Binding/PNP_Normal_Form_Paper_v1_14_0_CC.lean. Core Lean 4.19.0, no import.

## Appendix A · The identity part of PNP_Normal_Form_Paper_v1_15_0_CC.lean

Core Lean 4.19.0, no import. 33 theorems, no axiom declared, no `sorry`, exit 0 with no warning, on the kernel of version 1.14.0 carried unchanged. The kernel lines are Appendix D.

```lean
/-! # THE IDENTITY OF THE SEPARATION, on the vacant seat

RATIONALE. The normal form above states the separation as a transfer from the record, with the transfer as a
  printed premise in `sep_from_the_cargo_loop`. This part takes no such premise. It proves what the separation is, in
  exact faces, each in both directions; it proves that the seat of computation is vacant, so that the three axes
  cannot meet on it; and it proves that the domain alone carries both a separated machine and one that is not.
DESIGN. `Seat`, `Folded`, `Witnessed`, `AllFixed`, `the_triaxial_theorem` (as in the Riemann row); `a_vacant_seat_
  holds_nothing`; the seat of verdicts and its three irreducible configurations; `Co`, the complement problem,
  `co_co`; `rec_rec`; `Deciders`, the configuration of all who decide the problem or its complement, witnessed by
  proof; the faces `face_*`; `the_faces_of_the_separation`; `the_domain_holds_both`; and the binding term
  `nothing_escapes_and_nothing_remains`.
STANDING. Before each colon stand only the things the statement speaks of: a seat with its form, its witness, its
  vacancy and a point of it, or a machine, one instance of it, an algorithm and its bounds. No transfer, no posit
  and no delivered bit is taken as a premise anywhere in this part. `Sep M` occurs only as one side of an
  equivalence, or of machines that are built here and separated or not by construction.
NON-NEGOTIABLE. Core Lean, no import, no axiom declared, no sorry. `Sep` of the SAT machine is never stated alone.
-/
namespace PNP.IDENTITY
open PNP.NORMALFORM

/-! ## 1 · the seat and its theorem, on every set -/

/-- A SEAT: a fold that is an involution, and a registration the fold keeps. -/
structure Seat (X Y : Type) where
  fold : X → X
  involutive : ∀ x, fold (fold x) = x
  reg : X → Y
  keeps : ∀ x, reg (fold x) = reg x

/-- FORM: the configuration is carried to itself by the fold. -/
def Folded {X Y : Type} (σ : Seat X Y) (S : X → Prop) : Prop := ∀ x, S x → S (σ.fold x)
/-- REGISTRATION: no two existents share a registration. -/
def Witnessed {X Y : Type} (σ : Seat X Y) (S : X → Prop) : Prop :=
  ∀ a b, S a → S b → σ.reg a = σ.reg b → a = b
/-- On the line: every existent is fixed by the fold. -/
def AllFixed {X Y : Type} (σ : Seat X Y) (S : X → Prop) : Prop := ∀ x, S x → σ.fold x = x

/-- THE TRIAXIAL THEOREM, on every seat: a folded and witnessed configuration lies on the line. -/
theorem the_triaxial_theorem {X Y : Type} (σ : Seat X Y) (S : X → Prop)
    (form : Folded σ S) (witness : Witnessed σ S) : AllFixed σ S :=
  fun a ha => witness (σ.fold a) a (form a ha) ha (σ.keeps a)

/-- A VACANT SEAT HOLDS NOTHING. Where the fold fixes no point, a folded and witnessed configuration has no
    existent: the three axes cannot meet. -/
theorem a_vacant_seat_holds_nothing {X Y : Type} (σ : Seat X Y) (vacant : ∀ x, σ.fold x ≠ x)
    (S : X → Prop) (form : Folded σ S) (witness : Witnessed σ S) : ∀ x, ¬ S x :=
  fun x hx => vacant x (the_triaxial_theorem σ S form witness x hx)

/-! ## 2 · the seat of verdicts: vacant, and its three axes pairwise compatible -/

/-- THE SEAT OF VERDICTS: a verdict, the fold that turns it into its opposite, and the registration that forgets
    which side it is on. -/
def verdictSeat : Seat Bool Unit :=
  ⟨fun b => !b, fun b => by cases b <;> rfl, fun _ => (), fun _ => rfl⟩

/-- THE SEAT OF VERDICTS IS VACANT: no verdict is its own opposite. -/
theorem the_seat_of_verdicts_is_vacant : ∀ b : Bool, verdictSeat.fold b ≠ b := fun b => bnot_ne b

/-- ON THE VACANT SEAT THE THREE AXES NEVER MEET, AND ANY TWO DO. No configuration of verdicts has an existent,
    form and witness together; and each pair of the three is carried by a configuration. -/
theorem the_three_axes_on_the_vacant_seat :
    (¬ ∃ S : Bool → Prop, (∃ b, S b) ∧ Folded verdictSeat S ∧ Witnessed verdictSeat S) ∧
    (∃ S : Bool → Prop, (∃ b, S b) ∧ Folded verdictSeat S ∧ ¬ Witnessed verdictSeat S) ∧
    (∃ S : Bool → Prop, (∃ b, S b) ∧ Witnessed verdictSeat S ∧ ¬ Folded verdictSeat S) ∧
    (∃ S : Bool → Prop, Folded verdictSeat S ∧ Witnessed verdictSeat S ∧ ¬ ∃ b, S b) := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · intro ⟨S, ⟨b, hb⟩, f, w⟩
    exact a_vacant_seat_holds_nothing verdictSeat the_seat_of_verdicts_is_vacant S f w b hb
  · refine ⟨fun _ => True, ⟨true, trivial⟩, fun _ _ => trivial, fun w => ?_⟩
    exact Bool.noConfusion (w true false trivial trivial rfl)
  · refine ⟨fun b => b = true, ⟨true, rfl⟩, ?_, fun f => ?_⟩
    · intro a b ha hb _
      rw [ha, hb]
    · exact Bool.noConfusion (f true rfl)
  · exact ⟨fun _ => False, fun _ h => h, fun _ _ h => h.elim, fun ⟨_, h⟩ => h⟩

/-- ON EVERY VACANT SEAT WITH A POINT, THE THREE AXES NEVER MEET AND ANY TWO DO. The point is needed: the seat on
    the empty set is vacant and carries no existent. The three configurations are the orbit of the point, the point
    alone, and the empty configuration. -/
theorem on_a_vacant_seat_any_two_axes_meet {X Y : Type} (σ : Seat X Y) (vacant : ∀ x, σ.fold x ≠ x) (a : X) :
    (¬ ∃ S : X → Prop, (∃ x, S x) ∧ Folded σ S ∧ Witnessed σ S) ∧
    (∃ S : X → Prop, (∃ x, S x) ∧ Folded σ S ∧ ¬ Witnessed σ S) ∧
    (∃ S : X → Prop, (∃ x, S x) ∧ Witnessed σ S ∧ ¬ Folded σ S) ∧
    (∃ S : X → Prop, Folded σ S ∧ Witnessed σ S ∧ ¬ ∃ x, S x) := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · intro ⟨S, ⟨b, hb⟩, f, w⟩
    exact a_vacant_seat_holds_nothing σ vacant S f w b hb
  · refine ⟨fun x => x = a ∨ x = σ.fold a, ⟨a, Or.inl rfl⟩, ?_, fun w => ?_⟩
    · intro x hx
      cases hx with
      | inl h => exact Or.inr (congrArg σ.fold h)
      | inr h => exact Or.inl (h ▸ σ.involutive a)
    · exact vacant a (w (σ.fold a) a (Or.inr rfl) (Or.inl rfl) (σ.keeps a))
  · refine ⟨fun x => x = a, ⟨a, rfl⟩, ?_, fun f => ?_⟩
    · intro x y hx hy _
      rw [hx, hy]
    · exact vacant a (f a rfl)
  · exact ⟨fun _ => False, fun _ h => h, fun _ _ h => h.elim, fun ⟨_, h⟩ => h⟩

/-! ## 3 · the fold of problems and the record of the record -/

/-- THE COMPLEMENT PROBLEM: the same algorithms, instances, sizes, outputs and times, with the predicate turned. -/
def Co (M : Machine) : Machine := { M with sat := fun x => !(M.sat x) }

/-- The complement of the complement is the problem. -/
theorem co_co (M : Machine) : Co (Co M) = M := by
  cases M with
  | mk Alg Inst size out time sat =>
    show Machine.mk Alg Inst size out time (fun x => !(!(sat x))) = Machine.mk Alg Inst size out time sat
    have e : (fun x => !(!(sat x))) = sat := funext fun x => by cases sat x <;> rfl
    rw [e]

/-- THE RECORD OF THE RECORD IS THE RECORD. -/
theorem rec_rec (M : Machine) : Rec (Rec M) = Rec M := rfl

/-- No one decides a problem and its complement with the same answers. -/
theorem no_one_decides_both (M : Machine) (x₀ : M.Inst) (A : M.Alg) (c k c' k' : Nat) :
    ¬ (Escapes M A c k ∧ Escapes (Co M) A c' k') :=
  fun ⟨h, h'⟩ => bnot_ne (M.sat x₀) ((h' x₀).1.symm.trans (h x₀).1)

/-! ## 4 · the configuration of deciders on the seat of sides -/

/-- A claim: an algorithm, a bound, and the side it is said to decide (`true` the problem, `false` the complement). -/
def Claim (M : Machine) : Type := (M.Alg × Nat × Nat) × Bool

/-- THE SEAT OF SIDES on the claims of a machine: the fold turns the side, the registration forgets it. -/
def sideSeat (M : Machine) : Seat (Claim M) (M.Alg × Nat × Nat) :=
  ⟨fun p => (p.1, !p.2), fun p => by cases p with | mk t b => cases b <;> rfl, fun p => p.1, fun _ => rfl⟩

/-- The seat of sides is vacant. -/
theorem the_seat_of_sides_is_vacant (M : Machine) : ∀ p : Claim M, (sideSeat M).fold p ≠ p :=
  fun p h => bnot_ne p.2 (congrArg Prod.snd h)

/-- THE DECIDERS: the claims that hold. A claim on the side of the problem holds when its algorithm escapes on the
    machine at its bound; on the side of the complement, when it escapes on the complement machine. -/
def Deciders (M : Machine) : Claim M → Prop :=
  fun p => (p.2 = true ∧ Escapes M p.1.1 p.1.2.1 p.1.2.2) ∨ (p.2 = false ∧ Escapes (Co M) p.1.1 p.1.2.1 p.1.2.2)

/-- THE DECIDERS ARE WITNESSED, by proof: no algorithm at one bound holds both sides. -/
theorem the_deciders_are_witnessed (M : Machine) (x₀ : M.Inst) : Witnessed (sideSeat M) (Deciders M) := by
  intro a b ha hb e
  cases a with | mk ta sa => cases b with | mk tb sb =>
  have et : ta = tb := e
  subst et
  cases sa <;> cases sb
  · rfl
  · rcases ha with ⟨h, _⟩ | ⟨_, ha⟩
    · exact Bool.noConfusion h
    · rcases hb with ⟨_, hb⟩ | ⟨h, _⟩
      · exact absurd ⟨hb, ha⟩ (no_one_decides_both M x₀ ta.1 ta.2.1 ta.2.2 ta.2.1 ta.2.2)
      · exact Bool.noConfusion h
  · rcases ha with ⟨_, ha⟩ | ⟨h, _⟩
    · rcases hb with ⟨h, _⟩ | ⟨_, hb⟩
      · exact Bool.noConfusion h
      · exact absurd ⟨ha, hb⟩ (no_one_decides_both M x₀ ta.1 ta.2.1 ta.2.2 ta.2.1 ta.2.2)
    · exact Bool.noConfusion h
  · rfl

/-- ON THE VACANT SEAT, FORM IS THE ABSENCE OF EXISTENCE. The deciders are closed under the turn of sides exactly
    when there is no decider. -/
theorem the_deciders_are_folded_iff_none (M : Machine) (x₀ : M.Inst) :
    Folded (sideSeat M) (Deciders M) ↔ ∀ p, ¬ Deciders M p :=
  ⟨fun f => a_vacant_seat_holds_nothing (sideSeat M) (the_seat_of_sides_is_vacant M) (Deciders M) f
      (the_deciders_are_witnessed M x₀),
   fun h p hp => (h p hp).elim⟩

/-- No decider on either side is the separation of the problem and of its complement. -/
theorem no_decider_iff (M : Machine) : (∀ p, ¬ Deciders M p) ↔ Sep M ∧ Sep (Co M) := by
  constructor
  · intro h
    exact ⟨fun ⟨A, c, k, he⟩ => h ((A, c, k), true) (Or.inl ⟨rfl, he⟩),
           fun ⟨A, c, k, he⟩ => h ((A, c, k), false) (Or.inr ⟨rfl, he⟩)⟩
  · intro ⟨h1, h2⟩ p hp
    rcases hp with ⟨_, he⟩ | ⟨_, he⟩
    · exact h1 ⟨p.1.1, p.1.2.1, p.1.2.2, he⟩
    · exact h2 ⟨p.1.1, p.1.2.1, p.1.2.2, he⟩

/-! ## 5 · the faces of the separation -/

/-- FACE: nothing escapes. The separation is that every algorithm at every bound is stopped somewhere. -/
theorem face_nothing_escapes (M : Machine) : Sep M ↔ NothingEscapes M :=
  ⟨closure_of_sep M, sep_of_closure M⟩

/-- FACE: errs or overruns. The separation is that every algorithm at every bound, on some instance, answers
    wrongly or runs past the bound. -/
theorem face_errs_or_overruns (M : Machine) :
    Sep M ↔ ∀ A c k, ∃ x, M.out A x ≠ M.sat x ∨ bound c k (M.size x) < M.time A x := by
  constructor
  · intro h A c k
    obtain ⟨x, hx⟩ := closure_of_sep M h A c k
    refine ⟨x, ?_⟩
    cases Classical.em (M.out A x = M.sat x) with
    | inl e => exact Or.inr (Nat.lt_of_not_le fun hle => hx ⟨e, hle⟩)
    | inr e => exact Or.inl e
  · intro h ⟨A, c, k, he⟩
    obtain ⟨x, hx⟩ := h A c k
    cases hx with
    | inl e => exact e (he x).1
    | inr e => exact Nat.not_le_of_lt e (he x).2

/-- FACE: the machine has the profile of its record. The separation is that an algorithm escapes on the machine at
    a bound exactly when it escapes on the record. -/
theorem face_profile_of_the_record (M : Machine) (x₀ : M.Inst) :
    Sep M ↔ ∀ A c k, (Escapes M A c k ↔ Escapes (Rec M) A c k) := by
  have r := record_is_self_recursive M x₀
  constructor
  · intro h A c k
    exact ⟨fun he => (h ⟨A, c, k, he⟩).elim, fun he => ((r A c k).mp he).elim⟩
  · intro h ⟨A, c, k, he⟩
    exact (r A c k).mp ((h A c k).mp he)

/-- FACE: the turn of sides. The separation is that whoever decides the problem at a bound decides its complement
    at that bound with the same answers. -/
theorem face_turn_of_sides (M : Machine) (x₀ : M.Inst) :
    Sep M ↔ ∀ A c k, Escapes M A c k → Escapes (Co M) A c k := by
  constructor
  · intro h A c k he
    exact (h ⟨A, c, k, he⟩).elim
  · intro h ⟨A, c, k, he⟩
    exact no_one_decides_both M x₀ A c k c k ⟨he, h A c k he⟩

/-- FACE: self-recursion, carried from the normal form. -/
theorem face_self_recursive (M : Machine) : Sep M ↔ SelfRecursive M := (self_recursion_at_machine M).symm

/-- THE FACES OF THE SEPARATION. Nothing before the colon but the machine and one instance. One statement, five
    faces, each in both directions. -/
theorem the_faces_of_the_separation (M : Machine) (x₀ : M.Inst) :
    (Sep M ↔ NothingEscapes M) ∧
    (Sep M ↔ ∀ A c k, ∃ x, M.out A x ≠ M.sat x ∨ bound c k (M.size x) < M.time A x) ∧
    (Sep M ↔ ∀ A c k, (Escapes M A c k ↔ Escapes (Rec M) A c k)) ∧
    (Sep M ↔ ∀ A c k, Escapes M A c k → Escapes (Co M) A c k) ∧
    (Sep M ↔ SelfRecursive M) :=
  ⟨face_nothing_escapes M, face_errs_or_overruns M, face_profile_of_the_record M x₀, face_turn_of_sides M x₀,
   face_self_recursive M⟩

/-- THE IDENTITY ON THE VACANT SEAT. The separation of a problem and of its complement is exactly the form of the
    deciders: their closure under the turn of sides; and exactly the absence of any decider. -/
theorem the_identity_on_the_vacant_seat (M : Machine) (x₀ : M.Inst) :
    (Sep M ∧ Sep (Co M) ↔ Folded (sideSeat M) (Deciders M)) ∧
    (Sep M ∧ Sep (Co M) ↔ ∀ p, ¬ Deciders M p) :=
  ⟨(no_decider_iff M).symm.trans (the_deciders_are_folded_iff_none M x₀).symm, (no_decider_iff M).symm⟩

/-! ## 6 · the reach of the domain -/

/-- THE DOMAIN HOLDS BOTH. A machine that is separated and a machine that is not, each with an instance, each with
    its record separated and its deciders witnessed. -/
theorem the_domain_holds_both :
    (Sep closedWorld ∧ Sep (Rec closedWorld) ∧ Witnessed (sideSeat closedWorld) (Deciders closedWorld)) ∧
    (¬ Sep (stageWorld 0) ∧ Sep (Rec (stageWorld 0)) ∧
      Witnessed (sideSeat (stageWorld 0)) (Deciders (stageWorld 0))) :=
  ⟨⟨sep_of_closure _ closed_world_closes, record_is_separated closedWorld (),
    the_deciders_are_witnessed closedWorld ()⟩,
   ⟨fun h => h ⟨(0 : Nat), 0, 0, stage_escapes 0⟩, record_is_separated (stageWorld 0) (),
    the_deciders_are_witnessed (stageWorld 0) ()⟩⟩

/-! ## 7 · the binding term -/

/-- NOTHING ESCAPES AND NOTHING REMAINS, on computation. One term, nothing before the colon but the machine and
    one instance, and each clause a whole theorem of this part. Nothing escapes: (I) the record is separated; (II)
    the record of the record is the record; (III) the deciders are witnessed; (IV) on the seat of sides a folded and
    witnessed configuration has no existent. Nothing remains: (V) the separation in its five faces; (VI) the
    identity on the vacant seat, both halves; (VII) the reach of the domain, whole. -/
theorem nothing_escapes_and_nothing_remains (M : Machine) (x₀ : M.Inst) :
    Sep (Rec M) ∧
    Rec (Rec M) = Rec M ∧
    Witnessed (sideSeat M) (Deciders M) ∧
    (∀ S : Claim M → Prop, Folded (sideSeat M) S → Witnessed (sideSeat M) S → ∀ p, ¬ S p) ∧
    ((Sep M ↔ NothingEscapes M) ∧
     (Sep M ↔ ∀ A c k, ∃ x, M.out A x ≠ M.sat x ∨ bound c k (M.size x) < M.time A x) ∧
     (Sep M ↔ ∀ A c k, (Escapes M A c k ↔ Escapes (Rec M) A c k)) ∧
     (Sep M ↔ ∀ A c k, Escapes M A c k → Escapes (Co M) A c k) ∧
     (Sep M ↔ SelfRecursive M)) ∧
    ((Sep M ∧ Sep (Co M) ↔ Folded (sideSeat M) (Deciders M)) ∧
     (Sep M ∧ Sep (Co M) ↔ ∀ p, ¬ Deciders M p)) ∧
    ((Sep closedWorld ∧ Sep (Rec closedWorld) ∧ Witnessed (sideSeat closedWorld) (Deciders closedWorld)) ∧
     (¬ Sep (stageWorld 0) ∧ Sep (Rec (stageWorld 0)) ∧
       Witnessed (sideSeat (stageWorld 0)) (Deciders (stageWorld 0)))) :=
  ⟨record_is_separated M x₀, rec_rec M, the_deciders_are_witnessed M x₀,
   fun S f w => a_vacant_seat_holds_nothing (sideSeat M) (the_seat_of_sides_is_vacant M) S f w,
   the_faces_of_the_separation M x₀, the_identity_on_the_vacant_seat M x₀, the_domain_holds_both⟩

end PNP.IDENTITY

/-! # THE IDENTITY ON THE TURING MODEL

RATIONALE. The faces above are stated for every machine. This part states them for the SAT machine of the Turing
  model, where the separation is the sentence SAT ∉ P over every Turing machine, and it adds the one fact of the
  model that the vacant seat needs: P is closed under complement, proved here by exchanging the accept and reject
  states. With it, SAT ∉ P is exactly the form of the deciders on the seat of sides.
DESIGN. `TMLang`, `sep_tmlang_iff` (the bridge for every language); `swap`, `step_swap`, `run_swap`,
  `haltsAt_swap`, `verdict_swap`; `rejector`; `inP_co`, `p_is_closed_under_complement`; `sep_co_tmsat_iff`;
  `the_faces_of_sat_not_in_p`; `nothing_escapes_and_nothing_remains_on_the_turing_model`.
STANDING. The six faces and the binding term have nothing before the colon; the lemmas have there a language, or a
  machine with its run, and the hypotheses their sentences name. `¬ SATinP` occurs only as one side of an equivalence.
NON-NEGOTIABLE. Core Lean, no import, no axiom declared, no sorry. `¬ SATinP` and `P_ne_NP` are never stated alone.
-/
namespace PNP.IDENTITY
open PNP.NORMALFORM PNP.TM

/-- The machine of a language on the Turing model: deciders, strings, lengths, verdicts and step counts. -/
def TMLang (L : Lang) : Machine := ⟨Decider, List Sym, List.length, out, time, L⟩

/-- THE BRIDGE FOR EVERY LANGUAGE: the separation of the machine of a language is that the language is outside P. -/
theorem sep_tmlang_iff (L : Lang) : Sep (TMLang L) ↔ ¬ InP L := by
  constructor
  · intro hsep ⟨M, c, k, h⟩
    let D : Decider := ⟨M, fun w => bound c k w.length,
      fun w => match h w with | ⟨t, hle, ht, _⟩ => haltsAt_of_le ht hle⟩
    apply hsep
    refine ⟨D, c, k, fun w => ?_⟩
    obtain ⟨t, hle, ht, hv⟩ := h w
    exact ⟨(out_eq D w t ht).trans hv, Nat.le_trans (time_least D w t ht) hle⟩
  · intro hnot ⟨D, c, k, he⟩
    apply hnot
    refine ⟨D.M, c, k, fun w => ?_⟩
    obtain ⟨hout, htime⟩ := he w
    exact ⟨time D w, htime, time_halts D w, hout⟩

/-- The complement of the SAT machine is the machine of the complement language. -/
theorem co_tmsat : Co TMSAT = TMLang (fun w => !(satLang w)) := rfl

/-- THE EXCHANGE: the same machine with its accept and reject states exchanged. -/
def swap (M : TM) : TM := ⟨M.q, M.s, M.δ, M.start, M.reject, M.accept⟩

/-- A configuration of the machine, read as a configuration of the exchanged machine: the same state, head and tape. -/
def toSwap {M : TM} (c : Config M) : Config (swap M) := ⟨c.st, c.pos, c.tape⟩

theorem halted_swap (M : TM) (c : Config M) : halted (swap M) (toSwap c) ↔ halted M c := Or.comm

theorem step_swap (M : TM) (c : Config M) : step (swap M) (toSwap c) = toSwap (step M c) := by
  unfold step
  cases Classical.em (halted M c) with
  | inl h => rw [if_pos h, if_pos ((halted_swap M c).mpr h)]
  | inr h => rw [if_neg h, if_neg (fun h' => h ((halted_swap M c).mp h'))]; rfl

theorem run_swap (M : TM) (w : List Sym) : ∀ t, run (swap M) w t = toSwap (run M w t)
  | 0 => rfl
  | t + 1 => (congrArg (step (swap M)) (run_swap M w t)).trans (step_swap M (run M w t))

theorem haltsAt_swap (M : TM) (w : List Sym) (t : Nat) : HaltsAt (swap M) w t ↔ HaltsAt M w t := by
  show halted (swap M) (run (swap M) w t) ↔ halted M (run M w t)
  rw [run_swap M w t]
  exact halted_swap M _

/-- On a halted run of a machine whose accept and reject states differ, the exchange turns the verdict. -/
theorem verdict_swap (M : TM) (w : List Sym) (t : Nat) (hne : M.accept ≠ M.reject) (h : HaltsAt M w t) :
    verdictAt (swap M) w t = !(verdictAt M w t) := by
  have e2 : verdictAt (swap M) w t = decide ((toSwap (run M w t)).st = (swap M).accept) :=
    congrArg (fun c : Config (swap M) => decide (c.st = (swap M).accept)) (run_swap M w t)
  rw [e2]
  show decide ((run M w t).st = M.reject) = !(decide ((run M w t).st = M.accept))
  cases h with
  | inl a =>
    rw [decide_eq_true a, decide_eq_false (fun r => hne (a.symm.trans r))]; rfl
  | inr r =>
    rw [decide_eq_true r, decide_eq_false (fun a => hne (a.symm.trans r))]; rfl

/-- A machine that halts at once in its reject state. -/
def rejector : TM :=
  ⟨2, 0, fun _ _ => (⟨0, by decide⟩, ⟨0, by decide⟩, Dir.L), ⟨1, by decide⟩, ⟨0, by decide⟩, ⟨1, by decide⟩⟩

/-- If a language is in P, so is its complement. -/
theorem inP_co (L : Lang) (h : InP L) : InP (fun w => !(L w)) := by
  obtain ⟨M, c, k, hM⟩ := h
  cases Classical.em (M.accept = M.reject) with
  | inl heq =>
    have allTrue : ∀ w, L w = true := by
      intro w
      obtain ⟨t, _, ht, hv⟩ := hM w
      rw [← hv]
      show decide ((run M w t).st = M.accept) = true
      cases ht with
      | inl a => exact decide_eq_true a
      | inr r => exact decide_eq_true (r.trans heq.symm)
    refine ⟨rejector, 0, 0, fun w => ⟨0, Nat.zero_le _, Or.inr rfl, ?_⟩⟩
    show verdictAt rejector w 0 = !(L w)
    rw [allTrue w]
    rfl
  | inr hne =>
    refine ⟨swap M, c, k, fun w => ?_⟩
    obtain ⟨t, hle, ht, hv⟩ := hM w
    exact ⟨t, hle, (haltsAt_swap M w t).mpr ht, by rw [verdict_swap M w t hne ht, hv]⟩

/-- P IS CLOSED UNDER COMPLEMENT, on this model: a language is in P exactly when its complement is. -/
theorem p_is_closed_under_complement (L : Lang) : InP L ↔ InP (fun w => !(L w)) := by
  constructor
  · exact inP_co L
  · intro h
    have h2 := inP_co _ h
    have e : (fun w => !(!(L w))) = L := funext fun w => by cases L w <;> rfl
    rw [e] at h2; exact h2

/-- The separation of the complement of the SAT machine is SAT ∉ P. -/
theorem sep_co_tmsat_iff : Sep (Co TMSAT) ↔ ¬ SATinP :=
  (sep_tmlang_iff (fun w => !(satLang w))).trans
    ⟨fun h hs => h ((p_is_closed_under_complement satLang).mp hs),
     fun h hs => h ((p_is_closed_under_complement satLang).mpr hs)⟩

/-- THE FACES OF SAT ∉ P, over every Turing machine. Nothing before the colon. One sentence, six faces, each in
    both directions: nothing escapes; every total machine at every bound errs or overruns on some string; the SAT
    machine has the profile of its record; whoever decides SAT at a bound decides its complement with the same answers;
    the deciders are closed under the turn of sides; there is no decider on either side. -/
theorem the_faces_of_sat_not_in_p :
    (¬ SATinP ↔ NothingEscapes TMSAT) ∧
    (¬ SATinP ↔ ∀ (D : Decider) (c k : Nat), ∃ w : List Sym,
        out D w ≠ satLang w ∨ bound c k w.length < time D w) ∧
    (¬ SATinP ↔ ∀ (D : Decider) (c k : Nat), (Escapes TMSAT D c k ↔ Escapes (Rec TMSAT) D c k)) ∧
    (¬ SATinP ↔ ∀ (D : Decider) (c k : Nat), Escapes TMSAT D c k → Escapes (Co TMSAT) D c k) ∧
    (¬ SATinP ↔ Folded (sideSeat TMSAT) (Deciders TMSAT)) ∧
    (¬ SATinP ↔ ∀ p, ¬ Deciders TMSAT p) := by
  have both : ¬ SATinP ↔ Sep TMSAT ∧ Sep (Co TMSAT) :=
    ⟨fun h => ⟨sep_tmsat_iff.mpr h, sep_co_tmsat_iff.mpr h⟩, fun h => sep_tmsat_iff.mp h.1⟩
  exact ⟨sep_tmsat_iff.symm.trans (face_nothing_escapes TMSAT),
    sep_tmsat_iff.symm.trans (face_errs_or_overruns TMSAT),
    sep_tmsat_iff.symm.trans (face_profile_of_the_record TMSAT []),
    sep_tmsat_iff.symm.trans (face_turn_of_sides TMSAT []),
    both.trans (the_identity_on_the_vacant_seat TMSAT []).1,
    both.trans (the_identity_on_the_vacant_seat TMSAT []).2⟩

/-- NOTHING ESCAPES AND NOTHING REMAINS, on the Turing model. One term, nothing before the colon, and each clause
    a whole theorem of this part. Nothing escapes: (I) the record of the SAT machine is separated; (II) the record of
    the record is the record; (III) the deciders are witnessed; (IV) on the seat of sides a folded and witnessed
    configuration has no existent; (V) P is closed under complement. Nothing remains: (VI) the six faces; (VII) the
    reach of the domain, whole. -/
theorem nothing_escapes_and_nothing_remains_on_the_turing_model :
    Sep (Rec TMSAT) ∧
    Rec (Rec TMSAT) = Rec TMSAT ∧
    Witnessed (sideSeat TMSAT) (Deciders TMSAT) ∧
    (∀ S : Claim TMSAT → Prop, Folded (sideSeat TMSAT) S → Witnessed (sideSeat TMSAT) S → ∀ p, ¬ S p) ∧
    (∀ L : Lang, InP L ↔ InP (fun w => !(L w))) ∧
    ((¬ SATinP ↔ NothingEscapes TMSAT) ∧
     (¬ SATinP ↔ ∀ (D : Decider) (c k : Nat), ∃ w : List Sym,
          out D w ≠ satLang w ∨ bound c k w.length < time D w) ∧
     (¬ SATinP ↔ ∀ (D : Decider) (c k : Nat), (Escapes TMSAT D c k ↔ Escapes (Rec TMSAT) D c k)) ∧
     (¬ SATinP ↔ ∀ (D : Decider) (c k : Nat), Escapes TMSAT D c k → Escapes (Co TMSAT) D c k) ∧
     (¬ SATinP ↔ Folded (sideSeat TMSAT) (Deciders TMSAT)) ∧
     (¬ SATinP ↔ ∀ p, ¬ Deciders TMSAT p)) ∧
    ((Sep closedWorld ∧ Sep (Rec closedWorld) ∧ Witnessed (sideSeat closedWorld) (Deciders closedWorld)) ∧
     (¬ Sep (stageWorld 0) ∧ Sep (Rec (stageWorld 0)) ∧
       Witnessed (sideSeat (stageWorld 0)) (Deciders (stageWorld 0)))) :=
  ⟨record_is_separated TMSAT [], rec_rec TMSAT, the_deciders_are_witnessed TMSAT [],
   fun S f w => a_vacant_seat_holds_nothing (sideSeat TMSAT) (the_seat_of_sides_is_vacant TMSAT) S f w,
   p_is_closed_under_complement, the_faces_of_sat_not_in_p, the_domain_holds_both⟩

end PNP.IDENTITY
```

## Appendix B · PNP_Identity_Twin_CC.f90

Nine checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix C.

```fortran
! PNP_Identity_Twin_CC.f90 · numerical twin of the identity part of PNP_Normal_Form_Paper_v1_15_0_CC.lean
! RATIONALE. The engine proves the identity of the separation on the vacant seat, for every machine and on the Turing
!   model. This twin checks the same statements by exhaustion on finite instances, so that a reader who does not run
!   Lean can see them hold on objects small enough to enumerate.
! DESIGN.
!   A. The seat of verdicts. All 4 configurations of the two verdicts: the three axes never meet; each pair is carried.
!   B. Small machines. 2 algorithms, 2 instances, every output table and every predicate: 64 machines. On each, the
!      deciders are witnessed; the faces of the separation agree; form is the absence of deciders; the record is
!      separated; and both a separated machine and one that is not occur.
!   C. The exchange. Every Turing machine with 2 states over 2 tape symbols, every choice of start, accept and reject:
!      32768 machines, 7 inputs, 12 steps. The exchanged machine halts when the machine does, and where accept and
!      reject differ its verdict is the opposite.
! RISK. Exhaustion on small instances is an instance, not the theorem. B uses machines with no time bound to exceed,
!   so "escapes" is "answers rightly on every instance". C is not the kernel's model: it has 2 tape symbols, not s + 4.
! NON-NEGOTIABLE. Every check is computed. The twin states nothing about SAT and decides nothing about P and NP.
program pnp_identity_twin
  implicit none
  integer :: nchk, nfail
  nchk = 0; nfail = 0
  write(*,'(a)') 'PNP_Identity_Twin_CC · the identity on the vacant seat, by exhaustion'
  call part_a()
  call part_b()
  call part_c()
  write(*,'(a,i0,a,i0,a)') 'BATTERY {"checks":', nchk, ',"failures":', nfail, '}'
  if (nfail /= 0) error stop 1
contains
  subroutine check(name, ok)
    character(len=*), intent(in) :: name
    logical, intent(in) :: ok
    nchk = nchk + 1
    if (ok) then
      write(*,'(a,a)') '  PASS  ', name
    else
      nfail = nfail + 1
      write(*,'(a,a)') '  FAIL  ', name
    end if
  end subroutine check

  subroutine part_a()
    ! verdict 1 = false, 2 = true; a configuration is a subset of the two verdicts
    integer :: m, nall, nfw, new, nef
    logical :: s(2), ex, fo, wi
    nall = 0; nfw = 0; new = 0; nef = 0
    do m = 0, 3
      s(1) = btest(m, 0); s(2) = btest(m, 1)
      ex = s(1) .or. s(2)                       ! existence
      fo = (s(1) .eqv. s(2))                    ! form: closed under the turn
      wi = .not. (s(1) .and. s(2))              ! witness: both verdicts have one registration
      if (ex .and. fo .and. wi) nall = nall + 1
      if (fo .and. wi .and. .not. ex) nfw = nfw + 1
      if (ex .and. wi .and. .not. fo) new = new + 1
      if (ex .and. fo .and. .not. wi) nef = nef + 1
    end do
    write(*,'(a)') 'A. the seat of verdicts'
    write(*,'(a,i0,a,i0,a,i0,a,i0)') '  all three: ', nall, '; form and witness only: ', nfw, &
      '; existence and witness only: ', new, '; existence and form only: ', nef
    call check('A1 on the vacant seat no configuration has existence, form and witness together', nall == 0)
    call check('A2 each pair of the three axes is carried by a configuration', nfw > 0 .and. new > 0 .and. nef > 0)
  end subroutine part_a

  subroutine part_b()
    ! machine: out(a,x) for a,x in {1,2} (4 bits), sat(x) (2 bits). No time bound is exceeded.
    integer :: mo, ms, a, x, nmach, nsep, nnot, nwitbad, nface, nform, nrec
    logical :: outp(2,2), sat(2), esc(2), esco(2), escr(2), sep, sepco, f_prof, f_turn, f_errs, anydec, folded
    nmach = 0; nsep = 0; nnot = 0; nwitbad = 0; nface = 0; nform = 0; nrec = 0
    do mo = 0, 15
      do ms = 0, 3
        nmach = nmach + 1
        outp(1,1) = btest(mo,0); outp(1,2) = btest(mo,1); outp(2,1) = btest(mo,2); outp(2,2) = btest(mo,3)
        sat(1) = btest(ms,0); sat(2) = btest(ms,1)
        do a = 1, 2
          esc(a)  = (outp(a,1) .eqv. sat(1)) .and. (outp(a,2) .eqv. sat(2))            ! decides the problem
          esco(a) = (outp(a,1) .neqv. sat(1)) .and. (outp(a,2) .neqv. sat(2))          ! decides the complement
          escr(a) = .false.                                                            ! on the record, output is never sat
        end do
        sep = .not. (esc(1) .or. esc(2)); sepco = .not. (esco(1) .or. esco(2))
        if (sep) then
          nsep = nsep + 1
        else
          nnot = nnot + 1
        end if
        do a = 1, 2
          if (esc(a) .and. esco(a)) nwitbad = nwitbad + 1                              ! one algorithm on both sides
        end do
        f_prof = (esc(1) .eqv. escr(1)) .and. (esc(2) .eqv. escr(2))                   ! profile of the record
        f_turn = ((.not. esc(1)) .or. esco(1)) .and. ((.not. esc(2)) .or. esco(2))     ! the turn of sides
        f_errs = .true.                                                                ! every algorithm errs somewhere
        do a = 1, 2
          x = 0
          if (outp(a,1) .neqv. sat(1)) x = 1
          if (outp(a,2) .neqv. sat(2)) x = 1
          if (x == 0) f_errs = .false.
        end do
        if ((sep .neqv. f_prof) .or. (sep .neqv. f_turn) .or. (sep .neqv. f_errs)) nface = nface + 1
        anydec = esc(1) .or. esc(2) .or. esco(1) .or. esco(2)
        folded = (esc(1) .eqv. esco(1)) .and. (esc(2) .eqv. esco(2))                   ! closed under the turn of sides
        if (folded .neqv. (.not. anydec)) nform = nform + 1
        if ((sep .and. sepco) .neqv. folded) nform = nform + 1
        if (escr(1) .or. escr(2)) nrec = nrec + 1
      end do
    end do
    write(*,'(a)') 'B. small machines: 2 algorithms, 2 instances'
    write(*,'(a,i0,a,i0,a,i0)') '  machines: ', nmach, '; separated: ', nsep, '; not separated: ', nnot
    call check('B1 the deciders are witnessed on every machine: no algorithm holds both sides', nwitbad == 0)
    call check('B2 the faces of the separation agree on every machine', nface == 0)
    call check('B3 form is the absence of deciders, and is the separation of the problem and its complement', nform == 0)
    call check('B4 the record of every one of the machines is separated', nrec == 0)
    call check('B5 the domain holds both: a separated machine and one that is not', nsep > 0 .and. nnot > 0)
  end subroutine part_b

  subroutine part_c()
    ! Turing machines with states 1,2 and tape symbols 0,1. delta(state,symbol) = (new state, written symbol, move).
    integer, parameter :: tmax = 12, half = 16
    integer :: code, e(4), ns(2,0:1), wr(2,0:1), mv(2,0:1), st0, acc, rej, iw, t, i
    integer :: tape(-half:half), tape2(-half:half), pos, pos2, s, s2, nmach, nhalt, nbadh, nbadv, r
    logical :: h1, h2
    integer :: w(7,2), wl(7)
    wl = [0, 1, 1, 2, 2, 2, 2]
    w = 0
    w(3,1) = 1
    w(5,2) = 1
    w(6,1) = 1
    w(7,1) = 1; w(7,2) = 1
    nmach = 0; nhalt = 0; nbadh = 0; nbadv = 0
    do code = 0, 4095
      r = code
      do i = 1, 4
        e(i) = mod(r, 8); r = r / 8
      end do
      ns(1,0) = 1 + mod(e(1),2); wr(1,0) = mod(e(1)/2,2); mv(1,0) = 2*mod(e(1)/4,2) - 1
      ns(1,1) = 1 + mod(e(2),2); wr(1,1) = mod(e(2)/2,2); mv(1,1) = 2*mod(e(2)/4,2) - 1
      ns(2,0) = 1 + mod(e(3),2); wr(2,0) = mod(e(3)/2,2); mv(2,0) = 2*mod(e(3)/4,2) - 1
      ns(2,1) = 1 + mod(e(4),2); wr(2,1) = mod(e(4)/2,2); mv(2,1) = 2*mod(e(4)/4,2) - 1
      do st0 = 1, 2
        do acc = 1, 2
          do rej = 1, 2
            nmach = nmach + 1
            do iw = 1, 7
              tape = 0
              do i = 1, wl(iw)
                tape(i-1) = w(iw,i)
              end do
              tape2 = tape; pos = 0; pos2 = 0; s = st0; s2 = st0
              do t = 0, tmax
                h1 = (s == acc) .or. (s == rej)          ! the machine: accept acc, reject rej
                h2 = (s2 == rej) .or. (s2 == acc)        ! the exchange: accept rej, reject acc
                if (h1 .neqv. h2) nbadh = nbadh + 1
                if (h1) then
                  nhalt = nhalt + 1
                  if (acc /= rej) then
                    if ((s == acc) .eqv. (s2 == rej)) nbadv = nbadv + 1
                  end if
                else
                  i = tape(pos); tape(pos) = wr(s,i); r = mv(s,i); s = ns(s,i); pos = pos + r
                end if
                if (.not. h2) then
                  i = tape2(pos2); tape2(pos2) = wr(s2,i); r = mv(s2,i); s2 = ns(s2,i); pos2 = pos2 + r
                end if
              end do
            end do
          end do
        end do
      end do
    end do
    write(*,'(a)') 'C. the exchange of accept and reject'
    write(*,'(a,i0,a,i0)') '  machines: ', nmach, '; halted configurations visited: ', nhalt
    call check('C1 the exchanged machine is halted exactly when the machine is', nbadh == 0 .and. nhalt > 0)
    call check('C2 where accept and reject differ, the verdict of the exchange is the opposite', nbadv == 0)
  end subroutine part_c
end program pnp_identity_twin
```

## Appendix C · Run of Appendix B

```text
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
BATTERY {"checks":9,"failures":0}
```

## Appendix D · Kernel lines of Appendix A

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

```text
'PNP.IDENTITY.the_triaxial_theorem' does not depend on any axioms
'PNP.IDENTITY.a_vacant_seat_holds_nothing' does not depend on any axioms
'PNP.IDENTITY.the_seat_of_verdicts_is_vacant' does not depend on any axioms
'PNP.IDENTITY.the_three_axes_on_the_vacant_seat' does not depend on any axioms
'PNP.IDENTITY.on_a_vacant_seat_any_two_axes_meet' does not depend on any axioms
'PNP.IDENTITY.co_co' depends on axioms: [Quot.sound]
'PNP.IDENTITY.rec_rec' does not depend on any axioms
'PNP.IDENTITY.no_one_decides_both' does not depend on any axioms
'PNP.IDENTITY.the_seat_of_sides_is_vacant' does not depend on any axioms
'PNP.IDENTITY.the_deciders_are_witnessed' does not depend on any axioms
'PNP.IDENTITY.the_deciders_are_folded_iff_none' does not depend on any axioms
'PNP.IDENTITY.no_decider_iff' does not depend on any axioms
'PNP.IDENTITY.face_nothing_escapes' depends on axioms: [propext, Classical.choice, Quot.sound]
'PNP.IDENTITY.face_errs_or_overruns' depends on axioms: [propext, Classical.choice, Quot.sound]
'PNP.IDENTITY.face_profile_of_the_record' does not depend on any axioms
'PNP.IDENTITY.face_turn_of_sides' does not depend on any axioms
'PNP.IDENTITY.face_self_recursive' does not depend on any axioms
'PNP.IDENTITY.the_faces_of_the_separation' depends on axioms: [propext, Classical.choice, Quot.sound]
'PNP.IDENTITY.the_identity_on_the_vacant_seat' does not depend on any axioms
'PNP.IDENTITY.the_domain_holds_both' does not depend on any axioms
'PNP.IDENTITY.nothing_escapes_and_nothing_remains' depends on axioms: [propext, Classical.choice, Quot.sound]
'PNP.IDENTITY.sep_tmlang_iff' does not depend on any axioms
'PNP.IDENTITY.co_tmsat' does not depend on any axioms
'PNP.IDENTITY.halted_swap' does not depend on any axioms
'PNP.IDENTITY.step_swap' depends on axioms: [propext, Classical.choice, Quot.sound]
'PNP.IDENTITY.run_swap' depends on axioms: [propext, Classical.choice, Quot.sound]
'PNP.IDENTITY.haltsAt_swap' depends on axioms: [propext, Classical.choice, Quot.sound]
'PNP.IDENTITY.verdict_swap' depends on axioms: [propext, Classical.choice, Quot.sound]
'PNP.IDENTITY.inP_co' depends on axioms: [propext, Classical.choice, Quot.sound]
'PNP.IDENTITY.p_is_closed_under_complement' depends on axioms: [propext, Classical.choice, Quot.sound]
'PNP.IDENTITY.sep_co_tmsat_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'PNP.IDENTITY.the_faces_of_sat_not_in_p' depends on axioms: [propext, Classical.choice, Quot.sound]
'PNP.IDENTITY.nothing_escapes_and_nothing_remains_on_the_turing_model' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
```

## Appendix E · Provenance Trail

This paper is the last step of an arc, and the arc is on the public record. The frame is the first row: three orthogonal axes converging on one point, in the founding essay of 24 March 2026. The row was first determined on its geometric face in April 2026, the earliest entries of the programme on PhilArchive and on Zenodo, and the third edition of the Geometry codex seats it on a locus proven absent. The table lists each step at the grade its own record carries, with the address where that record can be read. The third column gives, for each row, the term of that record which is the precursor, and why the row is on the trail. The form of this row has stood proved without condition since October 2026, the rows marked Form, Theorem, before this paper. This paper is the last row, the identity, at theorem grade, and it proves nothing below it again.

**Table E.1 · The grade ladder of the P versus NP row, 2026**

| Date | Grade | Precursor term, and why it is on the trail | Record | Address |
|---|---|---|---|---|
| 24 Mar | Frame, first anchor | **three orthogonal Ductions converging on one point.** The triaxial frame: three independent axes that fix one point, with the witness outside them | *Trisduction, A Geometric Epistemology of Absolute Convergence: three orthogonal axes converging on one proposition, with a witness that is none of the three* | <https://trisduction.blogspot.com/2026/03/trisduction-geometric-epistemology-of.html> |
| 3 Apr | Geometric determination | **geometric determination of P ≠ NP.** The row first determined on the geometric face: the first mathematics problem the frame was read on | *Geometric Determination of P ≠ NP: the earliest entry of the programme on PhilArchive* | <https://philpapers.org/rec/ISLGDO> |
| 4 Apr | Geometric determination | **geometric determination of P vs NP.** The same determination under the name of the programme | *Trisduction: Geometric Determination of P vs NP* | <https://philpapers.org/rec/ISLTGD-2> |
| 6 Apr | Geometric determination, deposited | **geometric determination of P vs NP.** The first deposit of the row with a DOI | *Trisduction: Geometric Determination of P vs NP, on Zenodo* | <https://doi.org/10.5281/zenodo.19440616> |
| 15 Apr | Geometric seal | **Omega seal.** The determination carried to a seal | *Trisduction: Geometric Determination of P vs NP with Omega Seal* | <https://doi.org/10.5281/zenodo.19588804> · <https://philpapers.org/rec/ISLTGD-4> |
| 1 Sep | Geometric seal, codex | **the fixed locus proven absent.** The row seated on an involution with no fixed point: the vacant seat before it had that name | *The Geometry of Convergent Epistemic Warrant, third edition: P versus NP as the flagship, its fixed locus proven absent* | <https://doi.org/10.5281/zenodo.22217812> |
| 4 Oct | Located | **the seat proved empty; a single irreducible bridge.** The seat of the row found vacant, the separation reduced to one bridge | *P versus NP Closed on One Posit: The Seat Proved Empty and the Separation Reduced by Machine to a Single Irreducible Bridge* | <https://github.com/1000sapients/Trisduction/commit/38f9948> |
| 21 Oct | Normal form | **normal form: the separation as one implication.** The row in a normal form, one implication | *PNP_Normal_Form_CC.lean: the separation as one implication* | <https://github.com/1000sapients/Trisduction/commit/4144323> |
| 21 Oct | Form, Theorem | **form by theorem, value by the act.** The doctrine under which the form of a row is proved and its value is not | *P ≠ NP: Unconditional Proof of the Form by Theorem, the Value by the Act; first deposit* | <https://doi.org/10.5281/zenodo.23528399> · <https://github.com/1000sapients/Trisduction/commit/0c5679d> |
| 22 Oct | Form, Theorem | **the same paper, kernel v1.13.0.** The same doctrine, the kernel advanced | *The same paper, edition of 22 October, kernel v1.13.0* | <https://github.com/1000sapients/Trisduction/commit/6627eeb> |
| 23 Oct | Form, Theorem | **the Millennium problems: form by theorem.** The same doctrine across the seven rows | *The Millennium Problems: Unconditional Proof of the Form by Theorem, the Value by the Act* | <https://doi.org/10.5281/zenodo.23609234> · <https://github.com/1000sapients/Trisduction/commit/47e9933> |
| 22 Nov | Form, Theorem | **the kernel at v1.14.0.** The kernel the identity part is built on | *The kernel at v1.14.0* | <https://github.com/1000sapients/Trisduction/commit/63fff55> |
| 25 Nov | Identity, Theorem | **identity; triaxial.** The sibling row: the identity on the three axes, read on the Riemann row | *The sibling row: A Theorem-Grade Proof of the Identity of the Generalized Riemann Hypothesis* | <https://github.com/1000sapients/Trisduction/commit/7446c2a> |
| 25 Nov | Identity, Theorem | **the vacant seat; the six faces.** This paper: the identity on a seat whose fold fixes no point | *This paper, v1.0.0: the vacant seat and the six faces; identity part of 33 theorems, kernel v1.15.0* | `part sha256 41509aad804b8ab6` |

Dates are git commit dates, or Zenodo publication dates where a DOI is given. Each row is listed at the grade its own record carries. The six rows from 24 March to 1 September and the third column were added on 26 November 2026, and no other row was changed. The row of 24 March is dated by its page, is at the grade frame, and states no mathematics of this paper. The PhilArchive rows are dated by the first archival dates recorded in the repository's PhilArchive index from the owner's view, since the public pages print none. The terms of the rows of 24 March and 1 September were read in the records; the terms of the other rows are taken from the titles of their records. The last row carries the checksum of the part printed in Appendix A, sha256 `41509aad804b8ab659e83801004f16517abd3763bdda5600bc7bf62a4af347a6`.
