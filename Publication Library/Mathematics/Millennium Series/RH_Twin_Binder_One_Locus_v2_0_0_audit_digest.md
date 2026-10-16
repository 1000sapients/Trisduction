# Audit digest · A Formal Proof of the Riemann Hypothesis: The Twin Binder, One Locus · 2.0.0

The paper, its Markdown master and its Math Journal PDF carry one version, 2.0.0, and one date, 15 October 2026. They are read against the deposited file `FINAL_BINDING/RH Binding/RH_Both_Sides_Formal_Master_v3_0_24_CC.lean`: 13,366 lines, 733,409 bytes, SHA-256 `8345ede86c0814a902c94f318be799c0adafaa3996e4536cb6a8dff06c30c8fc`, seated at `b272c46`. The seat compiled it under Lean 4.19.0 with Mathlib v4.19.0: exit code 0, zero errors, zero warnings, zero `#guard_msgs` mismatches. It declares no axiom and holds no `sorry`. Edition 2.0.0 was first pinned to v3.0.16, then carried in place through v3.0.19 and v3.0.22_CC to v3.0.24_CC.

## 1. Lineage

Edition 1.0.0 stands beside this one, pinned to v3.0.12, with its own digest as `RH_Twin_Binder_One_Locus_v1_0_0_audit_digest.md`. That digest records cycle twinbinder309, eight framework-blind rounds with 86 findings, and two targeted passes against v3.0.10 and v3.0.12, with 13 and 8 findings. Every finding there was repaired, scoped or refused on the record.

## 2. Re-pin from v3.0.12 to v3.0.22_CC

The paper was carried through v3.0.13, v3.0.16, v3.0.17 and v3.0.19 to v3.0.22_CC. That added:

- the block theorem over ℂ, `no_closed_principle_decides`;
- the Pause and the forward pass, unconditional;
- the look back and the retrospective seal (§7.4);
- the canonical apex;
- the Monism witness over ℂ and the canonical normal-form bridge;
- the analytic target reduction;
- the joint physico-formal seal (tier c);
- Round 2, with no premise;
- every route delivering the bit, and `analytic_route_sealed`;
- the terminal certification as a theorem.

The passes against those editions are recorded in §4.

## 3. Re-pin from v3.0.22_CC to v3.0.24_CC

v3.0.23_CC added the Ground-On-Line locus and its loop. v3.0.24_CC added the import `Mathlib.NumberTheory.LSeries.Nonvanishing` and the self-recognition closure. The paper states them as Theorems 7.32 to 7.35, each at its type:

- **Theorem 7.32, the Ground-On-Line locus.** `complex_three_axis_lock`, `gol_look_back_unconditional` and `ra_triaxial_gol_loop_unconditional`, all with no premise. At `GOL := Rec ZetaZeros` every point is fixed by the retraction and by the fold; RA₀ is equivalent to the value and to least erasure there; and coincidence of `GOL` with the zeros is equivalent to `RiemannHypothesis`.
- **Theorem 7.33, the strict strip.** `zeta_zeros_strictly_in_strip`, `completed_zeta_zeros_strictly_in_strip` and `zeta_zeros_iff_completed`, all with no premise.
- **Theorem 7.34, the band and self-recognition.** `right_half_strip_zero_free_iff_band`, `rh_iff_band_zero_free`, `off_line_zero_has_band_twin` and `self_recognition_is_look_back`.
- **Theorem 7.35, the self-recognition closure.** `the_self_recognition_closure`, the whole formal arc in one theorem with nothing before the colon.

`the_terminal_certification` now binds 47 conjuncts, and the complex extensions 43. Part II renames the constructor `RouteStatus.open` to `.unclaimed`, which changes the types of `route_ledger_counts` and `route_status_total`. The paper's claim that Part II is carried verbatim is qualified accordingly, and Appendix A.2 records the rename. The header now opens on the normal form and the self-recognition closure and states the blocked routes first. Its decoupling clause names all three declarations of Part X that use Parts VII and VIII.

## 4. Mechanical receipts at v3.0.24_CC

- **Theorem heads:** 71, citing 148 distinct identifiers (144 theorems and 4 definitions). Every identifier is pinned, and every chip equals the compiler's pin.
- **Census:** 887 theorems, 363 definitions, 52 structures, 7 inductive types, 21 namespaces.
- **Pins:** 718, split 391 empty, 34 at [propext], 133 at [propext, Quot.sound] and 160 at [propext, Classical.choice, Quot.sound]. Of the 977 `#print axioms` commands, 259 are unguarded.
- **Listings:** 42, each taken verbatim from the deposited file at its master line numbers. Every listing line in the PDF matches the file at its number. No listing starts inside a docstring or ends on a blank line.
- **RH census:** no closed term of `RiemannHypothesis` or of its negation. Seven theorems conclude it, all under premises.

