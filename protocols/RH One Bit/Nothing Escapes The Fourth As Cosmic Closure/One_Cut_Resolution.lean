/-
  ONE CUT AT EVERY RESOLUTION. Core Lean 4, standalone, no library. No axiom is declared anywhere in this file.
  The chart of One_Cut.lean has the line at x = 1 and the fold x ↦ 2 - x. On the integers the only point
  strictly inside the doubled strip 0 < x < 2 is the line itself, so that chart's off-line pair sits on the
  edges x = 0 and x = 2, the real parts 0 and 1. Here the same chart is taken at resolution n: the line at
  x = n, the fold x ↦ 2n - x, registration to (n, t), the strip 0 < x < 2n, so one unit of x is 1/(2n) of
  the real part. Every theorem of the cut holds at every resolution. From resolution 2 on the open strip
  carries points off the line, and at resolution 10, the grid of One_Cut_Twin.f90, the pair x = 8 and
  x = 12, real parts 0.4 and 0.6, stands strictly inside the strip, off the line, and registers to one record.
-/
namespace OneCutRes

structure Pt where
  x : Int
  t : Nat
  deriving DecidableEq, Repr

variable (n : Int)

def onLine (z : Pt) : Prop := z.x = n
instance (z : Pt) : Decidable (onLine n z) := inferInstanceAs (Decidable (z.x = n))
def inStrip (z : Pt) : Prop := 0 < z.x ∧ z.x < 2 * n
instance (z : Pt) : Decidable (inStrip n z) := inferInstanceAs (Decidable (0 < z.x ∧ z.x < 2 * n))
def fold (z : Pt) : Pt := ⟨2 * n - z.x, z.t⟩
def reg (z : Pt) : Pt := ⟨n, z.t⟩

/-- The fold is an involution at every resolution. -/
theorem fold_involution (z : Pt) : fold n (fold n z) = z := by
  cases z with
  | mk x t =>
    show Pt.mk (2 * n - (2 * n - x)) t = Pt.mk x t
    congr 1
    omega

/-- Its fixed set is exactly the line. -/
theorem fold_fixed_iff (z : Pt) : fold n z = z ↔ onLine n z := by
  cases z with
  | mk x t =>
    show Pt.mk (2 * n - x) t = Pt.mk x t ↔ x = n
    constructor
    · intro h
      have hx := congrArg Pt.x h
      change 2 * n - x = x at hx
      omega
    · intro h
      congr 1
      omega

/-- Registration lands every point on the line. -/
theorem reg_lands_on_line (z : Pt) : onLine n (reg n z) := rfl

/-- It fixes every point already there. -/
theorem reg_fixes_line (z : Pt) (h : onLine n z) : reg n z = z := by
  cases z with
  | mk x t =>
    have hx : x = n := h
    show Pt.mk n t = Pt.mk x t
    congr 1
    omega

/-- The unicorn: a point off the line is never the image of a registration. -/
theorem unicorn_never_registered (z : Pt) (h : ¬ onLine n z) : ∀ w, reg n w ≠ z := by
  intro w hw
  apply h
  have l := reg_lands_on_line n w
  rw [hw] at l
  exact l

/-- Registration keeps the height and forgets the side. -/
theorem reg_forgets_side (z : Pt) : reg n (fold n z) = reg n z := rfl

/-- The ghost: no reading of the record recovers the side. -/
theorem ghost_side_unread {β : Type} (g : Pt → β) (z : Pt) : g (reg n (fold n z)) = g (reg n z) := rfl

/-- Off the line, the two points of the orbit are distinct. -/
theorem off_line_pair_distinct (z : Pt) (h : ¬ onLine n z) : fold n z ≠ z :=
  fun e => h ((fold_fixed_iff n z).1 e)

/-- One cut, one bit: off the line, a partner, a forgotten side, and no registration, all at once. -/
theorem ghost_and_unicorn_one_bit (z : Pt) (h : ¬ onLine n z) :
    fold n z ≠ z ∧ reg n (fold n z) = reg n z ∧ ∀ w, reg n w ≠ z :=
  ⟨off_line_pair_distinct n z h, rfl, unicorn_never_registered n z h⟩

/-- Nothing escapes, at every resolution. -/
theorem nothing_escapes_one_cut (z : Pt) :
    (onLine n z ∧ fold n z = z ∧ reg n z = z) ∨
    (¬ onLine n z ∧ fold n z ≠ z ∧ reg n (fold n z) = reg n z ∧ ∀ w, reg n w ≠ z) := by
  by_cases h : onLine n z
  · exact Or.inl ⟨h, (fold_fixed_iff n z).2 h, reg_fixes_line n z h⟩
  · exact Or.inr ⟨h, off_line_pair_distinct n z h, rfl, unicorn_never_registered n z h⟩

