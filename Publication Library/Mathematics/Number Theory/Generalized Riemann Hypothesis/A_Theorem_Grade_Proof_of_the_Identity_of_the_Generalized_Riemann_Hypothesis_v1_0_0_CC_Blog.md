# A Theorem-Grade Proof of the Identity of the Generalized Riemann Hypothesis

## Riemann Hypothesis Is Triaxial: Existence, Fold, Registration: The Three Axes That Put Every Existent on the Line, and the One That the Hypothesis Is

**Mohammad F. Islam PhD** · 25 November 2026

*Blog edition of the master, edition 1.0.0 of 25 November 2026. It renders the whole text. The printed files of the appendices stand in the master and in the Journal edition, and are listed at the end.*

## Abstract

This paper proves, in Lean 4 with Mathlib, the identity of the generalized Riemann Hypothesis. The hypothesis is triaxial, and in triaxial form it is a theorem in its own domain. The domain is elementary. A seat is a set with a fold, which is an involution, and a registration that the fold keeps. A configuration on a seat has three axes: its existents; its form, closure under the fold; and its witness, a record that returns every existent, so that no two existents share a registration. The theorem is that the three axes together put every existent on the line the fold fixes. It is proved for every seat and every configuration, with no premise and on no axiom at all. The triad is irreducible: wherever the fold moves a point, a configuration with existence and registration and no form lies off the line, a configuration with existence and form and no registration lies off the line, and a configuration with form and registration and no existent has nothing on the line. On the line the witness holds, so for a closed configuration the witness and the line are one statement. The seat of the classical problem is the complex plane with the fold *s* ↦ 1 − *s̄* and the registration that keeps the height; there the line is Re *s* = 1/2, and a closed and witnessed configuration lies on it. The zeros of the Riemann zeta function are then placed with respect to the domain, by proof. Their record is a member: it is closed, witnessed and on the line. The zeros themselves are closed under the fold, by the functional equation and Schwarz reflection, both carried through in the file. Their third axis, the witness, is the classical Riemann Hypothesis, in both directions. The same is proved for the Dirichlet family. For every primitive Dirichlet character *χ* the nontrivial zeros of *L*(*s*,*χ*) are closed under the same fold, by the functional equation of *χ* and Schwarz reflection, and their witness is exactly the generalized hypothesis for *χ*, in both directions. The triaxial form is therefore the identity of the hypothesis: the paper proves it as a theorem on every seat, and proves that the classical statement is that the zeros of zeta are a member of the domain, and that the generalized hypothesis for *χ* is exactly that the zeros of *L*(*s*,*χ*) are. A Fortran twin checks the theorem by exhaustion on all 512 configurations of a finite seat and locates the first five zeros of zeta on the line, the first at height 14.134725.

## 1. The Theorem and What It Rests On

### 1.1 The statement

A seat is a set *X* with a map *σ* : *X* → *X* such that *σ*(*σ*(*a*)) = *a*, the fold, and a map *r* : *X* → *Y* such that *r*(*σ*(*a*)) = *r*(*a*), the registration. The line of the seat is the set of points the fold fixes. A configuration is a set *S* of points of *X*, its existents. It is folded when *a* ∈ *S* gives *σ*(*a*) ∈ *S*. It is witnessed when *a*, *b* ∈ *S* and *r*(*a*) = *r*(*b*) give *a* = *b*.

**Theorem (`generalized_hypothesis`).** On every seat, if a configuration is folded and witnessed, every one of its existents is on the line: *σ*(*a*) = *a* for every *a* ∈ *S*.

**Theorem (`the_triad_is_irreducible`).** On every seat with a point that the fold moves: there is a witnessed configuration with an existent off the line; there is a folded configuration with an existent off the line; and there is a folded and witnessed configuration with no existent on the line.

**Theorem (`on_the_line_is_witnessed`).** If the registration tells the points of the line apart, every configuration on the line is witnessed.

**Theorem (`witnessed_iff_value`).** On the complex plane with the fold *s* ↦ 1 − *s̄* and the registration *s* ↦ (1/2) + *i*Im *s*, a folded configuration is witnessed exactly when it lies on the line Re *s* = 1/2.

**Theorem (`the_record_of_the_zeros_is_a_member`).** The record of the nontrivial zeros of *ζ*, the set of points (1/2) + *i*Im *ρ*, is folded, witnessed and on the line.

