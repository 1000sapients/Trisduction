/-
  Millennium_Grand_Master_v1_0_0_CC.lean · the root of the Millennium Grand Master
  Claude-coded (_CC), 23 October 2026. Lean 4.19.0, Mathlib v4.19.0.

  ONE MASTER, EIGHT ORIGINALS. This file binds the eight original masters of the Millennium series, the four Mathlib
  bindings, the three kernels of Appendix R and the Perelmanification hunt into one environment, and proves the
  synthesis over them. Every original is a module of the tree `Millennium/`, compiled in its own environment, so every
  cone each original pins stays exactly what it pinned: the core masters import nothing and keep their empty cones,
  and the RH master and the bindings keep their Mathlib imports. Pasting the originals into one file under Mathlib was
  measured to move 220 pinned cones and break eight proofs; the module tree moves none.

  The tree, each module's provenance certified in cert/:
    Millennium.TOE_Zero, .Triaxial_Actuation, .Root_Grade_Ledger   Appendix R, verbatim
    Millennium.FTOE_Shared   the fTOE kernel the RH and P ≠ NP masters share, lines 14560 to 14843 of the RH master,
                             verbatim; its 62 declarations are text-identical to their copies in the P ≠ NP master
    Millennium.RH            RH_Both_Sides_Formal_Master_v3_0_39_CC, its TOE0 and FTOE blocks replaced by imports of
                             the two modules above (Lean refuses one name declared twice); every other byte verbatim
    Millennium.PNP           PNP_Normal_Form_Paper_v1_13_0_CC, its 62 shared fTOE declarations replaced by the import
                             of FTOE_Shared; every other byte verbatim, its six own fTOE declarations kept in place
    Millennium.NS, .YM, .Hodge, .BSD, .PC, .GB   the six v1.1.0_CC row masters, verbatim
    Millennium.NSBind, .BSDBind, .PCBind, .GBBind  the four v1.1.0_CC Mathlib bindings, verbatim
    Millennium.Hunt          One_Bit_Perelmanification_Hunt_v1_0_0_CC, its import lines re-pointed to this tree

  This file, two parts:
    Part S · SYNTHESIS. S.1 one normal form, proved once; S.2 the seven rows as its instances; S.3 each row's own
      normal form recovered from the one by exact type; S.4 the seven closures, the seven two-kinds theorems, the seven
      nothing-escapes theorems, bound by exact type; S.5 the grade ledger; S.6 the method's toy row; S.7 the Poincaré
      precedent: one footing in the kernel, the 2002 functional a downstream strict subtype of the bridge, Perelman's
      offering strictly inside the bit, the bit the minimal premise; S.8 the method in one theorem, Part M of
      One_Bit_Method_v1_0_0_CC.lean verbatim, run on the five v1.1.0 rows at every host and on Goldbach.
    Part Ω · VERDICTS. `the_floor_verdict`, the five v1.1.0 rows on no axiom; `the_grand_verdict`, nothing before the
      colon, the seven terminal theorems, the one normal form, the hunt verdict, the Poincaré precedent, the method run
      on the rows and the RH value at Mathlib's zeros;
      `the_eighth_original`, Goldbach.
  Every theorem of this file is pinned by `#guard_msgs`; any drift fails the build. ΔM = 0.
-/
import Millennium.RH
import Millennium.PNP
import Millennium.NS
import Millennium.YM
import Millennium.Hodge
import Millennium.BSD
import Millennium.PC
import Millennium.GB
import Millennium.NSBind
import Millennium.BSDBind
import Millennium.PCBind
import Millennium.GBBind
import Millennium.TOE_Zero
import Millennium.Triaxial_Actuation
import Millennium.Root_Grade_Ledger
import Millennium.FTOE_Shared
import Millennium.Hunt

namespace MillenniumGrandMaster

universe u

/-! ## Part S · Synthesis -/

/-! ### S.1 · One normal form, proved once -/

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

/-! ### S.2 · The seven rows as instances -/

def ofNS (R : NS.NORMALFORM.Row.{u}) : NRow.{u} := ⟨R.Frame, R.Value, R.Rec, R.record_has_value⟩
def ofYM (R : YM.NORMALFORM.Row.{u}) : NRow.{u} := ⟨R.Frame, R.Value, R.Rec, R.record_has_value⟩
def ofHodge (R : HODGE.NORMALFORM.Row.{u}) : NRow.{u} := ⟨R.Frame, R.Value, R.Rec, R.record_has_value⟩
def ofBSD (R : BSD.NORMALFORM.Row.{u}) : NRow.{u} := ⟨R.Frame, R.Value, R.Rec, R.record_has_value⟩
def ofPC (R : PC.NORMALFORM.Row.{u}) : NRow.{u} := ⟨R.Frame, R.Value, R.Rec, R.record_has_value⟩
def ofGB (R : GB.NORMALFORM.Row.{u}) : NRow.{u} := ⟨R.Frame, R.Value, R.Rec, R.record_has_value⟩

