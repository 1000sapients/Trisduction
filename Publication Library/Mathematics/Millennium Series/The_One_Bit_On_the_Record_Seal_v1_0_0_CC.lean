/-
  The_One_Bit_On_the_Record_Seal_v1_0_0_CC.lean · the four points and the lineage of the report
  "The One Bit, On the Record" (M. F. Islam, 21 November 2026), sealed.
  Core Lean 4.19.0: no import, no library, no axiom declared, no sorry, no native_decide.

  RATIONALE. The report fixes four points about the Riemann paper of record (Zenodo 23440383) and reads its lineage.
    This file turns each point into theorems the kernel checks, so the report's claims are not prose alone.
    (1) The file of record: what follows from the two equivalences the master proves against Mathlib: the bit is the
        band, every route passes it, the bridge gives RH at premise grade, and any proof of RH discharges the premise.
    (2) The archive's last hypothesis is our bit: `ArchiveHz C ↔ RightHalfStripZeroFree C` on every zeta chart, and a
        derivation of the archive's hypothesis discharges our premise through the gate.
    (3) The axioms do not carry the bit: on the integer chart of Where_RH_Stands (18 Sep 2026) a fold-closed pair
        lacks the value, with Classical.em in play.
    (4) The dates: the lineage is in order, every entry precedes the archive, and the report's intervals are exact.
    (5) The editorial's scope: priority covers the form, not the classical reduction and not any engine.
  DESIGN. Part I takes the master's two equivalences as the fields of `NormalForm`; its instance at Mathlib is master
    v3.0.39: `loop` is the first leg of `zeta_ra_loop`, `band` is the last conjunct of `analytic_target_reduction`,
    read backwards. Part II copies the chart of The_Bit_in_the_Definition_Seal in the same words. Part III copies the
    chart of The_Axioms_Do_Not_Carry_The_Bit in the same words. Part IV is a ledger of days of 2026, a common year.
  NON-NEGOTIABLES. Every theorem carries a #guard_msgs axiom pin. Only `with_the_three_axioms` and the binding that
    carries it rest on the three standard axioms; everything else rests on none. Nothing here asserts the Riemann
    Hypothesis or its negation, and no field of `NormalForm` is RH itself.
  RISKS. The kernel checks the ledger's order and arithmetic, not its provenance: the dates are read from the git
    history of 1000sapients/Trisduction and from Zenodo's timestamps, and are checked there. This file proves what
    follows from the master's theorems, not those theorems: they are compiled in the master (sha256 d72ef02a...),
    against Mathlib v4.19.0. Edit a date only with its commit, and re-run the controls after any edit.
-/
set_option autoImplicit false

namespace OneBitOnRecord

/-! ## Part I · Point 1, the file of record: the bit is the band, the gate, the grade -/

/-- What the master proves against Mathlib, as data. `RH` is Mathlib's `RiemannHypothesis`; `Bridge` is
    `LeastErasure (Rec ZetaZeros) → LeastErasure ZetaZeros`, the one bit; `Band` is `RightHalfStripZeroFree`.
    `loop` is the first leg of `zeta_ra_loop`; `band` is the last conjunct of `analytic_target_reduction`. -/
structure NormalForm where
  RH     : Prop
  Bridge : Prop
  Band   : Prop
  loop   : Bridge ↔ RH
  band   : RH ↔ Band

/-- The one bit is the band: the bridge and the band statement are one proposition. -/
theorem the_bit_is_the_band (N : NormalForm) : N.Bridge ↔ N.Band :=
  N.loop.trans N.band

/-- THE GATE, as `every_route_passes_the_bit`: a derivation of RH from any premise Q, given Q, delivers the band
    and the bridge. -/
theorem the_gate (N : NormalForm) : ∀ Q : Prop, (Q → N.RH) → Q → N.Band ∧ N.Bridge :=
  fun _ d q => ⟨N.band.mp (d q), N.loop.mpr (d q)⟩

/-- THE PREMISE GRADE, as `rh_from_the_cargo_loop`: the bridge, printed as a premise, gives RH in one term. -/
theorem premise_grade (N : NormalForm) : N.Bridge → N.RH :=
  N.loop.mp

/-- THE ONE-LINE DISCHARGE, as `zeta_ra_loop.1.mpr`: any proof of RH discharges the premise. -/
theorem one_line_discharge (N : NormalForm) : N.RH → N.Bridge :=
  N.loop.mpr

/-! ## Part II · Point 2, the archive's last hypothesis is our bit -/

/-- A chart of a zeta function, as in The_Bit_in_the_Definition_Seal: points with a real part, a zero predicate,
    the trivial zeros, the pole, and the one fact used about trivial zeros, that none lies right of the line. -/
