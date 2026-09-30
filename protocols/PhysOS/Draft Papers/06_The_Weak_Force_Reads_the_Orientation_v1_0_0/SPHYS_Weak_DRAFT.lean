/-
  SPHYS_Weak.lean · the weak force reads the orientation, at the Riemann seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: h = 2 Re s, t = Im s; the fold s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t), the critical line
  h = 1. Parity exchanges the left- and right-handed couplings of a force to a fermion; the
  orientation carrier sends their difference to the side and their sum to the height, so parity is
  the fold and the parity-conserving couplings are the line.

  Part I     the seat, the category of involutions, the functor of the seat.
  Part II    the energy carrier (resident).
  Part III   the substrate (resident).
  Part IV    parity is the fold on couplings; the charged current off the line; the Z by isospin.
  Part V     the orientation: dot products blind, the triple product reversed.
  Part VI    C, P and CP on the charged current; CP violation is T violation under CPT.
  Part VII   three generations are the least with one CP phase.
  Part VIII  helicity suppression.
  Part IX    the capstone.
-/
set_option autoImplicit false
namespace SPHYS.Weak


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

/-! ## Part IV. Parity is the fold on couplings -/

/-- A coupling to a fermion: its strength to the left-handed and to the right-handed state. -/
abbrev Coupling := Int × Int

/-- Parity exchanges left and right. -/
def parity (g : Coupling) : Coupling := (g.2, g.1)

theorem parity_involutive (g : Coupling) : parity (parity g) = g := rfl

/-- The orientation carrier: the left–right difference to the side, the sum to the height. -/
def couplingSeat (g : Coupling) : Pt := (1 + (g.1 - g.2), g.1 + g.2)

/-- PARITY IS THE FOLD: the orientation carrier is equivariant. -/
theorem orientation_carrier_equivariant : Equivariant couplingSeat parity fold := by
  intro g
  obtain ⟨l, r⟩ := g
  show ((1 + (r - l), r + l) : Pt) = (2 - (1 + (l - r)), l + r)
  rw [pe]; exact ⟨by omega, by omega⟩

/-- A coupling lands on the line exactly when it treats left and right alike: the vector couplings
    of electromagnetism and colour are the line. -/
theorem vector_on_the_line (g : Coupling) : OnLine (couplingSeat g) ↔ parity g = g := by
  obtain ⟨l, r⟩ := g
  show 1 + (l - r) = 1 ↔ ((r, l) : Coupling) = (l, r)
  rw [pe]; constructor
  · intro h; exact ⟨by omega, by omega⟩
  · intro ⟨h, _⟩; omega

