/-
  SPHYS_Dirac_Forced_CC.lean · exclusion from the full turn, the Dirac law as the least law of a half-spin · core Lean 4.

  RATIONALE. A law of first order whose square is the mass shell cannot have numbers as coefficients. The algebra of
  turns supplies the coefficients, and the same algebra sends a full turn to minus one. That sign, carried to the
  exchange of two identical particles, empties the diagonal: two of them cannot share a state. This file carries the
  algebra of all three steps.

  DESIGN. Integers only. A turn is a quaternion with integer parts. The Dirac operator is a two by two array of
  quaternions, which is the algebra of four anticommuting units of signature (+, -, -, -). No axiom is declared.
  The kernel line of every theorem is printed at the end.

  WHAT ENTERS AS A DEFINITION, NOT AS A THEOREM (read before editing):
    (1) the half turn about an axis is the unit of that axis (Hamilton, 1844), so a full turn is the
        unit multiplied by itself;
    (2) the mass shell: energy squared less momentum squared is mass squared (Einstein, 1905);
    (3) the count of components of the least such law in n dimensions, 2^(n/2) (Brauer and Weyl, 1935);
    (4) the exchange of two identical particles multiplies their amplitude by the sign of a full turn of one of
        them. This is bridge B1 of the paper, and it is the content of the spin-statistics theorem (Pauli, 1940);
    (5) a double exchange unwinds to nothing exactly when space has three dimensions or more, because the sphere of
        directions is then simply connected (Leinaas and Myrheim, 1977). It is the definition `unwinds`;
    (6) at speeds far below that of light the law keeps two of its four components (Dirac, 1928). The paper
        reads the equations of Schrödinger and Pauli on it; no theorem here uses it.
  RISK. A reader may take `the_full_turn_forces_exclusion` as a proof of the spin-statistics theorem. It is the
  forcing of exclusion from the sign of the turn, on bridge B1.
  NON-NEGOTIABLE. No theorem here fixes a mass. `every_mass_is_admitted` proves it cannot.
-/
namespace SPHYS.Dirac

/-! ## Part I. No number takes the square root. -/

/-- NO NUMBER TAKES THE SQUARE ROOT. A law of first order with numbers as coefficients never squares to the sum
    of squares, already in two directions. -/
theorem no_number_takes_the_square_root (a b : Int) :
    ¬ ∀ x y : Int, (a * x + b * y) * (a * x + b * y) = x * x + y * y := by
  intro h
  have h1 := h 1 0
  have h2 := h 0 1
  have h3 := h 1 1
  simp only [Int.mul_one, Int.mul_zero, Int.add_zero, Int.zero_add, Int.mul_add, Int.add_mul] at h1 h2 h3
  have h4 : a * b = b * a := Int.mul_comm a b
  have h5 : a * b = 0 := by omega
  rcases Int.mul_eq_zero.mp h5 with h6 | h6
  · rw [h6] at h1; exact absurd h1 (by decide)
  · rw [h6] at h2; exact absurd h2 (by decide)

/-! ## Part II. The algebra of turns. -/

/-- A turn: a + b·i + c·j + d·k. -/
structure Q where
  a : Int
  b : Int
  c : Int
  d : Int

theorem Q.eq4 {p q : Q} (h1 : p.a = q.a) (h2 : p.b = q.b) (h3 : p.c = q.c) (h4 : p.d = q.d) : p = q := by
  cases p; cases q; simp only at h1 h2 h3 h4; subst h1; subst h2; subst h3; subst h4; rfl

def qmul (p q : Q) : Q :=
  ⟨p.a * q.a - p.b * q.b - p.c * q.c - p.d * q.d, p.a * q.b + p.b * q.a + p.c * q.d - p.d * q.c,
   p.a * q.c - p.b * q.d + p.c * q.a + p.d * q.b, p.a * q.d + p.b * q.c - p.c * q.b + p.d * q.a⟩
