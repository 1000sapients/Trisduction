# AUDIT_LOG · The Riemann Hypothesis in Toto at the Apex · FORGE self-audit record

Artifact under audit: the Markdown master of the apex edition, entry version `RH_Apex_v1_0_0.md` (2026-09-23), Lean file `RH_At_The_Apex.lean` embedded whole in its Appendix B and re-embedded at every version.
Skill: trisduction-audit-cycle v2.3.3, mode two ("start default audit cycle. FORGE."), AUTORUN, SELF-grade controls throughout (no controls JSON was attached), seed default, three tools extracted from the skill and run from `apex/audit/`.
Two cycles were run. Cycle `rhapex` closed HALT-DIVERGENT at round 4 on the evaluator's rising-earned rule; the candidate was reconstructed as v1.1.0 (propagation of the cycle's own scopings, no new claim) and cycle `rhapex2` closed SEALED-ROUND at round 3 on it, control-grade floor SELF, single-substrate aperture stamped. Both ledgers, every control set, every prosecution, every sweep spec, every seeded copy, and every version are in `audit_bundle_rhapex.zip`.
This log lives beside the paper and never inside it.

---

## CYCLE 1 · rhapex · entry v1.0.0

Pre-registered claims (Defense, A4), one falsifier each, locked at the close of round 1:

| claim | statement | falsifier (minimal check) |
|---|---|---|
| C1 | Theorem A: Fix(σ) on ℍ_ℤ is the scalar line, every quaternion | an integer quaternion fixed by σ with a nonzero imaginary component, or a scalar not fixed; decide in Lean |
| C2 | Theorem C: the three seats are one point; identity cone, apex unique | one of the three rfl identities failing, or two cones over D with distinct apexes |
| C3 | Theorem C′: φ equivariant with Fix(τ) ↔ Fix(σ), every resolution m | a stage point with σ(φ p) ≠ φ(τ p), or τp = p with σ(φ p) ≠ φ p |
| C4 | Theorem D: a present reader who supplies a bit is never interior, and by RAF-2 never exterior | a domain, a present point, a bit with live = open; or a registering non-member |
| C5 | Theorems E, F: (RA → L X) ↔ L X wherever RA holds; RA decides L on no frame | a frame with (RA → L X) and no L X under RA, or a kernel term of ∀X, RA → L X |
| C6 | Dual register: the apex never promotes the world row | a sentence deriving the world token from an apex theorem, or a theorem concluding L on ξ's frame |
| C7 | Theorem H under the stated definition of "in toto at the apex" | a clause of the hypothesis that is not the value on Z_ξ and is carried nowhere |

Boot: the defense phase carries the discipline by reference; the prosecuting passes never boot and display no marker. No numeric claim of the artifact depends on a boot chain; the Fidelity Lock is served by in-session recomputation (Python) at every round, printed in the prosecution files.

### Round 1 · kinematic + definitional

Header. Controls digest `4e9e86ef8dc4c38c`, grade SELF, three planted (ARITH §5, DRIFT §8, SCOPE §11). Errata block: none (first round). Declared targets: none.
Leak-scan: `prosecution_r1.md` CLEAN.

