/-
  SPHYS_Entanglement.lean · the correlation lives in the joint registration, read at the Riemann seat.
  Core Lean 4.19.0, standalone, no import, no library, no axiom declared.

  The chart: h = 2 Re s, t = Im s; the fold s ↦ 1 − s̄ is (h, t) ↦ (2 − h, t), the critical line h = 1.

  Part I     the seat, the category of involutions, the functor of the seat.
  Part II    the energy carrier (resident).
  Part III   the substrate (resident).
  Part IV     Two local records and a local fold.
  Part V      Bell's bound is a count of local strategies.
  Part VI     The capstone.
-/
set_option autoImplicit false
namespace SPHYS.Entanglement


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


/-! ## Part IV. Two local records and a local fold -/

/-- A joint record of two parties: counts of the four outcome pairs (++, +−, −+, −−). -/
structure Table where
  pp : Int
  pm : Int
  mp : Int
  mm : Int
  deriving DecidableEq, Repr

/-- Alice relabels her outcome: n(a, b) ↦ n(−a, b). -/
def flipA (t : Table) : Table := ⟨t.mp, t.mm, t.pp, t.pm⟩

theorem flipA_involutive (t : Table) : flipA (flipA t) = t := rfl

def corr (t : Table) : Int := t.pp - t.pm - t.mp + t.mm
def aliceBias (t : Table) : Int := (t.pp + t.pm) - (t.mp + t.mm)
def bobRecord (t : Table) : Int × Int := (t.pp + t.mp, t.pm + t.mm)

theorem corr_odd (t : Table) : corr (flipA t) = - corr t := by
  show t.mp - t.mm - t.pp + t.pm = -(t.pp - t.pm - t.mp + t.mm); omega

theorem aliceBias_odd (t : Table) : aliceBias (flipA t) = - aliceBias t := by
  show (t.mp + t.mm) - (t.pp + t.pm) = -((t.pp + t.pm) - (t.mp + t.mm)); omega

/-- NO SIGNAL: Alice's local operation leaves Bob's record unchanged. -/
theorem bob_sees_no_flip (t : Table) : bobRecord (flipA t) = bobRecord t := by
  show ((t.mp + t.pp, t.mm + t.pm) : Int × Int) = (t.pp + t.mp, t.pm + t.mm)
  rw [Int.add_comm t.mp t.pp, Int.add_comm t.mm t.pm]

/-- The local carrier: Alice's bias is the offset from the line, the total the height. -/
def localSeat (t : Table) : Pt := (1 + aliceBias t, t.pp + t.pm + t.mp + t.mm)

theorem local_carrier_equivariant : Equivariant localSeat flipA fold := by
  intro t
  show ((1 + aliceBias (flipA t), t.mp + t.mm + t.pp + t.pm) : Pt) = (2 - (1 + aliceBias t), t.pp + t.pm + t.mp + t.mm)
  rw [aliceBias_odd, pe]; exact ⟨by omega, by omega⟩

/-- An unbiased local record is the line. -/
theorem unbiased_is_the_line (t : Table) : OnLine (localSeat t) ↔ aliceBias t = 0 := by
  show 1 + aliceBias t = 1 ↔ aliceBias t = 0
  exact ⟨fun h => by omega, fun h => by omega⟩

/-- THE CORRELATION IS NOT IN THE LOCAL RECORDS: two joint records with the same unbiased local
    records on both sides carry opposite correlations, so no function of the local records returns
    the correlation. -/
theorem correlation_is_not_in_the_local_records (g : Int → Int × Int → Int) :
    ¬ ∀ t : Table, g (aliceBias t) (bobRecord t) = corr t := by
  intro hg
  have h1 := hg ⟨1, 0, 0, 1⟩
  have h2 := hg ⟨0, 1, 1, 0⟩
  change g 0 (1, 1) = 2 at h1; change g 0 (1, 1) = -2 at h2
  omega

/-- NO SIGNAL, AS A WALL: whether Alice flipped is odd, Bob's record is even, and no function of
    Bob's record returns Alice's choice. -/
theorem no_signal_from_a_local_choice (g : Int × Int → Bool) (t : Table) :
    ¬ ∀ b : Bool, g (bobRecord (if b then flipA t else t)) = b := by
  intro hg
  have h1 : g (bobRecord (flipA t)) = true := hg true
  have h2 : g (bobRecord t) = false := hg false
  rw [bob_sees_no_flip] at h1
  rw [h1] at h2; exact Bool.noConfusion h2