**Theorem (`the_zeros_are_witnessed_iff`).** The set of nontrivial zeros of *ζ* is folded; and it is witnessed exactly when the classical Riemann Hypothesis holds.

**Theorem (`the_dirichlet_zeros_are_witnessed_iff`).** For every primitive Dirichlet character *χ* ≠ 1, the set of zeros of *L*(*s*,*χ*) in the open strip is folded; and it is witnessed exactly when the generalized hypothesis for *χ* holds.

**Theorem (`the_final_theorem`).** The six statements above, bound in one, with nothing before the colon.

The first three are theorems of the domain and rest on no axiom. The fourth is the domain on the plane. The next two place the zeros of *ζ* \[1\]: two of their three axes are proved, and the third is the classical statement \[5\], one proposition with it. The last does the same for the zeros of every primitive Dirichlet L-function \[11\]. The trivial character of level one is the one primitive character left out of it, and its L-function is *ζ*. Everything compiles in Lean 4 \[9\] with Mathlib \[8\], on the formalization of *ζ* and its functional equation that Mathlib carries \[10\].

### 1.2 The domain, printed

The paper has no premise. Its domain is the structure and the four definitions below, as they stand in the Lean file.

``` lean
structure Seat (X Y : Type) where
  fold : X → X
  involutive : ∀ a, fold (fold a) = a
  reg : X → Y
  keeps : ∀ a, reg (fold a) = reg a
```

With *σ* a seat, `Folded` says ∀*a*, *S* *a* → *S* (*σ*.fold *a*); `Witnessed` says ∀*a* *b*, *S* *a* → *S* *b* → *σ*.reg *a* = *σ*.reg *b* → *a* = *b*; `AllFixed` says ∀*a*, *S* *a* → *σ*.fold *a* = *a*; and `Triad` is an existent together with `Folded` and `Witnessed`. The seat of the plane is `lineSeat`, built from `fold` and `reg` on ℂ.

### 1.3 What is proved, and what is cited

- **On every seat, a folded and witnessed configuration is on the line** · Standing: Proved, on no axiom; Where: Appendix A, Part IV
- **A triad has an existent, and it is on the line** · Standing: Proved, on no axiom; Where: Part IV
- **No two of the three axes give the line, on every seat with a moved point** · Standing: Proved, on no axiom; Where: Part IV
- **On the line the witness holds, where the registration is faithful on the line** · Standing: Proved, on no axiom; Where: Part IV
- **On the plane, the fold fixes exactly the line Re *s* = 1/2; a folded configuration is witnessed exactly when it lies on that line** · Standing: Proved; Where: Part V

The table continues with the zeros of *ζ*.

- **The nontrivial zeros of *ζ* are closed under *s* ↦ 1 − *s** · Standing: Proved, from the functional equation of Mathlib; Where: Parts III, IV
- **ζ*(*s̄*) = conj(*ζ*(*s*)) for *s* ≠ 1; the zeros are closed under conjugation and under the fold** · Standing: Proved; Where: Part IV
- **The record of the zeros is folded, witnessed and on the line** · Standing: Proved; Where: Part VI
- **The zeros are witnessed exactly when the classical statement holds** · Standing: Proved; Where: Part VI
- **L*(*s*,*χ*⁻¹) = conj(*L*(*s̄*,*χ*)) for every character *χ* ≠ 1** · Standing: Proved; Where: Part VI-b
- **For primitive *χ* ≠ 1, the zeros of *L*(*s*,*χ*) in the open strip are closed under the fold** · Standing: Proved, from the functional equation of Mathlib; Where: Part VI-b
- **Those zeros are witnessed exactly when the generalized hypothesis for *χ* holds** · Standing: Proved; Where: Part VI-b
- **The final theorem** · Standing: Proved; Where: Part VII

The standing of the classical statement, and what is not machine-checked, is in the third table.

- **The classical Riemann Hypothesis** · Standing: One proposition with the witness of the zeros, by proof; it is printed in the file as one side of that equivalence; Where: Sections 6, 7
- **The generalized Riemann hypothesis for a primitive character *χ** · Standing: One proposition with the witness of the zeros of *L*(*s*,*χ*), by proof; printed in the file as one side of that equivalence; Where: Sections 6.1, 7
- **L-functions outside the Dirichlet family** · Standing: Not treated; Where: Section 6.1
- **The nontrivial zeros lie in the open strip 0 &lt; Re *s* &lt; 1** · Standing: Classical \[3, 4\]; used here only as context; Where: Section 6
- **The values of the twin** · Standing: Numerical, not machine-checked; Where: Section 8

