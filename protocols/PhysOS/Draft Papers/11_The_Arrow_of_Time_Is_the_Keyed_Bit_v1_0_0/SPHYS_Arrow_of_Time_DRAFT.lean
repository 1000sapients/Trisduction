/-
  SPHYS_Arrow_of_Time.lean · the arrow of time is the keyed bit, read at the Riemann seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: h = 2 Re s, t = Im s; the fold s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t), the critical line h = 1.

  Part I     the seat, the category of involutions, the functor of the seat.
  Part II    the energy carrier (resident).
  Part III   the substrate (resident).
  Part IV     The registration has no inverse.
  Part V      The law is even, the arrow is odd.
  Part VI     The urn: equilibrium is the line, detailed balance the fold.
  Part VII    The capstone.
-/
set_option autoImplicit false
namespace SPHYS.ArrowOfTime


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


/-! ## Part IV. The registration has no inverse -/

/-- THE REGISTRATION CANNOT BE UNDONE: no map recovers a point from its registration, because a
    point off the line and its fold partner share one. -/
theorem registration_has_no_left_inverse : ¬ ∃ g : Pt → Pt, ∀ p, g (reg p) = p := by
  intro ⟨g, hg⟩
  have h1 := hg (0, 0)
  have h2 := hg (fold (0, 0))
  rw [reg_forgets_side] at h2
  rw [h1] at h2
  have : ((0 : Int), (0 : Int)) = (2 - 0, 0) := h2
  have := congrArg Prod.fst this
  change (0 : Int) = 2 - 0 at this
  omega

/-! ## Part V. The law is even, the arrow is odd -/

/-- A history: the entropies of its macrostates in order. Time reversal reads it backwards. -/
abbrev History := List Int
def rev (h : History) : History := h.reverse

theorem rev_involutive (h : History) : rev (rev h) = h := List.reverse_reverse h

/-- The arrow's measure: the last entropy minus the first. -/
def gain (h : History) : Int := h.getLast?.getD 0 - h.head?.getD 0

/-- THE ARROW IS ODD: time reversal negates the gain. -/
theorem gain_odd (h : History) : gain (rev h) = - gain h := by
  unfold gain rev; rw [List.head?_reverse, List.getLast?_reverse]; omega

/-- A reversible law: a predicate on histories that time reversal keeps. -/
def ReversibleLaw (L : History → Prop) : Prop := ∀ h, L (rev h) ↔ L h

/-- A REVERSIBLE LAW ADMITS BOTH ARROWS: every history it allows with rising entropy has a reversed
    partner it allows with falling entropy. -/
theorem reversible_law_admits_both_arrows (L : History → Prop) (hL : ReversibleLaw L) (h : History)
    (hh : L h) (hg : 0 < gain h) : L (rev h) ∧ gain (rev h) < 0 :=
  ⟨(hL h).mpr hh, by rw [gain_odd]; omega⟩

/-- THE ARROW IS KEYED: no reading even under time reversal returns the arrow on a history whose
    entropy changes. -/
theorem even_reading_misses_the_arrow (f : History → Bool) (hf : ∀ h, f (rev h) = f h) (h : History)
    (hg : 0 < gain h) : ¬ ∀ k, f k = decide (0 < gain k) := by
  intro hk
  have a := hk h
  have b := hk (rev h)
  rw [hf, gain_odd] at b
  rw [a] at b
  have t : decide (0 < gain h) = true := decide_eq_true hg
  have u : decide (0 < -gain h) = false := decide_eq_false (by omega)
  rw [t, u] at b; exact Bool.noConfusion b

/-- The law's own verdict is an even reading: whether a history is allowed never returns its arrow. -/
theorem the_law_does_not_carry_the_arrow (L : History → Bool) (hL : ∀ h, L (rev h) = L h) (h : History)
    (hg : 0 < gain h) : ¬ ∀ k, L k = decide (0 < gain k) :=
  even_reading_misses_the_arrow L hL h hg

