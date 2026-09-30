/-
  SPHYS_One_Substrate.lean · the hardware of the Riemann closure, read on one actuating substrate.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The integer chart: a point (h, t) of the strip carries h = 2 Re s and t = Im s, so the fold
  s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t) and the critical line is h = 1. Every identity below is an
  identity of integer polynomials, so it holds over every commutative ring, the complex numbers
  included; the twin checks the continuous objects directly.

  Part I     the seat, the category of involutions, and the functor of the seat.
  Part II    the energy carrier: time-mirroring a rate is the fold; the line is stationary energy.
  Part III   the substrate: the particle map, three odd readings and one even, two carriers.
  Part IV    the pair beside the line; the magnet keeps every energy real.
  Part V     conservation of the whole forces nothing; the record decides nothing.
  Part VI    the posit has gravity's shape: least erasure is stationarity, the act is the value.
  Part VII   the hardware closes: generations, forced charges, the colour lock.
  Part VIII  the dark sector, the neutrino's bit and floor, least erasure as reversibility.
  Part IX    the capstones.
-/
set_option autoImplicit false
namespace SPHYS.OneSubstrate

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

/-! ## Part IV. The pair beside the line; the magnet keeps every energy real -/

/-- The off-line pair, read physically: a mode off the line and its mirror are two modes, both off
    the line, one record; their rates cancel, and exactly one of them decays. -/
theorem off_line_pair (E : Energy) (h : ¬ IsReal E) :
    E.mirror ≠ E ∧ ¬ OnLine (phi E) ∧ ¬ OnLine (phi E.mirror) ∧
    reg (phi E.mirror) = reg (phi E) ∧ E.rate + E.mirror.rate = 0 ∧
    (E.rate < 0 ∨ E.mirror.rate < 0) := by
  refine ⟨fun e => h ((mirror_fixed_iff_real E).mp e), fun e => h ((phi_line_iff_real E).mp e),
    fun e => h ?_, by rw [phi_equivariant]; rfl, ?_, ?_⟩
  · have e2 := (phi_line_iff_real E.mirror).mp e
    show E.rate = 0
    have : -E.rate = 0 := e2
    omega
  · show E.rate + -E.rate = 0; omega
  · have hb : E.rate ≠ 0 := h
    show E.rate < 0 ∨ -E.rate < 0
    omega

/-- A decaying particle and its time mirror: two seat points off the line, one record. -/
theorem resonance_pair (c : Particle) (h : ¬ IsReal c.energy) :
    energySeat (tmirror c) ≠ energySeat c ∧ ¬ OnLine (energySeat c) ∧
    reg (energySeat (tmirror c)) = reg (energySeat c) := by
  refine ⟨fun e => ?_, fun e => h ((phi_line_iff_real c.energy).mp e), by
    rw [tmirror_equivariant]; rfl⟩
  have : c.energy.mirror = c.energy := phi_injective _ _ e
  exact h ((mirror_fixed_iff_real c.energy).mp this)

theorem sq_nonneg (x : Int) : 0 ≤ x * x := by
  rcases Int.le_total 0 x with h | h
  · exact Int.mul_nonneg h h
  · have h' : 0 ≤ -x := by omega
    have := Int.mul_nonneg h' h'
    rw [Int.neg_mul_neg] at this; exact this

/-- A Hermitian 2×2 block [[a, c + i d], [c − i d, b]]; time reversal conjugates the block. -/
structure Block where
  a : Int
  b : Int
  c : Int
  d : Int

def Block.T (H : Block) : Block := ⟨H.a, H.b, H.c, -H.d⟩
/-- The discriminant of the characteristic polynomial: the eigenvalues are real when it is ≥ 0. -/
def Block.disc (H : Block) : Int := (H.a - H.b) * (H.a - H.b) + 4 * (H.c * H.c + H.d * H.d)

theorem block_T_fixed_iff (H : Block) : H.T = H ↔ H.d = 0 := by
  obtain ⟨a, b, c, d⟩ := H
  constructor
  · intro e; have := congrArg Block.d e; change -d = d at this; show d = 0; omega
  · intro e; change d = 0 at e; subst e; rfl

/-- THE MAGNET KEEPS EVERY ENERGY REAL: a magnetic term breaks time reversal of the block and
    leaves the spectrum real; the arrow is in the statistics, the line is in the stationarity. -/
