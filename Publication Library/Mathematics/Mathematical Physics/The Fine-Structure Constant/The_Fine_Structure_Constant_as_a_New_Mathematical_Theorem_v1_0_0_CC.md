# The Fine-Structure Constant as a New Mathematical Theorem

## Why No Formula Returns 137: One Coupling, Universal and Positive, Whose Value the Law Cannot Fix

**Mohammad F. Islam** · 24 November 2026

*On edition 1.0.0. This paper stands beside Light as a New Mathematical Theorem (Islam, 2026c), which forces the law of light from conservation. It asks what that law leaves open, and proves the answer.*

## Abstract

That the fine-structure constant is a magnitude, read from measurement and returned by no verdict of the form of the law, is established here as a mathematical theorem, on two named bridges. The law of light is forced by conservation in Light as a New Mathematical Theorem (Islam, 2026c), and its static part is the conservation of the flux of a charge. We prove in core Lean 4, seventeen laws with no axiom declared and no use of choice, that the law admits every value of its source; that every rescaling of a solution is a solution; that the source determines the flux through every sphere, so that the solutions form a family of one parameter; that the law carries no scale of length; and that no verdict which gives a flux and each of its positive multiples one answer can single out a source that is not zero. What the form does fix is proved beside it: there is one coupling, it is common to every pair of charges, it is positive as the square of the unit of charge, and like charges repel while unlike charges attract for every value of it.

This theorem accounts for the failure of the formulas. Eddington's integer and Wyler's expression each set a combination of integers and $\pi$ equal to the constant. A Fortran twin runs eleven checks with zero failures: against the measured $1/\alpha=137.035999177(21)$ the integer 137 stands $1.7\times10^{6}$ uncertainties away and Wyler's value 3965; the flux of a point source through two hundred spheres off their centre equals the source to one part in $10^{9}$ with the inverse square, while with the power 2.1 the flux through the sphere of radius two is 0.933 of the flux through radius one; and the forced exponent agrees with the measured one to parts in $10^{16}$. The theorem does not say that no law could fix the constant. It says that the forced law does not, and that a law which did would have to carry a scale.

## The Standing of This Work

**The fine-structure constant is established here as a magnitude.** The law that conservation forces on the flux of a charge has a solution for every value of the source, and no verdict of its form tells one value from another. The number 137.035999 is read from the world. It is not hidden in the law.

**Nothing is added.** This work adds no field, no symmetry and no parameter, and it declares zero axioms in core Lean 4, with no use of choice. It stands on two bridges, printed with their grades in section 1.

| Level | Framework | Standing | What is overcome |
|---|---|---|---|
| Projection | The formulas: Eddington (1946), Wyler (1969) | a combination of integers and $\pi$ is set equal to the constant | each fails at the precision now measured, and nothing says why a formula should exist |
| Realization | Quantum electrodynamics | the constant is a parameter, measured, and every prediction is a series in it | takes the value as given and is silent on whether it could be derived |
| Foundation | The coupling as a magnitude, this work | theorems checked by the kernel in core Lean 4, no axiom declared, no choice, on two named bridges | proves that the forced law admits every value and that no scale-blind verdict fixes one, and proves what the form does fix |

**What quantum electrodynamics assumed, this work proves.** There the constant is a free parameter because nothing in the theory fixes it. Here that freedom is a theorem of the forced law.

| Prior position | What it held | What this work proves |
|---|---|---|
| Coulomb (1785) | the force falls as the inverse square, by experiment | the inverse square is the conservation of a flux in three dimensions (`inverse_square_law`) |
| Sommerfeld (1916) | one pure number sets the strength of light on matter | there is one coupling, common to every pair of charges and positive (`one_coupling_for_every_pair`, `a_square_coupling_is_positive`) |
| Eddington (1946), Wyler (1969) | the number is a formula | no scale-blind verdict of the law fixes a source (`no_scale_blind_verdict_fixes_the_source`); both formulas fail by measurement |
| Quantum electrodynamics | the number is a free parameter | every source is admitted (`every_source_is_admitted`) |

**The law has one parameter and no scale.** Two solutions of the law differ by one number, the ratio of their sources, at every radius (`fluxes_are_proportional`). Stretch every length by one factor and a solution is unchanged (`the_law_has_no_scale`). A law of that kind cannot return a number: whatever it says of one solution it says of every multiple.

**Three warrants bound the claim.** The theorem is about the forced law of the flux, which is the law of light at rest and at long range. At short range the quantum theory brings in lengths, the Compton wavelengths of the charged particles, and the measured value of the coupling depends on the distance at which it is read; the value quoted here is the one at zero momentum transfer (Navas et al., 2024). Those lengths are masses, and a mass is itself a magnitude (Islam, 2026e). Second, the theorem does not exclude a further law that is not scale-blind; it says what such a law must carry. Third, the two bridges are premises of the paper, and a result that breaks one breaks the theorem: section 8 names the observation.

## The Coupling Is a Magnitude

### 1. The Question, and the Rule of This Paper

The strength with which light acts on charge is one pure number, $\alpha$, close to $1/137$. A pure number invites a formula. **This paper proves that the forced law of light contains no such formula**, and it proves what the law does fix about the coupling.

The rule is that of the companion papers. Only the seat and the root are allowed. Every other step is a theorem of the engine in Appendix A, a theorem of a companion paper named beside it, one of two bridges named here before it is used, or one of four classical results listed below.

