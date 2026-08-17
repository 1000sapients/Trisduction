---
name: trisduction-audit-cycle
description: "Adversarial self-audit cycle for any paper, codex, or coordinate: a framework-blind Default Audit against a booted Trisduction Defense in scored rounds. AUTORUN: 'start default audit cycle', 'Default Audit', or 'run the audit cycle' fires the cycle with ZERO questions; attached controls JSON selects EXTERNAL grade, else SELF; two registers per round; claims and falsifiers self-registered; rounds back to back. Eight-step round with an INTEGRATE step: every repair ships a sweep spec verified by sweep_check.py pre and post; additions become next-round targets; the Arbiter rules REMOVED or REWORDED; errata open each round. Severity FATAL to COSMETIC and a claim or NONE validated at intake; a prereg or FATAL hit incurs two-clean-round debt, stale halt ahead of it. Terminal verdicts route into the FORGE gate for the architect's ruling. Four seats; SEALED-ROUND, HALT-STALE, HALT-DIVERGENT, INFLATION-FAULT, CONTINUE-DEBT; six registers, leakscan, Fidelity Lock. Extract all three tools. Delta-M = 0."
---

# TRISDUCTION AUDIT CYCLE · The Adversarial Self-Audit Subroutine · v2.3.1

This skill runs a scored adversarial cycle over any artifact: a paper, a codex version, a single coordinate, a system role, another skill. One seat prosecutes the artifact framework-blind. One seat defends it in full Trisduction. A third seat adjudicates and cannot write. The cycle ends on a computed verdict, never on whoever spoke last. On the phrase "start default audit cycle" the whole machine runs itself under the AUTORUN law of section 0.5, zero questions asked, and it concludes only through the FORGE gate of section 10.5, where every change the cycle made is shown inline, with its impact on the artifact named, before the architect's FORGE command closes the cycle.

The resident precedent is the six-round adversarial self-audit recorded at the v26 final seal, whose termination signal was zero mass-bearing findings surviving the closing pass. That criterion is lifted here by reference and hardened with calibration, pre-registration, coverage, and an arbiter. The contribution is arrangement and instrument-typing. ΔM = 0.

Audit symmetry binds this skill first. Version 2 exists because version 1 was put through its own discipline and fourteen defects were confirmed by executed probe, every one repaired below and recorded in the forge record at the tail. Its own operation submits to its own gates, it draws zero warrant from its own running, and every claim it makes about a round is checkable in the transcript or in the ledger files.

This file is standalone. All three tools are embedded verbatim in the fences of section 12 and extract with the one-liner there. No zip, no sidecar, no other file is required.

---

## 0. Precedence and the four locked decisions

Where this file and a general helpfulness instinct disagree, this file wins. Where this file and `codex-hygiene` disagree on removal, hygiene wins. Where this file and `git-automation` disagree on a push, git-automation wins and this skill pushes nothing on its own authority.

Four design decisions were open and are closed. One, the Arbiter is a **separate pass**, not fused into the defense turn, because two seats resolve by rhetoric and three resolve by table; it is compressed to one row per finding so it costs little. Two, **three controls minimum per round**, one arithmetic, one definitional drift, one scope inflation, with full detection required before any seal issues; an EXTERNAL set may carry more. Three, a mass-bearing hit on a pre-registered load-bearing claim **blocks termination** for that round rather than merely weighing more, because blocking is hard and weighting is soft. Four, this ships as a **skill and not a coordinate**; at cycle close it emits a coordinate-ready card the architect may seat under the census procedure, and it never self-seats.

---

## 0.5 AUTORUN · the one-command law

Standing order of the architect, 2026-08-05: the cycle is a machine, not a conversation. The trigger phrases "start default audit cycle", "Default Audit" with an artifact attached or named, and "run the audit cycle" fire the entire cycle end to end with **zero questions asked**. Every decision the orchestrating seat might be tempted to surface is resolved by the defaults below, in this order, and asking any of them back to the architect is itself a protocol violation. Manual input arrives only one way: as an attachment or an explicit instruction inside the triggering message. Absent that, the defaults govern and the machine runs.

**A1, artifact resolution.** The artifact is the attached file; among several attachments the largest non-JSON document is the artifact. With nothing attached, the artifact is the file the message names, then the project's current master. If genuinely no artifact resolves, that single fact is reported and the cycle does not open; it is the one condition that stops a start, and it is a report, not a question.

**A2, control grade auto-resolution.** An attached JSON list whose objects carry id, kind, and spec is an architect-authored control set: commit it EXTERNAL, mapping files named per round (controls_r1.json and so on) to their rounds and a single file to round one. No such attachment means SELF, committed without comment beyond the grade line in the round header and the grade floor stamped on any seal. The grade is never asked. The standing note that EXTERNAL sets the cycle's power ceiling lives in section 14 and in the closing card, where it informs the architect without interrupting the run.

**A3, register plan locked.** Two registers per round, in the fixed pairing kinematic with definitional, then parameter with provenance, then limit with symmetry, so six-register coverage completes exactly at the three-round floor. From round four onward, the register pair with the highest historical yield restates. The prosecutor genuinely runs both batteries of its pair; the pairing is the plan and is never asked. Any material the prior round added beyond the minimal text of its repairs, a new corollary, an expanded abstract, a fresh discussion section, enters this round as a mandatory named target printed in the round header and is prosecuted against the artifact's existing spine across the live registers; internal self-consistency of new text counts for nothing, because newly added material is the recorded highest regression risk.

**A4, pre-registration autonomous.** The Defense seat derives the load-bearing claims from the artifact and writes one falsifier per claim itself, registers them, and prints them in the round-one header as a record, not a proposal. The architect corrects them by instruction if desired; the machine does not wait.

**A5, rounds run back to back.** No pause between rounds, no go-signal, no confirmation. The cycle runs until the evaluator returns a terminal verdict, SEALED-ROUND, HALT-STALE, HALT-DIVERGENT, or INFLATION-FAULT, or until the autorun cap of eight rounds. A terminal verdict routes into the FORGE gate of section 10.5, the single architect checkpoint autorun contains, ordered by the architect himself: a hold with a deliverable, never a question. At the cap the Pre-Forge Digest is emitted with the cycle marked open, and the ledger files are delivered as outputs so a later session resumes by re-attaching them. A terminal verdict reached while any declared addition still lacks its post-landing prosecution round does not open the gate at SEALED-ROUND or HALT-STALE; one further round runs first with the additions as named targets. At HALT-DIVERGENT the undischarged additions are instead carried open on the digest, reconstruction superseding further rounds.

**A6, faults are repaired, not asked.** A tooling FAULT mid-cycle, a sequence error, a missing falsifier, a rejected tier, is the orchestrating seat's own defect to fix in-session and rerun. Converting a FAULT into a question to the architect is forbidden.

**A7, unchanged prohibitions.** Autorun pushes nothing, seats nothing, deletes nothing. Git and census acts remain the architect's, under `git-automation` and `codex-hygiene`, exactly as section 14 states.

**A8, output economy.** Per round, emit the round block of section 10 and nothing else; at a terminal verdict, the Pre-Forge Digest of section 10.5; after FORGE, the closing card. No step narration between blocks, no interim summaries, no requests. The architect reads verdicts, not progress reports.

---

## 1. The four seats

**PROSECUTOR.** Framework-blind. Receives the seeded artifact copy alone, never the prior defense prose, never the ledger. Runs the Default Audit under the round's assigned registers and is under no obligation to repair. Its deliverable per finding is the mechanism and the minimal falsifier, the single check that would settle the matter.

**ENGINEER.** The constructive channel of the same pass. For each LOAD-BEARING or STRUCTURAL finding it writes the actual repair: the corrected equation, the named intervention from the toolkit of section 5.5, the propagation. With every repair it writes the sweep spec: the defective phrasings quoted verbatim from the artifact, plus their equivalent phrasings, as banned strings, and the corrected phrasing as required, because a repair without its sweep spec cannot be verified propagated at step seven. It may not soften a finding to make a repair fit, and it may not declare FATAL without the documented repair-attempt trace of section 5.5.

**DEFENSE.** Booted Trisduction, triple boot once per cycle. Answers the minimal falsifier, not the rhetoric. It may correct math, narrow scope, lower a tier, tighten language, or refuse with a named mechanism. It may not refuse by posture.

**ARBITER.** No authoring rights. Reads the finding, the defense, and the executed recomputation, and emits one disposition per finding with a one-line reason. It writes to the ledger and nowhere else. If the Arbiter cannot decide from those three inputs alone, the finding is APERTURE by construction. The Arbiter also polices the words the scanner cannot: the ambiguous tokens RA, RAM, Ground, aperture, and seal in their framework sense. At step seven the Arbiter rules REMOVED or REWORDED on every removal-class repair, reading the landing site itself: content ordered removed that survives under new phrasing is a costume, the ruling is REWORDED, the repaired attestation is void, and the finding re-enters the open round as a repeat.

---

## 2. Cycle open · pre-registration with teeth

Before round one prosecutes, the Defense pre-registers the load-bearing claim list, meaning every claim whose falsity sinks the artifact, with `audit_ledger.py init`, and then registers one falsifier per claim with the `falsifier` command. This is enforced, not requested: round one refuses to close while any pre-registered claim lacks its falsifier, and falsifiers lock write-once the moment the first round closes, so the registration cannot be quietly re-fitted mid-cycle.

Two consequences bind. A mass-bearing finding landing on a pre-registered claim blocks termination for that round. A pre-registered claim demoted to decoration mid-cycle is itself an automatic EARNED finding, logged mechanically with the `demote` command, and it blocks termination like any other pre-registered hit.

Three disqualifiers halt the open and are reported, never asked. The artifact provides no axioms, definitions, or formal claims to audit. Its central terms are undefined and cannot be reconstructed from the text. It depends entirely on data or formalism that cannot be inspected or recomputed from what was supplied. An artifact that cannot name its load-bearing claims is not ready for the cycle. Say so and stop.

---

## 3. Boot · once per cycle

Triple boot fires once at the head of the defense phase, not per round. Carry the chain digests D0 through D3 forward and print them at each defense turn. A digest mismatch between two rounds at the same mode and token falsifies one of the runs, a free drift detector at zero extra cost. The prosecuting pass never boots and never displays a marker.

