/-
Copyright (c) 2026 Anthropic, PBC. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
SPDX-License-Identifier: Apache-2.0
-/
-- SCREEN COPY: `import Mathlib` narrowed to the modules built on this machine; the four declarations that need
-- Laurent series (Approximates, MainTheoremApprox, VPBar, SeparationClosure) are omitted here, and are not tested.
import Mathlib.Algebra.MvPolynomial.Degrees
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.GroupTheory.Perm.Cycle.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Base
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Algebra.CharP.Defs
import Mathlib.Data.Real.Basic

/-!
# Superpolynomial lower bounds for the permanent and the Hamiltonian cycle polynomial

Definitions and statements, using Mathlib only. The proofs are in Solution.lean.
-/

open MvPolynomial

universe u

namespace Statement

/-- `f` has an arithmetic circuit with at most `s` gates: a list of `s` polynomials contains `f`, and each of
them is a variable, a constant, or the sum or product of two earlier ones (possibly the same one). Variables and
constants count as gates. -/
def Computes {R : Type u} {V : Type} [CommSemiring R] (f : MvPolynomial V R) (s : ℕ) : Prop :=
  ∃ l : ℕ → MvPolynomial V R,
    (∀ k < s, (∃ v : V, l k = X v) ∨ (∃ a : R, l k = C a) ∨
      (∃ i < k, ∃ j < k, l k = l i + l j) ∨ (∃ i < k, ∃ j < k, l k = l i * l j)) ∧
    ∃ k < s, l k = f

/-- The permanent of the generic `m × m` matrix. -/
noncomputable def perm (F : Type u) [CommSemiring F] (m : ℕ) : MvPolynomial (Fin m × Fin m) F :=
  ∑ σ : Equiv.Perm (Fin m), ∏ i, X (σ i, i)

open Classical in
/-- The Hamiltonian cycle polynomial: the sum over the permutations with a single cycle through all points. -/
noncomputable def hc (F : Type u) [CommSemiring F] (m : ℕ) : MvPolynomial (Fin m × Fin m) F :=
  ∑ σ : Equiv.Perm (Fin m) with σ.IsCycleOn Set.univ, ∏ i, X (i, σ i)

/-- More than `m ^ (c * (log₂ m) ^ (1/3))` gates. -/
def Beyond (c : ℝ) (m s : ℕ) : Prop := (m : ℝ) ^ (c * Real.logb 2 m ^ (1 / 3 : ℝ)) < s

/-- **Main theorem.** There is an absolute constant `c > 0`, and for each characteristic `p` an `m₀`, such
that over every field of characteristic `p` and for every `m ≥ m₀` every circuit for `hc m`, and for
`perm m` if `p ≠ 2`, has more than `m ^ (c * (log₂ m) ^ (1/3))` gates. -/
def MainTheorem : Prop :=
  ∃ c : ℝ, 0 < c ∧ ∀ p : ℕ, ∃ m₀ : ℕ, ∀ (F : Type u) [Field F] [CharP F p], ∀ m ≥ m₀, ∀ s : ℕ,
    (Computes (hc F m) s → Beyond c m s) ∧ (p ≠ 2 → Computes (perm F m) s → Beyond c m s)

/-! ### Valiant's classes -/

/-- A family of polynomials, with finitely many variables for every `n`. -/
structure Family (F : Type u) [CommSemiring F] where
  /-- the variables of the `n`-th polynomial -/
  vars : ℕ → Type
  /-- finitely many -/
  [fin : ∀ n, Fintype (vars n)]
  /-- the `n`-th polynomial -/
  poly : ∀ n, MvPolynomial (vars n) F

attribute [instance] Family.fin

/-- VP: the number of variables, the degree and the circuit size are polynomially bounded in `n`. -/
def VP (F : Type u) [CommSemiring F] : Set (Family F) :=
  {f | ∃ a : ℕ, ∀ n, Fintype.card (f.vars n) ≤ n ^ a + a ∧ (f.poly n).totalDegree ≤ n ^ a + a ∧
    Computes (f.poly n) (n ^ a + a)}

