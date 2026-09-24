/-
Seat_Bridge_Hunt.lean · a fresh hunt: RA + the RA–RAM seat bridge, and what closes RH.
Core Lean 4.19.0 · no library · no sorry · no axiom declaration.

Stage: zeros are lattice points p = (h, t), with h = 2·Re and the critical line at h = 1.
The seat bridge is the architect's theorem: φ(h, t) = ⟨t, h − 1, 0, 0⟩ into the quaternions,
equivariant between the fold τ(h, t) = (2 − h, t) and conjugation σ, with Fix(σ) the scalar line.
The hunt asks which condition, added to RA and the seat bridge, closes the line property of an
arbitrary zero set Z, and tests every candidate against a countermodel.
-/
namespace SeatHunt

/-! ## The seat bridge (the architect's theorem, re-proved here) -/
structure Q4 where
  r : Int
  i : Int
  j : Int
  k : Int
  deriving DecidableEq

def sigma (q : Q4) : Q4 := ⟨q.r, -q.i, -q.j, -q.k⟩
def Fix (q : Q4) : Prop := sigma q = q
def phi (p : Int × Int) : Q4 := ⟨p.2, p.1 - 1, 0, 0⟩
def tau (p : Int × Int) : Int × Int := (2 - p.1, p.2)

theorem phi_equivariant (p : Int × Int) : sigma (phi p) = phi (tau p) := by
  obtain ⟨h, t⟩ := p
  show (⟨t, -(h - 1), -0, -0⟩ : Q4) = ⟨t, (2 - h) - 1, 0, 0⟩
  have e : -(h - 1) = (2 - h) - 1 := by omega
  rw [e]; rfl

theorem phi_fix_iff_line (p : Int × Int) : Fix (phi p) ↔ p.1 = 1 := by
  obtain ⟨h, t⟩ := p
  show (⟨t, -(h - 1), -0, -0⟩ : Q4) = ⟨t, h - 1, 0, 0⟩ ↔ h = 1
  constructor
  · intro e
    have := congrArg Q4.i e
    simp only at this
    omega
  · intro e
    subst e
    rfl

/-! ## The root, and the zero set -/
structure Substrate where
  U  : Type
  ΔE : U → Int

def RA (S : Substrate) : Prop := ∀ x : S.U, 0 < S.ΔE x

/-- The line property of a zero set: every zero on h = 1. -/
def RH (Z : Int × Int → Prop) : Prop := ∀ p, Z p → p.1 = 1

/-- OCCUPANCY: every zero, carried by the seat bridge, lands on the seat Fix(σ). -/
def Occupancy (Z : Int × Int → Prop) : Prop := ∀ p, Z p → Fix (phi p)

-- H1.
/-- THE CHAIN, COMPLETE. RA, the seat bridge, and occupancy give the line property. The seat
    bridge does the work of turning seat-occupancy into Re = ½; RA is carried and not consumed. -/
theorem rh_of_ra_seat_occupancy (S : Substrate) (Z : Int × Int → Prop)
    (_hRA : RA S) (hOcc : Occupancy Z) : RH Z :=
  fun p hp => (phi_fix_iff_line p).mp (hOcc p hp)

-- H2.
/-- The price, stated: through the seat bridge, occupancy is the line property. -/
theorem occupancy_iff_rh (Z : Int × Int → Prop) : Occupancy Z ↔ RH Z :=
  ⟨fun h p hp => (phi_fix_iff_line p).mp (h p hp),
   fun h p hp => (phi_fix_iff_line p).mpr (h p hp)⟩

/-! ## The hunt: every weaker candidate, tested against one countermodel -/

/-- A fold-symmetric pair of zeros off the line, at height T + 1. -/
def offPair (T : Int) (p : Int × Int) : Prop := p = (0, T + 1) ∨ p = (2, T + 1)

/-- A substrate on which RA holds. -/
def unitSub : Substrate := ⟨Unit, fun _ => 1⟩
theorem ra_unitSub : RA unitSub := fun _ => show (0 : Int) < 1 by decide

-- H3.
/-- Candidate 1, RA: holds, and the zero set is off the line. RA does not close it. -/
theorem ra_does_not_close : RA unitSub ∧ ¬ RH (offPair 0) := by
  refine ⟨ra_unitSub, fun h => ?_⟩
  have := h (0, 1) (Or.inl rfl); simp at this

-- H4.
/-- Candidate 2, the seat bridge: its two theorems hold at every point, including the off-line
    zeros. The bridge locates the seat; it does not move the zeros onto it. -/
theorem seat_bridge_does_not_close :
    (∀ p, sigma (phi p) = phi (tau p)) ∧ (∀ p, Fix (phi p) ↔ p.1 = 1) ∧ ¬ RH (offPair 0) :=
  ⟨phi_equivariant, phi_fix_iff_line, (ra_does_not_close).2⟩

-- H5.
/-- Candidate 3, the functional equation's symmetry: the zero set is fold-invariant, and off the
    line. Symmetry pairs the zeros across the seat; it does not seat them. -/
theorem symmetry_does_not_close :
    (∀ p, offPair 0 p → offPair 0 (tau p)) ∧ ¬ RH (offPair 0) := by
  refine ⟨?_, (ra_does_not_close).2⟩
  intro p hp
  rcases hp with h | h <;> subst h <;> simp [offPair, tau]

-- H6.
/-- Candidate 4, finite verification: every zero up to any height T is on the line (vacuously,
    none sits there), and the set is off the line above T. No finite check closes it. -/
theorem verification_does_not_close (T : Int) :
    (∀ p, offPair T p → p.2 ≤ T → p.1 = 1) ∧ ¬ RH (offPair T) := by
  refine ⟨?_, fun h => ?_⟩
  · intro p hp hle; rcases hp with h | h <;> subst h <;> exact absurd hle (by simp; omega)
  · have := h (0, T + 1) (Or.inl rfl); simp at this

-- H7.
/-- THE HUNT'S VERDICT, IN ONE THEOREM. RA, the seat bridge, the functional equation's symmetry,
    and finite verification all hold in a world where the line property fails, so none of them,
    nor all four together, closes it; the condition that closes it, with the seat bridge, is
    occupancy, and occupancy is the line property. -/
theorem hunt_verdict :
    (RA unitSub ∧ (∀ p, sigma (phi p) = phi (tau p)) ∧ (∀ p, Fix (phi p) ↔ p.1 = 1) ∧
       (∀ p, offPair 0 p → offPair 0 (tau p)) ∧ (∀ p, offPair 0 p → p.2 ≤ 0 → p.1 = 1) ∧
       ¬ RH (offPair 0)) ∧
    (∀ (S : Substrate) (Z : Int × Int → Prop), RA S → Occupancy Z → RH Z) ∧
    (∀ Z : Int × Int → Prop, Occupancy Z ↔ RH Z) :=
  ⟨⟨ra_unitSub, phi_equivariant, phi_fix_iff_line, (symmetry_does_not_close).1,
     (verification_does_not_close 0).1, (ra_does_not_close).2⟩,
   rh_of_ra_seat_occupancy, occupancy_iff_rh⟩

end SeatHunt

#print axioms SeatHunt.phi_equivariant
#print axioms SeatHunt.phi_fix_iff_line
#print axioms SeatHunt.rh_of_ra_seat_occupancy
#print axioms SeatHunt.occupancy_iff_rh
#print axioms SeatHunt.ra_does_not_close
#print axioms SeatHunt.seat_bridge_does_not_close
#print axioms SeatHunt.symmetry_does_not_close
#print axioms SeatHunt.verification_does_not_close
#print axioms SeatHunt.hunt_verdict
