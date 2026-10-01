/-
  SPHYS_Matter_Antimatter.lean · matter over antimatter is the spent bit, read at the Riemann seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: h = 2 Re s, t = Im s; the fold s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t), the critical line h = 1.

  Part I     the seat, the category of involutions, the functor of the seat.
  Part II    the energy carrier (resident).
  Part III   the substrate (resident).
  Part IV     Baryon number is odd, energy even.
  Part V      The wall: an even weight against an odd reading sums to zero.
  Part VI     Sakharov's three conditions are the three exits from the wall.
  Part VII    The capstone.
-/
set_option autoImplicit false
namespace SPHYS.MatterAntimatter


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


/-! ## Part IV. Baryon number is odd, energy even -/

/-- A state of the early universe: its energy and its baryon number (times three). -/
structure BState where
  e : Int
  b : Int
  deriving DecidableEq, Repr

/-- Charge conjugation on the baryon register: baryon number flipped, energy kept. -/
def cb (s : BState) : BState := ⟨s.e, -s.b⟩

theorem cb_involutive (s : BState) : cb (cb s) = s := by
  obtain ⟨e, b⟩ := s; show (⟨e, - -b⟩ : BState) = ⟨e, b⟩; rw [Int.neg_neg]

/-- The baryon carrier: baryon number is the offset from the line, energy the height. -/
def baryonSeat (s : BState) : Pt := (1 + s.b, s.e)

theorem baryon_carrier_equivariant : Equivariant baryonSeat cb fold := by
  intro s
  show ((1 + -s.b, s.e) : Pt) = (2 - (1 + s.b), s.e)
  rw [pe]; exact ⟨by omega, rfl⟩

/-- THE SYMMETRIC UNIVERSE IS THE LINE: zero net baryon number stands on it. -/
theorem symmetric_is_the_line (s : BState) : OnLine (baryonSeat s) ↔ s.b = 0 := by
  show 1 + s.b = 1 ↔ s.b = 0
  exact ⟨fun h => by omega, fun h => by omega⟩

/-- A matter excess and its antimatter mirror: two points off the line, one registration. -/
theorem matter_and_antimatter_one_record (s : BState) (h : s.b ≠ 0) :
    baryonSeat (cb s) = fold (baryonSeat s) ∧ ¬ OnLine (baryonSeat s) ∧
    reg (baryonSeat (cb s)) = reg (baryonSeat s) := by
  refine ⟨baryon_carrier_equivariant s, fun e => h ((symmetric_is_the_line s).mp e), ?_⟩
  rw [baryon_carrier_equivariant s]; exact reg_forgets_side (baryonSeat s)

/-! ## Part V. The wall: an even weight against an odd reading sums to zero -/

def isum : List Int → Int
  | [] => 0
  | x :: xs => x + isum xs

theorem isum_append (a b : List Int) : isum (a ++ b) = isum a + isum b := by
  induction a with
  | nil => simp [isum]
  | cons x xs ih => simp only [List.cons_append, isum, ih]; omega

/-- The net baryon number of a population whose weights read energy only. -/
def netB (w : Int → Int) (l : List BState) : Int := isum (l.map fun s => w s.e * s.b)

theorem netB_conj (w : Int → Int) (l : List BState) : netB w (l.map cb) = - netB w l := by
  induction l with
  | nil => rfl
  | cons a t ih =>
    unfold netB at *
    simp only [List.map_cons, isum] at *
    rw [ih]
    show w a.e * (-a.b) + -isum (List.map (fun s => w s.e * s.b) t) =
      -(w a.e * a.b + isum (List.map (fun s => w s.e * s.b) t))
    rw [Int.mul_neg]; omega

/-- THE WALL: over a spectrum closed under conjugation, any weight that reads energy alone gives zero
    net baryon number. Equilibrium is such a weight; so is any conjugation-symmetric rate. -/
theorem even_weight_odd_reading_zero (w : Int → Int) (l : List BState) : netB w (l ++ l.map cb) = 0 := by
  have h : netB w (l ++ l.map cb) = netB w l + netB w (l.map cb) := by
    unfold netB; rw [List.map_append, isum_append]
  rw [h, netB_conj]; omega

/-! ## Part VI. Sakharov's three conditions are the three exits from the wall -/

