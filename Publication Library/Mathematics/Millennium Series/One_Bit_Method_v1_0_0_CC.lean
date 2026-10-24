/-
  One_Bit_Method_v1_0_0_CC.lean · the executable form of the one-bit method
  Claude-coded (_CC), 23 October 2026. Core Lean 4.19.0: no import, no axiom declared, no sorry, no native_decide.

  The method of the Millennium series, as code. Part S is the synthesis's one normal form (the root file of the
  Millennium Grand Master, Part S.1 and S.6, verbatim). Part H is the generic half of the Perelmanification hunt
  (module Millennium.Hunt, sections H.1 to H.5 and H.8, verbatim): the seven properties as the signature of
  equivalence, the admission screen written as code, keys and walls, one principle on many rows, the product of rows,
  and finite stretches. Part M is new: the method as one theorem. A row builds four things, a row of the normal form,
  a host whose value is the row's sentence, and two coherent frames, calm and counter, splitting on the value; the
  method returns the closure: the sentence is the bit, the record decides nothing, no keyless premise forces it, the
  bit has no uniform answer, every route passes it, either delivery gives the sentence, and the upgrade of the bit is
  the adoption of the sentence. The master's root carries Part M verbatim and runs it on the series' rows.

  Every theorem below is pinned by #guard_msgs at the foot of the file; any drift fails the compile. ΔM = 0.
-/

namespace OneBitMethod

universe u

/-! ## Part S · One normal form (Millennium Grand Master, Part S.1 and S.6, verbatim) -/

/-- A ROW OF THE NORMAL FORM: frames, the value of a frame, the registration of a frame onto its record, and the
    record of every frame carrying the value. -/
structure NRow where
  Frame            : Type u
  Value            : Frame → Prop
  Rec              : Frame → Frame
  record_has_value : ∀ F, Value (Rec F)

/-- THE BIT OF A FRAME: the value carried from the frame's record to the frame. -/
def Transfer (R : NRow.{u}) (F : R.Frame) : Prop := R.Value (R.Rec F) → R.Value F

/-- THE NORMAL FORM, PROVED ONCE: on every row, the bit of a frame is exactly its value. -/
theorem normal_form_once (R : NRow.{u}) (F : R.Frame) : Transfer R F ↔ R.Value F :=
  ⟨fun h => h (R.record_has_value F), fun h _ => h⟩

/-- EVERY ROUTE PASSES THE BIT, PROVED ONCE: whatever yields the value yields the bit. -/
theorem every_route_passes_the_bit_once (R : NRow.{u}) (F : R.Frame) (Q : Prop) (h : Q → R.Value F) :
    Q → Transfer R F :=
  fun q _ => h q

/-- The toy row: two frames, true and false; the record of every frame is true. -/
def toy : NRow.{0} := ⟨Bool, fun b => b = true, fun _ => true, fun _ => rfl⟩

/-! ## Part H · The generic half of the hunt (module Millennium.Hunt, H.1 to H.5 and H.8, verbatim) -/

section seven
variable (Bit Sent : Prop)

/-- Necessary: every proof of the sentence yields the bit. -/
def Necessary : Prop := Sent → Bit
/-- Sufficient: the bit yields the sentence. -/
def Sufficient : Prop := Bit → Sent
/-- Mandatory: every route to the sentence is a route to the bit. -/
def Mandatory : Prop := ∀ Q : Prop, (Q → Sent) → Q → Bit
/-- No other proof: no premise yields the sentence and fails to yield the bit. -/
def NoOtherProof : Prop := ¬ ∃ Q : Prop, (Q → Sent) ∧ ¬ (Q → Bit)
/-- Future-proof: every restatement of the sentence, in any vocabulary, restates the bit. -/
def FutureProof : Prop := ∀ S : Prop, (S ↔ Sent) → (S ↔ Bit)
/-- Delivered by two kinds: whatever proves the sentence, cargo or witness, delivers the bit. -/
def TwoKinds (Cargo Witness : Prop) : Prop :=
  (Cargo → Sent) → (Witness → Sent) → (Cargo → Bit) ∧ (Witness → Bit)
/-- The standard-axiom upgrade, written out: adopting the bit as an axiom proves exactly what adopting the sentence
    proves. -/
def SameTheory : Prop := ∀ Q : Prop, (Bit → Q) ↔ (Sent → Q)

theorem necessary_and_sufficient_iff_equivalent :
    (Necessary Bit Sent ∧ Sufficient Bit Sent) ↔ (Bit ↔ Sent) :=
  ⟨fun h => ⟨h.2, h.1⟩, fun e => ⟨e.mpr, e.mp⟩⟩

