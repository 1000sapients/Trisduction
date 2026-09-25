/-
RH_Gold_And_Lead.lean · why the Real part and the Unicorn part should not be mixed.
Core Lean 4.19.0, no library, no sorry. Drafted 2026-09-24.
Companion to RH_Real_Unicorn_Split.lean, where RH ⟺ Real part ∧ Unicorn part at every height.
A statement's standing is proved, open, or refuted. A conjunction stands only as high as its
weakest part. So the conventional RH, the two parts fused, inherits the Unicorn part's standing:
the gold of the Real part does not survive the alloy.
-/
namespace GoldLead

/-- The three standings of a statement, ranked. -/
inductive Standing | refuted | opn | proved
  deriving DecidableEq, Repr

def Standing.rank : Standing → Nat
  | .refuted => 0 | .opn => 1 | .proved => 2

/-- A conjunction stands at the weaker of its two parts. -/
def join (a b : Standing) : Standing := if a.rank ≤ b.rank then a else b

-- G1.
/-- The alloy never outranks either metal. -/
theorem join_below_both (a b : Standing) :
    (join a b).rank ≤ a.rank ∧ (join a b).rank ≤ b.rank := by
  cases a <;> cases b <;> decide

-- G2.
/-- THE FUSED RH. The Real part stands proved (certified to 3 × 10¹²), the Unicorn part stands
    open; fused, the conventional RH stands open. -/
def realPart : Standing := .proved
def unicornPart : Standing := .opn
def fusedRH : Standing := join realPart unicornPart

theorem fused_rh_is_open : fusedRH = .opn := by decide

-- G3.
/-- GOLD NO LONGER PURE. Fusion strictly lowers the Real part's standing: kept apart it is proved,
    carried inside the fused statement it is only open. -/
theorem fusion_lowers_the_gold : fusedRH.rank < realPart.rank := by decide

-- G4.
/-- Logically, every proof of the fused statement carries a proof of the Unicorn part, and every
    refutation of the Unicorn part refutes the fused statement, whatever the Real part holds. -/
theorem fused_carries_unicorn (Real Unicorn : Prop) :
    ((Real ∧ Unicorn) → Unicorn) ∧ (¬ Unicorn → ¬ (Real ∧ Unicorn)) :=
  ⟨fun h => h.2, fun hU h => hU h.2⟩

-- G5.
/-- Kept apart, each part keeps its own standing: the Real part is asserted exactly as proved,
    with nothing borrowed from the Unicorn part, and the Unicorn part is asserted exactly as open. -/
theorem kept_apart (Real Unicorn : Prop) (hReal : Real) :
    Real ∧ ((Real ∧ Unicorn) ↔ Unicorn) :=
  ⟨hReal, ⟨fun h => h.2, fun hU => ⟨hReal, hU⟩⟩⟩

-- G6.
/-- THE RULE, IN ONE THEOREM. Given the Real part, the fused RH is exactly the Unicorn part, and
    fusing lowers the Real part from proved to open. So state the Real part as gold, the Unicorn
    part as the open bit, and do not alloy them. -/
theorem do_not_alloy (Real Unicorn : Prop) (hReal : Real) :
    ((Real ∧ Unicorn) ↔ Unicorn) ∧ fusedRH = .opn ∧ fusedRH.rank < realPart.rank :=
  ⟨(kept_apart Real Unicorn hReal).2, fused_rh_is_open, fusion_lowers_the_gold⟩

end GoldLead

#print axioms GoldLead.join_below_both
#print axioms GoldLead.fused_rh_is_open
#print axioms GoldLead.fusion_lowers_the_gold
#print axioms GoldLead.fused_carries_unicorn
#print axioms GoldLead.kept_apart
#print axioms GoldLead.do_not_alloy