/-- EXIT ONE, THE READING MUST MOVE: a process that conserves baryon number keeps a zero total zero. -/
theorem conserved_reading_stays (b0 : Int) (steps : List Int) (hc : ∀ d ∈ steps, d = 0) (h0 : b0 = 0) :
    b0 + isum steps = 0 := by
  subst h0
  induction steps with
  | nil => rfl
  | cons d ds ih =>
    have hd : d = 0 := hc d (List.Mem.head ds)
    have rest : isum ds = 0 := by
      have := ih (fun x hx => hc x (List.Mem.tail d hx)); omega
    show 0 + (d + isum ds) = 0
    omega

/-- A weight that reads the baryon register: its even and odd parts. -/
def wEven (W : BState → Int) (s : BState) : Int := W s + W (cb s)
def wOdd (W : BState → Int) (s : BState) : Int := W s - W (cb s)

/-- EXIT TWO, THE WEIGHT MUST BE ODD: a conjugation-symmetric weight gives zero over a closed spectrum;
    the net is carried by the odd part of the weight alone, the C and CP violation. -/
theorem symmetric_weight_zero (W : BState → Int) (hW : ∀ s, W (cb s) = W s) (l : List BState) :
    isum ((l ++ l.map cb).map fun s => W s * s.b) = 0 := by
  have h1 : ∀ m : List BState, isum ((m.map cb).map fun s => W s * s.b) = - isum (m.map fun s => W s * s.b) := by
    intro m
    induction m with
    | nil => rfl
    | cons a t ih =>
      simp only [List.map_cons, isum] at *
      rw [ih, hW]
      show W a * (-a.b) + -isum (List.map (fun s => W s * s.b) t) =
        -(W a * a.b + isum (List.map (fun s => W s * s.b) t))
      rw [Int.mul_neg]; omega
  rw [List.map_append, isum_append, h1]; omega

/-- The net over a closed spectrum is half the odd part of the weight read against the reading. -/
theorem net_is_the_odd_part (W : BState → Int) (s : BState) :
    W s * s.b + W (cb s) * (cb s).b = wOdd W s * s.b := by
  show W s * s.b + W (cb s) * (-s.b) = (W s - W (cb s)) * s.b
  rw [Int.mul_neg, Int.sub_mul]; omega

/-- EXIT THREE, THE WEIGHT MUST LEAVE EQUILIBRIUM: an equilibrium weight is a function of energy, and
    conjugation keeps energy, so every equilibrium weight is symmetric and the wall holds. -/
theorem equilibrium_weight_is_symmetric (w : Int → Int) (s : BState) :
    (fun t : BState => w t.e) (cb s) = (fun t : BState => w t.e) s := rfl

theorem equilibrium_has_no_asymmetry (w : Int → Int) (l : List BState) :
    isum ((l ++ l.map cb).map fun s => w s.e * s.b) = 0 :=
  symmetric_weight_zero (fun t => w t.e) (fun _ => rfl) l

/-! ## Part VII. The capstone -/

/-- MATTER OVER ANTIMATTER IS THE SPENT BIT. Conjugation on the baryon register is carried onto the
    fold and the symmetric universe onto the line; a matter excess and its mirror are two points off
    the line with one registration; an even weight against the odd reading sums to zero over a closed
    spectrum; the net is carried by the odd part of the weight; and equilibrium weights are even. The
    three exits, a moving reading, an odd weight, a weight out of equilibrium, are Sakharov's. -/
theorem matter_over_antimatter :
    Equivariant baryonSeat cb fold ∧
    (∀ s : BState, OnLine (baryonSeat s) ↔ s.b = 0) ∧
    (∀ s : BState, s.b ≠ 0 → ¬ OnLine (baryonSeat s) ∧ reg (baryonSeat (cb s)) = reg (baryonSeat s)) ∧
    (∀ (w : Int → Int) (l : List BState), netB w (l ++ l.map cb) = 0) ∧
    (∀ (W : BState → Int) (s : BState), W s * s.b + W (cb s) * (cb s).b = wOdd W s * s.b) ∧
    (∀ (W : BState → Int), (∀ s, W (cb s) = W s) → ∀ l : List BState,
      isum ((l ++ l.map cb).map fun s => W s * s.b) = 0) :=
  ⟨baryon_carrier_equivariant, symmetric_is_the_line,
   fun s h => ⟨(matter_and_antimatter_one_record s h).2.1, (matter_and_antimatter_one_record s h).2.2⟩,
   even_weight_odd_reading_zero, net_is_the_odd_part, symmetric_weight_zero⟩

