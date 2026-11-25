/-
SPHYS_Charge_Closure_CC.lean · the charges of one generation of matter forced by four sums, on real algebra
RATIONALE. The engine of edition 1.0.0 proved its statements over the integers. This file replaces it. A table of
  five hypercharges is a point of a field of characteristic zero; the four sums are polynomials in it; the solutions
  are found, all of them, with the converse proved; a registration is a map with a fold, as in the companion file
  on the record.
DESIGN. Parts, in order.
    Part I    The table and the four sums. `Closes`.
    Part II   `closure_forces_the_table`: the three cases. `the_observed_table_closes`,
              `the_renamed_table_closes`, `the_idle_table_closes`. `closes_iff`.
    Part III  `every_multiple_closes`; `the_unit_from_one_charge`.
    Part IV   Electric charge. `the_atom_is_neutral`, `the_observed_charges`.
    Part V    Generations. `partial_sums_zero`, `a_total_can_hide_a_failure`.
    Part VI   Labels. `conserved_iff_read`, `no_conserved_label_is_unread`, `the_side_is_unread`.
    Part VII  `Premises`; `charges_forced`; `chargePremises`.
WHAT IS NOT PROVED HERE (read before citing).
    (a) That the four sums must vanish. In field theory they are the conditions for the readings of the weak field,
        the strong field, gravity and the hypercharge field to be consistent; the sums and their weights are
        classical and are entered. That they vanish in each generation at every threshold is a field of `Premises`.
    (b) That a label the record carries is a charge that a field reads. It is the reading of the paper.
    (c) The unit of charge, and the number of generations. They are measured.
RISK. The premises are over the rational numbers. No magnitude is derived.
NON-NEGOTIABLE. No axiom is declared, no sorry. No headline theorem closes over a structure that carries its
  conclusion. The kernel line of every theorem the paper names is printed at the end.
-/
import Mathlib.Algebra.Field.Basic
import Mathlib.Algebra.CharZero.Defs
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Data.Rat.Defs
import Mathlib.Algebra.Order.Field.Rat
import Mathlib.Logic.Function.Basic
import Mathlib.Tactic.Ring
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith

namespace SPHYS.Charges
open Finset

/-! ## Part I. The table and the four sums -/

/-- A table of the hypercharges of one generation: the quark doublet q, the right-handed up and down quarks u and
d, the lepton doublet l, and the right-handed electron e. -/
@[ext] structure Table (K : Type*) where
  q : K
  u : K
  d : K
  l : K
  e : K

section Sums
variable {K : Type*} [Field K]

/-- The weak field twice, the hypercharge once. -/
def s1 (T : Table K) : K := 3 * T.q + T.l
/-- The strong field twice, the hypercharge once. -/
def s2 (T : Table K) : K := 6 * T.q - 3 * T.u - 3 * T.d
/-- Gravity twice, the hypercharge once. -/
def s3 (T : Table K) : K := 6 * T.q + 2 * T.l - 3 * T.u - 3 * T.d - T.e
/-- The hypercharge three times. -/
def s4 (T : Table K) : K := 6 * T.q ^ 3 + 2 * T.l ^ 3 - 3 * T.u ^ 3 - 3 * T.d ^ 3 - T.e ^ 3

/-- A table closes when the four sums vanish. -/
def Closes (T : Table K) : Prop := s1 T = 0 ∧ s2 T = 0 ∧ s3 T = 0 ∧ s4 T = 0

/-- The observed table at the scale q. -/
def observed (q : K) : Table K := ⟨q, 4 * q, -2 * q, -3 * q, -6 * q⟩
/-- The observed table with the two right-handed quarks renamed. -/
def renamed (q : K) : Table K := ⟨q, -2 * q, 4 * q, -3 * q, -6 * q⟩
/-- A table in which only the right-handed quarks carry hypercharge, with opposite values. -/
def idle (u : K) : Table K := ⟨0, u, -u, 0, 0⟩

/-! ## Part II. Closure forces the table -/

theorem the_observed_table_closes (q : K) : Closes (observed q) := by
  unfold Closes s1 s2 s3 s4 observed; refine ⟨?_, ?_, ?_, ?_⟩ <;> ring
