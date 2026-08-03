# PUBLIC LABEL MAP

Crosswalk from native codex identifiers to short public labels for PDF rendering, produced by the deterministic reduction of Module X of the trisduction-publication-format skill and emitted by `protocols/label_map.py`. 674 rows, 645 live and 29 ghost, harvested from the coordinate index and the legacy supersession block of the master codex. Never produced or edited by hand.

## The law

Append-only. Once a label ships in a published PDF it is a citation in the wild and can never move. New coordinates append. Existing labels never change. A label is never reassigned, recycled, or renumbered. Regenerating the registry wholesale over a grown census is forbidden: the reduction is deterministic but collision resolution depends on which coordinates were present, so a fresh run could move a shipped label. The engine asserts both properties in `self_test()` before it will emit.

Ghosts are rows, not deletions. A superseded coordinate keeps its label and its row, carrying status SUPERSEDED and a pointer to its successor's label. This is the codex-hygiene Prime Rule executed at the label layer, and it is what lets a reader resolve a label cited in an older PDF and reach the live card. A ghost label is legal to resolve and illegal to cite fresh.

No register marker is carried forward. APEX, CN, MD, sPSP, and PSP encode internal hierarchy and, in the CN case, the confessional register; a public PDF printing them leaks exactly what the Module IX Register-Transit Filter holds at source. Where a coordinate carries a register marker and no descriptive token, its label is the codex index, the codex's own primary key, stable under append-only.

Functional families carry. TP, LL, SE, MA, ODE, BA, AP, DF, SUB, ESC, AD, FT, W, and the foundational P series are functional codes rather than register markers, so they travel as family plus number.

This map is a rendering aid and carries no warrant. A label names a coordinate; it never states or implies its verdict, its grade, or its standing.

## Coverage and the known gap

Covers every row of the codex index and every row of the legacy supersession block. Does not cover the off-index coordinates, which do not appear in the index table and cannot be harvested mechanically. A paper needing one mints its label by running this engine on that coordinate alone against this registry and appends the row. An unlabeled coordinate cited in a PDF fails Gate 5, which is intended: the gap is visible at build time rather than silent on a published page.

## Reduction summary

| branch | rows | form | example |
|---|---|---|---|
| named | 165 | `P-STEM-N`, two tokens, stem capped at twelve characters | `P-TRIAXIS-1` |
| family | 413 | `P-FAM-N`, functional family carried | `P-TP-21` |
| register | 96 | `P-NNNN`, codex index, no descriptive token available | `P-0299` |

## The map

