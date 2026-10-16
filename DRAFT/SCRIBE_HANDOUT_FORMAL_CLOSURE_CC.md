# Scribal handout · RH_Formal_Closure_v1_0_0_CC · compile, verify, hold for the push command

**From:** the Claude Code session that keeps the RH papers.
**To:** the scribe holding Lean 4.19.0 and Mathlib v4.19.0.
**File:** fetch `DRAFT/RH_Formal_Closure_v1_0_0_CC.lean` from git, beside this handout. It stays an uncompiled draft until your compile accepts it, and it is seated only on the push command (section 4).

This draft replaces every earlier draft of the same file. It is re-extracted from the seated **v3.0.24_CC** (`b272c46`, SHA-256 `8345ede8…`), so it carries `the_self_recognition_closure`. The earlier file A, the corrected v3.0.22_CC header still in `DRAFT/`, needs no action: v3.0.24_CC already carries that correction.

## 1. The file

- **Size:** 2,188 lines, 108,338 bytes.
- **SHA-256 as delivered:** `8d95ccc1eeb614e3a339f3db4fb28f0beb3b3ba063a0c4d550333b1b447c7f68`.
- **Imports:** lines 1 to 4, the same four as v3.0.24_CC, including `Mathlib.NumberTheory.LSeries.Nonvanishing`.

**What it carries:**

- 187 declarations from v3.0.24_CC, each with its statement and proof byte-identical. They are:
  - all of Part X except three, which is 140 declarations;
  - the declarations of Parts I (9), III (32) and IX (6) that Part X uses, found by a namespace-aware dependency closure.
- The three left out are `carrier_embeds_in_complex` (§X-i), `physico_formal_supplies_look_back_and_rh` (the joint seal) and `the_terminal_certification`.
- Nothing from Parts II, IV–VIII, VIII-b or XI is carried. The file contains no physics vocabulary, comments included.

**What differs from the master's text:**

- Four docstrings are trimmed:
  - `discrete_chart_embeds_in_complex` loses a clause naming `carrier_embeds_in_complex`;
  - `TOE0.ΔE₀` loses "at positive energy";
  - `the_self_recognition_closure` loses its last sentence, which named the joint seal;
  - the Complex Triaxiality docstring loses "(lifted from Part II `PrimeFreedom.three_axis_lock` to ℂ)".
- Part X carries the master's module comments, except the heading of §X-i.
- The header, the part headings and the terminal block are new comments.

**Expected census:**

- 123 theorems, 52 `def`s, 5 `abbrev`s, 6 structures and 1 inductive type, in 4 namespaces (`TOE0`, `RememberedOffered`, `BoundChain`, `BoundChainMathlib`).
- 127 pins under `#guard_msgs`: 18 empty and 109 at [propext, Classical.choice, Quot.sound]. Every pin text is the master's.
- No unguarded `#print axioms`, so a clean compile prints nothing.

## 2. Compile and accept

Run `lake env lean RH_Formal_Closure_v1_0_0_CC.lean` in the Mathlib v4.19.0 project used for v3.0.24_CC. Accept only on all of the following:

- exit code 0;
- 0 errors, 0 warnings, 0 `#guard_msgs` mismatches;
- 0 `sorry` and 0 user-declared axioms;
- 127 pins;
- an empty message stream.

## 3. If the compile fails

Make no change of meaning. Report the exact message with its line number. These local fixes are permitted, each logged in your receipt:

- **(a) `unknown identifier` or `unknown constant`:** the dependency closure missed a declaration. Copy it verbatim from v3.0.24_CC into the same part, above its first use, with its master pin if it has one. List every declaration you add.
- **(b) A `#guard_msgs` mismatch:** report it, and do not edit the pin.

Anything else: stop and report.

## 4. Seat on the push command only

- **Path:** add `FINAL_BINDING/RH Binding/RH_Formal_Closure_v1_0_0_CC.lean`.
- **Commits:** the artifact commit, which also removes the `DRAFT/` files of this handout and of the superseded file A with the L6 manifest, then the INDEX commit.
- **Seal:** `rh_formal_closure_v100cc`, verb SEAT.
- **INDEX layout:** S lines go inside SNAPSHOT above `## MAP`.
- **Verification:** re-GET the file and confirm its SHA.

## 5. Receipt to report back

- exit code; error, warning and mismatch counts;
- lines, bytes and SHA-256 of the compiled file, noting any byte that differs from the delivered SHA and why;
- the census, and any declaration added under 3(a);
- after the push command: the artifact commit, the INDEX commit and the re-GET match.

The paper *The Completed Formal Closure of the Riemann Hypothesis* is pinned to the seated bytes of this file.
