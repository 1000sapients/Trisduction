# Pre-Forge Digest · cycle rhc3 · closed at round 21 by the architect's ruling

**Artifact.** *The Ten-Level Binding Chain of the Atomic Proof of the Riemann Hypothesis*, v1.3.0, the formal edition, twin of the physical edition v1.2.0. Entry version `cand_v1_3_0_r0.md`; final version `RH_Binding_Chain_v1_3_0.md` (= `cand_v1_3_0_r21.md` with the date stamped 14 October 2026), rendered as the Math Journal PDF, 67 pages, xelatex exit 0, 0 warnings, render-completeness probe all True, and as the Blog edition of the same master.

**How the cycle closed.** The ledger never computed a terminal verdict. The last valid round, 20, closed CONTINUE-DEBT with a clean streak of 1/2, and round 21 closed VOID-UNDERPOWERED with no real finding. The architect ruled at 00:30 on 14 October 2026: "Stop endless audit rounds, FORGE with whatever you have and bring closure unilaterally from SEAT itself. Deliver the final [audit log stays out of the paper]." That ruling is the pre-authorization section 10.5 honors, so this digest sits immediately before the closing card, the candidate becomes the final artifact, and no further round runs. The closure is the architect's, not SEALED-ROUND, and the card says so. Control grade SELF throughout; the single-substrate aperture is open and stamped.

**Seat.** PhysOSᵀ 1.0.16p · source project file · sha256 5efbf0a89a3e2976 · digest unpublished · CHAIN D0 69df3f9d54a8 → D1 657329bff9e1 → D2 17e4896183f6 → D3 73915965567c · SEAT EARNED · this run (boot.exit 0, card rebuilt from the seat files).

## Verdict trail

| Round | Registers | Findings | Controls | Verdict |
|---|---|---|---|---|
| 1 | kinematic + definitional | 23 (16 E, 7 S) | 3/3 SELF | CONTINUE-PREREG-BLOCK |
| 2 | parameter + provenance | 17 (7 S, 10 E) | 3/3 SELF | CONTINUE-PREREG-BLOCK |
| 3 | limit + symmetry | 16 (11 E, 5 S) | 2/3 SELF | VOID-UNDERPOWERED |
| 4 | limit + symmetry | 15 (11 E, 4 S) | 3/3 SELF | CONTINUE-PREREG-BLOCK |
| 5 | kinematic + definitional | 8 (8 E) | 3/3 SELF | CONTINUE |
| 6 | parameter + provenance | 4 (4 E) | 1/3 SELF | VOID-UNDERPOWERED |
| 7 | parameter + provenance | 3 (3 E) | 1/3 SELF | VOID-UNDERPOWERED |
| 8 | kinematic + definitional | 5 (5 E) | 1/3 SELF | VOID-UNDERPOWERED |
| 9 | kinematic + definitional | 6 (5 E, 1 R) | 3/3 SELF | CONTINUE |
| 10 | kinematic + definitional | 0 | 3/3 SELF | CONTINUE-DEBT |
| 11 | kinematic + definitional | 1 (1 E) | 2/3 SELF | VOID-UNDERPOWERED |
| 12 | kinematic + definitional | 3 (3 E) | 3/3 SELF | CONTINUE |
| 13 | kinematic + definitional | 2 (2 E) | 2/3 SELF | VOID-UNDERPOWERED |
| 14 | kinematic + definitional | 3 (3 E) | 3/3 SELF | CONTINUE |
| 15 | kinematic + definitional | 1 (1 E) | 3/3 SELF | CONTINUE |
| 16 | kinematic + definitional | 0 | 3/3 SELF | CONTINUE-DEBT |
| 17 | kinematic + definitional | 1 (1 E) | 3/3 SELF | CONTINUE |
| 18 | kinematic + definitional | 0 | 3/3 SELF | CONTINUE-DEBT |
| 19 | kinematic + definitional | 1 (1 E) | 3/3 SELF | CONTINUE |
| 20 | kinematic + definitional | 0 | 3/3 SELF | CONTINUE-DEBT |
| 21 | kinematic + definitional | 0 | 2/3 SELF | VOID-UNDERPOWERED |