/-! ## Part V. Bell's bound is a count of local strategies -/

def sgn (b : Bool) : Int := if b then 1 else -1

/-- The CHSH value of one deterministic local strategy: outcomes fixed for each setting. -/
def chsh (a0 a1 b0 b1 : Bool) : Int :=
  sgn a0 * sgn b0 + sgn a0 * sgn b1 + sgn a1 * sgn b0 - sgn a1 * sgn b1

/-- EVERY LOCAL STRATEGY GIVES ±2: all sixteen counted. -/
theorem local_strategies_give_two :
    ([false, true].all fun a0 => [false, true].all fun a1 => [false, true].all fun b0 =>
      [false, true].all fun b1 => chsh a0 a1 b0 b1 == 2 || chsh a0 a1 b0 b1 == -2) = true := by
  decide

theorem chsh_values (a0 a1 b0 b1 : Bool) : chsh a0 a1 b0 b1 = 2 ∨ chsh a0 a1 b0 b1 = -2 := by
  cases a0 <;> cases a1 <;> cases b0 <;> cases b1 <;> decide

/-- A local model is a mixture of strategies with nonnegative weights. -/
def mixS : List (Int × (Bool × Bool × Bool × Bool)) → Int
  | [] => 0
  | (w, (a0, a1, b0, b1)) :: rest => w * chsh a0 a1 b0 b1 + mixS rest

def mixW : List (Int × (Bool × Bool × Bool × Bool)) → Int
  | [] => 0
  | (w, _) :: rest => w + mixW rest

/-- BELL'S BOUND: every local mixture obeys |S| ≤ 2 times its total weight. -/
theorem bell_bound (l : List (Int × (Bool × Bool × Bool × Bool))) (hw : ∀ e ∈ l, 0 ≤ e.1) :
    -2 * mixW l ≤ mixS l ∧ mixS l ≤ 2 * mixW l := by
  induction l with
  | nil => exact ⟨by decide, by decide⟩
  | cons e rest ih =>
    obtain ⟨w, a0, a1, b0, b1⟩ := e
    have h0 : 0 ≤ w := hw _ (List.Mem.head _)
    have ih' := ih (fun x hx => hw x (List.Mem.tail _ hx))
    show -2 * (w + mixW rest) ≤ w * chsh a0 a1 b0 b1 + mixS rest ∧ w * chsh a0 a1 b0 b1 + mixS rest ≤ 2 * (w + mixW rest)
    rcases chsh_values a0 a1 b0 b1 with h | h <;> rw [h] <;> constructor <;> omega

/-- THE PR BOX: the outcomes agree unless both settings are 1, where they disagree; scaled by two,
    each allowed pair carries weight 1, so each correlation reads ±2 and the scaled CHSH sum 8 is a
    CHSH value of 4. Its local records are unbiased for every setting. -/
def prP (x y a b : Bool) : Int := if (a != b) = (x && y) then 1 else 0
def prE (x y : Bool) : Int := prP x y true true - prP x y true false - prP x y false true + prP x y false false

theorem pr_box_reaches_four : prE false false + prE false true + prE true false - prE true true = 2 * 4 := by decide

theorem pr_box_signals_nothing :
    ([false, true].all fun x => [false, true].all fun y => [false, true].all fun a =>
      (prP x y a true + prP x y a false == prP x (!y) a true + prP x (!y) a false) &&
      (prP y x true a + prP y x false a == prP (!y) x true a + prP (!y) x false a)) = true := by
  decide

/-! ## Part VI. The capstone -/

/-- THE CORRELATION LIVES IN THE JOINT REGISTRATION. A local relabelling is the fold on the local
    record and the unbiased record the line; the far record is blind to it, so no signal passes; the
    correlation is odd and no function of the local records returns it; every local strategy gives
    ±2 and every local mixture obeys Bell's bound; and a no-signalling box reaches 4. -/
