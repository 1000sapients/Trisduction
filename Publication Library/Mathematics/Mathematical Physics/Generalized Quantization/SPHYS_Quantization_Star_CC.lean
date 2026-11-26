import Mathlib.Algebra.Star.Basic
import Mathlib.Tactic.Abel
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.Algebra.CharZero.Defs

/-! # SPHYS_Quantization_Star_CC.lean · EVERY ALGEBRAIC QUANTIZATION IS A SEAT (26 November 2026, _CC)

RATIONALE. By an algebraic quantization is meant a construction that ends in an algebra of quantities with an
  adjoint: a ring `A` with an involution `star` that reverses products. Operators on a Hilbert space, matrix
  algebras, C*-algebras, von Neumann algebras and their crossed products, and Weyl algebras are all of this kind.
  This file does not treat one such construction. It quantifies over all of them, so a construction published before
  this file or after it is already inside the statements, on the one condition that its quantities form a star ring.
DESIGN. The fold is the adjoint. The line is the self-adjoint elements, which every such scheme calls its
  observables. A reading the adjoint keeps is a registration; the real part `re a = a + star a` is one. Part I: the
  observables are the atoms. Part II: the commutator of two observables, where it is not zero, is off the line; it
  and its adjoint are two on one registration, and no reading the adjoint keeps tells them apart. Part III: over a
  field of characteristic zero no canonical pair lives in finite matrices. Part IV: one term.
STANDING. Proved for every star ring; the two-way statements need that the ring has no element of order two under
  addition, written as the hypothesis `two`. Part III is for matrices over a field of characteristic zero.
WHAT IS NOT CLAIMED. No constant is derived: the size of a commutator is not fixed by anything here. No result of
  any particular quantization is proved or refuted: its algebra, its states and its dynamics are its own. What is
  proved is the place its structure takes on the seat.
RISK. A scheme whose quantities do not form a ring with an adjoint (a path integral taken as primitive, a purely
  geometric quantization before any algebra is formed) is outside these statements until it produces one.
NON-NEGOTIABLE. No axiom declared, no `sorry`. Nothing before the colon of the binding term but the ring itself.
  Every cone is pinned at the end of the file. -/

set_option autoImplicit false

namespace SPHYS.QuantizationStar

/-! ## PART I · THE OBSERVABLES ARE THE ATOMS -/
section Atoms
variable {A : Type} [Ring A] [StarRing A]

/-- A reading counts a configuration when it gives no two members the same value. -/
def Counts {X Y : Type} (r : X → Y) (S : X → Prop) : Prop := ∀ a b, S a → S b → r a = r b → a = b

/-- The real part, doubled: a quantity added to its adjoint. -/
def re (a : A) : A := a + star a

/-- THE ADJOINT KEEPS THE REAL PART. So the real part is a registration of the adjoint. -/
theorem the_adjoint_keeps_the_real_part (a : A) : re (star a) = re a := by
  unfold re; rw [star_star, add_comm]

/-- THE OBSERVABLES ARE THE ATOMS. In any star ring, for any reading the adjoint keeps, with values in any set:
    a configuration that holds the adjoint of each member and is counted by the reading holds only self-adjoint
    members. -/
theorem the_observables_are_the_atoms {Y : Type} (r : A → Y) (kept : ∀ a, r (star a) = r a)
    (S : A → Prop) (form : ∀ a, S a → S (star a)) (count : Counts r S) : ∀ a, S a → star a = a :=
  fun a ha => count (star a) a (form a ha) ha (kept a)

/-- THE REAL PART TELLS THE OBSERVABLES APART, where the ring has no element of additive order two. -/
theorem the_real_part_tells_the_observables_apart (two : ∀ x : A, x + x = 0 → x = 0) (a b : A)
    (ha : star a = a) (hb : star b = b) (h : re a = re b) : a = b := by
  unfold re at h; rw [ha, hb] at h
  have e : (a - b) + (a - b) = (a + a) - (b + b) := by abel
  rw [h, sub_self] at e
  exact sub_eq_zero.mp (two _ e)

