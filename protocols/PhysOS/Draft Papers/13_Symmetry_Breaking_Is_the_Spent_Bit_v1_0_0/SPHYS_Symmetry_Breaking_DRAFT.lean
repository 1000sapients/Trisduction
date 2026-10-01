/-
  SPHYS_Symmetry_Breaking.lean · the vacuum spends one bit, read at the Riemann seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: h = 2 Re s, t = Im s; the fold s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t), the critical line h = 1.

  Part I     the seat, the category of involutions, the functor of the seat.
  Part II    the energy carrier (resident).
  Part III   the substrate (resident).
  Part IV     The double well and its fold.
  Part V      The vacuum leaves the line.
  Part VI     Mass is the curvature of the depth.
  Part VII    Heat restores the line.
  Part VIII   The capstone.
-/
set_option autoImplicit false
namespace SPHYS.SymmetryBreaking


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


/-! ## Part IV. The double well and its fold -/

/-- The double well, V(x) = (x² − a)², with a = v² the square of the vacuum value. -/
def V (a x : Int) : Int := (x * x - a) * (x * x - a)

theorem V_even (a x : Int) : V a (-x) = V a x := by unfold V; rw [Int.neg_mul_neg]

theorem sq_nonneg' (x : Int) : 0 ≤ x * x := by
  rcases Int.le_total 0 x with h | h
  · exact Int.mul_nonneg h h
  · have h' : 0 ≤ -x := by omega
    have := Int.mul_nonneg h' h'
    rw [Int.neg_mul_neg] at this; exact this

theorem V_nonneg (a x : Int) : 0 ≤ V a x := sq_nonneg' _

/-- The vacuum carrier: the field value is the offset from the line, the energy the height. -/
def vacSeat (a x : Int) : Pt := (1 + x, V a x)

/-- THE FIELD'S REFLECTION IS THE FOLD. -/
theorem vacuum_carrier_equivariant (a : Int) : Equivariant (vacSeat a) (fun x => -x) fold := by
  intro x
  show ((1 + -x, V a (-x)) : Pt) = (2 - (1 + x), V a x)
  rw [pe, V_even]; exact ⟨by omega, rfl⟩

theorem symmetric_point_is_the_line (a x : Int) : OnLine (vacSeat a x) ↔ x = 0 := by
  show 1 + x = 1 ↔ x = 0
  exact ⟨fun h => by omega, fun h => by omega⟩

/-! ## Part V. The vacuum leaves the line -/

theorem sq_pos_of_ne (v : Int) (h : v ≠ 0) : 0 < v * v := by
  rcases Int.lt_or_gt_of_ne h with h' | h'
  · have : 0 < -v := by omega
    have := Int.mul_pos this this
    rw [Int.neg_mul_neg] at this; exact this
  · exact Int.mul_pos h' h'

/-- THE GROUND IS OFF THE LINE: the vacua ±v carry zero energy, and the symmetric point carries v⁴. -/
theorem ground_is_off_the_line (v : Int) (h : v ≠ 0) :
    V (v * v) v = 0 ∧ V (v * v) (-v) = 0 ∧ 0 < V (v * v) 0 ∧ (∀ x, V (v * v) v ≤ V (v * v) x) := by
  have p := sq_pos_of_ne v h
  refine ⟨by unfold V; rw [Int.sub_self, Int.zero_mul], by rw [V_even]; unfold V; rw [Int.sub_self, Int.zero_mul], ?_, ?_⟩
  · unfold V
    show 0 < (0 * 0 - v * v) * (0 * 0 - v * v)
    have : (0 * 0 - v * v) = -(v * v) := by omega
    rw [this, Int.neg_mul_neg]; exact Int.mul_pos p p
  · intro x
    have e : V (v * v) v = 0 := by unfold V; rw [Int.sub_self, Int.zero_mul]
    rw [e]; exact V_nonneg _ x

/-- TWO VACUA, ONE RECORD: the vacua land on two distinct points off the line, exchanged by the
    fold, at one energy, and the registration reads one record for both. -/
theorem two_vacua_one_record (v : Int) (h : v ≠ 0) :
    vacSeat (v * v) (-v) = fold (vacSeat (v * v) v) ∧ vacSeat (v * v) (-v) ≠ vacSeat (v * v) v ∧
    ¬ OnLine (vacSeat (v * v) v) ∧ reg (vacSeat (v * v) (-v)) = reg (vacSeat (v * v) v) := by
  refine ⟨vacuum_carrier_equivariant (v * v) v, fun e => h ?_, fun e => h ((symmetric_point_is_the_line _ v).mp e), ?_⟩
  · have := congrArg Prod.fst e
    change 1 + -v = 1 + v at this; omega
  · rw [vacuum_carrier_equivariant (v * v) v]; exact reg_forgets_side _

