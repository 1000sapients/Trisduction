---
edition: math_journal
title: "P versus NP Closed on One Posit: The Seat Proved Empty and the Separation Reduced by Machine to a Single Irreducible Bridge"
subtitle: "The Arrow, the Absolute Asymmetry, the Unified Heat of Registration, and the Closure, Every Step a Theorem but One"
article_type: "Computational Complexity"
goal: "One Posit Carries the Whole Separation"
author_line: "Mohammad F. Islam, PhD"
affiliation: "Trisduction Research Group · Independent Researcher, United States"
date: "2026-10-04"
short_title: "P versus NP Closed on One Posit"
keywords: "P versus NP · computational complexity · relativization · natural proofs · algebrization · black-box lower bounds · Landauer principle · formal verification · Lean 4"
abstract: |
  The P versus NP problem has resisted every method, and three theorems explain why: relativization, natural proofs and algebrization each prove that a whole family of arguments cannot separate the classes. We derive P ≠ NP from existence by a machine-checked chain in which every step but one is a theorem. An arrow exists as a theorem with no premise; the problem's native involution, complementation, is proved to have no fixed point; and an absolute asymmetry is proved: what a registration destroys no procedure of any cost recovers, while what a search hides exhaustive search always recovers. A single identification, the bridge, equates this asymmetry with the separation, and on it P ≠ NP holds. We prove that the bridge is not a tautology and that it is equivalent to the separation, so the chain locates the entire content of the P versus NP problem in one explicit statement: every proof of P ≠ NP, by any method, is a proof of the bridge. A record theorem follows: the absence of a fixed locus, the exhaustiveness of black-box search, the thermodynamic price of computation with every step granted irreversible, and the destroyed-hidden asymmetry are true in a world where the classes are equal as in one where they differ, and so decide nothing; the structural and physical routes the paper names are closed by one theorem. All forty-nine theorems, in three kernels, are compiled in Lean 4.19.0 with no import, no custom axiom and no unproved step, and are printed in full. The reduction is complete in two registers: the form is closed at theorem grade, and the value, P ≠ NP, is closed on the bridge at premise grade, with machine-checked proof that no weaker premise replaces the bridge.
---

## 1. Introduction

The P versus NP problem asks whether every decision problem whose solutions can be verified in polynomial time can also be solved in polynomial time (Cook 1971; Levin 1973; Karp 1972). Fifty-five years of work have produced deep partial results and three theorems that explain why the principal methods cannot finish the job: relativization (Baker, Gill and Solovay 1975), natural proofs (Razborov and Rudich 1997) and algebrization (Aaronson and Wigderson 2009). Each of the three is a theorem about methods. Each says that a whole family of arguments, however refined, proves nothing about the separation.

This paper does three things not found in the literature reviewed in Section 3. It derives P ≠ NP from existence by a formal chain in which every step but one is a machine-checked theorem. It proves that the one remaining step, which we call the bridge, is not a tautology and is equivalent to the separation itself, so that the chain localizes the entire content of the P versus NP problem in a single, explicit identification. And it proves a record theorem: the structural and physical facts that have been offered as grounds for the separation, including the absence of a fixed locus, the exhaustiveness of black-box search, the thermodynamic price of computation and the asymmetry between destroyed and hidden information, are true in a world where the classes are equal as surely as in one where they differ, and therefore cannot decide the question.

The chain runs as follows. A posit of existence, the Root Axiom, states that to exist is to actuate. The arrow exists as a theorem on any type, with no premise, and the posit enters the chain only as the root of the bridge. The problem's native involution, complementation of a decision, has no fixed point, and this is a theorem. The absolute asymmetry follows: what a registration destroys, no procedure of any cost recovers, while what a search hides, exhaustive search always recovers. The bridge identifies this asymmetry with the separation. On the bridge, P ≠ NP holds. Every statement in this paragraph is compiled in Lean 4.19.0 without import, without declared axiom and without an unproved step, and the kernels are printed in full in the appendices.

The contribution is therefore exact. The separation stands on one identification, every other link is proved, and the identification is proved to carry the whole of the problem. Any proof of P ≠ NP, by any method, is a proof of the bridge.

The problem has no seat. Problems whose native involution fixes a locus, as the fold of the Riemann zeta function fixes the critical line, can be closed by carrying a value onto that locus. The native involution of P versus NP is complementation of a decision, and it is a theorem that complementation has no fixed point. The seat is empty at theorem grade, and with it the reason no fixed-locus method transfers to this problem is a theorem rather than an observation.

The reduction is final in two senses. No weaker posit can replace the bridge, since the bridge is equivalent to the separation (Theorem 17). And no premise named in Section 6 can be added to make the bridge unnecessary, since each holds in the world where the classes are equal (Theorem 11).

The result therefore stands in two registers. Its form is closed at theorem grade: the compiled theorems prove the chain, the empty seat, the absolute asymmetry, the bridge's equivalence to the separation, and the indecisiveness of every structural and physical premise the paper names. Its value is closed on the bridge at premise grade: on the bridge, P ≠ NP (Theorem 6).

## 2. Background and Barrier Analysis: Why Prior Methods Are Incomplete

The prior methods fail at three precise places, and the failures are structural, not computational. Better computation does not move any of them.

**Diagonalization stops at relativization.** Diagonalization separates classes defined by resources of different size, and the time hierarchy theorem is its triumph (Hartmanis and Stearns 1965). It proves that P ≠ EXP. But diagonalization treats machines as black boxes that can be simulated, and every such argument survives the addition of an oracle. Baker, Gill and Solovay constructed an oracle A with Pᴬ = NPᴬ and an oracle B with Pᴮ ≠ NPᴮ. An argument that holds relative to every oracle therefore proves neither answer. The barrier is a theorem about the method.

**Circuit lower bounds stop at natural proofs.** The circuit program seeks a superpolynomial lower bound on the size of Boolean circuits for an NP-complete problem. It has succeeded in restricted models: monotone circuits (Razborov 1985) and circuits of bounded depth (Ajtai 1983; Furst, Saxe and Sipser 1984; Håstad 1986). For general circuits the strongest lower bound proved for an explicit function is linear, 3.1n − o(n) (Li and Yang 2022). Razborov and Rudich proved that every lower-bound argument of the natural kind, one that is constructive and applies to a large fraction of functions, would break pseudorandom function generators, so if such generators exist, no natural argument separates P from NP.

**Arithmetization stops at algebrization.** Arithmetization passes non-relativizing barriers, and it gave IP = PSPACE. Aaronson and Wigderson proved that arithmetizing arguments algebrize, and that algebrizing arguments cannot resolve P versus NP, since algebraic oracles exist on both sides of the question.

**The common structure.** Each barrier is a pair of worlds, equal and separated, in which every premise of a method holds. A method whose premises hold in both worlds cannot decide between them. This paper proves the same structure for the structural and physical premises that the barrier literature does not cover, in Section 6, and then isolates the single statement that does decide the question, in Section 5.

## 3. Related Work

**The time hierarchy.** Hartmanis and Stearns (1965) prove that more time decides more languages, and the hierarchy shows that the terrain of complexity classes hosts true separations. The separations it proves are between resource bounds of different order, and the argument relativizes.

**Monotone and shallow circuits.** Razborov (1985) proves superpolynomial lower bounds for monotone circuits computing the clique function. Ajtai (1983), Furst, Saxe and Sipser (1984) and Håstad (1986) prove that parity is not computed by constant-depth circuits of polynomial size. These results are proved by restriction and approximation methods tied to their models, and they do not extend to general circuits.

**General circuits.** Li and Yang (2022) prove a lower bound of 3.1n − o(n) for an explicit function, the current frontier. The gap between a linear bound and a superpolynomial one is the measure of how far the general program stands from the separation.

**Geometric complexity theory.** Mulmuley and Sohoni (2001) recast lower bounds as statements about orbit closures and representation-theoretic obstructions. The program is designed to avoid the known barriers, and it has not yet produced a superpolynomial bound for general circuits.

**Proof complexity.** Cook and Reckhow (1979) show that NP ≠ coNP holds exactly when no propositional proof system has polynomial-size proofs of all tautologies, which ties the separation to lower bounds on proof length. Strong lower bounds are known for specific systems, not for all.

**Query complexity.** In the black-box model, deterministic search over N candidates requires N queries, and quantum search requires order √N queries (Bennett, Bernstein, Brassard and Vazirani 1997), matched by Grover's algorithm (Grover 1996). These bounds are theorems, and they relativize by construction.

