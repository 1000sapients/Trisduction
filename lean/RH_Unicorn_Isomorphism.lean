/-
RH_Unicorn_Isomorphism.lean · the Riemann Hypothesis and the unicorn condition are one statement.
Core Lean 4.19.0, no library, no sorry. Harvested 2026-09-24.
Scope: an equivalence (RH ⟺ the off-line zeros are unicorns), not a derivation of RH.
"Every white unicorn has its white fur attached only to its body" is true because there are no
unicorns: a universal over an empty class holds of anything. Here the class is the off-line zeros.
-/
namespace Unicorn

variable {α : Type} (Z onL : α → Prop)

/-- The off-line zeros: zeros not on the line. -/
def OffLine (z : α) : Prop := Z z ∧ ¬ onL z

/-- The hypothesis: every zero is on the line. -/
def RH : Prop := ∀ z, Z z → onL z

/-- The off-line zeros are unicorns: EVERY property holds of all of them, vacuously. -/
def Unicorns : Prop := ∀ (Q : α → Prop) (z : α), OffLine Z onL z → Q z

-- U1.
/-- If the hypothesis holds, the off-line zeros are unicorns: anything at all is true of them. -/
theorem rh_makes_unicorns : RH Z onL → Unicorns Z onL :=
  fun h _ z ⟨hz, off⟩ => absurd (h z hz) off

-- U2.
/-- If the off-line zeros are unicorns, the hypothesis holds (with a decidable line predicate):
    take the property "false"; it holds of every off-line zero, so none exists. -/
theorem unicorns_make_rh [∀ z, Decidable (onL z)] : Unicorns Z onL → RH Z onL :=
  fun h z hz => Decidable.byContradiction (fun off => h (fun _ => False) z ⟨hz, off⟩)

-- U3.
/-- THE SEAL. The Riemann Hypothesis is exactly the statement that the off-line zeros are
    unicorns: a class of which every sentence is vacuously true, because it has no member. -/
theorem rh_iff_unicorns [∀ z, Decidable (onL z)] : RH Z onL ↔ Unicorns Z onL :=
  ⟨rh_makes_unicorns Z onL, unicorns_make_rh Z onL⟩

-- U4.
/-- And the unicorn class is empty exactly when no off-line zero can be exhibited. -/
theorem unicorns_iff_no_witness : Unicorns Z onL ↔ ¬ ∃ z, OffLine Z onL z :=
  ⟨fun h ⟨z, hz⟩ => h (fun _ => False) z hz, fun h _ z hz => absurd ⟨z, hz⟩ h⟩

end Unicorn

#print axioms Unicorn.rh_makes_unicorns
#print axioms Unicorn.unicorns_make_rh
#print axioms Unicorn.rh_iff_unicorns
#print axioms Unicorn.unicorns_iff_no_witness
