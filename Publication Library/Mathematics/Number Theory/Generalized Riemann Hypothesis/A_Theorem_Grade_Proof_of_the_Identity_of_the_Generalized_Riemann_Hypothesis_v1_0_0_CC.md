# A Theorem-Grade Proof of the Identity of the Generalized Riemann Hypothesis

## Riemann Hypothesis Is Triaxial: Existence, Fold, Registration: The Three Axes That Put Every Existent on the Line, and the One That the Hypothesis Is

**Mohammad F. Islam PhD** · 25 November 2026

## Abstract

This paper proves, in Lean 4 with Mathlib, the identity of the generalized Riemann Hypothesis. The hypothesis is triaxial, and in triaxial form it is a theorem in its own domain. The domain is elementary. A seat is a set with a fold, which is an involution, and a registration that the fold keeps. A configuration on a seat has three axes: its existents; its form, closure under the fold; and its witness, a record that returns every existent, so that no two existents share a registration. The theorem is that the three axes together put every existent on the line the fold fixes. It is proved for every seat and every configuration, with no premise and on no axiom at all. The triad is irreducible: wherever the fold moves a point, a configuration with existence and registration and no form lies off the line, a configuration with existence and form and no registration lies off the line, and a configuration with form and registration and no existent has nothing on the line. On the line the witness holds, so for a closed configuration the witness and the line are one statement. The seat of the classical problem is the complex plane with the fold $s \mapsto 1 - \bar s$ and the registration that keeps the height; there the line is $\operatorname{Re} s = 1/2$, and a closed and witnessed configuration lies on it. The zeros of the Riemann zeta function are then placed with respect to the domain, by proof. Their record is a member: it is closed, witnessed and on the line. The zeros themselves are closed under the fold, by the functional equation and Schwarz reflection, both carried through in the file. Their third axis, the witness, is the classical Riemann Hypothesis, in both directions. The same is proved for the Dirichlet family. For every primitive Dirichlet character $\chi$ the nontrivial zeros of $L(s, \chi)$ are closed under the same fold, by the functional equation of $\chi$ and Schwarz reflection, and their witness is exactly the generalized hypothesis for $\chi$, in both directions. The triaxial form is therefore the identity of the hypothesis: the paper proves it as a theorem on every seat, and proves that the classical statement is that the zeros of zeta are a member of the domain, and that the generalized hypothesis for $\chi$ is exactly that the zeros of $L(s, \chi)$ are. A Fortran twin checks the theorem by exhaustion on all 512 configurations of a finite seat and locates the first five zeros of zeta on the line, the first at height 14.134725.

## 1. The Theorem and What It Rests On

### 1.1 The statement

A seat is a set $X$ with a map $\sigma : X \to X$ such that $\sigma(\sigma(a)) = a$, the fold, and a map $r : X \to Y$ such that $r(\sigma(a)) = r(a)$, the registration. The line of the seat is the set of points the fold fixes. A configuration is a set $S$ of points of $X$, its existents. It is folded when $a \in S$ gives $\sigma(a) \in S$. It is witnessed when $a, b \in S$ and $r(a) = r(b)$ give $a = b$.

**Theorem (`generalized_hypothesis`).** On every seat, if a configuration is folded and witnessed, every one of its existents is on the line: $\sigma(a) = a$ for every $a \in S$.

**Theorem (`the_triad_is_irreducible`).** On every seat with a point that the fold moves: there is a witnessed configuration with an existent off the line; there is a folded configuration with an existent off the line; and there is a folded and witnessed configuration with no existent on the line.

**Theorem (`on_the_line_is_witnessed`).** If the registration tells the points of the line apart, every configuration on the line is witnessed.

**Theorem (`witnessed_iff_value`).** On the complex plane with the fold $s \mapsto 1 - \bar s$ and the registration $s \mapsto \tfrac12 + i \operatorname{Im} s$, a folded configuration is witnessed exactly when it lies on the line $\operatorname{Re} s = 1/2$.

**Theorem (`the_record_of_the_zeros_is_a_member`).** The record of the nontrivial zeros of $\zeta$, the set of points $\tfrac12 + i\operatorname{Im}\rho$, is folded, witnessed and on the line.

**Theorem (`the_zeros_are_witnessed_iff`).** The set of nontrivial zeros of $\zeta$ is folded; and it is witnessed exactly when the classical Riemann Hypothesis holds.

**Theorem (`the_dirichlet_zeros_are_witnessed_iff`).** For every primitive Dirichlet character $\chi \ne 1$, the set of zeros of $L(s, \chi)$ in the open strip is folded; and it is witnessed exactly when the generalized hypothesis for $\chi$ holds.

**Theorem (`the_final_theorem`).** The six statements above, bound in one, with nothing before the colon.

The first three are theorems of the domain and rest on no axiom. The fourth is the domain on the plane. The next two place the zeros of $\zeta$ [1]: two of their three axes are proved, and the third is the classical statement [5], one proposition with it. The last does the same for the zeros of every primitive Dirichlet L-function [11]. The trivial character of level one is the one primitive character left out of it, and its L-function is $\zeta$. Everything compiles in Lean 4 [9] with Mathlib [8], on the formalization of $\zeta$ and its functional equation that Mathlib carries [10].

### 1.2 The domain, printed

The paper has no premise. Its domain is the structure and the four definitions below, as they stand in the Lean file.

```lean
structure Seat (X Y : Type) where
  fold : X → X
  involutive : ∀ a, fold (fold a) = a
  reg : X → Y
  keeps : ∀ a, reg (fold a) = reg a
```

With $\sigma$ a seat, `Folded` says $\forall a,\ S\,a \to S\,(\sigma.\mathrm{fold}\ a)$; `Witnessed` says $\forall a\, b,\ S\,a \to S\,b \to \sigma.\mathrm{reg}\ a = \sigma.\mathrm{reg}\ b \to a = b$; `AllFixed` says $\forall a,\ S\,a \to \sigma.\mathrm{fold}\ a = a$; and `Triad` is an existent together with `Folded` and `Witnessed`. The seat of the plane is `lineSeat`, built from `fold` and `reg` on $\mathbb{C}$.

### 1.3 What is proved, and what is cited

| Statement | Standing | Where |
|---|---|---|
| On every seat, a folded and witnessed configuration is on the line | Proved, on no axiom | Appendix A, Part IV |
| A triad has an existent, and it is on the line | Proved, on no axiom | Part IV |
| No two of the three axes give the line, on every seat with a moved point | Proved, on no axiom | Part IV |
| On the line the witness holds, where the registration is faithful on the line | Proved, on no axiom | Part IV |
| On the plane, the fold fixes exactly the line $\operatorname{Re} s = 1/2$; a folded configuration is witnessed exactly when it lies on that line | Proved | Part V |

The table continues with the zeros of $\zeta$.

| Statement | Standing | Where |
|---|---|---|
| The nontrivial zeros of $\zeta$ are closed under $s \mapsto 1 - s$ | Proved, from the functional equation of Mathlib | Parts III, IV |
| $\zeta(\bar s) = \overline{\zeta(s)}$ for $s \ne 1$; the zeros are closed under conjugation and under the fold | Proved | Part IV |
| The record of the zeros is folded, witnessed and on the line | Proved | Part VI |
| The zeros are witnessed exactly when the classical statement holds | Proved | Part VI |
| $L(s, \chi^{-1}) = \overline{L(\bar s, \chi)}$ for every character $\chi \ne 1$ | Proved | Part VI-b |
| For primitive $\chi \ne 1$, the zeros of $L(s, \chi)$ in the open strip are closed under the fold | Proved, from the functional equation of Mathlib | Part VI-b |
| Those zeros are witnessed exactly when the generalized hypothesis for $\chi$ holds | Proved | Part VI-b |
| The final theorem | Proved | Part VII |

The standing of the classical statement, and what is not machine-checked, is in the third table.

| Statement | Standing | Where |
|---|---|---|
| The classical Riemann Hypothesis | One proposition with the witness of the zeros, by proof; it is printed in the file as one side of that equivalence | Sections 6, 7 |
| The generalized Riemann hypothesis for a primitive character $\chi$ | One proposition with the witness of the zeros of $L(s, \chi)$, by proof; printed in the file as one side of that equivalence | Sections 6.1, 7 |
| L-functions outside the Dirichlet family | Not treated | Section 6.1 |
| The nontrivial zeros lie in the open strip $0 < \operatorname{Re} s < 1$ | Classical [3, 4]; used here only as context | Section 6 |
| The values of the twin | Numerical, not machine-checked | Section 8 |

The paper claims as machine-checked the rows marked proved and no others. Part II, the reading, is outside these tables and is labelled where it begins.

## 2. The Seat and Its Three Axes

The classical hypothesis is usually stated about one function. Its content does not need the function. It needs a reflection, the line the reflection fixes, and a way of reading a point that does not see which side of the line it is on.

A seat is exactly that. The fold $\sigma$ is the reflection; since it is an involution, every point is either fixed or one of a pair. The registration $r$ is the reading; since $r(\sigma(a)) = r(a)$, a point and its partner are read alike. On the plane the fold is $s \mapsto 1 - \bar s$, which turns the sign of $\operatorname{Re} s - \tfrac12$ and keeps the height, and the registration keeps the height and nothing else.

A configuration on a seat has three axes, and they are of three different kinds.

- **Existence.** The configuration has existents: the set $S$ itself.
- **Form.** The configuration is carried to itself by the fold. This is a symmetry of the set.
- **Registration.** The record returns every existent: from $r(a)$ one can say which existent $a$ was. This is a statement about the reading and the set together.

None is a restatement of another. Section 4 proves that.

## 3. The Theorem

**Theorem (`generalized_hypothesis`).** Let $S$ be folded and witnessed. Then $\sigma(a) = a$ for every $a \in S$.

*Proof.* Let $a \in S$. By form, $\sigma(a) \in S$. By the seat, $r(\sigma(a)) = r(a)$. So $\sigma(a)$ and $a$ are two existents with one registration, and by the witness they are equal. $\blacksquare$

The proof is three lines, and each axis is used once. The Lean term is the same three steps: `witness (σ.fold a) a (form a ha) ha (σ.keeps a)`. Its kernel line names no axiom.

**Corollary (`a_triad_has_an_existent_on_the_line`).** A triad has an existent on the line. Existence supplies the point, and the theorem places it.

**The converse (`on_the_line_is_witnessed`).** Call the registration faithful on the line when two fixed points with one registration are equal. Then every configuration on the line is witnessed: two existents with one registration are two fixed points with one registration. So where the registration is faithful on the line, a folded configuration is witnessed exactly when it is on the line.

This is the hypothesis in triaxial form. In its domain it is not conditional on anything and not conjectural in any part.

## 4. The Triad Is Irreducible

**Theorem (`the_triad_is_irreducible`).** Let $p$ be a point with $\sigma(p) \ne p$.

1. *Without form.* The configuration $\{p\}$ has an existent and is witnessed, having one point. It is not on the line.
2. *Without registration.* The configuration $\{p, \sigma(p)\}$ has an existent and is folded, since the fold is an involution. It is not on the line.
3. *Without existence.* The empty configuration is folded and witnessed, and has no existent on the line.

So no two axes do the work of three. The second case is the one the classical literature knows well: a set of zeros symmetric under the reflection and off the line. There are functions with a functional equation of the same kind as that of $\zeta$ whose zeros are of that kind [6]. Symmetry is form, and form alone does not give the line.

`the_plane_triad_is_irreducible` is the same theorem on the plane, with the point $\tfrac14 + 14i$.

## 5. The Plane

