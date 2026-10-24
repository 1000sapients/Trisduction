/-
  One_Bit_Perelmanification_Hunt_v1_0_0_CC.lean · module Hunt.Perelmanification
  The Perelmanification hunt on the one-bit posit of the seven Millennium rows, bound to the rows' own kernels.
  Claude-coded (_CC), 23 October 2026. Lean 4.19.0, Mathlib v4.19.0 (inherited through Hunt.RH and the three
  bindings, which import it). This file declares no axiom, uses no sorry and no native_decide, and proves every
  theorem in term mode or with core tactics that consult no simp set, so each cone below is its proof term's own.

  Imports, each compiled in its own environment, each byte-identical to its source (sha256 in SOURCES.sha256):
    Hunt.RH        RH_Both_Sides_Formal_Master_v3_0_39_CC.lean                      (Mathlib)
    Hunt.PNPNF     PNP_Normal_Form_Paper_v1_13_0_CC.lean, its first 15,480 bytes: the header and Part A,
                   namespace PNP.NORMALFORM, verbatim (the rest is not imported here, because its FTOE kernel
                   declares the same 62 names as the copy inside Hunt.RH and Lean refuses a doubled name)
    Hunt.NS, Hunt.YM, Hunt.Hodge, Hunt.BSD, Hunt.PC     the five v1.1.0_CC row masters (core, no import)
    Hunt.PCBind, Hunt.NSBind, Hunt.BSDBind              the three v1.1.0_CC Mathlib bindings

  The question. Perelman's derivation discharged the Poincaré bit. Does one principle across the seven rows subsume it,
  so that the unified bit qualifies as a standard axiom and the whole arc reads unconditional theorem grade; and is the
  bit already a theorem that was never formulated and pinned?

  The kernel's answers, each a theorem:
    H.1  the seven properties are the signature of equivalence: necessity with sufficiency is exactly "adopting the bit
         proves what adopting the sentence proves"; mandatory, no other proof, future-proof and the two kinds follow
         from equivalence alone; irreducible is the row's own wall (H.3).
    H.2  the admission screen of the axiom generator, written as code: a candidate read equivalent to its target is
         refused circular whatever its coupling, literature and breadth.
    H.3  on every row a premise that forces the value is keyed, failing at the counter frame; a keyless premise forces
         nothing; the value is the weakest key.
    H.4  one principle read on many rows: forcing every value means a key on every row; one keyless row breaks it.
    H.5  the product of the rows: every pattern of values is realized, so the values are independent; one row's value
         settles no other row's; a unified principle rejects every frame with a counter coordinate.
    H.6  the seven rows, read from their own kernels, and their own walls bound by exact type.
    H.7  at the library's own statements: adopting the bit is adopting Mathlib's RiemannHypothesis, the library's
         Poincaré statement, Fefferman's statement (A), and the library's rank statement.
    H.8  no finite stretch of verified instances forces the universal.
    H.9  the hunt verdict, one theorem with nothing before the colon.
  ΔM = 0. Nothing here proves a Millennium sentence or refutes one; the bit is located, its equivalences pinned, and its
  grade left where the rows' kernels print it.
-/
import Millennium.RH
import Millennium.PNP
import Millennium.NS
import Millennium.YM
import Millennium.Hodge
import Millennium.BSD
import Millennium.PC
import Millennium.PCBind
import Millennium.NSBind
import Millennium.BSDBind

namespace PerelmanHunt

universe u

/-! ## H.1 · The seven properties are the signature of equivalence -/

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

/-! ## H.2 · The admission screen, written as code -/

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

/-! ## H.3 · Rows, keys and the wall -/

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

/-! ## H.4 and H.5 · One principle on many rows, and the product -/

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

/-! ## H.6 · The seven rows, read from their own kernels -/

def ofPC (R : PC.NORMALFORM.Row.{u}) : KRow.{u} :=
  ⟨R.Frame, R.Value, R.calm, R.counter, R.calm_value, R.counter_fails⟩
def ofNS (R : NS.NORMALFORM.Row.{u}) : KRow.{u} :=
  ⟨R.Frame, R.Value, R.calm, R.counter, R.calm_value, R.counter_fails⟩
def ofYM (R : YM.NORMALFORM.Row.{u}) : KRow.{u} :=
  ⟨R.Frame, R.Value, R.calm, R.counter, R.calm_value, R.counter_fails⟩