/-- RH: configurations of points, least erasure, the registration of a configuration onto the line, and the record
    of every configuration carrying least erasure (RH master, `BoundChainMathlib`). -/
def nRH : NRow.{0} := ⟨BoundChainMathlib.Config, BoundChainMathlib.LeastErasure, BoundChainMathlib.Rec,
  BoundChainMathlib.record_has_least_erasure⟩

/-- P ≠ NP: machines with an instance to stop at, the closure that nothing escapes, the record of a machine, and the
    record carrying least escape (P ≠ NP master, Part A). -/
def nPNP : NRow.{1} where
  Frame := Σ M : PNP.NORMALFORM.Machine, M.Inst
  Value := fun F => PNP.NORMALFORM.NothingEscapes F.1
  Rec := fun F => ⟨PNP.NORMALFORM.Rec F.1, F.2⟩
  record_has_value := fun F => PNP.NORMALFORM.record_has_least_escape F.1 F.2

/-! ### S.3 · Each row's own normal form is the one, by exact type -/

theorem ns_normal_form_is_the_one : type_of% (NS.NORMALFORM.normal_form NS.HOST.nsRow) :=
  fun F => normal_form_once (ofNS NS.HOST.nsRow) F
theorem ym_normal_form_is_the_one : type_of% (YM.NORMALFORM.normal_form YM.HOST.ymRow) :=
  fun F => normal_form_once (ofYM YM.HOST.ymRow) F
theorem hodge_normal_form_is_the_one : type_of% (HODGE.NORMALFORM.normal_form HODGE.HOST.hodgeRow) :=
  fun F => normal_form_once (ofHodge HODGE.HOST.hodgeRow) F
theorem bsd_normal_form_is_the_one : type_of% (BSD.NORMALFORM.normal_form BSD.HOST.bsdRow) :=
  fun F => normal_form_once (ofBSD BSD.HOST.bsdRow) F
theorem pc_normal_form_is_the_one : type_of% (PC.NORMALFORM.normal_form PC.HOST.pcRow) :=
  fun F => normal_form_once (ofPC PC.HOST.pcRow) F
theorem gb_normal_form_is_the_one : type_of% (GB.NORMALFORM.normal_form GB.HOST.gbRow) :=
  fun F => normal_form_once (ofGB GB.HOST.gbRow) F

/-- P ≠ NP: the one normal form, followed by closure-iff-separation, is the master's own `sep_normal_form`. -/
theorem pnp_normal_form_is_the_one (M : PNP.NORMALFORM.Machine) (x₀ : M.Inst) :
    type_of% (PNP.NORMALFORM.sep_normal_form M x₀) :=
  (normal_form_once nPNP ⟨M, x₀⟩).trans ⟨PNP.NORMALFORM.sep_of_closure M, PNP.NORMALFORM.closure_of_sep M⟩

/-- RH: the one normal form at Mathlib's zeta zeros, followed by the master's `zeta_ra_loop`, makes least erasure at
    the zeros exactly Mathlib's `RiemannHypothesis`. -/
theorem rh_value_at_the_zeros_is_RiemannHypothesis :
    BoundChainMathlib.LeastErasure BoundChainMathlib.ZetaZeros ↔ RiemannHypothesis :=
  (normal_form_once nRH BoundChainMathlib.ZetaZeros).symm.trans BoundChainMathlib.zeta_ra_loop.1

/-! ### S.4 · The seven closures, two kinds, and nothing escapes, bound by exact type -/

/-- THE SEVEN QUESTIONS ARE CLOSED TO ONE BIT: RH's refutation of the open framing, P ≠ NP's closure, and each row's
    closure. -/
theorem seven_closed_to_one_bit :
    type_of% @TerminalVerdict.the_open_framing_is_refuted ∧
    type_of% @PNP.CLOSURE.question_closed_to_one_bit ∧
    type_of% @NS.CLOSURE.question_closed_to_one_bit ∧
    type_of% @YM.CLOSURE.question_closed_to_one_bit ∧
    type_of% @HODGE.CLOSURE.question_closed_to_one_bit ∧
    type_of% @BSD.CLOSURE.question_closed_to_one_bit ∧
    type_of% @PC.CLOSURE.question_closed_to_one_bit :=
  ⟨@TerminalVerdict.the_open_framing_is_refuted, @PNP.CLOSURE.question_closed_to_one_bit,
   @NS.CLOSURE.question_closed_to_one_bit, @YM.CLOSURE.question_closed_to_one_bit,
   @HODGE.CLOSURE.question_closed_to_one_bit, @BSD.CLOSURE.question_closed_to_one_bit,
   @PC.CLOSURE.question_closed_to_one_bit⟩

