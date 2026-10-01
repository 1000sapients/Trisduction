/-
  SPHYS_Pair_Correlation.lean · Level repulsion and the arrow · core Lean 4, no library.
  A two-level Hermitian block has diagonal a, d and off-diagonal b + i c. Time reversal is
  complex conjugation, c to -c, an involution whose fixed set is the real blocks; a magnetic,
  time-odd term c /= 0 breaks it. Degeneracy costs two conditions on the real blocks and three
  on the complex ones, so levels repel as s^1 (orthogonal class, time-even, nuclei) and as s^2
  (unitary class, time broken, the class of the Riemann zeros). Finite models.
-/
namespace SPHYS.PairCorr

structure H2 where
  a : Int
  d : Int
  b : Int
  c : Int
  deriving DecidableEq, Repr

def T (h : H2) : H2 := ⟨h.a, h.d, h.b, -h.c⟩

theorem T_involution (h : H2) : T (T h) = h := by
  cases h with
  | mk a d b c => show (⟨a, d, b, -(-c)⟩ : H2) = ⟨a, d, b, c⟩; rw [Int.neg_neg]

theorem T_fixed_iff_real (h : H2) : T h = h ↔ h.c = 0 := by
  cases h with
  | mk a d b c =>
    show (⟨a, d, b, -c⟩ : H2) = ⟨a, d, b, c⟩ ↔ c = 0
    constructor
    · intro e
      have h1 : -c = c := congrArg H2.c e
      omega
    · intro e
      subst e
      rfl

theorem magnetic_term_breaks_T (h : H2) (hc : h.c ≠ 0) : T h ≠ h :=
  fun e => hc ((T_fixed_iff_real h).mp e)

/-- The discriminant of the block; the two levels coincide exactly when it vanishes. -/
def disc (h : H2) : Int := (h.a - h.d) * (h.a - h.d) + 4 * (h.b * h.b + h.c * h.c)
def grid (x : Fin 5) : Int := (x.val : Int) - 2

/-- On a grid, degeneracy of a complex block needs three conditions. -/
theorem degenerate_iff_three_conditions :
    ∀ a d b c : Fin 5, disc ⟨grid a, grid d, grid b, grid c⟩ = 0 ↔
      (grid a = grid d ∧ grid b = 0 ∧ grid c = 0) := by decide

/-- On the time-even blocks (c = 0), degeneracy needs two. -/
theorem degenerate_real_two_conditions :
    ∀ a d b : Fin 5, disc ⟨grid a, grid d, grid b, 0⟩ = 0 ↔ (grid a = grid d ∧ grid b = 0) := by decide

/-- The repulsion exponent is the codimension of degeneracy minus one. -/
def codimOrth : Nat := 2
def codimUnit : Nat := 3
theorem repulsion_exponents : codimOrth - 1 = 1 ∧ codimUnit - 1 = 2 := by decide

/-- The coordinate bridge: H = H0 + lambda V, with H0 real and V the magnetic, time-odd term.
    Time reversal fixes H exactly when lambda vanishes. -/
theorem perturbation_breaks_T (a d b l : Int) : T ⟨a, d, b, l⟩ = ⟨a, d, b, l⟩ ↔ l = 0 :=
  T_fixed_iff_real ⟨a, d, b, l⟩

theorem sq_nonneg (x : Int) : 0 ≤ x * x := by
  cases Int.le_total 0 x with
  | inl h => exact Int.mul_nonneg h h
  | inr h =>
    have hn : 0 ≤ -x := by omega
    have := Int.mul_nonneg hn hn
    rw [Int.neg_mul_neg] at this
    exact this

/-- Degeneracy for every integer entry, not on a grid: the two levels coincide exactly when
    a = d, b = 0 and c = 0; the same sum-of-squares argument holds over the reals. -/
theorem degenerate_iff (a d b c : Int) : disc ⟨a, d, b, c⟩ = 0 ↔ a = d ∧ b = 0 ∧ c = 0 := by
  show (a - d) * (a - d) + 4 * (b * b + c * c) = 0 ↔ a = d ∧ b = 0 ∧ c = 0
  constructor
  · intro h
    have h1 := sq_nonneg (a - d)
    have h2 := sq_nonneg b
    have h3 := sq_nonneg c
    have e1 : (a - d) * (a - d) = 0 := by omega
    have e2 : b * b = 0 := by omega
    have e3 : c * c = 0 := by omega
    have ha : a - d = 0 := by
      cases Int.mul_eq_zero.mp e1 with
      | inl h => exact h
      | inr h => exact h
    have hb : b = 0 := by
      cases Int.mul_eq_zero.mp e2 with
      | inl h => exact h
      | inr h => exact h
    have hc : c = 0 := by
      cases Int.mul_eq_zero.mp e3 with
      | inl h => exact h
      | inr h => exact h
    exact ⟨by omega, hb, hc⟩
  · intro ⟨h1, h2, h3⟩
    subst h1; subst h2; subst h3
    simp [Int.sub_self]

end SPHYS.PairCorr
#print axioms SPHYS.PairCorr.T_involution
#print axioms SPHYS.PairCorr.T_fixed_iff_real
#print axioms SPHYS.PairCorr.magnetic_term_breaks_T
#print axioms SPHYS.PairCorr.degenerate_iff_three_conditions
#print axioms SPHYS.PairCorr.degenerate_real_two_conditions
#print axioms SPHYS.PairCorr.repulsion_exponents
#print axioms SPHYS.PairCorr.perturbation_breaks_T
#print axioms SPHYS.PairCorr.sq_nonneg
#print axioms SPHYS.PairCorr.degenerate_iff