def ofHodge (R : HODGE.NORMALFORM.Row.{u}) : KRow.{u} :=
  ⟨R.Frame, R.Value, R.calm, R.counter, R.calm_value, R.counter_fails⟩
def ofBSD (R : BSD.NORMALFORM.Row.{u}) : KRow.{u} :=
  ⟨R.Frame, R.Value, R.calm, R.counter, R.calm_value, R.counter_fails⟩

/-- RH: the fold-closed worlds of the prime-freedom kernel, W1 carrying the hypothesis and W2 failing it on one
    record, lifted to the common universe. -/
def rhK : KRow.{1} where
  Frame := ULift.{1} {Z : PrimeFreedom.World // PrimeFreedom.FoldClosed Z}
  Value := fun Z => PrimeFreedom.RH Z.down.1
  calm := ⟨⟨PrimeFreedom.W1, PrimeFreedom.W1_closed⟩⟩
  counter := ⟨⟨PrimeFreedom.W2, PrimeFreedom.W2_closed⟩⟩
  calm_value := PrimeFreedom.W1_rh
  counter_fails := PrimeFreedom.W2_not_rh

/-- P ≠ NP: machines, the closure that nothing escapes, the closed world and the stage world of Part A. -/
def pnpK : KRow.{1} where
  Frame := PNP.NORMALFORM.Machine
  Value := PNP.NORMALFORM.NothingEscapes
  calm := PNP.NORMALFORM.closedWorld
  counter := PNP.NORMALFORM.stageWorld 0
  calm_value := PNP.NORMALFORM.closed_world_closes
  counter_fails := PNP.NORMALFORM.stage_fails_closure 0

/-- The seven Millennium rows. -/
inductive Row7 where
  | rh | pnp | ns | ym | hodge | bsd | pc
  deriving DecidableEq, Repr

def millennium : Row7 → KRow.{1}
  | .rh => rhK
  | .pnp => pnpK
  | .ns => ofNS NS.HOST.nsRow
  | .ym => ofYM YM.HOST.ymRow
  | .hodge => ofHodge HODGE.HOST.hodgeRow
  | .bsd => ofBSD BSD.HOST.bsdRow
  | .pc => ofPC PC.HOST.pcRow

/-- THE ROWS' OWN WALLS, bound by exact type: every kernel already proves that a keyless premise forces nothing on
    its own row. -/
theorem the_rows_own_walls :
    type_of% @PrimeFreedom.keyless_forces_nothing ∧
    type_of% @PNP.NORMALFORM.keyless_forces_nothing ∧
    type_of% (NS.NORMALFORM.keyless_forces_nothing NS.HOST.nsRow) ∧
    type_of% (YM.NORMALFORM.keyless_forces_nothing YM.HOST.ymRow) ∧
    type_of% (HODGE.NORMALFORM.keyless_forces_nothing HODGE.HOST.hodgeRow) ∧
    type_of% (BSD.NORMALFORM.keyless_forces_nothing BSD.HOST.bsdRow) ∧
    type_of% (PC.NORMALFORM.keyless_forces_nothing PC.HOST.pcRow) :=
  ⟨@PrimeFreedom.keyless_forces_nothing, @PNP.NORMALFORM.keyless_forces_nothing,
   NS.NORMALFORM.keyless_forces_nothing NS.HOST.nsRow, YM.NORMALFORM.keyless_forces_nothing YM.HOST.ymRow,
   HODGE.NORMALFORM.keyless_forces_nothing HODGE.HOST.hodgeRow, BSD.NORMALFORM.keyless_forces_nothing BSD.HOST.bsdRow,
   PC.NORMALFORM.keyless_forces_nothing PC.HOST.pcRow⟩

/-- THE BIT IS NOT A THEOREM OF ANY ROW'S FRAMES, bound by exact type: on each v1.1.0 row the transfer is neither true
    on every frame nor false on every frame. -/
theorem no_row_answers_uniformly :
    type_of% (NS.NORMALFORM.no_uniform_answer NS.HOST.nsRow) ∧
    type_of% (YM.NORMALFORM.no_uniform_answer YM.HOST.ymRow) ∧
    type_of% (HODGE.NORMALFORM.no_uniform_answer HODGE.HOST.hodgeRow) ∧
    type_of% (BSD.NORMALFORM.no_uniform_answer BSD.HOST.bsdRow) ∧
    type_of% (PC.NORMALFORM.no_uniform_answer PC.HOST.pcRow) :=
  ⟨NS.NORMALFORM.no_uniform_answer NS.HOST.nsRow, YM.NORMALFORM.no_uniform_answer YM.HOST.ymRow,
   HODGE.NORMALFORM.no_uniform_answer HODGE.HOST.hodgeRow, BSD.NORMALFORM.no_uniform_answer BSD.HOST.bsdRow,
   PC.NORMALFORM.no_uniform_answer PC.HOST.pcRow⟩

/-- THE POINCARÉ OFFERING, bound by exact type: a witnessed flow delivers the formal cargo; the root alone forces no
    value; the root read on the row is the value. -/
theorem the_poincare_offering :
    type_of% @PC.ESCAPE.the_offering_walks_our_way ∧
    type_of% @PC.SUPPLY.witnessed_flow_delivers_cargo ∧
    type_of% @PCClose.undeniable_root_forces_no_value ∧
    type_of% @PCClose.root_on_row_is_the_value :=
  ⟨@PC.ESCAPE.the_offering_walks_our_way, @PC.SUPPLY.witnessed_flow_delivers_cargo,
   @PCClose.undeniable_root_forces_no_value, @PCClose.root_on_row_is_the_value⟩

/-- SEVEN KEYS: one principle that forces the value on all seven rows is keyed on all seven. -/
theorem seven_keys (U : ∀ i, (millennium i).Frame → Prop) (h : ∀ i, Forces (millennium i) (U i)) :
    ∀ i, Keyed (millennium i) (U i) :=
  unified_forcing_is_keyed_on_every_row millennium U h

/-- THE SEVEN VALUES ARE INDEPENDENT: each of the 128 patterns is realized on the product of the seven rows. -/
theorem the_seven_values_are_independent (S : Row7 → Bool) :
    ∃ F : ProdFrame millennium, ∀ i, (millennium i).Value (F i) ↔ S i = true :=
  every_pattern_is_realized millennium S

/-- THE POINCARÉ VALUE SETTLES NO OTHER ROW. -/
theorem poincare_settles_no_other (i : Row7) (hi : Row7.pc ≠ i) :
    ∃ F : ProdFrame millennium, (millennium .pc).Value (F .pc) ∧ ¬ (millennium i).Value (F i) :=
  one_row_settles_no_other millennium .pc i hi

/-! ## H.7 · At the library's own statements -/

/-- RH: adopting the bit as an axiom is adopting Mathlib's `RiemannHypothesis` (RH master,
    `canonical_normal_form_bridge`, third conjunct). -/
