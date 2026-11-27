# The Gluon as a New Mathematical Theorem

## Eight Carriers for Three Kinds of Charge, a Commutator That Is Again a Carrier and Obeys the Cyclic Identity in Any Ring, and No Mass Under a Kept Gauge

**Mohammad F. Islam PhD** · 26 November 2026

## Abstract

This paper proves, in Lean 4 with Mathlib, what is forced about the carriers of a charge with several kinds. The carriers of a charge with $n$ kinds are the $n \times n$ matrices of trace zero; over the rationals, for every $n \ge 1$, their dimension is $n^2 - 1$: eight for three kinds, three for two, none of this sort for one. Over any commutative ring and for any finite number of kinds, the commutator of two matrices has trace zero, so the charge one carrier reads on another is again a carrier: the carriers carry the charge they carry. Where the charge is a number the commutator is zero. With two kinds two carriers exist whose commutator is not zero. In any ring the commutator is antisymmetric, obeys the cyclic identity, and acts on a product factor by factor; the term of the field strength that the carriers contribute themselves is zero exactly when they commute. For any symmetric additive form on any additive group, a mass term that a change of gauge keeps is zero, where two is not zero and there are no zero divisors. The file has 17 theorems, declares no axiom and leaves no proof open. The strength of the coupling is measured.

## 1. The Theorem and What It Rests On

### 1.1 The statement

The binding theorem `the_gluon` states: (i) the space of $3 \times 3$ rational matrices of trace zero has dimension eight; (ii) for $3 \times 3$ rational matrices $M$, $N$, the trace of $MN - NM$ is zero; (iii) there are $2 \times 2$ integer matrices of trace zero with $MN - NM \ne 0$; (iv) for $3 \times 3$ rational matrices, $[[x,y],z] + [[y,z],x] + [[z,x],y] = 0$; (v) for rationals, $xy - yx = 0$. The general forms are in Sections 2 to 4.

### 1.2 What is proved, what is cited, what is assumed

Proved in Appendix A, and checked by the kernel of Lean 4 [9] with the Mathlib library [8]: every statement of Section 1.1 and of Sections 2 to 4. Assumed: that the charge of the strong force has three kinds and that its carriers are the matrices of trace zero acting on them [1, 2]. The equations of the field are forced in a companion paper [7] and are cited. Cited and not formalised: the observation of the carrier [3] and of its coupling to itself [4]; freedom at short distance [5, 6]. Measured and not derived: the strength of the coupling.

### 1.3 What gluon means here

A gluon means a carrier of the charge with three kinds: a direction in the space of $3 \times 3$ matrices of trace zero.

## 2. The Count

The theorem `the_count_of_the_carriers` states that the dimension of the matrices of trace zero, plus one, is $n^2$, for every $n \ge 1$. The theorem `eight_three_and_none` gives the cases three, two and one. The one direction left out is the identity, which reads the same on every kind and so carries none of the charge.

## 3. The Commutator

The reading of one carrier on another is the commutator. `the_commutator_of_two_is_a_carrier` states that its trace is zero, for matrices of any finite size over any commutative ring. `a_commuting_charge_has_no_commutator` states that for a charge that is a number it vanishes, and `carriers_that_do_not_commute` exhibits two that do not. In any ring, `the_reading_is_antisymmetric`, `the_cyclic_identity` and `the_reading_on_a_product` hold. The theorem `the_term_of_its_own_is_zero_iff_they_commute` states that the term $ab - ba$ of the field strength vanishes exactly when the two potentials commute. For light it vanishes; for the gluon it does not, and the field is a source of itself.

## 4. No Mass

The theorem `a_mass_is_changed_by_a_change_of_gauge` is stated for any symmetric additive form. The gauge of the strong force is kept, so its carriers have no mass term. That they are not seen at long range is a separate matter, discussed with the quark in another paper of this series.

## 5. What Is Subsumed and What Is Not

