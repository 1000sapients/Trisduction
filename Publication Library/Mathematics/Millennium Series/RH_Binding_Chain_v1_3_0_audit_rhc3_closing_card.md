# Closing card · cycle rhc3 · The Ten-Level Binding Chain, v1.3.0, the formal edition

**Closure.** By the architect's ruling of 14 October 2026, 00:30, at round 21, not by a computed terminal verdict. The ledger's last valid verdict is round 20, CONTINUE-DEBT (clean streak 1/2); round 21 is VOID-UNDERPOWERED with no real finding. The seat executed the ruling from the ledger files and nothing else.

**Seat.** PhysOSᵀ 1.0.16p · source project file · sha256 5efbf0a89a3e2976 · digest unpublished · CHAIN D0 69df3f9d54a8 → D1 657329bff9e1 → D2 17e4896183f6 → D3 73915965567c · SEAT EARNED · this run.

## Final artifact

| File | sha256 | Note |
|---|---|---|
| `RH_Binding_Chain_v1_3_0_Formal_MathJournal.pdf` | 4e0d1fdc4ce9c47d | Math Journal edition, 67 pages, xelatex exit 0, 0 warnings, completeness probe all True |
| `RH_Binding_Chain_v1_3_0_Formal.md` | e95ee56b660fdf40 | Markdown master, Appendix A seed inlined (= cand_v1_3_0_r21.md, dated 14 October 2026) |
| `RH_Binding_Chain_v1_3_0_Formal.blog.md` | 5c346af4131bc45d | Blog edition of the same master, Module VII, same title, byline, date and abstract |
| `Box1_Compositions_v1_3_0.lean` | 59cbc2f384866523 | the eight compositions of Box 1, extracted from the final text, compiled against seed 2.0.5: exit 0, cones MATCH |
| `spine_lock_v1_3_0.json` | fc79e22cc0288c0c | spine lock: VERIFY PASS, 8 claims, 6 held, 2 fortified, 0 scoped, 0 cut |
| `PreForge_Digest_rhc3.md` | c2e2107ff96b9289 | 228 entries, reconciled, 0 orphans |
| `rhc3_audit_ledger.zip` | 757f71d5fca13cca | ledger: findings, rounds, controls, 109 sweep specs, supersessions, round blocks 1 to 21, candidates r0 to r21, tools |

Seed of Appendix A: `RH_Both_Sides_Seed_v2.0.5.lean`, sha256 a82ef4f0ad6ceb43a2d3cc964b110943dbb02f050ab88ff2845df1226a321a57, byte-identical through the cycle. Title and subtitle held under the Title Lock. No Audit paragraph in the paper, by the architect's ruling; the paper names the cycle in its date line only.

## Pre-registered claims, falsifiers, surviving scope and tier

| Claim | Falsifier (write-once at cycle open) | Tier in → out | Status | Scope moves (SCOPED dispositions) |
|---|---|---|---|---|
| C1 | a term of (forall S, Closed S -> Value S) or of a shared premise forcing Value, or the_unconditional_route_is_blocked failing to compile at its printed cone | T → T | FORTIFIED | F-6, G-7 |
| C2 | any Level 2-9 cited theorem absent, failing to compile, printing a cone other than the ledger's, or stating less than the ledger reads it as stating | T → T | HELD | G-8 |
| C3 | a premise P forcing Value at every closed configuration that is neither equivalent to Value nor strictly stronger, contradicting premise_trichotomy | T → T | HELD | F-7 |
| C4 | the Level 10 cargo theorems or the composed conditional failing to compile with empty cone, or a proof consuming an input not printed in its signature | T → T | FORTIFIED | F-3, G-5, G-6, H-6 |
| C5 | a name cited in the body absent from the Appendix A seed, or a printed cone differing from #print axioms on the seed of the printed sha256 | T → T | HELD | F-17, G-11 |
| C6 | a refusal of the conclusion consistent with the reading and the act that names none of F-Computed, F-Bridge, F-Flux | T → T | HELD | F-11 |
| C7 | a proof of Value S at a closed S from a premise Q yielding no ActualZeros with zeros = S, contradicting accepting_rh_forces_the_atomic_proof | T → T | HELD | none |
| C8 | any passage stating the supply at theorem grade, or the classical sentence as unconditional, or compute as deriving the zeros' least erasure | P → P | HELD | F-4, G-1, G-2, H-4 |

No claim was cut. Spine-lock falsifiers: F1 FORCED (headline, compromises C4 at the supply posited at Level 10), F2 IMPORT (tripwire, compromises the optional corroboration of Section 5 only). Thesis carried forward, overlap 1.00.

