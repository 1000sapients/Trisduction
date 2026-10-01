/-
  SPHYS_Seat_Reach.lean · what the seat cannot reach, read at the Riemann seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: h = 2 Re s, t = Im s; the fold s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t), the critical line h = 1.

  Part I     the seat, the category of involutions, the functor of the seat.
  Part II    the energy carrier (resident).
  Part III   the substrate (resident).
  Part IV     The seat is blind to the height's scale.
  Part V      The seat is blind to the offset's scale.
  Part VI     Two magnitudes, one seat.
  Part VII    Counts the seat reaches.
  Part VIII   The capstone.
-/
set_option autoImplicit false
namespace SPHYS.SeatReach


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


/-! ## Part IV. The seat is blind to the height's scale -/

/-- Rescaling the height by any integer factor. -/
def scaleH (k : Int) (p : Pt) : Pt := (p.1, k * p.2)

theorem fold_commutes_with_height_scale (k : Int) (p : Pt) : fold (scaleH k p) = scaleH k (fold p) := rfl
theorem line_blind_to_height_scale (k : Int) (p : Pt) : OnLine (scaleH k p) ↔ OnLine p := Iff.rfl
theorem reg_commutes_with_height_scale (k : Int) (p : Pt) : reg (scaleH k p) = scaleH k (reg p) := rfl

/-- Every carrier stays a carrier when its heights are rescaled. -/
theorem height_scaled_carrier_equivariant {X : Type} (C : X → Pt) (τ : X → X) (k : Int)
    (h : Equivariant C τ fold) : Equivariant (fun x => scaleH k (C x)) τ fold := by
  intro x; show scaleH k (C (τ x)) = fold (scaleH k (C x)); rw [h x]; rfl

/-! ## Part V. The seat is blind to the offset's scale -/

/-- Rescaling the offset from the line by any integer factor. -/
def scaleO (k : Int) (p : Pt) : Pt := (1 + k * (p.1 - 1), p.2)

theorem fold_commutes_with_offset_scale (k : Int) (p : Pt) : fold (scaleO k p) = scaleO k (fold p) := by
  obtain ⟨h, t⟩ := p
  show ((2 - (1 + k * (h - 1)), t) : Pt) = (1 + k * ((2 - h) - 1), t)
  rw [pe]; refine ⟨?_, rfl⟩
  have : (2 - h) - 1 = -(h - 1) := by omega
  rw [this, Int.mul_neg]; omega

theorem line_blind_to_offset_scale (k : Int) (hk : k ≠ 0) (p : Pt) : OnLine (scaleO k p) ↔ OnLine p := by
  obtain ⟨h, t⟩ := p
  show 1 + k * (h - 1) = 1 ↔ h = 1
  constructor
  · intro e
    have z : k * (h - 1) = 0 := by omega
    rcases Int.mul_eq_zero.mp z with h1 | h1
    · exact absurd h1 hk
    · omega
  · intro e; subst e; simp

/-- Every carrier stays a carrier when its offsets are rescaled. -/
theorem offset_scaled_carrier_equivariant {X : Type} (C : X → Pt) (τ : X → X) (k : Int)
    (h : Equivariant C τ fold) : Equivariant (fun x => scaleO k (C x)) τ fold := by
  intro x; show scaleO k (C (τ x)) = fold (scaleO k (C x)); rw [h x, fold_commutes_with_offset_scale]

/-! ## Part VI. Two magnitudes, one seat -/

/-- TWO MAGNITUDES, ONE SEAT: the line read through any nonzero rescaling of the offset is the line,
    so every functional of the line returns one value for every scale. -/
theorem two_magnitudes_one_seat (g : (Pt → Prop) → Int) (k : Int) (hk : k ≠ 0) :
    g (fun p => OnLine (scaleO k p)) = g OnLine := by
  have e : (fun p => OnLine (scaleO k p)) = OnLine := funext fun p => propext (line_blind_to_offset_scale k hk p)
  rw [e]

