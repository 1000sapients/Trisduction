# PUBLICATION TOOLING

Fourth folder anchor of the repository, beside `master/`, `Theological PSP Codex/`, and `protocols/`. Holds the publication discipline and the label conversion pointer. Everything here is append-only: a new version is a new file, nothing is overwritten, nothing is deleted.

## Contents

| file | role | authority |
|---|---|---|
| `SKILL_trisduction-publication-format_v*.md` | the publication discipline, ten modules and five gates | source of truth for every written deliverable |
| `PUBLIC_LABEL_MAP.json` | the conversion pointer, native identifier to short public label | sole authority at render time; the build reads this file |
| `PUBLIC_LABEL_MAP.md` | human-readable face of the same data | reference only, never edited by hand |
| `label_map.py` | the reduction, harvest, and emit engine | the only writer of the two map files |
| `MANIFEST.txt` | sha256 of every file in this folder | integrity check on fetch |

## Resolve-current

The folder is the fixed identifier; the file inside is version-stamped. To resolve the current skill, list this folder, keep files matching `SKILL_trisduction-publication-format_v*`, parse the version token, normalize `.` and `_` to compare alike, compare as numeric tuples component by component and never as strings, and take the highest. Pull fresh from git before reading, quoting, auditing, or extending. Git overrides any local or in-session copy.

## The conversion pointer

`PUBLIC_LABEL_MAP.json` is keyed by short label and carries, for each, the codex index, the native identifier, status live or superseded, the successor label where one exists, and the title. A build substituting labels reads this file. It never re-derives a label from the reduction rules, never infers one, and never mints one absent from the file; an unlabeled coordinate fails Gate 5 rather than receiving an invention.

Append-only and incumbent-pinned. Once a label ships inside a published PDF it is a citation in the wild and can never move. New coordinates append. Within any collision group the lowest codex index keeps the label it would carry alone and only later members re-label, because a rule that re-labels every member would rename a label already printed in an earlier preprint.

## Regenerating

    python3 label_map.py <path to master codex .md> [outdir]

The engine self-tests before it will emit, asserting determinism, two runs agreeing bit for bit, and append-safety, seating synthetic coordinates engineered to collide with real stems and verifying that zero existing labels move. A failure raises and writes nothing. Wholesale regeneration over a grown census is barred once the map is frozen; growth appends.

## Coverage

Covers every row of the master codex coordinate index and every row of the legacy supersession block. Off-index coordinates are not harvestable mechanically and are minted on demand by running the engine on the single coordinate against the existing registry. The gap is visible at build time rather than silent on a published page.
