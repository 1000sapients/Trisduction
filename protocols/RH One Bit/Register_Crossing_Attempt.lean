/-
Register_Crossing_Attempt.lean · an attempt to prove the register crossing at theorem grade.
Core Lean 4.19.0, no library, no sorry. Same stage as Fresh_Chain.lean.
-/
namespace Crossing

structure Q4 where
  r : Int
  i : Int
  j : Int
  k : Int

def sigma (q : Q4) : Q4 := ⟨q.r, -q.i, -q.j, -q.k⟩
def Fix (q : Q4) : Prop := sigma q = q
def phi (p : Int × Int) : Q4 := ⟨p.2, p.1 - 1, 0, 0⟩

theorem seatBridge (p : Int × Int) : Fix (phi p) ↔ p.1 = 1 := by
  obtain ⟨h, t⟩ := p
  show (⟨t, -(h - 1), -0, -0⟩ : Q4) = ⟨t, h - 1, 0, 0⟩ ↔ h = 1
  constructor
  · intro e
    have := congrArg Q4.i e
    simp only at this
    omega
  · intro e; subst e; rfl

def Line (Z : Int × Int → Prop) : Prop := ∀ p, Z p → p.1 = 1
def Occupancy (Z : Int × Int → Prop) : Prop := ∀ p, Z p → Fix (phi p)
def RegisterBridge (K : Prop) (Z : Int × Int → Prop) : Prop := K → Occupancy Z

-- A1.
/-- ATTEMPT 1, uniform: prove the crossing for every zero set. It fails: one zero set off the
    line refutes it, with the kinetic seal granted as True. -/
def offPair (p : Int × Int) : Prop := p = (0, 1) ∨ p = (2, 1)
theorem uniform_crossing_fails : ¬ ∀ Z, RegisterBridge True Z := by
  intro h
  have := (seatBridge (0, 1)).mp (h offPair trivial (0, 1) (Or.inl rfl))
  simp at this

-- A2.
/-- ATTEMPT 2, per zero set: the crossing is a theorem for a given Z exactly when Z lies on the
    line. Its grade is the line property's grade, no higher and no lower. -/
theorem crossing_grade_is_line_grade (Z : Int × Int → Prop) :
    RegisterBridge True Z ↔ Line Z :=
  ⟨fun h p hp => (seatBridge p).mp (h trivial p hp),
   fun h _ p hp => (seatBridge p).mpr (h p hp)⟩

-- A3.
/-- ATTEMPT 3, the one case where it is a theorem for free: a zero set DEFINED as seat points.
    Then the crossing holds by definition, because the line was put into the definition of Z. -/
def seatDefined (p : Int × Int) : Prop := Fix (phi p)
theorem crossing_free_when_defined_on_seat : RegisterBridge True seatDefined :=
  fun _ _ hp => hp

-- A4.
/-- THE CLUE, STATED. The crossing becomes theorem grade exactly when the zero set carries, in its
    own definition, a property that forces the seat. For ζ the zero set is defined by ζ(s) = 0,
    so the crossing is theorem grade exactly when ζ(s) = 0 forces the seat: that is RH. -/
theorem crossing_needs_a_seat_forcing_definition (Z : Int × Int → Prop) :
    RegisterBridge True Z ↔ (∀ p, Z p → Fix (phi p)) :=
  ⟨fun h => h trivial, fun h _ => h⟩

end Crossing

#print axioms Crossing.uniform_crossing_fails
#print axioms Crossing.crossing_grade_is_line_grade
#print axioms Crossing.crossing_free_when_defined_on_seat
#print axioms Crossing.crossing_needs_a_seat_forcing_definition