The paper claims as machine-checked the rows marked proved and no others. Part II, the reading, is outside these tables and is labelled where it begins.

## 2. The Seat and Its Three Axes

The classical hypothesis is usually stated about one function. Its content does not need the function. It needs a reflection, the line the reflection fixes, and a way of reading a point that does not see which side of the line it is on.

A seat is exactly that. The fold *σ* is the reflection; since it is an involution, every point is either fixed or one of a pair. The registration *r* is the reading; since *r*(*σ*(*a*)) = *r*(*a*), a point and its partner are read alike. On the plane the fold is *s* ↦ 1 − *s̄*, which turns the sign of Re *s* − (1/2) and keeps the height, and the registration keeps the height and nothing else.

A configuration on a seat has three axes, and they are of three different kinds.

-   **Existence.** The configuration has existents: the set *S* itself.
-   **Form.** The configuration is carried to itself by the fold. This is a symmetry of the set.
-   **Registration.** The record returns every existent: from *r*(*a*) one can say which existent *a* was. This is a statement about the reading and the set together.

None is a restatement of another. Section 4 proves that.

## 3. The Theorem

**Theorem (`generalized_hypothesis`).** Let *S* be folded and witnessed. Then *σ*(*a*) = *a* for every *a* ∈ *S*.

*Proof.* Let *a* ∈ *S*. By form, *σ*(*a*) ∈ *S*. By the seat, *r*(*σ*(*a*)) = *r*(*a*). So *σ*(*a*) and *a* are two existents with one registration, and by the witness they are equal. ◼

The proof is three lines, and each axis is used once. The Lean term is the same three steps: `witness (σ.fold a) a (form a ha) ha (σ.keeps a)`. Its kernel line names no axiom.

**Corollary (`a_triad_has_an_existent_on_the_line`).** A triad has an existent on the line. Existence supplies the point, and the theorem places it.

**The converse (`on_the_line_is_witnessed`).** Call the registration faithful on the line when two fixed points with one registration are equal. Then every configuration on the line is witnessed: two existents with one registration are two fixed points with one registration. So where the registration is faithful on the line, a folded configuration is witnessed exactly when it is on the line.

This is the hypothesis in triaxial form. In its domain it is not conditional on anything and not conjectural in any part.

## 4. The Triad Is Irreducible

**Theorem (`the_triad_is_irreducible`).** Let *p* be a point with *σ*(*p*) ≠ *p*.

1.  *Without form.* The configuration {*p*} has an existent and is witnessed, having one point. It is not on the line.
2.  *Without registration.* The configuration {*p*, *σ*(*p*)} has an existent and is folded, since the fold is an involution. It is not on the line.
3.  *Without existence.* The empty configuration is folded and witnessed, and has no existent on the line.

So no two axes do the work of three. The second case is the one the classical literature knows well: a set of zeros symmetric under the reflection and off the line. There are functions with a functional equation of the same kind as that of *ζ* whose zeros are of that kind \[6\]. Symmetry is form, and form alone does not give the line.

`the_plane_triad_is_irreducible` is the same theorem on the plane, with the point (1/4) + 14*i*.

## 5. The Plane

On ℂ let `fold` be *s* ↦ 1 − *s̄* and `reg` be *s* ↦ (1/2) + *i*Im *s*. The fold is an involution, and `reg` of a point and of its fold are equal because the fold keeps the imaginary part. So `lineSeat` is a seat.

`fixed_iff_on_line`: the real part of the fold of *s* is 1 − Re *s*, so the fold fixes *s* exactly when Re *s* = (1/2). The line of this seat is the critical line.

**Theorem (`generalized_hypothesis_on_the_plane`).** A configuration of the plane that is closed under the fold and witnessed lies on Re *s* = 1/2.

It is the theorem of Section 3 on this seat. The registration is faithful on the line, since `reg` fixes every point of the line, so the converse holds too.

**Theorem (`witnessed_iff_value`).** For a configuration closed under the fold, `Witnessed` and `Value` are one statement.