| Bridge | What it says | Grade |
|---|---|---|
| B1 | The flux of a charge is conserved: the same through every surface that holds it. | structural: the static part of the law that Light forces (Islam, 2026c, `conservation_forces_maxwell`), by Gauss's theorem, on the bridges that paper prints |
| B2 | The verdicts of the seat are scale-blind: each gives a solution and its positive multiples one answer. | premise |

A verdict is a statement about a solution of the law. B2 is a premise and is printed as one. The verdicts the seat issues in the companion papers are of three kinds: that a quantity vanishes, that it has a sign, and that a count has a value. The engine proves the first two kinds scale-blind, and conservation itself (`vanishing_is_scale_blind`, `the_sign_is_scale_blind`, `conservation_is_scale_blind`). A count is not a function of the source. That every verdict the seat can issue is of these kinds is not proved here.

Four classical results enter by name. Gauss's theorem joins the forced law to the conservation of the flux of a charge at rest. The source is the same in every direction, so that one number is the flux through a sphere. The area of a sphere grows as the square of its radius, which is three dimensions of space; Light prints the count for every dimension (`flux_in_every_dimension`). And the constant is the coupling of the law in units where the quantum of action and the speed of light are one: between two unit charges at distance $r$ the force is $\alpha\hbar c/r^{2}$ (Sommerfeld, 1916). Nothing else enters.

A solution of the law is called a flux, its value through a sphere of radius one the source, and the source of a unit charge the coupling.

### 2. The Law of Flux and the Inverse Square

The flux $\Phi(r)$ through the sphere of radius $r$ is conserved when it is the same for every $r$. The strength $E$ reads the flux at $r$ when $E(r)\,r^{2}=\Phi(r)$, the $4\pi$ of the area being carried in the flux. Where the strength reads a conserved flux at two radii, strength times the square of the radius is the same at both (`inverse_square_law`), and at double the radius the strength is a quarter (`a_quarter_at_double`). The engine exhibits a source that is not zero, 36, with strengths 36, 9 and 4 at radii one, two and three (`the_law_is_inhabited`), so the statements are not empty.

The law is stated on the flux and not on the strength for a reason the kernel checks. In the integers of the engine a strength defined at every integer radius, with $E(r)\,r^{2}$ the same at all of them, has that number equal to zero: it would be divisible by every square (`a_strength_at_every_integer_radius_vanishes`). The flux is an integer for every source, and the strength is read from it where the division is exact.

### 3. Every Source Is Admitted

**For every integer $q$ there is a conserved flux with source $q$** (`every_source_is_admitted`). The law does not select among them. Every multiple of a solution is a solution (`every_rescaling_is_a_solution`), the multiple zero and the negative ones included. Two conserved fluxes with one source agree through every sphere (`the_source_determines_the_flux`), and any two conserved fluxes stand in one ratio at every radius, the ratio of their sources (`fluxes_are_proportional`). The solutions are therefore a family of one parameter, and the parameter is the source.

### 4. No Scale, and No Scale-Blind Verdict

Stretch every radius by one factor and a conserved flux is unchanged (`the_law_has_no_scale`). The law carries no length against which a number could be set.

Call a verdict scale-blind when it gives a flux and every positive multiple of that flux one answer. **No scale-blind verdict holds of exactly the solutions with one given source that is not zero** (`no_scale_blind_verdict_fixes_the_source`). The proof is one line: if the verdict held of the solution with source $q$, it would hold of its double, whose source is $2q$, and $2q=q$ only for $q=0$. By B2 the verdicts of the seat are of this kind. **On B2, no verdict of the seat returns the coupling.**

### 5. What the Form Does Fix

The form leaves the value open and fixes the rest. The force between charges of $n$ and $m$ units is the coupling times $nm$, so that the forces of any two pairs stand in the ratio of the products of their charges (`one_coupling_for_every_pair`): **there is one coupling, and it is common to every charge.** As the square of the unit of charge it is positive (`a_square_coupling_is_positive`). With a positive coupling like charges repel and unlike charges attract, whatever its value (`like_repel_unlike_attract`). One number, universal, positive: these are theorems. Its size is read.

### 6. Two Formulas, Measured

The table sets two published formulas and the forced exponent against published measurements. Every row is a retrodiction: each measurement, and each formula, stood before this work. The measured value is $1/\alpha=137.035999177(21)$ (Mohr et al., 2025).

| Proposed or forced | Value | Measured | Distance |
|---|---|---|---|
| Eddington (1946): an integer | 137 | 137.035999177(21) | $1.7\times10^{6}$ uncertainties |
| Wyler (1969): $\alpha=\dfrac{9}{8\pi^{4}}\left(\dfrac{\pi^{5}}{2^{4}\,5!}\right)^{1/4}$ | 137.036082448 | 137.035999177(21) | 3965 uncertainties |
| The exponent of the law, forced in three dimensions | 2 | $2+(2.7\pm3.1)\times10^{-16}$ (Williams, Faller and Hill, 1971) | within one uncertainty |

Both formulas are excluded: each stands more than five uncertainties from the measured value, the threshold the twin sets. The theorem of section 4 is the reason behind the two failures, on B2: a verdict of the form cannot return the number, so a formula of integers and $\pi$ can agree with it only by coincidence, and a coincidence ends when the measurement tightens. The twin computes the flux of a point source through two hundred spheres set off their centre: with the inverse square it equals the source to one part in $10^{9}$, and with the power 2.1 the flux through radius two is 0.93303 of the flux through radius one.