/-- On any list of zeros, registration erases nothing exactly when every zero is on the line. -/
theorem lossless_iff_on_line (Z : List Pt) : (∀ z ∈ Z, reg n z = z) ↔ (∀ z ∈ Z, onLine n z) := by
  constructor
  · intro h z hz
    have e := h z hz
    have l := reg_lands_on_line n z
    rw [e] at l
    exact l
  · intro h z hz
    exact reg_fixes_line n z (h z hz)

/-- Resolution 1 is the chart of One_Cut.lean: the fold x ↦ 2 - x and registration to (1, t). -/
theorem resolution_one_is_the_chart (z : Pt) : fold 1 z = ⟨2 - z.x, z.t⟩ ∧ reg 1 z = ⟨1, z.t⟩ := by
  cases z with
  | mk x t =>
    constructor
    · show Pt.mk (2 * 1 - x) t = Pt.mk (2 - x) t
      congr 1
    · rfl

/-- At resolution 1 the open strip holds no point off the line: that chart's off-line pair sits on the
    edges, the real parts 0 and 1. -/
theorem coarse_strip_is_the_line (z : Pt) (h : inStrip 1 z) : onLine 1 z := by
  cases z with
  | mk x t =>
    have hs : 0 < x ∧ x < 2 * 1 := h
    show x = 1
    omega

/-- From resolution 2 on, the open strip carries a point off the line. -/
theorem interior_off_line_exists (hn : 2 ≤ n) : ∃ z : Pt, inStrip n z ∧ ¬ onLine n z :=
  ⟨⟨n - 1, 0⟩, ⟨(by show 0 < n - 1; omega), (by show n - 1 < 2 * n; omega)⟩,
   (by show ¬ (n - 1 = n); intro h; omega)⟩

/-- At resolution 10, the grid of the twin: the pair x = 8 and x = 12, real parts 0.4 and 0.6, stands
    strictly inside the strip, is off the line, is distinct, and registers to one record. -/
theorem interior_pair_at_resolution_ten :
    fold 10 ⟨8, 0⟩ = ⟨12, 0⟩ ∧ inStrip 10 ⟨8, 0⟩ ∧ inStrip 10 ⟨12, 0⟩ ∧ ¬ onLine 10 ⟨8, 0⟩ ∧
    fold 10 ⟨8, 0⟩ ≠ ⟨8, 0⟩ ∧ reg 10 (fold 10 ⟨8, 0⟩) = reg 10 ⟨8, 0⟩ ∧ ∀ w, reg 10 w ≠ ⟨8, 0⟩ :=
  ⟨by decide, by decide, by decide, by decide, by decide, rfl,
   unicorn_never_registered 10 ⟨8, 0⟩ (by decide)⟩

/-- The twin's sweep, decided in the kernel: on the 19 interior real parts by 20 heights of the grid,
    the fold is an involution, registration lands on the line, and every off-line point has a distinct
    partner sharing its record. -/
theorem twin_grid_decided :
    ((List.range 19).all fun i => (List.range 20).all fun t =>
      let z : Pt := ⟨(i : Int) + 1, t⟩
      decide (fold 10 (fold 10 z) = z) && decide (onLine 10 (reg 10 z)) &&
      (decide (onLine 10 z) || (decide (fold 10 z ≠ z) && decide (reg 10 (fold 10 z) = reg 10 z)))) = true := by
  decide

end OneCutRes

#print axioms OneCutRes.fold_involution
#print axioms OneCutRes.fold_fixed_iff
#print axioms OneCutRes.reg_lands_on_line
#print axioms OneCutRes.reg_fixes_line
#print axioms OneCutRes.unicorn_never_registered
#print axioms OneCutRes.reg_forgets_side
#print axioms OneCutRes.ghost_side_unread
#print axioms OneCutRes.off_line_pair_distinct
#print axioms OneCutRes.ghost_and_unicorn_one_bit
#print axioms OneCutRes.nothing_escapes_one_cut
#print axioms OneCutRes.lossless_iff_on_line
#print axioms OneCutRes.resolution_one_is_the_chart
#print axioms OneCutRes.coarse_strip_is_the_line
#print axioms OneCutRes.interior_off_line_exists
#print axioms OneCutRes.interior_pair_at_resolution_ten
#print axioms OneCutRes.twin_grid_decided
