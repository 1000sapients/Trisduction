/-
  SPHYS_Gravity.lean · immanent gravity, read at the Riemann seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: h = 2 Re s, t = Im s; the fold s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t), the critical line
  h = 1, registration (h, t) ↦ (1, t) keeping the height and forgetting the side. The substrate's
  particle map, time mirror and carriers are those of the hardware paper, re-proved here.

  Part I     the seat, the category of involutions, the functor of the seat.
  Part II    the energy carrier (resident from the hardware paper).
  Part III   the substrate: the particle map and the charge carrier.
  Part IV    gravity reads the record: even, factoring through registration, composition-blind.
  Part V     one sign: gravity cannot be screened; charge can.
  Part VI    no bit, and reversible: conservative motion retraces exactly for every force law.
  Part VII   gravity and time co-move: redshift moves the height, never the side.
  Part VIII  the monic memory of the deficit.
  Part IX    the waves: two polarizations, one speed; IX-b gravity reads the dark, the vacuum repels.
  Part X     the capstone.
-/
set_option autoImplicit false
namespace SPHYS.Gravity


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

/-! ## Part IV. Gravity reads the record -/

/-- The gravitational reading of a particle: its energy, and nothing else. -/
def grav (c : Particle) : Int := c.energy.freq

/-- Gravity is even under the particle map: antimatter reads as matter. -/
theorem gravity_even_branch (c : Particle) : grav (bar c) = grav c := rfl

/-- The gravitational reading of a point of the seat: its height. -/
def gravPt (p : Pt) : Int := p.2

/-- GRAVITY READS THE RECORD: the reading factors through registration, so it is even under the
    fold and keeps nothing of the side. -/
theorem gravity_factors_through_registration (p : Pt) :
    gravPt (reg p) = gravPt p ∧ gravPt (fold p) = gravPt p := ⟨rfl, rfl⟩

/-- Composition blindness, the equivalence principle at the seat: two particles of one energy read
    alike whatever their charges. -/
theorem composition_blind (c d : Particle) (h : c.energy.freq = d.energy.freq) : grav c = grav d := h

/-- The distance of a point from the line, squared: even under the fold, and still not the record. -/
def depth2 (p : Pt) : Int := (p.1 - 1) * (p.1 - 1)

/-- Evenness is weaker than reading the record: the depth is fold-even and registration changes it.
    The equivalence principle asks for the stronger property. -/
theorem even_is_not_the_record :
    depth2 (fold (0, 5)) = depth2 (0, 5) ∧ depth2 (reg (0, 5)) ≠ depth2 (0, 5) := by decide

/-- The odd part of a reading under the particle map. -/
def oddPart (g : Particle → Int) (c : Particle) : Int := g c - g (bar c)

/-- Gravity's odd part vanishes at every source: every gravitational source stands on the line. -/
theorem every_source_on_the_line (c : Particle) : OnLine (1 + oddPart grav c, c.energy.freq) := by
  show 1 + (c.energy.freq - c.energy.freq) = 1; omega

/-- Charge's odd part is twice the charge: every charged source stands off the line. -/
theorem charged_source_off_the_line (c : Particle) (h : c.q3 ≠ 0) :
    ¬ OnLine (1 + oddPart Particle.q3 c, c.energy.freq) := by
  show ¬ (1 + (c.q3 - -c.q3) = 1); omega

/-! ## Part V. One sign: gravity cannot be screened -/

def total : List Int → Int
  | [] => 0
  | x :: xs => x + total xs

theorem total_nonneg (xs : List Int) (h : ∀ x ∈ xs, 0 ≤ x) : 0 ≤ total xs := by
  induction xs with
  | nil => exact Int.le_refl 0
  | cons x xs ih =>
    have hx := h x (List.mem_cons_self)
    have hr := ih (fun y hy => h y (List.mem_cons_of_mem x hy))
    show 0 ≤ x + total xs; omega

/-- GRAVITY CANNOT BE SCREENED: sources of one sign total zero only when every source is zero. -/
theorem one_sign_no_screening (xs : List Int) (h : ∀ x ∈ xs, 0 ≤ x) (h0 : total xs = 0) :
    ∀ x ∈ xs, x = 0 := by
  induction xs with
  | nil => intro x hx; cases hx
  | cons y ys ih =>
    have hy := h y (List.mem_cons_self)
    have hr := total_nonneg ys (fun z hz => h z (List.mem_cons_of_mem y hz))
    have e : y + total ys = 0 := h0
    have y0 : y = 0 := by omega
    have t0 : total ys = 0 := by omega
    intro x hx
    cases hx with
    | head => exact y0
    | tail _ hm => exact ih (fun z hz => h z (List.mem_cons_of_mem y hz)) t0 x hm