/-- VNP: the families `f n = ∑ g n (x, e)`, as polynomials, the sum over all vectors `e` of `r n` bits,
for some family `g` in VP. -/
def VNP (F : Type u) [CommSemiring F] : Set (Family F) :=
  {f | ∃ (r : ℕ → ℕ) (g : ∀ n, MvPolynomial (f.vars n ⊕ Fin (r n)) F),
    ({ vars := fun n => f.vars n ⊕ Fin (r n), poly := g } : Family F) ∈ VP F ∧
      ∀ n, f.poly n = ∑ e : Fin (r n) → Bool, aeval (Sum.elim X fun i => if e i then 1 else 0) (g n)}

/-- **VP ≠ VNP**: over every field VP is a proper subset of VNP. -/
def Separation : Prop := ∀ (F : Type u) [Field F], VP F ⊂ VNP F

end Statement


/-! ## CONVERSION · the one-bit architecture carried onto the VP / VNP row
RATIONALE. The definitions above are the release's own (Statement.lean), unedited apart from the narrowed import and
the four omitted Laurent-series declarations. This part states the bit of the Hamiltonian-cycle and permanent rows in
those words, proves the reduction of the HC route to the bit exactly, and reads their MainTheorem through it.
DESIGN. `TheBitHC F`: every polynomial bound n^a + a on the circuit size of hc is beaten at some m. `hc_route_iff_bit`:
the HC family is outside VP iff the bit holds (the reverse spends only form facts: degree, variable count, monotonicity).
`delivery_inhabits_the_bit`: MainTheorem gives the bit over every field, and the permanent's bit where 2 ≠ 0.
NOT PROVED HERE, named before the colon of `separation_from_bit`: VP ⊆ VNP and HC ∈ VNP in this system.
NON-NEGOTIABLE. No definition of the release is restated or weakened; the bit stays before the colon. -/
namespace Conversion
open Statement MvPolynomial

/-- FORM: a circuit with at most s gates is a circuit with at most t gates, for s ≤ t (pad with a constant gate). -/
theorem computes_mono {R : Type u} {V : Type} [CommSemiring R] {f : MvPolynomial V R} {s t : ℕ}
    (h : Computes f s) (hst : s ≤ t) : Computes f t := by
  obtain ⟨l, hl, k, hk, hf⟩ := h
  refine ⟨fun j => if j < s then l j else C 0, ?_, k, lt_of_lt_of_le hk hst, by simp [hk, hf]⟩
  intro j _
  by_cases hj : j < s
  · rcases hl j hj with ⟨v, hv⟩ | ⟨a, ha⟩ | ⟨i, hi, i', hi', h'⟩ | ⟨i, hi, i', hi', h'⟩
    · exact Or.inl ⟨v, by simp [hj, hv]⟩
    · exact Or.inr (Or.inl ⟨a, by simp [hj, ha]⟩)
    · exact Or.inr (Or.inr (Or.inl ⟨i, hi, i', hi', by simp [hj, lt_trans hi hj, lt_trans hi' hj, h']⟩))
    · exact Or.inr (Or.inr (Or.inr ⟨i, hi, i', hi', by simp [hj, lt_trans hi hj, lt_trans hi' hj, h']⟩))
  · exact Or.inr (Or.inl ⟨0, by simp [hj]⟩)

/-- FORM: every monomial of the Hamiltonian cycle polynomial is a product of m variables. -/
theorem hc_totalDegree_le (F : Type u) [CommSemiring F] (m : ℕ) : (hc F m).totalDegree ≤ m := by
  rcases subsingleton_or_nontrivial F with hS | hN
  · have : hc F m = 0 := Subsingleton.elim _ _
    simp [this]
  · unfold hc
    refine (totalDegree_finset_sum _ _).trans (Finset.sup_le fun σ _ => ?_)
    refine (totalDegree_finset_prod _ _).trans ?_
    simp [totalDegree_X]

/-- Arithmetic of the bounds. -/
theorem bounds (n a : ℕ) :
    n * n ≤ n ^ (a + 2) + (a + 2) ∧ n ≤ n ^ (a + 2) + (a + 2) ∧ n ^ a + a ≤ n ^ (a + 2) + (a + 2) := by
  rcases Nat.eq_zero_or_pos n with rfl | hn
  · refine ⟨by simp, by simp, ?_⟩
    have : 0 ^ a ≤ 1 := by cases a <;> simp
    simp; omega
  · have h1 : 1 ≤ n ^ a := Nat.one_le_pow _ _ hn
    have e : n ^ (a + 2) = n ^ a * (n * n) := by ring
    have h2 : n * n ≤ n ^ a * (n * n) := Nat.le_mul_of_pos_left _ h1
    have h3 : n ≤ n * n := Nat.le_mul_self n
    have h4 : n ^ a ≤ n ^ a * (n * n) := Nat.le_mul_of_pos_right _ (Nat.mul_pos hn hn)
    rw [e]; exact ⟨by omega, by omega, by omega⟩

