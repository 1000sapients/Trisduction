# The Quark as a New Mathematical Theorem

## Charges in Thirds, a Whole Charge on Every Multiple of Three, No Kept Reading of a Colour, and No Lock of More Quarks than Colours

**Mohammad F. Islam PhD** · 26 November 2026

## Abstract

This paper proves, in Lean 4 with Mathlib, what is forced about the quark. In any commutative ring the five equations that close the table of charges make the charge of the up quark four units and of the down quark minus two, where the electron has minus six: three of either make a whole multiple of the electron's charge. Any set of up and down quarks, antiquarks counted negative, whose number is a multiple of three carries a whole multiple of the electron's charge, and a single quark does not. On any type of colours, a reading that every exchange of two colours keeps takes one value on every colour: no kept reading reads a colour. On any finite types of places and colours and any group of amplitudes with no element of order two, an amplitude that changes sign when two places are exchanged is zero wherever two places share a colour, and is zero everywhere when there are more places than colours: with three colours no four quarks are locked. A number of quarks that is a multiple of three and not zero is at least three. The file has 22 theorems, declares no axiom and leaves no proof open. That quarks are not seen alone is an observation; the file does not derive it from the equations of the strong force.

## 1. The Theorem and What It Rests On

### 1.1 The statement

The binding theorem `the_quark` states: (i) $3 q_u = -2 q_e$ and $3 q_d = q_e$ for every integer unit; (ii) if $3$ divides $a + b$ then $6$ divides $4a - 2b$; (iii) $6$ divides neither $4$ nor $-2$; (iv) an integer reading of three colours kept by every exchange is constant; (v) an integer amplitude of four places in three colours, antisymmetric under every exchange of two places, is zero. The general forms are in Sections 2 to 4.

### 1.2 What is proved, what is cited, what is assumed

Proved in Appendix A, and checked by the kernel of Lean 4 [10] with the Mathlib library [9]: every statement of Section 1.1 and of Sections 2 to 4. Assumed: the five equations of the table [8]; that a state of several quarks read alone is antisymmetric in colour. Cited and not formalised: the quark [1, 2]; colour [3, 4]; the points inside the proton [5]. Measured and not derived: the masses of the quarks, the strength of the force, and the absence of free quarks [6].

### 1.3 What quark means here

A quark means a state carrying one of three colours and a charge of four or of minus two units of the table. A colour means a point of a set on which every exchange is a symmetry of the law.

## 2. Thirds

The table is forced in any commutative ring (`the_table_is_forced`) and the charges are read from it (`the_charges_are_read_from_the_table`). The theorem `the_quark_charges_are_thirds` follows. The theorem `a_triple_of_quarks_carries_a_whole_charge` covers every combination: three quarks, a quark and an antiquark, two of each, five and so on, as long as the number of quarks less the number of antiquarks is a multiple of three. The theorem `a_single_quark_carries_a_part_charge` states that one quark is not covered. With the table come `the_atom_is_neutral`, `the_neutron_and_the_neutrino_are_neutral`, `the_pairs_split_by_the_step` and `one_step_for_both_pairs`.

## 3. No Kept Reading Reads a Colour

The theorem `no_kept_reading_reads_a_colour` holds for any type of colours and any type of values. If the reading is unchanged when any two colours are exchanged, it gives the same value on any two colours. For several quarks, `a_kept_reading_of_many_is_one_on_exchanged_colours` states the same for a set of quarks and the set with two colours exchanged throughout. What a kept reading can register of several quarks is a combination no exchange changes.

## 4. The Lock

The theorem `two_alike_are_excluded` holds for any types of places and colours. The theorem `no_more_places_than_colours` adds that with more places than colours two places must share a colour, so the amplitude is zero everywhere. The case of four in three is `four_quarks_cannot_be_locked_in_three_colours`. The least number read alone is three (`three_is_the_least_number_read_alone`).

## 5. What Is Subsumed and What Is Not