theorem the_renamed_table_closes (q : K) : Closes (renamed q) := by
  unfold Closes s1 s2 s3 s4 renamed; refine ⟨?_, ?_, ?_, ?_⟩ <;> ring
theorem the_idle_table_closes (u : K) : Closes (idle u) := by
  unfold Closes s1 s2 s3 s4 idle; refine ⟨?_, ?_, ?_, ?_⟩ <;> ring

variable [CharZero K]

/-- CLOSURE FORCES THE TABLE. If the four sums vanish, the lepton doublet is minus three times the quark doublet,
the right-handed electron minus six times, the two right-handed quarks sum to twice, and one of three cases
holds: the quark doublet carries no hypercharge; or the right-handed quarks carry four times and minus twice; or
minus twice and four times. -/
theorem closure_forces_the_table (T : Table K) (h : Closes T) :
    T.l = -3 * T.q ∧ T.e = -6 * T.q ∧ T.u + T.d = 2 * T.q
      ∧ (T.q = 0 ∨ (T.u = 4 * T.q ∧ T.d = -2 * T.q) ∨ (T.u = -2 * T.q ∧ T.d = 4 * T.q)) := by
  obtain ⟨q, u, d, l, e⟩ := T
  obtain ⟨h1, h2, h3, h4⟩ := h
  simp only [s1, s2, s3, s4] at h1 h2 h3 h4
  have hl : l = -3 * q := by linear_combination h1
  have hd : d = 2 * q - u := by linear_combination (-1 / 3 : K) * h2
  have he : e = -6 * q := by linear_combination (-1 : K) * h3 + 2 * h1 + h2
  refine ⟨hl, he, by rw [hd]; ring, ?_⟩
  subst hl hd he
  have key : (18 : K) * (q * ((u - 4 * q) * (u + 2 * q))) = 0 := by linear_combination (-1 : K) * h4
  have h18 : (18 : K) ≠ 0 := by norm_num
  rcases mul_eq_zero.mp ((mul_eq_zero.mp key).resolve_left h18) with hq | hu
  · exact Or.inl hq
  · rcases mul_eq_zero.mp hu with hu | hu
    · right; left
      have : u = 4 * q := by linear_combination hu
      exact ⟨this, by rw [this]; ring⟩
    · right; right
      have : u = -2 * q := by linear_combination hu
      exact ⟨this, by rw [this]; ring⟩

/-- THE TABLES THAT CLOSE, ALL OF THEM. A table closes exactly when it is an idle table, or the observed table at
some scale, or the renamed one. -/
theorem closes_iff (T : Table K) :
    Closes T ↔ (∃ u, T = idle u) ∨ (∃ q, T = observed q) ∨ (∃ q, T = renamed q) := by
  constructor
  · intro h
    obtain ⟨hl, he, hud, hc⟩ := closure_forces_the_table T h
    rcases hc with hq | ⟨hu, hd⟩ | ⟨hu, hd⟩
    · left
      refine ⟨T.u, ?_⟩
      ext <;> simp only [idle]
      · exact hq
      · linear_combination hud + 2 * hq
      · rw [hl, hq]; ring
      · rw [he, hq]; ring
    · right; left
      exact ⟨T.q, by ext <;> simp only [observed] <;> assumption⟩
    · right; right
      exact ⟨T.q, by ext <;> simp only [renamed] <;> assumption⟩
  · rintro (⟨u, rfl⟩ | ⟨q, rfl⟩ | ⟨q, rfl⟩)
    · exact the_idle_table_closes u
    · exact the_observed_table_closes q
    · exact the_renamed_table_closes q

/-- A CHARGED GENERATION CARRIES THE TABLE. If the four sums vanish and the quark doublet carries hypercharge, the
table is the observed one at the scale of the quark doublet, or its renaming. -/
theorem a_charged_generation_carries_the_table (T : Table K) (h : Closes T) (hq : T.q ≠ 0) :
    T = observed T.q ∨ T = renamed T.q := by
  obtain ⟨hl, he, _, hc⟩ := closure_forces_the_table T h
  rcases hc with h0 | ⟨hu, hd⟩ | ⟨hu, hd⟩
  · exact absurd h0 hq
  · left; ext <;> simp only [observed] <;> assumption
  · right; ext <;> simp only [renamed] <;> assumption

