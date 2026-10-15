# Audit digest · A Formal Proof of the Riemann Hypothesis: The Twin Binder, One Locus · 2.0.0

The paper, its Markdown master and its Math Journal PDF carry one version, 2.0.0, and one date, 15 October 2026. They are read against the deposited file `FINAL_BINDING/RH Binding/RH_Both_Sides_Formal_Master_v3_0_22_CC.lean`: 12,994 lines, 712,297 bytes, SHA-256 `75b3066493a89a0c814e7aed1151eb0dfe01efc1769ee7e30728cba81f4f4f05`, seated at `16d3f1b`. That edition is the author's hardened build of v3.0.22, compiled under Lean 4.19.0 with Mathlib v4.19.0: exit code 0, zero errors, zero warnings, zero `#guard_msgs` mismatches. The file holds no axiom, no `sorry` and no `native_decide`. Edition 2.0.0 was first pinned to v3.0.16 and carried in place through v3.0.19 to v3.0.22_CC on the day of its release.

## 1. Lineage

Edition 1.0.0 stands beside this one, pinned to v3.0.12, with its own digest as `RH_Twin_Binder_One_Locus_v1_0_0_audit_digest.md`. That digest records cycle twinbinder309 (eight framework-blind rounds, 86 findings) and two targeted passes against v3.0.10 and v3.0.12 (13 and 8 findings). Every finding there was repaired, scoped or refused on the record.

## 2. Re-pin from v3.0.12 to v3.0.22_CC

The paper was carried through v3.0.13, v3.0.16, v3.0.17 and v3.0.19 to v3.0.22_CC. The material added was:

- the block theorem over ℂ, `no_closed_principle_decides`;
- the Pause and the forward pass, unconditional: `pause_is_unconditional`, `forward_pass_unconditional`;
- the look back and the retrospective seal: `look_back_is_the_closure`, `the_unconditional_retrospective_seal`, `rh_from_pause_and_look_back` (§7.4);
- the canonical apex: `CanonicalRH` (Definition 7.21), `canonical_rh_unconditional` and `canonical_property_holds_off_the_line` (Theorem 7.22), the projection-side invariant, true of the record of every configuration;
- the Monism witness over ℂ: `RootReadTwice` (Definition 7.23), `root_read_twice_iff_value`, `canonical_record_carries_monism`, `monism_separates_shared_record` (Theorem 7.24), and the canonical normal-form bridge, `canonical_normal_form_bridge` (Theorem 7.25);
- the analytic target reduction: `RightHalfStripZeroFree` (Definition 7.26), `euler_product_boundary` and `analytic_target_reduction` (Theorem 7.27), with no premise proving the hypothesis, the look back, retraction injectivity of the zeros and the witness at the zeros each equivalent to the absence of nontrivial zeros from the right half-strip ½ < Re s ≤ 1;
- the joint physico-formal seal, `physico_formal_supplies_look_back_and_rh` (Theorem 7.28, tier c): the concrete capstone read at `ClassicalRH := LookBack`, composed with `rh_from_pause_and_look_back`, returns `LookBack ∧ RiemannHypothesis` from the reading of the look back and the physical premises;
- Round 2, with no premise: the closed term `record_self_grounding_RO` supplies the self-grounding argument of Part III's blocked route at the record of the zeros, and `round2_halted_uniduction`, `round2_residual_monism` and `round2_absolute_closure` (Theorem 7.29) carry no premise;
- every route through the bit: `every_route_passes_the_bit`, for every proposition `Q`, `(Q → RiemannHypothesis) → Q →` the zero-free right half-strip, the look back, retraction injectivity of the zeros and the witness at the zeros; and `analytic_route_sealed` (Theorem 7.30), binding the block of uniform routes, the analytic target, the Round 2 halt and that passage;
- the terminal certification as a theorem: `the_terminal_certification` (Theorem 7.31) binds by `type_of%` all thirty theorems the file's terminal block cites, so each is checked by checking one pinned identifier; the block's counts and paraphrases stay prose;
- the complex extensions at thirty-three conjuncts;
- the terminal block of v3.0.22_CC and its header at the types (Appendix A.3).

Mechanical receipts:

- **Theorem heads:** 67. They cite 136 identifiers, 132 theorems and 4 definitions. Every one is pinned, and every chip equals the compiler's pin.
- **Census:** 876 theorems, 359 definitions, 52 structures, 7 inductive types and 21 namespaces.
- **Pins:** 707, split 391 / 34 / 133 / 149. There are 966 `#print axioms` commands, 259 of them unguarded.
- **Listings:** 38, each taken verbatim from the deposited file at its master line numbers.

## 3. Targeted framework-blind passes on the new and changed text

