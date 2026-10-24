/-
  Poincare_Precedent_v1_0_0_CC.lean · the mini case of "The Poincaré Precedent and the Stronger Case:
  Why All Seven Qualify"
  Claude-coded (_CC), 24 October 2026. Core Lean 4.19.0: no import, no axiom declared, no sorry, no native_decide.

  The precedent in miniature. The Millennium Grand Master v1.0.0_CC proves every claim below at full scale on the
  rows' own kernels; this file proves the shape of each claim in one screen of core Lean, so that a reader can check
  the argument of the paper in under a second.

    P.1  The crossing, typed. A witness of the 2002 functional's shape, strictly decreasing along the step off the
         round state and invariant under the rescaling, brings every state to rest. On the self-similar flow every
         state comes to rest and no witness exists. The witness is strictly inside the act.
    P.2  The bit is the minimal premise. On every host whose act is its sentence, the act is necessary and
         sufficient; the witness route is strictly stronger than the sentence; a minimal route is never strictly
         stronger; and every route to the sentence passes the bit, the witness route included.
    P.3  One footing. Assign a host to each of the seven rows: the bit is the minimal premise at every row, the
         Poincaré row included, by one theorem that reads no row.
    P.4  Delivered twice, armed once. Two kinds, each yielding the sentence; one refuter refutes both.
    P.5  A rule, not a value. Seven rows, each with a calm frame and a counter frame: every one of the 2^7 patterns
         of the seven values is realized on the product, and the Poincaré value settles no other row.
    P.6  The other road. Adopting the bit as an axiom proves exactly what adopting the sentence proves, and the
         admission screen refuses a posit equivalent to its target as circular.
    Ω    The stronger case in miniature: one theorem with nothing before its colon.

  The record's act is not a term, and nothing here reads it: the kernel's domain is what #print axioms prints, and
  every theorem below is pinned by #guard_msgs at the foot of the file, so any drift fails the compile. Nothing here
  proves or refutes a Millennium sentence. ΔM = 0.
-/

namespace PoincarePrecedent

/-! ## P.1 · The crossing, typed -/

/-- n steps of a map. -/
def steps {α : Type} (f : α → α) : Nat → α → α
  | 0, x => x
  | k + 1, x => steps f k (f x)

/-- A FLOW: states, a step, the round state (the seat), a rescaling, and a decision of whether a state is the seat.
    The master's `PCClose.Flow` carries these fields and three more, which the argument below does not use. -/
structure Flow where
  State   : Type
  step    : State → State
  round   : State
  rescale : State → State
  deq     : ∀ s, Decidable (s = round)

/-- A state comes to rest when some number of steps brings it to the seat. -/
def ComesToRest (F : Flow) (s : F.State) : Prop := ∃ k, steps F.step k s = F.round

/-- THE ACT: every state of the flow comes to rest. It is the flow's value, the row's bit. -/
def Act (F : Flow) : Prop := ∀ s, ComesToRest F s

/-- A WITNESS OF THE 2002 FUNCTIONAL'S SHAPE: a functional on states, strictly decreasing along the step at every
    state off the seat, and invariant under the rescaling. The same three fields as the master's `PCClose.Witness`. -/
structure Witness (F : Flow) where
  W         : F.State → Nat
  decrease  : ∀ s, s ≠ F.round → W (F.step s) < W s
  scaleFree : ∀ s, W (F.rescale s) = W s

/-- THE DESCENT BOUND: a state whose functional is at most n comes to rest. -/
theorem descent_bound (F : Flow) (P : Witness F) : ∀ n s, P.W s ≤ n → ComesToRest F s
  | 0, s, hs =>
    match F.deq s with
    | isTrue e => ⟨0, e⟩
    | isFalse ne => absurd (Nat.lt_of_lt_of_le (P.decrease s ne) hs) (Nat.not_lt_zero _)
  | n + 1, s, hs =>
    match F.deq s with
    | isTrue e => ⟨0, e⟩
    | isFalse ne =>
      match descent_bound F P n (F.step s) (Nat.le_of_lt_succ (Nat.lt_of_lt_of_le (P.decrease s ne) hs)) with
      | ⟨k, hk⟩ => ⟨k + 1, hk⟩

/-- A WITNESS GIVES THE ACT: on every flow that carries a witness, every state comes to rest. -/
theorem a_witness_gives_the_act (F : Flow) (P : Witness F) : Act F :=
  fun s => descent_bound F P (P.W s) s (Nat.le_refl _)

