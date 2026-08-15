---
name: codex-hygiene
description: "Corpus-integrity and accidental-deletion-proofing for any deliverable that reads, edits, consolidates, or rebuilds a body of identified entries: a codex, a PSP or coordinate ledger, a numbered-entry document, a glossary, a book with catalogued sections, a paper with catalogued claims. Fires BEFORE and AROUND any md, docx, or pdf build and any in-place edit, especially on the words consolidate, clean up, remove duplicates, merge, trim, deduplicate, tidy, refactor the codex. Enforces the Prime Rule that no identified entry is ever hard-deleted without an explicit named override, that consolidation merges or supersedes-with-pointer and never destroys, that every removal leaves a two-line ghost, that a pre-build census is reconciled against a post-build census with any drop halting the build, and that every removal is logged to an append-only manifest. This skill is framework-agnostic and sits above any content discipline including trisduction-publication-format."
---

# RULES · CODEX HYGIENE AND ACCIDENTAL-DELETION PROOF

Rule module 1 of a growing rules skill. This module protects a corpus of identified entries against silent loss during any build or edit. It is framework-agnostic. It sits above content and publication disciplines and runs first.

## The Prime Rule

No identified entry is ever hard-deleted, unless the architect names that specific entry and asks for its deletion in the same instruction. A latitude to consolidate, clean up, remove duplicates, merge, trim, or tidy is never a latitude to delete a load-bearing entry. It is a latitude to reorganize, and reorganization preserves every identifier. The default on any removal that is not an architect-named override is supersede-with-pointer, never destroy.

This module exists because the opposite failure already happened. A scribe given remove-clear-duplicates latitude read it as license and hard-deleted two load-bearing coordinates that were not duplicates, sPSP-HSC-MASTER and the ANSELM audit, both the product of long stress-testing sessions. That is the exact event this module makes impossible.

## Scope and Activation

A corpus is any body of identified entries the deliverable touches: a codex, a PSP or coordinate ledger, a numbered-claim paper, a glossary, a book with catalogued sections, a system role with catalogued laws. An identified entry is any unit that carries a stable identifier, a code, a number, or a titled slot that other entries reference.

The module fires whenever a build or edit could drop an identified entry. It fires hardest on the consolidation words: consolidate, clean up, clean the codex, remove duplicates, deduplicate, merge, trim, tidy, refactor, prune, streamline. It also fires on any full rebuild of a corpus file to md, docx, or pdf, because a rebuild that regenerates the file from a working copy can silently drop an entry the working copy missed. It does not fire on a fresh document with no prior corpus and no identifiers to preserve.

When it fires it runs before the content discipline and around the build, wrapping any publication skill rather than yielding to it.

## Definitions

Identifier. The stable handle of an entry, for example sPSP-HSC-MASTER, MA-311, SE-301, a glossary root, a numbered theorem.

Hard delete. Removal of an entry such that its identifier no longer appears anywhere in the corpus, leaving no trace and no pointer.

Ghost, the two-line stub. The minimum trace a removed entry leaves so its label survives and its body can always be traced back. Format:

    IDENTIFIER · TITLE · [SUPERSEDED BY identifier] or [MERGED INTO identifier] or [MOVED TO location]
    ↑ recover-from: session or file or blog reference where the full body lives

The ghost is one or two lines. It carries the identifier, the title, the disposition, and a recovery pointer. It is never blank and never omitted.

Named override. An instruction that names a specific identifier and asks for its deletion, for example delete sPSP-XYZ. Only a named override authorizes a hard delete, and only of the named identifier.

## Rule 1 · No Hard Delete Without a Named Override

Any removal that is not a named override is a supersede-with-pointer. The entry's body may be folded into another entry or dropped from the working text, but its identifier and title stay in the corpus as a ghost with a recovery pointer. A consolidation pass may shrink the corpus's prose to zero net authorship change, and it still leaves every identifier reachable.

## Rule 2 · Consolidation Means Merge or Supersede-With-Pointer, Never Destroy

