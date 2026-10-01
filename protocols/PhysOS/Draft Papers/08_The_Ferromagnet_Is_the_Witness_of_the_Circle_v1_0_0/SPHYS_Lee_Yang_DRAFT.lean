/-
  SPHYS_Lee_Yang.lean · the ferromagnet is the witness of the circle, read at the Riemann seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: h = 2 Re s, t = Im s; the fold s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t), the critical line
  h = 1. The logarithmic carrier s = 1/2 + (ln z)/2 sends the fugacity z of an Ising system to the
  strip, inversion z ↦ 1/z̄ in the unit circle to the fold, and the circle to the line.

  Part I     the seat, the category of involutions, the functor of the seat.
  Part II    the energy carrier (resident).
  Part III   the substrate (resident).
  Part IV    the circle is the line.
  Part V     spin flip is the palindrome: the ring census, counted.
  Part VI    the four-spin ring and the two-spin system: zeros on the circle exactly when
             ferromagnetic; the antiferromagnet leaves.
  Part VII   the capstone.
-/
set_option autoImplicit false
namespace SPHYS.LeeYang


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

/-! ## Part IV. The circle is the line -/

/-- A point of the fugacity plane in polar form: log-radius ρ = ln |z| and angle θ. -/
abbrev Polar := Int × Int

/-- Inversion in the unit circle, z ↦ 1/z̄: the log-radius reverses, the angle stays. -/
def invert (z : Polar) : Polar := (-z.1, z.2)

theorem invert_involutive (z : Polar) : invert (invert z) = z := by
  obtain ⟨r, t⟩ := z; show ((- -r, t) : Polar) = (r, t); rw [Int.neg_neg]

/-- The logarithmic carrier: s = 1/2 + (ln z)/2, in the doubled chart h = 1 + ρ, t = θ. -/
def circleSeat (z : Polar) : Pt := (1 + z.1, z.2)

/-- THE CIRCLE IS THE LINE: inversion in the unit circle is the fold under the logarithmic carrier. -/
theorem circle_carrier_equivariant : Equivariant circleSeat invert fold := by
  intro z
  obtain ⟨r, t⟩ := z
  show ((1 + -r, t) : Pt) = (2 - (1 + r), t)
  rw [pe]; exact ⟨by omega, rfl⟩

/-- A fugacity lands on the line exactly when it lies on the unit circle. -/
theorem unit_circle_is_the_line (z : Polar) : OnLine (circleSeat z) ↔ z.1 = 0 := by
  obtain ⟨r, t⟩ := z
  show 1 + r = 1 ↔ r = 0
  exact ⟨fun h => by omega, fun h => by subst h; rfl⟩