/-- The self-similar flow: two states, the seat `true` and the state `false` off it; the step sends both to the seat,
    and the rescaling is the step. -/
def soliton : Flow where
  State   := Bool
  step    := fun _ => true
  round   := true
  rescale := fun _ => true
  deq     := fun s => decEq s true

/-- THE SELF-SIMILAR FLOW RESTS: every state comes to rest in one step. -/
theorem the_soliton_rests : Act soliton :=
  fun _ => ⟨1, rfl⟩

/-- NO WITNESS ON THE SELF-SIMILAR FLOW: a functional invariant under the rescaling cannot strictly decrease along a
    step that is the rescaling, at a state off the seat. -/
theorem no_witness_on_the_soliton : ¬ Nonempty (Witness soliton) :=
  fun ⟨P⟩ =>
    have d : P.W true < P.W false := P.decrease false (fun h => Bool.noConfusion h)
    have e : P.W true = P.W false := P.scaleFree false
    Nat.lt_irrefl _ (e ▸ d)

/-- THE WITNESS IS STRICTLY INSIDE THE ACT: every witness gives the act, and on the self-similar flow the act holds
    where no witness exists. -/
theorem the_witness_is_strictly_inside_the_act :
    (∀ F : Flow, Nonempty (Witness F) → Act F) ∧ (Act soliton ∧ ¬ Nonempty (Witness soliton)) :=
  ⟨fun F ⟨P⟩ => a_witness_gives_the_act F P, the_soliton_rests, no_witness_on_the_soliton⟩

/-! ## P.2 · The bit is the minimal premise; the witness route is strictly stronger -/

/-- A HOST: a flow whose act is exactly the host's sentence. -/
structure Host where
  flow     : Flow
  Sentence : Prop
  binding  : Act flow ↔ Sentence

/-- A route to the sentence, read on every host. -/
abbrev Route := Host → Prop

/-- The route yields the sentence on every host. -/
def Yields (P : Route) : Prop := ∀ H, P H → H.Sentence

/-- A MINIMAL ROUTE: necessary and sufficient for the sentence on every host. -/
def Minimal (P : Route) : Prop := ∀ H, P H ↔ H.Sentence

/-- A STRICTLY STRONGER ROUTE: it yields the sentence on every host, and some host has the sentence without it. -/
def StrictlyStronger (P : Route) : Prop := Yields P ∧ ∃ H : Host, H.Sentence ∧ ¬ P H

/-- The bit's route: the act of the host's flow. -/
def bitRoute : Route := fun H => Act H.flow

/-- Perelman's route, by its shape: a witness on the host's flow. -/
def witnessRoute : Route := fun H => Nonempty (Witness H.flow)

/-- The self-similar host: its sentence is the act of the self-similar flow. -/
def solitonHost : Host := ⟨soliton, Act soliton, Iff.rfl⟩

/-- THE BIT IS MINIMAL: on every host the act is necessary and sufficient for the sentence. -/
theorem the_bit_is_minimal : Minimal bitRoute :=
  fun H => H.binding

/-- THE WITNESS ROUTE IS STRICTLY STRONGER THAN THE SENTENCE: a witness yields the sentence on every host, and the
    self-similar host has the sentence and no witness. -/
theorem the_witness_route_is_strictly_stronger : StrictlyStronger witnessRoute :=
  ⟨fun H ⟨P⟩ => H.binding.mp (a_witness_gives_the_act H.flow P), solitonHost, the_soliton_rests,
   no_witness_on_the_soliton⟩

/-- A MINIMAL ROUTE IS NEVER STRICTLY STRONGER. -/
theorem a_minimal_route_is_not_strictly_stronger (P : Route) (h : Minimal P) : ¬ StrictlyStronger P :=
  fun ⟨_, H, hs, hn⟩ => hn ((h H).mpr hs)

/-- THE WITNESS ROUTE IS NOT MINIMAL. -/
theorem the_witness_route_is_not_minimal : ¬ Minimal witnessRoute :=
  fun h => a_minimal_route_is_not_strictly_stronger witnessRoute h the_witness_route_is_strictly_stronger

