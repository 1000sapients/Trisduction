# Magnetism as a New Mathematical Theorem

## The Odd Branch of the Field Under the Reversal of Time, on Any Commutative Ring, with No Work, No Source from a Potential, and Equal Number with the Electric Part Exactly in Four Dimensions

**Mohammad F. Islam PhD** · 26 November 2026

## Abstract

This paper proves, in Lean 4 with Mathlib, what is forced about magnetism once a field is given two parts and a reversal of time that keeps the first and reverses the second. The statements hold on any commutative ring; where a statement needs it, the ring is asked to have no element of additive order two, and nothing else. A field is kept by the reversal of time exactly when it has no magnetic part. A field with a magnetic part and its reversal are two fields on one energy, and no reading through the energy tells them apart. The force on a moving charge is the same when the motion and the field are both reversed, so the law of motion survives the magnet; without reversing the field the two forces differ by the magnetic term and by nothing else. The magnetic force does no work, for every velocity and every field. A magnetic part that comes from a potential has no source, for every wave vector and every potential, and it is kept by a change of gauge. The exchange of charge, the reflection of space and the reversal of time together return every field. In $n$ dimensions of space and time the electric part has $n-1$ components and the magnetic part $(n-1)(n-2)/2$; the two are equal in number exactly when $n = 4$. A last theorem states subsumption: any model of a field with a reversal, on any type, carried one to one into this one with the reversals matched, is kept by its reversal exactly where its image has no magnetic part. The file has 29 theorems, declares no axiom and leaves no proof open. No strength of a field and no constant is derived.

## 1. The Theorem and What It Rests On

### 1.1 The statement

Let $R$ be a commutative ring. A field is a pair $(E, B)$ of triples over $R$. Three maps act on fields: $T(E,B) = (E,-B)$, $P(E,B) = (-E,B)$ and $C(E,B) = (-E,-B)$. The line of a map is the set of fields it leaves in place. The binding theorem of the file, `magnetism`, states for every such ring with no element of additive order two: (i) a field is on the line of $T$ exactly when $B = 0$; (ii) if $B \neq 0$ then $T f \neq f$ and the energy $E\cdot E + B\cdot B$ of $Tf$ is that of $f$; (iii) the force $q\,(E + v \times B)$ is unchanged when $v$ goes to $-v$ and $f$ to $Tf$; (iv) $v \cdot (v \times B) = 0$; (v) $k \cdot (k \times a) = 0$; (vi) $T P C f = f$; (vii) for integers $n \geq 2$, $2(n-1) = (n-1)(n-2)$ exactly when $n = 4$.

### 1.2 What is proved, what is cited, what is assumed

Proved in Appendix A, and checked by the kernel of Lean 4 [8] with the Mathlib library [7]: every statement of Section 1.1 and of Sections 2 to 7. Assumed: that a field has an electric and a magnetic part and that the reversal of time acts as $T$. This is the classical assignment [3]; the paper does not derive it. Cited and not formalised: the equations of the field themselves [1], which are forced from the conservation of charge in a companion paper [9] and are not repeated here; the force law in its original form [2]; and the count of components of an antisymmetric array, which is written out in Section 6. Measured and not derived: every strength of a field and every constant.

### 1.3 What magnetism means here

Magnetism means the part of the field that the reversal of time reverses. Nothing else is meant by the word in the statements of this paper. The definition is not a claim about any material; ferromagnets are the subject of the next paper of this series.

## 2. Magnetism Is the Part Time Reverses

The three maps are involutions (`the_three_folds_are_involutions`) and their composition is the identity (`the_three_folds_together_return_the_field`). The first theorem of the subject is `kept_by_time_iff_no_magnetic_part`: $Tf = f$ exactly when $B = 0$. One direction needs the ring to have no element of additive order two, since $-B = B$ gives $B + B = 0$. The mirror statement, `kept_by_space_iff_no_electric_part`, is that $Pf = f$ exactly when $E = 0$. The electric part is the line of time; the magnetic part is the line of space.

## 3. Two Fields on One Energy

The energy is kept by $T$, $P$, $C$ and by the duality turn $D(E,B) = (B,-E)$ (`the_energy_is_kept_by_every_fold`). So a field with a magnetic part and its reversal in time are two fields with one energy (`a_magnet_and_its_reversal_are_two_on_one_energy`), and no function of the energy separates them (`no_reading_of_the_energy_tells_the_sign`). The flow of energy $E \times B$ is reversed by time and by space and kept by the exchange of charge (`the_flow_is_reversed_by_time`). The product $E \cdot B$ is reversed by time and by space (`the_twist_is_reversed_by_time_and_by_space`). The duality turn done twice is the exchange of charge and done four times is the identity (`the_duality_turn_has_period_four`); it reverses the balance $E\cdot E - B \cdot B$ (`the_duality_turn_reverses_the_balance`). The duality turn is due to Rainich [5].

