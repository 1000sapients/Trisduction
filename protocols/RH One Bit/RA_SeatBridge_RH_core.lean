/-
RA_SeatBridge_RH_core.lean · a complete conditional proof of the line property from RA and the
architect's seat bridge, with every premise named. Core Lean 4.19.0, compiled in this session.

Chain:  RA  ⟶  kinetic seal  ⟶(register bridge)⟶  occupancy  ⟶(seat bridge, theorem)⟶  line.
Stage: zeros are lattice points p = (h, t), h = 2·Re, critical line h = 1.
Premises, named:
  · RA               the root, on a substrate.
  · kinetic_of_RA    the Codex's kinetic seal [⟀]: under RA, the zeros are physically seated
                     (carried as a Prop K and the implication RA → K).
  · RegisterBridge   kinetic seal → formal occupancy: the crossing from the kinetic register
                     into the formal string. The one premise not proved.
  · seat bridge      φ(h,t) = ⟨t, h−1, 0, 0⟩, Fix(σ) ⟺ line: PROVED here (seat_fix_iff_line).
-/
namespace SeatChain

structure Q4 where
  r : Int
  i : Int
  j : Int
  k : Int

def sigma (q : Q4) : Q4 := ⟨q.r, -q.i, -q.j, -q.k⟩
def Fix (q : Q4) : Prop := sigma q = q
def phi (p : Int × Int) : Q4 := ⟨p.2, p.1 - 1, 0, 0⟩

/-- THE SEAT BRIDGE (theorem): a zero's image is on the seat exactly when the zero is on the line. -/
theorem seat_fix_iff_line (p : Int × Int) : Fix (phi p) ↔ p.1 = 1 := by
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

/-- The line property of the zero set Z. -/
def Line (Z : Int × Int → Prop) : Prop := ∀ p, Z p → p.1 = 1

/-- Formal occupancy: every zero's image sits on the seat. -/
def Occupancy (Z : Int × Int → Prop) : Prop := ∀ p, Z p → Fix (phi p)

/-- The register bridge: the kinetic seal K carried into the formal string as occupancy. -/
def RegisterBridge (K : Prop) (Z : Int × Int → Prop) : Prop := K → Occupancy Z

-- C1.
/-- THE COMPLETE CONDITIONAL PROOF. RA, the kinetic seal, the register bridge, and the seat
    bridge give the line property. Every step is a deduction; RA is consumed through the seal. -/
theorem line_of_ra_seat (S : Substrate) (Z : Int × Int → Prop) (K : Prop)
    (hRA : RA S) (kinetic_of_RA : RA S → K) (hB : RegisterBridge K Z) : Line Z :=
  fun p hp => (seat_fix_iff_line p).mp (hB (kinetic_of_RA hRA) p hp)

-- C2.
/-- WHERE THE BIT SITS. Once the kinetic seal holds, the register bridge holds exactly when the
    line property does. -/
theorem register_bridge_iff_line (S : Substrate) (Z : Int × Int → Prop) (K : Prop)
    (hRA : RA S) (kinetic_of_RA : RA S → K) : RegisterBridge K Z ↔ Line Z :=
  ⟨fun hB => line_of_ra_seat S Z K hRA kinetic_of_RA hB,
   fun hL _ p hp => (seat_fix_iff_line p).mpr (hL p hp)⟩

-- C3.
/-- The kinetic seal alone does not cross: K holds, RA holds, the seat bridge holds, and a
    fold-symmetric pair of zeros sits off the line. The crossing needs the register bridge. -/
def offPair (p : Int × Int) : Prop := p = (0, 1) ∨ p = (2, 1)
def unitSub : Substrate := ⟨Unit, fun _ => 1⟩

theorem seal_alone_does_not_cross :
    RA unitSub ∧ True ∧ (∀ p, Fix (phi p) ↔ p.1 = 1) ∧ ¬ Line offPair := by
  refine ⟨fun _ => show (0 : Int) < 1 by decide, trivial, seat_fix_iff_line, fun h => ?_⟩
  have := h (0, 1) (Or.inl rfl); simp at this

end SeatChain

#print axioms SeatChain.seat_fix_iff_line
#print axioms SeatChain.line_of_ra_seat
#print axioms SeatChain.register_bridge_iff_line
#print axioms SeatChain.seal_alone_does_not_cross
