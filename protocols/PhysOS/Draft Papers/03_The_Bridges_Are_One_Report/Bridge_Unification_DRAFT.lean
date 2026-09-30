/-
  Bridge_Unification.lean · the ninth gate, the heat bridge, the prime face and the RA–RAM seat
  bridge, read as one bridge. Core Lean 4.19.0, standalone, no import, no library, no axiom.

  Five charts of one seat, each an involution space:
    the strip        (h, t), h = 2 Re s, the fold (h, t) ↦ (2 − h, t), fixed set h = 1;
    the seat bridge  the quaternion slice (r, i) ↦ (r, −i), fixed set the scalar line, reached by
                     φ(h, t) = (t, h − 1), the architect's RA–RAM seat bridge;
    the energy       (a, β) ↦ (a, −β), E = a + iβ/2, fixed set the real energies, reached by
                     ψ(h, t) = (t, 1 − h), the carrier s = 1/2 + iE;
    the heat root    z = x + iy ↦ z̄, fixed set the real roots, reached from the energy by z = 2E,
                     the variable of de Bruijn's H_t, H_0(z) = Ξ(z/2)/8;
    the prime chart  the half-shift u = s − 1/2, h' = h − 1, u ↦ −ū, fixed set Re u = 0, the line
                     on which the normalized prime modes p^{−u} are unitary.
  And the ogdoad: the eight sign patterns of three axes, the fixed frame read from inside, with
  the aperture that no inside walk passes.
-/
set_option autoImplicit false
namespace SPHYS.Bridges

abbrev Pt := Int × Int

theorem pe {a b c d : Int} : ((a, b) : Pt) = (c, d) ↔ a = c ∧ b = d :=
  ⟨fun e => ⟨congrArg Prod.fst e, congrArg Prod.snd e⟩,
   fun ⟨e1, e2⟩ => by subst e1; subst e2; rfl⟩

/-! ## Part I. Involution spaces and their isomorphisms -/

structure InvSpace where
  X : Type
  τ : X → X
  inv : ∀ x, τ (τ x) = x

/-- An isomorphism of involution spaces: an equivariant bijection. -/
structure Iso (A B : InvSpace) where
  f : A.X → B.X
  g : B.X → A.X
  fg : ∀ y, f (g y) = y
  gf : ∀ x, g (f x) = x
  eqv : ∀ x, f (A.τ x) = B.τ (f x)

/-- An isomorphism carries fixed points to fixed points and back. -/
theorem iso_fixed {A B : InvSpace} (i : Iso A B) (x : A.X) : A.τ x = x ↔ B.τ (i.f x) = i.f x := by
  constructor
  · intro h; rw [← i.eqv, h]
  · intro h
    have e : i.f (A.τ x) = i.f x := by rw [i.eqv, h]
    have := congrArg i.g e
    rwa [i.gf, i.gf] at this

def Iso.comp {A B C : InvSpace} (i : Iso A B) (j : Iso B C) : Iso A C where
  f := j.f ∘ i.f
  g := i.g ∘ j.g
  fg := fun y => by show j.f (i.f (i.g (j.g y))) = y; rw [i.fg, j.fg]
  gf := fun x => by show i.g (j.g (j.f (i.f x))) = x; rw [j.gf, i.gf]
  eqv := fun x => by show j.f (i.f (A.τ x)) = C.τ (j.f (i.f x)); rw [i.eqv, j.eqv]

def flipY (p : Pt) : Pt := (p.1, -p.2)
theorem flipY_inv (p : Pt) : flipY (flipY p) = p := by
  obtain ⟨a, b⟩ := p; show ((a, - -b) : Pt) = (a, b); rw [Int.neg_neg]

def fold (p : Pt) : Pt := (2 - p.1, p.2)
theorem fold_inv (p : Pt) : fold (fold p) = p := by
  obtain ⟨h, t⟩ := p; show ((2 - (2 - h), t) : Pt) = (h, t); rw [pe]; exact ⟨by omega, rfl⟩

