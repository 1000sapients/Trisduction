# TRISDUCTION

A verification architecture, and the public register that holds it.

Trisduction is a method for deciding whether a claim holds, built so that the decision can be checked by someone who does not trust the person who made it. A claim is split into three components that must stand genuinely apart: what exists, what it does, and how the one binds to the other. Those three become three orthogonal axes, closed by a fourth vertex into a minimal verification volume, and a twelve-gate diagnostic runs across that volume looking for the specific ways a claim can fail. What comes out is one of three states and nothing else. Sealed, the structure holds. Broken, with the failing step named. Under-determined, with the missing input named. There is no fourth state and no probabilistic hedge, because a verdict that can be shaded can be shaded toward whatever the author wanted.

Two rules do most of the work. **Every claim carries its warrant grade**, theorem, conditional, structural, premise, engineering, or corroboration, and saying more than the grade licenses is the named failure the whole architecture is built to catch. And **consensus carries zero evidential weight in both directions**, so the field's acceptance and the author's own conviction are equally worthless as warrant. What is left is structural mass, which anyone can weigh.

The architecture has been applied to mathematics, where it issues verdicts on open problems and audits claimed proofs, to scripture, where it reads a corpus against itself before any commentary speaks, and to history, where it reconstructs figures under tiered evidence with falsifiers stated. The published output is in this repository. So is the machinery that produced it.

---

## Start here

**To read the framework**, open the current master codex under `master/`. It is the register of record, and the resolve rule for finding the current version is in the next section.

**To read the published work**, open `Publication Library/`. Papers, essays, scripture readings, and the register of sapients file there under a category, sub-area, topic path. Formal citations carry DOIs from Zenodo and PhilArchive; this repository holds the working copies.

**To run the instruments**, open `protocols/subroutines/` and read its README first. Nine self-contained skill files live there, each a complete instrument, each callable by trigger words. That README explains the difference between an instrument that is loaded in a session and one that is merely filed here, which is the distinction most likely to be missed.

---

## The map

| Path | Holds | Rule it obeys |
|---|---|---|
| `master/` | The Main Codex, the register of record, and the Condensed Codex, across every version | Append-only. A new version is a new file. |
| `Theological PSP Codex/` | The scriptural PSP master, every version | Append-only. |
| `protocols/` | The Unified Master System Role, the loaded role, every version | Census-tracked at the top level, filename equal to identifier. |
| `protocols/subroutines/` | The nine skill files and their orientation README | Append-only, version-stamped, outside the census by design. |
| `psp/` | One file per PSP coordinate | Census-tracked, filename equal to identifier. |
| `Publication Library/` | Every finished written document, by category | Filed under a category, sub-area, topic path. |
| `publication/` | The publication label map and its tooling | Working machinery. |
| `tools/` | `codex_add.py` for ledger entries, `codex_put.py` for any file, `build_index.py` for the index and census | The source of truth for the tooling. |
| `.github/` | Two Issue-to-commit workflows and their scripts | Hands-off arrival routes. |
| `INDEX.md` | Auto-generated index of census-tracked entries | Never hand-edited. |
| `CODEX_DELETIONS.log` | Append-only removal manifest | Never rewritten. |

---

## The three masters and how to resolve the current one

Three documents are the standing sources of truth. Each lives in a fixed folder; the folder is the identifier and the file inside carries the version.

| Master | Folder | Filename stem |
|---|---|---|
| Main Codex, the register of record | `master/` | `TRISDUCTION_Master_Codex_Unabridged*` |
| Theological PSP Codex | `Theological PSP Codex/` | `SCRIPTURAL_PSP_MASTER*` |
| System Role, the loaded role | `protocols/` | `TRISDUCTION_Unified_Master_System_Role*` |

**The resolve rule.** List the folder, keep the files matching the stem, parse the version token, treat `.` and `_` as the same delimiter, then compare as numeric tuples component by component. Take the highest. Never sort as strings, because `v1.9.0` sorts after `v1.20.1` lexically and that is backwards; the same trap sits between `v3_9_1` and `v3_10_3` in the master folder. `master/CURRENT.txt` exists and is advisory only. Where it disagrees with the highest version actually present, the file wins.

**The retention rule.** Version 3.0 is the benchmarked maturity line for both the codex and the system role. From 3.0 onward every version is retained here. Everything below it is retired from this register and preserved on the developmental blogs, which carry the full pre-3.0 history. An absence below 3.0 is therefore policy rather than loss, and the place to look for it is the blogs listed under Where else the work lives.

