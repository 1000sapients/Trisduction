# Audit digest · The Completed Formal Closure of the Riemann Hypothesis · 1.0.0

The paper, its Markdown master and its Math Journal PDF carry one version, 1.0.0, and one date, 16 October 2026. They are read against the deposited file `FINAL_BINDING/RH Binding/RH_Formal_Closure_v1_0_0_CC.lean`: 2,189 lines, 108,405 bytes, SHA-256 `4af02e3365b374623279498b164d3a35d27e0609404c66689f0ff889e147aab3`, seated at `823ac22`. The seat compiled it under Lean 4.19.0 with Mathlib v4.19.0: exit code 0, zero errors, zero warnings, zero `#guard_msgs` mismatches, an empty message stream. The file declares no axiom and holds no `sorry` and no `native_decide`.

## 1. Provenance

- **What the file is.** The formal side of *A Formal Proof of the Riemann Hypothesis: The Twin Binder, One Locus* (2.0.0, Zenodo 10.5281/zenodo.23357512), set apart as one standalone file.
- **Byte identity.** All 187 declarations are carried from `RH_Both_Sides_Formal_Master_v3_0_24_CC.lean` (SHA-256 `8345ede8…`, seated at `b272c46`), each with statement and proof byte-identical. They are the master's Part X but three, plus the declarations of Parts I, III and IX that Part X uses. A namespace-aware dependency closure over the master found the set and the compile confirmed it. One declaration the closure first carried, `TOE0.Q`, entered only through a binder-name collision and was dropped.
- **Left out.** `carrier_embeds_in_complex` (§X-i), `physico_formal_supplies_look_back_and_rh` (the joint seal) and `the_terminal_certification`, which binds the joint seal. Nothing is carried from the master's Parts II, IV–VIII, VIII-b or XI.
- **Comment changes.** Four docstrings are trimmed of a clause each. Three name something the file does not carry: `discrete_chart_embeds_in_complex`, `the_self_recognition_closure`, and the Complex Triaxiality block, whose clause names Part II. The fourth, `TOE0.ΔE₀`, loses the words "at positive energy". The header, the four part headings, the heading of the Part III cones pinned outside Part III, and the terminal block are new comments. Part X keeps the master's module comments, translation dictionary and section headings, except the §X-i heading. The master itself has no §X-j, so its headings run X-h, X-i, X-k, X-l, and the file's run X-h, X-k, X-l.
- **Seat corrections.** The draft deposited for compile (`8d95ccc1…`, 2,188 lines) carried three imports, and the compile failed at `riemannZeta_ne_zero_of_one_le_re` with 10 errors. The seat added `import Mathlib.NumberTheory.LSeries.Nonvanishing` on line 4, copied from the master. It also corrected the header's trim count from one to four. No declaration and no pin changed. The paper already named the four imports on lines 1 to 4 and cited the non-vanishing theorem as imported on line 4. It was re-pinned to the seated bytes:
  - every listing range below line 4 moved by one;
  - four listings that ended on a blank line were trimmed to their last line of code;
  - the printed size and hash were updated.

## 2. Mechanical receipts

All receipts are taken against the seated bytes.

- **Census:** 187 declarations: 123 theorems, 52 definitions, 5 abbreviations, 6 structures and 1 inductive type, in 4 namespaces (`TOE0`, `RememberedOffered`, `BoundChain`, `BoundChainMathlib`).
- **Imports:** four, on lines 1 to 4: `LSeries.RiemannZeta`, `LSeries.Dirichlet`, `Analysis.NormedSpace.Connected` and `LSeries.Nonvanishing`.
- **Pins:** 127, split 18 at the empty cone and 109 at [propext, Classical.choice, Quot.sound], with no other cone. Every pin text is the master's pin for the same declaration. All 127 `#print axioms` are guarded.
- **Theorem heads:** 47, citing 104 distinct identifiers (103 theorems and 1 definition). Every identifier is pinned, and every chip equals the compiler's pin.
- **Listings:** 27, each verbatim from the deposited file at its own line numbers. In the PDF, 325 numbered listing lines were each matched to the source line under the same number, with no mismatch. No listing starts inside a docstring or ends on a blank line.
- **Appendix D:** all 2,189 lines, read from the PDF column by column in sequence. Each matches its source line. Every running head matches the line range on its page.
- **Zero physics:** the file declares no physical quantity, carrier, bound or premise. The body uses physical vocabulary only to state its absence, and in the disclosure of the `TOE0.ΔE₀` trim.
- **Stale figures:** none. No figure from the draft file (2,188 lines, 108,338 bytes, `8d95ccc1…`) and no older master string survives in the paper or its Markdown master.