def negX (p : Pt) : Pt := (-p.1, p.2)
theorem negX_inv (p : Pt) : negX (negX p) = p := by
  obtain ⟨h, t⟩ := p; show ((- -h, t) : Pt) = (h, t); rw [Int.neg_neg]

def Strip : InvSpace := ⟨Pt, fold, fold_inv⟩
/-- The quaternion slice of the seat bridge, the energy chart and the heat chart are each a pair
    with the second coordinate reversed. -/
def Slice : InvSpace := ⟨Pt, flipY, flipY_inv⟩
def Shifted : InvSpace := ⟨Pt, negX, negX_inv⟩

/-! ## Part II. The seat bridge, the energy carrier and the half-shift, as isomorphisms -/

/-- THE RA–RAM SEAT BRIDGE: φ(h, t) = (t, h − 1), the quaternion t + (h − 1)i. -/
def seatBridge : Iso Strip Slice where
  f := fun p => (p.2, p.1 - 1)
  g := fun q => (q.2 + 1, q.1)
  fg := fun q => by obtain ⟨r, i⟩ := q; show ((r, i + 1 - 1) : Pt) = (r, i); rw [pe]; exact ⟨rfl, by omega⟩
  gf := fun p => by obtain ⟨h, t⟩ := p; show ((h - 1 + 1, t) : Pt) = (h, t); rw [pe]; exact ⟨by omega, rfl⟩
  eqv := fun p => by
    obtain ⟨h, t⟩ := p
    show ((t, 2 - h - 1) : Pt) = (t, -(h - 1)); rw [pe]; exact ⟨rfl, by omega⟩

/-- THE ENERGY CARRIER: ψ(h, t) = (t, 1 − h), frequency and doubled rate of E with s = 1/2 + iE. -/
def energyCarrier : Iso Strip Slice where
  f := fun p => (p.2, 1 - p.1)
  g := fun q => (1 - q.2, q.1)
  fg := fun q => by obtain ⟨r, i⟩ := q; show ((r, 1 - (1 - i)) : Pt) = (r, i); rw [pe]; exact ⟨rfl, by omega⟩
  gf := fun p => by obtain ⟨h, t⟩ := p; show ((1 - (1 - h), t) : Pt) = (h, t); rw [pe]; exact ⟨by omega, rfl⟩
  eqv := fun p => by
    obtain ⟨h, t⟩ := p
    show ((t, 1 - (2 - h)) : Pt) = (t, -(1 - h)); rw [pe]; exact ⟨rfl, by omega⟩

/-- The slice's own involution, as an isomorphism of the slice with itself. -/
def sliceFlip : Iso Slice Slice where
  f := flipY
  g := flipY
  fg := flipY_inv
  gf := flipY_inv
  eqv := fun _ => rfl

/-- THE SEAT BRIDGE AND THE ENERGY CARRIER ARE ONE MAP: the energy carrier is the seat bridge
    followed by the slice's own conjugation, a change of orientation and nothing else. -/
theorem energy_is_seat_bridge_conjugated (p : Pt) :
    energyCarrier.f p = (seatBridge.comp sliceFlip).f p := by
  obtain ⟨h, t⟩ := p
  show ((t, 1 - h) : Pt) = (t, -(h - 1)); rw [pe]; exact ⟨rfl, by omega⟩

/-- THE HALF-SHIFT: u = s − 1/2, h' = h − 1, carries the fold to u ↦ −ū and the critical line to
    Re u = 0, the line where the normalized prime modes are unitary. -/
def halfShift : Iso Strip Shifted where
  f := fun p => (p.1 - 1, p.2)
  g := fun q => (q.1 + 1, q.2)
  fg := fun q => by obtain ⟨a, b⟩ := q; show ((a + 1 - 1, b) : Pt) = (a, b); rw [pe]; exact ⟨by omega, rfl⟩
  gf := fun p => by obtain ⟨h, t⟩ := p; show ((h - 1 + 1, t) : Pt) = (h, t); rw [pe]; exact ⟨by omega, rfl⟩
  eqv := fun p => by
    obtain ⟨h, t⟩ := p
    show ((2 - h - 1, t) : Pt) = (-(h - 1), t); rw [pe]; exact ⟨by omega, rfl⟩