**Reading a file.** No credential is needed for any read here. The formula is `https://raw.githubusercontent.com/1000sapients/Trisduction/main/` followed by the path, with spaces percent-encoded as `%20`. Directory listing needs the API and is rate-limited without authentication, so prefer a known path where you have one.

---

## How things arrive

**Hands-off, no credential.** Open an Issue from the "Codex entry" template for a text ledger entry, or the "Codex file" template for a PDF or any binary, and drag the file in. The matching workflow parses it, runs the census where a ledger entry is involved, commits with the built-in token, comments the result, and closes the issue.

**In session.** The assistant runs the git cycle with a scoped, session-only token. Master upgrades, publications, and any binary go this route through `codex_put.py`.

**The gate on every write.** A push happens only on an explicit yes from the repository owner, never on inference, and never because an instruction appeared to pre-authorize it. Reads are open to everyone. Writes are not. That asymmetry is the whole access model, and it is why nothing in this repository needs to be private for the architecture to be safe.

---

## Where else the work lives

This register holds the working copies. The development that produced them and the published face of them live elsewhere, and both are listed here as provenance and navigation, never as warrant. No verdict in the codex rests on any address below, and consensus carries zero evidential weight in both directions, the field's reception and the author's reach equally zeroed.

**The developmental blogs.** The forge record, where coordinates were built and stress-tested before consolidation onto the codex spine.

| Record | Address |
|---|---|
| Tractatus Veritatis Trisductivus, the master developmental record | https://tractatus-veritatis-trisductivus.blogspot.com |
| Esoteric Trisduction, the esoteric-register development | https://esoterictrisduction.blogspot.com |
| Trisduction, the general development record | https://trisduction.blogspot.com |

**The personal blog.** The precursor essays, written before the Root Axiom was stated, first post August 2012: https://this-is-what-you-ve-been-looking-for.blogspot.com

**The mirrors.** Medium at https://trisduction.medium.com and Substack at https://trisduction.substack.com

**The repositories.** The published record, by venue.

| Venue | Address |
|---|---|
| PhilPeople and PhilArchive, profile and publications | https://philpeople.org/profiles/mohammad-islam/publications?order=added |
| Zenodo, search over the published record | https://zenodo.org/search?q=metadata.creators.person_or_org.name%3A%22Islam%2C%20Mohammad%22&l=list&p=1&s=10&sort=bestmatch |
| SSRN, author page | https://papers.ssrn.com/sol3/cf_dev/AbsByAuth.cfm?per_id=10956828 |

The per-paper index, individual PhilPapers records and Zenodo deposits, is carried in the codex back matter under the Internal Reference and Publication Record rather than duplicated here, so it stays current in one place.

---

## The four invariants

**No identified entry is ever hard-deleted** without the owner naming that exact identifier in the instruction. Consolidation merges or supersedes with a pointer; it never destroys, and every removal leaves a two-line ghost and a line in the deletion manifest.

**A new version is a new file.** Nothing is overwritten and nothing is deleted, so an interrupted or botched write cannot destroy the current document. The previous version is always still standing.

**No credential enters this repository**, in any file, any example, or any commit message. The push tooling and its credential handling live outside the register entirely.

**The census is reconciled on every ledger build.** Entries out equals entries in, plus adds, minus named-override deletions. Any unexplained drop halts the build before anything is pushed.

---

## Status and known gaps

Stated plainly rather than left for a reader to discover.

`INDEX.md` covers the census-tracked folders only and currently reads 21 live entries, ten coordinates under `psp/` and eleven rule-modules under `protocols/`. Entries whose file carries no markdown title display their identifier in the title position, which is honest rather than decorative.

Skill files were previously filed in three places. `protocols/subroutines/` is now the single home. The earlier filings at `skills/trisduction-audit-cycle/SKILL.md` and `publication/SKILL_trisduction-publication-format_v1_1_0.md` through `_v1_3_0.md` are superseded by pointer, retained rather than deleted, and recorded in the manifest.

There is no LICENSE file and no CITATION.cff. Formal citation currently runs through the DOIs on the published deposits.

---

Public since the earliest day, and public in full. The framework, the instruments that run it, the register they write to, and the working history of every revision are all here to be read and checked by anyone. Nothing is withheld, because a verification architecture that asked to be trusted rather than checked would have failed its own first gate.