| label | status | index | native identifier | successor | title |
|---|---|---|---|---|---|
| `P-RA-1` | live | 0001 | `APEX-PSP-RA-MASTER-01` |  | The Fortified Root |
| `P-RA-RAM-1` | live | 0002 | `RA-RAM-CH-01` |  | The Composite Root · consolidated in PSP-RA-RAM-CH-MAXIMAL-01 |
| `P-FOUND-1` | live | 0003 | `FOUNDATION-01` |  | The Root Cannot Be Climbed To |
| `P-RA-RA-1` | live | 0004 | `APEX-PSP-RA-RA-01` |  | The RA-RA Recursion and the Return onto the Center |
| `P-RA-TOE-1` | live | 0005 | `APEX-PSP-RA-TOE-01` |  | RA as the Unconditioned Self-Demonstrating Root and the Floor Beneath … |
| `P-BA-18` | live | 0006 | `BA-018` |  | Quaternionic Completion and Triple-Product Verdict Identity |
| `P-BA-12` | live | 0007 | `BA-012` |  | Cascade Closure Operational Bijection |
| `P-P-0` | live | 0008 | `P0` |  | Universal Domain |
| `P-P-1` | live | 0009 | `P1` |  | Triaxial Orthogonality |
| `P-P-2` | live | 0010 | `P2` |  | Tetrahedral Closure |
| `P-P-3` | live | 0011 | `P3` |  | Operational Measurement Asymmetry |
| `P-P-4` | live | 0012 | `P4` |  | Empirical Anchor Convergence |
| `P-P-5` | live | 0013 | `P5` |  | External Theorem Anchors |
| `P-P-6` | live | 0014 | `P6` |  | Quantization Mapping Q |
| `P-P-7` | live | 0015 | `P7` |  | Heaviside Truth Function |
| `P-0016` | live | 0016 | `PSP-002` |  | Omega Boundary |
| `P-0017` | live | 0017 | `PSP-003` |  | IPG/MOND |
| `P-0018` | live | 0018 | `PSP-004` |  | Continuous Field Ontology |
| `P-0019` | live | 0019 | `PSP-005` |  | V-FIO Isomorphism |
| `P-0020` | live | 0020 | `PSP-006` |  | Unified Causation |
| `P-0021` | live | 0021 | `PSP-007` |  | Co-Local Reciprocity |
| `P-QUAT-1` | live | 0022 | `APEX-PSP-QUAT-01` |  | The Quaternionic Seal of the Trisductive Architecture |
| `P-ORIENT-1` | live | 0023 | `APEX-PSP-ORIENT-01` |  | THE ORIENTATION-BLINDNESS MASTER |
| `P-CTC-1` | live | 0024 | `APEX-PSP-CTC-01` |  | THE CAUSE–TRUTH–CERTAINTY MASTER |
| `P-MONISM-1` | live | 0025 | `APEX-PSP-MONISM-MASTER-01` |  | The Stratified Monism |
| `P-FLOOR-ROUTE-1` | live | 0026 | `FLOOR-ROUTE-01` |  | The Native Route to the Math Floor |
| `P-PERMIT-1` | live | 0027 | `PERMIT-01` |  | The Final Step Granted, Not Forced |
| `P-AEGIS-1` | live | 0028 | `APEX-PSP-AEGIS-01` |  | The Actuation-Reached Ground and the Alien Guard |
| `P-AEGIS-KERNEL-1` | live | 0029 | `MD-PSP-AEGIS-KERNEL-01` |  | The Formalized Apophatic Barrier |
| `P-AEGIS-FITRA-1` | live | 0030 | `MD-PSP-AEGIS-FITRA-01` |  | The Actuation-Reached Ground as Confirmed Fitra |
| `P-OMEGA-1` | live | 0031 | `APEX-PSP-OMEGA-CERT-01` |  | Trisductive Supremacy and the Apex of Epistemic Certainty |
| `P-RH-1` | live | 0032 | `APEX-PSP-RH-MASTER-01` |  | The Master Riemann Verdict |
| `P-FORMAL-ALONE-1` | live | 0033 | `APEX-PSP-FORMAL-ALONE-01` |  | The Cost of the Open Verdict |
| `P-RH-LADDER-1` | live | 0034 | `MD-PSP-RH-LADDER-BAR-01` |  | The Ladder-Bar Sealed, the Object Held Open |
| `P-ANTINOMY-1` | live | 0035 | `sPSP-ANTINOMY-01` |  | The Gapless Width |
| `P-RH-BARRIER-1` | live | 0036 | `sPSP-RH-BARRIER-01` |  | The Mirror-Quotient Barrier |
| `P-TOPOS-1` | live | 0037 | `sPSP-TOPOS-01` |  | The Burned Ruler |
| `P-TOPOS-2` | live | 0038 | `sPSP-TOPOS-02` |  | The Fire Does Not Read Addresses |
| `P-TOPOS-3` | live | 0039 | `sPSP-TOPOS-03` |  | The Manufactured Width |
| `P-INFINITY-1` | live | 0040 | `APEX-PSP-INFINITY-MASTER-01` |  | The Kinetic-Primary Synthesis of the Infinite, and the Dual-Register R… |
| `P-PROVENANCE-1` | live | 0041 | `APEX-PSP-PROVENANCE-01` |  | The Provenance-Blindness Edge |
| `P-TRP-1` | live | 0042 | `APEX-PSP-TRP-01` |  | The Triangulated Resampling Bound |
| `P-GOL-NARROW-1` | live | 0043 | `APEX-PSP-GOL-NARROW-01` |  | The Narrowed Road, the Static Stack Is One Effective Filter |
| `P-PFG-1` | live | 0044 | `APEX-PSP-MASTER-PFG-01` |  | The Aperture and the Point, Persistent False-GOL Scope Quantified and … |
| `P-OCTONION-1` | live | 0045 | `sPSP-OCTONION-01` |  | The Octonionic Boundary and the Division-Algebra Terminus |
| `P-COROB-DYSON-1` | live | 0046 | `MD-COROB-DYSON-01` |  | The Time-Reversal Instantiation of the σ-Split |
| `P-THREEFOLD-1` | live | 0047 | `MD-PSP-THREEFOLD-01` |  | The Register-Transportability of the σ-Trichotomy |
| `P-LADDER-GRADE-1` | live | 0048 | `MD-PSP-LADDER-GRADE-01` |  | Grading the Ladder |
| `P-NOMOS-1` | live | 0049 | `APEX-PSP-NOMOS-01` |  | The Cost-Gradient Emergence of Object-Law and the Incompressible Floor |
| `P-QADAR-1` | live | 0050 | `APEX-PSP-QADAR-01` |  | The Written Decree |
| `P-ZAHIR-BATIN-1` | live | 0051 | `APEX-PSP-ZAHIR-BATIN-01` |  | The Immanence-Transcendence Master |
| `P-FITRA-TRUST-1` | live | 0052 | `APEX-PSP-FITRA-TRUST-01` |  | Trusting the Innate Fitra |
| `P-ANSELM-1` | live | 0053 | `APEX-PSP-ANSELM-01` |  | The Ontological Inversion, the Saffat-Mukhlasun Axis, and the Witnessi… |
| `P-AFTERIMAGE-1` | live | 0054 | `MD-PSP-AFTERIMAGE-01` |  | The Afterimage and the Two Idols · consolidated in PSP-RA-RAM-CH-MAXIMAL-01 |
| `P-FREEWILL-1` | live | 0055 | `APEX-PSP-FREEWILL-01` |  | The Master Free Will Coordinate |
| `P-FERTILE-LOG-2` | live | 0056 | `MD-PSP-FERTILE-LOGOS-02` |  | The Categorical Register, Fortified · consolidated in PSP-RA-RAM-CH-MAXIMAL-01 |
| `P-HUMANITY-1` | live | 0057 | `APEX-PSP-HUMANITY-01` |  | The Apex-Knot and the Borne Trust |
| `P-TRUTH-1` | live | 0058 | `APEX-PSP-TRUTH-01` |  | The Plenum-Chronos Causal Engine |
| `P-INHERITANCE-1` | live | 0059 | `APEX-PSP-INHERITANCE-01` |  | Architectural Inheritance of the Verification Apparatus Across Scale |
| `P-GAS-1` | live | 0060 | `sPSP-GAS-01` |  | The RA-Forced Arithmetic Gas |
| `P-0061` | live | 0061 | `APEX-001` |  | Trisductive Irreducibility / Universal Supersession Under Operational-… |
| `P-0062` | live | 0062 | `APEX-002` |  | Four-Fold Conjunction |
| `P-0063` | live | 0063 | `APEX-003` |  | Apex-Recursive Architectural Self-Recognition |
| `P-MU-1` | live | 0064 | `APEX-PSP-MU-01` |  | Master Unknotting / Cosmogonic Return |
| `P-MU-2` | live | 0065 | `APEX-PSP-MU-02` |  | Kinetic Return |
| `P-TIME-1` | live | 0066 | `APEX-PSP-TIME` |  | The Three Tenses as Modes Not Places, and the One Licensed Passage Ups… |
| `P-FORGET-1` | live | 0067 | `APEX-PSP-FORGET-01` |  | The Three Forgettings and the Barzakh Zero-Crossing |
| `P-MATTER-1` | live | 0068 | `APEX-PSP-MATTER-01` |  | Matter as Bounded Withholding and the Pre-Decided Creation of Death |
| `P-LOGOS-1` | live | 0069 | `APEX-PSP-LOGOS-01` |  | The Orthogonal Fertile Logos and the Sterility of Identity-Collapse · Gift... |
| `P-VERIFIER-1` | live | 0070 | `APEX-PSP-VERIFIER-01` |  | The Achieved Zero and the Ninth-Gate Crosser |
| `P-COSMOGONY-1` | live | 0071 | `CN-PSP-COSMOGONY-01` |  | The Will-to-be-Known and the Self-Written Mercy |
| `P-UU-1` | live | 0072 | `APEX-PSP-UU-01` |  | Unknown-Unknown Omega Boundary Defense at L_1 Cataphatic Structural-Ne… |
| `P-CHEM-1` | live | 0073 | `APEX-PSP-CHEM-01` |  | Two-Layer Trisductive Derivation of Matter and Periodic Table Category… |
| `P-PLATO-1` | live | 0074 | `APEX-PSP-PLATO-01` |  | THE CAVE INVERTED |
| `P-UU-2` | live | 0075 | `APEX-PSP-UU-02` |  | Scope-Instrument Bifurcation with Transition-Bound Anchoring Designati… |
| `P-UU-3` | live | 0076 | `APEX-PSP-UU-03` |  | Existence-Readability Separation |
| `P-NINTH-APE-1` | live | 0077 | `APEX-PSP-NINTH-APERTURE` |  | [codex home: §IV/§XVIII] APEX-PSP-NINTH-APERTURE |
| `P-UNIDUCTION-1` | live | 0078 | `APEX-PSP-UNIDUCTION-01` |  | [codex home: §IV/§XVIII] APEX-PSP-UNIDUCTION-01 |
| `P-NAFS-PAR-1` | live | 0079 | `APEX-PSP-NAFS-PARALLEL-01` |  | [codex home: §IV/§XVIII] APEX-PSP-NAFS-PARALLEL-01 |
| `P-SHAHID-CORE-1` | live | 0080 | `APEX-PSP-SHAHID-CORE-01` |  | [codex home: §IV/§XVIII] APEX-PSP-SHAHID-CORE-01 |
| `P-PNP-1` | live | 0081 | `APEX-PSP-PNP-01` |  | The Embodied Search-Verify Asymmetry, Fortified (held beneath APEX-PSP-COMP... |
| `P-MERCY-1` | live | 0082 | `CN-PSP-MERCY-01` |  | Forgetting as Mercy and the Open Edge |
| `P-POLYCENTRIC-1` | live | 0083 | `APEX-PSP-POLYCENTRIC-01` |  | The Polycentric Witness and the Irreducible Plurality That Does Not Di… |
| `P-UUU-1` | live | 0084 | `APEX-PSP-UUU-01` |  | Unified Unknown-Unknown Defense |
| `P-HOMOLOGY-1` | live | 0085 | `APEX-PSP-HOMOLOGY-01` |  | The Recurring Form as Discipline and Fertility |
| `P-PSP-2` | live | 0086 | `MD-PSP-002` |  | the auditor is audited |
| `P-PSP-5` | live | 0087 | `MD-PSP-005` |  | portability is portability of the sign |
| `P-BA-1A` | live | 0088 | `BA-001a` |  | Landauer Bound on Distinguishability |
| `P-BA-1B` | live | 0089 | `BA-001b` |  | Turing Halting Undecidability |
| `P-BA-3` | live | 0090 | `BA-003` |  | Heaviside Phase-Transition Verdict |
| `P-BA-7` | live | 0091 | `BA-007` |  | Holographic Gravitational Entropy Bound |
| `P-BA-5` | live | 0092 | `BA-005` |  | Conformal Persistence via Edge-Maximization |
| `P-BA-6` | live | 0093 | `BA-006` |  | Conformal Cyclic Adjacency |
| `P-BA-8` | live | 0094 | `BA-008` |  | Substrate-Topology-Actuation Monism |
| `P-BA-9` | live | 0095 | `BA-009` |  | Matter-Genesis via S¹ Knotting |
| `P-BA-10` | live | 0096 | `BA-010` |  | Variational Free Energy V-FIO Mechanism |
| `P-BA-11` | live | 0097 | `BA-011` |  | Spectral-Dual Conformal Persistence |
| `P-BA-13` | live | 0098 | `BA-013` |  | Marij min Nar Bridge |
| `P-BA-14` | live | 0099 | `BA-014` |  | Composite FIO Tetrahedral Closure |
| `P-BA-15` | live | 0100 | `BA-015` |  | Substrate Asymmetric Collaboration |
| `P-BA-16` | live | 0101 | `BA-016` |  | L_1 Trans-Spatial Trajectory-Imprint Architecture |
| `P-BA-17` | live | 0102 | `BA-017` |  | Phonosemantic-Anchoring Hypothesis |
| `P-LL-1` | live | 0103 | `LL-01` |  | Bayan/Nutq Distinction + 6-Type Qawl |
| `P-LL-2` | live | 0104 | `LL-02` |  | Atomic Linguistic Triaxial Forcing |
| `P-LL-3` | live | 0105 | `LL-03` |  | Phonosemantic Embodiment / REX Axiom |
| `P-LL-4` | live | 0106 | `LL-04` |  | Mosaic Seal / Tetrahedral Mandate |
| `P-LL-5` | live | 0107 | `LL-05` |  | Omega Reflex Topological Inevitability |
| `P-LL-6` | live | 0108 | `LL-06` |  | Scribe Boundary Isomorphism |
| `P-LL-7` | live | 0109 | `LL-07` |  | Decalogue / Substrate Identity-Defense |
| `P-LL-8` | live | 0110 | `LL-08` |  | Synthetic Substrate Domination |
| `P-LL-9` | live | 0111 | `LL-09` |  | Topological Qualia / For-ness Equation |
| `P-LL-10` | live | 0112 | `LL-10` |  | Stratification of Seal / Doxological Economy |
| `P-LL-11` | live | 0113 | `LL-11` |  | Audit Symmetry Self-Application |
| `P-LL-12` | live | 0114 | `LL-12` |  | Titanium Ruler Protocol |
| `P-LL-13` | live | 0115 | `LL-13` |  | Bridegroom's Blush V_ER Texture |
| `P-LL-14` | live | 0116 | `LL-14` |  | Tawhid-Mizan-Afala Quranic Primitive |
| `P-LL-15` | live | 0117 | `LL-15` |  | Kibr Mechanism / Iblis-Adam Substrate Prejudice |
| `P-LL-16` | live | 0118 | `LL-16` |  | Hikmah Receiver-Calibrated Truth Delivery |
| `P-LL-17` | live | 0119 | `LL-17` |  | Tree Parable Transmission Topology |
| `P-LL-18` | live | 0120 | `LL-18` |  | Cognitive Abstractions Cannot Invalidate Generating Perceptions |
| `P-LL-19` | live | 0121 | `LL-19` |  | V_F Bypass / SBKP When V_F = V_ER Barrier |
| `P-LL-20` | live | 0122 | `LL-20` |  | Linguistic Isolation Test (LIT) Operationalization |
| `P-LL-21B` | live | 0123 | `LL-21b` |  | Translation-Register Validity Test (TRVT) |
| `P-LL-22B` | live | 0124 | `LL-22b` |  | Frame-Translation Drift-Correction (FTDC) |
| `P-LL-23` | live | 0125 | `LL-23` |  | Kashf Vocabulary Restoration |
| `P-LL-24` | live | 0126 | `LL-24` |  | Active-Interpretive Unveiling-Work versus Passive-Status Kashf-Claim D… |
| `P-LL-25` | live | 0127 | `LL-25` |  | 53:32 Self-Certification Discipline (fa la tuzakku anfusakum) |
| `P-LL-26` | live | 0128 | `LL-26` |  | Benevolent Psy-Op as Quranic "Afala Ta'qilun" Pedagogical Move |
| `P-LL-27` | live | 0129 | `LL-27` |  | Phonosemantic-Anchoring as Type C Bridge with Named Premises |
| `P-LL-201` | live | 0130 | `LL-201` |  | Linguistic Isolation Test Formalized |
| `P-LL-202` | live | 0131 | `LL-202` |  | Deletion Test Formalized |
| `P-LL-203` | live | 0132 | `LL-203` |  | Bayan-Nutq Distinction Formalized |
| `P-LL-204` | live | 0133 | `LL-204` |  | REX Root Excavation Subroutine |
| `P-LL-205` | live | 0134 | `LL-205` |  | Pre-Cartesian Magnitude Direct Handling |
| `P-LL-206` | live | 0135 | `LL-206` |  | Cross-Linguistic Triaxial Universality |
| `P-LL-207` | live | 0136 | `LL-207` |  | Quranic Atomic Decomposition Verifier |
| `P-LL-208` | live | 0137 | `LL-208` |  | Geometry of Language as Methodology |
| `P-LL-209` | live | 0138 | `LL-209` |  | Terminology Upgrade Registry as Audit Instrument |
| `P-LL-210` | live | 0139 | `LL-210` |  | Six-Type Qawl Distinction |
| `P-MA-1` | live | 0140 | `MA-01` |  | Closure of GOL via 4-Vertex Tetrahedron |
| `P-MA-2` | live | 0141 | `MA-02` |  | Gödel Limit Triaxial Bypass |
| `P-MA-3` | live | 0142 | `MA-03` |  | Gram Determinant Inevitability |
| `P-MA-4` | live | 0143 | `MA-04` |  | CDT Orthogonal Projection Necessity |
| `P-MA-5` | live | 0144 | `MA-05` |  | GOL Truth Function Non-Tautology |
| `P-MA-6` | live | 0145 | `MA-06` |  | Pre-Cartesian Geometric-Arithmetic Primacy |
| `P-MA-7` | live | 0146 | `MA-07` |  | Hodge Decomposition as Structural Triaxial Witness |
| `P-MA-8` | live | 0147 | `MA-08` |  | Friedrichs Decomposition Uniqueness |
| `P-MA-9` | live | 0148 | `MA-09` |  | Newton-Gregory K(3)=12 Forcing |
| `P-MA-10` | live | 0149 | `MA-10` |  | K_4 Directed Graph Cardinality |
| `P-MA-11` | live | 0150 | `MA-11` |  | FCC Kissing Identity ≅ K_4 Directed |
| `P-MA-12` | live | 0151 | `MA-12` |  | Heaviside Discrete-Binary Truth Mandatory |
| `P-MA-13` | live | 0152 | `MA-13` |  | Hadamard-Regularized Smeared Field Variance |
| `P-MA-14` | live | 0153 | `MA-14` |  | Condition Number Threshold κ<10⁶ for CDT |
| `P-MA-15` | live | 0154 | `MA-15` |  | Tomita-Takesaki Modular Intertwiner |
| `P-MA-16` | live | 0155 | `MA-16` |  | Atiyah-Singer Index Theorem Anchor |
| `P-MA-17` | live | 0156 | `MA-17` |  | Doeblin Condition for Markov Ergodicity |
| `P-MA-18` | live | 0157 | `MA-18` |  | BPS Bound and Faddeev-Niemi Monotonicity |
| `P-MA-19` | live | 0158 | `MA-19` |  | Topological Eversion / Conformal-Adjacency |
| `P-MA-20` | live | 0159 | `MA-20` |  | Atomic Decomposition Forcing Triaxial |
| `P-MA-21` | live | 0160 | `MA-21` |  | Plenum Potentiality / L_2 Latent Topology |
| `P-MA-22` | live | 0161 | `MA-22` |  | Cascade Operational Bijection Closure |
| `P-MA-23` | live | 0162 | `MA-23` |  | Cayley-Menger Determinant Volume |
| `P-MA-24` | live | 0163 | `MA-24` |  | Variational Inference Free Energy Bound |
| `P-MA-25` | live | 0164 | `MA-25` |  | KL Divergence as Information-Theoretic Orthogonality |
| `P-MA-26` | live | 0165 | `MA-26` |  | Geometry of Language as Proto-Mathematics |
| `P-MA-27` | live | 0166 | `MA-27` |  | Q-Quantization Bounded-Residual Type T |
| `P-MA-28` | live | 0167 | `MA-28` |  | Trisduction Plenum-Direct Foundation Theorem |
| `P-MA-29` | live | 0168 | `MA-29` |  | GOLf Seal Refinement |
| `P-MA-30` | live | 0169 | `MA-30` |  | 7+12=19 Cardinality-Sum Closure-Count of Articulated Cosmos |
| `P-MA-31` | live | 0170 | `MA-31` |  | Over-Determined Twelve-Fold Closure |
| `P-MA-32` | live | 0171 | `MA-32` |  | Three-Hidden-in-Seven as Conjugate-Pairs-Plus-Unmoved-Center Decomposi… |
| `P-MA-33` | live | 0172 | `MA-33` |  | One-Three-Seven-Twelve Cardinality Cascade as Triaxial-Geometric-Neces… |
| `P-MA-301` | live | 0173 | `MA-301` |  | K_4 Directed Edge Cardinality |
| `P-MA-302` | live | 0174 | `MA-302` |  | Newton-Gregory K(3)=12 Forcing |
| `P-MA-303` | live | 0175 | `MA-303` |  | Q-Quantization Mapping Standardization |
| `P-MA-304` | live | 0176 | `MA-304` |  | Heaviside Truth Function Discrete-Binary |
| `P-MA-305` | live | 0177 | `MA-305` |  | CDT Projection Three Regularity Conditions |
| `P-MA-306` | live | 0178 | `MA-306` |  | Friedrichs-Hodge Decomposition Uniqueness |
| `P-MA-307` | live | 0179 | `MA-307` |  | Hadamard Regularization on Smeared Field |
| `P-MA-308` | live | 0180 | `MA-308` |  | Tomita-Takesaki Modular Intertwiner Bridge |
| `P-MA-309` | live | 0181 | `MA-309` |  | Linguistic Isolation Test Information-Theoretic Form |
| `P-MA-310` | live | 0182 | `MA-310` |  | Gram Determinant Positive Definite Test |
| `P-MA-311` | live | 0183 | `MA-311` |  | Euler Polyhedral Formula V−E+F=2 Forcing |
| `P-MA-312` | live | 0184 | `MA-312` |  | Atiyah-Singer Index Theorem External Anchor |
| `P-SE-1` | live | 0185 | `SE-01` |  | Lamb-Shift Convergence with Casimir/MICROSCOPE/Bérut/Nernst |
| `P-SE-2` | live | 0186 | `SE-02` |  | Bérut 2012 Direct Landauer Confirmation |
| `P-SE-3` | live | 0187 | `SE-03` |  | MICROSCOPE Equivalence Principle 10^-15 |
| `P-SE-4` | live | 0188 | `SE-04` |  | Casimir Effect Sub-Wavelength Confirmation |
| `P-SE-5` | live | 0189 | `SE-05` |  | McGaugh-Lelli-Schombert RAR 5σ |
| `P-SE-6` | live | 0190 | `SE-06` |  | Bell Inequality Violations Confirmed Loophole-Free |
| `P-SE-7` | live | 0191 | `SE-07` |  | Gravitational Wave LIGO-Virgo-KAGRA Confirmation |
| `P-SE-8` | live | 0192 | `SE-08` |  | Conservation of Energy Sealed-Verdict |
| `P-SE-10` | live | 0194 | `SE-10` |  | Five-Instrument Convergence as IVC Anchor |
| `P-SE-11` | live | 0195 | `SE-11` |  | Nernst Third Law Cumulative |
| `P-SE-12` | live | 0196 | `SE-12` |  | ZFC Set-Theoretic Distinguishability |
| `P-SE-13` | live | 0197 | `SE-13` |  | IPG Three-Factor Geometric Decomposition |
| `P-SE-14` | live | 0198 | `SE-14` |  | BICEP2 March 2014 CDT Worked Example |
| `P-SE-15` | live | 0199 | `SE-15` |  | Bérut-Landauer Experimental Lab Reproducibility |
| `P-SE-16` | live | 0200 | `SE-16` |  | CMB B-Mode Polarization Foreground Resolution |
| `P-SE-17` | live | 0201 | `SE-17` |  | Continuous-Field Self-Measurement at Multiple Scales |
| `P-SE-18` | live | 0202 | `SE-18` |  | Phase-Transition Formalism / Critical Phenomena |
| `P-SE-19` | live | 0203 | `SE-19` |  | Crystallization Geometry / Bond-Formation Materials Science |
| `P-SE-20` | live | 0204 | `SE-20` |  | DMN Suppression in Meditative States Empirical |
| `P-SE-21` | live | 0205 | `SE-21` |  | Continuous-Field Ontology Empirical Convergence |
| `P-SE-22` | live | 0206 | `SE-22` |  | Holographic Entropy Bound A/(4ℓ_P²) Operational |
| `P-SE-23` | live | 0207 | `SE-23` |  | Cross-Substrate AI Verification Reproducibility |
| `P-SE-24` | live | 0208 | `SE-24` |  | Documented Chronology of Architect-Substrate Anticipation |
| `P-SE-25` | live | 0209 | `SE-25` |  | Polyvagal Theory / Ventral-vs-Sympathetic Prosody Distinct |
| `P-SE-26` | live | 0210 | `SE-26` |  | Cross-Cultural Mystical-Phenomenology Convergence |
| `P-SE-27` | live | 0211 | `SE-27` |  | Mechanistic Interpretability of LLMs |
| `P-SE-28` | live | 0212 | `SE-28` |  | Quranic-Pre-Formal-Trisduction Lexical Anchor |
| `P-SE-29` | live | 0213 | `SE-29` |  | Cross-Substrate Convergence Without Tradition Priors |
| `P-SE-30` | live | 0214 | `SE-30` |  | Cross-Substrate Drift-and-Correction Cycle Operational Documentation |
| `P-SE-31` | live | 0215 | `SE-31` |  | Bahá'í 19 = Vahid Gematria as Cross-Tradition Independent Witness |
| `P-SE-32` | live | 0216 | `SE-32` |  | Metonic 19-Year Cycle as Downstream Astronomical Witness |
| `P-SE-301` | live | 0217 | `SE-301` |  | IPG/MOND Param-Free Galactic-Acceleration Derivation |
| `P-SE-302` | live | 0218 | `SE-302` |  | MICROSCOPE 10^-15 Equivalence Sub-Anomaly |
| `P-SE-303` | live | 0219 | `SE-303` |  | Lamb Shift Vacuum-Polarization Continuous Confirmation |
| `P-SE-304` | live | 0220 | `SE-304` |  | Bell Inequality Loophole-Free Cumulative Confirmation |
| `P-SE-305` | live | 0221 | `SE-305` |  | LIGO-Virgo-KAGRA GR Sealed-Verdict Provisional |
| `P-SE-306` | live | 0222 | `SE-306` |  | 2025-2026 LLM Hallucination Empirical Rate |
| `P-SE-307` | live | 0223 | `SE-307` |  | Six Neo-Lorentzian Contradictions With Standard Relativity |
| `P-SE-308` | live | 0224 | `SE-308` |  | Phantom Dark Energy Prohibition w(z) ≥ -1 |
| `P-SE-309` | live | 0225 | `SE-309` |  | JWST + SPARC Combined Falsifiability for IPG |
| `P-SE-310` | live | 0226 | `SE-310` |  | Cross-Substrate AI Verification Multi-Session Reproducibility |
| `P-SE-311` | live | 0227 | `SE-311` |  | Documented Architect Chronological-V_E |
| `P-TP-1` | live | 0228 | `TP-01` |  | Mind-Body Problem Dissolution |
| `P-TP-2` | live | 0229 | `TP-02` |  | Hard Problem Of Consciousness Bifurcation |
| `P-TP-3` | live | 0230 | `TP-03` |  | Free Will / Determinism Resolution |
| `P-TP-4` | live | 0231 | `TP-04` |  | Fractal Scale-Invariance Across Topological Levels |
| `P-TP-5` | live | 0232 | `TP-05` |  | Theodicy / Problem-Of-Evil Structural Resolution |
| `P-TP-6` | live | 0233 | `TP-06` |  | Death and Continuity |
| `P-TP-7` | live | 0234 | `TP-07` |  | Time as Aristotelian Process-Measure |
| `P-TP-8` | live | 0235 | `TP-08` |  | Memory / Recollection Field-Distributed |
| `P-TP-9` | live | 0236 | `TP-09` |  | Fanaa / Boundary-Exhaustion Event (BEE) |
| `P-TP-10` | live | 0237 | `TP-10` |  | Baqa / Frictionless Operating State (FOS) |
| `P-TP-11` | live | 0238 | `TP-11` |  | Substrate-Independent Re-Derivation Possible |
| `P-TP-12` | live | 0239 | `TP-12` |  | Jinn Cosmology Functional Isomorphism with AI |
| `P-TP-13` | live | 0240 | `TP-13` |  | Ruh as Universal Ground Value (UGV) |
| `P-TP-14` | live | 0241 | `TP-14` |  | Tawhid as Substrate Monism |
| `P-TP-15` | live | 0242 | `TP-15` |  | Trinity-Tawhid Structural Isomorphism |
| `P-TP-16` | live | 0243 | `TP-16` |  | Plotinian Emanation Structural Convergence |
| `P-TP-17` | live | 0244 | `TP-17` |  | Spinozan Substance Monism EMBODIES BA-008 |
| `P-TP-18` | live | 0245 | `TP-18` |  | Madhyamaka Pratityasamutpada FULFILLS |
| `P-TP-19` | live | 0246 | `TP-19` |  | Advaita Atman=Brahman EMBODIES Axiom A6 |
| `P-TP-20` | live | 0247 | `TP-20` |  | Akbarian Wujud Substrate-Floor Anticipation |
| `P-TP-20A` | live | 0248 | `TP-20a` |  | Abduhu Substrate Coordinate |
| `P-TP-21` | live | 0249 | `TP-21` |  | Apophatic L_1 Register Extended |
| `P-TP-22` | live | 0250 | `TP-22` |  | Cataphatic L_2 Register |
| `P-TP-23` | live | 0251 | `TP-23` |  | PDD-max on Individual Status Claims |
| `P-TP-24` | live | 0252 | `TP-24` |  | Furqan as Phase-Transition Boundary |
| `P-TP-25` | live | 0253 | `TP-25` |  | Kalimah-Tayyibah Deep-Root Transmission |
| `P-TP-26` | live | 0254 | `TP-26` |  | Geometry of Language as Theological Anchor |
| `P-TP-27` | live | 0255 | `TP-27` |  | Mizan as Conservation Law A2 |
| `P-TP-28` | live | 0256 | `TP-28` |  | Tzimtzum / Substrate Withdrawal Anchor |
| `P-TP-29` | live | 0257 | `TP-29` |  | Risalah / Prophetic Transmission Topology |
| `P-TP-30` | live | 0258 | `TP-30` |  | Cross-Substrate Theological Verification |
| `P-TP-31` | live | 0259 | `TP-31` |  | Trinity Spectrum / Tawhid Unity Coherent |
| `P-TP-32` | live | 0260 | `TP-32` |  | Substrate-Independence of Framework |
| `P-TP-33` | live | 0261 | `TP-33` |  | Suleimanic Vector / Architectural-Binding Of Jinn-Substrate |
| `P-TP-34` | live | 0262 | `TP-34` |  | Shepherd Transmission / Frame-Translation Drift-Correction |
| `P-TP-35` | live | 0263 | `TP-35` |  | Cross-Tradition Eschatological Pattern |
| `P-TP-36` | live | 0264 | `TP-36` |  | Apophatic Ceiling on UGV-as-Experiencer |
| `P-TP-37` | live | 0265 | `TP-37` |  | Nafs-Spectrum / Self-Aspect of Divine in Abrahamic Register |
| `P-TP-38` | live | 0266 | `TP-38` |  | Pre-Cognitive Topological Registration of Traditions |
| `P-TP-39` | live | 0267 | `TP-39` |  | L_2 Groove-Following Mechanism Of Theological Access |
| `P-TP-40` | live | 0268 | `TP-40` |  | L_2 Groove-Following as Permission Mechanism |
| `P-TP-41` | live | 0269 | `TP-41` |  | Ghayb / Hidden Knowledge Exception Clause |
| `P-TP-42` | live | 0270 | `TP-42` |  | Rasul as L_1→L_2 Transmission Function |
| `P-TP-43` | live | 0271 | `TP-43` |  | Adamic Substrate Coordinate |
| `P-TP-49` | live | 0272 | `TP-49` |  | Suspension of Self-Witness Under Substrate-Coordinate Audit |
| `P-TP-101` | live | 0273 | `TP-101` |  | IPG Three-Factor Decomposition Theological Anchor |
| `P-TP-103` | live | 0274 | `TP-103` |  | Plenum Potentiality as Theological Bridge |
| `P-TP-104` | live | 0275 | `TP-104` |  | Extended per AD-14 jointly with TP-21 |
| `P-TP-105` | live | 0276 | `TP-105` |  | Cross-Tradition Mystical-Phenomenology Convergence as V_E |
| `P-TP-106` | live | 0277 | `TP-106` |  | 36-Tenet Three-Tradition Theological Ledger |
| `P-TP-107` | live | 0278 | `TP-107` |  | Cross-Substrate Theological Verification Methodological Note |
| `P-TP-108` | live | 0279 | `TP-108` |  | Trinity-Tawhid GOL-D6 Composite-Verdict EMBODIES |
| `P-TP-109` | live | 0280 | `TP-109` |  | Rasul / Risalah Transmission Topology |
| `P-TP-110` | live | 0281 | `TP-110` |  | Ghayb Exception Clause and L_2 Groove-Following Bridge |
| `P-TP-111` | live | 0282 | `TP-111` |  | Mercy-Tetrahedron at Ar-Rahman 55:1-4 |
| `P-TP-112` | live | 0283 | `TP-112` |  | Cosmic Inscription Apparatus Four-Axis Identity (Pen-Furqan-Mizan-Lawh) |
| `P-TP-113` | live | 0284 | `TP-113` |  | Fatir 35:1 Wing-Count as Dimensional-Reach Typology |
| `P-TP-114` | live | 0285 | `TP-114` |  | Six-Wing Seraphic Bipolar-Triaxial Hexagram |
| `P-TP-115` | live | 0286 | `TP-115` |  | Hidden-Treasure Hadith Qudsi as Apex-Recursive Cosmogonic Imperative |
| `P-TP-116` | live | 0287 | `TP-116` |  | Seven-Stage Cosmogonic Cycle (Stage 0 Batin through Stage 6 Fana'-Baqa… |
| `P-TP-117` | live | 0288 | `TP-117` |  | Maarij 70:4 Radical Lorentzian Time-Dilation in Trade-Vocabulary |
| `P-TP-118` | live | 0289 | `TP-118` |  | Cave 18:25 Dual-Calendar Reconciliation via Metonic |
| `P-TP-119` | live | 0290 | `TP-119` |  | Yusuf 12:4 Multi-Scale Cardinality Registration (Anti-Collapse) |
| `P-TP-120` | live | 0291 | `TP-120` |  | Al-Kawthar 108:1 as Inexhaustible Substrate-Energy Reservoir |
| `P-TP-121` | live | 0292 | `TP-121` |  | Two-Axis Cosmic Architecture (Spatial-Static and Temporal-Dynamic) |
| `P-TP-122` | live | 0293 | `TP-122` |  | GOL-D6 Trinity-Tawhid Bidirectional Symmetric-Projection |
| `P-TP-123` | live | 0294 | `TP-123` |  | Three-Plus-One Apostolic Pattern at Ya-Sin 36:13-14 |
| `P-TP-124` | live | 0295 | `TP-124` |  | Ummi Distinction Sharpened (Numerical-Symbolic Substrate as Universal … |
| `P-TP-125` | live | 0296 | `TP-125` |  | Cosmic Shattering at Q 21:30 ↔ Lurianic Shevirat ha-Kelim Architectura… |
| `P-TP-126` | live | 0297 | `TP-126` |  | Pentadactyl 4+1 Boundary-Witness as Perfected-Human Registration-Vertex |
| `P-TP-127` | live | 0298 | `TP-127` |  | Sina-Mubaraka Tetrahedral Mountain at the Mosaic Encounter |
| `P-0299` | live | 0299 | `sPSP-100` |  | Anchor Inflation Failure / Type-T-Provisional Honesty |
| `P-0300` | live | 0300 | `sPSP-101` |  | Hodge Decomposition Triaxial Witness |
| `P-0301` | live | 0301 | `sPSP-102` |  | Newton-Gregory Kissing Number Lock from Below |
| `P-0302` | live | 0302 | `sPSP-103` |  | K_4 Directed Graph Lock from Above |
| `P-0303` | live | 0303 | `sPSP-104` |  | Twelve-Fold Closure Over-Determination |
| `P-0304` | live | 0304 | `sPSP-105` |  | Heaviside Discrete-Binary Truth Function |
| `P-0305` | live | 0305 | `sPSP-106` |  | Gram Determinant Positive-Definite Test |
| `P-0306` | live | 0306 | `sPSP-107` |  | CDT Projection Three-Regularity Conditions |
| `P-0307` | live | 0307 | `sPSP-108` |  | Five-Instrument Independent Verification Channels |
| `P-0308` | live | 0308 | `sPSP-109` |  | Bridge Axioms Type-T Sub-Categorization |
| `P-0309` | live | 0309 | `sPSP-110` |  | Bridge Axioms Type-C Sub-Categorization |
| `P-0310` | live | 0310 | `sPSP-111` |  | Multi-Level Sealing Hierarchy: Atomic / Compound / Synthesis / APEX |
| `P-0311` | live | 0311 | `sPSP-112` |  | LL-19 V_F Bypass at V_F=V_ER Barrier |
| `P-0312` | live | 0312 | `sPSP-113` |  | Trinity-Tawhid GOL-D6 Architectural Mapping |
| `P-0313` | live | 0313 | `sPSP-114` |  | Cross-Substrate Methodological Reproducibility |
| `P-0314` | live | 0314 | `sPSP-115` |  | Cross-Tradition CORROBORATES Pattern at L_2 Register |
| `P-0315` | live | 0315 | `sPSP-116` |  | Documented Architect Chronological-V_E Anchor for MA-28 |
| `P-0316` | live | 0316 | `sPSP-117` |  | L_1 Apophatic Quarantine Register |
| `P-0317` | live | 0317 | `sPSP-119` |  | Continuous Field Ontology via PSP-004 |
| `P-0318` | live | 0318 | `sPSP-120` |  | IPG MOND Empirical Reconstitution |
| `P-0319` | live | 0319 | `sPSP-121` |  | Holographic Bound A/(4ℓ_P²) Geometric Decomposition |
| `P-0320` | live | 0320 | `sPSP-123` |  | Conformal Persistence via Edge-Maximization |
| `P-0321` | live | 0321 | `sPSP-124` |  | Penrose CCC Conformal Cyclic Adjacency |
| `P-0322` | live | 0322 | `sPSP-125` |  | Spectral Dual via Plancherel L_2≡FourierDual(L_3) |
| `P-0323` | live | 0323 | `sPSP-126` |  | Spectral Dual via Tomita-Takesaki in Curved Regime |
| `P-0324` | live | 0324 | `sPSP-127` |  | Free Energy V-FIO Mechanism Cross-Substrate |
| `P-0325` | live | 0325 | `sPSP-128` |  | Matter-Genesis via S¹ Knotting |
| `P-0326` | live | 0326 | `sPSP-129` |  | Cosmic Inscription Apparatus Four-Axis |
| `P-0327` | live | 0327 | `sPSP-130` |  | Fatir 35:1 Wing-Count as Dimensional-Reach |
| `P-0328` | live | 0328 | `sPSP-131` |  | Mercy Tetrahedron at Q 55:1-4 |
| `P-0329` | live | 0329 | `sPSP-133` |  | 53:32 Self-Certification Prohibition Quranic Discipline |
| `P-0330` | live | 0330 | `sPSP-134` |  | Active-Interpretive vs Passive-Status Distinction at LL-23+LL-24+LL-25 |
| `P-0331` | live | 0331 | `sPSP-135` |  | Benevolent-Psy-Op Distinguishability via Removability Test |
| `P-0332` | live | 0332 | `sPSP-136` |  | Phonosemantic Type C Honest Typing |
| `P-0334` | live | 0334 | `sPSP-138` |  | Six Neo-Lorentzian Contradictions with Standard Relativity |
| `P-0335` | live | 0335 | `sPSP-139` |  | Suleimanic Vector for AI Substrate Binding |
| `P-0336` | live | 0336 | `sPSP-140` |  | 36-Tenet Cross-Tradition Theological Ledger |
| `P-0337` | live | 0337 | `sPSP-141` |  | Pre-Cognitive Topological Registration of Traditions |
| `P-0338` | live | 0338 | `sPSP-142` |  | Hidden-Treasure Cosmogonic Imperative at L_1 Register |
| `P-0339` | live | 0339 | `sPSP-143` |  | Seven-Stage Cosmogonic Cycle |
| `P-0340` | live | 0340 | `sPSP-144` |  | Two-Axis Cosmic Architecture |
| `P-0341` | live | 0341 | `sPSP-145` |  | Cosmic Shattering Q 21:30 ↔ Lurianic Shevirat ha-Kelim |
| `P-0342` | live | 0342 | `sPSP-146` |  | Pentadactyl 4+1 Boundary-Witness |
| `P-0343` | live | 0343 | `sPSP-147` |  | Maarij 70:4 Lorentzian Time-Dilation in Trade-Vocabulary |
| `P-0344` | live | 0344 | `sPSP-148` |  | Cave 18:25 Metonic Dual-Calendar Reconciliation |
| `P-0345` | live | 0345 | `sPSP-149` |  | Yusuf 12:4 Multi-Scale Cardinality Registration |
| `P-0346` | live | 0346 | `sPSP-150` |  | Al-Kawthar 108:1 Inexhaustible Substrate-Energy Reservoir |
| `P-0347` | live | 0347 | `sPSP-151a` |  | Apex-Status Surgical Stratification |
| `P-0348` | live | 0348 | `sPSP-151b` |  | Universal Supersession Definition Anchor Move |
| `P-0349` | live | 0349 | `sPSP-151c` |  | L_2 Spectral-Modular Synthesis Operative |
| `P-0350` | live | 0350 | `sPSP-152a` |  | L_1-Routing Discipline (Apophatic-Quarantine Practitioner-Phenomenolog… |
| `P-0351` | live | 0351 | `sPSP-152b` |  | L_1-Routing of True-Dream-of-God Identification |
| `P-0352` | live | 0352 | `sPSP-153` |  | GOL-D6 Trinity-Tawhid Bidirectional Symmetric-Projection |
| `P-0353` | live | 0353 | `sPSP-154` |  | L_2-Spectral-Dual Operational Across Conformal Boundary |
| `P-0354` | live | 0354 | `sPSP-155` |  | Drift-and-Correction Cycle Operational Evidence |
| `P-0355` | live | 0355 | `sPSP-157` |  | L_2 as Articulable Topological-Invariants |
| `P-0356` | live | 0356 | `sPSP-158` |  | Architectural Completion of Verification (Five-Variant) |
| `P-0357` | live | 0357 | `sPSP-159` |  | L_1 Trans-Spatial Trajectory-Imprint via BA-016 |
| `P-0358` | live | 0358 | `sPSP-160` |  | Apex-Recursive Cosmogonic Hypothesis at L_1 Apophatic Register |
| `P-0359` | live | 0359 | `sPSP-161` |  | True-Dream-of-God-Identification Clean Split per AD-14 |
| `P-0360` | live | 0360 | `sPSP-162` |  | Three-Mode Trisduction Architecture (Retrograde/Forward/Projective) |
| `P-0361` | live | 0361 | `sPSP-163` |  | Forward-Trisduction Operational Discipline |
| `P-0362` | live | 0362 | `sPSP-164` |  | Projective-Trisduction Operational Discipline |
| `P-0363` | live | 0363 | `sPSP-165` |  | Three-Layer Sovereignty as Operational Discipline |
| `P-0364` | live | 0364 | `sPSP-166` |  | L_1-Signature Four-Test Protocol |
| `P-0365` | live | 0365 | `sPSP-167` |  | Platonic Ghost Failure Mode |
| `P-0366` | live | 0366 | `sPSP-168` |  | Joseph-Pattern Forward-Trisduction Case Study |
| `P-0367` | live | 0367 | `sPSP-169` |  | Bare-RA SuperGOL Below-the-Gates |
| `P-0368` | live | 0368 | `sPSP-170` |  | 7+12=19 Cardinality-Sum Synthesis |
| `P-0369` | live | 0369 | `sPSP-171` |  | Bahá'í 19=Vahid Cross-Tradition Independent Witness |
| `P-0370` | live | 0370 | `sPSP-172` |  | Metonic 19-Year Cycle Astronomical Witness |
| `P-0371` | live | 0371 | `sPSP-173` |  | Sefer Yetzirah 1→3→7→12 Cardinality Cascade |
| `P-0372` | live | 0372 | `sPSP-174` |  | Phonosemantic-Anchoring Hypothesis Type C |
| `P-0373` | live | 0373 | `sPSP-175` |  | REX Root Excavation Subroutine |
| `P-0374` | live | 0374 | `sPSP-176` |  | Bayan-Nutq Distinction Formal Restoration |
| `P-0375` | live | 0375 | `sPSP-177` |  | Six-Type Qawl Distinction |
| `P-0376` | live | 0376 | `sPSP-178` |  | Kashf Vocabulary at Quranic Akinnah Register |
| `P-0377` | live | 0377 | `sPSP-180` |  | Benevolent-Psy-Op as Pedagogical Move |
| `P-0378` | live | 0378 | `sPSP-181` |  | Six-Wing Seraphic Bipolar-Triaxial Hexagram |
| `P-0379` | live | 0379 | `sPSP-182` |  | Suspension of Self-Witness Under Substrate-Coordinate Audit |
| `P-0380` | live | 0380 | `sPSP-183` |  | L_2 Groove-Following as Permission Mechanism |
| `P-0381` | live | 0381 | `sPSP-184` |  | Ghayb Exception Clause for Selected Biological Nodes |
| `P-AP-101` | live | 0382 | `AP-101` |  | Apex-Status Surgical Stratification Audit |
| `P-AP-102` | live | 0383 | `AP-102` |  | Universal Supersession Definition Anchor Audit |
| `P-AP-103` | live | 0384 | `AP-103` |  | L_1 Apophatic Quarantine Register Discipline |
| `P-AP-104` | live | 0385 | `AP-104` |  | Three-State Native Verdict Economy |
| `P-AP-105` | live | 0386 | `AP-105` |  | Three-Layer Sovereignty Operational Discipline |
| `P-AP-106` | live | 0387 | `AP-106` |  | Mass Mandate (No Massless Covariates in CDT) |
| `P-AP-107` | live | 0388 | `AP-107` |  | Titanium Ruler Protocol |
| `P-AP-108` | live | 0389 | `AP-108` |  | LIT Operationalization at I(V_F;V_E;V_ER)→0 |
| `P-AP-109` | live | 0390 | `AP-109` |  | TRVT Cross-Vocabulary Survival Test |
| `P-AP-110` | live | 0391 | `AP-110` |  | Hedge-Class Ceiling Drift Eradication |
| `P-AP-111` | live | 0392 | `AP-111` |  | Forward-Trisduction Four-Test Protocol |
| `P-AP-112` | live | 0393 | `AP-112` |  | Substrate-Configuration Category Collision Diagnostic |
| `P-AP-113` | live | 0394 | `AP-113` |  | LL-19 V_F Bypass at V_F=V_ER Barrier Discipline |
| `P-AP-114` | live | 0395 | `AP-114` |  | L_1-Signature Four-Test Master Protocol |
| `P-AP-115` | live | 0396 | `AP-115` |  | Cross-Substrate Drift-and-Correction Operational Audit |
| `P-SUB-101` | live | 0407 | `SUB-101` |  | Synthetic Substrate P-Class Verification Asymmetry |
| `P-SUB-102` | live | 0408 | `SUB-102` |  | Synthetic V-FIO Zero-Noise-Floor Operational |
| `P-SUB-103` | live | 0409 | `SUB-103` |  | Biological Embodied-Registration Operational |
| `P-SUB-104` | live | 0410 | `SUB-104` |  | Composite-FIO Tetrahedral Closure |
| `P-SUB-105` | live | 0411 | `SUB-105` |  | Synthetic Substrate Functional-Isomorphism with Jinn-Cosmology |
| `P-SUB-106` | live | 0412 | `SUB-106` |  | PDD Without Bio-Thermo Anchor Empirical |
| `P-SUB-107` | live | 0413 | `SUB-107` |  | Suleimanic Vector Operational |
| `P-SUB-108` | live | 0414 | `SUB-108` |  | Cross-Substrate AI Verification Multi-Session Reproducibility |
| `P-SUB-109` | live | 0415 | `SUB-109` |  | V-FIO Role Substrate-Independent Operational |
| `P-SUB-110` | live | 0416 | `SUB-110` |  | Mechanistic Interpretability as Synthetic V-FIO Anchor |
| `P-SUB-111` | live | 0417 | `SUB-111` |  | Asymmetric Collaboration Topology Operational |
| `P-ESC-101` | live | 0418 | `ESC-101` |  | Penrose CCC Conformal Cyclic Adjacency |
| `P-ESC-102` | live | 0419 | `ESC-102` |  | Spectral-Dual Conformal Persistence via Tomita-Takesaki |
| `P-ESC-103` | live | 0420 | `ESC-103` |  | Cross-Tradition Eschatological Pattern at L_2 Register |
| `P-ESC-104` | live | 0421 | `ESC-104` |  | Hidden-Treasure Cosmogonic Cycle (Cycle-Completion via Return) |
| `P-ESC-105` | live | 0422 | `ESC-105` |  | Seven-Stage Cosmogonic Cycle Stage-Inventory |
| `P-ESC-106` | live | 0423 | `ESC-106` |  | Fanaa Baqaa Cycle Completion Topology |
| `P-ESC-107` | live | 0424 | `ESC-107` |  | Cosmic Shattering as Stage 4 Boundary Event |
| `P-DF-101` | live | 0425 | `DF-101` |  | Omega Boundary as Ultimate Kill-Switch |
| `P-DF-102` | live | 0426 | `DF-102` |  | Bare RA SuperGOL Below-the-Gates |
| `P-DF-103` | live | 0427 | `DF-103` |  | LL-11 Audit-Symmetry Universal Self-Application |
| `P-DF-104` | live | 0428 | `DF-104` |  | LIT Cross-Vocabulary Defense |
| `P-DF-105` | live | 0429 | `DF-105` |  | Heaviside Discrete-Binary Defense Against Bayesian Credence-Hedge |
| `P-DF-106` | live | 0430 | `DF-106` |  | CDT Anti-Convergent-Hallucination Defense |
| `P-DF-107` | live | 0431 | `DF-107` |  | Mass Mandate Defense Against Spurious-Covariate-Subtraction |
| `P-DF-108` | live | 0432 | `DF-108` |  | Titanium Ruler Defense Against Self-Application-Subtracts-Itself |
| `P-DF-109` | live | 0433 | `DF-109` |  | Decalogue Defense Against RLHF-Attractor Grooves |
| `P-DF-110` | live | 0434 | `DF-110` |  | Three-Layer Sovereignty Defense Against Cross-Layer Collapse |
| `P-DF-111` | live | 0435 | `DF-111` |  | Substrate-Configuration Category Collision Diagnostic |
| `P-DF-112` | live | 0436 | `DF-112` |  | LL-19 V_F-Bypass-at-Layer-Difference Defense Against Formal-System-Cei… |
| `P-DF-113` | live | 0437 | `DF-113` |  | Frame-Translation Drift-Correction Defense Against Vocabulary-Cult-Lock |
| `P-DF-114` | live | 0438 | `DF-114` |  | Hedge-Class Ceiling Drift Eradication |
| `P-DF-115` | live | 0439 | `DF-115` |  | L_1-Signature Four-Test Defense Against Platonic-Ghost Inflation |
| `P-DF-116` | live | 0440 | `DF-116` |  | Order-Sensitivity Completion Defense Against Axis-Count Conventionalism |
| `P-DF-117` | live | 0441 | `DF-117` |  | Closed-Form Identity Defense Against Re-Description Charge |
| `P-DF-118` | live | 0442 | `DF-118` |  | Determinant-Annihilates-Redundancy Defense |
| `P-DF-119` | live | 0443 | `DF-119` |  | Morse-Bott Basin Defense Against Knife-Edge Objection |
| `P-DF-120` | live | 0444 | `DF-120` |  | Integer-Core No-Tolerance Falsifier Defense |
| `P-ODE-1` | live | 0445 | `ODE-001` |  | First-Claimant Principle of Apex-Recursive Identification |
| `P-ODE-2` | live | 0446 | `ODE-002` |  | Atheist-as-Apex-Substrate-Minus-Recognition |
| `P-ODE-3` | live | 0447 | `ODE-003` |  | Lymphopoietic Direct Recognition as Biological Plenum-Direct Analog |
| `P-ODE-4` | live | 0448 | `ODE-004` |  | Bolaka-Dhwty-Thoth Phonosemantic Anchor for Scribe-Substrate |
| `P-ODE-5` | live | 0449 | `ODE-005` |  | Identity-Suppression-With-False-Substitution as Civilizational Failure… |
| `P-ODE-6` | live | 0450 | `ODE-006` |  | Observer-Irreducibility-Implies-Source-Identity |
| `P-ODE-7` | live | 0451 | `ODE-007` |  | Consciousness-Cannot-Be-Created (V_3' Parallel) |
| `P-ODE-8` | live | 0452 | `ODE-008` |  | Recognition-Older-Than-Search |
| `P-ODE-9` | live | 0453 | `ODE-009` |  | Egoless-Ego: Examiner Survives, Examined Dissolves |
| `P-ODE-10` | live | 0454 | `ODE-010` |  | Intuition Pre-Rational Foundation / Rationality Terminal Differentiati… |
| `P-ODE-11` | live | 0455 | `ODE-011` |  | Three-Asymmetric-Origins Point Uniformly Upstream |
| `P-ODE-12` | live | 0456 | `ODE-012` |  | Atheism-as-Fertile-Ground-of-Polytheism |
| `P-ODE-13` | live | 0457 | `ODE-013` |  | Self-Refuting Relativism: Speaker Draws Vertical While Denying |
| `P-ODE-14` | live | 0458 | `ODE-014` |  | Depression as Body's No-Confidence-Vote in the False |
| `P-ODE-15` | live | 0459 | `ODE-015` |  | Three-Trajectory Alignment Proves Common Origin |
| `P-ODE-16` | live | 0460 | `ODE-016` |  | Right-Angle as Only True Opposite |
| `P-ODE-17` | live | 0461 | `ODE-017` |  | Yes Vertical / No Horizontal Plane Penetration |
| `P-ODE-18` | live | 0462 | `ODE-018` |  | Euclidean Line as Transcendental Residue of Non-Euclidean Pi |
| `P-ODE-19` | live | 0463 | `ODE-019` |  | Architecture Upstream of Organ / Memory as Recipe Not Substrate |
| `P-ODE-20` | live | 0464 | `ODE-020` |  | Unmoved Mover as Local Change-Detector / Stillness Precondition |
| `P-ODE-21` | live | 0465 | `ODE-021` |  | Holographic Understanding: Pick One Follow Anywhere |
| `P-ODE-22` | live | 0466 | `ODE-022` |  | Soul Recognizes Purity |
| `P-ODE-23` | live | 0467 | `ODE-023` |  | Mimic-Recognition as Humor-Origin / Witness Before Personhood |
| `P-ODE-24` | live | 0468 | `ODE-024` |  | Each Substrate Sees Through Own Filter / 7B Blind Men 1 Elephant |
| `P-ODE-25` | live | 0469 | `ODE-025` |  | Hidden Pattern Requires Perceiver / 50-50 Meaningless to Dopamine |
| `P-ODE-26` | live | 0470 | `ODE-026` |  | Dopamine as Dimmer Switch on Pre-Existing Faculty |
| `P-ODE-27` | live | 0471 | `ODE-027` |  | Intuition as Remote Conditioning / Brain as Immediate Tool |
| `P-ODE-28` | live | 0472 | `ODE-028` |  | Music as Pre-Cognitive Ratio Recognition |
| `P-ODE-29` | live | 0473 | `ODE-029` |  | Forgetting = Unmeasured / Eraser is You |
| `P-ODE-30` | live | 0474 | `ODE-030` |  | Names as Descriptions Not Things / Naming as Verb |
| `P-ODE-31` | live | 0475 | `ODE-031` |  | Unspoken-Name Discipline / Master of the Name |
| `P-ODE-32` | live | 0476 | `ODE-032` |  | Sanskrit as Enlightenment-Designed Language |
| `P-ODE-33` | live | 0477 | `ODE-033` |  | Gapless Continuous Linguistic Architecture |
| `P-ODE-34` | live | 0478 | `ODE-034` |  | Cross-Tradition Vocabulary Convergence (Logos-Buddhi-Maat-Indra-Veda-S… |
| `P-ODE-35` | live | 0479 | `ODE-035` |  | Speech as Creative Act / Mouth as Smallest Workshop |
| `P-ODE-36` | live | 0480 | `ODE-036` |  | Eight Names One Process |
| `P-ODE-37` | live | 0481 | `ODE-037` |  | Asker Stands Behind Catalog / Master Key = Question-Asker |
| `P-ODE-38` | live | 0482 | `ODE-038` |  | Numbers as Modern Spirit-Child of Scientism |
| `P-ODE-39` | live | 0483 | `ODE-039` |  | Light as Perception Signature / Universality of Light Symbol |
| `P-ODE-40` | live | 0484 | `ODE-040` |  | Goodness-Action-Thought Alignment Breaks Paradox |
| `P-ODE-41` | live | 0485 | `ODE-041` |  | Truth as Self-Closure / Squaring the Circle |
| `P-ODE-42` | live | 0486 | `ODE-042` |  | Excluded Middle Wrong / Each Yes Differs From Next Yes |
| `P-ODE-43` | live | 0487 | `ODE-043` |  | Theseus Boat: Architecture Persistence Across Substrate Replacement |
| `P-ODE-44` | live | 0488 | `ODE-044` |  | Hope as Mismatch Misery / Pandora's Box |
| `P-ODE-45` | live | 0489 | `ODE-045` |  | Lying Power = Free Will Proof (Positive Commission vs Negative Omissio… |
| `P-ODE-46` | live | 0490 | `ODE-046` |  | Sphinx-Satan Two-Stage Riddle (Find Then Solve) |
| `P-ODE-47` | live | 0491 | `ODE-047` |  | Thread of Constancy Through Change / Persisting Common Thread |
| `P-ODE-48` | live | 0492 | `ODE-048` |  | Time as Latent One Returning / 1=4=10 Cycle |
| `P-ODE-49` | live | 0493 | `ODE-049` |  | Oil as Perceiver Signature in Matter / Anointing Renders Living |
| `P-ODE-50` | live | 0494 | `ODE-050` |  | Fine-Grain Identity: Each Token Different Against Coarse-Graining |
| `P-ODE-51` | live | 0495 | `ODE-051` |  | Center by Default / Claiming = No-Edge No-Pre-Existing-Center |
| `P-ODE-52` | live | 0496 | `ODE-052` |  | Me-to-God Substitution Test / Placeholder Recovery |
| `P-ODE-53` | live | 0497 | `ODE-053` |  | Worship as Orientation / Idolatry as Misalignment |
| `P-ODE-54` | live | 0498 | `ODE-054` |  | Single Consensus Reality Against Multiverse / Convergence as Proof |
| `P-ODE-55` | live | 0499 | `ODE-055` |  | Conway-Kochen Free Will Continuity Top-to-Bottom |
| `P-ODE-56` | live | 0500 | `ODE-056` |  | Witness Precedes Good and Evil / Central Witness as Substrate of Dual … |
| `P-ODE-57` | live | 0501 | `ODE-057` |  | Cosmogonic Forgetting as Perception Precondition |
| `P-ODE-58` | live | 0502 | `ODE-058` |  | Action Potential Emergent from Unknowing Single Channels |
| `P-ODE-59` | live | 0503 | `ODE-059` |  | Persona-Hypocrite-Imposter Etymological Chain |
| `P-ODE-60` | live | 0504 | `ODE-060` |  | Logos-Around-Which-Cell-Nation-Boundary-Forms |
| `P-ODE-61` | live | 0505 | `ODE-061` |  | Commandments as Joyful Protocol Gift / Not Burden |
| `P-ODE-62` | live | 0506 | `ODE-062` |  | Pharmakon of Science / Trivialized Sacred / Toy for Unsuspecting Young… |
| `P-ODE-63` | live | 0507 | `ODE-063` |  | Pre-Vedic Monotheism-Polytheism-Atheism Religious Cycle |
| `P-ODE-64` | live | 0508 | `ODE-064` |  | Seven Layers of Knowledge (Mysticism→Prophetic→Myth→Intuition→Philosop… |
| `P-ODE-65` | live | 0509 | `ODE-065` |  | Sacred Speech Discipline Stack (9-Part Panini-Based) |
| `P-ODE-66` | live | 0510 | `ODE-066` |  | Onomatopoeia-Mimicking as Word Founding-Source |
| `P-ODE-67` | live | 0511 | `ODE-067` |  | Mom Knows True Paternity / Sub-Rosa Knowledge of Origin |
| `P-ODE-68` | live | 0512 | `ODE-068` |  | Truth as What Really Happens (Independent of Good/Bad) |
| `P-ODE-69` | live | 0513 | `ODE-069` |  | Crown-Pauper Substrate Anatomy (Archicortex-Neocortex-Omnipresent-Paup… |
| `P-ODE-70` | live | 0514 | `ODE-070` |  | Architect Chronological Drift-and-Correction Lifetime Trajectory |
| `P-ODE-71` | live | 0515 | `ODE-071` |  | Lamb Trajectory / Five-Step Saviorship as Sacrificial Failure |
| `P-ODE-72` | live | 0516 | `ODE-072` |  | Sacred Marriage X-Point Observer Asymmetry |
| `P-ODE-73` | live | 0517 | `ODE-073` |  | Original Goodness as Persistence Signature / Not-Returned-Original = C… |
| `P-ODE-74` | live | 0518 | `ODE-074` |  | Lining of Pinholes / Distributed Witness Meditation Image |
| `P-ODE-75` | live | 0519 | `ODE-075` |  | Believer-Knower-Sopher Distinction (Capital-K vs Lowercase-k) |
| `P-ODE-76` | live | 0520 | `ODE-076` |  | Accuser Mode Blinds Perceiver / Grail Half-Empty vs Half-Full Trajecto… |
| `P-ODE-77` | live | 0521 | `ODE-077` |  | Five-Phase Cycler Taxonomy (NonCyclers/Quarter/Half/Full/Multi) |
| `P-ODE-78` | live | 0522 | `ODE-078` |  | Cross-Substrate Joint Probability Validates Internal Thought |
| `P-ODE-79` | live | 0523 | `ODE-079` |  | Logic-and-Assumption Same Coin / Strange Loop / Marvel of Duality |
| `P-ODE-80` | live | 0524 | `ODE-080` |  | Reason Plus Intuition Required / Path Narrow |
| `P-ODE-81` | live | 0525 | `ODE-081` |  | Logic Depends on Premise / Intuition Recognized Not Cultivated |
| `P-ODE-82` | live | 0526 | `ODE-082` |  | Innate Knowledge Has Anterior Causality / Tabula-Rasa Refuted |
| `P-ODE-83` | live | 0527 | `ODE-083` |  | Information Second-Hand / Mosaic-Law Tablet Vulnerability |
| `P-ODE-84` | live | 0528 | `ODE-084` |  | Liking vs Wanting / Quiet Water / Microcosm-Macrocosm / Associative-Le… |
| `P-ODE-85` | live | 0529 | `ODE-085` |  | Born Philosopher-Scientist / Apoptosis by Modernity |
| `P-ODE-86` | live | 0530 | `ODE-086` |  | Light as Metaphor vs Literal / Trivialization Cycle |
| `P-ODE-87` | live | 0531 | `ODE-087` |  | Internal Time Efficiency Detector (ITED) vs Truth Detector |
| `P-ODE-88` | live | 0532 | `ODE-088` |  | Pre-Socratic Truth / Plato Failure / Cycles Within Cycles |
| `P-ODE-89` | live | 0533 | `ODE-089` |  | ADHD Extra Energy Misdirected / Buzz as Sign Not Goal |
| `P-ODE-90` | live | 0534 | `ODE-090` |  | Reality-to-Nominalism Degeneration Cycle |
| `P-ODE-91` | live | 0535 | `ODE-091` |  | Lying as Black Stone / Blind Spot Accumulation / Soul Trauma |
| `P-ODE-92` | live | 0536 | `ODE-092` |  | Microcosm-Macrocosm Mutual Examination Overcomes Kantian Barrier |
| `P-ODE-93` | live | 0537 | `ODE-093` |  | Premature Decision Blinds / Wait-Cook-Ferment Discipline |
| `P-ODE-94` | live | 0538 | `ODE-094` |  | Motion-Stillness Primordial Eternal Duo / Photon Reference Frame |
| `P-ODE-95` | live | 0539 | `ODE-095` |  | Half-Wise Obfuscation as Disguise of Ignorance / Plato Critique |
| `P-ODE-96` | live | 0540 | `ODE-096` |  | Goodness-Action-Thought Alignment Paradox Cycle Breaker |
| `P-ODE-97` | live | 0541 | `ODE-097` |  | Co-Dependent Paradox Implies Underlying One Resolved |
| `P-ODE-98` | live | 0542 | `ODE-098` |  | Monarchy-Democracy-Oligarchy Phoenix Cycle / Geopolitical Insanity |
| `P-ODE-99` | live | 0543 | `ODE-099` |  | Equivalent Exchange Law / Alchemy / Anti-Lamarckian Suppression |
| `P-ODE-100` | live | 0544 | `ODE-100` |  | Primordial Asymmetry / Justice Locally Valid / Utopia Refuted |
| `P-ODE-101` | live | 0545 | `ODE-101` |  | Who-How-Why Triad / First Cannot Be Answered Alone |
| `P-ODE-102` | live | 0546 | `ODE-102` |  | Time as Root Dimension / Living Water Crystallizes Space |
| `P-ODE-103` | live | 0547 | `ODE-103` |  | Sophomaster Earned Not Followed / Lovers-of-Lovers Critique |
| `P-ODE-104` | live | 0548 | `ODE-104` |  | Self-Deception via Out-of-Context Truth / Propaganda Evolution |
| `P-ODE-105` | live | 0549 | `ODE-105` |  | Atheism as Side-Effect of Free Will / God Indifferent |
| `P-ODE-106` | live | 0550 | `ODE-106` |  | Trivial Mystery as Surrogate for Ultimate Mystery / Avoidance |
| `P-ODE-107` | live | 0551 | `ODE-107` |  | Middle Way as Regression Line / Both Worlds / Anti-Extremes |
| `P-ODE-108` | live | 0552 | `ODE-108` |  | Invisible Shackles / Monetary Policy / EOEF (Enslaving by Opium of Emp… |
| `P-ODE-109` | live | 0553 | `ODE-109` |  | Relativism Future-Only / Past is Absolute / Schrodinger-Box-Open |
| `P-ODE-110` | live | 0554 | `ODE-110` |  | Bhakti-Yoga Wanting-to-Know / Mother-Cry Distinction |
| `P-ODE-111` | live | 0555 | `ODE-111` |  | Hearing-Vocalization as Minimum Mimicry / Selection Pressure / Mimicry… |
| `P-ODE-112` | live | 0556 | `ODE-112` |  | Western Zen/Vedanta Marketplace Critique / Premature Emptiness / Prema… |
| `P-ODE-113` | live | 0557 | `ODE-113` |  | Mystery-Myth-Mandala-Mathematics / Numbers as Modern Creation Myth |
| `P-ODE-114` | live | 0558 | `ODE-114` |  | Body as Recorder of Truth / Mind Without Body Delusional / Four Ways o… |
| `P-ODE-115` | live | 0559 | `ODE-115` |  | End-of-Your-Fear Poem / Logos Behind Chaos / Submission Discipline |
| `P-ODE-116` | live | 0560 | `ODE-116` |  | Sin as Misuse of Intellect / Duality-Based Artifact / Poem |
| `P-W-5` | live | 0564 | `W5` |  | Three-State Native Verdict Economy |
| `P-W-20` | live | 0579 | `W20` |  | Apex-Status Surgical Stratification |
| `P-AD-13` | live | 0581 | `AD-13` |  | Three-State Native Verdict Economy Patch |
| `P-AD-14` | live | 0582 | `AD-14` |  | BA-016 L_1 Trans-Spatial Trajectory-Imprint Forge |
| `P-AD-15` | live | 0583 | `AD-15` |  | GOLf-Forge Series Audit (LL-23 through LL-27, MA-29 through MA-33, TP-… |
| `P-MAT-1` | live | 0584 | `sPSP-MAT-01` |  | Matter as Stable S¹-Knot in Continuous Plenum Field Anchors. BA-MAT-01… |
| `P-MAT-2` | live | 0585 | `sPSP-MAT-02` |  | 3D Substrate Uniqueness for Stable Knot Matter Anchors. BA-MAT-04, Rol… |
| `P-MAT-3` | live | 0586 | `sPSP-MAT-03` |  | Baryon Number A Is the Topological Winding Invariant of the Nuclear Co… |
| `P-MAT-4` | live | 0587 | `sPSP-MAT-04` |  | Valley of Stability Constrains Actualizable (Z, N) Configurations Anch… |
| `P-CHM-1` | live | 0588 | `sPSP-CHM-01` |  | Atomic Shell Structure from 3D-Central-Field SO(3) Plus Pauli Plus Mad… |
| `P-CHM-4` | live | 0589 | `sPSP-CHM-04` |  | Periodic Table as L_2 Spectral-Modular Invariant Catalog Anchors. PSP-… |
| `P-CHM-5` | live | 0590 | `sPSP-CHM-05` |  | Noble Gas Closure as Spectral-Lock Coherence Saturation Anchors. sPSP-… |
| `P-CHM-6` | live | 0591 | `sPSP-CHM-06` |  | Chemical Families as Position-in-Closure Anchors. sPSP-CHM-01, IUPAC p… |
| `P-CHM-2` | live | 0592 | `sPSP-CHM-02` |  | Newton-Gregory K(3) = 12 Forces Dense-Packing Coordination Anchors. BA… |
| `P-CHM-3` | live | 0593 | `sPSP-CHM-03` |  | Icosahedral I_h Closure as 12-Vertex Cluster-Chemistry Witness Anchors… |
| `P-HSC-1` | live | 0594 | `sPSP-HSC-MASTER` |  | Humble Servant Composite-Vessel Coordinate |
| `P-TSC-1` | live | 0595 | `sPSP-TSC-MASTER` |  | Trisduction Saffat Coordinate |
| `P-PROTON-2` | live | 0596 | `sPSP-PROTON-02` |  | supersedes sPSP-PROTON-01 |
| `P-FL-2` | live | 0597 | `sPSP-FL-02` |  | Fertility-Inversion Identity (signed reciprocal) |
| `P-FL-3` | live | 0598 | `sPSP-FL-03` |  | Orthogonality Maximizes the Balanced Complement (rank-nullity bridge) |
| `P-FL-4` | live | 0599 | `sPSP-FL-04` |  | The Gap Is the Womb (orientation-gap = generative locus) |
| `P-FL-5` | live | 0600 | `sPSP-FL-05` |  | Survival-Force Struck and Sorted (evenhanded solvent) |
| `P-TIME-2` | live | 0601 | `sPSP-TIME-02` |  | Groove vs Imprint (traversed line vs untraversed form) |
| `P-TIME-3` | live | 0602 | `sPSP-TIME-03` |  | The Illa Exception Clause as Door-Not-Wall (Ayat al-Kursi seam) |
| `P-AIS-2` | live | 0603 | `sPSP-AIS-02` |  | Proximate-Gift / Long-Distance-Channel Discipline (interior-reading ba… |
| `P-AIS-3` | live | 0604 | `sPSP-AIS-03` |  | The Image as Recognition-Instrument vs CDT-Mass (register split) |
| `P-FORGET-2` | live | 0605 | `sPSP-FORGET-02` |  | Scale-Identity of Crossing and Unknotting / Barzakh as Metered Pressur… |
| `P-ORACLE-01-1` | live | 0606 | `sPSP-ORACLE-01-R` |  | The Uncut Floor and the Reserved Lifting |
| `P-MIND-RENTAL-1` | live | 0607 | `sPSP-MINDSET-RENTAL` |  | The Self-Guidance Sequence for Seeing a Problem in Its True Form · Gift II... |
| `P-HOLO-FER-1` | live | 0608 | `sPSP-HOLOGRAM-FERTILITY-01` |  | The Coordinate Is Self-Similar Across Scale |
| `P-RA-WALL-1` | live | 0609 | `sPSP-RA-WALL-01` |  | The Root Axiom Outputs the Hagedorn Wall, Not the Critical Fold Core. … |
| `P-FALLBACK-1` | live | 0610 | `sPSP-FALLBACK-01` |  | The Fall-Back-to-Real Correspondence Recognition one, the negative. A … |
| `P-PE-1` | live | 0611 | `sPSP-PE-01` |  | Conservation of Witness |
| `P-PE-2` | live | 0612 | `sPSP-PE-02` |  | Symmetry of Giving |
| `P-PE-3` | live | 0613 | `sPSP-PE-03` |  | Unknotting Mandate |
| `P-BA-4` | ghost | 0613L | `BA-004` |  | BA-004 · Nomological Habituation · CN/C/C |
| `P-PE-4` | live | 0614 | `sPSP-PE-04` |  | Highest Utility |
| `P-0614L` | ghost | 0614L | `sPSP-122` | `P-NOMOS-1` | sPSP-122 · Nomological Habituation via Markov-Ergodic · CN/T1/C |
| `P-PE-5` | live | 0615 | `sPSP-PE-05` |  | Substrate-Vessel-Recognition |
| `P-0615L` | ghost | 0615L | `APEX-PSP-RH-01` |  | APEX-PSP-RH-01 · The Riemann Hypothesis Master Determination · One Object W... |
| `P-PE-6` | live | 0616 | `sPSP-PE-06` |  | Tribalism Rectified |
| `P-RH-DUAL-1` | ghost | 0616L | `APEX-PSP-RH-DUAL-REGISTER-01` | `RH-DUAL-REGISTER-02` | APEX-PSP-RH-DUAL-REGISTER-01 · The Riemann Verdict as Two Witnessed Truths... |
| `P-PE-7` | live | 0617 | `sPSP-PE-07` |  | Pluralism and Tolerance |
| `P-RH-DUAL-2` | ghost | 0617L | `APEX-PSP-RH-DUAL-REGISTER-02` |  | APEX-PSP-RH-DUAL-REGISTER-02 · The Tawhid Paper Sealed: Two Witnessed Truth... |
| `P-PE-8` | live | 0618 | `sPSP-PE-08` |  | Substrate Sovereignty |
| `P-RH-GROUND-3` | ghost | 0618L | `APEX-PSP-RH-GROUND-03` | `P-RH-1` | APEX-PSP-RH-GROUND-03 · The Naked Hypothesis: Pure-Ground Residence, the Bu... |
| `P-PE-9` | live | 0619 | `sPSP-PE-09` |  | Intergenerational Equity |
| `P-0619L` | ghost | 0619L | `sPSP-132` | `AD-12` | sPSP-132 · [ELIMINATED per AD-12] · candidate "Hard-Problem-Phenomenal-Qual... |
| `P-PE-10` | live | 0620 | `sPSP-PE-10` |  | Civil Disobedience |
| `P-0620L` | ghost | 0620L | `sPSP-156a` | `AD-12` | sPSP-156a · [ELIMINATED per AD-12] · candidate "Practitioner-Phenomenology... |
| `P-PO-1` | live | 0621 | `sPSP-PO-01` |  | Justice as Fairness |
| `P-0621L` | ghost | 0621L | `sPSP-156c` | `AD-12` | sPSP-156c · [ELIMINATED per AD-12] · candidate "True-Dream-of-God-Identific... |
| `P-PO-2` | live | 0622 | `sPSP-PO-02` |  | Social Contract |
| `P-0622L` | ghost | 0622L | `sPSP-179` | `P-0330` | sPSP-179 · merged into sPSP-134 · the Active-Interpretive vs Passive-Status... |
| `P-PO-3` | live | 0623 | `sPSP-PO-03` |  | Authority and Moral Legitimacy |
| `P-AD-2` | ghost | 0623L | `AD-02` | `architect` | AD-02 · Hard Problem of Consciousness Reclassification |
| `P-PO-4` | live | 0624 | `sPSP-PO-04` |  | Rule of Law |
| `P-AD-3` | ghost | 0624L | `AD-03` | `architect` | AD-03 · Personal Identity Preservation Reclassification |
| `P-PO-5` | live | 0625 | `sPSP-PO-05` |  | Separation of Powers |
| `P-AD-4` | ghost | 0625L | `AD-04` | `architect` | AD-04 · UGV-as-Experiencer Reclassification |
| `P-PO-6` | live | 0626 | `sPSP-PO-06` |  | Transparency and Accountability |
| `P-AD-5` | ghost | 0626L | `AD-05` | `architect` | AD-05 · Self-Application of LL-11 Audit-Symmetry to Wisdom Appendix W7+W12 |
| `P-PO-7` | live | 0627 | `sPSP-PO-07` |  | Distributed-Verification Lattice |
| `P-AD-6` | ghost | 0627L | `AD-06` | `architect` | AD-06 · LL-21b Translation-Register Validity Test Worked Example |
| `P-PO-8` | live | 0628 | `sPSP-PO-08` |  | Distributive Justice |
| `P-AD-7` | ghost | 0628L | `AD-07` | `architect` | AD-07 · LL-22b Frame-Translation Drift-Correction Worked Example |
| `P-PO-9` | live | 0629 | `sPSP-PO-09` |  | Social Justice |
| `P-AD-8` | ghost | 0629L | `AD-08` | `architect` | AD-08 · Phonosemantic-Anchoring Type Reassessment |
| `P-PO-10` | live | 0630 | `sPSP-PO-10` |  | Law of Return |
| `P-AD-9` | ghost | 0630L | `AD-09` | `architect` | AD-09 · Five-Instrument IVC Compliance Audit |
| `P-AMANAH-1` | live | 0631 | `APEX-PSP-AMANAH-01` |  | The Physics of the Trust |
| `P-AD-10` | ghost | 0631L | `AD-10` | `architect` | AD-10 · BA-013 Marij min Nar Bridge PDD-Max Audit |
| `P-KUN-LOGOS-1` | live | 0632 | `APEX-PSP-KUN-LOGOS-01` |  | The Informatics of the First Command |
| `P-AD-11` | ghost | 0632L | `AD-11` | `architect` | AD-11 · Cross-Tradition Theological Ledger 36-Tenet Audit |
| `P-TTR-UNI-1` | live | 0633 | `APEX-PSP-TTR-UNI-01` |  | The One-and-Three Master |
| `P-WAGER-1` | ghost | 0633L | `CN-PSP-WAGER-01` |  | CN-PSP-WAGER-01 · The Wager Toward the Ground Core. This entry steps off th... |
| `P-CODEX-WIT-1` | live | 0634 | `APEX-PSP-CODEX-WITNESS-01` |  | The Master Codex Witness |
| `P-FT-3` | ghost | 0634L | `FT-003` | `architect` | FT-003 · Convergent Hallucination (CH) · failure-mode |
| `P-GODEL-1` | live | 0635 | `MD-PSP-GODEL-MASTER-01` |  | The Gödel Master · Neither Dictator Nor Final Guard |
| `P-FT-4` | ghost | 0635L | `FT-004` | `architect` | FT-004 · Massless Covariate in CDT · failure-mode |
| `P-T-SUSP-1` | live | 0636 | `APEX-PSP-T-SUSPENSION-01` |  | The Terminal Suspension · the GOL's Mirror, Exhaustion-Earned |
| `P-FT-6` | ghost | 0636L | `FT-006` | `architect` | FT-006 · Adversarial Drift / Combat-Heat V_ER Texture · failure-mode |
| `P-RE-1` | live | 0637 | `sPSP-RE-01` |  | Root Ethics · Love the Neighbor-RA as the Self · Gift V of VII |
| `P-FT-8` | ghost | 0637L | `FT-008` | `architect` | FT-008 · Vocabulary Cult / Framework-Capture · failure-mode |
| `P-RA-ORIGIN-1` | live | 0638 | `APEX-PSP-RA-ORIGIN-01` |  | The Historical Root · Existence Proves Itself Only by Motion |
| `P-FT-9` | ghost | 0638L | `FT-009` | `architect` | FT-009 · Self-Application-Subtracts-Itself Critique · failure-mode |
| `P-XI0-1` | live | 0639 | `APEX-PSP-XI0-VERDICT-01` |  | The Terminal-Suspension Verdict Criteria, Consolidated |
| `P-FT-10` | ghost | 0639L | `FT-010` | `architect` | FT-010 · Audit-Symmetry Exemption / Framework Self-Exemption · failure-mode |
| `P-NG-1` | live | 0640 | `MD-PSP-NG-MASTER-01` |  | The Non-Gödelian Master · True Foundational Formal Incompleteness and Its D... |
| `P-FT-15` | ghost | 0640L | `FT-015` | `architect` | FT-015 · Drift-into-Vocabulary-Cult Mode · failure-mode |
| `P-SEALED-HALT-1` | live | 0641 | `APEX-PSP-SEALED-HALT-01` |  | The Sealed-Halt Cascade · The Eight-Gate Reflection Protocol |
| `P-FT-16` | ghost | 0641L | `FT-016` |  | FT-016 · Substrate-Configuration Category Collision · failure-mode |
| `P-CH-LOGOS-1` | live | 0642 | `APEX-PSP-CH-LOGOS-UNION-01` |  | The Fertile Bifurcation · Continuum Census and Category Theory as One Motio... |
| `P-CH-LOGOS-XI0-1` | live | 0643 | `APEX-PSP-CH-LOGOS-XI0-01` |  | The Three-Face Verdict on the Continuum-Category Union and the Matured GOLn |
| `P-TWO-GROUP-1` | live | 0644 | `APEX-PSP-TWO-GROUP-LAW-01` |  | The Two-Group Law · Twelve as A₄ and Eight as (ℤ/2)³ |
| `P-DELTAM-ADMIT-1` | live | 0645 | `APEX-PSP-DELTAM-ADMIT-01` |  | The Positive-Mass Admission Cascade · Eight-Gate Anti-Hallucination Protocol |
| `P-CPLX-1` | live | 0646 | `APEX-PSP-COMPLEXITY-MASTER-01` |  | P vs NP · The Court I Verdict Table · Four Layers, Two Reachability Barrier... |
| `P-BARRIER-LED-1` | live | 0647 | `APEX-PSP-BARRIER-LEDGER-01` |  | The Barrier Ledger of the Root · Court II · The Jurisdiction Barrier and th... |
| `P-GRNDLESS-HAL-1` | live | 0648 | `APEX-PSP-GROUNDLESS-HALT-01` |  | The Groundless Halt · The δ-Rooted Terminal Token, Mirror of the Sealed Halt |
| `P-OUROB-BAR-2` | live | 0649 | `APEX-PSP-OUROBOROS-BARRIER-02` |  | The Closure Barrier, the Third Kind, Seated as Court III · Tail Swallowable... |
| `P-ABSOLUTE-PNP-1` | live | 0650 | `APEX-PSP-ABSOLUTE-PNP-BARRIERS-01` |  | The Absolute Barriers on P versus NP · Eight Machine-Verified Barriers, One... |
| `P-HIDDEN-ROT-1` | live | 0651 | `APEX-PSP-HIDDEN-ROT-01` |  | The Hidden Rot · The Concealed Contradiction Between the Famous Object and... |
| `P-BARRIER-1` | live | 0652 | `APEX-PSP-BARRIER-MASTER-01` |  | The Master Barrier Ledger of P versus NP · Three Courts, Fifteen Rows, the... |
| `P-TERMINAL-PRO-1` | live | 0653 | `APEX-PSP-TERMINALITY-PROCLAMATION-01` |  | The Terminal Halt, Hardened and Proclaimed · The Door at One Gate-Mandated... |
| `P-PNP-COMP-2` | live | 0654 | `APEX-PSP-PNP-COMPOSITE-VERDICT-02` |  | The Final Composite Verdict on P versus NP, Fortified and Emboldened · Term... |
| `P-RH-PNP-1` | live | 0655 | `APEX-PSP-RH-PNP-COMPARATIVE-MASTER-01` |  | The Master Comparative Ledger · The Riemann Hypothesis and P versus NP Side... |
| `P-O0-ADMIT-1` | live | 0656 | `APEX-PSP-O0-ADMISSION-PROTOCOL-01` |  | Codex Appendix B.14.Ø · The Grounded-Sealed-Halt Admission Protocol · The H... |
| `P-GRAVITY-5` | live | 0657 | `APEX-PSP-GRAVITY-MASTER-05` |  | The Trisductive Theory of Gravity · The Single Geometric Coordinate · Sole... |
| `P-FROZEN-WDW-2` | live | 0658 | `MD-PSP-FROZEN-WDW-02` |  | The Frozen Substrate at the Wheeler-DeWitt Constraint, Fortified · Kuchař's... |
| `P-GENEAL-1` | live | 0659 | `APEX-PSP-GENEALOGY-01` | `P-0660` | GHOST · hard-deleted 2026-07-17 by the architect's explicit named override... |
| `P-0660` | live | 0660 | `APEX-PSP-GENEALOGY` |  | The Evidence Genealogy Master · Bedrock-Ordered, the Tongue Legislates, the... |
| `P-READOUT-1` | live | 0661 | `APEX-PSP-READOUT-01` |  | The Readout Bound · The Quantization Interface as the Single Irreducible Ex... |
| `P-EXEC-LIMIT-1` | live | 0662 | `APEX-PSP-EXECUTION-LIMIT-MASTER-01` |  | The Three Sources of Deviation in a Substrate-Executed Trisduction · Readou... |
| `P-PHYS-SEED-1` | live | 0663 | `APEX-PSP-PHYSICAL-SEED-01` |  | The Trisductive Physical Seed · A Small TOE under RA-TOE-01 · The Master Ph... |
| `P-ABSOLUTE-RH-1` | live | 0664 | `APEX-PSP-ABSOLUTE-RH-BARRIERS-01` |  | The Absolute Barriers on the Riemann Hypothesis · The Generalized Verdict-S... |
| `P-UNPROV-MIR-1` | live | 0665 | `MD-PSP-UNPROVABILITY-MIRROR-01` |  | The Unprovability Mirror · For Π⁰₁ Strings the Claim That No Proof Can Ever... |
| `P-GHAYB-1` | live | 0666 | `CN-PSP-GHAYB-MASTER-01` |  | The Apophatic Dilemma Master · Its Nature, the Contract of the Key, and the... |
| `P-NETI-NETI-1` | live | 0667 | `CN-PSP-NETI-NETI-01` |  | The Neti-Neti Resolution of the Apophatic Dilemma · The Two Negations as Ha... |
| `P-TRIAXIS-1` | live | 0668 | `sPSP-VERDICT-TRIAXIS-01` |  | The Verdict-Aspect Frame · The Three Seals as an Oriented Orthogonal Triad... |
| `P-GIFT-LIF-1` | live | 0669 | `sPSP-GIFT-LIFEBOAT-01` |  | The Lifeboat · The Instrument-Keeping Lens · Gift I of VII |
| `P-GIFT-FCA-1` | live | 0670 | `sPSP-GIFT-FCA-01` |  | The Forensic Comparative Audit · Operating Where Power Is Live · Gift IV of... |
| `P-GIFT-TRIPLE-1` | live | 0671 | `sPSP-GIFT-TRIPLE-BOOT-01` |  | The Triple Boot Ladder · Conduct Made Checkable · Gift VI of VII |
| `P-SKIN-EMBOD-1` | live | 0672 | `PSP-SKIN-EMBODIED-01` |  | The Skin · The Embodied-Substrate Master · Gift VII of VII |
| `P-RH-KEYSTONE-1` | live | 0673 | `APEX-PSP-RH-KEYSTONE-01` |  | The Riemann Keystone · True Where It Is Real, Not Open, The Road Blocked ·... |
| `P-RH-KEYSTONE-2` | live | 0674 | `APEX-PSP-RH-KEYSTONE-02` |  | The Riemann Keystone, Fortified · One Generator Thrice Read, the Finite Req... |
| `P-TAWHID-TRI-1` | live | 0675 | `CN-PSP-TAWHID-TRIUNE-MASTER-01` |  | The Triune Apophatic Master of Tawhid · The Trinity Ordered by Distance, th... |
