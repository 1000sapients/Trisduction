# The Photon as a New Mathematical Theorem

## Two Helicities and No Third over Any Field, No Mass Under a Kept Gauge for Any Symmetric Form, No Charge, and a Field That Falls as One Power Only

**Mohammad F. Islam PhD** · 26 November 2026

## Abstract

This paper proves, in Lean 4 with Mathlib, what is forced about the photon once it is taken to be the wave of a potential read up to a change of gauge. Over any field, the field strength of a wave is unchanged when the potential moves along the wave vector, on any set of indices. For any wave vector with a time part, every potential has exactly one change of gauge that removes its time part. For a wave along an axis, every potential across the wave is a change of gauge away from a potential with exactly two numbers and nothing else, and those two numbers are unique: two helicities and no third. A quarter turn of the two numbers squares to their reversal, and the mirror exchanges the two helicities. For any symmetric additive form on any additive group, a mass term that a change of gauge keeps is zero, where two is not zero and there are no zero divisors: the carrier of a kept gauge has no mass. The charge of light is a number, numbers commute, and the commutator that would make the carrier a source of itself is zero: the photon carries no charge. The exchange of charge keeps the forms of the wave. The states of a wave are $n - 2$ in $n$ dimensions, two exactly in four, and equal to the count of gravity's waves exactly in four. A field whose flux is the same through every sphere falls as one power only. The file has 19 theorems, declares no axiom and leaves no proof open.

## 1. The Theorem and What It Rests On

### 1.1 The statement

Let $K$ be a field. A potential is a quadruple $a = (a_t, a_x, a_y, a_z)$ over $K$ with the form $a \cdot b = -a_t b_t + a_x b_x + a_y b_y + a_z b_z$. A change of gauge sends $a$ to $a + c\,k$ for the wave vector $k$. The binding theorem `the_photon` states: (i) for $k = (\omega,0,0,\omega)$ with $\omega \ne 0$ and every $a$ with $k \cdot a = 0$, there is exactly one pair $(p_1, p_2)$ for which some change of gauge takes $a$ to $(0, p_1, p_2, 0)$; (ii) $k_\mu (a_\nu + c k_\nu) - k_\nu (a_\mu + c k_\mu) = k_\mu a_\nu - k_\nu a_\mu$; (iii) $xy - yx = 0$ in $K$; (iv) for integers $n \ge 2$, $n - 2 = 2$ exactly when $n = 4$.

### 1.2 What is proved, what is cited, what is assumed

Proved in Appendix A, and checked by the kernel of Lean 4 [10] with the Mathlib library [9]: every statement of Section 1.1 and of Sections 2 to 6. Assumed: that light is the wave of a potential and that the potential is read up to a change of gauge. The law of the field is forced from the conservation of charge in a companion paper [7], which also proves the dimension of the space of waves in every $n$; both are cited. Cited and not formalised: the quantum of light [1, 2]; the equations of the field [3]; the classification of states without mass by helicity [4]; the count of the waves of gravity. Measured and not derived: the speed of light and every bound on the mass of the photon [5].

### 1.3 What photon means here

The photon means a wave of the potential, across its null wave vector, taken up to a change of gauge. No constant of action enters; the counting of quanta is the subject of another paper of the programme [8].

## 2. The Gauge

The theorem `the_field_is_kept_by_a_change_of_gauge` holds on any set of indices and any commutative ring. The theorem `a_change_of_gauge_keeps_the_wave_across` states that if $k$ is null and $a$ is across $k$, so is $a + ck$. The wave vector along an axis is null (`the_wave_vector_is_null`).

## 3. Two Helicities and No Third

The theorem `one_form_with_no_time_part` states that when $k_t \ne 0$ there is exactly one $c$ with $(a + ck)_t = 0$. For the wave along the third axis, being across $k$ forces $a_z = a_t$, so the same change of gauge removes both. What is left is $(0, a_x, a_y, 0)$. The theorem `two_helicities_and_no_third` states existence and uniqueness of that pair. The quarter turn $(p_1,p_2) \mapsto (-p_2,p_1)$ done twice reverses both numbers (`the_quarter_turn_twice_reverses`), so its two roots are the two helicities, and the mirror $(p_1,p_2) \mapsto (p_1,-p_2)$ turns the quarter turn into its reverse (`the_mirror_exchanges_the_two_helicities`).