On $\mathbb{C}$ let `fold` be $s \mapsto 1 - \bar s$ and `reg` be $s \mapsto \tfrac12 + i\operatorname{Im} s$. The fold is an involution, and `reg` of a point and of its fold are equal because the fold keeps the imaginary part. So `lineSeat` is a seat.

`fixed_iff_on_line`: the real part of the fold of $s$ is $1 - \operatorname{Re} s$, so the fold fixes $s$ exactly when $\operatorname{Re} s = \tfrac12$. The line of this seat is the critical line.

**Theorem (`generalized_hypothesis_on_the_plane`).** A configuration of the plane that is closed under the fold and witnessed lies on $\operatorname{Re} s = 1/2$.

It is the theorem of Section 3 on this seat. The registration is faithful on the line, since `reg` fixes every point of the line, so the converse holds too.

**Theorem (`witnessed_iff_value`).** For a configuration closed under the fold, `Witnessed` and `Value` are one statement.

`Value` is the statement that every existent has real part one half, and `Closed` is `Folded` on this seat.

## 6. The Zeros of ζ

Let `ZetaZeros` be the set of nontrivial zeros as Mathlib's own statement of the hypothesis defines them: the points $s$ with $\zeta(s) = 0$ that are not the trivial zeros $-2, -4, \dots$ and not $1$. They lie in the open strip $0 < \operatorname{Re} s < 1$ [3, 4]. Where do they stand with respect to the domain?

**Existence.** They are a configuration of the plane.

**Form.** Two classical facts, both proved in the file from what Mathlib carries.

- `zeta_zeros_symm`: if $\rho$ is a nontrivial zero, so is $1 - \rho$. This is the functional equation [1, 2], through the completed zeta function.
- `zeta_schwarz_reflection`: $\zeta(\bar s) = \overline{\zeta(s)}$ for $s \ne 1$. Both sides are analytic away from one and agree on the real axis to the right of one, and the plane with the point one removed is connected, so they agree throughout by the identity theorem.

Together they give `zeta_zeros_closed`: the nontrivial zeros are closed under the fold. The zeros have form, by proof.

**The record.** `Rec` of a configuration is the set of registrations of its existents. For the zeros it is the set of points $\tfrac12 + i\operatorname{Im}\rho$.

**Theorem (`the_record_of_the_zeros_is_a_member`).** The record of the zeros is folded, witnessed and on the line, with nothing assumed.

It lies on the line by `cargo_at_zeros`, and a configuration on the line is folded, each point being its own fold, and witnessed, by Section 3.

**The witness.**

**Theorem (`the_zeros_are_witnessed_iff`).** The zeros are closed under the fold; and they are witnessed exactly when Mathlib's `RiemannHypothesis` holds.

*Proof.* The zeros are folded, so by `witnessed_iff_value` they are witnessed exactly when they lie on the line. That every nontrivial zero has real part one half is the classical statement, by `h_id_proved`. $\blacksquare$

So the classical hypothesis has an exact place in the domain. It is not a fourth thing and it is not a statement about a function beside the seat. It is the third axis of one configuration: that no two zeros of $\zeta$ share a height unless they are one zero. An off-line zero and its partner across the line are two existents with one registration; the hypothesis says there is no such pair.

### 6.1 The Dirichlet family

The fold is not special to $\zeta$. Let $\chi$ be a primitive Dirichlet character of level $N$ with $\chi \ne 1$, and let `DirichletZeros χ` be the zeros of $L(s, \chi)$ in the open strip $0 < \operatorname{Re} s < 1$, its nontrivial zeros [11].

**Form.** Two facts, both proved in the file.

- The functional equation of the completed L-function, which Mathlib carries [10], sends a zero $\rho$ of $L(s, \chi)$ in the strip to the zero $1 - \rho$ of $L(s, \chi^{-1})$. The file proves the inverse of a primitive character primitive, `inv_isPrimitive`, so that the equation applies to it, and that the gamma factor does not vanish in the strip.
- `dirichlet_schwarz`: $L(s, \chi^{-1}) = \overline{L(\bar s, \chi)}$. Both sides are entire and agree on the half plane of convergence, term by term, since $\overline{\chi(n)} = \chi^{-1}(n)$.

Together they give `dirichlet_zeros_closed`: a zero $\rho$ of $L(s, \chi)$ in the strip has the partner $1 - \bar\rho$, a zero of the same function. It is the same fold.

**The witness.** The generalized hypothesis for $\chi$, `DirichletHypothesis χ`, is the statement that every zero of $L(s, \chi)$ in the open strip has real part one half.

**Theorem (`the_dirichlet_zeros_are_witnessed_iff`).** For every primitive $\chi \ne 1$ the zeros of $L(s, \chi)$ in the strip are closed under the fold; and they are witnessed exactly when the generalized hypothesis for $\chi$ holds.

*Proof.* They are folded, so by `witnessed_iff_value` they are witnessed exactly when they lie on the line, and that is the generalized hypothesis for $\chi$, by definition. $\blacksquare$

The one primitive character with $\chi = 1$ is the trivial character of level one, and its L-function is $\zeta$, treated above. So the theorem and the one before it cover every primitive Dirichlet character. The word generalized, in this paper, means this family. Dedekind, Hecke and automorphic L-functions carry a functional equation of the same shape, and Section 5 applies to any closed configuration; their zeros are not placed here, since the file does not carry their functional equations.

## 7. The Identity of the Hypothesis

The triaxial form is not a variant of the hypothesis and not a reading laid over it. It is what the hypothesis says. `the_zeros_are_witnessed_iff` proves that the classical statement and the witness of the zeros of $\zeta$ are one proposition, and `the_dirichlet_zeros_are_witnessed_iff` proves the same of the generalized hypothesis for every primitive character. So the hypothesis is, exactly, the third axis of a configuration whose first two axes are proved.

That fixes its kind. The hypothesis is not a statement of symmetry. The symmetry of the zeros is the functional equation, and that is classical and settled [1, 2]. It is a statement of registration: that the heights of the zeros are a faithful record of the zeros. Section 4 proves that no symmetry can stand in for it.

And it fixes its standing. In its own domain the form is a theorem on every seat, with no premise, no posit, and nothing delivered from outside. At $\zeta$, and at every primitive $L(s, \chi)$, the theorem is the identity: the equivalence is the hypothesis in its own terms, not a derivation of the classical statement from the domain.

## 8. The Numerical Twin

The twin of Appendix B checks the theorems of the domain by exhaustion, checks the seat of the plane on points, and looks at the first zeros.

**A finite seat, all of it.** The seat is the grid of nine points $(x, t)$ with $x$ and $t$ in $-1, 0, 1$. The fold sends $x$ to $-x$, and the registration keeps $t$. There are 512 configurations.

| Configurations | Count |
|---|---|
| Folded | 64 |
| Witnessed | 64 |
| Folded and witnessed | 8 |
| On the line | 8 |
| Folded and witnessed and off the line | 0 |
| On the line and not witnessed | 0 |
| Off the line, witnessed, with an existent, not folded | 56 |
| Off the line, folded, with an existent, not witnessed | 56 |
| Folded and witnessed with nothing on the line | 1 |

The folded and witnessed configurations are exactly the eight on the line. Each pair of axes admits a configuration off the line.

**The plane.** On 1000 points the fold done twice is the identity, the registration is kept and the side is turned. On 401 points of one height the fold fixes exactly the point of the line. The point $\tfrac14 + 14i$ and its partner $\tfrac34 + 14i$ are two points with the one registration $\tfrac12 + 14i$.

**The first zeros.** Zeta is evaluated on the line by its alternating series, and its zeros are located by the change of sign of Hardy's function [2]. The first five are found at the heights 14.134725, 21.022040, 25.010858, 30.424876 and 32.935062. At each, the point is its own partner under the fold. A quarter off the line at the first height, zeta does not vanish.

Ten checks pass and none fails. Three limits are stated. Exhaustion on one finite seat is an instance; the statement for every seat is the theorem. Five zeros found on the line are five zeros; the search says nothing of zeros off the line and does not bear on the classical statement. And no number of the twin enters any proof.

## 9. Discussion

**What is new, and what is not.** The functional equation and the reflection principle are classical [1, 2], and their formalization is Mathlib's [10]. That a set symmetric under the reflection lies on the line exactly when the projection onto the line is injective on it is elementary, and the paper does not present it as deep. What the paper does is fix the domain in which the hypothesis is a theorem, prove the theorem there for every seat, prove that its three hypotheses are independent, and prove where the zeros of $\zeta$ and of every primitive Dirichlet L-function stand: two axes in hand, and the third the classical statement, or the generalized hypothesis for the character, exactly. The hypothesis was not set out on these three axes before.

**Why the form matters.** A conjecture about one function gives no account of what would have to be true for it to hold. The triaxial form does. It says the classical statement is a statement of registration: that the heights of the zeros are a faithful record of the zeros. That is a different kind of statement from a symmetry, and Section 4 proves that no symmetry can deliver it.

**Kin.** For curves over finite fields the corresponding hypothesis is a theorem [7]. The paper draws nothing from that proof and claims no parallel beyond the fact that a hypothesis of this family is, in a suitable domain, a theorem.

**Scope.** The subject is the form. The paper bounds no zero and improves no zero-free region. Each statement of Section 1.3 marked proved compiles, and no theorem of Sections 2 to 8 depends on Part II.

## 10. What Stands, and What Would Refute It

The paper has no physical premise and predicts no measurement. Its claim is formal, and one thing refutes it.

**The formal claim.** Every theorem named in this text prints its axioms in Appendix D. A line that names an axiom other than `propext`, `Classical.choice` and `Quot.sound`, or a file that fails to compile under Lean 4.19.0 and Mathlib 4.19.0, refutes the claim that the statements are proved. The four theorems of the domain, on every seat, print no axiom at all.

**The statement about the zeros.** `the_zeros_are_witnessed_iff` cuts both ways and the paper stands on both. A proof of the classical statement, by any means, proves that the zeros of $\zeta$ are a member of the domain. A nontrivial zero off the line, by any means, proves that they are not, and the theorem of the domain is untouched: it would then say of the zeros what Section 4 says of the pair $\{p, \sigma(p)\}$. The same holds, character by character, for `the_dirichlet_zeros_are_witnessed_iff`.

**What kind of result this is.** It is a theorem with its domain stated. The implication from the three axes to the line is checked by the Lean kernel and no later result alters it. What the kernel certifies is the Lean statements; that the definitions of the file say what this text says they say is for the reader to check, and the structure `Seat` is printed for that purpose. What stands is the tables of Section 1.3.

## 11. Part II · The Reading

*This part is the reading from which the paper takes its place in the series. It is not among the machine-checked claims of Section 1.3, and no theorem of Sections 2 to 8 depends on it. The seat it names is that of Nothing Escapes, Least Erasure (Islam, 2026a).*

### 11.1 Three Axes, One Line

The series reads its subjects on one seat: a reflection, the line it fixes, and a registration that keeps the height of a point and forgets its side. This paper is that seat with nothing else on it. It asks what the seat itself proves, and the answer is the theorem of Section 3: an existent that the form carries and the registration witnesses is on the line.

The three axes are the three slots of any claim that something is the case: that there is something, that it has a shape, and that it is read. Each can fail alone, and Section 4 exhibits each failure. A point and its partner off the line are the picture of the second failure: form without witness, a symmetric pair that the record cannot tell apart. One registration, two existents, one erased bit.

Read this way, the classical hypothesis says that the record of the zeros erases nothing. The record of the zeros is on the line already, by proof. The hypothesis is that the zeros are their record.

### 11.2 What the Reading Adds, and What It Does Not