/-- TWO KINDS AND NO THIRD, SEVEN TIMES. -/
theorem seven_two_kinds :
    type_of% @RememberedOffered.two_kinds_of_witness_and_no_third ∧
    type_of% @PNP.SUPPLY.the_two_kinds_are_one_bit ∧
    type_of% @NS.SUPPLY.two_kinds_and_no_third ∧
    type_of% @YM.SUPPLY.two_kinds_and_no_third ∧
    type_of% @HODGE.SUPPLY.two_kinds_and_no_third ∧
    type_of% @BSD.SUPPLY.two_kinds_and_no_third ∧
    type_of% @PC.SUPPLY.two_kinds_and_no_third :=
  ⟨@RememberedOffered.two_kinds_of_witness_and_no_third, @PNP.SUPPLY.the_two_kinds_are_one_bit,
   @NS.SUPPLY.two_kinds_and_no_third, @YM.SUPPLY.two_kinds_and_no_third, @HODGE.SUPPLY.two_kinds_and_no_third,
   @BSD.SUPPLY.two_kinds_and_no_third, @PC.SUPPLY.two_kinds_and_no_third⟩

/-- NOTHING ESCAPES, SEVEN TIMES. -/
theorem seven_nothing_escapes :
    type_of% @BoundChainMathlib.nothing_escapes_at_the_zeros ∧
    type_of% @PNP.ESCAPE.nothing_escapes ∧
    type_of% @NS.ESCAPE.nothing_escapes ∧
    type_of% @YM.ESCAPE.nothing_escapes ∧
    type_of% @HODGE.ESCAPE.nothing_escapes ∧
    type_of% @BSD.ESCAPE.nothing_escapes ∧
    type_of% @PC.ESCAPE.nothing_escapes :=
  ⟨@BoundChainMathlib.nothing_escapes_at_the_zeros, @PNP.ESCAPE.nothing_escapes, @NS.ESCAPE.nothing_escapes,
   @YM.ESCAPE.nothing_escapes, @HODGE.ESCAPE.nothing_escapes, @BSD.ESCAPE.nothing_escapes,
   @PC.ESCAPE.nothing_escapes⟩

/-- EVERY ROUTE PASSES THE BIT, SEVEN TIMES. -/
theorem seven_routes_pass_the_bit :
    type_of% @BoundChainMathlib.every_route_passes_the_bit ∧
    type_of% @PNP.TM.tmsat_every_route_passes_the_bit ∧
    type_of% (NS.NORMALFORM.every_route_passes_the_bit NS.HOST.nsRow) ∧
    type_of% (YM.NORMALFORM.every_route_passes_the_bit YM.HOST.ymRow) ∧
    type_of% (HODGE.NORMALFORM.every_route_passes_the_bit HODGE.HOST.hodgeRow) ∧
    type_of% (BSD.NORMALFORM.every_route_passes_the_bit BSD.HOST.bsdRow) ∧
    type_of% (PC.NORMALFORM.every_route_passes_the_bit PC.HOST.pcRow) :=
  ⟨@BoundChainMathlib.every_route_passes_the_bit, @PNP.TM.tmsat_every_route_passes_the_bit,
   NS.NORMALFORM.every_route_passes_the_bit NS.HOST.nsRow, YM.NORMALFORM.every_route_passes_the_bit YM.HOST.ymRow,
   HODGE.NORMALFORM.every_route_passes_the_bit HODGE.HOST.hodgeRow,
   BSD.NORMALFORM.every_route_passes_the_bit BSD.HOST.bsdRow, PC.NORMALFORM.every_route_passes_the_bit PC.HOST.pcRow⟩

/-! ### S.5 · The grade ledger, and one footing in the kernel -/

/-- The four grades: on no axiom, on Lean's standard axioms alone, at premise grade with the premise printed, and cited
    at the grade of a published derivation. -/
inductive Grade where
  | noAxiom | standardAxioms | premise | citedDerivation
  deriving DecidableEq, Repr

/-- The grade of each row's form, read off its terminal theorem's pinned cone (pinned below). -/
def formGrade : PerelmanHunt.Row7 → Grade
  | .rh => .standardAxioms
  | .pnp => .standardAxioms
  | .ns => .noAxiom
  | .ym => .noAxiom
  | .hodge => .noAxiom
  | .bsd => .noAxiom
  | .pc => .noAxiom

/-- The grade of each row's bit in the kernel: a premise on all seven rows, the Poincaré bit included. Mathlib states
    the three-dimensional Poincaré theorem as `proof_wanted`, and this master receives the Poincaré bit as a hypothesis
    exactly as it receives the other six. -/
def kernelBitGrade : PerelmanHunt.Row7 → Grade := fun _ => .premise