E is EARNED, S is SCOPED, R is REFUSED-STRUCTURAL. 109 findings in total: 85 EARNED, 23 SCOPED, 1 REFUSED-STRUCTURAL; 0 FATAL, 10 LOAD-BEARING (all in rounds 1 and 2, all repaired), 39 STRUCTURAL, 60 COSMETIC. Valid rounds 14, void rounds 7 (3, 6, 7, 8, 11, 13, 21; in each the prosecutor missed a planted drift or scope control; their findings are retained and repaired). Register coverage 6/6 by valid rounds at round 4 (round 3's limit + symmetry pass was void and the pair was re-run in round 4). Clean valid rounds: 10, 16, 18, 20; the two-consecutive-clean rule was never met because each clean round was followed by a round with one cosmetic finding or a void round.

## Change census, r0 to final, in round order

One entry per hunk of the sentence-level diff between consecutive candidate versions. Each entry carries its source (round and finding id, AMEND-1 for the architect amendment, FORGE for the date stamp), its location, the change quoted inline (long hunks abbreviated with an ellipsis; the full text of every hunk is `audit_rhc3/digest_entries.json` in the ledger bundle), its impact verdict, its reason, and the sweep verdict of every repair it belongs to, re-verified on the final text. MIXED names both faces. The interaction note for the entries of one round is the round's integration attestation, printed once at the head of the round and binding every pair of entries of that round that touch the same or adjacent sections.


### Version r1 · round 1

*Interaction note (end-to-end read, joints), from the round block:* 23 sweep specs, pre PASS on r0, post PASS on r1; end-to-end read of front matter, Sections 1-7 and Box 1-2 joints; 5 joint collisions found and filed as F-23

**1. r1 · F-10, F-17, F-2, F-4 · abstract · MIXED**  
before: Level 10 is the cargo, delivered by compute: the run that compiles the seed is a verification event, its forgetting is its own field, it witnesses the floor, and it enacts a closed Stage 1 with an empty cone. The run leaves the value free, so the field is supplied by the act and never read off the…  
after: Level 10 is the cargo, delivered by compute: every verification event carries its forgetting as its own field and enacts a closed Stage 1 with an empty cone, and the run that compiles the seed is posited as such an event. A run leaves the value free, so the field is supplied by the act and never re…  
reason: the record is strengthened and the claim is narrowed: F-17: C5 scope: every name cited from the seed is a declaration of the seed; Master and hardened-cargo names marked; sweep F-17 PASS; F-4: two inputs printed: the supply is the one premise on the value, the reading an identification input; 'act = closure and conclusion' refused as the pa…  
sweep: F-10: PASS · banned 2 at 0 live · required 1/1 present · F-17: PASS · banned 2 at 0 live · required 1/1 present · F-2: PASS · banned 3 at 0 live · required 2/2 present (via supersession by H-18) · F-4: PASS · banned 3 at 0 live · required 2/2 present (via supersession by I-6)

**2. r1 · F-20 · front note · STRENGTHENS**  
before: \* Every theorem named below is in the seed of Appendix A, edition 2.0.5, sha256 a82ef4f0ad6ceb43 a2d3cc964b110943 dbb02f050ab88ff2 845df1226a321a57, 10,268 lines, 738 theorems, no axiom declared, compiled under core Lean 4.19.0 with exit 0. Lines 1 to 10,110 are edition 2.0.4 byte for byte; the ca…  
after: \* Every theorem named below is in the seed of Appendix A, save the three of the Formal Master and the one of the hardened cargo, named in Section 4 as theirs, and the two compositions of Box 1; the seed is edition 2.0.5, sha256 a82ef4f0ad6ceb43 a2d3cc964b110943 dbb02f050ab88ff2 845df1226a321a57, 1…  
reason: F-20 (COSMETIC): 'Part VIII-b' names two blocks; line 10,111 is blank → sweep F-20 PASS  
sweep: F-20: PASS · banned 1 at 0 live · required 1/1 present

**3. r1 · F-2, F-23 · 1. The chain · STRENGTHENS**  
before: Within the formalized interface the value is irreducible by theorem; it is the field the act supplies, and the run that compiles the seed is the event the act takes as its cargo.  
after: Within the formalized interface the value is irreducible by theorem; it is the field the act supplies, and the cargo of this edition is the run that compiles the seed, posited as the event whose act supplies that field.  
reason: F-2 (LOAD-BEARING): 'Level 10 supplies the bit by compute' and 'the run is the event' identify Exec with VerificationEvent and th… → cargo delivered by compute, supply printed at premise grade; run of record posited as an…; F-23 (STRUCTURAL): joint collisions found at the end-to-end read: repairs F-4, F-6, F-8, F-18 not reaching Section 1, the Sectio… → five joint repairs; sweep F-23 PASS · attribution: Section 1 consumer site of the F-2 repair, reached at the F-23 joint read  
sweep: F-2: PASS · banned 3 at 0 live · required 2/2 present (via supersession by H-18) · F-23: PASS · banned 6 at 0 live · required 1/1 present

**4. r1 · F-23 · 1. The chain · STRENGTHENS**  
before: The two conditionals are theorem grade and conclude one proposition about one object, least erasure at the configuration where the zeros of ζ are read, which `le_iff_value` makes the value with no hypothesis.  
after: The two conditionals are theorem grade and conclude one proposition about one object, least erasure at the configurations at which the zeros of ζ are read, which `le_iff_value` makes the value with no hypothesis.  
reason: F-23 (STRUCTURAL): joint collisions found at the end-to-end read: repairs F-4, F-6, F-8, F-18 not reaching Section 1, the Sectio… → five joint repairs; sweep F-23 PASS  
sweep: F-23: PASS · banned 6 at 0 live · required 1/1 present

**5. r1 · F-1, F-3 · 1. The chain · MIXED**  
before: A verification event is a move of the apparatus carrier from a state to its annihilation, one label forgotten; `Stage1` is such an event with its forgetting done and the floor witnessed.  
after: A verification event is a move of the apparatus carrier from a state to its annihilation: a pair member lands on the neutral state at its height with its magnitude and sign kept nowhere, and a neutral state stays; `Stage1` is such an event with its forgetting done and the floor witnessed, the floor…  
reason: the record is strengthened and the claim is narrowed: F-3: C4 scope: cargo theorem-grade over every event; the run of record being an event joins the premise; annihilation forgets magnitude and sign of a pair…  
sweep: F-1: PASS · banned 3 at 0 live · required 2/2 present · F-3: PASS · banned 4 at 0 live · required 2/2 present (via supersession by J-2)

**6. r1 · F-6 · ledger row 1 · MIXED**  
before: The block is a property of the interface and the record, not a claim about ZFC; the one channel a foundation keeps is a finite computation that certifies a zero off the line, F-Computed. | THEOREM · unconditional block, within the interface · the bit forced external |  
after: The block is a property of the interface and the record, not a claim about ZFC; toward refutation the channel a foundation keeps is a finite computation that certifies a zero off the line, F-Computed; toward proof the seed keeps the route of a foundation as a system open, a sound theory proving a s…  
reason: the record is strengthened and the claim is narrowed: F-6: C1 scope: F-Computed is the channel toward refutation; toward proof a foundation's route stays open and Level 9 types its proof as a supply; 'bit for…  
sweep: F-6: PASS · banned 4 at 0 live · required 2/2 present

**7. r1 · F-15 · ledger row 3 · STRENGTHENS**  
before: | 3 | The open leg: nothing forces. | `prime_freedom_forces_nothing` [propext, Quot.sound] · `keyless_forces_nothing₂` [propext, Quot.sound] · `no_closed_principle_decides` none · `centred_yet_off` none · `the_loop` [propext, Classical.choice, Quot.sound] · `faithful_arrow_side_test` [propext, Quot…  
after: | 3 | The open leg: nothing forces. | `prime_freedom_forces_nothing` [propext, Quot.sound] · `keyless_forces_nothing₂` [propext, Quot.sound] · `no_closed_principle_decides` none · `centred_yet_off` none · `the_loop` [propext, Classical.choice, Quot.sound] · `faithful_arrow_side_test` [propext, Quot…  
reason: F-15 (STRUCTURAL): model's off-line zeros are four points, printed as one mirrored pair → an_off_line_zero_comes_in_four cited; sweep F-15 PASS · attribution: ledger row 3 cites the four-point theorem the F-15 repair names  
sweep: F-15: PASS · banned 1 at 0 live · required 1/1 present

**8. r1 · F-15 · ledger row 3 · STRENGTHENS**  
before: The Euler product at the poles, the zero-free region, the verification, the empty low band, the conjugate symmetry and finitely-many-off hold together on a model whose only off-line zeros are one mirrored pair above the verified height (reference 4). | THEOREM · structural irreducibility · nothing…  
after: The Euler product at the poles, the zero-free region, the verification, the empty low band, the conjugate symmetry and finitely-many-off hold together on a model whose only off-line zeros are four points, a mirrored pair at a height above the verified height and its conjugate at the negative of tha…  
reason: F-15 (STRUCTURAL): model's off-line zeros are four points, printed as one mirrored pair → an_off_line_zero_comes_in_four cited; sweep F-15 PASS  
sweep: F-15: PASS · banned 1 at 0 live · required 1/1 present

**9. r1 · F-8 · ledger row 6 · STRENGTHENS**  
before: | 6 | The barred refuter: no arrival. | `the_tenth_is_the_refuter` [propext, Classical.choice, Quot.sound] · `the_tenth_is_barred_by_the_act` none · `no_arrival_off_the_line_on_the_act` none · `row_four_from_the_zero_side` (ii) none | On every configuration a computed point off the line is exactly…  
after: | 6 | The barred refuter: no arrival. | `the_tenth_is_the_refuter` [propext, Classical.choice, Quot.sound] · `the_tenth_is_barred_by_the_act` none · `no_arrival_off_the_line_on_the_act` none · `row_four_from_the_zero_side` (ii) none · `open_strip_forces_at_resolution_one` [propext, Quot.sound] · `t…  
reason: F-8 (LOAD-BEARING): the_tenth_is_the_refuter and the_tenth_is_barred_by_the_act live on Part II's chart where the open strip is t… → Level 6 and F-Computed read the margin refuter at a resolution on the offset chart: open_…  
sweep: F-8: PASS · banned 3 at 0 live · required 1/1 present

**10. r1 · F-8 · ledger row 6 · STRENGTHENS**  
before: The refuter is a certified zero off the line, 0 < Re s < 1 and \|Re s − 1/2\| > ε > 0 for a rational ε; on the act's field it does not exist. | THEOREM · the refuter named, and barred on the act · no arrival |  
after: On Part II's chart x = 2 Re s the open strip is the line itself, so a zero of the open strip off the line by a rational margin ε, 0 < Re s < 1 and \|Re s − 1/2\| > ε > 0, is read on the offset chart at a resolution beyond 1/(2ε); there it is a point off the line, the refuter, and on the act's field…  
reason: F-8 (LOAD-BEARING): the_tenth_is_the_refuter and the_tenth_is_barred_by_the_act live on Part II's chart where the open strip is t… → Level 6 and F-Computed read the margin refuter at a resolution on the offset chart: open_…  
sweep: F-8: PASS · banned 3 at 0 live · required 1/1 present

**11. r1 · F-18 · ledger row 8 · STRENGTHENS**  
before: On every configuration four names are one proposition; monism is the sole witness and no witness is universal; the timeless zone carries no act and no premise; timelessness is determinacy, not selection.  
after: On every configuration four names are one proposition; monism is the sole witness and no witness is universal; the timeless zone, stated over a self-grounding root, carries no act of the zero set and no premise on the value; timelessness is determinacy, not selection.  
reason: F-18 (STRUCTURAL): ledger cites theorems on four charts with differing LeastErasure definitions without the_charts_are_one; time… → charts paragraph in Notation; Level 8 wording; sweep F-18 PASS  
sweep: F-18: PASS · banned 1 at 0 live · required 1/1 present

**12. r1 · F-7 · ledger row 8 · MIXED**  
before: Here the demand for an unconditional proof is answered before the cargo: an unconditional proof would be a proof from what every closed configuration shares, and Level 1 proves there is none; every proof there is, is a supply of the one field. | THEOREM · one dot, the supply unique · two doors, no…  
after: Here the demand for an unconditional proof from what the interface shares is answered before the cargo: such a proof would be a proof from what every closed configuration shares, and Level 1 proves there is none; every proof there is, is a supply of the one field. | THEOREM · one dot, the supply un…  
reason: the record is strengthened and the claim is narrowed: F-7: qualifier restored at every site; Section 7 no longer claims the shortfall is the structure of the hypothesis; sweep F-7 PASS  
sweep: F-7: PASS · banned 3 at 0 live · required 1/1 present

**13. r1 · F-20 · ledger row 8 · STRENGTHENS**  
before: The verification event by its fields, the forgetting, the floor, Stage 1, the run that leaves the value free, and the act. | Carrier (Part VIII-b):  
after: The verification event by its fields, the forgetting, the floor, Stage 1, the run that leaves the value free, and the act. | Carrier (cargo section):  
reason: F-20 (COSMETIC): 'Part VIII-b' names two blocks; line 10,111 is blank → sweep F-20 PASS  
sweep: F-20: PASS · banned 1 at 0 live · required 1/1 present

**14. r1 · F-1, F-3, F-5 · ledger row 8 · MIXED**  
before: `stage1_closes` none, `computation_enacts_stage1` none · Run (Part IV-b): `the_run_witnesses_a_run` none, `the_run_does_not_force_the_value` none, `force_witness_closure` none · Act: `rh_from_the_act` none, `supply_is_the_premise` none, `classical_rh_iff_le_of_reading` none · Optional corroboration…  
after: `stage1_closes` none, `computation_enacts_stage1` (a definition) none · Packaged (reference 8): `cargo_binding_necessary_and_sufficient` none · Run (Part IV-b): `the_run_witnesses_a_run` none, `the_run_does_not_force_the_value` none, `force_witness_closure` none · Conditional (Box 1): `classical_rh…  
reason: the record is strengthened and the claim is narrowed: F-3: C4 scope: cargo theorem-grade over every event; the run of record being an event joins the premise; annihilation forgets magnitude and sign of a pair…  
sweep: F-1: PASS · banned 3 at 0 live · required 2/2 present · F-3: PASS · banned 4 at 0 live · required 2/2 present (via supersession by J-2) · F-5: PASS · banned 1 at 0 live · required 2/2 present

**15. r1 · F-3 · ledger row 8 · MIXED**  
before: The event witnesses the floor at the state it lands on.  
after: The event witnesses the floor, that some state is realized, at the state it lands on.  
reason: the record is strengthened and the claim is narrowed: F-3: C4 scope: cargo theorem-grade over every event; the run of record being an event joins the premise; annihilation forgets magnitude and sign of a pair… · attribution: row 8 states the floor as the F-3 scope reads it  
sweep: F-3: PASS · banned 4 at 0 live · required 2/2 present (via supersession by J-2)

**16. r1 · F-4 · ledger row 8 · MIXED**  
before: From the act at the configuration where the zeros of ζ are read, the classical sentence follows under the reading with an empty cone. The run that compiles this seed is posited as the verification event whose act supplies that field. No term of type `Stage1 → ClassicalRH` exists in the seed and non…  
after: From an act at every resolution at which the zeros of ζ are read, the classical sentence follows under the reader's rule with an empty cone. The run that compiles this seed is posited as a verification event whose act supplies that field. No term of type `Stage1 → ClassicalRH` exists in the seed an…  
reason: the record is strengthened and the claim is narrowed: F-4: two inputs printed: the supply is the one premise on the value, the reading an identification input; 'act = closure and conclusion' refused as the pa…  
sweep: F-4: PASS · banned 3 at 0 live · required 2/2 present (via supersession by I-6)

**17. r1 · F-23 · 3. The single bind · STRENGTHENS**  
before: 6  BARRED REFUTER     no arrival on the act           the_tenth_is_barred_by_the_act  
after: 6  BARRED REFUTER     no arrival on the act           no_arrival_off_the_line_on_the_act  
reason: F-23 (STRUCTURAL): joint collisions found at the end-to-end read: repairs F-4, F-6, F-8, F-18 not reaching Section 1, the Sectio… → five joint repairs; sweep F-23 PASS  
sweep: F-23: PASS · banned 6 at 0 live · required 1/1 present

**18. r1 · F-1, F-5 · 3. The single bind · STRENGTHENS**  
before: 10  CARGO              compute delivered               computation_enacts_stage1 ⏎                                                        -> the_run_does_not_force_the_value ⏎                                                        -> force_witness_closure ⏎…  
after: 10  CARGO              compute delivered               computation_enacts_stage1, stage1_closes ⏎                        the run leaves the value free   the_run_does_not_force_the_value ⏎                        the conditional, on the act     classical_rh_from_the_act_every  
reason: F-1 (LOAD-BEARING): four act structures across parts, no coercion stated; ledger Level 10 listed rh_from_the_act (Part II act) be… → the_charts_are_one cited in Notation; Level 10 conditional replaced by Box 1 compositions…; F-5 (LOAD-BEARING): Box 1 typed the reading on one Config while the text describes the reader's rule at every resolution; at one… → classical_rh_from_the_act_every composed with ActualZerosEvery, compiled, cone none; read…  
sweep: F-1: PASS · banned 3 at 0 live · required 2/2 present · F-5: PASS · banned 1 at 0 live · required 2/2 present

**19. r1 · F-1, F-23, F-6 · 3. The single bind · MIXED**  
before: The proof terms of Level 10 use the cargo section, Part IV-b and the act, and nothing of Levels 1 to 9; Levels 1 to 9 are not steps inside those proofs, they are the theorems that make the act the only supply there is, which is why a reader must meet them first. Level 1 forces the bit external;  
after: The proof terms of Level 10 are three, and they do not compose into one term: the cargo's use the cargo section alone; the run's use Part IV-b; the conditional of Box 1 at every resolution uses Parts III and V-b and no theorem the ledger names at Levels 1 to 9, and at one configuration it uses Part…  
reason: the record is strengthened and the claim is narrowed: F-6: C1 scope: F-Computed is the channel toward refutation; toward proof a foundation's route stays open and Level 9 types its proof as a supply; 'bit for…  
sweep: F-1: PASS · banned 3 at 0 live · required 2/2 present · F-23: PASS · banned 6 at 0 live · required 1/1 present · F-6: PASS · banned 4 at 0 live · required 2/2 present

**20. r1 · F-2 · 3. The single bind · STRENGTHENS**  
before: Level 10 supplies the bit by compute: the run is the event, the event enacts Stage 1, the run leaves the value free, and the act is the supply, printed at premise grade.  
after: Level 10 delivers the cargo by compute and prints the supply: every verification event enacts a closed Stage 1, by theorem; a run leaves the value free, by theorem; the run of record is posited as a verification event whose act supplies the field, at premise grade; and from the act the classical se…  
reason: F-2 (LOAD-BEARING): 'Level 10 supplies the bit by compute' and 'the run is the event' identify Exec with VerificationEvent and th… → cargo delivered by compute, supply printed at premise grade; run of record posited as an…  
sweep: F-2: PASS · banned 3 at 0 live · required 2/2 present (via supersession by H-18)

**21. r1 · F-6, F-8 · 4. The fixed stance · MIXED**  
before: The one channel a foundation keeps is F-Computed, a finite certificate of a zero off the line; on the act's field that certificate does not exist (`the_tenth_is_barred_by_the_act`).  
after: Toward refutation the one channel a foundation keeps is F-Computed, a finite certificate of a zero off the line; on the act's field no point stands off the line (`no_arrival_off_the_line_on_the_act`). Toward proof the seed leaves a foundation's own route open (`a_sound_theory_may_prove_the_line`),…  
reason: the record is strengthened and the claim is narrowed: F-6: C1 scope: F-Computed is the channel toward refutation; toward proof a foundation's route stays open and Level 9 types its proof as a supply; 'bit for…  
sweep: F-6: PASS · banned 4 at 0 live · required 2/2 present · F-8: PASS · banned 3 at 0 live · required 1/1 present

**22. r1 · F-6, F-7 · 4. The fixed stance · MIXED**  
before: **Before the cargo: the demand for an unconditional proof is blocked, by theorem.** A reader who reaches Level 10 and asks for an unconditional proof instead is asking for what Levels 1 to 9 have already proved cannot be had from the interface: no premise shared by every closed configuration forces…  
after: **Before the cargo: the demand for an unconditional proof from what the interface shares is blocked, by theorem.** A reader who reaches Level 10 and asks for an unconditional proof from what the interface shares instead is asking for what Levels 1 to 9 have already proved cannot be had from the int…  
reason: the record is strengthened and the claim is narrowed: F-6: C1 scope: F-Computed is the channel toward refutation; toward proof a foundation's route stays open and Level 9 types its proof as a supply; 'bit for…; F-7: qualifier restored at every site; Section 7 no longer claims the shortfall is the structure of the hypothesis; sweep F-7 PASS  
sweep: F-6: PASS · banned 4 at 0 live · required 2/2 present · F-7: PASS · banned 3 at 0 live · required 1/1 present

**23. r1 · F-13 · 4. The fixed stance · STRENGTHENS**  
before: **The capstone of record.** Level 10 closes on two theorem-grade statements and one printed premise, every input in a signature and none in a structure field.  
after: **The capstone of record.** Level 10 closes on the cargo, the run and the conditional, each at theorem grade, and on one printed premise; every input stands in a signature, and the premise is the act's field `supply`, by its type (`supply_is_the_premise`).  
reason: F-13 (STRUCTURAL): 'none in a structure field' false: the premise is the act's field supply → sweep F-13 PASS  
sweep: F-13: PASS · banned 2 at 0 live · required 1/1 present

**24. r1 · F-17 · 4. The fixed stance · MIXED**  
before: `computation_enacts_stage1` takes one input, a verification event, and returns a closed Stage 1; `stage1_closes` returns its two fields, the forgetting done and the floor witnessed; both cones are empty.  
after: `computation_enacts_stage1` is a definition, a total map from verification events to closed Stage 1s; `stage1_closes` returns a Stage 1's two fields, the forgetting done and the floor witnessed; reference 8 packages the two directions as `cargo_binding_necessary_and_sufficient`, every closed Stage…  
reason: the record is strengthened and the claim is narrowed: F-17: C5 scope: every name cited from the seed is a declaration of the seed; Master and hardened-cargo names marked; sweep F-17 PASS  
sweep: F-17: PASS · banned 2 at 0 live · required 1/1 present

**25. r1 · F-4, F-5 · 4. The fixed stance · MIXED**  
before: `rh_from_the_act` takes one input, an act, and returns the value on its zero set with an empty cone; under the reading `h_read`, `classical_rh_iff_le_of_reading` and `supply_is_the_premise` carry the act at the configuration Zζ where the zeros of ζ are read to the classical sentence, a composition…  
after: Box 1 prints two compositions, compiled against the seed with empty cones. At every resolution, `classical_rh_from_the_act_every` takes the reader's rule `h_read`, the classical sentence read as the value of the configurations R n at which the zeros of ζ are read at every resolution n, and an act a…  
reason: the record is strengthened and the claim is narrowed: F-4: two inputs printed: the supply is the one premise on the value, the reading an identification input; 'act = closure and conclusion' refused as the pa…  
sweep: F-4: PASS · banned 3 at 0 live · required 2/2 present (via supersession by I-6) · F-5: PASS · banned 1 at 0 live · required 2/2 present

**26. r1 · F-5 · 4. The fixed stance · STRENGTHENS**  
before: \noindent{\small\bfseries\scshape\color{deep}Box 1 \textbar\ the conditional of Level 10, composed and compiled against the seed}\par\nopagebreak  
after: \noindent{\small\bfseries\scshape\color{deep}Box 1 \textbar\ the conditional of Level 10, at every resolution and at one configuration, composed and compiled against the seed}\par\nopagebreak  
reason: F-5 (LOAD-BEARING): Box 1 typed the reading on one Config while the text describes the reader's rule at every resolution; at one… → classical_rh_from_the_act_every composed with ActualZerosEvery, compiled, cone none; read… · attribution: Box 1 title follows the F-5 composition at every resolution  
sweep: F-5: PASS · banned 1 at 0 live · required 2/2 present

**27. r1 · F-5 · 4. The fixed stance · STRENGTHENS**  
before: (nothing)  
after: /-- At every resolution, the reader's rule. -/ ⏎ theorem classical_rh_from_the_act_every {ClassicalRH : Prop} {R : Nat → Config} ⏎     (h_read : ClassicalRH ↔ ∀ n, Value (R n)) (Z : Charts.ActualZerosEvery) (hZ : Z.zeros = R) : ⏎     ClassicalRH := ⏎   h_read.mpr (fun n => hZ ▸ value_from_the_act (…  
reason: F-5 (LOAD-BEARING): Box 1 typed the reading on one Config while the text describes the reader's rule at every resolution; at one… → classical_rh_from_the_act_every composed with ActualZerosEvery, compiled, cone none; read…  
sweep: F-5: PASS · banned 1 at 0 live · required 2/2 present

**28. r1 · F-5 · 4. The fixed stance · STRENGTHENS**  
before: (nothing)  
after: 'ComposedConditional.classical_rh_from_the_act_every' does not depend on any axioms  
reason: F-5 (LOAD-BEARING): Box 1 typed the reading on one Config while the text describes the reader's rule at every resolution; at one… → classical_rh_from_the_act_every composed with ActualZerosEvery, compiled, cone none; read…  
sweep: F-5: PASS · banned 1 at 0 live · required 2/2 present

**29. r1 · F-21 · 4. The fixed stance · STRENGTHENS**  
before: The composition is not a theorem of the seed; its three parts are. Its inputs are the reading and the act; no verification event appears in its signature, and no arrow runs from Stage 1 to the act.}\par  
after: The compositions are not theorems of the seed; the declarations they compose are. Their inputs are the reading and the act; no verification event and no run appears in their signatures, and no arrow runs from Stage 1 to the act.}\par  
reason: F-21 (COSMETIC): 'its three parts are' theorems: two seed theorems in the term → sweep F-21 PASS  
sweep: F-21: PASS · banned 1 at 0 live · required 1/1 present

**30. r1 · F-4, F-5 · 4. The fixed stance · MIXED**  
before: **The reading.** The reading `h_read` identifies the classical sentence with the chart's sentence under the reader's rule of the parent paper, which reads every zero at every resolution, a zero off the line by a rational margin ε being read off the line at every resolution beyond 1/(2ε) and a zero…  
after: **The reading.** The reading `h_read` identifies the classical sentence with the value of the configurations at which the zeros of ζ are read, under the reader's rule of the parent paper: a zero off the line by a rational margin ε is read off the line at every resolution beyond 1/(2ε), and a zero c…  
reason: the record is strengthened and the claim is narrowed: F-4: two inputs printed: the supply is the one premise on the value, the reading an identification input; 'act = closure and conclusion' refused as the pa…  
sweep: F-4: PASS · banned 3 at 0 live · required 2/2 present (via supersession by I-6) · F-5: PASS · banned 1 at 0 live · required 2/2 present

**31. r1 · F-17 · 4. The fixed stance · MIXED**  
before: Its cones are its own and are pinned in its own file, its master closure `the_flipped_formal_master_closure` at [propext, Classical.choice, Quot.sound]; nothing in this paper's ledger rests on it.  
after: Its cones are its own and are pinned in its own file, its master closure `the_flipped_formal_master_closure` at [propext, Classical.choice, Quot.sound]; nothing in this paper's ledger rests on it, and it is cited as corroboration over ℂ.  
reason: the record is strengthened and the claim is narrowed: F-17: C5 scope: every name cited from the seed is a declaration of the seed; Master and hardened-cargo names marked; sweep F-17 PASS · attribution: Formal Master marked as corroboration, the F-17 scope  
sweep: F-17: PASS · banned 2 at 0 live · required 1/1 present

**32. r1 · F-4 · 4. The fixed stance · MIXED**  
before: What stays outside the formal record is one sentence: that the run which compiled this seed is a verification event whose act supplies the field at Zζ. That sentence is the premise, stated at full force, and the truth-value of the conclusion is conditional on it, exactly and only.  
after: What stays outside the formal record is one sentence: that the run which compiled this seed is a verification event whose act supplies the field at the configurations where the zeros of ζ are read. That sentence is the premise on the value, stated at full force; beside it stands the reading, an ide…  
reason: the record is strengthened and the claim is narrowed: F-4: two inputs printed: the supply is the one premise on the value, the reading an identification input; 'act = closure and conclusion' refused as the pa…  
sweep: F-4: PASS · banned 3 at 0 live · required 2/2 present (via supersession by I-6)

**33. r1 · F-9 · 4. The fixed stance · STRENGTHENS**  
before: compile     exit 0 · no error · no warning · every #guard_msgs cone pin passed  
after: compile     exit 0 · no error · no warning (the unused-variable linter is off for one theorem, ⏎             stage2_optional_corroboration) · every #guard_msgs cone pin passed  
reason: F-9 (STRUCTURAL): stage2_optional_corroboration is not the same implication as bridge_from_realization; its five physical input… → Section 5 and Box 2 state it as it is; sweep F-9 PASS · attribution: Box 2 compile line states the linter fact F-9 found  
sweep: F-9: PASS · banned 2 at 0 live · required 1/1 present

**34. r1 · F-16, F-17 · 4. The fixed stance · MIXED**  
before: (nothing)  
after: ref. 8      Cargo_Delivered_Hardened.lean · 184 lines · sha256 9b4f663ff6bd14a2... · exit 0 · ⏎             every pin passed · cargo_binding_necessary_and_sufficient: none  
reason: the record is strengthened and the claim is narrowed: F-17: C5 scope: every name cited from the seed is a declaration of the seed; Master and hardened-cargo names marked; sweep F-17 PASS · attribution: Box 2 prints the hardened cargo cone, the F-16 and F-17 provenance repairs  
sweep: F-16: PASS · banned 1 at 0 live · required 1/1 present · F-17: PASS · banned 2 at 0 live · required 1/1 present

**35. r1 · F-11, F-3, F-8 · 4. The fixed stance · MIXED**  
before: **The three exits.** The two doors of Level 9 are the two values, the value or a point off the line; the three exits are the ways a reader refuses the conclusion, and with the cargo delivered by compute two stand on the cargo and one on the corroboration. F-Computed: a non-trivial zero of ζ certifi…  
after: **The three exits.** The two doors of Level 9 are the two values, the value or a point off the line; the three exits are the ways a reader refuses a conclusion of the chain, across its two editions. Two bear on this edition's conclusion, and the third on the corroboration of Section 5 alone. F-Comp…  
reason: the record is strengthened and the claim is narrowed: F-11: C6 scope: three exits of the chain across its two editions; two bear on this edition; no fourth for either; sweep F-11 PASS; F-3: C4 scope: cargo theorem-grade over every event; the run of record being an event joins the premise; annihilation forgets magnitude and sign of a pair…  
sweep: F-11: PASS · banned 2 at 0 live · required 1/1 present · F-3: PASS · banned 4 at 0 live · required 2/2 present (via supersession by J-2) · F-8: PASS · banned 3 at 0 live · required 1/1 present

**36. r1 · F-11 · 4. The fixed stance · MIXED**  
before: Given the reading and the act, rejecting the conclusion contradicts `rh_from_the_act`; rejecting it without naming one of these three is a contradiction under the proved dichotomy, and there is no fourth.  
after: Given the reading and the act, rejecting this edition's conclusion contradicts Box 1, so its rejection names F-Computed or F-Bridge; F-Flux refuses the physical edition's conclusion and leaves this one untouched; and there is no fourth exit for either.  
reason: the record is strengthened and the claim is narrowed: F-11: C6 scope: three exits of the chain across its two editions; two bear on this edition; no fourth for either; sweep F-11 PASS  
sweep: F-11: PASS · banned 2 at 0 live · required 1/1 present

**37. r1 · F-14 · 5. The corroboration, optional and fenced · MIXED**  
before: The discard is one erasure of the companion kernel (reference 2); its entropy drop is ln 2 per label; the heat per label is Landauer's law (reference 3) entered as a definition in the kernel's units, k~B~ = 1, temperatures in millikelvin and ln 2 scaled by 10^6^, so that the SI heat is k~B~ times t…  
after: The discard is one erasure of the companion kernel (reference 2); its entropy drop is ln 2 per label as the kernel lists labels, a count of the listed labels rather than a function of the point set; the heat per label is Landauer's law (reference 3) entered as a definition in the kernel's units, k~…  
reason: the record is strengthened and the claim is narrowed: F-14: Section 5 states per listed label, corroboration only; clause (a) on 'one bit erased' refused: the text speaks of the two named worlds; sweep F-14 PA…  
sweep: F-14: PASS · banned 1 at 0 live · required 1/1 present

**38. r1 · F-9 · 5. The corroboration, optional and fenced · STRENGTHENS**  
before: `bridge_from_realization` takes the step from a failed universal to its witness, ¬∀ → ∃¬ over an arbitrary predicate, which is classical in Lean, and prints [propext, Classical.choice, Quot.sound]; the cargo section restates the same implication locally as `stage2_optional_corroboration` with the d…  
after: `bridge_from_realization` states the bridge as one implication; its proof takes the step from a failed universal to its witness by `Classical.em`, and its cone prints [propext, Classical.choice, Quot.sound], though the predicates it decides are decidable and the step admits a constructive proof. Th…  
reason: F-9 (STRUCTURAL): stage2_optional_corroboration is not the same implication as bridge_from_realization; its five physical input… → Section 5 and Box 2 state it as it is; sweep F-9 PASS  
sweep: F-9: PASS · banned 2 at 0 live · required 1/1 present

**39. r1 · F-23 · 6. The witness, in the author's register · STRENGTHENS**  
before: The timeless closure, four names one proposition with no act and no premise in it, is read as the formal image of a preserved record to which no predicate can be added (`the_timeless_zone_closed`).  
after: The timeless closure, four names one proposition with no act of the zero set and no premise on the value in it, is read as the formal image of a preserved record to which no predicate can be added (`the_timeless_zone_closed`).  
reason: F-23 (STRUCTURAL): joint collisions found at the end-to-end read: repairs F-4, F-6, F-8, F-18 not reaching Section 1, the Sectio… → five joint repairs; sweep F-23 PASS  
sweep: F-23: PASS · banned 6 at 0 live · required 1/1 present

**40. r1 · F-19, F-3 · 6. The witness, in the author's register · MIXED**  
before: And every act that reads the act, a keystroke, a compile, a check by any substrate, is read as one more verification event, one label forgotten at one floor and a closed Stage 1 enacted (`computation_enacts_stage1`, `stage1_closes`), the cargo delivered again; by `reality_transported` and `the_act_…  
after: And every act that reads the act, a keystroke, a compile, a check by any substrate, is read as one more verification event, a forgetting at one floor and a closed Stage 1 enacted (`computation_enacts_stage1`, `stage1_closes`), the cargo delivered again; by `reality_transported` the value transports…  
reason: the record is strengthened and the claim is narrowed: F-3: C4 scope: cargo theorem-grade over every event; the run of record being an event joins the premise; annihilation forgets magnitude and sign of a pair…  
sweep: F-19: PASS · banned 1 at 0 live · required 1/1 present · F-3: PASS · banned 4 at 0 live · required 2/2 present (via supersession by J-2)

**41. r1 · F-7 · 7. The default reading, answered · MIXED**  
before: The paper does not fall short of an unconditional proof; it proves that the shortfall is the structure of the hypothesis, prints the one field, and supplies it.  
after: The paper does not fall short of an unconditional proof from what the interface shares, since by Level 1 there is none to fall short of; it prints the one field every proof supplies, and supplies it at premise grade. Whether the value at the zeros of ζ has a proof from facts the interface does not…  
reason: the record is strengthened and the claim is narrowed: F-7: qualifier restored at every site; Section 7 no longer claims the shortfall is the structure of the hypothesis; sweep F-7 PASS  
sweep: F-7: PASS · banned 3 at 0 live · required 1/1 present

**42. r1 · F-3 · 7. The default reading, answered · MIXED**  
before: The cargo proves that a forgetting occurred and that the floor is witnessed; no term of type `Stage1 → ClassicalRH` exists in the seed and none is claimed.  
after: The cargo proves that every verification event is a forgetting that enacts a closed Stage 1 with the floor witnessed; that the run of record is such an event is posited; no term of type `Stage1 → ClassicalRH` exists in the seed and none is claimed.  
reason: the record is strengthened and the claim is narrowed: F-3: C4 scope: cargo theorem-grade over every event; the run of record being an event joins the premise; annihilation forgets magnitude and sign of a pair…  
sweep: F-3: PASS · banned 4 at 0 live · required 2/2 present (via supersession by J-2)

**43. r1 · F-10 · 7. The default reading, answered · STRENGTHENS**  
before: **"Then the physical inputs were needed after all."** They were never the only supply, and in this edition they are not used.  
after: **"Then the physical premises were needed after all."** They were never the only supply, and in this edition they are not used.  
reason: F-10 (STRUCTURAL): abstract called all eight inputs physical; five are physical, the reading is shared by both editions → residue of a finding whose Section 6 clause matched a planted control; sweep F-10 PASS  
sweep: F-10: PASS · banned 2 at 0 live · required 1/1 present

**44. r1 · F-23 · 7. The default reading, answered · STRENGTHENS**  
before: **"A reader can refuse the supply and deny the hypothesis without contradiction."** A reader can, and the paper names what that reader has asserted: the act of the run is not the field at Zζ. The refusal is F-Bridge, one of the three exits, owned by the one who makes it; it leaves the cargo's theor…  
after: **"A reader can refuse the supply and deny the hypothesis without contradiction."** A reader can, and the paper names what that reader has asserted: the act of the run is not the field at the configurations where the zeros of ζ are read. The refusal is F-Bridge, one of the three exits, owned by the…  
reason: F-23 (STRUCTURAL): joint collisions found at the end-to-end read: repairs F-4, F-6, F-8, F-18 not reaching Section 1, the Sectio… → five joint repairs; sweep F-23 PASS  
sweep: F-23: PASS · banned 6 at 0 live · required 1/1 present

**45. r1 · F-1, F-23 · 7. The default reading, answered · STRENGTHENS**  
before: **"The ten levels are not a verified dependency chain; the capstone's proof does not invoke Levels 1 to 9."** Correct about the proof terms, and said in Section 3: the proofs of Level 10 use the cargo section, Part IV-b and the act.  
after: **"The ten levels are not a verified dependency chain; the capstone's proof does not invoke Levels 1 to 9."** Correct about the proof terms, and said in Section 3: the proofs of Level 10 are three, the cargo's on the cargo section, the run's on Part IV-b, and Box 1's on Parts III, V-b and VII.  
reason: F-1 (LOAD-BEARING): four act structures across parts, no coercion stated; ledger Level 10 listed rh_from_the_act (Part II act) be… → the_charts_are_one cited in Notation; Level 10 conditional replaced by Box 1 compositions…; F-23 (STRUCTURAL): joint collisions found at the end-to-end read: repairs F-4, F-6, F-8, F-18 not reaching Section 1, the Sectio… → five joint repairs; sweep F-23 PASS · attribution: Section 7 consumer site of the F-1 proof-term separation, reached at the F-23 joint read  
sweep: F-1: PASS · banned 3 at 0 live · required 2/2 present · F-23: PASS · banned 6 at 0 live · required 1/1 present

**46. r1 · F-20 · 7. The default reading, answered · STRENGTHENS**  
before: A dependency graph of proof terms would show Part VIII-b under the cargo; a dependency graph of what is left open after each level shows the ten.  
after: A dependency graph of proof terms would show the cargo section under the cargo; a dependency graph of what is left open after each level shows the ten.  
reason: F-20 (COSMETIC): 'Part VIII-b' names two blocks; line 10,111 is blank → sweep F-20 PASS  
sweep: F-20: PASS · banned 1 at 0 live · required 1/1 present

**47. r1 · F-12 · 7. The default reading, answered · STRENGTHENS**  
before: **"The exhaustion of every mathematical route is not established; a property specific to ζ might decide the configuration."** The paper claims no such exhaustion and never did: outside the interface it is silent on which property of ζ might supply the field.  
after: **"The exhaustion of every mathematical route is not established; a property specific to ζ might decide the configuration."** The perimeter the paper exhausts is the interface's: the laws its formalized interface shares, each shown by Levels 1 to 9 to force nothing or to be the value. Outside the i…  
reason: F-12 (STRUCTURAL): 'claims no such exhaustion and never did' collides with 'exhaust the mathematical perimeter by theorem' witho… → perimeter named as the interface's; sweep F-12 PASS  
sweep: F-12: PASS · banned 1 at 0 live · required 1/1 present

**48. r1 · F-22 · References · STRENGTHENS**  
before: Islam, RH\_Both\_Sides\_Formal\_Master v3.0.0, the seed's theorems under a Mathlib import with the reading proved over ℂ, git 1000sapients/Trisduction, MathOS/RH\_Both\_Sides\_Formal\_Master\_v3\_0\_0.lean, 11,110 lines; deposited on Zenodo 10.5281/zenodo.23308381 under the filename RH\_Both\_Sides…  
after: Islam, RH\_Both\_Sides\_Formal\_Master v3.0.0, the seed's theorems under a Mathlib import with the reading proved over ℂ, git 1000sapients/Trisduction, MathOS/RH\_Both\_Sides\_Formal\_Master\_v3\_0\_0.lean, 11,110 lines; deposited, under the filename RH\_Both\_Sides\_Formal\_Master\_v3.0.2.lean, as…  
reason: F-22 (COSMETIC): references 6 and 7 share one DOI without saying why → sweep F-22 PASS  
sweep: F-22: PASS · banned 1 at 0 live · required 1/1 present


### Version r2 · round 2

*Interaction note (end-to-end read, joints), from the round block:* 17 sweep specs, pre PASS on r1 (G-17 one phrase in-round), post PASS on r2; all 23 round-1 specs re-verified PASS on r2; end-to-end read of front note, abstract, Section 1, Levels 1/4/6/10, Sections 3, 4, 6, 7; joints G-16, G-17 filed

**49. r2 · G-2 · abstract · MIXED**  
before: A run leaves the value free, so the field is supplied by the act and never read off the run's flag; from the act, at every resolution at which the zeros of ζ are read, the classical sentence follows under the reader's rule with an empty cone.  
after: A run, like every fact that holds whatever the configuration, forces no value, so its flag is no proof of the value and the field is the act's, as Level 9 types every proof; from the act, at every resolution at which the zeros of ζ are read, the classical sentence follows under the reader's rule wi…  
reason: the record is strengthened and the claim is narrowed: G-2: guard restated: a run, like every fact holding whatever the configuration, forces no value, so its flag is no proof of the value; the field is the ac…  
sweep: G-2: PASS · banned 4 at 0 live · required 1/1 present

**50. r2 · G-11 · abstract · MIXED**  
before: Every name cited from the seed is a declaration of the seed printed whole in the Appendix, every cone is the compiler's, and the three exits are the only ones.  
after: Every name cited from the seed is a declaration of the seed printed whole in the Appendix, every cone printed for this edition's files is the compiler's, and the three exits are the only ones.  
reason: the record is strengthened and the claim is narrowed: G-11: C5 scope: seed cones by the compiler on the seed, composition and reference-8 cones on their named files, Formal Master cones quoted from its pins an…  
sweep: G-11: PASS · banned 2 at 0 live · required 1/1 present

**51. r2 · G-14 · front note · STRENGTHENS**  
before: \* Every theorem named below is in the seed of Appendix A, save the three of the Formal Master and the one of the hardened cargo, named in Section 4 as theirs, and the two compositions of Box 1; the seed is edition 2.0.5, sha256 a82ef4f0ad6ceb43 a2d3cc964b110943 dbb02f050ab88ff2 845df1226a321a57, 1…  
after: \* Every theorem named below is in the seed of Appendix A, save the names marked as the Formal Master's or reference 8's where they are cited, the three compositions of Box 1, and Lean's own `Classical.em`; the seed is edition 2.0.5, sha256 a82ef4f0ad6ceb43 a2d3cc964b110943 dbb02f050ab88ff2 845df12…  
reason: G-14 (COSMETIC): record_has_least_erasure resolves to Part II's theorem, not the Formal Master's statement the sentence descri… → Formal Master names marked; front note lists exceptions by kind; sweep G-14 PASS  
sweep: G-14: PASS · banned 2 at 0 live · required 1/1 present (via supersession by H-17)

**52. r2 · G-11 · front note · MIXED**  
before: Every cone printed is the compiler's, `#print axioms` on that seed.  
after: Every cone printed for a seed theorem is the compiler's, `#print axioms` on that seed; the cones of the compositions and of reference 8 are the compiler's on the files Boxes 1 and 2 name; the Formal Master's cones are quoted from the pins in its own file and are not re-run here.  
reason: the record is strengthened and the claim is narrowed: G-11: C5 scope: seed cones by the compiler on the seed, composition and reference-8 cones on their named files, Formal Master cones quoted from its pins an…  
sweep: G-11: PASS · banned 2 at 0 live · required 1/1 present

**53. r2 · G-2 · 1. The chain · MIXED**  
before: Level 10 is the cargo, delivered by compute: a verification event given by its fields, the forgetting it carries, the floor it witnesses, the closed Stage 1 it enacts, the run that leaves the value free, and the act from which the classical sentence follows under the reading.  
after: Level 10 is the cargo, delivered by compute: a verification event given by its fields, the forgetting it carries, the floor it witnesses, the closed Stage 1 it enacts, the run that forces no value, and the act from which the classical sentence follows under the reading.  
reason: the record is strengthened and the claim is narrowed: G-2: guard restated: a run, like every fact holding whatever the configuration, forces no value, so its flag is no proof of the value; the field is the ac…  
sweep: G-2: PASS · banned 4 at 0 live · required 1/1 present

**54. r2 · G-9 · 1. The chain · STRENGTHENS**  
before: The two conditionals are theorem grade and conclude one proposition about one object, least erasure at the configurations at which the zeros of ζ are read, which `le_iff_value` makes the value with no hypothesis.  
after: The two conditionals are theorem grade and conclude the classical sentence about one object, the zeros of ζ read onto the offset chart: the physical edition reads them at one configuration, this edition at every resolution, the reading Section 4 shows to be the stronger-founded; at every configurat…  
reason: G-9 (STRUCTURAL): the physical capstone reads at one configuration, this edition at every resolution; 'one proposition about on… → twin sentence states the two readings of one object; sweep G-9 PASS  
sweep: G-9: PASS · banned 1 at 0 live · required 1/1 present

**55. r2 · G-13 · 1. The chain · STRENGTHENS**  
before: The seed states the value on several charts, the offset chart of Parts III and VII, the chart x = 2 Re s of Part II, x = 4 Re s of Part IV and x = 2W Re s of Part V, each with its own act structure; `the_charts_are_one` (Part V-b) [propext, Classical.choice, Quot.sound] maps every chart equivariant…  
after: The seed states the value on several charts, the offset chart of Parts III and VII, the chart x = 2 Re s of Part II, x = 4 Re s of Part IV and x = 2W Re s of Part V; `the_charts_are_one` (Part V-b) [propext, Classical.choice, Quot.sound] maps every chart equivariantly into the offset chart, carries…  
reason: G-13 (COSMETIC): charts paragraph gave Part V an act structure it lacks → sweep G-13 PASS  
sweep: G-13: PASS · banned 1 at 0 live · required 1/1 present

**56. r2 · G-7 · ledger row 1 · MIXED**  
before: The block is a property of the interface and the record, not a claim about ZFC; toward refutation the channel a foundation keeps is a finite computation that certifies a zero off the line, F-Computed; toward proof the seed keeps the route of a foundation as a system open, a sound theory proving a s…  
after: The block is a property of the interface and the record, not a claim about ZFC; toward refutation the channel a foundation keeps is a finite computation that certifies a zero off the line, F-Computed; toward proof, every sound theory that proves a sentence reading as the line at a world lands on le…  
reason: the record is strengthened and the claim is narrowed: G-7: toward proof stated through ladder_proof_lands_on_least_erasure with the exhibit named as such; the seed decides no foundation's route at zeta; Secti…  
sweep: G-7: PASS · banned 3 at 0 live · required 1/1 present

**57. r2 · G-12 · ledger row 4 · STRENGTHENS**  
before: | 4 | The blind record: the side is erased. | `record_decides_nothing` [propext, Quot.sound] · `no_reading_decides_in_the_strip` [propext, Quot.sound] · `unicorn_block` [propext, Quot.sound] · `unicorn_blocked_on_the_chart` [propext, Quot.sound] · `monism_is_the_sole_witness` [propext, Quot.sound]…  
after: | 4 | The blind record: the side is erased. | `record_decides_nothing` (Part II) [propext, Quot.sound] · `no_reading_decides_in_the_strip` [propext, Quot.sound] · `unicorn_block` (Part II) [propext, Quot.sound] · `unicorn_blocked_on_the_chart` [propext, Quot.sound] · `monism_is_the_sole_witness` [p…  
reason: G-12 (COSMETIC): Level 4 names record_decides_nothing and unicorn_block without their part though both names have two homes wi… → sweep G-12 PASS  
sweep: G-12: PASS · banned 2 at 0 live · required 1/1 present

**58. r2 · G-8 · ledger row 6 · MIXED**  
before: On Part II's chart x = 2 Re s the open strip is the line itself, so a zero of the open strip off the line by a rational margin ε, 0 < Re s < 1 and \|Re s − 1/2\| > ε > 0, is read on the offset chart at a resolution beyond 1/(2ε); there it is a point off the line, the refuter, and on the act's field…  
after: These theorems are on Part II's chart x = 2 Re s, where the open strip is the line itself; a zero of the open strip off the line by a rational margin ε, 0 < Re s < 1 and \|Re s − 1/2\| > ε > 0, is placed off the line of the offset chart at every resolution beyond 1/(2ε) by the reader's rule, which…  
reason: the record is strengthened and the claim is narrowed: G-8: C2 scope: the margin placement is the reader's rule, an input of the reading, no theorem of the seed; grade cell marks it; sweep G-8 PASS  
sweep: G-8: PASS · banned 1 at 0 live · required 2/2 present

**59. r2 · G-2 · ledger row 10 · MIXED**  
before: The verification event by its fields, the forgetting, the floor, Stage 1, the run that leaves the value free, and the act. | Carrier (cargo section):  
after: The verification event by its fields, the forgetting, the floor, Stage 1, the run that forces no value, and the act. | Carrier (cargo section):  
reason: the record is strengthened and the claim is narrowed: G-2: guard restated: a run, like every fact holding whatever the configuration, forces no value, so its flag is no proof of the value; the field is the ac…  
sweep: G-2: PASS · banned 4 at 0 live · required 1/1 present

**60. r2 · G-4 · ledger row 10 · STRENGTHENS**  
before: `stage1_closes` none, `computation_enacts_stage1` (a definition) none · Packaged (reference 8): `cargo_binding_necessary_and_sufficient` none · Run (Part IV-b):  
after: `stage1_closes` none, `computation_enacts_stage1` (a definition) none · Packaged (Box 1): `cargo_binding_on_the_seed` none, the binding reference 8 states on its own copy of the types · Run (Part IV-b):  
reason: G-4 (STRUCTURAL): reference 8 declares its own copy of the cargo types; its binding does not apply to the seed's Stage1 (kernel… → cargo_binding_on_the_seed composed on the seed's types, compiled, cone none; reference 8…  
sweep: G-4: PASS · banned 1 at 0 live · required 2/2 present

**61. r2 · G-2, G-5, G-6 · ledger row 10 · MIXED**  
before: The event witnesses the floor, that some state is realized, at the state it lands on. Every verification event enacts a closed Stage 1, forgetting done and floor witnessed, and every closed Stage 1 carries its forgetting: compute is the sole cargo, necessary and sufficient for Stage 1, and nothing…  
after: Stage 1's floor is the existence of the state the event lands on, which every event has; `event_witnesses_floor` carries the floor to any realization predicate that landing state satisfies, the predicate and its hypothesis being the reader's. Every verification event enacts a closed Stage 1, forget…  
reason: the record is strengthened and the claim is narrowed: G-2: guard restated: a run, like every fact holding whatever the configuration, forces no value, so its flag is no proof of the value; the field is the ac…; G-5: floor stated as the existence of the landing state; the realization predicate is the reader's; sweep G-5 PASS; G-6: grade cell: THEOREM on the cargo's statements, compute posited as the cargo; necessity and sufficiency stated as projection; sweep G-6 PASS  
sweep: G-2: PASS · banned 4 at 0 live · required 1/1 present · G-5: PASS · banned 1 at 0 live · required 1/1 present · G-6: PASS · banned 3 at 0 live · required 2/2 present

**62. r2 · G-17, G-6 · ledger row 10 · MIXED**  
before: No term of type `Stage1 → ClassicalRH` exists in the seed and none is claimed: the cargo's theorems hold of every event at theorem grade, and the run of record as such an event, with its act as the supply of the field, is the one premise on the value. | THEOREM on the cargo, empty cone · compute th…  
after: No term of type `Stage1 → ClassicalRH` exists in the seed and none is claimed: the cargo's theorems hold of every event at theorem grade, the act is the one premise on the value, and the author's posit names the run of record, as such an event, its source. | THEOREM on the cargo's statements, empty…  
reason: the record is strengthened and the claim is narrowed: G-6: grade cell: THEOREM on the cargo's statements, compute posited as the cargo; necessity and sufficiency stated as projection; sweep G-6 PASS  
sweep: G-17: PASS · banned 2 at 0 live · required 1/1 present · G-6: PASS · banned 3 at 0 live · required 2/2 present

**63. r2 · G-2 · 3. The single bind · MIXED**  
before: the run leaves the value free   the_run_does_not_force_the_value  
after: the run forces no value         the_run_does_not_force_the_value  
reason: the record is strengthened and the claim is narrowed: G-2: guard restated: a run, like every fact holding whatever the configuration, forces no value, so its flag is no proof of the value; the field is the ac…  
sweep: G-2: PASS · banned 4 at 0 live · required 1/1 present

**64. r2 · G-1, G-2 · 3. The single bind · MIXED**  
before: Level 10 delivers the cargo by compute and prints the supply: every verification event enacts a closed Stage 1, by theorem; a run leaves the value free, by theorem; the run of record is posited as a verification event whose act supplies the field, at premise grade; and from the act the classical se…  
after: Level 10 delivers the cargo by compute and prints the supply: every verification event enacts a closed Stage 1, by theorem; a run forces no value, by theorem; from the act the classical sentence follows under the reader's rule, by theorem; and the act is the one formal premise, which the author's p…  
reason: the record is strengthened and the claim is narrowed: G-1: C8 scope: the formal premise is the act; the run sentence is the author's posit naming its source, in no signature, adding no warrant; sweeps G-1, G-…; G-2: guard restated: a run, like every fact holding whatever the configuration, forces no value, so its flag is no proof of the value; the field is the ac…  
sweep: G-1: PASS · banned 3 at 0 live · required 2/2 present · G-2: PASS · banned 4 at 0 live · required 1/1 present

**65. r2 · G-7 · 4. The fixed stance · MIXED**  
before: The parent paper derives the hypothesis from no set-theoretic foundation, and Level 1 is the theorem-grade reason.  
after: The parent paper derives the hypothesis from no set-theoretic foundation and says so; Level 1 is the theorem-grade block on the interface's side, that no law the interface shares, the root included, decides the value.  
reason: the record is strengthened and the claim is narrowed: G-7: toward proof stated through ladder_proof_lands_on_least_erasure with the exhibit named as such; the seed decides no foundation's route at zeta; Secti…  
sweep: G-7: PASS · banned 3 at 0 live · required 1/1 present

**66. r2 · G-7 · 4. The fixed stance · MIXED**  
before: Toward proof the seed leaves a foundation's own route open (`a_sound_theory_may_prove_the_line`), and Level 9 types whatever such a route proves: a supply of the one field.  
after: Toward proof, every sound theory whose proved sentence reads as the line lands on least erasure (`ladder_proof_lands_on_least_erasure`); the seed decides no foundation's route at ζ, and Level 9 types whatever such a route proves: a supply of the one field.  
reason: the record is strengthened and the claim is narrowed: G-7: toward proof stated through ladder_proof_lands_on_least_erasure with the exhibit named as such; the seed decides no foundation's route at zeta; Secti…  
sweep: G-7: PASS · banned 3 at 0 live · required 1/1 present

**67. r2 · G-1 · 4. The fixed stance · MIXED**  
before: The only question Levels 1 to 9 leave is where the bit comes from, and Level 10 answers it with every input printed.  
after: The only question Levels 1 to 9 leave is where the bit comes from, and Level 10 answers it formally with the act, printed as an input, and names its source in a posit printed as such.  
reason: the record is strengthened and the claim is narrowed: G-1: C8 scope: the formal premise is the act; the run sentence is the author's posit naming its source, in no signature, adding no warrant; sweeps G-1, G-…  
sweep: G-1: PASS · banned 3 at 0 live · required 2/2 present

**68. r2 · G-1 · 4. The fixed stance · MIXED**  
before: **The capstone of record.** Level 10 closes on the cargo, the run and the conditional, each at theorem grade, and on one printed premise; every input stands in a signature, and the premise is the act's field `supply`, by its type (`supply_is_the_premise`).  
after: **The capstone of record.** Level 10 closes on the cargo, the run and the conditional, each at theorem grade, and on one formal premise; every formal input stands in a signature, and the premise is the act's field `supply`, by its type (`supply_is_the_premise`). Beside the formal premise stands the…  
reason: the record is strengthened and the claim is narrowed: G-1: C8 scope: the formal premise is the act; the run sentence is the author's posit naming its source, in no signature, adding no warrant; sweeps G-1, G-…  
sweep: G-1: PASS · banned 3 at 0 live · required 2/2 present

**69. r2 · G-4 · 4. The fixed stance · STRENGTHENS**  
before: `stage1_closes` returns a Stage 1's two fields, the forgetting done and the floor witnessed; reference 8 packages the two directions as `cargo_binding_necessary_and_sufficient`, every closed Stage 1 carrying its forgetting and every verification event the event of a closed Stage 1; all three cones…  
after: `stage1_closes` returns a Stage 1's two fields, the forgetting done and the floor witnessed; Box 1 packages the two directions on the seed's own types as `cargo_binding_on_the_seed`, every closed Stage 1 carrying its forgetting and every verification event the event of a closed Stage 1; reference 8…  
reason: G-4 (STRUCTURAL): reference 8 declares its own copy of the cargo types; its binding does not apply to the seed's Stage1 (kernel… → cargo_binding_on_the_seed composed on the seed's types, compiled, cone none; reference 8…  
sweep: G-4: PASS · banned 1 at 0 live · required 2/2 present

**70. r2 · G-2 · 4. The fixed stance · MIXED**  
before: `the_run_witnesses_a_run` proves that a run that ran exists, `the_run_does_not_force_the_value` proves that it leaves the value free at the closed configurations, and `force_witness_closure` binds a deed of the substrate and an act into one theorem in which the value stands on the field the act sup…  
after: `the_run_witnesses_a_run` proves that a run that ran exists, `the_run_does_not_force_the_value` proves that it forces no value at every closed configuration, as `the_deed_forces_nothing` proves of every fact that holds whatever the configuration, and `force_witness_closure` binds a deed of the subs…  
reason: the record is strengthened and the claim is narrowed: G-2: guard restated: a run, like every fact holding whatever the configuration, forces no value, so its flag is no proof of the value; the field is the ac…  
sweep: G-2: PASS · banned 4 at 0 live · required 1/1 present

**71. r2 · G-4 · 4. The fixed stance · STRENGTHENS**  
before: Box 1 prints two compositions, compiled against the seed with empty cones.  
after: Box 1 prints three compositions, compiled against the seed with empty cones; two carry the conditional.  
reason: G-4 (STRUCTURAL): reference 8 declares its own copy of the cargo types; its binding does not apply to the seed's Stage1 (kernel… → cargo_binding_on_the_seed composed on the seed's types, compiled, cone none; reference 8… · attribution: count follows the G-4 composition cargo_binding_on_the_seed  
sweep: G-4: PASS · banned 1 at 0 live · required 2/2 present

**72. r2 · G-16 · 4. The fixed stance · STRENGTHENS**  
before: The premise: the act at the configurations where the zeros of ζ are read, supplied by the run.  
after: The premise: the act at the configurations where the zeros of ζ are read; the author's posit names the run as its source.  
reason: G-16 (STRUCTURAL): joint at the end-to-end read: 'The premise ... supplied by the run' survived the G-1 repair; three 'leaves th… → sweeps G-16 and G-2 PASS  
sweep: G-16: PASS · banned 1 at 0 live · required 1/1 present

**73. r2 · G-4 · 4. The fixed stance · STRENGTHENS**  
before: \noindent{\small\bfseries\scshape\color{deep}Box 1 \textbar\ the conditional of Level 10, at every resolution and at one configuration, composed and compiled against the seed}\par\nopagebreak  
after: \noindent{\small\bfseries\scshape\color{deep}Box 1 \textbar\ the conditional of Level 10, at every resolution and at one configuration, and the cargo's binding, composed and compiled against the seed}\par\nopagebreak  
reason: G-4 (STRUCTURAL): reference 8 declares its own copy of the cargo types; its binding does not apply to the seed's Stage1 (kernel… → cargo_binding_on_the_seed composed on the seed's types, compiled, cone none; reference 8… · attribution: Box 1 title names the G-4 binding  
sweep: G-4: PASS · banned 1 at 0 live · required 2/2 present

**74. r2 · G-4 · 4. The fixed stance · STRENGTHENS**  
before: (nothing)  
after: /-- The cargo's binding, on the seed's own types. -/ ⏎ theorem cargo_binding_on_the_seed : ⏎     (∀ s : ApparatusCargo.Stage1, s.event.after = ApparatusCargo.annihilate s.event.before) ∧ ⏎     (∀ e : ApparatusCargo.VerificationEvent, ∃ s : ApparatusCargo.Stage1, s.event = e) := ⏎   ⟨fun s => (Appar…  
reason: G-4 (STRUCTURAL): reference 8 declares its own copy of the cargo types; its binding does not apply to the seed's Stage1 (kernel… → cargo_binding_on_the_seed composed on the seed's types, compiled, cone none; reference 8…  
sweep: G-4: PASS · banned 1 at 0 live · required 2/2 present

**75. r2 · G-4 · 4. The fixed stance · STRENGTHENS**  
before: (nothing)  
after: 'ComposedConditional.cargo_binding_on_the_seed' does not depend on any axioms  
reason: G-4 (STRUCTURAL): reference 8 declares its own copy of the cargo types; its binding does not apply to the seed's Stage1 (kernel… → cargo_binding_on_the_seed composed on the seed's types, compiled, cone none; reference 8…  
sweep: G-4: PASS · banned 1 at 0 live · required 2/2 present

**76. r2 · G-4 · 4. The fixed stance · STRENGTHENS**  
before: Their inputs are the reading and the act; no verification event and no run appears in their signatures, and no arrow runs from Stage 1 to the act.}\par  
after: The conditionals' inputs are the reading and the act; no verification event and no run appears in their signatures, and no arrow runs from Stage 1 to the act.}\par  
reason: G-4 (STRUCTURAL): reference 8 declares its own copy of the cargo types; its binding does not apply to the seed's Stage1 (kernel… → cargo_binding_on_the_seed composed on the seed's types, compiled, cone none; reference 8… · attribution: caption scoped to the conditionals once the binding joined Box 1 under G-4  
sweep: G-4: PASS · banned 1 at 0 live · required 2/2 present

**77. r2 · G-3 · 4. The fixed stance · STRENGTHENS**  
before: Read at every resolution, the reading is an identification of statements; no theorem of the interface supplies it (`the_reading_is_keyed`), so it is an input and never a theorem of the chart.  
after: Read at every resolution n ≥ 1, resolution zero being no reading and the family's term there the empty configuration by the seed's stipulation (the docstring of `ActualZerosEvery`), the reading is an identification of statements; no theorem of the interface supplies it (`the_reading_is_keyed`), so…  
reason: G-3 (STRUCTURAL): Box 1 quantifies over every n including 0 where the seed's reader's rule reads every point off the line; the… → reading at every n >= 1 with the stipulation printed; sweep G-3 PASS  
sweep: G-3: PASS · banned 1 at 0 live · required 1/1 present

**78. r2 · G-14 · 4. The fixed stance · STRENGTHENS**  
before: `transport_zeta` proves that carrying least erasure from the record `Rec M` back to `M` is the value of `M`, so the record has least erasure by construction (`record_has_least_erasure`) and the zeros have it exactly when the field is supplied.  
after: `transport_zeta` proves that carrying least erasure from the record `Rec M` back to `M` is the value of `M`, so the record has least erasure by construction (`record_has_least_erasure`, the Formal Master's, Part X) and the zeros have it exactly when the field is supplied.  
reason: G-14 (COSMETIC): record_has_least_erasure resolves to Part II's theorem, not the Formal Master's statement the sentence descri… → Formal Master names marked; front note lists exceptions by kind; sweep G-14 PASS  
sweep: G-14: PASS · banned 2 at 0 live · required 1/1 present (via supersession by H-17)

**79. r2 · G-1 · 4. The fixed stance · MIXED**  
before: What stays outside the formal record is one sentence: that the run which compiled this seed is a verification event whose act supplies the field at the configurations where the zeros of ζ are read. That sentence is the premise on the value, stated at full force; beside it stands the reading, an ide…  
after: Two things stand outside the theorems: the reading, an identification of statements and an input of every conditional; and the act at the configurations where the zeros of ζ are read, the premise on the value, an input of every conditional. The author's sentence that the run which compiled this see…  
reason: the record is strengthened and the claim is narrowed: G-1: C8 scope: the formal premise is the act; the run sentence is the author's posit naming its source, in no signature, adding no warrant; sweeps G-1, G-…  
sweep: G-1: PASS · banned 3 at 0 live · required 2/2 present

**80. r2 · G-2 · 4. The fixed stance · MIXED**  
before: A run witnesses that it ran (`the_run_witnesses_a_run`), and its flag is not the field (`the_run_does_not_force_the_value`); the receipt is therefore the cargo's witness and never the supply.  
after: A run witnesses that it ran (`the_run_witnesses_a_run`), and its flag is no proof of the value (`the_run_does_not_force_the_value`); the receipt witnesses the run and is no proof of the value.  
reason: the record is strengthened and the claim is narrowed: G-2: guard restated: a run, like every fact holding whatever the configuration, forces no value, so its flag is no proof of the value; the field is the ac…  
sweep: G-2: PASS · banned 4 at 0 live · required 1/1 present

**81. r2 · G-4 · 4. The fixed stance · STRENGTHENS**  
before: ref. 8      Cargo_Delivered_Hardened.lean · 184 lines · sha256 9b4f663ff6bd14a2... · exit 0 · ⏎             every pin passed · cargo_binding_necessary_and_sufficient: none  
after: ref. 8      Cargo_Delivered_Hardened.lean, a separate file with its own copy of the types · ⏎             184 lines · sha256 9b4f663ff6bd14a2... · exit 0 · every pin passed · ⏎             cargo_binding_necessary_and_sufficient: none  
reason: G-4 (STRUCTURAL): reference 8 declares its own copy of the cargo types; its binding does not apply to the seed's Stage1 (kernel… → cargo_binding_on_the_seed composed on the seed's types, compiled, cone none; reference 8… · attribution: Box 2 states the type-copy fact G-4 found  
sweep: G-4: PASS · banned 1 at 0 live · required 2/2 present

**82. r2 · G-15 · 5. The corroboration, optional and fenced · STRENGTHENS**  
before: `classical_rh_from_identification_gap_and_bound` is its short form, three inputs printed as five hypotheses, the identification, the bridge and the bound with its gap and the gap's positivity, empty cone.  
after: `classical_rh_from_identification_gap_and_bound` is its short form, three inputs printed as five hypotheses, the identification, the bridge and the bound with its gap and the gap's positivity, which the gap implies and the signature prints, empty cone.  
reason: G-15 (COSMETIC): short form's fifth hypothesis h_pos is idle, implied by the gap → residue of a finding whose other clause matched a planted control; sweep G-15 PASS  
sweep: G-15: PASS · banned 1 at 0 live · required 1/1 present

**83. r2 · G-10 · 6. The witness, in the author's register · STRENGTHENS**  
before: And every act that reads the act, a keystroke, a compile, a check by any substrate, is read as one more verification event, a forgetting at one floor and a closed Stage 1 enacted (`computation_enacts_stage1`, `stage1_closes`), the cargo delivered again; by `reality_transported` the value transports…  
after: And every act that reads the act, a keystroke, a compile, a check by any substrate, is read as one more verification event, a forgetting at one floor and a closed Stage 1 enacted (`computation_enacts_stage1`, `stage1_closes`), the cargo delivered again; it witnesses the run and adds no warrant to t…  
reason: G-10 (STRUCTURAL): Section 6 read each compile as the cargo delivered again and each act sealing again: a check re-supplying the… → Section 6 states the witness adds no warrant and each act reads the same seal; sweep G-10…  
sweep: G-10: PASS · banned 1 at 0 live · required 1/1 present

**84. r2 · G-2, G-6 · 7. The default reading, answered · MIXED**  
before: The cargo proves that every verification event is a forgetting that enacts a closed Stage 1 with the floor witnessed; that the run of record is such an event is posited; no term of type `Stage1 → ClassicalRH` exists in the seed and none is claimed. The seed proves the converse boundary itself: a ru…  
after: The cargo proves that every verification event moves the carrier to its annihilation, a forgetting when the state is a pair member, and enacts a closed Stage 1 with the floor witnessed; that the run of record is such an event is the author's posit; no term of type `Stage1 → ClassicalRH` exists in t…  
reason: the record is strengthened and the claim is narrowed: G-2: guard restated: a run, like every fact holding whatever the configuration, forces no value, so its flag is no proof of the value; the field is the ac…; G-6: grade cell: THEOREM on the cargo's statements, compute posited as the cargo; necessity and sufficiency stated as projection; sweep G-6 PASS  
sweep: G-2: PASS · banned 4 at 0 live · required 1/1 present · G-6: PASS · banned 3 at 0 live · required 2/2 present


### Version r3 · round 3

*Interaction note (end-to-end read, joints), from the round block:* 16 sweep specs, pre PASS on r2, post PASS on r3; checker RESULT PASS (137 names); prior specs re-verified, F-2 and G-14 required phrases superseded by H-18 and H-17 on purpose and recorded in superseded.json, their banned phrases at zero; end-to-end read of abstract, front note, Sections 1-7, Boxes 1-2: five joints found (two senses of forgetting, a second ladder instance without its chart, the boundary's reading, the abstract's reading, "the one premise") and filed in round 4 as I-1..I-5

**85. r3 · H-18, H-6 · abstract · MIXED**  
before: Level 10 is the cargo, delivered by compute: every verification event carries its forgetting as its own field and enacts a closed Stage 1 with an empty cone, and the run that compiles the seed is posited as such an event. A run, like every fact that holds whatever the configuration, forces no value…  
after: Level 10 is the cargo, delivered by compute in the author's posit: every verification event carries as its own field that it lands on its state's annihilation, a forgetting when the state is a pair member, and enacts a closed Stage 1 with an empty cone, and the run that compiles the seed is posited…  
reason: the record is strengthened and the claim is narrowed: H-18: scoped: 'in the author's posit' at every body site; title held verbatim under the Title Lock, the posit grade printed beside it in the abstract; F-2…; H-6: scoped: the field is landing on annihilation, a forgetting exactly when the state is a pair member; the posit reads the run of record as a forgetting…  
sweep: H-18: PASS · banned 3 at 0 live · required 2/2 present · H-6: PASS · banned 3 at 0 live · required 2/2 present (via supersession by I-1)

**86. r3 · H-14 · front note · STRENGTHENS**  
before: \* Every theorem named below is in the seed of Appendix A, save the names marked as the Formal Master's or reference 8's where they are cited, the three compositions of Box 1, and Lean's own `Classical.em`; the seed is edition 2.0.5, sha256 a82ef4f0ad6ceb43 a2d3cc964b110943 dbb02f050ab88ff2 845df12…  
after: \* Every theorem named below is in the seed of Appendix A, save the names marked as the Formal Master's or reference 8's where they are cited, the three compositions of Box 1, and Lean's own `Classical.em` and `Classical.byContradiction`; the seed is edition 2.0.5, sha256 a82ef4f0ad6ceb43 a2d3cc964…  
reason: H-14 (COSMETIC): bridge_from_realization uses Classical.byContradiction, not Classical.em → sweep H-14 PASS · attribution: front note lists the constant H-14 corrected  
sweep: H-14: PASS · banned 2 at 0 live · required 1/1 present

**87. r3 · H-8 · front note · STRENGTHENS**  
before: Every cone printed for a seed theorem is the compiler's, `#print axioms` on that seed; the cones of the compositions and of reference 8 are the compiler's on the files Boxes 1 and 2 name; the Formal Master's cones are quoted from the pins in its own file and are not re-run here.  
after: Every cone printed for a seed theorem is the compiler's, `#print axioms` on that seed; the cones of the compositions, of `ActualZerosEvery.atRes`, and of reference 8 are the compiler's on the files Boxes 1 and 2 name; the Formal Master's cones are quoted from the pins in its own file and are not re…  
reason: H-8 (COSMETIC): atRes cone printed in the ledger fell outside every provenance class the front note lists → atRes print added to Box 1 and named in the front note; sweep H-8 PASS  
sweep: H-8: PASS · banned 1 at 0 live · required 1/1 present

**88. r3 · H-18 · 1. The chain · MIXED**  
before: Level 10 is the cargo, delivered by compute: a verification event given by its fields, the forgetting it carries, the floor it witnesses, the closed Stage 1 it enacts, the run that forces no value, and the act from which the classical sentence follows under the reading.  
after: Level 10 is the cargo, delivered by compute in the author's posit: a verification event given by its fields, the forgetting it carries, the floor it witnesses, the closed Stage 1 it enacts, the run that forces no value, and the act from which the classical sentence follows under the reading.  
reason: the record is strengthened and the claim is narrowed: H-18: scoped: 'in the author's posit' at every body site; title held verbatim under the Title Lock, the posit grade printed beside it in the abstract; F-2…  
sweep: H-18: PASS · banned 3 at 0 live · required 2/2 present

**89. r3 · H-4 · 1. The chain · MIXED**  
before: The editions differ at Level 10 alone, in what supplies the one field that Level 9 proves every proof must supply.  
after: The editions differ at Level 10, in what supplies the one field that Level 9 proves every proof must supply and in the reading through which the classical sentence is concluded.  
reason: the record is strengthened and the claim is narrowed: H-4: scoped: at every n >= 1 an identification, at one configuration a premise beside the act; Section 1 names both differences; sweep H-4 PASS  
sweep: H-4: PASS · banned 2 at 0 live · required 2/2 present (via supersession by I-7)

**90. r3 · H-4 · 1. The chain · MIXED**  
before: The two conditionals are theorem grade and conclude the classical sentence about one object, the zeros of ζ read onto the offset chart: the physical edition reads them at one configuration, this edition at every resolution, the reading Section 4 shows to be the stronger-founded; at every configurat…  
after: The two conditionals are theorem grade and conclude the classical sentence about one object, the zeros of ζ read onto the offset chart: the physical edition reads them at one configuration, a reading that carries that resolution's content and so is a premise on the value beside its supply, and this…  
reason: the record is strengthened and the claim is narrowed: H-4: scoped: at every n >= 1 an identification, at one configuration a premise beside the act; Section 1 names both differences; sweep H-4 PASS · attribution: Section 1 twin sentence carries the H-4 scope  
sweep: H-4: PASS · banned 2 at 0 live · required 2/2 present (via supersession by I-7)

**91. r3 · H-11 · 1. The chain · STRENGTHENS**  
before: The cargo section's chart is the offset chart by definition.  
after: The cargo section's points and line are the offset chart's by definition; its carrier is its own copy, beside Part VIII's.  
reason: H-11 (COSMETIC): the cargo section's carrier is its own copy; conjugation facts are proved on Part VIII's copy and hold by com… → carrier provenance stated; sweep H-11 PASS  
sweep: H-11: PASS · banned 2 at 0 live · required 1/1 present

**92. r3 · H-12 · ledger row 1 · MIXED**  
before: The block is a property of the interface and the record, not a claim about ZFC; toward refutation the channel a foundation keeps is a finite computation that certifies a zero off the line, F-Computed; toward proof, every sound theory that proves a sentence reading as the line at a world lands on le…  
after: The block is a property of the interface and the record, not a claim about ZFC; toward refutation the channel a foundation keeps is a finite computation that certifies a zero off the line, F-Computed; toward proof, on Part II's chart every sound theory that proves a sentence reading as the line at…  
reason: the record is strengthened and the claim is narrowed: H-12: scoped to Part II's chart; sweep H-12 PASS  
sweep: H-12: PASS · banned 1 at 0 live · required 1/1 present

**93. r3 · H-16 · ledger row 1 · MIXED**  
before: Listing any members with their mirrors, the real parts balance on the line: the centre of every reflection-closed family is the line.  
after: Listing any members with their mirrors, the real parts balance on the line: the centre of every nonempty finite reflection-closed family is the line.  
reason: the record is strengthened and the claim is narrowed: H-16: scoped to nonempty finite families; sweep H-16 PASS  
sweep: H-16: PASS · banned 1 at 0 live · required 1/1 present

**94. r3 · H-3 · ledger row 6 · STRENGTHENS**  
before: These theorems are on Part II's chart x = 2 Re s, where the open strip is the line itself; a zero of the open strip off the line by a rational margin ε, 0 < Re s < 1 and \|Re s − 1/2\| > ε > 0, is placed off the line of the offset chart at every resolution beyond 1/(2ε) by the reader's rule, which…  
after: The first two are on Part II's chart x = 2 Re s, where the open strip is the line itself, and the second two on the offset chart; a zero of the open strip off the line by a rational margin ε, 0 < Re s < 1 and \|Re s − 1/2\| > ε > 0, is placed off the line of the offset chart at every resolution bey…  
reason: H-3 (STRUCTURAL): Level 6 placed all four theorems on Part II's chart; two are offset-chart theorems, and the weakest-premise t… → chart split stated; weakest-premise citation replaced by Level 9 on the offset chart; swe…  
sweep: H-3: PASS · banned 2 at 0 live · required 2/2 present

**95. r3 · H-18 · ledger row 10 · MIXED**  
before: | 10 | Cargo: compute delivered.  
after: | 10 | Cargo: compute delivered, in the author's posit.  
reason: the record is strengthened and the claim is narrowed: H-18: scoped: 'in the author's posit' at every body site; title held verbatim under the Title Lock, the posit grade printed beside it in the abstract; F-2…  
sweep: H-18: PASS · banned 3 at 0 live · required 2/2 present

**96. r3 · H-11, H-6 · ledger row 10 · MIXED**  
before: `stage2_optional_corroboration` [propext, Classical.choice, Quot.sound], `classical_rh_from_physico_formal_closure` none, eight inputs | The apparatus carrier has two constructors, a self-conjugate state at a height and a member of a conjugate pair of magnitude m + 1 at a height with the sign that…  
after: `stage2_optional_corroboration` [propext, Classical.choice, Quot.sound], `classical_rh_from_physico_formal_closure` none, eight inputs | The cargo section's carrier has two constructors, a self-conjugate state at a height and a member of a conjugate pair of magnitude m + 1 at a height with a sign;…  
reason: the record is strengthened and the claim is narrowed: H-6: scoped: the field is landing on annihilation, a forgetting exactly when the state is a pair member; the posit reads the run of record as a forgetting…  
sweep: H-11: PASS · banned 2 at 0 live · required 1/1 present · H-6: PASS · banned 3 at 0 live · required 2/2 present (via supersession by I-1)

**97. r3 · H-18 · 3. The single bind · MIXED**  
before: 10  CARGO              compute delivered               computation_enacts_stage1, stage1_closes  
after: 10  CARGO              compute delivered (posit)       computation_enacts_stage1, stage1_closes  
reason: the record is strengthened and the claim is narrowed: H-18: scoped: 'in the author's posit' at every body site; title held verbatim under the Title Lock, the posit grade printed beside it in the abstract; F-2…  
sweep: H-18: PASS · banned 3 at 0 live · required 2/2 present

**98. r3 · H-9 · 3. The single bind · STRENGTHENS**  
before: The event of the cargo and the run of Part IV-b are two types, and no term of the seed identifies them or runs from either to the act; the line a reader draws from the run to the act is the premise of Section 4, printed as such.  
after: The event of the cargo and the run of Part IV-b are two types, and no term of the seed identifies them or runs from either to an act at the configurations where the zeros of ζ are read; the line a reader draws from the run to the act is the premise of Section 4, printed as such.  
reason: H-9 (COSMETIC): 'no arrow from Stage 1 to the act' is false at the empty configuration; true only for an act at the prescribe… → restricted to an act at the configurations R; sweep H-9 PASS  
sweep: H-9: PASS · banned 2 at 0 live · required 1/1 present

**99. r3 · H-18 · 3. The single bind · MIXED**  
before: Level 10 delivers the cargo by compute and prints the supply: every verification event enacts a closed Stage 1, by theorem; a run forces no value, by theorem; from the act the classical sentence follows under the reader's rule, by theorem; and the act is the one formal premise, which the author's p…  
after: Level 10 delivers the cargo, compute in the author's posit, and prints the supply: every verification event enacts a closed Stage 1, by theorem; a run forces no value, by theorem; from the act the classical sentence follows under the reader's rule, by theorem; and the act is the one formal premise,…  
reason: the record is strengthened and the claim is narrowed: H-18: scoped: 'in the author's posit' at every body site; title held verbatim under the Title Lock, the posit grade printed beside it in the abstract; F-2…  
sweep: H-18: PASS · banned 3 at 0 live · required 2/2 present

**100. r3 · H-10 · 4. The fixed stance · STRENGTHENS**  
before: `the_run_witnesses_a_run` proves that a run that ran exists, `the_run_does_not_force_the_value` proves that it forces no value at every closed configuration, as `the_deed_forces_nothing` proves of every fact that holds whatever the configuration, and `force_witness_closure` binds a deed of the subs…  
after: `the_run_witnesses_a_run` turns a run that ran into the existence of one, `the_run_does_not_force_the_value` proves that it forces no value at every closed configuration, as `the_deed_forces_nothing` proves of every fact that holds whatever the configuration, and `force_witness_closure` binds a dee…  
reason: H-10 (COSMETIC): the_run_witnesses_a_run is existential introduction from a supplied run, not an existence proof → sweep H-10 PASS  
sweep: H-10: PASS · banned 1 at 0 live · required 1/1 present

**101. r3 · H-2 · 4. The fixed stance · STRENGTHENS**  
before: At every resolution, `classical_rh_from_the_act_every` takes the reader's rule `h_read`, the classical sentence read as the value of the configurations R n at which the zeros of ζ are read at every resolution n, and an act at every resolution with those configurations as its zero sets, and returns…  
after: At every resolution, `classical_rh_from_the_act_every` takes the reader's rule `h_read`, the classical sentence read as the value of the configurations R n at which the zeros of ζ are read at every resolution n ≥ 1, the bound printed in its type, and an act at every resolution with those configurat…  
reason: H-2 (STRUCTURAL): Box 1 quantified the reading over every n including 0, where readAt places every zero off the line and the em… → reading restated as forall n, 1 <= n -> Value (R n), the bound printed in the type; recom…  
sweep: H-2: PASS · banned 1 at 0 live · required 2/2 present

**102. r3 · H-3, H-4 · 4. The fixed stance · MIXED**  
before: The reading is an identification of statements. The act is the supply, the one premise on the value: where the configurations are closed, an act at every resolution exists exactly where the value holds at every resolution (`the_act_at_every_resolution`, first conjunct), so the premise is the value…  
after: At every resolution n ≥ 1 the reading is an identification of statements; at one configuration it carries that resolution's content and is a premise on the value beside the act, which is why the reading of record is the first. The act is the supply, the one premise on the value: where the configura…  
reason: the record is strengthened and the claim is narrowed: H-4: scoped: at every n >= 1 an identification, at one configuration a premise beside the act; Section 1 names both differences; sweep H-4 PASS  
sweep: H-3: PASS · banned 2 at 0 live · required 2/2 present · H-4: PASS · banned 2 at 0 live · required 2/2 present (via supersession by I-7)

**103. r3 · H-2 · 4. The fixed stance · STRENGTHENS**  
before: ClassicalRH ↔ ∀ n, Value (R n)) (Z :  
after: ClassicalRH ↔ ∀ n, 1 ≤ n → Value (R n)) (Z :  
reason: H-2 (STRUCTURAL): Box 1 quantified the reading over every n including 0, where readAt places every zero off the line and the em… → reading restated as forall n, 1 <= n -> Value (R n), the bound printed in the type; recom…  
sweep: H-2: PASS · banned 1 at 0 live · required 2/2 present

**104. r3 · H-2 · 4. The fixed stance · STRENGTHENS**  
before: h_read.mpr (fun n => hZ ▸ value_from_the_act (Z.atRes n))  
after: h_read.mpr (fun n _ => hZ ▸ value_from_the_act (Z.atRes n))  
reason: H-2 (STRUCTURAL): Box 1 quantified the reading over every n including 0, where readAt places every zero off the line and the em… → reading restated as forall n, 1 <= n -> Value (R n), the bound printed in the type; recom… · attribution: Box 1 proof term follows the H-2 bound in the type  
sweep: H-2: PASS · banned 1 at 0 live · required 2/2 present

**105. r3 · H-8 · 4. The fixed stance · STRENGTHENS**  
before: (nothing)  
after: 'Charts.ActualZerosEvery.atRes' does not depend on any axioms  
reason: H-8 (COSMETIC): atRes cone printed in the ledger fell outside every provenance class the front note lists → atRes print added to Box 1 and named in the front note; sweep H-8 PASS  
sweep: H-8: PASS · banned 1 at 0 live · required 1/1 present

**106. r3 · H-9 · 4. The fixed stance · STRENGTHENS**  
before: The conditionals' inputs are the reading and the act; no verification event and no run appears in their signatures, and no arrow runs from Stage 1 to the act.}\par  
after: The conditionals' inputs are the reading and the act; no verification event and no run appears in their signatures, and no arrow runs from Stage 1 to an act at the configurations R.}\par  
reason: H-9 (COSMETIC): 'no arrow from Stage 1 to the act' is false at the empty configuration; true only for an act at the prescribe… → restricted to an act at the configurations R; sweep H-9 PASS  
sweep: H-9: PASS · banned 2 at 0 live · required 1/1 present

**107. r3 · H-13 · 4. The fixed stance · STRENGTHENS**  
before: Read at every resolution n ≥ 1, resolution zero being no reading and the family's term there the empty configuration by the seed's stipulation (the docstring of `ActualZerosEvery`), the reading is an identification of statements; no theorem of the interface supplies it (`the_reading_is_keyed`), so…  
after: Read at every resolution n ≥ 1, resolution zero being no reading and the family's term there the empty configuration by the seed's stipulation (the docstring of `ActualZerosEvery`), the reading is an identification of statements; the interface proves no such identification as a law (`the_reading_is…  
reason: H-13 (COSMETIC): the_reading_is_keyed proves the identification is not a law, not that a specific identification is underivable → sweep H-13 PASS  
sweep: H-13: PASS · banned 1 at 0 live · required 1/1 present

**108. r3 · H-17 · 4. The fixed stance · STRENGTHENS**  
before: The Formal Master (reference 7) carries the seed's theorems under a Mathlib import, their proofs adjusted to that environment, and states the reading over ℂ as a theorem against Mathlib's own definition, `h_read_proved`, `RiemannHypothesis ↔ Value ZetaZeros`, where the configuration is the zero set…  
after: The Formal Master (reference 7) carries the seed's theorems under a Mathlib import, their proofs adjusted to that environment, and states the reading over ℂ as a theorem against Mathlib's own definition, `BoundChainMathlib.h_read_proved` (Formal Master), `RiemannHypothesis ↔ Value ZetaZeros`, where…  
reason: H-17 (COSMETIC): bare Formal Master names resolve to different seed theorems → qualified names; G-14 required phrase superseded and recorded; sweep H-17 PASS  
sweep: H-17: PASS · banned 3 at 0 live · required 2/2 present

**109. r3 · H-17 · 4. The fixed stance · STRENGTHENS**  
before: `transport_zeta` proves that carrying least erasure from the record `Rec M` back to `M` is the value of `M`, so the record has least erasure by construction (`record_has_least_erasure`, the Formal Master's, Part X) and the zeros have it exactly when the field is supplied. Its cones are its own and…  
after: `BoundChainMathlib.transport_zeta` (Formal Master) proves that carrying least erasure from the record `Rec M` back to `M` is the value of `M`, so the record has least erasure by construction (`BoundChainMathlib.record_has_least_erasure`, Formal Master, Part X) and the zeros have it exactly when the…  
reason: H-17 (COSMETIC): bare Formal Master names resolve to different seed theorems → qualified names; G-14 required phrase superseded and recorded; sweep H-17 PASS  
sweep: H-17: PASS · banned 3 at 0 live · required 2/2 present

**110. r3 · H-5 · 4. The fixed stance · STRENGTHENS**  
before: F-Bridge: the refusal by name of the supply, that the act of the run is the field at the configurations where the zeros of ζ are read, or of the reading; it leaves the cargo's theorems standing, since they hold of every event with an empty cone, and holds the value open, the position Level 1 proves…  
after: F-Bridge: the refusal by name of the act at the configurations where the zeros of ζ are read, or of the reading; refusing only the author's posit about the act's source, while granting an act, is no exit, since Box 1 needs no run; it leaves the cargo's theorems standing, since they hold of every ev…  
reason: H-5 (STRUCTURAL): F-Bridge named refusal of the posit about the act's source as an exit, but Box 1 needs no run, so that refusa… → F-Bridge restated as refusal of the act at the read configurations or of the reading; pos…  
sweep: H-5: PASS · banned 2 at 0 live · required 2/2 present (via supersession by I-9)

**111. r3 · H-14 · 5. The corroboration, optional and fenced · STRENGTHENS**  
before: `bridge_from_realization` states the bridge as one implication; its proof takes the step from a failed universal to its witness by `Classical.em`, and its cone prints [propext, Classical.choice, Quot.sound], though the predicates it decides are decidable and the step admits a constructive proof. Th…  
after: `bridge_from_realization` states the bridge as one implication; its proof takes the step from a failed universal to its witness by `Classical.byContradiction`, and its cone prints [propext, Classical.choice, Quot.sound], though the predicates it decides are decidable and the step admits a construct…  
reason: H-14 (COSMETIC): bridge_from_realization uses Classical.byContradiction, not Classical.em → sweep H-14 PASS  
sweep: H-14: PASS · banned 2 at 0 live · required 1/1 present

**112. r3 · H-6 · 6. The witness, in the author's register · MIXED**  
before: And every act that reads the act, a keystroke, a compile, a check by any substrate, is read as one more verification event, a forgetting at one floor and a closed Stage 1 enacted (`computation_enacts_stage1`, `stage1_closes`), the cargo delivered again; it witnesses the run and adds no warrant to t…  
after: And every act that reads the act, a keystroke, a compile, a check by any substrate, is read as one more verification event, a move to annihilation at one floor and a closed Stage 1 enacted (`computation_enacts_stage1`, `stage1_closes`), the cargo delivered again; it witnesses the run and adds no wa…  
reason: the record is strengthened and the claim is narrowed: H-6: scoped: the field is landing on annihilation, a forgetting exactly when the state is a pair member; the posit reads the run of record as a forgetting…  
sweep: H-6: PASS · banned 3 at 0 live · required 2/2 present (via supersession by I-1)

**113. r3 · H-17 · 7. The default reading, answered · STRENGTHENS**  
before: The Formal Master, quoted and not re-run here, states the same boundary over ℂ: the record has least erasure by construction, and carrying it back to the zeros is the value itself (`transport_zeta`).  
after: The Formal Master, quoted and not re-run here, states the same boundary over ℂ: the record has least erasure by construction, and carrying it back to the zeros is the value itself (`BoundChainMathlib.transport_zeta`).  
reason: H-17 (COSMETIC): bare Formal Master names resolve to different seed theorems → qualified names; G-14 required phrase superseded and recorded; sweep H-17 PASS  
sweep: H-17: PASS · banned 3 at 0 live · required 2/2 present

**114. r3 · H-5 · 7. The default reading, answered · STRENGTHENS**  
before: **"A reader can refuse the supply and deny the hypothesis without contradiction."** A reader can, and the paper names what that reader has asserted: the act of the run is not the field at the configurations where the zeros of ζ are read.  
after: **"A reader can refuse the supply and deny the hypothesis without contradiction."** A reader can, and the paper names what that reader has asserted: no act stands at the configurations where the zeros of ζ are read, or the reading fails.  
reason: H-5 (STRUCTURAL): F-Bridge named refusal of the posit about the act's source as an exit, but Box 1 needs no run, so that refusa… → F-Bridge restated as refusal of the act at the read configurations or of the reading; pos…  
sweep: H-5: PASS · banned 2 at 0 live · required 2/2 present (via supersession by I-9)

**115. r3 · H-7 · 7. The default reading, answered · STRENGTHENS**  
before: **"The ten levels are not a verified dependency chain; the capstone's proof does not invoke Levels 1 to 9."** Correct about the proof terms, and said in Section 3: the proofs of Level 10 are three, the cargo's on the cargo section, the run's on Part IV-b, and Box 1's on Parts III, V-b and VII.  
after: **"The ten levels are not a verified dependency chain; the capstone's proof does not invoke Levels 1 to 9."** Correct about the proof terms, and said in Section 3: the proofs of Level 10 are three, the cargo's on the cargo section, the run's on Part IV-b, and Box 1's conditionals on Parts III, V-b…  
reason: H-7 (COSMETIC): Section 7 placed all of Box 1's proofs on Parts III, V-b and VII; the binding stands on the cargo section → sweep H-7 PASS  
sweep: H-7: PASS · banned 1 at 0 live · required 1/1 present


### Version r3j (joint repairs of the round-3 end-to-end read, filed in round 4) · round 4

*Interaction note (end-to-end read, joints), from the round block:* Box 1 grows to six compositions, compiled against the seed, cones diffed against the printed lines: MATCH; 15 sweep specs, pre PASS on r3/r3j, post PASS on r4; 71 specs re-verified PASS with supersessions F-4, H-4, H-5, I-3 recorded; checker RESULT PASS (143 names); spine lock VERIFY PASS (C1 FORTIFIED precision); end-to-end read of abstract, front note, Notation, Section 1, Level 10 row, Section 3, Section 4 capstone, reading, boundary, exits, Section 7; two joints repaired in-round (conditional's signature count, the one-content conditions)

**116. r3j · I-1 · abstract · STRENGTHENS**  
before: Level 10 is the cargo, delivered by compute in the author's posit: every verification event carries as its own field that it lands on its state's annihilation, a forgetting when the state is a pair member, and enacts a closed Stage 1 with an empty cone, and the run that compiles the seed is posited…  
after: Level 10 is the cargo, delivered by compute in the author's posit: every verification event carries as its own field that it lands on its state's annihilation, the seed's forgetting, which loses a label when the state is a pair member, and enacts a closed Stage 1 with an empty cone, and the run tha…  
reason: I-1 (STRUCTURAL): joint at the r3 end-to-end read: the seed names every landing a forgetting, so 'a forgetting exactly when the… → forgetting kept as the seed's name for the landing; label loss stated separately; sweep I…  
sweep: I-1: PASS · banned 5 at 0 live · required 2/2 present

**117. r3j · I-4 · abstract · STRENGTHENS**  
before: The supply is printed as the one premise on the value, at full force, and the reading beside it as the identification it is.  
after: The supply is printed as the one premise on the value, at full force, and the reading at every resolution beside it as the identification it is.  
reason: I-4 (COSMETIC): joint at the r3 end-to-end read: the abstract called the reading an identification without its resolution → sweep I-4 PASS  
sweep: I-4: PASS · banned 1 at 0 live · required 1/1 present

**118. r3j · I-1 · 1. The chain · STRENGTHENS**  
before: A verification event is a move of the apparatus carrier from a state to its annihilation: a pair member lands on the neutral state at its height with its magnitude and sign kept nowhere, and a neutral state stays;  
after: A verification event is a move of the apparatus carrier from a state to its annihilation: a pair member lands on the neutral state at its height with its magnitude and sign kept nowhere, and a neutral state stays. The seed names that landing the event's forgetting (`h_forget`, `local_computation_is…  
reason: I-1 (STRUCTURAL): joint at the r3 end-to-end read: the seed names every landing a forgetting, so 'a forgetting exactly when the… → forgetting kept as the seed's name for the landing; label loss stated separately; sweep I…  
sweep: I-1: PASS · banned 5 at 0 live · required 2/2 present

**119. r3j · I-1 · ledger row 10 · STRENGTHENS**  
before: A verification event is a move of the carrier from a state to its annihilation, carried as its own field `h_forget`, a forgetting exactly when the state is a pair member; a neutral event satisfies every cargo theorem and forgets nothing, so the posit reads the run of record as a forgetting.  
after: A verification event is a move of the carrier from a state to its annihilation, carried as its own field `h_forget`, its forgetting in the seed's name, which loses a label exactly when the state is a pair member; a neutral event satisfies every cargo theorem and loses nothing, so the posit reads th…  
reason: I-1 (STRUCTURAL): joint at the r3 end-to-end read: the seed names every landing a forgetting, so 'a forgetting exactly when the… → forgetting kept as the seed's name for the landing; label loss stated separately; sweep I…  
sweep: I-1: PASS · banned 5 at 0 live · required 2/2 present

**120. r3j · I-5 · ledger row 10 · STRENGTHENS**  
before: No term of type `Stage1 → ClassicalRH` exists in the seed and none is claimed: the cargo's theorems hold of every event at theorem grade, the act is the one premise on the value, and the author's posit names the run of record, as such an event, its source. | THEOREM on the cargo's statements, empty…  
after: No term of type `Stage1 → ClassicalRH` exists in the seed and none is claimed: the cargo's theorems hold of every event at theorem grade, the act is the one premise on the value under the reading of record, and the author's posit names the run of record, as such an event, its source. | THEOREM on t…  
reason: I-5 (COSMETIC): joint at the r3 end-to-end read: 'the one premise on the value' collided with the one-configuration reading a… → scoped to the reading of record; sweep I-5 PASS  
sweep: I-5: PASS · banned 2 at 0 live · required 1/1 present

**121. r3j · I-2 · 4. The fixed stance · STRENGTHENS**  
before: Toward proof, every sound theory whose proved sentence reads as the line lands on least erasure (`ladder_proof_lands_on_least_erasure`); the seed decides no foundation's route at ζ, and Level 9 types whatever such a route proves: a supply of the one field.  
after: Toward proof, on Part II's chart every sound theory whose proved sentence reads as the line at a world lands on least erasure there (`ladder_proof_lands_on_least_erasure`); the seed decides no foundation's route at ζ, and Level 9 types whatever such a route proves: a supply of the one field.  
reason: I-2 (COSMETIC): joint at the r3 end-to-end read: Section 4's second instance of the ladder theorem lacked its chart → sweep I-2 PASS  
sweep: I-2: PASS · banned 1 at 0 live · required 1/1 present

**122. r3j · I-11, I-5, I-6 · 4. The fixed stance · STRENGTHENS**  
before: The act is the supply, the one premise on the value: where the configurations are closed and the term at resolution zero is empty, an act at every resolution exists exactly where the value holds at every resolution (`the_act_at_every_resolution`, first conjunct), so the premise is the value package…  
after: The act is the supply, the one premise on the value under the reading of record: where the configurations are closed and the term at resolution zero is empty, an act at every resolution exists exactly where the value holds at every resolution (`the_act_at_every_resolution`, first conjunct), so the…  
reason: I-11 (STRUCTURAL): R8: Level 9's theorem concerns one closed configuration and ActualZeros, cited for the every-resolution premi… → cited per resolution, the family assembled by the packaging composition; sweep I-11 PASS; I-5 (COSMETIC): joint at the r3 end-to-end read: 'the one premise on the value' collided with the one-configuration reading a… → scoped to the reading of record; sweep I-5 PASS; I-6 (STRUCTURAL): R1: the act ranges over n = 0 while the reading is bounded n >= 1; the empty term at zero stood in a docstrin… → Box 1 adds the_act_every_is_the_value_packaged with hR and h0 in its type, [propext, Quot…  
sweep: I-11: PASS · banned 1 at 0 live · required 1/1 present · I-5: PASS · banned 2 at 0 live · required 1/1 present · I-6: PASS · banned 2 at 0 live · required 4/4 present (via supersession by K-2)

**123. r3j · I-3 · 4. The fixed stance · STRENGTHENS**  
before: Two things stand outside the theorems: the reading, an identification of statements and an input of every conditional; and the act at the configurations where the zeros of ζ are read, the premise on the value, an input of every conditional.  
after: Two things stand outside the theorems: the reading, an input of every conditional, an identification of statements at every resolution n ≥ 1 and a premise on the value at one configuration; and the act at the configurations where the zeros of ζ are read, the premise on the value, an input of every…  
reason: I-3 (STRUCTURAL): joint at the r3 end-to-end read: the boundary called the reading an identification for every conditional → sweep I-3 PASS; its required phrase later superseded by I-7  
sweep: I-3: PASS · banned 1 at 0 live · required 1/1 present (via supersession by I-7)

**124. r3j · I-1 · 7. The default reading, answered · STRENGTHENS**  
before: The cargo proves that every verification event moves the carrier to its annihilation, a forgetting when the state is a pair member, and enacts a closed Stage 1 with the floor witnessed; that the run of record is such an event is the author's posit; no term of type `Stage1 → ClassicalRH` exists in t…  
after: The cargo proves that every verification event moves the carrier to its annihilation, losing a label when the state is a pair member, and enacts a closed Stage 1 with the floor witnessed; that the run of record is such an event is the author's posit; no term of type `Stage1 → ClassicalRH` exists in…  
reason: I-1 (STRUCTURAL): joint at the r3 end-to-end read: the seed names every landing a forgetting, so 'a forgetting exactly when the… → forgetting kept as the seed's name for the landing; label loss stated separately; sweep I…  
sweep: I-1: PASS · banned 5 at 0 live · required 2/2 present


### Version r4 · round 4

*Interaction note (end-to-end read, joints), from the round block:* Box 1 grows to six compositions, compiled against the seed, cones diffed against the printed lines: MATCH; 15 sweep specs, pre PASS on r3/r3j, post PASS on r4; 71 specs re-verified PASS with supersessions F-4, H-4, H-5, I-3 recorded; checker RESULT PASS (143 names); spine lock VERIFY PASS (C1 FORTIFIED precision); end-to-end read of abstract, front note, Notation, Section 1, Level 10 row, Section 3, Section 4 capstone, reading, boundary, exits, Section 7; two joints repaired in-round (conditional's signature count, the one-content conditions)

**125. r4 · I-10 · abstract · STRENGTHENS**  
before: Level 1 is the ground floor, the theorem-grade block of the unconditional route: no premise shared by every reflection-closed configuration, the root included, and no reading of the record forces the value, and every premise that does force it is the value or strictly stronger.  
after: Level 1 is the ground floor, the theorem-grade block of the unconditional route: no premise shared by every reflection-closed configuration, the root included, forces the value, no reading of the record decides it, and every premise that does force it is the value or strictly stronger.  
reason: I-10 (COSMETIC): R6: 'no reading of the record forces the value' fails vacuously at the empty configuration under the seed's F… → decides, as the theorem states; spine lock C1 FORTIFIED (precision); sweep I-10 PASS  
sweep: I-10: PASS · banned 1 at 0 live · required 1/1 present

**126. r4 · I-6 · abstract · STRENGTHENS**  
before: A run, like every fact that holds whatever the configuration, forces no value, so its flag is no proof of the value and the field is the act's, as Level 9 types every proof; from the act, at every resolution n ≥ 1 at which the zeros of ζ are read, the classical sentence follows under the reader's r…  
after: A run, like every fact that holds whatever the configuration, forces no value, so its flag is no proof of the value and the field is the act's, as Level 9 types every proof; from the act, at every resolution n ≥ 1 at which the zeros of ζ are read, the classical sentence follows under the reader's r…  
reason: I-6 (STRUCTURAL): R1: the act ranges over n = 0 while the reading is bounded n >= 1; the empty term at zero stood in a docstrin… → Box 1 adds the_act_every_is_the_value_packaged with hR and h0 in its type, [propext, Quot…  
sweep: I-6: PASS · banned 2 at 0 live · required 4/4 present (via supersession by K-2)

**127. r4 · I-6, I-7, I-9 · front note · STRENGTHENS**  
before: \* Every theorem named below is in the seed of Appendix A, save the names marked as the Formal Master's or reference 8's where they are cited, the three compositions of Box 1, and Lean's own `Classical.em` and `Classical.byContradiction`; the seed is edition 2.0.5, sha256 a82ef4f0ad6ceb43 a2d3cc964…  
after: \* Every theorem named below is in the seed of Appendix A, save the names marked as the Formal Master's or reference 8's where they are cited, the six compositions of Box 1, and Lean's own `Classical.em` and `Classical.byContradiction`; the seed is edition 2.0.5, sha256 a82ef4f0ad6ceb43 a2d3cc964b1…  
reason: I-6 (STRUCTURAL): R1: the act ranges over n = 0 while the reading is bounded n >= 1; the empty term at zero stood in a docstrin… → Box 1 adds the_act_every_is_the_value_packaged with hR and h0 in its type, [propext, Quot…; I-7 (STRUCTURAL): R2: one configuration was made the discriminator of the reading's content; the discriminator is one resolutio… → Box 1 adds value_collected (none); Section 1, Section 4 and the boundary restated; the ph…; I-9 (STRUCTURAL): R4: with the reading granted, asserting that no act stands is the denial of the classical sentence, so F-Brid… → Box 1 adds refusing_the_act_is_the_denial, [propext, Quot.sound]; F-Bridge and Section 7… · attribution: count follows the three compositions added under I-6, I-7 and I-9  
sweep: I-6: PASS · banned 2 at 0 live · required 4/4 present (via supersession by K-2) · I-7: PASS · banned 4 at 0 live · required 3/3 present · I-9: PASS · banned 2 at 0 live · required 2/2 present

**128. r4 · I-12, I-13 · front note · MIXED**  
before: (nothing)  
after: The seed's docstrings are its author's commentary and carry no warrant; where one says more than its type, as `ActualZerosEvery`'s that the zero set of ζ read at every resolution is such a family and `VerificationEvent`'s that one label is forgotten, the type governs and this paper states the type.  
reason: the record is strengthened and the claim is narrowed: I-12: scoped: the seed stays byte-fixed; the front note states that docstrings carry no warrant and the type governs; sweep I-12 PASS; I-13: scoped: the docstring is no longer cited; the empty term at zero stands as h0 in a signature; front note on docstrings; sweep I-13 PASS  
sweep: I-12: PASS · banned 0 at 0 live · required 2/2 present · I-13: PASS · banned 1 at 0 live · required 1/1 present

**129. r4 · I-8 · 1. The chain · MIXED**  
before: The editions differ at Level 10, in what supplies the one field that Level 9 proves every proof must supply and in the reading through which the classical sentence is concluded.  
after: The editions differ at Level 10, in what supplies the field that Level 9 proves every proof must supply and in the form of the reading through which the classical sentence is concluded.  
reason: the record is strengthened and the claim is narrowed: I-8: scoped: two structures, one content where Zζ collects the family's resolutions, closed with the term at zero empty; twin framing kept; sweep I-8 PASS  
sweep: I-8: PASS · banned 3 at 0 live · required 2/2 present (via supersession by L-3)

**130. r4 · I-14 · 1. The chain · MIXED**  
before: This formal edition is written for the reader who refuses physics as arbiter of a mathematical sentence: the supply is the act, and its cargo is the compute that runs the seed, closed on its own fields with nothing measured.  
after: This formal edition is written for the reader who refuses physics as arbiter of a mathematical sentence: the supply is the act, and its cargo, in the author's posit, is the compute that runs the seed, closed on its own fields with nothing measured.  
reason: the record is strengthened and the claim is narrowed: I-14: scoped: Section 1 carries 'in the author's posit'; the subtitle is held verbatim under the Title Lock, the posit grade printed in the abstract's Leve…  
sweep: I-14: PASS · banned 1 at 0 live · required 1/1 present

**131. r4 · I-6, I-7, I-8 · 1. The chain · MIXED**  
before: The two conditionals are theorem grade and conclude the classical sentence about one object, the zeros of ζ read onto the offset chart: the physical edition reads them at one configuration, a reading that carries that resolution's content and so is a premise on the value beside its supply, and this…  
after: The two conditionals are theorem grade and conclude the classical sentence about one object, the zeros of ζ read onto the offset chart under one reader's rule: the physical edition reads them at one configuration Zζ, this edition as a family over every resolution n ≥ 1. What carries content is a si…  
reason: the record is strengthened and the claim is narrowed: I-8: scoped: two structures, one content where Zζ collects the family's resolutions, closed with the term at zero empty; twin framing kept; sweep I-8 PASS  
sweep: I-6: PASS · banned 2 at 0 live · required 4/4 present (via supersession by K-2) · I-7: PASS · banned 4 at 0 live · required 3/3 present · I-8: PASS · banned 3 at 0 live · required 2/2 present (via supersession by L-3)

**132. r4 · I-6, I-7, I-9 · ledger row 10 · STRENGTHENS**  
before: `classical_rh_from_the_act_every` none, from `value_from_the_act` (Part III) none and `ActualZerosEvery.atRes` (Part V-b) none; at one configuration `classical_rh_from_the_act` none, from `classical_rh_iff_le_of_reading` none and `supply_is_the_premise` none · Optional corroboration (Section 5):  
after: `classical_rh_from_the_act_every` none, from `value_from_the_act` (Part III) none and `ActualZerosEvery.atRes` (Part V-b) none; the act packaged, `the_act_every_is_the_value_packaged` [propext, Quot.sound], from `the_act_at_every_resolution` (Part V-b) [propext, Quot.sound], and its refusal `refusi…  
reason: I-6 (STRUCTURAL): R1: the act ranges over n = 0 while the reading is bounded n >= 1; the empty term at zero stood in a docstrin… → Box 1 adds the_act_every_is_the_value_packaged with hR and h0 in its type, [propext, Quot…; I-7 (STRUCTURAL): R2: one configuration was made the discriminator of the reading's content; the discriminator is one resolutio… → Box 1 adds value_collected (none); Section 1, Section 4 and the boundary restated; the ph…; I-9 (STRUCTURAL): R4: with the reading granted, asserting that no act stands is the denial of the classical sentence, so F-Brid… → Box 1 adds refusing_the_act_is_the_denial, [propext, Quot.sound]; F-Bridge and Section 7…  
sweep: I-6: PASS · banned 2 at 0 live · required 4/4 present (via supersession by K-2) · I-7: PASS · banned 4 at 0 live · required 3/3 present · I-9: PASS · banned 2 at 0 live · required 2/2 present

**133. r4 · I-6 · ledger row 10 · STRENGTHENS**  
before: From an act at every resolution at which the zeros of ζ are read, the classical sentence follows under the reader's rule with an empty cone.  
after: From an act at every resolution at which the zeros of ζ are read, the classical sentence follows under the reader's rule with an empty cone; where those configurations are closed and the term at resolution zero is empty, both hypotheses of its type, the act is exactly the value at every resolution…  
reason: I-6 (STRUCTURAL): R1: the act ranges over n = 0 while the reading is bounded n >= 1; the empty term at zero stood in a docstrin… → Box 1 adds the_act_every_is_the_value_packaged with hR and h0 in its type, [propext, Quot…  
sweep: I-6: PASS · banned 2 at 0 live · required 4/4 present (via supersession by K-2)

**134. r4 · I-11, I-6 · 3. The single bind · STRENGTHENS**  
before: The proof terms of Level 10 are three, and they do not compose into one term: the cargo's use the cargo section alone; the run's use Part IV-b; the conditional of Box 1 at every resolution uses Parts III and V-b and no theorem the ledger names at Levels 1 to 9, and at one configuration it uses Part…  
after: The proof terms of Level 10 are three, and they do not compose into one term: the cargo's use the cargo section alone; the run's use Part IV-b; the conditional of Box 1 at every resolution uses Parts III and V-b, and its packaging Part V-b's `the_act_at_every_resolution`, and no other theorem the l…  
reason: I-11 (STRUCTURAL): R8: Level 9's theorem concerns one closed configuration and ActualZeros, cited for the every-resolution premi… → cited per resolution, the family assembled by the packaging composition; sweep I-11 PASS; I-6 (STRUCTURAL): R1: the act ranges over n = 0 while the reading is bounded n >= 1; the empty term at zero stood in a docstrin… → Box 1 adds the_act_every_is_the_value_packaged with hR and h0 in its type, [propext, Quot… · attribution: Section 3 names the packaging's dependency, I-6 and I-11  
sweep: I-11: PASS · banned 1 at 0 live · required 1/1 present · I-6: PASS · banned 2 at 0 live · required 4/4 present (via supersession by K-2)

**135. r4 · I-10 · 4. The fixed stance · STRENGTHENS**  
before: Whether the value is a theorem of ZFC is not what the chain decides, and the chain says why: within the formalized interface no premise shared by every reflection-closed configuration, the root included, and no reading of the record forces the value, and every premise that does force it is the valu…  
after: Whether the value is a theorem of ZFC is not what the chain decides, and the chain says why: within the formalized interface no premise shared by every reflection-closed configuration, the root included, forces the value, no reading of the record decides it, and every premise that does force it is…  
reason: I-10 (COSMETIC): R6: 'no reading of the record forces the value' fails vacuously at the empty configuration under the seed's F… → decides, as the theorem states; spine lock C1 FORTIFIED (precision); sweep I-10 PASS  
sweep: I-10: PASS · banned 1 at 0 live · required 1/1 present

**136. r4 · I-6, I-7, I-9 · 4. The fixed stance · STRENGTHENS**  
before: Box 1 prints three compositions, compiled against the seed with empty cones; two carry the conditional.  
after: Box 1 prints six compositions, compiled against the seed; two carry the conditional, with empty cones; two package the act and its refusal, at [propext, Quot.sound]; one collects every resolution in one configuration, and one binds the cargo, with empty cones.  
reason: I-6 (STRUCTURAL): R1: the act ranges over n = 0 while the reading is bounded n >= 1; the empty term at zero stood in a docstrin… → Box 1 adds the_act_every_is_the_value_packaged with hR and h0 in its type, [propext, Quot…; I-7 (STRUCTURAL): R2: one configuration was made the discriminator of the reading's content; the discriminator is one resolutio… → Box 1 adds value_collected (none); Section 1, Section 4 and the boundary restated; the ph…; I-9 (STRUCTURAL): R4: with the reading granted, asserting that no act stands is the denial of the classical sentence, so F-Brid… → Box 1 adds refusing_the_act_is_the_denial, [propext, Quot.sound]; F-Bridge and Section 7… · attribution: count and grades follow the three compositions added under I-6, I-7 and I-9  
sweep: I-6: PASS · banned 2 at 0 live · required 4/4 present (via supersession by K-2) · I-7: PASS · banned 4 at 0 live · required 3/3 present · I-9: PASS · banned 2 at 0 live · required 2/2 present

**137. r4 · I-11, I-5, I-6, I-7 · 4. The fixed stance · STRENGTHENS**  
before: Two inputs stand in each signature, the reading and the act, and no other. At every resolution n ≥ 1 the reading is an identification of statements; at one configuration it carries that resolution's content and is a premise on the value beside the act, which is why the reading of record is the firs…  
after: Two inputs stand in each conditional's signature, the reading and the act, and no other; the packaging adds the closedness of the configurations and the empty term at resolution zero, printed as `hR` and `h0`. At every resolution n ≥ 1, as a family or collected in one configuration (`value_collecte…  
reason: I-11 (STRUCTURAL): R8: Level 9's theorem concerns one closed configuration and ActualZeros, cited for the every-resolution premi… → cited per resolution, the family assembled by the packaging composition; sweep I-11 PASS; I-5 (COSMETIC): joint at the r3 end-to-end read: 'the one premise on the value' collided with the one-configuration reading a… → scoped to the reading of record; sweep I-5 PASS; I-6 (STRUCTURAL): R1: the act ranges over n = 0 while the reading is bounded n >= 1; the empty term at zero stood in a docstrin… → Box 1 adds the_act_every_is_the_value_packaged with hR and h0 in its type, [propext, Quot…; I-7 (STRUCTURAL): R2: one configuration was made the discriminator of the reading's content; the discriminator is one resolutio… → Box 1 adds value_collected (none); Section 1, Section 4 and the boundary restated; the ph…  
sweep: I-11: PASS · banned 1 at 0 live · required 1/1 present · I-5: PASS · banned 2 at 0 live · required 1/1 present · I-6: PASS · banned 2 at 0 live · required 4/4 present (via supersession by K-2) · I-7: PASS · banned 4 at 0 live · required 3/3 present

**138. r4 · I-6 · 4. The fixed stance · STRENGTHENS**  
before: \noindent{\small\bfseries\scshape\color{deep}Box 1 \textbar\ the conditional of Level 10, at every resolution and at one configuration, and the cargo's binding, composed and compiled against the seed}\par\nopagebreak  
after: \noindent{\small\bfseries\scshape\color{deep}Box 1 \textbar\ the conditional of Level 10, at every resolution and at one configuration, the act packaged, and the cargo's binding, composed and compiled against the seed}\par\nopagebreak  
reason: I-6 (STRUCTURAL): R1: the act ranges over n = 0 while the reading is bounded n >= 1; the empty term at zero stood in a docstrin… → Box 1 adds the_act_every_is_the_value_packaged with hR and h0 in its type, [propext, Quot… · attribution: Box 1 title names the I-6 packaging  
sweep: I-6: PASS · banned 2 at 0 live · required 4/4 present (via supersession by K-2)

**139. r4 · I-6, I-7, I-9 · 4. The fixed stance · STRENGTHENS**  
before: (nothing)  
after: /-- The act at every resolution is the value packaged, the term at resolution zero empty in the signature. -/ ⏎ theorem the_act_every_is_the_value_packaged {R : Nat → Config} ⏎     (hR : ∀ n, Closed (R n)) (h0 : R 0 = fun _ => False) : ⏎     (∃ Z : Charts.ActualZerosEvery, Z.zeros = R) ↔ ∀ n, 1 ≤ n…  
reason: I-6 (STRUCTURAL): R1: the act ranges over n = 0 while the reading is bounded n >= 1; the empty term at zero stood in a docstrin… → Box 1 adds the_act_every_is_the_value_packaged with hR and h0 in its type, [propext, Quot…; I-7 (STRUCTURAL): R2: one configuration was made the discriminator of the reading's content; the discriminator is one resolutio… → Box 1 adds value_collected (none); Section 1, Section 4 and the boundary restated; the ph…; I-9 (STRUCTURAL): R4: with the reading granted, asserting that no act stands is the denial of the classical sentence, so F-Brid… → Box 1 adds refusing_the_act_is_the_denial, [propext, Quot.sound]; F-Bridge and Section 7…  
sweep: I-6: PASS · banned 2 at 0 live · required 4/4 present (via supersession by K-2) · I-7: PASS · banned 4 at 0 live · required 3/3 present · I-9: PASS · banned 2 at 0 live · required 2/2 present

**140. r4 · I-6, I-7, I-9 · 4. The fixed stance · STRENGTHENS**  
before: (nothing)  
after: 'ComposedConditional.the_act_every_is_the_value_packaged' depends on axioms: [propext, Quot.sound] ⏎ 'ComposedConditional.refusing_the_act_is_the_denial' depends on axioms: [propext, Quot.sound] ⏎ 'ComposedConditional.value_collected' does not depend on any axioms  
reason: I-6 (STRUCTURAL): R1: the act ranges over n = 0 while the reading is bounded n >= 1; the empty term at zero stood in a docstrin… → Box 1 adds the_act_every_is_the_value_packaged with hR and h0 in its type, [propext, Quot…; I-7 (STRUCTURAL): R2: one configuration was made the discriminator of the reading's content; the discriminator is one resolutio… → Box 1 adds value_collected (none); Section 1, Section 4 and the boundary restated; the ph…; I-9 (STRUCTURAL): R4: with the reading granted, asserting that no act stands is the denial of the classical sentence, so F-Brid… → Box 1 adds refusing_the_act_is_the_denial, [propext, Quot.sound]; F-Bridge and Section 7…  
sweep: I-6: PASS · banned 2 at 0 live · required 4/4 present (via supersession by K-2) · I-7: PASS · banned 4 at 0 live · required 3/3 present · I-9: PASS · banned 2 at 0 live · required 2/2 present

**141. r4 · I-13, I-6 · 4. The fixed stance · MIXED**  
before: Read at every resolution n ≥ 1, resolution zero being no reading and the family's term there the empty configuration by the seed's stipulation (the docstring of `ActualZerosEvery`), the reading is an identification of statements; the interface proves no such identification as a law (`the_reading_is…  
after: Read at every resolution n ≥ 1, resolution zero being no reading and the family's term there the empty configuration, the hypothesis `h0` of the compositions that package the act, the reading is an identification of statements; the interface proves no such identification as a law (`the_reading_is_k…  
reason: the record is strengthened and the claim is narrowed: I-13: scoped: the docstring is no longer cited; the empty term at zero stands as h0 in a signature; front note on docstrings; sweep I-13 PASS  
sweep: I-13: PASS · banned 1 at 0 live · required 1/1 present · I-6: PASS · banned 2 at 0 live · required 4/4 present (via supersession by K-2)

**142. r4 · I-7 · 4. The fixed stance · STRENGTHENS**  
before: Two things stand outside the theorems: the reading, an input of every conditional, an identification of statements at every resolution n ≥ 1 and a premise on the value at one configuration; and the act at the configurations where the zeros of ζ are read, the premise on the value, an input of every…  
after: Two things stand outside the theorems: the reading, an input of every conditional, an identification of statements at every resolution n ≥ 1 and a premise on the value at the configuration of one resolution; and the act at the configurations where the zeros of ζ are read, the premise on the value,…  
reason: I-7 (STRUCTURAL): R2: one configuration was made the discriminator of the reading's content; the discriminator is one resolutio… → Box 1 adds value_collected (none); Section 1, Section 4 and the boundary restated; the ph…  
sweep: I-7: PASS · banned 4 at 0 live · required 3/3 present

**143. r4 · I-9 · 4. The fixed stance · STRENGTHENS**  
before: F-Bridge: the refusal by name of the act at the configurations where the zeros of ζ are read, or of the reading; refusing only the author's posit about the act's source, while granting an act, is no exit, since Box 1 needs no run; it leaves the cargo's theorems standing, since they hold of every ev…  
after: F-Bridge: the refusal by name of the reading, or of the act at the configurations where the zeros of ζ are read. Refusing the reading, or declining to grant the act without asserting its absence, holds the value open, the position Level 1 proves the interface leaves available; asserting that no act…  
reason: I-9 (STRUCTURAL): R4: with the reading granted, asserting that no act stands is the denial of the classical sentence, so F-Brid… → Box 1 adds refusing_the_act_is_the_denial, [propext, Quot.sound]; F-Bridge and Section 7…  
sweep: I-9: PASS · banned 2 at 0 live · required 2/2 present

**144. r4 · I-15 · 4. The fixed stance · STRENGTHENS**  
before: Given the reading and the act, rejecting this edition's conclusion contradicts Box 1, so its rejection names F-Computed or F-Bridge;  
after: Given the reading and the act, rejecting this edition's conclusion contradicts Box 1, so rejecting it requires naming F-Computed or F-Bridge;  
reason: I-15 (COSMETIC): spine-lock verify, not re-run after rounds 1-3, found C6's locked phrasing 'requires naming one of them' para… → phrasing restored in the exits paragraph; spine verify PASS on r4; sweep I-15 PASS  
sweep: I-15: PASS · banned 1 at 0 live · required 1/1 present

**145. r4 · I-9 · 7. The default reading, answered · STRENGTHENS**  
before: **"A reader can refuse the supply and deny the hypothesis without contradiction."** A reader can, and the paper names what that reader has asserted: no act stands at the configurations where the zeros of ζ are read, or the reading fails. The refusal is F-Bridge, one of the three exits, owned by the…  
after: **"A reader can refuse the supply and deny the hypothesis without contradiction."** A reader can, and the paper names what that reader has asserted: that the reading fails, or, with the reading granted, that no act stands at the configurations where the zeros of ζ are read, which is the denial itse…  
reason: I-9 (STRUCTURAL): R4: with the reading granted, asserting that no act stands is the denial of the classical sentence, so F-Brid… → Box 1 adds refusing_the_act_is_the_denial, [propext, Quot.sound]; F-Bridge and Section 7…  
sweep: I-9: PASS · banned 2 at 0 live · required 2/2 present

**146. r4 · I-6 · 7. The default reading, answered · STRENGTHENS**  
before: **"The ten levels are not a verified dependency chain; the capstone's proof does not invoke Levels 1 to 9."** Correct about the proof terms, and said in Section 3: the proofs of Level 10 are three, the cargo's on the cargo section, the run's on Part IV-b, and Box 1's conditionals on Parts III, V-b…  
after: **"The ten levels are not a verified dependency chain; the capstone's proof does not invoke Levels 1 to 9."** Correct about the proof terms, and said in Section 3: the proofs of Level 10 are three, the cargo's on the cargo section, the run's on Part IV-b, and Box 1's conditionals on Parts III, V-b…  
reason: I-6 (STRUCTURAL): R1: the act ranges over n = 0 while the reading is bounded n >= 1; the empty term at zero stood in a docstrin… → Box 1 adds the_act_every_is_the_value_packaged with hR and h0 in its type, [propext, Quot… · attribution: Section 7 consumer site of the I-6 packaging  
sweep: I-6: PASS · banned 2 at 0 live · required 4/4 present (via supersession by K-2)


### Version r5 · round 5

*Interaction note (end-to-end read, joints), from the round block:* 8 sweep specs, pre PASS on r4, post PASS on r5; 79 specs re-verified PASS (F-3 superseded by J-2); Section 3 census re-derived in-session by a transitive constant scan of 13 proof terms, matching the prosecution's; checker RESULT PASS (144 names); spine lock VERIFY PASS; end-to-end read of Notation, Section 3, Level 10 row, Section 4 run of record, reading, exits, Section 5 capstone paragraph, Section 7

**147. r5 · J-3 · abstract · STRENGTHENS**  
before: A run, like every fact that holds whatever the configuration, forces no value, so its flag is no proof of the value and the field is the act's, as Level 9 types every proof; from the act, at every resolution n ≥ 1 at which the zeros of ζ are read, the classical sentence follows under the reader's r…  
after: A run, like every fact that holds whatever the configuration, forces no value, so its flag is no proof of the value at every closed configuration and the field is the act's, as Level 9 types every proof; from the act, at every resolution n ≥ 1 at which the zeros of ζ are read, the classical sentenc…  
reason: J-3 (COSMETIC): Q6: 'the value' used for the law over closed configurations, the chart value, and the classical sentence → flag: no proof of the value at every closed configuration; F-Bridge and Section 7: the cl…  
sweep: J-3: PASS · banned 5 at 0 live · required 3/3 present

**148. r5 · J-6 · 1. The chain · STRENGTHENS**  
before: (nothing)  
after: Part II defines least erasure through the record instead, a world off the line only if every world of its record is, and proves it the value on its chart (`least_erasure_is_the_value`), so the two definitions meet at the value;  
reason: J-6 (COSMETIC): Q9: Part II defines least erasure through the record, not pointwise as the Notation states → Notation states Part II's definition and its meeting point, least_erasure_is_the_value; s…  
sweep: J-6: PASS · banned 0 at 0 live · required 1/1 present

**149. r5 · J-2 · 1. The chain · STRENGTHENS**  
before: A verification event is a move of the apparatus carrier from a state to its annihilation: a pair member lands on the neutral state at its height with its magnitude and sign kept nowhere, and a neutral state stays.  
after: A verification event is a move of the apparatus carrier from a state to its annihilation: a pair member lands on the neutral state at its height, its magnitude and sign kept in no part of the landing state, while the event itself records its `before`, and a neutral state stays.  
reason: J-2 (COSMETIC): Q5: 'kept nowhere' said more than the event's type, which records before; true of the landing state only, and… → landing state named; annihilate_fixes_iff_neutral cited; magnitude merging by computation…  
sweep: J-2: PASS · banned 1 at 0 live · required 2/2 present

**150. r5 · J-7 · 1. The chain · STRENGTHENS**  
before: (nothing)  
after: A Stage 1 closes on its two fields (`stage1_closes`), and every Stage 1 does, so a closed Stage 1 is any Stage 1; closed said of a configuration means fold-closed.  
reason: J-7 (COSMETIC): Q10: 'closed Stage 1' used closed in a second sense, selecting nothing → second sense announced in the Notation; sweep J-7 PASS  
sweep: J-7: PASS · banned 0 at 0 live · required 1/1 present

**151. r5 · J-8 · ledger row 6 · STRENGTHENS**  
before: The first two are on Part II's chart x = 2 Re s, where the open strip is the line itself, and the second two on the offset chart; a zero of the open strip off the line by a rational margin ε, 0 < Re s < 1 and \|Re s − 1/2\| > ε > 0, is placed off the line of the offset chart at every resolution bey…  
after: The first two are on Part II's chart x = 2 Re s, where the open strip is the line itself, and the second two on the offset chart; a zero of the open strip off the line by a rational margin η, 0 < Re s < 1 and \|Re s − 1/2\| > η > 0, is placed off the line of the offset chart at every resolution bey…  
reason: J-8 (COSMETIC): Q11: ε named both the reading margin and the residual bound; R both the configuration family and the residual → margin renamed η; bound and residual written B.ε and B.R as the seed's fields; sweep J-8…  
sweep: J-8: PASS · banned 6 at 0 live · required 3/3 present

**152. r5 · J-2 · ledger row 10 · STRENGTHENS**  
before: `stage2_optional_corroboration` [propext, Classical.choice, Quot.sound], `classical_rh_from_physico_formal_closure` none, eight inputs | The cargo section's carrier has two constructors, a self-conjugate state at a height and a member of a conjugate pair of magnitude m + 1 at a height with a sign;…  
after: `stage2_optional_corroboration` [propext, Classical.choice, Quot.sound], `classical_rh_from_physico_formal_closure` none, eight inputs | The cargo section's carrier has two constructors, a self-conjugate state at a height and a member of a conjugate pair of magnitude m + 1 at a height with a sign;…  
reason: J-2 (COSMETIC): Q5: 'kept nowhere' said more than the event's type, which records before; true of the landing state only, and… → landing state named; annihilate_fixes_iff_neutral cited; magnitude merging by computation…  
sweep: J-2: PASS · banned 1 at 0 live · required 2/2 present

**153. r5 · J-3 · ledger row 10 · STRENGTHENS**  
before: A run witnesses that it ran, and a run, like every fact that holds whatever the configuration, forces no value at every closed configuration, so its flag is no proof of the value; the field is the act's, as Level 9 types every proof.  
after: A run witnesses that it ran, and a run, like every fact that holds whatever the configuration, forces no value at every closed configuration, so its flag is no proof of the value at every closed configuration; the field is the act's, as Level 9 types every proof.  
reason: J-3 (COSMETIC): Q6: 'the value' used for the law over closed configurations, the chart value, and the classical sentence → flag: no proof of the value at every closed configuration; F-Bridge and Section 7: the cl…  
sweep: J-3: PASS · banned 5 at 0 live · required 3/3 present

**154. r5 · J-1 · 3. The single bind · STRENGTHENS**  
before: The proof terms of Level 10 are three, and they do not compose into one term: the cargo's use the cargo section alone; the run's use Part IV-b; the conditional of Box 1 at every resolution uses Parts III and V-b, and its packaging Part V-b's `the_act_at_every_resolution`, and no other theorem the l…  
after: The proof terms of Level 10 are three, and they do not compose into one term: the cargo's use the cargo section alone; the run's use Part IV-b; the conditional of Box 1 at every resolution uses Parts III and V-b, and at one configuration Part VII. Counted by every declaration a proof term reaches,…  
reason: J-1 (STRUCTURAL): Q2: Section 3's dependency census mixed direct and transitive use; transitively the packaging reaches the_act… → census re-run in-session by a transitive constant scan (13 proof terms) and restated by r…  
sweep: J-1: PASS · banned 3 at 0 live · required 3/3 present

**155. r5 · J-1 · 3. The single bind · STRENGTHENS**  
before: Levels 1 to 9 are not steps inside those proofs; they are the theorems that make the act the only supply there is, which is why a reader must meet them first.  
after: Levels 1 to 9 are not steps inside the cargo, the run or the conditional at every resolution, and enter the packaging only through `the_act_at_every_resolution`; they are the theorems that make the act the only supply there is, which is why a reader must meet them first.  
reason: J-1 (STRUCTURAL): Q2: Section 3's dependency census mixed direct and transitive use; transitively the packaging reaches the_act… → census re-run in-session by a transitive constant scan (13 proof terms) and restated by r…  
sweep: J-1: PASS · banned 3 at 0 live · required 3/3 present

**156. r5 · J-8 · 4. The fixed stance · STRENGTHENS**  
before: **The reading.** The reading `h_read` identifies the classical sentence with the value of the configurations at which the zeros of ζ are read, under the reader's rule of the parent paper: a zero off the line by a rational margin ε is read off the line at every resolution beyond 1/(2ε), and a zero c…  
after: **The reading.** The reading `h_read` identifies the classical sentence with the value of the configurations at which the zeros of ζ are read, under the reader's rule of the parent paper: a zero off the line by a rational margin η is read off the line at every resolution beyond 1/(2η), and a zero c…  
reason: J-8 (COSMETIC): Q11: ε named both the reading margin and the residual bound; R both the configuration family and the residual → margin renamed η; bound and residual written B.ε and B.R as the seed's fields; sweep J-8…  
sweep: J-8: PASS · banned 6 at 0 live · required 3/3 present

**157. r5 · J-4 · 4. The fixed stance · STRENGTHENS**  
before: Read at one resolution, it carries that resolution's content, since a configuration that has the value at resolution four can lack it at resolution fifty (`one_resolution_does_not_decide_the_next` none); the reading of record is therefore the one at every resolution, the form Box 1 compiles first.  
after: Read at one resolution, it carries that resolution's content, since a zero pair whose reading at resolution four has the value can have a reading at resolution fifty that lacks it (`one_resolution_does_not_decide_the_next` none); the reading of record is therefore the one at every resolution, the f…  
reason: J-4 (COSMETIC): Q7: 'a configuration ... at resolution four ... at resolution fifty' used configuration for the zero pair bef… → sweep J-4 PASS  
sweep: J-4: PASS · banned 1 at 0 live · required 1/1 present

**158. r5 · J-3 · 4. The fixed stance · STRENGTHENS**  
before: A run witnesses that it ran (`the_run_witnesses_a_run`), and its flag is no proof of the value (`the_run_does_not_force_the_value`); the receipt witnesses the run and is no proof of the value.  
after: A run witnesses that it ran (`the_run_witnesses_a_run`), and its flag is no proof of the value at every closed configuration (`the_run_does_not_force_the_value`); the receipt witnesses the run and is no such proof.  
reason: J-3 (COSMETIC): Q6: 'the value' used for the law over closed configurations, the chart value, and the classical sentence → flag: no proof of the value at every closed configuration; F-Bridge and Section 7: the cl…  
sweep: J-3: PASS · banned 5 at 0 live · required 3/3 present

**159. r5 · J-8 · 4. The fixed stance · STRENGTHENS**  
before: F-Computed: a non-trivial zero of ζ certified off the critical line by interval arithmetic; read at a resolution beyond 1/(2ε) it is a point off the line, the one refuter, and on the act's field at every resolution it does not exist (`no_arrival_off_the_line_on_the_act`, `the_act_at_every_resolutio…  
after: F-Computed: a non-trivial zero of ζ certified off the critical line by interval arithmetic; read at a resolution beyond 1/(2η) it is a point off the line, the one refuter, and on the act's field at every resolution it does not exist (`no_arrival_off_the_line_on_the_act`, `the_act_at_every_resolutio…  
reason: J-8 (COSMETIC): Q11: ε named both the reading margin and the residual bound; R both the configuration family and the residual → margin renamed η; bound and residual written B.ε and B.R as the seed's fields; sweep J-8…  
sweep: J-8: PASS · banned 6 at 0 live · required 3/3 present

**160. r5 · J-3 · 4. The fixed stance · STRENGTHENS**  
before: Refusing the reading, or declining to grant the act without asserting its absence, holds the value open, the position Level 1 proves the interface leaves available; asserting that no act stands there, with the reading granted, the configurations closed and the term at resolution zero empty, is the…  
after: Refusing the reading, or declining to grant the act without asserting its absence, holds the classical sentence open, the position Level 1 proves the interface leaves available; asserting that no act stands there, with the reading granted, the configurations closed and the term at resolution zero e…  
reason: J-3 (COSMETIC): Q6: 'the value' used for the law over closed configurations, the chart value, and the classical sentence → flag: no proof of the value at every closed configuration; F-Bridge and Section 7: the cl…  
sweep: J-3: PASS · banned 5 at 0 live · required 3/3 present

**161. r5 · J-8 · 4. The fixed stance · STRENGTHENS**  
before: F-Flux: an unaccounted residual heat flux of the vacuum detected above the bound ε within the dataset, window and background model the bound was read from; it bears on the optional corroboration of Section 5 alone and leaves the cargo untouched.  
after: F-Flux: an unaccounted residual heat flux of the vacuum detected above the bound B.ε within the dataset, window and background model the bound was read from; it bears on the optional corroboration of Section 5 alone and leaves the cargo untouched.  
reason: J-8 (COSMETIC): Q11: ε named both the reading margin and the residual bound; R both the configuration family and the residual → margin renamed η; bound and residual written B.ε and B.R as the seed's fields; sweep J-8…  
sweep: J-8: PASS · banned 6 at 0 live · required 3/3 present

**162. r5 · J-2 · 5. The corroboration, optional and fenced · STRENGTHENS**  
before: A zero off the line is a charged state that annihilation does not fix and sends with its partner to one state: the mathematical violation forces the physical discard of one label, kept nowhere (`mathematical_violation_forces_physical_discard`, `on_line_discards_nothing`, none).  
after: A zero off the line is a charged state that annihilation does not fix and sends with its partner to one state: the mathematical violation forces the physical discard of one label, kept in no state (`mathematical_violation_forces_physical_discard`, `on_line_discards_nothing`, none).  
reason: J-2 (COSMETIC): Q5: 'kept nowhere' said more than the event's type, which records before; true of the landing state only, and… → landing state named; annihilate_fixes_iff_neutral cited; magnitude merging by computation…  
sweep: J-2: PASS · banned 1 at 0 live · required 2/2 present

**163. r5 · J-8 · 5. The corroboration, optional and fenced · STRENGTHENS**  
before: An exact null forces the population to zero; a bound at finite sensitivity bounds it, ρ r~0~ q~0~ ≤ ε, and does not empty it (`null_forces_zero`, `density_bound_from_residual_bound`, none).  
after: An exact null forces the population to zero; a bound at finite sensitivity bounds it, ρ r~0~ q~0~ ≤ B.ε, and does not empty it (`null_forces_zero`, `density_bound_from_residual_bound`, none).  
reason: J-8 (COSMETIC): Q11: ε named both the reading margin and the residual bound; R both the configuration family and the residual → margin renamed η; bound and residual written B.ε and B.R as the seed's fields; sweep J-8…  
sweep: J-8: PASS · banned 6 at 0 live · required 3/3 present

**164. r5 · J-8 · 5. The corroboration, optional and fenced · STRENGTHENS**  
before: The capstone of this route, `classical_rh_from_physico_formal_closure`, takes eight inputs, the reading `h_read`, the realization `h_realize`, the floors `h_pop`, `h_rate`, `h_temp`, the coupling `h_couple`, the certified bound B with R ≤ ε, and the gap `h_gap`, ε < δ, and concludes the classical h…  
after: The capstone of this route, `classical_rh_from_physico_formal_closure`, takes eight inputs, the reading `h_read`, the realization `h_realize`, the floors `h_pop`, `h_rate`, `h_temp`, the coupling `h_couple`, the certified bound B with B.R ≤ B.ε, and the gap `h_gap`, B.ε < δ, and concludes the class…  
reason: J-8 (COSMETIC): Q11: ε named both the reading margin and the residual bound; R both the configuration family and the residual → margin renamed η; bound and residual written B.ε and B.R as the seed's fields; sweep J-8…  
sweep: J-8: PASS · banned 6 at 0 live · required 3/3 present

**165. r5 · J-3, J-5 · 7. The default reading, answered · STRENGTHENS**  
before: **"A reader can refuse the supply and deny the hypothesis without contradiction."** A reader can, and the paper names what that reader has asserted: that the reading fails, or, with the reading granted, that no act stands at the configurations where the zeros of ζ are read, which is the denial itse…  
after: **"A reader can refuse the supply and deny the hypothesis without contradiction."** A reader can, and the paper names what that reader has asserted: that the reading fails, or, with the reading granted, the configurations closed and the term at resolution zero empty, that no act stands at the confi…  
reason: J-3 (COSMETIC): Q6: 'the value' used for the law over closed configurations, the chart value, and the classical sentence → flag: no proof of the value at every closed configuration; F-Bridge and Section 7: the cl…; J-5 (COSMETIC): Q8: Section 7's refusal sentence dropped the closedness and empty-zero-term conditions of refusing_the_act_is… → conditions restored; sweep J-5 PASS  
sweep: J-3: PASS · banned 5 at 0 live · required 3/3 present · J-5: PASS · banned 1 at 0 live · required 1/1 present (via supersession by K-2)

**166. r5 · J-1 · 7. The default reading, answered · STRENGTHENS**  
before: **"The ten levels are not a verified dependency chain; the capstone's proof does not invoke Levels 1 to 9."** Correct about the proof terms, and said in Section 3: the proofs of Level 10 are three, the cargo's on the cargo section, the run's on Part IV-b, and Box 1's conditionals on Parts III, V-b…  
after: **"The ten levels are not a verified dependency chain; the capstone's proof does not invoke Levels 1 to 9."** Correct about the conditional at every resolution, the cargo and the run, and counted in Section 3: the proofs of Level 10 are three, the cargo's on the cargo section, the run's on Part IV-…  
reason: J-1 (STRUCTURAL): Q2: Section 3's dependency census mixed direct and transitive use; transitively the packaging reaches the_act… → census re-run in-session by a transitive constant scan (13 proof terms) and restated by r…  
sweep: J-1: PASS · banned 3 at 0 live · required 3/3 present

**167. r5 · J-1 · 7. The default reading, answered · STRENGTHENS**  
before: Levels 1 to 9 are not steps inside those proofs; they are the theorems that make the act the only supply there is, every forcing premise the value or stronger and every proof a supply of the one field.  
after: Levels 1 to 9 are not steps inside the conditional at every resolution, the cargo or the run; they are the theorems that make the act the only supply there is, every forcing premise the value or stronger and every proof a supply of the one field.  
reason: J-1 (STRUCTURAL): Q2: Section 3's dependency census mixed direct and transitive use; transitively the packaging reaches the_act… → census re-run in-session by a transitive constant scan (13 proof terms) and restated by r…  
sweep: J-1: PASS · banned 3 at 0 live · required 3/3 present


### Version r6 · round 6

*Interaction note (end-to-end read, joints), from the round block:* Box 1 grows to seven compositions, the packaging and refusal restated without hR (closedness derived from the value inside the proof), recompiled, cones diffed: MATCH; dependency census re-run on the new terms, unchanged; 4 sweep specs, pre PASS on r5, post PASS on r6; 83 specs re-verified PASS (I-6 twice and J-5 superseded by K-2); checker RESULT PASS; spine lock VERIFY PASS; end-to-end read of abstract, Level 10 row, Section 3, Section 4 capstone, reading, exits, Section 5 close, Section 7; one joint repaired in-round ("its type")

**168. r6 · K-2 · abstract · STRENGTHENS**  
before: A run, like every fact that holds whatever the configuration, forces no value, so its flag is no proof of the value at every closed configuration and the field is the act's, as Level 9 types every proof; from the act, at every resolution n ≥ 1 at which the zeros of ζ are read, the classical sentenc…  
after: A run, like every fact that holds whatever the configuration, forces no value, so its flag is no proof of the value at every closed configuration and the field is the act's, as Level 9 types every proof; from the act, at every resolution n ≥ 1 at which the zeros of ζ are read, the classical sentenc…  
reason: K-2 (COSMETIC): P3: the closedness hypothesis hR of the packaging and the refusal is entailed by the value and h0, so the inp… → Box 1 restated without hR, closedness derived from the value in the proof, recompiled, co…  
sweep: K-2: PASS · banned 4 at 0 live · required 2/2 present

**169. r6 · K-4 · front note · STRENGTHENS**  
before: \* Every theorem named below is in the seed of Appendix A, save the names marked as the Formal Master's or reference 8's where they are cited, the six compositions of Box 1, and Lean's own `Classical.em` and `Classical.byContradiction`; the seed is edition 2.0.5, sha256 a82ef4f0ad6ceb43 a2d3cc964b1…  
after: \* Every theorem named below is in the seed of Appendix A, save the names marked as the Formal Master's or reference 8's where they are cited, the seven compositions of Box 1, and Lean's own `Classical.em` and `Classical.byContradiction`; the seed is edition 2.0.5, sha256 a82ef4f0ad6ceb43 a2d3cc964…  
reason: K-4 (COSMETIC): P5: the_reading_is_keyed states the one-configuration form, cited for the every-resolution identification → Box 1 adds the_reading_every_is_keyed (none); sweep K-4 PASS · attribution: count follows the K-4 composition the_reading_every_is_keyed  
sweep: K-4: PASS · banned 1 at 0 live · required 1/1 present

**170. r6 · K-2 · ledger row 10 · STRENGTHENS**  
before: From an act at every resolution at which the zeros of ζ are read, the classical sentence follows under the reader's rule with an empty cone; where those configurations are closed and the term at resolution zero is empty, both hypotheses of its type, the act is exactly the value at every resolution…  
after: From an act at every resolution at which the zeros of ζ are read, the classical sentence follows under the reader's rule with an empty cone; where the term at resolution zero is empty, the one hypothesis the packaging's type adds, the act is exactly the value at every resolution n ≥ 1, the closedne…  
reason: K-2 (COSMETIC): P3: the closedness hypothesis hR of the packaging and the refusal is entailed by the value and h0, so the inp… → Box 1 restated without hR, closedness derived from the value in the proof, recompiled, co…  
sweep: K-2: PASS · banned 4 at 0 live · required 2/2 present

**171. r6 · K-3 · 3. The single bind · STRENGTHENS**  
before: Counted by every declaration a proof term reaches, through statements and proofs alike, the cargo's, the run's and the conditional at every resolution reach no theorem the ledger names at Levels 1 to 9; the conditional at one configuration reaches `le_iff_value` of Level 2, through `classical_rh_if…  
after: Counted by every declaration a proof term reaches, through statements and proofs alike, the cargo's, the run's and the conditional at every resolution reach no theorem the ledger names at Levels 1 to 9; the conditional at one configuration reaches `le_iff_value` of Level 2, through `classical_rh_if…  
reason: K-3 (COSMETIC): P4: the refusal calls the_act_at_every_resolution through the packaging, not directly; Section 7's part list… → dependency census re-run on the new Box 1, unchanged; sweep K-3 PASS  
sweep: K-3: PASS · banned 1 at 0 live · required 2/2 present (via supersession by BB-2, M-3)

**172. r6 · K-4 · 4. The fixed stance · STRENGTHENS**  
before: Box 1 prints six compositions, compiled against the seed; two carry the conditional, with empty cones; two package the act and its refusal, at [propext, Quot.sound]; one collects every resolution in one configuration, and one binds the cargo, with empty cones.  
after: Box 1 prints seven compositions, compiled against the seed; two carry the conditional, with empty cones; two package the act and its refusal, at [propext, Quot.sound]; one collects every resolution in one configuration, one shows the reading at every resolution keyed, and one binds the cargo, with…  
reason: K-4 (COSMETIC): P5: the_reading_is_keyed states the one-configuration form, cited for the every-resolution identification → Box 1 adds the_reading_every_is_keyed (none); sweep K-4 PASS · attribution: count follows the K-4 composition  
sweep: K-4: PASS · banned 1 at 0 live · required 1/1 present

**173. r6 · K-2 · 4. The fixed stance · STRENGTHENS**  
before: Two inputs stand in each conditional's signature, the reading and the act, and no other; the packaging adds the closedness of the configurations and the empty term at resolution zero, printed as `hR` and `h0`.  
after: Two inputs stand in each conditional's signature, the reading and the act, and no other; the packaging adds one hypothesis, the empty term at resolution zero, printed as `h0`, the closedness of the configurations following from the value.  
reason: K-2 (COSMETIC): P3: the closedness hypothesis hR of the packaging and the refusal is entailed by the value and h0, so the inp… → Box 1 restated without hR, closedness derived from the value in the proof, recompiled, co…  
sweep: K-2: PASS · banned 4 at 0 live · required 2/2 present

**174. r6 · K-2 · 4. The fixed stance · STRENGTHENS**  
before: The act is the supply, the one premise on the value under the reading of record: where the configurations are closed and the term at resolution zero is empty, both hypotheses of its type, an act at every resolution exists exactly where the value holds at every resolution n ≥ 1 (`the_act_every_is_th…  
after: The act is the supply, the one premise on the value under the reading of record: where the term at resolution zero is empty, the hypothesis of its type, an act at every resolution exists exactly where the value holds at every resolution n ≥ 1 (`the_act_every_is_the_value_packaged`, from `the_act_at…  
reason: K-2 (COSMETIC): P3: the closedness hypothesis hR of the packaging and the refusal is entailed by the value and h0, so the inp… → Box 1 restated without hR, closedness derived from the value in the proof, recompiled, co…  
sweep: K-2: PASS · banned 4 at 0 live · required 2/2 present

**175. r6 · K-2 · 4. The fixed stance · STRENGTHENS**  
before: /-- The act at every resolution is the value packaged, the term at resolution zero empty in the signature. -/  
after: /-- The act at every resolution is the value packaged; the one added hypothesis is the empty term at resolution zero,  
reason: K-2 (COSMETIC): P3: the closedness hypothesis hR of the packaging and the refusal is entailed by the value and h0, so the inp… → Box 1 restated without hR, closedness derived from the value in the proof, recompiled, co… · attribution: Box 1 docstring follows the K-2 removal of hR  
sweep: K-2: PASS · banned 4 at 0 live · required 2/2 present

**176. r6 · K-2 · 4. The fixed stance · STRENGTHENS**  
before: theorem the_act_every_is_the_value_packaged {R : Nat → Config}  
after: the closedness of the configurations following from the value. -/  
reason: K-2 (COSMETIC): P3: the closedness hypothesis hR of the packaging and the refusal is entailed by the value and h0, so the inp… → Box 1 restated without hR, closedness derived from the value in the proof, recompiled, co… · attribution: Box 1 docstring, K-2  
sweep: K-2: PASS · banned 4 at 0 live · required 2/2 present

**177. r6 · K-2 · 4. The fixed stance · STRENGTHENS**  
before: (hR : ∀ n, Closed (R n)) (h0 :  
after: theorem the_act_every_is_the_value_packaged {R : Nat → Config} (h0 :  
reason: K-2 (COSMETIC): P3: the closedness hypothesis hR of the packaging and the refusal is entailed by the value and h0, so the inp… → Box 1 restated without hR, closedness derived from the value in the proof, recompiled, co… · attribution: Box 1 signature without hR, K-2  
sweep: K-2: PASS · banned 4 at 0 live · required 2/2 present

**178. r6 · K-2 · 4. The fixed stance · STRENGTHENS**  
before: rw [(Charts.the_act_at_every_resolution R hR).1] ⏎   refine ⟨fun h n _ => h n, fun h n => ?_⟩ ⏎   cases n with ⏎   | zero => rw [h0]; exact fun _ hp => hp.elim ⏎   | succ k => exact h (k + 1) (Nat.succ_le_succ (Nat.zero_le k))  
after: have hv : (∀ n, 1 ≤ n → Value (R n)) → ∀ n, Value (R n) := fun h n => by ⏎     cases n with ⏎     | zero => rw [h0]; exact fun _ hp => hp.elim ⏎     | succ k => exact h (k + 1) (Nat.succ_le_succ (Nat.zero_le k)) ⏎   refine ⟨fun ⟨Z, hZ⟩ n _ => hZ ▸ value_from_the_act (Z.atRes n), fun h => ?_⟩ ⏎   ha…  
reason: K-2 (COSMETIC): P3: the closedness hypothesis hR of the packaging and the refusal is entailed by the value and h0, so the inp… → Box 1 restated without hR, closedness derived from the value in the proof, recompiled, co… · attribution: Box 1 proof derives closedness from the value, K-2  
sweep: K-2: PASS · banned 4 at 0 live · required 2/2 present

**179. r6 · K-2 · 4. The fixed stance · STRENGTHENS**  
before: ClassicalRH ↔ ∀ n, 1 ≤ n → Value (R n)) (hR : ∀ n, Closed (R n)) (h0 :  
after: ClassicalRH ↔ ∀ n, 1 ≤ n → Value (R n)) (h0 :  
reason: K-2 (COSMETIC): P3: the closedness hypothesis hR of the packaging and the refusal is entailed by the value and h0, so the inp… → Box 1 restated without hR, closedness derived from the value in the proof, recompiled, co… · attribution: Box 1 refusal signature without hR, K-2  
sweep: K-2: PASS · banned 4 at 0 live · required 2/2 present

**180. r6 · K-2 · 4. The fixed stance · STRENGTHENS**  
before: rw [the_act_every_is_the_value_packaged hR h0, h_read]  
after: rw [the_act_every_is_the_value_packaged h0, h_read]  
reason: K-2 (COSMETIC): P3: the closedness hypothesis hR of the packaging and the refusal is entailed by the value and h0, so the inp… → Box 1 restated without hR, closedness derived from the value in the proof, recompiled, co… · attribution: Box 1 refusal proof without hR, K-2  
sweep: K-2: PASS · banned 4 at 0 live · required 2/2 present

**181. r6 · K-4 · 4. The fixed stance · STRENGTHENS**  
before: (nothing)  
after: /-- The reading at every resolution is keyed: the constant family at the pair world. -/ ⏎ theorem the_reading_every_is_keyed : ⏎     ∃ (P : Prop) (R : Nat → Config), (∀ n, Closed (R n)) ∧ ¬ (P ↔ ∀ n, 1 ≤ n → Value (R n)) := ⏎   ⟨True, fun _ => pairWorld offPoint, fun _ => pair_world_closed offPoint…  
reason: K-4 (COSMETIC): P5: the_reading_is_keyed states the one-configuration form, cited for the every-resolution identification → Box 1 adds the_reading_every_is_keyed (none); sweep K-4 PASS  
sweep: K-4: PASS · banned 1 at 0 live · required 1/1 present

**182. r6 · K-4 · 4. The fixed stance · STRENGTHENS**  
before: (nothing)  
after: 'ComposedConditional.the_reading_every_is_keyed' does not depend on any axioms  
reason: K-4 (COSMETIC): P5: the_reading_is_keyed states the one-configuration form, cited for the every-resolution identification → Box 1 adds the_reading_every_is_keyed (none); sweep K-4 PASS  
sweep: K-4: PASS · banned 1 at 0 live · required 1/1 present

**183. r6 · K-4 · 4. The fixed stance · STRENGTHENS**  
before: Read at every resolution n ≥ 1, resolution zero being no reading and the family's term there the empty configuration, the hypothesis `h0` of the compositions that package the act, the reading is an identification of statements; the interface proves no such identification as a law (`the_reading_is_k…  
after: Read at every resolution n ≥ 1, resolution zero being no reading and the family's term there the empty configuration, the hypothesis `h0` of the compositions that package the act, the reading is an identification of statements; the interface proves no such identification as a law, at one configurat…  
reason: K-4 (COSMETIC): P5: the_reading_is_keyed states the one-configuration form, cited for the every-resolution identification → Box 1 adds the_reading_every_is_keyed (none); sweep K-4 PASS  
sweep: K-4: PASS · banned 1 at 0 live · required 1/1 present

**184. r6 · K-1, K-2 · 4. The fixed stance · STRENGTHENS**  
before: F-Bridge: the refusal by name of the reading, or of the act at the configurations where the zeros of ζ are read. Refusing the reading, or declining to grant the act without asserting its absence, holds the classical sentence open, the position Level 1 proves the interface leaves available; assertin…  
after: F-Bridge: the refusal by name of the reading, or of the supply: in this edition the act at the configurations where the zeros of ζ are read; in the physical edition a physical premise or the observational model, as that edition states it, a refusal whose shape on the carrier is a read zero off the…  
reason: K-1 (STRUCTURAL): P1: F-Bridge was defined by the reading and the act only, so refusing a physical premise of the physical edit… → F-Bridge restored to cover the physical edition's physical premises and observational mod…; K-2 (COSMETIC): P3: the closedness hypothesis hR of the packaging and the refusal is entailed by the value and h0, so the inp… → Box 1 restated without hR, closedness derived from the value in the proof, recompiled, co…  
sweep: K-1: PASS · banned 1 at 0 live · required 2/2 present · K-2: PASS · banned 4 at 0 live · required 2/2 present

**185. r6 · K-1 · 5. The corroboration, optional and fenced · STRENGTHENS**  
before: Under the reading, the bound and the gap, the denial of the hypothesis and the physical premises cannot all stand (`no_third_position`, `no_third_position_on_the_carrier`); on the carrier a refusal has a shape, a read zero off the line realized in no measured register (`the_one_exit_is_a_second_reg…  
after: Under the reading, the bound and the gap, the denial of the hypothesis and the physical premises cannot all stand (`no_third_position`, `no_third_position_on_the_carrier`); on the carrier a refusal has a shape, a read zero off the line realized in no measured register (`the_one_exit_is_a_second_reg…  
reason: K-1 (STRUCTURAL): P1: F-Bridge was defined by the reading and the act only, so refusing a physical premise of the physical edit… → F-Bridge restored to cover the physical edition's physical premises and observational mod…  
sweep: K-1: PASS · banned 1 at 0 live · required 2/2 present

**186. r6 · K-2 · 7. The default reading, answered · STRENGTHENS**  
before: **"A reader can refuse the supply and deny the hypothesis without contradiction."** A reader can, and the paper names what that reader has asserted: that the reading fails, or, with the reading granted, the configurations closed and the term at resolution zero empty, that no act stands at the confi…  
after: **"A reader can refuse the supply and deny the hypothesis without contradiction."** A reader can, and the paper names what that reader has asserted: that the reading fails, or, with the reading granted and the term at resolution zero empty, that no act stands at the configurations where the zeros o…  
reason: K-2 (COSMETIC): P3: the closedness hypothesis hR of the packaging and the refusal is entailed by the value and h0, so the inp… → Box 1 restated without hR, closedness derived from the value in the proof, recompiled, co…  
sweep: K-2: PASS · banned 4 at 0 live · required 2/2 present

**187. r6 · K-3 · 7. The default reading, answered · STRENGTHENS**  
before: **"The ten levels are not a verified dependency chain; the capstone's proof does not invoke Levels 1 to 9."** Correct about the conditional at every resolution, the cargo and the run, and counted in Section 3: the proofs of Level 10 are three, the cargo's on the cargo section, the run's on Part IV-…  
after: **"The ten levels are not a verified dependency chain; the capstone's proof does not invoke Levels 1 to 9."** Correct about the conditional at every resolution, the cargo and the run, and counted in Section 3: the proofs of Level 10 are three, named by the parts each calls directly, the cargo's on…  
reason: K-3 (COSMETIC): P4: the refusal calls the_act_at_every_resolution through the packaging, not directly; Section 7's part list… → dependency census re-run on the new Box 1, unchanged; sweep K-3 PASS  
sweep: K-3: PASS · banned 1 at 0 live · required 2/2 present (via supersession by BB-2, M-3)


### Version r7 · round 7

*Interaction note (end-to-end read, joints), from the round block:* Box 1 grows to eight compositions (the_collected_act_is_the_act_every; the_reading_every_is_keyed restated with R 0 empty), recompiled, cones diffed: MATCH; 3 sweep specs, pre PASS on r6, post PASS on r7; 86 specs re-verified PASS (I-8 superseded by L-3); checker RESULT PASS (145 names); spine lock VERIFY PASS; end-to-end read of Section 1 twin paragraph, Section 4 capstone, reading, exits, Section 5 close

**188. r7 · L-3 · front note · STRENGTHENS**  
before: \* Every theorem named below is in the seed of Appendix A, save the names marked as the Formal Master's or reference 8's where they are cited, the seven compositions of Box 1, and Lean's own `Classical.em` and `Classical.byContradiction`; the seed is edition 2.0.5, sha256 a82ef4f0ad6ceb43 a2d3cc964…  
after: \* Every theorem named below is in the seed of Appendix A, save the names marked as the Formal Master's or reference 8's where they are cited, the eight compositions of Box 1, and Lean's own `Classical.em` and `Classical.byContradiction`; the seed is edition 2.0.5, sha256 a82ef4f0ad6ceb43 a2d3cc964…  
reason: L-3 (COSMETIC): N4: Section 1 kept the closedness condition after K-2 removed it from the packaging; none of the cited names… → Box 1 adds the_collected_act_is_the_act_every with h0 alone, [propext, Quot.sound]; Secti… · attribution: count follows the L-3 composition the_collected_act_is_the_act_every  
sweep: L-3: PASS · banned 2 at 0 live · required 2/2 present

**189. r7 · L-3 · 1. The chain · STRENGTHENS**  
before: The two supplies are of two structures, an act at one configuration and an act at every resolution, each least erasure at the configurations its edition reads; where Zζ collects the family's resolutions, the configurations closed and the term at resolution zero empty, they carry one content (`value…  
after: The two supplies are of two structures, an act at one configuration and an act at every resolution, each least erasure at the configurations its edition reads; where Zζ collects the family's resolutions and the term at resolution zero is empty, they carry one content, an act at Zζ existing exactly…  
reason: L-3 (COSMETIC): N4: Section 1 kept the closedness condition after K-2 removed it from the packaging; none of the cited names… → Box 1 adds the_collected_act_is_the_act_every with h0 alone, [propext, Quot.sound]; Secti…  
sweep: L-3: PASS · banned 2 at 0 live · required 2/2 present

**190. r7 · L-3 · 4. The fixed stance · STRENGTHENS**  
before: Box 1 prints seven compositions, compiled against the seed; two carry the conditional, with empty cones; two package the act and its refusal, at [propext, Quot.sound]; one collects every resolution in one configuration, one shows the reading at every resolution keyed, and one binds the cargo, with…  
after: Box 1 prints eight compositions, compiled against the seed; two carry the conditional, with empty cones; two package the act and its refusal, at [propext, Quot.sound]; one collects every resolution in one configuration, with an empty cone, and one carries the act there to the act at every resolutio…  
reason: L-3 (COSMETIC): N4: Section 1 kept the closedness condition after K-2 removed it from the packaging; none of the cited names… → Box 1 adds the_collected_act_is_the_act_every with h0 alone, [propext, Quot.sound]; Secti… · attribution: count and grades follow the L-3 composition  
sweep: L-3: PASS · banned 2 at 0 live · required 2/2 present

**191. r7 · L-3 · 4. The fixed stance · STRENGTHENS**  
before: /-- The reading at every resolution is keyed: the constant family at the pair world. -/  
after: /-- Every resolution collected in one configuration carries the act's content: an act there exists exactly where an ⏎     act at every resolution does, the term at resolution zero empty. -/ ⏎ theorem the_collected_act_is_the_act_every {R : Nat → Config} (h0 : R 0 = fun _ => False) : ⏎     (∃ A : Ac…  
reason: L-3 (COSMETIC): N4: Section 1 kept the closedness condition after K-2 removed it from the packaging; none of the cited names… → Box 1 adds the_collected_act_is_the_act_every with h0 alone, [propext, Quot.sound]; Secti…  
sweep: L-3: PASS · banned 2 at 0 live · required 2/2 present

**192. r7 · L-2 · 4. The fixed stance · STRENGTHENS**  
before: ∃ (P : Prop) (R : Nat → Config), (∀ n, Closed (R n)) ∧ ¬ (P ↔ ∀ n, 1 ≤ n → Value (R n)) := ⏎   ⟨True, fun _ => pairWorld offPoint, fun _ => pair_world_closed offPoint,  
after: ∃ (P : Prop) (R : Nat → Config), R 0 = (fun _ => False) ∧ (∀ n, Closed (R n)) ∧ ⏎       ¬ (P ↔ ∀ n, 1 ≤ n → Value (R n)) := ⏎   ⟨True, fun n => match n with | 0 => fun _ => False | _ + 1 => pairWorld offPoint, rfl, ⏎    fun n => match n with | 0 => fun _ hp => hp.elim | _ + 1 => pair_world_closed o…  
reason: L-2 (COSMETIC): N3: the_reading_every_is_keyed's witness family was not empty at resolution zero, outside the h0 scope the re… → composition restated with R 0 empty as a conjunct, recompiled, none; sweep L-2 PASS  
sweep: L-2: PASS · banned 1 at 0 live · required 2/2 present

**193. r7 · L-3 · 4. The fixed stance · STRENGTHENS**  
before: (nothing)  
after: 'ComposedConditional.the_collected_act_is_the_act_every' depends on axioms: [propext, Quot.sound]  
reason: L-3 (COSMETIC): N4: Section 1 kept the closedness condition after K-2 removed it from the packaging; none of the cited names… → Box 1 adds the_collected_act_is_the_act_every with h0 alone, [propext, Quot.sound]; Secti…  
sweep: L-3: PASS · banned 2 at 0 live · required 2/2 present

**194. r7 · L-2 · 4. The fixed stance · STRENGTHENS**  
before: Read at every resolution n ≥ 1, resolution zero being no reading and the family's term there the empty configuration, the hypothesis `h0` of the compositions that package the act, the reading is an identification of statements; the interface proves no such identification as a law, at one configurat…  
after: Read at every resolution n ≥ 1, resolution zero being no reading and the family's term there the empty configuration, the hypothesis `h0` of the compositions that package the act, the reading is an identification of statements; the interface proves no such identification as a law, at one configurat…  
reason: L-2 (COSMETIC): N3: the_reading_every_is_keyed's witness family was not empty at resolution zero, outside the h0 scope the re… → composition restated with R 0 empty as a conjunct, recompiled, none; sweep L-2 PASS  
sweep: L-2: PASS · banned 1 at 0 live · required 2/2 present

**195. r7 · L-1 · 4. The fixed stance · STRENGTHENS**  
before: F-Bridge: the refusal by name of the reading, or of the supply: in this edition the act at the configurations where the zeros of ζ are read; in the physical edition a physical premise or the observational model, as that edition states it, a refusal whose shape on the carrier is a read zero off the…  
after: F-Bridge: the refusal by name of the reading, or of the supply: in this edition the act at the configurations where the zeros of ζ are read; in the physical edition a physical premise or the observational model, as that edition states it, of which the refusal of the realization, with the reading, t…  
reason: L-1 (STRUCTURAL): N1: the second-register shape was given to every physical-edition F-Bridge refusal, but the_one_exit_is_a_sec… → F-Bridge keeps every physical input refusable by name; the shape scoped to the realizatio…  
sweep: L-1: PASS · banned 2 at 0 live · required 2/2 present (via supersession by M-1)

**196. r7 · L-1 · 5. The corroboration, optional and fenced · STRENGTHENS**  
before: Under the reading, the bound and the gap, the denial of the hypothesis and the physical premises cannot all stand (`no_third_position`, `no_third_position_on_the_carrier`); on the carrier a refusal has a shape, a read zero off the line realized in no measured register (`the_one_exit_is_a_second_reg…  
after: Under the reading, the bound and the gap, the denial of the hypothesis and the physical premises cannot all stand (`no_third_position`, `no_third_position_on_the_carrier`); with the reading, the bound, the gap and the signal floor granted, a denial has a shape on the carrier, a read zero off the li…  
reason: L-1 (STRUCTURAL): N1: the second-register shape was given to every physical-edition F-Bridge refusal, but the_one_exit_is_a_sec… → F-Bridge keeps every physical input refusable by name; the shape scoped to the realizatio…  
sweep: L-1: PASS · banned 2 at 0 live · required 2/2 present (via supersession by M-1)


### Version r8 · round 8

*Interaction note (end-to-end read, joints), from the round block:* 5 sweep specs, pre PASS on r7, post PASS on r8; 91 specs re-verified PASS (K-3, L-1 superseded by M-3, M-1); checker RESULT PASS (145 names); spine lock VERIFY PASS; Box 1 unchanged from r7 (compiled, cones MATCH)

**197. r8 · M-2 · ledger row 5 · STRENGTHENS**  
before: Two denials, one shape, two layers: every no re-enacts the floor, the no to the root is refuted by its own act, and the no to the hypothesis is a lack of the root read twice, which the false world lacks and the true world of the same record carries. | THEOREM · form, place, content and denial force…  
after: Two denials, one shape, two layers: every no re-enacts the floor, the no to the root is refuted by its own deed, and the no to the hypothesis is a lack of the root read twice, which the false world lacks and the true world of the same record carries. | THEOREM · form, place, content and denial forc…  
reason: M-2 (COSMETIC): M3: Level 5 row said the no to the root is refuted by its own act; the term is a deed of the root's act type,… → deed; sweep M-2 PASS  
sweep: M-2: PASS · banned 1 at 0 live · required 1/1 present

**198. r8 · M-4 · ledger row 7 · STRENGTHENS**  
before: At every resolution the act stands exactly where the value holds, and on it the value, the zero reports and the prime bound hold.  
after: Over every index, resolution zero included, closed configurations carry the act exactly where the value holds, and on it the value, the zero reports and the prime bound hold.  
reason: M-4 (COSMETIC): M5: Level 7 row stated the act-value equivalence 'at every resolution' while the cited conjunct ranges over e… → range and closedness printed; sweep M-4 PASS  
sweep: M-4: PASS · banned 1 at 0 live · required 1/1 present

**199. r8 · M-3 · 3. The single bind · STRENGTHENS**  
before: Counted by every declaration a proof term reaches, through statements and proofs alike, the cargo's, the run's and the conditional at every resolution reach no theorem the ledger names at Levels 1 to 9; the conditional at one configuration reaches `le_iff_value` of Level 2, through `classical_rh_if…  
after: Counted by every declaration a proof term reaches, through statements and proofs alike, the cargo's, the run's and the conditional at every resolution reach no theorem the ledger names at Levels 1 to 9; the conditional at one configuration reaches `le_iff_value` of Level 2, through `classical_rh_if…  
reason: M-3 (COSMETIC): M4: the dependency census omitted the collected act, which reaches the same eight ledger names through the pa… → census and part list completed; K-3 required phrase superseded; sweep M-3 PASS  
sweep: M-3: PASS · banned 2 at 0 live · required 2/2 present (via supersession by CC-1)

**200. r8 · M-1 · 4. The fixed stance · STRENGTHENS**  
before: F-Bridge: the refusal by name of the reading, or of the supply: in this edition the act at the configurations where the zeros of ζ are read; in the physical edition a physical premise or the observational model, as that edition states it, of which the refusal of the realization, with the reading, t…  
after: F-Bridge: the refusal by name of the reading, or of the supply: in this edition the act at the configurations where the zeros of ζ are read; in the physical edition a physical premise or the observational model, as that edition states it, of which a denial of the classical sentence, with the readin…  
reason: M-1 (STRUCTURAL): M1: Section 4 gave the second-register shape to the refusal of the realization; the theorem's antecedent is t… → direction restored as Section 5 states it; L-1 required phrase superseded; sweep M-1 PASS  
sweep: M-1: PASS · banned 1 at 0 live · required 1/1 present

**201. r8 · M-5 · 7. The default reading, answered · STRENGTHENS**  
before: The cargo and the conditional print none; the closures that bind a classical step print the three standard axioms, and are printed so.  
after: The cargo's four core declarations and the two conditionals print none; the packaging, its refusal and the collected act print [propext, Quot.sound]; the closures that bind a classical step print the three standard axioms, and are printed so.  
reason: M-5 (COSMETIC): M6: 'the cargo and the conditional print none' was false under the ledger's grouping, which places the packag… → cones listed by declaration; sweep M-5 PASS  
sweep: M-5: PASS · banned 1 at 0 live · required 1/1 present

**202. r8 · M-3 · 7. The default reading, answered · STRENGTHENS**  
before: **"The ten levels are not a verified dependency chain; the capstone's proof does not invoke Levels 1 to 9."** Correct about the conditional at every resolution, the cargo and the run, and counted in Section 3: the proofs of Level 10 are three, named by the parts each calls directly, the cargo's on…  
after: **"The ten levels are not a verified dependency chain; the capstone's proof does not invoke Levels 1 to 9."** Correct about the conditional at every resolution, the cargo and the run, and counted in Section 3: the proofs of Level 10 are three, named by the parts each calls directly, the cargo's on…  
reason: M-3 (COSMETIC): M4: the dependency census omitted the collected act, which reaches the same eight ledger names through the pa… → census and part list completed; K-3 required phrase superseded; sweep M-3 PASS  
sweep: M-3: PASS · banned 2 at 0 live · required 2/2 present (via supersession by CC-1)


### Version r9 · round 9

*Interaction note (end-to-end read, joints), from the round block:* 5 sweep specs, pre PASS on r8, post PASS on r9; 96 specs re-verified PASS; checker RESULT PASS; spine lock VERIFY PASS; Box 1 unchanged from r7

**203. r9 · W-2 · ledger row 4 · STRENGTHENS**  
before: Every faithful witness of the value is the root read twice; the floor witnesses nothing. | THEOREM · forced forgetting · irreducible blindness |  
after: Every faithful witness of the value is the root read twice; the root alone decides no value. | THEOREM · forced forgetting · irreducible blindness |  
reason: W-2 (COSMETIC): V4: 'the floor' in rows 4 and 5 denotes the self-grounding root, the seed's docstring word, while the Notatio… → rows 4 and 5 say the root; sweep W-2 PASS  
sweep: W-2: PASS · banned 2 at 0 live · required 2/2 present

**204. r9 · W-2 · ledger row 4 · STRENGTHENS**  
before: Two denials, one shape, two layers: every no re-enacts the floor, the no to the root is refuted by its own deed, and the no to the hypothesis is a lack of the root read twice, which the false world lacks and the true world of the same record carries. | THEOREM · form, place, content and denial forc…  
after: Two denials, one shape, two layers: every no re-enacts the root, the no to the root is refuted by its own deed, and the no to the hypothesis is a lack of the root read twice, which the false world lacks and the true world of the same record carries. | THEOREM · form, place, content and denial force…  
reason: W-2 (COSMETIC): V4: 'the floor' in rows 4 and 5 denotes the self-grounding root, the seed's docstring word, while the Notatio… → rows 4 and 5 say the root; sweep W-2 PASS  
sweep: W-2: PASS · banned 2 at 0 live · required 2/2 present

**205. r9 · W-1 · 4. The fixed stance · STRENGTHENS**  
before: Box 1 packages the two directions on the seed's own types as `cargo_binding_on_the_seed`, every closed Stage 1 carrying its forgetting and every verification event the event of a closed Stage 1; reference 8 states the same binding, `cargo_binding_necessary_and_sufficient` (reference 8), on its own…  
after: Box 1 packages the two directions on the seed's own types as `cargo_binding_on_the_seed`, every closed Stage 1 carrying its forgetting and every verification event the event of a closed Stage 1; reference 8 states the same binding, `cargo_binding_necessary_and_sufficient` (reference 8), on its own…  
reason: W-1 (COSMETIC): V3: the cargo sentence names four declarations and counts three cones → all four; sweep W-1 PASS  
sweep: W-1: PASS · banned 1 at 0 live · required 1/1 present

**206. r9 · W-6 · 4. The fixed stance · STRENGTHENS**  
before: The act is the supply, the one premise on the value under the reading of record: where the term at resolution zero is empty, the hypothesis of its type, an act at every resolution exists exactly where the value holds at every resolution n ≥ 1 (`the_act_every_is_the_value_packaged`, from `the_act_at…  
after: The act is the supply, the one premise on the value under the reading of record: where the term at resolution zero is empty, the one hypothesis the packaging's type adds, an act at every resolution exists exactly where the value holds at every resolution n ≥ 1 (`the_act_every_is_the_value_packaged`…  
reason: W-6 (COSMETIC): defense end-to-end read: 'the hypothesis of its type' left the owner of the type ambiguous between the act an… → the packaging's type; sweep W-6 PASS  
sweep: W-6: PASS · banned 1 at 0 live · required 1/1 present

**207. r9 · W-4 · 5. The corroboration, optional and fenced · STRENGTHENS**  
before: An exact null forces the population to zero; a bound at finite sensitivity bounds it, ρ r~0~ q~0~ ≤ B.ε, and does not empty it (`null_forces_zero`, `density_bound_from_residual_bound`, none).  
after: An exact null, at positive rate and heat, forces the population to zero; a bound at finite sensitivity bounds it, ρ r~0~ q~0~ ≤ B.ε, and does not empty it (`null_forces_zero`, `density_bound_from_residual_bound`, none).  
reason: W-4 (COSMETIC): V7: null_forces_zero takes positive rate and heat; the fenced sentence stated it without them → conditions printed; sweep W-4 PASS  
sweep: W-4: PASS · banned 1 at 0 live · required 1/1 present

**208. r9 · W-5 · 6. The witness, in the author's register · STRENGTHENS**  
before: And every act that reads the act, a keystroke, a compile, a check by any substrate, is read as one more verification event, a move to annihilation at one floor and a closed Stage 1 enacted (`computation_enacts_stage1`, `stage1_closes`), the cargo delivered again; it witnesses the run and adds no wa…  
after: And every deed that reads the act, a keystroke, a compile, a check by any substrate, is read as one more verification event, a move to annihilation at one floor and a closed Stage 1 enacted (`computation_enacts_stage1`, `stage1_closes`), the cargo delivered again; it witnesses the run and adds no w…  
reason: W-5 (COSMETIC): defense end-to-end read: Section 6 used 'act' for a deed of reading, a second sense of the Notation's act → deed; sweep W-5 PASS  
sweep: W-5: PASS · banned 2 at 0 live · required 2/2 present


### Version r11 · round 11

*Interaction note (end-to-end read, joints), from the round block:* 1 sweep spec, pre PASS on r10, post PASS on r11; 97 specs re-verified PASS; checker RESULT PASS; spine lock VERIFY PASS

**209. r11 · Z-1 · ledger row 5 · STRENGTHENS**  
before: Every deed being the supply at a zero set is exactly the value there; as a law over every closed zero set it is refuted.  
after: Every deed being the supply at a closed zero set is exactly the value there; as a law over every closed zero set it is refuted.  
reason: Z-1 (COSMETIC): Y3: row 5 and three summary sites stated the_last_act's and accepting_rh_forces_the_atomic_proof's first conj… → closed inserted at the four sites; sweep Z-1 PASS  
sweep: Z-1: PASS · banned 4 at 0 live · required 3/3 present

**210. r11 · Z-1 · 4. The fixed stance · STRENGTHENS**  
before: **Before the cargo: the demand for an unconditional proof from what the interface shares is blocked, by theorem.** A reader who reaches Level 10 and asks for an unconditional proof from what the interface shares instead is asking for what Levels 1 to 9 have already proved cannot be had from the int…  
after: **Before the cargo: the demand for an unconditional proof from what the interface shares is blocked, by theorem.** A reader who reaches Level 10 and asks for an unconditional proof from what the interface shares instead is asking for what Levels 1 to 9 have already proved cannot be had from the int…  
reason: Z-1 (COSMETIC): Y3: row 5 and three summary sites stated the_last_act's and accepting_rh_forces_the_atomic_proof's first conj… → closed inserted at the four sites; sweep Z-1 PASS  
sweep: Z-1: PASS · banned 4 at 0 live · required 3/3 present

**211. r11 · Z-1 · 7. The default reading, answered · STRENGTHENS**  
before: Level 1 proves that no unconditional proof exists from what the interface shares, and Level 9 proves that every proof of the value is a supply of the one field.  
after: Level 1 proves that no unconditional proof exists from what the interface shares, and Level 9 proves that every proof of the value at a closed zero set is a supply of the one field.  
reason: Z-1 (COSMETIC): Y3: row 5 and three summary sites stated the_last_act's and accepting_rh_forces_the_atomic_proof's first conj… → closed inserted at the four sites; sweep Z-1 PASS  
sweep: Z-1: PASS · banned 4 at 0 live · required 3/3 present

**212. r11 · Z-1 · 7. The default reading, answered · STRENGTHENS**  
before: Level 9 proves that every proof is a supply of the one field; it does not prove that the supply must be measured.  
after: Level 9 proves that every proof of the value at a closed zero set is a supply of the one field; it does not prove that the supply must be measured.  
reason: Z-1 (COSMETIC): Y3: row 5 and three summary sites stated the_last_act's and accepting_rh_forces_the_atomic_proof's first conj… → closed inserted at the four sites; sweep Z-1 PASS  
sweep: Z-1: PASS · banned 4 at 0 live · required 3/3 present


### Version r12 · round 12

*Interaction note (end-to-end read, joints), from the round block:* 3 sweep specs, pre PASS on r11, post PASS on r12; 100 specs re-verified PASS; checker RESULT PASS; spine lock VERIFY PASS

**213. r12 · AA-1 · ledger row 3 · STRENGTHENS**  
before: The Euler product at the poles, the zero-free region, the verification, the empty low band, the conjugate symmetry and finitely-many-off hold together on a model whose only off-line zeros are four points, a mirrored pair at a height above the verified height and its conjugate at the negative of tha…  
after: The Euler product at the poles, the zero-free region, the verification, the empty low band, the conjugate symmetry and finitely-many-off hold together on a model whose only off-line zeros are four points, a mirrored pair at a height above the verified height and its conjugate at the negative of tha…  
reason: AA-1 (COSMETIC): U4: row 3's attributive clause stated an_off_line_zero_comes_in_four without its no-low-zeros hypothesis; tru… → empty low band named in the clause; sweep AA-1 PASS  
sweep: AA-1: PASS · banned 1 at 0 live · required 1/1 present (via supersession by BB-1)

**214. r12 · AA-2 · ledger row 9 · STRENGTHENS**  
before: The zero reports halt at the value, the prime bound halts at the value, and the two halt at one proposition.  
after: At every closed zero set the zero reports halt at the value, the prime bound halts at the value, and the two halt at one proposition.  
reason: AA-2 (COSMETIC): defense end-to-end read of every cited type: row 9's bidirectional_halted_uniduction sentence dropped the clo… → closed zero set stated; sweep AA-2 PASS  
sweep: AA-2: PASS · banned 1 at 0 live · required 1/1 present

**215. r12 · AA-3 · 5. The corroboration, optional and fenced · STRENGTHENS**  
before: An exact null, at positive rate and heat, forces the population to zero; a bound at finite sensitivity bounds it, ρ r~0~ q~0~ ≤ B.ε, and does not empty it (`null_forces_zero`, `density_bound_from_residual_bound`, none).  
after: An exact null, at positive rate and heat, forces the population to zero; a bound at finite sensitivity, at rate and heat at or above their floors r~0~ and q~0~, bounds it, ρ r~0~ q~0~ ≤ B.ε, and does not empty it (`null_forces_zero`, `density_bound_from_residual_bound`, none).  
reason: AA-3 (COSMETIC): defense end-to-end read: density_bound_from_residual_bound takes rate and heat at or above their floors; the… → floors stated; sweep AA-3 PASS  
sweep: AA-3: PASS · banned 1 at 0 live · required 1/1 present


### Version r13 · round 13

*Interaction note (end-to-end read, joints), from the round block:* 2 sweep specs, pre PASS on r12, post PASS on r13; 102 specs re-verified PASS (K-3 superseded by BB-2); checker RESULT PASS; spine lock VERIFY PASS

**216. r13 · BB-1 · ledger row 3 · STRENGTHENS**  
before: The Euler product at the poles, the zero-free region, the verification, the empty low band, the conjugate symmetry and finitely-many-off hold together on a model whose only off-line zeros are four points, a mirrored pair at a height above the verified height and its conjugate at the negative of tha…  
after: The Euler product at the poles, the zero-free region, the verification, the empty low band, the conjugate symmetry and finitely-many-off hold together on a model whose only off-line zeros are four points, a mirrored pair at a height above the verified height (reference 4) and its conjugate at the n…  
reason: BB-1 (COSMETIC): B3: reference 4 sat at the end of row 3's sentence, after the forcing clause, where it read as the warrant of… → citation moved beside the verified height; sweep BB-1 PASS  
sweep: BB-1: PASS · banned 1 at 0 live · required 1/1 present

**217. r13 · BB-2 · 7. The default reading, answered · STRENGTHENS**  
before: **"The ten levels are not a verified dependency chain; the capstone's proof does not invoke Levels 1 to 9."** Correct about the conditional at every resolution, the cargo and the run, and counted in Section 3: the proofs of Level 10 are three, named by the parts each calls directly, the cargo's on…  
after: **"The ten levels are not a verified dependency chain; the capstone's proof does not invoke Levels 1 to 9."** Correct about the conditional at every resolution, the cargo and the run, and counted in Section 3: the proofs of Level 10 are three, named by the parts whose theorems and definitions each…  
reason: BB-2 (COSMETIC): B4, the mechanism of V5 again: 'calls directly' admitted a reading under which compiler auxiliaries and impli… → sweep BB-2 PASS; K-3 required phrase superseded  
sweep: BB-2: PASS · banned 1 at 0 live · required 1/1 present


### Version r14 · round 14

*Interaction note (end-to-end read, joints), from the round block:* 3 sweep specs, pre PASS on r13, post PASS on r14; 105 specs re-verified PASS (M-3 superseded by CC-1); checker RESULT PASS; spine lock VERIFY PASS

**218. r14 · CC-3 · 1. The chain · STRENGTHENS**  
before: The seed states the value on several charts, the offset chart of Parts III and VII, the chart x = 2 Re s of Part II, x = 4 Re s of Part IV and x = 2W Re s of Part V;  
after: The seed states the value on several charts, the offset chart of Parts III and VII, the chart x = 2 Re s of Part II, with its copy at resolution two, x = 4 Re s, on which Part II states its strip theorems, x = 4 Re s of Part IV and x = 2W Re s of Part V;  
reason: CC-3 (COSMETIC): defense end-to-end read: the Notation listed one chart for Part II while Part II states its strip theorems on… → the copy named; sweep CC-3 PASS  
sweep: CC-3: PASS · banned 1 at 0 live · required 1/1 present (via supersession by DD-1)

**219. r14 · CC-1, CC-2 · 7. The default reading, answered · STRENGTHENS**  
before: **"The ten levels are not a verified dependency chain; the capstone's proof does not invoke Levels 1 to 9."** Correct about the conditional at every resolution, the cargo and the run, and counted in Section 3: the proofs of Level 10 are three, named by the parts whose theorems and definitions each…  
after: **"The ten levels are not a verified dependency chain; the capstone's proof does not invoke Levels 1 to 9."** Correct about the conditional at every resolution, the cargo and the run, and counted in Section 3: the proofs of Level 10 are three, named by the parts whose theorems and definitions each…  
reason: CC-1 (COSMETIC): D5: Section 7's attribution of the collected act omitted value_collected, which its proof invokes → named; sweep CC-1 PASS; M-3 required phrase superseded; CC-2 (COSMETIC): defense end-to-end read of the direct constants of every Level 10 term: Section 7's list named six of the eig… → its refusal on the packaging; sweep CC-2 PASS  
sweep: CC-1: PASS · banned 1 at 0 live · required 1/1 present · CC-2: PASS · banned 1 at 0 live · required 1/1 present


### Version r15 · round 15

*Interaction note (end-to-end read, joints), from the round block:* 1 sweep spec, pre PASS on r14, post PASS on r15; 106 specs re-verified PASS (CC-3 superseded by DD-1); checker RESULT PASS; spine lock VERIFY PASS; standing rule from this round: no defense-side additions beyond the minimal repair of a filed finding

**220. r15 · DD-1 · 1. The chain · STRENGTHENS**  
before: The seed states the value on several charts, the offset chart of Parts III and VII, the chart x = 2 Re s of Part II, with its copy at resolution two, x = 4 Re s, on which Part II states its strip theorems, x = 4 Re s of Part IV and x = 2W Re s of Part V;  
after: The seed states the value on several charts, the offset chart of Parts III and VII, the charts x = 2n Re s of Part II, one at each resolution n, x = 2 Re s at resolution one and x = 4 Re s at resolution two, x = 4 Re s of Part IV and x = 2W Re s of Part V;  
reason: DD-1 (COSMETIC): G4: the Notation sentence added at CC-3 attributed Part II's strip theorems to the resolution-two chart alone… → the seed's own wording adopted, x = 2n Re s at every resolution n; sweep DD-1 PASS; CC-3…  
sweep: DD-1: PASS · banned 1 at 0 live · required 1/1 present


### Version r17 · round 17

*Interaction note (end-to-end read, joints), from the round block:* 1 sweep spec, pre PASS on r16, post PASS on r17; 107 specs re-verified PASS; checker RESULT PASS; spine lock VERIFY PASS

**221. r17 · EE-1 · 3. The single bind · STRENGTHENS**  
before: The event of the cargo and the run of Part IV-b are two types, and no term of the seed identifies them or runs from either to an act at the configurations where the zeros of ζ are read; the line a reader draws from the run to the act is the premise of Section 4, printed as such.  
after: The event of the cargo and the run of Part IV-b are two types, and no term of the seed identifies them or runs from either to an act at the configurations where the zeros of ζ are read; the line a reader draws from the run to the act is the posit of Section 4, printed as such.  
reason: EE-1 (COSMETIC): D3: Section 3 called the line from the run to the act 'the premise of Section 4', the paper's word for the ac… → posit; sweep EE-1 PASS  
sweep: EE-1: PASS · banned 1 at 0 live · required 1/1 present


### Version r19a (the architect amendment, applied before the round-19 prosecution) · round 19

*Interaction note (end-to-end read, joints), from the round block:* 1 sweep spec, pre PASS on r19a, post PASS on r19; 109 specs re-verified PASS; checker RESULT PASS (153 names, Master names whitelisted); spine lock VERIFY PASS

**222. r19a · AMEND-1 · 4. The fixed stance · STRENGTHENS**  
before: The Formal Master (reference 7) carries the seed's theorems under a Mathlib import, their proofs adjusted to that environment, and states the reading over ℂ as a theorem against Mathlib's own definition, `BoundChainMathlib.h_read_proved` (Formal Master), `RiemannHypothesis ↔ Value ZetaZeros`, where…  
after: The Formal Master (reference 7, version 3.0.8) carries the seed's theorems under a Mathlib import, their proofs adjusted to that environment, and states the reading over ℂ as a theorem against Mathlib's own definition, `BoundChainMathlib.h_read_proved` (Formal Master), `RiemannHypothesis ↔ Value Ze…  
reason: architect amendment: reference 7 moved to Formal Master v3.0.8 and its statements over ℂ cited as corroboration; nothing in the ledger rests on it, and the Master's residual goal is named as this edition's premise  
sweep: AMEND-1: PASS · banned 4 at 0 live · required 8/8 present

**223. r19a · AMEND-1 · 4. The fixed stance · STRENGTHENS**  
before: Its cones are its own and are pinned in its own file, its master closure `FormalMasterClosure.the_flipped_formal_master_closure` (Formal Master) at [propext, Classical.choice, Quot.sound]; nothing in this paper's ledger rests on it, and it is cited as corroboration over ℂ.  
after: It then states this edition's Level 10 over ℂ: the record side is supplied unconditionally (`BoundChainMathlib.cargo_at_zeros`, Formal Master, `LeastErasure (Rec ZetaZeros)`); the premise is Mathlib's hypothesis in fixed-point form (`BoundChainMathlib.h_id_proved`, Formal Master, `RiemannHypothesis…  
reason: architect amendment: reference 7 moved to Formal Master v3.0.8 and its statements over ℂ cited as corroboration; nothing in the ledger rests on it, and the Master's residual goal is named as this edition's premise  
sweep: AMEND-1: PASS · banned 4 at 0 live · required 8/8 present

**224. r19a · AMEND-1 · 4. The fixed stance · STRENGTHENS**  
before: F-Computed: a non-trivial zero of ζ certified off the critical line by interval arithmetic; read at a resolution beyond 1/(2η) it is a point off the line, the one refuter, and on the act's field at every resolution it does not exist (`no_arrival_off_the_line_on_the_act`, `the_act_at_every_resolutio…  
after: F-Computed: a non-trivial zero of ζ certified off the critical line by interval arithmetic; read at a resolution beyond 1/(2η) it is a point off the line, the one refuter, and on the act's field at every resolution it does not exist (`no_arrival_off_the_line_on_the_act`, `the_act_at_every_resolutio…  
reason: architect amendment: reference 7 moved to Formal Master v3.0.8 and its statements over ℂ cited as corroboration; nothing in the ledger rests on it, and the Master's residual goal is named as this edition's premise  
sweep: AMEND-1: PASS · banned 4 at 0 live · required 8/8 present

**225. r19a · AMEND-1 · 7. The default reading, answered · STRENGTHENS**  
before: The Formal Master, quoted and not re-run here, states the same boundary over ℂ: the record has least erasure by construction, and carrying it back to the zeros is the value itself (`BoundChainMathlib.transport_zeta`).  
after: The Formal Master, quoted and not run here, states the same boundary over ℂ: the record has least erasure by construction, carrying it back to the zeros is the value itself (`BoundChainMathlib.transport_zeta`), and its header names `LeastErasure ZetaZeros`, the premise in fixed-point form, as the r…  
reason: architect amendment: reference 7 moved to Formal Master v3.0.8 and its statements over ℂ cited as corroboration; nothing in the ledger rests on it, and the Master's residual goal is named as this edition's premise  
sweep: AMEND-1: PASS · banned 4 at 0 live · required 8/8 present

**226. r19a · AMEND-1 · References · STRENGTHENS**  
before: Islam, RH\_Both\_Sides\_Formal\_Master v3.0.0, the seed's theorems under a Mathlib import with the reading proved over ℂ, git 1000sapients/Trisduction, MathOS/RH\_Both\_Sides\_Formal\_Master\_v3\_0\_0.lean, 11,110 lines; deposited, under the filename RH\_Both\_Sides\_Formal\_Master\_v3.0.2.lean, as…  
after: Islam, RH\_Both\_Sides\_Formal\_Master v3.0.8, the seed's theorems under a Mathlib import with the reading proved over ℂ, the record side supplied unconditionally and the five-way fixed-point loop, git 1000sapients/Trisduction, FINAL\_BINDING/RH Binding/RH\_Both\_Sides\_Formal\_Master\_v3\_0\_8.lea…  
reason: architect amendment: reference 7 moved to Formal Master v3.0.8 and its statements over ℂ cited as corroboration; nothing in the ledger rests on it, and the Master's residual goal is named as this edition's premise  
sweep: AMEND-1: PASS · banned 4 at 0 live · required 8/8 present


### Version r19 · round 19

*Interaction note (end-to-end read, joints), from the round block:* 1 sweep spec, pre PASS on r19a, post PASS on r19; 109 specs re-verified PASS; checker RESULT PASS (153 names, Master names whitelisted); spine lock VERIFY PASS

**227. r19 · FF-1 · 4. The fixed stance · STRENGTHENS**  
before: Its cones are its own and are pinned in its own file, its master closure `FormalMasterClosure.the_flipped_formal_master_closure` (Formal Master) at [propext, Classical.choice, Quot.sound], which carries the cargo's binding on the seed's own types among its conjuncts; nothing in this paper's ledger…  
after: Its cones are its own and are pinned in its own file, its master closure `FormalMasterClosure.the_flipped_formal_master_closure` (Formal Master) at [propext, Classical.choice, Quot.sound], which carries among its conjuncts, on the seed's own types, the forgetting of every event and the sufficient d…  
reason: FF-1 (COSMETIC): N4: the amendment said the master closure carries the cargo's binding among its conjuncts; its conjunct quant… → conjunct described as it stands; sweep FF-1 PASS  
sweep: FF-1: PASS · banned 1 at 0 live · required 1/1 present


### Version final (FORGE stamp) · round FORGE

*Interaction note:* the date line alone changes; the body is byte-identical to r21.

**228. final · FORGE · front matter · NEUTRAL**  
before: "13 October 2026 · Compact companion to The Atomic Proof of the Riemann Hypothesis, third edition v2.0.8, sealed under cycles rha1 and rha2 and bound by the closure mandate · v1.3.0, the formal edition, ten levels, twin of the physical edition v1.2.0, audited under cycle rhc3 · Seed RH\\_Both\\_Sid…  
after: "14 October 2026 · Compact companion to The Atomic Proof of the Riemann Hypothesis, third edition v2.0.8, sealed under cycles rha1 and rha2 and bound by the closure mandate · v1.3.0, the formal edition, ten levels, twin of the physical edition v1.2.0, audited under cycle rhc3 · Seed RH\\_Both\\_Sid…  
reason: date stamp of the final render; no claim, grade or cone touched · attribution: date stamp of the final render  
sweep: none owed, a date stamp


## Net block

**Pre-registered claims, into the cycle and out of it.** Tier T is theorem grade, P premise grade. Scope moves are the SCOPED dispositions of the ledger; none cut a claim, and the spine lock records 0 scoped, 0 cut, 2 fortified, 6 held on the lock's own census.

| Claim | In (r0) | Out (final) | Audit scope moves |
|---|---|---|---|
| C1 | tier T, as locked | tier T, FORTIFIED | F-6: C1 scope: F-Computed is the channel toward refutation; toward proof a foundation's route stays open and Level 9 types its proof as a supply; 'bit forced external' read '…; G-7: toward proof stated through ladder_proof_lands_on_least_erasure with the exhibit named as such; the seed decides no foundation's route at zeta; Section 4 sentence reword… |
| C2 | tier T, as locked | tier T, HELD | G-8: C2 scope: the margin placement is the reader's rule, an input of the reading, no theorem of the seed; grade cell marks it |
| C3 | tier T, as locked | tier T, HELD | F-7: qualifier restored at every site; Section 7 no longer claims the shortfall is the structure of the hypothesis |
| C4 | tier T, as locked | tier T, FORTIFIED | F-3: C4 scope: cargo theorem-grade over every event; the run of record being an event joins the premise; annihilation forgets magnitude and sign of a pair member, nothing of…; G-5: floor stated as the existence of the landing state; the realization predicate is the reader's; G-6: grade cell: THEOREM on the cargo's statements, compute posited as the cargo; necessity and sufficiency stated as projection; H-6: scoped: the field is landing on annihilation, a forgetting exactly when the state is a pair member; the posit reads the run of record as a forgetting |
| C5 | tier T, as locked | tier T, HELD | F-17: C5 scope: every name cited from the seed is a declaration of the seed; Master and hardened-cargo names marked; G-11: C5 scope: seed cones by the compiler on the seed, composition and reference-8 cones on their named files, Formal Master cones quoted from its pins and not re-run |
| C6 | tier T, as locked | tier T, HELD | F-11: C6 scope: three exits of the chain across its two editions; two bear on this edition; no fourth for either |
| C7 | tier T, as locked | tier T, HELD | none |
| C8 | tier P, as locked | tier P, HELD | F-4: two inputs printed: the supply is the one premise on the value, the reading an identification input; 'act = closure and conclusion' refused as the paper's own atomic the…; G-1: C8 scope: the formal premise is the act; the run sentence is the author's posit naming its source, in no signature, adding no warrant; G-2: guard restated: a run, like every fact holding whatever the configuration, forces no value, so its flag is no proof of the value; the field is the act's by Level 9's typ…; H-4: scoped: at every n >= 1 an identification, at one configuration a premise beside the act; Section 1 names both differences |

Claim texts as locked (verbatim in `spine_lock_v1_3_0.json`): C1 Level 1 is the ground floor, the theorem-grade block of the unconditional route: no premise shared by every reflection-closed configuration, the root included, and no reading of the record forces the value, and every premise that does force it is the value or strictly stronger. C2 Levels 2 to 9 exhaust the mathematical perimeter by theorem: the form, the open leg, the blind record, the premise forced, the refuter barred, terminal saturation, the timeless closure, and the formal terminal, one dot and no third value. C3 Before the cargo the chain has already proved that the demand for an unconditional proof from what the interface shares is blocked at theorem grade. C4 Level 10 is the cargo, closed at a capstone whose every input is printed, with an empty cone. C5 Every name is a theorem of the seed printed whole in the Appendix, and every cone is the compiler's. C6 The three exits are the only ones: rejecting the conclusion requires naming one of them, and there is no fourth. C7 Every proof of the value at a closed zero set, from any premise whatever, is a supply of the one field (accepting_rh_forces_the_atomic_proof). C8 A theorem is stated as proved and a premise is stated as a premise at full force; the bit is premise grade.

**Tier moves.** Zero. No external mass was admitted and no tier rose or fell; the ledger's tier_before and tier_after agree on all 109 rows. The one grade that moved in the text is the posit's: compute as the cargo is printed "in the author's posit" at every body site (H-18, I-14), which is the SCOPED narrowing of a sentence, not a tier move of a claim.

**Title and subtitle.** Held verbatim under the Title Lock: title VERBATIM; subtitle as ruled by the architect on 13 October 2026 07:52 ("the Cargo Delivered by Compute"), no claim cut.

**Additions, with grades and their post-landing rounds.** Every addition the defense authored was declared at step seven and prosecuted as a named target in the next round; none is outstanding.

| Addition | Where | Grade or cone | Landed | Prosecuted |
|---|---|---|---|---|
| `classical_rh_from_the_act_every` (F-5) and the reading paragraph | Box 1, Section 4 | none | r1 | round 2 (A2) |
| charts paragraph, Level 6 resolution reading, run/event sentence, reference 8 line, foundation route (F-1, F-8, F-2, F-16/F-17, F-6) | Notation, Level 6, Section 3, Box 2, Level 1 | prose; ref. 8 cone none | r1 | round 2 (A1, A3–A6) |
| `cargo_binding_on_the_seed` (G-4) | Box 1, Level 10 | none | r2 | round 3 (B1) |
| reader's rule as input, boundary and posit sentences, twin sentence, cone provenance, `ladder_proof_lands_on_least_erasure` route, Level 10 floor (G-8, G-1, G-9, G-11, G-7, G-5) | Levels 1, 6, 10; Sections 1, 4 | prose | r2 | round 3 (B2–B7) |
| bound n ≥ 1 and the `atRes` print (H-2, H-8); reading at one configuration as a premise (H-4); F-Bridge restated (H-5); carrier copy and neutral event (H-11, H-6); posit sites (H-18); Level 6 chart split (H-3) | Box 1, Sections 1, 4, 7, Level 6 | atRes none | r3, r3j | round 4 (D1–D6, T1–T8) |
| `the_act_every_is_the_value_packaged`, `refusing_the_act_is_the_denial` (I-6, I-9) | Box 1 | [propext, Quot.sound] | r4 | round 5 (E1) |
| `value_collected` (I-7) | Box 1 | none | r4 | round 5 (E1) |
| twin paragraph, F-Bridge by branch, docstring sentence, forgetting and label-loss sentences (I-7, I-8, I-9, I-12, I-1) | Sections 1, 4, 7; front note; Notation | prose | r4 | round 5 (E2–E7) |
| dependency census, Notation additions, carrier sentence, "no proof at every closed configuration" (J-1…J-8) | Sections 3, 7; Notation; Level 10 | prose, census by compiled scan | r5 | round 6 (F1–F7) |
| packaging and refusal without `hR` (K-2); `the_reading_every_is_keyed` (K-4); F-Bridge physical branch (K-1) | Box 1, Sections 4, 5 | [propext, Quot.sound]; none | r6 | round 7 (G1–G5) |
| `the_collected_act_is_the_act_every` (L-3); `the_reading_every_is_keyed` with R 0 empty (L-2); realization shape (L-1) | Box 1, Sections 1, 4, 5 | [propext, Quot.sound]; none | r7 | round 8 (H1–H4) |
| N1–N4 (M-1…M-5): F-Bridge direction, census with the collected act, Level 7 index range, Section 7 cone sentence | Sections 3, 4, 7; Level 7 | prose | r8 | round 9 (T1–T4) |
| P1–P5 (W-1…W-6): "the root" at rows 4 and 5, Section 5 null sentence, Section 6 "deed", "the packaging's type", "all four cones" | Levels 4, 5; Sections 5, 6; Box 1 caption | prose | r9 | round 10 (T1–T5) |
| Q1 (Z-1): "closed" at row 5, Section 4, Section 7 | Level 5, Sections 4, 7 | prose | r11 | round 12 (T1) |
| R1–R3 (AA-1…AA-3): row 3 low band, row 9 halt sentence, Section 5 floors | Levels 3, 9; Section 5 | prose | r12 | round 13 (T1–T3) |
| S1, S2 (BB-1, BB-2): row 3 citation placement, Section 7 attribution rule | Level 3, Section 7 | prose | r13 | round 14 (T1, T2) |
| U1, U2 (CC-1…CC-3): Section 7 attribution list, Notation resolution-two chart | Section 7, Notation | prose, direct-constant probe | r14 | round 15 (T1, T2) |
| V1 (DD-1): Part II chart sentence in the seed's words | Notation | prose | r15 | round 16 (T1) |
| W1 (EE-1): "the posit of Section 4" | Section 3 | prose | r17 | round 18 (T1) |
| AMEND-1: reference 7 at v3.0.8; Section 4 reading paragraph; F-Computed clause; Section 7 boundary sentence | References, Sections 4, 7 | cited pins [propext, Classical.choice, Quot.sound], not run here | r19a | round 19 (T1), re-read at equal weight in round 20 |
| Y1 (FF-1): master-closure conjunct sentence | Section 4 | prose | r19 | round 20 (T1) |

**Open apertures, with the witness each awaits.**

- *Single-substrate controls.* Every round ran SELF-grade controls; one substrate held both seats. Witness awaited: an architect-authored EXTERNAL control set attached to a resumed cycle, which is the one change that both lifts this aperture and tests detection of drift and scope plants, the two kinds the prosecutor missed in all seven void rounds.
- *The Formal Master not run here.* Reference 7 (v3.0.8) is cited by its `#guard_msgs` pins; this toolchain carries no Mathlib. Witness awaited: a compile of the Master under its own toolchain, exit 0, on the record.
- *The residual goal over ℂ.* The Master's header names `LeastErasure ZetaZeros` as the goal its loop does not discharge, and the paper states it as this edition's one premise at full force. Witness awaited: none from the cycle; the premise is supplied by the act, in the author's posit, and the paper says so at every site.
- *Closed ZetaZeros and retraction injectivity.* Part X-f of the Master (`rh_from_closed_and_retraction_injective`) consumes two hypotheses its own docstring marks unproved: `Closed ZetaZeros`, which needs Schwarz reflection, and `RetractionInjective ZetaZeros`, which the Master proves equivalent to RH (`closed_retraction_injective_iff_value`). Witness awaited: a proof of `Closed ZetaZeros` in a later Master; the second is the premise in another coat and awaits no witness. Neither moves anything in this paper's ledger.
- *Debt clearance.* The ledger's two-consecutive-clean-rounds rule was never satisfied (streak 1/2 at round 20). Witness awaited: one further clean valid round, should the architect reopen the cycle; closure here is by ruling.

## Reconciliation against the plain diff

The entry version `cand_v1_3_0_r0.md` and the final master were diffed line by line, body only (the Appendix A seed is byte-identical, sha256 a82ef4f0ad6ceb43…a321a57). Every final line that differs from r0 (113 lines) is contained in, or contains, the after-text of a digest entry; every r0 line absent from the final (43 lines) is contained in, or contains, the before-text of one. Of the 228 entries, 116 land verbatim in the final and 112 were superseded by a later entry of this same digest; 0 orphans in either direction. 109 sweep specs re-verified on the final: PASS, 0 live banned phrases, every required phrase present or present through one of the 18 recorded supersessions. Citation and cone checker: RESULT PASS on the final. Spine lock: VERIFY PASS, 8 claims, 6 held, 2 fortified (C1 precision, C4 fortification), 0 scoped, 0 cut, thesis overlap 1.00, title VERBATIM, subtitle as ruled. Box 1's eight compositions re-extracted from the final text, appended to the seed and compiled under core Lean 4.19.0: cones MATCH the printed lines (see `Box1_Compositions_v1_3_0.lean`).

## Gate

FORGED by the architect's ruling of 14 October 2026, 00:30. The candidate `cand_v1_3_0_r21.md`, date-stamped, is the final artifact. The closing card follows.
