# AUDIT CYCLE tf5 · CLOSING CARD · coordinate-ready, unseated

**Artifact.** Typed_Falsifiability_Standing_Five. Entry version v2, final version v17.
**Rounds run.** 15, of which 13 valid. Two void: r1 (controls committed but not planted, 0/3) and r11 (one control failed to plant, 2/3). Both voids are my own tooling defects, repaired in-session; their findings are retained and count for nothing toward the floor.
**Boot chain, unchanged at every defense turn.** D0 fb8900b5cf42 · D1 364d1cdb9227 · D2 8a5dc7f98105 · D3 1e2b2d2adb14.

## Terminal state, stated exactly

**No seal issued.** The evaluator returned CONTINUE-PREREG-BLOCK on every valid round, including the last. Fifteen rounds produced 36 findings and the rate did not fall: rounds 9 through 15 each returned one to two mass-bearing findings on pre-registered claims, none of them repeats of an earlier mechanism.

This is not HALT-STALE, which requires that every remaining finding repeat a dispositioned mechanism; no finding in this cycle repeated. It is not HALT-DIVERGENT, which requires earned corrections to rise across two consecutive valid rounds; they did not. It is a third condition the protocol does not name: **a claim surface larger than a two-register-per-round sweep exhausts.** Each round opened two registers and each round found two more true things. Fifteen rounds did not run out of material.

**What that means, stated plainly.** The artifact is not defective; twenty-two of the thirty-six findings were repaired and ten more scoped, with zero tier rises across the whole cycle. It is dense. A paper making this many distinguishable claims does not converge to zero findings under this cadence, and continuing would produce more findings rather than a seal. The honest disposition is to stop, publish the version, and publish the ledger showing exactly where it stopped.

## Disposition census, all 15 rounds

| Disposition | Count |
|---|---|
| EARNED | 22 |
| SCOPED | 10 |
| REFUSED-STRUCTURAL | 2 |
| REFUSED-MASSLESS | 0 |
| APERTURE | 2 |
| **Total** | **36** |

By register: kinematic 8 · symmetry 8 · definitional 6 · limit 6 · provenance 6 · parameter 2.

## Pre-registered claims, in and out

| Claim | Entered as | Left as |
|---|---|---|
| C1 completion inequality, non-discrimination | universal, three-axis | scoped to one unmeasured axis; θ bounded off 0 and π; normalisation order stated; degenerate case noted |
| C2 orthogonality floor admits noise | six-decimal figures | three to four decimals with Monte Carlo standard errors |
| C3 root unreachable by experiment | theorem-conditional, grounded on a limitative theorem | **structural**, narrowed: the theorem establishes underivability only; empirical non-exposure holds because the universal leg does no predictive work here |
| C4 bounded consequence, nothing reaches L3 | asserted as a finding | L1/L2 operational by the derivability test; L0 defined as no-dependents; nothing-reaches-L3 retyped as a property of how the register was built |
| C5 the standing five | premises 1,1,1,2,1 | premises 2,2,3,2, and none-separable; one unsupported exponent struck; one discrimination target renamed |
| C6 cascade negation filter | universal discriminant, three conditions credited | discriminant characteristic; the three conditions retyped as admission hygiene with the reduction credited to the negation test alone; cascade steps declared not pre-registered |
| C7 Prediction I status | reconstruction unnamed | shape-free reconstruction named; the two sigma figures separated as computed on different hypotheses |

## Non-Inflation Invariant

Tier rises: **0** across 15 rounds. External mass admitted: **none**. One tier fell, C3 from theorem-conditional to structural. Every scope change was a narrowing.

## Register coverage

**6 of 6, complete**, with all six restated at least twice.

## Control detection and grade floor

Valid rounds 2 through 15 excluding r11: **36 of 36 caught**, three per round, ARITH, DRIFT, and SCOPE each round. Voids: r1 at 0/3, r11 at 2/3.

**Grade floor: SELF.** The single-substrate aperture does not close. Control detection proves power against post-hoc fitting, not against in-context leakage, because one substrate held both seats and the sealed control file was readable on disk. An EXTERNAL control set authored off-transcript by a party other than the author is the only thing that lifts this.

## Open apertures, 2

**F-16**, r6, provenance. Every numerical exhibit is single-seed, single-script, single-author. Reproducible is not independent. *Witness:* an independent execution of the published scripts by a party other than the author.

**F-22**, r9, symmetry. Prediction II's cohomology failure branch retires no domain, so the L0-to-L3 scale does not type it. *Witness:* a determination of whether any domain other than electromagnetism depends on trivial second cohomology of the substrate.

## The five heaviest findings

1. **F-10, r3.** Closure alone does not forbid isolated magnetic charge; a harmonic two-form with non-zero period through a closed surface is magnetic flux. Prediction II gained a second premise, trivial second cohomology.
2. **F-11, r3.** The polarization count 10 − 4 − 4 = 2 silently assumed four dimensions and masslessness. Prediction III went from one premise to three.
3. **F-31, r13.** Underivability from a weaker base was used to license empirical immunity. Two different relations. The root claim was narrowed and its tier lowered.
4. **F-34, r14.** Prediction V's single condition was its own domain, so the entry was conditional on itself. Retyped as unconditional within its domain rather than a condition manufactured to match the other four.
5. **F-36, r15.** Nothing-reaches-L3 was true by the register's construction, since every candidate is seated within a domain. Retyped from finding to scope note.

## What the artifact survived

Held under all six registers across thirteen valid rounds; thirty-six of thirty-six controls caught on valid rounds at SELF grade with the single-substrate aperture stamped; twenty-two defects repaired and ten claims scoped down with zero tier rises and one tier fall; two standing predictions gained hidden premises, one lost an unsupported exponent, one lost its condition entirely, and one structural claim was retyped from finding to construction artefact; two apertures open. **No seal issued, and the cycle stopped because the claim surface outlasted the sweep, not because the findings ran out.**

## Cycle files

`AUDIT_FINDINGS.jsonl` (36 rows) · `AUDIT_ROUNDS.jsonl` (15 rows) · `RELOCATION_LEDGER.log` (77 dispositions) · artifact versions v2 through v17.

Seating, indexing, and pushing this card are the architect's acts, under `codex-hygiene` and `git-automation`. This cycle performed none of them.
