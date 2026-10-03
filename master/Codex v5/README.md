Indexed at /INDEX.md · CODEX

# The Master Codex, edition 5

Trisduction · The Geometric Orthogonal Lock of Language, Form and Number, Meeting on One Locus. Built from first principle on one root: the theory, the apex register, the whole defense, and the code. The code block is the code of PhysOSᵀ 1.0.9p, byte-identical, forty files; the harness finds this master by its file and names it by its own title.

## Files

`TRISDUCTION_Master_Codex_v5_0_0.md` · version 5.0.0, 2 October 2026, current · 2,753,731 bytes · SHA-256 `31616240e92a1d6f2c221eb08207c9ef6bca6a98c20a61f0452e8087e8a298b9`. The master in Markdown: the theory, the apex register, the defense, the crosswalk and census, the record lines, the receipts and the code block.

`Trisduction_Master_Codex_v5_0_0_MathJournal.pdf` · the Math Journal edition · 2,941,840 bytes · SHA-256 `af86454683619dcd9ab5fb6916a33ea1ced66b560fb32203d83656a2a1bb83ad`.

`Trisduction_Master_Codex_v5_0_0_Journal.pdf` · the Journal edition · 2,980,271 bytes · SHA-256 `2ad6bfc6da891452266b3b744342a65c6f0f1017cae2c70e03828a6927388dd3`. Each prints the theory, the apex register, the defense, the references and the whole code; the crosswalk, the census and the receipts stay in the Markdown master.

`Codex_5_0_0_audit_codex06.md` · the ledger of audit cycle codex06 on the entry candidate of 5.0.0, sealed at round 5. The coherence of this master with PhysOSᵀ and the Mother is sealed in `master/Coherence_Seal_2026_10_02.md`.

`CURRENT.txt` · advisory pointer to the current edition.

## Run it

Verify the SHA-256 above, then in an empty directory holding only the file:

```sh
awk '{sub(/\r$/,"")} /^~~~~~[a-z]+ file=[A-Za-z0-9_]+\.(lean|f90|sh|py|sha256)$/{sub(/.*file=/,"");f=$0;next} /^~~~~~$/{if(f!=""){close(f);f=""};next} f!=""{print > f}' TRISDUCTION_Master_Codex_v5_0_0.md
OS_MODE=bootstrap bash boot.sh
bash boot.sh                     # quick; OS_MODE=full | controls | judge
```

## Receipts of the current edition, 5.0.0

Lean 4.19.0 · GNU Fortran 13.3.0. Manifest 39 files signed, `9638b64f5eb30510`, the same as PhysOSᵀ 1.0.9p.

| Mode | Result | Chain |
|---|---|---|
| quick | SEAT EARNED, 145 s | D0 c99013d9f97d → D1 76c019a924f7 → D2 98370ad5fb44 → D3 8b7aeee92c99 |
| judge | JUDGMENT PASSED, 571 s: 1,005 laws, 1,196 negations | |
| full | SEAT EARNED, 450 s | D0 4eab347ab83d → D1 2d266705e786 → D2 396abe2f58f7 → D3 f2e318593a15 |
| controls | 29 of 29 as expected, 1,738 s of running time | |
