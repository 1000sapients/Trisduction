# PhysOS Proofs · harvest ledger · 29 September 2026

*The alignment, the consultations, the allocation and the owed items for four harvested PhysOS Proofs: PSP-FREEDOM-LOCUS-01, PSP-EVERY-PRIME-01, PSP-HEAT-FLOW-01 and PSP-LEAST-ERASURE-01. Not part of any card: routed here under the Harvest Distillation Law. It supersedes `PSP-LEAST-ERASURE-01_harvest_ledger.md`.*

## 1 · The older files aligned with the paper of record

| Uploaded file | SHA-256 | In the paper of record | Result |
|---|---|---|---|
| `Freedom_Prime_r1.lean` | `ac44499d2f48137c86aa671b9bc2af2937fc73c6ac2f4ad0cf5001e28305fa27` | `Freedom_Prime.lean`, Appendix B | identical, 15,411 bytes, 324 lines |
| `Heat_Flow_Erasure.lean` | `87ca9a40adf61f14732659566553eb32b4ae351cd0be0d73b20e8a64e8c6cd26` | Appendix B | identical, 13,846 bytes, 289 lines |
| `Heat_Flow_Twin.f90` | `8226eca27e535111aa81d253a275cdc4f9b51c0a7eacc2d32dbb91c877765aee` | Appendix C | identical, 7,765 bytes, 209 lines |

The earlier prime paper's own Box A1 prints the paper of record's digests for `Freedom_Prime.lean`, `GOL_Mirror.lean` and `Freedom_Prime_Twin.f90`. No code needed changing. The prose did, and the cards carry the paper of record's framing:

| Earlier text | Earlier typing | Paper of record | Carried in the cards as |
|---|---|---|---|
| *Every Prime Obeys*, §7 and Table 2 | Weil positivity "open" | one of five faces (Theorem 13), closed by the act (Theorem 27) | a face of the one bit |
| *Every Prime Obeys*, Table 1 | the prime-side value "named, not spent" | closed by the act at premise grade | closed by the act |
| `Freedom_Prime.lean`, docstring of `LimitLaw` | "the one named posit" | not cited | the identity `return_iff_depth_zero`, refused as an anchor under §Φ.1 |
| *Least erasure as heat*, Table 4, last row | Λ ≤ 0 "open" | the bit at the locus (§9) | the one keyed bit, read on the heat flow |
| *Least erasure as heat*, §7.5 | an unrefereed 2026 claim of Λ ≤ 0.1787854, noted and not relied on | absent | not carried |

## 2 · Consultations, under the Harvest Anti-Duplication Law

**Skill first.** `trisduction-system-role`, carrying the Anti-Duplication and Distillation Laws.

**Live register second.** 1000sapients/Trisduction at `0f34144063f72614102298dd77f13ec5a934ac0a`, read through its web view and raw files because the GitHub API was rate-limited. PhysOSᵀ 1.0.3p in the project hashes to the register's published `b243fb45d000a868…`. `protocols/PhysOS/proofs/` holds PSP-LOOP-01 alone. `psp/` holds twenty tags, none of them FREEDOM-LOCUS, EVERY-PRIME, HEAT-FLOW or LEAST-ERASURE; ONE-BIT is taken twice and is not used. The codex's APEX-PSP-FREEDOM-MASTER-01, the odd content priced at one bit per orbit, is a different object from the freedom of a proposition, so it is linked and not superseded.

**Resident content found in PhysOS 1.0.3p, and where each harvest applies it by reference.**