### 7. What the Theorem Does Not Say

It does not say that the constant cannot be explained. It says that the forced law of the flux does not explain it, and that no verdict blind to scale can. A law that fixed the constant would have to tell a solution from its multiples, and such a law carries a scale. The quantum theory has such scales, the masses of the charged particles, and through them the coupling read at short distance differs from the coupling read at long distance. That shift is computed from the masses and the long-range value; it moves the question to the masses, which the companion paper proves are magnitudes too (Islam, 2026e).

### 8. The Ledger, the Falsifier, and What Stands Open

| Claim | Carried by | Grade |
|---|---|---|
| the inverse square is the conservation of a flux | `inverse_square_law`, `a_quarter_at_double`, on B1 | theorem of a conserved flux; structural through B1, with the area of the sphere as a classical result |
| every source is admitted; the solutions are a family of one parameter | `every_source_is_admitted`, `every_rescaling_is_a_solution`, `the_source_determines_the_flux`, `fluxes_are_proportional` | theorem |
| the law has no scale of length | `the_law_has_no_scale` | theorem |
| no scale-blind verdict fixes a source | `no_scale_blind_verdict_fixes_the_source` | theorem |
| no verdict of the seat returns the coupling | the same, with B2 | premise grade, on B2 |
| one coupling, common, positive; like repel, unlike attract | `one_coupling_for_every_pair`, `a_square_coupling_is_positive`, `like_repel_unlike_attract` | theorem |
| the value of the constant | none | measured |

**F-Square.** A measured exponent of Coulomb's law different from two, beyond its uncertainty, breaks the conservation of the flux in three dimensions, which is B1, and with it every row above. The measured deviation is $(2.7\pm3.1)\times10^{-16}$.

**F-Common.** Two charges whose forces do not stand in the ratio of the products of their charges break the common coupling of section 5; no measurement is cited for it here.

**What stands open.** B2 is a premise: that every verdict the seat can issue is blind to scale is not proved. The value of the constant is open in the sense of section 7, and the paper does not close it.

**The coupling is a magnitude.** The forced law admits every value of it, carries no scale, and gives its form: one, common and positive. On B2 no verdict of the seat returns its size.

## Author's Provenance and Method Disclosure

**Who wrote it.** The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean files and the Fortran twins are written by a language model under the author's direct supervision.

**Method.** The work stands on one seat, the fixed line of a reflection, and one root, that nothing escapes the record, both set out in Nothing Escapes, Least Erasure (Islam, 2026a). The law of light is forced in Light as a New Mathematical Theorem (Islam, 2026c); the conservation of the flux of a charge at rest is its static part and enters here as bridge B1. That the verdicts of the seat are scale-blind enters as bridge B2. Both are printed in section 1 at their grades, with the classical results that enter by name. Every theorem named in the text is declared under that name in Appendix A or in the engine of the companion paper named beside it. The kernel line of every theorem of Appendix A is printed in Appendix B. Every measured value in the text names its source beside it. An earlier draft of the engine stated the law on a strength given at every integer radius. Theorem `a_strength_at_every_integer_radius_vanishes` shows that family holds only zero, and the engine printed here states the law on the flux.

**The seat.** The seat is elementary geometry: a reflection of the plane and the line it fixes. It is set out in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

**Classical sources.** The inverse square is Coulomb's law (1785), and that it is the conservation of a flux is Gauss's theorem. The constant was introduced by Sommerfeld (1916). That classical electrodynamics carries no scale of length, and that the constant is a free parameter of quantum electrodynamics, are textbook results. This paper proves in a kernel that the forced law admits every source and that no scale-blind verdict fixes one, and it prints the premise under which that closes the question for the seat.

## References

1. C. A. Coulomb, Mém. Acad. R. Sci. Paris (1785) 569.
2. A. Sommerfeld, Ann. Phys. 51 (1916) 1.
3. A. S. Eddington, Fundamental Theory, Cambridge University Press (1946).
4. A. Wyler, C. R. Acad. Sci. Paris A 269 (1969) 743.
5. E. R. Williams, J. E. Faller and H. A. Hill, Phys. Rev. Lett. 26 (1971) 721.
6. S. Navas et al. (Particle Data Group), Phys. Rev. D 110 (2024) 030001.
7. P. J. Mohr, D. B. Newell, B. N. Taylor and E. Tiesinga, Rev. Mod. Phys. 97 (2025) 025002.
8. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).
9. M. F. Islam, Light as a New Mathematical Theorem, edition 1.0.0 (2026c).
10. M. F. Islam, Matter as a New Mathematical Theorem, edition 1.0.0 (2026e).

## Appendix A · SPHYS_Coupling_Magnitude_CC.lean

Core Lean 4.19.0, no import, no axiom declared, no use of choice, compiled with warnings fatal, exit 0. The kernel lines follow in Appendix B.