theorem correlation_lives_in_the_joint_registration :
    Equivariant localSeat flipA fold ∧
    (∀ t : Table, OnLine (localSeat t) ↔ aliceBias t = 0) ∧
    (∀ t : Table, bobRecord (flipA t) = bobRecord t ∧ corr (flipA t) = - corr t) ∧
    (∀ g : Int → Int × Int → Int, ¬ ∀ t : Table, g (aliceBias t) (bobRecord t) = corr t) ∧
    (∀ (g : Int × Int → Bool) (t : Table), ¬ ∀ b : Bool, g (bobRecord (if b then flipA t else t)) = b) ∧
    (∀ l : List (Int × (Bool × Bool × Bool × Bool)), (∀ e ∈ l, 0 ≤ e.1) →
      -2 * mixW l ≤ mixS l ∧ mixS l ≤ 2 * mixW l) ∧
    prE false false + prE false true + prE true false - prE true true = 2 * 4 :=
  ⟨local_carrier_equivariant, unbiased_is_the_line, fun t => ⟨bob_sees_no_flip t, corr_odd t⟩,
   correlation_is_not_in_the_local_records, no_signal_from_a_local_choice, bell_bound, pr_box_reaches_four⟩

end SPHYS.Entanglement

#print axioms SPHYS.Entanglement.pe
#print axioms SPHYS.Entanglement.fold_involutive
#print axioms SPHYS.Entanglement.seat_fixed_line
#print axioms SPHYS.Entanglement.reg_lands
#print axioms SPHYS.Entanglement.reg_fixes_iff
#print axioms SPHYS.Entanglement.reg_forgets_side
#print axioms SPHYS.Entanglement.least_erasure_iff_value
#print axioms SPHYS.Entanglement.equivariant_id
#print axioms SPHYS.Entanglement.equivariant_comp
#print axioms SPHYS.Entanglement.fix_functorial
#print axioms SPHYS.Entanglement.fold_global_seat
#print axioms SPHYS.Entanglement.equivariant_carrier_lands
#print axioms SPHYS.Entanglement.value_on_image
#print axioms SPHYS.Entanglement.kinetic_crossing
#print axioms SPHYS.Entanglement.off_locus_pair
#print axioms SPHYS.Entanglement.ee
#print axioms SPHYS.Entanglement.mirror_involutive
#print axioms SPHYS.Entanglement.psi_phi
#print axioms SPHYS.Entanglement.phi_psi
#print axioms SPHYS.Entanglement.phi_injective
#print axioms SPHYS.Entanglement.phi_equivariant
#print axioms SPHYS.Entanglement.mirror_fixed_iff_real
#print axioms SPHYS.Entanglement.phi_line_iff_real
#print axioms SPHYS.Entanglement.stationary_iff_real
#print axioms SPHYS.Entanglement.line_is_stationary
#print axioms SPHYS.Entanglement.measured_on_line
#print axioms SPHYS.Entanglement.no_measurement_off_line
#print axioms SPHYS.Entanglement.energy_carrier_lands
#print axioms SPHYS.Entanglement.bar_involutive
#print axioms SPHYS.Entanglement.bar_fixed_iff_neutral
#print axioms SPHYS.Entanglement.odd_charges_even_energy
#print axioms SPHYS.Entanglement.gravity_reads_no_charge_bit
#print axioms SPHYS.Entanglement.involutions_commute
#print axioms SPHYS.Entanglement.tmirror_involutive
#print axioms SPHYS.Entanglement.joint_fixed_iff
#print axioms SPHYS.Entanglement.charge_carrier_equivariant
#print axioms SPHYS.Entanglement.pair_lands_once
#print axioms SPHYS.Entanglement.tmirror_equivariant
#print axioms SPHYS.Entanglement.neutral_charge_on_line
#print axioms SPHYS.Entanglement.pair_on_the_edges
#print axioms SPHYS.Entanglement.stable_lands
#print axioms SPHYS.Entanglement.flipA_involutive
#print axioms SPHYS.Entanglement.corr_odd
#print axioms SPHYS.Entanglement.aliceBias_odd
#print axioms SPHYS.Entanglement.bob_sees_no_flip
#print axioms SPHYS.Entanglement.local_carrier_equivariant
#print axioms SPHYS.Entanglement.unbiased_is_the_line
#print axioms SPHYS.Entanglement.correlation_is_not_in_the_local_records
#print axioms SPHYS.Entanglement.no_signal_from_a_local_choice
#print axioms SPHYS.Entanglement.local_strategies_give_two
#print axioms SPHYS.Entanglement.chsh_values
#print axioms SPHYS.Entanglement.bell_bound
#print axioms SPHYS.Entanglement.pr_box_reaches_four
#print axioms SPHYS.Entanglement.pr_box_signals_nothing
#print axioms SPHYS.Entanglement.correlation_lives_in_the_joint_registration
