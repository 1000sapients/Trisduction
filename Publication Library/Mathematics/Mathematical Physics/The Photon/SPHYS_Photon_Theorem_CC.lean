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