The theorem `every_model_of_the_carriers_is_an_instance` states the cyclic identity in any ring and the vanishing trace over any commutative ring with any number of kinds. A model with another group of charge realised in matrices is an instance; so is a force not yet observed with four kinds, for which Section 2 gives fifteen carriers. The general theorems of the seat, `every_model_is_an_instance`, `every_reading_of_the_seat_is_a_reading_of_the_model`, `an_odd_reading_is_zero_on_the_line`, `an_odd_reading_off_zero_tells_the_pair` and `a_kept_reading_is_one_on_the_pair`, are in Part 0.

Not subsumed: the equations of the field; the strength of the coupling; groups of charge that are not given by matrices of trace zero.

## 6. The File, Theorem by Theorem

| Theorem | Axioms its proof uses |
|---|---|
| `a_kept_reading_is_one_on_the_pair` | no axiom |
| `an_odd_reading_is_zero_on_the_line` | propext |
| `an_odd_reading_off_zero_tells_the_pair` | propext |
| `every_model_is_an_instance` | no axiom |
| `every_reading_of_the_seat_is_a_reading_of_the_model` | no axiom |
| `the_count_of_the_carriers` | propext, Classical.choice, Quot.sound |
| `eight_three_and_none` | propext, Classical.choice, Quot.sound |
| `the_commutator_of_two_is_a_carrier` | propext, Classical.choice, Quot.sound |
| `a_commuting_charge_has_no_commutator` | propext, Quot.sound |
| `carriers_that_do_not_commute` | propext, Classical.choice, Quot.sound |
| `the_reading_is_antisymmetric` | propext |
| `the_cyclic_identity` | propext |
| `the_reading_on_a_product` | propext |
| `the_term_of_its_own_is_zero_iff_they_commute` | propext |
| `a_mass_is_changed_by_a_change_of_gauge` | propext, Quot.sound |
| `the_gluon` | propext, Classical.choice, Quot.sound |
| `every_model_of_the_carriers_is_an_instance` | propext, Classical.choice, Quot.sound |

## 7. Discussion: The Reading

The following is a reading and is carried at the grade of a premise. A carrier is a reading, and for a charge that does not commute a reading of a reading is a reading of the same kind. The carriers therefore register one another. Nothing in Sections 2 to 5 depends on this paragraph.

## 8. Predictions, Falsifiers, and What Stands

### 8.1 Two predictions that will stand

First: the strong force has eight carriers and no ninth. Second: the carriers couple to one another, at a strength fixed by their coupling to quarks.

### 8.2 The two falsifiers

First: a ninth carrier of the strong force, reading the same on every colour. Section 2 would stand; what would fall is the assumption that the carriers are of trace zero. Second: measured jets that fit carriers which do not couple to one another. This would break the use of a charge that does not commute; the measured distributions require the coupling [4].

### 8.3 What kind of result this is

The theorems are a dimension count, identities in any ring, and one existence statement. They derive no strength.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file is written by a language model under the author's direct supervision. Every theorem named in the text is in Appendix A under that name, and its kernel line is printed in Appendix B. Classical results and measurements that are cited and not formalised are named as such where they are used. No constant of nature is derived anywhere in this paper: no mass, no strength of a coupling and no angle of a mixing is a theorem here, and where a measured value is quoted it is quoted from its source.

**The seat.** The seat is elementary: a set and a map of the set to itself, with the points the map leaves in place called its line. In the plane it is a reflection and the line it fixes, studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1. C. N. Yang and R. L. Mills, Phys. Rev. 96 (1954) 191.
2. H. Fritzsch, M. Gell-Mann and H. Leutwyler, Phys. Lett. B 47 (1973) 365.
3. R. Brandelik et al. (TASSO Collaboration), Phys. Lett. B 86 (1979) 243.
4. B. Adeva et al. (L3 Collaboration), Phys. Lett. B 248 (1990) 227.
5. D. J. Gross and F. Wilczek, Phys. Rev. Lett. 30 (1973) 1343.
6. H. D. Politzer, Phys. Rev. Lett. 30 (1973) 1346.
7. M. F. Islam, The Nuclear Forces as a New Mathematical Theorem (2026).
8. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
9. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
10. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its file uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main.