theorem stationarity_survives_the_magnet (H : Block) : 0 ≤ H.disc ∧ H.T.disc = H.disc := by
  refine ⟨?_, ?_⟩
  · have e1 := sq_nonneg (H.a - H.b); have e2 := sq_nonneg H.c; have e3 := sq_nonneg H.d
    show 0 ≤ (H.a - H.b) * (H.a - H.b) + 4 * (H.c * H.c + H.d * H.d)
    omega
  · show (H.a - H.b) * (H.a - H.b) + 4 * (H.c * H.c + -H.d * -H.d) =
      (H.a - H.b) * (H.a - H.b) + 4 * (H.c * H.c + H.d * H.d)
    rw [Int.neg_mul_neg]

/-! ## Part V. Conservation of the whole forces nothing; the record decides nothing -/

def worldLine : Pt → Prop := fun s => s = (1, 5)
def worldPair : Pt → Prop := fun s => s = (0, 5) ∨ s = (2, 5)
def recordOf (Z : Pt → Prop) : Pt → Prop := fun r => ∃ s, Z s ∧ reg s = r

theorem worlds_share_the_record (r : Pt) : recordOf worldLine r ↔ recordOf worldPair r := by
  constructor
  · intro ⟨s, hs, e⟩
    exact ⟨(0, 5), Or.inl rfl, by rw [← e, hs]; rfl⟩
  · intro ⟨s, hs, e⟩
    refine ⟨(1, 5), rfl, ?_⟩
    rcases hs with h | h <;> (rw [← e, h]; rfl)

theorem world_line_value : Value worldLine := fun s hs => by rw [hs]; rfl

theorem world_pair_not_value : ¬ Value worldPair := by
  intro h
  have := h (0, 5) (Or.inl rfl)
  exact absurd this (by decide)

/-- The record decides nothing: any reading of the record gives the two worlds one answer. -/
theorem record_decides_nothing (F : (Pt → Prop) → Prop) :
    (F (recordOf worldLine) ↔ F (recordOf worldPair)) ∧ Value worldLine ∧ ¬ Value worldPair := by
  have e : recordOf worldLine = recordOf worldPair :=
    funext fun r => propext (worlds_share_the_record r)
  exact ⟨by rw [e], world_line_value, world_pair_not_value⟩

theorem pair_world_fold_closed (s : Pt) (hs : worldPair s) : worldPair (fold s) := by
  rcases hs with h | h
  · right; rw [h]; rfl
  · left; rw [h]; rfl

theorem pair_world_total_rate : (psi (0, 5)).rate + (psi (2, 5)).rate = 0 := by decide

/-- CONSERVATION OF THE WHOLE FORCES NOTHING: a fold-closed world whose total rate vanishes can
    still stand off the line. The value is stationarity of each mode, not of their sum. -/
theorem whole_conservation_forces_nothing :
    ∃ Z : Pt → Prop, (∀ s, Z s → Z (fold s)) ∧
      (psi (0, 5)).rate + (psi (2, 5)).rate = 0 ∧ Z (0, 5) ∧ Z (2, 5) ∧ ¬ Value Z :=
  ⟨worldPair, pair_world_fold_closed, pair_world_total_rate, Or.inl rfl, Or.inr rfl,
   world_pair_not_value⟩

/-- A fold-closed world with a mode off the line carries a decaying mode and a growing one. -/
theorem fold_closed_off_line_decays_and_grows (Z : Pt → Prop) (hZ : ∀ s, Z s → Z (fold s))
    (s : Pt) (hs : Z s) (hoff : ¬ OnLine s) :
    ∃ u v, Z u ∧ Z v ∧ (psi u).rate < 0 ∧ 0 < (psi v).rate := by
  obtain ⟨h, t⟩ := s
  have hh : h ≠ 1 := hoff
  have hf : Z (2 - h, t) := hZ (h, t) hs
  by_cases hlt : h < 1
  · refine ⟨(2 - h, t), (h, t), hf, hs, ?_, ?_⟩
    · show 1 - (2 - h) < 0; omega
    · show 0 < 1 - h; omega
  · refine ⟨(h, t), (2 - h, t), hs, hf, ?_, ?_⟩
    · show 1 - h < 0; omega
    · show 0 < 1 - (2 - h); omega