## 4. The Force

The force on a charge $q$ at velocity $v$ is $q\,(E + v \times B)$. The theorem `the_force_is_kept_when_time_is_reversed` states that the force at $-v$ in the field $Tf$ equals the force at $v$ in $f$. A film of a charge in a magnetic field, run backwards, shows a lawful motion provided the magnet is reversed too. If the magnet is not reversed, the difference of the two forces is twice the magnetic term, reversed (`the_magnetic_term_is_what_time_reversal_sees`). The magnetic force is at right angles to the velocity (`the_magnetic_force_does_no_work`) and to the field (`the_magnetic_force_is_across_the_field`), and the work done on a charge is done by the electric part alone (`the_work_is_electric`). These are identities of any commutative ring; no ordering and no size of a number is used.

## 5. The Source

A wave of wave vector $k$ and potential $a$ has magnetic part $k \times a$. Its source is $k \cdot (k \times a)$, and this is zero for every $k$ and every $a$ (`a_magnetic_part_from_a_potential_has_no_source`). A change of the potential along $k$ changes no magnetic part (`the_magnetic_part_is_kept_by_a_change_of_gauge`). A magnetic charge would be a reading that the reversal of time reverses; by the general theorem of the seat, every such reading is zero on every field that time keeps (`a_magnetic_charge_is_zero_where_time_is_kept`).

## 6. The Count

In $n$ dimensions of space and time the field is an antisymmetric array with $n(n-1)/2$ entries. Those with one index in time are the electric part, $n-1$ of them; the rest, $(n-1)(n-2)/2$, are the magnetic part. The theorem `electric_and_magnetic_are_equal_in_number_exactly_in_four` states that the two counts are equal exactly when $n = 4$, for $n \geq 2$. In three dimensions the magnetic part is one number and in two there is none (`the_magnetic_part_in_low_dimensions`). The duality turn of Section 3 needs the two parts to be equal in number, so it exists only in four.

## 7. What Is Subsumed and What Is Not

Part 0 of the file states the seat on any type: a map and the points it leaves in place. A reading the map reverses is zero on the line (`an_odd_reading_is_zero_on_the_line`), and where it is not zero the point is off the line and the reading tells it from its partner (`an_odd_reading_off_zero_tells_the_pair`). The theorem `every_model_is_an_instance` carries the line of any model onto the line of the seat along any one-to-one map that matches the maps, and `every_reading_of_the_seat_is_a_reading_of_the_model` carries the readings. The theorem `every_model_of_magnetism_is_an_instance` applies this to the field: a model of magnetism written on spinors, on blocks of a matrix, on a lattice or on a type not yet written, once it is carried into $(E,B)$ with the reversals matched, has no further freedom in where its reversal acts trivially. The two-by-two blocks of the earlier record of this trail are one such model.

Not subsumed: the equations of the field, which are a statement about derivatives and are forced elsewhere [9]; the magnetism of materials; and any model whose reversal of time does not reverse the magnetic part.

## 8. The File, Theorem by Theorem

| Theorem | Axioms its proof uses |
|---|---|
| `a_kept_reading_is_one_on_the_pair` | no axiom |
| `an_odd_reading_is_zero_on_the_line` | propext |
| `an_odd_reading_off_zero_tells_the_pair` | propext |
| `every_model_is_an_instance` | no axiom |
| `every_reading_of_the_seat_is_a_reading_of_the_model` | no axiom |
| `neg_neg3` | propext |
| `the_three_folds_are_involutions` | propext |
| `the_three_folds_together_return_the_field` | propext |
| `kept_by_time_iff_no_magnetic_part` | propext, Quot.sound |
| `kept_by_space_iff_no_electric_part` | propext, Quot.sound |
| `the_energy_is_kept_by_every_fold` | propext |
| `the_flow_is_reversed_by_time` | propext, Quot.sound |
| `the_twist_is_reversed_by_time_and_by_space` | propext, Quot.sound |
| `a_magnet_and_its_reversal_are_two_on_one_energy` | propext, Quot.sound |
| `no_reading_of_the_energy_tells_the_sign` | propext |
| `the_duality_turn_has_period_four` | propext |
| `the_duality_turn_reverses_the_balance` | propext, Quot.sound |
| `the_force_is_kept_when_time_is_reversed` | propext |
| `the_magnetic_term_is_what_time_reversal_sees` | propext, Quot.sound |
| `the_magnetic_force_does_no_work` | propext, Quot.sound |
| `the_work_is_electric` | propext, Quot.sound |
| `the_magnetic_force_is_across_the_field` | propext, Quot.sound |
| `a_magnetic_part_from_a_potential_has_no_source` | propext, Quot.sound |
| `the_magnetic_part_is_kept_by_a_change_of_gauge` | propext, Quot.sound |
| `a_magnetic_charge_is_zero_where_time_is_kept` | propext |
| `electric_and_magnetic_are_equal_in_number_exactly_in_four` | propext,  Classical.choice,  Quot.sound |
| `the_magnetic_part_in_low_dimensions` | propext |
| `magnetism` | propext, Classical.choice, Quot.sound |
| `every_model_of_magnetism_is_an_instance` | propext, Quot.sound |

