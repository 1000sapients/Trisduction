/-
  SPHYS_YangMills_Forced_CC.lean · the Yang-Mills equations from a charge that does not commute · core Lean 4, no library.

  RATIONALE. Light is the law of a charge that is a number. The nuclear charges are not numbers: a colour can be
  turned into another colour, and two turns taken in the two orders differ. This file carries the algebra that
  makes the law of such a charge a consequence. To the first power of the potential each component obeys Maxwell's law. At the next
  power the law must keep its form under a turn of the charge, and that fixes the coupling of the field to itself:
  it equals the coupling of the field to matter. Where the charge commutes the self-coupling drops out of every
  equation and what remains is Maxwell's law.

  DESIGN. Integers and naturals only. The charge that does not commute is carried by its smallest instance, three
  components with the cross product as bracket (the algebra of rotations, the weak isospin). No axiom is declared.
  The kernel line of every theorem is printed at the end.

  WHAT ENTERS AS A DEFINITION, NOT AS A THEOREM (read before editing):
    (1) partial derivatives commute: the field `commute` of `Field`, as in the engine for light;
    (2) the linear family a·□A + b·∂(∂·A) + m·A per component, as in the engine for light;
    (3) a turn of the charge acts on the potential by δA = ∂ε + s·[A, ε], and the strength of the field is
        F = ∂A - ∂A + t·[A, A]. The variation of F under the turn is written out term by term in `variation`.
        The second derivatives of ε cancel because derivatives commute, and are not carried;
    (4) the counts: n² - 1 components for a charge of n kinds; two states for a massless carrier and three for a massive
        one (Wigner, 1939); (n-1)(n-2)/2 phases in the mixing of n generations (Kobayashi and Maskawa, 1973);
    (5) the two coefficients 11 and 2 of the leading running of the coupling (Gross and Wilczek, 1973;
        Politzer, 1973). They are used in a sign statement and are not derived here;
    (6) a vacuum that is not turned with the charge gives mass to three carriers (Englert and Brout, 1964; Higgs,
        1964): the count `three_carriers_gain_mass_and_one_scalar_remains` reads it;
    (7) the ratio of hadrons to muon pairs carries n and the width of the neutral pion carries n squared (Adler,
        1969; Bell and Jackiw, 1969): the definitions `ratio9` and the statement on n squared read them.
  DOMAIN. `covariance_forces_the_self_coupling` is proved on the rotation algebra. The derivation uses only that the
  bracket is bilinear, antisymmetric and obeys Jacobi's identity, and that some bracket is not zero. The kernel checks it on this algebra, component by component.
  RISK. A reader may take the forcing as a proof that the quantum theory exists or that its spectrum has a gap.
  It is the forcing of the form of the law. The spectrum is measured.
  NON-NEGOTIABLE. No theorem here fixes the value of a coupling. `every_coupling_is_admitted` proves it cannot.
-/
namespace SPHYS.YangMills

/-! ## Part I. First power of the potential: each component of the charge obeys Maxwell's law. -/

structure Field where
  boxDivA : Int
  divBoxA : Int
  divA    : Int
  commute : divBoxA = boxDivA

/-- The divergence of the candidate law a·□A + b·∂(∂·A) + m·A for one component of the charge. -/
def div (F : Field) (a b m : Int) : Int := a * F.divBoxA + b * F.boxDivA + m * F.divA

theorem div_eq (F : Field) (a b m : Int) : div F a b m = (a + b) * F.boxDivA + m * F.divA := by
  unfold div; rw [F.commute, Int.add_mul]

def waving : Field := { boxDivA := 1, divBoxA := 1, divA := 0, commute := rfl }
def standing : Field := { boxDivA := 0, divBoxA := 0, divA := 1, commute := rfl }