theorem rh_upgrade_is_adopting_RiemannHypothesis :
    SameTheory (BoundChainMathlib.CanonicalRH → BoundChainMathlib.LeastErasure BoundChainMathlib.ZetaZeros)
      RiemannHypothesis :=
  (upgrade_is_adoption _ _).mp
    ((necessary_and_sufficient_iff_equivalent _ _).mpr BoundChainMathlib.canonical_normal_form_bridge.2.2.1)

/-- POINCARÉ: adopting the bit on every closed simply connected three-manifold of the library is adopting the library's
    Poincaré statement (PC binding, `bit_is_the_statement`). Mathlib carries that statement as `proof_wanted`;
    Perelman's 2002–03 derivation proves it at ZFC grade, cited. -/
theorem pc_upgrade_is_adopting_PoincareThree :
    SameTheory (∀ (M : Type) [TopologicalSpace M] [T2Space M] [ChartedSpace PCMathlib.E3 M]
        [SimplyConnectedSpace M] [CompactSpace M], PCMathlib.Transfer M) PCMathlib.PoincareThree.{0} :=
  (upgrade_is_adoption _ _).mp
    ((necessary_and_sufficient_iff_equivalent _ _).mpr PCMathlib.bit_is_the_statement.{0})

/-- NAVIER–STOKES: the transfer at the library's host is Fefferman's statement (A) (NS binding,
    `kernel_reads_mathlib` with `recFrame_value`). -/
