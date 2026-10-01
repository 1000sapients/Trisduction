/-
  SPHYS_Dark.lean · dark matter as the fixed set of charge conjugation, the dark force as one keyed
  bit, and the phantom as a negative actuation, read at the Riemann seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared. Edition 2.0.0 of the dark
  kernel: the content of Dark_Closure.lean (edition 1.0.0) re-seated on the hardware seat, carriers
  and substrate, its private stage chart retired.

  The chart: h = 2 Re s, t = Im s; the fold s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t), the critical line h = 1.

  Part I     the seat, the category of involutions, the functor of the seat.
  Part II    the energy carrier (resident).
  Part III   the substrate (resident).
  Part IV    the fixed set and its readings.
  Part V     the seat is not electric neutrality; a charge-free state cannot radiate.
  Part VI    gravity does not read identity.
  Part VII   the neutrino fog: one energy record, two sources.
  Part VIII  the fifth reading, keyed by the anomaly conditions.
  Part IX    the dark force in the acceleration sense: active density and the kinetic floor.
  Part X     the dark ledger, computed.
  Part XI    fortification: the measured nulls force the visible fixed set, the portals are
             derived, the fifth is free, the dark bit is the Majorana bit.
  Part XII   the dark row on the seat.
  Part XIII  the capstone.
-/
set_option autoImplicit false
namespace SPHYS.Dark


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


/-! ## Part IV. The fixed set and its readings. -/

/-- A state: hypercharge and weak isospin times six, one colour weight (a Cartan coordinate), one dark charge, mass. -/
structure State where
  y6 : Int
  t3x6 : Int
  colour : Int
  dark : Int
  mass : Nat
  deriving DecidableEq, Repr

/-- Charge conjugation: every gauge charge flipped, the mass kept. -/
def conj (c : State) : State := ⟨-c.y6, -c.t3x6, -c.colour, -c.dark, c.mass⟩

/-- Visible conjugation: the three Standard Model charges flipped, the dark charge and the mass kept. -/
def conjSM (c : State) : State := ⟨-c.y6, -c.t3x6, -c.colour, c.dark, c.mass⟩

def neutral (c : State) : Prop := c.y6 = 0 ∧ c.t3x6 = 0 ∧ c.colour = 0 ∧ c.dark = 0
def neutralSM (c : State) : Prop := c.y6 = 0 ∧ c.t3x6 = 0 ∧ c.colour = 0

theorem conj_involution (c : State) : conj (conj c) = c := by
  cases c with
  | mk y t k d m =>
    show State.mk (- -y) (- -t) (- -k) (- -d) m = State.mk y t k d m
    rw [Int.neg_neg, Int.neg_neg, Int.neg_neg, Int.neg_neg]

/-- THE FIXED SET: a state is its own conjugate exactly when it carries no gauge charge at all. -/
theorem fixed_iff_neutral (c : State) : conj c = c ↔ neutral c := by
  cases c with
  | mk y t k d m =>
    show State.mk (-y) (-t) (-k) (-d) m = State.mk y t k d m ↔ (y = 0 ∧ t = 0 ∧ k = 0 ∧ d = 0)
    constructor
    · intro h
      have h1 := congrArg State.y6 h
      have h2 := congrArg State.t3x6 h
      have h3 := congrArg State.colour h
      have h4 := congrArg State.dark h
      change -y = y at h1
      change -t = t at h2
      change -k = k at h3
      change -d = d at h4
      exact ⟨by omega, by omega, by omega, by omega⟩
    · intro ⟨h1, h2, h3, h4⟩
      subst h1; subst h2; subst h3; subst h4
      rfl

theorem fixedSM_iff_neutralSM (c : State) : conjSM c = c ↔ neutralSM c := by
  cases c with
  | mk y t k d m =>
    show State.mk (-y) (-t) (-k) d m = State.mk y t k d m ↔ (y = 0 ∧ t = 0 ∧ k = 0)
    constructor
    · intro h
      have h1 := congrArg State.y6 h
      have h2 := congrArg State.t3x6 h
      have h3 := congrArg State.colour h
      change -y = y at h1
      change -t = t at h2
      change -k = k at h3
      exact ⟨by omega, by omega, by omega⟩
    · intro ⟨h1, h2, h3⟩
      subst h1; subst h2; subst h3
      rfl

/-- The full fixed set lies inside the visible one. -/
theorem fixed_sub_fixedSM (c : State) (h : conj c = c) : conjSM c = c := by
  obtain ⟨h1, h2, h3, _⟩ := (fixed_iff_neutral c).mp h
  exact (fixedSM_iff_neutralSM c).mpr ⟨h1, h2, h3⟩

/-- A dark-charged state: invisible to the three visible readings, read by a fifth. -/
def darkCharged (m : Nat) : State := ⟨0, 0, 0, 1, m⟩

theorem dark_charge_hidden_from_the_visible (m : Nat) :
    conjSM (darkCharged m) = darkCharged m ∧ conj (darkCharged m) ≠ darkCharged m := by
  refine ⟨rfl, ?_⟩
  intro h
  have h4 : -(1 : Int) = 1 := congrArg State.dark h
  omega

/-- A reading is odd when conjugation flips its sign, even when conjugation keeps it. -/
def OddReading (r : State → Int) : Prop := ∀ c, r (conj c) = -r c
def EvenReading {β : Type} (r : State → β) : Prop := ∀ c, r (conj c) = r c

/-- EVERY ODD READING IS BLIND TO THE FIXED SET. -/
theorem odd_reading_blind (r : State → Int) (hr : OddReading r) (c : State) (hc : conj c = c) :
    r c = 0 := by
  have h := hr c
  rw [hc] at h
  omega

/-- Every integer combination of the four charges is an odd reading. The couplings of the photon, the Z, the
    diagonal gluons and a dark photon to a state are all of this form. -/
theorem charge_linear_readings_odd (a b k d : Int) :
    OddReading (fun c => a * c.y6 + b * c.t3x6 + k * c.colour + d * c.dark) := by
  intro c
  show a * (-c.y6) + b * (-c.t3x6) + k * (-c.colour) + d * (-c.dark) =
    -(a * c.y6 + b * c.t3x6 + k * c.colour + d * c.dark)
  simp only [Int.mul_neg]
  omega

/-- Electric charge times six, Q = T3 + Y. -/
def charge6 (c : State) : Int := c.t3x6 + c.y6

theorem charge_reading_odd : OddReading charge6 := by
  intro c
  show -c.t3x6 + -c.y6 = -(c.t3x6 + c.y6)
  omega

/-- Gravity reads the mass. -/
def readG (c : State) : Nat := c.mass

theorem gravity_reading_even : EvenReading readG := by
  intro c
  rfl

def darkState (m : Nat) : State := ⟨0, 0, 0, 0, m⟩

theorem dark_state_fixed (m : Nat) : conj (darkState m) = darkState m := rfl

/-- ONLY GRAVITY READS THE FIXED SET: every odd reading returns zero on it; the even reading returns the mass. -/
theorem only_gravity_reads_the_fixed_set (r : State → Int) (hr : OddReading r) (m : Nat) :
    r (darkState m) = 0 ∧ readG (darkState m) = m :=
  ⟨odd_reading_blind r hr (darkState m) (dark_state_fixed m), rfl⟩

/-- DARK IS FIXED: a state on which every odd reading returns zero is exactly a state that conjugation fixes.
    "Dark" in the gauge sense and "on the fixed set" are one property. -/
theorem dark_iff_fixed (c : State) : (∀ r : State → Int, OddReading r → r c = 0) ↔ conj c = c := by
  constructor
  · intro h
    have h1 := h (fun x => x.y6) (fun _ => rfl)
    have h2 := h (fun x => x.t3x6) (fun _ => rfl)
    have h3 := h (fun x => x.colour) (fun _ => rfl)
    have h4 := h (fun x => x.dark) (fun _ => rfl)
    exact (fixed_iff_neutral c).mpr ⟨h1, h2, h3, h4⟩
  · intro hc r hr
    exact odd_reading_blind r hr c hc

/-! ## Part V. The seat is not electric neutrality; a charge-free state cannot radiate. -/

/-- A neutrino-like state: T3 = +1/2 and Y = -1/2, so electric charge zero. The scalar partner of the neutrino
    carries exactly these charges. -/
def sneutrinoLike (m : Nat) : State := ⟨-3, 3, 0, 0, m⟩