/-- TO THE FIRST POWER OF THE POTENTIAL, EACH COMPONENT OBEYS MAXWELL. A law conserved on every field has b = -a and no mass term. -/
theorem each_component_obeys_maxwell (a b m : Int) (h : ∀ F : Field, div F a b m = 0) : a + b = 0 ∧ m = 0 := by
  have h1 := h waving
  have h2 := h standing
  rw [div_eq] at h1 h2
  have e1 : (a + b) * 1 + m * 0 = 0 := h1
  have e2 : (a + b) * 0 + m * 1 = 0 := h2
  rw [Int.mul_one, Int.mul_zero, Int.add_zero] at e1
  rw [Int.mul_zero, Int.mul_one, Int.zero_add] at e2
  exact ⟨e1, e2⟩

/-- THE CARRIERS HAVE NO MASS IN THE LAW. -/
theorem the_law_has_no_mass_term (a b m : Int) (h : ∀ F : Field, div F a b m = 0) : m = 0 :=
  (each_component_obeys_maxwell a b m h).2

/-! ## Part II. A charge that does not commute. -/

/-- A charge with three components: the smallest charge that does not commute. -/
structure V3 where
  x : Int
  y : Int
  z : Int

theorem V3.eq3 {a b : V3} (hx : a.x = b.x) (hy : a.y = b.y) (hz : a.z = b.z) : a = b := by
  cases a; cases b; simp only at hx hy hz; subst hx; subst hy; subst hz; rfl

def zero : V3 := ⟨0, 0, 0⟩
def add (a b : V3) : V3 := ⟨a.x + b.x, a.y + b.y, a.z + b.z⟩
def sub (a b : V3) : V3 := ⟨a.x - b.x, a.y - b.y, a.z - b.z⟩
def smul (k : Int) (a : V3) : V3 := ⟨k * a.x, k * a.y, k * a.z⟩

/-- The bracket of the rotation algebra: two turns taken in the two orders, compared. -/
def turn (a b : V3) : V3 := ⟨a.y * b.z - a.z * b.y, a.z * b.x - a.x * b.z, a.x * b.y - a.y * b.x⟩
/-- The bracket of a charge that commutes: always zero. -/
def still (_ _ : V3) : V3 := zero

def e1 : V3 := ⟨1, 0, 0⟩
def e2 : V3 := ⟨0, 1, 0⟩
def e3 : V3 := ⟨0, 0, 1⟩

/-- The bracket reverses when its two entries are exchanged. -/
theorem the_bracket_is_antisymmetric (a b : V3) : turn a b = smul (-1) (turn b a) := by
  apply V3.eq3 <;> simp only [turn, smul, Int.mul_comm] <;> omega

/-- A thing does not turn itself. This is the boundary of a boundary, read on the charge: the divergence of the
    left side of the law is a sum of brackets of the strength with itself, and each is zero. -/
theorem the_boundary_of_the_boundary_vanishes (a : V3) : turn a a = zero := by
  apply V3.eq3 <;> simp only [turn, zero, Int.mul_comm] <;> omega

/-- Jacobi's identity. -/
theorem jacobi (a b c : V3) : add (add (turn a (turn b c)) (turn b (turn c a))) (turn c (turn a b)) = zero := by
  apply V3.eq3 <;>
  simp only [add, turn, zero, Int.mul_add, Int.add_mul, Int.mul_sub, Int.sub_mul, Int.mul_assoc, Int.mul_comm,
    Int.mul_left_comm] <;> omega

/-- THE CHARGE DOES NOT COMMUTE. Two turns in the two orders differ. -/
theorem the_charge_does_not_commute : turn e1 e2 ≠ turn e2 e1 := by
  intro h; have h1 := congrArg V3.z h; revert h1; decide

/-- The two orders differ by a third turn. -/
theorem two_turns_make_a_third : turn e1 e2 = e3 := rfl

/-! ## Part III. The law must keep its form under a turn: the self-coupling is forced. -/

/-- What the law reads at one point: the two potentials, the curl part of their derivatives, the turn and its two
    derivatives. -/
structure Point where
  Am  : V3
  An  : V3
  dA  : V3
  eps : V3
  dem : V3
  den : V3

/-- The strength of the field with self-coupling t under a bracket: F = dA + t·[A, A]. -/
def strength (br : V3 → V3 → V3) (t : Int) (P : Point) : V3 := add P.dA (smul t (br P.Am P.An))