/-- THE UPGRADE IS ADOPTION: a premise is necessary and sufficient for the sentence exactly when adopting it as an
    axiom proves the same propositions as adopting the sentence. -/
theorem upgrade_is_adoption :
    (Necessary Bit Sent ∧ Sufficient Bit Sent) ↔ SameTheory Bit Sent :=
  ⟨fun h _ => ⟨fun k s => k (h.1 s), fun k b => k (h.2 b)⟩,
   fun h => ⟨(h Bit).mp id, (h Sent).mpr id⟩⟩

/-- Equivalence alone gives four more of the seven: mandatory, no other proof, future-proof, the two kinds. -/
theorem equivalence_gives_four (e : Bit ↔ Sent) :
    Mandatory Bit Sent ∧ NoOtherProof Bit Sent ∧ FutureProof Bit Sent ∧
      ∀ C W : Prop, TwoKinds Bit Sent C W :=
  ⟨fun _ h q => e.mpr (h q),
   fun ⟨_, h, hn⟩ => hn (fun q => e.mpr (h q)),
   fun _ h => ⟨fun s => e.mpr (h.mp s), fun b => h.mpr (e.mp b)⟩,
   fun _ _ hc hw => ⟨fun c => e.mpr (hc c), fun w => e.mpr (hw w)⟩⟩

/-- Mandatory already is necessity: the sentence is its own route. -/
theorem mandatory_is_necessity : Mandatory Bit Sent → Necessary Bit Sent :=
  fun h => h Sent id

end seven

/-- The admission states of the axiom generator's screen, in its gate order (axiom-generator v1.3.6, Part 1.1). -/
inductive Admission where
  | refusedIllformed | refusedInconsistent | refusedCircular | refusedInert | conditional | massCandidate
  deriving DecidableEq, Repr

/-- What the screen reads of a candidate. -/
structure Reading where
  wellformed    : Bool
  refutedByBase : Bool
  equivToTarget : Bool
  couplingProof : Bool
  inLiterature  : Bool
  breadth       : Nat

/-- The screen gate by gate, S3, A1, A2, A3, A4, A5, as `axf` in axiom_generator.py v1.3.6. -/
def screen (r : Reading) : Admission :=
  match r.wellformed, r.refutedByBase, r.equivToTarget, r.couplingProof, r.inLiterature, r.breadth with
  | false, _, _, _, _, _ => .refusedIllformed
  | true, true, _, _, _, _ => .refusedInconsistent
  | true, false, true, _, _, _ => .refusedCircular
  | true, false, false, false, _, _ => .refusedInert
  | true, false, false, true, true, _ => .conditional
  | true, false, false, true, false, 0 => .conditional
  | true, false, false, true, false, _ + 1 => .massCandidate

/-- The reading of the unified bit at the screen: a sentence of the base language, refuted by nothing known, and
    equivalent to its target by its own necessity and sufficiency (H.1, H.7). Coupling, literature and breadth are left
    free: the verdict does not read them. -/
def bitReading (c l : Bool) (b : Nat) : Reading := ⟨true, false, true, c, l, b⟩

/-- THE UPGRADE IS REFUSED CIRCULAR AT A2, whatever the coupling, the literature and the breadth. -/
theorem the_bit_is_refused_circular (c l : Bool) (b : Nat) :
    screen (bitReading c l b) = Admission.refusedCircular := rfl

/-- A row as the hunt reads it: frames, the value of a frame, and the two coherent frames every row kernel builds,
    one carrying the value and one failing it. -/
structure KRow where
  Frame         : Type u
  Value         : Frame → Prop
  calm          : Frame
  counter       : Frame
  calm_value    : Value calm
  counter_fails : ¬ Value counter

section rowlaws
variable (K : KRow.{u})

/-- A premise shared by every frame. -/
def Keyless (P : K.Frame → Prop) : Prop := ∀ F, P F
/-- A premise that forces the value on every frame where it holds. -/
def Forces (P : K.Frame → Prop) : Prop := ∀ F, P F → K.Value F
/-- A keyed premise: it fails at the counter frame. -/
def Keyed (P : K.Frame → Prop) : Prop := ¬ P K.counter

theorem keyless_forces_nothing (P : K.Frame → Prop) (hP : Keyless K P) : ¬ Forces K P :=
  fun h => K.counter_fails (h K.counter (hP K.counter))

/-- EVERY FORCING PREMISE IS KEYED: what forces the value fails where the value fails. -/
theorem forcing_is_keyed (P : K.Frame → Prop) (h : Forces K P) : Keyed K P :=
  fun hc => K.counter_fails (h K.counter hc)

