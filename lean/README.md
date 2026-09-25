# lean/ · the home of small Lean proofs

**Rule, set by the architect on 2026-09-24.** Every small, standalone Lean proof harvested from now on goes in this folder, at the repository root. They no longer go to `psp/`, as they used to for the Geometric Mother Codex. A file here is a single self-contained `.lean` source, compiled under core Lean 4.19.0 unless its header says otherwise (a Mathlib target is marked as such), with its `#print axioms` receipts at the foot. Codex cards and papers point to files here; they do not copy them.

Engines already filed under `protocols/` stay where they are; this rule governs new harvests.

## Files

| File | What it proves | Receipts |
|---|---|---|
| `RAM_ZFC_Placement.lean` | ZFC's location under RAM: rung ⊆ ladder ⊆ Ground (L3m ⊆ L2m ⊆ L1m) under Σ₁-completeness and openly carried soundness; soundness load-bearing; the Ground exceeds the ladder; independent axioms are separate bits. Subsumption by placement. | 5 sets, all axiom-free |
| `RA_to_ZFC_Chain.lean` | RA mapped to ZFC through the RA–RAM bridge: every act of using ZFC grounds RA; RA crosses as presence (keyless) into every world of ZFC; RA decides no keyed sentence, Choice over ZF the cited example. | 7 sets, all axiom-free |
| `ZFC_RA_RoundTrip.lean` | The round trip ZFC → RAM → Bridge → RA → Bridge → RAM → ZFC is the identity on content: every sentence returns unchanged, an absolute sentence such as RH with its same value, and the trip adds RA's presence only. | 4 sets, all axiom-free |
| `Massless_Arrow_Test.lean` | A zero-content arrow cannot separate a proposition from its negation: sound, it delivers nothing; the RA-shaped arrow delivers every proposition alike. | 4 sets, all axiom-free |
| `RH_Unicorn_Isomorphism.lean` | RH is exactly the statement that the off-line zeros are unicorns, a class of which every sentence is vacuously true; the class is empty exactly when no off-line zero can be exhibited. An equivalence, not a derivation of RH. | 4 sets, all axiom-free |
