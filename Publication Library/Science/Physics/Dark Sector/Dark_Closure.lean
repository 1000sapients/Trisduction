/-
  THE DARK CLOSURE · the dark sector read on the closure template.
  Core Lean 4.19.0, standalone, no library, no axiom declared. Companion kernel of
  "Dark Matter as the Charge-Conjugation Fixed Set and the Dark Force as One Keyed Bit" (27 September 2026).

  THE READER'S FRAME. This file proves finite, typed placements and nothing more. It does not identify the dark
  matter particle, derive its abundance, derive the value of the vacuum energy, or decide whether a dark gauge
  force exists. Where a question is keyed, the file proves that it is keyed and stops.
  Part I    The fixed set. Conjugation flips every gauge charge and keeps mass. Every charge-linear reading
            vanishes on its fixed set; gravity, the even reading, does not.
  Part II   The seat is not electric neutrality. A charge-free state has zero radiative weight; a multiplet with
            one neutral member is not a dark multiplet.
  Part III  Gravity does not read identity: two species with one density leave one record.
  Part IV   The neutrino fog: one energy record, two sources; direction is the odd reading.
  Part V    The fifth reading. Anomaly closure constrains a dark U(1) and does not decide it: a keyed bit.
  Part VI   The dark force in the acceleration sense: active density, kinetic floor, phantom divide, budget.
  Part VII  The dark ledger, computed.
-/
namespace DarkClosure

/-! ## Part I. The fixed set and its readings. -/

/-- A state: hypercharge and weak isospin times six, one colour weight (a Cartan coordinate), one dark charge, mass. -/
structure State where
  y6 : Int
  t3x6 : Int
  colour : Int
  dark : Int
  mass : Nat
  deriving DecidableEq, Repr

/-- Charge conjugation: every gauge charge flipped, the mass kept. -/
def conj (c : State) : State := ⟨-c.y6, -c.t3x6, -c.colour, -c.dark, c.mass⟩

/-- Visible conjugation: the three Standard Model charges flipped, the dark charge and the mass kept. -/
def conjSM (c : State) : State := ⟨-c.y6, -c.t3x6, -c.colour, c.dark, c.mass⟩

def neutral (c : State) : Prop := c.y6 = 0 ∧ c.t3x6 = 0 ∧ c.colour = 0 ∧ c.dark = 0
def neutralSM (c : State) : Prop := c.y6 = 0 ∧ c.t3x6 = 0 ∧ c.colour = 0

theorem conj_involution (c : State) : conj (conj c) = c := by
  cases c with
  | mk y t k d m =>
    show State.mk (- -y) (- -t) (- -k) (- -d) m = State.mk y t k d m
    rw [Int.neg_neg, Int.neg_neg, Int.neg_neg, Int.neg_neg]

/-- THE FIXED SET: a state is its own conjugate exactly when it carries no gauge charge at all. -/
theorem fixed_iff_neutral (c : State) : conj c = c ↔ neutral c := by
  cases c with
  | mk y t k d m =>
    show State.mk (-y) (-t) (-k) (-d) m = State.mk y t k d m ↔ (y = 0 ∧ t = 0 ∧ k = 0 ∧ d = 0)
    constructor
    · intro h
      have h1 := congrArg State.y6 h
      have h2 := congrArg State.t3x6 h
      have h3 := congrArg State.colour h
      have h4 := congrArg State.dark h
      change -y = y at h1
      change -t = t at h2
      change -k = k at h3
      change -d = d at h4
      exact ⟨by omega, by omega, by omega, by omega⟩
    · intro ⟨h1, h2, h3, h4⟩
      subst h1; subst h2; subst h3; subst h4
      rfl

theorem fixedSM_iff_neutralSM (c : State) : conjSM c = c ↔ neutralSM c := by
  cases c with
  | mk y t k d m =>
    show State.mk (-y) (-t) (-k) d m = State.mk y t k d m ↔ (y = 0 ∧ t = 0 ∧ k = 0)
    constructor
    · intro h
      have h1 := congrArg State.y6 h
      have h2 := congrArg State.t3x6 h
      have h3 := congrArg State.colour h
      change -y = y at h1
      change -t = t at h2
      change -k = k at h3
      exact ⟨by omega, by omega, by omega⟩
    · intro ⟨h1, h2, h3⟩
      subst h1; subst h2; subst h3
      rfl

/-- The full fixed set lies inside the visible one. -/
theorem fixed_sub_fixedSM (c : State) (h : conj c = c) : conjSM c = c := by
  obtain ⟨h1, h2, h3, _⟩ := (fixed_iff_neutral c).mp h
  exact (fixedSM_iff_neutralSM c).mpr ⟨h1, h2, h3⟩

/-- A dark-charged state: invisible to the three visible readings, read by a fifth. -/
def darkCharged (m : Nat) : State := ⟨0, 0, 0, 1, m⟩

theorem dark_charge_hidden_from_the_visible (m : Nat) :
    conjSM (darkCharged m) = darkCharged m ∧ conj (darkCharged m) ≠ darkCharged m := by
  refine ⟨rfl, ?_⟩
  intro h
  have h4 : -(1 : Int) = 1 := congrArg State.dark h
  omega

/-- A reading is odd when conjugation flips its sign, even when conjugation keeps it. -/
def OddReading (r : State → Int) : Prop := ∀ c, r (conj c) = -r c
def EvenReading {β : Type} (r : State → β) : Prop := ∀ c, r (conj c) = r c

/-- EVERY ODD READING IS BLIND TO THE FIXED SET. -/
theorem odd_reading_blind (r : State → Int) (hr : OddReading r) (c : State) (hc : conj c = c) :
    r c = 0 := by
  have h := hr c
  rw [hc] at h
  omega

/-- Every integer combination of the four charges is an odd reading. The couplings of the photon, the Z, the
    diagonal gluons and a dark photon to a state are all of this form. -/
theorem charge_linear_readings_odd (a b k d : Int) :
    OddReading (fun c => a * c.y6 + b * c.t3x6 + k * c.colour + d * c.dark) := by
  intro c
  show a * (-c.y6) + b * (-c.t3x6) + k * (-c.colour) + d * (-c.dark) =
    -(a * c.y6 + b * c.t3x6 + k * c.colour + d * c.dark)
  simp only [Int.mul_neg]
  omega

/-- Electric charge times six, Q = T3 + Y. -/
def charge6 (c : State) : Int := c.t3x6 + c.y6

theorem charge_reading_odd : OddReading charge6 := by
  intro c
  show -c.t3x6 + -c.y6 = -(c.t3x6 + c.y6)
  omega

/-- Gravity reads the mass. -/
def readG (c : State) : Nat := c.mass

theorem gravity_reading_even : EvenReading readG := by
  intro c
  rfl

def darkState (m : Nat) : State := ⟨0, 0, 0, 0, m⟩

theorem dark_state_fixed (m : Nat) : conj (darkState m) = darkState m := rfl

/-- ONLY GRAVITY READS THE FIXED SET: every odd reading returns zero on it; the even reading returns the mass. -/
theorem only_gravity_reads_the_fixed_set (r : State → Int) (hr : OddReading r) (m : Nat) :
    r (darkState m) = 0 ∧ readG (darkState m) = m :=
  ⟨odd_reading_blind r hr (darkState m) (dark_state_fixed m), rfl⟩

/-- DARK IS FIXED: a state on which every odd reading returns zero is exactly a state that conjugation fixes.
    "Dark" in the gauge sense and "on the fixed set" are one property. -/