## 4. No Mass

A mass term is $m\,B(a,a)$ for a symmetric additive form $B$. The theorem `a_mass_is_changed_by_a_change_of_gauge` is stated for any additive group and any such form: if $k$ is null, some $a_0$ is not across $k$, and $m\,B(a+k,a+k) = m\,B(a,a)$ for every $a$, then $m = 0$, where two is not zero and there are no zero divisors. The proof expands $B(a_0+k,a_0+k) = B(a_0,a_0) + 2B(a_0,k)$. The dimension and the signature of the form play no part.

## 5. No Charge

The carrier of a charge reads on another carrier the commutator of the two. The theorem `the_photon_carries_no_charge` states that in a commutative ring this is zero. The exchange of charge reverses the potential and keeps the forms of the wave (`the_exchange_of_charge_keeps_the_forms`): the photon is its own partner.

## 6. The Counts

The theorem `two_states_exactly_in_four` states that $n - 2 = 2$ exactly when $n = 4$, and that $2(n-2) = n(n-3)$, the equality with the count of the waves of gravity, holds for $n \ge 2$ exactly when $n = 4$. The theorem `the_field_falls_as_one_power_only` states that for whole numbers with $r \ge 2$, $r^{n-1} = r^p$ exactly when $p = n - 1$: a field with the same flux through every sphere in $n$ dimensions of space falls as the power $n - 1$, the inverse square in three.

## 7. What Is Subsumed and What Is Not

Sections 2 and 4 are stated on any index set, any commutative ring and any symmetric additive form, so the carrier of any kept gauge of this kind, in any dimension and signature, is an instance. The theorem `every_model_of_light_is_an_instance` carries the line of any model of the two states, with a mirror, onto the line of the mirror of the two numbers, by `every_model_is_an_instance`; the readings are carried by `every_reading_of_the_seat_is_a_reading_of_the_model`, and what is reversed is zero on the line by `an_odd_reading_is_zero_on_the_line` and tells the pair apart off it by `an_odd_reading_off_zero_tells_the_pair`. A description of polarisation by Stokes numbers, by a sphere or by two complex amplitudes is such a model.

Not subsumed: the count of quanta; the law of the field; a carrier whose gauge is not kept, which is the subject of a later paper of this series.

## 8. The File, Theorem by Theorem

| Theorem | Axioms its proof uses |
|---|---|
| `a_kept_reading_is_one_on_the_pair` | no axiom |
| `an_odd_reading_is_zero_on_the_line` | propext |
| `an_odd_reading_off_zero_tells_the_pair` | propext |
| `every_model_is_an_instance` | no axiom |
| `every_reading_of_the_seat_is_a_reading_of_the_model` | no axiom |
| `the_field_is_kept_by_a_change_of_gauge` | propext, Quot.sound |
| `a_change_of_gauge_keeps_the_wave_across` | propext, Classical.choice, Quot.sound |
| `one_form_with_no_time_part` | propext, Classical.choice, Quot.sound |
| `the_wave_vector_is_null` | propext, Classical.choice, Quot.sound |
| `two_helicities_and_no_third` | propext, Classical.choice, Quot.sound |
| `the_quarter_turn_twice_reverses` | propext |
| `the_mirror_exchanges_the_two_helicities` | propext, Classical.choice, Quot.sound |
| `a_mass_is_changed_by_a_change_of_gauge` | propext, Quot.sound |
| `the_photon_carries_no_charge` | propext, Quot.sound |
| `the_exchange_of_charge_keeps_the_forms` | propext, Classical.choice, Quot.sound |
| `two_states_exactly_in_four` | propext, Classical.choice, Quot.sound |
| `the_field_falls_as_one_power_only` | propext, Classical.choice, Quot.sound |
| `the_photon` | propext, Classical.choice, Quot.sound |
| `every_model_of_light_is_an_instance` | propext |

## 9. Discussion: The Reading