Sections 3 and 4 are stated for any number of colours, so a model with two colours, four, or any number is an instance, with the bound of Section 4 moving to that number. The theorem `every_model_of_colour_is_an_instance` carries a kept reading back along any map of models. The general theorems of the seat, `every_model_is_an_instance`, `every_reading_of_the_seat_is_a_reading_of_the_model`, `an_odd_reading_is_zero_on_the_line`, `an_odd_reading_off_zero_tells_the_pair` and `a_kept_reading_is_one_on_the_pair`, are in Part 0. The earlier record of this trail, which enumerates the antisymmetric reading on three colours, is an instance of Section 4.

Not subsumed: confinement as a consequence of the equations of the force; the masses; states that are symmetric in colour.

## 6. The File, Theorem by Theorem

| Theorem | Axioms its proof uses |
|---|---|
| `a_kept_reading_is_one_on_the_pair` | no axiom |
| `an_odd_reading_is_zero_on_the_line` | propext |
| `an_odd_reading_off_zero_tells_the_pair` | propext |
| `every_model_is_an_instance` | no axiom |
| `every_reading_of_the_seat_is_a_reading_of_the_model` | no axiom |
| `the_table_is_forced` | propext, Quot.sound |
| `the_charges_are_read_from_the_table` | propext, Quot.sound |
| `the_atom_is_neutral` | propext, Quot.sound |
| `the_neutron_and_the_neutrino_are_neutral` | propext, Quot.sound |
| `the_quark_charges_are_thirds` | propext, Quot.sound |
| `the_pairs_split_by_the_step` | propext, Quot.sound |
| `one_step_for_both_pairs` | propext, Quot.sound |
| `a_triple_of_quarks_carries_a_whole_charge` | propext, Quot.sound |
| `a_single_quark_carries_a_part_charge` | propext, Quot.sound |
| `no_kept_reading_reads_a_colour` | propext, Quot.sound |
| `a_kept_reading_of_many_is_one_on_exchanged_colours` | propext, Quot.sound |
| `two_alike_are_excluded` | propext, Quot.sound |
| `no_more_places_than_colours` | propext, Classical.choice, Quot.sound |
| `four_quarks_cannot_be_locked_in_three_colours` | propext, Classical.choice, Quot.sound |
| `three_is_the_least_number_read_alone` | propext |
| `the_quark` | propext, Classical.choice, Quot.sound |
| `every_model_of_colour_is_an_instance` | propext, Quot.sound |

## 7. Discussion: The Reading

The following is a reading and is carried at the grade of a premise. On the seat of this series a kept reading takes one value across what the map exchanges. The exchanges of colour are such maps, so what is registered is what they all keep. A single quark carries a colour and a part charge; neither is registered alone. Nothing in Sections 2 to 5 depends on this paragraph.

## 8. Predictions, Falsifiers, and What Stands

### 8.1 Two predictions that will stand

First: every particle detected alone carries a whole multiple of the electron's charge. Second: the ratio of the rates into quarks and into a lepton pair keeps the value that three colours give [7].

### 8.2 The two falsifiers

First: a particle detected alone with a charge of one third or two thirds of the electron's. Section 2 would stand as arithmetic; what would fall is the assumption that what is read alone has a number of quarks that is a multiple of three. Second: a measured ratio of rates that fits a number of colours other than three. This would break the use of three in Section 4.

### 8.3 What kind of result this is

The theorems are identities, divisibility statements and vanishing statements on stated structures. They derive no mass and no strength.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file is written by a language model under the author's direct supervision. Every theorem named in the text is in Appendix A under that name, and its kernel line is printed in Appendix B. Classical results and measurements that are cited and not formalised are named as such where they are used. No constant of nature is derived anywhere in this paper: no mass, no strength of a coupling and no angle of a mixing is a theorem here, and where a measured value is quoted it is quoted from its source.

