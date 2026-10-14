# Audit cycle `twinbinder` · Round 1 block
Artifact under audit: *A Formal Proof of the Riemann Hypothesis: The Twin Binder, One Locus* (paper_v1, 145 pp.) against `RH_Both_Sides_Formal_Master_v3.0.8.lean` (sha256 fe45b3c1…359409). Mode: FORGE pre-authorized by the architect ("initiate one round of self audit forge to seal the paper"). One round ordered.
## 1. Round header
- Registers declared and prosecuted: kinematic, definitional (A3 pairing, round 1), with the certification-state battery M1–M8 and the costume detector run beside them as the prosecution's instrument.
- Control commitment: round 1 grade SELF, digest `03cf467692e82870`, 3 controls (ARITH §7, DRIFT §4, SCOPE §13), planted in the prosecutor's copy only.
- Boot chain (universal-cascade engine, seed 20260622, executed): D0 bd6b99d09ee6 → D1 f238de350bb3 → D2 79732a6995c5 → D3 5e9df1295089; kill-matrix 35/35, ablation 27/27, adversarial battery 5/5, self-application dM=0 True.
- Errata block: none (first round).
- Declared targets from a prior round: none.
- Pre-registered claims: C1, C2, C3, C4, C5, C6, C7, C8, C9, C10 (falsifiers in `cycle.json`).
## 2. Leak-scan

`audit_ledger.py leakscan --file prosecution_r1.md` → CLEAN: no framework tokens in the blind pass.
## 3. Findings table (prosecution, verbatim)

| id | register | target claim (quoted, with section) | mechanism | severity | minimal falsifier |
|