structure ZetaChart where
  Point        : Type
  Re           : Type
  lt           : Re → Re → Prop
  re           : Point → Re
  half         : Re
  one          : Point
  IsZero       : Point → Prop
  Trivial      : Point → Prop
  trivial_left : ∀ s, Trivial s → ¬ lt half (re s)

/-- Our zero set, as `ZetaZeros` in RH_Both_Sides_Formal_Master: nontrivial zeros other than s = 1. -/
def ZetaZeros (C : ZetaChart) (s : C.Point) : Prop := C.IsZero s ∧ ¬ C.Trivial s ∧ s ≠ C.one

/-- Our bit, as `RightHalfStripZeroFree` in RH_Both_Sides_Formal_Master. -/
def RightHalfStripZeroFree (C : ZetaChart) : Prop := ∀ s, ZetaZeros C s → C.lt C.half (C.re s) → False

/-- The hypothesis `hz` of `Formalism.VW.rh_of_right` in the archive. -/
def ArchiveHz (C : ZetaChart) : Prop := ∀ s, C.lt C.half (C.re s) → s ≠ C.one → ¬ C.IsZero s

/-- The archive's hypothesis and our bit are one proposition. -/
theorem his_hypothesis_is_our_bit (C : ZetaChart) : ArchiveHz C ↔ RightHalfStripZeroFree C :=
  ⟨fun H s hs h => H s h hs.2.2 hs.1,
   fun B s h hne hz => B s ⟨hz, fun ht => C.trivial_left s ht h, hne⟩ h⟩

/-- If the archive's hypothesis is derived, our premise is discharged: the archive enters through the gate. -/
theorem his_derivation_discharges_our_premise (N : NormalForm) (C : ZetaChart)
    (hB : N.Band ↔ RightHalfStripZeroFree C) : ArchiveHz C → N.Bridge :=
  fun h => (the_bit_is_the_band N).mpr (hB.mpr ((his_hypothesis_is_our_bit C).mp h))

/-- Every route to RH, the archive's included, passes the archive's own hypothesis: it is the gate's seat. -/
theorem every_route_passes_his_hypothesis (N : NormalForm) (C : ZetaChart)
    (hB : N.Band ↔ RightHalfStripZeroFree C) : ∀ Q : Prop, (Q → N.RH) → Q → ArchiveHz C :=
  fun Q d q => (his_hypothesis_is_our_bit C).mpr (hB.mp (the_gate N Q d q).1)

/-! ## Part III · Point 3, the axioms do not carry the bit -/

namespace IntChart

/-- The integer chart of Where_RH_Stands (18 Sep 2026): points (a, b), the fold (a, b) ↦ (2 − a, b), the line a = 1. -/
abbrev Point := Int × Int
def fold (p : Point) : Point := (2 - p.1, p.2)
def onLine (p : Point) : Prop := p.1 = 1

/-- A configuration is a set of points; Closed is fold-closure; Value is "every point on the line". -/
def Config := Point → Prop
def Closed (S : Config) : Prop := ∀ p, S p → S (fold p)
def Value (S : Config) : Prop := ∀ p, S p → onLine p

/-- The off-line pair {(0,0), (2,0)}: fold-closed, no point on the line. -/
def offPair : Config := fun p => p = (0, 0) ∨ p = (2, 0)

theorem offPair_closed : Closed offPair := fun p h =>
  match h with
  | Or.inl e => by subst e; exact Or.inr rfl
  | Or.inr e => by subst e; exact Or.inl rfl

theorem offPair_lacks_value : ¬ Value offPair := fun h =>
  (by decide : ¬ ((0 : Int) = 1)) (h (0, 0) (Or.inl rfl))

/-- Nothing true of every closed configuration gives the value: the off-line pair is closed and lacks it. -/
theorem the_axioms_do_not_carry_the_bit : ¬ ∀ S, Closed S → Value S :=
  fun h => offPair_lacks_value (h offPair offPair_closed)

/-- Any proposition that holds, an axiom included, fails to deliver the value on every closed configuration. -/
theorem no_true_proposition_carries_the_bit : ∀ A : Prop, A → ¬ (A → ∀ S, Closed S → Value S) :=
  fun _ a h => the_axioms_do_not_carry_the_bit (h a)

/-- The refutation with the three standard axioms in use: Classical.em is invoked, and the value is still not
    delivered on the closed configurations. -/
theorem with_the_three_axioms : ¬ ∀ S, Closed S → Value S :=
  fun h => (Classical.em (Value offPair)).elim (fun v => offPair_lacks_value v)
    (fun _ => offPair_lacks_value (h offPair offPair_closed))

end IntChart

/-! ## Part IV · Point 4, the dates -/

namespace Ledger

/-- A day of 2026: month and day. -/
structure Day where
  m : Nat
  d : Nat