## 9. Discussion: The Reading

The following is a reading and is carried at the grade of a premise. On the seat of this series a map and its line are the two things given, and a point off the line is one of a pair that a kept reading cannot separate. Read on the field, the reversal of time is the map, the electric fields are the line and a magnet is a point off it. The energy is a kept reading, so the energy does not say which way a magnet points. The sign of the magnetic part is the one item of the record that the reversal moves. Nothing in Sections 2 to 7 depends on this paragraph.

## 10. Predictions, Falsifiers, and What Stands

### 10.1 Two predictions that will stand

First: no magnetic charge is found in a field that comes from one potential. Searches have found none [6]. Second: a charge in a magnetic field alone keeps its speed, whatever the field.

### 10.2 The two falsifiers

First: the observation of an isolated magnetic charge. The theorem of Section 5 would stand, since it is an identity; what would fall is the assumption that the magnetic part of nature comes from one potential everywhere, and with it the use of this paper for that field. The quantisation argument of Dirac [4] describes what such a charge would require. Second: a system governed by the field alone whose motion, filmed and run backwards with every magnetic part reversed, is not a lawful motion. That would break the assumption of Section 1.2 that the reversal of time acts as $T$.

### 10.3 What kind of result this is

The theorems are identities and equivalences on a stated structure. They do not say that nature has a field of this kind; they say what follows for every field of this kind. The measured content of magnetism, the strengths and the constants, is outside the paper.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file is written by a language model under the author's direct supervision. Every theorem named in the text is in Appendix A under that name, and its kernel line is printed in Appendix B. Classical results and measurements that are cited and not formalised are named as such where they are used. No constant of nature is derived anywhere in this paper: no mass, no strength of a coupling and no angle of a mixing is a theorem here, and where a measured value is quoted it is quoted from its source.

**The seat.** The seat is elementary: a set and a map of the set to itself, with the points the map leaves in place called its line. In the plane it is a reflection and the line it fixes, studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1. J. C. Maxwell, Philos. Trans. R. Soc. 155 (1865) 459.
2. H. A. Lorentz, Versuch einer Theorie der electrischen und optischen Erscheinungen in bewegten Körpern (Brill, Leiden, 1895).
3. E. Wigner, Nachr. Ges. Wiss. Göttingen, Math.-Phys. Kl. (1932) 546.
4. P. A. M. Dirac, Proc. R. Soc. A 133 (1931) 60.
5. G. Y. Rainich, Trans. Am. Math. Soc. 27 (1925) 106.
6. B. Acharya et al. (MoEDAL Collaboration), Nature 602 (2022) 63.
7. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
8. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
9. M. F. Islam, Light as a New Mathematical Theorem (2026).
10. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its file uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main.

11. The law of light, forced: Publication Library/Mathematics/Mathematical Physics/Light/SPHYS_Maxwell_Forced_CC.lean. Compiled with Mathlib 4.19.0, exit 0.
12. The seat: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_46_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.

## Appendix A · SPHYS_Magnetism_Theorem_CC.lean

Lean 4.19.0 with Mathlib 4.19.0. 29 theorems, no axiom declared, no `sorry`, exit 0 with no warning. Every cone is pinned at the end of the file, so the build is silent. The kernel lines are Appendix B.

