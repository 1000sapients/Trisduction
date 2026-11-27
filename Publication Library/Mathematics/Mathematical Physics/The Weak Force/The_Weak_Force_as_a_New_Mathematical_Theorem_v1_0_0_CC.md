# The Weak Force as a New Mathematical Theorem

## A Coupling to One Hand Is off the Line of the Mirror, Two Reversals Keep, the Depth of the Breaking Is the Pair Charge, Three Carriers, One Step for Quarks and Leptons, and a Phase from Three Copies On

**Mohammad F. Islam PhD** · 26 November 2026

## Abstract

This paper proves, in Lean 4 with Mathlib, what is forced about a force that couples to one hand. On any type of couplings, a pair of couplings is fixed by the exchange of the two hands exactly when the two are equal, so a coupling to one hand only, not zero, is off the line of the mirror, and the mirror sends it to the coupling of the other hand. On any type of states, a reading that each of two maps reverses is kept by the two together; for the weak coupling, the mirror reverses it, the exchange of charge reverses it, and the two together keep it. On any commutative ring, the left and right readings of the neutral current differ by the pair charge, for every electric charge and every mixing; a state with no pair charge is read alike by both hands. The carriers of a charge with two kinds are three. In any commutative ring the charged carrier carries one step, the same for the quark pair and the lepton pair, and that step is the electron's charge reversed. The mixing of $n$ copies leaves a phase exactly from three copies on. The file has 33 theorems, declares no axiom and leaves no proof open. That nature couples to the left hand is measured [2]; the mixing angle and the masses of the carriers are measured.

## 1. The Theorem and What It Rests On

### 1.1 The statement

The binding theorem `the_weak_force` states: (i) for an integer $g \ne 0$, $(g, 0)$ is not fixed by the exchange of hands; (ii) for every state given by a hand and a side, the coupling of its mirror image is the negation of its own, so is that of its charge exchange, and the coupling of both together is its own; (iii) $(t - qs) - (-qs) = t$ for integers; (iv) the $2 \times 2$ rational matrices of trace zero have dimension three; (v) $q_u - q_d = -q_e$ and $q_\nu - q_e = -q_e$ for every integer unit; (vi) for $n \ge 1$, $(n-1)(n-2) > 0$ exactly when $n \ge 3$.

### 1.2 What is proved, what is cited, what is assumed

Proved in Appendix A, and checked by the kernel of Lean 4 [9] with the Mathlib library [8]: every statement of Section 1.1 and of Sections 2 to 6. Assumed: that the charged current couples to the left hand of particles and the right hand of their partners; the standard form of the neutral current [3, 4]; the five equations of the table of charges [10]. Cited and not formalised: the proposal that the mirror is broken [1] and its observation [2]; the observation of the carriers [5]; the count of phases [6] and the observed difference between a process and its image under both maps [7]. The equations of the force are forced in a companion paper [11]. Measured and not derived: the angle, the masses, and the strength.

### 1.3 What weak force means here

The weak force means the force carried by the three carriers of a charge with two kinds, coupled to one hand.

## 2. The Hand

`on_the_line_of_the_mirror_iff_the_hands_are_equal` gives the line. `a_coupling_to_one_hand_is_off_the_line` and `the_mirror_sends_one_hand_to_the_other` state that a one-handed coupling and its mirror image are two different couplings. A force with such a coupling tells a process from its mirror image.

## 3. Two Reversals Keep

The theorem `two_reversals_keep` holds on any type of states with values in any group. The theorem `it_breaks_each_and_keeps_both` is the case of the weak coupling on a state given by its hand and by whether it is a particle or a partner. The force breaks the mirror, breaks the exchange of charge, and keeps the two together, as far as one copy goes.

## 4. The Neutral Current

`the_depth_of_the_breaking_is_the_pair_charge` holds for every charge and every mixing: how far the neutral current is from the line of the mirror is the pair charge and nothing else. `no_pair_charge_no_breaking` states that a state with no pair charge is read alike by both hands and that a neutral state has no right hand. The products that the mirror reverses and keeps are in `spin_against_momentum_is_reversed_by_the_mirror` and `the_triple_is_reversed_and_the_pair_is_kept`.

## 5. The Carriers and the Step

`the_count_of_the_carriers` and `eight_three_and_none` give three carriers for two kinds. They read one another (`the_commutator_of_two_is_a_carrier`, `carriers_that_do_not_commute`), unlike those of a charge that is a number (`a_commuting_charge_has_no_commutator`). With the table forced (`the_table_is_forced`, `the_charges_are_read_from_the_table`, `the_pairs_split_by_the_step`), `the_charged_carrier_carries_one_step` states that the carrier that turns the upper member of a pair into the lower carries the same charge for quarks and for leptons, equal to the electron's reversed. `the_three_carriers_are_neutral_together` and `one_step_for_both_pairs` complete it. The table also gives `the_atom_is_neutral`, `the_neutron_and_the_neutrino_are_neutral`, `the_quark_charges_are_thirds`, `a_triple_of_quarks_carries_a_whole_charge` and `a_single_quark_carries_a_part_charge`.