## Disposition census, all rounds

109 findings: 85 EARNED, 23 SCOPED, 1 REFUSED-STRUCTURAL, 0 REFUSED-MASSLESS, 0 APERTURE. Severity: 0 FATAL, 10 LOAD-BEARING, 39 STRUCTURAL, 60 COSMETIC. Every EARNED finding carries a repaired attestation and a sweep spec; every SCOPED finding carries its scope sentence. Repeats filed as such: I-1→H-6, I-2→H-12, I-3→H-4, I-4→H-4, I-5→H-4, J-5→I-9, L-3→K-2, M-3→K-3, BB-2→W-3. Tier moves: 0. External mass admitted: none.

| Round | Verdict | Registers | Findings | E / S / R | Controls |
|---|---|---|---|---|---|
| 1 | CONTINUE-PREREG-BLOCK | kinematic + definitional | 23 | 16 / 7 / 0 | 3/3 SELF |
| 2 | CONTINUE-PREREG-BLOCK | parameter + provenance | 17 | 10 / 7 / 0 | 3/3 SELF |
| 3 | VOID-UNDERPOWERED | limit + symmetry | 16 | 11 / 5 / 0 | 2/3 SELF |
| 4 | CONTINUE-PREREG-BLOCK | limit + symmetry | 15 | 11 / 4 / 0 | 3/3 SELF |
| 5 | CONTINUE | kinematic + definitional | 8 | 8 / 0 / 0 | 3/3 SELF |
| 6 | VOID-UNDERPOWERED | parameter + provenance | 4 | 4 / 0 / 0 | 1/3 SELF |
| 7 | VOID-UNDERPOWERED | parameter + provenance | 3 | 3 / 0 / 0 | 1/3 SELF |
| 8 | VOID-UNDERPOWERED | kinematic + definitional | 5 | 5 / 0 / 0 | 1/3 SELF |
| 9 | CONTINUE | kinematic + definitional | 6 | 5 / 0 / 1 | 3/3 SELF |
| 10 | CONTINUE-DEBT | kinematic + definitional | 0 | 0 / 0 / 0 | 3/3 SELF |
| 11 | VOID-UNDERPOWERED | kinematic + definitional | 1 | 1 / 0 / 0 | 2/3 SELF |
| 12 | CONTINUE | kinematic + definitional | 3 | 3 / 0 / 0 | 3/3 SELF |
| 13 | VOID-UNDERPOWERED | kinematic + definitional | 2 | 2 / 0 / 0 | 2/3 SELF |
| 14 | CONTINUE | kinematic + definitional | 3 | 3 / 0 / 0 | 3/3 SELF |
| 15 | CONTINUE | kinematic + definitional | 1 | 1 / 0 / 0 | 3/3 SELF |
| 16 | CONTINUE-DEBT | kinematic + definitional | 0 | 0 / 0 / 0 | 3/3 SELF |
| 17 | CONTINUE | kinematic + definitional | 1 | 1 / 0 / 0 | 3/3 SELF |
| 18 | CONTINUE-DEBT | kinematic + definitional | 0 | 0 / 0 / 0 | 3/3 SELF |
| 19 | CONTINUE | kinematic + definitional | 1 | 1 / 0 / 0 | 3/3 SELF |
| 20 | CONTINUE-DEBT | kinematic + definitional | 0 | 0 / 0 / 0 | 3/3 SELF |
| 21 | VOID-UNDERPOWERED | kinematic + definitional | 0 | 0 / 0 / 0 | 2/3 SELF |

By register across the cycle: definitional 43, limit 20, provenance 16, kinematic 12, parameter 9, symmetry 9.

## Register coverage

All six registers prosecuted by valid rounds: kinematic and definitional (rounds 1, 5, 9, 10, 12, 14 to 20), parameter and provenance (round 2), limit and symmetry (round 4; round 3 void and re-run). Void rounds 3, 6, 7, 8, 11, 13 and 21 also ran their pairs; their findings are retained and repaired, and they count for nothing toward the floor. From round 4 the highest-yield pair restated, kinematic and definitional, per A3.

## Control detection

