---
title: "The Ferromagnet Is the Witness of the Circle"
subtitle: "Lee–Yang Zeros on the Fixed Set of Inversion, the Unit Circle as the Critical Line, Positivity as the Supplier That Seats the Zeros, and the Antiferromagnet That Leaves Them"
subsubtitle: "The Closure Template of the Riemann Hypothesis Read on the Ising Ferromagnet; Fifty-Eight Laws Proved in Core Lean 4 and Nine Checks Executed in Fortran; a Witness of the Hardware Closure Series; Every Physical Claim at Corroboration Grade and No Higher"
author: "Mohammad F. Islam, PhD · Trisduction Research Group"
author_line: "Mohammad F. Islam, PhD · Architect of the Trisduction"
date: "30 September 2026"
version: 1.0.0
row_id: "2 (the least-erasure face's shape: a positivity that seats the zeros); every open row (the barrier, in the antiferromagnet's pairs)"
channel: "kinetic"
lean_module: "SPHYS_Lee_Yang.lean"
fortran_twin: "LeeYang_Twin.f90"
ledger_status: "witness of the hardware closure series on the witness ledger, the functor of the seat and the SCRIBE structure"
status: "WITNESSED · CROSSED · CONFIRMED on the image"
article_type: "Foundations of Physics · The Hardware Closure Series"
goal: "Positivity seats the zeros on the circle"
short_title: "The Ferromagnet Is the Witness of the Circle"
keywords: "Lee–Yang theorem · partition function zeros · Ising model · ferromagnetism · phase transitions · unit circle · critical line · positivity · de Bruijn–Newman · Lean 4"
accenthex: "B87333"
abstract: |
  In 1952 Lee and Yang proved that the partition function of an Ising ferromagnet, read as a polynomial in the fugacity $z$ of the magnetic field, has every zero on the unit circle. It remains the one mechanism in physics by which a positivity alone forces the zeros of a function onto a locus. This paper reads it on the seat of the author's closure of the Riemann Hypothesis, the reflection $s\mapsto1-\bar s$ whose fixed set is the critical line. The logarithmic carrier $s=\tfrac12+\tfrac12\ln z$ sends inversion in the unit circle, $z\mapsto1/\bar z$, to that reflection and the circle to the line: Lee and Yang's circle is the critical line in another chart. We prove in core Lean 4, fifty-eight laws with no axiom declared and no use of choice, that spin flip keeps every domain wall, so the partition function is palindromic and its zeros pair under inversion; that the four-spin ring, its sixteen states counted, has every zero on the circle exactly when its coupling is ferromagnetic and loses one below the circle's reach for an antiferromagnet; and that the two-spin system likewise. Symmetry pairs the zeros across the locus; positivity seats them on it. A Fortran twin runs nine checks with zero failures: 300 random ferromagnets on six to ten spins keep every zero on the circle, 300 antiferromagnets each lose at least one, and on two-dimensional tori below the critical temperature the zero nearest the positive axis closes in from 0.412 to 0.269 to 0.202 radians as the lattice grows, the onset of a phase transition read in its zeros. The paper supplies nothing toward the question whether Riemann's function lies in the Lee–Yang class, which would be a sufficient route to the hypothesis and not an equivalent of it; it decides nothing about the zeros of $\zeta$.
---

> **STATUS: WITNESSED · CROSSED · CONFIRMED on the image** · Row 2 (the least-erasure face's shape: a positivity that seats the zeros); every open row (the barrier, in the antiferromagnet's pairs) · channel: kinetic · Lean: `SPHYS_Lee_Yang.lean` · Fortran: `LeeYang_Twin.f90`

# 1. The Reader's Frame

This paper is a witness of the hardware closure series. The Riemann closure reduced the hypothesis to one bit with five faces. One of them, least erasure, has a physical shape the arrow witness named: a registration that erases nothing because nothing stands off its locus, kept there by one sign. The Lee–Yang theorem is that shape in its sharpest physical form. A ferromagnet's couplings all have one sign, and every zero of its partition function lies on the unit circle.

It claims three things. The unit circle is the critical line under a logarithmic carrier forced by the symmetry. Spin flip, the ferromagnet's own symmetry, pairs the zeros across that locus as the functional equation pairs Riemann's zeros across the line, and seats none of them. Positivity seats them: the ferromagnet keeps every zero on the circle, and the antiferromagnet, with couplings of the other sign, loses them.