/-- THE VALUE IS THE WEAKEST KEY: it forces itself, and every forcing premise implies it. -/
theorem the_value_is_the_weakest_key :
    Forces K K.Value ∧ ∀ P : K.Frame → Prop, Forces K P → ∀ F, P F → K.Value F :=
  ⟨fun _ h => h, fun _ h => h⟩

end rowlaws

section family
variable {ι : Type} (K : ι → KRow.{u})

/-- ONE PRINCIPLE FORCING EVERY ROW IS KEYED ON EVERY ROW. -/
theorem unified_forcing_is_keyed_on_every_row (U : ∀ i, (K i).Frame → Prop)
    (h : ∀ i, Forces (K i) (U i)) : ∀ i, Keyed (K i) (U i) :=
  fun i => forcing_is_keyed (K i) (U i) (h i)

/-- One keyless row breaks the union. -/
theorem one_keyless_row_breaks_the_union (U : ∀ i, (K i).Frame → Prop) (j : ι)
    (hj : Keyless (K j) (U j)) : ¬ ∀ i, Forces (K i) (U i) :=
  fun h => keyless_forces_nothing (K j) (U j) hj (h j)

/-- A frame of the product: one frame on every row. -/
def ProdFrame : Type u := ∀ i, (K i).Frame

/-- The pattern frame: the calm frame where the pattern reads true, the counter frame where it reads false. -/
def pick (S : ι → Bool) : ProdFrame K := fun i => cond (S i) (K i).calm (K i).counter

theorem pick_realizes (S : ι → Bool) (i : ι) : (K i).Value (pick K S i) ↔ S i = true := by
  show (K i).Value (cond (S i) (K i).calm (K i).counter) ↔ S i = true
  cases S i with
  | true => exact ⟨fun _ => rfl, fun _ => (K i).calm_value⟩
  | false => exact ⟨fun hv => absurd hv (K i).counter_fails, fun hf => Bool.noConfusion hf⟩

/-- THE VALUES ARE INDEPENDENT: every pattern of values over the rows is realized by a frame of the product. -/
theorem every_pattern_is_realized (S : ι → Bool) :
    ∃ F : ProdFrame K, ∀ i, (K i).Value (F i) ↔ S i = true :=
  ⟨pick K S, pick_realizes K S⟩

/-- ONE ROW SETTLES NO OTHER: a frame of the product carries the value on row p and fails it on row i. -/
theorem one_row_settles_no_other [DecidableEq ι] (p i : ι) (hpi : p ≠ i) :
    ∃ F : ProdFrame K, (K p).Value (F p) ∧ ¬ (K i).Value (F i) :=
  ⟨pick K (fun j => decide (j = p)),
   (pick_realizes K _ p).mpr (decide_eq_true rfl),
   fun hv => hpi (of_decide_eq_true ((pick_realizes K _ i).mp hv)).symm⟩

/-- A UNIFIED PRINCIPLE REJECTS EVERY COUNTER PATTERN: one premise on the product that forces every row's value is
    false at every pattern frame with a counter coordinate, so it carries a key on every coordinate. -/
theorem a_unified_principle_rejects_every_counter_pattern (U : ProdFrame K → Prop)
    (hU : ∀ F, U F → ∀ i, (K i).Value (F i)) (S : ι → Bool) (j : ι) (hj : S j = false) :
    ¬ U (pick K S) :=
  fun hu => Bool.noConfusion (((pick_realizes K S j).mp (hU _ hu j)).symm.trans hj)

/-- A principle shared by every product frame forces no row. -/
theorem a_keyless_union_forces_no_row (U : ProdFrame K → Prop) (hU : ∀ F, U F) (j : ι) :
    ¬ ∀ F, U F → (K j).Value (F j) :=
  fun h => (K j).counter_fails (h (pick K (fun _ => false)) (hU _))

end family

/-- NO FINITE STRETCH FORCES THE UNIVERSAL: for every height there is a predicate true at every instance up to that
    height and false one step beyond. -/
theorem no_finite_stretch_forces_the_universal (N : Nat) :
    ∃ c : Nat → Bool, (∀ n, n ≤ N → c n = true) ∧ c (N + 1) = false :=
  ⟨fun n => decide (n ≤ N), fun _ h => decide_eq_true h, decide_eq_false (Nat.not_succ_le_self N)⟩

/-! ## Part M · The method, as one theorem (new) -/

/-- WHAT A ROW BUILDS: a row of the normal form; a host frame whose value is the row's sentence; and two coherent
    frames, a calm frame carrying the value and a counter frame failing it, the record of each carrying the value.
    These are the method's four inputs; everything else is returned. -/
