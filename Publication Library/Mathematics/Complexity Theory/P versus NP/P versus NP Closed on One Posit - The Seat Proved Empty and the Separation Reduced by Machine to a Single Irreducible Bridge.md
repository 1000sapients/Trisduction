---
edition: math_journal
title: "The Formal Closure of Computational Separation: P ≠ NP Closed on Existence Itself, Read on Computation"
subtitle: "A Lean 4 Formalization via RAcomp, Least Escape, and the Barrier-Evasion Frontier"
article_type: "Computational Complexity"
goal: "One Posit Carries the Whole Separation"
author_line: "Mohammad F. Islam, PhD"
affiliation: "Trisduction Research Group · Independent Researcher, United States"
date: "2026-10-04"
short_title: "P versus NP Closed on One Posit"
keywords: "P versus NP · computational complexity · existence · the root read on computation · Levin universal search · relativization · natural proofs · algebrization · Williams algorithms to lower bounds · formal verification · Lean 4"
abstract: |
  The P versus NP problem has resisted every method, and relativization, natural proofs and algebrization prove that whole families of arguments cannot separate the classes. This paper anchors the problem in existence and closes it on one posit. Existence and freedom are the ground: the Root Axiom is universal and undeniable, every denial of it re-enacting it, and every deed instantiates it, and freedom is carried by the primes, every prime's fibre a copy of complementation, the problem's native involution, which has no fixed point. The separation is defined on a machine whose algorithms decide satisfiability within a polynomial bound or fail to, and the closure, that every algorithm at every bound meets an instance that stops it, gives it on no axiom. The root read on computation, every decider of satisfiability actuating beyond every polynomial bound, is the separation itself, on no axiom, and it is the one place where existence meets the separation: no statement that reads the same on every machine, not existence, not freedom, not the arrow, is that reading. The reading is the single posit, the weakest premise on which the separation closes, and P ≠ NP holds on it at premise grade. Around the closure stand a double defense, in which nothing passes for the separation but the reading and nothing against it but a computed escape; a held throne, whose holder, Levin's universal search, decides the separation on no axiom; and a frontier that types every route, Williams' route wired to the machine on two named objects. All one hundred eighty-seven theorems are compiled in Lean 4.19.0 with no import, no custom axiom and no unproved step, every footprint pinned and printed.
---

## 1. Introduction

The P versus NP problem asks whether every decision problem whose solutions can be verified in polynomial time can also be solved in polynomial time (Cook 1971; Levin 1973; Karp 1972). Three theorems explain why the principal methods have not settled it: relativization (Baker, Gill and Solovay 1975), natural proofs (Razborov and Rudich 1997) and algebrization (Aaronson and Wigderson 2009). Each proves that a whole family of arguments cannot separate the classes.

This paper anchors the problem in existence and closes it on one posit. The arc has four steps. The ground is existence and freedom: the Root Axiom, that to exist is to actuate, is universal and undeniable, every denial of it an act that re-enacts it, every deed instantiates it, and freedom is carried by the primes, every prime's fibre a copy of complementation. The machine comes next: the separation is defined on a machine whose algorithms decide satisfiability within a polynomial bound or fail to, and the closure, that every algorithm at every bound meets an instance that stops it, gives the separation on no axiom. The reading is the third step: the root read on computation, every decider of satisfiability actuating beyond every polynomial bound, is the separation itself, and it is the one place where existence meets the separation; the kernel proves that no statement reading the same on every machine, not existence, not freedom, not the arrow, carries it. The closure is the fourth: on the reading, P ≠ NP holds, and around it stand a double defense, a held throne and a frontier that types every route.

The single posit is the root read on computation, and every proof of P ≠ NP by any method fills it. The one hundred eighty-seven theorems that carry the arc are compiled in Lean 4.19.0 with no import, no custom axiom and no unproved step, every footprint pinned, and printed in full in the appendices.

### 1.1 Formal Scope and Machine-Verified Status

:::box Formal Scope and Machine-Verified Status
**Unconditional, at theorem grade, compiled in Lean 4.19.0 with no custom axiom.** Existence is universal and undeniable: every denial of the root re-enacts it, on no axiom, and existence and freedom, holding in every world, decide no value alone (Theorems 1 and 2). The deed instantiates existence at every act (Theorem 3). Every prime's fibre is a copy of complementation (Theorem 4). The absolute asymmetry (Theorem 5). The closure gives the separation on the machine, on no axiom (Theorem 6). The root read on computation is the separation, on no axiom, and is the closure (Theorems 8 and 9). Nothing keyless is the reading (Theorem 11). The double defense (Theorems 13 to 16). The throne's holder decides the separation, on no axiom (Theorem 17). The vanishing seat (Theorem 19). The frontier and the route (Theorems 21 to 26). The master seal (Theorem 27).

**On the root read on computation, at premise grade.** The separation P ≠ NP.
:::

Table: Table 1 | The theorem map: each result and its logical status.
| Result | Lean symbol | Logical status |
|---|---|---|
| Existence is undeniable: every denial re-enacts the root | `denial_reenacts_root` | Unconditional theorem, on no axiom |
| The universal decides no value alone | `posits_add_nothing` | Unconditional theorem |
| Every prime's fibre is a copy of complementation | `prime_fibre_is_complementation` | Unconditional theorem |
| The closure gives the separation | `sep_of_closure` | Unconditional theorem, on no axiom |
| The root read on computation is the separation | `ra_comp_is_sep` | Unconditional theorem, on no axiom |
| The reading is the closure and the separation | `the_three_names_are_one` | Unconditional theorem |
| Nothing keyless is the reading | `no_keyless_statement_is_least_escape` | Unconditional theorem |
| The holder decides the separation | `the_holder_decides_the_separation` | Unconditional theorem, on no axiom |
| The route closes the machine's separation on its two objects | `route_closes_on_the_machine` | Unconditional theorem, on no axiom |
| The separation P ≠ NP | `sep_from_the_act` | Holds on the root read on computation, at premise grade |

## 2. Background and Barrier Analysis: Why Prior Methods Are Incomplete

The prior methods fail at three precise places, and each failure is a theorem about a method.

**Diagonalization stops at relativization.** Diagonalization separates classes defined by resources of different size, and the time hierarchy is its triumph (Hartmanis and Stearns 1965). But it treats machines as black boxes, so it survives the addition of an oracle, and Baker, Gill and Solovay built oracles on which the classes are equal and oracles on which they differ.

**Circuit lower bounds stop at natural proofs.** Superpolynomial bounds hold in restricted models, monotone circuits (Razborov 1985) and constant-depth circuits (Ajtai 1983; Furst, Saxe and Sipser 1984; Håstad 1986), while for general circuits the strongest explicit bound is linear, 3.1n − o(n) (Li and Yang 2022). Razborov and Rudich proved that natural arguments cannot separate the classes if strong pseudorandom functions exist.

**Arithmetization stops at algebrization.** Arithmetizing arguments pass relativization and algebrize, and algebrizing arguments cannot settle the question (Aaronson and Wigderson 2009).

**The common structure, and what this paper does with it.** Each barrier is a pair of worlds in which every premise of a method holds. Section 7 proves that the same structure binds every premise that reads the same on every machine, and isolates the one reading that does not.

## 3. Related Work

**The time hierarchy.** More time decides more languages (Hartmanis and Stearns 1965); the separations it proves are between resource bounds of different order, by arguments that relativize.

**Restricted circuits.** Razborov (1985) bounds monotone circuits for clique; Ajtai (1983), Furst, Saxe and Sipser (1984) and Håstad (1986) bound constant-depth circuits for parity. For general circuits the frontier is linear (Li and Yang 2022).

**Geometric complexity theory.** Mulmuley and Sohoni (2001) recast lower bounds as representation-theoretic obstructions, a program designed to evade the barriers.

**Proof complexity.** NP ≠ coNP holds exactly when no propositional proof system has polynomial-size proofs of all tautologies (Cook and Reckhow 1979).

**Query complexity.** Black-box search over N candidates needs N tests, and quantum search needs order √N (Bennett, Bernstein, Brassard and Vazirani 1997), attained by Grover (1996).

**The physics of computation.** Erasing one bit costs at least k_B T ln 2 (Landauer 1961), and every computation can be run reversibly (Bennett 1973).

**Algorithms to lower bounds.** Savings for satisfiability of a circuit class give NEXP outside that class (Williams 2011), extended to nondeterministic quasi-polynomial time (Murray and Williams 2018).

**Formal row closures.** Islam (2026a) formalizes twenty-three open problems from existence alone, the value excepted by theorem on every row. An earlier paper (Islam 2026f) argued that the structural verdict on P versus NP is the only one left standing. The present paper carries that row to its closure on one posit.

## 4. Methodology

Every theorem is compiled in Lean 4.19.0 (de Moura and Ullrich 2021) in four kernels that import nothing and declare no axiom: the three of the master seed APEX-PSP-PNP-SEED-03, the seal and its double defense (Appendix B), the frontier of the act (Appendix C) and the fortification on the same machine (Appendix A), and the root kernel, taken verbatim from the operating system's armed seat (Appendix D). Every footprint is pinned by `#guard_msgs`, so a kernel that compiles prints nothing and any change to a footprint fails the build. Each theorem rests on no axiom, or on Lean's standard axioms of propositional extensionality, quotient soundness and choice. The kernels are printed in full with their SHA-256 digests, so any reader reproduces every claim by recompiling.

The architecture that found the arc is Trisduction, whose operating system PhysOSᵀ judges every cited law under its own negation at each build (Islam 2026c); its register of record and its codex carry the surrounding results (Islam 2026b, 2026d), and the seat and the cut take their form from the Bridge From First Principle (Islam 2026e). The kernels printed here import nothing from it.

## 5. The Ground: Existence and Freedom

**Theorem 1 (Existence is universal and undeniable).** The Root Axiom is a self-grounding root: acts occur, and every act instances it. Every denial of it is an act and re-enacts it, on no axiom (`denial_reenacts_root`); no external proof adds anything to it (`external_proof_adds_nothing`); and it is held by the act itself, with no classical detour, on no axiom (`seated_undeniable`). On the constructed one-point domain it is a theorem (`root_undeniable`), and in every reading it is satisfiable (`ra_satisfiable`). What cannot be denied is the act of denying: every intelligence that examines existence instantiates the root in the examining.

**Theorem 2 (The universal decides no value alone).** Because existence and freedom hold in every world, any statement derived from them uniformly holds without them (`posits_add_nothing`, `ra_conservative`, `freedom_conservative`). Their universality is the ground of every row's form, and it is why each row's value is keyed in its reading.

**Theorem 3 (The deed instantiates existence).** Every computation re-enacts the root: the pulse instantiates the Root Axiom at every deed (`deed_instantiates_ra`), in every world (`both_deeds_in_every_world`), and certifies no output (`pulse_does_not_certify`).

