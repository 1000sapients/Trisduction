/-
Fresh_Chain.lean · a fresh chain, codex-free. Core Lean 4.19.0, no library, no sorry.
Only three premises, stated from scratch, and the zero set Z.
  RA          every existent of a substrate carries positive energy.
  SeatBridge  φ(h,t) = ⟨t, h−1, 0, 0⟩, and φ(p) ∈ Fix(σ) ⟺ p on the line h = 1.
  Colocation  the line locus and the seat locus are one set (the double count removed).
Question: do these premises, together, give Line Z?
-/
namespace Fresh

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

/-- Colocation: the line locus and the seat locus are one set. -/
theorem colocation : (fun p : Int × Int => p.1 = 1) = (fun p => Fix (phi p)) :=
  funext fun p => propext (seatBridge p).symm

structure Substrate where
  U  : Type
  ΔE : U → Int

def RA (S : Substrate) : Prop := ∀ x : S.U, 0 < S.ΔE x
def Line (Z : Int × Int → Prop) : Prop := ∀ p, Z p → p.1 = 1

/-- The three premises together, as one proposition. None of them mentions Z. -/
def Premises (S : Substrate) : Prop :=
  RA S ∧ (∀ p, Fix (phi p) ↔ p.1 = 1) ∧
  ((fun p : Int × Int => p.1 = 1) = (fun p => Fix (phi p)))

def unitSub : Substrate := ⟨Unit, fun _ => 1⟩

-- F1.
/-- The premises are true: all three hold. -/
theorem premises_hold : Premises unitSub :=
  ⟨fun _ => show (0 : Int) < 1 by decide, seatBridge, colocation⟩

-- F2.
/-- A zero set off the line. -/
def offPair (p : Int × Int) : Prop := p = (0, 1) ∨ p = (2, 1)

theorem offPair_off : ¬ Line offPair := fun h => by
  have := h (0, 1) (Or.inl rfl); simp at this

-- F3.
/-- THE FRESH CHAIN'S ANSWER. The premises hold and Line fails, in one model. So the premises do
    not entail Line for every zero set. -/
theorem premises_do_not_entail_line :
    Premises unitSub ∧ ¬ Line offPair :=
  ⟨premises_hold, offPair_off⟩

-- F4.
/-- And for any particular zero set Z: since the premises are true and say nothing about Z,
    deriving Line Z from them is exactly as hard as deriving Line Z outright. -/
theorem premises_add_nothing (Z : Int × Int → Prop) :
    ((Premises unitSub → Line Z) ↔ Line Z) :=
  ⟨fun f => f premises_hold, fun h _ => h⟩

end Fresh

#print axioms Fresh.seatBridge
#print axioms Fresh.colocation
#print axioms Fresh.premises_do_not_entail_line
#print axioms Fresh.premises_add_nothing
