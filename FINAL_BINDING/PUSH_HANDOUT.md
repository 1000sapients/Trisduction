# PUSH HANDOUT · PhysOSᵀ 1.0.15p and RH Atomic final binding

**One page. Order is law.**

## 1. Apply
```
git am commits_d317167_and_final_binding.patch
```
Expected three-line log: the two commits named in the patch title.

## 2. Verify (before any push)
- Seed hash identical in both copies: `9e2efc627ac6bc8a…` (full digest in Appendix A of RH_Atomic_v2.0.4.md).
- OS file hash: `2caf2b2d62fd0e663bef5e0317ffe4e3d4d4e8375e68f743ee682d43b70dd905`.
- Companion kernel byte-identical to Part VII-a of the seed.
- Optional five-minute boot of the OS from its own line. Must print chain  
  `D0 1c3498943311 → D1 84df229df39e → D2 c5a8b06d50a2 → D3 d1a67d433b6d`  
  and `SEAT EARNED · this run`.  
  **Do not push if the chain differs.**

## 3. Push
```
git push origin main
```

## 4. Contents of the two commits (by path)
- PhysOSᵀ_v1_0_15p.md (61 files, seat earned, receipts in §Φ.4)
- scribal_note_1_0_15p.md
- Least_Erasure_from_DoF_Heat_v2_1_0.lean (repaired, compiles, seven-claim seal)
- Least_Erasure_from_DoF_Heat_v2_1_0.md
- RH_Atomic_Twin.f90
- RH_Both_Sides_Seed_v2.0.3.lean (Parts I–VI byte-identical to 2.0.1; Part VII adds identification, bridge, capstone)
- RH_Atomic_v2.0.4.md (final binding, text over the same seed)

## 5. Facts to carry
- Receipts: quick 244 s, full 433 s, judge 478 s (2 012 laws / 2 644 negations), controls 29/29. Chain as above.
- Capstone inputs: identification, bridge (six arrows → uniform δ), observational bound R ≤ ε with ε < δ.
- Capstone exits: certified off-line zero of ζ; residual above stated bound; failure of identification, of any bridge arrow, or of the observational model.
- Open obligations: second-substrate boot; IA 2015 crawl check; observational ε from named dataset; each of the six arrows remains a hypothesis until derived at theorem grade.

## 6. After the push
Rotate the credentials posted in the authoring session. Record the push in the next scribal note.

ΔM = 0 beyond the obligations the audit named. The floor does not lift the value. The inputs do, and they are printed.