```lean
/-
  SPHYS_Coupling_Magnitude_CC.lean · The coupling of light is a magnitude · core Lean 4, no library.

  THE THEOREM. The law that conservation forces on the flux of a charge admits every value of its source, is
  closed under every rescaling, and has no scale of length. No verdict that gives a flux and its positive multiples one
  answer can single out a value of the source. The fine-structure constant is read from measurement; no formula
  of the form returns it. What the form does fix: there is one coupling, it is common to every pair of charges,
  and as the square of the unit of charge it is positive.

  RATIONALE. An earlier draft took the strength of the field, F, as an integer at every integer radius and asked
  that F(r)·r² be the same at every radius. Part V proves that only F = 0 off the origin satisfies this: the
  number F(1) would have to be divisible by every square. That family holds one member, so "every rescaling is a
  solution" and "the law fixes no coupling" were true of nothing but zero. This file takes the flux through a
  sphere as the primary object, Φ(r), which is an integer for every source, and reads the strength from it at
  the radii where the division is exact. `every_source_is_admitted` then holds for every integer, and
  `the_law_is_inhabited` exhibits a source that is not zero with its strengths at three radii.

  DESIGN. Integers only. The flux carries the 4π of the area. `Conserved Φ`: the flux is the same through every
  sphere. `Reads E Φ r`: strength times r² is the flux at r. `ScaleBlind P`: the verdict P cannot tell a flux
  from a positive multiple of it. No axiom is declared.

  WHAT ENTERS AS A DEFINITION, NOT AS A THEOREM. That the reading is the same in every direction, so that one
  number is the flux through a sphere; that the area of a sphere grows as the square of its radius, which is
  three dimensions of space (Light as a New Mathematical Theorem prints the count for every dimension); and the
  conservation itself, which that paper forces.

  WHAT THIS FILE DOES NOT PROVE. It does not prove that no theory fixes the coupling. It proves that this law does
  not, and that no scale-blind verdict can. A theory with a further law, one that is not scale-blind, is outside
  the theorem, and the paper says so.

  RISK. `ScaleBlind` is a hypothesis of one theorem. That the verdicts of the seat are scale-blind is a bridge of
  the paper, printed there at its grade.
  NON-NEGOTIABLE. The value 1/137.035999... appears in no declaration below and follows from none.
-/
namespace SPHYS.Coupling

/-! ## Part I. The flux law and the inverse square -/

/-- The flux is conserved: the same through every sphere about the source. -/
def Conserved (Φ : Int → Int) : Prop := ∀ r s : Int, r ≠ 0 → s ≠ 0 → Φ r = Φ s

/-- The strength E reads the flux Φ at the radius r: strength times area is flux. -/
def Reads (E Φ : Int → Int) (r : Int) : Prop := E r * (r * r) = Φ r

/-- THE INVERSE SQUARE. Where the strength reads a conserved flux at two radii, strength times the square of
    the radius is the same at both. -/
theorem inverse_square_law (E Φ : Int → Int) (h : Conserved Φ) (r s : Int) (hr : r ≠ 0) (hs : s ≠ 0)
    (er : Reads E Φ r) (es : Reads E Φ s) : E r * (r * r) = E s * (s * s) := by
  unfold Reads at er es
  rw [er, es]; exact h r s hr hs

/-- A QUARTER AT DOUBLE THE RADIUS. -/
theorem a_quarter_at_double (E Φ : Int → Int) (h : Conserved Φ) (r : Int) (hr : r ≠ 0)
    (e1 : Reads E Φ r) (e2 : Reads E Φ (2 * r)) : 4 * E (2 * r) = E r := by
  unfold Reads at e1 e2
  have h4 : (2 * r) * (2 * r) = 4 * (r * r) := by
    rw [Int.mul_assoc, Int.mul_left_comm r 2 r]; omega
  have h2r : (2 * r) ≠ 0 := by omega
  have hc := h (2 * r) r h2r hr
  rw [h4, hc, ← e1] at e2
  apply Int.eq_of_mul_eq_mul_right (Int.mul_ne_zero hr hr)
  rw [Int.mul_comm 4 (E (2 * r)), Int.mul_assoc]
  exact e2

/-- THE LAW IS INHABITED. A source that is not zero, with its strengths at radii 1, 2 and 3: 36, 9 and 4. -/
theorem the_law_is_inhabited :
    ∃ E Φ : Int → Int, Conserved Φ ∧ Φ 1 = 36 ∧ Reads E Φ 1 ∧ Reads E Φ 2 ∧ Reads E Φ 3 ∧ 4 * E 2 = E 1 :=
  ⟨fun r => if r = 1 then 36 else if r = 2 then 9 else 4, fun _ => 36,
   fun _ _ _ _ => rfl, rfl, by unfold Reads; decide, by unfold Reads; decide, by unfold Reads; decide, by decide⟩

/-! ## Part II. The law fixes no source -/

/-- EVERY SOURCE IS ADMITTED. For every integer there is a conserved flux with that source. -/
theorem every_source_is_admitted (q : Int) : ∃ Φ : Int → Int, Conserved Φ ∧ Φ 1 = q :=
  ⟨fun _ => q, fun _ _ _ _ => rfl, rfl⟩

/-- EVERY RESCALING OF A SOLUTION IS A SOLUTION. -/
theorem every_rescaling_is_a_solution (Φ : Int → Int) (h : Conserved Φ) (k : Int) :
    Conserved (fun r => k * Φ r) := fun r s hr hs => by
  show k * Φ r = k * Φ s
  rw [h r s hr hs]

/-- THE SOURCE DETERMINES THE FLUX. Two conserved fluxes with one source agree at every radius. -/
theorem the_source_determines_the_flux (Φ Ψ : Int → Int) (hΦ : Conserved Φ) (hΨ : Conserved Ψ)
    (h1 : Φ 1 = Ψ 1) (r : Int) (hr : r ≠ 0) : Φ r = Ψ r := by
  rw [hΦ r 1 hr (by decide), hΨ r 1 hr (by decide), h1]

/-- ONE NUMBER APART. Any two conserved fluxes stand in one ratio at every radius, the ratio of their sources. -/
theorem fluxes_are_proportional (Φ Ψ : Int → Int) (hΦ : Conserved Φ) (hΨ : Conserved Ψ)
    (r : Int) (hr : r ≠ 0) : Ψ r * Φ 1 = Φ r * Ψ 1 := by
  rw [hΦ r 1 hr (by decide), hΨ r 1 hr (by decide)]; exact Int.mul_comm _ _

/-- THE LAW HAS NO SCALE OF LENGTH. Stretch every radius by one factor and the flux is unchanged. -/
theorem the_law_has_no_scale (Φ : Int → Int) (h : Conserved Φ) (l r : Int) (hl : l ≠ 0) (hr : r ≠ 0) :
    Φ (l * r) = Φ r := h _ _ (Int.mul_ne_zero hl hr) hr

/-! ## Part III. No scale-blind verdict returns the source -/

/-- A verdict is scale-blind when it gives a flux and every positive multiple of it one answer. Positive, so
    that a verdict on the sign of the source is of this kind. -/
def ScaleBlind (P : (Int → Int) → Prop) : Prop :=
  ∀ (Φ : Int → Int) (k : Int), 0 < k → (P Φ ↔ P (fun r => k * Φ r))

/-- Conservation is such a verdict. -/
theorem conservation_is_scale_blind : ScaleBlind Conserved := fun Φ k hk =>
  ⟨fun h => every_rescaling_is_a_solution Φ h k,
   fun h r s hr hs => Int.eq_of_mul_eq_mul_left (Int.ne_of_gt hk) (h r s hr hs)⟩

/-- Whether the source vanishes is such a verdict. -/
theorem vanishing_is_scale_blind : ScaleBlind (fun Φ => Φ 1 = 0) := fun Φ k hk => by
  show Φ 1 = 0 ↔ k * Φ 1 = 0
  constructor
  · intro h; rw [h, Int.mul_zero]
  · intro h
    rcases Int.mul_eq_zero.mp h with h0 | h0
    · exact absurd h0 (Int.ne_of_gt hk)
    · exact h0

/-- The sign of the source is such a verdict. -/
theorem the_sign_is_scale_blind : ScaleBlind (fun Φ => 0 < Φ 1) := fun Φ k hk => by
  show 0 < Φ 1 ↔ 0 < k * Φ 1
  constructor
  · intro h; exact Int.mul_pos hk h
  · intro h
    rcases Int.lt_trichotomy 0 (Φ 1) with hp | hz | hn
    · exact hp
    · rw [← hz, Int.mul_zero] at h; exact absurd h (by decide)
    · have := Int.mul_neg_of_pos_of_neg hk hn
      omega

/-- NO SCALE-BLIND VERDICT FIXES THE SOURCE. No verdict of that kind holds of exactly the fluxes with one
    given source that is not zero. -/
theorem no_scale_blind_verdict_fixes_the_source (P : (Int → Int) → Prop) (hP : ScaleBlind P) :
    ¬ ∃ q : Int, q ≠ 0 ∧ ∀ Φ : Int → Int, Conserved Φ → (P Φ ↔ Φ 1 = q) := by
  intro ⟨q, hq, h⟩
  have c : Conserved (fun _ : Int => q) := fun _ _ _ _ => rfl
  have p1 : P (fun _ : Int => q) := (h _ c).mpr rfl
  have p2 := (hP (fun _ : Int => q) 2 (by decide)).mp p1
  have c2 : Conserved (fun r : Int => 2 * (fun _ : Int => q) r) := every_rescaling_is_a_solution _ c 2
  have e : 2 * q = q := (h _ c2).mp p2
  omega

/-! ## Part IV. What the form does fix: one coupling, common, positive -/

/-- The force between charges of n and m units, with coupling a and the radius set aside. -/
def pairForce (a n m : Int) : Int := a * (n * m)

/-- ONE COUPLING FOR EVERY PAIR. The forces of any two pairs stand in the ratio of the products of their
    charges: the coupling is common to all of them. -/
theorem one_coupling_for_every_pair (a n m n' m' : Int) :
    pairForce a n m * (n' * m') = pairForce a n' m' * (n * m) := by
  unfold pairForce
  simp only [Int.mul_assoc, Int.mul_comm, Int.mul_left_comm]

/-- THE COUPLING IS POSITIVE: it is the square of the unit of charge. -/
theorem a_square_coupling_is_positive (e : Int) (he : e ≠ 0) : 0 < e * e := by
  rcases Int.lt_or_gt_of_ne he with h | h
  · exact Int.mul_pos_of_neg_of_neg h h
  · exact Int.mul_pos h h

/-- LIKE CHARGES REPEL AND UNLIKE ATTRACT, for every value of a positive coupling. -/
theorem like_repel_unlike_attract (a n m : Int) (ha : 0 < a) :
    (0 < n * m → 0 < pairForce a n m) ∧ (n * m < 0 → pairForce a n m < 0) := by
  unfold pairForce
  exact ⟨fun h => Int.mul_pos ha h, fun h => Int.mul_neg_of_pos_of_neg ha h⟩

/-! ## Part V. Why the flux is the primary object -/

/-- A STRENGTH GIVEN AT EVERY INTEGER RADIUS VANISHES. If strength times r² is the same integer at every radius,
    that integer is divisible by every square, and it is zero. The law is stated on the flux for this reason. -/
theorem a_strength_at_every_integer_radius_vanishes (F : Int → Int)
    (h : ∀ r s : Int, r ≠ 0 → s ≠ 0 → F r * (r * r) = F s * (s * s)) : F 1 = 0 := by
  have key : ∀ r : Int, r ≠ 0 → F r * (r * r) = F 1 := fun r hr => by
    have := h r 1 hr (by decide)
    rw [this]; simp only [Int.mul_one]
  let n : Nat := (F 1).natAbs + 1
  have hn : (n : Int) ≠ 0 := by omega
  have e := key (n : Int) hn
  have ea : (F 1).natAbs = (F (n : Int)).natAbs * (n * n) := by
    have hnn : (n : Int).natAbs = n := by omega
    rw [← e, Int.natAbs_mul, Int.natAbs_mul, hnn]
  cases hm : (F (n : Int)).natAbs with
  | zero =>
    rw [hm] at ea
    have : (F 1).natAbs = 0 := by omega
    exact Int.natAbs_eq_zero.mp this
  | succ m =>
    rw [hm, Nat.succ_mul] at ea
    have hle : n * 1 ≤ n * n := Nat.mul_le_mul_left n (by omega)
    rw [Nat.mul_one] at hle
    have hn' : n = (F 1).natAbs + 1 := rfl
    omega

/-! ## Part VI. The capstone -/

/-- THE COUPLING IS A MAGNITUDE. Every source is admitted; every rescaling of a solution is a solution; the
    source determines the flux; the law has no scale; no scale-blind verdict fixes a source; and the coupling
    is positive. -/
theorem the_coupling_is_a_magnitude :
    (∀ q : Int, ∃ Φ : Int → Int, Conserved Φ ∧ Φ 1 = q) ∧
    (∀ (Φ : Int → Int), Conserved Φ → ∀ k : Int, Conserved (fun r => k * Φ r)) ∧
    (∀ (Φ Ψ : Int → Int), Conserved Φ → Conserved Ψ → Φ 1 = Ψ 1 → ∀ r : Int, r ≠ 0 → Φ r = Ψ r) ∧
    (∀ (Φ : Int → Int), Conserved Φ → ∀ l r : Int, l ≠ 0 → r ≠ 0 → Φ (l * r) = Φ r) ∧
    (∀ P : (Int → Int) → Prop, ScaleBlind P →
        ¬ ∃ q : Int, q ≠ 0 ∧ ∀ Φ : Int → Int, Conserved Φ → (P Φ ↔ Φ 1 = q)) ∧
    (∀ e : Int, e ≠ 0 → 0 < e * e) :=
  ⟨every_source_is_admitted, every_rescaling_is_a_solution, the_source_determines_the_flux,
   the_law_has_no_scale, no_scale_blind_verdict_fixes_the_source, a_square_coupling_is_positive⟩

end SPHYS.Coupling

#print axioms SPHYS.Coupling.inverse_square_law
#print axioms SPHYS.Coupling.a_quarter_at_double
#print axioms SPHYS.Coupling.the_law_is_inhabited
#print axioms SPHYS.Coupling.every_source_is_admitted
#print axioms SPHYS.Coupling.every_rescaling_is_a_solution
#print axioms SPHYS.Coupling.the_source_determines_the_flux
#print axioms SPHYS.Coupling.fluxes_are_proportional
#print axioms SPHYS.Coupling.the_law_has_no_scale
#print axioms SPHYS.Coupling.conservation_is_scale_blind
#print axioms SPHYS.Coupling.vanishing_is_scale_blind
#print axioms SPHYS.Coupling.the_sign_is_scale_blind
#print axioms SPHYS.Coupling.no_scale_blind_verdict_fixes_the_source
#print axioms SPHYS.Coupling.one_coupling_for_every_pair
#print axioms SPHYS.Coupling.a_square_coupling_is_positive
#print axioms SPHYS.Coupling.like_repel_unlike_attract
#print axioms SPHYS.Coupling.a_strength_at_every_integer_radius_vanishes
#print axioms SPHYS.Coupling.the_coupling_is_a_magnitude
```