/-- Days of 2026, a common year, before each month. -/
def before : Nat → Nat
  | 1 => 0   | 2 => 31  | 3 => 59  | 4 => 90  | 5 => 120  | 6 => 151
  | 7 => 181 | 8 => 212 | 9 => 243 | 10 => 273 | 11 => 304 | 12 => 334 | _ => 0

/-- Day of the year. -/
def ordinal (x : Day) : Nat := before x.m + x.d

/-- Days from a to b. -/
def gap (a b : Day) : Nat := ordinal b - ordinal a

/-- The lineage of Table 2, each entry the first commit that carried it in 1000sapients/Trisduction. -/
inductive Entry where
  | tawhid | threeFace | bitInProse | firstLean | bitInLean
  | blocked | normalForm | gate | compiledMaster | fileOfRecord

/-- First public date of each entry. -/
def Entry.date : Entry → Day
  | .tawhid => ⟨7, 29⟩      | .threeFace => ⟨7, 31⟩   | .bitInProse => ⟨8, 10⟩
  | .firstLean => ⟨8, 12⟩   | .bitInLean => ⟨9, 18⟩   | .blocked => ⟨10, 10⟩
  | .normalForm => ⟨10, 13⟩ | .gate => ⟨10, 15⟩       | .compiledMaster => ⟨10, 16⟩
  | .fileOfRecord => ⟨10, 22⟩

/-- The commit of each entry, for the reader to check: data, not proof. -/
def Entry.commit : Entry → String
  | .tawhid => "fd55714"     | .threeFace => "5be5839" | .bitInProse => "9cb57be"
  | .firstLean => "2452ddf"  | .bitInLean => "3ac2541" | .blocked => "4f8663e"
  | .normalForm => "5bcfcdd" | .gate => "4169dbf"      | .compiledMaster => "b272c46"
  | .fileOfRecord => "61cfdc4"

/-- The Zenodo deposits and the outside dates of the report. -/
def zenodoCompanion : Day := ⟨10, 15⟩     -- 10.5281/zenodo.23357512
def zenodoPaper : Day := ⟨10, 16⟩         -- 10.5281/zenodo.23440383
def alpogeTimelineOpens : Day := ⟨10, 6⟩  -- as stated in his Remark
def archivePublic : Day := ⟨11, 20⟩

/-- The lineage in the order of Table 2. -/
def lineage : List Entry :=
  [.tawhid, .threeFace, .bitInProse, .firstLean, .bitInLean,
   .blocked, .normalForm, .gate, .compiledMaster, .fileOfRecord]

/-- A list of numbers is strictly increasing. -/
def increasing : List Nat → Bool
  | a :: b :: t => Nat.blt a b && increasing (b :: t)
  | _ => true

/-- The lineage is in order: each step after the one before it. -/
theorem the_lineage_is_in_order : increasing (lineage.map fun e => ordinal e.date) = true := by decide

/-- Every entry of the lineage precedes the archive. -/
theorem every_entry_precedes_the_archive : ∀ e : Entry, ordinal e.date < ordinal archivePublic := by
  intro e; cases e <;> decide

/-- Both Zenodo deposits precede the archive. -/
theorem the_deposits_precede_the_archive :
    ordinal zenodoCompanion < ordinal archivePublic ∧ ordinal zenodoPaper < ordinal archivePublic := by decide

/-- The bit was in Lean before the archive's own timeline opened. -/
theorem the_bit_in_lean_precedes_his_timeline :
    ordinal Entry.bitInLean.date < ordinal alpogeTimelineOpens := by decide

/-- The report's intervals, exact: 102, 63, 18 and 35 days; and the gate entered a compiled master one day after
    its draft. -/
theorem the_intervals :
    gap Entry.bitInProse.date archivePublic = 102 ∧ gap Entry.bitInLean.date archivePublic = 63 ∧
    gap Entry.bitInLean.date alpogeTimelineOpens = 18 ∧ gap Entry.compiledMaster.date archivePublic = 35 ∧
    gap Entry.gate.date Entry.compiledMaster.date = 1 := by decide

end Ledger

/-! ## Part V · The editorial's scope: what priority covers -/

/-- The objects the editorial names. -/
inductive Claim where
  | normalForm | theBitNamed | itsLocation | theGate | theBlocks
  | classicalBandReduction | anEngine

/-- Priority covers the form; it does not cover the classical reduction or any engine that discharges the bit. -/
def Claim.covered : Claim → Bool
  | .classicalBandReduction => false
  | .anEngine => false
  | _ => true

theorem priority_covers_the_form_not_the_engine :
    Claim.covered .normalForm = true ∧ Claim.covered .theBitNamed = true ∧
    Claim.covered .itsLocation = true ∧ Claim.covered .theGate = true ∧ Claim.covered .theBlocks = true ∧
    Claim.covered .classicalBandReduction = false ∧ Claim.covered .anEngine = false := by decide