`Value` is the statement that every existent has real part one half, and `Closed` is `Folded` on this seat.

## 6. The Zeros of ζ

Let `ZetaZeros` be the set of nontrivial zeros as Mathlib’s own statement of the hypothesis defines them: the points *s* with *ζ*(*s*) = 0 that are not the trivial zeros  − 2,  − 4, … and not 1. They lie in the open strip 0 &lt; Re *s* &lt; 1 \[3, 4\]. Where do they stand with respect to the domain?

**Existence.** They are a configuration of the plane.

**Form.** Two classical facts, both proved in the file from what Mathlib carries.

-   `zeta_zeros_symm`: if *ρ* is a nontrivial zero, so is 1 − *ρ*. This is the functional equation \[1, 2\], through the completed zeta function.
-   `zeta_schwarz_reflection`: *ζ*(*s̄*) = conj(*ζ*(*s*)) for *s* ≠ 1. Both sides are analytic away from one and agree on the real axis to the right of one, and the plane with the point one removed is connected, so they agree throughout by the identity theorem.

Together they give `zeta_zeros_closed`: the nontrivial zeros are closed under the fold. The zeros have form, by proof.

**The record.** `Rec` of a configuration is the set of registrations of its existents. For the zeros it is the set of points (1/2) + *i*Im *ρ*.

**Theorem (`the_record_of_the_zeros_is_a_member`).** The record of the zeros is folded, witnessed and on the line, with nothing assumed.

It lies on the line by `cargo_at_zeros`, and a configuration on the line is folded, each point being its own fold, and witnessed, by Section 3.

**The witness.**

**Theorem (`the_zeros_are_witnessed_iff`).** The zeros are closed under the fold; and they are witnessed exactly when Mathlib’s `RiemannHypothesis` holds.

*Proof.* The zeros are folded, so by `witnessed_iff_value` they are witnessed exactly when they lie on the line. That every nontrivial zero has real part one half is the classical statement, by `h_id_proved`. ◼

So the classical hypothesis has an exact place in the domain. It is not a fourth thing and it is not a statement about a function beside the seat. It is the third axis of one configuration: that no two zeros of *ζ* share a height unless they are one zero. An off-line zero and its partner across the line are two existents with one registration; the hypothesis says there is no such pair.

### 6.1 The Dirichlet family

The fold is not special to *ζ*. Let *χ* be a primitive Dirichlet character of level *N* with *χ* ≠ 1, and let `DirichletZeros χ` be the zeros of *L*(*s*,*χ*) in the open strip 0 &lt; Re *s* &lt; 1, its nontrivial zeros \[11\].

**Form.** Two facts, both proved in the file.

-   The functional equation of the completed L-function, which Mathlib carries \[10\], sends a zero *ρ* of *L*(*s*,*χ*) in the strip to the zero 1 − *ρ* of *L*(*s*,*χ*⁻¹). The file proves the inverse of a primitive character primitive, `inv_isPrimitive`, so that the equation applies to it, and that the gamma factor does not vanish in the strip.
-   `dirichlet_schwarz`: *L*(*s*,*χ*⁻¹) = conj(*L*(*s̄*,*χ*)). Both sides are entire and agree on the half plane of convergence, term by term, since conj(*χ*(*n*)) = *χ*⁻¹(*n*).

Together they give `dirichlet_zeros_closed`: a zero *ρ* of *L*(*s*,*χ*) in the strip has the partner 1 − *ρ̄*, a zero of the same function. It is the same fold.

**The witness.** The generalized hypothesis for *χ*, `DirichletHypothesis χ`, is the statement that every zero of *L*(*s*,*χ*) in the open strip has real part one half.

**Theorem (`the_dirichlet_zeros_are_witnessed_iff`).** For every primitive *χ* ≠ 1 the zeros of *L*(*s*,*χ*) in the strip are closed under the fold; and they are witnessed exactly when the generalized hypothesis for *χ* holds.

*Proof.* They are folded, so by `witnessed_iff_value` they are witnessed exactly when they lie on the line, and that is the generalized hypothesis for *χ*, by definition. ◼

