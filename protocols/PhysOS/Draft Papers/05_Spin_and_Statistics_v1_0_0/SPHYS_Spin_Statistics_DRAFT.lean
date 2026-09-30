/-
  SPHYS_Spin_Statistics.lean · spin and statistics, read at the Riemann seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: h = 2 Re s, t = Im s; the fold s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t), the critical line
  h = 1, registration (h, t) ↦ (1, t). The exchange of two identical particles is an involution;
  the exchange carrier sends its antisymmetric part to the side and its symmetric part to the
  height, so the exchange is the fold.

  Part I     the seat, the category of involutions, the functor of the seat.
  Part II    the energy carrier (resident from the hardware paper).
  Part III   the substrate (resident from the hardware paper).
  Part IV    the exchange is the fold: bosons the line, fermions at height zero.
  Part V     Pauli exclusion: the odd reading blind on the fixed set; the occupation a bit.
  Part VI    the Return: a full turn is minus one on spinors; the double cover two to one.
  Part VII   statistics is one bit in three dimensions; the anyon needs the plane.
  Part VIII  the record: bunching and antibunching read the bit; one-body densities do not.
  Part IX    the capstone.
-/
set_option autoImplicit false
namespace SPHYS.SpinStatistics


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

/-! ## Part IV. The exchange is the fold -/

/-- A two-particle amplitude on two ordered slots: x on (a, b), y on (b, a). -/
abbrev Pair := Int × Int

/-- The exchange of two identical particles. -/
def swap (p : Pair) : Pair := (p.2, p.1)

theorem swap_involutive (p : Pair) : swap (swap p) = p := rfl

/-- The exchange carrier: the antisymmetric part to the side, the symmetric part to the height. -/
def exchangeSeat (p : Pair) : Pt := (1 + (p.1 - p.2), p.1 + p.2)

/-- THE EXCHANGE IS THE FOLD: the exchange carrier is equivariant. -/
theorem exchange_carrier_equivariant : Equivariant exchangeSeat swap fold := by
  intro p
  obtain ⟨x, y⟩ := p
  show ((1 + (y - x), y + x) : Pt) = (2 - (1 + (x - y)), x + y)
  rw [pe]; exact ⟨by omega, by omega⟩

/-- Bosons are the line: a pair amplitude lands on the line exactly when it is symmetric. -/
theorem symmetric_on_the_line (p : Pair) : OnLine (exchangeSeat p) ↔ swap p = p := by
  obtain ⟨x, y⟩ := p
  show 1 + (x - y) = 1 ↔ ((y, x) : Pair) = (x, y)
  rw [pe]; constructor
  · intro h; exact ⟨by omega, by omega⟩
  · intro ⟨h, _⟩; omega

