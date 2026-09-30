/-
  SPHYS_Resonance.lean · resonances, read at the Riemann seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: h = 2 Re s, t = Im s; the fold s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t), the critical line
  h = 1. The energy carrier s = 1/2 + iE of the hardware paper sends an unstable state of mass M
  and width Γ, E = M − iΓ/2, to Re s = 1/2 ± Γ/2: off the line by half the width.

  Part I     the seat, the category of involutions, the functor of the seat.
  Part II    the energy carrier: the line is the locus of stationary energy.
  Part III   the substrate (resident).
  Part IV    a resonance stands off the line by its width; decay and capture share one record.
  Part V     the line shape: half maximum at half width.
  Part VI    closed systems stay on the line; the width is the leak.
  Part VII   the width counts the doors.
  Part VIII  the capstone.
-/
set_option autoImplicit false
namespace SPHYS.Resonance


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

/-! ## Part IV. A resonance stands off the line by its width -/

/-- An unstable state: mass M and width Γ, the energy E = M − iΓ/2. In the carrier's convention,
    E = frequency + i·rate/2, its rate is −Γ. -/
def resonance (M Γ : Int) : Energy := ⟨M, -Γ⟩

/-- OFF THE LINE BY HALF THE WIDTH: in the doubled chart the side is 1 + Γ, so Re s = 1/2 + Γ/2
    stands half the width from the critical line. -/
theorem off_the_line_by_the_width (M Γ : Int) : phi (resonance M Γ) = (1 + Γ, M) := by
  show ((1 - -Γ, M) : Pt) = (1 + Γ, M)
  rw [pe]; exact ⟨by omega, rfl⟩

/-- A state is on the line exactly when its width vanishes, which is exactly when it is stationary. -/
theorem on_the_line_iff_stable (M Γ : Int) :
    (OnLine (phi (resonance M Γ)) ↔ Γ = 0) ∧ (Stationary (resonance M Γ) ↔ Γ = 0) := by
  have key : (-Γ = 0 ↔ Γ = 0) := ⟨fun h => by omega, fun h => by omega⟩
  refine ⟨?_, ?_⟩
  · rw [phi_line_iff_real]; exact key
  · rw [stationary_iff_real]; exact key

/-- The decaying state and its time mirror, the capturing state, are fold partners with one mass. -/
theorem decay_and_capture_one_record (M Γ : Int) (h : Γ ≠ 0) :
    phi (resonance M Γ).mirror = fold (phi (resonance M Γ)) ∧
    (resonance M Γ).mirror ≠ resonance M Γ ∧
    reg (phi (resonance M Γ).mirror) = reg (phi (resonance M Γ)) := by
  refine ⟨phi_equivariant _, fun e => h ?_, by rw [phi_equivariant]; rfl⟩
  have := congrArg Energy.rate e
  change - -Γ = -Γ at this; omega

/-! ## Part V. The line shape: half maximum at half width -/

/-- The Breit–Wigner shape at detuning d and half width g: numerator g², denominator d² + g². -/
def bwNum (g : Int) : Int := g * g
def bwDen (d g : Int) : Int := d * d + g * g

/-- HALF MAXIMUM AT HALF WIDTH: at d = g the shape is exactly half its peak. -/
theorem half_maximum_at_half_width (g : Int) : 2 * bwNum g = bwDen g g := by
  show 2 * (g * g) = g * g + g * g; omega

theorem sq_pos_of_ne (m : Int) (h : m ≠ 0) : 0 < m * m := by
  rcases Int.lt_or_gt_of_ne h with h' | h'
  · have := Int.mul_pos (show 0 < -m by omega) (show 0 < -m by omega)
    rw [Int.neg_mul_neg] at this; exact this
  · exact Int.mul_pos h' h'

/-- The line peaks at the mass: away from it the shape is strictly below its peak. -/
theorem line_peaks_at_the_mass (d g : Int) (hd : d ≠ 0) : bwNum g < bwDen d g := by
  have := sq_pos_of_ne d hd
  show g * g < d * d + g * g; omega

/-- The shape is even in the detuning: the line is symmetric about the mass. -/
theorem line_symmetric (d g : Int) : bwDen (-d) g = bwDen d g := by
  show -d * -d + g * g = d * d + g * g; rw [Int.neg_mul_neg]