11. The law of a charge that does not commute, forced: Publication Library/Mathematics/Mathematical Physics/The Nuclear Forces/SPHYS_YangMills_Forced_CC.lean. Compiled with Mathlib 4.19.0, exit 0.
12. The seat: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_46_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.

## Appendix A · SPHYS_Gluon_Theorem_CC.lean

Lean 4.19.0 with Mathlib 4.19.0. 17 theorems, no axiom declared, no `sorry`, exit 0 with no warning. Every cone is pinned at the end of the file, so the build is silent. The kernel lines are Appendix B.

```lean
/-
SPHYS_Gluon_Theorem_CC.lean · The Gluon as a New Mathematical Theorem. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. The gluon is the carrier of a charge with three kinds. What is forced: there are eight; the commutator of two
  carriers is a carrier, so the carriers carry the charge they carry; with two kinds or more they do not commute; the
  commutator obeys the cyclic identity in any ring; a kept gauge leaves them no mass. DESIGN. Part 0 the seat. Part I the
  count, for any number of kinds. Part II the commutator, in any ring. Part III the mass, for any symmetric additive form.
RISK. The count is over the rationals; the strength of the coupling is measured. The equations of the field are forced in
  SPHYS_YangMills_Forced_CC.lean and are not repeated. NON-NEGOTIABLE. No axiom is declared. No proof is left open.
-/
import Mathlib.Algebra.Field.Basic
import Mathlib.Algebra.CharZero.Defs
import Mathlib.Algebra.Order.Field.Rat
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Data.Matrix.Mul
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.GroupTheory.Perm.Sign
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Abel
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NoncommRing
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.LinearCombination
import Mathlib.Data.Matrix.Basis
import Mathlib.Data.Matrix.Notation
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.FreeModule.Finite.Matrix
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas

namespace SPHYS.Gluon

/-! ## Part 0. The seat, on any type. Every later part is read on it, and every model of the same subject is an instance. -/

/-- The line of a fold: the points the fold leaves where they are. -/
def OnLine {X : Type*} (σ : X → X) (x : X) : Prop := σ x = x

/-- A reading the fold keeps takes one value on a point and its partner. -/
theorem a_kept_reading_is_one_on_the_pair {X V : Type*} (σ : X → X) (r : X → V)
    (h : ∀ x, r (σ x) = r x) (x : X) : r (σ x) = r x := h x

/-- A reading the fold reverses is zero on the line, where the values have no element of order two. -/
theorem an_odd_reading_is_zero_on_the_line {X V : Type*} [AddGroup V] (h2 : ∀ v : V, v + v = 0 → v = 0)
    (σ : X → X) (r : X → V) (hodd : ∀ x, r (σ x) = - r x) (x : X) (hx : OnLine σ x) : r x = 0 := by
  have h := hodd x
  rw [show σ x = x from hx] at h
  have e : r x + r x = - r x + r x := by rw [← h]
  rw [neg_add_cancel] at e
  exact h2 _ e

/-- Where a reversed reading is not zero, the point is off the line and the reading tells it from its partner. -/
theorem an_odd_reading_off_zero_tells_the_pair {X V : Type*} [AddGroup V] (h2 : ∀ v : V, v + v = 0 → v = 0)
    (σ : X → X) (r : X → V) (hodd : ∀ x, r (σ x) = - r x) (x : X) (hx : r x ≠ 0) :
    ¬ OnLine σ x ∧ r (σ x) ≠ r x := by
  refine ⟨fun h => hx (an_odd_reading_is_zero_on_the_line h2 σ r hodd x h), fun h => hx ?_⟩
  have e : r x + r x = - r x + r x := by rw [← hodd x, h]
  rw [neg_add_cancel] at e
  exact h2 _ e

/-- SUBSUMPTION. Any model carried into the seat by a one-to-one map that respects the folds has its line
exactly over the line of the seat. A model written before this file or after it is an instance. -/
theorem every_model_is_an_instance {X Y : Type*} (σ : X → X) (τ : Y → Y) (φ : Y → X)
    (hφ : Function.Injective φ) (heq : ∀ y, φ (τ y) = σ (φ y)) (y : Y) :
    OnLine τ y ↔ OnLine σ (φ y) := by
  constructor
  · intro h; show σ (φ y) = φ y; rw [← heq, show τ y = y from h]
  · intro h; apply hφ; rw [heq]; exact h

/-- SUBSUMPTION OF READINGS. A reading of the seat, pulled back along such a map, is kept or reversed in
the model exactly as it is on the seat. -/
theorem every_reading_of_the_seat_is_a_reading_of_the_model {X Y V : Type*} (σ : X → X) (τ : Y → Y) (φ : Y → X)
    (heq : ∀ y, φ (τ y) = σ (φ y)) (r : X → V) (s : V → V) (h : ∀ x, r (σ x) = s (r x)) (y : Y) :
    r (φ (τ y)) = s (r (φ y)) := by rw [heq]; exact h _

/-! ## The count of the carriers. The carriers of a charge with `n` kinds are the `n × n` matrices of trace zero. -/

/-- The matrices of trace zero, with one more, have dimension `n²`: there are `n² − 1` carriers. -/
theorem the_count_of_the_carriers (n : ℕ) (hn : 0 < n) :
    Module.finrank ℚ (LinearMap.ker (Matrix.traceLinearMap (Fin n) ℚ ℚ)) + 1 = n * n := by
  have hs : Function.Surjective (Matrix.traceLinearMap (Fin n) ℚ ℚ) := by
    intro c
    refine ⟨Matrix.stdBasisMatrix ⟨0, hn⟩ ⟨0, hn⟩ c, ?_⟩
    simp [Matrix.traceLinearMap_apply, Matrix.trace, Matrix.stdBasisMatrix, Finset.sum_ite_eq']
  have hr := LinearMap.finrank_range_add_finrank_ker (Matrix.traceLinearMap (Fin n) ℚ ℚ)
  rw [LinearMap.range_eq_top.mpr hs, finrank_top, Module.finrank_self, Module.finrank_matrix] at hr
  simp at hr
  omega

/-- Three kinds: eight carriers. Two kinds: three carriers. One kind: none of this sort. -/
theorem eight_three_and_none :
    Module.finrank ℚ (LinearMap.ker (Matrix.traceLinearMap (Fin 3) ℚ ℚ)) = 8
    ∧ Module.finrank ℚ (LinearMap.ker (Matrix.traceLinearMap (Fin 2) ℚ ℚ)) = 3
    ∧ Module.finrank ℚ (LinearMap.ker (Matrix.traceLinearMap (Fin 1) ℚ ℚ)) = 0 := by
  have h3 := the_count_of_the_carriers 3 (by norm_num)
  have h2 := the_count_of_the_carriers 2 (by norm_num)
  have h1 := the_count_of_the_carriers 1 (by norm_num)
  refine ⟨?_, ?_, ?_⟩ <;> omega

/-- THE CARRIERS CLOSE. The commutator of any two matrices has trace zero: it is again a carrier. -/
theorem the_commutator_of_two_is_a_carrier {n K : Type*} [Fintype n] [DecidableEq n] [CommRing K] (M N : Matrix n n K) :
    Matrix.trace (M * N - N * M) = 0 := by
  rw [Matrix.trace_sub, Matrix.trace_mul_comm, sub_self]

/-- A COMMUTING CHARGE HAS NO COMMUTATOR. Where the charge is a number, any two commute. -/
theorem a_commuting_charge_has_no_commutator {K : Type*} [CommRing K] (x y : K) : x * y - y * x = 0 := by ring

/-- WITH TWO KINDS OR MORE THE CARRIERS DO NOT COMMUTE: two of trace zero whose commutator is not zero. -/
theorem carriers_that_do_not_commute :
    ∃ M N : Matrix (Fin 2) (Fin 2) ℤ, Matrix.trace M = 0 ∧ Matrix.trace N = 0 ∧ M * N - N * M ≠ 0 := by
  refine ⟨!![0, 1; 0, 0], !![0, 0; 1, 0], ?_, ?_, ?_⟩
  · simp [Matrix.trace, Fin.sum_univ_two]
  · simp [Matrix.trace, Fin.sum_univ_two]
  · intro h
    have h00 := congrFun (congrFun h 0) 0
    simp [Matrix.mul_apply, Fin.sum_univ_two] at h00

/-! ## Part II. The commutator, in any ring. -/

section Commutator
variable {A : Type*} [Ring A]

/-- The charge that one carrier reads on another. -/
def br (x y : A) : A := x * y - y * x

/-- The reading is reversed when the two are exchanged, and a carrier reads none on itself. -/
theorem the_reading_is_antisymmetric (x y : A) : br x y = - br y x ∧ br x x = 0 := by
  constructor <;> simp [br]

/-- THE CYCLIC IDENTITY. The readings of three carriers on one another close, in any ring. -/
theorem the_cyclic_identity (x y z : A) : br (br x y) z + br (br y z) x + br (br z x) y = 0 := by
  simp only [br]; noncomm_ring

/-- The reading of a carrier on a product is taken on each factor in turn. -/
theorem the_reading_on_a_product (x y z : A) : br x (y * z) = br x y * z + y * br x z := by
  simp only [br]; noncomm_ring

/-- THE STRENGTH HAS A TERM OF ITS OWN. The strength of the field of two potentials `a`, `b` with first-order changes
`da`, `db` is `da − db + (a b − b a)`. The last term is zero exactly when the two commute. -/
theorem the_term_of_its_own_is_zero_iff_they_commute (a b : A) : br a b = 0 ↔ a * b = b * a := by
  simp [br, sub_eq_zero]

end Commutator

/-! ## Part III. The mass. -/

/-- A MASS IS CHANGED BY A CHANGE OF GAUGE. Let `B` be additive in its first place and symmetric, on any additive group,
let `k` be null, and let some `a₀` not be across `k`. If `m · B(a + k, a + k) = m · B(a, a)` for every `a`, then `m = 0`,
where two is not zero and there are no zero divisors. The carrier of a gauge that is kept has no mass. -/
theorem a_mass_is_changed_by_a_change_of_gauge {V K : Type*} [AddCommGroup V] [CommRing K] [NoZeroDivisors K]
    (h2 : (2 : K) ≠ 0) (B : V → V → K) (hl : ∀ a b c, B (a + b) c = B a c + B b c)
    (hs : ∀ a b, B a b = B b a) (k : V) (hk : B k k = 0) (a₀ : V) (ha₀ : B a₀ k ≠ 0) (m : K)
    (hm : ∀ a, m * B (a + k) (a + k) = m * B a a) : m = 0 := by
  have e : B (a₀ + k) (a₀ + k) = B a₀ a₀ + 2 * B a₀ k := by
    rw [hl, hs (a₀) (a₀ + k), hs k (a₀ + k), hl, hl, hk, hs k a₀]; ring
  have h := hm a₀
  rw [e] at h
  have h3 : m * (2 * B a₀ k) = 0 := by linear_combination h
  rcases mul_eq_zero.1 h3 with h | h
  · exact h
  · rcases mul_eq_zero.1 h with h | h
    · exact absurd h h2
    · exact absurd h ha₀

/-! ## Part IV. The binding theorem and subsumption. -/

/-- THE GLUON. -/
theorem the_gluon :
    (Module.finrank ℚ (LinearMap.ker (Matrix.traceLinearMap (Fin 3) ℚ ℚ)) = 8)
    ∧ (∀ M N : Matrix (Fin 3) (Fin 3) ℚ, Matrix.trace (M * N - N * M) = 0)
    ∧ (∃ M N : Matrix (Fin 2) (Fin 2) ℤ, Matrix.trace M = 0 ∧ Matrix.trace N = 0 ∧ M * N - N * M ≠ 0)
    ∧ (∀ x y z : Matrix (Fin 3) (Fin 3) ℚ, br (br x y) z + br (br y z) x + br (br z x) y = 0)
    ∧ (∀ x y : ℚ, x * y - y * x = 0) :=
  ⟨eight_three_and_none.1, fun M N => the_commutator_of_two_is_a_carrier M N, carriers_that_do_not_commute,
   the_cyclic_identity, a_commuting_charge_has_no_commutator⟩

/-- SUBSUMPTION. Any carriers, in any ring, with any number of kinds, have a commutator that obeys the cyclic identity
and, as matrices over any commutative ring, has trace zero. A model with another group of charge is an instance. -/
theorem every_model_of_the_carriers_is_an_instance {A n K : Type*} [Ring A] [Fintype n] [DecidableEq n] [CommRing K]
    (x y z : A) (M N : Matrix n n K) :
    br (br x y) z + br (br y z) x + br (br z x) y = 0 ∧ Matrix.trace (M * N - N * M) = 0 :=
  ⟨the_cyclic_identity x y z, the_commutator_of_two_is_a_carrier M N⟩


end SPHYS.Gluon

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.Gluon.a_kept_reading_is_one_on_the_pair' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Gluon.a_kept_reading_is_one_on_the_pair
/-- info: 'SPHYS.Gluon.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Gluon.an_odd_reading_is_zero_on_the_line
/-- info: 'SPHYS.Gluon.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Gluon.an_odd_reading_off_zero_tells_the_pair
/-- info: 'SPHYS.Gluon.every_model_is_an_instance' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Gluon.every_model_is_an_instance
/-- info: 'SPHYS.Gluon.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Gluon.every_reading_of_the_seat_is_a_reading_of_the_model
/-- info: 'SPHYS.Gluon.the_count_of_the_carriers' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Gluon.the_count_of_the_carriers
/-- info: 'SPHYS.Gluon.eight_three_and_none' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Gluon.eight_three_and_none
/-- info: 'SPHYS.Gluon.the_commutator_of_two_is_a_carrier' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Gluon.the_commutator_of_two_is_a_carrier
/-- info: 'SPHYS.Gluon.a_commuting_charge_has_no_commutator' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Gluon.a_commuting_charge_has_no_commutator
/-- info: 'SPHYS.Gluon.carriers_that_do_not_commute' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Gluon.carriers_that_do_not_commute
/-- info: 'SPHYS.Gluon.the_reading_is_antisymmetric' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Gluon.the_reading_is_antisymmetric
/-- info: 'SPHYS.Gluon.the_cyclic_identity' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Gluon.the_cyclic_identity
/-- info: 'SPHYS.Gluon.the_reading_on_a_product' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Gluon.the_reading_on_a_product
/-- info: 'SPHYS.Gluon.the_term_of_its_own_is_zero_iff_they_commute' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Gluon.the_term_of_its_own_is_zero_iff_they_commute
/-- info: 'SPHYS.Gluon.a_mass_is_changed_by_a_change_of_gauge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Gluon.a_mass_is_changed_by_a_change_of_gauge
/-- info: 'SPHYS.Gluon.the_gluon' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Gluon.the_gluon
/--
info: 'SPHYS.Gluon.every_model_of_the_carriers_is_an_instance' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Gluon.every_model_of_the_carriers_is_an_instance
```