**The seat.** The seat is elementary: a set and a map of the set to itself, with the points the map leaves in place called its line. In the plane it is a reflection and the line it fixes, studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1. M. Gell-Mann, Phys. Lett. 8 (1964) 214.
2. G. Zweig, CERN Report 8182/TH.401 (1964).
3. O. W. Greenberg, Phys. Rev. Lett. 13 (1964) 598.
4. M. Y. Han and Y. Nambu, Phys. Rev. 139 (1965) B1006.
5. E. D. Bloom et al., Phys. Rev. Lett. 23 (1969) 930.
6. M. L. Perl, E. R. Lee and D. Loomba, Annu. Rev. Nucl. Part. Sci. 59 (2009) 47.
7. R. L. Workman et al. (Particle Data Group), Prog. Theor. Exp. Phys. 2022 (2022) 083C01.
8. M. F. Islam, The Charges of Matter as a New Mathematical Theorem (2026).
9. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
10. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
11. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its file uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main.

12. The table of charges, forced: Publication Library/Mathematics/Mathematical Physics/The Charges of Matter/SPHYS_Charge_Closure_CC.lean. Compiled with Mathlib 4.19.0, exit 0.
13. The law of a charge that does not commute, forced: Publication Library/Mathematics/Mathematical Physics/The Nuclear Forces/SPHYS_YangMills_Forced_CC.lean. Compiled with Mathlib 4.19.0, exit 0.
14. The seat: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_46_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.

## Appendix A · SPHYS_Quark_Theorem_CC.lean

Lean 4.19.0 with Mathlib 4.19.0. 22 theorems, no axiom declared, no `sorry`, exit 0 with no warning. Every cone is pinned at the end of the file, so the build is silent. The kernel lines are Appendix B.