/-- The variation of the strength under the turn δA = ∂ε + s·[A, ε], every term kept. -/
def variation (br : V3 → V3 → V3) (s t : Int) (P : Point) : V3 :=
  add (add (add (smul s (br P.dA P.eps)) (sub (smul s (br P.An P.dem)) (smul s (br P.Am P.den))))
           (add (smul t (br P.dem P.An)) (smul t (br P.Am P.den))))
      (smul (t * s) (add (br (br P.Am P.eps) P.An) (br P.Am (br P.An P.eps))))

/-- What is left when the strength fails to turn as a charge turns: δF - s·[F, ε]. -/
def residue (br : V3 → V3 → V3) (s t : Int) (P : Point) : V3 :=
  sub (variation br s t P) (smul s (br (strength br t P) P.eps))

/-- The part of the variation that carries the derivative of the turn. -/
def stray (br : V3 → V3 → V3) (P : Point) : V3 := sub (br P.An P.dem) (br P.Am P.den)

/-- THE RESIDUE IS ONE TERM. Everything else cancels by Jacobi's identity. -/
theorem the_residue_is_one_term (s t : Int) (P : Point) : residue turn s t P = smul (s - t) (stray turn P) := by
  apply V3.eq3 <;>
  simp only [residue, variation, strength, stray, add, sub, smul, turn, Int.mul_add, Int.add_mul, Int.mul_sub,
    Int.sub_mul, Int.mul_assoc, Int.mul_comm, Int.mul_left_comm] <;> omega

/-- A point where the stray term is not zero. -/
def probe : Point := { Am := zero, An := e1, dA := zero, eps := zero, dem := e2, den := zero }

/-- COVARIANCE FORCES THE SELF-COUPLING. The strength turns as a charge at every point if and only if the field
    couples to itself exactly as it couples to matter: t = s. This is the Yang-Mills strength. -/
theorem covariance_forces_the_self_coupling (s t : Int) : (∀ P : Point, residue turn s t P = zero) ↔ t = s := by
  constructor
  · intro h
    have h1 := h probe
    rw [the_residue_is_one_term] at h1
    have h2 := congrArg V3.z h1
    have h3 : (s - t) * 1 = 0 := h2
    omega
  · intro h P
    rw [the_residue_is_one_term, h]
    apply V3.eq3 <;> simp only [smul, zero, Int.sub_self, Int.zero_mul]

/-- EVERY COUPLING IS ADMITTED. The law fixes t = s and is silent on the size of s: the coupling is a magnitude. -/
theorem every_coupling_is_admitted (g : Int) (P : Point) : residue turn g g P = zero :=
  (covariance_forces_the_self_coupling g g).mpr rfl P

/-- THE FIELD IS ITS OWN SOURCE. With a charge that does not commute the potential turns the strength: the field
    carries the charge it reads. -/
theorem the_field_is_its_own_source : ∃ A F : V3, turn A F ≠ zero := by
  refine ⟨e1, e2, ?_⟩
  intro h; have h1 := congrArg V3.z h; revert h1; decide

/-! ### The commuting half. -/

/-- MAXWELL IS THE COMMUTING HALF. Where the charge commutes the strength is the curl alone, for every t. -/
theorem maxwell_is_the_commuting_half (t : Int) (P : Point) : strength still t P = P.dA := by
  apply V3.eq3 <;> simp only [strength, still, add, smul, zero, Int.mul_zero, Int.add_zero]

/-- Where the charge commutes no self-coupling is forced: every s and t pass. -/
theorem a_commuting_charge_forces_nothing (s t : Int) (P : Point) : residue still s t P = zero := by
  apply V3.eq3 <;>
  simp only [residue, variation, strength, still, add, sub, smul, zero, Int.mul_zero, Int.add_zero, Int.sub_self]

/-- A field whose charge commutes is not its own source: light carries no charge. -/
theorem a_commuting_field_is_not_its_own_source (A F : V3) : still A F = zero := rfl

/-! ## Part IV. The counts. -/

/-- The components of a charge that comes in n kinds: the turns among them, which are the carriers. -/
def carriers (n : Nat) : Nat := n * n - 1