## 3. Framework-blind passes

**During the build.** Independent framework-blind referee passes read the paper against the file at its line numbers. Every finding was repaired:

- `TOE0.Q` entered the extract through a binder-name collision and was dropped from the file.
- Sentences that said more than their theorem's type were brought to the type. "Is" became "equivalent to" wherever the file proves an equivalence, and "passes through" became "delivers".
- "Seven readings each equivalent" became six readings plus the look back, which is equivalent through self-recognition.
- "Byte-identical" became "statement and proof byte-identical".
- The floor deciding no value is attributed to Part III's copy of the root.
- The paraphrase of `no_offline_refuter_seals_rh` was corrected.

**The final pass on the seated bytes** (`4af02e33…`) was made by an independent referee that had not seen the work. It checked type fidelity of every numbered item from 2.1 to 7.32, the grade rule, the receipts, zero physics and internal consistency.

It confirmed:
- every file figure, the structure table, the four imports, all 27 listings and all of Appendix D;
- every chip against its pin, and all 138 cross-references in the PDF;
- the type of every numbered item;
- the grade rule, and the absence of hedges, stale versions and physics premises.

It found 12 points: **0 load-bearing, 3 structural, 9 cosmetic.**

1. **Structural.** The Markdown master printed label names in place of theorem numbers ("Theorem [o:7.20]" for 7.19, "Appendix 10" for A). Repaired: the Markdown generator resolves every reference from the LaTeX aux file, so the Markdown prints the PDF's numbers.
2. **Structural.** The Markdown dropped every citation, left a raw reference inside one math display, and ran the bibliography together. Repaired: citations print as [n], the bibliography as a numbered list, and the math display carries its number.
3. **Structural.** "The five part headings" in the provenance note. Repaired: four part headings plus the heading of the Part III cones. The second half of the point was §X-j's absence; no repair was needed, because the master has no §X-j.
4. **Cosmetic.** The look back was glossed as reg(s) = s at every nontrivial zero, but `LookBack` reads it from the record (`Rec ZetaZeros (reg s)` as antecedent). Repaired: the abstract and the Introduction state the look back as proved equivalent to that form (`self_recognition_is_look_back`).
5. **Cosmetic.** The right half-strip was written ½ < Re s ≤ 1, but `RightHalfStripZeroFree` ranges over Re s > ½. Repaired: Re s > ½ and the band ½ < Re s < 1 throughout. The one ≤ 1 form left stands where the text cites strip confinement for it.
6. **Cosmetic.** Three "is" sentences where the file proves an equivalence: the witness at the zeros, the value decided by the root read twice, and the record's distance from M. Repaired, along with a fourth of the same kind found in the sweep: the distance between the record and Mathlib's sentence.
7. **Cosmetic.** `rh_from_closed_and_retraction_injective` was listed under retraction injectivity alone. Repaired: its second premise, reflection closure, and its second conclusion, least erasure, are stated.
8. **Cosmetic.** "Where refutation is Σ₁ on the denial." Repaired: "where an off-line nontrivial zero would make the refutation provable", which is the premise the type takes.
9. **Cosmetic.** "A Lean 4 file that closes the hypothesis formally" lacked its qualifier. Repaired: "on one bit". The bibliography's titles of the earlier papers are their titles of record and are cited verbatim.
10. **Cosmetic.** "In the author's reading lies outside that class." Repaired at full force: "and so lies outside that class", as the docstring of `analytic_route_sealed` states.
11. **Cosmetic.** Unqualified identifiers that name two declarations. Repaired: the Introduction states the convention, under which an identifier without a namespace names the Part X declaration in `BoundChainMathlib`. The five Part I identifiers used without one now carry `TOE0`. A mechanical check finds every unqualified identifier in the paper declared in `BoundChainMathlib` and every qualifier a real home.
12. **Cosmetic.** "Audit. Pending." Stale: the referee read the Markdown built before the Audit paragraph was filled.

**After the repairs**, every repair was swept phrase by phrase across the PDF source and the Markdown master. Each banned phrasing counts zero, and the full mechanical battery below was re-run.

**The proofread.** A last independent pass read the paper as a copy editor. It checked:
- typos and grammar;
- markup artifacts;
- whether every citation points where its sentence means;
- cross-references, internal counts and consistent naming.