def qadd (p q : Q) : Q := ⟨p.a + q.a, p.b + q.b, p.c + q.c, p.d + q.d⟩
def qneg (p : Q) : Q := ⟨-p.a, -p.b, -p.c, -p.d⟩
def num (n : Int) : Q := ⟨n, 0, 0, 0⟩
def one : Q := num 1
def qi : Q := ⟨0, 1, 0, 0⟩
def qj : Q := ⟨0, 0, 1, 0⟩
def qk : Q := ⟨0, 0, 0, 1⟩
/-- A direction: x·i + y·j + z·k. -/
def dir (x y z : Int) : Q := ⟨0, x, y, z⟩

/-- Each unit squares to minus one. -/
theorem the_units_square_to_minus_one : qmul qi qi = num (-1) ∧ qmul qj qj = num (-1) ∧ qmul qk qk = num (-1) :=
  ⟨rfl, rfl, rfl⟩

/-- Two different units anticommute. -/
theorem the_units_anticommute :
    qmul qi qj = qneg (qmul qj qi) ∧ qmul qj qk = qneg (qmul qk qj) ∧ qmul qk qi = qneg (qmul qi qk) :=
  ⟨rfl, rfl, rfl⟩

/-- A FULL TURN IS MINUS ONE. The half turn about an axis is its unit, and two half turns are a full turn. -/
theorem a_full_turn_is_minus_one : qmul qk qk = num (-1) := rfl

/-- Two full turns return. -/
theorem two_full_turns_return : qmul (qmul qk qk) (qmul qk qk) = one := rfl

/-- A full turn fixes every direction: minus one on both sides is the identity. Only a half-spin feels it. -/
theorem a_full_turn_fixes_every_direction (v : Q) : qmul (qmul (num (-1)) v) (num (-1)) = v := by
  apply Q.eq4 <;> simp only [qmul, num, Int.mul_zero, Int.zero_mul, Int.sub_zero, Int.add_zero, Int.zero_add,
    Int.zero_sub, Int.neg_mul, Int.mul_neg, Int.one_mul, Int.mul_one, Int.neg_neg, Int.neg_zero]

/-- THE TURNS TAKE THE SQUARE ROOT. The square of a direction is minus its squared length, with no cross term. -/
theorem the_turns_take_the_square_root (x y z : Int) :
    qmul (dir x y z) (dir x y z) = num (-(x * x + y * y + z * z)) := by
  apply Q.eq4 <;> simp only [qmul, dir, num, Int.mul_zero, Int.zero_mul, Int.mul_comm] <;> omega

/-- The product of two directions carries their dot product and their cross product. The cross term is the
    moment of the spin in a magnetic field, with the factor two. -/
theorem the_product_carries_the_cross (x y z u v w : Int) :
    qmul (dir x y z) (dir u v w) = ⟨-(x * u + y * v + z * w), y * w - z * v, z * u - x * w, x * v - y * u⟩ := by
  apply Q.eq4 <;> simp only [qmul, dir, Int.mul_zero, Int.zero_mul] <;> omega

/-! ## Part III. The least law of a half-spin. -/

/-- A two by two array of turns. -/
structure M where
  p : Q
  q : Q
  r : Q
  s : Q

theorem M.eq4 {m n : M} (h1 : m.p = n.p) (h2 : m.q = n.q) (h3 : m.r = n.r) (h4 : m.s = n.s) : m = n := by
  cases m; cases n; simp only at h1 h2 h3 h4; subst h1; subst h2; subst h3; subst h4; rfl

def mmul (m n : M) : M :=
  ⟨qadd (qmul m.p n.p) (qmul m.q n.r), qadd (qmul m.p n.q) (qmul m.q n.s),
   qadd (qmul m.r n.p) (qmul m.s n.r), qadd (qmul m.r n.q) (qmul m.s n.s)⟩
/-- A number times the identity. -/
def scalar (n : Int) : M := ⟨num n, num 0, num 0, num n⟩
/-- The operator of first order: energy in two opposite corners with opposite signs, the momentum's direction in the other two. -/
def D (E x y z : Int) : M := ⟨num E, dir x y z, dir x y z, num (-E)⟩
/-- The operator less a mass, and plus a mass. -/
def Dminus (E x y z m : Int) : M := ⟨num (E - m), dir x y z, dir x y z, num (-E - m)⟩
def Dplus (E x y z m : Int) : M := ⟨num (E + m), dir x y z, dir x y z, num (-E + m)⟩