theorem circle_carrier_lands :
    ∃ C : Carrier { z : Polar // invert z = z }, ∀ w, C.ι w = circleSeat w.1 :=
  equivariant_carrier_lands circleSeat invert circle_carrier_equivariant

/-! ## Part V. Spin flip is the palindrome -/

/-- The domain walls of a ring of n spins, and its count of down spins. -/
def walls (n : Nat) (s : Nat → Bool) : Nat := ((List.range n).filter (fun i => s i != s ((i + 1) % n))).length
def downs (n : Nat) (s : Nat → Bool) : Nat := ((List.range n).filter (fun i => s i)).length

/-- Flipping every spin keeps every wall: the energy is even under spin flip, so the partition
    function's coefficients are palindromic and its zeros pair under inversion. -/
theorem walls_flip (n : Nat) (s : Nat → Bool) : walls n (fun i => !s i) = walls n s := by
  unfold walls
  congr 1
  apply List.filter_congr
  intro i _
  show ((!s i) != (!s ((i + 1) % n))) = (s i != s ((i + 1) % n))
  cases s i <;> cases s ((i + 1) % n) <;> rfl

def cfg (k : Nat) : Nat → Bool := fun i => (k >>> i) % 2 == 1
def census (n m w : Nat) : Nat :=
  ((List.range (2 ^ n)).filter (fun k => downs n (cfg k) == m && walls n (cfg k) == w)).length

/-- THE FOUR-SPIN RING, COUNTED: of its sixteen states, one has no down spin and no wall; four have
    one down spin and two walls; four have two adjacent down spins and two walls; two have two
    opposite down spins and four walls; four have three and two walls; one has four. -/
theorem ring4_census :
    census 4 0 0 = 1 ∧ census 4 1 2 = 4 ∧ census 4 2 2 = 4 ∧ census 4 2 4 = 2 ∧
    census 4 3 2 = 4 ∧ census 4 4 0 = 1 := by decide

/-- The census is palindromic in the down-spin count: spin flip read on the ring. -/
theorem ring4_palindrome :
    census 4 0 0 = census 4 4 0 ∧ census 4 1 2 = census 4 3 2 ∧ census 4 1 4 = census 4 3 4 := by decide

theorem ring6_palindrome :
    (List.range 7).all (fun m => (List.range 7).all (fun w => census 6 m w == census 6 (6 - m) w)) = true := by
  decide

/-! ## Part VI. The four-spin ring: zeros on the circle exactly when the coupling is ferromagnetic -/

/-- The palindromic reduction: with u = z + 1/z, z⁴ + a z³ + b z² + a z + 1 = z²(u² + a u + b − 2),
    written without division as an identity in z. Zeros on the circle are exactly real roots u in
    [−2, 2]. -/
theorem quartic_reduction (z a b : Int) :
    (z*z + 1)*(z*z + 1) + a*((z*z + 1)*z) + (b - 2)*(z*z) = z*z*z*z + a*(z*z*z) + b*(z*z) + a*z + 1 := by
  simp only [Int.add_mul, Int.mul_add, Int.sub_mul, Int.mul_sub, Int.mul_one, Int.one_mul, Int.mul_assoc]
  omega

/-- The four-spin ring's partition function is z⁴ + 4p z³ + (4p + 2p²) z² + 4p z + 1 with p = a², the
    Boltzmann weight of two walls. With p = n/d, its reduced quadratic u² + 4p u + (4p + 2p² − 2),
    scaled by d², has value 2(n − d)² at u = −2, value 2n² + 12nd + 2d² at u = 2, discriminant
    2(n − d)², and vertex −2n/d. -/
def qAtMinus2 (n d : Int) : Int := 4 * d * d - 8 * n * d + 4 * n * d + 2 * n * n - 2 * d * d
def qAtPlus2 (n d : Int) : Int := 4 * d * d + 8 * n * d + 4 * n * d + 2 * n * n - 2 * d * d
def quarterDisc (n d : Int) : Int := 4 * n * n - (4 * n * d + 2 * n * n - 2 * d * d)

/-- Both roots real and in [−2, 2]: the four standard conditions on a monic quadratic. -/
def OnCircle4 (n d : Int) : Prop :=
  0 ≤ qAtMinus2 n d ∧ 0 ≤ qAtPlus2 n d ∧ 0 ≤ quarterDisc n d ∧ -2 * d ≤ -2 * n ∧ -2 * n ≤ 2 * d

theorem sq_nonneg' (x : Int) : 0 ≤ x * x := by
  rcases Int.le_total 0 x with h | h
  · exact Int.mul_nonneg h h
  · have h' : 0 ≤ -x := by omega
    have := Int.mul_nonneg h' h'
    rw [Int.neg_mul_neg] at this; exact this

theorem qAtMinus2_square (n d : Int) : qAtMinus2 n d = 2 * ((n - d) * (n - d)) := by
  unfold qAtMinus2
  simp only [Int.sub_mul, Int.mul_sub, Int.mul_assoc]
  rw [Int.mul_comm d n]
  omega

theorem quarterDisc_square (n d : Int) : quarterDisc n d = 2 * ((n - d) * (n - d)) := by
  unfold quarterDisc
  simp only [Int.sub_mul, Int.mul_sub, Int.mul_assoc]
  rw [Int.mul_comm d n]
  omega

/-- THE LEE–YANG CIRCLE ON THE FOUR-SPIN RING: for 0 ≤ p = n/d, every zero lies on the unit circle
    exactly when p ≤ 1, the ferromagnetic range. -/
theorem ring4_lee_yang (n d : Int) (hn : 0 ≤ n) (hd : 0 < d) : OnCircle4 n d ↔ n ≤ d := by
  have e1 := qAtMinus2_square n d
  have e2 := quarterDisc_square n d
  have s := sq_nonneg' (n - d)
  have hnd : 0 ≤ n * d := Int.mul_nonneg hn (Int.le_of_lt hd)
  have hnn : 0 ≤ n * n := sq_nonneg' n
  have hdd : 0 ≤ d * d := sq_nonneg' d
  constructor
  · intro ⟨_, _, _, h4, _⟩; omega
  · intro h
    refine ⟨by omega, ?_, by omega, by omega, by omega⟩
    unfold qAtPlus2
    have : d * d * 2 ≤ 4 * d * d := by
      rw [Int.mul_assoc 4 d d]; omega
    have h8 : 0 ≤ 8 * n * d := by rw [Int.mul_assoc]; omega
    have h4 : 0 ≤ 4 * n * d := by rw [Int.mul_assoc]; omega
    have h2 : 0 ≤ 2 * n * n := by rw [Int.mul_assoc]; omega
    have h22 : 2 * d * d ≤ 4 * d * d := by rw [Int.mul_assoc 2, Int.mul_assoc 4]; omega
    omega

/-- The antiferromagnet leaves the circle: at p = 3/2 the vertex falls below −2. -/
theorem ring4_antiferro_leaves : ¬ OnCircle4 3 2 := by
  intro ⟨_, _, _, h, _⟩; omega

/-- THE TWO-SPIN CIRCLE: z² + 2a z + 1 with a = n/d has its zeros on the circle exactly when its
    scaled discriminant 4(n² − d²) is not positive, which for 0 ≤ n, 0 < d is a ≤ 1. -/
theorem two_spin_lee_yang (n d : Int) (hn : 0 ≤ n) (hd : 0 < d) : n * n - d * d ≤ 0 ↔ n ≤ d := by
  constructor
  · intro h
    by_cases h' : d < n
    · have := Int.mul_lt_mul_of_pos_left h' hd
      have := Int.mul_lt_mul_of_pos_right h' (show 0 < n by omega)
      omega
    · omega
  · intro h
    have := Int.mul_le_mul_of_nonneg_left h hn
    have := Int.mul_le_mul_of_nonneg_right h (Int.le_of_lt hd)
    omega

/-- On the circle the conjugate zeros multiply to the constant term: x = −n/d and y² = (d² − n²)/d²
    give x² + y² = 1, which scaled by d² reads n² + (d² − n²) = d². -/
theorem conjugate_zeros_on_circle (n d : Int) : n * n + (d * d - n * n) = d * d := by omega

/-! ## Part VII. The capstone -/

/-- THE FERROMAGNET IS THE WITNESS OF THE CIRCLE. Inversion in the unit circle is the fold under the
    logarithmic carrier, so the circle is the line; spin flip keeps every wall, so the partition
    function is palindromic and its zeros pair under inversion; the four-spin ring's zeros lie on
    the circle exactly in the ferromagnetic range and leave it for an antiferromagnet; the two-spin
    system likewise. Positivity of the coupling supplies the locus. -/
theorem ferromagnet_witnesses_the_circle :
    Equivariant circleSeat invert fold ∧
    (∀ z : Polar, OnLine (circleSeat z) ↔ z.1 = 0) ∧
    (∀ (n : Nat) (s : Nat → Bool), walls n (fun i => !s i) = walls n s) ∧
    (census 4 0 0 = 1 ∧ census 4 1 2 = 4 ∧ census 4 2 2 = 4 ∧ census 4 2 4 = 2) ∧
    (∀ n d : Int, 0 ≤ n → 0 < d → (OnCircle4 n d ↔ n ≤ d)) ∧
    ¬ OnCircle4 3 2 ∧
    (∀ n d : Int, 0 ≤ n → 0 < d → (n * n - d * d ≤ 0 ↔ n ≤ d)) :=
  ⟨circle_carrier_equivariant, unit_circle_is_the_line, walls_flip,
   ⟨ring4_census.1, ring4_census.2.1, ring4_census.2.2.1, ring4_census.2.2.2.1⟩,
   ring4_lee_yang, ring4_antiferro_leaves, two_spin_lee_yang⟩

end SPHYS.LeeYang

#print axioms SPHYS.LeeYang.pe
#print axioms SPHYS.LeeYang.fold_involutive
#print axioms SPHYS.LeeYang.seat_fixed_line
#print axioms SPHYS.LeeYang.reg_lands
#print axioms SPHYS.LeeYang.reg_fixes_iff
#print axioms SPHYS.LeeYang.reg_forgets_side
#print axioms SPHYS.LeeYang.least_erasure_iff_value
#print axioms SPHYS.LeeYang.equivariant_id
#print axioms SPHYS.LeeYang.equivariant_comp
#print axioms SPHYS.LeeYang.fix_functorial
#print axioms SPHYS.LeeYang.fold_global_seat
#print axioms SPHYS.LeeYang.equivariant_carrier_lands
#print axioms SPHYS.LeeYang.value_on_image
#print axioms SPHYS.LeeYang.kinetic_crossing
#print axioms SPHYS.LeeYang.off_locus_pair
#print axioms SPHYS.LeeYang.ee
#print axioms SPHYS.LeeYang.mirror_involutive
#print axioms SPHYS.LeeYang.psi_phi
#print axioms SPHYS.LeeYang.phi_psi
#print axioms SPHYS.LeeYang.phi_injective
#print axioms SPHYS.LeeYang.phi_equivariant
#print axioms SPHYS.LeeYang.mirror_fixed_iff_real
#print axioms SPHYS.LeeYang.phi_line_iff_real
#print axioms SPHYS.LeeYang.stationary_iff_real
#print axioms SPHYS.LeeYang.line_is_stationary
#print axioms SPHYS.LeeYang.measured_on_line
#print axioms SPHYS.LeeYang.no_measurement_off_line
#print axioms SPHYS.LeeYang.energy_carrier_lands
#print axioms SPHYS.LeeYang.bar_involutive
#print axioms SPHYS.LeeYang.bar_fixed_iff_neutral
#print axioms SPHYS.LeeYang.odd_charges_even_energy
#print axioms SPHYS.LeeYang.gravity_reads_no_charge_bit
#print axioms SPHYS.LeeYang.involutions_commute
#print axioms SPHYS.LeeYang.tmirror_involutive
#print axioms SPHYS.LeeYang.joint_fixed_iff
#print axioms SPHYS.LeeYang.charge_carrier_equivariant
#print axioms SPHYS.LeeYang.pair_lands_once
#print axioms SPHYS.LeeYang.tmirror_equivariant
#print axioms SPHYS.LeeYang.neutral_charge_on_line
#print axioms SPHYS.LeeYang.pair_on_the_edges
#print axioms SPHYS.LeeYang.stable_lands
#print axioms SPHYS.LeeYang.invert_involutive
#print axioms SPHYS.LeeYang.circle_carrier_equivariant
#print axioms SPHYS.LeeYang.unit_circle_is_the_line
#print axioms SPHYS.LeeYang.circle_carrier_lands
#print axioms SPHYS.LeeYang.walls_flip
#print axioms SPHYS.LeeYang.ring4_census
#print axioms SPHYS.LeeYang.ring4_palindrome
#print axioms SPHYS.LeeYang.ring6_palindrome
#print axioms SPHYS.LeeYang.quartic_reduction
#print axioms SPHYS.LeeYang.sq_nonneg'
#print axioms SPHYS.LeeYang.qAtMinus2_square
#print axioms SPHYS.LeeYang.quarterDisc_square
#print axioms SPHYS.LeeYang.ring4_lee_yang
#print axioms SPHYS.LeeYang.ring4_antiferro_leaves
#print axioms SPHYS.LeeYang.two_spin_lee_yang
#print axioms SPHYS.LeeYang.conjugate_zeros_on_circle
#print axioms SPHYS.LeeYang.ferromagnet_witnesses_the_circle
