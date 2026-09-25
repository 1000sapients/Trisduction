/-
RH_Real_Unicorn_Split.lean · the Riemann Hypothesis divided into a Real part and a Unicorn part.
Core Lean 4.19.0, no library, no sorry. Drafted 2026-09-24.
Split at a height T. The Real part is the witnessed region: every zero at height ≤ T lies on the
line. The Unicorn part is the unwitnessed region: above T, the off-line zeros are unicorns, a
class of which every sentence is vacuously true because it has no member.
-/
namespace Split

variable {α : Type} (Z onL : α → Prop) (height : α → Int)

def RH : Prop := ∀ z, Z z → onL z

/-- THE REAL PART at height T: every zero up to T is on the line. -/
def RealPart (T : Int) : Prop := ∀ z, Z z → height z ≤ T → onL z

/-- THE UNICORN PART at height T: above T, every property holds of every off-line zero, because
    there are none. -/
def UnicornPart (T : Int) : Prop :=
  ∀ (Q : α → Prop) (z : α), T < height z → Z z → ¬ onL z → Q z

-- S1.
/-- THE SPLIT. At every height T, the hypothesis is exactly the Real part and the Unicorn part
    together. Nothing is lost and nothing is added. -/
theorem rh_iff_real_and_unicorn [∀ z, Decidable (onL z)] (T : Int) :
    RH Z onL ↔ RealPart Z onL height T ∧ UnicornPart Z onL height T := by
  constructor
  · intro h
    exact ⟨fun z hz _ => h z hz, fun _ z _ hz off => absurd (h z hz) off⟩
  · intro ⟨hR, hU⟩ z hz
    by_cases hle : height z ≤ T
    · exact hR z hz hle
    · exact Decidable.byContradiction
        (fun off => hU (fun _ => False) z (Int.lt_of_not_ge hle) hz off)

-- S2.
/-- The parts are separate: the Real part can hold while the Unicorn part fails. An off-line
    zero above T leaves every zero up to T on the line. -/
def twoZeros (z : Int × Bool) : Prop := z = (5, true) ∨ z = (20, false)
def onLine2 (z : Int × Bool) : Prop := z.2 = true
def height2 (z : Int × Bool) : Int := z.1

theorem parts_are_separate :
    RealPart twoZeros onLine2 height2 10 ∧ ¬ UnicornPart twoZeros onLine2 height2 10 := by
  refine ⟨?_, ?_⟩
  · intro z hz hle
    rcases hz with h | h <;> subst h
    · rfl
    · exact absurd hle (by decide)
  · intro hU
    exact hU (fun _ => False) (20, false) (by decide) (Or.inr rfl) (fun h => Bool.noConfusion h)

-- S3.
/-- The Unicorn part is empty exactly when no off-line zero above T can be exhibited. -/
theorem unicorn_part_iff_no_witness (T : Int) :
    UnicornPart Z onL height T ↔ ¬ ∃ z, T < height z ∧ Z z ∧ ¬ onL z :=
  ⟨fun hU ⟨z, hT, hz, off⟩ => hU (fun _ => False) z hT hz off,
   fun h _ z hT hz off => absurd ⟨z, hT, hz, off⟩ h⟩

-- S4.
/-- Raising T moves zeros from the Unicorn part into the Real part and never the other way: a
    Real part at a higher height contains the Real part at a lower one. -/
theorem real_part_monotone (T T' : Int) (hTT : T ≤ T') :
    RealPart Z onL height T' → RealPart Z onL height T :=
  fun h z hz hle => h z hz (Int.le_trans hle hTT)

end Split

#print axioms Split.rh_iff_real_and_unicorn
#print axioms Split.parts_are_separate
#print axioms Split.unicorn_part_iff_no_witness
#print axioms Split.real_part_monotone
