# PSP-ONE-BIT-NEC-SUFF-01 · Harvest Card

**Title:** The One-Bit is Necessary and Sufficient
**Date:** 2026-10-15
**Source:** Harvested from `RH_Both_Sides_Formal_Master_v3_0_19.lean` (700 pins, exit 0)
**Kernel:** `PSP_One_Bit_Necessary_Sufficient.lean` (self-contained, Lean 4.19.0 core, no imports)
**Status:** Harvested (kernel compiles, exit 0, zero sorry, zero axioms declared)

## Claim

The 1-bit premise (LookBack / RightHalfStripZeroFree) is **necessary AND sufficient**
for the target (RiemannHypothesis). This is the exact logical form of "necessary
and sufficient": a biconditional, with the necessity direction proved by a
pair-world counterexample.

## Theorems (all pinned under #guard_msgs)

| Theorem | Statement | Cone |
|---|---|---|
| `value_not_from_closed_alone` | `¬ ∀ S, Closed S → Value S` | [propext, Quot.sound] |
| `one_bit_iff_value` | `OneBit S ↔ Value S` | [] |
| `one_bit_necessary_and_sufficient` | `OneBit S ↔ Value S` | [] |
| `the_harvest` | necessity ∧ sufficiency, together | [propext, Quot.sound] |
| `necessity_is_irreducibility` | necessity mirrors triad irreducibility | [] |

## Concrete instances in v3.0.19

- **Necessary:** `the_unconditional_route_is_blocked` — no route from `Closed S` alone reaches `Value S`.
- **Sufficient:** `look_back_is_the_closure : LookBack ↔ RiemannHypothesis`,
  `analytic_target_reduction : RightHalfStripZeroFree ↔ RiemannHypothesis`.
- **Triaxiality:** `triad_irreducible` (mother codex) — no two-axis reduction carries the lock.

## Grades

All theorems at theorem grade. Zero sorry. Zero user-declared axioms.