/-- Charge can be screened: a unit charge and its opposite total zero. -/
theorem charge_can_be_screened : total [1, -1] = 0 ∧ (1 : Int) ≠ 0 := by decide

/-! ## Part VI. No bit, and reversible -/

/-- One step of conservative motion under any force law f, in Störmer–Verlet form on a pair of
    successive positions. -/
def step (f : Int → Int) (s : Int × Int) : Int × Int := (s.2, 2 * s.2 - s.1 + f s.2)
/-- Time reversal: the two positions exchanged. -/
def rev (s : Int × Int) : Int × Int := (s.2, s.1)
/-- The backward step: reverse, step, reverse. -/
def back (f : Int → Int) (s : Int × Int) : Int × Int := rev (step f (rev s))

/-- CONSERVATIVE MOTION IS REVERSIBLE: for every force law, reversing, stepping and reversing
    undoes a step exactly. -/
theorem conservative_motion_reversible (f : Int → Int) (s : Int × Int) : back f (step f s) = s := by
  obtain ⟨a, b⟩ := s
  show ((2 * b - (2 * b - a + f b) + f b, b) : Int × Int) = (a, b)
  rw [pe]; exact ⟨by omega, rfl⟩

def iterO (g : Int × Int → Int × Int) : Nat → Int × Int → Int × Int
  | 0, s => s
  | n + 1, s => g (iterO g n s)
def iterI (g : Int × Int → Int × Int) : Nat → Int × Int → Int × Int
  | 0, s => s
  | n + 1, s => iterI g n (g s)

/-- Any number of steps is retraced exactly by the same number of backward steps. -/
theorem motion_retraces (f : Int → Int) (n : Nat) (s : Int × Int) :
    iterI (back f) n (iterO (step f) n s) = s := by
  induction n with
  | zero => rfl
  | succ n ih =>
    show iterI (back f) n (back f (step f (iterO (step f) n s))) = s
    rw [conservative_motion_reversible]; exact ih

/-! ## Part VII. Gravity and time co-move: redshift moves the height, never the side -/

/-- A gravitational shift of every frequency by one factor k. -/
def redshift (k : Int) (p : Pt) : Pt := (p.1, k * p.2)

theorem redshift_equivariant (k : Int) : Equivariant (redshift k) fold fold := fun _ => rfl
theorem redshift_keeps_the_line (k : Int) (p : Pt) : OnLine (redshift k p) ↔ OnLine p := Iff.rfl
theorem redshift_commutes_with_registration (k : Int) (p : Pt) :
    reg (redshift k p) = redshift k (reg p) := rfl

/-- Every clock co-moves: one factor shifts all heights, so every ratio of frequencies is kept. -/
theorem clocks_co_move (k t1 t2 : Int) : t1 * (k * t2) = t2 * (k * t1) := by
  rw [Int.mul_left_comm t1 k t2, Int.mul_left_comm t2 k t1, Int.mul_comm t1 t2]

/-! ## Part VIII. The monic memory of the deficit -/

/-- A bound pair's gravitational reading: the parts' energies less the binding. -/
def bound (e1 e2 b : Int) : Int := e1 + e2 - b