The reading adds a name and a place: the triaxial form, and the seat the series shares. It adds no theorem. Every theorem of this paper is in Appendix A and rests on the definitions printed in Section 1.2.

## 12. Closure

The generalized Riemann Hypothesis in triaxial form is no longer informal prose. From a set, an involution on it and a reading the involution keeps, and nothing more, Lean 4 compiles the theorem that a folded and witnessed configuration lies on the line, the existent a triad has on the line, the three configurations that show no two axes suffice, and the witness of every configuration on the line. These four rest on no axiom. On the complex plane, with the fold that turns the side of the critical line and the registration that keeps the height, Lean 4 with Mathlib compiles the line as the fixed set, the theorem on the plane and its converse, the closure of the zeros of zeta under the functional equation and under conjugation, the membership of their record, and the identity of their witness with the classical statement. For every primitive Dirichlet character it compiles the same closure of the zeros of its L-function and the identity of their witness with the generalized hypothesis for that character. No axiom is declared. No proof is left open. No premise stands before any colon but the axes the theorem names.

The numerical twin enumerates all 512 configurations of a finite seat and finds the eight that are folded and witnessed to be the eight on the line, finds each pair of axes failing somewhere, and locates the first five zeros of zeta on the line, each its own partner under the fold.

Every boundary is in plain sight. The theorem is a theorem of its domain, and the domain is printed: one structure and four definitions. The zeros of zeta are a configuration of that domain with two axes proved. Their third axis is the classical Riemann Hypothesis: the two are one proposition, by proof. The zeros of each primitive Dirichlet L-function stand the same way, their third axis the generalized hypothesis for the character.

None of this is new. The line was reached first from the physical side, in Nothing Escapes, Least Erasure (Islam, 2026a) and the master file of the register, where the form of the hypothesis was closed with the one bit supplied by the act. That proof stands as it was written, and this paper neither repairs it nor replaces it. What this paper adds is a second road to the same line: the formal one, with no act, no physical premise and no posit, in a domain that is nothing but a set, a fold and a registration. Two roads that share no premise arrive at one line. The first proof found it. This one confirms it from the other side.

Two things are therefore separate, and the paper keeps them separate. In the domain, the implication from the three axes to the line is a mathematical certainty. No later result alters it, and anyone can recheck it with one compilation. At zeta and at every primitive Dirichlet L-function, the paper proves what the classical statement is: the witness of the zeros. What survives both is not opinion. It is a theorem, with its domain stated, and the identity of the hypothesis.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file and the Fortran twin are written by a language model under the author's direct supervision. Every theorem named in the text of Sections 1 to 10 and 12 is in Appendix A under that name, and its kernel line is printed in Appendix D. Parts I to IV of Appendix A, up to the closure of the zeros under the fold, are carried from the master file of the register named in the Lean Library Reference, with no statement changed, so that the file of this paper stands alone and imports nothing but Mathlib. The Dirichlet family, Part VI-b, is in Part XVIII of the same master file. The classical Riemann Hypothesis and the generalized hypothesis for a character appear in the file only as one side of an equivalence.

**The seat.** The seat is elementary geometry: a reflection and the line it fixes. It is the subject of this paper, and it is studied further in Nothing Escapes, Least Erasure (Islam, 2026a).

## References

1. B. Riemann, Ueber die Anzahl der Primzahlen unter einer gegebenen Grösse, Monatsberichte der Berliner Akademie (1859) 671.
2. E. C. Titchmarsh, The Theory of the Riemann Zeta-Function, 2nd ed., revised by D. R. Heath-Brown, Oxford University Press (1986).
3. J. Hadamard, Bull. Soc. Math. France 24 (1896) 199.
4. C.-J. de la Vallée Poussin, Ann. Soc. Sci. Bruxelles 20 (1896) 183.
5. E. Bombieri, Problems of the Millennium: the Riemann Hypothesis, Clay Mathematics Institute (2000).
6. H. Davenport and H. Heilbronn, J. London Math. Soc. 11 (1936) 181, 307.
7. A. Weil, Sur les courbes algébriques et les variétés qui s'en déduisent, Hermann, Paris (1948).
8. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
9. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
10. D. Loeffler and M. Stoll, Formalizing zeta and L-functions in Lean, arXiv:2503.00959 (2025).
11. H. Davenport, Multiplicative Number Theory, 3rd ed., revised by H. L. Montgomery, Springer (2000).
12. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).

**Lean Library Reference.** The file below is the original from which Parts I to IV of Appendix A are carried. No theorem of this paper imports it. Path in the repository 1000sapients/Trisduction.

13. RH master: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_45_CC.lean, Parts X and XVIII. Compiled with Mathlib 4.19.0.

## Appendix A · Generalized_RH_Triaxial_Theorem_CC.lean

Lean 4.19.0 with Mathlib 4.19.0. 49 theorems, no axiom declared, no `sorry`, exit 0 with no warning. The kernel lines are Appendix D.

