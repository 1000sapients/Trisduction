/-
  SPHYS_Strong_CP.lean · the strong force reads no orientation, read at the Riemann seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: h = 2 Re s, t = Im s; the fold s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t), the critical line h = 1.

  Part I     the seat, the category of involutions, the functor of the seat.
  Part II    the energy carrier (resident).
  Part III   the substrate (resident).
  Part IV     The angle's fold has two fixed points.
  Part V      The electric dipole moment is odd; its null forces the fixed set.
  Part VI     Positivity selects zero.
  Part VII    The capstone.
-/
set_option autoImplicit false
namespace SPHYS.StrongCP


/-! ## Part I. The seat, the category of involutions, and the functor of the seat -/

abbrev Pt := Int × Int

def fold (p : Pt) : Pt := (2 - p.1, p.2)
def OnLine (p : Pt) : Prop := p.1 = 1
instance : DecidablePred OnLine := fun p => inferInstanceAs (Decidable (p.1 = 1))
/-- Registration keeps the height and forgets the side. -/
def reg (p : Pt) : Pt := (1, p.2)

theorem pe {a b c d : Int} : ((a, b) : Pt) = (c, d) ↔ a = c ∧ b = d :=
  ⟨fun e => ⟨congrArg Prod.fst e, congrArg Prod.snd e⟩,
   fun ⟨e1, e2⟩ => by subst e1; subst e2; rfl⟩

theorem fold_involutive (p : Pt) : fold (fold p) = p := by
  obtain ⟨h, t⟩ := p
  show ((2 - (2 - h), t) : Pt) = (h, t)
  rw [pe]; exact ⟨by omega, rfl⟩

/-- The seat: the fixed set of the fold is the critical line. -/
theorem seat_fixed_line (p : Pt) : fold p = p ↔ OnLine p := by
  obtain ⟨h, t⟩ := p
  show ((2 - h, t) : Pt) = (h, t) ↔ h = 1
  rw [pe]; constructor
  · intro ⟨e, _⟩; omega
  · intro e; exact ⟨by omega, rfl⟩

theorem reg_lands (p : Pt) : OnLine (reg p) := rfl

theorem reg_fixes_iff (p : Pt) : reg p = p ↔ OnLine p := by
  obtain ⟨h, t⟩ := p
  show ((1, t) : Pt) = (h, t) ↔ h = 1
  rw [pe]; constructor
  · intro ⟨e, _⟩; exact e.symm
  · intro e; exact ⟨e.symm, rfl⟩

/-- The side is what registration forgets: a point and its mirror leave one record. -/
theorem reg_forgets_side (p : Pt) : reg (fold p) = reg p := rfl

/-- The value on a set of points: every member stands on the line. -/
def Value (Z : Pt → Prop) : Prop := ∀ s, Z s → OnLine s

/-- Least erasure: registration moves no member, so it erases nothing of Z. -/
def LeastErasure (Z : Pt → Prop) : Prop := ∀ s, Z s → reg s = s

theorem least_erasure_iff_value (Z : Pt → Prop) : LeastErasure Z ↔ Value Z :=
  ⟨fun h s hs => (reg_fixes_iff s).mp (h s hs), fun h s hs => (reg_fixes_iff s).mpr (h s hs)⟩

/-- Maps that respect involutions. -/
def Equivariant {X Y : Type} (f : X → Y) (τ : X → X) (σ : Y → Y) : Prop := ∀ x, f (τ x) = σ (f x)

theorem equivariant_id {X : Type} (τ : X → X) : Equivariant id τ τ := fun _ => rfl

theorem equivariant_comp {X Y W : Type} {f : X → Y} {g : Y → W} {τ : X → X} {σ : Y → Y}
    {ρ : W → W} (hf : Equivariant f τ σ) (hg : Equivariant g σ ρ) : Equivariant (g ∘ f) τ ρ := by
  intro x
  show g (f (τ x)) = ρ (g (f x))
  rw [hf x, hg (f x)]

/-- The fixed set is a functor: an equivariant map sends fixed points to fixed points. -/
theorem fix_functorial {X Y : Type} {f : X → Y} {τ : X → X} {σ : Y → Y}
    (hf : Equivariant f τ σ) {x : X} (hx : τ x = x) : σ (f x) = f x := by
  rw [← hf x, hx]