## Appendix B · Kernel lines of Appendix A

```text
'SPHYS.Coupling.inverse_square_law' does not depend on any axioms
'SPHYS.Coupling.a_quarter_at_double' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.the_law_is_inhabited' does not depend on any axioms
'SPHYS.Coupling.every_source_is_admitted' does not depend on any axioms
'SPHYS.Coupling.every_rescaling_is_a_solution' does not depend on any axioms
'SPHYS.Coupling.the_source_determines_the_flux' does not depend on any axioms
'SPHYS.Coupling.fluxes_are_proportional' depends on axioms: [propext]
'SPHYS.Coupling.the_law_has_no_scale' depends on axioms: [propext]
'SPHYS.Coupling.conservation_is_scale_blind' depends on axioms: [propext]
'SPHYS.Coupling.vanishing_is_scale_blind' depends on axioms: [propext]
'SPHYS.Coupling.the_sign_is_scale_blind' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.no_scale_blind_verdict_fixes_the_source' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.one_coupling_for_every_pair' depends on axioms: [propext]
'SPHYS.Coupling.a_square_coupling_is_positive' depends on axioms: [propext]
'SPHYS.Coupling.like_repel_unlike_attract' depends on axioms: [propext]
'SPHYS.Coupling.a_strength_at_every_integer_radius_vanishes' depends on axioms: [propext, Quot.sound]
'SPHYS.Coupling.the_coupling_is_a_magnitude' depends on axioms: [propext, Quot.sound]
```