/-! ## Part III. The unit -/

omit [CharZero K] in
/-- EVERY MULTIPLE CLOSES. If a table closes, so does every multiple of it. The four sums fix no unit. -/
theorem every_multiple_closes (T : Table K) (c : K) (h : Closes T) :
    Closes ⟨c * T.q, c * T.u, c * T.d, c * T.l, c * T.e⟩ := by
  obtain ⟨h1, h2, h3, h4⟩ := h
  simp only [s1, s2, s3, s4] at h1 h2 h3 h4
  simp only [Closes, s1, s2, s3, s4]
  refine ⟨?_, ?_, ?_, ?_⟩
  · linear_combination c * h1
  · linear_combination c * h2
  · linear_combination c * h3
  · linear_combination c ^ 3 * h4

/-! ## Part IV. Electric charge -/

/-- The electric charge of a member of a doublet is its place in the doublet, plus or minus one half, plus its
hypercharge; of a right-handed field, its hypercharge. -/
def upCharge (T : Table K) : K := 1 / 2 + T.q
def downCharge (T : Table K) : K := -1 / 2 + T.q
def neutrinoCharge (T : Table K) : K := 1 / 2 + T.l
def electronCharge (T : Table K) : K := -1 / 2 + T.l
def protonCharge (T : Table K) : K := 2 * upCharge T + downCharge T
def neutronCharge (T : Table K) : K := upCharge T + 2 * downCharge T

omit [CharZero K] in
/-- THE ATOM IS NEUTRAL. If the first sum vanishes, the charges of the proton and the electron cancel, and so do
those of the neutron and the neutrino, whatever the scale. -/
theorem the_atom_is_neutral (T : Table K) (h : s1 T = 0) :
    protonCharge T + electronCharge T = 0 ∧ neutronCharge T + neutrinoCharge T = 0 := by
  unfold s1 at h
  unfold protonCharge neutronCharge upCharge downCharge electronCharge neutrinoCharge
  constructor <;> linear_combination h

/-- THE UNIT FROM ONE CHARGE. On the observed table, if the right-handed up quark carries the electric charge of
the up quark of the doublet, the scale is one sixth. -/
theorem the_unit_from_one_charge (q : K) (h : (observed q).u = upCharge (observed q)) : q = 1 / 6 := by
  simp only [observed, upCharge] at h
  linear_combination (1 / 3 : K) * h

/-- THE OBSERVED CHARGES. At the scale one sixth the charges of the up quark, the down quark, the neutrino, the
electron, the proton and the neutron are 2/3, -1/3, 0, -1, 1 and 0, and each right-handed field carries the
charge of its partner in a doublet. -/
theorem the_observed_charges :
    upCharge (observed (1 / 6 : K)) = 2 / 3 ∧ downCharge (observed (1 / 6 : K)) = -1 / 3
      ∧ neutrinoCharge (observed (1 / 6 : K)) = 0 ∧ electronCharge (observed (1 / 6 : K)) = -1
      ∧ protonCharge (observed (1 / 6 : K)) = 1 ∧ neutronCharge (observed (1 / 6 : K)) = 0
      ∧ (observed (1 / 6 : K)).u = upCharge (observed (1 / 6 : K))
      ∧ (observed (1 / 6 : K)).d = downCharge (observed (1 / 6 : K))
      ∧ (observed (1 / 6 : K)).e = electronCharge (observed (1 / 6 : K)) := by
  simp only [observed, upCharge, downCharge, neutrinoCharge, electronCharge, protonCharge, neutronCharge]
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩ <;> norm_num

end Sums

/-! ## Part V. Generations -/

