/-!
  LĀ RAYBA FĪH — THE SEAL · v2.0.0
  The kernel of the paper "Lā Rayba Fīh: The Seven Millennium Closures Read as Balance, Witness and
  Preserved Record — the Form by Theorem, the Value by the Act, the Dominion with the Ground".
  Core Lean 4.19.0, standalone: no import, no sorry, no axiom declared, no native_decide. Every cone is pinned
  by #guard_msgs at the foot, so any drift in any cone fails the build.

  WHAT THE SEAL PROVES. The paper's four sentences, over every row of the normal form (a record that carries
  the value, two admissible configurations sharing the record and splitting on the value), and the paper's
  pair, seven and precedent on constructed rows:
    I    THE ACT IS ESSENTIAL AND IRREDUCIBLE. The value of a frame is exactly the act at it; nothing every
         configuration shares and no reading of the record supplies the act; the open framing, "derive the
         value from what every configuration shares", is refuted. This is lā rayba fīh in the mathematical
         register: the doubt is the open framing, and it is a theorem's negation.
    II   TWO KINDS AND NO THIRD. The formal kind and the physical kind are each exactly the value, the formal
         is never alone, and one refuter refutes both.
    III  A SIMPLE WITNESS PASSES EVERY WALL. A witness, a premise that forces the value and is present where
         the value holds, is not shared, reads past the record, and delivers the act; a wall on every
         witness is the negation.
    IV   THE FORMAL REALM ALONE HAS NO FINAL SAY. A ladder of sentences and models proves the value exactly
         when it proves the bit, enters the value by the act's door, reads past the record when it proves
         the value, and is blocked when its models pin only the record.
    V    THE PAIR. The Riemann row and the P versus NP row, built as rows, each closed to the act.
    VI   THE SEVEN. For any seven rows: each closed to its bit, two kinds each, no shared premise forces any,
         all 128 patterns of the seven values realized, and no principle true of every configuration
         forces all seven values.
    VII  THE PRECEDENT. A functional strictly decreasing off the seat and scale-free gives the act; the
         self-similar flow rests and admits no witness; the round world carries the witness and its stuck
         twin of the same record does not.
    VIII THE REGISTER LAW. A hearing assigns verses to claims; every mathematical claim of the paper is
         proved for every hearing and from none: the scriptural register is a free parameter of the seal.
    IX   THE PAPER, in one theorem with nothing before its colon.
  WHAT THE SEAL DOES NOT PROVE: any Millennium value. The real rows are supplied by the parents; here the
  rows are the normal form's hypotheses and three constructed instances. ΔM = 0.
-/

namespace LaRaybaFih

universe u v w

/-! ## Part 0 · A row of the normal form -/

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

def ReadsRecord (r : Row.{u}) (Q : r.X → Prop) : Prop := ∀ x y, r.Same x y → (Q x ↔ Q y)
def Bit (r : Row.{u}) (x : r.X) : Prop := r.Value (r.recObj x) → r.Value x
def Forces (r : Row.{u}) (Q : r.X → Prop) : Prop := ∀ x, r.Adm x → Q x → r.Value x

/-- The act at a configuration: its admissibility with its bit supplied. -/
structure ActAt (r : Row.{u}) (x : r.X) : Prop where
  adm    : r.Adm x
  supply : Bit r x

/-! ## Part I · The act is essential and irreducible -/

theorem the_bit_is_the_value (r : Row.{u}) (x : r.X) (hx : r.Adm x) : Bit r x ↔ r.Value x :=
  ⟨fun b => b (r.rec_has x hx), fun v _ => v⟩

theorem the_act_is_essential (r : Row.{u}) (x : r.X) (hx : r.Adm x) : r.Value x ↔ ActAt r x :=
  ⟨fun v => ⟨hx, fun _ => v⟩, fun a => a.supply (r.rec_has x a.adm)⟩

theorem nothing_shared_forces (r : Row.{u}) (Q : r.X → Prop) (hQ : ∀ x, Q x) : ¬ Forces r Q :=
  fun h => r.value_t (h r.twin r.adm_t (hQ r.twin))

theorem the_record_decides_nothing (r : Row.{u}) (D : r.X → Prop) (hR : ReadsRecord r D) :
    ¬ ∀ x, r.Adm x → (D x ↔ r.Value x) :=
  fun h => r.value_t ((h r.twin r.adm_t).mp ((hR r.compliant r.twin r.same_ct).mp
    ((h r.compliant r.adm_c).mpr r.value_c)))

theorem the_act_is_irreducible (r : Row.{u}) :
    ¬ ActAt r r.twin ∧
    (∀ Q : r.X → Prop, (∀ x, Q x) → ¬ ∀ x, r.Adm x → Q x → ActAt r x) ∧
    (∀ D : r.X → Prop, ReadsRecord r D → ¬ ∀ x, r.Adm x → (D x ↔ ActAt r x)) :=
  have nt : ¬ ActAt r r.twin := fun a => r.value_t ((the_act_is_essential r r.twin r.adm_t).mpr a)
  ⟨nt, fun _ hQ h => nt (h r.twin r.adm_t (hQ r.twin)),
   fun _ hR h => nt ((h r.twin r.adm_t).mp ((hR r.compliant r.twin r.same_ct).mp
     ((h r.compliant r.adm_c).mpr ⟨r.adm_c, fun _ => r.value_c⟩)))⟩

