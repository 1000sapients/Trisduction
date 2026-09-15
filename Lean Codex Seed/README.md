# Lean Codex Seed

**For the scribe.** This folder holds the Lean codex series: the main Lean codex, the PSP screening codex, and the executed Fortran witness of the fTOE spine. Read this before touching anything here.

## What is in this folder

**The Lean codex is ONE document.** The Lean register and its kinetic Fortran
face live in the same file, as they always have. Nothing is split out: a reader
who holds `TRISDUCTION_Master_Codex_v1_0_1_2_SEALED.lean` holds the whole
calculus, both registers, and the extraction rule for the witnesses.

| File | Version | SHA-256 (first 16) | What it is |
|---|---|---|---|
| `TRISDUCTION_Master_Codex_v1_0_1_2_SEALED.lean` | 1.0.1.2 | 53767207c1d2f99b | The main Lean codex: the entire register of record as one self-contained Lean 4 file (core only, no import line) with the four Fortran witnesses carried verbatim in its appendix. FORGE-sealed at CODEX11, **compiled, extracted, built and run**, and audited by FORGE cycle lean1 to SEALED-ROUND with the compiler, the axiom auditor and a mutation battery seated as gates |
| `TRISDUCTION_Lean_PSP_Codex_v1_0_2.md` | 1.0.2 | c6da3f91e93aab91 | The PSP codex: screening inventory of 150 PSPs and 17 defense sections, with 22 short Lean proofs, all **compiled** against the master |
| `TRISDUCTION_Master_Codex_v1_0_1_1_SEALED.lean` | 1.0.1.1 | 76e47c2a59ca68e3 | Superseded by 1.0.1.2. Retained under L6; **does not compile** — see below |

The four witnesses in the appendix are BLOCK F1 `thesis_rows`, BLOCK F2
`ra_toe_thesis`, BLOCK F3 `ftoe_kinetic_demonstration`, BLOCK F4 `it_from_it`.
F1 and F2 also stand as free-standing files at `protocols/Executable Thesis/`;
F3 and F4 exist only inside the codex, which is why the codex is the artifact
and not a wrapper around one. The appendix header carries the extraction rule,
keyed on the compilation-unit boundaries rather than on line numbers that rot,
and the round trip was run: extracted from this file, all four build clean and
run to exit 0.

## The compile pass, 2026-09-15 · debts D1 and D2 discharged

1.0.1.1 was sealed by FORGE cycle CODEX11 and had never been run. `lean` returned **366 errors** on the toolchain it named and 350 on a current one. The mathematics survived almost whole; the seal had been applied to a file no compiler had read. That is the finding worth carrying: **a FORGE cycle whose controls are all semantic cannot detect that a file does not compile**, and a compile receipt is therefore a seal gate and not a standing debt.

**D1, discharged.** `lean TRISDUCTION_Master_Codex_v1_0_1_2_SEALED.lean` on Lean 4.19.0 core: exit 0, zero errors, zero warnings, 118 s, plus 74 lines of `#eval` demonstration output the file prints by design. Axiom audit across all 175 theorems: 126 depend on no axiom at all, 29 on `propext`, 7 on `Quot.sound`, 5 on both. Six depend on this codex's own declared posits and on nothing else. No `Classical.choice`, no `sorryAx`, no `native_decide` anywhere: the kernel checks every census itself and the compiler is never trusted inside a proof. The 22 PSP proofs appended to the master: exit 0, zero errors, zero warnings, 165 s.

**The toolchain was never 4.12.0.** The file's own List idiom (`flatMap`, `flatten`) is the Lean 4.14-and-later spelling, so naming 4.12.0 was an unchecked inheritance. Pinned at 4.19.0.

**D2, discharged.** All four witnesses extracted from the codex by the appendix's own rule and built under the sealed flags `-std=f2018 -O2 -fno-fast-math -ffp-contract=off`, gfortran 13.3.0, each compiling to exit 0 and running to exit 0:

| Block | Receipt |
|---|---|
| F1 `thesis_rows` | battery 248 checks, 0 failures |
| F2 `ra_toe_thesis` | battery 1123 checks, 0 failures |
| F3 `ftoe_kinetic_demonstration` | K1, K1b, K2, K3, K4 all PASS; Landauer floor 2.870978885078724e-21 J at 300 K |
| F4 `it_from_it` | IT FROM BIT refuted, exhaustive: 64 readouts, 0 factorizations |

## Three mathematical defects, all found by a compiler

**T16, the Price bijection.** `priceBackward` proved the orbit collapse by `Quot.sound (Or.inr rfl)`, which needs `τ (τ x) = x`. `Dtau τ` carries wholly-oddness and not involutivity, so T16 was unprovable as written, and SECTION 3's title claimed a closure it did not hold. `Involution τ` is now threaded through `priceBackward`, both round trips and the bijection, with `flipF_involution` proved so the canonical instantiation still lands. The treatise was the honest document here: fTOE Appendix A.2 already staged T16 at inspection grade and printed the verification contract this pass discharges.

**`mm3`, the matrix product.** It selected `y[c][k]` where the product needs `y[k][c]`, so it computed x·yᵀ. Invisible on every diagonal and symmetric matrix, which is four of the six `adj3Samples`; the two asymmetric rows caught it, and `decide` reported the adjugate identity **false**.