```lean
/-
SPHYS_Quark_Theorem_CC.lean · The Quark as a New Mathematical Theorem. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. What is forced about the quark: its charge is a third part of the electron's; a set of quarks whose number is a
  multiple of three carries a whole charge and a single quark does not; no reading that every exchange of colours keeps
  reads a colour; an amplitude antisymmetric in more quarks than there are colours is zero. DESIGN. Part 0 the seat.
  Part I the charge. Part II the colour, on any type of colours. Part III the antisymmetric amplitude, on any finite types.
RISK. That quarks are not seen alone is an observation; the file proves that no kept reading reads a colour and that a
  single quark carries a part charge, and does not derive confinement from the equations of the strong force.
NON-NEGOTIABLE. No axiom is declared. No proof is left open.
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

namespace SPHYS.Quark

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

/-! ## Part I. The charge. -/

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

/-! ## Part II. The colour, on any type of colours. -/

/-- NO KEPT READING READS A COLOUR. A reading that every exchange of two colours keeps takes one value on every colour. -/
theorem no_kept_reading_reads_a_colour {C W : Type*} [DecidableEq C] (r : C → W)
    (h : ∀ (a b x : C), r (Equiv.swap a b x) = r x) (a b : C) : r a = r b := by
  have e := h a b a
  rw [Equiv.swap_apply_left] at e
  exact e.symm

/-- A reading of several quarks that every exchange of colours keeps takes one value on a set of quarks and on the same
set with two colours exchanged throughout. -/
theorem a_kept_reading_of_many_is_one_on_exchanged_colours {C I W : Type*} [DecidableEq C] (r : (I → C) → W)
    (h : ∀ (a b : C) (c : I → C), r (fun i => Equiv.swap a b (c i)) = r c) (a b : C) (c : I → C) :
    r (fun i => Equiv.swap a b (c i)) = r c := h a b c

/-! ## Part III. The antisymmetric amplitude, on any finite types of places and colours. -/

/-- TWO ALIKE ARE EXCLUDED. An amplitude that changes sign when two places are exchanged is zero on any colouring that
gives those two places one colour. -/
theorem two_alike_are_excluded {I C V : Type*} [DecidableEq I] [AddGroup V] (h2 : ∀ v : V, v + v = 0 → v = 0)
    (ψ : (I → C) → V) (hanti : ∀ (i j : I), i ≠ j → ∀ c : I → C, ψ (fun x => c (Equiv.swap i j x)) = - ψ c)
    (c : I → C) (i j : I) (hij : i ≠ j) (hc : c i = c j) : ψ c = 0 := by
  have e : (fun x => c (Equiv.swap i j x)) = c := by
    funext x
    by_cases hxi : x = i
    · rw [hxi, Equiv.swap_apply_left, hc]
    · by_cases hxj : x = j
      · rw [hxj, Equiv.swap_apply_right, hc]
      · rw [Equiv.swap_apply_of_ne_of_ne hxi hxj]
  have h := hanti i j hij c
  rw [e] at h
  apply h2
  nth_rewrite 1 [h]
  exact neg_add_cancel _

/-- NO MORE QUARKS THAN COLOURS IN ONE LOCK. With more places than colours, every such amplitude is zero everywhere. -/
theorem no_more_places_than_colours {I C V : Type*} [DecidableEq I] [Fintype I] [Fintype C] [AddGroup V]
    (h2 : ∀ v : V, v + v = 0 → v = 0) (hcard : Fintype.card C < Fintype.card I)
    (ψ : (I → C) → V) (hanti : ∀ (i j : I), i ≠ j → ∀ c : I → C, ψ (fun x => c (Equiv.swap i j x)) = - ψ c)
    (c : I → C) : ψ c = 0 := by
  have hex : ∃ i j, i ≠ j ∧ c i = c j := by
    by_contra hc
    push_neg at hc
    have hinj : Function.Injective c := fun a b hab => by_contra fun hne => hc a b hne hab
    exact absurd (Fintype.card_le_of_injective c hinj) (not_le.2 hcard)
  obtain ⟨i, j, hij, hc⟩ := hex
  exact two_alike_are_excluded h2 ψ hanti c i j hij hc

/-- With three colours, four quarks cannot be locked. -/
theorem four_quarks_cannot_be_locked_in_three_colours {V : Type*} [AddGroup V] (h2 : ∀ v : V, v + v = 0 → v = 0)
    (ψ : (Fin 4 → Fin 3) → V)
    (hanti : ∀ (i j : Fin 4), i ≠ j → ∀ c : Fin 4 → Fin 3, ψ (fun x => c (Equiv.swap i j x)) = - ψ c)
    (c : Fin 4 → Fin 3) : ψ c = 0 :=
  no_more_places_than_colours h2 (by simp) ψ hanti c

/-- THREE IS THE LEAST. A number of quarks that is a multiple of three and is not zero is at least three. -/
theorem three_is_the_least_number_read_alone (n : ℕ) (h0 : 0 < n) (h3 : 3 ∣ n) : 3 ≤ n := Nat.le_of_dvd h0 h3

/-! ## Part IV. The binding theorem and subsumption. -/

/-- THE QUARK. -/
theorem the_quark :
    (∀ yQ : ℤ, 3 * qUp yQ = -2 * qElectron yQ ∧ 3 * qDown yQ = qElectron yQ)
    ∧ (∀ a b : ℤ, (3 : ℤ) ∣ a + b → (6 : ℤ) ∣ 4 * a - 2 * b)
    ∧ (¬ (6 : ℤ) ∣ 4 ∧ ¬ (6 : ℤ) ∣ -2)
    ∧ (∀ (r : Fin 3 → ℤ), (∀ a b x : Fin 3, r (Equiv.swap a b x) = r x) → ∀ a b : Fin 3, r a = r b)
    ∧ (∀ (ψ : (Fin 4 → Fin 3) → ℤ),
        (∀ (i j : Fin 4), i ≠ j → ∀ c : Fin 4 → Fin 3, ψ (fun x => c (Equiv.swap i j x)) = - ψ c) → ∀ c, ψ c = 0) :=
  ⟨the_quark_charges_are_thirds, a_triple_of_quarks_carries_a_whole_charge, a_single_quark_carries_a_part_charge,
   fun r h a b => no_kept_reading_reads_a_colour r h a b,
   fun ψ h c => four_quarks_cannot_be_locked_in_three_colours (fun v hv => by omega) ψ h c⟩

/-- SUBSUMPTION. Any model of colour, on any type, carried into another by any map, has every kept reading of the second
as a reading of the first that takes one value wherever the second does. -/
theorem every_model_of_colour_is_an_instance {C D W : Type*} [DecidableEq C] (φ : D → C) (r : C → W)
    (h : ∀ (a b x : C), r (Equiv.swap a b x) = r x) (d d' : D) : r (φ d) = r (φ d') :=
  no_kept_reading_reads_a_colour r h (φ d) (φ d')


end SPHYS.Quark

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.Quark.a_kept_reading_is_one_on_the_pair' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Quark.a_kept_reading_is_one_on_the_pair
/-- info: 'SPHYS.Quark.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Quark.an_odd_reading_is_zero_on_the_line
/-- info: 'SPHYS.Quark.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Quark.an_odd_reading_off_zero_tells_the_pair
/-- info: 'SPHYS.Quark.every_model_is_an_instance' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Quark.every_model_is_an_instance
/-- info: 'SPHYS.Quark.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Quark.every_reading_of_the_seat_is_a_reading_of_the_model
/-- info: 'SPHYS.Quark.the_table_is_forced' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.the_table_is_forced
/-- info: 'SPHYS.Quark.the_charges_are_read_from_the_table' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.the_charges_are_read_from_the_table
/-- info: 'SPHYS.Quark.the_atom_is_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.the_atom_is_neutral
/-- info: 'SPHYS.Quark.the_neutron_and_the_neutrino_are_neutral' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.the_neutron_and_the_neutrino_are_neutral
/-- info: 'SPHYS.Quark.the_quark_charges_are_thirds' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.the_quark_charges_are_thirds
/-- info: 'SPHYS.Quark.the_pairs_split_by_the_step' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.the_pairs_split_by_the_step
/-- info: 'SPHYS.Quark.one_step_for_both_pairs' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.one_step_for_both_pairs
/-- info: 'SPHYS.Quark.a_triple_of_quarks_carries_a_whole_charge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.a_triple_of_quarks_carries_a_whole_charge
/-- info: 'SPHYS.Quark.a_single_quark_carries_a_part_charge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.a_single_quark_carries_a_part_charge
/-- info: 'SPHYS.Quark.no_kept_reading_reads_a_colour' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.no_kept_reading_reads_a_colour
/-- info: 'SPHYS.Quark.a_kept_reading_of_many_is_one_on_exchanged_colours' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.a_kept_reading_of_many_is_one_on_exchanged_colours
/-- info: 'SPHYS.Quark.two_alike_are_excluded' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.two_alike_are_excluded
/-- info: 'SPHYS.Quark.no_more_places_than_colours' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.no_more_places_than_colours
/--
info: 'SPHYS.Quark.four_quarks_cannot_be_locked_in_three_colours' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Quark.four_quarks_cannot_be_locked_in_three_colours
/-- info: 'SPHYS.Quark.three_is_the_least_number_read_alone' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Quark.three_is_the_least_number_read_alone
/-- info: 'SPHYS.Quark.the_quark' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.the_quark
/-- info: 'SPHYS.Quark.every_model_of_colour_is_an_instance' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Quark.every_model_of_colour_is_an_instance
```