## Appendix C · Coupling_Magnitude_Twin_CC.f90

Eleven checks, zero failures: eight computing the flux of a point source through spheres by quadrature (A to C), two setting a published formula against the measured value (D) and one setting the forced exponent against a published measurement (E). The run follows in Appendix D.

```fortran
! Coupling_Magnitude_Twin_CC.f90 · numerical twin of SPHYS_Coupling_Magnitude_CC.lean
! RATIONALE. The engine proves that the flux law admits every source and that no scale-blind verdict fixes one.
!   This twin computes the flux of a point source through spheres by quadrature (A to C) and sets three numbers
!   against measurement (D, E).
! DESIGN. Double precision, no library. The source sits at distance a from the centre of a sphere of radius R, on
!   its axis. With a strength falling as the power p of the distance, the flux through the sphere is
!     (q/2) R**2 * integral over theta of (R - a cos theta) sin theta / (R**2 + a**2 - 2 a R cos theta)**((p+1)/2),
!   computed by the midpoint rule on 200000 intervals. For p = 2 it is q when the source is inside and 0 when it
!   is outside, whatever R and a; for any other p it depends on R. A fixed linear congruential generator.
!   Measured inputs: the inverse fine-structure constant 137.035999177(21), CODATA 2022 (Mohr et al. 2025); the
!   bound on a deviation of the exponent of Coulomb's law from two, (2.7 +- 3.1)e-16 (Williams, Faller and Hill 1971).
!   Formulas tested in D: Eddington's integer 137 (1929), and Wyler's expression (1969),
!   alpha = (9 / (8 pi**4)) (pi**5 / (2**4 5!))**(1/4).
! RISK. D tests two formulas. It does not test every formula; that none can come from the form is the engine's
!   theorem, on the bridge the paper prints. Quadrature tolerance is 1e-6 of the source.
! NON-NEGOTIABLE. A formula is called excluded only when it stands more than five printed uncertainties away.
program coupling_twin
  implicit none
  integer, parameter :: dp = kind(1.0d0)
  integer :: nfail, npass, i, d
  integer(8) :: seed
  logical :: ok, ok2
  real(dp) :: pi, aw, ainv, sig, dev, q, k, r, a, f1, f2, lam, worst
  nfail = 0; npass = 0; seed = 20260622_8; pi = 4.0_dp*atan(1.0_dp)

  ! A. the inverse square conserves the flux, and no other power does
  ok = .true.; ok2 = .true.; worst = 0.0_dp
  do i = 1, 200
    q = 1.0_dp + urand()*99.0_dp; r = 0.5_dp + urand()*9.5_dp; a = urand()*0.8_dp*r
    f1 = flux(q, r, a, 2.0_dp); worst = max(worst, abs(f1 - q)/q)
    if (abs(f1 - q) > 1.0e-6_dp*q) ok = .false.
    a = r*(1.3_dp + urand()*3.0_dp)                       ! the source outside the sphere
    if (abs(flux(q, r, a, 2.0_dp)) > 1.0e-6_dp*q) ok2 = .false.
  end do
  write(*,'(a,es9.2)') '  200 spheres about a source off their centre: largest departure of the flux from the source, ', worst
  call check('A1 with the inverse square, the flux through every sphere holding the source is the source', ok)
  call check('A2 and the flux through every sphere not holding it is zero', ok2)
  f1 = flux(1.0_dp, 1.0_dp, 0.0_dp, 2.1_dp); f2 = flux(1.0_dp, 2.0_dp, 0.0_dp, 2.1_dp)
  write(*,'(a,f8.5,a,f8.5)') '  with the power 2.1: flux through radius 1, ', f1, '; through radius 2, ', f2
  call check('A3 with the power 2.1 the flux through two spheres differs by more than one part in a hundred', &
             abs(f1 - f2) > 0.01_dp*f1)
  f1 = flux(1.0_dp, 1.0_dp, 0.0_dp, 1.9_dp); f2 = flux(1.0_dp, 2.0_dp, 0.0_dp, 1.9_dp)
  call check('A4 and with the power 1.9', abs(f1 - f2) > 0.01_dp*f1)

  ! B. every rescaling of the source is a solution, and two fluxes stand in the ratio of their sources
  ok = .true.; ok2 = .true.
  do i = 1, 200
    q = 1.0_dp + urand()*9.0_dp; k = -50.0_dp + urand()*100.0_dp; r = 0.5_dp + urand()*9.5_dp; a = urand()*0.8_dp*r
    f1 = flux(q, r, a, 2.0_dp); f2 = flux(k*q, 2.0_dp*r, 0.3_dp*r, 2.0_dp)   ! the rescaled source, another sphere
    if (abs(f2 - k*q) > 1.0e-6_dp*abs(k*q) + 1.0e-9_dp) ok = .false.
    if (abs(f2*q - f1*k*q) > 1.0e-6_dp*abs(k*q*q) + 1.0e-9_dp) ok2 = .false.
  end do
  call check('B1 the flux of a source rescaled by any number, positive or negative, is conserved', ok)
  call check('B2 two conserved fluxes stand in the ratio of their sources through any two spheres', ok2)

  ! C. the law has no scale of length: stretch the sphere and the offset by one factor and the flux is unchanged
  ok = .true.
  do i = 1, 200
    q = 1.0_dp + urand()*9.0_dp; r = 0.5_dp + urand()*9.5_dp; a = urand()*0.8_dp*r; lam = 0.01_dp + urand()*100.0_dp
    if (abs(flux(q, lam*r, lam*a, 2.0_dp) - flux(q, r, a, 2.0_dp)) > 1.0e-6_dp*q) ok = .false.
  end do
  call check('C1 with the inverse square, stretching every length by one factor leaves the flux unchanged', ok)
  f1 = flux(1.0_dp, 1.0_dp, 0.2_dp, 2.1_dp); f2 = flux(1.0_dp, 7.0_dp, 1.4_dp, 2.1_dp)
  call check('C2 with the power 2.1 it does not: that law carries a length', abs(f1 - f2) > 0.01_dp*f1)

  ! D. two formulas for the number, against the measurement
  ainv = 137.035999177_dp; sig = 0.000000021_dp
  dev = (137.0_dp - ainv)/sig
  write(*,'(a,es10.3,a)') '  Eddington, 137 exactly: ', abs(dev), ' uncertainties from the measured value'
  call check('D1 the integer 137 stands more than five uncertainties from the measured value', abs(dev) > 5.0_dp)
  aw = (9.0_dp/(8.0_dp*pi**4))*(pi**5/(16.0_dp*120.0_dp))**0.25_dp
  dev = (1.0_dp/aw - ainv)/sig
  write(*,'(a,f14.9,a,f8.1,a)') '  Wyler: 1/alpha = ', 1.0_dp/aw, ', ', abs(dev), ' uncertainties from the measured value'
  call check('D2 the value of Wyler stands more than five uncertainties from the measured value', abs(dev) > 5.0_dp)

  ! E. the exponent of the law: the area of a sphere in d dimensions of space grows as the power d - 1 of its radius
  d = 3
  write(*,'(a,i0)') '  power of the radius by which the strength falls in three dimensions: ', d - 1
  call check('E  the forced exponent, two, lies within two uncertainties of the measured (2.7 +- 3.1)e-16 from two', &
             abs(real(d - 1 - 2, dp) - 2.7e-16_dp) < 2.0_dp*3.1e-16_dp)

  write(*,'(a,i0,a,i0)') 'checks passed: ', npass, '   failures: ', nfail
contains
  real(dp) function flux(qq, rr, aa, p)
    real(dp), intent(in) :: qq, rr, aa, p
    integer, parameter :: n = 200000
    integer :: j
    real(dp) :: th, s2, acc
    acc = 0.0_dp
    do j = 1, n
      th = (real(j, dp) - 0.5_dp)*pi/real(n, dp)
      s2 = rr*rr + aa*aa - 2.0_dp*aa*rr*cos(th)
      acc = acc + (rr - aa*cos(th))*sin(th)/s2**(0.5_dp*(p + 1.0_dp))
    end do
    flux = 0.5_dp*qq*rr*rr*acc*pi/real(n, dp)
  end function
  real(dp) function urand()          ! uniform on [0, 1)
    seed = mod(seed*6364136223846793005_8 + 1442695040888963407_8, 9223372036854775807_8)
    if (seed < 0) seed = -seed
    urand = real(mod(seed/65536_8, 1000000_8), dp)/1.0e6_dp
  end function
  subroutine check(name, cond)
    character(*), intent(in) :: name
    logical, intent(in) :: cond
    if (cond) then
      write(*,'(a,a)') '  PASS  ', name; npass = npass + 1
    else
      write(*,'(a,a)') '  FAIL  ', name; nfail = nfail + 1
    end if
  end subroutine
end program coupling_twin
```