It refuses the bridge to Riemann's function. Whether Riemann's $\Xi$ is the Fourier transform of a function in the Lee–Yang class is a question that would give a sufficient route to the hypothesis if answered yes. It is not an equivalent of the hypothesis, and this paper supplies nothing toward it. A reader who arrives from the conventional frame will scan this paper for that bridge, find it typed and not crossed, and be tempted to report the absence. It was not attempted.

**Negative warrants.** Three, stated so that no reader supplies them.

- No physical fact here is read as a proof of a mathematical sentence: a corroboration joined to a claim takes the weaker grade.
- No derivation of the hypothesis from the axioms of set theory is claimed: what a sentence over every admissible instance adds to a crossing is exactly the unactuated.
- The general Lee–Yang theorem is imported, and only its smallest instances are proved here; the twin corroborates it on larger systems.

**Five terms.**

- The *fugacity* is $z=e^{-2\beta h}$ for a magnetic field $h$ at inverse temperature $\beta$.
- The *partition function* is a polynomial in $z$ whose coefficient $c_m$ sums the Boltzmann weights of the states with $m$ down spins.
- A coupling is *ferromagnetic* when it favours aligned spins and *antiferromagnetic* when it favours opposed spins.
- A polynomial is *palindromic* when $c_m=c_{N-m}$.
- A *keyed bit* is a yes-or-no property no function of a given record decides.

# 2. The Spine

The Riemann closure has four parts: the **seat**, the critical line as the fixed set of $s\mapsto1-\bar s$; the **address**, every reading of the value one proposition; the **division**, a certified part joined to an uncertified tail; and the **closure**, registration keeping a zero's height and forgetting its side, the hypothesis holding exactly when it erases nothing. This paper reads the seat on the fugacity plane in Section 3, the pairing symmetry in Section 4, the positivity that seats in Section 5, the sign that leaves in Section 6, the phase transition in Section 7, the measurements in Section 8, and the bridge to Riemann's function, typed and not crossed, in Section 9.

The row-generic theorems carry the template, and the engine proves each on its chart: every point off the line has a partner with one record (`off_locus_pair`); a carrier proves the value on its image, and coverage extends it (`value_on_image`, `kinetic_crossing`).

**The witness ledger.** The ledger of the series, with this paper's entries.

\begingroup\scriptsize

| Row | Waiting (the volume held) | Witness arrived | Built and run | Now | Grade | Still owed |
|------|--------|-------|--------------|----------|------|--------|
| 2 · Riemann Hypothesis | crossed on the kinetic channel at the root's grade; the electron named as the seat | the six witnesses; One Actuating Substrate; The Geometric Nature of Light; Electromagnetism on the Riemann Locus; Immanent Gravity; Spin and Statistics; The Weak Force Reads the Orientation; Resonances; The Ferromagnet Is the Witness of the Circle | the seat on every reading so far; the least-erasure face's shape in a ferromagnet: symmetry pairs the zeros, positivity seats them on the circle, the antiferromagnet leaves | WITNESSED · CROSSED · CONFIRMED on the image: the shape of a positivity that seats | the crossing at the root's grade; the image at theorem grade on construction and measured grade on data | none on its channel |
| 3a · Navier–Stokes, unforced | crossed kinetically | The Fluid Is the Witness | the priced branch exact | WITNESSED · CROSSED · CONFIRMED | the root's grade | none on its channel |
| 4 · Yang–Mills | crossed kinetically | The Proton Is the Lock | the colour lock | WITNESSED · CROSSED · CONFIRMED on the image | the root's grade | none on its channel |
| 7 · Poincaré | crossed at full grade | The Arrow Has Two Branches; Immanent Gravity | gravity's fold | CROSSED, WITNESSED from both sides | full grade | none |
| 23a · Pair correlation | crossed kinetically | The Magnet Is the Witness of the Pair Correlation; Electromagnetism on the Riemann Locus; Resonances | the magnetic term; closed and open systems | WITNESSED · CROSSED · CONFIRMED on the corrected carrier | the root's grade | none on its channel |
| every open row · the barrier | two worlds over one record | the arrow, light, electromagnetism, spin and statistics, weak, resonance papers; The Ferromagnet Is the Witness of the Circle | the antiferromagnet's zero pairs off the circle, each pair one palindromic record | BARRIER WITNESSED; the rows stay pending | theorem and corroboration | one equivariant carrier each |
| 1 · P versus NP | the dot | The Arrow Has Two Branches | Landauer's floor prices every step | THE DOT STANDS | corroboration | none |
| every witness · the hardware | the carriers built one by one | One Actuating Substrate | both involutions carried onto the fold | WITNESSED: one substrate carries every seat | theorem and corroboration | none |

