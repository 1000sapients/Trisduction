/-
SPHYS_Dark_Fixed_Set_CC.lean · dark matter as the fixed set of charge conjugation, on real algebra
RATIONALE. The kernel of the first edition proved its statements over whole numbers in core Lean. This file
  replaces it. A state is four charges and a mass in a field of characteristic zero; conjugation turns the sign
  of the charges and keeps the mass; a reading is any function of the state. The fixed set, the blindness of every
  odd reading, the visible half forced by two nulls, the anomaly sums of one generation with a pair of singlets,
  the mass term that pairs a field with itself, and the floor of the equation of state are theorems on Mathlib.
DESIGN. Parts, in order.
    Part I    States and conjugation. `conj_involutive`, `fixed_iff`, `fixed_iff_visible_and_dark`.
    Part II   Readings. `odd_readings_are_blind`, `dark_is_fixed`, `only_the_mass_is_read`.
    Part III  The visible half. `neutral_is_not_dark`, `the_two_nulls_force_the_visible_half`,
              `a_bound_inside_one_quantum_is_a_zero`, `a_bound_at_a_measured_coupling_is_a_zero`,
              `a_free_coupling_meets_every_bound`.
    Part IV   `weight_zero_iff_fixed`. A triplet: `one_member_of_a_triplet_is_fixed`.
    Part V    Records that forget. `no_reading_returns_what_the_record_forgets`,
              `gravity_does_not_read_identity`.
    Part VI   The anomaly sums. `one_generation_closes`, `a_pair_of_singlets_closes_iff`,
              `a_vector_like_pair_closes_for_every_charge`, `a_chiral_singlet_fails`,
              `the_visible_record_does_not_decide`.
    Part VII  `a_self_paired_mass_iff`. The side of the line: `conj_is_the_fold`.
    Part VIII The census of renormalizable terms. `portals_are_derived`, `a_stable_singlet_keeps_one_door`.
    Part IX   Acceleration, conditional and outside the premises. `the_vacuum_repels`, `the_floor`, `the_floor_is_exact`, `below_the_floor_is_a_ghost`,
              `the_floor_fails_at_negative_density`, `the_floor_is_additive`, `the_sign_is_read`.
    Part X    `Premises`; `dark_forced`; `darkPremises`; `the_posit_is_not_forced`.
WHAT IS NOT PROVED HERE (read before citing).
    (a) That the dark matter of the sky is a state of this kind. Its photon and Z nulls are measured bounds; its
        zero dark charge is a posit. Both are fields of `Premises`.
    (b) That the anomaly sums must vanish, and the weights in them. They are entered from field theory.
    (c) That the three tests of Part VIII are gauge invariance. They are necessary conditions; that they suffice
        for the terms of the census is classical and is entered.
    (d) That dark energy is canonical fields. It is not assumed. Part IX is conditional mathematics: what holds
        of canonical fields at positive density, and what a value below the floor would mean.
    (e) Every magnitude. None is derived.
RISK. The premises are over the real numbers. The census is finite and is decided by evaluation.
NON-NEGOTIABLE. No axiom is declared, no sorry. No headline theorem closes over a structure that carries its
  conclusion. The kernel line of every theorem the paper names is printed at the end.
-/
import Mathlib.Algebra.Field.Basic
import Mathlib.Algebra.CharZero.Defs
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Data.Real.Basic
import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Logic.Function.Basic
import Mathlib.Tactic.Ring
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity

namespace SPHYS.Dark

/-! ## Part I. States and conjugation -/

/-- A state: hypercharge `y`, weak isospin `t`, colour `c`, dark charge `d`, mass `m`. -/
@[ext] structure State (K : Type*) where
  y : K
  t : K
  c : K
  d : K
  m : K

variable {K : Type*} [Field K] [CharZero K]

/-- Conjugation turns the sign of the four charges and keeps the mass. -/
def conj (s : State K) : State K := ⟨-s.y, -s.t, -s.c, -s.d, s.m⟩
/-- Visible conjugation turns the three charges of the Standard Model only. -/
def conjV (s : State K) : State K := ⟨-s.y, -s.t, -s.c, s.d, s.m⟩
/-- Dark conjugation turns the dark charge only. -/
def conjD (s : State K) : State K := ⟨s.y, s.t, s.c, -s.d, s.m⟩

omit [CharZero K] in
theorem conj_involutive (s : State K) : conj (conj s) = s := by
  ext <;> simp [conj]

theorem two_ne : (2 : K) ≠ 0 := by
  have h : ((2 : ℕ) : K) ≠ 0 := Nat.cast_ne_zero.mpr (by decide)
  exact_mod_cast h

theorem neg_eq_self_iff' (a : K) : -a = a ↔ a = 0 := by
  constructor
  · intro h
    have h2 : (2 : K) * a = 0 := by linear_combination -h
    rcases mul_eq_zero.mp h2 with h3 | h3
    · exact absurd h3 two_ne
    · exact h3
  · rintro rfl; simp