/-- THE BIT of the Hamiltonian-cycle row over F: every polynomial circuit bound is beaten somewhere. -/
def TheBitHC (F : Type u) [Field F] : Prop := ∀ a : ℕ, ∃ m : ℕ, ¬ Computes (hc F m) (m ^ a + a)

/-- THE BIT of the permanent row over F. Stated for every field; it is delivered only where 2 ≠ 0. -/
def TheBitPerm (F : Type u) [Field F] : Prop := ∀ a : ℕ, ∃ m : ℕ, ¬ Computes (perm F m) (m ^ a + a)

/-- The Hamiltonian cycle polynomials as a family of the release's own type. -/
noncomputable def hcFamily (F : Type u) [CommSemiring F] : Family F :=
  { vars := fun n => Fin n × Fin n, poly := fun n => hc F n }

/-- THE REDUCTION IS EXACT: the HC family is outside VP if and only if the bit holds. -/
theorem hc_route_iff_bit (F : Type u) [Field F] : hcFamily F ∉ VP F ↔ TheBitHC F := by
  constructor
  · intro h a
    by_contra hcon
    have hall : ∀ m, Computes (hc F m) (m ^ a + a) := by
      intro m; by_contra hm; exact hcon ⟨m, hm⟩
    apply h
    refine ⟨a + 2, fun n => ⟨?_, ?_, ?_⟩⟩
    · have : Fintype.card ((hcFamily F).vars n) = n * n := by simp [hcFamily]
      rw [this]; exact (bounds n a).1
    · exact (hc_totalDegree_le F n).trans (bounds n a).2.1
    · exact computes_mono (hall n) (bounds n a).2.2
  · rintro h ⟨a, ha⟩
    obtain ⟨m, hm⟩ := h a
    exact hm (ha m).2.2

/-- THE MAIN LINE, the bit before the colon. The two form inputs are named and not proved in this file. -/
theorem separation_from_bit (F : Type u) [Field F] (sub : VP F ⊆ VNP F) (hVNP : hcFamily F ∈ VNP F)
    (bit : TheBitHC F) : VP F ⊂ VNP F :=
  ⟨sub, fun h => (hc_route_iff_bit F).mpr bit (h hVNP)⟩