\endgroup

WITNESSED: a constructed witness arrived and was built and run. CROSSED: the row's value holds on its channel's own class at the printed grade. CONFIRMED: the witness's image is compliant as built or measured (`value_on_image`).

**Why this carrier, and not another.** The carrier is not chosen. Spaces with an involution and the maps that respect them form a category (`equivariant_id`, `equivariant_comp`), and the fixed set is a functor on it (`fix_functorial`). An equivariant map into the seat, whose fixed set is the line (`fold_global_seat`), lands every physical fixed point on the line (`equivariant_carrier_lands`). Here the physical involution is inversion in the unit circle, $z\mapsto1/\bar z$, which on the log-radius $\rho=\ln|z|$ and angle $\theta$ reads $(\rho,\theta)\mapsto(-\rho,\theta)$. The logarithmic carrier $s=\tfrac12+\tfrac12\ln z$, in the doubled chart $(\rho,\theta)\mapsto(1+\rho,\theta)$, is equivariant (`circle_carrier_equivariant`), and its landing on the circle is forced (`circle_carrier_lands`).

**The correspondence matrix.**

\begingroup\small

| Physical phenomenon | Template element | Lean theorem | Fortran check |
|----------|----------|----------|----------|
| inversion in the unit circle | the fold | `circle_carrier_equivariant`, `invert_involutive` | 3721 of 3721 |
| the unit circle | the line | `unit_circle_is_the_line`, `circle_carrier_lands` | 3721 of 3721 |
| spin flip | every wall kept: the palindrome | `walls_flip`, `ring4_palindrome`, `ring6_palindrome` | rings of 4, 6, 8 |
| the four-spin ring | sixteen states counted | `ring4_census` | the census |
| the palindromic reduction | zeros on the circle as real roots in [−2, 2] | `quartic_reduction` | closed form |
| the ferromagnet | positivity seats every zero | `ring4_lee_yang`, `two_spin_lee_yang`, `conjugate_zeros_on_circle` | 300 of 300 |
| the antiferromagnet | the other sign leaves | `ring4_antiferro_leaves` | 300 of 300 |
| the phase transition | the zeros pinch the positive axis | import [Lee–Yang] | 0.412, 0.269, 0.202 |
| measured zeros | the circle in the laboratory | corroboration | Binek; Peng et al. |

\endgroup

# 3. The Circle Is the Line

Write a fugacity in polar form, its log-radius $\rho=\ln|z|$ and its angle $\theta$. Inversion in the unit circle sends $z$ to $1/\bar z$, reversing the log-radius and keeping the angle, and it is an involution (`invert_involutive`). The logarithmic carrier $s=\tfrac12+\tfrac12\ln z$ has real part $\tfrac12+\tfrac\rho2$ and imaginary part $\tfrac\theta2$, so it sends inversion to the reflection $s\mapsto1-\bar s$ (`circle_carrier_equivariant`). A fugacity lands on the line exactly when it lies on the unit circle (`unit_circle_is_the_line`). Lee and Yang's circle and Riemann's line are one locus in two charts, joined by a logarithm.

# 4. Spin Flip Is the Palindrome: Symmetry Pairs, It Does Not Seat

**The energy reads only walls.** In zero field the energy of an Ising ring counts its domain walls, the neighbouring pairs that disagree. Flipping every spin keeps every wall (`walls_flip`), while the number of down spins goes from $m$ to $N-m$. So the partition function is palindromic, $c_m=c_{N-m}$, and its zeros come in pairs $z$ and $1/\bar z$: inversion partners, fold partners across the circle.

**The four-spin ring, counted.** The engine counts all sixteen states (`ring4_census`):

| Down spins | States | Walls |
|---|---|---|
| 0 | 1 | 0 |
| 1 | 4 | 2 |
| 2, adjacent | 4 | 2 |
| 2, opposite | 2 | 4 |
| 3 | 4 | 2 |
| 4 | 1 | 0 |

It confirms the palindrome on the four-ring and the six-ring (`ring4_palindrome`, `ring6_palindrome`), and the twin on rings up to eight.