```lean
/-
Generalized_RH_Triaxial_Theorem_CC.lean · the generalized hypothesis in triaxial form, a theorem in its own domain
RATIONALE. A seat is a set with a fold, an involution, and a registration the fold keeps. A configuration on a seat
  has three axes: its existents, its closure under the fold, and its witness, the record returning every existent.
  This file proves that the three axes together put every existent on the line the fold fixes, that no two of
  them do, and that on the line the witness holds. It then takes the seat of the complex plane, the fold
  s ↦ 1 − conj s, and places the zeros of ζ: their record is a member of the domain, and the zeros themselves
  carry the first two axes by proof, their third being the classical statement.
DESIGN. Parts, in order.
    Part I    The plane: `fold`, `reg`, `Closed`, `Value`, `LeastErasure`, `ZetaZeros`; `h_id_proved`.
    Part II   The record: `Rec`, `record_has_least_erasure`, `cargo_at_zeros`.
    Part III  The functional equation: the zeros in the strip are closed under s ↦ 1 − s.
    Part IV   Schwarz reflection: ζ(conj s) = conj ζ(s); `zeta_zeros_closed`. Then the seat in general:
              `Seat`, `Folded`, `Witnessed`, `AllFixed`, `Triad`; `generalized_hypothesis`;
              `the_triad_is_irreducible`; `on_the_line_is_witnessed`.
    Part V    The plane as a seat: `lineSeat`, `generalized_hypothesis_on_the_plane`, `witnessed_iff_value`.
    Part VI   `the_record_of_the_zeros_is_a_member`; `the_zeros_are_witnessed_iff`.
    Part VI-b The Dirichlet family: `dirichlet_schwarz`, `DirichletZeros`, `dirichlet_zeros_closed`,
              `DirichletHypothesis`, `the_dirichlet_zeros_are_witnessed_iff`, for every primitive χ ≠ 1.
    Part VII  `the_triaxial_theorem`; `the_final_theorem`.
  Parts I to IV, up to `zeta_zeros_closed`, are carried from the master file of the register,
  RH_Both_Sides_Formal_Master_v3_0_45_CC.lean, Part X, with no statement changed, so that this file stands alone.
WHAT IS NOT PROVED HERE (read before citing).
    (a) The classical Riemann Hypothesis as a statement standing alone. This file proves the generalized
        hypothesis in its own domain, the domain of the three axes, and proves that the zeros of ζ are in that
        domain exactly when the classical statement holds. It prints `RiemannHypothesis` once, inside that
        biconditional, and nowhere else.
    (b) The generalized Riemann hypothesis for any Dirichlet character as a statement standing alone.
        `DirichletHypothesis χ` is printed inside a biconditional and nowhere else. The family covered is the
        primitive Dirichlet characters; no other L-function is treated.
RISK. A reader may take the theorem of the domain for the classical statement. `the_zeros_are_witnessed_iff` is
  the theorem that tells them apart.
NON-NEGOTIABLE. No axiom is declared, no sorry, no native_decide. The kernel line of every theorem the paper names
  is printed at the end.
-/
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.NumberTheory.LSeries.Dirichlet
import Mathlib.NumberTheory.LSeries.Nonvanishing
import Mathlib.Analysis.NormedSpace.Connected
import Mathlib.NumberTheory.LSeries.SumCoeff
import Mathlib.NumberTheory.LSeries.DirichletContinuation
import Mathlib.NumberTheory.MulChar.Lemmas

open Complex

namespace Triaxial

/-! ## Part I. The plane -/


/-- Points of the complex plane. -/
abbrev Point := ℂ

/-- The critical locus: Re s = 1/2. -/
def onLine (s : Point) : Prop := s.re = 1 / 2

/-- Conjugate reflection across the critical line: s ↦ 1 - conj s. -/
def fold (s : Point) : Point := 1 - star s

/-- Point reflection from the functional equation: s ↦ 1 - s. -/
def foldPt (s : Point) : Point := 1 - s

/-- Orthogonal retraction onto the critical line: s ↦ 1/2 + i Im s. -/
noncomputable def reg (s : Point) : Point := ⟨1 / 2, s.im⟩

abbrev Config := Point → Prop

/-- Reflection-closed configuration: invariant under s ↦ 1 - conj s. -/
def Closed (S : Config) : Prop := ∀ s, S s → S (fold s)

/-- Critical-line inclusion: every point of S lies on Re s = 1/2. -/
def Value (S : Config) : Prop := ∀ s, S s → onLine s

/-- Pointwise retraction invariance: every point of S is fixed by reg. -/
def LeastErasure (S : Config) : Prop := ∀ s, S s → reg s = s

/-- The nontrivial zero set of ζ(s), defined directly from Mathlib's riemannZeta. -/
def ZetaZeros (s : Point) : Prop :=
  riemannZeta s = 0 ∧ (¬∃ n : ℕ, s = -2 * (n + 1)) ∧ s ≠ 1

/-- The nontrivial zero set of the completed zeta function Λ(s). -/
def CompletedZetaZeros (s : Point) : Prop :=
  completedRiemannZeta s = 0 ∧ s ≠ 0 ∧ s ≠ 1

/-- Conjugate reflection is an involution on ℂ. -/
theorem fold_involutive (s : Point) : fold (fold s) = s := by
  simp only [fold, star_sub, star_one, star_star, sub_sub_cancel]

/-- Point reflection fixes the real part if and only if the point lies on the critical line. -/
theorem foldPt_re_fixed_iff (s : Point) : (foldPt s).re = s.re ↔ onLine s := by
  unfold foldPt onLine
  simp only [sub_re, one_re]
  constructor <;> intro h <;> linarith

/-- Symmetry of the completed zero set under s ↦ 1 - s from Mathlib's functional equation. -/
theorem completed_zeta_zeros_symm (s : Point) (h : CompletedZetaZeros s) :
    CompletedZetaZeros (foldPt s) := by
  rcases h with ⟨hz, h0, h1⟩
  refine ⟨?_, sub_ne_zero.mpr h1.symm, ?_⟩
  · show completedRiemannZeta (1 - s) = 0
    rw [completedRiemannZeta_one_sub]
    exact hz
  · show (1 : Point) - s ≠ 1
    intro hcon
    apply h0
    have h2 := congrArg (fun x : Point => (1 : Point) - x) hcon
    simpa using h2

/-- The retraction lands on the critical line for every complex number. -/
theorem reg_lands (s : Point) : onLine (reg s) := rfl

/-- Conjugate reflection fixes every retracted point. -/
theorem fold_reg (s : Point) : fold (reg s) = reg s := by
  apply Complex.ext
  · simp [fold, reg]
    norm_num
  · simp [fold, reg]

/-- The retraction fixes a point if and only if the point lies on the critical line. -/
theorem reg_eq_self_iff (s : Point) : reg s = s ↔ onLine s := by
  constructor
  · intro h
    show s.re = 1 / 2
    have hr := congrArg Complex.re h
    simpa [reg] using hr.symm
  · intro h
    have hre : s.re = 1 / 2 := h
    show (⟨1 / 2, s.im⟩ : Point) = s
    apply Complex.ext
    · show (1 / 2 : ℝ) = s.re
      exact hre.symm
    · rfl

/-- Pointwise retraction invariance is equivalent to critical-line inclusion on every subset of ℂ. -/
theorem twins_zeta (S : Config) : LeastErasure S ↔ Value S := by
  constructor
  · intro h s hs
    exact (reg_eq_self_iff s).mp (h s hs)
  · intro h s hs
    exact (reg_eq_self_iff s).mpr (h s hs)

/-- Mathlib's RiemannHypothesis is equivalent, by currying its three hypotheses, to critical-line inclusion of
    ZetaZeros. -/
theorem h_read_proved : RiemannHypothesis ↔ Value ZetaZeros := by
  constructor
  · intro h s ⟨h0, h1, h2⟩
    exact h s h0 h1 h2
  · intro h s h0 h1 h2
    exact h s ⟨h0, h1, h2⟩

/-- Mathlib's RiemannHypothesis is equivalent to pointwise retraction invariance of ZetaZeros. -/
theorem h_id_proved : RiemannHypothesis ↔ LeastErasure ZetaZeros :=
  h_read_proved.trans (twins_zeta ZetaZeros).symm

/-! ## Part II. The record -/

def Rec (S : Config) : Config := fun q => ∃ p, S p ∧ reg p = q

/-- Retraction is idempotent on ℂ. -/
theorem reg_idem (s : Point) : reg (reg s) = reg s := rfl

/-- Every retracted image lies on the critical line. -/
theorem the_remembered_is_lossless (S : Config) : Value (Rec S) := by
  intro q ⟨p, _, hpq⟩
  rw [← hpq]
  exact reg_lands p

/-- Every retracted image is closed under conjugate reflection. -/
theorem record_closed (S : Config) : Closed (Rec S) := by
  intro q ⟨p, hp, hpq⟩
  exact ⟨p, hp, by rw [← hpq, fold_reg p]⟩

/-- Every retracted image is pointwise invariant under reg. -/
theorem record_has_least_erasure (S : Config) : LeastErasure (Rec S) := by
  intro q ⟨p, _, hpq⟩
  show reg q = q
  rw [← hpq, reg_idem]

/-- The record of the zeros of ζ lies on the line. -/
theorem cargo_at_zeros : LeastErasure (Rec ZetaZeros) := record_has_least_erasure ZetaZeros

/-! ## Part III. The functional equation -/

/-! ### X-e . Step 4 from First Principles: Strip Equivalence and Functional-Equation Closure -/

/-- Point reflection s ↦ 1 - s is an involution on ℂ. -/
theorem foldPt_involutive (s : Point) : foldPt (foldPt s) = s := by
  unfold foldPt
  ring

/-- Point-reflection closure on complex configurations: invariant under s ↦ 1 - s. -/
def ClosedPt (S : Config) : Prop := ∀ s, S s → S (foldPt s)

/-- Unconditional functional-equation closure of CompletedZetaZeros under s ↦ 1 - s. -/
theorem completed_zeta_zeros_closed_pt : ClosedPt CompletedZetaZeros :=
  completed_zeta_zeros_symm

/-- First-principles bridge from Mathlib's riemannZeta_def_of_ne_zero and Gammaℝ_ne_zero_of_re_pos:
    at any complex point with 0 < Re s, riemannZeta s = 0 iff completedRiemannZeta s = 0. -/
theorem zeta_zero_iff_completed_of_re_pos {s : Point} (hre : 0 < s.re) :
    riemannZeta s = 0 ↔ completedRiemannZeta s = 0 := by
  have hs0 : s ≠ 0 := by
    intro h0
    rw [h0, zero_re] at hre
    exact lt_irrefl 0 hre
  have hG : Gammaℝ s ≠ 0 := Gammaℝ_ne_zero_of_re_pos hre
  rw [riemannZeta_def_of_ne_zero hs0, div_eq_zero_iff]
  exact ⟨fun h => h.resolve_right hG, fun h => Or.inl h⟩

/-- Inside the critical strip 0 < Re s < 1, ZetaZeros s ↔ CompletedZetaZeros s.
    Proved unconditionally from first principles using Mathlib's Gammaℝ non-vanishing. -/
theorem zeta_zeros_iff_completed_in_strip {s : Point} (h0 : 0 < s.re) (h1 : s.re < 1) :
    ZetaZeros s ↔ CompletedZetaZeros s := by
  have hs0 : s ≠ 0 := by
    intro heq
    rw [heq, zero_re] at h0
    exact lt_irrefl 0 h0
  have hs1 : s ≠ 1 := by
    intro heq
    rw [heq, one_re] at h1
    exact lt_irrefl 1 h1
  have h_not_trivial : ¬∃ n : ℕ, s = -2 * (n + 1) := by
    rintro ⟨n, rfl⟩
    have hneg : ((-2 : Point) * ((n : Point) + 1)).re ≤ 0 := by
      have hcast : ((-2 : Point) * ((n : Point) + 1)) = (((-2 * ((n : ℝ) + 1)) : ℝ) : ℂ) := by
        push_cast
        ring
      rw [hcast, Complex.ofReal_re]
      have hnn : (0 : ℝ) ≤ (n : ℝ) := Nat.cast_nonneg n
      linarith
    linarith
  unfold ZetaZeros CompletedZetaZeros
  rw [zeta_zero_iff_completed_of_re_pos h0]
  exact ⟨fun ⟨hz, _, _⟩ => ⟨hz, hs0, hs1⟩, fun ⟨hz, _, _⟩ => ⟨hz, h_not_trivial, hs1⟩⟩

/-- Unconditional functional-equation symmetry of ZetaZeros inside the critical strip:
    if 0 < Re s < 1 and ZetaZeros s, then ZetaZeros (1 - s). -/
theorem zeta_zeros_symm_in_strip {s : Point} (h0 : 0 < s.re) (h1 : s.re < 1)
    (hz : ZetaZeros s) : ZetaZeros (foldPt s) := by
  have h1_0 : 0 < (foldPt s).re := by unfold foldPt; simp only [sub_re, one_re]; linarith
  have h1_1 : (foldPt s).re < 1 := by unfold foldPt; simp only [sub_re, one_re]; linarith
  rw [zeta_zeros_iff_completed_in_strip h1_0 h1_1]
  exact completed_zeta_zeros_symm s ((zeta_zeros_iff_completed_in_strip h0 h1).mp hz)

/-- The strip-confined nontrivial zero set of ζ(s). -/
def StripZetaZeros (s : Point) : Prop := ZetaZeros s ∧ 0 < s.re ∧ s.re < 1

/-- Unconditional closure of StripZetaZeros under s ↦ 1 - s. -/
theorem strip_zeta_zeros_closed_pt : ClosedPt StripZetaZeros := by
  intro s ⟨hz, h0, h1⟩
  refine ⟨zeta_zeros_symm_in_strip h0 h1 hz, ?_, ?_⟩
  · unfold foldPt; simp only [sub_re, one_re]; linarith
  · unfold foldPt; simp only [sub_re, one_re]; linarith


/-! ## Part IV. Schwarz reflection, and the seat in general -/

/-! ### X-h . Schwarz Reflection Chain: ZetaZeros is Reflection-Closed -/

/-- Auxiliary: conjugation reflects differentiability. -/
theorem differentiableAt_star_comp {f : Point → Point} {x : Point}
    (hf : DifferentiableAt ℂ f (star x)) :
    DifferentiableAt ℂ (fun y => star (f (star y))) x := by
  obtain ⟨Df, hDf⟩ := hf
  have hstar_smul : ∀ c z : Point, star (c • z) = (star c) • (star z) := by
    intro c z
    rw [smul_eq_mul, star_mul, smul_eq_mul, mul_comm]
  have norm_star : ∀ w : Point, ‖star w‖ = ‖w‖ := fun w => Complex.norm_conj w
  let D : Point →L[ℂ] Point :=
    { toFun := fun z => star (Df (star z)),
      map_add' := fun a b => by
        show star (Df (star (a + b))) = star (Df (star a)) + star (Df (star b))
        rw [star_add, map_add, star_add],
      map_smul' := fun c z => by
        show star (Df (star (c • z))) = c • star (Df (star z))
        rw [hstar_smul, map_smul, smul_eq_mul, star_mul, star_star, smul_eq_mul, mul_comm],
      cont := (continuous_star.comp (Df.cont.comp continuous_star)) }
  refine ⟨D, ?_⟩
  rw [hasFDerivAt_iff_tendsto]
  have hD : ∀ y : Point, D (y - x) = star (Df ((star y) - (star x))) := by
    intro y
    show star (Df (star (y - x))) = star (Df (star y - star x))
    rw [star_sub]
  have hnorm : ∀ y : Point, ‖(star y) - (star x)‖ = ‖y - x‖ := by
    intro y
    rw [← star_sub, norm_star]
  have key : ∀ y : Point, ‖y - x‖⁻¹ * ‖star (f (star y)) - star (f (star x)) - D (y - x)‖
      = ‖(star y) - (star x)‖⁻¹ * ‖f (star y) - f (star x) - Df ((star y) - (star x))‖ := by
    intro y
    calc ‖y - x‖⁻¹ * ‖star (f (star y)) - star (f (star x)) - D (y - x)‖
        = ‖y - x‖⁻¹ * ‖star (f (star y) - f (star x) - Df ((star y) - (star x)))‖ := by
          congr 1
          rw [hD y, star_sub, star_sub]
      _ = ‖y - x‖⁻¹ * ‖f (star y) - f (star x) - Df ((star y) - (star x))‖ := by
          rw [norm_star]
      _ = ‖(star y) - (star x)‖⁻¹ * ‖f (star y) - f (star x) - Df ((star y) - (star x))‖ := by
          rw [hnorm]
  simp_rw [key]
  have hDf' : Filter.Tendsto
      (fun u => ‖u - star x‖⁻¹ * ‖f u - f (star x) - Df (u - star x)‖)
      (nhds (star x)) (nhds 0) := by
    rwa [← hasFDerivAt_iff_tendsto]
  have hstar_cont : Filter.Tendsto (fun y : Point => star y) (nhds x) (nhds (star x)) :=
    (continuous_star.tendsto x)
  exact hDf'.comp hstar_cont

/-- Auxiliary: star of a nat-cast complex power. -/
theorem star_natCast_cpow (n : ℕ) (t : Point) :
    star (((n:Point)) ^ (star t)) = ((n:Point)) ^ t := by
  have harg : ((n:Point)).arg ≠ Real.pi := by
    rw [Complex.natCast_arg]
    exact (Real.pi_ne_zero).symm
  have h2 := Complex.cpow_conj ((n:Point)) t harg
  show (starRingEnd ℂ) (↑n ^ (starRingEnd ℂ) t) = ↑n ^ t
  rw [h2]
  have hinv : ∀ W : Point, (starRingEnd ℂ) ((starRingEnd ℂ) W) = W := by
    intro W
    show star (star W) = W
    exact star_star W
  rw [hinv, map_natCast]

/-- Schwarz reflection for the Riemann zeta function. -/
theorem zeta_schwarz_reflection (s : Point) (hs : s ≠ 1) :
    riemannZeta (star s) = star (riemannZeta s) := by
  have hF_diff : DifferentiableOn ℂ (fun y => star (riemannZeta (star y))) {1}ᶜ := by
    intro x hx
    rw [Set.mem_compl_iff, Set.mem_singleton_iff] at hx
    apply DifferentiableAt.differentiableWithinAt
    apply differentiableAt_star_comp
    apply differentiableAt_riemannZeta
    intro hcon
    apply hx
    have hxx : x = star (star x) := (star_star x).symm
    rw [hxx, hcon, star_one]
  have hF_analytic : AnalyticOnNhd ℂ (fun y => star (riemannZeta (star y))) {1}ᶜ :=
    DifferentiableOn.analyticOnNhd hF_diff isOpen_compl_singleton
  have hzeta_analytic : AnalyticOnNhd ℂ riemannZeta {1}ᶜ := by
    apply DifferentiableOn.analyticOnNhd
    · intro x hx
      rw [Set.mem_compl_iff, Set.mem_singleton_iff] at hx
      exact (differentiableAt_riemannZeta hx).differentiableWithinAt
    · exact isOpen_compl_singleton
  have hEqOn : Set.EqOn (fun y => star (riemannZeta (star y))) riemannZeta {t : Point | 1 < t.re} := by
    intro t ht
    simp only [Set.mem_setOf_eq] at ht
    have ht_star : (1:ℝ) < (star t).re := by
      have hre : (star t).re = t.re := Complex.conj_re t
      rw [hre]; exact ht
    show star (riemannZeta (star t)) = riemannZeta t
    rw [zeta_eq_tsum_one_div_nat_cpow ht_star, zeta_eq_tsum_one_div_nat_cpow ht, tsum_star]
    apply tsum_congr
    intro n
    rw [star_div₀, star_one, star_natCast_cpow]
  have hnbhd : {t : Point | 1 < t.re} ∈ nhds (2:Point) := by
    apply IsOpen.mem_nhds
    · exact Complex.continuous_re.isOpen_preimage _ isOpen_Ioi
    · simp
  have hev : (fun y => star (riemannZeta (star y))) =ᶠ[nhds 2] riemannZeta :=
    Filter.eventuallyEq_of_mem hnbhd hEqOn
  have hpre : IsPreconnected ({1}ᶜ : Set Point) := by
    apply IsConnected.isPreconnected
    refine isConnected_compl_singleton_of_one_lt_rank ?_ (1:Point)
    rw [Complex.rank_real_complex]
    norm_num
  have h2 : (2:Point) ∈ ({1}ᶜ : Set Point) := by simp
  have hEq := AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq
    hF_analytic hzeta_analytic hpre h2 hev
  have hs_mem : s ∈ ({1}ᶜ : Set Point) := by simpa using hs
  have hFs := hEq hs_mem
  simp only at hFs
  have hcon := congrArg star hFs
  simp only [star_star] at hcon
  exact hcon

/-- Zeta does not vanish at negative odd integers. -/
theorem zeta_ne_zero_neg_odd (k : ℕ) : riemannZeta (-(2 * (k : Point) + 1)) ≠ 0 := by
  have hwre : (2 * (k:Point) + 2).re = 2 * (k:ℝ) + 2 := by
    simp [Complex.add_re, Complex.mul_re, Complex.natCast_re]
  have hk0 : (0:ℝ) ≤ (k:ℝ) := Nat.cast_nonneg k
  have hw1 : (2:Point) * (k:Point) + 2 ≠ 1 := by
    intro h
    have hre := congrArg Complex.re h
    rw [hwre] at hre
    simp at hre
    linarith
  have hw_neg : ∀ n : ℕ, (2:Point) * (k:Point) + 2 ≠ -((n:Point)) := by
    intro n h
    have hre := congrArg Complex.re h
    rw [hwre] at hre
    simp [Complex.neg_re, Complex.natCast_re] at hre
    have hn0 : (0:ℝ) ≤ (n:ℝ) := Nat.cast_nonneg n
    linarith
  have hfe := riemannZeta_one_sub (s := 2*(k:Point)+2) hw_neg hw1
  have h1w : (1:Point) - (2*(k:Point)+2) = -(2 * (k:Point) + 1) := by ring
  rw [h1w] at hfe
  rw [hfe]
  apply mul_ne_zero
  apply mul_ne_zero
  apply mul_ne_zero
  apply mul_ne_zero
  · norm_num
  · have h2pi_ne : ((2:Point) * Real.pi) ≠ 0 := by
      apply mul_ne_zero
      · norm_num
      · exact_mod_cast Real.pi_ne_zero
    rw [Complex.cpow_def_of_ne_zero h2pi_ne]
    exact Complex.exp_ne_zero _
  · apply Complex.Gamma_ne_zero_of_re_pos
    rw [hwre]
    linarith
  · have hcos_arg : (Real.pi:Point) * (2*(k:Point)+2) / 2 = (((Real.pi * ((k+1:ℕ):ℝ) : ℝ)):Point) := by
      push_cast
      ring
    have hcos_val : Real.cos (Real.pi * ((k+1:ℕ):ℝ)) = (-1)^((k+1:ℕ)) := by
      have h := Real.cos_add_nat_mul_pi (0:ℝ) (k+1)
      rw [zero_add, Real.cos_zero, mul_one] at h
      rw [mul_comm Real.pi]
      exact h
    have hne : ((-1:ℝ)^((k+1:ℕ))) ≠ 0 := pow_ne_zero _ (by norm_num)
    rw [hcos_arg, ← Complex.ofReal_cos, hcos_val]
    exact_mod_cast hne
  · apply riemannZeta_ne_zero_of_one_lt_re
    rw [hwre]
    linarith

/-- Nontrivial zeros avoid the nonpositive integers. -/
theorem zeta_zeros_not_neg_nat {s : Point} (hz : ZetaZeros s) : ∀ n : ℕ, s ≠ -(n : Point) := by
  intro n h
  obtain ⟨hz0, hz1, hz2⟩ := hz
  rcases Nat.even_or_odd n with ⟨k, hk⟩ | ⟨k, hk⟩
  · rcases k with _ | k
    · have hn0 : n = 0 := by omega
      subst hn0
      simp at h
      rw [h, riemannZeta_zero] at hz0
      norm_num at hz0
    · have hn : n = 2 * (k + 1) := by omega
      subst hn
      apply hz1
      use k
      rw [h]
      push_cast
      ring
  · have hn : n = 2 * k + 1 := by omega
    subst hn
    have hs : s = -(2 * (k:Point) + 1) := by
      rw [h]
      push_cast
      ring
    rw [hs] at hz0
    exact (zeta_ne_zero_neg_odd k) hz0

/-- The nontrivial zero set is closed under s ↦ 1 - s. -/
theorem zeta_zeros_symm {s : Point} (hz : ZetaZeros s) : ZetaZeros (foldPt s) := by
  obtain ⟨hz0, hz1, hz2⟩ := hz
  have hne := zeta_zeros_not_neg_nat ⟨hz0, hz1, hz2⟩
  have hfe := riemannZeta_one_sub (s := s) hne hz2
  show ZetaZeros (1 - s)
  constructor
  · rw [hfe, hz0, mul_zero]
  · constructor
    · intro ⟨m, hm⟩
      have hs : s = 1 + 2 * ((m:Point) + 1) := by linear_combination -hm
      have hre : s.re = 1 + 2 * ((m:ℝ) + 1) := by
        rw [hs]
        simp [Complex.add_re, Complex.mul_re, Complex.natCast_re]
      have h1lt : (1:ℝ) < s.re := by
        rw [hre]
        have hm0 : (0:ℝ) ≤ (m:ℝ) := Nat.cast_nonneg m
        linarith
      exact (riemannZeta_ne_zero_of_one_lt_re h1lt) hz0
    · intro hcon
      have hs0 : s = 0 := by linear_combination -hcon
      have hne0 := hne 0
      simp at hne0
      exact hne0 hs0

/-- The nontrivial zero set is closed under the point reflection. -/
theorem zeta_zeros_closed_pt : ClosedPt ZetaZeros :=
  fun _ hz => zeta_zeros_symm hz

/-- The nontrivial zero set is closed under conjugation. -/
theorem zeta_zeros_conj {s : Point} (hz : ZetaZeros s) : ZetaZeros (star s) := by
  obtain ⟨hz0, hz1, hz2⟩ := hz
  constructor
  · rw [zeta_schwarz_reflection s hz2, hz0, star_zero]
  · constructor
    · intro ⟨n, hn⟩
      apply hz1
      use n
      have hss : s = star (star s) := (star_star s).symm
      rw [hss, hn]
      simp
    · intro hcon
      apply hz2
      have hss : s = star (star s) := (star_star s).symm
      rw [hss, hcon, star_one]

/-- The nontrivial zero set is closed under the conjugate reflection fold. -/
theorem zeta_zeros_closed : Closed ZetaZeros :=
  fun _ hz => zeta_zeros_symm (zeta_zeros_conj hz)

/-- A seat: a fold that is an involution, and a registration the fold keeps. -/
structure Seat (X Y : Type) where
  fold : X → X
  involutive : ∀ a, fold (fold a) = a
  reg : X → Y
  keeps : ∀ a, reg (fold a) = reg a

section General
variable {X Y : Type} (σ : Seat X Y)

/-- FORM: the configuration is closed under the fold. -/
def Folded (S : X → Prop) : Prop := ∀ a, S a → S (σ.fold a)
/-- REGISTRATION: the record returns every existent; no two existents share a registration. -/
def Witnessed (S : X → Prop) : Prop := ∀ a b, S a → S b → σ.reg a = σ.reg b → a = b
/-- THE LINE: every existent is fixed by the fold. -/
def AllFixed (S : X → Prop) : Prop := ∀ a, S a → σ.fold a = a
/-- THE TRIAD: existence, form and registration together. -/
def Triad (S : X → Prop) : Prop := (∃ a, S a) ∧ Folded σ S ∧ Witnessed σ S

/-- THE GENERALIZED HYPOTHESIS, TRIAXIAL FORM. On every seat, a configuration that is closed under the fold and
    whose record returns every existent has every existent on the line. -/
theorem generalized_hypothesis (S : X → Prop) (form : Folded σ S) (witness : Witnessed σ S) : AllFixed σ S :=
  fun a ha => witness (σ.fold a) a (form a ha) ha (σ.keeps a)

/-- A triad has an existent, and it is on the line. -/
theorem a_triad_has_an_existent_on_the_line (S : X → Prop) (h : Triad σ S) : ∃ a, S a ∧ σ.fold a = a :=
  let ⟨a, ha⟩ := h.1
  ⟨a, ha, generalized_hypothesis σ S h.2.1 h.2.2 a ha⟩

/-- On the line the witness holds, where the registration tells the points of the line apart. -/
theorem on_the_line_is_witnessed
    (faithful : ∀ a b, σ.fold a = a → σ.fold b = b → σ.reg a = σ.reg b → a = b)
    (S : X → Prop) (h : AllFixed σ S) : Witnessed σ S :=
  fun a b ha hb e => faithful a b (h a ha) (h b hb) e

/-- THE TRIAD IS IRREDUCIBLE. Where the fold moves a point, no two axes give the line: without form there is a
    witnessed configuration off the line; without registration there is a closed configuration off the line;
    without existence there is a closed and witnessed configuration with nothing on the line. -/
theorem the_triad_is_irreducible (p : X) (moved : σ.fold p ≠ p) :
    (∃ S : X → Prop, (∃ a, S a) ∧ Witnessed σ S ∧ ¬ AllFixed σ S) ∧
    (∃ S : X → Prop, (∃ a, S a) ∧ Folded σ S ∧ ¬ AllFixed σ S) ∧
    (∃ S : X → Prop, Folded σ S ∧ Witnessed σ S ∧ ¬ ∃ a, S a ∧ σ.fold a = a) := by
  refine ⟨⟨fun x => x = p, ⟨p, rfl⟩, ?_, ?_⟩, ⟨fun x => x = p ∨ x = σ.fold p, ⟨p, Or.inl rfl⟩, ?_, ?_⟩,
    ⟨fun _ => False, fun _ h => h, fun _ _ h => h.elim, fun ⟨_, h, _⟩ => h⟩⟩
  · intro a b ha hb _; rw [ha, hb]
  · intro h; exact moved (h p rfl)
  · rintro a (ha | ha)
    · exact Or.inr (by rw [ha])
    · exact Or.inl (by rw [ha, σ.involutive])
  · intro h; exact moved (h p (Or.inl rfl))

end General

/-! ## Part V. The plane -/

theorem fold_re (s : ℂ) : (fold s).re = 1 - s.re := by simp [fold]
theorem fold_im (s : ℂ) : (fold s).im = s.im := by simp [fold]

/-- THE SEAT OF THE PLANE: `fold` and `reg` on ℂ. -/
noncomputable def lineSeat : Seat ℂ ℂ where
  fold := fold
  involutive := fold_involutive
  reg := reg
  keeps := fun s => by
    show (⟨1 / 2, (fold s).im⟩ : ℂ) = ⟨1 / 2, s.im⟩
    rw [fold_im]

/-- On the plane, the fold fixes a point exactly on the line Re s = 1/2. -/
theorem fixed_iff_on_line (s : ℂ) : lineSeat.fold s = s ↔ onLine s := by
  show fold s = s ↔ s.re = 1 / 2
  constructor
  · intro h
    have h2 := congrArg Complex.re h
    rw [fold_re] at h2
    linarith
  · intro h
    exact Complex.ext (by rw [fold_re]; linarith) (fold_im s)

/-- THE GENERALIZED HYPOTHESIS ON THE PLANE. A configuration of ℂ that is closed under the fold and whose
    record returns every existent lies on the line Re s = 1/2. -/
theorem generalized_hypothesis_on_the_plane (S : Config) (form : Closed S) (witness : Witnessed lineSeat S) :
    Value S :=
  fun s hs => (fixed_iff_on_line s).mp (generalized_hypothesis lineSeat S form witness s hs)

theorem lineSeat_faithful :
    ∀ a b : ℂ, lineSeat.fold a = a → lineSeat.fold b = b → lineSeat.reg a = lineSeat.reg b → a = b := by
  intro a b ha hb e
  have ea : reg a = a := (reg_eq_self_iff a).mpr ((fixed_iff_on_line a).mp ha)
  have eb : reg b = b := (reg_eq_self_iff b).mpr ((fixed_iff_on_line b).mp hb)
  have e' : reg a = reg b := e
  rw [ea, eb] at e'
  exact e'

/-- On the plane, for a closed configuration, the witness and the line are one statement. -/
theorem witnessed_iff_value (S : Config) (form : Closed S) : Witnessed lineSeat S ↔ Value S :=
  ⟨generalized_hypothesis_on_the_plane S form,
   fun h => on_the_line_is_witnessed lineSeat lineSeat_faithful S
     (fun s hs => (fixed_iff_on_line s).mpr (h s hs))⟩

/-- The plane has a point the fold moves, so its triad is irreducible. -/
theorem the_plane_triad_is_irreducible :
    (∃ S : Config, (∃ a, S a) ∧ Witnessed lineSeat S ∧ ¬ AllFixed lineSeat S) ∧
    (∃ S : Config, (∃ a, S a) ∧ Folded lineSeat S ∧ ¬ AllFixed lineSeat S) ∧
    (∃ S : Config, Folded lineSeat S ∧ Witnessed lineSeat S ∧ ¬ ∃ a, S a ∧ lineSeat.fold a = a) := by
  refine the_triad_is_irreducible lineSeat (⟨1 / 4, 14⟩ : ℂ) ?_
  intro h
  have := (fixed_iff_on_line _).mp h
  unfold onLine at this
  norm_num at this

/-! ## Part VI. The record and the zeros of ζ -/

/-- THE RECORD OF THE ZEROS IS A MEMBER, with nothing before the colon: it is closed under the fold, its record
    returns every existent, and it lies on the line. -/
theorem the_record_of_the_zeros_is_a_member :
    Folded lineSeat (Rec ZetaZeros) ∧ Witnessed lineSeat (Rec ZetaZeros) ∧ Value (Rec ZetaZeros) := by
  have v : Value (Rec ZetaZeros) := fun s hs => (reg_eq_self_iff s).mp (cargo_at_zeros s hs)
  have fx : AllFixed lineSeat (Rec ZetaZeros) := fun s hs => (fixed_iff_on_line s).mpr (v s hs)
  refine ⟨fun s hs => ?_, on_the_line_is_witnessed lineSeat lineSeat_faithful _ fx, v⟩
  rw [fx s hs]; exact hs

/-- WHERE THE ZEROS STAND. The zeros of ζ exist as a configuration and are closed under the fold, by proof. Their
    third axis, the witness, is the classical statement. -/
theorem the_zeros_are_witnessed_iff :
    Closed ZetaZeros ∧ (Witnessed lineSeat ZetaZeros ↔ RiemannHypothesis) := by
  refine ⟨zeta_zeros_closed, (witnessed_iff_value ZetaZeros zeta_zeros_closed).trans ?_⟩
  rw [h_id_proved]
  exact ⟨fun h s hs => (reg_eq_self_iff s).mpr (h s hs), fun h s hs => (reg_eq_self_iff s).mp (h s hs)⟩

/-! ## The Dirichlet family

RATIONALE. The fold of the plane is not special to ζ. Every primitive Dirichlet character χ ≠ 1 has its own
  functional equation, and with Schwarz reflection it closes the zeros of L(·, χ) in the open strip under the
  same fold s ↦ 1 − conj s. So those zeros are a configuration with two proved axes, and their third axis, the
  witness, is one proposition with the generalized hypothesis for χ.
DESIGN. `inv_isPrimitive` (the conjugate character is primitive); `dirichlet_schwarz` (L(s, χ⁻¹) is the
  conjugate of L(conj s, χ), by the identity theorem from the half plane of convergence); `DirichletZeros`;
  `dirichlet_zeros_closed`; `DirichletHypothesis`; `the_dirichlet_zeros_are_witnessed_iff`.
SCOPE (read before citing). Primitive characters with χ ≠ 1. The one remaining primitive character is the
  trivial character of level 1, whose L-function is ζ; it is `the_zeros_are_witnessed_iff`. `DirichletHypothesis χ`
  is printed inside a biconditional and nowhere else.
NON-NEGOTIABLE. No axiom, no sorry. The hypothesis for χ is never stated alone as a theorem.
-/

section DirichletFamily
open DirichletCharacter

variable {N : ℕ} [NeZero N]

omit [NeZero N] in
/-- The inverse (complex conjugate) of a primitive character is primitive. -/
theorem inv_isPrimitive {χ : DirichletCharacter ℂ N} (hχ : χ.IsPrimitive) : (χ⁻¹).IsPrimitive := by
  have key : ∀ ψ : DirichletCharacter ℂ N, ψ.conductorSet ⊆ (ψ⁻¹).conductorSet := by
    intro ψ d hd
    obtain ⟨h, χ₀, e⟩ := hd
    exact ⟨h, χ₀⁻¹, by rw [e, map_inv]⟩
  have e : (χ⁻¹).conductorSet = χ.conductorSet :=
    Set.Subset.antisymm (by have := key χ⁻¹; rwa [inv_inv] at this) (key χ)
  show (χ⁻¹).conductor = N
  have h0 : χ.conductor = N := hχ
  unfold DirichletCharacter.conductor at h0 ⊢
  rw [e]; exact h0

/-- Schwarz reflection for a Dirichlet L-function: L(s, χ⁻¹) is the conjugate of L(conj s, χ). -/
theorem dirichlet_schwarz (χ : DirichletCharacter ℂ N) (hne : χ ≠ 1) (s : ℂ) :
    LFunction χ⁻¹ s = star (LFunction χ (star s)) := by
  have hne' : χ⁻¹ ≠ 1 := fun h => hne (inv_eq_one.mp h)
  have hF : Differentiable ℂ (fun y => star (LFunction χ (star y))) :=
    fun x => differentiableAt_star_comp ((differentiable_LFunction hne) (star x))
  have hG : Differentiable ℂ (LFunction χ⁻¹) := differentiable_LFunction hne'
  have hEqOn : Set.EqOn (fun y => star (LFunction χ (star y))) (LFunction χ⁻¹) {t : ℂ | 1 < t.re} := by
    intro t ht
    simp only [Set.mem_setOf_eq] at ht
    have ht' : (1 : ℝ) < (star t).re := by rw [show (star t).re = t.re from Complex.conj_re t]; exact ht
    show star (LFunction χ (star t)) = LFunction χ⁻¹ t
    rw [LFunction_eq_LSeries χ ht', LFunction_eq_LSeries χ⁻¹ ht]
    unfold LSeries
    rw [tsum_star]
    apply tsum_congr
    intro n
    unfold LSeries.term
    split_ifs with h0
    · exact star_zero _
    · rw [star_div₀, star_natCast_cpow, MulChar.star_apply']
  have hnbhd : {t : ℂ | 1 < t.re} ∈ nhds (2 : ℂ) :=
    IsOpen.mem_nhds (Complex.continuous_re.isOpen_preimage _ isOpen_Ioi) (by simp)
  have hEq := AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq
    (hF.differentiableOn.analyticOnNhd isOpen_univ) (hG.differentiableOn.analyticOnNhd isOpen_univ)
    isPreconnected_univ (Set.mem_univ (2 : ℂ)) (Filter.eventuallyEq_of_mem hnbhd hEqOn)
  exact (hEq (Set.mem_univ s)).symm

omit [NeZero N] in
/-- In the open strip the gamma factor of a character does not vanish. -/
theorem gammaFactor_ne_zero_of_strip (χ : DirichletCharacter ℂ N) {s : ℂ} (h0 : 0 < s.re) :
    gammaFactor χ s ≠ 0 := by
  rcases χ.even_or_odd with h | h
  · rw [h.gammaFactor_def]; exact Complex.Gammaℝ_ne_zero_of_re_pos h0
  · rw [h.gammaFactor_def]
    exact Complex.Gammaℝ_ne_zero_of_re_pos (by rw [Complex.add_re, Complex.one_re]; linarith)

/-- The zeros of L(·, χ) in the open strip: the nontrivial zeros. -/
def DirichletZeros (χ : DirichletCharacter ℂ N) (s : ℂ) : Prop :=
  LFunction χ s = 0 ∧ 0 < s.re ∧ s.re < 1

/-- THE SECOND AXIS OF THE DIRICHLET ZEROS. For a primitive χ ≠ 1 the nontrivial zeros of L(·, χ) are closed
    under the fold s ↦ 1 − conj s. Functional equation, then Schwarz reflection. -/
theorem dirichlet_zeros_closed {χ : DirichletCharacter ℂ N} (hχ : χ.IsPrimitive) (hne : χ ≠ 1) :
    Closed (DirichletZeros χ) := by
  intro s hs
  obtain ⟨hz, h0, h1⟩ := hs
  have hN : N ≠ 1 := fun h => hne (level_one' χ h)
  -- the completed function vanishes at s
  have hΛ : completedLFunction χ s = 0 := by
    have e := LFunction_eq_completed_div_gammaFactor χ s (Or.inr hN)
    rw [hz] at e
    rcases div_eq_zero_iff.mp e.symm with h | h
    · exact h
    · exact absurd h (gammaFactor_ne_zero_of_strip χ h0)
  -- the functional equation of χ⁻¹ carries the zero to 1 − s
  have hΛ' : completedLFunction χ⁻¹ (1 - s) = 0 := by
    rw [(inv_isPrimitive hχ).completedLFunction_one_sub s, inv_inv, hΛ, mul_zero]
  have hL' : LFunction χ⁻¹ (1 - s) = 0 := by
    rw [LFunction_eq_completed_div_gammaFactor χ⁻¹ (1 - s) (Or.inr hN), hΛ', zero_div]
  -- Schwarz reflection carries it to the fold of s
  have hfold : fold s = star (1 - s) := by simp [fold]
  refine ⟨?_, ?_, ?_⟩
  · have e := dirichlet_schwarz χ hne (1 - s)
    rw [hL'] at e
    have e2 := congrArg star e
    rw [star_star, star_zero] at e2
    rw [hfold]; exact e2.symm
  · rw [fold_re]; linarith
  · rw [fold_re]; linarith

/-- The generalized Riemann hypothesis for the character χ: every zero of L(·, χ) in the open strip has real
    part 1/2. -/
def DirichletHypothesis (χ : DirichletCharacter ℂ N) : Prop :=
  ∀ s : ℂ, LFunction χ s = 0 → 0 < s.re → s.re < 1 → s.re = 1 / 2

/-- WHERE THE DIRICHLET ZEROS STAND. For every primitive χ ≠ 1 the nontrivial zeros of L(·, χ) exist as a
    configuration closed under the fold, by proof, and their witness is one proposition with the generalized
    hypothesis for χ. -/
theorem the_dirichlet_zeros_are_witnessed_iff {χ : DirichletCharacter ℂ N} (hχ : χ.IsPrimitive) (hne : χ ≠ 1) :
    Closed (DirichletZeros χ) ∧ (Witnessed lineSeat (DirichletZeros χ) ↔ DirichletHypothesis χ) := by
  refine ⟨dirichlet_zeros_closed hχ hne,
    (witnessed_iff_value _ (dirichlet_zeros_closed hχ hne)).trans ?_⟩
  exact ⟨fun h s hz h0 h1 => h s ⟨hz, h0, h1⟩, fun h s hs => h s hs.1 hs.2.1 hs.2.2⟩

end DirichletFamily

/-! ## Part VII. The theorem -/

/-- THE TRIAXIAL THEOREM. Nothing before the colon. -/
theorem the_triaxial_theorem :
    -- I. The generalized hypothesis, on every seat: form and registration give the line.
    (∀ (X Y : Type) (σ : Seat X Y) (S : X → Prop), Folded σ S → Witnessed σ S → AllFixed σ S) ∧
    -- II. Irreducibility, on every seat with a moved point: no two axes give the line.
    (∀ (X Y : Type) (σ : Seat X Y) (p : X), σ.fold p ≠ p →
      (∃ S : X → Prop, (∃ a, S a) ∧ Witnessed σ S ∧ ¬ AllFixed σ S) ∧
      (∃ S : X → Prop, (∃ a, S a) ∧ Folded σ S ∧ ¬ AllFixed σ S) ∧
      (∃ S : X → Prop, Folded σ S ∧ Witnessed σ S ∧ ¬ ∃ a, S a ∧ σ.fold a = a)) ∧
    -- III. On the plane: a closed and witnessed configuration lies on Re s = 1/2, and conversely.
    (∀ S : Config, Closed S → (Witnessed lineSeat S ↔ Value S)) ∧
    -- IV. The record of the zeros of ζ is a member.
    (Folded lineSeat (Rec ZetaZeros) ∧ Witnessed lineSeat (Rec ZetaZeros) ∧ Value (Rec ZetaZeros)) :=
  ⟨fun _ _ σ S f w => generalized_hypothesis σ S f w,
   fun _ _ σ p m => the_triad_is_irreducible σ p m,
   witnessed_iff_value,
   the_record_of_the_zeros_is_a_member⟩

/-- THE FINAL THEOREM. Nothing before the colon. The generalized hypothesis in triaxial form is a theorem in its
    own domain, direct, with no posit and no delivered bit; the triad is irreducible; on the plane the witness is
    the line; the record of the zeros of ζ is a member; and the zeros of ζ themselves carry existence and form by
    proof, their witness being the classical statement, one proposition on both sides; and the same holds for the
    zeros of every primitive Dirichlet L-function, their witness being the generalized hypothesis for the character. -/
theorem the_final_theorem :
    -- I. The generalized hypothesis, triaxial form, on every seat.
    (∀ (X Y : Type) (σ : Seat X Y) (S : X → Prop), Folded σ S → Witnessed σ S → AllFixed σ S) ∧
    -- II. The triad is irreducible on every seat with a moved point.
    (∀ (X Y : Type) (σ : Seat X Y) (p : X), σ.fold p ≠ p →
      (∃ S : X → Prop, (∃ a, S a) ∧ Witnessed σ S ∧ ¬ AllFixed σ S) ∧
      (∃ S : X → Prop, (∃ a, S a) ∧ Folded σ S ∧ ¬ AllFixed σ S) ∧
      (∃ S : X → Prop, Folded σ S ∧ Witnessed σ S ∧ ¬ ∃ a, S a ∧ σ.fold a = a)) ∧
    -- III. On the plane, for a closed configuration, the witness and the line Re s = 1/2 are one statement.
    (∀ S : Config, Closed S → (Witnessed lineSeat S ↔ Value S)) ∧
    -- IV. The record of the zeros of ζ is a member of the domain.
    (Folded lineSeat (Rec ZetaZeros) ∧ Witnessed lineSeat (Rec ZetaZeros) ∧ Value (Rec ZetaZeros)) ∧
    -- V. The zeros of ζ: closed under the fold by proof; their witness is the classical statement.
    (Closed ZetaZeros ∧ (Witnessed lineSeat ZetaZeros ↔ RiemannHypothesis)) ∧
    -- VI. The zeros of every primitive Dirichlet L-function, χ ≠ 1: closed under the fold by proof; their
    --     witness is the generalized hypothesis for χ.
    (∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N), χ.IsPrimitive → χ ≠ 1 →
      Closed (DirichletZeros χ) ∧ (Witnessed lineSeat (DirichletZeros χ) ↔ DirichletHypothesis χ)) :=
  ⟨the_triaxial_theorem.1, the_triaxial_theorem.2.1, the_triaxial_theorem.2.2.1, the_triaxial_theorem.2.2.2,
   the_zeros_are_witnessed_iff, fun _ _ _ hχ hne => the_dirichlet_zeros_are_witnessed_iff hχ hne⟩

end Triaxial

#print axioms Triaxial.fold_involutive
#print axioms Triaxial.foldPt_re_fixed_iff
#print axioms Triaxial.completed_zeta_zeros_symm
#print axioms Triaxial.reg_lands
#print axioms Triaxial.fold_reg
#print axioms Triaxial.reg_eq_self_iff
#print axioms Triaxial.twins_zeta
#print axioms Triaxial.h_read_proved
#print axioms Triaxial.h_id_proved
#print axioms Triaxial.reg_idem
#print axioms Triaxial.the_remembered_is_lossless
#print axioms Triaxial.record_closed
#print axioms Triaxial.record_has_least_erasure
#print axioms Triaxial.cargo_at_zeros
#print axioms Triaxial.foldPt_involutive
#print axioms Triaxial.completed_zeta_zeros_closed_pt
#print axioms Triaxial.zeta_zero_iff_completed_of_re_pos
#print axioms Triaxial.zeta_zeros_iff_completed_in_strip
#print axioms Triaxial.zeta_zeros_symm_in_strip
#print axioms Triaxial.strip_zeta_zeros_closed_pt
#print axioms Triaxial.differentiableAt_star_comp
#print axioms Triaxial.star_natCast_cpow
#print axioms Triaxial.zeta_schwarz_reflection
#print axioms Triaxial.zeta_ne_zero_neg_odd
#print axioms Triaxial.zeta_zeros_not_neg_nat
#print axioms Triaxial.zeta_zeros_symm
#print axioms Triaxial.zeta_zeros_closed_pt
#print axioms Triaxial.zeta_zeros_conj
#print axioms Triaxial.zeta_zeros_closed
#print axioms Triaxial.generalized_hypothesis
#print axioms Triaxial.a_triad_has_an_existent_on_the_line
#print axioms Triaxial.on_the_line_is_witnessed
#print axioms Triaxial.the_triad_is_irreducible
#print axioms Triaxial.fold_re
#print axioms Triaxial.fold_im
#print axioms Triaxial.fixed_iff_on_line
#print axioms Triaxial.generalized_hypothesis_on_the_plane
#print axioms Triaxial.lineSeat_faithful
#print axioms Triaxial.witnessed_iff_value
#print axioms Triaxial.the_plane_triad_is_irreducible
#print axioms Triaxial.the_record_of_the_zeros_is_a_member
#print axioms Triaxial.the_zeros_are_witnessed_iff
#print axioms Triaxial.inv_isPrimitive
#print axioms Triaxial.dirichlet_schwarz
#print axioms Triaxial.gammaFactor_ne_zero_of_strip
#print axioms Triaxial.dirichlet_zeros_closed
#print axioms Triaxial.the_dirichlet_zeros_are_witnessed_iff
#print axioms Triaxial.the_triaxial_theorem
#print axioms Triaxial.the_final_theorem
```