/-- QUANTIZED BY THE REAL PART EXACTLY ON THE OBSERVABLES, where the ring has no element of additive order two. A
    configuration that holds the adjoint of each member
    is counted by the real part exactly when every member is self-adjoint. -/
theorem quantized_by_the_real_part_iff_observables (two : ∀ x : A, x + x = 0 → x = 0) (S : A → Prop)
    (form : ∀ a, S a → S (star a)) : Counts re S ↔ ∀ a, S a → star a = a :=
  ⟨fun count => the_observables_are_the_atoms re the_adjoint_keeps_the_real_part S form count,
   fun fx a b ha hb h => the_real_part_tells_the_observables_apart two a b (fx a ha) (fx b hb) h⟩

end Atoms

/-! ## PART II · THE COMMUTATOR AND THE LINE -/
section Commutator
variable {A : Type} [Ring A] [StarRing A]

/-- THE COMMUTATOR OF TWO OBSERVABLES IS REVERSED BY THE ADJOINT. -/
theorem the_adjoint_reverses_the_commutator (a b : A) (ha : star a = a) (hb : star b = b) :
    star (a * b - b * a) = -(a * b - b * a) := by
  rw [star_sub, star_mul, star_mul, ha, hb, neg_sub]

/-- THE REAL PART READS NO COMMUTATOR. The registration of the commutator of two observables is zero. -/
theorem the_real_part_reads_no_commutator (a b : A) (ha : star a = a) (hb : star b = b) :
    re (a * b - b * a) = 0 := by
  unfold re; rw [the_adjoint_reverses_the_commutator a b ha hb, add_neg_cancel]

/-- TWO OBSERVABLES WHOSE COMMUTATOR IS AN OBSERVABLE COMMUTE, where the ring has no element of additive order two. -/
theorem observables_with_an_observable_commutator_commute (two : ∀ x : A, x + x = 0 → x = 0) (a b : A)
    (ha : star a = a) (hb : star b = b) (hc : star (a * b - b * a) = a * b - b * a) : a * b = b * a := by
  have h := the_adjoint_reverses_the_commutator a b ha hb
  rw [hc] at h
  have e : (a * b - b * a) + (a * b - b * a) = 0 := by
    nth_rewrite 1 [h]; exact neg_add_cancel _
  exact sub_eq_zero.mp (two _ e)

/-- A CANONICAL PAIR IS A PAIR OFF THE LINE, where the ring has no element of additive order two. Where two
    observables do not commute, their commutator and its adjoint
    are two, and they have one registration. -/
theorem a_commutator_and_its_adjoint_are_two_on_one_registration (two : ∀ x : A, x + x = 0 → x = 0) (a b : A)
    (ha : star a = a) (hb : star b = b) (h : a * b ≠ b * a) :
    star (a * b - b * a) ≠ a * b - b * a ∧ re (star (a * b - b * a)) = re (a * b - b * a) :=
  ⟨fun hc => h (observables_with_an_observable_commutator_commute two a b ha hb hc),
   the_adjoint_keeps_the_real_part _⟩

/-- NO READING THE ADJOINT KEEPS COUNTS A CANONICAL PAIR'S COMMUTATOR WITH ITS ADJOINT, where the ring has no element
    of additive order two. Whatever the reading and
    whatever its values. -/
theorem no_kept_reading_counts_the_commutator_with_its_adjoint {Y : Type} (two : ∀ x : A, x + x = 0 → x = 0)
    (r : A → Y) (kept : ∀ a, r (star a) = r a) (a b : A) (ha : star a = a) (hb : star b = b)
    (h : a * b ≠ b * a) (S : A → Prop) (hc : S (a * b - b * a)) (hs : S (star (a * b - b * a))) :
    ¬ Counts r S :=
  fun count => (a_commutator_and_its_adjoint_are_two_on_one_registration two a b ha hb h).1
    (count _ _ hs hc (kept _))

end Commutator

/-! ## PART III · NO CANONICAL PAIR IN FINITE MATRICES -/

/-- NO CANONICAL PAIR IN FINITE MATRICES. Over a field of characteristic zero no two square matrices of a nonzero
    finite size have a commutator that is a nonzero multiple of the identity. A canonical pair needs infinitely
    many dimensions; this is the classical trace argument, compiled. -/