## Appendix B · Kernel lines of Appendix A

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

```text
'SPHYS.Quark.a_kept_reading_is_one_on_the_pair' does not depend on any axioms
'SPHYS.Quark.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext]
'SPHYS.Quark.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext]
'SPHYS.Quark.every_model_is_an_instance' does not depend on any axioms
'SPHYS.Quark.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms
'SPHYS.Quark.the_table_is_forced' depends on axioms: [propext, Quot.sound]
'SPHYS.Quark.the_charges_are_read_from_the_table' depends on axioms: [propext, Quot.sound]
'SPHYS.Quark.the_atom_is_neutral' depends on axioms: [propext, Quot.sound]
'SPHYS.Quark.the_neutron_and_the_neutrino_are_neutral' depends on axioms: [propext, Quot.sound]
'SPHYS.Quark.the_quark_charges_are_thirds' depends on axioms: [propext, Quot.sound]
'SPHYS.Quark.the_pairs_split_by_the_step' depends on axioms: [propext, Quot.sound]
'SPHYS.Quark.one_step_for_both_pairs' depends on axioms: [propext, Quot.sound]
'SPHYS.Quark.a_triple_of_quarks_carries_a_whole_charge' depends on axioms: [propext, Quot.sound]
'SPHYS.Quark.a_single_quark_carries_a_part_charge' depends on axioms: [propext, Quot.sound]
'SPHYS.Quark.no_kept_reading_reads_a_colour' depends on axioms: [propext, Quot.sound]
'SPHYS.Quark.a_kept_reading_of_many_is_one_on_exchanged_colours' depends on axioms: [propext, Quot.sound]
'SPHYS.Quark.two_alike_are_excluded' depends on axioms: [propext, Quot.sound]
'SPHYS.Quark.no_more_places_than_colours' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Quark.four_quarks_cannot_be_locked_in_three_colours' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Quark.three_is_the_least_number_read_alone' depends on axioms: [propext]
'SPHYS.Quark.the_quark' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Quark.every_model_of_colour_is_an_instance' depends on axioms: [propext, Quot.sound]
```

