# QURAN TRANSLATION · The Lossless Gloss Series

The per-surah lossless gloss of the Qurʾān, produced by the GLT mode of `scripture-analysis` at full density. Each surah occupies its own folder.

## Structure

```
Quran Translation/
  Q050 Qaf/
    Q050_Qaf_Lossless_Gloss.md     <- master source
    Q050_Qaf_Lossless_Gloss.pdf    <- Scripture edition render
```

**Naming.** Surah folders are `Q### Name`, zero-padded to three digits so that all 114 sort lexically; unpadded, `Q5` and `Q50` and `Q113` interleave wrongly in every listing, and correcting it later costs a rename and a manifest line per file. Files carry the same prefix, because a file detached from its folder must still name itself.

**The two files, and which one is master.** The Markdown is the master and the PDF is a render of it. A correction is made in the Markdown and the PDF rebuilt from it. A PDF edited alone is a fork, and the next build overwrites it silently.

**What full density means, scoped exactly.** Every content word carries its transliteration, its root, and its concrete floor on first occurrence in the unit; particles run plain and a word already glossed runs plain thereafter. This is lossless *over content words* with the spine kept readable, which is a lesser and different claim than the Atomizer's losslessness, where every source word including particles takes its own cell. The two are not conflated.

**Block grading.** Theme headers carry their grade on the header line. `head at verse N` marks a division the text supplies, checked against three marks: the head states an operation and the body supplies its particulars, no new operation opens inside the block, and a root at the head returns at or near its foot. `reader's cut` marks a division supplied here, for pace or because the passage's genre bars a head at intake. The closing reports the found-to-authored ratio, because a unit reporting all-found has fitted its cuts to the pattern.

**Scope fence.** The block division carries evidence about composition history in neither direction. A found head is not evidence of unitary composition and an authored cut is not evidence of a seam, since a hypothesis confirmed by the pattern holding and equally confirmed by its breaking cannot be refuted by either.

**Rendering.** `python3 build_scripture.py source.md out.pdf`, Scripture edition, `columns: 1` set explicitly against the two-column default because the gloss spine runs long between interruptions and a narrow measure fragments it. EB Garamond must be instanced with Italic and Bold Italic alongside the upright faces: the three channels are bold spine, italic transliteration, plain gloss, and where only Regular and Bold are present the italic sets upright and the transliteration channel is lost with no warning.

**Why no per-surah README.** A surah folder holds one work in two formats and is self-evident from its filenames. The folder law requires a README past one file on grounds of legibility, and 114 near-identical READMEs would subtract from legibility rather than add to it. This file carries the convention for the series instead.

---

Census: **1 of 114.** Seated: Q050 Qāf.