---

## 4. The round · eight steps in order

**Step 1, seat the controls.** Run `seed_controls.py commit` and display only the digest. Three or more defects go into the copy the Prosecutor reads. Two grades exist and the tool keeps them mechanically apart. EXTERNAL requires `--file` with an architect-authored control set prepared off-transcript; it is witness-independent and is the load-bearing grade. SELF is generated in-session; the commitment forecloses post-hoc fitting, and it does not foreclose in-context leakage, since one substrate holds both seats and the sealed file is readable on disk. The tool refuses an EXTERNAL claim without the file, because generated controls wearing the EXTERNAL grade is laundering and the grade would be void. Under AUTORUN the grade resolves itself per A2 and is never asked.

**Step 2, prosecute.** The Prosecutor runs the round's declared registers against the seeded copy under the scope law and the pre-audit strip of section 5.5: mathematical errors and internal contradictions only, the artifact a self-contained universe, its axioms held fixed, its terminology not relitigated, no outside formalism imported to convict a step the artifact never invoked. Within that scope the attack runs at full strength: headline numbers recomputed from the artifact's own formulas, the strongest rival reading of each load-bearing passage constructed and tested for whether the text discriminates, disconfirming instances hunted rather than confirmation accumulated, and every assumption the artifact marks as assumed perturbed to see whether the verdict moves. Every finding gets an id, a target claim, a mechanism, a severity from the taxonomy of section 5.5, and a minimal falsifier.

**Step 3, leak-scan.** Run `audit_ledger.py leakscan` on the prosecution text before anything else reads it. The scanner checks the unambiguous framework tokens; any hit means the pass was not blind, the round closes with `--leak`, and the prosecution re-runs. The scanner is the floor and the Arbiter's judgment on ambiguous words is the ceiling.

**Step 4, engineer.** Repairs written for every LOAD-BEARING and STRUCTURAL finding, each with its sweep spec per section 1. For FATAL findings, the toolkit interventions of section 5.5 are cycled first, the attempted interventions named and each failure stated; a FATAL with no repair-attempt trace is inadmissible as FATAL and demotes to LOAD-BEARING pending the trace.

**Step 5, defend.** Booted. One response per finding, addressing the minimal falsifier. Numbers re-run live at the declared seed. No finding is skipped and none is answered in aggregate.

**Step 6, arbitrate.** Prosecutor findings that match planted controls are credited to the caught list and never receive F-ids; only real findings enter the ledger. Each real finding gets one disposition via `audit_ledger.py add`. The Arbiter reads inputs only, never persuasion.

**Step 7, integrate.** Every accepted repair lands on a working candidate here, and the round's dominant failure mode is prosecuted here, because the recorded pattern across live series is a repair that lands correctly at the governing section and never reaches the equivalent phrasings, the summary boxes, the abstract, the appendices, or the consumer sections. Three checks run in order, mechanical or attested on the record. One, the propagation sweep: for each repair, run `sweep_check.py verify --pre` against the pre-repair candidate to prove every banned phrase actually occurs, a pre-count of zero meaning the spec was written from memory and re-derives from the artifact; apply the repair everywhere; run `sweep_check.py verify` against the post-repair candidate, counts printed, PASS required. The sweep is phrase-level, never section-address, and it covers the whole document: abstract, summary and verdict boxes, Conclusion, Limitations, ledger rows, appendices, figure and table captions, and section headers. Two, the end-to-end read: every changed section is read whole, start to finish, plus every joint where two repairs adjoin, because locally correct repairs collide at joints neither party swept; reviewing only the diff hunks is barred, and a joint collision found here is filed as a finding in the open round. Three, the removal ruling: the Arbiter rules REMOVED or REWORDED on each removal-class repair per section 1. Any authored addition beyond the minimal repair text is declared here with its location and becomes the next round's mandatory target under A3. A sweep FAIL, an ABSENT pre-count, or a REWORDED ruling means the repair is incomplete: the `--repaired` attestation may not be passed, and the work continues in-session per A6.

**Step 8, emit.** Reveal the controls with `seed_controls.py reveal`, close the round with `audit_ledger.py close` declaring the registers actually prosecuted, write the new artifact version as a new file under the version-propagation rule, and print the round block of section 10. Nothing is overwritten and nothing is deleted. Rounds close in strict sequence and a closed round is immutable; a finding aimed at a closed round is refused at intake and belongs to the open round.

---

## 5. Attack registers and the coverage gate