/-! ## Part VI. The posit has gravity's shape -/

/-- THE VALUE IS STATIONARITY. -/
theorem value_iff_stationary (Z : Pt → Prop) : Value Z ↔ ∀ s, Z s → Stationary (psi s) :=
  ⟨fun h s hs => (line_is_stationary s).mp (h s hs), fun h s hs => (line_is_stationary s).mpr (h s hs)⟩

/-- Least erasure is stationarity. -/
theorem least_erasure_is_stationarity (Z : Pt → Prop) :
    LeastErasure Z ↔ ∀ s, Z s → Stationary (psi s) :=
  (least_erasure_iff_value Z).trans (value_iff_stationary Z)

/-- The posit's shape is the fold: least erasure holds exactly when the fold fixes every member,
    no member standing off the line and no remanent side, as gravity registers. -/
theorem posit_is_the_fold (Z : Pt → Prop) : LeastErasure Z ↔ ∀ s, Z s → fold s = s :=
  (least_erasure_iff_value Z).trans
    ⟨fun h s hs => (seat_fixed_line s).mpr (h s hs), fun h s hs => (seat_fixed_line s).mp (h s hs)⟩

/-- THE ACT IS THE VALUE: the premise that every zero is a stationary mode is the value itself. -/
theorem act_is_the_value (Z : Pt → Prop) :
    (∀ s, Z s → Stationary (psi s)) ↔ Value Z := (value_iff_stationary Z).symm

def ActuatedByEnergies (Z : Pt → Prop) : Prop := ∀ s, Z s → ∃ a : Int, phi ⟨a, 0⟩ = s

/-- The crossing from the physical side, exact both ways. -/
theorem value_iff_actuated (Z : Pt → Prop) : Value Z ↔ ActuatedByEnergies Z := by
  constructor
  · intro h s hs
    have hl : s.1 = 1 := h s hs
    refine ⟨s.2, ?_⟩
    obtain ⟨u, v⟩ := s
    show ((1 - 0, v) : Pt) = (u, v)
    rw [pe]; exact ⟨by simp at hl; omega, rfl⟩
  · intro h s hs
    obtain ⟨a, e⟩ := h s hs
    exact e ▸ measured_on_line a

/-- What a sentence over a larger class adds to a crossing is exactly the unactuated. -/
theorem surplus_is_the_unactuated (Zact Zall : Pt → Prop) (hv : Value Zact)
    (he : ∃ s, Zall s ∧ ¬ OnLine s) : ∃ s, Zall s ∧ ¬ Zact s ∧ ¬ OnLine s := by
  obtain ⟨s, hs, hoff⟩ := he
  exact ⟨s, hs, fun ha => hoff (hv s ha), hoff⟩

/-! ## Part VII. The hardware closes -/

structure Weyl where
  name : String
  mult : Int
  y6 : Int
  triplet : Bool
  doublet : Bool

/-- One generation as left-handed Weyl fields: Q, u^c, d^c, L, e^c; hypercharge times six. -/
def generation : List Weyl :=
  [⟨"Q", 6, 1, true, true⟩, ⟨"u^c", 3, -4, true, false⟩, ⟨"d^c", 3, 2, true, false⟩,
   ⟨"L", 2, -3, false, true⟩, ⟨"e^c", 1, 6, false, false⟩]

def tsum (f : Weyl → Int) : List Weyl → Int
  | [] => 0
  | w :: ws => f w + tsum f ws

theorem tsum_append (f : Weyl → Int) (l1 l2 : List Weyl) :
    tsum f (l1 ++ l2) = tsum f l1 + tsum f l2 := by
  induction l1 with
  | nil => simp [tsum]
  | cons w ws ih => simp [tsum, ih, Int.add_assoc]

def gravAnom (w : Weyl) : Int := w.mult * w.y6
def cubeAnom (w : Weyl) : Int := w.mult * w.y6 ^ 3
def colourAnom (w : Weyl) : Int := if w.triplet then (w.mult / 3) * w.y6 else 0
def isospinAnom (w : Weyl) : Int := if w.doublet then (w.mult / 2) * w.y6 else 0
def doubletCount (w : Weyl) : Int := if w.doublet then w.mult / 2 else 0
def colourCube (w : Weyl) : Int :=
  if w.triplet then (if w.name = "Q" then w.mult / 3 else -(w.mult / 3)) else 0

