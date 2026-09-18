set_option autoImplicit false
namespace EulerStage
abbrev Plane := Int × Int
/-! ## THE STAGE OF THE FILE: half-units, the fold about h = 1 -/
def τ (p : Plane) : Plane := (2 - p.1, p.2)
def onLine (p : Plane) : Prop := p.1 = 1
def FoldInvariant (Z : Plane → Prop) : Prop := ∀ p, Z p → Z (τ p)
/-- THE EULER CASE, as the stage can state it: the product gives no zero at or right of Re s = 1, the functional
    equation none at or left of 0, so every zero has 0 < h < 2 in half-units. -/
def EulerStrip (Z : Plane → Prop) : Prop := ∀ p, Z p → 0 < p.1 ∧ p.1 < 2
/-- On this stage the kernel checks it: a fold-invariant zero set in the Euler strip lies on the line. -/
theorem euler_case_on_the_stage (Z : Plane → Prop) (_hZ : FoldInvariant Z) (hE : EulerStrip Z) :
    ∀ p, Z p → onLine p := by
  intro p hp; have := hE p hp; show p.1 = 1; omega
/-- The same, with only positivity assumed and the fold supplying the other side. -/
theorem euler_case_positivity (Z : Plane → Prop) (hZ : FoldInvariant Z) (hpos : ∀ p, Z p → 0 < p.1) :
    ∀ p, Z p → onLine p := by
  intro p hp
  have h1 := hpos p hp
  have h2 := hpos (τ p) (hZ p hp)
  show p.1 = 1; simp [τ] at h2; omega

/-! ## THE SAME STAGE AT RESOLUTION m: units 1/(2m), the fold about h = m, the strip 0 < h < 2m -/
def τm (m : Int) (p : Plane) : Plane := (2*m - p.1, p.2)
def onLineM (m : Int) (p : Plane) : Prop := p.1 = m
def FoldInvariantM (m : Int) (Z : Plane → Prop) : Prop := ∀ p, Z p → Z (τm m p)
def EulerStripM (m : Int) (Z : Plane → Prop) : Prop := ∀ p, Z p → 0 < p.1 ∧ p.1 < 2*m
/-- At resolution 1 the two stages coincide, and the theorem above is the m = 1 case. -/
theorem resolution_one_is_the_stage (Z : Plane → Prop) : EulerStripM 1 Z ↔ EulerStrip Z := by
  constructor <;> intro h p hp <;> have := h p hp <;> omega
/-- At any finer resolution the Euler strip has interior: the pair at h = m-1 and h = m+1 is fold-invariant, in the
    strip, and off the line. The Davenport–Heilbronn offset 0.3085 sits at h = m ± 0.617 m, representable once
    m ≥ 2. -/
def offPair (m : Int) (p : Plane) : Prop := (p.1 = m - 1 ∨ p.1 = m + 1) ∧ p.2 = 171
theorem euler_case_refined (m : Int) (hm : 2 ≤ m) :
    FoldInvariantM m (offPair m) ∧ EulerStripM m (offPair m) ∧ ¬ (∀ p, offPair m p → onLineM m p) := by
  refine ⟨?_, ?_, ?_⟩
  · intro p hp; obtain ⟨h, t⟩ := p; obtain ⟨hh, ht⟩ := hp
    show (2*m - h = m - 1 ∨ 2*m - h = m + 1) ∧ t = 171; omega
  · intro p hp; obtain ⟨h, t⟩ := p; obtain ⟨hh, ht⟩ := hp; simp only at hh; omega
  · intro h; have := h (m - 1, 171) ⟨Or.inl rfl, rfl⟩; simp only [onLineM] at this; omega
/-- So the Euler-strip premise entails the line property exactly at the one resolution that cannot represent an
    off-line point, and at no finer one. -/
theorem euler_entails_line_iff_resolution_one (m : Int) (hm : 1 ≤ m) :
    (∀ Z, FoldInvariantM m Z → EulerStripM m Z → ∀ p, Z p → onLineM m p) ↔ m = 1 := by
  constructor
  · intro h
    refine Decidable.byContradiction fun hne => ?_
    have hm2 : 2 ≤ m := by omega
    obtain ⟨hF, hE, hno⟩ := euler_case_refined m hm2
    exact hno (h _ hF hE)
  · rintro rfl Z hZ hE p hp
    have := hE p hp; show p.1 = 1; omega
end EulerStage
#print axioms EulerStage.euler_case_on_the_stage
#print axioms EulerStage.euler_case_refined
#print axioms EulerStage.euler_entails_line_iff_resolution_one