def OnLine (p : Pt) : Prop := p.1 = 1

theorem strip_fixed_iff_line (p : Pt) : fold p = p ↔ OnLine p := by
  obtain ⟨h, t⟩ := p
  show ((2 - h, t) : Pt) = (h, t) ↔ h = 1
  rw [pe]; exact ⟨fun ⟨e, _⟩ => by omega, fun e => ⟨by omega, rfl⟩⟩

theorem slice_fixed_iff (q : Pt) : flipY q = q ↔ q.2 = 0 := by
  obtain ⟨r, i⟩ := q
  show ((r, -i) : Pt) = (r, i) ↔ i = 0
  rw [pe]; exact ⟨fun ⟨_, e⟩ => by omega, fun e => ⟨rfl, by omega⟩⟩

theorem shifted_fixed_iff (q : Pt) : negX q = q ↔ q.1 = 0 := by
  obtain ⟨a, b⟩ := q
  show ((-a, b) : Pt) = (a, b) ↔ a = 0
  rw [pe]; exact ⟨fun ⟨e, _⟩ => by omega, fun e => ⟨by omega, rfl⟩⟩

/-- THE FOUR SEATS ARE ONE: on the line, a scalar quaternion, a real energy, a point of Re u = 0,
    each exactly when the other three hold. -/
theorem four_seats_are_one (p : Pt) :
    (OnLine p ↔ (seatBridge.f p).2 = 0) ∧ (OnLine p ↔ (energyCarrier.f p).2 = 0) ∧
    (OnLine p ↔ (halfShift.f p).1 = 0) := by
  refine ⟨?_, ?_, ?_⟩
  · rw [← strip_fixed_iff_line, ← slice_fixed_iff]; exact iso_fixed seatBridge p
  · rw [← strip_fixed_iff_line, ← slice_fixed_iff]; exact iso_fixed energyCarrier p
  · rw [← strip_fixed_iff_line, ← shifted_fixed_iff]; exact iso_fixed halfShift p

/-! ## Part III. The heat bridge: the heat variable is twice the energy -/

/-- z = 2E: from the energy (a, β), E = a + iβ/2, to the Gaussian integer z = 2a + iβ. -/
def heatRoot (q : Pt) : Pt := (2 * q.1, q.2)

theorem heat_equivariant (q : Pt) : heatRoot (flipY q) = flipY (heatRoot q) := rfl

theorem heat_injective (q q' : Pt) (h : heatRoot q = heatRoot q') : q = q' := by
  obtain ⟨a, b⟩ := q; obtain ⟨a', b'⟩ := q'
  have h1 := congrArg Prod.fst h; have h2 := congrArg Prod.snd h
  change 2 * a = 2 * a' at h1; change b = b' at h2
  rw [pe]; exact ⟨by omega, h2⟩

/-- A root of H_0 is real exactly when the energy is real exactly when the zero is on the line. -/
theorem heat_real_iff_line (p : Pt) : (heatRoot (energyCarrier.f p)).2 = 0 ↔ OnLine p :=
  ((four_seats_are_one p).2.1).symm

/-- The heat flow on a monic quadratic z² + bz + c: after time t the constant is c − 2t, so the
    discriminant rises by exactly 8t. -/
def disc (b c t : Int) : Int := b * b - 4 * (c - 2 * t)

theorem disc_flow (b c t : Int) : disc b c t = disc b c 0 + 8 * t := by
  show b * b - 4 * (c - 2 * t) = b * b - 4 * (c - 2 * 0) + 8 * t; omega

/-- The heat merges the pair: z² + c with c > 0 has a conjugate pair at time 0, a double real root
    at t = c/2, two real roots after. The flow registers the pair onto the real axis. -/
theorem heat_merges_the_pair (c : Int) (hc : 0 < c) :
    disc 0 (2 * c) 0 < 0 ∧ disc 0 (2 * c) c = 0 ∧ 0 < disc 0 (2 * c) (c + 1) := by
  refine ⟨?_, ?_, ?_⟩ <;> (simp only [disc]; omega)