theorem three_weak_carriers : carriers 2 = 3 := rfl
theorem eight_gluons : carriers 3 = 8 := rfl
/-- Eight, three and the one of the commuting charge. -/
theorem twelve_carriers : carriers 3 + carriers 2 + 1 = 12 := rfl

/-- Two states for each massless carrier and four for the scalar pair before the vacuum is chosen; after, three
    carriers hold three states each and one scalar remains. Nothing is lost. -/
theorem three_carriers_gain_mass_and_one_scalar_remains : 12 * 2 + 4 = (8 * 2 + 1 * 2 + 3 * 3) + 1 := rfl

/-- The ratio of hadrons to muon pairs, times nine, for n colours of the three light quarks (charges 2, 1, 1 in
    thirds, squared). -/
def ratio9 (n : Nat) : Nat := n * (4 + 1 + 1)

/-- THE RATIO COUNTS THE COLOURS. It reads two exactly at three colours. -/
theorem the_ratio_counts_the_colours (n : Nat) : ratio9 n = 2 * 9 ↔ n = 3 := by
  unfold ratio9; constructor <;> intro h <;> omega

/-- With five quarks open the ratio is eleven thirds. -/
theorem eleven_thirds_with_five_quarks : 3 * (4 + 1 + 1 + 4 + 1) = 11 * 3 := rfl

/-- THE PION COUNTS THE COLOURS SQUARED. Its rate into two photons carries n², and nine is three squared only. -/
theorem the_pion_counts_the_colours_squared (n : Nat) : n * n = 9 ↔ n = 3 := by
  constructor
  · intro h
    have h4 : n < 4 := by
      apply Nat.lt_of_not_le; intro h4
      have := Nat.mul_le_mul h4 h4; omega
    have h5 : n = 0 ∨ n = 1 ∨ n = 2 ∨ n = 3 := by omega
    rcases h5 with h5 | h5 | h5 | h5
    · subst h5; exact absurd h (by decide)
    · subst h5; exact absurd h (by decide)
    · subst h5; exact absurd h (by decide)
    · exact h5
  · intro h; subst h; rfl

/-- The phases that no relabelling removes from the mixing of n generations. -/
def phases (n : Nat) : Nat := (n - 1) * (n - 2) / 2
/-- The angles of the mixing of n generations. -/
def angles (n : Nat) : Nat := n * (n - 1) / 2

theorem no_phase_at_two : phases 2 = 0 := rfl
theorem one_phase_at_three : phases 3 = 1 := rfl
theorem three_angles_at_three : angles 3 = 3 := rfl

/-- Below three generations there is no phase. -/
theorem below_three_no_phase (n : Nat) (h : n < 3) : phases n = 0 := by
  have h5 : n = 0 ∨ n = 1 ∨ n = 2 := by omega
  rcases h5 with h5 | h5 | h5 <;> subst h5 <;> rfl

/-- From three generations on there is one. -/
theorem from_three_on_a_phase (n : Nat) (h : 3 ≤ n) : 1 ≤ phases n := by
  unfold phases
  have h1 : 2 ≤ n - 1 := by omega
  have h2 : 1 ≤ n - 2 := by omega
  have h3 : 2 * 1 ≤ (n - 1) * (n - 2) := Nat.mul_le_mul h1 h2
  exact (Nat.le_div_iff_mul_le (by decide)).mpr (by omega)

/-- THREE GENERATIONS ARE THE LEAST WITH ONE PHASE. -/
theorem three_is_the_least_with_a_phase (n : Nat) : 1 ≤ phases n ↔ 3 ≤ n := by
  constructor
  · intro h
    apply Nat.le_of_not_lt; intro h3
    have := below_three_no_phase n h3; omega
  · exact from_three_on_a_phase n

/-! ## Part V. The running of the coupling, as a sign. -/

/-- Three times the first coefficient of the running, for a field that carries a charge of weight c (three for three colours, zero for a charge that commutes), read by f flavours. Positive means
    the coupling falls at short distance. The coefficients 11 and 2 are cited, not derived. -/
