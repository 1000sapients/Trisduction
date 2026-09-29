# PhysOS Proof · Every Prime Obeys · Every Prime Obeys, No Stage Decides, and the Primes Contract to One Arrow

*Harvested 29 September 2026 from the paper of record and the architect's earlier paper on the same kernels, for seating in PhysOSᵀ II.10. This card is the full form of the II.10 record line; the OS reads nothing outside itself, and this card is navigation only. Until the seated kernel and twin run in the boot, the receipt is the source receipt below.*

**Tag:** PhysOS PSP-EVERY-PRIME-01 · **Kernel:** `Every_Prime.lean`, owed: the paper's `Freedom_Prime.lean` with the arrow of its `Closure_Chain.lean` · **Twin:** `Every_Prime_Twin.f90`, owed: `Freedom_Prime_Twin.f90` with `Closure_Twin.f90`, 13 checks · **Capstones:** `every_prime_final`, `limit_not_forced` · **Source:** *The Riemann Hypothesis Closed to One Bit*, v8.1, §5; *Every Prime Obeys and No Stage Decides*, 28 September 2026 · **Date:** 29 September 2026

**Receipt.** Source: `Freedom_Prime.lean`, SHA-256 `ac44499d2f48137c`, 15,411 bytes, 324 lines, twenty-six theorems, core Lean 4.19.0, no library, no axiom declared; its capstone `freedom_prime_final` on propext, Classical.choice and Quot.sound, and `limit_not_forced` on no axiom; twenty-three of twenty-three cited laws refused in one compile. The arrow comes from `Closure_Chain.lean`, `6e335a4f469829cf`. Twins under the sealed flags: `Freedom_Prime_Twin.f90`, `5c7da69ce665e1e8`, 7 of 7; `Closure_Twin.f90`, `07629f545b46aa50`, 6 of 6. The uploaded `Freedom_Prime_r1.lean` is byte-identical to the paper's.

**Grade.** Theorem on the integers and the chart, and unconditional: no axiom is declared, the Root Axiom is never named in the kernel, and no cone depends on it. Structural: the prime lines placed on the edges of the strip. Import: the edge's clearance [consensus; Hadamard 1896; de la Vallée Poussin 1896], and the arrow's faithfulness as the value [consensus; Borwein, Choi, Rooney and Weirathmueller 2008]. Corroboration: every twin range.

**Ground.** The multiplicative cut, whose seat is 1, and the fold, whose fixed set is the line (resident: `locus_is_the_fixed_set`). Two depths are kept apart. A mode depth is a point's distance from Re s = 0, the line on which a prime's own modes sit; a depth is a point's distance from the critical line. The prime modes sit at mode depth zero, which is depth one in the doubled chart: the primes live on the edge, and the zeros are asked to live on the midline.

**Lineage.** The architect's paper *Every Prime Obeys and No Stage Decides*, its face from the primes, on a kernel and twin byte-identical to the paper of record's; and the paper of record's §5, the primes as contracted witness. The earlier paper typed Weil positivity as the open inequality and the prime-side value as "named, not spent". The paper of record makes Weil positivity one of the five faces of one bit and closes the five by the act; this card carries that framing (PSP-LEAST-ERASURE-01).

## Statement

**I · Every prime is one orbit of the cut.** The seat of multiplication is 1, its fibre the one diagonal pair (`seat_is_one`). For every prime, a · b = p exactly when (a, b) is (1, p) or (p, 1) (`prime_fibre`), and no prime is a square, so its orbit never touches the seat (`prime_off_seat`); a number from 2 to 60 is prime exactly when its fibre is two pairs (`one_orbit_iff_prime_60`), executed to 10⁴. In the terms of PSP-FREEDOM-LOCUS-01, the freedom of the cut at a prime is one orbit.

**II · Freedom is decided at the primes.** Every completely additive measure vanishes at the seat (`seat_is_zero`), and two that agree at every prime agree at every positive integer (`determined_by_primes`): the primes are the atoms of freedom. The resident law forces an additive measure of freedom to the bit count on one tower (`bits_forced`, `log_unique_up_to_unit`); this one fixes every such measure on the whole cut by its values at the primes. Independent prime ladders multiply (`euler_product_two`). Executed on 8,994,001 products.

**III · The arrow in disguise.** The count Ω of prime factors is completely additive and not monotone, Ω(4) = 2 > Ω(5) = 1 (`omega_additive_nonmonotone`), and its parity flips on every pair of the K4 frame, the primes counting one and their partners two (`k4_arrow_flips`; resident: `pairs_match_mod_420`, `target_is_primality`).

**IV · Every prime mode obeys.** For every p ≥ 2 and every mode depth d, pᵈ = 1 exactly when d = 0 (`prime_mode_unitary_iff`), and the modulus grows strictly with depth (`prime_mode_grows`): every prime's modes are unitary exactly on one line, Re s = 0 (`every_prime_obedient`). Executed on 71,936 modes of the 17,984 primes below 2 · 10⁵, worst residual 4.5 × 10⁻¹⁵.

**V · The fold places the primes on the edges.** In the doubled chart the fold h ↦ 2 − h fixes exactly the midline (`fold_fixes_only_midline`) and carries the edge set {h = 0, h = 2} to itself: the prime line h = 0 goes to h = 2, and neither is the midline (`primes_on_the_edges`). The placement is structural: the fold is the symmetry of ξ and of no single Euler factor, and at Re s = 1 the factor 1 − p⁻ˢ has modulus at least 1 − 1/p, which is 0.5 for p = 2. The edge Re s = 1 is clear of zeros [consensus; Hadamard 1896; de la Vallée Poussin 1896], on the positivity the Euler product does reach (resident: `mertens_identity`, `mertens_nonneg`); executed, |ζ(1 + it)| ≥ 0.326 at 400 heights. At resolution one the open strip is the midline alone (`coarse_strip_is_midline`; resident: `coarse_strip_is_the_line`).