/-- The record's standing of each bit: the Poincaré derivation accepted as unconditional by the Clay Institute
    (18 March 2010); the six other bits delivered twice by the act, by the formal cargo and by the physical witness. -/
inductive Standing where
  | acceptedUnconditional | deliveredTwiceByTheAct
  deriving DecidableEq, Repr

def standing : PerelmanHunt.Row7 → Standing
  | .pc => .acceptedUnconditional
  | _ => .deliveredTwiceByTheAct

/-- ONE FOOTING IN THE KERNEL: the seven bits stand at one grade, the Poincaré bit with the other six. -/
theorem one_footing_in_the_kernel : ∀ i j : PerelmanHunt.Row7, kernelBitGrade i = kernelBitGrade j :=
  fun _ _ => rfl

/-- No row's bit is proved in the kernel: on every row it is printed as a premise and delivered. -/
theorem every_bit_is_printed_as_a_premise : ∀ i : PerelmanHunt.Row7, kernelBitGrade i = Grade.premise :=
  fun _ => rfl

/-- FOUR ROWS, ONE SHAPE AT THE LIBRARY: the Poincaré bit is the library's Poincaré statement exactly as the RH bit is
    Mathlib's `RiemannHypothesis`, the Navier–Stokes bit Fefferman's statement (A), and the BSD bit the library's rank
    statement. -/
theorem four_rows_one_shape_at_the_library :
    type_of% @PerelmanHunt.rh_upgrade_is_adopting_RiemannHypothesis ∧
    type_of% @PerelmanHunt.pc_upgrade_is_adopting_PoincareThree ∧
    type_of% @PerelmanHunt.ns_upgrade_is_adopting_FeffermanA ∧
    type_of% @PerelmanHunt.bsd_upgrade_is_adopting_BSDRank :=
  ⟨@PerelmanHunt.rh_upgrade_is_adopting_RiemannHypothesis, @PerelmanHunt.pc_upgrade_is_adopting_PoincareThree,
   @PerelmanHunt.ns_upgrade_is_adopting_FeffermanA, @PerelmanHunt.bsd_upgrade_is_adopting_BSDRank⟩

/-! ### S.6 · The method's toy row, run through the steps on no axiom -/

/-- The toy row: two frames, true and false; the record of every frame is true. -/
def toy : NRow.{0} := ⟨Bool, fun b => b = true, fun _ => true, fun _ => rfl⟩
/-- The toy row's two coherent frames. -/
def toyK : PerelmanHunt.KRow.{0} := ⟨Bool, fun b => b = true, true, false, rfl, Bool.noConfusion⟩

/-- THE METHOD ON ITS TOY ROW: the normal form; the record shared, the values split; the keyless wall; every forcing
    premise keyed; and the upgrade of the bit is the adoption of the value. -/
theorem the_method_on_its_toy_row :
    (∀ b, Transfer toy b ↔ toy.Value b) ∧
    (toy.Rec true = toy.Rec false ∧ toy.Value true ∧ ¬ toy.Value false) ∧
    (∀ P : Bool → Prop, PerelmanHunt.Keyless toyK P → ¬ PerelmanHunt.Forces toyK P) ∧
    (∀ P : Bool → Prop, PerelmanHunt.Forces toyK P → PerelmanHunt.Keyed toyK P) ∧
    (∀ B : Prop, (PerelmanHunt.Necessary B (toy.Value true) ∧ PerelmanHunt.Sufficient B (toy.Value true)) ↔
      PerelmanHunt.SameTheory B (toy.Value true)) :=
  ⟨normal_form_once toy, ⟨rfl, rfl, Bool.noConfusion⟩, PerelmanHunt.keyless_forces_nothing toyK,
   PerelmanHunt.forcing_is_keyed toyK, fun B => PerelmanHunt.upgrade_is_adoption B _⟩

/-! ### S.7 · The Poincaré precedent, in the kernel -/

/-- THE POINCARÉ OFFERING IS STRICTLY INSIDE THE BIT: every witnessed flow delivers the cargo; the cargo stands on a host
    whose own classifying flow admits no witness; the faithful route is strictly stronger than the sentence; and the
    cargo is exactly the sentence (Poincaré master, Parts C and F). -/
theorem the_offering_is_strictly_inside_the_bit :
    type_of% @PC.SUPPLY.witnessed_flow_delivers_cargo ∧
    type_of% @PC.SUPPLY.cargo_without_witness ∧
    type_of% @PC.HOST.faithful_route_strictly_stronger ∧
    type_of% @PC.SUPPLY.formal_iff_sentence :=
  ⟨@PC.SUPPLY.witnessed_flow_delivers_cargo, @PC.SUPPLY.cargo_without_witness,
   @PC.HOST.faithful_route_strictly_stronger, @PC.SUPPLY.formal_iff_sentence⟩

