/-! Box 1 of The Ten-Level Binding Chain of the Atomic Proof of the Riemann Hypothesis, v1.3.0, the formal edition
    (final text, cycle rhc3 closed at round 21, 14 October 2026). Extracted from the Markdown master's Box 1 verbatim.
    Append to RH_Both_Sides_Seed_v2.0.5.lean (sha256 a82ef4f0ad6ceb43a2d3cc964b110943dbb02f050ab88ff2845df1226a321a57)
    and compile under core Lean 4.19.0 (commit 6caaee842e94): exit 0, the cones printed below by #print axioms. -/
namespace ComposedConditional
open RememberedOffered Hardening
/-- At every resolution, the reader's rule. -/
theorem classical_rh_from_the_act_every {ClassicalRH : Prop} {R : Nat → Config}
    (h_read : ClassicalRH ↔ ∀ n, 1 ≤ n → Value (R n)) (Z : Charts.ActualZerosEvery) (hZ : Z.zeros = R) :
    ClassicalRH :=
  h_read.mpr (fun n _ => hZ ▸ value_from_the_act (Z.atRes n))
/-- At one configuration. -/
theorem classical_rh_from_the_act {ClassicalRH : Prop} {Zζ : Config}
    (h_read : ClassicalRH ↔ Value Zζ) (A : ActualZeros) (hA : A.zeros = Zζ) : ClassicalRH :=
  (classical_rh_iff_le_of_reading h_read).mpr (hA ▸ supply_is_the_premise A)
/-- The act at every resolution is the value packaged; the one added hypothesis is the empty term at resolution zero,
    the closedness of the configurations following from the value. -/
theorem the_act_every_is_the_value_packaged {R : Nat → Config} (h0 : R 0 = fun _ => False) :
    (∃ Z : Charts.ActualZerosEvery, Z.zeros = R) ↔ ∀ n, 1 ≤ n → Value (R n) := by
  have hv : (∀ n, 1 ≤ n → Value (R n)) → ∀ n, Value (R n) := fun h n => by
    cases n with
    | zero => rw [h0]; exact fun _ hp => hp.elim
    | succ k => exact h (k + 1) (Nat.succ_le_succ (Nat.zero_le k))
  refine ⟨fun ⟨Z, hZ⟩ n _ => hZ ▸ value_from_the_act (Z.atRes n), fun h => ?_⟩
  have hR : ∀ n, Closed (R n) := fun n p hp => by
    have hl : p.1 = 0 := hv h n p hp
    obtain ⟨d, t⟩ := p
    change d = 0 at hl
    subst hl
    exact hp
  exact (Charts.the_act_at_every_resolution R hR).1.mpr (hv h)
/-- With the reading granted, asserting that no act stands is the denial. -/
theorem refusing_the_act_is_the_denial {ClassicalRH : Prop} {R : Nat → Config}
    (h_read : ClassicalRH ↔ ∀ n, 1 ≤ n → Value (R n)) (h0 : R 0 = fun _ => False) :
    (¬ ∃ Z : Charts.ActualZerosEvery, Z.zeros = R) ↔ ¬ ClassicalRH := by
  rw [the_act_every_is_the_value_packaged h0, h_read]
/-- Every resolution collected in one configuration: its value is the value at every resolution n ≥ 1. -/
theorem value_collected {R : Nat → Config} :
    Value (fun p => ∃ n, 1 ≤ n ∧ R n p) ↔ ∀ n, 1 ≤ n → Value (R n) :=
  ⟨fun h n hn p hp => h p ⟨n, hn, hp⟩, fun h p ⟨n, hn, hp⟩ => h n hn p hp⟩
/-- Every resolution collected in one configuration carries the act's content: an act there exists exactly where an
    act at every resolution does, the term at resolution zero empty. -/
theorem the_collected_act_is_the_act_every {R : Nat → Config} (h0 : R 0 = fun _ => False) :
    (∃ A : ActualZeros, A.zeros = fun p => ∃ n, 1 ≤ n ∧ R n p) ↔ ∃ Z : Charts.ActualZerosEvery, Z.zeros = R := by
  rw [the_act_every_is_the_value_packaged h0, ← value_collected]
  constructor
  · rintro ⟨A, hA⟩
    exact hA ▸ value_from_the_act A
  · intro v
    refine ⟨⟨_, fun p hp => ?_, (twins_on_every_world _).mpr v⟩, rfl⟩
    have hl : p.1 = 0 := v p hp
    obtain ⟨d, t⟩ := p
    change d = 0 at hl
    subst hl
    exact hp
/-- The reading at every resolution is keyed, with the term at resolution zero empty: the family empty at zero and the
    pair world above it. -/
theorem the_reading_every_is_keyed :
    ∃ (P : Prop) (R : Nat → Config), R 0 = (fun _ => False) ∧ (∀ n, Closed (R n)) ∧
      ¬ (P ↔ ∀ n, 1 ≤ n → Value (R n)) :=
  ⟨True, fun n => match n with | 0 => fun _ => False | _ + 1 => pairWorld offPoint, rfl,
   fun n => match n with | 0 => fun _ hp => hp.elim | _ + 1 => pair_world_closed offPoint,
   fun h => pair_world_lacks_value offPoint off_point_is_off ((h.mp trivial) 1 (Nat.le_refl 1))⟩
/-- The cargo's binding, on the seed's own types. -/
theorem cargo_binding_on_the_seed :
    (∀ s : ApparatusCargo.Stage1, s.event.after = ApparatusCargo.annihilate s.event.before) ∧
    (∀ e : ApparatusCargo.VerificationEvent, ∃ s : ApparatusCargo.Stage1, s.event = e) :=
  ⟨fun s => (ApparatusCargo.stage1_closes s).1, fun e => ⟨ApparatusCargo.computation_enacts_stage1 e, rfl⟩⟩
end ComposedConditional

#print axioms ComposedConditional.classical_rh_from_the_act_every
#print axioms ComposedConditional.classical_rh_from_the_act
#print axioms ComposedConditional.the_act_every_is_the_value_packaged
#print axioms ComposedConditional.refusing_the_act_is_the_denial
#print axioms ComposedConditional.value_collected
#print axioms ComposedConditional.the_collected_act_is_the_act_every
#print axioms ComposedConditional.the_reading_every_is_keyed
#print axioms ComposedConditional.cargo_binding_on_the_seed
#print axioms Charts.ActualZerosEvery.atRes

/- expected, as printed in Box 1:
'ComposedConditional.classical_rh_from_the_act_every' does not depend on any axioms
'ComposedConditional.classical_rh_from_the_act' does not depend on any axioms
'ComposedConditional.the_act_every_is_the_value_packaged' depends on axioms: [propext, Quot.sound]
'ComposedConditional.refusing_the_act_is_the_denial' depends on axioms: [propext, Quot.sound]
'ComposedConditional.value_collected' does not depend on any axioms
'ComposedConditional.the_collected_act_is_the_act_every' depends on axioms: [propext, Quot.sound]
'ComposedConditional.the_reading_every_is_keyed' does not depend on any axioms
'ComposedConditional.cargo_binding_on_the_seed' does not depend on any axioms
'Charts.ActualZerosEvery.atRes' does not depend on any axioms
-/