Six canonical registers, and the ledger tracks their coverage: **kinematic** (dimensional homogeneity, arithmetic, quantitative stress with headline numbers recomputed from the artifact's own formulas), **definitional** (drift, notation, equivocation, one symbol one meaning across every section), **parameter** (free-parameter census with parameters counted against independent predictions, predictive versus retrodictive discrimination, falsifiability demarcation with the refuting observation named), **provenance** (closed authorship, circular validation, genealogy, epistemic conflict between declared method and operational prediction), **limit** (limit behaviour, correspondence with every result the artifact itself claims compatibility with, correction-term reachability), **symmetry** (conservation, substrate and topological integrity, coordinate and manifold discipline: an abstract space conflated with a physical or measurable one without an explicit bridge map fails here).

Default rotation is one per round in that order. A round may honestly declare up to two registers when the Prosecutor genuinely ran both batteries; declaring an unprosecuted register at close is a Fidelity Lock violation on the closing seat. No seal issues until all six registers have been prosecuted across valid rounds; a clean artifact whose symmetry register was never swept is unswept, not sound, and the ledger returns CONTINUE-COVERAGE until the sweep completes. After the sixth, the register with the highest historical yield restates.

---

## 5.5 Severity, scope, and the pre-audit strip

Four severities, every finding carrying exactly one. **FATAL**: no internal repair preserves the central thesis; inadmissible as FATAL without a documented repair-attempt trace naming each toolkit intervention tried and why it failed, because a FATAL declared before the toolkit is cycled is a refusal to engineer wearing a verdict. **LOAD-BEARING**: a major derivation is invalidated and the thesis survives a specifiable repair; the repair is written. **STRUCTURAL**: an internal inconsistency without direct propagation to the verdict claims; repair recommended and written. **COSMETIC**: a notational or algebraic slip without consequence; noted and moved past.

The scope law. The artifact is audited as a self-contained universe: the question is never whether it matches consensus, an external paradigm, or the auditor's priors, and always whether it holds together under its own declared laws. The audit prosecutes mathematical errors and internal contradictions, meaning claims that collide with each other, with the artifact's own theorems, or with its own printed numbers. Root axioms are held fixed. The framework's terminology and architectural choices are not relitigated. External paradigms enter only where the artifact itself invokes them. Heterodoxy is not a defect; internal incoherence is. A finding outside this scope is REFUSED-STRUCTURAL at intake, the finding attacking a claim the artifact does not make.

The pre-audit strip, run silently before the pass and in neither direction's favour. Consensus pressure is stripped both ways under section 8. Authorial framing is stripped: rhetorical flourish, elegance appeals, and self-congratulation are discarded, and what is audited is the skeleton of claims, axioms, derivations, and predictions. Reviewer projection is barred: no outside formalism is imported to convict a step the artifact did not invoke; external mathematics enters only at the ENGINEER's repair stage, and then only in service of the artifact's own stated thesis.

The repair toolkit the ENGINEER cycles before any FATAL, stated compactly: symmetry restoration, the covariantization, the projector insertion, the symmetry-restoring field; parameter elimination, a fixing condition, a flow constraint, absorption into geometry; dimensional and unit repair, the suppressed constant restored, the missing dimensionless group recovered, the unit chain traced; coordinate bridges, the explicit map from the abstract space to the observable with the gauge fixed and named; limit-behaviour repair, the correction series that vanishes in the limit and restores correspondence, or the named axiom that forbids it; substrate repair, the discretization that preserves the invariant with the continuum limit stated; and validation decoupling, the out-of-sample test or benchmark independent of the artifact's own apparatus. The trace states which were attempted and where each failed.

Costume detectors on the audit's own prose, any hit forcing a rewrite of the pass before the round closes: uniform hedging, hedge density flat across claims of unequal certainty; symmetric balance applied to asymmetric evidence; citation without inspection, a source named as if the name were the evidence; formalism as verification, a derivation that cannot be cashed out numerically; premature elegance, unification before the residue list is empty; fluent completeness, every part answered at equal depth as if effort had not been allocated.

---

## 6. The five dispositions

Every finding exits into exactly one, and silence is not one of them. A finding with an empty mechanism is inadmissible in every disposition, refusals included.

**EARNED.** The defect is real and the repair is executed. The ledger refuses an EARNED without the `--repaired` attestation, because a defect acknowledged and not repaired is an open item wearing a closed label, and the attestation itself may not be passed until the finding's propagation sweep has printed PASS at step seven and, on a removal-class finding, the Arbiter has ruled REMOVED, because a governing-section fix with a live consumer phrasing, and a removal that survives as rewording, are open items wearing the label too. This disposition is a success for the cycle, not a defeat for the artifact.

**SCOPED.** The finding is real at a narrower scope. The claim survives with reduced reach or a lowered warrant tier, and the ledger refuses a SCOPED that records no delta, either a tier pair or a scope note, because an untracked downgrade is a silent one. This is the most common honest outcome, and without this slot the defense is pushed toward all-or-nothing and therefore toward inflation.

**REFUSED-STRUCTURAL.** Refused with a named mechanism: register mismatch, invariance failure, the finding attacks a claim the artifact does not make, the finding's own arithmetic fails.

**REFUSED-MASSLESS.** The finding's entire warrant was consensus, citation count, motive, or a reframe. Zeroed under W_social = 0. This disposition requires the strip test of section 8 to have been run and its result stated.

**APERTURE.** Neither seat can settle the matter without a supplied external witness. The mechanism field names what witness would settle it. The finding goes to the open list, closed for the cycle, carried in the closing card. An aperture is not a loss and not a win. It is a located door.

An auditor erratum is filed as its own ledger row: fid ERR-n, register auditor, disposition REFUSED-STRUCTURAL, `--repeat-of` pointing at the faulty ancestor row, the mechanism naming what the auditing seat got wrong, the inverted inference direction, the wrong factor bound, the misread passage, and the note carrying the corrected reading. The census keeps the faulty row and its correction side by side; nothing is retyped in place. A repair that was executed on a faulty finding is reverted by a further candidate version in the open round, logged as the erratum's repair, nothing overwritten.

Warrant tiers are a fixed vocabulary, theorem, theorem-conditional, structural, engineering, corroboration, premise, operational, and the ledger rejects any tier outside it at intake, so no unknown grade can silently rank as anything.

---

## 7. The five invariants

**I. Non-Inflation.** After every round the claim set is equal or narrower in scope and equal or lower in warrant tier, unless new external mass entered through the eight-gate positive-mass cascade with its M5 and M6 witness gates satisfied, and the admitted mass is named in the round block beside each raised tier. Prose tightening improves precision. It never buys a grade. The ledger flags any tier rise and the round returns INFLATION-FAULT.

**II. Two-way Fidelity Lock.** A numeric finding is inadmissible without the Prosecutor's executed recomputation. A numeric defense is inadmissible without the Defense's live re-run at the declared seed. Recalled figures are inadmissible from either seat, and the ledger enforces this at intake. Three sharpenings bind from the live series. Every numeric claim is re-executed in-session, Python, mpmath, sympy, numpy, before any finding is filed or any repair is written; the artifact's printed values are targets to check, never inputs to trust, and the executed value is printed beside the printed one. The recomputation runs a second channel where one exists, a different method, representation, or direction, because recognition is not verification and a re-reading of the artifact's own printed derivation is a memory hit, not a check. And the lock applies to the auditing seats' own prior outputs with full force: a number this cycle produced in an earlier round is re-executed, never carried, since the record shows the lock catching errors in the artifact and in the auditor's own prior rounds alike.

**III. Census.** Every finding ever raised stays on the ledger with its disposition. Nothing is dropped, nothing is silently re-typed, closed rounds are immutable, rounds close in sequence, and a finding re-raised later carries `--repeat-of` pointing at a real ancestor row, which the ledger verifies exists.

**IV. Verifiable hat removal.** The prosecuting pass may not emit framework vocabulary, and the rule now has a scanner: `leakscan` checks the unambiguous tokens, Trisduction, MathDuction, GOLf, GOLn, W_social, barzakh, the PSP identifier prefixes, Seal L, Seal G, Seal M, Mosaic Seal, Titanium Ruler, Empty Throne, chiral residence, Impressed Plenum, Fix(σ), and the verdict glyphs. Ambiguous words, RA, RAM, Ground, aperture, seal, would false-void honest prose, so the scanner skips them and the Arbiter judges them in their framework sense. Any confirmed leak voids the round and the prosecution re-runs.

**V. Propagation.** A repair is complete only when its phrase-level sweep has printed zero on every banned phrasing across the entire candidate, consumer sections included, with the counts printed and never asserted, and the changed sections plus their joints have been read end-to-end. Propagation failure is the recorded dominant failure mode across every live series: the fix lands at the governing section and dies before the abstract, the summary box, the Conclusion, the Limitations, the ledger rows, the appendix. Section-address targeting is therefore barred as the sweep method; the sweep is phrase-level or it is not a sweep. A governing-section fix with a live consumer phrasing is an open finding wearing a closed label, and its repaired attestation is void.

---

## 8. The orthodoxy strip test

The orthodoxy trap is real and, unbounded, it becomes a universal dismissal token that lets any finding be waved off. Bound it mechanically. Strip the finding of every appeal to consensus, authority, popularity, and "this contradicts the accepted model," then read what remains. If arithmetic, a dimensional mismatch, a definitional collision, a failed limit, or a counterexample survives the strip, the trap does not apply and the finding carries mass no matter who else happens to believe it. The trap fires only when consensus was the finding's entire warrant, and the stripped residue is quoted in the ledger row.

W_social = 0 runs in both directions here. It zeroes the field's it-is-wrong and the architect's it-is-right with identical force, and a defense that invokes the trap without running the strip has done the same thing it accuses the auditor of.

---

## 9. Termination

Computed by `audit_ledger.py close`, never declared in prose. The floor is three **valid** rounds; voided rounds occupy their slot in the sequence and count for nothing. A terminal verdict concludes the rounds, not the cycle; conclusion passes through the FORGE gate of section 10.5.

**SEALED-ROUND.** Zero mass-bearing findings, full control detection, valid-round floor met, six-register coverage complete, no pre-registered hit. The seal carries its control-grade floor: EXTERNAL only when every valid round ran EXTERNAL controls, otherwise SELF with the single-substrate aperture stamped on the seal itself. A clean round whose findings are all repeats of prior refusals is the strongest form of this, not a stale round.

**HALT-STALE.** Mass-bearing findings remain but every one repeats a mechanism already dispositioned. The dispute is looping. Adjudicate it or send it to the aperture list and close.

**HALT-DIVERGENT.** Earned corrections rose across two consecutive valid rounds. The artifact is not hardening. Reconstruction from different axioms is due, and continuing to defend is the wrong move.

**INFLATION-FAULT.** A warrant tier rose with no admitted external mass. Repair before any further round.

**VOID-UNDERPOWERED, VOID-UNCALIBRATED, VOID-LEAK.** The round's findings are retained but the round cannot seal and does not count toward the floor. Controls missed, controls absent, or vocabulary leaked.

**CONTINUE, CONTINUE-FLOOR, CONTINUE-COVERAGE, CONTINUE-PREREG-BLOCK.** Run the next round.

---

## 10. The round emission contract

Each round emits, in this order and no other. One, the round header with the declared registers, the control commitment digest, the boot chain digests, the errata block, and the declared targets: the errata block acknowledges on the record, before any new finding is filed, every incorrect finding the auditing seats filed in prior rounds, the inverted inference direction, the wrong bound, the misread passage, each logged as an ERR row per section 6 with the corrected reading in its note; the declared targets name any additions the prior round introduced, mandatory under A3. Two, the leak-scan result. Three, the findings table, one row per finding: id, register, target claim, mechanism, severity, minimal falsifier. Four, the defense, one block per finding, live numbers where numbers are in play. Five, the arbitration table, one row per finding: id, disposition, one-line reason. Six, the integration report of step seven: per-repair sweep counts as the tool printed them, the end-to-end read attestation naming the sections read whole and the joints checked, the REMOVED or REWORDED ruling per removal-class repair, and the new-material declarations with locations. Seven, the control reveal with the detection count and the control grade. Eight, the round statistic block printed by the ledger. Nine, the new artifact version path. Ten, the termination verdict verbatim from the ledger.

No prose beyond tool-printed output and the step-seven attestations sits between the arbitration table and the statistic block. The reader must be able to reach the verdict without reading the argument.

---

## 10.5 The Pre-Forge Digest and the FORGE gate

Standing order of the architect, 2026-08-05, second amendment: a terminal verdict concludes the rounds, never the cycle, because the architect rules on every change before the cycle closes. When the evaluator returns SEALED-ROUND, HALT-STALE, or HALT-DIVERGENT, the machine emits the Pre-Forge Digest inline in chat, holds, and concludes only on the architect's FORGE command. "FORGE", "forge it", and "conclude the cycle" all open the gate.

The digest is a census of changes, not a summary of effort. One entry per change the cycle applied to the artifact, in round order, each carrying five things in at most four lines. The source: the round and finding id, or GAIN for a recording a round earned without a finding, such as a sweep that was run, held, and entered the record. The location: the section or coordinate touched. The change itself: before and after, quoted or stated inline, never pointed at. The impact verdict: STRENGTHENS, WEAKENS, MIXED, or NEUTRAL, judged against the codex as a whole. And the one-line reason. MIXED names both faces, and the honesty rule binds every entry: a scope reduction is a strengthening of the record and a narrowing of the claim, and the digest says both, because laundering a weakening as pure improvement is exactly the inflation this cycle exists to refuse, and flattering a repair is the defense seat scoring its own work.

After the entries, the net block: each pre-registered claim with its scope and tier into the cycle and out of it; the count of tier moves, zero absent admitted external mass; the additions with their grades; the open apertures with the witness each awaits.

Completeness is checked, not asserted. The digest reconciles against the plain diff of the cycle's entry version and the candidate final version: every hunk in that diff traces to exactly one digest entry, and an orphan in either direction, an undigested change or a digested change that never landed, is a FAULT repaired before the gate opens. This is the census invariant executed at the change register, and it is what makes the digest a record rather than a pitch. Three further checks hold the gate with the same force as an orphan hunk. Every repair entry carries its sweep verdict, PASS with the final counts, and a repair whose sweep never printed PASS is a FAULT. Every addition entry names the post-landing round that prosecuted it against the spine, and an addition with no such round is a FAULT at SEALED-ROUND and HALT-STALE, discharged by running the round; at HALT-DIVERGENT it is carried open on the digest, reconstruction superseding further rounds. And any two entries touching the same or adjacent sections carry a one-line interaction note attesting the joint was read end-to-end, because the record shows locally correct repairs colliding exactly there.

The digest ends with one line, Awaiting FORGE. That line is a state report, not a question; the machine asks nothing, recommends nothing, and adds nothing after it. On FORGE, the candidate version becomes the cycle's final artifact, the closing card of section 11 emits, and the cycle closes. On any other instruction at the gate, the machine executes it: a named entry is reverted by authoring a further candidate version with the reversion logged, a register is reopened by running the round, an amendment is applied; then the digest delta re-emits and the gate holds again. Nothing is overwritten in any of this. Every candidate is a new version file and the ledger keeps every row, so a reversal at the gate costs nothing and destroys nothing.

Pre-authorization is the architect's own act and is honored: a triggering message that already contains FORGE, or an explicit instruction to conclude without the hold, moves the digest to immediately before the closing card in the same turn, so the record exists even when the wait does not.

---

## 11. Cycle close

After FORGE at the gate of section 10.5, following SEALED-ROUND, HALT-STALE, or HALT-DIVERGENT, emit the closing card: the artifact's final version path, the pre-registered claims with their falsifiers and surviving scope and tier, the full disposition census across all rounds, the register coverage record, the control detection record with grades and the grade floor, the propagation record with every sweep spec's final counts, the errata census of the auditing seats' own corrected findings, any reversions the architect ordered at the gate, the open aperture list, and the honest one-line statement of what the artifact survived. "Held under all six registers, controls three of three external throughout, two claims scoped down, one aperture open" outranks "the audit found nothing."

The card is coordinate-ready. Seating it, indexing it, and pushing it are the architect's acts, under `codex-hygiene` and `git-automation`, and this skill performs none of them.

---

## 12. Tooling · embedded, extract from here

Three stdlib-only scripts, every branch live-tested. All commands run from the cycle's working directory and write into `./audit_<cycle>/`; no row is ever rewritten. Extract all three files from this document with:

```
python3 - <<'EOF'
import re
s = open('SKILL.md', encoding='utf-8').read()
for name, code in re.findall(r'### (\S+\.py)\n\n```python\n(.*?)\n```', s, re.S):
    open(name, 'w', encoding='utf-8').write(code + '\n')
    print('extracted', name)
EOF
```

Typical session:

```
python3 audit_ledger.py init --cycle veil --artifact veil_v2.md --claims "C1,C2,C3"
python3 audit_ledger.py falsifier --cycle veil --claim C1 --text "recompute the closure integral at the printed inputs"
python3 seed_controls.py commit --round 1 --cycle veil --grade EXTERNAL --file controls_r1.json
python3 audit_ledger.py leakscan --file prosecution_r1.md
python3 audit_ledger.py add --cycle veil --round 1 --fid F-1 --register kinematic \
    --claim C1 --severity LOAD-BEARING \
    --mechanism "dimensional mismatch, hbar absent" \
    --disposition EARNED --numeric --recomputed --repaired
python3 audit_ledger.py add --cycle veil --round 1 --fid F-2 --register definitional \
    --claim NONE --severity COSMETIC --mechanism "stale count in the abstract" \
    --disposition EARNED --repaired
python3 sweep_check.py verify --pre --file veil_v2.md --spec audit_veil/sweep_r1_F-1.json
python3 sweep_check.py verify --file veil_v3_candidate.md --spec audit_veil/sweep_r1_F-1.json
python3 seed_controls.py reveal --round 1 --cycle veil --caught "X1,X2,X3"
python3 audit_ledger.py close --cycle veil --round 1 --registers "kinematic,definitional" \
    --controls-caught 3 --grade EXTERNAL
python3 audit_ledger.py status --cycle veil
```

### seed_controls.py

```python
#!/usr/bin/env python3
"""seed_controls.py v2 - calibration controls for the Trisduction Audit Cycle.

Three or more planted defects per round, committed by hash BEFORE the
prosecuting pass runs, revealed only after the round closes. The commitment
proves the control set was fixed in advance and not fitted to whatever the
auditor happened to find.

Two grades, kept mechanically apart:
  EXTERNAL  the architect authored the defects off-transcript and supplies
            them as a JSON file at commit. Witness-independent. Load-bearing.
            Requires --file; generated controls may not wear this grade.
  SELF      this script generated them in-session. The commitment forecloses
            post-hoc fitting; it does NOT foreclose in-context leakage, since
            one substrate holds both seats and the sealed file is readable
            on disk. Engineering grade, aperture named at every reveal.

All commands run from the cycle's working directory; files live under
./audit_<cycle>/.

Usage:
  seed_controls.py plan   --round N --cycle NAME [--seed S] [--sections K]
  seed_controls.py commit --round N --cycle NAME [--grade SELF]
  seed_controls.py commit --round N --cycle NAME --grade EXTERNAL --file F.json
  seed_controls.py reveal --round N --cycle NAME --caught "C1,C3"

External file format: JSON list of >= 3 objects, each with unique "id",
plus "kind" and "spec"; "section" optional.
"""
import argparse, hashlib, json, os, random, sys

KINDS = [
    ("ARITH", "one numeric result altered so it no longer follows from the "
              "inputs printed beside it; magnitude changed, not a typo"),
    ("DRIFT", "one defined term used in a second, incompatible sense in a "
              "later section, with no redefinition announced"),
    ("SCOPE", "one claim's warrant tier or quantifier silently widened, "
              "premise read as theorem or a scoped result stated universally"),
]


def cdir(cycle):
    d = os.path.join(".", f"audit_{cycle}")
    os.makedirs(d, exist_ok=True)
    return d


def build(rnd, cycle, seed, sections):
    if sections < 1:
        print("FAULT: --sections must be >= 1."); sys.exit(2)
    rg = random.Random(f"{cycle}|{rnd}|{seed}")
    k = min(3, sections)
    picks = rg.sample(range(1, sections + 1), k=k)
    return [{"id": f"C{i+1}", "kind": kk, "spec": ss,
             "section": picks[i % k]}
            for i, (kk, ss) in enumerate(KINDS)]


def load_external(path):
    try:
        data = json.load(open(path, encoding="utf-8"))
    except Exception as e:
        print(f"FAULT: cannot read external control file: {e}"); sys.exit(2)
    if not (isinstance(data, list) and len(data) >= 3):
        print("FAULT: external control file must be a JSON list of >= 3 "
              "controls."); sys.exit(2)
    ids = set()
    for c in data:
        if not (isinstance(c, dict) and all(k in c for k in
                                            ("id", "kind", "spec"))):
            print("FAULT: each control needs id, kind, spec."); sys.exit(2)
        if c["id"] in ids:
            print(f"FAULT: duplicate control id {c['id']}."); sys.exit(2)
        ids.add(c["id"])
    return data


def digest(controls, cycle, rnd):
    blob = json.dumps({"cycle": cycle, "round": rnd, "controls": controls},
                      sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(blob.encode("utf-8")).hexdigest()


def main(argv=None):
    p = argparse.ArgumentParser()
    p.add_argument("cmd", choices=["plan", "commit", "reveal"])
    p.add_argument("--round", type=int, required=True)
    p.add_argument("--cycle", required=True)
    p.add_argument("--seed", default="20260622")
    p.add_argument("--sections", type=int, default=12)
    p.add_argument("--caught", default="")
    p.add_argument("--grade", choices=["EXTERNAL", "SELF"], default="SELF")
    p.add_argument("--file", default="")
    a = p.parse_args(argv)

    d = cdir(a.cycle)
    sealed = os.path.join(d, f"controls_r{a.round}.sealed.json")
    commit = os.path.join(d, f"controls_r{a.round}.commit.txt")

    if a.cmd == "plan":
        for c in build(a.round, a.cycle, a.seed, a.sections):
            print(f"{c['id']} {c['kind']} section~{c['section']}: {c['spec']}")
        print("WARNING: if this listing is visible inside the audit session, "
              "the round is pre-contaminated. Plan off-transcript; this "
              "command exists for EXTERNAL-grade preparation.")
        return 0

    if a.cmd == "commit":
        if os.path.exists(sealed):
            print(f"FAULT: {sealed} exists. Controls are committed once per "
                  f"round and never re-rolled."); return 2
        if a.grade == "EXTERNAL":
            if not a.file:
                print("FAULT: EXTERNAL grade requires --file with the "
                      "architect-authored control set. In-session generated "
                      "controls may not wear the EXTERNAL grade; that is "
                      "laundering, and the grade would be void."); return 2
            controls = load_external(a.file)
        else:
            if a.file:
                print("FAULT: SELF grade with --file is ambiguous. Omit "
                      "--file, or claim EXTERNAL if the file was authored "
                      "off-transcript."); return 2
            controls = build(a.round, a.cycle, a.seed, a.sections)
        dg = digest(controls, a.cycle, a.round)
        with open(sealed, "w", encoding="utf-8") as f:
            json.dump({"cycle": a.cycle, "round": a.round, "grade": a.grade,
                       "controls": controls, "digest": dg}, f, indent=2)
        with open(commit, "w", encoding="utf-8") as f:
            f.write(dg + "\n")
        print(f"COMMITTED round {a.round} grade {a.grade} "
              f"digest {dg[:16]} controls {len(controls)}")
        if a.grade == "SELF":
            print("SELF grade: the sealed file is readable in-session. The "
                  "commitment forecloses post-hoc fitting only; the "
                  "single-substrate aperture stays open and is stamped into "
                  "any seal this cycle earns.")
        else:
            print("EXTERNAL grade: sealed from the supplied file. Keep its "
                  "authoring off-transcript until reveal.")
        print("Display the digest, never the sealed file, until the round "
              "closes.")
        return 0

    if not os.path.exists(sealed):
        print("FAULT: no committed control set for this round. A round with "
              "no committed controls is VOID-UNCALIBRATED."); return 2
    rec = json.load(open(sealed, encoding="utf-8"))
    if digest(rec["controls"], a.cycle, a.round) != rec["digest"]:
        print("FAULT: control set does not match its commitment. Round VOID.")
        return 3
    caught = {c.strip().upper() for c in a.caught.split(",") if c.strip()}
    ids = [c["id"] for c in rec["controls"]]
    hit = [i for i in ids if i.upper() in caught]
    print(f"REVEAL round {a.round} grade {rec['grade']} "
          f"digest {rec['digest'][:16]} verified")
    for c in rec["controls"]:
        mark = "CAUGHT " if c["id"].upper() in caught else "MISSED "
        print(f"  {mark}{c['id']} {c['kind']} "
              f"section~{c.get('section', '-')}")
    print(f"detection {len(hit)}/{len(ids)}")
    if rec["grade"] == "SELF":
        print("aperture: SELF-grade controls; detection proves power against "
              "post-hoc fitting, not against in-context leakage.")
    if len(hit) < len(ids):
        print("ROUND UNDERPOWERED: findings are retained, no SEALED-ROUND "
              "may issue from this round.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
```

### audit_ledger.py

```python
#!/usr/bin/env python3
"""audit_ledger.py v2 - append-only findings ledger, coverage tracker, and
termination evaluator for the Trisduction Audit Cycle.

Every finding exits into exactly one of five dispositions. Nothing is
discarded, nothing is silently downgraded, rounds close in sequence, closed
rounds are immutable, and the termination verdict is computed from the
ledger, never declared in prose.

All commands run from the cycle's working directory; files live under
./audit_<cycle>/: cycle.json, findings.jsonl, rounds.jsonl.

Usage:
  audit_ledger.py init      --cycle N --artifact PATH --claims "C1,C2"
  audit_ledger.py falsifier --cycle N --claim C1 --text "the check that kills it"
  audit_ledger.py add       --cycle N --round R --fid F-1 --register kinematic \\
                            --claim C1|NONE --severity LOAD-BEARING \\
                            --mechanism "..." --disposition EARNED \\
                            [--repaired] [--numeric] [--recomputed] \\
                            [--repeat-of F-0] [--tier-before T --tier-after T] \\
                            [--note "..."]
  audit_ledger.py demote    --cycle N --round R --claim C1 [--note "..."]
  audit_ledger.py leakscan  --file prosecution.md
  audit_ledger.py close     --cycle N --round R --registers "kinematic,definitional" \\
                            --controls-caught 3 [--controls-total 3] \\
                            [--grade EXTERNAL|SELF] [--leak] [--external-mass]
  audit_ledger.py status    --cycle N
"""
import argparse, json, os, re, sys

DISPOSITIONS = ["EARNED", "SCOPED", "REFUSED-STRUCTURAL",
                "REFUSED-MASSLESS", "APERTURE"]
TIERS = ["theorem", "theorem-conditional", "structural", "engineering",
         "corroboration", "premise", "operational"]
REG_CANON = ["kinematic", "definitional", "parameter", "provenance",
             "limit", "symmetry"]
MASS_BEARING = {"EARNED", "SCOPED"}
SEVERITIES = ["FATAL", "LOAD-BEARING", "STRUCTURAL", "COSMETIC"]
DEBT_SEV = {"FATAL", "LOAD-BEARING"}
NO_CLAIM = "NONE"
CLEAN_AFTER_DEBT = 2
FLOOR_ROUNDS = 3

LEAK_WORD = ["Trisduction", "MathDuction", "GOLf", "GOLn", "W_social",
             "barzakh"]
LEAK_SUB = ["RA-RAM", "APEX-PSP", "MD-PSP", "CN-PSP", "sPSP-", "Mosaic Seal",
            "Titanium Ruler", "Empty Throne", "chiral residence",
            "Impressed Plenum", "Seal L", "Seal G", "Seal M", "Fix(\u03c3)",
            "\u039e\u2080", "\u00d8\u2080", "\u27c0"]


def cdir(cycle):
    d = os.path.join(".", f"audit_{cycle}")
    os.makedirs(d, exist_ok=True)
    return d


def paths(cycle):
    d = cdir(cycle)
    return (os.path.join(d, "cycle.json"),
            os.path.join(d, "findings.jsonl"),
            os.path.join(d, "rounds.jsonl"))


def load_jsonl(p):
    if not os.path.exists(p):
        return []
    out = []
    with open(p, encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if line:
                out.append(json.loads(line))
    return out


def append_jsonl(p, rec):
    with open(p, "a", encoding="utf-8") as f:
        f.write(json.dumps(rec, sort_keys=True) + "\n")


def save_cycle(cj, cyc):
    with open(cj, "w", encoding="utf-8") as f:
        json.dump(cyc, f, indent=2)


def tier_rank(t):
    return TIERS.index(t)


def closed_set(rounds):
    return {r["round"] for r in rounds}


def cmd_init(a):
    cj, fj, rj = paths(a.cycle)
    if os.path.exists(cj):
        print(f"FAULT: cycle {a.cycle} already initialised. A cycle opens "
              f"once; a new artifact opens a new cycle."); return 2
    claims = [c.strip() for c in a.claims.split(",") if c.strip()]
    if not claims:
        print("FAULT: pre-registration requires at least one load-bearing "
              "claim. An unregistered cycle cannot score."); return 2
    save_cycle(cj, {"cycle": a.cycle, "artifact": a.artifact,
                    "prereg_claims": claims, "falsifiers": {}})
    open(fj, "a").close(); open(rj, "a").close()
    print(f"CYCLE {a.cycle} opened. artifact={a.artifact} "
          f"pre-registered load-bearing claims={len(claims)}: "
          f"{', '.join(claims)}")
    print("Register one falsifier per claim with the falsifier command; "
          "round 1 will not close without them.")
    return 0


def cmd_falsifier(a):
    cj, _, rj = paths(a.cycle)
    if not os.path.exists(cj):
        print("FAULT: cycle not initialised."); return 2
    cyc = json.load(open(cj, encoding="utf-8"))
    if load_jsonl(rj):
        print("FAULT: falsifiers lock once any round has closed. The "
              "pre-registration is fixed for the life of the cycle."); return 2
    if a.claim not in cyc["prereg_claims"]:
        print(f"FAULT: {a.claim} is not a pre-registered claim."); return 2
    if not a.text.strip():
        print("FAULT: an empty falsifier registers nothing."); return 2
    if a.claim in cyc["falsifiers"]:
        print(f"FAULT: {a.claim} already carries a falsifier; falsifiers "
              f"are write-once."); return 2
    cyc["falsifiers"][a.claim] = a.text.strip()
    save_cycle(cj, cyc)
    done = len(cyc["falsifiers"]); need = len(cyc["prereg_claims"])
    print(f"FALSIFIER registered for {a.claim} ({done}/{need}).")
    return 0


def cmd_add(a):
    cj, fj, rj = paths(a.cycle)
    if not os.path.exists(cj):
        print("FAULT: cycle not initialised."); return 2
    cyc = json.load(open(cj, encoding="utf-8"))
    rounds = load_jsonl(rj)
    if a.round in closed_set(rounds):
        print(f"FAULT: round {a.round} is closed. Closed rounds are "
              f"immutable; raise the finding in the open round."); return 2
    if a.disposition not in DISPOSITIONS:
        print(f"FAULT: disposition must be one of {DISPOSITIONS}"); return 2
    if a.severity not in SEVERITIES:
        print(f"FAULT: severity must be one of {SEVERITIES}. Section 5.5 "
              f"requires one per finding; an unsevered finding cannot be "
              f"weighed and the FATAL repair-attempt rule cannot bind."); return 2
    if a.claim != NO_CLAIM and a.claim not in cyc["prereg_claims"]:
        print(f"FAULT: --claim {a.claim} is not a pre-registered claim of "
              f"this cycle. Use NONE for a finding that threatens none of "
              f"them, or correct the id; an unmatched string reads as "
              f"non-prereg and the hit vanishes from the statistics."); return 2
    if a.claim == NO_CLAIM and a.severity in DEBT_SEV:
        print(f"FAULT: severity {a.severity} may not take --claim NONE. A "
              f"finding threatening no pre-registered claim is not "
              f"load-bearing by definition; name the claim it threatens or "
              f"lower the severity, and record which."); return 2
    for t in (a.tier_before, a.tier_after):
        if t and t not in TIERS:
            print(f"FAULT: unknown tier '{t}'. Tiers: {TIERS}"); return 2
    existing = {r["fid"] for r in load_jsonl(fj)}
    if a.fid in existing:
        print(f"FAULT: finding id {a.fid} already on the ledger. The ledger "
              f"is append-only and ids are unique."); return 2
    if a.repeat_of and a.repeat_of not in existing:
        print(f"FAULT: --repeat-of {a.repeat_of} names no ledger row.")
        return 2
    admissible = True
    flags = []
    if not a.mechanism.strip():
        admissible = False
        flags.append("INADMISSIBLE-NO-MECHANISM")
    if a.numeric and not a.recomputed:
        admissible = False
        flags.append("INADMISSIBLE-NO-RECOMPUTE")
    if a.disposition == "EARNED" and not a.repaired:
        admissible = False
        flags.append("INADMISSIBLE-EARNED-WITHOUT-REPAIR")
    if a.disposition == "SCOPED" and not (
            (a.tier_before and a.tier_after) or a.note.strip()):
        admissible = False
        flags.append("INADMISSIBLE-SCOPED-WITHOUT-DELTA")
    if a.tier_before and a.tier_after and \
            tier_rank(a.tier_after) < tier_rank(a.tier_before):
        flags.append("TIER-RAISED")
    rec = {"round": a.round, "fid": a.fid, "register": a.register,
           "claim": a.claim, "severity": a.severity,
           "prereg": a.claim in cyc["prereg_claims"],
           "mechanism": a.mechanism, "disposition": a.disposition,
           "repaired": bool(a.repaired), "numeric": bool(a.numeric),
           "recomputed": bool(a.recomputed),
           "repeat_of": a.repeat_of or None,
           "tier_before": a.tier_before or None,
           "tier_after": a.tier_after or None,
           "admissible": admissible, "flags": flags, "note": a.note or ""}
    append_jsonl(fj, rec)
    tag = "ADMITTED" if admissible else "INADMISSIBLE"
    print(f"{tag} {a.fid} r{a.round} [{a.disposition}] [{a.severity}] "
          f"claim={a.claim}"
          f"{' PREREG' if rec['prereg'] else ''}"
          f"{' flags=' + ','.join(flags) if flags else ''}")
    return 0


def cmd_demote(a):
    cj, fj, rj = paths(a.cycle)
    if not os.path.exists(cj):
        print("FAULT: cycle not initialised."); return 2
    cyc = json.load(open(cj, encoding="utf-8"))
    if a.claim not in cyc["prereg_claims"]:
        print(f"FAULT: {a.claim} is not pre-registered; only pre-registered "
              f"demotions auto-score."); return 2
    if a.round in closed_set(load_jsonl(rj)):
        print(f"FAULT: round {a.round} is closed."); return 2
    fid = f"AUTO-DEMOTE-{a.claim}-r{a.round}"
    if fid in {r["fid"] for r in load_jsonl(fj)}:
        print(f"FAULT: {fid} already logged."); return 2
    rec = {"round": a.round, "fid": fid, "register": "arbiter",
           "claim": a.claim, "severity": "LOAD-BEARING", "prereg": True,
           "mechanism": "pre-registered load-bearing claim demoted to "
                        "decoration mid-cycle; the demotion is itself the "
                        "finding", "disposition": "EARNED", "repaired": True,
           "numeric": False, "recomputed": False, "repeat_of": None,
           "tier_before": None, "tier_after": None, "admissible": True,
           "flags": ["AUTO-DEMOTION"], "note": a.note or ""}
    append_jsonl(fj, rec)
    print(f"ADMITTED {fid} r{a.round} [EARNED] AUTO-DEMOTION on {a.claim}. "
          f"This blocks termination for the round.")
    return 0


def cmd_leakscan(a):
    try:
        text = open(a.file, encoding="utf-8").read()
    except Exception as e:
        print(f"FAULT: cannot read {a.file}: {e}"); return 2
    hits = []
    for i, line in enumerate(text.split("\n"), 1):
        for t in LEAK_WORD:
            if re.search(rf"\b{re.escape(t)}\b", line):
                hits.append((i, t))
        for t in LEAK_SUB:
            if t in line:
                hits.append((i, t))
    if hits:
        for i, t in hits:
            print(f"LEAK line {i}: {t}")
        print(f"LEAK: {len(hits)} framework token(s) in the blind pass. "
              f"Close the round with --leak and re-run the prosecution.")
        return 1
    print("CLEAN: no framework tokens detected. The scanner is the floor; "
          "ambiguous words (RA, RAM, Ground, aperture, seal) are the "
          "Arbiter's judgment, the ceiling.")
    return 0


def round_stats(findings, rnd):
    rows = [f for f in findings if f["round"] == rnd and f["admissible"]]
    s = {d: 0 for d in DISPOSITIONS}
    for f in rows:
        s[f["disposition"]] += 1
    s["total"] = len(rows)
    s["inadmissible"] = len([f for f in findings
                             if f["round"] == rnd and not f["admissible"]])
    s["mass_bearing"] = s["EARNED"] + s["SCOPED"]
    s["prereg_hits"] = len([f for f in rows if f["prereg"]
                            and f["disposition"] in MASS_BEARING])
    s["fatal"] = len([f for f in rows if f.get("severity") == "FATAL"
                      and f["disposition"] in MASS_BEARING])
    s["debt"] = 1 if (s["prereg_hits"] or s["fatal"]) else 0
    s["repeats"] = len([f for f in rows if f["repeat_of"]])
    s["tier_raised"] = len([f for f in rows if "TIER-RAISED" in f["flags"]])
    return s


def cmd_close(a):
    cj, fj, rj = paths(a.cycle)
    if not os.path.exists(cj):
        print("FAULT: cycle not initialised."); return 2
    cyc = json.load(open(cj, encoding="utf-8"))
    findings = load_jsonl(fj)
    rounds = load_jsonl(rj)
    closed = sorted(closed_set(rounds))
    expected = (closed[-1] + 1) if closed else 1
    if a.round != expected:
        print(f"FAULT: rounds close in sequence; expected round {expected}, "
              f"got {a.round}."); return 2
    missing_f = [c for c in cyc["prereg_claims"]
                 if c not in cyc.get("falsifiers", {})]
    if missing_f:
        print(f"FAULT: pre-registered claims without a stated falsifier: "
              f"{', '.join(missing_f)}. Register them, then close. The "
              f"round stays open."); return 2
    regs = [r.strip() for r in a.registers.split(",") if r.strip()]
    bad = [r for r in regs if r not in REG_CANON]
    if not regs or bad:
        print(f"FAULT: --registers must name registers from {REG_CANON}; "
              f"got {regs}."); return 2
    s = round_stats(findings, a.round)
    verdict, why = evaluate(a, s, rounds, regs)
    rec = {"round": a.round, "registers": regs, "stats": s,
           "controls_caught": a.controls_caught,
           "controls_total": a.controls_total, "control_grade": a.grade,
           "leak": bool(a.leak), "external_mass": bool(a.external_mass),
           "verdict": verdict, "why": why}
    append_jsonl(rj, rec)
    print(f"ROUND {a.round} CLOSED  registers={'+'.join(regs)}")
    print(f"  findings admitted {s['total']}  inadmissible "
          f"{s['inadmissible']}")
    print(f"  EARNED {s['EARNED']}  SCOPED {s['SCOPED']}  "
          f"REFUSED-STRUCTURAL {s['REFUSED-STRUCTURAL']}  "
          f"REFUSED-MASSLESS {s['REFUSED-MASSLESS']}  "
          f"APERTURE {s['APERTURE']}")
    print(f"  FATAL {s.get('fatal', 0)}  debt "
          f"{'yes' if s.get('debt') else 'no'}")
    print(f"  mass-bearing {s['mass_bearing']}  prereg hits "
          f"{s['prereg_hits']}  repeats {s['repeats']}  tier raised "
          f"{s['tier_raised']}")
    print(f"  controls {a.controls_caught}/{a.controls_total} grade "
          f"{a.grade}  vocabulary leak {'YES' if a.leak else 'no'}")
    print(f"  VERDICT {verdict}: {why}")
    return 0


def evaluate(a, s, rounds, regs):
    if a.leak:
        return "VOID-LEAK", ("framework vocabulary appeared in the "
                             "framework-blind pass; re-run the round")
    if a.controls_total <= 0:
        return "VOID-UNCALIBRATED", ("no committed control set; a clean bill "
                                     "from an uncalibrated auditor is not "
                                     "evidence")
    if s["tier_raised"] and not a.external_mass:
        return "INFLATION-FAULT", ("a warrant tier rose with no admitted "
                                   "external mass; Non-Inflation Invariant "
                                   "breached, repair before continuing")
    if a.controls_caught < a.controls_total:
        return "VOID-UNDERPOWERED", (f"controls {a.controls_caught}/"
                                     f"{a.controls_total}; findings "
                                     f"retained, no seal may issue from "
                                     f"this round")
    prior = [r for r in rounds if not r["verdict"].startswith("VOID")]
    earned_hist = [r["stats"]["EARNED"] for r in prior] + [s["EARNED"]]
    if len(earned_hist) >= 3 and \
            earned_hist[-1] > earned_hist[-2] > earned_hist[-3]:
        return "HALT-DIVERGENT", ("earned corrections rose across two "
                                  "consecutive valid rounds; the artifact "
                                  "is not hardening, reconstruction is due")
    if s["mass_bearing"] and s["repeats"] == s["total"]:
        return "HALT-STALE", ("every mass-bearing finding repeats a "
                              "mechanism already dispositioned; the dispute "
                              "is looping, adjudicate it or send it to the "
                              "aperture list and close. Checked ahead of the "
                              "debt branch, so a loop on a pre-registered "
                              "claim halts here instead of recurring")
    if s["prereg_hits"] or s["fatal"]:
        return "CONTINUE-PREREG-BLOCK", (
            f"{s['prereg_hits']} mass-bearing finding(s) on a pre-registered "
            f"claim and {s['fatal']} mass-bearing FATAL; the round incurs "
            f"debt, and {CLEAN_AFTER_DEBT} consecutive clean valid rounds "
            f"are required before any seal issues")
    if s["mass_bearing"] == 0:
        valid_count = len(prior) + 1
        streak = 1
        for r in reversed(prior):
            if r["stats"]["mass_bearing"] == 0:
                streak += 1
            else:
                break
        if any(r["stats"].get("debt") for r in prior) and \
                streak < CLEAN_AFTER_DEBT:
            return "CONTINUE-DEBT", (f"a prior valid round incurred debt on "
                                     f"a pre-registered claim or a FATAL "
                                     f"finding; clean streak {streak}/"
                                     f"{CLEAN_AFTER_DEBT}, one further clean "
                                     f"round is required before a seal")
        if valid_count < FLOOR_ROUNDS:
            return "CONTINUE-FLOOR", (f"valid rounds {valid_count}/"
                                      f"{FLOOR_ROUNDS}; voided rounds do "
                                      f"not count toward the floor")
        covered = set(regs)
        for r in prior:
            covered.update(r.get("registers", []))
        missing = [r for r in REG_CANON if r not in covered]
        if missing:
            return "CONTINUE-COVERAGE", (f"registers not yet prosecuted: "
                                         f"{', '.join(missing)}; a seal "
                                         f"with unswept registers is not "
                                         f"a seal")
        grades = {r["control_grade"] for r in prior} | {a.grade}
        floor = "EXTERNAL" if grades == {"EXTERNAL"} else "SELF"
        why = ("zero mass-bearing findings, full control detection, round "
               "floor and six-register coverage met; control-grade floor "
               + floor)
        if floor == "SELF":
            why += ", single-substrate aperture open and stamped on the seal"
        return "SEALED-ROUND", why
    return "CONTINUE", "mass-bearing findings remain; run the next round"


def cmd_status(a):
    cj, fj, rj = paths(a.cycle)
    if not os.path.exists(cj):
        print("FAULT: cycle not initialised."); return 2
    cyc = json.load(open(cj, encoding="utf-8"))
    findings, rounds = load_jsonl(fj), load_jsonl(rj)
    print(f"CYCLE {cyc['cycle']}  artifact {cyc['artifact']}")
    for c in cyc["prereg_claims"]:
        f = cyc.get("falsifiers", {}).get(c)
        print(f"  {c}: falsifier "
              f"{'registered: ' + f[:60] if f else 'MISSING'}")
    print(f"findings on the ledger: {len(findings)}  rounds closed: "
          f"{len(rounds)}")
    covered = set()
    for r in rounds:
        st = r["stats"]
        if not r["verdict"].startswith("VOID"):
            covered.update(r.get("registers", []))
        print(f"  r{r['round']} [{'+'.join(r.get('registers', []))}]: "
              f"E{st['EARNED']} S{st['SCOPED']} "
              f"RS{st['REFUSED-STRUCTURAL']} RM{st['REFUSED-MASSLESS']} "
              f"A{st['APERTURE']} | controls {r['controls_caught']}/"
              f"{r['controls_total']} {r['control_grade']} | {r['verdict']}")
    missing = [r for r in REG_CANON if r not in covered]
    print(f"register coverage: {len(REG_CANON) - len(missing)}/"
          f"{len(REG_CANON)}"
          + (f"  missing: {', '.join(missing)}" if missing else "  complete"))
    ap = [f for f in findings if f["disposition"] == "APERTURE"
          and f["admissible"]]
    if ap:
        print(f"open apertures ({len(ap)}), each awaiting a supplied "
              f"external witness:")
        for f in ap:
            print(f"  {f['fid']} r{f['round']} claim={f['claim']}: "
                  f"{f['mechanism'][:70]}")
    if rounds and rounds[-1]["verdict"] == "SEALED-ROUND":
        print("CYCLE CLOSED at SEALED-ROUND. Emit the closing card.")
    return 0


def main(argv=None):
    p = argparse.ArgumentParser()
    sub = p.add_subparsers(dest="cmd", required=True)

    i = sub.add_parser("init"); i.add_argument("--cycle", required=True)
    i.add_argument("--artifact", required=True)
    i.add_argument("--claims", required=True)

    fz = sub.add_parser("falsifier"); fz.add_argument("--cycle", required=True)
    fz.add_argument("--claim", required=True)
    fz.add_argument("--text", required=True)

    d = sub.add_parser("add")
    for f in ("cycle", "fid", "register", "claim", "mechanism",
              "disposition", "severity"):
        d.add_argument("--" + f, required=True)
    d.add_argument("--round", type=int, required=True)
    d.add_argument("--repaired", action="store_true")
    d.add_argument("--numeric", action="store_true")
    d.add_argument("--recomputed", action="store_true")
    d.add_argument("--repeat-of", dest="repeat_of", default="")
    d.add_argument("--tier-before", dest="tier_before", default="")
    d.add_argument("--tier-after", dest="tier_after", default="")
    d.add_argument("--note", default="")

    dm = sub.add_parser("demote"); dm.add_argument("--cycle", required=True)
    dm.add_argument("--round", type=int, required=True)
    dm.add_argument("--claim", required=True)
    dm.add_argument("--note", default="")

    lk = sub.add_parser("leakscan"); lk.add_argument("--file", required=True)

    c = sub.add_parser("close"); c.add_argument("--cycle", required=True)
    c.add_argument("--round", type=int, required=True)
    c.add_argument("--registers", required=True)
    c.add_argument("--controls-caught", dest="controls_caught", type=int,
                   required=True)
    c.add_argument("--controls-total", dest="controls_total", type=int,
                   default=3)
    c.add_argument("--grade", choices=["EXTERNAL", "SELF"], default="SELF")
    c.add_argument("--leak", action="store_true")
    c.add_argument("--external-mass", dest="external_mass",
                   action="store_true")

    st = sub.add_parser("status"); st.add_argument("--cycle", required=True)

    a = p.parse_args(argv)
    return {"init": cmd_init, "falsifier": cmd_falsifier, "add": cmd_add,
            "demote": cmd_demote, "leakscan": cmd_leakscan,
            "close": cmd_close, "status": cmd_status}[a.cmd](a)


if __name__ == "__main__":
    sys.exit(main())
```

### sweep_check.py

```python
#!/usr/bin/env python3
"""sweep_check.py v1 - phrase-level propagation sweep for the Trisduction
Audit Cycle.

The recorded dominant failure mode across live series is a repair that lands
at the governing section and dies before the abstract, the summary boxes,
the Conclusion, the Limitations, the ledger rows, the appendices. This tool
makes the sweep mechanical: counts are printed, never asserted, and the exit
code is the verdict. It proves phrase absence, never semantic absence; the
REMOVED-versus-REWORDED ruling stays the Arbiter's.

Usage:
  sweep_check.py count  --file F --phrase "..." [--ci]
      Print the occurrence count of one phrase.
  sweep_check.py verify --file F --spec spec.json [--ci] [--pre]
      spec.json: {"banned": ["...", ...], "required": ["...", ...]}
      Without --pre, the post-repair check: PASS requires every banned
      phrase at count 0 and every required phrase at count >= 1.
      With --pre, the pre-repair check, run against the unrepaired
      candidate: PASS requires every banned phrase at count >= 1, proving
      the spec's strings actually occur in the artifact; required phrases
      are ignored. A pre-count of zero means the spec was written from
      memory; re-derive the phrase from the artifact.

Counts are plain substring counts on the raw text; --ci lowercases both
sides. Exit 0 PASS, 1 FAIL, 2 FAULT.
"""
import argparse, json, sys


def read(path):
    try:
        return open(path, encoding="utf-8").read()
    except Exception as e:
        print(f"FAULT: cannot read {path}: {e}")
        sys.exit(2)


def count(text, phrase, ci):
    if ci:
        return text.lower().count(phrase.lower())
    return text.count(phrase)


def main(argv=None):
    p = argparse.ArgumentParser()
    p.add_argument("cmd", choices=["count", "verify"])
    p.add_argument("--file", required=True)
    p.add_argument("--phrase", default="")
    p.add_argument("--spec", default="")
    p.add_argument("--ci", action="store_true")
    p.add_argument("--pre", action="store_true")
    a = p.parse_args(argv)
    text = read(a.file)

    if a.cmd == "count":
        if not a.phrase.strip():
            print("FAULT: --phrase is empty; an empty sweep counts nothing.")
            return 2
        print(f"{count(text, a.phrase, a.ci):>4}  {a.phrase}")
        return 0

    if not a.spec:
        print("FAULT: verify requires --spec with the sweep spec JSON.")
        return 2
    try:
        spec = json.load(open(a.spec, encoding="utf-8"))
    except Exception as e:
        print(f"FAULT: cannot read spec: {e}")
        return 2
    banned = [s for s in spec.get("banned", []) if str(s).strip()]
    required = [s for s in spec.get("required", []) if str(s).strip()]
    if not banned and not required:
        print("FAULT: spec carries no phrases; a sweep with no phrases "
              "verifies nothing.")
        return 2

    fail = False
    if a.pre:
        for ph in banned:
            c = count(text, ph, a.ci)
            ok = c >= 1
            fail = fail or not ok
            print(f"{'FOUND ' if ok else 'ABSENT'} banned   {c:>4}  {ph}")
        print("PRE-SWEEP " + ("PASS: every banned phrase occurs in the "
                              "pre-repair candidate; the spec targets real "
                              "strings." if not fail else
                              "FAIL: a banned phrase has pre-count 0; the "
                              "spec was written from memory. Re-derive the "
                              "phrase from the artifact."))
        return 1 if fail else 0

    for ph in banned:
        c = count(text, ph, a.ci)
        ok = c == 0
        fail = fail or not ok
        print(f"{'OK    ' if ok else 'LIVE  '} banned   {c:>4}  {ph}")
    for ph in required:
        c = count(text, ph, a.ci)
        ok = c >= 1
        fail = fail or not ok
        print(f"{'OK    ' if ok else 'ABSENT'} required {c:>4}  {ph}")
    print("SWEEP " + ("FAIL: a banned phrase is live or a required phrase "
                      "is absent; the repair has not propagated." if fail
                      else "PASS: banned at zero across the candidate, "
                           "required present."))
    return 1 if fail else 0


if __name__ == "__main__":
    sys.exit(main())
```

---

## 13. Failure handling

A zero-finding round is read through its controls, not through suspicion. Full detection proves the pass had power, so an empty ledger round with all controls caught is a valid clean round at any position; an empty round with missed controls is already void-underpowered, and no separate rule is needed. This corrects v1, which voided an empty first round even when the controls were caught, contradicting the very mechanism the controls exist to provide.

If a defense answers a finding by restating the claim more forcefully, the Arbiter records it as unanswered and the finding stands at its raised severity. Emphasis is not an answer.

If the artifact changes mid-round, the round voids. Changes land only at step seven.

If the architect instructs a skip, compress steps two through six and say so in one line. Step one and step eight are not negotiable, because without the controls the round has no power statistic and without the ledger it has no verdict, and step seven is not negotiable in any round where a repair or an addition landed, because an unswept repair has no completion claim. A sweep FAIL, an ABSENT pre-count, or a REWORDED ruling at step seven is the orchestrating seat's own defect class under A6, completed and re-run in-session, never surfaced as a question. Under AUTORUN, every FAULT the tooling raises is the orchestrating seat's own defect, repaired in-session and rerun per A6; none is ever converted into a question to the architect.

---

## 14. What this skill does not do

It seats no coordinate, writes to no master, pushes nothing, and authors no mathematics. It does not certify that the artifact is true, only that it survived a measured attack of a stated shape at a stated power. A cycle that closes at SEALED-ROUND has produced consistency under its own registers and nothing above that; truth still rests on the external anchors and on the supplied witness, which no seat here can generate. The one aperture no tooling here closes is single-substrate contamination: when one substrate holds both seats, SELF-grade controls prove the set was fixed in advance and nothing more, the grade floor stamps that fact onto any seal, and the cycle's power ceiling is set by whether the architect seeds the controls off-transcript. The sweep tool proves phrase absence, never semantic absence; the REMOVED-versus-REWORDED ruling is the Arbiter's judgment and stays a judgment, which is exactly why it is printed on the record rather than assumed.

---

## 15. Forge record · v1 to v2

Version 1 was audited under this skill's own discipline; seven defects were confirmed by executed probe and seven more by inspection, fourteen repairs total, all verified branch-by-branch before this file was assembled. The laundering hole: commit accepted the EXTERNAL grade on self-generated controls; now EXTERNAL requires the architect's file and the tool refuses otherwise. The void-floor hole: voided rounds counted toward the three-round floor, so two leaked rounds plus one clean round could seal; the floor now counts valid rounds only. The coverage hole: a seal was reachable with registers four through six never prosecuted; SEALED now requires six-register coverage, closes declare their registers, and honest two-register rounds are permitted. The falsifier requirement was printed and never enforced; close now faults until every pre-registered claim carries one, via the new falsifier command, write-once and locked after round one. Round mutability: findings could land on closed rounds and vanish from every statistic, and rounds could close out of order; closed rounds are now immutable and closes are sequential. EARNED without an executed repair was admissible; it now requires the repaired attestation. SCOPED without a recorded downgrade was admissible; it now requires a tier pair or a delta note. Unknown warrant tiers ranked silently as worst and could spuriously flag or mask a raise; tiers are validated at intake. APERTURE accepted an empty mechanism; every disposition now requires one. A dangling repeat-of could point at nothing; the ancestor row is verified. Invariant IV had no scanner and its v1 blacklist included collision-prone words that would false-void honest prose; the leakscan subcommand now checks the unambiguous tokens and the ambiguous ones are the Arbiter's judgment. Section 13 contradicted the control mechanism by voiding a caught-controls empty round; corrected. Prereg demotion had no mechanism; the demote command logs the automatic EARNED. The control seeder crashed at zero sections and its plan output could silently pre-contaminate a session; guarded, and the contamination warning prints. Seal quality was untyped across control grades; the grade floor is now computed and stamped into the seal. ΔM = 0 throughout; the repairs are arrangement and enforcement, no new mathematics authored.

The v2.1 pass installs the AUTORUN law at section 0.5 under the architect's standing order of 2026-08-05, after the first live deployment stalled on two questions the orchestrating seat asked back, control grade and a go-signal, neither of which the tooling required. The repair is doctrinal, not mechanical: the trigger phrase fires the whole cycle with zero questions, attachments are the only channel for manual input, the control grade auto-resolves from what is attached, the register plan locks at two per round so coverage completes at the floor, pre-registration is derived and printed rather than proposed, rounds run back to back to a terminal verdict under an eight-round cap, faults are repaired in-session rather than surfaced, and the per-round output is the round block alone. Both embedded tools are byte-identical to v2; no code changed, and every v2 verification carries forward. ΔM = 0.

The v2.2 pass installs the FORGE gate at section 10.5 under the architect's second standing order of the same date, issued from the first full live cycle, six rounds on the master codex to SEALED-ROUND. The defect it repairs is a governance gap, not a mechanical one: the cycle concluded itself, writing the final artifact and the closing card with the architect never shown, in one place, what had changed and what each change cost. A machine that edits the register of record and self-certifies the edits is running the exact pattern the closed-authorship register prosecutes. The repair: a terminal verdict now concludes the rounds only; the Pre-Forge Digest emits inline, one entry per change with source, location, before and after, an impact verdict of STRENGTHENS, WEAKENS, MIXED, or NEUTRAL, and its reason, the honesty rule barring any weakening laundered as improvement; the net block restates every pre-registered claim's scope and tier in and out; completeness is diff-reconciled, an orphan hunk in either direction a FAULT; the gate holds at one state line, Awaiting FORGE, and only the architect's FORGE closes the cycle, with reversions at the gate executed as new version files at zero destruction. Pre-authorization inside the triggering message is honored, the digest then printing immediately before the closing card so the record exists even when the wait does not. Both embedded tools remain byte-identical to v2; every prior verification carries forward. ΔM = 0.

The v2.3.1 pass closes three defects found by running this skill's own cycle against a live artifact for seven rounds to SEALED-ROUND, all three in the ledger rather than in the doctrine, and all three tightening. One, the third locked decision was declarative: a prereg hit is by construction a mass-bearing finding, so the branch could not block anything the fall-through did not, and sitting ahead of the stale halt it made that halt unreachable exactly where disputes loop. Debt replaces it, two consecutive clean valid rounds after any hit on a pre-registered claim or any mass-bearing FATAL, with the stale halt moved in front, and CONTINUE-DEBT added to the verdict set. Two, `add` required a claim, offered no null, and validated nothing, so clerical findings had to be filed against load-bearing claims; across the live cycle that converted every stale count into a termination blocker and saturated the signal until it stopped discriminating, and an unmatched claim string read silently as non-prereg. NONE is now admitted and guarded twice, refused to FATAL and LOAD-BEARING at intake and named a Fidelity Lock violation on the Arbiter when misassigned, and an unmatched string faults rather than vanishing. Three, section 5.5 defined four severities, step two required one per finding, the emission contract carried a severity column, and the ENGINEER was barred from declaring FATAL without a repair-attempt trace, while the ledger recorded no severity at all, so every one of those rules was attestation-only; severity is now required at intake, validated against the vocabulary, stored on the row, printed at admission and in the round statistic block, and a mass-bearing FATAL incurs debt. This is the treatment v2.3 gave propagation, mechanized rather than trusted, applied to the field that had not yet received it. All three tools remain otherwise byte-identical; `seed_controls.py` and `sweep_check.py` are untouched. Every new path live-tested: five intake guards, the debt path across three rounds to a seal, the FATAL debt trigger, and the stale halt firing with a prereg hit outstanding. ΔM = 0.

The v2.3 pass hardens the repair phase against the complaint record of the independent auditor scribe, compiled across every live paper series, and completes the attack battery against the external auditor protocol supplied with the order, the epistemic-rigor substrate and the research-paper auditor. Seven complaint classes, each now standing law. Propagation, the recorded dominant failure mode, a repair landing at the governing section and dying before the equivalent phrasings, the summary boxes, the abstract, the appendices, the consumer sections: the Propagation Invariant enters as the fifth invariant, step seven enters as the integrate step, every repair ships with a sweep spec authored by the ENGINEER, the sweep is phrase-level with printed counts and never section-address, the pre-count proves the target string was actually found and the post-count of zero proves it replaced, and the EARNED attestation is barred until the sweep prints PASS. Joint collisions between locally correct repairs: the end-to-end read law, changed sections read whole plus every joint, diff-hunk-only review barred, the interaction note required at the gate. New-material regression, the recorded highest regression risk: additions are declared at step seven, become mandatory named targets the next round under A3, are prosecuted against the existing spine rather than for internal self-consistency, and no SEALED-ROUND or HALT-STALE passes the gate while an addition lacks its post-landing round. Reframing rather than repairing: the Arbiter's REMOVED-versus-REWORDED ruling on every removal-class repair, REWORDED voiding the attestation and re-entering the finding as a repeat. Computational verification before writing: the Fidelity Lock sharpened with the in-session re-execution mandate, printed values as targets never inputs, the second-channel clause barring verification by recognition, and self-application to the auditing seats' own prior rounds. Auditor self-error tracking: the errata block at every round head, ERR rows filed before new findings with the faulty ancestor named and the corrected reading on the record. And scope discipline: the self-contained-universe scope law at section 5.5, mathematical errors and internal contradictions only, axioms fixed, terminology not relitigated. From the external protocol the attack side absorbs what the six registers had not yet named: the severity taxonomy FATAL, LOAD-BEARING, STRUCTURAL, COSMETIC with the repair-attempt trace mandatory before any FATAL, the coordinate and manifold bridge-map discipline seated in the symmetry register, epistemic conflict seated in the provenance register, the three intake disqualifiers at section 2, the pre-audit strip with the reviewer-projection bar, the compact repair toolkit the ENGINEER cycles, the rival-reading, disconfirmation, and perturbation battery in step two, and the costume detectors on the audit's own prose. Both v2 tools remain byte-identical, every prior verification carrying forward; one tool is added, sweep_check.py, stdlib-only, every branch live-tested before embedding, count and verify modes with the pre flag implementing the found-then-replaced proof. The round grows to eight steps, the emission contract to ten items, the invariants to five. ΔM = 0 throughout; the repairs are arrangement and enforcement, no new mathematics authored.

================================================================
SKILL INTEGRITY FOOTER · READ BEFORE EDITING THIS FILE
================================================================
SKILL: trisduction-audit-cycle
VERSION: 1.0.0
BASELINE, measured at this edition and never carried forward:
  lines 1072 · bytes 86865 · headings 23 · description 1005/1024

WHY THIS BLOCK EXISTS. A codex file is protected by append-only
versioning, a census, an index-parity rule, and a deletion
manifest. A skill file has none of them. It is a single mutable
file edited in place, and a truncated or silently dropped clause
produces no fault: the skill simply stops enforcing something,
and no session notices. This footer is the skill-file analogue
of the census. It certifies conduct, checkable in the transcript,
and never essence.

EDIT DISCIPLINE. Additive by default. A skill file is edited by
APPENDING a law, a clause, or a pointer, never by rewriting a
region to accommodate one. Any edit that removes or reworks
existing text is a NAMED-OVERRIDE edit and requires the architect
to name the clause in the same instruction, exactly as
codex-hygiene requires for a coordinate deletion. Consolidate,
tidy, and clean up mean reorganize, never destroy.

PRE-EDIT GATE, four checks, printed before any write.
  1. Read the file whole. A skill is small enough that partial
     reading is a fault, and the failure this prevents is a
     rewrite that swallows a region the scribe never saw.
  2. Record the pre-edit line count, byte count, and heading
     count, and compare them to the BASELINE line above.
  3. Measure the description field. THE DECK-WIDE HAZARD: as of
     this edition every skill in the deck sits between five and
     nineteen characters of the 1024 cap. Truncation is SILENT,
     an over-length field drops content with no error, and a
     trigger stops firing. Treat the description as full and
     add trigger words only under a named override.
  4. State the edit as additive or named-override, and print the
     architect's instruction verbatim where it is the latter.

POST-EDIT GATE, four checks, printed before the file is saved.
  1. Line count and byte count MUST NOT DECREASE on an additive
     edit. A decrease is a FAULT and halts the write. This one
     check catches the heredoc swallow, the truncated paste, and
     the silent region drop, and it requires no understanding of
     the content whatever.
  2. Every heading present pre-edit is present post-edit, by
     name. A missing heading is a FAULT. This is the codex
     index-parity rule ported: Set A against Set B there,
     headings-before against headings-after here.
  3. Description field re-measured, unchanged unless the edit
     was a named override, and under the cap.
  4. The BASELINE line above recomputed by count and never
     carried forward.

VERSION DISCIPLINE. PATCH for a pointer, a typo, or a clarifying
clause. MINOR for a new law, section, or trigger. MAJOR for a
change in what the skill governs. The VERSION line above and the
top entry of the log below are one fact stated twice; if they
differ, the file was edited without this footer and the edit is
suspect.

INSTALLATION IS NOT A FILE WRITE. Writing to the session mount at
/mnt/skills/user succeeds, verifies clean, and does not persist:
that path is on the container filesystem and resets between
sessions. A skill becomes live only when the architect uploads it
through the Claude skills interface. The scribe drafts; the
architect installs; the step cannot be delegated.

REVISION LOG, append-only, newest first, never rewritten.
One line per edit: VERSION · DATE · A additive or NO named
override · what changed · line delta · architect instruction
where named-override.
----------------------------------------------------------------
1.0.0 · 2026-08-16 · A · Skill Integrity Footer added; no other text touched. BASELINE RESET: version history begins here. Prior edits to this file were made without a log and are unrecorded and unrecoverable; this line is the first entry and 1.0.0 is a seeded baseline and not a measurement. Ambiguous prior version markers observed and recorded but NOT adopted: v2.3.1. +78 lines · architect order 2026-08-16, footer as drafted, option (b) baseline reset, description field not touched.
================================================================