Findings (id · register · claim · mechanism · severity · minimal falsifier):
- F-1 · definitional · NONE · one symbol RAM names the grounding face and the proposition Nonempty(Ground) · STRUCTURAL · the two sentences side by side.
- F-2 · definitional · NONE · "bridge" in three senses with no declared split: the witness's Bridge capacity, the halting carrier of spine Thm 7, the equivariant map φ · STRUCTURAL · the three definitional sites.
- F-3 · definitional · NONE · "apex" as register and as cone vertex, coincidence undeclared · COSMETIC · first occurrence.
- Recomputations, no finding: dependency sets 43 = 31 + 12, lines 685, 2871 yJ, Theorem H's seven conjuncts.
- Controls caught, credited, no F-ids: X-K1 (deeds +2 against the file's +1), X-D1 ("sign" re-used for the per-zero offset), X-S1 (Conclusion widened to the sign).

Defense. F-1: conceded; the file already separates RAMFormalGround. F-2: conceded; the three objects are distinct and the text gave no rule. F-3: conceded; the coincidence is by design and was unstated.
Arbitration: F-1 EARNED, F-2 EARNED, F-3 EARNED (COSMETIC), all with the `--repaired` attestation after the sweeps.
Integration. Sweeps: `sweep_r1_F-1` PRE PASS (2 banned found) / POST PASS; `sweep_r1_F-2` PRE PASS (10 banned found) / first POST FAIL on 3 live "equivariant bridge" in the embedded Lean comments, propagated into the Lean source (comments only, recompiled exit 0, dependency sets unchanged 43/31, hash updated) / POST PASS; `sweep_r1_F-3` required-only (additive repair) POST PASS. End-to-end read: §3 Methodology, §6 (the seat), the Simple Rule box, §9 F2, §10, §11, §12, the disclosure, Appendix A, and the joint §3–§6 (the three bridge names against their first uses). Removal rulings: none removal-class. New material declared: one disambiguation sentence in §3 (three bridge names) and one sentence at §6.3 (two apex senses); both minimal repair text, no new claim.
Control reveal: 3/3 caught, grade SELF.
Statistics: admitted 3, EARNED 3, SCOPED 0, RS 0, RM 0, APERTURE 0, mass-bearing 3, prereg hits 0, repeats 0, tier raised 0.
New version: `RH_Apex_v1_0_1.md`.
VERDICT CONTINUE: mass-bearing findings remain; run the next round.

### Round 2 · parameter + provenance

Header. Controls digest `e5ec3d960e35b092`, SELF (ARITH §4, DRIFT §5, SCOPE §2). Errata: none. Declared targets: the two sentences added in round 1, prosecuted and found consistent (no finding).
Leak-scan: `prosecution_r2.md` CLEAN.

Findings:
- F-4 · parameter · NONE · the apex claims carry no criterion an observation about ξ could fire; F2, F3 typed as record checks, F1 world row · STRUCTURAL · name an observation-refutable apex claim.
- F-5 · parameter · C4 · the clause "never exterior" rests on RAF-2 supplied as a structure field, premise-grade per the source declaration, printed beside "no axioms" as if unconditional · STRUCTURAL · the closure field and the declaration's grade table.
- F-6 · provenance · NONE · closed authorship, one substrate for scribe, file author, and seats; controls in-session · STRUCTURAL · a recompile on a second substrate.
- F-7 · provenance · NONE · spine and rows study cited as unarchived manuscripts; kernel content re-proved in-file, vindication by citation · STRUCTURAL · an archival identifier.
- Controls caught: X-P1 (eighteen spine theorems against fifteen), X-S2 (Deligne carried over Q, against the Discussion), X-D2 (presence redefined as membership).

Defense. F-4: refused; the artifact types its criteria and claims no observational criterion for kernel theorems. F-5: conceded at the scope; the never-interior half is a kernel theorem, the never-exterior half is conditional on RAF-2 at premise grade. F-6, F-7: no in-session repair exists; the witnesses are named.
Arbitration: F-4 REFUSED-STRUCTURAL (attacks a claim not made); F-5 SCOPED, tier theorem → theorem-conditional on the never-exterior clause; F-6 APERTURE; F-7 APERTURE.
Integration. `sweep_r2_F-5` PRE PASS (5 banned found) / POST PASS; six sites repaired (the box, Theorem D, §5.2, Conclusion, the verdict, contribution 3). End-to-end read: §5.2, §7, the Simple Rule box, §11, §12, the contributions table, and the joint box–§7. No removal-class repair. No new material beyond the scope clauses.
Control reveal: 3/3, SELF.
Statistics: admitted 4, EARNED 0, SCOPED 1, RS 1, RM 0, APERTURE 2, mass-bearing 1, prereg hits 1 (C4), debt yes.
New version: `RH_Apex_v1_0_2.md`.
VERDICT CONTINUE-PREREG-BLOCK: 1 mass-bearing finding on a pre-registered claim; two consecutive clean valid rounds required before any seal.

### Round 3 · limit + symmetry

Header. Controls digest `0eaf447e94374523`, SELF (ARITH §2, DRIFT §6, SCOPE §8). Errata: none. Declared targets: none new from round 2.
Leak-scan: `prosecution_r3.md` CLEAN.

Findings:
- F-8 · limit · C3 · the embedding subsection named the analytic critical line where the theorem reaches the lattice line h = 1 · STRUCTURAL · the domain of φ in the file.
- F-9 · limit · NONE · the temperature limit of k_B T ln 2 vanishes; the artifact prices at a stated T and claims no floor at every T · COSMETIC · the bound's sentence.
- F-10 · symmetry · NONE · "seat" named the fixed locus (a line) and the point Γ_RH · STRUCTURAL · the two definitions.
- F-11 · symmetry · C2 · the apex is unique for the diagram of the ordered triad i·j·k at −1; the reversed triad k·j·i returns +1, also on the fixed locus; the printed uniqueness did not name its dependence on the triad's orientation · STRUCTURAL · compute (k·j)·i.
- Recomputations, no finding: the φ_m family at m = 1, Table 1 against Appendix B.
- Controls caught: X-L1 (height 3000 against 300), X-D3 (the Return as φ at the origin; φ(0,0) = ⟨0,−1,0,0⟩ ≠ Return), X-S3 (the universal extension as a kernel term).

Defense. F-8: conceded at scope; the lattice line is the theorem's reach, the analytic line by citation. F-9: refused, claim not made. F-10: conceded; seat for the locus, seat point for a point. F-11: conceded at scope; the file computes k·j·i = +1 by rfl; uniqueness is per orientation, the two apexes exchanged by an odd relabeling.
Arbitration: F-8 SCOPED (tier theorem → theorem, scope narrowed); F-9 REFUSED-STRUCTURAL; F-10 EARNED; F-11 SCOPED (tier theorem → theorem, scope per orientation).
Integration. Lean additions: `theReturnOdd`, `odd_return_is_plus_one`, `odd_return_on_fix`, `seat_points_differ`; comments "named critical seat" → "named seat point"; recompiled exit 0, dependency sets 45 = 33 + 12, 699 lines, hash updated. Sweeps: `sweep_r3_F-8` PRE PASS (1) / POST PASS; `sweep_r3_F-10` PRE PASS (3) / POST PASS; `sweep_r3_F-11` PRE PASS (2) / POST PASS. End-to-end read: abstract, §6.1–§6.4, the dual-register box, §11, §12, and the joints §6.3–§6.4 (seat point against φ(1,−1)) and abstract–§1. No removal-class repair. New material declared: the reversed-triad paragraph at §6.3 and the three Lean theorems; mandatory target for round 4.
Control reveal: 3/3, SELF.
Statistics: admitted 4, EARNED 1, SCOPED 2, RS 1, RM 0, APERTURE 0, mass-bearing 3, prereg hits 2 (C3, C2), debt yes.
New version: `RH_Apex_v1_0_3.md`.
VERDICT CONTINUE-PREREG-BLOCK.

### Round 4 · limit + symmetry (highest-yield pair restated, A3)

Header. Controls digest `c251023c4b9060e9`, SELF (ARITH §11, DRIFT §5, SCOPE §9). Errata: none. Declared target: the round-3 addition (the reversed-triad paragraph and its three theorems), prosecuted against the spine first.
Leak-scan: `prosecution_r4.md` CLEAN.

Findings:
- F-12 · symmetry · NONE · the added paragraph said the seat point's sign "is the bit the formal register cannot read", while `return_is_minus_one` and `odd_return_is_plus_one` compute that sign by rfl; the kernel reads the sign once the order is supplied and does not originate the order · STRUCTURAL · the two rfl theorems.
- F-13 · symmetry · NONE · the added paragraph asserted that every identity of Theorem C holds for the reversed triad, a theorem the file did not carry · STRUCTURAL · search the file for a cone at +1.
- Target checks, no finding: consistency with `orientation_blind` and with `cone_apex_unique`.
- Controls caught: X-S4 (F1 as a theorem of H), X-K2 ("two bits" against `freedom_is_exactly_two`), X-D4 (actuation redefined as registration).

Defense. F-12: conceded; "cannot read" replaced by "reads once supplied, originates never", the artifact's own Bridge account. F-13: conceded; the reversed identities, the reversed diagram's cone at +1, and the apexes-differ theorem added to the file, `Cone` generalized to `ConeOver D`.
Arbitration: F-12 EARNED; F-13 EARNED.
Integration. Lean additions: `ConeOver`, `Cone := ConeOver D3`, `D3odd`, `odd_self_gap_nonexistent`, `odd_register_gap_nonexistent`, `odd_object_gap_nonexistent`, `identity_cone_odd`, `apexes_differ_by_orientation`; recompiled exit 0, 47 = 35 + 12, 724 lines, hash updated. Sweeps: `sweep_r4_F-12` PRE PASS (1) / POST PASS; `sweep_r4_F-13` PRE PASS (1) / POST PASS. End-to-end read: §6.3 whole and the joint §6.3–§6.5 (the Prop placement of Ω against "originates never"). New material declared: the reversed cone theorems and the rewritten paragraph; mandatory target for the next round.
Control reveal: 3/3, SELF.
Statistics: admitted 2, EARNED 2, SCOPED 0, RS 0, RM 0, APERTURE 0, mass-bearing 2, prereg hits 0, repeats 0, tier raised 0.
New version: `RH_Apex_v1_0_4.md`.
VERDICT HALT-DIVERGENT: earned corrections rose across two consecutive valid rounds (0, 1, 2 over rounds 2–4); the artifact is not hardening, reconstruction is due.

### Cycle 1 · Pre-Forge Digest (v1.0.0 → v1.0.4), reconciled against the plain diff

Body hunks 17 + 6 + 7 + 2 = 32; appendix hunks 8 + 0 + 5 + 6 = 19; every hunk below traces to exactly one entry, no orphan in either direction.

1. R1/F-1 · §6.5 · "the formal Ground RAM := Nonempty(Ground)" → "the formal-Ground proposition G_RAM := Nonempty(Ground)", both sites · STRENGTHENS · one symbol one meaning; sweep PASS 0/0 banned, 1 required.
2. R1/F-2 · subtitle, keywords, §1, §3 (sentence added), §6 heading, §6.4 (two sentences), the Simple Rule box, Theorem H, §9 F2, §10 (two), §11, §12, disclosure, contributions row 14, positioning row, Appendix A, and the Lean comments (8 appendix hunks incl. the receipt line) · "bridge" for φ → "embedding" at 17 text sites; three names declared in §3 · STRENGTHENS · three objects, three names; sweep PASS after propagation into the Lean comments.
3. R1/F-3 · §6.3 · one sentence declaring the two senses of "apex" and their coincidence · NEUTRAL · a declaration, no claim; sweep PASS (required present).
4. R2/F-5 · the box, Theorem D, §5.2, §11, §12, contributions row 3 · "never exterior" made conditional on RAF-2 at premise grade; tier of that clause theorem → theorem-conditional · MIXED · the record is stronger and the clause's reach is narrower, and the digest says both; sweep PASS 5 banned at zero, 2 required present. Interaction note: the box and Theorem D adjoin; read end-to-end, the box's parenthetical and Theorem D's scope paragraph carry the same condition.
5. R3/F-8 · §6.4 · "the critical line under τ and the real line under σ" → "the stage's line h = 1, the lattice image of the critical line under the spine's chart, and the real line under σ", with the analytic line by citation · MIXED · the identification is exact at its true domain and the analytic line is no longer claimed as reached; sweep PASS.
6. R3/F-10 · §6.3, §6.4, the dual-register box, §11, Lean comments (2 appendix hunks) · "seat" reserved for the locus, "seat point" for Γ_RH and its kin · STRENGTHENS · a line and a point parted; sweep PASS 3 banned at zero.
7. R3/F-11 · §1, §11, §6.3 (paragraph inserted), Lean (`theReturnOdd`, three theorems, print lines, receipt: 45/33/699, hash) · uniqueness stated per ordered triad; the reversed triad's +1 exhibited · MIXED · uniqueness narrowed to its true scope and the orientation bit located at the seat point; sweep PASS 2 banned at zero, 2 required. Interaction note: entries 6 and 7 touch §6.3 in adjacent sentences; the joint was read whole after round 4's rewrite.
8. R4/F-12 · §6.3 · "it is the bit the formal register cannot read" → "the kernel reads it once the order is supplied ... and originates it never" · STRENGTHENS · a contradiction with two rfl theorems removed; sweep PASS.
9. R4/F-13 · §6.3, Lean (`ConeOver`, `D3odd`, five theorems, print lines, receipt: 47/35/724, hash) · the reversed-triad identities and cone carried by the file instead of asserted by the text · STRENGTHENS · a claimed theorem now a proved one; sweep PASS 1 banned at zero, 2 required. Interaction note with entry 8: same paragraph, read whole.
10. GAIN · disclosure and Appendix B header · receipt lines updated at each Lean change (43/31/685 → 43/31/685 hash only → 45/33/699 → 47/35/724) · NEUTRAL · the receipt tracks the file; each update traces to entries 2, 7, 9.

Net block. C1 theorem → theorem, scope unchanged. C2 theorem → theorem, scope narrowed to uniqueness per orientation (entry 7). C3 theorem → theorem, scope narrowed to the lattice line (entry 5). C4 theorem → theorem-conditional on RAF-2 for the never-exterior clause (entry 4); the never-interior clause theorem. C5, C6, C7 unchanged. Tier moves: one, downward, no external mass admitted, none claimed. Additions: the reversed-triad material, grade kernel theorem (all rfl or decide, no axioms); its post-landing prosecution: round 4 for the paragraph (found F-12, F-13, repaired) and no round for the round-4 rewrite, carried open per A5 at HALT-DIVERGENT. Open apertures: F-6 (second-substrate recompile and an architect-authored control set), F-7 (archival identifiers for the spine and the rows study).

### Cycle 1 · Closing card (after FORGE, pre-authorized in the triggering message)

Final version path: `RH_Apex_v1_0_4.md` (candidate at halt). Claims: as in the net block. Disposition census: EARNED 6, SCOPED 3, REFUSED-STRUCTURAL 2, REFUSED-MASSLESS 0, APERTURE 2, inadmissible 0; findings 13 over 4 rounds. Coverage: 6/6 (kinematic, definitional, parameter, provenance, limit, symmetry). Controls: 3/3 SELF at every round, floor SELF. Propagation: nine sweep specs, every one PRE PASS and POST PASS at final counts 0 banned / required present. Errata: none. Reversions at the gate: none (full-auto). Open apertures: F-6, F-7. What the artifact survived: held under all six registers with SELF controls three of three throughout, three claims scoped down, one clause lowered a tier, two apertures open; halted divergent at round 4 on the rising-earned rule, the rise being 0, 1, 2 earned repairs of which the last three fell on material the cycle itself added.

---

## RECONSTRUCTION · v1.0.4 → v1.1.0 (the HALT-DIVERGENT remedy)

No axiom, theorem, or claim was changed; the Lean file is byte-identical to the v1.0.4 embedding (SHA-256 `4118183cbb99cdc6...`, 47 dependency sets, 35 axiom-free, 724 lines). The reconstruction propagated the cycle's own scopings to the consumer sites the phrase-level sweeps had not banned, and bumped the version. Six body hunks, zero appendix hunks, each listed:

1. frontmatter · version 1.0.0 → 1.1.0.
2. abstract · "its apex unique" → "its apex unique per orientation of the triad" (propagation of entry 7).
3. Theorem H, hardened form · "with its unique apex" → "with its apex unique per orientation" (entry 7).
4. contributions row 7 · "the apex is unique" → "the apex is unique per orientation of the triad" (entry 7).
5. verdict table, gate 10 MTA · "unique apex, Thm C" → "unique apex per orientation, Thm C" (entry 7).
6. Appendix A · "three seats defined independently" → "three seat points defined independently" (entry 6); Movement 9 names the reversed triad's cone (entries 7, 9).

Every cycle-1 sweep spec re-verified on v1.1.0: nine of nine POST PASS.

---

## CYCLE 2 · rhapex2 · entry v1.1.0

Pre-registered claims C1–C7 as in cycle 1, C2, C3, C4 restated at their scoped reach, one falsifier each, locked at the close of round 1.

### Round 1 · kinematic + definitional
Controls digest `692b1fe61fa0b1b3`, SELF (ARITH §4, DRIFT §12, SCOPE §10). Errata: none. Declared targets: none at entry. Leak-scan CLEAN.
Recomputed live from the artifact's own appendices: Appendix B 724 lines, hash prefix `4118183cbb99cdc6` equal to the disclosure's; Appendix C 47 print lines, 35 axiom-free, 12 on propext/Quot.sound; 2871 yJ; seven conjuncts. Definitional re-check of every prior repair across abstract, body, boxes, tables, appendices: holds. "witness" in three compounds: raised and refused by the prosecution's own reading, no collision in use.
Controls caught: X-K1 ("one of four maps" against `freedom_is_exactly_two`), X-D1 (world row in compartment I), X-S1 ("the world row included").
Findings admitted: 0. Reveal 3/3 SELF. Version unchanged (v1.1.0). VERDICT CONTINUE-FLOOR: valid rounds 1/3.

### Round 2 · parameter + provenance
Controls digest `052c1140b4a4b746`, SELF (ARITH §10, DRIFT §4, SCOPE §1). Errata: none. Leak-scan CLEAN.
Findings: F-1 · provenance · NONE · closed authorship, in-session controls · APERTURE (witness: second-substrate recompile with an architect-authored control set). F-2 · provenance · NONE · unarchived spine and rows citations · APERTURE (witness: archival identifiers). Parameter census and demarcation: no finding.
Controls caught: X-P1 ("three positions superseded" against the table), X-S2 (the model as the extension), X-D2 (L(X) as nonemptiness, against Theorem F's proof).
Findings admitted: 2, both APERTURE, mass-bearing 0. Reveal 3/3 SELF. Version unchanged. VERDICT CONTINUE-FLOOR: valid rounds 2/3.

### Round 3 · limit + symmetry
Controls digest `3d77512250abe8ab`, SELF (ARITH §6, DRIFT §4, SCOPE §10). Errata: none. Declared target: the reversed-triad material as it stands after cycle 1 round 4, prosecuted against the spine first: the reads/originates sentence against the two rfl computations and the Bridge account, the reversed identities against `cone_apex_unique`, Theorem H's use of the −1 seat point against the paragraph's scope; no finding. Leak-scan CLEAN.
Limit: φ_m at m = 1 reduces to φ; Table 1 against Appendix B; temperature limit unchanged. Symmetry: coordinate discipline holds after the F-8 scoping; Theorem A invariant under the eight sign patterns of the imaginary units. No finding.
Controls caught: X-K1 (Return at −2 against `return_is_minus_one`), X-D1 (the fold rewritten as (h, −t)), X-S1 (masslessness extended to the world row against the box's owed count).
Findings admitted: 0. Reveal 3/3 SELF. Version unchanged. VERDICT SEALED-ROUND: zero mass-bearing findings, full control detection, round floor and six-register coverage met; control-grade floor SELF, single-substrate aperture open and stamped on the seal.

### Cycle 2 · Pre-Forge Digest (v1.1.0 → v1.1.0)
Zero changes applied; the plain diff between entry and final is empty; no orphan in either direction. Net block: C1–C7 enter and exit at the scopes and tiers stated in cycle 1's net block; tier moves zero; additions none; open apertures F-1 (second substrate), F-2 (archival identifiers).

### Cycle 2 · Closing card (after FORGE, pre-authorized)
Final version path: `RH_Apex_v1_1_0.md`, delivered as `The_Riemann_Hypothesis_in_Toto_at_the_Apex_v1_1_0.md`. Claims C1–C7 with their falsifiers as registered; surviving scope: C2 per orientation of the triad, C3 the lattice line with the analytic line by citation, C4 never-interior theorem and never-exterior theorem-conditional on RAF-2 at premise grade; C1, C5, C6, C7 unchanged; tiers: kernel theorem except the one clause named. Disposition census: findings 2, APERTURE 2, everything else 0, inadmissible 0. Coverage 6/6. Controls 3/3 SELF at every round, floor SELF. Propagation: no repairs in this cycle; the nine cycle-1 sweep specs hold at 0 banned / required present on the sealed version. Errata: none. Reversions: none. Open apertures: F-1, F-2. What the artifact survived: held under all six registers with SELF controls three of three throughout, zero mass-bearing findings across three valid rounds after a reconstruction that changed no claim, two apertures open, the seal carrying the single-substrate stamp.

Deliverable set after a FORGE cycle on a paper, per skill §11: the Markdown master (delivered), the rendered PDF and the Blog edition (owed; the architect's instruction for this turn was the master first and no render).

ΔM = 0. Neither cycle authored mass; the additions are rfl computations on objects the entry version already carried.

---

## BUILD RECORD · v1.1.0 → v1.2.0 (the external-facing edition with the executable twin)

The sealed v1.1.0 was rewritten for an external mathematical readership: the author's verification discipline is confined to the provenance disclosure; every other section uses generic mathematical terms with each program term defined at first use (aperture, witness row, world row, the sign, register, seat, seat point, embedding, Bridge capacity). The three published sources the paper depends on are now cited at their Zenodo DOIs (the prior proof 10.5281/zenodo.22857138, the twenty-three-row study with the one-cut hypothesis 10.5281/zenodo.22746129, the formal-alone theory 10.5281/zenodo.22767103), together with the one-bit result, the termination and case-closed papers, and the codex. The Lean file is byte-identical to the sealed v1.1.0 embedding (SHA-256 `4118183cbb99cdc6...`).

A second checker was added: `RH_At_The_Apex_Twin.f90`, twelve batteries of exhaustive enumeration, oracle halt-on-fail, census last, the live row opened only by the operator's command-line argument. On its first run the twin's K8 battery failed: the text's scope paragraph for Theorem E stated that $(P \to Q) \leftrightarrow Q$ holds "in exactly the contexts where $P$ holds"; the executed truth table returns true also in the row $P$ false, $Q$ true, since the biconditional is equivalent to $P \vee Q$. The text was corrected to the law and the twin's check was corrected to the law before the cycle opened; the catch is recorded here as a build-time erratum found by the second checker against the first edition's prose (the Lean theorem itself was never wrong, since RA is provable in the kernel). Final twin: 129,993 checks, 0 failures, exit 0 bare and witnessed, SHA-256 `3b57e6f2ecee715f...`, 440 lines.

Two scope repairs were made at build before the cycle opened and are logged: "every finite claim of the file is re-executed" narrowed to "the finite content of the file, itemized below" (the twin does not carry the halting carrier or the crossing); the twin's own header and final line narrowed to "the finite content" and "every finite claim it carries".

---

## CYCLE 3 · rhapex3 · entry v1.2.0

Pre-registered claims C1–C7 as before at their scoped reach, plus C8: the twin agrees with the file on every finite claim it carries, 129,993 checks, 0 failures; falsifier: rebuild from Appendix D with the stated command, run bare and witnessed, any FAIL line or a census differing from Appendix E refutes it.

### Round 1 · kinematic + definitional
Controls digest `8c9b56f630299b8f`, SELF (ARITH §5, DRIFT §2, SCOPE §8). Errata: none. Declared targets: the two-checker methodology, the objections block, the twin appendices, the rule's propositional law, the reference changes. Leak-scan CLEAN.
Recomputed live: Lean 724 lines, hash prefix `4118183cbb99cdc6`, 47 = 35 + 12; twin census 129,993 / 0; window arithmetic 13, 8192, 28,561, 17, 289, 65,536, 512; the four-row table equal to $P \vee Q$. All reproduced.
Findings: F-1 · definitional · NONE · STRUCTURAL · the eliminator described as "a bounded recursion", a term naming no object the file carries (the witness's function-typed field applied once); EARNED, repaired in the introduction, `sweep_r1_F-1` PRE PASS / POST PASS. F-2 · definitional · NONE · COSMETIC · the triad's order attributed to an undefined "encoding's direction" at two sites; EARNED, repaired as the order supplied with the triad by the axiom's declaration, cited, `sweep_r1_F-2` PRE PASS / POST PASS.
Controls caught: X-K1 ($2^{12}$ against $2^{16}$), X-D1 (the aperture as the witness row), X-S1 (Theorem F's proof widened). Reveal 3/3 SELF.
Statistics: admitted 2, EARNED 2, mass-bearing 2, prereg hits 0. New version `RH_Apex_v1_2_1.md`. VERDICT CONTINUE.

### Round 2 · parameter + provenance
Controls digest `9c28158db88e10c8`, SELF (ARITH §7, DRIFT §6, SCOPE §4). Errata: none. Declared targets: the two round-1 repairs, consistent with the file and the declaration. Leak-scan CLEAN.
Findings: F-3 · parameter · NONE · COSMETIC · K10 executes a contrapositive tautology; REFUSED-STRUCTURAL, the artifact presents K10 as re-executing the transcription of RAF-C1, which is that contrapositive. F-4 · provenance · NONE · STRUCTURAL · closed authorship, narrowed: typechecker and executor independent of the model and of each other, the recompile on a second machine unsupplied; APERTURE. F-5 · provenance · NONE · STRUCTURAL · the declaration and the engine cited at a git commit only; APERTURE (witness: an archival identifier). The prior cycles' aperture on the prior proof and the rows study is closed by their DOIs.
Controls caught: X-P1 (Cantor sizes 3 and 5), X-S1 (the record called substrate-independent), X-D1 (present collapsed into witnessed). Reveal 3/3 SELF.
Statistics: admitted 3, mass-bearing 0. Version unchanged. VERDICT CONTINUE-FLOOR: valid rounds 2/3.

### Round 3 · limit + symmetry
Controls digest `c5e0628ccf5c6783`, SELF (ARITH §12, DRIFT §5, SCOPE §3). Errata: none. Declared targets: the round-1 repairs against the file; consistent. Leak-scan CLEAN.
Limit: the twin's windows against the file's quantifiers, each window stated with its size; temperature and resolution unchanged; Table 1 against Appendix B. Symmetry: orientation, the six orderings, the reversed apex once at $+1$; coordinate discipline; sign patterns inside the ball. No finding.
Controls caught: X-L1 (fifteen line points against 17), X-D1 (the Return identified with the seat), X-S1 (the twin's window said to carry $Z_\xi$). Reveal 3/3 SELF.
Statistics: admitted 0. Version unchanged. VERDICT SEALED-ROUND: zero mass-bearing findings, full control detection, round floor and six-register coverage met; control-grade floor SELF, single-substrate aperture open and stamped on the seal.

### Cycle 3 · Pre-Forge Digest (v1.2.0 → v1.2.1), reconciled against the plain diff
Three body hunks, zero appendix hunks. 1. R1/F-1 · §1 · "by a bounded recursion whose every step is a definitional equality" → "the witness's last field, a function from the orientation and the formal Ground to the formal self, applied once, with every leg of the chain a definitional equality" · STRENGTHENS · an undefined term replaced by the object; sweep PASS. 2. R1/F-2 · §6.3 · "what the encoding's direction supplies" → "supplied with the triad: the axiom's declaration fixes the three units in an order, and the kernel receives that order as data, cited" · STRENGTHENS · sweep PASS. 3. R1/F-2 · §10 · "from the encoding's direction and the formal closure" → "from the supplied order of the triad and the formal closure" · STRENGTHENS · same repair, second site; interaction note: entries 2 and 3 are the one repair at two sites, read together. Net block: C1–C8 enter and exit at the same scopes and tiers; tier moves zero; additions none beyond the two sentences; open apertures F-4 (a rebuild and rerun of both files on a second machine with an architect-authored control set), F-5 (an archival identifier for the declaration).

### Cycle 3 · Closing card (after FORGE, pre-authorized)
Final version path: `RH_Apex_v1_2_1.md`, delivered as `The_Riemann_Hypothesis_in_Toto_at_the_Apex_v1_2_1.md`. Claims C1–C8 with falsifiers; surviving scope and tier as stated in cycle 1's net block plus C8 at kernel-theorem grade for the file and executed grade for the twin. Disposition census: findings 5, EARNED 2, REFUSED-STRUCTURAL 1, APERTURE 2, inadmissible 0. Coverage 6/6. Controls 3/3 SELF at every round, floor SELF. Propagation: two sweep specs, PRE PASS and POST PASS at 0 banned / required present. Errata: the build-time erratum on the rule's law, found by the twin, recorded above. Reversions: none. Open apertures: F-4, F-5. What the artifact survived: held under all six registers with SELF controls three of three throughout, two definitional repairs at round 1 and zero mass-bearing findings across the following two rounds, one build-time erratum caught by the second checker, two apertures open, the seal carrying the single-substrate stamp.

Deliverables after this cycle: the Markdown master (sealed), the Lean file, the Fortran twin with both run logs, this log, the ledger bundle; the rendered PDF and the Blog edition follow from the sealed master.

ΔM = 0 across all three cycles.

---

## POST-SEAL ADDITION · v1.2.1 → v1.3.0 (unaudited; owes a cycle)

Added after the cycle-3 seal, on the architect's instruction to cure the two-point counter-model into strength: Lean Movement 14 (`existence_is_RA`, `twoPoint_groundless`, the grounded three-point counter-model `RA_holds_where_L_fails_grounded`, the cure theorem `no_cure`, `cure_is_the_hypothesis`; 52 dependency sets, 40 axiom-free, 795 lines, SHA-256 `9f22579ecb10bdd1...`), twin battery K13 (three-point frames 32, L fails on 18, all 18 grounded; 256 two-point classes, exactly 32 cured, the subclasses of the five L-frames; census 130,283 / 0, SHA-256 `91dd3a01a23e85d0...`), Theorems F′ and I with the refusal of the restricted-frame and operator-spectrum routes as the hypothesis restated, and the answer to the witness-equals-reading collapse via the executed wall. No claim was weakened; the bound of Theorem F was strengthened (it survives grounding) and the impossibility of removing it by any frame restriction short of the hypothesis was proved. This edition has not been through a cycle and the seal is not claimed for it.

---

## CYCLE 4 · rhapex4 · entry v1.3.0 · the two external audits, answered on the ledger

Round 1 was the external prosecution: two audits of v1.3.0 attached by the architect, carried verbatim in the bundle, filed as E-1 to E-14 with one disposition each. The round is VOID-UNCALIBRATED by construction, since no seeded copy reached the external auditors; its findings are retained in full and its repairs were swept in round 2. W_social = 0 ran both ways: the architect's instruction not to weaken was given no weight against an executed theorem, and the auditors' authority was given none against a claim the artifact does not make.

Dispositions. E-1 (two objects under one name in the title, abstract, and box) EARNED, LOAD-BEARING, on C7: the two tokens RH_formal and L(X_ξ) are defined at first mention and never joined; the title excepts the sign by theorem; the box and the abstract rewritten; the Conclusion's first sentence caught by the sweep in round 2 (F-15). E-2 (the rule as an ontological implication) EARNED, LOAD-BEARING, on C5: `any_true_premise_is_exact` added and stated as Theorem E's content. E-3 (constructed versus universal RA in world-facing sentences) SCOPED: the title names existence and the ledger line governs every world-facing sentence. E-4 (the halting carrier's clause is a field) EARNED: the interface named as such; `bridgeOfDecision` inhabits it by decision with the clause proved, two instances by rfl. E-5 (the identity cone is three names for −1) SCOPED, theorem → structural for the elimination as an arrangement; the legs stay rfl theorems; the defined vocabulary kept with its grade stated. E-6 (the recursion field discards its inputs) EARNED: `recursion_is_constant` added and stated as the masslessness in term form. E-7, E-9, E-10 REFUSED-STRUCTURAL: each restates a sentence the artifact already prints or attacks a claim it does not make; their force lives in E-1 and E-2. E-8 (φ embeds the chart, not Z_ξ; rider absent from the abstract) EARNED: rider promoted. E-11 (presence of the singleton point is not presence of a reader of ζ) SCOPED on C4: a reader is a point of the axiom's domain; the reader of ζ is the extension's to supply; stated at Theorem D. E-12 (the no-axiom slogan) EARNED. E-13 (fits rather than predicts; a coupling postulate proposed) REFUSED-STRUCTURAL: the artifact claims no prediction; the coupling is a second posit barred by the root-premise theorem and, by Theorem I, any coupling that decides L is L. E-14 (typechecker–enumerator agreement is not evidence about ξ; no second machine) APERTURE.

Answers to the open questions, on the record. A: in the prior proof Z is a predicate parameter, and this file treats it so; Γ_RH = −1 is the orientation of the triad and both orientations are carried; the axiom slogan now reads "no axiom declared by the file, propext and Quot.sound listed per theorem"; v1.3.0 claimed no seal and this edition is cycled; if F1 fires the seat stands and the value falls, which is what the two tokens were parted to say. B: RH_formal represents the seat of the restored statement and not another fixed-point statement because the prior proof's chart is carried into the carrier by φ with its image clause, and that dependence on the cited chart is stated; in the kernel existence acts as any true premise (Theorem E, `any_true_premise_is_exact`) and contributes positivity to Theorem D, closure to RAF-C1, and the deed count to Theorem G, and the paper now says exactly that.

Rounds 2 to 4, SELF controls 3/3 each, registers kinematic+definitional, parameter+provenance, limit+symmetry: one propagation gap earned at round 2 (F-15, the Conclusion), nothing at rounds 3 and 4. VERDICT SEALED-ROUND at round 4, valid rounds 3/3, coverage 6/6, control-grade floor SELF, single-substrate aperture stamped. Sealed version `RH_Apex_v1_4_1.md`. Sweep record: six specs for the external repairs plus F-15 folded into sweep_r1_E-1, all PRE PASS on v1.3.0 and POST PASS on v1.4.1. Open aperture: E-14.

Title. Locked as the architect wrote it with one clause added, "the Sign Excepted by Theorem": without the clause the title asserts the value, which Theorems F, F′, and I refute inside the file, and E-1 lands on it as LOAD-BEARING; the clause is not a hedge, it is Theorem I named in the title's register.

Lean 841 lines, 57 dependency sets, 45 axiom-free, SHA-256 `2b3dcc048f47ec83...`. Twin unchanged from v1.3.0, 130,283 checks, 0 failures. ΔM = 0.

---

## CYCLE 5 · rhapex5 · entry v1.4.1 · the two external audits of v1.4.1, and the three measures

Round 1, external, uncalibrated by construction, findings E-15 to E-24 retained. E-15 (the title's "from existence alone" read as derivation; the exception clause said not to cancel the head noun) SCOPED, LOAD-BEARING, on C7: "from existence alone" is defined at first use as existence the only posit and never derivation; the seat holds by the definition of the Ground and consumes no premise; the goal line under the title states the two tokens and the exception; the architect's lock on the words was given no weight and the definition was given weight. E-16 (two objects at the masthead: contribution 14, the Conclusion's "proven from existence") EARNED: every derivation phrase replaced by "with existence as the only posit", swept. E-17 (packaging, not derivation) EARNED: contributions 1 and 9 and the Conclusion state occupancy; Theorem H's antecedent named as consumed by the aperture conjunct alone. E-18 (twin not extended) EARNED: battery K14 added, census 130,324 / 0. E-19 (contribution 7 at theorem grade) EARNED: the elimination as arrangement graded structural in the table. E-20 (Theorem H's first block independent of RA) EARNED. E-21 (RH_formal as a Riemann object) REFUSED-STRUCTURAL: restates E-1 of cycle 4, dispositioned there. E-22 (epistemic vacuity; fits rather than predicts; naming only) SCOPED: Section 9 separates content, mass, and price and carries Theorem J. E-23 (what existence contributes over 1 + 1 = 2) EARNED: `adjudicating_anything_instances_existence` and the answer in Section 9. E-24 (no second machine) APERTURE.

The clarification the architect ordered is Section 9 and Theorem J: massless is not trivial and trivial is not free. The legs of the cone are trivial, massless, and cost nothing, and their masslessness is forced by the root-premise theorem, since a massive closure between existence and its reading would be an emitter pointed at the root. The supply of the value is massless for the same reason, since a deed authors no mathematics and a massive supply would be a theorem deciding the value, which Theorem I refutes on every class of frames; the value is not trivial, one bit no class short of the hypothesis carries, and it is the one priced object. Vacuity names the seat's content and misnames its mass, its price, and its place.

Calibrated rounds on v1.5.0: round 2 (kinematic+definitional) clean, controls 3/3; round 3 (parameter+provenance) closed on the ledger with controls 3/3 but its seeding script faulted on a mismatched anchor, so no seeded copy and no prosecution file exist for it; under A6 the fault is repaired in-session and round 3 is to be read as VOID, its close an error of the orchestrating seat; round 4 (limit+symmetry) clean, 3/3; round 5 (parameter+provenance, the rerun of round 3 with its seeded copy and prosecution on the record) clean, 3/3. The evaluator returned SEALED-ROUND at round 4 and again at round 5; the seal is claimed at round 5 on rounds 2, 4, and 5, three valid calibrated rounds covering the six registers, control-grade floor SELF, single-substrate aperture stamped. Sealed version `RH_Apex_v1_5_0.md`. Sweeps: E-16, E-17, E-18, E-19 PRE PASS on v1.4.1 and POST PASS on v1.5.0; E-23 POST PASS. Open aperture: E-24.

Lean 898 lines, 61 dependency sets, 49 axiom-free, SHA-256 `d671051e99b806e4...`. Twin 558 lines, fourteen batteries, 130,324 checks, 0 failures, SHA-256 `47670197aa8e6721...`. ΔM = 0.