/-- NO SEAT FUNCTIONAL RETURNS A MAGNITUDE: no function of the line returns the scale it was read at. -/
theorem no_seat_functional_returns_the_scale (g : (Pt → Prop) → Int) :
    ¬ ∀ k : Int, k ≠ 0 → g (fun p => OnLine (scaleO k p)) = k := by
  intro hg
  have h1 := hg 1 (by decide)
  have h2 := hg 2 (by decide)
  rw [two_magnitudes_one_seat g 1 (by decide)] at h1
  rw [two_magnitudes_one_seat g 2 (by decide)] at h2
  omega

/-- The same for heights: no function of the line, read at any height scale, returns the scale. -/
theorem no_seat_functional_returns_the_height_scale (g : (Pt → Prop) → Int) :
    ¬ ∀ k : Int, g (fun p => OnLine (scaleH k p)) = k := by
  intro hg
  have h1 := hg 1
  have h2 := hg 2
  have e : ∀ k, (fun p => OnLine (scaleH k p)) = OnLine := fun k => funext fun p => propext (line_blind_to_height_scale k p)
  rw [e] at h1 h2; omega

/-! ## Part VII. Counts the seat reaches -/

/-- Counts survive every rescaling: the number of points of a list on the line is the same at every
    nonzero offset scale. -/
theorem counts_survive_scaling (k : Int) (hk : k ≠ 0) (l : List Pt) :
    (l.filter fun p => decide (OnLine (scaleO k p))).length = (l.filter fun p => decide (OnLine p)).length := by
  congr 1
  apply List.filter_congr
  intro p _
  exact decide_eq_decide.mpr (line_blind_to_offset_scale k hk p)

/-- CP-odd phases of n generations: (n − 1)(n − 2)/2. Three is the least number with one. -/
def cpPhases (n : Nat) : Nat := (n - 1) * (n - 2) / 2

theorem three_generations_least_for_a_phase :
    cpPhases 1 = 0 ∧ cpPhases 2 = 0 ∧ cpPhases 3 = 1 ∧ cpPhases 4 = 3 ∧
    ((List.range 3).all fun n => cpPhases n == 0) = true := by decide

/-- The strong angle's reflection fixes exactly two points of a circle of 2m points, for every circle
    up to two hundred points: a count the seat reaches. -/
theorem two_fixed_points_on_every_circle :
    ((List.range 101).all fun m => m == 0 ||
      ((List.range (2 * m)).filter fun k => (2 * m - k) % (2 * m) == k).length == 2) = true := by
  decide

/-! ## Part VIII. The capstone -/

/-- WHAT THE SEAT CANNOT REACH. The fold, the line and the registration commute with every rescaling of
    height and every nonzero rescaling of offset, so every carrier stays a carrier at every scale; no
    functional of the line returns a scale; counts survive every rescaling and are reached. Magnitudes
    stand at the dot; counts, signs and fixed sets are the seat's. -/
theorem what_the_seat_cannot_reach :
    (∀ (k : Int) (p : Pt), fold (scaleH k p) = scaleH k (fold p) ∧ (OnLine (scaleH k p) ↔ OnLine p)) ∧
    (∀ (k : Int) (p : Pt), fold (scaleO k p) = scaleO k (fold p)) ∧
    (∀ (k : Int), k ≠ 0 → ∀ p : Pt, OnLine (scaleO k p) ↔ OnLine p) ∧
    (∀ g : (Pt → Prop) → Int, ¬ ∀ k : Int, k ≠ 0 → g (fun p => OnLine (scaleO k p)) = k) ∧
    (∀ g : (Pt → Prop) → Int, ¬ ∀ k : Int, g (fun p => OnLine (scaleH k p)) = k) ∧
    (∀ (k : Int), k ≠ 0 → ∀ l : List Pt,
      (l.filter fun p => decide (OnLine (scaleO k p))).length = (l.filter fun p => decide (OnLine p)).length) ∧
    cpPhases 3 = 1 :=
  ⟨fun k p => ⟨rfl, Iff.rfl⟩, fold_commutes_with_offset_scale, line_blind_to_offset_scale,
   no_seat_functional_returns_the_scale, no_seat_functional_returns_the_height_scale,
   counts_survive_scaling, rfl⟩