```lean
/-
SPHYS_Magnetism_Theorem_CC.lean · Magnetism as a New Mathematical Theorem. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. Magnetism is stated on any commutative ring and any field of three components with any reversal that keeps the
  electric part and reverses the magnetic part. Nothing is assumed of the ring but, where stated, that it has no element of
  additive order two. DESIGN. Part 0 the seat on any type. Part I the three folds of the field. Part II the readings.
  Part III the force. Part IV the source. Part V the count in n dimensions. Part VI the binding theorem.
RISK. A reader may take the kernel for Maxwell's equations; it is not. The law is forced in SPHYS_Maxwell_Forced_CC.lean.
NON-NEGOTIABLE. No axiom is declared. No proof is left open. No headline theorem takes its conclusion as a field of a structure.
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

namespace SPHYS.Magnetism

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

/-! ## Part I. The field and its three folds, on any commutative ring. -/

/-- Three components over a ring. -/
@[ext] structure V3 (R : Type*) where
  x : R
  y : R
  z : R

variable {R : Type*} [CommRing R]

def V3.neg (a : V3 R) : V3 R := ⟨-a.x, -a.y, -a.z⟩
def V3.add (a b : V3 R) : V3 R := ⟨a.x + b.x, a.y + b.y, a.z + b.z⟩
def V3.smul (c : R) (a : V3 R) : V3 R := ⟨c * a.x, c * a.y, c * a.z⟩
def V3.dot (a b : V3 R) : R := a.x * b.x + a.y * b.y + a.z * b.z
def V3.cross (a b : V3 R) : V3 R := ⟨a.y * b.z - a.z * b.y, a.z * b.x - a.x * b.z, a.x * b.y - a.y * b.x⟩
def V3.zero : V3 R := ⟨0, 0, 0⟩

/-- A field: an electric part and a magnetic part. -/
@[ext] structure EM (R : Type*) where
  E : V3 R
  B : V3 R

/-- The reversal of time keeps the electric part and reverses the magnetic part. -/
def EM.T (f : EM R) : EM R := ⟨f.E, f.B.neg⟩
/-- The reflection of space reverses the electric part and keeps the magnetic part. -/
def EM.P (f : EM R) : EM R := ⟨f.E.neg, f.B⟩
/-- The exchange of charge reverses both. -/
def EM.C (f : EM R) : EM R := ⟨f.E.neg, f.B.neg⟩
/-- The duality turn: the electric part goes to the magnetic, the magnetic to minus the electric. -/
def EM.D (f : EM R) : EM R := ⟨f.B, f.E.neg⟩

theorem neg_neg3 (a : V3 R) : a.neg.neg = a := by ext <;> simp [V3.neg]

theorem the_three_folds_are_involutions (f : EM R) : f.T.T = f ∧ f.P.P = f ∧ f.C.C = f := by
  refine ⟨?_, ?_, ?_⟩ <;> ext <;> simp [EM.T, EM.P, EM.C, V3.neg]

/-- The three folds together are the identity. -/
theorem the_three_folds_together_return_the_field (f : EM R) : f.C.P.T = f := by
  ext <;> simp [EM.T, EM.P, EM.C, V3.neg]

/-- MAGNETISM IS THE PART TIME REVERSES. A field is kept by the reversal of time exactly when it has no magnetic part. -/
theorem kept_by_time_iff_no_magnetic_part (h2 : ∀ v : R, v + v = 0 → v = 0) (f : EM R) :
    OnLine EM.T f ↔ f.B = V3.zero := by
  constructor
  · intro h
    have hB : f.B.neg = f.B := congrArg EM.B h
    have hx := congrArg V3.x hB; have hy := congrArg V3.y hB; have hz := congrArg V3.z hB
    simp only [V3.neg] at hx hy hz
    ext
    · exact h2 _ (by linear_combination -hx)
    · exact h2 _ (by linear_combination -hy)
    · exact h2 _ (by linear_combination -hz)
  · intro h; show f.T = f; ext <;> simp [EM.T, V3.neg, h, V3.zero]

/-- A field is kept by the reflection of space exactly when it has no electric part. -/
theorem kept_by_space_iff_no_electric_part (h2 : ∀ v : R, v + v = 0 → v = 0) (f : EM R) :
    OnLine EM.P f ↔ f.E = V3.zero := by
  constructor
  · intro h
    have hE : f.E.neg = f.E := congrArg EM.E h
    have hx := congrArg V3.x hE; have hy := congrArg V3.y hE; have hz := congrArg V3.z hE
    simp only [V3.neg] at hx hy hz
    ext
    · exact h2 _ (by linear_combination -hx)
    · exact h2 _ (by linear_combination -hy)
    · exact h2 _ (by linear_combination -hz)
  · intro h; show f.P = f; ext <;> simp [EM.P, V3.neg, h, V3.zero]

/-! ## Part II. The readings. -/

def EM.energy (f : EM R) : R := f.E.dot f.E + f.B.dot f.B
def EM.flow (f : EM R) : V3 R := f.E.cross f.B
/-- The pseudoscalar: the electric part against the magnetic part. -/
def EM.twist (f : EM R) : R := f.E.dot f.B
def EM.balance (f : EM R) : R := f.E.dot f.E - f.B.dot f.B

/-- The energy is kept by every fold and by the duality turn. -/
theorem the_energy_is_kept_by_every_fold (f : EM R) :
    f.T.energy = f.energy ∧ f.P.energy = f.energy ∧ f.C.energy = f.energy ∧ f.D.energy = f.energy := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;> (simp [EM.energy, EM.T, EM.P, EM.C, EM.D, V3.dot, V3.neg]; try ring)

/-- The flow of energy is reversed by time and by space, and kept by the exchange of charge. -/
theorem the_flow_is_reversed_by_time (f : EM R) :
    f.T.flow = f.flow.neg ∧ f.P.flow = f.flow.neg ∧ f.C.flow = f.flow := by
  refine ⟨?_, ?_, ?_⟩ <;> ext <;> simp [EM.flow, EM.T, EM.P, EM.C, V3.cross, V3.neg] <;> ring

/-- The twist is reversed by time and by space. -/
theorem the_twist_is_reversed_by_time_and_by_space (f : EM R) :
    f.T.twist = - f.twist ∧ f.P.twist = - f.twist ∧ f.C.twist = f.twist := by
  refine ⟨?_, ?_, ?_⟩ <;> simp [EM.twist, EM.T, EM.P, EM.C, V3.dot, V3.neg] <;> ring

/-- A magnet and its reversal in time are two fields on one energy: the energy does not carry the sign. -/
theorem a_magnet_and_its_reversal_are_two_on_one_energy (h2 : ∀ v : R, v + v = 0 → v = 0) (f : EM R)
    (hB : f.B ≠ V3.zero) : f.T ≠ f ∧ f.T.energy = f.energy :=
  ⟨fun h => hB ((kept_by_time_iff_no_magnetic_part h2 f).1 h), (the_energy_is_kept_by_every_fold f).1⟩

/-- No reading through the energy tells a magnet from its reversal. -/
theorem no_reading_of_the_energy_tells_the_sign {W : Type*} (g : R → W) (f : EM R) :
    g f.T.energy = g f.energy := by rw [(the_energy_is_kept_by_every_fold f).1]

/-- The duality turn done twice is the exchange of charge, and done four times it returns the field. -/
theorem the_duality_turn_has_period_four (f : EM R) : f.D.D = f.C ∧ f.D.D.D.D = f := by
  refine ⟨?_, ?_⟩ <;> ext <;> simp [EM.D, EM.C, V3.neg]

/-- The duality turn reverses the balance and the twist. -/
theorem the_duality_turn_reverses_the_balance (f : EM R) : f.D.balance = - f.balance ∧ f.D.twist = - f.twist := by
  refine ⟨?_, ?_⟩ <;> (simp [EM.balance, EM.twist, EM.D, V3.dot, V3.neg]; try ring)

/-! ## Part III. The force on a moving charge. -/

/-- The force on a charge `q` moving at `v`: the electric part, and the velocity across the magnetic part. -/
def force (q : R) (v : V3 R) (f : EM R) : V3 R := V3.smul q (f.E.add (v.cross f.B))

/-- THE LAW OF MOTION SURVIVES THE MAGNET. With the velocity reversed and the field reversed in time, the force is the same. -/
theorem the_force_is_kept_when_time_is_reversed (q : R) (v : V3 R) (f : EM R) : force q v.neg f.T = force q v f := by
  ext <;> simp [force, EM.T, V3.smul, V3.add, V3.cross, V3.neg]

/-- Without reversing the field, the reversed motion feels a different force exactly by the magnetic term. -/
theorem the_magnetic_term_is_what_time_reversal_sees (q : R) (v : V3 R) (f : EM R) :
    (force q v.neg f).add (force q v f).neg = V3.smul q ((v.cross f.B).add (v.cross f.B)).neg := by
  ext <;> simp [force, V3.smul, V3.add, V3.cross, V3.neg] <;> ring

/-- THE MAGNETIC FORCE DOES NO WORK. -/
theorem the_magnetic_force_does_no_work (v b : V3 R) : v.dot (v.cross b) = 0 := by
  simp [V3.dot, V3.cross]; ring

/-- The work done on a charge is done by the electric part alone. -/
theorem the_work_is_electric (q : R) (v : V3 R) (f : EM R) : v.dot (force q v f) = q * v.dot f.E := by
  simp [force, V3.dot, V3.smul, V3.add, V3.cross]; ring

/-- The magnetic force is across the magnetic part as well. -/
theorem the_magnetic_force_is_across_the_field (v b : V3 R) : b.dot (v.cross b) = 0 := by
  simp [V3.dot, V3.cross]; ring

/-! ## Part IV. The source. A wave of wave vector `k` and potential `a` has magnetic part `k` across `a`. -/

/-- NO MAGNETIC CHARGE. A magnetic part that comes from a potential has no source, for every wave vector and every potential. -/
theorem a_magnetic_part_from_a_potential_has_no_source (k a : V3 R) : k.dot (k.cross a) = 0 := by
  simp [V3.dot, V3.cross]; ring

/-- A change of the potential along the wave vector changes no magnetic part. -/
theorem the_magnetic_part_is_kept_by_a_change_of_gauge (k a : V3 R) (c : R) :
    k.cross (a.add (V3.smul c k)) = k.cross a := by
  ext <;> simp [V3.cross, V3.add, V3.smul] <;> ring

/-- A magnetic source would be reversed by time and by space together with the field: a magnetic charge is an odd reading,
and it is zero on every field that time keeps. -/
theorem a_magnetic_charge_is_zero_where_time_is_kept (h2 : ∀ v : R, v + v = 0 → v = 0)
    (g : EM R → R) (hodd : ∀ f, g f.T = - g f) (f : EM R) (hf : OnLine EM.T f) : g f = 0 :=
  an_odd_reading_is_zero_on_the_line h2 EM.T g hodd f hf

/-! ## Part V. The count, in any number of dimensions. In `n` dimensions of space and time the electric part has
`n - 1` components and the magnetic part has `(n - 1)(n - 2) / 2`. -/

/-- The two parts are equal in number exactly in four dimensions. -/
theorem electric_and_magnetic_are_equal_in_number_exactly_in_four (n : ℤ) (hn : 2 ≤ n) :
    2 * (n - 1) = (n - 1) * (n - 2) ↔ n = 4 := by
  constructor
  · intro h
    have h1 : (n - 1) * (n - 4) = 0 := by linear_combination -h
    rcases mul_eq_zero.1 h1 with h | h
    · omega
    · omega
  · rintro rfl; norm_num

/-- In three dimensions of space and time the magnetic part is one number, and in two there is none. -/
theorem the_magnetic_part_in_low_dimensions : ((3:ℤ) - 1) * (3 - 2) = 2 * 1 ∧ ((2:ℤ) - 1) * (2 - 2) = 0 := by
  constructor <;> norm_num

/-! ## Part VI. The binding theorem. -/

/-- MAGNETISM, ON ANY COMMUTATIVE RING WITH NO ELEMENT OF ORDER TWO. -/
theorem magnetism (h2 : ∀ v : R, v + v = 0 → v = 0) :
    (∀ f : EM R, OnLine EM.T f ↔ f.B = V3.zero)
    ∧ (∀ f : EM R, f.B ≠ V3.zero → f.T ≠ f ∧ f.T.energy = f.energy)
    ∧ (∀ (q : R) (v : V3 R) (f : EM R), force q v.neg f.T = force q v f)
    ∧ (∀ v b : V3 R, v.dot (v.cross b) = 0)
    ∧ (∀ k a : V3 R, k.dot (k.cross a) = 0)
    ∧ (∀ f : EM R, f.C.P.T = f)
    ∧ (∀ n : ℤ, 2 ≤ n → (2 * (n - 1) = (n - 1) * (n - 2) ↔ n = 4)) :=
  ⟨kept_by_time_iff_no_magnetic_part h2, a_magnet_and_its_reversal_are_two_on_one_energy h2,
   the_force_is_kept_when_time_is_reversed, the_magnetic_force_does_no_work,
   a_magnetic_part_from_a_potential_has_no_source, the_three_folds_together_return_the_field,
   electric_and_magnetic_are_equal_in_number_exactly_in_four⟩

/-- SUBSUMPTION. Any model of a field, on any type, with any reversal, that is carried one to one into this one with the
reversals matched, is kept by its reversal exactly where its image has no magnetic part. -/
theorem every_model_of_magnetism_is_an_instance {Y : Type*} (h2 : ∀ v : R, v + v = 0 → v = 0) (τ : Y → Y) (φ : Y → EM R)
    (hφ : Function.Injective φ) (heq : ∀ y, φ (τ y) = (φ y).T) (y : Y) :
    OnLine τ y ↔ (φ y).B = V3.zero :=
  (every_model_is_an_instance EM.T τ φ hφ heq y).trans (kept_by_time_iff_no_magnetic_part h2 (φ y))

end SPHYS.Magnetism

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.Magnetism.a_kept_reading_is_one_on_the_pair' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Magnetism.a_kept_reading_is_one_on_the_pair
/-- info: 'SPHYS.Magnetism.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Magnetism.an_odd_reading_is_zero_on_the_line
/-- info: 'SPHYS.Magnetism.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Magnetism.an_odd_reading_off_zero_tells_the_pair
/-- info: 'SPHYS.Magnetism.every_model_is_an_instance' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Magnetism.every_model_is_an_instance
/-- info: 'SPHYS.Magnetism.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Magnetism.every_reading_of_the_seat_is_a_reading_of_the_model
/-- info: 'SPHYS.Magnetism.neg_neg3' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Magnetism.neg_neg3
/-- info: 'SPHYS.Magnetism.the_three_folds_are_involutions' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_three_folds_are_involutions
/-- info: 'SPHYS.Magnetism.the_three_folds_together_return_the_field' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_three_folds_together_return_the_field
/-- info: 'SPHYS.Magnetism.kept_by_time_iff_no_magnetic_part' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.kept_by_time_iff_no_magnetic_part
/-- info: 'SPHYS.Magnetism.kept_by_space_iff_no_electric_part' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.kept_by_space_iff_no_electric_part
/-- info: 'SPHYS.Magnetism.the_energy_is_kept_by_every_fold' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_energy_is_kept_by_every_fold
/-- info: 'SPHYS.Magnetism.the_flow_is_reversed_by_time' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_flow_is_reversed_by_time
/-- info: 'SPHYS.Magnetism.the_twist_is_reversed_by_time_and_by_space' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_twist_is_reversed_by_time_and_by_space
/-- info: 'SPHYS.Magnetism.a_magnet_and_its_reversal_are_two_on_one_energy' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.a_magnet_and_its_reversal_are_two_on_one_energy
/-- info: 'SPHYS.Magnetism.no_reading_of_the_energy_tells_the_sign' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Magnetism.no_reading_of_the_energy_tells_the_sign
/-- info: 'SPHYS.Magnetism.the_duality_turn_has_period_four' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_duality_turn_has_period_four
/-- info: 'SPHYS.Magnetism.the_duality_turn_reverses_the_balance' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_duality_turn_reverses_the_balance
/-- info: 'SPHYS.Magnetism.the_force_is_kept_when_time_is_reversed' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_force_is_kept_when_time_is_reversed
/-- info: 'SPHYS.Magnetism.the_magnetic_term_is_what_time_reversal_sees' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_magnetic_term_is_what_time_reversal_sees
/-- info: 'SPHYS.Magnetism.the_magnetic_force_does_no_work' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_magnetic_force_does_no_work
/-- info: 'SPHYS.Magnetism.the_work_is_electric' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_work_is_electric
/-- info: 'SPHYS.Magnetism.the_magnetic_force_is_across_the_field' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_magnetic_force_is_across_the_field
/-- info: 'SPHYS.Magnetism.a_magnetic_part_from_a_potential_has_no_source' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.a_magnetic_part_from_a_potential_has_no_source
/-- info: 'SPHYS.Magnetism.the_magnetic_part_is_kept_by_a_change_of_gauge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_magnetic_part_is_kept_by_a_change_of_gauge
/-- info: 'SPHYS.Magnetism.a_magnetic_charge_is_zero_where_time_is_kept' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Magnetism.a_magnetic_charge_is_zero_where_time_is_kept
/--
info: 'SPHYS.Magnetism.electric_and_magnetic_are_equal_in_number_exactly_in_four' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Magnetism.electric_and_magnetic_are_equal_in_number_exactly_in_four
/-- info: 'SPHYS.Magnetism.the_magnetic_part_in_low_dimensions' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Magnetism.the_magnetic_part_in_low_dimensions
/-- info: 'SPHYS.Magnetism.magnetism' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.magnetism
/-- info: 'SPHYS.Magnetism.every_model_of_magnetism_is_an_instance' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Magnetism.every_model_of_magnetism_is_an_instance
```