/-- THE FIRST-ORDER LAW SQUARES TO THE MASS SHELL, for every energy and momentum. -/
theorem dirac_squares_to_the_mass_shell (E x y z : Int) :
    mmul (D E x y z) (D E x y z) = scalar (E * E - (x * x + y * y + z * z)) := by
  apply M.eq4 <;> apply Q.eq4 <;>
  simp only [mmul, D, scalar, qadd, qmul, dir, num, Int.mul_zero, Int.zero_mul, Int.mul_comm, Int.neg_mul,
    Int.mul_neg, Int.neg_neg] <;> omega

/-- THE DIRAC LAW. On the mass shell the operator less the mass, times the operator plus the mass, is zero: the
    law of second order is the product of two laws of first order. -/
theorem the_dirac_law_factors_the_mass_shell (E x y z m : Int) (h : E * E - (x * x + y * y + z * z) = m * m) :
    mmul (Dminus E x y z m) (Dplus E x y z m) = scalar 0 := by
  apply M.eq4 <;> apply Q.eq4 <;>
  simp only [mmul, Dminus, Dplus, scalar, qadd, qmul, dir, num, Int.mul_zero, Int.zero_mul, Int.neg_mul,
    Int.mul_neg, Int.neg_neg, Int.sub_mul, Int.mul_sub, Int.add_mul, Int.mul_add, Int.mul_comm] <;> omega

/-- BOTH SIGNS OF THE ENERGY. The mass shell that admits an energy admits its negative: the law carries the
    antiparticle. -/
theorem both_signs_of_the_energy (E m p2 : Int) (h : E * E = m * m + p2) : (-E) * (-E) = m * m + p2 := by
  rw [Int.neg_mul_neg]; exact h

/-- EVERY MASS IS ADMITTED. The law fixes its form and is silent on the mass. -/
theorem every_mass_is_admitted (m : Int) : ∃ E x y z : Int, E * E - (x * x + y * y + z * z) = m * m :=
  ⟨m, 0, 0, 0, by simp only [Int.mul_zero, Int.add_zero, Int.sub_zero]⟩

/-- The components of the least law in n dimensions of spacetime. -/
def components (n : Nat) : Nat := 2 ^ (n / 2)

theorem four_components_in_four : components 4 = 4 := rfl
theorem two_components_in_three : components 3 = 2 := rfl
/-- Four is two spins times two signs of the energy. -/
theorem two_spins_and_two_signs : components 4 = 2 * 2 := rfl

/-! ## Part IV. Exclusion from the full turn. -/

/-- The sign of a full turn on a particle of spin s, given twice the spin. -/
def turnSign (twoS : Nat) : Int := if twoS % 2 = 0 then 1 else -1

theorem a_half_spin_turns_to_minus : turnSign 1 = -1 := rfl
theorem a_whole_spin_turns_to_plus : turnSign 0 = 1 ∧ turnSign 2 = 1 := ⟨rfl, rfl⟩

/-- A double exchange is no exchange. -/
theorem the_turn_sign_squares_to_one (n : Nat) : turnSign n * turnSign n = 1 := by
  unfold turnSign; split <;> rfl

/-- THE FULL TURN FORCES EXCLUSION. If the exchange of two identical particles carries the sign of a full turn,
    and the spin is a half, their amplitude vanishes wherever the two share a state. -/
theorem the_full_turn_forces_exclusion {α : Type} (twoS : Nat) (hodd : twoS % 2 = 1) (ψ : α → α → Int)
    (hex : ∀ a b, ψ b a = turnSign twoS * ψ a b) (a : α) : ψ a a = 0 := by
  have h := hex a a
  have hs : turnSign twoS = -1 := by unfold turnSign; rw [if_neg (by omega)]
  rw [hs] at h; omega