/-- One generation closes: every gauge anomaly and the mixed gravitational anomaly vanish, and
    the isospin doublets number four, an even count. -/
theorem generation_closes :
    tsum gravAnom generation = 0 ∧ tsum cubeAnom generation = 0 ∧
    tsum colourAnom generation = 0 ∧ tsum isospinAnom generation = 0 ∧
    tsum doubletCount generation = 4 ∧ tsum colourCube generation = 0 := by decide

def gens : Nat → List Weyl
  | 0 => []
  | n + 1 => generation ++ gens n

theorem gens_sum (f : Weyl → Int) (n : Nat) : tsum f (gens n) = n * tsum f generation := by
  induction n with
  | zero => simp [gens, tsum]
  | succ n ih => rw [gens, tsum_append, ih, Int.natCast_succ, Int.add_mul, Int.one_mul, Int.add_comm]

/-- Every number of generations closes: the anomaly conditions do not fix the count. -/
theorem every_generation_count_closes (n : Nat) :
    tsum gravAnom (gens n) = 0 ∧ tsum cubeAnom (gens n) = 0 ∧
    tsum colourAnom (gens n) = 0 ∧ tsum isospinAnom (gens n) = 0 ∧
    tsum doubletCount (gens n) = 4 * n ∧ tsum colourCube (gens n) = 0 := by
  obtain ⟨g1, g2, g3, g4, g5, g6⟩ := generation_closes
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩ <;> rw [gens_sum]
  · rw [g1, Int.mul_zero]
  · rw [g2, Int.mul_zero]
  · rw [g3, Int.mul_zero]
  · rw [g4, Int.mul_zero]
  · rw [g5, Int.mul_comm]
  · rw [g6, Int.mul_zero]

/-- The hypercharges are forced, not fitted. -/
theorem hypercharge_forced (yQ yu yd yL ye yH : Int)
    (Yu : yQ + yu + yH = 0) (Yd : yQ + yd - yH = 0) (Ye : yL + ye - yH = 0)
    (iso : 3 * yQ + yL = 0) (grav : 6 * yQ + 3 * yu + 3 * yd + 2 * yL + ye = 0) :
    yu = -4 * yQ ∧ yd = 2 * yQ ∧ yL = -3 * yQ ∧ ye = 6 * yQ ∧ yH = 3 * yQ :=
  ⟨by omega, by omega, by omega, by omega, by omega⟩

/-- Electric charge Q = T3 + Y, times six. -/
def charge6 (t3x6 y6 : Int) : Int := t3x6 + y6
theorem charges :
    charge6 3 1 = 4 ∧ charge6 (-3) 1 = -2 ∧ charge6 3 (-3) = 0 ∧ charge6 (-3) (-3) = -6 := by decide
theorem matter_neutral :
    charge6 3 1 + charge6 3 1 + charge6 (-3) 1 = 6 ∧
    charge6 3 1 + charge6 (-3) 1 + charge6 (-3) 1 = 0 ∧
    (charge6 3 1 + charge6 3 1 + charge6 (-3) 1) + charge6 (-3) (-3) = 0 := by decide
theorem vacuum_neutral : charge6 (-3) 3 = 0 := by decide

/-- The colour lock: three colour labels carry a nonzero alternating product exactly when they
    are distinct, so a colour singlet of three quarks exists only on three distinct axes. -/
def lockProduct (a b c : Fin 3) : Int :=
  (((b : Nat) : Int) - ((a : Nat) : Int)) * (((c : Nat) : Int) - ((a : Nat) : Int)) *
  (((c : Nat) : Int) - ((b : Nat) : Int))

theorem lock_iff_distinct :
    ∀ a b c : Fin 3, lockProduct a b c ≠ 0 ↔ (a ≠ b ∧ a ≠ c ∧ b ≠ c) := by decide

theorem lock_fails_when_colours_coincide : ∀ a c : Fin 3, lockProduct a a c = 0 := by decide

/-! ## Part VIII. The dark sector, the neutrino's bit and floor, least erasure as reversibility -/