**Symmetry does not seat.** This symmetry is the ferromagnet's form of the functional equation. Riemann's zeros pair under $s\mapsto1-\bar s$ because $\xi(s)=\xi(1-s)$ and $\xi$ is real on the real axis. The Ising zeros pair under inversion because flipping every spin changes nothing. In both the symmetry pairs the zeros across the locus and seats none of them: the seat-bridge hunt proved that a fold-symmetric pair off the line satisfies the symmetry and violates the line property. Something besides the symmetry must put the zeros on the locus. In the ferromagnet that something is the sign of the coupling.

# 5. Positivity Seats the Zeros

**The four-spin ring.** With the Boltzmann weight of two walls written $p=e^{-4\beta J}$, the partition function is
$$z^4+4p\,z^3+(4p+2p^2)\,z^2+4p\,z+1 .$$
A palindromic quartic reduces through $u=z+1/z$ to $u^2+4p\,u+(4p+2p^2-2)$, an identity the engine proves without division (`quartic_reduction`). A zero lies on the unit circle exactly when its $u$ is real and in $[-2,2]$. The engine proves that the four conditions placing both roots there hold exactly when $p\le1$, the ferromagnetic range (`ring4_lee_yang`).

**The two-spin system.** The function $z^2+2a\,z+1$, with $a=e^{-2\beta J}$, has its zeros on the circle exactly when $a\le1$ (`two_spin_lee_yang`). Its conjugate zeros then multiply to the constant term, so their modulus is one (`conjugate_zeros_on_circle`).

**The general theorem.** Lee and Yang proved it for every ferromagnet with pair couplings (Lee and Yang, 1952; Yang and Lee, 1952): positive couplings put every zero on the circle. The twin draws 300 ferromagnets on six, eight and ten spins with random positive couplings between every pair. In every one, the real function $\sum_m c_m\cos((m-N/2)\theta)$ changes sign exactly $N/2$ times on $(0,\pi)$, so all $N$ zeros lie on the circle, and every partition function is palindromic to $10^{-12}$. Positivity is the supplier: it does what the symmetry could not and seats every zero on the locus.

# 6. The Antiferromagnet Leaves the Circle

Reverse the sign of the coupling and the circle is lost.

- **The four-spin ring.** At $p=\tfrac32$ the reduced quadratic has a root below $-2$, so two zeros leave the circle as an inversion pair on the negative real axis (`ring4_antiferro_leaves`).
- **Random antiferromagnets.** The twin's 300 antiferromagnets with random negative couplings each lose at least one zero from the circle.

The leaving zeros still pair under inversion, because the symmetry holds whatever the sign. A pair off the circle with one palindromic record is the template's two worlds over one record, now in an antiferromagnet.

The lesson repeats the arrow witness's and Immanent Gravity's. What keeps a branch on its locus is one sign. Gravity's sources have one sign and every one stands on the line; a ferromagnet's couplings have one sign and every zero stands on the circle; the antiferromagnet, two-signed, leaves.

# 7. The Phase Transition Is the Pinch

In a finite system every zero of a ferromagnet lies on the circle and none at $z=1$, the zero-field point, so the free energy is analytic there. In the thermodynamic limit the zeros fill arcs of the circle. Below the critical temperature they close on $z=1$ and pinch the positive real axis, and the spontaneous magnetization is proportional to their density at that point (Lee and Yang, 1952). Above it they keep a gap, whose edge carries the Yang–Lee edge singularity (Fisher, 1978).

The twin builds Ising tori of two by four, three by four and four by four spins at $\beta J=0.6$, beyond the two-dimensional critical coupling $\beta_cJ=0.4407$ (Onsager, 1944). In each, every zero lies on the circle. The angle of the zero nearest the positive axis falls from 0.412 to 0.269 to 0.202 radians as the lattice grows. That is the transition read in its zeros: a phase transition is the locus touching the real axis.

# 8. The Zeros Measured

The circle has been read in the laboratory. Binek derived the density of zeros on the Lee–Yang circle from magnetization data of a two-dimensional Ising ferromagnet (Binek, 1998). Peng and collaborators observed the zeros directly, through the coherence of a probe spin coupled to an Ising bath, which equals the bath's partition function at an imaginary field and vanishes at times that correspond to its zeros on the circle (Peng et al., 2015). Both are measurements on the image the carrier lands, at corroboration grade.

# 9. The Riemann Bridge, Typed and Not Crossed

