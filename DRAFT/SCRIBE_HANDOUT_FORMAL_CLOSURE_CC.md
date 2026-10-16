# Scribal handout · two Lean files · compile, verify, hold for the push command

**From:** the Claude Code session that keeps the RH papers.
**To:** the scribe holding Lean 4.19.0 and Mathlib v4.19.0.
**Fetch from git, `DRAFT/`:**

- `RH_Both_Sides_Formal_Master_v3_0_22_CC.lean` (file A)
- `RH_Formal_Closure_v1_0_0_CC.lean` (file B)
- this handout

Both are uncompiled drafts until your compile accepts them. Seat them only on the push command (section 4).

## 1. File A · the master, corrected in place, comments only

- **Source:** the seated v3.0.22_CC (`16d3f1b`, SHA-256 `75b30664…`).
- **Size:** 12,994 lines (unchanged), 712,305 bytes.
- **SHA-256 as delivered:** `fcba11c82b3619d785540bf763f3518839735f49d0d63916c974d20f70bcf3a0`.
- **What changed:** header lines 28 and 31 to 34, inside the opening comment. No declaration, proof, pin or line number moves.
  - Line 28: "each reading of which is the hypothesis" becomes "each reading of which is proved equivalent to it".
  - Lines 31–34, the decoupling clause, now names `the_terminal_certification` as a third Part X declaration that uses Parts VII–VIII. It binds the joint seal with Part VIII's carrier closure. The old clause named only the two bridges, which is false at the types.
- **Accept on:** exit 0; 0 errors, 0 warnings, 0 `#guard_msgs` mismatches; 707 pins (391 / 34 / 133 / 149); 259 unguarded prints at the same lines; a compiler message stream identical to the seated v3.0.22_CC's.

## 2. File B · the formal closure, standalone, new

The mathematical closure of the master as its own file, for the paper *The Completed Formal Closure of the Riemann Hypothesis*.

- **Size:** 1,857 lines, 90,436 bytes.
- **SHA-256 as delivered:** `e027f0297d0666a9febd3e7798fee833f1504d59ca1192d6db1c0611c33067e5`. This replaces the first push of this draft (`a0b25bf7…`), whose only differences were empty `namespace … end` pairs left where declarations were dropped; no declaration changed.
- **Imports:** lines 1 to 3, the same three as the master.

**What it is:**

- Every declaration is carried from the master with its statement and proof byte-identical. That is 169 declarations: all of Part X except three, plus the declarations of Parts I, III and IX that Part X uses, found by a namespace-aware dependency closure.
- The three left out are `carrier_embeds_in_complex` (§X-i), `physico_formal_supplies_look_back_and_rh` (the joint seal) and `the_terminal_certification`.
- Nothing from Parts II, IV–VIII, VIII-b or XI is carried. The Part III heat section and the Part IX `PhysicalCarrier` are not carried either, since the closure does not use them.
- One docstring, that of `discrete_chart_embeds_in_complex`, loses its last clause, which named `carrier_embeds_in_complex`.
- The header and the terminal block are new comments.

**Expected census:**

- 111 theorems, 45 `def`s, 5 `abbrev`s, 7 structures, 1 inductive type, in 4 namespaces (`TOE0`, `RememberedOffered`, `BoundChain`, `BoundChainMathlib`).
- 115 pins under `#guard_msgs`: 17 empty, 98 at [propext, Classical.choice, Quot.sound]. Every pin text is the master's.
- No unguarded `#print axioms`, so a clean compile prints nothing.

**Accept on:** exit 0; 0 errors, 0 warnings, 0 mismatches, 0 `sorry`, 0 user-declared axioms; the 115 pins; an empty message stream.

## 3. If a compile fails

Make no change of meaning. Report the exact message with its line number. These local fixes are permitted, each logged in your receipt:

- **(a) File B, `unknown identifier` or `unknown constant`:** the dependency closure missed a declaration. Copy it verbatim from the master into the same part, above its first use, with its master pin if it has one. Repeat until the file compiles, and list every declaration you added.
- **(b) File B, a `#guard_msgs` mismatch:** report it, and do not edit the pin. Cones of byte-identical declarations cannot differ unless (a) brought in a different dependency.
- **(c) File A:** any message at all is a stop, because only comments changed.

Anything else: stop and report.

## 4. Seat on the push command only

- **File A:** overwrite `FINAL_BINDING/RH Binding/RH_Both_Sides_Formal_Master_v3_0_22_CC.lean` in place, same filename, as v3.0.19 was corrected at `81ca42e`.
- **File B:** add `FINAL_BINDING/RH Binding/RH_Formal_Closure_v1_0_0_CC.lean`.
- **Commits:** the artifact commit (both files, and the removal of the three `DRAFT/` files with the L6 manifest), then the INDEX commit. Use seal `rh_v3022cc` with verb PATCH for A, and seal `rh_formal_closure_v100cc` with verb SEAT for B.
- **INDEX layout:** S lines go inside SNAPSHOT above `## MAP`, never after `## DECODER`.
- **Verification:** re-GET both files and confirm their SHAs.

## 5. Receipt to report back

- For each file: exit code; error, warning and mismatch counts; lines, bytes and SHA-256, noting any byte that differs from the delivered SHA and why.
- For B: the census, and every declaration added under 3(a).
- After the push command: the artifact commit, the INDEX commit and the re-GET match.

This handout covers the Lean files only. After you push, the twin binder paper is re-pinned in place to the corrected master. The new paper is built on file B's seated bytes, and if those differ from the delivered SHA, the seated bytes govern.