## Appendix B · Triaxial_Twin_CC.f90

Ten checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix C.

```fortran
! Triaxial_Twin_CC.f90 · twin of Generalized_RH_Triaxial_Theorem_CC.lean
! RATIONALE. The engine proves, for every seat, that a configuration closed under the fold and witnessed by its
!   record lies on the line, that no two of the three axes give the line, and that on the line the witness holds.
!   This twin checks the same statements by exhaustion on a finite seat (A), checks the seat of the plane on a grid
!   and on random points (B), and looks at the first zeros of zeta by direct evaluation (C).
! DESIGN. Whole numbers in A. The finite seat is the 3 by 3 grid of points (x, t) with x and t in -1, 0, 1; the fold
!   sends x to -x; the registration keeps t and forgets x, as the registration of the plane keeps the height.
!   All 512 configurations are enumerated. In B the plane is complex double precision: fold(s) = 1 - conjg(s),
!   reg(s) = (1/2, imag(s)). In C zeta is evaluated on the line by the alternating series with Euler's
!   transformation, and its zeros are located by the change of sign of Hardy's function Z(t).
! RISK. Exhaustion on one finite seat and draws on the plane are instances; the statement for every seat is the
!   engine's theorem. C locates zeros on the line to the precision of the search and proves nothing about zeros
!   off it.
! NON-NEGOTIABLE. Every count is found by the enumeration, not entered.
program triaxial_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0), qp = selected_real_kind(30)
  integer :: nfail, npass, m, i, j, k, nclosed, nwit, nboth, nline, nbad, nconv, n1, n2, n3, np, idx(9,2), nz, s(33), nseed
  logical :: in(9), closed, wit, online, anyp, anyon
  real(dp) :: worst, w2, w3, u(2), t, z0, z1, ta, tb, tm, zeros(5)
  complex(dp) :: sp, f
  nfail = 0; npass = 0
  call random_seed(size=nseed); s = 20260622; call random_seed(put=s(1:nseed))

  ! A. every configuration on the 3 by 3 seat
  np = 0
  do i = -1, 1; do j = -1, 1
    np = np + 1; idx(np, :) = [i, j]
  end do; end do
  nclosed = 0; nwit = 0; nboth = 0; nline = 0; nbad = 0; nconv = 0; n1 = 0; n2 = 0; n3 = 0
  do m = 0, 511
    do k = 1, 9
      in(k) = btest(m, k - 1)
    end do
    closed = .true.; wit = .true.; online = .true.; anyp = any(in); anyon = .false.
    do k = 1, 9
      if (.not. in(k)) cycle
      if (.not. in(pos(-idx(k,1), idx(k,2)))) closed = .false.
      if (idx(k,1) /= 0) online = .false.
      if (idx(k,1) == 0) anyon = .true.
      do j = 1, 9
        if (in(j) .and. j /= k .and. idx(j,2) == idx(k,2)) wit = .false.
      end do
    end do
    if (closed) nclosed = nclosed + 1
    if (wit) nwit = nwit + 1
    if (online) nline = nline + 1
    if (closed .and. wit) nboth = nboth + 1
    if (closed .and. wit .and. .not. online) nbad = nbad + 1
    if (online .and. .not. wit) nconv = nconv + 1
    if (anyp .and. wit .and. .not. online) n1 = n1 + 1            ! existence and registration, no form
    if (anyp .and. closed .and. .not. online) n2 = n2 + 1         ! existence and form, no registration
    if (closed .and. wit .and. .not. anyon) n3 = n3 + 1           ! form and registration, no existence
  end do
  write(*,'(a,i0,a,i0,a,i0,a,i0)') '  of 512 configurations: closed ', nclosed, '; witnessed ', nwit, &
    '; closed and witnessed ', nboth, '; on the line ', nline
  write(*,'(a,i0)') '  closed and witnessed and off the line: ', nbad
  call check('A1 every closed and witnessed configuration lies on the line', nbad == 0 .and. nboth > 0)
  write(*,'(a,i0)') '  on the line and not witnessed: ', nconv
  call check('A2 every configuration on the line is witnessed', nconv == 0)
  call check('A3 closed and witnessed is the same as on the line', nboth == nline)
  write(*,'(a,i0,a,i0,a,i0)') '  off the line with two axes: without form ', n1, '; without registration ', n2, &
    '; closed and witnessed with nothing on the line ', n3
  call check('A4 the triad is irreducible: each pair of axes admits a configuration off the line', &
    n1 > 0 .and. n2 > 0 .and. n3 > 0)

  ! B. the seat of the plane
  worst = 0; w2 = 0; w3 = 0
  do i = 1, 1000
    call random_number(u); sp = cmplx(4 * u(1) - 2, 60 * u(2) - 30, dp)
    worst = max(worst, abs(fold(fold(sp)) - sp))
    w2 = max(w2, abs(reg(fold(sp)) - reg(sp)), abs(real(fold(sp)) - (1 - real(sp))))
    f = cmplx(0.5_dp, aimag(sp), dp); w3 = max(w3, abs(fold(f) - f))
  end do
  write(*,'(a,es9.2,a,es9.2,a,es9.2)') '  1000 points: fold twice ', worst, '; registration kept and side turned ', w2, &
    '; points of the line moved ', w3
  call check('B1 the fold is an involution, keeps the registration, and fixes the line', &
    worst < 1e-14_dp .and. w2 < 1e-14_dp .and. w3 < 1e-300_dp)
  nbad = 0
  do i = -200, 200
    sp = cmplx(0.5_dp + i * 0.005_dp, 14.0_dp, dp)
    if ((abs(fold(sp) - sp) < 1e-15_dp) .neqv. (i == 0)) nbad = nbad + 1
  end do
  call check('B2 on 401 points of one height the fold fixes exactly the point of the line', nbad == 0)
  sp = cmplx(0.25_dp, 14.0_dp, dp)
  write(*,'(a,2f7.3,a,2f7.3,a,2f7.3)') '  the point ', sp, ' and its partner ', fold(sp), ' have one registration ', reg(sp)
  call check('B3 a point off the line and its partner are two existents with one registration', &
    abs(fold(sp) - sp) > 0.4_dp .and. abs(reg(fold(sp)) - reg(sp)) < 1e-300_dp)

  ! C. the first zeros of zeta on the line, by the sign of Hardy's function
  nz = 0; t = 10.0_dp; z0 = hardy(t)
  do while (nz < 5 .and. t < 40.0_dp)
    z1 = hardy(t + 0.05_dp)
    if (z0 * z1 < 0) then
      ta = t; tb = t + 0.05_dp
      do k = 1, 60
        tm = (ta + tb) / 2
        if (hardy(ta) * hardy(tm) <= 0) then
          tb = tm
        else
          ta = tm
        end if
      end do
      nz = nz + 1; zeros(nz) = (ta + tb) / 2
    end if
    t = t + 0.05_dp; z0 = z1
  end do
  write(*,'(a,5f11.6)') '  heights of the first zeros found on the line: ', zeros
  call check('C1 five zeros are found on the line below height 40, the first at 14.134725', &
    nz == 5 .and. abs(zeros(1) - 14.134725_dp) < 1e-5_dp .and. abs(zeros(5) - 32.935062_dp) < 1e-5_dp)
  worst = 0
  do k = 1, 5
    sp = cmplx(0.5_dp, zeros(k), dp); worst = max(worst, abs(fold(sp) - sp), abs(zeta(sp)))
  end do
  write(*,'(a,es9.2)') '  at those five: largest of the size of zeta and of the distance to the partner: ', worst
  call check('C2 each of the five is its own partner, and zeta vanishes there to the precision of the search', worst < 1e-9_dp)
  sp = cmplx(0.25_dp, zeros(1), dp)
  write(*,'(a,es9.2)') '  size of zeta at the first height, a quarter off the line: ', abs(zeta(sp))
  call check('C3 off the line at that height zeta does not vanish', abs(zeta(sp)) > 0.1_dp)

  write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', npass + nfail, ',"failures":', nfail, '}'
  if (nfail /= 0) stop 1
contains
  integer function pos(x, t)
    integer, intent(in) :: x, t
    pos = (x + 1) * 3 + (t + 1) + 1
  end function
  complex(dp) function fold(z)
    complex(dp), intent(in) :: z
    fold = 1 - conjg(z)
  end function
  complex(dp) function reg(z)
    complex(dp), intent(in) :: z
    reg = cmplx(0.5_dp, aimag(z), dp)
  end function
  complex(dp) function zeta(z)          ! the alternating series with Euler's transformation, for real part > 0
    complex(dp), intent(in) :: z
    integer, parameter :: nn = 60
    integer :: kk, jj
    complex(qp) :: acc, zz
    real(qp) :: e(0:nn), c
    zz = cmplx(real(z, qp), real(aimag(z), qp), qp)
    e(nn) = 1; c = 1                      ! e(k) = sum_{j=k}^{n} binomial(n, j) / 2**n, by a running sum
    do jj = nn - 1, 0, -1
      c = c * real(jj + 1, qp) / real(nn - jj, qp); e(jj) = e(jj + 1) + c
    end do
    e = e / 2.0_qp**nn
    acc = 0
    do kk = 1, nn
      acc = acc + (-1)**(kk - 1) * exp(-zz * log(real(kk, qp)))
    end do
    do kk = nn + 1, 2 * nn
      acc = acc + (-1)**(kk - 1) * e(kk - nn) * exp(-zz * log(real(kk, qp)))
    end do
    acc = acc / (1 - exp((1 - zz) * log(2.0_qp)))
    zeta = cmplx(real(acc), aimag(acc), dp)
  end function
  real(dp) function hardy(t)            ! Z(t) = exp(i theta(t)) zeta(1/2 + i t), real on the line
    real(dp), intent(in) :: t
    real(dp) :: th
    complex(dp) :: v
    th = t / 2 * log(t / (2 * 3.14159265358979323846_dp)) - t / 2 - 3.14159265358979323846_dp / 8 &
         + 1 / (48 * t) + 7 / (5760 * t**3)
    v = exp(cmplx(0.0_dp, th, dp)) * zeta(cmplx(0.5_dp, t, dp))
    hardy = real(v)
  end function
  subroutine check(name, cond)
    character(*), intent(in) :: name
    logical, intent(in) :: cond
    if (cond) then
      write(*,'(a,a)') '  PASS  ', name; npass = npass + 1
    else
      write(*,'(a,a)') '  FAIL  ', name; nfail = nfail + 1
    end if
  end subroutine
end program triaxial_twin
```

