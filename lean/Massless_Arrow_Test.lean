/-
Massless_Arrow_Test.lean · can a zero-content arrow from RA deliver a proposition?
Core Lean 4.19.0, no library, no sorry. Drafted 2026-09-24.
An arrow sends a proposition to what it delivers. It is massless (zero content) when it delivers
the same for every proposition, and sound when what it delivers for P implies P.
-/
namespace Massless

def Massless (f : Prop → Prop) : Prop := ∀ P Q, f P ↔ f Q
def Sound (f : Prop → Prop) : Prop := ∀ P, f P → P

-- M1.
/-- A sound massless arrow delivers nothing: if it delivered P, it would deliver ¬P too, and
    both would hold. So its delivery is empty for every proposition. -/
theorem massless_sound_delivers_nothing (f : Prop → Prop) (hM : Massless f) (hS : Sound f) :
    ∀ P, ¬ f P :=
  fun P h => hS (¬ P) ((hM P (¬ P)).mp h) (hS P h)

-- M2.
/-- The RA-shaped arrow: it delivers RA's presence, the same for every proposition. -/
def raArrow (RA : Prop) : Prop → Prop := fun _ => RA

theorem raArrow_massless (RA : Prop) : Massless (raArrow RA) := fun _ _ => Iff.rfl

/-- If RA holds, the RA-shaped arrow is NOT sound: it delivers every proposition, true or false. -/
theorem raArrow_not_sound (RA : Prop) (hRA : RA) : ¬ Sound (raArrow RA) :=
  fun hS => hS False hRA

-- M3.
/-- THE VERDICT. A zero-content arrow either delivers nothing (if it is sound) or delivers every
    proposition and its negation alike (if it is not). Either way it cannot deliver RH rather than
    ¬RH. Content is what separates a proposition from its negation, and a massless arrow has none. -/
theorem massless_cannot_separate (f : Prop → Prop) (hM : Massless f) (RH : Prop) :
    (f RH ↔ f (¬ RH)) :=
  hM RH (¬ RH)

end Massless

#print axioms Massless.massless_sound_delivers_nothing
#print axioms Massless.raArrow_massless
#print axioms Massless.raArrow_not_sound
#print axioms Massless.massless_cannot_separate
