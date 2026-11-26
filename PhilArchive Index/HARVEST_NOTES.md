# HARVEST NOTES — PhilArchive index of Mohammad F. Islam's papers

## Owner's rule and final count (as given by the owner, 2026-11-26)

**Rule: "Use only my papers as listed under my papers tab."** The source of record for this
index is the owner's own papers list from his signed-in PhilArchive session, saved as
`OWNER_VIEW_DATES.md` in this folder (Tables A, B and C). **The owner's stated final count
is 84 own entries — 70 by "Mohammad Islam" + 14 by "Mohammad F. Islam"** — of which 32 were
added before 2026-07-13 (the Trisduction Git repo creation date) and 52 on/after it.
Broader author/name searches (103 signed-in mixed-name results; 113 in an earlier brief;
131 in the public surname listing harvested for this task) mix in other people and were
NOT used as the index's source of record.

**Count discrepancy inside the source file — named exactly, not silently resolved:**
the tables as written enumerate **90 unique titles**, not 84: Table A = 25 entries,
Table B = 9, Table C = 58 items under a header that says "(52...)" (47 dated items plus
"ISLIGA + the eleven theorem papers" on 2026-11-25 = 12), minus 2 overlaps (ISLESG and
ISLIGA appear in both Table A and Table C) = 90. The pre-2026-07-13 subtotal does reconcile
exactly (Table A's 23 pre-7/13 entries + Table B's 9 = the owner's stated 32), so the
6-title difference sits inside Table C's post-2026-07-13 list. Rather than drop six of the
owner's own listed papers on a guess, the index contains every entry the tables enumerate
(90 rows: 79 with PhilArchive IDs + 11 Table-C titles whose IDs the owner file does not
give). The owner can strike the 6 surplus titles from Table C and the index will be cut to
match in one pass.

## What the index contains

- `philarchive_index.csv` / `philarchive_index.json` — one row per table-enumerated entry:
  id, title, author_as_listed, type, year_shown, date_evidence, rec_url, pdf_url,
  abstract_snippet, gravity_relevance.
- 79 rows carry IDs verified against the public PhilArchive/PhilPapers records on
  2026-11-26 (each record page was opened; title and author checked against the listing).
- 11 rows are Table-C titles with **blank IDs** (per the owner's rule: where the owner file
  gives no ID, the ID is left blank rather than filled from a same-name search):
  A Unified Substrate-Physics Audit of the Six Millennium Prizes (2026-07-22) ·
  The Millennial Geometry (2026-07-25) · A Proof of the Riemann Hypothesis: What It Would
  Have to Be (2026-07-28) · The First Post-Riemann Horizon (2026-08-02) ·
  All Proofs Are Local (Gödel) (2026-08-04) · The Quantum Vacuum as a Verification
  Substrate (2026-08-08) · The Substrate as a Formal System (2026-08-08) ·
  Gravity, Time, and Identity (2026-08-10) · Quantum Gravity Is Not a Search: It Is a
  Forced Geometric Read (2026-08-16) · Substrate, Geometry, and the Geometry of Thought
  (2026-08-29) · On the Nature of the Continuum (2026-08-31).
  None of these 11 appears in the public PhilArchive author listing; they are presumably
  PhilPapers-side records (e.g. pointing at Zenodo) without a public PhilArchive manuscript
  page, or listed under a title variant. Their IDs remain an open gap.

## Dropped under the owner's rule (were in the public-listing working set, in no table)

11 harvested entries by "Mohammad Islam" in the public listing appear in none of
Tables A/B/C and were **dropped**: ISLTVA (The Veil and the Wall), ISLAFP-4 (A Formal
Proof of Riemann Hypothesis Termination), ISLTFF (The Four Forces, Matter, and the Dark
Sector — **gravity-bearing**, V1 uploaded 2026-07-19), ISLWTR (Why the Riemann Critical
Line and the Black-Hole Event Horizon Share a Structure-Type — **gravity-bearing**, V1
uploaded 2026-07-29), ISLTCC (The Custody Cycle of the Most High), ISLTDF (The Divine
Feminine), ISLTCG (Quranic Christology), ISLURF (Unlettered Regenerative Floor),
ISLTNO (Two Negations, One Affirmation), ISLSPA (A Shoot from a Felled Stump),
ISLIBA (Incompleteness Before Arithmetic). If any of these is the owner's under a title
the papers tab renders differently, it can be restored with its verified ID in one pass.

## Excluded as other people (never indexed)

The public surname listing (131 found, harvested in full over 3 pages: 1–50, 51–100,
101–131) also carries works by Mohammad Ashiqul Islam (incl. ISLACF, ISLTLN, ISLASF,
ISLIIP, ISLTFO, ISLTSL, ISLAPJ, ISLATM, ISLQCC, ISLQCQ, ISLTAO), Mohammad Saiful Islam
(ISLRBD, co-author), and unrelated authors who share the surname or co-author slots:
Farhan Islam (KHAIPO), Rafiqul / Md Rafiqul / M. Rafiqul Islam, Jaan Islam, Tanjimul Islam,
Asmat Ara Islam, Sheikh Touhidul Islam, Tausif Islam, Muhammad Abdurrahman Izzul Islam,
Rafiq Islam, Syed Shariful Islam, Md Nazrul Islam, Md Monirul Islam and their co-authors
(41 entries). Per the owner's rule and the merge instruction, none is in the index.

## Date evidence — sources, in priority order

1. **Owner view (primary)** — `OWNER_VIEW_DATES.md`: "First archival date", "Archival
   date", "Added to PP" list dates, and exact version-upload timestamps from
   philarchive.org/versions/<ID> for Table A entries.
2. **Public /versions pages** fetched during this harvest for entries the owner file does
   not date: ISLTFF (V1 2026-07-19 07:59:56 GMT — since dropped), ISLWTR (V1 2026-07-29 —
   since dropped), ISLATP (V1 2026-11-25 12:11:52 GMT), ISLTAH (V1 2026-11-25 10:28:18),
   ISLTCO (V1 2026-11-25 09:46:56), ISLTDO (V1 2026-11-25 09:07:33); ISLTOT, ISLTGN,
   ISLTAT-2, ISLDIA, ISLESG, ISLIGA versions pages confirm the owner-view dates.
3. **Record-page archival history** on full PhilPapers-style renders: ISLLAA, ISLMAA,
   ISLQCA, ISLTFC-2, ISLTNF, ISLTRA (all 2026-11-25).
4. **Search-index "Last Updated" stamps (weak evidence, labelled as such in the CSV where
   used)** — used only as corroboration: ISLESG ≈2026-07-16, ISLTFF ≈2026-07-19,
   ISLTGN ≈2026-05-09 all agree with the hard version-upload dates.
5. Two title matches from Table B are tentative and flagged in their rows: ISLTRH
   (owner renders the subtitle "Geometric Proof of Nontrivial Zeros") and ISLRHG
   (owner renders the subtitle "The Geometric Argument That Leaves No Escape").
   ISLOTT (without suffix), named in the original task brief as a seed ID, does not exist
   in the listing; the TOE paper is ISLOTT-2.

## Method and limits

- Read-only public fetches only (browser.open / browser.search); no sign-in, no
  Cloudflare interaction. The signed-in data came from the owner himself
  (OWNER_VIEW_DATES.md).
- Every indexed ID was verified by opening its record page and matching the title.
- Entries that could not be opened: none of the 79 ID'd entries failed. The 11 blank-ID
  Table-C titles could not be opened because no public record/ID for them was found.
- Abstract snippets are the first ~300 characters of the record/listing abstract.
  Gravity judgements are from abstracts (plus the ISLTFF full text, before it was
  dropped) — see GRAVITY_HITS.md for sources per entry.
- Earliest own entry overall: ISLGDO, first archived 2026-04-03. No own entry predates
  April 2026 (owner-view statement, consistent with everything found publicly).
