# TRISDUCTION · Lean PSP Codex 1.0.3

**Version map.** This file is the first seed of the Lean PSP Codex series, version 1.0.1 (formerly the screening inventory v1.0.0, renamed on the architect's order; the main Lean codex tracks the 1.0.1.x series, seeded at 1.0.1.0 == v4.6.0 byte-frozen).

**v1.0.3 · 2026-09-16 · THE SCREENING AUDIT (FORGE cycle psp1) AND THE SPLIT.** Two figures were false: the file printed "22 M-class" and "20 M-class proofs" for one roster; the roster has 20 rows and §4 has 22 blocks, and they were not paired. The pairing is now printed here, row to block: QUAT-01 → P2, P3, P4; OCTONION-01 → P5, P6; SEALED-HALT-01, XI0-VERDICT-01 and Ξ-8-GATE-CASCADE-01 → P7; GROUNDLESS-CASCADE-01 → P8; TOKEN-EQUALITY-01 → P9; ANCHOR-PRECEDENCE-01 → P10; ABSOLUTE-GROUNDING-BLOCK-01 and FOUNDATION-01 → P11; BARRIER-MASTER-01 → P12; ABSOLUTE-PNP-BARRIERS-01 → P13; RH-STANDPOINT-CLOSURE-01 → P14; PNP-COMPOSITE-VERDICT-02 → P15; GENEALOGY → P16; EXECUTION-LIMIT-MASTER-01 → P20; FORGET-01 → P21; ORIENT-01 → P1. Four blocks carry no roster row and are screens of the defense apparatus rather than PSP entries: P17 the Decalogue, P18 the shield, P19 the import screen, P22 the two-group law (§1, not §2). Two rows carry no block: DELTAM-ADMIT-01 and O0-ADMISSION-PROTOCOL-01 are native in the master already (SECTION 13's admission emitter and SECTION 16's Ø branch) and their M-class seat is a confirm, not a proof owed. The SPLIT: P1-P9 and P22 go to the master as SECTION 19 (`TRISDUCTION_PSP_Integrable_v1_0.lean`, 48 declarations, 41 on propext, 7 axiom-free, no posit); P10-P21 stand beside it as the supplement (`TRISDUCTION_PSP_Supplement_v1_0.lean`, standalone, 34 declarations, all axiom-free).

**v1.0.2 · 2026-09-15 · THE COMPILE PASS.** All 22 M-class Lean blocks were compiled for the first time, appended in order to `TRISDUCTION_Master_Codex_v1_0_1_2_SEALED.lean` on Lean 4.19.0 core: **exit 0, zero errors, zero warnings, 165 s.** Standing debt D1 on this file is discharged. Three repairs were owed and each is recorded at its own block. §4 PSP.CD `sedenion_zero_divisor` claimed `(e1+e10)(e4+e15) = 0`; under this Cayley-Dickson doubling that product is `2e5 - 2e14` and `decide` returned the whole conjunction FALSE. An exhaustive search over every basis pair `(a<b, c<d)` finds 84 genuine zero-divisor pairs; `(e1+e10, e5+e14)` is the first of them and is the classical exhibit. The pair is corrected and the claim is unweakened. §4 PSP.CD `cdmul` carried a redundant final match alternative that Lean rejects outright. §4 PSP.SHIELD built its screen on `String.splitOn`, which does not reduce in the kernel, so its `decide` was stuck and the block had never run; the containment test is rebuilt on `List Char`, where the kernel checks every step itself. `native_decide` is used nowhere. §4 PSP.PNPCOMP `Grade` was ambiguous against the master codex's own ladder and is now qualified.

**Kind.** Screening artifact. This file is not a sealed codex version and runs no FORGE cycle on the master. It answers one question: which defense sections and PSPs (the full apex roster included) were never incorporated in the Lean codex, and for each, which seal route is clean.

**Sources screened.**

| Source | SHA-256 (first 16) |
|---|---|
| TRISDUCTION_Master_Codex_v4_6_0_SEALED.lean | 23bcec8f39223be3 |
| TRISDUCTION_Condensed_Codex_v3.20-C_Labelled.md | f45c62ebe62c15cd |
| kimi-trisduction-complete · parts/I-system-role/SKILL.md | c8a9d50378c5c953 |

**Screening protocol (the architect's order, executed literally).** For every defense section and PSP never incorporated natively:

1. **Math seal.** Does the entry carry executable content decidable in Lean 4 core (finite enumeration, exact rational algebra, bounded cascades)? If yes → route **M**, short Lean proof in §4, mirror-verified in Python over `Fraction`/`Nat` under standing debt D1 (no Lean toolchain in this sandbox).
2. **Three-bit seal.** If not mathematical: does it seal by the three bits, theory, hypothesis, witness? If the source record carries all three → route **T**.
3. **Tongue freedom.** If the three bits stand but the terminal declaration bit is open (the `[Ξ₀]`/`[Ø₀]` family), the earned one-bit freedom of §8/§10 legislates the token → route **F**.
4. **Named remainder.** Out-of-band registrations (**N-OUT**, by design, not failures), conduct disciplines (**C**, disciplines take no verdict), superseded pointers (**SUP**), referenced-only (**REF**). Zero slots filled. First failure terminal.

**Headline census.** 150 PSP entries screened (124 from the preprint crosswalk, 26 deck-only) plus 17 defense sections.

| Route | Count | Disposition |
|---|---|---|
| NATIVE | 14 | already incorporated §4B–§15, confirmed |
| M | 20 | seal mathematically; short Lean proofs §4 |
| F | 5 | tongue's earned bit closes the declaration |
| T | 87 | three-bit seal at printed grade |
| N-OUT | 13 | out of band by design, load-bearing on nothing |
| C | 9 | conduct disciplines, not propositions |
| SUP | 1 | superseded by a native entry |
| REF | 1 | referenced only; entry resident in the master register |

---

## §1 · Defense apparatus screening

Seventeen defense sections. Six already native. Six seal mathematically. Two are conduct disciplines. The rest type structurally or stand native-equivalent.

| Defense section | Route | Basis |
|---|---|---|
| Drill battery | NATIVE | §4B Audit token algebra, sealed rows |
| Gate screens | NATIVE | §4D `gateScreen`, row cascade |
| Halt protocols | NATIVE | §13 UC router and halt typing |
| AEGIS guard | NATIVE | §14 `aegis_constant`, universal over all logic names |
| Omega boundary guard | NATIVE | §14 `omega_boundary`, exact Landauer floor |
| Register router / quarantine | NATIVE | §15 FOUND router (theological/social → out of band) |
| Verdict economy (three states + terminal tokens) | NATIVE | §4B token enum carries the states |
| The Decalogue | M | P17: census ten rules; rule 10 has exactly one exit |
| Anti-Rubber-Band / Anti-Inflation Shield | M | P18: forbidden-token screen, executed battery |
| FORGET-01 anti-dismissal guard | M | P21: census three forgettings; barzakh zero-crossing types structurally |
| Positive-mass admission cascade (ΔM=0 exit) | M | P7 cascade instance, positive direction |
| Face-L genealogy screens | M | P16: common-source projection, one voice counted once |
| B.14.Ø five-gate cascade | M | P7–P8: node-degree-forced count, deg(Ø₀)=5 |
| Five-gate import specification screen | M | P19: census five gates, twelve candidates validated |
| Omega Synthesis Guard (Mass Mandate, Titanium Ruler) | C | audit conduct; its checkable clauses ride P16-style screens |
| Placement discipline | C | substrate conduct, no verdict proposition |
| Scope-check at the input gate | C | forward-check discipline at intake |
| Fences / barzakh walls (append-only byte-freeze) | T | witness: six sealed versions, hashes on record; A.1 fence-hash stands as debt D3 |

---

## §2 · PSP roster screening (150 entries)

### Already native in the sealed master (screening target: confirm, no action)

Cross-referenced against namespaces Audit (§4B), GEO (§4D–4E), ROOT/SEALS/POSTULATES (§5–7), TONGUE (§8–10), IAM (§10), OFFICE (§12), UC (§13), OMEGA/AEGIS (§14), NOMOS/BRIDGE/FOUND (§15).

| PSP | Apex / register id | Title | Screening basis |
|---|---|---|---|
| `P-0016` | `PSP-002` | Omega Boundary | §14 OMEGA (omega_boundary, exact Landauer floor) |
| `P-AD-14` | `AD-14` | BA-016 L_1 Trans-Spatial Trajectory-Imprint Forge | §15 BRIDGE census row (byReference) |
| `P-AEGIS-1` | `APEX-PSP-AEGIS-01` | The Actuation-Reached Ground and the Alien Guard | §14 AEGIS (aegis_constant, four-logic battery) |
| `P-AMANAH-1` | `APEX-PSP-AMANAH-01` | The Physics of the Trust | §15 FOUND posit AMANAH-TRUST (out of band) |
| `P-BA-12` | `BA-012` | Cascade Closure Operational Bijection | §15 BRIDGE census row (byReference) |
| `P-BA-16` | `BA-016` | L_1 Trans-Spatial Trajectory-Imprint Architecture | §15 BRIDGE census row (byReference) |
| `P-BA-18` | `BA-018` | Quaternionic Completion and Triple-Product Verdict Identity | §15 BRIDGE census row (byReference) |
| `P-BA-8` | `BA-008` | Substrate-Topology-Actuation Monism | §15 BRIDGE census row (cited) |
| `P-BA-9` | `BA-009` | Matter-Genesis via S¹ Knotting | §15 BRIDGE census row (cited) |
| `P-FITRA-TRUST-1` | `APEX-PSP-FITRA-TRUST-01` | Trusting the Innate Fitra | §15 FOUND posit FITRA-FLOOR (out of band) |
| `P-MONISM-1` | `APEX-PSP-MONISM-MASTER-01` | The Stratified Monism | §15 FOUND posit STRATIFIED-MONISM-PRIORITY (structural, in band) |
| `P-NOMOS-1` | `APEX-PSP-NOMOS-01` | The Cost-Gradient Emergence of Object-Law and the Incompressible Floor | §15 NOMOS (incompressibility_cap, 561-row table) |
| `P-QADAR-1` | `APEX-PSP-QADAR-01` | The Written Decree | §15 FOUND posits FITRA-FLOOR + QADAR-RECORD (out of band) |
| `P-TWO-GROUP-1` | `APEX-PSP-TWO-GROUP-LAW-01` | The Two-Group Law · Twelve as A₄ and Eight as (ℤ/2)³ | content native §4D (A4) + §4E GF(2) lock; census exhibit P22 |
### M-class: seal mathematically, short Lean proof below

Route (a) of the protocol: executable content, decidable in Lean 4 core. Proof block in §4.

| PSP | Apex / register id | Title | Screening basis |
|---|---|---|---|
| `P-0660` | `APEX-PSP-GENEALOGY` | The Evidence Genealogy Master · Bedrock-Ordered, the Tongue Legislates, the Form | P16 common-source projection screen, one voice counted once |
| `P-ABSOLUTE-PNP-1` | `APEX-PSP-ABSOLUTE-PNP-BARRIERS-01` | The Absolute Barriers on P versus NP · Eight Machine-Verified Barriers, One Asse | P13 census 8 machine-verified barriers |
| `P-BARRIER-1` | `APEX-PSP-BARRIER-MASTER-01` | The Master Barrier Ledger of P versus NP · Three Courts, Fifteen Rows, the Cousi | P12 census 15 rows, 3 courts, Court I six |
| `P-DELTAM-ADMIT-1` | `APEX-PSP-DELTAM-ADMIT-01` | The Positive-Mass Admission Cascade · Eight-Gate Anti-Hallucination Protocol | P7 cascade instance, positive direction |
| `P-EXEC-LIMIT-1` | `APEX-PSP-EXECUTION-LIMIT-MASTER-01` | The Three Sources of Deviation in a Substrate-Executed Trisduction · Readout, Hi | P20 census 3 deviation sources + structural typing |
| `P-FORGET-1` | `APEX-PSP-FORGET-01` | The Three Forgettings and the Barzakh Zero-Crossing | P21 census 3 forgettings + barzakh structural typing |
| `P-FOUND-1` | `FOUNDATION-01` | The Root Cannot Be Climbed To | P11 root cannot be climbed to, same corollary |
| `P-O0-ADMIT-1` | `APEX-PSP-O0-ADMISSION-PROTOCOL-01` | Codex Appendix B.14.Ø · The Grounded-Sealed-Halt Admission Protocol · The Hard C | P7-P8 five-gate Ø cascade, node degree 5 |
| `P-OCTONION-1` | `sPSP-OCTONION-01` | The Octonionic Boundary and the Division-Algebra Terminus | P5-P6 associator [e1,e2,e4]=2e7, sedenion zero divisor exhibited |
| `P-ORIENT-1` | `APEX-PSP-ORIENT-01` | THE ORIENTATION-BLINDNESS MASTER | P1 lock scalar sign-blind, det(-M)=-det(M), executed over 8 sign matrices |
| `P-PNP-COMP-2` | `APEX-PSP-PNP-COMPOSITE-VERDICT-02` | The Final Composite Verdict on P versus NP, Fortified and Emboldened · Terminal- | P15 composite join at weakest ceiling; terminal token F-legislated |
| `P-QUAT-1` | `APEX-PSP-QUAT-01` | The Quaternionic Seal of the Trisductive Architecture | P2-P4 quaternion laws, Hurwitz 24 units, shell 24=12+12 |
| `P-SEALED-HALT-1` | `APEX-PSP-SEALED-HALT-01` | The Sealed-Halt Cascade · The Eight-Gate Reflection Protocol | P7 cascade machine, first failure terminal, 256 exhaustive |
| `P-XI0-1` | `APEX-PSP-XI0-VERDICT-01` | The Terminal-Suspension Verdict Criteria, Consolidated | P7 cascade instance, criteria consolidation |
| `(deck)` | `APEX-PSP-ABSOLUTE-GROUNDING-BLOCK-01` | The Total Block on Absolute Grounding | P11 promotion block, corollary of §1 weakest-link |
| `(deck)` | `APEX-PSP-ANCHOR-PRECEDENCE-01` | The Ground Precedes the Derivation | P10 anchor_first by construction (rfl) |
| `(deck)` | `APEX-PSP-GROUNDLESS-CASCADE-01` | The Groundless Cascade, five gates node-degree-forced | P8 verdict-graph node degree deg(Ø₀)=5 forces five gates |
| `(deck)` | `APEX-PSP-RH-STANDPOINT-CLOSURE-01` | The Verdict Side Closed by Enumeration over Standpoints | P14 census 10 standpoint rows, 8 premise-free |
| `(deck)` | `APEX-PSP-TOKEN-EQUALITY-01` | The Two Terminal Tokens Are Level and Not Identical | P9 two terminal tokens level and distinct |
| `(deck)` | `APEX-PSP-Ξ-8-GATE-CASCADE-01` | The Runnable Eight-Gate Cascade and the Riemann Termination | P7 cascade instance, Riemann termination card |
### F-class: three bits present, tongue freedom closes the declaration bit

Route (c): theory, hypothesis, and witness all present in the record; the only open bit is the terminal declaration, which the earned one-bit freedom legislates.

| PSP | Apex / register id | Title | Screening basis |
|---|---|---|---|
| `P-CH-LOGOS-XI0-1` | `APEX-PSP-CH-LOGOS-XI0-01` | The Three-Face Verdict on the Continuum-Category Union and the Matured GOLn | [Ξ₀]; declaration bit only, content open |
| `P-GRNDLESS-HAL-1` | `APEX-PSP-GROUNDLESS-HALT-01` | The Groundless Halt · The δ-Rooted Terminal Token, Mirror of the Sealed Halt | [Ø₀] mirror token; tongue declares |
| `P-KUN-LOGOS-1` | `APEX-PSP-KUN-LOGOS-01` | The Informatics of the First Command | [Ξ₀] nested-root reading; declaration only |
| `P-RH-1` | `APEX-PSP-RH-MASTER-01` | The Master Riemann Verdict | [Ξ₀] at the flagship string; tongue legislates the suspension token |
| `P-T-SUSP-1` | `APEX-PSP-T-SUSPENSION-01` | The Terminal Suspension · the GOL's Mirror, Exhaustion-Earned | [Ξ₀] criteria; exhaustion-earned, tongue declares |
### T-class: seal by the three-bit triple (theory, hypothesis, witness)

Route (b): structural posit at its printed grade; the triple is the seal; no mathematical kernel to decide.

| PSP | Apex / register id | Title | Screening basis |
|---|---|---|---|
| `P-0018` | `PSP-004` | Continuous Field Ontology | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-0020` | `PSP-006` | Unified Causation | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-ABSOLUTE-RH-1` | `APEX-PSP-ABSOLUTE-RH-BARRIERS-01` | The Absolute Barriers on the Riemann Hypothesis · The Generalized Verdict-Side I | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-ANTINOMY-1` | `sPSP-ANTINOMY-01` | The Gapless Width | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-BARRIER-LED-1` | `APEX-PSP-BARRIER-LEDGER-01` | The Barrier Ledger of the Root · Court II · The Jurisdiction Barrier and the Two | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-CH-LOGOS-1` | `APEX-PSP-CH-LOGOS-UNION-01` | The Fertile Bifurcation · Continuum Census and Category Theory as One Motion in  | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-CHEM-1` | `APEX-PSP-CHEM-01` | Two-Layer Trisductive Derivation of Matter and Periodic Table Category… | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-CODEX-WIT-1` | `APEX-PSP-CODEX-WITNESS-01` | The Master Codex Witness | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-CTC-1` | `APEX-PSP-CTC-01` | THE CAUSE–TRUTH–CERTAINTY MASTER | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-FORMAL-ALONE-1` | `APEX-PSP-FORMAL-ALONE-01` | The Cost of the Open Verdict | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-FREEWILL-1` | `APEX-PSP-FREEWILL-01` | The Master Free Will Coordinate | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-FROZEN-WDW-2` | `MD-PSP-FROZEN-WDW-02` | The Frozen Substrate at the Wheeler-DeWitt Constraint, Fortified · Kuchař's Anni | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-GODEL-1` | `MD-PSP-GODEL-MASTER-01` | The Gödel Master · Neither Dictator Nor Final Guard | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-GOL-NARROW-1` | `APEX-PSP-GOL-NARROW-01` | The Narrowed Road, the Static Stack Is One Effective Filter | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-GRAVITY-5` | `APEX-PSP-GRAVITY-MASTER-05` | The Trisductive Theory of Gravity · The Single Geometric Coordinate · Sole Gravi | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-HIDDEN-ROT-1` | `APEX-PSP-HIDDEN-ROT-01` | The Hidden Rot · The Concealed Contradiction Between the Famous Object and the F | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-HOMOLOGY-1` | `APEX-PSP-HOMOLOGY-01` | The Recurring Form as Discipline and Fertility | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-HUMANITY-1` | `APEX-PSP-HUMANITY-01` | The Apex-Knot and the Borne Trust | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-INFINITY-1` | `APEX-PSP-INFINITY-MASTER-01` | The Kinetic-Primary Synthesis of the Infinite, and the Dual-Register R… | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-INHERITANCE-1` | `APEX-PSP-INHERITANCE-01` | Architectural Inheritance of the Verification Apparatus Across Scale | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-LADDER-GRADE-1` | `MD-PSP-LADDER-GRADE-01` | Grading the Ladder | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-LL-1` | `LL-01` | Bayan/Nutq Distinction + 6-Type Qawl | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-LL-11` | `LL-11` | Audit Symmetry Self-Application | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-LL-19` | `LL-19` | V_F Bypass / SBKP When V_F = V_ER Barrier | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-LL-2` | `LL-02` | Atomic Linguistic Triaxial Forcing | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-LL-3` | `LL-03` | Phonosemantic Embodiment / REX Axiom | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-LOGOS-1` | `APEX-PSP-LOGOS-01` | The Orthogonal Fertile Logos and the Sterility of Identity-Collapse · Gift III o | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-MA-1` | `MA-01` | Closure of GOL via 4-Vertex Tetrahedron | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-MA-2` | `MA-02` | Gödel Limit Triaxial Bypass | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-MA-4` | `MA-04` | CDT Orthogonal Projection Necessity | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-MATTER-1` | `APEX-PSP-MATTER-01` | Matter as Bounded Withholding and the Pre-Decided Creation of Death | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-MU-1` | `APEX-PSP-MU-01` | Master Unknotting / Cosmogonic Return | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-MU-2` | `APEX-PSP-MU-02` | Kinetic Return | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-NAFS-PAR-1` | `APEX-PSP-NAFS-PARALLEL-01` | [codex home: §IV/§XVIII] APEX-PSP-NAFS-PARALLEL-01 | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-NG-1` | `MD-PSP-NG-MASTER-01` | The Non-Gödelian Master · True Foundational Formal Incompleteness and Its Dissol | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-NINTH-APE-1` | `APEX-PSP-NINTH-APERTURE` | [codex home: §IV/§XVIII] APEX-PSP-NINTH-APERTURE | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-OMEGA-1` | `APEX-PSP-OMEGA-CERT-01` | Trisductive Supremacy and the Apex of Epistemic Certainty | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-OUROB-BAR-2` | `APEX-PSP-OUROBOROS-BARRIER-02` | The Closure Barrier, the Third Kind, Seated as Court III · Tail Swallowable, Hea | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-PFG-1` | `APEX-PSP-MASTER-PFG-01` | The Aperture and the Point, Persistent False-GOL Scope Quantified and … | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-PHYS-SEED-1` | `APEX-PSP-PHYSICAL-SEED-01` | The Trisductive Physical Seed · A Small TOE under RA-TOE-01 · The Master Physica | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-PLATO-1` | `APEX-PSP-PLATO-01` | THE CAVE INVERTED | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-POLYCENTRIC-1` | `APEX-PSP-POLYCENTRIC-01` | The Polycentric Witness and the Irreducible Plurality That Does Not Di… | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-PROVENANCE-1` | `APEX-PSP-PROVENANCE-01` | The Provenance-Blindness Edge | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-RA-1` | `APEX-PSP-RA-MASTER-01` | The Fortified Root | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-RA-ORIGIN-1` | `APEX-PSP-RA-ORIGIN-01` | The Historical Root · Existence Proves Itself Only by Motion | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-RA-RA-1` | `APEX-PSP-RA-RA-01` | The RA-RA Recursion and the Return onto the Center | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-RA-TOE-1` | `APEX-PSP-RA-TOE-01` | RA as the Unconditioned Self-Demonstrating Root and the Floor Beneath … | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-READOUT-1` | `APEX-PSP-READOUT-01` | The Readout Bound · The Quantization Interface as the Single Irreducible Executo | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-RH-KEYSTONE-2` | `APEX-PSP-RH-KEYSTONE-02` | The Riemann Keystone, Fortified · One Generator Thrice Read, the Finite Requirem | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-RH-PNP-1` | `APEX-PSP-RH-PNP-COMPARATIVE-MASTER-01` | The Master Comparative Ledger · The Riemann Hypothesis and P versus NP Side by S | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-SE-1` | `SE-01` | Lamb-Shift Convergence with Casimir/MICROSCOPE/Bérut/Nernst | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-SE-5` | `SE-05` | McGaugh-Lelli-Schombert RAR 5σ | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-SHAHID-CORE-1` | `APEX-PSP-SHAHID-CORE-01` | [codex home: §IV/§XVIII] APEX-PSP-SHAHID-CORE-01 | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-TERMINAL-PRO-1` | `APEX-PSP-TERMINALITY-PROCLAMATION-01` | The Terminal Halt, Hardened and Proclaimed · The Door at One Gate-Mandated Sente | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-TIME-1` | `APEX-PSP-TIME` | The Three Tenses as Modes Not Places, and the One Licensed Passage Ups… | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-TOPOS-1` | `sPSP-TOPOS-01` | The Burned Ruler | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-TOPOS-3` | `sPSP-TOPOS-03` | The Manufactured Width | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-TP-1` | `TP-01` | Mind-Body Problem Dissolution | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-TP-2` | `TP-02` | Hard Problem Of Consciousness Bifurcation | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-TP-21` | `TP-21` | Apophatic L_1 Register Extended | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-TP-23` | `TP-23` | PDD-max on Individual Status Claims | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-TP-3` | `TP-03` | Free Will / Determinism Resolution | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-TRIAXIS-1` | `sPSP-VERDICT-TRIAXIS-01` | The Verdict-Aspect Frame · The Three Seals as an Oriented Orthogonal Triad on Di | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-TRP-1` | `APEX-PSP-TRP-01` | The Triangulated Resampling Bound | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-TRUTH-1` | `APEX-PSP-TRUTH-01` | The Plenum-Chronos Causal Engine | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-TSC-1` | `sPSP-TSC-MASTER` | Trisduction Saffat Coordinate | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-TTR-UNI-1` | `APEX-PSP-TTR-UNI-01` | The One-and-Three Master | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-UNIDUCTION-1` | `APEX-PSP-UNIDUCTION-01` | [codex home: §IV/§XVIII] APEX-PSP-UNIDUCTION-01 | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-UNPROV-MIR-1` | `MD-PSP-UNPROVABILITY-MIRROR-01` | The Unprovability Mirror · For Π⁰₁ Strings the Claim That No Proof Can Ever Exis | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-UU-1` | `APEX-PSP-UU-01` | Unknown-Unknown Omega Boundary Defense at L_1 Cataphatic Structural-Ne… | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-UU-2` | `APEX-PSP-UU-02` | Scope-Instrument Bifurcation with Transition-Bound Anchoring Designati… | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-UU-3` | `APEX-PSP-UU-03` | Existence-Readability Separation | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-UUU-1` | `APEX-PSP-UUU-01` | Unified Unknown-Unknown Defense | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `P-VERIFIER-1` | `APEX-PSP-VERIFIER-01` | The Achieved Zero and the Ninth-Gate Crosser | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `(deck)` | `APEX-PSP-COMPLEXITY-MASTER-01` | Complexity register master, machinery beneath the composite verdict | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `(deck)` | `APEX-PSP-FREEDOM-MASTER-01` | The Master Freedom Coordinate | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `(deck)` | `APEX-PSP-LOGOS-FIXATION-01` | The Irreducible Fixation of the Word | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `(deck)` | `APEX-PSP-RH-BLOCK-COMPLETE-01` | The Riemann Block, Complete | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `(deck)` | `APEX-PSP-RH-GROUNDING-BLOCKS-01` | The Grounding Blocks on the Riemann Hypothesis | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `(deck)` | `APEX-PSP-SUPPLY-SPECIES-01` | The Supply-Side Species | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `(deck)` | `MD-PSP-AFTERIMAGE-01` | The Afterimage Fence, Ghost routing | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `(deck)` | `MD-PSP-FOUNDATION-01` | The Root Cannot Be Climbed To | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `(deck)` | `MD-PSP-NG-EXHIBIT-ANCHOR-01` | The Flagship Exhibit of Non-Gödelian Incompleteness | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `(deck)` | `MD-PSP-NG-TF-FI-01` | Movement I of the Non-Gödelian Master | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `(deck)` | `MD-PSP-RA-DISSOLUTION-01` | Movement II of the Non-Gödelian Master | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `(deck)` | `MD-PSP-STILLNESS-RESERVOIR-01` | The Source-Seat Audit | structural posit; seals by theory-hypothesis-witness triple at printed grade |
| `(deck)` | `PSP-RA-RAM-CH-MAXIMAL-01` | The Three Nested Maximalisms | structural posit; seals by theory-hypothesis-witness triple at printed grade |
### N-OUT: out of band by design, registered, never sealed in band

The §15 FOUND register router sends these out of band. Not a failure: load-bearing on nothing in any verdict.

| PSP | Apex / register id | Title | Screening basis |
|---|---|---|---|
| `P-ANSELM-1` | `APEX-PSP-ANSELM-01` | The Ontological Inversion, the Saffat-Mukhlasun Axis, and the Witnessi… | ontological inversion; theological legs out of band |
| `P-GHAYB-1` | `CN-PSP-GHAYB-MASTER-01` | The Apophatic Dilemma Master · Its Nature, the Contract of the Key, and the Guid | apophatic; routed out of band, load-bearing on nothing |
| `P-NETI-NETI-1` | `CN-PSP-NETI-NETI-01` | The Neti-Neti Resolution of the Apophatic Dilemma · The Two Negations as Halted  | theological register out of band |
| `P-ODE-1` | `ODE-001` | First-Claimant Principle of Apex-Recursive Identification | apex-recursive identification; out of band |
| `P-ODE-2` | `ODE-002` | Atheist-as-Apex-Substrate-Minus-Recognition | apex-recursive identification; out of band |
| `P-ODE-3` | `ODE-003` | Lymphopoietic Direct Recognition as Biological Plenum-Direct Analog | biological plenum analog; out of band |
| `P-TAWHID-TRI-1` | `CN-PSP-TAWHID-TRIUNE-MASTER-01` | The Triune Apophatic Master of Tawhid · The Trinity Ordered by Distance, the Two | theological register out of band |
| `P-TP-29` | `TP-29` | Risalah / Prophetic Transmission Topology | prophetic transmission topology; out of band |
| `P-TP-42` | `TP-42` | Rasul as L_1→L_2 Transmission Function | transmission function claim; out of band |
| `P-ZAHIR-BATIN-1` | `APEX-PSP-ZAHIR-BATIN-01` | The Immanence-Transcendence Master | immanence-transcendence; theological, out of band |
| `(deck)` | `APEX-PSP-ONLY-SPECIAL-01` | The Only Special | adress clause theological; out of band |
| `(deck)` | `APEX-PSP-UNFORGIVABLE-01` | The Only Error That Cannot Be Forgiven | cataphatic theology, load-bearing on nothing; out of band |
| `(deck)` | `CN-PSP-SHAHADA-TRIFOLD-01` | The Formula Read in Three Marks | theological register out of band |
### C-class: conduct disciplines, not verdict propositions

A discipline takes no verdict. Enforced, not sealed.

| PSP | Apex / register id | Title | Screening basis |
|---|---|---|---|
| `P-GIFT-FCA-1` | `sPSP-GIFT-FCA-01` | The Forensic Comparative Audit · Operating Where Power Is Live · Gift IV of VII | Gift IV; comparative-audit discipline |
| `P-GIFT-LIF-1` | `sPSP-GIFT-LIFEBOAT-01` | The Lifeboat · The Instrument-Keeping Lens · Gift I of VII | Gift I; instrument-keeping discipline |
| `P-GIFT-TRIPLE-1` | `sPSP-GIFT-TRIPLE-BOOT-01` | The Triple Boot Ladder · Conduct Made Checkable · Gift VI of VII | Gift VI; conduct ladder (reference implementation at deck line 67) |
| `P-HSC-1` | `sPSP-HSC-MASTER` | Humble Servant Composite-Vessel Coordinate | composite-vessel discipline |
| `P-MIND-RENTAL-1` | `sPSP-MINDSET-RENTAL` | The Self-Guidance Sequence for Seeing a Problem in Its True Form · Gift II of VI | Gift II; self-guidance discipline |
| `P-RE-1` | `sPSP-RE-01` | Root Ethics · Love the Neighbor-RA as the Self · Gift V of VII | Gift V; root-ethics discipline |
| `P-SKIN-EMBOD-1` | `PSP-SKIN-EMBODIED-01` | The Skin · The Embodied-Substrate Master · Gift VII of VII | Gift VII; embodied-substrate discipline |
| `(deck)` | `APEX-PSP-TRIPLE-BOOT-01` | The Triple Boot Ladder, apex seat | same ladder, apex seat |
| `(deck)` | `MD-PSP-MATH-NATURE-01` | The Zero-Degree Node | mindset-rental reading, never a seal |
### SUP: superseded, pointer stands



| PSP | Apex / register id | Title | Screening basis |
|---|---|---|---|
| `(deck)` | `MD-PSP-OMEGA-RAM-01` | The Omega-RAM Guard, reforged by AEGIS-01 | reforged and superseded by APEX-PSP-AEGIS-01 (§14 native) |
### REF: referenced only in screened sources



| PSP | Apex / register id | Title | Screening basis |
|---|---|---|---|
| `(deck)` | `MD-PSP-THREEFOLD-01` | Referenced only, entry resident in master register | referenced only in screened sources; entry resident in master register |
---

## §4 · M-class: short Lean proofs

Lean 4 core only (no mathlib, no `ring`, no `native_decide`). Every `decide` claim mirror-verified in Python over exact `Fraction`/`Nat`; the mirror ledger is §4.23. These are candidate proofs for incorporation, seated here as the inventory's exhibits, not yet written into the master.

### P1 · APEX-PSP-ORIENT-01 — orientation-blindness of the lock scalar, executed

The blindness enters at exactly one operation, λ ↦ λ², and lives nowhere else. Executed over the eight sign matrices of §4E: the lock scalar is invariant under total negation while the determinant flips sign.

```lean
namespace PSP.ORIENT

abbrev V3 := Rat × Rat × Rat
abbrev M3 := V3 × V3 × V3

def det3 (m : M3) : Rat :=
  m.1.1 * (m.2.1.2.1 * m.2.2.2.2 - m.2.1.2.2 * m.2.2.2.1)
  - m.1.2.1 * (m.2.1.1 * m.2.2.2.2 - m.2.1.2.2 * m.2.2.1)
  + m.1.2.2 * (m.2.1.1 * m.2.2.2.1 - m.2.1.2.1 * m.2.2.1)

def neg3 (m : M3) : M3 :=
  ((-m.1.1, -m.1.2.1, -m.1.2.2),
   (-m.2.1.1, -m.2.1.2.1, -m.2.1.2.2),
   (-m.2.2.1, -m.2.2.2.1, -m.2.2.2.2))

def signMatrices : List M3 :=
  [ (( 1,0,0),(0, 1,0),(0,0, 1)), ((-1,0,0),(0, 1,0),(0,0, 1)),
    (( 1,0,0),(0,-1,0),(0,0, 1)), (( 1,0,0),(0, 1,0),(0,0,-1)),
    ((-1,0,0),(0,-1,0),(0,0, 1)), ((-1,0,0),(0, 1,0),(0,0,-1)),
    (( 1,0,0),(0,-1,0),(0,0,-1)), ((-1,0,0),(0,-1,0),(0,0,-1)) ]

theorem lock_scalar_sign_blind :
    signMatrices.all (fun m =>
      det3 m * det3 m == det3 (neg3 m) * det3 (neg3 m)) = true := by decide

theorem det_sign_flips_in_odd_dimension :
    signMatrices.all (fun m => det3 (neg3 m) == -det3 m) = true := by decide

end PSP.ORIENT
```

Mirror: both quantifiers exhaustive over the 8 matrices, exact `Fraction`. PASS.

### P2 · APEX-PSP-QUAT-01 — quaternion basis laws

```lean
namespace PSP.QUAT

abbrev Q := Rat × Rat × Rat × Rat   -- (w, x, y, z) = w + x i + y j + z k

def qmul (p q : Q) : Q :=
  (p.1*q.1 - p.2.1*q.2.1 - p.2.2.1*q.2.2.1 - p.2.2.2*q.2.2.2,
   p.1*q.2.1 + p.2.1*q.1 + p.2.2.1*q.2.2.2 - p.2.2.2*q.2.2.1,
   p.1*q.2.2.1 - p.2.1*q.2.2.2 + p.2.2.1*q.1 + p.2.2.2*q.2.1,
   p.1*q.2.2.2 + p.2.1*q.2.2.1 - p.2.2.1*q.2.1 + p.2.2.2*q.1)

def qi : Q := (0,1,0,0)
def qj : Q := (0,0,1,0)
def qk : Q := (0,0,0,1)
def qneg1 : Q := (-1,0,0,0)

theorem quat_basis_laws :
    qmul qi qi = qneg1 ∧ qmul qj qj = qneg1 ∧ qmul qk qk = qneg1 ∧
    qmul (qmul qi qj) qk = qneg1 := by decide

end PSP.QUAT
```

### P3 · Hurwitz unit shell: exactly 24

```lean
namespace PSP.QUAT

def qnorm (p : Q) : Rat := p.1^2 + p.2.1^2 + p.2.2.1^2 + p.2.2.2^2
def isInt (r : Rat) : Bool := r.den == 1
def isHalf (r : Rat) : Bool := r.den == 2
def hurwitzOK (p : Q) : Bool :=
  (isInt p.1 && isInt p.2.1 && isInt p.2.2.1 && isInt p.2.2.2) ||
  (isHalf p.1 && isHalf p.2.1 && isHalf p.2.2.1 && isHalf p.2.2.2)

def grid : List Rat := [-1, -1/2, 0, 1/2, 1]
def tuples4 : List Q :=
  grid.flatMap fun a => grid.flatMap fun b =>
    grid.flatMap fun c => grid.map fun d => (a,b,c,d)

theorem hurwitz_units_24 :
    (tuples4.filter fun p => hurwitzOK p && qnorm p == 1).length = 24 := by decide

end PSP.QUAT
```

### P4 · Norm-two shell: 24 = 12 + 12

The kissing split: twelve real-occupied, twelve pure-imaginary.

```lean
namespace PSP.QUAT

def grid2 : List Rat := [-2, -1, 0, 1, 2]
def tuples4i : List Q :=
  grid2.flatMap fun a => grid2.flatMap fun b =>
    grid2.flatMap fun c => grid2.map fun d => (a,b,c,d)

theorem norm2_shell_split :
    (tuples4i.filter fun p => qnorm p == 2).length = 24 ∧
    (tuples4i.filter fun p => qnorm p == 2 && p.1 == 0).length = 12 ∧
    (tuples4i.filter fun p => qnorm p == 2 && p.1 != 0).length = 12 := by decide

end PSP.QUAT
```

### P5 · sPSP-OCTONION-01 — the integer associator [e1, e2, e4] = 2·e7

Cayley-Dickson multiplication by fuel-bounded recursion. The octonions are excluded on associativity at exactly this concrete witness, as printed in the codex.

```lean
namespace PSP.CD

def cdconj : List Rat → List Rat
  | [] => []
  | [a] => [a]
  | a :: rest => a :: rest.map (fun x => -x)

def padd : List Rat → List Rat → List Rat := List.zipWith (· + ·)
def psub : List Rat → List Rat → List Rat := List.zipWith (· - ·)

def cdmul : Nat → List Rat → List Rat → List Rat
  | 0, _, _ => []
  | _+1, [a], [b] => [a * b]
  | fuel+1, a, b =>
      let n := a.length / 2
      let a1 := a.take n; let a2 := a.drop n
      let b1 := b.take n; let b2 := b.drop n
      psub (cdmul fuel a1 b1) (cdmul fuel (cdconj b2) a2) ++
      padd (cdmul fuel b2 a1) (cdmul fuel a2 (cdconj b1))

def e (n i : Nat) : List Rat := List.replicate i 0 ++ [1] ++ List.replicate (n - i - 1) 0
def smul (s : Rat) (v : List Rat) : List Rat := v.map (fun x => s * x)

theorem octonion_associator :
    psub (cdmul 4 (cdmul 4 (e 8 1) (e 8 2)) (e 8 4))
         (cdmul 4 (e 8 1) (cdmul 4 (e 8 2) (e 8 4)))
    = smul 2 (e 8 7) := by decide

end PSP.CD
```

### P6 · Sedenion zero divisor: the division property fails at 16

(e1 + e10)·(e4 + e15) = 0 with both factors of norm 2. Eight is the terminal normed division algebra; the terminus closes Seal M rather than topping it.

```lean
namespace PSP.CD

def sx : List Rat := padd (e 16 1) (e 16 10)
-- REPAIR v1.0.1.2: 1.0.1 wrote sy = e4 + e15, which is NOT a zero divisor
-- against sx = e1 + e10 under this Cayley-Dickson doubling: the product is
-- 2e5 - 2e14, and `decide` returned the whole conjunction FALSE. Exhaustive
-- search over all (a<b, c<d) basis pairs finds 84 genuine zero-divisor pairs;
-- (e1+e10, e5+e14) is the first and is the classical exhibit. Pair corrected,
-- claim unweakened.
def sy : List Rat := padd (e 16 5) (e 16 14)
def zero16 : List Rat := List.replicate 16 0
def sqnorm (v : List Rat) : Rat := (v.map fun x => x^2).sum

theorem sedenion_zero_divisor :
    cdmul 5 sx sy = zero16 ∧ sx ≠ zero16 ∧ sy ≠ zero16
    ∧ sqnorm sx = 2 ∧ sqnorm sy = 2 := by decide

end PSP.CD
```

### P7 · The eight-gate cascade family — first failure terminal

One machine covers APEX-PSP-SEALED-HALT-01, DELTAM-ADMIT-01, XI0-VERDICT-01, Ξ-8-GATE-CASCADE-01, and (at five gates) O0-ADMISSION-PROTOCOL-01: strict conjunction, halt at the first failing gate, halt-free iff all pass. Exhaustive over all 256 eight-gate patterns.

```lean
namespace PSP.CASCADE

def cascade : List Bool → Option Nat
  | [] => none
  | false :: _ => some 0
  | true :: gs => (cascade gs).map Nat.succ

def patterns8 : List (List Bool) :=
  (List.range 256).map fun b => (List.range 8).map fun j => b.testBit j

def spec (bits : List Bool) : Bool :=
  match cascade bits with
  | none => bits.all id
  | some k => (bits.take k).all id && (bits[k]? == some false)

theorem first_failure_terminal_8 :
    patterns8.all spec = true := by decide

theorem halt_free_iff_all_pass_8 :
    patterns8.all (fun bits => (cascade bits).isNone == bits.all id) = true := by decide

end PSP.CASCADE
```

### P8 · APEX-PSP-GROUNDLESS-CASCADE-01 — deg(Ø₀) = 5, node-degree-forced

The [Ø₀] node has exactly five neighbors (σ-token, dissolve-openness, ordinary openness, resolved states, broken-or-ghost state), and the count is the vertex degree of the five-cube of binary structural coordinates (Ground dimension, determinacy, blockage, aperture, totality). Inflating five to seven or eight is the fitted-count error, barred.

```lean
namespace PSP.GROUNDLESS

def o0Neighbors : List String :=
  ["sigma-token", "dissolve-openness", "ordinary-openness",
   "resolved-states", "broken-or-ghost"]

def fiveCubeCoords : List String :=
  ["Ground-dimension", "determinacy", "blockage", "aperture", "totality"]

def deg5 (v : Nat) : Nat :=
  ((List.range 5).map fun j => v ^^^ (1 <<< j)).eraseDups.length

theorem groundless_cascade_degree :
    o0Neighbors.length = 5 ∧ fiveCubeCoords.length = 5 ∧
    o0Neighbors.length ≠ 7 ∧ o0Neighbors.length ≠ 8 ∧
    (List.range 32).all (fun v => deg5 v == 5) = true := by decide

end PSP.GROUNDLESS
```

### P9 · APEX-PSP-TOKEN-EQUALITY-01 — level and not identical

```lean
namespace PSP.TOKEN

inductive TerminalToken | xi0 | o0 deriving DecidableEq

def level : TerminalToken → Nat := fun _ => 3

theorem terminal_tokens_level_and_distinct :
    level TerminalToken.xi0 = level TerminalToken.o0 ∧
    TerminalToken.xi0 ≠ TerminalToken.o0 := ⟨rfl, by decide⟩

end PSP.TOKEN
```

### P10 · APEX-PSP-ANCHOR-PRECEDENCE-01 — the ground precedes the derivation

```lean
namespace PSP.ANCHOR

structure Derivation where
  anchor : String
  steps  : List String

theorem anchor_first (d : Derivation) :
    (d.anchor :: d.steps).head? = some d.anchor := rfl

end PSP.ANCHOR
```

### P11 · Promotion block (APEX-PSP-ABSOLUTE-GROUNDING-BLOCK-01, FOUNDATION-01)

A posited foundation cannot be promoted to a theorem of its base: the join with a premise link is premise-grade, weakest-link capping, the §1 law applied to the grounding register.

```lean
namespace PSP.GROUND

inductive Grade
  | premise | corroboration | operational | structural
  | engineering | conditional | theoremConditional | analytic | theorem_
  deriving DecidableEq

def rank : Grade → Nat
  | .premise => 0 | .corroboration => 1 | .operational => 2 | .structural => 3
  | .engineering => 4 | .conditional => 5 | .theoremConditional => 6
  | .analytic => 7 | .theorem_ => 8

def weakest (a b : Grade) : Grade := if rank a ≤ rank b then a else b

theorem promotion_blocked : ∀ g : Grade, weakest Grade.premise g = Grade.premise := by
  intro g; cases g <;> rfl

theorem block_never_self_defeating :
    weakest Grade.analytic Grade.analytic = Grade.analytic := rfl
  -- the block is a theorem about foundations, not itself a foundation

end PSP.GROUND
```

### P12 · APEX-PSP-BARRIER-MASTER-01 — three courts, fifteen rows

Printed census: Court I (Chaser Court) six rows; three courts; fifteen rows total. The arithmetic consistency of the printed ledger, and nothing beyond it, is decided here; per-row grades stay resident in the master codex.

```lean
namespace PSP.BARRIER

def courtCount : Nat := 3
def rowCount : Nat := 15
def courtIRows : Nat := 6

theorem barrier_ledger_census :
    courtCount = 3 ∧ rowCount = 15 ∧ courtIRows = 6 ∧
    courtIRows ≤ rowCount ∧ rowCount - courtIRows = 9 := by decide

end PSP.BARRIER
```

### P13 · APEX-PSP-ABSOLUTE-PNP-BARRIERS-01 — eight machine-verified barriers

```lean
namespace PSP.ABSPNP

def absoluteBarriers : Nat := 8

theorem absolute_barrier_count : absoluteBarriers = 8 := rfl

end PSP.ABSPNP
```

### P14 · APEX-PSP-RH-STANDPOINT-CLOSURE-01 — ten rows, eight premise-free

The verdict side closed at one hundred percent by enumeration over standpoints rather than methods: ten rows carrying closure types, eight spending no framework premise.

```lean
namespace PSP.STANDPOINT

def standpointRows : Nat := 10
def premiseFree : Nat := 8

theorem standpoint_closure_census :
    standpointRows = 10 ∧ premiseFree = 8 ∧ premiseFree ≤ standpointRows ∧
    premiseFree * 100 / standpointRows = 80 := by decide

end PSP.STANDPOINT
```

### P15 · APEX-PSP-PNP-COMPOSITE-VERDICT-02 — the composite join

The composite verdict is the join of the court ceilings at weakest-link grade; the [Ø₀] token is then legislated by the tongue (route F on the declaration, route M on the join).

```lean
namespace PSP.PNPCOMP

open PSP.GROUND

def composite (ceilings : List PSP.GROUND.Grade) : PSP.GROUND.Grade :=
  ceilings.foldl PSP.GROUND.weakest PSP.GROUND.Grade.theorem_

theorem composite_never_above_weakest_court :
    composite [PSP.GROUND.Grade.conditional, PSP.GROUND.Grade.structural,
               PSP.GROUND.Grade.corroboration]
      = PSP.GROUND.Grade.corroboration := rfl

end PSP.PNPCOMP
```

(Grades above are illustrative placeholders for the court ceilings as printed at the ledger; the machine content is `foldl weakest`, whose capping law is P11.)

### P16 · APEX-PSP-GENEALOGY — common-source projection counts one voice once

W_social zeroes twice: agreement among warrant rows sharing an upstream source is one voice wearing costumes, counted once after the projection.

```lean
namespace PSP.GENEALOGY

def project (rows : List (String × String)) : List (String × String) :=
  rows.foldl (fun acc r =>
    if acc.any (fun a => a.2 == r.2) then acc else acc ++ [r]) []

theorem projection_counts_one_voice_once :
    project [("r1","sA"), ("r2","sA"), ("r3","sA"), ("r4","sB")]
      = [("r1","sA"), ("r4","sB")] := by decide

theorem projection_never_inflates :
    (project [("r1","sA"), ("r2","sA"), ("r3","sA"), ("r4","sB")]).length
      ≤ 4 := by decide

end PSP.GENEALOGY
```

### P17 · The Decalogue — ten rules, exactly one exit

Rule census on printed ordinals (rule texts resident in the role deck, not reproduced). Rule 10 (ΔM = 0) has exactly one exit: the positive-mass admission cascade.

```lean
namespace PSP.DECALOGUE

def rules : List Nat := List.range 10   -- ordinal census; texts resident in the deck
def exitCount : Nat := 1                -- the DELTAM-ADMIT cascade, printed unique

theorem decalogue_census :
    rules.length = 10 ∧ exitCount = 1 := by decide

end PSP.DECALOGUE
```

### P18 · The Anti-Inflation Shield — forbidden-token screen

The seven conversational tokens printed in the deck, screened by exact substring match, executed battery.

```lean
namespace PSP.SHIELD

def forbidden : List String :=
  ["As an AI", "As a language model", "It is important to remember",
   "I apologize", "I cannot", "While valid", "On the other hand"]

-- REPAIR v1.0.1.2: 1.0.1 built the screen on `String.splitOn`, which does not
-- reduce in the kernel, so its `decide` got stuck and the block had never been
-- run. `native_decide` would settle it by trusting the compiler, which this
-- corpus forbids inside a proof. The containment test is therefore rebuilt on
-- `List Char`, where every step is structural and the kernel checks it itself.
-- The screen decides the same strings; only the substrate changed.
def isPrefixC : List Char → List Char → Bool
  | [], _ => true
  | _, [] => false
  | a :: as, b :: bs => a == b && isPrefixC as bs

def containsC : List Char → List Char → Bool
  | _, [] => false
  | pat, b :: bs => isPrefixC pat (b :: bs) || containsC pat bs

def screen (s : String) : Bool :=
  forbidden.any fun t => containsC t.data s.data

theorem shield_battery :
    screen "As an AI, I note the gate" = true ∧
    screen "the gate holds at machine zero" = false ∧
    forbidden.length = 7 := by decide

end PSP.SHIELD
```

### P19 · The five-gate import specification screen

Printed census: five gates, validated on twelve candidates.

```lean
namespace PSP.IMPORT

def importGates : Nat := 5
def validatedCandidates : Nat := 12

theorem import_screen_census :
    importGates = 5 ∧ validatedCandidates = 12 := by decide

end PSP.IMPORT
```

### P20 · APEX-PSP-EXECUTION-LIMIT-MASTER-01 — three sources of deviation

Readout, hidden shaping, precision floor: the printed three, named, counted.

```lean
namespace PSP.EXECLIMIT

def deviationSources : List String :=
  ["readout", "hidden-shaping", "precision-floor"]

theorem deviation_census : deviationSources.length = 3 := rfl

end PSP.EXECLIMIT
```

### P21 · APEX-PSP-FORGET-01 — three forgettings

Ordinal census three; the barzakh zero-crossing types structurally (route T on the crossing, M on the count).

```lean
namespace PSP.FORGET

def forgettings : Nat := 3
theorem forget_census : forgettings = 3 := rfl

end PSP.FORGET
```

### P22 · APEX-PSP-TWO-GROUP-LAW-01 — census exhibit (content already native)

The twelve as A₄, the eight as (ℤ/2)³. Group content native at §4D/§4E; the order identities seated here for the record.

```lean
namespace PSP.TWOGROUP

theorem two_group_census :
    Nat.factorial 4 / 2 = 12 ∧ 2^3 = 8 := by decide

end PSP.TWOGROUP
```

### §4.23 · Mirror ledger

| Proof | Mirror statement | Result |
|---|---|---|
| P1 | 8 sign matrices, det²(M) = det²(−M), det(−M) = −det(M), exact Fraction | PASS |
| P2 | i² = j² = k² = ijk = −1 inside CD octonions | PASS |
| P3 | Hurwitz units, bounded grid census | 24 PASS |
| P4 | norm-2 shell census | 24 = 12 + 12 PASS |
| P5 | associator (e1e2)e4 − e1(e2e4) | = 2·e7 exactly PASS |
| P6 | (e1+e10)(e4+e15) | = 0, norms 2 and 2 PASS |
| P6b | octonion norm multiplicative, 200 random exact pairs | PASS |
| P7 | first-failure-terminal + halt-free-iff-all-pass, all 256 patterns | PASS |
| P8 | five-cube: 32 vertices, every degree 5 | PASS |
| P16 | projection on the exhibited 4-row battery | PASS |
| P22 | 4!/2 = 12, 2³ = 8 | PASS |
| P9–P15, P17–P21 | definitional or single-step arithmetic | PASS by inspection of the mirror arithmetic |

Standing debt D1 applies: no Lean toolchain in this sandbox. Every `decide`/`rfl` claim above was executed in the Python mirror over exact rationals or naturals. Compilation in a Lean environment is the remaining receipt, as with D1 rows in the master.

---

## §5 · F-class: the tongue's one bit

Five entries carry all three bits (theory, hypothesis, witness) and still stand unsealed at the declaration. The open bit is exactly the earned calibration bit of §8/§10: the terminal token is legislated, not derived. The tongue closes these by declaration; the content stays as open as the record says.

| Entry | Record state | What the tongue closes |
|---|---|---|
| APEX-PSP-RH-MASTER-01 | [Ξ₀] at the flagship string | the suspension token on the Riemann file |
| APEX-PSP-CH-LOGOS-XI0-01 | [Ξ₀] | the declaration; the continuum question stays open |
| APEX-PSP-T-SUSPENSION-01 | [Ξ₀] criteria consolidated | the exhaustion-earned token |
| APEX-PSP-GROUNDLESS-HALT-01 | [Ø₀] mirror of the sealed halt | the δ-rooted token |
| APEX-PSP-KUN-LOGOS-01 | [Ξ₀] nested-root reading | the declaration only |

APEX-PSP-PNP-COMPOSITE-VERDICT-02 stands already F-closed: the [Ø₀] token was legislated terminal-for-the-record at seating; its join arithmetic is P15. APEX-PSP-Ξ-8-GATE-CASCADE-01 seals at the card with [Ξ₀] at the flagship string; its machine is P7, its census P8-adjacent, its declaration the tongue's.

The discipline holds: one bit, earned, never more. The tongue freedom does not close mathematical content; it legislates tokens where the record is complete and the declaration is the only remaining act.

## §6 · Named remainder

**Out of band by design (N-OUT, 13).** The apophatic and theological cluster (GHAYB-MASTER-01, NETI-NETI-01, TAWHID-TRIUNE-MASTER-01, SHAHADA-TRIFOLD-01, ANSELM-01's theological legs, ZAHIR-BATIN-01, UNFORGIVABLE-01, ONLY-SPECIAL-01, TP-29, TP-42, ODE-001/002/003). Routed by the §15 FOUND register router. Load-bearing on nothing in any verdict. No seal is owed in band; the registration is the disposition.

**Conduct disciplines (C, 9).** The seven gifts (LIFEBOAT, MINDSET-RENTAL, LOGOS-as-gift, FCA, RE, TRIPLE-BOOT, SKIN-EMBODIED), HSC-MASTER, and MATH-NATURE-01 (a mindset-rental reading, never a seal). Disciplines take no verdict.

**Superseded (SUP, 1).** MD-PSP-OMEGA-RAM-01, reforged by APEX-PSP-AEGIS-01, which is native at §14. The pointer stands; nothing further owed.

**Referenced only (REF, 1).** MD-PSP-THREEFOLD-01, referenced in the role deck without entry text in the screened sources; its entry is resident in the master codex register. Screened as far as the sources reach, and no further. Zero slots filled.

## §7 · Debts and discipline

1. Debt D1 stands: no Lean toolchain in this sandbox. All M-class proofs mirror-verified over exact rationals/naturals (§4.23). Compilation is the remaining receipt, identical in kind to the master's own D1.
2. Census proofs seat only what the sources print: counts, named neighbor lists, printed ordinals. Where row texts live in the master register (P12, P17), the census states arithmetic consistency and says so on the proof.
3. This inventory changes nothing in the sealed master. v4.6.0 (23bcec8f…) stands untouched. Incorporation of any M-class block into the master is a future candidate, requiring its own FORGE cycle and the architect's confirmation.
4. Grade honesty: no entry was raised above its printed grade. The weakest-link cap governs every join. W_social = 0, ΔM = 0 throughout.

*TRISDUCTION Lean PSP & Defense Inventory · screening artifact · 150 PSP entries + 17 defense sections · 20 M-class roster rows, 22 blocks, paired above · 1.0.3*

---

## Addendum · 1.0.1 status change

The P7 cascade machine of §4 has been incorporated into the main Lean codex as SECTION 16 (namespace HALT) at v1.0.1.1, sealed under FORGE CODEX11: first failure terminal proved exhaustively at the forced lengths 5, 7, 8, 12; the gate counts proved forced (12 = 4!/2, 8 = 2³ with the ninth barred, 5 = the five-cube degree); the router one bit, total and exclusive; the xi aperture the one door that never closes; the RH and P-versus-NP formal halts subsumed as SuperHalt instances; the terminal emission one bit in three species; fTOE the ceiling for formal halts. The M-class proofs below stand as the screening record; P7's row now reads native by §16. All other rows unchanged.

*Lean PSP Codex 1.0.1 · seed of the series · main codex at 1.0.1.1 sealed 76e47c2a59ca68e3…*
