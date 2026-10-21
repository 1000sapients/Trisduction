/-! ===================================================================================================================
    PART G · THE CLOSURE OF THE QUESTION (namespace PNP.CLOSURE). Why the question is closed and not open: with the two
    halves of Cook and Levin cited as hypotheses, the Millennium sentence P ≠ NP and the bit are one proposition, so the
    question has no content but the bit; across the algorithm models of SAT the bit has no uniform answer, true in one
    world and false in another of the same predicate; every uniform route to it is barred; the supply gives the sentence
    by either kind; and the one refuter refutes the sentence itself. Nothing here derives the bit. It proves that the
    question is one bit, that the bit is keyed, and that what is open is a value and not a form.
=================================================================================================================== -/
namespace PNP.CLOSURE
open PNP.NORMALFORM PNP.SUPPLY

/-- THE TRANSFER, as a predicate on machines: the bit of a machine is the transfer of least escape from its record. -/
def Transfer (M : Machine) : Prop := NothingEscapes (Rec M) → NothingEscapes M

/-- SAT IS NP-HARD, the second half of Cook and Levin, stated as the kernel can state it: if SAT is in P then P = NP. -/
def SATHard : Prop := PNP.TM.SATinP → ¬ PNP.TM.P_ne_NP

/-- THE MILLENNIUM SENTENCE IS THE BIT: with SAT ∈ NP and SAT NP-hard cited, P ≠ NP and the transfer on the Turing SAT
    machine are one proposition. The question has no content beyond the bit, in either direction. -/
theorem millennium_sentence_is_the_bit (hNP : PNP.TM.InNP PNP.TM.satLang) (hHard : SATHard) :
    PNP.TM.P_ne_NP ↔ FormalCargo :=
  ⟨fun hP => PNP.TM.pnp_normal_form_turing.mpr (fun hs => hHard hs hP),
   fun h => PNP.TM.p_ne_np_of_not_inP hNP (PNP.TM.pnp_normal_form_turing.mp h)⟩

/-- THE DENIAL IS THE BIT'S DENIAL: P = NP, as the kernel states it, is exactly the failure of the transfer. -/
theorem denial_is_the_bits_denial (hNP : PNP.TM.InNP PNP.TM.satLang) (hHard : SATHard) :
    ¬ PNP.TM.P_ne_NP ↔ ¬ FormalCargo :=
  ⟨fun hn h => hn ((millennium_sentence_is_the_bit hNP hHard).mpr h),
   fun hn h => hn ((millennium_sentence_is_the_bit hNP hHard).mp h)⟩

/-- THE QUESTION HAS NO UNIFORM ANSWER: across the algorithm models of SAT, on the same formulas with the same
    predicate, the bit is neither always true nor always false. The closed world has it; the stage world lacks it.
    What every model shares therefore answers the question in no model. -/
theorem no_uniform_answer :
    ¬ (∀ (Alg : Type) (out : Alg → PNP.SAT.CNF → Bool) (time : Alg → PNP.SAT.CNF → Nat),
          Transfer (PNP.SAT.SAT Alg out time)) ∧
    ¬ (∀ (Alg : Type) (out : Alg → PNP.SAT.CNF → Bool) (time : Alg → PNP.SAT.CNF → Nat),
          ¬ Transfer (PNP.SAT.SAT Alg out time)) :=
  ⟨fun h => PNP.SAT.sat_stage_fails_closure 0
      (h Nat (fun A f => if Nat.beq A 0 then PNP.SAT.satB f else false) (fun _ _ => 0)
        (record_has_least_escape _ [])),
   fun h => h Nat (fun _ _ => false) (fun _ _ => 0) (fun _ => PNP.SAT.sat_closed_world_closes)⟩

/-- THE ONE REFUTER REFUTES THE SENTENCE: a polynomial-time Turing machine for SAT, with SAT NP-hard cited, denies
    P ≠ NP itself, and not only the supply. -/
theorem refuter_denies_the_sentence (hHard : SATHard)
    (e : ∃ (D : PNP.TM.Decider) (c k : Nat), Escapes PNP.TM.TMSAT D c k) : ¬ PNP.TM.P_ne_NP :=
  fun hP => PNP.TM.sep_tmsat_iff.mpr (fun hs => hHard hs hP) e

/-- THE QUESTION, CLOSED TO ONE BIT. With the two halves of Cook and Levin cited: the sentence is the bit and its
    denial is the bit's denial; the bit has no uniform answer across the models of SAT; no keyless premise and no
    SAT-uniform premise forces it; either kind of the supply gives the sentence; and the one refuter denies the
    sentence. What is open is the value of one implication; the form of the question is closed. -/
theorem question_closed_to_one_bit (hNP : PNP.TM.InNP PNP.TM.satLang) (hHard : SATHard) :
    (PNP.TM.P_ne_NP ↔ FormalCargo) ∧ (¬ PNP.TM.P_ne_NP ↔ ¬ FormalCargo) ∧
    (¬ (∀ (Alg : Type) (out : Alg → PNP.SAT.CNF → Bool) (time : Alg → PNP.SAT.CNF → Nat),
          Transfer (PNP.SAT.SAT Alg out time)) ∧
     ¬ (∀ (Alg : Type) (out : Alg → PNP.SAT.CNF → Bool) (time : Alg → PNP.SAT.CNF → Nat),
          ¬ Transfer (PNP.SAT.SAT Alg out time))) ∧
    (∀ P : Machine → Prop, Keyless P → ¬ Forces P) ∧
    (∀ P : Machine → Prop, PNP.SAT.SATKeyless P → ¬ PNP.SAT.SATForces P) ∧
    (FormalCargo → PNP.TM.P_ne_NP) ∧ (PhysicalWitness → PNP.TM.P_ne_NP) ∧
    ((∃ (D : PNP.TM.Decider) (c k : Nat), Escapes PNP.TM.TMSAT D c k) → ¬ PNP.TM.P_ne_NP) :=
  ⟨millennium_sentence_is_the_bit hNP hHard, denial_is_the_bits_denial hNP hHard, no_uniform_answer,
   keyless_forces_nothing, PNP.SAT.sat_keyless_forces_nothing,
   (p_ne_np_delivered_twice hNP).1, (p_ne_np_delivered_twice hNP).2, refuter_denies_the_sentence hHard⟩

end PNP.CLOSURE

/-- info: 'PNP.CLOSURE.millennium_sentence_is_the_bit' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.CLOSURE.millennium_sentence_is_the_bit
/-- info: 'PNP.CLOSURE.denial_is_the_bits_denial' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.CLOSURE.denial_is_the_bits_denial
/-- info: 'PNP.CLOSURE.no_uniform_answer' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CLOSURE.no_uniform_answer
/-- info: 'PNP.CLOSURE.refuter_denies_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.CLOSURE.refuter_denies_the_sentence
/-- info: 'PNP.CLOSURE.question_closed_to_one_bit' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.CLOSURE.question_closed_to_one_bit
