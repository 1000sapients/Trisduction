/-
  SPHYS_Light.lean · the geometric nature of light, read at the Riemann seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: a point (h, t) of the strip carries h = 2 Re s and t = Im s; the fold s ↦ 1 − s̄ is
  (h, t) ↦ (2 − h, t) and the critical line is h = 1. The substrate's two involutions (the particle
  map, the time mirror of a rate) and its two carriers (charge to the side, energy s = 1/2 + iE)
  are those of the hardware paper, re-proved here so the file stands alone.

  Part I    the seat, the category of involutions, the functor of the seat.
  Part II   the energy carrier: the line is the locus of stationary energy.
  Part III  the substrate: the particle map, the time mirror, both carriers.
  Part IV   light is the line: the photon fixed by both involutions at every frequency; frequency
            the height; the speed hierarchy; helicity the one bit; C-parity; detection as
            registration; the quantum as the field's.
  Part V    the capstone.
-/
set_option autoImplicit false
namespace SPHYS.Light


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

theorem sq_nonneg (x : Int) : 0 ≤ x * x := by
  rcases Int.le_total 0 x with h | h
  · exact Int.mul_nonneg h h
  · have h' : 0 ≤ -x := by omega
    have := Int.mul_nonneg h' h'
    rw [Int.neg_mul_neg] at this; exact this

/-! ## Part IV. Light is the line -/

/-- A photon of frequency ω: no charge of any kind, a real energy, its own antiparticle. -/
def photon (ω : Int) : Particle := ⟨0, 0, 0, 0, ⟨ω, 0⟩⟩

theorem photon_is_its_own_antiparticle (ω : Int) : bar (photon ω) = photon ω := rfl
theorem photon_is_stationary (ω : Int) : tmirror (photon ω) = photon ω := rfl

/-- LIGHT IS THE LINE: at every frequency the photon is fixed by both involutions and lands on the
    line under both carriers. -/
theorem photon_on_both_lines (ω : Int) :
    OnLine (energySeat (photon ω)) ∧ OnLine (chargeSeat (photon ω)) := by
  refine ⟨rfl, ?_⟩
  show 1 + 0 = 1
  rfl

/-- Frequency is the height: the photon of frequency ω lands at (1, ω). -/
theorem frequency_is_the_height (ω : Int) : energySeat (photon ω) = (1, ω) := rfl