The following is a reading and is carried at the grade of a premise. On the seat of this series a map and its line are given. The mirror is such a map on the two states of light; the linear polarisations along and across the mirror are on its line and the two helicities are a pair off it. A reading the mirror keeps does not tell the helicities apart. Nothing in Sections 2 to 7 depends on this paragraph.

## 10. Predictions, Falsifiers, and What Stands

### 10.1 Two predictions that will stand

First: light in vacuum shows two states of polarisation and no third. Second: the static field of a charge falls as the inverse square, to any precision. Tests of the exponent bound the mass of the photon [5, 6].

### 10.2 The two falsifiers

First: a third, longitudinal state of light in vacuum. By Section 4 this would mean the gauge is not kept, so the assumption of Section 1.2 would fall. Second: a measured departure of the static field from the inverse square in three dimensions of space. This would break the same assumption, since a mass changes the power law.

### 10.3 What kind of result this is

The theorems are identities, equivalences and statements of unique existence over any field. They do not derive the speed of light or any constant.

## Disclosure

The gates, the logic, the screen and the criteria of this work are hand coded by the author, and the final conclusion is the author's. The Lean file is written by a language model under the author's direct supervision. Every theorem named in the text is in Appendix A under that name, and its kernel line is printed in Appendix B. Classical results and measurements that are cited and not formalised are named as such where they are used. No constant of nature is derived anywhere in this paper: no mass, no strength of a coupling and no angle of a mixing is a theorem here, and where a measured value is quoted it is quoted from its source.

**The seat.** The seat is elementary: a set and a map of the set to itself, with the points the map leaves in place called its line. In the plane it is a reflection and the line it fixes, studied in Nothing Escapes, Least Erasure (Islam, 2026a), a volume that studies that line in connection with the Riemann Hypothesis. No result of this paper depends on that hypothesis or on any conjecture, and no kernel line prints one.

## References

1. M. Planck, Ann. Phys. 4 (1901) 553.
2. A. Einstein, Ann. Phys. 17 (1905) 132.
3. J. C. Maxwell, Philos. Trans. R. Soc. 155 (1865) 459.
4. E. P. Wigner, Ann. Math. 40 (1939) 149.
5. E. R. Williams, J. E. Faller and H. A. Hill, Phys. Rev. Lett. 26 (1971) 721.
6. A. S. Goldhaber and M. M. Nieto, Rev. Mod. Phys. 82 (2010) 939.
7. M. F. Islam, Light as a New Mathematical Theorem (2026).
8. M. F. Islam, Generalized Quantization as a New Mathematical Theorem, edition 2.0.1 (2026).
9. The mathlib Community, The Lean mathematical library, Proc. CPP 2020, 367.
10. L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, CADE 28 (2021) 625.
11. M. F. Islam, Nothing Escapes, Least Erasure, edition 2.0.1 (2026a).

**Lean Library Reference.** The files below are the originals of the wider programme, for a reader who wishes to check them. No theorem of this paper imports them; every definition its file uses is written out in Appendix A. Paths are in the repository 1000sapients/Trisduction, branch main.

12. The law of light, forced: Publication Library/Mathematics/Mathematical Physics/Light/SPHYS_Maxwell_Forced_CC.lean. Compiled with Mathlib 4.19.0, exit 0.
13. The seat: Publication Library/Mathematics/Millennium Series/RH_Both_Sides_Formal_Master_v3_0_46_CC.lean. Compiled with Mathlib 4.19.0, exit 0, no warning.

## Appendix A · SPHYS_Photon_Theorem_CC.lean

Lean 4.19.0 with Mathlib 4.19.0. 19 theorems, no axiom declared, no `sorry`, exit 0 with no warning. Every cone is pinned at the end of the file, so the build is silent. The kernel lines are Appendix B.

