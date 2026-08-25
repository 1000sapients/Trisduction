# STATE · Geometric Encyclopaedia of the Qurʾān

**Read this first.** It is the handoff artifact and carries what lives nowhere else: which
file is current, what each entry's gates say, which frames are thin, which channel the next
entry owes, and what stands unpaid. The corpus file holds the entries, `COMMISSIONED.md`
holds what is owed as heads, `GHOSTS.md` holds what is retained and never resolved to.
**None of those three tells a fresh session what to do next. This one does.**

Updated 2026-08-25 at census 6.

---

## Current file

`Geometric_Encyclopedia_of_the_Quran_v1_0_0_6.md`

Resolve by highest numeric tuple within the folder stem, never by string sort, never from a
pointer. Earlier versions are retained and are not resolved to.

**Census 6.** Three major, three standard, zero redirect stubs.

---

## The entries and their gates

| # | Head | Tier | Spine | spine-audit | entry-audit | Seed | Bucket | Channel |
|---|---|---|---|---|---|---|---|---|
| 1 | Abrogation | major | SC-089 | predates gate | predates gate | Q 2:106 | legal-textual | unrecorded |
| 2 | ʿArsh | standard | SC-095 | **OPEN-AT-CAP** | **PENDING** | Q 11:7 | cosmology | demand |
| 3 | ʿArsh ʿAẓīm of Sabaʾ | standard | SC-096 | PASS-bilqis-r6 | PASS-azim-r5 | Q 27:23 | cosmology | demand |
| 4 | Maʿiyya | major | SC-093 | **NONE** | predates gate | Q 58:7 | divine-attributes | unrecorded |
| 5 | Mathānī | standard | SC-094 | PASS-foldmaster-r5 | PASS-mathani-r5 | Q 15:87 | textual-structure | quota |
| 6 | Taḥrīf | major | SC-088 | predates gate | predates gate | Q 4:46 | textual-integrity | unrecorded |

**Two entries carry both gates green** and both were admitted on 2026-08-25. **Four do not**,
and the reasons differ: two predate the gate entirely, one has a spine that never ran a cycle,
and one has a spine whose cycle closed at divergence and was returned for reconstruction.
**That is visible debt and is not absorbed.** An entry in the corpus with a gate short of PASS
is admitted and unhardened, which the auditor reports and which nobody should read past.

---

## Frame state

**Reference frame.** Six reference heads disposed. `Bilqīs` stands **undisposed and owed at
major tier**, having been deliberately left when the throne entry took the object rather than
the person.

**Corpus frame, and it is the thinnest.** Sūras seeded: **2, 4, 11, 15, 27, 58. Six of one
hundred and fourteen.** Every quota decision should read this row first.

**Thematic frame.** legal-textual 1 · cosmology **2** · divine-attributes 1 ·
textual-integrity 1 · textual-structure 1. **persons-and-narrative remains empty**, and is the
bucket `Bilqīs` would open.

---

## Channel ledger

Demand 2, quota 1. **A demand entry leaves a commissioning debt payable by the next quota
entry**, so two debts were incurred and one is discharged.

**The next entry owes quota**, chosen against the thinnest frame, which is the corpus frame at
six of a hundred and fourteen.

---

## Standing debts

**Audit.** ʿArsh's spine is open at cap and its own entry-check has never run; its spine
coordinate closed HALT-DIVERGENT and is due reconstruction, so the entry inherits that and
does not escape it. Maʿiyya's spine carries no cycle at all.

**Verification, and it is the largest.** **No Qurʾān text has been on disk in any session that
produced these entries.** Every locus and every wording in the corpus rests on recall. The
load-bearing cases each entry names on its own face are the ones to check first, and the two
that carry the most are `Q 39:23`'s attribution of *mathāniya* to the whole *kitāb*, on which
Mathānī's entire contribution rests, and `Q 27:26`'s definite epithet, on which the throne
entry's proximity paragraph rests.

**Seal ratio 6 of 6.** Flagged three times. A ratio near one means seals are being forced, and
this one has never broken. **It should not reach ten unbroken.** The next entry that will not
seal cleanly should be written and admitted unsealed rather than avoided.

**Cadence.** Light self-audit at every ten entries, full at every fifty; `tools/audit_corpus.py`
in the skill. **Next light audit at census 10, four entries away.**

---

## What a fresh session should do first

Resolve the current file from git rather than trusting any copy in context. Read this file,
then `COMMISSIONED.md` for what is owed. **Do not pick a head from the conversation.** Run the
screening law against the three frames, take the thinnest, and check the channel ledger above
before drafting, since the channel decides whether the head may be chosen freely or is owed
against a frame.

And before admitting anything, read the gate columns above. **Two entries in this corpus are
hardened and four are not**, and a session that admits a seventh without knowing which is which
will accrete on an unaudited base.