## 5. Targeted framework-blind passes

The passes against the earlier editions (Passes 3 to 6) are recorded in this digest's edition for v3.0.22_CC, which is kept in the repository history:
- **Pass 3, against v3.0.13:** 15 findings.
- **Pass 4, against v3.0.16:** 14 findings.
- **Pass 5 and its verification, against v3.0.19:** 15 findings, then 7 more.
- **The Lean file's static read:** 13 points.
- **Pass 6, against v3.0.22_CC:** 9 findings.

All were repaired.

**Pass 7, against v3.0.24_CC: 10 findings, 0 load-bearing, 2 structural, 8 cosmetic.** All were repaired:
- Part II is no longer called "carried verbatim" without qualification; the constructor rename is recorded.
- Five line references were brought to the new file, after the header grew five lines.
- The Appendix D running head named `v3_0_16` and now names `v3_0_24_CC`.
- The remaining points brought wording to the types.

The independent review confirmed that Theorems 7.32 to 7.35 match their Lean types.

**Pass 8, carried from the formal closure.** The paper *The Completed Formal Closure of the Riemann Hypothesis* (1.0.0, 16 October 2026) is the formal side of this one, set apart as a standalone file. Its framework-blind referee and its proofread found points in text the two papers share, and their repairs are carried here in 32 edits, each asserted to match exactly:
- **Fifteen equivalences.** Each sentence that said "is" where the file proves an equivalence now says "equivalent", as do two sentences on the distance from the record. The bridge is "equivalent to the hypothesis, its fixed-point form", and any two readings, and the protocol's four readings, "are equivalent".
- **The look back** in the abstract is stated as proved equivalent to reg(s) = s at every zero. Its definition reads it from the record.
- **The right half-strip** is written Re s > ½ in five places, as `RightHalfStripZeroFree` ranges. The one ½ < Re s ≤ 1 left stands where the text cites strip confinement for it.
- **The refuter** is now "where an off-line nontrivial zero would make the refutation provable", the premise `no_offline_refuter_seals_rh` takes, in place of "where refutation is Σ₁ on the denial".
- **The witness at the zeros** is "proved equivalent to the look back", not "is the 1-bit apex".
- **The hedge.** "In the author's reading lies outside that class" is stated at full force, as the docstring of `analytic_route_sealed` states it. Four other uses of "in the author's reading" stand, because each marks a posited reading: the act's supply of the bridge, the apparatus narrative, and the passage to the zeros, twice.
- **Theorem 5.1's head** names `registered_closed`, which its statement uses. Its pin is the head's cone.
- **Wording:** "Section X-l continues with Round 2", "neighborhood", "the reflection-seat axis, ramAxis, holds on the line by `fold_fixed_iff_onLine`", and "the Root Axiom".
- **Listings:** six that ended on a blank line now end on their last line of code.
- **The abstract** keeps its place on page 1 through two tightenings that drop no claim.

## 6. Notes on the file's terminal block and header

The note that stood against v3.0.22_CC is closed in v3.0.24_CC. That header's decoupling clause named only the two bridges; the new header's DECOUPLING paragraph names the two bridges and `the_terminal_certification` as the three declarations of Part X that use Parts VII and VIII. It adds that only the joint seal takes a physical premise and that no capstone uses the three. The terminal certification reads in two registers: the formal side is proved with no premise, and the bit is supplied by the physical carrier at premise grade.

## 7. Appendix B and PSP-TRIAXIAL-NEC-SUFF-01

Appendix B's account of the triaxial method states the triad's irreducibility at its type. The PhysOS mother codex, v1.0.16p, proves by `decide` that two linear equations in three unknowns over GF(2) never have exactly one solution (`two_axes_never_lock`). So on every locked system each pair of equations leaves the point open (`triad_irreducible`). That the triad suffices to map its domain stands as a premise, as PSP-TRIAXIAL-NEC-SUFF-01 carries it.

## 8. Build

- **Engine:** XeLaTeX, two passes.
- **Output:** 195 pages, no overfull line. The abstract fits page 1, the end-of-manuscript probe passes on page 195, and the margin scan is clean.
- **PDF SHA-256:** `15b8a7483f6c996a32b235c55d1ab339c3524951bdf19ef9ddefdd93260e0b93`.
- **Markdown SHA-256:** `e58126e470e5a2eacb8277837cb58c79fba99d21043d485aedd71f403d3f8bfc`.
- **Source:** the LaTeX source stands beside the paper as `RH_Twin_Binder_One_Locus_v2_0_0_source.zip`, 51 files, SHA-256 `febbf37165ce2daabd6a9ef1e916888e959efd2ea92710c88a9d14fae779b2a9`. Its README gives the build.