## Appendix B · Kernel lines of Appendix A

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

```text
'SPHYS.Magnetism.a_kept_reading_is_one_on_the_pair' does not depend on any axioms
'SPHYS.Magnetism.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext]
'SPHYS.Magnetism.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext]
'SPHYS.Magnetism.every_model_is_an_instance' does not depend on any axioms
'SPHYS.Magnetism.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms
'SPHYS.Magnetism.neg_neg3' depends on axioms: [propext]
'SPHYS.Magnetism.the_three_folds_are_involutions' depends on axioms: [propext]
'SPHYS.Magnetism.the_three_folds_together_return_the_field' depends on axioms: [propext]
'SPHYS.Magnetism.kept_by_time_iff_no_magnetic_part' depends on axioms: [propext, Quot.sound]
'SPHYS.Magnetism.kept_by_space_iff_no_electric_part' depends on axioms: [propext, Quot.sound]
'SPHYS.Magnetism.the_energy_is_kept_by_every_fold' depends on axioms: [propext]
'SPHYS.Magnetism.the_flow_is_reversed_by_time' depends on axioms: [propext, Quot.sound]
'SPHYS.Magnetism.the_twist_is_reversed_by_time_and_by_space' depends on axioms: [propext, Quot.sound]
'SPHYS.Magnetism.a_magnet_and_its_reversal_are_two_on_one_energy' depends on axioms: [propext, Quot.sound]
'SPHYS.Magnetism.no_reading_of_the_energy_tells_the_sign' depends on axioms: [propext]
'SPHYS.Magnetism.the_duality_turn_has_period_four' depends on axioms: [propext]
'SPHYS.Magnetism.the_duality_turn_reverses_the_balance' depends on axioms: [propext, Quot.sound]
'SPHYS.Magnetism.the_force_is_kept_when_time_is_reversed' depends on axioms: [propext]
'SPHYS.Magnetism.the_magnetic_term_is_what_time_reversal_sees' depends on axioms: [propext, Quot.sound]
'SPHYS.Magnetism.the_magnetic_force_does_no_work' depends on axioms: [propext, Quot.sound]
'SPHYS.Magnetism.the_work_is_electric' depends on axioms: [propext, Quot.sound]
'SPHYS.Magnetism.the_magnetic_force_is_across_the_field' depends on axioms: [propext, Quot.sound]
'SPHYS.Magnetism.a_magnetic_part_from_a_potential_has_no_source' depends on axioms: [propext, Quot.sound]
'SPHYS.Magnetism.the_magnetic_part_is_kept_by_a_change_of_gauge' depends on axioms: [propext, Quot.sound]
'SPHYS.Magnetism.a_magnetic_charge_is_zero_where_time_is_kept' depends on axioms: [propext]
'SPHYS.Magnetism.electric_and_magnetic_are_equal_in_number_exactly_in_four' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'SPHYS.Magnetism.the_magnetic_part_in_low_dimensions' depends on axioms: [propext]
'SPHYS.Magnetism.magnetism' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Magnetism.every_model_of_magnetism_is_an_instance' depends on axioms: [propext, Quot.sound]
```