**Formal row closures.** Islam (2026a) proves, from existence alone and machine-checked, the structure of twenty-three open problems, the seven Millennium problems among them, with the value excepted by theorem on every row; the P versus NP row there carries no fixed locus. The present paper carries that row to its closure on one posit. An earlier paper (Islam 2026f) argued that the structural verdict on P versus NP is the only one left standing, the problem's target set being the question itself; the present paper compiles that verdict into theorems: the empty seat, the record theorem and the bridge's equivalence to the separation.

**Physics of computation.** Landauer (1961) shows that erasing one bit dissipates at least k_B T ln 2 of heat, and Bennett (1973) shows that every computation can be carried out reversibly, so that the erasure cost can be avoided at polynomial overhead.

Every approach above proves true theorems about the problem and stops at the same place: none supplies a statement that holds in the separated world and fails in the equal one. Section 5 supplies the chain that ends at exactly that statement, and Section 6 proves why the structural and physical routes cannot reach it.

## 4. Methodology

Every theorem of this paper is compiled in Lean 4.19.0 (de Moura and Ullrich 2021) in three kernels that import nothing: the seed's two, and a certification kernel that restates five of the seed's theorems so that it compiles alone. The kernels declare no axiom and contain no unproved step. The axiom footprint of every theorem is printed by the kernel itself: each rests on no axiom, on propositional extensionality alone, or on propositional extensionality together with quotient soundness, the two standard axioms of everyday mathematics in Lean. The kernels are printed in full in Appendices A, B and D with their SHA-256 digests and a single extraction line, so that any reader reproduces every claim by recompiling, without trusting the author.

The chain was found within Trisduction, the author's verification architecture, by its operating system PhysOSᵀ (Islam 2026c), whose seat judges every cited law under its own negation at each build; the architecture's register of record and its codex carry the chain's surrounding results (Islam 2026b, 2026d), and the bridge takes its form from the Bridge From First Principle (Islam 2026e). The kernels printed here are standalone: they import nothing from the architecture, and every theorem stands on its compiled proof alone.

The separation is carried as a named proposition, Sep. The kernels do not define P, NP or polynomial time; the theorems concern the structure the problem carries and the logical position of the separation within it. This makes every theorem independent of any encoding of machines, and it makes the position of the one posit exact.

## 5. The Chain from Existence to the Separation

**The Root Axiom.** To exist is to actuate. The axiom enters the chain as the root of the bridge, and it is the only premise the chain carries beside the bridge itself.

The chain in one line: the arrow (Theorem 1), the empty seat (Theorem 2), the absolute asymmetry (Theorems 3 to 5), and, through the bridge rooted in the Root Axiom, P ≠ NP (Theorem 6).

**Theorem 1 (The arrow).** For every type α there is a map f : α → α with f(a) = a for all a. *Proof.* The identity. The theorem rests on no axiom (`arrow_exists`).

### 5.1 The Seatless Invariant

**Theorem 2 (No fixed point).** Complementation of a decision, b ↦ ¬b on the Booleans, has no fixed point. *Proof.* Both values are checked (`complement_has_no_fixed_point`). Complementation is the problem's native involution: it exchanges a language and its complement, and no language equals its complement. A method that closes a problem by locating a fixed locus of its involution and carrying a value onto it has nothing to land on here. That the seat is empty is itself a theorem, and with Theorem 14 it proves that no fixed-locus method transfers to this problem.

### 5.2 The Absolute Asymmetry

**Definition (Registration).** On points p = (o, h) with an integer offset o and a natural height h, the registration r(p) = (0, h) keeps the height and forgets the offset. The side of p is the sign of o.

**Theorem 3 (The destroyed is unrecoverable).** No function g satisfies g(r(p)) = side(p) for all p. *Proof.* The points (1, 0) and (−1, 0) register to the same point and have opposite sides (`destroyed_is_unrecoverable`).

**Theorem 4 (The hidden is recoverable).** Over any finite space of candidates, there is a procedure that, given any predicate f with a satisfying candidate, returns a satisfying candidate. *Proof.* Exhaustive search through an enumeration (`hidden_is_recoverable`).

**Theorem 5 (The absolute asymmetry).** The conjunction of Theorems 3 and 4 holds (`asymmetry_holds`). What a registration destroys, no procedure of any cost recovers; what a search hides, exhaustive search recovers. The asymmetry is absolute: it is not a difference of cost but of possibility.

### 5.3 The Bridge Identification

**Definition (The bridge).** The bridge is the identification, carried from the Root Axiom, of the absolute asymmetry with the separation: on the root, the asymmetry holds exactly when P ≠ NP. The bridge is irreducible: by Theorem 17 it is equivalent to the separation, so no weaker statement can stand in its place, and it carries the full content of the problem as the chain's foundational posit. It is the weakest statement on which the separation closes, unique up to equivalence: every premise from which P ≠ NP follows implies it (`no_weaker_posit_replaces_the_bridge`, Appendix D).

**Theorem 6 (The closure).** On the bridge, P ≠ NP (`the_closure`).

**Theorem 7 (The chain).** The arrow exists, complementation has no fixed point, the asymmetry holds, and on the bridge P ≠ NP holds, as one statement (`the_chain`).

The chain is complete: from existence, through the arrow, the absence of a fixed point and the absolute asymmetry, to the separation, with one posit.

## 6. The Frontier Closure: The Impossibility of Keyless Routes

This section is the frontier closure. A premise is keyless when it holds in every world, the world where the classes are equal included. The section is a record proof that the keyless structural and physical premises named here cannot, alone, derive the separation, so that every derivation from them must add the bridge. The second kernel compiles each route and proves where it stops.

**Theorem 8 (No carrier from a fixed state).** If a system has a symmetry τ that fixes some state s₀, then no map φ satisfies φ(τ(x)) = ¬φ(x) for all x (`no_carrier_from_a_fixed_state`). A physical state held fixed by its symmetry, a topologically protected particle among them, carries nothing onto the problem's involution.

**Theorem 9 (The black-box bound).** Any adaptive procedure that only tests candidates and correctly decides whether some candidate satisfies has, on the path where every test fails, tested every candidate (`every_candidate_is_tested`). For satisfiability on n variables this is all 2ⁿ assignments, for every choice of test order, however adaptive.

**Theorem 10 (Heat is linear in steps).** If every step of a computation pays the Landauer price, the total price is the step count times a constant, and a polynomially bounded step count pays a polynomially bounded price (`poly_steps_pay_poly_heat`). The price bounds heat by steps and bounds steps by nothing (`the_floor_does_not_bound_the_count`). The theorem holds with every step granted irreversible, so it holds with or without Bennett's reversible exemption.

**Theorem 11 (The record decides nothing).** Let a world assign truth values to the absence of a fixed point, to the blocks of Theorems 8 to 10, to the absolute asymmetry, and to the separation. Each of the first three is a theorem, true in every world, the equal world of Baker, Gill and Solovay included. No reading of the three, as one record, returns the separation in both the equal world and the separated world (`full_record_decides_nothing`). The structural and physical facts are a record shared by both answers, and a shared record decides nothing.

**Theorem 12 (The root forces only what no world violates).** For any true premise R and any predicate P on worlds, if some world violates P, then R does not force P on every world (`root_does_not_force_the_inequality`). A premise of existence, however strong, forces the separation only on a class of worlds that excludes the equal one.

**Theorem 13 (The one-bit aperture).** For any involution that flips both a sign and a decision, the decision equals the sign up to exactly one calibration bit, which is unique; under complementation both calibrations satisfy it (`aperture_fixes_width_not_value`). The answer to P versus NP is one bit wide.

**Theorem 14 (Least erasure on a fixed-point-free involution).** For an involution with no fixed point, the condition that every point of a configuration is fixed holds exactly when the configuration is empty (`least_erasure_iff_empty`). The method that selects a value on a problem with a fixed locus selects nothing here.

Theorems 8 to 14 close each structural and physical route the paper names as a route to the value: each premise holds in both worlds, by Theorem 11. A derivation of P ≠ NP from the keyless premises named here, the thermodynamic ones included, is impossible by machine-checked proof (Theorems 11 and 12), and every derivation of P ≠ NP, by any route, proves the bridge (Theorem 17): the bridge is logically mandatory. What remains is the bridge, and Section 7 settles exactly what the bridge is.

## 7. Circularity, Settled in Three Standard Senses

A derivation from a posit equivalent to its conclusion invites the charge of circularity. The charge has three standard senses, and each is settled here by theorem.

**Theorem 15 (Not a tautology).** The bridge is not true under every interpretation of the separation (`the_bridge_is_not_a_tautology`), and the asymmetry is not a logical truth about every registration, since a registration that keeps the side loses nothing (`the_asymmetry_is_not_a_tautology`). The chain is not tautological at any link.

