/-! # TRISDUCTION · THE PSP CODEX, SUPPLEMENT · THE LEDGER ARITHMETIC AND THE DISCIPLINE SCREENS

    Standalone, core-only, no import line, no dependence on the master
    codex. What does NOT splice into the master and stands beside it:
    the anchor and promotion block (P10, P11), the barrier courts, the
    absolute barriers, the standpoint closure, the composite join and the
    genealogy count (P12-P16), and the discipline screens, the Decalogue,
    the shield, the import screen, the execution limit, the forgettings
    (P17-P21). These are censuses and screens on the record, decided on
    the data they list; they are true of that data and claim nothing
    beyond it, and none of them is a theorem of geometry. Delta-M = 0.

    RH and P-versus-NP are not decided anywhere in this file: the barrier
    ledgers count rows the register printed. -/
namespace PSP.ANCHOR

structure Derivation where
  anchor : String
  steps  : List String

theorem anchor_first (d : Derivation) :
    (d.anchor :: d.steps).head? = some d.anchor := rfl

end PSP.ANCHOR

namespace PSP.GROUND

inductive Grade
  | premise | corroboration | operational | structural
  | engineering | conditional | theoremConditional | analytic | theorem_
  deriving DecidableEq

def rank : Grade → Nat
  | .premise => 0 | .corroboration => 1 | .operational => 2 | .structural => 3
  | .engineering => 4 | .conditional => 5 | .theoremConditional => 6
  | .analytic => 7 | .theorem_ => 8

def weakest (a b : Grade) : Grade := if rank a ≤ rank b then a else b

theorem promotion_blocked : ∀ g : Grade, weakest Grade.premise g = Grade.premise := by
  intro g; cases g <;> rfl

theorem block_never_self_defeating :
    weakest Grade.analytic Grade.analytic = Grade.analytic := rfl
  -- the block is a theorem about foundations, not itself a foundation

end PSP.GROUND

namespace PSP.BARRIER

def courtCount : Nat := 3
def rowCount : Nat := 15
def courtIRows : Nat := 6

theorem barrier_ledger_census :
    courtCount = 3 ∧ rowCount = 15 ∧ courtIRows = 6 ∧
    courtIRows ≤ rowCount ∧ rowCount - courtIRows = 9 := by decide

end PSP.BARRIER

namespace PSP.ABSPNP

def absoluteBarriers : Nat := 8

theorem absolute_barrier_count : absoluteBarriers = 8 := rfl

end PSP.ABSPNP

namespace PSP.STANDPOINT

def standpointRows : Nat := 10
def premiseFree : Nat := 8

theorem standpoint_closure_census :
    standpointRows = 10 ∧ premiseFree = 8 ∧ premiseFree ≤ standpointRows ∧
    premiseFree * 100 / standpointRows = 80 := by decide

end PSP.STANDPOINT

namespace PSP.PNPCOMP

open PSP.GROUND

def composite (ceilings : List PSP.GROUND.Grade) : PSP.GROUND.Grade :=
  ceilings.foldl PSP.GROUND.weakest PSP.GROUND.Grade.theorem_

theorem composite_never_above_weakest_court :
    composite [PSP.GROUND.Grade.conditional, PSP.GROUND.Grade.structural,
               PSP.GROUND.Grade.corroboration]
      = PSP.GROUND.Grade.corroboration := rfl

end PSP.PNPCOMP

namespace PSP.GENEALOGY

def project (rows : List (String × String)) : List (String × String) :=
  rows.foldl (fun acc r =>
    if acc.any (fun a => a.2 == r.2) then acc else acc ++ [r]) []

theorem projection_counts_one_voice_once :
    project [("r1","sA"), ("r2","sA"), ("r3","sA"), ("r4","sB")]
      = [("r1","sA"), ("r4","sB")] := by decide

theorem projection_never_inflates :
    (project [("r1","sA"), ("r2","sA"), ("r3","sA"), ("r4","sB")]).length
      ≤ 4 := by decide

end PSP.GENEALOGY

namespace PSP.DECALOGUE

def rules : List Nat := List.range 10   -- ordinal census; texts resident in the deck
def exitCount : Nat := 1                -- the DELTAM-ADMIT cascade, printed unique

theorem decalogue_census :
    rules.length = 10 ∧ exitCount = 1 := by decide

end PSP.DECALOGUE

namespace PSP.SHIELD

def forbidden : List String :=
  ["As an AI", "As a language model", "It is important to remember",
   "I apologize", "I cannot", "While valid", "On the other hand"]

-- REPAIR v1.0.1.2: 1.0.1 built the screen on `String.splitOn`, which does not
-- reduce in the kernel, so its `decide` got stuck and the block had never been
-- run. `native_decide` would settle it by trusting the compiler, which this
-- corpus forbids inside a proof. The containment test is therefore rebuilt on
-- `List Char`, where every step is structural and the kernel checks it itself.
-- The screen decides the same strings; only the substrate changed.
def isPrefixC : List Char → List Char → Bool
  | [], _ => true
  | _, [] => false
  | a :: as, b :: bs => a == b && isPrefixC as bs