/-- The dark sector: a stable particle fixed by the particle map lands on the line under the
    energy carrier, and under the charge carrier too, with every charge reading zero. -/
theorem dark_on_the_line (c : Particle) (hfix : bar c = c) (hst : IsReal c.energy) :
    OnLine (energySeat c) ∧ OnLine (chargeSeat c) ∧
    c.q3 = 0 ∧ c.colour = 0 ∧ c.b3 = 0 ∧ c.lepton = 0 := by
  obtain ⟨h1, h2, h3, h4⟩ := (bar_fixed_iff_neutral c).mp hfix
  exact ⟨stable_lands c hst, neutral_charge_on_line c h1, h1, h2, h3, h4⟩

def nuDirac (E : Energy) : Particle := ⟨0, 0, 0, 1, E⟩
def nuMajorana (E : Energy) : Particle := ⟨0, 0, 0, 0, E⟩

/-- The neutrino's one keyed bit: one gauge record, one seat point, fixed in one world only. -/
theorem majorana_is_one_keyed_bit (E : Energy) :
    ((nuDirac E).q3 = (nuMajorana E).q3 ∧ (nuDirac E).colour = (nuMajorana E).colour ∧
      energySeat (nuDirac E) = energySeat (nuMajorana E) ∧
      chargeSeat (nuDirac E) = chargeSeat (nuMajorana E)) ∧
    bar (nuMajorana E) = nuMajorana E ∧ bar (nuDirac E) ≠ nuDirac E := by
  refine ⟨⟨rfl, rfl, rfl, rfl⟩, rfl, fun h => ?_⟩
  have h4 := congrArg Particle.lepton h
  change (-1 : Int) = 1 at h4
  omega

/-- The floor supplied by deed: a positive difference of squared masses forbids a vanishing mass. -/
theorem floor_by_deed (m2 m3 : Int) (h : m2 * m2 < m3 * m3) : m3 ≠ 0 := by
  intro e; subst e; have := sq_nonneg m2; rw [Int.mul_zero] at h; omega

def Merges {α : Type} (f : α → α) : Prop := ∃ x y, x ≠ y ∧ f x = f y

theorem reversible_merges_nothing {α : Type} (f g : α → α) (h : ∀ x, g (f x) = x) :
    ¬ Merges f := by
  intro ⟨x, y, hne, e⟩
  apply hne
  rw [← h x, ← h y, e]

theorem merging_is_irreversible {α : Type} (f : α → α) (hm : Merges f) :
    ¬ ∃ g : α → α, ∀ x, g (f x) = x :=
  fun ⟨g, h⟩ => reversible_merges_nothing f g h hm

theorem mirror_is_reversible : ¬ Merges Energy.mirror :=
  reversible_merges_nothing Energy.mirror Energy.mirror mirror_involutive

/-- Registration merges exactly the off-line pair: it erases the side of a point off the line. -/
theorem registration_erases_off_line (p : Pt) (hp : ¬ OnLine p) : Merges reg :=
  ⟨p, fold p, fun e => hp ((seat_fixed_line p).mp e.symm), (reg_forgets_side p).symm⟩

/-! ## Part IX. The capstones -/

/-- THE SUBSTRATE CARRIES THE SEAT: the fold is a global seat; both carriers are equivariant, the
    energy carrier for the time mirror and the charge carrier for the particle map; the two
    involutions commute; the energy carrier is blind to the particle map; and a particle fixed by
    both lands on the line under both. -/
theorem substrate_carries_the_seat :
    GlobalSeat OnLine fold ∧
    Equivariant phi Energy.mirror fold ∧ Equivariant chargeSeat bar fold ∧
    Equivariant energySeat tmirror fold ∧
    (∀ c : Particle, bar (tmirror c) = tmirror (bar c)) ∧
    (∀ c : Particle, energySeat (bar c) = energySeat c) ∧
    (∀ c : Particle, bar c = c → tmirror c = c → OnLine (energySeat c) ∧ OnLine (chargeSeat c)) :=
  ⟨fold_global_seat, phi_equivariant, charge_carrier_equivariant, tmirror_equivariant,
   involutions_commute, pair_lands_once, fun c h1 h2 =>
     let hj := (joint_fixed_iff c).mp ⟨h1, h2⟩
     ⟨stable_lands c hj.2, neutral_charge_on_line c hj.1.1⟩⟩