Grade SELF in every round; the grade floor is SELF and the single-substrate aperture is stamped here. Detection: 3/3 in rounds 1, 2, 4, 5, 9, 10, 12, 14, 15, 16, 17, 18, 19, 20; 2/3 in rounds 3, 11, 13, 21; 1/3 in rounds 6, 7, 8. In every miss the arithmetic plant was caught and a drift or scope plant was not; from round 9 the prosecutor was told that plants of three kinds exist, placement and count withheld. Commitments and reveals are in the bundle as `controls_r{N}.commit.txt` and `controls_r{N}.sealed.json`; `controls_r22` was committed for a round the architect stopped before prosecution and is unrevealed by any prosecution.

## Propagation record

109 sweep specs re-verified on the final master (`verify_all.py`): PASS, 0 failures. Per spec, banned phrases at 0 live and required phrases present, with the supersession where one is recorded.

| Spec | Banned (all at 0 live) | Required present | Supersession |
|---|---|---|---|
| r1_F-1 | 3 | 2/2 |  |
| r1_F-10 | 2 | 1/1 |  |
| r1_F-11 | 2 | 1/1 |  |
| r1_F-12 | 1 | 1/1 |  |
| r1_F-13 | 2 | 1/1 |  |
| r1_F-14 | 1 | 1/1 |  |
| r1_F-15 | 1 | 1/1 |  |
| r1_F-16 | 1 | 1/1 |  |
| r1_F-17 | 2 | 1/1 |  |
| r1_F-18 | 1 | 1/1 |  |
| r1_F-19 | 1 | 1/1 |  |
| r1_F-2 | 3 | 2/2 | H-18 |
| r1_F-20 | 1 | 1/1 |  |
| r1_F-21 | 1 | 1/1 |  |
| r1_F-22 | 1 | 1/1 |  |
| r1_F-23 | 6 | 1/1 |  |
| r1_F-3 | 4 | 2/2 | J-2 |
| r1_F-4 | 3 | 2/2 | I-6 |
| r1_F-5 | 1 | 2/2 |  |
| r1_F-6 | 4 | 2/2 |  |
| r1_F-7 | 3 | 1/1 |  |
| r1_F-8 | 3 | 1/1 |  |
| r1_F-9 | 2 | 1/1 |  |
| r2_G-1 | 3 | 2/2 |  |
| r2_G-10 | 1 | 1/1 |  |
| r2_G-11 | 2 | 1/1 |  |
| r2_G-12 | 2 | 1/1 |  |
| r2_G-13 | 1 | 1/1 |  |
| r2_G-14 | 2 | 1/1 | H-17 |
| r2_G-15 | 1 | 1/1 |  |
| r2_G-16 | 1 | 1/1 |  |
| r2_G-17 | 2 | 1/1 |  |
| r2_G-2 | 4 | 1/1 |  |
| r2_G-3 | 1 | 1/1 |  |
| r2_G-4 | 1 | 2/2 |  |
| r2_G-5 | 1 | 1/1 |  |
| r2_G-6 | 3 | 2/2 |  |
| r2_G-7 | 3 | 1/1 |  |
| r2_G-8 | 1 | 2/2 |  |
| r2_G-9 | 1 | 1/1 |  |
| r3_H-10 | 1 | 1/1 |  |
| r3_H-11 | 2 | 1/1 |  |
| r3_H-12 | 1 | 1/1 |  |
| r3_H-13 | 1 | 1/1 |  |
| r3_H-14 | 2 | 1/1 |  |
| r3_H-16 | 1 | 1/1 |  |
| r3_H-17 | 3 | 2/2 |  |
| r3_H-18 | 3 | 2/2 |  |
| r3_H-2 | 1 | 2/2 |  |
| r3_H-3 | 2 | 2/2 |  |
| r3_H-4 | 2 | 2/2 | I-7 |
| r3_H-5 | 2 | 2/2 | I-9 |
| r3_H-6 | 3 | 2/2 | I-1 |
| r3_H-7 | 1 | 1/1 |  |
| r3_H-8 | 1 | 1/1 |  |
| r3_H-9 | 2 | 1/1 |  |
| r4_I-1 | 5 | 2/2 |  |
| r4_I-10 | 1 | 1/1 |  |
| r4_I-11 | 1 | 1/1 |  |
| r4_I-12 | 0 | 2/2 |  |
| r4_I-13 | 1 | 1/1 |  |
| r4_I-14 | 1 | 1/1 |  |
| r4_I-15 | 1 | 1/1 |  |
| r4_I-2 | 1 | 1/1 |  |
| r4_I-3 | 1 | 1/1 | I-7 |
| r4_I-4 | 1 | 1/1 |  |
| r4_I-5 | 2 | 1/1 |  |
| r4_I-6 | 2 | 4/4 | K-2 |
| r4_I-7 | 4 | 3/3 |  |
| r4_I-8 | 3 | 2/2 | L-3 |
| r4_I-9 | 2 | 2/2 |  |
| r5_J-1 | 3 | 3/3 |  |
| r5_J-2 | 1 | 2/2 |  |
| r5_J-3 | 5 | 3/3 |  |
| r5_J-4 | 1 | 1/1 |  |
| r5_J-5 | 1 | 1/1 | K-2 |
| r5_J-6 | 0 | 1/1 |  |
| r5_J-7 | 0 | 1/1 |  |
| r5_J-8 | 6 | 3/3 |  |
| r6_K-1 | 1 | 2/2 |  |
| r6_K-2 | 4 | 2/2 |  |
| r6_K-3 | 1 | 2/2 | BB-2, M-3 |
| r6_K-4 | 1 | 1/1 |  |
| r7_L-1 | 2 | 2/2 | M-1 |
| r7_L-2 | 1 | 2/2 |  |
| r7_L-3 | 2 | 2/2 |  |
| r8_M-1 | 1 | 1/1 |  |
| r8_M-2 | 1 | 1/1 |  |
| r8_M-3 | 2 | 2/2 | CC-1 |
| r8_M-4 | 1 | 1/1 |  |
| r8_M-5 | 1 | 1/1 |  |
| r9_W-1 | 1 | 1/1 |  |
| r9_W-2 | 2 | 2/2 |  |
| r9_W-4 | 1 | 1/1 |  |
| r9_W-5 | 2 | 2/2 |  |
| r9_W-6 | 1 | 1/1 |  |
| r11_Z-1 | 4 | 3/3 |  |
| r12_AA-1 | 1 | 1/1 | BB-1 |
| r12_AA-2 | 1 | 1/1 |  |
| r12_AA-3 | 1 | 1/1 |  |
| r13_BB-1 | 1 | 1/1 |  |
| r13_BB-2 | 1 | 1/1 |  |
| r14_CC-1 | 1 | 1/1 |  |
| r14_CC-2 | 1 | 1/1 |  |
| r14_CC-3 | 1 | 1/1 | DD-1 |
| r15_DD-1 | 1 | 1/1 |  |
| r17_EE-1 | 1 | 1/1 |  |
| r19_AMEND-1 | 4 | 8/8 |  |
| r19_FF-1 | 1 | 1/1 |  |