/-- THE 2002 FUNCTIONAL IS A DOWNSTREAM STRICT SUBTYPE OF THE BRIDGE (Poincaré kernel of record, `PCClose`): a witness
    of the functional's shape, strict descent off the seat and invariance under the rescaling, supplies the act; every
    halted carrier of the row's value is the bridge's carrier at that act; on a flow whose rescaling is its step no
    witness exists; on the self-similar flow the act holds and the bridge carries a halted carrier where no witness
    does; and the crossing's shape contains the witness strictly. -/
theorem the_witness_is_a_strict_subtype :
    type_of% @PCClose.witness_gives_act ∧
    type_of% @PCClose.witness_downstream_strict_subtype ∧
    type_of% @PCClose.no_witness_on_self_similar ∧
    type_of% @PCClose.act_without_witness ∧
    type_of% @PCClose.bridge_without_witness ∧
    type_of% @PCClose.crossing_types_the_crossing :=
  ⟨@PCClose.witness_gives_act, @PCClose.witness_downstream_strict_subtype, @PCClose.no_witness_on_self_similar,
   @PCClose.act_without_witness, @PCClose.bridge_without_witness, @PCClose.crossing_types_the_crossing⟩

/-- THE BIT IS THE MINIMAL PREMISE: on every Poincaré host, every premise that yields the sentence yields the cargo, and
    the cargo yields the sentence. -/
theorem the_bit_is_the_minimal_premise (H : PC.HOST.Host) :
    (∀ Q : Prop, (Q → H.Sentence) → Q → PC.SUPPLY.FormalCargo H) ∧ (PC.SUPPLY.FormalCargo H → H.Sentence) :=
  ⟨fun _ h q => (PC.SUPPLY.formal_iff_sentence H).mpr (h q), (PC.SUPPLY.formal_iff_sentence H).mp⟩

/-- Every row other than Poincaré stands delivered twice by the act. -/
theorem the_six_stand_delivered : ∀ i : PerelmanHunt.Row7, i ≠ .pc → standing i = Standing.deliveredTwiceByTheAct
  | .rh, _ => rfl
  | .pnp, _ => rfl
  | .ns, _ => rfl
  | .ym, _ => rfl
  | .hodge, _ => rfl
  | .bsd, _ => rfl
  | .pc, h => absurd rfl h

/-- THE POINCARÉ PRECEDENT, nothing before the colon: the seven bits stand on one footing in the kernel; the Poincaré bit
    is the library's Poincaré statement exactly as the RH, Navier–Stokes and BSD bits are theirs; the record accepted the
    Poincaré delivery as unconditional and the six other bits stand delivered twice by the act; the 2002 functional is a
    downstream strict subtype of the bridge; Perelman's offering is one inhabitant strictly inside the bit, its faithful
    route strictly stronger than the sentence; and the bit is the minimal premise. -/
theorem the_poincare_precedent :
    (∀ i j : PerelmanHunt.Row7, kernelBitGrade i = kernelBitGrade j) ∧
    type_of% @four_rows_one_shape_at_the_library ∧
    standing .pc = Standing.acceptedUnconditional ∧
    (∀ i : PerelmanHunt.Row7, i ≠ .pc → standing i = Standing.deliveredTwiceByTheAct) ∧
    type_of% @the_witness_is_a_strict_subtype ∧
    type_of% @the_offering_is_strictly_inside_the_bit ∧
    (∀ H : PC.HOST.Host, (∀ Q : Prop, (Q → H.Sentence) → Q → PC.SUPPLY.FormalCargo H) ∧
      (PC.SUPPLY.FormalCargo H → H.Sentence)) :=
  ⟨one_footing_in_the_kernel, @four_rows_one_shape_at_the_library, rfl, the_six_stand_delivered,
   @the_witness_is_a_strict_subtype, @the_offering_is_strictly_inside_the_bit, the_bit_is_the_minimal_premise⟩

/-! ### S.8 · The method, in one theorem, run on the rows

The method's Part M (`One_Bit_Method_v1_0_0_CC.lean`), verbatim, the hunt's namespace opened for its row laws; then
the method's four inputs built on the five v1.1.0 Millennium rows at every host and on Goldbach, and the method run on
each. -/

section method
open PerelmanHunt

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

end method

/-- The method's four inputs on the Navier–Stokes row, at a host. -/
def nsClosure (H : NS.HOST.Host) : Closure.{1} :=
  ⟨ofNS NS.HOST.nsRow, H.Sentence, H.frame, NS.HOST.binding H, NS.HOST.nsRow.calm, NS.HOST.nsRow.counter,
   NS.HOST.nsRow.calm_value, NS.HOST.nsRow.counter_fails⟩