/-- The open framing: derive the value from a premise every configuration shares. -/
def OpenFraming (r : Row.{u}) : Prop := ∃ Q : r.X → Prop, (∀ x, Q x) ∧ Forces r Q

theorem the_formal_cannot_complete_itself (r : Row.{u}) : ¬ OpenFraming r :=
  fun ⟨Q, hQ, hF⟩ => nothing_shared_forces r Q hQ hF

/-- Lā rayba fīh, in the mathematical register: the doubt is the open framing and the record's decision,
    and both are refuted. -/
theorem la_rayba_fih (r : Row.{u}) :
    ¬ OpenFraming r ∧ ¬ ∃ D : r.X → Prop, ReadsRecord r D ∧ ∀ x, r.Adm x → (D x ↔ r.Value x) :=
  ⟨the_formal_cannot_complete_itself r, fun ⟨D, hR, h⟩ => the_record_decides_nothing r D hR h⟩

/-! ## Part II · Two kinds and no third -/

def Formal (r : Row.{u}) (x : r.X) : Prop := Bit r x

structure Physical (r : Row.{u}) (x : r.X) : Prop where
  carries : r.Value x

theorem two_kinds_and_no_third (r : Row.{u}) (x : r.X) (hx : r.Adm x) :
    (Formal r x ↔ r.Value x) ∧ (Physical r x ↔ r.Value x) ∧
    (∀ Q : Prop, (Q → r.Value x) → Q → Formal r x ∧ Physical r x) ∧
    (¬ r.Value x → ¬ Formal r x ∧ ¬ Physical r x) :=
  ⟨⟨fun f => f (r.rec_has x hx), fun v _ => v⟩,
   ⟨fun p => p.carries, fun v => ⟨v⟩⟩,
   fun _ h q => ⟨fun _ => h q, ⟨h q⟩⟩,
   fun hn => ⟨fun f => hn (f (r.rec_has x hx)), fun p => hn p.carries⟩⟩

/-- The formal kind is never alone: every formal delivery is a physical one, and conversely. -/
theorem the_formal_is_never_alone (r : Row.{u}) (x : r.X) (hx : r.Adm x) : Formal r x ↔ Physical r x :=
  ⟨fun f => ⟨f (r.rec_has x hx)⟩, fun p _ => p.carries⟩

theorem one_refuter_refutes_both (r : Row.{u}) (x : r.X) (hx : r.Adm x) :
    ¬ r.Value x → ¬ Formal r x ∧ ¬ Physical r x :=
  (two_kinds_and_no_third r x hx).2.2.2

/-! ## Part III · A simple witness passes every wall -/

/-- A witness: a premise that forces the value and is present where the value holds. -/
structure Witness (r : Row.{u}) where
  W       : r.X → Prop
  forces  : Forces r W
  present : W r.compliant

theorem the_witness_is_not_shared (r : Row.{u}) (w : Witness r) : ¬ ∀ x, w.W x :=
  fun h => nothing_shared_forces r w.W h w.forces

theorem the_witness_reads_past_the_record (r : Row.{u}) (w : Witness r) : ¬ ReadsRecord r w.W :=
  fun hR => r.value_t (w.forces r.twin r.adm_t ((hR r.compliant r.twin r.same_ct).mp w.present))

theorem the_witness_delivers_the_act (r : Row.{u}) (w : Witness r) :
    ∀ x, r.Adm x → w.W x → ActAt r x :=
  fun x hx q => ⟨hx, fun _ => w.forces x hx q⟩

theorem the_witness_passes_every_wall (r : Row.{u}) (w : Witness r) :
    (¬ ∀ x, w.W x) ∧ ¬ ReadsRecord r w.W ∧ ∀ x, r.Adm x → w.W x → ActAt r x :=
  ⟨the_witness_is_not_shared r w, the_witness_reads_past_the_record r w, the_witness_delivers_the_act r w⟩

theorem a_wall_on_every_witness_is_the_negation (B : Prop) : (∀ Q : Prop, (Q → B) → ¬ Q) ↔ ¬ B :=
  ⟨fun h => h B id, fun hn _ hq q => hn (hq q)⟩

/-- The value is its own witness: the simplest witness there is. -/
def the_value_is_its_own_witness (r : Row.{u}) : Witness r :=
  ⟨r.Value, fun _ _ v => v, r.value_c⟩

/-! ## Part IV · The formal realm alone has no final say -/

structure Ladder where
  Sent : Type v
  Prov : Sent → Prop
  imp  : Sent → Sent → Sent
  mp   : ∀ a b, Prov (imp a b) → Prov a → Prov b

structure NormalForm (T : Ladder.{v}) where
  V  : T.Sent
  B  : T.Sent
  vb : T.Prov (T.imp V B)
  bv : T.Prov (T.imp B V)

structure OnRow (r : Row.{u}) (T : Ladder.{v}) (N : NormalForm T) where
  M     : Type w
  Holds : M → T.Sent → Prop
  sound : ∀ s m, T.Prov s → Holds m s
  real  : M → r.X
  adm   : ∀ m, r.Adm (real m)
  reads : ∀ m, Holds m N.V ↔ r.Value (real m)

