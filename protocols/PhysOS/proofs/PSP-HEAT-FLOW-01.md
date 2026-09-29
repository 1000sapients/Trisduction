# PhysOS Proof · The Heat Flow · Least Erasure as Heat, Every Finite Law Proved

*Harvested 29 September 2026 from the paper of record and the architect's section on the same kernel and twin, for seating in PhysOSᵀ II.10. This card is the full form of the II.10 record line; the OS reads nothing outside itself, and this card is navigation only. Until the seated kernel and twin run in the boot, the receipt is the source receipt below.*

**Tag:** PhysOS PSP-HEAT-FLOW-01 · **Kernel:** `Heat_Flow_Erasure.lean`, the paper's, SHA-256 `87ca9a40adf61f14` · **Twin:** `Heat_Flow_Twin.f90`, the paper's, SHA-256 `8226eca27e535111` · **Capstones:** `heat_flow_least_erasure`, `certificate_decides_nothing` · **Source:** *The Riemann Hypothesis Closed to One Bit*, v8.1, §6, "The heat bridge"; *Least erasure as heat: the de Bruijn–Newman arc* · **Date:** 29 September 2026

**Receipt.** Source: `Heat_Flow_Erasure.lean`, 13,846 bytes, 289 lines, twenty-eight theorems, core Lean 4.19.0, no library, no axiom declared, every cone within propext, Quot.sound and Classical.choice, two axiom-free; twenty-five of twenty-five non-recursive laws negated in one compile and refused, a planted vacuous law surviving. `Heat_Flow_Twin.f90`, 7,765 bytes, 209 lines, 8 of 8 checks under the sealed flags. The uploaded files are byte-identical to the paper's, so the kernel and the twin can be seated whole.

**Grade.** Theorem on the finite model, from first principles: polynomials with integer coefficients at integer times, every law exact, no premise, and P1 absent. The carrier to ζ (`rh_iff_least_erasure`, `m5_is_one_inequality`) is theorem-conditional on de Bruijn–Newman and Rodgers–Tao, carried as labelled fields. The polynomial reading of ζ's flow is structural: H_t is entire of order one and not a polynomial, and the laws reach it through the cited theorems, never through this kernel. The reading of the flow as erasure is structural and load-bearing on nothing. Preservation beyond degree three is imported [consensus; Pólya and Schur 1914] and twin-corroborated to degree eight.

**Ground.** Φ(u) = Σ_{n≥1} (2π²n⁴e^{9u} − 3πn²e^{5u}) exp(−πn²e^{4u}), the kernel whose cosine transform is Ξ, and H_t(z) = ∫₀^∞ e^{tu²} Φ(u) cos(zu) du, with H₀(z) = Ξ(z/2)/8 and ∂_t H = −∂²_z H [consensus; de Bruijn 1950]. A zero of H₀ is real exactly when the corresponding zero of ζ is on the line. H_t has only real zeros exactly when t ≥ Λ [consensus; Newman 1976], so the value is Λ ≤ 0; Λ ≥ 0 [consensus; Rodgers and Tao 2020], so the value is Λ = 0. The upper bound fell from 1/2 [consensus; de Bruijn 1950] through Λ < 1/2 [consensus; Ki, Kim and Lee 2009] and 0.22 [consensus; Polymath 2019] to 0.2 [consensus; Platt and Trudgian 2021]. On polynomials the flow is p_t = exp(−tD²)p, a finite sum: z² + bz + c goes to z² + bz + (c − 2t), and z³ + pz + q goes to z³ + (p − 6t)z + q.

**Lineage.** The architect's section *Least erasure as heat: the de Bruijn–Newman arc*, on the identical kernel and twin, and the paper of record's §6, "The heat bridge", with the heat face of its §7. The Codex's RH engine carries a toy of the same flow on the squared strip width (resident: `flow_monotone`, `reality_transported`, `real_at_Lam`, `rh_iff_lambda_zero`, `flowed_record_forgets`, `upstream_is_not_forced`); this proof carries the flow on the polynomials themselves, exact in their coefficients. The earlier section typed Λ ≤ 0 as its open last row; the paper of record types it as the one keyed bit, one face of five, closed by the act (PSP-LEAST-ERASURE-01), and this card carries that framing. The paper calls this bridge the heat bridge. It shares a word with the OS floor `Heat_Bridge.lean`, the step from count to heat conditional on P1, and nothing else; it uses nothing of it.

## Statement

**I · The flow on a quadratic.** The discriminant rises linearly, disc(t) = disc(0) + 8t (`disc_flow`). The forward flow never un-reals a root: real-rootedness at s gives it at every t ≥ s (`forward_preserves`), and every quadratic is real-rooted after finite heating (`erasure_finite`).

**II · Least erasure is reached, is least, and is the value.** The least erasure time Λ of a quadratic is reached (`real_at_lam`), is least whenever it is positive (`lam_least`), and is zero exactly when the polynomial is real-rooted at time zero (`lam_zero_iff_real`). For a family, the family's Λ, the largest member's, is zero exactly when every member is real-rooted at zero (`family_least_erasure`).

