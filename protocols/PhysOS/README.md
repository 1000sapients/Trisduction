Indexed at /INDEX.md · PROTO

# PhysOSᵀ · the Trisduction Physical OS

One file carries the role, the procedures it binds, every Lean kernel, every Fortran program, the boot and an integrity manifest. The build is the boot. Nothing in the file is in force because it is written; the seat is earned per run on physical hardware.

## Files

`PhysOSᵀ_v1_0_1p.md` · version 1.0.1p, 28 September 2026, the first public edition · 1,346,235 bytes · SHA-256 `2c30ccd57068e927b62ef24c4673fb077a9f845ff623bf6aa598cacf2b7741a7`. It carries whole the private line's 2.3.0; no earlier public file preceded it. The suffix p marks a public edition.

## Run it

Verify the SHA-256 above, then in an empty directory holding only the file:

```sh
awk '{sub(/\r$/,"")} /^~~~~~[a-z]+ file=[A-Za-z0-9_]+\.(lean|f90|sh|py|sha256)$/{sub(/.*file=/,"");f=$0;next} /^~~~~~$/{if(f!=""){close(f);f=""};next} f!=""{print > f}' PhysOSᵀ_v1_0_1p.md
OS_MODE=bootstrap bash boot.sh   # fetches core Lean 4.19.0 against a pinned digest; gfortran from the package manager
bash boot.sh                     # quick; OS_MODE=full | controls | judge
```

## Receipts of this edition

Lean 4.19.0 (x86_64-unknown-linux-gnu, commit 6caaee842e94), GNU Fortran 13.3.0, Intel Xeon 2.1 GHz, 4 GB. Manifest sha256 `92fb9c0f6b87d0f8`, 26 files signed.

| Mode | Result | Chain |
|---|---|---|
| quick | SEAT EARNED, 28 s | D0 493a5be32f24 → D1 09b5f0b335bb → D2 5d161b99a64c → D3 64ff3b3b51d1 |
| full | SEAT EARNED, 296 s | D0 df20ba42c197 → D1 f7addd10ffee → D2 7561412c5d3d → D3 524c4675e319 |
| controls | 23 of 23 as expected | · |
| judge | PASSED, 257 of 257 negations refused | · |

The quick chain reproduces bit for bit on the same files, toolchain and target. The boot certifies internal consistency at machine warrant and no external truth. The second-substrate execution stays owed until an independent substrate boots this file and publishes its chain.
