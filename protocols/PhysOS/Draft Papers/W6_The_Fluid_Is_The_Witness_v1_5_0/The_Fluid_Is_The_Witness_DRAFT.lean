/-
  SPHYS_Fluid.lean · Viscosity as the priced arrow · core Lean 4, no library.
  On the reversible branch two characteristics whose rear moves faster cross in finite time:
  the flow leaves the regular locus. On the priced branch a viscous step is a weighted average,
  so it never exceeds the old maximum nor falls below the old minimum, and it cuts a jump. A
  forced erasure is confined to the forced class. Finite models.
-/
namespace SPHYS.Fluid

/-- Characteristics x1 + u1 t and x2 + u2 t meet at t = (x2 - x1)/(u1 - u2) > 0, written
    without division: tn / td is the meeting time. -/
theorem characteristics_cross (x1 x2 u1 u2 : Int) (hx : x1 < x2) (hu : u2 < u1) :
    0 < x2 - x1 ∧ 0 < u1 - u2 ∧
    x1 * (u1 - u2) + u1 * (x2 - x1) = x2 * (u1 - u2) + u2 * (x2 - x1) := by
  refine ⟨by omega, by omega, ?_⟩
  simp only [Int.mul_sub]
  simp only [Int.mul_comm u1 x1, Int.mul_comm u1 x2, Int.mul_comm u2 x2, Int.mul_comm u2 x1]
  omega

/-- The viscous step at weight one quarter: 4 u' = u(i-1) + 2 u(i) + u(i+1). -/
theorem max_principle (a b c M : Int) (ha : a ≤ M) (hb : b ≤ M) (hc : c ≤ M) :
    a + 2 * b + c ≤ 4 * M := by omega
theorem min_principle (a b c m : Int) (ha : m ≤ a) (hb : m ≤ b) (hc : m ≤ c) :
    4 * m ≤ a + 2 * b + c := by omega

/-- One step on a jump 0,0,4,4 gives 0,1,3,4, written scaled by four as 0,4,12,16: the largest
    neighbour difference falls from 16 to 8 scaled, from 4 to 2 in the field. The priced arrow
    smooths. -/
def step4 (l c r : Int) : Int := l + 2 * c + r
theorem jump_is_cut :
    step4 0 0 0 = 0 ∧ step4 0 0 4 = 4 ∧ step4 0 4 4 = 12 ∧ step4 4 4 4 = 16 ∧
    (12 - 4 : Int) < 16 := by decide

/-- A forced erasure is an instance of the forced class, and no instance of a disjoint class. -/
theorem forced_erasure_confined {S : Type} (P Zf Zu : S → Prop)
    (hdisj : ∀ s, Zf s → ¬ Zu s) (he : ∃ s, Zf s ∧ ¬ P s) : ∃ s, ¬ P s ∧ ¬ Zu s :=
  match he with | ⟨s, hs, hp⟩ => ⟨s, hp, hdisj s hs⟩

/-- The viscous step on the whole lattice, at every resolution: 4 u'(i) = u(i-1) + 2 u(i) + u(i+1). -/
def step (u : Int → Int) (i : Int) : Int := u (i - 1) + 2 * u i + u (i + 1)
theorem step_bounds (u : Int → Int) (m M : Int) (h : ∀ i, m ≤ u i ∧ u i ≤ M) (i : Int) :
    4 * m ≤ step u i ∧ step u i ≤ 4 * M := by
  have h1 := h (i - 1)
  have h2 := h i
  have h3 := h (i + 1)
  unfold step
  constructor
  · omega
  · omega
def stepN : Nat → (Int → Int) → (Int → Int)
  | 0, u => u
  | n + 1, u => step (stepN n u)
/-- The discrete maximum principle after every number of steps: the field, scaled by 4^n, stays
    between 4^n times the old minimum and 4^n times the old maximum, for all data, at every point. -/
theorem max_principle_all_steps (u : Int → Int) (m M : Int) (h : ∀ i, m ≤ u i ∧ u i ≤ M) :
    ∀ n i, 4 ^ n * m ≤ stepN n u i ∧ stepN n u i ≤ 4 ^ n * M := by
  intro n
  induction n with
  | zero =>
    intro i
    show 4 ^ 0 * m ≤ u i ∧ u i ≤ 4 ^ 0 * M
    rw [Int.pow_zero, Int.one_mul, Int.one_mul]
    exact h i
  | succ k ih =>
    intro i
    have hb := step_bounds (stepN k u) (4 ^ k * m) (4 ^ k * M) ih i
    show 4 ^ (k + 1) * m ≤ step (stepN k u) i ∧ step (stepN k u) i ≤ 4 ^ (k + 1) * M
    rw [Int.pow_succ, Int.mul_comm (4 ^ k) 4, Int.mul_assoc, Int.mul_assoc]
    exact hb

end SPHYS.Fluid
#print axioms SPHYS.Fluid.characteristics_cross
#print axioms SPHYS.Fluid.max_principle
#print axioms SPHYS.Fluid.min_principle
#print axioms SPHYS.Fluid.jump_is_cut
#print axioms SPHYS.Fluid.forced_erasure_confined
#print axioms SPHYS.Fluid.step_bounds
#print axioms SPHYS.Fluid.max_principle_all_steps