/-- THE VACUUM'S CHOICE IS KEYED: no reading even under the reflection returns which vacuum holds. -/
theorem the_vacuum_is_keyed (f : Int → Bool) (hf : ∀ x, f (-x) = f x) (v : Int) (h : 0 < v) :
    ¬ ∀ x, f x = decide (0 < x) := by
  intro hx
  have a := hx v
  have b := hx (-v)
  rw [hf, a] at b
  have t : decide (0 < v) = true := decide_eq_true h
  have u : decide (0 < -v) = false := decide_eq_false (by omega)
  rw [t, u] at b; exact Bool.noConfusion b

/-! ## Part VI. Mass is the curvature of the depth -/

/-- At the symmetric point the well curves down: the second difference is 2 − 4a. -/
theorem curvature_at_line (a : Int) : V a 1 - 2 * V a 0 + V a (-1) = 2 - 4 * a := by
  unfold V; simp only [Int.mul_one, Int.mul_zero, Int.neg_mul_neg, Int.sub_mul, Int.mul_sub, Int.one_mul,
    Int.mul_one, Int.zero_sub]
  omega

/-- At the vacuum it curves up: the second difference is 8v² + 2. -/
theorem curvature_at_vacuum (v : Int) :
    V (v * v) (v + 1) - 2 * V (v * v) v + V (v * v) (v - 1) = 8 * (v * v) + 2 := by
  unfold V
  have h1 : (v + 1) * (v + 1) - v * v = 2 * v + 1 := by
    simp only [Int.add_mul, Int.mul_add, Int.mul_one, Int.one_mul]; omega
  have h2 : (v - 1) * (v - 1) - v * v = 1 - 2 * v := by
    simp only [Int.sub_mul, Int.mul_sub, Int.mul_one, Int.one_mul]; omega
  rw [h1, h2, Int.sub_self, Int.zero_mul]
  simp only [Int.add_mul, Int.mul_add, Int.sub_mul, Int.mul_sub, Int.mul_one, Int.one_mul]
  rw [Int.mul_assoc 2 v (2 * v), Int.mul_comm v (2 * v), Int.mul_assoc 2 v v] at *
  omega

/-- MASS IS THE CURVATURE OF THE DEPTH: for a nonzero vacuum the symmetric point is curved down,
    unstable, and the vacuum curved up, its curvature the mass squared. -/
theorem mass_is_the_curvature_of_the_depth (v : Int) (h : v ≠ 0) :
    V (v * v) 1 - 2 * V (v * v) 0 + V (v * v) (-1) < 0 ∧
    0 < V (v * v) (v + 1) - 2 * V (v * v) v + V (v * v) (v - 1) := by
  have p := sq_pos_of_ne v h
  rw [curvature_at_line, curvature_at_vacuum]
  constructor <;> omega

/-! ## Part VII. Heat restores the line -/

/-- The well at temperature: an even term c·x² added, the thermal mass. -/
def Vt (a c x : Int) : Int := V a x + c * (x * x)

theorem expand_V (a x : Int) : V a x = (x * x) * (x * x) - 2 * (a * (x * x)) + a * a := by
  unfold V; simp only [Int.sub_mul, Int.mul_sub]; rw [Int.mul_comm (x * x) a]; omega

/-- HEAT RESTORES THE LINE: once the thermal term outweighs twice a, the symmetric point is the
    ground. -/
theorem heat_restores_the_line (a c x : Int) (h : 2 * a ≤ c) : Vt a c 0 ≤ Vt a c x := by
  unfold Vt
  rw [expand_V, expand_V]
  have X := sq_nonneg' x
  have XX := sq_nonneg' (x * x)
  have k : 0 ≤ (c - 2 * a) * (x * x) := Int.mul_nonneg (by omega) X
  simp only [Int.sub_mul] at k
  rw [Int.mul_assoc 2 a (x * x)] at k
  simp only [Int.mul_zero, Int.zero_mul, Int.zero_sub, Int.mul_zero]
  omega

/-! ## Part VIII. The capstone -/

/-- THE VACUUM SPENDS ONE BIT. The field's reflection is the fold and the symmetric point the line;
    the ground is off the line, two vacua with one energy and one registration; no even reading
    returns which vacuum holds; the symmetric point curves down and the vacuum up, the curvature the
    mass; and heat restores the line. -/
theorem the_vacuum_spends_one_bit :
    (∀ a : Int, Equivariant (vacSeat a) (fun x => -x) fold) ∧
    (∀ a x : Int, OnLine (vacSeat a x) ↔ x = 0) ∧
    (∀ v : Int, v ≠ 0 → ¬ OnLine (vacSeat (v * v) v) ∧ reg (vacSeat (v * v) (-v)) = reg (vacSeat (v * v) v)) ∧
    (∀ (f : Int → Bool), (∀ x, f (-x) = f x) → ∀ v : Int, 0 < v → ¬ ∀ x, f x = decide (0 < x)) ∧
    (∀ v : Int, v ≠ 0 → V (v * v) 1 - 2 * V (v * v) 0 + V (v * v) (-1) < 0 ∧
      0 < V (v * v) (v + 1) - 2 * V (v * v) v + V (v * v) (v - 1)) ∧
    (∀ a c x : Int, 2 * a ≤ c → Vt a c 0 ≤ Vt a c x) :=
  ⟨vacuum_carrier_equivariant, symmetric_point_is_the_line,
   fun v h => ⟨(two_vacua_one_record v h).2.2.1, (two_vacua_one_record v h).2.2.2⟩,
   the_vacuum_is_keyed, mass_is_the_curvature_of_the_depth, heat_restores_the_line⟩

