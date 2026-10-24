/-
  GB_Mathlib_Binding_v1_1_0_CC.lean · the Mathlib binding of "The Goldbach Conjecture: Unconditional Proof of the Form
  by Theorem, the Value by the Act", edition 1.1.0. Claude-coded (_CC). Lean 4.19.0 with Mathlib v4.19.0; no axiom
  declared, no sorry, no native_decide.

  The master GB_Normal_Form_Paper_v1_1_0_CC.lean states the Goldbach question in its own arithmetic, in core Lean with
  no library: primality defined from the remainder, the even numbers at least four, and the standard form of the
  statement. This file repeats those three definitions verbatim and proves that they are the library's own: the
  kernel's primality is Mathlib's `Nat.Prime` (`kprime_iff_prime`), and the kernel's Goldbach statement is the statement
  in Mathlib's terms (`goldbach_std_iff_mathlib`). Every theorem of the master about its statement is therefore a
  theorem about the Goldbach conjecture as the library writes it. It adds, in the library's terms, Euler's form of the
  question: the binary statement holds exactly when every integer greater than five is a sum of three primes
  (`binary_iff_euler`), and the binary statement gives the ternary one, every odd number greater than five a sum of
  three primes (`binary_gives_ternary`). Every theorem rests on Lean's standard axioms alone, each cone pinned. ΔM = 0.
-/
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Algebra.Group.Nat.Even
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum

namespace GBMathlib

/-! ### The kernel's three definitions, verbatim from the master (namespace GBClose) -/

/-- Primality, defined: at least two, and no remainder zero below it. -/
def Prime (p : Nat) : Prop := 2 ≤ p ∧ ∀ e, 2 ≤ e → e < p → p % e ≠ 0

/-- An even number at least four. -/
def EvenAtLeast4 (n : Nat) : Prop := 4 ≤ n ∧ n % 2 = 0

/-- The Goldbach statement in the standard form: two primes summing to n. -/
def GoldbachStd : Prop := ∀ n, EvenAtLeast4 n → ∃ p q, Prime p ∧ Prime q ∧ p + q = n

/-! ### The binding -/

/-- THE KERNEL'S PRIMES ARE THE LIBRARY'S PRIMES. -/
theorem kprime_iff_prime (p : ℕ) : Prime p ↔ Nat.Prime p := by
  rw [Nat.prime_def]
  constructor
  · rintro ⟨h2, h⟩
    refine ⟨h2, fun m hm => ?_⟩
    by_cases hm1 : m = 1
    · exact Or.inl hm1
    by_cases hmp : m = p
    · exact Or.inr hmp
    exfalso
    have hle : m ≤ p := Nat.le_of_dvd (by omega) hm
    have hm0 : m ≠ 0 := by
      rintro rfl
      exact absurd (Nat.eq_zero_of_zero_dvd hm) (by omega)
    exact h m (by omega) (by omega) (Nat.mod_eq_zero_of_dvd hm)
  · rintro ⟨h2, h⟩
    refine ⟨h2, fun e he hep hmod => ?_⟩
    rcases h e (Nat.dvd_of_mod_eq_zero hmod) with h1 | h1 <;> omega

/-- The kernel's even numbers at least four are the library's. -/
theorem even_at_least_4_iff (n : ℕ) : EvenAtLeast4 n ↔ Even n ∧ 4 ≤ n := by
  rw [EvenAtLeast4, Nat.even_iff]
  exact ⟨fun ⟨a, b⟩ => ⟨b, a⟩, fun ⟨a, b⟩ => ⟨b, a⟩⟩

/-- THE GOLDBACH CONJECTURE, as the library writes it. -/
def GoldbachConjecture : Prop := ∀ n : ℕ, Even n → 4 ≤ n → ∃ p q : ℕ, p.Prime ∧ q.Prime ∧ p + q = n

/-- THE BINDING, PROVED: the kernel's Goldbach statement is the Goldbach conjecture in Mathlib's terms. -/
theorem goldbach_std_iff_mathlib : GoldbachStd ↔ GoldbachConjecture := by
  constructor
  · intro h n hn h4
    obtain ⟨p, q, hp, hq, hs⟩ := h n ((even_at_least_4_iff n).mpr ⟨hn, h4⟩)
    exact ⟨p, q, (kprime_iff_prime p).mp hp, (kprime_iff_prime q).mp hq, hs⟩
  · intro h n hn
    obtain ⟨he, h4⟩ := (even_at_least_4_iff n).mp hn
    obtain ⟨p, q, hp, hq, hs⟩ := h n he h4
    exact ⟨p, q, (kprime_iff_prime p).mpr hp, (kprime_iff_prime q).mpr hq, hs⟩