theorem electric_neutrality_is_not_the_seat (m : Nat) :
    charge6 (sneutrinoLike m) = 0 ∧ conj (sneutrinoLike m) ≠ sneutrinoLike m := by
  refine ⟨?_, ?_⟩
  · show (3 : Int) + -3 = 0
    decide
  · intro h
    have h1 : -(-3 : Int) = -3 := congrArg State.y6 h
    omega

theorem sq_nonneg (x : Int) : 0 ≤ x * x := by
  cases Int.le_total 0 x with
  | inl h => exact Int.mul_nonneg h h
  | inr h =>
    have hn : 0 ≤ -x := by omega
    have := Int.mul_nonneg hn hn
    rw [Int.neg_mul_neg] at this
    exact this

theorem sq_eq_zero {x : Int} (h : x * x = 0) : x = 0 := by
  cases Int.mul_eq_zero.mp h with
  | inl h => exact h
  | inr h => exact h

/-- The radiative weight: the sum of the squared charges, the strength with which a state emits gauge quanta. -/
def radiative (c : State) : Int :=
  c.y6 * c.y6 + c.t3x6 * c.t3x6 + c.colour * c.colour + c.dark * c.dark

def radiativeSM (c : State) : Int := c.y6 * c.y6 + c.t3x6 * c.t3x6 + c.colour * c.colour

theorem radiative_zero_iff_neutral (c : State) : radiative c = 0 ↔ neutral c := by
  cases c with
  | mk y t k d m =>
    show y * y + t * t + k * k + d * d = 0 ↔ (y = 0 ∧ t = 0 ∧ k = 0 ∧ d = 0)
    have h1 := sq_nonneg y
    have h2 := sq_nonneg t
    have h3 := sq_nonneg k
    have h4 := sq_nonneg d
    constructor
    · intro h
      exact ⟨sq_eq_zero (by omega), sq_eq_zero (by omega), sq_eq_zero (by omega), sq_eq_zero (by omega)⟩
    · intro ⟨e1, e2, e3, e4⟩
      subst e1; subst e2; subst e3; subst e4
      decide

/-- NO CHARGE, NO RADIATION: the radiative weight vanishes exactly on the fixed set. A state that cannot emit
    cannot cool, and a population that cannot cool cannot settle into a thin disk. -/
theorem no_charge_no_radiation (c : State) : radiative c = 0 ↔ conj c = c :=
  (radiative_zero_iff_neutral c).trans (fixed_iff_neutral c).symm

/-- A dark-charged state emits no visible quanta and does emit dark ones. -/
theorem dark_charged_radiates_only_dark (m : Nat) :
    radiativeSM (darkCharged m) = 0 ∧ radiative (darkCharged m) = 1 := by
  refine ⟨?_, ?_⟩
  · show (0 : Int) * 0 + 0 * 0 + 0 * 0 = 0
    decide
  · show (0 : Int) * 0 + 0 * 0 + 0 * 0 + 1 * 1 = 1
    decide

/-- A multiplet is dark when every member sits on the fixed set. -/
def darkMultiplet (l : List State) : Bool := l.all (fun c => decide (conj c = c))

/-- An isospin triplet with Y = 0: T3 = +1, 0, -1, times six. Its middle member is neutral. -/
def tripletLike : List State := [⟨0, 6, 0, 0, 1⟩, ⟨0, 0, 0, 0, 1⟩, ⟨0, -6, 0, 0, 1⟩]
def singletLike : List State := [⟨0, 0, 0, 0, 1⟩]

theorem a_neutral_member_is_not_a_dark_multiplet :
    tripletLike.any (fun c => decide (conj c = c)) = true ∧ darkMultiplet tripletLike = false ∧
    darkMultiplet singletLike = true := by decide

/-! ## Part VI. Gravity does not read identity. -/

/-- A species: a label only a non-gravitational instrument reads, and the mass density gravity reads. -/
structure Species where
  label : Nat
  density : Nat
  deriving DecidableEq, Repr

def gravRecord (s : Species) : Nat := s.density

/-- NO GRAVITATIONAL READING RETURNS THE IDENTITY: two species with one density are one gravitational record. -/
theorem identity_unread (s t : Species) (hd : s.density = t.density) (hl : s.label ≠ t.label)
    (g : Nat → Nat) : ¬ (g (gravRecord s) = s.label ∧ g (gravRecord t) = t.label) := by
  intro ⟨h1, h2⟩
  unfold gravRecord at h1 h2
  rw [hd] at h1
  exact hl (h1.symm.trans h2)

/-- The instance: a heavy particle and a light wave-like field, one halo, one density. -/
def heavyHalo : Species := ⟨1, 3⟩
def lightHalo : Species := ⟨2, 3⟩

theorem two_species_one_record (g : Nat → Nat) :
    ¬ (g (gravRecord heavyHalo) = heavyHalo.label ∧ g (gravRecord lightHalo) = lightHalo.label) :=
  identity_unread heavyHalo lightHalo rfl (by decide) g

/-! ## Part VII. The neutrino fog: one energy record, two sources. -/

/-- A nuclear recoil: its energy, and whether it points back to the Sun or to the halo wind. -/
structure Recoil where
  energy : Nat
  solar : Bool
  deriving DecidableEq, Repr

/-- The direction flip exchanges the two sources and keeps the energy. -/
def flipDir (r : Recoil) : Recoil := ⟨r.energy, !r.solar⟩
def energyRecord (r : Recoil) : Nat := r.energy

theorem energy_record_even (r : Recoil) : energyRecord (flipDir r) = energyRecord r := rfl
theorem source_odd (r : Recoil) : (flipDir r).solar = !r.solar := rfl

/-- THE FOG: at one energy, a solar recoil and a halo recoil leave one energy record, and no reading of that
    record returns the source. -/
theorem fog_one_record (g : Nat → Bool) (e : Nat) :
    ¬ (g (energyRecord ⟨e, true⟩) = true ∧ g (energyRecord ⟨e, false⟩) = false) := by
  intro ⟨h1, h2⟩
  have e1 : g e = true := h1
  have e2 : g e = false := h2
  exact absurd (e1.symm.trans e2) (by decide)

/-- The direction reading separates them. -/
theorem direction_separates (e : Nat) : (⟨e, true⟩ : Recoil).solar ≠ (⟨e, false⟩ : Recoil).solar := by
  intro h
  have h' : true = false := h
  exact absurd h' (by decide)

/-! ## Part VIII. The fifth reading. -/

/-- A left-handed Weyl field: multiplicity, hypercharge times six, colour and isospin flags, a dark charge, and the
    colour representation sign c3: +1 for a triplet, -1 for an antitriplet, 0 for a colour singlet. -/
structure Weyl where
  name : String
  mult : Int
  y6 : Int
  triplet : Bool
  doublet : Bool
  qD : Int
  c3 : Int
  deriving Repr

/-- One Standard Model generation, no dark charge. -/
def sm : List Weyl :=
  [⟨"Q", 6, 1, true, true, 0, 1⟩, ⟨"u^c", 3, -4, true, false, 0, -1⟩, ⟨"d^c", 3, 2, true, false, 0, -1⟩,
   ⟨"L", 2, -3, false, true, 0, 0⟩, ⟨"e^c", 1, 6, false, false, 0, 0⟩]

def total (f : Weyl → Int) (xs : List Weyl) : Int := xs.foldl (fun a w => a + f w) 0

/-- Anomaly freedom of one generation with a dark U(1): six visible conditions and six dark ones (cubic,
    gravitational, mixed with hypercharge twice, with colour and with isospin). Each check is the anomaly coefficient up
    to a positive normalization, Dynkin index 1/2 for every fundamental; the colour cube is the representation sum with
    A(3) = +1 and A(3bar) = -1. No check reads a field's name. -/
def closes (w : List Weyl) : Bool :=
  total (fun x => x.mult * x.y6) w == 0 &&
  total (fun x => x.mult * x.y6 ^ 3) w == 0 &&
  total (fun x => (x.mult / 3) * x.y6) (w.filter (·.triplet)) == 0 &&
  total (fun x => (x.mult / 2) * x.y6) (w.filter (·.doublet)) == 0 &&
  total (fun x => x.mult / 2) (w.filter (·.doublet)) % 2 == 0 &&
  total (fun x => (x.mult / 3) * x.c3) (w.filter (·.triplet)) == 0 &&
  total (fun x => x.mult * x.qD) w == 0 &&
  total (fun x => x.mult * (x.qD * x.qD * x.qD)) w == 0 &&
  total (fun x => x.mult * (x.qD * x.qD) * x.y6) w == 0 &&
  total (fun x => x.mult * x.qD * (x.y6 * x.y6)) w == 0 &&
  total (fun x => (x.mult / 3) * x.qD) (w.filter (·.triplet)) == 0 &&
  total (fun x => (x.mult / 2) * x.qD) (w.filter (·.doublet)) == 0