theorem dark_iff_fixed (c : State) : (∀ r : State → Int, OddReading r → r c = 0) ↔ conj c = c := by
  constructor
  · intro h
    have h1 := h (fun x => x.y6) (fun _ => rfl)
    have h2 := h (fun x => x.t3x6) (fun _ => rfl)
    have h3 := h (fun x => x.colour) (fun _ => rfl)
    have h4 := h (fun x => x.dark) (fun _ => rfl)
    exact (fixed_iff_neutral c).mpr ⟨h1, h2, h3, h4⟩
  · intro hc r hr
    exact odd_reading_blind r hr c hc

/-! ## Part II. The seat is not electric neutrality; a charge-free state cannot radiate. -/

/-- A neutrino-like state: T3 = +1/2 and Y = -1/2, so electric charge zero. The scalar partner of the neutrino
    carries exactly these charges. -/
def sneutrinoLike (m : Nat) : State := ⟨-3, 3, 0, 0, m⟩

theorem electric_neutrality_is_not_the_seat (m : Nat) :
    charge6 (sneutrinoLike m) = 0 ∧ conj (sneutrinoLike m) ≠ sneutrinoLike m := by
  refine ⟨?_, ?_⟩
  · show (3 : Int) + -3 = 0
    decide
  · intro h
    have h1 : -(-3 : Int) = -3 := congrArg State.y6 h
    omega

theorem sq_nonneg (x : Int) : 0 ≤ x * x := by
  cases Int.le_total 0 x with
  | inl h => exact Int.mul_nonneg h h
  | inr h =>
    have hn : 0 ≤ -x := by omega
    have := Int.mul_nonneg hn hn
    rw [Int.neg_mul_neg] at this
    exact this

theorem sq_eq_zero {x : Int} (h : x * x = 0) : x = 0 := by
  cases Int.mul_eq_zero.mp h with
  | inl h => exact h
  | inr h => exact h

/-- The radiative weight: the sum of the squared charges, the strength with which a state emits gauge quanta. -/
def radiative (c : State) : Int :=
  c.y6 * c.y6 + c.t3x6 * c.t3x6 + c.colour * c.colour + c.dark * c.dark

def radiativeSM (c : State) : Int := c.y6 * c.y6 + c.t3x6 * c.t3x6 + c.colour * c.colour

theorem radiative_zero_iff_neutral (c : State) : radiative c = 0 ↔ neutral c := by
  cases c with
  | mk y t k d m =>
    show y * y + t * t + k * k + d * d = 0 ↔ (y = 0 ∧ t = 0 ∧ k = 0 ∧ d = 0)
    have h1 := sq_nonneg y
    have h2 := sq_nonneg t
    have h3 := sq_nonneg k
    have h4 := sq_nonneg d
    constructor
    · intro h
      exact ⟨sq_eq_zero (by omega), sq_eq_zero (by omega), sq_eq_zero (by omega), sq_eq_zero (by omega)⟩
    · intro ⟨e1, e2, e3, e4⟩
      subst e1; subst e2; subst e3; subst e4
      decide

/-- NO CHARGE, NO RADIATION: the radiative weight vanishes exactly on the fixed set. A state that cannot emit
    cannot cool, and a population that cannot cool cannot settle into a thin disk. -/
theorem no_charge_no_radiation (c : State) : radiative c = 0 ↔ conj c = c :=
  (radiative_zero_iff_neutral c).trans (fixed_iff_neutral c).symm

/-- A dark-charged state emits no visible quanta and does emit dark ones. -/
theorem dark_charged_radiates_only_dark (m : Nat) :
    radiativeSM (darkCharged m) = 0 ∧ radiative (darkCharged m) = 1 := by
  refine ⟨?_, ?_⟩
  · show (0 : Int) * 0 + 0 * 0 + 0 * 0 = 0
    decide
  · show (0 : Int) * 0 + 0 * 0 + 0 * 0 + 1 * 1 = 1
    decide

/-- A multiplet is dark when every member sits on the fixed set. -/
def darkMultiplet (l : List State) : Bool := l.all (fun c => decide (conj c = c))

/-- An isospin triplet with Y = 0: T3 = +1, 0, -1, times six. Its middle member is neutral. -/
def tripletLike : List State := [⟨0, 6, 0, 0, 1⟩, ⟨0, 0, 0, 0, 1⟩, ⟨0, -6, 0, 0, 1⟩]
def singletLike : List State := [⟨0, 0, 0, 0, 1⟩]

theorem a_neutral_member_is_not_a_dark_multiplet :
    tripletLike.any (fun c => decide (conj c = c)) = true ∧ darkMultiplet tripletLike = false ∧
    darkMultiplet singletLike = true := by decide

/-! ## Part III. Gravity does not read identity. -/

/-- A species: a label only a non-gravitational instrument reads, and the mass density gravity reads. -/
structure Species where
  label : Nat
  density : Nat
  deriving DecidableEq, Repr

def gravRecord (s : Species) : Nat := s.density

/-- NO GRAVITATIONAL READING RETURNS THE IDENTITY: two species with one density are one gravitational record. -/
theorem identity_unread (s t : Species) (hd : s.density = t.density) (hl : s.label ≠ t.label)
    (g : Nat → Nat) : ¬ (g (gravRecord s) = s.label ∧ g (gravRecord t) = t.label) := by
  intro ⟨h1, h2⟩
  unfold gravRecord at h1 h2
  rw [hd] at h1
  exact hl (h1.symm.trans h2)

/-- The instance: a heavy particle and a light wave-like field, one halo, one density. -/
def heavyHalo : Species := ⟨1, 3⟩
def lightHalo : Species := ⟨2, 3⟩

theorem two_species_one_record (g : Nat → Nat) :
    ¬ (g (gravRecord heavyHalo) = heavyHalo.label ∧ g (gravRecord lightHalo) = lightHalo.label) :=
  identity_unread heavyHalo lightHalo rfl (by decide) g

/-! ## Part IV. The neutrino fog: one energy record, two sources. -/

/-- A nuclear recoil: its energy, and whether it points back to the Sun or to the halo wind. -/
structure Recoil where
  energy : Nat
  solar : Bool
  deriving DecidableEq, Repr

/-- The direction flip exchanges the two sources and keeps the energy. -/
def flipDir (r : Recoil) : Recoil := ⟨r.energy, !r.solar⟩
def energyRecord (r : Recoil) : Nat := r.energy

theorem energy_record_even (r : Recoil) : energyRecord (flipDir r) = energyRecord r := rfl
theorem source_odd (r : Recoil) : (flipDir r).solar = !r.solar := rfl

/-- THE FOG: at one energy, a solar recoil and a halo recoil leave one energy record, and no reading of that
    record returns the source. -/
theorem fog_one_record (g : Nat → Bool) (e : Nat) :
    ¬ (g (energyRecord ⟨e, true⟩) = true ∧ g (energyRecord ⟨e, false⟩) = false) := by
  intro ⟨h1, h2⟩
  have e1 : g e = true := h1
  have e2 : g e = false := h2
  exact absurd (e1.symm.trans e2) (by decide)

/-- The direction reading separates them. -/
theorem direction_separates (e : Nat) : (⟨e, true⟩ : Recoil).solar ≠ (⟨e, false⟩ : Recoil).solar := by
  intro h
  have h' : true = false := h
  exact absurd h' (by decide)

/-! ## Part V. The fifth reading. -/

/-- A left-handed Weyl field: multiplicity, hypercharge times six, colour and isospin flags, a dark charge, and the
    colour representation sign c3: +1 for a triplet, -1 for an antitriplet, 0 for a colour singlet. -/