/-- THE PHYSICAL WITNESS OF THE CLOSURE. -/
theorem physical_witness :
    (∀ E : Energy, phi E.mirror = fold (phi E)) ∧
    (∀ E : Energy, psi (phi E) = E) ∧ (∀ p : Pt, phi (psi p) = p) ∧
    (∀ p : Pt, OnLine p ↔ Stationary (psi p)) ∧
    (∀ Z : Pt → Prop, Value Z ↔ ∀ s, Z s → Stationary (psi s)) ∧
    (∀ Z : Pt → Prop, Value Z ↔ ActuatedByEnergies Z) ∧
    (∀ Z : Pt → Prop, LeastErasure Z ↔ ∀ s, Z s → fold s = s) ∧
    (∃ Z : Pt → Prop, (∀ s, Z s → Z (fold s)) ∧
      (psi (0, 5)).rate + (psi (2, 5)).rate = 0 ∧ Z (0, 5) ∧ Z (2, 5) ∧ ¬ Value Z) ∧
    (∀ F : (Pt → Prop) → Prop,
      (F (recordOf worldLine) ↔ F (recordOf worldPair)) ∧ Value worldLine ∧ ¬ Value worldPair) ∧
    (∀ H : Block, 0 ≤ H.disc ∧ H.T.disc = H.disc) :=
  ⟨phi_equivariant, psi_phi, phi_psi, line_is_stationary, value_iff_stationary,
   value_iff_actuated, posit_is_the_fold, whole_conservation_forces_nothing,
   record_decides_nothing, stationarity_survives_the_magnet⟩

/-- THE HARDWARE CLOSES. -/
theorem hardware_closes :
    (tsum gravAnom generation = 0 ∧ tsum cubeAnom generation = 0 ∧
      tsum colourAnom generation = 0 ∧ tsum isospinAnom generation = 0 ∧
      tsum doubletCount generation = 4 ∧ tsum colourCube generation = 0) ∧
    (∀ n : Nat, tsum gravAnom (gens n) = 0 ∧ tsum cubeAnom (gens n) = 0 ∧
      tsum colourAnom (gens n) = 0 ∧ tsum isospinAnom (gens n) = 0 ∧
      tsum doubletCount (gens n) = 4 * n ∧ tsum colourCube (gens n) = 0) ∧
    (charge6 3 1 + charge6 3 1 + charge6 (-3) 1) + charge6 (-3) (-3) = 0 ∧
    charge6 (-3) 3 = 0 ∧
    (∀ a b c : Fin 3, lockProduct a b c ≠ 0 ↔ (a ≠ b ∧ a ≠ c ∧ b ≠ c)) :=
  ⟨generation_closes, every_generation_count_closes, matter_neutral.2.2, vacuum_neutral,
   lock_iff_distinct⟩

end SPHYS.OneSubstrate