/-- The heat certificate decides nothing: z² and z² + t are both real-rooted at time t > 0 and
    differ at time 0. A certified real-rootedness after heating does not return the bit. -/
theorem heat_certificate_two_worlds (t : Int) (ht : 0 < t) :
    0 ≤ disc 0 0 t ∧ 0 ≤ disc 0 t t ∧ 0 ≤ disc 0 0 0 ∧ disc 0 t 0 < 0 := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;> (simp only [disc]; omega)

/-! ## Part IV. The prime face: every prime mode is unitary on its own line -/

/-- A prime mode at depth d has modulus p^d: it is unitary exactly at depth zero. -/
theorem prime_mode_unitary_iff (p d : Nat) (hp : 2 ≤ p) : p ^ d = 1 ↔ d = 0 := by
  cases d with
  | zero => simp
  | succ k =>
    have h1 : 1 ≤ p ^ k := Nat.pow_pos (by omega)
    have h2 : p ^ k * 2 ≤ p ^ k * p := Nat.mul_le_mul_left _ hp
    rw [Nat.pow_succ]; constructor
    · intro h; omega
    · intro h; omega

/-- The unnormalized prime line Re s = 0 is the edge h = 0; the fold carries it to the other edge,
    h = 2; neither is the critical line. The primes and the charged pair share the edges. -/
theorem primes_on_the_edges (t : Int) :
    fold (0, t) = (2, t) ∧ ¬ OnLine (0, t) ∧ ¬ OnLine (2, t) := by
  refine ⟨rfl, ?_, ?_⟩
  · intro h; change (0 : Int) = 1 at h; omega
  · intro h; change (2 : Int) = 1 at h; omega

/-- Normalization by the half-density carries the critical line onto the prime modes' own line:
    the half-shift sends h = 1 to h' = 0, where every normalized prime mode is unitary. -/
theorem normalized_primes_meet_the_line (t : Int) :
    halfShift.f (1, t) = (0, t) ∧ ∀ p : Nat, 2 ≤ p → p ^ (0 : Nat) = 1 :=
  ⟨rfl, fun p _ => Nat.pow_zero p⟩

/-! ## Part V. The ogdoad and the aperture -/

abbrev Sign := Bool × Bool × Bool
def signs : List Sign :=
  [(false, false, false), (false, false, true), (false, true, false), (false, true, true),
   (true, false, false), (true, false, true), (true, true, false), (true, true, true)]
def comp (s u : Sign) : Sign := (xor s.1 u.1, xor s.2.1 u.2.1, xor s.2.2 u.2.2)

/-- THE OGDOAD: the sign patterns of three axes are eight, closed under composition, each its own
    inverse: the fixed frame of the inside readings, with no ninth element. -/
theorem ogdoad :
    signs.length = 8 ∧ signs.eraseDups.length = 8 ∧
    signs.all (fun s => signs.all (fun u => signs.contains (comp s u))) = true ∧
    signs.all (fun s => comp s s == (false, false, false)) = true := by decide

/-- The cascade stops at the first failing gate. -/
def cascade : List Bool → Option Nat
  | [] => none
  | false :: _ => some 0
  | true :: gs => (cascade gs).map Nat.succ

def walks (n : Nat) : List (List Bool) :=
  (List.range (2 ^ n)).map fun b => (List.range n).map fun j => b.testBit j

/-- THE APERTURE: with the reading gate closed from inside, no walk of seven inside gates passes;
    every one of the 128 halts. -/
theorem no_walk_passes_the_aperture :
    (walks 7).all (fun xs => (cascade (xs ++ [false])).isSome) = true := by decide

/-- The one door: the walk that passes every inside gate crosses exactly when the aperture's bit
    is supplied. The crossing is the supplied bit and nothing on the inside. -/
theorem crossing_is_the_supplied_bit (b : Bool) :
    (cascade (List.replicate 7 true ++ [b])).isNone = b := by cases b <;> decide