/-- EVERY ROUTE TO THE SENTENCE PASSES THE BIT: whatever yields the sentence on every host yields the act. -/
theorem every_route_to_the_sentence_passes_the_bit (Q : Route) (hQ : Yields Q) : ∀ H, Q H → bitRoute H :=
  fun H q => H.binding.mpr (hQ H q)

/-- THE WITNESS ROUTE PASSES THE BIT: to accept a witness as yielding the sentence is to accept a delivery of the bit. -/
theorem the_witness_route_passes_the_bit : ∀ H, witnessRoute H → bitRoute H :=
  every_route_to_the_sentence_passes_the_bit witnessRoute (And.left the_witness_route_is_strictly_stronger)

/-! ## P.3 · One footing for the seven -/

/-- The seven rows. -/
inductive Seven where
  | rh | pnp | ns | ym | hodge | bsd | pc

/-- ONE FOOTING: assign a host to each of the seven rows. At every row, the Poincaré row included, every premise that
    yields the row's sentence yields its act, and the act yields the sentence. The statement reads no row. -/
theorem the_seven_stand_on_one_footing (H : Seven → Host) :
    ∀ i, (∀ Q : Prop, (Q → (H i).Sentence) → Q → Act (H i).flow) ∧ (Act (H i).flow → (H i).Sentence) :=
  fun i => ⟨fun _ h q => (H i).binding.mpr (h q), (H i).binding.mp⟩

/-! ## P.4 · Delivered twice, armed once -/

/-- A DELIVERY IN TWO KINDS of a sentence: a formal cargo exactly equivalent to the sentence, and a physical witness
    that yields it. -/
structure Delivery (S : Prop) where
  Cargo    : Prop
  Physical : Prop
  axis     : Cargo ↔ S
  physical : Physical → S

/-- DELIVERED TWICE: either kind gives the sentence. -/
theorem delivered_in_two_kinds {S : Prop} (D : Delivery S) : (D.Cargo → S) ∧ (D.Physical → S) :=
  ⟨D.axis.mp, D.physical⟩

/-- ARMED: one refuter of the sentence refutes both kinds at once. -/
theorem one_refuter_refutes_both_kinds {S : Prop} (D : Delivery S) : ¬ S → ¬ D.Cargo ∧ ¬ D.Physical :=
  fun hn => ⟨fun c => hn (D.axis.mp c), fun w => hn (D.physical w)⟩

/-! ## P.5 · A rule, not a value -/

/-- A row as the hunt reads it: frames, the value of a frame, a calm frame where the value holds, and a counter frame
    where it fails. -/
structure SplitRow where
  Frame         : Type
  Value         : Frame → Prop
  calm          : Frame
  counter       : Frame
  calm_value    : Value calm
  counter_fails : ¬ Value counter

/-- The pattern frame on the product of the seven rows: the calm frame where the pattern reads true, the counter frame
    where it reads false. -/
def patternFrame (K : Seven → SplitRow) (S : Seven → Bool) : ∀ i, (K i).Frame :=
  fun i => cond (S i) (K i).calm (K i).counter

theorem patternFrame_realizes (K : Seven → SplitRow) (S : Seven → Bool) (i : Seven) :
    (K i).Value (patternFrame K S i) ↔ S i = true := by
  show (K i).Value (cond (S i) (K i).calm (K i).counter) ↔ S i = true
  cases S i with
  | true => exact ⟨fun _ => rfl, fun _ => (K i).calm_value⟩
  | false => exact ⟨fun h => absurd h (K i).counter_fails, fun h => Bool.noConfusion h⟩

/-- EVERY PATTERN OF THE SEVEN VALUES IS REALIZED: each of the 2^7 patterns holds at a frame of the product, so the
    seven values are independent. -/
theorem every_pattern_of_the_seven_values_is_realized (K : Seven → SplitRow) (S : Seven → Bool) :
    ∃ F : ∀ i, (K i).Frame, ∀ i, (K i).Value (F i) ↔ S i = true :=
  ⟨patternFrame K S, patternFrame_realizes K S⟩

/-- The pattern of the Poincaré value alone: true at Poincaré, false at the other six. -/
def poincareAlone : Seven → Bool
  | .pc => true
  | _ => false

theorem poincareAlone_off : ∀ i : Seven, Seven.pc ≠ i → poincareAlone i = false
  | .rh, _ => rfl
  | .pnp, _ => rfl
  | .ns, _ => rfl
  | .ym, _ => rfl
  | .hodge, _ => rfl
  | .bsd, _ => rfl
  | .pc, h => absurd rfl h

