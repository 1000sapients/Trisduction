Indexed at /INDEX.md · PROTO

# PhysOSᵀ · the Trisduction Physical OS

One file carries the role, the procedures it binds, every Lean kernel, every Fortran program, the boot and an integrity manifest. The build is the boot. Nothing in the file is in force because it is written; the seat is earned per run on physical hardware.

## Files

`PhysOSᵀ_v1_0_2p.md` · version 1.0.2p, 28 September 2026, current · 1,363,444 bytes · SHA-256 `5afb0f23d30ce173d097b04481349eef03c0b00c97f024659367619a253e8ec1`. The step from count to heat proved from the seat, theorem-conditional on one posit (P1, the whole merges no two states); `Heat_Bridge.lean` seated as a floor kernel beside the census; Boltzmann retired as a bridge and kept as corroboration.

`PhysOSᵀ_v1_0_1p.md` · version 1.0.1p, the first public edition, kept as record · 1,346,235 bytes · SHA-256 `2c30ccd57068e927b62ef24c4673fb077a9f845ff623bf6aa598cacf2b7741a7`. It carries whole the private line's 2.3.0. The suffix p marks a public edition.

## Run it

Verify the SHA-256 above, then in an empty directory holding only the file:

```sh
awk '{sub(/\r$/,"")} /^~~~~~[a-z]+ file=[A-Za-z0-9_]+\.(lean|f90|sh|py|sha256)$/{sub(/.*file=/,"");f=$0;next} /^~~~~~$/{if(f!=""){close(f);f=""};next} f!=""{print > f}' PhysOSᵀ_v1_0_2p.md
OS_MODE=bootstrap bash boot.sh   # fetches core Lean 4.19.0 against a pinned digest; gfortran from the package manager
bash boot.sh                     # quick; OS_MODE=full | controls | judge
```

## Receipts of the current edition, 1.0.2p

Lean 4.19.0 (x86_64-unknown-linux-gnu, commit 6caaee842e94), GNU Fortran 13.3.0, Intel Xeon 2.1 GHz, 4 GB. Manifest 27 files signed.

| Mode | Result | Chain |
|---|---|---|
| quick | SEAT EARNED | D0 42dc8d0a215f → D1 2e57d45e0217 → D2 c03543897324 → D3 d455f19fc22e |
| full | SEAT EARNED, 267 s | see §Φ.4 of the file |
| controls | 24 of 24 as expected | · |
| judge | PASSED, 267 of 267 negations refused | · |

The quick chain reproduces bit for bit on the same files, toolchain and target. The boot certifies internal consistency at machine warrant and no external truth. The second-substrate execution stays owed until an independent substrate boots this file and publishes its chain.