/-! ### Euler's form of the question, and the ternary consequence -/

/-- EULER'S FORM: every integer greater than five is a sum of three primes. -/
def EulerForm : Prop := ∀ n : ℕ, 5 < n → ∃ p q r : ℕ, p.Prime ∧ q.Prime ∧ r.Prime ∧ p + q + r = n

/-- THE TERNARY STATEMENT: every odd number greater than five is a sum of three primes. -/
def TernaryForm : Prop := ∀ n : ℕ, Odd n → 5 < n → ∃ p q r : ℕ, p.Prime ∧ q.Prime ∧ r.Prime ∧ p + q + r = n

/-- A prime other than two is odd, read modulo two. -/
theorem prime_mod_two (p : ℕ) (hp : p.Prime) : p = 2 ∨ p % 2 = 1 := hp.eq_two_or_odd

/-- THE BINARY STATEMENT IS EULER'S FORM: two primes for every even number at least four exactly when three primes
    for every integer greater than five. -/
theorem binary_iff_euler : GoldbachConjecture ↔ EulerForm := by
  constructor
  · intro h n hn
    rcases Nat.even_or_odd n with ⟨k, hk⟩ | ⟨k, hk⟩
    · have he : Even (n - 2) := ⟨k - 1, by omega⟩
      obtain ⟨p, q, hp, hq, hs⟩ := h (n - 2) he (by omega)
      exact ⟨2, p, q, Nat.prime_two, hp, hq, by omega⟩
    · have he : Even (n - 3) := ⟨k - 1, by omega⟩
      obtain ⟨p, q, hp, hq, hs⟩ := h (n - 3) he (by omega)
      exact ⟨3, p, q, Nat.prime_three, hp, hq, by omega⟩
  · intro h n hn h4
    obtain ⟨p, q, r, hp, hq, hr, hs⟩ := h (n + 2) (by omega)
    have hn2 : n % 2 = 0 := Nat.even_iff.mp hn
    rcases prime_mod_two p hp with rfl | hp2
    · exact ⟨q, r, hq, hr, by omega⟩
    rcases prime_mod_two q hq with rfl | hq2
    · exact ⟨p, r, hp, hr, by omega⟩
    rcases prime_mod_two r hr with rfl | hr2
    · exact ⟨p, q, hp, hq, by omega⟩
    omega

/-- THE BINARY STATEMENT GIVES THE TERNARY STATEMENT. -/
theorem binary_gives_ternary (h : GoldbachConjecture) : TernaryForm :=
  fun n _ hn => binary_iff_euler.mp h n hn

/-- THE KERNEL'S STATEMENT, ITS LIBRARY FORM AND EULER'S FORM ARE ONE PROPOSITION. -/
theorem the_three_forms_are_one : (GoldbachStd ↔ GoldbachConjecture) ∧ (GoldbachConjecture ↔ EulerForm) ∧
    (GoldbachConjecture → TernaryForm) :=
  ⟨goldbach_std_iff_mathlib, binary_iff_euler, binary_gives_ternary⟩

end GBMathlib

/-! ## cones of the binding, pinned: the build is silent, and any drift fails it -/
/-- info: 'GBMathlib.kprime_iff_prime' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms GBMathlib.kprime_iff_prime
/-- info: 'GBMathlib.even_at_least_4_iff' depends on axioms: [propext] -/
#guard_msgs in #print axioms GBMathlib.even_at_least_4_iff
/-- info: 'GBMathlib.goldbach_std_iff_mathlib' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms GBMathlib.goldbach_std_iff_mathlib
/-- info: 'GBMathlib.prime_mod_two' depends on axioms: [propext] -/
#guard_msgs in #print axioms GBMathlib.prime_mod_two
/-- info: 'GBMathlib.binary_iff_euler' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms GBMathlib.binary_iff_euler
/-- info: 'GBMathlib.binary_gives_ternary' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms GBMathlib.binary_gives_ternary
/-- info: 'GBMathlib.the_three_forms_are_one' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms GBMathlib.the_three_forms_are_one