theorem no_canonical_pair_in_finite_matrices {n R : Type} [Fintype n] [DecidableEq n] [Nonempty n] [Field R]
    [CharZero R] (P Q : Matrix n n R) (c : R) (hc : c ≠ 0) : P * Q - Q * P ≠ c • (1 : Matrix n n R) := by
  intro h
  have t := congrArg Matrix.trace h
  rw [Matrix.trace_sub, Matrix.trace_mul_comm P Q, sub_self, Matrix.trace_smul, Matrix.trace_one,
    smul_eq_mul] at t
  rcases mul_eq_zero.mp t.symm with h0 | h0
  · exact hc h0
  · exact (Nat.cast_ne_zero.mpr Fintype.card_ne_zero) h0

/-! ## PART IV · ONE TERM -/

/-- EVERY ALGEBRAIC QUANTIZATION IS A SEAT. Nothing stands before the colon but the star ring itself. -/
theorem every_algebraic_quantization_is_a_seat :
    ∀ (A : Type) [Ring A] [StarRing A],
      (∀ a : A, star (star a) = a)
      ∧ (∀ a : A, re (star a) = re a)
      ∧ (∀ (Y : Type) (r : A → Y), (∀ a, r (star a) = r a) → ∀ S : A → Prop, (∀ a, S a → S (star a)) →
          Counts r S → ∀ a, S a → star a = a)
      ∧ (∀ a b : A, star a = a → star b = b → star (a * b - b * a) = -(a * b - b * a))
      ∧ (∀ a b : A, star a = a → star b = b → re (a * b - b * a) = 0)
      ∧ ((∀ x : A, x + x = 0 → x = 0) → ∀ a b : A, star a = a → star b = b → a * b ≠ b * a →
          star (a * b - b * a) ≠ a * b - b * a ∧ re (star (a * b - b * a)) = re (a * b - b * a)) :=
  fun _ _ _ => ⟨star_star, the_adjoint_keeps_the_real_part,
    fun _ r kept S form count => the_observables_are_the_atoms r kept S form count,
    the_adjoint_reverses_the_commutator, the_real_part_reads_no_commutator,
    fun two a b ha hb h => a_commutator_and_its_adjoint_are_two_on_one_registration two a b ha hb h⟩

end SPHYS.QuantizationStar

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.QuantizationStar.the_adjoint_keeps_the_real_part' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.QuantizationStar.the_adjoint_keeps_the_real_part
/-- info: 'SPHYS.QuantizationStar.the_observables_are_the_atoms' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.QuantizationStar.the_observables_are_the_atoms
/-- info: 'SPHYS.QuantizationStar.the_real_part_tells_the_observables_apart' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.QuantizationStar.the_real_part_tells_the_observables_apart
/-- info: 'SPHYS.QuantizationStar.quantized_by_the_real_part_iff_observables' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.QuantizationStar.quantized_by_the_real_part_iff_observables
/-- info: 'SPHYS.QuantizationStar.the_adjoint_reverses_the_commutator' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.QuantizationStar.the_adjoint_reverses_the_commutator
/-- info: 'SPHYS.QuantizationStar.the_real_part_reads_no_commutator' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.QuantizationStar.the_real_part_reads_no_commutator
/--
info: 'SPHYS.QuantizationStar.observables_with_an_observable_commutator_commute' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationStar.observables_with_an_observable_commutator_commute
/--
info: 'SPHYS.QuantizationStar.a_commutator_and_its_adjoint_are_two_on_one_registration' depends on axioms: [propext,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationStar.a_commutator_and_its_adjoint_are_two_on_one_registration
/--
info: 'SPHYS.QuantizationStar.no_kept_reading_counts_the_commutator_with_its_adjoint' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationStar.no_kept_reading_counts_the_commutator_with_its_adjoint
/--
info: 'SPHYS.QuantizationStar.no_canonical_pair_in_finite_matrices' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.QuantizationStar.no_canonical_pair_in_finite_matrices
/-- info: 'SPHYS.QuantizationStar.every_algebraic_quantization_is_a_seat' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.QuantizationStar.every_algebraic_quantization_is_a_seat