- **Pass 3, against v3.0.13:** 15 findings, 4 load-bearing, 4 structural and 7 cosmetic. All were repaired. Release-framing clauses that stated more than the types carry were reworded to the types.
- **Pass 4, against v3.0.16:** 14 findings, 2 load-bearing, 7 structural and 5 cosmetic. All were repaired.
- **Pass 5, against v3.0.19:** 15 findings, 1 load-bearing, 8 structural and 6 cosmetic. All were repaired.
  - The step from the physical closure to Mathlib's `RiemannHypothesis` is stated as the file makes it: the concrete capstone, read at the look back, returns the look back from its printed premises, the reading among them, and `rh_from_pause_and_look_back` returns the hypothesis inside the joint seal.
  - The analytic target is stated as an equivalence throughout; `RightHalfStripZeroFree` is a definition the reduction binds to the hypothesis.
  - The decoupling is stated at the binders: no capstone of either closure and neither binder (Theorems 9.17 and 10.1) uses a theorem of the other; the two bridges, §X-i and the joint seal, are carried by the complex extensions and through them by the twin binder.
- **Verification of pass 5:** a further independent read ruled eleven findings resolved and four partial, and raised seven new points, one load-bearing (a clause that dropped the reading premise of the joint seal) and six cosmetic. All were repaired and the repairs checked mechanically.
- **The Lean file, v3.0.22_CC:** a static referee read of the draft against v3.0.22 found no compile risk and thirteen points where prose said more than a type proves, among them a certification binder that held 18 of the 29 theorems its block cited. All were repaired before the compile; the compiled file binds all thirty.
- **Pass 6, against v3.0.22_CC:** 9 findings, 1 load-bearing, 5 structural and 3 cosmetic. All were repaired.
  - The load-bearing point is the file's own. Its header's decoupling clause names the two bridges as the declarations of Part X that use Parts VII and VIII; at the types `the_terminal_certification`, also in Part X, binds the carrier closure of Part VIII and the joint seal. The paper now says no theorem of Part X takes a physical premise outside the joint seal, names the terminal certification as the third declaration that uses Parts VII and VIII, and reports the header's clause as it stands.
  - The others: the theorem numbers in Theorem 7.31; the fourth conjunct of `analytic_route_sealed` stated as the half-strip and look back of `every_route_passes_the_bit`; "equivalent" for two readings of the apex; the blocked route cited at its conjuncts; the least erasure of the record, not the record, as the self-grounding root; "every theorem the block cites" where the block also cites a definition; the content of `every_route_passes_the_bit`, that the hypothesis implies each of the four, stated at its type; and the proofs of Theorems 7.29 and 7.30 naming each conjunct.

## 4. Notes on the file's terminal block and header

The notes recorded against v3.0.19 are closed in v3.0.22_CC. Its block counts seven theorems concluding RH and names the five that take the look back or a reading proved equivalent to it, `no_offline_refuter_seals_rh` taking provability premises and the joint seal the reading with the physical premises. Its header states the blocked routes and the passage of every route through the bit at their types, and its decoupling clause names both bridges, the parts they use and the binders that carry them. v3.0.22 was built on v3.0.19 before that edition's in-place correction and reverted its block; v3.0.22_CC restores the correction and extends it.

One note stands against v3.0.22_CC. The header's decoupling clause (lines 30 to 34) names the two bridges as the declarations of Part X that use Parts VII and VIII; `the_terminal_certification`, also in Part X, takes no premise and binds the carrier closure of Part VIII and the joint seal. The paper reports the clause as the file states it and the declaration at its type (Theorem 7.31, Appendix A.3).

## 5. Appendix B and PSP-TRIAXIAL-NEC-SUFF-01

Appendix B's account of the triaxial method states the triad's irreducibility at its type: the PhysOS mother codex, v1.0.16p, proves by `decide` that two linear equations in three unknowns over GF(2) never have exactly one solution (`two_axes_never_lock`), so on every locked system each pair of equations leaves the point open (`triad_irreducible`); that the triad suffices to map its domain stands as a premise, as PSP-TRIAXIAL-NEC-SUFF-01 carries it. PSP-ONE-BIT-NEC-SUFF-01 is not cited: what it states abstractly the paper already states at concrete types (Theorems 7.18, 7.19, 7.27 and 7.30).

## 6. Build

- **Engine:** XeLaTeX, two passes.
- **Output:** 186 pages, no overfull line. The abstract fits page 1, the end-of-manuscript probe passes and the margin scan is clean.
- **PDF SHA-256:** `e17c6008bf5471c9fb19029b7194b6fd2f5a03fd61789e1e4e671f79867fb1eb`.
- **Markdown SHA-256:** `648cf7d0b3e8c8f61e17a52ad29bb76f6db4af990934e0a377433362419ec84a`.
- **Source:** the LaTeX source stands beside the paper as `RH_Twin_Binder_One_Locus_v2_0_0_source.zip`, SHA-256 `3daa196c3e6554b0c09169513012629b49f5e4a7f998841f89b64a739c37d95b`.
