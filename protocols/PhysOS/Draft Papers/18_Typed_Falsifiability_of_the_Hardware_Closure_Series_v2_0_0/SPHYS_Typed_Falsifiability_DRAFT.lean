/-
  SPHYS_Typed_Falsifiability.lean · typed falsifiability of the hardware closure series, read at the Riemann seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: h = 2 Re s, t = Im s; the fold s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t), the critical line h = 1.

  Part I     the seat, the category of involutions, the functor of the seat.
  Part II    the energy carrier (resident).
  Part III   the substrate (resident).
  Part IV     A falsifier breaks the carrier, never the theorem.
  Part V      The typed ledger.
  Part VI     The standing five, rebound.
  Part VII    The capstone.
-/
set_option autoImplicit false
namespace SPHYS.TypedFalsifiability


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


/-! ## Part IV. A falsifier breaks the carrier, never the theorem -/

/-- A FALSIFIER BREAKS THE CARRIER: if a physical fixed point is observed off the line, the map that
    read it onto the seat is not equivariant. The theorems of the seat stand; the reading falls. -/
theorem falsifier_breaks_the_carrier {X : Type} (C : X → Pt) (τ : X → X) (x : X) (hx : τ x = x)
    (hoff : ¬ OnLine (C x)) : ¬ Equivariant C τ fold := by
  intro h
  have e := h x
  rw [hx] at e
  exact hoff ((seat_fixed_line (C x)).mp e.symm)

/-- The seat itself is untouched by any observation: the fold is an involution whose fixed set is the
    line, whatever is measured. -/
theorem the_seat_survives_every_falsifier : GlobalSeat OnLine fold := fold_global_seat

/-! ## Part V. The typed ledger -/

/-- The six seat elements a falsifier can target. -/
inductive Target where
  | fold | line | wall | positivity | price | count
  deriving DecidableEq, Repr

/-- The law of the template each target class names. -/
def lawOf : Target → String
  | .fold => "the physical involution is exact and carried onto the fold"
  | .line => "the fixed set is carried onto the line"
  | .wall => "no even reading returns the odd target"
  | .positivity => "one sign seats the locus"
  | .price => "the registration has no inverse and pays its floor"
  | .count => "a count forced by the fixed set"

theorem laws_distinct :
    ([Target.fold, .line, .wall, .positivity, .price, .count].map lawOf).eraseDups.length = 6 := by decide

structure Falsifier where
  paper : String
  code : String
  target : Target
  thm : String
  deriving Repr

/-- THE LEDGER: every falsifier of the hardware closure series and the six witnesses, typed by the
    seat element it targets and bound to the theorem it would break; an empty name marks a falsifier
    bound to an imported theorem or a structural reading. -/