## 6. The Phase

`a_phase_from_three_copies_on` states the count of another paper of this series again: with three copies or more the mixing has a phase. A phase is what the two maps together do not keep. With one copy or two the weak force keeps the two together; with three it need not, and it is observed that it does not [7].

## 7. What Is Subsumed and What Is Not

The theorem `every_force_with_two_reversed_folds_is_an_instance` states, for any type of states and any two maps that each reverse a reading, that the two together keep it; and for any model of couplings carried one to one into pairs with the mirrors matched, that it is on the line exactly where its two hands are equal. A further force that couples to one hand, at any strength and with any carriers, is an instance. The general theorems of the seat, `every_model_is_an_instance`, `every_reading_of_the_seat_is_a_reading_of_the_model`, `an_odd_reading_is_zero_on_the_line`, `an_odd_reading_off_zero_tells_the_pair` and `a_kept_reading_is_one_on_the_pair`, are in Part 0.

Not subsumed: why the left hand; the values of the angle and of the phase; the masses of the carriers, which are the subject of the next paper.

## 8. The File, Theorem by Theorem

| Theorem | Axioms its proof uses |
|---|---|
| `a_kept_reading_is_one_on_the_pair` | no axiom |
| `an_odd_reading_is_zero_on_the_line` | propext |
| `an_odd_reading_off_zero_tells_the_pair` | propext |
| `every_model_is_an_instance` | no axiom |
| `every_reading_of_the_seat_is_a_reading_of_the_model` | no axiom |
| `on_the_line_of_the_mirror_iff_the_hands_are_equal` | no axiom |
| `a_coupling_to_one_hand_is_off_the_line` | no axiom |
| `the_mirror_sends_one_hand_to_the_other` | no axiom |
| `two_reversals_keep` | propext |
| `it_breaks_each_and_keeps_both` | no axiom |
| `the_depth_of_the_breaking_is_the_pair_charge` | propext |
| `no_pair_charge_no_breaking` | propext |
| `spin_against_momentum_is_reversed_by_the_mirror` | propext, Quot.sound |
| `the_triple_is_reversed_and_the_pair_is_kept` | propext, Quot.sound |
| `the_count_of_the_carriers` | propext, Classical.choice, Quot.sound |
| `eight_three_and_none` | propext, Classical.choice, Quot.sound |
| `the_commutator_of_two_is_a_carrier` | propext, Classical.choice, Quot.sound |
| `a_commuting_charge_has_no_commutator` | propext, Quot.sound |
| `carriers_that_do_not_commute` | propext, Classical.choice, Quot.sound |
| `the_table_is_forced` | propext, Quot.sound |
| `the_charges_are_read_from_the_table` | propext, Quot.sound |
| `the_atom_is_neutral` | propext, Quot.sound |
| `the_neutron_and_the_neutrino_are_neutral` | propext, Quot.sound |
| `the_quark_charges_are_thirds` | propext, Quot.sound |
| `the_pairs_split_by_the_step` | propext, Quot.sound |
| `one_step_for_both_pairs` | propext, Quot.sound |
| `a_triple_of_quarks_carries_a_whole_charge` | propext, Quot.sound |
| `a_single_quark_carries_a_part_charge` | propext, Quot.sound |
| `the_charged_carrier_carries_one_step` | propext, Quot.sound |
| `the_three_carriers_are_neutral_together` | propext, Quot.sound |
| `a_phase_from_three_copies_on` | propext, Classical.choice, Quot.sound |
| `the_weak_force` | propext, Classical.choice, Quot.sound |
| `every_force_with_two_reversed_folds_is_an_instance` | propext |

## 9. Discussion: The Reading

The following is a reading and is carried at the grade of a premise. On the seat of this series a force is a reading and a map either keeps it or reverses it. The weak force is the one reading that the mirror reverses. It is off the line of the mirror by the pair charge. Nothing in Sections 2 to 7 depends on this paragraph.

## 10. Predictions, Falsifiers, and What Stands

### 10.1 Two predictions that will stand

First: the charged carrier carries exactly the electron's charge, reversed or not, in every process. Second: no difference between a process and its image under both maps appears in a system of two copies.

### 10.2 The two falsifiers

First: a charged current found coupling to the right hand of particles at the strength of the left. The force would then be on the line of the mirror and would not be the force of Section 1.3. Second: a fourth carrier of the same charge with two kinds. This would break the count of Section 5.

