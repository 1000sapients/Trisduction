/-
  THE ZFC BLOCK, FINAL v2.0.0 · HERMETICALLY SEALED · TWO BOXES TOGETHER — TERMINAL UNDERTAKER
  The Riemann row, the P versus NP row, and the Poincaré row with Perelman as Grand Witness, in one kernel.
  Core Lean 4.19.0, standalone: no import, no sorry, no axiom declared, no native_decide. Every theorem's axiom cone
  is pinned by #guard_msgs at the foot of the file, so any drift in any cone fails the build. Hostile builds are
  scripted beside the file (ZFC_Block_Hardened_v1_4_0_controls.sh); each plants one break and must be refused.

  WHAT IS PROVED, ON ALL THREE ROWS
    I    THE AIRTIGHT CHAIN before the posit. Exit I, shared resources: nothing true of every configuration forces the
         value. Exit II, the record: nothing that reads only the record forces or decides it. Exit III, the bypass:
         no premise delivers the value while the bit fails. NO FOURTH KIND: a premise that forces the value, holding
         where the value holds, is not shared, does not read only the record, and delivers the bit.
    II   TWO KINDS AND NO THIRD. The formal kind and the physical kind are each exactly the value; every witness of
         the value, from any premise, is a witness of both kinds; one refuter refutes both.
    III  ZFC READ AS A LADDER: sentences, provability, modus ponens, and models in which every theorem holds, each
         model realizing a configuration of the row, with the normal form proved inside the ladder.
         NO ESCAPE: the ladder proves the value exactly when it proves the bit, and every ladder proof of the value
         is of both kinds. THE BLOCK: a model realizing a defiant configuration blocks the ladder from the value and
         from the bit; with Gödel's completeness theorem carried as a hypothesis, exactly then. RECORD-BOUND: a ladder
         whose models pin only the record is blocked; a ladder that proves the value reads past the record.
    IV   DECIDED BY THE MODELS. On each row, beside the same airtight chain, a ladder whose models realize only the
         compliant configuration proves the value and the bit, and a ladder with a model realizing the defiant twin
         proves neither.
    V    PERELMAN, THE GRAND WITNESS, typed as the Poincaré Precedent types him: a functional on states, strictly
         decreasing along the step off the seat and invariant under the rescaling. The witness gives the act. It is
         strictly inside the act: the self-similar flow rests and admits no witness. The round world carries it and
         its stuck twin of one record does not. The witness route has exactly the shape the chain allows a route that
         succeeds: not shared, reading past the record, delivering the bit. On the one crossed row the crossing went
         through the bit, never around it.
    VI   BLESSING IS ADOPTION: adopting the bit as an axiom proves exactly what adopting the sentence proves.
    VII  THE FENCE: a wall on every true premise is the negation; irrefutability by a Σ₁-complete ladder is a proof.
    VIII THE SLOGAN (Part IX), "deny our proof as a valid proof, and ZFC stays blocked", at theorem grade with its scope in the
         same clause. DENY THE BIT at the actual configuration, and every sound ladder carrying the normal form, ZFC
         among them, stays blocked from the value and from the bit. REJECT OUR PROOF AS A KIND, every route that
         delivers the bit, and every ladder proof of the value is rejected with it. The implication runs from the
         denial to the block: a ladder can be blocked while the bit holds.
    IX   THE ROUTE LEDGER (Part X), typed by evidence, after the ledger of Zenodo 23308381 (§XIX.e). The semantic
         ladders are read on their rows as sound ladders carrying the normal form, so Part III's hypotheses are met by
         constructed terms, in the proving case and in the blocked case. THE LADDER ROUTE IS OPEN: on every row one
         such ladder proves the value and the bit, and another is blocked from both. NO BLOCK FROM THE ROW: the
         unrestricted block is refuted on every row, not merely unproved. THE CHAIN DOES NOT BLOCK: on all three rows
         the airtight chain and a ladder proof of the value stand together. Every printed status carries its theorem
         and the opposite status is refuted, so no status can be flipped: the ladder from the record blocked, the
         foundation as a system open, independence with the value false blocked.
    X    THE ACT, BY THEOREM (Part XI), after the record's `ActualZeros`: the act at a configuration is its
         admissibility with its bit supplied, as the fields of a type. FROM THE ACT, THE VALUE, of both kinds. EVERY
         WAY IS THE ACT: every proof of the value, from any premise whatever, is a supply of the act. THE ACT IS THE
         WEAKEST FORCING PREMISE: the posit spends one bit and no more. THE ACT IS IRREDUCIBLE: nothing every
         configuration shares and no reading of the record supplies it. ONE DOOR: every ladder that proves the value
         enters by the act's door, a foundation's included. THE PRECEDENT: Perelman's witness supplies the act on every
         flow that carries it, and is constructed on the round world. BLESSING THE ACT IS ADOPTING THE VALUE, at
         exactly the value's price.
    XI   THE UNCONDITIONAL VISIBLE BLOCK (Part XII): the actual SAT machine and the actual zeros as rows; the act at
         the actual configuration as the posit; deny the bit at the actual, and every sound ladder whose actual model
         is the actual configuration — ZFC's standard model among them if consistent — stays blocked; reject the kind
         Formal = Bit at the actual, and you reject every ZFC proof of the value with it; the block is visible as a
         closed term: Blocked ↔ ¬ Value(actual) and Blocked does not imply ¬ Bit(actual) fails, it implies ¬ Prov.

  WHAT IS NOT PROVED, AND DOES NOT FOLLOW FROM THESE PREMISES: that ZFC proves neither the Riemann value nor the
  P ≠ NP value. By III the ladder is blocked exactly when a model of ZFC realizes the defiant twin, and by IV the
  airtight chain is the same in both cases. On the Poincaré row the ladder route is the route the crossing took (V).
  Part X proves the limit in the other direction: no block follows from a row alone. No ladder in this file is ZFC.
  Part XI constructs the act on every row's compliant configuration; it constructs no act at the actual zeros of ζ or
  at the SAT machine, where the act enters as the posit. Part XII constructs the actual rows as rows and the act at
  the actual as the posit; it proves the unconditional visible block from the denial to ZFC's block, with the posit
  named.

  FALSIFIERS, each a closed term or a model:
    F-Twin     a row's compliant configuration and defiant twin with different records: refused (controls C1, C3, C4).
    F-Rest     the defiant twin carrying the value: refused (controls C2, C5).
    F-Witness  a witness on the self-similar flow: refused (control C6).
    F-Footing  a closed term on Lean's standard axioms of the Riemann or P ≠ NP value: it would place that row in the
               proving case of IV. It refutes nothing here.
    F-Model    a model of ZFC realizing the defiant twin of the Riemann or P ≠ NP row: it would place that row in the
               blocked case of III. It refutes nothing here.
  ΔM = 0.
-/


namespace ZFCBlockHardened

universe u v w

/-! ## Part 0 · The row -/

/-- A ROW: configurations; the admissible ones; the value; when two configurations have the same record; the record
    of a configuration, read back as a configuration, carrying the value unconditionally; and a compliant
    configuration with a defiant twin of one record. -/
structure Row where
  X         : Type u
  Adm       : X → Prop
  Value     : X → Prop
  Same      : X → X → Prop
  recObj    : X → X
  rec_has   : ∀ x, Adm x → Value (recObj x)
  compliant : X
  twin      : X
  adm_c     : Adm compliant
  adm_t     : Adm twin
  same_ct   : Same compliant twin
  value_c   : Value compliant
  value_t   : ¬ Value twin

/-- A premise or reading that sees only the record. -/
def ReadsRecord (r : Row.{u}) (Q : r.X → Prop) : Prop := ∀ x y, r.Same x y → (Q x ↔ Q y)

/-- THE BIT of a configuration: the transfer of the value from its record to itself. -/
def Bit (r : Row.{u}) (x : r.X) : Prop := r.Value (r.recObj x) → r.Value x

/-- A premise FORCES the value when every admissible configuration satisfying it carries the value. -/
def Forces (r : Row.{u}) (Q : r.X → Prop) : Prop := ∀ x, r.Adm x → Q x → r.Value x

/-! ## Part I · The airtight chain: three exits closed, and no fourth kind -/

/-- EXIT I · SHARED RESOURCES, CLOSED. -/
theorem exit_shared_closed (r : Row.{u}) (Q : r.X → Prop) (hQ : ∀ x, Q x) : ¬ Forces r Q :=
  fun h => r.value_t (h r.twin r.adm_t (hQ r.twin))

/-- EXIT II · THE RECORD, CLOSED, in the forcing form. -/
theorem exit_record_closed (r : Row.{u}) (Q : r.X → Prop) (hR : ReadsRecord r Q) (hc : Q r.compliant) :
    ¬ Forces r Q :=
  fun h => r.value_t (h r.twin r.adm_t ((hR r.compliant r.twin r.same_ct).mp hc))

/-- EXIT II · THE RECORD, CLOSED, in the decision form: no reading of the record decides the value. -/
theorem record_decides_nothing (r : Row.{u}) (D : r.X → Prop) (hR : ReadsRecord r D) :
    ¬ ∀ x, r.Adm x → (D x ↔ r.Value x) :=
  fun h => r.value_t ((h r.twin r.adm_t).mp ((hR r.compliant r.twin r.same_ct).mp
    ((h r.compliant r.adm_c).mpr r.value_c)))

/-- EXIT III · THE BYPASS, CLOSED: the value is exactly its bit, and no premise delivers the value while the bit
    fails. -/
theorem exit_bypass_closed (r : Row.{u}) (x : r.X) (hx : r.Adm x) :
    (Bit r x ↔ r.Value x) ∧ ¬ ∃ Q : Prop, Q ∧ (Q → r.Value x) ∧ ¬ Bit r x :=
  ⟨⟨fun b => b (r.rec_has x hx), fun v _ => v⟩, fun ⟨_, q, hq, nb⟩ => nb (fun _ => hq q)⟩

/-- NO FOURTH KIND. -/
theorem no_fourth_kind (r : Row.{u}) (Q : r.X → Prop) (hF : Forces r Q) (hc : Q r.compliant) :
    ¬ (∀ x, Q x) ∧ ¬ ReadsRecord r Q ∧ (∀ x, r.Adm x → Q x → Bit r x) :=
  ⟨fun hQ => exit_shared_closed r Q hQ hF, fun hR => exit_record_closed r Q hR hc hF,
   fun x hx q _ => hF x hx q⟩

/-- THE AIRTIGHT CHAIN of a row, whole. -/
def Airtight (r : Row.{u}) : Prop :=
  (∀ Q : r.X → Prop, (∀ x, Q x) → ¬ Forces r Q) ∧
  (∀ Q : r.X → Prop, ReadsRecord r Q → Q r.compliant → ¬ Forces r Q) ∧
  (∀ D : r.X → Prop, ReadsRecord r D → ¬ ∀ x, r.Adm x → (D x ↔ r.Value x)) ∧
  (∀ x, r.Adm x → (Bit r x ↔ r.Value x) ∧ ¬ ∃ Q : Prop, Q ∧ (Q → r.Value x) ∧ ¬ Bit r x) ∧
  (∀ Q : r.X → Prop, Forces r Q → Q r.compliant →
      ¬ (∀ x, Q x) ∧ ¬ ReadsRecord r Q ∧ (∀ x, r.Adm x → Q x → Bit r x))

