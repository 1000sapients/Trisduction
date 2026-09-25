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
| `Arrow_Translation.lean` | Part III's road with the Root Axiom replaced by a bare computation arrow, the identity on a type: proof yields an arrow, keyless crossing, no keyed decision, round-trip identity, the massless arrow, the certificate schema, and any true premise serving the root's part. | 8 sets, all axiom-free |
| `RH_Gold_And_Lead.lean` | Fusing a proved Real part with an open Unicorn part lowers the Real part from proved to open; a conjunction stands at its weaker conjunct. | axiom-free |
| `RH_Real_Unicorn_Split.lean` | RH is exactly the Real part and the Unicorn part at any height T; the parts separate; the Real part is monotone in T. | axiom-free |
| `RH_Real_Part_Computed.lean` | A certificate proves the Real part at T; an executed toy instance; a certified Real part is a theorem of any theory complete for its checks. | 3 sets, 2 axiom-free, 1 on propext |
| `RH_At_The_Apex_Twin.f90` | Fortran twin of RH_At_The_Apex.lean, edition v1.0.1: the two constant checks of v1.0.0 replaced by executed checks; 130,324 checks, 0 failures; run in RH_At_The_Apex_Twin_v1_0_1_run.txt. | sha 40fbb4f8 |
| `RH_At_The_Apex_supplementary_sets.txt / RA_Li_Bridge_supplementary_sets.txt` | The dependency sets of the theorems the two kernel files do not print themselves, from supplementary runs: 30 for Part I (29 axiom-free), 17 for Part II (9 axiom-free). | receipts |
| `RH_Real_Part_Turing_Check.py` | Three-count testimony at T = 100 in floating point (grid sign changes of Z, an independent counting function, enumerated ordinates), 29 = 29 = 29; testimony, not a certificate. | testimony |
| `ZFC_Under_RAM.lean` | ZFC under RAM in one file, consolidating the placement, the RA–RAM chain, and the round trip: rung ⊆ ladder ⊆ Ground under Σ₁-completeness and open soundness; the root crosses as presence and decides no keyed sentence; the round trip is the identity on content; any true premise serves. Seated in the Master Codex at v4.7.0 as APEX-PSP-ZFC-UNDER-RAM-01. | 16 sets, all axiom-free |