end SPHYS.MatterAntimatter

#print axioms SPHYS.MatterAntimatter.pe
#print axioms SPHYS.MatterAntimatter.fold_involutive
#print axioms SPHYS.MatterAntimatter.seat_fixed_line
#print axioms SPHYS.MatterAntimatter.reg_lands
#print axioms SPHYS.MatterAntimatter.reg_fixes_iff
#print axioms SPHYS.MatterAntimatter.reg_forgets_side
#print axioms SPHYS.MatterAntimatter.least_erasure_iff_value
#print axioms SPHYS.MatterAntimatter.equivariant_id
#print axioms SPHYS.MatterAntimatter.equivariant_comp
#print axioms SPHYS.MatterAntimatter.fix_functorial
#print axioms SPHYS.MatterAntimatter.fold_global_seat
#print axioms SPHYS.MatterAntimatter.equivariant_carrier_lands
#print axioms SPHYS.MatterAntimatter.value_on_image
#print axioms SPHYS.MatterAntimatter.kinetic_crossing
#print axioms SPHYS.MatterAntimatter.off_locus_pair
#print axioms SPHYS.MatterAntimatter.ee
#print axioms SPHYS.MatterAntimatter.mirror_involutive
#print axioms SPHYS.MatterAntimatter.psi_phi
#print axioms SPHYS.MatterAntimatter.phi_psi
#print axioms SPHYS.MatterAntimatter.phi_injective
#print axioms SPHYS.MatterAntimatter.phi_equivariant
#print axioms SPHYS.MatterAntimatter.mirror_fixed_iff_real
#print axioms SPHYS.MatterAntimatter.phi_line_iff_real
#print axioms SPHYS.MatterAntimatter.stationary_iff_real
#print axioms SPHYS.MatterAntimatter.line_is_stationary
#print axioms SPHYS.MatterAntimatter.measured_on_line
#print axioms SPHYS.MatterAntimatter.no_measurement_off_line
#print axioms SPHYS.MatterAntimatter.energy_carrier_lands
#print axioms SPHYS.MatterAntimatter.bar_involutive
#print axioms SPHYS.MatterAntimatter.bar_fixed_iff_neutral
#print axioms SPHYS.MatterAntimatter.odd_charges_even_energy
#print axioms SPHYS.MatterAntimatter.gravity_reads_no_charge_bit
#print axioms SPHYS.MatterAntimatter.involutions_commute
#print axioms SPHYS.MatterAntimatter.tmirror_involutive
#print axioms SPHYS.MatterAntimatter.joint_fixed_iff
#print axioms SPHYS.MatterAntimatter.charge_carrier_equivariant
#print axioms SPHYS.MatterAntimatter.pair_lands_once
#print axioms SPHYS.MatterAntimatter.tmirror_equivariant
#print axioms SPHYS.MatterAntimatter.neutral_charge_on_line
#print axioms SPHYS.MatterAntimatter.pair_on_the_edges
#print axioms SPHYS.MatterAntimatter.stable_lands
#print axioms SPHYS.MatterAntimatter.cb_involutive
#print axioms SPHYS.MatterAntimatter.baryon_carrier_equivariant
#print axioms SPHYS.MatterAntimatter.symmetric_is_the_line
#print axioms SPHYS.MatterAntimatter.matter_and_antimatter_one_record
#print axioms SPHYS.MatterAntimatter.isum_append
#print axioms SPHYS.MatterAntimatter.netB_conj
#print axioms SPHYS.MatterAntimatter.even_weight_odd_reading_zero
#print axioms SPHYS.MatterAntimatter.conserved_reading_stays
#print axioms SPHYS.MatterAntimatter.symmetric_weight_zero
#print axioms SPHYS.MatterAntimatter.net_is_the_odd_part
#print axioms SPHYS.MatterAntimatter.equilibrium_weight_is_symmetric
#print axioms SPHYS.MatterAntimatter.equilibrium_has_no_asymmetry
#print axioms SPHYS.MatterAntimatter.matter_over_antimatter
