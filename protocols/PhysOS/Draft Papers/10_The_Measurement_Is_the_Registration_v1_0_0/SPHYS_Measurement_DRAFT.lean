/-
  SPHYS_Measurement.lean · the measurement is the registration, read at the Riemann seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: h = 2 Re s, t = Im s; the fold s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t), the critical line h = 1.

  Part I     the seat, the category of involutions, the functor of the seat.
  Part II    the energy carrier (resident).
  Part III   the substrate (resident).
  Part IV     The qubit and its phase flip.
  Part V      Decoherence is the registration.
  Part VI     Positivity is complementarity.
  Part VII    The outcome is the act.
  Part VIII   The capstone.
-/
set_option autoImplicit false
namespace SPHYS.Measurement


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


/-! ## Part IV. The qubit and its phase flip -/

/-- A qubit's state in the pointer basis, scaled to integers: the two populations and the coherence. -/
structure Qubit where
  p0 : Int
  p1 : Int
  c : Int
  deriving DecidableEq, Repr

/-- The phase flip: conjugation by the pointer observable, coherence reversed, populations kept. -/
def pflip (q : Qubit) : Qubit := ⟨q.p0, q.p1, -q.c⟩

theorem pflip_involutive (q : Qubit) : pflip (pflip q) = q := by
  obtain ⟨a, b, c⟩ := q; show (⟨a, b, - -c⟩ : Qubit) = ⟨a, b, c⟩; rw [Int.neg_neg]

/-- A classical state: no coherence between the pointer states. -/
def Classical (q : Qubit) : Prop := q.c = 0

theorem pflip_fixed_iff_classical (q : Qubit) : pflip q = q ↔ Classical q := by
  obtain ⟨a, b, c⟩ := q
  show (⟨a, b, -c⟩ : Qubit) = ⟨a, b, c⟩ ↔ c = 0
  constructor
  · intro h; have := congrArg Qubit.c h; change -c = c at this; omega
  · intro h; subst h; rfl

/-- The pointer carrier: the coherence is the offset from the line, the population the height. -/
def qSeat (q : Qubit) : Pt := (1 + q.c, q.p0)

theorem pointer_carrier_equivariant : Equivariant qSeat pflip fold := by
  intro q
  show ((1 + -q.c, q.p0) : Pt) = (2 - (1 + q.c), q.p0)
  rw [pe]; exact ⟨by omega, rfl⟩

/-- THE CLASSICAL STATES ARE THE LINE. -/
theorem classical_is_the_line (q : Qubit) : OnLine (qSeat q) ↔ Classical q := by
  show 1 + q.c = 1 ↔ q.c = 0
  exact ⟨fun h => by omega, fun h => by omega⟩

