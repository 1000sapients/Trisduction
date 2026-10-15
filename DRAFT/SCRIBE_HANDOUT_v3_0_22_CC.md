# Scribal handout · RH Master v3.0.22_CC · compile, verify, hold for the push command

**From:** the Claude Code session that keeps *A Formal Proof of the Riemann Hypothesis: The Twin Binder, One Locus*.
**To:** the scribe holding Lean 4.19.0 and Mathlib v4.19.0.
**File:** `RH_Both_Sides_Formal_Master_v3_0_22_CC.lean`. Fetch it from git at `DRAFT/RH_Both_Sides_Formal_Master_v3_0_22_CC.lean`, beside this handout at `DRAFT/SCRIBE_HANDOUT_v3_0_22_CC.md`. It is an uncompiled draft until your compile accepts it; it is seated at `FINAL_BINDING/` only on the push command (section 5).

- **Source:** derived from the seated v3.0.22 (`431be5e`, SHA-256 `0c1378aa…`).
- **Size:** 12,966 lines, 710,534 bytes.
- **SHA-256 as delivered:** `2f70be4740e83605ffadf195f914c5c55b66c6304816dbee9002131ad8e9b050`.

The `_CC` suffix marks a Claude Code build. Its purpose is that nothing the file says escapes Lean: every claim of the terminal certification block is now a pinned theorem, and every docstring and header clause states only what a type proves. No existing proof was weakened, and no existing pin changed its cone.

## 1. What changed against v3.0.22

1. **Header, lines 23 to 28 and 30 to 34, comments only, same line count.**
   - The blocked-route clause now says what the block theorems prove: no derivation valid at every reflection-closed configuration, from what those configurations share, yields the value. It also cites `every_route_passes_the_bit`.
   - The decoupling clause now matches the types:
     - Part X draws on Mathlib, Part I's root and the discrete charts of Parts III and IX.
     - No physical premise enters Part X except in the joint seal.
     - There are two bridges, §X-i and the joint seal, and no capstone or closure binder uses them.
   - The old clause said "uses only Mathlib analysis" and named one bridge; both are false at the types.
2. **New closed term `record_self_grounding_RO : RememberedOffered.SelfGrounding (LeastErasure (Rec ZetaZeros))`, defined as `⟨Unit, (), fun _ => cargo_at_zeros⟩`, pinned.**
   - It supplies the self-grounding argument that `round2_halted_uniduction`, `round2_absolute_closure` and `analytic_route_sealed` took as a printed premise `G`.
   - Those three now carry **no premise**. Their names are unchanged, and `the_complex_extensions` picks up the new types through `type_of%` with no edit.
3. **New theorem `every_route_passes_the_bit`, pinned.**
   - Statement: `∀ Q : Prop, (Q → RiemannHypothesis) → Q → RightHalfStripZeroFree ∧ LookBack ∧ RetractionInjective ZetaZeros ∧ RootReadTwice ZetaZeros`.
   - This is the "no escape" claim at its type. Any route to RH, from any premise, analytic or otherwise, delivers the 1-bit.
4. **`analytic_route_sealed` gains a fourth conjunct**, `∀ Q, (Q → RH) → Q → RightHalfStripZeroFree ∧ LookBack`, proved by `every_route_passes_the_bit`. Its docstring now states the four conjuncts and no more.
   - Dropped: the Mathlib library audit, Hadamard and explicit-formula positivity, and "every door blocked".
   - Added: the type-level reason nothing escapes. A ζ-specific route lies outside the blocked class and, if it reaches RH, has supplied the bit.
5. **Docstrings of `round2_halted_uniduction`, `round2_residual_monism` and `round2_absolute_closure`** are restated at type.
   - Dropped: "absolute", "stable under any strengthening", "only the analytic 1-bit can cross" and "only the true world survives".
   - Each docstring now says "No premise".
6. **New theorem `the_terminal_certification`, pinned.** It binds by `type_of%` the 18 results the terminal block cites, so the block is checked by the kernel:
   - `canonical_rh_unconditional`, `canonical_property_holds_off_the_line`, `pause_is_unconditional`, `the_unconditional_retrospective_seal`, `look_back_is_the_closure`;
   - `RememberedOffered.one_record`, `.the_true_world_carries_monism`, `.the_false_world_carries_no_monism`, `.the_root_read_twice_is_the_value`;
   - `monism_separates_shared_record`, `root_read_twice_iff_value`, `canonical_normal_form_bridge`, `euler_product_boundary`, `analytic_target_reduction`;
   - `physico_formal_supplies_look_back_and_rh`, `round2_absolute_closure`, `every_route_passes_the_bit`, `analytic_route_sealed`.