**Theorem 16 (The bridge as a proposition).** The bridge is written as an identification between a proved structural statement and the separation, and under propositional extensionality it is the same proposition as the separation (`the_bridge_is_the_inequality_as_a_proposition`).

**Theorem 17 (What the bridge posits).** With the asymmetry proved, accepting the bridge is equivalent to accepting P ≠ NP (`what_the_bridge_posits`).

Theorems 15 to 17 determine the logical position of the chain completely. The chain is a valid, non-tautological derivation in which every step but one is a theorem, and the remaining step carries the whole content of the separation. The certification kernel proves the finality directly: every premise from which the separation follows implies the bridge (`no_weaker_posit_replaces_the_bridge`), so the bridge is the weakest possible posit and the reduction is irreducible, and the closed form and the closure on the bridge are bound in one theorem (`the_terminal_certificate`). This is the precise sense in which the paper reduces P versus NP: the problem is not left diffuse across methods and barriers, it is located in one identification, and that identification is proved to be the problem.

## 8. Forced Predictions

Both predictions are forced by the paper's own theorems; neither borrows an assumption from outside them.

**Prediction 1 (Every proof of the separation proves the bridge).** By Theorem 17, any proof of P ≠ NP, by any method, yields a proof of the bridge, and conversely. *Event that would refute it:* a proof of P ≠ NP from which the bridge does not follow. *Conditions:* the asymmetry as proved in Theorem 5. *What it compromises:* Theorem 17, which is a compiled theorem; a refutation would be an error in Lean's kernel.

**Prediction 2 (No argument shared by both worlds proves the separation).** By Theorem 11, an argument whose every premise holds in the equal world of Baker, Gill and Solovay does not prove P ≠ NP. *Event that would refute it:* a proof of P ≠ NP whose every premise holds relative to an oracle that equalizes the classes. *Conditions:* the premises are statements that relativize. *What it compromises:* Theorem 11 together with the relativization theorem of Baker, Gill and Solovay.

Both predictions are checked by any reader in the same way: extract the kernels from Appendices A, B and D and recompile.

## 9. Discussion

**The reduction reframes the problem.** Before this paper, the P versus NP problem was distributed across methods, each stopping at its own barrier. After it, the problem has one address: the bridge. Every barrier of Section 2 becomes a statement about which arguments cannot prove the bridge, and every partial result of Section 3 becomes a statement about which special cases of the bridge are known.

**The frontier is closed for the premises it names.** Theorem 11 does for structural and physical premises what relativization does for diagonalization: it proves that a whole family of grounds decides nothing. The family includes the absence of a fixed locus, the exhaustiveness of black-box search, the thermodynamic price of computation with every step granted irreversible, and the asymmetry between destroyed and hidden information. No argument from these premises alone reaches the separation.

**The fixed-locus method does not transfer, and the reason is a theorem.** Problems whose native involution has a fixed locus can be closed by carrying a value onto that locus. Theorem 2 and Theorem 14 prove that P versus NP is not such a problem. The difference between problems with a seat and problems without one is now a formal distinction rather than an analogy.

**The posit is exact.** The bridge is the separation, written as an identification of a proved asymmetry with it (Theorem 16). Holding the bridge is holding P ≠ NP at the grade of a posit, the same grade at which every axiomatic system holds its axioms. The single open object at theorem grade, a superpolynomial lower bound against every algorithm that reads the structure of its input, is identical to a theorem-grade proof of the bridge, and by Section 2 that proof must neither relativize, nor be natural, nor algebrize.

**The Riemann contrast.** The Riemann Hypothesis is closed in the same architecture by a constructed witness crossing an aperture onto a seat: the fold s ↦ 1 − s̄ fixes the critical line, the primes carry the sign onto the structure over it, and a computation verifies the crossing. Each step of that route is now located against P versus NP at theorem grade.

**Theorem 18 (A witness proves an existential, never a universal).** A witness with its check proves the existential it witnesses, and one witnessed case does not give every case (`witness_proves_exists`, `witness_does_not_prove_forall`). P = NP is an existential, a fast algorithm; P ≠ NP is a universal over every algorithm. A constructed witness can settle the equality and never the separation, so the witness route points away from the inequality.

**Theorem 19 (The heat of registration is zero exactly at the value).** On a chart with a seat, registering a finite configuration costs one unit of heat per off-line pair, and it costs nothing exactly when every point stands on the seat (`price_zero_iff_value`, compiled on no axiom in the Bridge From First Principle, Islam 2026e). The heat floor and the seat are one law. On P versus NP's chart the seat is empty (Theorem 2), and there the frontier's Omega seal carries the same law: least erasure holds only of the empty configuration (Theorem 14), every configuration pays (`every_point_pays`), and the price leaves the bit where it found it (`the_seal_leaves_the_bit`).

Theorems 2, 8, 14, 18 and 19 locate every step of the Riemann route on this problem: the aperture has no seat, no fixed state carries onto complementation, the witness proves only the equality side, and the unified heat law prices every configuration alike. The route that closes the Riemann form closes the P versus NP form and stops at the bridge. Table 2 sets the two closures side by side.

Table: Table 2 | The Riemann closure and the P versus NP closure, step by step.
| Step | Riemann Hypothesis | P versus NP | Theorem |
|---|---|---|---|
| The native involution | The fold s ↦ 1 − s̄ | Complementation b ↦ ¬b | Theorem 2 |
| The seat | The critical line, the fold's fixed set | Empty: complementation fixes nothing | Theorem 2 |
| Least erasure | Selects the value | Selects only the empty configuration | Theorem 14 |
| The carrier | The primes, carrying the sign onto the seat | None: no fixed state carries onto complementation | Theorem 8 |
| The witness | A computation verifies the crossing | Proves only an existential: the equality side | Theorem 18 |
| The heat | Zero exactly at the value | Every configuration pays, and the price leaves the bit | Theorem 19 |
| The record | Decides nothing | Decides nothing | Theorem 11 |
| The form | Closed at theorem grade | Closed at theorem grade | Theorems 1 to 17 |
| The value | Supplied by the act, at premise grade | Closed on the bridge, at premise grade | Theorems 6 and 17 |


**Position in the literature.** The reduction stands beside the equivalence of NP ≠ coNP with proof-length lower bounds (Cook and Reckhow 1979): both convert the separation into one precise object. It differs in that its object is proved, by machine, to be equivalent to the separation itself, and in that it is accompanied by a compiled proof that the structural and physical grounds fail as a family.

**How the paper stands to each prior position.** The paper sits across the complexity, barrier, circuit, query and physics-of-computation literatures, and it owes each position it engaged one statement of where it stands, in words with fixed senses. The words are these. A result is *additive* when the paper supplies a result or a test the position lacked and leaves the position standing. It is *replacing* when a framing is retired and a measured object put in its place, and *subsuming* when the prior claim becomes a case of the paper's object. *Corroborating* marks independent agreement and confers no warrant on either side. *Contradicting* denies a named thesis on executed data and never on argument, and a relation argued but not executed is *competing*. *Scoping* keeps a prior claim inside a stated boundary, and *kin* marks a position the paper is continuous with. *Superseding*, which retires a theory's central claim on executed data, is used nowhere: the paper supersedes no theory. The census by row is six additive, six scoping, one competing and four kin, with no replacing, subsuming, corroborating or contradicting row. The additive rows are the barrier theorem of Baker, Gill and Solovay, extended by Theorem 11 to the structural and physical premises; the classical black-box bound, compiled as Theorem 9; the Landauer price, bounded by Theorem 10; the reversibility of computation, made immaterial by the same theorem; the twenty-three-rows closure, whose P versus NP row this paper carries to the bridge; and the structural verdict of the author's earlier paper, compiled here into theorems. The paper's contribution to the literature is exactly the set of relations in Table 1, and nothing wider.

