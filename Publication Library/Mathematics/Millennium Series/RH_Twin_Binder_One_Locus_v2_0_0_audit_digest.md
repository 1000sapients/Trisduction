# Audit digest · A Formal Proof of the Riemann Hypothesis: The Twin Binder, One Locus · 2.0.0

The paper, its Markdown master and its Math Journal PDF carry one version, 2.0.0, and one date, 15 October 2026. They are read against the deposited file `FINAL_BINDING/RH Binding/RH_Both_Sides_Formal_Master_v3_0_19.lean`: 12,788 lines, 699,993 bytes, SHA-256 `a835a3193e21dadf711dd887c39c4f719c411f3173612cac1e963a3de82d9988`, the edition as corrected in place in its certification block. The file holds no axiom, no `sorry` and no `native_decide`. Edition 2.0.0 was first pinned to v3.0.16 and carried in place to v3.0.19 on the day of its release.

## 1. Lineage

Edition 1.0.0 stands beside this one, pinned to v3.0.12, with its own digest as `RH_Twin_Binder_One_Locus_v1_0_0_audit_digest.md`. That digest records cycle twinbinder309 (eight framework-blind rounds, 86 findings) and two targeted passes against v3.0.10 and v3.0.12 (13 and 8 findings). Every finding there was repaired, scoped or refused on the record.

## 2. Re-pin from v3.0.12 to v3.0.19

The paper was carried through v3.0.13, v3.0.16 and v3.0.17 to v3.0.19. The material added was:

- the block theorem over ℂ, `no_closed_principle_decides`;
- the Pause and the forward pass, unconditional: `pause_is_unconditional`, `forward_pass_unconditional`;
- the look back and the retrospective seal: `look_back_is_the_closure`, `the_unconditional_retrospective_seal`, `rh_from_pause_and_look_back` (§7.4);
- the canonical apex: `CanonicalRH` (Definition 7.21), `canonical_rh_unconditional` and `canonical_property_holds_off_the_line` (Theorem 7.22), the projection-side invariant, true of the record of every configuration;
- the Monism witness over ℂ: `RootReadTwice` (Definition 7.23), `root_read_twice_iff_value`, `canonical_record_carries_monism`, `monism_separates_shared_record` (Theorem 7.24), and the canonical normal-form bridge, `canonical_normal_form_bridge` (Theorem 7.25);
- the analytic target reduction: `RightHalfStripZeroFree` (Definition 7.26), `euler_product_boundary` and `analytic_target_reduction` (Theorem 7.27), with no premise proving the hypothesis, the look back, retraction injectivity of the zeros and the witness at the zeros each equivalent to the absence of nontrivial zeros from the right half-strip ½ < Re s ≤ 1;
- the joint physico-formal seal, `physico_formal_supplies_look_back_and_rh` (Theorem 7.28, tier c): the concrete capstone read at `ClassicalRH := LookBack`, composed with Theorem 7.19, returns `LookBack ∧ RiemannHypothesis` from the reading of the look back and the physical premises;
- the complex extensions at twenty-nine conjuncts;
- the terminal block of v3.0.19 as corrected in place, its canonical apex, Monism witness, analytic target reduction, joint seal and terminal silence (Appendix A.3).

Mechanical receipts:

- **Theorem heads:** 64. They cite 130 identifiers, 126 theorems and 4 definitions. Every one is pinned, and every chip equals the compiler's pin.
- **Census:** 870 theorems, 358 definitions, 52 structures, 7 inductive types and 21 namespaces.
- **Pins:** 700, split 391 / 34 / 133 / 142. There are 959 `#print axioms` commands, 259 of them unguarded.
- **Listings:** 36, each taken verbatim from the deposited file at its master line numbers.

## 3. Targeted framework-blind passes on the new and changed text

- **Pass 3, against v3.0.13:** 15 findings, 4 load-bearing, 4 structural and 7 cosmetic. All were repaired. Release-framing clauses that stated more than the types carry were reworded to the types.
- **Pass 4, against v3.0.16:** 14 findings, 2 load-bearing, 7 structural and 5 cosmetic. All were repaired.
- **Pass 5, against v3.0.19:** 15 findings, 1 load-bearing, 8 structural and 6 cosmetic. All were repaired.
  - The step from the physical closure to Mathlib's `RiemannHypothesis` is stated as the file makes it: the concrete capstone, read at the look back, returns the look back from its printed premises, the reading among them, and Theorem 7.19 of the formal closure returns the hypothesis inside the joint seal.
  - The analytic target is stated as an equivalence throughout; `RightHalfStripZeroFree` is a definition the reduction binds to the hypothesis.
  - The decoupling is stated at the binders: no capstone of either closure and neither binder (Theorems 9.17 and 10.1) uses a theorem of the other; the two bridges, §X-i and the joint seal, are carried by the complex extensions and through them by the twin binder.
- **Verification of pass 5:** a further independent read ruled eleven findings resolved and four partial, and raised seven new points, one load-bearing (a clause that dropped the reading premise of the joint seal) and six cosmetic. The partials and all seven were repaired, and those repairs were checked mechanically. The in-place correction of the file's certification block, which changed no declaration, proof or pin, was then carried into Appendices A.2 and A.3.

## 4. Notes on the file's terminal block and header

- The corrected block counts seven theorems concluding RH, as the file carries, and says six take the look back or a reading proved equivalent to it. At the types that holds of five; the sixth it counts, `no_offline_refuter_seals_rh`, takes provability premises, and the seventh, the joint seal, takes the reading of the look back with the physical premises, as the block states.
- The header's decoupling clause, unchanged since v3.0.12, names one bridge, §X-i. Since v3.0.19 the joint seal is a second, the only theorem of Part X that takes a physical premise.
- The v3.0.16 note that the block's "for ZetaZeros it is therefore the 1-bit apex" lacked a declaration is closed: v3.0.17 lifts `RootReadTwice` to ℂ, and `root_read_twice_iff_value` reads it at the zeros.

The paper reports each point as the file stands.

## 5. Appendix B and PSP-TRIAXIAL-NEC-SUFF-01

Appendix B's account of the triaxial method now states the triad's irreducibility at its type: the PhysOS mother codex, v1.0.16p, proves by `decide` that two linear equations in three unknowns over GF(2) never have exactly one solution (`two_axes_never_lock`), so on every locked system each pair of equations leaves the point open (`triad_irreducible`); that the triad suffices to map its domain stands as a premise, as PSP-TRIAXIAL-NEC-SUFF-01 carries it. PSP-ONE-BIT-NEC-SUFF-01 is not cited: what it states abstractly the paper already states at concrete types (Theorems 7.18, 7.19 and 7.27).

## 6. Build

- **Engine:** XeLaTeX, two passes.
- **Output:** 180 pages, no overfull line. The abstract fits page 1, the end-of-manuscript probe passes and the margin scan is clean.
- **PDF SHA-256:** `f6e2cdeae5e99ee614bdc05561725dbedd910cd75875edeebb3cda008a5a4ad9`.
- **Markdown SHA-256:** `3c65a96bda453cfb2f0a152fef8cb9f8884c3205e8417b7cdf5051319676e120`.
- **Source:** the LaTeX source stands beside the paper as `RH_Twin_Binder_One_Locus_v2_0_0_source.zip`, SHA-256 `e8df52eb3be29d4bf4bb9e56c15dea674a58fc3fd44aea06e71656caf0c05ced`.
