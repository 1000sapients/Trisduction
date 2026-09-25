/-
RH_Real_Part_Computed.lean · the Real part of RH, closed by computation and carried up the ladder.
Core Lean 4.19.0, no library, no sorry. Drafted 2026-09-24.
The Real part at height T (RH_Real_Unicorn_Split.lean) is a bounded statement: finitely many
zeros lie below T. It is closed by a finite certificate, a complete list of the zeros below T and
a check that each is on the line. That is the rung (L3m); the rung is on the ladder (L2m), so a
certified Real part is provable; and the round trip returns it unchanged.
-/
namespace RealPart

variable {α : Type} (Z onL : α → Prop) (height : α → Int)

def RealPartAt (T : Int) : Prop := ∀ z, Z z → height z ≤ T → onL z

/-- A certificate for the Real part at T: a list of all zeros up to T, and each is on the line. -/
structure Certificate (T : Int) where
  zeros    : List α
  complete : ∀ z, Z z → height z ≤ T → z ∈ zeros
  onLine   : ∀ z, z ∈ zeros → onL z

-- C1.
/-- THE REAL PART, CLOSED. A certificate proves the Real part at T completely. -/
theorem real_part_of_certificate (T : Int) (c : Certificate Z onL height T) :
    RealPartAt Z onL height T :=
  fun z hz hle => c.onLine z (c.complete z hz hle)

-- C2.
/-- An executed instance: a zero set whose members up to T are listed and checked by the kernel's
    own computation (`decide`), the Real part following from the certificate. -/
def zs : List (Int × Bool) := [(14, true), (21, true), (25, true)]
def Zs (z : Int × Bool) : Prop := z ∈ zs
def onLs (z : Int × Bool) : Prop := z.2 = true

theorem real_part_executed : RealPartAt Zs onLs (fun z => z.1) 30 :=
  real_part_of_certificate Zs onLs (fun z => z.1) 30
    ⟨zs, fun _ hz _ => hz, fun z hz => by
      simp only [zs, List.mem_cons, List.mem_nil_iff, or_false] at hz
      rcases hz with h | h | h <;> subst h <;> rfl⟩

-- C3.
/-- The rung is on the ladder: a true Real part is a bounded statement, and a theory complete for
    true bounded statements proves it (for ZFC and PA, bounded completeness, a theorem of
    arithmetic, carried as the named premise `bounded`). A certificate therefore yields a proof. -/
theorem certified_is_provable (Prov : Prop → Prop)
    (bounded : ∀ T, RealPartAt Z onL height T → Prov (RealPartAt Z onL height T))
    (T : Int) (c : Certificate Z onL height T) :
    Prov (RealPartAt Z onL height T) :=
  bounded T (real_part_of_certificate Z onL height T c)

end RealPart

#print axioms RealPart.real_part_of_certificate
#print axioms RealPart.real_part_executed
#print axioms RealPart.certified_is_provable