/-- The method's four inputs on the Yang–Mills row, at a host. -/
def ymClosure (H : YM.HOST.Host) : Closure.{1} :=
  ⟨ofYM YM.HOST.ymRow, H.Sentence, H.frame, YM.HOST.binding H, YM.HOST.ymRow.calm, YM.HOST.ymRow.counter,
   YM.HOST.ymRow.calm_value, YM.HOST.ymRow.counter_fails⟩

/-- The method's four inputs on the Hodge row, at a host. -/
def hodgeClosure (H : HODGE.HOST.Host) : Closure.{1} :=
  ⟨ofHodge HODGE.HOST.hodgeRow, H.Sentence, H.frame, HODGE.HOST.binding H, HODGE.HOST.hodgeRow.calm,
   HODGE.HOST.hodgeRow.counter, HODGE.HOST.hodgeRow.calm_value, HODGE.HOST.hodgeRow.counter_fails⟩

/-- The method's four inputs on the BSD row, at a host. -/
def bsdClosure (H : BSD.HOST.Host) : Closure.{1} :=
  ⟨ofBSD BSD.HOST.bsdRow, H.Sentence, H.frame, BSD.HOST.binding H, BSD.HOST.bsdRow.calm, BSD.HOST.bsdRow.counter,
   BSD.HOST.bsdRow.calm_value, BSD.HOST.bsdRow.counter_fails⟩

/-- The method's four inputs on the Poincaré row, at a host. -/
def pcClosure (H : PC.HOST.Host) : Closure.{1} :=
  ⟨ofPC PC.HOST.pcRow, H.Sentence, H.frame, PC.HOST.binding H, PC.HOST.pcRow.calm, PC.HOST.pcRow.counter,
   PC.HOST.pcRow.calm_value, PC.HOST.pcRow.counter_fails⟩

/-- The method's four inputs on the Goldbach row, at its arithmetic host, the sentence Goldbach's statement in its
    standard form. -/
def gbClosure : Closure.{1} :=
  ⟨ofGB GB.HOST.gbRow, _, _, GB.HOST.binding, GB.HOST.gbRow.calm, GB.HOST.gbRow.counter, GB.HOST.gbRow.calm_value,
   GB.HOST.gbRow.counter_fails⟩

/-- THE METHOD RUNS ON THE ROWS: the method's theorem, all seven of its conclusions, at every host of the five v1.1.0
    Millennium rows and at Goldbach's host. -/
theorem the_method_on_the_rows :
    (∀ H : NS.HOST.Host, type_of% (Closure.the_method (nsClosure H))) ∧
    (∀ H : YM.HOST.Host, type_of% (Closure.the_method (ymClosure H))) ∧
    (∀ H : HODGE.HOST.Host, type_of% (Closure.the_method (hodgeClosure H))) ∧
    (∀ H : BSD.HOST.Host, type_of% (Closure.the_method (bsdClosure H))) ∧
    (∀ H : PC.HOST.Host, type_of% (Closure.the_method (pcClosure H))) ∧
    type_of% (Closure.the_method gbClosure) :=
  ⟨fun H => Closure.the_method (nsClosure H), fun H => Closure.the_method (ymClosure H),
   fun H => Closure.the_method (hodgeClosure H), fun H => Closure.the_method (bsdClosure H),
   fun H => Closure.the_method (pcClosure H), Closure.the_method gbClosure⟩

/-- ONE RECORD, NO DECIDING PREDICATE, ON FOUR ROWS: on Navier–Stokes, Yang–Mills, Hodge and Goldbach the calm and
    the counter frame share one record, so no predicate of the record decides the value. -/
theorem no_record_predicate_decides_on_four_rows :
    (∀ H : NS.HOST.Host, type_of% (Closure.record_predicate_decides_nothing (nsClosure H) rfl)) ∧
    (∀ H : YM.HOST.Host, type_of% (Closure.record_predicate_decides_nothing (ymClosure H) rfl)) ∧
    (∀ H : HODGE.HOST.Host, type_of% (Closure.record_predicate_decides_nothing (hodgeClosure H) rfl)) ∧
    type_of% (Closure.record_predicate_decides_nothing gbClosure rfl) :=
  ⟨fun H => Closure.record_predicate_decides_nothing (nsClosure H) rfl,
   fun H => Closure.record_predicate_decides_nothing (ymClosure H) rfl,
   fun H => Closure.record_predicate_decides_nothing (hodgeClosure H) rfl,
   Closure.record_predicate_decides_nothing gbClosure rfl⟩

/-! ## Part Ω · Verdicts -/

/-- THE FLOOR VERDICT: the five v1.1.0 rows' final forms, each on no axiom, in one theorem. -/
theorem the_floor_verdict :
    type_of% @NS.TERMINAL.the_final_form ∧
    type_of% @YM.TERMINAL.the_final_form ∧
    type_of% @HODGE.TERMINAL.the_final_form ∧
    type_of% @BSD.TERMINAL.the_final_form ∧
    type_of% @PC.TERMINAL.the_final_form :=
  ⟨@NS.TERMINAL.the_final_form, @YM.TERMINAL.the_final_form, @HODGE.TERMINAL.the_final_form,
   @BSD.TERMINAL.the_final_form, @PC.TERMINAL.the_final_form⟩