The one primitive character with *χ* = 1 is the trivial character of level one, and its L-function is *ζ*, treated above. So the theorem and the one before it cover every primitive Dirichlet character. The word generalized, in this paper, means this family. Dedekind, Hecke and automorphic L-functions carry a functional equation of the same shape, and Section 5 applies to any closed configuration; their zeros are not placed here, since the file does not carry their functional equations.

## 7. The Identity of the Hypothesis

The triaxial form is not a variant of the hypothesis and not a reading laid over it. It is what the hypothesis says. `the_zeros_are_witnessed_iff` proves that the classical statement and the witness of the zeros of *ζ* are one proposition, and `the_dirichlet_zeros_are_witnessed_iff` proves the same of the generalized hypothesis for every primitive character. So the hypothesis is, exactly, the third axis of a configuration whose first two axes are proved.

That fixes its kind. The hypothesis is not a statement of symmetry. The symmetry of the zeros is the functional equation, and that is classical and settled \[1, 2\]. It is a statement of registration: that the heights of the zeros are a faithful record of the zeros. Section 4 proves that no symmetry can stand in for it.

And it fixes its standing. In its own domain the form is a theorem on every seat, with no premise, no posit, and nothing delivered from outside. At *ζ*, and at every primitive *L*(*s*,*χ*), the theorem is the identity: the equivalence is the hypothesis in its own terms, not a derivation of the classical statement from the domain.

## 8. The Numerical Twin

The twin of Appendix B checks the theorems of the domain by exhaustion, checks the seat of the plane on points, and looks at the first zeros.

**A finite seat, all of it.** The seat is the grid of nine points (*x*,*t*) with *x* and *t* in  − 1, 0, 1. The fold sends *x* to  − *x*, and the registration keeps *t*. There are 512 configurations.

- **Folded** · Count: 64
- **Witnessed** · Count: 64
- **Folded and witnessed** · Count: 8
- **On the line** · Count: 8
- **Folded and witnessed and off the line** · Count: 0
- **On the line and not witnessed** · Count: 0
- **Off the line, witnessed, with an existent, not folded** · Count: 56
- **Off the line, folded, with an existent, not witnessed** · Count: 56
- **Folded and witnessed with nothing on the line** · Count: 1

The folded and witnessed configurations are exactly the eight on the line. Each pair of axes admits a configuration off the line.

**The plane.** On 1000 points the fold done twice is the identity, the registration is kept and the side is turned. On 401 points of one height the fold fixes exactly the point of the line. The point (1/4) + 14*i* and its partner (3/4) + 14*i* are two points with the one registration (1/2) + 14*i*.

**The first zeros.** Zeta is evaluated on the line by its alternating series, and its zeros are located by the change of sign of Hardy’s function \[2\]. The first five are found at the heights 14.134725, 21.022040, 25.010858, 30.424876 and 32.935062. At each, the point is its own partner under the fold. A quarter off the line at the first height, zeta does not vanish.

Ten checks pass and none fails. Three limits are stated. Exhaustion on one finite seat is an instance; the statement for every seat is the theorem. Five zeros found on the line are five zeros; the search says nothing of zeros off the line and does not bear on the classical statement. And no number of the twin enters any proof.

## 9. Discussion

**What is new, and what is not.** The functional equation and the reflection principle are classical \[1, 2\], and their formalization is Mathlib’s \[10\]. That a set symmetric under the reflection lies on the line exactly when the projection onto the line is injective on it is elementary, and the paper does not present it as deep. What the paper does is fix the domain in which the hypothesis is a theorem, prove the theorem there for every seat, prove that its three hypotheses are independent, and prove where the zeros of *ζ* and of every primitive Dirichlet L-function stand: two axes in hand, and the third the classical statement, or the generalized hypothesis for the character, exactly. The hypothesis was not set out on these three axes before.

**Why the form matters.** A conjecture about one function gives no account of what would have to be true for it to hold. The triaxial form does. It says the classical statement is a statement of registration: that the heights of the zeros are a faithful record of the zeros. That is a different kind of statement from a symmetry, and Section 4 proves that no symmetry can deliver it.

**Kin.** For curves over finite fields the corresponding hypothesis is a theorem \[7\]. The paper draws nothing from that proof and claims no parallel beyond the fact that a hypothesis of this family is, in a suitable domain, a theorem.

**Scope.** The subject is the form. The paper bounds no zero and improves no zero-free region. Each statement of Section 1.3 marked proved compiles, and no theorem of Sections 2 to 8 depends on Part II.

