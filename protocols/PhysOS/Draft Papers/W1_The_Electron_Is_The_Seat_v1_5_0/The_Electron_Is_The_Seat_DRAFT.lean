/-
  SPHYS_Electron_Witness.lean · The electron as the seat of the closure template, read from
  the laboratory · core Lean 4, no library. Charge conjugation is a reflection whose fixed set
  is the neutral sector; the electron is off it with an exact partner that differs in one sign;
  gravity's record cannot tell the pair apart; annihilation lands the pair on the neutral locus,
  keeping its energy and forgetting which was which; the line of response is symmetric;
  positronium's photon count reads the bit of the whole; a bound electron never rests; charge
  conservation forbids its decay; spin returns to -1 at 2π and to 1 at 4π; a round electron is
  the fixed set of time reversal. Finite models; every physical number enters as a citation.
-/
namespace SPHYS.Electron

/-- A lepton state: charge in units of e, mass in keV, twice the spin projection. -/
structure St where
  q : Int
  m : Nat
  s : Int
  deriving DecidableEq, Repr

def conj (p : St) : St := ⟨-p.q, p.m, p.s⟩
def neutral (p : St) : Prop := p.q = 0
instance (p : St) : Decidable (neutral p) := inferInstanceAs (Decidable (p.q = 0))

def electron : St := ⟨-1, 511, 1⟩
def positron : St := ⟨1, 511, 1⟩

theorem conj_involution (p : St) : conj (conj p) = p := by
  cases p with
  | mk q m s => show (⟨-(-q), m, s⟩ : St) = ⟨q, m, s⟩; rw [Int.neg_neg]

/-- The seat: a state is its own conjugate exactly when it is neutral. -/
theorem self_conjugate_iff_neutral (p : St) : conj p = p ↔ neutral p := by
  cases p with
  | mk q m s =>
    show (⟨-q, m, s⟩ : St) = ⟨q, m, s⟩ ↔ q = 0
    constructor
    · intro h
      have h1 : -q = q := congrArg St.q h
      omega
    · intro h
      subst h
      rfl

/-- The positron is the electron's partner: distinct, and both off the neutral locus. -/
theorem positron_is_the_partner : conj electron = positron := by decide
theorem the_pair : conj electron ≠ electron ∧ ¬ neutral electron ∧ ¬ neutral positron := by decide

/-- The pair is exact: conjugation keeps mass and spin and flips only the sign of the charge. -/
theorem pair_differs_in_one_sign :
    electron.m = positron.m ∧ electron.s = positron.s ∧ electron.q = -positron.q := by decide

/-- Gravity's record is the mass: two different states, one record. -/
def massRecord (p : St) : Nat := p.m
theorem two_worlds_one_record : massRecord electron = massRecord positron ∧ electron ≠ positron := by
  decide

/-- No function of the mass record returns the charge. -/
theorem no_reading_of_mass_returns_charge (g : Nat → Int) :
    ¬ (g (massRecord electron) = electron.q ∧ g (massRecord positron) = positron.q) := by
  intro ⟨h1, h2⟩
  have e1 : g 511 = -1 := h1
  have e2 : g 511 = 1 := h2
  omega

/-- Annihilation as registration: the pair lands on the neutral locus, keeps its energy (the
    height) and forgets which constituent was which (the side). -/
structure Light where
  q : Int
  e : Nat
  deriving DecidableEq, Repr
def annihilate (a b : St) : Light := ⟨a.q + b.q, a.m + b.m⟩
theorem annihilation_lands_neutral : (annihilate electron positron).q = 0 := by decide
theorem annihilation_keeps_energy : (annihilate electron positron).e = 1022 := by decide
theorem annihilation_forgets_side (a b : St) : annihilate a b = annihilate b a := by
  unfold annihilate
  rw [Int.add_comm a.q b.q, Nat.add_comm a.m b.m]

/-- The line of response: two back-to-back photons define one unordered line. -/
def onLine (p x : Int × Int) : Prop := x = p ∨ x = (-p.1, -p.2)
theorem line_of_response_symmetric (p x : Int × Int) : onLine p x ↔ onLine (-p.1, -p.2) x := by
  unfold onLine
  constructor
  · intro h
    cases h with
    | inl h => right; rw [h, Int.neg_neg, Int.neg_neg]
    | inr h => left; exact h
  · intro h
    cases h with
    | inl h => right; exact h
    | inr h => left; rw [h, Int.neg_neg, Int.neg_neg]

/-- Positronium: the C-parity of the whole is (-1)^(L+S) and n photons carry (-1)^n, so the
    photon count reads the bit of the whole and never the identity of its parts. -/
def sgn (n : Nat) : Int := if n % 2 = 0 then 1 else -1
def cParity (L S : Nat) : Int := sgn (L + S)
theorem para_two_photons : sgn 2 = cParity 0 0 := by decide
theorem ortho_three_photons : sgn 3 = cParity 0 1 := by decide
theorem ortho_not_two : sgn 2 ≠ cParity 0 1 := by decide

/-- The floor: by the virial theorem the kinetic energy of a bound Coulomb state is minus its
    total energy, so a bound electron never rests. -/
theorem virial (K : Int) : (-2 * K) + K = -K := by omega
theorem bound_never_rests (E : Int) (hE : E < 0) : 0 < -E := by omega

/-- Stability: every state lighter than the electron is neutral, so no decay product carries
    its charge. -/
def total : List Int → Int
  | [] => 0
  | a :: t => a + total t
theorem total_zero (l : List Int) (h : ∀ q ∈ l, q = 0) : total l = 0 := by
  induction l with
  | nil => rfl
  | cons a t ih =>
    have ha : a = 0 := h a (List.Mem.head t)
    have ht : total t = 0 := ih (fun q hq => h q (List.Mem.tail a hq))
    show a + total t = 0
    rw [ha, ht]
    rfl