structure Closure where
  R             : NRow.{u}
  Sentence      : Prop
  host          : R.Frame
  host_value    : R.Value host ↔ Sentence
  calm          : R.Frame
  counter       : R.Frame
  calm_value    : R.Value calm
  counter_fails : ¬ R.Value counter

namespace Closure
variable (C : Closure.{u})

/-- The closure read as a row of the hunt: its two frames are the calm and the counter frame. -/
def toK : KRow.{u} := ⟨C.R.Frame, C.R.Value, C.calm, C.counter, C.calm_value, C.counter_fails⟩

/-- THE SENTENCE IS THE BIT: at the host, the row's sentence is exactly the transfer. -/
theorem sentence_is_the_bit : C.Sentence ↔ Transfer C.R C.host :=
  C.host_value.symm.trans (normal_form_once C.R C.host).symm

/-- THE RECORD DECIDES NOTHING: the record carries the value at the calm frame and at the counter frame, and the
    value splits between them. -/
theorem record_decides_nothing :
    C.R.Value (C.R.Rec C.calm) ∧ C.R.Value (C.R.Rec C.counter) ∧ C.R.Value C.calm ∧ ¬ C.R.Value C.counter :=
  ⟨C.R.record_has_value C.calm, C.R.record_has_value C.counter, C.calm_value, C.counter_fails⟩

/-- ONE RECORD, NO DECIDING PREDICATE: where the two frames share one record, no predicate of the record decides the
    value. -/
theorem record_predicate_decides_nothing (h : C.R.Rec C.calm = C.R.Rec C.counter) :
    ¬ ∃ g : C.R.Frame → Prop, ∀ F, C.R.Value F ↔ g (C.R.Rec F) :=
  fun ⟨_, hg⟩ => C.counter_fails ((hg C.counter).mpr (h ▸ (hg C.calm).mp C.calm_value))

/-- THE WALL: a premise shared by every frame forces nothing. -/
theorem the_wall_on_the_row (P : C.R.Frame → Prop) (hP : ∀ F, P F) : ¬ ∀ F, P F → C.R.Value F :=
  keyless_forces_nothing C.toK P hP

/-- THE BIT HAS NO UNIFORM ANSWER: the transfer holds on the calm frame and fails on the counter frame. -/
theorem no_uniform_answer : ¬ (∀ F, Transfer C.R F) ∧ ¬ (∀ F, ¬ Transfer C.R F) :=
  ⟨fun h => C.counter_fails (h C.counter (C.R.record_has_value C.counter)),
   fun h => h C.calm (fun _ => C.calm_value)⟩

/-- EVERY ROUTE PASSES THE BIT: whatever premise yields the sentence yields the transfer at the host. -/
theorem every_route_passes_the_bit (Q : Prop) (h : Q → C.Sentence) : Q → Transfer C.R C.host :=
  fun q => C.sentence_is_the_bit.mp (h q)

/-- DELIVERED TWICE: a formal cargo and a physical witness, each delivering the bit, each give the sentence. -/
theorem delivered_twice (Cargo Witness : Prop) (hc : Cargo → Transfer C.R C.host)
    (hw : Witness → Transfer C.R C.host) : (Cargo → C.Sentence) ∧ (Witness → C.Sentence) :=
  ⟨fun c => C.sentence_is_the_bit.mpr (hc c), fun w => C.sentence_is_the_bit.mpr (hw w)⟩

/-- THE UPGRADE OF THE BIT IS THE ADOPTION OF THE SENTENCE. -/
theorem upgrade_is_adopting_the_sentence : SameTheory (Transfer C.R C.host) C.Sentence :=
  (upgrade_is_adoption _ _).mp ((necessary_and_sufficient_iff_equivalent _ _).mpr C.sentence_is_the_bit.symm)

/-- THE METHOD, as one theorem with nothing before its colon beyond the four inputs: the sentence is the bit; the
    record decides nothing; no keyless premise forces the value; the bit has no uniform answer; every route passes
    the bit; either delivery gives the sentence; and the upgrade of the bit is the adoption of the sentence. -/