def ledger : List Falsifier := [
  ⟨"The Electron Is the Seat", "F-Pair", .fold, "positron_is_the_partner"⟩,
  ⟨"The Electron Is the Seat", "F-Round", .line, "round_iff_T_fixed"⟩,
  ⟨"The Electron Is the Seat", "F-Gravity", .wall, "no_reading_of_mass_returns_charge"⟩,
  ⟨"The Electron Is the Seat", "F-Decay", .line, "decay_forbidden"⟩,
  ⟨"The Neutrino Is the Witness", "F-Unitarity", .price, "pmns_unitary_is_lossless"⟩,
  ⟨"The Neutrino Is the Witness", "F-Chirality", .fold, "sterile_uncovered"⟩,
  ⟨"The Neutrino Is the Witness", "F-Floor", .positivity, "oscillation_forces_floor"⟩,
  ⟨"The Arrow Has Two Branches", "F-Monopole", .fold, "magnetism_pair"⟩,
  ⟨"The Arrow Has Two Branches", "F-Mass", .positivity, "gravity_no_off_locus"⟩,
  ⟨"The Arrow Has Two Branches", "F-Loop", .positivity, "one_sign_no_remanence"⟩,
  ⟨"The Proton Is the Lock", "F-Decay", .line, ""⟩,
  ⟨"The Proton Is the Lock", "F-Singlet", .count, "lock_closes"⟩,
  ⟨"The Proton Is the Lock", "F-Gap", .line, "spectrum_gapped"⟩,
  ⟨"The Magnet Is the Witness", "F-Class", .count, "repulsion_exponents"⟩,
  ⟨"The Magnet Is the Witness", "F-Arrow", .fold, "magnetic_term_breaks_T"⟩,
  ⟨"The Fluid Is the Witness", "F-Flow", .line, "value_on_image"⟩,
  ⟨"The Fluid Is the Witness", "F-Energy", .price, ""⟩,
  ⟨"One Actuating Substrate", "F-Computed", .line, "act_is_the_value"⟩,
  ⟨"One Actuating Substrate", "F-Measure", .line, "measured_on_line"⟩,
  ⟨"The Geometric Nature of Light", "F-Dispersion", .line, "every_frequency_one_side"⟩,
  ⟨"The Geometric Nature of Light", "F-Fringe", .wall, "fringe_iff_side_forgotten"⟩,
  ⟨"The Geometric Nature of Light", "F-Helicity", .count, "helicity_is_one_bit"⟩,
  ⟨"Electromagnetism on the Riemann Locus", "F-Charge", .fold, "pair_creation_conserves_charge"⟩,
  ⟨"Electromagnetism on the Riemann Locus", "F-Thirds", .count, "charges_in_thirds"⟩,
  ⟨"Electromagnetism on the Riemann Locus", "F-Reality", .line, "stationarity_survives_the_magnet"⟩,
  ⟨"Immanent Gravity", "F-Composition", .wall, "composition_blind"⟩,
  ⟨"Immanent Gravity", "F-Clock", .wall, "clocks_co_move"⟩,
  ⟨"Immanent Gravity", "F-Polarization", .count, "polarization_count"⟩,
  ⟨"Spin and Statistics", "F-Exclusion", .wall, "pauli_exclusion"⟩,
  ⟨"Spin and Statistics", "F-Connection", .fold, "half_integer_spin_is_odd"⟩,
  ⟨"Spin and Statistics", "F-Anyon", .count, "statistics_one_bit"⟩,
  ⟨"The Weak Force Reads the Orientation", "F-Right", .line, "charged_current_off_the_line"⟩,
  ⟨"The Weak Force Reads the Orientation", "F-CPT", .fold, "cp_violation_is_t_violation"⟩,
  ⟨"The Weak Force Reads the Orientation", "F-Mirror", .line, "vector_on_the_line"⟩,
  ⟨"Resonances: Off the Line", "F-Growth", .fold, "decay_and_capture_one_record"⟩,
  ⟨"Resonances: Off the Line", "F-Closed", .line, "closed_stays_on_the_line"⟩,
  ⟨"Resonances: Off the Line", "F-Width", .line, "stable_iff_every_door_closed"⟩,
  ⟨"The Ferromagnet Is the Witness of the Circle", "F-Ferro", .positivity, "ring4_lee_yang"⟩,
  ⟨"The Ferromagnet Is the Witness of the Circle", "F-Palindrome", .fold, "walls_flip"⟩,
  ⟨"The Ferromagnet Is the Witness of the Circle", "F-Pinch", .positivity, ""⟩,
  ⟨"Dark Matter as the Charge-Conjugation Fixed Set", "F1", .positivity, "the_phantom_is_negative_actuation"⟩,
  ⟨"Dark Matter as the Charge-Conjugation Fixed Set", "F2", .line, "dark_iff_fixed"⟩,
  ⟨"Dark Matter as the Charge-Conjugation Fixed Set", "F3", .wall, "the_dark_bit_is_the_line_property"⟩,
  ⟨"The Measurement Is the Registration", "F-Phase", .wall, "no_record_reading_returns_the_phase"⟩,
  ⟨"The Measurement Is the Registration", "F-Duality", .positivity, "complementarity_iff_positive"⟩,
  ⟨"The Measurement Is the Registration", "F-Outcome", .wall, "the_outcome_is_keyed"⟩,
  ⟨"The Arrow of Time Is the Keyed Bit", "F-Echo", .fold, "reversible_law_admits_both_arrows"⟩,
  ⟨"The Arrow of Time Is the Keyed Bit", "F-Balance", .fold, "detailed_balance"⟩,
  ⟨"The Arrow of Time Is the Keyed Bit", "F-Price", .price, "registration_has_no_left_inverse"⟩,
  ⟨"Matter over Antimatter Is the Spent Bit", "F-Wall", .wall, "even_weight_odd_reading_zero"⟩,
  ⟨"Matter over Antimatter Is the Spent Bit", "F-CPT", .fold, "equilibrium_weight_is_symmetric"⟩,
  ⟨"Matter over Antimatter Is the Spent Bit", "F-Domains", .line, ""⟩,
  ⟨"Symmetry Breaking Is the Spent Bit", "F-Tie", .fold, "two_vacua_one_record"⟩,
  ⟨"Symmetry Breaking Is the Spent Bit", "F-Curvature", .positivity, "mass_is_the_curvature_of_the_depth"⟩,
  ⟨"Symmetry Breaking Is the Spent Bit", "F-Heat", .line, "heat_restores_the_line"⟩,
  ⟨"The Correlation Lives in the Joint Registration", "F-Signal", .wall, "no_signal_from_a_local_choice"⟩,
  ⟨"The Correlation Lives in the Joint Registration", "F-Local", .count, "bell_bound"⟩,
  ⟨"The Correlation Lives in the Joint Registration", "F-Tsirelson", .count, ""⟩,
  ⟨"The Strong Force Reads No Orientation", "F-Dipole", .line, "edm_odd_and_null_on_the_fixed_set"⟩,
  ⟨"The Strong Force Reads No Orientation", "F-Antipode", .positivity, "positivity_selects_zero"⟩,
  ⟨"The Strong Force Reads No Orientation", "F-Strong-CP", .line, ""⟩,
  ⟨"The Horizon Is the Registration", "F-Hair", .wall, "no_hair_reading_returns_baryons"⟩,
  ⟨"The Horizon Is the Registration", "F-Area", .price, "the_horizon_cannot_be_undone"⟩,
  ⟨"The Horizon Is the Registration", "F-Radiate", .price, "merger_radiates_under_three_tenths"⟩]