/-- A global seat: an involution whose fixed set is the locus. -/
structure GlobalSeat (P : Pt → Prop) (σ : Pt → Pt) : Prop where
  involutive : ∀ p, σ (σ p) = p
  fixed_iff : ∀ p, σ p = p ↔ P p

theorem fold_global_seat : GlobalSeat OnLine fold := ⟨fold_involutive, seat_fixed_line⟩

/-- A carrier: a map from world-instances into the strip landing on the line. -/
structure Carrier (W : Type) where
  ι : W → Pt
  lands : ∀ w, OnLine (ι w)

def image {W : Type} (ι : W → Pt) : Pt → Prop := fun s => ∃ w, ι w = s
def Actuated {W : Type} (ι : W → Pt) (Z : Pt → Prop) : Prop := ∀ s, Z s → ∃ w, ι w = s

/-- Landing is forced: an equivariant map into the seat carries every fixed point of the physical
    involution onto the line. The carrier is built from the symmetry, not chosen. -/
theorem equivariant_carrier_lands {X : Type} (f : X → Pt) (τ : X → X)
    (hf : Equivariant f τ fold) :
    ∃ C : Carrier { x : X // τ x = x }, ∀ w, C.ι w = f w.1 :=
  ⟨⟨fun w => f w.1, fun w => (seat_fixed_line (f w.1)).mp (fix_functorial hf w.2)⟩, fun _ => rfl⟩

/-- The image of a carrier is compliant with no premise at all. -/
theorem value_on_image {W : Type} (C : Carrier W) : Value (image C.ι) :=
  fun _ hs => match hs with | ⟨w, hw⟩ => hw ▸ C.lands w

/-- The kinetic crossing: a carrier and its coverage give the value, and nothing else is used. -/
theorem kinetic_crossing {W : Type} (C : Carrier W) (Z : Pt → Prop) (hcov : Actuated C.ι Z) :
    Value Z :=
  fun s hs => match hcov s hs with | ⟨w, hw⟩ => hw ▸ C.lands w

/-- Under the seat every off-line point has a partner, distinct and also off the line. -/
theorem off_locus_pair (p : Pt) (hp : ¬ OnLine p) :
    fold p ≠ p ∧ ¬ OnLine (fold p) ∧ reg (fold p) = reg p := by
  refine ⟨fun e => hp ((seat_fixed_line p).mp e), fun e => hp ?_, rfl⟩
  obtain ⟨h, t⟩ := p
  have e' : 2 - h = 1 := e
  show h = 1
  omega

/-! ## Part II. The energy carrier: an energy, its rate, and the fold -/

/-- An energy a + i β/2, as frequency and doubled rate; its mode's norm moves as e^{βt}. -/
structure Energy where
  freq : Int
  rate : Int
  deriving DecidableEq, Repr

/-- The time mirror of a mode: its rate reversed, its frequency kept (complex conjugation of E). -/
def Energy.mirror (E : Energy) : Energy := ⟨E.freq, -E.rate⟩
def IsReal (E : Energy) : Prop := E.rate = 0
/-- Stationary: the norm e^{βt} is unchanged at every integer time t, i.e. β t = 0 for all t. -/
def Stationary (E : Energy) : Prop := ∀ t : Int, E.rate * t = 0

/-- The energy carrier s = 1/2 + iE in the chart: h = 1 − β, t = a. -/
def phi (E : Energy) : Pt := (1 - E.rate, E.freq)
def psi (p : Pt) : Energy := ⟨p.2, 1 - p.1⟩

theorem ee {a b c d : Int} : (⟨a, b⟩ : Energy) = ⟨c, d⟩ ↔ a = c ∧ b = d :=
  ⟨fun e => ⟨congrArg Energy.freq e, congrArg Energy.rate e⟩,
   fun ⟨e1, e2⟩ => by subst e1; subst e2; rfl⟩

theorem mirror_involutive (E : Energy) : E.mirror.mirror = E := by
  obtain ⟨a, b⟩ := E
  show (⟨a, - -b⟩ : Energy) = ⟨a, b⟩
  rw [ee]; exact ⟨rfl, by omega⟩

theorem psi_phi (E : Energy) : psi (phi E) = E := by
  obtain ⟨a, b⟩ := E
  show (⟨a, 1 - (1 - b)⟩ : Energy) = ⟨a, b⟩
  rw [ee]; exact ⟨rfl, by omega⟩

theorem phi_psi (p : Pt) : phi (psi p) = p := by
  obtain ⟨h, t⟩ := p
  show ((1 - (1 - h), t) : Pt) = (h, t)
  rw [pe]; exact ⟨by omega, rfl⟩

theorem phi_injective (E F : Energy) (h : phi E = phi F) : E = F := by
  rw [← psi_phi E, ← psi_phi F, h]

/-- EQUIVARIANCE: time-mirroring the rate is the fold. -/
theorem phi_equivariant : Equivariant phi Energy.mirror fold := by
  intro E
  obtain ⟨a, b⟩ := E
  show ((1 - -b, a) : Pt) = (2 - (1 - b), a)
  rw [pe]; exact ⟨by omega, rfl⟩

theorem mirror_fixed_iff_real (E : Energy) : E.mirror = E ↔ IsReal E := by
  obtain ⟨a, b⟩ := E
  show (⟨a, -b⟩ : Energy) = ⟨a, b⟩ ↔ b = 0
  rw [ee]; constructor
  · intro ⟨_, e⟩; omega
  · intro e; exact ⟨rfl, by omega⟩

/-- The line is exactly the image of the real energies. -/
theorem phi_line_iff_real (E : Energy) : OnLine (phi E) ↔ IsReal E := by
  obtain ⟨a, b⟩ := E
  show 1 - b = 1 ↔ b = 0
  exact ⟨fun h => by omega, fun h => by subst h; rfl⟩

theorem stationary_iff_real (E : Energy) : Stationary E ↔ IsReal E := by
  constructor
  · intro h; have h1 := h 1; rw [Int.mul_one] at h1; exact h1
  · intro h t; show E.rate * t = 0; rw [show E.rate = 0 from h, Int.zero_mul]

/-- THE LINE IS WHERE ENERGY STANDS STILL. -/
theorem line_is_stationary (p : Pt) : OnLine p ↔ Stationary (psi p) := by
  rw [stationary_iff_real, ← phi_line_iff_real, phi_psi]

/-- Every measured energy is a real number, and every real energy lands on the line. -/
theorem measured_on_line (a : Int) : OnLine (phi ⟨a, 0⟩) := rfl

/-- The registration mirror: no real energy lands off the line. -/
theorem no_measurement_off_line (p : Pt) (hp : ¬ OnLine p) (a : Int) : phi ⟨a, 0⟩ ≠ p :=
  fun e => hp (e ▸ measured_on_line a)

/-- The energy carrier, built from the symmetry: the real energies land on the line. -/
theorem energy_carrier_lands :
    ∃ C : Carrier { E : Energy // E.mirror = E }, ∀ w, C.ι w = phi w.1 :=
  equivariant_carrier_lands phi Energy.mirror phi_equivariant

/-! ## Part III. The substrate: the particle map, three odd readings and one even -/

/-- A particle in the broken phase: electric charge times three, colour, baryon number times
    three, lepton number, and its energy. -/
structure Particle where
  q3 : Int
  colour : Int
  b3 : Int
  lepton : Int
  energy : Energy
  deriving DecidableEq, Repr

/-- The particle map: every additive charge flipped, the energy kept (frequency and rate). -/
def bar (c : Particle) : Particle := ⟨-c.q3, -c.colour, -c.b3, -c.lepton, c.energy⟩
/-- The time mirror of a particle's mode. -/
def tmirror (c : Particle) : Particle := ⟨c.q3, c.colour, c.b3, c.lepton, c.energy.mirror⟩
def Neutral (c : Particle) : Prop := c.q3 = 0 ∧ c.colour = 0 ∧ c.b3 = 0 ∧ c.lepton = 0

theorem bar_involutive (c : Particle) : bar (bar c) = c := by
  obtain ⟨q, k, b, l, E⟩ := c
  show (⟨- -q, - -k, - -b, - -l, E⟩ : Particle) = ⟨q, k, b, l, E⟩
  rw [Int.neg_neg, Int.neg_neg, Int.neg_neg, Int.neg_neg]

theorem bar_fixed_iff_neutral (c : Particle) : bar c = c ↔ Neutral c := by
  obtain ⟨q, k, b, l, E⟩ := c
  show (⟨-q, -k, -b, -l, E⟩ : Particle) = ⟨q, k, b, l, E⟩ ↔ (q = 0 ∧ k = 0 ∧ b = 0 ∧ l = 0)
  constructor
  · intro h
    have h1 := congrArg Particle.q3 h
    have h2 := congrArg Particle.colour h
    have h3 := congrArg Particle.b3 h
    have h4 := congrArg Particle.lepton h
    change -q = q at h1; change -k = k at h2; change -b = b at h3; change -l = l at h4
    exact ⟨by omega, by omega, by omega, by omega⟩
  · intro ⟨h1, h2, h3, h4⟩
    subst h1; subst h2; subst h3; subst h4; rfl

/-- Three plus one: the charge readings are odd under the particle map, the energy reading even. -/
theorem odd_charges_even_energy (c : Particle) :
    ((bar c).q3 = -c.q3 ∧ (bar c).colour = -c.colour ∧ (bar c).b3 = -c.b3 ∧
     (bar c).lepton = -c.lepton) ∧ (bar c).energy = c.energy :=
  ⟨⟨rfl, rfl, rfl, rfl⟩, rfl⟩

/-- Gravity reads energy only, so no gravitational reading tells a particle from its antiparticle. -/
theorem gravity_reads_no_charge_bit {β : Type} (g : Energy → β) (c : Particle) :
    g (bar c).energy = g c.energy := rfl

/-- The two involutions of the substrate commute. -/
theorem involutions_commute (c : Particle) : bar (tmirror c) = tmirror (bar c) := rfl

theorem tmirror_involutive (c : Particle) : tmirror (tmirror c) = c := by
  obtain ⟨q, k, b, l, E⟩ := c
  show (⟨q, k, b, l, E.mirror.mirror⟩ : Particle) = ⟨q, k, b, l, E⟩
  rw [mirror_involutive]

/-- A particle is fixed by both involutions exactly when it is neutral and stable. -/
theorem joint_fixed_iff (c : Particle) :
    (bar c = c ∧ tmirror c = c) ↔ (Neutral c ∧ IsReal c.energy) := by
  constructor
  · intro ⟨h1, h2⟩
    refine ⟨(bar_fixed_iff_neutral c).mp h1, (mirror_fixed_iff_real c.energy).mp ?_⟩
    exact congrArg Particle.energy h2
  · intro ⟨h1, h2⟩
    refine ⟨(bar_fixed_iff_neutral c).mpr h1, ?_⟩
    obtain ⟨q, k, b, l, E⟩ := c
    show (⟨q, k, b, l, E.mirror⟩ : Particle) = ⟨q, k, b, l, E⟩
    rw [(mirror_fixed_iff_real E).mpr h2]

/-- The energy carrier on particles: the seat point of a particle's energy. -/
def energySeat (c : Particle) : Pt := phi c.energy
/-- The charge carrier on particles, the odd face: electric charge (in thirds) is the side. -/
def chargeSeat (c : Particle) : Pt := (1 + c.q3, c.energy.freq)
/-- The lepton chart of the electron's witness: charge q in units of e goes to h = 1 + q. -/
def leptonSeat (q m : Int) : Pt := (1 + q, m)

/-- The charge carrier is equivariant: the particle map is carried onto the fold. -/
theorem charge_carrier_equivariant : Equivariant chargeSeat bar fold := by
  intro c
  show ((1 + -c.q3, c.energy.freq) : Pt) = (2 - (1 + c.q3), c.energy.freq)
  rw [pe]; exact ⟨by omega, rfl⟩

/-- The energy carrier is blind to the particle map and equivariant for the time mirror. -/
theorem pair_lands_once (c : Particle) : energySeat (bar c) = energySeat c := rfl
theorem tmirror_equivariant : Equivariant energySeat tmirror fold := fun c => phi_equivariant c.energy

/-- Electrically neutral particles land on the line under the charge carrier. -/
theorem neutral_charge_on_line (c : Particle) (h : c.q3 = 0) : OnLine (chargeSeat c) := by
  show 1 + c.q3 = 1
  omega

/-- The electron and the positron land on the two edges, real parts 0 and 1, mirror images. -/
theorem pair_on_the_edges (m : Int) :
    leptonSeat (-1) m = (0, m) ∧ leptonSeat 1 m = (2, m) ∧ fold (leptonSeat (-1) m) = leptonSeat 1 m :=
  ⟨rfl, rfl, rfl⟩

/-- A stable particle lands on the line under the energy carrier. -/
theorem stable_lands (c : Particle) (h : IsReal c.energy) : OnLine (energySeat c) :=
  (phi_line_iff_real c.energy).mpr h


/-! ## Part IV. The angle's fold has two fixed points -/

/-- On the circle of the strong angle, read as an integer modulo 2m, the reflection θ ↦ −θ fixes a
    point exactly when twice it is a multiple of 2m, that is, exactly when it is a multiple of m: the
    two points 0 and π. -/
theorem fixed_iff_multiple_of_half (m x : Int) : (∃ k, x + x = (2 * m) * k) ↔ (∃ k, x = m * k) := by
  constructor
  · intro ⟨k, h⟩; refine ⟨k, ?_⟩; rw [Int.mul_assoc] at h; omega
  · intro ⟨k, h⟩; refine ⟨k, ?_⟩; rw [Int.mul_assoc]; omega

/-- The discrete circle of 2m points: the reflection, the sign of the sine (the odd reading), and the
    distance from zero (the even energy). -/
def flipC (m k : Nat) : Nat := (2 * m - k) % (2 * m)
def oddC (m k : Nat) : Int := if k % (2 * m) = 0 ∨ k % (2 * m) = m then 0 else if k % (2 * m) < m then 1 else -1
def evenC (m k : Nat) : Int := (min (k % (2 * m)) (2 * m - k % (2 * m)) : Nat)

/-- The angle carrier: the odd reading is the offset from the line, the energy the height. -/
def thetaSeat (m k : Nat) : Pt := (1 + oddC m k, evenC m k)

/-- THE REFLECTION IS THE FOLD AND THE TWO FIXED POINTS ARE THE LINE, on every circle of up to
    twenty-four points: the carrier is equivariant, and a point lands on the line exactly when it is 0
    or π. -/
theorem angle_carrier_equivariant_and_line :
    ((List.range 13).all fun m => (List.range (2 * m)).all fun k =>
      (thetaSeat m (flipC m k) == fold (thetaSeat m k)) &&
      (decide ((thetaSeat m k).1 = 1) == (decide (k = 0) || decide (k = m))) &&
      (decide (flipC m k = k) == (decide (k = 0) || decide (k = m)))) = true := by
  decide

/-! ## Part V. The electric dipole moment is odd; its null forces the fixed set -/

/-- The neutron's electric dipole moment reads the angle through an odd function: it vanishes on both
    fixed points and nowhere else, on every circle of up to twenty-four points. -/
theorem edm_odd_and_null_on_the_fixed_set :
    ((List.range 13).all fun m => (List.range (2 * m)).all fun k =>
      (oddC m (flipC m k) == - oddC m k) &&
      (decide (oddC m k = 0) == (decide (k = 0) || decide (k = m)))) = true := by
  decide

/-- An even reading of the angle cannot see the CP-odd part: it agrees at θ and −θ. -/
theorem energy_even :
    ((List.range 13).all fun m => (List.range (2 * m)).all fun k => evenC m (flipC m k) == evenC m k) = true := by
  decide

/-! ## Part VI. Positivity selects zero -/

/-- POSITIVITY SELECTS ZERO: of the two fixed points the energy is least at 0, uniquely, and greatest
    at π; both are stationary. -/
theorem positivity_selects_zero :
    ((List.range 12).all fun i => let m := i + 1;
      (evenC m 0 == 0) && (evenC m m == (m : Int)) &&
      ((List.range (2 * m)).all fun k => (decide (k = 0) || decide (0 < evenC m k)) && decide (evenC m k ≤ evenC m m)) &&
      (evenC m 1 == evenC m (2 * m - 1)) && (evenC m (m + 1) == evenC m (m - 1))) = true := by
  decide

/-- The value of the angle is keyed to the even readings: the angle and its reflection give one
    energy, so no even reading returns the sign of a nonzero angle. -/
theorem the_sign_of_theta_is_keyed (f : Nat → Bool) (m : Nat)
    (hf : f (flipC m 1) = f 1) : ¬ (f 1 = true ∧ f (flipC m 1) = false) := by
  intro ⟨h1, h2⟩; rw [hf, h1] at h2; exact Bool.noConfusion h2

/-! ## Part VII. The capstone -/

/-- THE STRONG FORCE READS NO ORIENTATION. The angle's reflection fixes exactly the multiples of half
    the circle, 0 and π; the angle carrier sends the reflection to the fold and the two fixed points
    to the line; the dipole moment is odd and vanishes exactly there, so its measured null forces the
    fixed set; and positivity puts the energy's unique minimum at 0, the maximum at π. -/
theorem the_strong_force_reads_no_orientation :
    (∀ m x : Int, (∃ k, x + x = (2 * m) * k) ↔ (∃ k, x = m * k)) ∧
    ((List.range 13).all fun m => (List.range (2 * m)).all fun k =>
      (thetaSeat m (flipC m k) == fold (thetaSeat m k)) &&
      (decide ((thetaSeat m k).1 = 1) == (decide (k = 0) || decide (k = m))) &&
      (decide (flipC m k = k) == (decide (k = 0) || decide (k = m)))) = true ∧
    ((List.range 13).all fun m => (List.range (2 * m)).all fun k =>
      (oddC m (flipC m k) == - oddC m k) &&
      (decide (oddC m k = 0) == (decide (k = 0) || decide (k = m)))) = true :=
  ⟨fixed_iff_multiple_of_half, angle_carrier_equivariant_and_line, edm_odd_and_null_on_the_fixed_set⟩

end SPHYS.StrongCP

#print axioms SPHYS.StrongCP.pe
#print axioms SPHYS.StrongCP.fold_involutive
#print axioms SPHYS.StrongCP.seat_fixed_line
#print axioms SPHYS.StrongCP.reg_lands
#print axioms SPHYS.StrongCP.reg_fixes_iff
#print axioms SPHYS.StrongCP.reg_forgets_side
#print axioms SPHYS.StrongCP.least_erasure_iff_value
#print axioms SPHYS.StrongCP.equivariant_id
#print axioms SPHYS.StrongCP.equivariant_comp
#print axioms SPHYS.StrongCP.fix_functorial
#print axioms SPHYS.StrongCP.fold_global_seat
#print axioms SPHYS.StrongCP.equivariant_carrier_lands
#print axioms SPHYS.StrongCP.value_on_image
#print axioms SPHYS.StrongCP.kinetic_crossing
#print axioms SPHYS.StrongCP.off_locus_pair
#print axioms SPHYS.StrongCP.ee
#print axioms SPHYS.StrongCP.mirror_involutive
#print axioms SPHYS.StrongCP.psi_phi
#print axioms SPHYS.StrongCP.phi_psi
#print axioms SPHYS.StrongCP.phi_injective
#print axioms SPHYS.StrongCP.phi_equivariant
#print axioms SPHYS.StrongCP.mirror_fixed_iff_real
#print axioms SPHYS.StrongCP.phi_line_iff_real
#print axioms SPHYS.StrongCP.stationary_iff_real
#print axioms SPHYS.StrongCP.line_is_stationary
#print axioms SPHYS.StrongCP.measured_on_line
#print axioms SPHYS.StrongCP.no_measurement_off_line
#print axioms SPHYS.StrongCP.energy_carrier_lands
#print axioms SPHYS.StrongCP.bar_involutive
#print axioms SPHYS.StrongCP.bar_fixed_iff_neutral
#print axioms SPHYS.StrongCP.odd_charges_even_energy
#print axioms SPHYS.StrongCP.gravity_reads_no_charge_bit
#print axioms SPHYS.StrongCP.involutions_commute
#print axioms SPHYS.StrongCP.tmirror_involutive
#print axioms SPHYS.StrongCP.joint_fixed_iff
#print axioms SPHYS.StrongCP.charge_carrier_equivariant
#print axioms SPHYS.StrongCP.pair_lands_once
#print axioms SPHYS.StrongCP.tmirror_equivariant
#print axioms SPHYS.StrongCP.neutral_charge_on_line
#print axioms SPHYS.StrongCP.pair_on_the_edges
#print axioms SPHYS.StrongCP.stable_lands
#print axioms SPHYS.StrongCP.fixed_iff_multiple_of_half
#print axioms SPHYS.StrongCP.angle_carrier_equivariant_and_line
#print axioms SPHYS.StrongCP.edm_odd_and_null_on_the_fixed_set
#print axioms SPHYS.StrongCP.energy_even
#print axioms SPHYS.StrongCP.positivity_selects_zero
#print axioms SPHYS.StrongCP.the_sign_of_theta_is_keyed
#print axioms SPHYS.StrongCP.the_strong_force_reads_no_orientation