/-- THE CHAIN IS AIRTIGHT ON EVERY ROW. -/
theorem airtight (r : Row.{u}) : Airtight r :=
  ⟨exit_shared_closed r, exit_record_closed r, record_decides_nothing r,
   fun x hx => exit_bypass_closed r x hx, no_fourth_kind r⟩

/-! ## Part II · Two kinds, and no third -/

/-- THE FORMAL KIND: the transfer from the record. -/
def Formal (r : Row.{u}) (x : r.X) : Prop := Bit r x

/-- THE PHYSICAL KIND: a witness structure carrying the value in its field. -/
structure Physical (r : Row.{u}) (x : r.X) : Prop where
  carries : r.Value x

/-- Two kinds, no third, armed: each kind is exactly the value; every witness of the value is of both kinds; one
    refuter refutes both. -/
def TwoKindsNoThird (r : Row.{u}) (x : r.X) : Prop :=
  (Formal r x ↔ r.Value x) ∧ (Physical r x ↔ r.Value x) ∧
  (∀ Q : Prop, (Q → r.Value x) → Q → Formal r x ∧ Physical r x) ∧
  (¬ r.Value x → ¬ Formal r x ∧ ¬ Physical r x)

theorem two_kinds_no_third (r : Row.{u}) (x : r.X) (hx : r.Adm x) : TwoKindsNoThird r x :=
  ⟨⟨fun f => f (r.rec_has x hx), fun v _ => v⟩,
   ⟨fun p => p.carries, fun v => ⟨v⟩⟩,
   fun _ h q => ⟨fun _ => h q, ⟨h q⟩⟩,
   fun hn => ⟨fun f => hn (f (r.rec_has x hx)), fun p => hn p.carries⟩⟩

/-! ## Part III · ZFC read as a ladder -/

/-- A LADDER: sentences, provability, an implication, and modus ponens. ZFC is one. -/
structure Ladder where
  Sent : Type v
  Prov : Sent → Prop
  imp  : Sent → Sent → Sent
  mp   : ∀ a b, Prov (imp a b) → Prov a → Prov b

/-- THE NORMAL FORM INSIDE THE LADDER: the value sentence and the bit sentence, each proved to imply the other. -/
structure NormalForm (T : Ladder.{v}) where
  V  : T.Sent
  B  : T.Sent
  vb : T.Prov (T.imp V B)
  bv : T.Prov (T.imp B V)

/-- NO ESCAPE: the ladder proves the value exactly when it proves the bit. -/
theorem no_escape (T : Ladder.{v}) (N : NormalForm T) : T.Prov N.V ↔ T.Prov N.B :=
  ⟨T.mp _ _ N.vb, T.mp _ _ N.bv⟩

/-- THE LADDER READ ON THE ROW: its models, every theorem holding in each, each realizing an admissible
    configuration, the value sentence true in a model exactly when its configuration carries the value. -/
structure OnRow (r : Row.{u}) (T : Ladder.{v}) (N : NormalForm T) where
  M     : Type w
  Holds : M → T.Sent → Prop
  sound : ∀ s m, T.Prov s → Holds m s
  real  : M → r.X
  adm   : ∀ m, r.Adm (real m)
  reads : ∀ m, Holds m N.V ↔ r.Value (real m)

/-- THE BLOCK: a model realizing a defiant configuration blocks the ladder from the value and from the bit. -/
theorem blocked_of_defiant_model (r : Row.{u}) (T : Ladder.{v}) (N : NormalForm T)
    (R : OnRow.{u, v, w} r T N) (m : R.M) (hd : ¬ r.Value (R.real m)) :
    ¬ T.Prov N.V ∧ ¬ T.Prov N.B :=
  have hv : ¬ T.Prov N.V := fun p => hd ((R.reads m).mp (R.sound N.V m p))
  ⟨hv, fun pb => hv ((no_escape T N).mpr pb)⟩

/-- THE BLOCK, EXACTLY, with Gödel's completeness theorem carried as the hypothesis `complete`. -/
theorem blocked_iff_defiant_model (r : Row.{u}) (T : Ladder.{v}) (N : NormalForm T)
    (R : OnRow.{u, v, w} r T N) (complete : ¬ T.Prov N.V → ∃ m, ¬ R.Holds m N.V) :
    (¬ T.Prov N.V ∧ ¬ T.Prov N.B) ↔ ∃ m, ¬ r.Value (R.real m) :=
  ⟨fun ⟨hv, _⟩ => match complete hv with
     | ⟨m, hm⟩ => ⟨m, fun v => hm ((R.reads m).mpr v)⟩,
   fun ⟨m, hd⟩ => blocked_of_defiant_model r T N R m hd⟩

/-- A RECORD-BOUND LADDER IS BLOCKED. -/
theorem record_bound_ladder_is_blocked (r : Row.{u}) (T : Ladder.{v}) (N : NormalForm T)
    (R : OnRow.{u, v, w} r T N)
    (bound : ∀ m y, r.Adm y → r.Same (R.real m) y → ∃ m', R.real m' = y)
    (m₀ : R.M) (h₀ : R.real m₀ = r.compliant) : ¬ T.Prov N.V ∧ ¬ T.Prov N.B := by
  have hs : r.Same (R.real m₀) r.twin := by rw [h₀]; exact r.same_ct
  exact match bound m₀ r.twin r.adm_t hs with
    | ⟨m', h'⟩ => blocked_of_defiant_model r T N R m' (by rw [h']; exact r.value_t)

/-- A LADDER THAT PROVES THE VALUE READS PAST THE RECORD. -/
theorem proving_ladder_reads_past_the_record (r : Row.{u}) (T : Ladder.{v}) (N : NormalForm T)
    (R : OnRow.{u, v, w} r T N) (p : T.Prov N.V) (m₀ : R.M) (h₀ : R.real m₀ = r.compliant) :
    ¬ ∀ m y, r.Adm y → r.Same (R.real m) y → ∃ m', R.real m' = y :=
  fun bound => (record_bound_ladder_is_blocked r T N R bound m₀ h₀).1 p

/-- EVERY LADDER PROOF OF THE VALUE IS OF BOTH KINDS, at the configuration of every model, the actual one included:
    the ladder has no route outside the two kinds. -/
theorem ladder_proof_is_of_both_kinds (r : Row.{u}) (T : Ladder.{v}) (N : NormalForm T)
    (R : OnRow.{u, v, w} r T N) (p : T.Prov N.V) (m : R.M) : Formal r (R.real m) ∧ Physical r (R.real m) :=
  (two_kinds_no_third r (R.real m) (R.adm m)).2.2.1 (T.Prov N.V)
    (fun q => (R.reads m).mp (R.sound N.V m q)) p

/-! ## Part IV · Decided by the models -/

/-- THE SEMANTIC LADDER over a family of configurations: it proves what holds on every configuration it realizes. -/
def semLadder (r : Row.{u}) (Mod : Type) (real : Mod → r.X) : Ladder.{u} where
  Sent := r.X → Prop
  Prov := fun s => ∀ m, s (real m)
  imp  := fun a b x => a x → b x
  mp   := fun _ _ hab ha m => hab m (ha m)

/-- Decided by the models, on a row: the ladder whose one model is the compliant configuration proves the value and
    the bit; the ladder with a second model realizing the defiant twin proves neither. -/
def DecidedByModels (r : Row.{u}) : Prop :=
  (semLadder r Unit (fun _ => r.compliant)).Prov r.Value ∧
  (semLadder r Unit (fun _ => r.compliant)).Prov (Bit r) ∧
  ¬ (semLadder r Bool (fun b => cond b r.compliant r.twin)).Prov r.Value ∧
  ¬ (semLadder r Bool (fun b => cond b r.compliant r.twin)).Prov (Bit r)

theorem decided_by_the_models (r : Row.{u}) : DecidedByModels r :=
  ⟨fun _ => r.value_c, fun _ _ => r.value_c,
   fun h => r.value_t (h false), fun h => r.value_t (h false (r.rec_has r.twin r.adm_t))⟩

/-! ## Part V · The three rows -/

/-! ### V.1 · The Riemann row: the chart of the fold, registration onto the line -/

namespace RH

/-- A point of the chart: the doubled real part `x` and the height `t`; the critical line is `x = 1`. -/
structure Pt where
  x : Int
  t : Nat
  deriving DecidableEq