/-- A WHOLE SPIN EXCLUDES NOTHING. With the plus sign an amplitude may be as large as it likes on the diagonal. -/
theorem a_whole_spin_may_share (twoS : Nat) (heven : twoS % 2 = 0) :
    ∃ ψ : Nat → Nat → Int, (∀ a b, ψ b a = turnSign twoS * ψ a b) ∧ ψ 0 0 ≠ 0 := by
  refine ⟨fun _ _ => 1, ?_, by decide⟩
  intro a b
  have hs : turnSign twoS = 1 := by unfold turnSign; rw [if_pos heven]
  rw [hs]; rfl

/-! ## Part V. Two statistics and no third. -/

/-- TWO STATISTICS AND NO THIRD. A sign whose square is one is plus one or minus one. -/
theorem two_statistics_no_third (σ : Int) : σ * σ = 1 ↔ σ = 1 ∨ σ = -1 := by
  constructor
  · intro h
    have h1 : (σ - 1) * (σ + 1) = 0 := by
      simp only [Int.sub_mul, Int.mul_add, Int.mul_one, Int.one_mul]; omega
    rcases Int.mul_eq_zero.mp h1 with h2 | h2
    · exact Or.inl (by omega)
    · exact Or.inr (by omega)
  · intro h
    rcases h with h | h <;> rw [h] <;> rfl

/-- A double exchange unwinds to nothing: the sphere of directions in d dimensions of space is simply connected. -/
def unwinds (d : Nat) : Prop := 2 ≤ d - 1

/-- THREE DIMENSIONS OF SPACE ARE THE LEAST IN WHICH THE DOUBLE EXCHANGE UNWINDS. -/
theorem the_double_exchange_unwinds_from_three (d : Nat) : unwinds d ↔ 3 ≤ d := by
  unfold unwinds; constructor <;> intro h <;> omega

/-- The plane does not unwind it. -/
theorem the_plane_does_not_unwind : ¬ unwinds 2 := by unfold unwinds; decide

/-- A QUARTER PHASE IS NOT A SIGN. Its square is minus one, so it lives only where the double exchange is not the
    identity: in the plane. -/
theorem a_quarter_phase_is_not_a_sign : qmul qi qi ≠ one := by
  intro h; have h1 := congrArg Q.a h; revert h1; decide

end SPHYS.Dirac

#print axioms SPHYS.Dirac.no_number_takes_the_square_root
#print axioms SPHYS.Dirac.Q.eq4
#print axioms SPHYS.Dirac.the_units_square_to_minus_one
#print axioms SPHYS.Dirac.the_units_anticommute
#print axioms SPHYS.Dirac.a_full_turn_is_minus_one
#print axioms SPHYS.Dirac.two_full_turns_return
#print axioms SPHYS.Dirac.a_full_turn_fixes_every_direction
#print axioms SPHYS.Dirac.the_turns_take_the_square_root
#print axioms SPHYS.Dirac.the_product_carries_the_cross
#print axioms SPHYS.Dirac.M.eq4
#print axioms SPHYS.Dirac.dirac_squares_to_the_mass_shell
#print axioms SPHYS.Dirac.the_dirac_law_factors_the_mass_shell
#print axioms SPHYS.Dirac.both_signs_of_the_energy
#print axioms SPHYS.Dirac.every_mass_is_admitted
#print axioms SPHYS.Dirac.four_components_in_four
#print axioms SPHYS.Dirac.two_components_in_three
#print axioms SPHYS.Dirac.two_spins_and_two_signs
#print axioms SPHYS.Dirac.a_half_spin_turns_to_minus
#print axioms SPHYS.Dirac.a_whole_spin_turns_to_plus
#print axioms SPHYS.Dirac.the_turn_sign_squares_to_one
#print axioms SPHYS.Dirac.the_full_turn_forces_exclusion
#print axioms SPHYS.Dirac.a_whole_spin_may_share
#print axioms SPHYS.Dirac.two_statistics_no_third
#print axioms SPHYS.Dirac.the_double_exchange_unwinds_from_three
#print axioms SPHYS.Dirac.the_plane_does_not_unwind
#print axioms SPHYS.Dirac.a_quarter_phase_is_not_a_sign