theorem no_escape (T : Ladder.{v}) (N : NormalForm T) : T.Prov N.V ↔ T.Prov N.B :=
  ⟨T.mp _ _ N.vb, T.mp _ _ N.bv⟩

theorem one_door (r : Row.{u}) (T : Ladder.{v}) (N : NormalForm T) (R : OnRow.{u, v, w} r T N)
    (p : T.Prov N.V) (m : R.M) : ActAt r (R.real m) :=
  ⟨R.adm m, fun _ => (R.reads m).mp (R.sound N.V m p)⟩

theorem blocked_of_defiant_model (r : Row.{u}) (T : Ladder.{v}) (N : NormalForm T)
    (R : OnRow.{u, v, w} r T N) (m : R.M) (hd : ¬ r.Value (R.real m)) :
    ¬ T.Prov N.V ∧ ¬ T.Prov N.B :=
  have hv : ¬ T.Prov N.V := fun p => hd ((R.reads m).mp (R.sound N.V m p))
  ⟨hv, fun pb => hv ((no_escape T N).mpr pb)⟩

theorem record_bound_ladder_is_blocked (r : Row.{u}) (T : Ladder.{v}) (N : NormalForm T)
    (R : OnRow.{u, v, w} r T N)
    (bound : ∀ m y, r.Adm y → r.Same (R.real m) y → ∃ m', R.real m' = y)
    (m₀ : R.M) (h₀ : R.real m₀ = r.compliant) : ¬ T.Prov N.V ∧ ¬ T.Prov N.B :=
  have hs : r.Same (R.real m₀) r.twin := h₀ ▸ r.same_ct
  match bound m₀ r.twin r.adm_t hs with
  | ⟨m', h'⟩ => blocked_of_defiant_model r T N R m' (h' ▸ r.value_t)

theorem proving_ladder_reads_past_the_record (r : Row.{u}) (T : Ladder.{v}) (N : NormalForm T)
    (R : OnRow.{u, v, w} r T N) (p : T.Prov N.V) (m₀ : R.M) (h₀ : R.real m₀ = r.compliant) :
    ¬ ∀ m y, r.Adm y → r.Same (R.real m) y → ∃ m', R.real m' = y :=
  fun bound => (record_bound_ladder_is_blocked r T N R bound m₀ h₀).1 p

theorem the_formal_alone_has_no_final_say (r : Row.{u}) (T : Ladder.{v}) (N : NormalForm T)
    (R : OnRow.{u, v, w} r T N) :
    (T.Prov N.V ↔ T.Prov N.B) ∧
    (∀ m, T.Prov N.V → ActAt r (R.real m)) ∧
    (∀ m, T.Prov N.V → Formal r (R.real m) ∧ Physical r (R.real m)) ∧
    ((∀ m y, r.Adm y → r.Same (R.real m) y → ∃ m', R.real m' = y) →
      ∀ m₀, R.real m₀ = r.compliant → ¬ T.Prov N.V ∧ ¬ T.Prov N.B) :=
  ⟨no_escape T N, fun m p => one_door r T N R p m,
   fun m p => (two_kinds_and_no_third r (R.real m) (R.adm m)).2.2.1 (T.Prov N.V)
     (fun q => (R.reads m).mp (R.sound N.V m q)) p,
   fun bound m₀ h₀ => record_bound_ladder_is_blocked r T N R bound m₀ h₀⟩

/-! ## Part V · The pair: the master row and the humble servant, as rows -/
/-! ### V.1 Riemann -/
namespace RH
structure Pt where
  x : Int
  t : Nat