theorem ns_upgrade_is_adopting_FeffermanA (ν : ℝ) :
    SameTheory (NSMathlib.Value (NSMathlib.recFrame (NSMathlib.hostNS ν).frame) →
        NSMathlib.Value (NSMathlib.hostNS ν).frame) (NSMathlib.FeffermanA ν) :=
  (upgrade_is_adoption _ _).mp ((necessary_and_sufficient_iff_equivalent _ _).mpr
    ⟨fun h => (NSMathlib.kernel_reads_mathlib ν).mp (h (NSMathlib.recFrame_value _)),
     fun h _ => (NSMathlib.kernel_reads_mathlib ν).mpr h⟩)

/-- BSD: the transfer at the library's curves is the library's rank statement (BSD binding, `bit_is_the_statement`). -/
theorem bsd_upgrade_is_adopting_BSDRank (ord : BSDMathlib.EllipticQ → ℕ) :
    SameTheory (BSDMathlib.Transfer (BSDMathlib.curveFrame ord)) (BSDMathlib.BSDRank ord) :=
  (upgrade_is_adoption _ _).mp
    ((necessary_and_sufficient_iff_equivalent _ _).mpr (BSDMathlib.bit_is_the_statement ord))

/-! ## H.8 · Finite stretches never force the universal -/

/-- NO FINITE STRETCH FORCES THE UNIVERSAL: for every height there is a predicate true at every instance up to that
    height and false one step beyond. -/
theorem no_finite_stretch_forces_the_universal (N : Nat) :
    ∃ c : Nat → Bool, (∀ n, n ≤ N → c n = true) ∧ c (N + 1) = false :=
  ⟨fun n => decide (n ≤ N), fun _ h => decide_eq_true h, decide_eq_false (Nat.not_succ_le_self N)⟩

/-! ## H.9 · The hunt verdict -/

/-- THE HUNT VERDICT, nothing before the colon: the seven properties are the signature of equivalence and the upgrade
    is adoption; the screen refuses the upgrade as circular; one principle forcing all seven rows carries seven keys;
    the seven values are independent and the Poincaré value settles no other; at RH the upgrade is adopting Mathlib's
    `RiemannHypothesis`; and no finite stretch of instances forces the universal. -/
theorem the_hunt_verdict :
    (∀ B S : Prop, (Necessary B S ∧ Sufficient B S) ↔ SameTheory B S) ∧
    (∀ B S : Prop, (B ↔ S) →
      Mandatory B S ∧ NoOtherProof B S ∧ FutureProof B S ∧ ∀ C W : Prop, TwoKinds B S C W) ∧
    (∀ (c l : Bool) (b : Nat), screen (bitReading c l b) = Admission.refusedCircular) ∧
    (∀ U : ∀ i, (millennium i).Frame → Prop, (∀ i, Forces (millennium i) (U i)) →
      ∀ i, Keyed (millennium i) (U i)) ∧
    (∀ S : Row7 → Bool, ∃ F : ProdFrame millennium, ∀ i, (millennium i).Value (F i) ↔ S i = true) ∧
    (∀ i : Row7, Row7.pc ≠ i →
      ∃ F : ProdFrame millennium, (millennium .pc).Value (F .pc) ∧ ¬ (millennium i).Value (F i)) ∧
    SameTheory (BoundChainMathlib.CanonicalRH → BoundChainMathlib.LeastErasure BoundChainMathlib.ZetaZeros)
      RiemannHypothesis ∧
    (∀ N : Nat, ∃ c : Nat → Bool, (∀ n, n ≤ N → c n = true) ∧ c (N + 1) = false) :=
  ⟨upgrade_is_adoption, fun B S e => equivalence_gives_four B S e, the_bit_is_refused_circular, seven_keys,
   the_seven_values_are_independent, poincare_settles_no_other, rh_upgrade_is_adopting_RiemannHypothesis,
   no_finite_stretch_forces_the_universal⟩

end PerelmanHunt

/-! ## Cones, pinned: every `#print axioms` below must print exactly its docstring, or the build fails -/

/-- info: 'PerelmanHunt.necessary_and_sufficient_iff_equivalent' does not depend on any axioms -/
#guard_msgs in #print axioms PerelmanHunt.necessary_and_sufficient_iff_equivalent

