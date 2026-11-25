/-
  No_Second_Sovereign_v1_0_0_CC.lean · a legit derivation, read against the Root Axiom of the record.
  Core Lean 4.19.0: no import, no axiom declared, no sorry, no native_decide.

  RATIONALE. The question: if a theorem-grade derivation of a root proposition is legit, has the formal domain made a
    second sovereign, which the Root Axiom does not allow? The record already answers it. TOE_Zero Part I, carried
    verbatim inside RH_Both_Sides_Formal_Master_v3_0_39_CC (Zenodo 23440383), proves for every self-grounding root
    that no external proof adds anything to it (`external_proof_adds_nothing`) and that any further ground offered
    is idle (`no_level_above`); the master proves the Riemann Hypothesis has a self-grounding supply exactly when it
    holds. This file binds those to a derivation: a derivation is an act that instances the root, the root has its
    own supply, and against every supply the derivation adds nothing and sits at no level above. One root, many acts.
  DESIGN. `SelfGrounding`, `external_proof_adds_nothing`, `no_level_above` and `supply_iff` are copied from the record
    in the same words; the new theorem only composes them with a derivation `d : Q → R` and its premise `q : Q`.
  NON-NEGOTIABLES. Every theorem pinned to no axiom at all. Nothing here asserts the Riemann Hypothesis: R is any
    root proposition, and the file speaks of a derivation only once it is given.
  RISKS. None in the kernel; the reading of "sovereign" as "a ground at a level above the root" is the record's own
    (Part V of TOE_Zero, "the regress terminated").
-/
set_option autoImplicit false

namespace NoSecondSovereign

/-- A self-grounding root, as in TOE_Zero Part I: acts occur, and every act instances the root. -/
structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

/-- No external proof adds anything to the root (TOE_Zero Part I, verbatim statement). -/
theorem external_proof_adds_nothing {R : Prop} (G : SelfGrounding R) (Q : Prop) : (Q → R) ↔ R :=
  ⟨fun _ => G.instances G.anAct, fun r _ => r⟩

/-- The regress ends at the root: any further ground offered is idle (TOE_Zero Part V, verbatim statement). -/
theorem no_level_above {R : Prop} (G : SelfGrounding R) : ∀ Q : Prop, (Q → R) → R :=
  fun _ _ => G.instances G.anAct

/-- A self-grounding supply with an act exists exactly when the root holds (the master's `supply_iff`). -/
theorem supply_iff (R : Prop) : (∃ G : SelfGrounding R, Nonempty G.Act) ↔ R :=
  ⟨fun ⟨G, ⟨a⟩⟩ => G.instances a, fun r => ⟨⟨Unit, (), fun _ => r⟩, ⟨()⟩⟩⟩

/-- NO SECOND SOVEREIGN. A legit derivation `d` of the root from a premise `q`: (1) is itself an act that instances
    the root, a supply whose acts are the derivation's proofs; (2) the root then has its own supply, by `supply_iff`;
    (3) against every supply of the root, the derivation adds nothing; (4) against every supply, it sits at no level
    above the root. The derivation is one more act under the one root, not a second ground beside it. -/
theorem one_root_many_acts (R Q : Prop) (d : Q → R) (q : Q) :
    (∃ G : SelfGrounding R, G.Act = PLift Q) ∧
    (∃ G : SelfGrounding R, Nonempty G.Act) ∧
    (SelfGrounding R → ((Q → R) ↔ R)) ∧
    (SelfGrounding R → ∀ Q' : Prop, (Q' → R) → R) :=
  ⟨⟨⟨PLift Q, ⟨q⟩, fun h => d h.down⟩, rfl⟩,
   (supply_iff R).mpr (d q),
   fun G => external_proof_adds_nothing G Q,
   fun G => no_level_above G⟩

end NoSecondSovereign

/-- info: 'NoSecondSovereign.external_proof_adds_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms NoSecondSovereign.external_proof_adds_nothing

/-- info: 'NoSecondSovereign.no_level_above' does not depend on any axioms -/
#guard_msgs in #print axioms NoSecondSovereign.no_level_above

/-- info: 'NoSecondSovereign.supply_iff' does not depend on any axioms -/
#guard_msgs in #print axioms NoSecondSovereign.supply_iff

/-- info: 'NoSecondSovereign.one_root_many_acts' does not depend on any axioms -/
#guard_msgs in #print axioms NoSecondSovereign.one_root_many_acts