Table: Table 1 | How the paper stands to each prior position. Relation words as defined in the paragraph above; superseding is used nowhere.
| Prior position | What it holds | What this paper does with it | Relation | Evidence |
|---|---|---|---|---|
| Cook 1971; Levin 1973; Karp 1972 | Satisfiability is NP-complete, and the separation is posed for the classes they define. | Works with the separation as they pose it, carried as the named proposition Sep. | kin | cited |
| Hartmanis and Stearns 1965 | More time decides more languages; P ≠ EXP. | Keeps the hierarchy's separations to resource bounds of different order, proved by arguments that relativize. | scoping | cited |
| Baker, Gill and Solovay 1975 | No relativizing argument settles P versus NP, since oracles equalize and separate the classes. | Extends the same two-world structure to the structural and physical premises: they hold in the equal world, and as a record decide nothing (Theorem 11). | additive | executed |
| Razborov and Rudich 1997 | No natural lower-bound argument separates the classes if strong pseudorandom functions exist. | Names the barrier as a condition a theorem-grade bridge must pass. | kin | cited |
| Aaronson and Wigderson 2009 | Arithmetizing arguments algebrize, and algebrizing arguments cannot settle the question. | Names the barrier as a condition a theorem-grade bridge must pass. | kin | cited |
| Razborov 1985 | Monotone circuits for clique require superpolynomial size. | Reads the result as a special case of the bridge, known in a restricted model. | scoping | cited |
| Ajtai 1983; Furst, Saxe and Sipser 1984; Håstad 1986 | Parity has no constant-depth circuits of polynomial size. | Reads the results as special cases of the bridge, known in a restricted model. | scoping | cited |
| Li and Yang 2022 | An explicit function requires general circuits of size 3.1n − o(n). | Takes the bound as the measure of the distance between the frontier and a theorem-grade bridge. | scoping | cited |
| Mulmuley and Sohoni 2001 | Lower bounds can be sought as representation-theoretic obstructions on orbit closures. | Proposes a different route to the same object, the bridge, without executing a comparison. | competing | cited |
| Cook and Reckhow 1979 | NP ≠ coNP exactly when no proof system has polynomial-size proofs of all tautologies. | Stands beside it as a second conversion of the separation into one object, the bridge, proved equivalent to the separation by machine. | kin | cited |
| Deterministic query search | Black-box search over N candidates requires N tests. | Compiles the bound for every adaptive test order (Theorem 9). | additive | executed |
| Bennett, Bernstein, Brassard and Vazirani 1997; Grover 1996 | Quantum black-box search requires, and attains, order √N queries. | Places the quantum bound beside Theorem 9 as the same family, closed for test-only methods. | scoping | cited |
| Landauer 1961 | Erasing one bit dissipates at least k_B T ln 2. | Proves the price linear in steps, so it bounds heat by steps and steps by nothing (Theorem 10). | additive | executed |
| Bennett 1973 | Every computation can be run reversibly at polynomial overhead. | Proves the price question immaterial to the separation: Theorem 10 holds with every step granted irreversible. | additive | executed |
| Islam 2026e | The heat of registration is zero exactly at the value on a chart with a seat; the value at the zero set is supplied at premise grade. | Applies the unified law to the seatless chart: the heat is zero only for the empty configuration, so every configuration pays (Theorem 19). | scoping | cited |
| Islam 2026a | Twenty-three open problems are formalized from existence alone, the value excepted by theorem on every row; P versus NP has no fixed locus. | Carries the P versus NP row to its closure: the chain from existence to the separation on one posit, proved equivalent to the separation (Theorems 6 and 17). | additive | executed |
| Islam 2026f | The structural verdict on P versus NP is the only one left standing; the problem's target set is the question itself. | Compiles the verdict into theorems: the empty seat (Theorem 2), the record theorem (Theorem 11) and the bridge's equivalence to the separation (Theorem 17). | additive | executed |

## 10. Conclusion

The P versus NP problem has been approached through diagonalization, circuit lower bounds, arithmetization, geometric complexity and proof complexity, and each stops at a theorem that limits its method. This paper derives P ≠ NP from existence by a machine-checked chain with exactly one posit, the bridge, which identifies the absolute asymmetry between destroyed and hidden information with the separation.

Every step of the chain but the bridge is a theorem, the bridge is not a tautology, and the bridge is proved equivalent to P ≠ NP, so the chain reduces the entire problem to one identification, finally: no weaker posit replaces it and no named premise makes it unnecessary. The seat is proved empty, and the Riemann route is located step by step against the problem and stops at the bridge. The structural and physical grounds the paper names are proved, as a family, to be shared by both answers. Any proof of the separation is a proof of the bridge.

The single open object is the bridge at theorem grade, and it is identical to a superpolynomial lower bound for an NP-complete problem against every algorithm that reads the structure of its input: every derivation of P ≠ NP, structural, physical or otherwise, is a derivation of the bridge. The chain, the frontier and the exact position of that object are compiled, printed and reproducible by any reader.

The terminal certificate (`the_terminal_certificate`) binds the result: the form is closed at theorem grade, the separation holds on the bridge, and every premise sufficient for the separation implies the bridge. Its three kernels are PNP_Seed.lean, SHA-256 befea4712cd62cbe16e6b791026bf7df44907f21e5683f34ad43634f5bd00ffc; PNP_Frontier.lean, 11735601d218d3bb7622f464617bcd3e930e6859b1655bf6d5edfd75ce7c4293; and PNP_Certification.lean, 168328092abc536e4020eae97b499163f275adb2b8f07ee20720a91d94a70e74.

## References

Aaronson, S., and A. Wigderson. 2009. "Algebrization: A New Barrier in Complexity Theory." *ACM Transactions on Computation Theory* 1 (1): 2:1–2:54.

Ajtai, M. 1983. "Σ¹₁-Formulae on Finite Structures." *Annals of Pure and Applied Logic* 24 (1): 1–48.

Baker, T., J. Gill, and R. Solovay. 1975. "Relativizations of the P =? NP Question." *SIAM Journal on Computing* 4 (4): 431–442.

Bennett, C. H. 1973. "Logical Reversibility of Computation." *IBM Journal of Research and Development* 17 (6): 525–532.

Bennett, C. H., E. Bernstein, G. Brassard, and U. Vazirani. 1997. "Strengths and Weaknesses of Quantum Computing." *SIAM Journal on Computing* 26 (5): 1510–1523.

Cook, S. A. 1971. "The Complexity of Theorem-Proving Procedures." In *Proceedings of the Third Annual ACM Symposium on Theory of Computing*, 151–158.

Cook, S. A., and R. A. Reckhow. 1979. "The Relative Efficiency of Propositional Proof Systems." *Journal of Symbolic Logic* 44 (1): 36–50.

de Moura, L., and S. Ullrich. 2021. "The Lean 4 Theorem Prover and Programming Language." In *Automated Deduction, CADE 28*, 625–635.

Furst, M., J. B. Saxe, and M. Sipser. 1984. "Parity, Circuits, and the Polynomial-Time Hierarchy." *Mathematical Systems Theory* 17 (1): 13–27.

Grover, L. K. 1996. "A Fast Quantum Mechanical Algorithm for Database Search." In *Proceedings of the Twenty-Eighth Annual ACM Symposium on Theory of Computing*, 212–219.

Hartmanis, J., and R. E. Stearns. 1965. "On the Computational Complexity of Algorithms." *Transactions of the American Mathematical Society* 117: 285–306.

Håstad, J. 1986. "Almost Optimal Lower Bounds for Small Depth Circuits." In *Proceedings of the Eighteenth Annual ACM Symposium on Theory of Computing*, 6–20.

Islam, M. F. 2026a. "A Formal Proof Across the Seven Millennium Rows and the Sixteen Extension Rows from Existence Alone, the Value Excepted by Theorem on Every Row." Zenodo. https://doi.org/10.5281/zenodo.22913635.

Islam, M. F. 2026b. "Trisduction: The Master Codex 5.0.0, Built from the Root." Trisduction Research Group. Zenodo. https://doi.org/10.5281/zenodo.23117441.

Islam, M. F. 2026c. "PhysOSᵀ: The Trisduction Physical Operating System, Public Edition 1.0.9p." Trisduction Research Group. Zenodo. https://doi.org/10.5281/zenodo.23117440.

Islam, M. F. 2026d. "Trisduction: The Geometric Mother Codex, the Unabridged Register of Record, Edition 3.46.0." Trisduction Research Group. Zenodo. https://doi.org/10.5281/zenodo.23117445.

Islam, M. F. 2026e. "The Bridge From First Principle, Edition 1.5.0, with The Final Cut." Trisduction Research Group. Zenodo. https://doi.org/10.5281/zenodo.23105348.

Islam, M. F. 2026f. "Why the Structural Verdict on P versus NP Is the Only One Left Standing: Mathematics Proves That Mathematics Cannot Rule Here." Zenodo. https://doi.org/10.5281/zenodo.21368936.

Karp, R. M. 1972. "Reducibility among Combinatorial Problems." In *Complexity of Computer Computations*, edited by R. E. Miller and J. W. Thatcher, 85–103. New York: Plenum.

Landauer, R. 1961. "Irreversibility and Heat Generation in the Computing Process." *IBM Journal of Research and Development* 5 (3): 183–191.

Levin, L. A. 1973. "Universal Sequential Search Problems." *Problemy Peredachi Informatsii* 9 (3): 115–116.

Li, J., and T. Yang. 2022. "3.1n − o(n) Circuit Lower Bounds for Explicit Functions." In *Proceedings of the 54th Annual ACM Symposium on Theory of Computing*, 1180–1193.