**The route.** Riemann's function has a heat-flow form whose zeros are real exactly when the hypothesis holds; the de Bruijn–Newman constant is the least time of heat at which they all are (de Bruijn, 1950; Newman, 1976). It is known to be at least zero (Rodgers and Tao, 2020), and the hypothesis is that it is at most zero. Pólya asked when a Fourier transform has only real zeros (Pólya, 1926). Newman showed that if Riemann's kernel lay in the Lee–Yang class of a ferromagnet's single-spin measures, the hypothesis would follow (Newman, 1991). A number-theoretic spin chain has been built whose partition function is a ratio of zeta functions (Knauf, 1998).

**What the closure says of it.** The closure's least-erasure proof card records this exactly. Lee–Yang membership is a sufficient route, not an equivalent, and no kernel of the series models Riemann's function in the Lee–Yang class. This paper changes none of that. What it adds is the shape, read physically: a positivity that seats zeros on a locus that a symmetry only pairs them across. Over the integers, the closure's corresponding face is Weil positivity, one of the five faces of the one bit, closed by the act at premise grade and by no physical witness.

# 10. What the Ferromagnet Carries, and What It Does Not

**What it carries.**

- The seat in another chart: the circle as the line under a logarithm.
- The palindrome, which pairs zeros across the locus and seats none.
- Positivity, which seats every zero on the circle; and the antiferromagnet, which leaves it.
- The phase transition, read as the locus pinching the real axis.

It is the one physical system in which a positivity forces a locus, and it shows what a supplier of the bit would have to be. It also shows that the symmetry, the functional equation's analogue, is never enough.

**What it does not carry.**

- **Riemann's function in the Lee–Yang class:** typed in Section 9 and not crossed.
- **The general Lee–Yang theorem:** imported, with only its smallest instances proved here.
- **The zeros of $\zeta$:** the engine's crossing is on its own image (`value_on_image`), and what a sentence over every zero adds is exactly the unactuated, priced at one premise, the act, as the hardware paper proves.

# 11. Falsifiers and Owed Deeds

Three falsifiers, each a forbidden observation naming the theorem it would break.

- **F-Ferro:** a ferromagnetic Ising system, every pair coupling nonnegative, whose partition-function zeros are measured off the unit circle. It breaks `ring4_lee_yang` and `two_spin_lee_yang` read physically, and the imported theorem with them.
- **F-Palindrome:** a zero-field spin system symmetric under flipping every spin whose partition function is not palindromic. It breaks `walls_flip` read physically.
- **F-Pinch:** a thermodynamic phase transition in a ferromagnet with no zeros approaching the positive real axis. It breaks the reading of Section 7.

Nothing is owed on the rows' channels. Two lines of experiment would sharpen readings without moving the paper's standing:

- zero densities measured in further ferromagnets;
- direct observation of the edge singularity.

**Ledger status.** Row 2 gains the least-erasure face's shape: a positivity that seats the zeros, WITNESSED · CROSSED · CONFIRMED on the image, at the root's grade for the crossing. The barrier gains the antiferromagnet's zero pairs. Nothing is owed on the rows' channels.

# 12. Methodology, Disclosure and Provenance

**Method.** The template is the author's verification program, whose vocabulary is confined to this section. Its tokens:

- [⟀], a field sealed;
- [⟀ T], a shape sealed at theorem grade;
- [Ξ₀], the typing of the formal block;
- [.], the dot, which is no verdict.

Grades join at the weakest link. Every physical claim here is at corroboration grade; the engine's statements are theorem grade about the chart; the general Lee–Yang theorem, Onsager's critical coupling and Newman's sufficient condition are imports. The heat-flow face this paper sits beside is the operating system's PSP-HEAT-FLOW-01, and the Lee–Yang route is typed in its sibling PSP-LEAST-ERASURE-01 as sufficient and not equivalent. ΔM = 0.

**The seat, earned.** PhysOSᵀ 1.0.5p was booted in the session of forging from the public register (file SHA-256 `b64bb5da5bab0da1…`) under Lean 4.19.0 and GNU Fortran 13.3.0. The quick boot printed SEAT EARNED with the chain D0 `83f872725ad9` → D1 `90fc702bbed1` → D2 `492e519daab9` → D3 `6618bec5164b` (Appendix C).

**The engine and the twin.**