/-- THE POINCARÉ VALUE SETTLES NO OTHER ROW: a frame of the product carries the Poincaré value and fails the value of
    any other row. -/
theorem the_poincare_value_settles_no_other (K : Seven → SplitRow) (i : Seven) (h : Seven.pc ≠ i) :
    ∃ F : ∀ j, (K j).Frame, (K .pc).Value (F .pc) ∧ ¬ (K i).Value (F i) :=
  ⟨patternFrame K poincareAlone, (patternFrame_realizes K poincareAlone .pc).mpr rfl,
   fun hv => Bool.noConfusion (((patternFrame_realizes K poincareAlone i).mp hv).symm.trans (poincareAlone_off i h))⟩

/-! ## P.6 · The other road -/

/-- Adopting P as an axiom proves exactly what adopting S proves. -/
def ProvesAlike (P S : Prop) : Prop := ∀ Q : Prop, (P → Q) ↔ (S → Q)

/-- ADOPTING THE BIT IS ADOPTING THE SENTENCE: a premise is necessary and sufficient for the sentence exactly when
    adopting it proves what adopting the sentence proves. -/
theorem adopting_the_bit_is_adopting_the_sentence (B S : Prop) : ((S → B) ∧ (B → S)) ↔ ProvesAlike B S :=
  ⟨fun h _ => ⟨fun k s => k (h.1 s), fun k b => k (h.2 b)⟩, fun h => ⟨(h B).mp id, (h S).mpr id⟩⟩

/-- The verdicts of the admission screen, in gate order. -/
inductive Verdict where
  | illformed | inconsistent | circular | inert | conditional | candidate

/-- What the screen reads of a posit. -/
structure Posit where
  wellformed : Bool
  refuted    : Bool
  equivalent : Bool
  coupled    : Bool
  cited      : Bool
  breadth    : Nat

/-- The admission screen, gate by gate, in the order of the hunt's `PerelmanHunt.screen`. -/
def admit (p : Posit) : Verdict :=
  match p.wellformed, p.refuted, p.equivalent, p.coupled, p.cited, p.breadth with
  | false, _, _, _, _, _ => .illformed
  | true, true, _, _, _, _ => .inconsistent
  | true, false, true, _, _, _ => .circular
  | true, false, false, false, _, _ => .inert
  | true, false, false, true, true, _ => .conditional
  | true, false, false, true, false, 0 => .conditional
  | true, false, false, true, false, _ + 1 => .candidate

/-- THE BIT IS REFUSED AS CIRCULAR: a well-formed posit, refuted by nothing, equivalent to its target, is refused at
    the circularity gate, whatever its coupling, its literature and its breadth. -/
theorem the_bit_is_refused_as_circular (c l : Bool) (b : Nat) :
    admit ⟨true, false, true, c, l, b⟩ = Verdict.circular := rfl

/-! ## Ω · The stronger case, in miniature -/

/-- THE STRONGER CASE, IN MINIATURE, nothing before the colon: the witness strictly inside the act; the bit minimal on
    every host; the witness route strictly stronger and not minimal; the witness route passing the bit; the seven on
    one footing; two kinds, either giving the sentence, one refuter refuting both; every pattern of the seven values
    realized and the Poincaré value settling no other; adopting the bit is adopting the sentence; and the bit refused
    as circular at the screen. -/
theorem the_stronger_case_in_miniature :
    type_of% @the_witness_is_strictly_inside_the_act ∧
    type_of% @the_bit_is_minimal ∧
    type_of% @the_witness_route_is_strictly_stronger ∧
    type_of% @the_witness_route_is_not_minimal ∧
    type_of% @the_witness_route_passes_the_bit ∧
    type_of% @the_seven_stand_on_one_footing ∧
    type_of% @delivered_in_two_kinds ∧
    type_of% @one_refuter_refutes_both_kinds ∧
    type_of% @every_pattern_of_the_seven_values_is_realized ∧
    type_of% @the_poincare_value_settles_no_other ∧
    type_of% @adopting_the_bit_is_adopting_the_sentence ∧
    type_of% @the_bit_is_refused_as_circular :=
  ⟨@the_witness_is_strictly_inside_the_act, @the_bit_is_minimal, @the_witness_route_is_strictly_stronger,
   @the_witness_route_is_not_minimal, @the_witness_route_passes_the_bit, @the_seven_stand_on_one_footing,
   @delivered_in_two_kinds, @one_refuter_refutes_both_kinds, @every_pattern_of_the_seven_values_is_realized,
   @the_poincare_value_settles_no_other, @adopting_the_bit_is_adopting_the_sentence, @the_bit_is_refused_as_circular⟩