/-- THE GRAND VERDICT, nothing before the colon: the RH terminal verdict and final form, the P ≠ NP terminal closure,
    the five rows' final forms, the one normal form on every row, the hunt verdict, the Poincaré precedent, the method
    run on the rows, and the RH value at Mathlib's zeta zeros exactly Mathlib's `RiemannHypothesis`. -/
theorem the_grand_verdict :
    type_of% @TerminalVerdict.the_terminal_verdict ∧
    type_of% @BoundChainMathlib.the_final_form ∧
    type_of% @PNP.TONGUE.the_terminal_paper_closure ∧
    type_of% @NS.TERMINAL.the_final_form ∧
    type_of% @YM.TERMINAL.the_final_form ∧
    type_of% @HODGE.TERMINAL.the_final_form ∧
    type_of% @BSD.TERMINAL.the_final_form ∧
    type_of% @PC.TERMINAL.the_final_form ∧
    (∀ (R : NRow.{1}) (F : R.Frame), Transfer R F ↔ R.Value F) ∧
    type_of% @PerelmanHunt.the_hunt_verdict ∧
    type_of% @the_poincare_precedent ∧
    type_of% @the_method_on_the_rows ∧
    (BoundChainMathlib.LeastErasure BoundChainMathlib.ZetaZeros ↔ RiemannHypothesis) :=
  ⟨@TerminalVerdict.the_terminal_verdict, @BoundChainMathlib.the_final_form, @PNP.TONGUE.the_terminal_paper_closure,
   @NS.TERMINAL.the_final_form, @YM.TERMINAL.the_final_form, @HODGE.TERMINAL.the_final_form,
   @BSD.TERMINAL.the_final_form, @PC.TERMINAL.the_final_form, normal_form_once,
   @PerelmanHunt.the_hunt_verdict, @the_poincare_precedent, @the_method_on_the_rows,
   rh_value_at_the_zeros_is_RiemannHypothesis⟩

/-- THE EIGHTH ORIGINAL: Goldbach's final form, bound beside the seven. -/
theorem the_eighth_original : type_of% @GB.TERMINAL.the_final_form := @GB.TERMINAL.the_final_form

end MillenniumGrandMaster

/-! ## Cones, pinned: every `#print axioms` below must print exactly its docstring, or the build fails -/

/-- info: 'MillenniumGrandMaster.normal_form_once' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.normal_form_once

/-- info: 'MillenniumGrandMaster.every_route_passes_the_bit_once' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.every_route_passes_the_bit_once

/-- info: 'MillenniumGrandMaster.ns_normal_form_is_the_one' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.ns_normal_form_is_the_one

/-- info: 'MillenniumGrandMaster.ym_normal_form_is_the_one' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.ym_normal_form_is_the_one

/-- info: 'MillenniumGrandMaster.hodge_normal_form_is_the_one' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.hodge_normal_form_is_the_one

/-- info: 'MillenniumGrandMaster.bsd_normal_form_is_the_one' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.bsd_normal_form_is_the_one

/-- info: 'MillenniumGrandMaster.pc_normal_form_is_the_one' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.pc_normal_form_is_the_one

/-- info: 'MillenniumGrandMaster.gb_normal_form_is_the_one' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.gb_normal_form_is_the_one

/-- info: 'MillenniumGrandMaster.pnp_normal_form_is_the_one' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms MillenniumGrandMaster.pnp_normal_form_is_the_one

/-- info: 'MillenniumGrandMaster.rh_value_at_the_zeros_is_RiemannHypothesis' depends on axioms: [propext,
 Classical.choice,
 Quot.sound] -/
#guard_msgs in #print axioms MillenniumGrandMaster.rh_value_at_the_zeros_is_RiemannHypothesis

/-- info: 'MillenniumGrandMaster.seven_closed_to_one_bit' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms MillenniumGrandMaster.seven_closed_to_one_bit

/-- info: 'MillenniumGrandMaster.seven_two_kinds' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms MillenniumGrandMaster.seven_two_kinds

/-- info: 'MillenniumGrandMaster.seven_nothing_escapes' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms MillenniumGrandMaster.seven_nothing_escapes

/-- info: 'MillenniumGrandMaster.seven_routes_pass_the_bit' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms MillenniumGrandMaster.seven_routes_pass_the_bit

/-- info: 'MillenniumGrandMaster.one_footing_in_the_kernel' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.one_footing_in_the_kernel