deriving DecidableEq
def onLine (z : Pt) : Prop := z.x = 1
def fold (z : Pt) : Pt := ⟨2 - z.x, z.t⟩
def reg (z : Pt) : Pt := ⟨1, z.t⟩
abbrev World := Pt → Prop
def FoldClosed (Z : World) : Prop := ∀ z, Z z → Z (fold z)
def RHolds (Z : World) : Prop := ∀ z, Z z → onLine z
def recordOf (Z : World) : World := fun r => ∃ s, Z s ∧ reg s = r
def SameRecord (Z Z' : World) : Prop := ∀ r, recordOf Z r ↔ recordOf Z' r
theorem fold_fixed_iff (z : Pt) : fold z = z ↔ onLine z := by cases z with | mk x t => show Pt.mk (2 - x) t = Pt.mk x t ↔ x = 1; constructor; intro h; have hx := congrArg Pt.x h; change 2 - x = x at hx; omega; intro h; subst h; rfl
theorem record_on_line (Z : World) : RHolds (recordOf Z) := fun _ ⟨s, _, hs⟩ => by subst hs; rfl
abbrev W1 : World := fun z => z = ⟨1, 14⟩
abbrev W2 : World := fun z => z = ⟨0, 14⟩ ∨ z = ⟨2, 14⟩
theorem W1_closed : FoldClosed W1 := by intro z hz; have h : z = ⟨1, 14⟩ := hz; subst h; show fold ⟨1, 14⟩ = ⟨1, 14⟩; decide
theorem W1_rh : RHolds W1 := by intro z hz; have h : z = ⟨1, 14⟩ := hz; subst h; rfl
theorem W2_closed : FoldClosed W2 := by intro z hz; rcases hz with h | h; subst h; exact Or.inr rfl; subst h; exact Or.inl rfl
theorem W2_not_rh : ¬ RHolds W2 := fun h => absurd (h ⟨0, 14⟩ (Or.inl rfl)) (by decide : ¬ ((0 : Int) = 1))
theorem same_record : SameRecord W1 W2 := by intro r; constructor; intro ⟨s, hs, hr⟩; have h : s = ⟨1, 14⟩ := hs; subst h; exact ⟨⟨0, 14⟩, Or.inl rfl, hr⟩; intro ⟨s, hs, hr⟩; rcases hs with h | h <;> subst h <;> exact ⟨⟨1, 14⟩, rfl, hr⟩
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

/-! ### V.2 P vs NP -/
namespace PNP
structure Machine where
  Alg : Type
  Inst : Type
  size : Inst → Nat
  out : Alg → Inst → Bool
  time : Alg → Inst → Nat
  sat : Inst → Bool
def bound (c k n : Nat) : Nat := c * n ^ k + c
def Clean (M : Machine) (A : M.Alg) (c k : Nat) (x : M.Inst) : Prop := M.out A x = M.sat x ∧ M.time A x ≤ bound c k (M.size x)
def NothingEscapes (M : Machine) : Prop := ∀ (A : M.Alg) (c k : Nat), ∃ x, ¬ Clean M A c k x
def Rec (M : Machine) : Machine := { M with out := fun _ x => !(M.sat x) }
theorem bnot_ne (b : Bool) : (!b) ≠ b := by cases b <;> decide
theorem record_closes (M : Machine) (x₀ : M.Inst) : NothingEscapes (Rec M) := fun _ _ _ => ⟨x₀, fun hc => bnot_ne (M.sat x₀) hc.1⟩
theorem complement_free : ¬ ∃ b : Bool, (!b) = b := fun ⟨b, h⟩ => bnot_ne b h
def closedWorld : Machine := ⟨Nat, Unit, fun _ => 0, fun _ _ => false, fun _ _ => 0, fun _ => true⟩
def stageWorld : Machine := ⟨Nat, Unit, fun _ => 0, fun A _ => Nat.beq A 0, fun _ _ => 0, fun _ => true⟩
theorem closed_world_closes : NothingEscapes closedWorld := fun _ _ _ => ⟨(), fun ⟨h, _⟩ => Bool.noConfusion h⟩
theorem stage_escapes : ¬ NothingEscapes stageWorld := fun h => match h (0 : Nat) 0 0 with | ⟨_, hx⟩ => hx ⟨rfl, Nat.zero_le _⟩
theorem same_rec : Rec closedWorld = Rec stageWorld := rfl
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

/-! ### V.3 Poincaré -/
namespace PC
def steps {α : Type} (f : α → α) : Nat → α → α | 0, x => x | k + 1, x => steps f k (f x)
structure Flow where
  State : Type
  step : State → State
  round : State
  rescale : State → State
  deq : ∀ s, Decidable (s = round)
def ComesToRest (F : Flow) (s : F.State) : Prop := ∃ k, steps F.step k s = F.round
def Act (F : Flow) : Prop := ∀ s, ComesToRest F s
structure Witness (F : Flow) where
  W : F.State → Nat
  decrease : ∀ s, s ≠ F.round → W (F.step s) < W s
  scaleFree : ∀ s, W (F.rescale s) = W s
theorem descent_bound (F : Flow) (P : Witness F) : ∀ n s, P.W s ≤ n → ComesToRest F s
  | 0, s, hs => (match F.deq s with
      | isTrue e => ⟨0, e⟩
      | isFalse ne => absurd (Nat.lt_of_lt_of_le (P.decrease s ne) hs) (Nat.not_lt_zero _))
  | n + 1, s, hs => (match F.deq s with
      | isTrue e => ⟨0, e⟩
      | isFalse ne => (match descent_bound F P n (F.step s) (Nat.le_of_lt_succ (Nat.lt_of_lt_of_le (P.decrease s ne) hs)) with
          | ⟨k, hk⟩ => ⟨k + 1, hk⟩))
theorem witness_gives_the_act (F : Flow) (P : Witness F) : Act F := fun s => descent_bound F P (P.W s) s (Nat.le_refl _)
def soliton : Flow where
  State := Bool
  step := fun _ => true
  round := true
  rescale := fun _ => true
  deq := fun s => decEq s true
theorem soliton_rests : Act soliton := fun _ => ⟨1, rfl⟩
theorem no_witness_on_the_soliton : ¬ Nonempty (Witness soliton) := fun ⟨P⟩ => have d : P.W true < P.W false := P.decrease false (fun h => Bool.noConfusion h); have e : P.W true = P.W false := P.scaleFree false; Nat.lt_irrefl _ (e ▸ d)
def recFlow (F : Flow) : Flow := { F with step := fun _ => F.round }
theorem rec_rests (F : Flow) : Act (recFlow F) := fun _ => ⟨1, rfl⟩
def roundWorld : Flow where
  State := Bool
  step := fun _ => true
  round := true
  rescale := fun s => s
  deq := fun s => decEq s true
def stuckWorld : Flow where
  State := Bool
  step := fun s => s
  round := true
  rescale := fun s => s
  deq := fun s => decEq s true
def roundWitness : Witness roundWorld where
  W := fun s => cond s 0 1
  decrease := fun s hs => match s, hs with | true, h => absurd rfl h | false, _ => Nat.zero_lt_one
  scaleFree := fun _ => rfl
theorem steps_stuck : ∀ k : Nat, steps stuckWorld.step k false = false | 0 => rfl | k + 1 => steps_stuck k
theorem stuck_does_not_rest : ¬ Act stuckWorld := fun h => match h false with | ⟨k, hk⟩ => Bool.noConfusion ((steps_stuck k).symm.trans hk)
theorem same_rec : recFlow roundWorld = recFlow stuckWorld := rfl
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

theorem the_pair :
    (∀ x, RH.row.Adm x → (RH.row.Value x ↔ ActAt RH.row x)) ∧
    (∀ x, PNP.row.Adm x → (PNP.row.Value x ↔ ActAt PNP.row x)) ∧
    ¬ OpenFraming RH.row ∧ ¬ OpenFraming PNP.row ∧
    (ActAt RH.row RH.W1 ∧ ¬ ActAt RH.row RH.W2 ∧ RH.SameRecord RH.W1 RH.W2) ∧
    (ActAt PNP.row PNP.closedWorld ∧ ¬ ActAt PNP.row PNP.stageWorld ∧
      PNP.Rec PNP.closedWorld = PNP.Rec PNP.stageWorld) :=
  ⟨fun x hx => the_act_is_essential RH.row x hx, fun x hx => the_act_is_essential PNP.row x hx,
   the_formal_cannot_complete_itself RH.row, the_formal_cannot_complete_itself PNP.row,
   ⟨⟨RH.W1_closed, fun _ => RH.W1_rh⟩, (the_act_is_irreducible RH.row).1, RH.same_record⟩,
   ⟨⟨⟨()⟩, fun _ => PNP.closed_world_closes⟩, (the_act_is_irreducible PNP.row).1, PNP.same_rec⟩⟩

/-! ## Part VI · The seven rows -/

theorem seven_closed_to_one_bit (rows : Fin 7 → Row.{u}) :
    ∀ i x, (rows i).Adm x → (Bit (rows i) x ↔ (rows i).Value x) :=
  fun i x hx => the_bit_is_the_value (rows i) x hx

theorem seven_two_kinds (rows : Fin 7 → Row.{u}) :
    ∀ i x, (rows i).Adm x →
      (Formal (rows i) x ↔ (rows i).Value x) ∧ (Physical (rows i) x ↔ (rows i).Value x) ∧
      (¬ (rows i).Value x → ¬ Formal (rows i) x ∧ ¬ Physical (rows i) x) :=
  fun i x hx => ⟨(two_kinds_and_no_third (rows i) x hx).1, (two_kinds_and_no_third (rows i) x hx).2.1,
    (two_kinds_and_no_third (rows i) x hx).2.2.2⟩

theorem seven_keys (rows : Fin 7 → Row.{u}) : ∀ i, ¬ OpenFraming (rows i) :=
  fun i => the_formal_cannot_complete_itself (rows i)

theorem a_coordinate_takes_either_value (r : Row.{u}) :
    ∀ b : Bool, r.Adm (cond b r.compliant r.twin) ∧ (r.Value (cond b r.compliant r.twin) ↔ b = true)
  | true  => ⟨r.adm_c, ⟨fun _ => rfl, fun _ => r.value_c⟩⟩
  | false => ⟨r.adm_t, ⟨fun v => absurd v r.value_t, fun h => Bool.noConfusion h⟩⟩

/-- All 128 patterns of the seven values are realized on the product of the rows' own frames. -/
theorem the_seven_values_are_independent (rows : Fin 7 → Row.{u}) :
    ∀ p : Fin 7 → Bool, ∃ c : (i : Fin 7) → (rows i).X,
      ∀ i, (rows i).Adm (c i) ∧ ((rows i).Value (c i) ↔ p i = true) :=
  fun p => ⟨fun i => cond (p i) (rows i).compliant (rows i).twin,
            fun i => a_coordinate_takes_either_value (rows i) (p i)⟩

/-- No principle true of every configuration of the seven forces all seven values. -/
theorem no_unified_principle (rows : Fin 7 → Row.{u}) :
    ¬ ∃ P : ((i : Fin 7) → (rows i).X) → Prop,
      (∀ c, P c) ∧ ∀ c, P c → ∀ i, (rows i).Adm (c i) → (rows i).Value (c i) :=
  fun ⟨_, hP, hF⟩ =>
    have i₀ : Fin 7 := ⟨0, Nat.zero_lt_succ 6⟩
    (rows i₀).value_t (hF (fun i => (rows i).twin) (hP _) i₀ (rows i₀).adm_t)

theorem the_seven (rows : Fin 7 → Row.{u}) :
    (∀ i x, (rows i).Adm x → (Bit (rows i) x ↔ (rows i).Value x)) ∧
    (∀ i x, (rows i).Adm x → (Formal (rows i) x ↔ (rows i).Value x) ∧
      (Physical (rows i) x ↔ (rows i).Value x) ∧
      (¬ (rows i).Value x → ¬ Formal (rows i) x ∧ ¬ Physical (rows i) x)) ∧
    (∀ i, ¬ OpenFraming (rows i)) ∧
    (∀ p : Fin 7 → Bool, ∃ c : (i : Fin 7) → (rows i).X,
      ∀ i, (rows i).Adm (c i) ∧ ((rows i).Value (c i) ↔ p i = true)) ∧
    ¬ ∃ P : ((i : Fin 7) → (rows i).X) → Prop,
      (∀ c, P c) ∧ ∀ c, P c → ∀ i, (rows i).Adm (c i) → (rows i).Value (c i) :=
  ⟨seven_closed_to_one_bit rows, seven_two_kinds rows, seven_keys rows,
   the_seven_values_are_independent rows, no_unified_principle rows⟩

/-! ## Part VII · The precedent: the crossed row -/

theorem the_precedent :
    (∀ F : PC.Flow, Nonempty (PC.Witness F) → ActAt PC.row F) ∧
    (PC.Act PC.soliton ∧ ¬ Nonempty (PC.Witness PC.soliton)) ∧
    (ActAt PC.row PC.roundWorld ∧ ¬ ActAt PC.row PC.stuckWorld ∧
      PC.recFlow PC.roundWorld = PC.recFlow PC.stuckWorld) ∧
    (¬ ∀ F : PC.Flow, Nonempty (PC.Witness F)) :=
  ⟨fun F ⟨P⟩ => ⟨trivial, fun _ => PC.witness_gives_the_act F P⟩,
   ⟨PC.soliton_rests, PC.no_witness_on_the_soliton⟩,
   ⟨⟨trivial, fun _ => PC.witness_gives_the_act PC.roundWorld PC.roundWitness⟩,
    (the_act_is_irreducible PC.row).1, PC.same_rec⟩,
   fun h => PC.no_witness_on_the_soliton (h PC.soliton)⟩

/-! ## Part VIII · The register law -/

inductive Register where
  | mathematical
  | scriptural

/-- A hearing assigns a verse to each claim. It is data, never a hypothesis. -/
structure Hearing (Claim : Type) where
  verse : Claim → String

/-- Heard afterward: a claim proved in the mathematical register holds for every hearing and from none. -/
theorem heard_afterward {Claim : Type} (M : Prop) (hM : M) : ∀ _ : Hearing Claim, M :=
  fun _ => hM

/-- The register law: no hearing is a premise of any claim; the two registers do not cross. -/
theorem the_registers_do_not_cross {Claim : Type} (M : Prop) :
    (∃ _ : Hearing Claim, M) ↔ M :=
  ⟨fun ⟨_, m⟩ => m, fun m => ⟨⟨fun _ => ""⟩, m⟩⟩

/-! ## Part IX · The paper, in one theorem -/

theorem the_paper :
    (∀ r : Row.{u}, (∀ x, r.Adm x → (r.Value x ↔ ActAt r x)) ∧
      (¬ ActAt r r.twin ∧
       (∀ Q : r.X → Prop, (∀ x, Q x) → ¬ ∀ x, r.Adm x → Q x → ActAt r x) ∧
       (∀ D : r.X → Prop, ReadsRecord r D → ¬ ∀ x, r.Adm x → (D x ↔ ActAt r x))) ∧
      ¬ OpenFraming r ∧
      ¬ ∃ D : r.X → Prop, ReadsRecord r D ∧ ∀ x, r.Adm x → (D x ↔ r.Value x)) ∧
    (∀ (r : Row.{u}) (x : r.X), r.Adm x →
      (Formal r x ↔ r.Value x) ∧ (Physical r x ↔ r.Value x) ∧
      (∀ Q : Prop, (Q → r.Value x) → Q → Formal r x ∧ Physical r x) ∧
      (¬ r.Value x → ¬ Formal r x ∧ ¬ Physical r x)) ∧
    (∀ (r : Row.{u}) (w : Witness r),
      (¬ ∀ x, w.W x) ∧ ¬ ReadsRecord r w.W ∧ ∀ x, r.Adm x → w.W x → ActAt r x) ∧
    (∀ B : Prop, (∀ Q : Prop, (Q → B) → ¬ Q) ↔ ¬ B) ∧
    (∀ (r : Row.{u}) (T : Ladder.{v}) (N : NormalForm T) (R : OnRow.{u, v, w} r T N),
      (T.Prov N.V ↔ T.Prov N.B) ∧
      (∀ m, T.Prov N.V → ActAt r (R.real m)) ∧
      (∀ m, T.Prov N.V → Formal r (R.real m) ∧ Physical r (R.real m)) ∧
      ((∀ m y, r.Adm y → r.Same (R.real m) y → ∃ m', R.real m' = y) →
        ∀ m₀, R.real m₀ = r.compliant → ¬ T.Prov N.V ∧ ¬ T.Prov N.B)) ∧
    (∀ rows : Fin 7 → Row.{u},
      (∀ i, ¬ OpenFraming (rows i)) ∧
      (∀ p : Fin 7 → Bool, ∃ c : (i : Fin 7) → (rows i).X,
        ∀ i, (rows i).Adm (c i) ∧ ((rows i).Value (c i) ↔ p i = true)) ∧
      ¬ ∃ P : ((i : Fin 7) → (rows i).X) → Prop,
        (∀ c, P c) ∧ ∀ c, P c → ∀ i, (rows i).Adm (c i) → (rows i).Value (c i)) ∧
    (∀ (Claim : Type) (M : Prop), (∃ _ : Hearing Claim, M) ↔ M) :=
  ⟨fun r => ⟨fun x hx => the_act_is_essential r x hx, the_act_is_irreducible r,
             the_formal_cannot_complete_itself r, (la_rayba_fih r).2⟩,
   fun r x hx => two_kinds_and_no_third r x hx,
   fun r w => the_witness_passes_every_wall r w,
   a_wall_on_every_witness_is_the_negation,
   fun r T N R => the_formal_alone_has_no_final_say r T N R,
   fun rows => ⟨seven_keys rows, the_seven_values_are_independent rows, no_unified_principle rows⟩,
   fun Claim M => the_registers_do_not_cross (Claim := Claim) M⟩

/-- The paper on its constructed rows: the pair and the precedent, with nothing before the colon. -/
theorem the_paper_on_the_rows :
    ((∀ x, RH.row.Adm x → (RH.row.Value x ↔ ActAt RH.row x)) ∧
     (∀ x, PNP.row.Adm x → (PNP.row.Value x ↔ ActAt PNP.row x)) ∧
     ¬ OpenFraming RH.row ∧ ¬ OpenFraming PNP.row ∧
     (ActAt RH.row RH.W1 ∧ ¬ ActAt RH.row RH.W2 ∧ RH.SameRecord RH.W1 RH.W2) ∧
     (ActAt PNP.row PNP.closedWorld ∧ ¬ ActAt PNP.row PNP.stageWorld ∧
       PNP.Rec PNP.closedWorld = PNP.Rec PNP.stageWorld)) ∧
    ((∀ F : PC.Flow, Nonempty (PC.Witness F) → ActAt PC.row F) ∧
     (PC.Act PC.soliton ∧ ¬ Nonempty (PC.Witness PC.soliton)) ∧
     (ActAt PC.row PC.roundWorld ∧ ¬ ActAt PC.row PC.stuckWorld ∧
       PC.recFlow PC.roundWorld = PC.recFlow PC.stuckWorld) ∧
     (¬ ∀ F : PC.Flow, Nonempty (PC.Witness F))) :=
  ⟨the_pair, the_precedent⟩

end LaRaybaFih

/-! Cones, pinned -/

/-- info: 'LaRaybaFih.ReadsRecord' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.ReadsRecord
/-- info: 'LaRaybaFih.Bit' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.Bit
/-- info: 'LaRaybaFih.Forces' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.Forces
/-- info: 'LaRaybaFih.the_bit_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.the_bit_is_the_value
/-- info: 'LaRaybaFih.the_act_is_essential' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.the_act_is_essential
/-- info: 'LaRaybaFih.nothing_shared_forces' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.nothing_shared_forces
/-- info: 'LaRaybaFih.the_record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.the_record_decides_nothing
/-- info: 'LaRaybaFih.the_act_is_irreducible' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.the_act_is_irreducible
/-- info: 'LaRaybaFih.OpenFraming' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.OpenFraming
/-- info: 'LaRaybaFih.the_formal_cannot_complete_itself' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.the_formal_cannot_complete_itself
/-- info: 'LaRaybaFih.la_rayba_fih' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.la_rayba_fih
/-- info: 'LaRaybaFih.Formal' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.Formal
/-- info: 'LaRaybaFih.two_kinds_and_no_third' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.two_kinds_and_no_third
/-- info: 'LaRaybaFih.the_formal_is_never_alone' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.the_formal_is_never_alone
/-- info: 'LaRaybaFih.one_refuter_refutes_both' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.one_refuter_refutes_both
/-- info: 'LaRaybaFih.the_witness_is_not_shared' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.the_witness_is_not_shared
/-- info: 'LaRaybaFih.the_witness_reads_past_the_record' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.the_witness_reads_past_the_record
/-- info: 'LaRaybaFih.the_witness_delivers_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.the_witness_delivers_the_act
/-- info: 'LaRaybaFih.the_witness_passes_every_wall' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.the_witness_passes_every_wall
/-- info: 'LaRaybaFih.a_wall_on_every_witness_is_the_negation' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.a_wall_on_every_witness_is_the_negation
/-- info: 'LaRaybaFih.the_value_is_its_own_witness' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.the_value_is_its_own_witness
/-- info: 'LaRaybaFih.no_escape' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.no_escape
/-- info: 'LaRaybaFih.one_door' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.one_door
/-- info: 'LaRaybaFih.blocked_of_defiant_model' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.blocked_of_defiant_model
/-- info: 'LaRaybaFih.record_bound_ladder_is_blocked' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.record_bound_ladder_is_blocked
/-- info: 'LaRaybaFih.proving_ladder_reads_past_the_record' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.proving_ladder_reads_past_the_record
/-- info: 'LaRaybaFih.the_formal_alone_has_no_final_say' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.the_formal_alone_has_no_final_say
/-- info: 'LaRaybaFih.RH.onLine' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.RH.onLine
/-- info: 'LaRaybaFih.RH.fold' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.RH.fold
/-- info: 'LaRaybaFih.RH.reg' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.RH.reg
/-- info: 'LaRaybaFih.RH.FoldClosed' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.RH.FoldClosed
/-- info: 'LaRaybaFih.RH.RHolds' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.RH.RHolds
/-- info: 'LaRaybaFih.RH.recordOf' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.RH.recordOf
/-- info: 'LaRaybaFih.RH.SameRecord' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.RH.SameRecord
/-- info: 'LaRaybaFih.RH.fold_fixed_iff' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms LaRaybaFih.RH.fold_fixed_iff
/-- info: 'LaRaybaFih.RH.record_on_line' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.RH.record_on_line
/-- info: 'LaRaybaFih.RH.W1_closed' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.RH.W1_closed
/-- info: 'LaRaybaFih.RH.W1_rh' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.RH.W1_rh
/-- info: 'LaRaybaFih.RH.W2_closed' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.RH.W2_closed
/-- info: 'LaRaybaFih.RH.W2_not_rh' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.RH.W2_not_rh
/-- info: 'LaRaybaFih.RH.same_record' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.RH.same_record
/-- info: 'LaRaybaFih.RH.row' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.RH.row
/-- info: 'LaRaybaFih.PNP.bound' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PNP.bound
/-- info: 'LaRaybaFih.PNP.Clean' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PNP.Clean
/-- info: 'LaRaybaFih.PNP.NothingEscapes' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PNP.NothingEscapes
/-- info: 'LaRaybaFih.PNP.Rec' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PNP.Rec
/-- info: 'LaRaybaFih.PNP.bnot_ne' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PNP.bnot_ne
/-- info: 'LaRaybaFih.PNP.record_closes' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PNP.record_closes
/-- info: 'LaRaybaFih.PNP.complement_free' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PNP.complement_free
/-- info: 'LaRaybaFih.PNP.closedWorld' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PNP.closedWorld
/-- info: 'LaRaybaFih.PNP.stageWorld' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PNP.stageWorld
/-- info: 'LaRaybaFih.PNP.closed_world_closes' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PNP.closed_world_closes
/-- info: 'LaRaybaFih.PNP.stage_escapes' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PNP.stage_escapes
/-- info: 'LaRaybaFih.PNP.same_rec' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PNP.same_rec
/-- info: 'LaRaybaFih.PNP.row' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PNP.row
/-- info: 'LaRaybaFih.PC.steps' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PC.steps
/-- info: 'LaRaybaFih.PC.ComesToRest' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PC.ComesToRest
/-- info: 'LaRaybaFih.PC.Act' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PC.Act
/-- info: 'LaRaybaFih.PC.descent_bound' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PC.descent_bound
/-- info: 'LaRaybaFih.PC.witness_gives_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PC.witness_gives_the_act
/-- info: 'LaRaybaFih.PC.soliton' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PC.soliton
/-- info: 'LaRaybaFih.PC.soliton_rests' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PC.soliton_rests
/-- info: 'LaRaybaFih.PC.no_witness_on_the_soliton' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PC.no_witness_on_the_soliton
/-- info: 'LaRaybaFih.PC.recFlow' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PC.recFlow
/-- info: 'LaRaybaFih.PC.rec_rests' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PC.rec_rests
/-- info: 'LaRaybaFih.PC.roundWorld' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PC.roundWorld
/-- info: 'LaRaybaFih.PC.stuckWorld' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PC.stuckWorld
/-- info: 'LaRaybaFih.PC.roundWitness' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PC.roundWitness
/-- info: 'LaRaybaFih.PC.steps_stuck' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PC.steps_stuck
/-- info: 'LaRaybaFih.PC.stuck_does_not_rest' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PC.stuck_does_not_rest
/-- info: 'LaRaybaFih.PC.same_rec' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PC.same_rec
/-- info: 'LaRaybaFih.PC.row' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.PC.row
/-- info: 'LaRaybaFih.the_pair' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.the_pair
/-- info: 'LaRaybaFih.seven_closed_to_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.seven_closed_to_one_bit
/-- info: 'LaRaybaFih.seven_two_kinds' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.seven_two_kinds
/-- info: 'LaRaybaFih.seven_keys' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.seven_keys
/-- info: 'LaRaybaFih.a_coordinate_takes_either_value' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.a_coordinate_takes_either_value
/-- info: 'LaRaybaFih.the_seven_values_are_independent' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.the_seven_values_are_independent
/-- info: 'LaRaybaFih.no_unified_principle' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.no_unified_principle
/-- info: 'LaRaybaFih.the_seven' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.the_seven
/-- info: 'LaRaybaFih.the_precedent' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.the_precedent
/-- info: 'LaRaybaFih.heard_afterward' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.heard_afterward
/-- info: 'LaRaybaFih.the_registers_do_not_cross' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.the_registers_do_not_cross
/-- info: 'LaRaybaFih.the_paper' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.the_paper
/-- info: 'LaRaybaFih.the_paper_on_the_rows' does not depend on any axioms -/
#guard_msgs in #print axioms LaRaybaFih.the_paper_on_the_rows