end PoincarePrecedent

/-! ## Cones, pinned -/

/-- info: 'PoincarePrecedent.descent_bound' does not depend on any axioms -/
#guard_msgs in #print axioms PoincarePrecedent.descent_bound
/-- info: 'PoincarePrecedent.a_witness_gives_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms PoincarePrecedent.a_witness_gives_the_act
/-- info: 'PoincarePrecedent.the_soliton_rests' does not depend on any axioms -/
#guard_msgs in #print axioms PoincarePrecedent.the_soliton_rests
/-- info: 'PoincarePrecedent.no_witness_on_the_soliton' does not depend on any axioms -/
#guard_msgs in #print axioms PoincarePrecedent.no_witness_on_the_soliton
/-- info: 'PoincarePrecedent.the_witness_is_strictly_inside_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms PoincarePrecedent.the_witness_is_strictly_inside_the_act
/-- info: 'PoincarePrecedent.the_bit_is_minimal' does not depend on any axioms -/
#guard_msgs in #print axioms PoincarePrecedent.the_bit_is_minimal
/-- info: 'PoincarePrecedent.the_witness_route_is_strictly_stronger' does not depend on any axioms -/
#guard_msgs in #print axioms PoincarePrecedent.the_witness_route_is_strictly_stronger
/-- info: 'PoincarePrecedent.a_minimal_route_is_not_strictly_stronger' does not depend on any axioms -/
#guard_msgs in #print axioms PoincarePrecedent.a_minimal_route_is_not_strictly_stronger
/-- info: 'PoincarePrecedent.the_witness_route_is_not_minimal' does not depend on any axioms -/
#guard_msgs in #print axioms PoincarePrecedent.the_witness_route_is_not_minimal
/-- info: 'PoincarePrecedent.every_route_to_the_sentence_passes_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms PoincarePrecedent.every_route_to_the_sentence_passes_the_bit
/-- info: 'PoincarePrecedent.the_witness_route_passes_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms PoincarePrecedent.the_witness_route_passes_the_bit
/-- info: 'PoincarePrecedent.the_seven_stand_on_one_footing' does not depend on any axioms -/
#guard_msgs in #print axioms PoincarePrecedent.the_seven_stand_on_one_footing
/-- info: 'PoincarePrecedent.delivered_in_two_kinds' does not depend on any axioms -/
#guard_msgs in #print axioms PoincarePrecedent.delivered_in_two_kinds
/-- info: 'PoincarePrecedent.one_refuter_refutes_both_kinds' does not depend on any axioms -/
#guard_msgs in #print axioms PoincarePrecedent.one_refuter_refutes_both_kinds
/-- info: 'PoincarePrecedent.patternFrame_realizes' does not depend on any axioms -/
#guard_msgs in #print axioms PoincarePrecedent.patternFrame_realizes
/-- info: 'PoincarePrecedent.every_pattern_of_the_seven_values_is_realized' does not depend on any axioms -/
#guard_msgs in #print axioms PoincarePrecedent.every_pattern_of_the_seven_values_is_realized
/-- info: 'PoincarePrecedent.poincareAlone_off' does not depend on any axioms -/
#guard_msgs in #print axioms PoincarePrecedent.poincareAlone_off
/-- info: 'PoincarePrecedent.the_poincare_value_settles_no_other' does not depend on any axioms -/
#guard_msgs in #print axioms PoincarePrecedent.the_poincare_value_settles_no_other
/-- info: 'PoincarePrecedent.adopting_the_bit_is_adopting_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms PoincarePrecedent.adopting_the_bit_is_adopting_the_sentence
/-- info: 'PoincarePrecedent.the_bit_is_refused_as_circular' does not depend on any axioms -/
#guard_msgs in #print axioms PoincarePrecedent.the_bit_is_refused_as_circular
/-- info: 'PoincarePrecedent.the_stronger_case_in_miniature' does not depend on any axioms -/
#guard_msgs in #print axioms PoincarePrecedent.the_stronger_case_in_miniature
