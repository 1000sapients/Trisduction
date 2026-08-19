# GHOSTS · Geometric Encyclopaedia of the Qurʾān

Files retained in place and never resolved to. Nothing here is deleted; the
Prime Rule forbids it and the record is more useful than the space.

## Version scheme, for the avoidance of the fault below

An odometer. The three digits after the major version are the **entry census**
and nothing else may move them.

```
1.0.0.1  one entry          1.0.0.9  nine
1.0.1.0  ten                1.0.9.9  ninety-nine
1.1.0.0  one hundred        1.9.9.9  nine hundred and ninety-nine
2.0.0.0  one thousand
```

A fifth component, where present, is the **revision at that census**, for a
correction that adds no entry: `1.0.0.2.1` is the two-entry corpus, first
revision. It never disturbs the odometer.

**Resolution:** highest numeric tuple within the stem, **excluding every file
listed below**.

## Ghosted

| File | Claims | Holds | Disposition |
|---|---|---|---|
| `Geometric_Encyclopedia_of_the_Quran_v1_0_1_2.md` | 12 entries | 2 | MIS-NUMBERED, superseded by `v1_0_0_2_1` |
| `Geometric_Encyclopedia_of_the_Quran_v1_2_0_2.md` | 202 entries | 2 | MIS-NUMBERED, superseded by `v1_0_0_2_1` |

**Correction, 2026-08-19.** An earlier revision of this file listed a third
ghost, `Geometric_Encyclopedia_of_the_Quran_v1_1_0_2.md`. **That file never
existed.** A live folder listing was rate-limited during the damage analysis and
the scribe fell back to a hardcoded list into which that filename had been
invented, then built a ghost row on it without re-verifying. The verified
history is four corpus files and two mis-numbered ones. The phantom row is
corrected here and a correcting row is appended to `CODEX_DELETIONS.log`, where
the faulty row is retained beside its correction rather than removed.

**Mechanism.** The scribe invented a rule under which a correction adding no
entry advanced a component other than the census. That is not the scheme. Each
such bump moved the odometer, so two files asserted a census of
12 and 202 for a corpus of two, and resolve-by-highest-tuple returned the
last of them. The content of `v1_2_0_2` was correct and current; only its name
was false. It is superseded by `v1_0_0_2_1`, which carries identical content
under a name that reads true.

**Recovery.** Full. No content was lost at any point and every version remains
readable in place. The fault was in naming and in resolution, never in text.

**Prevention.** `audit_corpus.py` in the geometric-encyclopedia-quran skill now
FAILs when the filename odometer disagrees with the head count. Had that check
existed, the fault would have died at the first mis-numbered push instead of
propagating through three.

Architect order, option A, 2026-08-19.
