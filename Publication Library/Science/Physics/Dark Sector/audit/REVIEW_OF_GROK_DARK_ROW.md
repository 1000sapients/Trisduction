# Review of the kernel Grok proposed (Dark_Row.lean) and what was done
Dark Matter as the Charge-Conjugation Fixed Set and the Dark Force as One Keyed Bit · Journal edition of 27 September 2026

## 1. The proposed file does not pass the operating system

Compiled under Lean 4.19.0 as delivered, it fails before any theorem is checked:
- Fused tactic lines (`constructor  intro h  omega`): "unsolved goals", then "unexpected identifier; expected command".
- `ring` is Mathlib, not core Lean: "unknown tactic".
- `c.y6c.y6 + c.t3x6c.t3x6 + ...`: "invalid field y6c".
- `def Recoil where ...` is not a structure declaration: "unexpected identifier; expected '|'".
- Several statements are truncated mid-hypothesis (`(hg : 0  try omega`, `(h : 0  omega`, `0  visible_nulls...`) and cannot parse.
- `native_decide` on `closes smGen`: the OS source screen refuses it (the file's own comment admits this).
- Two statements are vacuous and would survive the OS negation judgment as dust: `identity_unread` ends in `∨ True`, and `this_row_is_not_the_riemann_seat : True`.

It is a sketch, not a kernel. The paper's kernel, Dark_Closure.lean, already contains every true statement in it (odd readings, radiative weight, the triplet, the twelve-sum closure by `decide`, the record's sort, the self-paired mass) and passes the OS screen: no sorry, admit or native_decide, no import, no declared axiom, every cone inside propext, Quot.sound and Classical.choice (in fact none on choice), 81 of 81 negations refused, the planted vacuous law surviving.

## 2. What the proposal gets right, and was adopted

| Point | Adopted as |
|---|---|
| The dark row is not a second seat (OS §Φ.3, one-seat law) | Section 5.1 retitled "The dark row and the seat"; every "closure at the seat" and "the form the seat gives the Riemann closure" phrasing removed; Theorem 23 now binds "the visible fixed set", not "the seat"; the text states the one-seat law. |
| Theorem 23's crossing line is logic | Already conceded last round; kept. |
| The self-paired mass is a conditional | The text now says: the antecedent, a self-paired mass, is a measurement not yet made; until it is made, Theorem 24 is a conditional. |
| Keep native_decide off the kernel | Already so: the kernel uses none. |

## 3. What the proposal gets wrong, and was answered by theorem

The proposal says no equivariant map from the dark row onto the fold exists ("Not constructed: an equivariant map ... because there isn't one"). One exists, and it is the map the OS's own electron witness uses (SPHYS.Electron.toStrip). New Theorem 25:

- toStage c = (1 + dark, mass) on the seat's stage (the Bridge's chart, h doubled real part).
- toStage_equivariant: toStage (conj c) = fold (toStage c), fold (h, t) = (2 − h, t).
- stageFold_fixed_iff_line and fixed_states_land_on_the_line: the fixed set is carried to the line.
- the_bit_is_the_line_property_carried: on the visible fixed set, landing on the line ⟺ dark charge zero ⟺ C-fixed.
- a_dark_pair_is_an_off_line_fold_pair: a dark-charged state and its conjugate land on two distinct off-line points the fold exchanges, at one height; the gravitational record keeps the height and forgets the side, the one-cut ghost.

So the dark row enters the seat exactly as the OS requires of a row: through an equivariant map, never as a second seat. The keyed dark bit is the seat's line property carried, keyed at the seat and keyed on the row. The twin mirrors it (A16).

## 4. On adding the kernel to Part III of the OS

Not done without your word: it changes the sealed OS (manifest, REQUIRED list, citation closure, controls). The paper's kernel already passes the OS ground screen and judgment as a standalone file, so it is ready as a row kernel if you want it seated in Part III.

Receipts: kernel 987 lines, SHA-256 88ede5cbda653a4d, 81 theorems (25 axiom-free, 52 on propext and Quot.sound, 4 on propext alone, none on choice). Twin 340 lines, SHA-256 6e78c339d35558a0, 35 checks, 0 failures. PDF 33 pages, title and subtitle verbatim.