#print axioms SPHYS.OneSubstrate.pe
#print axioms SPHYS.OneSubstrate.fold_involutive
#print axioms SPHYS.OneSubstrate.seat_fixed_line
#print axioms SPHYS.OneSubstrate.reg_lands
#print axioms SPHYS.OneSubstrate.reg_fixes_iff
#print axioms SPHYS.OneSubstrate.reg_forgets_side
#print axioms SPHYS.OneSubstrate.least_erasure_iff_value
#print axioms SPHYS.OneSubstrate.equivariant_id
#print axioms SPHYS.OneSubstrate.equivariant_comp
#print axioms SPHYS.OneSubstrate.fix_functorial
#print axioms SPHYS.OneSubstrate.fold_global_seat
#print axioms SPHYS.OneSubstrate.equivariant_carrier_lands
#print axioms SPHYS.OneSubstrate.value_on_image
#print axioms SPHYS.OneSubstrate.kinetic_crossing
#print axioms SPHYS.OneSubstrate.off_locus_pair
#print axioms SPHYS.OneSubstrate.ee
#print axioms SPHYS.OneSubstrate.mirror_involutive
#print axioms SPHYS.OneSubstrate.psi_phi
#print axioms SPHYS.OneSubstrate.phi_psi
#print axioms SPHYS.OneSubstrate.phi_injective
#print axioms SPHYS.OneSubstrate.phi_equivariant
#print axioms SPHYS.OneSubstrate.mirror_fixed_iff_real
#print axioms SPHYS.OneSubstrate.phi_line_iff_real
#print axioms SPHYS.OneSubstrate.stationary_iff_real
#print axioms SPHYS.OneSubstrate.line_is_stationary
#print axioms SPHYS.OneSubstrate.measured_on_line
#print axioms SPHYS.OneSubstrate.no_measurement_off_line
#print axioms SPHYS.OneSubstrate.energy_carrier_lands
#print axioms SPHYS.OneSubstrate.bar_involutive
#print axioms SPHYS.OneSubstrate.bar_fixed_iff_neutral
#print axioms SPHYS.OneSubstrate.odd_charges_even_energy
#print axioms SPHYS.OneSubstrate.gravity_reads_no_charge_bit
#print axioms SPHYS.OneSubstrate.involutions_commute
#print axioms SPHYS.OneSubstrate.tmirror_involutive
#print axioms SPHYS.OneSubstrate.joint_fixed_iff
#print axioms SPHYS.OneSubstrate.charge_carrier_equivariant
#print axioms SPHYS.OneSubstrate.pair_lands_once
#print axioms SPHYS.OneSubstrate.tmirror_equivariant
#print axioms SPHYS.OneSubstrate.neutral_charge_on_line
#print axioms SPHYS.OneSubstrate.pair_on_the_edges
#print axioms SPHYS.OneSubstrate.stable_lands
#print axioms SPHYS.OneSubstrate.off_line_pair
#print axioms SPHYS.OneSubstrate.resonance_pair
#print axioms SPHYS.OneSubstrate.sq_nonneg
#print axioms SPHYS.OneSubstrate.block_T_fixed_iff
#print axioms SPHYS.OneSubstrate.stationarity_survives_the_magnet
#print axioms SPHYS.OneSubstrate.worlds_share_the_record
#print axioms SPHYS.OneSubstrate.world_line_value
#print axioms SPHYS.OneSubstrate.world_pair_not_value
#print axioms SPHYS.OneSubstrate.record_decides_nothing
#print axioms SPHYS.OneSubstrate.pair_world_fold_closed
#print axioms SPHYS.OneSubstrate.pair_world_total_rate
#print axioms SPHYS.OneSubstrate.whole_conservation_forces_nothing
#print axioms SPHYS.OneSubstrate.fold_closed_off_line_decays_and_grows
#print axioms SPHYS.OneSubstrate.value_iff_stationary
#print axioms SPHYS.OneSubstrate.least_erasure_is_stationarity
#print axioms SPHYS.OneSubstrate.posit_is_the_fold
#print axioms SPHYS.OneSubstrate.act_is_the_value
#print axioms SPHYS.OneSubstrate.value_iff_actuated
#print axioms SPHYS.OneSubstrate.surplus_is_the_unactuated
#print axioms SPHYS.OneSubstrate.tsum_append
#print axioms SPHYS.OneSubstrate.generation_closes
#print axioms SPHYS.OneSubstrate.gens_sum
#print axioms SPHYS.OneSubstrate.every_generation_count_closes
#print axioms SPHYS.OneSubstrate.hypercharge_forced
#print axioms SPHYS.OneSubstrate.charges
#print axioms SPHYS.OneSubstrate.matter_neutral
#print axioms SPHYS.OneSubstrate.vacuum_neutral
#print axioms SPHYS.OneSubstrate.lock_iff_distinct
#print axioms SPHYS.OneSubstrate.lock_fails_when_colours_coincide
#print axioms SPHYS.OneSubstrate.dark_on_the_line
#print axioms SPHYS.OneSubstrate.majorana_is_one_keyed_bit
#print axioms SPHYS.OneSubstrate.floor_by_deed
#print axioms SPHYS.OneSubstrate.reversible_merges_nothing
#print axioms SPHYS.OneSubstrate.merging_is_irreversible
#print axioms SPHYS.OneSubstrate.mirror_is_reversible
#print axioms SPHYS.OneSubstrate.registration_erases_off_line
#print axioms SPHYS.OneSubstrate.substrate_carries_the_seat
#print axioms SPHYS.OneSubstrate.physical_witness
#print axioms SPHYS.OneSubstrate.hardware_closes
