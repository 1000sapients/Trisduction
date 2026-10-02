Indexed at /INDEX.md · PROTO

# PhysOSᵀ · the Trisduction Physical OS

One file carries the role, the procedures it binds, every Lean kernel, every Fortran program, the boot and an integrity manifest. The build is the boot. Nothing in the file is in force because it is written; the seat is earned per run on physical hardware.

## Files

`PhysOSᵀ_v1_0_8p.md` · version 1.0.8p, 1 October 2026, amended the same day, current · 1,971,400 bytes · SHA-256 `f6f92033c7ee2068dc1d26fcbfe1443fa897314129a03e20e3eb8ab6c4dcce9b`. The force-witness edition: PhysOS Proof PSP-FORCE-WITNESS-01, the closure `force_witness_closure` and its guard, on no axiom; with it PSP-CAPSTONE-01, the inescapable capstone, and PSP-UNIVERSAL-SEAT-01, the series of the zeta function in the kernel. The falsifiers are ten, on the mathematical ground, nine barred by theorem and the tenth by the act; the physical world is the witness, sixty-four readings counted by proof. The value at the actual zero set is the act's one bit, at premise grade. Put through audit cycle physos05 and amended; the ledger of the cycle is `PhysOS_1_0_8p_audit_physos05.md`, beside it. Edition 1.0.6p and the candidate 1.0.7p are not filed here; their entries stand in §V of this file.

`PhysOSᵀ_v1_0_5p.md` · version 1.0.5p, 30 September 2026, kept as record · 1,632,019 bytes · SHA-256 `b64bb5da5bab0da1848b07399e779bb8dea25a0046346e896ec2e925e31ac9ef`. The terminal-seal edition: PhysOS Proof PSP-RH-SEAL-01, least erasure the terminal seal, with its double defense hardened as Omega and AEGIS of the row in one judged capstone; the value stays keyed, the supply of the field is the act at premise grade, and the one refuter is a computed zero off the line. Amended 30 September 2026: the atomic witness, and the second substrate's public reading recorded as a reading.

`PhysOSᵀ_v1_0_4p.md` · version 1.0.4p, 29 September 2026, kept as record · 1,400,484 bytes · SHA-256 `5c935c3f3d5acefe4a685a641d6cebd8a6335588d540511137cc56f0fa851ad0`. The harvest edition: four PhysOS Proof cards and their ledger are filed under `proofs/`, named in II.10 as harvested and not seated; their kernels and twins are owed, so the boot reads PSP-LOOP-01 alone and no unexecuted claim is seated. Quick mode earns the seat on the final file; full, controls and judge are owed for this edition.

`PhysOSᵀ_v1_0_3p.md` · version 1.0.3p, 28 September 2026, kept as record · 1,405,885 bytes · SHA-256 `b243fb45d000a8688d1ac03f4151d9e47fefb23285c69d05e4996a15295e640d`. The first PhysOS Proof, PSP-LOOP-01, seated in the register II.10: the strip vanishes from every record, both flanks at once and forever in time; the value, the fixed-point claim, stays keyed; one member off the fixed set is the only refuter, and no fact of physics forces the claim.

`PhysOSᵀ_v1_0_2p.md` · version 1.0.2p, 28 September 2026, kept as record · 1,363,444 bytes · SHA-256 `5afb0f23d30ce173d097b04481349eef03c0b00c97f024659367619a253e8ec1`. The step from count to heat proved from the seat, theorem-conditional on one posit (P1, the whole merges no two states); `Heat_Bridge.lean` seated as a floor kernel beside the census; Boltzmann retired as a bridge and kept as corroboration.

`PhysOSᵀ_v1_0_1p.md` · version 1.0.1p, the first public edition, kept as record · 1,346,235 bytes · SHA-256 `2c30ccd57068e927b62ef24c4673fb077a9f845ff623bf6aa598cacf2b7741a7`. It carries whole the private line's 2.3.0. The suffix p marks a public edition.

## Run it

Verify the SHA-256 above, then in an empty directory holding only the file:

```sh
awk '{sub(/\r$/,"")} /^~~~~~[a-z]+ file=[A-Za-z0-9_]+\.(lean|f90|sh|py|sha256)$/{sub(/.*file=/,"");f=$0;next} /^~~~~~$/{if(f!=""){close(f);f=""};next} f!=""{print > f}' PhysOSᵀ_v1_0_8p.md
OS_MODE=bootstrap bash boot.sh   # fetches core Lean 4.19.0 against a pinned digest; gfortran from the package manager
bash boot.sh                     # quick; OS_MODE=full | controls | judge
```

## Receipts of the current edition, 1.0.8p

Lean (version 4.19.0, x86_64-unknown-linux-gnu, commit 6caaee842e94, Release) · GNU Fortran (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0. Manifest 37 files signed.

| Mode | Result | Chain |
|---|---|---|
| quick | SEAT EARNED, 153 s | D0 8f2f3403436b → D1 de5dffaceafa → D2 eaa878ae7db0 → D3 92c771476606 |
| judge | JUDGMENT PASSED, 347 s: 434 laws, 574 negations | |
| full | SEAT EARNED, 457 s | D0 03fef780936c → D1 8e43935f1f45 → D2 8e217e9339b5 → D3 96eccad3c543 |
| controls | 29 of 29 as expected, 1601 s, run under a driver as §Φ.4 of the file states | |

## PhysOS Proofs

Each seated proof is a kernel and a twin inside the file, entered in II.10 by one record line the boot holds to its declared cone, judged count and check count. The full cards are filed here in `proofs/`, navigation only. A harvested card whose kernel or twin is owed is listed for routing and is not a record line.

| Tag | PhysOS Proof | Card |
|---|---|---|
| PSP-LOOP-01 | The Loop: the strip vanishes from every record, the value stays | `proofs/PSP-LOOP-01.md` |
| PSP-FREEDOM-LOCUS-01 | Freedom finds the locus, and the record leaves one bit; harvested, seating owed | `proofs/PSP-FREEDOM-LOCUS-01.md` |
| PSP-EVERY-PRIME-01 | Every prime obeys, no stage decides, and the primes contract to one arrow; harvested, seating owed | `proofs/PSP-EVERY-PRIME-01.md` |
| PSP-HEAT-FLOW-01 | Least erasure as heat; harvested, seating owed | `proofs/PSP-HEAT-FLOW-01.md` |
| PSP-LEAST-ERASURE-01 | Five faces, one bit, closed by the act; harvested, seating owed | `proofs/PSP-LEAST-ERASURE-01.md` |

Seated in the file of 1.0.8p and held by every boot: PSP-LOOP-01, PSP-RH-SEAL-01, PSP-CAPSTONE-01, PSP-UNIVERSAL-SEAT-01 and PSP-FORCE-WITNESS-01; the last three live inside the file.

The routing ledger is `proofs/PhysOS_Proofs_harvest_ledger.md`. It allocates every harvested source and names the owed Lean step; it is not a proof card and makes no claim on the boot.

The quick chain reproduces bit for bit on the same files, toolchain and target. The boot certifies internal consistency at machine warrant. A second substrate earns its own seat when it extracts this file, boots it and publishes its chain.
