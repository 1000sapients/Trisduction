/-
  SPHYS_Least_Erasure_Atom.lean · the atom on which the volume stands.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared; every law below depends on
  no axiom at all.

  The chart: a point is (d, t), d its offset from the critical line and t its height; it is the
  series' chart h = 2 Re s translated by one, d = h − 1. The fold s ↦ 1 − s̄ is (d, t) ↦ (−d, t), and
  the line is d = 0. The registration keeps a point's height and forgets its side: (d, t) ↦ (0, t).
  Least erasure: a set the registration leaves unchanged. Value: a set on the line.
-/
set_option autoImplicit false
namespace SPHYS.Atom

abbrev Pt := Int × Int
def fold (p : Pt) : Pt := (-p.1, p.2)
def OnLine (p : Pt) : Prop := p.1 = 0
def reg (p : Pt) : Pt := (0, p.2)

/-- The fold is an involution. -/
theorem fold_involutive (p : Pt) : fold (fold p) = p := by
  obtain ⟨d, t⟩ := p
  show ((- -d, t) : Pt) = (d, t)
  rw [Int.neg_neg]

/-- An integer equal to its own negation is zero, by its two constructors. -/
theorem neg_self_zero (d : Int) (h : -d = d) : d = 0 := by
  cases d with
  | ofNat n =>
    cases n with
    | zero => rfl
    | succ k => exact Int.noConfusion h
  | negSucc k => exact Int.noConfusion h

/-- THE ONE CUT: the fold fixes a point exactly when the point is on the line. -/
theorem the_cut_is_the_line (p : Pt) : fold p = p ↔ OnLine p := by
  obtain ⟨d, t⟩ := p
  constructor
  · intro e
    exact neg_self_zero d (congrArg Prod.fst e)
  · intro e
    show ((-d, t) : Pt) = (d, t)
    have e' : d = 0 := e
    subst e'
    rfl

/-- The registration lands on the line, keeps the height and forgets the side. -/
theorem reg_lands (p : Pt) : OnLine (reg p) := rfl
theorem reg_keeps_height (p : Pt) : (reg p).2 = p.2 := rfl
theorem reg_forgets_side (p : Pt) : reg (fold p) = reg p := rfl

/-- The registration erases nothing at a point exactly when the point is on the line. -/
theorem reg_erases_nothing_iff (p : Pt) : reg p = p ↔ OnLine p := by
  obtain ⟨d, t⟩ := p
  constructor
  · intro e
    have e1 : (0 : Int) = d := congrArg Prod.fst e
    exact e1.symm
  · intro e
    have e' : d = 0 := e
    subst e'
    rfl

/-- TWO WORLDS, ONE RECORD: a point off the line and its fold partner are distinct and share one
    registration. -/
theorem off_line_pair (p : Pt) (hp : ¬ OnLine p) : fold p ≠ p ∧ reg (fold p) = reg p :=
  ⟨fun e => hp ((the_cut_is_the_line p).mp e), rfl⟩

/-- THE PRICE OF ONE BIT: off the line, no map recovers both a point and its partner from their
    registrations. -/
theorem one_bit_lost (p : Pt) (hp : ¬ OnLine p) (g : Pt → Pt) :
    ¬ (g (reg p) = p ∧ g (reg (fold p)) = fold p) := by
  intro ⟨h1, h2⟩
  have h3 : g (reg (fold p)) = p := by rw [reg_forgets_side]; exact h1
  exact (off_line_pair p hp).1 (h2.symm.trans h3)

def Value (Z : Pt → Prop) : Prop := ∀ s, Z s → OnLine s
def LeastErasure (Z : Pt → Prop) : Prop := ∀ s, Z s → reg s = s

/-- THE ATOM: a set is erased nothing by the registration exactly when every one of its points
    stands on the line. -/
theorem least_erasure_iff_value (Z : Pt → Prop) : LeastErasure Z ↔ Value Z :=
  ⟨fun h s hs => (reg_erases_nothing_iff s).mp (h s hs),
   fun h s hs => (reg_erases_nothing_iff s).mpr (h s hs)⟩

/-- NOTHING ESCAPES LEAST ERASURE: one cut, its fixed set the line; one registration, keeping the
    height and forgetting the side; off the line two worlds over one record and one bit lost; and
    least erasure the same property as the value. -/
theorem nothing_escapes_least_erasure :
    (∀ p : Pt, fold (fold p) = p) ∧
    (∀ p : Pt, fold p = p ↔ OnLine p) ∧
    (∀ p : Pt, reg (fold p) = reg p ∧ OnLine (reg p) ∧ (reg p).2 = p.2) ∧
    (∀ p : Pt, ¬ OnLine p → fold p ≠ p ∧ ∀ g : Pt → Pt, ¬ (g (reg p) = p ∧ g (reg (fold p)) = fold p)) ∧
    (∀ Z : Pt → Prop, LeastErasure Z ↔ Value Z) :=
  ⟨fold_involutive, the_cut_is_the_line, fun _ => ⟨rfl, rfl, rfl⟩,
   fun p hp => ⟨(off_line_pair p hp).1, one_bit_lost p hp⟩, least_erasure_iff_value⟩

end SPHYS.Atom

#print axioms SPHYS.Atom.fold_involutive
#print axioms SPHYS.Atom.neg_self_zero
#print axioms SPHYS.Atom.the_cut_is_the_line
#print axioms SPHYS.Atom.reg_lands
#print axioms SPHYS.Atom.reg_keeps_height
#print axioms SPHYS.Atom.reg_forgets_side
#print axioms SPHYS.Atom.reg_erases_nothing_iff
#print axioms SPHYS.Atom.off_line_pair
#print axioms SPHYS.Atom.one_bit_lost
#print axioms SPHYS.Atom.least_erasure_iff_value
#print axioms SPHYS.Atom.nothing_escapes_least_erasure