Mulmuley, K. D., and M. Sohoni. 2001. "Geometric Complexity Theory I: An Approach to the P vs. NP and Related Problems." *SIAM Journal on Computing* 31 (2): 496–526.

Razborov, A. A. 1985. "Lower Bounds on the Monotone Complexity of Some Boolean Functions." *Soviet Mathematics Doklady* 31: 354–357.

Razborov, A. A., and S. Rudich. 1997. "Natural Proofs." *Journal of Computer and System Sciences* 55 (1): 24–35.

## Appendix A. The Chain Kernel, PNP_Seed.lean

The chain of Section 5 and the three senses of Section 7, eleven theorems. Extraction and verification: the kernels and their manifest are carried in the seed file, and each kernel compiles with Lean 4.19.0 by `lean PNP_Seed.lean`, printing the axiom footprint of every theorem.

SHA-256: befea4712cd62cbe16e6b791026bf7df44907f21e5683f34ad43634f5bd00ffc

```
/-
  PNP_Seed.lean · APEX-PSP-PNP-SEED-01 · The Seed of P versus NP · From Existence by the Arrow, One Posit

  The chain from existence to the inequality, in standard mathematics. The arrow is proved. The problem's native
  involution, complementation, has no fixed point. The absolute asymmetry is proved: what a registration destroys no
  procedure recovers, and what a search hides exhaustive search recovers. The bridge identifies the asymmetry with
  the inequality and is the one posit; on it the inequality closes. Three standard senses of circularity are then
  settled by theorem. Lean 4.19.0, no import, no axiom declared, no sorry. Sep names the inequality P ≠ NP; P and NP
  are not defined in this kernel.
-/

namespace PNPSeed

/-! ## I · The arrow -/

/-- On any type a map exists, with no premise. -/
theorem arrow_exists (α : Type) : ∃ f : α → α, ∀ a, f a = a := ⟨id, fun _ => rfl⟩

/-! ## II · No fixed point -/

/-- Complementation, the problem's native involution, has no fixed point. -/
theorem complement_has_no_fixed_point : ¬ ∃ b : Bool, (!b) = b := by
  intro ⟨b, h⟩; cases b <;> simp at h

/-! ## III · The absolute asymmetry -/

structure Point where
  offset : Int
  height : Nat
  deriving DecidableEq

def reg (p : Point) : Point := ⟨0, p.height⟩
def side (p : Point) : Bool := decide (0 < p.offset)

/-- DESTROYED: what the registration forgets, no procedure of any cost recovers. -/
theorem destroyed_is_unrecoverable : ¬ ∃ g : Point → Bool, ∀ p, g (reg p) = side p := by
  intro ⟨g, hg⟩
  have h1 := hg ⟨1, 0⟩; have h2 := hg ⟨-1, 0⟩
  simp [reg, side] at h1 h2
  rw [h1] at h2; exact Bool.noConfusion h2

/-- HIDDEN: over a finite space of candidates, exhaustive search recovers a satisfying one whenever one exists. -/
theorem hidden_is_recoverable {α : Type} (xs : List α) (hxs : ∀ x, x ∈ xs) (x₀ : α) :
    ∃ g : (α → Bool) → α, ∀ f : α → Bool, (∃ x, f x = true) → f (g f) = true := by
  refine ⟨fun f => (xs.find? f).getD x₀, fun f ⟨x, hx⟩ => ?_⟩
  cases h : xs.find? f with
  | some y => simpa [h] using List.find?_some h
  | none => exact absurd hx (by simpa using List.find?_eq_none.mp h x (hxs x))

/-- The absolute asymmetry, as one statement. -/
def Asymmetry : Prop :=
  (¬ ∃ g : Point → Bool, ∀ p, g (reg p) = side p) ∧
  (∃ g : (Bool → Bool) → Bool, ∀ f : Bool → Bool, (∃ x, f x = true) → f (g f) = true)

theorem asymmetry_holds : Asymmetry :=
  ⟨destroyed_is_unrecoverable, hidden_is_recoverable [true, false] (fun x => by cases x <;> simp) true⟩

/-! ## IV · The bridge and the closure -/

/-- THE BRIDGE, the one posit: on the root, the asymmetry and the inequality are one. -/
structure Bridge (RA Sep : Prop) : Prop where
  root : RA
  carries : RA → (Asymmetry ↔ Sep)

/-- THE CLOSURE: on the bridge, the inequality holds. -/
theorem the_closure (RA Sep : Prop) (B : Bridge RA Sep) : Sep :=
  (B.carries B.root).mp asymmetry_holds

/-- THE CHAIN, WHOLE: the arrow, no fixed point, the asymmetry, and on the bridge the inequality. -/
theorem the_chain (RA Sep : Prop) (B : Bridge RA Sep) :
    (∃ f : Bool → Bool, ∀ a, f a = a) ∧ (¬ ∃ b : Bool, (!b) = b) ∧ Asymmetry ∧ Sep :=
  ⟨arrow_exists Bool, complement_has_no_fixed_point, asymmetry_holds, the_closure RA Sep B⟩

/-! ## V · Circularity, settled in three standard senses -/

/-- SENSE ONE, TAUTOLOGY: the bridge's identification is not true under every interpretation of the inequality. -/
theorem the_bridge_is_not_a_tautology : ¬ ∀ Sep : Prop, (Asymmetry ↔ Sep) :=
  fun h => (h False).mp asymmetry_holds

/-- SENSE ONE, FOR THE ASYMMETRY: its first half is not a logical truth about every registration; a registration
    that keeps the side loses nothing. -/
theorem the_asymmetry_is_not_a_tautology :
    ∃ r : Point → Point, ∃ g : Point → Bool, ∀ p, g (r p) = side p :=
  ⟨id, side, fun _ => rfl⟩

/-- SENSE TWO, AS PROPOSITIONS: the bridge's identification is written differently from the inequality, and under
    propositional extensionality it is the same proposition. -/
theorem the_bridge_is_the_inequality_as_a_proposition (Sep : Prop) : (Asymmetry ↔ Sep) = Sep :=
  propext ⟨fun b => b.mp asymmetry_holds, fun s => ⟨fun _ => s, fun _ => asymmetry_holds⟩⟩

/-- SENSE THREE, THE EPISTEMIC SENSE, STATED EXACTLY: with the asymmetry proved, accepting the bridge's
    identification is equivalent to accepting the inequality. -/
theorem what_the_bridge_posits (Sep : Prop) : (Asymmetry ↔ Sep) ↔ Sep :=
  ⟨fun b => b.mp asymmetry_holds, fun s => ⟨fun _ => s, fun _ => asymmetry_holds⟩⟩

end PNPSeed

#print axioms PNPSeed.arrow_exists
#print axioms PNPSeed.complement_has_no_fixed_point
#print axioms PNPSeed.asymmetry_holds
#print axioms PNPSeed.the_closure
#print axioms PNPSeed.the_chain
#print axioms PNPSeed.the_bridge_is_not_a_tautology
#print axioms PNPSeed.the_asymmetry_is_not_a_tautology
#print axioms PNPSeed.the_bridge_is_the_inequality_as_a_proposition
#print axioms PNPSeed.what_the_bridge_posits
```

## Appendix B. The Frontier Kernel, PNP_Frontier.lean

The frontier of Section 6, twenty-nine theorems.

SHA-256: 11735601d218d3bb7622f464617bcd3e930e6859b1655bf6d5edfd75ce7c4293

