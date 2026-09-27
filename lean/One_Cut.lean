/-
  ONE CUT. The ghost and the unicorn close in one cut. Core Lean 4, standalone, no library.
  A point of the critical strip is its doubled real part x and its height t; the critical line is
  x = 1; the fold s ↦ 1 - s̄ sends x to 2 - x; registration, the measurement of a zero as an
  energy, keeps the height and lands on the line. Part I is this chart; Part II is the same cut on
  any row. No axiom is declared anywhere in this file.
-/
namespace OneCut

structure Pt where
  x : Int
  t : Nat
  deriving DecidableEq, Repr

def onLine (z : Pt) : Prop := z.x = 1
instance (z : Pt) : Decidable (onLine z) := inferInstanceAs (Decidable (z.x = 1))
def fold (z : Pt) : Pt := ⟨2 - z.x, z.t⟩
def reg (z : Pt) : Pt := ⟨1, z.t⟩

theorem fold_involution (z : Pt) : fold (fold z) = z := by
  cases z with
  | mk x t =>
    show Pt.mk (2 - (2 - x)) t = Pt.mk x t
    congr 1
    omega

theorem fold_fixed_iff (z : Pt) : fold z = z ↔ onLine z := by
  cases z with
  | mk x t =>
    show Pt.mk (2 - x) t = Pt.mk x t ↔ x = 1
    constructor
    · intro h
      have hx := congrArg Pt.x h
      change 2 - x = x at hx
      omega
    · intro h
      subst h
      rfl

/-- Registration lands every point on the line. -/
theorem reg_lands_on_line (z : Pt) : onLine (reg z) := rfl

/-- Registration fixes what is already on the line. -/
theorem reg_fixes_line (z : Pt) (h : onLine z) : reg z = z := by
  cases z with
  | mk x t =>
    have hx : x = 1 := h
    subst hx
    rfl

/-- The unicorn: a point off the line is never the image of a registration. -/
theorem unicorn_never_registered (z : Pt) (h : ¬ onLine z) : ∀ w, reg w ≠ z := by
  intro w hw
  apply h
  rw [← hw]
  exact reg_lands_on_line w

/-- The ghost: registration forgets the side, so the two points of an orbit have one record. -/
theorem reg_forgets_side (z : Pt) : reg (fold z) = reg z := rfl

/-- No reading of the record recovers the side. -/
theorem ghost_side_unread {β : Type} (g : Pt → β) (z : Pt) : g (reg (fold z)) = g (reg z) := by
  rw [reg_forgets_side]

theorem off_line_pair_distinct (z : Pt) (h : ¬ onLine z) : fold z ≠ z :=
  fun hf => h ((fold_fixed_iff z).mp hf)

/-- One cut, one bit: off the line, the side the record forgets and the point measurement never
    shows are the same point's two faces. -/
theorem ghost_and_unicorn_one_bit (z : Pt) (h : ¬ onLine z) :
    fold z ≠ z ∧ reg (fold z) = reg z ∧ ∀ w, reg w ≠ z :=
  ⟨off_line_pair_distinct z h, reg_forgets_side z, unicorn_never_registered z h⟩

/-- Nothing escapes: every point is on the line, fixed and registered without loss, or off it,
    where it has a partner, loses its side in the record, and is never measured. -/
theorem nothing_escapes_one_cut (z : Pt) :
    (onLine z ∧ fold z = z ∧ reg z = z) ∨
    (¬ onLine z ∧ fold z ≠ z ∧ reg (fold z) = reg z ∧ ∀ w, reg w ≠ z) :=
  if h : z.x = 1 then Or.inl ⟨h, (fold_fixed_iff z).mpr h, reg_fixes_line z h⟩
  else Or.inr ⟨h, off_line_pair_distinct z h, reg_forgets_side z, unicorn_never_registered z h⟩

/-- The hypothesis is lossless registration: on any list of zeros, registration erases nothing
    exactly when every zero is on the line. -/
