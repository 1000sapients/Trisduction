# Zenodo Index — Snapshot 2 (2026-11-26)

Metadata index of Mohammad F. Islam's Zenodo records, built 2026-11-26 through the registered Zenodo connector (read-only API). This is the **second** Zenodo snapshot in this register: Snapshot 1 is the file-level archive at `Zenodo Snapshot [2026-09-01]/` (the deposited PDFs themselves, as of 2026-09-01). This snapshot is the metadata layer — every record with DOI, concept DOI, dates, version, state, and per-file size + md5 — as of 2026-11-26.

## Contents
- `zenodo_index.csv` / `zenodo_index.json` — 127 records, one row per record version, sorted by creation date (2026-03-31 → 2026-11-26).

## How the set was built (and its one quirk)
- **121 records** come from the owner account's own depositions list (`/api/deposit/depositions`, paginated in full) — the Zenodo equivalent of "my papers": 116 published (`done`) and 5 drafts (`inprogress`, including the Dark Matter corrected draft 24528559 and the Lā Rayba Fīh record 23609323).
- **6 records** are NOT returned by that list or by creator-name search, although they are the owner's papers and the head of his lineages. They were added by direct record fetch and are flagged in the `source` column: Geometry v1 19345046 (2026-03-31) and v2 20579760 (2026-06-07); Emergent Substrate Gravity 21392900 (2026-07-16); Trisduction: The Codex 22911010, 22914388, 22933119 (2026-09-23/24). Their creator is recorded as "Islam, Mohammad F" (no trailing period, no ORCID) — the earliest deposits predate the account's current name/ORCID rendering, which is the likely reason the account list omits them. Anyone reconciling counts should expect: account list 121, true public set 127.
- Cross-checks run: creator search "Islam, Mohammad F." returned 104 records, all inside the depositions set; creator search without the period returned 121, likewise a subset. No record was found outside the union above.

## Gravity flags
Same scheme as the PhilArchive index. `gravity-paper`: 21392900 (Emergent Substrate Gravity, the seed), 24495027 (Immanent Gravity v4), 24528554 (The Arrow Has Two Branches: Magnetism and Gravity). `contains-gravity`: the Geometry concept's three versions and the Codex concept's four versions (the full-length gravity coordinate rides inside them; verified in full text for 22217812), 21438933 (The Four Forces…), 20091980 (The Geometric Nature of Light — cross-checked against PhilArchive ISLTGN, substantive). All other records: `none` (title/lineage basis only; no full-text pass was run for this snapshot).

## Companion files in this register
- `PhilArchive Index/` — the twin snapshot for PhilArchive, with the gravity provenance trail.
- `GRAVITY_PROVENANCE_PRIORITY_TRAIL.md` (inside `PhilArchive Index/`) — the three-system provenance chain these indexes support.