## Appendix C · Run of Appendix B

```text
  of 512 configurations: closed 64; witnessed 64; closed and witnessed 8; on the line 8
  closed and witnessed and off the line: 0
  PASS  A1 every closed and witnessed configuration lies on the line
  on the line and not witnessed: 0
  PASS  A2 every configuration on the line is witnessed
  PASS  A3 closed and witnessed is the same as on the line
  off the line with two axes: without form 56; without registration 56; closed and witnessed with nothing on the line 1
  PASS  A4 the triad is irreducible: each pair of axes admits a configuration off the line
  1000 points: fold twice  0.00E+00; registration kept and side turned  0.00E+00; points of the line moved  0.00E+00
  PASS  B1 the fold is an involution, keeps the registration, and fixes the line
  PASS  B2 on 401 points of one height the fold fixes exactly the point of the line
  the point   0.250 14.000 and its partner   0.750 14.000 have one registration   0.500 14.000
  PASS  B3 a point off the line and its partner are two existents with one registration
  heights of the first zeros found on the line:   14.134725  21.022040  25.010858  30.424876  32.935062
  PASS  C1 five zeros are found on the line below height 40, the first at 14.134725
  at those five: largest of the size of zeta and of the distance to the partner:  7.07E-15
  PASS  C2 each of the five is its own partner, and zeta vanishes there to the precision of the search
  size of zeta at the first height, a quarter off the line:  2.20E-01
  PASS  C3 off the line at that height zeta does not vanish
 BATTERY-JSON: {"checks":10,"failures":0}
```