/-- info: 'PerelmanHunt.upgrade_is_adoption' does not depend on any axioms -/
#guard_msgs in #print axioms PerelmanHunt.upgrade_is_adoption

/-- info: 'PerelmanHunt.equivalence_gives_four' does not depend on any axioms -/
#guard_msgs in #print axioms PerelmanHunt.equivalence_gives_four

/-- info: 'PerelmanHunt.mandatory_is_necessity' does not depend on any axioms -/
#guard_msgs in #print axioms PerelmanHunt.mandatory_is_necessity

/-- info: 'PerelmanHunt.the_bit_is_refused_circular' does not depend on any axioms -/
#guard_msgs in #print axioms PerelmanHunt.the_bit_is_refused_circular

/-- info: 'PerelmanHunt.keyless_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms PerelmanHunt.keyless_forces_nothing

/-- info: 'PerelmanHunt.forcing_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms PerelmanHunt.forcing_is_keyed

/-- info: 'PerelmanHunt.the_value_is_the_weakest_key' does not depend on any axioms -/
#guard_msgs in #print axioms PerelmanHunt.the_value_is_the_weakest_key

/-- info: 'PerelmanHunt.unified_forcing_is_keyed_on_every_row' does not depend on any axioms -/
#guard_msgs in #print axioms PerelmanHunt.unified_forcing_is_keyed_on_every_row

/-- info: 'PerelmanHunt.one_keyless_row_breaks_the_union' does not depend on any axioms -/
#guard_msgs in #print axioms PerelmanHunt.one_keyless_row_breaks_the_union

/-- info: 'PerelmanHunt.pick_realizes' does not depend on any axioms -/
#guard_msgs in #print axioms PerelmanHunt.pick_realizes

/-- info: 'PerelmanHunt.every_pattern_is_realized' does not depend on any axioms -/
#guard_msgs in #print axioms PerelmanHunt.every_pattern_is_realized

/-- info: 'PerelmanHunt.one_row_settles_no_other' does not depend on any axioms -/
#guard_msgs in #print axioms PerelmanHunt.one_row_settles_no_other

/-- info: 'PerelmanHunt.a_unified_principle_rejects_every_counter_pattern' does not depend on any axioms -/
#guard_msgs in #print axioms PerelmanHunt.a_unified_principle_rejects_every_counter_pattern

/-- info: 'PerelmanHunt.a_keyless_union_forces_no_row' does not depend on any axioms -/
#guard_msgs in #print axioms PerelmanHunt.a_keyless_union_forces_no_row

/-- info: 'PerelmanHunt.the_rows_own_walls' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PerelmanHunt.the_rows_own_walls

/-- info: 'PerelmanHunt.no_row_answers_uniformly' does not depend on any axioms -/
#guard_msgs in #print axioms PerelmanHunt.no_row_answers_uniformly

/-- info: 'PerelmanHunt.the_poincare_offering' does not depend on any axioms -/
#guard_msgs in #print axioms PerelmanHunt.the_poincare_offering

/-- info: 'PerelmanHunt.seven_keys' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PerelmanHunt.seven_keys

/-- info: 'PerelmanHunt.the_seven_values_are_independent' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PerelmanHunt.the_seven_values_are_independent

/-- info: 'PerelmanHunt.poincare_settles_no_other' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PerelmanHunt.poincare_settles_no_other

/-- info: 'PerelmanHunt.rh_upgrade_is_adopting_RiemannHypothesis' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PerelmanHunt.rh_upgrade_is_adopting_RiemannHypothesis

/-- info: 'PerelmanHunt.pc_upgrade_is_adopting_PoincareThree' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PerelmanHunt.pc_upgrade_is_adopting_PoincareThree

/-- info: 'PerelmanHunt.ns_upgrade_is_adopting_FeffermanA' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PerelmanHunt.ns_upgrade_is_adopting_FeffermanA

/-- info: 'PerelmanHunt.bsd_upgrade_is_adopting_BSDRank' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PerelmanHunt.bsd_upgrade_is_adopting_BSDRank

/-- info: 'PerelmanHunt.no_finite_stretch_forces_the_universal' does not depend on any axioms -/
#guard_msgs in #print axioms PerelmanHunt.no_finite_stretch_forces_the_universal

/-- info: 'PerelmanHunt.the_hunt_verdict' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PerelmanHunt.the_hunt_verdict
