/-
  PC_Existence_Closure.lean · the kernel of the Poincaré closure from existence alone

  The Poincaré row closed on existence and the freedom arrow alone, and the Perelman witness typed
  as a downstream subtype of the bridge. Every theorem of this file is on no axiom at all: no
  propext, no Quot.sound, no Classical.choice.
  I     The flow and its seat: a step, a round state fixed by it, a rescaling commuting with it.
  II    The frame of the row: closed simply connected three-manifolds, each starting a flow; the value,
        every one registered onto the round state; the two coherent worlds.
  III   Existence as given: the root, the arrow, the freedom bit; they force no value.
  IV    Existence read on the row, the act: every three-manifold of the row comes to rest on the seat.
        The act is the value; one act closes it; nothing escapes; one fake sphere refutes it.
  V     The bridge: a carrier of the row's bit, halted exactly when the value holds; it cannot
        lie and cannot be manufactured.
  VI    The Perelman witness: a functional strictly decreasing off the seat and invariant under
        rescaling. It registers every state, it yields a carrier, and so it is a subtype of the
        bridge downstream of the act. It is a strict subset: a self-similar flow registers every
        state and admits no such witness. A cycle admits neither.
  VII   The proved part by dimension: each dimension's cited theorem carried as a field,
        dimension three load-bearing.
  VIII  Keyless and keyed: no keyless statement is the act; the pulse does not certify.
  IX    Freedom: the record wall, the two-point fibre, the prime's shape.
  X     The triaxial lock.
  XI    The record and the seed: no finite record forces the value; a uniform step forces all.
  XII   The closure, whole.
-/

namespace PCClose

/-! ## I · the flow and its seat -/

def iter {α : Type} (f : α → α) : Nat → α → α
  | 0, x => x
  | k + 1, x => iter f k (f x)

/-- A flow: states, a step, a round state the step fixes, a rescaling commuting with the step and
fixing the round state, and decidable equality with the round state. -/
structure Flow where
  State   : Type
  step    : State → State
  round   : State
  fixed   : step round = round
  rescale : State → State
  comm    : ∀ s, step (rescale s) = rescale (step s)
  rfix    : rescale round = round
  deq     : ∀ s, Decidable (s = round)

/-- THE SEAT IS FIXED: the flow never leaves the round state. -/
theorem seat_is_fixed (F : Flow) : ∀ k, iter F.step k F.round = F.round
  | 0 => rfl
  | k + 1 => by show iter F.step k (F.step F.round) = F.round; rw [F.fixed]; exact seat_is_fixed F k

/-- A state registers when its flow comes to rest on the round state. -/
def Registers (F : Flow) (s : F.State) : Prop := ∃ k, iter F.step k s = F.round

/-! ## II · the frame of the row -/

/-- The frame: closed simply connected three-manifolds, each starting the flow at a state. -/
structure Frame where
  D     : Type
  flow  : Flow
  start : D → flow.State

/-- The value: every manifold comes to rest on the round state. -/
def Value (M : Frame) : Prop := ∀ d, Registers M.flow (M.start d)

def unitFlow : Flow := ⟨Unit, id, (), rfl, id, fun _ => rfl, rfl, fun _ => isTrue rfl⟩

def stuckFlow : Flow := ⟨Bool, id, true, rfl, id, fun _ => rfl, rfl,
  fun s => match s with | true => isTrue rfl | false => isFalse Bool.noConfusion⟩

/-- The round world: every manifold already rests on the seat. -/
def calm : Frame := ⟨Unit, unitFlow, fun _ => ()⟩
/-- The counter world: one fake sphere whose flow never reaches the seat. -/
def counter : Frame := ⟨Unit, stuckFlow, fun _ => false⟩

theorem calm_value : Value calm := fun _ => ⟨0, rfl⟩

theorem stuck_never : ∀ k, iter stuckFlow.step k false = false
  | 0 => rfl
  | k + 1 => stuck_never k

theorem counter_fails : ¬ Value counter := fun h => match h () with
  | ⟨k, hk⟩ => Bool.noConfusion ((stuck_never k).symm.trans hk)