/-- A dark Weyl field: a Standard Model singlet with dark charge q. -/
def chi (q : Int) : Weyl := ⟨"chi", 1, 0, false, false, q, 0⟩

/-- A vector-like dark pair without dark charge, and the same pair charged +1 and -1. -/
def worldD0 : List Weyl := sm ++ [chi 0, chi 0]
def worldD : List Weyl := sm ++ [chi 1, chi (-1)]
/-- One chiral dark fermion of charge +1: anomalous. -/
def worldBad : List Weyl := sm ++ [chi 1]

/-- The fifth reading: some field carries a dark charge. -/
def fifth (w : List Weyl) : Bool := w.any (fun x => x.qD != 0)

/-- The template record: everything the visible closure reads, the dark charge struck out. -/
def record (w : List Weyl) : List (String × Int × Int × Bool × Bool × Int) :=
  w.map (fun x => (x.name, x.mult, x.y6, x.triplet, x.doublet, x.c3))

theorem visible_generation_closes : closes sm = true := by decide
theorem closure_admits_both : closes worldD0 = true ∧ closes worldD = true := by decide
theorem closure_is_not_vacuous : closes worldBad = false := by decide
theorem one_record_two_worlds : record worldD0 = record worldD := by decide
theorem fifth_differs : fifth worldD0 = false ∧ fifth worldD = true := by decide

/-- NO TEMPLATE READING DECIDES THE FIFTH: no function of the template record returns whether a dark charge
    exists. -/
theorem no_template_reading_decides_fifth :
    ¬ ∃ g : List (String × Int × Int × Bool × Bool × Int) → Bool, ∀ w, g (record w) = fifth w := by
  intro ⟨g, hg⟩
  have h1 := hg worldD0
  have h2 := hg worldD
  rw [one_record_two_worlds] at h1
  exact absurd (h1.symm.trans h2) (by decide)

/-- THE FIFTH IS KEYED: an anomaly-free world carries it and an anomaly-free world lacks it. -/
theorem fifth_is_keyed :
    (∃ w, closes w = true ∧ fifth w = true) ∧ (∃ w, closes w = true ∧ fifth w = false) :=
  ⟨⟨worldD, by decide⟩, ⟨worldD0, by decide⟩⟩

/-! ## Part IX. The dark force in the acceleration sense. -/

/-- The active gravitational density of a perfect fluid, rho + 3p. -/
def active (ρ p : Int) : Int := ρ + 3 * p

theorem dust_attracts (ρ : Int) (h : 0 < ρ) : 0 < active ρ 0 := by
  unfold active
  omega

theorem radiation_attracts (k : Int) (h : 0 < k) : 0 < active (3 * k) k := by
  unfold active
  omega

/-- VACUUM REPELS: pressure equal to minus the density gives active density -2 rho. -/
theorem vacuum_repels (ρ : Int) (h : 0 < ρ) : active ρ (-ρ) = -2 * ρ ∧ active ρ (-ρ) < 0 := by
  unfold active
  constructor <;> omega

theorem repulsion_needs_tension (ρ p : Int) (h : active ρ p < 0) : 3 * p < -ρ := by
  unfold active at h
  omega

/-- THE KINETIC FLOOR: a canonical field has rho = K + V and p = K - V with K ≥ 0, so rho + p = 2K ≥ 0 and the
    phantom divide w = -1 is never crossed from above. -/
theorem floor_forbids_phantom (K V : Int) (hK : 0 ≤ K) : 0 ≤ (K + V) + (K - V) := by
  omega

/-- w = -1 exactly when the kinetic term vanishes: the frozen field. -/
theorem vacuum_iff_frozen (K V : Int) : (K + V) + (K - V) = 0 ↔ K = 0 :=
  ⟨fun _ => by omega, fun _ => by omega⟩

theorem phantom_needs_ghost (K V : Int) (h : (K + V) + (K - V) < 0) : K < 0 := by
  omega

/-- Twice the deceleration parameter of a flat matter plus vacuum budget, in units of 1e-4. -/
def twoQ0 (om ol : Int) : Int := om - 2 * ol

/-- THE SIGN IS READ, NOT DERIVED: two flat budgets, one decelerating and one accelerating; the measured
    Planck 2018 budget is the second. -/
theorem flat_budgets_admit_both_signs :
    (10000 + 0 = (10000 : Int) ∧ 0 < twoQ0 10000 0) ∧
    (3153 + 6847 = (10000 : Int) ∧ twoQ0 3153 6847 < 0) := by decide

/-! ## Part X. The dark ledger, computed. -/

inductive Status
  | crossed
  | pending
  | dot
  deriving DecidableEq, Repr

def status (seatAbsent formalMass worldCarrier : Bool) : Status :=
  if seatAbsent then .dot else if formalMass || worldCarrier then .crossed else .pending

inductive Owed
  | nothing
  | oneCarrier
  | oneOffering
  deriving DecidableEq, Repr

def owedOf (st : Status) (tailEmpty : Bool) : Owed :=
  match st with
  | .pending => if tailEmpty then .oneOffering else .oneCarrier
  | _ => .nothing

structure Entry where
  name : String
  seatAbsent : Bool
  formalMass : Bool
  worldCarrier : Bool
  tailEmpty : Bool
  printed : Status
  owed : Owed

def darkLedger : List Entry :=
  [⟨"DM exists, read by gravity", false, false, true, false, .crossed, .nothing⟩,
   ⟨"DM identity and charges", false, false, false, false, .pending, .oneCarrier⟩,
   ⟨"a fifth odd reading, the dark gauge force", false, false, false, false, .pending, .oneCarrier⟩,
   ⟨"DE: sign of the acceleration", false, false, true, false, .crossed, .nothing⟩,
   ⟨"DE: w = -1 exactly, the frozen field", false, false, false, false, .pending, .oneCarrier⟩,
   ⟨"DE: magnitude of rho_Lambda, derived", false, false, false, true, .pending, .oneOffering⟩]

/-- Every printed status and every printed debt is the computed one. -/
theorem dark_ledger_is_computed :
    darkLedger.all (fun e => status e.seatAbsent e.formalMass e.worldCarrier == e.printed &&
      owedOf e.printed e.tailEmpty == e.owed) = true := by decide

theorem dark_ledger_counts :
    darkLedger.length = 6 ∧
    (darkLedger.filter (fun e => e.printed == .crossed)).length = 2 ∧
    (darkLedger.filter (fun e => e.printed == .pending)).length = 4 ∧
    (darkLedger.filter (fun e => e.printed == .dot)).length = 0 ∧
    (darkLedger.filter (fun e => e.owed == .oneCarrier)).length = 3 ∧
    (darkLedger.filter (fun e => e.owed == .oneOffering)).length = 1 := by decide

/-! ## Audit additions, cycle darkforge, round 1 -/

/-- A C-fixed state is its mass: all four charges vanish. -/
theorem fixed_state_is_its_mass (c : State) (h : conj c = c) : c = darkState c.mass := by
  obtain ⟨y, t, k, d, m⟩ := c
  have hn : y = 0 ∧ t = 0 ∧ k = 0 ∧ d = 0 := (fixed_iff_neutral _).mp h
  obtain ⟨rfl, rfl, rfl, rfl⟩ := hn
  rfl

/-- Every reading, of either parity and any value type, returns on a C-fixed state a function of its mass alone. -/
theorem every_template_reading_of_the_fixed_set_reads_only_mass {β : Type} (r : State → β) (c : State)
    (h : conj c = c) : r c = r (darkState c.mass) :=
  congrArg r (fixed_state_is_its_mass c h)

/-- The Z reading in sixths, scaled by b: b T₃ minus a Q, the mixing weight being the rational a / b. -/
def zReading (a b : Int) (c : State) : Int := b * c.t3x6 - a * charge6 c

