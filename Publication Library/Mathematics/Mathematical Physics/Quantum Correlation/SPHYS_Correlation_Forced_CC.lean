/-
SPHYS_Correlation_Forced_CC.lean · no signal, the reach of local records, and the reach of the quantum, on real algebra
RATIONALE. The engine of edition 1.0.0 proved its statements over small structures of integers. This file replaces
  it. A record is a linear functional on a ring of readings, a far operation is a family of elements of that ring,
  a local account is a weighted family of tables over an ordered field, and the pair of the quantum is a set of
  matrices. Nothing else is assumed.
DESIGN. Parts, in order.
    Part I    The registration. `no_signal_from_a_far_reading`, `no_signal_from_a_far_operation`: the near record
              does not move, whatever complete reading or operation the far party performs.
    Part II   Local records. `table_is_plus_or_minus_two`, `local_records_stay_within_two`,
              `every_value_within_two_is_reached`: Bell's bound is the whole reach of local records.
    Part III  Four readings in a ring, two near and two far, each of square one, near commuting with far.
              `square_of_the_correlation`: S² = 4 − [A₀, A₁][B₀, B₁]. `commuting_readings_give_four`.
              `anticommuting_readings_give_zero_or_eight`. `sum_of_two_squares`: 8 − 2r S is a sum of two squares
              when r² = 2. `quantum_reach`: every record positive on those squares has |S| at most 2r.
    Part IV   The pair of the quantum, as matrices of size four over any commutative ring. `model_readings`,
              `model_reaches`: the singlet is carried to minus four times itself. `model_outcomes`: at equal
              settings the two outcomes never agree and each alone is fair.
    Part V    `Premises`; `no_signal_forced`; `reach_forced`; `quantumPremises`: the structure is inhabited over
              the reals, and its member reaches the bound.
WHAT IS NOT PROVED HERE (read before citing).
    (a) That a record is a linear functional, positive on squares of readings, and that the readings of two parties
        commute. These are the fields of `Premises`.
    (b) That nature's pairs are the pair of Part IV. It is read from experiment.
    (c) Which outcome occurs. Part IV proves each is fair alone; nothing here selects one.
RISK. Finite families throughout. The bound of Part III is stated for records positive on two named squares.
  No magnitude is derived.
NON-NEGOTIABLE. No axiom is declared, no sorry. No headline theorem closes over a structure that carries its
  conclusion. The kernel line of every theorem the paper names is printed at the end.
-/
import Mathlib.Data.Matrix.Notation
import Mathlib.Data.Matrix.Mul
import Mathlib.Algebra.Algebra.Basic
import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Algebra.Order.BigOperators.Ring.Finset
import Mathlib.Data.Real.Sqrt
import Mathlib.Data.Real.Star
import Mathlib.Data.Matrix.ConjTranspose
import Mathlib.Algebra.Star.Module
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Ring
import Mathlib.Tactic.NoncommRing
import Mathlib.Tactic.Module
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity

namespace SPHYS.Correlation

/-! ## Part I. The registration forces no signal -/

section Registration
variable {R : Type*} [Ring R] {V : Type*} [AddCommGroup V] {β : Type*} [Fintype β]

/-- NO SIGNAL FROM A FAR READING. Let φ be an additive record, E a near element, and M a complete family of far
outcomes: a finite family that sums to one. The near record, summed over the far outcomes, is φ(E), whatever M is. -/
theorem no_signal_from_a_far_reading (φ : R →+ V) (E : R) (M : β → R) (hM : ∑ b, M b = 1) :
    ∑ b, φ (E * M b) = φ E := by
  rw [← map_sum, ← Finset.mul_sum, hM, mul_one]

/-- NO SIGNAL FROM A FAR OPERATION. Let the far party act by a finite family K with companions L, complete in the
sense that the sum of L b * K b is one, and let every K b commute with the near element E. The near record after
the operation, summed over its branches, is φ(E). -/
theorem no_signal_from_a_far_operation (φ : R →+ V) (E : R) (K L : β → R) (hc : ∑ b, L b * K b = 1)
    (hloc : ∀ b, K b * E = E * K b) : ∑ b, φ (L b * E * K b) = φ E := by
  have e : ∀ b, L b * E * K b = L b * K b * E := fun b => by rw [mul_assoc, ← hloc b, mul_assoc]
  simp only [e]
  rw [← map_sum, ← Finset.sum_mul, hc, one_mul]