## Appendix D · Run of Appendix C

```text
  200 spheres about a source off their centre: largest departure of the flux from the source,  1.28E-10
  PASS  A1 with the inverse square, the flux through every sphere holding the source is the source
  PASS  A2 and the flux through every sphere not holding it is zero
  with the power 2.1: flux through radius 1,  1.00000; through radius 2,  0.93303
  PASS  A3 with the power 2.1 the flux through two spheres differs by more than one part in a hundred
  PASS  A4 and with the power 1.9
  PASS  B1 the flux of a source rescaled by any number, positive or negative, is conserved
  PASS  B2 two conserved fluxes stand in the ratio of their sources through any two spheres
  PASS  C1 with the inverse square, stretching every length by one factor leaves the flux unchanged
  PASS  C2 with the power 2.1 it does not: that law carries a length
  Eddington, 137 exactly:  1.714E+06 uncertainties from the measured value
  PASS  D1 the integer 137 stands more than five uncertainties from the measured value
  Wyler: 1/alpha =  137.036082448,   3965.3 uncertainties from the measured value
  PASS  D2 the value of Wyler stands more than five uncertainties from the measured value
  power of the radius by which the strength falls in three dimensions: 2
  PASS  E  the forced exponent, two, lies within two uncertainties of the measured (2.7 +- 3.1)e-16 from two
checks passed: 11   failures: 0
```