/-! ## Part VI. The urn: equilibrium is the line, detailed balance the fold -/

/-- Binomial counts by Pascal's rule: the number of microstates of the urn with k of N balls in one side. -/
def binom : Nat → Nat → Nat
  | _, 0 => 1
  | 0, _ + 1 => 0
  | n + 1, k + 1 => binom n k + binom n (k + 1)

/-- Relabelling the urns, k ↦ N − k, keeps every count. -/
theorem urn_symmetric :
    ((List.range 13).all fun N => (List.range (N + 1)).all fun k => binom N k == binom N (N - k)) = true := by
  decide

/-- DETAILED BALANCE: in equilibrium the flux from k to k + 1 equals the flux back, for every urn of
    up to twelve balls. -/
theorem detailed_balance :
    ((List.range 13).all fun N => (List.range N).all fun k =>
      binom N k * (N - k) == binom N (k + 1) * (k + 1)) = true := by
  decide

/-- The microstates number 2^N. -/
theorem microstates_count :
    ((List.range 13).all fun N => ((List.range (N + 1)).map (binom N)).foldl (· + ·) 0 == 2 ^ N) = true := by
  decide

/-- The even split is the most probable macrostate, and the ordered one is one microstate in 4096. -/
theorem equilibrium_is_the_mode :
    ((List.range 13).all fun k => binom 12 k ≤ binom 12 6) = true ∧ binom 12 0 = 1 ∧ binom 12 6 = 924 := by
  decide

/-- The urn's carrier: the imbalance 2k − N is the offset from the line. -/
def urnSeat (N k : Int) : Pt := (1 + (2 * k - N), N)
def urnFlip (N k : Int) : Int := N - k

/-- RELABELLING IS THE FOLD, AND THE EVEN SPLIT IS THE LINE. -/
theorem urn_carrier_equivariant (N : Int) : Equivariant (urnSeat N) (urnFlip N) fold := by
  intro k
  show ((1 + (2 * (N - k) - N), N) : Pt) = (2 - (1 + (2 * k - N)), N)
  rw [pe]; exact ⟨by omega, rfl⟩

theorem equilibrium_is_the_line (N k : Int) : OnLine (urnSeat N k) ↔ 2 * k = N := by
  show 1 + (2 * k - N) = 1 ↔ 2 * k = N
  exact ⟨fun h => by omega, fun h => by omega⟩

/-! ## Part VII. The capstone -/

/-- THE ARROW OF TIME IS THE KEYED BIT. The registration has no inverse; a reversible law admits both
    arrows; no reading even under reversal, the law's own verdict included, returns the arrow; the
    urn's relabelling is the fold and its equilibrium the line; detailed balance holds there. The
    arrow's direction is supplied at the boundary, by the act. -/
theorem the_arrow_is_the_keyed_bit :
    (¬ ∃ g : Pt → Pt, ∀ p, g (reg p) = p) ∧
    (∀ h : History, gain (rev h) = - gain h) ∧
    (∀ L : History → Prop, ReversibleLaw L → ∀ h, L h → 0 < gain h → L (rev h) ∧ gain (rev h) < 0) ∧
    (∀ (f : History → Bool), (∀ h, f (rev h) = f h) → ∀ h, 0 < gain h → ¬ ∀ k, f k = decide (0 < gain k)) ∧
    (∀ N : Int, Equivariant (urnSeat N) (urnFlip N) fold) ∧
    (∀ N k : Int, OnLine (urnSeat N k) ↔ 2 * k = N) :=
  ⟨registration_has_no_left_inverse, gain_odd, reversible_law_admits_both_arrows,
   even_reading_misses_the_arrow, urn_carrier_equivariant, equilibrium_is_the_line⟩

end SPHYS.ArrowOfTime