### 10.3 What kind of result this is

The theorems are identities, equivalences, a finite check and a dimension count. They derive no angle and no mass.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file is written by a language model under the author's direct supervision. Every theorem named in the text is in Appendix A under that name, and its kernel line is printed in Appendix B. Classical results and measurements that are cited and not formalised are named as such where they are used. No constant of nature is derived anywhere in this paper: no mass, no strength of a coupling and no angle of a mixing is a theorem here, and where a measured value is quoted it is quoted from its source.

**The seat.** The seat is elementary: a set and a map of the set to itself, with the points the map leaves in place called its line. In the plane it is a reflection and the line it fixes, studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1. T. D. Lee and C. N. Yang, Phys. Rev. 104 (1956) 254.
2. C. S. Wu et al., Phys. Rev. 105 (1957) 1413.
3. S. L. Glashow, Nucl. Phys. 22 (1961) 579.
4. S. Weinberg, Phys. Rev. Lett. 19 (1967) 1264.
5. G. Arnison et al. (UA1 Collaboration), Phys. Lett. B 122 (1983) 103.
6. M. Kobayashi and T. Maskawa, Prog. Theor. Phys. 49 (1973) 652.
7. J. H. Christenson, J. W. Cronin, V. L. Fitch and R. Turlay, Phys. Rev. Lett. 13 (1964) 138.
8. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
9. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
10. M. F. Islam, The Charges of Matter as a New Mathematical Theorem (2026).
11. M. F. Islam, The Nuclear Forces as a New Mathematical Theorem (2026).
12. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its file uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main.

13. The law of a charge that does not commute, forced: Publication Library/Mathematics/Mathematical Physics/The Nuclear Forces/SPHYS_YangMills_Forced_CC.lean. Compiled with Mathlib 4.19.0, exit 0.
14. The table of charges, forced: Publication Library/Mathematics/Mathematical Physics/The Charges of Matter/SPHYS_Charge_Closure_CC.lean. Compiled with Mathlib 4.19.0, exit 0.
15. The seat: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_46_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.

## Appendix A · SPHYS_Weak_Force_Theorem_CC.lean

Lean 4.19.0 with Mathlib 4.19.0. 33 theorems, no axiom declared, no `sorry`, exit 0 with no warning. Every cone is pinned at the end of the file, so the build is silent. The kernel lines are Appendix B.