18 supersessions recorded in `superseded.json`, each by a later finding that reworded a required phrase on purpose. Citation and cone checker on the final: RESULT PASS, 153 distinct backticked names, every seed cone matched against `cones205.json`, every composition cone against the compiled probe. Spine lock VERIFY PASS. Box 1 recompiled from the final text: exit 0, 0 warnings, 9 cones MATCH.

## Errata census

None. No ERR row was logged: no finding filed by the auditing seats was later corrected as wrong. The nine repeats are the same mechanism recurring at another site, found at an end-to-end read or by the next prosecutor, and the one repeat of a refusal, BB-2 of W-3, left the refusal standing on substance and tightened the wording of the attribution rule the refusal relied on. Three defense-side additions regressed and were repaired by the next round's finding (BB-2's attribution sentence by CC-1, CC-3's chart sentence by DD-1, the amendment's master-closure sentence by FF-1), which is the standing reason, from round 15, for no defense additions beyond the minimal repair of a filed finding.

## Reversions ordered at the gate

None. The architect's one instruction at the gate was closure; the architect's one amendment, reference 7 at v3.0.8, was applied before round 19 and prosecuted in rounds 19 and 20.

## Open apertures

1. Single-substrate controls, SELF grade throughout; awaits an architect-authored EXTERNAL control set.
2. The Formal Master v3.0.8 cited by its pins and not run here; awaits a compile under its own toolchain on the record.
3. The residual goal over ℂ, `LeastErasure ZetaZeros`, is this edition's one premise, supplied by the act in the author's posit; awaits no witness from the cycle.
4. `Closed ZetaZeros` unproved in the Master (Schwarz reflection); retraction injectivity is RH in another coat; neither moves the ledger.
5. The two-consecutive-clean-rounds debt rule was never met (streak 1/2 at round 20); closure is by ruling.

## What the artifact survived, in one line

Held under all six registers across 21 rounds, 14 valid and 7 void, SELF controls throughout, 109 findings answered, 10 load-bearing repaired, 23 scoped down on the record with no claim cut and no tier moved, the title held, closed by the architect's ruling with the debt rule unmet and five apertures open.