end SPHYS.SymmetryBreaking

#print axioms SPHYS.SymmetryBreaking.pe
#print axioms SPHYS.SymmetryBreaking.fold_involutive
#print axioms SPHYS.SymmetryBreaking.seat_fixed_line
#print axioms SPHYS.SymmetryBreaking.reg_lands
#print axioms SPHYS.SymmetryBreaking.reg_fixes_iff
#print axioms SPHYS.SymmetryBreaking.reg_forgets_side
#print axioms SPHYS.SymmetryBreaking.least_erasure_iff_value
#print axioms SPHYS.SymmetryBreaking.equivariant_id
#print axioms SPHYS.SymmetryBreaking.equivariant_comp
#print axioms SPHYS.SymmetryBreaking.fix_functorial
#print axioms SPHYS.SymmetryBreaking.fold_global_seat
#print axioms SPHYS.SymmetryBreaking.equivariant_carrier_lands
#print axioms SPHYS.SymmetryBreaking.value_on_image
#print axioms SPHYS.SymmetryBreaking.kinetic_crossing
#print axioms SPHYS.SymmetryBreaking.off_locus_pair
#print axioms SPHYS.SymmetryBreaking.ee
#print axioms SPHYS.SymmetryBreaking.mirror_involutive
#print axioms SPHYS.SymmetryBreaking.psi_phi
#print axioms SPHYS.SymmetryBreaking.phi_psi
#print axioms SPHYS.SymmetryBreaking.phi_injective
#print axioms SPHYS.SymmetryBreaking.phi_equivariant
#print axioms SPHYS.SymmetryBreaking.mirror_fixed_iff_real
#print axioms SPHYS.SymmetryBreaking.phi_line_iff_real
#print axioms SPHYS.SymmetryBreaking.stationary_iff_real
#print axioms SPHYS.SymmetryBreaking.line_is_stationary
#print axioms SPHYS.SymmetryBreaking.measured_on_line
#print axioms SPHYS.SymmetryBreaking.no_measurement_off_line
#print axioms SPHYS.SymmetryBreaking.energy_carrier_lands
#print axioms SPHYS.SymmetryBreaking.bar_involutive
#print axioms SPHYS.SymmetryBreaking.bar_fixed_iff_neutral
#print axioms SPHYS.SymmetryBreaking.odd_charges_even_energy
#print axioms SPHYS.SymmetryBreaking.gravity_reads_no_charge_bit
#print axioms SPHYS.SymmetryBreaking.involutions_commute
#print axioms SPHYS.SymmetryBreaking.tmirror_involutive
#print axioms SPHYS.SymmetryBreaking.joint_fixed_iff
#print axioms SPHYS.SymmetryBreaking.charge_carrier_equivariant
#print axioms SPHYS.SymmetryBreaking.pair_lands_once
#print axioms SPHYS.SymmetryBreaking.tmirror_equivariant
#print axioms SPHYS.SymmetryBreaking.neutral_charge_on_line
#print axioms SPHYS.SymmetryBreaking.pair_on_the_edges
#print axioms SPHYS.SymmetryBreaking.stable_lands
#print axioms SPHYS.SymmetryBreaking.V_even
#print axioms SPHYS.SymmetryBreaking.sq_nonneg'
#print axioms SPHYS.SymmetryBreaking.V_nonneg
#print axioms SPHYS.SymmetryBreaking.vacuum_carrier_equivariant
#print axioms SPHYS.SymmetryBreaking.symmetric_point_is_the_line
#print axioms SPHYS.SymmetryBreaking.sq_pos_of_ne
#print axioms SPHYS.SymmetryBreaking.ground_is_off_the_line
#print axioms SPHYS.SymmetryBreaking.two_vacua_one_record
#print axioms SPHYS.SymmetryBreaking.the_vacuum_is_keyed
#print axioms SPHYS.SymmetryBreaking.curvature_at_line
#print axioms SPHYS.SymmetryBreaking.curvature_at_vacuum
#print axioms SPHYS.SymmetryBreaking.mass_is_the_curvature_of_the_depth
#print axioms SPHYS.SymmetryBreaking.expand_V
#print axioms SPHYS.SymmetryBreaking.heat_restores_the_line
#print axioms SPHYS.SymmetryBreaking.the_vacuum_spends_one_bit
