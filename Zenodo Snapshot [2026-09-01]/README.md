# Zenodo Snapshot [2026-09-01]

A complete point-in-time mirror of the Trisduction Research Group Zenodo account,
captured 2026-09-01. **47 concept records, 73 deposited versions, 110.5 MB.**
Every version is present, including superseded ones, so this folder answers "does it exist"
without a network call.

## What this folder is not

It is not a backup. Zenodo is CERN-operated, carries a stated retention commitment, and
resolves by DOI. A GitHub repository can be removed by account action, terms enforcement,
or one bad force-push. Of the two surfaces Zenodo is the more durable, not the less. This
folder is an index and an offline working set. Reading it as a backup would license one day
treating the deposits as expendable, which inverts the actual durability order.

## Source direction, the local exception

Repository law is that git is canonical and every other surface reconciles to it. **Inside
this folder that inverts.** These PDFs are copies of Zenodo deposits; the deposit is the
source and the file here is derived. Never edit a file in this folder. A correction goes to
Zenodo as a new version on the existing concept, and the snapshot is re-captured. Editing a
copy here would create a document that exists at a DOI address but does not match what that
DOI serves.

## Layout

Seven domain folders, then one folder per Zenodo concept record, then one file per version.

    <domain>/<conceptrecid> - <slug>/v<n> <date> rec<record id> - <slug>.pdf

The concept record id is the stable identity: `10.5281/zenodo.<conceptrecid>` always resolves
to the latest version. The per-file record id pins one deposit at `10.5281/zenodo.<record id>`.
Titles here run past 200 characters and Windows still enforces a 260-character path ceiling,
so paths carry a truncated slug and the full title lives in `manifest.json` and `MANIFEST.md`.

## Verifying this mirror

`manifest.json` carries a sha256 for every file. To confirm a copy still matches its deposit,
fetch the file from its version DOI and compare digests. Nothing here needs to be trusted on
its own word.

## Files

| file | role |
|---|---|
| `README.md` | this file |
| `MANIFEST.md` | human-readable table, every version with both DOIs and its sha256 |
| `manifest.json` | machine-readable, same data, keyed by path |

See `/PUBLICATION_INDEX.md` at the repository root for the live corpus index across all
surfaces. This folder is a dated capture; that file is the current state.