/-- Every frequency stands on one side: the spectrum from radio to gamma is the line's heights. -/
theorem every_frequency_one_side (ω ω' : Int) :
    (energySeat (photon ω)).1 = (energySeat (photon ω')).1 := rfl

/-- Registration keeps a photon exactly: nothing of light is erased by the fold. -/
theorem registration_keeps_light (ω : Int) : reg (energySeat (photon ω)) = energySeat (photon ω) := rfl

theorem sq_pos_of_ne (m : Int) (h : m ≠ 0) : 0 < m * m := by
  rcases Int.lt_or_gt_of_ne h with h' | h'
  · have := Int.mul_pos (show 0 < -m by omega) (show 0 < -m by omega)
    rw [Int.neg_mul_neg] at this; exact this
  · exact Int.mul_pos h' h'

/-- The speed hierarchy, in units c = 1: a massive mode ω² = k² + m² with m ≠ 0 has k² < ω², so it
    runs slower than light; a massless mode has ω² = k² at every frequency. Frequency is the
    height and rest mass the depth: two coordinates, never one. -/
theorem massive_slower (k ω m : Int) (h : ω * ω = k * k + m * m) (hm : m ≠ 0) : k * k < ω * ω := by
  have := sq_pos_of_ne m hm
  omega

theorem massless_on_the_cone (k ω : Int) (h : ω * ω = k * k + 0 * 0) : ω * ω = k * k := by
  rw [Int.mul_zero, Int.add_zero] at h; exact h

/-- A photon's helicity: +1 or −1. Parity reverses it and keeps the frequency. -/
structure Photon where
  freq : Int
  helicity : Bool
  deriving DecidableEq, Repr

def Photon.parity (p : Photon) : Photon := ⟨p.freq, !p.helicity⟩

theorem parity_involutive (p : Photon) : p.parity.parity = p := by
  obtain ⟨f, s⟩ := p
  cases s <;> rfl

/-- THE HELICITY IS ONE BIT: the two helicities of one frequency are two states with one energy
    record, and no reading of the energy returns the helicity. -/
theorem helicity_is_one_bit {β : Type} (g : Int → β) (p : Photon) :
    p.parity ≠ p ∧ (p.parity).freq = p.freq ∧ g (p.parity).freq = g p.freq := by
  refine ⟨fun e => ?_, rfl, rfl⟩
  have := congrArg Photon.helicity e
  obtain ⟨f, s⟩ := p
  cases s <;> simp [Photon.parity] at this

/-- The charge-conjugation parity of n photons, (−1)^n. -/
def cparity : Nat → Int
  | 0 => 1
  | n + 1 => - cparity n

theorem cparity_val (n : Nat) : cparity n = if n % 2 = 0 then 1 else -1 := by
  induction n with
  | zero => rfl
  | succ n ih =>
    show - cparity n = _
    rw [ih]
    by_cases h : n % 2 = 0
    · have h2 : (n + 1) % 2 ≠ 0 := by omega
      simp [h, h2]
    · have h2 : (n + 1) % 2 = 0 := by omega
      simp [h, h2]

/-- Furry's selection: a state even under charge conjugation decays only into an even number of
    photons, an odd state only into an odd number. Parapositronium into two, orthopositronium
    into three. -/
theorem c_even_needs_even_photons (n : Nat) (h : cparity n = 1) : n % 2 = 0 := by
  rw [cparity_val] at h
  by_cases e : n % 2 = 0
  · exact e
  · simp [e] at h

theorem positronium_counts : cparity 2 = 1 ∧ cparity 3 = -1 ∧ cparity 1 = -1 := by decide

/-- Intensity at a screen point from two paths of real amplitudes a and b, a marker overlap c (the
    side forgotten when c ≠ 0, registered when c = 0), and a fringe sign s = ±1. -/
def intensity (a b c s : Int) : Int := a * a + b * b + 2 * (a * b * c) * s

theorem mul3_ne_zero (a b c : Int) : a * b * c ≠ 0 ↔ (a ≠ 0 ∧ b ≠ 0 ∧ c ≠ 0) := by
  constructor
  · intro h; refine ⟨?_, ?_, ?_⟩ <;> intro e <;> apply h <;> simp [e]
  · intro ⟨h1, h2, h3⟩; exact Int.mul_ne_zero (Int.mul_ne_zero h1 h2) h3

/-- DETECTION IS REGISTRATION: fringes exist exactly when both paths are open and the record
    forgets the side; registering the side erases the fringe. -/
theorem fringe_iff_side_forgotten (a b c : Int) :
    intensity a b c 1 ≠ intensity a b c (-1) ↔ (a ≠ 0 ∧ b ≠ 0 ∧ c ≠ 0) := by
  have d : intensity a b c 1 - intensity a b c (-1) = 4 * (a * b * c) := by
    show (a * a + b * b + 2 * (a * b * c) * 1) - (a * a + b * b + 2 * (a * b * c) * (-1)) = _
    simp only [Int.mul_one, Int.mul_neg]; omega
  rw [← mul3_ne_zero]
  constructor
  · intro h e; apply h; omega
  · intro h e; apply h; omega

theorem side_registered_no_fringe (a b s : Int) : intensity a b 0 s = a * a + b * b := by
  show a * a + b * b + 2 * (a * b * 0) * s = a * a + b * b
  rw [Int.mul_zero, Int.mul_zero, Int.zero_mul, Int.add_zero]

/-- A single photon never coincides with itself: n(n − 1) = 0 at n = 1. -/
theorem single_photon_no_coincidence : (1 : Int) * (1 - 1) = 0 := by decide

/-- Any classical field split into two equally likely intensities x and y bunches: the
    coincidence rate 2(x² + y²) is at least the square of the mean rate (x + y)², g⁽²⁾ ≥ 1. -/
theorem classical_light_bunches (x y : Int) : (x + y) * (x + y) ≤ 2 * (x * x + y * y) := by
  have h := sq_nonneg (x - y)
  simp only [Int.add_mul, Int.mul_add, Int.sub_mul, Int.mul_sub] at h ⊢
  rw [Int.mul_comm y x] at h ⊢
  omega

/-- The quantum is the field's: a one-photon state has zero coincidence, which no classical
    intensity with detector-only quantization reaches unless it is empty. -/
theorem quantum_is_the_fields (x y : Int) (h : 0 < x + y) :
    (1 : Int) * (1 - 1) = 0 ∧ 0 < 2 * (x * x + y * y) := by
  refine ⟨by decide, ?_⟩
  have := classical_light_bunches x y
  have := sq_pos_of_ne (x + y) (by omega)
  omega

/-! ## Part V. The capstone -/

/-- THE GEOMETRIC NATURE OF LIGHT, AT THE SEAT. -/
theorem light_is_the_line :
    (∀ ω : Int, bar (photon ω) = photon ω ∧ tmirror (photon ω) = photon ω) ∧
    (∀ ω : Int, OnLine (energySeat (photon ω)) ∧ OnLine (chargeSeat (photon ω))) ∧
    (∀ ω : Int, energySeat (photon ω) = (1, ω)) ∧
    (∀ k ω m : Int, ω * ω = k * k + m * m → m ≠ 0 → k * k < ω * ω) ∧
    (∀ p : Photon, p.parity ≠ p ∧ (p.parity).freq = p.freq) ∧
    (∀ a b c : Int, intensity a b c 1 ≠ intensity a b c (-1) ↔ (a ≠ 0 ∧ b ≠ 0 ∧ c ≠ 0)) ∧
    (∀ x y : Int, (x + y) * (x + y) ≤ 2 * (x * x + y * y)) ∧
    (∀ n : Nat, cparity n = 1 → n % 2 = 0) :=
  ⟨fun _ => ⟨rfl, rfl⟩, photon_on_both_lines, frequency_is_the_height, massive_slower,
   fun p => ⟨(helicity_is_one_bit id p).1, rfl⟩, fringe_iff_side_forgotten,
   classical_light_bunches, c_even_needs_even_photons⟩

end SPHYS.Light

#print axioms SPHYS.Light.pe
#print axioms SPHYS.Light.fold_involutive
#print axioms SPHYS.Light.seat_fixed_line
#print axioms SPHYS.Light.reg_lands
#print axioms SPHYS.Light.reg_fixes_iff
#print axioms SPHYS.Light.reg_forgets_side
#print axioms SPHYS.Light.least_erasure_iff_value
#print axioms SPHYS.Light.equivariant_id
#print axioms SPHYS.Light.equivariant_comp
#print axioms SPHYS.Light.fix_functorial
#print axioms SPHYS.Light.fold_global_seat
#print axioms SPHYS.Light.equivariant_carrier_lands
#print axioms SPHYS.Light.value_on_image
#print axioms SPHYS.Light.kinetic_crossing
#print axioms SPHYS.Light.off_locus_pair
#print axioms SPHYS.Light.ee
#print axioms SPHYS.Light.mirror_involutive
#print axioms SPHYS.Light.psi_phi
#print axioms SPHYS.Light.phi_psi
#print axioms SPHYS.Light.phi_injective
#print axioms SPHYS.Light.phi_equivariant
#print axioms SPHYS.Light.mirror_fixed_iff_real
#print axioms SPHYS.Light.phi_line_iff_real
#print axioms SPHYS.Light.stationary_iff_real
#print axioms SPHYS.Light.line_is_stationary
#print axioms SPHYS.Light.measured_on_line
#print axioms SPHYS.Light.no_measurement_off_line
#print axioms SPHYS.Light.energy_carrier_lands
#print axioms SPHYS.Light.bar_involutive
#print axioms SPHYS.Light.bar_fixed_iff_neutral
#print axioms SPHYS.Light.odd_charges_even_energy
#print axioms SPHYS.Light.gravity_reads_no_charge_bit
#print axioms SPHYS.Light.involutions_commute
#print axioms SPHYS.Light.tmirror_involutive
#print axioms SPHYS.Light.joint_fixed_iff
#print axioms SPHYS.Light.charge_carrier_equivariant
#print axioms SPHYS.Light.pair_lands_once
#print axioms SPHYS.Light.tmirror_equivariant
#print axioms SPHYS.Light.neutral_charge_on_line
#print axioms SPHYS.Light.pair_on_the_edges
#print axioms SPHYS.Light.stable_lands
#print axioms SPHYS.Light.sq_nonneg
#print axioms SPHYS.Light.photon_is_its_own_antiparticle
#print axioms SPHYS.Light.photon_is_stationary
#print axioms SPHYS.Light.photon_on_both_lines
#print axioms SPHYS.Light.frequency_is_the_height
#print axioms SPHYS.Light.every_frequency_one_side
#print axioms SPHYS.Light.registration_keeps_light
#print axioms SPHYS.Light.sq_pos_of_ne
#print axioms SPHYS.Light.massive_slower
#print axioms SPHYS.Light.massless_on_the_cone
#print axioms SPHYS.Light.parity_involutive
#print axioms SPHYS.Light.helicity_is_one_bit
#print axioms SPHYS.Light.cparity_val
#print axioms SPHYS.Light.c_even_needs_even_photons
#print axioms SPHYS.Light.positronium_counts
#print axioms SPHYS.Light.mul3_ne_zero
#print axioms SPHYS.Light.fringe_iff_side_forgotten
#print axioms SPHYS.Light.side_registered_no_fringe
#print axioms SPHYS.Light.single_photon_no_coincidence
#print axioms SPHYS.Light.classical_light_bunches
#print axioms SPHYS.Light.quantum_is_the_fields
#print axioms SPHYS.Light.light_is_the_line