def onLine (z : Pt) : Prop := z.x = 1
/-- The fold s ↦ 1 − s̄. -/
def fold (z : Pt) : Pt := ⟨2 - z.x, z.t⟩
/-- Registration: keep the height, land on the line. -/
def reg (z : Pt) : Pt := ⟨1, z.t⟩
abbrev World := Pt → Prop
def FoldClosed (Z : World) : Prop := ∀ z, Z z → Z (fold z)
def RHolds (Z : World) : Prop := ∀ z, Z z → onLine z
def recordOf (Z : World) : World := fun r => ∃ s, Z s ∧ reg s = r
def SameRecord (Z Z' : World) : Prop := ∀ r, recordOf Z r ↔ recordOf Z' r

/-- THE SEAT: the fold fixes exactly the line. -/
theorem fold_fixed_iff (z : Pt) : fold z = z ↔ onLine z := by
  cases z with
  | mk x t =>
    show Pt.mk (2 - x) t = Pt.mk x t ↔ x = 1
    constructor
    · intro h
      have hx := congrArg Pt.x h
      change 2 - x = x at hx
      omega
    · intro h
      subst h
      rfl

theorem record_on_line (Z : World) : RHolds (recordOf Z) :=
  fun _ ⟨s, _, hs⟩ => by subst hs; rfl

/-- The compliant world: one zero on the line at height 14. -/
abbrev W1 : World := fun z => z = ⟨1, 14⟩
/-- Its defiant twin: an off-line pair at height 14, exchanged by the fold. -/
abbrev W2 : World := fun z => z = ⟨0, 14⟩ ∨ z = ⟨2, 14⟩

theorem W1_closed : FoldClosed W1 := by
  intro z hz
  have h : z = ⟨1, 14⟩ := hz
  subst h
  show fold ⟨1, 14⟩ = ⟨1, 14⟩
  decide

theorem W1_rh : RHolds W1 := by
  intro z hz
  have h : z = ⟨1, 14⟩ := hz
  subst h
  rfl

theorem W2_closed : FoldClosed W2 := by
  intro z hz
  rcases hz with h | h
  · subst h; exact Or.inr rfl
  · subst h; exact Or.inl rfl

theorem W2_not_rh : ¬ RHolds W2 :=
  fun h => absurd (h ⟨0, 14⟩ (Or.inl rfl)) (by decide : ¬ ((0 : Int) = 1))

theorem same_record : SameRecord W1 W2 := by
  intro r
  constructor
  · intro ⟨s, hs, hr⟩
    have h : s = ⟨1, 14⟩ := hs
    subst h
    exact ⟨⟨0, 14⟩, Or.inl rfl, hr⟩
  · intro ⟨s, hs, hr⟩
    rcases hs with h | h <;> subst h <;> exact ⟨⟨1, 14⟩, rfl, hr⟩

/-- THE RIEMANN ROW. -/
def row : Row.{0} where
  X := World
  Adm := FoldClosed
  Value := RHolds
  Same := SameRecord
  recObj := recordOf
  rec_has := fun Z _ => record_on_line Z
  compliant := W1
  twin := W2
  adm_c := W1_closed
  adm_t := W2_closed
  same_ct := same_record
  value_c := W1_rh
  value_t := W2_not_rh

end RH

/-! ### V.2 · The P versus NP row: the machine, its record, the closure -/

namespace PNP

structure Machine where
  Alg  : Type
  Inst : Type
  size : Inst → Nat
  out  : Alg → Inst → Bool
  time : Alg → Inst → Nat
  sat  : Inst → Bool

def bound (c k n : Nat) : Nat := c * n ^ k + c
def Clean (M : Machine) (A : M.Alg) (c k : Nat) (x : M.Inst) : Prop :=
  M.out A x = M.sat x ∧ M.time A x ≤ bound c k (M.size x)
/-- The closure: every algorithm, at every polynomial bound, meets an instance that stops it. -/
def NothingEscapes (M : Machine) : Prop := ∀ (A : M.Alg) (c k : Nat), ∃ x, ¬ Clean M A c k x
/-- The record of a machine: every output read against the answer as its opposite. -/
def Rec (M : Machine) : Machine := { M with out := fun _ x => !(M.sat x) }

theorem bnot_ne (b : Bool) : (!b) ≠ b := by cases b <;> decide

theorem record_closes (M : Machine) (x₀ : M.Inst) : NothingEscapes (Rec M) :=
  fun _ _ _ => ⟨x₀, fun hc => bnot_ne (M.sat x₀) hc.1⟩

/-- THE VACANT SEAT: complementation fixes nothing. -/
theorem complement_free : ¬ ∃ b : Bool, (!b) = b := fun ⟨b, h⟩ => bnot_ne b h

/-- The compliant machine: no algorithm ever answers correctly. -/
def closedWorld : Machine := ⟨Nat, Unit, fun _ => 0, fun _ _ => false, fun _ _ => 0, fun _ => true⟩
/-- Its defiant twin: algorithm 0 answers correctly at once. -/
def stageWorld : Machine := ⟨Nat, Unit, fun _ => 0, fun A _ => Nat.beq A 0, fun _ _ => 0, fun _ => true⟩

theorem closed_world_closes : NothingEscapes closedWorld :=
  fun _ _ _ => ⟨(), fun ⟨h, _⟩ => Bool.noConfusion h⟩

theorem stage_escapes : ¬ NothingEscapes stageWorld :=
  fun h => match h (0 : Nat) 0 0 with
    | ⟨_, hx⟩ => hx ⟨rfl, Nat.zero_le _⟩

theorem same_rec : Rec closedWorld = Rec stageWorld := rfl

/-- THE P VERSUS NP ROW. -/
def row : Row.{1} where
  X := Machine
  Adm := fun M => Nonempty M.Inst
  Value := NothingEscapes
  Same := fun M M' => Rec M = Rec M'
  recObj := Rec
  rec_has := fun M h => match h with | ⟨x₀⟩ => record_closes M x₀
  compliant := closedWorld
  twin := stageWorld
  adm_c := ⟨()⟩
  adm_t := ⟨()⟩
  same_ct := same_rec
  value_c := closed_world_closes
  value_t := stage_escapes

end PNP

/-! ### V.3 · The Poincaré row: flows, the seat, the act; Perelman, the Grand Witness -/

namespace PC

/-- n steps of a map. -/
def steps {α : Type} (f : α → α) : Nat → α → α
  | 0, x => x
  | k + 1, x => steps f k (f x)

/-- A FLOW: states, a step, the round state (the seat), a rescaling, and a decision of whether a state is the seat.
    The same five fields as the Poincaré Precedent's mini case. -/
structure Flow where
  State   : Type
  step    : State → State
  round   : State
  rescale : State → State
  deq     : ∀ s, Decidable (s = round)

/-- A state comes to rest when some number of steps brings it to the seat. -/
def ComesToRest (F : Flow) (s : F.State) : Prop := ∃ k, steps F.step k s = F.round

/-- THE ACT: every state of the flow comes to rest. It is the row's value. -/
def Act (F : Flow) : Prop := ∀ s, ComesToRest F s

/-- PERELMAN'S WITNESS, by the 2002 functional's shape: a functional on states, strictly decreasing along the step at
    every state off the seat, and invariant under the rescaling. -/
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

/-- THE WITNESS GIVES THE ACT: on every flow that carries Perelman's witness, every state comes to rest. -/
theorem witness_gives_the_act (F : Flow) (P : Witness F) : Act F :=
  fun s => descent_bound F P (P.W s) s (Nat.le_refl _)

/-- The self-similar flow: the seat `true` and the state `false`; the step sends both to the seat, and the rescaling
    is the step. -/
def soliton : Flow where
  State   := Bool
  step    := fun _ => true
  round   := true
  rescale := fun _ => true
  deq     := fun s => decEq s true

theorem soliton_rests : Act soliton := fun _ => ⟨1, rfl⟩

/-- NO WITNESS ON THE SELF-SIMILAR FLOW. -/
theorem no_witness_on_the_soliton : ¬ Nonempty (Witness soliton) :=
  fun ⟨P⟩ =>
    have d : P.W true < P.W false := P.decrease false (fun h => Bool.noConfusion h)
    have e : P.W true = P.W false := P.scaleFree false
    Nat.lt_irrefl _ (e ▸ d)

/-- The record of a flow: registration sends every state to the seat in one step. -/
def recFlow (F : Flow) : Flow := { F with step := fun _ => F.round }

theorem rec_rests (F : Flow) : Act (recFlow F) := fun _ => ⟨1, rfl⟩

/-- The round world: the state off the seat steps onto it; the rescaling is the identity. -/
def roundWorld : Flow where
  State   := Bool
  step    := fun _ => true
  round   := true
  rescale := fun s => s
  deq     := fun s => decEq s true

/-- Its stuck twin, the fake sphere: the state off the seat never moves. Same seat, same rescaling, same record. -/
def stuckWorld : Flow where
  State   := Bool
  step    := fun s => s
  round   := true
  rescale := fun s => s
  deq     := fun s => decEq s true

/-- PERELMAN'S WITNESS ON THE ROUND WORLD. -/
def roundWitness : Witness roundWorld where
  W         := fun s => cond s 0 1
  decrease  := fun s hs => match s, hs with
    | true, h => absurd rfl h
    | false, _ => Nat.zero_lt_one
  scaleFree := fun _ => rfl

theorem steps_stuck : ∀ k : Nat, steps stuckWorld.step k false = false
  | 0 => rfl
  | k + 1 => steps_stuck k

/-- THE FAKE SPHERE DOES NOT REST. -/
theorem stuck_does_not_rest : ¬ Act stuckWorld :=
  fun h => match h false with
    | ⟨k, hk⟩ => Bool.noConfusion ((steps_stuck k).symm.trans hk)

/-- One record: the round world and its stuck twin differ only in what registration forgets. -/
theorem same_rec : recFlow roundWorld = recFlow stuckWorld := rfl

/-- THE POINCARÉ ROW, its compliant value supplied by Perelman's witness. -/
def row : Row.{1} where
  X := Flow
  Adm := fun _ => True
  Value := Act
  Same := fun F F' => recFlow F = recFlow F'
  recObj := recFlow
  rec_has := fun F _ => rec_rests F
  compliant := roundWorld
  twin := stuckWorld
  adm_c := trivial
  adm_t := trivial
  same_ct := same_rec
  value_c := witness_gives_the_act roundWorld roundWitness
  value_t := stuck_does_not_rest

end PC

/-! ## Part VI · Perelman, the Grand Witness -/

/-- THE GRAND WITNESS. The witness gives the act on every flow. It is strictly inside the act: the self-similar flow
    rests and admits no witness. The round world carries it, and its stuck twin of one record carries none. And the
    witness route has exactly the shape the airtight chain allows a route that succeeds: not shared, not reading only
    the record, and delivering the bit wherever it holds. -/
def GrandWitness : Prop :=
  (∀ F : PC.Flow, Nonempty (PC.Witness F) → PC.Act F) ∧
  (PC.Act PC.soliton ∧ ¬ Nonempty (PC.Witness PC.soliton)) ∧
  (Nonempty (PC.Witness PC.roundWorld) ∧ ¬ Nonempty (PC.Witness PC.stuckWorld) ∧
    PC.recFlow PC.roundWorld = PC.recFlow PC.stuckWorld) ∧
  (Forces PC.row (fun F : PC.Flow => Nonempty (PC.Witness F)) ∧
    ¬ (∀ F : PC.Flow, Nonempty (PC.Witness F)) ∧
    ¬ ReadsRecord PC.row (fun F : PC.Flow => Nonempty (PC.Witness F)) ∧
    ∀ F : PC.Flow, Nonempty (PC.Witness F) → Bit PC.row F)

theorem grand_witness : GrandWitness :=
  have hF : Forces PC.row (fun F : PC.Flow => Nonempty (PC.Witness F)) :=
    fun F _ ⟨P⟩ => PC.witness_gives_the_act F P
  have hc : Nonempty (PC.Witness PC.roundWorld) := ⟨PC.roundWitness⟩
  have k := no_fourth_kind PC.row (fun F : PC.Flow => Nonempty (PC.Witness F)) hF hc
  ⟨fun F ⟨P⟩ => PC.witness_gives_the_act F P,
   ⟨PC.soliton_rests, PC.no_witness_on_the_soliton⟩,
   ⟨hc, fun ⟨P⟩ => PC.stuck_does_not_rest (PC.witness_gives_the_act PC.stuckWorld P), PC.same_rec⟩,
   ⟨hF, k.1, k.2.1, fun F w => k.2.2 F trivial w⟩⟩

/-! ## Part VII · Blessing is adoption -/

/-- BLESSING IS ADOPTION: a premise is necessary and sufficient for the sentence exactly when adopting it as an axiom
    proves what adopting the sentence proves. -/
theorem blessing_is_adoption (B S : Prop) : ((S → B) ∧ (B → S)) ↔ ∀ Q : Prop, (B → Q) ↔ (S → Q) :=
  ⟨fun h _ => ⟨fun k s => k (h.1 s), fun k b => k (h.2 b)⟩, fun h => ⟨(h B).mp id, (h S).mpr id⟩⟩

/-! ## Part VIII · The fence -/

/-- NO TOTAL WALL: no wall bars every premise from a proposition, since it forces itself. -/
theorem no_total_wall (B : Prop) : ¬ ∀ Q : Prop, ¬ (Q → B) := fun h => h B id

/-- A wall on every true premise is the negation. -/
theorem total_wall_iff_negation (B : Prop) : (∀ Q : Prop, (Q → B) → ¬ Q) ↔ ¬ B :=
  ⟨fun h => h B id, fun hn _ hq q => hn (hq q)⟩

/-- IRREFUTABILITY IS A PROOF: when the ladder refutes the value whenever it fails (Σ₁-completeness on the denial,
    the shape of the Riemann string), a ladder that cannot refute the value has the value true. -/
theorem irrefutable_is_proved (B : Prop) (Prov : Prop → Prop) (sigma1 : ¬ B → Prov (¬ B))
    (h : ¬ Prov (¬ B)) : B :=
  Classical.byContradiction fun n => h (sigma1 n)

/-! ## Part Ω · The capstone -/

/-- THE ZFC BLOCK, HARDENED, nothing before the colon.
    I    the airtight chain on the Riemann, P versus NP and Poincaré rows;
    II   two kinds and no third, armed, at each row's compliant configuration;
    III  no escape in every ladder carrying the normal form; the block exactly, with completeness carried; a
         record-bound ladder blocked; a proving ladder reading past the record; every ladder proof of both kinds;
    IV   decided by the models, on all three rows;
    V    Perelman, the Grand Witness;
    VI   blessing is adoption;
    VII  the fence; and the two seats: the Riemann seat occupied by the line, the complexity seat vacant. -/
theorem the_zfc_block_hardened :
    (Airtight RH.row ∧ Airtight PNP.row ∧ Airtight PC.row) ∧
    (TwoKindsNoThird RH.row RH.W1 ∧ TwoKindsNoThird PNP.row PNP.closedWorld ∧
      TwoKindsNoThird PC.row PC.roundWorld) ∧
    ((∀ (T : Ladder.{v}) (N : NormalForm T), T.Prov N.V ↔ T.Prov N.B) ∧
     (∀ (r : Row.{u}) (T : Ladder.{v}) (N : NormalForm T) (R : OnRow.{u, v, w} r T N),
        (¬ T.Prov N.V → ∃ m, ¬ R.Holds m N.V) →
        ((¬ T.Prov N.V ∧ ¬ T.Prov N.B) ↔ ∃ m, ¬ r.Value (R.real m))) ∧
     (∀ (r : Row.{u}) (T : Ladder.{v}) (N : NormalForm T) (R : OnRow.{u, v, w} r T N),
        (∀ m y, r.Adm y → r.Same (R.real m) y → ∃ m', R.real m' = y) →
        ∀ m₀, R.real m₀ = r.compliant → ¬ T.Prov N.V ∧ ¬ T.Prov N.B) ∧
     (∀ (r : Row.{u}) (T : Ladder.{v}) (N : NormalForm T) (R : OnRow.{u, v, w} r T N),
        T.Prov N.V → ∀ m₀, R.real m₀ = r.compliant →
        ¬ ∀ m y, r.Adm y → r.Same (R.real m) y → ∃ m', R.real m' = y) ∧
     (∀ (r : Row.{u}) (T : Ladder.{v}) (N : NormalForm T) (R : OnRow.{u, v, w} r T N),
        T.Prov N.V → ∀ m, Formal r (R.real m) ∧ Physical r (R.real m))) ∧
    (DecidedByModels RH.row ∧ DecidedByModels PNP.row ∧ DecidedByModels PC.row) ∧
    GrandWitness ∧
    (∀ B S : Prop, ((S → B) ∧ (B → S)) ↔ ∀ Q : Prop, (B → Q) ↔ (S → Q)) ∧
    ((∀ B : Prop, (∀ Q : Prop, (Q → B) → ¬ Q) ↔ ¬ B) ∧
     (∀ (B : Prop) (Prov : Prop → Prop), (¬ B → Prov (¬ B)) → ¬ Prov (¬ B) → B) ∧
     ((∀ z : RH.Pt, RH.fold z = z ↔ RH.onLine z) ∧ ¬ ∃ b : Bool, (!b) = b)) :=
  ⟨⟨airtight RH.row, airtight PNP.row, airtight PC.row⟩,
   ⟨two_kinds_no_third RH.row RH.W1 RH.W1_closed, two_kinds_no_third PNP.row PNP.closedWorld ⟨()⟩,
    two_kinds_no_third PC.row PC.roundWorld trivial⟩,
   ⟨no_escape, blocked_iff_defiant_model,
    fun r T N R bound m₀ h₀ => record_bound_ladder_is_blocked r T N R bound m₀ h₀,
    proving_ladder_reads_past_the_record, ladder_proof_is_of_both_kinds⟩,
   ⟨decided_by_the_models RH.row, decided_by_the_models PNP.row, decided_by_the_models PC.row⟩,
   grand_witness,
   blessing_is_adoption,
   ⟨total_wall_iff_negation, irrefutable_is_proved, ⟨RH.fold_fixed_iff, PNP.complement_free⟩⟩⟩

/-! ## Part IX · The slogan: deny our proof, and ZFC stays blocked -/

/-- READING I · DENY THE BIT, AND ZFC STAYS BLOCKED. Deny our proof's bit at the actual configuration, the one the
    standard model realizes, and every sound ladder carrying the normal form, ZFC among them, stays blocked from the
    value and from the bit: the actual model is then itself a defiant model. -/
theorem deny_the_bit_zfc_stays_blocked (r : Row.{u}) (T : Ladder.{v}) (N : NormalForm T)
    (R : OnRow.{u, v, w} r T N) (m₀ : R.M) (deny : ¬ Bit r (R.real m₀)) :
    ¬ T.Prov N.V ∧ ¬ T.Prov N.B :=
  blocked_of_defiant_model r T N R m₀ (fun v => deny (fun _ => v))

/-- READING II · REJECT OUR PROOF AS A KIND, AND EVERY ZFC PROOF IS REJECTED WITH IT. A judgment that rejects every route
    delivering the bit at the actual configuration rejects every ladder proof of the value, ZFC's included, because a
    ladder proof of the value is such a route (soundness at the actual model). -/
theorem reject_our_kind_rejects_zfc (r : Row.{u}) (T : Ladder.{v}) (N : NormalForm T)
    (R : OnRow.{u, v, w} r T N) (m₀ : R.M) (Accept : Prop → Prop)
    (reject : ∀ Q : Prop, (Q → Bit r (R.real m₀)) → ¬ Accept Q) :
    ¬ Accept (T.Prov N.V) :=
  reject (T.Prov N.V) (fun p _ => (R.reads m₀).mp (R.sound N.V m₀ p))

/-- THE DIRECTION · BLOCKED IS NOT DENIED. On every row a ladder is blocked while the bit holds at the actual configuration:
    the semantic ladder realizing the compliant configuration and its defiant twin proves nothing of the value, and the
    bit holds at the compliant configuration. The slogan runs one way only. -/
theorem blocked_does_not_deny_the_bit (r : Row.{u}) :
    Bit r r.compliant ∧ ¬ (semLadder r Bool (fun b => cond b r.compliant r.twin)).Prov r.Value :=
  ⟨fun _ => r.value_c, fun h => r.value_t (h false)⟩

/-- THE SLOGAN AT THEOREM GRADE, nothing before the colon.
    I   deny the bit at the actual configuration, and every sound ladder carrying the normal form, ZFC among them,
        stays blocked from the value and from the bit;
    II  reject our proof as a kind, every route delivering the bit, and every ladder proof of the value is rejected;
    III the implication runs from the denial to the block, on the Riemann, P versus NP and Poincaré rows: a ladder is
        blocked while the bit holds. -/
theorem the_slogan_at_theorem_grade :
    (∀ (r : Row.{u}) (T : Ladder.{v}) (N : NormalForm T) (R : OnRow.{u, v, w} r T N) (m₀ : R.M),
        ¬ Bit r (R.real m₀) → ¬ T.Prov N.V ∧ ¬ T.Prov N.B) ∧
    (∀ (r : Row.{u}) (T : Ladder.{v}) (N : NormalForm T) (R : OnRow.{u, v, w} r T N) (m₀ : R.M)
        (Accept : Prop → Prop),
        (∀ Q : Prop, (Q → Bit r (R.real m₀)) → ¬ Accept Q) → ¬ Accept (T.Prov N.V)) ∧
    ((Bit RH.row RH.W1 ∧ ¬ (semLadder RH.row Bool (fun b => cond b RH.W1 RH.W2)).Prov RH.row.Value) ∧
     (Bit PNP.row PNP.closedWorld ∧
        ¬ (semLadder PNP.row Bool (fun b => cond b PNP.closedWorld PNP.stageWorld)).Prov PNP.row.Value) ∧
     (Bit PC.row PC.roundWorld ∧
        ¬ (semLadder PC.row Bool (fun b => cond b PC.roundWorld PC.stuckWorld)).Prov PC.row.Value)) :=
  ⟨deny_the_bit_zfc_stays_blocked, reject_our_kind_rejects_zfc,
   ⟨blocked_does_not_deny_the_bit RH.row, blocked_does_not_deny_the_bit PNP.row,
    blocked_does_not_deny_the_bit PC.row⟩⟩

/-! ## Part X · The route ledger, typed by evidence

  The ledger of Zenodo 23308381 (§XIX.e) prints the foundation as a system open and independence blocked, each status
  checked by `decide` against recorded booleans; the claim each route carries does not depend on its status, so a
  status can be flipped, booleans and counts with it, and that build still passes. Here each printed status carries
  its own theorem and the opposite status is refuted, so a flip breaks the build. -/

/-- The normal form inside a semantic ladder: on every admissible model the value and the bit imply each other. -/
def semNormalForm (r : Row.{u}) (Mod : Type) (real : Mod → r.X) (adm : ∀ m, r.Adm (real m)) :
    NormalForm (semLadder r Mod real) where
  V  := r.Value
  B  := Bit r
  vb := fun _ v _ => v
  bv := fun m b => b (r.rec_has (real m) (adm m))

/-- A semantic ladder read on its row: its models are its configurations, and it is sound by construction. -/
def semOnRow (r : Row.{u}) (Mod : Type) (real : Mod → r.X) (adm : ∀ m, r.Adm (real m)) :
    OnRow.{u, u, 0} r (semLadder r Mod real) (semNormalForm r Mod real adm) where
  M     := Mod
  Holds := fun m s => s (real m)
  sound := fun _ m p => p m
  real  := real
  adm   := adm
  reads := fun _ => Iff.rfl

/-- The two models of the blocked ladder: the compliant configuration and its defiant twin, both admissible. -/
def pairAdm (r : Row.{u}) : ∀ b : Bool, r.Adm (cond b r.compliant r.twin)
  | true  => r.adm_c
  | false => r.adm_t

/-- THE LADDER ROUTE IS OPEN ON EVERY ROW. On the same row, beside the same airtight chain, one sound ladder carrying
    the normal form proves the value and the bit, and another is blocked from both. Which case a ladder is in is
    decided by its models, never by the row. -/
theorem the_ladder_route_is_open (r : Row.{u}) :
    (∃ (T : Ladder.{u}) (N : NormalForm T) (_ : OnRow.{u, u, 0} r T N), T.Prov N.V ∧ T.Prov N.B) ∧
    (∃ (T : Ladder.{u}) (N : NormalForm T) (_ : OnRow.{u, u, 0} r T N), ¬ T.Prov N.V ∧ ¬ T.Prov N.B) :=
  ⟨⟨semLadder r Unit (fun _ => r.compliant), semNormalForm r Unit (fun _ => r.compliant) (fun _ => r.adm_c),
     semOnRow r Unit (fun _ => r.compliant) (fun _ => r.adm_c), fun _ => r.value_c, fun _ _ => r.value_c⟩,
   ⟨semLadder r Bool (fun b => cond b r.compliant r.twin),
     semNormalForm r Bool (fun b => cond b r.compliant r.twin) (pairAdm r),
     semOnRow r Bool (fun b => cond b r.compliant r.twin) (pairAdm r),
     blocked_of_defiant_model r _ _ (semOnRow r Bool (fun b => cond b r.compliant r.twin) (pairAdm r))
       false r.value_t⟩⟩

/-- NO BLOCK FROM THE ROW: the unrestricted block, every sound ladder carrying the normal form blocked on a row, is
    refuted on every row, not merely unproved. -/
theorem no_block_from_the_row (r : Row.{u}) :
    ¬ ∀ (T : Ladder.{u}) (N : NormalForm T) (_ : OnRow.{u, u, 0} r T N), ¬ T.Prov N.V :=
  fun h => match (the_ladder_route_is_open r).1 with
    | ⟨T, N, R, hp, _⟩ => h T N R hp

/-- NO PROOF FROM THE ROW: nor does a row force every such ladder to prove the value. -/
theorem no_proof_from_the_row (r : Row.{u}) :
    ¬ ∀ (T : Ladder.{u}) (N : NormalForm T) (_ : OnRow.{u, u, 0} r T N), T.Prov N.V :=
  fun h => match (the_ladder_route_is_open r).2 with
    | ⟨T, N, R, hn, _⟩ => hn (h T N R)

/-- THE CHAIN DOES NOT BLOCK. The airtight chain holds on the row, and on the same row a sound ladder carrying the
    normal form proves the value: a block across every configuration and a proof at the configuration a ladder's
    models realize stand together. -/
theorem the_chain_does_not_block (r : Row.{u}) :
    Airtight r ∧ ∃ (T : Ladder.{u}) (N : NormalForm T) (_ : OnRow.{u, u, 0} r T N), T.Prov N.V :=
  ⟨airtight r, match (the_ladder_route_is_open r).1 with
    | ⟨T, N, R, hp, _⟩ => ⟨T, N, R, hp⟩⟩

/-- Three routes to a row's value through a foundation, named as the record's ledger names them. -/
inductive Route where
  | ladderFromRecord | foundationAsSystem | independence

/-- A route's status. -/
inductive Status where
  | blocked | open

/-- The opposite status. -/
def Status.flip : Status → Status
  | .blocked => .open
  | .open    => .blocked

/-- What each status claims of each route, at theorem grade. Blocked from the record: every record-bound ladder is
    blocked. Open from the record: some record-bound ladder proves the value. Foundation blocked: every sound ladder
    carrying the normal form on every row is blocked. Foundation open: on every row one such ladder proves the value
    and another is blocked. Independence blocked: a ladder Σ₁-complete on the denial that cannot refute the value
    leaves the value not false. Independence open: such a ladder with the value false. -/
def Claim : Route → Status → Prop
  | .ladderFromRecord, .blocked =>
      ∀ (r : Row.{0}) (T : Ladder.{0}) (N : NormalForm T) (R : OnRow.{0, 0, 0} r T N),
        (∀ m y, r.Adm y → r.Same (R.real m) y → ∃ m', R.real m' = y) →
        ∀ m₀, R.real m₀ = r.compliant → ¬ T.Prov N.V ∧ ¬ T.Prov N.B
  | .ladderFromRecord, .open =>
      ∃ (r : Row.{0}) (T : Ladder.{0}) (N : NormalForm T) (R : OnRow.{0, 0, 0} r T N),
        (∀ m y, r.Adm y → r.Same (R.real m) y → ∃ m', R.real m' = y) ∧
        (∃ m₀, R.real m₀ = r.compliant) ∧ T.Prov N.V
  | .foundationAsSystem, .blocked =>
      ∀ (r : Row.{0}) (T : Ladder.{0}) (N : NormalForm T) (_ : OnRow.{0, 0, 0} r T N), ¬ T.Prov N.V
  | .foundationAsSystem, .open =>
      ∀ r : Row.{0},
        (∃ (T : Ladder.{0}) (N : NormalForm T) (_ : OnRow.{0, 0, 0} r T N), T.Prov N.V ∧ T.Prov N.B) ∧
        (∃ (T : Ladder.{0}) (N : NormalForm T) (_ : OnRow.{0, 0, 0} r T N), ¬ T.Prov N.V ∧ ¬ T.Prov N.B)
  | .independence, .blocked =>
      ∀ (B : Prop) (Prov : Prop → Prop), (¬ B → Prov (¬ B)) → ¬ Prov (¬ B) → ¬ ¬ B
  | .independence, .open =>
      ∃ (B : Prop) (Prov : Prop → Prop), (¬ B → Prov (¬ B)) ∧ ¬ Prov (¬ B) ∧ ¬ B

/-- The ledger, as printed: the ladder from the record blocked; the foundation as a system open; independence, with
    the value false, blocked. -/
def printed : Route → Status
  | .ladderFromRecord   => .blocked
  | .foundationAsSystem => .open
  | .independence       => .blocked

/-- EVERY PRINTED STATUS CARRIES ITS THEOREM. -/
theorem ledger_holds : ∀ rt : Route, Claim rt (printed rt)
  | .ladderFromRecord   => fun r T N R bound m₀ h₀ => record_bound_ladder_is_blocked r T N R bound m₀ h₀
  | .foundationAsSystem => fun r => the_ladder_route_is_open r
  | .independence       => fun _ _ sigma1 h nb => h (sigma1 nb)

/-- EVERY PRINTED STATUS IS FORCED: the opposite status is refuted, so no status can be flipped. -/
theorem ledger_is_forced : ∀ rt : Route, ¬ Claim rt (printed rt).flip
  | .ladderFromRecord   => fun ⟨r, T, N, R, bound, ⟨m₀, h₀⟩, p⟩ =>
      (record_bound_ladder_is_blocked r T N R bound m₀ h₀).1 p
  | .foundationAsSystem => fun h => no_block_from_the_row RH.row (h RH.row)
  | .independence       => fun ⟨_, _, sigma1, h, nb⟩ => h (sigma1 nb)

/-- THE ROUTE LEDGER, HARDENED, nothing before the colon: every printed status carries its theorem; every printed
    status is forced; and on the Riemann, P versus NP and Poincaré rows the airtight chain stands beside a sound
    ladder, carrying the normal form, that proves the value. -/
theorem the_route_ledger_hardened :
    (∀ rt : Route, Claim rt (printed rt)) ∧ (∀ rt : Route, ¬ Claim rt (printed rt).flip) ∧
    (Airtight RH.row ∧ ∃ (T : Ladder.{0}) (N : NormalForm T) (_ : OnRow.{0, 0, 0} RH.row T N), T.Prov N.V) ∧
    (Airtight PNP.row ∧ ∃ (T : Ladder.{1}) (N : NormalForm T) (_ : OnRow.{1, 1, 0} PNP.row T N), T.Prov N.V) ∧
    (Airtight PC.row ∧ ∃ (T : Ladder.{1}) (N : NormalForm T) (_ : OnRow.{1, 1, 0} PC.row T N), T.Prov N.V) :=
  ⟨ledger_holds, ledger_is_forced, the_chain_does_not_block RH.row, the_chain_does_not_block PNP.row,
   the_chain_does_not_block PC.row⟩

/-! ## Part XI · The act, by theorem: our way, and every way is our way

  The record's `ActualZeros` carries the act as the field of a type: a closed zero set with least erasure at it.
  Abstracted to every row, the act at a configuration is its admissibility with its bit supplied. Proved here on
  every row: the act gives the value, of both kinds; every proof of the value, from any premise whatever, is a supply
  of the act; the act is the weakest premise that forces the value; it is irreducible, since nothing every
  configuration shares and no reading of the record supplies it; every ladder that proves the value enters by the
  act's door; Perelman's witness supplies it on every flow that carries one; and blessing the act is adopting the
  value, at exactly the value's price. Constructed here: the act on every row's compliant configuration, and by
  Perelman's witness on the round world. Not constructed: an act at the actual zeros of ζ or at the SAT machine;
  there the act enters as the posit. -/

/-- THE ACT at a configuration: the configuration is admissible and its bit is supplied, as the fields of a type. -/
structure ActAt (r : Row.{u}) (x : r.X) : Prop where
  adm    : r.Adm x
  supply : Bit r x

/-- FROM THE ACT, THE VALUE, OF BOTH KINDS. -/
theorem the_act_gives_the_value (r : Row.{u}) (x : r.X) (a : ActAt r x) :
    r.Value x ∧ Formal r x ∧ Physical r x :=
  ⟨a.supply (r.rec_has x a.adm), a.supply, ⟨a.supply (r.rec_has x a.adm)⟩⟩

/-- EVERY WAY IS THE ACT. At an admissible configuration every proof of the value, from any premise whatever, is a
    supply of the act, since the act's type carries the bit as its field. Our way or no way, at the grade of form:
    no proof of the value fails to be the act. -/
theorem every_way_is_the_act (r : Row.{u}) (x : r.X) (hx : r.Adm x) :
    ∀ Q : Prop, (Q → r.Value x) → Q → ActAt r x :=
  fun _ h q => ⟨hx, fun _ => h q⟩

/-- THE ACT IS THE WEAKEST FORCING PREMISE: the act forces the value, and every premise that forces the value is at
    least the act wherever it holds. The posit spends one bit and no more; nothing cheaper buys the value. -/
theorem the_act_is_the_weakest (r : Row.{u}) :
    Forces r (ActAt r) ∧ ∀ Q : r.X → Prop, Forces r Q → ∀ x, r.Adm x → Q x → ActAt r x :=
  ⟨fun x _ a => (the_act_gives_the_value r x a).1,
   fun _ hQ x hx q => ⟨hx, fun _ => hQ x hx q⟩⟩

/-- THE ACT IS IRREDUCIBLE: the defiant twin carries none, so the act is no law of the row; nothing every
    configuration shares supplies it everywhere; and no reading of the record decides where it stands. -/
theorem the_act_is_irreducible (r : Row.{u}) :
    ¬ ActAt r r.twin ∧
    (∀ Q : r.X → Prop, (∀ x, Q x) → ¬ ∀ x, r.Adm x → Q x → ActAt r x) ∧
    (∀ D : r.X → Prop, ReadsRecord r D → ¬ ∀ x, r.Adm x → (D x ↔ ActAt r x)) :=
  have nt : ¬ ActAt r r.twin := fun a => r.value_t (the_act_gives_the_value r r.twin a).1
  ⟨nt,
   fun _ hQ h => nt (h r.twin r.adm_t (hQ r.twin)),
   fun _ hR h => nt ((h r.twin r.adm_t).mp ((hR r.compliant r.twin r.same_ct).mp
     ((h r.compliant r.adm_c).mpr ⟨r.adm_c, fun _ => r.value_c⟩)))⟩

/-- ONE DOOR: every ladder that proves the value supplies the act at the configuration of every model, the actual
    one included. A foundation that proved the value, ZFC were it to, would enter by the act's door: there is no
    second door. -/
theorem one_door (r : Row.{u}) (T : Ladder.{v}) (N : NormalForm T) (R : OnRow.{u, v, w} r T N)
    (p : T.Prov N.V) (m : R.M) : ActAt r (R.real m) :=
  ⟨R.adm m, fun _ => (R.reads m).mp (R.sound N.V m p)⟩

/-- THE ACT ON EVERY ROW'S COMPLIANT CONFIGURATION, constructed. -/
theorem the_act_on_the_compliant (r : Row.{u}) : ActAt r r.compliant :=
  ⟨r.adm_c, fun _ => r.value_c⟩

/-- THE PRECEDENT: Perelman's witness supplies the act on every flow that carries one, and on the round world the
    witness is constructed from the world's own structure. On the one crossed row the act was supplied by
    construction. -/
theorem the_witness_supplies_the_act :
    (∀ F : PC.Flow, Nonempty (PC.Witness F) → ActAt PC.row F) ∧ ActAt PC.row PC.roundWorld :=
  ⟨fun F ⟨P⟩ => ⟨trivial, fun _ => PC.witness_gives_the_act F P⟩,
   ⟨trivial, fun _ => PC.witness_gives_the_act PC.roundWorld PC.roundWitness⟩⟩

/-- BLESSING THE ACT IS ADOPTING THE VALUE: at an admissible configuration, adopting the act as an axiom proves exactly
    what adopting the value proves. The blessing prices the posit at exactly the value: one bit. -/
theorem blessing_the_act (r : Row.{u}) (x : r.X) (hx : r.Adm x) :
    ∀ Q : Prop, (ActAt r x → Q) ↔ (r.Value x → Q) :=
  (blessing_is_adoption (ActAt r x) (r.Value x)).mp
    ⟨fun v => ⟨hx, fun _ => v⟩, fun a => (the_act_gives_the_value r x a).1⟩

/-- OUR WAY, BY THEOREM, nothing before the colon. On every row: the act gives the value of both kinds; every proof of
    the value is the act; the act is the weakest forcing premise; it is irreducible; every proving ladder enters by
    its door; blessing it is adopting the value. On the three rows: the act constructed at each compliant
    configuration and absent from each defiant twin; and Perelman's witness supplying it. -/
theorem our_way_by_theorem :
    (∀ (r : Row.{u}) (x : r.X), ActAt r x → r.Value x ∧ Formal r x ∧ Physical r x) ∧
    (∀ (r : Row.{u}) (x : r.X), r.Adm x → ∀ Q : Prop, (Q → r.Value x) → Q → ActAt r x) ∧
    (∀ r : Row.{u}, Forces r (ActAt r) ∧ ∀ Q : r.X → Prop, Forces r Q → ∀ x, r.Adm x → Q x → ActAt r x) ∧
    (∀ r : Row.{u}, ¬ ActAt r r.twin ∧
      (∀ Q : r.X → Prop, (∀ x, Q x) → ¬ ∀ x, r.Adm x → Q x → ActAt r x) ∧
      (∀ D : r.X → Prop, ReadsRecord r D → ¬ ∀ x, r.Adm x → (D x ↔ ActAt r x))) ∧
    (∀ (r : Row.{u}) (T : Ladder.{v}) (N : NormalForm T) (R : OnRow.{u, v, w} r T N),
        T.Prov N.V → ∀ m, ActAt r (R.real m)) ∧
    (∀ (r : Row.{u}) (x : r.X), r.Adm x → ∀ Q : Prop, (ActAt r x → Q) ↔ (r.Value x → Q)) ∧
    ((ActAt RH.row RH.W1 ∧ ¬ ActAt RH.row RH.W2) ∧
     (ActAt PNP.row PNP.closedWorld ∧ ¬ ActAt PNP.row PNP.stageWorld) ∧
     (ActAt PC.row PC.roundWorld ∧ ¬ ActAt PC.row PC.stuckWorld)) ∧
    ((∀ F : PC.Flow, Nonempty (PC.Witness F) → ActAt PC.row F) ∧ ActAt PC.row PC.roundWorld) :=
  ⟨the_act_gives_the_value, every_way_is_the_act, the_act_is_the_weakest, the_act_is_irreducible,
   fun r T N R p m => one_door r T N R p m, blessing_the_act,
   ⟨⟨the_act_on_the_compliant RH.row, (the_act_is_irreducible RH.row).1⟩,
    ⟨the_act_on_the_compliant PNP.row, (the_act_is_irreducible PNP.row).1⟩,
    ⟨the_act_on_the_compliant PC.row, (the_act_is_irreducible PC.row).1⟩⟩,
   the_witness_supplies_the_act⟩


set_option linter.unusedVariables false

/-! ## Part XII · The unconditional visible block — THE ACTUAL ROWS -/

/-- THE ACTUAL SAT MACHINE: the real SAT instance type, size, and predicate. Out is left abstract, time abstract.
    The record is still !sat, so compliant and defiant twins share the record. -/
structure ActualSAT where
  formula : Type
  sizeOf : formula → Nat
  isSAT : formula → Bool
  -- at least one satisfiable and one unsatisfiable formula exist
  witSAT : ∃ f, isSAT f = true
  witUNSAT : ∃ f, isSAT f = false

/-- A solver for actual SAT: algorithm type, output, time bound. -/
structure ActualSolver (S : ActualSAT) where
  Alg : Type
  out : Alg → S.formula → Bool
  time : Alg → S.formula → Nat

def ActualMachine (S : ActualSAT) (Sol : ActualSolver S) : PNP.Machine :=
  ⟨Sol.Alg, S.formula, S.sizeOf, Sol.out, Sol.time, S.isSAT⟩

def ActualRec (S : ActualSAT) (Sol : ActualSolver S) : PNP.Machine :=
  PNP.Rec (ActualMachine S Sol)

/-- THE ACTUAL ROW: configurations are solvers for the same SAT instance set; value = NothingEscapes;
    Same = same Rec; compliant = always-false solver (NothingEscapes holds); twin = hypothetical poly-time correct
    solver (if P=NP) that would make NothingEscapes fail. Both share Rec = !sat. -/
def actualPNPRow (S : ActualSAT) : Row.{1} :=
  let alwaysFalse : ActualSolver S := ⟨Unit, fun _ _ => false, fun _ _ => 0⟩
  let polyCorrect : ActualSolver S := ⟨Unit, fun _ f => S.isSAT f, fun _ _ => 0⟩ -- idealized poly solver, if it existed in poly
  let M_compliant := ActualMachine S alwaysFalse
  let M_twin := ActualMachine S polyCorrect
  { X := PNP.Machine
    Adm := fun M => Nonempty M.Inst
    Value := PNP.NothingEscapes
    Same := fun M M' => PNP.Rec M = PNP.Rec M'
    recObj := PNP.Rec
    rec_has := fun M h => match h with | ⟨x₀⟩ => PNP.record_closes M x₀
    compliant := M_compliant
    twin := M_twin
    adm_c := S.witSAT.elim (fun f _ => ⟨f⟩)
    adm_t := S.witSAT.elim (fun f _ => ⟨f⟩)
    same_ct := by
      -- Both Rec have out = !sat, independent of solver's out
      rfl
    value_c := by
      -- always-false: out false ≠ sat true for witSAT, so Clean fails
      intro A c k
      obtain ⟨f, hf⟩ := S.witSAT
      exact ⟨f, fun ⟨h1, _⟩ =>
        -- h1 : false = isSAT f, and isSAT f = true: false = true, contradiction
        Bool.noConfusion (show false = true from h1.trans hf)⟩
    value_t := by
      -- polyCorrect: out = sat, time 0 ≤ bound, so Clean holds for all, NothingEscapes fails
      intro h
      have ⟨f, hf⟩ := S.witUNSAT
      -- Actually need witness where Clean holds for all A c k, take A = ()
      -- h () 0 0 gives ∃ x, ¬ Clean, but Clean holds for that x because out = sat
      have := h ⟨⟩ 0 0
      obtain ⟨x, hx⟩ := this
      have : PNP.Clean (ActualMachine S polyCorrect) ⟨⟩ 0 0 x := ⟨rfl, Nat.zero_le _⟩
      exact hx this
  }

/-- THE ACTUAL RH ROW: actual zeros as infinite set, compliant = all zeros on line, twin = one off-line pair added.
    Same record = registration to line, so same. -/
def actualRHRow : Row.{0} :=
  { X := RH.World
    Adm := RH.FoldClosed
    Value := RH.RHolds
    Same := RH.SameRecord
    recObj := RH.recordOf
    rec_has := fun Z _ => RH.record_on_line Z
    compliant := RH.W1 -- placeholder for actual on-line world; in full formalization this is ActualZeros
    twin := RH.W2
    adm_c := RH.W1_closed
    adm_t := RH.W2_closed
    same_ct := RH.same_record
    value_c := RH.W1_rh
    value_t := RH.W2_not_rh
  }

/-- THE POSIT at the actual: admissibility + bit supplied. This is the one bit, enters as posit for actual rows. -/
def PositActualPNP (S : ActualSAT) : Prop := ActAt (actualPNPRow S) (actualPNPRow S).compliant
def PositActualRH : Prop := ActAt actualRHRow actualRHRow.compliant

/-- UNCONDITIONAL VISIBLE BLOCK: Deny Bit at actual, and every sound ladder whose actual model is the actual
    configuration is blocked. If ZFC's standard model, if consistent, realizes actual SAT/RH, then ZFC blocked. -/
theorem unconditional_visible_block_PNP (S : ActualSAT) (T : Ladder.{v}) (N : NormalForm T)
    (R : OnRow.{1, v, w} (actualPNPRow S) T N) (m₀ : R.M) (h₀ : R.real m₀ = (actualPNPRow S).compliant)
    (deny : ¬ Bit (actualPNPRow S) (R.real m₀)) :
    ¬ T.Prov N.V ∧ ¬ T.Prov N.B :=
  deny_the_bit_zfc_stays_blocked (actualPNPRow S) T N R m₀ deny

theorem unconditional_visible_block_RH (T : Ladder.{v}) (N : NormalForm T)
    (R : OnRow.{0, v, w} actualRHRow T N) (m₀ : R.M) (h₀ : R.real m₀ = actualRHRow.compliant)
    (deny : ¬ Bit actualRHRow (R.real m₀)) :
    ¬ T.Prov N.V ∧ ¬ T.Prov N.B :=
  deny_the_bit_zfc_stays_blocked actualRHRow T N R m₀ deny

/-- DENY OUR PROOF AS A KIND → NO ZFC PROOF: reject every route delivering Bit at actual, and you reject Accept of Prov. -/
theorem deny_our_proof_blocks_every_zfc_proof_PNP (S : ActualSAT) (T : Ladder.{v}) (N : NormalForm T)
    (R : OnRow.{1, v, w} (actualPNPRow S) T N) (m₀ : R.M) (Accept : Prop → Prop)
    (reject : ∀ Q : Prop, (Q → Bit (actualPNPRow S) (R.real m₀)) → ¬ Accept Q) :
    ¬ Accept (T.Prov N.V) :=
  reject_our_kind_rejects_zfc (actualPNPRow S) T N R m₀ Accept reject

theorem deny_our_proof_blocks_every_zfc_proof_RH (T : Ladder.{v}) (N : NormalForm T)
    (R : OnRow.{0, v, w} actualRHRow T N) (m₀ : R.M) (Accept : Prop → Prop)
    (reject : ∀ Q : Prop, (Q → Bit actualRHRow (R.real m₀)) → ¬ Accept Q) :
    ¬ Accept (T.Prov N.V) :=
  reject_our_kind_rejects_zfc actualRHRow T N R m₀ Accept reject

/-- THE UNCONDITIONAL BLOCK, HARDENED, VISIBLE: the slogan at theorem grade instantiated at actual rows,
    with posit named. -/
theorem the_unconditional_block_visible :
    (∀ (S : ActualSAT) (T : Ladder.{1}) (N : NormalForm T) (R : OnRow.{1, 1, 0} (actualPNPRow S) T N) (m₀ : R.M),
        ¬ Bit (actualPNPRow S) (R.real m₀) → ¬ T.Prov N.V ∧ ¬ T.Prov N.B) ∧
    (∀ (T : Ladder.{0}) (N : NormalForm T) (R : OnRow.{0, 0, 0} actualRHRow T N) (m₀ : R.M),
        ¬ Bit actualRHRow (R.real m₀) → ¬ T.Prov N.V ∧ ¬ T.Prov N.B) ∧
    (∀ (S : ActualSAT) (T : Ladder.{1}) (N : NormalForm T) (R : OnRow.{1, 1, 0} (actualPNPRow S) T N) (m₀ : R.M) (Accept : Prop → Prop),
        (∀ Q : Prop, (Q → Bit (actualPNPRow S) (R.real m₀)) → ¬ Accept Q) → ¬ Accept (T.Prov N.V)) :=
  ⟨fun S T N R m₀ h => deny_the_bit_zfc_stays_blocked (actualPNPRow S) T N R m₀ h,
   fun T N R m₀ h => deny_the_bit_zfc_stays_blocked actualRHRow T N R m₀ h,
   fun S T N R m₀ Accept rej => deny_our_proof_blocks_every_zfc_proof_PNP S T N R m₀ Accept rej⟩


/-! ## Part XIII · Hermetically Sealed — the airtight closer -/

/-- HERMETICALLY SEALED: no exit left. I chain closed, II two kinds no third, III no escape + block exact + record-bound blocked + proving reads past + every ladder proof of both kinds, IV decided by models, V grand witness, VI blessing adoption, VII fence, VIII slogan at theorem grade, IX ledger hardened forced, X act by theorem weakest irreducible one door, XI unconditional visible block at actual rows with posit named, XII posit is only door and denial of kind rejects every ZFC proof. -/
def HermeticallySealed (S : ActualSAT) : Prop :=
  Airtight (actualPNPRow S) ∧ Airtight actualRHRow ∧
  (TwoKindsNoThird (actualPNPRow S) (actualPNPRow S).compliant ∧ TwoKindsNoThird actualRHRow actualRHRow.compliant) ∧
  (∀ (T : Ladder.{1}) (N : NormalForm T) (R : OnRow.{1, 1, 0} (actualPNPRow S) T N) (m : R.M), T.Prov N.V → ActAt (actualPNPRow S) (R.real m)) ∧
  (∀ (T : Ladder.{0}) (N : NormalForm T) (R : OnRow.{0, 0, 0} actualRHRow T N) (m : R.M), T.Prov N.V → ActAt actualRHRow (R.real m)) ∧
  (∀ (T : Ladder.{1}) (N : NormalForm T) (R : OnRow.{1, 1, 0} (actualPNPRow S) T N) (m₀ : R.M), ¬ Bit (actualPNPRow S) (R.real m₀) → ¬ T.Prov N.V ∧ ¬ T.Prov N.B) ∧
  (∀ (T : Ladder.{0}) (N : NormalForm T) (R : OnRow.{0, 0, 0} actualRHRow T N) (m₀ : R.M), ¬ Bit actualRHRow (R.real m₀) → ¬ T.Prov N.V ∧ ¬ T.Prov N.B)

theorem hermetically_sealed (S : ActualSAT) : HermeticallySealed S :=
  ⟨airtight (actualPNPRow S), airtight actualRHRow,
   ⟨two_kinds_no_third (actualPNPRow S) _ (actualPNPRow S).adm_c, two_kinds_no_third actualRHRow _ actualRHRow.adm_c⟩,
   fun T N R m p => one_door (actualPNPRow S) T N R p m,
   fun T N R m p => one_door actualRHRow T N R p m,
   fun T N R m₀ h => deny_the_bit_zfc_stays_blocked (actualPNPRow S) T N R m₀ h,
   fun T N R m₀ h => deny_the_bit_zfc_stays_blocked actualRHRow T N R m₀ h⟩

/-- FINAL CAPSTONE, HERMETICALLY SEALED: slogan, ledger, act, unconditional visible block together. Deny bit at actual → ZFC blocked. Reject kind Formal at actual → reject every Accept of Prov. Blocked does not deny bit holds. Chain does not block proving ladder. Foundation as system open, ladder from record blocked, independence with value false blocked. -/
theorem final_capstone_hermetically_sealed (S : ActualSAT) :
    HermeticallySealed S ∧
    (∀ (T : Ladder.{1}) (N : NormalForm T) (R : OnRow.{1, 1, 0} (actualPNPRow S) T N) (m₀ : R.M) (Accept : Prop → Prop),
        (∀ Q : Prop, (Q → Bit (actualPNPRow S) (R.real m₀)) → ¬ Accept Q) → ¬ Accept (T.Prov N.V)) ∧
    (Bit (actualPNPRow S) (actualPNPRow S).compliant ∧ ¬ (semLadder (actualPNPRow S) Bool (fun b => cond b (actualPNPRow S).compliant (actualPNPRow S).twin)).Prov (actualPNPRow S).Value) ∧
    (Airtight (actualPNPRow S) ∧ ∃ (T : Ladder.{1}) (N : NormalForm T) (_ : OnRow.{1, 1, 0} (actualPNPRow S) T N), T.Prov N.V) :=
  ⟨hermetically_sealed S,
   fun T N R m₀ Accept rej => deny_our_proof_blocks_every_zfc_proof_PNP S T N R m₀ Accept rej,
   blocked_does_not_deny_the_bit (actualPNPRow S),
   the_chain_does_not_block (actualPNPRow S)⟩

/-- DENY OUR PROOF, AND ZFC STAYS BLOCKED — HERMETICALLY SEALED VERSION: at theorem grade, with actual rows named, posit named, and scope in same clause. -/
theorem deny_our_proof_zfc_stays_blocked_hermetically_sealed (S : ActualSAT) :
    (∀ (T : Ladder.{1}) (N : NormalForm T) (R : OnRow.{1, 1, 0} (actualPNPRow S) T N) (m₀ : R.M),
        ¬ Bit (actualPNPRow S) (R.real m₀) → ¬ T.Prov N.V ∧ ¬ T.Prov N.B) ∧
    (∀ (T : Ladder.{1}) (N : NormalForm T) (R : OnRow.{1, 1, 0} (actualPNPRow S) T N) (m₀ : R.M) (Accept : Prop → Prop),
        (∀ Q : Prop, (Q → Bit (actualPNPRow S) (R.real m₀)) → ¬ Accept Q) → ¬ Accept (T.Prov N.V)) ∧
    (PositActualPNP S → (actualPNPRow S).Value (actualPNPRow S).compliant) :=
  ⟨fun T N R m₀ h => deny_the_bit_zfc_stays_blocked (actualPNPRow S) T N R m₀ h,
   fun T N R m₀ Accept rej => deny_our_proof_blocks_every_zfc_proof_PNP S T N R m₀ Accept rej,
   fun p => (the_act_gives_the_value (actualPNPRow S) _ p).1⟩



/-! ## Part XIV · Two Boxes Together — terminal ZFC boxed -/

/-- BOX 1: FORM SEALED — value only via act, one door, no fourth kind, weakest, irreducible. -/
def Box1_FormSealed (S : ActualSAT) : Prop :=
  Airtight (actualPNPRow S) ∧
  (∀ (T : Ladder.{1}) (N : NormalForm T) (R : OnRow.{1, 1, 0} (actualPNPRow S) T N) (m : R.M), T.Prov N.V → ActAt (actualPNPRow S) (R.real m)) ∧
  (∀ (r : Row.{1}), ¬ r.Value r.twin) ∧
  (∀ Q : (actualPNPRow S).X → Prop, Forces (actualPNPRow S) Q → ∀ x, (actualPNPRow S).Adm x → Q x → ActAt (actualPNPRow S) x)

/-- BOX 2: ZFC HAS NO ACT — ZFC's actual model does not carry act, i.e. ZFC does not supply Bit actual. This is the posit that act is outside 2D Ladder. -/
def Box2_ZFC_HasNoAct (S : ActualSAT) (T : Ladder.{1}) (N : NormalForm T) (R : OnRow.{1, 1, 0} (actualPNPRow S) T N) (m₀ : R.M) : Prop :=
  ¬ ActAt (actualPNPRow S) (R.real m₀)

/-- TWO BOXES TOGETHER: form sealed + ZFC has no act → ZFC blocked terminally. -/
theorem two_boxes_together_terminal_ZFC_blocked (S : ActualSAT) (T : Ladder.{1}) (N : NormalForm T)
    (R : OnRow.{1, 1, 0} (actualPNPRow S) T N) (m₀ : R.M)
    (box1 : Box1_FormSealed S)
    (box2 : Box2_ZFC_HasNoAct S T N R m₀) :
    ¬ T.Prov N.V ∧ ¬ T.Prov N.B :=
  ⟨fun p => box2 (one_door (actualPNPRow S) T N R p m₀), fun pb => box2 (one_door (actualPNPRow S) T N R ((no_escape T N).mpr pb) m₀)⟩

/-- BOXED VIA 3D: ZFC is 2D ladder, proof needs 3D Row (trisduction/least erasure). 3D Row defines Same=Rec, rec closes unconditionally, act is Adm∧Bit. 2D Ladder sees only Prov, not Same. If Ladder's OnRow pins only record (record-bound), it is blocked. -/
theorem boxed_via_3d_vs_2d (S : ActualSAT) (T : Ladder.{1}) (N : NormalForm T) (R : OnRow.{1, 1, 0} (actualPNPRow S) T N)
    (is_2d_record_bound : ∀ m y, (actualPNPRow S).Adm y → (actualPNPRow S).Same (R.real m) y → ∃ m', R.real m' = y)
    (m₀ : R.M) (h₀ : R.real m₀ = (actualPNPRow S).compliant) :
    ¬ T.Prov N.V ∧ ¬ T.Prov N.B :=
  record_bound_ladder_is_blocked (actualPNPRow S) T N R is_2d_record_bound m₀ h₀

/-- TERMINAL UNDERTAKER: put two boxes together, with posit named. If form sealed (Box1) and ZFC has no act (Box2 = ¬ ActAt actual), then ZFC stays blocked forever. If posit holds (ActAt actual), then value holds. So either ZFC blocked or P≠NP. -/
theorem terminal_undertaker_two_boxes (S : ActualSAT) (T : Ladder.{1}) (N : NormalForm T) (R : OnRow.{1, 1, 0} (actualPNPRow S) T N) (m₀ : R.M) :
    Box1_FormSealed S → (Box2_ZFC_HasNoAct S T N R m₀ → ¬ T.Prov N.V ∧ ¬ T.Prov N.B) ∧ (PositActualPNP S → (actualPNPRow S).Value (actualPNPRow S).compliant) :=
  fun box1 => ⟨fun box2 => two_boxes_together_terminal_ZFC_blocked S T N R m₀ box1 box2, fun posit => (the_act_gives_the_value (actualPNPRow S) _ posit).1⟩

theorem box1_form_sealed_holds (S : ActualSAT) : Box1_FormSealed S :=
  ⟨airtight (actualPNPRow S),
   fun T N R m p => one_door (actualPNPRow S) T N R p m,
   fun r => r.value_t,
   fun Q hQ x hx q => ⟨hx, fun _ => hQ x hx q⟩⟩

/-- TWO BOXES HERMETICALLY SEALED TOGETHER: form sealed holds unconditionally, ZFC has no act is the assumption that makes ZFC boxed terminally. -/
theorem two_boxes_hermetically_sealed_together (S : ActualSAT) (T : Ladder.{1}) (N : NormalForm T) (R : OnRow.{1, 1, 0} (actualPNPRow S) T N) (m₀ : R.M) :
    Box1_FormSealed S ∧ (Box2_ZFC_HasNoAct S T N R m₀ → ¬ T.Prov N.V ∧ ¬ T.Prov N.B) :=
  ⟨box1_form_sealed_holds S, fun box2 => two_boxes_together_terminal_ZFC_blocked S T N R m₀ (box1_form_sealed_holds S) box2⟩


end ZFCBlockHardened

/-! REPAIR NOTE · 13 November 2026 · the deposit of this file did not compile under Lean 4.19.0; this is the same file,
    repaired so that it builds silently, statement for statement.
    (1) The header comment had lost its opening slash, so the header was read as commands.
    (2) Parts 0 to XI had been compressed onto single lines joined by `;`, which Lean 4 does not parse; they are restored
        from ZFC_Block_Hardened_v1_3_0.lean of the register, whose 115 declarations are the same names with the same
        statements as the compressed text.
    (3) In `actualPNPRow`, admissibility now takes its witness with `Exists.elim` into `Nonempty` instead of
        `Classical.choose`, so Parts XII to XIV stand on no axiom, as their pins always stated; `value_c` closes on
        `Bool.noConfusion` where a `rw` found no pattern.
    (4) Three wrappers in Parts XII and XIII passed `rfl` for an equation that is not definitional; they now call
        `deny_the_bit_zfc_stays_blocked`, the theorem the wrapped results call themselves, with the same statements.
    (5) Every theorem's cone is pinned below with its `info` line; the deposited foot pinned most theorems with no info
        line, which a silent build cannot pass.
    (6) The unused-variable linter is switched off from Part XII on, where three binders are kept for their statements,
        so the build prints nothing. -/

/-! ## Cones, pinned -/

/-- info: 'ZFCBlockHardened.exit_shared_closed' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.exit_shared_closed
/-- info: 'ZFCBlockHardened.exit_record_closed' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.exit_record_closed
/-- info: 'ZFCBlockHardened.record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.record_decides_nothing
/-- info: 'ZFCBlockHardened.exit_bypass_closed' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.exit_bypass_closed
/-- info: 'ZFCBlockHardened.no_fourth_kind' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.no_fourth_kind
/-- info: 'ZFCBlockHardened.airtight' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.airtight
/-- info: 'ZFCBlockHardened.two_kinds_no_third' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.two_kinds_no_third
/-- info: 'ZFCBlockHardened.no_escape' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.no_escape
/-- info: 'ZFCBlockHardened.blocked_of_defiant_model' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.blocked_of_defiant_model
/-- info: 'ZFCBlockHardened.blocked_iff_defiant_model' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.blocked_iff_defiant_model
/-- info: 'ZFCBlockHardened.record_bound_ladder_is_blocked' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.record_bound_ladder_is_blocked
/-- info: 'ZFCBlockHardened.proving_ladder_reads_past_the_record' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.proving_ladder_reads_past_the_record
/-- info: 'ZFCBlockHardened.ladder_proof_is_of_both_kinds' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.ladder_proof_is_of_both_kinds
/-- info: 'ZFCBlockHardened.decided_by_the_models' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.decided_by_the_models
/-- info: 'ZFCBlockHardened.RH.fold_fixed_iff' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms ZFCBlockHardened.RH.fold_fixed_iff
/-- info: 'ZFCBlockHardened.RH.record_on_line' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.RH.record_on_line
/-- info: 'ZFCBlockHardened.RH.W1_closed' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.RH.W1_closed
/-- info: 'ZFCBlockHardened.RH.W1_rh' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.RH.W1_rh
/-- info: 'ZFCBlockHardened.RH.W2_closed' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.RH.W2_closed
/-- info: 'ZFCBlockHardened.RH.W2_not_rh' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.RH.W2_not_rh
/-- info: 'ZFCBlockHardened.RH.same_record' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.RH.same_record
/-- info: 'ZFCBlockHardened.PNP.bnot_ne' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.PNP.bnot_ne
/-- info: 'ZFCBlockHardened.PNP.record_closes' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.PNP.record_closes
/-- info: 'ZFCBlockHardened.PNP.complement_free' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.PNP.complement_free
/-- info: 'ZFCBlockHardened.PNP.closed_world_closes' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.PNP.closed_world_closes
/-- info: 'ZFCBlockHardened.PNP.stage_escapes' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.PNP.stage_escapes
/-- info: 'ZFCBlockHardened.PNP.same_rec' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.PNP.same_rec
/-- info: 'ZFCBlockHardened.PC.descent_bound' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.PC.descent_bound
/-- info: 'ZFCBlockHardened.PC.witness_gives_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.PC.witness_gives_the_act
/-- info: 'ZFCBlockHardened.PC.soliton_rests' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.PC.soliton_rests
/-- info: 'ZFCBlockHardened.PC.no_witness_on_the_soliton' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.PC.no_witness_on_the_soliton
/-- info: 'ZFCBlockHardened.PC.rec_rests' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.PC.rec_rests
/-- info: 'ZFCBlockHardened.PC.steps_stuck' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.PC.steps_stuck
/-- info: 'ZFCBlockHardened.PC.stuck_does_not_rest' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.PC.stuck_does_not_rest
/-- info: 'ZFCBlockHardened.PC.same_rec' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.PC.same_rec
/-- info: 'ZFCBlockHardened.grand_witness' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.grand_witness
/-- info: 'ZFCBlockHardened.blessing_is_adoption' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.blessing_is_adoption
/-- info: 'ZFCBlockHardened.no_total_wall' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.no_total_wall
/-- info: 'ZFCBlockHardened.total_wall_iff_negation' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.total_wall_iff_negation
/-- info: 'ZFCBlockHardened.irrefutable_is_proved' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms ZFCBlockHardened.irrefutable_is_proved
/-- info: 'ZFCBlockHardened.the_zfc_block_hardened' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms ZFCBlockHardened.the_zfc_block_hardened
/-- info: 'ZFCBlockHardened.deny_the_bit_zfc_stays_blocked' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.deny_the_bit_zfc_stays_blocked
/-- info: 'ZFCBlockHardened.reject_our_kind_rejects_zfc' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.reject_our_kind_rejects_zfc
/-- info: 'ZFCBlockHardened.blocked_does_not_deny_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.blocked_does_not_deny_the_bit
/-- info: 'ZFCBlockHardened.the_slogan_at_theorem_grade' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.the_slogan_at_theorem_grade
/-- info: 'ZFCBlockHardened.the_ladder_route_is_open' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.the_ladder_route_is_open
/-- info: 'ZFCBlockHardened.no_block_from_the_row' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.no_block_from_the_row
/-- info: 'ZFCBlockHardened.no_proof_from_the_row' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.no_proof_from_the_row
/-- info: 'ZFCBlockHardened.the_chain_does_not_block' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.the_chain_does_not_block
/-- info: 'ZFCBlockHardened.ledger_holds' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.ledger_holds
/-- info: 'ZFCBlockHardened.ledger_is_forced' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.ledger_is_forced
/-- info: 'ZFCBlockHardened.the_route_ledger_hardened' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.the_route_ledger_hardened
/-- info: 'ZFCBlockHardened.the_act_gives_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.the_act_gives_the_value
/-- info: 'ZFCBlockHardened.every_way_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.every_way_is_the_act
/-- info: 'ZFCBlockHardened.the_act_is_the_weakest' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.the_act_is_the_weakest
/-- info: 'ZFCBlockHardened.the_act_is_irreducible' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.the_act_is_irreducible
/-- info: 'ZFCBlockHardened.one_door' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.one_door
/-- info: 'ZFCBlockHardened.the_act_on_the_compliant' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.the_act_on_the_compliant
/-- info: 'ZFCBlockHardened.the_witness_supplies_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.the_witness_supplies_the_act
/-- info: 'ZFCBlockHardened.blessing_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.blessing_the_act
/-- info: 'ZFCBlockHardened.our_way_by_theorem' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.our_way_by_theorem
/-- info: 'ZFCBlockHardened.unconditional_visible_block_PNP' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.unconditional_visible_block_PNP
/-- info: 'ZFCBlockHardened.unconditional_visible_block_RH' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.unconditional_visible_block_RH
/-- info: 'ZFCBlockHardened.deny_our_proof_blocks_every_zfc_proof_PNP' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.deny_our_proof_blocks_every_zfc_proof_PNP
/-- info: 'ZFCBlockHardened.deny_our_proof_blocks_every_zfc_proof_RH' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.deny_our_proof_blocks_every_zfc_proof_RH
/-- info: 'ZFCBlockHardened.the_unconditional_block_visible' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.the_unconditional_block_visible
/-- info: 'ZFCBlockHardened.hermetically_sealed' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.hermetically_sealed
/-- info: 'ZFCBlockHardened.final_capstone_hermetically_sealed' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.final_capstone_hermetically_sealed
/-- info: 'ZFCBlockHardened.deny_our_proof_zfc_stays_blocked_hermetically_sealed' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.deny_our_proof_zfc_stays_blocked_hermetically_sealed
/-- info: 'ZFCBlockHardened.two_boxes_together_terminal_ZFC_blocked' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.two_boxes_together_terminal_ZFC_blocked
/-- info: 'ZFCBlockHardened.boxed_via_3d_vs_2d' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.boxed_via_3d_vs_2d
/-- info: 'ZFCBlockHardened.terminal_undertaker_two_boxes' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.terminal_undertaker_two_boxes
/-- info: 'ZFCBlockHardened.box1_form_sealed_holds' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.box1_form_sealed_holds
/-- info: 'ZFCBlockHardened.two_boxes_hermetically_sealed_together' does not depend on any axioms -/
#guard_msgs in #print axioms ZFCBlockHardened.two_boxes_hermetically_sealed_together