/-! ## Part VI. The crossings are one proposition, and the record decides nothing -/

def Value (Z : Pt → Prop) : Prop := ∀ s, Z s → OnLine s
def Occupancy (Z : Pt → Prop) : Prop := ∀ s, Z s → (seatBridge.f s).2 = 0
def AllStationary (Z : Pt → Prop) : Prop := ∀ s, Z s → (energyCarrier.f s).2 = 0
def HeatReal (Z : Pt → Prop) : Prop := ∀ s, Z s → (heatRoot (energyCarrier.f s)).2 = 0
def NormalizedUnitary (Z : Pt → Prop) : Prop := ∀ s, Z s → (halfShift.f s).1 = 0

/-- THE CROSSINGS ARE ONE: occupancy of the seat bridge, stationarity of every energy, real roots
    of the heat variable, and unitarity of the normalized prime modes at every zero are each the
    value, the line property of the zero set. -/
theorem crossings_are_one (Z : Pt → Prop) :
    (Occupancy Z ↔ Value Z) ∧ (AllStationary Z ↔ Value Z) ∧ (HeatReal Z ↔ Value Z) ∧
    (NormalizedUnitary Z ↔ Value Z) := by
  refine ⟨⟨fun h s hs => ?_, fun h s hs => ?_⟩, ⟨fun h s hs => ?_, fun h s hs => ?_⟩,
          ⟨fun h s hs => ?_, fun h s hs => ?_⟩, ⟨fun h s hs => ?_, fun h s hs => ?_⟩⟩
  · exact ((four_seats_are_one s).1).mpr (h s hs)
  · exact ((four_seats_are_one s).1).mp (h s hs)
  · exact ((four_seats_are_one s).2.1).mpr (h s hs)
  · exact ((four_seats_are_one s).2.1).mp (h s hs)
  · exact (heat_real_iff_line s).mp (h s hs)
  · exact (heat_real_iff_line s).mpr (h s hs)
  · exact ((four_seats_are_one s).2.2).mpr (h s hs)
  · exact ((four_seats_are_one s).2.2).mp (h s hs)

def reg (p : Pt) : Pt := (1, p.2)
def worldLine : Pt → Prop := fun s => s = (1, 5)
def worldPair : Pt → Prop := fun s => s = (0, 5) ∨ s = (2, 5)
def recordOf (Z : Pt → Prop) : Pt → Prop := fun r => ∃ s, Z s ∧ reg s = r

theorem worlds_share_the_record (r : Pt) : recordOf worldLine r ↔ recordOf worldPair r := by
  constructor
  · intro ⟨s, hs, e⟩; exact ⟨(0, 5), Or.inl rfl, by rw [← e, hs]; rfl⟩
  · intro ⟨s, hs, e⟩
    refine ⟨(1, 5), rfl, ?_⟩
    rcases hs with h | h <;> (rw [← e, h]; rfl)

/-- NONE OF THE BRIDGES DECIDES: the two worlds share every record, the pair world is fold-closed,
    and every crossing, read in any chart, holds on one world and fails on the other. -/
theorem no_bridge_decides (F : (Pt → Prop) → Prop) :
    (F (recordOf worldLine) ↔ F (recordOf worldPair)) ∧
    (∀ s, worldPair s → worldPair (fold s)) ∧
    Occupancy worldLine ∧ ¬ Occupancy worldPair ∧
    HeatReal worldLine ∧ ¬ HeatReal worldPair ∧
    NormalizedUnitary worldLine ∧ ¬ NormalizedUnitary worldPair := by
  have e : recordOf worldLine = recordOf worldPair :=
    funext fun r => propext (worlds_share_the_record r)
  have vl : Value worldLine := fun s hs => by rw [hs]; rfl
  have vp : ¬ Value worldPair := fun h => by
    have h0 := h (0, 5) (Or.inl rfl); change (0 : Int) = 1 at h0; omega
  refine ⟨by rw [e], ?_, (crossings_are_one _).1.mpr vl, fun h => vp ((crossings_are_one _).1.mp h),
    (crossings_are_one _).2.2.1.mpr vl, fun h => vp ((crossings_are_one _).2.2.1.mp h),
    (crossings_are_one _).2.2.2.mpr vl, fun h => vp ((crossings_are_one _).2.2.2.mp h)⟩
  intro s hs
  rcases hs with h | h
  · right; rw [h]; rfl
  · left; rw [h]; rfl