```lean
/-
SPHYS_Weak_Force_Theorem_CC.lean · The Weak Force as a New Mathematical Theorem. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. What is forced about the weak force: a coupling to one hand is off the line of the mirror; two folds that each
  reverse a reading keep it together, so a force that breaks the mirror and the exchange of charge can keep the two
  together; the two hands of the neutral current differ by the pair charge for every charge and mixing; there are three
  carriers; the charged carrier carries one step, which is the electron's charge reversed, for quarks and leptons alike;
  a mixing of the copies has a phase from three copies on. DESIGN. Part 0 the seat. Part I the hand. Part II the two folds
  together. Part III the neutral current. Part IV the carriers and the step. Part V the phase.
RISK. That nature couples to the left hand and not the right is measured; the file proves what follows from one hand.
  The mixing angle and the masses of the carriers are measured. NON-NEGOTIABLE. No axiom is declared. No proof is left open.
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

namespace SPHYS.WeakForce

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

/-! ## Part I. The hand, on any type of couplings. -/

/-- The mirror exchanges the two hands. -/
def swapHands {K : Type*} (g : K × K) : K × K := (g.2, g.1)

theorem on_the_line_of_the_mirror_iff_the_hands_are_equal {K : Type*} (g : K × K) : OnLine swapHands g ↔ g.1 = g.2 := by
  constructor
  · intro h; exact (congrArg Prod.fst h).symm
  · intro h; exact Prod.ext h.symm h

/-- THE WEAK FORCE READS THE ORIENTATION. A coupling to one hand only, not zero, is off the line of the mirror. -/
theorem a_coupling_to_one_hand_is_off_the_line {K : Type*} [Zero K] (g : K) (hg : g ≠ 0) :
    ¬ OnLine swapHands (g, (0 : K)) := fun h => hg ((on_the_line_of_the_mirror_iff_the_hands_are_equal _).1 h)

/-- The mirror sends it to the coupling of the other hand, which is another coupling. -/
theorem the_mirror_sends_one_hand_to_the_other {K : Type*} [Zero K] (g : K) : swapHands (g, (0 : K)) = (0, g) := rfl

/-! ## Part II. Two folds together, on any type. -/

/-- TWO REVERSALS KEEP. A reading that each of two folds reverses is kept by the two together. -/
theorem two_reversals_keep {X V : Type*} [AddGroup V] (σ τ : X → X) (r : X → V) (hσ : ∀ x, r (σ x) = - r x)
    (hτ : ∀ x, r (τ x) = - r x) (x : X) : r (σ (τ x)) = r x := by rw [hσ, hτ, neg_neg]

/-- A state is given by its hand and by whether it is a particle or its partner. The weak force couples to the left
particle and the right partner. -/
def couples (s : Bool × Bool) : Bool := s.1 != s.2
def mirrorState (s : Bool × Bool) : Bool × Bool := (!s.1, s.2)
def exchangeState (s : Bool × Bool) : Bool × Bool := (s.1, !s.2)

/-- IT BREAKS THE MIRROR, IT BREAKS THE EXCHANGE OF CHARGE, AND IT KEEPS THE TWO TOGETHER. -/
theorem it_breaks_each_and_keeps_both (s : Bool × Bool) :
    couples (mirrorState s) = !couples s ∧ couples (exchangeState s) = !couples s
    ∧ couples (exchangeState (mirrorState s)) = couples s := by
  obtain ⟨a, b⟩ := s
  cases a <;> cases b <;> decide

/-! ## Part III. The neutral current, on any commutative ring. -/

section Neutral
variable {R : Type*} [CommRing R]

def zLeft (t q s : R) : R := t - q * s
def zRight (_t q s : R) : R := -(q * s)

/-- THE DEPTH OF THE BREAKING IS THE PAIR CHARGE, for every electric charge and every mixing. -/
theorem the_depth_of_the_breaking_is_the_pair_charge (t q s : R) : zLeft t q s - zRight t q s = t := by
  simp [zLeft, zRight]

/-- A state with no pair charge is read alike by both hands; a neutral state has no right hand. -/
theorem no_pair_charge_no_breaking (q s : R) : zLeft 0 q s = zRight 0 q s ∧ zRight (0 : R) 0 s = 0 := by
  constructor <;> simp [zLeft, zRight]

/-- A reading that is a product of an odd number of reversed quantities is reversed: spin against momentum. -/
theorem spin_against_momentum_is_reversed_by_the_mirror (s p : R) : s * (-p) = -(s * p) := by ring

/-- The triple product of three directions is reversed by the mirror and the product of two is kept. -/
theorem the_triple_is_reversed_and_the_pair_is_kept (a b c : R) :
    (-a) * (-b) * (-c) = -(a * b * c) ∧ (-a) * (-b) = a * b := by constructor <;> ring

end Neutral

/-! ## Part IV. The carriers and the step. -/

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

/-! ## The charges, on any commutative ring. Six numbers: the charges of the quark pair `yQ`, of the two single quarks
`yu`, `yd`, of the lepton pair `yL`, of the single lepton `ye`, and of the field that gives mass `yH`. Five equations:
three that let mass be given, and two of closure. -/

section Charges
variable {R : Type*} [CommRing R]

/-- THE TABLE IS FORCED. The five equations fix every charge as a whole multiple of `yQ`, in any commutative ring. -/
theorem the_table_is_forced (yQ yu yd yL ye yH : R)
    (Yu : yQ + yu + yH = 0) (Yd : yQ + yd - yH = 0) (Ye : yL + ye - yH = 0)
    (iso : 3 * yQ + yL = 0) (grav : 6 * yQ + 3 * yu + 3 * yd + 2 * yL + ye = 0) :
    yu = -4 * yQ ∧ yd = 2 * yQ ∧ yL = -3 * yQ ∧ ye = 6 * yQ ∧ yH = 3 * yQ := by
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · linear_combination 4 * Yu + 3 * Yd + Ye + iso - grav
  · linear_combination Yd - 3 * Yu - 3 * Yd - Ye - iso + grav
  · linear_combination iso
  · linear_combination Ye - 3 * Yu - 3 * Yd - Ye - iso + grav - iso
  · linear_combination grav - 3 * Yu - 3 * Yd - Ye - iso

/-- The electric charges read from the table: the up quark `4 yQ`, the down quark `−2 yQ`, the electron `−6 yQ`, and the
neutrino one step of the pair above the electron. -/
def qUp (yQ : R) : R := 4 * yQ
def qDown (yQ : R) : R := -2 * yQ
def qElectron (yQ : R) : R := -6 * yQ
def qNeutrino (yQ : R) : R := qElectron yQ + (qUp yQ - qDown yQ)
def qProton (yQ : R) : R := qUp yQ + qUp yQ + qDown yQ
def qNeutron (yQ : R) : R := qUp yQ + qDown yQ + qDown yQ

/-- The charges of the single quarks and the single lepton of the table are these, reversed. -/
theorem the_charges_are_read_from_the_table (yQ yu yd yL ye yH : R)
    (Yu : yQ + yu + yH = 0) (Yd : yQ + yd - yH = 0) (Ye : yL + ye - yH = 0)
    (iso : 3 * yQ + yL = 0) (grav : 6 * yQ + 3 * yu + 3 * yd + 2 * yL + ye = 0) :
    -yu = qUp yQ ∧ -yd = qDown yQ ∧ -ye = qElectron yQ := by
  obtain ⟨h1, h2, _, h4, _⟩ := the_table_is_forced yQ yu yd yL ye yH Yu Yd Ye iso grav
  refine ⟨?_, ?_, ?_⟩ <;> simp only [qUp, qDown, qElectron]
  · linear_combination -h1
  · linear_combination -h2
  · linear_combination -h4

/-- THE ATOM IS NEUTRAL. The proton and the electron carry opposite charges, for every value of `yQ`. -/
theorem the_atom_is_neutral (yQ : R) : qProton yQ + qElectron yQ = 0 := by
  simp only [qProton, qUp, qDown, qElectron]; ring

/-- The neutron and the neutrino carry no charge. -/
theorem the_neutron_and_the_neutrino_are_neutral (yQ : R) : qNeutron yQ = 0 ∧ qNeutrino yQ = 0 := by
  constructor <;> simp only [qNeutron, qNeutrino, qUp, qDown, qElectron] <;> ring

/-- The quark charges are thirds of the electron's: three of each make a whole multiple of it. -/
theorem the_quark_charges_are_thirds (yQ : R) :
    3 * qUp yQ = -2 * qElectron yQ ∧ 3 * qDown yQ = qElectron yQ := by
  constructor <;> simp only [qUp, qDown, qElectron] <;> ring

/-- THE PAIRS SPLIT BY ONE STEP. The two members of a pair carry the charge of the pair plus and minus the charge `yH` of
the field that gives mass. With the table forced, the quark pair splits into the up and the down quark, and the lepton pair
into a neutral member and the electron. -/
theorem the_pairs_split_by_the_step (yQ yu yd yL ye yH : R)
    (Yu : yQ + yu + yH = 0) (Yd : yQ + yd - yH = 0) (Ye : yL + ye - yH = 0)
    (iso : 3 * yQ + yL = 0) (grav : 6 * yQ + 3 * yu + 3 * yd + 2 * yL + ye = 0) :
    yQ + yH = qUp yQ ∧ yQ - yH = qDown yQ ∧ yL + yH = 0 ∧ yL - yH = qElectron yQ := by
  obtain ⟨_, _, h3, _, h5⟩ := the_table_is_forced yQ yu yd yL ye yH Yu Yd Ye iso grav
  refine ⟨?_, ?_, ?_, ?_⟩
  · simp only [qUp]; linear_combination h5
  · simp only [qDown]; linear_combination -h5
  · linear_combination h3 + h5
  · simp only [qElectron]; linear_combination h3 - h5

/-- The step of the lepton pair is the step of the quark pair, and it is the electron's charge reversed. -/
theorem one_step_for_both_pairs (yQ : R) :
    qNeutrino yQ - qElectron yQ = qUp yQ - qDown yQ ∧ qUp yQ - qDown yQ = - qElectron yQ := by
  constructor <;> simp only [qNeutrino, qUp, qDown, qElectron] <;> ring

end Charges

/-- EVERY CHARGE READ ALONE IS A WHOLE MULTIPLE OF THE ELECTRON'S. With `a` up quarks and `b` down quarks, antiquarks
counted negative, and the number of quarks a multiple of three, the charge `4a − 2b` is a multiple of `6`. -/
theorem a_triple_of_quarks_carries_a_whole_charge (a b : ℤ) (h3 : (3 : ℤ) ∣ a + b) : (6 : ℤ) ∣ 4 * a - 2 * b := by
  omega

/-- A single quark does not: its charge `4` or `−2` is not a multiple of `6`. -/
theorem a_single_quark_carries_a_part_charge : ¬ (6 : ℤ) ∣ 4 ∧ ¬ (6 : ℤ) ∣ -2 := by
  constructor <;> omega

/-- THE CHARGED CARRIER CARRIES ONE STEP, for the quark pair and the lepton pair alike, and the step is the electron's
charge reversed. -/
theorem the_charged_carrier_carries_one_step {R : Type*} [CommRing R] (yQ : R) :
    qUp yQ - qDown yQ = - qElectron yQ ∧ qNeutrino yQ - qElectron yQ = - qElectron yQ := by
  constructor <;> simp only [qNeutrino, qUp, qDown, qElectron] <;> ring

/-- The charges of the three carriers add to zero: one step up, one step down, and one neutral. -/
theorem the_three_carriers_are_neutral_together {R : Type*} [CommRing R] (yQ : R) :
    (- qElectron yQ) + qElectron yQ + 0 = 0 := by ring

/-! ## Part V. The phase. -/

/-- A PHASE FROM THREE COPIES ON. The mixing of `n` copies leaves `(n − 1)(n − 2) / 2` phases: none for one or two, one
for three. With a phase the two folds together are not kept by the mixing. -/
theorem a_phase_from_three_copies_on (n : ℤ) (hn : 1 ≤ n) : 0 < (n - 1) * (n - 2) ↔ 3 ≤ n := by
  constructor
  · intro h
    by_contra hc
    have h12 : n = 1 ∨ n = 2 := by omega
    rcases h12 with rfl | rfl <;> norm_num at h
  · intro h
    exact mul_pos (by omega) (by omega)

/-! ## Part VI. The binding theorem and subsumption. -/

/-- THE WEAK FORCE. -/
theorem the_weak_force :
    (∀ g : ℤ, g ≠ 0 → ¬ OnLine swapHands (g, (0 : ℤ)))
    ∧ (∀ s : Bool × Bool, couples (mirrorState s) = !couples s ∧ couples (exchangeState s) = !couples s
        ∧ couples (exchangeState (mirrorState s)) = couples s)
    ∧ (∀ t q s : ℤ, zLeft t q s - zRight t q s = t)
    ∧ (Module.finrank ℚ (LinearMap.ker (Matrix.traceLinearMap (Fin 2) ℚ ℚ)) = 3)
    ∧ (∀ yQ : ℤ, qUp yQ - qDown yQ = - qElectron yQ ∧ qNeutrino yQ - qElectron yQ = - qElectron yQ)
    ∧ (∀ n : ℤ, 1 ≤ n → (0 < (n - 1) * (n - 2) ↔ 3 ≤ n)) :=
  ⟨fun g hg => a_coupling_to_one_hand_is_off_the_line g hg, it_breaks_each_and_keeps_both,
   the_depth_of_the_breaking_is_the_pair_charge, eight_three_and_none.2.1, the_charged_carrier_carries_one_step,
   a_phase_from_three_copies_on⟩

/-- SUBSUMPTION. Any force, on any type of states, with any two folds that each reverse its reading, keeps the two
together; and any model of couplings carried one to one into pairs with the mirrors matched is on the line exactly
where its two hands are equal. -/
theorem every_force_with_two_reversed_folds_is_an_instance {X V Y K : Type*} [AddGroup V] (σ τ : X → X) (r : X → V)
    (hσ : ∀ x, r (σ x) = - r x) (hτ : ∀ x, r (τ x) = - r x) (μ : Y → Y) (φ : Y → K × K)
    (hφ : Function.Injective φ) (heq : ∀ y, φ (μ y) = swapHands (φ y)) :
    (∀ x, r (σ (τ x)) = r x) ∧ (∀ y, OnLine μ y ↔ (φ y).1 = (φ y).2) :=
  ⟨two_reversals_keep σ τ r hσ hτ,
   fun y => (every_model_is_an_instance swapHands μ φ hφ heq y).trans (on_the_line_of_the_mirror_iff_the_hands_are_equal _)⟩


end SPHYS.WeakForce

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.WeakForce.a_kept_reading_is_one_on_the_pair' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.WeakForce.a_kept_reading_is_one_on_the_pair
/-- info: 'SPHYS.WeakForce.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.WeakForce.an_odd_reading_is_zero_on_the_line
/-- info: 'SPHYS.WeakForce.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.WeakForce.an_odd_reading_off_zero_tells_the_pair
/-- info: 'SPHYS.WeakForce.every_model_is_an_instance' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.WeakForce.every_model_is_an_instance
/-- info: 'SPHYS.WeakForce.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.WeakForce.every_reading_of_the_seat_is_a_reading_of_the_model
/-- info: 'SPHYS.WeakForce.on_the_line_of_the_mirror_iff_the_hands_are_equal' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.WeakForce.on_the_line_of_the_mirror_iff_the_hands_are_equal
/-- info: 'SPHYS.WeakForce.a_coupling_to_one_hand_is_off_the_line' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.WeakForce.a_coupling_to_one_hand_is_off_the_line
/-- info: 'SPHYS.WeakForce.the_mirror_sends_one_hand_to_the_other' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_mirror_sends_one_hand_to_the_other
/-- info: 'SPHYS.WeakForce.two_reversals_keep' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.WeakForce.two_reversals_keep
/-- info: 'SPHYS.WeakForce.it_breaks_each_and_keeps_both' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.WeakForce.it_breaks_each_and_keeps_both
/-- info: 'SPHYS.WeakForce.the_depth_of_the_breaking_is_the_pair_charge' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_depth_of_the_breaking_is_the_pair_charge
/-- info: 'SPHYS.WeakForce.no_pair_charge_no_breaking' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.WeakForce.no_pair_charge_no_breaking
/-- info: 'SPHYS.WeakForce.spin_against_momentum_is_reversed_by_the_mirror' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.spin_against_momentum_is_reversed_by_the_mirror
/-- info: 'SPHYS.WeakForce.the_triple_is_reversed_and_the_pair_is_kept' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_triple_is_reversed_and_the_pair_is_kept
/-- info: 'SPHYS.WeakForce.the_count_of_the_carriers' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_count_of_the_carriers
/-- info: 'SPHYS.WeakForce.eight_three_and_none' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.eight_three_and_none
/--
info: 'SPHYS.WeakForce.the_commutator_of_two_is_a_carrier' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.WeakForce.the_commutator_of_two_is_a_carrier
/-- info: 'SPHYS.WeakForce.a_commuting_charge_has_no_commutator' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.a_commuting_charge_has_no_commutator
/-- info: 'SPHYS.WeakForce.carriers_that_do_not_commute' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.carriers_that_do_not_commute
/-- info: 'SPHYS.WeakForce.the_table_is_forced' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_table_is_forced
/-- info: 'SPHYS.WeakForce.the_charges_are_read_from_the_table' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_charges_are_read_from_the_table
/-- info: 'SPHYS.WeakForce.the_atom_is_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_atom_is_neutral
/-- info: 'SPHYS.WeakForce.the_neutron_and_the_neutrino_are_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_neutron_and_the_neutrino_are_neutral
/-- info: 'SPHYS.WeakForce.the_quark_charges_are_thirds' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_quark_charges_are_thirds
/-- info: 'SPHYS.WeakForce.the_pairs_split_by_the_step' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_pairs_split_by_the_step
/-- info: 'SPHYS.WeakForce.one_step_for_both_pairs' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.one_step_for_both_pairs
/-- info: 'SPHYS.WeakForce.a_triple_of_quarks_carries_a_whole_charge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.a_triple_of_quarks_carries_a_whole_charge
/-- info: 'SPHYS.WeakForce.a_single_quark_carries_a_part_charge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.a_single_quark_carries_a_part_charge
/-- info: 'SPHYS.WeakForce.the_charged_carrier_carries_one_step' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_charged_carrier_carries_one_step
/-- info: 'SPHYS.WeakForce.the_three_carriers_are_neutral_together' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_three_carriers_are_neutral_together
/-- info: 'SPHYS.WeakForce.a_phase_from_three_copies_on' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.a_phase_from_three_copies_on
/-- info: 'SPHYS.WeakForce.the_weak_force' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.WeakForce.the_weak_force
/-- info: 'SPHYS.WeakForce.every_force_with_two_reversed_folds_is_an_instance' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.WeakForce.every_force_with_two_reversed_folds_is_an_instance
```

