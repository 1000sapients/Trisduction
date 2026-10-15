# PSP-TRIAXIAL-NEC-SUFF-01 · Harvest Card

**Title:** Triaxiality: Necessary, and the Code's Boundary
**Date:** 2026-10-15
**Source:** Mother codex `PhysOS__v1_0_16p.md`
**Kernel:** `PSP_Triaxial_Nec_Suff_01.lean` (self-contained, Lean 4.19.0 core, no imports)
**Status:** Harvested (kernel compiles, exit 0, zero sorry, zero axioms declared)

## What the codex proves (theorem grade)

| Theorem | Codex source | Cone |
|---|---|---|
| `two_axes_never_lock` | l.7007 (`decide`) | [propext] |
| `triad_irreducible` | l.7014 | [propext] |
| `identity_cone` | l.9992 (CAT-GAP-ELIMINATOR) | [] |
| `cone_apex_unique` | l.9995 | [propext] |

**Necessity:** No two-axis projection determines the point. The third axis is
necessary. This is theorem-grade in the codex.

## What the codex does NOT prove

"Sufficient to map reality" — the phrase "necessary and sufficient" occurs zero
times in the codex; "necessary" occurs once (unrelated). No theorem states
triaxiality sufficient to map Reality.

## Honest boundary

The kernel carries sufficiency as an explicit hypothesis (`variable`),
premise grade — never as a theorem. `sufficiency_conditional` shows the form:
*if* triaxiality mapped Reality, *then* the method would be complete. The
antecedent is not proved here or in the codex.

## Related codex data

- `gol_needs_all_three` (l.9346): GOL needs magnitude and direction together.
- `lock_blind_but_gol_directed` (l.9355): lock sign-blind; one bit fixes sign.
- `supply_side_silent` (l.14995): the register is silent on the supply side.
- Bedrock precedence L→G→M (l.23866).