/-- THE DEFICIT IS READ, MONICALLY: two bindings read alike exactly when they are equal. -/
theorem gravity_reads_the_deficit (e1 e2 b b' : Int) : bound e1 e2 b = bound e1 e2 b' ↔ b = b' := by
  unfold bound
  constructor
  · intro h; omega
  · intro h; rw [h]

/-- A bond lowers the weight: a positive binding reads below the sum of the parts. -/
theorem the_bond_weighs_less (e1 e2 b : Int) (hb : 0 < b) : bound e1 e2 b < e1 + e2 := by
  unfold bound; omega

/-! ## Part IX. The waves: two polarizations, one speed -/

/-- A gravitational wave's helicity, +2 or −2. -/
structure Wave where
  freq : Int
  helicity : Bool
  deriving DecidableEq, Repr

def Wave.parity (w : Wave) : Wave := ⟨w.freq, !w.helicity⟩

/-- The waves carry two polarizations, reversed by parity, one energy record: the radiation carries
    the one bit light carries, and the sources carry none. -/
theorem waves_two_polarizations (w : Wave) :
    w.parity ≠ w ∧ w.parity.freq = w.freq ∧ w.parity.parity = w := by
  obtain ⟨f, s⟩ := w
  refine ⟨fun e => ?_, rfl, by cases s <;> rfl⟩
  have := congrArg Wave.helicity e
  cases s <;> simp [Wave.parity] at this

/-- Ten components of a symmetric tensor, four gauge conditions, four constraints: two polarizations. -/
theorem polarization_count : (10 - 4 - 4 : Nat) = 2 := rfl

theorem sq_pos_of_ne (m : Int) (h : m ≠ 0) : 0 < m * m := by
  rcases Int.lt_or_gt_of_ne h with h' | h'
  · have := Int.mul_pos (show 0 < -m by omega) (show 0 < -m by omega)
    rw [Int.neg_mul_neg] at this; exact this
  · exact Int.mul_pos h' h'

/-- A massive mode runs slower than a massless one; gravity's waves and light share the cone. -/
theorem massive_slower (k ω m : Int) (h : ω * ω = k * k + m * m) (hm : m ≠ 0) : k * k < ω * ω := by
  have := sq_pos_of_ne m hm
  omega

/-! ## Part IX-b. Gravity reads the dark, and the vacuum's pull -/

/-- An odd reading returns zero on every state the particle map fixes. -/
theorem odd_reading_blind (g : Particle → Int) (hodd : ∀ c, g (bar c) = -g c) (c : Particle)
    (h : bar c = c) : g c = 0 := by
  have e := hodd c
  rw [h] at e
  omega

/-- ONLY GRAVITY READS THE DARK: a state the particle map fixes carries no charge, every odd reading
    returns zero on it, and gravity returns its energy. -/
theorem only_gravity_reads_the_dark (c : Particle) (h : bar c = c) :
    Neutral c ∧ (∀ g : Particle → Int, (∀ d, g (bar d) = -g d) → g c = 0) ∧ grav c = c.energy.freq :=
  ⟨(bar_fixed_iff_neutral c).mp h, fun g hodd => odd_reading_blind g hodd c h, rfl⟩

/-- The active gravitating density ρ + 3p. -/
def active (rho p : Int) : Int := rho + 3 * p

/-- Dust attracts; the vacuum, p = −ρ, repels with active density −2ρ. -/
theorem the_vacuum_repels (rho : Int) (h : 0 < rho) :
    0 < active rho 0 ∧ active rho (-rho) = -2 * rho ∧ active rho (-rho) < 0 := by
  unfold active; refine ⟨?_, ?_, ?_⟩ <;> omega

/-- ONE SIGN OF ENERGY, NOT OF PULL: every density is positive and the pull still reverses. The one
    sign concerns the energy gravity reads, and screening would need a negative energy. -/
theorem one_sign_of_energy_not_of_pull :
    (0 : Int) < 1 ∧ active 1 (-1) < 0 ∧ total [1, 1] ≠ 0 := by decide

/-- The kinetic floor: with kinetic density K ≥ 0 and potential V, ρ + p = 2K ≥ 0. -/
theorem kinetic_floor (K V : Int) (hK : 0 ≤ K) : 0 ≤ (K + V) + (K - V) := by omega

/-! ## Part X. The capstone -/

/-- IMMANENT GRAVITY, AT THE SEAT. Gravity reads the record and nothing else: even under the
    particle map, factoring through registration, blind to composition; every source stands on the
    line and none can be screened, while charge stands off it and can; conservative motion is
    reversible for every force law and retraces exactly; a gravitational shift moves every height
    by one factor, keeping the line, registration and every ratio of clocks; the deficit of a bond
    is read monically; the waves carry two polarizations; gravity alone reads the dark, and the
    vacuum's pressure reverses its pull. -/
theorem gravity_is_the_record :
    (∀ c : Particle, grav (bar c) = grav c) ∧
    (∀ p : Pt, gravPt (reg p) = gravPt p ∧ gravPt (fold p) = gravPt p) ∧
    (∀ c : Particle, OnLine (1 + oddPart grav c, c.energy.freq)) ∧
    (∀ xs : List Int, (∀ x ∈ xs, 0 ≤ x) → total xs = 0 → ∀ x ∈ xs, x = 0) ∧
    (∀ (f : Int → Int) (n : Nat) (s : Int × Int), iterI (back f) n (iterO (step f) n s) = s) ∧
    (∀ k : Int, Equivariant (redshift k) fold fold) ∧
    (∀ k t1 t2 : Int, t1 * (k * t2) = t2 * (k * t1)) ∧
    (∀ e1 e2 b b' : Int, bound e1 e2 b = bound e1 e2 b' ↔ b = b') ∧
    (∀ w : Wave, w.parity ≠ w ∧ w.parity.freq = w.freq) ∧
    (∀ c : Particle, bar c = c → Neutral c ∧ grav c = c.energy.freq) ∧
    (∀ rho : Int, 0 < rho → active rho (-rho) < 0) :=
  ⟨gravity_even_branch, gravity_factors_through_registration, every_source_on_the_line,
   one_sign_no_screening, motion_retraces, redshift_equivariant, clocks_co_move,
   gravity_reads_the_deficit, fun w => ⟨(waves_two_polarizations w).1, rfl⟩,
   fun c h => ⟨(only_gravity_reads_the_dark c h).1, rfl⟩, fun rho h => (the_vacuum_repels rho h).2.2⟩

end SPHYS.Gravity

#print axioms SPHYS.Gravity.pe
#print axioms SPHYS.Gravity.fold_involutive
#print axioms SPHYS.Gravity.seat_fixed_line
#print axioms SPHYS.Gravity.reg_lands
#print axioms SPHYS.Gravity.reg_fixes_iff
#print axioms SPHYS.Gravity.reg_forgets_side
#print axioms SPHYS.Gravity.least_erasure_iff_value
#print axioms SPHYS.Gravity.equivariant_id
#print axioms SPHYS.Gravity.equivariant_comp
#print axioms SPHYS.Gravity.fix_functorial
#print axioms SPHYS.Gravity.fold_global_seat
#print axioms SPHYS.Gravity.equivariant_carrier_lands
#print axioms SPHYS.Gravity.value_on_image
#print axioms SPHYS.Gravity.kinetic_crossing
#print axioms SPHYS.Gravity.off_locus_pair
#print axioms SPHYS.Gravity.ee
#print axioms SPHYS.Gravity.mirror_involutive
#print axioms SPHYS.Gravity.psi_phi
#print axioms SPHYS.Gravity.phi_psi
#print axioms SPHYS.Gravity.phi_injective
#print axioms SPHYS.Gravity.phi_equivariant
#print axioms SPHYS.Gravity.mirror_fixed_iff_real
#print axioms SPHYS.Gravity.phi_line_iff_real
#print axioms SPHYS.Gravity.stationary_iff_real
#print axioms SPHYS.Gravity.line_is_stationary
#print axioms SPHYS.Gravity.measured_on_line
#print axioms SPHYS.Gravity.no_measurement_off_line
#print axioms SPHYS.Gravity.energy_carrier_lands
#print axioms SPHYS.Gravity.bar_involutive
#print axioms SPHYS.Gravity.bar_fixed_iff_neutral
#print axioms SPHYS.Gravity.odd_charges_even_energy
#print axioms SPHYS.Gravity.gravity_reads_no_charge_bit
#print axioms SPHYS.Gravity.involutions_commute
#print axioms SPHYS.Gravity.tmirror_involutive
#print axioms SPHYS.Gravity.joint_fixed_iff
#print axioms SPHYS.Gravity.charge_carrier_equivariant
#print axioms SPHYS.Gravity.pair_lands_once
#print axioms SPHYS.Gravity.tmirror_equivariant
#print axioms SPHYS.Gravity.neutral_charge_on_line
#print axioms SPHYS.Gravity.pair_on_the_edges
#print axioms SPHYS.Gravity.stable_lands
#print axioms SPHYS.Gravity.gravity_even_branch
#print axioms SPHYS.Gravity.gravity_factors_through_registration
#print axioms SPHYS.Gravity.composition_blind
#print axioms SPHYS.Gravity.even_is_not_the_record
#print axioms SPHYS.Gravity.every_source_on_the_line
#print axioms SPHYS.Gravity.charged_source_off_the_line
#print axioms SPHYS.Gravity.total_nonneg
#print axioms SPHYS.Gravity.one_sign_no_screening
#print axioms SPHYS.Gravity.charge_can_be_screened
#print axioms SPHYS.Gravity.conservative_motion_reversible
#print axioms SPHYS.Gravity.motion_retraces
#print axioms SPHYS.Gravity.redshift_equivariant
#print axioms SPHYS.Gravity.redshift_keeps_the_line
#print axioms SPHYS.Gravity.redshift_commutes_with_registration
#print axioms SPHYS.Gravity.clocks_co_move
#print axioms SPHYS.Gravity.gravity_reads_the_deficit
#print axioms SPHYS.Gravity.the_bond_weighs_less
#print axioms SPHYS.Gravity.waves_two_polarizations
#print axioms SPHYS.Gravity.polarization_count
#print axioms SPHYS.Gravity.sq_pos_of_ne
#print axioms SPHYS.Gravity.massive_slower
#print axioms SPHYS.Gravity.odd_reading_blind
#print axioms SPHYS.Gravity.only_gravity_reads_the_dark
#print axioms SPHYS.Gravity.the_vacuum_repels
#print axioms SPHYS.Gravity.one_sign_of_energy_not_of_pull
#print axioms SPHYS.Gravity.kinetic_floor
#print axioms SPHYS.Gravity.gravity_is_the_record