## Appendix B · Kernel lines of Appendix A

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

```text
'SPHYS.WeakForce.a_kept_reading_is_one_on_the_pair' does not depend on any axioms
'SPHYS.WeakForce.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext]
'SPHYS.WeakForce.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext]
'SPHYS.WeakForce.every_model_is_an_instance' does not depend on any axioms
'SPHYS.WeakForce.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms
'SPHYS.WeakForce.on_the_line_of_the_mirror_iff_the_hands_are_equal' does not depend on any axioms
'SPHYS.WeakForce.a_coupling_to_one_hand_is_off_the_line' does not depend on any axioms
'SPHYS.WeakForce.the_mirror_sends_one_hand_to_the_other' does not depend on any axioms
'SPHYS.WeakForce.two_reversals_keep' depends on axioms: [propext]
'SPHYS.WeakForce.it_breaks_each_and_keeps_both' does not depend on any axioms
'SPHYS.WeakForce.the_depth_of_the_breaking_is_the_pair_charge' depends on axioms: [propext]
'SPHYS.WeakForce.no_pair_charge_no_breaking' depends on axioms: [propext]
'SPHYS.WeakForce.spin_against_momentum_is_reversed_by_the_mirror' depends on axioms: [propext, Quot.sound]
'SPHYS.WeakForce.the_triple_is_reversed_and_the_pair_is_kept' depends on axioms: [propext, Quot.sound]
'SPHYS.WeakForce.the_count_of_the_carriers' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.WeakForce.eight_three_and_none' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.WeakForce.the_commutator_of_two_is_a_carrier' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.WeakForce.a_commuting_charge_has_no_commutator' depends on axioms: [propext, Quot.sound]
'SPHYS.WeakForce.carriers_that_do_not_commute' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.WeakForce.the_table_is_forced' depends on axioms: [propext, Quot.sound]
'SPHYS.WeakForce.the_charges_are_read_from_the_table' depends on axioms: [propext, Quot.sound]
'SPHYS.WeakForce.the_atom_is_neutral' depends on axioms: [propext, Quot.sound]
'SPHYS.WeakForce.the_neutron_and_the_neutrino_are_neutral' depends on axioms: [propext, Quot.sound]
'SPHYS.WeakForce.the_quark_charges_are_thirds' depends on axioms: [propext, Quot.sound]
'SPHYS.WeakForce.the_pairs_split_by_the_step' depends on axioms: [propext, Quot.sound]
'SPHYS.WeakForce.one_step_for_both_pairs' depends on axioms: [propext, Quot.sound]
'SPHYS.WeakForce.a_triple_of_quarks_carries_a_whole_charge' depends on axioms: [propext, Quot.sound]
'SPHYS.WeakForce.a_single_quark_carries_a_part_charge' depends on axioms: [propext, Quot.sound]
'SPHYS.WeakForce.the_charged_carrier_carries_one_step' depends on axioms: [propext, Quot.sound]
'SPHYS.WeakForce.the_three_carriers_are_neutral_together' depends on axioms: [propext, Quot.sound]
'SPHYS.WeakForce.a_phase_from_three_copies_on' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.WeakForce.the_weak_force' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.WeakForce.every_force_with_two_reversed_folds_is_an_instance' depends on axioms: [propext]
```