theorem the_method :
    (C.Sentence ↔ Transfer C.R C.host) ∧
    (C.R.Value (C.R.Rec C.calm) ∧ C.R.Value (C.R.Rec C.counter) ∧ C.R.Value C.calm ∧ ¬ C.R.Value C.counter) ∧
    (∀ P : C.R.Frame → Prop, (∀ F, P F) → ¬ ∀ F, P F → C.R.Value F) ∧
    (¬ (∀ F, Transfer C.R F) ∧ ¬ (∀ F, ¬ Transfer C.R F)) ∧
    (∀ Q : Prop, (Q → C.Sentence) → Q → Transfer C.R C.host) ∧
    (∀ Cargo Witness : Prop, (Cargo → Transfer C.R C.host) → (Witness → Transfer C.R C.host) →
      (Cargo → C.Sentence) ∧ (Witness → C.Sentence)) ∧
    SameTheory (Transfer C.R C.host) C.Sentence :=
  ⟨C.sentence_is_the_bit, C.record_decides_nothing, C.the_wall_on_the_row, C.no_uniform_answer,
   C.every_route_passes_the_bit, C.delivered_twice, C.upgrade_is_adopting_the_sentence⟩

end Closure

/-- THE METHOD ON ITS TOY ROW: the toy row with host true, sentence `true = true`, calm true and counter false. -/
def toyClosure : Closure.{0} where
  R := toy
  Sentence := true = true
  host := true
  host_value := Iff.rfl
  calm := true
  counter := false
  calm_value := rfl
  counter_fails := Bool.noConfusion

theorem the_closure_on_its_toy_row : type_of% (Closure.the_method toyClosure) := Closure.the_method toyClosure

/-- On the toy row the two frames share one record, so no predicate of the record decides the value. -/
theorem the_toy_record_decides_nothing :
    ¬ ∃ g : toyClosure.R.Frame → Prop, ∀ F, toyClosure.R.Value F ↔ g (toyClosure.R.Rec F) :=
  Closure.record_predicate_decides_nothing toyClosure rfl

end OneBitMethod

/-! ## Cones, pinned -/
/-- info: 'OneBitMethod.normal_form_once' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.normal_form_once
/-- info: 'OneBitMethod.every_route_passes_the_bit_once' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.every_route_passes_the_bit_once
/-- info: 'OneBitMethod.necessary_and_sufficient_iff_equivalent' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.necessary_and_sufficient_iff_equivalent
/-- info: 'OneBitMethod.upgrade_is_adoption' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.upgrade_is_adoption
/-- info: 'OneBitMethod.equivalence_gives_four' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.equivalence_gives_four
/-- info: 'OneBitMethod.mandatory_is_necessity' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.mandatory_is_necessity
/-- info: 'OneBitMethod.the_bit_is_refused_circular' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.the_bit_is_refused_circular
/-- info: 'OneBitMethod.keyless_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.keyless_forces_nothing
/-- info: 'OneBitMethod.forcing_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.forcing_is_keyed
/-- info: 'OneBitMethod.the_value_is_the_weakest_key' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.the_value_is_the_weakest_key
/-- info: 'OneBitMethod.unified_forcing_is_keyed_on_every_row' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.unified_forcing_is_keyed_on_every_row
/-- info: 'OneBitMethod.one_keyless_row_breaks_the_union' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.one_keyless_row_breaks_the_union
/-- info: 'OneBitMethod.pick_realizes' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.pick_realizes
/-- info: 'OneBitMethod.every_pattern_is_realized' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.every_pattern_is_realized
/-- info: 'OneBitMethod.one_row_settles_no_other' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.one_row_settles_no_other
/-- info: 'OneBitMethod.a_unified_principle_rejects_every_counter_pattern' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.a_unified_principle_rejects_every_counter_pattern
/-- info: 'OneBitMethod.a_keyless_union_forces_no_row' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.a_keyless_union_forces_no_row
/-- info: 'OneBitMethod.no_finite_stretch_forces_the_universal' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.no_finite_stretch_forces_the_universal
/-- info: 'OneBitMethod.Closure.sentence_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.Closure.sentence_is_the_bit
/-- info: 'OneBitMethod.Closure.record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.Closure.record_decides_nothing
/-- info: 'OneBitMethod.Closure.record_predicate_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.Closure.record_predicate_decides_nothing
/-- info: 'OneBitMethod.Closure.the_wall_on_the_row' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.Closure.the_wall_on_the_row
/-- info: 'OneBitMethod.Closure.no_uniform_answer' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.Closure.no_uniform_answer
/-- info: 'OneBitMethod.Closure.every_route_passes_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.Closure.every_route_passes_the_bit
/-- info: 'OneBitMethod.Closure.delivered_twice' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.Closure.delivered_twice
/-- info: 'OneBitMethod.Closure.upgrade_is_adopting_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.Closure.upgrade_is_adopting_the_sentence
/-- info: 'OneBitMethod.Closure.the_method' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.Closure.the_method
/-- info: 'OneBitMethod.the_closure_on_its_toy_row' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.the_closure_on_its_toy_row
/-- info: 'OneBitMethod.the_toy_record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitMethod.the_toy_record_decides_nothing
