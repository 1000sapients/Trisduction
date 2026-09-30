/-
  SPHYS_Electromagnetism.lean · electromagnetism read at the Riemann seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: h = 2 Re s, t = Im s; the fold s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t), the critical line
  h = 1. Two carriers land electromagnetism on the seat: the charge carrier (charge to the side),
  equivariant for charge conjugation, and the field carrier s = 1/2 + iF on the Riemann–Silberstein
  amplitude F = E + iB, equivariant for time reversal.

  Part I     the seat, the category of involutions, the functor of the seat.
  Part II    the energy carrier (resident from the hardware paper).
  Part III   the substrate: the particle map and the charge carrier.
  Part IV    the field on the seat: time reversal is the fold; the magnetic sign is the bit.
  Part V     duality: the quarter turn whose square is charge conjugation; light is null.
  Part VI    charge: the side, forced in thirds, conserved; the Aharonov–Bohm record.
  Part VII   gravity and magnetism, one registration in two branches.
  Part VIII  the capstone.
-/
set_option autoImplicit false
namespace SPHYS.Electromagnetism


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

/-! ## Part IV. The field on the seat: time reversal is the fold -/

/-- A field on one axis pair, the Riemann–Silberstein amplitude F = E + iB (units c = 1). -/
structure Field where
  E : Int
  B : Int
  deriving DecidableEq, Repr

/-- Time reversal keeps E and reverses B: complex conjugation of F. -/
def Field.T (f : Field) : Field := ⟨f.E, -f.B⟩
/-- Charge conjugation reverses both: F ↦ −F. -/
def Field.C (f : Field) : Field := ⟨-f.E, -f.B⟩
/-- Parity on the slice: E polar, B axial. -/
def Field.P (f : Field) : Field := ⟨-f.E, f.B⟩
/-- Duality: E ↦ B, B ↦ −E, multiplication of F by −i. -/
def Field.D (f : Field) : Field := ⟨f.B, -f.E⟩

def energyDensity (f : Field) : Int := f.E * f.E + f.B * f.B
def invariantEB (f : Field) : Int := f.E * f.B
def invariantEE (f : Field) : Int := f.E * f.E - f.B * f.B

/-- The field carrier: s = 1/2 + i F in the chart, h = 1 − B, t = E. -/
def fieldSeat (f : Field) : Pt := (1 - f.B, f.E)

theorem fe {a b c d : Int} : (⟨a, b⟩ : Field) = ⟨c, d⟩ ↔ a = c ∧ b = d :=
  ⟨fun e => ⟨congrArg Field.E e, congrArg Field.B e⟩,
   fun ⟨e1, e2⟩ => by subst e1; subst e2; rfl⟩

theorem T_involutive (f : Field) : f.T.T = f := by
  obtain ⟨e, b⟩ := f; show (⟨e, - -b⟩ : Field) = ⟨e, b⟩; rw [Int.neg_neg]
theorem C_involutive (f : Field) : f.C.C = f := by
  obtain ⟨e, b⟩ := f; show (⟨- -e, - -b⟩ : Field) = ⟨e, b⟩; rw [Int.neg_neg, Int.neg_neg]
theorem P_involutive (f : Field) : f.P.P = f := by
  obtain ⟨e, b⟩ := f; show (⟨- -e, b⟩ : Field) = ⟨e, b⟩; rw [Int.neg_neg]

/-- C and T compose to P, and CPT acts trivially on the field: E and B are each odd under exactly
    two of the three reflections. -/
theorem CT_is_P (f : Field) : f.T.C = f.P := by
  obtain ⟨e, b⟩ := f; show (⟨-e, - -b⟩ : Field) = ⟨-e, b⟩; rw [Int.neg_neg]
theorem CPT_trivial (f : Field) : f.T.P.C = f := by
  obtain ⟨e, b⟩ := f; show (⟨- -e, - -b⟩ : Field) = ⟨e, b⟩; rw [Int.neg_neg, Int.neg_neg]

/-- THE FIELD CARRIER IS EQUIVARIANT: time reversal of the field is the fold. -/
theorem field_carrier_equivariant : Equivariant fieldSeat Field.T fold := by
  intro f
  obtain ⟨e, b⟩ := f
  show ((1 - -b, e) : Pt) = (2 - (1 - b), e)
  rw [pe]; exact ⟨by omega, rfl⟩