/-! ## Part VI. Closed systems stay on the line; the width is the leak -/

/-- A Gaussian integer, for the entries of an effective Hamiltonian. -/
structure GI where
  re : Int
  im : Int
  deriving DecidableEq, Repr

/-- A two-level system with Hermitian part (a, b, c) and a leak lk out of the second level:
    H = [[a, c], [c, b − ilk]], listed as its four entries. -/
def leaky (a b c lk : Int) : GI × GI × GI × GI := (⟨a, 0⟩, ⟨c, 0⟩, ⟨c, 0⟩, ⟨b, -lk⟩)

/-- The imaginary part of the trace, which is the sum of the two energies' imaginary parts. -/
def traceIm (H : GI × GI × GI × GI) : Int := H.1.im + H.2.2.2.im

/-- THE WIDTH IS THE LEAK: the two energies' imaginary parts sum to −lk, so the total width is the
    leak, and a closed system, lk = 0, has none. -/
theorem the_width_is_the_leak (a b c lk : Int) :
    traceIm (leaky a b c lk) = -lk ∧ traceIm (leaky a b c 0) = 0 := by
  refine ⟨?_, ?_⟩ <;> (show 0 + -_ = _; omega)

/-- A closed two-level system keeps every energy real: the magnet's law. -/
theorem closed_stays_on_the_line (H : Block) : 0 ≤ H.disc := (stationarity_survives_the_magnet H).1

/-! ## Part VII. The width counts the doors -/

def total : List Int → Int
  | [] => 0
  | x :: xs => x + total xs

theorem total_nonneg (xs : List Int) (h : ∀ x ∈ xs, 0 ≤ x) : 0 ≤ total xs := by
  induction xs with
  | nil => exact Int.le_refl 0
  | cons x xs ih =>
    have hx := h x List.mem_cons_self
    have hr := ih (fun y hy => h y (List.mem_cons_of_mem x hy))
    show 0 ≤ x + total xs; omega

/-- STABLE IFF EVERY DOOR IS CLOSED: partial widths are nonnegative, so the total width vanishes
    exactly when every channel's does. -/
theorem stable_iff_every_door_closed (xs : List Int) (h : ∀ x ∈ xs, 0 ≤ x) :
    total xs = 0 ↔ ∀ x ∈ xs, x = 0 := by
  constructor
  · intro h0
    induction xs with
    | nil => intro x hx; cases hx
    | cons y ys ih =>
      have hy := h y List.mem_cons_self
      have hr := total_nonneg ys (fun z hz => h z (List.mem_cons_of_mem y hz))
      have e : y + total ys = 0 := h0
      have y0 : y = 0 := by omega
      have t0 : total ys = 0 := by omega
      intro x hx
      cases hx with
      | head => exact y0
      | tail _ hm => exact ih (fun z hz => h z (List.mem_cons_of_mem y hz)) t0 x hm
  · intro hall
    induction xs with
    | nil => rfl
    | cons y ys ih =>
      have y0 := hall y List.mem_cons_self
      have t0 := ih (fun z hz => h z (List.mem_cons_of_mem y hz))
        (fun z hz => hall z (List.mem_cons_of_mem y hz))
      show y + total ys = 0; omega

/-- Opening a door widens the line: every open channel adds to the width. -/
theorem an_open_door_widens (x : Int) (xs : List Int) (hx : 0 < x) :
    total xs < total (x :: xs) := by
  show total xs < x + total xs; omega

/-! ## Part VIII. The capstone -/

/-- RESONANCES STAND OFF THE LINE BY HALF THE WIDTH. An unstable state lands off the line by its
    width and is stationary exactly when the width vanishes; its time mirror is its fold partner
    with one mass; the line shape falls to half its peak at half the width, peaks at the mass and is
    symmetric about it; a closed system keeps every energy real; the width vanishes exactly when
    every decay channel is closed. -/