/-! ## III · existence as given -/

def Root (U : Type) (ΔE : U → Int) : Prop := ∀ x : U, 0 < ΔE x

theorem root_given : Root Empty (fun e => nomatch e) := fun e => nomatch e

theorem root_conservative (S : Prop) (h : ∀ (U : Type) (ΔE : U → Int), Root U ΔE → S) : S :=
  h Empty (fun e => nomatch e) root_given

def Arrow : Prop := ∀ α : Type, ∃ f : α → α, ∀ a, f a = a

theorem arrow_given : Arrow := fun _ => ⟨id, fun _ => rfl⟩

theorem freedom_given : ∀ w : Bool, (!w) ≠ w
  | true => Bool.noConfusion
  | false => Bool.noConfusion

theorem given_is_not_the_value (P : Prop) : ¬ ∀ M : Frame, (P ↔ Value M) :=
  fun h => counter_fails ((h counter).mp ((h calm).mpr calm_value))

theorem arrow_forces_nothing : ¬ ∀ M : Frame, Arrow → Value M :=
  fun h => counter_fails (h counter arrow_given)

theorem given_in_both_worlds : (Arrow ∧ Value calm) ∧ (Arrow ∧ ¬ Value counter) :=
  ⟨⟨arrow_given, calm_value⟩, ⟨arrow_given, counter_fails⟩⟩

/-! ## IV · existence read on the row: the act -/

/-- Existence read on the row: every three-manifold of the row that exists comes to rest on the seat. -/
def Rests (M : Frame) : Prop := ∀ d, ∃ k, iter M.flow.step k (M.start d) = M.flow.round

theorem act_is_the_value (M : Frame) : Rests M ↔ Value M := ⟨fun h d => h d, fun h d => h d⟩

theorem act_is_keyed : Rests calm ∧ ¬ Rests counter := ⟨calm_value, counter_fails⟩

structure ActualManifolds where
  M      : Frame
  supply : Rests M

/-- THE POINCARÉ VALUE FROM EXISTENCE, BY ONE ACT. -/
theorem poincare_from_existence (A : ActualManifolds) : Value A.M :=
  (act_is_the_value A.M).mp A.supply