#print axioms SPHYS.ArrowOfTime.pe
#print axioms SPHYS.ArrowOfTime.fold_involutive
#print axioms SPHYS.ArrowOfTime.seat_fixed_line
#print axioms SPHYS.ArrowOfTime.reg_lands
#print axioms SPHYS.ArrowOfTime.reg_fixes_iff
#print axioms SPHYS.ArrowOfTime.reg_forgets_side
#print axioms SPHYS.ArrowOfTime.least_erasure_iff_value
#print axioms SPHYS.ArrowOfTime.equivariant_id
#print axioms SPHYS.ArrowOfTime.equivariant_comp
#print axioms SPHYS.ArrowOfTime.fix_functorial
#print axioms SPHYS.ArrowOfTime.fold_global_seat
#print axioms SPHYS.ArrowOfTime.equivariant_carrier_lands
#print axioms SPHYS.ArrowOfTime.value_on_image
#print axioms SPHYS.ArrowOfTime.kinetic_crossing
#print axioms SPHYS.ArrowOfTime.off_locus_pair
#print axioms SPHYS.ArrowOfTime.ee
#print axioms SPHYS.ArrowOfTime.mirror_involutive
#print axioms SPHYS.ArrowOfTime.psi_phi
#print axioms SPHYS.ArrowOfTime.phi_psi
#print axioms SPHYS.ArrowOfTime.phi_injective
#print axioms SPHYS.ArrowOfTime.phi_equivariant
#print axioms SPHYS.ArrowOfTime.mirror_fixed_iff_real
#print axioms SPHYS.ArrowOfTime.phi_line_iff_real
#print axioms SPHYS.ArrowOfTime.stationary_iff_real
#print axioms SPHYS.ArrowOfTime.line_is_stationary
#print axioms SPHYS.ArrowOfTime.measured_on_line
#print axioms SPHYS.ArrowOfTime.no_measurement_off_line
#print axioms SPHYS.ArrowOfTime.energy_carrier_lands
#print axioms SPHYS.ArrowOfTime.bar_involutive
#print axioms SPHYS.ArrowOfTime.bar_fixed_iff_neutral
#print axioms SPHYS.ArrowOfTime.odd_charges_even_energy
#print axioms SPHYS.ArrowOfTime.gravity_reads_no_charge_bit
#print axioms SPHYS.ArrowOfTime.involutions_commute
#print axioms SPHYS.ArrowOfTime.tmirror_involutive
#print axioms SPHYS.ArrowOfTime.joint_fixed_iff
#print axioms SPHYS.ArrowOfTime.charge_carrier_equivariant
#print axioms SPHYS.ArrowOfTime.pair_lands_once
#print axioms SPHYS.ArrowOfTime.tmirror_equivariant
#print axioms SPHYS.ArrowOfTime.neutral_charge_on_line
#print axioms SPHYS.ArrowOfTime.pair_on_the_edges
#print axioms SPHYS.ArrowOfTime.stable_lands
#print axioms SPHYS.ArrowOfTime.registration_has_no_left_inverse
#print axioms SPHYS.ArrowOfTime.rev_involutive
#print axioms SPHYS.ArrowOfTime.gain_odd
#print axioms SPHYS.ArrowOfTime.reversible_law_admits_both_arrows
#print axioms SPHYS.ArrowOfTime.even_reading_misses_the_arrow
#print axioms SPHYS.ArrowOfTime.the_law_does_not_carry_the_arrow
#print axioms SPHYS.ArrowOfTime.urn_symmetric
#print axioms SPHYS.ArrowOfTime.detailed_balance
#print axioms SPHYS.ArrowOfTime.microstates_count
#print axioms SPHYS.ArrowOfTime.equilibrium_is_the_mode
#print axioms SPHYS.ArrowOfTime.urn_carrier_equivariant
#print axioms SPHYS.ArrowOfTime.equilibrium_is_the_line
#print axioms SPHYS.ArrowOfTime.the_arrow_is_the_keyed_bit