/-- A superpolynomial lower bound beats every polynomial bound. -/
theorem beaten {P : ℕ → ℕ → Prop} (c : ℝ) (hc0 : 0 < c) (m₀ : ℕ)
    (h : ∀ m ≥ m₀, ∀ s, P m s → Beyond c m s) (a : ℕ) : ∃ m : ℕ, ¬ P m (m ^ a + a) := by
  set t : ℝ := ((a : ℝ) + 1) / c with ht
  have ht0 : 0 ≤ t := div_nonneg (by positivity) hc0.le
  obtain ⟨k0, hk0⟩ := exists_nat_ge (t ^ 3)
  let k := max k0 (max m₀ 1)
  have hkk0 : k0 ≤ k := le_max_left _ _
  have hkm : m₀ ≤ k := le_trans (le_max_left _ _) (le_max_right _ _)
  have hk1 : 1 ≤ k := le_trans (le_max_right _ _) (le_max_right _ _)
  have hklt : k < 2 ^ k := Nat.lt_two_pow_self
  refine ⟨2 ^ k, fun hP => ?_⟩
  have hB := h (2 ^ k) (le_trans hkm hklt.le) _ hP
  unfold Beyond at hB
  have hm2 : (2 : ℕ) ≤ 2 ^ k := by
    calc 2 = 2 ^ 1 := by norm_num
      _ ≤ 2 ^ k := Nat.pow_le_pow_right (by norm_num) hk1
  have hlog : Real.logb 2 ((2 ^ k : ℕ) : ℝ) = k := by
    push_cast; rw [Real.logb_pow]; simp
  have hkr : t ^ 3 ≤ (k : ℝ) := le_trans hk0 (by exact_mod_cast hkk0)
  have hroot : t ≤ (k : ℝ) ^ (1 / 3 : ℝ) := by
    have h1 : (t ^ 3) ^ (1 / 3 : ℝ) ≤ (k : ℝ) ^ (1 / 3 : ℝ) :=
      Real.rpow_le_rpow (by positivity) hkr (by norm_num)
    have h2 : (t ^ 3) ^ (1 / 3 : ℝ) = t := by
      have := Real.pow_rpow_inv_natCast ht0 (n := 3) (by norm_num)
      simpa [one_div] using this
    linarith
  have hexp : ((a : ℝ) + 1) ≤ c * Real.logb 2 ((2 ^ k : ℕ) : ℝ) ^ (1 / 3 : ℝ) := by
    rw [hlog]
    calc (a : ℝ) + 1 = c * t := by rw [ht]; field_simp
      _ ≤ c * (k : ℝ) ^ (1 / 3 : ℝ) := mul_le_mul_of_nonneg_left hroot hc0.le
  have hbase : (1 : ℝ) ≤ ((2 ^ k : ℕ) : ℝ) := by exact_mod_cast le_trans (by norm_num) hm2
  have hlow : ((2 ^ k : ℕ) : ℝ) ^ ((a : ℝ) + 1) ≤
      ((2 ^ k : ℕ) : ℝ) ^ (c * Real.logb 2 ((2 ^ k : ℕ) : ℝ) ^ (1 / 3 : ℝ)) :=
    Real.rpow_le_rpow_of_exponent_le hbase hexp
  have hnat : (2 ^ k) ^ a + a ≤ (2 ^ k) ^ (a + 1) := by
    have ha : a < (2 ^ k) ^ a := lt_of_lt_of_le Nat.lt_two_pow_self (Nat.pow_le_pow_left hm2 a)
    have : (2 ^ k) ^ (a + 1) = (2 ^ k) ^ a * 2 ^ k := by ring
    have h2 : (2 ^ k) ^ a * 2 ≤ (2 ^ k) ^ a * 2 ^ k := Nat.mul_le_mul_left _ hm2
    omega
  have hcast : ((2 ^ k : ℕ) : ℝ) ^ ((a : ℝ) + 1) = (((2 ^ k) ^ (a + 1) : ℕ) : ℝ) := by
    rw [show ((a : ℝ) + 1) = ((a + 1 : ℕ) : ℝ) by push_cast; ring, Real.rpow_natCast]; push_cast; ring
  have : (((2 ^ k) ^ (a + 1) : ℕ) : ℝ) < (((2 ^ k) ^ a + a : ℕ) : ℝ) := by
    rw [← hcast]; exact lt_of_le_of_lt hlow hB
  exact absurd (by exact_mod_cast this) (not_lt.mpr hnat)

/-- THEIR DELIVERY, READ THROUGH THE GATE: the release's MainTheorem constructs the bit of the Hamiltonian-cycle row
    over every field, and the bit of the permanent row over every field in which 2 ≠ 0. -/
theorem delivery_inhabits_the_bit (D : MainTheorem.{u}) :
    (∀ (F : Type u) [Field F], TheBitHC F) ∧ (∀ (F : Type u) [Field F], (2 : F) ≠ 0 → TheBitPerm F) := by
  obtain ⟨c, hc0, h⟩ := D
  refine ⟨fun F _ a => ?_, fun F _ h2 a => ?_⟩
  · haveI := ringChar.charP F
    obtain ⟨m₀, hm⟩ := h (ringChar F)
    exact beaten (P := fun m s => Computes (hc F m) s) c hc0 m₀ (fun m hmm s hs => (hm F m hmm s).1 hs) a
  · haveI := ringChar.charP F
    obtain ⟨m₀, hm⟩ := h (ringChar F)
    have hp : ringChar F ≠ 2 := fun e => h2 (by
      have := CharP.cast_eq_zero F (ringChar F); rw [e] at this; exact_mod_cast this)
    exact beaten (P := fun m s => Computes (perm F m) s) c hc0 m₀ (fun m hmm s hs => (hm F m hmm s).2 hp hs) a

end Conversion