/-- Conjugation fixes a state exactly when its four charges vanish. -/
theorem fixed_iff (s : State K) : conj s = s ↔ s.y = 0 ∧ s.t = 0 ∧ s.c = 0 ∧ s.d = 0 := by
  rw [State.ext_iff]
  simp only [conj, neg_eq_self_iff', and_true]

theorem visible_fixed_iff (s : State K) : conjV s = s ↔ s.y = 0 ∧ s.t = 0 ∧ s.c = 0 := by
  rw [State.ext_iff]
  simp only [conjV, neg_eq_self_iff', and_true]

theorem dark_fixed_iff (s : State K) : conjD s = s ↔ s.d = 0 := by
  rw [State.ext_iff]
  simp only [conjD, neg_eq_self_iff', and_true, true_and]

/-- The two halves: conjugation fixes a state exactly when visible conjugation fixes it and its dark charge
is zero. -/
theorem fixed_iff_visible_and_dark (s : State K) : conj s = s ↔ conjV s = s ∧ s.d = 0 := by
  rw [fixed_iff, visible_fixed_iff]; tauto

/-- The first fixed set lies strictly inside the second. -/
theorem the_dark_half_is_not_the_visible_half : ∃ s : State K, conjV s = s ∧ conj s ≠ s := by
  refine ⟨⟨0, 0, 0, 1, 1⟩, by simp [conjV], ?_⟩
  rw [Ne, fixed_iff]; simp

/-! ## Part II. Readings -/

/-- A reading is odd when conjugation turns its sign, and even when conjugation keeps it. -/
def Odd' (f : State K → K) : Prop := ∀ s, f (conj s) = -f s
def Even' {α : Type*} (f : State K → α) : Prop := ∀ s, f (conj s) = f s

/-- A charge-linear reading: a combination of the four charges. -/
def lin (a b k e : K) (s : State K) : K := a * s.y + b * s.t + k * s.c + e * s.d

omit [CharZero K] in
theorem every_linear_reading_is_odd (a b k e : K) : Odd' (lin a b k e) := by
  intro s; simp only [lin, conj]; ring

/-- Every odd reading, linear or not, returns zero on every state conjugation fixes. -/
theorem odd_readings_are_blind {f : State K → K} (hf : Odd' f) {s : State K} (hs : conj s = s) : f s = 0 := by
  have h := hf s
  rw [hs] at h
  exact (neg_eq_self_iff' (f s)).mp h.symm

/-- Dark is fixed: every charge-linear reading returns zero on a state exactly when conjugation fixes it. -/
theorem dark_is_fixed (s : State K) : (∀ a b k e : K, lin a b k e s = 0) ↔ conj s = s := by
  constructor
  · intro h
    rw [fixed_iff]
    refine ⟨?_, ?_, ?_, ?_⟩
    · simpa [lin] using h 1 0 0 0
    · simpa [lin] using h 0 1 0 0
    · simpa [lin] using h 0 0 1 0
    · simpa [lin] using h 0 0 0 1
  · intro h a b k e
    exact odd_readings_are_blind (every_linear_reading_is_odd a b k e) h

omit [CharZero K] in
theorem the_mass_is_even : Even' (fun s : State K => s.m) := fun _ => rfl

/-- A state that conjugation fixes is its mass: any reading at all, of any kind, takes one value on two fixed
states of one mass. -/
theorem only_the_mass_is_read {α : Type*} (f : State K → α) {s s' : State K}
    (hs : conj s = s) (hs' : conj s' = s') (hm : s.m = s'.m) : f s = f s' := by
  obtain ⟨a, b, c, d⟩ := (fixed_iff s).mp hs
  obtain ⟨a', b', c', d'⟩ := (fixed_iff s').mp hs'
  have : s = s' := by ext <;> simp [*]
  rw [this]

/-! ## Part III. The visible half -/

/-- Electric charge, and the reading of the Z at mixing weight `w`. -/
def charge (s : State K) : K := s.t + s.y
def zed (w : K) (s : State K) : K := s.t - w * charge s

omit [CharZero K] in
theorem zed_is_odd (w : K) : Odd' (zed w) := by
  intro s; simp only [zed, charge, conj]; ring

/-- Neutral is not dark: the charges of a neutrino give zero electric charge, a Z reading of one half at every
mixing weight, and a state that conjugation moves. -/
theorem neutral_is_not_dark (w m : K) :
    charge (⟨-(1 / 2), 1 / 2, 0, 0, m⟩ : State K) = 0 ∧ zed w (⟨-(1 / 2), 1 / 2, 0, 0, m⟩ : State K) = 1 / 2 ∧
    conj (⟨-(1 / 2), 1 / 2, 0, 0, m⟩ : State K) ≠ ⟨-(1 / 2), 1 / 2, 0, 0, m⟩ := by
  refine ⟨by simp [charge], by simp [zed, charge], ?_⟩
  rw [Ne, fixed_iff]; norm_num

omit [CharZero K] in
/-- The two nulls force the visible half: at any mixing weight, zero electric charge and a zero Z reading give
zero isospin and zero hypercharge. -/
theorem the_two_nulls_force_the_visible_half (w : K) {s : State K} (hq : charge s = 0) (hz : zed w s = 0) :
    s.t = 0 ∧ s.y = 0 := by
  have ht : s.t = 0 := by
    have := hz; simp only [zed, hq, mul_zero, sub_zero] at this; exact this
  refine ⟨ht, ?_⟩
  have := hq; simp only [charge, ht, zero_add] at this; exact this

theorem the_nulls_and_no_colour_fix_the_visible_half (w : K) {s : State K} (hq : charge s = 0)
    (hz : zed w s = 0) (hc : s.c = 0) : conjV s = s := by
  obtain ⟨a, b⟩ := the_two_nulls_force_the_visible_half w hq hz
  exact (visible_fixed_iff s).mpr ⟨b, a, hc⟩

/-- A charge counted in whole quanta and bounded strictly inside one quantum is zero. -/
theorem a_bound_inside_one_quantum_is_a_zero (n : ℤ) (h : |n| < 1) : n = 0 := Int.abs_lt_one_iff.mp h

/-- With the coupling measured, a force bounded below the force of one quantum is the zero charge. -/
theorem a_bound_at_a_measured_coupling_is_a_zero {g : ℝ} (hg : 0 < g) (n : ℤ)
    (h : g * (n : ℝ) ^ 2 < g) : n = 0 := by
  have h1 : (n : ℝ) ^ 2 < 1 := by
    by_contra hc
    have : g * 1 ≤ g * (n : ℝ) ^ 2 := mul_le_mul_of_nonneg_left (not_lt.mp hc) hg.le
    linarith
  have h2 : (n ^ 2 : ℤ) < 1 := by exact_mod_cast h1
  have h3 : n ^ 2 = 0 := le_antisymm (by omega) (sq_nonneg n)
  exact pow_eq_zero_iff (two_ne_zero) |>.mp h3

/-- With the coupling free, every charge meets every positive bound at some positive coupling. -/
theorem a_free_coupling_meets_every_bound (n : ℤ) {ε : ℝ} (hε : 0 < ε) :
    ∃ g : ℝ, 0 < g ∧ g * (n : ℝ) ^ 2 < ε := by
  have hp : 0 < (n : ℝ) ^ 2 + 1 := by positivity
  refine ⟨ε / (2 * ((n : ℝ) ^ 2 + 1)), by positivity, ?_⟩
  rw [div_mul_eq_mul_div, div_lt_iff₀ (by positivity)]
  nlinarith [sq_nonneg (n : ℝ)]

/-! ## Part IV. Radiative weight, and a triplet -/

/-- The radiative weight: the sum of the squares of the charges. -/
def weight (s : State ℝ) : ℝ := s.y ^ 2 + s.t ^ 2 + s.c ^ 2 + s.d ^ 2

/-- The weight vanishes exactly on the fixed set. -/
theorem weight_zero_iff_fixed (s : State ℝ) : weight s = 0 ↔ conj s = s := by
  rw [fixed_iff]; unfold weight
  constructor
  · intro h
    have a := sq_nonneg s.y; have b := sq_nonneg s.t; have c := sq_nonneg s.c; have d := sq_nonneg s.d
    refine ⟨?_, ?_, ?_, ?_⟩ <;> exact pow_eq_zero_iff (two_ne_zero) |>.mp (by linarith)
  · rintro ⟨a, b, c, d⟩; rw [a, b, c, d]; ring

/-- A state with a dark charge of one and no visible charge has no visible weight and a weight of one. -/
theorem a_dark_charge_radiates_dark_only (m : ℝ) :
    (⟨0, 0, 0, 1, m⟩ : State ℝ).y ^ 2 + (⟨0, 0, 0, 1, m⟩ : State ℝ).t ^ 2 + (⟨0, 0, 0, 1, m⟩ : State ℝ).c ^ 2 = 0
    ∧ weight ⟨0, 0, 0, 1, m⟩ = 1 := by
  constructor <;> norm_num [weight]

/-- A triplet of isospin without hypercharge: exactly the middle member is fixed. -/
theorem one_member_of_a_triplet_is_fixed (m : K) (t : K) :
    conj (⟨0, t, 0, 0, m⟩ : State K) = ⟨0, t, 0, 0, m⟩ ↔ t = 0 := by
  rw [fixed_iff]; simp

/-! ## Part V. Records that forget -/

/-- If two worlds leave one record and carry different labels, no function of the record returns the label. -/
theorem no_reading_returns_what_the_record_forgets {W R L : Type*} (rec : W → R) (lab : W → L) {a b : W}
    (h : rec a = rec b) (hl : lab a ≠ lab b) : ¬ ∃ f : R → L, ∀ w, f (rec w) = lab w := by
  rintro ⟨f, hf⟩
  exact hl (by rw [← hf a, ← hf b, h])

omit [CharZero K] in
/-- Two fixed states of one mass and different names: no reading of the state returns the name. -/
theorem gravity_does_not_read_identity {L : Type*} (name : Bool → L) (hn : name true ≠ name false) (m : K) :
    ¬ ∃ f : State K → L, ∀ b : Bool, f (⟨0, 0, 0, 0, m⟩ : State K) = name b := by
  rintro ⟨f, hf⟩
  exact hn ((hf true).symm.trans (hf false))

/-! ## Part VI. The anomaly sums -/

/-- A left-handed Weyl field: the sizes of its colour and isospin multiplets, their indices, the cubic colour
coefficient, its hypercharge and its dark charge, and its count of isospin doublets. -/
structure Weyl (K : Type*) where
  n3 : K
  n2 : K
  i3 : K
  i2 : K
  a3 : K
  y : K
  d : K
  dbl : ℕ

def tot (f : Weyl K → K) (l : List (Weyl K)) : K := (l.map f).sum

omit [CharZero K] in
theorem tot_append (f : Weyl K → K) (l l' : List (Weyl K)) : tot f (l ++ l') = tot f l + tot f l' := by
  simp [tot]

/-- The eleven sums, and the count of doublets. Five read the Standard Model alone; six read the dark charge. -/
def Closes (l : List (Weyl K)) : Prop :=
  tot (fun w => w.n2 * w.a3) l = 0 ∧ tot (fun w => w.n2 * w.i3 * w.y) l = 0 ∧
  tot (fun w => w.n3 * w.i2 * w.y) l = 0 ∧ tot (fun w => w.n3 * w.n2 * w.y ^ 3) l = 0 ∧
  tot (fun w => w.n3 * w.n2 * w.y) l = 0 ∧
  tot (fun w => w.n3 * w.n2 * w.d ^ 3) l = 0 ∧ tot (fun w => w.n3 * w.n2 * w.d) l = 0 ∧
  tot (fun w => w.n3 * w.n2 * w.d ^ 2 * w.y) l = 0 ∧ tot (fun w => w.n3 * w.n2 * w.d * w.y ^ 2) l = 0 ∧
  tot (fun w => w.n2 * w.i3 * w.d) l = 0 ∧ tot (fun w => w.n3 * w.i2 * w.d) l = 0 ∧
  Even ((l.map Weyl.dbl).sum)

/-- One generation, left-handed, with no dark charge: the quark doublet, the two conjugate quarks, the lepton
doublet and the conjugate electron. -/
def gen : List (Weyl K) :=
  [⟨3, 2, 1 / 2, 1 / 2, 1, 1 / 6, 0, 3⟩, ⟨3, 1, 1 / 2, 0, -1, -(2 / 3), 0, 0⟩, ⟨3, 1, 1 / 2, 0, -1, 1 / 3, 0, 0⟩,
   ⟨1, 2, 0, 1 / 2, 0, -(1 / 2), 0, 1⟩, ⟨1, 1, 0, 0, 0, 1, 0, 0⟩]

/-- A singlet of the Standard Model with dark charge `q`. -/
def singlet (q : K) : Weyl K := ⟨1, 1, 0, 0, 0, 0, q, 0⟩

theorem one_generation_closes : Closes (gen : List (Weyl K)) := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ⟨2, rfl⟩⟩ <;>
    (simp only [tot, gen, List.map, List.sum_cons, List.sum_nil]; norm_num)

/-- One generation with two singlets of dark charges `a` and `b` closes exactly when `a + b = 0`. -/
theorem a_pair_of_singlets_closes_iff (a b : K) :
    Closes (gen ++ [singlet a, singlet b] : List (Weyl K)) ↔ a + b = 0 := by
  obtain ⟨g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12⟩ := one_generation_closes (K := K)
  have e : ∀ (f : Weyl K → K) (u v : Weyl K), tot f [u, v] = f u + f v := by
    intro f u v; simp [tot]
  unfold Closes
  simp only [tot_append, e, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, singlet, zero_add]
  constructor
  · intro h
    have := h.2.2.2.2.2.2.1
    linear_combination this
  · intro h
    have hb : b = -a := by linear_combination h
    subst hb
    refine ⟨by ring, by ring, by ring, by ring, by ring, by ring, by ring, by ring, by ring, by ring, by ring, ?_⟩
    simpa [List.map_append, List.sum_append, singlet] using g12

/-- The fifth is free: a vector-like pair closes for every dark charge. -/
theorem a_vector_like_pair_closes_for_every_charge (q : K) :
    Closes (gen ++ [singlet q, singlet (-q)] : List (Weyl K)) :=
  (a_pair_of_singlets_closes_iff q (-q)).mpr (by ring)

/-- One chiral singlet with a dark charge fails. -/
theorem a_chiral_singlet_fails {q : K} (hq : q ≠ 0) : ¬ Closes (gen ++ [singlet q, singlet 0] : List (Weyl K)) := by
  rw [a_pair_of_singlets_closes_iff]; simpa using hq

/-- The visible record of a field: everything but its dark charge. -/
def visible (w : Weyl K) : K × K × K × K × K × K × ℕ := (w.n3, w.n2, w.i3, w.i2, w.a3, w.y, w.dbl)

/-- Two worlds that both close, one with no dark charge and one with a dark charge, leave one visible record:
no function of the visible record says whether a dark charge exists. -/
theorem the_visible_record_does_not_decide :
    Closes (gen ++ [singlet 0, singlet 0] : List (Weyl K)) ∧
    Closes (gen ++ [singlet 1, singlet (-1)] : List (Weyl K)) ∧
    (gen ++ [singlet 0, singlet 0] : List (Weyl K)).map visible
      = (gen ++ [singlet 1, singlet (-1)] : List (Weyl K)).map visible ∧
    ¬ ∃ f : List (K × K × K × K × K × K × ℕ) → Prop, ∀ l : List (Weyl K), f (l.map visible) ↔ ∃ w ∈ l, w.d ≠ 0 := by
  have hrec : (gen ++ [singlet 0, singlet 0] : List (Weyl K)).map visible
      = (gen ++ [singlet 1, singlet (-1)] : List (Weyl K)).map visible := by
    simp [visible, singlet]
  refine ⟨by simpa using a_vector_like_pair_closes_for_every_charge (0 : K),
    a_vector_like_pair_closes_for_every_charge 1, hrec, ?_⟩
  rintro ⟨f, hf⟩
  have a0 : ¬ ∃ w ∈ (gen ++ [singlet 0, singlet 0] : List (Weyl K)), w.d ≠ 0 := by
    simp [gen, singlet]
  have a1 : ∃ w ∈ (gen ++ [singlet 1, singlet (-1)] : List (Weyl K)), w.d ≠ 0 :=
    ⟨singlet 1, by simp, by simp [singlet]⟩
  have h1 := (hf _).mpr a1
  rw [← hrec] at h1
  exact a0 ((hf _).mp h1)

/-! ## Part VII. The mass term that pairs a field with itself; the side of the line -/

/-- A mass term that pairs a field with itself carries twice each abelian charge. It is allowed exactly when
hypercharge and dark charge vanish. -/
theorem a_self_paired_mass_iff (s : State K) : (2 * s.y = 0 ∧ 2 * s.d = 0) ↔ (s.y = 0 ∧ s.d = 0) := by
  constructor
  · rintro ⟨a, b⟩
    exact ⟨(mul_eq_zero.mp a).resolve_left two_ne, (mul_eq_zero.mp b).resolve_left two_ne⟩
  · rintro ⟨a, b⟩; rw [a, b]; simp

/-- On the visible fixed set, a self-paired mass is allowed exactly when conjugation fixes the state. -/
theorem on_the_visible_half_self_paired_iff_fixed {s : State K} (hv : conjV s = s) :
    (2 * s.y = 0 ∧ 2 * s.d = 0) ↔ conj s = s := by
  obtain ⟨a, b, c⟩ := (visible_fixed_iff s).mp hv
  rw [a_self_paired_mass_iff, fixed_iff]; tauto

omit [CharZero K] in
/-- A pair of opposite dark charges carries none in total: a mass term that pairs the two is allowed. -/
theorem a_pair_takes_its_mass_together (q : K) : q + -q = 0 := by ring

/-- The point of a state on the plane: its dark charge beside the line `h = 1`, its mass as height. -/
def point (s : State K) : K × K := (1 + s.d, s.m)
/-- The fold of the plane across the line `h = 1`. -/
def fold (p : K × K) : K × K := (2 - p.1, p.2)

omit [CharZero K] in
/-- Conjugation is carried to the fold. -/
theorem conj_is_the_fold (s : State K) : point (conj s) = fold (point s) := by
  simp only [point, conj, fold]; ext <;> simp; ring

/-- A state lies on the line exactly when its dark charge is zero. -/
theorem on_the_line_iff (s : State K) : fold (point s) = point s ↔ s.d = 0 := by
  simp only [point, fold, Prod.mk.injEq, and_true]
  constructor
  · intro h
    have h2 : (2 : K) * s.d = 0 := by linear_combination -h
    exact (mul_eq_zero.mp h2).resolve_left two_ne
  · intro h; rw [h]; ring

/-! ## Part VIII. The census of renormalizable terms -/

/-- A field of the census: the five left-handed Weyl fermions of one generation, the Higgs doublet, a real
singlet scalar `S` and a singlet Weyl fermion `N`. -/
inductive Fld | Q | uc | dc | L | ec | H | S | N
  deriving DecidableEq, Repr

/-- Hypercharge in sixths. -/
def Fld.y6 : Fld → Int
  | .Q => 1 | .uc => -4 | .dc => 2 | .L => -3 | .ec => 6 | .H => 3 | .S => 0 | .N => 0
def Fld.tri : Fld → Int
  | .Q => 1 | .uc => -1 | .dc => -1 | _ => 0
def Fld.doublet : Fld → Bool
  | .Q => true | .L => true | .H => true | _ => false
def Fld.darkF : Fld → Bool
  | .S => true | .N => true | _ => false

/-- A leg of a term: a field and whether it enters conjugated. -/
abbrev Leg := Fld × Bool
def legY (l : Leg) : Int := if l.2 then -l.1.y6 else l.1.y6
def legTri (l : Leg) : Int := if l.2 then -l.1.tri else l.1.tri
def sumI : List Int → Int
  | [] => 0
  | x :: t => x + sumI t

/-- The three tests of a term: its hypercharge sums to zero, its colour triality is zero modulo three, and its
doublets pair. -/
def passes (m : List Leg) : Bool :=
  sumI (m.map legY) == 0 && sumI (m.map legTri) % 3 == 0 && (m.filter (fun l => l.1.doublet)).length % 2 == 0

/-- A portal: a term that passes, with a dark leg and a leg of the Standard Model. -/
def portal (m : List Leg) : Bool :=
  passes m && m.any (fun l => l.1.darkF) && m.any (fun l => !l.1.darkF)

def scal : List Leg := [(.H, false), (.H, true), (.S, false)]
def fer : List Fld := [.Q, .uc, .dc, .L, .ec, .N]

/-- Every renormalizable term without derivatives that can be a Lorentz scalar: two to four scalars, or two Weyl
fermions of one chirality with at most one scalar. 6 + 10 + 15 + 168 = 199 terms. -/
def census : List (List Leg) :=
  (List.range 3).flatMap (fun i => (List.range 3).flatMap (fun j =>
    if i ≤ j then [[scal.getD i (.S, false), scal.getD j (.S, false)]] else [])) ++
  (List.range 3).flatMap (fun i => (List.range 3).flatMap (fun j => (List.range 3).flatMap (fun k =>
    if i ≤ j ∧ j ≤ k then [[scal.getD i (.S, false), scal.getD j (.S, false), scal.getD k (.S, false)]]
    else []))) ++
  (List.range 3).flatMap (fun i => (List.range 3).flatMap (fun j => (List.range 3).flatMap (fun k =>
    (List.range 3).flatMap (fun l => if i ≤ j ∧ j ≤ k ∧ k ≤ l then
      [[scal.getD i (.S, false), scal.getD j (.S, false), scal.getD k (.S, false), scal.getD l (.S, false)]]
      else [])))) ++
  (List.range 6).flatMap (fun i => (List.range 6).flatMap (fun j => [false, true].flatMap (fun cj =>
    if i ≤ j then ([[], [(.H, false)], [(.H, true)], [(.S, false)]] : List (List Leg)).map
      (fun o => [(fer.getD i .N, cj), (fer.getD j .N, cj)] ++ o) else [])))

set_option maxRecDepth 200000 in
/-- Of the 199 terms, exactly four are portals: `S H†H`, `S² H†H`, and `L N H` with its conjugate. -/
theorem portals_are_derived :
    census.length = 199 ∧ (census.filter portal).length = 4 ∧
    [(Fld.H, false), (Fld.H, true), (Fld.S, false)] ∈ census.filter portal ∧
    [(Fld.H, false), (Fld.H, true), (Fld.S, false), (Fld.S, false)] ∈ census.filter portal ∧
    [(Fld.L, false), (Fld.N, false), (Fld.H, false)] ∈ census.filter portal ∧
    [(Fld.L, true), (Fld.N, true), (Fld.H, true)] ∈ census.filter portal := by decide

/-- The number of legs of one field in a term. -/
def count (f : Fld) (m : List Leg) : Nat := (m.filter (fun l => l.1 == f)).length
/-- Even under the parity that keeps the dark matter stable: an even number of `S` legs and of `N` legs. -/
def evenDark (m : List Leg) : Bool := count .S m % 2 == 0 && count .N m % 2 == 0

set_option maxRecDepth 200000 in
/-- Under that parity exactly one portal survives, `S² H†H`, and none with the fermion. -/
theorem a_stable_singlet_keeps_one_door :
    (census.filter (fun m => portal m && evenDark m)).length = 1 ∧
    [(Fld.H, false), (Fld.H, true), (Fld.S, false), (Fld.S, false)] ∈ census.filter (fun m => portal m && evenDark m) ∧
    (census.filter (fun m => portal m && evenDark m && (count .N m != 0))).length = 0 := by decide

/-! ## Part IX. Acceleration -/

/-- The active density that the acceleration reads: density plus three times the pressure. -/
def active (ρ p : ℝ) : ℝ := ρ + 3 * p

theorem the_vacuum_repels (ρ : ℝ) : active ρ (-ρ) = -2 * ρ := by unfold active; ring
theorem dust_and_radiation_attract {ρ : ℝ} (h : 0 < ρ) : 0 < active ρ 0 ∧ 0 < active ρ (ρ / 3) := by
  unfold active; constructor <;> linarith
theorem repulsion_iff (ρ p : ℝ) : active ρ p < 0 ↔ 3 * p < -ρ := by unfold active; constructor <;> intro h <;> linarith

/-- A canonical field of kinetic density `K` and potential `V` has density `K + V` and pressure `K - V`. -/
theorem density_plus_pressure (K V : ℝ) : (K + V) + (K - V) = 2 * K := by ring

/-- The floor: with `K ≥ 0` and positive density, the equation of state is at least minus one. -/
theorem the_floor {K V : ℝ} (hK : 0 ≤ K) (hρ : 0 < K + V) : -1 ≤ (K - V) / (K + V) := by
  rw [le_div_iff₀ hρ]; linarith

/-- It is minus one exactly for the frozen field. -/
theorem the_floor_is_exact {K V : ℝ} (hρ : 0 < K + V) : (K - V) / (K + V) = -1 ↔ K = 0 := by
  rw [div_eq_iff hρ.ne']
  constructor <;> intro h <;> linarith

/-- Below the floor at positive density, the kinetic density is negative. -/
theorem below_the_floor_is_a_ghost {K V : ℝ} (hρ : 0 < K + V) (h : (K - V) / (K + V) < -1) : K < 0 := by
  rw [div_lt_iff₀ hρ] at h; linarith

/-- At negative density the floor fails. -/
theorem the_floor_fails_at_negative_density : ((1 : ℝ) - -3) / (1 + -3) < -1 := by norm_num

/-- The floor is additive: any number of canonical fields with positive total density stays at or above it. -/
theorem the_floor_is_additive {n : ℕ} (K V : Fin n → ℝ) (hK : ∀ j, 0 ≤ K j) (hρ : 0 < ∑ j, (K j + V j)) :
    -1 ≤ (∑ j, (K j - V j)) / (∑ j, (K j + V j)) := by
  rw [le_div_iff₀ hρ]
  have h : ∑ j, (K j - V j) + ∑ j, (K j + V j) = 2 * ∑ j, K j := by
    rw [← Finset.sum_add_distrib, Finset.mul_sum]
    exact Finset.sum_congr rfl (fun j _ => by ring)
  have h2 : 0 ≤ ∑ j, K j := Finset.sum_nonneg (fun j _ => hK j)
  linarith

/-- The deceleration of a flat world of matter and vacuum. -/
noncomputable def decel (Ωm ΩΛ : ℝ) : ℝ := Ωm / 2 - ΩΛ

/-- The sign is read: all matter decelerates, and the measured budget accelerates. -/
theorem the_sign_is_read : 0 < decel 1 0 ∧ decel 0.3153 0.6847 < 0 := by
  unfold decel; constructor <;> norm_num

/-! ## Part X. The premises -/

/-- The physical premises of the paper. -/
structure Premises where
  /-- the mixing weight -/
  w : ℝ
  /-- the members of the multiplets of the dark matter -/
  n : ℕ
  member : Fin n → State ℝ
  /-- measured: no member answers the photon or the Z, and none is coloured -/
  photon : ∀ k, charge (member k) = 0
  zboson : ∀ k, zed w (member k) = 0
  colourless : ∀ k, (member k).c = 0
  /-- the posit: no member carries a dark charge -/
  posit : ∀ k, (member k).d = 0

/-- On the premises: conjugation fixes every member; every odd reading of a member is zero; a member radiates
through no charge; and a self-paired mass is allowed. -/
theorem dark_forced (P : Premises) :
    (∀ k, conj (P.member k) = P.member k) ∧
    (∀ k (f : State ℝ → ℝ), Odd' f → f (P.member k) = 0) ∧
    (∀ k, weight (P.member k) = 0) ∧
    (∀ k, 2 * (P.member k).y = 0 ∧ 2 * (P.member k).d = 0) := by
  have fx : ∀ k, conj (P.member k) = P.member k := fun k =>
    (fixed_iff_visible_and_dark _).mpr
      ⟨the_nulls_and_no_colour_fix_the_visible_half P.w (P.photon k) (P.zboson k) (P.colourless k), P.posit k⟩
  refine ⟨fx, fun k f hf => odd_readings_are_blind hf (fx k), fun k => (weight_zero_iff_fixed _).mpr (fx k),
    fun k => ?_⟩
  obtain ⟨a, -, -, d⟩ := (fixed_iff _).mp (fx k)
  rw [a, d]; simp

/-- The premises are met: one massive singlet. -/
noncomputable def darkPremises : Premises where
  w := 0.2312
  n := 1
  member := fun _ => ⟨0, 0, 0, 0, 1⟩
  photon := fun _ => by simp [charge]
  zboson := fun _ => by simp [zed, charge]
  colourless := fun _ => rfl
  posit := fun _ => rfl

/-- The posit is not forced: a state passes every measured field of the premises and carries a dark charge. -/
theorem the_posit_is_not_forced (w : ℝ) :
    ∃ s : State ℝ, charge s = 0 ∧ zed w s = 0 ∧ s.c = 0 ∧ s.d ≠ 0 ∧ conj s ≠ s :=
  ⟨⟨0, 0, 0, 1, 1⟩, by simp [charge], by simp [zed, charge], rfl, by norm_num, by rw [Ne, fixed_iff]; norm_num⟩

end SPHYS.Dark

#print axioms SPHYS.Dark.conj_involutive
#print axioms SPHYS.Dark.two_ne
#print axioms SPHYS.Dark.neg_eq_self_iff'
#print axioms SPHYS.Dark.fixed_iff
#print axioms SPHYS.Dark.visible_fixed_iff
#print axioms SPHYS.Dark.dark_fixed_iff
#print axioms SPHYS.Dark.fixed_iff_visible_and_dark
#print axioms SPHYS.Dark.the_dark_half_is_not_the_visible_half
#print axioms SPHYS.Dark.every_linear_reading_is_odd
#print axioms SPHYS.Dark.odd_readings_are_blind
#print axioms SPHYS.Dark.dark_is_fixed
#print axioms SPHYS.Dark.the_mass_is_even
#print axioms SPHYS.Dark.only_the_mass_is_read
#print axioms SPHYS.Dark.zed_is_odd
#print axioms SPHYS.Dark.neutral_is_not_dark
#print axioms SPHYS.Dark.the_two_nulls_force_the_visible_half
#print axioms SPHYS.Dark.the_nulls_and_no_colour_fix_the_visible_half
#print axioms SPHYS.Dark.a_bound_inside_one_quantum_is_a_zero
#print axioms SPHYS.Dark.a_bound_at_a_measured_coupling_is_a_zero
#print axioms SPHYS.Dark.a_free_coupling_meets_every_bound
#print axioms SPHYS.Dark.weight_zero_iff_fixed
#print axioms SPHYS.Dark.a_dark_charge_radiates_dark_only
#print axioms SPHYS.Dark.one_member_of_a_triplet_is_fixed
#print axioms SPHYS.Dark.no_reading_returns_what_the_record_forgets
#print axioms SPHYS.Dark.gravity_does_not_read_identity
#print axioms SPHYS.Dark.tot_append
#print axioms SPHYS.Dark.one_generation_closes
#print axioms SPHYS.Dark.a_pair_of_singlets_closes_iff
#print axioms SPHYS.Dark.a_vector_like_pair_closes_for_every_charge
#print axioms SPHYS.Dark.a_chiral_singlet_fails
#print axioms SPHYS.Dark.the_visible_record_does_not_decide
#print axioms SPHYS.Dark.a_self_paired_mass_iff
#print axioms SPHYS.Dark.on_the_visible_half_self_paired_iff_fixed
#print axioms SPHYS.Dark.a_pair_takes_its_mass_together
#print axioms SPHYS.Dark.conj_is_the_fold
#print axioms SPHYS.Dark.on_the_line_iff
#print axioms SPHYS.Dark.portals_are_derived
#print axioms SPHYS.Dark.a_stable_singlet_keeps_one_door
#print axioms SPHYS.Dark.the_vacuum_repels
#print axioms SPHYS.Dark.dust_and_radiation_attract
#print axioms SPHYS.Dark.repulsion_iff
#print axioms SPHYS.Dark.density_plus_pressure
#print axioms SPHYS.Dark.the_floor
#print axioms SPHYS.Dark.the_floor_is_exact
#print axioms SPHYS.Dark.below_the_floor_is_a_ghost
#print axioms SPHYS.Dark.the_floor_fails_at_negative_density
#print axioms SPHYS.Dark.the_floor_is_additive
#print axioms SPHYS.Dark.the_sign_is_read
#print axioms SPHYS.Dark.dark_forced
#print axioms SPHYS.Dark.the_posit_is_not_forced
#print axioms SPHYS.Dark.darkPremises