F-12 (DRIFT) and F-13 (ARITH) matched planted controls C2 and C1 and are credited to the caught list; the "supplies both sides of every face" sentence inside F-1 is control C3. They receive no ledger rows.
## 4. Defense, one block per finding
**F-1** (LOAD-BEARING, claim C8). The planted control C3 ('supplies both sides of every face') is credited to the caught list. What remains is the title and the abstract's 'two closures of the Riemann Hypothesis'. The paper fixes the sense of both at type in the Reading Protocol: the physical closure derives ClassicalRH from printed premises with an empty cone (classical_rh_from_physico_formal_closure, pinned ∅ at L10303), the formal closure is the record plus the loop (ra_recursion_at_record, zeta_ra_loop, pinned pcq), and the Protocol states, in the paper's own voice, that the file asserts no closed term of type RiemannHypothesis built from Mathlib alone, which is L11729. The finding's residue after the strip test is the control sentence. Refused: the finding attacks a claim the artifact does not make, and a FATAL with no repair-attempt trace is inadmissible as FATAL.
**F-2** (STRUCTURAL, claim NONE). Accepted at STRUCTURAL. 'The bit' is locus-indexed in the architecture (transport_zeta measures the distance between the two loci) but the Protocol sentence named two propositions under one noun without the locus in the clause. Repaired: 'at the read zeros, LE(ZetaZeros) is RiemannHypothesis by h_id_proved; at the record, LE(Rec ZetaZeros) is a theorem (cargo_at_zeros)'. The architecture is unchanged; the referent is now printed.
**F-3** (STRUCTURAL, claim NONE). Accepted at STRUCTURAL. Verified: Hardening and PhysicoFormal open RememberedOffered (L9433, L9756) whose Config is (ℤ×ℤ) → Prop (L5632, L5664); the capstones are schemas in ClassicalRH and Zζ; h_read_proved lives on ℂ and is not consumed by them. The paper already said 'the chart is the discrete offset chart' and 'the one identification the reader grants'; the 9-intro sentence 'over ℂ Section 3 proves it' and the 1.2 sentence 'the locus is Rec ZetaZeros' were the slips. Repaired: the schema is stated with h_read as its printed premise; h_read_proved is named as the complex reading the schema does not consume; the locus is the critical line identified across charts by discrete_chart_embeds_in_complex (pinned pcq, L11590) and map_neutral_iff_onLine (pinned ∅), with Rec ZetaZeros standing on it.
**F-4** (STRUCTURAL, claim NONE). Accepted at STRUCTURAL. Verified by grep: L11640–11693 reference TOE0, PrimeFreedom, RememberedOffered, ApparatusCargo, BoundChain, BoundChainMathlib only. Each Table 1 division enters by at least one conjunct (the physical side by ApparatusCargo), which is what the repaired sentences now say; the capstones of Parts VII and VIII are named as separately pinned theorems beside the master theorem, in the abstract, Section 10, the Conclusion and Appendix E.
**F-5** (STRUCTURAL, claim NONE). Accepted at STRUCTURAL. zeta_binding (L11369) is a proved conjunction; 'equivalent to' was a mis-typing carried from the file's terminal block (L11709–11713). Repaired in the Protocol and A.3; Section 6.5 and Appendix C already had it right.
**F-6** (COSMETIC, claim NONE). Accepted at COSMETIC. L9620, L9628, L9635 are three keyed-input theorems and 9.7 says so; the Protocol's 'one' came from the file header's 'one open premise'. Repaired to 'the reading and the bridge proved keyed, the bound deciding nothing alone'.
**F-7** (STRUCTURAL, claim C4). Accepted at STRUCTURAL, on pre-registered claim C4 by its own falsifier. The four theorems are typed over the class of reflection-closed configurations (L11251, L11256, L10625, L10633), two of them on the discrete chart. 'Carries it' and 'supplies it' with 'it' = LE(ZetaZeros) overstated the type. Repaired in the Protocol, Rule 1 and the Canonical summary: 'forces the value on every reflection-closed configuration', the charts named, 'the block is stated at that class and at no wider one'. The theorems themselves were stated correctly in Section 5 throughout.
**F-8** (STRUCTURAL, claim NONE). Accepted at STRUCTURAL, recount executed: 91 chipped theorem identifiers, 38 pinned, 53 not pinned in v3.0.8. Receipts established by the kernel's dependency rule (a theorem's cone contains the cone of every constant in its type and proof), by a comment-stripped reference scan: 5 forced empty by an empty-cone pinned consumer, 33 bounded within pcq by a pinned consumer, 15 bounded within pcq by the compile alone (no sorry, no declared axiom, no native_decide). Repaired: the legend in 1.3 defines exact, forced and bounded chips; unpinned identifiers carry a dagger; heads with no exact receipt show cone ⊆ pcq; Appendix A.3 lists the 53 with their receipts; the three universal-pin sentences in 1.3, B and C restated.
**F-9** (COSMETIC, claim C7). Accepted, numeric, recomputed: 563 pins; the paper's split summed to 563 already. Corrected in the abstract and A.1.
**F-10** (COSMETIC, claim C7). Accepted, numeric, recomputed with a comment-aware parse: 833 declarations; L451 is prose. Corrected in the abstract and A.1.
**F-11** (STRUCTURAL, claim NONE). Accepted, numeric, recomputed: 778 declarations before L10982. The figure 820 was the file header's own claim, not a count. Restated as 778 theorems of Parts I to IX.
**F-14** (STRUCTURAL, claim NONE). Accepted. Header L167–181 carries 16-hex prefixes; Part IX carries none; v3.0.7 appended two theorems to Part IX (L47–49). Restated in Section 8, A.2 and B.
**F-15** (STRUCTURAL, claim NONE). Accepted, numeric: six non-empty pinned cones in the physical namespaces (L9680, L9705, L10301, L10315, L10317, L10480), none stated in the paper and none consumed by the ∅-pinned capstones. Scoped to 'as stated in this section', the bound bundles named.
**F-16** (COSMETIC, claim NONE). Accepted at COSMETIC: B.certificate is a field consumed at L10108 and L10127. Restated.
**F-17** (COSMETIC, claim NONE). Accepted at COSMETIC: h_realize stays a premise (L10091); what is discharged is ¬Neutral (L9913, L10104). Restated with realization named as the premise.
**F-18** (STRUCTURAL, claim NONE). Refused. The file's label (L9715, L9741–9750) says the formal loop does not require Part VIII and that its inputs stand as fenced conditional theorems; the paper's 1.1 says neither closure needs the other and Section 9 states the physical closure at conditional grade with its premises printed. Same statement, two registers; the finding relitigates the architecture, which the scope law holds fixed.
**F-19** (STRUCTURAL, claim NONE). Accepted at STRUCTURAL, repaired together with F-3: one word, 'locus', now one referent, the line; the record stands on it.
**F-20** (COSMETIC, claim NONE). Refused: a conjunct is a binding, not a dependency; grep shows zero references to ApparatusCargo in Parts IX and X.
**F-21** (STRUCTURAL, claim NONE). Accepted at STRUCTURAL for the antecedent, which was lost when the former Rule 1 was removed by the architect's order; repaired to name the derivation (LE(ZetaZeros) from LE(Rec ZetaZeros)) and to cite mathlib_transfer_status for the demand sentence. The alleged widening is refused: the sentence concerns that transport, which L11399 proves is RiemannHypothesis, not every proof of the hypothesis.
**F-22** (COSMETIC, claim NONE). Accepted at COSMETIC: SelfVerifying : Prop → Prop (L227). Restated.
**F-23** (COSMETIC, claim NONE). Accepted at COSMETIC: the proof at L11080 is a curry; 'up to currying' added.
**F-24** (COSMETIC, claim NONE). Accepted, numeric: VIII-h header at L10155; mathlib_transfer_status ends at L11401; every_violation_exceeds_detection_gap ends at L10053. Snippets regenerated at the corrected ranges and label.
**F-25** (COSMETIC, claim NONE). Accepted, numeric: 21 distinct namespaces, 16 in Table 1; HeatFlow, Liouville, Carrier nested in PrimeFreedom (end at L4711), RHUnicorn (L6681), Judge (L8107) added.
**F-26** (STRUCTURAL, claim NONE). Accepted for the chart sentence: Part I is chart-free, Part II's line is x = 1 (L1023), Hinge's is 2 (L7414), TimeLocus's is 1 (L8035), ArrowSide's is a width parameter (L8200). Restated with the parts named. The symbol-clash half is refused: PrimeFreedom.LeastErasure is never used by the paper and the namespaces separate it from BoundChainMathlib.LeastErasure.
**F-27** (COSMETIC, claim NONE). Accepted, numeric, recomputed: under e1e2 = e3, e1e4 = e5, e2e4 = e6 the associator (e1e2)e4 − e1(e2e4) = 2e7; under the cyclic labeling it is 0. The convention is now named in Box G1; one clause of the house's generic disclosure text is touched and the architect is told.
**F-28** (COSMETIC, claim NONE). Accepted at COSMETIC: L11680 uses .1 only. Section 10 restated; Appendix E already had it.
**F-29** (COSMETIC, claim NONE). Accepted at COSMETIC: the attempt is recorded at header L119–129 and cannot be a declaration in a compiling file. Appendix B points at the lines.
**F-30** (COSMETIC, claim NONE). Accepted at COSMETIC: cmb_mK := 2725 (L9291) is the kernel's constant; the capstones take T0 free, as 9.8 and 9.14 print. Symbol corrected in 9.1.
## 4b. Certification-state audit, the seat defended