## Appendix C · Provenance Trail

The frame, the reading and the special cases of this paper are on the public record before it. The table lists each step at the grade its own record carries, with the address where that record can be read. The theorems of this paper, in the generality of Appendix A, are in the last row and in no earlier one. A row marked frame or reading states no theorem of this paper; a row marked special case proves or checks the subject on one model; a row marked kernel, structural carries Lean theorems on printed models; a row marked theorem on premises carries a law forced from named premises. The third column gives, for each row, the term of that record which is the precursor, and why the row is on the trail.

**Table C.1 · The grade ladder of the quark line, 2026**

| Date | Grade | Precursor term, and why it is on the trail | Record | Address |
|---|---|---|---|---|
| 24 Mar | Frame, first anchor | **three orthogonal Ductions converging on one point.** The frame of the series: a point fixed by three independent axes, with the witness outside them | *Trisduction, A Geometric Epistemology of Absolute Convergence* | <https://trisduction.blogspot.com/2026/03/trisduction-geometric-epistemology-of.html> |
| 19 Jul | Reading | **the four forces and matter as configurations of one substrate.** The forces and the particles read as one kind of thing, in prose | *The Four Forces, Matter, and the Dark Sector as Configurations of One Actuating Substrate* | <https://doi.org/10.5281/zenodo.21438933> |
| 27 Sep | Special case | **the proton is the lock; three colours, one singlet.** The antisymmetric reading of three colours, checked on three by enumeration | *The Proton Is the Lock* | <https://doi.org/10.5281/zenodo.22986559> |
| 25 Nov | Theorem on premises | **closure forces the table.** The lepton charges follow from the quark charges; the atom is neutral | *The Charges of Matter as a New Mathematical Theorem* | <https://doi.org/10.5281/zenodo.24519057> |
| 25 Nov | Theorem on premises | **a charge that does not commute.** The equations of the nuclear forces forced; eight and three carriers; three the least with a phase | *The Nuclear Forces as a New Mathematical Theorem* | <https://doi.org/10.5281/zenodo.24524874> |
| 26 Nov | Theorem | **no kept reading reads a colour.** On any type of colours and any commutative ring: thirds, whole charges on multiples of three, the lock bounded by the colours | *This paper, edition 1.0.0: the quark on any type of colours* | `not yet deposited` |

Dates are Zenodo publication dates where a DOI is given and the date printed on its page for the row of 24 March. The Lean files of the rows of 25 November were compiled again for this paper on Lean 4.19.0, from the copies in the repository 1000sapients/Trisduction, branch main, and compiled without error. The terms of the rows of 19 July and 27 September are taken from the titles of their records. This paper has no address until it is deposited.