theorem resonances_off_the_line :
    (∀ M Γ : Int, phi (resonance M Γ) = (1 + Γ, M)) ∧
    (∀ M Γ : Int, OnLine (phi (resonance M Γ)) ↔ Γ = 0) ∧
    (∀ M Γ : Int, Γ ≠ 0 → reg (phi (resonance M Γ).mirror) = reg (phi (resonance M Γ))) ∧
    (∀ g : Int, 2 * bwNum g = bwDen g g) ∧
    (∀ d g : Int, d ≠ 0 → bwNum g < bwDen d g) ∧
    (∀ H : Block, 0 ≤ H.disc) ∧
    (∀ xs : List Int, (∀ x ∈ xs, 0 ≤ x) → (total xs = 0 ↔ ∀ x ∈ xs, x = 0)) :=
  ⟨off_the_line_by_the_width, fun M Γ => (on_the_line_iff_stable M Γ).1,
   fun M Γ h => (decay_and_capture_one_record M Γ h).2.2, half_maximum_at_half_width,
   line_peaks_at_the_mass, closed_stays_on_the_line, stable_iff_every_door_closed⟩

end SPHYS.Resonance

#print axioms SPHYS.Resonance.pe
#print axioms SPHYS.Resonance.fold_involutive
#print axioms SPHYS.Resonance.seat_fixed_line
#print axioms SPHYS.Resonance.reg_lands
#print axioms SPHYS.Resonance.reg_fixes_iff
#print axioms SPHYS.Resonance.reg_forgets_side
#print axioms SPHYS.Resonance.least_erasure_iff_value
#print axioms SPHYS.Resonance.equivariant_id
#print axioms SPHYS.Resonance.equivariant_comp
#print axioms SPHYS.Resonance.fix_functorial
#print axioms SPHYS.Resonance.fold_global_seat
#print axioms SPHYS.Resonance.equivariant_carrier_lands
#print axioms SPHYS.Resonance.value_on_image
#print axioms SPHYS.Resonance.kinetic_crossing
#print axioms SPHYS.Resonance.off_locus_pair
#print axioms SPHYS.Resonance.ee
#print axioms SPHYS.Resonance.mirror_involutive
#print axioms SPHYS.Resonance.psi_phi
#print axioms SPHYS.Resonance.phi_psi
#print axioms SPHYS.Resonance.phi_injective
#print axioms SPHYS.Resonance.phi_equivariant
#print axioms SPHYS.Resonance.mirror_fixed_iff_real
#print axioms SPHYS.Resonance.phi_line_iff_real
#print axioms SPHYS.Resonance.stationary_iff_real
#print axioms SPHYS.Resonance.line_is_stationary
#print axioms SPHYS.Resonance.measured_on_line
#print axioms SPHYS.Resonance.no_measurement_off_line
#print axioms SPHYS.Resonance.energy_carrier_lands
#print axioms SPHYS.Resonance.bar_involutive
#print axioms SPHYS.Resonance.bar_fixed_iff_neutral
#print axioms SPHYS.Resonance.odd_charges_even_energy
#print axioms SPHYS.Resonance.gravity_reads_no_charge_bit
#print axioms SPHYS.Resonance.involutions_commute
#print axioms SPHYS.Resonance.tmirror_involutive
#print axioms SPHYS.Resonance.joint_fixed_iff
#print axioms SPHYS.Resonance.charge_carrier_equivariant
#print axioms SPHYS.Resonance.pair_lands_once
#print axioms SPHYS.Resonance.tmirror_equivariant
#print axioms SPHYS.Resonance.neutral_charge_on_line
#print axioms SPHYS.Resonance.pair_on_the_edges
#print axioms SPHYS.Resonance.stable_lands
#print axioms SPHYS.Resonance.sq_nonneg
#print axioms SPHYS.Resonance.block_T_fixed_iff
#print axioms SPHYS.Resonance.stationarity_survives_the_magnet
#print axioms SPHYS.Resonance.off_the_line_by_the_width
#print axioms SPHYS.Resonance.on_the_line_iff_stable
#print axioms SPHYS.Resonance.decay_and_capture_one_record
#print axioms SPHYS.Resonance.half_maximum_at_half_width
#print axioms SPHYS.Resonance.sq_pos_of_ne
#print axioms SPHYS.Resonance.line_peaks_at_the_mass
#print axioms SPHYS.Resonance.line_symmetric
#print axioms SPHYS.Resonance.the_width_is_the_leak
#print axioms SPHYS.Resonance.closed_stays_on_the_line
#print axioms SPHYS.Resonance.total_nonneg
#print axioms SPHYS.Resonance.stable_iff_every_door_closed
#print axioms SPHYS.Resonance.an_open_door_widens
#print axioms SPHYS.Resonance.resonances_off_the_line