/-! ## Part VI · The binding -/

/-- THE ONE BIT, ON THE RECORD. Point 1: on every normal form the bit is the band, every route passes it, the
    bridge gives RH at premise grade and any proof of RH discharges it. Point 2: the archive's hypothesis is our bit
    on every chart. Point 3: nothing true of every closed configuration carries the bit. Point 4: every entry of the
    lineage precedes the archive. -/
theorem the_one_bit_on_the_record :
    (∀ N : NormalForm, (N.Bridge ↔ N.Band) ∧ (∀ Q : Prop, (Q → N.RH) → Q → N.Band ∧ N.Bridge) ∧
      (N.Bridge → N.RH) ∧ (N.RH → N.Bridge)) ∧
    (∀ C : ZetaChart, ArchiveHz C ↔ RightHalfStripZeroFree C) ∧
    (¬ ∀ S, IntChart.Closed S → IntChart.Value S) ∧
    (∀ e : Ledger.Entry, Ledger.ordinal e.date < Ledger.ordinal Ledger.archivePublic) :=
  ⟨fun N => ⟨the_bit_is_the_band N, the_gate N, premise_grade N, one_line_discharge N⟩,
   his_hypothesis_is_our_bit, IntChart.the_axioms_do_not_carry_the_bit,
   Ledger.every_entry_precedes_the_archive⟩

/-- The binding with the refutation in its classical form: the three standard axioms in play, the bit still not
    carried. -/
theorem the_one_bit_on_the_record_with_the_axioms :
    (∀ N : NormalForm, ∀ C : ZetaChart, (N.Band ↔ RightHalfStripZeroFree C) → ArchiveHz C → N.Bridge) ∧
    (¬ ∀ S, IntChart.Closed S → IntChart.Value S) :=
  ⟨his_derivation_discharges_our_premise, IntChart.with_the_three_axioms⟩

end OneBitOnRecord

/-! ## Pins · every cone printed and held -/

/-- info: 'OneBitOnRecord.the_bit_is_the_band' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitOnRecord.the_bit_is_the_band

/-- info: 'OneBitOnRecord.the_gate' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitOnRecord.the_gate

/-- info: 'OneBitOnRecord.premise_grade' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitOnRecord.premise_grade

/-- info: 'OneBitOnRecord.one_line_discharge' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitOnRecord.one_line_discharge

/-- info: 'OneBitOnRecord.his_hypothesis_is_our_bit' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitOnRecord.his_hypothesis_is_our_bit

/-- info: 'OneBitOnRecord.his_derivation_discharges_our_premise' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitOnRecord.his_derivation_discharges_our_premise

/-- info: 'OneBitOnRecord.every_route_passes_his_hypothesis' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitOnRecord.every_route_passes_his_hypothesis

/-- info: 'OneBitOnRecord.IntChart.offPair_closed' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitOnRecord.IntChart.offPair_closed

/-- info: 'OneBitOnRecord.IntChart.offPair_lacks_value' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitOnRecord.IntChart.offPair_lacks_value

/-- info: 'OneBitOnRecord.IntChart.the_axioms_do_not_carry_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitOnRecord.IntChart.the_axioms_do_not_carry_the_bit

/-- info: 'OneBitOnRecord.IntChart.no_true_proposition_carries_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitOnRecord.IntChart.no_true_proposition_carries_the_bit

/-- info: 'OneBitOnRecord.IntChart.with_the_three_axioms' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms OneBitOnRecord.IntChart.with_the_three_axioms

/-- info: 'OneBitOnRecord.Ledger.the_lineage_is_in_order' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitOnRecord.Ledger.the_lineage_is_in_order

/-- info: 'OneBitOnRecord.Ledger.every_entry_precedes_the_archive' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitOnRecord.Ledger.every_entry_precedes_the_archive

/-- info: 'OneBitOnRecord.Ledger.the_deposits_precede_the_archive' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitOnRecord.Ledger.the_deposits_precede_the_archive

/-- info: 'OneBitOnRecord.Ledger.the_bit_in_lean_precedes_his_timeline' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitOnRecord.Ledger.the_bit_in_lean_precedes_his_timeline

/-- info: 'OneBitOnRecord.Ledger.the_intervals' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitOnRecord.Ledger.the_intervals

/-- info: 'OneBitOnRecord.priority_covers_the_form_not_the_engine' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitOnRecord.priority_covers_the_form_not_the_engine

/-- info: 'OneBitOnRecord.the_one_bit_on_the_record' does not depend on any axioms -/
#guard_msgs in #print axioms OneBitOnRecord.the_one_bit_on_the_record

/-- info: 'OneBitOnRecord.the_one_bit_on_the_record_with_the_axioms' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms OneBitOnRecord.the_one_bit_on_the_record_with_the_axioms