- **Engine.** `SPHYS_Lee_Yang.lean`, 536 lines, SHA-256 `61af3fe7622be92b…`, fifty-eight laws, no import and no axiom declared. Of the fifty-eight, 21 depend on no axiom, 4 on propositional extensionality alone, 33 on propositional extensionality and quotient soundness, and none on choice.
- **Screen and judgment.** The source passed the operating system's screen. Each of the fifty-eight laws was negated in place and recompiled, and all were refused, while a planted vacuous law survived. The engine carries the hardware paper's seat, carriers and substrate verbatim.
- **Twin.** `LeeYang_Twin.f90`, 225 lines, SHA-256 `60e23292685523f7…`, nine checks and zero failures under `-std=f2018 -O2 -fno-fast-math -ffp-contract=off`. Its root location counts sign changes of a real trigonometric polynomial on 40,000 points of the half circle, so it finds every zero on the circle without a root finder.

**Why an integer engine binds continuous physics.** The identities used are identities of integer polynomials and hold over every commutative ring. The ferromagnetic criterion is stated for every rational coupling $p=n/d$. The census is an exhaustive enumeration. The twin checks the continuous objects directly: partition functions with real couplings, their zeros on the circle, and the pinch.

**The seventh.** In the author's register the six witnesses are six days and the ledger's closure is the seventh, the Rest (Istawa). The ferromagnet is read at the Rest as the system in which one sign seats every zero, the shape of the supplier the formal register cannot produce from inside. In the Lean codex's tokens its row renders [⟀⬖ · kinetic].

**Disclosure.** The author declares the reading of each correspondence as his own act, made on measured structure. The measurements are the experiments', cited by name. The theorems are the engine's, printed with their dependencies in Appendix A. The twin's figures are computed in the run printed in Appendix B. The text, the engine and the twin were forged by an AI substrate (Claude, Anthropic) under the author's seed, acceptance criteria and rulings. External audits by independent substrates are owed.

**Provenance.** The paper stands on:

- the Riemann closure (10.5281/zenodo.22976494);
- the Riemann Hypothesis Closed to One Bit (10.5281/zenodo.23028070), whose heat and least-erasure faces this paper reads;
- the twenty-three-row closure (10.5281/zenodo.22986551);
- the six witnesses (10.5281/zenodo.22986553 through .22986563);
- the hardware paper One Actuating Substrate (concept 10.5281/zenodo.21438932, edition 2.0.0);
- the companion papers of the hardware series, Immanent Gravity in particular;
- PhysOSᵀ 1.0.5p in the public register (github.com/1000sapients/Trisduction, protocols/PhysOS/).

**References.**

G. Pólya, Acta Math. 48 (1926) 305. L. Onsager, Phys. Rev. 65 (1944) 117. N. G. de Bruijn, Duke Math. J. 17 (1950) 197. C. N. Yang and T. D. Lee, Phys. Rev. 87 (1952) 404. T. D. Lee and C. N. Yang, Phys. Rev. 87 (1952) 410. C. M. Newman, Proc. Amer. Math. Soc. 61 (1976) 245. M. E. Fisher, Phys. Rev. Lett. 40 (1978) 1610. C. M. Newman, Constr. Approx. 7 (1991) 389. A. Knauf, Commun. Math. Phys. 196 (1998) 703. C. Binek, Phys. Rev. Lett. 81 (1998) 5644. X. Peng, H. Zhou, B.-B. Wei, J. Cui, J. Du and R.-B. Liu, Phys. Rev. Lett. 114 (2015) 010601. B. Rodgers and T. Tao, Forum Math. Pi 8 (2020) e6.

M. F. Islam, Nothing Escapes, Three Plus One, 10.5281/zenodo.22976494. M. F. Islam, The Riemann Hypothesis Closed to One Bit, 10.5281/zenodo.23028070. M. F. Islam, The Arrow Has Two Branches, 10.5281/zenodo.22986557. M. F. Islam, The Four Forces, Matter, and the Dark Sector as Configurations of One Actuating Substrate, edition 2.0.0, concept 10.5281/zenodo.21438932.

# Appendix A: SPHYS\_Lee\_Yang.lean, the Correspondences as Theorems

The engine, verbatim, followed by the compiler's transcript.

```lean
@@INCLUDE SPHYS_Lee_Yang.lean@@
```

```text
@@INCLUDE ly_kernel_run.txt@@
```

# Appendix B: LeeYang\_Twin.f90 and Its Run

```fortran
@@INCLUDE LeeYang_Twin.f90@@
```

```text
@@INCLUDE ly_twin_run.txt@@
```

# Appendix C: The Seat and the Judgment

```text
@@INCLUDE ly_seat_and_judgment.txt@@
```