/-- If every sum of the first k terms of a sequence vanishes, for k up to n, each of the first n terms vanishes. -/
theorem partial_sums_zero {K : Type*} [AddCommGroup K] (f : ℕ → K) (n : ℕ)
    (h : ∀ k, k ≤ n → ∑ i ∈ Finset.range k, f i = 0) (i : ℕ) (hi : i < n) : f i = 0 := by
  have a := h (i + 1) hi
  rw [Finset.sum_range_succ, h i hi.le, zero_add] at a
  exact a

/-- A TOTAL CAN HIDE A FAILURE. Two generations can each fail the first sum while their total satisfies it. -/
theorem a_total_can_hide_a_failure :
    ∃ T1 T2 : Table ℚ, s1 T1 ≠ 0 ∧ s1 T2 ≠ 0 ∧ s1 T1 + s1 T2 = 0 :=
  ⟨⟨1, 4, -2, -2, -6⟩, ⟨1, 4, -2, -4, -6⟩, by norm_num [s1], by norm_num [s1], by norm_num [s1]⟩

/-! ## Part VI. Labels -/

/-- A registration: a fold of the states that is its own inverse, and a map that gives two states one value
exactly when they are the same state or partners under the fold. -/
structure Registration (X Y : Type*) where
  fold : X → X
  involutive : Function.Involutive fold
  reg : X → Y
  spec : ∀ x y, reg x = reg y ↔ y = x ∨ y = fold x

section Labels
variable {X Y Z : Type*} (r : Registration X Y)

/-- A LABEL IS CONSERVED EXACTLY WHEN THE RECORD CARRIES IT. A label has the same value on every state and its
partner exactly when it has the same value on every two states with one registration. -/
theorem conserved_iff_read (L : X → Z) : (∀ x, L (r.fold x) = L x) ↔ Function.FactorsThrough L r.reg := by
  constructor
  · intro h a b hab
    rcases (r.spec a b).mp hab with rfl | rfl
    · rfl
    · exact (h a).symm
  · intro h x
    exact h ((r.spec x (r.fold x)).mpr (Or.inr rfl)).symm

/-- NO CONSERVED LABEL IS UNREAD. A conserved label is a function of the registration. -/
theorem no_conserved_label_is_unread [Nonempty Z] (L : X → Z) (h : ∀ x, L (r.fold x) = L x) :
    ∃ g : Y → Z, L = g ∘ r.reg :=
  (Function.factorsThrough_iff L).mp ((conserved_iff_read r L).mp h)

/-- THE SIDE IS UNREAD. A label that tells some state from its partner is not a function of the registration. -/
theorem the_side_is_unread (L : X → Z) (x : X) (h : L (r.fold x) ≠ L x) : ¬ ∃ g : Y → Z, L = g ∘ r.reg := by
  rintro ⟨g, rfl⟩
  apply h
  show g (r.reg (r.fold x)) = g (r.reg x)
  rw [((r.spec x (r.fold x)).mpr (Or.inr rfl))]

end Labels

/-! ## Part VII. The theorem -/

/-- The premises. There are n generations, each with a table of hypercharges. Each of the four sums, taken over
the first k generations, vanishes for every k up to n. The quark doublet of every generation carries hypercharge.
There is a registration, and the charge of a state is a label that the registration conserves. Nothing else is
assumed, and no charge is given. -/
structure Premises where
  n : ℕ
  T : ℕ → Table ℚ
  weak : ∀ k, k ≤ n → ∑ i ∈ Finset.range k, s1 (T i) = 0
  strong : ∀ k, k ≤ n → ∑ i ∈ Finset.range k, s2 (T i) = 0
  gravity : ∀ k, k ≤ n → ∑ i ∈ Finset.range k, s3 (T i) = 0
  hyper : ∀ k, k ≤ n → ∑ i ∈ Finset.range k, s4 (T i) = 0
  charged : ∀ i, i < n → (T i).q ≠ 0
  State : Type
  Value : Type
  reg : Registration State Value
  charge : State → ℚ
  conserved : ∀ x, charge (reg.fold x) = charge x

/-- EACH GENERATION CLOSES. -/
theorem each_generation_closes (P : Premises) (i : ℕ) (hi : i < P.n) : Closes (P.T i) :=
  ⟨partial_sums_zero _ P.n P.weak i hi, partial_sums_zero _ P.n P.strong i hi,
    partial_sums_zero _ P.n P.gravity i hi, partial_sums_zero _ P.n P.hyper i hi⟩