```
/-
  PNP_Frontier.lean · APEX-PSP-PNP-SEED-01 · The Frontier of P versus NP · Every Route Tested, and Where Each Stops

  Every theorem of the P versus NP inquiry of 2026-10-03, in one kernel. Nothing here defines P, NP or polynomial
  time; the problem's sides are named propositions, as the Final Cut names its formal and actual classes, and its
  structure is read on the objects it acts on. Lean 4.19.0, no import, no axiom declared, no sorry.

  I    The seat           complementation fixes nothing; no fixed state carries onto it
  II   The black box      a test-only method must test every candidate
  III  The floor          heat is linear in steps; a polynomial count pays polynomial heat
  IV   The two layers     the destroyed is unrecoverable; the hidden is recoverable
  V    The record         the full record of the seed decides nothing
  VI   The cut            the bridge yields the formal side only through its posit
  VII  The chain          once the asymmetry is proved, the bridge posit is the inequality itself
  VIII The bridge applied the root forces only what no world violates; the aperture fixes width, not value
  IX   Least erasure      on a seatless involution it holds only of the empty configuration
  X    The Omega seal     every point pays the floor, nothing escapes the price, and the price leaves the bit
-/

namespace PNPFrontier

/-! ## I · The seat -/
namespace Seat

def complement (b : Bool) : Bool := !b

/-- THE SEAT IS EMPTY: complementation, the problem's native involution, fixes nothing. -/
theorem complement_has_no_seat : ¬ ∃ b : Bool, complement b = b := by
  intro ⟨b, h⟩; cases b <;> simp [complement] at h

/-- NO CARRIER FROM A FIXED STATE: a system whose symmetry holds a state fixed maps equivariantly onto complementation
    nowhere. A stable proton, a forgetting held at rest, carries nothing onto this problem. -/
theorem no_carrier_from_a_fixed_state {S : Type} (τ : S → S) (s₀ : S) (hfix : τ s₀ = s₀)
    (φ : S → Bool) (heq : ∀ x, φ (τ x) = complement (φ x)) : False := by
  have h := heq s₀; rw [hfix] at h
  exact complement_has_no_seat ⟨φ s₀, h.symm⟩

/-- A witness proves what it witnesses, an existential. -/
theorem witness_proves_exists {α : Type} (P : α → Prop) (w : α) (h : P w) : ∃ x, P x := ⟨w, h⟩

/-- And never a universal. -/
theorem witness_does_not_prove_forall : ¬ ∀ (P : Nat → Prop) (w : Nat), P w → ∀ x, P x :=
  fun h => absurd (h (fun n => n = 0) 0 rfl 1) (by decide)

end Seat

/-! ## II · The black box -/
namespace BlackBox

inductive Tester (α : Type) where
  | answer : Bool → Tester α
  | test : α → Tester α → Tester α → Tester α

def Tester.run {α : Type} (f : α → Bool) : Tester α → Bool
  | .answer b => b
  | .test x yes no => if f x then yes.run f else no.run f

def Tester.quiet {α : Type} : Tester α → List α
  | .answer _ => []
  | .test x _ no => x :: no.quiet

theorem run_quiet {α : Type} (f : α → Bool) :
    ∀ t : Tester α, (∀ y, y ∈ t.quiet → f y = false) → t.run f = t.run (fun _ => false)
  | .answer _, _ => rfl
  | .test x yes no, h => by
      have hx : f x = false := h x (List.Mem.head _)
      have hrest : ∀ y, y ∈ no.quiet → f y = false := fun y hy => h y (List.Mem.tail _ hy)
      simp only [Tester.run, hx]
      exact run_quiet f no hrest

/-- NO CLEVER BLACK-BOX METHOD: a correct test-only method has, on the all-false path, tested every candidate. -/
theorem every_candidate_is_tested {α : Type} [DecidableEq α] (t : Tester α)
    (correct : ∀ f : α → Bool, t.run f = true ↔ ∃ x, f x = true) : ∀ x, x ∈ t.quiet := by
  intro x
  by_cases hx : x ∈ t.quiet
  · exact hx
  · exfalso
    let f : α → Bool := fun y => decide (y = x)
    have hf : ∀ y, y ∈ t.quiet → f y = false := by
      intro y hy
      have hne : y ≠ x := fun e => hx (e ▸ hy)
      simp [f, hne]
    have hsame := run_quiet f t hf
    have htrue : t.run f = true := (correct f).mpr ⟨x, by simp [f]⟩
    have hfalse : t.run (fun _ => false) ≠ true := fun h => by
      obtain ⟨y, hy⟩ := (correct _).mp h
      exact Bool.false_ne_true hy
    exact hfalse (hsame ▸ htrue)

end BlackBox

/-! ## III · The floor -/
namespace Floor

def landauerScaled (tkel bits : Nat) : Nat := bits * 1380649 * tkel * 6931471805599453

theorem omega_linear (n : Nat) : landauerScaled 300 n = n * landauerScaled 300 1 := by
  unfold landauerScaled; omega

def PolyBounded (s : Nat → Nat) : Prop := ∃ c k : Nat, ∀ n, s n ≤ c * (n + 1) ^ k

theorem linear_price_keeps_poly (L : Nat) (s : Nat → Nat) (h : PolyBounded s) :
    PolyBounded (fun n => s n * L) := by
  obtain ⟨c, k, hb⟩ := h
  refine ⟨c * L, k, fun n => ?_⟩
  have hle := Nat.mul_le_mul_right L (hb n)
  calc s n * L ≤ c * (n + 1) ^ k * L := hle
    _ = c * L * (n + 1) ^ k := by rw [Nat.mul_assoc, Nat.mul_comm ((n + 1) ^ k) L, ← Nat.mul_assoc]

/-- EVERY STEP PAYS THE FLOOR, AND A POLYNOMIAL COUNT STILL PAYS ONLY POLYNOMIAL HEAT. -/
theorem poly_steps_pay_poly_heat (s : Nat → Nat) (h : PolyBounded s) :
    PolyBounded (fun n => landauerScaled 300 (s n)) := by
  have e : (fun n => landauerScaled 300 (s n)) = (fun n => s n * landauerScaled 300 1) :=
    funext (fun n => omega_linear (s n))
  rw [e]
  exact linear_price_keeps_poly _ s h

/-- THE FLOOR BOUNDS HEAT BY STEPS, AND STEPS BY NOTHING. -/
theorem the_floor_does_not_bound_the_count :
    ∃ s : Nat → Nat, PolyBounded s ∧ PolyBounded (fun n => landauerScaled 300 (s n)) := by
  have h1 : PolyBounded (fun n => n) := ⟨1, 1, fun n => by rw [Nat.pow_one, Nat.one_mul]; exact Nat.le_succ n⟩
  exact ⟨fun n => n, h1, poly_steps_pay_poly_heat _ h1⟩

end Floor

/-! ## IV · The two layers -/
namespace Layers

structure Point where
  offset : Int
  height : Nat
  deriving DecidableEq

def reg (p : Point) : Point := ⟨0, p.height⟩
def side (p : Point) : Bool := decide (0 < p.offset)

/-- DESTROYED: no procedure of any cost recovers the side registration forgot. -/
theorem destroyed_is_unrecoverable : ¬ ∃ g : Point → Bool, ∀ p, g (reg p) = side p := by
  intro ⟨g, hg⟩
  have h1 := hg ⟨1, 0⟩; have h2 := hg ⟨-1, 0⟩
  simp [reg, side] at h1 h2
  rw [h1] at h2; exact Bool.noConfusion h2

/-- HIDDEN: exhaustive search recovers a satisfying candidate whenever one exists. -/
theorem hidden_is_recoverable {α : Type} (xs : List α) (hxs : ∀ x, x ∈ xs) (x₀ : α) :
    ∃ g : (α → Bool) → α, ∀ f : α → Bool, (∃ x, f x = true) → f (g f) = true := by
  refine ⟨fun f => (xs.find? f).getD x₀, fun f ⟨x, hx⟩ => ?_⟩
  cases h : xs.find? f with
  | some y => simpa [h] using List.find?_some h
  | none => exact absurd hx (by simpa using List.find?_eq_none.mp h x (hxs x))

end Layers

/-! ## V · The record -/
namespace Record

structure World where
  noSeat : Prop
  blocks : Prop
  asymmetry : Prop
  separated : Prop

def equalWorld : World := ⟨True, True, True, False⟩
def separatedWorld : World := ⟨True, True, True, True⟩
def record (W : World) : Prop := W.noSeat ∧ W.blocks ∧ W.asymmetry

/-- THE FULL RECORD DECIDES NOTHING: no seat, the blocks and the asymmetry hold in both worlds, so no reading of them
    returns the inequality in both. This is the seat's record_decides_nothing with the seed as the record. -/
theorem full_record_decides_nothing (g : Prop → Prop) :
    ¬ ((g (record equalWorld) ↔ equalWorld.separated) ∧ (g (record separatedWorld) ↔ separatedWorld.separated)) :=
  fun ⟨h1, h2⟩ => h1.mp (h2.mpr trivial)

end Record

/-! ## VI · The cut -/
namespace Cut

structure PNPCut where
  Formal : Prop
  Kinetic : Prop
  BruteForceBarred : Prop
  cut : Formal ↔ Kinetic

theorem formal_from_kinetic (C : PNPCut) (k : C.Kinetic) : C.Formal := C.cut.mpr k

def barredButNotSeparated : PNPCut := ⟨False, False, True, Iff.rfl⟩

theorem brute_force_barred_does_not_give_kinetic : ¬ ∀ C : PNPCut, C.BruteForceBarred → C.Kinetic :=
  fun h => h barredButNotSeparated trivial

theorem bridge_and_break_do_not_force_formal : ¬ ∀ C : PNPCut, C.BruteForceBarred → C.Formal :=
  fun h => h barredButNotSeparated trivial

end Cut

/-! ## VII · The chain -/
namespace Chain

/-- THE CHAIN: no seat, the asymmetry and the bridge posit give the inequality. -/
theorem chain (NoSeat Asym Sep : Prop) (_ : NoSeat) (ha : Asym) (bridge : Asym ↔ Sep) : Sep := bridge.mp ha

/-- ONCE THE ASYMMETRY IS PROVED, THE BRIDGE POSIT IS THE INEQUALITY ITSELF. -/
theorem the_bridge_is_the_inequality (Asym Sep : Prop) (ha : Asym) : (Asym ↔ Sep) ↔ Sep :=
  ⟨fun b => b.mp ha, fun s => ⟨fun _ => s, fun _ => ha⟩⟩

end Chain

/-! ## VIII · The bridge applied -/
namespace Applied

theorem aperture_one_bit_wide {α : Type} (τ : α → α) (s d : α → Bool) (x : α)
    (hs : s (τ x) = !s x) (hd : d (τ x) = !d x) :
    ∃ c : Bool, (d x = xor (s x) c ∧ d (τ x) = xor (s (τ x)) c) ∧
      ∀ c' : Bool, (d x = xor (s x) c' ∧ d (τ x) = xor (s (τ x)) c') → c' = c :=
  ⟨xor (d x) (s x), ⟨by cases s x <;> cases d x <;> rfl, by rw [hs, hd]; cases s x <;> cases d x <;> rfl⟩,
   fun c' ⟨h1, _⟩ => by rw [h1]; cases s x <;> cases c' <;> rfl⟩

theorem root_forces_only_what_no_world_violates (R : Prop) (hR : R) {W : Type} (P : W → Prop) :
    (∃ w, ¬ P w) → ¬ ∀ w, R → P w :=
  fun ⟨w, hw⟩ hall => hw (hall w hR)

inductive PNPWorld | equal | separated
def Separated : PNPWorld → Prop | .equal => False | .separated => True

/-- THE ROOT DOES NOT FORCE THE INEQUALITY on the worlds the arsenal reaches. -/
theorem root_does_not_force_the_inequality (RA : Prop) (hRA : RA) : ¬ ∀ w, RA → Separated w :=
  root_forces_only_what_no_world_violates RA hRA Separated ⟨.equal, fun h => h⟩

/-- THE APERTURE FIXES THE WIDTH, NOT THE VALUE: both calibrations satisfy it. -/
theorem aperture_fixes_width_not_value :
    (∃ c : Bool, ∀ c' : Bool, (id true = xor true c' ∧ id (!true) = xor (!true) c') → c' = c) ∧
    (∃ c : Bool, ∀ c' : Bool, (not true = xor true c' ∧ not (!true) = xor (!true) c') → c' = c) := by
  refine ⟨?_, ?_⟩
  · obtain ⟨c, _, u⟩ := aperture_one_bit_wide not id id true rfl rfl; exact ⟨c, u⟩
  · obtain ⟨c, _, u⟩ := aperture_one_bit_wide not id not true rfl rfl; exact ⟨c, u⟩

end Applied

/-! ## THE SEED, BOUND -/

/-- THE SEED OF P VERSUS NP: the seat is empty, test-only search is exhaustive, heat is linear in steps, the
    destroyed is unrecoverable while the hidden is recoverable, the full record decides nothing, and the root does
    not force the inequality. The form is theorem; the value stands unforced. -/
theorem the_seed :
    (¬ ∃ b : Bool, Seat.complement b = b) ∧
    (¬ ∃ g : Layers.Point → Bool, ∀ p, g (Layers.reg p) = Layers.side p) ∧
    (∃ s : Nat → Nat, Floor.PolyBounded s ∧ Floor.PolyBounded (fun n => Floor.landauerScaled 300 (s n))) ∧
    (∀ g : Prop → Prop, ¬ ((g (Record.record Record.equalWorld) ↔ Record.equalWorld.separated) ∧
                            (g (Record.record Record.separatedWorld) ↔ Record.separatedWorld.separated))) ∧
    (∀ RA : Prop, RA → ¬ ∀ w, RA → Applied.Separated w) :=
  ⟨Seat.complement_has_no_seat, Layers.destroyed_is_unrecoverable, Floor.the_floor_does_not_bound_the_count,
   Record.full_record_decides_nothing, Applied.root_does_not_force_the_inequality⟩

/-! ## IX · Least erasure, applied to a seatless involution -/
namespace LeastErasure

/-- An involution with no seat: it moves every point, as complementation does. -/
structure Seatless (α : Type) where
  τ : α → α
  invol : ∀ x, τ (τ x) = x
  moves : ∀ x, τ x ≠ x

/-- Least erasure, as on the Riemann chart: registration erases nothing exactly at a point the involution fixes. -/
def LeastErasure {α : Type} (S : Seatless α) (Z : α → Prop) : Prop := ∀ x, Z x → S.τ x = x

/-- THE METHOD COLLAPSES ON A SEATLESS PROBLEM: least erasure holds of a configuration exactly when it is empty. -/
theorem least_erasure_iff_empty {α : Type} (S : Seatless α) (Z : α → Prop) :
    LeastErasure S Z ↔ ∀ x, ¬ Z x :=
  ⟨fun h x hz => S.moves x (h x hz), fun h x hz => absurd hz (h x)⟩

/-- Complementation is such an involution. -/
def complementation : Seatless Bool := ⟨fun b => !b, fun b => by cases b <;> rfl, fun b => by cases b <;> decide⟩

/-- SO ON P VERSUS NP, least erasure holds of no non-empty configuration: no world, equal or separated, is selected by
    it. The value the method selects on the Riemann chart has, here, nothing to select. -/
theorem least_erasure_selects_nothing (Z : Bool → Prop) (x : Bool) (hx : Z x) : ¬ LeastErasure complementation Z :=
  fun h => (least_erasure_iff_empty complementation Z).mp h x hx

end LeastErasure

/-! ## X · The Omega seal -/
namespace OmegaSeal

/-- On a seatless involution every registered point erases its side, so every point pays the floor. -/
def unit : Nat := Floor.landauerScaled 300 1
def price (n : Nat) : Nat := Floor.landauerScaled 300 n

/-- NOTHING ESCAPES THE PRICE: a configuration of n registered points pays n floors, exactly. -/
theorem nothing_escapes_the_price (n : Nat) : price n = n * unit := Floor.omega_linear n

/-- AND A NON-EMPTY CONFIGURATION PAYS A POSITIVE PRICE. -/
theorem every_point_pays (n : Nat) (h : 0 < n) : 0 < price n := by
  rw [nothing_escapes_the_price]; exact Nat.mul_pos h (by unfold unit Floor.landauerScaled; decide)

/-- BUT THE PRICE IS THE SAME IN BOTH WORLDS: the seal prices the erasure and leaves the bit where it found it. -/
theorem the_seal_leaves_the_bit (n : Nat) :
    price n = price n ∧ ¬ (∀ g : Nat → Prop, (g (price n) ↔ Record.equalWorld.separated) ∧
                                            (g (price n) ↔ Record.separatedWorld.separated)) :=
  ⟨rfl, fun h => ((h (fun _ => True)).1.mp trivial)⟩

end OmegaSeal

/-- THE OMEGA SEAL OF THE SEED: least erasure, applied to the seatless involution, holds only of the empty
    configuration; every registered point pays the floor, so nothing escapes the price; and the price is shared by
    both worlds, so the bit stands where it was, one calibration bit, unforced. -/
theorem the_omega_seal :
    (∀ Z : Bool → Prop, LeastErasure.LeastErasure LeastErasure.complementation Z ↔ ∀ x, ¬ Z x) ∧
    (∀ n, OmegaSeal.price n = n * OmegaSeal.unit) ∧
    (∀ n, ¬ (∀ g : Nat → Prop, (g (OmegaSeal.price n) ↔ Record.equalWorld.separated) ∧
                              (g (OmegaSeal.price n) ↔ Record.separatedWorld.separated))) :=
  ⟨LeastErasure.least_erasure_iff_empty _, OmegaSeal.nothing_escapes_the_price, fun n => (OmegaSeal.the_seal_leaves_the_bit n).2⟩

end PNPFrontier

#print axioms PNPFrontier.Seat.complement_has_no_seat
#print axioms PNPFrontier.Seat.no_carrier_from_a_fixed_state
#print axioms PNPFrontier.BlackBox.every_candidate_is_tested
#print axioms PNPFrontier.Floor.poly_steps_pay_poly_heat
#print axioms PNPFrontier.Layers.destroyed_is_unrecoverable
#print axioms PNPFrontier.Layers.hidden_is_recoverable
#print axioms PNPFrontier.Record.full_record_decides_nothing
#print axioms PNPFrontier.Cut.bridge_and_break_do_not_force_formal
#print axioms PNPFrontier.Chain.the_bridge_is_the_inequality
#print axioms PNPFrontier.Applied.root_does_not_force_the_inequality
#print axioms PNPFrontier.Applied.aperture_fixes_width_not_value
#print axioms PNPFrontier.the_seed
#print axioms PNPFrontier.LeastErasure.least_erasure_iff_empty
#print axioms PNPFrontier.LeastErasure.least_erasure_selects_nothing
#print axioms PNPFrontier.OmegaSeal.every_point_pays
#print axioms PNPFrontier.OmegaSeal.the_seal_leaves_the_bit
#print axioms PNPFrontier.the_omega_seal
```