/-! ## PART A OF THE TRISDUCTION P ≠ NP MASTER, CARRIED
The eight definitions below are verbatim from `PNP_Normal_Form_Paper_v1_14_0_CC.lean` (Part A, namespace
PNP.NORMALFORM; first in git as PNP_Normal_Form_CC.lean, commit 4144323, 21 October 2026). The three theorems carry
the master's names and statements; their proofs are rewritten here because the master is core Lean and this file
is on Mathlib. NON-NEGOTIABLE: no definition is altered. -/
namespace PNP.NORMALFORM
structure Machine where
  Alg  : Type
  Inst : Type
  size : Inst → Nat
  out  : Alg → Inst → Bool
  time : Alg → Inst → Nat
  sat  : Inst → Bool

def bound (c k n : Nat) : Nat := c * n ^ k + c
def Clean (M : Machine) (A : M.Alg) (c k : Nat) (x : M.Inst) : Prop :=
  M.out A x = M.sat x ∧ M.time A x ≤ bound c k (M.size x)
def Escapes (M : Machine) (A : M.Alg) (c k : Nat) : Prop := ∀ x, Clean M A c k x
def NothingEscapes (M : Machine) : Prop := ∀ A c k, ∃ x, ¬ Clean M A c k x
def Sep (M : Machine) : Prop := ¬ ∃ A c k, Escapes M A c k
def Rec (M : Machine) : Machine :=
  { M with out := fun _ x => !(M.sat x) }

theorem record_has_least_escape (M : Machine) (x₀ : M.Inst) : NothingEscapes (Rec M) :=
  fun _ _ _ => ⟨x₀, fun hc => by simp [Clean, Rec] at hc⟩
theorem sep_of_closure (M : Machine) (h : NothingEscapes M) : Sep M :=
  fun ⟨A, c, k, he⟩ => let ⟨x, hx⟩ := h A c k; hx (he x)
theorem closure_of_sep (M : Machine) (h : Sep M) : NothingEscapes M :=
  fun A c k => by
    by_contra hn
    exact h ⟨A, c, k, fun x => by by_contra hx; exact hn ⟨x, hx⟩⟩
/-- THE NORMAL FORM, as in the master: the separation is exactly the transfer of least escape from the record. -/
theorem sep_normal_form (M : Machine) (x₀ : M.Inst) :
    (NothingEscapes (Rec M) → NothingEscapes M) ↔ Sep M :=
  ⟨fun h => sep_of_closure M (h (record_has_least_escape M x₀)), fun hs _ => closure_of_sep M hs⟩
end PNP.NORMALFORM

/-! ## SUBSUMPTION · the Anthropic system is a Machine of the Trisduction normal form
RATIONALE. `sep_normal_form` is proved of an arbitrary Machine. Here the Hamiltonian-cycle row of the release is
built as one such Machine, its least escape is proved to be the bit of that row, and the release's MainTheorem is
read as a supply of that least escape. What is subsumed is the FORM of the route. The term that supplies the bit is
theirs and is a hypothesis here (`D : MainTheorem`); this file does not check it. -/
namespace Subsumption
open PNP.NORMALFORM Statement Conversion MvPolynomial

/-- The Hamiltonian-cycle row as a Machine: an algorithm is a size budget per instance, an instance is m, the output
    is whether a circuit of that size computes hc at m, and every instance is a yes-instance. -/
noncomputable def vpMachine (F : Type) [Field F] : Machine :=
  { Alg := ℕ → ℕ, Inst := ℕ, size := id,
    out := fun A m => @decide (Computes (hc F m) (A m)) (Classical.propDecidable _),
    time := fun A m => A m, sat := fun _ => true }

theorem clean_iff (F : Type) [Field F] (A : ℕ → ℕ) (c k m : ℕ) :
    Clean (vpMachine F) A c k m ↔ Computes (hc F m) (A m) ∧ A m ≤ bound c k m := by
  simp [Clean, vpMachine]

