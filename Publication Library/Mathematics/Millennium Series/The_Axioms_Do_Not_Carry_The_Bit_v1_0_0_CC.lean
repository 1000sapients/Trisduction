/-
  The_Axioms_Do_Not_Carry_The_Bit_v1_0_0_CC.lean · a test of one hypothesis about the archive at alpo.ge.
  Core Lean 4.19.0: no import, no axiom declared, no sorry, no native_decide.

  RATIONALE. The hypothesis under test: a theorem-grade derivation of the Riemann Hypothesis works because the bit is
    conveyed into Lean's standard axioms (propext, Classical.choice, Quot.sound). If that were so, the axioms would
    deliver the value on every fold-closed configuration, since an axiom holds everywhere. This file shows they do
    not: on a concrete plane, one fold-closed configuration lacks the value, and that refutation stands with the three
    axioms in use. So a proof that reaches the value must use what is specific to its configuration, which for the
    archive is the definition of ζ, and not the axioms.
  DESIGN. The integer chart of the corpus (Where_RH_Stands, 18 Sep 2026): points (a, b), fold (a, b) ↦ (2 − a, b),
    the line a = 1. The off-line pair {(0,0), (2,0)} is fold-closed and has no point on the line.
  NON-NEGOTIABLES. Every theorem pinned by #guard_msgs. `with_the_three_axioms` deliberately invokes Classical.em, so
    its pin names all three axioms: the refutation holds with them in play.
  RISKS. The chart is a model, not ζ. That is the point: what holds in every model of the axioms cannot decide a
    value that this model lacks.
-/
set_option autoImplicit false

namespace AxiomsDoNotCarryTheBit

/-- The integer plane: points, the fold, the line it fixes. -/
abbrev Point := Int × Int
def fold (p : Point) : Point := (2 - p.1, p.2)
def onLine (p : Point) : Prop := p.1 = 1

/-- A configuration is a set of points; Closed is fold-closure; Value is "every point on the line". -/
def Config := Point → Prop
def Closed (S : Config) : Prop := ∀ p, S p → S (fold p)
def Value (S : Config) : Prop := ∀ p, S p → onLine p

/-- The off-line pair {(0,0), (2,0)}: fold-closed, no point on the line. -/
def offPair : Config := fun p => p = (0, 0) ∨ p = (2, 0)

theorem offPair_closed : Closed offPair := fun p h =>
  match h with
  | Or.inl e => by subst e; exact Or.inr rfl
  | Or.inr e => by subst e; exact Or.inl rfl

theorem offPair_lacks_value : ¬ Value offPair := fun h =>
  (by decide : ¬ ((0 : Int) = 1)) (h (0, 0) (Or.inl rfl))

/-- Nothing true of every closed configuration gives the value: the off-line pair is closed and lacks it. -/
theorem the_axioms_do_not_carry_the_bit : ¬ ∀ S, Closed S → Value S :=
  fun h => offPair_lacks_value (h offPair offPair_closed)

/-- Any proposition that holds, an axiom included, fails to deliver the value on every closed configuration. -/
theorem no_true_proposition_carries_the_bit : ∀ A : Prop, A → ¬ (A → ∀ S, Closed S → Value S) :=
  fun _ a h => the_axioms_do_not_carry_the_bit (h a)

/-- Excluded middle as a hypothesis changes nothing. -/
theorem even_with_excluded_middle : (∀ P : Prop, P ∨ ¬ P) → ¬ ∀ S, Closed S → Value S :=
  fun _ => the_axioms_do_not_carry_the_bit

/-- The refutation with the three standard axioms in use: Classical.em is invoked, and the value is still not
    delivered on the closed configurations. -/
theorem with_the_three_axioms : ¬ ∀ S, Closed S → Value S :=
  fun h => (Classical.em (Value offPair)).elim (fun v => offPair_lacks_value v)
    (fun _ => offPair_lacks_value (h offPair offPair_closed))

end AxiomsDoNotCarryTheBit

/-- info: 'AxiomsDoNotCarryTheBit.offPair_closed' does not depend on any axioms -/
#guard_msgs in #print axioms AxiomsDoNotCarryTheBit.offPair_closed

/-- info: 'AxiomsDoNotCarryTheBit.offPair_lacks_value' does not depend on any axioms -/
#guard_msgs in #print axioms AxiomsDoNotCarryTheBit.offPair_lacks_value

/-- info: 'AxiomsDoNotCarryTheBit.the_axioms_do_not_carry_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms AxiomsDoNotCarryTheBit.the_axioms_do_not_carry_the_bit

/-- info: 'AxiomsDoNotCarryTheBit.no_true_proposition_carries_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms AxiomsDoNotCarryTheBit.no_true_proposition_carries_the_bit

/-- info: 'AxiomsDoNotCarryTheBit.even_with_excluded_middle' does not depend on any axioms -/
#guard_msgs in #print axioms AxiomsDoNotCarryTheBit.even_with_excluded_middle

/-- info: 'AxiomsDoNotCarryTheBit.with_the_three_axioms' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms AxiomsDoNotCarryTheBit.with_the_three_axioms