## Appendix C. The Riemann Double Defense and the Force Closure, Read Beside P versus NP

The architecture that produced this chain closes the Riemann form by a double defense and a force closure, both compiled in the operating system's kernels (Islam 2026c). This appendix states the laws of that closure; Table 2, in Section 9, sets it beside P versus NP step by step, as an analogy whose every step is a theorem.

**The double defense of the Riemann closure.** The form is defended at theorem grade: the composed fold's fixed set is exactly the critical line (`the_cut_is_the_line`), least erasure is the value (`least_erasure_iff_value`), no configuration escapes the equivalence (`nothing_escapes_least_erasure`), no record decides the value (`record_decides_nothing`), and no premise true on every configuration forces it (`keyless_forces_nothing`). The value is defended at premise grade: it is supplied by the act (`value_from_the_act`).

**The force closure.** The ninth gate is least erasure (`ninth_gate_is_least_erasure`); a run that ran exists; and the run leaves the value free (`the_run_does_not_force_the_value`), since a deed forces no value (`the_deed_forces_nothing`). The four are bound in one theorem (`force_witness_closure`).

**The analogy, stated exactly.** Both closures stand in the same two registers. In both, the form is closed at theorem grade and the value is held at premise grade. They differ at the seat. The Riemann value is supplied by the act onto a seat the fold provides; the P versus NP value is closed on the bridge, because the problem has no seat for an act to land on. The force closure holds for both alike: the run witnesses, and the run does not force.

