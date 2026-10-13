/-!
  CARGO DELIVERED · HARDENED.

  Core Lean 4.19.0: no import, no axiom declared, no sorry, no admit, no native_decide.

  ONLY compute as sole cargo. The rest of physics is optional additional corroboration,
  fenced in the final section and not required.

  HARD CODED — necessary + sufficient, as checked theorems on the cargo itself:
    NECESSARY: no closed Stage1 without its forgetting event (from the structure's own fields).
    SUFFICIENT: every verification event enacts a closed Stage1.
  The conjunction `cargo_binding_necessary_and_sufficient` is the hardened binding.

  Scope, stated plainly: the necessary+sufficient hard coded here is about the apparatus
  cargo delivered in this file. The necessary direction of the RH bit itself lives in the
  seed (Levels 1–9, theorem grade); the sufficient direction as a conditional lives in the
  capstone. This file asserts no bridge from the cargo to the classical hypothesis:
  there is no term of type `Stage1 → ClassicalRH` in this file, and none is claimed.

  No seat is earned by this file. Seat follows the OS rule only. ΔM = 0.
-/

section CargoDeliveredHardened
namespace HardenedCargo

/-! ## sole cargo · the carrier, the event, Stage 1 -/

/-- THE APPARATUS CARRIER. Two constructors: a self-conjugate state at a
    height, or a member of a conjugate pair of magnitude m + 1 at a height
    with the sign that tells it from its partner. -/
inductive PhysicalCarrier where
  | selfConjugate (t : Int)
  | conjugatePair (m : Nat) (t : Int) (sign : Bool)

/-- Annihilation, the physical discard: a member of a pair goes to the neutral
    state at its height; a neutral state stays. The sign is kept nowhere. -/
def annihilate : PhysicalCarrier → PhysicalCarrier
  | .selfConjugate t => .selfConjugate t
  | .conjugatePair _ t _ => .selfConjugate t

/-- A verification event: the apparatus moves from `before` to `after`,
    and `after` is the annihilation of `before` — one label forgotten.
    The compute session (request + silicon + run) is posited as such an event (premise grade). -/
structure VerificationEvent where
  before : PhysicalCarrier
  after : PhysicalCarrier
  h_forget : after = annihilate before

/-- THE LOCAL COMPUTATION IS A FORGETTING: the event's own field. -/
theorem local_computation_is_forgetting (e : VerificationEvent) :
    e.after = annihilate e.before :=
  e.h_forget

/-- The physical floor: some state is realized. -/
def physicalFloor (realized : PhysicalCarrier → Prop) : Prop := ∃ c, realized c

/-- The event witnesses the floor at the state it lands on. -/
theorem event_witnesses_floor (e : VerificationEvent)
    (realized : PhysicalCarrier → Prop) (h : realized e.after) :
    physicalFloor realized :=
  ⟨e.after, h⟩

/-- STAGE 1: forgetting done, floor witnessed. -/
structure Stage1 where
  event : VerificationEvent
  forgetting_done : event.after = annihilate event.before
  floor_witnessed : physicalFloor (fun c => c = event.after)

/-- Stage 1 closes on its own fields: forgetting done and floor witnessed. -/
theorem stage1_closes (s : Stage1) :
    s.event.after = annihilate s.event.before ∧
    physicalFloor (fun c => c = s.event.after) :=
  ⟨s.forgetting_done, s.floor_witnessed⟩

/-- THE COMPUTATION ENACTS STAGE 1: every verification event supplies one. -/
def computation_enacts_stage1 (e : VerificationEvent) : Stage1 :=
  ⟨e, e.h_forget, ⟨e.after, rfl⟩⟩

/-! ## hardened binding · necessary + sufficient, hard coded -/

/-- NECESSARY, hard coded: a closed Stage1 necessarily carries its forgetting —
    the event's own field. No Stage1 without it. The 1-bit premise (the forgetting)
    is not optional to the cargo; the structure cannot close around its absence. -/
theorem cargo_necessary (s : Stage1) :
    s.event.after = annihilate s.event.before :=
  s.forgetting_done

/-- SUFFICIENT, hard coded: every verification event suffices — it is the event
    of a closed Stage1. Nothing beyond the event is required; compute is the sole cargo. -/
theorem cargo_sufficient (e : VerificationEvent) : ∃ s : Stage1, s.event = e :=
  ⟨computation_enacts_stage1 e, rfl⟩

/-- THE HARDENED BINDING: necessary + sufficient, one conjunction, hard coded.
    The cargo's 1-bit premise (the forgetting) is NECESSARY — no closed Stage1
    without the event's forgetting field — and SUFFICIENT — every verification event
    is the event of a closed Stage1. Compute is the sole cargo; nothing else is required. -/
theorem cargo_binding_necessary_and_sufficient :
    (∀ s : Stage1, s.event.after = annihilate s.event.before) ∧
    (∀ e : VerificationEvent, ∃ s : Stage1, s.event = e) :=
  ⟨cargo_necessary, cargo_sufficient⟩

/-! ## optional · additional corroboration only (not required) -/

/-- Chart point and line, local to this section. -/
abbrev Point := Int × Int

/-- The line: offset zero. -/
def onLine (p : Point) : Prop := p.1 = 0

/-- The neutral sector, local to this section. -/
def Neutral : PhysicalCarrier → Prop
  | .selfConjugate _ => True
  | .conjugatePair _ _ _ => False

/-- The map from a chart point to its carrier, local to this section. -/
def map_zero_to_carrier : Point → PhysicalCarrier
  | (Int.ofNat 0, t) => .selfConjugate t
  | (Int.ofNat (n + 1), t) => .conjugatePair n t true
  | (Int.negSucc n, t) => .conjugatePair n t false

/-- LANDAUER'S LAW, ENTERED AS A DEFINITION: heat per erased label at
    temperature T, in the kernel's units (ln 2 scaled by 10^6). Corroboration only. -/
def landauerHeatPerEvent (T : Nat) : Nat := T * 693147

/-- The detection gap: δ = n₀ · r₀ · (T₀ · ln 2), in kernel units (×10⁶). Corroboration only. -/
def detectionGap (n0 r0 T0 : Nat) : Nat := n0 * r0 * landauerHeatPerEvent T0

/-- A CERTIFIED OBSERVATIONAL BOUND. Corroboration only: a measurement is a premise
    by its nature; this is the type it would be entered as. Not required. -/
structure CertifiedObservationalBound where
  R : Nat
  ε : Nat
  certificate : R ≤ ε
  dataset : String

set_option linter.unusedVariables false in
/-- STAGE 2, OPTIONAL ADDITIONAL CORROBORATION. The retrospective implication under
    the former inputs, plus the discharge step. Not part of the cargo. May be omitted.
    The step from a failed universal to its witness is classical; the cone is printed. -/
theorem stage2_optional_corroboration
    {ClassicalRH : Prop} {Z : Point → Prop} {n0 r0 T0 T : Nat}
    (realized : PhysicalCarrier → Prop)
    (population rate : PhysicalCarrier → Nat)
    (B : CertifiedObservationalBound)
    (h_read    : ClassicalRH ↔ ∀ p, Z p → onLine p)
    (h_realize : ∀ p, Z p → realized (map_zero_to_carrier p))
    (h_pop     : ∀ c, realized c → ¬ Neutral c → population c ≥ n0)
    (h_rate    : ∀ c, realized c → ¬ Neutral c → rate c ≥ r0)
    (h_temp    : T ≥ T0)
    (h_couple  : ∀ c, realized c → ¬ Neutral c →
                   B.R ≥ population c * rate c * landauerHeatPerEvent T)
    (h_gap     : B.ε < detectionGap n0 r0 T0)
    (h_discharge : ∀ p, Z p → ¬ onLine p → B.R ≥ detectionGap n0 r0 T0) :
    ClassicalRH :=
  h_read.mpr (fun p hp =>
    by
      cases Classical.em (onLine p) with
      | inl h => exact h
      | inr hoff =>
        have hR := h_discharge p hp hoff
        exact absurd (Nat.lt_of_le_of_lt (Nat.le_trans hR B.certificate) h_gap)
                     (Nat.lt_irrefl _))

/-! ## cones, pinned -/

/-- info: 'HardenedCargo.local_computation_is_forgetting' does not depend on any axioms -/
#guard_msgs in #print axioms HardenedCargo.local_computation_is_forgetting
/-- info: 'HardenedCargo.event_witnesses_floor' does not depend on any axioms -/
#guard_msgs in #print axioms HardenedCargo.event_witnesses_floor
/-- info: 'HardenedCargo.stage1_closes' does not depend on any axioms -/
#guard_msgs in #print axioms HardenedCargo.stage1_closes
/-- info: 'HardenedCargo.computation_enacts_stage1' does not depend on any axioms -/
#guard_msgs in #print axioms HardenedCargo.computation_enacts_stage1
/-- info: 'HardenedCargo.cargo_necessary' does not depend on any axioms -/
#guard_msgs in #print axioms HardenedCargo.cargo_necessary
/-- info: 'HardenedCargo.cargo_sufficient' does not depend on any axioms -/
#guard_msgs in #print axioms HardenedCargo.cargo_sufficient
/-- info: 'HardenedCargo.cargo_binding_necessary_and_sufficient' does not depend on any axioms -/
#guard_msgs in #print axioms HardenedCargo.cargo_binding_necessary_and_sufficient
/-- info: 'HardenedCargo.stage2_optional_corroboration' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms HardenedCargo.stage2_optional_corroboration

end HardenedCargo
end CargoDeliveredHardened