theorem T_fixed_iff_electric (f : Field) : f.T = f ↔ f.B = 0 := by
  obtain ⟨e, b⟩ := f
  show (⟨e, -b⟩ : Field) = ⟨e, b⟩ ↔ b = 0
  rw [fe]; constructor
  · intro ⟨_, h⟩; omega
  · intro h; exact ⟨rfl, by omega⟩

/-- The line is the purely electric field: a field lands on the line exactly when B = 0. -/
theorem electric_on_the_line (f : Field) : OnLine (fieldSeat f) ↔ f.B = 0 := by
  obtain ⟨e, b⟩ := f
  show 1 - b = 1 ↔ b = 0
  exact ⟨fun h => by omega, fun h => by subst h; rfl⟩

/-- The field carrier, built from the symmetry: the time-even fields land on the line. -/
theorem field_carrier_lands :
    ∃ C : Carrier { f : Field // f.T = f }, ∀ w, C.ι w = fieldSeat w.1 :=
  equivariant_carrier_lands fieldSeat Field.T field_carrier_equivariant

/-- THE MAGNETIC SIGN IS THE BIT: a field with B ≠ 0 and its time reverse are two fields off the
    line with one electric record and one energy density. -/
theorem magnetic_sign_is_the_bit (f : Field) (h : f.B ≠ 0) :
    f.T ≠ f ∧ ¬ OnLine (fieldSeat f) ∧ f.T.E = f.E ∧ energyDensity f.T = energyDensity f ∧
    reg (fieldSeat f.T) = reg (fieldSeat f) := by
  refine ⟨fun e => h ((T_fixed_iff_electric f).mp e), fun e => h ((electric_on_the_line f).mp e),
    rfl, ?_, by rw [field_carrier_equivariant]; rfl⟩
  show f.E * f.E + -f.B * -f.B = f.E * f.E + f.B * f.B
  rw [Int.neg_mul_neg]

/-- The energy density is even under every reflection. -/
theorem energy_even (f : Field) :
    energyDensity f.T = energyDensity f ∧ energyDensity f.C = energyDensity f ∧
    energyDensity f.P = energyDensity f := by
  refine ⟨?_, ?_, ?_⟩
  · show f.E * f.E + -f.B * -f.B = _; rw [Int.neg_mul_neg]; rfl
  · show -f.E * -f.E + -f.B * -f.B = _; rw [Int.neg_mul_neg, Int.neg_mul_neg]; rfl
  · show -f.E * -f.E + f.B * f.B = _; rw [Int.neg_mul_neg]; rfl

/-- E·B is odd under time reversal and under parity, even under charge conjugation. -/
theorem EB_odd_under_T_and_P (f : Field) :
    invariantEB f.T = -invariantEB f ∧ invariantEB f.P = -invariantEB f ∧
    invariantEB f.C = invariantEB f := by
  refine ⟨?_, ?_, ?_⟩
  · show f.E * -f.B = -(f.E * f.B); rw [Int.mul_neg]
  · show -f.E * f.B = -(f.E * f.B); rw [Int.neg_mul]
  · show -f.E * -f.B = f.E * f.B; rw [Int.neg_mul_neg]

/-! ## Part V. Duality: the quarter turn whose square is charge conjugation -/

/-- THE RETURN IN THE FIELD: duality squared is charge conjugation, F ↦ (−i)² F = −F. -/
theorem duality_squared_is_C (f : Field) : f.D.D = f.C := rfl

theorem duality_fourth_is_identity (f : Field) : f.D.D.D.D = f := by
  obtain ⟨e, b⟩ := f; show (⟨- -e, - -b⟩ : Field) = ⟨e, b⟩; rw [Int.neg_neg, Int.neg_neg]

/-- Duality and time reversal anticommute, as −i and complex conjugation do: T D = C D T. -/
theorem duality_anticommutes_with_T (f : Field) : f.D.T = f.T.D.C := by
  obtain ⟨e, b⟩ := f
  show (⟨b, - -e⟩ : Field) = ⟨- -b, - -e⟩
  rw [Int.neg_neg, Int.neg_neg]

/-- The energy density is duality-invariant; both Lorentz invariants flip sign under duality. -/
theorem energy_duality_invariant (f : Field) : energyDensity f.D = energyDensity f := by
  show f.B * f.B + -f.E * -f.E = f.E * f.E + f.B * f.B
  rw [Int.neg_mul_neg, Int.add_comm]

theorem invariants_flip_under_duality (f : Field) :
    invariantEB f.D = -invariantEB f ∧ invariantEE f.D = -invariantEE f := by
  refine ⟨?_, ?_⟩
  · show f.B * -f.E = -(f.E * f.B); rw [Int.mul_neg, Int.mul_comm]
  · show f.B * f.B - -f.E * -f.E = -(f.E * f.E - f.B * f.B); rw [Int.neg_mul_neg]; omega

/-- A transverse field in the plane: E = (E1, E2), B = (B1, B2). -/
structure Wave where
  e1 : Int
  e2 : Int
  b1 : Int
  b2 : Int

def Wave.D (w : Wave) : Wave := ⟨w.b1, w.b2, -w.e1, -w.e2⟩
def Wave.dot (w : Wave) : Int := w.e1 * w.b1 + w.e2 * w.b2
def Wave.diff (w : Wave) : Int := (w.e1 * w.e1 + w.e2 * w.e2) - (w.b1 * w.b1 + w.b2 * w.b2)
def Wave.Null (w : Wave) : Prop := w.dot = 0 ∧ w.diff = 0

/-- LIGHT IS NULL: a plane wave E = (a, 0), B = (0, a) has both invariants zero at every amplitude. -/
theorem plane_wave_null (a : Int) : (Wave.mk a 0 0 a).Null := by
  refine ⟨?_, ?_⟩
  · show a * 0 + 0 * a = 0; rw [Int.mul_zero, Int.zero_mul]; rfl
  · show (a * a + 0 * 0) - (0 * 0 + a * a) = 0; rw [Int.mul_zero]; omega

/-- Duality keeps a null field null: light is the duality-neutral field. -/
theorem null_preserved_by_duality (w : Wave) (h : w.Null) : w.D.Null := by
  obtain ⟨h1, h2⟩ := h
  refine ⟨?_, ?_⟩
  · show w.b1 * -w.e1 + w.b2 * -w.e2 = 0
    have : w.e1 * w.b1 + w.e2 * w.b2 = 0 := h1
    rw [Int.mul_neg, Int.mul_neg, Int.mul_comm w.b1, Int.mul_comm w.b2]; omega
  · show (w.b1 * w.b1 + w.b2 * w.b2) - (-w.e1 * -w.e1 + -w.e2 * -w.e2) = 0
    have : (w.e1 * w.e1 + w.e2 * w.e2) - (w.b1 * w.b1 + w.b2 * w.b2) = 0 := h2
    rw [Int.neg_mul_neg, Int.neg_mul_neg]; omega

/-! ## Part VI. Charge: the side, forced, conserved -/

/-- Pair creation conserves charge: a particle and its antiparticle carry opposite charges. -/
theorem pair_creation_conserves_charge (c : Particle) :
    c.q3 + (bar c).q3 = 0 ∧ c.colour + (bar c).colour = 0 := by
  refine ⟨?_, ?_⟩ <;> (show _ + -_ = 0; omega)

/-- The hypercharges are forced; charge comes in thirds. -/
theorem hypercharge_forced (yQ yu yd yL ye yH : Int)
    (Yu : yQ + yu + yH = 0) (Yd : yQ + yd - yH = 0) (Ye : yL + ye - yH = 0)
    (iso : 3 * yQ + yL = 0) (grav : 6 * yQ + 3 * yu + 3 * yd + 2 * yL + ye = 0) :
    yu = -4 * yQ ∧ yd = 2 * yQ ∧ yL = -3 * yQ ∧ ye = 6 * yQ ∧ yH = 3 * yQ :=
  ⟨by omega, by omega, by omega, by omega, by omega⟩

def charge6 (t3x6 y6 : Int) : Int := t3x6 + y6
theorem charges_in_thirds :
    charge6 3 1 = 4 ∧ charge6 (-3) 1 = -2 ∧ charge6 3 (-3) = 0 ∧ charge6 (-3) (-3) = -6 ∧
    (charge6 3 1 + charge6 3 1 + charge6 (-3) 1) + charge6 (-3) (-3) = 0 ∧ charge6 (-3) 3 = 0 := by
  decide

/-- The Aharonov–Bohm record reads enclosed flux modulo one quantum: two fluxes one quantum apart
    are two worlds with one record. -/
theorem aharonov_bohm_two_worlds (Φ Φ0 : Int) (h : 0 < Φ0) :
    (Φ + Φ0) % Φ0 = Φ % Φ0 ∧ Φ + Φ0 ≠ Φ := by
  refine ⟨Int.add_emod_self, ?_⟩
  omega

/-! ## Part VII. Gravity and magnetism, one registration in two branches -/

/-- Gravity reads energy only, one sign: no gravitational reading tells a charge from its
    antiparticle, and a one-signed reading is its own image under the particle map. -/
theorem gravity_even_branch {β : Type} (g : Energy → β) (c : Particle) :
    g (bar c).energy = g c.energy := rfl

/-- Magnetism is the odd branch: time reversal flips B, and the magnet keeps every energy real. -/
theorem magnetism_odd_branch (f : Field) (H : Block) :
    f.T.B = -f.B ∧ 0 ≤ H.disc ∧ H.T.disc = H.disc :=
  ⟨rfl, (stationarity_survives_the_magnet H).1, (stationarity_survives_the_magnet H).2⟩

/-! ## Part VIII. The capstone -/

/-- ELECTROMAGNETISM ON THE SEAT. Charge conjugation is carried onto the fold by the charge carrier,
    time reversal by the field carrier; the line is the neutral charge and the purely electric
    field; the magnetic sign is the bit; duality squared is charge conjugation; light is null and
    stays null under duality; CPT acts trivially on the field; charge is forced in thirds and
    conserved by pair creation; the magnet keeps every energy real. -/
theorem electromagnetism_on_the_seat :
    Equivariant chargeSeat bar fold ∧ Equivariant fieldSeat Field.T fold ∧
    (∀ f : Field, OnLine (fieldSeat f) ↔ f.B = 0) ∧
    (∀ f : Field, f.B ≠ 0 → f.T ≠ f ∧ energyDensity f.T = energyDensity f) ∧
    (∀ f : Field, f.D.D = f.C ∧ f.D.D.D.D = f) ∧
    (∀ f : Field, f.T.P.C = f) ∧
    (∀ a : Int, (Wave.mk a 0 0 a).Null) ∧
    (∀ w : Wave, w.Null → w.D.Null) ∧
    (∀ c : Particle, c.q3 + (bar c).q3 = 0) ∧
    (∀ H : Block, 0 ≤ H.disc) :=
  ⟨charge_carrier_equivariant, field_carrier_equivariant, electric_on_the_line,
   fun f h => ⟨(magnetic_sign_is_the_bit f h).1, (magnetic_sign_is_the_bit f h).2.2.2.1⟩,
   fun f => ⟨duality_squared_is_C f, duality_fourth_is_identity f⟩, CPT_trivial,
   plane_wave_null, null_preserved_by_duality,
   fun c => (pair_creation_conserves_charge c).1, fun H => (stationarity_survives_the_magnet H).1⟩

end SPHYS.Electromagnetism

#print axioms SPHYS.Electromagnetism.pe
#print axioms SPHYS.Electromagnetism.fold_involutive
#print axioms SPHYS.Electromagnetism.seat_fixed_line
#print axioms SPHYS.Electromagnetism.reg_lands
#print axioms SPHYS.Electromagnetism.reg_fixes_iff
#print axioms SPHYS.Electromagnetism.reg_forgets_side
#print axioms SPHYS.Electromagnetism.least_erasure_iff_value
#print axioms SPHYS.Electromagnetism.equivariant_id
#print axioms SPHYS.Electromagnetism.equivariant_comp
#print axioms SPHYS.Electromagnetism.fix_functorial
#print axioms SPHYS.Electromagnetism.fold_global_seat
#print axioms SPHYS.Electromagnetism.equivariant_carrier_lands
#print axioms SPHYS.Electromagnetism.value_on_image
#print axioms SPHYS.Electromagnetism.kinetic_crossing
#print axioms SPHYS.Electromagnetism.off_locus_pair
#print axioms SPHYS.Electromagnetism.ee
#print axioms SPHYS.Electromagnetism.mirror_involutive
#print axioms SPHYS.Electromagnetism.psi_phi
#print axioms SPHYS.Electromagnetism.phi_psi
#print axioms SPHYS.Electromagnetism.phi_injective
#print axioms SPHYS.Electromagnetism.phi_equivariant
#print axioms SPHYS.Electromagnetism.mirror_fixed_iff_real
#print axioms SPHYS.Electromagnetism.phi_line_iff_real
#print axioms SPHYS.Electromagnetism.stationary_iff_real
#print axioms SPHYS.Electromagnetism.line_is_stationary
#print axioms SPHYS.Electromagnetism.measured_on_line
#print axioms SPHYS.Electromagnetism.no_measurement_off_line
#print axioms SPHYS.Electromagnetism.energy_carrier_lands
#print axioms SPHYS.Electromagnetism.bar_involutive
#print axioms SPHYS.Electromagnetism.bar_fixed_iff_neutral
#print axioms SPHYS.Electromagnetism.odd_charges_even_energy
#print axioms SPHYS.Electromagnetism.gravity_reads_no_charge_bit
#print axioms SPHYS.Electromagnetism.involutions_commute
#print axioms SPHYS.Electromagnetism.tmirror_involutive
#print axioms SPHYS.Electromagnetism.joint_fixed_iff
#print axioms SPHYS.Electromagnetism.charge_carrier_equivariant
#print axioms SPHYS.Electromagnetism.pair_lands_once
#print axioms SPHYS.Electromagnetism.tmirror_equivariant
#print axioms SPHYS.Electromagnetism.neutral_charge_on_line
#print axioms SPHYS.Electromagnetism.pair_on_the_edges
#print axioms SPHYS.Electromagnetism.stable_lands
#print axioms SPHYS.Electromagnetism.sq_nonneg
#print axioms SPHYS.Electromagnetism.block_T_fixed_iff
#print axioms SPHYS.Electromagnetism.stationarity_survives_the_magnet
#print axioms SPHYS.Electromagnetism.fe
#print axioms SPHYS.Electromagnetism.T_involutive
#print axioms SPHYS.Electromagnetism.C_involutive
#print axioms SPHYS.Electromagnetism.P_involutive
#print axioms SPHYS.Electromagnetism.CT_is_P
#print axioms SPHYS.Electromagnetism.CPT_trivial
#print axioms SPHYS.Electromagnetism.field_carrier_equivariant
#print axioms SPHYS.Electromagnetism.T_fixed_iff_electric
#print axioms SPHYS.Electromagnetism.electric_on_the_line
#print axioms SPHYS.Electromagnetism.field_carrier_lands
#print axioms SPHYS.Electromagnetism.magnetic_sign_is_the_bit
#print axioms SPHYS.Electromagnetism.energy_even
#print axioms SPHYS.Electromagnetism.EB_odd_under_T_and_P
#print axioms SPHYS.Electromagnetism.duality_squared_is_C
#print axioms SPHYS.Electromagnetism.duality_fourth_is_identity
#print axioms SPHYS.Electromagnetism.duality_anticommutes_with_T
#print axioms SPHYS.Electromagnetism.energy_duality_invariant
#print axioms SPHYS.Electromagnetism.invariants_flip_under_duality
#print axioms SPHYS.Electromagnetism.plane_wave_null
#print axioms SPHYS.Electromagnetism.null_preserved_by_duality
#print axioms SPHYS.Electromagnetism.pair_creation_conserves_charge
#print axioms SPHYS.Electromagnetism.hypercharge_forced
#print axioms SPHYS.Electromagnetism.charges_in_thirds
#print axioms SPHYS.Electromagnetism.aharonov_bohm_two_worlds
#print axioms SPHYS.Electromagnetism.gravity_even_branch
#print axioms SPHYS.Electromagnetism.magnetism_odd_branch
#print axioms SPHYS.Electromagnetism.electromagnetism_on_the_seat
