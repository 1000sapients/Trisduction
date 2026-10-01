/-
  SPHYS_Horizon.lean · the horizon is the registration, read at the Riemann seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: h = 2 Re s, t = Im s; the fold s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t), the critical line h = 1.

  Part I     the seat, the category of involutions, the functor of the seat.
  Part II    the energy carrier (resident).
  Part III   the substrate (resident).
  Part IV     The horizon keeps three numbers.
  Part V      The area cannot decrease.
  Part VI     The capstone.
-/
set_option autoImplicit false
namespace SPHYS.Horizon


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


/-! ## Part IV. The horizon keeps three numbers -/

/-- What falls in: its mass, charge, angular momentum and baryon number. -/
structure Infall where
  m : Int
  q : Int
  j : Int
  b : Int
  deriving DecidableEq, Repr

/-- Exchanging matter for antimatter of the same mass, charge and spin flips baryon number alone. -/
def bflip (s : Infall) : Infall := ⟨s.m, s.q, s.j, -s.b⟩

theorem bflip_involutive (s : Infall) : bflip (bflip s) = s := by
  obtain ⟨m, q, j, b⟩ := s; show (⟨m, q, j, - -b⟩ : Infall) = ⟨m, q, j, b⟩; rw [Int.neg_neg]

/-- The hole's exterior record: mass, charge, spin. -/
def hair (s : Infall) : Int × Int × Int := (s.m, s.q, s.j)

/-- THE HORIZON FORGETS BARYON NUMBER: the exterior record is even under the exchange. -/
theorem hair_forgets_baryons (s : Infall) : hair (bflip s) = hair s := rfl

/-- The horizon carrier: baryon number is the offset from the line, mass the height. -/
def horizonSeat (s : Infall) : Pt := (1 + s.b, s.m)

theorem horizon_carrier_equivariant : Equivariant horizonSeat bflip fold := by
  intro s
  show ((1 + -s.b, s.m) : Pt) = (2 - (1 + s.b), s.m)
  rw [pe]; exact ⟨by omega, rfl⟩

theorem baryon_free_is_the_line (s : Infall) : OnLine (horizonSeat s) ↔ s.b = 0 := by
  show 1 + s.b = 1 ↔ s.b = 0
  exact ⟨fun h => by omega, fun h => by omega⟩

/-- THE HORIZON IS THE REGISTRATION: the hole's record of what fell in is the seat's registration
    read on the horizon carrier, keeping the height and forgetting the side. -/
theorem the_horizon_is_the_registration (s : Infall) :
    reg (horizonSeat (bflip s)) = reg (horizonSeat s) ∧ hair (bflip s) = hair s := by
  refine ⟨?_, rfl⟩
  rw [horizon_carrier_equivariant s]; exact reg_forgets_side _

/-- No reading of the hair returns the baryon number. -/
theorem no_hair_reading_returns_baryons (g : Int × Int × Int → Int) : ¬ ∀ s : Infall, g (hair s) = s.b := by
  intro hg
  have h1 := hg ⟨1, 0, 0, 1⟩
  have h2 := hg ⟨1, 0, 0, -1⟩
  change g (1, 0, 0) = 1 at h1; change g (1, 0, 0) = -1 at h2
  omega

def isum : List Int → Int
  | [] => 0
  | x :: xs => x + isum xs

def holeHair (l : List Infall) : Int × Int × Int :=
  (isum (l.map (·.m)), isum (l.map (·.q)), isum (l.map (·.j)))
def holeBaryons (l : List Infall) : Int := isum (l.map (·.b))

theorem sum_m_flip (l : List Infall) : isum ((l.map bflip).map (·.m)) = isum (l.map (·.m)) := by
  induction l with
  | nil => rfl
  | cons a t ih => simp only [List.map_cons, isum] at *; rw [ih]; rfl

theorem sum_q_flip (l : List Infall) : isum ((l.map bflip).map (·.q)) = isum (l.map (·.q)) := by
  induction l with
  | nil => rfl
  | cons a t ih => simp only [List.map_cons, isum] at *; rw [ih]; rfl

theorem sum_j_flip (l : List Infall) : isum ((l.map bflip).map (·.j)) = isum (l.map (·.j)) := by
  induction l with
  | nil => rfl
  | cons a t ih => simp only [List.map_cons, isum] at *; rw [ih]; rfl