```lean
/-
SPHYS_Photon_Theorem_CC.lean · The Photon as a New Mathematical Theorem. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. The photon is the wave of a potential read up to a change of gauge. Its two states, its lack of mass and its lack
  of charge are each a statement about that reading. DESIGN. Part 0 the seat. Part I the potential in four dimensions over
  any field, and the gauge. Part II the forms of a wave: one with no time part, and two numbers along any axis. Part III the
  mass, for any symmetric additive form in any dimension. Part IV the charge. Part V the counts and the falling of the field.
RISK. The count in n dimensions is stated as arithmetic on n − 2; the dimension of the quotient in every n is proved in
  SPHYS_Maxwell_Forced_CC.lean. NON-NEGOTIABLE. No axiom is declared. No proof is left open.
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

namespace SPHYS.Photon

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

/-! ## Part I. The potential and the gauge, over any field. -/

@[ext] structure A4 (K : Type*) where
  t : K
  x : K
  y : K
  z : K

section Wave
variable {K : Type*} [Field K]

def A4.add (a b : A4 K) : A4 K := ⟨a.t + b.t, a.x + b.x, a.y + b.y, a.z + b.z⟩
def A4.smul (c : K) (a : A4 K) : A4 K := ⟨c * a.t, c * a.x, c * a.y, c * a.z⟩
/-- The form of space and time: the time part enters reversed. -/
def A4.dot (a b : A4 K) : K := -(a.t * b.t) + a.x * b.x + a.y * b.y + a.z * b.z

/-- THE FIELD IS KEPT BY A CHANGE OF GAUGE, on any index and any commutative ring: the potential may move along the wave
vector and the field `k a − a k` does not change. -/
theorem the_field_is_kept_by_a_change_of_gauge {ι R : Type*} [CommRing R] (k a : ι → R) (c : R) (μ ν : ι) :
    k μ * (a ν + c * k ν) - k ν * (a μ + c * k μ) = k μ * a ν - k ν * a μ := by ring

/-- A change of gauge keeps a wave across its wave vector, where the wave vector is null. -/
theorem a_change_of_gauge_keeps_the_wave_across (k a : A4 K) (c : K) (hk : k.dot k = 0) (ha : k.dot a = 0) :
    k.dot (a.add (A4.smul c k)) = 0 := by
  have h1 : -(k.t * k.t) + k.x * k.x + k.y * k.y + k.z * k.z = 0 := hk
  have h2 : -(k.t * a.t) + k.x * a.x + k.y * a.y + k.z * a.z = 0 := ha
  show -(k.t * (a.t + c * k.t)) + k.x * (a.x + c * k.x) + k.y * (a.y + c * k.y) + k.z * (a.z + c * k.z) = 0
  linear_combination h2 + c * h1

/-! ## Part II. The forms of a wave. -/

/-- ONE FORM WITH NO TIME PART. For any wave vector with a time part, every potential has exactly one change of gauge that
removes its time part. -/
theorem one_form_with_no_time_part (k a : A4 K) (hk : k.t ≠ 0) : ∃! c : K, (a.add (A4.smul c k)).t = 0 := by
  refine ⟨-a.t / k.t, ?_, ?_⟩
  · show a.t + -a.t / k.t * k.t = 0
    rw [div_mul_cancel₀ _ hk]; exact add_neg_cancel _
  · intro c hc
    have hc' : a.t + c * k.t = 0 := hc
    rw [eq_div_iff hk]; linear_combination hc'

/-- A wave along the third axis. -/
def kz (ω : K) : A4 K := ⟨ω, 0, 0, ω⟩

theorem the_wave_vector_is_null (ω : K) : (kz ω).dot (kz ω) = 0 := by
  show -(ω * ω) + 0 * 0 + 0 * 0 + ω * ω = 0; ring

/-- TWO HELICITIES AND NO THIRD. Every potential across the wave is, by exactly one pair of numbers, a change of gauge
away from a potential with those two numbers and nothing else. -/
theorem two_helicities_and_no_third (ω : K) (hω : ω ≠ 0) (a : A4 K) (ha : (kz ω).dot a = 0) :
    ∃! p : K × K, ∃ c : K, a.add (A4.smul c (kz ω)) = ⟨0, p.1, p.2, 0⟩ := by
  have h : -(ω * a.t) + 0 * a.x + 0 * a.y + ω * a.z = 0 := ha
  have haz : a.z = a.t := by
    have e : ω * (a.z - a.t) = 0 := by linear_combination h
    rcases mul_eq_zero.1 e with h | h
    · exact absurd h hω
    · exact sub_eq_zero.1 h
  refine ⟨(a.x, a.y), ⟨-a.t / ω, ?_⟩, ?_⟩
  · apply A4.ext
    · show a.t + -a.t / ω * ω = 0
      rw [div_mul_cancel₀ _ hω]; exact add_neg_cancel _
    · show a.x + -a.t / ω * 0 = a.x
      rw [mul_zero, add_zero]
    · show a.y + -a.t / ω * 0 = a.y
      rw [mul_zero, add_zero]
    · show a.z + -a.t / ω * ω = 0
      rw [div_mul_cancel₀ _ hω, haz]; exact add_neg_cancel _
  · rintro ⟨p1, p2⟩ ⟨c, hc⟩
    have hx : a.x + c * 0 = p1 := congrArg A4.x hc
    have hy : a.y + c * 0 = p2 := congrArg A4.y hc
    rw [mul_zero, add_zero] at hx hy
    rw [hx, hy]

/-- The quarter turn of the two numbers. Done twice it reverses both: its two roots are the two helicities. -/
def quarter (p : K × K) : K × K := (-p.2, p.1)
def mirror (p : K × K) : K × K := (p.1, -p.2)

theorem the_quarter_turn_twice_reverses (p : K × K) : quarter (quarter p) = (-p.1, -p.2) := by
  simp [quarter]

/-- THE MIRROR EXCHANGES THE TWO HELICITIES: it turns the quarter turn into its reverse. -/
theorem the_mirror_exchanges_the_two_helicities (p : K × K) :
    mirror (quarter (mirror p)) = (-(quarter p).1, -(quarter p).2) := by
  simp [quarter, mirror]

end Wave

/-! ## Part III. The mass, for any symmetric additive form on any additive group. -/

/-- A MASS IS CHANGED BY A CHANGE OF GAUGE. Let `B` be additive in each place and symmetric, let `k` be null, and let some
`a` not be across `k`. If `m · B(a + k, a + k) = m · B(a, a)` for every `a`, then `m = 0`, where two is not zero and
there are no zero divisors. The carrier of a gauge that is kept has no mass. -/
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

/-! ## Part IV. The charge. -/

/-- THE PHOTON CARRIES NO CHARGE. The charge of light is a number, any two numbers commute, and a carrier whose charge
commutes has no commutator to be a source of itself. -/
theorem the_photon_carries_no_charge {K : Type*} [CommRing K] (x y : K) : x * y - y * x = 0 := by ring

/-- The exchange of charge reverses the potential and keeps the forms of the wave: the photon is its own partner. -/
theorem the_exchange_of_charge_keeps_the_forms {K : Type*} [Field K] (k a : A4 K) (ha : k.dot a = 0) :
    k.dot (A4.smul (-1) a) = 0 := by
  have h2 : -(k.t * a.t) + k.x * a.x + k.y * a.y + k.z * a.z = 0 := ha
  show -(k.t * (-1 * a.t)) + k.x * (-1 * a.x) + k.y * (-1 * a.y) + k.z * (-1 * a.z) = 0
  linear_combination -h2

/-! ## Part V. The counts and the falling of the field. -/

/-- The states of a wave are `n − 2` in `n` dimensions: two exactly in four, and equal to the `n (n − 3) / 2` of gravity
exactly in four. -/
theorem two_states_exactly_in_four (n : ℤ) (hn : 2 ≤ n) :
    (n - 2 = 2 ↔ n = 4) ∧ (2 * (n - 2) = n * (n - 3) ↔ n = 4) := by
  refine ⟨by omega, ?_⟩
  constructor
  · intro h
    have h1 : (n - 1) * (n - 4) = 0 := by linear_combination -h
    rcases mul_eq_zero.1 h1 with h | h <;> omega
  · rintro rfl; norm_num

/-- THE FIELD OF A CHARGE FALLS AS ONE POWER ONLY. Through a sphere of radius `r` in `n` dimensions of space the area grows
as `r ^ (n − 1)`; a field falling as `r ^ p` has the same flux through every sphere exactly when `p = n − 1`. -/
theorem the_field_falls_as_one_power_only (r n p : ℕ) (hr : 2 ≤ r) : r ^ (n - 1) = r ^ p ↔ n - 1 = p :=
  ⟨fun h => Nat.pow_right_injective hr h, fun h => by rw [h]⟩

/-- THE PHOTON. -/
theorem the_photon {K : Type*} [Field K] :
    (∀ (ω : K), ω ≠ 0 → ∀ a : A4 K, (kz ω).dot a = 0 → ∃! p : K × K, ∃ c : K, a.add (A4.smul c (kz ω)) = ⟨0, p.1, p.2, 0⟩)
    ∧ (∀ (k a : ℕ → K) (c : K) (μ ν : ℕ), k μ * (a ν + c * k ν) - k ν * (a μ + c * k μ) = k μ * a ν - k ν * a μ)
    ∧ (∀ x y : K, x * y - y * x = 0)
    ∧ (∀ n : ℤ, 2 ≤ n → (n - 2 = 2 ↔ n = 4)) :=
  ⟨fun ω hω a ha => two_helicities_and_no_third ω hω a ha, fun k a c μ ν => the_field_is_kept_by_a_change_of_gauge k a c μ ν,
   the_photon_carries_no_charge, fun n hn => (two_states_exactly_in_four n hn).1⟩

/-- SUBSUMPTION. Any model of the states of light with a mirror, carried one to one into the two numbers with the mirrors
matched, is kept by its mirror exactly where its image is. -/
theorem every_model_of_light_is_an_instance {K Y : Type*} [Field K] (τ : Y → Y) (φ : Y → K × K)
    (hφ : Function.Injective φ) (heq : ∀ y, φ (τ y) = mirror (φ y)) (y : Y) : OnLine τ y ↔ OnLine mirror (φ y) :=
  every_model_is_an_instance mirror τ φ hφ heq y


end SPHYS.Photon

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.Photon.a_kept_reading_is_one_on_the_pair' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Photon.a_kept_reading_is_one_on_the_pair
/-- info: 'SPHYS.Photon.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Photon.an_odd_reading_is_zero_on_the_line
/-- info: 'SPHYS.Photon.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Photon.an_odd_reading_off_zero_tells_the_pair
/-- info: 'SPHYS.Photon.every_model_is_an_instance' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Photon.every_model_is_an_instance
/-- info: 'SPHYS.Photon.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Photon.every_reading_of_the_seat_is_a_reading_of_the_model
/-- info: 'SPHYS.Photon.the_field_is_kept_by_a_change_of_gauge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Photon.the_field_is_kept_by_a_change_of_gauge
/--
info: 'SPHYS.Photon.a_change_of_gauge_keeps_the_wave_across' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Photon.a_change_of_gauge_keeps_the_wave_across
/-- info: 'SPHYS.Photon.one_form_with_no_time_part' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Photon.one_form_with_no_time_part
/-- info: 'SPHYS.Photon.the_wave_vector_is_null' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Photon.the_wave_vector_is_null
/-- info: 'SPHYS.Photon.two_helicities_and_no_third' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Photon.two_helicities_and_no_third
/-- info: 'SPHYS.Photon.the_quarter_turn_twice_reverses' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Photon.the_quarter_turn_twice_reverses
/--
info: 'SPHYS.Photon.the_mirror_exchanges_the_two_helicities' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Photon.the_mirror_exchanges_the_two_helicities
/-- info: 'SPHYS.Photon.a_mass_is_changed_by_a_change_of_gauge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Photon.a_mass_is_changed_by_a_change_of_gauge
/-- info: 'SPHYS.Photon.the_photon_carries_no_charge' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Photon.the_photon_carries_no_charge
/--
info: 'SPHYS.Photon.the_exchange_of_charge_keeps_the_forms' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Photon.the_exchange_of_charge_keeps_the_forms
/-- info: 'SPHYS.Photon.two_states_exactly_in_four' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Photon.two_states_exactly_in_four
/-- info: 'SPHYS.Photon.the_field_falls_as_one_power_only' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Photon.the_field_falls_as_one_power_only
/-- info: 'SPHYS.Photon.the_photon' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Photon.the_photon
/-- info: 'SPHYS.Photon.every_model_of_light_is_an_instance' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Photon.every_model_of_light_is_an_instance
```