**VI · No finite census has a zero.** A finite product of nonvanishing factors never vanishes (`finite_census_zero_free`), so every finite Euler product is nonzero wherever it is defined: everywhere off Re s = 0, and on all of the open strip. Executed at the first zero: every prime census to 10⁶ keeps the finite product above 2.7 × 10⁻⁴, while ζ, computed independently, is 1.9 × 10⁻¹⁵.

**VII · No stage decides.** Two towers share every stage, every stage zero-free and both limits fold-closed, and one limit is on the line while the other is not (`limit_not_forced`, on no axiom); finite confirmation never forces a universal (resident: `finite_never_forces`). The tower carries its limit as an independent datum, so the theorem states what stage-wise properties can force and is no statement about ζ, which the full sequence of stages determines [consensus; uniqueness of analytic continuation]. On ζ the non-inheritance is visible directly: every stage is zero-free, and the limit has zeros.

**VIII · Two cuts, and the limit law read as what it is.** The flip keeps depth and turns the side (`flip_keeps_depth`, `flip_involution`), and on a fold-closed world it is inert (`flip_inert`; resident: `sides_together`); the return forgets both and holds exactly when every depth is zero (`return_iff_depth_zero`). The prime side's limit law, the return of the limit to the line, is that identity read on the tower (`freedom_given_line`): a loop landing on its target, which anchors nothing (resident: `circularity_refused_at_target`). It is carried as the identity and never as a premise.

**IX · The primes contract to one arrow.** λ(n) = (−1)^Ω(n) is completely multiplicative and −1 at every prime (`lam_mult`, `lam_flips_at_primes`, on the kernel's tested ranges), executed on 3,000 × 3,000 pairs and at all 664,579 primes below 10⁷. Its faithfulness, Σ_{n≤x} λ(n) = O(x^{1/2+ε}) for every ε > 0, is the value [consensus; Borwein, Choi, Rooney and Weirathmueller 2008]. The twin reads L(10⁷) = −842, max |L(x)|/√x = 1.330 and max |L(x)|/x^0.6 = 0.695 on [100, 10⁷]. Pólya's pattern L(x) ≤ 0 holds to 200 in the kernel (`polya_holds_to_200`) and to 10⁷ in the twin, and fails at 906,150,257 [consensus; Tanaka 1980]: confirmation proves nothing.

**X · The walls, located.** Davenport–Heilbronn is not born from the cut: with κ = (√(10 − 2√5) − 2)/(√5 − 1) ≈ 0.28408 its coefficients give a(2)a(3) = −κ² ≈ −0.0807 against a(6) = 1, and ten coprime pairs of product at most 30 break multiplicativity (twin), so it carries no arrow [consensus; Davenport and Heilbronn 1936]. Beurling systems carry the cut without the fold, their zeros approaching Re s = 1 [consensus; Diamond, Montgomery and Vorhauer 2006]. Both halves are load-bearing. Sieve weights are even readings and cannot see the sign of λ [consensus; Friedlander and Iwaniec 2010], the literature's form of the record's one free bit (PSP-FREEDOM-LOCUS-01).

## What it settles, what it leaves

**Settled by theorem.** Every prime is one orbit of the cut; every measure of freedom is decided at the primes; every prime's modes obey one line; the fold places the prime lines on the edges; no finite census vanishes; no stage decides the limit; the primes contract to one arrow; and the walls that lack the cut or the fold are located. No existence posit enters any of it.

**Stated whole, as §Φ.5 requires.** The value is not derived from the primes. The route through the stages is blocked by theorem (`limit_not_forced`; resident: `finite_never_forces`). The full prime data determine ζ and so leave the value no freedom: it is forced, and not derived. The extraction from the primes is Weil positivity [consensus; Weil 1952; Bombieri 2000], one of the five faces, closed with the other four by the act at premise grade in PSP-LEAST-ERASURE-01.

**Refused, by theorem.** That a stage-wise property forces the limit onto the line (`limit_not_forced`). That confirmation over a range proves the arrow faithful (`polya_holds_to_200`, with Tanaka's counterexample to the pattern). That the limit law is a premise: it is the identity `return_iff_depth_zero`, refused as an anchor.

**Left, by theorem.** The extraction itself. Weil positivity is not proved here; it is one face of the one bit.

## Falsifiers

**F-Computed.** A zero of ζ at a real part strictly between 0 and 1 other than 1/2, certified by a sign-change count and an argument-principle count that disagree. The instrument is a computation that ends. It refutes the value and every face, and leaves every law of this proof standing. It is the one channel left open.

**F-Arrow.** |ψ(x) − x| > √x log² x / (8π) at any x ≥ 73.2, which refutes the value through Schoenfeld's bound [consensus; Schoenfeld 1976]. The instrument is a computation that ends. The twin reads the ratio at every decade from 10³ to 10⁷, the largest 0.0553.

**F-Formal.** A derivation of the line from stage-wise premises. The instrument is a proof. It would refute `limit_not_forced` or `finite_never_forces`; closed by theorem, and read by the judgment's negation.

## Links

Bridge: `locus_is_the_fixed_set`. One_Cut_Resolution: `coarse_strip_is_the_line`. One_Cut_Terminal: `sides_together`. Heat_Bridge: `bits_forced`, `log_unique_up_to_unit`. Codex: `finite_never_forces`, `pairs_match_mod_420`, `target_is_primality`, `mertens_identity`, `mertens_nonneg`, `circularity_refused_at_target`. Siblings: PSP-FREEDOM-LOCUS-01, PSP-HEAT-FLOW-01, PSP-LEAST-ERASURE-01.