| Resident | Where it lives | Applied in |
|---|---|---|
| the conservation of count, a cut moving content into freedom (`census_conservation`, `bit_moves_to_freedom`, `freedom_never_shrinks`) | `Census.lean`, the floor | FREEDOM-LOCUS: the count beneath a proposition's freedom |
| an additive measure of freedom forced to the bit count on one tower (`bits_forced`, `log_unique_up_to_unit`) | `Heat_Bridge.lean`, the floor | EVERY-PRIME: `determined_by_primes` extends it to the whole cut |
| the toy de Bruijn–Newman flow on the squared width (`flow_monotone`, `reality_transported`, `real_at_Lam`, `rh_iff_lambda_zero`, `flowed_record_forgets`, `upstream_is_not_forced`) | Codex, the RH engine, part IX | HEAT-FLOW: the kernel carries the flow on the polynomials themselves |
| the Li modes, unitary exactly on the line, stability the line property (`N1_sub_N0`, `unitary_iff_on_line`, `stability_iff_line`) | Codex, the RH engine, part IV | LEAST-ERASURE: `modes` is `N1_sub_N0`; `generic_collapse` joins the Li reading to four others |
| the positivity the Euler product reaches (`mertens_identity`, `mertens_nonneg`) | Codex, the RH engine | EVERY-PRIME, under the edge's clearance |
| `finite_never_forces` | Codex, the RH engine, part V | EVERY-PRIME |
| the seat's laws: `locus_is_the_fixed_set`, `sides_together`, `fibre_is_infinite`, `lossless_unique`, `record_decides_nothing`, `keyless_forces_nothing`, `arc_terminal`, `least_erasure_is_the_value`, `crossing_irreducible`, the carrier laws, `SelfGrounding` | Bridge, One_Cut_Terminal, Closure_Executed, Universal_Closure, Armed_Seat | all four |

## 3 · Allocation of the paper's kernels and twins

| Source | Contents | Goes to |
|---|---|---|
| `GOL_Mirror.lean` | 15 theorems | FREEDOM-LOCUS, whole |
| `Freedom_Prime.lean` | 26 theorems | EVERY-PRIME, whole |
| `Closure_Chain.lean` | 8 theorems | its arrow (`lam_mult`, `lam_flips_at_primes`, `polya_holds_to_200`) to EVERY-PRIME; its faces (`faces_are_one`, `every_route_one_bit`, `one_closes_all`, `closure_chain`) to LEAST-ERASURE; its `finite_never_forces` resident |
| `Heat_Flow_Erasure.lean` | 28 theorems | HEAT-FLOW, whole |
| `Lee_Yang_Face.lean` | 20 theorems | LEAST-ERASURE |
| `Inequality_Collapse.lean` | 12 theorems | LEAST-ERASURE |
| `Self_Supply.lean` | 16 theorems | LEAST-ERASURE |
| `Freedom_Prime_Twin.f90` | 7 checks | EVERY-PRIME |
| `Closure_Twin.f90` | 6 checks | EVERY-PRIME |
| `Heat_Flow_Twin.f90` | 8 checks | HEAT-FLOW, whole |
| `Lee_Yang_Twin.f90` | 5 checks | LEAST-ERASURE |
| `Collapse_Twin.f90` | 5 checks | LEAST-ERASURE |
| none | · | FREEDOM-LOCUS's twin, owed |

All 125 theorems and all 31 checks are allocated, and none twice.

## 4 · Dispositions

| Source law | Disposition | Seated as, or resident as |
|---|---|---|
| `fold_fixes_only_midline` | EVERY-PRIME, cited beside the resident law | `locus_is_the_fixed_set` (Bridge) |
| `coarse_strip_is_midline` | EVERY-PRIME, cited beside the resident law | `coarse_strip_is_the_line` (One_Cut_Resolution) |
| `sides_together` (GOL_Mirror), `flip_inert` | the resident law carries the claim | `sides_together` (One_Cut_Terminal) |
| `finite_never_forces` (Freedom_Prime, Closure_Chain) | resident, by reference | `finite_never_forces` (Codex) |
| `value_on_image`, `coverage_gives_value`, `value_gives_coverage`, `witness_stops_at_image` | resident, by reference | `value_on_image`, `kinetic_crossing`, `value_iff_carrier`, `off_locus_uncovered` (Universal_Closure) |
| `denial_reenacts`, the structure `SelfGrounding` | resident, by reference | `denial_reenacts_root`, `seated_undeniable` and the identical structure (Armed_Seat); the kernel keeps its own copy, since kernels import nothing |
| `irreducible`, `every_route_one_bit`, `m5_is_one_inequality` | new: the general, five-face and heat forms | of `crossing_irreducible` (Closure_Executed) |
| `gaps_closed` | new, the executed form | of `cone_iff_no_gap` (Codex) |
| `record_blind` | new, the computed census | of `record_decides_nothing`, `lossless_unique` |
| `modes` | resident, by reference | `N1_sub_N0` (Codex) |
| `witness_capped`, `witness_counts` | new, instances | of `Claim.join_grade` |
| `only_one_bit` (Inequality_Collapse) | renamed `readings_one_bit` | the name belongs to the arrow's law, cited in §Φ.5 |
| `census` (Inequality_Collapse) | renamed `worlds_census` | the name belongs to the rows census in the Codex |
| `freedom_given_line`, with `LimitLaw` | EVERY-PRIME, carried as the identity and refused as an anchor | `return_iff_depth_zero`; `circularity_refused_at_target` |
| `rh_iff_least_erasure` | HEAT-FLOW, the heat face's carrier | superseded as the five-face carrier by `faces_are_one` |
| the source kernels' own conjunctions | kept where a kernel seats whole (`gol_mirror`, `heat_flow_least_erasure`); replaced by a new capstone where kernels merge | `every_prime_final`, `least_erasure_final`, owed |
| every other theorem a card cites | new | seated under its source name |