/-- The same for two different complete families of far outcomes: the near record cannot tell them apart. -/
theorem the_near_record_reads_no_far_choice {β' : Type*} [Fintype β'] (φ : R →+ V) (E : R) (M : β → R)
    (M' : β' → R) (hM : ∑ b, M b = 1) (hM' : ∑ b, M' b = 1) : ∑ b, φ (E * M b) = ∑ b, φ (E * M' b) := by
  rw [no_signal_from_a_far_reading φ E M hM, no_signal_from_a_far_reading φ E M' hM']

end Registration

/-! ## Part II. Local records -/

section Local
variable {K : Type*} [Field K] [LinearOrder K] [IsStrictOrderedRing K]

/-- The correlation of four answers. -/
def chsh (a0 a1 b0 b1 : K) : K := a0 * b0 + a0 * b1 + a1 * b0 - a1 * b1

/-- A TABLE GIVES PLUS OR MINUS TWO. If each of the four answers is plus or minus one, the correlation is plus or
minus two. -/
theorem table_is_plus_or_minus_two (a0 a1 b0 b1 : K) (h0 : a0 = 1 ∨ a0 = -1) (h1 : a1 = 1 ∨ a1 = -1)
    (h2 : b0 = 1 ∨ b0 = -1) (h3 : b1 = 1 ∨ b1 = -1) : chsh a0 a1 b0 b1 = 2 ∨ chsh a0 a1 b0 b1 = -2 := by
  unfold chsh
  rcases h0 with rfl | rfl <;> rcases h1 with rfl | rfl <;> rcases h2 with rfl | rfl <;>
    rcases h3 with rfl | rfl <;> norm_num

/-- LOCAL RECORDS STAY WITHIN TWO. A local account is a finite family of tables with weights that are not negative
and sum to one. Its correlation lies between minus two and two. -/
theorem local_records_stay_within_two {Λ : Type*} [Fintype Λ] (w a0 a1 b0 b1 : Λ → K) (hw : ∀ l, 0 ≤ w l)
    (hsum : ∑ l, w l = 1) (h0 : ∀ l, a0 l = 1 ∨ a0 l = -1) (h1 : ∀ l, a1 l = 1 ∨ a1 l = -1)
    (h2 : ∀ l, b0 l = 1 ∨ b0 l = -1) (h3 : ∀ l, b1 l = 1 ∨ b1 l = -1) :
    -2 ≤ ∑ l, w l * chsh (a0 l) (a1 l) (b0 l) (b1 l) ∧ ∑ l, w l * chsh (a0 l) (a1 l) (b0 l) (b1 l) ≤ 2 := by
  have up : ∀ l, w l * chsh (a0 l) (a1 l) (b0 l) (b1 l) ≤ w l * 2 := by
    intro l
    apply mul_le_mul_of_nonneg_left _ (hw l)
    rcases table_is_plus_or_minus_two _ _ _ _ (h0 l) (h1 l) (h2 l) (h3 l) with e | e <;>
      first | exact e.le | exact e.ge | (rw [e]; norm_num)
  have lo : ∀ l, w l * (-2) ≤ w l * chsh (a0 l) (a1 l) (b0 l) (b1 l) := by
    intro l
    apply mul_le_mul_of_nonneg_left _ (hw l)
    rcases table_is_plus_or_minus_two _ _ _ _ (h0 l) (h1 l) (h2 l) (h3 l) with e | e <;>
      first | exact e.le | exact e.ge | (rw [e]; norm_num)
  constructor
  · calc (-2 : K) = ∑ l, w l * (-2) := by rw [← Finset.sum_mul, hsum, one_mul]
      _ ≤ _ := Finset.sum_le_sum (fun l _ => lo l)
  · calc _ ≤ ∑ l, w l * 2 := Finset.sum_le_sum (fun l _ => up l)
      _ = 2 := by rw [← Finset.sum_mul, hsum, one_mul]

/-- EVERY VALUE WITHIN TWO IS REACHED. For every s between minus two and two there is a local account of two
tables whose correlation is s. Bell's bound is the whole reach of local records. -/
theorem every_value_within_two_is_reached (s : K) (hlo : -2 ≤ s) (hhi : s ≤ 2) :
    ∃ w a0 a1 b0 b1 : Bool → K, (∀ l, 0 ≤ w l) ∧ ∑ l, w l = 1 ∧ (∀ l, a0 l = 1 ∨ a0 l = -1)
      ∧ (∀ l, a1 l = 1 ∨ a1 l = -1) ∧ (∀ l, b0 l = 1 ∨ b0 l = -1) ∧ (∀ l, b1 l = 1 ∨ b1 l = -1)
      ∧ ∑ l, w l * chsh (a0 l) (a1 l) (b0 l) (b1 l) = s := by
  refine ⟨fun l => if l then (2 + s) / 4 else (2 - s) / 4, fun l => if l then 1 else -1,
    fun l => if l then 1 else -1, fun _ => 1, fun _ => 1, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · intro l; cases l <;> simp <;> linarith
  · simp [Fintype.sum_bool]; ring
  · intro l; cases l <;> simp
  · intro l; cases l <;> simp
  · intro l; exact Or.inl rfl
  · intro l; exact Or.inl rfl
  · simp [Fintype.sum_bool, chsh]; ring

end Local

/-! ## Part III. Four readings in a ring -/

section Readings
variable {R : Type*} [Ring R] (A0 A1 B0 B1 : R)
variable (hA0 : A0 * A0 = 1) (hA1 : A1 * A1 = 1) (hB0 : B0 * B0 = 1) (hB1 : B1 * B1 = 1)
variable (hloc : ∀ a ∈ [A0, A1], ∀ b ∈ [B0, B1], b * a = a * b)

/-- The correlation of four readings. -/
def corr : R := A0 * B0 + A0 * B1 + A1 * B0 - A1 * B1

include hA0 hA1 hB0 hB1 hloc

/-- THE SQUARE OF THE CORRELATION. It is four, less the product of the commutator of the two near readings with
the commutator of the two far readings. -/
theorem square_of_the_correlation :
    corr A0 A1 B0 B1 * corr A0 A1 B0 B1 = 4 - (A0 * A1 - A1 * A0) * (B0 * B1 - B1 * B0) := by
  have sw : ∀ x p y q : R, p * y = y * p → x * p * (y * q) = x * y * (p * q) := by
    intro x p y q hh
    rw [mul_assoc, ← mul_assoc p, hh, mul_assoc, ← mul_assoc]
  have c : ∀ a b, a ∈ [A0, A1] → b ∈ [B0, B1] → b * a = a * b := fun a b ha hb => hloc a ha b hb
  have e4 : (4 : R) = 1 + 1 + 1 + 1 := by norm_num
  unfold corr
  rw [e4]
  simp only [add_mul, mul_add, sub_mul, mul_sub]
  rw [sw A0 B0 A0 B0 (c _ _ (by simp) (by simp)), sw A0 B0 A0 B1 (c _ _ (by simp) (by simp)),
    sw A0 B0 A1 B0 (c _ _ (by simp) (by simp)), sw A0 B0 A1 B1 (c _ _ (by simp) (by simp)),
    sw A0 B1 A0 B0 (c _ _ (by simp) (by simp)), sw A0 B1 A0 B1 (c _ _ (by simp) (by simp)),
    sw A0 B1 A1 B0 (c _ _ (by simp) (by simp)), sw A0 B1 A1 B1 (c _ _ (by simp) (by simp)),
    sw A1 B0 A0 B0 (c _ _ (by simp) (by simp)), sw A1 B0 A0 B1 (c _ _ (by simp) (by simp)),
    sw A1 B0 A1 B0 (c _ _ (by simp) (by simp)), sw A1 B0 A1 B1 (c _ _ (by simp) (by simp)),
    sw A1 B1 A0 B0 (c _ _ (by simp) (by simp)), sw A1 B1 A0 B1 (c _ _ (by simp) (by simp)),
    sw A1 B1 A1 B0 (c _ _ (by simp) (by simp)), sw A1 B1 A1 B1 (c _ _ (by simp) (by simp)),
    hA0, hA1, hB0, hB1]
  noncomm_ring

/-- READINGS THAT COMMUTE GIVE FOUR. If the two near readings commute, the square of the correlation is four: the
value of a table. What no table can hold is two readings of one party that do not commute. -/
theorem commuting_readings_give_four (h : A0 * A1 = A1 * A0) : corr A0 A1 B0 B1 * corr A0 A1 B0 B1 = 4 := by
  rw [square_of_the_correlation A0 A1 B0 B1 hA0 hA1 hB0 hB1 hloc, h, sub_self, zero_mul, sub_zero]

/-- READINGS THAT ANTICOMMUTE GIVE ZERO OR EIGHT. If the two near readings anticommute and the two far readings
anticommute, the square of the correlation, call it Q, obeys Q (Q − 8) = 0. -/
theorem anticommuting_readings_give_zero_or_eight (ha : A1 * A0 = -(A0 * A1)) (hb : B1 * B0 = -(B0 * B1)) :
    (corr A0 A1 B0 B1 * corr A0 A1 B0 B1) * (corr A0 A1 B0 B1 * corr A0 A1 B0 B1 - 8) = 0 := by
  have c : ∀ a b, a ∈ [A0, A1] → b ∈ [B0, B1] → b * a = a * b := fun a b ha hb => hloc a ha b hb
  have e4 : (4 : R) = 1 + 1 + 1 + 1 := by norm_num
  have e8 : (8 : R) = (1 + 1) * (1 + 1 + 1 + 1) := by norm_num
  rw [square_of_the_correlation A0 A1 B0 B1 hA0 hA1 hB0 hB1 hloc, ha, hb]
  have x : (A0 * A1 - -(A0 * A1)) * (B0 * B1 - -(B0 * B1)) = (1 + 1 + 1 + 1) * (A0 * A1 * (B0 * B1)) := by
    noncomm_ring
  have aa : (A0 * A1) * (A0 * A1) = -1 := by
    calc (A0 * A1) * (A0 * A1) = A0 * (A1 * A0) * A1 := by noncomm_ring
      _ = -((A0 * A0) * (A1 * A1)) := by rw [ha]; noncomm_ring
      _ = -1 := by rw [hA0, hA1, mul_one]
  have bb : (B0 * B1) * (B0 * B1) = -1 := by
    calc (B0 * B1) * (B0 * B1) = B0 * (B1 * B0) * B1 := by noncomm_ring
      _ = -((B0 * B0) * (B1 * B1)) := by rw [hb]; noncomm_ring
      _ = -1 := by rw [hB0, hB1, mul_one]
  have cc : (B0 * B1) * (A0 * A1) = (A0 * A1) * (B0 * B1) := by
    calc (B0 * B1) * (A0 * A1) = B0 * (B1 * A0) * A1 := by noncomm_ring
      _ = B0 * (A0 * B1) * A1 := by rw [c A0 B1 (by simp) (by simp)]
      _ = (B0 * A0) * (B1 * A1) := by noncomm_ring
      _ = (A0 * B0) * (A1 * B1) := by rw [c A0 B0 (by simp) (by simp), c A1 B1 (by simp) (by simp)]
      _ = A0 * (B0 * A1) * B1 := by noncomm_ring
      _ = A0 * (A1 * B0) * B1 := by rw [c A1 B0 (by simp) (by simp)]
      _ = (A0 * A1) * (B0 * B1) := by noncomm_ring
  have xx : (A0 * A1 * (B0 * B1)) * (A0 * A1 * (B0 * B1)) = 1 := by
    calc (A0 * A1 * (B0 * B1)) * (A0 * A1 * (B0 * B1))
        = (A0 * A1) * ((B0 * B1) * (A0 * A1)) * (B0 * B1) := by noncomm_ring
      _ = ((A0 * A1) * (A0 * A1)) * ((B0 * B1) * (B0 * B1)) := by rw [cc]; noncomm_ring
      _ = 1 := by rw [aa, bb]; noncomm_ring
  rw [x, e4, e8]
  generalize A0 * A1 * (B0 * B1) = T at xx ⊢
  have fin : (1 + 1 + 1 + 1 - (1 + 1 + 1 + 1) * T) * (1 + 1 + 1 + 1 - (1 + 1 + 1 + 1) * T
      - (1 + 1) * (1 + 1 + 1 + 1)) = (1 + 1 + 1 + 1) * (1 + 1 + 1 + 1) * (T * T - 1) := by noncomm_ring
  rw [fin, xx, sub_self, mul_zero]

end Readings

section Reach
variable {K : Type*} [Field K] [LinearOrder K] [IsStrictOrderedRing K] {R : Type*} [Ring R] [Algebra K R]
variable (A0 A1 B0 B1 : R)
variable (hA0 : A0 * A0 = 1) (hA1 : A1 * A1 = 1) (hB0 : B0 * B0 = 1) (hB1 : B1 * B1 = 1)
variable (hloc : ∀ a ∈ [A0, A1], ∀ b ∈ [B0, B1], b * a = a * b)
include hA0 hA1 hB0 hB1 hloc

/-- A SUM OF TWO SQUARES. Let r be a constant with r * r = 2. Then eight less 2r times the correlation is the sum
of the squares of r A₀ − (B₀ + B₁) and r A₁ − (B₀ − B₁). -/
theorem sum_of_two_squares (r : K) (hr : r * r = 2) :
    (r • A0 - (B0 + B1)) * (r • A0 - (B0 + B1)) + (r • A1 - (B0 - B1)) * (r • A1 - (B0 - B1))
      = (8 : K) • (1 : R) - (2 * r) • corr A0 A1 B0 B1 := by
  have c00 : B0 * A0 = A0 * B0 := hloc A0 (by simp) B0 (by simp)
  have c01 : B1 * A0 = A0 * B1 := hloc A0 (by simp) B1 (by simp)
  have c10 : B0 * A1 = A1 * B0 := hloc A1 (by simp) B0 (by simp)
  have c11 : B1 * A1 = A1 * B1 := hloc A1 (by simp) B1 (by simp)
  unfold corr
  simp only [sub_mul, mul_sub, add_mul, mul_add, smul_mul_assoc, mul_smul_comm, smul_smul, hA0, hA1, hB0, hB1,
    c00, c01, c10, c11, hr]
  match_scalars <;> first | ring1 | linear_combination 2 * hr

/-- THE REACH OF THE QUANTUM. Let φ be a linear record with φ(1) = 1 that is not negative on the two squares
above. Then the correlation lies between −2r and 2r, where r * r = 2 and r is positive: the square of the
correlation is at most eight. -/
theorem quantum_reach (φ : R →ₗ[K] K) (h1 : φ 1 = 1) (r : K) (hr : r * r = 2) (hr0 : 0 < r)
    (hP : 0 ≤ φ ((r • A0 - (B0 + B1)) * (r • A0 - (B0 + B1))))
    (hQ : 0 ≤ φ ((r • A1 - (B0 - B1)) * (r • A1 - (B0 - B1)))) :
    φ (corr A0 A1 B0 B1) ≤ 2 * r := by
  have e := congrArg φ (sum_of_two_squares A0 A1 B0 B1 hA0 hA1 hB0 hB1 hloc r hr)
  rw [map_add, map_sub, map_smul, map_smul, h1, smul_eq_mul, smul_eq_mul, mul_one] at e
  have h : 0 ≤ 8 - 2 * r * φ (corr A0 A1 B0 B1) := by rw [← e]; exact add_nonneg hP hQ
  nlinarith

end Reach

/-! ## Part III-b. A record that is positive, and readings of one party that commute -/

section Positive
variable {R : Type*} [Ring R] [StarRing R] [Algebra ℝ R] [StarModule ℝ R]

/-- THE SQUARE OF A RECORD IS AT MOST THE RECORD OF THE SQUARE. For a linear record φ with φ(1) = 1 that is not
negative on every star X * X, and a reading S with star S = S. -/
theorem record_squared_le (φ : R →ₗ[ℝ] ℝ) (h1 : φ 1 = 1) (hpos : ∀ X, 0 ≤ φ (star X * X)) (S : R)
    (hS : star S = S) : φ S * φ S ≤ φ (S * S) := by
  have hX : star (S - (φ S) • (1 : R)) = S - (φ S) • (1 : R) := by
    rw [star_sub, star_smul, star_one, hS, star_trivial]
  have h := hpos (S - (φ S) • (1 : R))
  rw [hX] at h
  have e : (S - (φ S) • (1 : R)) * (S - (φ S) • (1 : R))
      = S * S - (2 * φ S) • S + (φ S * φ S) • (1 : R) := by
    simp only [sub_mul, mul_sub, smul_mul_assoc, mul_smul_comm, smul_smul, one_mul, mul_one]
    module
  rw [e, map_add, map_sub, map_smul, map_smul, h1, smul_eq_mul, smul_eq_mul] at h
  nlinarith

end Positive

/-! ## Part IV. The pair of the quantum, as matrices of size four -/

section Model
variable {K : Type*} [CommRing K]

/-- The near reading along the first axis. Rows and columns are ordered: both up, near up and far down, near down
and far up, both down. -/
def nZ : Matrix (Fin 4) (Fin 4) K := !![1, 0, 0, 0; 0, 1, 0, 0; 0, 0, -1, 0; 0, 0, 0, -1]
/-- The near reading along the second axis. -/
def nX : Matrix (Fin 4) (Fin 4) K := !![0, 0, 1, 0; 0, 0, 0, 1; 1, 0, 0, 0; 0, 1, 0, 0]
/-- The far reading along the first axis. -/
def fZ : Matrix (Fin 4) (Fin 4) K := !![1, 0, 0, 0; 0, -1, 0, 0; 0, 0, 1, 0; 0, 0, 0, -1]
/-- The sum of the two far axes. -/
def fP : Matrix (Fin 4) (Fin 4) K := !![1, 1, 0, 0; 1, -1, 0, 0; 0, 0, 1, 1; 0, 0, 1, -1]
/-- The difference of the two far axes. -/
def fM : Matrix (Fin 4) (Fin 4) K := !![1, -1, 0, 0; -1, -1, 0, 0; 0, 0, 1, -1; 0, 0, -1, -1]
/-- The pair: near up and far down, less near down and far up. -/
def pair : Fin 4 → K := ![0, 1, -1, 0]

/-- The record of the pair on a matrix M, where s is a constant with 2 s s = 1: s s times the value of M on the
pair. -/
def rec (s : K) : Matrix (Fin 4) (Fin 4) K →ₗ[K] K where
  toFun M := s * s * (M 1 1 - M 1 2 - M 2 1 + M 2 2)
  map_add' M N := by simp only [Matrix.add_apply]; ring
  map_smul' c M := by simp only [Matrix.smul_apply, smul_eq_mul, RingHom.id_apply]; ring

/-- The record is the value on the pair. -/
theorem rec_is_the_value_on_the_pair (s : K) (M : Matrix (Fin 4) (Fin 4) K) :
    rec s M = s * s * (pair ⬝ᵥ M.mulVec pair) := by
  simp [rec, pair, Matrix.mulVec, dotProduct, Fin.sum_univ_four]; ring

theorem nZ_sq : (nZ : Matrix (Fin 4) (Fin 4) K) * nZ = 1 := by
  ext a b; fin_cases a <;> fin_cases b <;> simp [nZ, Matrix.mul_apply, Fin.sum_univ_four, Matrix.one_apply]
theorem nX_sq : (nX : Matrix (Fin 4) (Fin 4) K) * nX = 1 := by
  ext a b; fin_cases a <;> fin_cases b <;> simp [nX, Matrix.mul_apply, Fin.sum_univ_four, Matrix.one_apply]
theorem fP_sq : (fP : Matrix (Fin 4) (Fin 4) K) * fP = (2 : K) • 1 := by
  ext a b; fin_cases a <;> fin_cases b <;>
    simp [fP, Matrix.mul_apply, Fin.sum_univ_four, Matrix.one_apply] <;> norm_num
theorem fM_sq : (fM : Matrix (Fin 4) (Fin 4) K) * fM = (2 : K) • 1 := by
  ext a b; fin_cases a <;> fin_cases b <;>
    simp [fM, Matrix.mul_apply, Fin.sum_univ_four, Matrix.one_apply] <;> norm_num
theorem near_anticommute : (nX : Matrix (Fin 4) (Fin 4) K) * nZ = -(nZ * nX) := by
  ext a b; fin_cases a <;> fin_cases b <;> simp [nZ, nX, Matrix.mul_apply, Fin.sum_univ_four]
theorem far_anticommute : (fM : Matrix (Fin 4) (Fin 4) K) * fP = -(fP * fM) := by
  ext a b; fin_cases a <;> fin_cases b <;>
    simp [fP, fM, Matrix.mul_apply, Fin.sum_univ_four]
theorem fP_nZ : (fP : Matrix (Fin 4) (Fin 4) K) * nZ = nZ * fP := by
  ext a b; fin_cases a <;> fin_cases b <;> simp [nZ, fP, Matrix.mul_apply, Fin.sum_univ_four]
theorem fP_nX : (fP : Matrix (Fin 4) (Fin 4) K) * nX = nX * fP := by
  ext a b; fin_cases a <;> fin_cases b <;> simp [nX, fP, Matrix.mul_apply, Fin.sum_univ_four]
theorem fM_nZ : (fM : Matrix (Fin 4) (Fin 4) K) * nZ = nZ * fM := by
  ext a b; fin_cases a <;> fin_cases b <;> simp [nZ, fM, Matrix.mul_apply, Fin.sum_univ_four]
theorem fM_nX : (fM : Matrix (Fin 4) (Fin 4) K) * nX = nX * fM := by
  ext a b; fin_cases a <;> fin_cases b <;> simp [nX, fM, Matrix.mul_apply, Fin.sum_univ_four]

variable (s : K)

/-- The two far readings of the model: the two diagonals between the axes, turned to face the pair. -/
def mB0 : Matrix (Fin 4) (Fin 4) K := (-s) • fP
def mB1 : Matrix (Fin 4) (Fin 4) K := (-s) • fM

/-- THE READINGS OF THE MODEL. Each of the four squares to one, near commutes with far, the two near readings
anticommute and the two far readings anticommute. -/
theorem model_readings (hs : 2 * s * s = 1) :
    (nZ : Matrix (Fin 4) (Fin 4) K) * nZ = 1 ∧ (nX : Matrix (Fin 4) (Fin 4) K) * nX = 1
      ∧ mB0 s * mB0 s = 1 ∧ mB1 s * mB1 s = 1
      ∧ (∀ a ∈ [(nZ : Matrix (Fin 4) (Fin 4) K), nX], ∀ b ∈ [mB0 s, mB1 s], b * a = a * b)
      ∧ (nX : Matrix (Fin 4) (Fin 4) K) * nZ = -(nZ * nX) ∧ mB1 s * mB0 s = -(mB0 s * mB1 s) := by
  have k : -s * -s * 2 = 1 := by linear_combination hs
  refine ⟨nZ_sq, nX_sq, ?_, ?_, ?_, near_anticommute, ?_⟩
  · unfold mB0; rw [smul_mul_smul_comm, fP_sq, smul_smul, k, one_smul]
  · unfold mB1; rw [smul_mul_smul_comm, fM_sq, smul_smul, k, one_smul]
  · intro a ha b hb
    simp only [List.mem_cons, List.mem_singleton, List.not_mem_nil, or_false] at ha hb
    rcases ha with rfl | rfl <;> rcases hb with rfl | rfl <;>
      simp only [mB0, mB1, smul_mul_assoc, mul_smul_comm, fP_nZ, fP_nX, fM_nZ, fM_nX]
  · unfold mB0 mB1; rw [smul_mul_smul_comm, smul_mul_smul_comm, far_anticommute, smul_neg]

/-- THE MODEL REACHES THE BOUND. The correlation of the four readings carries the pair to 4 s times itself, and
the record of the correlation is 4 s. With 2 s s = 1, the square of 4 s is eight. -/
theorem model_reaches (hs : 2 * s * s = 1) :
    (corr nZ nX (mB0 s) (mB1 s)).mulVec pair = (4 * s) • (pair : Fin 4 → K)
      ∧ rec s (corr nZ nX (mB0 s) (mB1 s)) = 4 * s ∧ (4 * s) * (4 * s) = 8 := by
  refine ⟨?_, ?_, by linear_combination 8 * hs⟩
  · ext i; fin_cases i <;>
      simp [corr, nZ, nX, mB0, mB1, fP, fM, pair, Matrix.mulVec, dotProduct, Fin.sum_univ_four,
        Matrix.mul_apply] <;> ring
  · simp [rec, corr, nZ, nX, mB0, mB1, fP, fM, Matrix.mul_apply, Fin.sum_univ_four]
    linear_combination (4 * s) * hs

/-- The four outcomes of reading both parties along the first axis. -/
def nearUp : Matrix (Fin 4) (Fin 4) K := !![1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 0, 0; 0, 0, 0, 0]
def nearDown : Matrix (Fin 4) (Fin 4) K := !![0, 0, 0, 0; 0, 0, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1]
def farUp : Matrix (Fin 4) (Fin 4) K := !![1, 0, 0, 0; 0, 0, 0, 0; 0, 0, 1, 0; 0, 0, 0, 0]
def farDown : Matrix (Fin 4) (Fin 4) K := !![0, 0, 0, 0; 0, 1, 0, 0; 0, 0, 0, 0; 0, 0, 0, 1]

/-- The outcomes are complete readings of the first axis. -/
theorem outcomes_are_complete :
    (nearUp : Matrix (Fin 4) (Fin 4) K) + nearDown = 1 ∧ (farUp : Matrix (Fin 4) (Fin 4) K) + farDown = 1
      ∧ (nearUp : Matrix (Fin 4) (Fin 4) K) - nearDown = nZ ∧ (farUp : Matrix (Fin 4) (Fin 4) K) - farDown = fZ := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;> ext a b <;> fin_cases a <;> fin_cases b <;>
    simp [nearUp, nearDown, farUp, farDown, nZ, fZ, Matrix.one_apply]

/-- THE OUTCOME IS ONE KEYED BIT. Read both parties of the pair along the same axis. The two outcomes never
agree: the record of up with up is zero and of down with down is zero. Each outcome alone has record one half.
Either party's outcome is fair alone and is fixed by the partner's. -/
theorem model_outcomes (hs : 2 * s * s = 1) :
    rec s (nearUp * farUp) = 0 ∧ rec s (nearDown * farDown) = 0
      ∧ 2 * rec s (nearUp * farDown) = 1 ∧ 2 * rec s (nearDown * farUp) = 1
      ∧ 2 * rec s nearUp = 1 ∧ 2 * rec s nearDown = 1 ∧ 2 * rec s farUp = 1 ∧ 2 * rec s farDown = 1 := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩ <;>
    simp [rec, nearUp, nearDown, farUp, farDown, Matrix.mul_apply, Fin.sum_univ_four] <;>
    linear_combination hs

end Model

/-! ## Part V. The theorem -/

/-- The premises. Four readings in a star ring over the reals, two near and two far; each squares to one and is
its own star; near commutes with far; the record is linear, takes one to one, and is not negative on any
star X * X. Nothing else is assumed. -/
structure Premises (R : Type*) [Ring R] [StarRing R] [Algebra ℝ R] [StarModule ℝ R] where
  A0 : R
  A1 : R
  B0 : R
  B1 : R
  square_one : ∀ x ∈ [A0, A1, B0, B1], x * x = 1
  own_star : ∀ x ∈ [A0, A1, B0, B1], star x = x
  separate : ∀ a ∈ [A0, A1], ∀ b ∈ [B0, B1], b * a = a * b
  record : R →ₗ[ℝ] ℝ
  whole : record 1 = 1
  positive : ∀ X, 0 ≤ record (star X * X)

namespace Premises
variable {R : Type*} [Ring R] [StarRing R] [Algebra ℝ R] [StarModule ℝ R] (P : Premises R)

/-- The correlation of the premises. -/
def S : R := corr P.A0 P.A1 P.B0 P.B1

/-- NO SIGNAL, FORCED. Whatever complete operation the far party performs with elements that commute with a near
element E, the near record is unchanged. -/
theorem no_signal_forced {β : Type*} [Fintype β] (E : R) (K L : β → R) (hc : ∑ b, L b * K b = 1)
    (hloc : ∀ b, K b * E = E * K b) : ∑ b, P.record (L b * E * K b) = P.record E :=
  no_signal_from_a_far_operation P.record.toAddMonoidHom E K L hc hloc

/-- The two outcomes of a reading b: half of one plus b, and half of one less b. -/
noncomputable def out (b : R) (e : Bool) : R := (1 / 2 : ℝ) • (1 + (if e then b else -b))

omit [StarRing R] [StarModule ℝ R] in
theorem out_complete (b : R) : out b true + out b false = 1 := by
  unfold out; simp only [if_true, Bool.false_eq_true, if_false]; module

omit [StarRing R] [StarModule ℝ R] in
theorem out_square (b : R) (hb : b * b = 1) (e : Bool) : out b e * out b e = out b e := by
  unfold out
  cases e <;>
    simp only [if_true, Bool.false_eq_true, if_false, smul_mul_assoc, mul_smul_comm, smul_smul, add_mul, mul_add,
      one_mul, mul_one, neg_mul_neg, hb] <;> module

/-- NO SIGNAL BETWEEN THE READINGS OF THE PREMISES. Let the far party read either of its readings, with either
outcome registered. The near record of either near reading, summed over the two far outcomes, is what it was.
Only the fields of the premises are used. -/
theorem no_signal_on_the_premises (a : R) (ha : a ∈ [P.A0, P.A1]) (b : R) (hb : b ∈ [P.B0, P.B1]) :
    ∑ e : Bool, P.record (out b e * a * out b e) = P.record a := by
  have hb1 : b * b = 1 := P.square_one b (by
    simp only [List.mem_cons, List.mem_singleton, List.not_mem_nil, or_false] at hb ⊢; tauto)
  have c := P.separate a ha b hb
  apply P.no_signal_forced a (out b) (out b)
  · simp only [out_square b hb1, Fintype.sum_bool, out_complete]
  · intro e; unfold out
    cases e <;>
      simp only [if_true, Bool.false_eq_true, if_false, smul_mul_assoc, mul_smul_comm, add_mul, mul_add, one_mul,
        mul_one, neg_mul, mul_neg, c]

/-- THE REACH, FORCED. The record of the correlation lies between minus 2√2 and 2√2. -/
theorem reach_forced : -(2 * Real.sqrt 2) ≤ P.record P.S ∧ P.record P.S ≤ 2 * Real.sqrt 2 := by
  have hr : Real.sqrt 2 * Real.sqrt 2 = 2 := Real.mul_self_sqrt (by norm_num)
  have hr0 : (0 : ℝ) < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
  have a0 := P.square_one P.A0 (by simp); have a1 := P.square_one P.A1 (by simp)
  have b0 := P.square_one P.B0 (by simp); have b1 := P.square_one P.B1 (by simp)
  have s0 := P.own_star P.A0 (by simp); have s1 := P.own_star P.A1 (by simp)
  have t0 := P.own_star P.B0 (by simp); have t1 := P.own_star P.B1 (by simp)
  constructor
  · -- the same bound for the far readings with their signs turned
    have nb0 : (-P.B0) * (-P.B0) = 1 := by rw [neg_mul_neg, b0]
    have nb1 : (-P.B1) * (-P.B1) = 1 := by rw [neg_mul_neg, b1]
    have nloc : ∀ a ∈ [P.A0, P.A1], ∀ b ∈ [-P.B0, -P.B1], b * a = a * b := by
      intro a ha b hb
      simp only [List.mem_cons, List.mem_singleton, List.not_mem_nil, or_false] at hb
      rcases hb with rfl | rfl
      · rw [neg_mul, mul_neg, P.separate a ha P.B0 (by simp)]
      · rw [neg_mul, mul_neg, P.separate a ha P.B1 (by simp)]
    have hP := P.positive (Real.sqrt 2 • P.A0 - (-P.B0 + -P.B1))
    have hQ := P.positive (Real.sqrt 2 • P.A1 - (-P.B0 - -P.B1))
    have eP : star (Real.sqrt 2 • P.A0 - (-P.B0 + -P.B1)) = Real.sqrt 2 • P.A0 - (-P.B0 + -P.B1) := by
      simp only [star_sub, star_add, star_neg, star_smul, star_trivial, s0, t0, t1]
    have eQ : star (Real.sqrt 2 • P.A1 - (-P.B0 - -P.B1)) = Real.sqrt 2 • P.A1 - (-P.B0 - -P.B1) := by
      simp only [star_sub, star_neg, star_smul, star_trivial, s1, t0, t1]
    rw [eP] at hP; rw [eQ] at hQ
    have h := quantum_reach P.A0 P.A1 (-P.B0) (-P.B1) a0 a1 nb0 nb1 nloc P.record P.whole (Real.sqrt 2) hr hr0
      hP hQ
    have e : corr P.A0 P.A1 (-P.B0) (-P.B1) = -P.S := by unfold S corr; noncomm_ring
    rw [e, map_neg] at h
    linarith
  · have hP := P.positive (Real.sqrt 2 • P.A0 - (P.B0 + P.B1))
    have hQ := P.positive (Real.sqrt 2 • P.A1 - (P.B0 - P.B1))
    have eP : star (Real.sqrt 2 • P.A0 - (P.B0 + P.B1)) = Real.sqrt 2 • P.A0 - (P.B0 + P.B1) := by
      simp only [star_sub, star_add, star_smul, star_trivial, s0, t0, t1]
    have eQ : star (Real.sqrt 2 • P.A1 - (P.B0 - P.B1)) = Real.sqrt 2 • P.A1 - (P.B0 - P.B1) := by
      simp only [star_sub, star_smul, star_trivial, s1, t0, t1]
    rw [eP] at hP; rw [eQ] at hQ
    exact quantum_reach P.A0 P.A1 P.B0 P.B1 a0 a1 b0 b1 P.separate P.record P.whole (Real.sqrt 2) hr hr0 hP hQ

/-- THE SQUARE IS AT MOST EIGHT. -/
theorem square_at_most_eight : P.record P.S * P.record P.S ≤ 8 := by
  have hr : Real.sqrt 2 * Real.sqrt 2 = 2 := Real.mul_self_sqrt (by norm_num)
  obtain ⟨lo, hi⟩ := P.reach_forced
  nlinarith

/-- THE CORRELATION IS ITS OWN STAR. -/
theorem S_own_star : star P.S = P.S := by
  have s0 := P.own_star P.A0 (by simp); have s1 := P.own_star P.A1 (by simp)
  have t0 := P.own_star P.B0 (by simp); have t1 := P.own_star P.B1 (by simp)
  unfold S corr
  simp only [star_sub, star_add, star_mul, s0, s1, t0, t1, P.separate P.A0 (by simp) P.B0 (by simp),
    P.separate P.A0 (by simp) P.B1 (by simp), P.separate P.A1 (by simp) P.B0 (by simp),
    P.separate P.A1 (by simp) P.B1 (by simp)]

/-- READINGS THAT COMMUTE STAY WITHIN TWO. If the two near readings commute, the record of the correlation lies
between minus two and two: the bound of local records, inside the same premises. To pass two, one party must
hold two readings that do not commute. -/
theorem commuting_readings_stay_within_two (h : P.A0 * P.A1 = P.A1 * P.A0) :
    -2 ≤ P.record P.S ∧ P.record P.S ≤ 2 := by
  have sq : P.S * P.S = 4 := commuting_readings_give_four P.A0 P.A1 P.B0 P.B1 (P.square_one _ (by simp))
    (P.square_one _ (by simp)) (P.square_one _ (by simp)) (P.square_one _ (by simp)) P.separate h
  have k := record_squared_le P.record P.whole P.positive P.S P.S_own_star
  have four : P.record (4 : R) = 4 := by
    have : (4 : R) = 1 + 1 + 1 + 1 := by norm_num
    rw [this, map_add, map_add, map_add, P.whole]; norm_num
  rw [sq, four] at k
  constructor <;> nlinarith

/-- PASSING TWO FORCES READINGS THAT DO NOT COMMUTE. -/
theorem passing_two_forces_readings_that_do_not_commute (h : 2 < P.record P.S) :
    P.A0 * P.A1 ≠ P.A1 * P.A0 := fun e => absurd (P.commuting_readings_stay_within_two e).2 (not_le.mpr h)

/-- THE TWO PARTIES EXCHANGED. The premises with near and far exchanged are premises, with the same correlation. -/
def swap : Premises R where
  A0 := P.B0
  A1 := P.B1
  B0 := P.A0
  B1 := P.A1
  square_one := fun x hx => P.square_one x (by
    simp only [List.mem_cons, List.mem_singleton, List.not_mem_nil, or_false] at hx ⊢; tauto)
  own_star := fun x hx => P.own_star x (by
    simp only [List.mem_cons, List.mem_singleton, List.not_mem_nil, or_false] at hx ⊢; tauto)
  separate := fun a ha b hb => (P.separate b hb a ha).symm
  record := P.record
  whole := P.whole
  positive := P.positive

theorem swap_S : P.swap.S = P.S := by
  show corr P.B0 P.B1 P.A0 P.A1 = corr P.A0 P.A1 P.B0 P.B1
  unfold corr
  rw [P.separate P.A0 (by simp) P.B0 (by simp), P.separate P.A1 (by simp) P.B0 (by simp),
    P.separate P.A0 (by simp) P.B1 (by simp), P.separate P.A1 (by simp) P.B1 (by simp)]
  abel

/-- THE SAME FOR THE FAR PARTY. If the two far readings commute, the record of the correlation lies between minus
two and two. -/
theorem commuting_far_readings_stay_within_two (h : P.B0 * P.B1 = P.B1 * P.B0) :
    -2 ≤ P.record P.S ∧ P.record P.S ≤ 2 := by
  have k := P.swap.commuting_readings_stay_within_two h
  rw [P.swap_S] at k
  exact k

/-- PASSING TWO FORCES BOTH PARTIES. A record of the correlation above two forces the two near readings not to
commute, and the two far readings not to commute. -/
theorem passing_two_forces_both_parties (h : 2 < P.record P.S) :
    P.A0 * P.A1 ≠ P.A1 * P.A0 ∧ P.B0 * P.B1 ≠ P.B1 * P.B0 :=
  ⟨P.passing_two_forces_readings_that_do_not_commute h,
    P.swap.passing_two_forces_readings_that_do_not_commute (by rw [P.swap_S]; exact h)⟩

end Premises

/-! ### The premises are inhabited, and their member reaches the bound -/

/-- A LOCAL ACCOUNT IS A MEMBER WHOSE READINGS ALL COMMUTE. A weighted family of tables is a member of the
premises: the ring is the ring of functions on the tables, and the record is the weighted sum. -/
noncomputable def localPremises {Λ : Type*} [Fintype Λ] (w a0 a1 b0 b1 : Λ → ℝ) (hw : ∀ l, 0 ≤ w l)
    (hsum : ∑ l, w l = 1) (h0 : ∀ l, a0 l = 1 ∨ a0 l = -1) (h1 : ∀ l, a1 l = 1 ∨ a1 l = -1)
    (h2 : ∀ l, b0 l = 1 ∨ b0 l = -1) (h3 : ∀ l, b1 l = 1 ∨ b1 l = -1) : Premises (Λ → ℝ) where
  A0 := a0
  A1 := a1
  B0 := b0
  B1 := b1
  square_one := by
    intro x hx
    simp only [List.mem_cons, List.mem_singleton, List.not_mem_nil, or_false] at hx
    funext l
    rcases hx with rfl | rfl | rfl | rfl
    · rcases h0 l with e | e <;> simp [e]
    · rcases h1 l with e | e <;> simp [e]
    · rcases h2 l with e | e <;> simp [e]
    · rcases h3 l with e | e <;> simp [e]
  own_star := fun x _ => by funext l; simp
  separate := fun a _ b _ => mul_comm b a
  record :=
    { toFun := fun f => ∑ l, w l * f l
      map_add' := fun f g => by simp [mul_add, Finset.sum_add_distrib]
      map_smul' := fun c f => by simp [Finset.mul_sum, mul_left_comm] }
  whole := by simpa using hsum
  positive := fun X => Finset.sum_nonneg fun l _ => mul_nonneg (hw l) (by simpa using mul_self_nonneg (X l))

/-- The record of the local member is the weighted sum of its tables, and it lies within two by the theorem on
readings that commute: Bell's bound, reached a second way. -/
theorem local_member_stays_within_two {Λ : Type*} [Fintype Λ] (w a0 a1 b0 b1 : Λ → ℝ) (hw : ∀ l, 0 ≤ w l)
    (hsum : ∑ l, w l = 1) (h0 : ∀ l, a0 l = 1 ∨ a0 l = -1) (h1 : ∀ l, a1 l = 1 ∨ a1 l = -1)
    (h2 : ∀ l, b0 l = 1 ∨ b0 l = -1) (h3 : ∀ l, b1 l = 1 ∨ b1 l = -1) :
    (localPremises w a0 a1 b0 b1 hw hsum h0 h1 h2 h3).record (localPremises w a0 a1 b0 b1 hw hsum h0 h1 h2 h3).S
        = ∑ l, w l * chsh (a0 l) (a1 l) (b0 l) (b1 l)
      ∧ -2 ≤ ∑ l, w l * chsh (a0 l) (a1 l) (b0 l) (b1 l) ∧ ∑ l, w l * chsh (a0 l) (a1 l) (b0 l) (b1 l) ≤ 2 := by
  have e : (localPremises w a0 a1 b0 b1 hw hsum h0 h1 h2 h3).record
      (localPremises w a0 a1 b0 b1 hw hsum h0 h1 h2 h3).S = ∑ l, w l * chsh (a0 l) (a1 l) (b0 l) (b1 l) := rfl
  have k := (localPremises w a0 a1 b0 b1 hw hsum h0 h1 h2 h3).commuting_readings_stay_within_two (mul_comm _ _)
  rw [e] at k
  exact ⟨e, k⟩

/-- The constant of the model over the reals: half the square root of two. -/
noncomputable def sR : ℝ := Real.sqrt 2 / 2

theorem sR_spec : 2 * sR * sR = 1 := by
  have hr : Real.sqrt 2 * Real.sqrt 2 = 2 := Real.mul_self_sqrt (by norm_num)
  unfold sR; nlinarith

/-- The record of the pair is not negative on star X * X. -/
theorem rec_positive (X : Matrix (Fin 4) (Fin 4) ℝ) : 0 ≤ rec sR (star X * X) := by
  have e : rec sR (star X * X) = sR * sR * ((X 0 1 - X 0 2) ^ 2 + (X 1 1 - X 1 2) ^ 2 + (X 2 1 - X 2 2) ^ 2
      + (X 3 1 - X 3 2) ^ 2) := by
    simp only [rec, LinearMap.coe_mk, AddHom.coe_mk, Matrix.mul_apply, Matrix.star_apply, Fin.sum_univ_four,
      star_trivial]
    ring
  rw [e]; exact mul_nonneg (mul_self_nonneg _) (by positivity)

/-- THE PREMISES ARE INHABITED. The pair of Part IV, over the reals. -/
noncomputable def quantumPremises : Premises (Matrix (Fin 4) (Fin 4) ℝ) where
  A0 := nZ
  A1 := nX
  B0 := mB0 sR
  B1 := mB1 sR
  square_one := by
    obtain ⟨h1, h2, h3, h4, -⟩ := model_readings sR sR_spec
    intro x hx
    simp only [List.mem_cons, List.mem_singleton, List.not_mem_nil, or_false] at hx
    rcases hx with rfl | rfl | rfl | rfl <;> assumption
  own_star := by
    intro x hx
    simp only [List.mem_cons, List.mem_singleton, List.not_mem_nil, or_false] at hx
    rcases hx with rfl | rfl | rfl | rfl <;> ext a b <;> fin_cases a <;> fin_cases b <;>
      simp [nZ, nX, mB0, mB1, fP, fM, Matrix.star_apply]
  separate := (model_readings sR sR_spec).2.2.2.2.1
  record := rec sR
  whole := by simp [rec, Matrix.one_apply]; linear_combination sR_spec
  positive := rec_positive

/-- THE BOUND IS REACHED. The member's record of the correlation is 2√2, and its two near readings do not
commute. -/
theorem the_bound_is_reached :
    quantumPremises.record quantumPremises.S = 2 * Real.sqrt 2
      ∧ quantumPremises.A0 * quantumPremises.A1 ≠ quantumPremises.A1 * quantumPremises.A0 := by
  have e : quantumPremises.record quantumPremises.S = 2 * Real.sqrt 2 := by
    have := (model_reaches sR sR_spec).2.1
    show rec sR (corr nZ nX (mB0 sR) (mB1 sR)) = _
    rw [this]; unfold sR; ring
  refine ⟨e, ?_⟩
  apply Premises.passing_two_forces_readings_that_do_not_commute
  rw [e]
  have : (1 : ℝ) < Real.sqrt 2 := by
    rw [show (1 : ℝ) = Real.sqrt 1 by simp]; exact Real.sqrt_lt_sqrt (by norm_num) (by norm_num)
  linarith

end SPHYS.Correlation

#print axioms SPHYS.Correlation.no_signal_from_a_far_reading
#print axioms SPHYS.Correlation.no_signal_from_a_far_operation
#print axioms SPHYS.Correlation.the_near_record_reads_no_far_choice
#print axioms SPHYS.Correlation.table_is_plus_or_minus_two
#print axioms SPHYS.Correlation.local_records_stay_within_two
#print axioms SPHYS.Correlation.every_value_within_two_is_reached
#print axioms SPHYS.Correlation.square_of_the_correlation
#print axioms SPHYS.Correlation.commuting_readings_give_four
#print axioms SPHYS.Correlation.anticommuting_readings_give_zero_or_eight
#print axioms SPHYS.Correlation.sum_of_two_squares
#print axioms SPHYS.Correlation.quantum_reach
#print axioms SPHYS.Correlation.record_squared_le
#print axioms SPHYS.Correlation.rec_is_the_value_on_the_pair
#print axioms SPHYS.Correlation.nZ_sq
#print axioms SPHYS.Correlation.nX_sq
#print axioms SPHYS.Correlation.fP_sq
#print axioms SPHYS.Correlation.fM_sq
#print axioms SPHYS.Correlation.near_anticommute
#print axioms SPHYS.Correlation.far_anticommute
#print axioms SPHYS.Correlation.fP_nZ
#print axioms SPHYS.Correlation.fP_nX
#print axioms SPHYS.Correlation.fM_nZ
#print axioms SPHYS.Correlation.fM_nX
#print axioms SPHYS.Correlation.model_readings
#print axioms SPHYS.Correlation.model_reaches
#print axioms SPHYS.Correlation.outcomes_are_complete
#print axioms SPHYS.Correlation.model_outcomes
#print axioms SPHYS.Correlation.Premises.no_signal_forced
#print axioms SPHYS.Correlation.Premises.reach_forced
#print axioms SPHYS.Correlation.Premises.square_at_most_eight
#print axioms SPHYS.Correlation.Premises.S_own_star
#print axioms SPHYS.Correlation.Premises.commuting_readings_stay_within_two
#print axioms SPHYS.Correlation.Premises.passing_two_forces_readings_that_do_not_commute
#print axioms SPHYS.Correlation.localPremises
#print axioms SPHYS.Correlation.local_member_stays_within_two
#print axioms SPHYS.Correlation.sR_spec
#print axioms SPHYS.Correlation.rec_positive
#print axioms SPHYS.Correlation.quantumPremises
#print axioms SPHYS.Correlation.the_bound_is_reached
#print axioms SPHYS.Correlation.Premises.out_complete
#print axioms SPHYS.Correlation.Premises.out_square
#print axioms SPHYS.Correlation.Premises.no_signal_on_the_premises
#print axioms SPHYS.Correlation.Premises.swap_S
#print axioms SPHYS.Correlation.Premises.passing_two_forces_both_parties
#print axioms SPHYS.Correlation.Premises.commuting_far_readings_stay_within_two