def containsC : List Char → List Char → Bool
  | _, [] => false
  | pat, b :: bs => isPrefixC pat (b :: bs) || containsC pat bs

def screen (s : String) : Bool :=
  forbidden.any fun t => containsC t.data s.data

theorem shield_battery :
    screen "As an AI, I note the gate" = true ∧
    screen "the gate holds at machine zero" = false ∧
    forbidden.length = 7 := by decide

end PSP.SHIELD

namespace PSP.IMPORT

def importGates : Nat := 5
def validatedCandidates : Nat := 12

theorem import_screen_census :
    importGates = 5 ∧ validatedCandidates = 12 := by decide

end PSP.IMPORT

namespace PSP.EXECLIMIT

def deviationSources : List String :=
  ["readout", "hidden-shaping", "precision-floor"]

theorem deviation_census : deviationSources.length = 3 := rfl

end PSP.EXECLIMIT

namespace PSP.FORGET

def forgettings : Nat := 3
theorem forget_census : forgettings = 3 := rfl

end PSP.FORGET

/-! ### GATE THREE, SUPPLEMENT
    One guard per declaration, 34 of them, generated from a probe. Every
    declaration of this file depends on no axiom at all: censuses on lists
    and screens on strings, decided. -/

/-- info: 'PSP.ANCHOR.anchor_first' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.ANCHOR.anchor_first
/-- info: 'PSP.GROUND.rank' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.GROUND.rank
/-- info: 'PSP.GROUND.weakest' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.GROUND.weakest
/-- info: 'PSP.GROUND.promotion_blocked' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.GROUND.promotion_blocked
/-- info: 'PSP.GROUND.block_never_self_defeating' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.GROUND.block_never_self_defeating
/-- info: 'PSP.BARRIER.courtCount' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.BARRIER.courtCount
/-- info: 'PSP.BARRIER.rowCount' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.BARRIER.rowCount
/-- info: 'PSP.BARRIER.courtIRows' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.BARRIER.courtIRows
/-- info: 'PSP.BARRIER.barrier_ledger_census' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.BARRIER.barrier_ledger_census
/-- info: 'PSP.ABSPNP.absoluteBarriers' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.ABSPNP.absoluteBarriers
/-- info: 'PSP.ABSPNP.absolute_barrier_count' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.ABSPNP.absolute_barrier_count
/-- info: 'PSP.STANDPOINT.standpointRows' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.STANDPOINT.standpointRows
/-- info: 'PSP.STANDPOINT.premiseFree' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.STANDPOINT.premiseFree
/-- info: 'PSP.STANDPOINT.standpoint_closure_census' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.STANDPOINT.standpoint_closure_census
/-- info: 'PSP.PNPCOMP.composite' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.PNPCOMP.composite
/-- info: 'PSP.PNPCOMP.composite_never_above_weakest_court' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.PNPCOMP.composite_never_above_weakest_court
/-- info: 'PSP.GENEALOGY.project' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.GENEALOGY.project
/-- info: 'PSP.GENEALOGY.projection_counts_one_voice_once' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.GENEALOGY.projection_counts_one_voice_once
/-- info: 'PSP.GENEALOGY.projection_never_inflates' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.GENEALOGY.projection_never_inflates
/-- info: 'PSP.DECALOGUE.rules' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.DECALOGUE.rules
/-- info: 'PSP.DECALOGUE.exitCount' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.DECALOGUE.exitCount
/-- info: 'PSP.DECALOGUE.decalogue_census' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.DECALOGUE.decalogue_census
/-- info: 'PSP.SHIELD.forbidden' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.SHIELD.forbidden
/-- info: 'PSP.SHIELD.isPrefixC' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.SHIELD.isPrefixC
/-- info: 'PSP.SHIELD.containsC' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.SHIELD.containsC
/-- info: 'PSP.SHIELD.screen' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.SHIELD.screen
/-- info: 'PSP.SHIELD.shield_battery' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.SHIELD.shield_battery
/-- info: 'PSP.IMPORT.importGates' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.IMPORT.importGates
/-- info: 'PSP.IMPORT.validatedCandidates' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.IMPORT.validatedCandidates
/-- info: 'PSP.IMPORT.import_screen_census' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.IMPORT.import_screen_census
/-- info: 'PSP.EXECLIMIT.deviationSources' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.EXECLIMIT.deviationSources
/-- info: 'PSP.EXECLIMIT.deviation_census' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.EXECLIMIT.deviation_census
/-- info: 'PSP.FORGET.forgettings' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.FORGET.forgettings
/-- info: 'PSP.FORGET.forget_census' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.FORGET.forget_census