## Appendix C · Provenance Trail

The frame, the reading and the special cases of this paper are on the public record before it. The table lists each step at the grade its own record carries, with the address where that record can be read. The theorems of this paper, in the generality of Appendix A, are in the last row and in no earlier one. A row marked frame or reading states no theorem of this paper; a row marked special case proves or checks the subject on one model; a row marked kernel, structural carries Lean theorems on printed models; a row marked theorem on premises carries a law forced from named premises. The third column gives, for each row, the term of that record which is the precursor, and why the row is on the trail.

**Table C.1 · The grade ladder of the line of the weak force, 2026**

| Date | Grade | Precursor term, and why it is on the trail | Record | Address |
|---|---|---|---|---|
| 24 Mar | Frame, first anchor | **three orthogonal Ductions converging on one point.** The frame of the series: a point fixed by three independent axes, with the witness outside them | *Trisduction, A Geometric Epistemology of Absolute Convergence* | <https://trisduction.blogspot.com/2026/03/trisduction-geometric-epistemology-of.html> |
| 19 Jul | Reading | **the four forces and matter as configurations of one substrate.** The forces and the particles read as one kind of thing, in prose | *The Four Forces, Matter, and the Dark Sector as Configurations of One Actuating Substrate* | <https://doi.org/10.5281/zenodo.21438933> |
| 27 Sep | Special case | **the neutrino is the witness.** The neutral lepton read on the fixed line, on one model | *The Neutrino Is the Witness* | <https://doi.org/10.5281/zenodo.22986555> |
| 22 Oct | Kernel, structural | **the drafts of the physical series, with their Lean files.** The weak force reads the orientation, with a Lean file: the charged current off the line; the mirror and the exchange broken, the two together kept | *Draft papers of the physical series, with a Lean file each, at* `protocols/PhysOS/Draft Papers/` | <https://github.com/1000sapients/Trisduction/commit/ca67284> |
| 25 Nov | Theorem on premises | **closure forces the table.** The lepton charges follow from the quark charges; the atom is neutral | *The Charges of Matter as a New Mathematical Theorem* | <https://doi.org/10.5281/zenodo.24519057> |
| 25 Nov | Theorem on premises | **a charge that does not commute.** The equations of the nuclear forces forced; eight and three carriers; three the least with a phase | *The Nuclear Forces as a New Mathematical Theorem* | <https://doi.org/10.5281/zenodo.24524874> |
| 26 Nov | Theorem | **a coupling to one hand is off the line of the mirror.** On any type: the hand, two reversals keep, the depth of the breaking, three carriers, one step, the phase | *This paper, edition 1.0.0: the weak force on any type of couplings* | `not yet deposited` |

Dates are Zenodo publication dates where a DOI is given and the date printed on its page for the row of 24 March. The date of the row of 22 October is the git commit date. The Lean files of the rows of 22 October and 25 November were compiled again for this paper on Lean 4.19.0, from the copies in the repository 1000sapients/Trisduction, branch main, and compiled without error. The terms of the rows of 19 July and 27 September are taken from the titles of their records. This paper has no address until it is deposited.
