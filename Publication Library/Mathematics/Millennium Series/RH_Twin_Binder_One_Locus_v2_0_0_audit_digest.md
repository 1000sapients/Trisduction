# Audit digest · A Formal Proof of the Riemann Hypothesis: The Twin Binder, One Locus · 2.0.0

The paper, its Markdown master and its Math Journal PDF carry one version, 2.0.0, and one date, 15 October 2026. They are read against the deposited file `FINAL_BINDING/RH Binding/RH_Both_Sides_Formal_Master_v3_0_16.lean`: 12,591 lines, 689,392 bytes, SHA-256 `2d2f328b251a19e3dc4ef1513fc133d3928319754a1b4996523ff8df5b11536b`. The file holds no axiom, no `sorry` and no `native_decide`.

## 1. Lineage

Edition 1.0.0 stands beside this one, pinned to v3.0.12, with its own digest as `RH_Twin_Binder_One_Locus_v1_0_0_audit_digest.md`. That digest records cycle twinbinder309 (eight framework-blind rounds, 86 findings) and two targeted passes against v3.0.10 and v3.0.12 (13 and 8 findings). Every finding there was repaired, scoped or refused on the record.

## 2. Re-pin from v3.0.12 to v3.0.16

The paper was carried through v3.0.13 to v3.0.16. The material added was:

- the block theorem over ℂ, `no_closed_principle_decides`;
- the Pause and the forward pass, unconditional: `pause_is_unconditional`, `forward_pass_unconditional`;
- the look back and the retrospective seal: `look_back_is_the_closure`, `the_unconditional_retrospective_seal`, `rh_from_pause_and_look_back` (§7.4);
- the canonical apex: `CanonicalRH` (Definition 7.21), `canonical_rh_unconditional` and `canonical_property_holds_off_the_line` (Theorem 7.22), read at type as a property of the projection, true of the record of every configuration;
- the complex extensions at twenty-five conjuncts;
- the terminal block of v3.0.16, its canonical apex, Monism witness and terminal silence (Appendix A.3).

Mechanical receipts:

- **Theorem heads:** 60. They cite 123 identifiers, 119 theorems and 4 definitions. Every one is pinned, and every chip equals the compiler's pin.
- **Census:** 863 theorems, 356 definitions, 52 structures, 7 inductive types and 21 namespaces.
- **Pins:** 693, split 391 / 34 / 133 / 135. There are 952 `#print axioms` commands, 259 of them unguarded.
- **Listings:** 33, each taken verbatim from the deposited file at its master line numbers.

## 3. Two targeted framework-blind passes on the new and changed text

- **Pass 3, against v3.0.13:** 15 findings, 4 load-bearing, 4 structural and 7 cosmetic. All were repaired. Release-framing clauses that stated more than the types carry were reworded to the types.
- **Pass 4, against v3.0.16:** 14 findings, 2 load-bearing, 7 structural and 5 cosmetic. All were repaired, and the repairs were checked mechanically.
  - The canonical apex is stated as the file states it: a property of the projection that says nothing about where the zeros of ζ lie. The look back carries the question at the zeros. Reading `canonical_rh_unconditional` as the hypothesis is listed in the Reading Protocol as a misreading.
  - Appendix A.3 records that five of the six RH-concluding theorems run through the look back or an equivalent reading, and that `no_offline_refuter_seals_rh` reaches RH from provability hypotheses.

## 4. Two notes on the file's terminal block

- The block says five theorems conclude RH. The file carries six; the sixth is `no_offline_refuter_seals_rh`.
- The clause "for ZetaZeros it is therefore the 1-bit apex" has no declaration behind it in v3.0.16, since `RootReadTwice` is defined on Part III's discrete chart.

The paper reports both points as the block stands.

## 5. Build

- **Engine:** XeLaTeX, two passes.
- **Output:** 173 pages, no overfull line. The abstract fits page 1, the end-of-manuscript probe passes and the margin scan is clean.
- **PDF SHA-256:** `b9c021bfd174a569e3782101106284980021d9d332b3c03501a3f9a5ef7a135c`.
- **Markdown SHA-256:** `f0882728220883503ef981498cbd6da77ff11afeeef3778f935ee0d932c2f923`.
- **Source:** the LaTeX source stands beside the paper as `RH_Twin_Binder_One_Locus_v2_0_0_source.zip`, SHA-256 `daf102f00fc6a98607d7064c4d619d7e08d0ae8e169bf2505eb698598360b6de`.
