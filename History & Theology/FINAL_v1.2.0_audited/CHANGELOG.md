# CHANGELOG · v1.2.1

Corrections applied to Volumes II, III, and IV. Every edit is listed with its count and its mechanism. Nothing was repaired silently. Source resolved from `1000sapients/Trisduction` at commit `5c0abfc`.

## 1 · One factual error

**Volume III, Chapter 76.** *Dawud AS Reubeni* → *David Reubeni*, 1 site. The figure is the sixteenth-century claimant, not the prophet Dawud AS. A name-normalisation pass had marked him as a prophet, which the volume's own front matter explicitly forbids: familiar English forms denoting a different person keep that person's name. Reubeni and the Himyarite king Yusuf As'ar Yath'ar are now both on that exception list. The error was present in the master and in the rendered PDF.

## 2 · One reported figure corrected

**Volume IV, corpus weight.** The stated ratio 48 / 8 / 42 was taken with an instrument recognising only citations that carry a book name. Books VIII and IX establish Mark once and then cite it bare, so the Gospel share was undercounted by roughly half and the Qur'ānic share inflated to match. Recounted under a stated instrument family: 48–57% Hebrew Bible, 7–13% Gospel, 31–43% Qur'ān, the spread being instrument sensitivity and printed as such. Volume III's ratio is stable across all three instruments and was correct as stated. Volume II is 100% Hebrew Bible under every instrument.

The correction is printed in the volume's own disclosure rather than made quietly, because the failure is the one this set already records against itself elsewhere: an instrument with no pattern for a category scores that category as absent, and the absence looks on the page exactly like a finding.

## 3 · Naming and honorific discipline

Each volume stated a naming rule its body did not keep. All three now state what they do and do what they state.

**Volume II** promised prophetic honorifics in its Reading Conventions and in Appendix L, then applied none across 166 chapters. Both clauses rewritten to state the actual and now-reasoned practice: the corpus is read in its own names and the honorific convention is deliberately suspended, as a consequence of the single-corpus constraint rather than an exception to it. Volume II now carries zero honorific marks and zero divine-name glyphs, which is what its own scope law requires.

**Volume III** promised one form of each name and ran two forms for four figures. Normalised to the declared list: Moses AS → Musa AS (3), Abraham AS → Ibrahim AS (4), Solomon AS → Sulayman AS (16), Joseph AS → Yusuf AS (5), the Joseph cycle → the Yusuf AS cycle (1), Noah's ark → the ark of Nuh AS (1), Aaron AS → Harun AS (1), Jacob AS → Yaʿqub AS (1), Elisha → Elisha AS (1). Two quotations carried an unmarked name against the volume's own rule that the honorific travels through quotation, at Mark 1:1 and at Josephus *Antiquities* 20.200; both now read ʿĪsā AS. The name-form clause was extended to cover Enoch AS, whose identification with Idris AS is traditional and not textual and is now typed as such, Elisha AS at Q 6:86 and 38:48, the figures the Qur'ān does not name as prophets and which therefore stand unmarked, and the adjectival forms, which are not names and are never marked.

**Volume IV** carried four naming systems at once and no stated rule. Diacritic doublets collapsed onto the declared plain forms, 16 sites across twelve names. English forms brought onto the list: Moses AS → Musa AS (10), Solomon AS → Sulayman AS (8), Joseph AS → Yusuf AS (2), Ishmael AS → Ismāʿīl AS (1). Prophets left entirely unmarked, now marked: David → Dawud AS (12 person sites, 3 of them possessive and rephrased), Elijah → Ilyas AS (22), Aaron → Harun AS (2), Jesus → ʿĪsā AS (3), Mary and bare Maryam → Maryam AS (2). Joshua unmarked at 7 sites to match Volume III and to keep the man from being marked wherever the book bearing his name is cited. Volume IV now carries the same naming clause as Volume III, together with Volume III's statement that the honorific is a reverence convention and not an argument, which Volume IV had lacked.

**Mechanism note.** The substring-replacement failure that produced the Reubeni error in the first place recurred during this pass and was caught by the same check: *Davidic* → *Dawud ASic* (10 sites) and *Aaronide* → *Harun ASide* (6 sites), both repaired and both now fenced by the adjectival clause in the front matter. Persons correctly left unmarked and verified as such: Mary Magdalene, Mary of Bethany, Moses of Crete, David Alroy, Abraham Abulafia, Solomon ibn Adret, Solomon Molcho, Isaac Luria, Rabbi Ishmael, Simon bar Jonah, Muhammad al-Mahdi, Yusuf As'ar Yath'ar, and the Jacob of the Matthean genealogy.