end SPHYS.SeatReach

#print axioms SPHYS.SeatReach.pe
#print axioms SPHYS.SeatReach.fold_involutive
#print axioms SPHYS.SeatReach.seat_fixed_line
#print axioms SPHYS.SeatReach.reg_lands
#print axioms SPHYS.SeatReach.reg_fixes_iff
#print axioms SPHYS.SeatReach.reg_forgets_side
#print axioms SPHYS.SeatReach.least_erasure_iff_value
#print axioms SPHYS.SeatReach.equivariant_id
#print axioms SPHYS.SeatReach.equivariant_comp
#print axioms SPHYS.SeatReach.fix_functorial
#print axioms SPHYS.SeatReach.fold_global_seat
#print axioms SPHYS.SeatReach.equivariant_carrier_lands
#print axioms SPHYS.SeatReach.value_on_image
#print axioms SPHYS.SeatReach.kinetic_crossing
#print axioms SPHYS.SeatReach.off_locus_pair
#print axioms SPHYS.SeatReach.ee
#print axioms SPHYS.SeatReach.mirror_involutive
#print axioms SPHYS.SeatReach.psi_phi
#print axioms SPHYS.SeatReach.phi_psi
#print axioms SPHYS.SeatReach.phi_injective
#print axioms SPHYS.SeatReach.phi_equivariant
#print axioms SPHYS.SeatReach.mirror_fixed_iff_real
#print axioms SPHYS.SeatReach.phi_line_iff_real
#print axioms SPHYS.SeatReach.stationary_iff_real
#print axioms SPHYS.SeatReach.line_is_stationary
#print axioms SPHYS.SeatReach.measured_on_line
#print axioms SPHYS.SeatReach.no_measurement_off_line
#print axioms SPHYS.SeatReach.energy_carrier_lands
#print axioms SPHYS.SeatReach.bar_involutive
#print axioms SPHYS.SeatReach.bar_fixed_iff_neutral
#print axioms SPHYS.SeatReach.odd_charges_even_energy
#print axioms SPHYS.SeatReach.gravity_reads_no_charge_bit
#print axioms SPHYS.SeatReach.involutions_commute
#print axioms SPHYS.SeatReach.tmirror_involutive
#print axioms SPHYS.SeatReach.joint_fixed_iff
#print axioms SPHYS.SeatReach.charge_carrier_equivariant
#print axioms SPHYS.SeatReach.pair_lands_once
#print axioms SPHYS.SeatReach.tmirror_equivariant
#print axioms SPHYS.SeatReach.neutral_charge_on_line
#print axioms SPHYS.SeatReach.pair_on_the_edges
#print axioms SPHYS.SeatReach.stable_lands
#print axioms SPHYS.SeatReach.fold_commutes_with_height_scale
#print axioms SPHYS.SeatReach.line_blind_to_height_scale
#print axioms SPHYS.SeatReach.reg_commutes_with_height_scale
#print axioms SPHYS.SeatReach.height_scaled_carrier_equivariant
#print axioms SPHYS.SeatReach.fold_commutes_with_offset_scale
#print axioms SPHYS.SeatReach.line_blind_to_offset_scale
#print axioms SPHYS.SeatReach.offset_scaled_carrier_equivariant
#print axioms SPHYS.SeatReach.two_magnitudes_one_seat
#print axioms SPHYS.SeatReach.no_seat_functional_returns_the_scale
#print axioms SPHYS.SeatReach.no_seat_functional_returns_the_height_scale
#print axioms SPHYS.SeatReach.counts_survive_scaling
#print axioms SPHYS.SeatReach.three_generations_least_for_a_phase
#print axioms SPHYS.SeatReach.two_fixed_points_on_every_circle
#print axioms SPHYS.SeatReach.what_the_seat_cannot_reach