theorem decay_forbidden (l : List Int) (h : ∀ q ∈ l, q = 0) : total l ≠ -1 := by
  rw [total_zero l h]
  decide

/-- Spin: the unit quaternion i is a half-turn; twice is a full turn and gives -1; four times
    returns. Three half-turns about three perpendicular axes give the Return, ijk = -1. -/
structure Q where
  r : Int
  i : Int
  j : Int
  k : Int
  deriving DecidableEq, Repr
def qmul (a b : Q) : Q :=
  ⟨a.r*b.r - a.i*b.i - a.j*b.j - a.k*b.k, a.r*b.i + a.i*b.r + a.j*b.k - a.k*b.j,
   a.r*b.j - a.i*b.k + a.j*b.r + a.k*b.i, a.r*b.k + a.i*b.j - a.j*b.i + a.k*b.r⟩
def qi : Q := ⟨0,1,0,0⟩
def qj : Q := ⟨0,0,1,0⟩
def qk : Q := ⟨0,0,0,1⟩
theorem spin_two_pi : qmul qi qi = ⟨-1,0,0,0⟩ := by decide
theorem spin_four_pi : qmul (qmul qi qi) (qmul qi qi) = ⟨1,0,0,0⟩ := by decide
theorem the_return : qmul (qmul qi qj) qk = ⟨-1,0,0,0⟩ := by decide

/-- The round electron: a dipole moment is odd under time reversal, and the fixed set of time
    reversal is the zero dipole. -/
theorem round_iff_T_fixed (d : Int) : -d = d ↔ d = 0 := by
  constructor
  · intro h
    omega
  · intro h
    subst h
    rfl

/-- The seat, modelled on the critical strip: a point is its doubled real part and its height, and
    the fold s ↦ 1 - s̄ sends the doubled real part x to 2 - x and keeps the height. -/
structure Strip where
  x : Int
  t : Nat
  deriving DecidableEq, Repr
def fold (z : Strip) : Strip := ⟨2 - z.x, z.t⟩
def criticalLine (z : Strip) : Prop := z.x = 1
theorem fold_involution (z : Strip) : fold (fold z) = z := by
  cases z with
  | mk x t =>
    show Strip.mk (2 - (2 - x)) t = Strip.mk x t
    congr 1
    omega
theorem fold_fixed_iff (z : Strip) : fold z = z ↔ criticalLine z := by
  cases z with
  | mk x t =>
    show Strip.mk (2 - x) t = Strip.mk x t ↔ x = 1
    constructor
    · intro h
      have hx := congrArg Strip.x h
      change 2 - x = x at hx
      omega
    · intro h
      subst h
      rfl
/-- The explicit equivariant map: charge q goes to doubled real part 1 + q, mass to height. -/
def toStrip (p : St) : Strip := ⟨1 + p.q, p.m⟩
theorem toStrip_equivariant (p : St) : toStrip (conj p) = fold (toStrip p) := by
  show Strip.mk (1 + -p.q) p.m = Strip.mk (2 - (1 + p.q)) p.m
  congr 1
  omega
/-- The neutral states, the fixed set of charge conjugation, land on the critical line. -/
theorem neutral_lands_on_line (p : St) (h : neutral p) : criticalLine (toStrip p) := by
  have hq : p.q = 0 := h
  show 1 + p.q = 1
  omega
/-- A charged pair lands on the two edges of the strip, mirror images under the fold: charge -1 at
    real part 0, charge +1 at real part 1. -/
theorem pair_on_the_edges (p : St) (h : p.q = -1) :
    (toStrip p).x = 0 ∧ (toStrip (conj p)).x = 2 ∧ toStrip (conj p) = fold (toStrip p) := by
  refine ⟨?_, ?_, toStrip_equivariant p⟩
  · show 1 + p.q = 0
    omega
  · show 1 + -p.q = 2
    omega

end SPHYS.Electron
#print axioms SPHYS.Electron.conj_involution
#print axioms SPHYS.Electron.self_conjugate_iff_neutral
#print axioms SPHYS.Electron.positron_is_the_partner
#print axioms SPHYS.Electron.the_pair
#print axioms SPHYS.Electron.pair_differs_in_one_sign
#print axioms SPHYS.Electron.two_worlds_one_record
#print axioms SPHYS.Electron.no_reading_of_mass_returns_charge
#print axioms SPHYS.Electron.annihilation_lands_neutral
#print axioms SPHYS.Electron.annihilation_keeps_energy
#print axioms SPHYS.Electron.annihilation_forgets_side
#print axioms SPHYS.Electron.line_of_response_symmetric
#print axioms SPHYS.Electron.para_two_photons
#print axioms SPHYS.Electron.ortho_three_photons
#print axioms SPHYS.Electron.ortho_not_two
#print axioms SPHYS.Electron.bound_never_rests
#print axioms SPHYS.Electron.decay_forbidden
#print axioms SPHYS.Electron.spin_two_pi
#print axioms SPHYS.Electron.spin_four_pi
#print axioms SPHYS.Electron.the_return
#print axioms SPHYS.Electron.round_iff_T_fixed
#print axioms SPHYS.Electron.fold_involution
#print axioms SPHYS.Electron.fold_fixed_iff
#print axioms SPHYS.Electron.toStrip_equivariant
#print axioms SPHYS.Electron.neutral_lands_on_line
#print axioms SPHYS.Electron.pair_on_the_edges
#print axioms SPHYS.Electron.virial
#print axioms SPHYS.Electron.total_zero