/-- THE CHARGES, FORCED. On the premises every generation carries the observed table at the scale of its own
quark doublet, or its renaming; its lepton doublet is minus three times its quark doublet and its right-handed
electron minus six times; and its atom is neutral. -/
theorem charges_forced (P : Premises) (i : ℕ) (hi : i < P.n) :
    (P.T i = observed (P.T i).q ∨ P.T i = renamed (P.T i).q)
      ∧ (P.T i).l = -3 * (P.T i).q ∧ (P.T i).e = -6 * (P.T i).q
      ∧ protonCharge (P.T i) + electronCharge (P.T i) = 0 := by
  have hc := each_generation_closes P i hi
  obtain ⟨hl, he, _, _⟩ := closure_forces_the_table (P.T i) hc
  exact ⟨a_charged_generation_carries_the_table (P.T i) hc (P.charged i hi), hl, he, (the_atom_is_neutral (P.T i) hc.1).1⟩

/-- NO CHARGE IS UNREAD. On the premises the charge is a function of the registration. -/
theorem no_charge_is_unread (P : Premises) : ∃ g : P.Value → ℚ, P.charge = g ∘ P.reg.reg :=
  no_conserved_label_is_unread P.reg P.charge P.conserved

/-- THE PREMISES ARE INHABITED. Three generations, each the observed table at the scale one sixth; two states that
the registration writes as one, with one charge. -/
def chargePremises : Premises where
  n := 3
  T := fun _ => observed (1 / 6)
  weak := fun k _ => by
    show ∑ _i ∈ Finset.range k, s1 (observed (1 / 6 : ℚ)) = 0
    rw [Finset.sum_const, (the_observed_table_closes (1 / 6 : ℚ)).1, smul_zero]
  strong := fun k _ => by
    show ∑ _i ∈ Finset.range k, s2 (observed (1 / 6 : ℚ)) = 0
    rw [Finset.sum_const, (the_observed_table_closes (1 / 6 : ℚ)).2.1, smul_zero]
  gravity := fun k _ => by
    show ∑ _i ∈ Finset.range k, s3 (observed (1 / 6 : ℚ)) = 0
    rw [Finset.sum_const, (the_observed_table_closes (1 / 6 : ℚ)).2.2.1, smul_zero]
  hyper := fun k _ => by
    show ∑ _i ∈ Finset.range k, s4 (observed (1 / 6 : ℚ)) = 0
    rw [Finset.sum_const, (the_observed_table_closes (1 / 6 : ℚ)).2.2.2, smul_zero]
  charged := fun _ _ => by simp [observed]
  State := Bool
  Value := Unit
  reg := { fold := not, involutive := Bool.not_not, reg := fun _ => (), spec := by decide }
  charge := fun _ => 1
  conserved := fun _ => rfl

end SPHYS.Charges

#print axioms SPHYS.Charges.the_observed_table_closes
#print axioms SPHYS.Charges.the_renamed_table_closes
#print axioms SPHYS.Charges.the_idle_table_closes
#print axioms SPHYS.Charges.closure_forces_the_table
#print axioms SPHYS.Charges.closes_iff
#print axioms SPHYS.Charges.a_charged_generation_carries_the_table
#print axioms SPHYS.Charges.every_multiple_closes
#print axioms SPHYS.Charges.the_atom_is_neutral
#print axioms SPHYS.Charges.the_unit_from_one_charge
#print axioms SPHYS.Charges.the_observed_charges
#print axioms SPHYS.Charges.partial_sums_zero
#print axioms SPHYS.Charges.a_total_can_hide_a_failure
#print axioms SPHYS.Charges.conserved_iff_read
#print axioms SPHYS.Charges.no_conserved_label_is_unread
#print axioms SPHYS.Charges.the_side_is_unread
#print axioms SPHYS.Charges.each_generation_closes
#print axioms SPHYS.Charges.charges_forced
#print axioms SPHYS.Charges.no_charge_is_unread
#print axioms SPHYS.Charges.chargePremises
