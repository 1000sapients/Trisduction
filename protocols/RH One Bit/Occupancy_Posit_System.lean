/-
Occupancy_Posit_System.lean · the two-posit system: RA and Occupancy, declared openly.
Core Lean 4.19.0, no library, no sorry, no `axiom` declaration: the posits are carried as the
fields of one structure, so every consequence prints its dependence on them.

Why the second posit is not empty, proved below:
  CONTENT      it can fail: a zero set exists that refutes it, by one finite witness.
  LOCATED      it is exactly the line property, through the seat bridge.
  IRREDUCIBLE  RA, the seat bridge, and colocation hold together while it fails.
-/
namespace TwoPosit

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

structure Substrate where
  U  : Type
  ΔE : U → Int

def RA (S : Substrate) : Prop := ∀ x : S.U, 0 < S.ΔE x
def Line (Z : Int × Int → Prop) : Prop := ∀ p, Z p → p.1 = 1
def Occupancy (Z : Int × Int → Prop) : Prop := ∀ p, Z p → Fix (phi p)

/-- THE SYSTEM: two declared posits on a substrate S and a zero set Z. -/
structure Posits (S : Substrate) (Z : Int × Int → Prop) : Prop where
  root      : RA S           -- Posit 1: the Root Axiom
  occupancy : Occupancy Z    -- Posit 2: the zeros occupy the seat

-- P1.
/-- THE DERIVATION. In the two-posit system, the line property follows, through the seat bridge. -/
theorem line_in_system (S : Substrate) (Z : Int × Int → Prop) (P : Posits S Z) : Line Z :=
  fun p hp => (seatBridge p).mp (P.occupancy p hp)

-- P2.
/-- LOCATED: the second posit is exactly the line property. -/
theorem occupancy_is_line (Z : Int × Int → Prop) : Occupancy Z ↔ Line Z :=
  ⟨fun h p hp => (seatBridge p).mp (h p hp), fun h p hp => (seatBridge p).mpr (h p hp)⟩

-- P3.
/-- CONTENT: the second posit can fail, refuted by one finite witness, the zero at (0, 1). -/
def offPair (p : Int × Int) : Prop := p = (0, 1) ∨ p = (2, 1)
theorem occupancy_refutable : ¬ Occupancy offPair := by
  intro h
  have := (seatBridge (0, 1)).mp (h (0, 1) (Or.inl rfl))
  simp at this

-- P4.
/-- IRREDUCIBLE: RA, the seat bridge, and colocation all hold while the second posit fails.
    It is independent of the first posit and of the proved structure. -/
def unitSub : Substrate := ⟨Unit, fun _ => 1⟩
theorem occupancy_irreducible :
    RA unitSub ∧ (∀ p, Fix (phi p) ↔ p.1 = 1) ∧
    ((fun p : Int × Int => p.1 = 1) = (fun p => Fix (phi p))) ∧ ¬ Occupancy offPair :=
  ⟨fun _ => show (0 : Int) < 1 by decide, seatBridge,
   funext fun p => propext (seatBridge p).symm, occupancy_refutable⟩

-- P5.
/-- THE SYSTEM IS CONSISTENT: both posits hold together in a model (zeros on the line). -/
def onLine (p : Int × Int) : Prop := p = (1, 1)
theorem system_consistent : Posits unitSub onLine :=
  ⟨fun _ => show (0 : Int) < 1 by decide,
   fun p hp => by subst hp; exact (seatBridge (1, 1)).mpr rfl⟩

end TwoPosit

#print axioms TwoPosit.line_in_system
#print axioms TwoPosit.occupancy_is_line
#print axioms TwoPosit.occupancy_refutable
#print axioms TwoPosit.occupancy_irreducible
#print axioms TwoPosit.system_consistent