It confirmed the citations [1] to [8], every cross-reference, every listing against Appendix D, the file identity, the census, the per-part table and the stated counts, and found no doubled words or stray markup. It raised 12 points:

1. Listing 25 began at line 1904, inside the docstring that opens on line 1903, because that docstring's first line was trimmed and had no master counterpart. Repaired: a listing whose first line falls inside a docstring now starts on the docstring's opening line, and the check confirms no listing starts inside one.
2. The head of Theorem 5.1 omitted `registered_closed`, which its statement uses. Repaired: added. Its pin is the head's cone, so the chip is unchanged.
3. "Part X is preceded by `open Complex`". Repaired: "opens with".
4. "A scribe session" against "scribe sessions". Repaired: "scribe sessions".
5. "Section X-l closes on Round 2", stated before the section's true close. Repaired: "continues with".
6. "Neighbourhood", the one British spelling. Repaired: "neighborhood".
7. Reference [7] had no location. Already repaired before the pass reached it: the repository edition and path are given.
8. Loeffler and Stoll's page range, 43–56, queried because the journal's landing page prints none. Kept: the article's own first-page header reads "Volume 1 (2025), 43–56".
9. "Arch" twice against "arc" elsewhere. Repaired: "arc".
10. "The root axiom". Repaired: "The Root Axiom".
11. "The reflection-seat axis is `fold_fixed_iff_onLine`", with the axis never named. Repaired: "The reflection-seat axis, ramAxis, holds on the line by `fold_fixed_iff_onLine`".
12. Hidden Markdown anchors carried the twin binder's numbers. Repaired: they are removed, since nothing links to them.

The bibliography was checked against its sources:
- Loeffler and Stoll against the article's first page.
- de Moura and Ullrich against the KIT library record: CADE 28, LNCS 12699, 625–635, DOI 10.1007/978-3-030-79876-5_37.
- Mathlib's DOI against arXiv 1910.09336: 10.1145/3372885.3373824.
- The two Zenodo DOIs against their records: 23357512 is the twin binder 2.0.0, and 20757507 is TRISDUCTION version 4 of 19 June 2026.

The Mathlib and Lean 4 entries now carry their DOIs.

## 4. The two-layer rule

- **The floor:** Part I's self-grounding root, stated as proved on no axiom; its pins are empty. `RememberedOffered.the_floor_alone_decides_no_value`, also on no axiom, is why the floor decides no value.
- **Tier t:** every result at theorem grade is stated on Lean's standard axioms alone.
- **The hypothesis:** `RiemannHypothesis` is stated as holding on the look back, at premise grade, with its premise printed in the signature of `rh_from_pause_and_look_back`. It is never stated as proved outright. The file holds no declaration of bare type `RiemannHypothesis`.
- **The guard sentence** stands in the reading protocol, in Section 8.2 and in the canonical summary.
- **Scans:** the hedge scan and the inflation scan of the body find nothing.

## 5. Build

- **PDF:** `RH_Completed_Formal_Closure_v1_0_0.pdf`, 64 pages, 484,201 bytes, SHA-256 `ba9f389001bd20f417b8234c35d26196798b719f18b6f7d4537c050229c9c111`. XeLaTeX, two passes, no overfull box, no undefined reference.
- **Markdown master:** `RH_Completed_Formal_Closure_v1_0_0.md`, 341,473 bytes, SHA-256 `0a73e003e2c9e98afa7bb715a3ea7034da7a3187931bbf7426e00d43e3a89348`. It carries the whole file verbatim and closes on "End of manuscript."
- **LaTeX source:** `RH_Completed_Formal_Closure_v1_0_0_source.zip`, 36 files, SHA-256 `7ec804f81b42a2510f1f6b3f27bbf9048bd1c1827f375b54dca74808dd28f983`; its README gives the build.
- **Checks on the final build:**
  - chips: 0 mismatches against the pins;
  - theorem heads: 104 of 104 identifiers pinned;
  - namespace convention: 0 violations;
  - listings: 27 ranges equal to the draft's shifted by the inserted import (Listing 25 opening one line earlier, on its docstring), no listing edge on a blank line or inside a docstring, and 325 PDF listing lines matched to source;
  - Appendix D: 2,189 of 2,189 lines matched, and all running heads correct;
  - margins: at least 37 pt on every page;
  - end probe: "End of manuscript." on page 64, with Conclusion and References present;
  - scans: hedge 0, inflation 0;
  - stale figures: 0.