theorem z_reading_odd (a b : Int) : OddReading (zReading a b) := by
  intro c
  show b * -c.t3x6 - a * (-c.t3x6 + -c.y6) = -(b * c.t3x6 - a * (c.t3x6 + c.y6))
  rw [Int.mul_add, Int.mul_add, Int.mul_neg, Int.mul_neg, Int.mul_neg]
  omega

/-- At zero electric charge the Z reading is b T₃, nonzero for every rational weight a / b. -/
theorem z_reading_survives_neutrality (a b : Int) (m : Nat) (hb : b ≠ 0) :
    charge6 (sneutrinoLike m) = 0 ∧ zReading a b (sneutrinoLike m) = 3 * b ∧ 3 * b ≠ 0 := by
  refine ⟨(by decide : (3 : Int) + -3 = 0), ?_, ?_⟩
  · show b * 3 - a * (3 + -3) = 3 * b
    omega
  · omega

theorem the_triplet_has_one_fixed_member :
    (tripletLike.filter (fun c => decide (conj c = c))).length = 1 := by decide

/-- At positive density the floor is the bound w ≥ −1, for every rational w = a/b with b > 0 and p = w ρ. -/
theorem floor_bounds_w (K V a b : Int) (hK : 0 ≤ K) (hρ : 0 < K + V) (hb : 0 < b)
    (hw : b * (K - V) = a * (K + V)) : -b ≤ a := by
  have h2 : 0 ≤ b * ((K + V) + (K - V)) := Int.mul_nonneg (Int.le_of_lt hb) (by omega)
  have h3 : b * (K - V) + b * (K + V) = b * ((K + V) + (K - V)) := by
    rw [← Int.mul_add, Int.add_comm (K - V) (K + V)]
  have h1 : (-b) * (K + V) ≤ a * (K + V) := by rw [Int.neg_mul, ← hw]; omega
  exact Int.le_of_mul_le_mul_right h1 hρ

/-- At negative density the floor does not bound w: K = 1 and V = −3 give ρ = −2, p = 4, w = −2. -/
theorem floor_needs_positive_density :
    ∃ K V a b : Int, 0 ≤ K ∧ K + V < 0 ∧ 0 < b ∧ b * (K - V) = a * (K + V) ∧ a < -b :=
  ⟨1, -3, -2, 1, by decide, by decide, by decide, by decide, by decide⟩

/-- ρ + p summed over any list of fields (K, V). -/
def rhoPlusP : List (Int × Int) → Int
  | [] => 0
  | (k, v) :: t => (k + v) + (k - v) + rhoPlusP t

/-- The floor is additive: any number of fields with K ≥ 0 keeps ρ + p ≥ 0. -/
theorem floor_is_additive (l : List (Int × Int)) (h : ∀ x ∈ l, 0 ≤ x.1) : 0 ≤ rhoPlusP l := by
  induction l with
  | nil => exact Int.le_refl 0
  | cons x t ih =>
    obtain ⟨k, v⟩ := x
    have hx : 0 ≤ k := h (k, v) (List.Mem.head t)
    have ht : 0 ≤ rhoPlusP t := ih (fun y hy => h y (List.Mem.tail (k, v) hy))
    show 0 ≤ (k + v) + (k - v) + rhoPlusP t
    omega

/-- The step from ρ + p ≥ 0 to w ≥ −1, for any totals, at positive density, for every rational w = a/b, b > 0. -/
theorem w_floor_from_rho_plus_p (ρ p a b : Int) (h : 0 ≤ ρ + p) (hρ : 0 < ρ) (hb : 0 < b)
    (hw : b * p = a * ρ) : -b ≤ a := by
  have h2 : 0 ≤ b * (ρ + p) := Int.mul_nonneg (Int.le_of_lt hb) h
  have h3 : b * p + b * ρ = b * (ρ + p) := by rw [← Int.mul_add, Int.add_comm p ρ]
  have h1 : (-b) * ρ ≤ a * ρ := by rw [Int.neg_mul, ← hw]; omega
  exact Int.le_of_mul_le_mul_right h1 hρ

def rhoTot : List (Int × Int) → Int
  | [] => 0
  | (k, v) :: t => (k + v) + rhoTot t

def pTot : List (Int × Int) → Int
  | [] => 0
  | (k, v) :: t => (k - v) + pTot t

theorem rhoPlusP_split (l : List (Int × Int)) : rhoPlusP l = rhoTot l + pTot l := by
  induction l with
  | nil => rfl
  | cons x t ih =>
    obtain ⟨k, v⟩ := x
    show (k + v) + (k - v) + rhoPlusP t = ((k + v) + rhoTot t) + ((k - v) + pTot t)
    omega

/-- Any number of fields with K ≥ 0 at positive total density keeps w ≥ −1, for every rational w = a/b, b > 0. -/
theorem fields_bound_w (l : List (Int × Int)) (a b : Int) (h : ∀ x ∈ l, 0 ≤ x.1)
    (hρ : 0 < rhoTot l) (hb : 0 < b) (hw : b * pTot l = a * rhoTot l) : -b ≤ a := by
  have h0 : 0 ≤ rhoTot l + pTot l := by
    have := floor_is_additive l h
    rw [rhoPlusP_split] at this
    exact this
  exact w_floor_from_rho_plus_p (rhoTot l) (pTot l) a b h0 hρ hb hw

/-! ## Part XI. Fortification: the measured nulls force the fixed set, the portals are derived, the fifth is free. -/

/-- The electric reading Q = T3 + Y, times six. -/
def q6of (c : State) : Int := c.t3x6 + c.y6

/-- THE PHOTON AND THE Z FORCE THE ELECTROWEAK CHARGES TO ZERO. At any mixing weight sin²θ_W = a/b with b ≠ 0, a state
    with Q = 0 and Z reading b·T3 − a·Q = 0 has T3 = 0 and Y = 0. -/
theorem photon_and_z_force_electroweak_zero (c : State) (a b : Int) (hb : b ≠ 0)
    (hq : q6of c = 0) (hz : b * c.t3x6 - a * q6of c = 0) : c.t3x6 = 0 ∧ c.y6 = 0 := by
  rw [hq, Int.mul_zero, Int.sub_zero] at hz
  have ht : c.t3x6 = 0 := by
    rcases Int.mul_eq_zero.mp hz with h | h
    · exact absurd h hb
    · exact h
  refine ⟨ht, ?_⟩
  unfold q6of at hq
  omega

/-- THE VISIBLE NULLS FORCE THE VISIBLE FIXED SET: a colourless state the photon and the Z both miss is fixed by the
    Standard Model's conjugation. Nothing here reads the dark charge. -/
theorem visible_nulls_force_the_visible_fixed_set (c : State) (a b : Int) (hb : b ≠ 0) (hq : q6of c = 0)
    (hz : b * c.t3x6 - a * q6of c = 0) (hk : c.colour = 0) : conjSM c = c := by
  obtain ⟨ht, hy⟩ := photon_and_z_force_electroweak_zero c a b hb hq hz
  exact (fixedSM_iff_neutralSM c).mpr ⟨hy, ht, hk⟩

/-- QUANTIZATION TURNS A BOUND INTO A ZERO: an integer charge bounded strictly inside one quantum is zero. -/
theorem below_one_quantum_is_zero (n : Int) (h1 : -1 < n) (h2 : n < 1) : n = 0 := by omega

/-- THE MEASURED BOUNDS FORCE THE VISIBLE FIXED SET: with charges quantized in sixths, a colourless state whose
    electric and Z readings are each bounded strictly inside one quantum is fixed by the Standard Model's conjugation. -/
theorem sub_quantum_bounds_force_the_visible_fixed_set (c : State) (a b : Int) (hb : 0 < b)
    (hq1 : -1 < q6of c) (hq2 : q6of c < 1)
    (hz1 : -b < b * c.t3x6 - a * q6of c) (hz2 : b * c.t3x6 - a * q6of c < b)
    (hk : c.colour = 0) : conjSM c = c := by
  have hq : q6of c = 0 := below_one_quantum_is_zero _ hq1 hq2
  rw [hq, Int.mul_zero, Int.sub_zero] at hz1 hz2
  have ht : c.t3x6 = 0 := by
    rcases Int.lt_trichotomy c.t3x6 0 with h | h | h
    · have : b * c.t3x6 ≤ b * (-1) := Int.mul_le_mul_of_nonneg_left (by omega) (Int.le_of_lt hb)
      omega
    · exact h
    · have : b * 1 ≤ b * c.t3x6 := Int.mul_le_mul_of_nonneg_left (by omega) (Int.le_of_lt hb)
      omega
  exact visible_nulls_force_the_visible_fixed_set c a b (by omega) hq (by rw [hq, ht]; simp) hk

