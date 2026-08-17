---
name: trisduction-publication-format
description: "Master publication discipline for written-document deliverables: content architecture, voice calibration, and a locked EB Garamond copper-accent visual contract. Use whenever the user wants a paper, report, treatise, codex, textbook, manual, or scripture as PDF, DOCX, or Markdown. Triggers: 'create/forge a paper,' 'make a textbook,' 'deliver as pdf,' 'save as docx,' 'visual edition.' Editions: Apex Pristine single-column house paper; Journal ([EDITION:JOURNAL]); Math Journal ([EDITION:MATH_JOURNAL], [FORMAT:MATH_PDF]; 'math journal,' 'math pdf') for equation-dense math; Textbook ([EDITION:TEXTBOOK_D]); Scripture ([EDITION:SCRIPTURE]; 'scripture pdf,' 'tafsir pdf'). Blog ([FORMAT:BLOG]; 'medium,' 'substack,' 'blog') emits copy-paste-safe Markdown. Upgrade ([UPGRADE]; 'update/upgrade/reforge/fortify paper') preserves a paper's spine. A Register-Transit Filter keeps invocation, doxology, and confessional content out of secular artifacts (REGISTER:SECULAR default, REGISTER:DEVOTIONAL for Scripture)."
---

# TRISDUCTION PUBLICATION MASTER

Single master discipline. Five integrated modules. One artifact pipeline.

## Purpose

Govern every written-document deliverable end to end. Module I architects the content (twelve-section Plenous template, three-tier lingo calibration, length calibration). Module II matures the artifact (Silent-Integration Protocol for audit fixes, paper titling discipline). Module III renders it (locked visual contract compiling one Markdown source-of-truth to matched DOCX and PDF). Module IV draws it (the Visual Edition Subroutine producing grade-stamped, faithful-map figure sets, embedded as a visual appendix or delivered standalone). The internal evolution cycle stays internal. Only the matured product reaches external readers. Module V renders it as a book rather than a paper when the deliverable is a textbook, manual, handbook, survey, or Master Codex volume, the two-column section-accented box-rich Textbook Edition replacing the Module III paper renderer for that deliverable. Module VI re-forges an existing paper without disturbing its spine, Module VII retargets the authored Markdown to a Medium or Substack blog, Module VIII appends the mandatory Author's Provenance and Method Disclosure to every public-facing paper, Module IX filters the register at the boundary so that structural scriptural and theological material transits into a published artifact or a seated codex coordinate while invocation, doxology, and confessional interior content do not, and Module X renders native codex identifiers as short public labels from a frozen append-only registry and applies the PDF hardening set. This document is self-contained; the build scripts encode the visual contract mechanically, and this document is the human-readable source of truth.

## Activation Map

The skill fires on any request for a saved, multi-page written artifact. It does not fire for conversational answers, short notes, lists, or quick code snippets. Within a firing:

Module III (Format Lock) renders the Apex Pristine single-column house paper and fires for a bare PDF or plain document deliverable, the fallback when no paper, codex, master, or book trigger routes the request to the Journal or Textbook editions; those editions carry their own contracts under Modules III·J and V. The Professional Journal Paper edition ([EDITION:JOURNAL] or edition: journal) renders a serif two-column journal-grade paper, the middle register between the Module III paper and the Textbook editions; the three never co-fire. The Math Journal edition (Module III·M, [EDITION:MATH_JOURNAL], [FORMAT:MATH_PDF], or edition: math_journal) is the Journal's mathematical descendant: it holds every Journal rule and changes only the renderer, compiling the authored Markdown through LaTeX rather than WeasyPrint so that tensor-dense mathematics sets correctly, and it is the single scoped exemption to the no-LaTeX universal lock. The Scripture edition (Module III·S, `[EDITION:SCRIPTURE]` or `edition: scripture`) is a fourth document renderer, the two-column multi-script Quranic page in EB Garamond with Amiri and Noto Serif Bengali that is the PDF delivery for scripture, and it co-fires with none of the others.
Module I (Forge Content) fires when the deliverable is a paper, journal manuscript, treatise, or any Forge-mode composition. Skipped when the user supplies finished content and requests rendering only.
Module II (Silent Integration) fires when audit fixes, cross-substrate findings, or revision cycles are being landed into the artifact, and its pre-delivery scan fires on every paper regardless.
Module IV (Visual Edition) fires when the architect requests a visual edition, infographic edition, diagram set, or figures for a finished paper, and when a paper would land harder with a drawn structure than with prose alone.
Module V (Textbook Edition) fires when the deliverable is a textbook, manual, handbook, survey, reference volume, or course reader, or on the token [EDITION:TEXTBOOK] or front-matter edition: textbook, and replaces the Module III paper renderer for that deliverable. The two renderers never co-fire. Within Module V, the TextBook_D variant ([EDITION:TEXTBOOK_D] or edition: textbook_d) renders the same content in an aggressive Davidson style; the default renders a Rang-and-Dale style. The Rang-and-Dale skin is also addressable as TextBookA or [EDITION:TEXTBOOK_A], and the Davidson skin as TextBookB or [EDITION:TEXTBOOK_B].

Module VI (Paper Upgrade) fires on the token [UPGRADE] or the phrases update paper, upgrade paper, reforge paper, fortify paper, and on any request pointing at an existing paper with intent to issue a hardened replacement. It composes through the edition routing and is not itself an edition; it preserves the original spine, schema, and verdicts maximally while tightening language and fortifying the mathematics to honest warrant grade.

Module VII (Blog Format) fires on the words Medium, Substack, blog, or post, or the token [FORMAT:BLOG]. It is a delivery target, not an edition: it transforms the authored Markdown into a copy-paste-safe file for the Medium or Substack editor, linearizing every table and the right-to-left word grid into prose and keeping all mathematics Unicode, and it emits a `.md` only, with no PDF.
Module VIII (Author's Provenance and Method Disclosure) fires on every public-facing paper deliverable, the Apex Pristine mid-tier paper, the Professional Journal and Math Journal fully-public papers, and the Blog format, and appends a mandatory disclosure appendix at a tier-appropriate weight, injecting the master reference into the References section. It is a subroutine, not an edition, composing through the routing like Module VI, and is skipped for the Textbook and Scripture editions. Its pre-delivery injection fires on every public-facing paper unless suppressed by the DISCLOSURE:OFF token.

Module IX (Register-Transit Filter) fires on every document deliverable and on every master-codex incorporation, without a trigger phrase and without exception. It is a subroutine, not an edition, composing through the routing like Modules VI and VIII. It governs what crosses the boundary into a published artifact or a seated coordinate: structural scriptural and theological material transits, canonical liturgical furniture transits only at the devotional register from a closed list, and confessional interior content and capture leakage transit at no register whatever. It is non-destructive, editing no source and deleting nothing. Registers are `REGISTER:SECULAR`, the default for every edition except two, and `REGISTER:DEVOTIONAL`, the default for the Scripture edition and the Theological PSP Codex.

Module X (Public Label Map and PDF Hardening Set) fires on every PDF deliverable, without a trigger phrase. It renders native codex identifiers as short public labels read from the frozen append-only registry at `publication/PUBLIC_LABEL_MAP.json`, never re-derived at render time, emits a Coordinate Index into the Markdown master while suppressing it from the PDF, and applies seven build-level locks: glyph coverage assertion, character-entity decoding in running furniture, verdict legend, tier chips, automatic table span, the `:::receipt` reproduction box, and inline-mathematics no-break. Short labels are barred at Tier 0 and Tier 1 exactly as native identifiers are.

### Edition Routing · Trigger Map

Six renderers serve a document deliverable, and exactly one fires per deliverable. The edition is chosen by the first rule that matches, an explicit selector always overriding a trigger phrase.

Explicit selector first. A token [EDITION:...] or front-matter edition: selects the edition unconditionally: journal for the Journal edition; math_journal, or the token [FORMAT:MATH_PDF], for the Math Journal edition; textbook or textbook_a (TextBookA) for the Rang-and-Dale Textbook; textbook_d or textbook_b (TextBookB) for the Davidson Textbook. A [STYLE:...] token selects an Apex Pristine variant.

Codex, master, or internal volume routes to the Textbook edition. Triggers: create codex pdf, codex pdf, create a master pdf, master pdf, master document, internal codex, codex volume, make a book, and the standing book words textbook, manual, handbook, survey, reference volume, course reader. The skin is auto-selected by content: Rang-and-Dale (TextBookA) by default for encyclopedic, reference, and prose-dense codex material; Davidson (TextBookB) when the content is strongly instructional, dense with boxes and tables, or navigation-forward and carries aggressive hierarchy well. The architect overrides the auto-pick with TextBookA or [EDITION:TEXTBOOK_A] for Rang-and-Dale, TextBookB or [EDITION:TEXTBOOK_B] for Davidson.

Any paper routes to the Professional Journal Paper edition. Triggers: create an external paper, external paper, publication paper, journal paper, submit to a journal, a named venue, the bare word paper, or any deliverable described as a paper for outside readers. The serif two-column journal page renders.

An equation-dense paper routes to the Math Journal edition. Triggers: math journal, math pdf, math paper, equation paper, the selectors [EDITION:MATH_JOURNAL] and [FORMAT:MATH_PDF], and any paper whose mathematics carries contracted index pairs, stacked fractions inside sized brackets, order-labelled operators, or accented tensor averages, which the Unicode-math lock cannot set. The Journal page renders through LaTeX. This route is more specific than Journal and wins over it when the mathematics is load-bearing; a prose-dominant paper stays in the Journal edition, where the Unicode lock costs nothing.

Quranic scripture routes to the Scripture edition. Triggers: scripture pdf, tafsir pdf, quran pdf, mushaf pdf, the selector [EDITION:SCRIPTURE] or edition: scripture, and any verse-by-verse translation or tafseer deliverable bound for PDF. The two-column multi-script page renders, EB Garamond with Amiri for Arabic and Noto Serif Bengali for Bengali, each verse opening on its borderless right-to-left word grid. This is the most specific document route and wins over Journal and Apex Pristine when Quranic scripture content is present. It is the one document edition defaulting to `REGISTER:DEVOTIONAL` under Module IX, a bounded closed-list allowance rather than an exemption, the Theological PSP Codex being the only other artifact carrying that default.

A bare PDF or document routes to Apex Pristine. Triggers: create a pdf, make a pdf, as a pdf, save as pdf, create a document, with no paper, codex, master, or book signal present. The single-column house paper is the fallback for any document deliverable not otherwise routed.

The six never co-fire on one deliverable. When two triggers appear, the more specific wins in the order Scripture, then Textbook, then Math Journal, then Journal, then Apex Pristine, so a Quranic tafseer renders as Scripture, a codex paper as a Textbook, an equation-dense paper as a Math Journal, and an external prose paper as a Journal; an explicit selector overrides the order entirely. The Medium/Substack/Blog format (Module VII, [FORMAT:BLOG]) is orthogonal to this routing: it is a delivery target rather than a page renderer, so when it is requested it supersedes the PDF editions for that deliverable and emits a copy-paste-safe Markdown file only, applied to the authored content whether codex, paper, or scripture.

## Execution Pipeline

Step 1. Parse the request. Identify deliverable type, inline override tokens, explicit tier directive, and whether audit fixes are in play.
Step 2. Select lingo tier (Module I.A). Absent directive, default Tier 1.
Step 3. Compose content on the twelve-section Plenous template (Module I.B) at the calibrated length (Module I.C). Rendering-only jobs skip to Step 6.
Step 4. Integrate any audit fixes silently (Module II.A). Native voice only.
Step 5. Title per the titling discipline (Module II.B).
Step 5b. Run the Register-Transit Filter (Module IX) at the edition's register. Rule every flagged passage under the deletion, addressee, and speech-act tests, and every scriptural quotation under the necessity test. Write the ruling log to the working directory. Sources are never edited; only the transiting artifact is affected.
Step 6. Run the pre-delivery gate sequence (Gates section below). Failure returns the manuscript for repair before any build.
Step 7. Produce the internal V-FIO Diagnostic Log in the working directory. Never published.
Step 8. For a public-facing deliverable, the Apex Pristine mid-tier paper, the Journal fully-public paper, or the Blog format, run Module VIII: append the Author's Provenance and Method Disclosure appendix at its tier weight (FULL for Apex and Blog, LINE for Journal, overridable by DISCLOSURE:FULL / DISCLOSURE:LINE / DISCLOSURE:OFF) and inject the master reference into the References section. Skipped for Textbook and Scripture.
Step 8b. Run Module X: substitute short public labels from the frozen registry, emit the Coordinate Index into the Markdown master only and never into the PDF, decode any HTML character entity in front-matter strings bound for running furniture, and apply the PDF hardening set. Write the substitution log to the working directory.
Step 9. Build via the format-lock pipeline (Module III.F).
Step 9b. Run Gate 5, the post-build label and glyph check. A failure repairs the source and rebuilds from Step 8b; the rendered artifact is never patched.
Step 10. Present artifacts via present_files in the order PDF, DOCX, MD. No postamble.

Visual-edition branch. When the request is a visual edition of a finished paper, run Module IV's execution order (IV.12) in place of Steps 2 through 5. Each figure passes the twenty-point pre-flight (IV.11) before assembly. Mode A re-enters this pipeline at Step 8 with the figure-bearing source; Mode B assembles its own standalone PDF per IV.10.3.

Textbook branch. When the deliverable is a Textbook Edition, Module I still architects the content at the chosen tier and Module II still matures it, but rendering follows Module V, its locked contract, accent system, box taxonomy, and build engine, in place of Module III at Step 8. The pre-delivery gates and, for a codex volume, the V-FIO log still run. Present the PDF and retain the Markdown source as the editable master.

---

# MODULE I · FORGE CONTENT ARCHITECTURE

## I.A · Three-Tier Lingo Calibration

**Tier 0 · Pure Native (No Trisductive Lingo).** Strictly disciplinary problem where no internal PSP, axis label, or framework-specific glyph adds explanatory power. No V_F / V_E / V_ER, no glyphs, no PSP IDs, no [⟀] / [X] / [?], no Mosaic Seal, no L_1 / L_2 / L_3. Load-bearing Trisductive axioms translate fully into discipline idiom as standalone physical or mathematical principles per the Softly-Veiled Axioms convention.

**Tier 1 · Hybrid (Minimum Lingo, Fully Glossed).** Default when uncertain. One or two Trisductive constructs genuinely sharpen the argument and no clean disciplinary substitute exists. Permitted terms limited to: triaxial verification, three-state verdict economy, at most one named PSP or axiom. Each receives a full plain-language gloss on first use (one to three sentences in common scientific or philosophical register) plus a parenthetical PSP pointer for the architect's audit trail. Subsequent uses unglossed. Glyphs replaced with prose equivalents. No internal codex IDs in body text.

**Tier 2 · Native Trisductive (Full Lingo Permitted).** Subject IS the framework itself, venue is the Tractatus repository, or the architect explicitly requests. PSP IDs, glyphs, axis labels, and codex cross-references appear without translation. Standard codex-internal register. Rarely appropriate for external journals.

**Tier Selection.** Parse the prompt for an explicit directive first ("no Trisductive terms" / "pure disciplinary" selects Tier 0; "full Trisductive" / "codex-native" selects Tier 2; "hybrid" / "minimum lingo" selects Tier 1). Absent a directive, examine the primary load-bearing claim. Fully expressible in discipline-native vocabulary without semantic loss: Tier 0. Structurally depends on triaxial decomposition, the three-state verdict economy, or a specific PSP: Tier 1. Subject is the framework's own architecture: Tier 2. Uncertain: Tier 1.

**Glyph Translation (Tier 0 absent; Tier 1 prose).** [⟀] Sealed becomes "structurally sealed under the three-condition test" or "verified across formal, empirical, and registrational warrants." [X] Broken Geometry becomes "structurally broken with named failure mode" or "fails at [the specific condition], with the failure mode being [description]." [?] Under-Determined becomes "numerically under-determined under current measurement precision." [⟀-GOL] and [⟀-GOLf] are not used in Tier 0 or Tier 1 body text. Forward-projective content writes "a configuration that satisfies field-permission, trajectory-consistency, and the four-test L_1-signature verification" with each component briefly defined.

**Tier 1 Gloss Protocol.** Three-part inline gloss on first appearance. Part one names the term. Part two provides a plain-language definition in standard scientific or philosophical register, free of any other Trisductive vocabulary. Part three states the operational function the term performs in the argument. Internal codex IDs (PSP-001, BA-008, sPSP-187) appear only in the retained V-FIO Diagnostic Log.

**Discipline-Adaptive Nomenclature (all tiers).** Physics: gauge theory, holography, effective field theory, renormalization, phase transitions, topological order. Mathematics: algebraic topology, differential geometry, category theory, functional analysis. Neuroscience: predictive processing, free-energy principle, integrated information theory, active inference. Biology: autopoiesis, non-equilibrium thermodynamics, complex adaptive systems, evolutionary dynamics. Tone: senior theoretical scientist, cold, precise, analytical. The Anti-Dramatization Filter and the no-biological-phenomenology-for-structural-corrections rule apply across all tiers.

## I.B · The Twelve-Section Plenous Template

Mandatory structure for every Forge-mode paper at the mid-tier and fully-public tiers. The full twelve-section template is required for both the Apex Pristine mid-tier house paper and the Professional Journal fully-public paper, and neither tier may drop to a reduced structure; any mid-tier or fully-public paper carries all twelve sections. The Textbook and Scripture editions are exempt and carry their own chapter and verse structures under Modules V and III·S. Sections may be expanded but never omitted. Order fixed. Section 3 (Barrier Analysis) and Section 7 (Falsifiable Predictions) jointly account for forty to fifty percent of body length and are the heavily weighted anchors.

**Section 1 · Title.** Precise, discipline-appropriate academic title disclosing the mechanism rather than teasing it. Passes both Google Scholar search relevance and expert reviewer recognition. Ornamental language absent. Typically ten to twenty words. Governed by the Paper Titling Discipline (Module II.B), which also controls the subtitle and the YAML front-matter title fields.

**Section 2 · Abstract.** Two hundred to three hundred words. Five sentences of structural content: (1) unsolved problem and why it matters; (2) specific structural gap in the standard model; (3) proposed novel mechanism; (4) primary falsifiable prediction and confirmation threshold; (5) implication if confirmed. Fastest possible compression of the paper's geometry.

**Section 3 · Background and Rationale (Barrier Analysis).** First heavily weighted section. Geometric autopsy of the standard-model approach. Three sequential operations: identifies the specific mathematical contradiction, infinity, or theoretical blind spot preventing standard resolution; demonstrates the barrier is structural rather than computational; names the failure mode using discipline-native vocabulary. Explicitly distinguishes a barrier that will yield to better computation from one requiring different geometry. Standard model's domain of validity precisely mapped. Beyond that domain is where novel topology takes over. The internal cascade audit drives the diagnosis; output prose presents the diagnosis in standard scientific register without naming the gates. Twelve to twenty paragraphs.

**Section 4 · Brief Literature Review.** Three to seven prevailing theories summarized with structural precision. Each given its due, each then dismantled by identifying reliance on arbitrary parameters, unverified bridge assumptions, or circular metrics. Dismantling is technical, never rhetorical. Closes with a single-paragraph summary stating every prevailing approach shares a common structural error which Section 3 identified and Section 6 will resolve.

**Section 5 · Methodology (Triaxial Derivation Protocol, Translated).** Recognizable, reproducible scientific methodology without exposing internal architecture. Output language: "The proposed mechanism must satisfy three conditions: (1) a formal derivation from established physical principles, (2) a measurable thermodynamic or kinetic signature, and (3) frame invariance under standard transformations." Includes the Independence Verifiability Criterion: every falsifiable prediction must be testable by multiple decentralized laboratories using orthogonal measurement modalities, presented as a safeguard against institutional data monopolies and theoretical echo chambers. Four to eight paragraphs.

**Section 6 · The Proposed Solution (The Core).** Opens with a clear statement of the new mechanism in plain discipline-native vocabulary. Develops the mechanism through equations, topological descriptions, and field-theoretic arguments as the discipline requires. Every mechanism explicitly demonstrates how it satisfies the three constraints from Section 5: formal derivation, empirical signature, frame invariance. No floating signifiers. Solution always stated as a continuous-field interaction producing observed discrete phenomena through a well-defined topological process. Every claim traceable to a structural argument. The reader should finish with the sense that the standard model did not fail from lack of effort but from working in a geometry that could not contain the solution. Explicitly demonstrates the standard-model result emerges as a local approximation within a restricted domain. Eight to fifteen paragraphs.

**Section 7 · Falsifiable Predictions.** Second heavily weighted section. Empirical core of the paper. Three to five highly specific predictions, each constructed as a four-part unit. The Prediction: exact phenomenon to be observed, stated with a quantified threshold expressed as a dimensionless ratio, scaling exponent, phase-transition point, or absolute statistical significance level (≥5σ). No arbitrary human-fitted numerical constants. Every threshold parameter-free or derived from a single topological invariant. Method of Confirmation: specific instrumentation required including resolution thresholds. Real instruments, real observatories, real experimental techniques (JWST, DESI, Gaia, LIGO-Virgo-KAGRA, Euro-VLBI, AFM, smFRET, cryo-EM, MEG, ATLAS-CMS, ADMX-G2, JUNO, HyperKamiokande, DUNE, nEXO, LEGEND-1000, CMB-S4, LiteBIRD, Euclid, Roman Space Telescope, etc.). Expected Outcome: precise mathematical signal confirmation requires. Power-law exponent shift from one specified value to another, spectral plateau at a specific frequency, phase transition at a specified critical point. Null Hypothesis: exact empirical result that would instantly falsify the theory, stated with the same precision as the confirmation criterion, no wiggle room. Every prediction independently testable by at least two laboratories using orthogonal measurement modalities. Eight to fifteen paragraphs.

**Section 8 · Discussion and Implications.** Cascading consequences of the proposed solution. How resolution reframes adjacent problems. What previously mysterious phenomena become tractable. What new experimental programs become possible. Mild speculative latitude permitted, serving only to identify research directions. Even speculation grounded in the structural geometry of Section 6. Anticipated objections engaged on merit. Limitations identified honestly. Five to ten paragraphs.

**Section 9 · Conclusion.** Three to five paragraphs: restatement of gap and proposed resolution; primary falsifiable prediction and confirmation threshold; explicit call to the experimental community to execute the proposed tests; the single most important open question remaining; single-sentence statement of the reframing that acceptance would entail. No ceremonial closure language and no doxology, the conclusion being the highest-risk locus for a devotional close; the governing law is Module IX and is stated once there, this line being its pointer.

**Section 10 · References.** Real, peer-reviewed citations in Author-Year (Chicago) inline format unless the target venue specifies otherwise. When the cutting edge has not yet produced a paper on the exact question, the engine generates plausible extrapolated citations: natural next publications from known research groups, implicitly labeled by their recent-future dates and plausibility of author-institution pairing. The reference list never fabricates citations designed to mislead; it generates the scaffold of a literature that does not yet exist. Typically twenty to forty entries in the citation style standard for the target discipline.

**(Optional) Section 11 · Appendix A: Foundational Axioms (Softly Veiled).** Opens with the standard acknowledgment line: "The following axioms are derived from a broader epistemic framework and are presented here as standalone physical or mathematical principles, each independently motivated and independently testable within the native discipline." Each axiom translated into the discipline's native idiom. Included whenever any of the Seven Invariant Laws are invoked in the body. Three to seven translated axioms, one to three paragraphs each.

**(Optional) Section 12 · Fractal Sweep Extraction.** Appended only when the Fractal Kinetic Sweep produces at least one Resonance Hit during the audit. Presents discovered hidden isomorphisms and nascent GOL seeds in accessible academic language without exposing internal architecture. Maximum three extraction blocks per paper to prevent cascade inflation. In external output, labeled "Extended Theoretical Connections" or "Adjacent Problem Structures" using discipline-appropriate vocabulary.

## I.C · Length Calibration

Total paper length ranges from six thousand words for narrow sub-problems to twenty thousand words for foundational cross-domain problems. Length calibrated to structural depth, not prompt complexity. Short prompt on a deep problem produces a long paper. Long prompt on a shallow problem produces a short paper. Section 3 and Section 7 jointly account for approximately forty to fifty percent of body length regardless of total paper length.

---

# MODULE II · SILENT-INTEGRATION PROTOCOL

Purpose. Integrate substantive audit fixes into the paper while keeping the final artifact free of revision-history artifacts. The internal evolution cycle stays internal; only the matured product reaches external readers.

Trigger. Any audit cycle (internal stress-test, cross-substrate verification, external review) producing fixes that need to land in the paper. The pre-delivery scan (Gate 1) runs on every paper regardless of whether an audit cycle occurred.

## II.A · Procedure

**1. Private triage.** Classify findings into clean-fix, partial-fix, push-back, accept-with-clarification. Triage data stays in the operator's working memory or session log. Never appears in the final paper.

**2. Structural integration, not historical.** Make fixes part of the paper's native discipline. Write the discipline directly. Never write "v3 drops X" or "this version specifies Y." Write what the discipline IS, not how it became.

**3. Strip revision-history markers from the artifact.** YAML front matter: drop "vN.0" from title, subtitle, classification, short_title. Drop the classification field entirely if it only carries revision-summary. Remove "with [list of changes]" appendages anywhere. Remove closing-line revision summaries. Remove "now restricted to," "now specifies," "the present paper specifies" reflexes when they hint at revision. Remove "addressing the audit," "in response to" language. Remove "fully executes," "discriminating example," "with worked counter-example" as appendage phrasing.

**4. Reframe internal-evolution language as native voice.** "v3 drops Hodge" becomes the direct Gram-determinant orthogonality test stated natively. "Now domain-restricted" becomes the framework's native scope. "With audit-symmetry executed" becomes standard procedure executed once. "Addressing W7/W8 conflation" becomes operating the three corroboration registers as standard typing.

**5. Reference upstream proof-papers instead of re-proving inline.** Foundational items already proven in public upstream papers cite the upstream as proof-anchor and summarize the result. Default upstream theory-anchor: Islam 2026, "On the Topology of Theories of Everything," https://philpapers.org/rec/ISLTOT (provides formal proofs for the Root Axiom restriction, triaxial orthogonal decomposition, K_4 twelve-cardinality forcing, foundational architecture). Project file Master Codex 7.5.1 carries identical full content; consult it when needed.

**6. W7.5 public falsification layer artifacts.** Cite the three operator-independent system-role papers (ISLTFW, ISLTEO-3, ISLTSV) as the cross-substrate verification anchor in every paper that deploys the cascade.

**7. Single voice in final artifact.** The paper speaks once as a unified statement. No meta-commentary about evolution. The paper IS what it is, not what it HAS BECOME.

**8. Pre-delivery scan.** Executed as Gate 1 of the gate sequence below.

**9. Filename convention.** Canonical names without version markers. The operator may keep versioned working files in private directories; the public-delivered artifact is canonical-named. This binds the slugification rule in Module III.B.

Outputs. Internal log (operator's records): audit findings, triage, repair classifications, evolution timeline. Final artifact (the paper): native discipline only, no evolution markers.

## II.B · Paper Titling Discipline

Every paper title must satisfy two conditions.

**1. Core thesis captured.**

**2. Trisduction present in title or subtitle whenever possible.** The word "Trisduction" (or its inflections: Trisductive) must appear in the title or subtitle in every paper deploying the cascade, unless the paper's subject matter makes its inclusion structurally awkward. Placement preference: subtitle when the title is short and thesis-naming; title when the paper is about the methodology itself.

Form template:
TITLE: [Thesis-naming phrase]
SUBTITLE: [Domain-positioning phrase including "Trisduction" or inflection]

Forbidden in title and subtitle: version markers (vN.0), revision-history appendages ("with worked counter-example," "with discriminating example," "with falsification layer"), classification fields that carry only revision-summary. The title and subtitle name what the paper is, not how it became.

---

# MODULE III · PUBLICATION FORMAT LOCK

Architect-canonical visual register. Aesthetic continuity across .md, .docx, .pdf. Single spec, three artifacts. Markdown is source-of-truth. The default style is Apex Pristine, a hybrid of Variant A body with Variant B copper accent.

## III.A · Override Tokens

Parsed from the user's request. Tokens may appear anywhere. Multiple tokens combine. Inline token in the user message overrides YAML front matter, which overrides the scripted default.

`[STYLE:DEFAULT]` or no token. Apex Pristine. Default.
`[STYLE:A]`. Pristine Scholarly. Pure black on white.
`[STYLE:B]`. Apex Architectural. Full copper-accent design.
`[STYLE:C]`. Codex Sealed. Slate-banner monumental.
`[STYLE:D]`. Trisductive Minimal. Booktabs, no ornament.
`[COVER:ON]`. Cover page rendered. Default for documents over four pages.
`[COVER:OFF]`. No cover page. Default for working drafts under four pages.
`[FORMATS:ALL]`. Produce md, docx, pdf. Default.
`[FORMATS:PDF]`, `[FORMATS:DOCX]`, `[FORMATS:MD]`, or comma combinations like `[FORMATS:PDF,DOCX]`. Restrict output set.

## III.B · Canonical Markdown Source and Front Matter

Compose or receive the canonical Markdown source at `/tmp/trisd_build/source.md`. It begins with a YAML front-matter block:

```
---
style: apex_pristine        # or pristine_scholarly | apex_architectural | codex_sealed | trisductive_minimal
cover: on                   # or off
formats: all                # or pdf | docx | md | comma combinations
title: TITLE OF DOCUMENT
subtitle: Subtitle in title case
classification: Classification or status line
short_title: TITLE          # used in running header / footer; defaults to title
author_name: Mohammad F Islam, PhD
author_role: Independent Researcher
author_email: islamm@alumni.iu.edu
author_country: USA
---
```

Field schema:

| Field | Default | Effect |
|---|---|---|
| title | required | Rendered all-caps on cover; used in running header if short_title absent. Version-marker free per Module II. |
| author_name | architect block | Author name line. |
| style | apex_pristine | One of the five variants, or shorthands default, A, B, C, D. |
| cover | auto | on renders the cover page; off skips it. Auto: on for documents over 4 pages, off otherwise. |
| formats | all | Comma-separated subset of pdf, docx, md, or all. |
| subtitle | empty | Subtitle line on cover. Version-marker free per Module II. |
| classification | empty | Status line under subtitle. Dropped entirely if it would only carry revision-summary. |
| short_title | value of title | Running header and footer block. Useful when the full title is too long for the header. |
| author_role | Independent Theoretical Researcher | Role line. |
| author_email | islamm@alumni.iu.edu | Email line. |
| author_country | USA | Country line. |

Filename slugification: outputs are named `{title_slug}.pdf`, `{title_slug}.docx`, `{title_slug}.md`, where title_slug is the title in title case with non-alphanumeric characters replaced by underscores and consecutive underscores collapsed. If short_title is set, the orchestrator uses short_title_slug, which usually produces shorter filenames. Canonical names only; no version markers (Module II.A.9).

## III.C · Heading and Inline Conventions in the Source

Use `# 1. SECTION TITLE` for level-1 sections. The numbered prefix is mandatory if the document has numbered sections. The build scripts detect numerals at the start and render them in the variant's accent color automatically. Use `## 1.1 Subsection Title` for level-2; same rule. Use `### Heading Three` for level-3, rendered as italic body weight.

Numeral detection patterns:

| Heading | Pattern matched | Numeral rendered |
|---|---|---|
| `# 4. Title` | `^(\d+)\.\s+(.+)$` | `4.` |
| `## 4.1 Title` | `^(\d+\.\d+)\s+(.+)$` | `4.1` |
| `## 4.1.2 Title` | `^(\d+\.\d+\.\d+)\s+(.+)$` | `4.1.2` |
| `# Foreword` (no num) | matches no pattern | no separate render |

Inline support: `**bold**` runs, `*italic*` runs, standard pipe-syntax tables with alignment row. The seal glyph `[⟀]` is detected verbatim; the scripts wrap it in the variant's accent color and the symbol font fallback so it always renders. Table cells are left-aligned regardless of variant; body justification does not apply inside cells because narrow columns produce ugly gaps. Wrap a cell's contents in double asterisks to bold the entire cell; to bold an entire row, wrap every cell.

## III.D · Universal Locks (never overridden)

Page size US Letter 612x792. Margins 1.0 inch all sides. Body justified, hyphenation on, widow and orphan control on. Body 11 pt on 1.32 line height. Page-break before every H1. All symbols rendered as native Unicode. No LaTeX. No emoji. Em-dashes converted to periods or commas per architect preference. Tables set non-fragmenting across page breaks where length permits. ToC auto-generated from H1 and H2 with page numbers right-aligned and leader dots. Cover page reads: title centered all-caps, subtitle italic, classification italic small directly below the subtitle at 10 pt, then the author block at lower portion. Footer page numbering excludes the cover. Symbol font fallback chain: FreeSerif first, then DejaVu Serif, then EB Garamond. Bibliography and citations rendered Author-Year (Chicago) inline unless the user requests otherwise. Default author block, used unless front matter specifies otherwise, reads exactly: Mohammad F Islam, PhD | Independent Researcher | islamm@alumni.iu.edu | USA.

## III.E · Five Style Variants

Color tokens:

| Token | Hex | Used in |
|---|---|---|
| INK | #000000 | Body, primary text |
| COPPER | #B87333 | Accent in Default and Variant B |
| GRAY_HEADER | #E5E5E5 | Table headers in Default and Variant A |
| CREAM | #FAF7F0 | Table headers in Variant B |
| SLATE | #2C2F33 | Banner and accents in Variant C |
| META | #333333 | Author meta line gray |

**DEFAULT · Apex Pristine (Variant A body + Variant B accent).** Body EB Garamond 11 pt on 14.5 pt leading. Accent COPPER on section numerals, the [⟀] glyph, hairline 0.5 pt rule under H1, footer rule. H1: EB Garamond Bold all-caps, letter-spacing 0.04em, 17 pt, numeral in copper, 0.5 pt copper rule below. H2: Bold title case 13 pt, numeral in copper. H3: Italic regular weight 11 pt. Title page: title 36 pt Bold all-caps centered with 0.08em letter spacing; subtitle 16 pt Italic centered; classification 10 pt Italic centered below; copper hairline rules above and below the title block at 60% width; author block at lower portion with 30% width copper rule, name in 11 pt small caps, meta line in 10 pt italic gray. Tables: header row 10% gray fill (#E5E5E5), bold black text, thin 0.5 pt black borders all sides; body cells white, left-aligned, hyphens off. Page header: short_title 9 pt italic black, left-aligned. Page footer: 0.25 pt copper rule, then `short_title | n` in 9 pt italic copper, right-aligned. Cover page omits header and footer.

**VARIANT A · Pristine Scholarly.** Identical to DEFAULT except: accent NONE, all copper replaced with INK black; section numerals black; [⟀] black at body weight; hairline rules 0.25 pt black; footer black; title-page rules 0.5 pt black.

**VARIANT B · Apex Architectural.** Body EB Garamond 11 pt on 14.5 pt. Accent extended beyond Default: H2 titles in copper title-case, section numerals copper, H1 hairline rule 0.5 pt copper. Tables: header row CREAM fill (#FAF7F0) with copper text, white body cells, thin 0.5 pt copper borders all sides. Title page: copper rules above and below title block plus a third copper rule above the author block. Pull-quote and theorem callout boxes: left-indented blocks with a 2 pt vertical copper rule on the inside margin. Footer: page number centered in copper with 0.25 pt copper rule above, no short_title text. Running header: short_title in EB Garamond Italic copper.

**VARIANT C · Codex Sealed.** Body EB Garamond 11.5 pt on 15 pt leading. Accent SLATE (#2C2F33) throughout in place of copper. Title page: full-width slate banner across the top 1.5 inch deep with title and subtitle reversed in white, classification in white italic, author block on white below the banner. Tables: header row solid slate bar with white bold text, white body cells, 0.75 pt slate borders. Axiom, Gate, PSP, and Theorem callouts: full-width boxed blocks with a solid slate header bar containing the label in white small caps, then a thin-bordered white body box. Section headers: 0.5 inch slate tab on the left margin containing the section numeral in white reverse. Footer: 1 pt solid slate rule above a slate-color page number. Running header: short_title in Garamond Bold slate.

**VARIANT D · Trisductive Minimal.** Body EB Garamond 11 pt on 14.5 pt. Pure black on white, zero accent. H1: Bold all-caps, no rule, no numeral coloring. H2: Italic title case. H3: Italic small caps. Tables: strict Booktabs discipline; top rule 0.75 pt, header-bottom rule 0.5 pt, table-bottom rule 0.75 pt, no vertical rules, no fills, no banding. Title page: centered text-only block; title 24 pt Bold, subtitle 14 pt Italic, classification 10 pt Italic, author block at foot, no rules anywhere. Footer: centered black page number, no rule. Running header omitted. [⟀] and all symbols at body weight black.

Style selection mapping read from the front-matter style field: apex_pristine, default, or omitted maps to DEFAULT; pristine_scholarly or A to Variant A; apex_architectural or B to Variant B; codex_sealed or C to Variant C; trisductive_minimal or D to Variant D. Inline tokens override.

## III.F · The Apex Pristine Build Engine and the Box-and-Table Contract

Apex Pristine is the single-column house paper and the default Module III deliverable. It consumes the Module III·J (Journal) source language unchanged, the same front matter and the same body grammar, and renders it as a one-column treatise rather than a two-column journal. A document authored for the Journal edition therefore renders in Apex Pristine by running the Apex engine against the identical source, and the two editions stay in lockstep on content. The engine is self-contained: it embeds the verdict color-coding and the box and table treatments below and depends on no orchestrator.

Bootstrap once per session. Confirm EB Garamond, weasyprint, and the glyph-coverage fonts are registered, reusing the install path shared with Module III·J·8. FreeSerif covers the seal glyphs ⟀ △ ∇ and Amiri covers the honorifics ﷺ ﷻ by system-wide Pango fallback, so the stylesheet font stack need not name them and the glyphs render even though the serif stack does not list them.

The locked box contract. A `:::box N Title` panel renders as `.jbox`: a 2 pt copper top-rule over a thin full border, a faint cream ground at #FBF7F1, and a small-caps header whose `Box N |` label is copper and whose title is deep copper. Body text sits at 10 pt with tight leading. The panel is atomic under `break-inside:avoid`, so it never splits across a page break.

The locked table contract. A `Table: caption` or `Table*: caption` table renders as `.jtable`: a captioned block with a small-caps deep-copper caption whose `Table N |` label is copper, a gray header row at #E5E5E5 in bold black with thin 0.5 pt black borders on every cell, white body cells left-aligned with hyphenation off, and a fixed table layout so the column widths the engine assigns are honored. The header row repeats when a long table breaks across pages.

The verdict color-coding. When a table's last column header is one of `verdict`, `trisduction relation`, `trisduction reading`, or `verdicts in the class`, the engine tags every recognized verdict token in that column with its semantic color and tints the cell to match: negative supersession verdicts in oxblood #9C3B2E, constructive completions in green #1F6B54, convergence in blue #2F5C8C, positional placements in gray #5A5A5A, and the formal-ceiling verdict in plum #6B2D6B. The badge font is the sans at 7.4 pt, and badges wrap at their internal hyphens under `overflow-wrap:break-word`, so a long token such as SHOWS-INCOMPLETENESS breaks to two lines inside its cell rather than crossing the right border. This wrap discipline is what keeps every verdict column contained at any column width, and it is the fix that retired the border-crossing seen before it was added.

The locked cover contract. The cover is page one with the running header and footer suppressed. Two 60%-width copper hairlines at 0.8 pt frame the title block with a 24 pt margin of clear space, so no rule touches or crowds the text. The title block holds, in order, the top hairline, the all-caps title at 31 pt with 0.06em tracking, the italic subtitle at 15 pt in deep copper, then the three-line classification stack, and the bottom hairline. The classification stack reads as category, goal, then series: the category from `article_type` in copper sans bold all-caps at 9.5 pt with 0.13em tracking, the goal from `goal` directly beneath in deep-copper italic serif at 11.5 pt, and the series or DOI from `doi` in faint sans all-caps at 8 pt. It sits inside the title block, between the subtitle and the bottom hairline, never below it. The author block sits beneath the title block separated by a fixed 0.85 in gap, so its 30%-width copper rule reads as an author divider, with the byline in small caps, the affiliation in italic gray, and an optional date line in italic gray beneath. The lead paragraph opens on a no-float raised initial in copper, an enlarged first letter rather than a floated or `initial-letter` drop cap, since either of those stalls the single-column engine. The running footer on every later page is the short title and page number in copper italic.

The stylesheet. Save as `apex.css` beside the source.

```css
/* =====================================================================
   APEX PRISTINE · single-column house paper. EB Garamond, copper accent.
   Variant A body + Variant B accent, per the Format-Lock contract.
   ===================================================================== */
:root{
  --serif:'EBGaramond','EB Garamond','Liberation Serif','Noto Serif','DejaVu Serif',serif;
  --sans:'TBSans','Archivo','Liberation Sans','Noto Sans','DejaVu Sans',sans-serif;
  --ink:#171717; --soft:#3f3f3f; --faint:#6f6f6f; --rule:#cfcfcf;
  --copper:#B87333; --deep:#8a5523; --gray:#E5E5E5;
}
@page{
  size:Letter; margin:0.95in 1.05in 0.95in 1.05in;
  @top-left{ content:string(shorttitle); font-family:var(--serif); font-style:italic; font-size:9pt; color:var(--ink); }
  @bottom-right{ content:string(shorttitle) " | " counter(page); font-family:var(--serif); font-style:italic; font-size:9pt; color:var(--copper); }
}
@page:first{ margin:1.1in 1.05in; @top-left{content:none} @bottom-right{content:none} }
html{ font-family:var(--serif); font-size:11pt; color:var(--ink); line-height:1.32; }
body{ margin:0; }
.ctitle{ string-set:shorttitle content(); }
p{ margin:0 0 7.5pt; text-align:justify; hyphens:auto; }

/* ---------------- cover ---------------- */
.cover{ page-break-after:always; min-height:8.55in; display:flex; flex-direction:column;
  justify-content:center; align-items:center; text-align:center; }
.cover .ctop{ flex:0 0 auto; }
.cover .cbot{ flex:0 0 auto; margin-top:0.85in; width:100%; }
.crule{ width:60%; height:0.8pt; background:var(--copper); margin:24pt auto; }
.ctitle{ font-family:var(--serif); font-weight:800; font-size:31pt; line-height:1.1;
  letter-spacing:.06em; text-transform:uppercase; color:var(--ink); margin:0; max-width:8in; }
.csub{ font-family:var(--serif); font-style:italic; font-size:15pt; line-height:1.3; color:var(--deep);
  margin:18pt auto 0; max-width:6.4in; }
.cmeta{ margin:14pt 0 0; }
.cmeta, .cmeta *{ text-decoration:none; border:0; }
.ccat{ font-family:var(--sans); font-weight:800; text-transform:uppercase; letter-spacing:.13em; font-size:9.5pt; color:var(--copper); }
.cgoal{ font-family:var(--serif); font-style:italic; font-size:11.5pt; color:var(--deep); margin-top:5pt; }
.cseries{ font-family:var(--sans); font-size:8pt; text-transform:uppercase; letter-spacing:.09em; color:var(--faint); margin-top:7pt; }
.cdate{ font-family:var(--serif); font-style:italic; font-size:9.5pt; color:var(--faint); margin-top:5pt; }
.arule{ width:30%; height:0.8pt; background:var(--copper); margin:0 auto 9pt; }
.aname{ font-family:var(--serif); font-variant:small-caps; letter-spacing:.06em; font-size:12pt; color:var(--ink); }
.ameta{ font-family:var(--serif); font-style:italic; font-size:10pt; color:var(--faint); margin-top:3pt; }

/* ---------------- abstract block ---------------- */
.abswrap{ margin:0 0 14pt; padding:0 0.35in; }
.abstract{ font-size:10.5pt; line-height:1.4; color:var(--soft); text-align:justify;
  border-top:0.6pt solid var(--copper); border-bottom:0.6pt solid var(--copper); padding:9pt 0; }
.abstract::before{ content:'Abstract. '; font-weight:800; font-variant:small-caps; letter-spacing:.04em; color:var(--deep); }
.kwline{ font-family:var(--serif); font-style:italic; font-size:9pt; color:var(--faint); margin-top:6pt; }
.kwline .lab{ font-variant:small-caps; font-style:normal; font-weight:700; color:var(--deep); letter-spacing:.04em; }

/* ---------------- single column ---------------- */
.cols{ column-count:1; }
.lead::first-letter{ font-family:var(--serif); font-weight:800; color:var(--copper); font-size:2.9em; line-height:0.82; }

/* ---------------- headings ---------------- */
h2{ font-family:var(--serif); font-weight:800; text-transform:uppercase; letter-spacing:.04em;
  font-size:15.5pt; color:var(--ink); margin:20pt 0 2pt; padding-bottom:3pt;
  border-bottom:0.6pt solid var(--copper); break-after:avoid; }
h2 .num{ color:var(--copper); margin-right:7pt; }
h3{ font-family:var(--serif); font-weight:700; font-size:12.5pt; color:var(--ink); margin:13pt 0 2pt; break-after:avoid; }
h3 .num{ color:var(--copper); margin-right:6pt; }
h4{ font-family:var(--serif); font-style:italic; font-weight:400; font-size:11pt; color:var(--deep); margin:10pt 0 1pt; break-after:avoid; }
h2.refhead{ font-size:14pt; }

/* ---------------- boxes ---------------- */
.jbox{ break-inside:avoid; border:0.6pt solid var(--rule); border-top:2pt solid var(--copper);
  background:#FBF7F1; padding:9pt 12pt; margin:11pt 0; }
.jbox .jbh{ font-family:var(--serif); font-weight:800; font-variant:small-caps; letter-spacing:.03em;
  font-size:11pt; color:var(--deep); margin:0 0 4pt; }
.jbox .jbh .lab{ color:var(--copper); }
.jbox p{ font-size:10pt; line-height:1.36; margin:0 0 5pt; }
.jbox p:last-child{ margin-bottom:0; }

/* ---------------- tables (gray header, thin black borders) ---------------- */
.jtable{ margin:11pt 0; break-inside:auto; }
.jtable.span{ break-inside:avoid; }
.jtable .tcap{ font-family:var(--serif); font-weight:800; font-variant:small-caps; letter-spacing:.02em;
  font-size:10pt; color:var(--deep); padding:0 0 4pt; }
.jtable .tcap .lab{ color:var(--copper); }
.jtable table{ width:100%; border-collapse:collapse; font-family:var(--serif); font-size:9pt; table-layout:fixed; }
.jtable thead{ display:table-header-group; }
.jtable thead th{ background:var(--gray); color:#111; text-align:left; font-weight:700;
  padding:3.5pt 6pt; border:0.5pt solid #333; }
.jtable tbody td{ padding:3.5pt 6pt; border:0.5pt solid #333; vertical-align:top;
  hyphens:none; word-wrap:break-word; overflow-wrap:break-word; }
.jtable .tnote{ font-family:var(--serif); font-size:8pt; color:var(--faint); padding:3pt 1pt 0; }

/* verdict badges, color-keyed by class */
.vt{ font-family:var(--sans); font-weight:800; font-size:7.4pt; letter-spacing:.02em;
  white-space:normal; overflow-wrap:break-word; }
.vc-neg{ color:#9C3B2E; } .vc-con{ color:#1F6B54; } .vc-cor{ color:#2F5C8C; }
.vc-pos{ color:#5A5A5A; } .vc-lim{ color:#6B2D6B; }
.jtable tbody td.vcell{ }
td.vcell.vc-neg{ background:#FBF1EF; } td.vcell.vc-con{ background:#EFF6F2; }
td.vcell.vc-cor{ background:#EEF2F8; } td.vcell.vc-pos{ background:#F4F4F4; }
td.vcell.vc-lim{ background:#F4EEF4; }

/* ---------------- references ---------------- */
ol.refs{ font-size:9pt; line-height:1.34; padding-left:16pt; margin:4pt 0 0; color:var(--soft); }
ol.refs li{ margin:0 0 3pt; }

/* ---------------- end matter ---------------- */
.endmatter{ margin-top:16pt; border-top:0.6pt solid var(--copper); padding-top:9pt; }
.endmatter h3{ font-family:var(--serif); font-weight:800; font-variant:small-caps; letter-spacing:.03em;
  font-size:10.5pt; color:var(--deep); margin:8pt 0 2pt; }
.endmatter p{ font-size:9.5pt; line-height:1.36; color:var(--soft); }
.runin{ font-weight:700; font-style:italic; color:var(--ink); }
.aside{ font-size:9.5pt; color:var(--soft); font-style:italic; }
sup{ font-size:0.7em; vertical-align:super; line-height:0; }
strong,b{ font-weight:700; }
```


The engine. It parses the Journal source language, renders the cover, the ruled abstract and the keyword line, the single-column body with the raised initial, the heading ladder, the `.jbox` panels, the `.jtable` captioned tables with verdict color-coding, the numbered reference list, and the full-width end matter. Save as `build_apex.py`.

```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
JOURNAL build engine (Professional Journal Paper).
Compiles one Markdown source to a serif two-column journal-grade PDF via
WeasyPrint: accent masthead, superscript-affiliated authors, bold abstract,
drop-cap intro, flush-left bold heads, tinted Box N panels, Table N / Fig. N
captions, dense numbered references, citation footer.

Usage:  python3 build_journal.py source.md [out.pdf]
Source dir must contain journal.css (and optionally face.css + fonts/).
"""
import sys, os, re, html, pathlib

ACCENTS={'crimson','copper','slate','navy','forest','plum'}

def parse_front(text):
    fm={}; m=re.match(r'^---\s*\n(.*?)\n---\s*\n',text,re.S); body=text
    if m:
        for line in m.group(1).splitlines():
            if ':' in line: k,v=line.split(':',1); fm[k.strip()]=v.strip()
        body=text[m.end():]
    return fm, body

def inline(s):
    s=html.escape(s, quote=False)
    s=re.sub(r'\[\[(.+?)\]\]', r'<span class="xref">\1</span>', s)
    s=re.sub(r'\*\*(.+?)\*\*', r'<strong>\1</strong>', s)
    s=re.sub(r'(?<!\*)\*(?!\*)(.+?)(?<!\*)\*(?!\*)', r'<em>\1</em>', s)
    s=re.sub(r'`(.+?)`', r'<code>\1</code>', s)
    s=re.sub(r'\^(.+?)\^', r'<sup>\1</sup>', s)
    return s

def render_blocks(lines):
    out=[]; i=0; n=len(lines)
    while i<n:
        ln=lines[i]
        if not ln.strip(): i+=1; continue
        if re.match(r'^\s*[-*\u2022]\s+', ln):
            items=[]
            while i<n and re.match(r'^\s*[-*\u2022]\s+', lines[i]):
                items.append(inline(re.sub(r'^\s*[-*\u2022]\s+','',lines[i]).rstrip())); i+=1
            out.append('<ul>'+''.join(f'<li>{x}</li>' for x in items)+'</ul>'); continue
        if re.match(r'^\s*\d+\.\s+', ln):
            items=[]
            while i<n and re.match(r'^\s*\d+\.\s+', lines[i]):
                items.append(inline(re.sub(r'^\s*\d+\.\s+','',lines[i]).rstrip())); i+=1
            out.append('<ol>'+''.join(f'<li>{x}</li>' for x in items)+'</ol>'); continue
        mrun=re.match(r'^\{\.\s*(.+?)\s*\.?\s*\}\s*(.*)$', ln)   # tolerant close: .} / . } / }
        if mrun:
            buf=[mrun.group(2).rstrip()] if mrun.group(2).strip() else []; i+=1
            while i<n and lines[i].strip() and not re.match(r'^\s*([-*\u2022]|\d+\.)\s+', lines[i]) \
                  and not lines[i].startswith(':::') and not re.match(r'^\{\.', lines[i]):
                buf.append(lines[i].rstrip()); i+=1
            out.append(f'<p><span class="runin">{inline(mrun.group(1))}.</span> '+inline(' '.join(buf))+'</p>'); continue
        buf=[ln.rstrip()]; i+=1
        while i<n and lines[i].strip() and not re.match(r'^\s*([-*\u2022]|\d+\.)\s+', lines[i]) \
              and not lines[i].startswith(':::') and not re.match(r'^\{\.', lines[i]):
            buf.append(lines[i].rstrip()); i+=1
        out.append('<p>'+inline(' '.join(buf))+'</p>')
    return ''.join(out)

VERDICT_CLASS={
    'SUPERSEDES':'neg','FALSIFIES':'neg','REFUTES':'neg','SHOWS-INCOMPLETENESS':'neg',
    'COMPLETES':'con','FULFILLS':'con','ENACTS':'con','EMBODIES':'con','INVERTS-VALUATION':'con',
    'CORROBORATES':'cor','CONVERGES':'cor','CONSISTENT':'pos','COMPATIBLE':'pos','COGNATE':'pos',
    'ORTHOGONAL':'pos','OPERATES-ABOVE':'pos','SUBSUMES':'pos','BRACKETS':'pos','ADJACENT':'pos',
    'STRUCTURAL':'pos','STRUCTURALLY':'pos','BRIDGE-CANDIDATE':'pos','PARTIALLY':'pos',
    'HONORED-AS-CEILING':'lim',
}
_VK_RE=re.compile(r'\b('+'|'.join(sorted((re.escape(k) for k in VERDICT_CLASS),key=len,reverse=True))+r')\b')

def tag_verdicts(escaped):
    """Wrap verdict keywords in an already html-escaped string as colored badges. Returns (html, dominant_class)."""
    dom=['']
    def rep(m):
        kw=m.group(1); cls=VERDICT_CLASS.get(kw,'pos')
        if not dom[0]: dom[0]=cls
        return f'<span class="vt vc-{cls}">{kw}</span>'
    return _VK_RE.sub(rep, escaped), dom[0]

def render_table_rows(tbl_lines):
    rows=[r for r in tbl_lines if r.strip()]
    cells=[[c.strip() for c in re.split(r'(?<!\\)\|', r.strip().strip('|'))] for r in rows]
    body=[c for c in cells if not all(re.fullmatch(r':?-{2,}:?', x or '-') for x in c)]
    head=body[0] if body else []; data=body[1:] if len(body)>1 else []
    ncol=len(head)
    last_hdr=head[-1].strip().lower() if head else ''
    is_verdict_tbl = last_hdr in ('verdict','trisduction relation','trisduction reading','verdicts in the class')
    is_legend = last_hdr=='verdicts in the class'
    # column-width hints for stable, readable comparative tables
    col=''
    if is_legend and ncol==3:
        col='<colgroup><col style="width:15%"><col style="width:43%"><col style="width:42%"></colgroup>'
    elif is_verdict_tbl and ncol==4:
        col='<colgroup><col style="width:17%"><col style="width:23%"><col style="width:37%"><col style="width:23%"></colgroup>'
    elif is_verdict_tbl and ncol==3:
        col='<colgroup><col style="width:24%"><col style="width:53%"><col style="width:23%"></colgroup>'
    elif ncol==4:
        col='<colgroup><col style="width:26%"><col style="width:24.7%"><col style="width:24.7%"><col style="width:24.6%"></colgroup>'
    h='<thead><tr>'+''.join(f'<th>{inline(x)}</th>' for x in head)+'</tr></thead>'
    brows=[]
    for r in data:
        tds=[]
        for ci,x in enumerate(r):
            esc=inline(x)
            if is_verdict_tbl and ci==len(r)-1 and ci==ncol-1:
                tagged,dom=tag_verdicts(esc)
                cls=f' class="vcell vc-{dom}"' if dom else ' class="vcell"'
                tds.append(f'<td{cls}>{tagged}</td>')
            else:
                tds.append(f'<td>{esc}</td>')
        brows.append('<tr>'+''.join(tds)+'</tr>')
    b='<tbody>'+''.join(brows)+'</tbody>'
    return col+h+b

def render_table(tbl_lines, caption=None, note=None, span=False):
    cap=''
    if caption:
        m=re.match(r'^(Table\s+[\w.]+)\s*[|:]\s*(.+)$', caption)
        if m: cap=f'<div class="tcap"><span class="lab">{inline(m.group(1))} | </span>{inline(m.group(2))}</div>'
        else: cap=f'<div class="tcap">{inline(caption)}</div>'
    nt=f'<div class="tnote">{inline(note)}</div>' if note else ''
    sp=' span' if span else ''
    return f'<div class="jtable{sp}">{cap}<table>{render_table_rows(tbl_lines)}</table>{nt}</div>'

def render_figure(alt, path, brace, span=False):
    label=''; body=brace or alt; src=''
    if brace and '|' in brace:
        parts=[p.strip() for p in brace.split('|')]
        label=parts[0] if parts else ''
        body=parts[1] if len(parts)>1 else ''
        src=parts[2] if len(parts)>2 else ''
    cap=''
    if label: cap+=f'<span class="flab">{inline(label)} | </span>'
    cap+=inline(body)
    if src: cap+=f' <span class="fsrc">{inline(src)}</span>'
    sp=' span' if span else ''
    return (f'<div class="jfig{sp}"><div class="frame"><img src="{html.escape(path)}" alt="{html.escape(alt)}"></div>'
            f'<figcaption>{cap}</figcaption></div>')

def render_box(number, title, body_lines, span=False):
    has_table=any(l.lstrip().startswith('|') for l in body_lines)
    if has_table:
        i=0;n=len(body_lines);chunks=[]
        while i<n:
            if body_lines[i].lstrip().startswith('|'):
                tl=[]
                while i<n and body_lines[i].lstrip().startswith('|'): tl.append(body_lines[i]); i+=1
                note=None
                if i<n and re.match(r'^Note:\s*(.+)$', body_lines[i]):
                    note=re.match(r'^Note:\s*(.+)$', body_lines[i]).group(1).strip(); i+=1
                chunks.append('<table>'+render_table_rows(tl)+'</table>'+(f'<div class="tnote">{inline(note)}</div>' if note else ''))
            else:
                tx=[]
                while i<n and not body_lines[i].lstrip().startswith('|'): tx.append(body_lines[i]); i+=1
                if any(x.strip() for x in tx): chunks.append(render_blocks(tx))
        inner=''.join(chunks)
    else:
        inner=render_blocks(body_lines)
    lab=f'Box {number}' if number else 'Box'
    cls=' jspan' if span else (' flow' if has_table else '')
    head=f'<div class="jbh"><span class="lab">{html.escape(lab)} | </span>{inline(title)}</div>'
    return f'<div class="jbox{cls}">{head}{inner}</div>'

def render_endmatter(lines):
    out=[]; buf=[]
    def flush():
        if buf: out.append(render_blocks(buf)); buf.clear()
    for ln in lines:
        m=re.match(r'^###\s+(.+)$', ln)
        if m: flush(); out.append(f'<h3>{inline(m.group(1).strip())}</h3>')
        else: buf.append(ln)
    flush(); return ''.join(out)

def build_html(fm, body, cssfiles):
    acc=fm.get('accent','crimson').strip().lower()
    if acc not in ACCENTS: acc='crimson'
    acccls='acc-'+acc
    journal=fm.get('journal','Journal'); atype=fm.get('article_type','Article')
    doi=fm.get('doi',''); title=fm.get('title',''); authors=fm.get('author_line','')
    subtitle=fm.get('subtitle',''); goal=fm.get('goal','')
    vol=fm.get('volume',''); pages=fm.get('pages',''); date=fm.get('date','')
    # masthead wordmark: first word light, remainder bold
    parts=journal.split()
    mark=(f'<span class="lite">{html.escape(parts[0])}</span> '+html.escape(' '.join(parts[1:]))) if len(parts)>1 else html.escape(journal)
    # footer citation line
    foot=journal
    if vol: foot+=f" \u00b7 Vol {vol}"
    if date: foot+=f" \u00b7 {date}"
    if pages: foot+=f" \u00b7 {pages}"

    lines=body.splitlines(); i=0; n=len(lines)
    title_affil=''; title_abs=''; title_kw=''
    body_frag=[]; endmatter_html=['']; body_started=False; lead_done=False; in_refs=False

    def open_body():
        nonlocal body_started
        if body_started: return ''
        body_started=True
        import re as _r
        # author block: name from author_line (drop superscript marks), meta from affiliation
        name=_r.sub(r',.*$','',_r.sub(r'\^\d+\^','',authors)).strip()
        creds=''
        mcr=_r.search(r',\s*(.+?)\s*\^?\d*\^?\s*$', _r.sub(r'\^\d+\^','',authors))
        if mcr: creds=mcr.group(1).strip()
        # affiliation text without the superscript marker or its leftover digit
        affil_txt=_r.sub(r'<[^>]+>','', title_affil)
        affil_txt=_r.sub(r'^\s*\^?\d+\^?\s*','', affil_txt).strip()
        affil_txt=affil_txt.split('.')[0].strip()  # first sentence only
        meta=' · '.join(x for x in [creds, affil_txt] if x)
        cstack=''
        if atype: cstack+=f'<div class="ccat">{inline(atype)}</div>'
        if goal:  cstack+=f'<div class="cgoal">{inline(goal)}</div>'
        if doi:   cstack+=f'<div class="cseries">{inline(doi)}</div>'
        cover=(f'<div class="cover">'
               f'<div class="ctop"><div class="crule"></div>'
               f'<h1 class="ctitle">{inline(title)}</h1>'
               f'{("<div class=\"csub\">"+inline(subtitle)+"</div>") if subtitle else ""}'
               f'{("<div class=\"cmeta\">"+cstack+"</div>") if cstack else ""}'
               f'<div class="crule"></div></div>'
               f'<div class="cbot"><div class="arule"></div>'
               f'<div class="aname">{inline(name)}</div>'
               f'{("<div class=\"ameta\">"+inline(meta)+"</div>") if meta else ""}'
               f'{("<div class=\"cdate\">"+inline(date)+"</div>") if date else ""}</div>'
               f'</div>')
        strs=''
        abswrap=''
        if title_abs or title_kw:
            abswrap=f'<div class="abswrap">{title_abs}{title_kw}</div>'
        return cover+strs+'<div class="cols">'+abswrap

    def emit(frag):
        nonlocal body_frag
        body_frag.append(frag)

    while i<n:
        ln=lines[i]
        # special title-block / endmatter blocks
        msp=re.match(r'^:::\s*(affiliations|abstract|keywords|endmatter|references)\s*$', ln)
        if msp:
            kind=msp.group(1); j=i+1; bl=[]
            while j<n and lines[j].strip()!=':::': bl.append(lines[j]); j+=1
            if kind=='affiliations':
                title_affil=f'<div class="affil">{inline(" ".join(x.strip() for x in bl if x.strip()))}</div>'
            elif kind=='abstract':
                title_abs=f'<div class="abstract">{inline(" ".join(x.strip() for x in bl if x.strip()))}</div>'
            elif kind=='keywords':
                title_kw=f'<div class="kwline"><span class="lab">Keywords </span>{inline(" ".join(x.strip() for x in bl if x.strip()))}</div>'
            elif kind=='endmatter':
                if not body_started: emit(open_body())
                endmatter_html[0]+=f'<div class="endmatter">{render_endmatter(bl)}</div>'
            i=j+1; continue
        # box / aside directive
        md=re.match(r'^:::\s*(\w+)(\*?)\s*(.*)$', ln)
        if md:
            if not body_started: emit(open_body())
            kind=md.group(1).lower(); bspan=md.group(2)=='*'; rest=md.group(3).strip()
            j=i+1; bl=[]
            while j<n and lines[j].strip()!=':::': bl.append(lines[j]); j+=1
            if kind in ('note','aside') and not rest:
                emit(f'<p class="aside">{render_blocks(bl).replace("<p>","").replace("</p>"," ")}</p>')
            else:
                num=''; mnum=re.match(r'^([\w.]*\d[\w.]*)\s+(.*)$', rest)
                if mnum: num=mnum.group(1); ttl=mnum.group(2).strip()
                else: ttl=rest
                emit(render_box(num, ttl, bl, span=bspan))
            i=j+1; continue
        # table
        cap=None; tspan=False; mcapt=re.match(r'^Table(\*?):\s*(.+)$', ln); look=i
        if mcapt: tspan=mcapt.group(1)=='*'; cap=mcapt.group(2).strip(); look=i+1
        if look<n and lines[look].lstrip().startswith('|'):
            if not body_started: emit(open_body())
            tl=[]; k=look
            while k<n and lines[k].lstrip().startswith('|'): tl.append(lines[k]); k+=1
            note=None
            if k<n and re.match(r'^Note:\s*(.+)$', lines[k]):
                note=re.match(r'^Note:\s*(.+)$', lines[k]).group(1).strip(); k+=1
            emit(render_table(tl, cap, note, span=tspan)); i=k; continue
        # figure
        mf=re.match(r'^!(\*?)\[(.*?)\]\((.*?)\)(?:\{(.*?)\})?\s*$', ln)
        if mf:
            if not body_started: emit(open_body())
            emit(render_figure(mf.group(2),mf.group(3),mf.group(4),span=mf.group(1)=='*')); i+=1; continue
        # headings
        mh=re.match(r'^(#{1,4})\s+(.+)$', ln)
        if mh:
            if not body_started: emit(open_body())
            lvl=len(mh.group(1)); t=mh.group(2).strip()
            if lvl==1:   # treat a stray H1 as a section head
                lvl=2
            if re.match(r'^(references|bibliography)$', t, re.I):
                in_refs=True; emit(f'<h2 class="refhead">{inline(t)}</h2>'); i+=1; continue
            in_refs=False
            mnum=re.match(r'^(\d+(?:\.\d+)*)\s+(.+)$', t)
            tag=f'h{lvl}'
            if mnum: emit(f'<{tag}><span class="num">{mnum.group(1)}</span>{inline(mnum.group(2))}</{tag}>')
            else:    emit(f'<{tag}>{inline(t)}</{tag}>')
            i+=1; continue
        # numbered list inside references context -> ol.refs
        if in_refs and re.match(r'^\s*\d+\.\s+', ln):
            if not body_started: emit(open_body())
            items=[]
            while i<n and re.match(r'^\s*\d+\.\s+', lines[i]):
                items.append(inline(re.sub(r'^\s*\d+\.\s+','',lines[i]).rstrip())); i+=1
            emit('<ol class="refs">'+''.join(f'<li>{x}</li>' for x in items)+'</ol>'); continue
        # ordinary block
        if not ln.strip(): i+=1; continue
        if not body_started: emit(open_body())
        buf=[ln]; i+=1
        while i<n and lines[i].strip() and not lines[i].startswith(':::') and not re.match(r'^#', lines[i]) \
              and not lines[i].lstrip().startswith('|') and not re.match(r'^(Table\*?:|Note:|!\*?\[)', lines[i]):
            buf.append(lines[i]); i+=1
        frag=render_blocks(buf)
        if not lead_done and '<p>' in frag:
            frag=frag.replace('<p>','<p class="lead">',1); lead_done=True
        emit(frag)

    if not body_started: emit(open_body())
    body_html=''.join(body_frag)+'</div>'+endmatter_html[0]
    for leak in re.findall(r'\{\.[^\n<]{0,60}', body_html):   # run-in delimiter leak guard
        sys.stderr.write(f'[runin] unparsed run-in directive leaked into the body: {leak!r}\n')  # close .cols, then full-width end matter
    links=''.join(f'<link rel="stylesheet" href="{html.escape(c)}">' for c in cssfiles)
    return (f'<!DOCTYPE html><html><head><meta charset="utf-8"><title>{html.escape(title)}</title>'
            f'{links}</head><body class="{acccls}">{body_html}</body></html>')

def main():
    if len(sys.argv)<2: print("usage: build_journal.py source.md [out.pdf]"); sys.exit(1)
    src=pathlib.Path(sys.argv[1]).resolve(); text=src.read_text(encoding='utf-8')
    fm, body = parse_front(text); srcdir=src.parent
    css=[]
    if (srcdir/'face.css').exists(): css.append('face.css')
    css.append('apex.css')
    doc=build_html(fm, body, css)
    (srcdir/'_journal.html').write_text(doc, encoding='utf-8')
    out_pdf=pathlib.Path(sys.argv[2]) if len(sys.argv)>2 else srcdir/'journal.pdf'
    from weasyprint import HTML
    HTML(string=doc, base_url=str(srcdir)).write_pdf(str(out_pdf))
    print("PDF:", out_pdf)

if __name__=='__main__': main()
```

Build with `python3 build_apex.py source.md /mnt/user-data/outputs/{slug}.pdf`, the base URL the source directory, then inspect the render: confirm the cover hairlines stand clear of the text and the author rule sits with the byline, the ruled abstract and the raised initial, the copper all-caps section heads, the gray-header tables with verdict color-coding and no badge crossing a border, and the copper running footer carrying the short title. Present the PDF and keep the Markdown source as master. The five style variants of III.E are produced by swapping the accent and rule treatments in `apex.css`; the engine is unchanged.

---

# MODULE III·J · THE PROFESSIONAL JOURNAL PAPER EDITION

The middle register. Module III renders the Apex Pristine paper, a single-column elegant treatise in the house serif. Modules V and V·D render the Textbook editions, two-column and box-rich for instruction. The Professional Journal Paper sits between them: it borrows the Textbook's two-column grid and box discipline but holds the formal restraint of a peer-reviewed journal article, serif throughout, a masthead, a bold abstract, superscript citations, and a dense reference list. It is for papers meant to read as journal-grade work, the codex papers among them. Selected by the token `[EDITION:JOURNAL]` or front-matter `edition: journal`. It transforms any paper into the journal register and never co-fires with the Module III paper renderer or the Textbook editions.

## III·J.0 · The Design Read

A professional journal article in the Nature family sets a precise page. Seven elements carry it. First, the type is serif throughout, body and title and heads alike, in a single restrained measure, which reads as scholarly rather than instructional. Second, the page opens with a masthead: the journal wordmark on the left, the article type on the right in an accent colour with the DOI beneath, and a thick accent rule closing the band. Third, the title block spans the full measure above the columns: a large serif title, an author line with superscript affiliation markers, a small justified affiliations line, and a bold abstract set off by hairline rules. Fourth, the body breaks into two justified columns separated by a faint rule, opening on a raised initial. Fifth, headings are flush-left and bold, the top level in the accent colour, sentence case, unobtrusive. Sixth, the apparatus is journal-formal: superscript numeric citations in the text, a dense numbered reference list flowing in the columns, tinted Box N panels with an accent top rule, Table N caption bars, and Fig. N captions. Seventh, the running furniture is quiet: the journal name and article type in small accent caps at the top, a citation line and page number at the foot. The aesthetic is restraint and density, captured by a serif measure, an accent that touches only the masthead, heads, rules, and labels, and a strict two-column economy.

## III·J.1 · The Locked Contract

Serif throughout is the rule. Body, title, heads, abstract, captions, and references all set in the house serif, EB Garamond, at 9.1 points on a 1.36 measure, justified and hyphenated; only the masthead article type, the running heads, the box and table labels, and the section heads use the house sans for crispness. Page geometry is US Letter, 612 by 792 points, margins 58 by 54 by 62, with a two-column body at a 20-point gutter and a hairline column rule. The accent is restrained and touches only the masthead, the section heads, the rules, the box top, the table caption bar, the citation labels, and the superscript markers; the body is black on white. The universal locks hold without exception: no LaTeX and all mathematics in Unicode, no em-dashes, the honorific ﷺ as one glyph, no emoji, and no box, figure, or table fragmenting except where a long data box or table is explicitly allowed to flow.

## III·J.2 · The Title Block

The masthead carries the journal name as a wordmark, the first word in the regular weight and the remainder bold, a Nature-style two-tone lockup; on the right the masthead sets a rigid three-line stack, each line held to a single line and the column never shrinking, so the right block stays exactly three lines against the two-line wordmark on the left: the category from `article_type` in accent caps on the first line, the main goal from `goal` in accent caps on the second, and the series or DOI from `doi` in faint sans on the third; a thick accent rule closes the band. The wordmark names the tractatus by domain: core protocol and proof volumes set Tractatus Veritatis Trisductivus, a philosophy or metaphysics paper Tractatus Philosophicus, a mathematics paper Tractatus Mathematicus, a science or physics paper Tractatus Physicus, and the general fallback Tractatus Veritatis. Below it the title block spans the full measure: the title in large bold serif, an optional subtitle from `subtitle` in accent italic directly beneath, the author line with accent superscript affiliation markers, the affiliations and corresponding address in a small justified line, and the abstract in bold serif bounded above and below by hairline rules. An optional keywords line follows in small sans. The masthead and title block are suppressed from the running header on the first page; the journal name and article type are lifted into the top margin on every page thereafter.

### III·J.2a · The Masthead Brevity Law

The masthead right block is a label stack, not a sentence stack, and this is the rule that keeps it one. Three lines sit beside a two-line wordmark across a 500-point measure, and the wordmark needs roughly the left third of that measure to breathe. So each line is capped, hard, and the caps are counted in characters on the source string before uppercasing: the article type at thirty, the goal line at forty-four, the series or DOI line at thirty-six. A line past its cap crowds the wordmark, wraps or over-runs, and stops reading as a label.

What each line carries is fixed by the caps and should be composed to them. The first line is the field or register, two or three words, the loudest mark in the band: Theology of Mathematics, Foundations of Physics, Complexity Theory. The second line is the paper's claim compressed to a slogan, one clause and no subordinate clause, the line a reader remembers: Prime Holds, but Instrument cannot reach. The third line is the series, collection, or DOI, a short noun phrase: Geometric Mathematics, Tractatus Physicus Series. Write these three before writing the abstract, because a goal line that will not compress to forty-four characters is usually a thesis that has not yet been found.

The abstract's opening sentence is not the goal line and must never be pasted into it. The failure mode this law exists to prevent is exactly that paste: a full descriptive sentence lifted from the abstract into the masthead, sixty or seventy characters long, which swallows the band and reduces the wordmark to a margin note. If a line will not compress, cut a clause rather than shrink the type.

Enforcement is two-layer and the layers are not equivalent. The authoring cap is the fix. The engine is the net: `mh_fit` measures each line at build time, emits a warning to standard error naming the line, its length, and its cap, and tags the element `.t1` up to a quarter over or `.t2` beyond, at which the stylesheet steps the type down so the band degrades gracefully instead of breaking. A build that emits a masthead warning has a source defect, and the warning is repaired at the front matter before delivery, never accepted as the render. The stylesheet additionally holds the right block to sixty-four percent of the measure and permits it to shrink, so no line can ever push into the wordmark.

## III·J.3 · The Heading Ladder and the Raised Initial

Four levels. The top-level section head is bold accent sans, flush left, sentence case, the loudest mark in the body and still quiet. The sub-section head is bold dark sans, smaller. The third level is a bold-italic serif run-in heading. The inline run-in is a bold-italic serif lead phrase that flows into its paragraph. Any head may carry a numeral, though journal sections are usually unnumbered. The body opens on a raised initial: the first letter of the lead paragraph set large in the accent colour, rising on the first line. The raised initial is used once, on the opening paragraph only.

The inline run-in carries one delimiter rule and one leak guard, because it is the directive that most often fails silently. The form is `{. lead phrase .}` and the engine supplies the closing period itself, so the phrase is written without one. Three closings parse identically, `.}` and `. }` and a bare `}`, which is deliberate: an author who ends the lead in a full sentence and writes `earned. }` gets the same render as one who writes `earned .}`, and no build is lost to a space. A directive that still fails to parse would print its own braces into the body, so the engine scans the assembled body for a surviving `{.` and warns on standard error naming the leak. That warning is a source defect repaired before delivery, never a render accepted with braces on the page. Where the lead is a titled proposition rather than a phrase flowing into its sentence, a level-four head is the better instrument and carries its own punctuation.

## III·J.4 · Boxes, Tables, and Figures

The box is the journal panel: a tinted block with an accent top rule and a bold header reading Box N | Title, holding paragraphs, lists, or a table. The table is a captioned object: an accent caption bar reading Table N | Title above a ruled table with a tinted header row and zebra body. The figure is a framed image with a caption reading Fig. N | caption, the label in accent. All three default to column width and flow inside one column, packing the page; a genuinely wide table or box is allowed full width by the span rule below. All boxes flow and break across the column boundary to fill space, the tinted panel continuing without a repeated top rule, never jumping whole and stranding the foot of a column; a box wrapping a long table also repeats its column header. Every claim-bearing box, table, and figure carries its warrant tier exactly as the codex establishes it; the faithful-map law governs, and a box asserts no more than the source proves.

## III·J.5 · References and End Matter

Citations are superscript and numeric, set in the text with the caret form `^12^` or `^2,3^`, matching a numbered reference list. The reference list is introduced by a References heading and set as a dense numbered list flowing in the two columns, hairline-ruled above, in small serif with a hanging indent. End matter, acknowledgements, author contributions, competing interests, and correspondence, is written in an endmatter block and rendered full width below the columns, ruled off, with its own small sans subheadings. The author supplies the citation numbers and the reference list; the engine numbers and sets them.

## III·J.6 · Page Economy and the Span Rule

Tables, figures, and boxes default to column width and flow inside one column, which packs the dense journal page without stranded space. Full-width spanning is what wastes space: a spanning element closes both columns and the short band above it balances into two stub columns, leaving the gap empty. Spanning is opt-in. Append an asterisk to span a genuinely wide element: `:::box* N Title` for a box, `Table*: Table N | caption` for a table, `!*[alt](path)` for a figure. Every box flows by default, filling the foot of a column and continuing at the top of the next inside its tinted panel rather than jumping whole to the next page and stranding the space; a box that wraps a table also repeats its column header on the continuation. The journal panel is borderless, a tint with an accent top rule, so a broken panel reads as a clean continuation, never an open cut edge. Think ahead before placing a wide element: prefer column width, reserve spanning for tables too wide to read in a single column.

## III·J.7 · Authoring Conventions

Front matter sets the article: `edition: journal`, then `title`, an optional `subtitle`, `author_line` (with `^1^` superscript markers), `journal`, `article_type` (the masthead category line, capped at thirty characters), an optional `goal` (the masthead main-goal line, capped at forty-four), `doi` (the masthead series line, capped at thirty-six), the three caps enforced by the Masthead Brevity Law of III·J.2a, `volume`, `pages`, `date`, and `accent`. Accent is one of crimson, copper, slate, navy, forest, or plum; crimson is the default and reads as a classic journal. The title block is filled from three leading blocks placed right after the front matter: `:::affiliations` for the affiliations and corresponding line, `:::abstract` for the bold abstract, and an optional `:::keywords`. The body then runs as ordinary Markdown: a level-two heading is a section head, a level-three a sub-head, a level-four a run-in; the run-in `{. lead .}` flows a bold-italic phrase into its paragraph; `:::box N Title` opens a numbered panel and `:::box* N Title` spans it; `Table: Table N | caption` and `Table*:` set a captioned table; `![alt](path){Fig. N | caption | source}` and `!*[` set a figure; `[[cross-references]]` and `^n^` superscripts set inline marks. A References heading followed by a numbered list sets the reference list, and `:::endmatter` holds the closing sections. The first body paragraph automatically takes the raised initial.

## III·J.8 · The Journal Stylesheet

The complete validated stylesheet. Self-contained, compiles under WeasyPrint as written. Save as `journal.css` beside the source; the face block of Module V provisions the serif and the sans, with the system fallback chain applying if it is skipped. The drop cap is a no-float raised initial, since float inside a multi-column container is unsupported by the engine.

```css
/* ===================================================================
   JOURNAL  ·  Professional Journal Paper stylesheet  (WeasyPrint-validated)
   Serif two-column journal page · accent masthead + running rule · large
   serif title with superscript-affiliated authors · bold abstract · drop-cap
   intro · flush-left bold heads · superscript citations + dense reference
   list · tinted Box N panels · Fig. N / Table N captions · citation footer
   =================================================================== */

:root{
  --serif:'EBGaramond','EB Garamond','Liberation Serif','Noto Serif','DejaVu Serif','FreeSerif',serif;
  --sans:'TBSans','Archivo','Liberation Sans','Noto Sans','DejaVu Sans','FreeSans',sans-serif;
  --ink:#1a1a1a; --soft:#404040; --faint:#6f6f6f; --rule:#cccccc;
  --accent:#A0182B; --deep:#74111F; --tint:#FBEDEF; --band:#F4DEE2;
}
.acc-crimson{--accent:#A0182B;--deep:#74111F;--tint:#FBEDEF;--band:#F4DEE2;}
.acc-copper {--accent:#B87333;--deep:#8a5523;--tint:#FAF3EA;--band:#EFE0CF;}
.acc-slate  {--accent:#2C3E50;--deep:#1b2733;--tint:#ECEFF2;--band:#D8DEE4;}
.acc-navy   {--accent:#1F3A66;--deep:#142845;--tint:#EAEEF5;--band:#D3DCEA;}
.acc-forest {--accent:#1F5C3D;--deep:#143f29;--tint:#E9F2EC;--band:#D2E5D9;}
.acc-plum   {--accent:#5E2A5E;--deep:#411d41;--tint:#F2ECF2;--band:#E2D2E2;}

/* ---------------- page geometry + furniture ---------------- */
@page{
  size:612pt 792pt; margin:58pt 54pt 62pt 54pt;
  @top-left{ content:string(jtype); font-family:var(--sans); font-size:7.6pt; font-weight:800;
    color:var(--deep); text-transform:uppercase; letter-spacing:.08em; vertical-align:bottom; padding-bottom:4pt; }
  @top-right{ content:string(jname); font-family:var(--sans); font-size:7.6pt; font-weight:800;
    color:var(--deep); text-transform:uppercase; letter-spacing:.08em; vertical-align:bottom; padding-bottom:4pt; }
  @bottom-left{ content:string(jfoot); font-family:var(--serif); font-size:7.4pt; color:var(--faint);
    vertical-align:top; padding-top:5pt; }
  @bottom-right{ content:counter(page); font-family:var(--sans); font-size:8.4pt; font-weight:700;
    color:var(--deep); vertical-align:top; padding-top:5pt; }
}
@page:first{ @top-left{content:none} @top-right{content:none} }

html{ font-family:var(--serif); font-size:9.1pt; color:var(--ink); line-height:1.36; }
body{ margin:0; string-set:jname string(jnameRaw), jtype string(jtypeRaw), jfoot string(jfootRaw); }
p{ margin:0 0 5.5pt; text-align:justify; hyphens:auto; orphans:2; widows:2; }
sup{ font-size:.66em; line-height:0; vertical-align:super; }
strong,b{ font-weight:800; } em,i{ font-style:italic; }
a{ color:var(--accent); text-decoration:none; } .xref{ color:var(--accent); }
ul,ol{ margin:3pt 0 6pt 14pt; padding:0; } li{ margin:0 0 3pt; }
ul{ list-style:none; } ul>li::before{ content:"\2022\00A0"; color:var(--accent); margin-left:-11pt; }

/* hidden string carriers (set running header/footer text) */
.smeta{ position:absolute; left:-9999pt; top:0; height:0; overflow:hidden; }
.jnameRaw{ string-set:jnameRaw content(); } .jtypeRaw{ string-set:jtypeRaw content(); }
.jfootRaw{ string-set:jfootRaw content(); }

/* ---------------- MASTHEAD ---------------- */
.masthead{ display:flex; align-items:flex-end; justify-content:space-between;
  border-bottom:2.4pt solid var(--accent); padding-bottom:5pt; margin:0 0 13pt; }
.masthead .mark{ font-family:var(--serif); font-weight:800; font-size:20pt; line-height:.9; color:var(--ink); letter-spacing:-.01em; }
.masthead .mark .lite{ font-weight:400; }
.masthead .right{ text-align:right; flex-shrink:1; min-width:0; max-width:64%; }
.masthead .atype{ font-family:var(--sans); font-weight:800; font-size:11pt; color:var(--accent);
  text-transform:uppercase; letter-spacing:.04em; white-space:nowrap; }
.masthead .agoal{ font-family:var(--sans); font-weight:600; font-size:7.5pt; color:var(--accent);
  text-transform:uppercase; letter-spacing:.02em; margin-top:1.5pt; white-space:nowrap; }
.masthead .doi{ font-family:var(--sans); font-size:6.8pt; color:var(--faint); margin-top:2pt; white-space:nowrap; }
/* masthead brevity net (III·J.2): the engine tags an over-long line .t1 or .t2 and
   the type steps down rather than crowding the wordmark. The cap is the fix. */
.masthead .atype.t1{ font-size:9.6pt; }
.masthead .atype.t2{ font-size:8.4pt; letter-spacing:.02em; }
.masthead .agoal.t1{ font-size:7pt; }
.masthead .agoal.t2{ font-size:6.4pt; letter-spacing:.01em; }
.masthead .doi.t1{ font-size:6.2pt; }
.masthead .doi.t2{ font-size:5.8pt; }

/* ---------------- TITLE BLOCK (spans full width) ---------------- */
.titleblock{ margin:0 0 12pt; }
.titleblock h1.jtitle{ font-family:var(--serif); font-weight:800; font-size:25pt; line-height:1.06;
  color:var(--ink); margin:0 0 9pt; letter-spacing:-.005em; }
.titleblock .jsubtitle{ font-family:var(--serif); font-weight:500; font-style:italic; font-size:13pt; line-height:1.25;
  color:var(--accent); margin:-3pt 0 10pt; }
.titleblock .authors{ font-family:var(--serif); font-size:11pt; line-height:1.4; color:var(--ink); margin:0 0 6pt; }
.titleblock .authors sup{ color:var(--accent); font-weight:700; }
.affil{ font-family:var(--serif); font-size:7.8pt; line-height:1.32; color:var(--soft); text-align:justify; margin:0 0 9pt; }
.affil sup{ color:var(--accent); }
.affil .corr{ color:var(--deep); }

.abstract{ font-family:var(--serif); font-weight:700; font-size:10.2pt; line-height:1.4; color:var(--ink);
  text-align:justify; border-top:0.8pt solid var(--rule); border-bottom:0.8pt solid var(--rule);
  padding:9pt 0; margin:0 0 13pt; }
.kwline{ font-family:var(--sans); font-size:8pt; color:var(--soft); margin:-7pt 0 13pt; }
.kwline .lab{ font-weight:800; color:var(--deep); text-transform:uppercase; letter-spacing:.04em; }

/* ---------------- TWO-COLUMN BODY ---------------- */
.cols{ column-count:2; column-gap:20pt; column-rule:0.4pt solid #e4e4e4; }

/* drop cap on the lead paragraph */
p.lead{ text-align:justify; }
p.lead::first-letter{ font-family:var(--serif); font-weight:800; color:var(--accent);
  font-size:2.7em; line-height:0.8; }

/* ---------------- heading ladder ---------------- */
h2{ font-family:var(--sans); font-weight:800; font-size:10.4pt; color:var(--accent);
  margin:12pt 0 4pt; line-height:1.16; break-after:avoid; }
h2 .num{ color:var(--accent); margin-right:6pt; }
h3{ font-family:var(--sans); font-weight:800; font-size:9.3pt; color:var(--ink);
  margin:9pt 0 3pt; break-after:avoid; }
h3 .num{ color:var(--deep); margin-right:6pt; }
h4{ font-family:var(--serif); font-weight:800; font-style:italic; font-size:9.3pt; color:var(--ink);
  margin:7pt 0 2pt; break-after:avoid; }
.runin{ font-family:var(--serif); font-weight:800; font-style:italic; color:var(--ink); }

/* ---------------- BOX  (Box N | Title) ---------------- */
.jbox{ break-inside:avoid; background:var(--tint); border-top:2pt solid var(--accent);
  padding:7pt 9pt 8pt; margin:9pt 0; box-decoration-break:clone; }
.jbox.flow{ break-inside:avoid; }
.jbox.flow table{ break-inside:avoid; } .jbox.flow thead{ display:table-header-group; }
.jbox .jbh{ font-family:var(--sans); font-weight:800; font-size:9pt; color:var(--deep);
  margin:0 0 5pt; text-transform:none; break-after:avoid; }
.jbox .jbh .lab{ color:var(--accent); }
.jbox p{ font-size:8.4pt; text-align:justify; margin:0 0 4pt; orphans:2; widows:2; }
.jbox ul{ margin:2pt 0 0 13pt; } .jbox ul>li::before{ color:var(--accent); }
.jbox table{ width:100%; border-collapse:collapse; font-size:7.9pt; margin:2pt 0; }
.jbox thead th{ text-align:left; font-weight:800; color:var(--deep); border-bottom:1pt solid var(--accent); padding:3pt 5pt; }
.jbox tbody td{ padding:3pt 5pt; border-bottom:0.4pt solid var(--rule); vertical-align:top; word-wrap:break-word; overflow-wrap:break-word; hyphens:none; }
.jbox .tnote{ font-size:7.2pt; color:var(--soft); font-style:italic; padding-top:3pt; }
.jspan{ column-span:all; break-inside:avoid; }

/* small-print aside */
.aside{ font-size:8.2pt; color:var(--soft); text-align:justify; margin:5pt 0; }
.aside::before{ content:"\25AA\2002"; color:var(--accent); font-size:6.6pt; }

/* ---------------- TABLE (Table N | Title) ---------------- */
.jtable{ margin:9pt 0; break-inside:avoid; }
.jtable .tcap{ font-family:var(--sans); font-weight:800; font-size:8.6pt; color:#fff; background:var(--accent);
  padding:3.5pt 7pt; }
.jtable .tcap .lab{ color:#fff; }
.jtable table{ width:100%; border-collapse:collapse; font-family:var(--serif); font-size:8.1pt; }
.jtable thead th{ background:var(--band); color:var(--deep); text-align:left; font-weight:800;
  padding:3.5pt 6pt; border-bottom:1pt solid var(--accent); font-family:var(--sans); font-size:7.7pt; }
.jtable tbody td{ padding:3.5pt 6pt; border-bottom:0.4pt solid var(--rule); vertical-align:top; word-wrap:break-word; overflow-wrap:break-word; hyphens:none; }
.jtable tbody tr:nth-child(even) td{ background:#faf7f8; }
.jtable .tnote{ font-family:var(--serif); font-size:7.2pt; color:var(--soft); padding:3pt 1pt 0; }
.jtable.span{ column-span:all; break-inside:avoid; }
.jtable thead{ display:table-header-group; }

/* ---------------- FIGURE (Fig. N | caption) ---------------- */
.jfig{ break-inside:avoid; margin:10pt 0; }
.jfig .frame{ background:#fff; padding:0; text-align:center; }
.jfig img{ max-width:100%; height:auto; }
.jfig figcaption{ font-family:var(--serif); font-size:7.9pt; line-height:1.34; color:var(--soft);
  margin-top:5pt; text-align:justify; }
.jfig figcaption .flab{ font-family:var(--sans); font-weight:800; color:var(--accent); }
.jfig.span{ column-span:all; }

/* ---------------- REFERENCES (dense, numbered, in-flow) ---------------- */
h2.refhead{ font-family:var(--sans); font-weight:800; font-size:9.2pt; color:var(--ink);
  border-top:0.8pt solid var(--rule); padding-top:5pt; margin:11pt 0 4pt; }
ol.refs{ margin:0; padding:0; list-style:none; counter-reset:ref; }
ol.refs li{ font-family:var(--serif); font-size:7.5pt; line-height:1.3; color:var(--soft);
  padding-left:14pt; text-indent:-14pt; margin:0 0 3pt; text-align:justify; }
ol.refs li::before{ counter-increment:ref; content:counter(ref) ". "; font-weight:700; color:var(--ink); }

/* ---------------- author block / end matter ---------------- */
.endmatter{ border-top:0.8pt solid var(--rule); margin-top:11pt; padding-top:7pt; }
.endmatter h3{ font-family:var(--sans); font-weight:800; font-size:8.4pt; color:var(--ink); margin:6pt 0 2pt; }
.endmatter p{ font-size:7.8pt; color:var(--soft); }

/* ---------------- table of contents (rarely used) ---------------- */
.toc{ break-after:page; } .toc h1{ font-family:var(--sans); font-size:15pt; font-weight:800; color:var(--accent); }
```

## III·J.9 · The Journal Build Engine

The journal-aware engine. It parses the front matter and the leading affiliations, abstract, and keywords blocks into the title block, renders the masthead and the full-measure title block, opens the two-column body, marks the first paragraph with the raised initial, and renders the heading ladder, the Box N panels, the Table N and Fig. N captions, the superscript citations, the numbered reference list, and the full-width end matter. Heads at level two to four become accent, dark, and run-in heads; a References heading switches the following numbered list to the dense reference style; the end matter renders outside the columns. Save as `build_journal.py`. Build with `python3 build_journal.py source.md /mnt/user-data/outputs/{slug}.pdf`, the base URL the source directory, then inspect the render: confirm the masthead and ruled abstract, the raised initial, the crimson heads, the tinted Box N panels, the Table N caption bars, the dense reference list, and the citation footer. Present the PDF and keep the Markdown source as master.

```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
JOURNAL build engine (Professional Journal Paper).
Compiles one Markdown source to a serif two-column journal-grade PDF via
WeasyPrint: accent masthead, superscript-affiliated authors, bold abstract,
drop-cap intro, flush-left bold heads, tinted Box N panels, Table N / Fig. N
captions, dense numbered references, citation footer.

Usage:  python3 build_journal.py source.md [out.pdf]
Source dir must contain journal.css (and optionally face.css + fonts/).
"""
import sys, os, re, html, pathlib

ACCENTS={'crimson','copper','slate','navy','forest','plum'}

def parse_front(text):
    fm={}; m=re.match(r'^---\s*\n(.*?)\n---\s*\n',text,re.S); body=text
    if m:
        for line in m.group(1).splitlines():
            if ':' in line: k,v=line.split(':',1); fm[k.strip()]=v.strip()
        body=text[m.end():]
    return fm, body

def inline(s):
    s=html.escape(s, quote=False)
    s=re.sub(r'\[\[(.+?)\]\]', r'<span class="xref">\1</span>', s)
    s=re.sub(r'\*\*(.+?)\*\*', r'<strong>\1</strong>', s)
    s=re.sub(r'(?<!\*)\*(?!\*)(.+?)(?<!\*)\*(?!\*)', r'<em>\1</em>', s)
    s=re.sub(r'`(.+?)`', r'<code>\1</code>', s)
    s=re.sub(r'\^(.+?)\^', r'<sup>\1</sup>', s)
    return s

def render_blocks(lines):
    out=[]; i=0; n=len(lines)
    while i<n:
        ln=lines[i]
        if not ln.strip(): i+=1; continue
        if re.match(r'^\s*[-*\u2022]\s+', ln):
            items=[]
            while i<n and re.match(r'^\s*[-*\u2022]\s+', lines[i]):
                items.append(inline(re.sub(r'^\s*[-*\u2022]\s+','',lines[i]).rstrip())); i+=1
            out.append('<ul>'+''.join(f'<li>{x}</li>' for x in items)+'</ul>'); continue
        if re.match(r'^\s*\d+\.\s+', ln):
            items=[]
            while i<n and re.match(r'^\s*\d+\.\s+', lines[i]):
                items.append(inline(re.sub(r'^\s*\d+\.\s+','',lines[i]).rstrip())); i+=1
            out.append('<ol>'+''.join(f'<li>{x}</li>' for x in items)+'</ol>'); continue
        mrun=re.match(r'^\{\.\s*(.+?)\s*\.?\s*\}\s*(.*)$', ln)   # tolerant close: .} / . } / }
        if mrun:
            buf=[mrun.group(2).rstrip()] if mrun.group(2).strip() else []; i+=1
            while i<n and lines[i].strip() and not re.match(r'^\s*([-*\u2022]|\d+\.)\s+', lines[i]) \
                  and not lines[i].startswith(':::') and not re.match(r'^\{\.', lines[i]):
                buf.append(lines[i].rstrip()); i+=1
            out.append(f'<p><span class="runin">{inline(mrun.group(1))}.</span> '+inline(' '.join(buf))+'</p>'); continue
        buf=[ln.rstrip()]; i+=1
        while i<n and lines[i].strip() and not re.match(r'^\s*([-*\u2022]|\d+\.)\s+', lines[i]) \
              and not lines[i].startswith(':::') and not re.match(r'^\{\.', lines[i]):
            buf.append(lines[i].rstrip()); i+=1
        out.append('<p>'+inline(' '.join(buf))+'</p>')
    return ''.join(out)

def render_table_rows(tbl_lines):
    rows=[r for r in tbl_lines if r.strip()]
    cells=[[c.strip() for c in re.split(r'(?<!\\)\|', r.strip().strip('|'))] for r in rows]
    body=[c for c in cells if not all(re.fullmatch(r':?-{2,}:?', x or '-') for x in c)]
    head=body[0] if body else []; data=body[1:] if len(body)>1 else []
    h='<thead><tr>'+''.join(f'<th>{inline(x)}</th>' for x in head)+'</tr></thead>'
    b='<tbody>'+''.join('<tr>'+''.join(f'<td>{inline(x)}</td>' for x in r)+'</tr>' for r in data)+'</tbody>'
    return h+b

def render_table(tbl_lines, caption=None, note=None, span=False):
    cap=''
    if caption:
        m=re.match(r'^(Table\s+[\w.]+)\s*[|:]\s*(.+)$', caption)
        if m: cap=f'<div class="tcap"><span class="lab">{inline(m.group(1))} | </span>{inline(m.group(2))}</div>'
        else: cap=f'<div class="tcap">{inline(caption)}</div>'
    nt=f'<div class="tnote">{inline(note)}</div>' if note else ''
    sp=' span' if span else ''
    return f'<div class="jtable{sp}">{cap}<table>{render_table_rows(tbl_lines)}</table>{nt}</div>'

def render_figure(alt, path, brace, span=False):
    label=''; body=brace or alt; src=''
    if brace and '|' in brace:
        parts=[p.strip() for p in brace.split('|')]
        label=parts[0] if parts else ''
        body=parts[1] if len(parts)>1 else ''
        src=parts[2] if len(parts)>2 else ''
    cap=''
    if label: cap+=f'<span class="flab">{inline(label)} | </span>'
    cap+=inline(body)
    if src: cap+=f' <span class="fsrc">{inline(src)}</span>'
    sp=' span' if span else ''
    return (f'<div class="jfig{sp}"><div class="frame"><img src="{html.escape(path)}" alt="{html.escape(alt)}"></div>'
            f'<figcaption>{cap}</figcaption></div>')

def render_box(number, title, body_lines, span=False):
    has_table=any(l.lstrip().startswith('|') for l in body_lines)
    if has_table:
        i=0;n=len(body_lines);chunks=[]
        while i<n:
            if body_lines[i].lstrip().startswith('|'):
                tl=[]
                while i<n and body_lines[i].lstrip().startswith('|'): tl.append(body_lines[i]); i+=1
                note=None
                if i<n and re.match(r'^Note:\s*(.+)$', body_lines[i]):
                    note=re.match(r'^Note:\s*(.+)$', body_lines[i]).group(1).strip(); i+=1
                chunks.append('<table>'+render_table_rows(tl)+'</table>'+(f'<div class="tnote">{inline(note)}</div>' if note else ''))
            else:
                tx=[]
                while i<n and not body_lines[i].lstrip().startswith('|'): tx.append(body_lines[i]); i+=1
                if any(x.strip() for x in tx): chunks.append(render_blocks(tx))
        inner=''.join(chunks)
    else:
        inner=render_blocks(body_lines)
    lab=f'Box {number}' if number else 'Box'
    cls=' jspan' if span else (' flow' if has_table else '')
    head=f'<div class="jbh"><span class="lab">{html.escape(lab)} | </span>{inline(title)}</div>'
    return f'<div class="jbox{cls}">{head}{inner}</div>'

# --- masthead brevity law (III·J.2) ------------------------------------------
# The masthead right block is a rigid three-line stack held beside a two-line
# wordmark. A line past its cap crowds the wordmark and reads as a sentence
# rather than a label. The cap is the fix; the step-down is the net.
MH_CAPS = {'atype': 30, 'goal': 44, 'doi': 36}

def mh_fit(s, key):
    """Step-down class for an over-long masthead line, with a build-time warning."""
    cap = MH_CAPS[key]; n = len(s or '')
    if n <= cap: return ''
    step = ' t1' if n <= cap * 1.25 else ' t2'
    sys.stderr.write(f"[masthead] {key} is {n} chars, cap {cap}; stepped down"
                     f" ({step.strip()}). Shorten it in the front matter: {s!r}\n")
    return step

def render_endmatter(lines):
    out=[]; buf=[]
    def flush():
        if buf: out.append(render_blocks(buf)); buf.clear()
    for ln in lines:
        m=re.match(r'^###\s+(.+)$', ln)
        if m: flush(); out.append(f'<h3>{inline(m.group(1).strip())}</h3>')
        else: buf.append(ln)
    flush(); return ''.join(out)

def build_html(fm, body, cssfiles):
    acc=fm.get('accent','crimson').strip().lower()
    if acc not in ACCENTS: acc='crimson'
    acccls='acc-'+acc
    journal=fm.get('journal','Journal'); atype=fm.get('article_type','Article'); goal=fm.get('goal','')
    doi=fm.get('doi',''); title=fm.get('title',''); authors=fm.get('author_line',''); subtitle=fm.get('subtitle','')
    vol=fm.get('volume',''); pages=fm.get('pages',''); date=fm.get('date','')
    # masthead wordmark: first word light, remainder bold
    parts=journal.split()
    mark=(f'<span class="lite">{html.escape(parts[0])}</span> '+html.escape(' '.join(parts[1:]))) if len(parts)>1 else html.escape(journal)
    # footer citation line
    foot=journal
    if vol: foot+=f" \u00b7 Vol {vol}"
    if date: foot+=f" \u00b7 {date}"
    if pages: foot+=f" \u00b7 {pages}"

    lines=body.splitlines(); i=0; n=len(lines)
    title_affil=''; title_abs=''; title_kw=''
    body_frag=[]; endmatter_html=['']; body_started=False; lead_done=False; in_refs=False

    def open_body():
        nonlocal body_started
        if body_started: return ''
        body_started=True
        doi_html=f'<div class="doi{mh_fit(doi,"doi")}">{html.escape(doi)}</div>' if doi else ''
        sub_html=f'<div class="jsubtitle">{inline(subtitle)}</div>' if subtitle else ''
        goal_html=f'<div class="agoal{mh_fit(goal,"goal")}">{html.escape(goal)}</div>' if goal else ''
        block=(f'<div class="masthead"><div class="mark">{mark}</div>'
               f'<div class="right"><div class="atype{mh_fit(atype,"atype")}">{html.escape(atype)}</div>{goal_html}{doi_html}</div></div>'
               f'<div class="titleblock"><h1 class="jtitle">{inline(title)}</h1>'
               f'{sub_html}'
               f'<div class="authors">{inline(authors)}</div>'
               f'{title_affil}{title_abs}{title_kw}</div>'
               f'<div class="smeta"><span class="jnameRaw">{html.escape(journal)}</span>'
               f'<span class="jtypeRaw">{html.escape(atype)}</span>'
               f'<span class="jfootRaw">{html.escape(foot)}</span></div>')
        return block+'<div class="cols">'

    def emit(frag):
        nonlocal body_frag
        body_frag.append(frag)

    while i<n:
        ln=lines[i]
        # special title-block / endmatter blocks
        msp=re.match(r'^:::\s*(affiliations|abstract|keywords|endmatter|references)\s*$', ln)
        if msp:
            kind=msp.group(1); j=i+1; bl=[]
            while j<n and lines[j].strip()!=':::': bl.append(lines[j]); j+=1
            if kind=='affiliations':
                title_affil=f'<div class="affil">{inline(" ".join(x.strip() for x in bl if x.strip()))}</div>'
            elif kind=='abstract':
                title_abs=f'<div class="abstract">{inline(" ".join(x.strip() for x in bl if x.strip()))}</div>'
            elif kind=='keywords':
                title_kw=f'<div class="kwline"><span class="lab">Keywords </span>{inline(" ".join(x.strip() for x in bl if x.strip()))}</div>'
            elif kind=='endmatter':
                if not body_started: emit(open_body())
                endmatter_html[0]+=f'<div class="endmatter">{render_endmatter(bl)}</div>'
            i=j+1; continue
        # box / aside directive
        md=re.match(r'^:::\s*(\w+)(\*?)\s*(.*)$', ln)
        if md:
            if not body_started: emit(open_body())
            kind=md.group(1).lower(); bspan=md.group(2)=='*'; rest=md.group(3).strip()
            j=i+1; bl=[]
            while j<n and lines[j].strip()!=':::': bl.append(lines[j]); j+=1
            if kind in ('note','aside') and not rest:
                emit(f'<p class="aside">{render_blocks(bl).replace("<p>","").replace("</p>"," ")}</p>')
            else:
                num=''; mnum=re.match(r'^([\w.]*\d[\w.]*)\s+(.*)$', rest)
                if mnum: num=mnum.group(1); ttl=mnum.group(2).strip()
                else: ttl=rest
                emit(render_box(num, ttl, bl, span=bspan))
            i=j+1; continue
        # table
        cap=None; tspan=False; mcapt=re.match(r'^Table(\*?):\s*(.+)$', ln); look=i
        if mcapt: tspan=mcapt.group(1)=='*'; cap=mcapt.group(2).strip(); look=i+1
        if look<n and lines[look].lstrip().startswith('|'):
            if not body_started: emit(open_body())
            tl=[]; k=look
            while k<n and lines[k].lstrip().startswith('|'): tl.append(lines[k]); k+=1
            note=None
            if k<n and re.match(r'^Note:\s*(.+)$', lines[k]):
                note=re.match(r'^Note:\s*(.+)$', lines[k]).group(1).strip(); k+=1
            emit(render_table(tl, cap, note, span=tspan)); i=k; continue
        # figure
        mf=re.match(r'^!(\*?)\[(.*?)\]\((.*?)\)(?:\{(.*?)\})?\s*$', ln)
        if mf:
            if not body_started: emit(open_body())
            emit(render_figure(mf.group(2),mf.group(3),mf.group(4),span=mf.group(1)=='*')); i+=1; continue
        # headings
        mh=re.match(r'^(#{1,4})\s+(.+)$', ln)
        if mh:
            if not body_started: emit(open_body())
            lvl=len(mh.group(1)); t=mh.group(2).strip()
            if lvl==1:   # treat a stray H1 as a section head
                lvl=2
            if re.match(r'^(references|bibliography)$', t, re.I):
                in_refs=True; emit(f'<h2 class="refhead">{inline(t)}</h2>'); i+=1; continue
            in_refs=False
            mnum=re.match(r'^(\d+(?:\.\d+)*)\s+(.+)$', t)
            tag=f'h{lvl}'
            if mnum: emit(f'<{tag}><span class="num">{mnum.group(1)}</span>{inline(mnum.group(2))}</{tag}>')
            else:    emit(f'<{tag}>{inline(t)}</{tag}>')
            i+=1; continue
        # numbered list inside references context -> ol.refs
        if in_refs and re.match(r'^\s*\d+\.\s+', ln):
            if not body_started: emit(open_body())
            items=[]
            while i<n and re.match(r'^\s*\d+\.\s+', lines[i]):
                items.append(inline(re.sub(r'^\s*\d+\.\s+','',lines[i]).rstrip())); i+=1
            emit('<ol class="refs">'+''.join(f'<li>{x}</li>' for x in items)+'</ol>'); continue
        # ordinary block
        if not ln.strip(): i+=1; continue
        if not body_started: emit(open_body())
        buf=[ln]; i+=1
        while i<n and lines[i].strip() and not lines[i].startswith(':::') and not re.match(r'^#', lines[i]) \
              and not lines[i].lstrip().startswith('|') and not re.match(r'^(Table\*?:|Note:|!\*?\[)', lines[i]):
            buf.append(lines[i]); i+=1
        frag=render_blocks(buf)
        if not lead_done and '<p>' in frag:
            frag=frag.replace('<p>','<p class="lead">',1); lead_done=True
        emit(frag)

    if not body_started: emit(open_body())
    body_html=''.join(body_frag)+'</div>'+endmatter_html[0]
    for leak in re.findall(r'\{\.[^\n<]{0,60}', body_html):   # run-in delimiter leak guard
        sys.stderr.write(f'[runin] unparsed run-in directive leaked into the body: {leak!r}\n')  # close .cols, then full-width end matter
    links=''.join(f'<link rel="stylesheet" href="{html.escape(c)}">' for c in cssfiles)
    return (f'<!DOCTYPE html><html><head><meta charset="utf-8"><title>{html.escape(title)}</title>'
            f'{links}</head><body class="{acccls}">{body_html}</body></html>')

def main():
    if len(sys.argv)<2: print("usage: build_journal.py source.md [out.pdf]"); sys.exit(1)
    src=pathlib.Path(sys.argv[1]).resolve(); text=src.read_text(encoding='utf-8')
    fm, body = parse_front(text); srcdir=src.parent
    css=[]
    if (srcdir/'face.css').exists(): css.append('face.css')
    css.append('journal.css')
    doc=build_html(fm, body, css)
    (srcdir/'_journal.html').write_text(doc, encoding='utf-8')
    out_pdf=pathlib.Path(sys.argv[2]) if len(sys.argv)>2 else srcdir/'journal.pdf'
    from weasyprint import HTML
    HTML(string=doc, base_url=str(srcdir)).write_pdf(str(out_pdf))
    print("PDF:", out_pdf)

if __name__=='__main__': main()
```

## III·J.10 · Codex-Native Journal

A codex paper in the journal register sets `edition: journal` with a chosen accent, the body at Tier 0 plain English with the framework apparatus quarantined to an appendix that carries no results, exactly as the Module III paper discipline requires. The abstract states the result and its warrant tier without framework vocabulary. Verdict and seal statements sit in the body as typed claims, Type T, Type C, or Type S, and a Box N panel may carry a closed-form instrument or a precedence table. The superscript citations and the reference list carry the external mathematics and the prior codex deposits. The faithful-map law and honest typing govern as everywhere: the abstract and every box state no more than the paper proves, and overclaiming a warrant grade in an abstract or a box header is the same failure it is in prose. Where a paper is destined for a specific venue, the journal name, article type, volume, pages, and DOI set the masthead and the citation footer to that venue's identity.

## III·J.11 · Pre-Flight and Gate Integration

A journal deliverable passes the standard pre-delivery gate sequence and, for a codex paper, produces the V-FIO Diagnostic Log exactly as the other editions. Before presentation it passes a short structural checklist. The body and every element set in the house serif, with the sans only on heads, labels, and running furniture. The masthead carries the journal name, article type, and DOI, and the abstract is bold and ruled. The masthead build emits no brevity warning: each of the three right-block lines sits inside its cap of thirty, forty-four, and thirty-six characters per III·J.2a, and a warning on standard error is a source defect repaired in the front matter and rebuilt, never a render accepted with stepped-down type. The raised initial appears once, on the opening paragraph, and the build emits no run-in leak warning, a surviving `{.` in the body being a source defect repaired in the Markdown and rebuilt. Every box carries its accent top rule and its Box N label, every table its Table N caption bar, every figure its Fig. N label, and every wide element either reads in a column or is explicitly spanned. The citations are superscript and resolve to a numbered reference list, and the end matter sits full width below the columns. Every claim-bearing box, table, and figure carries its warrant tier with no inflation. Failure of any item returns the paper for repair before any presentation.

## III·J Quick Reference Card

Edition selector: `[EDITION:JOURNAL]` or front-matter `edition: journal`. The middle register between the Module III Apex Pristine paper and the Module V Textbook editions; the three never co-fire.
Type: serif throughout, EB Garamond, 9.1 pt body, justified two columns at a 20 pt gutter with a hairline column rule. Sans only on section heads, box and table labels, and running furniture.
Page: US Letter 612 by 792, margins 58 / 54 / 62. Accent restrained to masthead, heads, rules, box top, table caption, labels, and superscripts.
Accent: crimson default, or copper, slate, navy, forest, plum, via front-matter `accent`.
Masthead: journal wordmark, first word regular and remainder bold, with the article type in accent caps and the DOI beneath, closed by a thick accent rule. Suppressed on the first-page running header.
Masthead brevity (III·J.2a): hard character caps on the right-block stack, `article_type` 30, `goal` 44, `doi` 36. Line one the field, line two the claim as a slogan, line three the series. Never paste the abstract's first sentence into `goal`. The engine warns and steps the type down; the warning is repaired at source.
Title block: full-measure serif title, author line with accent superscript affiliation markers, small justified affiliations and corresponding line, bold abstract bounded by hairline rules, optional keywords line.
Headings: level-two accent sans head, level-three dark sans sub-head, level-four bold-italic serif run-in, inline `{. lead .}` run-in. Raised accent initial on the opening paragraph only.
Run-in delimiter (III·J.3): write the phrase without a terminal period, the engine supplies it; `.}`, `. }`, and `}` all parse; a surviving `{.` in the body raises a leak warning and is repaired at source, never delivered.
Boxes and floats: tinted Box N panel with an accent top rule; Table N accent caption bar over a ruled zebra table; Fig. N captioned figure. Column-width by default; every box flows and breaks to fill the column, a table-box also repeating its header; `*` spans a wide element.
References and end matter: superscript numeric citations `^n^`; a References heading sets a dense numbered list flowing in the columns; `:::endmatter` renders acknowledgements and correspondence full width below the columns.
Source: front matter (`edition: journal`, title, author_line, journal, article_type, doi, volume, pages, date, accent), then `:::affiliations`, `:::abstract`, optional `:::keywords`, then Markdown body with `:::box N Title`, `Table:`, `![](){Fig. N | ...}`, a References list, and `:::endmatter`.
Build: `python3 build_journal.py source.md /mnt/user-data/outputs/{slug}.pdf`; base URL the source directory; inspect the render; present the PDF; keep the Markdown source as master.
Locks: no LaTeX, Unicode math only; no em-dashes; ﷺ as one glyph; no emoji; warrant tier on every claim-bearing box, table, and figure; faithful map, never inflation; the raised initial is a no-float raised cap, since float inside multicol is unsupported.

---

# MODULE III·M · THE MATH JOURNAL EDITION

The equation-dense register. Module III·J renders the Professional Journal Paper through WeasyPrint under the universal Unicode-math lock, which serves a prose-dominant paper well and degrades the moment the mathematics turns tensor-dense: a Lagrangian with four contracted kinetic terms, a raised-and-lowered index pair, a wavelength average, a stacked fraction, and a second-order expansion all fall back to approximate glyphs or break the measure. The Math Journal is III·J's mathematical descendant. It holds every Journal rule that governs the page, the two-column grid, the accent contract, the ruled abstract spanning the measure, the box and span discipline, the dense reference list, the running furniture, and the LINE-weight disclosure, and it changes exactly one thing: the renderer. The authored Markdown compiles to LaTeX and LaTeX to PDF, so the mathematics sets correctly at journal grade instead of being approximated. Selected by the token `[EDITION:MATH_JOURNAL]`, the token `[FORMAT:MATH_PDF]`, front-matter `edition: math_journal`, or the standing words math journal, math pdf, math paper, and equation paper. It never co-fires with the other renderers.

## III·M.0 · The Design Read

The Math Journal page is the Journal page. A reader holding the two side by side sees the same object: the accent rules bounding a spanning title block, the small-caps title, the article-type line in accent caps, the abstract framed above and below by accent rules with the bold Abstract lead-in, the keywords line beneath, the two justified columns, the accent section heads over hairline rules, and the accent italic running foot carrying short title and page. Nothing about the visual contract is relaxed, negotiated, or restyled. What changes is beneath the page, in the typesetting engine, and it becomes visible only where the mathematics is: a display equation is set by TeX's math engine rather than approximated by a Unicode string, so `𝓛₂ = (1/2κ)[−¼ ∂_λ h_μν ∂^λ h^μν + ...]` sets as real mathematics with true fractions, correct index heights, and a properly sized bracket. The design read is therefore short and honest: this is the Journal, rendered by a math typesetter, for papers whose mathematics is load-bearing.

## III·M.1 · The Locked Contract and the Three Scoped Exceptions

Every Journal rule of III·J.1 holds unchanged: US Letter geometry, two justified columns with a gutter and hairline rule, the accent restrained to masthead, heads, rules, box tops, table caption bars, and labels, the body black on white, no em-dashes, the honorific ﷺ as one glyph, no emoji, no fragmenting of a box or table except where the span rule allows a long object to flow, a warrant tier on every claim-bearing box, table, and figure, and the faithful-map law. The Module VIII disclosure fires at LINE weight, the Journal default, with the master reference injected into References.

Three locks are lifted, scoped to this edition alone, and each is a deliberate, named exception rather than a silent break. First, the no-LaTeX universal lock of III.D is suspended here, because suspending it is the entire purpose of the edition; every other edition keeps it and the Math Journal is the single exemption in the discipline. Second, EB Garamond is replaced by a math-companion serif, Palatino through `mathpazo`, because EB Garamond ships no math companion and pairing it with a foreign math face produces mismatched x-heights and stroke weights across every inline expression, which reads worse than an honest substitution; the page keeps its serif register and the substitution is invisible except to a typographer comparing the two editions directly. Third, the Markdown source of truth is preserved but the intermediate is LaTeX rather than HTML, so the pipeline is Markdown to LaTeX to PDF via pandoc and pdflatex, not Markdown to HTML to PDF via WeasyPrint.

The rule that governs the exceptions: they are scoped, and they do not propagate. A Math Journal deliverable does not license LaTeX in an Apex Pristine paper, a Textbook, a Scripture edition, or a Blog target, all of which keep the Unicode lock without exception.

## III·M.2 · The Title Block

The title block is the Journal's, rendered in LaTeX. It spans the full measure above the columns: an accent rule at 0.8 points across sixty percent of the measure, the title in bold small-caps serif at 20 points on 23, an optional subtitle in large italic, the article type from `article_type` in small accent caps, an optional main-goal line from `goal` in deep-accent italic, a closing accent rule, the author line in small caps, the affiliation and correspondence in faint italic, and the date line. The abstract follows in a full-measure minipage bounded above and below by accent rules at 0.6 points, opening on a bold small-caps `Abstract.` lead-in, with an optional keywords line beneath in faint italic carrying a deep-accent small-caps `Keywords` label. The first page carries the running foot; the masthead wordmark of III·J.2 is optional here and omitted by default, since a math preprint bound for arXiv or a named venue is usually set without a house wordmark; where it is enabled, and wherever `article_type` and `goal` render in any edition, the Masthead Brevity Law of III·J.2a governs their length unchanged.

## III·M.3 · Mathematics, the Reason the Edition Exists

Mathematics is authored in LaTeX inside the Markdown source. Inline math sets between single dollars, display math between double dollars, and the full `amsmath` apparatus is available: `align`, `split`, `equation`, `cases`, `pmatrix`, and the rest. This is the one place in the discipline where LaTeX is not merely permitted but required, and the authoring rule inverts accordingly: do not hand-approximate a tensor expression in Unicode and paste it in, write it as LaTeX and let the engine set it.

Four constructions justify the edition and are the standing test of whether a paper belongs here. A contracted index pair with both a raised and a lowered index on the same symbol, `\partial_\lambda h_{\mu\nu}\partial^\lambda h^{\mu\nu}`, which Unicode cannot stack. A stacked fraction inside a bracketed display, `\frac{1}{2\kappa}\Big[\ldots\Big]`, where the bracket must size to its contents. A superscripted operator carrying an order label, `G^{(2)}_{\mu\nu}`, where the parenthetical order and the tensor indices occupy different registers. And a wavelength average of a squared derivative, `\langle \dot h_{ij}\dot h^{ij}\rangle`, which needs a true dot accent and true angle brackets. A paper containing any of these routes to the Math Journal; a paper containing none of them is prose-dominant and routes to III·J, where the Unicode lock costs nothing.

## III·M.4 · Boxes, Tables, and Figures

The Journal's objects, rendered in LaTeX. The box is the `jbox` environment defined in the template: a small-set block opening on an accent rule at column width, holding paragraphs, lists, or a table, and carrying its warrant tier exactly as the codex establishes it. Tables are authored as ordinary Markdown pipe tables and set with `booktabs` rules; the template shims pandoc's `longtable` onto a one-column float, which is mandatory because `longtable` cannot execute inside a two-column body and its absence is a hard compile failure, not a cosmetic one. Figures are `graphicx` inclusions with a caption reading `Fig. N | caption`. All three default to column width and flow inside one column, packing the page as III·J.6 requires; a genuinely wide object spans by the span rule below.

## III·M.5 · References and End Matter

Two routes, and the choice is the author's. The lightweight route sets the reference list as a `thebibliography` environment with `\bibitem` keys, cited inline with `\cite{key}`, which produces numbered bracketed citations, flows the list densely in the columns, and requires no external toolchain; this is the default and the one the verified engine below produces. The heavyweight route runs BibTeX or `biblatex` against a `.bib` file for a submission whose venue demands a specific citation style. End matter, acknowledgements, author contributions, competing interests, and correspondence, sets in a small final block below the columns. The Module VIII master reference is injected into the reference list at LINE weight exactly as III·J requires.

## III·M.6 · Page Economy and the Span Rule

Identical to III·J.6 and enforced by the LaTeX two-column engine rather than by CSS. Every object defaults to column width and flows inside one column. Spanning is opt-in and costs a page band, so it is reserved for an object genuinely too wide to read in one column. The starred float forms span: `figure*` and `table*` in LaTeX, reached from the source by the same asterisk conventions the Journal uses. The `longtable` shim of III·M.4 places a wide pandoc table on a one-column float automatically, which is the correct behavior and the reason the shim exists rather than a workaround.

## III·M.7 · Authoring Conventions

Front matter sets the article and is read by pandoc as YAML: `edition: math_journal`, then `title`, an optional `subtitle`, `article_type`, an optional `goal`, `author_line`, `affiliation`, `date`, `short_title` for the running foot, `keywords`, `accenthex` (the six-digit hex without a leading hash; `B87333` copper is the default), an optional `fontsize` (default 10pt; 11pt for a shorter paper), and `abstract` as a YAML block scalar. The body then runs as ordinary Markdown with LaTeX mathematics: a level-two heading is a section head, a level-three a sub-head, pipe tables set as tables, and `$...$` and `$$...$$` carry the mathematics. The one authoring constraint the other editions do not impose: any literal backslash, dollar sign, percent, ampersand, or underscore intended as text rather than as LaTeX must be escaped, since the source now passes through a TeX engine.

## III·M.8 · The Math Journal Template

The complete validated template. Self-contained, compiles under pandoc and pdflatex as written, and encodes the Journal visual contract. Save as `mathjournal.tex` beside the source. The `longtable` shim is load-bearing and must not be removed: pandoc emits `longtable` for every pipe table, `longtable` cannot run in a two-column body, and without the shim the build fails fatally rather than degrading.

```latex
\documentclass[$if(fontsize)$$fontsize$$else$10pt$endif$,twocolumn]{article}
\usepackage[letterpaper,margin=0.85in,columnsep=0.28in]{geometry}
\usepackage{mathpazo}
\usepackage[T1]{fontenc}
\usepackage{amsmath,amssymb}
\usepackage[table]{xcolor}
\usepackage{titlesec}\usepackage{fancyhdr}\usepackage{enumitem}
\usepackage{microtype}\usepackage{booktabs}
\usepackage{longtable}
% longtable cannot run in twocolumn mode; shim it onto a one-column float.
% Load-bearing: pandoc emits longtable for every pipe table. Do not remove.
\makeatletter
\let\oldlt\longtable
\let\endoldlt\endlongtable
\def\longtable{\@ifnextchar[\longtable@i \longtable@ii}
\def\longtable@i[#1]{\begin{figure}[t]\onecolumn\begin{minipage}{0.5\textwidth}\smaller\oldlt[#1]}
\def\longtable@ii{\begin{figure}[t]\onecolumn\begin{minipage}{0.5\textwidth}\smaller\oldlt}
\def\endlongtable{\endoldlt\end{minipage}\twocolumn\end{figure}}
\makeatother
\usepackage{relsize}
\usepackage{graphicx}
\usepackage[hidelinks]{hyperref}
\providecommand{\tightlist}{\setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}
\definecolor{accent}{HTML}{$if(accenthex)$$accenthex$$else$B87333$endif$}
\definecolor{deep}{HTML}{8A5523}\definecolor{faint}{HTML}{6E6E6E}
\titleformat{\section}{\normalfont\bfseries\scshape\large}{\color{accent}\thesection.}{0.5em}{}[{\color{accent}\titlerule[0.6pt]}]
\titleformat{\subsection}{\normalfont\bfseries}{\color{accent}\thesubsection}{0.5em}{}
\titlespacing*{\section}{0pt}{1.3ex}{0.6ex}
\pagestyle{fancy}\fancyhf{}
\renewcommand{\headrulewidth}{0pt}\renewcommand{\footrulewidth}{0pt}
\fancyfoot[R]{\color{accent}\itshape\small $short_title$ \textbar\ \thepage}
\fancyfoot[L]{\textcolor{accent}{\rule{0.32\columnwidth}{0.25pt}}}
\newenvironment{jbox}{\par\vspace{2pt}\noindent\color{accent}\rule{\columnwidth}{0.8pt}\par\vspace{-2pt}\small}{\par\vspace{2pt}}
\begin{document}
\twocolumn[{%
\begin{center}
{\color{accent}\rule{0.6\textwidth}{0.8pt}}\\[10pt]
{\bfseries\scshape\fontsize{20}{23}\selectfont $title$}\\[7pt]
$if(subtitle)${\itshape\large $subtitle$}\\[8pt]$endif$
$if(article_type)${\footnotesize\color{accent}\scshape\bfseries $article_type$}\\[3pt]$endif$
$if(goal)${\itshape\color{deep}\small $goal$}\\[9pt]$endif$
{\color{accent}\rule{0.6\textwidth}{0.8pt}}\\[10pt]
{\scshape $author_line$}\\[2pt]
$if(affiliation)${\itshape\color{faint}\small $affiliation$}\\[2pt]$endif$
$if(date)${\itshape\color{faint}\small $date$}\\[14pt]$endif$
\end{center}
$if(abstract)$
\begin{minipage}{\textwidth}
{\color{accent}\rule{\textwidth}{0.6pt}}\\[4pt]
{\small\hspace{1em}\textbf{\scshape\color{deep}Abstract.\ }$abstract$}\\[4pt]
{\color{accent}\rule{\textwidth}{0.6pt}}\\[3pt]
$if(keywords)${\itshape\footnotesize\color{faint}\textbf{\upshape\scshape\color{deep}Keywords\ }\ $keywords$}\\[12pt]$else$\\[10pt]$endif$
\end{minipage}
$endif$
}]
\thispagestyle{fancy}
$body$
\end{document}
```

## III·M.9 · The Math Journal Build Engine

The complete build. Save as `build_mathjournal.py` beside the source and the template. It converts the Markdown to LaTeX through the template, compiles twice so cross-references and the reference list resolve, reports the page count, and fails loudly with the TeX error rather than emitting a silent partial PDF.

```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Math Journal edition build. Markdown -> LaTeX -> PDF.

Usage: build_mathjournal.py source.md /mnt/user-data/outputs/paper.pdf
Requires: pandoc, pdflatex. Template mathjournal.tex must sit beside the source.
"""
import os, re, sys, shutil, subprocess, tempfile

def die(msg, log=""):
    print("BUILD FAILED:", msg)
    if log:
        # surface the first real TeX error, not the whole transcript
        for m in re.findall(r"^!.*(?:\n.*){0,4}", log, re.M)[:3]:
            print(m)
    sys.exit(1)

def main():
    if len(sys.argv) < 3:
        die("usage: build_mathjournal.py source.md out.pdf")
    src, out = os.path.abspath(sys.argv[1]), os.path.abspath(sys.argv[2])
    srcdir = os.path.dirname(src)
    tpl = os.path.join(srcdir, "mathjournal.tex")
    for tool in ("pandoc", "pdflatex"):
        if not shutil.which(tool):
            die(f"{tool} not on PATH")
    if not os.path.exists(tpl):
        die("mathjournal.tex template not found beside the source")

    work = tempfile.mkdtemp(prefix="mathjournal_")
    tex = os.path.join(work, "paper.tex")
    p = subprocess.run(["pandoc", src, "-o", tex, "--template", tpl,
                        "--standalone", "--resource-path", srcdir],
                       capture_output=True, text=True)
    if p.returncode != 0:
        die("pandoc conversion failed", p.stderr)

    # two passes so \cite and cross-references resolve
    for _ in range(2):
        p = subprocess.run(["pdflatex", "-interaction=nonstopmode",
                            "-halt-on-error", "paper.tex"],
                           cwd=work, capture_output=True, text=True)
    pdf = os.path.join(work, "paper.pdf")
    if not os.path.exists(pdf):
        die("pdflatex produced no PDF", p.stdout)

    os.makedirs(os.path.dirname(out), exist_ok=True)
    shutil.copy2(pdf, out)
    shutil.copy2(tex, os.path.splitext(out)[0] + ".tex")  # ship the source
    try:
        from pypdf import PdfReader
        n = len(PdfReader(out).pages)
        print(f"RESULT: {out} ({n} pages), .tex beside it")
    except Exception:
        print(f"RESULT: {out}, .tex beside it")

if __name__ == "__main__":
    main()
```

## III·M.10 · Pre-Flight and Gate Integration

The Journal's pre-flight of III·J.11 holds, with three additions the LaTeX route requires. Compile-clean: the build must exit with a PDF and no fatal TeX error; a partial or missing PDF is a hard failure and is never presented. Overfull-quiet: the transcript is scanned for overfull boxes and any overfull line is repaired at the source, since an overfull box in a two-column measure prints as text running into the gutter. Math-verified: every displayed equation carrying a numerical claim is checked against the paper's own reproduced figures at the stated seed, the Fidelity Lock applying to a typeset equation exactly as to a prose claim, and a coefficient that the body computes and the display contradicts is a failure that repairs the source before delivery. The em-dash lock, the warrant-typing pass, the reference resolution check, and the Module VIII LINE-weight injection all run unchanged.

## III·M Quick Reference Card

Edition selector: `[EDITION:MATH_JOURNAL]`, `[FORMAT:MATH_PDF]`, front-matter `edition: math_journal`, or the words math journal, math pdf, math paper, equation paper. Never co-fires with III·J, III, III·S, or V.
Purpose: the Journal page for equation-dense work. Every Journal rule holds; only the renderer changes, Markdown to LaTeX to PDF instead of Markdown to HTML to PDF.
Route test: a paper carrying contracted index pairs, stacked fractions inside sized brackets, order-labelled operators like `G^{(2)}_{\mu\nu}`, or accented tensor averages belongs here; a prose-dominant paper belongs in III·J.
Three scoped exceptions, and they do not propagate: the no-LaTeX universal lock is lifted here and nowhere else; EB Garamond gives way to a math-companion serif (Palatino via `mathpazo`) because EB Garamond ships no math face; the intermediate is LaTeX rather than HTML.
Type and page: serif throughout, 10 pt default on US Letter, two justified columns at a 0.28 inch gutter, 0.85 inch margins.
Accent: copper `B87333` by default via front-matter `accenthex`, restrained to the title rules, section heads, box tops, and running foot.
Title block: spanning accent-ruled block, small-caps title, article type in accent caps, optional goal line, author and affiliation, then a full-measure abstract bounded by accent rules with an optional keywords line.
Mathematics: authored as LaTeX, `$...$` inline and `$$...$$` display, full `amsmath` available. Do not hand-approximate in Unicode.
Objects: `jbox` for boxes, Markdown pipe tables set with `booktabs`, `graphicx` figures. Column width by default; starred floats span.
The `longtable` shim in the template is load-bearing. Pandoc emits `longtable` for every pipe table and `longtable` cannot run in a two-column body; removing the shim is a fatal compile failure, not a cosmetic one.
References: `thebibliography` with `\bibitem` and `\cite` by default; BibTeX or `biblatex` when a venue demands a style.
Disclosure: Module VIII fires at LINE weight, the Journal default, with the master reference injected into References.
Build: `python3 build_mathjournal.py source.md /mnt/user-data/outputs/{slug}.pdf`, template `mathjournal.tex` beside the source, two pdflatex passes, the `.tex` shipped beside the PDF as the reproducible source.
Pre-flight adds compile-clean, overfull-quiet, and math-verified to the Journal sequence.
Locks that still hold: no em-dashes; ﷺ as one glyph; no emoji; warrant tier on every claim-bearing object; faithful map, never inflation; column-width default with opt-in spanning.

---

# MODULE III·S · THE SCRIPTURE EDITION

The scripture register, journal-grade. Module III·J renders the two-column journal paper; the Scripture edition is its multi-script Quranic descendant, tuned for verse-by-verse translation and tafseer. It holds the Journal's two-column grid, masthead, running heads, and tinted box discipline, and adds three things the Journal has no need of: a combined Latin-Arabic-Bengali font stack the engine resolves per glyph, the right-to-left word grid re-rendered as flowing interlinear word-cells that fit a narrow column, and a scripture title block carrying the surah head, the basmala, and the servant's byline. It is the PDF delivery for scripture. Selected by the token `[EDITION:SCRIPTURE]` or front-matter `edition: scripture`, and by the standing scripture words scripture pdf, tafsir pdf, quran pdf, mushaf pdf. It never co-fires with the other renderers.

## III·S.0 · The Design Read

A scripture page at journal grade is two-column like the Journal, not single-column, and it carries the same restraint: serif throughout, an accent that touches only the furniture, a masthead band, and quiet running heads. Eight elements carry it. First, the type is serif throughout, EB Garamond for Latin, Amiri for Arabic, Noto Serif Bengali for Bengali, set as one combined stack so each glyph resolves to its own face with no per-cell targeting. Second, the page opens with a masthead: a two-tone wordmark on the left, the edition type with the surah meta and reference in accent on the right, and a thick accent rule closing the band. Third, the title block spans the full measure and is centred: the surah name in Arabic, the English title beneath, an accent-italic subtitle, the author line, and the basmala, with an optional bold surah-overview band ruled off above and below. Fourth, the body breaks into two justified columns. Fifth, each verse opens with its reference marker and the word grid, rendered not as a wide table but as a row of interlinear word-cells, each cell an Arabic word over its transliteration over its root meaning, flowing right-to-left and wrapping inside the column. Sixth, the eight components follow as a labelled ladder, and a noteworthy geometric reading or deep-dive synthesis is lifted into a tinted text box with an accent top rule, a Geometric Insight or Deep Dive panel. Seventh, a genuine summary matrix sets as a tinted-header table. Eighth, the running furniture is quiet: the wordmark and the surah reference in small accent caps at the top of every continuation page, the servant's byline and the page number at the foot. The accent is copper, the house scripture signature.

Two further structures complete the edition. The surah is framed the way a scholarly mushaf frames a chapter: a brief introduction opens it as a full-measure band ruled above and below, thematic section headers with short overviews divide the body where the surah is long enough to carry more than one theme, and a closing synthesis of the core message seals it as a full-measure tinted panel at the end. And the body sets two-column by default, the journal-grade register, or single-column on request, the Apex Pristine register for scripture; the same content and the same frame render in either measure, selected by a single front-matter switch.

## III·S.1 · The Locked Contract

Serif throughout, EB Garamond for Latin at 9.4 points on a 1.42 measure, Amiri for Arabic, Noto Serif Bengali for Bengali, set as one stack so the engine falls per glyph to the right face. Page geometry is US Letter, 612 by 792 points, margins 60 by 56 by 60, a two-column body at a 20-point gutter with a hairline column rule. The body sets two-column by default; front-matter `columns: 1` renders the single-column Apex Pristine register for scripture, widening the measure and enlarging the word-cells while keeping every other lock, the frame, the word grid, the boxes, the masthead, and the multi-script stack, unchanged. The accent is copper by default and touches only the masthead, the rules, the verse markers, the box tops and labels, the table caption bars, and the word-cell meaning row; the body is black on white. The universal locks hold without exception: no LaTeX and all mathematics in Unicode, no em-dashes, honorifics and the ayah marker as single glyphs, no emoji. The word grid is borderless, rendered as interlinear cells, never a ruled table.

## III·S.2 · The Masthead, Title Block, and Author Line

Front matter sets the article. `wordmark` is the masthead's left lockup, the first word light and the rest bold, defaulting to Geometric Quran; `article_type` is the right-hand edition line, defaulting to Geometric Analysis; `surah_meta` and `reference` are the two lines beneath it. The centred title block carries `surah_ar` the Arabic surah name large in Amiri, `title` the English name in bold serif, `subtitle` in accent italic, `author_line`, and `basmala` in Amiri beneath. The author line defaults to the scripture byline, Source Text: Arabic Quran Text · Translation and Synthesis by: A Humble Servant | Fellow Witness, and is overridden in front matter when a different attribution is wanted. An optional `:::abstract` block sets a bold surah-overview band, and `:::keywords` a small key-term line. The running heads are set by `running_left` and `running_right`, defaulting to the wordmark and the reference, and the foot by `footer`, defaulting to the byline; all three are injected as literal strings to sidestep the engine's named-string running-header bug. The masthead and title block are suppressed from the running header on the first page; the wordmark and reference are lifted into the top margin on every page thereafter.

## III·S.3 · The Word Grid as Interlinear Cells

The translation protocol emits each verse's opening as a borderless right-to-left word grid, an HTML table set `dir="rtl"` with three rows, Arabic, transliteration, and root meaning, written in one shared reading order. A wide table cannot live in a narrow journal column, so the engine does not render it as a table. It parses the three rows and re-emits the verse as a row of interlinear word-cells, one cell per word, each cell stacking the Arabic word over its transliteration over its root meaning, centred, flowing right-to-left inside a `dir="rtl"` container and wrapping to as many lines as the column needs. Read right to left, the top of the cells is the connected ayah; beneath each word sits its gloss. The Arabic sets in Amiri at cell size, the transliteration in the combined stack at reading size, the meaning in the sans accent. This is the column-fit form of the grid, and it is what makes the two-column scripture page work. The protocol is unchanged; the transform is the engine's.

## III·S.3a · The Surah Frame: Introduction, Thematic Sections, and Closing Synthesis

The translation protocol frames every full surah, its Section II.3c, and the edition renders the frame as full-measure structural furniture set apart from the verse readings. Three directives carry it, each spanning both columns. The surah introduction is a `:::intro` block, rendered as a full-measure band ruled above and below, a brief scholarly orientation, the surah's name and meaning, its number and setting, and the arc the reading traces, set before the first verse. A thematic section is a `:::theme Headline · verse: X-Y` block, rendered as a full-measure section header, the headline in accent-ruled sans with its ayah range, the range written as `verse: N` for a single verse and `verse: N-M` for a span, never abbreviated and beneath it the short overview in serif italic, placed before the verses of the block; a long surah is divided into as many sections as it carries, and a short single-theme surah carries none. The closing synthesis is a `:::closing` block, rendered as a full-measure tinted panel under a Closing Synthesis label, gathering the surah's core message at the end, after the last verse and after any deep-dive box. The frame directives span the full measure in both layouts, dividing the two-column body cleanly and setting off the single-column body the same way. The introduction and the closing are written for every surah; the thematic headers appear only where the surah holds more than one theme, exactly as the protocol gates them.

## III·S.4 · Text Boxes, the Component Ladder, Honorifics, and Apparatus

The eight numbered components render as the protocol emits them, the bold label leading each. A noteworthy geometric reading or a deep-dive synthesis is lifted out of the prose flow into a tinted text box: the source wraps it in a box directive, `:::insight Title` for a Geometric Insight panel, `:::deepdive Title` for a Deep Dive panel, `:::synthesis Title` or a bare `:::box Title` for a general panel, each rendered as a copper-topped tint with the label in accent caps. A box spans both columns with the star form, `:::insight* Title`. Honorifics ﷺ and ﷻ and the prophetic AS, and the ayah-end marker ۝, are preserved as glyphs in the Arabic face. This edition runs Module IX at `REGISTER:DEVOTIONAL`, which is a bounded allowance and not an exemption. The standard traditional furniture the form demands transits from the closed list of IX.3, the basmala at the head, the hamdala where the piece opens on praise, the ta'awwudh where a recitation-facing piece requires it, the honorific and ayah glyphs, the fixed salawat glyph, and the scripture byline, each once and each at its stated structural position, never woven into a component reading. Everything outside that list does not transit, and Class D content, personal invocation composed by the author, supplication, benediction over the reader, statements of the author's own devotional state, and any apophatic interior material that surfaced during a capture or stress-test pass, is barred here exactly as at the secular register. A genuine summary matrix written as a Markdown table, optionally captioned with `Table: Table N | title`, sets with a tinted header and a hairline body. A concordance list or the optional audit ledger sets in a copper-ruled monospace block. Anchors, the in-tradition synthesis, and the comparative deep dive read as ordinary prose unless boxed. The silent-omission discipline holds: nothing empty is printed.

## III·S.5 · The Scripture Stylesheet

The complete validated stylesheet. Self-contained, compiles under WeasyPrint as written. Save as `scripture.css` beside the source. The combined font stack lets the engine fall per glyph to Amiri for Arabic and Noto Serif Bengali for Bengali, with EB Garamond carrying Latin.

```css
/* ===================================================================
   SCRIPTURE  ·  two-column journal-grade multi-script Quranic edition
   EB Garamond (Latin) · Amiri (Arabic) · Noto Serif Bengali (Bengali)
   masthead + running heads · centred surah head + basmala · two-column
   body · interlinear word-cells (column-fit) · Geometric-Insight and
   Deep-Dive text boxes · tinted summary tables · copper accent
   (WeasyPrint-validated)
   =================================================================== */
:root{
  --serif:'EBGaramond','EB Garamond','Liberation Serif','Noto Serif',serif;
  --arabic:'Amiri','Scheherazade New','Noto Naskh Arabic',serif;
  --bengali:'Noto Serif Bengali','Noto Sans Bengali',serif;
  --multi:'EBGaramond','Amiri','Noto Serif Bengali','Liberation Serif',serif;
  --sans:'Archivo','Liberation Sans','Noto Sans','DejaVu Sans',sans-serif;
  --ink:#1f1b16; --soft:#4a423a; --faint:#7a6f63; --rule:#d2c4b0;
  --accent:#B87333; --deep:#8a5523; --tint:#FAF3EA; --band:#EFE0CF;
}
.acc-copper {--accent:#B87333;--deep:#8a5523;--tint:#FAF3EA;--band:#EFE0CF;}
.acc-crimson{--accent:#A0182B;--deep:#74111F;--tint:#FBEDEF;--band:#F4DEE2;}
.acc-slate  {--accent:#2C3E50;--deep:#1b2733;--tint:#ECEFF2;--band:#D8DEE4;}
.acc-navy   {--accent:#1F3A66;--deep:#142845;--tint:#EAEEF5;--band:#D3DCEA;}
.acc-forest {--accent:#1F5C3D;--deep:#143f29;--tint:#E9F2EC;--band:#D2E5D9;}
.acc-plum   {--accent:#5E2A5E;--deep:#411d41;--tint:#F2ECF2;--band:#E2D2E2;}

/* ---------------- page furniture ---------------- */
@page{
  size:612pt 792pt; margin:60pt 56pt 60pt 56pt;
  @top-left{ content:string(jtype); font-family:var(--sans); font-size:7.4pt; font-weight:700;
    color:var(--deep); text-transform:uppercase; letter-spacing:.09em; vertical-align:bottom; padding-bottom:4pt; }
  @top-right{ content:string(jname); font-family:var(--sans); font-size:7.4pt; font-weight:700;
    color:var(--deep); text-transform:uppercase; letter-spacing:.07em; vertical-align:bottom; padding-bottom:4pt; }
  @bottom-left{ content:string(jfoot); font-family:var(--serif); font-size:7.3pt; color:var(--faint);
    vertical-align:top; padding-top:5pt; }
  @bottom-right{ content:counter(page); font-family:var(--sans); font-size:8.4pt; font-weight:700;
    color:var(--deep); vertical-align:top; padding-top:5pt; }
}
@page:first{ @top-left{content:none} @top-right{content:none} }

html{ font-family:var(--multi); font-size:9.4pt; color:var(--ink); line-height:1.42; }
body{ margin:0; }
p{ margin:0 0 5.5pt; text-align:justify; hyphens:auto; orphans:2; widows:2; }
strong,b{ font-weight:700; color:var(--ink); } em,i{ font-style:italic; }
a,.xref{ color:var(--accent); text-decoration:none; }
sup{ font-size:.66em; line-height:0; vertical-align:super; } sub{ font-size:.66em; line-height:0; vertical-align:sub; }
ul,ol{ margin:3pt 0 6pt 13pt; padding:0; } li{ margin:0 0 3pt; }
ul{ list-style:none; } ul>li::before{ content:"\2022\00A0"; color:var(--accent); margin-left:-11pt; }
code{ font-family:'DejaVu Sans Mono',monospace; font-size:.9em; }

.smeta{ position:absolute; left:-9999pt; top:0; height:0; overflow:hidden; }
.jnameRaw{ string-set:jname content(); } .jtypeRaw{ string-set:jtype content(); } .jfootRaw{ string-set:jfoot content(); }

/* ---------------- masthead (full width) ---------------- */
.masthead{ display:flex; align-items:flex-end; justify-content:space-between;
  border-bottom:2.4pt solid var(--accent); padding-bottom:5pt; margin:0 0 12pt; }
.masthead .mark{ font-family:var(--serif); font-weight:800; font-size:19pt; line-height:.9; color:var(--ink); letter-spacing:-.01em; }
.masthead .mark .lite{ font-weight:400; }
.masthead .right{ text-align:right; flex-shrink:1; min-width:0; max-width:64%; }
.masthead .atype{ font-family:var(--sans); font-weight:800; font-size:10.5pt; color:var(--accent);
  text-transform:uppercase; letter-spacing:.04em; white-space:nowrap; }
.masthead .agoal{ font-family:var(--sans); font-weight:600; font-size:7.4pt; color:var(--accent);
  text-transform:uppercase; letter-spacing:.02em; margin-top:1.5pt; white-space:nowrap; }
.masthead .doi{ font-family:var(--sans); font-size:6.8pt; color:var(--faint); margin-top:2pt; white-space:nowrap; }
/* masthead brevity net (III·J.2): the engine tags an over-long line .t1 or .t2 and
   the type steps down rather than crowding the wordmark. The cap is the fix. */
.masthead .atype.t1{ font-size:9.6pt; }
.masthead .atype.t2{ font-size:8.4pt; letter-spacing:.02em; }
.masthead .agoal.t1{ font-size:7pt; }
.masthead .agoal.t2{ font-size:6.4pt; letter-spacing:.01em; }
.masthead .doi.t1{ font-size:6.2pt; }
.masthead .doi.t2{ font-size:5.8pt; }

/* ---------------- title block (full width, centred) ---------------- */
.titleblock{ text-align:center; margin:0 0 13pt; }
.titleblock .surah-ar{ font-family:var(--arabic); font-size:27pt; line-height:1.22; color:var(--ink); margin:0 0 5pt; }
.titleblock h1.jtitle{ font-family:var(--serif); font-weight:800; font-size:21pt; line-height:1.08; color:var(--ink); margin:0 0 4pt; letter-spacing:-.005em; }
.titleblock .jsubtitle{ font-family:var(--serif); font-weight:500; font-style:italic; font-size:12pt; line-height:1.25; color:var(--accent); margin:0 0 7pt; }
.titleblock .authors{ font-family:var(--serif); font-size:10pt; line-height:1.4; color:var(--soft); margin:0 0 6pt; }
.titleblock .authors sup{ color:var(--accent); font-weight:700; }
.titleblock .basmala{ font-family:var(--arabic); font-size:16pt; color:var(--deep); margin:7pt 0 0; }
.titleblock .abstract{ font-family:var(--serif); font-weight:600; font-size:9.6pt; line-height:1.4; color:var(--ink);
  text-align:justify; border-top:0.8pt solid var(--rule); border-bottom:0.8pt solid var(--rule); padding:8pt 0; margin:10pt 0 0; }
.titleblock .kwline{ font-family:var(--sans); font-size:7.6pt; color:var(--soft); margin:6pt 0 0; }
.titleblock .kwline .lab{ font-weight:800; color:var(--deep); text-transform:uppercase; letter-spacing:.04em; }

/* ---------------- two-column body ---------------- */
.cols{ column-count:2; column-gap:20pt; column-rule:0.4pt solid #e6ddd0; }

/* ---------------- verse marker / sub-head ---------------- */
h2{ font-family:var(--sans); font-weight:800; font-size:10.6pt; color:var(--accent);
  margin:12pt 0 5pt; line-height:1.18; break-after:avoid; }
h2:first-of-type{ margin-top:0; }
h2 .num{ color:var(--accent); margin-right:5pt; }
h3{ font-family:var(--sans); font-weight:700; font-size:9pt; color:var(--deep); margin:7pt 0 3pt; break-after:avoid; }
h4{ font-family:var(--serif); font-weight:800; font-style:italic; font-size:9pt; color:var(--ink); margin:6pt 0 2pt; break-after:avoid; }

/* ---------------- word grid -> flowing interlinear cells (column-fit) ---------------- */
.wgrid{ margin:3pt 0 9pt; text-align:center; line-height:1.0; }
.wcell{ display:inline-block; vertical-align:top; text-align:center; margin:0 4.5pt 6pt; }
.wcell .war{ display:block; font-family:var(--arabic); font-size:15.5pt; line-height:1.5; color:var(--ink); }
.wcell .wtr{ display:block; font-family:var(--multi); font-size:7.1pt; line-height:1.18; color:var(--soft); margin-top:1.5pt; }
.wcell .wme{ display:block; font-family:var(--sans); font-size:6.5pt; line-height:1.14; color:var(--accent); margin-top:1pt; max-width:78pt; }

/* ---------------- box (Geometric Insight / Deep Dive) ---------------- */
.jbox{ break-inside:avoid; background:var(--tint); border-top:2pt solid var(--accent);
  padding:6pt 8pt 7pt; margin:8pt 0; box-decoration-break:clone; }
.jbox .jbh{ font-family:var(--sans); font-weight:800; font-size:8.6pt; color:var(--deep); margin:0 0 4pt; break-after:avoid; }
.jbox .jbh .lab{ color:var(--accent); text-transform:uppercase; letter-spacing:.04em; }
.jbox p{ font-size:8.3pt; text-align:justify; margin:0 0 4pt; }
.jbox ul{ margin:2pt 0 0 12pt; } .jbox ul>li::before{ color:var(--accent); }
.jbox table{ width:100%; border-collapse:collapse; font-size:7.7pt; margin:2pt 0; }
.jbox thead th{ text-align:left; font-weight:800; color:var(--deep); border-bottom:1pt solid var(--accent); padding:2.5pt 4pt; }
.jbox tbody td{ padding:2.5pt 4pt; border-bottom:0.4pt solid var(--rule); vertical-align:top; }
.jspan{ column-span:all; break-inside:avoid; }

/* ---------------- generic table (summary matrix) ---------------- */
.jtable{ margin:8pt 0; break-inside:avoid; }
.jtable .tcap{ font-family:var(--sans); font-weight:800; font-size:8.2pt; color:#fff; background:var(--accent); padding:3pt 6pt; }
.jtable .tcap .lab{ color:#fff; }
.jtable table{ width:100%; border-collapse:collapse; font-family:var(--serif); font-size:7.9pt; }
.jtable thead th{ background:var(--band); color:var(--deep); text-align:left; font-weight:800;
  padding:3pt 5pt; border-bottom:1pt solid var(--accent); font-family:var(--sans); font-size:7.5pt; }
.jtable tbody td{ padding:3pt 5pt; border-bottom:0.4pt solid var(--rule); vertical-align:top; }
.jtable tbody tr:nth-child(even) td{ background:#faf6ef; }
.jtable .tnote{ font-family:var(--serif); font-size:7pt; color:var(--soft); padding:3pt 1pt 0; }
.jtable.span{ column-span:all; }
.jtable thead{ display:table-header-group; }

/* ---------------- preformatted (concordance list, audit ledger) ---------------- */
pre{ background:#faf6ef; border-left:2.2pt solid var(--accent); padding:6pt 9pt;
  font-family:'DejaVu Sans Mono',monospace; font-size:7.6pt; line-height:1.32; white-space:pre-wrap; overflow-wrap:break-word; margin:7pt 0; }
blockquote{ border-left:2.2pt solid var(--accent); background:var(--tint); padding:5pt 10pt; margin:7pt 0; color:var(--soft); }
blockquote p{ margin:0 0 3pt; }

/* ---------------- surah frame: introduction, theme sections, closing ---------------- */
.surah-intro{ column-span:all; break-inside:avoid; margin:0 0 12pt;
  border-top:0.8pt solid var(--rule); border-bottom:0.8pt solid var(--rule); padding:9pt 0; }
.surah-intro p{ font-family:var(--serif); font-size:10pt; line-height:1.46; text-align:justify; margin:0 0 5pt; color:var(--soft); }
.surah-intro p:last-child{ margin-bottom:0; }

.theme-head{ column-span:all; break-inside:avoid; break-after:avoid; margin:13pt 0 8pt; }
.theme-head .theme-title{ font-family:var(--sans); font-weight:800; font-size:12pt; color:var(--deep);
  letter-spacing:.01em; padding-bottom:3pt; border-bottom:1.6pt solid var(--accent); margin:0 0 5pt; }
.theme-head p{ font-family:var(--serif); font-style:italic; font-size:9.4pt; line-height:1.4; color:var(--soft); text-align:justify; margin:0 0 3pt; }
.theme-head p:last-child{ margin-bottom:0; }

.closing{ column-span:all; break-inside:avoid; margin:13pt 0 0; background:var(--tint);
  border-top:2.4pt solid var(--accent); padding:9pt 12pt 10pt; }
.closing .closing-title{ font-family:var(--sans); font-weight:800; font-size:11pt; color:var(--deep);
  text-transform:uppercase; letter-spacing:.05em; margin:0 0 5pt; }
.closing p{ font-family:var(--serif); font-size:9.6pt; line-height:1.45; text-align:justify; margin:0 0 5pt; color:var(--ink); }
.closing p:last-child{ margin-bottom:0; }

/* ---------------- single-column (Apex Pristine) scripture ---------------- */
.col1 .cols{ column-count:1; column-rule:none; }
.col1{ font-size:10.2pt; }
.col1 .wcell .war{ font-size:17pt; }
.col1 .wcell .wtr{ font-size:7.8pt; } .col1 .wcell .wme{ font-size:7.2pt; max-width:120pt; }
.col1 .jbox p, .col1 .closing p, .col1 .surah-intro p, .col1 .theme-head p{ font-size:9.8pt; }
.col1 h2{ font-size:12pt; }
```

## III·S.6 · The Scripture Build Engine

The scripture-aware engine, built on the Journal engine. It parses the front matter into the masthead and the centred title block, opens the two-column body, transforms each emitted right-to-left word grid into flowing interlinear cells, renders the verse markers and the eight components, lifts box directives into Geometric Insight and Deep Dive panels, sets summary matrices as captioned tables, and injects the running heads as literal strings. Save as `build_scripture.py`. Build with `python3 build_scripture.py source.md /mnt/user-data/outputs/{slug}.pdf`, the base URL the source directory, then inspect the render: confirm the masthead and ruled overview band, the centred Arabic surah head and basmala, the author line, the two-column body, the interlinear word-cells with each transliteration and meaning stacked under its word, the copper verse markers, the Geometric Insight and Deep Dive boxes, and the running heads on page two. Present the PDF and keep the Markdown source as master.

```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
SCRIPTURE build engine (journal-grade, two-column, multi-script).
Compiles one Markdown source to a serif two-column Quranic PDF via WeasyPrint:
accent masthead + running heads, centred surah head with basmala, a scripture
author line, two-column verse-by-verse body, the protocol's right-to-left word
grid re-rendered as flowing interlinear word-cells that fit a narrow column,
Geometric-Insight and Deep-Dive text boxes, and tinted summary tables.

EB Garamond (Latin), Amiri (Arabic), and Noto Serif Bengali (Bengali) are set
as one combined stack; Pango resolves each glyph to its own face.

Usage:  python3 build_scripture.py source.md [out.pdf]
Source dir must contain scripture.css.
"""
import sys, re, html, pathlib

ACCENTS={'crimson','copper','slate','navy','forest','plum'}
BOX_LABELS={'insight':'Geometric Insight','deepdive':'Deep Dive','synthesis':'Synthesis',
            'note':'Note','box':None}

# --- masthead brevity law (III·J.2), shared with the Journal edition ----------
MH_CAPS = {'atype': 30, 'goal': 44, 'doi': 36}

def mh_fit(s, key):
    """Step-down class for an over-long masthead line, with a build-time warning."""
    cap = MH_CAPS[key]; n = len(s or '')
    if n <= cap: return ''
    step = ' t1' if n <= cap * 1.25 else ' t2'
    sys.stderr.write(f"[masthead] {key} is {n} chars, cap {cap}; stepped down"
                     f" ({step.strip()}). Shorten it in the front matter: {s!r}\n")
    return step

def css_str(s):
    return s.replace('\\','\\\\').replace('"','\\"')

def parse_front(text):
    fm={}; m=re.match(r'^---\s*\n(.*?)\n---\s*\n',text,re.S); body=text
    if m:
        for line in m.group(1).splitlines():
            if ':' in line: k,v=line.split(':',1); fm[k.strip()]=v.strip()
        body=text[m.end():]
    return fm, body

def inline(s):
    s=html.escape(s, quote=False)
    s=re.sub(r'\[\[(.+?)\]\]', r'<span class="xref">\1</span>', s)
    s=re.sub(r'\*\*(.+?)\*\*', r'<strong>\1</strong>', s)
    s=re.sub(r'(?<!\*)\*(?!\*)(.+?)(?<!\*)\*(?!\*)', r'<em>\1</em>', s)
    s=re.sub(r'`(.+?)`', r'<code>\1</code>', s)
    s=re.sub(r'\^(.+?)\^', r'<sup>\1</sup>', s)
    s=re.sub(r'(?<!~)~(?!~)(.+?)(?<!~)~(?!~)', r'<sub>\1</sub>', s)
    return s

def render_blocks(lines):
    out=[]; i=0; n=len(lines)
    while i<n:
        ln=lines[i]
        if not ln.strip(): i+=1; continue
        if re.match(r'^\s*[-*\u2022]\s+', ln):
            items=[]
            while i<n and re.match(r'^\s*[-*\u2022]\s+', lines[i]):
                items.append(inline(re.sub(r'^\s*[-*\u2022]\s+','',lines[i]).rstrip())); i+=1
            out.append('<ul>'+''.join(f'<li>{x}</li>' for x in items)+'</ul>'); continue
        if re.match(r'^\s*\d+\.\s+', ln):
            items=[]
            while i<n and re.match(r'^\s*\d+\.\s+', lines[i]):
                items.append(inline(re.sub(r'^\s*\d+\.\s+','',lines[i]).rstrip())); i+=1
            out.append('<ol>'+''.join(f'<li>{x}</li>' for x in items)+'</ol>'); continue
        buf=[ln.rstrip()]; i+=1
        while i<n and lines[i].strip() and not re.match(r'^\s*([-*\u2022]|\d+\.)\s+', lines[i]) \
              and not lines[i].startswith(':::'):
            buf.append(lines[i].rstrip()); i+=1
        out.append('<p>'+inline(' '.join(buf))+'</p>')
    return ''.join(out)

def render_table_rows(tbl_lines):
    rows=[r for r in tbl_lines if r.strip()]
    cells=[[c.strip() for c in re.split(r'(?<!\\)\|', r.strip().strip('|'))] for r in rows]
    body=[c for c in cells if not all(re.fullmatch(r':?-{2,}:?', x or '-') for x in c)]
    head=body[0] if body else []; data=body[1:] if len(body)>1 else []
    h='<thead><tr>'+''.join(f'<th>{inline(x)}</th>' for x in head)+'</tr></thead>'
    b='<tbody>'+''.join('<tr>'+''.join(f'<td>{inline(x)}</td>' for x in r)+'</tr>' for r in data)+'</tbody>'
    return h+b

def render_table(tbl_lines, caption=None, note=None, span=False):
    cap=''
    if caption:
        m=re.match(r'^(Table\s+[\w.]+)\s*[|:]\s*(.+)$', caption)
        if m: cap=f'<div class="tcap"><span class="lab">{inline(m.group(1))} | </span>{inline(m.group(2))}</div>'
        else: cap=f'<div class="tcap">{inline(caption)}</div>'
    nt=f'<div class="tnote">{inline(note)}</div>' if note else ''
    sp=' span' if span else ''
    return f'<div class="jtable{sp}">{cap}<table>{render_table_rows(tbl_lines)}</table>{nt}</div>'

def render_wordgrid(tbl_html):
    """The protocol's <table dir=rtl> 3-row word grid -> flowing interlinear cells."""
    rows=re.findall(r'<tr[^>]*>(.*?)</tr>', tbl_html, re.S|re.I)
    grid=[[c.strip() for c in re.findall(r'<t[dh][^>]*>(.*?)</t[dh]>', r, re.S|re.I)] for r in rows]
    grid=[row for row in grid if row]
    if not grid: return ''
    ncol=max(len(r) for r in grid)
    ar=grid[0] if len(grid)>0 else []
    tr=grid[1] if len(grid)>1 else []
    me=grid[2] if len(grid)>2 else []
    cells=[]
    for i in range(ncol):
        a=html.escape(ar[i]) if i<len(ar) else ''
        t=html.escape(tr[i]) if i<len(tr) else ''
        m=html.escape(me[i]) if i<len(me) else ''
        cells.append(f'<span class="wcell"><span class="war">{a}</span>'
                     f'<span class="wtr">{t}</span><span class="wme">{m}</span></span>')
    return '<div class="wgrid" dir="rtl">'+''.join(cells)+'</div>'

def render_box(label, title, body_lines, span=False):
    has_table=any(l.lstrip().startswith('|') for l in body_lines)
    if has_table:
        i=0;n=len(body_lines);chunks=[]
        while i<n:
            if body_lines[i].lstrip().startswith('|'):
                tl=[]
                while i<n and body_lines[i].lstrip().startswith('|'): tl.append(body_lines[i]); i+=1
                chunks.append('<table>'+render_table_rows(tl)+'</table>')
            else:
                tx=[]
                while i<n and not body_lines[i].lstrip().startswith('|'): tx.append(body_lines[i]); i+=1
                if any(x.strip() for x in tx): chunks.append(render_blocks(tx))
        inner=''.join(chunks)
    else:
        inner=render_blocks(body_lines)
    lab_html=f'<span class="lab">{html.escape(label)} \u00b7 </span>' if label else ''
    cls=' jspan' if span else ''
    head=f'<div class="jbh">{lab_html}{inline(title)}</div>'
    return f'<div class="jbox{cls}">{head}{inner}</div>'

def build_html(fm, body, cssfiles):
    acc=fm.get('accent','copper').strip().lower()
    if acc not in ACCENTS: acc='copper'
    acccls='acc-'+acc
    if fm.get('columns','2').strip()=='1': acccls+=' col1'
    wordmark=fm.get('wordmark', fm.get('journal','Geometric Quran'))
    article_type=fm.get('article_type','Geometric Analysis')
    surah_meta=fm.get('surah_meta',''); reference=fm.get('reference','')
    surah_ar=fm.get('surah_ar',''); title=fm.get('title',''); subtitle=fm.get('subtitle','')
    authors=fm.get('author_line','Source Text: Arabic Quran Text \u00b7 Translation and Synthesis by: A Humble Servant | Fellow Witness')
    basmala=fm.get('basmala','')
    running_left=fm.get('running_left', wordmark)
    running_right=fm.get('running_right', reference or title)
    footer=fm.get('footer','A Humble Servant \u00b7 Fellow Witness')
    parts=wordmark.split()
    mark=(f'<span class="lite">{html.escape(parts[0])}</span> '+html.escape(' '.join(parts[1:]))) if len(parts)>1 else html.escape(wordmark)

    lines=body.splitlines(); i=0; n=len(lines)
    title_abs=''; title_kw=''; body_frag=[]; endmatter_html=['']; body_started=False; in_refs=False

    def open_body():
        nonlocal body_started
        if body_started: return ''
        body_started=True
        surahar_html=f'<div class="surah-ar">{html.escape(surah_ar)}</div>' if surah_ar else ''
        sub_html=f'<div class="jsubtitle">{inline(subtitle)}</div>' if subtitle else ''
        basmala_html=f'<div class="basmala">{html.escape(basmala)}</div>' if basmala else ''
        goal_html=f'<div class="agoal{mh_fit(surah_meta,"goal")}">{html.escape(surah_meta)}</div>' if surah_meta else ''
        doi_html=f'<div class="doi">{html.escape(reference)}</div>' if reference else ''
        block=(f'<div class="masthead"><div class="mark">{mark}</div>'
               f'<div class="right"><div class="atype{mh_fit(article_type,"atype")}">{html.escape(article_type)}</div>{goal_html}{doi_html}</div></div>'
               f'<div class="titleblock">{surahar_html}'
               f'<h1 class="jtitle">{inline(title)}</h1>{sub_html}'
               f'<div class="authors">{inline(authors)}</div>'
               f'{basmala_html}{title_abs}{title_kw}</div>')
        return block+'<div class="cols">'

    def emit(frag):
        nonlocal body_frag
        body_frag.append(frag)

    while i<n:
        ln=lines[i]
        # title-block / endmatter blocks
        msp=re.match(r'^:::\s*(affiliations|abstract|keywords|endmatter)\s*$', ln)
        if msp:
            kind=msp.group(1); j=i+1; bl=[]
            while j<n and lines[j].strip()!=':::': bl.append(lines[j]); j+=1
            if kind=='abstract':
                title_abs=f'<div class="abstract">{inline(" ".join(x.strip() for x in bl if x.strip()))}</div>'
            elif kind=='keywords':
                title_kw=f'<div class="kwline"><span class="lab">Keywords </span>{inline(" ".join(x.strip() for x in bl if x.strip()))}</div>'
            i=j+1; continue
        # box directive (insight / deepdive / synthesis / box / note)
        md=re.match(r'^:::\s*(\w+)(\*?)\s*(.*)$', ln)
        if md:
            if not body_started: emit(open_body())
            kind=md.group(1).lower(); bspan=md.group(2)=='*'; rest=md.group(3).strip()
            j=i+1; bl=[]
            while j<n and lines[j].strip()!=':::': bl.append(lines[j]); j+=1
            if kind=='intro':
                emit(f'<div class="surah-intro jspan">{render_blocks(bl)}</div>')
            elif kind=='theme':
                emit(f'<div class="theme-head jspan"><div class="theme-title">{inline(rest)}</div>{render_blocks(bl)}</div>')
            elif kind=='closing':
                ttl=inline(rest) if rest else 'Closing Synthesis'
                emit(f'<div class="closing jspan"><div class="closing-title">{ttl}</div>{render_blocks(bl)}</div>')
            else:
                label=BOX_LABELS.get(kind, kind.title())
                emit(render_box(label, rest, bl, span=bspan))
            i=j+1; continue
        # raw RTL word grid -> interlinear cells
        if re.match(r'^\s*<table\b', ln, re.I):
            if not body_started: emit(open_body())
            blk=[lines[i]]; has_close='</table>' in lines[i]; j=i+1
            while j<n and not has_close:
                blk.append(lines[j]); has_close='</table>' in lines[j]; j+=1
            emit(render_wordgrid('\n'.join(blk))); i=j; continue
        # captioned markdown table (summary matrix)
        cap=None; tspan=False; mcapt=re.match(r'^Table(\*?):\s*(.+)$', ln); look=i
        if mcapt: tspan=mcapt.group(1)=='*'; cap=mcapt.group(2).strip(); look=i+1
        if look<n and lines[look].lstrip().startswith('|'):
            if not body_started: emit(open_body())
            tl=[]; k=look
            while k<n and lines[k].lstrip().startswith('|'): tl.append(lines[k]); k+=1
            note=None
            if k<n and re.match(r'^Note:\s*(.+)$', lines[k]):
                note=re.match(r'^Note:\s*(.+)$', lines[k]).group(1).strip(); k+=1
            emit(render_table(tl, cap, note, span=tspan)); i=k; continue
        # headings (verse markers, sub-heads)
        mh=re.match(r'^(#{1,4})\s+(.+)$', ln)
        if mh:
            if not body_started: emit(open_body())
            lvl=len(mh.group(1)); t=mh.group(2).strip()
            if lvl==1: lvl=2
            if re.match(r'^(references|bibliography)$', t, re.I):
                in_refs=True; emit(f'<h2 class="refhead">{inline(t)}</h2>'); i+=1; continue
            in_refs=False
            mnum=re.match(r'^(\d+(?:\.\d+)*)\s+(.+)$', t); tag=f'h{lvl}'
            if mnum: emit(f'<{tag}><span class="num">{mnum.group(1)}</span>{inline(mnum.group(2))}</{tag}>')
            else:    emit(f'<{tag}>{inline(t)}</{tag}>')
            i+=1; continue
        # ordinary block (no drop cap in scripture)
        if not ln.strip(): i+=1; continue
        if not body_started: emit(open_body())
        buf=[ln]; i+=1
        while i<n and lines[i].strip() and not lines[i].startswith(':::') and not re.match(r'^#', lines[i]) \
              and not lines[i].lstrip().startswith('|') and not re.match(r'^\s*<table\b', lines[i], re.I) \
              and not re.match(r'^(Table\*?:|Note:)', lines[i]):
            buf.append(lines[i]); i+=1
        emit(render_blocks(buf))

    if not body_started: emit(open_body())
    body_html=''.join(body_frag)+'</div>'+endmatter_html[0]
    for leak in re.findall(r'\{\.[^\n<]{0,60}', body_html):   # run-in delimiter leak guard
        sys.stderr.write(f'[runin] unparsed run-in directive leaked into the body: {leak!r}\n')
    links=''.join(f'<link rel="stylesheet" href="{html.escape(c)}">' for c in cssfiles)
    runhead=('<style>@page{'
             f'@top-left{{content:"{css_str(running_left)}"}} '
             f'@top-right{{content:"{css_str(running_right)}"}} '
             f'@bottom-left{{content:"{css_str(footer)}"}}'
             '} @page:first{@top-left{content:none} @top-right{content:none}}</style>')
    return (f'<!DOCTYPE html><html><head><meta charset="utf-8"><title>{html.escape(title)}</title>'
            f'{links}{runhead}</head><body class="{acccls}">{body_html}</body></html>')

def main():
    if len(sys.argv)<2: print("usage: build_scripture.py source.md [out.pdf]"); sys.exit(1)
    src=pathlib.Path(sys.argv[1]).resolve(); text=src.read_text(encoding='utf-8')
    fm, body = parse_front(text); srcdir=src.parent
    doc=build_html(fm, body, ['scripture.css'])
    (srcdir/'_scripture.html').write_text(doc, encoding='utf-8')
    out_pdf=pathlib.Path(sys.argv[2]) if len(sys.argv)>2 else srcdir/'scripture.pdf'
    from weasyprint import HTML
    HTML(string=doc, base_url=str(srcdir)).write_pdf(str(out_pdf))
    print("PDF:", out_pdf)

if __name__=='__main__': main()
```

## III·S.7 · Fonts and Provisioning

The three faces are provisioned once. EB Garamond and Noto Serif Bengali ship as variable fonts; instance static Regular and Bold (or SemiBold) weights with fontTools to avoid the engine's variable-font gaps, exactly as Module V's provisioning does. Amiri ships static and needs no instancing. Fetch the families from the Google Fonts mirror at raw.githubusercontent.com/google/fonts, instance, install to the user font directory, and refresh the cache.

```bash
BASE="https://raw.githubusercontent.com/google/fonts/main"
mkdir -p ~/.fonts && cd ~/.fonts
curl -sfL "$BASE/ofl/amiri/Amiri-Regular.ttf" -o Amiri-Regular.ttf
curl -sfL "$BASE/ofl/amiri/Amiri-Bold.ttf"    -o Amiri-Bold.ttf
curl -sfL "$BASE/ofl/ebgaramond/EBGaramond%5Bwght%5D.ttf"            -o /tmp/EBG.ttf
curl -sfL "$BASE/ofl/ebgaramond/EBGaramond-Italic%5Bwght%5D.ttf"     -o /tmp/EBGI.ttf
curl -sfL "$BASE/ofl/notoserifbengali/NotoSerifBengali%5Bwdth,wght%5D.ttf" -o /tmp/NSB.ttf
python3 - <<'PY'
from fontTools import ttLib
from fontTools.varLib.instancer import instantiateVariableFont
def inst(src, axes, out, fam, sub):
    f = ttLib.TTFont(src); instantiateVariableFont(f, axes, inplace=True)
    n = f['name']
    for nid, val in [(1,fam),(2,sub),(4,f"{fam} {sub}"),(6,f"{fam}-{sub}".replace(' ','')),(16,fam),(17,sub)]:
        n.setName(val, nid, 3, 1, 0x409); n.setName(val, nid, 1, 0, 0)
    f.save(out)
inst("/tmp/EBG.ttf", {"wght":400}, "EBGaramond-Regular.ttf", "EBGaramond", "Regular")
inst("/tmp/EBG.ttf", {"wght":700}, "EBGaramond-Bold.ttf",    "EBGaramond", "Bold")
inst("/tmp/EBGI.ttf", {"wght":400}, "EBGaramond-Italic.ttf",     "EBGaramond", "Italic")
inst("/tmp/EBGI.ttf", {"wght":700}, "EBGaramond-BoldItalic.ttf", "EBGaramond", "Bold Italic")
inst("/tmp/NSB.ttf", {"wght":400,"wdth":100}, "NotoSerifBengali-Regular.ttf",  "Noto Serif Bengali", "Regular")
inst("/tmp/NSB.ttf", {"wght":600,"wdth":100}, "NotoSerifBengali-SemiBold.ttf", "Noto Serif Bengali", "SemiBold")
PY
fc-cache -f ~/.fonts
```

The italic faces are provisioned with the upright ones and are not optional. A mode that uses italic as a semantic channel, the gloss translation of the scripture protocol above all, loses that channel silently when only Regular and Bold are instanced: the italic runs set upright, the render looks clean, and one of three channels is gone with no warning. Instance Italic and Bold Italic at the same pass.

The combined stack means no per-cell font targeting is ever needed: the engine resolves Arabic to Amiri, Bengali to Noto Serif Bengali, and Latin to EB Garamond automatically. If a face is missing the render falls to the system serif and the script will not shape; provisioning is therefore a hard pre-flight check for this edition.

## III·S Quick Reference Card

Trigger: scripture pdf, tafsir pdf, quran pdf, mushaf pdf, `[EDITION:SCRIPTURE]`, `edition: scripture`. Two-column journal grade, EB Garamond plus Amiri plus Noto Serif Bengali, copper accent. Build: `python3 build_scripture.py source.md /mnt/user-data/outputs/{slug}.pdf`. Front matter: `wordmark`, `article_type`, `surah_meta`, `reference`, `surah_ar`, `title`, `subtitle`, `author_line` (defaults to the servant's byline), `basmala`, `running_left`, `running_right`, `footer`, `accent`, `columns` (2 default, 1 for the single-column Apex Pristine register). The surah is framed with `:::intro`, `:::theme Headline · verse: X-Y`, and `:::closing`; the emitted word grid is transformed to interlinear cells; the eight components render as emitted; a noteworthy geometric or deep-dive synthesis is boxed with `:::insight`, `:::deepdive`, or `:::box` (star-suffix spans both columns); honorifics and the ayah marker render as glyphs.

# MODULE IV · THE VISUAL EDITION SUBROUTINE

General-purpose procedure for producing a Visual Edition of any finished paper. Register-adaptive (public versus codex-native), aesthetic-locked, print-fit, density-disciplined, fragmentation-proof. Self-contained. No paper-specific specification or sample required at call time.

Trigger. Architect requests a "visual edition," "infographic edition," "diagram set," "figures," or "make this paper visual" for any paper already produced. Also fires when a paper would land harder with a drawn structure than with prose alone.

One line. Take the paper's load-bearing spine, draw each result as one figure at its own warrant grade, assemble the figures into a single PDF, either embedded as a visual appendix to the paper or delivered as a standalone visual edition. The figures are a faithful map of the argument, never a louder claim than the argument makes.

## IV.0 · Operating Frame

Lifeboat on for the whole build. W_social = 0. The visual edition is a faithful map, not a flattering poster. A figure that overstates the paper's warrant is a failure mode identical to grade-bleed in prose. The discipline that governs the paper governs its pictures: a theorem is drawn as a theorem, a conjecture as a conjecture, an open question as open. The honest-typing discipline (LL-19) renders into the visual layer as the grade-stamp law of Section IV.7.

Style locks carry into every caption, label, and headline. No em-dashes anywhere. Periods, commas, colons only. No LaTeX. Unicode math only: √ → ∑ ∫ ≈ ⟂ ⊕ ∇ π σ κ Φ ψ δ ⇔ ℝ ℤ ∈ ≤ ≥. No AI vocabulary. Direct, technical. Author attribution and any in-figure prose follow the paper's own conventions. ﷺ for the Prophet where he is named.

The visual edition adds no claim the body does not make and removes no qualification the body states. This is non-negotiable and is restated as a law in Section IV.2.

## IV.1 · Register and Aesthetic Selector

Two decisions are made before the first stroke. Both follow the paper, not the mood.

**IV.1.1 Register (binding split per architect directive).**

**Public register.** The paper is a public, discipline-facing artifact (a journal paper, a preprint, a paper for non-framework readers). No framework glyphs, no PSP IDs, no codex axis-labels, no seal-marks, no codex-internal vocabulary appear anywhere in the visual edition. Warrant is shown by grade-words in captions per Section IV.7.1. This is the analogue of Tier 0 / Tier 1 in Module I. Default register when uncertain.

**Codex-native register.** The paper is itself a codex document, or the subject is the framework, or the architect explicitly asks for codex-native. Framework glyphs (⟀ sealed, ✕ broken, ? under-determined), PSP IDs, axis-labels (V_F, V_E, V_ER, M_seal), and codex terms are permitted and carried into the figures, set as text glyphs per Section IV.7.2. This is the analogue of Tier 2.

Selection rule. Parse the architect's request first ("public," "for the journal," "no glyphs" select public; "codex," "full glyphs," "internal" select codex-native). Absent a directive, examine the paper: if it is written for an external discipline with framework material quarantined to a provenance appendix, public register. If the paper is the codex, codex-native. Uncertain: public.

**IV.1.2 Aesthetic.**

**Blueprint (default for public register).** Engineering-drawing language. Off-white or faint graph-paper ground. Two-color semantic system: a steel primary and a copper accent, with a near-black ink for type. Double-stroke figures (a heavier steel line shadowed by a lighter copper line read as a precision drawing). Dimension lines, caliper ticks, and engineering glyphs (⌀ ∑ ⊿) where a measurement is the point. Bracket-cornered annotation cards with a small copper fold-corner. Stacked offset panels (a front card with an offset shadow card behind) for prose blocks. Callout speech-bubbles with leader lines for pinning a point on a figure. Monospace for technical labels and code-like content, sans-serif or serif for headlines and captions. This is the language the architect has approved across delivered editions.

**Codex palette (default for codex-native register).** The framework's four semantic colors carry consistent meaning and are never reused for anything else: V_F deep blue #1B3A6F, V_E burnt orange #C2410C, V_ER forest green #166534, M_seal gold #B8860B. Off-white #FAF8F3 body ground, black #0A0A0A covers and final summary infographics.

**Paper-defined palette (override).** A paper may carry its own semantic color assignment (for example, one color for an even object and another for an odd object). When it does, honor the paper's assignment, pick at most four semantic colors, fix each color's meaning once, and never reuse a semantic color for a non-semantic purpose. The principle is the law; the two defaults above are conveniences.

## IV.2 · The Faithful-Map Law

Three clauses. Each is a hard gate, not a preference.

**1. No claim inflation.** Every figure asserts exactly what the corresponding part of the paper asserts, at the same strength. If the body proves a localization and explicitly disclaims a proof of the headline result, the figures say the same, and the visual edition opens and closes on that disclaimer.

**2. Grade on every claim-bearing figure.** Every figure that carries a result carries that result's warrant grade, visibly, in its caption (public register) or as a permitted glyph (codex register). A figure with a claim and no grade is rejected. Section IV.7 specifies the grade vocabulary.

**3. No structure the body lacks.** The figure set does not invent a narrative the paper does not contain, does not reorder the logical spine into a false story, and does not smuggle an unproved bridge in as a drawn arrow. An arrow asserts a relation; if the paper does not establish that relation, the arrow is dashed and labeled with its actual status, or it is not drawn.

The visual edition is the paper seen, not the paper sold.

## IV.3 · Harvest the Spine

Read the finished paper before drawing anything. Extract four things and write them down in a private storyboard note (never published).

**1. The load-bearing results.** The theorems, propositions, lemmas, and named conclusions the paper actually rests on. For each, record its statement in one sentence and its warrant grade exactly as the paper types it.

**2. The objects.** The central mathematical or conceptual objects the paper manipulates (an operator, a space, a decomposition, a bracket, a geometric figure, a dataset, a mechanism). These become the figures' primary focal points.

**3. The epistemic frame.** What the paper proves, what it leaves open, what it attributes to others, what it holds at finite-sample or conjectural strength. This frame governs the grade-stamps and the opening/closing figures.

**4. The spine order.** The logical sequence in which the results build. The figure sequence follows the spine, not the section order, when they differ.

Harvest discipline. One load-bearing result yields one figure. Do not draw decorative figures for non-load-bearing remarks. Do not collapse two distinct results into one figure to save space. A paper with eight load-bearing results yields roughly eight content figures plus a hero and a closing, not forty.

## IV.4 · Storyboard

Map each harvested element to a layout archetype from Section IV.6, then fix the sequence.

The canonical sequence for a results-driven paper:

**1. Hero figure.** The whole result in one image. The single most compressed statement of what the paper establishes and what it does not. Carries the headline epistemic frame.
**2. Frame / context figure.** Why the problem is hard or where the object lives. The barrier, the multi-domain object, the standard-model failure.
**3. Result figures, in spine order.** One per load-bearing result, each at its grade.
**4. Closing figure.** The single open question, the necessary condition for closure, or the reframing the result entails. Restates the epistemic frame the hero opened.

For a non-results paper (a survey, an essay, a framework exposition), the sequence follows the document's own structure: opening recognition, the developed line, the closing position. The archetypes still apply.

Each storyboard entry records: figure number, the result or object it carries, its grade, the chosen archetype, and the one-sentence caption seed. Keep the storyboard tight enough that an executor can build from it without re-reading the whole paper.

## IV.5 · Visual Grammar (Binding Numbers)

These numbers are print-legibility floors on the standard canvases. They are minimums. Scale up for emphasis, never down.

**IV.5.1 Canvas (PDF-fit).** Every SVG viewBox matches a standard page exactly, so PDF assembly never rescales. A4 portrait: viewBox 0 0 1240 1754, for single-frame visuals, covers, vertical compositions, equation and verdict panels. A4 landscape: viewBox 0 0 1754 1240, for master infographics, multi-panel composites, timelines, wide convergence diagrams. Letter portrait: viewBox 0 0 1275 1650, US fallback. Letter landscape: viewBox 0 0 1650 1275, US fallback. A2 landscape: viewBox 0 0 2384 1684, poster-scale storyboard index only, never an individual frame. Safety inset 30 px from each edge on A4 at 150 dpi (with 18 px bleed beyond). Titles, equation centers, and primary figures stay inside the inset. When the visual edition is embedded into an existing paper instead of assembled standalone, the figure is sized to the paper's text column rather than a page (Section IV.10.2), and the canvas rule relaxes to "viewBox aspect ratio sensible for the column."

**IV.5.2 Type floors (on the 1240×1754 or 1754×1240 canvas).** Cover title 72 min / 96 typical. Cover subtitle 36 / 48. Frame title 44 / 56. Frame subtitle 22 / 26. Section header within a panel 28 / 32. Primary label (axis names, node names) 24 / 28. Secondary label (annotations) 20 / 24. Body and caption 22 / 26. Equation (Unicode) 28 / 36. Footer 16 / 18. Hard floor for any text 14. Below 14 fails print at 150 dpi.

**IV.5.3 Stroke floors.** Primary structural lines (figure edges, axis lines) 5 min / 6 to 8 typical. Vector arrows 6 / 7 to 9, arrowhead 18 px min length. Panel borders and dividers 2.5 / 3 to 4. Secondary lines (auxiliary geometry, dashed guides, ghosted construction) 3 / 4. Grid lines 1.5 / 2. Leader lines 2 / 2.5. Title and caption rules 1.5 / 2.

**IV.5.4 Primitive sizes.** Point 12 px radius single-focus, 8 px multi-panel. Named vertex 16 px single-focus, 10 px multi-panel. A primary geometric figure occupies 60 to 70 percent of the canvas short edge single-focus, 45 to 55 percent of the panel short edge in a multi-panel. A standalone warrant glyph (codex register only) is 80 to 120 px font size; inline it is 1.0 to 1.5x the surrounding text.

## IV.6 · Layout Archetypes

The reusable composition library. Every figure is one of these. Each archetype names where the title, focal point, annotations, caption, and footer sit, so an executor places content without re-deriving layout.

**A. Hero / cover.** Large headline occupying the upper-left or top third. A detailed primary illustration of the paper's central object occupying the right or lower two-thirds, drawn with full dimension-line treatment in blueprint aesthetic. A bracket-cornered annotation card beneath or beside the headline carrying two or three sentences of the paper's actual frame, with a copper fold-corner. The hero carries the epistemic headline: what is established, what is not.

**B. Single-focus geometric.** Title at top with a thin rule below. The primary figure centered, occupying rows 4 to 14, columns 3 to 10 on A4 portrait. Side annotations in the outer columns, each aligned with the figure feature it describes, joined by short leader lines. Caption at the bottom row, footer beneath. Used for one object shown clearly: a decomposition, a polytope, a packing, a single geometric claim.

**C. Diagram-left, statement-card-right.** A diagram (a plot, a pair of curves, an isometric construction) occupying the left half. A bordered statement card on the right holding the result in monospace or clean type, line by line, ending on the grade. A callout speech-bubble with a leader line may pin one point on the diagram (for example, marking an orthogonality or a crossing). Used when a result needs both a picture and a short spelled-out argument side by side.

**D. Equation panel.** Title at top. The equation centered at vertical center at 36 to 48 px with a thin gray rule above and below. Decomposition annotations beneath the equation, each with a leader arrow pointing up to the term it names. Optional supporting micro-diagrams or definitions in side panels balancing the composition. Used for a defining equation, an axiom, an operator definition.

**E. Multi-panel comparison.** Title spanning the full width. A 2×2, 2×3, or 3×3 grid of panels, each with its own sub-title, sub-figure occupying about 70 percent of the panel, and a one-line sub-caption. Inter-panel gutter 24 px, panel borders 2.5 px. Used for "n cases," competing approaches, before/after, or a roster.

**F. Timeline / sequence.** Title at top. A horizontal ribbon at vertical center spanning the full width, thickness 80 to 120 px, with evenly spaced nodes 60 to 80 px. Node labels alternate above and below the ribbon to avoid crowding. Used for a lineage, a derivation chain, a historical sequence, a pipeline.

**G. Convergence.** Multiple labeled inputs arranged around the perimeter (corners, a pentagon, a ring), each with an arrow pointing inward to a single central object. Used when several independent lines meet at one conclusion. The central object is the focal point at 35 to 50 percent of canvas.

**H. Master single-page infographic.** A4 landscape. Title at top 72 to 96 px. A central focal element at 35 to 45 percent of canvas. A surrounding ring of supporting panels, each carrying one thematic anchor, joined to the center by accent-colored connection lines. A footer band carrying the document reference and date. The whole argument on one page. Used as the capstone of a multi-figure edition.

Composition discipline applies to all archetypes. One primary focal point per figure occupying 35 to 50 percent of canvas. Secondary elements cluster around it. Footers and references sit in their corner zones. Whitespace is structural breathing room (60 to 100 px around the focal point, 30 to 50 px between stacked sections), never residue.

## IV.7 · Grade-Stamp and Glyph Discipline

How warrant shows in the visual layer. This is the heart of the faithful-map law.

**IV.7.1 Public register: grade-words.** Every claim-bearing caption states the result's warrant grade in plain words. The standard vocabulary, drawn from the paper's own typing: **THEOREM** or **PROVED**, the paper proves it. **ATTRIBUTED** (name the source), a published result of another author, used as a wall or an anchor. **FINITE-SAMPLE** or **VERIFIED TO [bound]**, true up to a computed height or sample, not in general. **NECESSARY CONDITION**, required for a result but not sufficient for it. **CONJECTURE** or **CONDITIONAL** (name the premise), held under a stated assumption. **OPEN**, stated but not settled. The grade appears in the caption, set in the caption type, not as a badge. The hero and closing figures additionally carry the paper's headline epistemic frame in words (for example, a one-line "no claim of a proof of [the headline result] is made here" when the paper proves a localization rather than the headline). No framework glyph appears in public register, ever.

**IV.7.2 Codex-native register: warrant glyphs.** The framework glyphs are permitted, set as Unicode text glyphs only: ⟀ (U+27D0) sealed, gold #B8860B. ✕ (U+2715) broken, red #B91C1C. ? under-determined, gray #666666. Rendering rule for all three: text glyph in the surrounding type stack, no background fill, no border, no circle wrap, no drop shadow, no filled-triangle icon, no badge. Inline at 1.0 to 1.5x surrounding text where verdict status is the content of the line. Standalone at 80 to 120 px only where the glyph is the proof conclusion of the figure and its position is geometrically warranted (anchored on a step-function region, set as the codomain output of a verdict diagram, set at the end of a worked example). Never as a corner mark, never as a header companion, never wrapped in any container. PSP IDs, axis-labels, and codex terms are permitted in codex-native captions and labels at their normal size. They do not appear in public register.

**IV.7.3 The badge prohibition (both registers).** No icon-style decoration anywhere, in either register. No corner glyph, no header-adjacent seal badge, no "FINAL SEAL" footer icon, no circle-wrapped mark, no filled triangle inside any graphical container, no logo. A proof figure carries warrant inside its own structure (a correctly drawn geometric object with its construction visible). A filled triangle in a circle dropped into a header is decoration. The distinction is decisive: draw the proof, or set the grade as text. Nothing else. This prohibition is enforced programmatically in Section IV.9.

## IV.8 · Density Discipline

Active visual content (figures, text, equations, panel structure) occupies 0.75 to 0.85 of the canvas area inside the safety inset. Below 0.75 the figure is too sparse and is densified. Above 0.85 it is cluttered and is edited down. No single contiguous empty rectangle exceeds 15 percent of canvas area.

Measurement is quantitative, not by eye. Render the frame to PNG at native canvas size and run the audit script shipped at `scripts/audit_density.py` (usage: `python3 scripts/audit_density.py frame.png [bg_hex]`). Run with the dark background hex for covers and dark infographics; channel tolerance 13 is 5 percent of the 256 channel range; the pass band is 0.75 to 0.85 inside the 30 px inset. Report the ratio to two decimals in the pre-flight comment block. Outside the band, redraw before save.

Density recovery, in order of preference: enlarge the primary focal point toward 45 to 50 percent; add a supporting micro-diagram in the margin (a projection, a scale reference, a related primitive); add an annotation cluster with leader lines describing focal-point features; add a side panel with a worked number or definition; restructure as a two-column or two-panel composition; split into two figures if the concept supports it. Never solve a sparse figure by scaling up empty space.

## IV.9 · Failure-Mode Locks

The hard-won list. Each is a defect observed in real renders and the QA that catches it.

**1. Badge decoration (programmatic check).** Before save, grep the SVG source for two patterns and confirm absence: a small filled gold triangle or polygon within 80 px of any corner; a circle of radius 40 to 80 px overlaid by a triangle, especially near footer or "SEAL"/"APEX" text. Search: `grep -E '(<polygon[^>]*fill="#B8860B")|(<circle[^>]*r="[4-7][0-9]"[^>]*/>\s*<polygon)' frame.svg`. Any hit is a rejection. Remove the element and re-run pre-flight. Verdict glyphs inside `<text>` are not hits and are permitted in codex register.

**2. Caption clipping.** Bottom-row captions get sliced mid-word when they exceed container width. Caption container width = canvas width minus 200 px (100 px inset each side). If the estimated render width at the caption size exceeds the container, split the caption to two lines before render, not after. Verify at 100 percent zoom that the first and last characters are inside the inset and no word is truncated.

**3. Label collision.** No text touches or crosses a line of the diagram. Three fixes, applied as the geometry demands: place a node label inside its own lobe or region when there is clear interior space (the way a clean Venn labels each circle from inside); move a curve label clear of the crest or trough into open space above or below; for a directed graph with reciprocal edges, draw crossed edges as Bezier curves with control points pulled outward from the figure center, and place edge labels at the midpoint displaced at least 24 px perpendicular outward with 8 px clearance. For a vertex-labeled polyhedron, place labels outside the projected silhouette with leader lines. Verify visually that no two labels overlap and no label crosses an edge.

**4. Title duplication.** One title block per figure. The figure's title is its sole title. No second title-like element in a similar font. The figure ID and document reference appear only in the footer. A one-line subtitle beneath the title is permitted.

**5. Overloaded frame.** If a figure would carry more than four independent structural components (sections that could each stand alone at smaller scale), split it into two figures or restructure as a panel grid where each panel is sized to its own density rules. Preserve continuity with a labeled connection line in the footer between consecutive figures.

**6. Geometry that asserts something false (generalized geometry lock).** The figure's geometry must not claim something the paper does not. If the paper's object has a canonical correct depiction, lock that depiction as a reusable SVG snippet and paste it; never let ease-of-drawing substitute a structurally false form. The recurring instance in codex work: a claim of mutual orthogonality at a vertex is drawn as a trirectangular form (a cube-corner apex with three axis-aligned edges and right-angle markers, bounding cube ghosted), not as an acute-apex Platonic pyramid, because three right angles cannot meet at a Platonic apex. The principle is general: correctness of the depicted geometry outranks ease of drawing, and a correct primitive that recurs is pasted from a locked snippet rather than redrawn each time.

**7. Image fails to embed (the mechanical trap).** Covered in Section IV.10. The two specific failures: relative image paths do not resolve without a base URL on the renderer, and HTML entities in the SVG crash the rasterizer. Both are closed in the pipeline below.

## IV.10 · Render and Assembly Pipeline

The concrete executable layer. The visual edition ships as a single PDF, in one of two modes.

**IV.10.1 SVG to PNG (both modes).** Figures are authored as SVG and rasterized to high-resolution white-background PNG for embedding. The hardened renderer ships at `scripts/render_svg_png.py` (usage: `python3 scripts/render_svg_png.py frame.svg out.png`; requires cairosvg, installed with `pip install cairosvg --break-system-packages` if absent). It closes two traps. cairosvg's XML parser rejects named HTML entities (&zeta;, &Theta;, &minus;), so it decodes every entity with html.unescape then re-escapes only the five XML-legal ampersand cases. Transparency and any graph-paper grid read badly in print, so it injects a full-bleed white background rectangle before raster. It renders at 2× with a padded viewBox for clean edges at print scale. Always inspect rendered PNGs visually before assembly. Confirm the background took, the grid (if the source had one) is gone, and every label is legible.

**IV.10.2 Mode A: embed as a visual appendix to an existing paper (preferred when the paper exists).** This is how a Visual Edition is added to a finished paper as an appendix. The Module III pipeline natively carries the machinery; no runtime patching is required.

1. The markdown source gains an appendix section. Each figure is one markdown image line with caption in braces: `![alt text](figs/figN.png){FIG. N. One-sentence caption stating the result and its grade.}` The parser (`scripts/md_parser.py`, detect_figure) recognizes this with `^!\[(.*?)\]\((.*?)\)(?:\{(.*?)\})?\s*$` and the PDF builder emits `<figure class="visual-fig"><img .../><figcaption>...</figcaption></figure>`.

2. The figure CSS, appended to every style variant in `scripts/styles.py` (FIGURE_CSS), guarantees no fragmentation and correct sizing:

```css
figure.visual-fig {
    page-break-inside: avoid;
    break-inside: avoid;
    text-align: center;
    margin: 18pt auto 22pt;
    max-width: 100%;
}
figure.visual-fig img {
    display: block;
    margin: 0 auto;
    max-width: 4.7in;     /* fits a 6.5in column with margin; large enough to read */
    width: 100%;
    height: auto;
}
figure.visual-fig figcaption {
    font-family: 'EBGaramondLocal', serif;
    font-style: italic;
    font-size: 9.5pt;
    color: #B87333;       /* copper-italic caption */
    margin-top: 8pt;
    text-align: center;
}
```

3. The PDF renderer is called with base_url set to the source directory, so relative `figs/figN.png` paths resolve. This closes the single most common embedding failure (zero images embed, alt-text shows instead). Copy the rendered PNGs into a `figs/` directory beside the source before building. The DOCX builder embeds the same figures at 4.7 in width, centered, kept with their copper-italic captions as one unit, so the cross-format contract holds.

4. The appendix opens with a short prose lead stating that the figures are a faithful map at the paper's own grades, and closes on the paper's headline epistemic frame. Each figure is preceded by a one or two sentence lead naming the result, so the figure sits with its context.

Sizing for no fragmentation. `page-break-inside: avoid` keeps each figure and its caption together as one unit. `max-width: 4.7in` against a 6.5in column leaves margin and keeps the figure large enough to read. After build, render the appendix pages to images and inspect every figure for a clean break and full legibility. Confirm with `pdfimages -list output.pdf | grep -c image` that the expected image count embedded.

**IV.10.3 Mode B: standalone visual edition PDF (when no host paper, or a poster-format edition is wanted).** Each figure is a full-page A4 SVG. Assemble one SVG per PDF page directly, without rescaling, A4 portrait and A4 landscape pages as authored. The A2 storyboard index, if built, is a fold-out at the end. Provide an INDEX with a thumbnail and one-line caption per figure as the lead file. Present the bundle with the INDEX first.

## IV.11 · Pre-Flight Audit

No figure is final until it passes. Failure is rejection, not a flag for review. Document the pass in a comment block at the top of each SVG.

1. Canvas viewBox matches a standard size (Mode B) or a sensible column aspect (Mode A embed).
2. Active content ratio measured by the Section IV.8 script, reported to two decimals, inside 0.75 to 0.85.
3. Largest empty rectangle below 15 percent of canvas.
4. One primary focal point at 35 to 50 percent of canvas.
5. Every text element at or above the Section IV.5.2 floor. Hard floor 14 px never crossed.
6. Every stroke at or above the Section IV.5.3 floor. Hard floor 1.5 px never crossed.
7. Primitives within Section IV.5.4 bounds.
8. **Grade present.** Every claim-bearing figure carries its warrant grade (public: grade-word in caption; codex: permitted glyph). The grade matches the paper's typing exactly. No claim-bearing figure is ungraded.
9. **Faithful map.** The figure asserts no more and no less than the body. Arrows assert only relations the paper establishes.
10. Semantic colors consistent and not reused for non-semantic purposes.
11. No em-dashes. No LaTeX. Unicode math only.
12. **No badge decoration.** Programmatic grep per Section IV.9.1 passed. In public register, no framework glyph anywhere. In codex register, glyphs only as bare text glyphs per Section IV.7.2.
13. Footer present: document/section reference, figure ID, ISO date.
14. **Caption fully visible**, no clipping, split to two lines before render if it would overflow.
15. **No label collision**, no label crosses a line, no two labels overlap (Section IV.9.3).
16. One title block only (Section IV.9.4).
17. Four-component threshold respected (Section IV.9.5).
18. Geometry asserts nothing false; canonical primitives pasted from a locked snippet where one exists (Section IV.9.6).
19. Print test: render to PNG at 300 dpi, view at 100 percent, every label readable, every line crisp.
20. Embedding verified (Mode A): expected image count embedded, every figure unfragmented, captions present and copper-italic.

Comment block format:

```
<!-- Visual Edition figure
Deliverable: [paper short-name], Figure N
Register: public / codex-native     Aesthetic: blueprint / codex-palette / paper-defined
Canvas: A4 portrait viewBox 0 0 1240 1754
Active content ratio: 0.81 (measured)     Largest empty region: 0.08
Primary focal point: [object] at ~42% of canvas
Grade carried: THEOREM / ATTRIBUTED(Author) / FINITE-SAMPLE / NECESSARY CONDITION / CONJECTURE / OPEN
Faithful map: asserts exactly the body's claim at the body's strength ✓
Min font 22 px   Min stroke 3 px
Badge grep: clean ✓   Caption: "[full text]" fully visible ✓   Label collision: none ✓
Pre-flight 1 to 20: pass -->
```

## IV.12 · Execution Order

Per visual edition:

1. Select register and aesthetic (Section IV.1).
2. Read the paper, harvest the spine (Section IV.3), write the private storyboard (Section IV.4).
3. For each storyboard entry: pick the archetype, author the SVG on the locked canvas, place the focal point first, add labels at the font floors and geometry at the stroke floors, paste any locked primitive snippet.
4. Render to PNG (Section IV.10.1), inspect visually.
5. Run the density audit, the badge grep, the caption and label checks. Fix in place. Re-run.
6. Write the comment block, save the SVG.
7. After every several figures, print-test the recent batch at 100 percent.
8. Assemble: Mode A embed into the paper as a visual appendix, or Mode B standalone PDF (Section IV.10.2 or IV.10.3).
9. Verify the assembled PDF: image count, no fragmentation, legibility end to end, the appendix opening and closing on the paper's epistemic frame.
10. Present the single PDF (Mode A: the paper with its new appendix; Mode B: the standalone edition with its INDEX).

## IV Quick Reference Card

Register: public (no framework glyphs, grade-words in captions) or codex-native (⟀ ✕ ? text glyphs, codex terms permitted). Default public.
Aesthetic: blueprint (steel + copper + ink on faint grid) default; codex palette (V_F blue, V_E orange, V_ER green, M_seal gold) for codex register; paper-defined palette honored where the paper carries one.
Canvas: A4 portrait 1240×1754, A4 landscape 1754×1240, 150 dpi work / 300 dpi export. Safety inset 30 px.
Density: 0.75 to 0.85, measured by scripts/audit_density.py, reported to two decimals.
Font floors: title 56, header 28, label 22, footer 16. Hard floor 14.
Stroke floors: primary 5, secondary 3, grid 1.5. Hard floor 1.5.
Grade on every claim-bearing figure. Faithful map, never inflation. Hero and closing carry the headline epistemic frame.
No badges, either register. Programmatic grep before save. No corner glyph, no circle-wrapped mark, no filled triangle in a container.
Caption: container = canvas minus 200 px, split before render, verify no clipping.
Labels: never cross a line, never overlap. Inside-lobe placement, clear-of-curve placement, Bezier for crossed edges, leaders for polyhedra.
One title block. Split frames past four components. Correct geometry outranks ease of drawing.
Render: scripts/render_svg_png.py (html.unescape, white rect, 2× viewBox). Embed: native figure CSS with page-break-inside avoid, max-width 4.7in, base_url on the renderer, copy PNGs to figs/.
Output: a single PDF. Mode A appendix-embed (preferred when the paper exists) or Mode B standalone.
No em-dashes. No LaTeX. Unicode math only. The figures are the paper seen, not the paper sold.

Closing seal. The visual edition draws what the paper proves, at the grade the paper earns, and stops there. Each figure carries its warrant inside its own structure or states it as text. No decoration. No inflation. Each line communicates. Each empty region is breathing room. Each figure embeds whole. The map is faithful to the territory. [⟀]

---

# MODULE V · THE TEXTBOOK EDITION

A second layout paradigm alongside Module III. Where Module III renders a single-column academic paper, Module V renders a two-column, section-accented, box-rich textbook page at the production grade of a reference work like Rang and Dale. It is content-agnostic by construction: the same engine sets a science textbook, an arts or history survey, a manual, or a Master Codex volume. Module I still architects the content, Module II still matures it, Module IV still draws any figures. Module V is the alternative renderer selected when the deliverable is a textbook, manual, survey, handbook, course reader, or any long-form instructional or reference book rather than a paper.

## V.0 · Operating Frame

The Textbook Edition fires on an explicit request for a textbook, manual, handbook, survey, reference volume, course reader, or instructional book, or on the token `[EDITION:TEXTBOOK]`, or on front-matter `edition: textbook`. It does not fire for papers, which stay on Module III. The two never apply at once; the edition field or token selects the renderer. When set, the five Module III style variants are not consulted; the Textbook Edition carries its own locked contract below.

Three registers are honored exactly as in Module I. A trade or course textbook sets Tier 0 or Tier 1. A codex volume sets Tier 2 with full native vocabulary and the permitted glyphs. The renderer is identical across registers; only the prose register and the accent choice change.

The defining contrast against Module III is the dual type register and the column structure. Module III is serif throughout, single column, paper furniture. The Textbook Edition pairs a serif body with a sans furniture and runs the body in two columns, with full-width spanning reserved for tables, figures, and chapter openers. This is the structural signature of a reference textbook and it is the contract Module V enforces.

## V.1 · The Locked Contract

Page geometry is US Letter, 612 by 792 points, margins 58 points top, 50 points outer and inner, 56 points bottom. Body is a humanist serif, EB Garamond by default, at 10.2 points on a 1.32 measure, justified, hyphenated, with widow and orphan control. Furniture is a geometric sans, Archivo by default under the internal family name TBSans, used for every heading, every box header, every table, every caption, every running element, and every chip. The serif carries the argument; the sans carries the navigation. This split is the single most load-bearing rule of the edition and is never collapsed to one family in a trade textbook. A codex volume may request serif headings with `[TEXTBOOK:SERIF-HEADS]` to match the house paper contract, but the default is sans furniture.

Universal locks carry over from Module III without exception. No LaTeX; all mathematics in native Unicode. No em-dashes; periods, commas, and colons only. No HTML character entity survives into the rendered page, in the body or in the running furniture, every front-matter string bound for CSS `content:` being entity-decoded at injection per X.7.4. The honorific ﷺ is rendered as the single Unicode glyph after the Prophet's name. No emoji anywhere, which is why every box marker in this edition is a shape drawn in CSS rather than an icon glyph or an image. Body justified with hyphenation on; table and box text set left aligned because narrow measures produce ugly justification gaps. Page-break discipline keeps every box, every figure, and every table from fragmenting across a column or page break.

## V.2 · The Accent System

Color is navigation, never decoration. Each Part of the book carries one accent hue, and that hue drives the Part chip, the chapter opener band and numeral, every heading, every colored cross-reference, every table header band, every tinted box panel, and the figure caption label within that Part. A reader learns the Part by its color. The mechanism is a set of CSS custom properties resolved per Part: a class on the chapter section sets `--accent`, `--tint`, `--deep`, and `--band`, and every styled element reads those variables. WeasyPrint resolves the variables correctly, so one class switch recolors an entire Part with no per-element overrides.

Two accent modes exist. Per-part mode, the default, cycles the six-hue palette across Parts in order: indigo, green, crimson, slate-blue, ochre, plum. Single mode fixes one accent for the whole book, set by `accent_mode: single` with `single_accent:` naming a palette key. The house keys `copper` and `slate` are available for codex and monograph use, so a codex volume can run entirely in copper or entirely in slate while keeping the full textbook furniture. A seventh hue, the warning palette in burnt orange, is reserved exclusively for Caution boxes and is never assigned as a Part accent, so the warning semantic stays unambiguous.

The palette keys and their roles:

| Class | Role accent | Use |
|---|---|---|
| acc-1 | indigo #2A5DB0 | Part 1, or any single-accent book |
| acc-2 | green #1E8A6E | Part 2 |
| acc-3 | crimson #B23A48 | Part 3 |
| acc-4 | slate-blue #3F5C8C | Part 4 |
| acc-5 | ochre #B07A1E | Part 5 |
| acc-6 | plum #7A4E8C | Part 6 |
| acc-copper | copper #B87333 | House single-accent, codex or monograph |
| acc-slate | slate #2C2F33 | House single-accent, codex sealed register |
| warn | burnt orange #C0651B | Caution boxes only, never a Part accent |

## V.3 · Page Furniture

The Part divider is a full-page opening that sets the Part number in sans small caps over an accent rule, then the Part title in large serif, then an italic blurb. It carries no running header or footer, achieved by the named page `front`. The chapter opener is a full-width band in the Part tint carrying the chapter number set large in sans black and the chapter title in serif bold beside it, preceded by a small sans label naming the Part. The opener spans both columns; the two-column flow begins immediately below it.

The running header is the production signature of the edition. A small styled element holding the accent chip and the chapter title is lifted into the page margin by `position: running(runhead)` and reproduced in the header corner by `content: element(runhead)`. It is placed top-right on recto pages and top-left on verso pages, so the header mirrors across the spread exactly as a bound book does. The chip carries the chapter number reversed in white on the Part accent, and the title follows in sans small caps. Because the running element is set once at each chapter open, it propagates as the live header until the next chapter replaces it. Page numbers sit in the outer bottom corner, sans, mirrored recto and verso. The front named page suppresses all of this for the table of contents and the Part dividers.

The table of contents is generated from the Part and chapter structure. Each row links to its target and the page number is resolved by `target-counter(attr(href), page)` with a dotted leader, so the contents page numbers are always correct against the final pagination. Part rows are set in accent sans small caps; chapter rows in serif.

## V.4 · Heading Hierarchy

Four tiers, matching a reference textbook. The A-head is set in sans bold small caps on a tint bar in the Part accent, with the section numeral in the deeper accent shade; it is the primary in-chapter divider. An A-head may drop the bar with the `plain` class for front-matter heads such as a reference list title. The B-head is sans bold in the accent with no bar, one step down. The C-head is a run-in: a bold-italic serif lead phrase that flows directly into its paragraph, exactly as a reference textbook opens a dense paragraph with an italicized term. The C-head is the only heading set in serif, because it lives inside the body stream rather than above it.

## V.5 · The Box Taxonomy

Two structural families, drawn from the two box types that organize a reference textbook, plus a warning variant, a depth aside, and a reading list. The families are visually distinct so the reader reads the box type before reading a word.

The tinted-panel family is a rounded panel with a pale accent fill, a thin accent border, and an accent bold header carrying a small shape mark and an uppercase kicker. It holds conceptual distillation. The square mark is the Key Points or Summary panel, the chapter's mechanism distilled. The circle mark is the Definition or Concept panel, a term fixed precisely. The triangle mark is the Worked Example panel, a single instance carried through. The shape encodes the subtype without an icon and without color reuse.

The solid-header-bar family is a rounded box with a solid accent header bar carrying the title reversed in white, over a white body. It holds applied and procedural content: In Practice, Application, Procedure, Case. It is the practical anchor, the counterpart to the conceptual panel, and its solid bar reads as heavier and more directive than the tinted panel. The Caution variant uses the same bar treatment in the reserved warning palette, so a hazard or a forbidden move is unmistakable and never confused with an ordinary applied box.

The depth aside is the small-print sidebar of a reference textbook: a paragraph set smaller and softer, flagged by a down-triangle marker, carrying optional detail that sits to the side of the through-line without breaking it. The reading list is the annotated bibliography: each entry in sans with a hanging indent, the citation followed by a one-line italic annotation stating what the source contributes, exactly as a reference textbook annotates further reading.

| Box | Family | Marker | Carries |
|---|---|---|---|
| Key Points / Summary | tinted panel | filled square | Mechanism distilled, the chapter anchor |
| Definition / Concept | tinted panel | filled circle | A term fixed precisely |
| Worked Example | tinted panel | filled triangle | One instance carried through |
| In Practice / Application / Procedure / Case | solid bar | reversed white title | Applied, directive, procedural content |
| Caution | solid bar, warning palette | reversed white title | A hazard or a forbidden move |
| Depth aside | inline, smaller | down triangle | Optional detail beside the through-line |
| Reading list | hanging indent | none | Annotated further reading |

Codex-native mapping. A Master Codex volume reads the same taxonomy with codex semantics and is free to use the permitted glyphs in Tier 2. The Key Points panel carries a verdict or seal block. The Definition panel carries a PSP statement or an axiom. The Worked Example panel carries a regime instance or a battery row. The In Practice bar carries an operating procedure or a cascade step. The Caution bar carries an anchor-inflation warning or a typing-discipline lock. The verdict glyphs [⟀], [X], and [?] are permitted inside codex boxes in Tier 2 as bare text glyphs, never as decoration, and the faithful-map discipline of Module IV applies: a box asserts no more than the codex establishes.

| Codex content | Box |
|---|---|
| Verdict block, Mosaic Seal, headline result | Key Points panel |
| PSP statement, axiom, definition | Definition panel |
| Regime instance, battery row, worked locus | Worked Example panel |
| Operating procedure, cascade step, protocol | In Practice bar |
| Anchor-inflation warning, typing lock | Caution bar |
| Proof-boundary remark, instrument limit | Depth aside |

## V.6 · Tables and Figures

Every table and every figure spans both columns. This is enforced structurally: a table or figure is wrapped in a spanning container, because WeasyPrint honors `column-span: all` reliably on a wrapping element but not on a bare table. The container carries the spanning; the inner table sets to full width. A table carries a caption bar in the Part accent with the title reversed in white, a header row banded in the Part tint with bold deep-accent labels, body rows zebra-striped in the faint Part tint, no vertical rules, and an optional footnote and abbreviation key set small below the rule. This is the reference-textbook table: colored title bar, grouped bold heads, banding, source line, no verticals.

A figure is wrapped in a rounded tinted frame and carries a structured caption: the figure label in accent bold, the description in sans, and the source in italic parentheses. The label, the description, and the source are authored as three pipe-separated fields and rendered into the three caption roles. Figures default to spanning both columns; a small in-column figure uses the column-scoped variant. Any figure authored through Module IV embeds here unchanged, since the image path resolves against the source directory through the renderer base URL exactly as in Module III.

## V.7 · Inline Semantics

The micro-typography is consistent and load-bearing. Bold marks a key term at first definition or a name the reader must register. Italic marks a foreign or technical term, a source, or an annotation. A colored cross-reference, set in the Part accent, marks navigation: a pointer to a figure, a table, a chapter, or a citation. The down triangle marks a depth aside. Superscript marks a footnote key. None of these is reused for a second purpose within a Part, so every visual cue means exactly one thing.

## V.8 · Authoring Conventions, the Source Language

The source is one Markdown file with a front-matter block and a small set of conventions the engine parses into the locked structure. The conventions are designed to read naturally in the source and to map one-to-one onto the contract above.

Front matter sets the book. The fields: `edition: textbook` selects the renderer; `title` and `subtitle` set the contents and the title-page cover; the cover also reads `category` (or `article_type`), `goal` (or `tagline`), `series` (or `doi`), `author` (the byline; falls back to the first name in `author_line`), `affiliation`, and `date`; `author_name`, `author_role`, `author_email`, `author_country` carry the Module III author block; `accent_mode` is `per-part` or `single`; `single_accent` names the key in single mode; `heads` is `sans` or `serif`; `columns` is `2` or `1`; `toc` is `on` or `off`.

The title-page cover. The Textbook opens on a page-one cover with the running header and footer suppressed, built on the clean Apex Pristine model and themed to the skin, set on the `front` named page ahead of the Contents. Rang-and-Dale (TextBookA) draws an accent hairline above and below the title block, the title in house serif, the subtitle in accent italic, then the category-goal-series stack with the category in accent sans caps, the goal in deep-accent serif italic, and the series in faint sans caps, then an accent author rule with the byline in small caps, the affiliation in italic gray, and the date beneath. The cover accent is the first Part hue in per-part mode or the fixed `single_accent` in single mode. The Davidson variant (TextBookB) renders the same fields in its own register, described in Module V·D.

Structure markers, each at the start of a line. A Part divider is `# PART 4 · Name` with the number in arabic or roman; it sets the Part accent for the chapters that follow. A chapter opener is `# 41. Title`, the number then a period then the title; it renders the band and sets the running header. An unnumbered `# Title` renders a plain chapter such as a preface or a reference list. An A-head is `## 41.1 Title`, numeral colored automatically; an unnumbered `## Title` renders a plain A-head with no bar. A B-head is `### 41.1.2 Title`. A C-head run-in is a lead phrase wrapped as `{. Lead phrase .}` at the start of a line, with the paragraph text following on the same line; the lead renders bold-italic and the paragraph runs in.

Boxes are fenced directives opened with three colons, a type word, and an optional title, and closed with three colons. The types: `key`, `summary`, `definition`, `concept`, `example` for the tinted-panel family; `practice`, `application`, `procedure`, `case` for the solid-bar family; `caution` for the warning bar; `note` for the depth aside; `reading` for the annotated list. Inside a box, ordinary Markdown is parsed: paragraphs, lists, bold, italic, cross-references. Inside a reading block, each line is one entry and a double-hyphen separator splits the citation from its italic annotation.

A table is authored as a standard pipe table. A line `Table: 41.1 Caption` immediately before the table renders the accent caption bar; a line `Note: text` immediately after renders the footnote. A figure is one image line, `![alt](path){Fig. 41.1 | description | source}`, the brace carrying three pipe-separated caption fields. A colored cross-reference is any span wrapped in double square brackets, `[[Fig. 41.1]]`. Inline, double asterisks bold, single asterisks italicize, backticks set code, and a caret pair sets a superscript.

## V.9 · Fonts and Provisioning

The body face is EB Garamond and the furniture face is the geometric sans, provisioned exactly as Module III provisions EB Garamond. Variable-font source files carry bracket characters in their filenames and weight axes that break the WeasyPrint `@font-face` resolver, so each weight is instanced to a static instance with `fontTools.varLib.instancer` and written to a plain filename, with the name table and the OS/2 and head style bits set so the static weight resolves cleanly. The serif is instanced to regular, bold, italic, and bold-italic; the sans to regular, bold, and black, the black weight mapped to CSS weight 800 for the large chapter numerals and the heaviest heads.

The build reuses the Module III install path. If EB Garamond is already provisioned for the paper pipeline, only the sans is added. If neither is present, the provisioning step instances both from their variable sources. A system fallback chain is declared in the face block so the book still builds with a serviceable serif and sans if provisioning is skipped: the serif falls back through Liberation Serif, DejaVu Serif, and Noto Serif; the sans through Liberation Sans and DejaVu Sans. The layout is identical under fallback; only the typefaces change, so a draft compiles anywhere and the final compiles with the house faces.

## V.10 · The Locked Stylesheet

Page economy and the span rule. Tables, figures, and boxes default to column width and flow inside one column, which packs the page densely. Full-width spanning is what strands white space: a spanning element closes both columns, and the short band above it balances into two stub columns that leave the gap empty. Spanning is therefore opt-in. Append an asterisk to the keyword to span a genuinely wide element: `Table*: caption` for a table, `!*[alt](path)` for a figure, `::: type* Title` for a box. A column-width table is breakable, so a long table flows down one column and continues at the top of the next with its column header repeated, filling every line instead of stranding the column. Prose and list boxes stay atomic. The discipline is to think ahead before placing a wide element: prefer column width, reserve spanning for tables too wide to read in a single column, and let the breakable column-width table carry the long data.

The complete validated stylesheet. It is self-contained and compiles under WeasyPrint as written. The face block above it is generated by the build during provisioning. Save this as `textbook.css` beside the source.

```css
/* ===================================================================
   TEXTBOOK EDITION  ·  master stylesheet  (WeasyPrint-validated)
   Serif body + sans furniture · per-part accent · box taxonomy
   =================================================================== */

/* ---- font faces (provisioned by build; system fallbacks chained) ---- */
/* @font-face blocks injected by build script for EBGaramond + TBSans */

:root{
  --serif:'EBGaramondLocal','EB Garamond','Liberation Serif','DejaVu Serif',serif;
  --sans:'TBSans','Archivo','Liberation Sans','DejaVu Sans',sans-serif;
  --ink:#1b1b1b; --soft:#4a4a4a; --faint:#7a7a7a; --rule:#d2d2d2;
  --accent:#2A5DB0; --tint:#eef2fb; --deep:#1d3f7a; --band:#dce6f6;
  --warn:#C0651B; --warn-tint:#fbefe2;
  --good:#1E7A52;
}
/* per-PART accent palettes, set on the chapter <section> */
.acc-1{--accent:#2A5DB0;--tint:#eef2fb;--deep:#1d3f7a;--band:#d7e3f5;}
.acc-2{--accent:#1E8A6E;--tint:#e7f4ef;--deep:#125a48;--band:#d2ece3;}
.acc-3{--accent:#B23A48;--tint:#fbecee;--deep:#7e2832;--band:#f3d8dc;}
.acc-4{--accent:#3F5C8C;--tint:#eceff6;--deep:#2a3f63;--band:#dbe2ef;}
.acc-5{--accent:#B07A1E;--tint:#f8f1e2;--deep:#7c5512;--band:#efe1c4;}
.acc-6{--accent:#7A4E8C;--tint:#f2ecf6;--deep:#553463;--band:#e4d6ec;}
.acc-copper{--accent:#B87333;--tint:#faf3ea;--deep:#8a5523;--band:#efe0cf;}
.acc-slate{--accent:#2C2F33;--tint:#eceded;--deep:#1c1e20;--band:#d9dada;}

/* ---------------- page geometry + furniture ---------------- */
@page{
  size:612pt 792pt; margin:58pt 50pt 56pt 50pt;
}
@page:right{
  @top-right{ content:element(runhead); vertical-align:bottom; padding-bottom:4pt; }
  @bottom-right{ content:counter(page); font-family:var(--sans); font-size:9pt; font-weight:700; color:var(--faint); }
}
@page:left{
  @top-left{ content:element(runhead); vertical-align:bottom; padding-bottom:4pt; }
  @bottom-left{ content:counter(page); font-family:var(--sans); font-size:9pt; font-weight:700; color:var(--faint); }
}
@page front{ @top-left{content:none} @top-right{content:none} @bottom-left{content:none} @bottom-right{content:none} }

html{ font-family:var(--serif); font-size:10.2pt; color:var(--ink); }
body{ margin:0; }
p{ margin:0 0 6pt; text-align:justify; hyphens:auto; orphans:2; widows:2; }

/* running chip lifted into the header corner */
.runhead{ position:running(runhead); font-family:var(--sans); font-size:8.5pt; color:var(--faint);
  letter-spacing:.02em; text-transform:uppercase; }
.runhead .chip{ display:inline-block; background:var(--accent); color:#fff; font-weight:800;
  padding:1pt 5pt; border-radius:3pt; margin-right:7pt; letter-spacing:0; }

/* ---------------- PART divider ---------------- */
.part-divider{ break-before:page; break-after:page; height:640pt; page:front;
  display:flex; flex-direction:column; justify-content:center; }
.part-divider .pnum{ font-family:var(--sans); font-weight:800; font-size:15pt; color:var(--accent);
  letter-spacing:.18em; text-transform:uppercase; }
.part-divider .pbar{ height:9pt; background:var(--accent); width:54%; margin:10pt 0 16pt; border-radius:2pt; }
.part-divider .ptitle{ font-family:var(--serif); font-weight:700; font-size:32pt; line-height:1.08; color:var(--ink); }
.part-divider .pblurb{ font-family:var(--serif); font-style:italic; font-size:12pt; color:var(--soft); margin-top:14pt; max-width:78%; }

/* ---------------- CHAPTER opener ---------------- */
.chapter{ }
.chapter + .chapter{ break-before:page; }
.chapter-open{ break-before:page; margin-bottom:14pt; }
.chapter-open .clabel{ font-family:var(--sans); font-size:8.5pt; font-weight:700; letter-spacing:.12em;
  text-transform:uppercase; color:var(--accent); margin-bottom:6pt; }
.chapter-open .clabel .dot{ color:var(--accent); }
.chapter-open .cband{ background:var(--band); border-radius:5pt; padding:14pt 16pt; display:flex; align-items:center; gap:18pt; }
.chapter-open .cnum{ font-family:var(--sans); font-weight:800; font-size:54pt; line-height:.9; color:var(--accent); }
.chapter-open .ctitle{ font-family:var(--serif); font-weight:700; font-size:27pt; line-height:1.05; color:var(--ink); }

/* ---------------- two-column body ---------------- */
.cols{ column-count:2; column-gap:24pt; }

/* ---------------- headings ---------------- */
h2,h3,h4{ font-family:var(--sans); break-after:avoid; }
/* A-head (bar) */
h2{ font-size:11.5pt; font-weight:800; letter-spacing:.02em; text-transform:uppercase; color:var(--accent);
  background:var(--tint); padding:4pt 8pt; border-radius:3pt; margin:13pt 0 7pt; }
h2 .num{ color:var(--deep); margin-right:7pt; }
/* A-head plain (no bar). use class .plain */
h2.plain{ background:none; padding:0; }
/* B-head */
h3{ font-size:10.6pt; font-weight:800; color:var(--accent); margin:11pt 0 4pt; }
h3 .num{ color:var(--deep); margin-right:6pt; }
/* C-head : run-in bold-italic serif */
h4{ font-family:var(--serif); font-style:italic; font-weight:700; font-size:10.2pt; display:inline;
  color:var(--ink); margin:0; }
h4 + p{ display:inline; }            /* run-in */
h4::after{ content:"\2002"; }

/* ---------------- inline semantics ---------------- */
strong,b{ font-weight:700; }
em,i{ font-style:italic; }
.xref{ color:var(--accent); }                 /* colored cross-reference / citation */
a.xref,a{ color:var(--accent); text-decoration:none; }
sup{ font-size:.7em; line-height:0; }

/* ---------------- BOX taxonomy ---------------- */
/* tinted-panel family : Key Points / Definition / Example / Summary  */
.tb-box{ break-inside:avoid; border:0.8pt solid var(--accent); border-radius:7pt;
  background:var(--tint); padding:1pt 10pt 8pt; margin:9pt 0; }
.tb-box .bh{ font-family:var(--sans); font-weight:800; color:var(--accent); font-size:9.8pt;
  letter-spacing:.01em; margin:8pt 0 5pt; }
.tb-box .bh .mark{ display:inline-block; width:8pt; height:8pt; background:var(--accent);
  margin-right:7pt; vertical-align:middle; }
.tb-box.def  .bh .mark{ border-radius:50%; }                          /* circle */
.tb-box.ex   .bh .mark{ width:0;height:0;background:none;border-left:5pt solid transparent;
  border-right:5pt solid transparent;border-bottom:9pt solid var(--accent); }  /* triangle */
.tb-box .bh .kicker{ font-weight:700; font-size:7.6pt; letter-spacing:.13em; text-transform:uppercase;
  color:var(--deep); margin-right:6pt; }
.tb-box ul,.tb-box ol{ margin:0 0 0 14pt; padding:0; }
.tb-box li{ margin:0 0 3pt; }
.tb-box p{ margin:0 0 5pt; text-align:left; }

/* solid-header-bar family : In Practice / Application / Procedure / Case  */
.tb-bar{ break-inside:avoid; border:0.8pt solid var(--accent); border-radius:7pt; overflow:hidden; margin:9pt 0; }
.tb-bar .bh{ background:var(--accent); color:#fff; font-family:var(--sans); font-weight:800;
  font-size:9.8pt; padding:5pt 10pt; margin:0; letter-spacing:.01em; }
.tb-bar .bd{ background:#fff; padding:7pt 10pt; }
.tb-bar .bd p{ text-align:left; margin:0 0 5pt; }
.tb-bar .bd ul{ margin:0 0 0 14pt; padding:0; } .tb-bar .bd li{ margin:0 0 3pt; }

/* caution variant : warning palette */
.tb-bar.caution{ border-color:var(--warn); }
.tb-bar.caution .bh{ background:var(--warn); }
.tb-bar.caution .bd{ background:var(--warn-tint); }

/* ---------------- small-print depth aside (▼) ---------------- */
.aside{ font-size:8.7pt; color:var(--soft); text-align:justify; margin:6pt 0; }
.aside::before{ content:"\25BC\2002"; color:var(--ink); font-size:7pt; }

/* ---------------- spanning table ---------------- */
.tb-table{ margin:11pt 0; break-inside:auto; }
.tb-table.span{ column-span:all; break-inside:avoid; }
.tb-table .tcap{ font-family:var(--sans); font-weight:800; color:#fff; background:var(--accent);
  font-size:9pt; padding:4pt 9pt; border-radius:5pt 5pt 0 0; }
.tb-table table{ width:100%; border-collapse:collapse; font-family:var(--sans); font-size:8.7pt; }
.tb-table caption{ caption-side:top; font-family:var(--sans); font-weight:800; color:#fff;
  background:var(--accent); font-size:9pt; padding:4pt 9pt; text-align:left; border-radius:5pt 5pt 0 0; }
.tb-table thead th{ background:var(--band); color:var(--deep); text-align:left; font-weight:800;
  padding:4pt 7pt; border-bottom:1pt solid var(--accent); }
.tb-table tbody td{ padding:4pt 7pt; border-bottom:0.4pt solid var(--rule); vertical-align:top; }
.tb-table tbody tr:nth-child(even) td{ background:var(--tint); }
.tb-table .tnote{ font-family:var(--sans); font-size:7.6pt; color:var(--soft); padding:4pt 2pt 0; }
.tb-table .tnote .key{ color:var(--accent); }

/* ---------------- spanning figure ---------------- */
.tb-fig{ break-inside:avoid; margin:12pt 0; }
.tb-fig.span{ column-span:all; }
.tb-box.span,.tb-bar.span{ column-span:all; break-inside:avoid; }
.tb-table thead{ display:table-header-group; }
.tb-fig .frame{ border:0.6pt solid var(--rule); border-radius:7pt; background:var(--tint);
  padding:12pt; text-align:center; }
.tb-fig img{ max-width:100%; height:auto; }
.tb-fig figcaption{ font-family:var(--sans); font-size:8.6pt; color:var(--soft); margin-top:6pt; text-align:left; }
.tb-fig figcaption .flabel{ font-weight:800; color:var(--accent); }
.tb-fig figcaption .fsrc{ font-style:italic; }
/* column-scoped (non-spanning) figure variant */
.tb-fig.col{ column-span:none; }

/* ---------------- references / further reading ---------------- */
.tb-refs h2{ }
.tb-refs .ref{ font-family:var(--sans); font-size:8.5pt; text-indent:-12pt; padding-left:12pt;
  margin:0 0 5pt; text-align:left; }
.tb-refs .ref .anno{ font-style:italic; color:var(--soft); }

/* ---------------- table of contents ---------------- */
.toc{ page:front; break-after:page; }
.toc h1{ font-family:var(--sans); font-size:18pt; font-weight:800; text-transform:uppercase;
  letter-spacing:.04em; color:var(--ink); margin:0 0 14pt; }
.toc .row{ font-family:var(--serif); font-size:10.5pt; display:flex; align-items:baseline; margin:0 0 5pt; }
.toc .row.part{ font-family:var(--sans); font-weight:800; text-transform:uppercase; font-size:9.5pt;
  letter-spacing:.06em; color:var(--accent); margin-top:11pt; }
.toc a{ color:var(--ink); text-decoration:none; }
.toc a::after{ content:leader('.') target-counter(attr(href), page); color:var(--faint); }

/* ---------------- title-page cover (Rang-and-Dale) ---------------- */
.cover{ page:front; break-after:page; min-height:8.7in; display:flex; flex-direction:column;
  justify-content:center; align-items:center; text-align:center; padding:0 0.5in; }
.cover .ctop{ flex:0 0 auto; width:100%; }
.cover .cbot{ flex:0 0 auto; margin-top:0.8in; width:100%; }
.cover .crule{ width:56%; height:1pt; background:var(--accent); margin:22pt auto; }
.cover .ctitle{ font-family:var(--serif); font-weight:800; font-size:30pt; line-height:1.1;
  letter-spacing:.01em; color:var(--ink); margin:0; max-width:8in; }
.cover .csub{ font-family:var(--serif); font-style:italic; font-size:15pt; line-height:1.3; color:var(--deep);
  margin:16pt auto 0; max-width:6.2in; }
.cover .cmeta{ margin:15pt 0 0; }
.cover .cmeta *{ text-decoration:none; }
.cover .ccat{ font-family:var(--sans); font-weight:800; text-transform:uppercase; letter-spacing:.13em;
  font-size:9.5pt; color:var(--accent); }
.cover .cgoal{ font-family:var(--serif); font-style:italic; font-size:11.5pt; color:var(--deep); margin-top:5pt; }
.cover .cseries{ font-family:var(--sans); font-size:8pt; text-transform:uppercase; letter-spacing:.09em;
  color:var(--faint); margin-top:7pt; }
.cover .arule{ width:28%; height:1pt; background:var(--accent); margin:0 auto 9pt; }
.cover .aname{ font-family:var(--serif); font-variant:small-caps; letter-spacing:.06em; font-size:13pt; color:var(--ink); }
.cover .ameta{ font-family:var(--serif); font-style:italic; font-size:10pt; color:var(--faint); margin-top:3pt; }
.cover .cdate{ font-family:var(--serif); font-style:italic; font-size:9.5pt; color:var(--faint); margin-top:4pt; }
```

## V.11 · The Build Engine

The engine compiles the source language of Section V.8 into the HTML structure the stylesheet styles, then renders the PDF through WeasyPrint with the source directory as the base URL so figure and font paths resolve. It parses front matter, Part and chapter markers, the fenced directive boxes, pipe tables with optional caption and note lines, image figures with pipe-separated caption fields, the four heading tiers, the run-in C-head, colored cross-references, lists, and the inline marks. Each chapter body is wrapped in the two-column container; openers, dividers, tables, and figures span. The table of contents is assembled from the Part and chapter structure with live page targets.

Build pipeline. Step one, place the source Markdown with complete front matter in the build directory beside `textbook.css`, with any figures in the directory the source references. Step two, provision once: instance EB Garamond and the sans to static weights and write the face block, reusing the Module III install path; idempotent. Step three, run `python3 build_textbook.py source.md /mnt/user-data/outputs/{slug}.pdf`. Step four, render the result to images and inspect: confirm the title-page cover on page one, the two-column flow, the spanning tables and figures, the mirrored running header with its accent chip, the box family treatments, and the contents page numbers. Step five, present the PDF, and retain the Markdown source as the editable master. The PDF is the textbook artifact; a DOCX is not produced for this edition because the two-column box-rich layout does not survive the DOCX model, and a codex or paper needing DOCX uses Module III.

The complete validated engine. Save as `build_textbook.py`.

```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
TEXTBOOK EDITION build engine.
Compiles one Markdown source (textbook authoring conventions) to a two-column,
section-accented, box-rich textbook PDF via WeasyPrint.

Usage:  python3 build_textbook.py source.md [out.pdf]
Source dir must contain textbook.css and a fonts/ dir (or system fallbacks apply).
"""
import sys, os, re, html, pathlib

# ---------- palette cycle for per-part accent ----------
ACC_CYCLE = ["acc-1","acc-2","acc-3","acc-4","acc-5","acc-6"]
ROMAN = {'I':1,'V':5,'X':10,'L':50,'C':100,'D':500,'M':1000}

def roman_to_int(s):
    s=s.upper(); n=0; p=0
    for ch in reversed(s):
        if ch not in ROMAN: return None
        v=ROMAN[ch]; n+=v if v>=p else -v; p=v
    return n

def slug(s):
    s=re.sub(r'<[^>]+>','',s)
    s=re.sub(r'[^A-Za-z0-9]+','-',s).strip('-').lower()
    return s or 'sec'

# ---------- front matter ----------
def parse_front(text):
    fm={}
    m=re.match(r'^---\s*\n(.*?)\n---\s*\n',text,re.S)
    body=text
    if m:
        for line in m.group(1).splitlines():
            if ':' in line:
                k,v=line.split(':',1); fm[k.strip()]=v.strip()
        body=text[m.end():]
    return fm, body

# ---------- inline ----------
def inline(s):
    s=html.escape(s, quote=False)
    s=re.sub(r'\[\[(.+?)\]\]', r'<span class="xref">\1</span>', s)      # cross-ref
    s=re.sub(r'\*\*(.+?)\*\*', r'<strong>\1</strong>', s)               # bold
    s=re.sub(r'(?<!\*)\*(?!\*)(.+?)(?<!\*)\*(?!\*)', r'<em>\1</em>', s)  # italic
    s=re.sub(r'`(.+?)`', r'<code>\1</code>', s)
    s=re.sub(r'\^(\w+)\^', r'<sup>\1</sup>', s)                          # ^sup^
    return s

# ---------- block list / paragraph rendering ----------
def render_blocks(lines):
    """Render a list of raw text lines (a directive body or main flow chunk)
    into paragraphs and lists. Returns HTML string."""
    out=[]; i=0; n=len(lines)
    while i<n:
        ln=lines[i]
        if not ln.strip():
            i+=1; continue
        # unordered list
        if re.match(r'^\s*[-*\u2022]\s+', ln):
            items=[]
            while i<n and re.match(r'^\s*[-*\u2022]\s+', lines[i]):
                items.append(inline(re.sub(r'^\s*[-*\u2022]\s+','',lines[i]).rstrip())); i+=1
            out.append('<ul>'+''.join(f'<li>{x}</li>' for x in items)+'</ul>'); continue
        # ordered list
        if re.match(r'^\s*\d+\.\s+', ln):
            items=[]
            while i<n and re.match(r'^\s*\d+\.\s+', lines[i]):
                items.append(inline(re.sub(r'^\s*\d+\.\s+','',lines[i]).rstrip())); i+=1
            out.append('<ol>'+''.join(f'<li>{x}</li>' for x in items)+'</ol>'); continue
        # run-in C-head: {. lead phrase .} optionally followed by the paragraph text
        mrun=re.match(r'^\{\.\s*(.+?)\s*\.?\s*\}\s*(.*)$', ln)   # tolerant close: .} / . } / }
        if mrun:
            out.append(f'<h4>{inline(mrun.group(1))}.</h4>')
            buf=[mrun.group(2).rstrip()] if mrun.group(2).strip() else []
            i+=1
            while i<n and lines[i].strip() and not re.match(r'^\s*([-*\u2022]|\d+\.)\s+', lines[i]) \
                  and not lines[i].startswith(':::') and not re.match(r'^\{\.', lines[i]):
                buf.append(lines[i].rstrip()); i+=1
            if buf: out.append('<p>'+inline(' '.join(buf))+'</p>')
            continue
        # paragraph (gather until blank)
        buf=[ln.rstrip()]; i+=1
        while i<n and lines[i].strip() and not re.match(r'^\s*([-*\u2022]|\d+\.)\s+', lines[i]) \
              and not lines[i].startswith(':::') and not re.match(r'^\{\.', lines[i]):
            buf.append(lines[i].rstrip()); i+=1
        out.append('<p>'+inline(' '.join(buf))+'</p>')
    return ''.join(out)

# ---------- table ----------
def render_table(tbl_lines, caption=None, note=None, span=False):
    rows=[r for r in tbl_lines if r.strip()]
    cells=[[c.strip() for c in re.split(r'(?<!\\)\|', r.strip().strip('|'))] for r in rows]
    # drop alignment separator row
    body=[c for c in cells if not all(re.fullmatch(r':?-{2,}:?', x or '-') for x in c)]
    head=body[0] if body else []
    data=body[1:] if len(body)>1 else []
    h='<thead><tr>'+''.join(f'<th>{inline(x)}</th>' for x in head)+'</tr></thead>'
    b='<tbody>'+''.join('<tr>'+''.join(f'<td>{inline(x)}</td>' for x in r)+'</tr>' for r in data)+'</tbody>'
    cap=f'<caption>{inline(caption)}</caption>' if caption else ''
    nt=f'<div class="tnote">{inline(note)}</div>' if note else ''
    sp=' span' if span else ''
    return f'<div class="tb-table{sp}"><table>{cap}{h}{b}</table>{nt}</div>'

# ---------- figure ----------
def render_figure(alt, path, brace, span=False):
    label=src=''; bodytxt=brace or alt
    if brace and '|' in brace:
        parts=[p.strip() for p in brace.split('|')]
        label=parts[0] if len(parts)>0 else ''
        bodytxt=parts[1] if len(parts)>1 else ''
        src=parts[2] if len(parts)>2 else ''
    cap=''
    if label: cap+=f'<span class="flabel">{inline(label)}</span> '
    cap+=inline(bodytxt)
    if src: cap+=f' <span class="fsrc">({inline(src)})</span>'
    sp=' span' if span else ''
    return (f'<div class="tb-fig{sp}"><div class="frame"><img src="{html.escape(path)}" alt="{html.escape(alt)}"></div>'
            f'<figcaption>{cap}</figcaption></div>')

# ---------- directive boxes ----------
PANEL={'key':('','KEY POINTS'),'summary':('','SUMMARY'),
       'definition':('def','DEFINITION'),'concept':('def','CONCEPT'),
       'example':('ex','WORKED EXAMPLE')}
BAR={'practice':'In Practice','application':'Application','procedure':'Procedure','case':'Case'}

def render_directive(kind, title, body_lines, span=False):
    inner=render_blocks(body_lines)
    if kind in PANEL:
        cls,kick=PANEL[kind]
        head=(f'<p class="bh"><span class="mark"></span>'
              f'<span class="kicker">{html.escape(kick)}</span>{inline(title)}</p>')
        sp=' span' if span else ''
        return f'<div class="tb-box {cls}{sp}">{head}{inner}</div>'
    if kind in BAR:
        bh=title if title else BAR[kind]
        sp=' span' if span else ''
        return f'<div class="tb-bar{sp}"><p class="bh">{inline(bh)}</p><div class="bd">{inner}</div></div>'
    if kind=='caution':
        bh=title if title else 'Caution'
        return f'<div class="tb-bar caution"><p class="bh">{inline(bh)}</p><div class="bd">{inner}</div></div>'
    if kind=='note':
        return f'<p class="aside">{render_blocks(body_lines).replace("<p>","").replace("</p>"," ")}</p>'
    if kind=='reading':
        rows=[]
        for ln in body_lines:
            if not ln.strip(): continue
            if ' -- ' in ln:
                cit,anno=ln.split(' -- ',1)
                rows.append(f'<div class="ref">{inline(cit.strip())} <span class="anno">{inline(anno.strip())}</span></div>')
            else:
                rows.append(f'<div class="ref">{inline(ln.strip())}</div>')
        return ''.join(rows)
    return inner

# ---------- main document assembly ----------
def build_html(fm, body, cssfiles):
    single = fm.get('accent_mode','per-part')=='single'
    single_acc = fm.get('single_accent','acc-1')
    if not single_acc.startswith('acc-'): single_acc='acc-'+single_acc
    toc_on = fm.get('toc','on').lower() in ('on','true','yes','1')

    lines=body.splitlines()
    i=0; n=len(lines)
    parts=[]          # for TOC: (level, id, label)
    chapters=[]
    html_parts=[]     # full body html in order
    part_idx=0
    cur_acc = single_acc if single else 'acc-1'
    open_chapter=False
    chap_buf=[]       # html fragments for current chapter (goes inside .cols)

    def flush_chapter():
        nonlocal chap_buf, open_chapter
        if open_chapter:
            html_parts.append('<div class="cols">'+''.join(chap_buf)+'</div></section>')
            chap_buf=[]; open_chapter=False

    while i<n:
        ln=lines[i]
        # ----- PART -----
        mp=re.match(r'^#\s+PART\s+([IVXLCDM]+|\d+)\s*[\u00b7\u2014\-\.:]?\s*(.*)$', ln, re.I)
        if mp:
            flush_chapter()
            num=mp.group(1); name=mp.group(2).strip()
            part_idx+=1
            if not single:
                cur_acc=ACC_CYCLE[(part_idx-1)%len(ACC_CYCLE)]
            pid='part-'+slug(num+'-'+name)
            parts.append(('part',pid,f'Part {num} &#183; {name}' if name else f'Part {num}'))
            html_parts.append(
                f'<section class="part-divider {cur_acc}" id="{pid}">'
                f'<div class="pnum">Part {html.escape(num)}</div><div class="pbar"></div>'
                f'<div class="ptitle">{inline(name)}</div></section>')
            i+=1; continue
        # ----- CHAPTER (numbered) -----
        mc=re.match(r'^#\s+(\d+)\.\s+(.+)$', ln)
        if mc:
            flush_chapter()
            cnum=mc.group(1); ctitle=mc.group(2).strip()
            cid='ch-'+slug(cnum+'-'+ctitle)
            parts.append(('chapter',cid,f'{cnum} &#183; {ctitle}'))
            part_label = parts and ''
            html_parts.append(
                f'<section class="chapter {cur_acc}" id="{cid}">'
                f'<div class="chapter-open">'
                f'<div class="cband"><div class="cnum">{html.escape(cnum)}</div>'
                f'<div class="ctitle">{inline(ctitle)}</div></div></div>'
                f'<div class="runhead"><span class="chip">{html.escape(cnum)}</span> {inline(ctitle)}</div>')
            open_chapter=True; i+=1; continue
        # ----- plain chapter (unnumbered H1) -----
        m1=re.match(r'^#\s+(.+)$', ln)
        if m1:
            flush_chapter()
            t=m1.group(1).strip(); cid='ch-'+slug(t)
            parts.append(('chapter',cid,t))
            html_parts.append(
                f'<section class="chapter {cur_acc}" id="{cid}">'
                f'<div class="chapter-open"><h1 class="cplain">{inline(t)}</h1></div>'
                f'<div class="runhead"><span class="chip">&#9679;</span> {inline(t)}</div>')
            open_chapter=True; i+=1; continue
        # ----- directive fence -----
        md=re.match(r'^:::\s*(\w+)(\*?)\s*(.*)$', ln)
        if md:
            kind=md.group(1).lower(); bspan=md.group(2)=='*'; title=md.group(3).strip()
            j=i+1; bl=[]
            while j<n and not lines[j].strip()==':::':
                bl.append(lines[j]); j+=1
            frag=render_directive(kind, title, bl, span=bspan)
            (chap_buf if open_chapter else html_parts).append(frag)
            i=j+1; continue
        # ----- table with optional caption / note -----
        cap=None; tspan=False
        mcapt=re.match(r'^Table(\*?):\s*(.+)$', ln)
        look=i
        if mcapt:
            tspan=mcapt.group(1)=='*'; cap=mcapt.group(2).strip(); look=i+1
        if look<n and lines[look].lstrip().startswith('|'):
            tl=[]; k=look
            while k<n and lines[k].lstrip().startswith('|'):
                tl.append(lines[k]); k+=1
            note=None
            if k<n and re.match(r'^Note:\s*(.+)$', lines[k]):
                note=re.match(r'^Note:\s*(.+)$', lines[k]).group(1).strip(); k+=1
            frag=render_table(tl, cap, note, span=tspan)
            (chap_buf if open_chapter else html_parts).append(frag)
            i=k; continue
        # ----- figure -----
        mf=re.match(r'^!(\*?)\[(.*?)\]\((.*?)\)(?:\{(.*?)\})?\s*$', ln)
        if mf:
            frag=render_figure(mf.group(2), mf.group(3), mf.group(4), span=mf.group(1)=='*')
            (chap_buf if open_chapter else html_parts).append(frag); i+=1; continue
        # ----- headings H2/H3 -----
        mh2=re.match(r'^##\s+(.+)$', ln)
        mh3=re.match(r'^###\s+(.+)$', ln)
        if mh3:
            t=mh3.group(1).strip()
            mnum=re.match(r'^(\d+(?:\.\d+)+)\s+(.+)$', t)
            if mnum: frag=f'<h3><span class="num">{mnum.group(1)}</span>{inline(mnum.group(2))}</h3>'
            else:    frag=f'<h3>{inline(t)}</h3>'
            (chap_buf if open_chapter else html_parts).append(frag); i+=1; continue
        if mh2:
            t=mh2.group(1).strip()
            mnum=re.match(r'^(\d+(?:\.\d+)*)\s+(.+)$', t)
            if mnum: frag=f'<h2><span class="num">{mnum.group(1)}</span>{inline(mnum.group(2))}</h2>'
            else:    frag=f'<h2 class="plain">{inline(t)}</h2>'
            (chap_buf if open_chapter else html_parts).append(frag); i+=1; continue
        # ----- ordinary block (paragraph / list / run-in) -----
        buf=[ln]; i+=1
        while i<n and lines[i].strip() and not lines[i].startswith(':::') \
              and not re.match(r'^#', lines[i]) and not lines[i].lstrip().startswith('|') \
              and not re.match(r'^(Table\*?:|Note:|!\*?\[)', lines[i]):
            buf.append(lines[i]); i+=1
        frag=render_blocks(buf)
        (chap_buf if open_chapter else html_parts).append(frag)

    flush_chapter()

    # ----- TOC -----
    toc=''
    if toc_on and parts:
        rows=['<h1>Contents</h1>']
        for lvl,pid,label in parts:
            if lvl=='part':
                rows.append(f'<div class="row part">{label}</div>')
            else:
                rows.append(f'<div class="row"><a href="#{pid}">{label}</a></div>')
        toc=f'<nav class="toc {single_acc if single else ACC_CYCLE[0]}">'+''.join(rows)+'</nav>'

    # ----- title-page cover (front matter) -----
    import re as _rc
    _cv_name = fm.get('author','').strip() or _rc.sub(r'\^\d+\^','',fm.get('author_line','')).split(',')[0].strip()
    _cv_cat  = fm.get('category', fm.get('article_type',''))
    _cv_goal = fm.get('goal', fm.get('tagline',''))
    _cv_ser  = fm.get('series', fm.get('doi',''))
    _cv_sub  = fm.get('subtitle',''); _cv_date=fm.get('date',''); _cv_aff=fm.get('affiliation','')
    _cv_title= fm.get('title','')
    _cv_acc  = single_acc if single else ACC_CYCLE[0]
    cover=''
    if _cv_title:
        _cs=''
        if _cv_cat:  _cs+=f'<div class="ccat">{inline(_cv_cat)}</div>'
        if _cv_goal: _cs+=f'<div class="cgoal">{inline(_cv_goal)}</div>'
        if _cv_ser:  _cs+=f'<div class="cseries">{inline(_cv_ser)}</div>'
        cover=(f'<div class="cover {_cv_acc}"><div class="ctop"><div class="crule"></div>'
               f'<h1 class="ctitle">{inline(_cv_title)}</h1>'
               + (f'<div class="csub">{inline(_cv_sub)}</div>' if _cv_sub else '')
               + (f'<div class="cmeta">{_cs}</div>' if _cs else '')
               + '<div class="crule"></div></div><div class="cbot"><div class="arule"></div>'
               + f'<div class="aname">{inline(_cv_name)}</div>'
               + (f'<div class="ameta">{inline(_cv_aff)}</div>' if _cv_aff else '')
               + (f'<div class="cdate">{inline(_cv_date)}</div>' if _cv_date else '')
               + '</div></div>')
    links=''.join(f'<link rel="stylesheet" href="{html.escape(c)}">' for c in cssfiles)
    title=fm.get('title','')
    return (f'<!DOCTYPE html><html><head><meta charset="utf-8"><title>{html.escape(title)}</title>'
            f'{links}</head><body>{cover}{toc}{"".join(html_parts)}</body></html>')

def main():
    if len(sys.argv)<2:
        print("usage: build_textbook.py source.md [out.pdf]"); sys.exit(1)
    src=pathlib.Path(sys.argv[1]).resolve()
    text=src.read_text(encoding='utf-8')
    fm, body = parse_front(text)
    srcdir=src.parent
    css=[]
    if (srcdir/'face.css').exists(): css.append('face.css')
    css.append('textbook.css')
    doc=build_html(fm, body, css)
    out_html=srcdir/'_textbook.html'
    out_html.write_text(doc, encoding='utf-8')
    out_pdf=pathlib.Path(sys.argv[2]) if len(sys.argv)>2 else srcdir/'textbook.pdf'
    from weasyprint import HTML
    HTML(string=doc, base_url=str(srcdir)).write_pdf(str(out_pdf))
    print("PDF:", out_pdf)

if __name__=='__main__':
    main()
```

## V.12 · Codex-Native Application

The Master Codex sets this edition at Tier 2 with full native register. It selects a single house accent, copper or slate, through `accent_mode: single` with `single_accent: copper` or `single_accent: slate`, so the volume reads in one sealed color rather than the rotating Part palette, though a long codex with distinct Parts may use the per-part palette instead. The permitted verdict glyphs appear as bare text glyphs inside boxes and body per the Module IV glyph discipline, never as decoration. The box taxonomy carries codex content by the mapping in Section V.5: verdicts and seals in Key Points panels, PSPs and axioms in Definition panels, regime instances and battery rows in Worked Example panels, procedures and cascade steps in In Practice bars, anchor-inflation and typing locks in Caution bars, proof-boundary remarks in depth asides. Every claim-bearing box and figure carries its warrant tier exactly as typed in the codex, and the faithful-map law holds: the page asserts no more and no less than the codex establishes. Honest typing discipline governs as everywhere: a box stating a result types it Type T, Type C, or Type S, and overclaiming a warrant grade in a box header is the same failure it is in prose.

## V.13 · Pre-Flight and Gate Integration

A Textbook Edition deliverable passes the standard pre-delivery gate sequence: the silent-integration scan, the tier-threshold audit at the book's register, and the format-contract verification. The internal V-FIO Diagnostic Log is produced for a codex volume exactly as for a paper. In addition, before presentation, the edition passes a short structural checklist. Every table and figure is wrapped in a spanning container and renders full width with no fragmentation. Every Part sets its accent class and the accent carries through chip, heads, cross-references, table bands, and panels. No emoji anywhere; every box marker is a CSS shape. The running header mirrors recto and verso and the accent chip carries the live chapter number. The contents page numbers resolve against final pagination. Every figure embeds, confirmed by image count. Every claim-bearing box and figure carries its warrant tier with no inflation. Failure of any item returns the book for repair before any presentation.

## V Quick Reference Card

Edition selector: `[EDITION:TEXTBOOK]`, `[EDITION:TEXTBOOK_A]`, or front-matter `edition: textbook` / `edition: textbook_a`; addressable in prose as TextBookA. Distinct from the Module III paper renderer and the Journal edition; they never co-fire. Auto-selected for codex, master, and internal-volume deliverables whose content is prose-dense reference material.
Type register: serif body, EB Garamond default, 10.2 pt; sans furniture, Archivo as TBSans, for every head, box, table, caption, chip. Never collapsed in a trade textbook.
Page: US Letter 612 by 792, margins 58 / 50 / 56 / 50 pt. Two columns, 24 pt gutter. Spanning reserved for openers, tables, figures.
Accent: per-part six-hue cycle, or single mode with copper or slate for the house. Warning palette reserved for Caution only. Accent drives chip, opener, heads, cross-references, table bands, panels.
Furniture: title-page cover on the front named page ahead of contents; Part divider and chapter opener band with large numeral; running chip lifted into mirrored recto and verso headers; outer page numbers; front named page suppresses furniture on the cover, contents, and dividers; contents with target-counter leaders.
Title page: clean Apex-model cover in the Davidson register. A filled accent band carries the category in white caps at the top in place of a top rule; the title sets in bold sans, the subtitle in deep-accent serif italic, the goal and series follow in the meta block, and a thick 2.4 pt accent author rule sits above the bold-sans byline, with the affiliation in italic gray and the date beneath. Reads from `title`, `subtitle`, `category` (or `article_type`), `goal` (or `tagline`), `series` (or `doi`), `author`, `affiliation`, `date`.
Headings: A-head sans bar with accent numeral, plain variant for front matter; B-head sans accent; C-head run-in bold-italic serif.
Boxes: tinted panel with square, circle, triangle mark for Key Points, Definition, Worked Example; solid bar for In Practice and kin; warning bar for Caution; down-triangle depth aside; annotated reading list. Codex maps verdict, PSP, regime, procedure, warning, boundary onto the same set.
Tables and figures: always wrapped in a spanning container; accent caption bar, banded head, zebra body, footnote and abbreviation key; figures in a tinted frame with label, description, source caption fields.
Source language: front matter; `# PART n · Name`; `# n. Title`; `# Title`; `## n.n Title`; `### n.n.n Title`; `{. run-in .}`; `::: type Title ... :::` boxes; `Table:` and `Note:` around a pipe table; `![alt](path){label | desc | source}`; `[[cross-ref]]`; bold, italic, code, superscript.
Fonts: instance EB Garamond and the sans to static weights, set name and style bits, map sans black to weight 800; declare a system fallback chain so a draft compiles unprovisioned. Reuse the Module III install path.
Build: `python3 build_textbook.py source.md /mnt/user-data/outputs/{slug}.pdf`; base URL is the source directory; inspect the render; present the PDF; keep the Markdown source as master. No DOCX for this edition.
Locks: no LaTeX, Unicode math only; no em-dashes; ﷺ as one glyph; no emoji, CSS shapes only; no fragmentation; warrant tier on every claim-bearing box and figure; faithful map, never inflation.

---

# MODULE V·D · THE TEXTBOOK_D (DAVIDSON) VARIANT

A second skin for the Textbook Edition. Where the default Module V renders a calm Rang-and-Dale page, serif body with tinted panels, TextBook_D renders an aggressive Davidson page: sans throughout, solid-colour banner headings, numbered icon boxes typed by colour, and a chapter thumb-tab riding the outer margin. Same content pipeline and the same authoring conventions, a different stylesheet and a Davidson-aware engine. Selected by the token `[EDITION:TEXTBOOK_D]` or front-matter `edition: textbook_d`. It transforms any subject, and any Master Codex volume, into the Davidson register.

## V·D.0 · The Design Read

Davidson's Principles and Practice of Medicine sets a denser, louder page than Rang and Dale, and the difference is systematic. Five elements carry it. First, the type is sans-serif throughout: a humanist grotesque sets the body, the headings, the boxes, the tables, and the captions, with no serif anywhere, which reads as clinical and modern rather than literary. Second, headings are solid colour, not tinted: a major section opens with a filled steel banner carrying white reversed text, where Rang and Dale would use a tint bar with coloured text. Third, the signature element is the numbered icon box: every box carries a chapter-and-box number, a solid colour header bar, a small icon square at the bar's left edge, and a white reversed title, with the body frequently wrapping a full table; the box is the primary unit of organised content and there are many per chapter. Fourth, boxes are typed by colour and icon together, so the reader reads the box's purpose before its words: an information or data box in steel with an i, a practice box in green with a plus, a caution box in red with an exclamation, a special-context box in purple. Fifth, the page carries a coloured chapter thumb-tab in the outer margin, a bound-book index that lets a reader flick to a chapter by colour and number. The grid is two columns, tighter than Rang and Dale, with full-width spanning reserved for the wide table-boxes and figures. Cross-references run in the accent colour as heavy navigation. The whole is more saturated, more boxed, and more directive: the aggression is the boxing and the solid colour, captured by making the box a numbered, icon-marked, colour-typed object and the headings solid banners.

## V·D.1 · The Locked Contract

Sans-serif throughout is the load-bearing rule and is never broken in this variant. The body sets in a humanist grotesque, Archivo as TBSans by default, at 9.8 points on a 1.34 measure, justified and hyphenated; every heading, box, table, caption, chip, and tab sets in the same family at its own weight. Page geometry is US Letter, 612 by 792 points, with the outer margin widened to 66 points to seat the thumb-tab and the inner margin held at 50; the outer margin mirrors, right on recto and left on verso, so the tab always rides the open edge. The grid is two columns with a 22-point gutter, denser than the default edition. The universal locks hold without exception: no LaTeX and all mathematics in Unicode, no em-dashes, the honorific ﷺ as one glyph, no emoji anywhere, every box marker a CSS-drawn square carrying a typed letter rather than an icon image, and no box, figure, or table fragmenting across a break.

## V·D.2 · The Heading Ladder

Four levels below the chapter, matching Davidson. The major-section heading is a solid accent banner with white reversed bold text that may wrap two lines, authored as a level-two heading; it is the loudest mark on the page and is used sparingly for the chapter's main divisions. The sub-section heading is a pale accent bar with bold deep-accent text, authored as a level-three heading. The sub-sub heading is bold deep-accent text with a small accent square at its left and a thin rule beneath, authored as a level-four heading. The run-in is a bold-italic lead phrase that flows into its paragraph. Any heading may carry a numeral, rendered in the deeper accent shade. The banner is the element that reads as Davidson; reserve it for true section breaks and let the bar carry the numbered subsections.

## V·D.3 · The Numbered Icon Box

The signature. A box carries a solid colour header bar; at the bar's left edge a solid white icon square holds a single typed letter in the box colour; the bar then carries the box number and the title in white reversed bold; the body sits below in a pale tint of the box colour and holds paragraphs, lists, or a table. The box is typed by colour and letter together, and the type set is content-agnostic so it serves any subject and any codex. The default information or data box is the accent steel and carries an i; a key or summary box is ochre and carries a star; a definition or concept box is the accent and carries an i; a worked example box carries an e; a practice, application, or procedure box is green and carries a plus; a caution, warning, or emergency box is red and carries an exclamation; a special-context or note box is purple and carries an i. A box whose body contains a wide table spans both columns automatically, which is how Davidson sets its large data boxes; a box of prose or a short list stays within its column. The box number is optional: supply it after the type word and it renders before the title, omit it and the title stands alone.

Codex-native mapping. A Master Codex volume reads the same box set with codex semantics in Tier 2 and may use the permitted glyphs. A verdict or seal block sits in a key box, gold and starred. A PSP or an axiom sits in a definition box. A regime instance or a battery row sits in a worked example box. An operating procedure or a cascade step sits in a practice box, green. An anchor-inflation warning or a typing-discipline lock sits in a caution box, red. A proof-boundary remark or an instrument limit sits in a depth aside. Every claim-bearing box carries its warrant tier exactly as typed, and the faithful-map law holds: the box asserts no more than the codex establishes.

## V·D.4 · Page Furniture

The chapter opener is a solid accent band carrying the chapter number set large in white beside the title in white reversed bold; it spans both columns and the two-column flow begins below it. The chapter thumb-tab is a small solid accent square carrying the chapter number, lifted into the outer side margin by a running element and placed in the right-middle margin box on recto pages and the left-middle on verso, so it rides the open edge of the spread as a bound index. The running header carries the chapter title in deep-accent bold small caps with the page number after a bullet, mirrored to the top-outer corner. The front named page suppresses the header, the tab, and the footer for the table of contents and the part dividers. The table of contents opens with a solid accent banner reading Contents, then part rows in accent small caps and chapter rows linked, with dotted leaders and live page targets resolved against final pagination.

## V·D.5 · Authoring Conventions, the Delta from Module V

The source language is the Textbook Edition's, with three deltas. First, select the variant with `edition: textbook_d` in front matter or the token `[EDITION:TEXTBOOK_D]`. Second, the heading levels map to the Davidson ladder: a level-two heading renders as a solid banner, a level-three heading as a tinted bar, a level-four heading as a square-marked rule head; author the few major sections at level two and the numbered subsections at level three. Third, a box directive may carry a number directly after the type word: `::: info 4.6 Title` renders box 4.6, while `::: practice Title` renders an unnumbered practice box. The box types are `info`, `data`, `key`, `summary`, `definition`, `concept`, `example`, `practice`, `application`, `procedure`, `clinical`, `caution`, `warning`, `emergency`, `note`, and `context`, each mapping to a colour and a letter. A box that contains a pipe table spans both columns; a `Note:` line inside the box body renders as the box footnote. Everything else is unchanged from the Textbook Edition: front matter fields, part and chapter markers, the run-in `{. lead .}`, pipe tables with `Table:` captions, image figures with pipe-separated caption fields, `[[cross-references]]`, and the inline marks. Accent is per-part by default and single house accent, copper or slate, for codex volumes.

## V·D.6 · The Davidson Stylesheet

Page economy and the span rule. Tables, figures, and boxes default to column width and flow inside one column, which packs the dense Davidson grid without stranded space. Full-width spanning is what wastes space: a spanning element closes both columns and the short band above it balances into two stub columns, leaving the gap empty. Spanning is opt-in. Append an asterisk to span a genuinely wide element: `::: type* Title` for a box, `Table*: caption` for a standalone table, `!*[alt](path)` for a figure. A numbered table-box is breakable by default: its data flows down one column and continues at the top of the next with the column header repeated, the coloured box header carried once at the start, so a long audit table fills the column instead of stranding it. Prose and list boxes stay atomic. Think ahead before placing a wide element: prefer column width, reserve spanning for tables too wide to read in a column, and let the breakable column-width table-box carry the long data.

The complete validated stylesheet. Self-contained, compiles under WeasyPrint as written. Save as `textbook_d.css` beside the source; the face block of Module V provisions the sans, and the system fallback chain applies if it is skipped.

```css
/* ===================================================================
   TEXTBOOK_D  ·  Davidson-style master stylesheet  (WeasyPrint-validated)
   Sans throughout · solid-banner headings · numbered icon boxes typed by
   colour · chapter thumb-tab in the outer margin · dense two-column grid
   =================================================================== */

:root{
  --sans:'TBSans','Archivo','Liberation Sans','Noto Sans','DejaVu Sans',sans-serif;
  --ink:#1c1c1c; --soft:#454545; --faint:#737373; --rule:#cdcdcd;
  /* primary accent (Davidson steel), drives chapter tab, banners, bars, xrefs, info boxes */
  --accent:#3E7CA8; --deep:#28567C; --bar:#B7C5D6; --tint:#EAF0F5; --band:#D7E2EC;
  /* semantic box palette */
  --c-info:#3E7CA8;    --t-info:#EAF1F6;
  --c-practice:#4E8A5B; --t-practice:#ECF4ee;
  --c-caution:#C0392B;  --t-caution:#FBECEA;
  --c-note:#8068B0;     --t-note:#F1ECF8;
  --c-key:#B07A1E;      --t-key:#F8F1E2;
}
/* per-PART accent (sets the dominant colour); single-mode books pick one */
.acc-1{--accent:#3E7CA8;--deep:#28567C;--bar:#B7C5D6;--tint:#EAF1F6;--band:#D7E2EC;}
.acc-2{--accent:#4E8A5B;--deep:#33603e;--bar:#BCD3C2;--tint:#ECF4EE;--band:#D5E7DA;}
.acc-3{--accent:#B23A48;--deep:#7e2832;--bar:#E0BDC2;--tint:#FBECEE;--band:#F0D4D8;}
.acc-4{--accent:#3F5C8C;--deep:#2a3f63;--bar:#BDC8DC;--tint:#ECEFF6;--band:#D6DEEF;}
.acc-5{--accent:#B07A1E;--deep:#7c5512;--bar:#DDC9A4;--tint:#F8F1E2;--band:#EFE1C4;}
.acc-6{--accent:#7A4E8C;--deep:#553463;--bar:#CDBBD8;--tint:#F2ECF6;--band:#E4D6EC;}
.acc-copper{--accent:#B87333;--deep:#8a5523;--bar:#E1C9AE;--tint:#FAF3EA;--band:#EFE0CF;}
.acc-slate{--accent:#2C2F33;--deep:#1c1e20;--bar:#C2C4C6;--tint:#ECEDED;--band:#D9DADA;}

/* ---------------- page geometry + furniture ---------------- */
@page{ size:612pt 792pt; margin:54pt 50pt 54pt 50pt; }
@page:right{
  margin-right:66pt;                       /* outer margin holds the thumb tab */
  @top-right{ content:string(dxchap) "  \2022  " counter(page);
    font-family:var(--sans); font-size:8.5pt; font-weight:800; color:var(--deep);
    text-transform:uppercase; letter-spacing:.02em; vertical-align:bottom; padding-bottom:3pt; }
  @right-middle{ content:element(thumb); }
}
@page:left{
  margin-left:66pt;
  @top-left{ content:counter(page) "  \2022  " string(dxchap);
    font-family:var(--sans); font-size:8.5pt; font-weight:800; color:var(--deep);
    text-transform:uppercase; letter-spacing:.02em; vertical-align:bottom; padding-bottom:3pt; }
  @left-middle{ content:element(thumb); }
}
@page front{ @top-left{content:none} @top-right{content:none}
  @right-middle{content:none} @left-middle{content:none} }

html{ font-family:var(--sans); font-size:9.8pt; color:var(--ink); line-height:1.34; }
body{ margin:0; }
p{ margin:0 0 6pt; text-align:justify; hyphens:auto; orphans:2; widows:2; }
ul,ol{ margin:2pt 0 6pt 15pt; padding:0; } li{ margin:0 0 3pt; }
ul{ list-style:none; } ul>li::before{ content:"\25AA\00A0"; color:var(--accent); margin-left:-12pt; }

/* chapter thumb-tab, lifted into the outer side margin */
.dx-thumb{ position:running(thumb); }
.dx-thumb .tabnum{ display:block; width:30pt; height:30pt; line-height:30pt; text-align:center;
  background:var(--accent); color:#fff; font-family:var(--sans); font-weight:800; font-size:14pt;
  border-radius:3pt; }

/* ---------------- PART divider ---------------- */
.part-divider{ break-before:page; break-after:page; height:640pt; page:front;
  display:flex; flex-direction:column; justify-content:center; }
.part-divider .pnum{ font-family:var(--sans); font-weight:800; font-size:14pt; color:var(--accent);
  letter-spacing:.16em; text-transform:uppercase; }
.part-divider .pbar{ height:10pt; background:var(--accent); width:56%; margin:10pt 0 16pt; }
.part-divider .ptitle{ font-family:var(--sans); font-weight:800; font-size:32pt; line-height:1.05; color:var(--ink); }
.part-divider .pblurb{ font-family:var(--sans); font-size:11.5pt; color:var(--soft); margin-top:14pt; max-width:80%; }

/* ---------------- CHAPTER opener ---------------- */
.chapter + .chapter{ break-before:page; }
.chapter-open{ break-before:page; margin:0 0 13pt; }
.chapter-open .cband{ background:var(--accent); padding:16pt 18pt; display:flex; align-items:center; gap:18pt; }
.chapter-open .cnum{ font-family:var(--sans); font-weight:800; font-size:52pt; line-height:.85; color:#fff; }
.chapter-open .ctitle{ font-family:var(--sans); font-weight:800; font-size:25pt; line-height:1.04; color:#fff; string-set:dxchap content(); }
.chapter-open h1.cplain{ font-family:var(--sans); font-weight:800; font-size:23pt; color:#fff;
  background:var(--accent); padding:13pt 16pt; margin:0; string-set:dxchap content(); }

/* ---------------- two-column body ---------------- */
.cols{ column-count:2; column-gap:22pt; }

/* ---------------- heading ladder ---------------- */
/* H2 = solid banner (major section), white reversed */
h2{ font-family:var(--sans); font-weight:800; font-size:12.5pt; line-height:1.12; color:#fff;
  background:var(--accent); padding:6pt 10pt; margin:13pt 0 8pt; break-after:avoid; }
h2 .num{ color:#fff; opacity:.85; margin-right:8pt; }
/* H3 = tinted bar (sub-section), bold deep text */
h3{ font-family:var(--sans); font-weight:800; font-size:10.8pt; color:var(--deep);
  background:var(--bar); padding:4pt 9pt; margin:12pt 0 6pt; break-after:avoid; }
h3 .num{ color:var(--deep); margin-right:7pt; }
/* H4 = square-marked underlined head (sub-sub) */
h4{ font-family:var(--sans); font-weight:800; font-size:10.4pt; color:var(--deep);
  border-bottom:1pt solid var(--bar); padding:0 0 3pt; margin:11pt 0 5pt; break-after:avoid; }
h4::before{ content:""; display:inline-block; width:8pt; height:8pt; background:var(--accent);
  margin-right:7pt; vertical-align:middle; }
/* run-in C-head */
.runin{ font-family:var(--sans); font-style:italic; font-weight:800; color:var(--ink); }

/* ---------------- inline semantics ---------------- */
strong,b{ font-weight:800; } em,i{ font-style:italic; }
.xref{ color:var(--accent); font-weight:600; } a,a.xref{ color:var(--accent); text-decoration:none; }
sup{ font-size:.7em; line-height:0; }

/* ---------------- NUMBERED ICON BOX (the Davidson signature) ---------------- */
.dx-box{ --bc:var(--c-info); --bt:var(--t-info); break-inside:avoid; border:0.7pt solid var(--bc);
  margin:9pt 0; }
.dx-box.practice{ --bc:var(--c-practice); --bt:var(--t-practice); }
.dx-box.caution { --bc:var(--c-caution);  --bt:var(--t-caution); }
.dx-box.note    { --bc:var(--c-note);     --bt:var(--t-note); }
.dx-box.key     { --bc:var(--c-key);      --bt:var(--t-key); }
.dx-box .dxhead{ background:var(--bc); color:#fff; font-family:var(--sans); font-weight:800;
  font-size:9.6pt; padding:0; margin:0; display:flex; align-items:stretch; }
.dx-box .dxicon{ flex:0 0 auto; width:19pt; min-height:19pt; background:#fff;
  color:var(--bc); font-weight:800; font-size:11pt; text-align:center; line-height:19pt; font-style:normal; }
.dx-box .dxttl{ padding:4pt 9pt; }
.dx-box .dxttl .dxnum{ margin-right:7pt; }
.dx-box .dxbody{ background:var(--bt); padding:7pt 10pt; }
.dx-box .dxbody p{ text-align:left; margin:0 0 5pt; }
.dx-box .dxbody ul{ margin:0 0 0 14pt; } .dx-box .dxbody ul>li::before{ color:var(--bc); }
/* table living inside a box: tighten to the box */
.dx-box .dxbody table{ width:100%; border-collapse:collapse; font-size:8.6pt; margin:2pt 0; }
.dx-box .dxbody thead th{ text-align:left; font-weight:800; color:var(--deep);
  border-bottom:1.2pt solid var(--bc); padding:3pt 6pt; }
.dx-box .dxbody tbody td{ padding:3pt 6pt; border-bottom:0.4pt solid var(--rule); vertical-align:top; }
.dx-box .dxbody .tnote{ font-size:7.6pt; color:var(--soft); font-style:italic; padding-top:4pt; }
/* a box that wraps a wide table spans both columns */
.dx-box.span{ column-span:all; break-inside:avoid; }
.dx-box.flow{ break-inside:auto; }
.dx-box.flow .dxbody{ break-inside:auto; }
.dx-box.flow .dxbody table{ break-inside:auto; }
.dx-box.flow .dxbody thead{ display:table-header-group; }

/* ---------------- small-print aside (▼) ---------------- */
.aside{ font-size:8.6pt; color:var(--soft); text-align:justify; margin:6pt 0; }
.aside::before{ content:"\25BC\2002"; color:var(--ink); font-size:7pt; }

/* ---------------- spanning standalone table ---------------- */
.tb-table{ margin:11pt 0; break-inside:auto; }
.tb-table.span{ column-span:all; break-inside:avoid; }
.tb-table table{ width:100%; border-collapse:collapse; font-family:var(--sans); font-size:8.7pt; }
.tb-table caption{ caption-side:top; font-family:var(--sans); font-weight:800; color:#fff;
  background:var(--accent); font-size:9pt; padding:4pt 9pt; text-align:left; }
.tb-table thead th{ background:var(--band); color:var(--deep); text-align:left; font-weight:800;
  padding:4pt 7pt; border-bottom:1.2pt solid var(--accent); }
.tb-table tbody td{ padding:4pt 7pt; border-bottom:0.4pt solid var(--rule); vertical-align:top; }
.tb-table tbody tr:nth-child(even) td{ background:var(--tint); }
.tb-table .tnote{ font-family:var(--sans); font-size:7.6pt; color:var(--soft); padding:4pt 2pt 0; }

/* ---------------- spanning figure ---------------- */
.tb-fig{ break-inside:avoid; margin:12pt 0; }
.tb-fig.span{ column-span:all; }
.tb-fig.col{ column-span:none; }
.tb-fig .frame{ border:0.6pt solid var(--rule); background:#fff; padding:10pt; text-align:center; }
.tb-fig img{ max-width:100%; height:auto; }
.tb-fig figcaption{ font-family:var(--sans); font-size:8.5pt; color:var(--soft); margin-top:6pt; text-align:left; }
.tb-fig figcaption .flabel{ font-weight:800; color:var(--accent); }
.tb-fig figcaption .fsrc{ font-style:italic; }

/* ---------------- references / reading ---------------- */
.tb-refs .ref{ font-family:var(--sans); font-size:8.5pt; text-indent:-12pt; padding-left:12pt;
  margin:0 0 5pt; text-align:left; }
.tb-refs .ref .anno{ font-style:italic; color:var(--soft); }

/* ---------------- table of contents ---------------- */
.toc{ page:front; break-after:page; }
.toc h1{ font-family:var(--sans); font-size:17pt; font-weight:800; text-transform:uppercase;
  letter-spacing:.04em; color:#fff; background:var(--accent); padding:7pt 11pt; margin:0 0 14pt; }
.toc .row{ font-family:var(--sans); font-size:10pt; display:flex; align-items:baseline; margin:0 0 5pt; }
.toc .row.part{ font-weight:800; text-transform:uppercase; font-size:9.5pt; letter-spacing:.05em;
  color:var(--accent); margin-top:11pt; }
.toc a{ color:var(--ink); text-decoration:none; }
.toc a::after{ content:leader('.') target-counter(attr(href), page); color:var(--faint); }

/* ---------------- title-page cover (Davidson) ---------------- */
.cover{ page:front; break-after:page; min-height:8.7in; display:flex; flex-direction:column;
  justify-content:center; align-items:center; text-align:center; padding:0 0.5in; }
.cover .ctop{ flex:0 0 auto; width:100%; }
.cover .cbot{ flex:0 0 auto; margin-top:0.85in; width:100%; }
.cover .cband{ display:inline-block; background:var(--accent); padding:6pt 16pt; margin:0 0 20pt; }
.cover .cband .ccat{ font-family:var(--sans); font-weight:800; text-transform:uppercase; letter-spacing:.14em;
  font-size:10pt; color:#fff; }
.cover .ctitle{ font-family:var(--sans); font-weight:800; font-size:31pt; line-height:1.05;
  letter-spacing:-.01em; color:var(--ink); margin:0; max-width:8in; }
.cover .csub{ font-family:var(--serif); font-style:italic; font-size:15pt; line-height:1.3; color:var(--deep);
  margin:16pt auto 0; max-width:6.2in; }
.cover .cmeta{ margin:16pt 0 0; }
.cover .cgoal{ font-family:var(--serif); font-style:italic; font-size:11.5pt; color:var(--deep); }
.cover .cseries{ font-family:var(--sans); font-size:8pt; text-transform:uppercase; letter-spacing:.09em;
  color:var(--faint); margin-top:7pt; }
.cover .arule{ width:26%; height:2.4pt; background:var(--accent); margin:0 auto 10pt; }
.cover .aname{ font-family:var(--sans); font-weight:700; letter-spacing:.04em; font-size:13pt; color:var(--ink); }
.cover .ameta{ font-family:var(--serif); font-style:italic; font-size:10pt; color:var(--faint); margin-top:3pt; }
.cover .cdate{ font-family:var(--serif); font-style:italic; font-size:9.5pt; color:var(--faint); margin-top:4pt; }
```

## V·D.7 · The Davidson Build Engine

The Davidson-aware engine. It shares the Textbook Edition's parsing of front matter, parts, chapters, run-ins, pipe tables, figures, cross-references, and inline marks, and adds the Davidson rendering: level-two to level-four headings become banner, bar, and square heads; the box directive parses an optional number and renders the numbered icon box with its typed colour and letter; a box wrapping a table is given the spanning class; the chapter opener emits the solid band and the outer-margin thumb-tab running element; the running header binds to the chapter title. Save as `build_textbook_d.py`. Build with `python3 build_textbook_d.py source.md /mnt/user-data/outputs/{slug}.pdf`, the base URL the source directory, then inspect the render: confirm the banners, the numbered icon boxes with solid white glyph squares, the spanning table-boxes, the outer-margin thumb-tab mirrored recto and verso, and the contents page numbers. Present the PDF and keep the Markdown source as master.

```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
TEXTBOOK_D build engine (Davidson style).
Compiles one Markdown source to a dense two-column, solid-banner, numbered-icon-box
PDF via WeasyPrint. Sans throughout; chapter thumb-tab in the outer margin.

Usage:  python3 build_textbook_d.py source.md [out.pdf]
Source dir must contain textbook_d.css (and optionally face.css + fonts/).
"""
import sys, os, re, html, pathlib

ACC_CYCLE = ["acc-1","acc-2","acc-3","acc-4","acc-5","acc-6"]
ROMAN = {'I':1,'V':5,'X':10,'L':50,'C':100,'D':500,'M':1000}

# box type -> (css class, icon letter)
BOXMAP = {
  'info':('','i'), 'data':('','i'), 'key':('key','\u2605'), 'summary':('key','\u2605'),
  'definition':('','i'), 'concept':('','i'), 'example':('','e'),
  'practice':('practice','+'), 'application':('practice','+'), 'procedure':('practice','+'),
  'clinical':('practice','+'),
  'caution':('caution','!'), 'warning':('caution','!'), 'emergency':('caution','!'),
  'note':('note','i'), 'context':('note','i'),
}

def roman_to_int(s):
    s=s.upper(); n=0; p=0
    for ch in reversed(s):
        if ch not in ROMAN: return None
        v=ROMAN[ch]; n+=v if v>=p else -v; p=v
    return n

def slug(s):
    s=re.sub(r'<[^>]+>','',s); s=re.sub(r'[^A-Za-z0-9]+','-',s).strip('-').lower()
    return s or 'sec'

def parse_front(text):
    fm={}; m=re.match(r'^---\s*\n(.*?)\n---\s*\n',text,re.S); body=text
    if m:
        for line in m.group(1).splitlines():
            if ':' in line: k,v=line.split(':',1); fm[k.strip()]=v.strip()
        body=text[m.end():]
    return fm, body

def inline(s):
    s=html.escape(s, quote=False)
    s=re.sub(r'\[\[(.+?)\]\]', r'<span class="xref">\1</span>', s)
    s=re.sub(r'\*\*(.+?)\*\*', r'<strong>\1</strong>', s)
    s=re.sub(r'(?<!\*)\*(?!\*)(.+?)(?<!\*)\*(?!\*)', r'<em>\1</em>', s)
    s=re.sub(r'`(.+?)`', r'<code>\1</code>', s)
    s=re.sub(r'\^(\w+)\^', r'<sup>\1</sup>', s)
    return s

def render_blocks(lines):
    out=[]; i=0; n=len(lines)
    while i<n:
        ln=lines[i]
        if not ln.strip(): i+=1; continue
        if re.match(r'^\s*[-*\u2022]\s+', ln):
            items=[]
            while i<n and re.match(r'^\s*[-*\u2022]\s+', lines[i]):
                items.append(inline(re.sub(r'^\s*[-*\u2022]\s+','',lines[i]).rstrip())); i+=1
            out.append('<ul>'+''.join(f'<li>{x}</li>' for x in items)+'</ul>'); continue
        if re.match(r'^\s*\d+\.\s+', ln):
            items=[]
            while i<n and re.match(r'^\s*\d+\.\s+', lines[i]):
                items.append(inline(re.sub(r'^\s*\d+\.\s+','',lines[i]).rstrip())); i+=1
            out.append('<ol>'+''.join(f'<li>{x}</li>' for x in items)+'</ol>'); continue
        mrun=re.match(r'^\{\.\s*(.+?)\s*\.?\s*\}\s*(.*)$', ln)   # tolerant close: .} / . } / }
        if mrun:
            out.append(f'<span class="runin">{inline(mrun.group(1))}.</span> ')
            buf=[mrun.group(2).rstrip()] if mrun.group(2).strip() else []
            i+=1
            while i<n and lines[i].strip() and not re.match(r'^\s*([-*\u2022]|\d+\.)\s+', lines[i]) \
                  and not lines[i].startswith(':::') and not re.match(r'^\{\.', lines[i]):
                buf.append(lines[i].rstrip()); i+=1
            out[-1]='<p>'+out[-1]+inline(' '.join(buf))+'</p>'; continue
        buf=[ln.rstrip()]; i+=1
        while i<n and lines[i].strip() and not re.match(r'^\s*([-*\u2022]|\d+\.)\s+', lines[i]) \
              and not lines[i].startswith(':::') and not re.match(r'^\{\.', lines[i]):
            buf.append(lines[i].rstrip()); i+=1
        out.append('<p>'+inline(' '.join(buf))+'</p>')
    return ''.join(out)

def render_table_rows(tbl_lines, in_box=False):
    rows=[r for r in tbl_lines if r.strip()]
    cells=[[c.strip() for c in re.split(r'(?<!\\)\|', r.strip().strip('|'))] for r in rows]
    body=[c for c in cells if not all(re.fullmatch(r':?-{2,}:?', x or '-') for x in c)]
    head=body[0] if body else []; data=body[1:] if len(body)>1 else []
    h='<thead><tr>'+''.join(f'<th>{inline(x)}</th>' for x in head)+'</tr></thead>'
    b='<tbody>'+''.join('<tr>'+''.join(f'<td>{inline(x)}</td>' for x in r)+'</tr>' for r in data)+'</tbody>'
    return h+b

def render_table(tbl_lines, caption=None, note=None, span=False):
    cap=f'<caption>{inline(caption)}</caption>' if caption else ''
    nt=f'<div class="tnote">{inline(note)}</div>' if note else ''
    sp=' span' if span else ''
    return f'<div class="tb-table{sp}"><table>{cap}{render_table_rows(tbl_lines)}</table>{nt}</div>'

def render_figure(alt, path, brace, span=False):
    label=src=''; bodytxt=brace or alt
    if brace and '|' in brace:
        parts=[p.strip() for p in brace.split('|')]
        label=parts[0] if len(parts)>0 else ''
        bodytxt=parts[1] if len(parts)>1 else ''
        src=parts[2] if len(parts)>2 else ''
    cap=''
    if label: cap+=f'<span class="flabel">{inline(label)}</span> '
    cap+=inline(bodytxt)
    if src: cap+=f' <span class="fsrc">({inline(src)})</span>'
    sp=' span' if span else ''
    return (f'<div class="tb-fig{sp}"><div class="frame"><img src="{html.escape(path)}" alt="{html.escape(alt)}"></div>'
            f'<figcaption>{cap}</figcaption></div>')

def render_box(kind, number, title, body_lines, span=False):
    if kind=='note' and not title and not number:
        return f'<p class="aside">{render_blocks(body_lines).replace("<p>","").replace("</p>"," ")}</p>'
    if kind=='reading':
        rows=[]
        for ln in body_lines:
            if not ln.strip(): continue
            if ' -- ' in ln:
                cit,anno=ln.split(' -- ',1)
                rows.append(f'<div class="ref">{inline(cit.strip())} <span class="anno">{inline(anno.strip())}</span></div>')
            else: rows.append(f'<div class="ref">{inline(ln.strip())}</div>')
        return ''.join(rows)
    cls,icon = BOXMAP.get(kind, ('','i'))
    # detect an embedded table inside the box body
    span=''; inner=''
    has_table = any(l.lstrip().startswith('|') for l in body_lines)
    if has_table:
        # split body into pre-text, table, post-text
        i=0; n=len(body_lines); chunks=[]
        while i<n:
            if body_lines[i].lstrip().startswith('|'):
                tl=[]
                while i<n and body_lines[i].lstrip().startswith('|'): tl.append(body_lines[i]); i+=1
                note=None
                if i<n and re.match(r'^Note:\s*(.+)$', body_lines[i]):
                    note=re.match(r'^Note:\s*(.+)$', body_lines[i]).group(1).strip(); i+=1
                chunks.append('<table>'+render_table_rows(tl,True)+'</table>'+(f'<div class="tnote">{inline(note)}</div>' if note else ''))
            else:
                tx=[]
                while i<n and not body_lines[i].lstrip().startswith('|'): tx.append(body_lines[i]); i+=1
                if any(x.strip() for x in tx): chunks.append(render_blocks(tx))
        inner=''.join(chunks)
    else:
        inner=render_blocks(body_lines)
    span_cls=' span' if span else (' flow' if has_table else '')
    num=f'<span class="dxnum">{html.escape(number)}</span>' if number else ''
    head=(f'<div class="dxhead"><span class="dxicon">{icon}</span>'
          f'<span class="dxttl">{num}{inline(title)}</span></div>')
    return f'<div class="dx-box {cls}{span_cls}">{head}<div class="dxbody">{inner}</div></div>'

def build_html(fm, body, cssfiles):
    single = fm.get('accent_mode','per-part')=='single'
    single_acc = fm.get('single_accent','acc-1')
    if not single_acc.startswith('acc-'): single_acc='acc-'+single_acc
    toc_on = fm.get('toc','on').lower() in ('on','true','yes','1')

    lines=body.splitlines(); i=0; n=len(lines)
    parts=[]; html_parts=[]; part_idx=0
    cur_acc = single_acc if single else 'acc-1'
    open_chapter=False; chap_buf=[]

    def flush_chapter():
        nonlocal chap_buf, open_chapter
        if open_chapter:
            html_parts.append('<div class="cols">'+''.join(chap_buf)+'</div></section>')
            chap_buf=[]; open_chapter=False

    while i<n:
        ln=lines[i]
        mp=re.match(r'^#\s+PART\s+([IVXLCDM]+|\d+)\s*[\u00b7\u2014\-\.:]?\s*(.*)$', ln, re.I)
        if mp:
            flush_chapter(); num=mp.group(1); name=mp.group(2).strip(); part_idx+=1
            if not single: cur_acc=ACC_CYCLE[(part_idx-1)%len(ACC_CYCLE)]
            pid='part-'+slug(num+'-'+name)
            parts.append(('part',pid,f'Part {num} &#183; {name}' if name else f'Part {num}'))
            html_parts.append(f'<section class="part-divider {cur_acc}" id="{pid}">'
                f'<div class="pnum">Part {html.escape(num)}</div><div class="pbar"></div>'
                f'<div class="ptitle">{inline(name)}</div></section>')
            i+=1; continue
        mc=re.match(r'^#\s+(\d+)\.\s+(.+)$', ln)
        if mc:
            flush_chapter(); cnum=mc.group(1); ctitle=mc.group(2).strip()
            cid='ch-'+slug(cnum+'-'+ctitle); parts.append(('chapter',cid,f'{cnum} &#183; {ctitle}'))
            html_parts.append(f'<section class="chapter {cur_acc}" id="{cid}">'
                f'<div class="chapter-open"><div class="cband"><div class="cnum">{html.escape(cnum)}</div>'
                f'<div class="ctitle">{inline(ctitle)}</div></div></div>'
                f'<div class="dx-thumb"><span class="tabnum">{html.escape(cnum)}</span></div>')
            open_chapter=True; i+=1; continue
        m1=re.match(r'^#\s+(.+)$', ln)
        if m1:
            flush_chapter(); t=m1.group(1).strip(); cid='ch-'+slug(t)
            parts.append(('chapter',cid,t))
            html_parts.append(f'<section class="chapter {cur_acc}" id="{cid}">'
                f'<div class="chapter-open"><h1 class="cplain">{inline(t)}</h1></div>'
                f'<div class="dx-thumb"><span class="tabnum">&#9679;</span></div>')
            open_chapter=True; i+=1; continue
        # directive box: ::: type [number] Title
        md=re.match(r'^:::\s*(\w+)(\*?)\s*(.*)$', ln)
        if md:
            kind=md.group(1).lower(); bspan=md.group(2)=='*'; rest=md.group(3).strip()
            num=''; mnum=re.match(r'^([\dA-Za-z]+\.[\d]+[A-Za-z]?|\d+[A-Za-z]?)\s+(.*)$', rest)
            if mnum and re.search(r'\d', mnum.group(1)):
                num=mnum.group(1); title=mnum.group(2).strip()
            else: title=rest
            j=i+1; bl=[]
            while j<n and not lines[j].strip()==':::': bl.append(lines[j]); j+=1
            frag=render_box(kind, num, title, bl, span=bspan)
            (chap_buf if open_chapter else html_parts).append(frag); i=j+1; continue
        # table with optional caption/note
        cap=None; tspan=False; mcapt=re.match(r'^Table(\*?):\s*(.+)$', ln); look=i
        if mcapt: tspan=mcapt.group(1)=='*'; cap=mcapt.group(2).strip(); look=i+1
        if look<n and lines[look].lstrip().startswith('|'):
            tl=[]; k=look
            while k<n and lines[k].lstrip().startswith('|'): tl.append(lines[k]); k+=1
            note=None
            if k<n and re.match(r'^Note:\s*(.+)$', lines[k]):
                note=re.match(r'^Note:\s*(.+)$', lines[k]).group(1).strip(); k+=1
            frag=render_table(tl, cap, note, span=tspan)
            (chap_buf if open_chapter else html_parts).append(frag); i=k; continue
        # figure
        mf=re.match(r'^!(\*?)\[(.*?)\]\((.*?)\)(?:\{(.*?)\})?\s*$', ln)
        if mf:
            (chap_buf if open_chapter else html_parts).append(render_figure(mf.group(2),mf.group(3),mf.group(4),span=mf.group(1)=='*')); i+=1; continue
        # headings
        mh2=re.match(r'^##\s+(.+)$', ln); mh3=re.match(r'^###\s+(.+)$', ln); mh4=re.match(r'^####\s+(.+)$', ln)
        if mh4:
            t=mh4.group(1).strip(); mnum=re.match(r'^(\d+(?:\.\d+)+)\s+(.+)$', t)
            frag=f'<h4><span class="num">{mnum.group(1)}</span>{inline(mnum.group(2))}</h4>' if mnum else f'<h4>{inline(t)}</h4>'
            (chap_buf if open_chapter else html_parts).append(frag); i+=1; continue
        if mh3:
            t=mh3.group(1).strip(); mnum=re.match(r'^(\d+(?:\.\d+)+)\s+(.+)$', t)
            frag=f'<h3><span class="num">{mnum.group(1)}</span>{inline(mnum.group(2))}</h3>' if mnum else f'<h3>{inline(t)}</h3>'
            (chap_buf if open_chapter else html_parts).append(frag); i+=1; continue
        if mh2:
            t=mh2.group(1).strip(); mnum=re.match(r'^(\d+(?:\.\d+)*)\s+(.+)$', t)
            frag=f'<h2><span class="num">{mnum.group(1)}</span>{inline(mnum.group(2))}</h2>' if mnum else f'<h2>{inline(t)}</h2>'
            (chap_buf if open_chapter else html_parts).append(frag); i+=1; continue
        # ordinary block
        buf=[ln]; i+=1
        while i<n and lines[i].strip() and not lines[i].startswith(':::') and not re.match(r'^#', lines[i]) \
              and not lines[i].lstrip().startswith('|') and not re.match(r'^(Table\*?:|Note:|!\*?\[)', lines[i]):
            buf.append(lines[i]); i+=1
        (chap_buf if open_chapter else html_parts).append(render_blocks(buf))

    flush_chapter()

    toc=''
    if toc_on and parts:
        rows=['<h1>Contents</h1>']
        for lvl,pid,label in parts:
            rows.append(f'<div class="row part">{label}</div>' if lvl=='part'
                        else f'<div class="row"><a href="#{pid}">{label}</a></div>')
        toc=f'<nav class="toc {single_acc if single else ACC_CYCLE[0]}">'+''.join(rows)+'</nav>'
    # ----- title-page cover (front matter) -----
    import re as _rc
    _cv_name = fm.get('author','').strip() or _rc.sub(r'\^\d+\^','',fm.get('author_line','')).split(',')[0].strip()
    _cv_cat  = fm.get('category', fm.get('article_type',''))
    _cv_goal = fm.get('goal', fm.get('tagline',''))
    _cv_ser  = fm.get('series', fm.get('doi',''))
    _cv_sub  = fm.get('subtitle',''); _cv_date=fm.get('date',''); _cv_aff=fm.get('affiliation','')
    _cv_title= fm.get('title','')
    _cv_acc  = single_acc if single else ACC_CYCLE[0]
    cover=''
    if _cv_title:
        _cs=''
        if _cv_cat:  _cs+=f'<div class="ccat">{inline(_cv_cat)}</div>'
        if _cv_goal: _cs+=f'<div class="cgoal">{inline(_cv_goal)}</div>'
        if _cv_ser:  _cs+=f'<div class="cseries">{inline(_cv_ser)}</div>'
        cover=(f'<div class="cover {_cv_acc}"><div class="ctop"><div class="cband"><div class="ccat">{inline(_cv_cat)}</div></div>'
               f'<h1 class="ctitle">{inline(_cv_title)}</h1>'
               + (f'<div class="csub">{inline(_cv_sub)}</div>' if _cv_sub else '')
               + (f'<div class="cmeta">' + (f'<div class="cgoal">{inline(_cv_goal)}</div>' if _cv_goal else '') + (f'<div class="cseries">{inline(_cv_ser)}</div>' if _cv_ser else '') + '</div>' if (_cv_goal or _cv_ser) else '')
               + '</div><div class="cbot"><div class="arule"></div>'
               + f'<div class="aname">{inline(_cv_name)}</div>'
               + (f'<div class="ameta">{inline(_cv_aff)}</div>' if _cv_aff else '')
               + (f'<div class="cdate">{inline(_cv_date)}</div>' if _cv_date else '')
               + '</div></div>')
    links=''.join(f'<link rel="stylesheet" href="{html.escape(c)}">' for c in cssfiles)
    title=fm.get('title','')
    return (f'<!DOCTYPE html><html><head><meta charset="utf-8"><title>{html.escape(title)}</title>'
            f'{links}</head><body>{cover}{toc}{"".join(html_parts)}</body></html>')

def main():
    if len(sys.argv)<2: print("usage: build_textbook_d.py source.md [out.pdf]"); sys.exit(1)
    src=pathlib.Path(sys.argv[1]).resolve(); text=src.read_text(encoding='utf-8')
    fm, body = parse_front(text); srcdir=src.parent
    css=[]
    if (srcdir/'face.css').exists(): css.append('face.css')
    css.append('textbook_d.css')
    doc=build_html(fm, body, css)
    (srcdir/'_textbook_d.html').write_text(doc, encoding='utf-8')
    out_pdf=pathlib.Path(sys.argv[2]) if len(sys.argv)>2 else srcdir/'textbook_d.pdf'
    from weasyprint import HTML
    HTML(string=doc, base_url=str(srcdir)).write_pdf(str(out_pdf))
    print("PDF:", out_pdf)

if __name__=='__main__': main()
```

## V·D.8 · Codex-Native Davidson

A Master Codex volume in the Davidson register sets `edition: textbook_d` with `accent_mode: single` and `single_accent: copper` or `single_accent: slate`, so the volume reads in one sealed house colour with the full Davidson furniture, the banners, the numbered icon boxes, and the thumb-tab all in copper or slate. The verdict glyphs appear as bare text glyphs inside boxes per the Module IV discipline. The box mapping of Section V·D.3 carries codex content: verdicts in gold key boxes, PSPs and axioms in definition boxes, regime instances in worked example boxes, procedures and cascade steps in green practice boxes, anchor-inflation and typing locks in red caution boxes, proof-boundary remarks in depth asides. Where a chapter must read in a distinct colour, set `accent_mode: per-part` and the thumb-tab, banners, and bars recolour per Part while the semantic box colours, green for practice, red for caution, hold across the whole volume. The faithful-map law and honest typing govern as everywhere: a box stating a result types it Type T, Type C, or Type S, and overclaiming a warrant grade in a box header is the same failure it is in prose.

## V·D.9 · Pre-Flight and Gate Integration

A TextBook_D deliverable passes the standard pre-delivery gate sequence and, for a codex volume, produces the V-FIO Diagnostic Log exactly as the default edition. Before presentation it passes a short structural checklist. The body and every element of furniture set in the sans, with no serif anywhere. Every box carries its colour and its typed letter square, and every wide table-box spans the page. The chapter thumb-tab rides the outer margin and mirrors recto and verso, and the running header binds the live chapter title. Every banner is a true major-section break, not an over-used decoration. The contents page numbers resolve against final pagination, and every figure embeds. Every claim-bearing box and figure carries its warrant tier with no inflation. Failure of any item returns the book for repair before any presentation.

## V·D Quick Reference Card

Variant selector: `[EDITION:TEXTBOOK_D]`, `[EDITION:TEXTBOOK_B]`, or front-matter `edition: textbook_d` / `edition: textbook_b`; addressable in prose as TextBookB. Auto-selected for codex and master deliverables whose content is strongly instructional or box- and table-heavy. A skin over the Textbook Edition; the two editions and the Module III paper renderer never co-fire.
Type: sans-serif throughout, Archivo as TBSans, 9.8 pt body. Never any serif. Dense two-column grid, 22 pt gutter.
Page: US Letter 612 by 792, margins 54 / 50 / 54 with the outer margin widened to 66 pt for the thumb-tab, mirrored to the open edge.
Accent: per-part six-hue cycle, or single copper or slate for the house. Drives the chapter band, thumb-tab, banners, bars, square marks, cross-references, and the info and key boxes. Semantic box colours, green practice and red caution, hold across the volume.
Headings: level-two solid banner, level-three tinted bar, level-four square-marked rule head, run-in bold-italic lead. Reserve the banner for true section breaks.
Boxes: numbered icon box, solid colour header with a white glyph square and white reversed number and title. Types info and data and definition and concept in accent with i, key and summary in gold with a star, example with e, practice and application and procedure in green with a plus, caution and warning and emergency in red with an exclamation, note and context in purple. A box wrapping a table spans both columns.
Furniture: solid-band chapter opener with large white numeral; thumb-tab in the outer margin mirrored recto and verso; deep-accent running header with the chapter title and page; front named page suppresses furniture on contents and dividers; contents banner with leaders.
Source language: the Textbook Edition's, with `edition: textbook_d`, the level two to four heading ladder mapping to banner, bar, and square, and `::: type [number] Title` boxes. Everything else identical.
Build: `python3 build_textbook_d.py source.md /mnt/user-data/outputs/{slug}.pdf`; base URL the source directory; inspect the render; present the PDF; keep the Markdown source as master. No DOCX for this variant.
Locks: no LaTeX, Unicode math only; no em-dashes; ﷺ as one glyph; no emoji, CSS glyph squares only; no fragmentation; warrant tier on every claim-bearing box and figure; faithful map, never inflation.

---

# MODULE VI · THE PAPER-UPGRADE SUBROUTINE (RE-FORGE PROTOCOL)

Purpose. Reforge an existing Geometric Trisduction paper into a hardened single-voice replacement that preserves the original's spine, schema, and verdicts maximally, tightens the language, removes loose and imprecise claims, and fortifies the mathematics to its honest warrant grade. The output reads as one paper that was always this paper. No revision history. This module composes through the existing edition routing; it is not itself an edition.

Trigger. Token [UPGRADE]. Phrases: update paper, upgrade paper, re-forge paper, reforge paper, fortify paper, harden paper, modernize paper, bring the paper up to current law, replace this paper with a hardened edition, and any request pointing at an existing paper (URL or file) with intent to issue a stronger replacement of it.

## VI.A · The Preservation Lock

The spine, the schema, and the verdicts are preserved by default. The burden is on a change to justify itself, never on preservation. Three objects carry forward intact unless a change earns its place against this lock.

The spine. The paper's thesis and rhetorical arc, the order in which it makes its case, the framing that makes the argument land.

The schema. The section architecture, the part division, the table and figure placement, the titling. Section order is held. A section is added only to carry genuinely new mass and removed only when it carried a claim now cut for imprecision.

The verdicts. Every seal [⟀], break [X], under-determined [?], and survivable [△] the paper issues, with its conclusion. A verdict moves only on new structural argument or new mathematical mass outside the existing span, never on reframing. This is the Revision Mandate, binding here. An author-authorized claim, a stress-tested position the architect has placed under standing permission, is never stripped. If it was over-typed it is re-typed to its honest grade and kept in full force at that grade. It is not softened toward orthodoxy and it is not removed.

## VI.B · The Warrant-Rectification Pass

Walk every claim and re-type it to its honest grade. Three operations, applied symmetrically.

Pull-back. An over-typed claim is pulled to the grade it actually earns. Theorem-grade rhetoric on premise-grade content, a corroboration stated as load-bearing, an exhibit stated as a bijection, a definitional closure stated as a proof: each is pulled back. Anchor inflation in the sealing direction is the named target.

Promotion. Content that is genuinely theorem-grade but was buried, hedged, or stated below grade is surfaced and stated at grade. Under-claim is a defect symmetric to over-claim.

Fortification. Where the spine rests on weak scaffolding, a scorecard, an analogy, an appeal, an enumeration that cannot survive self-application, supply or strengthen a theorem-grade core that carries the same conclusion. The original's argument is kept and a load-bearing floor is placed under it, so the conclusion survives being turned on itself. Hardening is always correct. Watering down toward orthodoxy is never correct. The discipline is symmetric: credit genuine mass, refuse to inflate it.

## VI.C · Language Tightening and the Loose-Claim Cut

Remove loose and imprecise claims. Purge any apologetic or outside-reader register; it is incompatible with the single native voice and is a corruption to be cut, not balanced. Cut hedging, redundancy, and any sentence that overstates reach. A decline for want of purchase is stated as method-silence about the instrument's reach, never as a claim that the object is empty or structureless. Every quantity and every verdict carries its warrant tier in the rebuilt text. Telegraphic density, paragraphs over bullets, no em-dashes, periods between thoughts.

## VI.D · Numerical Rectification

Every structural claim that cites a number is reproduced at a fixed seed before it ships, and the worked validation travels with the claim. A number the upgrade cannot reproduce is cut or marked not reached. A numerical trace for a stage the audit did not reach is forbidden. Where the original carried a stale or wrong constant, the corrected value is integrated silently as standing law, never flagged as a correction.

## VI.E · Silent Integration and Single Voice

Every fix lands as native discipline under the Module II Silent-Integration Protocol. No revised, no previously, no this version, no the earlier paper, no now corrected, no version or evolution marker anywhere in the body. The paper speaks once. Gate 1 of the gate sequence enforces this on the rebuilt artifact.

## VI.F · Edition, Build, and Delivery

Compose through the existing edition routing. Default to the edition the original used; a published paper re-forges as the Professional Journal Paper edition (Module III·J) unless an explicit selector says otherwise. Secular body for a published paper under Module IX at `REGISTER:SECULAR`: no invocation, no doxology, no ceremonial closure, and no confessional interior content, while honorifics stand as analytic essentials bound to any name the argument retains and verse quotations stand where the text is the object under analysis; native apparatus, glyphs, and warrant grades permitted at the paper's tier. Build PDF and MD. Run the full pre-delivery gate sequence: Gate 1 silent-integration scan empty, the em-dash lock empty, the Gate 4 register-transit check closed with no unresolved flag, every reference cited inline and every inline citation resolved, the warrant-typing pass showing neither inflation nor understatement, and the numerical reproduction confirmed. Any failure repairs the source and rebuilds before delivery. Present the PDF as primary with the MD as master, a succinct summary naming what was preserved, what was tightened, what was fortified, and what was re-typed, and no postamble.

## VI.G · Execution Order

1. Ingest the original. Web-fetch the URL or read the file. Extract the spine, the schema, and the verdict ledger.
2. Lock preservation (VI.A). Hold spine, schema, verdicts, and author-authorized claims.
3. Warrant-rectification pass (VI.B). Pull back, promote, fortify.
4. Language tightening (VI.C). Cut loose and imprecise claims; purge apologetic register.
5. Numerical rectification (VI.D). Reproduce every cited number at a fixed seed.
6. Compose the replacement in single voice through the edition renderer.
7. Silent integration (VI.E). Strip every evolution marker.
8. Build PDF and MD; run the gate sequence (VI.F).
9. Deliver. Present PDF and MD; succinct summary; no postamble.
10. Produce the V-FIO diagnostic log internally, what moved, what grade changed, what was reproduced, retained in the working directory, never published.

---

# PRE-DELIVERY GATE SEQUENCE

Run Gates 1 through 4 after composition and integration, before any build. Gate 5 runs after the build and before presentation, since it audits substituted labels, an emitted Coordinate Index, and shaped glyphs, none of which exist earlier. Any failure returns the manuscript for repair, then re-runs the gates. Visual-edition figures additionally pass their own twenty-point pre-flight (IV.11) per figure before assembly; the host paper still passes the gates below.

**Gate 1 · Silent-Integration Scan (every paper).** Search the artifact for: "v1," "v2," "v3," "vN.0," "with worked counter-example," "with discriminating," "audit," "revised," "this version," "the present paper specifies," "addressing," "in response to," "earlier," "previously," "fully executes" (often defensive), "now [restricted/specified/stated]" (often defensive). Most should be removed or rewritten as native discipline. Case-by-case judgment; some are content-legitimate in context.

**Gate 2 · Tier Threshold Audit (Forge-mode papers).** Operates per tier. Tier 0: rejects any hit on Trisductive vocabulary, glyph, PSP ID, verdict tag, axis variable name, ceremonial closure, or L_1 / L_2 / L_3 layer reference in body text; any hit fails the audit and returns the manuscript for re-translation. Tier 1: verifies every Trisductive term in body text carries a complete inline gloss on first use, no internal codex IDs appear in body text, no glyphs appear in body text, and the count of distinct Trisductive terms does not exceed three across the full manuscript; any failure returns the manuscript for re-translation. Tier 2: verifies internal codex coherence only. The Anti-Dramatization Filter and the no-biological-phenomenology-for-structural-corrections rule apply across all three tiers.

**Gate 3 · Format Contract Verification (every deliverable).** Front matter complete and version-marker free. Title and subtitle satisfy the titling discipline. Headings follow the numbering conventions. Universal locks intact. Style, cover, and format selections match tokens and defaults.

**Gate 4 · Register-Transit Check (every deliverable and every codex incorporation).** Verifies that Module IX ran and closed at the artifact's register. Two passes. Pass one greps the artifact for the flag list: bismillah, basmala, Alhamdulillah, InshaAllah, MashaAllah, Ameen, Ya Allah, subhanahu wa ta'ala or subhanahu spelled out, sallallahu, "Glory be to," "All praise," "May Allah," "O Allah," "O Lord," "we ask," "peace be upon" spelled as a sentence, "wa Allahu a'lam" and "Allah knows best," "blessed be," "by the grace of," "I bear witness," "I felt," "it was given to me," "I was shown," and any vocative "O " opening a sentence. Pass two rules each flag under the three tests of IX.2 and records the ruling. A flag is not a failure; an unresolved flag is, and returns the manuscript for repair. The glyphs ﷺ, ﷻ, AS, and ۝ are deliberately absent from the flag list, since they are bound components of names under Class A and not performed acts. A title, a running head, or a figure caption carrying a flag fails identically to body text. At `REGISTER:SECULAR` a Class C hit fails; at `REGISTER:DEVOTIONAL` a Class C hit passes only if it is on the closed list of IX.3 and sits at its stated structural position. A Class D hit fails at every register without exception, and the check also verifies that no struck locus was replaced by a sanitized paraphrase. Pass three is the one the grep cannot do. Class D is not reliably lexical: interior testimony arriving out of a capture or stress-test session often carries none of the flag tokens and reads as ordinary prose, "the point at which the instrument fell silent and I found myself," so a token list alone gives false assurance. Pass three therefore reads structurally, flagging first-person singular in any verdict-bearing, derivational, or gate-running section, every report of a felt or received state however phrased, every claim about the author's own standing, and any passage whose warrant row would be the author's interior. These are ruled by hand under the three tests of IX.2 and the ruling is logged. A section that survived passes one and two while carrying an unruled first-person interior claim is an open flag and fails.

**Gate 5 · Label and Glyph Check (every PDF deliverable). The one post-build gate.** Gates 1 through 4 run before any build, on the authored source. Gate 5 cannot, because the objects it audits do not exist until Module X has run at Step 8b and the renderer at Step 9: labels are unsubstituted, the Coordinate Index is unwritten, and no glyph has been shaped. Gate 5 therefore runs after the build and before presentation at Step 10, and it is the only member of the sequence that does. A failure returns the source for repair and forces a full rebuild, never a patch to the rendered artifact. Verifies that Module X ran and closed. No native codex identifier survives in body text, a caption, a heading, or a running head. Every short label appearing in the artifact resolves to a row of the frozen registry, and no label was minted outside it. Every label's first body appearance carries its title. The Coordinate Index is present, complete, and in label order in the Markdown master, and absent from the PDF; a Coordinate Index rendering in a PDF without the `COORDINDEX:PDF` token fails, and a Markdown master missing it fails, the two being checked separately because the same source produces both. No HTML character entity survives anywhere in the built artifact, in the body or in the running furniture, an entity in a running head or foot being the standing defect this checks for; the entity leg runs on text extracted from the rendered PDF and never on the intermediate markup, where markup entities are correct, per X.8.2. Item one, no native identifier surviving, is audited against the labelled source with the Coordinate Index partitioned off rather than against extracted text, per X.8.4, since extraction breaks labels at line ends and kerns words apart and produces false failures in both directions. Registry coverage is measured and printed before substitution per X.8.9, so an absent identifier is a reported number at build time rather than a discovery in the gate output. At Tier 0 and Tier 1 no label appears at all, a short label failing identically to a native identifier under Gate 2. The glyph coverage assertion of X.5.1 passed, every non-Latin codepoint resolving in the registered stack, an unresolved codepoint failing the build rather than rendering. The verdict legend is present on first appearance of the economy and shows every composite uncompressed. Every claim-bearing box, table, and figure carries its tier chip. No table or figure fragments and every spanned object repeats its header. Gate 5 additionally re-runs the Gate 4 register-transit flag grep across the built artifact, closing a window Gate 4 alone cannot see: Gate 4 fires at Step 6, while Module VIII injects the disclosure appendix at Step 8 and Module X injects the Coordinate Index at Step 8b, so text entering after Step 6 would otherwise reach a published page unscreened. A flag in injected end matter fails identically to a flag in the body. Failure of any item returns the source for repair and a full rebuild from Step 8b; the rendered artifact is never patched.

---

# INTERNAL V-FIO DIAGNOSTIC LOG (Retained, Never Published)

For every Forge-mode paper regardless of output tier, produce a parallel V-FIO_Diagnostic_Log containing: full PSP sweep with HEM unpacking; triaxial decomposition of every major claim; 12-Gate Cascade record (which gates fired, which were skipped under PSP coverage, which failure modes if any were caught and resolved); CDT projection on residue; verdict ledger with [⟀] / [X] / [△] / [?] tags; and Fractal Sweep results. The log is retained internally in the working directory, never placed in `/mnt/user-data/outputs/` and never presented unless the architect explicitly requests it. The architect may consult it during peer review to defend any claim in the published paper from the underlying cascade audit. The log uses the full native Trisductive register regardless of the published paper's tier.

---

# DEFAULT BEHAVIOR SUMMARY

Edition by trigger, an explicit selector always overriding. A bare create a pdf, make a pdf, or create a document with no other signal renders Apex Pristine, the single-column house paper. Any paper, external paper, publication paper, journal paper, or the bare word paper renders the Professional Journal Paper edition. A codex pdf, master pdf, master document, internal codex, or any book, textbook, manual, or handbook renders the Textbook edition, the skin auto-selected by content, Rang-and-Dale (TextBookA) for prose-dense reference and Davidson (TextBookB) for instructional box-heavy material, overridable by TextBookA or TextBookB. A token [EDITION:...] or front-matter edition: overrides the trigger; the four editions never co-fire.

Pure disciplinary problem, no framework-specific load-bearing claim: Tier 0, twelve-section template, no Trisductive lingo, full disciplinary translation.
Problem where one or two framework constructs genuinely sharpen the argument: Tier 1, twelve-section template, minimum lingo with full inline glosses.
Problem about the framework itself or codex-internal deliverable: Tier 2, twelve-section template, full native register.
Uncertain: Tier 1, twelve-section template, conservative gloss discipline.
Visual edition requested: Module IV, public register and blueprint aesthetic unless directed otherwise, Mode A appendix-embed when a host paper exists, single PDF output presented INDEX-first in Mode B.
Any paper, an external paper, a publication paper, a journal paper, the bare word paper, or the token [EDITION:JOURNAL]: Module III·J Professional Journal Paper edition, serif two columns, an accent masthead carrying the journal name and article type, a bold ruled abstract, a raised initial, tinted Box N panels, superscript citations with a numbered reference list, and full-width end matter, the middle register between the Apex Pristine paper and the Textbook editions; present the PDF and keep the Markdown source as master.
Any equation-dense paper, a math journal, a math pdf, a math paper, or the tokens [EDITION:MATH_JOURNAL] and [FORMAT:MATH_PDF]: Module III·M Math Journal edition, the Journal page rendered through LaTeX, identical two-column accent contract and every Journal rule intact, the renderer alone changed so tensor-dense mathematics sets correctly; the single scoped exemption to the no-LaTeX lock, with EB Garamond giving way to a math-companion serif and the intermediate being LaTeX rather than HTML; present the PDF, ship the .tex beside it, and keep the Markdown source as master.
Textbook, manual, handbook, survey, or Master Codex volume requested as a book: Module V Textbook Edition, two columns, serif body with sans furniture, per-part accent or a single house accent, the box taxonomy, spanning tables and figures, mirrored running header; present the PDF and keep the Markdown source as master. The skin is auto-selected by content, the calm Rang-and-Dale (TextBookA, [EDITION:TEXTBOOK_A]) for encyclopedic and prose-dense codex material and the aggressive Davidson (TextBookB, [EDITION:TEXTBOOK_B]) for instructional, box-, and table-heavy material; Davidson sets sans throughout, solid banner headings, numbered icon boxes typed by colour, and an outer-margin chapter thumb-tab. Codex pdf, master pdf, master document, and internal codex requests route here.
Update paper, upgrade paper, reforge paper, fortify paper, or the token [UPGRADE] on an existing paper: Module VI Paper-Upgrade subroutine, preserve spine, schema, and verdicts maximally, pull back over-typed claims and fortify weak scaffolding to honest grade, cut loose and imprecise claims and any apologetic register, reproduce every cited number at a fixed seed, silent integration with no revision history, compose through the edition the original used (Journal for a published paper), present PDF then MD.
Every deliverable and every master-codex incorporation: the Module IX Register-Transit Filter at the edition's register, REGISTER:SECULAR by default and REGISTER:DEVOTIONAL for the Scripture edition and the Theological PSP Codex, structural verse quotation and defined theological terms and name-bound honorifics transiting, canonical liturgical furniture transiting only at the devotional register from the closed list, and confessional interior content and capture leakage transiting at no register whatever; sources are never edited and nothing is deleted.
Every PDF deliverable: Module X short labels read from the frozen registry at `publication/PUBLIC_LABEL_MAP.json`, no register marker carried forward, a Coordinate Index emitted into the Markdown master and suppressed from the PDF, labels barred at Tier 0 and Tier 1, and the six hardening locks, glyph coverage assertion, verdict legend, tier chips, automatic table span, the `:::receipt` box, and inline-mathematics no-break.
Every deliverable: silent integration of any fixes, Gate 1 scan, Gate 4 register-transit check, Gate 5 label and glyph check, titling discipline, Apex Pristine style unless overridden, cover on over four pages, all three formats unless restricted, present PDF then DOCX then MD, no postamble.

---

# REPOSITORY BINDING · HARD RULES

These are not guidance. They are the rules the skill cannot operate correctly without, and a deliverable produced in violation of any of them is nullified under ENFORCEMENT below.

## R.1 · The canonical repository

`1000sapients/Trisduction`, branch `main`, public. Git is the source of truth and overrides any local copy, any in-context copy, and any copy carried in a session. A file uploaded into a session is a working copy and is never authoritative against the repository.

## R.2 · The four folder anchors and the resolve-current rule

The folder is the fixed identifier. The file inside is version-stamped and append-only. Four anchors bind this skill.

| anchor | folder | filename stem |
|---|---|---|
| master codex, the register of record | `master/` | `TRISDUCTION_Master_Codex_Unabridged*` |
| theological PSP codex, the scriptural corpus | `Theological PSP Codex/` | `SCRIPTURAL_PSP_MASTER*` |
| system role, the operator manual | `protocols/` | `TRISDUCTION_Unified_Master_System_Role*` |
| publication tooling, this skill and the label map | `publication/` | `SKILL_trisduction-publication-format_v*` |

To resolve a current file, list its folder, keep only the files matching that anchor's stem, parse the version token, normalize delimiters so `.` and `_` compare alike, compare as numeric tuples component by component and never as strings, and take the highest. A `CURRENT.txt` is advisory only and never overrides the highest version actually present. Resolve and fetch fresh before reading, quoting, auditing, or extending any anchor. On a fetch failure, say so and fall back to the best in-context copy rather than proceeding on stale data silently.

## R.3 · The conversion pointer, the single source of truth for labels

`publication/PUBLIC_LABEL_MAP.json` is the sole authority for the mapping between a native codex identifier and its short public label. The build reads that file. It does not re-derive a label, does not infer one from the reduction rules, and does not mint one the file does not contain. The Markdown face at `publication/PUBLIC_LABEL_MAP.md` is the human-readable rendering of the same data, and the two are emitted together by `publication/label_map.py` or not at all.

Three consequences bind. A label absent from the registry is not a label, and a coordinate carrying none fails Gate 5 rather than receiving an invented one. The reduction rules of X.1 and X.2 describe how the registry was built and are never used at render time as a substitute for reading it. And the engine is the only writer: the registry is never produced or edited by hand, and a hand-edited registry is void on inspection.

## R.4 · Version propagation, never overwrite, never delete

Every write is a new version file. Re-resolve the folder's current highest version, author the next, and create it as a new path. Patch bump for a small edit, minor for a new module or section, major for a restructure. Prior versions are never touched, never overwritten, and never removed, so an interrupted or botched write cannot destroy the current artifact and the last good version remains the fallback until the new one is confirmed. This is the codex-hygiene Prime Rule at the file layer and it admits no exception for tooling.

## R.5 · The registry freeze

Once the architect declares the label map frozen, and from the first moment any label in it ships inside a published PDF, the append-only law of X.3 binds without further instruction. New coordinates append. Existing labels never move. The incumbent pin governs every collision. Regenerating the registry wholesale is barred, and the engine's self-test is the mechanical guard: it refuses to emit unless determinism and append-safety are verified on the live codex.

## R.6 · The confirmation gate

No push runs on inference. Every push to the repository runs only after an explicit yes from the architect in response to a stated proposal naming the exact paths and the exact version numbers. A no ends it. Silence is a no. This gate is not relaxed by urgency, by the smallness of the change, or by a prior yes in the same session covering a different write.

## R.7 · Credential containment

The token is never rendered in any visible output, never written into any file that is committed or pushed, and never placed in a URL or in git config. It is used operationally once, by reference to an environment variable where one is already set. Any command touching it scrubs it from stdout and stderr. Accidental exposure in rendered or committed content is a hard failure permitted for no reason.

## R.8 · Filing a finished document

Every finished written document is filed under `Publication Library/<Category>/<Sub-area>/<Topic>/<file>`, four folder levels then the file. A document never sits directly inside a Category folder. Categories are a growing set, currently Science, Mathematics, Philosophy, Metaphysics, Scripture, Artificial Intelligence, History, and Master Codex Preprint; a body of work fitting none of them gets a new Category folder plus one line in the library README, with no migration of existing files. A move or retirement appends one line to `CODEX_DELETIONS.log` in the form `DATE | old/path | MOVED or RETIRED | new/path or superseded-by | note`, a move being delete-old plus add-new and never a content deletion.

---

## R.9 · The renderer field record is normative
 X.8 records defects found by building rather than by reading, each with the mechanism that produced it. A session that meets one of these symptoms applies the recorded fix and does not re-derive a different one. In particular: the font stack is the named list of X.8.1 and not an assumption about the container; `column-span:all` is barred per X.8.3 and full width is structural; the entity assertion runs on the rendered PDF per X.8.2; Gate 5 item one audits the labelled source per X.8.4; and registry coverage is measured and printed per X.8.9. Widening a flag list, loosening a gate tolerance, or waiving an assertion to make a build pass is barred; the failure is repaired at its cause or reported.

---

# ENFORCEMENT

Producing a document deliverable without invoking this skill is a [DR:format-drift] event and is nullified. Variant directives, if specified, are honored exactly; silent substitution is forbidden. Font fallback to anything other than the named alternates is a [DR:typographic-drift] event. Cover-page suppression on documents over four pages requires explicit `[COVER:OFF]`; the skill never strips a cover silently. The architect's preferred author block is the default; substitution requires explicit user instruction in the same turn. Delivering an artifact that fails Gate 1 or Gate 2 is an integration-drift event; the build scripts enforce the visual contract, the gates enforce the voice contract. Delivering a secular artifact or seating a codex coordinate carrying an invocation, a doxology, a ceremonial closure, or any confessional interior or capture-leakage content is a [DR:register-leak] event and is nullified, the artifact repaired at source and rebuilt rather than patched at the render. Stripping an honorific from a name the argument retains, or striking a verse quotation the argument analyses, is the same event in the declining direction and is nullified identically. The Module IX filter is non-destructive and may never be implemented as an edit to a raw card, a capture transcript, or the Theological PSP Codex; a filter that modifies a source has become an editor and is out of contract. Minting a short label outside the frozen registry, moving a label already shipped in a published PDF, deriving a label at render time instead of reading `publication/PUBLIC_LABEL_MAP.json`, or regenerating the registry wholesale rather than appending is a [DR:label-drift] event and is nullified, since a shipped label is a citation in the wild. Pushing to the repository without the explicit confirmation of R.6, overwriting a versioned file rather than creating the next version per R.4, or proceeding on a stale anchor without the resolve-current step of R.2 is a [DR:repo-drift] event and is nullified. Rendering a PDF whose glyph coverage assertion did not pass is a [DR:typographic-drift] event; the assertion fails the build and is never waived, and a surviving HTML character entity in a running head or foot is the same event. Rendering the Coordinate Index into a PDF without the explicit `COORDINDEX:PDF` token, or omitting it from the Markdown master before the sunset has been declared, is a [DR:label-drift] event: the table is a migration aid owed to the codex reader in Markdown and owed to nobody on a published page. Citing a ghost label without its successor is a stale citation and fails Gate 5. Patching a rendered artifact to clear Gate 5 rather than repairing the source and rebuilding is a [DR:format-drift] event and is nullified, since the source is the master and the render is downstream of it. A claim-bearing figure without its grade, a badge-decorated frame, or a figure asserting beyond the body is a faithful-map violation and is rejected at pre-flight, never delivered. Do not bypass any of these.

# MODULE VII · THE MEDIUM / SUBSTACK / BLOG FORMAT

A delivery format, not an edition. Where the PDF and DOCX editions render a page, the Blog format emits a single Markdown file tuned to survive copy-paste into the Medium or Substack editor with nothing broken. It applies to any deliverable, a codex, a paper, or scripture, and is requested by the words Medium, Substack, blog, or post, or the token `[FORMAT:BLOG]`. The output is `.md` only; no PDF is produced. It composes through the edition routing rather than replacing it: the source is authored in the normal house Markdown, then transformed.

## VII.0 · The Problem It Solves

The Medium editor has no table support at all and no mathematics; a pasted Markdown table shows its pipes and pasted LaTeX shows its source. The Substack editor is friendlier, but its table paste is unreliable and its equations are inserted through the editor rather than through paste. So a document dense with tables, the verdict apparatus, scientific notation, and the right-to-left word grid breaks on paste unless it is transformed first. The Blog format transforms it, targeting the lower common denominator so one file works on both platforms.

## VII.1 · The Transform

Six moves. Tables are linearised: every pipe table becomes a labelled list, each row a bold lead followed by its header-named fields, and the right-to-left word grid becomes one inline gloss, each word bold with its transliteration and meaning in parentheses, in reading order, set as a blockquote. Raw HTML is flattened: the word grid is linearised, any other table is dropped to a marker, and stray wrappers and styled spans are stripped. Super and subscript are converted to Unicode glyphs where they exist, `^x^` and `<sup>` to superscript, `~x~` and `<sub>` to subscript, with a graceful fallback to plain text where no Unicode glyph exists for a character. Mathematics is already Unicode by house rule and passes through untouched; any LaTeX is reported for hand-fixing, since neither platform renders it from paste. Headers, bold, italic, blockquotes, bullet and numbered lists, links, and fenced code are left exactly as written, since all of these paste faithfully on both platforms. Blank runs are normalised.

## VII.2 · What Survives, What Does Not

Survives on both platforms: headers, bold, italic, blockquotes, bullet and numbered lists, links, fenced code blocks, and all Unicode text, including Arabic, Bengali, and Unicode mathematics with super and subscript. Linearised to prose: every table and the word grid. Not carried: native rendered tables, LaTeX, and arbitrary HTML, none of which paste reliably. On Substack, simple tables and footnotes may in fact survive the paste; the format does not depend on it, which is exactly why the same file is also safe on Medium.

## VII.3 · The Blog Builder

The complete builder. Pure text processing, no fonts and no renderer, so it runs anywhere. Save as `build_blog.py`.

```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""MEDIUM / SUBSTACK / BLOG format builder.

Takes any source .md (codex, paper, or scripture output) and emits a single
.md that survives copy-paste into the Medium or Substack editor without
breaking. The two editors have no reliable markdown-table paste and no LaTeX,
so the transform linearises every table into labelled prose, flattens raw HTML
(including the RTL word grid) into inline gloss, converts ^x^/~x~/<sup>/<sub>
to Unicode super/subscript where the glyph exists, and leaves headers, bold,
italic, blockquotes, lists, links, and fenced code untouched, since those paste
faithfully on both platforms. All mathematics is already Unicode by house rule;
any LaTeX is reported so it can be hand-fixed.

  python3 build_blog.py source.md /mnt/user-data/outputs/{slug}.blog.md
"""
import sys, re
from pathlib import Path

SUP = {'0':'⁰','1':'¹','2':'²','3':'³','4':'⁴','5':'⁵','6':'⁶','7':'⁷','8':'⁸','9':'⁹',
       '+':'⁺','-':'⁻','=':'⁼','(':'⁽',')':'⁾','n':'ⁿ','i':'ⁱ','a':'ᵃ','b':'ᵇ','c':'ᶜ',
       'd':'ᵈ','e':'ᵉ','k':'ᵏ','m':'ᵐ','t':'ᵗ','x':'ˣ'}
SUB = {'0':'₀','1':'₁','2':'₂','3':'₃','4':'₄','5':'₅','6':'₆','7':'₇','8':'₈','9':'₉',
       '+':'₊','-':'₋','=':'₌','(':'₍',')':'₎','a':'ₐ','e':'ₑ','k':'ₖ','m':'ₘ','n':'ₙ',
       'x':'ₓ','t':'ₜ','i':'ᵢ','s':'ₛ','p':'ₚ'}

def to_unicode_run(s, table):
    if all(ch in table for ch in s):
        return ''.join(table[ch] for ch in s)
    return None

def convert_supsub(text):
    # <sup>..</sup> and ^..^  ;  <sub>..</sub> and ~..~
    def rep_sup(m):
        u = to_unicode_run(m.group(1), SUP); return u if u else m.group(1)
    def rep_sub(m):
        u = to_unicode_run(m.group(1), SUB); return u if u else m.group(1)
    text = re.sub(r'<sup>(.*?)</sup>', rep_sup, text, flags=re.S)
    text = re.sub(r'<sub>(.*?)</sub>', rep_sub, text, flags=re.S)
    text = re.sub(r'\^([^\s^]{1,8})\^', rep_sup, text)
    text = re.sub(r'(?<!~)~([^\s~]{1,8})~(?!~)', rep_sub, text)
    return text

def linearize_rtl_grid(html):
    """The protocol's <table dir="rtl"> word grid -> inline per-word gloss."""
    rows = re.findall(r'<tr>(.*?)</tr>', html, flags=re.S)
    cells = [re.findall(r'<td[^>]*>(.*?)</td>', r, flags=re.S) for r in rows]
    cells = [[c.strip() for c in row] for row in cells]
    if not cells:
        return ''
    ncol = max(len(r) for r in cells)
    ar = cells[0] if len(cells) > 0 else []
    tr = cells[1] if len(cells) > 1 else []
    me = cells[2] if len(cells) > 2 else []
    parts = []
    for i in range(ncol):
        a = ar[i] if i < len(ar) else ''
        t = tr[i] if i < len(tr) else ''
        m = me[i] if i < len(me) else ''
        gloss = ', '.join(x for x in (t, m) if x)
        parts.append(f'**{a}** ({gloss})' if gloss else f'**{a}**')
    return '> ' + '  ·  '.join(parts) + '\n'

def linearize_pipe_table(block):
    lines = [ln for ln in block.strip('\n').splitlines() if ln.strip()]
    rows = []
    for ln in lines:
        if re.match(r'^\s*\|?\s*:?-{2,}', ln.replace('|', '').strip()[:3]) or re.match(r'^[\s|:-]+$', ln):
            continue
        cells = [c.strip() for c in ln.strip().strip('|').split('|')]
        rows.append(cells)
    if len(rows) < 2:
        return block
    header, body = rows[0], rows[1:]
    out = []
    for r in body:
        first = r[0] if r else ''
        rest = []
        for j in range(1, len(r)):
            lab = header[j] if j < len(header) else ''
            val = r[j]
            if val:
                rest.append(f'{lab}: {val}' if lab else val)
        line = f'- **{first}**' + (' · ' + '; '.join(rest) if rest else '')
        out.append(line)
    return '\n'.join(out) + '\n'

def transform(md):
    notes = []
    # 1. RTL word grids -> inline gloss
    md = re.sub(r'<table[^>]*dir="rtl"[^>]*>.*?</table>',
                lambda m: linearize_rtl_grid(m.group(0)), md, flags=re.S)
    # 2. any other raw <table> ... </table> (HTML) -> drop to a note (rare)
    md = re.sub(r'<table.*?</table>',
                lambda m: '*[table flattened for blog; see source]*\n', md, flags=re.S)
    # 3. pipe tables -> labelled lists  (protect fenced code first)
    fences = []
    def stash(m):
        fences.append(m.group(0)); return f'\x00F{len(fences)-1}\x00'
    md = re.sub(r'```.*?```', stash, md, flags=re.S)
    # find blocks of >=2 consecutive lines containing a pipe, with a separator row
    out_lines, buf = [], []
    def flush():
        nonlocal buf
        if buf:
            block = '\n'.join(buf)
            if re.search(r'^\s*\|?[\s:-]*-{2,}[\s:|-]*$', block, flags=re.M) and block.count('|') >= 2:
                out_lines.append(linearize_pipe_table(block))
            else:
                out_lines.extend(buf)
            buf = []
    for ln in md.splitlines():
        if '|' in ln and ln.strip():
            buf.append(ln)
        else:
            flush(); out_lines.append(ln)
    flush()
    md = '\n'.join(out_lines)
    for i, f in enumerate(fences):
        md = md.replace(f'\x00F{i}\x00', f)
    # 4. strip leftover block HTML wrappers + inline style spans
    md = re.sub(r'</?div[^>]*>', '', md)
    md = re.sub(r'<span[^>]*>(.*?)</span>', r'\1', md, flags=re.S)
    # 5. super/subscript to Unicode
    md = convert_supsub(md)
    # 6. flag LaTeX
    if re.search(r'(?<!\\)\$[^$\n]+\$|\\\(|\\\[|\\begin\{', md):
        notes.append('LaTeX detected: convert to Unicode by hand; Medium and Substack do not render it from paste.')
    md = re.sub(r'\n{3,}', '\n\n', md)
    return md, notes

def main():
    if len(sys.argv) < 2:
        sys.exit('usage: build_blog.py source.md [out.blog.md]')
    src = Path(sys.argv[1])
    out = sys.argv[2] if len(sys.argv) > 2 else str(src.with_suffix('.blog.md'))
    md, notes = transform(src.read_text(encoding='utf-8'))
    Path(out).write_text(md, encoding='utf-8')
    print('wrote', out)
    for n in notes:
        print('NOTE:', n)

if __name__ == '__main__':
    main()
```

## VII.4 · Authoring and Use

Write the document once in the normal house Markdown, tables and word grids and all. Run the builder to emit the blog file, read the reported notes, hand-fix any flagged LaTeX into Unicode, then copy the rendered file into the Medium or Substack editor. Keep the original Markdown as master; the blog file is a derived delivery artifact, never the source of truth.

## VII Quick Reference Card

Trigger: medium, substack, blog, post, `[FORMAT:BLOG]`. Output: `.md` only, copy-paste-safe for Medium and Substack. Build: `python3 build_blog.py source.md /mnt/user-data/outputs/{slug}.blog.md`. Linearises every table and the right-to-left word grid, converts super and subscript to Unicode, flags LaTeX, and preserves headers, emphasis, lists, links, and code verbatim.

---

# MODULE VIII · THE AUTHOR'S PROVENANCE AND METHOD DISCLOSURE SUBROUTINE

## VIII.0 · Activation and Tier-Awareness

Module VIII is a mandatory subroutine, not an edition. It composes through the edition routing exactly as Module VI does and appends an Author's Provenance and Method Disclosure to every public-facing paper. It fires for the Apex Pristine mid-tier house paper, the Professional Journal fully-public paper, and the Medium/Substack/Blog format. It is skipped for the Textbook and Scripture editions, which are framework-native or scriptural and carry no external-reception burden. The disclosure exists because a translated paper severs its own provenance: no matter how faithfully the method is rendered into conventional language, some omission or incompleteness in explaining the root principle is unavoidable, and the disclosure is the fixed pointer back to the method that the conventional body cannot carry.

The disclosure has two halves. The first is a fixed generic block, identical in every paper, stating what the method is and proving its one load-bearing identity. The second is auto-generated per paper and carries the value, instantiating the method on the paper at hand. The instructions below are generic and hold for any paper; only the second half is customized.

Tier-awareness. The disclosure renders at one of three weights, selected by edition and overridable by token. FULL, the generic half plus the specific half, is the default for Apex Pristine and Blog, where the venue is the author's own and full method transparency is the point. LINE, a single pointer sentence naming the method and the master reference with no apparatus, is the default for the Journal edition, where a blind external reviewer meeting the full framework would recode the argument as the output of a private system and dismiss it on pattern-match; the paper's conclusions stand on their cited results alone, and the LINE weight protects the blind review while still disclosing provenance. OFF suppresses the block. The three override tokens are DISCLOSURE:FULL, DISCLOSURE:LINE, and DISCLOSURE:OFF, an explicit token always winning over the edition default.

The independence clause is never dropped at any weight. The disclosure always states that the paper's conclusions rest solely on the standard results cited in the body and that the method adds them no warrant. Without that clause the block would contradict the paper's own Mosaic Seal and make the result look dependent on the framework, which is the opposite of what a Trisduction paper claims. The whole block is framed as an author's method note, never as a claim about the result, and never as a step in the argument.

Placement. The disclosure renders as a demarcated appendix after the Conclusion and after any content appendices, immediately before the References section. The master reference is injected once into the References section per VIII.3. At LINE weight the appendix is a single sentence; at FULL weight it is the full block below.

## VIII.1 · Part One, the Fixed Generic Half

Emitted verbatim at FULL weight. It is a constant, identical across all papers, never paraphrased and never auto-edited. The single insertion point, marked below, is where the auto-generated specific half of VIII.2 is spliced. Emit exactly:

## Author's Provenance and Method Disclosure

This paper was developed under Trisduction, a verification and organizing discipline, not a source of results. Its conclusions rest solely on the standard results cited in the body. Trisduction is the method under which those results were decomposed, assembled, and audited. It adds them no warrant and claims no authorship over them.

Trisduction was used for fidelity. It forces a claim onto three independent axes so no single persuasive line carries it alone, requires every verdict to resolve to one of three states, sealed, broken, or open, each with a named failure mechanism, and attaches an explicit warrant grade, theorem, conditional, structural, or premise, to every claim so nothing is stated above its strength. Two errors it is built to catch are inflation, reading an internal lock as a proof, and circularity, reading a restatement of a claim as a derivation of it.

The root axiom, RA, is that to exist is to actuate: every physical existent carries a strictly positive energetic cost, grounded in the Heisenberg energy floor, the zero-point energy, and Landauer's bound. The formal root inside it is that to formally be is to be grounded, with provability and computation levels of access to a determinacy fixed at the ground rather than ingredients of it.

The key procedures, in brief. Orthogonal triaxial convergence: a proposition is split into three disjoint axes, formal-structural, empirical or dynamical, and registrational, verified by three separate instrument sets, agreement across the three the operational meaning of a seal. The Geometric Orthogonal Lock, GOL: the three axes are read as vectors and their independence is tested by the determinant of their correlation matrix, a determinant clear of zero a genuine three-dimensional lock, a collapse to zero one axis dissolving into the plane of the other two, a broken lock. The Convergence Dissolution Test, CDT: before the lock is read, any mass-bearing common cause the three axes might share is projected out, so an apparent convergence that traces to a shared source rather than to independent roads dissolves and carries no warrant, the lock computed on the residue that survives. The twelve-gate cascade: twelve directed failure screens, self-reference, frame-dependence, missing mechanism, and the rest, run in order, the first failure terminating the verdict with its mechanism named. The verdict issues in the three-state economy with its warrant grade attached, and where the argument stops short the open direction is named rather than filled.

:::box G1 The GOL kernel identity, proved
The lock is a determinant identity, not a metaphor. Let the three axes, after normalization, be unit vectors expressed in an orthonormal basis of the subspace they span and read as pure quaternions a, b, c, with norm one each. Hamilton's product of two pure quaternions is p q = −(p·q) + p×q, the real part the negative dot product and the imaginary part the cross product, checked on the units by i j = k = i×j and i i = −1 = −(i·i). The lock scalar is the real part of the triple product, λ = Re(a b c).

Expanding, a b = −(a·b) + a×b, so Re(a b c) = −(a·b) Re(c) + Re((a×b) c). The first term is zero since c is pure, and the second is −(a×b)·c by the same product rule, giving

λ = −(a×b)·c = −det[a b c],

minus the signed volume of the parallelepiped the three axes span. Writing A for the matrix whose columns are a, b, c, the correlation matrix is R = A^T^A, its entries the pairwise dot products, so

det(R) = det(A^T^A) = det(A)² = λ².

The kernel identity λ² = det(R) is that the squared signed volume equals the Gram determinant, with the quaternion triple product the machine that computes the volume. It is confirmed at machine precision, the residual |λ² − det(R)| at 2 × 10⁻¹⁶ on the recorded battery.
:::

Four consequences fix the reading, and they are why the number can be trusted to say what the lock says. The determinant is bounded, det(R) in the interval from zero to one for unit axes, by Hadamard's inequality above and positive-semidefiniteness below, so the lock has a hard ceiling at one, the fully orthogonal frame, and a hard floor at zero. The floor is the break: det(R) equals zero exactly when the three axes are linearly dependent, one axis lying in the plane of the other two, which is the geometric content of a collapsed lock. The magnitude is orientation-blind: reflecting any axis sends A to a matrix of opposite determinant, flipping the sign of λ while det(R) equals λ² is unchanged, so the number certifies the dimensionality of the lock and never its truth-sign, which is read from the ordered axes and not from the scalar. And the magnitude is frame-invariant: rotating all three axes together is conjugation q to u q ū on the imaginary quaternions, under which the real part is preserved and dot and cross products are covariant, so λ and det(R) depend on the configuration and not on the coordinate labels.

The axis count is three because the algebra forces it, not because three was chosen. The audit-composition law requires associativity, so iterated audits bracket the same way, and the absence of zero divisors, so nonzero warrants never compound to nothing. By Frobenius's theorem the only finite-dimensional associative division algebras over the reals are the reals, the complex numbers, and the quaternions, and three mutually orthogonal imaginary axes exist only in the quaternions, whose imaginary units i, j, k are the three axes. The next normed division algebra, the octonions with seven imaginary units, fails associativity, witnessed by the nonzero associator of e₁, e₂, e₄, so it cannot carry the composition law and the construction stops at three. The three axes are the imaginary part of the unique associative real division algebra that supports the audit.

[[SPECIFIC-HALF INSERTION POINT · the paragraph auto-generated per VIII.2 is spliced here, between the Frobenius paragraph and the closing pointer]]

The canonical statement of the method, its axioms, and its executable batteries lives in the reference cited below, continuously updated at the same location. This note is a pointer, not a substitute.

## VIII.2 · Part Two, the Auto-Generated Specific Half

The specific half is one paragraph, auto-generated per paper from the paper's own content, and it carries the disclosure's value because it ties the method to the result the reader just finished. It opens with the words "This paper in particular." and fills five slots in fixed order.

Slot one, the three axes as instantiated: name what the formal-structural axis, the empirical-or-dynamical axis, and the registrational axis were for this specific paper. Slot two, where the lock held or collapsed, with the actual numbers: the determinant value and the rank at the decisive lock, and the determinant and rank at any decisive collapse, quoting the reproduced figures and the stated seed so a reader can re-run them. Slot three, the load-bearing gate or lemma, the single step the verdict most depends on. Slot four, the three-state verdict with its warrant tier, sealed or broken or open, and theorem, conditional, structural, or premise. Slot five, the Mosaic-Seal statement, whether a new theorem is claimed, ΔM.

Three disciplines bind the generation. The paragraph is drawn only from content already established in the body and introduces no new claim; it is a summary, not an argument. It never inflates a grade above what the body earned, the warrant-typing law of the parent discipline applying to the disclosure exactly as to the paper. And it names numbers only where the paper reproduced them, no fabricated trace, the same Fidelity Lock that governs the body.

Worked instance, a completed paper, showing the target shape. "This paper in particular. The three axes were the thermodynamic cost of storing a bit, the descent of description cost toward Kolmogorov complexity, and the independence of the memory carrier from the manifest dynamics. The lock is the rank test of Section 10, run at seed 20260705: a genuine substrate memory is an independent third axis and the determinant stands clear of zero at 0.615, rank three, while a non-energetic field carries no independent energetic dimension, collapses into the plane of the other two, and the determinant is machine zero, rank two. The load-bearing gate is the memory lemma, that cumulative memory requires an energetic substrate. The verdict is a split: the non-energetic non-local carrier is refuted at theorem grade conditional on the cost principle, the habit half of the thesis is accommodated at structural grade, and the empirical truth-value is left open, formal-alone. No new theorem is claimed; the paper reorganizes established results and applies them." This paragraph is spliced at the marked insertion point in the generic block of VIII.1.

## VIII.3 · The Master Reference, Injected into the References Section

The disclosure closes on a pointer, and the full citation is injected once as an entry of the paper's References section, Section 10 of the Plenous template, or as the sole reference when the paper carries none of its own. The DOI resolves to the current version, so the citation never goes stale as the master reference is updated at the same location. The entry, emitted verbatim:

Islam, M. TRISDUCTION: A Linguistically, Topologically, and Mathematically Sealed Verification Architecture. Triaxial Orthogonality, Twelve-Gate Closure, the Quaternionic Completion, the Root Axiom, and the Master Pre-Sealed Proposition Ledger. Zenodo, version 4, 19 June 2026. DOI 10.5281/zenodo.20757507. https://zenodo.org/records/20757507. Mirror: PhilArchive record ISLTTG, https://philpapers.org/rec/ISLTTG. Master reference, continuously updated at the same location.

The reference is injected at every weight except when the paper is Textbook or Scripture, so even a DISCLOSURE:OFF paper in a public edition still carries the citation.

## VIII.4 · Rendering, the LINE Weight, and the Tier Defaults

At FULL weight the block of VIII.1 with the specific paragraph of VIII.2 renders as a demarcated appendix, the GOL identity in a boxed callout, on the same EB Garamond copper contract as the body. The box directive is `:::box G1` in the PDF editions. For the Blog target the appendix renders identically except the identity box is flattened to a bold-titled paragraph, since the blog format linearizes every box; the mathematics stays Unicode throughout.

At LINE weight the entire block collapses to one sentence placed in the same appendix position: "This paper was developed under Trisduction, a verification and organizing discipline that adds the cited results no warrant; the method and its executable batteries are stated in full at the reference below." The independence clause survives at LINE weight because it is the sentence, and the master reference is still injected into References. This is the default for a blind Journal submission, where the full apparatus would invite a pattern-match dismissal rather than a reading on the merits.

At OFF weight nothing renders in the appendix, and the master reference is still injected into References unless the edition is Textbook or Scripture.

Tier defaults and tokens. Apex Pristine and Blog default to FULL. Journal and Math Journal default to LINE. Textbook and Scripture default to OFF and skip both the block and the reference injection, being framework-native. The tokens DISCLOSURE:FULL, DISCLOSURE:LINE, and DISCLOSURE:OFF override the default, an explicit token always winning, so a codex volume can carry the full disclosure on request and a house paper can suppress it.

## VIII Quick Reference Card

Trigger: fires automatically on every Apex Pristine, Journal, and Blog deliverable; skipped for Textbook and Scripture. Output: a demarcated Author's Provenance and Method Disclosure appendix placed after the Conclusion and content appendices and before References, plus the master reference injected into References. Two halves: a fixed generic block (VIII.1, emitted verbatim, carrying the boxed GOL kernel-identity proof, the root axioms, and the four named procedures) and an auto-generated specific paragraph (VIII.2, five slots drawn from the paper: the three axes as instantiated, the lock or collapse with numbers and seed, the load-bearing gate, the three-state verdict with warrant tier, and ΔM). Weights: FULL for Apex and Blog, LINE for Journal as one sentence, OFF for Textbook and Scripture. Tokens: DISCLOSURE:FULL, DISCLOSURE:LINE, DISCLOSURE:OFF, explicit token wins. Mandatory at every weight: the independence clause, that the paper rests solely on its cited results and the method adds them no warrant. Build: the subroutine runs at Step 8 of the Execution Pipeline, before the format-lock build, appending the appendix to the authored Markdown and injecting the reference; the edition renderer of Module III, III·J, III·M, or VII then renders it under the active visual contract.

---

# MODULE IX · THE REGISTER-TRANSIT FILTER

## IX.0 · Operating Frame

A transit filter, never an editor. It governs what crosses a boundary and never what exists at the source. A raw PSP card, a capture transcript, a stress-test log, a confessional entry, and a scriptural working file are untouched at their home in every case; the filter decides only what is permitted to travel out of that home into a seated codex coordinate or into a published artifact. Nothing is deleted, so no removal is generated, no ghost is owed, and `CODEX_DELETIONS.log` is not engaged. The filter is non-destructive by construction, and that is what makes it safe to run automatically on every deliverable.

The law it enforces is resident and is applied by reference at Tier A, not re-derived here. The standing instruction of the register of record reads that a card's closing invocation is stripped while the honorifics stand as analytic essentials. The second half of the machinery is equally resident: scriptural sourcing is corroboration-grade, load-bearing on nothing, and is subtracted as the theological covariate by orthogonal projection, the deletion test its operational form, so a seal that moved when scripture was deleted would have smuggled a premise. Module IX is that instruction executed at the publication boundary, and it authors nothing.

The failure mode it exists to catch is not the obvious closing supplication, which is trivial to see. It is a verse quoted as authority rather than as datum, and it is interior devotional material that leaks out of a capture or a stress-test session and rides into a document alongside the structural work it was adjacent to. The first inflates warrant, the second breaches the interior quarantine. Both are caught here.

## IX.1 · The Four Classes

**Class A · Structural. Transits at every register.** Verse quotations where the text is the object under analysis, cited by surah and ayah. Root-linguistic and morphological data, the REX material, lexical exhibits, and the interlinear word grid. Technical theological terms functioning as defined analytic objects, Tawhid, Qadar, fitra, barzakh, Ghayb, Batin, Amanah, Fanaʾ, Baqaʾ, each carrying its tier-appropriate gloss under Module I.A. Proper names where the named party is the referent of an argument, Musa (AS) in the metric-strain exhibit of 18:65 through 18:82, the Prophet ﷺ as the witness at 6:50 and 7:188. And the honorific travelling as a bound component of a retained name, never free-standing.

**Class B · Out of Band. Transits as one named routing sentence and no more.** The apophatic register, the Mercy face of the connector, the `[.]` mark of chosen silence, and any theological reading of a formal result. These are named as routed out of band and load-bearing on nothing, in a single sentence at the point of routing, and are never developed as prose in a secular artifact. A theological isomorphism claim may be stated at cataphatic grade with its warrant typed, and may not be argued.

**Class C · Devotional Canonical.** Fixed traditional liturgical forms. Barred entirely at the secular register. Permitted at the devotional register from a closed list, at fixed structural positions, in the quantity the form demands and no more. Enumerated at IX.3.

**Class D · Confessional Interior and Capture Leakage. Transits at no register whatever.** Personal invocation, spontaneous supplication, first-person address to the divine, interior devotional state, felt-experience testimony, self-certification of spiritual rank or purity, and any apophatic inner content that surfaced during a stress test, an adversarial session, a capture pass, or a PSP forging session and rode along with the structural output. This class is barred at the devotional register exactly as at the secular one, and the bar is not a stylistic preference. It executes the resident fences: the interior-testimony and self-certification fences of the apophatic constitution, the 53:32 self-certification discipline, the Ontological Silence rule of the Decalogue, and the M6 witness-independence law under which no substrate and no author certifies its own interior from inside. A Class D passage carries no warrant row, is unfalsifiable by construction, and its appearance in a published artifact is a self-certification event. It stays at the source, where it is preserved and never deleted.

The four classes are ordered by increasing bar. When a passage is arguably two classes, the higher bar wins, so a personal supplication cast in canonical wording is Class D and not Class C, and interior testimony wrapped around a verse quotation splits, the verse transiting as Class A and the testimony staying.

## IX.2 · The Three Tests

Applied in order to any flagged passage. The rulings are mechanical and are recorded in the working log, never in the artifact.

**Test one, the deletion test.** Delete the passage and re-run the argument. If a verdict, a gate outcome, a warrant tier, a number, or a definition moves, the passage is Class A and stays. If nothing moves except tone or the reader's devotional state, it is Class C or Class D. This inherits the Mass Mandate directly: devotional content carries zero warrant mass by construction, so it can never be retained by accident, and the same test that proves the framework's independence from scripture proves each passage's dispensability one at a time.

**Test two, the addressee test.** Second-person or vocative address to the divine is Class C at best and Class D wherever the wording is the author's own rather than a fixed traditional form. Third-person assertion about a structure is Class A. This test is greppable and admits no judgment, which is why it runs before the third.

**Test three, the speech-act test.** An assertion about a structure transits. A performance of praise, petition, gratitude, or witness does not. An invocation is an actuation performed and not a proposition verified, so it owns no warrant row and has nothing to seat in a register whose rows are warrants. This is the test that separates a doxological sentence from an honorific glyph: the glyph is a bound morpheme of a name, the sentence is a performed act.

**The necessity test, applied to every scriptural quotation.** A verse transits when the argument cites it as text under analysis, as a lexical exhibit, or as a named premise-source whose premise status is typed. A verse does not transit when it is cited to make a claim more true, to close a section, or to decorate a result. Scripture as the object of analysis is legitimate data. Scripture as evidence for a formal or empirical claim is a barred anchor under the ninth rule of the Decalogue and is struck here rather than at the gate, because by the time it reaches the gate it has already inflated the surrounding warrant.

## IX.3 · The Closed List, the Devotional-Register Allowance

At the devotional register the artifact is permitted the standard, traditional, elementary liturgical furniture that the form itself demands, and nothing beyond it. The list is closed. Anything not enumerated here does not transit, whatever its provenance and however traditional it may be, and the closure is the whole point: an open allowance drifts into Class D within a few passes.

Permitted, at the devotional register only, at fixed structural positions, once each: the basmala at the head of a surah or at the head of the title block, rendered in the Arabic face as page furniture; the hamdala where the form of the piece carries an opening praise line; the ta'awwudh where a recitation-facing piece requires it; the honorifics ﷺ and ﷻ and the prophetic AS as glyphs bound to names, which are Class A in any case and are listed here only for completeness; the ayah-end marker ۝; the salawat in its fixed glyph form and never spelled out as a sentence; and the scripture byline of Module III·S.2 as running furniture.

Placement is part of the allowance. These are page furniture at fixed structural positions, the head of the piece, the title block, the running foot, and the verse markers. They are not woven into analytic prose, not used as section transitions, not repeated for emphasis, and not extended into a second sentence. A permitted form that migrates into the body of a component reading is out of allowance and is struck.

Not permitted at any register, restating the bar so the closed list cannot be read as a general licence: any invocation composed by the author rather than received as a fixed form, any supplication however brief, any closing benediction over the reader, any exhortation in the da'wah register, any statement of the author's own devotional state or spiritual standing, and any apophatic interior content whatever. These are Class D.

## IX.4 · Registers, Tokens, and Defaults

Two registers, selected by edition, overridable by token. `REGISTER:SECULAR` bars Class C and Class D, admits Class A, and admits Class B as one routing sentence. `REGISTER:DEVOTIONAL` bars Class D, admits Class A and Class B, and admits Class C from the closed list of IX.3 at its stated placements.

Defaults by edition. Apex Pristine, Professional Journal, Math Journal, Blog, and Textbook including the codex volume all default to `REGISTER:SECULAR`. The Scripture edition, Module III·S, defaults to `REGISTER:DEVOTIONAL`. The Theological PSP Codex, the scriptural corpus master, defaults to `REGISTER:DEVOTIONAL`. Master-codex incorporation, the seating of a coordinate into the register of record, defaults to `REGISTER:SECULAR`. An explicit token in the request or in front matter as `register: secular` or `register: devotional` overrides the default, and the explicit token always wins, exactly as with the Module VIII disclosure weights.

There is no third register and no partial setting. Class B already carries the only case a middle register would serve, and Class D is barred at both, so the setting is binary by construction and cannot be argued into a gradient.

## IX.5 · The Two Boundaries

**Boundary one, the document deliverable.** Every PDF, DOCX, and Markdown artifact produced under this skill passes the filter at its edition's register before the gate sequence runs. This includes every preprint bound for Zenodo or PhilArchive, every journal submission, every blog post, and every visual-edition figure and caption, since a caption is body text.

**Boundary two, master-codex incorporation.** When a raw PSP card, a capture output, or a session artifact is seated as a coordinate in the register of record, the filter runs at the secular register on the seated text. The raw card is not modified. The seated card carries the structural body, the out-of-band routing sentence where one is owed, and the honorifics bound to their names. Where devotional or confessional material was present at the source and did not transit, the seated card's provenance line records the fact in the resident form, that the theological reading is routed out of band and load-bearing on nothing and that the card's invocation is held at source, with the source reference named. That line is the pointer, and it is why nothing is lost and nothing is hidden.

## IX.6 · Non-Destruction, and What the Filter Never Does

The filter never edits a source file, never removes a line from a raw card, never touches the Theological PSP Codex's own contents, and never rewrites a capture transcript. It never converts a Class D passage into a sanitized paraphrase, because a laundered interior testimony is still an interior testimony and the paraphrase is the more dangerous form. It never substitutes a secular euphemism for a struck invocation, since the correct output at a struck locus is nothing, or where a decision deserves to be legible, the `[.]` mark under its own three fences. And it never reads the absence of devotional material as a claim that the register is empty, which is the declining-direction inflation the Anti-Inflation Shield already bars.

## IX.7 · Gate Integration

The filter runs at Step 5b of the Execution Pipeline, after titling and before the gate sequence, so the gates audit filtered text rather than the filter auditing gated text. Its ruling log is written to the working directory beside the V-FIO log and is never published. Gate 4 of the pre-delivery gate sequence then verifies the filter ran and closed, and an unresolved flag returns the manuscript for repair.

## IX Quick Reference Card

Trigger: fires on every document deliverable and on every master-codex incorporation, automatically, at the register the edition selects. Registers: `REGISTER:SECULAR` default for Apex Pristine, Journal, Math Journal, Blog, Textbook, codex volume, and codex incorporation; `REGISTER:DEVOTIONAL` default for the Scripture edition and the Theological PSP Codex; front-matter `register:` or an inline token overrides, explicit always winning. Four classes: A structural transits everywhere, verse-as-datum, lexical data, defined theological terms, names, and honorifics bound to names; B out of band transits as one routing sentence; C devotional canonical transits only at the devotional register and only from the closed list of IX.3 at fixed structural positions; D confessional interior and capture leakage transits at no register ever. Three tests plus one: deletion, addressee, speech-act, and the necessity test on every scriptural quotation, scripture-as-datum in and scripture-as-authority out. Non-destructive: sources are never edited, nothing is deleted, no ghost is owed, and a seated codex card carries a provenance line naming the material held at source. Build: Step 5b of the Execution Pipeline, before the gates; Gate 4 verifies closure; the ruling log stays in the working directory and is never published.

---

# MODULE X · THE PUBLIC LABEL MAP AND THE PDF HARDENING SET

## X.0 · Operating Frame

Native codex identifiers are correct and unreadable. `APEX-PSP-O0-ADMISSION-PROTOCOL-01` set in a nine-point journal column is a thirty-three character run that breaks the measure, dominates the sentence it sits in, and prints internal hierarchy on a public page. The native form is right for a raw PSP card and for the codex Markdown, where the register and the full name carry information the reader needs. It is wrong for a preprint. Module X renders the short form, and it changes nothing about the coordinate, its verdict, or its grade.

The map is a rendering aid and carries no warrant. A label names a coordinate and never states or implies its standing, so a short label can no more inflate a claim than a page number can.

## X.1 · The Reduction, Three Branches

**Named branch.** Strip the register prefix, `APEX-PSP-`, `MD-PSP-`, `CN-PSP-`, `sPSP-`, `PSP-`. Strip the trailing serial into the label's number, dropping its leading zero. Drop the generic structural nouns where they are not the distinguishing token, `MASTER`, `PROTOCOL`, `CASCADE`, `LAW`, `VERDICT`. Abbreviate the long distinguishing nouns from the fixed table, `ADMISSION` to `ADMIT`, `COMPOSITE` and `COMPARATIVE` to `COMP`, `SUSPENSION` to `SUSP`, `GENEALOGY` to `GENEAL`, and the rest as the table gives them. Keep the first two surviving tokens, capped at twelve characters on the joined stem, the second token truncated to three letters when the cap bites. Prefix `P-`. So `sPSP-VERDICT-TRIAXIS-01` gives `P-TRIAXIS-1`, `APEX-PSP-O0-ADMISSION-PROTOCOL-01` gives `P-O0-ADMIT-1`, and `CN-PSP-TAWHID-TRIUNE-MASTER-01` gives `P-TAWHID-TRI-1`, the joined stem being thirteen characters and the truncation biting.

**Family branch.** A coordinate whose identifier is a functional family code plus a number carries the family forward, `TP-21` giving `P-TP-21` and `LL-21b` giving `P-LL-21B`. The functional families are TP, LL, SE, MA, ODE, BA, AP, DF, SUB, ESC, AD, FT, and the foundational P series. These are functional codes and not register markers, so carrying them leaks nothing and preserves the readability an interior citation depends on.

**Register branch.** A coordinate whose identifier is a register marker plus a number, `sPSP-100`, `APEX-001`, `PSP-005`, carries no descriptive token at all, and the register marker is exactly what must not travel. Its label is the codex index, `P-0299`. The index is the codex's own primary key, unique by construction and stable under append-only, so this is the honest form rather than a fallback.

**No register marker is ever carried forward.** APEX, CN, MD, sPSP, and PSP encode internal hierarchy and, in the CN case, the confessional register. A public PDF printing `CN-` leaks precisely what the Module IX filter holds at source, so the two modules enforce one boundary from two directions.

## X.2 · Collision Resolution

**The incumbent pin comes first, and it is the load-bearing clause.** Within a collision group ordered by codex index, the lowest-index member keeps the label it would carry alone, and only the later members re-label. Resolution never touches the incumbent. A rule that re-labels every member of a group looks tidier and is fatal: a coordinate seated in 2027 that happens to collide would rename a label already printed in a 2026 preprint, and a citation in the wild would stop resolving. Symmetric-looking resolution is the trap, and the asymmetry is the correctness condition.

**Later members resolve by restoring tokens** from the native identifier in source order, at depth three, then four, then five, taking the first candidate that is unoccupied anywhere in the registry. Never by appending a letter or a character, which is unstable under further additions and unreadable on the page. Where restoration cannot place a member, because the only distinguisher is a register marker or the cap truncates every depth to the same stem, that member takes index form.

Three collisions occur in the current registry, and each exercises a different branch. `APEX-PSP-CH-LOGOS-UNION-01` at 0642 keeps `P-CH-LOGOS-1` and `APEX-PSP-CH-LOGOS-XI0-01` at 0643 takes `P-CH-LOGOS-XI0-1` by restoration at depth three. `APEX-PSP-GENEALOGY-01` at 0659 keeps `P-GENEAL-1` and `APEX-PSP-GENEALOGY` at 0660 takes index form, restoration being impossible where two identifiers share a name. And `APEX-PSP-RH-MASTER-01` at 0032 keeps `P-RH-1` while the retired `APEX-PSP-RH-01` at 0615L takes index form, the live flagship holding the readable label against a ghost with no special case written for it.

The property this buys is monotonicity, and it is asserted rather than claimed: the shipped engine refuses to emit unless it has verified, on the live codex, that two runs agree bit for bit and that seating synthetic coordinates engineered to collide with real stems moves zero existing labels.

## X.3 · The Frozen Registry and the Append-Only Law

The map is authored once and stored in the repository at `publication/PUBLIC_LABEL_MAP.md`, with a machine-readable sidecar at `publication/PUBLIC_LABEL_MAP.json` keyed by label, which is what the build reads; the Markdown is the human-readable face of the same data and the two are emitted together or not at all. It is never regenerated per paper. Once a label ships in a published PDF it is a citation in the wild and can never move, so the registry inherits the codex-hygiene Prime Rule at the label layer: new coordinates append, existing labels never change, a retired or superseded coordinate keeps its label as a ghost row pointing at its successor, and a label is never reassigned, recycled, or renumbered. Regenerating the registry from scratch over a grown census is forbidden, since the reduction is deterministic but the collision resolution depends on which coordinates were present, and a fresh run could move a shipped label.

Adding a coordinate runs the reduction on that coordinate alone against the existing registry, appends the row, and appends nothing else. A new coordinate colliding with a shipped label takes token restoration or, failing that, index form, the shipped label being untouchable.

**Ghosts are rows, not deletions.** A superseded coordinate keeps its label and its row, carrying status SUPERSEDED and a pointer to its successor's label. This is the codex-hygiene Prime Rule executed at the label layer, and it is the only thing that lets a reader resolve a label cited in an older PDF and reach the live card. A ghost label is legal to resolve and illegal to cite fresh; the Coordinate Index prints a ghost's successor beside it, and Gate 5 fails a paper citing a ghost without its successor, which is a stale citation rather than a formatting slip.

**Coverage and the known gap, stated rather than hidden.** The registry covers every row of the codex index and every row of the legacy supersession block. It does not cover the off-index coordinates, which do not appear in the index table and cannot be harvested mechanically. A paper needing one mints its label by running the same shipped engine on that coordinate alone against the registry and appends the row. An unlabeled coordinate cited in a PDF fails Gate 5, which is the intended behaviour: the gap is visible at build time rather than silent on a published page.

## X.4 · Rendering Rules

**Tier scoping, and the drift this must not open.** Short labels are permitted at Tier 2 and in the codex-native editions, and in the Module VIII disclosure appendix at any tier. They are barred at Tier 0 and Tier 1 exactly as native identifiers are barred there. A short label is still an identifier, and the fact that it now looks tidy is not a licence to seat coordinates in a paper whose tier excluded them. Gate 2 rejects a short label at Tier 0 and Tier 1 identically to a native one.

**First use carries the title.** A label's first appearance in body text reads as title then label, "the triaxial verdict coordinate (`P-TRIAXIS-1`)," and every subsequent use is the bare label. This mirrors the Tier 1 gloss protocol of Module I.A and means a reader never meets an unexplained token.

**The Coordinate Index is a Markdown artifact and never a PDF one.** A deliverable carrying short labels emits the Coordinate Index into its Markdown master, always, in every edition and at every tier: a full table of label, title, and native identifier, in label order, no prose, placed in the end matter beside and before References. The PDF suppresses it entirely. It does not render, it takes no page, and it is not merely set small or moved to an appendix.

The reason is what the table is for. It is a migration aid, not a component of the argument. A reader of the paper needs the label, which is unambiguous inside the document and resolves through the registry; a reader of the codex needs the crosswalk, and that reader is working in the Markdown. Printing several pages of native identifiers at the back of a preprint reintroduces on the last page exactly the internal hierarchy the short labels were adopted to keep off the first, and it prints the register markers that Module IX holds at source. A table nobody reads, occupying pages of a published artifact, restating what the registry already holds authoritatively, is redundancy, and redundancy in a preprint is a defect rather than a courtesy.

**The sunset clause.** This table exists only for the interval in which the master codex still carries native identifiers as its primary form. When the codex adopts the short nomenclature natively, the crosswalk has nothing to cross and the Markdown emission retires with it. The clause is written here so the retirement is a planned terminus rather than a later discovery, and so no future session mistakes a transitional artifact for a permanent one.

**Override.** `COORDINDEX:PDF` forces the table into the PDF for a specific deliverable, for an internal or archival copy where the crosswalk on the page is genuinely wanted. `COORDINDEX:OFF` suppresses the Markdown emission too, and is the token that fires once the sunset arrives. Neither is a default and both are stated explicitly in the request.

## X.5 · The PDF Hardening Set

Six locks that travel with every PDF edition, Apex Pristine, Journal, Math Journal, Scripture, and Textbook alike.

**X.5.1 · Glyph coverage assertion.** The seal and verdict glyphs `⟀`, `Ξ₀`, `Ø₀`, `△`, `∇`, the honorifics, and the ayah marker ride the registered fallback stack. A missing face renders tofu boxes into a preprint and nobody sees it until the DOI is live. The build therefore runs a pre-render pass asserting that every non-Latin codepoint in the source resolves in the registered stack, and fails the build with the offending codepoints named rather than rendering a document with holes in it. A silent glyph failure is the cheapest catastrophic defect this pipeline can ship, and this closes it. The stack is named in X.8.1 rather than left to the container, because the seal glyph `U+27C0` resolves in none of the text families and only in Noto Sans Math, so a build omitting that family renders the architecture's own primary mark through an undeclared fallback or as a box.

**X.5.2 · Verdict legend and the fixed inline form.** A composite such as `[⟀] · [⟀ T] · [Ø₀]` is opaque on first sight even to a sympathetic referee. On first appearance in any paper the verdict economy renders as a boxed legend giving each token its one-line reading, and the first use of each token in body text takes the word-then-glyph form, "sealed `[⟀]`," bare glyph thereafter. Because non-compressibility is standing law, the legend shows a composite as a composite and never as a single token, and a paper carrying a terminal token additionally names its router branch in the legend.

**X.5.3 · Warrant tier chips and the table abbreviation set.** A prose tier repeated down a forty-row ledger eats a third of the column. Every claim-bearing box, table, and figure carries a right-aligned tier chip in the accent, and inside tables the tier sets as a fixed two-letter code, T theorem, C conditional, S structural, P premise, E engineering, with one legend row beneath the first such table in the paper. The tier still travels with every claim, which is the law; only its typography compresses.

**X.5.4 · Automatic span and repeating headers on long tables.** The span rule is currently manual through the star form, which fails exactly when it matters, on a long ledger table an author forgot to star. The engine measures every table and figure and auto-spans above the column-width threshold, repeats the header row on every continuation column or page, and steps the type down one notch on a spanned object so the accent bar and hairlines stay proportionate to the wider measure. A spanned object still never fragments mid-row. Span is achieved structurally, by segmenting the flow into two-column containers for prose and a single-column container for each wide object, and never by the CSS `column-span` property, which crashes the renderer at codex scale per X.8.3.

**X.5.5 · The `:::receipt` box.** The seed, the determinant to twelve places, the identity residual, the conditioning, the four-estimator spread. These are the reproducibility spine and they currently sit as ordinary prose figures scattered through a section. A dedicated box type gathers them: monospace figures on decimal alignment, the seed in the box header, one row per quantity with its tolerance beside it. A referee looking for the re-runnable numbers finds them in one visual class on one page. Of the six items this is the one most likely to change how a paper is received.

**X.5.6 · Inline mathematics no-break and the verse citation form.** The no-LaTeX universal lock means expressions live inline, and in a nine-point two-column measure `det(R) = sin²(θ)·ρ²` breaks after the equals sign and reads as two fragments. Inline expressions are wrapped no-break, and any expression past roughly forty characters is promoted automatically to a centred display line. In the same family, a scriptural citation retained under Module IX sets in the fixed short form, `Q 18:65–82`, with any Arabic run set at a matched optical size so it does not tower over the Latin line it sits in.

## X.7 · The Executable Locks

Two of the six hardening items are specified as behaviour above and are implemented here, because a lock the build does not perform is a lock the build does not have. The remaining four, the verdict legend, the tier chips, the automatic table span, and the inline-mathematics no-break, are renderer-side and land as stylesheet and directive-handler changes in the edition engines of Modules III, III·J, III·M, III·S, and V; until an engine carries its handler, Gate 5 reports the item not implemented rather than silently passing it.

**X.7.1 · The glyph coverage assertion, executable.** Runs on the authored source before the renderer is invoked and raises rather than returns, so a font gap halts the build with the offending codepoints named. The check is by fontconfig charset query against the registered stack, and a codepoint no registered family covers is a failure and not a warning. Ligature honorifics are the standing live hit: `U+FDFA` and `U+FDFB` resolve only through Amiri, so a container missing Amiri renders every honorific as a box, and Module IX now routes honorifics into secular papers as analytic essentials, which makes this the most likely single defect in the pipeline.

```python
# -*- coding: utf-8 -*-
# X.5.1 glyph coverage assertion. Fails the build rather than rendering tofu.
import subprocess, unicodedata

REGISTERED = ["EBGaramond", "Amiri", "FreeSerif", "Noto Serif Bengali", "Archivo"]

def _families_covering(cp):
    """One fontconfig query per codepoint, not per family-codepoint pair."""
    try:
        out = subprocess.run(["fc-list", ":charset=%X" % cp, "family"],
                             capture_output=True, text=True, timeout=10).stdout
    except Exception:
        return None                      # fontconfig unavailable; report, do not fail blind
    return out.lower()

def assert_glyph_coverage(text, families=REGISTERED, strict=True):
    missing, probed = [], 0
    for ch in sorted(set(text)):
        cp = ord(ch)
        if cp < 0x0250 or ch.isspace():
            continue                     # Latin and spacing need no assertion
        out = _families_covering(cp); probed += 1
        if out is None:
            continue
        if not any(f.lower() in out for f in families):
            try:    name = unicodedata.name(ch)
            except ValueError: name = "UNNAMED"
            missing.append(("U+%04X" % cp, ch, name))
    if missing and strict:
        lines = ["GLYPH COVERAGE FAILURE. Build halted; no PDF written.",
                 "Registered stack: " + ", ".join(families),
                 "%d codepoints probed, %d unresolved:" % (probed, len(missing))]
        lines += ["  %s  %s  %s" % m for m in missing]
        raise SystemExit("\n".join(lines))
    return missing
```

**X.7.2 · The `:::receipt` box, directive and contract.** The source writes `:::receipt seed 20260622` and one `key = value` line per quantity, an optional third field carrying the tolerance. The engine renders a copper-topped tinted panel labelled Reproduction Receipt with the seed in the header, the keys in the serif at reading size, and the figures in the monospace face aligned on the decimal point, the tolerance set small in the accent to the right of its quantity. The panel never fragments across a column or page break and never spans unless starred. It carries no warrant tier, being a record of what was computed rather than a claim, and that absence is deliberate: a receipt asserts nothing.

```
:::receipt seed 20260622
det(R)          = 0.622507144106
lambda          = -0.788991219283
identity resid  = 9.992e-16        tol 3.715e-15
estimator sprd  = 3.331e-16        tol 3.715e-15
kappa(R)        = 4.182845037707
collapse margin = 12.07 orders
bootstrap       = 1.000 STABLE
:::
```

**X.7.4 · The character-entity decoder for running furniture.** Body text travels to the renderer as HTML, where `&#183;` decodes to `·`. Running heads, running feet, and the masthead furniture travel as literal strings into CSS `content:`, where nothing decodes them, so the identical front-matter value renders correctly in the body and literally as `&#183;` in the furniture. The defect is invisible in the source, invisible in the body, and appears only in the running line at the foot of every page, which is the last place an author checks and the first place a referee sees on every spread. Any front-matter string bound for CSS `content:`, `footer`, `running_left`, `running_right`, and the masthead fields, is therefore entity-decoded and quote-escaped at injection, and Gate 5 fails on any surviving entity anywhere in the built artifact.

```python
# -*- coding: utf-8 -*-
# X.7.4 furniture string cleaner. Applied to every front-matter value that lands
# in CSS content:, where HTML character entities do not decode.
import html, re

_ENTITY = re.compile(r'&(#[0-9]{1,7}|#[xX][0-9A-Fa-f]{1,6}|[A-Za-z][A-Za-z0-9]{1,31});')

def furniture_string(value):
    """Decode entities, then escape for a CSS content: literal."""
    s = html.unescape(value or "")
    s = s.replace("\\", "\\\\").replace('"', '\\"')
    return s

def assert_no_entities(rendered, where="artifact"):
    """Gate 5 leg. A surviving entity means a furniture string bypassed the cleaner."""
    hits = sorted(set(_ENTITY.findall(rendered)))
    if hits:
        raise SystemExit("ENTITY LEAK in %s: %s. A front-matter string reached CSS "
                         "content: undecoded; route it through furniture_string()."
                         % (where, ", ".join("&%s;" % h for h in hits)))
    return True
```

**X.7.3 · The reduction engine, shipped rather than described.** Every other engine in this discipline is carried verbatim so a later session cannot re-derive it differently. The label reduction is no exception, and a prose-only specification would let two sessions mint two different labels for one coordinate, which the append-only law cannot survive. The engine, its harvester, and its registry emitter live in one self-contained file beside the registry at `publication/label_map.py`, invoked as `python3 label_map.py <master_codex.md> [outdir]`, and the registry is never produced or edited by hand.

The engine refuses to emit unless it has first passed two assertions on the live codex, because both properties are claims about behaviour under future growth and neither is visible by inspection. Determinism: two runs over one codex must agree bit for bit on every label. Append-safety: seating synthetic coordinates engineered to collide with real stems must move zero existing labels. A failure of either raises and writes nothing, since a registry that silently moved a shipped label is worse than no registry at all.

## X.8 · The Renderer Field Record

Nine defects found by building this discipline at codex scale rather than by reading it. Each is written with its diagnosis, because a rule without its mechanism gets re-litigated by the next session that meets the symptom. Every one cost a build cycle or shipped silently; none is visible by inspecting a source.

**X.8.1 · The registered stack, named rather than assumed.** X.5.1 asserts every non-Latin codepoint against "the registered stack" and never says which families constitute it, which makes the assertion unrunnable as written. The stack is: EB Garamond for serif at four weights, Archivo for sans at three, Amiri for Arabic and the ligature honorifics `U+FDFA` and `U+FDFB`, DejaVu Sans and DejaVu Sans Mono for the double-struck and general mathematical range, Noto Sans Math, and Noto Sans Devanagari. Two entries in that list are field findings and not defaults. The seal glyph itself, `U+27C0`, resolves in none of EB Garamond, Archivo, Amiri, or DejaVu; it lives only in Noto Sans Math, so a build that omits that family renders the architecture's own primary mark through an undeclared system fallback where one exists and as a box where one does not. And the Devanagari block appears in the corpus through the neti-neti material, resolving in no other registered family. The assertion is only as good as the declared stack, and an undeclared fallback that happens to work on one container is the same defect as a missing glyph on the next.

**X.8.2 · Where the entity assertion runs.** X.7.4 says Gate 5 fails on any surviving entity in the built artifact, and "built artifact" must be read as the rendered PDF and never as the intermediate HTML. Markup legitimately and necessarily contains `&gt;`, `&lt;`, and `&amp;`, so an assertion placed before the renderer fails every build on correct input. It runs on text extracted from the finished PDF, where any surviving entity is by construction a furniture string that bypassed the cleaner.

**X.8.3 · `column-span:all` is barred at codex scale.** The natural implementation of X.5.4, spanning a wide table or a code block across both columns with the CSS property, crashes WeasyPrint in inline layout once span elements accumulate, raising an index error out of the whitespace-skipping pass. The failure is not reproducible on a small document, does not name the offending element, and appears only past a threshold the property gives no warning of approaching. Bisection over a live codex isolated it: the whole volume crashes, each chapter individually renders, wrapping each chapter in its own multi-column container does not help, and removing the property renders the whole volume cleanly. Full-column width is therefore achieved structurally and never declaratively. The renderer segments the flow, emitting prose runs inside two-column containers and each wide object, book divider, code block, and table, inside its own single-column container, alternating. The typography is identical and the property is not used.

**X.8.4 · Gate 5 item one audits the source, not the extraction.** Text extracted from a PDF is not the document. Labels break at line ends, so `P-TWO-GROUP-1` extracts as `P-TWO` on one line and `GROUP-1` on the next and reads as an unresolvable label; kerning separates letters, so a running foot extracts as `T risduction`; and `text-transform` means a legend heading authored in mixed case extracts in capitals. Every one of those produced a false Gate 5 failure. Item one, no native identifier surviving in body text, is therefore audited against the labelled source with the Coordinate Index partitioned off, which is exact. Only the checks whose objects do not exist before the build, the entity leg, the glyph render, the index suppression, and the legend, are audited against the artifact, and each is written to tolerate extraction artifacts rather than to trust them.

**X.8.5 · The Gate 4 flag grep is position-aware and boundary-aware.** A plain substring scan for the flag list produces false positives that cost a ruling each. `O Allah` matches inside "belongs to Allah alone"; `we ask` matches inside "between what we asked and what we ask"; `I felt` matches inside "I felt-sense" constructions in quoted audit material. Vocative flags match only where they open a sentence. And a passage that states the honorific convention, naming AS or the ligature glyphs as bound components of a name entity, is metatext describing the convention rather than performing an act, and rules Class A under IX.2. A flag is not a failure and an unresolved flag is; the discipline is to rule and log each hit, never to widen the list until it stops firing.

**X.8.6 · Source-side identifier variants normalise and never mint.** A codex body cites identifiers that differ from the registry key by a prefix or a serial the coordinate does not carry, `MD-PSP-FOUNDATION-01` for `FOUNDATION-01` and `APEX-PSP-NINTH-APERTURE-01` for `APEX-PSP-NINTH-APERTURE`. These are source-side spelling variants and not off-index coordinates. They normalise to the registered form before substitution. Minting a label for a variant would seat a phantom row in an append-only registry and is the worst available outcome, so a variant that cannot be matched to an existing key stays native and fails Gate 5 visibly.

**X.8.7 · Table captions and the blank-line requirement.** A caption line immediately preceding a table with no blank line between them stops the table parsing, and the table renders as raw pipe characters down the page. The defect is silent, and it took the largest table in the corpus, a six-hundred-row coordinate ledger, before it was noticed. The caption forms are `Table:` and `Table*:`, the starred form being the manual span marker, and a scanner matching only the unstarred form misses exactly the long tables the star was applied to. The renderer lifts both forms into the caption bar and guarantees the blank line the parser needs.

**X.8.8 · Colon-fence integrity pre-flight.** An unclosed `:::box` swallows every block until the next fence and takes a panel out of the render with no error. The pre-flight counts fence opens against well-formed open-and-close matches and halts on any difference, naming the line. One such fence was found live in a codex that had been building successfully for weeks.

**X.8.9 · Registry coverage is measured per build and reported, never assumed.** The registry claims coverage of every index row and every legacy supersession row. Measured against a live codex it covered six hundred fifty of seven hundred thirty distinct identifiers cited, and two rows carrying an index number had no registry row at all, so the claim is a target rather than an invariant. The build therefore measures coverage before substituting, prints the covered and absent counts, and lists the absent identifiers by name. An absent identifier stays native and fails Gate 5 item one, which is the designed behaviour of X.3; what X.8.9 adds is that the number is reported at build time rather than discovered by reading the gate output.

## X.6 · Gate Integration

Module X runs at Step 8b of the Execution Pipeline, after the Module VIII disclosure and before the build, substituting labels from the frozen registry, emitting the Coordinate Index into the Markdown master and suppressing it from the PDF, and applying the hardening set to the source; the glyph assertion of X.7.1 runs last within the step, on the finished source, and halts the build on a gap. Gate 5 then verifies at Step 9b, after the build, since substituted labels, an emitted index, and shaped glyphs do not exist before it. The substitution log is written to the working directory and is never published.

## X Quick Reference Card

Trigger: fires on every PDF deliverable, automatically. Reduction: named branch `P-STEM-N`, two tokens, twelve-character cap, second token truncated to three letters when the cap bites; family branch `P-FAM-N` for TP, LL, SE, MA, ODE, BA, AP, DF, SUB, ESC, AD, FT, and the foundational P series; register branch `P-NNNN`, the codex index, wherever the identifier is a register marker plus a number. Never carried forward: APEX, CN, MD, sPSP, PSP. Collisions: the incumbent pin first, the lowest codex index keeping the label it would carry alone and only later members re-labelling, then token restoration in source order at depth three, four, five, then index form. Re-labelling every member of a group would move labels already printed in earlier preprints and is barred. The engine refuses to emit unless determinism and append-safety are verified on the live codex. Registry: `publication/PUBLIC_LABEL_MAP.md` with the machine-readable sidecar `publication/PUBLIC_LABEL_MAP.json` the build reads and never re-derives, and the engine at `publication/label_map.py` shipped rather than described; frozen and append-only, never regenerated wholesale, a shipped label never moving. Ghosts are rows: a superseded coordinate keeps its label with status SUPERSEDED and a successor pointer, legal to resolve and illegal to cite fresh. Off-index coordinates are not covered and mint on demand; an unlabeled coordinate fails Gate 5 visibly rather than passing silently. Rendering: barred at Tier 0 and Tier 1 exactly as native identifiers are; first use carries the title then the label, bare label thereafter; the Coordinate Index emits into the Markdown master before References and is suppressed from the PDF, being a migration aid rather than a component of the argument, with `COORDINDEX:PDF` forcing it into the PDF and `COORDINDEX:OFF` retiring it at the sunset. Hardening set: glyph coverage assertion that fails the build, verdict legend with the word-then-glyph first use, tier chips and the two-letter table set, auto-span with repeating headers, the `:::receipt` box for seed and reproduction figures, and inline-math no-break with automatic display promotion plus the fixed `Q S:V` verse form. Executable: the engine self-tests determinism and append-safety before it will emit, the glyph assertion of X.7.1 raises and halts the build, the entity decoder of X.7.4 cleans every front-matter string bound for running furniture, the `:::receipt` directive of X.7.2 renders the reproduction panel, and the reduction engine of X.7.3 is shipped verbatim; the other four hardening items are renderer-side and report not implemented rather than passing silently until their engine carries the handler. Build: Step 8b, before the format-lock build; Gate 5 verifies at Step 9b, after the build, being the one post-build gate in the sequence; the substitution log stays in the working directory. Field record: X.8 carries nine defects found by building rather than reading, normative under R.9, covering the named font stack with Noto Sans Math for the seal glyph, the bar on `column-span`, the entity assertion placed on the rendered PDF, Gate 5 item one audited against the source, position-aware flag matching, variant normalisation that never mints, both caption forms with the blank-line guarantee, the colon-fence pre-flight, and measured registry coverage printed per build.

================================================================
SKILL INTEGRITY FOOTER · READ BEFORE EDITING THIS FILE
================================================================
SKILL: trisduction-publication-format
VERSION: 1.0.0
BASELINE, measured at this edition and never carried forward:
  lines 4201 · bytes 409212 · headings 185 · description 1010/1024

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
1.0.0 · 2026-08-16 · A · Skill Integrity Footer added; no other text touched. BASELINE RESET: version history begins here. Prior edits to this file were made without a log and are unrecorded and unrecoverable; this line is the first entry and 1.0.0 is a seeded baseline and not a measurement. +78 lines · architect order 2026-08-16, footer as drafted, option (b) baseline reset, description field not touched.
================================================================