structure Weyl where
  name : String
  mult : Int
  y6 : Int
  triplet : Bool
  doublet : Bool
  qD : Int
  c3 : Int
  deriving Repr

/-- One Standard Model generation, no dark charge. -/
def sm : List Weyl :=
  [⟨"Q", 6, 1, true, true, 0, 1⟩, ⟨"u^c", 3, -4, true, false, 0, -1⟩, ⟨"d^c", 3, 2, true, false, 0, -1⟩,
   ⟨"L", 2, -3, false, true, 0, 0⟩, ⟨"e^c", 1, 6, false, false, 0, 0⟩]

def total (f : Weyl → Int) (xs : List Weyl) : Int := xs.foldl (fun a w => a + f w) 0

/-- Anomaly freedom of one generation with a dark U(1): six visible conditions and six dark ones (cubic,
    gravitational, mixed with hypercharge twice, with colour and with isospin). Each check is the anomaly coefficient up
    to a positive normalization, Dynkin index 1/2 for every fundamental; the colour cube is the representation sum with
    A(3) = +1 and A(3bar) = -1. No check reads a field's name. -/
def closes (w : List Weyl) : Bool :=
  total (fun x => x.mult * x.y6) w == 0 &&
  total (fun x => x.mult * x.y6 ^ 3) w == 0 &&
  total (fun x => (x.mult / 3) * x.y6) (w.filter (·.triplet)) == 0 &&
  total (fun x => (x.mult / 2) * x.y6) (w.filter (·.doublet)) == 0 &&
  total (fun x => x.mult / 2) (w.filter (·.doublet)) % 2 == 0 &&
  total (fun x => (x.mult / 3) * x.c3) (w.filter (·.triplet)) == 0 &&
  total (fun x => x.mult * x.qD) w == 0 &&
  total (fun x => x.mult * (x.qD * x.qD * x.qD)) w == 0 &&
  total (fun x => x.mult * (x.qD * x.qD) * x.y6) w == 0 &&
  total (fun x => x.mult * x.qD * (x.y6 * x.y6)) w == 0 &&
  total (fun x => (x.mult / 3) * x.qD) (w.filter (·.triplet)) == 0 &&
  total (fun x => (x.mult / 2) * x.qD) (w.filter (·.doublet)) == 0

/-- A dark Weyl field: a Standard Model singlet with dark charge q. -/
def chi (q : Int) : Weyl := ⟨"chi", 1, 0, false, false, q, 0⟩

/-- A vector-like dark pair without dark charge, and the same pair charged +1 and -1. -/
def worldD0 : List Weyl := sm ++ [chi 0, chi 0]
def worldD : List Weyl := sm ++ [chi 1, chi (-1)]
/-- One chiral dark fermion of charge +1: anomalous. -/
def worldBad : List Weyl := sm ++ [chi 1]

/-- The fifth reading: some field carries a dark charge. -/
def fifth (w : List Weyl) : Bool := w.any (fun x => x.qD != 0)

/-- The template record: everything the visible closure reads, the dark charge struck out. -/
def record (w : List Weyl) : List (String × Int × Int × Bool × Bool × Int) :=
  w.map (fun x => (x.name, x.mult, x.y6, x.triplet, x.doublet, x.c3))

theorem visible_generation_closes : closes sm = true := by decide
theorem closure_admits_both : closes worldD0 = true ∧ closes worldD = true := by decide
theorem closure_is_not_vacuous : closes worldBad = false := by decide
theorem one_record_two_worlds : record worldD0 = record worldD := by decide
theorem fifth_differs : fifth worldD0 = false ∧ fifth worldD = true := by decide

/-- NO TEMPLATE READING DECIDES THE FIFTH: no function of the template record returns whether a dark charge
    exists. -/
theorem no_template_reading_decides_fifth :
    ¬ ∃ g : List (String × Int × Int × Bool × Bool × Int) → Bool, ∀ w, g (record w) = fifth w := by
  intro ⟨g, hg⟩
  have h1 := hg worldD0
  have h2 := hg worldD
  rw [one_record_two_worlds] at h1
  exact absurd (h1.symm.trans h2) (by decide)

/-- THE FIFTH IS KEYED: an anomaly-free world carries it and an anomaly-free world lacks it. -/
theorem fifth_is_keyed :
    (∃ w, closes w = true ∧ fifth w = true) ∧ (∃ w, closes w = true ∧ fifth w = false) :=
  ⟨⟨worldD, by decide⟩, ⟨worldD0, by decide⟩⟩

/-! ## Part VI. The dark force in the acceleration sense. -/

/-- The active gravitational density of a perfect fluid, rho + 3p. -/
def active (ρ p : Int) : Int := ρ + 3 * p

theorem dust_attracts (ρ : Int) (h : 0 < ρ) : 0 < active ρ 0 := by
  unfold active
  omega

theorem radiation_attracts (k : Int) (h : 0 < k) : 0 < active (3 * k) k := by
  unfold active
  omega

/-- VACUUM REPELS: pressure equal to minus the density gives active density -2 rho. -/
theorem vacuum_repels (ρ : Int) (h : 0 < ρ) : active ρ (-ρ) = -2 * ρ ∧ active ρ (-ρ) < 0 := by
  unfold active
  constructor <;> omega

theorem repulsion_needs_tension (ρ p : Int) (h : active ρ p < 0) : 3 * p < -ρ := by
  unfold active at h
  omega

/-- THE KINETIC FLOOR: a canonical field has rho = K + V and p = K - V with K ≥ 0, so rho + p = 2K ≥ 0 and the
    phantom divide w = -1 is never crossed from above. -/
theorem floor_forbids_phantom (K V : Int) (hK : 0 ≤ K) : 0 ≤ (K + V) + (K - V) := by
  omega

/-- w = -1 exactly when the kinetic term vanishes: the frozen field. -/
theorem vacuum_iff_frozen (K V : Int) : (K + V) + (K - V) = 0 ↔ K = 0 :=
  ⟨fun _ => by omega, fun _ => by omega⟩

theorem phantom_needs_ghost (K V : Int) (h : (K + V) + (K - V) < 0) : K < 0 := by
  omega

/-- Twice the deceleration parameter of a flat matter plus vacuum budget, in units of 1e-4. -/
def twoQ0 (om ol : Int) : Int := om - 2 * ol

/-- THE SIGN IS READ, NOT DERIVED: two flat budgets, one decelerating and one accelerating; the measured
    Planck 2018 budget is the second. -/
theorem flat_budgets_admit_both_signs :
    (10000 + 0 = (10000 : Int) ∧ 0 < twoQ0 10000 0) ∧
    (3153 + 6847 = (10000 : Int) ∧ twoQ0 3153 6847 < 0) := by decide

/-! ## Part VII. The dark ledger, computed. -/

inductive Status
  | crossed
  | pending
  | dot
  deriving DecidableEq, Repr

def status (seatAbsent formalMass worldCarrier : Bool) : Status :=
  if seatAbsent then .dot else if formalMass || worldCarrier then .crossed else .pending

inductive Owed
  | nothing
  | oneCarrier
  | oneOffering
  deriving DecidableEq, Repr

def owedOf (st : Status) (tailEmpty : Bool) : Owed :=
  match st with
  | .pending => if tailEmpty then .oneOffering else .oneCarrier
  | _ => .nothing

structure Entry where
  name : String
  seatAbsent : Bool
  formalMass : Bool
  worldCarrier : Bool
  tailEmpty : Bool
  printed : Status
  owed : Owed

