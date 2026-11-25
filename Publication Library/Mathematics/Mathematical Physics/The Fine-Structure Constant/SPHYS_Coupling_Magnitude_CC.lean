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