## Appendix B · Kernel lines of Appendix A

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

```text
'SPHYS.Gluon.a_kept_reading_is_one_on_the_pair' does not depend on any axioms
'SPHYS.Gluon.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext]
'SPHYS.Gluon.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext]
'SPHYS.Gluon.every_model_is_an_instance' does not depend on any axioms
'SPHYS.Gluon.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms
'SPHYS.Gluon.the_count_of_the_carriers' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Gluon.eight_three_and_none' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Gluon.the_commutator_of_two_is_a_carrier' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Gluon.a_commuting_charge_has_no_commutator' depends on axioms: [propext, Quot.sound]
'SPHYS.Gluon.carriers_that_do_not_commute' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Gluon.the_reading_is_antisymmetric' depends on axioms: [propext]
'SPHYS.Gluon.the_cyclic_identity' depends on axioms: [propext]
'SPHYS.Gluon.the_reading_on_a_product' depends on axioms: [propext]
'SPHYS.Gluon.the_term_of_its_own_is_zero_iff_they_commute' depends on axioms: [propext]
'SPHYS.Gluon.a_mass_is_changed_by_a_change_of_gauge' depends on axioms: [propext, Quot.sound]
'SPHYS.Gluon.the_gluon' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Gluon.every_model_of_the_carriers_is_an_instance' depends on axioms: [propext, Classical.choice, Quot.sound]
```