def darkLedger : List Entry :=
  [⟨"DM exists, read by gravity", false, false, true, false, .crossed, .nothing⟩,
   ⟨"DM identity and charges", false, false, false, false, .pending, .oneCarrier⟩,
   ⟨"a fifth odd reading, the dark gauge force", false, false, false, false, .pending, .oneCarrier⟩,
   ⟨"DE: sign of the acceleration", false, false, true, false, .crossed, .nothing⟩,
   ⟨"DE: w = -1 exactly, the frozen field", false, false, false, false, .pending, .oneCarrier⟩,
   ⟨"DE: magnitude of rho_Lambda, derived", false, false, false, true, .pending, .oneOffering⟩]

/-- Every printed status and every printed debt is the computed one. -/
theorem dark_ledger_is_computed :
    darkLedger.all (fun e => status e.seatAbsent e.formalMass e.worldCarrier == e.printed &&
      owedOf e.printed e.tailEmpty == e.owed) = true := by decide

theorem dark_ledger_counts :
    darkLedger.length = 6 ∧
    (darkLedger.filter (fun e => e.printed == .crossed)).length = 2 ∧
    (darkLedger.filter (fun e => e.printed == .pending)).length = 4 ∧
    (darkLedger.filter (fun e => e.printed == .dot)).length = 0 ∧
    (darkLedger.filter (fun e => e.owed == .oneCarrier)).length = 3 ∧
    (darkLedger.filter (fun e => e.owed == .oneOffering)).length = 1 := by decide

/-! ## Audit additions, cycle darkforge, round 1 -/

/-- A C-fixed state is its mass: all four charges vanish. -/
theorem fixed_state_is_its_mass (c : State) (h : conj c = c) : c = darkState c.mass := by
  obtain ⟨y, t, k, d, m⟩ := c
  have hn : y = 0 ∧ t = 0 ∧ k = 0 ∧ d = 0 := (fixed_iff_neutral _).mp h
  obtain ⟨rfl, rfl, rfl, rfl⟩ := hn
  rfl

/-- Every reading, of either parity and any value type, returns on a C-fixed state a function of its mass alone. -/
theorem every_template_reading_of_the_fixed_set_reads_only_mass {β : Type} (r : State → β) (c : State)
    (h : conj c = c) : r c = r (darkState c.mass) :=
  congrArg r (fixed_state_is_its_mass c h)

/-- The Z reading in sixths, scaled by b: b T₃ minus a Q, the mixing weight being the rational a / b. -/
def zReading (a b : Int) (c : State) : Int := b * c.t3x6 - a * charge6 c

theorem z_reading_odd (a b : Int) : OddReading (zReading a b) := by
  intro c
  show b * -c.t3x6 - a * (-c.t3x6 + -c.y6) = -(b * c.t3x6 - a * (c.t3x6 + c.y6))
  rw [Int.mul_add, Int.mul_add, Int.mul_neg, Int.mul_neg, Int.mul_neg]
  omega

/-- At zero electric charge the Z reading is b T₃, nonzero for every rational weight a / b. -/
theorem z_reading_survives_neutrality (a b : Int) (m : Nat) (hb : b ≠ 0) :
    charge6 (sneutrinoLike m) = 0 ∧ zReading a b (sneutrinoLike m) = 3 * b ∧ 3 * b ≠ 0 := by
  refine ⟨(by decide : (3 : Int) + -3 = 0), ?_, ?_⟩
  · show b * 3 - a * (3 + -3) = 3 * b
    omega
  · omega

theorem the_triplet_has_one_fixed_member :
    (tripletLike.filter (fun c => decide (conj c = c))).length = 1 := by decide

/-- At positive density the floor is the bound w ≥ −1, for every rational w = a/b with b > 0 and p = w ρ. -/
theorem floor_bounds_w (K V a b : Int) (hK : 0 ≤ K) (hρ : 0 < K + V) (hb : 0 < b)
    (hw : b * (K - V) = a * (K + V)) : -b ≤ a := by
  have h2 : 0 ≤ b * ((K + V) + (K - V)) := Int.mul_nonneg (Int.le_of_lt hb) (by omega)
  have h3 : b * (K - V) + b * (K + V) = b * ((K + V) + (K - V)) := by
    rw [← Int.mul_add, Int.add_comm (K - V) (K + V)]
  have h1 : (-b) * (K + V) ≤ a * (K + V) := by rw [Int.neg_mul, ← hw]; omega
  exact Int.le_of_mul_le_mul_right h1 hρ

/-- At negative density the floor does not bound w: K = 1 and V = −3 give ρ = −2, p = 4, w = −2. -/
theorem floor_needs_positive_density :
    ∃ K V a b : Int, 0 ≤ K ∧ K + V < 0 ∧ 0 < b ∧ b * (K - V) = a * (K + V) ∧ a < -b :=
  ⟨1, -3, -2, 1, by decide, by decide, by decide, by decide, by decide⟩

/-- ρ + p summed over any list of fields (K, V). -/
def rhoPlusP : List (Int × Int) → Int
  | [] => 0
  | (k, v) :: t => (k + v) + (k - v) + rhoPlusP t

/-- The floor is additive: any number of fields with K ≥ 0 keeps ρ + p ≥ 0. -/
theorem floor_is_additive (l : List (Int × Int)) (h : ∀ x ∈ l, 0 ≤ x.1) : 0 ≤ rhoPlusP l := by
  induction l with
  | nil => exact Int.le_refl 0
  | cons x t ih =>
    obtain ⟨k, v⟩ := x
    have hx : 0 ≤ k := h (k, v) (List.Mem.head t)
    have ht : 0 ≤ rhoPlusP t := ih (fun y hy => h y (List.Mem.tail (k, v) hy))
    show 0 ≤ (k + v) + (k - v) + rhoPlusP t
    omega

/-- The step from ρ + p ≥ 0 to w ≥ −1, for any totals, at positive density, for every rational w = a/b, b > 0. -/
theorem w_floor_from_rho_plus_p (ρ p a b : Int) (h : 0 ≤ ρ + p) (hρ : 0 < ρ) (hb : 0 < b)
    (hw : b * p = a * ρ) : -b ≤ a := by
  have h2 : 0 ≤ b * (ρ + p) := Int.mul_nonneg (Int.le_of_lt hb) h
  have h3 : b * p + b * ρ = b * (ρ + p) := by rw [← Int.mul_add, Int.add_comm p ρ]
  have h1 : (-b) * ρ ≤ a * ρ := by rw [Int.neg_mul, ← hw]; omega
  exact Int.le_of_mul_le_mul_right h1 hρ

def rhoTot : List (Int × Int) → Int
  | [] => 0
  | (k, v) :: t => (k + v) + rhoTot t

def pTot : List (Int × Int) → Int
  | [] => 0
  | (k, v) :: t => (k - v) + pTot t

theorem rhoPlusP_split (l : List (Int × Int)) : rhoPlusP l = rhoTot l + pTot l := by
  induction l with
  | nil => rfl
  | cons x t ih =>
    obtain ⟨k, v⟩ := x
    show (k + v) + (k - v) + rhoPlusP t = ((k + v) + rhoTot t) + ((k - v) + pTot t)
    omega

/-- Any number of fields with K ≥ 0 at positive total density keeps w ≥ −1, for every rational w = a/b, b > 0. -/
theorem fields_bound_w (l : List (Int × Int)) (a b : Int) (h : ∀ x ∈ l, 0 ≤ x.1)
    (hρ : 0 < rhoTot l) (hb : 0 < b) (hw : b * pTot l = a * rhoTot l) : -b ≤ a := by
  have h0 : 0 ≤ rhoTot l + pTot l := by
    have := floor_is_additive l h
    rw [rhoPlusP_split] at this
    exact this
  exact w_floor_from_rho_plus_p (rhoTot l) (pTot l) a b h0 hρ hb hw