def countT (t : Target) : Nat := (ledger.filter fun f => f.target == t).length

/-- THE CENSUS: sixty-four falsifiers, every target class occupied. -/
theorem ledger_census :
    ledger.length = 64 ∧ countT .line = 18 ∧ countT .fold = 13 ∧ countT .wall = 11 ∧
    countT .positivity = 9 ∧ countT .count = 8 ∧ countT .price = 5 := by decide

theorem every_target_occupied :
    ([Target.fold, .line, .wall, .positivity, .price, .count].all fun t => 0 < countT t) = true := by decide

/-- Fifty-eight falsifiers are bound to an engine theorem; six to an imported theorem or a structural
    reading. -/
theorem bound_count : (ledger.filter fun f => f.thm != "").length = 58 := by decide

def papers : List String := ["The Electron Is the Seat", "The Neutrino Is the Witness", "The Arrow Has Two Branches", "The Proton Is the Lock", "The Magnet Is the Witness", "The Fluid Is the Witness", "One Actuating Substrate", "The Geometric Nature of Light", "Electromagnetism on the Riemann Locus", "Immanent Gravity", "Spin and Statistics", "The Weak Force Reads the Orientation", "Resonances: Off the Line", "The Ferromagnet Is the Witness of the Circle", "Dark Matter as the Charge-Conjugation Fixed Set", "The Measurement Is the Registration", "The Arrow of Time Is the Keyed Bit", "Matter over Antimatter Is the Spent Bit", "Symmetry Breaking Is the Spent Bit", "The Correlation Lives in the Joint Registration", "The Strong Force Reads No Orientation", "The Horizon Is the Registration"]

def countP (p : String) : Nat := (ledger.filter fun f => f.paper == p).length

/-- Every paper carries at least two falsifiers and at most four; the series papers carry three. -/
theorem every_paper_two_to_four :
    papers.length = 22 ∧ (papers.all fun p => 2 ≤ countP p && countP p ≤ 4) = true := by decide

/-- No paper repeats a code. -/
theorem codes_unique_within_papers :
    (papers.all fun p => ((ledger.filter fun f => f.paper == p).map (·.code)).eraseDups.length == countP p) = true := by
  decide

/-! ## Part VI. The standing five, rebound -/

/-- The five standing predictions of the earlier typed-falsifiability draft and their disposition:
    bound to a ledger falsifier, or withdrawn. -/
inductive Disposition where
  | bound (code : String) | withdrawn
  deriving DecidableEq, Repr

def standingFive : List (String × Disposition) := [
  ("I · the phantom divide is not crossed", .bound "F1"),
  ("II · no magnetic monopole", .bound "F-Monopole"),
  ("III · gravitational waves purely tensor", .bound "F-Polarization"),
  ("IV · baryon number exactly conserved", .withdrawn),
  ("V · no electron substructure", .withdrawn)]

theorem standing_five_disposition :
    (standingFive.filter fun e => e.2 == .withdrawn).length = 2 ∧
    (standingFive.filter fun e => e.2 != .withdrawn).length = 3 := by decide

/-- Each bound prediction names a falsifier present in the ledger. -/
theorem bound_predictions_in_ledger :
    (["F1", "F-Monopole", "F-Polarization"].all fun c => ledger.any fun f => f.code == c) = true := by decide

/-! ## Part VII. The capstone -/

/-- TYPED FALSIFIABILITY. A falsifier observed breaks the carrier and leaves the seat standing; the
    ledger binds sixty-four falsifiers to six seat elements, every class occupied, fifty-eight to an
    engine theorem; every paper carries two to four; the standing five are three bound and two
    withdrawn. -/