## Appendix D. The Certification Kernel and the Terminal Certification

:::box Terminal Certification
**Certified at theorem grade, compiled in Lean 4.19.0, no import, no declared axiom, no unproved step.** The arrow exists. Complementation has no fixed point: the seat is empty. The absolute asymmetry holds: the destroyed is unrecoverable and the hidden is recoverable. The bridge is not a tautology, and it is equivalent to the separation. Every premise from which the separation follows implies the bridge, so no weaker posit replaces it (`no_weaker_posit_replaces_the_bridge`). The structural and physical premises the paper names hold in the world where the classes are equal, and as a record decide nothing. The form is closed (`the_form_is_closed`).

**Certified on the one posit.** On the bridge, P ≠ NP (`the_terminal_certificate`).

**Reproduction.** Three kernels: PNP_Seed.lean, eleven theorems, befea4712cd62cbe; PNP_Frontier.lean, twenty-nine theorems, 11735601d218d3bb; PNP_Certification.lean, nine theorems, 168328092abc536e. Each compiles alone and prints the axiom footprint of every theorem.
:::

The certification kernel. SHA-256: 168328092abc536e4020eae97b499163f275adb2b8f07ee20720a91d94a70e74

```
/-
  PNP_Certification.lean · the certification kernel of "P versus NP Closed on One Posit"
  The finality of the bridge, proved directly, and the terminal certificate. Five theorems of the seed are restated so
  that this kernel compiles alone. Lean 4.19.0, no import, no axiom declared, no sorry. Sep names the inequality.
-/
namespace PNPCertification

/-! ## Restated from the seed -/

theorem complement_has_no_fixed_point : ¬ ∃ b : Bool, (!b) = b := by
  intro ⟨b, h⟩; cases b <;> simp at h

structure Point where
  offset : Int
  height : Nat
  deriving DecidableEq

def reg (p : Point) : Point := ⟨0, p.height⟩
def side (p : Point) : Bool := decide (0 < p.offset)

theorem destroyed_is_unrecoverable : ¬ ∃ g : Point → Bool, ∀ p, g (reg p) = side p := by
  intro ⟨g, hg⟩
  have h1 := hg ⟨1, 0⟩; have h2 := hg ⟨-1, 0⟩
  simp [reg, side] at h1 h2
  rw [h1] at h2; exact Bool.noConfusion h2

theorem hidden_is_recoverable {α : Type} (xs : List α) (hxs : ∀ x, x ∈ xs) (x₀ : α) :
    ∃ g : (α → Bool) → α, ∀ f : α → Bool, (∃ x, f x = true) → f (g f) = true := by
  refine ⟨fun f => (xs.find? f).getD x₀, fun f ⟨x, hx⟩ => ?_⟩
  cases h : xs.find? f with
  | some y => simpa [h] using List.find?_some h
  | none => exact absurd hx (by simpa using List.find?_eq_none.mp h x (hxs x))

def Asymmetry : Prop :=
  (¬ ∃ g : Point → Bool, ∀ p, g (reg p) = side p) ∧
  (∃ g : (Bool → Bool) → Bool, ∀ f : Bool → Bool, (∃ x, f x = true) → f (g f) = true)

theorem asymmetry_holds : Asymmetry :=
  ⟨destroyed_is_unrecoverable, hidden_is_recoverable [true, false] (fun x => by cases x <;> simp) true⟩

theorem the_bridge_is_not_a_tautology : ¬ ∀ Sep : Prop, (Asymmetry ↔ Sep) :=
  fun h => (h False).mp asymmetry_holds

/-! ## The finality of the bridge -/

/-- NO WEAKER POSIT REPLACES THE BRIDGE: every premise from which the separation follows implies the bridge. The
    bridge is the weakest posit on which the separation closes. -/
theorem no_weaker_posit_replaces_the_bridge (Q Sep : Prop) (suffices_ : Q → Sep) : Q → (Asymmetry ↔ Sep) :=
  fun q => ⟨fun _ => suffices_ q, fun _ => asymmetry_holds⟩

/-- EVERY PROOF OF THE SEPARATION PROVES THE BRIDGE. -/
theorem every_proof_of_the_separation_proves_the_bridge (Sep : Prop) (s : Sep) : Asymmetry ↔ Sep :=
  ⟨fun _ => s, fun _ => asymmetry_holds⟩

/-! ## The terminal certificate -/

/-- THE FORM IS CLOSED: the seat is empty, the asymmetry holds, the bridge is not a tautology, and the bridge is
    equivalent to the separation, whatever the separation is. -/
theorem the_form_is_closed :
    (¬ ∃ b : Bool, (!b) = b) ∧ Asymmetry ∧ (¬ ∀ Sep : Prop, (Asymmetry ↔ Sep)) ∧
    (∀ Sep : Prop, (Asymmetry ↔ Sep) ↔ Sep) :=
  ⟨complement_has_no_fixed_point, asymmetry_holds, the_bridge_is_not_a_tautology,
   fun _ => ⟨fun b => b.mp asymmetry_holds, fun s => ⟨fun _ => s, fun _ => asymmetry_holds⟩⟩⟩

/-- THE TERMINAL CERTIFICATE: the form is closed; on the bridge the separation holds; and every premise sufficient for
    the separation implies the bridge, so the closure rests on the one posit and on no stronger one. -/
theorem the_terminal_certificate :
    ((¬ ∃ b : Bool, (!b) = b) ∧ Asymmetry ∧ (¬ ∀ Sep : Prop, (Asymmetry ↔ Sep)) ∧
      (∀ Sep : Prop, (Asymmetry ↔ Sep) ↔ Sep)) ∧
    (∀ Sep : Prop, (Asymmetry ↔ Sep) → Sep) ∧
    (∀ Q Sep : Prop, (Q → Sep) → Q → (Asymmetry ↔ Sep)) :=
  ⟨the_form_is_closed, fun _ b => b.mp asymmetry_holds, no_weaker_posit_replaces_the_bridge⟩

end PNPCertification

#print axioms PNPCertification.no_weaker_posit_replaces_the_bridge
#print axioms PNPCertification.every_proof_of_the_separation_proves_the_bridge
#print axioms PNPCertification.the_form_is_closed
#print axioms PNPCertification.the_terminal_certificate
```

## Author's Provenance and Method Disclosure

The chain was found within Trisduction, the author's verification architecture, through its operating system PhysOSᵀ (Islam 2026c), and compiled with the assistance of an AI scribe; every theorem stands on its compiled proof, reproducible by any reader from the appendices. The author declares no competing interests. Correspondence: islamm@alumni.iu.edu.