theorem lossless_iff_on_line (Z : List Pt) : (∀ z ∈ Z, reg z = z) ↔ (∀ z ∈ Z, onLine z) := by
  constructor
  · intro h z hz
    have e := h z hz
    rw [← e]
    exact reg_lands_on_line z
  · intro h z hz
    exact reg_fixes_line z (h z hz)

/-- Both worlds inside: a lossless world and a world with one priced orbit sit in one chart. -/
theorem both_worlds_inside :
    (∀ z ∈ [Pt.mk 1 14], reg z = z) ∧
    (∃ z ∈ [Pt.mk 0 14, Pt.mk 2 14], reg z ≠ z) ∧
    reg (Pt.mk 0 14) = reg (Pt.mk 2 14) := by
  decide

/-! Part II. The same cut on any row: a locus P, a registration onto it, carriers landing on it. -/
section Generic
variable {S : Type}

def Value (P : S → Prop) (Z : S → Prop) : Prop := ∀ s, Z s → P s

structure Registration (P : S → Prop) (π : S → S) : Prop where
  lands : ∀ s, P (π s)
  fixes : ∀ s, P s → π s = s

structure Carrier (P : S → Prop) (W : Type) where
  ι : W → S
  lands : ∀ w, P (ι w)

def Actuated {W : Type} (ι : W → S) (Z : S → Prop) : Prop := ∀ s, Z s → ∃ w, ι w = s

/-- On any row, the value is lossless registration. -/
theorem lossless_iff_value (P : S → Prop) (π : S → S) (R : Registration P π) (Z : S → Prop) :
    (∀ s, Z s → π s = s) ↔ Value P Z :=
  ⟨fun h s hs => h s hs ▸ R.lands s, fun h s hs => R.fixes s (h s hs)⟩

/-- The unicorn on any row: an off-locus instance is never the image of a registration. -/
theorem unicorn_generic (P : S → Prop) (π : S → S) (R : Registration P π) (x : S) (hx : ¬ P x) :
    ∀ s, π s ≠ x :=
  fun s h => hx (h ▸ R.lands s)

/-- The ghost on any row: no carrier landing on the locus covers an off-locus instance, so a
    physical object read as a proof about the far side of the cut reaches nothing there. -/
theorem ghost_generic {W : Type} (P : S → Prop) (C : Carrier P W) (Z : S → Prop) (x : S)
    (hz : Z x) (hx : ¬ P x) : ¬ Actuated C.ι Z := by
  intro hcov
  match hcov x hz with
  | ⟨w, hw⟩ => exact hx (hw ▸ C.lands w)

/-- One cut on any row: every instance is on the locus, or off it where no registration shows it
    and no carrier reaches it. Nothing escapes the cut. -/
theorem one_cut_generic (P : S → Prop) [DecidablePred P] (π : S → S) (R : Registration P π)
    (x : S) :
    P x ∨ (¬ P x ∧ (∀ s, π s ≠ x) ∧
      ∀ (W : Type) (C : Carrier P W) (Z : S → Prop), Z x → ¬ Actuated C.ι Z) :=
  if h : P x then Or.inl h
  else Or.inr ⟨h, unicorn_generic P π R x h, fun _ C Z hz => ghost_generic P C Z x hz h⟩

end Generic
end OneCut

#print axioms OneCut.fold_involution
#print axioms OneCut.fold_fixed_iff
#print axioms OneCut.reg_lands_on_line
#print axioms OneCut.reg_fixes_line
#print axioms OneCut.unicorn_never_registered
#print axioms OneCut.reg_forgets_side
#print axioms OneCut.ghost_side_unread
#print axioms OneCut.off_line_pair_distinct
#print axioms OneCut.ghost_and_unicorn_one_bit
#print axioms OneCut.nothing_escapes_one_cut
#print axioms OneCut.lossless_iff_on_line
#print axioms OneCut.both_worlds_inside
#print axioms OneCut.lossless_iff_value
#print axioms OneCut.unicorn_generic
#print axioms OneCut.ghost_generic
#print axioms OneCut.one_cut_generic