**III · De Bruijn's bound is tight, and the pair collides.** For z² + c the squared imaginary part of the roots at time t is exactly max(c − 2t, 0), so the strip bound holds with equality (`de_bruijn_tight`). The pair ±√(2t − c) is non-real before t = c/2, meets at the origin at t = c/2, and is real and separating after, both sides registered to one point (`collision`).

**IV · Degree three.** One unit of heat raises the cubic's discriminant by exactly 72((u − 3)² + 3) > 0, u the current linear coefficient (`disc3_step`, `disc3_strict`); the discriminant never falls (`disc3_monotone`), and a real-rooted cubic stays real-rooted (`cubic_forward_preserves`).

**V · The certificate does not decide.** The flow is injective on coefficients, so the whole polynomial at time t fixes it at time zero (`flow_injective`): over full data the bit has no freedom. Real-rootedness at a time t > 0, the observable a computation certifies, does not decide it: z² and z² + t are both real-rooted at t and differ at zero (`certificate_two_worlds`), no function of the certificate returns the bit (`certificate_decides_nothing`), and for every t > 0 some polynomial is real-rooted from t on, not at zero, with Λ > 0 (`certification_never_forces`). This is the finite shape of the upper-bound programme: a certified Λ ≤ ε with ε > 0 decides nothing about Λ ≤ 0.

**VI · Zero slack, the Rodgers–Tao shape.** A double root sits on the boundary: real-rooted at zero with Λ = 0, and non-real after every backward step (`zero_slack`). A real-rooted state at time one has a real-rooted past and a non-real past (`backward_not_forced`). If the value holds, ζ sits on the boundary of the region where the flow keeps every zero real, with no margin [consensus; Rodgers and Tao 2020].

**VII · The carrier for ζ.** With de Bruijn–Newman and Rodgers–Tao carried as labelled fields and not proved, the value holds exactly when Λ = 0 (`rh_iff_least_erasure`); the value and Λ ≤ 0 are one proposition, and no already-true premise yields either except the other (`m5_is_one_inequality`, the heat form of the resident `crossing_irreducible`).

**VIII · Beyond degree three, executed.** Real-rootedness is preserved at every degree [consensus; Pólya and Schur 1914], and de Bruijn's bound applies to real polynomials. The twin re-executes I on 18,491 integer cases and IV on 14,091. It keeps three hundred random real-rooted polynomials of degrees 4 to 8 real-rooted at four forward times, and holds the strip bound on three hundred conjugate-paired polynomials at four times, the worst excess at the floating-point floor. As controls, it reads a known non-real pair at |Im| = 0.7 to 10⁻¹⁰, and finds a bound twice as fast as de Bruijn's violated on 97 of 300, so the test can fail. It turns all one hundred double roots non-real under a backward step of 0.01, and meets the collision of z² + 2 at t = 1.

## What it settles, what it leaves

**Settled by theorem.** On the finite model, from first principles: erasure is monotone; least erasure is reached and least, zero exactly when nothing needs erasing, and for a family zero exactly when it is zero for every member; de Bruijn's bound is tight; full data decide, and every certificate leaves the bit free; a double root has zero slack.

**Stated whole, as §Φ.5 requires.** The value is Λ ≤ 0, and with Λ ≥ 0 it is Λ = 0 [consensus]. It is not derived here: no certified height decides it (V), and if it holds ζ has no margin (VI). It is one face of the five, closed with the others by the act at premise grade in PSP-LEAST-ERASURE-01.

**Refused, by theorem.** That a certified Λ ≤ ε with ε > 0 decides the value (`certificate_decides_nothing`, `certification_never_forces`). That the backward flow is forced (`backward_not_forced`). That the erasure reading carries any load, or that P1 enters: neither does.

**Left, by theorem.** The inequality Λ ≤ 0 itself: the one keyed bit, read on the heat flow.

## Falsifiers

**F-Computed.** A zero of ζ computed off the line, which makes Λ > 0. The instrument is a computation that ends. It refutes the value and leaves every finite law standing. It is the one channel left open.

**F-Certificate.** A certified Λ ≤ ε with ε > 0 that decides Λ ≤ 0. The instrument is a computation with a proof of transfer. It would refute `certificate_decides_nothing` and `certification_never_forces`; closed by theorem on the model.

**F-Forward.** A real-rooted polynomial that turns non-real under the forward flow. The instrument is a computation. It would refute `forward_preserves` and `cubic_forward_preserves`; closed by theorem at degrees two and three, imported beyond, and twin-corroborated to degree eight.

## Links

Codex, the RH engine's toy flow: `flow_monotone`, `reality_transported`, `real_at_Lam`, `rh_iff_lambda_zero`, `flowed_record_forgets`, `upstream_is_not_forced`. Closure_Executed: `crossing_irreducible`. Heat_Bridge, a different bridge: `count_to_heat`. Siblings: PSP-FREEDOM-LOCUS-01, PSP-EVERY-PRIME-01, and PSP-LEAST-ERASURE-01, where the heat face joins the other four (`faces_are_one`).