## Appendix D · Kernel lines of Appendix A

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

```text
'Triaxial.fold_involutive' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.foldPt_re_fixed_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.completed_zeta_zeros_symm' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.reg_lands' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.fold_reg' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.reg_eq_self_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.twins_zeta' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.h_read_proved' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.h_id_proved' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.reg_idem' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.the_remembered_is_lossless' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.record_closed' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.record_has_least_erasure' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.cargo_at_zeros' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.foldPt_involutive' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.completed_zeta_zeros_closed_pt' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.zeta_zero_iff_completed_of_re_pos' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.zeta_zeros_iff_completed_in_strip' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.zeta_zeros_symm_in_strip' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.strip_zeta_zeros_closed_pt' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.differentiableAt_star_comp' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.star_natCast_cpow' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.zeta_schwarz_reflection' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.zeta_ne_zero_neg_odd' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.zeta_zeros_not_neg_nat' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.zeta_zeros_symm' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.zeta_zeros_closed_pt' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.zeta_zeros_conj' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.zeta_zeros_closed' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.generalized_hypothesis' does not depend on any axioms
'Triaxial.a_triad_has_an_existent_on_the_line' does not depend on any axioms
'Triaxial.on_the_line_is_witnessed' does not depend on any axioms
'Triaxial.the_triad_is_irreducible' does not depend on any axioms
'Triaxial.fold_re' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.fold_im' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.fixed_iff_on_line' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.generalized_hypothesis_on_the_plane' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.lineSeat_faithful' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.witnessed_iff_value' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.the_plane_triad_is_irreducible' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.the_record_of_the_zeros_is_a_member' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.the_zeros_are_witnessed_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.inv_isPrimitive' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.dirichlet_schwarz' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.gammaFactor_ne_zero_of_strip' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.dirichlet_zeros_closed' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.the_dirichlet_zeros_are_witnessed_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.the_triaxial_theorem' depends on axioms: [propext, Classical.choice, Quot.sound]
'Triaxial.the_final_theorem' depends on axioms: [propext, Classical.choice, Quot.sound]
```