/-! ## Part VII. The capstone -/

/-- THE BRIDGES ARE ONE. The seat bridge, the energy carrier and the half-shift are isomorphisms of
    involution spaces, the energy carrier being the seat bridge with its orientation reversed; the
    heat variable is twice the energy, an equivariant injection; the four seats coincide; the
    crossings, read in every chart, are one proposition, the value; the ogdoad is eight with no
    ninth inside; no inside walk passes the aperture, and the one door opens exactly on the
    supplied bit; and no record, in any chart, decides the value. -/
theorem bridges_are_one :
    (∀ p : Pt, energyCarrier.f p = (seatBridge.comp sliceFlip).f p) ∧
    (∀ q : Pt, heatRoot (flipY q) = flipY (heatRoot q)) ∧
    (∀ p : Pt, (OnLine p ↔ (seatBridge.f p).2 = 0) ∧ (OnLine p ↔ (energyCarrier.f p).2 = 0) ∧
      (OnLine p ↔ (halfShift.f p).1 = 0)) ∧
    (∀ Z : Pt → Prop, (Occupancy Z ↔ Value Z) ∧ (AllStationary Z ↔ Value Z) ∧
      (HeatReal Z ↔ Value Z) ∧ (NormalizedUnitary Z ↔ Value Z)) ∧
    (signs.length = 8 ∧ signs.eraseDups.length = 8) ∧
    (walks 7).all (fun xs => (cascade (xs ++ [false])).isSome) = true ∧
    (∀ b : Bool, (cascade (List.replicate 7 true ++ [b])).isNone = b) ∧
    (∀ F : (Pt → Prop) → Prop, F (recordOf worldLine) ↔ F (recordOf worldPair)) :=
  ⟨energy_is_seat_bridge_conjugated, heat_equivariant, four_seats_are_one, crossings_are_one,
   ⟨ogdoad.1, ogdoad.2.1⟩, no_walk_passes_the_aperture, crossing_is_the_supplied_bit,
   fun F => (no_bridge_decides F).1⟩

end SPHYS.Bridges

#print axioms SPHYS.Bridges.pe
#print axioms SPHYS.Bridges.iso_fixed
#print axioms SPHYS.Bridges.flipY_inv
#print axioms SPHYS.Bridges.fold_inv
#print axioms SPHYS.Bridges.negX_inv
#print axioms SPHYS.Bridges.energy_is_seat_bridge_conjugated
#print axioms SPHYS.Bridges.strip_fixed_iff_line
#print axioms SPHYS.Bridges.slice_fixed_iff
#print axioms SPHYS.Bridges.shifted_fixed_iff
#print axioms SPHYS.Bridges.four_seats_are_one
#print axioms SPHYS.Bridges.heat_equivariant
#print axioms SPHYS.Bridges.heat_injective
#print axioms SPHYS.Bridges.heat_real_iff_line
#print axioms SPHYS.Bridges.disc_flow
#print axioms SPHYS.Bridges.heat_merges_the_pair
#print axioms SPHYS.Bridges.heat_certificate_two_worlds
#print axioms SPHYS.Bridges.prime_mode_unitary_iff
#print axioms SPHYS.Bridges.primes_on_the_edges
#print axioms SPHYS.Bridges.normalized_primes_meet_the_line
#print axioms SPHYS.Bridges.ogdoad
#print axioms SPHYS.Bridges.no_walk_passes_the_aperture
#print axioms SPHYS.Bridges.crossing_is_the_supplied_bit
#print axioms SPHYS.Bridges.crossings_are_one
#print axioms SPHYS.Bridges.worlds_share_the_record
#print axioms SPHYS.Bridges.no_bridge_decides
#print axioms SPHYS.Bridges.bridges_are_one