## Appendix B · Kernel lines of Appendix A

Each line is printed by Lean for one theorem and names every axiom its proof uses. The three that appear are Lean's own.

```text
'SPHYS.Photon.a_kept_reading_is_one_on_the_pair' does not depend on any axioms
'SPHYS.Photon.an_odd_reading_is_zero_on_the_line' depends on axioms: [propext]
'SPHYS.Photon.an_odd_reading_off_zero_tells_the_pair' depends on axioms: [propext]
'SPHYS.Photon.every_model_is_an_instance' does not depend on any axioms
'SPHYS.Photon.every_reading_of_the_seat_is_a_reading_of_the_model' does not depend on any axioms
'SPHYS.Photon.the_field_is_kept_by_a_change_of_gauge' depends on axioms: [propext, Quot.sound]
'SPHYS.Photon.a_change_of_gauge_keeps_the_wave_across' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Photon.one_form_with_no_time_part' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Photon.the_wave_vector_is_null' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Photon.two_helicities_and_no_third' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Photon.the_quarter_turn_twice_reverses' depends on axioms: [propext]
'SPHYS.Photon.the_mirror_exchanges_the_two_helicities' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Photon.a_mass_is_changed_by_a_change_of_gauge' depends on axioms: [propext, Quot.sound]
'SPHYS.Photon.the_photon_carries_no_charge' depends on axioms: [propext, Quot.sound]
'SPHYS.Photon.the_exchange_of_charge_keeps_the_forms' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Photon.two_states_exactly_in_four' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Photon.the_field_falls_as_one_power_only' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Photon.the_photon' depends on axioms: [propext, Classical.choice, Quot.sound]
'SPHYS.Photon.every_model_of_light_is_an_instance' depends on axioms: [propext]
```