theorem typed_falsifiability :
    (∀ {X : Type} (C : X → Pt) (τ : X → X) (x : X), τ x = x → ¬ OnLine (C x) → ¬ Equivariant C τ fold) ∧
    GlobalSeat OnLine fold ∧
    (ledger.length = 64 ∧ countT .line = 18 ∧ countT .fold = 13 ∧ countT .wall = 11 ∧
      countT .positivity = 9 ∧ countT .count = 8 ∧ countT .price = 5) ∧
    (ledger.filter fun f => f.thm != "").length = 58 ∧
    (standingFive.filter fun e => e.2 == .withdrawn).length = 2 :=
  ⟨fun C τ x hx hoff => falsifier_breaks_the_carrier C τ x hx hoff, fold_global_seat, ledger_census,
   bound_count, standing_five_disposition.1⟩

end SPHYS.TypedFalsifiability

#print axioms SPHYS.TypedFalsifiability.pe
#print axioms SPHYS.TypedFalsifiability.fold_involutive
#print axioms SPHYS.TypedFalsifiability.seat_fixed_line
#print axioms SPHYS.TypedFalsifiability.reg_lands
#print axioms SPHYS.TypedFalsifiability.reg_fixes_iff
#print axioms SPHYS.TypedFalsifiability.reg_forgets_side
#print axioms SPHYS.TypedFalsifiability.least_erasure_iff_value
#print axioms SPHYS.TypedFalsifiability.equivariant_id
#print axioms SPHYS.TypedFalsifiability.equivariant_comp
#print axioms SPHYS.TypedFalsifiability.fix_functorial
#print axioms SPHYS.TypedFalsifiability.fold_global_seat
#print axioms SPHYS.TypedFalsifiability.equivariant_carrier_lands
#print axioms SPHYS.TypedFalsifiability.value_on_image
#print axioms SPHYS.TypedFalsifiability.kinetic_crossing
#print axioms SPHYS.TypedFalsifiability.off_locus_pair
#print axioms SPHYS.TypedFalsifiability.ee
#print axioms SPHYS.TypedFalsifiability.mirror_involutive
#print axioms SPHYS.TypedFalsifiability.psi_phi
#print axioms SPHYS.TypedFalsifiability.phi_psi
#print axioms SPHYS.TypedFalsifiability.phi_injective
#print axioms SPHYS.TypedFalsifiability.phi_equivariant
#print axioms SPHYS.TypedFalsifiability.mirror_fixed_iff_real
#print axioms SPHYS.TypedFalsifiability.phi_line_iff_real
#print axioms SPHYS.TypedFalsifiability.stationary_iff_real
#print axioms SPHYS.TypedFalsifiability.line_is_stationary
#print axioms SPHYS.TypedFalsifiability.measured_on_line
#print axioms SPHYS.TypedFalsifiability.no_measurement_off_line
#print axioms SPHYS.TypedFalsifiability.energy_carrier_lands
#print axioms SPHYS.TypedFalsifiability.bar_involutive
#print axioms SPHYS.TypedFalsifiability.bar_fixed_iff_neutral
#print axioms SPHYS.TypedFalsifiability.odd_charges_even_energy
#print axioms SPHYS.TypedFalsifiability.gravity_reads_no_charge_bit
#print axioms SPHYS.TypedFalsifiability.involutions_commute
#print axioms SPHYS.TypedFalsifiability.tmirror_involutive
#print axioms SPHYS.TypedFalsifiability.joint_fixed_iff
#print axioms SPHYS.TypedFalsifiability.charge_carrier_equivariant
#print axioms SPHYS.TypedFalsifiability.pair_lands_once
#print axioms SPHYS.TypedFalsifiability.tmirror_equivariant
#print axioms SPHYS.TypedFalsifiability.neutral_charge_on_line
#print axioms SPHYS.TypedFalsifiability.pair_on_the_edges
#print axioms SPHYS.TypedFalsifiability.stable_lands
#print axioms SPHYS.TypedFalsifiability.falsifier_breaks_the_carrier
#print axioms SPHYS.TypedFalsifiability.the_seat_survives_every_falsifier
#print axioms SPHYS.TypedFalsifiability.laws_distinct
#print axioms SPHYS.TypedFalsifiability.ledger_census
#print axioms SPHYS.TypedFalsifiability.every_target_occupied
#print axioms SPHYS.TypedFalsifiability.bound_count
#print axioms SPHYS.TypedFalsifiability.every_paper_two_to_four
#print axioms SPHYS.TypedFalsifiability.codes_unique_within_papers
#print axioms SPHYS.TypedFalsifiability.standing_five_disposition
#print axioms SPHYS.TypedFalsifiability.bound_predictions_in_ledger
#print axioms SPHYS.TypedFalsifiability.typed_falsifiability