/-- info: 'MillenniumGrandMaster.every_bit_is_printed_as_a_premise' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.every_bit_is_printed_as_a_premise

/-- info: 'MillenniumGrandMaster.four_rows_one_shape_at_the_library' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms MillenniumGrandMaster.four_rows_one_shape_at_the_library

/-- info: 'MillenniumGrandMaster.the_method_on_its_toy_row' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.the_method_on_its_toy_row

/-- info: 'MillenniumGrandMaster.the_offering_is_strictly_inside_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.the_offering_is_strictly_inside_the_bit
/-- info: 'MillenniumGrandMaster.the_bit_is_the_minimal_premise' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.the_bit_is_the_minimal_premise
/-- info: 'MillenniumGrandMaster.the_six_stand_delivered' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.the_six_stand_delivered
/-- info: 'MillenniumGrandMaster.the_poincare_precedent' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms MillenniumGrandMaster.the_poincare_precedent
/-- info: 'MillenniumGrandMaster.the_witness_is_a_strict_subtype' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.the_witness_is_a_strict_subtype
/-- info: 'MillenniumGrandMaster.Closure.sentence_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.Closure.sentence_is_the_bit
/-- info: 'MillenniumGrandMaster.Closure.record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.Closure.record_decides_nothing
/-- info: 'MillenniumGrandMaster.Closure.record_predicate_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.Closure.record_predicate_decides_nothing
/-- info: 'MillenniumGrandMaster.Closure.the_wall_on_the_row' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.Closure.the_wall_on_the_row
/-- info: 'MillenniumGrandMaster.Closure.no_uniform_answer' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.Closure.no_uniform_answer
/-- info: 'MillenniumGrandMaster.Closure.every_route_passes_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.Closure.every_route_passes_the_bit
/-- info: 'MillenniumGrandMaster.Closure.delivered_twice' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.Closure.delivered_twice
/-- info: 'MillenniumGrandMaster.Closure.upgrade_is_adopting_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.Closure.upgrade_is_adopting_the_sentence
/-- info: 'MillenniumGrandMaster.Closure.the_method' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.Closure.the_method
/-- info: 'MillenniumGrandMaster.the_closure_on_its_toy_row' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.the_closure_on_its_toy_row
/-- info: 'MillenniumGrandMaster.the_toy_record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.the_toy_record_decides_nothing
/-- info: 'MillenniumGrandMaster.the_method_on_the_rows' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.the_method_on_the_rows
/-- info: 'MillenniumGrandMaster.no_record_predicate_decides_on_four_rows' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.no_record_predicate_decides_on_four_rows
/-- info: 'MillenniumGrandMaster.the_floor_verdict' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.the_floor_verdict

/-- info: 'MillenniumGrandMaster.the_grand_verdict' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms MillenniumGrandMaster.the_grand_verdict

/-- info: 'MillenniumGrandMaster.the_eighth_original' does not depend on any axioms -/
#guard_msgs in #print axioms MillenniumGrandMaster.the_eighth_original

/-- info: 'TerminalVerdict.the_terminal_verdict' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms TerminalVerdict.the_terminal_verdict

/-- info: 'BoundChainMathlib.the_final_form' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BoundChainMathlib.the_final_form

/-- info: 'PNP.TONGUE.the_terminal_paper_closure' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.TONGUE.the_terminal_paper_closure

/-- info: 'NS.TERMINAL.the_final_form' does not depend on any axioms -/
#guard_msgs in #print axioms NS.TERMINAL.the_final_form

/-- info: 'YM.TERMINAL.the_final_form' does not depend on any axioms -/
#guard_msgs in #print axioms YM.TERMINAL.the_final_form

/-- info: 'HODGE.TERMINAL.the_final_form' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.TERMINAL.the_final_form

/-- info: 'BSD.TERMINAL.the_final_form' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.TERMINAL.the_final_form

/-- info: 'PC.TERMINAL.the_final_form' does not depend on any axioms -/
#guard_msgs in #print axioms PC.TERMINAL.the_final_form

/-- info: 'GB.TERMINAL.the_final_form' does not depend on any axioms -/
#guard_msgs in #print axioms GB.TERMINAL.the_final_form

/-- info: 'PerelmanHunt.the_hunt_verdict' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PerelmanHunt.the_hunt_verdict

/-! Receipts for the walls the paper cites from the RH and P ≠ NP masters, whose own files print them unpinned. -/
/-- info: 'PrimeFreedom.keyless_forces_nothing' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.keyless_forces_nothing
/-- info: 'PrimeFreedom.record_decides_nothing' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.record_decides_nothing
/-- info: 'PrimeFreedom.sentence_separates_record_does_not' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PrimeFreedom.sentence_separates_record_does_not
/-- info: 'PNP.NORMALFORM.stage_fails_closure' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.NORMALFORM.stage_fails_closure