theorem sum_b_flip (l : List Infall) : isum ((l.map bflip).map (·.b)) = - isum (l.map (·.b)) := by
  induction l with
  | nil => rfl
  | cons a t ih =>
    simp only [List.map_cons, isum] at *; rw [ih]
    show -a.b + -isum (List.map (·.b) t) = -(a.b + isum (List.map (·.b) t)); omega

/-- A HOLE OF MATTER AND A HOLE OF ANTIMATTER LEAVE ONE RECORD: whatever fell in, the exchanged
    infall builds a hole with the same hair and the opposite baryon number. -/
theorem matter_hole_antimatter_hole_one_record (l : List Infall) :
    holeHair (l.map bflip) = holeHair l ∧ holeBaryons (l.map bflip) = - holeBaryons l := by
  refine ⟨?_, sum_b_flip l⟩
  unfold holeHair
  rw [sum_m_flip, sum_q_flip, sum_j_flip]

/-! ## Part V. The area cannot decrease -/

/-- THE HORIZON CANNOT BE UNDONE: no map recovers what fell in from the registration. -/
theorem the_horizon_cannot_be_undone : ¬ ∃ g : Pt → Pt, ∀ p, g (reg p) = p := by
  intro ⟨g, hg⟩
  have h1 := hg (0, 0)
  have h2 := hg (fold (0, 0))
  rw [reg_forgets_side, h1] at h2
  have := congrArg Prod.fst h2
  change (0 : Int) = 2 - 0 at this
  omega

/-- Merging releases energy without breaking the area law: (m₁ + m₂)² ≥ m₁² + m₂². -/
theorem merger_can_radiate (m1 m2 : Int) (h1 : 0 ≤ m1) (h2 : 0 ≤ m2) :
    m1 * m1 + m2 * m2 ≤ (m1 + m2) * (m1 + m2) := by
  have := Int.mul_nonneg h1 h2
  simp only [Int.add_mul, Int.mul_add]
  rw [Int.mul_comm m2 m1]; omega

/-- THE AREA LAW BOUNDS THE RADIATION: two equal holes of mass m whose merger keeps the summed area,
    (2m − E)² ≥ 2m², radiate an energy E below three tenths of their mass. -/
theorem merger_radiates_under_three_tenths (m E : Int) (hm : 0 < m) (_hE : 0 ≤ E) (hE2 : E ≤ 2 * m)
    (harea : 2 * (m * m) ≤ (2 * m - E) * (2 * m - E)) : 10 * E < 6 * m := by
  apply Int.lt_of_not_ge
  intro hc
  have hx : 0 ≤ 2 * m - E := by omega
  have h5 : 5 * (2 * m - E) ≤ 7 * m := by omega
  have a1 : (5 * (2 * m - E)) * (5 * (2 * m - E)) ≤ (7 * m) * (5 * (2 * m - E)) :=
    Int.mul_le_mul_of_nonneg_right h5 (by omega)
  have a2 : (7 * m) * (5 * (2 * m - E)) ≤ (7 * m) * (7 * m) :=
    Int.mul_le_mul_of_nonneg_left h5 (by omega)
  have p : 0 < m * m := Int.mul_pos hm hm
  have e1 : (5 * (2 * m - E)) * (5 * (2 * m - E)) = 25 * ((2 * m - E) * (2 * m - E)) := by
    simp only [Int.mul_assoc, Int.mul_left_comm (2 * m - E) 5]; omega
  have e2 : (7 * m) * (7 * m) = 49 * (m * m) := by
    simp only [Int.mul_assoc, Int.mul_left_comm m 7]; omega
  omega

/-! ## Part VI. The capstone -/

/-- THE HORIZON IS THE REGISTRATION. Exchanging matter for antimatter of one mass, charge and spin is
    carried onto the fold, and baryon-free infall onto the line; the hair is even under it, so the
    horizon keeps the height and forgets the side; no reading of the hair returns baryon number, for
    one infall or a whole history; the registration has no inverse; and the area law bounds what a
    merger radiates. -/