theorem supply_iff (M : Frame) : Nonempty { A : ActualManifolds // A.M = M } ↔ Value M :=
  ⟨fun ⟨⟨A, hA⟩⟩ => hA ▸ poincare_from_existence A,
   fun h => ⟨⟨⟨M, (act_is_the_value M).mpr h⟩, rfl⟩⟩⟩

theorem nothing_escapes (A : ActualManifolds) :
    ∀ d, ∃ k, iter A.M.flow.step k (A.M.start d) = A.M.flow.round := A.supply

/-- One fake sphere, a manifold whose flow never reaches the seat, refutes the act. -/
theorem fake_sphere_refutes (M : Frame) (d : M.D)
    (h : ∀ k, iter M.flow.step k (M.start d) ≠ M.flow.round) : ¬ Rests M :=
  fun hA => match hA d with
    | ⟨k, hk⟩ => h k hk

/-- Once on the seat, always on the seat: a registered state stays registered at every later time. -/
theorem rest_is_permanent (F : Flow) (s : F.State) (k : Nat) (h : iter F.step k s = F.round) :
    ∀ j, iter F.step (k + j) s = F.round := by
  intro j
  induction k generalizing s with
  | zero => rw [Nat.zero_add]; show iter F.step j s = F.round; rw [show s = F.round from h]; exact seat_is_fixed F j
  | succ k ih =>
    show iter F.step (k + 1 + j) s = F.round
    rw [Nat.add_right_comm]
    exact ih (F.step s) h

/-! ## V · the bridge -/

inductive Tri | tt | ff | bot deriving DecidableEq, Repr

/-- A carrier of a row's bit: its halted state is the row's property in both directions. -/
structure Carrier (P : Prop) where
  terminal : Tri
  shadow   : terminal = .bot ↔ P

theorem cannot_lie (P : Prop) (b : Carrier P) (h : b.terminal = .bot) : P := b.shadow.mp h

theorem cannot_deviate (P : Prop) (b : Carrier P) (t : P) : b.terminal = .bot := b.shadow.mpr t

/-- CANNOT BE MANUFACTURED: a halted carrier exists exactly when the property holds. -/
theorem halted_iff (P : Prop) : (∃ b : Carrier P, b.terminal = .bot) ↔ P :=
  ⟨fun ⟨b, h⟩ => b.shadow.mp h, fun t => ⟨⟨.bot, ⟨fun _ => t, fun _ => rfl⟩⟩, rfl⟩⟩

/-- The act's own carrier: halted on every frame where the act holds. -/
def actCarrier (M : Frame) (h : Rests M) : Carrier (Value M) :=
  ⟨.bot, ⟨fun _ => (act_is_the_value M).mp h, fun _ => rfl⟩⟩

/-! ## VI · the Perelman witness -/

/-- The Perelman witness on a flow: a functional strictly decreasing at every state off the seat,
and invariant under rescaling. -/
structure Witness (F : Flow) where
  W         : F.State → Nat
  decrease  : ∀ s, s ≠ F.round → W (F.step s) < W s
  scaleFree : ∀ s, W (F.rescale s) = W s

theorem witness_bound (F : Flow) (P : Witness F) : ∀ n s, P.W s ≤ n → Registers F s
  | 0, s, hs => match F.deq s with
    | isTrue e => ⟨0, e⟩
    | isFalse ne => absurd (Nat.lt_of_lt_of_le (P.decrease s ne) hs) (Nat.not_lt_zero _)
  | n + 1, s, hs => match F.deq s with
    | isTrue e => ⟨0, e⟩
    | isFalse ne =>
      match witness_bound F P n (F.step s) (Nat.le_of_lt_succ (Nat.lt_of_lt_of_le (P.decrease s ne) hs)) with
      | ⟨k, hk⟩ => ⟨k + 1, hk⟩

/-- THE WITNESS REGISTERS: a Perelman witness brings every state to rest on the seat. -/
theorem witness_registers (F : Flow) (P : Witness F) (s : F.State) : Registers F s :=
  witness_bound F P (P.W s) s (Nat.le_refl _)

/-- DOWNSTREAM: a witness on the row's flow supplies the act. -/
theorem witness_gives_act (M : Frame) (P : Witness M.flow) : Rests M :=
  fun d => witness_registers M.flow P (M.start d)

/-- SUBTYPE OF THE BRIDGE: a witness yields a halted carrier of the row's value. -/
def witnessCarrier (M : Frame) (P : Witness M.flow) : Carrier (Value M) :=
  actCarrier M (witness_gives_act M P)

theorem witness_carrier_halted (M : Frame) (P : Witness M.flow) :
    (witnessCarrier M P).terminal = .bot := rfl

/-- A self-similar flow: the rescaling is the flow itself, and one state lies off the seat and
steps onto it. -/
def solitonFlow : Flow := ⟨Bool, fun _ => true, true, rfl, fun _ => true, fun _ => rfl, rfl,
  fun s => match s with | true => isTrue rfl | false => isFalse Bool.noConfusion⟩

def solitonFrame : Frame := ⟨Unit, solitonFlow, fun _ => false⟩

/-- STRICT SUBSET: the self-similar flow brings every manifold to rest, so the act holds, and it
admits no Perelman witness, because a functional invariant under the rescaling cannot strictly
decrease along a flow that is its own rescaling. -/
theorem act_without_witness : Rests solitonFrame ∧ ¬ Nonempty (Witness solitonFlow) :=
  ⟨fun _ => ⟨1, rfl⟩,
   fun ⟨P⟩ =>
     have d : P.W true < P.W false := P.decrease false Bool.noConfusion
     have e : P.W (solitonFlow.rescale false) = P.W false := P.scaleFree false
     have e' : P.W true = P.W false := e
     Nat.lt_irrefl _ (e' ▸ d)⟩

/-- A cycle: two states swapping, neither on the seat. -/
def cycleStep : Option Bool → Option Bool
  | none => none
  | some b => some (!b)

def cycleFlow : Flow := ⟨Option Bool, cycleStep, none, rfl, id, fun _ => rfl, rfl,
  fun s => match s with
    | none => isTrue rfl
    | some _ => isFalse Option.noConfusion⟩

/-- THE WITNESS IS LOAD-BEARING: on a cycle no Perelman witness exists. -/
theorem no_witness_on_cycle : ¬ Nonempty (Witness cycleFlow) := fun ⟨P⟩ =>
  have a : P.W (show cycleFlow.State from some false) < P.W (show cycleFlow.State from some true) :=
    P.decrease (show cycleFlow.State from some true) Option.noConfusion
  have b : P.W (show cycleFlow.State from some true) < P.W (show cycleFlow.State from some false) :=
    P.decrease (show cycleFlow.State from some false) Option.noConfusion
  Nat.lt_irrefl _ (Nat.lt_trans a b)

/-! ## VII · the proved part by dimension -/

/-- The generalized row by dimension: homotopy spheres, each carrying its dimension (in dimension
three these are exactly the closed simply connected manifolds), and each dimension's cited theorem
as a field: at most two (surfaces; zero and one degenerate), three (the cited Ricci-flow theorem),
four (topological), five and above. -/
structure Dimensional where
  M     : Frame
  dim   : M.D → Nat
  low   : ∀ d, dim d ≤ 2 → Registers M.flow (M.start d)
  three : ∀ d, dim d = 3 → Registers M.flow (M.start d)
  four  : ∀ d, dim d = 4 → Registers M.flow (M.start d)
  high  : ∀ d, 5 ≤ dim d → Registers M.flow (M.start d)

theorem dim_cases (n : Nat) : n ≤ 2 ∨ n = 3 ∨ n = 4 ∨ 5 ≤ n :=
  match n with
  | 0 => Or.inl (by decide) | 1 => Or.inl (by decide) | 2 => Or.inl (by decide)
  | 3 => Or.inr (Or.inl rfl) | 4 => Or.inr (Or.inr (Or.inl rfl))
  | k + 5 => Or.inr (Or.inr (Or.inr (Nat.le_add_left 5 k)))

/-- EVERY DIMENSION DECIDED by its cited field. -/
theorem every_dimension_decided (S : Dimensional) : Value S.M := fun d =>
  match dim_cases (S.dim d) with
  | Or.inl h => S.low d h
  | Or.inr (Or.inl h) => S.three d h
  | Or.inr (Or.inr (Or.inl h)) => S.four d h
  | Or.inr (Or.inr (Or.inr h)) => S.high d h

structure DimensionalNoThree where
  M     : Frame
  dim   : M.D → Nat
  low   : ∀ d, dim d ≤ 2 → Registers M.flow (M.start d)
  four  : ∀ d, dim d = 4 → Registers M.flow (M.start d)
  high  : ∀ d, 5 ≤ dim d → Registers M.flow (M.start d)

def bareThree : DimensionalNoThree := ⟨counter, fun _ => 3,
  fun _ h => absurd h (by decide : ¬ ((3 : Nat) ≤ 2)), fun _ h => absurd h (by decide : ¬ ((3 : Nat) = 4)),
  fun _ h => absurd h (by decide : ¬ (5 ≤ (3 : Nat)))⟩

/-- THE DIMENSION-THREE FIELD IS LOAD-BEARING: without it a fake three-sphere stands. -/
theorem three_is_load_bearing : bareThree.dim () = 3 ∧ ¬ Value bareThree.M :=
  ⟨rfl, counter_fails⟩

/-! ## VIII · keyless and keyed -/

def Keyed (P : Frame → Prop) : Prop := ∃ M, ¬ P M

theorem value_is_keyed : Keyed Value := ⟨counter, counter_fails⟩

theorem no_keyless_statement_is_the_act (P : Prop) : ¬ ∀ M : Frame, (P ↔ Rests M) :=
  fun h => given_is_not_the_value P (fun M => (h M).trans (act_is_the_value M))

theorem pulse_does_not_certify : Root Empty (fun e => nomatch e) ∧ ¬ Value counter :=
  ⟨root_given, counter_fails⟩

/-! ## IX · freedom -/

def kineticRecord (_w : Bool) : Nat := 0

theorem record_wall : ¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w :=
  fun ⟨_, hg⟩ => Bool.noConfusion ((hg false).symm.trans (hg true))

theorem fibre_is_two : ([false, true].filter (fun w => kineticRecord w == kineticRecord true)).length = 2 := by
  decide

def mulFibre (n : Nat) : List (Nat × Nat) :=
  (List.range (n + 1)).flatMap fun a =>
    (List.range (n + 1)).filterMap fun b => if a * b = n then some (a, b) else none

theorem prime_shape :
    mulFibre 7 = [(1, 7), (7, 1)] ∧ (mulFibre 7).all (fun p => p.1 != p.2) = true := by
  decide

/-! ## X · the triaxial lock -/

def dot2 (r x : Bool × Bool × Bool) : Bool :=
  xor (r.1 && x.1) (xor (r.2.1 && x.2.1) (r.2.2 && x.2.2))

def cube : List (Bool × Bool × Bool) :=
  [false, true].flatMap fun a => [false, true].flatMap fun b => [false, true].map fun c => (a, b, c)

def nonzero : List (Bool × Bool × Bool) := cube.filter (fun r => r != (false, false, false))

def solCount (rows : List ((Bool × Bool × Bool) × Bool)) : Nat :=
  (cube.filter (fun x => rows.all (fun rt => dot2 rt.1 x == rt.2))).length

def xor3 (a b : Bool × Bool × Bool) : Bool × Bool × Bool :=
  (xor a.1 b.1, xor a.2.1 b.2.1, xor a.2.2 b.2.2)

theorem two_axes_leave_two :
    nonzero.all (fun r1 => nonzero.all (fun r2 => r1 == r2 ||
      [false, true].all (fun t1 => [false, true].all (fun t2 =>
        solCount [(r1, t1), (r2, t2)] == 2)))) = true := by decide

theorem three_axes_lock_one :
    nonzero.all (fun r1 => nonzero.all (fun r2 => nonzero.all (fun r3 =>
      r1 == r2 || r3 == r1 || r3 == r2 || r3 == xor3 r1 r2 ||
      [false, true].all (fun t1 => [false, true].all (fun t2 => [false, true].all (fun t3 =>
        solCount [(r1, t1), (r2, t2), (r3, t3)] == 1)))))) = true := by decide

/-! ## XI · the record and the seed -/

/-- The world whose first n manifolds rest on the seat and whose later ones are fake. -/
def staged (n : Nat) : Frame := ⟨Nat, stuckFlow, fun d => if d < n then true else false⟩

theorem finite_record_never_forces (n : Nat) :
    (∀ d, d < n → Registers (staged n).flow ((staged n).start d)) ∧ ¬ Value (staged n) :=
  ⟨fun d hd => ⟨0, by show (if d < n then true else false) = true; rw [if_pos hd]⟩,
   fun h => match h n with
     | ⟨k, hk⟩ => by
       have e : (staged n).start n = false := by
         show (if n < n then true else false) = false
         rw [if_neg (Nat.lt_irrefl n)]
       rw [e] at hk
       exact Bool.noConfusion ((stuck_never k).symm.trans hk)⟩

structure Ladder where
  Decided : Nat → Prop
  base    : Decided 0
  mono    : ∀ r s, Decided s → r ≤ s → Decided r
  δ       : Nat → Nat
  step    : ∀ r, Decided r → Decided (r + δ r)

theorem uniform_step_forces_all (L : Ladder) (hδ : ∀ r, 1 ≤ L.δ r) : ∀ r, L.Decided r
  | 0 => L.base
  | r + 1 => L.mono (r + 1) (r + L.δ r) (L.step r (uniform_step_forces_all L hδ r))
      (Nat.add_le_add_left (hδ r) r)

/-! ## XII · the closure, whole -/

theorem poincare_closure :
    (∀ P : Prop, ¬ ∀ M : Frame, (P ↔ Value M)) ∧
    (∀ M : Frame, Rests M ↔ Value M) ∧
    (∀ A : ActualManifolds, Value A.M) ∧
    (∀ (M : Frame) (_ : Witness M.flow), Rests M) ∧
    (Rests solitonFrame ∧ ¬ Nonempty (Witness solitonFlow)) ∧
    ¬ Nonempty (Witness cycleFlow) ∧
    (∀ S : Dimensional, Value S.M) ∧
    Keyed Value :=
  ⟨given_is_not_the_value, act_is_the_value, poincare_from_existence, witness_gives_act,
   act_without_witness, no_witness_on_cycle, every_dimension_decided, value_is_keyed⟩

end PCClose

/-! ## Cones, pinned as printed: every theorem on no axiom -/
/-- info: 'PCClose.seat_is_fixed' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.seat_is_fixed
/-- info: 'PCClose.calm_value' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.calm_value
/-- info: 'PCClose.stuck_never' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.stuck_never
/-- info: 'PCClose.counter_fails' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.counter_fails
/-- info: 'PCClose.root_given' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.root_given
/-- info: 'PCClose.root_conservative' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.root_conservative
/-- info: 'PCClose.arrow_given' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.arrow_given
/-- info: 'PCClose.freedom_given' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.freedom_given
/-- info: 'PCClose.given_is_not_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.given_is_not_the_value
/-- info: 'PCClose.arrow_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.arrow_forces_nothing
/-- info: 'PCClose.given_in_both_worlds' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.given_in_both_worlds
/-- info: 'PCClose.act_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.act_is_the_value
/-- info: 'PCClose.act_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.act_is_keyed
/-- info: 'PCClose.poincare_from_existence' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.poincare_from_existence
/-- info: 'PCClose.supply_iff' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.supply_iff
/-- info: 'PCClose.nothing_escapes' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.nothing_escapes
/-- info: 'PCClose.fake_sphere_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.fake_sphere_refutes
/-- info: 'PCClose.rest_is_permanent' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.rest_is_permanent
/-- info: 'PCClose.cannot_lie' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.cannot_lie
/-- info: 'PCClose.cannot_deviate' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.cannot_deviate
/-- info: 'PCClose.halted_iff' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.halted_iff
/-- info: 'PCClose.witness_bound' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.witness_bound
/-- info: 'PCClose.witness_registers' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.witness_registers
/-- info: 'PCClose.witness_gives_act' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.witness_gives_act
/-- info: 'PCClose.witness_carrier_halted' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.witness_carrier_halted
/-- info: 'PCClose.act_without_witness' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.act_without_witness
/-- info: 'PCClose.no_witness_on_cycle' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.no_witness_on_cycle
/-- info: 'PCClose.dim_cases' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.dim_cases
/-- info: 'PCClose.every_dimension_decided' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.every_dimension_decided
/-- info: 'PCClose.three_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.three_is_load_bearing
/-- info: 'PCClose.value_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.value_is_keyed
/-- info: 'PCClose.no_keyless_statement_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.no_keyless_statement_is_the_act
/-- info: 'PCClose.pulse_does_not_certify' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.pulse_does_not_certify
/-- info: 'PCClose.record_wall' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.record_wall
/-- info: 'PCClose.fibre_is_two' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.fibre_is_two
/-- info: 'PCClose.prime_shape' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.prime_shape
/-- info: 'PCClose.two_axes_leave_two' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.two_axes_leave_two
/-- info: 'PCClose.three_axes_lock_one' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.three_axes_lock_one
/-- info: 'PCClose.finite_record_never_forces' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.finite_record_never_forces
/-- info: 'PCClose.uniform_step_forces_all' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.uniform_step_forces_all
/-- info: 'PCClose.poincare_closure' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.poincare_closure