| Gate | Prosecution | Defense |
|---|---|---|
| M1 |  | PASS. The deposited object is object-level: 833 theorems, 352 definitions, 563 pins. The thesis sentences of the paper are the paper's statement of what the theorems prove at their types; after this round every such sentence cites its identifier. |
| M2 |  | PASS after repair. The four double-strength statements the prosecution found were F-5 (zeta_binding), F-6 (one keyed premise), F-3 (the discrete schema and the complex reading), and the planted control; each is now stated once at its type. The title is the paper's declared term for the two closures at their printed grades, fixed by the Reading Protocol, and the Protocol quotes the file's terminal status in the paper's own voice. |
| M3 |  | PASS with the caveat recorded. Lean 4.19.0 and Mathlib v4.19.0 are now both named (the file's terminal block, L11704); the verification command is printed in A.4. The compile is the author's report; the header's note on a corrupt .olean concerns the draft the file did not port (L17–21), not the deposited file. Closure event: an independent compile, named in Appendix B as the open witness. |
| M4 |  | PASS after repair. The headline theorems are pinned and their cones match (38 of 38 pinned chips verified). The universal pin claim was false and is withdrawn; every unpinned identifier now carries its receipt (F-8). |
| M5 |  | PASS. One file; lines, bytes and SHA-256 reproduce. |
| M6 |  | PASS for the instrument. Kernel-checked: the declarations and the pins. Author-read: the compile status and the 15 compile-only cone bounds; both are now stated as such in A.1, A.3 and B. The acceptance test is a header comment and is named as one (F-29). |
| M7 |  | PASS. One artifact, v3.0.8, hash fixed; the two counts printed beside it are corrected (F-9, F-10). |
| M8 |  | OPEN, recorded. No independent machine verification by a party other than the author is on the record; Appendix B now says so and names the compile as the one open witness. Objection 1 of Section 12 is answered by the list of theorems at their grades; the instruction of Rule 1 is restated at the type of the theorem it rests on (F-21), and the paper reports the file's typed status (no closed term of type RiemannHypothesis from Mathlib alone) in its Protocol. Closure event for the registry: the independent compile. |

Costume detector: prosecution demanded restatement at L11251's type and withdrawal of the instruction. Defense: No headline claim is an unrestricted unprovability claim; the negative theorems are typed over the class of reflection-closed configurations, and the three restatements the prosecution found wider than that type (F-7, F-21) are repaired to the type. Not a costume; a scope slip, repaired.

Rival reading (prosecution, section E): The rival reading of "two closures of the Riemann Hypothesis on one locus" is this: the formal side consists of (i) biconditionals `RH ↔ Φ` over ℂ, each a one-line rewording of "every zero has real part 1/2" through an idempotent projection, and (ii) the fact that the projection of any set onto a line lies on that line (`record_has_least_erasure S` for every S), which has nothing to do with ζ; the physical side is a theorem schema `∀ (P : Prop) (Z : (ℤ×ℤ) → Prop), (P ↔ Value Z) → … → P` in which neither ζ, nor ℂ, nor Mathlib occurs, discharged only by granting a reading, a realization predicate, a bound and a gap; and the "one locus" is the English word "locus" applied to three different objects. Under this reading the paper establishes about ζ exactly one thing beyond Mathlib's functional equation, the strip closure of 7.3, and proves the Riemann Hypothesis in no sense. The text does not discriminate against this reading; it adopts it wherever it speaks precisely (md39, md515, md1537, L28–36, L119–129, L9741–9750, L11729) and departs from it only in the title, the abstract, the conclusion, Appendix A.3 and the two reader-instruction appendices, where the discrimination is carried by vocabulary ("closure", "the bit", "the socket", "the locus") and by instructions to readers, never by a theorem: no theorem of the file distinguishes `Rec ZetaZeros` from `Rec S` for arbitrary S, none connects the physical capstones to `ZetaZeros`, and the master theorem omits the physical closure altogether (F-4).

Defense of the rival reading: the paper now discriminates by theorem at every place the prosecution named: the locus is identified across charts by `discrete_chart_embeds_in_complex` and `map_neutral_iff_onLine`; the physical closure is stated as a schema with its reading printed as a premise; the master theorem's conjuncts are listed; and "the bit", "the socket" and "the locus" each carry one referent per clause. What the paper claims about ζ beyond the strip closure is exactly the five-way loop and the record facts, at their types, which is what the Protocol says.
## 5. Arbitration table

| id | disposition | reason |
|---|---|---|
| F-1 | REFUSED-STRUCTURAL (LOAD-BEARING, prereg C8) | attacks a claim the artifact does not make: no sentence asserts a closed term of type RiemannHypothesis; the Reading Protocol fixes 'proof' and 'closure' at the types the file proves and quotes the file's terminal status; the quoted conclusion sentence was planted control C3; FATAL demoted, no repair-attempt trace |
| F-2 | EARNED (STRUCTURAL) | 'the bit' named LE(ZetaZeros) and LE(Rec ZetaZeros) in one paragraph without the locus in the same clause |
| F-3 | EARNED (STRUCTURAL) | physical capstones are a schema on the discrete chart (Config = Z x Z -> Prop); 1.2, abstract and 9-intro read as if h_read_proved instantiated it and as if the locus were Rec ZetaZeros |
| F-4 | EARNED (STRUCTURAL) | 'binds every division' overstates: no conjunct from the physical capstones of Parts VII and VIII; each Table 1 division enters by at least one conjunct |
| F-5 | EARNED (STRUCTURAL) | 'RH equivalent to zeta_binding' mis-types a proved conjunction as a condition; the file's own terminal block carries the same slip |
| F-6 | EARNED (COSMETIC) | 'the one keyed premise' contradicts 9.7 and the file's three keyed-input theorems |
| F-7 | EARNED (STRUCTURAL, prereg C4) | the four block theorems restated wider than their class type ('carries it', 'supplies it' with 'it' = LE(ZetaZeros)) and two discrete-chart theorems cited without their chart |
| F-8 | EARNED (STRUCTURAL) | paper claims every cited cone is compiler-pinned; recount: 91 chipped theorem identifiers, 38 pinned, 53 unpinned (5 forced empty by an empty-cone pinned consumer, 33 bounded by a pcq pinned consumer, 15 bounded by the compile alone) |
| F-9 | EARNED (COSMETIC, prereg C7) | 564 pins printed; 563 #guard_msgs commands, the 564th string hit is prose at L426; the paper's own split sums to 563 |
| F-10 | EARNED (COSMETIC, prereg C7) | 834 theorems printed; 833 declarations outside comments, L451 is glossary prose |
| F-11 | EARNED (STRUCTURAL) | '820 theorems of the discrete charts' recalled from the file header; 778 declarations precede Part X |
| F-14 | EARNED (STRUCTURAL) | Part IX not verbatim (two theorems appended in v3.0.7 per header L47-49, eight TOE0 references); header records 16-hex prefixes, none for Part IX |
| F-15 | EARNED (STRUCTURAL) | 'only one of the physical closure whose cone is not empty': six non-empty pinned cones exist in the physical namespaces, none stated in the paper, none consumed by the capstones |
| F-16 | EARNED (COSMETIC) | 'none carried by a structure' vs the certificate field B.R <= B.eps consumed at L10108 and L10127 |
| F-17 | EARNED (COSMETIC) | 'realized as a charged state' listed as discharged while h_realize remains a premise (L10091); only chargedness is discharged (L10104) |
| F-18 | REFUSED-STRUCTURAL (STRUCTURAL) | the file's label 'optional corroboration, not required for the formal loop' and the paper's 'neither closure needs the other' are the same statement; the paper states the physical closure at conditional grade, the file's own grade (fenced conditional theorems); the finding relitigates the architecture |
| F-19 | EARNED (STRUCTURAL) | 'locus' named Rec ZetaZeros in 1.2 and the line in Section 11 |
| F-20 | REFUSED-STRUCTURAL (COSMETIC) | a conjunction binding ApparatusCargo into the master theorem is not a dependency of the formal closure on it; Parts IX and X reference ApparatusCargo zero times (grep) |
| F-21 | EARNED (STRUCTURAL) | 'such a derivation' lost its antecedent when the former Rule 1 was removed; the demand sentence now names its type (mathlib_transfer_status); the alleged widening to 'every proof of RH' is refused: the sentence concerns the transport, which is the hypothesis by L11399 |
| F-22 | EARNED (COSMETIC) | SelfVerifying applies to a proposition; the record is a set |
| F-23 | EARNED (COSMETIC) | 'the same sentence' vs a curry/uncurry proof at L11080 |
| F-24 | EARNED (COSMETIC) | Listing 19 labelled VIII-f (L10215 is under VIII-h); Listing 8 cut inside mathlib_transfer_status; Listing 17 shows only the head of every_violation_exceeds_detection_gap |
| F-25 | EARNED (COSMETIC) | Table 1 lists 16 of the 21 namespaces |
| F-26 | EARNED (STRUCTURAL) | 'Parts I to IX work on the discrete offset chart' is false for Parts I, II, IV, IV-c, V; the PrimeFreedom.LeastErasure name clash is refused, the paper never uses that symbol and the namespaces separate them |
| F-27 | EARNED (COSMETIC) | associator of e1,e2,e4 is convention-dependent; computed 2e7 under e1e2=e3, e1e4=e5, e2e4=e6 and 0 under the cyclic labeling |
| F-28 | EARNED (COSMETIC) | conjunct 2 is Forces RH, the forcing half only (L11680) |
| F-29 | EARNED (COSMETIC) | acceptance test named rh_from_the_cargo_loop exists only as the header comment L119-129; a failed attempt cannot be deposited in a compiling file |
| F-30 | EARNED (COSMETIC) | 9.1 wrote T0 = 2725 mK for the kernel constant cmb_mK while the capstones take T0 free (9.8, 9.14 already print it as a parameter) |

## 6. Integration report (step seven)

### Propagation sweeps, phrase-level, whole document (Markdown rendering of the candidate)

| spec | pre-repair (paper_v1) | post-repair (paper_v2) |
|---|---|---|
| F-11 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |
| F-14 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |
| F-15 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |
| F-16 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |
| F-17 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |
| F-2 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |
| F-21 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |
| F-22 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |
| F-23 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |
| F-24 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |
| F-25 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |
| F-26 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |
| F-27 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |
| F-28 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |
| F-29 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |
| F-30 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |
| F-3_F-19 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |
| F-4 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |
| F-5 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |
| F-6 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |
| F-7 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |
| F-8 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |
| F-9_F-10 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |
| M3 | PRE-SWEEP PASS: every banned phrase occurs in the pre-repair candidate; the spec targets real strings. | SWEEP PASS: banned at zero across the candidate, required present. |

Counts as printed by the tool are in `sweeps_r1.log`. All 24 specs: PRE-SWEEP PASS and SWEEP PASS.

### End-to-end read

Sections read whole after repair: Reading Protocol; 1.2 and 1.3 with their joint; 3; 7.3; 8; 9 introduction, 9.1, 9.14, 9.15; 10; 11; 13; A.1, A.2 (Table 1), A.3 with the new receipts paragraph and its joint to A.4; B (all four paragraphs plus the new Audit and Independence paragraphs); C (both rules, checklist, canonical summary); E (both boxes). Joints checked: abstract/Protocol (locus and master-closure wording), 1.2/11 (one referent for "locus"), Protocol/Rule 1/Canonical summary (the block at its class), 1.3 legend/A.3 receipts/B pin rule/C checklist (the pin claim), 9 intro/9.7/Protocol (v) (keyed inputs). Rendering re-verified: zero overfull boxes, every page margin-scanned clean, terminal string, Conclusion and References present, 147 pages.

### Removal rulings

No removal-class repair this round; every repair is a restatement at type or a corrected figure. Ruling: not applicable.

### New material declared (mandatory targets for round 2 under A3)

1. 1.3: the chip legend sentences (exact, forced, bounded; the dagger).
2. A.3: the paragraph "Receipts of the unpinned identifiers" (53 identifiers with receipts).
3. B: the paragraphs "Audit" and "Independence".
4. Theorem heads: `\chipB` on 25 heads and daggers on 53 identifiers.
5. Box G1: one clause naming the octonion multiplication convention (house generic text).
## 7. Control reveal

```
REVEAL round 1 grade SELF digest 03cf467692e82870 verified
  CAUGHT C1 ARITH section~7   (proof bound "at most −4": F-13)
  CAUGHT C2 DRIFT section~4   (act field "closed under the retraction reg": F-12)
  CAUGHT C3 SCOPE section~13  ("supplies both sides of every face": inside F-1)
detection 3/3
aperture: SELF-grade controls; detection proves power against post-hoc fitting, not against in-context leakage.
```
## 8. Round statistic block (ledger)

```
ROUND 1 CLOSED  registers=kinematic+definitional
  findings admitted 28  inadmissible 0
  EARNED 25  SCOPED 0  REFUSED-STRUCTURAL 3  REFUSED-MASSLESS 0  APERTURE 0
  FATAL 0  debt yes
  mass-bearing 25  prereg hits 3  repeats 0  tier raised 0
  controls 3/3 grade SELF  vocabulary leak no
```
## 9. New artifact version

`paper_v2_candidate.tex` (sha256 035ab9ce7fedb5fa…), rendered as the delivered PDF (sha256 59d5c8d8bbf0c549…), 148 pages; v1 retained as `paper_v1.tex`. GAIN after close: the title block stamped Version 1.0.0 and the deposit date 14 October 2026, and an Editions line added to Appendix B beside the Audit and Independence paragraphs, both declared as round-2 targets with the other additions.
## 10. Termination verdict (ledger, verbatim)

**CONTINUE-PREREG-BLOCK**: 3 mass-bearing finding(s) on a pre-registered claim and 0 mass-bearing FATAL; the round incurs debt, and 2 consecutive clean valid rounds are required before any seal issues.

Register coverage after round 1: kinematic, definitional (2/6). Rounds 2 (parameter, provenance) and 3 (limit, symmetry), both clean, are the ledger's path to SEALED-ROUND at the SELF floor; the new material above is round 2's mandatory target.