## Appendix C · Provenance Trail

The frame, the reading and the special cases of this paper are on the public record before it. The table lists each step at the grade its own record carries, with the address where that record can be read. The theorems of this paper, in the generality of Appendix A, are in the last row and in no earlier one. A row marked frame or reading states no theorem of this paper; a row marked special case proves or checks the subject on one model; a row marked kernel, structural carries Lean theorems on printed models; a row marked theorem on premises carries a law forced from named premises. The third column gives, for each row, the term of that record which is the precursor, and why the row is on the trail.

**Table C.1 · The grade ladder of the gluon line, 2026**

| Date | Grade | Precursor term, and why it is on the trail | Record | Address |
|---|---|---|---|---|
| 24 Mar | Frame, first anchor | **three orthogonal Ductions converging on one point.** The frame of the series: a point fixed by three independent axes, with the witness outside them | *Trisduction, A Geometric Epistemology of Absolute Convergence* | <https://trisduction.blogspot.com/2026/03/trisduction-geometric-epistemology-of.html> |
| 19 Jul | Reading | **the four forces and matter as configurations of one substrate.** The forces and the particles read as one kind of thing, in prose | *The Four Forces, Matter, and the Dark Sector as Configurations of One Actuating Substrate* | <https://doi.org/10.5281/zenodo.21438933> |
| 27 Sep | Special case | **the proton is the lock; three colours, one singlet.** The antisymmetric reading of three colours, checked on three by enumeration | *The Proton Is the Lock* | <https://doi.org/10.5281/zenodo.22986559> |
| 25 Nov | Theorem on premises | **a charge that does not commute.** The equations of the nuclear forces forced; eight and three carriers; three the least with a phase | *The Nuclear Forces as a New Mathematical Theorem* | <https://doi.org/10.5281/zenodo.24524874> |
| 26 Nov | Theorem | **the carriers carry the charge they carry.** For any number of kinds: the count, the commutator in any ring, no mass under a kept gauge | *This paper, edition 1.0.0: the gluon for any number of kinds* | `not yet deposited` |

Dates are Zenodo publication dates where a DOI is given and the date printed on its page for the row of 24 March. The Lean files of the rows of 25 November were compiled again for this paper on Lean 4.19.0, from the copies in the repository 1000sapients/Trisduction, branch main, and compiled without error. The terms of the rows of 19 July and 27 September are taken from the titles of their records. This paper has no address until it is deposited.