/-! ## Part VIII. Fortification: the measured nulls force the fixed set, the portals are derived, the fifth is free. -/

/-- The electric reading Q = T3 + Y, times six. -/
def q6of (c : State) : Int := c.t3x6 + c.y6

/-- THE PHOTON AND THE Z FORCE THE ELECTROWEAK CHARGES TO ZERO. At any mixing weight sin²θ_W = a/b with b ≠ 0, a state
    with Q = 0 and Z reading b·T3 − a·Q = 0 has T3 = 0 and Y = 0. -/
theorem photon_and_z_force_electroweak_zero (c : State) (a b : Int) (hb : b ≠ 0)
    (hq : q6of c = 0) (hz : b * c.t3x6 - a * q6of c = 0) : c.t3x6 = 0 ∧ c.y6 = 0 := by
  rw [hq, Int.mul_zero, Int.sub_zero] at hz
  have ht : c.t3x6 = 0 := by
    rcases Int.mul_eq_zero.mp hz with h | h
    · exact absurd h hb
    · exact h
  refine ⟨ht, ?_⟩
  unfold q6of at hq
  omega

/-- THE VISIBLE NULLS FORCE THE VISIBLE FIXED SET: a colourless state the photon and the Z both miss is fixed by the
    Standard Model's conjugation. Nothing here reads the dark charge. -/
theorem visible_nulls_force_the_visible_fixed_set (c : State) (a b : Int) (hb : b ≠ 0) (hq : q6of c = 0)
    (hz : b * c.t3x6 - a * q6of c = 0) (hk : c.colour = 0) : conjSM c = c := by
  obtain ⟨ht, hy⟩ := photon_and_z_force_electroweak_zero c a b hb hq hz
  exact (fixedSM_iff_neutralSM c).mpr ⟨hy, ht, hk⟩

/-- QUANTIZATION TURNS A BOUND INTO A ZERO: an integer charge bounded strictly inside one quantum is zero. -/
theorem below_one_quantum_is_zero (n : Int) (h1 : -1 < n) (h2 : n < 1) : n = 0 := by omega

/-- THE MEASURED BOUNDS FORCE THE VISIBLE FIXED SET: with charges quantized in sixths, a colourless state whose
    electric and Z readings are each bounded strictly inside one quantum is fixed by the Standard Model's conjugation. -/
theorem sub_quantum_bounds_force_the_visible_fixed_set (c : State) (a b : Int) (hb : 0 < b)
    (hq1 : -1 < q6of c) (hq2 : q6of c < 1)
    (hz1 : -b < b * c.t3x6 - a * q6of c) (hz2 : b * c.t3x6 - a * q6of c < b)
    (hk : c.colour = 0) : conjSM c = c := by
  have hq : q6of c = 0 := below_one_quantum_is_zero _ hq1 hq2
  rw [hq, Int.mul_zero, Int.sub_zero] at hz1 hz2
  have ht : c.t3x6 = 0 := by
    rcases Int.lt_trichotomy c.t3x6 0 with h | h | h
    · have : b * c.t3x6 ≤ b * (-1) := Int.mul_le_mul_of_nonneg_left (by omega) (Int.le_of_lt hb)
      omega
    · exact h
    · have : b * 1 ≤ b * c.t3x6 := Int.mul_le_mul_of_nonneg_left (by omega) (Int.le_of_lt hb)
      omega
  exact visible_nulls_force_the_visible_fixed_set c a b (by omega) hq (by rw [hq, ht]; simp) hk

/-- A field of the portal census: the five Standard Model left-handed Weyl fermions, the Higgs doublet, a real singlet
    scalar S and a singlet Weyl fermion N. -/
inductive Fld | Q | uc | dc | L | ec | H | S | N
  deriving DecidableEq, Repr

def Fld.y6 : Fld → Int
  | .Q => 1 | .uc => -4 | .dc => 2 | .L => -3 | .ec => 6 | .H => 3 | .S => 0 | .N => 0
def Fld.tri : Fld → Int
  | .Q => 1 | .uc => -1 | .dc => -1 | _ => 0
def Fld.doublet : Fld → Bool
  | .Q => true | .L => true | .H => true | _ => false
def Fld.darkF : Fld → Bool
  | .S => true | .N => true | _ => false

/-- A leg of a monomial: a field and whether it enters conjugated. -/
abbrev Leg := Fld × Bool
def legY (l : Leg) : Int := if l.2 then -l.1.y6 else l.1.y6
def legTri (l : Leg) : Int := if l.2 then -l.1.tri else l.1.tri
def sumI : List Int → Int
  | [] => 0
  | x :: t => x + sumI t

/-- Gauge invariance of a monomial: hypercharge sums to zero, colour triality to zero mod 3, and the doublets pair. -/
def invariantM (m : List Leg) : Bool :=
  sumI (m.map legY) == 0 && sumI (m.map legTri) % 3 == 0 && (m.filter (fun l => l.1.doublet)).length % 2 == 0

/-- A portal: an invariant monomial with a dark leg and a Standard Model leg. -/
def portalM (m : List Leg) : Bool :=
  invariantM m && m.any (fun l => l.1.darkF) && m.any (fun l => !l.1.darkF)

def scal : List Leg := [(.H, false), (.H, true), (.S, false)]
def fer : List Fld := [.Q, .uc, .dc, .L, .ec, .N]

/-- Every renormalizable Lorentz-scalar monomial without derivatives: two to four scalars, or two Weyl fermions of
    one chirality with at most one scalar. 6 + 10 + 15 + 168 = 199 monomials. -/
def census : List (List Leg) :=
  (List.range 3).flatMap (fun i => (List.range 3).flatMap (fun j =>
    if i ≤ j then [[scal.getD i (.S, false), scal.getD j (.S, false)]] else [])) ++
  (List.range 3).flatMap (fun i => (List.range 3).flatMap (fun j => (List.range 3).flatMap (fun k =>
    if i ≤ j ∧ j ≤ k then [[scal.getD i (.S, false), scal.getD j (.S, false), scal.getD k (.S, false)]]
    else []))) ++
  (List.range 3).flatMap (fun i => (List.range 3).flatMap (fun j => (List.range 3).flatMap (fun k =>
    (List.range 3).flatMap (fun l => if i ≤ j ∧ j ≤ k ∧ k ≤ l then
      [[scal.getD i (.S, false), scal.getD j (.S, false), scal.getD k (.S, false), scal.getD l (.S, false)]]
      else [])))) ++
  (List.range 6).flatMap (fun i => (List.range 6).flatMap (fun j => [false, true].flatMap (fun cj =>
    if i ≤ j then ([[], [(.H, false)], [(.H, true)], [(.S, false)]] : List (List Leg)).map
      (fun o => [(fer.getD i .N, cj), (fer.getD j .N, cj)] ++ o) else [])))

set_option maxRecDepth 200000 in
/-- THE PORTALS ARE DERIVED: of the 199 renormalizable monomials of the Standard Model with a singlet scalar and a
    singlet fermion, exactly four couple the two sectors: S H†H, S² H†H, and L N H with its conjugate. -/
theorem portals_are_derived :
    census.length = 199 ∧ (census.filter portalM).length = 4 ∧
    [(Fld.H, false), (Fld.H, true), (Fld.S, false)] ∈ census.filter portalM ∧
    [(Fld.H, false), (Fld.H, true), (Fld.S, false), (Fld.S, false)] ∈ census.filter portalM ∧
    [(Fld.L, false), (Fld.N, false), (Fld.H, false)] ∈ census.filter portalM ∧
    [(Fld.L, true), (Fld.N, true), (Fld.H, true)] ∈ census.filter portalM := by decide