/-- A field of the portal census: the five Standard Model left-handed Weyl fermions, the Higgs doublet, a real singlet
    scalar S and a singlet Weyl fermion N. -/
inductive Fld | Q | uc | dc | L | ec | H | S | N
  deriving DecidableEq, Repr

def Fld.y6 : Fld → Int
  | .Q => 1 | .uc => -4 | .dc => 2 | .L => -3 | .ec => 6 | .H => 3 | .S => 0 | .N => 0
def Fld.tri : Fld → Int
  | .Q => 1 | .uc => -1 | .dc => -1 | _ => 0
def Fld.doublet : Fld → Bool
  | .Q => true | .L => true | .H => true | _ => false
def Fld.darkF : Fld → Bool
  | .S => true | .N => true | _ => false

/-- A leg of a monomial: a field and whether it enters conjugated. -/
abbrev Leg := Fld × Bool
def legY (l : Leg) : Int := if l.2 then -l.1.y6 else l.1.y6
def legTri (l : Leg) : Int := if l.2 then -l.1.tri else l.1.tri
def sumI : List Int → Int
  | [] => 0
  | x :: t => x + sumI t

/-- Gauge invariance of a monomial: hypercharge sums to zero, colour triality to zero mod 3, and the doublets pair. -/
def invariantM (m : List Leg) : Bool :=
  sumI (m.map legY) == 0 && sumI (m.map legTri) % 3 == 0 && (m.filter (fun l => l.1.doublet)).length % 2 == 0

/-- A portal: an invariant monomial with a dark leg and a Standard Model leg. -/
def portalM (m : List Leg) : Bool :=
  invariantM m && m.any (fun l => l.1.darkF) && m.any (fun l => !l.1.darkF)

def scal : List Leg := [(.H, false), (.H, true), (.S, false)]
def fer : List Fld := [.Q, .uc, .dc, .L, .ec, .N]

/-- Every renormalizable Lorentz-scalar monomial without derivatives: two to four scalars, or two Weyl fermions of
    one chirality with at most one scalar. 6 + 10 + 15 + 168 = 199 monomials. -/
def census : List (List Leg) :=
  (List.range 3).flatMap (fun i => (List.range 3).flatMap (fun j =>
    if i ≤ j then [[scal.getD i (.S, false), scal.getD j (.S, false)]] else [])) ++
  (List.range 3).flatMap (fun i => (List.range 3).flatMap (fun j => (List.range 3).flatMap (fun k =>
    if i ≤ j ∧ j ≤ k then [[scal.getD i (.S, false), scal.getD j (.S, false), scal.getD k (.S, false)]]
    else []))) ++
  (List.range 3).flatMap (fun i => (List.range 3).flatMap (fun j => (List.range 3).flatMap (fun k =>
    (List.range 3).flatMap (fun l => if i ≤ j ∧ j ≤ k ∧ k ≤ l then
      [[scal.getD i (.S, false), scal.getD j (.S, false), scal.getD k (.S, false), scal.getD l (.S, false)]]
      else [])))) ++
  (List.range 6).flatMap (fun i => (List.range 6).flatMap (fun j => [false, true].flatMap (fun cj =>
    if i ≤ j then ([[], [(.H, false)], [(.H, true)], [(.S, false)]] : List (List Leg)).map
      (fun o => [(fer.getD i .N, cj), (fer.getD j .N, cj)] ++ o) else [])))

set_option maxRecDepth 200000 in
/-- THE PORTALS ARE DERIVED: of the 199 renormalizable monomials of the Standard Model with a singlet scalar and a
    singlet fermion, exactly four couple the two sectors: S H†H, S² H†H, and L N H with its conjugate. -/
theorem portals_are_derived :
    census.length = 199 ∧ (census.filter portalM).length = 4 ∧
    [(Fld.H, false), (Fld.H, true), (Fld.S, false)] ∈ census.filter portalM ∧
    [(Fld.H, false), (Fld.H, true), (Fld.S, false), (Fld.S, false)] ∈ census.filter portalM ∧
    [(Fld.L, false), (Fld.N, false), (Fld.H, false)] ∈ census.filter portalM ∧
    [(Fld.L, true), (Fld.N, true), (Fld.H, true)] ∈ census.filter portalM := by decide

/-- THE FIFTH IS FREE: a vector-like pair of Standard Model singlets closes all twelve conditions whatever its dark
    charge q, so every integer is allowed and the visible record fixes none. -/
theorem fifth_is_free (q : Int) : closes (sm ++ [chi q, chi (-q)]) = true := by
  simp [closes, total, sm, chi, Int.neg_mul, Int.mul_neg, Int.add_right_neg]


/-- THE TITLE'S TWO HALVES: C fixes a state exactly when the Standard Model's conjugation fixes it and its dark charge
    is zero. The first half is where measurement places dark matter; the second is the one keyed bit. -/
theorem fixed_iff_visible_fixed_and_no_dark_charge (c : State) : conj c = c ↔ (conjSM c = c ∧ c.dark = 0) := by
  rw [fixed_iff_neutral, fixedSM_iff_neutralSM]
  unfold neutral neutralSM
  constructor
  · intro ⟨h1, h2, h3, h4⟩; exact ⟨⟨h1, h2, h3⟩, h4⟩
  · intro ⟨⟨h1, h2, h3⟩, h4⟩; exact ⟨h1, h2, h3, h4⟩

/-- The electric charge of each component of a field, times six: both isospin components of a doublet. -/
def Fld.q6s : Fld → List Int
  | .Q => [4, -2] | .uc => [-4] | .dc => [2] | .L => [0, -6] | .ec => [6] | .H => [6, 0] | .S => [0] | .N => [0]

/-- EVERY COLOURED STANDARD MODEL FIELD IS CHARGED in every component. -/
theorem coloured_fields_are_charged : ∀ f : Fld, f.darkF = false → f.tri ≠ 0 → f.q6s.all (· != 0) = true := by
  intro f; cases f <;> decide