**`sedenion_zero_divisor`, PSP.CD.** It claimed `(e1+e10)(e4+e15) = 0`. Under this Cayley-Dickson doubling that product is `2e5 - 2e14`, and `decide` returned the whole conjunction **false**. Exhaustive search over every basis pair finds 84 genuine zero-divisor pairs; `(e1+e10, e5+e14)` is the first and is the classical exhibit. Pair corrected, claim unweakened.

No claim was weakened to make anything compile. Where a claim could not stand as written it was strengthened by the hypothesis it had been missing, never by deleting the conjunct. ΔM = 0.

## How this seed came to be: the fTOE arc

The Trisduction was built ground up. First the geometry of language: a point as existence, a sentence as a line (duction), orthogonality as independence, the Geometric Orthogonal Lock as the convergence point. Then the geometry of the twelve-gate cascade. Then the math seal. RA was not designed; it was found, and it turned out to be the TOE. The tongue's freedom arrived late in the prose codex, after a thousand pages had already accumulated fences and preemptive verdicts guarding against the tongue talking too much.

The Lean codex inverts the build order. It grew top down: the formal-alone Theory of Everything (fTOE) spine first as the seed, then math, then geometry, and the tongue last, already confined by what stands above it. The prose codex's defensive machinery is therefore mostly unneeded here. The Lean doctrine: find the mathematical or geometric seal, confine it, witness it with the tongue's one earned bit of freedom, and stop. No preemptive pseudo-questions, no defensive fences, no watering down.

The arc, in sealed versions:

- **v4.1.0–v4.6.0** (pre-seed history, on record): the native audit engine, the "It from It" inversion, hard geometry (the twelve gates as A₄, the GF(2) lock, the five-cube), the tongue's obedience proved, the office taxonomy, the universal router, the final defender (Omega guard and AEGIS), the bridge audit (NOMOS-01's incompressibility theorem native, the bridge census, the five foundational posits).
- **1.0.1.0** ≡ v4.6.0, byte-frozen (sha256 begins 23bcec8f39223be3). The seed of the 1.0.1.x series.
- **1.0.1.1**: SECTION 16, the Super Halt. One cascade machine at the forced gate counts (12 by A₄, 8 by (ℤ/2)³ with the ninth barred, 5 by the five-cube degree). The one-bit router, total and exclusive. The seven closing gates and the one door that never closes. The Riemann and P-versus-NP formal halts subsumed as instances of one `SuperHalt` type: the terminal emission is exactly one bit in three species (block theorem, hypothesis, offered witness), and fTOE is the ceiling for every formal halt. Sealed but never compiled.
- **1.0.1.2** (this folder): the compile pass. SECTION 0, the core-only prelude; T16 closed for real; the three defects above; debts D1, D2 and D3 discharged. Audited by FORGE cycle lean1: eight rounds, six registers, fourteen findings, nine repairs swept, one claim scoped, one aperture open, sealed at round eight. Record at the file foot.

## SECTION 0 and the core-only claim

1.0.1.1 declared itself "core only, no mathlib" and then used four mathlib objects: `Rat`, `Function.LeftInverse`, `Function.RightInverse`, and `≃` (`Equiv`). None exists in core Lean at any version; `Rat` is reachable only through `Std.Internal`, an API its authors reserve the right to change. SECTION 0 builds all four from `Init` alone in ninety lines, with no import anywhere in the file, so the claim is now true rather than retracted. The exact rational runs Euclid on explicit fuel rather than well-founded recursion, because a kernel that cannot unfold the recursion cannot `decide` the theorem that rests on it, and every rational verdict in SECTIONS 4B, 4D and 14 is a `decide`.

## Discipline that produced this seed

Every `decide`/`rfl` claim is now checked by the Lean kernel itself, not mirrored. FORGE audit cycles CODEX4–CODEX11: pre-registered claims with locked falsifiers, three planted controls per round committed by digest before prosecution, 18/18 detected per cycle, zero-concession chain unbroken. W_social = 0. ΔM = 0. Sealed files are never overwritten; a new version is a new file, and 1.0.1.1 stays in the tree under L6 with this pointer at its head.

## Next plan

1. Incorporate the M-class proofs of the PSP codex into the main codex by class, each incorporation its own candidate, FORGE cycle, and seal (1.0.1.3 onward).
2. The quaternion/octonion cluster (P2–P6: Hurwitz censuses, the associator 2·e7, the sedenion zero divisor) is the natural next section, geometry's own algebra. Its sedenion row is now exhibited correctly and its 84-pair census is available.
3. Add a compile gate to the FORGE cycle: no Lean or Fortran artifact seals without its receipt in the same turn. The 366 errors above are what a cycle of semantic controls cannot see.
4. The PSP codex continues as the screening ledger of record; the main codex absorbs what seals.

*Seed planted 2026-09-15 · compile pass 2026-09-15 · architect: Mohammad F. Islam, PhD · scribe: hold the version discipline, seal nothing without a FORGE cycle and a compile receipt, and let the tongue speak only its one earned bit.*