/-- THE FIFTH IS FREE: a vector-like pair of Standard Model singlets closes all twelve conditions whatever its dark
    charge q, so every integer is allowed and the visible record fixes none. -/
theorem fifth_is_free (q : Int) : closes (sm ++ [chi q, chi (-q)]) = true := by
  simp [closes, total, sm, chi, Int.neg_mul, Int.mul_neg, Int.add_right_neg]


/-- THE TITLE'S TWO HALVES: C fixes a state exactly when the Standard Model's conjugation fixes it and its dark charge
    is zero. The first half is where measurement places dark matter; the second is the one keyed bit. -/
theorem fixed_iff_visible_fixed_and_no_dark_charge (c : State) : conj c = c ↔ (conjSM c = c ∧ c.dark = 0) := by
  rw [fixed_iff_neutral, fixedSM_iff_neutralSM]
  unfold neutral neutralSM
  constructor
  · intro ⟨h1, h2, h3, h4⟩; exact ⟨⟨h1, h2, h3⟩, h4⟩
  · intro ⟨⟨h1, h2, h3⟩, h4⟩; exact ⟨h1, h2, h3, h4⟩

/-- The electric charge of each component of a field, times six: both isospin components of a doublet. -/
def Fld.q6s : Fld → List Int
  | .Q => [4, -2] | .uc => [-4] | .dc => [2] | .L => [0, -6] | .ec => [6] | .H => [6, 0] | .S => [0] | .N => [0]

/-- EVERY COLOURED STANDARD MODEL FIELD IS CHARGED in every component. -/
theorem coloured_fields_are_charged : ∀ f : Fld, f.darkF = false → f.tri ≠ 0 → f.q6s.all (· != 0) = true := by
  intro f; cases f <;> decide

