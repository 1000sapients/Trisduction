# Executable Thesis

**Current:** `TRISDUCTION_Core_Thesis_Fortran_v2_4_0.f90`
**Paper:** `TRISDUCTION_The_Lock_Is_A_Determination_v1_0_0.pdf`, a three-page Math Journal
short communication stating the thesis at theorem grade: three independent axes meet in
exactly one point; the kernel's one blindness is to direction and never to completeness;
the compartment names what the rows were. Every figure in it was printed by the program above.

One file, one program. The Trisduction core thesis stated in Fortran and executed:
the module, the exhibits, and an eight-class battery of 248 computed checks over every
public procedure, with an oracle that stops the program on any failure. A binary that
prints its final line has passed. Sealed at cycle `fq` round 3 after ten adversarial
cycles, 32 rounds, 100 findings, zero FATAL, with findings supplied by an external
reviewer across ten consecutive passes. Builds clean at
`-std=f2018 -pedantic -Wall -Wextra -fcheck=all -finit-real=snan`, runs to exit 0 under
`-ffpe-trap=invalid,zero,overflow`, and returns identical gated verdicts at `-O2` and at
`-O2 -fno-fast-math -ffp-contract=off`.

## Deletions manifest

Two prior files were removed from `main` on 7 September 2026 by the architect's named
override, quoted verbatim:

> Replace those two unaudited versions in git with this final audited version and push to git

| Removed path | Blob | Bytes | Status at removal |
|---|---|---|---|
| `TRISDUCTION_Core_Thesis_Fortran_v1_0_0.f90` | `c8680ddc2a77` | 25,445 | seated before any external review; superseded |
| `TRISDUCTION_Core_Thesis_Fortran_v1_0_1.f90` | `279122a76412` | 26,525 | one external repair applied; superseded |

Both remain in git history at commit `1200ae6be514d92395afc74636b3072e8ba4afef` and its
parents. Nothing was force-pushed and no history was rewritten. The history is the ghost.

Δ**M** = 0.