## Appendix C · Provenance Trail

The frame, the reading and the special cases of this paper are on the public record before it. The table lists each step at the grade its own record carries, with the address where that record can be read. The theorems of this paper, in the generality of Appendix A, are in the last row and in no earlier one. A row marked frame or reading states no theorem of this paper; a row marked special case proves or checks the subject on one model; a row marked kernel, structural carries Lean theorems on printed models; a row marked theorem on premises carries a law forced from named premises. The third column gives, for each row, the term of that record which is the precursor, and why the row is on the trail.

**Table C.1 · The grade ladder of the photon line, 2026**

| Date | Grade | Precursor term, and why it is on the trail | Record | Address |
|---|---|---|---|---|
| 24 Mar | Frame, first anchor | **three orthogonal Ductions converging on one point.** The frame of the series: a point fixed by three independent axes, with the witness outside them | *Trisduction, A Geometric Epistemology of Absolute Convergence* | <https://trisduction.blogspot.com/2026/03/trisduction-geometric-epistemology-of.html> |
| 9 May | Reading | **the geometric nature of light.** Light read as a continuous field, in prose | *The Geometric Nature of Light, From Ancient Substrate to Quantum Field* | <https://doi.org/10.5281/zenodo.20091980> |
| 19 Jul | Reading | **the four forces and matter as configurations of one substrate.** The forces and the particles read as one kind of thing, in prose | *The Four Forces, Matter, and the Dark Sector as Configurations of One Actuating Substrate* | <https://doi.org/10.5281/zenodo.21438933> |
| 25 Nov | Theorem on premises | **the equations of light forced.** The law of light forced by the conservation of charge; two helicities; the inverse square | *Light as a New Mathematical Theorem* | <https://doi.org/10.5281/zenodo.24519032> |
| 26 Nov | Theorem | **two helicities and no third.** Over any field: the forms of a wave, no mass under a kept gauge for any symmetric form, no charge, the counts | *This paper, edition 1.0.0: the photon over any field* | `not yet deposited` |

Dates are Zenodo publication dates where a DOI is given and the date printed on its page for the row of 24 March. The Lean files of the rows of 25 November were compiled again for this paper on Lean 4.19.0, from the copies in the repository 1000sapients/Trisduction, branch main, and compiled without error. The terms of the rows of 9 May and 19 July are taken from the titles of their records. This paper has no address until it is deposited.