/-- Least escape at this Machine is: every budget c·m^k + c is beaten at some m. -/
theorem nothingEscapes_iff (F : Type) [Field F] :
    NothingEscapes (vpMachine F) ↔ ∀ c k, ∃ m, ¬ Computes (hc F m) (bound c k m) := by
  constructor
  · intro h c k
    obtain ⟨m, hm⟩ := h (fun m => bound c k m) c k
    exact ⟨m, fun hC => hm ((clean_iff F _ c k m).2 ⟨hC, le_rfl⟩)⟩
  · intro h A c k
    obtain ⟨m, hm⟩ := h c k
    exact ⟨m, fun hcl => hm (computes_mono ((clean_iff F A c k m).1 hcl).1 ((clean_iff F A c k m).1 hcl).2)⟩

theorem shape (c k m : ℕ) : bound c k m ≤ m ^ (k + 2 * c + 1) + (k + 2 * c + 1) := by
  unfold bound
  rcases Nat.lt_or_ge m 2 with hm | hm
  · have h1 : m ^ k ≤ 1 := by
      rcases Nat.eq_zero_or_pos m with rfl | hp
      · cases k <;> simp
      · have : m = 1 := by omega
        simp [this]
    have : c * m ^ k ≤ c := by simpa using Nat.mul_le_mul_left c h1
    omega
  · have h1 : 1 ≤ m ^ k := Nat.one_le_pow _ _ (by omega)
    have h2 : 2 * c ≤ m ^ (2 * c) :=
      le_trans (Nat.lt_two_pow_self).le (Nat.pow_le_pow_left hm _)
    have h3 : c * m ^ k + c ≤ 2 * c * m ^ k := by nlinarith
    have h4 : 2 * c * m ^ k ≤ m ^ (2 * c) * m ^ k := Nat.mul_le_mul_right _ h2
    have h5 : m ^ (2 * c) * m ^ k ≤ m ^ (2 * c) * m ^ k * m := Nat.le_mul_of_pos_right _ (by omega)
    have e : m ^ (k + 2 * c + 1) = m ^ (2 * c) * m ^ k * m := by ring
    omega

/-- LEAST ESCAPE AT THE MACHINE IS THE BIT OF THE ROW. -/
theorem least_escape_iff_bit (F : Type) [Field F] : NothingEscapes (vpMachine F) ↔ TheBitHC F := by
  rw [nothingEscapes_iff]
  constructor
  · intro h a
    obtain ⟨m, hm⟩ := h (a + 1) a
    refine ⟨m, fun hC => hm (computes_mono hC ?_)⟩
    unfold bound
    have : m ^ a ≤ (a + 1) * m ^ a := Nat.le_mul_of_pos_left _ (Nat.succ_pos a)
    omega
  · intro h c k
    obtain ⟨m, hm⟩ := h (k + 2 * c + 1)
    exact ⟨m, fun hC => hm (computes_mono hC (shape c k m))⟩

/-- THE FORM SUBSUMES THE ROW, nothing before the colon: on the Anthropic machine the separation is exactly the
    transfer of least escape from its record, and that least escape is the bit of the row. -/
theorem the_form_subsumes_the_row (F : Type) [Field F] :
    ((NothingEscapes (Rec (vpMachine F)) → NothingEscapes (vpMachine F)) ↔ Sep (vpMachine F)) ∧
    (NothingEscapes (vpMachine F) ↔ TheBitHC F) ∧
    (TheBitHC F ↔ hcFamily F ∉ VP F) :=
  ⟨sep_normal_form (vpMachine F) (0 : ℕ), least_escape_iff_bit F, (hc_route_iff_bit F).symm⟩

/-- THEIR DELIVERY IS A SUPPLY OF LEAST ESCAPE: given the release's MainTheorem, the transfer holds on the Anthropic
    machine, the machine is separated, and the HC family is outside VP. The hypothesis D is their term, unchecked here. -/
theorem their_delivery_supplies_least_escape (D : MainTheorem.{0}) (F : Type) [Field F] :
    NothingEscapes (vpMachine F) ∧ Sep (vpMachine F) ∧ hcFamily F ∉ VP F :=
  have b : TheBitHC F := (delivery_inhabits_the_bit D).1 F
  have n : NothingEscapes (vpMachine F) := (least_escape_iff_bit F).2 b
  ⟨n, sep_of_closure _ n, (hc_route_iff_bit F).2 b⟩

end Subsumption
#print axioms Subsumption.the_form_subsumes_the_row
#print axioms Subsumption.their_delivery_supplies_least_escape
#print axioms PNP.NORMALFORM.sep_normal_form