def running (c f : Int) : Int := 11 * c - 2 * f

/-- THE STRONG FORCE IS FREE AT SHORT DISTANCE with six flavours. -/
theorem six_flavours_are_free : 0 < running 3 6 := by decide

/-- Freedom holds exactly up to sixteen flavours. -/
theorem free_exactly_up_to_sixteen (f : Int) : 0 < running 3 f ↔ f ≤ 16 := by
  unfold running; constructor <;> intro h <;> omega

/-- A CHARGE THAT COMMUTES IS NEVER FREE. Its coupling grows at short distance for every flavour count. -/
theorem a_commuting_charge_is_never_free (f : Int) (hf : 0 < f) : running 0 f < 0 := by
  unfold running; omega

/-- FREEDOM NEEDS A CHARGE THAT DOES NOT COMMUTE. -/
theorem freedom_needs_a_charge_that_does_not_commute (c f : Int) (hf : 0 ≤ f) (h : 0 < running c f) : 0 < c := by
  unfold running at h; omega

/-! ## Part VI. The dimension. -/

/-- The dimension of mass carried by the square of the coupling in n dimensions of spacetime. -/
def couplingDimension (n : Int) : Int := 4 - n

/-- THE COUPLING IS A PURE NUMBER EXACTLY IN FOUR DIMENSIONS. The law then contains no scale at all. -/
theorem the_coupling_is_a_pure_number_exactly_in_four (n : Int) : couplingDimension n = 0 ↔ n = 4 := by
  unfold couplingDimension; constructor <;> intro h <;> omega

end SPHYS.YangMills

#print axioms SPHYS.YangMills.div_eq
#print axioms SPHYS.YangMills.each_component_obeys_maxwell
#print axioms SPHYS.YangMills.the_law_has_no_mass_term
#print axioms SPHYS.YangMills.V3.eq3
#print axioms SPHYS.YangMills.the_bracket_is_antisymmetric
#print axioms SPHYS.YangMills.the_boundary_of_the_boundary_vanishes
#print axioms SPHYS.YangMills.jacobi
#print axioms SPHYS.YangMills.the_charge_does_not_commute
#print axioms SPHYS.YangMills.two_turns_make_a_third
#print axioms SPHYS.YangMills.the_residue_is_one_term
#print axioms SPHYS.YangMills.covariance_forces_the_self_coupling
#print axioms SPHYS.YangMills.every_coupling_is_admitted
#print axioms SPHYS.YangMills.the_field_is_its_own_source
#print axioms SPHYS.YangMills.maxwell_is_the_commuting_half
#print axioms SPHYS.YangMills.a_commuting_charge_forces_nothing
#print axioms SPHYS.YangMills.a_commuting_field_is_not_its_own_source
#print axioms SPHYS.YangMills.three_weak_carriers
#print axioms SPHYS.YangMills.eight_gluons
#print axioms SPHYS.YangMills.twelve_carriers
#print axioms SPHYS.YangMills.three_carriers_gain_mass_and_one_scalar_remains
#print axioms SPHYS.YangMills.the_ratio_counts_the_colours
#print axioms SPHYS.YangMills.eleven_thirds_with_five_quarks
#print axioms SPHYS.YangMills.the_pion_counts_the_colours_squared
#print axioms SPHYS.YangMills.no_phase_at_two
#print axioms SPHYS.YangMills.one_phase_at_three
#print axioms SPHYS.YangMills.three_angles_at_three
#print axioms SPHYS.YangMills.below_three_no_phase
#print axioms SPHYS.YangMills.from_three_on_a_phase
#print axioms SPHYS.YangMills.three_is_the_least_with_a_phase
#print axioms SPHYS.YangMills.six_flavours_are_free
#print axioms SPHYS.YangMills.free_exactly_up_to_sixteen
#print axioms SPHYS.YangMills.a_commuting_charge_is_never_free
#print axioms SPHYS.YangMills.freedom_needs_a_charge_that_does_not_commute
#print axioms SPHYS.YangMills.the_coupling_is_a_pure_number_exactly_in_four