## Appendix C · Provenance Trail

The frame, the reading and the special cases of this paper are on the public record before it. The table lists each step at the grade its own record carries, with the address where that record can be read. The theorems of this paper, in the generality of Appendix A, are in the last row and in no earlier one. A row marked frame or reading states no theorem of this paper; a row marked special case proves or checks the subject on one model; a row marked kernel, structural carries Lean theorems on printed models; a row marked theorem on premises carries a law forced from named premises. The third column gives, for each row, the term of that record which is the precursor, and why the row is on the trail.

**Table C.1 · The grade ladder of the magnetism line, 2026**

| Date | Grade | Precursor term, and why it is on the trail | Record | Address |
|---|---|---|---|---|
| 24 Mar | Frame, first anchor | **three orthogonal Ductions converging on one point.** The frame of the series: a point fixed by three independent axes, with the witness outside them | *Trisduction, A Geometric Epistemology of Absolute Convergence* | <https://trisduction.blogspot.com/2026/03/trisduction-geometric-epistemology-of.html> |
| 19 Jul | Reading | **the four forces and matter as configurations of one substrate.** The forces and the particles read as one kind of thing, in prose | *The Four Forces, Matter, and the Dark Sector as Configurations of One Actuating Substrate* | <https://doi.org/10.5281/zenodo.21438933> |
| 27 Sep | Special case | **time reversal broken by a magnetic term.** The magnetic term as what the reversal of time moves, on two-by-two blocks | *The Magnet Is the Witness of the Pair Correlation* | <https://doi.org/10.5281/zenodo.22986561> |
| 22 Oct | Kernel, structural | **the drafts of the physical series, with their Lean files.** Electromagnetism on the seat, with a Lean file: the electric field as the fixed set, the magnetic sign as the item moved | *Draft papers of the physical series, with a Lean file each, at* `protocols/PhysOS/Draft Papers/` | <https://github.com/1000sapients/Trisduction/commit/ca67284> |
| 25 Nov | Theorem on premises | **the equations of light forced.** The law of light forced by the conservation of charge; two helicities; the inverse square | *Light as a New Mathematical Theorem* | <https://doi.org/10.5281/zenodo.24519032> |
| 25 Nov | Reading | **magnetism and gravity as two branches of one arrow.** Magnetism read as the branch the reversal of time moves, in prose with a kernel | *The Arrow Has Two Branches* | <https://doi.org/10.5281/zenodo.24528554> |
| 26 Nov | Theorem | **magnetism is the part time reverses.** On any commutative ring: the line of time, the force, the source, the count, and subsumption of every model | *This paper, edition 1.0.0: magnetism on any commutative ring* | `not yet deposited` |

Dates are Zenodo publication dates where a DOI is given and the date printed on its page for the row of 24 March. The date of the row of 22 October is the git commit date. The Lean files of the rows of 22 October and 25 November were compiled again for this paper on Lean 4.19.0, from the copies in the repository 1000sapients/Trisduction, branch main, and compiled without error. The terms of the rows of 19 July and 27 September and of the row of 25 November marked reading are taken from the titles of their records. This paper has no address until it is deposited.