theorem orientation_carrier_lands :
    ∃ C : Carrier { g : Coupling // parity g = g }, ∀ w, C.ι w = couplingSeat w.1 :=
  equivariant_carrier_lands couplingSeat parity orientation_carrier_equivariant

/-- The photon couples to a charge q on both hands alike: on the line. -/
theorem photon_coupling_on_the_line (q : Int) : OnLine (couplingSeat (q, q)) := by
  show 1 + (q - q) = 1; omega

/-- THE CHARGED CURRENT IS MAXIMALLY OFF THE LINE: it couples the left hand and not the right. -/
theorem charged_current_off_the_line : ¬ OnLine (couplingSeat (1, 0)) ∧ parity (1, 0) ≠ ((1, 0) : Coupling) := by
  decide

/-- The Z couples with g_L = T₃ − Q·s and g_R = −Q·s: its distance from the line is the weak isospin,
    whatever the mixing weight s. -/
def zCoupling (t3 q s : Int) : Coupling := (t3 - q * s, -(q * s))

theorem z_parity_depth_is_isospin (t3 q s : Int) : (zCoupling t3 q s).1 - (zCoupling t3 q s).2 = t3 := by
  show (t3 - q * s) - -(q * s) = t3; omega

/-- A neutral fermion's right-handed Z coupling vanishes for every mixing weight. -/
theorem neutrino_has_no_right_hand (t3 s : Int) : (zCoupling t3 0 s).2 = 0 := by
  show -(0 * s) = 0; rw [Int.zero_mul]; rfl

/-! ## Part V. The orientation: what the even readings cannot see -/

abbrev V3 := Int × Int × Int
def refl (v : V3) : V3 := (-v.1, -v.2.1, -v.2.2)
def dot (u v : V3) : Int := u.1 * v.1 + u.2.1 * v.2.1 + u.2.2 * v.2.2
def triple (a b c : V3) : Int :=
  a.1 * (b.2.1 * c.2.2 - b.2.2 * c.2.1) - a.2.1 * (b.1 * c.2.2 - b.2.2 * c.1) +
  a.2.2 * (b.1 * c.2.1 - b.2.1 * c.1)

/-- Every dot product is blind to the mirror. -/
theorem dot_products_blind (u v : V3) : dot (refl u) (refl v) = dot u v := by
  obtain ⟨a, b, c⟩ := u; obtain ⟨d, e, f⟩ := v
  show -a * -d + -b * -e + -c * -f = a * d + b * e + c * f
  rw [Int.neg_mul_neg, Int.neg_mul_neg, Int.neg_mul_neg]

/-- THE TRIPLE PRODUCT READS THE ORIENTATION: it reverses under the mirror. -/
theorem triple_product_reads_orientation (a b c : V3) :
    triple (refl a) (refl b) (refl c) = -triple a b c := by
  obtain ⟨a1, a2, a3⟩ := a; obtain ⟨b1, b2, b3⟩ := b; obtain ⟨c1, c2, c3⟩ := c
  simp only [triple, refl, Int.neg_mul_neg, Int.neg_mul, Int.mul_neg, Int.neg_sub, Int.neg_neg]
  simp only [Int.mul_sub, Int.sub_mul, Int.mul_assoc]
  omega

/-- A spin is axial and a momentum polar: their correlation J·p reverses under the mirror. -/
theorem spin_momentum_correlation_odd (J p : V3) : dot J (refl p) = -dot J p := by
  obtain ⟨a, b, c⟩ := J; obtain ⟨d, e, f⟩ := p
  show a * -d + b * -e + c * -f = -(a * d + b * e + c * f)
  rw [Int.mul_neg, Int.mul_neg, Int.mul_neg]; omega

/-- An even reading cannot tell a world from its mirror image. -/
theorem even_readings_blind_to_mirror {β : Type} (g : V3 → β) (h : ∀ v, g (refl v) = g v) (v : V3) :
    g (refl v) = g v := h v

/-! ## Part VI. C, P and CP on the charged current; CP violation is T violation -/

/-- A fermion state for the charged current: antiparticle or not, right-handed or not. -/
abbrev WState := Bool × Bool
def cmap (s : WState) : WState := (!s.1, s.2)
def pmap (s : WState) : WState := (s.1, !s.2)
/-- The charged current registers left-handed particles and right-handed antiparticles. -/
def couples (s : WState) : Bool := s.1 == s.2

/-- THE CHARGED CURRENT BREAKS C AND P AND KEEPS CP. -/
theorem weak_breaks_C_and_P_keeps_CP :
    couples (cmap (false, false)) ≠ couples (false, false) ∧
    couples (pmap (false, false)) ≠ couples (false, false) ∧
    ∀ s : WState, couples (cmap (pmap s)) = couples s := by
  refine ⟨by decide, by decide, ?_⟩
  intro s; obtain ⟨a, b⟩ := s; cases a <;> cases b <;> rfl

/-- CP VIOLATION IS T VIOLATION: if T is an involution and CPT acts as the identity, then CP is T. -/
theorem cp_violation_is_t_violation {X : Type} (cp t : X → X) (ht : ∀ x, t (t x) = x)
    (hcpt : ∀ x, cp (t x) = x) (x : X) : cp x = t x := by
  have := hcpt (t x); rw [ht] at this; exact this

/-! ## Part VII. Three generations are the least with one CP phase -/

/-- The rotation angles of an n-generation mixing matrix, and its physical phases once the quark
    fields are rephased: n(n − 1)/2 and (n − 1)(n − 2)/2. -/
def angles (n : Nat) : Nat := n * (n - 1) / 2
def phases (n : Nat) : Nat := (n - 1) * (n - 2) / 2

/-- ONE PHASE AT THREE: two generations admit no CP-violating phase, three admit exactly one. -/
theorem one_phase_at_three :
    phases 1 = 0 ∧ phases 2 = 0 ∧ phases 3 = 1 ∧ angles 3 = 3 ∧ phases 4 = 3 := by decide

theorem three_is_the_least (n : Nat) (h : n < 3) : phases n = 0 := by
  have : n = 0 ∨ n = 1 ∨ n = 2 := by omega
  rcases this with h | h | h <;> subst h <;> decide

/-! ## Part VIII. Helicity suppression: the orientation read in a decay -/

/-- The pion's decay to an electron is suppressed by (mₑ/m_μ)², the square of a hand that a massless
    lepton could not flip: below 1/40000 (masses in keV). -/
theorem electron_channel_suppressed : 511 * 511 * 40000 < 105658 * 105658 := by decide

/-! ## Part IX. The capstone -/

/-- THE WEAK FORCE READS THE ORIENTATION. Parity is the fold under the orientation carrier; the
    vector couplings are the line and the charged current stands off it; the Z's distance from the
    line is the weak isospin; dot products are blind to the mirror and the triple product reverses
    under it; the charged current breaks C and P and keeps CP; CP violation is T violation under
    CPT; three generations are the least with one phase. -/
theorem weak_reads_the_orientation :
    Equivariant couplingSeat parity fold ∧
    (∀ g : Coupling, OnLine (couplingSeat g) ↔ parity g = g) ∧
    ¬ OnLine (couplingSeat (1, 0)) ∧
    (∀ t3 q s : Int, (zCoupling t3 q s).1 - (zCoupling t3 q s).2 = t3) ∧
    (∀ u v : V3, dot (refl u) (refl v) = dot u v) ∧
    (∀ a b c : V3, triple (refl a) (refl b) (refl c) = -triple a b c) ∧
    (∀ s : WState, couples (cmap (pmap s)) = couples s) ∧
    (∀ {X : Type} (cp t : X → X), (∀ x, t (t x) = x) → (∀ x, cp (t x) = x) → ∀ x, cp x = t x) ∧
    (phases 2 = 0 ∧ phases 3 = 1) :=
  ⟨orientation_carrier_equivariant, vector_on_the_line, charged_current_off_the_line.1,
   z_parity_depth_is_isospin, dot_products_blind, triple_product_reads_orientation,
   weak_breaks_C_and_P_keeps_CP.2.2, fun cp t ht h x => cp_violation_is_t_violation cp t ht h x,
   ⟨one_phase_at_three.2.1, one_phase_at_three.2.2.1⟩⟩

end SPHYS.Weak

#print axioms SPHYS.Weak.pe
#print axioms SPHYS.Weak.fold_involutive
#print axioms SPHYS.Weak.seat_fixed_line
#print axioms SPHYS.Weak.reg_lands
#print axioms SPHYS.Weak.reg_fixes_iff
#print axioms SPHYS.Weak.reg_forgets_side
#print axioms SPHYS.Weak.least_erasure_iff_value
#print axioms SPHYS.Weak.equivariant_id
#print axioms SPHYS.Weak.equivariant_comp
#print axioms SPHYS.Weak.fix_functorial
#print axioms SPHYS.Weak.fold_global_seat
#print axioms SPHYS.Weak.equivariant_carrier_lands
#print axioms SPHYS.Weak.value_on_image
#print axioms SPHYS.Weak.kinetic_crossing
#print axioms SPHYS.Weak.off_locus_pair
#print axioms SPHYS.Weak.ee
#print axioms SPHYS.Weak.mirror_involutive
#print axioms SPHYS.Weak.psi_phi
#print axioms SPHYS.Weak.phi_psi
#print axioms SPHYS.Weak.phi_injective
#print axioms SPHYS.Weak.phi_equivariant
#print axioms SPHYS.Weak.mirror_fixed_iff_real
#print axioms SPHYS.Weak.phi_line_iff_real
#print axioms SPHYS.Weak.stationary_iff_real
#print axioms SPHYS.Weak.line_is_stationary
#print axioms SPHYS.Weak.measured_on_line
#print axioms SPHYS.Weak.no_measurement_off_line
#print axioms SPHYS.Weak.energy_carrier_lands
#print axioms SPHYS.Weak.bar_involutive
#print axioms SPHYS.Weak.bar_fixed_iff_neutral
#print axioms SPHYS.Weak.odd_charges_even_energy
#print axioms SPHYS.Weak.gravity_reads_no_charge_bit
#print axioms SPHYS.Weak.involutions_commute
#print axioms SPHYS.Weak.tmirror_involutive
#print axioms SPHYS.Weak.joint_fixed_iff
#print axioms SPHYS.Weak.charge_carrier_equivariant
#print axioms SPHYS.Weak.pair_lands_once
#print axioms SPHYS.Weak.tmirror_equivariant
#print axioms SPHYS.Weak.neutral_charge_on_line
#print axioms SPHYS.Weak.pair_on_the_edges
#print axioms SPHYS.Weak.stable_lands
#print axioms SPHYS.Weak.parity_involutive
#print axioms SPHYS.Weak.orientation_carrier_equivariant
#print axioms SPHYS.Weak.vector_on_the_line
#print axioms SPHYS.Weak.orientation_carrier_lands
#print axioms SPHYS.Weak.photon_coupling_on_the_line
#print axioms SPHYS.Weak.charged_current_off_the_line
#print axioms SPHYS.Weak.z_parity_depth_is_isospin
#print axioms SPHYS.Weak.neutrino_has_no_right_hand
#print axioms SPHYS.Weak.dot_products_blind
#print axioms SPHYS.Weak.triple_product_reads_orientation
#print axioms SPHYS.Weak.spin_momentum_correlation_odd
#print axioms SPHYS.Weak.even_readings_blind_to_mirror
#print axioms SPHYS.Weak.weak_breaks_C_and_P_keeps_CP
#print axioms SPHYS.Weak.cp_violation_is_t_violation
#print axioms SPHYS.Weak.one_phase_at_three
#print axioms SPHYS.Weak.three_is_the_least
#print axioms SPHYS.Weak.electron_channel_suppressed
#print axioms SPHYS.Weak.weak_reads_the_orientation