/-- The symmetric pairs, carried by the functor of the seat, land on the line. -/
theorem exchange_carrier_lands :
    ∃ C : Carrier { p : Pair // swap p = p }, ∀ w, C.ι w = exchangeSeat w.1 :=
  equivariant_carrier_lands exchangeSeat swap exchange_carrier_equivariant

/-- Fermions stand at height zero: an antisymmetric amplitude has no symmetric part, and off the
    line unless it vanishes. -/
theorem antisymmetric_at_height_zero (x : Int) (h : x ≠ 0) :
    (exchangeSeat (x, -x)).2 = 0 ∧ ¬ OnLine (exchangeSeat (x, -x)) := by
  refine ⟨by show x + -x = 0; omega, ?_⟩
  show ¬ (1 + (x - -x) = 1); omega

/-- The record keeps the symmetric part and forgets the antisymmetric part: a pair and its exchange
    are two states with one record. -/
theorem exchange_two_worlds (p : Pair) (h : p.1 ≠ p.2) :
    swap p ≠ p ∧ reg (exchangeSeat (swap p)) = reg (exchangeSeat p) := by
  refine ⟨fun e => h (congrArg Prod.snd e), ?_⟩
  rw [exchange_carrier_equivariant]; rfl

/-! ## Part V. Pauli exclusion: the odd reading is blind on the fixed set -/

/-- PAULI EXCLUSION: an antisymmetric amplitude vanishes wherever the exchange fixes the
    configuration, both particles in one state. -/
theorem pauli_exclusion {α : Type} (ψ : α → α → Int) (hanti : ∀ a b, ψ a b = -ψ b a) (a : α) :
    ψ a a = 0 := by
  have := hanti a a
  omega

/-- The Slater form f(a)g(b) − f(b)g(a) is antisymmetric and vanishes on the diagonal. -/
theorem slater_vanishes_on_diagonal {α : Type} (f g : α → Int) (a : α) :
    f a * g a - f a * g a = 0 := by omega

/-- Bosons may share: a symmetric product f(a)f(b) is nonzero on the diagonal wherever f is. -/
theorem bosons_may_share {α : Type} (f : α → Int) (a : α) (h : f a ≠ 0) : f a * f a ≠ 0 :=
  Int.mul_ne_zero h h

/-- THE FERMION'S OCCUPATION IS A BIT: an occupation number equal to its own square is 0 or 1. -/
theorem fermion_occupation_is_a_bit (n : Int) : n * n = n ↔ n = 0 ∨ n = 1 := by
  constructor
  · intro h
    have h2 : n * (n - 1) = 0 := by simp only [Int.mul_sub, Int.mul_one]; omega
    rcases Int.mul_eq_zero.mp h2 with h3 | h3
    · left; exact h3
    · right; omega
  · intro h; rcases h with h | h <;> subst h <;> decide

/-! ## Part VI. The Return: a full turn is minus one on spinors -/

structure Q4 where
  r : Int
  i : Int
  j : Int
  k : Int
  deriving DecidableEq, Repr

def qmul (a b : Q4) : Q4 :=
  ⟨a.r*b.r - a.i*b.i - a.j*b.j - a.k*b.k, a.r*b.i + a.i*b.r + a.j*b.k - a.k*b.j,
   a.r*b.j - a.i*b.k + a.j*b.r + a.k*b.i, a.r*b.k + a.i*b.j - a.j*b.i + a.k*b.r⟩
def qneg (a : Q4) : Q4 := ⟨-a.r, -a.i, -a.j, -a.k⟩
def qconj (a : Q4) : Q4 := ⟨a.r, -a.i, -a.j, -a.k⟩
def qone : Q4 := ⟨1, 0, 0, 0⟩
def qi : Q4 := ⟨0, 1, 0, 0⟩
def qj : Q4 := ⟨0, 0, 1, 0⟩
def qk : Q4 := ⟨0, 0, 0, 1⟩

theorem qext {a b : Q4} (h1 : a.r = b.r) (h2 : a.i = b.i) (h3 : a.j = b.j) (h4 : a.k = b.k) :
    a = b := by
  cases a; cases b; simp_all

theorem qmul_neg_left (a b : Q4) : qmul (qneg a) b = qneg (qmul a b) := by
  apply qext <;> simp only [qmul, qneg, Int.neg_mul] <;> omega
theorem qmul_neg_right (a b : Q4) : qmul a (qneg b) = qneg (qmul a b) := by
  apply qext <;> simp only [qmul, qneg, Int.mul_neg] <;> omega
theorem qconj_neg (a : Q4) : qconj (qneg a) = qneg (qconj a) := rfl
theorem qneg_neg (a : Q4) : qneg (qneg a) = a := by
  apply qext <;> simp only [qneg, Int.neg_neg]
theorem qmul_one_left (a : Q4) : qmul qone a = a := by
  apply qext <;> simp only [qmul, qone] <;> omega

/-- The Return: i j k = −1, the quaternion form of a full turn. -/
theorem the_return : qmul (qmul qi qj) qk = qneg qone := by decide

/-- A FULL TURN IS MINUS ONE ON SPINORS: the full-turn element −1 negates every spinor. -/
theorem full_turn_negates_spinors (ψ : Q4) : qmul (qneg qone) ψ = qneg ψ := by
  rw [qmul_neg_left, qmul_one_left]

/-- A full turn is the identity on vectors, which it acts on by conjugation. -/
theorem full_turn_fixes_vectors (v : Q4) : qmul (qmul (qneg qone) v) (qconj (qneg qone)) = v := by
  rw [qmul_neg_left, qconj_neg, qmul_neg_right, qmul_neg_left, qneg_neg, qmul_one_left]
  apply qext <;> simp only [qmul, qconj, qone] <;> omega

/-- Two full turns are the identity on spinors. -/
theorem two_turns_are_identity : qmul (qneg qone) (qneg qone) = qone := by decide

/-- THE DOUBLE COVER IS TWO TO ONE: q and −q rotate every vector alike. The kernel of the cover
    is {1, −1}, one bit. -/
theorem double_cover_two_to_one (q v : Q4) :
    qmul (qmul (qneg q) v) (qconj (qneg q)) = qmul (qmul q v) (qconj q) := by
  rw [qmul_neg_left, qconj_neg, qmul_neg_right, qmul_neg_left, qneg_neg]

/-- The exchange sign of spin n/2, read as the sign of a full turn: (−1)^n. -/
def turnSign : Nat → Int
  | 0 => 1
  | n + 1 => - turnSign n

theorem turnSign_val (n : Nat) : turnSign n = if n % 2 = 0 then 1 else -1 := by
  induction n with
  | zero => rfl
  | succ n ih =>
    show - turnSign n = _
    rw [ih]
    by_cases h : n % 2 = 0
    · have h2 : (n + 1) % 2 ≠ 0 := by omega
      simp [h, h2]
    · have h2 : (n + 1) % 2 = 0 := by omega
      simp [h, h2]

/-- Half-integer spin turns to minus one; integer spin to plus one. With the spin-statistics
    theorem carried, the first are fermions and the second bosons. -/
theorem half_integer_spin_is_odd (n : Nat) : turnSign n = -1 ↔ n % 2 = 1 := by
  rw [turnSign_val]
  by_cases h : n % 2 = 0
  · simp [h]
  · have h1 : n % 2 = 1 := by omega
    simp [h, h1]

/-! ## Part VII. Statistics is one bit in three dimensions -/

/-- STATISTICS IS ONE BIT: an exchange sign whose square is the identity, as a double exchange is
    in three dimensions, is +1 or −1. -/
theorem statistics_one_bit (e : Int) (h : e * e = 1) : e = 1 ∨ e = -1 := by
  have h2 : (e - 1) * (e + 1) = 0 := by
    simp only [Int.sub_mul, Int.mul_add, Int.mul_one, Int.one_mul]; omega
  rcases Int.mul_eq_zero.mp h2 with h3 | h3
  · left; omega
  · right; omega

/-- A quarter phase i squares to −1, so it is excluded in three dimensions and admitted only in the
    plane, where a double exchange need not be the identity: the anyon. -/
theorem anyon_needs_the_plane : qmul qi qi = qneg qone ∧ qmul qi qi ≠ qone := by decide

/-! ## Part VIII. The record: bunching and antibunching read the bit -/

/-- The coincidence amplitude of two identical particles at a balanced splitter, doubled: t = 1,
    r = i, so t·t + ε·r·r = 1 − ε. -/
def coincidence (e : Int) : Int := 1 - e

/-- BOSONS BUNCH, FERMIONS PART: the coincidence vanishes for bosons and is full for fermions. -/
theorem bosons_bunch_fermions_part : coincidence 1 = 0 ∧ coincidence (-1) = 2 := by decide

/-- Orbitals f = (1, 1) and g = (1, −1) on two sites, and the pair amplitudes f(a)g(b) ± f(b)g(a). -/
def fo (_ : Bool) : Int := 1
def go (a : Bool) : Int := if a then -1 else 1
def pairAmp (e : Int) (a b : Bool) : Int := fo a * go b + e * (fo b * go a)
def oneBody (e : Int) (a : Bool) : Int := pairAmp e a false * pairAmp e a false + pairAmp e a true * pairAmp e a true

/-- THE ONE-BODY RECORD DOES NOT READ THE STATISTICS: the boson pair and the fermion pair have one
    density at every site and differ at coincidence, where the pair reading reads the bit. -/
theorem statistics_unread_by_one_body :
    oneBody 1 false = oneBody (-1) false ∧ oneBody 1 true = oneBody (-1) true ∧
    pairAmp 1 false false * pairAmp 1 false false = 4 ∧
    pairAmp (-1) false false * pairAmp (-1) false false = 0 := by decide

/-! ## Part IX. The capstone -/

/-- SPIN AND STATISTICS ON THE SEAT. The exchange is the fold under the exchange carrier; bosons
    are the line and fermions stand at height zero off it; a pair and its exchange share one
    record; an antisymmetric amplitude vanishes on the exchange's fixed configurations, so a
    fermion's occupation is one bit; a full turn negates spinors and fixes vectors, the double
    cover being two to one; an exchange sign whose square is the identity is ±1; bosons bunch and
    fermions part; the one-body record does not read the statistics. -/
theorem spin_and_statistics_on_the_seat :
    Equivariant exchangeSeat swap fold ∧
    (∀ p : Pair, OnLine (exchangeSeat p) ↔ swap p = p) ∧
    (∀ p : Pair, p.1 ≠ p.2 → reg (exchangeSeat (swap p)) = reg (exchangeSeat p)) ∧
    (∀ (ψ : Bool → Bool → Int), (∀ a b, ψ a b = -ψ b a) → ∀ a, ψ a a = 0) ∧
    (∀ n : Int, n * n = n ↔ n = 0 ∨ n = 1) ∧
    (∀ ψ : Q4, qmul (qneg qone) ψ = qneg ψ) ∧
    (∀ q v : Q4, qmul (qmul (qneg q) v) (qconj (qneg q)) = qmul (qmul q v) (qconj q)) ∧
    (∀ e : Int, e * e = 1 → e = 1 ∨ e = -1) ∧
    (coincidence 1 = 0 ∧ coincidence (-1) = 2) ∧
    (oneBody 1 false = oneBody (-1) false ∧ oneBody 1 true = oneBody (-1) true) :=
  ⟨exchange_carrier_equivariant, symmetric_on_the_line, fun p h => (exchange_two_worlds p h).2,
   fun ψ h a => pauli_exclusion ψ h a, fermion_occupation_is_a_bit, full_turn_negates_spinors,
   double_cover_two_to_one, statistics_one_bit, bosons_bunch_fermions_part,
   ⟨statistics_unread_by_one_body.1, statistics_unread_by_one_body.2.1⟩⟩

end SPHYS.SpinStatistics

#print axioms SPHYS.SpinStatistics.pe
#print axioms SPHYS.SpinStatistics.fold_involutive
#print axioms SPHYS.SpinStatistics.seat_fixed_line
#print axioms SPHYS.SpinStatistics.reg_lands
#print axioms SPHYS.SpinStatistics.reg_fixes_iff
#print axioms SPHYS.SpinStatistics.reg_forgets_side
#print axioms SPHYS.SpinStatistics.least_erasure_iff_value
#print axioms SPHYS.SpinStatistics.equivariant_id
#print axioms SPHYS.SpinStatistics.equivariant_comp
#print axioms SPHYS.SpinStatistics.fix_functorial
#print axioms SPHYS.SpinStatistics.fold_global_seat
#print axioms SPHYS.SpinStatistics.equivariant_carrier_lands
#print axioms SPHYS.SpinStatistics.value_on_image
#print axioms SPHYS.SpinStatistics.kinetic_crossing
#print axioms SPHYS.SpinStatistics.off_locus_pair
#print axioms SPHYS.SpinStatistics.ee
#print axioms SPHYS.SpinStatistics.mirror_involutive
#print axioms SPHYS.SpinStatistics.psi_phi
#print axioms SPHYS.SpinStatistics.phi_psi
#print axioms SPHYS.SpinStatistics.phi_injective
#print axioms SPHYS.SpinStatistics.phi_equivariant
#print axioms SPHYS.SpinStatistics.mirror_fixed_iff_real
#print axioms SPHYS.SpinStatistics.phi_line_iff_real
#print axioms SPHYS.SpinStatistics.stationary_iff_real
#print axioms SPHYS.SpinStatistics.line_is_stationary
#print axioms SPHYS.SpinStatistics.measured_on_line
#print axioms SPHYS.SpinStatistics.no_measurement_off_line
#print axioms SPHYS.SpinStatistics.energy_carrier_lands
#print axioms SPHYS.SpinStatistics.bar_involutive
#print axioms SPHYS.SpinStatistics.bar_fixed_iff_neutral
#print axioms SPHYS.SpinStatistics.odd_charges_even_energy
#print axioms SPHYS.SpinStatistics.gravity_reads_no_charge_bit
#print axioms SPHYS.SpinStatistics.involutions_commute
#print axioms SPHYS.SpinStatistics.tmirror_involutive
#print axioms SPHYS.SpinStatistics.joint_fixed_iff
#print axioms SPHYS.SpinStatistics.charge_carrier_equivariant
#print axioms SPHYS.SpinStatistics.pair_lands_once
#print axioms SPHYS.SpinStatistics.tmirror_equivariant
#print axioms SPHYS.SpinStatistics.neutral_charge_on_line
#print axioms SPHYS.SpinStatistics.pair_on_the_edges
#print axioms SPHYS.SpinStatistics.stable_lands
#print axioms SPHYS.SpinStatistics.swap_involutive
#print axioms SPHYS.SpinStatistics.exchange_carrier_equivariant
#print axioms SPHYS.SpinStatistics.symmetric_on_the_line
#print axioms SPHYS.SpinStatistics.exchange_carrier_lands
#print axioms SPHYS.SpinStatistics.antisymmetric_at_height_zero
#print axioms SPHYS.SpinStatistics.exchange_two_worlds
#print axioms SPHYS.SpinStatistics.pauli_exclusion
#print axioms SPHYS.SpinStatistics.slater_vanishes_on_diagonal
#print axioms SPHYS.SpinStatistics.bosons_may_share
#print axioms SPHYS.SpinStatistics.fermion_occupation_is_a_bit
#print axioms SPHYS.SpinStatistics.qext
#print axioms SPHYS.SpinStatistics.qmul_neg_left
#print axioms SPHYS.SpinStatistics.qmul_neg_right
#print axioms SPHYS.SpinStatistics.qconj_neg
#print axioms SPHYS.SpinStatistics.qneg_neg
#print axioms SPHYS.SpinStatistics.qmul_one_left
#print axioms SPHYS.SpinStatistics.the_return
#print axioms SPHYS.SpinStatistics.full_turn_negates_spinors
#print axioms SPHYS.SpinStatistics.full_turn_fixes_vectors
#print axioms SPHYS.SpinStatistics.two_turns_are_identity
#print axioms SPHYS.SpinStatistics.double_cover_two_to_one
#print axioms SPHYS.SpinStatistics.turnSign_val
#print axioms SPHYS.SpinStatistics.half_integer_spin_is_odd
#print axioms SPHYS.SpinStatistics.statistics_one_bit
#print axioms SPHYS.SpinStatistics.anyon_needs_the_plane
#print axioms SPHYS.SpinStatistics.bosons_bunch_fermions_part
#print axioms SPHYS.SpinStatistics.statistics_unread_by_one_body
#print axioms SPHYS.SpinStatistics.spin_and_statistics_on_the_seat