theorem pointer_carrier_lands :
    ∃ C : Carrier { q : Qubit // pflip q = q }, ∀ w, C.ι w = qSeat w.1 :=
  equivariant_carrier_lands qSeat pflip pointer_carrier_equivariant

/-! ## Part V. Decoherence is the registration -/

/-- Dephasing, unnormalized: the state plus its phase-flipped partner, twice their average. -/
def dephase (q : Qubit) : Qubit := ⟨q.p0 + q.p0, q.p1 + q.p1, q.c + -q.c⟩

/-- DECOHERENCE LANDS ON THE LINE: every dephased state is classical. -/
theorem dephase_lands_classical (q : Qubit) : Classical (dephase q) := by
  show q.c + -q.c = 0; omega

theorem dephase_lands_on_the_line (q : Qubit) : OnLine (qSeat (dephase q)) :=
  (classical_is_the_line _).mpr (dephase_lands_classical q)

/-- Dephasing cannot tell a state from its phase-flipped partner. -/
theorem dephase_flip_blind (q : Qubit) : dephase (pflip q) = dephase q := by
  obtain ⟨a, b, c⟩ := q
  show (⟨a + a, b + b, -c + - -c⟩ : Qubit) = ⟨a + a, b + b, c + -c⟩
  have : -c + - -c = c + -c := by omega
  rw [this]

/-- Dephasing keeps the populations (doubled by the unnormalized sum). -/
theorem dephase_keeps_populations (q : Qubit) : (dephase q).p0 = 2 * q.p0 ∧ (dephase q).p1 = 2 * q.p1 :=
  ⟨by show q.p0 + q.p0 = 2 * q.p0; omega, by show q.p1 + q.p1 = 2 * q.p1; omega⟩

/-- On the line dephasing changes nothing but the scale: a classical state is its own record. -/
theorem dephase_fixes_classical (q : Qubit) (h : Classical q) : dephase q = ⟨2 * q.p0, 2 * q.p1, 0⟩ := by
  obtain ⟨a, b, c⟩ := q
  change c = 0 at h; subst h
  show (⟨a + a, b + b, 0 + -0⟩ : Qubit) = ⟨2 * a, 2 * b, 0⟩
  have e1 : a + a = 2 * a := by omega
  have e2 : b + b = 2 * b := by omega
  rw [e1, e2]; rfl

/-- The record a pointer measurement returns: the populations. -/
def record (q : Qubit) : Int × Int := (q.p0, q.p1)

theorem record_forgets_phase (q : Qubit) : record (pflip q) = record q := rfl

/-- THE MEASUREMENT IS THE REGISTRATION: the pointer record is the seat's registration read on the
    carrier, keeping the height and forgetting the side. -/
theorem measurement_is_the_registration (q : Qubit) :
    reg (qSeat (pflip q)) = reg (qSeat q) ∧ record (pflip q) = record q := by
  refine ⟨?_, rfl⟩
  rw [pointer_carrier_equivariant q]; exact reg_forgets_side (qSeat q)

/-- Two states, one record: a coherent state and its phase-flipped partner. -/
theorem two_states_one_record (q : Qubit) (h : q.c ≠ 0) : pflip q ≠ q ∧ record (pflip q) = record q :=
  ⟨fun e => h ((pflip_fixed_iff_classical q).mp e), rfl⟩

/-- No reading of the record returns the coherence. -/
theorem no_record_reading_returns_the_phase (g : Int × Int → Int) : ¬ ∀ q : Qubit, g (record q) = q.c := by
  intro hg
  have h1 := hg ⟨1, 1, 1⟩
  have h2 := hg ⟨1, 1, -1⟩
  change g (1, 1) = 1 at h1; change g (1, 1) = -1 at h2
  omega

/-! ## Part VI. Positivity is complementarity -/

/-- A physical state: nonnegative populations and a coherence bounded by their geometric mean. -/
def Positive (q : Qubit) : Prop := 0 ≤ q.p0 ∧ 0 ≤ q.p1 ∧ q.c * q.c ≤ q.p0 * q.p1

theorem sq_expand (a b : Int) : (a + b) * (a + b) - (a - b) * (a - b) = 4 * (a * b) := by
  simp only [Int.add_mul, Int.mul_add, Int.sub_mul, Int.mul_sub]
  rw [Int.mul_comm b a]; omega

/-- COMPLEMENTARITY IS POSITIVITY: predictability squared plus visibility squared is at most one
    exactly when the coherence is bounded by the populations' geometric mean. -/
theorem complementarity_iff_positive (q : Qubit) :
    (q.p0 - q.p1) * (q.p0 - q.p1) + 4 * (q.c * q.c) ≤ (q.p0 + q.p1) * (q.p0 + q.p1) ↔
      q.c * q.c ≤ q.p0 * q.p1 := by
  have e := sq_expand q.p0 q.p1
  constructor <;> intro h <;> omega

/-- A pure state saturates it. -/
theorem pure_saturates (q : Qubit) (h : q.c * q.c = q.p0 * q.p1) :
    (q.p0 - q.p1) * (q.p0 - q.p1) + 4 * (q.c * q.c) = (q.p0 + q.p1) * (q.p0 + q.p1) := by
  have e := sq_expand q.p0 q.p1; omega

theorem dephase_keeps_positivity (q : Qubit) (h : Positive q) : Positive (dephase q) := by
  obtain ⟨h0, h1, _⟩ := h
  refine ⟨by show 0 ≤ q.p0 + q.p0; omega, by show 0 ≤ q.p1 + q.p1; omega, ?_⟩
  show (q.c + -q.c) * (q.c + -q.c) ≤ (q.p0 + q.p0) * (q.p1 + q.p1)
  have z : q.c + -q.c = 0 := by omega
  rw [z, Int.zero_mul]
  exact Int.mul_nonneg (by omega) (by omega)

theorem pflip_keeps_positivity (q : Qubit) (h : Positive q) : Positive (pflip q) := by
  obtain ⟨h0, h1, h2⟩ := h
  refine ⟨h0, h1, ?_⟩
  show (-q.c) * (-q.c) ≤ q.p0 * q.p1
  rw [Int.neg_mul_neg]; exact h2

/-! ## Part VII. The outcome is the act -/

/-- A run: the state measured and the outcome registered. -/
structure Run where
  state : Qubit
  outcome : Bool
  deriving DecidableEq, Repr

/-- What the state determines before the act: its dephased form. -/
def determined (r : Run) : Qubit := dephase r.state

/-- The other outcome on the same state. -/
def otherOutcome (r : Run) : Run := ⟨r.state, !r.outcome⟩

theorem outcome_odd_state_even (r : Run) :
    determined (otherOutcome r) = determined r ∧ (otherOutcome r).outcome = !r.outcome := ⟨rfl, rfl⟩

/-- THE OUTCOME IS KEYED: no function of what the state determines returns the outcome; the
    registration act supplies it. -/
theorem the_outcome_is_keyed (g : Qubit → Bool) : ¬ ∀ r : Run, g (determined r) = r.outcome := by
  intro hg
  have h1 := hg ⟨⟨1, 1, 0⟩, true⟩
  have h2 := hg ⟨⟨1, 1, 0⟩, false⟩
  change g (dephase ⟨1, 1, 0⟩) = true at h1
  change g (dephase ⟨1, 1, 0⟩) = false at h2
  rw [h1] at h2; exact Bool.noConfusion h2

/-! ## Part VIII. The capstone -/

/-- THE MEASUREMENT IS THE REGISTRATION. The phase flip is carried onto the fold and the classical
    states onto the line; decoherence lands every state on the line and keeps the populations; the
    pointer record keeps the height and forgets the side; no reading of it returns the phase;
    complementarity is positivity; and the outcome is keyed, supplied by the act. -/
theorem measurement_is_the_registration_capstone :
    Equivariant qSeat pflip fold ∧
    (∀ q : Qubit, OnLine (qSeat q) ↔ Classical q) ∧
    (∀ q : Qubit, OnLine (qSeat (dephase q)) ∧ dephase (pflip q) = dephase q) ∧
    (∀ q : Qubit, reg (qSeat (pflip q)) = reg (qSeat q) ∧ record (pflip q) = record q) ∧
    (∀ g : Int × Int → Int, ¬ ∀ q : Qubit, g (record q) = q.c) ∧
    (∀ q : Qubit, ((q.p0 - q.p1) * (q.p0 - q.p1) + 4 * (q.c * q.c) ≤ (q.p0 + q.p1) * (q.p0 + q.p1) ↔
      q.c * q.c ≤ q.p0 * q.p1)) ∧
    (∀ g : Qubit → Bool, ¬ ∀ r : Run, g (determined r) = r.outcome) :=
  ⟨pointer_carrier_equivariant, classical_is_the_line,
   fun q => ⟨dephase_lands_on_the_line q, dephase_flip_blind q⟩,
   measurement_is_the_registration, no_record_reading_returns_the_phase,
   complementarity_iff_positive, the_outcome_is_keyed⟩

end SPHYS.Measurement

#print axioms SPHYS.Measurement.pe
#print axioms SPHYS.Measurement.fold_involutive
#print axioms SPHYS.Measurement.seat_fixed_line
#print axioms SPHYS.Measurement.reg_lands
#print axioms SPHYS.Measurement.reg_fixes_iff
#print axioms SPHYS.Measurement.reg_forgets_side
#print axioms SPHYS.Measurement.least_erasure_iff_value
#print axioms SPHYS.Measurement.equivariant_id
#print axioms SPHYS.Measurement.equivariant_comp
#print axioms SPHYS.Measurement.fix_functorial
#print axioms SPHYS.Measurement.fold_global_seat
#print axioms SPHYS.Measurement.equivariant_carrier_lands
#print axioms SPHYS.Measurement.value_on_image
#print axioms SPHYS.Measurement.kinetic_crossing
#print axioms SPHYS.Measurement.off_locus_pair
#print axioms SPHYS.Measurement.ee
#print axioms SPHYS.Measurement.mirror_involutive
#print axioms SPHYS.Measurement.psi_phi
#print axioms SPHYS.Measurement.phi_psi
#print axioms SPHYS.Measurement.phi_injective
#print axioms SPHYS.Measurement.phi_equivariant
#print axioms SPHYS.Measurement.mirror_fixed_iff_real
#print axioms SPHYS.Measurement.phi_line_iff_real
#print axioms SPHYS.Measurement.stationary_iff_real
#print axioms SPHYS.Measurement.line_is_stationary
#print axioms SPHYS.Measurement.measured_on_line
#print axioms SPHYS.Measurement.no_measurement_off_line
#print axioms SPHYS.Measurement.energy_carrier_lands
#print axioms SPHYS.Measurement.bar_involutive
#print axioms SPHYS.Measurement.bar_fixed_iff_neutral
#print axioms SPHYS.Measurement.odd_charges_even_energy
#print axioms SPHYS.Measurement.gravity_reads_no_charge_bit
#print axioms SPHYS.Measurement.involutions_commute
#print axioms SPHYS.Measurement.tmirror_involutive
#print axioms SPHYS.Measurement.joint_fixed_iff
#print axioms SPHYS.Measurement.charge_carrier_equivariant
#print axioms SPHYS.Measurement.pair_lands_once
#print axioms SPHYS.Measurement.tmirror_equivariant
#print axioms SPHYS.Measurement.neutral_charge_on_line
#print axioms SPHYS.Measurement.pair_on_the_edges
#print axioms SPHYS.Measurement.stable_lands
#print axioms SPHYS.Measurement.pflip_involutive
#print axioms SPHYS.Measurement.pflip_fixed_iff_classical
#print axioms SPHYS.Measurement.pointer_carrier_equivariant
#print axioms SPHYS.Measurement.classical_is_the_line
#print axioms SPHYS.Measurement.pointer_carrier_lands
#print axioms SPHYS.Measurement.dephase_lands_classical
#print axioms SPHYS.Measurement.dephase_lands_on_the_line
#print axioms SPHYS.Measurement.dephase_flip_blind
#print axioms SPHYS.Measurement.dephase_keeps_populations
#print axioms SPHYS.Measurement.dephase_fixes_classical
#print axioms SPHYS.Measurement.record_forgets_phase
#print axioms SPHYS.Measurement.measurement_is_the_registration
#print axioms SPHYS.Measurement.two_states_one_record
#print axioms SPHYS.Measurement.no_record_reading_returns_the_phase
#print axioms SPHYS.Measurement.sq_expand
#print axioms SPHYS.Measurement.complementarity_iff_positive
#print axioms SPHYS.Measurement.pure_saturates
#print axioms SPHYS.Measurement.dephase_keeps_positivity
#print axioms SPHYS.Measurement.pflip_keeps_positivity
#print axioms SPHYS.Measurement.outcome_odd_state_even
#print axioms SPHYS.Measurement.the_outcome_is_keyed
#print axioms SPHYS.Measurement.measurement_is_the_registration_capstone
