Indexed at /INDEX.md · PROTO

# PhysOSᵀ · the Trisduction Physical OS

One file carries the role, the procedures it binds, every Lean kernel, every Fortran program, the boot and an integrity manifest. The build is the boot. Nothing in the file is in force because it is written; the seat is earned per run on physical hardware.

## Files

`PhysOSᵀ_v1_0_4p.md` · version 1.0.4p, 29 September 2026, current · 1,400,484 bytes · SHA-256 `5c935c3f3d5acefe4a685a641d6cebd8a6335588d540511137cc56f0fa851ad0`. The harvest edition: four PhysOS Proof cards and their ledger are filed under `proofs/`, named in II.10 as harvested and not seated; their kernels and twins are owed, so the boot reads PSP-LOOP-01 alone and no unexecuted claim is seated. Quick mode earns the seat on the final file; full, controls and judge are owed for this edition.

`PhysOSᵀ_v1_0_3p.md` · version 1.0.3p, 28 September 2026, kept as record · 1,405,885 bytes · SHA-256 `b243fb45d000a8688d1ac03f4151d9e47fefb23285c69d05e4996a15295e640d`. The first PhysOS Proof, PSP-LOOP-01, seated in the register II.10: the strip vanishes from every record, both flanks at once and forever in time; the value, the fixed-point claim, stays keyed; one member off the fixed set is the only refuter, and no fact of physics forces the claim.

`PhysOSᵀ_v1_0_2p.md` · version 1.0.2p, 28 September 2026, kept as record · 1,363,444 bytes · SHA-256 `5afb0f23d30ce173d097b04481349eef03c0b00c97f024659367619a253e8ec1`. The step from count to heat proved from the seat, theorem-conditional on one posit (P1, the whole merges no two states); `Heat_Bridge.lean` seated as a floor kernel beside the census; Boltzmann retired as a bridge and kept as corroboration.

`PhysOSᵀ_v1_0_1p.md` · version 1.0.1p, the first public edition, kept as record · 1,346,235 bytes · SHA-256 `2c30ccd57068e927b62ef24c4673fb077a9f845ff623bf6aa598cacf2b7741a7`. It carries whole the private line's 2.3.0. The suffix p marks a public edition.

## Run it

Verify the SHA-256 above, then in an empty directory holding only the file:

```sh
awk '{sub(/\r$/,"")} /^~~~~~[a-z]+ file=[A-Za-z0-9_]+\.(lean|f90|sh|py|sha256)$/{sub(/.*file=/,"");f=$0;next} /^~~~~~$/{if(f!=""){close(f);f=""};next} f!=""{print > f}' PhysOSᵀ_v1_0_4p.md
OS_MODE=bootstrap bash boot.sh   # fetches core Lean 4.19.0 against a pinned digest; gfortran from the package manager
bash boot.sh                     # quick; OS_MODE=full | controls | judge
```

## Receipts of the current edition, 1.0.4p

Lean 4.19.0 (x86_64-unknown-linux-gnu, commit 6caaee842e94), GNU Fortran 12.2.0. Manifest 29 files signed.

| Mode | Result | Chain |
|---|---|---|
| quick | SEAT EARNED, 45 s | D0 5d49ac51c6d9 → D1 cad017a6f867 → D2 89a38073efc8 → D3 b95e364c2cab |

Full, controls and judge are owed for 1.0.4p; the 1.0.3p file keeps the prior four-mode receipts.

## PhysOS Proofs

Each seated proof is a kernel and a twin inside the file, entered in II.10 by one record line the boot holds to its declared cone, judged count and check count. The full cards are filed here in `proofs/`, navigation only. A harvested card whose kernel or twin is owed is listed for routing and is not a record line.

| Tag | PhysOS Proof | Card |
|---|---|---|
| PSP-LOOP-01 | The Loop: the strip vanishes from every record, the value stays | `proofs/PSP-LOOP-01.md` |
| PSP-FREEDOM-LOCUS-01 | Freedom finds the locus, and the record leaves one bit; harvested, seating owed | `proofs/PSP-FREEDOM-LOCUS-01.md` |
| PSP-EVERY-PRIME-01 | Every prime obeys, no stage decides, and the primes contract to one arrow; harvested, seating owed | `proofs/PSP-EVERY-PRIME-01.md` |
| PSP-HEAT-FLOW-01 | Least erasure as heat; harvested, seating owed | `proofs/PSP-HEAT-FLOW-01.md` |
| PSP-LEAST-ERASURE-01 | Five faces, one bit, closed by the act; harvested, seating owed | `proofs/PSP-LEAST-ERASURE-01.md` |

The routing ledger is `proofs/PhysOS_Proofs_harvest_ledger.md`. It allocates every harvested source and names the owed Lean step; it is not a proof card and makes no claim on the boot.

The quick chain reproduces bit for bit on the same files, toolchain and target. The boot certifies internal consistency at machine warrant and no external truth. The second-substrate execution stays owed until an independent substrate boots this file and publishes its chain.