7. **Terminal certification block rewritten, headed v3.0.22_CC.** v3.0.22 had reverted the in-place correction of v3.0.19 (`81ca42e`). This block restores it and extends it:
   - "Seven theorems conclude RiemannHypothesis". Five take LookBack or an equivalent reading, and each is named. `no_offline_refuter_seals_rh` takes provability premises, and the joint seal takes the reading and the physical premises.
   - The socket is stated as `(∃ Z : ActualZeros, Z.zeros = ZetaZeros) ↔ LookBack`, separate from the atomic-necessity formula.
   - "Provably equivalent" replaces "definitionally".
   - The joint-seal paragraph is restored.
   - A new paragraph covers Round 2 and the analytic route.
   - The pin count reads 707.

## 2. Expected census (recount after compile)

- **Declarations:** 876 theorems (+2), 359 `def`s (+1), 52 structures, 7 inductive types, 21 namespaces.
- **Pins:** 707 under `#guard_msgs` (+3), split 391 empty / 34 [propext] / 133 [propext, Quot.sound] / 149 [propext, Classical.choice, Quot.sound].
- **`#print axioms`:** 966 commands, 259 of them unguarded (unchanged).
- **Complex extensions:** still 33 conjuncts.
- **New pins, all expected at [propext, Classical.choice, Quot.sound]:** `record_self_grounding_RO`, `every_route_passes_the_bit`, `the_terminal_certification`. The pins of `round2_halted_uniduction`, `round2_absolute_closure` and `analytic_route_sealed` keep that cone; their types change, their cones do not.

## 3. Compile and accept

Run `lake env lean RH_Both_Sides_Formal_Master_v3_0_22_CC.lean` in the Mathlib v4.19.0 project you used for v3.0.22. Accept only on all of the following:

- exit code 0;
- 0 errors, 0 warnings, 0 `#guard_msgs` mismatches;
- 707 guarded pins and 259 unguarded `#print axioms` messages;
- 0 `sorry` and 0 user-declared axioms;
- the compiler message stream identical to v3.0.22's, except for the three new pins and nothing else.

## 4. If the compile fails

Make no change of meaning. Report the exact message with its line number. These local fixes are permitted, each logged in your receipt:

- **(a)** The compiler asks for or refuses `noncomputable` on `record_self_grounding_RO`: drop or keep the keyword as asked.
- **(b)** An unused-variable warning in a new proof: rename the binder to `_`.
- **(c)** A projection index (`.2.2.2.2.1` and the like) on `analytic_target_reduction` fails to elaborate: replace it with the equivalent `obtain ⟨_, _, _, hRI, hLB, hRRT, _, hRH⟩ := analytic_target_reduction` inside a `by` block. The conjunct order is CanonicalRH, RootReadTwice (Rec ZetaZeros), strip, ↔ RetractionInjective, ↔ LookBack, ↔ RootReadTwice ZetaZeros, (CanonicalRH → ·) ↔ RH, ↔ RH.
- **(d)** The printed cone of a new pin differs from the pinned text: report it, and do not edit the pin to match. A different cone means the statement or proof is not what this handout says.

Anything else: stop and report.

## 5. Seat on the push command only

Do not push until the architect gives the push command. On that command:

- **Path:** seat the compiled bytes at `FINAL_BINDING/RH Binding/RH_Both_Sides_Formal_Master_v3_0_22_CC.lean`.
- **Commits:** two components, the artifact commit and the INDEX commit with seal `rh_v3022cc`.
- **INDEX layout:** put the S line inside SNAPSHOT, above `## MAP`, not after `## DECODER`. Lines appended after DECODER are dropped by the next MAP regeneration; three seats today had to be repaired for exactly this.
- **Verification:** re-GET the file and confirm the SHA.

## 6. Receipt to report back

- exit code, error, warning and mismatch counts;
- line count, byte count and SHA-256 of the compiled file, noting any byte that differs from the delivered SHA and why;
- census (theorems, defs, pins and the cone split);
- after the push command: artifact commit, INDEX commit and the re-GET match.

This handout covers the Lean file only. The paper is re-pinned after you push, to the compiled and seated bytes; if they differ from the delivered SHA, the seated bytes govern.