theorem the_horizon_is_the_registration_capstone :
    Equivariant horizonSeat bflip fold ∧
    (∀ s : Infall, OnLine (horizonSeat s) ↔ s.b = 0) ∧
    (∀ s : Infall, reg (horizonSeat (bflip s)) = reg (horizonSeat s) ∧ hair (bflip s) = hair s) ∧
    (∀ g : Int × Int × Int → Int, ¬ ∀ s : Infall, g (hair s) = s.b) ∧
    (∀ l : List Infall, holeHair (l.map bflip) = holeHair l ∧ holeBaryons (l.map bflip) = - holeBaryons l) ∧
    (¬ ∃ g : Pt → Pt, ∀ p, g (reg p) = p) ∧
    (∀ m E : Int, 0 < m → 0 ≤ E → E ≤ 2 * m → 2 * (m * m) ≤ (2 * m - E) * (2 * m - E) → 10 * E < 6 * m) :=
  ⟨horizon_carrier_equivariant, baryon_free_is_the_line, the_horizon_is_the_registration,
   no_hair_reading_returns_baryons, matter_hole_antimatter_hole_one_record, the_horizon_cannot_be_undone,
   merger_radiates_under_three_tenths⟩

end SPHYS.Horizon

#print axioms SPHYS.Horizon.pe
#print axioms SPHYS.Horizon.fold_involutive
#print axioms SPHYS.Horizon.seat_fixed_line
#print axioms SPHYS.Horizon.reg_lands
#print axioms SPHYS.Horizon.reg_fixes_iff
#print axioms SPHYS.Horizon.reg_forgets_side
#print axioms SPHYS.Horizon.least_erasure_iff_value
#print axioms SPHYS.Horizon.equivariant_id
#print axioms SPHYS.Horizon.equivariant_comp
#print axioms SPHYS.Horizon.fix_functorial
#print axioms SPHYS.Horizon.fold_global_seat
#print axioms SPHYS.Horizon.equivariant_carrier_lands
#print axioms SPHYS.Horizon.value_on_image
#print axioms SPHYS.Horizon.kinetic_crossing
#print axioms SPHYS.Horizon.off_locus_pair
#print axioms SPHYS.Horizon.ee
#print axioms SPHYS.Horizon.mirror_involutive
#print axioms SPHYS.Horizon.psi_phi
#print axioms SPHYS.Horizon.phi_psi
#print axioms SPHYS.Horizon.phi_injective
#print axioms SPHYS.Horizon.phi_equivariant
#print axioms SPHYS.Horizon.mirror_fixed_iff_real
#print axioms SPHYS.Horizon.phi_line_iff_real
#print axioms SPHYS.Horizon.stationary_iff_real
#print axioms SPHYS.Horizon.line_is_stationary
#print axioms SPHYS.Horizon.measured_on_line
#print axioms SPHYS.Horizon.no_measurement_off_line
#print axioms SPHYS.Horizon.energy_carrier_lands
#print axioms SPHYS.Horizon.bar_involutive
#print axioms SPHYS.Horizon.bar_fixed_iff_neutral
#print axioms SPHYS.Horizon.odd_charges_even_energy
#print axioms SPHYS.Horizon.gravity_reads_no_charge_bit
#print axioms SPHYS.Horizon.involutions_commute
#print axioms SPHYS.Horizon.tmirror_involutive
#print axioms SPHYS.Horizon.joint_fixed_iff
#print axioms SPHYS.Horizon.charge_carrier_equivariant
#print axioms SPHYS.Horizon.pair_lands_once
#print axioms SPHYS.Horizon.tmirror_equivariant
#print axioms SPHYS.Horizon.neutral_charge_on_line
#print axioms SPHYS.Horizon.pair_on_the_edges
#print axioms SPHYS.Horizon.stable_lands
#print axioms SPHYS.Horizon.bflip_involutive
#print axioms SPHYS.Horizon.hair_forgets_baryons
#print axioms SPHYS.Horizon.horizon_carrier_equivariant
#print axioms SPHYS.Horizon.baryon_free_is_the_line
#print axioms SPHYS.Horizon.the_horizon_is_the_registration
#print axioms SPHYS.Horizon.no_hair_reading_returns_baryons
#print axioms SPHYS.Horizon.sum_m_flip
#print axioms SPHYS.Horizon.sum_q_flip
#print axioms SPHYS.Horizon.sum_j_flip
#print axioms SPHYS.Horizon.sum_b_flip
#print axioms SPHYS.Horizon.matter_hole_antimatter_hole_one_record
#print axioms SPHYS.Horizon.the_horizon_cannot_be_undone
#print axioms SPHYS.Horizon.merger_can_radiate
#print axioms SPHYS.Horizon.merger_radiates_under_three_tenths
#print axioms SPHYS.Horizon.the_horizon_is_the_registration_capstone