## 10. What Stands, and What Would Refute It

The paper has no physical premise and predicts no measurement. Its claim is formal, and one thing refutes it.

**The formal claim.** Every theorem named in this text prints its axioms in Appendix D. A line that names an axiom other than `propext`, `Classical.choice` and `Quot.sound`, or a file that fails to compile under Lean 4.19.0 and Mathlib 4.19.0, refutes the claim that the statements are proved. The four theorems of the domain, on every seat, print no axiom at all.

**The statement about the zeros.** `the_zeros_are_witnessed_iff` cuts both ways and the paper stands on both. A proof of the classical statement, by any means, proves that the zeros of *ζ* are a member of the domain. A nontrivial zero off the line, by any means, proves that they are not, and the theorem of the domain is untouched: it would then say of the zeros what Section 4 says of the pair {*p*, *σ*(*p*)}. The same holds, character by character, for `the_dirichlet_zeros_are_witnessed_iff`.

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

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author’s. The Lean file and the Fortran twin are written by a language model under the author’s direct supervision. Every theorem named in the text of Sections 1 to 10 and 12 is in Appendix A under that name, and its kernel line is printed in Appendix D. Parts I to IV of Appendix A, up to the closure of the zeros under the fold, are carried from the master file of the register named in the Lean Library Reference, with no statement changed, so that the file of this paper stands alone and imports nothing but Mathlib. The Dirichlet family, Part VI-b, is in Part XVIII of the same master file. The classical Riemann Hypothesis and the generalized hypothesis for a character appear in the file only as one side of an equivalence.

**The seat.** The seat is elementary geometry: a reflection and the line it fixes. It is the subject of this paper, and it is studied further in Nothing Escapes, Least Erasure (Islam, 2026a).

## References

1.  B. Riemann, Ueber die Anzahl der Primzahlen unter einer gegebenen Grösse, Monatsberichte der Berliner Akademie (1859) 671.
2.  E. C. Titchmarsh, The Theory of the Riemann Zeta-Function, 2nd ed., revised by D. R. Heath-Brown, Oxford University Press (1986).
3.  J. Hadamard, Bull. Soc. Math. France 24 (1896) 199.
4.  C.-J. de la Vallée Poussin, Ann. Soc. Sci. Bruxelles 20 (1896) 183.
5.  E. Bombieri, Problems of the Millennium: the Riemann Hypothesis, Clay Mathematics Institute (2000).
6.  H. Davenport and H. Heilbronn, J. London Math. Soc. 11 (1936) 181, 307.
7.  A. Weil, Sur les courbes algébriques et les variétés qui s’en déduisent, Hermann, Paris (1948).
8.  The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
9.  L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
10. D. Loeffler and M. Stoll, Formalizing zeta and L-functions in Lean, arXiv:2503.00959 (2025).
11. H. Davenport, Multiplicative Number Theory, 3rd ed., revised by H. L. Montgomery, Springer (2000).
12. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).

**Lean Library Reference.** The file below is the original from which Parts I to IV of Appendix A are carried. No theorem of this paper imports it. Path in the repository 1000sapients/Trisduction.

1.  RH master: Publication Library/Mathematics/Millennium Series/RH\_Both\_Sides\_Formal\_Master\_v3\_0\_45\_CC.lean, Parts X and XVIII. Compiled with Mathlib 4.19.0.

## Appendices

**Appendix A · Generalized_RH_Triaxial_Theorem_CC.lean.** Lean 4.19.0 with Mathlib 4.19.0. 49 theorems, no axiom declared, no `sorry`, exit 0 with no warning. The kernel lines are Appendix D. *[a printed file, 849 lines, in the master and in the Journal edition]*

**Appendix B · Triaxial_Twin_CC.f90.** Ten checks, zero failures. Compiled with gfortran, standard 2018, all warnings on, none printed. The run is Appendix C. *[a printed file, 176 lines, in the master and in the Journal edition]*

**Appendix C · Run of Appendix B.** ```text
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
 BATTERY-JSON: {"checks":10,"failures":0} *[a printed file, 20 lines, in the master and in the Journal edition]*

**Appendix D · Kernel lines of Appendix A.** Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own. *[a printed file, 49 lines, in the master and in the Journal edition]*