## 4 · Title collision resolved

Volume III's master opened with `# THE CONCEDED THRONE` while its rendered PDF titled it *History of the Messianic Position*, so master and render disagreed on which string was the title and the master's H1 collided head-on with Volume II. The master now leads with the messianic-position title, matching the PDF and the PDF metadata, and identifies itself as Volume III and a companion to *The Conceded Throne* rather than borrowing its name.

## 5 · The four volumes linked in the artifacts

A companion block was added to the front matter of all three, above the contents, stating the set, the reason there are four rather than one, the corpus admitted by each, the measured weights, Volume I's deposited DOIs, and the shared finding. In Volume II the block carries a fence: nothing in it is load-bearing, no chapter cites it, and the single-corpus constraint is unaffected. The block's one divine-name reference was rephrased so that inserting it into Volume II would not contradict the honorific suspension declared three pages earlier, and its cross-volume chapter pointer was made explicit so it does not read as a dangling internal reference.

## 6 · Disclosure

Volume II already carried a full author disclosure covering affiliation, funding, working method, audit history, and standing. Volumes III and IV carried none, which across a linked set reads as selective disclosure. Both now carry one on the same pattern, each with its own audit history and each carrying the corrections above on its own face.

**On Module VIII.** The publication discipline fires an Author's Provenance and Method Disclosure on public-facing paper deliverables, at LINE weight for the Journal edition, injecting the Trisduction master reference into the References section. That module was not fired here, deliberately. Its generic half asserts a specific verification architecture, its root axioms, and its named procedures, and its paper-specific half asks where the lock held with numbers. None of these three volumes was built through that pipeline; they were built philologically, with an AI as concordance and adversarial-audit instrument, which is what the disclosures now say. Injecting a method disclosure for a method not used would be a fabricated provenance and is the more serious defect of the two. The honest fix was to propagate Volume II's own disclosure. If the master reference is nonetheless wanted in these three, it is one line each and is the author's call, not the scribe's.

## 7 · Verified clean, unchanged

Structure holds in all three after the edits: contents match body one to one, 166 / 97 / 104 chapters, no missing or duplicate numbers, no dangling chapter, appendix, or excursus references, no glued-token damage. All Qur'ānic citations fall inside valid sura and verse ranges. Falsification loops close in all three. Textual overlap between the three volumes, measured by exhaustive ten-gram word shingles over the smaller file of each pair, is 0.34 to 0.60 percent on the argument bodies with the shared companion block and disclosures excluded, and 1.36 to 1.75 percent with that shared apparatus included; the shared body material is quoted scripture translation together with one bibliographical paragraph on instrument dependency carried in Volumes II and IV alike. An earlier figure of under 0.2 percent was an artefact of a sampled instrument that read every third window and was therefore phase-dependent, and it is withdrawn. Either exhaustive figure is two orders of magnitude below what three renderings of one draft would show, so the three are independent compositions, three separate deposits are correct, and no supersession is owed.

## 8 · Not done, and why

The rendered PDFs in the parent folder were built from the pre-correction masters and are now stale in body, front matter, and end matter. They must be re-rendered from this folder before any deposit.

Volume I was not modified. Its PDF is immutable at version DOI `10.5281/zenodo.22243674`, and adding the companion block to its git master would put git and Zenodo out of step for no gain. The set linkage for Volume I belongs in that record's `related_identifiers` metadata, which is editable without a new version.

The session bundle `The Conceded Throne · complete session bundle.zip` is a working artifact. It belongs in git and on neither deposit surface.


## v1.2.1 · post-seal front matter, render structure

After cycle `fourvol` closed at SEALED-ROUND, one section, *Who should read which volume*, was added to the companion block of Volumes II, III, and IV and to a fenced head block on Volume I, at the author's instruction: four readers, one volume each, what each volume admits as evidence and what it does in the set. It is front matter, fenced, load-bearing on nothing, and was checked by the standing instruments only, chapter counts 166 / 97 / 104 and the naming and single-corpus scans unchanged, not by a further audit round; that is stated here rather than implied. Volume I's body from the Preface onward is byte-identical to the master received; the README carries both hashes. The renders gained a Contents section on its own page, book heads on new full-width pages, literal chapter numbering in the Contents where the engine had restarted at 1 under each book, full-width tables for every table of three or more columns and for every apparatus table of Volume I, Volume I's summaries as tinted panels, and Appendix F as full-width tables that break across pages with headers repeated. A spanning table inside the two-column flow crashed the layout engine on the long event log; spanning tables now leave the column container onto a full-width block. Render kit in `audit_fourvol/render/`.