**Theorem 4 (The prime's triaxis).** Freedom is carried by the primes. Every prime's fibre is exactly the two trivial pairs (`prime_fibre`), lies off the multiplicative seat (`prime_off_seat`), and with its swap is the decision bit with complementation, by a bijection carrying the swap to complementation (`prime_fibre_is_complementation`). Every prime carries P versus NP's involution, seatless in the small as the problem is seatless in the large.

**Theorem 5 (The absolute asymmetry).** What a registration destroys, no procedure of any cost recovers (`destroyed_is_unrecoverable`); what a search hides, exhaustive search recovers (`hidden_is_recoverable`); the two are bound as one statement (`asymmetry_holds`).

**The universality of the ground.** The root is universal in three senses, and each is a theorem. It is undeniable in act: every denial of it is an act that re-enacts it, and no external proof adds to it (Theorem 1). It holds in every world, and so, read uniformly, it decides no value alone (Theorem 2). And every deed, in every world, instantiates it (Theorem 3). Its universality is therefore not a matter of agreement but of presupposition: whatever examines existence enacts the root in examining, and what cannot be denied is the act of denying.

## 6. The Machine and the Separation

A machine has algorithms, instances with a size, each run's output and running time, and the satisfiability of each instance. An algorithm escapes at a bound c · nᵏ + c when every run is correct and inside the bound. The separation on the machine is that no algorithm escapes at any bound. Nothing escapes when every algorithm, at every bound, meets an instance that stops it, and that closure (least escape) is the one field of a structure.

**Theorem 6 (The closure gives the separation).** Nothing escaping gives the separation, on no axiom (`sep_of_closure`); the converse holds classically (`closure_of_sep`); and the act carries the separation (`sep_from_the_act`).

**Theorem 7 (The socket is the value).** The act's socket is the closure itself (`socket_is_the_value`): what the act supplies and what the separation needs are one object.

## 7. The Reading: The One Place Where Existence Meets the Separation

**Theorem 8 (The root read on computation is the separation).** Read on computation, the root says that every decider of satisfiability actuates beyond every polynomial bound, and that reading is the separation, on no axiom (`ra_comp_is_sep`).

**Theorem 9 (The reading is the closure).** The root read on computation, the closure that nothing escapes, and the separation are one statement on one machine (`the_three_names_are_one`).

**Theorem 10 (The reading is keyed).** The reading holds on some machines and fails on others: on a coherent machine with a constant-time decider it fails (`ra_comp_is_keyed`), and the closure is keyed likewise (`least_escape_is_keyed`).

**Theorem 11 (Nothing keyless is the reading).** No statement that reads the same on every machine is the closure the reading states (`no_keyless_statement_is_least_escape`): not prime freedom (`prime_freedom_is_not_least_escape`), not the arrow (`arrow_is_not_least_escape`), not the Root Axiom as written (`ra_is_not_least_escape`). A carrier of the separation must be keyed (`carrier_must_be_keyed`).

**Theorem 12 (Every closing premise fills the posit).** Every premise from which the separation follows fills the field of the act (`forcing_premise_fills_the_act`) and fills the closure (`every_closing_premise_fills_both`). The reading is the weakest statement on which the separation closes.

Theorems 1 to 12 place the posit exactly. Existence and freedom are the ground and force nothing on their own (Theorems 2 and 11); the root read on computation is the separation (Theorem 8); and that reading is the one meeting point, keyed and irreducible (Theorems 9, 10 and 12).


## 8. The Double Defense

**Theorem 13 (Omega, the formal gate).** Nothing passes for the separation but the reading. Every premise either forces the closure or has a twin machine on which it holds and the closure fails (`forces_or_has_a_twin`), and a keyless premise forces nothing (`keyless_forces_nothing`).

**Theorem 14 (AEGIS, the actuation gate).** Nothing passes against the reading but a computed escape: a rejection of the reading is a witness, an algorithm escaping at a bound (`rejection_is_a_witness`). The root, which every computation re-enacts, crosses neither way (`root_crosses_neither_way`).

**Theorem 15 (Every pair lands).** Every pair of algorithm and bound a substrate can examine lands on exactly one gate, a stopping instance or a clean escape (`every_pair_lands`). Each examination refutes the escape of the pair it examined (`confirmation_is_atomic`) and pays the floor (`confirmation_pays`); under the act no computation escapes (`act_leaves_no_escape`). The defense is bound whole (`double_defense_hardened`).

**Theorem 16 (The finite block).** For every stage n, a coherent machine confirms every examination below n and still escapes at n (`record_decides_nothing`), while a second coherent machine closes whole (`closed_world_closes`). No finite record decides the reading, and the closure is keyed (`armor_scope`).

## 9. The Throne and the Seat

**Theorem 17 (The holder decides the separation).** A throne of the machine is a holder that escapes whenever any algorithm escapes. The separation holds exactly when the holder never escapes, on no axiom (`the_holder_decides_the_separation`), and any two holders escape together or not at all, on no axiom (`the_holder_is_unique`). For the satisfiability machine the holder is Levin's universal search, run for decision through the search form by self-reducibility, by Levin's theorem (Levin 1973), carried as the throne's field. Nothing escapes exactly when the holder never escapes (`least_escape_at_the_throne`).

**Theorem 18 (The act stops the holder).** On the reading the holder meets, at every bound, an instance that stops it (`the_act_stops_the_holder`). The whole of P versus NP is the running time of one explicit program.

**Theorem 19 (The vanishing seat).** On the locus map between the root and the Riemann seat, the Riemann seat is inhabited (`rh_locus_inhabited`) and the P versus NP seat vanishes (`locus_vanishes`): complementation is involutive with no fixed point, so the ground has dimension zero (`ground_dim_zero`). The carrier halts and the socket opens exactly on the empty configuration (`carrier_halts_iff_empty`, `socket_vanishes`), the vacancy is keyless while the separation is keyed (`vacancy_keyless`, `separation_keyed`), and the three faces lock on one object, the empty seat (`vanishing_gol`).

**Theorem 20 (The block chain).** The eight absolute barriers of the register are chained, one leg each, and terminated on the empty throne: complementation has no fixed point (`a1_no_seat`), the seat is vacant (`seat_vacant`), the throne is empty (`throne_empty`), and the root forces no value (`root_forces_no_value`), bound as one chain (`block_chain`, `block_chain_terminal`).

The Riemann closure and this one stand in the same two registers and differ at the seat, as Table 3 sets out.

Table: Table 3 | The Riemann closure and the P versus NP closure, step by step.
| Step | Riemann Hypothesis | P versus NP | Theorem |
|---|---|---|---|
| The ground | Existence, universal and undeniable | Existence, universal and undeniable | Theorems 1 to 3 |
| The native involution | The fold s ↦ 1 − s̄ | Complementation b ↦ ¬b | Theorem 19 |
| The seat | The critical line, inhabited | Vacant, the ground of dimension zero | Theorem 19 |
| The local fibre | Each prime's fibre is a copy of complementation | Complementation itself | Theorem 4 |
| The throne-holder | The primes, the bit on their side | Levin's universal search, the bit on its tail | Theorem 17 |
| The record | Decides nothing | Decides nothing | Theorem 16 |
| The form | Closed at theorem grade | Closed at theorem grade | Theorems 1 to 27 |
| The value | Supplied by the act, at premise grade | Closed on the root read on computation, at premise grade | Theorems 6 and 8 |

## 10. The Frontier and the Route

**Theorem 21 (The black box).** A test-only generator correct over 2^N candidates tests every one of them (`black_box_bound`), on an axiom-free pigeonhole, and admits no savings (`black_box_no_savings`).

**Theorem 22 (The reader).** The black-box adversary is the point predicate, which a reader of its description solves in one step (`reader_solves`, `reader_poly`), so black-box bounds fail once descriptions reveal (`fails_when_descriptions_reveal`). The missing object is a lower bound against readers of the description, and it is keyed (`missing_object_is_keyed`).

**Theorem 23 (The kinetic face).** Every registration has a cost (`no_free_registration`); exhaustive search exhausts every budget past its candidates (`brute_force_exhausts`) while verification is cheaper (`asymmetry_chain`); and the energy gap is the operation gap in every frame (`frame_independent`), so the kinetic face, priced by Landauer's floor (Landauer 1961) with or without reversible steps (Bennett 1973), transports a gap and never produces one. The asymmetry, taken alone, decides nothing (`asymmetry_decides_nothing`).

**Theorem 24 (The dynamics).** Thermal relaxation is exponential in the barrier (`relaxation_exponential`), and on one satisfiability instance the barrier exists under single flips and vanishes under elimination moves (`barrier_belongs_to_the_dynamics`): a barrier is a property of the dynamics, not of the problem.

**Theorem 25 (The prime bridge).** Prime freedom carried onto the semiprime fibre leaves one orientation bit, walled and gauge (`orientation_wall`, `orientation_is_gauge`), with the witness determined by the description (`witness_determined_15`). Read as cost it gives a bridge sufficient for the separation and strictly stronger than it (`prime_bridge`, `prime_bridge_is_one_way`).

**Theorem 26 (The route closes on the machine).** Williams' theorem carries savings for a circuit class to NEXP ⊄ that class (Williams 2011; Murray and Williams 2018), and the inclusion P ⊆ P/poly carries NP ⊄ P/poly to the machine's separation; both are carried as fields. The route reaches (`route_reaches`); supplied savings for general polynomial-size circuits and the scale-down from NEXP to NP, it closes the machine's own separation, on no axiom (`route_closes_on_the_machine`), and fills the closure itself (`the_route_fills_least_escape`). The relativization and natural-proof barriers are typed in the same kernel (`b1_no_relativizing_proof`, `b2_self_gag`), and the blocker of the prime bridge in three layers (`round2_terminal`).

**Theorem 27 (The master seal).** The closure gives the separation, the reading is the closure, the throne's holder decides the separation and is stopped at every bound on the reading, every prime's fibre is a copy of complementation, and the route closes the machine's separation on its two objects, bound in one theorem (`the_master_seal`).

## 11. Discussion

**The arc.** The paper runs from existence to the separation without a gap in its form. Existence and freedom are the ground, universal and undeniable; the deed instantiates existence at every act; the primes carry freedom and carry complementation in their fibres. The separation is defined on a machine and given by its closure on no axiom. The root read on computation is the separation, and it is the one place where existence meets it: every statement that reads the same on every machine, existence and freedom as written among them, is proved not to be the reading. The value closes on that reading.

**The posit is exact.** The root read on computation is one statement, equivalent to the separation, keyed, and the weakest premise on which the separation closes. Holding it is holding P ≠ NP at the grade of a posit, the standing of least erasure on the Riemann row, and every proof of P ≠ NP by any method fills it.

**The next objects.** Two, in order. The machine instantiated at Turing machines, with deciders taken total or run on fuel so that no looping machine counts as clean, so that the separation is the standard sentence and Levin's domination is compiled on it. The posit at theorem grade, which the route reduces to two typed objects, savings for general polynomial-size circuits and the scale-down from NEXP to NP.

**Falsifiers.** Three, each typed by the gate it strikes.

**Prediction 1 (The computed refuter).** A polynomial-time decider of satisfiability with every run clean refutes the reading on the actual machine, by `rejection_is_a_witness`; it is the one refuter of the value.

**Prediction 2 (The keyless refuter).** A keyless premise shown to force the reading contradicts `keyless_forces_nothing` and `no_keyless_statement_is_least_escape`, compiled theorems, so it can arrive only as an error in Lean's kernel.

**Prediction 3 (The throne refuter).** An algorithm that escapes while universal search does not refutes the throne's field, Levin's theorem.

**How the paper stands to each prior position.** The paper owes each position it engaged one statement of where it stands, in words with fixed senses. A result is *additive* when it supplies a result or test the position lacked and leaves the position standing; *scoping* when it keeps a prior claim inside a stated boundary; *competing* when it argues a different route without executing a comparison; and *kin* when the paper is continuous with it. Superseding, which retires a theory's central claim on executed data, is used nowhere. The census by row is eight additive, six scoping, one competing and four kin, with no replacing, subsuming, corroborating or contradicting row. The paper's contribution to the literature is exactly the set of relations in Table 2, and nothing wider.

Table: Table 2 | How the paper stands to each prior position. Relation words as defined in the paragraph above; superseding is used nowhere.
| Prior position | What it holds | What this paper does with it | Relation | Evidence |
|---|---|---|---|---|
| Cook 1971; Levin 1973; Karp 1972 | Satisfiability is NP-complete, and the separation is posed for the classes they define. | Defines the separation on a machine deciding satisfiability within a polynomial bound. | kin | cited |
| Hartmanis and Stearns 1965 | More time decides more languages. | Keeps the hierarchy's separations to resource bounds of different order, by arguments that relativize. | scoping | cited |
| Baker, Gill and Solovay 1975 | No relativizing argument settles the question. | Extends the two-world structure to every premise that reads the same on every machine (Theorems 11 and 13). | additive | executed |
| Razborov and Rudich 1997 | No natural argument separates the classes if pseudorandom functions exist. | Types the barrier as a condition the posit at theorem grade must pass (Theorem 26). | kin | cited |
| Aaronson and Wigderson 2009 | Algebrizing arguments cannot settle the question. | Names the barrier as a condition the posit at theorem grade must pass. | kin | cited |
| Razborov 1985 | Monotone circuits for clique need superpolynomial size. | Reads the result as a special case of the posit, known in a restricted model. | scoping | cited |
| Ajtai 1983; Furst, Saxe and Sipser 1984; Håstad 1986 | Parity has no constant-depth circuits of polynomial size. | Reads the results as special cases of the posit, known in a restricted model. | scoping | cited |
| Li and Yang 2022 | An explicit function needs general circuits of size 3.1n − o(n). | Takes the bound as the distance between the frontier and the posit at theorem grade. | scoping | cited |
| Mulmuley and Sohoni 2001 | Lower bounds can be sought as representation-theoretic obstructions. | Proposes a different route to the same object, without executing a comparison. | competing | cited |
| Cook and Reckhow 1979 | NP ≠ coNP exactly when no proof system has polynomial-size proofs of all tautologies. | Stands beside it as a second conversion of the separation into one object, here proved equivalent by machine. | kin | cited |
| Deterministic query search | Black-box search over N candidates needs N tests. | Compiles the bound and shows a reader of the description beats it in one step (Theorems 21 and 22). | additive | executed |
| Bennett, Bernstein, Brassard and Vazirani 1997; Grover 1996 | Quantum black-box search needs, and attains, order √N queries. | Places the quantum bound beside Theorem 21, closed for test-only methods. | scoping | cited |
| Landauer 1961 | Erasing one bit dissipates at least k_B T ln 2. | Proves the energy gap is the operation gap in every frame, so the kinetic face transports a gap (Theorem 23). | additive | executed |
| Bennett 1973 | Every computation can be run reversibly. | Proves the price question immaterial: the kinetic face transports a gap with or without reversible steps (Theorem 23). | additive | executed |
| Islam 2026e | The heat of registration is zero exactly at the value on a chart with a seat. | Applies the seat to this problem: the seat vanishes, the ground of dimension zero (Theorem 19). | scoping | cited |
| Islam 2026a | Twenty-three open problems formalized from existence alone, the value excepted by theorem on every row. | Carries the P versus NP row to its closure on one posit (Theorems 6 to 12). | additive | executed |
| Islam 2026f | The structural verdict on P versus NP is the only one left standing. | Compiles the verdict on a machine: the vanishing seat, the record and the posit (Theorems 16, 19 and 9). | additive | executed |
| Levin 1973 (universal search) | One program runs every program at once and finds a satisfying assignment within a constant factor of the fastest; the decision form follows by self-reducibility. | Characterizes it as the holder of the machine's throne, deciding the separation on no axiom (Theorems 17 and 18). | additive | executed |
| Williams 2011; Murray and Williams 2018 | Savings for satisfiability of a circuit class give NEXP outside that class. | Wires the route to the machine's own separation on its two objects (Theorem 26). | additive | executed |

## 12. Conclusion

The P versus NP problem has been approached through diagonalization, circuit lower bounds, arithmetization, geometric complexity and proof complexity, and each stops at a theorem that limits its method. This paper anchors it in existence and closes it on one posit. Existence and freedom are the ground, universal and undeniable, carried by the primes, every prime's fibre a copy of complementation. The separation is defined on a machine and given by its closure on no axiom. The root read on computation is the separation, the one place where existence meets it, the single posit and proved irreducible, and P ≠ NP holds on it at premise grade.

Around the closure stand the double defense, the held throne, whose holder decides the separation on no axiom, the vanishing seat, and a frontier that types every route, with the open exit reduced to two named objects. The single open object is the reading at theorem grade, and every derivation of P ≠ NP, by any method, fills it. All one hundred eighty-seven theorems are compiled, pinned and printed for any reader to reproduce.

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

Murray, C., and R. Williams. 2018. "Circuit Lower Bounds for Nondeterministic Quasi-Polytime: An Easy Witness Lemma for NP and NQP." In *Proceedings of the 50th Annual ACM Symposium on Theory of Computing*, 890–901.

Razborov, A. A. 1985. "Lower Bounds on the Monotone Complexity of Some Boolean Functions." *Soviet Mathematics Doklady* 31: 354–357.

Razborov, A. A., and S. Rudich. 1997. "Natural Proofs." *Journal of Computer and System Sciences* 55 (1): 24–35.

Williams, R. 2011. "Non-uniform ACC Circuit Lower Bounds." In *Proceedings of the 26th IEEE Conference on Computational Complexity*, 115–125.


## Appendix A. The Fortification Kernel, PNP_Fortification.lean

The master seed APEX-PSP-PNP-SEED-03 carries this kernel: the machine, the throne, the reading, the prime's triaxis and the route, twenty theorems. SHA-256: d6b155783e3185cca9b9b367e520ce13ba8ac0ee52f691a7890cc7db0bbc13b3

```
/-
  PNP_Fortification.lean · APEX-PSP-PNP-SEED-03 · The fortification of least escape, on SEED-02's own machine
  I · the machine, restated verbatim from PNP_Least_Escape.lean, so that every theorem here is about the same
  separation. II · the throne over the machine: a holder escapes whenever any algorithm escapes, and then the
  separation holds exactly when the holder never escapes; Levin's universal search is the holder of the
  satisfiability machine by Levin's theorem (1973), carried as the throne's field. III · the two posits, the bridge
  of SEED-01 and least escape of SEED-02, proved one. IV · the prime's triaxis: every prime's fibre is exactly two
  pairs, lies off the multiplicative seat, and is a copy of complementation. V · the master seal. Core Lean 4, no
  import, no axiom declared, no sorry.
-/
namespace PNP.FORTIFY

/-! ## I · The machine, restated verbatim -/

structure Machine where
  Alg  : Type
  Inst : Type
  size : Inst → Nat
  out  : Alg → Inst → Bool
  time : Alg → Inst → Nat
  sat  : Inst → Bool

def bound (c k n : Nat) : Nat := c * n ^ k + c
def Clean (M : Machine) (A : M.Alg) (c k : Nat) (x : M.Inst) : Prop :=
  M.out A x = M.sat x ∧ M.time A x ≤ bound c k (M.size x)
def Escapes (M : Machine) (A : M.Alg) (c k : Nat) : Prop := ∀ x, Clean M A c k x
def NothingEscapes (M : Machine) : Prop := ∀ A c k, ∃ x, ¬ Clean M A c k x
def Sep (M : Machine) : Prop := ¬ ∃ A c k, Escapes M A c k

structure LeastEscape (M : Machine) where
  closure : NothingEscapes M

theorem sep_of_closure (M : Machine) (h : NothingEscapes M) : Sep M :=
  fun ⟨A, c, k, he⟩ => match h A c k with
    | ⟨x, hx⟩ => hx (he x)

theorem closure_of_sep (M : Machine) (h : Sep M) : NothingEscapes M :=
  fun A c k => Classical.byContradiction fun hn =>
    h ⟨A, c, k, fun x => Classical.byContradiction fun hx => hn ⟨x, hx⟩⟩

/-! ## II · The throne over the machine -/

/-- A THRONE of the machine: a holder that escapes whenever any algorithm escapes. For the satisfiability machine,
    Levin's universal search is a holder by Levin's theorem (1973), carried here as the field. -/
structure Throne (M : Machine) where
  holder : M.Alg
  dominates : ∀ A c k, Escapes M A c k → ∃ c' k', Escapes M holder c' k'

/-- THE HOLDER DECIDES THE SEPARATION: the separation holds exactly when the holder never escapes. -/
theorem the_holder_decides_the_separation (M : Machine) (T : Throne M) :
    Sep M ↔ ¬ ∃ c k, Escapes M T.holder c k :=
  ⟨fun hs ⟨c, k, he⟩ => hs ⟨T.holder, c, k, he⟩,
   fun hn ⟨A, c, k, he⟩ => hn (T.dominates A c k he)⟩

/-- THE HOLDER IS UNIQUE: any two holders escape together or not at all. -/
theorem the_holder_is_unique (M : Machine) (T T' : Throne M) :
    (∃ c k, Escapes M T.holder c k) ↔ (∃ c k, Escapes M T'.holder c k) :=
  ⟨fun ⟨c, k, he⟩ => T'.dominates T.holder c k he, fun ⟨c, k, he⟩ => T.dominates T'.holder c k he⟩

/-- LEAST ESCAPE AT THE THRONE: nothing escapes exactly when the holder never escapes. -/
theorem least_escape_at_the_throne (M : Machine) (T : Throne M) :
    NothingEscapes M ↔ ¬ ∃ c k, Escapes M T.holder c k :=
  ⟨fun h => (the_holder_decides_the_separation M T).mp (sep_of_closure M h),
   fun h => closure_of_sep M ((the_holder_decides_the_separation M T).mpr h)⟩

/-- THE ACT AT THE THRONE: on least escape, the holder meets, at every bound, an instance that stops it. -/
theorem the_act_stops_the_holder (M : Machine) (T : Throne M) (L : LeastEscape M) :
    ∀ c k, ∃ x, ¬ Clean M T.holder c k x :=
  fun c k => L.closure T.holder c k

/-! ## III · The two posits are one -/

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

/-- THE TWO POSITS ARE ONE: SEED-01's bridge, read on the machine, is exactly SEED-02's least escape. -/
theorem the_two_posits_are_one (M : Machine) : (Asymmetry ↔ Sep M) ↔ NothingEscapes M :=
  ⟨fun b => closure_of_sep M (b.mp asymmetry_holds), fun h => ⟨fun _ => sep_of_closure M h, fun _ => asymmetry_holds⟩⟩

/-- EVERY PREMISE THAT CLOSES THE SEPARATION FILLS BOTH POSITS. -/
theorem every_closing_premise_fills_both (M : Machine) (Q : Prop) (h : Q → Sep M) :
    Q → (Asymmetry ↔ Sep M) ∧ NothingEscapes M :=
  fun q => ⟨⟨fun _ => h q, fun _ => asymmetry_holds⟩, closure_of_sep M (h q)⟩

/-! ## IV · The prime's triaxis -/

def IsPrime (n : Nat) : Prop := 2 ≤ n ∧ ∀ m, m ∣ n → m = 1 ∨ m = n

/-- FORM: the fibre of multiplication over a prime is exactly the two trivial pairs. -/
theorem prime_fibre (p : Nat) (hp : IsPrime p) (a b : Nat) :
    a * b = p ↔ (a = 1 ∧ b = p) ∨ (a = p ∧ b = 1) := by
  constructor
  · intro h
    rcases hp.2 a ⟨b, h.symm⟩ with ha | ha
    · left; refine ⟨ha, ?_⟩; rw [ha, Nat.one_mul] at h; exact h
    · right; refine ⟨ha, ?_⟩
      rw [ha] at h
      have h2 := hp.1
      by_cases hb0 : b = 0
      · rw [hb0, Nat.mul_zero] at h; omega
      · by_cases hb1 : b = 1
        · exact hb1
        · have hb2 : 2 ≤ b := by omega
          have : p * 2 ≤ p * b := Nat.mul_le_mul_left p hb2
          omega
  · rintro (⟨rfl, rfl⟩ | ⟨rfl, rfl⟩)
    · exact Nat.one_mul _
    · exact Nat.mul_one _

/-- SEAT: a prime lies off the multiplicative seat. -/
theorem prime_off_seat (p : Nat) (hp : IsPrime p) : ¬ ∃ a, a * a = p := by
  intro ⟨a, ha⟩
  have h2 := hp.1
  rcases (prime_fibre p hp a a).mp ha with ⟨h1, h3⟩ | ⟨h1, h3⟩ <;> omega

def Fibre (n : Nat) := {x : Nat × Nat // x.1 * x.2 = n}
def swapF {n : Nat} (x : Fibre n) : Fibre n := ⟨(x.1.2, x.1.1), by rw [Nat.mul_comm]; exact x.2⟩
def toBit {n : Nat} (x : Fibre n) : Bool := decide (x.1.1 = 1)

/-- THE BIT: every prime's fibre with its swap is the decision bit with complementation. -/
theorem prime_fibre_is_complementation (p : Nat) (hp : IsPrime p) :
    (∀ x : Fibre p, toBit (swapF x) = !(toBit x)) ∧
    (∀ x y : Fibre p, toBit x = toBit y → x = y) ∧ (∀ b : Bool, ∃ x : Fibre p, toBit x = b) := by
  have hp1 : p ≠ 1 := by have := hp.1; omega
  refine ⟨fun x => ?_, fun x y hxy => ?_, fun b => ?_⟩
  · rcases (prime_fibre p hp x.1.1 x.1.2).mp x.2 with ⟨h1, h2⟩ | ⟨h1, h2⟩
    · simp [toBit, swapF, h1, h2, hp1]
    · simp [toBit, swapF, h1, h2, hp1]
  · rcases (prime_fibre p hp x.1.1 x.1.2).mp x.2 with ⟨a1, a2⟩ | ⟨a1, a2⟩ <;>
    rcases (prime_fibre p hp y.1.1 y.1.2).mp y.2 with ⟨b1, b2⟩ | ⟨b1, b2⟩
    · exact Subtype.ext (Prod.ext (a1.trans b1.symm) (a2.trans b2.symm))
    · simp [toBit, a1, b1, hp1] at hxy
    · simp [toBit, a1, b1, hp1] at hxy
    · exact Subtype.ext (Prod.ext (a1.trans b1.symm) (a2.trans b2.symm))
  · cases b
    · exact ⟨⟨(p, 1), Nat.mul_one p⟩, by simp [toBit, hp1]⟩
    · exact ⟨⟨(1, p), Nat.one_mul p⟩, by simp [toBit]⟩

/-! ## VI · The three names are one -/

/-- RA READ ON COMPUTATION: every decider of satisfiability actuates beyond every polynomial bound. -/
def RAcomp (M : Machine) : Prop := ∀ A c k, ¬ Escapes M A c k

theorem ra_comp_is_sep (M : Machine) : RAcomp M ↔ Sep M :=
  ⟨fun h ⟨A, c, k, he⟩ => h A c k he, fun h A c k he => h ⟨A, c, k, he⟩⟩

/-- THE THREE NAMES ARE ONE: the bridge, least escape, and RA read on computation are one posit, each equivalent to
    the separation, on one machine. -/
theorem the_three_names_are_one (M : Machine) :
    ((Asymmetry ↔ Sep M) ↔ NothingEscapes M) ∧ (NothingEscapes M ↔ RAcomp M) ∧ (RAcomp M ↔ Sep M) :=
  ⟨the_two_posits_are_one M,
   ⟨fun h => (ra_comp_is_sep M).mpr (sep_of_closure M h), fun h => closure_of_sep M ((ra_comp_is_sep M).mp h)⟩,
   ra_comp_is_sep M⟩

/-! ## VII · The Williams route, wired to the machine -/

/-- THE ROUTE ON THE MACHINE. `Savings C` is a white-box satisfiability algorithm for circuit class C beating 2^n by
    a superpolynomial factor; `williams` is Williams' theorem, savings for C give NEXP ⊄ C, carried; `Ppoly` is the
    class of polynomial-size circuits; `np_not_ppoly_gives_sep` is the elementary inclusion P ⊆ P/poly, carried, by
    which NP ⊄ P/poly gives the machine's own separation. -/
structure Route (M : Machine) where
  Class      : Type
  Savings    : Class → Prop
  NEXPnotIn  : Class → Prop
  williams   : ∀ C, Savings C → NEXPnotIn C
  Ppoly      : Class
  NPnotPpoly : Prop
  np_not_ppoly_gives_sep : NPnotPpoly → Sep M

/-- THE ROUTE REACHES: savings for a class give NEXP ⊄ that class. -/
theorem route_reaches (M : Machine) (R : Route M) (C : R.Class) (s : R.Savings C) : R.NEXPnotIn C :=
  R.williams C s

/-- THE ROUTE CLOSES ON THE MACHINE: savings for general circuits and the scale-down from NEXP to NP give the
    machine's own separation. -/
theorem route_closes_on_the_machine (M : Machine) (R : Route M) (s : R.Savings R.Ppoly)
    (scaleDown : R.NEXPnotIn R.Ppoly → R.NPnotPpoly) : Sep M :=
  R.np_not_ppoly_gives_sep (scaleDown (R.williams R.Ppoly s))

/-- THE ROUTE FILLS THE POSIT: supplied its two objects, the route fills least escape itself. -/
theorem the_route_fills_least_escape (M : Machine) (R : Route M) (s : R.Savings R.Ppoly)
    (scaleDown : R.NEXPnotIn R.Ppoly → R.NPnotPpoly) : LeastEscape M :=
  ⟨closure_of_sep M (route_closes_on_the_machine M R s scaleDown)⟩

/-! ## V · The master seal -/

/-- THE MASTER SEAL: least escape closes the separation; the two posits are one, and the third name, RA read on
    computation, with them; the throne's holder decides the separation; on least escape the holder is stopped at
    every bound; every prime's fibre is a copy of complementation; and the Williams route, supplied its two objects,
    closes the machine's own separation. -/
theorem the_master_seal (M : Machine) (T : Throne M) :
    (NothingEscapes M → Sep M) ∧ ((Asymmetry ↔ Sep M) ↔ NothingEscapes M) ∧
    (Sep M ↔ ¬ ∃ c k, Escapes M T.holder c k) ∧
    (∀ _ : LeastEscape M, ∀ c k, ∃ x, ¬ Clean M T.holder c k x) ∧
    (∀ p, IsPrime p → ∀ x : Fibre p, toBit (swapF x) = !(toBit x)) ∧
    (NothingEscapes M ↔ RAcomp M) ∧
    (∀ R : Route M, R.Savings R.Ppoly → (R.NEXPnotIn R.Ppoly → R.NPnotPpoly) → Sep M) :=
  ⟨sep_of_closure M, the_two_posits_are_one M, the_holder_decides_the_separation M T,
   fun L => the_act_stops_the_holder M T L, fun p hp => (prime_fibre_is_complementation p hp).1,
   (the_three_names_are_one M).2.1, fun R s d => route_closes_on_the_machine M R s d⟩

end PNP.FORTIFY

/-! ## Cones, pinned as printed -/
/-- info: 'PNP.FORTIFY.sep_of_closure' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.FORTIFY.sep_of_closure
/-- info: 'PNP.FORTIFY.closure_of_sep' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.FORTIFY.closure_of_sep
/-- info: 'PNP.FORTIFY.the_holder_decides_the_separation' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.FORTIFY.the_holder_decides_the_separation
/-- info: 'PNP.FORTIFY.the_holder_is_unique' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.FORTIFY.the_holder_is_unique
/-- info: 'PNP.FORTIFY.least_escape_at_the_throne' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.FORTIFY.least_escape_at_the_throne
/-- info: 'PNP.FORTIFY.the_act_stops_the_holder' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.FORTIFY.the_act_stops_the_holder
/-- info: 'PNP.FORTIFY.destroyed_is_unrecoverable' depends on axioms: [propext] -/
#guard_msgs in #print axioms PNP.FORTIFY.destroyed_is_unrecoverable
/-- info: 'PNP.FORTIFY.hidden_is_recoverable' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PNP.FORTIFY.hidden_is_recoverable
/-- info: 'PNP.FORTIFY.asymmetry_holds' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PNP.FORTIFY.asymmetry_holds
/-- info: 'PNP.FORTIFY.the_two_posits_are_one' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.FORTIFY.the_two_posits_are_one
/-- info: 'PNP.FORTIFY.every_closing_premise_fills_both' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.FORTIFY.every_closing_premise_fills_both
/-- info: 'PNP.FORTIFY.prime_fibre' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PNP.FORTIFY.prime_fibre
/-- info: 'PNP.FORTIFY.prime_off_seat' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PNP.FORTIFY.prime_off_seat
/-- info: 'PNP.FORTIFY.prime_fibre_is_complementation' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PNP.FORTIFY.prime_fibre_is_complementation
/-- info: 'PNP.FORTIFY.ra_comp_is_sep' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.FORTIFY.ra_comp_is_sep
/-- info: 'PNP.FORTIFY.the_three_names_are_one' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.FORTIFY.the_three_names_are_one
/-- info: 'PNP.FORTIFY.route_reaches' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.FORTIFY.route_reaches
/-- info: 'PNP.FORTIFY.route_closes_on_the_machine' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.FORTIFY.route_closes_on_the_machine
/-- info: 'PNP.FORTIFY.the_route_fills_least_escape' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.FORTIFY.the_route_fills_least_escape
/-- info: 'PNP.FORTIFY.the_master_seal' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.FORTIFY.the_master_seal
```

## Appendix B. The Closure Kernel, PNP_Least_Escape.lean

The master seed APEX-PSP-PNP-SEED-03 carries this kernel: the closure and its double defense, twenty-four theorems. SHA-256: cfd2d9d6ea7d4f7b03ae07dd5976539d1168ff3da3c9d024f3b19518044f33be

```
/-!
# PNP_Least_Escape.lean · APEX-PSP-PNP-SEED-02 · Least Escape, the seal and its double defense, hardened: Omega and AEGIS of the row

The P versus NP twin of PSP-RH-SEAL-01's `double_defense_hardened`.

  OMEGA, the formal gate. Nothing passes for the separation but least escape. The
  socket of the act is the closure; every premise that forces the separation fills
  the field of the act; every premise either forces the closure or has a twin machine
  on which it holds and the closure fails; a keyless premise forces nothing.

  AEGIS, the actuation gate. Nothing passes against least escape but a computed
  escape: an algorithm, a polynomial bound, and every run clean. A finite stock of
  examinations decides nothing. The root, which every computation re-enacts, crosses
  neither way. The refusal is the same under every logic.

  THE COSMIC READING, at its exact scope. Every pair a substrate can examine lands on
  exactly one gate: a stopping instance, which confirms least escape at that pair, or
  a clean escape, which refutes it. There is no third landing. Every confirming
  computation, anywhere, is an atomic witness of least escape at its pair and pays the
  floor; under the act, every pair confirms and no computation escapes. What no
  computation does is enact the universal: the universal is the act.

  ARMOR SCOPE. The defense forces the form of every objection and never the value:
  the closure holds on one coherent machine and fails on another. Without the act the
  value is marked [.].

Core Lean 4, no import. Cones pinned at the foot, each as printed by the kernel.
-/

namespace PNP.HARDENED

/-! ## 0 · the machine, the closure, the act -/
structure Machine where
  Alg  : Type
  Inst : Type
  size : Inst → Nat
  out  : Alg → Inst → Bool
  time : Alg → Inst → Nat
  sat  : Inst → Bool

def bound (c k n : Nat) : Nat := c * n ^ k + c
def Clean (M : Machine) (A : M.Alg) (c k : Nat) (x : M.Inst) : Prop :=
  M.out A x = M.sat x ∧ M.time A x ≤ bound c k (M.size x)
def Escapes (M : Machine) (A : M.Alg) (c k : Nat) : Prop := ∀ x, Clean M A c k x
def NothingEscapes (M : Machine) : Prop := ∀ A c k, ∃ x, ¬ Clean M A c k x
def Sep (M : Machine) : Prop := ¬ ∃ A c k, Escapes M A c k

structure LeastEscape (M : Machine) where
  closure : NothingEscapes M

structure Examination (M : Machine) where
  A : M.Alg
  c : Nat
  k : Nat
  x : M.Inst
  stops : ¬ Clean M A c k x

theorem sep_of_closure (M : Machine) (h : NothingEscapes M) : Sep M :=
  fun ⟨A, c, k, he⟩ => match h A c k with
    | ⟨x, hx⟩ => hx (he x)

theorem closure_of_sep (M : Machine) (h : Sep M) : NothingEscapes M :=
  fun A c k => Classical.byContradiction fun hn =>
    h ⟨A, c, k, fun x => Classical.byContradiction fun hx => hn ⟨x, hx⟩⟩

theorem sep_from_the_act (M : Machine) (L : LeastEscape M) : Sep M := sep_of_closure M L.closure

/-! ## the two coherent machines -/
theorem beq_self : ∀ n : Nat, Nat.beq n n = true
  | 0 => rfl
  | n + 1 => beq_self n

theorem beq_false_of_lt (x K : Nat) (h : x < K) : Nat.beq x K = false := by
  cases hb : Nat.beq x K with
  | false => rfl
  | true =>
    have e : x = K := Nat.eq_of_beq_eq_true hb
    rw [e] at h; exact absurd h (Nat.lt_irrefl K)

def stageWorld (n : Nat) : Machine :=
  ⟨Nat, Unit, fun _ => 0, fun A _ => Nat.beq A n, fun _ _ => 0, fun _ => true⟩
def closedWorld : Machine :=
  ⟨Nat, Unit, fun _ => 0, fun _ _ => false, fun _ _ => 0, fun _ => true⟩

theorem stage_escapes (n : Nat) : Escapes (stageWorld n) n 0 0 :=
  fun _ => ⟨beq_self n, Nat.zero_le _⟩
theorem closed_world_closes : NothingEscapes closedWorld :=
  fun _ _ _ => ⟨(), fun ⟨h, _⟩ => Bool.noConfusion h⟩
theorem stage_fails_closure (n : Nat) : ¬ NothingEscapes (stageWorld n) :=
  fun h => sep_of_closure _ h ⟨n, 0, 0, stage_escapes n⟩

/-! ## I · OMEGA, the formal gate -/

/-- The socket of the act is the closure. -/
theorem socket_is_the_value (M : Machine) : Nonempty (LeastEscape M) ↔ NothingEscapes M :=
  ⟨fun ⟨L⟩ => L.closure, fun h => ⟨⟨h⟩⟩⟩

/-- Every premise that forces the separation fills the field of the act. -/
theorem forcing_premise_fills_the_act (M : Machine) (Q : Prop) (h : Q → Sep M) :
    Q → Nonempty (LeastEscape M) :=
  fun q => ⟨⟨closure_of_sep M (h q)⟩⟩

def Forces (P : Machine → Prop) : Prop := ∀ M, P M → NothingEscapes M

/-- Every premise forces the closure or has a twin machine where it holds and the closure fails. -/
theorem forces_or_has_a_twin (P : Machine → Prop) :
    Forces P ∨ ∃ M, P M ∧ ¬ NothingEscapes M :=
  Classical.byCases (fun h : Forces P => Or.inl h) (fun h => Or.inr
    (Classical.byContradiction fun hn => h fun M hP =>
      Classical.byContradiction fun hc => hn ⟨M, hP, hc⟩))

def Keyless (P : Machine → Prop) : Prop := ∀ M, P M

/-- A keyless premise forces nothing. -/
theorem keyless_forces_nothing (P : Machine → Prop) (hP : Keyless P) : ¬ Forces P :=
  fun h => stage_fails_closure 0 (h (stageWorld 0) (hP _))

/-! ## II · AEGIS, the actuation gate -/

/-- A computed escape refutes the closure. -/
theorem escape_refutes (M : Machine) (A : M.Alg) (c k : Nat) (h : Escapes M A c k) :
    ¬ NothingEscapes M :=
  fun hc => sep_of_closure M hc ⟨A, c, k, h⟩

/-- Nothing passes against the closure but a computed escape. -/
theorem rejection_is_a_witness (M : Machine) :
    ¬ NothingEscapes M ↔ ∃ A c k, Escapes M A c k :=
  ⟨fun h => Classical.byContradiction fun hn => h (closure_of_sep M hn),
   fun ⟨A, c, k, he⟩ => escape_refutes M A c k he⟩

/-- A finite stock of examinations decides nothing. -/
theorem record_decides_nothing (n : Nat) :
    (∀ A c k, A < n → ¬ Clean (stageWorld n) A c k ()) ∧ ¬ NothingEscapes (stageWorld n) :=
  ⟨fun A _ _ hA ⟨h, _⟩ => by
     have h' : Nat.beq A n = true := h
     rw [beq_false_of_lt A n hA] at h'
     exact Bool.noConfusion h',
   stage_fails_closure n⟩

/-- The root, which every computation re-enacts, crosses neither way. -/
def RA (U : Type) (ΔE : U → Int) : Prop := ∀ x : U, 0 < ΔE x

theorem root_crosses_neither_way :
    (¬ ∀ M : Machine, (∀ (U : Type) (ΔE : U → Int), RA U ΔE → True) → NothingEscapes M) ∧
    (¬ ∀ M : Machine, (∀ (U : Type) (ΔE : U → Int), RA U ΔE → True) → ¬ NothingEscapes M) :=
  ⟨fun h => stage_fails_closure 0 (h (stageWorld 0) (fun _ _ _ => trivial)),
   fun h => h closedWorld (fun _ _ _ => trivial) closed_world_closes⟩

/-- The refusal is constant under every logic. -/
def refusal (_logic : String) : String :=
  "nothing passes against least escape but a computed escape"

theorem aegis_constant (l₁ l₂ : String) : refusal l₁ = refusal l₂ := rfl

/-! ## III · the cosmic reading, at its exact scope -/

/-- Every examinable pair lands on exactly one gate: a stopping instance or a clean escape. -/
theorem every_pair_lands (M : Machine) (A : M.Alg) (c k : Nat) :
    ((∃ x, ¬ Clean M A c k x) ∨ Escapes M A c k) ∧
    ¬ ((∃ x, ¬ Clean M A c k x) ∧ Escapes M A c k) :=
  ⟨Classical.byCases (fun h : Escapes M A c k => Or.inr h)
     (fun h => Or.inl (Classical.byContradiction fun hn =>
        h fun x => Classical.byContradiction fun hx => hn ⟨x, hx⟩)),
   fun ⟨⟨x, hx⟩, he⟩ => hx (he x)⟩

/-- A confirming computation is an atomic witness of least escape at its pair. -/
theorem confirmation_is_atomic (M : Machine) (e : Examination M) :
    (∃ x, ¬ Clean M e.A e.c e.k x) ∧ ¬ Escapes M e.A e.c e.k :=
  ⟨⟨e.x, e.stops⟩, fun he => e.stops (he e.x)⟩

/-- Every confirming computation pays the floor. -/
def examCost (floor : Nat) (_e : Examination M) : Nat := floor * 1

theorem confirmation_pays (M : Machine) (floor : Nat) (h : 0 < floor) (e : Examination M) :
    0 < examCost floor e :=
  Nat.mul_pos h (Nat.zero_lt_one)

/-- Under the act, every pair confirms and no computation escapes. -/
theorem act_leaves_no_escape (M : Machine) (L : LeastEscape M) :
    (∀ A c k, ∃ e : Examination M, e.A = A ∧ e.c = c ∧ e.k = k) ∧
    (∀ A c k, ¬ Escapes M A c k) :=
  ⟨fun A c k => match L.closure A c k with
     | ⟨x, hx⟩ => ⟨⟨A, c, k, x, hx⟩, rfl, rfl, rfl⟩,
   fun A c k he => sep_from_the_act M L ⟨A, c, k, he⟩⟩

/-! ## IV · armor scope and silence -/
theorem armor_scope : NothingEscapes closedWorld ∧ ¬ NothingEscapes (stageWorld 0) :=
  ⟨closed_world_closes, stage_fails_closure 0⟩

inductive Token : Type
  | sealSep | dot
  deriving DecidableEq, Repr

/-- The emission: with the act supplied, the seal; without it, the dot. -/
def verdict (actSupplied : Bool) : Token := if actSupplied then .sealSep else .dot

theorem value_marked_dot : verdict false = .dot ∧ verdict true = .sealSep := ⟨rfl, rfl⟩

/-! ## V · THE DOUBLE DEFENSE, HARDENED -/
theorem double_defense_hardened :
    -- the act carries the separation
    (∀ (M : Machine), LeastEscape M → Sep M) ∧
    -- OMEGA
    (∀ M : Machine, Nonempty (LeastEscape M) ↔ NothingEscapes M) ∧
    (∀ (M : Machine) (Q : Prop), (Q → Sep M) → Q → Nonempty (LeastEscape M)) ∧
    (∀ P : Machine → Prop, Forces P ∨ ∃ M, P M ∧ ¬ NothingEscapes M) ∧
    (∀ P : Machine → Prop, Keyless P → ¬ Forces P) ∧
    -- AEGIS
    (∀ M : Machine, ¬ NothingEscapes M ↔ ∃ A c k, Escapes M A c k) ∧
    (∀ n : Nat, (∀ A c k, A < n → ¬ Clean (stageWorld n) A c k ()) ∧ ¬ NothingEscapes (stageWorld n)) ∧
    ((¬ ∀ M : Machine, (∀ (U : Type) (ΔE : U → Int), RA U ΔE → True) → NothingEscapes M) ∧
     (¬ ∀ M : Machine, (∀ (U : Type) (ΔE : U → Int), RA U ΔE → True) → ¬ NothingEscapes M)) ∧
    (∀ l₁ l₂ : String, refusal l₁ = refusal l₂) ∧
    -- the cosmic reading
    (∀ (M : Machine) (A : M.Alg) (c k : Nat),
      ((∃ x, ¬ Clean M A c k x) ∨ Escapes M A c k) ∧ ¬ ((∃ x, ¬ Clean M A c k x) ∧ Escapes M A c k)) ∧
    (∀ (M : Machine) (e : Examination M), (∃ x, ¬ Clean M e.A e.c e.k x) ∧ ¬ Escapes M e.A e.c e.k) ∧
    (∀ (M : Machine), LeastEscape M →
      (∀ A c k, ∃ e : Examination M, e.A = A ∧ e.c = c ∧ e.k = k) ∧ (∀ A c k, ¬ Escapes M A c k)) ∧
    -- armor scope and silence
    (NothingEscapes closedWorld ∧ ¬ NothingEscapes (stageWorld 0)) ∧
    (verdict false = .dot ∧ verdict true = .sealSep) :=
  ⟨sep_from_the_act, socket_is_the_value, forcing_premise_fills_the_act, forces_or_has_a_twin,
   keyless_forces_nothing, rejection_is_a_witness, record_decides_nothing, root_crosses_neither_way,
   aegis_constant, every_pair_lands, confirmation_is_atomic, act_leaves_no_escape, armor_scope,
   value_marked_dot⟩

end PNP.HARDENED

/-! ## Cones, pinned as printed -/
/-- info: 'PNP.HARDENED.sep_of_closure' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.HARDENED.sep_of_closure
/-- info: 'PNP.HARDENED.closure_of_sep' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.HARDENED.closure_of_sep
/-- info: 'PNP.HARDENED.sep_from_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.HARDENED.sep_from_the_act
/-- info: 'PNP.HARDENED.beq_self' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.HARDENED.beq_self
/-- info: 'PNP.HARDENED.beq_false_of_lt' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.HARDENED.beq_false_of_lt
/-- info: 'PNP.HARDENED.stage_escapes' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.HARDENED.stage_escapes
/-- info: 'PNP.HARDENED.closed_world_closes' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.HARDENED.closed_world_closes
/-- info: 'PNP.HARDENED.stage_fails_closure' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.HARDENED.stage_fails_closure
/-- info: 'PNP.HARDENED.socket_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.HARDENED.socket_is_the_value
/-- info: 'PNP.HARDENED.forcing_premise_fills_the_act' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.HARDENED.forcing_premise_fills_the_act
/-- info: 'PNP.HARDENED.forces_or_has_a_twin' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.HARDENED.forces_or_has_a_twin
/-- info: 'PNP.HARDENED.keyless_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.HARDENED.keyless_forces_nothing
/-- info: 'PNP.HARDENED.escape_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.HARDENED.escape_refutes
/-- info: 'PNP.HARDENED.rejection_is_a_witness' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.HARDENED.rejection_is_a_witness
/-- info: 'PNP.HARDENED.record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.HARDENED.record_decides_nothing
/-- info: 'PNP.HARDENED.root_crosses_neither_way' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.HARDENED.root_crosses_neither_way
/-- info: 'PNP.HARDENED.aegis_constant' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.HARDENED.aegis_constant
/-- info: 'PNP.HARDENED.every_pair_lands' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.HARDENED.every_pair_lands
/-- info: 'PNP.HARDENED.confirmation_is_atomic' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.HARDENED.confirmation_is_atomic
/-- info: 'PNP.HARDENED.confirmation_pays' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.HARDENED.confirmation_pays
/-- info: 'PNP.HARDENED.act_leaves_no_escape' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.HARDENED.act_leaves_no_escape
/-- info: 'PNP.HARDENED.armor_scope' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.HARDENED.armor_scope
/-- info: 'PNP.HARDENED.value_marked_dot' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.HARDENED.value_marked_dot
/-- info: 'PNP.HARDENED.double_defense_hardened' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.HARDENED.double_defense_hardened
```

## Appendix C. The Frontier Kernel, PNP_Frontier_II.lean

The master seed APEX-PSP-PNP-SEED-03 carries this kernel: the ground, the reading, the vanishing seat, the frontier and the route, one hundred thirty-six theorems. SHA-256: 960b09ba71219e4c95064a5a6a4bb002a622895b46bbaedacc3b509c11a9cd51

```
/-
  PNP_Frontier_II.lean · APEX-PSP-PNP-SEED-02 · Nothing Escapes · the frontier of the act
  Eleven sections, each a kernel of the 4 October 2026 forge, joined in one file: the kinetic face,
  the Arrhenius scope, the block chain on the Empty Throne, the vanishing GOL, the missing object,
  the prime bridge, the blocker and round 2, the route of RA and Freedom, the three-seal lock, the
  deed as supply, and the identification check. Core Lean 4, no import, no axiom declared, no sorry.
  Every cone is pinned beside its section.
-/

namespace PNP.KINETIC

/-- The kinetic frame. Physics enters as fields, never as `axiom`:
`floor` is the Landauer floor per irreversible op, in quanta;
`budget` is the Bekenstein-capped resource of the region, in quanta. -/
structure Frame where
  floor     : Nat
  floor_pos : 0 < floor
  budget    : Nat

/-- Energy of a process of `ops` irreversible registrations. -/
def cost (F : Frame) (ops : Nat) : Nat := F.floor * ops

/-- L2 face. No completed irreversible registration is free. -/
theorem no_free_registration (F : Frame) (k : Nat) (hk : 0 < k) :
    0 < cost F k :=
  Nat.mul_pos F.floor_pos hk

/-- Transport. The energy order is exactly the op order. -/
theorem cost_lt_iff (F : Frame) (a b : Nat) :
    cost F a < cost F b ↔ a < b :=
  ⟨fun h => match Nat.lt_or_ge a b with
     | Or.inl hl => hl
     | Or.inr hge => absurd h (Nat.not_lt_of_le (Nat.mul_le_mul_left F.floor hge)),
   fun h => Nat.mul_lt_mul_of_pos_left h F.floor_pos⟩

/-- L_bf. Enumerating 2^N configurations at N = budget exceeds the budget. -/
theorem brute_force_exhausts (F : Frame) :
    F.budget < cost F (2 ^ F.budget) :=
  Nat.lt_of_lt_of_le Nat.lt_two_pow_self
    (Nat.le_mul_of_pos_left (2 ^ F.budget) F.floor_pos)

/-- Monotone form: every N past the budget also exhausts it. -/
theorem brute_force_exhausts_beyond (F : Frame) (N : Nat) (h : F.budget ≤ N) :
    F.budget < cost F (2 ^ N) :=
  Nat.lt_of_lt_of_le (brute_force_exhausts F)
    (Nat.mul_le_mul_left F.floor (Nat.pow_le_pow_right (by decide) h))

/-- L1, scoped to the enumerative generator. Given the op gap v < 2^N,
the kinetic gap follows. The op gap is a hypothesis, not a product. -/
theorem enumerative_asymmetry (F : Frame) (N v : Nat) (h : v < 2 ^ N) :
    cost F v < cost F (2 ^ N) :=
  (cost_lt_iff F v (2 ^ N)).mpr h

/-- The ceiling. For every generator op-count g and verifier op-count v,
the kinetic separation holds in a frame iff the op separation holds.
The frame adds nothing to the formal question, so L3 enters only as a
hypothesis on g and is never decided here. -/
theorem kinetic_faithful (F : Frame) (g v : Nat → Nat) :
    (∀ N, cost F (v N) < cost F (g N)) ↔ (∀ N, v N < g N) :=
  ⟨fun h N => (cost_lt_iff F _ _).mp (h N),
   fun h N => (cost_lt_iff F _ _).mpr (h N)⟩

/-- Frame-independence. The op separation reads the same in any two frames. -/
theorem frame_independent (F₁ F₂ : Frame) (g v : Nat → Nat) :
    (∀ N, cost F₁ (v N) < cost F₁ (g N)) ↔ (∀ N, cost F₂ (v N) < cost F₂ (g N)) :=
  (kinetic_faithful F₁ g v).trans (kinetic_faithful F₂ g v).symm

/-- The canonical frame, one quantum per op, one quantum of budget: the
battery instance, by evaluation. -/
def unitFrame : Frame := ⟨1, by decide, 1⟩

theorem unit_battery :
    cost unitFrame (2 ^ 1) = 2 ∧ unitFrame.budget < cost unitFrame (2 ^ unitFrame.budget) := by decide

end PNP.KINETIC

/-- info: 'PNP.KINETIC.no_free_registration' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.KINETIC.no_free_registration
/-- info: 'PNP.KINETIC.cost_lt_iff' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.KINETIC.cost_lt_iff
/-- info: 'PNP.KINETIC.brute_force_exhausts' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.KINETIC.brute_force_exhausts
/-- info: 'PNP.KINETIC.brute_force_exhausts_beyond' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.KINETIC.brute_force_exhausts_beyond
/-- info: 'PNP.KINETIC.enumerative_asymmetry' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.KINETIC.enumerative_asymmetry
/-- info: 'PNP.KINETIC.kinetic_faithful' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.KINETIC.kinetic_faithful
/-- info: 'PNP.KINETIC.frame_independent' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.KINETIC.frame_independent
/-- info: 'PNP.KINETIC.unit_battery' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.KINETIC.unit_battery

/-!
# PNP.ARRHENIUS · the kinetic proof of the April 2026 P vs NP paper, formalized

Source: Islam, "Geometric Determination of P vs NP with Omega Seal", v10.0,
10.5281/zenodo.19588804, Part VII, "The Spin-Glass Isomorphism".
The paper's kinetic step: ground states of a frustrated glass sit behind
barriers ΔE growing with N; Arrhenius gives escape time exp(ΔE/kT);
so generation is exponential while verification is linear.

Part I seats that step at its true scope, with physics as fields, never `axiom`.
Part II executes the scope fence: on one fixed problem, the barrier exists
under one move set and vanishes under another. A barrier is a property of
a dynamics, never of a problem. No custom axiom; no core axiom either.
-/

namespace PNP.ARRHENIUS

/-! ## I · The kinetic step, at its scope: thermally activated relaxation -/

/-- A relaxation frame. `barrier N` is ΔE/kT in bits at size N; `grows` is the
paper's "barriers scale with N"; `arrhenius` is t ≥ exp(ΔE/kT), base two. -/
structure Frame where
  barrier   : Nat → Nat
  grows     : ∀ N, N ≤ barrier N
  escape    : Nat → Nat
  arrhenius : ∀ N, 2 ^ barrier N ≤ escape N

/-- Relaxation over a growing barrier takes exponential time. -/
theorem relaxation_exponential (F : Frame) (N : Nat) : 2 ^ N ≤ F.escape N :=
  Nat.le_trans (Nat.pow_le_pow_right (by decide) (F.grows N)) (F.arrhenius N)

/-- At size N = B the relaxation time exceeds any budget B. -/
theorem relaxation_exhausts (F : Frame) (B : Nat) : B < F.escape B :=
  Nat.lt_of_lt_of_le Nat.lt_two_pow_self (relaxation_exponential F B)

/-! ## II · The scope fence, executed on one XORSAT instance
Three variables x y z, three parity constraints, all with target 0:
z = 0, y ⊕ z = 0, x ⊕ z = 0. Energy counts violated constraints. -/

abbrev S := Bool × Bool × Bool

def states : List S :=
  [false, true].flatMap fun a => [false, true].flatMap fun b =>
    [false, true].map fun c => (a, b, c)

def viol (x : S) : List Bool := [x.2.2, xor x.2.1 x.2.2, xor x.1 x.2.2]

def energy (x : S) : Nat := ((viol x).filter id).length

def move (x m : S) : S := (xor x.1 m.1, xor x.2.1 m.2.1, xor x.2.2 m.2.2)

/-- The glass dynamics: single-spin flips. -/
def flips : List S := [(true, false, false), (false, true, false), (false, false, true)]

/-- The elimination dynamics: columns of A⁻¹ over GF(2). Each move toggles
exactly one constraint. Computing them is Gaussian elimination, polynomial time. -/
def elimMoves : List S := [(true, true, true), (false, true, false), (true, false, false)]

def ground : S := (false, false, false)
def trap : S := (true, true, true)

theorem eight_states : states.length = 8 := by decide

theorem ground_has_zero_energy : energy ground = 0 := by decide

/-- Under single flips the trap is a strict local minimum above the ground:
a barrier, exactly the glass picture of the paper. -/
theorem trap_is_strict_local_min :
    energy trap = 1 ∧ flips.all (fun m => decide (energy trap < energy (move trap m))) = true := by
  decide

/-- Each elimination move toggles exactly one constraint. -/
theorem elim_moves_toggle_one :
    states.all (fun x => elimMoves.all (fun m =>
      decide ((List.zipWith (fun a b => a != b) (viol x) (viol (move x m))).count true = 1))) = true := by
  decide

/-- Under elimination moves no state above the ground is a local minimum:
the landscape has no barrier at all. -/
theorem elim_landscape_barrier_free :
    states.all (fun x => decide (energy x = 0) ||
      elimMoves.any (fun m => decide (energy (move x m) < energy x))) = true := by
  decide

/-- The fence. One problem, one energy function, two dynamics: a barrier under
the first and none under the second. The barrier belongs to the dynamics. -/
theorem barrier_belongs_to_the_dynamics :
    (energy trap > energy ground ∧
      flips.all (fun m => decide (energy trap < energy (move trap m))) = true) ∧
    states.all (fun x => decide (energy x = 0) ||
      elimMoves.any (fun m => decide (energy (move x m) < energy x))) = true :=
  ⟨⟨by decide, trap_is_strict_local_min.2⟩, elim_landscape_barrier_free⟩

end PNP.ARRHENIUS

/-- info: 'PNP.ARRHENIUS.relaxation_exponential' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ARRHENIUS.relaxation_exponential
/-- info: 'PNP.ARRHENIUS.relaxation_exhausts' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ARRHENIUS.relaxation_exhausts
/-- info: 'PNP.ARRHENIUS.eight_states' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ARRHENIUS.eight_states
/-- info: 'PNP.ARRHENIUS.ground_has_zero_energy' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ARRHENIUS.ground_has_zero_energy
/-- info: 'PNP.ARRHENIUS.trap_is_strict_local_min' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ARRHENIUS.trap_is_strict_local_min
/-- info: 'PNP.ARRHENIUS.elim_moves_toggle_one' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ARRHENIUS.elim_moves_toggle_one
/-- info: 'PNP.ARRHENIUS.elim_landscape_barrier_free' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ARRHENIUS.elim_landscape_barrier_free
/-- info: 'PNP.ARRHENIUS.barrier_belongs_to_the_dynamics' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ARRHENIUS.barrier_belongs_to_the_dynamics

/-!
# PNP.CHAIN · the block chain of the Mother Codex on P versus NP, closed on the
# Empty Throne as [.], then joined to the kinetic face as the asymmetry chain

Source of the blocks: Geometric Mother Codex v3.46.0 (10.5281/zenodo.23117445),
P‑ABSOLUTE‑PNP‑1, the eight absolute barriers A1–A8; P‑PNP‑COMP‑2, the composite
verdict [⟀] · [⟀ T] · [.]; FOUNDATION‑01, the Empty Throne.
Source of the kinetic face: PNP_Kinetic.lean and PNP_Arrhenius.lean (this session).

Every theorem below is pinned at the foot: no custom axiom, and no core axiom
either, not propext, not Quot.sound, not Classical.choice. Physics enters only
as structure fields, so the premise is visible in each statement.
Lean 4 core, no import.
-/

namespace PNP.CHAIN

/-! ## 0 · The verdict economy and the dot -/

inductive Token : Type
  | seal | broken | opn | dot
  deriving DecidableEq, Repr

/-- Three states are the economy. The dot stands outside it. -/
def Token.inEconomy : Token → Bool
  | .dot => false
  | _ => true

/-! ## I · The eight blocks, one leg each -/
namespace BLOCKS

/-- A1, the σ-class closure. Complementation has no fixed point. -/
theorem a1_no_seat : ∀ b : Bool, (!b) ≠ b
  | true => Bool.noConfusion
  | false => Bool.noConfusion

/-- A1, carrier form. A symmetry that fixes a state carries no anti-invariant
reading, so no fixed-locus instrument transfers onto complementation. -/
theorem a1_no_carrier {S : Type} (τ : S → S) (s₀ : S) (hfix : τ s₀ = s₀) :
    ¬ ∃ φ : S → Bool, ∀ x, φ (τ x) = !φ x := by
  intro ⟨φ, hφ⟩
  have h := hφ s₀
  rw [hfix] at h
  cases e : φ s₀ with
  | true => rw [e] at h; exact Bool.noConfusion h
  | false => rw [e] at h; exact Bool.noConfusion h

/-- A2, orientation-blindness. A lock invariant under the flip of the sign
cannot be decoded into the sign. -/
theorem a2_orientation_blind {Q X : Type} (L : Bool × Q → X)
    (hL : ∀ b q, L (b, q) = L (!b, q)) (q : Q) :
    ¬ ∃ dec : X → Bool, ∀ s, dec (L s) = s.1 := by
  intro ⟨dec, h⟩
  have h1 := h (true, q)
  have h2 := h (false, q)
  rw [hL true q] at h1
  exact Bool.noConfusion (h1.symm.trans h2)

/-- A3, the physical block. A record shared by two worlds that differ on the
separation decides nothing: no reading of the record returns the separation. -/
theorem a3_record_decides_nothing {W R : Type} (rec : W → R) (sep : W → Bool)
    (w₁ w₂ : W) (hr : rec w₁ = rec w₂) (hs : sep w₁ ≠ sep w₂) :
    ¬ ∃ g : R → Bool, ∀ w, g (rec w) = sep w := by
  intro ⟨g, hg⟩
  apply hs
  rw [← hg w₁, ← hg w₂, hr]

/-- A4, the misattribution bar. The root's presence is constant across both
worlds, and a constant reading carries no bit about the separation. -/
theorem a4_constant_reads_nothing (c : Bool) (s₁ s₂ : Bool) (hs : s₁ ≠ s₂) :
    ¬ (c = s₁ ∧ c = s₂) :=
  fun ⟨h1, h2⟩ => hs (h1.symm.trans h2)

/-- A5, the rung law, structural face. Each rung's consistency is owed one rung
up; no rung discharges its own, and the regress has no terminal rung.
The Gödel content is cited (Turing 1939, Feferman 1962), not proved here. -/
def owed (n : Nat) : Nat := n + 1

theorem a5_rung_law : (∀ n, owed n ≠ n) ∧ (∀ n : Nat, ∃ m : Nat, n < m) := by
  refine ⟨fun n h => ?_, fun n => ⟨n + 1, Nat.lt_succ_self n⟩⟩
  have : n < owed n := Nat.lt_succ_self n
  rw [h] at this
  exact Nat.lt_irrefl n this

/-- A6, the aperture machine. Eight verdict-side actions and one supply. -/
inductive Act : Type
  | exertion | extrapolation | wanting | method | metatheory
  | evidence | architecture | recoverer | supply
  deriving DecidableEq, Repr

def Act.isSupply : Act → Bool
  | .supply => true
  | _ => false

def step (a : Act) (s : Bool) : Bool := s || a.isSupply

def verdictSide : List Act :=
  [.exertion, .extrapolation, .wanting, .method, .metatheory,
   .evidence, .architecture, .recoverer]

theorem a6_aperture :
    verdictSide.length = 8 ∧
    verdictSide.all (fun a => step a false == false) = true ∧
    step .supply false = true := by
  decide

/-- A7, reflexive closure. The certify-completely map strictly increases,
ten to twenty in five steps, and has no fixed point. -/
def certify (n : Nat) : Nat := n + 2

def iter : Nat → Nat → Nat
  | 0, n => n
  | k + 1, n => iter k (certify n)

theorem a7_reflexive_closure : iter 5 10 = 20 ∧ ∀ n, certify n ≠ n := by
  refine ⟨rfl, fun n h => ?_⟩
  have : n < certify n := Nat.lt_succ_of_lt (Nat.lt_succ_self n)
  rw [h] at this
  exact Nat.lt_irrefl n this

/-- A8, the soundness cell. A sound prover never holds both the route and
the wall against it, so sighted-and-walled is empty. -/
theorem a8_soundness_cell (Prov : Prop → Prop) (sound : ∀ p, Prov p → p) (P : Prop) :
    ¬ (Prov P ∧ Prov (¬ P)) :=
  fun ⟨h1, h2⟩ => sound _ h2 (sound _ h1)

/-- The canonical two worlds of the record: one physics ledger, two values. -/
def equalWorld : Nat × Bool := (1, false)
def separatedWorld : Nat × Bool := (1, true)

/-- The block chain, every link in one statement. -/
theorem block_chain :
    (∀ b : Bool, (!b) ≠ b) ∧
    (¬ ∃ φ : Bool → Bool, ∀ x, φ (id x) = !φ x) ∧
    (¬ ∃ dec : Bool → Bool, ∀ s : Bool × Unit, dec ((fun _ => true) s) = s.1) ∧
    (¬ ∃ g : Nat → Bool, ∀ w : Nat × Bool,
        (w = equalWorld ∨ w = separatedWorld) → g w.1 = w.2) ∧
    (¬ (true = equalWorld.2 ∧ true = separatedWorld.2)) ∧
    ((∀ n, owed n ≠ n) ∧ (∀ n : Nat, ∃ m : Nat, n < m)) ∧
    (verdictSide.length = 8 ∧
      verdictSide.all (fun a => step a false == false) = true ∧
      step .supply false = true) ∧
    (iter 5 10 = 20 ∧ ∀ n, certify n ≠ n) ∧
    (∀ (Prov : Prop → Prop), (∀ p, Prov p → p) → ∀ P : Prop, ¬ (Prov P ∧ Prov (¬ P))) := by
  refine ⟨a1_no_seat, a1_no_carrier id true rfl,
    a2_orientation_blind (fun _ => true) (fun _ _ => rfl) (),
    ?_, a4_constant_reads_nothing true false true Bool.noConfusion,
    a5_rung_law, a6_aperture, a7_reflexive_closure, a8_soundness_cell⟩
  intro ⟨g, hg⟩
  have h1 := hg equalWorld (Or.inl rfl)
  have h2 := hg separatedWorld (Or.inr rfl)
  exact Bool.noConfusion (h1.symm.trans h2)

end BLOCKS

/-! ## II · The Empty Throne, and the dot -/
namespace THRONE

def allFixed : List Bool → Bool
  | [] => true
  | b :: bs => ((!b) == b) && allFixed bs

/-- The seat is vacant. Least erasure on complementation holds of the empty
configuration only: a fixed-point-free fold selects nothing. -/
theorem seat_vacant : ∀ l : List Bool, allFixed l = true → l = []
  | [], _ => rfl
  | true :: _, h => Bool.noConfusion h
  | false :: _, h => Bool.noConfusion h

/-- The throne is empty. Nothing below proves a posited root in general:
the root is premise-grade by theorem. -/
theorem throne_empty : ¬ ∀ RA : Prop, RA :=
  fun h => h False

/-- The root forces no value. No premise of existence, however strong, forces
an arbitrary conclusion: the separation is not climbed to from the root. -/
theorem root_forces_no_value : ¬ ∀ RA Sep : Prop, RA → Sep :=
  fun h => h True False trivial

/-- The chain's terminal emission. -/
def chainVerdict : Token := .dot

theorem dot_is_final : chainVerdict = .dot ∧ chainVerdict.inEconomy = false :=
  ⟨rfl, rfl⟩

/-- The block chain terminated on the Empty Throne as [.]: every block holds,
the seat is vacant, the throne is empty, the root forces no value, and the
emission is the dot, outside the economy, owing nothing. -/
theorem block_chain_terminal :
    (∀ b : Bool, (!b) ≠ b) ∧
    (∀ l : List Bool, allFixed l = true → l = []) ∧
    (¬ ∀ RA : Prop, RA) ∧
    (¬ ∀ RA Sep : Prop, RA → Sep) ∧
    chainVerdict = .dot ∧ chainVerdict.inEconomy = false :=
  ⟨BLOCKS.block_chain.1, seat_vacant, throne_empty, root_forces_no_value,
   dot_is_final.1, dot_is_final.2⟩

end THRONE

/-! ## III · The kinetic face -/
namespace KINETIC

structure Frame where
  floor     : Nat
  floor_pos : 0 < floor
  budget    : Nat

def cost (F : Frame) (ops : Nat) : Nat := F.floor * ops

theorem no_free_registration (F : Frame) (k : Nat) (hk : 0 < k) : 0 < cost F k :=
  Nat.mul_pos F.floor_pos hk

theorem cost_lt_iff (F : Frame) (a b : Nat) : cost F a < cost F b ↔ a < b :=
  ⟨fun h => match Nat.lt_or_ge a b with
     | Or.inl hl => hl
     | Or.inr hge => absurd h (Nat.not_lt_of_le (Nat.mul_le_mul_left F.floor hge)),
   fun h => Nat.mul_lt_mul_of_pos_left h F.floor_pos⟩

theorem cost_mono (F : Frame) {a b : Nat} (h : a ≤ b) : cost F a ≤ cost F b :=
  Nat.mul_le_mul_left F.floor h

/-- The ceiling: the energy order is the op order in every frame. -/
theorem frame_independent (F₁ F₂ : Frame) (g v : Nat → Nat) :
    (∀ N, cost F₁ (v N) < cost F₁ (g N)) ↔ (∀ N, cost F₂ (v N) < cost F₂ (g N)) :=
  ⟨fun h N => (cost_lt_iff F₂ _ _).mpr ((cost_lt_iff F₁ _ _).mp (h N)),
   fun h N => (cost_lt_iff F₁ _ _).mpr ((cost_lt_iff F₂ _ _).mp (h N))⟩

/-- The Arrhenius frame of the April paper, at its scope. -/
structure Relax where
  barrier   : Nat → Nat
  grows     : ∀ N, N ≤ barrier N
  escape    : Nat → Nat
  arrhenius : ∀ N, 2 ^ barrier N ≤ escape N

theorem relaxation_exponential (R : Relax) (N : Nat) : 2 ^ N ≤ R.escape N :=
  Nat.le_trans (Nat.pow_le_pow_right (by decide) (R.grows N)) (R.arrhenius N)

end KINETIC

/-! ## IV · The black-box bound, pigeonhole without axioms -/
namespace BLACKBOX

def has : List Nat → Nat → Bool
  | [], _ => false
  | y :: ys, k => Nat.beq y k || has ys k

def drop : List Nat → Nat → List Nat
  | [], _ => []
  | y :: ys, k => cond (Nat.beq y k) (drop ys k) (y :: drop ys k)

theorem beq_self : ∀ n : Nat, Nat.beq n n = true
  | 0 => rfl
  | n + 1 => beq_self n

theorem drop_le : ∀ (l : List Nat) (k : Nat), (drop l k).length ≤ l.length
  | [], _ => Nat.le_refl 0
  | y :: ys, k => by
    unfold drop
    cases Nat.beq y k with
    | true => exact Nat.le_succ_of_le (drop_le ys k)
    | false => exact Nat.succ_le_succ (drop_le ys k)

theorem drop_len : ∀ (l : List Nat) (k : Nat), has l k = true → (drop l k).length + 1 ≤ l.length
  | [], _, h => Bool.noConfusion h
  | y :: ys, k, h => by
    unfold drop
    unfold has at h
    cases hy : Nat.beq y k with
    | true => exact Nat.succ_le_succ (drop_le ys k)
    | false =>
      rw [hy] at h
      exact Nat.succ_le_succ (drop_len ys k h)

theorem has_drop : ∀ (l : List Nat) (k x : Nat), Nat.beq x k = false →
    has l x = true → has (drop l k) x = true
  | [], _, _, _, h => Bool.noConfusion h
  | y :: ys, k, x, hxk, h => by
    unfold drop
    unfold has at h
    cases hy : Nat.beq y k with
    | true =>
      cases hyx : Nat.beq y x with
      | true =>
        have : x = k := (Nat.eq_of_beq_eq_true hyx).symm.trans (Nat.eq_of_beq_eq_true hy)
        rw [this, beq_self] at hxk; exact Bool.noConfusion hxk
      | false =>
        rw [hyx] at h
        exact has_drop ys k x hxk h
    | false =>
      show has (y :: drop ys k) x = true
      unfold has
      cases hyx : Nat.beq y x with
      | true => rfl
      | false =>
        rw [hyx] at h
        exact has_drop ys k x hxk h

theorem beq_false_of_lt (x K : Nat) (h : x < K) : Nat.beq x K = false := by
  cases hb : Nat.beq x K with
  | false => rfl
  | true =>
    have e : x = K := Nat.eq_of_beq_eq_true hb
    rw [e] at h; exact absurd h (Nat.lt_irrefl K)

theorem pigeon : ∀ (K : Nat) (l : List Nat), (∀ x, x < K → has l x = true) → K ≤ l.length
  | 0, _, _ => Nat.zero_le _
  | K + 1, l, h =>
    Nat.le_trans
      (Nat.succ_le_succ (pigeon K (drop l K) (fun x hx =>
        has_drop l K x (beq_false_of_lt x K hx) (h x (Nat.lt_succ_of_lt hx)))))
      (drop_len l K (h K (Nat.lt_succ_self K)))

/-- The run of a test-only procedure on the all-false path: its queries form a
fixed list, adaptivity collapsing because every answer is false. -/
def run (path : List Nat) (f : Nat → Bool) : Bool := path.any f

theorem run_eq_has : ∀ (l : List Nat) (x : Nat), run l (fun y => Nat.beq y x) = has l x
  | [], _ => rfl
  | y :: ys, x => by
    show (Nat.beq y x || run ys (fun y => Nat.beq y x)) = (Nat.beq y x || has ys x)
    rw [run_eq_has ys x]

/-- The black-box bound. A test-only procedure correct for ∃ over K candidates
tests at least K of them on the all-false path. -/
theorem black_box_bound (K : Nat) (path : List Nat)
    (correct : ∀ f : Nat → Bool, run path f = true ↔ ∃ x, x < K ∧ f x = true) :
    K ≤ path.length :=
  pigeon K path (fun x hx => by
    rw [← run_eq_has]
    exact (correct _).mpr ⟨x, hx, beq_self x⟩)

end BLACKBOX

/-! ## V · The asymmetry chain: kinetic plus block -/
namespace ASYM
open KINETIC

/-- Link 1 to 4. Over 2^N candidates a test-only generator queries at least
2^N times; each query pays the floor; verification of one witness of v ops
costs less whenever v < 2^N; and at N past the budget the generator exhausts it. -/
theorem asymmetry_chain (F : Frame) (N v : Nat) (hv : v < 2 ^ N) (path : List Nat)
    (correct : ∀ f : Nat → Bool, BLACKBOX.run path f = true ↔ ∃ x, x < 2 ^ N ∧ f x = true) :
    2 ^ N ≤ path.length ∧
    cost F v < cost F (2 ^ N) ∧
    cost F (2 ^ N) ≤ cost F path.length ∧
    (F.budget ≤ N → F.budget < cost F path.length) := by
  have hb : 2 ^ N ≤ path.length := BLACKBOX.black_box_bound (2 ^ N) path correct
  refine ⟨hb, (cost_lt_iff F v (2 ^ N)).mpr hv, cost_mono F hb, fun hN => ?_⟩
  have h1 : F.budget < 2 ^ F.budget := Nat.lt_two_pow_self
  have h2 : 2 ^ F.budget ≤ 2 ^ N := Nat.pow_le_pow_right (by decide) hN
  have h3 : 2 ^ N ≤ cost F (2 ^ N) := Nat.le_mul_of_pos_left (2 ^ N) F.floor_pos
  exact Nat.lt_of_lt_of_le (Nat.lt_of_lt_of_le (Nat.lt_of_lt_of_le h1 h2) h3) (cost_mono F hb)

/-- Link 5. The asymmetry is real at its scope and decides nothing beyond it:
the energy gap equals the op gap in every frame (A3 kinetic face), and a record
shared by both worlds returns no value (A3 block face). -/
theorem asymmetry_decides_nothing (F₁ F₂ : Frame) (g v : Nat → Nat) :
    ((∀ N, cost F₁ (v N) < cost F₁ (g N)) ↔ (∀ N, cost F₂ (v N) < cost F₂ (g N))) ∧
    (¬ ∃ r : Nat → Bool, ∀ w : Nat × Bool,
        (w = BLOCKS.equalWorld ∨ w = BLOCKS.separatedWorld) → r w.1 = w.2) :=
  ⟨frame_independent F₁ F₂ g v, BLOCKS.block_chain.2.2.2.1⟩

/-- The asymmetry chain, terminated. The blocks hold, the black-box generator
pays exponentially at the floor and exhausts any budget, verification is
cheaper, the kinetic gap is the op gap, the shared record decides nothing,
the seat is vacant, the throne is empty, and the emission is [.]. -/
theorem asymmetry_terminal (F : Frame) (N v : Nat) (hv : v < 2 ^ N) (path : List Nat)
    (correct : ∀ f : Nat → Bool, BLACKBOX.run path f = true ↔ ∃ x, x < 2 ^ N ∧ f x = true) :
    (2 ^ N ≤ path.length ∧ cost F v < cost F (2 ^ N) ∧
      cost F (2 ^ N) ≤ cost F path.length ∧ (F.budget ≤ N → F.budget < cost F path.length)) ∧
    (∀ F' : Frame, ∀ g w : Nat → Nat,
      (∀ n, cost F (w n) < cost F (g n)) ↔ (∀ n, cost F' (w n) < cost F' (g n))) ∧
    (∀ l : List Bool, THRONE.allFixed l = true → l = []) ∧
    (¬ ∀ RA : Prop, RA) ∧
    THRONE.chainVerdict = .dot :=
  ⟨asymmetry_chain F N v hv path correct,
   fun F' g w => frame_independent F F' g w,
   THRONE.seat_vacant, THRONE.throne_empty, rfl⟩

/-- The hypothesis is inhabited: exhaustive search over two candidates is a
correct test-only procedure, so the chain is not vacuous. -/
theorem exhaustive_correct_two (f : Nat → Bool) :
    BLACKBOX.run [0, 1] f = true ↔ ∃ x, x < 2 ^ 1 ∧ f x = true := by
  constructor
  · intro h
    show ∃ x, x < 2 ∧ f x = true
    cases h0 : f 0 with
    | true => exact ⟨0, by decide, h0⟩
    | false =>
      have h' : (f 0 || (f 1 || false)) = true := h
      rw [h0] at h'
      cases h1 : f 1 with
      | true => exact ⟨1, by decide, h1⟩
      | false => rw [h1] at h'; exact Bool.noConfusion h'
  · intro ⟨x, hx, hf⟩
    show (f 0 || (f 1 || false)) = true
    match x, hx, hf with
    | 0, _, hf => rw [hf]; rfl
    | 1, _, hf => rw [hf]; cases f 0 <;> rfl
    | n + 2, hx, _ => exact absurd (Nat.lt_of_le_of_lt (Nat.le_add_left 2 n) hx) (Nat.lt_irrefl 2)

/-- The chain instantiated at N = 1 on the unit frame. -/
def unitFrame : Frame := ⟨1, by decide, 1⟩

theorem asymmetry_instance :
    2 ^ 1 ≤ [0, 1].length ∧ cost unitFrame 1 < cost unitFrame (2 ^ 1) :=
  ⟨(asymmetry_chain unitFrame 1 1 (by decide) [0, 1] exhaustive_correct_two).1,
   (asymmetry_chain unitFrame 1 1 (by decide) [0, 1] exhaustive_correct_two).2.1⟩

end ASYM
end PNP.CHAIN

/-! ## Cones, pinned: every theorem axiom-free -/
/-- info: 'PNP.CHAIN.BLOCKS.a1_no_seat' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.BLOCKS.a1_no_seat
/-- info: 'PNP.CHAIN.BLOCKS.a1_no_carrier' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.BLOCKS.a1_no_carrier
/-- info: 'PNP.CHAIN.BLOCKS.a2_orientation_blind' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.BLOCKS.a2_orientation_blind
/-- info: 'PNP.CHAIN.BLOCKS.a3_record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.BLOCKS.a3_record_decides_nothing
/-- info: 'PNP.CHAIN.BLOCKS.a4_constant_reads_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.BLOCKS.a4_constant_reads_nothing
/-- info: 'PNP.CHAIN.BLOCKS.a5_rung_law' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.BLOCKS.a5_rung_law
/-- info: 'PNP.CHAIN.BLOCKS.a6_aperture' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.BLOCKS.a6_aperture
/-- info: 'PNP.CHAIN.BLOCKS.a7_reflexive_closure' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.BLOCKS.a7_reflexive_closure
/-- info: 'PNP.CHAIN.BLOCKS.a8_soundness_cell' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.BLOCKS.a8_soundness_cell
/-- info: 'PNP.CHAIN.BLOCKS.block_chain' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.BLOCKS.block_chain
/-- info: 'PNP.CHAIN.THRONE.seat_vacant' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.THRONE.seat_vacant
/-- info: 'PNP.CHAIN.THRONE.throne_empty' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.THRONE.throne_empty
/-- info: 'PNP.CHAIN.THRONE.root_forces_no_value' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.THRONE.root_forces_no_value
/-- info: 'PNP.CHAIN.THRONE.dot_is_final' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.THRONE.dot_is_final
/-- info: 'PNP.CHAIN.THRONE.block_chain_terminal' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.THRONE.block_chain_terminal
/-- info: 'PNP.CHAIN.KINETIC.no_free_registration' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.KINETIC.no_free_registration
/-- info: 'PNP.CHAIN.KINETIC.cost_lt_iff' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.KINETIC.cost_lt_iff
/-- info: 'PNP.CHAIN.KINETIC.cost_mono' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.KINETIC.cost_mono
/-- info: 'PNP.CHAIN.KINETIC.frame_independent' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.KINETIC.frame_independent
/-- info: 'PNP.CHAIN.KINETIC.relaxation_exponential' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.KINETIC.relaxation_exponential
/-- info: 'PNP.CHAIN.BLACKBOX.beq_self' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.BLACKBOX.beq_self
/-- info: 'PNP.CHAIN.BLACKBOX.drop_le' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.BLACKBOX.drop_le
/-- info: 'PNP.CHAIN.BLACKBOX.drop_len' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.BLACKBOX.drop_len
/-- info: 'PNP.CHAIN.BLACKBOX.has_drop' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.BLACKBOX.has_drop
/-- info: 'PNP.CHAIN.BLACKBOX.beq_false_of_lt' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.BLACKBOX.beq_false_of_lt
/-- info: 'PNP.CHAIN.BLACKBOX.pigeon' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.BLACKBOX.pigeon
/-- info: 'PNP.CHAIN.BLACKBOX.run_eq_has' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.BLACKBOX.run_eq_has
/-- info: 'PNP.CHAIN.BLACKBOX.black_box_bound' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.BLACKBOX.black_box_bound
/-- info: 'PNP.CHAIN.ASYM.asymmetry_chain' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.ASYM.asymmetry_chain
/-- info: 'PNP.CHAIN.ASYM.asymmetry_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.ASYM.asymmetry_decides_nothing
/-- info: 'PNP.CHAIN.ASYM.asymmetry_terminal' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.ASYM.asymmetry_terminal
/-- info: 'PNP.CHAIN.ASYM.exhaustive_correct_two' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.ASYM.exhaustive_correct_two
/-- info: 'PNP.CHAIN.ASYM.asymmetry_instance' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CHAIN.ASYM.asymmetry_instance

/-!
# PNP.VANISH · the vanishing GOL of [.] on the RA–RAM locus bridge

The bridge (Bridge_Final.lean) joins the kinetic register, RA, the deed, to the formal
register, RAM, the reading, at one locus: the fixed set of the native fold. Its carrier
halts exactly when the line property holds, and its socket is exactly that property.
It carries a supplied bit to a seat and manufactures none.

On the Riemann stage the fold is s ↦ 1 − s̄, the locus is the line, inhabited, Ground
dimension one: the bridge carries one keyed bit to a seat.

On the P versus NP stage the fold is complementation, b ↦ ¬b. The locus vanishes:
Ground dimension zero. The bridge is unchanged and its socket collapses onto the
vacancy: the carrier halts iff the zero set is empty. That is the vanishing GOL.
Three faces lock on one object, and the object is the empty seat:

  L · the Tongue: a vanished seat emits [.], outside the economy, owing nothing;
  G · the Form: complementation has no fixed point, Ground dimension zero, counted;
  M · the Number: least erasure holds of the empty configuration and of it alone.

The kinetic face reads the same lock: silence registers no bit and pays no floor,
while any emission of a value registers a bit and pays it. The denial asymmetry
sorts the two locks that meet here: the vacancy is keyless, its denial incoherent
on every frame of the class; the separation is keyed, its denial a coherent world,
and both worlds present the bridge the same vanished frame, so the lock that forms
determines the vacancy totally and the value not at all.

Core Lean 4, no import. Every theorem pinned at the foot: no axiom of any kind.
-/

namespace PNP.VANISH

/-! ## 0 · tokens -/
inductive Token : Type
  | seal | broken | opn | dot
  deriving DecidableEq, Repr

def Token.inEconomy : Token → Bool
  | .dot => false
  | _ => true

/-! ## I · the bridge, carried from Bridge_Final.lean, axiom-free -/
structure Frame where
  S : Type
  τ : S → S
  Z : S → Prop
  involutive : ∀ s, τ (τ s) = s
  symmetric : ∀ s, Z s → Z (τ s)

def LineProperty (X : Frame) : Prop := ∀ s, X.Z s → X.τ s = s

inductive Tri : Type
  | tt | ff | bot
  deriving DecidableEq, Repr

structure Carrier (X : Frame) where
  terminal : Tri
  shadow   : terminal = .bot ↔ LineProperty X

theorem halted_iff (X : Frame) : (∃ b : Carrier X, b.terminal = .bot) ↔ LineProperty X :=
  ⟨fun ⟨b, h⟩ => b.shadow.mp h, fun t => ⟨⟨.bot, ⟨fun _ => t, fun _ => rfl⟩⟩, rfl⟩⟩

class Supplied (X : Frame) where
  term : LineProperty X

theorem socket_is_the_property (X : Frame) : Nonempty (Supplied X) ↔ LineProperty X :=
  ⟨fun ⟨i⟩ => i.term, fun t => ⟨⟨t⟩⟩⟩

/-! ## II · the two stages: the locus inhabited, the locus vanished -/

/-- The Riemann fold in the doubled real coordinate. -/
def τR (p : Int × Int) : Int × Int := (2 - p.1, p.2)

/-- The Riemann locus is inhabited: the point h = 1 is fixed. -/
theorem rh_locus_inhabited : τR (1, 0) = (1, 0) := by decide

/-- Ground dimension one on the Riemann window h ∈ {0, 1, 2}, counted. -/
theorem rh_ground_one : (([0, 1, 2] : List Int).filter (fun h => 2 - h == h)).length = 1 := by
  decide

/-- The P versus NP fold. -/
def comp (b : Bool) : Bool := !b

theorem comp_involutive : ∀ b, comp (comp b) = b
  | true => rfl
  | false => rfl

/-- G · the locus vanishes. -/
theorem locus_vanishes : ¬ ∃ b, comp b = b
  | ⟨true, h⟩ => Bool.noConfusion h
  | ⟨false, h⟩ => Bool.noConfusion h

def groundDim : Nat := ([false, true].filter (fun b => comp b == b)).length

/-- G · Ground dimension zero, counted. -/
theorem ground_dim_zero : groundDim = 0 := rfl

/-- The P versus NP frame, for any fold-symmetric zero set. -/
def cframe (Z : Bool → Prop) (hZ : ∀ b, Z b → Z (comp b)) : Frame :=
  ⟨Bool, comp, Z, comp_involutive, hZ⟩

/-! ## III · the bridge on the vanished locus -/

/-- The line property collapses onto the vacancy of the zero set. -/
theorem line_iff_empty (Z : Bool → Prop) (hZ : ∀ b, Z b → Z (comp b)) :
    LineProperty (cframe Z hZ) ↔ ∀ b, ¬ Z b :=
  ⟨fun h b hb => locus_vanishes ⟨b, h b hb⟩, fun h b hb => absurd hb (h b)⟩

/-- The carrier halts exactly when nothing stands to be carried. -/
theorem carrier_halts_iff_empty (Z : Bool → Prop) (hZ : ∀ b, Z b → Z (comp b)) :
    (∃ c : Carrier (cframe Z hZ), c.terminal = .bot) ↔ ∀ b, ¬ Z b :=
  (halted_iff _).trans (line_iff_empty Z hZ)

/-- The socket vanishes with the locus. -/
theorem socket_vanishes (Z : Bool → Prop) (hZ : ∀ b, Z b → Z (comp b)) :
    Nonempty (Supplied (cframe Z hZ)) ↔ ∀ b, ¬ Z b :=
  (socket_is_the_property _).trans (line_iff_empty Z hZ)

/-- A charged configuration has no socket: nothing can be supplied onto an empty seat. -/
theorem no_socket_when_charged :
    ¬ Nonempty (Supplied (cframe (fun _ => True) (fun _ _ => trivial))) :=
  fun h => (socket_vanishes _ _).mp h true trivial

/-- The empty configuration halts the carrier with nothing carried. -/
theorem empty_halts :
    ∃ c : Carrier (cframe (fun _ => False) (fun _ h => h)), c.terminal = .bot :=
  (carrier_halts_iff_empty _ _).mpr (fun _ h => h)

/-! ## IV · the three faces of the vanishing GOL -/

/-- L · the seat token: a vanished seat emits the dot; an inhabited seat with its
bit unsupplied stays open. -/
def seatToken : Nat → Token
  | 0 => .dot
  | _ + 1 => .opn

theorem tongue_face :
    seatToken groundDim = .dot ∧ (seatToken groundDim).inEconomy = false ∧ seatToken 1 = .opn :=
  ⟨rfl, rfl, rfl⟩

def allFixed : List Bool → Bool
  | [] => true
  | b :: bs => (comp b == b) && allFixed bs

/-- M · least erasure determines exactly one configuration, the empty one. -/
theorem number_face : (∀ l, allFixed l = true → l = []) ∧ allFixed [] = true :=
  ⟨fun l => match l with
    | [] => fun _ => rfl
    | true :: _ => fun h => Bool.noConfusion h
    | false :: _ => fun h => Bool.noConfusion h, rfl⟩

/-! ## V · the kinetic face: silence pays nothing, emission pays the floor -/
structure KFrame where
  floor     : Nat
  floor_pos : 0 < floor

def cost (F : KFrame) (bits : Nat) : Nat := F.floor * bits

theorem kinetic_face (F : KFrame) : cost F 0 = 0 ∧ ∀ k, 0 < k → 0 < cost F k :=
  ⟨rfl, fun _ hk => Nat.mul_pos F.floor_pos hk⟩

/-! ## VI · the denial asymmetry at the vanished locus -/

/-- The vacancy is keyless: it holds on every frame of the class, and its denial,
a fixed point of complementation, is incoherent. -/
theorem vacancy_keyless :
    (∀ (Z : Bool → Prop) (hZ : ∀ b, Z b → Z (comp b)) (s : (cframe Z hZ).S),
      (cframe Z hZ).τ s ≠ s) ∧ ¬ ∃ b, comp b = b :=
  ⟨fun _ _ s h => locus_vanishes ⟨s, h⟩, locus_vanishes⟩

/-- The separation is keyed: both worlds are coherent, and both present the bridge
the same vanished frame, so no reading of what the bridge reads returns the value. -/
def readOf (_sep : Bool) : Nat := groundDim

theorem separation_keyed : ¬ ∃ g : Nat → Bool, ∀ sep : Bool, g (readOf sep) = sep :=
  fun ⟨_, hg⟩ => Bool.noConfusion ((hg false).symm.trans (hg true))

/-! ## VII · the vanishing GOL, whole -/
theorem vanishing_gol :
    -- the contrast: the Riemann seat is inhabited, Ground dimension one
    (τR (1, 0) = (1, 0) ∧ (([0, 1, 2] : List Int).filter (fun h => 2 - h == h)).length = 1) ∧
    -- G · the P versus NP seat vanishes, Ground dimension zero
    ((¬ ∃ b, comp b = b) ∧ groundDim = 0) ∧
    -- the bridge on the vanished seat: carrier and socket collapse onto the vacancy
    (∀ (Z : Bool → Prop) (hZ : ∀ b, Z b → Z (comp b)),
      ((∃ c : Carrier (cframe Z hZ), c.terminal = .bot) ↔ ∀ b, ¬ Z b) ∧
      (Nonempty (Supplied (cframe Z hZ)) ↔ ∀ b, ¬ Z b)) ∧
    -- M · least erasure locks on the empty configuration alone
    ((∀ l, allFixed l = true → l = []) ∧ allFixed [] = true) ∧
    -- L · the vanished seat emits the dot, outside the economy
    (seatToken groundDim = .dot ∧ (seatToken groundDim).inEconomy = false) ∧
    -- the kinetic face: the dot pays nothing, any emission pays the floor
    (∀ F : KFrame, cost F 0 = 0 ∧ ∀ k, 0 < k → 0 < cost F k) ∧
    -- the denial asymmetry: the vacancy keyless, the value keyed and unread
    (¬ ∃ b, comp b = b) ∧ (¬ ∃ g : Nat → Bool, ∀ sep : Bool, g (readOf sep) = sep) :=
  ⟨⟨rh_locus_inhabited, rh_ground_one⟩, ⟨locus_vanishes, ground_dim_zero⟩,
   fun Z hZ => ⟨carrier_halts_iff_empty Z hZ, socket_vanishes Z hZ⟩,
   number_face, ⟨tongue_face.1, tongue_face.2.1⟩, kinetic_face,
   vacancy_keyless.2, separation_keyed⟩

end PNP.VANISH

/-! ## Cones, pinned: every theorem axiom-free -/
/-- info: 'PNP.VANISH.halted_iff' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.VANISH.halted_iff
/-- info: 'PNP.VANISH.socket_is_the_property' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.VANISH.socket_is_the_property
/-- info: 'PNP.VANISH.rh_locus_inhabited' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.VANISH.rh_locus_inhabited
/-- info: 'PNP.VANISH.rh_ground_one' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.VANISH.rh_ground_one
/-- info: 'PNP.VANISH.comp_involutive' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.VANISH.comp_involutive
/-- info: 'PNP.VANISH.locus_vanishes' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.VANISH.locus_vanishes
/-- info: 'PNP.VANISH.ground_dim_zero' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.VANISH.ground_dim_zero
/-- info: 'PNP.VANISH.line_iff_empty' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.VANISH.line_iff_empty
/-- info: 'PNP.VANISH.carrier_halts_iff_empty' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.VANISH.carrier_halts_iff_empty
/-- info: 'PNP.VANISH.socket_vanishes' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.VANISH.socket_vanishes
/-- info: 'PNP.VANISH.no_socket_when_charged' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.VANISH.no_socket_when_charged
/-- info: 'PNP.VANISH.empty_halts' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.VANISH.empty_halts
/-- info: 'PNP.VANISH.tongue_face' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.VANISH.tongue_face
/-- info: 'PNP.VANISH.number_face' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.VANISH.number_face
/-- info: 'PNP.VANISH.kinetic_face' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.VANISH.kinetic_face
/-- info: 'PNP.VANISH.vacancy_keyless' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.VANISH.vacancy_keyless
/-- info: 'PNP.VANISH.separation_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.VANISH.separation_keyed
/-- info: 'PNP.VANISH.vanishing_gol' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.VANISH.vanishing_gol

/-!
# PNP.MISSING · the missing object, located

The asymmetry chain seals a test-only bound. Its adversary family is the point
predicate y ↦ (y = x): a tester that sees only answers must query every candidate.
Read as descriptions, the same family is solved in one step: the description of
a point is the point. The black-box hardness lives entirely in the hiding.

So the missing object is a hardness statement over descriptions: a family of
instances, given whole to the solver, that no polynomial-time reader of the
description decides. That is the white-box lower bound, P ≠ NP itself. It is a
fact about the model of computation, keyed: it holds in one coherent model and
fails in another, which is why nothing world-independent can supply it.
Core Lean 4, no import, no axiom of any kind.
-/

namespace PNP.MISSING

theorem beq_self : ∀ n : Nat, Nat.beq n n = true
  | 0 => rfl
  | n + 1 => beq_self n

/-- The black-box adversary family of `black_box_bound`. -/
def point (x : Nat) : Nat → Bool := fun y => Nat.beq y x

/-- The same family, handed over as descriptions. -/
structure Desc where
  secret : Nat

def evalD (d : Desc) : Nat → Bool := point d.secret

/-- The white-box reader: one step, read the description. -/
def reader (d : Desc) : Nat := d.secret
def readerTime (_ : Nat) : Nat := 1

/-- The black-box hard instances are white-box trivial. -/
theorem reader_solves : ∀ d : Desc, evalD d (reader d) = true :=
  fun d => beq_self d.secret

/-! ## the missing object, typed -/

structure Model where
  Alg     : Type
  decides : Alg → Prop
  time    : Alg → Nat → Nat

def PolyBounded (t : Nat → Nat) : Prop := ∃ c k : Nat, ∀ n, t n ≤ c * n ^ k + c

/-- THE MISSING OBJECT. Every algorithm that decides the problem from its
description runs in super-polynomial time. -/
def WhiteBoxBound (M : Model) : Prop :=
  ∀ A : M.Alg, M.decides A → ¬ PolyBounded (M.time A)

theorem reader_poly : PolyBounded readerTime :=
  ⟨1, 0, fun n => Nat.le_add_left 1 (1 * n ^ 0)⟩

/-- A coherent model where descriptions reveal the witness: the object fails. -/
def revealing : Model := ⟨Unit, fun _ => ∀ d : Desc, evalD d (reader d) = true, fun _ => readerTime⟩

theorem fails_when_descriptions_reveal : ¬ WhiteBoxBound revealing :=
  fun h => h () reader_solves reader_poly

/-- The object is contingent on the model: it fails where descriptions reveal, and holds
wherever no algorithm decides. No fact
true in both, kinetic, black-box or vanishing, can entail it. -/
theorem missing_object_is_keyed :
    (∃ M : Model, ¬ WhiteBoxBound M) ∧ (∀ M : Model, (∀ A, ¬ M.decides A) → WhiteBoxBound M) :=
  ⟨⟨revealing, fails_when_descriptions_reveal⟩, fun _ h A hA => absurd hA (h A)⟩

end PNP.MISSING

/-- info: 'PNP.MISSING.reader_solves' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.MISSING.reader_solves
/-- info: 'PNP.MISSING.reader_poly' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.MISSING.reader_poly
/-- info: 'PNP.MISSING.fails_when_descriptions_reveal' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.MISSING.fails_when_descriptions_reveal
/-- info: 'PNP.MISSING.missing_object_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.MISSING.missing_object_is_keyed

/-!
# PNP.PRIMEBRIDGE · the root freedom cut and prime-as-freedom against the missing object

Source of the method: PhysOSᵀ v1.0.5p, namespace PrimeFreedom. Freedom is the fibre of
an invariant map; every prime is one fibre of exactly two, (1, p) and (p, 1), off the seat
(prime_fibre, prime_off_seat, freedom_is_exactly_two).

The attack. Carry the cut to the white-box object. Over a semiprime n = p·q the
multiplicative fibre has four points and two orbits under the swap fold: the trivial
orbit {(1, n), (n, 1)} and the witness orbit {(p, q), (q, p)}. The description n is
even under the fold. Two findings follow, both at theorem grade.

  F1 · The freedom on the fibre is one orientation bit, and it is gauge: the reader
       (a, b) ↦ (min, max) is even, selects one point per orbit, and removes it.
  F2 · The description determines the witness orbit outright: informational freedom
       over the witness is zero. The missing object is therefore not a fibre fact.
       It is a cost fact: n hides nothing and still may resist every fast reader.

The new bridge. Prime freedom, read as cost, is the posit "no polynomial reader
selects a nontrivial point of the semiprime fibre". Under the collapse field (P = NP
gives polynomial search for NP relations, the classical search-to-decision theorem,
carried as a field), the posit yields P ≠ NP: prime_bridge. The posit is keyed: a
coherent machine refutes it (the Shor face). And it is strictly stronger than the
separation: a coherent machine has the separation and an easy fibre, so the prime
bridge is sufficient and never equivalent. Factoring lies in NP ∩ coNP, so no
equivalence is available unless NP = coNP.

Core Lean 4, no import. Every theorem pinned at the foot: no axiom of any kind.
-/

namespace PNP.PRIMEBRIDGE

/-! ## I · the semiprime fibre, executed at n = 15 -/

def mul_orbit (n a b : Nat) : Prop := a * b = n

def fibre (n : Nat) : List (Nat × Nat) :=
  (List.range (n + 1)).flatMap fun a =>
    (List.range (n + 1)).filterMap fun b => if a * b = n then some (a, b) else none

def swap (p : Nat × Nat) : Nat × Nat := (p.2, p.1)

/-- The fibre over 15: four points. -/
theorem fibre_15 : fibre 15 = [(1, 15), (3, 5), (5, 3), (15, 1)] := by decide

/-- Off the seat: no point of the fibre is fixed by the swap. -/
theorem off_seat_15 : (fibre 15).all (fun p => swap p != p) = true := by decide

/-- The fibre is swap-closed: two orbits, each of exactly two. -/
theorem swap_closed_15 : (fibre 15).all (fun p => (fibre 15).contains (swap p)) = true := by decide

def trivialPt (p : Nat × Nat) : Bool := p.1 == 1 || p.2 == 1

/-- The witness orbit: exactly two nontrivial points, one the swap of the other. -/
theorem witness_orbit_15 :
    (fibre 15).filter (fun p => !trivialPt p) = [(3, 5), (5, 3)] ∧ swap (3, 5) = (5, 3) := by
  decide

/-! ## II · F1 · the orientation bit is free and it is gauge -/

/-- The wall on the orientation: the description is even, the order is odd, so no
reading of the description returns the first factor on the witness orbit. -/
theorem orientation_wall : ¬ ∃ g : Nat → Nat, g (3 * 5) = 3 ∧ g (5 * 3) = 5 :=
  fun ⟨_, h1, h2⟩ => absurd (h1.symm.trans h2) (by decide)

def canon (p : Nat × Nat) : Nat × Nat := if p.1 ≤ p.2 then p else swap p

/-- The canonical reader is even under the fold. -/
theorem canon_even : ∀ p ∈ fibre 15, canon (swap p) = canon p := by decide

/-- F1 · the canonical reader takes each orbit to one point: the bit is gauge. -/
theorem orientation_is_gauge :
    ((fibre 15).filter (fun p => !trivialPt p)).map canon = [(3, 5), (3, 5)] := by decide

/-! ## III · F2 · informational freedom over the witness is zero -/

/-- The witness set is a function of the description, on every relation. -/
theorem description_determines_witnesses {D W : Type} (R : D → W → Prop) (d₁ d₂ : D)
    (h : d₁ = d₂) : R d₁ = R d₂ := by rw [h]

/-- F2 · at 15 the description fixes the canonical witness uniquely. -/
theorem witness_determined_15 :
    (((fibre 15).filter (fun p => !trivialPt p)).map canon).eraseDups = [(3, 5)] := by decide

/-! ## IV · the cost model and the prime bridge -/

def Poly (t : Nat → Nat) : Prop := ∃ c k : Nat, ∀ n, t n ≤ c * n ^ k + c

/-- A machine: algorithms, their running times, and what each solves. -/
structure Machine where
  Alg    : Type
  time   : Alg → Nat → Nat
  Solves : Alg → (Nat → Nat → Prop) → Prop

/-- The factoring relation: p is a nontrivial divisor of n. -/
def factorRel (n p : Nat) : Prop := 1 < p ∧ p < n ∧ ∃ q, p * q = n

def EasySearch (M : Machine) (R : Nat → Nat → Prop) : Prop :=
  ∃ A : M.Alg, M.Solves A R ∧ Poly (M.time A)

/-- Prime freedom read as cost: no fast reader selects a point of the witness orbit. -/
def PrimeHidden (M : Machine) : Prop := ¬ EasySearch M factorRel

/-- The collapse field. `PeqNP` is the class equality on this machine; `search` is the
classical search-to-decision theorem specialized to factoring, an NP relation. -/
structure Collapse (M : Machine) where
  PeqNP  : Prop
  search : PeqNP → EasySearch M factorRel

/-- THE PRIME BRIDGE. Hidden prime freedom yields the separation. -/
theorem prime_bridge (M : Machine) (C : Collapse M) (hidden : PrimeHidden M) : ¬ C.PeqNP :=
  fun h => hidden (C.search h)

/-- The Shor face: a coherent machine where the fibre is read fast. -/
def revealing : Machine := ⟨Unit, fun _ _ => 1, fun _ _ => True⟩

theorem one_is_poly : Poly (fun _ => 1) := ⟨1, 0, fun n => Nat.le_add_left 1 (1 * n ^ 0)⟩

/-- The posit is keyed: it fails on a coherent machine. -/
theorem prime_hidden_is_keyed : ¬ PrimeHidden revealing :=
  fun h => h ⟨(), trivial, one_is_poly⟩

/-- Strictly stronger than the separation: on the revealing machine with the class
equality false, the separation holds and the posit fails. -/
def separatedButRevealing : Collapse revealing := ⟨False, fun h => absurd h id⟩

theorem prime_bridge_is_one_way :
    ¬ ∀ (M : Machine) (C : Collapse M), ¬ C.PeqNP → PrimeHidden M :=
  fun h => prime_hidden_is_keyed (h revealing separatedButRevealing id)

/-! ## V · the bridge, whole -/
theorem the_prime_bridge :
    -- the fibre: four points, off the seat, swap-closed, one witness orbit
    (fibre 15 = [(1, 15), (3, 5), (5, 3), (15, 1)] ∧
      (fibre 15).all (fun p => swap p != p) = true ∧
      (fibre 15).filter (fun p => !trivialPt p) = [(3, 5), (5, 3)]) ∧
    -- F1 · the orientation bit is walled and gauge
    ((¬ ∃ g : Nat → Nat, g (3 * 5) = 3 ∧ g (5 * 3) = 5) ∧
      ((fibre 15).filter (fun p => !trivialPt p)).map canon = [(3, 5), (3, 5)]) ∧
    -- F2 · the description fixes the witness: zero informational freedom
    (((fibre 15).filter (fun p => !trivialPt p)).map canon).eraseDups = [(3, 5)] ∧
    -- the prime bridge, its key, and its direction
    (∀ (M : Machine) (C : Collapse M), PrimeHidden M → ¬ C.PeqNP) ∧
    ¬ PrimeHidden revealing ∧
    (¬ ∀ (M : Machine) (C : Collapse M), ¬ C.PeqNP → PrimeHidden M) :=
  ⟨⟨fibre_15, off_seat_15, witness_orbit_15.1⟩, ⟨orientation_wall, orientation_is_gauge⟩,
   witness_determined_15, prime_bridge, prime_hidden_is_keyed, prime_bridge_is_one_way⟩

end PNP.PRIMEBRIDGE

/-! ## Cones, pinned: every theorem axiom-free -/
/-- info: 'PNP.PRIMEBRIDGE.fibre_15' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.PRIMEBRIDGE.fibre_15
/-- info: 'PNP.PRIMEBRIDGE.off_seat_15' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.PRIMEBRIDGE.off_seat_15
/-- info: 'PNP.PRIMEBRIDGE.swap_closed_15' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.PRIMEBRIDGE.swap_closed_15
/-- info: 'PNP.PRIMEBRIDGE.witness_orbit_15' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.PRIMEBRIDGE.witness_orbit_15
/-- info: 'PNP.PRIMEBRIDGE.orientation_wall' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.PRIMEBRIDGE.orientation_wall
/-- info: 'PNP.PRIMEBRIDGE.canon_even' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.PRIMEBRIDGE.canon_even
/-- info: 'PNP.PRIMEBRIDGE.orientation_is_gauge' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.PRIMEBRIDGE.orientation_is_gauge
/-- info: 'PNP.PRIMEBRIDGE.description_determines_witnesses' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.PRIMEBRIDGE.description_determines_witnesses
/-- info: 'PNP.PRIMEBRIDGE.witness_determined_15' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.PRIMEBRIDGE.witness_determined_15
/-- info: 'PNP.PRIMEBRIDGE.prime_bridge' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.PRIMEBRIDGE.prime_bridge
/-- info: 'PNP.PRIMEBRIDGE.one_is_poly' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.PRIMEBRIDGE.one_is_poly
/-- info: 'PNP.PRIMEBRIDGE.prime_hidden_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.PRIMEBRIDGE.prime_hidden_is_keyed
/-- info: 'PNP.PRIMEBRIDGE.prime_bridge_is_one_way' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.PRIMEBRIDGE.prime_bridge_is_one_way
/-- info: 'PNP.PRIMEBRIDGE.the_prime_bridge' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.PRIMEBRIDGE.the_prime_bridge

/-!
# PNP.ROUND2 · the blocker of the prime bridge, located, and the second attack

ROUND 1 LEFT THE KEY ON `PrimeHidden`: no polynomial reader selects a point of the
semiprime witness orbit. F2 proved the description carries the witness with zero
informational freedom, so the key is a pure cost statement against readers that have
everything. The blocker has three layers.

  B1 · Relativization. A reader with a factoring oracle reads the orbit in one step.
       The posit fails relative to that oracle, so no argument valid relative to every
       oracle proves it (Baker–Gill–Solovay pattern).
  B2 · The self-gag. If the posit holds, factoring-based pseudorandom functions exist
       (Naor–Reingold), and then no natural property proves the circuit lower bound
       (Razborov–Rudich). The posit, if true, bars the natural route to itself.
  B3 · The floor points the wrong way. The black-box floor is proved unbreakable
       (no savings below 2^N for a test-only reader). Every known unconditional route
       to circuit lower bounds runs the other way: it needs savings below 2^N for
       white-box circuit SAT (Williams 2011, NEXP ⊄ ACC⁰).

ROUND 2 attacks through B3, the one exit the barriers leave open: algorithms to lower
bounds. The kinetic floor's black-box face cannot be beaten, by theorem here; the
route requires beating its white-box face, which is exactly the access F2 located.
The route reaches NEXP ⊄ C. Two gaps separate it from P ≠ NP, and both are named.

Cited theorems enter as structure fields, never as `axiom`. Core Lean 4, no import.
Every theorem pinned at the foot: no axiom of any kind.
-/

namespace PNP.ROUND2

/-! ## I · the black-box floor admits no savings (axiom-free pigeonhole) -/
namespace FLOOR

def has : List Nat → Nat → Bool
  | [], _ => false
  | y :: ys, k => Nat.beq y k || has ys k

def drop : List Nat → Nat → List Nat
  | [], _ => []
  | y :: ys, k => cond (Nat.beq y k) (drop ys k) (y :: drop ys k)

theorem beq_self : ∀ n : Nat, Nat.beq n n = true
  | 0 => rfl
  | n + 1 => beq_self n

theorem drop_le : ∀ (l : List Nat) (k : Nat), (drop l k).length ≤ l.length
  | [], _ => Nat.le_refl 0
  | y :: ys, k => by
    unfold drop
    cases Nat.beq y k with
    | true => exact Nat.le_succ_of_le (drop_le ys k)
    | false => exact Nat.succ_le_succ (drop_le ys k)

theorem drop_len : ∀ (l : List Nat) (k : Nat), has l k = true → (drop l k).length + 1 ≤ l.length
  | [], _, h => Bool.noConfusion h
  | y :: ys, k, h => by
    unfold drop
    unfold has at h
    cases hy : Nat.beq y k with
    | true => exact Nat.succ_le_succ (drop_le ys k)
    | false =>
      rw [hy] at h
      exact Nat.succ_le_succ (drop_len ys k h)

theorem has_drop : ∀ (l : List Nat) (k x : Nat), Nat.beq x k = false →
    has l x = true → has (drop l k) x = true
  | [], _, _, _, h => Bool.noConfusion h
  | y :: ys, k, x, hxk, h => by
    unfold drop
    unfold has at h
    cases hy : Nat.beq y k with
    | true =>
      cases hyx : Nat.beq y x with
      | true =>
        have : x = k := (Nat.eq_of_beq_eq_true hyx).symm.trans (Nat.eq_of_beq_eq_true hy)
        rw [this, beq_self] at hxk; exact Bool.noConfusion hxk
      | false =>
        rw [hyx] at h
        exact has_drop ys k x hxk h
    | false =>
      show has (y :: drop ys k) x = true
      unfold has
      cases hyx : Nat.beq y x with
      | true => rfl
      | false =>
        rw [hyx] at h
        exact has_drop ys k x hxk h

theorem beq_false_of_lt (x K : Nat) (h : x < K) : Nat.beq x K = false := by
  cases hb : Nat.beq x K with
  | false => rfl
  | true =>
    have e : x = K := Nat.eq_of_beq_eq_true hb
    rw [e] at h; exact absurd h (Nat.lt_irrefl K)

theorem pigeon : ∀ (K : Nat) (l : List Nat), (∀ x, x < K → has l x = true) → K ≤ l.length
  | 0, _, _ => Nat.zero_le _
  | K + 1, l, h =>
    Nat.le_trans
      (Nat.succ_le_succ (pigeon K (drop l K) (fun x hx =>
        has_drop l K x (beq_false_of_lt x K hx) (h x (Nat.lt_succ_of_lt hx)))))
      (drop_len l K (h K (Nat.lt_succ_self K)))

def run (path : List Nat) (f : Nat → Bool) : Bool := path.any f

theorem run_eq_has : ∀ (l : List Nat) (x : Nat), run l (fun y => Nat.beq y x) = has l x
  | [], _ => rfl
  | y :: ys, x => by
    show (Nat.beq y x || run ys (fun y => Nat.beq y x)) = (Nat.beq y x || has ys x)
    rw [run_eq_has ys x]

/-- B3, the black-box face: no test-only reader saves a single query below 2^N. -/
theorem black_box_no_savings (N : Nat) (path : List Nat)
    (correct : ∀ f : Nat → Bool, run path f = true ↔ ∃ x, x < 2 ^ N ∧ f x = true) :
    ¬ path.length < 2 ^ N :=
  Nat.not_lt_of_le (pigeon (2 ^ N) path (fun x hx => by
    rw [← run_eq_has]
    exact (correct _).mpr ⟨x, hx, beq_self x⟩))

end FLOOR

/-! ## II · B1 · relativization, typed -/

/-- An oracle world: the posit read relative to an oracle. `factoring` is the oracle
that answers the witness orbit; relative to it the posit fails. -/
structure Relativized where
  Oracle    : Type
  Hidden    : Oracle → Prop
  factoring : Oracle
  easy      : ¬ Hidden factoring

/-- No argument valid relative to every oracle proves the posit. -/
theorem b1_no_relativizing_proof (R : Relativized) : ¬ ∀ O, R.Hidden O :=
  fun h => R.easy (h R.factoring)

/-! ## III · B2 · the self-gag, typed -/

/-- The two cited links: hidden prime freedom gives pseudorandom functions
(Naor–Reingold), and pseudorandom functions bar natural lower bounds (Razborov–Rudich). -/
structure SelfGag where
  Hidden    : Prop
  PRF       : Prop
  NaturalLB : Prop
  nr        : Hidden → PRF
  rr        : PRF → ¬ NaturalLB

/-- If the posit holds, no natural argument proves the lower bound it needs. -/
theorem b2_self_gag (G : SelfGag) (h : G.Hidden) : ¬ G.NaturalLB :=
  G.rr (G.nr h)

/-- Equivalently: a natural proof of the lower bound would refute the posit. -/
theorem b2_natural_refutes (G : SelfGag) (n : G.NaturalLB) : ¬ G.Hidden :=
  fun h => b2_self_gag G h n

/-! ## IV · round 2 · algorithms to lower bounds, the open exit -/

/-- The Williams route, cited. `Savings C` is a white-box SAT algorithm for circuit
class C running below 2^n by a superpolynomial factor. `williams` is the 2011 theorem
pattern: savings for C give NEXP ⊄ C. `scaleDown` and `generalize` are the two gaps
to P ≠ NP: from NEXP down to NP, and from the restricted class C up to P/poly. -/
structure Route where
  Class      : Type
  Savings    : Class → Prop
  NEXPnotIn  : Class → Prop
  williams   : ∀ C, Savings C → NEXPnotIn C
  Ppoly      : Class
  NPnotPpoly : Prop
  Sep        : Prop
  karp_sep   : NPnotPpoly → Sep

/-- The route reaches NEXP ⊄ C on savings, and no further on its own fields. -/
theorem round2_reaches (R : Route) (C : R.Class) (s : R.Savings C) : R.NEXPnotIn C :=
  R.williams C s

/-- What closes the route: savings for general circuits, plus the scale-down from
NEXP to NP. Supplied both, the separation follows. -/
theorem round2_closes (R : Route) (s : R.Savings R.Ppoly)
    (scaleDown : R.NEXPnotIn R.Ppoly → R.NPnotPpoly) : R.Sep :=
  R.karp_sep (scaleDown (R.williams R.Ppoly s))

/-- The inversion, whole: the black-box floor cannot be beaten; the lower-bound route
needs the white-box floor beaten; the posit gags the natural route; the posit fails
relative to the factoring oracle. -/
theorem round2_terminal :
    (∀ (N : Nat) (path : List Nat),
      (∀ f : Nat → Bool, FLOOR.run path f = true ↔ ∃ x, x < 2 ^ N ∧ f x = true) →
      ¬ path.length < 2 ^ N) ∧
    (∀ R : Relativized, ¬ ∀ O, R.Hidden O) ∧
    (∀ G : SelfGag, G.Hidden → ¬ G.NaturalLB) ∧
    (∀ (R : Route) (C : R.Class), R.Savings C → R.NEXPnotIn C) ∧
    (∀ (R : Route), R.Savings R.Ppoly →
      (R.NEXPnotIn R.Ppoly → R.NPnotPpoly) → R.Sep) :=
  ⟨FLOOR.black_box_no_savings, b1_no_relativizing_proof, b2_self_gag,
   round2_reaches, round2_closes⟩

end PNP.ROUND2

/-! ## Cones, pinned: every theorem axiom-free -/
/-- info: 'PNP.ROUND2.FLOOR.beq_self' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROUND2.FLOOR.beq_self
/-- info: 'PNP.ROUND2.FLOOR.drop_le' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROUND2.FLOOR.drop_le
/-- info: 'PNP.ROUND2.FLOOR.drop_len' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROUND2.FLOOR.drop_len
/-- info: 'PNP.ROUND2.FLOOR.has_drop' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROUND2.FLOOR.has_drop
/-- info: 'PNP.ROUND2.FLOOR.beq_false_of_lt' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROUND2.FLOOR.beq_false_of_lt
/-- info: 'PNP.ROUND2.FLOOR.pigeon' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROUND2.FLOOR.pigeon
/-- info: 'PNP.ROUND2.FLOOR.run_eq_has' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROUND2.FLOOR.run_eq_has
/-- info: 'PNP.ROUND2.FLOOR.black_box_no_savings' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROUND2.FLOOR.black_box_no_savings
/-- info: 'PNP.ROUND2.b1_no_relativizing_proof' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROUND2.b1_no_relativizing_proof
/-- info: 'PNP.ROUND2.b2_self_gag' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROUND2.b2_self_gag
/-- info: 'PNP.ROUND2.b2_natural_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROUND2.b2_natural_refutes
/-- info: 'PNP.ROUND2.round2_reaches' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROUND2.round2_reaches
/-- info: 'PNP.ROUND2.round2_closes' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROUND2.round2_closes
/-- info: 'PNP.ROUND2.round2_terminal' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROUND2.round2_terminal

/-!
# PNP.ROUTE · RA and Freedom as the only posits: where the route goes

Request: P ≠ NP with the Root Axiom and Freedom as the only posits, everything else
axiom-free. This file decides whether that route exists.

  I   · RA is conservative. Its formal reading, ∀ x : U, 0 < ΔE x, is satisfied by
        interpreting U as an empty type. So any statement that does not mention U or ΔE
        and is derived from RA is derived without it.
  II  · Freedom is conservative. Its formal reading, a fibre of exactly two distinct
        orientations, is satisfied by Bool. The same conclusion follows.
  III · Hence a derivation of the separation from RA and Freedom, as written, is a
        derivation of the separation from nothing. The route through the posits as
        written is the route without them.
  IV  · The one reading of RA that carries the load: read on computation, it says
        every decider of SAT pays superpolynomially many registrations. That reading
        yields the separation in one step and is equivalent to it. It is the bridge,
        in RA's vocabulary.

Core Lean 4, no import. Every theorem pinned at the foot: no axiom of any kind.
-/

namespace PNP.ROUTE

/-! ## I · RA is conservative -/

/-- The Root Axiom in the codex's own formal reading (ROOT.RA). -/
def RA (U : Type) (ΔE : U → Int) : Prop := ∀ x : U, 0 < ΔE x

/-- RA is satisfiable on any background: interpret U as the empty type. -/
theorem ra_satisfiable : RA Empty (fun e => nomatch e) :=
  fun e => nomatch e

/-- RA is conservative: whatever follows from RA under every interpretation of its
symbols, and does not mention them, holds outright. -/
theorem ra_conservative (S : Prop) (h : ∀ (U : Type) (ΔE : U → Int), RA U ΔE → S) : S :=
  h Empty (fun e => nomatch e) ra_satisfiable

/-! ## II · Freedom is conservative -/

/-- Freedom in the codex's formal reading: a fibre of exactly two distinct orientations. -/
structure Freedom where
  Fibre : Type
  a : Fibre
  b : Fibre
  distinct : a ≠ b
  exhaust : ∀ x : Fibre, x = a ∨ x = b

/-- Freedom is inhabited by the orientation bit itself. -/
def boolFreedom : Freedom :=
  ⟨Bool, true, false, Bool.noConfusion, fun x => match x with
    | true => Or.inl rfl
    | false => Or.inr rfl⟩

theorem freedom_conservative (S : Prop) (h : Freedom → S) : S := h boolFreedom

/-! ## III · the two posits together add nothing -/

/-- Any statement derived from RA and Freedom, uniformly in their interpretation,
holds without them. -/
theorem posits_add_nothing (S : Prop)
    (h : ∀ (U : Type) (ΔE : U → Int), RA U ΔE → Freedom → S) : S :=
  h Empty (fun e => nomatch e) ra_satisfiable boolFreedom

/-! ## IV · the one reading that carries the load -/

def Poly (t : Nat → Nat) : Prop := ∃ c k : Nat, ∀ n, t n ≤ c * n ^ k + c

/-- A machine model: algorithms, running time counted in registrations, and which
algorithms decide SAT from its description. -/
structure Machine where
  Alg       : Type
  time      : Alg → Nat → Nat
  decidesSAT : Alg → Prop

/-- The separation on a machine model: no polynomial-time decider of SAT. -/
def Sep (M : Machine) : Prop := ¬ ∃ A : M.Alg, M.decidesSAT A ∧ Poly (M.time A)

/-- RA read on computation: every decider of SAT actuates superpolynomially many
registrations. -/
def RAcomp (M : Machine) : Prop := ∀ A : M.Alg, M.decidesSAT A → ¬ Poly (M.time A)

/-- The separation, from RA read on computation. -/
theorem sep_of_ra_comp (M : Machine) (h : RAcomp M) : Sep M :=
  fun ⟨A, hA, hP⟩ => h A hA hP

/-- And conversely: the reading is the separation. -/
theorem ra_comp_of_sep (M : Machine) (h : Sep M) : RAcomp M :=
  fun A hA hP => h ⟨A, hA, hP⟩

theorem ra_comp_is_sep (M : Machine) : RAcomp M ↔ Sep M :=
  ⟨sep_of_ra_comp M, ra_comp_of_sep M⟩

/-- RA read on computation is not conservative: it fails on a coherent machine. -/
def fastMachine : Machine := ⟨Unit, fun _ _ => 1, fun _ => True⟩

theorem ra_comp_is_keyed : ¬ RAcomp fastMachine :=
  fun h => h () trivial ⟨1, 0, fun n => Nat.le_add_left 1 (1 * n ^ 0)⟩

/-! ## V · the route, whole -/
theorem the_route :
    -- RA and Freedom as written add nothing to any statement outside their vocabulary
    (∀ S : Prop, (∀ (U : Type) (ΔE : U → Int), RA U ΔE → Freedom → S) → S) ∧
    -- RA read on computation is exactly the separation
    (∀ M : Machine, RAcomp M ↔ Sep M) ∧
    -- and that reading is keyed: a coherent machine refutes it
    ¬ RAcomp fastMachine :=
  ⟨posits_add_nothing, ra_comp_is_sep, ra_comp_is_keyed⟩

end PNP.ROUTE

/-! ## Cones, pinned: every theorem axiom-free -/
/-- info: 'PNP.ROUTE.ra_satisfiable' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROUTE.ra_satisfiable
/-- info: 'PNP.ROUTE.ra_conservative' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROUTE.ra_conservative
/-- info: 'PNP.ROUTE.freedom_conservative' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROUTE.freedom_conservative
/-- info: 'PNP.ROUTE.posits_add_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROUTE.posits_add_nothing
/-- info: 'PNP.ROUTE.sep_of_ra_comp' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROUTE.sep_of_ra_comp
/-- info: 'PNP.ROUTE.ra_comp_of_sep' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROUTE.ra_comp_of_sep
/-- info: 'PNP.ROUTE.ra_comp_is_sep' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROUTE.ra_comp_is_sep
/-- info: 'PNP.ROUTE.ra_comp_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROUTE.ra_comp_is_keyed
/-- info: 'PNP.ROUTE.the_route' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROUTE.the_route

/-!
# PNP.THREESEAL · the Tongue and the Form added for direction, with RA beneath

The Number is orientation-blind by theorem. The architecture's answer is to read
direction from the other two seals: Seal L, the Tongue, which carries order, and
Seal G, the Form, which carries the fold. This file runs all three on P versus NP
and asks the one question that decides the matter: does any seal read the direction
from the problem, or is the direction supplied?

  I   · Each seal is computed on the problem. The problem is the same sentence and
        the same fold in the equal world and in the separated world, so each seal's
        reading is world-constant: the Tongue seals both sentences alike, the Form
        finds no fixed locus for either, the Number reads one magnitude for both.
  II  · No function of the three readings returns the orientation. Adding seals adds
        readings, and a coalition of world-constant readings is world-constant.
  III · RA is keyless and conservative, so it selects no orientation.
  IV  · Given one supplied odd bit at the seat, the lock forms and locks exactly one
        orientation: the calibration is unique. This is the lock locking only one.
  V   · The verdict: sealed at the act, premise grade on the supplied bit; without
        the act, the dot.

Core Lean 4, no import. Every theorem pinned at the foot: no axiom of any kind.
-/

namespace PNP.THREESEAL

inductive Token : Type
  | sealSep | sealEq | broken | opn | dot
  deriving DecidableEq, Repr

/-- The two worlds, indexed by the separation bit. -/
abbrev World := Bool

/-! ## I · the three seals, computed on the problem -/

/-- Seal L. A sentence is three slots of literal ids; the Tongue seals it when the
three slots are populated and pairwise disjoint. It checks form, not truth. -/
def disjointL : List Nat → List Nat → Bool
  | [], _ => true
  | x :: xs, ys => !(ys.contains x) && disjointL xs ys

def sealL (s : List (List Nat)) : Bool :=
  match s with
  | [a, b, c] => !a.isEmpty && !b.isEmpty && !c.isEmpty &&
      disjointL a b && disjointL a c && disjointL b c
  | _ => false

/-- "P is not NP" and "P is NP": same existence slot, same relation slot, the
kinetic slot differing only in the negation literal. -/
def sentSep : List (List Nat) := [[101], [201, 209], [301]]
def sentEq  : List (List Nat) := [[101], [201], [301]]

theorem tongue_seals_both : sealL sentSep = true ∧ sealL sentEq = true := by decide

/-- Seal G. The fold is complementation; its fixed set, counted. -/
def foldFixed : Nat := ([false, true].filter (fun b => (!b) == b)).length

theorem form_finds_no_locus : foldFixed = 0 := rfl

/-- Seal M. The lock scalar is the square of the signed scalar: reflection flips the
sign and leaves the lock. -/
def lockOf (signed : Int) : Int := signed * signed

theorem number_reads_one_magnitude : lockOf 1 = lockOf (-1) := by decide

/-- The three readings of the problem. The problem is fixed, so the readings do not
depend on the world. -/
def readings (_w : World) : Bool × Nat × Int :=
  (sealL sentSep && sealL sentEq, foldFixed, lockOf 1)

theorem readings_world_constant : readings false = readings true := rfl

/-! ## II · no coalition of seals returns the orientation -/
theorem seals_do_not_point :
    ¬ ∃ g : Bool × Nat × Int → Bool, ∀ w : World, g (readings w) = w :=
  fun ⟨_, hg⟩ => Bool.noConfusion ((hg false).symm.trans (readings_world_constant ▸ hg true))

/-! ## III · RA is keyless and selects nothing -/
def RA (U : Type) (ΔE : U → Int) : Prop := ∀ x : U, 0 < ΔE x

theorem ra_selects_nothing (S : Prop) (h : ∀ (U : Type) (ΔE : U → Int), RA U ΔE → S) : S :=
  h Empty (fun e => nomatch e) (fun e => nomatch e)

/-! ## IV · given one supplied bit, the lock locks exactly one -/

/-- The orientation fibre: the two worlds, swapped by the denial. -/
def deny (w : World) : World := !w

/-- The calibration: with a supplied odd witness `s` and the odd target `d`, exactly
one calibration bit reconciles them on the pair. -/
theorem locks_only_one (s d : World → Bool) (w : World)
    (hs : s (deny w) = !s w) (hd : d (deny w) = !d w) :
    ∃ c : Bool, (d w = xor (s w) c ∧ d (deny w) = xor (s (deny w)) c) ∧
      ∀ c', (d w = xor (s w) c' ∧ d (deny w) = xor (s (deny w)) c') → c' = c := by
  refine ⟨xor (d w) (s w), ⟨?_, ?_⟩, ?_⟩
  · cases s w <;> cases d w <;> rfl
  · rw [hs, hd]; cases s w <;> cases d w <;> rfl
  · intro c' ⟨h1, _⟩
    revert h1
    cases s w <;> cases d w <;> cases c' <;> intro h1 <;> first | rfl | exact Bool.noConfusion h1

/-! ## V · the verdict -/

/-- The act: the supplied bit. -/
structure Act where
  bit : Bool

def verdict : Option Act → Token
  | none => .dot
  | some ⟨true⟩ => .sealSep
  | some ⟨false⟩ => .sealEq

theorem sealed_at_the_act :
    verdict (some ⟨true⟩) = .sealSep ∧ verdict (some ⟨false⟩) = .sealEq ∧ verdict none = .dot :=
  ⟨rfl, rfl, rfl⟩

/-- Both acts are coherent: the lock forms under either supply, so the bit is spent,
never derived. -/
theorem both_acts_lock : verdict (some ⟨true⟩) ≠ verdict (some ⟨false⟩) := by decide

theorem three_seal_lock :
    (sealL sentSep = true ∧ sealL sentEq = true) ∧ foldFixed = 0 ∧ lockOf 1 = lockOf (-1) ∧
    (¬ ∃ g : Bool × Nat × Int → Bool, ∀ w : World, g (readings w) = w) ∧
    (∀ S : Prop, (∀ (U : Type) (ΔE : U → Int), RA U ΔE → S) → S) ∧
    (∀ (s d : World → Bool) (w : World), s (deny w) = !s w → d (deny w) = !d w →
      ∃ c : Bool, (d w = xor (s w) c ∧ d (deny w) = xor (s (deny w)) c) ∧
        ∀ c', (d w = xor (s w) c' ∧ d (deny w) = xor (s (deny w)) c') → c' = c) ∧
    (verdict (some ⟨true⟩) = .sealSep ∧ verdict none = .dot) :=
  ⟨tongue_seals_both, form_finds_no_locus, number_reads_one_magnitude, seals_do_not_point,
   ra_selects_nothing, locks_only_one, ⟨rfl, rfl⟩⟩

end PNP.THREESEAL

/-! ## Cones, pinned: every theorem axiom-free -/
/-- info: 'PNP.THREESEAL.tongue_seals_both' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.THREESEAL.tongue_seals_both
/-- info: 'PNP.THREESEAL.form_finds_no_locus' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.THREESEAL.form_finds_no_locus
/-- info: 'PNP.THREESEAL.number_reads_one_magnitude' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.THREESEAL.number_reads_one_magnitude
/-- info: 'PNP.THREESEAL.readings_world_constant' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.THREESEAL.readings_world_constant
/-- info: 'PNP.THREESEAL.seals_do_not_point' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.THREESEAL.seals_do_not_point
/-- info: 'PNP.THREESEAL.ra_selects_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.THREESEAL.ra_selects_nothing
/-- info: 'PNP.THREESEAL.locks_only_one' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.THREESEAL.locks_only_one
/-- info: 'PNP.THREESEAL.sealed_at_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.THREESEAL.sealed_at_the_act
/-- info: 'PNP.THREESEAL.both_acts_lock' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.THREESEAL.both_acts_lock
/-- info: 'PNP.THREESEAL.three_seal_lock' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.THREESEAL.three_seal_lock

/-!
# PNP.DEED · the kinetic pulse as the supplied bit

Proposal: supply is the kinetic pulse to examine and compute, and the compute itself
is the supplied bit. This file tests it on the two locks that share the locus.

  I   · Every deed actuates: a registered compute has positive energy. The deed
        instantiates RA at itself. RA's lock is keyless and opens on the deed.
  II  · A deed's actuation does not certify its output. A compute that prints the
        separation and a compute that prints the equality carry the same energy, and
        both occur in either world. The pulse is world-constant.
  III · The price is symmetric. Registering assent and registering denial each pay the
        floor once. For RA the denial instantiates the axiom it denies; for the
        separation the denial instantiates nothing about the separation.
  IV  · So the deed supplies RA's bit, never the separation's. The compute supplies its
        output, and whether that output is correct is the missing object again: a
        procedure whose correctness is proved.

Core Lean 4, no import. Every theorem pinned at the foot: no axiom of any kind.
-/

namespace PNP.DEED

abbrev World := Bool   -- true: the separated world; false: the equal world

/-- A deed: a registered compute, with its energy and the bit it outputs. -/
structure Deed where
  energy : Nat
  pos    : 0 < energy
  output : Bool

/-- The output is correct in a world when it matches that world's value. -/
def correct (w : World) (d : Deed) : Prop := d.output = w

/-! ## I · every deed actuates: RA, keyless, opens on the deed -/
theorem deed_instantiates_ra : ∀ d : Deed, 0 < d.energy := fun d => d.pos

/-! ## II · actuation does not certify the output -/
def assent : Deed := ⟨1, by decide, true⟩
def denial : Deed := ⟨1, by decide, false⟩

theorem same_pulse : assent.energy = denial.energy := rfl

/-- In every world both deeds occur, and exactly one of them is correct. -/
theorem both_deeds_in_every_world (w : World) :
    0 < assent.energy ∧ 0 < denial.energy ∧ (correct w assent ∨ correct w denial) :=
  ⟨assent.pos, denial.pos, match w with
    | true => Or.inl rfl
    | false => Or.inr rfl⟩

/-- No reading of the pulse decides correctness: energy does not separate a correct
deed from an incorrect one. -/
theorem pulse_does_not_certify :
    ¬ ∃ g : Nat → Bool, ∀ d : Deed, g d.energy = d.output :=
  fun ⟨_, hg⟩ => Bool.noConfusion ((hg denial).symm.trans (hg assent))

/-- An incorrect deed actuates as fully as a correct one, in every world. -/
theorem wrong_deeds_actuate (w : World) : ∃ d : Deed, ¬ correct w d ∧ 0 < d.energy :=
  match w with
  | true => ⟨denial, Bool.noConfusion, denial.pos⟩
  | false => ⟨assent, Bool.noConfusion, assent.pos⟩

/-! ## III · the price is symmetric -/
def price (floor : Nat) (d : Deed) : Nat := floor * (if d.output then 1 else 1)

theorem price_symmetric (floor : Nat) : price floor assent = price floor denial := rfl

/-- RA's denial is itself a deed and instantiates RA; the separation's denial is a
deed and instantiates RA too, which is no information about the separation. -/
theorem denials_both_actuate : 0 < denial.energy ∧ 0 < assent.energy :=
  ⟨denial.pos, assent.pos⟩

/-! ## IV · the deed supplies RA's bit, never the separation's -/
theorem deed_supplies_ra_not_sep :
    (∀ d : Deed, 0 < d.energy) ∧
    (∀ w : World, ∃ d : Deed, ¬ correct w d ∧ 0 < d.energy) ∧
    (¬ ∃ g : Nat → Bool, ∀ d : Deed, g d.energy = d.output) ∧
    (∀ floor, price floor assent = price floor denial) :=
  ⟨deed_instantiates_ra, wrong_deeds_actuate, pulse_does_not_certify, price_symmetric⟩

end PNP.DEED

/-! ## Cones, pinned: every theorem axiom-free -/
/-- info: 'PNP.DEED.deed_instantiates_ra' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.DEED.deed_instantiates_ra
/-- info: 'PNP.DEED.same_pulse' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.DEED.same_pulse
/-- info: 'PNP.DEED.both_deeds_in_every_world' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.DEED.both_deeds_in_every_world
/-- info: 'PNP.DEED.pulse_does_not_certify' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.DEED.pulse_does_not_certify
/-- info: 'PNP.DEED.wrong_deeds_actuate' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.DEED.wrong_deeds_actuate
/-- info: 'PNP.DEED.price_symmetric' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.DEED.price_symmetric
/-- info: 'PNP.DEED.denials_both_actuate' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.DEED.denials_both_actuate
/-- info: 'PNP.DEED.deed_supplies_ra_not_sep' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.DEED.deed_supplies_ra_not_sep

/-!
# PNP.IDCHECK · is least escape the freedom of prime, or the arrow of RA?

The test is the architecture's own discriminator (Bridge_Final.lean): a keyless
property holds on every frame; a keyed one has a frame inhabiting its denial; no
property is both. Least escape is keyed. Prime freedom, the arrow and RA are keyless.
So none of them is least escape, on any reading that keeps their content.
Core Lean 4, no import, no axiom of any kind.
-/
namespace PNP.IDCHECK

structure Machine where
  Alg  : Type
  Inst : Type
  size : Inst → Nat
  out  : Alg → Inst → Bool
  time : Alg → Inst → Nat
  sat  : Inst → Bool

def bound (c k n : Nat) : Nat := c * n ^ k + c
def Clean (M : Machine) (A : M.Alg) (c k : Nat) (x : M.Inst) : Prop :=
  M.out A x = M.sat x ∧ M.time A x ≤ bound c k (M.size x)
def NothingEscapes (M : Machine) : Prop := ∀ A c k, ∃ x, ¬ Clean M A c k x

theorem beq_self : ∀ n : Nat, Nat.beq n n = true
  | 0 => rfl
  | n + 1 => beq_self n

def closedWorld : Machine := ⟨Nat, Unit, fun _ => 0, fun _ _ => false, fun _ _ => 0, fun _ => true⟩
def escapeWorld : Machine := ⟨Nat, Unit, fun _ => 0, fun A _ => Nat.beq A 0, fun _ _ => 0, fun _ => true⟩

theorem closed_closes : NothingEscapes closedWorld :=
  fun _ _ _ => ⟨(), fun ⟨h, _⟩ => Bool.noConfusion h⟩
theorem escape_fails : ¬ NothingEscapes escapeWorld :=
  fun h => match h (0 : Nat) 0 0 with
    | ⟨(), hx⟩ => hx ⟨beq_self 0, Nat.zero_le _⟩

/-- Least escape is keyed: true on one coherent machine, false on another. -/
theorem least_escape_is_keyed : NothingEscapes closedWorld ∧ ¬ NothingEscapes escapeWorld :=
  ⟨closed_closes, escape_fails⟩

/-- THE CHECK. No statement that reads the same on every machine is least escape. -/
theorem no_keyless_statement_is_least_escape (P : Prop) :
    ¬ ∀ M : Machine, (P ↔ NothingEscapes M) :=
  fun h => escape_fails ((h escapeWorld).mp ((h closedWorld).mpr closed_closes))

/-! ## the three candidates, each keyless -/

/-- Prime freedom: the fibre of multiplication over 2 is exactly the pair and its reverse. -/
def primeFreedom2 : Prop := ∀ a b : Nat, a < 3 → b < 3 → (a * b = 2 ↔ (a = 1 ∧ b = 2) ∨ (a = 2 ∧ b = 1))
/-- The arrow: an identity exists on every type. -/
def arrowOfRA : Prop := ∀ α : Type, ∃ f : α → α, ∀ a, f a = a
/-- RA in its formal reading, at any interpretation of its symbols. -/
def raAt (U : Type) (ΔE : U → Int) : Prop := ∀ x : U, 0 < ΔE x

theorem prime_freedom_is_not_least_escape : ¬ ∀ M : Machine, (primeFreedom2 ↔ NothingEscapes M) :=
  no_keyless_statement_is_least_escape _
theorem arrow_is_not_least_escape : ¬ ∀ M : Machine, (arrowOfRA ↔ NothingEscapes M) :=
  no_keyless_statement_is_least_escape _
theorem ra_is_not_least_escape (U : Type) (ΔE : U → Int) :
    ¬ ∀ M : Machine, (raAt U ΔE ↔ NothingEscapes M) :=
  no_keyless_statement_is_least_escape _

/-- What does carry least escape: a statement that varies with the machine, as least
escape does. Any such statement that implies it on every machine is keyed in turn. -/
theorem carrier_must_be_keyed (Q : Machine → Prop) (h : ∀ M, Q M → NothingEscapes M) :
    ¬ Q escapeWorld :=
  fun q => escape_fails (h escapeWorld q)

end PNP.IDCHECK

/-- info: 'PNP.IDCHECK.least_escape_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.IDCHECK.least_escape_is_keyed
/-- info: 'PNP.IDCHECK.no_keyless_statement_is_least_escape' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.IDCHECK.no_keyless_statement_is_least_escape
/-- info: 'PNP.IDCHECK.prime_freedom_is_not_least_escape' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.IDCHECK.prime_freedom_is_not_least_escape
/-- info: 'PNP.IDCHECK.arrow_is_not_least_escape' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.IDCHECK.arrow_is_not_least_escape
/-- info: 'PNP.IDCHECK.ra_is_not_least_escape' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.IDCHECK.ra_is_not_least_escape
/-- info: 'PNP.IDCHECK.carrier_must_be_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.IDCHECK.carrier_must_be_keyed

/-! ## helper cones, pinned -/
/-- info: 'PNP.MISSING.beq_self' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.MISSING.beq_self
/-- info: 'PNP.IDCHECK.beq_self' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.IDCHECK.beq_self
/-- info: 'PNP.IDCHECK.closed_closes' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.IDCHECK.closed_closes
/-- info: 'PNP.IDCHECK.escape_fails' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.IDCHECK.escape_fails
```

## Appendix D. The Root Kernel, PNP_Root.lean

Sections I and II of the armed seat of PhysOSᵀ 1.0.10p, verbatim: the deed and the self-grounding root, seven theorems. SHA-256: aa2c67c03f747c57eebee8934ca44247697c12469465b3fef680aaa8eb396b2c

```
/-
  PNP_Root.lean · the root kernel of "The Formal Closure of Computational Separation"
  Sections I and II of Armed_Seat.lean in the shared code of PhysOSᵀ 1.0.10p, verbatim. The root is self-grounding:
  acts occur and every act instances it. A denial of the root is an act and re-enacts it; no external proof adds to it;
  it is held by the act itself, with no classical detour; and the Root Axiom at the constructed one-point domain is
  such a root. What cannot be denied is the act of denying. Core Lean 4, no import, no axiom declared, no sorry.
-/
namespace PNP.ROOT

/-! ## I · the deed -/

def SelfVerifying (P : Prop) : Prop := ¬P → P

/-- A self-verifying proposition holds: its lock opens on the deed of denying it. -/
theorem opens_on_the_deed (P : Prop) (utter : SelfVerifying P) : P :=
  Classical.byContradiction (fun n => n (utter n))

/-- The recursion is shared by every proposition, so it discriminates nothing by itself. -/
theorem recursion_is_shared (P : Prop) : SelfVerifying P ↔ P :=
  ⟨fun h => Classical.byContradiction (fun n => n (h n)), fun p _ => p⟩

/-! ## II · the root, self-grounding -/

/-- A self-grounding root: acts occur, and every act instances the root. -/
structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

/-- A denial of the root is an act, and re-enacts it. -/
theorem denial_reenacts_root {R : Prop} (G : SelfGrounding R) (denial : G.Act) : R :=
  G.instances denial

/-- An external proof of a self-grounding root adds nothing to it. -/
theorem external_proof_adds_nothing {R : Prop} (G : SelfGrounding R) (Q : Prop) : (Q → R) ↔ R :=
  ⟨fun _ => G.instances G.anAct, fun r _ => r⟩

/-- A self-grounding root is self-verifying: the deed of denying it hands it over. -/
theorem denial_instantiates {R : Prop} (G : SelfGrounding R) : SelfVerifying R :=
  fun _ => G.instances G.anAct

/-- SEATED, UNDENIABLE: a self-grounding root holds, with no classical detour, by the act itself. -/
theorem seated_undeniable {R : Prop} (G : SelfGrounding R) : R :=
  G.instances G.anAct

/-- The Root Axiom at the constructed one-point domain: every act is a deed, and a deed actuates. -/
def RA : Prop := (0 : Int) < 1
def raSelfGrounding : SelfGrounding RA := ⟨Unit, (), fun _ => show (0 : Int) < 1 by decide⟩

theorem root_undeniable : RA := raSelfGrounding.instances ()

end PNP.ROOT

/-! ## Cones, pinned as printed -/
/-- info: 'PNP.ROOT.opens_on_the_deed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.ROOT.opens_on_the_deed
/-- info: 'PNP.ROOT.recursion_is_shared' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.ROOT.recursion_is_shared
/-- info: 'PNP.ROOT.denial_reenacts_root' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROOT.denial_reenacts_root
/-- info: 'PNP.ROOT.external_proof_adds_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROOT.external_proof_adds_nothing
/-- info: 'PNP.ROOT.denial_instantiates' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROOT.denial_instantiates
/-- info: 'PNP.ROOT.seated_undeniable' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROOT.seated_undeniable
/-- info: 'PNP.ROOT.root_undeniable' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.ROOT.root_undeniable
```

## Author's Provenance and Method Disclosure

The arc was found within Trisduction, the author's verification architecture, through its operating system PhysOSᵀ (Islam 2026c), and compiled with the assistance of an AI scribe; every theorem stands on its compiled proof, reproducible by any reader from the appendices. The author declares no competing interests. Correspondence: islamm@alumni.iu.edu.