/-- A list of legs none of which is coloured has triality sum zero. -/
theorem sumI_tri_zero_of_none (rest : List Leg) (h : rest.any (fun l => l.1.tri != 0) = false) :
    sumI (rest.map legTri) = 0 := by
  induction rest with
  | nil => rfl
  | cons x t ih =>
    have hx : (x.1.tri != 0) = false := by
      cases hx' : (x.1.tri != 0) with
      | false => rfl
      | true => simp [List.any_cons, hx'] at h
    have ht : t.any (fun l => l.1.tri != 0) = false := by
      cases ht' : t.any (fun l => l.1.tri != 0) with
      | false => rfl
      | true => simp [List.any_cons, ht'] at h
    have hx0 : x.1.tri = 0 := by simpa using hx
    show legTri x + sumI (t.map legTri) = 0
    rw [ih ht]; unfold legTri; split <;> simp [hx0]

/-- A COLOURED RELIC BRINGS CHARGED PARTNERS: a colour-singlet composite of one new colour triplet with Standard Model
    legs contains a coloured Standard Model leg, and so an electrically charged constituent. -/
theorem a_coloured_relic_brings_charged_partners (rest : List Leg) (hsm : ∀ l ∈ rest, l.1.darkF = false)
    (hsing : (1 + sumI (rest.map legTri)) % 3 = 0) :
    ∃ l ∈ rest, l.1.tri ≠ 0 ∧ l.1.q6s.all (· != 0) = true := by
  cases hb : rest.any (fun l => l.1.tri != 0) with
  | false =>
    have h0 := sumI_tri_zero_of_none rest hb
    rw [h0] at hsing
    exact absurd hsing (by decide)
  | true =>
    obtain ⟨l, hl, hne⟩ := List.any_eq_true.mp hb
    have ht : l.1.tri ≠ 0 := by simpa using hne
    exact ⟨l, hl, ht, coloured_fields_are_charged l.1 (hsm l hl) ht⟩

/-- The number of legs of one field in a monomial. -/
def darkCount (f : Fld) (m : List Leg) : Nat := (m.filter (fun l => l.1 == f)).length
/-- Even under the dark parity that keeps the dark matter stable: an even number of S legs and of N legs. -/
def evenDark (m : List Leg) : Bool := darkCount .S m % 2 == 0 && darkCount .N m % 2 == 0

set_option maxRecDepth 200000 in
/-- A STABLE SINGLET KEEPS ONE DOOR: under the parity that keeps the dark matter stable exactly one portal survives,
    S² H†H, and none survives for the fermion. -/
theorem a_stable_singlet_keeps_one_door :
    (census.filter (fun m => portalM m && evenDark m)).length = 1 ∧
    [(Fld.H, false), (Fld.H, true), (Fld.S, false), (Fld.S, false)] ∈ census.filter (fun m => portalM m && evenDark m) ∧
    (census.filter (fun m => portalM m && evenDark m && (darkCount .N m != 0))).length = 0 := by decide


/-- A nonzero integer squares to at least one. -/
theorem one_le_sq_of_ne (q : Int) (h : q ≠ 0) : 1 ≤ q * q := by
  rcases Int.lt_trichotomy q 0 with hq | hq | hq
  · have h1 : q * q = (-q) * (-q) := (Int.neg_mul_neg q q).symm
    have h2 : (-q) * 1 ≤ (-q) * (-q) := Int.mul_le_mul_of_nonneg_left (by omega) (by omega)
    omega
  · exact absurd hq h
  · have h2 : q * 1 ≤ q * q := Int.mul_le_mul_of_nonneg_left (by omega) (by omega)
    omega

/-- Every integer squares to at least zero. -/
theorem zero_le_sq (q : Int) : 0 ≤ q * q := by
  rcases Int.lt_trichotomy q 0 with hq | hq | hq
  · have := one_le_sq_of_ne q (by omega); omega
  · subst hq; decide
  · have := one_le_sq_of_ne q (by omega); omega

/-- A BOUND FIXES A CHARGE THROUGH A MEASURED COUPLING: with the coupling fixed at g > 0, a force g q² below one
    quantum's force g is the zero charge. This is the photon's case. -/
theorem measured_coupling_bound_forces_zero (g q : Int) (hg : 0 < g) (h : g * (q * q) < g) : q = 0 := by
  rcases Int.lt_trichotomy q 0 with hq | hq | hq
  · have h2 : g * 1 ≤ g * (q * q) := Int.mul_le_mul_of_nonneg_left (one_le_sq_of_ne q (by omega)) (by omega)
    omega
  · exact hq
  · have h2 : g * 1 ≤ g * (q * q) := Int.mul_le_mul_of_nonneg_left (one_le_sq_of_ne q (by omega)) (by omega)
    omega

/-- A BOUND NEVER FIXES A CHARGE THROUGH A FREE COUPLING: for every positive bound and every charge, some positive
    coupling a/b puts the force (a/b) q² below the bound. This is the dark photon's case. -/
theorem free_coupling_bound_never_forces_zero (B q : Int) (hB : 0 < B) :
    ∃ a b : Int, 0 < a ∧ 0 < b ∧ a * (q * q) < B * b := by
  have h0 := zero_le_sq q
  refine ⟨1, q * q + 1, by decide, by omega, ?_⟩
  have h1 : 1 * (q * q + 1) ≤ B * (q * q + 1) := Int.mul_le_mul_of_nonneg_right (by omega) (by omega)
  omega

/-- The measured record of a state at mixing weight a/b: the photon null, the Z null, colour neutral, positive mass. -/
def Admissible (a b : Int) (c : State) : Prop :=
  q6of c = 0 ∧ b * c.t3x6 - a * q6of c = 0 ∧ c.colour = 0 ∧ 0 < c.mass

/-- THE FIRST CLAUSE IS FORCED: every state the measured record admits is fixed by the Standard Model's conjugation. -/
theorem first_clause_is_forced (a b : Int) (hb : b ≠ 0) : ∀ c, Admissible a b c → conjSM c = c :=
  fun c ⟨hq, hz, hk, _⟩ => visible_nulls_force_the_visible_fixed_set c a b hb hq hz hk

/-- THE SECOND CLAUSE IS KEYED: the measured record admits a world without a dark charge and a world with one. -/
theorem second_clause_is_keyed (a b : Int) (m : Nat) (hm : 0 < m) :
    Admissible a b ⟨0, 0, 0, 0, m⟩ ∧ Admissible a b ⟨0, 0, 0, 1, m⟩ := by
  refine ⟨⟨?_, ?_, rfl, hm⟩, ⟨?_, ?_, rfl, hm⟩⟩ <;> simp [q6of]

/-- NO READING OF THE RECORD DECIDES THE BIT: no function of the visible charges and the mass returns whether the dark
    charge vanishes. -/
theorem no_reading_of_the_record_decides_the_bit (g : Int → Int → Int → Nat → Bool) :
    ¬ ∀ c : State, g c.y6 c.t3x6 c.colour c.mass = decide (c.dark = 0) := by
  intro h
  have h1 : g 0 0 0 1 = true := h ⟨0, 0, 0, 0, 1⟩
  have h2 : g 0 0 0 1 = false := h ⟨0, 0, 0, 1, 1⟩
  exact Bool.noConfusion (h1.symm.trans h2)

/-- SELF-CONJUGACY SPENDS THE BIT: a state that is its own conjugate is fixed by the Standard Model's conjugation and
    carries no dark charge. -/
theorem self_conjugacy_spends_the_bit (c : State) (h : conj c = c) : conjSM c = c ∧ c.dark = 0 :=
  (fixed_iff_visible_fixed_and_no_dark_charge c).mp h

/-- THE DARK CLOSURE, EXECUTED: the visible fixed set, the forced half, the division, the keyed bit, the two grades,
    self-conjugacy, the crossing. A row closure; the dark row is not a second seat. -/
theorem dark_closure_executed (a b : Int) (hb : b ≠ 0) :
    ((∀ c : State, conjSM (conjSM c) = c) ∧ (∀ c : State, conjSM c = c ↔ neutralSM c)) ∧
    (∀ c, Admissible a b c → conjSM c = c) ∧
    (∀ c : State, conj c = c ↔ (conjSM c = c ∧ c.dark = 0)) ∧
    (Admissible a b ⟨0, 0, 0, 0, 1⟩ ∧ Admissible a b ⟨0, 0, 0, 1, 1⟩) ∧
    (∀ g : Int → Int → Int → Nat → Bool, ¬ ∀ c : State, g c.y6 c.t3x6 c.colour c.mass = decide (c.dark = 0)) ∧
    (∀ g q : Int, 0 < g → g * (q * q) < g → q = 0) ∧
    (∀ B q : Int, 0 < B → ∃ a' b' : Int, 0 < a' ∧ 0 < b' ∧ a' * (q * q) < B * b') ∧
    (∀ c : State, conj c = c → conjSM c = c ∧ c.dark = 0) ∧
    (∀ (Q : Prop) (c : State), Q → ((Q → c.dark = 0) ↔ c.dark = 0)) :=
  ⟨⟨fun c => by cases c; simp [conjSM], fixedSM_iff_neutralSM⟩, first_clause_is_forced a b hb,
   fixed_iff_visible_fixed_and_no_dark_charge, second_clause_is_keyed a b 1 (by decide),
   no_reading_of_the_record_decides_the_bit, measured_coupling_bound_forces_zero,
   free_coupling_bound_never_forces_zero, self_conjugacy_spends_the_bit,
   fun _ _ hq => ⟨fun f => f hq, fun h _ => h⟩⟩


/-- The abelian charges a self-paired mass term carries: a Majorana mass ψψ, or the mass S² of a real scalar, pairs a
    field with itself, so it carries twice its hypercharge and twice its dark charge. -/
def selfPairCharges (c : State) : Int × Int := (2 * c.y6, 2 * c.dark)
/-- A self-paired mass term is allowed when it carries no abelian charge. -/
def MajoranaAllowed (c : State) : Prop := selfPairCharges c = (0, 0)

/-- A MAJORANA MASS FORBIDS EVERY ABELIAN CHARGE: a self-paired mass term is allowed exactly when the hypercharge and
    the dark charge both vanish. The route is the mass term, not the definition of conjugation. -/
theorem majorana_mass_forbids_abelian_charge (c : State) : MajoranaAllowed c ↔ (c.y6 = 0 ∧ c.dark = 0) := by
  unfold MajoranaAllowed selfPairCharges
  constructor
  · intro h
    have h1 : 2 * c.y6 = 0 := congrArg Prod.fst h
    have h2 : 2 * c.dark = 0 := congrArg Prod.snd h
    exact ⟨by omega, by omega⟩
  · intro ⟨h1, h2⟩
    simp [h1, h2]

/-- THE DARK BIT IS THE MAJORANA BIT: on the visible fixed set, a self-paired mass is allowed exactly when the dark
    charge is zero, and exactly when conjugation fixes the state. -/
theorem the_dark_bit_is_the_majorana_bit (c : State) (h : conjSM c = c) :
    (MajoranaAllowed c ↔ c.dark = 0) ∧ (MajoranaAllowed c ↔ conj c = c) := by
  have hy : c.y6 = 0 := ((fixedSM_iff_neutralSM c).mp h).1
  constructor
  · rw [majorana_mass_forbids_abelian_charge]
    exact ⟨fun h' => h'.2, fun h' => ⟨hy, h'⟩⟩
  · rw [majorana_mass_forbids_abelian_charge, fixed_iff_visible_fixed_and_no_dark_charge]
    exact ⟨fun h' => ⟨h, h'.2⟩, fun h' => ⟨hy, h'.2⟩⟩

/-- A DARK CHARGE MAKES A DIRAC PAIR: a mass term pairing two states is neutral in the dark charge only if their dark
    charges cancel, so a dark-charged state takes its mass with a distinct partner. -/
theorem a_dark_charge_makes_a_dirac_pair (c c' : State) (hpair : c.dark + c'.dark = 0) (hd : c.dark ≠ 0) :
    c'.dark = -c.dark ∧ c' ≠ c := by
  refine ⟨by omega, fun he => hd ?_⟩
  have : c'.dark = c.dark := by rw [he]
  omega



/-! ## Part XII. The dark row on the seat -/

/-- The dark carrier: the dark charge is the offset from the line, the mass the height. -/
def darkSeat (c : State) : Pt := (1 + c.dark, (c.mass : Int))

/-- THE DARK CARRIER IS EQUIVARIANT: charge conjugation is carried onto the fold. -/
theorem dark_carrier_equivariant : Equivariant darkSeat conj fold := by
  intro c
  show ((1 + -c.dark, (c.mass : Int)) : Pt) = (2 - (1 + c.dark), (c.mass : Int))
  rw [pe]; exact ⟨by omega, rfl⟩

/-- The landing is forced: the fixed set of conjugation is carried onto the line by the functor. -/
theorem dark_carrier_lands :
    ∃ C : Carrier { c : State // conj c = c }, ∀ w, C.ι w = darkSeat w.1 :=
  equivariant_carrier_lands darkSeat conj dark_carrier_equivariant

/-- THE DARK BIT IS THE LINE PROPERTY: on the visible fixed set a state lands on the line exactly
    when its dark charge is zero, exactly when conjugation fixes it. -/
theorem the_dark_bit_is_the_line_property (c : State) (h : conjSM c = c) :
    (OnLine (darkSeat c) ↔ c.dark = 0) ∧ (OnLine (darkSeat c) ↔ conj c = c) := by
  have e : OnLine (darkSeat c) ↔ c.dark = 0 := by
    show (1 + c.dark = 1) ↔ c.dark = 0
    exact ⟨fun h1 => by omega, fun h1 => by omega⟩
  refine ⟨e, e.trans ?_⟩
  rw [fixed_iff_visible_fixed_and_no_dark_charge]
  exact ⟨fun hd => ⟨h, hd⟩, fun hh => hh.2⟩

/-- A DARK-CHARGED PAIR IS AN OFF-LINE FOLD PAIR WITH ONE RECORD: a dark-charged state and its
    conjugate land on two distinct points off the line, exchanged by the fold, at one height, and
    the registration keeps the height and forgets the side. -/
theorem a_dark_pair_is_an_off_line_pair (c : State) (hd : c.dark ≠ 0) :
    darkSeat (conj c) = fold (darkSeat c) ∧ darkSeat (conj c) ≠ darkSeat c ∧
    ¬ OnLine (darkSeat c) ∧ reg (darkSeat (conj c)) = reg (darkSeat c) := by
  refine ⟨dark_carrier_equivariant c, fun he => hd ?_, fun hl => hd ?_, ?_⟩
  · have h1 : (darkSeat (conj c)).1 = (darkSeat c).1 := by rw [he]
    have h2 : 1 + -c.dark = 1 + c.dark := h1
    omega
  · have h2 : 1 + c.dark = 1 := hl
    omega
  · rw [dark_carrier_equivariant c]; exact reg_forgets_side (darkSeat c)

/-- DARK MATTER STANDS ON THE LINE TWICE: on the substrate, a neutral stable particle is fixed by both
    involutions and lands on the line under the charge carrier and under the energy carrier. -/
theorem dark_matter_on_the_line_twice (c : Particle) (hN : Neutral c) (hS : IsReal c.energy) :
    (bar c = c ∧ tmirror c = c) ∧ OnLine (chargeSeat c) ∧ OnLine (energySeat c) :=
  ⟨(joint_fixed_iff c).mpr ⟨hN, hS⟩, neutral_charge_on_line c hN.1, (phi_line_iff_real c.energy).mpr hS⟩

/-- GRAVITY READS THE FIXED SET AND NOTHING ELSE: every gravitational reading of a particle and its
    conjugate agrees, and on a conjugation-fixed state every template reading returns a function of
    the mass alone. -/
theorem gravity_is_the_reading_left {β : Type} (g : Energy → β) (c : Particle) (r : State → β) (d : State)
    (h : conj d = d) :
    g (bar c).energy = g c.energy ∧ r d = r (darkState d.mass) :=
  ⟨gravity_reads_no_charge_bit g c, every_template_reading_of_the_fixed_set_reads_only_mass r d h⟩

/-- THE PHANTOM IS A NEGATIVE ACTUATION: an equation of state below −1 needs a negative kinetic
    term, which the actuation floor refuses; at the floor the vacuum is frozen kinetic content. -/
theorem the_phantom_is_negative_actuation (K V : Int) :
    ((K + V) + (K - V) < 0 → K < 0) ∧ (0 ≤ K → 0 ≤ (K + V) + (K - V)) ∧
    ((K + V) + (K - V) = 0 ↔ K = 0) :=
  ⟨phantom_needs_ghost K V, floor_forbids_phantom K V, vacuum_iff_frozen K V⟩

/-! ## Part XIII. The capstone -/

/-- DARK MATTER IS THE FIXED SET, THE DARK FORCE ONE KEYED BIT, AND THE PHANTOM A NEGATIVE ACTUATION.
    Charge conjugation is carried onto the fold and its fixed set onto the line; every odd reading is
    blind there, so gravity is the reading left; the record forces the visible half and keys the dark
    half, which is the line property carried; a dark-charged pair is an off-line fold pair with one
    record; a neutral stable particle stands on the line under both carriers; and the actuation floor
    forbids the phantom. -/
theorem dark_matter_is_the_fixed_set :
    Equivariant darkSeat conj fold ∧
    (∀ c : State, conj c = c ↔ neutral c) ∧
    (∀ (r : State → Int), OddReading r → ∀ c, conj c = c → r c = 0) ∧
    (∀ c : State, conj c = c ↔ (conjSM c = c ∧ c.dark = 0)) ∧
    (∀ c : State, conjSM c = c → (OnLine (darkSeat c) ↔ conj c = c)) ∧
    (∀ c : State, c.dark ≠ 0 → ¬ OnLine (darkSeat c) ∧ reg (darkSeat (conj c)) = reg (darkSeat c)) ∧
    (∀ c : Particle, Neutral c → IsReal c.energy → OnLine (chargeSeat c) ∧ OnLine (energySeat c)) ∧
    (∀ K V : Int, (K + V) + (K - V) < 0 → K < 0) :=
  ⟨dark_carrier_equivariant, fixed_iff_neutral, fun r hr c hc => odd_reading_blind r hr c hc,
   fixed_iff_visible_fixed_and_no_dark_charge,
   fun c h => (the_dark_bit_is_the_line_property c h).2,
   fun c hd => ⟨(a_dark_pair_is_an_off_line_pair c hd).2.2.1, (a_dark_pair_is_an_off_line_pair c hd).2.2.2⟩,
   fun c hN hS => ⟨(dark_matter_on_the_line_twice c hN hS).2.1, (dark_matter_on_the_line_twice c hN hS).2.2⟩,
   phantom_needs_ghost⟩

end SPHYS.Dark

#print axioms SPHYS.Dark.pe
#print axioms SPHYS.Dark.fold_involutive
#print axioms SPHYS.Dark.seat_fixed_line
#print axioms SPHYS.Dark.reg_lands
#print axioms SPHYS.Dark.reg_fixes_iff
#print axioms SPHYS.Dark.reg_forgets_side
#print axioms SPHYS.Dark.least_erasure_iff_value
#print axioms SPHYS.Dark.equivariant_id
#print axioms SPHYS.Dark.equivariant_comp
#print axioms SPHYS.Dark.fix_functorial
#print axioms SPHYS.Dark.fold_global_seat
#print axioms SPHYS.Dark.equivariant_carrier_lands
#print axioms SPHYS.Dark.value_on_image
#print axioms SPHYS.Dark.kinetic_crossing
#print axioms SPHYS.Dark.off_locus_pair
#print axioms SPHYS.Dark.ee
#print axioms SPHYS.Dark.mirror_involutive
#print axioms SPHYS.Dark.psi_phi
#print axioms SPHYS.Dark.phi_psi
#print axioms SPHYS.Dark.phi_injective
#print axioms SPHYS.Dark.phi_equivariant
#print axioms SPHYS.Dark.mirror_fixed_iff_real
#print axioms SPHYS.Dark.phi_line_iff_real
#print axioms SPHYS.Dark.stationary_iff_real
#print axioms SPHYS.Dark.line_is_stationary
#print axioms SPHYS.Dark.measured_on_line
#print axioms SPHYS.Dark.no_measurement_off_line
#print axioms SPHYS.Dark.energy_carrier_lands
#print axioms SPHYS.Dark.bar_involutive
#print axioms SPHYS.Dark.bar_fixed_iff_neutral
#print axioms SPHYS.Dark.odd_charges_even_energy
#print axioms SPHYS.Dark.gravity_reads_no_charge_bit
#print axioms SPHYS.Dark.involutions_commute
#print axioms SPHYS.Dark.tmirror_involutive
#print axioms SPHYS.Dark.joint_fixed_iff
#print axioms SPHYS.Dark.charge_carrier_equivariant
#print axioms SPHYS.Dark.pair_lands_once
#print axioms SPHYS.Dark.tmirror_equivariant
#print axioms SPHYS.Dark.neutral_charge_on_line
#print axioms SPHYS.Dark.pair_on_the_edges
#print axioms SPHYS.Dark.stable_lands
#print axioms SPHYS.Dark.conj_involution
#print axioms SPHYS.Dark.fixed_iff_neutral
#print axioms SPHYS.Dark.fixedSM_iff_neutralSM
#print axioms SPHYS.Dark.fixed_sub_fixedSM
#print axioms SPHYS.Dark.dark_charge_hidden_from_the_visible
#print axioms SPHYS.Dark.odd_reading_blind
#print axioms SPHYS.Dark.charge_linear_readings_odd
#print axioms SPHYS.Dark.charge_reading_odd
#print axioms SPHYS.Dark.gravity_reading_even
#print axioms SPHYS.Dark.dark_state_fixed
#print axioms SPHYS.Dark.only_gravity_reads_the_fixed_set
#print axioms SPHYS.Dark.dark_iff_fixed
#print axioms SPHYS.Dark.electric_neutrality_is_not_the_seat
#print axioms SPHYS.Dark.sq_nonneg
#print axioms SPHYS.Dark.sq_eq_zero
#print axioms SPHYS.Dark.radiative_zero_iff_neutral
#print axioms SPHYS.Dark.no_charge_no_radiation
#print axioms SPHYS.Dark.dark_charged_radiates_only_dark
#print axioms SPHYS.Dark.a_neutral_member_is_not_a_dark_multiplet
#print axioms SPHYS.Dark.identity_unread
#print axioms SPHYS.Dark.two_species_one_record
#print axioms SPHYS.Dark.energy_record_even
#print axioms SPHYS.Dark.source_odd
#print axioms SPHYS.Dark.fog_one_record
#print axioms SPHYS.Dark.direction_separates
#print axioms SPHYS.Dark.visible_generation_closes
#print axioms SPHYS.Dark.closure_admits_both
#print axioms SPHYS.Dark.closure_is_not_vacuous
#print axioms SPHYS.Dark.one_record_two_worlds
#print axioms SPHYS.Dark.fifth_differs
#print axioms SPHYS.Dark.no_template_reading_decides_fifth
#print axioms SPHYS.Dark.fifth_is_keyed
#print axioms SPHYS.Dark.dust_attracts
#print axioms SPHYS.Dark.radiation_attracts
#print axioms SPHYS.Dark.vacuum_repels
#print axioms SPHYS.Dark.repulsion_needs_tension
#print axioms SPHYS.Dark.floor_forbids_phantom
#print axioms SPHYS.Dark.vacuum_iff_frozen
#print axioms SPHYS.Dark.phantom_needs_ghost
#print axioms SPHYS.Dark.flat_budgets_admit_both_signs
#print axioms SPHYS.Dark.dark_ledger_is_computed
#print axioms SPHYS.Dark.dark_ledger_counts
#print axioms SPHYS.Dark.fixed_state_is_its_mass
#print axioms SPHYS.Dark.every_template_reading_of_the_fixed_set_reads_only_mass
#print axioms SPHYS.Dark.z_reading_odd
#print axioms SPHYS.Dark.z_reading_survives_neutrality
#print axioms SPHYS.Dark.the_triplet_has_one_fixed_member
#print axioms SPHYS.Dark.floor_bounds_w
#print axioms SPHYS.Dark.floor_needs_positive_density
#print axioms SPHYS.Dark.floor_is_additive
#print axioms SPHYS.Dark.w_floor_from_rho_plus_p
#print axioms SPHYS.Dark.rhoPlusP_split
#print axioms SPHYS.Dark.fields_bound_w
#print axioms SPHYS.Dark.photon_and_z_force_electroweak_zero
#print axioms SPHYS.Dark.visible_nulls_force_the_visible_fixed_set
#print axioms SPHYS.Dark.below_one_quantum_is_zero
#print axioms SPHYS.Dark.sub_quantum_bounds_force_the_visible_fixed_set
#print axioms SPHYS.Dark.portals_are_derived
#print axioms SPHYS.Dark.fifth_is_free
#print axioms SPHYS.Dark.fixed_iff_visible_fixed_and_no_dark_charge
#print axioms SPHYS.Dark.coloured_fields_are_charged
#print axioms SPHYS.Dark.sumI_tri_zero_of_none
#print axioms SPHYS.Dark.a_coloured_relic_brings_charged_partners
#print axioms SPHYS.Dark.a_stable_singlet_keeps_one_door
#print axioms SPHYS.Dark.one_le_sq_of_ne
#print axioms SPHYS.Dark.zero_le_sq
#print axioms SPHYS.Dark.measured_coupling_bound_forces_zero
#print axioms SPHYS.Dark.free_coupling_bound_never_forces_zero
#print axioms SPHYS.Dark.first_clause_is_forced
#print axioms SPHYS.Dark.second_clause_is_keyed
#print axioms SPHYS.Dark.no_reading_of_the_record_decides_the_bit
#print axioms SPHYS.Dark.self_conjugacy_spends_the_bit
#print axioms SPHYS.Dark.dark_closure_executed
#print axioms SPHYS.Dark.majorana_mass_forbids_abelian_charge
#print axioms SPHYS.Dark.the_dark_bit_is_the_majorana_bit
#print axioms SPHYS.Dark.a_dark_charge_makes_a_dirac_pair
#print axioms SPHYS.Dark.dark_carrier_equivariant
#print axioms SPHYS.Dark.dark_carrier_lands
#print axioms SPHYS.Dark.the_dark_bit_is_the_line_property
#print axioms SPHYS.Dark.a_dark_pair_is_an_off_line_pair
#print axioms SPHYS.Dark.dark_matter_on_the_line_twice
#print axioms SPHYS.Dark.gravity_is_the_reading_left
#print axioms SPHYS.Dark.the_phantom_is_negative_actuation
#print axioms SPHYS.Dark.dark_matter_is_the_fixed_set