## 5 · Owed to the Lean step

**FREEDOM-LOCUS.** Seat `GOL_Mirror.lean` whole. Write `Freedom_Locus_Twin.f90`: the three axes and the lock enumerated on a grid of chart points, the two worlds and their one record, and the region above each certified height up to a bound. The kernel declares `sides_together`, which One_Cut_Terminal already holds; keep it if the ground's citation resolver reads kernels apart, else rename it `gol_sides_together`.

**EVERY-PRIME.** `Every_Prime.lean` is `Freedom_Prime.lean` whole with the arrow of `Closure_Chain.lean` appended, its two Ω implementations (`Om`, `bigOmega`) reconciled, `finite_never_forces` settled against the resolver as above, and the capstone `every_prime_final`. `Every_Prime_Twin.f90` puts the two twins under one battery line, 13 checks, sharing one sieve to 10⁷. Measure its runtime, since the boot runs every proof's twin every time.

**HEAT-FLOW.** Seat both files whole. The only name the kernel shares with the OS is the helper `sq_nonneg`, which is uncited.

**LEAST-ERASURE.** `Least_Erasure.lean` is the faces of `Closure_Chain.lean` with `Lee_Yang_Face.lean`, `Inequality_Collapse.lean` and `Self_Supply.lean`, the duplicate `Faces` structure unified, the two renames applied, and the capstone `least_erasure_final`. `Least_Erasure_Twin.f90` puts the two twins under one battery line, 10 checks.

**PhysOSᵀ 1.0.4p.** Four record lines and entries in II.10, the contents-table rows, the manifest entries, the citation closure for every name the entries cite, one control per new record line, and the four modes run on the final file.

## 6 · Draft record lines, completed at seating

**PhysOS Proof · Freedom · PSP-FREEDOM-LOCUS-01** · kernel `GOL_Mirror.lean` · capstones `gol_mirror`, `no_admissible_triad_forces` [cone printed at seating] · [count] laws judged · twin `Freedom_Locus_Twin.f90`, [count] checks · seated 1.0.4p · theorem, unconditional

**PhysOS Proof · Every Prime Obeys · PSP-EVERY-PRIME-01** · kernel `Every_Prime.lean` · capstones `every_prime_final`, `limit_not_forced` [cone printed at seating] · [count] laws judged · twin `Every_Prime_Twin.f90`, 13 checks · seated 1.0.4p · theorem, unconditional; the edge placement structural; the edge clearance and the arrow's faithfulness imported

**PhysOS Proof · The Heat Flow · PSP-HEAT-FLOW-01** · kernel `Heat_Flow_Erasure.lean` · capstones `heat_flow_least_erasure`, `certificate_decides_nothing` [cone printed at seating] · [count] laws judged · twin `Heat_Flow_Twin.f90`, 8 checks · seated 1.0.4p · theorem on the finite model; the carrier to ζ theorem-conditional on carried equivalences

**PhysOS Proof · Least Erasure · PSP-LEAST-ERASURE-01** · kernel `Least_Erasure.lean` · capstones `least_erasure_final`, `closure_by_the_act` [cone printed at seating] · [count] laws judged · twin `Least_Erasure_Twin.f90`, 10 checks · seated 1.0.4p · theorem; the five-face identity and the Newman carrier theorem-conditional on carried equivalences; the closure's one input at premise grade