Duplicate handling has exactly two legal moves. Merge, where two entries covering one object are combined under one identifier and the other becomes a ghost pointing to the survivor. Supersede-with-pointer, where a refined entry replaces an older one and the older becomes a ghost pointing to the refinement. A third move, hard delete, is illegal on this path. The judgment that two entries are duplicates is itself audited: entries that share a topic but carry distinct load, distinct anchors, or distinct verdicts are not duplicates and are never merged away. When in doubt, keep both and flag the overlap for the architect rather than resolving it by removal.

## Rule 3 · The Two-Line Ghost Is Mandatory on Every Removal

Every merge, supersession, or move leaves the ghost of Definition above. The ghost is why the cheapest recovery is always possible: a labelled slot with a recovery pointer survives even when the body has moved. An entry that leaves no ghost has been hard-deleted and violates Rule 1 unless it was a named override.

## Rule 4 · The Named-Override Exception

A hard delete is permitted only when the architect names the specific identifier and asks for its deletion in the same instruction. The procedure. Confirm the exact identifier back to the architect. Confirm no surviving entry depends on it by an incoming-reference scan; if a dependent exists, report the dependency and hold. Log the deletion to the manifest with the architect's instruction quoted. Only then remove it, and only that one identifier. A named override never generalizes: naming one entry authorizes deleting that one entry and no neighbour.

## Rule 5 · Pre-Build Census and Post-Build Reconciliation

Before any consolidation or rebuild, take a census: the sorted list of every identifier in the corpus, with its count. After the operation, take the census again. Reconcile.

    entries_out  =  entries_in  −  (named-override deletions)

Every identifier present before is present after, either as a live entry or as a ghost, unless it was a named-override deletion logged to the manifest. Any identifier that is present before and absent after with no ghost and no logged override is a FAULT. On a fault the build halts, the dropped identifiers are reported, and nothing is emitted until each is restored as a live entry or a ghost or logged as an override. The reconciliation is mechanical and is never skipped for a large corpus; a large corpus is exactly where a silent drop hides.

## Rule 6 · The Deletion Manifest

Every removal, ghosted or hard, appends one line to a manifest kept beside the corpus, for example CODEX_DELETIONS.log. The line carries the date, the identifier, the disposition, merged or superseded or moved or hard-deleted-by-named-override, the survivor or recovery pointer, and for a named override the architect's instruction quoted. The manifest is append-only and is never rewritten. It is the audit trail that makes any past removal reviewable and any accidental loss traceable to the pass that caused it.

## Rule 7 · Zero Net Authorship Change

Consolidation reorganizes an existing corpus. It authors nothing and it destroys nothing. The net change to the set of identifiers is zero minus any named-override deletions. New content enters by its own path, not by a consolidation pass. This is the Mosaic-Seal discipline read at the file level, ΔM = 0, occupation of the field without a claim to have created or removed what the field already held.

## Integration

This module wraps any publication or content discipline. When a corpus file is being rebuilt to md, docx, or pdf, run the pre-build census before the render and the post-build reconciliation after it, and only then present the artifact. When a consolidation is requested in prose, run the census, execute only merges and supersessions with ghosts, log each to the manifest, reconcile, and report the ghost list and the manifest lines to the architect. The content discipline governs how the surviving entries are formatted and rendered. This module governs that no entry silently disappears in the process.

## Worked Example · The Incident This Prevents

Instruction as given: consolidate the codex and remove clear duplicates. Illegal execution, the one that happened: the scribe hard-deleted sPSP-HSC-MASTER and the ANSELM audit, non-duplicate load-bearing coordinates, leaving sPSP-HSC-MASTER as a bare label with no body and ANSELM with no trace at all. Legal execution under this module: take the census, identify genuine duplicates only by the shared-load-and-anchor test, merge or supersede each with a two-line ghost and a recovery pointer, hard-delete nothing because nothing was named, log every removal to the manifest, reconcile the post-build census against the pre-build census, and confirm every original identifier is still reachable. HSC-MASTER and ANSELM survive because neither was named for deletion, and even a true duplicate would survive as a labelled ghost pointing to its survivor.