/-- A list of legs none of which is coloured has triality sum zero. -/
theorem sumI_tri_zero_of_none (rest : List Leg) (h : rest.any (fun l => l.1.tri != 0) = false) :
    sumI (rest.map legTri) = 0 := by
  induction rest with
  | nil => rfl
  | cons x t ih =>
    have hx : (x.1.tri != 0) = false := by
      cases hx' : (x.1.tri != 0) with
      | false => rfl
      | true => simp [List.any_cons, hx'] at h
    have ht : t.any (fun l => l.1.tri != 0) = false := by
      cases ht' : t.any (fun l => l.1.tri != 0) with
      | false => rfl
      | true => simp [List.any_cons, ht'] at h
    have hx0 : x.1.tri = 0 := by simpa using hx
    show legTri x + sumI (t.map legTri) = 0
    rw [ih ht]; unfold legTri; split <;> simp [hx0]

/-- A COLOURED RELIC BRINGS CHARGED PARTNERS: a colour-singlet composite of one new colour triplet with Standard Model
    legs contains a coloured Standard Model leg, and so an electrically charged constituent. -/
theorem a_coloured_relic_brings_charged_partners (rest : List Leg) (hsm : ∀ l ∈ rest, l.1.darkF = false)
    (hsing : (1 + sumI (rest.map legTri)) % 3 = 0) :
    ∃ l ∈ rest, l.1.tri ≠ 0 ∧ l.1.q6s.all (· != 0) = true := by
  cases hb : rest.any (fun l => l.1.tri != 0) with
  | false =>
    have h0 := sumI_tri_zero_of_none rest hb
    rw [h0] at hsing
    exact absurd hsing (by decide)
  | true =>
    obtain ⟨l, hl, hne⟩ := List.any_eq_true.mp hb
    have ht : l.1.tri ≠ 0 := by simpa using hne
    exact ⟨l, hl, ht, coloured_fields_are_charged l.1 (hsm l hl) ht⟩

/-- The number of legs of one field in a monomial. -/
def darkCount (f : Fld) (m : List Leg) : Nat := (m.filter (fun l => l.1 == f)).length
/-- Even under the dark parity that keeps the dark matter stable: an even number of S legs and of N legs. -/
def evenDark (m : List Leg) : Bool := darkCount .S m % 2 == 0 && darkCount .N m % 2 == 0

set_option maxRecDepth 200000 in
/-- A STABLE SINGLET KEEPS ONE DOOR: under the parity that keeps the dark matter stable exactly one portal survives,
    S² H†H, and none survives for the fermion. -/
theorem a_stable_singlet_keeps_one_door :
    (census.filter (fun m => portalM m && evenDark m)).length = 1 ∧
    [(Fld.H, false), (Fld.H, true), (Fld.S, false), (Fld.S, false)] ∈ census.filter (fun m => portalM m && evenDark m) ∧
    (census.filter (fun m => portalM m && evenDark m && (darkCount .N m != 0))).length = 0 := by decide


/-- A nonzero integer squares to at least one. -/
theorem one_le_sq_of_ne (q : Int) (h : q ≠ 0) : 1 ≤ q * q := by
  rcases Int.lt_trichotomy q 0 with hq | hq | hq
  · have h1 : q * q = (-q) * (-q) := (Int.neg_mul_neg q q).symm
    have h2 : (-q) * 1 ≤ (-q) * (-q) := Int.mul_le_mul_of_nonneg_left (by omega) (by omega)
    omega
  · exact absurd hq h
  · have h2 : q * 1 ≤ q * q := Int.mul_le_mul_of_nonneg_left (by omega) (by omega)
    omega

/-- Every integer squares to at least zero. -/
theorem zero_le_sq (q : Int) : 0 ≤ q * q := by
  rcases Int.lt_trichotomy q 0 with hq | hq | hq
  · have := one_le_sq_of_ne q (by omega); omega
  · subst hq; decide
  · have := one_le_sq_of_ne q (by omega); omega

/-- A BOUND FIXES A CHARGE THROUGH A MEASURED COUPLING: with the coupling fixed at g > 0, a force g q² below one
    quantum's force g is the zero charge. This is the photon's case. -/
theorem measured_coupling_bound_forces_zero (g q : Int) (hg : 0 < g) (h : g * (q * q) < g) : q = 0 := by
  rcases Int.lt_trichotomy q 0 with hq | hq | hq
  · have h2 : g * 1 ≤ g * (q * q) := Int.mul_le_mul_of_nonneg_left (one_le_sq_of_ne q (by omega)) (by omega)
    omega
  · exact hq
  · have h2 : g * 1 ≤ g * (q * q) := Int.mul_le_mul_of_nonneg_left (one_le_sq_of_ne q (by omega)) (by omega)
    omega

/-- A BOUND NEVER FIXES A CHARGE THROUGH A FREE COUPLING: for every positive bound and every charge, some positive
    coupling a/b puts the force (a/b) q² below the bound. This is the dark photon's case. -/
theorem free_coupling_bound_never_forces_zero (B q : Int) (hB : 0 < B) :
    ∃ a b : Int, 0 < a ∧ 0 < b ∧ a * (q * q) < B * b := by
  have h0 := zero_le_sq q
  refine ⟨1, q * q + 1, by decide, by omega, ?_⟩
  have h1 : 1 * (q * q + 1) ≤ B * (q * q + 1) := Int.mul_le_mul_of_nonneg_right (by omega) (by omega)
  omega

/-- The measured record of a state at mixing weight a/b: the photon null, the Z null, colour neutral, positive mass. -/
def Admissible (a b : Int) (c : State) : Prop :=
  q6of c = 0 ∧ b * c.t3x6 - a * q6of c = 0 ∧ c.colour = 0 ∧ 0 < c.mass

/-- THE FIRST CLAUSE IS FORCED: every state the measured record admits is fixed by the Standard Model's conjugation. -/
theorem first_clause_is_forced (a b : Int) (hb : b ≠ 0) : ∀ c, Admissible a b c → conjSM c = c :=
  fun c ⟨hq, hz, hk, _⟩ => visible_nulls_force_the_visible_fixed_set c a b hb hq hz hk

/-- THE SECOND CLAUSE IS KEYED: the measured record admits a world without a dark charge and a world with one. -/
theorem second_clause_is_keyed (a b : Int) (m : Nat) (hm : 0 < m) :
    Admissible a b ⟨0, 0, 0, 0, m⟩ ∧ Admissible a b ⟨0, 0, 0, 1, m⟩ := by
  refine ⟨⟨?_, ?_, rfl, hm⟩, ⟨?_, ?_, rfl, hm⟩⟩ <;> simp [q6of]

/-- NO READING OF THE RECORD DECIDES THE BIT: no function of the visible charges and the mass returns whether the dark
    charge vanishes. -/
theorem no_reading_of_the_record_decides_the_bit (g : Int → Int → Int → Nat → Bool) :
    ¬ ∀ c : State, g c.y6 c.t3x6 c.colour c.mass = decide (c.dark = 0) := by
  intro h
  have h1 : g 0 0 0 1 = true := h ⟨0, 0, 0, 0, 1⟩
  have h2 : g 0 0 0 1 = false := h ⟨0, 0, 0, 1, 1⟩
  exact Bool.noConfusion (h1.symm.trans h2)

/-- SELF-CONJUGACY SPENDS THE BIT: a state that is its own conjugate is fixed by the Standard Model's conjugation and
    carries no dark charge. -/
theorem self_conjugacy_spends_the_bit (c : State) (h : conj c = c) : conjSM c = c ∧ c.dark = 0 :=
  (fixed_iff_visible_fixed_and_no_dark_charge c).mp h

/-- THE DARK CLOSURE, EXECUTED: the visible fixed set, the forced half, the division, the keyed bit, the two grades,
    self-conjugacy, the crossing. A row closure; the dark row is not a second seat. -/
theorem dark_closure_executed (a b : Int) (hb : b ≠ 0) :
    ((∀ c : State, conjSM (conjSM c) = c) ∧ (∀ c : State, conjSM c = c ↔ neutralSM c)) ∧
    (∀ c, Admissible a b c → conjSM c = c) ∧
    (∀ c : State, conj c = c ↔ (conjSM c = c ∧ c.dark = 0)) ∧
    (Admissible a b ⟨0, 0, 0, 0, 1⟩ ∧ Admissible a b ⟨0, 0, 0, 1, 1⟩) ∧
    (∀ g : Int → Int → Int → Nat → Bool, ¬ ∀ c : State, g c.y6 c.t3x6 c.colour c.mass = decide (c.dark = 0)) ∧
    (∀ g q : Int, 0 < g → g * (q * q) < g → q = 0) ∧
    (∀ B q : Int, 0 < B → ∃ a' b' : Int, 0 < a' ∧ 0 < b' ∧ a' * (q * q) < B * b') ∧
    (∀ c : State, conj c = c → conjSM c = c ∧ c.dark = 0) ∧
    (∀ (Q : Prop) (c : State), Q → ((Q → c.dark = 0) ↔ c.dark = 0)) :=
  ⟨⟨fun c => by cases c; simp [conjSM], fixedSM_iff_neutralSM⟩, first_clause_is_forced a b hb,
   fixed_iff_visible_fixed_and_no_dark_charge, second_clause_is_keyed a b 1 (by decide),
   no_reading_of_the_record_decides_the_bit, measured_coupling_bound_forces_zero,
   free_coupling_bound_never_forces_zero, self_conjugacy_spends_the_bit,
   fun _ _ hq => ⟨fun f => f hq, fun h _ => h⟩⟩


/-- The abelian charges a self-paired mass term carries: a Majorana mass ψψ, or the mass S² of a real scalar, pairs a
    field with itself, so it carries twice its hypercharge and twice its dark charge. -/
def selfPairCharges (c : State) : Int × Int := (2 * c.y6, 2 * c.dark)
/-- A self-paired mass term is allowed when it carries no abelian charge. -/
def MajoranaAllowed (c : State) : Prop := selfPairCharges c = (0, 0)

/-- A MAJORANA MASS FORBIDS EVERY ABELIAN CHARGE: a self-paired mass term is allowed exactly when the hypercharge and
    the dark charge both vanish. The route is the mass term, not the definition of conjugation. -/
theorem majorana_mass_forbids_abelian_charge (c : State) : MajoranaAllowed c ↔ (c.y6 = 0 ∧ c.dark = 0) := by
  unfold MajoranaAllowed selfPairCharges
  constructor
  · intro h
    have h1 : 2 * c.y6 = 0 := congrArg Prod.fst h
    have h2 : 2 * c.dark = 0 := congrArg Prod.snd h
    exact ⟨by omega, by omega⟩
  · intro ⟨h1, h2⟩
    simp [h1, h2]

/-- THE DARK BIT IS THE MAJORANA BIT: on the visible fixed set, a self-paired mass is allowed exactly when the dark
    charge is zero, and exactly when conjugation fixes the state. -/
theorem the_dark_bit_is_the_majorana_bit (c : State) (h : conjSM c = c) :
    (MajoranaAllowed c ↔ c.dark = 0) ∧ (MajoranaAllowed c ↔ conj c = c) := by
  have hy : c.y6 = 0 := ((fixedSM_iff_neutralSM c).mp h).1
  constructor
  · rw [majorana_mass_forbids_abelian_charge]
    exact ⟨fun h' => h'.2, fun h' => ⟨hy, h'⟩⟩
  · rw [majorana_mass_forbids_abelian_charge, fixed_iff_visible_fixed_and_no_dark_charge]
    exact ⟨fun h' => ⟨h, h'.2⟩, fun h' => ⟨hy, h'.2⟩⟩

/-- A DARK CHARGE MAKES A DIRAC PAIR: a mass term pairing two states is neutral in the dark charge only if their dark
    charges cancel, so a dark-charged state takes its mass with a distinct partner. -/
theorem a_dark_charge_makes_a_dirac_pair (c c' : State) (hpair : c.dark + c'.dark = 0) (hd : c.dark ≠ 0) :
    c'.dark = -c.dark ∧ c' ≠ c := by
  refine ⟨by omega, fun he => hd ?_⟩
  have : c'.dark = c.dark := by rw [he]
  omega


/-- The seat's stage, in the chart of Bridge_Final.lean: a point is its doubled real part and its height, the fold
    s ↦ 1 − s̄ sends h to 2 − h, and the line is h = 1. Copied so this file stays standalone. -/
abbrev Stage := Int × Int
def stageFold (p : Stage) : Stage := (2 - p.1, p.2)
def onStageLine (p : Stage) : Prop := p.1 = 1

/-- The dark row's carrier onto the stage: the dark charge becomes the offset from the line, the mass the height. -/
def toStage (c : State) : Stage := (1 + c.dark, (c.mass : Int))

/-- THE CARRIER IS EQUIVARIANT: conjugation goes to the fold. -/
theorem toStage_equivariant (c : State) : toStage (conj c) = stageFold (toStage c) := by
  show ((1 + -c.dark, (c.mass : Int)) : Int × Int) = (2 - (1 + c.dark), (c.mass : Int))
  have h : (1 + -c.dark : Int) = 2 - (1 + c.dark) := by omega
  rw [h]

/-- The fold's fixed set is the line. -/
theorem stageFold_fixed_iff_line (p : Stage) : stageFold p = p ↔ onStageLine p := by
  obtain ⟨h, t⟩ := p
  show ((2 - h, t) : Int × Int) = (h, t) ↔ h = 1
  constructor
  · intro e
    have e1 : 2 - h = h := congrArg Prod.fst e
    omega
  · intro e
    have e2 : 2 - h = h := by omega
    rw [e2]

/-- A C-FIXED STATE LANDS ON THE SEAT'S LINE: the fixed set is carried to the fixed set. -/
theorem fixed_states_land_on_the_line (c : State) (h : conj c = c) : onStageLine (toStage c) := by
  apply (stageFold_fixed_iff_line (toStage c)).mp
  rw [← toStage_equivariant, h]

/-- THE BIT IS THE LINE PROPERTY CARRIED: on the visible fixed set a state lands on the seat's line exactly when its
    dark charge is zero, and exactly when C fixes it. -/
theorem the_bit_is_the_line_property_carried (c : State) (h : conjSM c = c) :
    (onStageLine (toStage c) ↔ c.dark = 0) ∧ (onStageLine (toStage c) ↔ conj c = c) := by
  have e : onStageLine (toStage c) ↔ c.dark = 0 := by
    show (1 + c.dark = 1) ↔ c.dark = 0
    exact ⟨fun h1 => by omega, fun h1 => by omega⟩
  refine ⟨e, e.trans ?_⟩
  rw [fixed_iff_visible_fixed_and_no_dark_charge]
  exact ⟨fun hd => ⟨h, hd⟩, fun hh => hh.2⟩

/-- A DARK PAIR IS AN OFF-LINE FOLD PAIR: a dark-charged state and its conjugate land on two distinct points off the
    line, exchanged by the fold, at one height, so a registration that keeps the height reads one record. -/
theorem a_dark_pair_is_an_off_line_fold_pair (c : State) (hd : c.dark ≠ 0) :
    toStage (conj c) = stageFold (toStage c) ∧ toStage (conj c) ≠ toStage c ∧
    ¬ onStageLine (toStage c) ∧ (toStage (conj c)).2 = (toStage c).2 := by
  refine ⟨toStage_equivariant c, fun he => hd ?_, fun hl => hd ?_, rfl⟩
  · have h1 : (toStage (conj c)).1 = (toStage c).1 := by rw [he]
    have h2 : 1 + -c.dark = 1 + c.dark := h1
    omega
  · have h2 : 1 + c.dark = 1 := hl
    omega

end DarkClosure

#print axioms DarkClosure.conj_involution
#print axioms DarkClosure.fixed_iff_neutral
#print axioms DarkClosure.fixedSM_iff_neutralSM
#print axioms DarkClosure.fixed_sub_fixedSM
#print axioms DarkClosure.dark_charge_hidden_from_the_visible
#print axioms DarkClosure.odd_reading_blind
#print axioms DarkClosure.charge_linear_readings_odd
#print axioms DarkClosure.charge_reading_odd
#print axioms DarkClosure.gravity_reading_even
#print axioms DarkClosure.dark_state_fixed
#print axioms DarkClosure.only_gravity_reads_the_fixed_set
#print axioms DarkClosure.dark_iff_fixed
#print axioms DarkClosure.electric_neutrality_is_not_the_seat
#print axioms DarkClosure.sq_nonneg
#print axioms DarkClosure.sq_eq_zero
#print axioms DarkClosure.radiative_zero_iff_neutral
#print axioms DarkClosure.no_charge_no_radiation
#print axioms DarkClosure.dark_charged_radiates_only_dark
#print axioms DarkClosure.a_neutral_member_is_not_a_dark_multiplet
#print axioms DarkClosure.identity_unread
#print axioms DarkClosure.two_species_one_record
#print axioms DarkClosure.energy_record_even
#print axioms DarkClosure.source_odd
#print axioms DarkClosure.fog_one_record
#print axioms DarkClosure.direction_separates
#print axioms DarkClosure.visible_generation_closes
#print axioms DarkClosure.closure_admits_both
#print axioms DarkClosure.closure_is_not_vacuous
#print axioms DarkClosure.one_record_two_worlds
#print axioms DarkClosure.fifth_differs
#print axioms DarkClosure.no_template_reading_decides_fifth
#print axioms DarkClosure.fifth_is_keyed
#print axioms DarkClosure.dust_attracts
#print axioms DarkClosure.radiation_attracts
#print axioms DarkClosure.vacuum_repels
#print axioms DarkClosure.repulsion_needs_tension
#print axioms DarkClosure.floor_forbids_phantom
#print axioms DarkClosure.vacuum_iff_frozen
#print axioms DarkClosure.phantom_needs_ghost
#print axioms DarkClosure.flat_budgets_admit_both_signs
#print axioms DarkClosure.dark_ledger_is_computed
#print axioms DarkClosure.dark_ledger_counts
#print axioms DarkClosure.fixed_state_is_its_mass
#print axioms DarkClosure.every_template_reading_of_the_fixed_set_reads_only_mass
#print axioms DarkClosure.z_reading_odd
#print axioms DarkClosure.z_reading_survives_neutrality
#print axioms DarkClosure.the_triplet_has_one_fixed_member
#print axioms DarkClosure.floor_bounds_w
#print axioms DarkClosure.floor_needs_positive_density
#print axioms DarkClosure.floor_is_additive
#print axioms DarkClosure.w_floor_from_rho_plus_p
#print axioms DarkClosure.rhoPlusP_split
#print axioms DarkClosure.fields_bound_w
#print axioms DarkClosure.photon_and_z_force_electroweak_zero
#print axioms DarkClosure.visible_nulls_force_the_visible_fixed_set
#print axioms DarkClosure.below_one_quantum_is_zero
#print axioms DarkClosure.sub_quantum_bounds_force_the_visible_fixed_set
#print axioms DarkClosure.portals_are_derived
#print axioms DarkClosure.fifth_is_free
#print axioms DarkClosure.fixed_iff_visible_fixed_and_no_dark_charge
#print axioms DarkClosure.coloured_fields_are_charged
#print axioms DarkClosure.sumI_tri_zero_of_none
#print axioms DarkClosure.a_coloured_relic_brings_charged_partners
#print axioms DarkClosure.a_stable_singlet_keeps_one_door
#print axioms DarkClosure.one_le_sq_of_ne
#print axioms DarkClosure.zero_le_sq
#print axioms DarkClosure.measured_coupling_bound_forces_zero
#print axioms DarkClosure.free_coupling_bound_never_forces_zero
#print axioms DarkClosure.first_clause_is_forced
#print axioms DarkClosure.second_clause_is_keyed
#print axioms DarkClosure.no_reading_of_the_record_decides_the_bit
#print axioms DarkClosure.self_conjugacy_spends_the_bit
#print axioms DarkClosure.dark_closure_executed
#print axioms DarkClosure.majorana_mass_forbids_abelian_charge
#print axioms DarkClosure.the_dark_bit_is_the_majorana_bit
#print axioms DarkClosure.a_dark_charge_makes_a_dirac_pair
#print axioms DarkClosure.toStage_equivariant
#print axioms DarkClosure.stageFold_fixed_iff_line
#print axioms DarkClosure.fixed_states_land_on_the_line
#print axioms DarkClosure.the_bit_is_the_line_property_carried
#print axioms DarkClosure.a_dark_pair_is_an_off_line_fold_pair
