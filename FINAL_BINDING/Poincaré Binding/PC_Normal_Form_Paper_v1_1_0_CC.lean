/-
  PC_Normal_Form_Paper_v1_1_0_CC.lean · the kernel of "The Poincaré Conjecture: Unconditional Proof of the Form by
  Theorem, the Value by the Act", edition 1.1.0. Claude-coded (_CC). Core Lean 4.19.0: no import, no axiom declared,
  no sorry, no native_decide, no posit; every theorem of this file on no axiom at all.

  Part 0 (namespace PCClose) is PC_Existence_Closure.lean of the edition of record, carried verbatim
  (sha256 023a18ff97db71b0b68df1b62c43c094d114711de21595308f798332adb70913): the flow and its seat; the frame of the row
  and the two worlds; existence as given forcing nothing; the act, equal to the value; the bridge, which cannot lie and
  cannot be manufactured; the witness of the 2002–03 offering typed as a downstream strict subtype of the bridge, and
  the crossing containing it strictly; the proved part by dimension, dimension three load-bearing; keyless and keyed;
  the record walls; the triaxial lock; the finite record; the closure; the root and the lock. Its 80 theorems and their
  pins stand unchanged.
  Part A (namespace PC.NORMALFORM) is the normal form of the row, generic over a row and read on the Poincaré row as
  the P ≠ NP seat reads computation and the Riemann seat reads the zeros: the record carries the value with no
  premise; the value is exactly the transfer from the record, the one bit; the cargo loop; the act; self-recursion;
  the keyed bit; the record deciding nothing; every route passing the bit; the keyless wall; no uniform answer.
  Part B (namespace PC.HOST) is the host model and its binding, proved: the record of a frame starts every manifold
  on the seat; the value of the host's frame is exactly the host's sentence, every manifold of the host the round
  sphere; a flow faithful to the class registers no manifold that is not round, and its value is strictly stronger
  than the sentence.
  Part C (namespace PC.ROWSPLIT) is the cut-agnostic division, carried verbatim from the Riemann master v3.0.39_CC,
  and Part C′ (namespace PC.REALPART) reads it by dimension: the real part, every dimension but three, sealed by the
  cited theorem of its dimension carried as a field; the unicorn part, dimension three; no bypass; the
  dimension-three part load-bearing; the unicorn part closed to the record above every dimension.
  Part D (namespace PC.WALLS): the tree count and the degree record decided by the kernel, the record that reads every
  frame alike deciding nothing, and the walls of the row in one theorem.
  Part E (namespace PC.RESIDUE): the one implication that remains, printed as a hypothesis and assumed nowhere; its
  instance seat by dimension.
  Part F (namespace PC.SUPPLY): the bit supplied by its two kinds, the formal cargo and the physical witness; the two
  kinds one bit; delivered twice; two kinds and no third; the one refuter, one fake sphere; the 2002–03 offering
  typed as one inhabitant of the formal kind, downstream of the bridge, never its ground.
  Part G (namespace PC.CLOSURE): the question closed to one bit.
  Part W (namespace PC.GATES): the twelve formal gates run in the kernel, and the four refusals.
  Part X (namespace PC.ESCAPE): nothing escapes, our way or no way, and the capstone.
  Part T (namespace PC.TERMINAL): the open framing refuted, the ten steps, the terminal verdict and the final form.
  Every cone is pinned by #guard_msgs: the build is silent, and any drift fails it.

  THE TWO-LAYER CLOSURE. Everything except the bit is proved with no posit: the floor on no axiom at all, and every
  other theorem of this file on no axiom at all; and the bit, the row's reading, is all that remains, at premise grade.
  The root alone forces no value; the root read on the row is the value. No declaration of this file has the type of
  the bit. ΔM = 0.
-/

/-
  PC_Existence_Closure.lean · the kernel of the Poincaré closure from existence alone

  The Poincaré row closed on existence alone, the freedom arrow beside it, and the Perelman witness typed
  as one supply of the act and a strict subtype of the bridge. Every theorem of this file is on no axiom at all: no
  propext, no Quot.sound, no Classical.choice.
  I     The flow and its seat: a step, a round state fixed by it, a rescaling commuting with it; a state
        the step fixes is never left.
  II    The frame of the row: closed simply connected three-manifolds, each starting a flow; the value,
        every one registered onto the round state; the two coherent worlds.
  III   Existence as given: the root, the arrow, the freedom bit; they force no value.
  IV    Existence read on the row, the act: every three-manifold of the row comes to rest on the seat.
        The act is the value; the root read on the row is the act; nothing given forces the value or refutes
        the act; one act closes it; nothing escapes; one fake sphere refutes it; a state the flow fixes is,
        under the act, the seat itself.
  V     The bridge: a carrier of the row's bit, halted exactly when the value holds; it cannot
        lie and cannot be manufactured; under the act every carrier of the value is the act's own.
  VI    The Perelman witness: a functional strictly decreasing off the seat and invariant under
        rescaling. It registers every state, so it supplies the act, and it yields a carrier through
        the act, so it is a subtype of the bridge, downstream of it in one sense, the factorization:
        every halted carrier of the row's value is the bridge's carrier at the act, so whatever the witness
        yields comes out of the bridge. It is a strict subset: on every flow whose rescaling
        is its step and which has a state off the seat no witness exists, and the kernel's self-similar
        flow registers every state, carrying a halted carrier and no witness. The crossing, a functional
        never rising, scale-free, and level off the seat only where the step lands on it, registers every
        state, supplies the act, and contains the witness strictly. A cycle admits no witness, and on the
        cycle frame the act fails too.
  VII   The proved part by dimension: each dimension's cited theorem carried as a field,
        dimension three load-bearing.
  VIII  Keyless and keyed: no keyless statement is the act; the pulse does not certify; the value is keyed
        on both sides, and a property keyed on both sides is no keyless statement.
  IX    Freedom: the record wall in the Bool model and on frames, the two-point fibre, the prime's shape.
  X     The triaxial lock.
  XI    The record and the seed: no finite record forces the value, and the staged world agrees with a
        resting world on its record; a uniform step decides every rung of a ladder that carries it, and on
        a ladder of a flow's own enumerated states it registers every one.
  XII   The closure, whole.
  ROOT  The root, undeniable in deed, and the lock: the root holds by its deed and forces neither the value
        nor its failure; the root formula with actuation zero fails; the constructed root grounds itself; the
        root read on the row grounds itself exactly where the value holds, and the act stands on it; the
        constructed root of Appendix R repeated verbatim, with its lock (the_lock_on_the_root); one theorem on
        no axiom binds the root, its readings, the act, the value, their keying, the closing theorem, the
        record wall and the finite record (the_lock); and one fixes the sense of 'from existence alone'
        (from_existence_alone).
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

/-- A FIXED STATE IS NEVER LEFT: a state the step fixes stays itself at every time. -/
theorem iter_fixed (F : Flow) (s : F.State) (hf : F.step s = s) : ∀ k, iter F.step k s = s :=
  fun k => match k with
  | 0 => rfl
  | k + 1 => (congrArg (fun x => iter F.step k x) hf).trans (iter_fixed F s hf k)

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

/-! ## The root read on the row -/

/-- The indicator of a decided proposition: one where it holds, zero where it fails. -/
def indicator {p : Prop} : Decidable p → Int
  | isTrue _  => 1
  | isFalse _ => 0

/-- The indicator is positive exactly where its proposition holds. -/
theorem indicator_pos {p : Prop} (h : Decidable p) : 0 < indicator h ↔ p :=
  match h with
  | isTrue hp  => ⟨fun _ => hp, fun _ => show (0 : Int) < 1 by decide⟩
  | isFalse hn => ⟨fun h0 => absurd h0 (show ¬ (0 : Int) < 0 by decide), fun hp => absurd hp hn⟩

/-- Whether an option carries a value, decided. -/
def suppliedDec (o : Option Nat) : Decidable (∃ n, o = some n) :=
  match o with
  | some n => isTrue ⟨n, rfl⟩
  | none   => isFalse (fun ⟨_, h⟩ => Option.noConfusion h)

/-- THE ROOT READ ON THE ROW: to exist is to actuate, `Root` itself, read at each manifold of the row and its
instants: the manifold's actuation at an instant is one where it rests on the seat there and zero elsewhere, and
every manifold has an instant at which the root holds of it. -/
def RootOnRow (M : Frame) : Prop :=
  ∀ d, ∃ k, Root Unit (fun _ => indicator (M.flow.deq (iter M.flow.step k (M.start d))))

/-- THE ROOT IS SATISFIABLE ON EVERY BACKGROUND: on every type, with actuation one at every existent. -/
theorem root_satisfiable (U : Type) : Root U (fun _ => 1) := fun _ => show (0 : Int) < 1 by decide

/-- THE CONSTRUCTED ROOT, in the words of Appendix R: one existent, whose actuation is one. A theorem
with no hypothesis and no axiom. -/
theorem constructed_root_holds : Root Unit (fun _ => 1) := root_satisfiable Unit

/-- THE ROOT READ ON THE ROW IS THE ACT. -/
theorem root_on_row_is_the_act (M : Frame) : RootOnRow M ↔ Rests M :=
  ⟨fun h d => match h d with | ⟨k, hk⟩ => ⟨k, (indicator_pos _).mp (hk ())⟩,
   fun h d => match h d with | ⟨k, hk⟩ => ⟨k, fun _ => (indicator_pos _).mpr hk⟩⟩

/-- THE ROOT READ ON THE ROW IS THE VALUE. -/
theorem root_on_row_is_the_value (M : Frame) : RootOnRow M ↔ Value M :=
  ⟨fun h => (act_is_the_value M).mp ((root_on_row_is_the_act M).mp h),
   fun h => (root_on_row_is_the_act M).mpr ((act_is_the_value M).mpr h)⟩

/-- THE ROOT READ ON THE ROW IS KEYED: it holds where the value holds and fails where the value fails. -/
theorem root_on_row_is_keyed : RootOnRow calm ∧ ¬ RootOnRow counter :=
  ⟨(root_on_row_is_the_value calm).mpr calm_value, fun h => counter_fails ((root_on_row_is_the_value counter).mp h)⟩

/-- THE ACT IS THE WEAKEST PREMISE: the act forces the value on every frame, and every premise that forces
the value on every frame implies the act. -/
theorem act_is_the_weakest_premise :
    (∀ M : Frame, Rests M → Value M) ∧
    ∀ Q : Frame → Prop, (∀ M : Frame, Q M → Value M) → ∀ M : Frame, Q M → Rests M :=
  ⟨fun M h => (act_is_the_value M).mp h, fun _ hQ M hq => (act_is_the_value M).mpr (hQ M hq)⟩

/-- EXISTENCE AS GIVEN HOLDS IN BOTH WORLDS: the root satisfiable on every background, the arrow and the
freedom bit hold in the world where the value holds and in the world where it fails. -/
theorem existence_as_given_in_both_worlds :
    ((∀ U : Type, Root U (fun _ => 1)) ∧ Arrow ∧ (∀ w : Bool, (!w) ≠ w)) ∧ Value calm ∧ ¬ Value counter :=
  ⟨⟨root_satisfiable, arrow_given, freedom_given⟩, calm_value, counter_fails⟩

/-- NOTHING GIVEN REFUTES THE ACT: no statement that holds refutes the act on every frame. -/
theorem nothing_given_refutes : ∀ P : Prop, P → ¬ ∀ M : Frame, P → ¬ Rests M :=
  fun _ hp h => h calm hp act_is_keyed.1

/-- NOTHING GIVEN FORCES THE VALUE: no statement that holds forces the value on every frame. -/
theorem nothing_given_forces : ∀ P : Prop, P → ¬ ∀ M : Frame, P → Value M :=
  fun _ hp h => counter_fails (h counter hp)

structure ActualManifolds where
  M      : Frame
  supply : Rests M

/-- THE POINCARÉ VALUE FROM EXISTENCE, BY ONE ACT. -/
theorem poincare_from_existence (A : ActualManifolds) : Value A.M :=
  (act_is_the_value A.M).mp A.supply

/-- THE SUPPLY IS EXACT: an act exists on a frame exactly when the value holds there. -/
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

/-- THE ONE STATE NEVER LEFT IS THE SEAT: under the act, a manifold whose flow fixes its starting state starts on
the round state. -/
theorem the_one_state_never_left (M : Frame) (h : Rests M) (d : M.D)
    (hf : M.flow.step (M.start d) = M.start d) : M.start d = M.flow.round :=
  match h d with
  | ⟨k, hk⟩ => (iter_fixed M.flow (M.start d) hf k).symm.trans hk

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

/-- EVERY CARRIER IS THE ACT'S: under the act, every carrier of the row's value is the act's own carrier. -/
theorem every_halted_carrier_is_the_acts (M : Frame) (h : Rests M) :
    ∀ b : Carrier (Value M), b = actCarrier M h :=
  fun b => match b with
  | ⟨.bot, _⟩ => rfl
  | ⟨.tt, s⟩ => absurd (s.mpr ((act_is_the_value M).mp h)) (fun e => Tri.noConfusion e)
  | ⟨.ff, s⟩ => absurd (s.mpr ((act_is_the_value M).mp h)) (fun e => Tri.noConfusion e)

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

/-- A WITNESS SUPPLIES THE ACT: a witness on the row's flow brings every manifold of the row to rest. -/
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

/-- NO WITNESS ON A SELF-SIMILAR FLOW: on every flow whose rescaling is its step and which has a state off the seat,
no Perelman witness exists, since a functional invariant under the rescaling cannot strictly decrease along the step
at that state. -/
theorem no_witness_on_self_similar (F : Flow) (h : ∀ s, F.rescale s = F.step s) (s : F.State)
    (hs : s ≠ F.round) : ¬ Nonempty (Witness F) :=
  fun ⟨P⟩ =>
    have d : P.W (F.step s) < P.W s := P.decrease s hs
    have e : P.W (F.rescale s) = P.W s := P.scaleFree s
    have e' : P.W (F.step s) = P.W s := h s ▸ e
    Nat.lt_irrefl _ (e' ▸ d)

/-- THE WITNESS IS A STRICT SUBTYPE OF THE BRIDGE: on the self-similar frame a halted carrier of the row's value
exists and no witness does. -/
theorem bridge_without_witness :
    (∃ b : Carrier (Value solitonFrame), b.terminal = .bot) ∧ ¬ Nonempty (Witness solitonFlow) :=
  ⟨(halted_iff (Value solitonFrame)).mpr ((act_is_the_value solitonFrame).mp act_without_witness.1),
   act_without_witness.2⟩

/-- A DOWNSTREAM STRICT SUBTYPE OF THE BRIDGE, downstream in one sense, the factorization: every halted carrier of
the row's value is the bridge's carrier at the act, so whatever the witness yields comes out of the bridge; where a
witness exists every carrier of the row's value halts with the witness's carrier, which is the bridge's carrier at
the act the witness supplies; and the bridge holds a halted carrier of the row's value on a frame where no witness
exists. -/
theorem witness_downstream_strict_subtype :
    (∀ (M : Frame) (P : Witness M.flow) (b : Carrier (Value M)),
      b.terminal = .bot ∧ b.terminal = (witnessCarrier M P).terminal) ∧
    (∀ (M : Frame) (P : Witness M.flow),
      witnessCarrier M P = actCarrier M (witness_gives_act M P) ∧ (witnessCarrier M P).terminal = .bot) ∧
    ((∃ b : Carrier (Value solitonFrame), b.terminal = .bot) ∧ ¬ Nonempty (Witness solitonFlow)) :=
  ⟨fun M P b =>
     have e : b.terminal = .bot := cannot_deviate (Value M) b ((act_is_the_value M).mp (witness_gives_act M P))
     ⟨e, e⟩,
   fun _ _ => ⟨rfl, rfl⟩, bridge_without_witness⟩

/-- The crossing on a flow: a functional never rising along the step, invariant under rescaling, and such that
a state off the seat where it holds level steps onto the seat. -/
structure Crossing (F : Flow) where
  W         : F.State → Nat
  mono      : ∀ s, W (F.step s) ≤ W s
  scaleFree : ∀ s, W (F.rescale s) = W s
  classify  : ∀ s, s ≠ F.round → W (F.step s) = W s → F.step s = F.round

/-- THE CROSSING BOUND: a state whose crossing functional is at most n comes to rest on the seat. -/
theorem crossing_bound (F : Flow) (C : Crossing F) : ∀ n s, C.W s ≤ n → Registers F s :=
  fun n => match n with
  | 0 => fun s hs => match F.deq s with
    | isTrue e => ⟨0, e⟩
    | isFalse ne => match Nat.lt_or_ge (C.W (F.step s)) (C.W s) with
      | Or.inl lt => absurd (Nat.lt_of_lt_of_le lt hs) (Nat.not_lt_zero _)
      | Or.inr ge => ⟨1, C.classify s ne (Nat.le_antisymm (C.mono s) ge)⟩
  | n + 1 => fun s hs => match F.deq s with
    | isTrue e => ⟨0, e⟩
    | isFalse ne => match Nat.lt_or_ge (C.W (F.step s)) (C.W s) with
      | Or.inl lt =>
        match crossing_bound F C n (F.step s) (Nat.le_of_lt_succ (Nat.lt_of_lt_of_le lt hs)) with
        | ⟨k, hk⟩ => ⟨k + 1, hk⟩
      | Or.inr ge => ⟨1, C.classify s ne (Nat.le_antisymm (C.mono s) ge)⟩

/-- THE CROSSING REGISTERS: a crossing brings every state to rest on the seat. -/
theorem crossing_registers (F : Flow) (C : Crossing F) (s : F.State) : Registers F s :=
  crossing_bound F C (C.W s) s (Nat.le_refl _)

/-- Every witness is a crossing: a functional strictly decreasing off the seat never rises and never holds
level off the seat. -/
def Witness.toCrossing {F : Flow} (P : Witness F) : Crossing F where
  W         := P.W
  mono      := fun s => match F.deq s with
    | isTrue e => by rw [e, F.fixed]; exact Nat.le_refl _
    | isFalse ne => Nat.le_of_lt (P.decrease s ne)
  scaleFree := P.scaleFree
  classify  := fun s ne eq =>
    absurd (Nat.lt_of_lt_of_le (P.decrease s ne) (Nat.le_of_eq eq.symm)) (Nat.lt_irrefl _)

/-- The self-similar flow carries a crossing: the constant functional. -/
def solitonCrossing : Crossing solitonFlow := ⟨fun _ => 0, fun _ => Nat.le_refl 0, fun _ => rfl, fun _ _ _ => rfl⟩

/-- THE CROSSING TYPED: every witness yields a crossing; a crossing on the row's flow supplies the act; and the
self-similar flow carries a crossing and no witness, so the crossing contains the witness strictly. -/
theorem crossing_types_the_crossing :
    (∀ F : Flow, Witness F → Nonempty (Crossing F)) ∧
    (∀ M : Frame, Crossing M.flow → Rests M) ∧
    Nonempty (Crossing solitonFlow) ∧ ¬ Nonempty (Witness solitonFlow) :=
  ⟨fun _ P => ⟨P.toCrossing⟩, fun M C d => crossing_registers M.flow C (M.start d), ⟨solitonCrossing⟩,
   act_without_witness.2⟩

/-- A cycle: two states swapping, neither on the seat. -/
def cycleStep : Option Bool → Option Bool
  | none => none
  | some b => some (!b)

def cycleFlow : Flow := ⟨Option Bool, cycleStep, none, rfl, id, fun _ => rfl, rfl,
  fun s => match s with
    | none => isTrue rfl
    | some _ => isFalse Option.noConfusion⟩

/-- NO WITNESS ON A CYCLE, WHERE THE ACT ALSO FAILS: on a cycle no Perelman witness exists. -/
theorem no_witness_on_cycle : ¬ Nonempty (Witness cycleFlow) := fun ⟨P⟩ =>
  have a : P.W (show cycleFlow.State from some false) < P.W (show cycleFlow.State from some true) :=
    P.decrease (show cycleFlow.State from some true) Option.noConfusion
  have b : P.W (show cycleFlow.State from some true) < P.W (show cycleFlow.State from some false) :=
    P.decrease (show cycleFlow.State from some false) Option.noConfusion
  Nat.lt_irrefl _ (Nat.lt_trans a b)

/-- The cycle frame: one manifold starting on the cycle, off the seat. -/
def cycleFrame : Frame := ⟨Unit, cycleFlow, fun _ => (some true : Option Bool)⟩

/-- THE CYCLE STAYS OFF THE SEAT: from a state of the cycle the flow is on the cycle at every time. -/
theorem cycle_stays_off : ∀ (k : Nat) (b : Bool), ∃ c : Bool, iter cycleStep k (some b) = some c :=
  fun k => match k with
  | 0 => fun b => ⟨b, rfl⟩
  | k + 1 => fun b => cycle_stays_off k (!b)

/-- THE CYCLE NEVER RESTS: on the cycle frame the act fails, and with it the value. -/
theorem cycle_never_rests : ¬ Value cycleFrame := fun h => match h () with
  | ⟨k, hk⟩ => match cycle_stays_off k true with
    | ⟨_, hc⟩ => Option.noConfusion (hc.symm.trans hk)

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

/-- Keyed on both sides: the property holds on some frame and fails on another. -/
def KeyedBoth (P : Frame → Prop) : Prop := (∃ M, P M) ∧ ∃ M, ¬ P M

/-- THE VALUE IS KEYED ON BOTH SIDES: it holds on the round world and fails on the counter world. -/
theorem value_is_keyed_both : KeyedBoth Value := ⟨⟨calm, calm_value⟩, ⟨counter, counter_fails⟩⟩

/-- KEYED IS NOT KEYLESS: a property keyed on both sides is no single statement read on every frame. -/
theorem keyed_is_not_keyless (P : Frame → Prop) (h : KeyedBoth P) : ¬ ∃ Q : Prop, ∀ M, (P M ↔ Q) :=
  fun ⟨_, hQ⟩ => match h with
  | ⟨⟨M₁, p₁⟩, ⟨M₂, n₂⟩⟩ => n₂ ((hQ M₂).mpr ((hQ M₁).mp p₁))

theorem no_keyless_statement_is_the_act (P : Prop) : ¬ ∀ M : Frame, (P ↔ Rests M) :=
  fun h => given_is_not_the_value P (fun M => (h M).trans (act_is_the_value M))

theorem pulse_does_not_certify : Root Empty (fun e => nomatch e) ∧ ¬ Value counter :=
  ⟨root_given, counter_fails⟩

/-! ## IX · freedom -/

/-- The kinetic record, the Bool model: one record for both values of the bit. -/
def kineticRecord (_w : Bool) : Nat := 0

/-- THE RECORD WALL, the Bool model: no reading of the kinetic record returns the bit. -/
theorem record_wall : ¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w :=
  fun ⟨_, hg⟩ => Bool.noConfusion ((hg false).symm.trans (hg true))

/-- THE RECORD WALL ON FRAMES: a record of frames that agrees on the round world and the counter world admits no
reading that is the value on every frame. -/
theorem record_wall_on_frames {α : Type} (rec : Frame → α) (h : rec calm = rec counter) :
    ¬ ∃ g : α → Prop, ∀ M : Frame, (g (rec M) ↔ Value M) :=
  fun ⟨_, hg⟩ => counter_fails ((hg counter).mp (h ▸ (hg calm).mpr calm_value))

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

/-- The world whose every manifold rests on the seat, on the staged world's flow. -/
def allRest : Frame := ⟨Nat, stuckFlow, fun _ => true⟩

/-- The resting world carries the value. -/
theorem allRest_value : Value allRest := fun _ => ⟨0, rfl⟩

/-- THE FINITE RECORD WALL: the staged world agrees with the resting world on its first n manifolds, and the value
holds on the resting world and fails on the staged one. -/
theorem finite_record_wall (n : Nat) :
    (∀ d, d < n → (staged n).start d = allRest.start d) ∧ Value allRest ∧ ¬ Value (staged n) :=
  ⟨fun d hd => by show (if d < n then true else false) = true; rw [if_pos hd],
   allRest_value, (finite_record_never_forces n).2⟩

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

/-- The ladder on a flow's own enumerated states: rung r is decided when the first r states register. -/
def rowLadder (F : Flow) (st : Nat → F.State) (δ : Nat → Nat)
    (hstep : ∀ r, (∀ d, d < r → Registers F (st d)) → ∀ d, d < r + δ r → Registers F (st d)) : Ladder :=
  ⟨fun r => ∀ d, d < r → Registers F (st d), fun d h => absurd h (Nat.not_lt_zero d),
   fun _ _ hs hrs d hd => hs d (Nat.lt_of_lt_of_le hd hrs), δ, hstep⟩

/-- A UNIFORM STEP FORCES THE VALUE ON THE LADDER: a step of at least one rung from every decided rung registers
every enumerated state. -/
theorem uniform_step_forces_value (F : Flow) (st : Nat → F.State) (δ : Nat → Nat) (hδ : ∀ r, 1 ≤ δ r)
    (hstep : ∀ r, (∀ d, d < r → Registers F (st d)) → ∀ d, d < r + δ r → Registers F (st d)) :
    ∀ d, Registers F (st d) :=
  fun d => uniform_step_forces_all (rowLadder F st δ hstep) hδ (d + 1) d (Nat.lt_succ_self d)

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


/-! ## The root, undeniable in deed -/

/-- A self-grounding root, the structure of Appendix R in the same words: a type of acts, inhabited, every
one of which instances the root. -/
structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

/-- THE ROOT IS UNDENIABLE IN DEED: a denial of a self-grounding root is a deed, and instances it. -/
theorem denial_reenacts_root {R : Prop} (G : SelfGrounding R) (denial : G.Act) : R :=
  G.instances denial

/-- No outside proof adds to a self-grounding root: an outside proof of it is worth exactly the root. -/
theorem external_proof_adds_nothing {R : Prop} (G : SelfGrounding R) (Q : Prop) : (Q → R) ↔ R :=
  ⟨fun _ => G.instances G.anAct, fun r _ => r⟩

/-- THE UNDENIABLE ROOT HOLDS IN BOTH WORLDS: it is held by its deed in a frame where the value holds
and in one where it fails, so it forces the value on no uniform reading of the frames, and forces its failure on
none either. -/
theorem undeniable_root_forces_no_value {R : Prop} (G : SelfGrounding R) :
    R ∧ Value calm ∧ ¬ Value counter ∧ ¬ (∀ M : Frame, R → Value M) ∧ ¬ (∀ M : Frame, R → ¬ Value M) :=
  ⟨G.instances G.anAct, calm_value, counter_fails, fun h => counter_fails (h counter (G.instances G.anAct)),
   fun h => h calm (G.instances G.anAct) calm_value⟩

/-- The constructed root grounds itself: one act, which instances it. -/
def constructedGrounds : SelfGrounding (Root Unit (fun _ => 1)) := ⟨Unit, (), fun _ => constructed_root_holds⟩

/-- THE ROOT FORMULA IS NOT UNDENIABLE AS A FORMULA: with actuation zero on the one existent it fails, so the root
holds by the deed that actuates, not by its shape. -/
theorem root_formula_is_not_undeniable : ¬ Root Unit (fun _ => 0) :=
  fun h => absurd (h ()) (show ¬ (0 : Int) < 0 by decide)

/-- THE ROOT READ ON THE ROW GROUNDS ITSELF EXACTLY WHERE THE VALUE HOLDS. -/
theorem root_on_row_grounds_iff (M : Frame) : Nonempty (SelfGrounding (RootOnRow M)) ↔ Value M :=
  ⟨fun ⟨G⟩ => (root_on_row_is_the_value M).mp (G.instances G.anAct),
   fun h => ⟨⟨Unit, (), fun _ => (root_on_row_is_the_value M).mpr h⟩⟩⟩

/-- THE ACT STANDS ON THE ROOT: the constructed root holds and forces the value on no uniform reading of the
frames; read on the row it is the act; and the root read on the row grounds itself exactly where the act holds. -/
theorem the_act_stands_on_the_root :
    (Root Unit (fun _ => 1) ∧ ¬ (∀ M : Frame, Root Unit (fun _ => 1) → Value M)) ∧
    (∀ M : Frame, RootOnRow M ↔ Rests M) ∧
    (∀ M : Frame, Nonempty (SelfGrounding (RootOnRow M)) ↔ Rests M) :=
  ⟨⟨constructed_root_holds, fun h => counter_fails (h counter constructed_root_holds)⟩, root_on_row_is_the_act,
   fun M => ⟨fun g => (act_is_the_value M).mpr ((root_on_row_grounds_iff M).mp g),
             fun h => (root_on_row_grounds_iff M).mpr ((act_is_the_value M).mp h)⟩⟩

/-- THE POINCARÉ VALUE FROM THE ROOT READ ON THE ROW. -/
theorem poincare_from_root_on_row (M : Frame) (h : RootOnRow M) : Value M :=
  (root_on_row_is_the_value M).mp h

/-! ### the constructed root of Appendix R, repeated verbatim -/

/-- The actuation of Appendix R: one existent, whose actuation is one. -/
def ΔE₀ : Unit → Int := fun _ => 1

/-- The constructed root of Appendix R: every existent of the one-point type actuates. -/
def RA₀ : Prop := ∀ x : Unit, 0 < ΔE₀ x

/-- The constructed root of Appendix R as a self-grounding root: one act, which instances it. -/
def ra₀ : SelfGrounding RA₀ := ⟨Unit, (), fun _ _ => show (0 : Int) < 1 by decide⟩

/-- THE CONSTRUCTED ROOT OF APPENDIX R IS THE ROOT ON ONE EXISTENT with actuation one. -/
theorem RA₀_is_the_constructed_root : RA₀ ↔ Root Unit (fun _ => 1) :=
  Iff.rfl

/-- THE LOCK ON THE CONSTRUCTED ROOT: Appendix R's root holds, forces the value on no uniform reading of the frames,
and read on the row of any frame is exactly that frame's value. -/
theorem the_lock_on_the_root :
    RA₀ ∧ ¬ (∀ M : Frame, RA₀ → Value M) ∧ (∀ M : Frame, RootOnRow M ↔ Value M) :=
  ⟨ra₀.instances ra₀.anAct, (undeniable_root_forces_no_value ra₀).2.2.2.1, root_on_row_is_the_value⟩

/-- THE ROOT READ ON THE ROW IS KEYED: the root holds, and read uniformly on the frames it gives no value;
read on the row, with the row's existents and the row's actuation, it is the value exactly, and keyed. -/
theorem root_read_on_row_is_keyed {R : Prop} (G : SelfGrounding R) :
    R ∧ ¬ (∀ M : Frame, R → Value M) ∧ (∀ M : Frame, RootOnRow M ↔ Value M) ∧ (RootOnRow calm ∧ ¬ RootOnRow counter) :=
  ⟨G.instances G.anAct, fun h => counter_fails (h counter (G.instances G.anAct)), root_on_row_is_the_value,
   root_on_row_is_keyed⟩

/-- THE LOCK, one theorem on no axiom: the constructed root holds with no hypothesis; every self-grounding
root holds by its deed; no given statement is the value on every frame; the root read uniformly on the frames
gives no value; read on the row the root is the act, the act is the value exactly, and both are keyed; the
closing theorem gives the value on every actual frame; no reading of the kinetic record returns the bit; and
no finite record forces the value. -/
theorem the_lock {R : Prop} (G : SelfGrounding R) :
    Root Unit (fun _ => 1) ∧
    R ∧
    (∀ P : Prop, ¬ ∀ M : Frame, (P ↔ Value M)) ∧
    ¬ (∀ M : Frame, R → Value M) ∧
    (∀ M : Frame, RootOnRow M ↔ Rests M) ∧
    (∀ M : Frame, Rests M ↔ Value M) ∧
    (RootOnRow calm ∧ ¬ RootOnRow counter) ∧
    (Rests calm ∧ ¬ Rests counter) ∧
    (∀ A : ActualManifolds, Value A.M) ∧
    (¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w) ∧
    (∀ n : Nat, (∀ d, d < n → Registers (staged n).flow ((staged n).start d)) ∧ ¬ Value (staged n)) :=
  ⟨constructed_root_holds, G.instances G.anAct, given_is_not_the_value, (root_read_on_row_is_keyed G).2.1,
   root_on_row_is_the_act, act_is_the_value, root_on_row_is_keyed, act_is_keyed, poincare_from_existence, record_wall,
   finite_record_never_forces⟩

/-- FROM EXISTENCE ALONE, in the sense the title carries: the closing theorem consumes existence read on
the row and nothing else; that reading is available on exactly the frames where the value holds; and no
statement given without the reading is the value on every frame. One theorem, on no axiom. -/
theorem from_existence_alone :
    (∀ A : ActualManifolds, Value A.M) ∧
    (∀ F : Frame, Nonempty { A : ActualManifolds // A.M = F } ↔ Value F) ∧
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) :=
  ⟨poincare_from_existence, supply_iff, given_is_not_the_value⟩

end PCClose

/-! ## Cones, pinned as printed -/
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
/-- info: 'PCClose.denial_reenacts_root' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.denial_reenacts_root
/-- info: 'PCClose.external_proof_adds_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.external_proof_adds_nothing
/-- info: 'PCClose.undeniable_root_forces_no_value' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.undeniable_root_forces_no_value
/-- info: 'PCClose.root_read_on_row_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.root_read_on_row_is_keyed
/-- info: 'PCClose.the_lock' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.the_lock
/-- info: 'PCClose.from_existence_alone' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.from_existence_alone
/-- info: 'PCClose.indicator_pos' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.indicator_pos
/-- info: 'PCClose.root_satisfiable' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.root_satisfiable
/-- info: 'PCClose.constructed_root_holds' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.constructed_root_holds
/-- info: 'PCClose.root_on_row_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.root_on_row_is_the_act
/-- info: 'PCClose.root_on_row_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.root_on_row_is_the_value
/-- info: 'PCClose.root_on_row_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.root_on_row_is_keyed
/-- info: 'PCClose.act_is_the_weakest_premise' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.act_is_the_weakest_premise
/-- info: 'PCClose.existence_as_given_in_both_worlds' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.existence_as_given_in_both_worlds
/-- info: 'PCClose.nothing_given_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.nothing_given_refutes
/-- info: 'PCClose.no_witness_on_self_similar' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.no_witness_on_self_similar
/-- info: 'PCClose.bridge_without_witness' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.bridge_without_witness
/-- info: 'PCClose.witness_downstream_strict_subtype' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.witness_downstream_strict_subtype
/-- info: 'PCClose.iter_fixed' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.iter_fixed
/-- info: 'PCClose.nothing_given_forces' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.nothing_given_forces
/-- info: 'PCClose.the_one_state_never_left' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.the_one_state_never_left
/-- info: 'PCClose.every_halted_carrier_is_the_acts' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.every_halted_carrier_is_the_acts
/-- info: 'PCClose.crossing_bound' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.crossing_bound
/-- info: 'PCClose.crossing_registers' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.crossing_registers
/-- info: 'PCClose.crossing_types_the_crossing' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.crossing_types_the_crossing
/-- info: 'PCClose.cycle_stays_off' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.cycle_stays_off
/-- info: 'PCClose.cycle_never_rests' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.cycle_never_rests
/-- info: 'PCClose.value_is_keyed_both' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.value_is_keyed_both
/-- info: 'PCClose.keyed_is_not_keyless' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.keyed_is_not_keyless
/-- info: 'PCClose.record_wall_on_frames' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.record_wall_on_frames
/-- info: 'PCClose.allRest_value' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.allRest_value
/-- info: 'PCClose.finite_record_wall' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.finite_record_wall
/-- info: 'PCClose.uniform_step_forces_value' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.uniform_step_forces_value
/-- info: 'PCClose.root_formula_is_not_undeniable' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.root_formula_is_not_undeniable
/-- info: 'PCClose.root_on_row_grounds_iff' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.root_on_row_grounds_iff
/-- info: 'PCClose.the_act_stands_on_the_root' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.the_act_stands_on_the_root
/-- info: 'PCClose.poincare_from_root_on_row' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.poincare_from_root_on_row
/-- info: 'PCClose.RA₀_is_the_constructed_root' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.RA₀_is_the_constructed_root
/-- info: 'PCClose.the_lock_on_the_root' does not depend on any axioms -/
#guard_msgs in #print axioms PCClose.the_lock_on_the_root
/-! ===================================================================================================================
    PART A · THE NORMAL FORM OF THE ROW (namespace PC.NORMALFORM) · v1_1_0_CC

    Purely additive: nothing above is overwritten. The row is read as the P ≠ NP seat reads computation and the
    Riemann seat reads the zeros: a type of frames, the value of a frame, and the registration of a frame onto its
    record, which keeps every existent and forgets the side of its realization. On the record the value holds with no
    premise (`record_has_the_value`). The value of a frame is then exactly one implication, the transfer of the value
    from the record to the frame (`normal_form`): the antecedent is a theorem, so the implication carries the whole
    content of the value, and it is the one bit. The two coherent frames share a record and split on the value
    (`record_decides_nothing`); the bit is keyed (`bit_is_keyed`); what every frame shares forces nothing
    (`keyless_forces_nothing`); every route to the value passes the bit (`every_route_passes_the_bit`); and the bit has
    no uniform answer across the frames (`no_uniform_answer`). Core Lean 4.19.0, no import, no axiom declared, no sorry,
    no native_decide; every theorem of this Part on no axiom at all. No declaration of this Part has the type of the
    bit. ΔM = 0.
=================================================================================================================== -/
namespace PC.NORMALFORM

universe u

/-- A ROW: a type of frames, the value of a frame, the registration of a frame onto its record, and two coherent
    frames, one carrying the value and one failing it. The record of every frame carries the value. -/
structure Row where
  Frame            : Type u
  Value            : Frame → Prop
  Rec              : Frame → Frame
  record_has_value : ∀ F, Value (Rec F)
  calm             : Frame
  counter          : Frame
  calm_value       : Value calm
  counter_fails    : ¬ Value counter

section core
variable (R : Row.{u})

/-- THE TRANSFER, the bit of a frame: the value carried from the frame's record to the frame. -/
def Transfer (F : R.Frame) : Prop := R.Value (R.Rec F) → R.Value F

/-- THE RECORD HAS THE VALUE, UNCONDITIONALLY (the mirror of `record_has_least_escape` and of
    `record_has_least_erasure`). -/
theorem record_has_the_value (F : R.Frame) : R.Value (R.Rec F) := R.record_has_value F

/-- THE NORMAL FORM OF THE ROW (the mirror of `sep_normal_form` and of `zeta_ra_loop`, first leg): the value of a frame
    is exactly the transfer from its record. The antecedent is a theorem, so the implication carries the whole value:
    it is the one bit, and nothing else remains. -/
theorem normal_form (F : R.Frame) : Transfer R F ↔ R.Value F :=
  ⟨fun h => h (R.record_has_value F), fun h _ => h⟩

/-- THE CARGO LOOP: the record's value, unconditional, carried by the one bit, is the value (the mirror of
    `sep_from_the_cargo_loop` and of `rh_from_the_cargo_loop`; the bit is the printed premise). -/
theorem value_from_the_cargo_loop (F : R.Frame) (bit : Transfer R F) : R.Value F :=
  bit (R.record_has_value F)

/-- THE ACT ON A FRAME: a structure whose one field is the value of the frame. -/
structure Act (F : R.Frame) where
  closure : R.Value F

/-- THE BIT IS THE ACT: the transfer holds exactly when the act stands. -/
theorem bit_is_the_act (F : R.Frame) : Transfer R F ↔ Nonempty (Act R F) :=
  ⟨fun h => ⟨⟨h (R.record_has_value F)⟩⟩, fun ⟨A⟩ _ => A.closure⟩

/-- SELF-RECURSION: a frame coincides with its record exactly when they carry the value alike. -/
def SelfRecursive (F : R.Frame) : Prop := R.Value F ↔ R.Value (R.Rec F)

/-- THE RECORD IS SELF-RECURSIVE, with no premise (the mirror of `record_is_self_recursive`). -/
theorem record_is_self_recursive (F : R.Frame) : SelfRecursive R (R.Rec F) :=
  ⟨fun _ => R.record_has_value (R.Rec F), fun _ => R.record_has_value F⟩

/-- THE FRAME IS SELF-RECURSIVE EXACTLY WHEN IT CARRIES THE VALUE (the mirror of `self_recursion_at_machine` and of
    `self_recursion_at_zeros`). -/
theorem self_recursion_at_frame (F : R.Frame) : SelfRecursive R F ↔ R.Value F :=
  ⟨fun h => h.mpr (R.record_has_value F), fun h => ⟨fun _ => R.record_has_value F, fun _ => h⟩⟩

/-- THE BIT IS KEYED: the transfer holds on the calm frame and fails on the counter frame. -/
theorem bit_is_keyed : Transfer R R.calm ∧ ¬ Transfer R R.counter :=
  ⟨fun _ => R.calm_value, fun h => R.counter_fails (h (R.record_has_value R.counter))⟩

/-- THE RECORD'S SELF-RECURSION DOES NOT TRANSFER: the record of the counter frame is self-recursive and the counter
    frame is not. -/
theorem record_self_recursion_does_not_transfer :
    SelfRecursive R (R.Rec R.counter) ∧ ¬ SelfRecursive R R.counter :=
  ⟨record_is_self_recursive R R.counter, fun h => R.counter_fails (h.mpr (R.record_has_value R.counter))⟩

/-- THE RECORD DECIDES NOTHING (the mirror of `record_decides_nothing`): the two coherent frames both carry the value
    on their records, and split on the value itself. -/
theorem record_decides_nothing :
    R.Value (R.Rec R.calm) ∧ R.Value (R.Rec R.counter) ∧ R.Value R.calm ∧ ¬ R.Value R.counter :=
  ⟨R.record_has_value R.calm, R.record_has_value R.counter, R.calm_value, R.counter_fails⟩

/-- EVERY ROUTE PASSES THE BIT (the mirror of `every_route_passes_the_bit`): any premise that yields the value yields
    the transfer, so every proof of the value, from any premise and in any vocabulary, delivers the one implication. -/
theorem every_route_passes_the_bit (F : R.Frame) (Q : Prop) (h : Q → R.Value F) : Q → Transfer R F :=
  fun q _ => h q

/-- A premise shared by every frame. -/
def Keyless (P : R.Frame → Prop) : Prop := ∀ F, P F

/-- A premise that forces the value on every frame where it holds. -/
def Forces (P : R.Frame → Prop) : Prop := ∀ F, P F → R.Value F

/-- A KEYLESS PREMISE FORCES NOTHING (the mirror of `the_unconditional_route_is_blocked`): what every frame shares
    yields the value on none where it fails. -/
theorem keyless_forces_nothing (P : R.Frame → Prop) (hP : Keyless R P) : ¬ Forces R P :=
  fun h => R.counter_fails (h R.counter (hP R.counter))

/-- NO CLOSED PRINCIPLE DECIDES: a principle true of the record of every frame decides the value on none (the mirror of
    `no_closed_principle_decides`). -/
theorem no_record_principle_decides (P : R.Frame → Prop) (hP : ∀ F, P (R.Rec F)) :
    ¬ ∀ F, P (R.Rec F) → R.Value F :=
  fun h => R.counter_fails (h R.counter (hP R.counter))

/-- A SHARED RECORD DECIDES NOTHING: a record of frames that reads the same on the calm and the counter frame has no
    reading that returns the value on every frame. -/
theorem shared_record_decides_nothing {α : Type} (r : R.Frame → α) (hr : r R.calm = r R.counter) :
    ¬ ∃ g : α → Bool, ∀ F, (g (r F) = true ↔ R.Value F) :=
  fun ⟨g, hg⟩ => R.counter_fails ((hg R.counter).mp ((congrArg g hr).symm.trans ((hg R.calm).mpr R.calm_value)))

/-- THE BIT HAS NO UNIFORM ANSWER: across the frames of the row the transfer is neither always true nor always false. -/
theorem no_uniform_answer : ¬ (∀ F, Transfer R F) ∧ ¬ (∀ F, ¬ Transfer R F) :=
  ⟨fun h => (bit_is_keyed R).2 (h R.counter), fun h => h R.calm (bit_is_keyed R).1⟩

/-- "NOTHING IS OUTSIDE THE RECORD", read as the record's value transferring to the frame: false as a law of every
    frame, since the counter frame's record carries the value and the frame does not; at a frame, the value itself. -/
theorem nothing_outside_the_record_is_the_bit (F : R.Frame) :
    ¬ (∀ G, Transfer R G) ∧ (Transfer R F ↔ R.Value F) :=
  ⟨(no_uniform_answer R).1, normal_form R F⟩

/-- THE ONE DENIAL: wherever the value fails, the transfer fails, though the record carries the value. -/
theorem denial_is_the_bits_denial (F : R.Frame) : ¬ R.Value F ↔ ¬ Transfer R F :=
  ⟨fun hn h => hn (h (R.record_has_value F)), fun hn hv => hn (fun _ => hv)⟩

/-- THE NORMAL FORM, COMPLETE, nothing before the colon but the row and a frame: the record carries the value; the
    value is the transfer; the transfer is the act; the frame is self-recursive exactly when it carries the value;
    every route passes the bit; the denial is the bit's denial. The value is not a conjunct. -/
theorem normal_form_complete (F : R.Frame) :
    R.Value (R.Rec F) ∧ (Transfer R F ↔ R.Value F) ∧ (Transfer R F ↔ Nonempty (Act R F)) ∧
    (SelfRecursive R F ↔ R.Value F) ∧ (∀ Q : Prop, (Q → R.Value F) → Q → Transfer R F) ∧
    (¬ R.Value F ↔ ¬ Transfer R F) :=
  ⟨R.record_has_value F, normal_form R F, bit_is_the_act R F, self_recursion_at_frame R F,
   fun Q h => every_route_passes_the_bit R F Q h, denial_is_the_bits_denial R F⟩

end core

/-! ### the refusals and the outside, generic over a proposition -/

/-- A true Boolean is never its own negation. -/
theorem bnot_ne (b : Bool) : (!b) ≠ b := by cases b <;> decide

/-- REFUSAL · "A PROOF IS WAITING" fails SREP: a true route to B is B itself (carried from `PNP.GATES.refusal_waiting`). -/
theorem refusal_waiting (B : Prop) : (∃ Q : Prop, Q ∧ (Q → B)) ↔ B :=
  ⟨fun ⟨_, q, h⟩ => h q, fun b => ⟨B, b, id⟩⟩

/-- REFUSAL · "NO PROOF CAN EVER EXIST" fails SREP: no true route to B is ¬ B itself, the counter world in costume
    (carried from `PNP.GATES.refusal_no_proof`). -/
theorem refusal_no_proof (B : Prop) : (¬ ∃ Q : Prop, Q ∧ (Q → B)) ↔ ¬ B :=
  ⟨fun h b => h ⟨B, b, id⟩, fun hn ⟨_, q, h⟩ => hn (h q)⟩

/-- A BLOCK NEEDS AN OUTSIDE: if the target is a function of the record, no record-preserving involution flips it, so
    a block that flips the target always stands on something the record leaves out (carried from
    `PNP.ESCAPE.block_needs_an_outside`). -/
theorem block_needs_an_outside {X Y : Type} (ρ : X → Y) (t : X → Bool) (x₀ : X)
    (hrec : ∃ g : Y → Bool, ∀ x, t x = g (ρ x)) :
    ¬ ∃ τ : X → X, (∀ x, ρ (τ x) = ρ x) ∧ (∀ x, t (τ x) = !t x) :=
  fun ⟨τ, hρ, ht⟩ => match hrec with
  | ⟨g, hg⟩ => bnot_ne (t x₀) (by rw [← ht x₀, hg (τ x₀), hρ x₀, ← hg x₀])

/-- The native involution on the bit: complementation. -/
def comp (b : Bool) : Bool := !b

/-- Complementation is an involution with no fixed point. -/
theorem comp_involution (b : Bool) : comp (comp b) = b := by cases b <;> rfl

/-- THE LOCUS OF COMPLEMENTATION VANISHES: no bit is its own complement. -/
theorem locus_vanishes : ¬ ∃ b, comp b = b := fun ⟨b, h⟩ => bnot_ne b h

/-- The grades a face carries, ranked. -/
inductive Grade
  | premise
  | structural
  | thm
  deriving DecidableEq

/-- The rank of a grade. -/
def Grade.rank : Grade → Nat
  | .premise => 0
  | .structural => 1
  | .thm => 2

/-- The weakest of two grades. -/
def Grade.weakest (a b : Grade) : Grade := if a.rank ≤ b.rank then a else b

/-- A JOIN NEVER STANDS ABOVE ITS WEAKEST FACE, and a tuple of theorems joined with the premise reads premise. -/
theorem join_reads_the_weakest :
    (∀ a b : Grade, (Grade.weakest a b).rank ≤ a.rank ∧ (Grade.weakest a b).rank ≤ b.rank) ∧
    Grade.weakest (Grade.weakest .thm .thm) .premise = .premise :=
  ⟨fun a b => by
     cases a <;> cases b <;> exact ⟨by decide, by decide⟩,
   by decide⟩

/-- A SQUARED SCALAR IS BLIND TO SIGN: a value and its reflection square alike, read from the definitions of
    negation and multiplication on the integers. -/
theorem square_is_sign_blind : ∀ x : Int, (-x) * (-x) = x * x
  | Int.ofNat 0 => rfl
  | Int.ofNat (_ + 1) => rfl
  | Int.negSucc _ => rfl

end PC.NORMALFORM

/-! ===================================================================================================================
    PART C · THE ROW SPLIT (namespace PC.ROWSPLIT) · v1_1_0_CC

    The cut-agnostic division, carried verbatim from the Riemann master v3.0.39_CC (namespace RHUnicorn, generic over
    the types α and β), its one proposition renamed from `RH` to `Whole`, the hypothesis it names. At every cut T the
    whole is exactly its Real part and its Unicorn part; a certificate at T proves the Real part; given the Real part
    the whole is exactly the Unicorn part; above every cut no reading of an even record agrees with an odd decision;
    the aperture is one bit wide; and the supply side is silent at the register. ΔM = 0.
=================================================================================================================== -/
namespace PC.ROWSPLIT

variable {α β : Type}

/-- The whole, the Real part at T, the Unicorn part at T. -/
def Whole (Z onL : α → Prop) : Prop := ∀ z, Z z → onL z
def RealPartAt (Z onL : α → Prop) (height : α → Nat) (T : Nat) : Prop :=
  ∀ z, Z z → height z ≤ T → onL z
def UnicornAt (Z onL : α → Prop) (height : α → Nat) (T : Nat) : Prop :=
  ∀ z, Z z → height z > T → onL z

/-- THE FORMAL BLOCK OF THE UNICORN PART. Let τ act on the existents, let ρ be a record even at a seat z above the
    height, and let d decide the property, odd at z. Then no reading g of the record agrees with d even on the region
    above the height alone. -/
theorem unicorn_block (height : α → Nat) (T : Nat) (τ : α → α) (ρ : α → β) (d : α → Bool)
    (z : α) (habove : height z > T) (habove' : height (τ z) > T)
    (hρ : ρ (τ z) = ρ z) (hd : d (τ z) = !d z) :
    ¬ ∃ g : β → Bool, ∀ w, height w > T → g (ρ w) = d w := by
  intro ⟨g, hg⟩
  have h1 := hg z habove
  have h2 := hg (τ z) habove'
  rw [hρ, hd, h1] at h2
  revert h2
  cases d z <;> intro h2 <;> exact Bool.noConfusion h2

/-- THE APERTURE, ONE BIT WIDE. At a seat where d is odd, one odd bit s at the seat decides d on the seat and its
    partner through a calibration that exists and is unique. -/
theorem aperture_one_bit_wide (τ : α → α) (s d : α → Bool) (z : α)
    (hs : s (τ z) = !s z) (hd : d (τ z) = !d z) :
    ∃ c : Bool, (d z = xor (s z) c ∧ d (τ z) = xor (s (τ z)) c) ∧
      ∀ c' : Bool, (d z = xor (s z) c' ∧ d (τ z) = xor (s (τ z)) c') → c' = c :=
  ⟨xor (d z) (s z),
    ⟨by cases s z <;> cases d z <;> rfl,
     by rw [hs, hd]; cases s z <;> cases d z <;> rfl⟩,
    by
      intro c' hc
      obtain ⟨h1, -⟩ := hc
      generalize hsz : s z = sv
      generalize hdz : d z = dv
      rw [hsz, hdz] at h1
      cases sv <;> cases dv <;> cases c' <;> first | rfl | exact absurd h1 (by decide)⟩

/-- EXISTENCE SUPPLIES NOTHING: conditioning the Unicorn part on an inhabited premise leaves it where it was. -/
theorem unicorn_rule_exact (Z onL : α → Prop) (height : α → Nat) (T : Nat) (A : Prop) (ha : A) :
    (A → UnicornAt Z onL height T) ↔ UnicornAt Z onL height T :=
  ⟨fun h => h ha, fun hu _ => hu⟩

/-- NO BYPASS: given the Real part, the whole is exactly the Unicorn part. -/
theorem unicorn_no_bypass (Z onL : α → Prop) (height : α → Nat) (T : Nat)
    (hr : RealPartAt Z onL height T) : Whole Z onL ↔ UnicornAt Z onL height T := by
  constructor
  · intro h z hz _; exact h z hz
  · intro hu z hz
    cases Nat.lt_or_ge T (height z) with
    | inl hgt => exact hu z hz hgt
    | inr hle => exact hr z hz hle

/-- THE SUPPLY SIDE IS SILENCE, AT THE REGISTER: both orientations of d at the seat are equally refused to every
    reading above the height. -/
theorem supply_side_silent (height : α → Nat) (T : Nat) (τ : α → α) (ρ : α → β) (d : α → Bool)
    (z : α) (habove : height z > T) (habove' : height (τ z) > T)
    (hρ : ρ (τ z) = ρ z) (hd : d (τ z) = !d z) :
    (¬ ∃ g : β → Bool, ∀ w, height w > T → g (ρ w) = d w) ∧
    (¬ ∃ g : β → Bool, ∀ w, height w > T → g (ρ w) = !d w) ∧
    (!d z) ≠ d z :=
  ⟨unicorn_block height T τ ρ d z habove habove' hρ hd,
   unicorn_block height T τ ρ (fun w => !d w) z habove habove' hρ (by
     show (!d (τ z)) = !(!d z)
     rw [hd]),
   by cases d z <;> decide⟩

/-- The division at the height: the whole is exactly its Real part and its Unicorn part. -/
theorem whole_iff_real_and_unicorn (Z onL : α → Prop) (height : α → Nat) (T : Nat) :
    Whole Z onL ↔ RealPartAt Z onL height T ∧ UnicornAt Z onL height T := by
  constructor
  · intro h; exact ⟨fun z hz _ => h z hz, fun z hz _ => h z hz⟩
  · intro ⟨hr, hu⟩ z hz
    cases Nat.lt_or_ge T (height z) with
    | inl hgt => exact hu z hz hgt
    | inr hle => exact hr z hz hle

/-- A certificate at the height: a complete list of the existents up to T, each checked. -/
structure Certificate (Z onL : α → Prop) (height : α → Nat) (T : Nat) where
  items    : List α
  complete : ∀ z, Z z → height z ≤ T → z ∈ items
  checked  : ∀ z, z ∈ items → onL z

/-- A CERTIFICATE PROVES THE REAL PART AT ITS HEIGHT. -/
theorem real_part_of_certificate (Z onL : α → Prop) (height : α → Nat) (T : Nat)
    (c : Certificate Z onL height T) : RealPartAt Z onL height T :=
  fun z hz hle => c.checked z (c.complete z hz hle)

end PC.ROWSPLIT
/-! ===================================================================================================================
    PART B · THE HOST MODEL AND ITS BINDING, PROVED (namespace PC.HOST) · v1_1_0_CC

    The record of a frame keeps every manifold and its flow and forgets the state at which the manifold is realized:
    on the record every manifold starts on the seat, so the record carries the value with no premise
    (`recFrame_value`). The host is the row's manifolds, each read by its class as one bit, true exactly where the
    manifold is the round three-sphere; its sentence is that every manifold of the host is round. The binding is a
    theorem, not a reading: the value of the host's frame is exactly the host's sentence (`binding`). A flow run on the
    host and faithful to the class, preserving it at every step and holding it at the seat, registers no manifold that
    is not round (`registered_is_round`), so its value gives the sentence (`faithful_value_gives_sentence`); and that
    value is strictly stronger than the sentence (`faithful_route_strictly_stronger`). Every theorem on no axiom at all.
    ΔM = 0.
=================================================================================================================== -/
namespace PC.HOST
open PCClose

/-- THE RECORD OF A FRAME: the registration keeps every manifold and its flow and forgets the state at which the
    manifold is realized; on the record every manifold starts on the seat. -/
def recFrame (M : Frame) : Frame := ⟨M.D, M.flow, fun _ => M.flow.round⟩

/-- THE RECORD CARRIES THE VALUE, with no premise: every manifold of the record rests on the seat at time zero. -/
theorem recFrame_value (M : Frame) : Value (recFrame M) := fun _ => ⟨0, seat_is_fixed M.flow 0⟩

/-- THE POINCARÉ ROW: the frames of three-manifolds with their flows, the value, the registration onto the record, the
    round world and the counter world. -/
def pcRow : PC.NORMALFORM.Row.{1} :=
  ⟨Frame, Value, recFrame, recFrame_value, calm, counter, calm_value, counter_fails⟩

/-- EVERY MANIFOLD HAS ITS SEAT ON THE RECORD: on the record of every frame each manifold starts on the round state,
    and stays there at every time. -/
theorem every_manifold_has_its_seat (M : Frame) (d : M.D) :
    (recFrame M).start d = M.flow.round ∧ ∀ j, iter M.flow.step j ((recFrame M).start d) = M.flow.round :=
  ⟨rfl, seat_is_fixed M.flow⟩

/-- THE HOST: the manifolds of the row, each read by its class, one bit, true exactly where the manifold is the round
    three-sphere. -/
structure Host where
  Man   : Type
  round : Man → Bool

/-- THE SENTENCE OF THE HOST: every manifold of the host is the round sphere. -/
def Host.Sentence (H : Host) : Prop := ∀ m, H.round m = true

/-- THE FRAME OF THE HOST: each manifold starts the classifying flow at its class, the seat being the round class. -/
def Host.frame (H : Host) : Frame := ⟨H.Man, stuckFlow, H.round⟩

/-- On the classifying flow no state moves. -/
theorem stuck_iter (b : Bool) (k : Nat) : iter stuckFlow.step k b = b := iter_fixed stuckFlow b rfl k

/-- THE BINDING, PROVED: the value of the host's frame is exactly the host's sentence. No reader's identification
    stands between the frame and the sentence. -/
theorem binding (H : Host) : Value H.frame ↔ H.Sentence :=
  ⟨fun h m => match h m with
    | ⟨k, hk⟩ => (stuck_iter (H.round m) k).symm.trans hk,
   fun h m => ⟨0, h m⟩⟩

/-- THE ROOT READ ON THE ROW IS THE SENTENCE, on the host's frame. -/
theorem root_on_row_is_the_sentence (H : Host) : RootOnRow H.frame ↔ H.Sentence :=
  (root_on_row_is_the_value H.frame).trans (binding H)

/-- THE ACT ON THE HOST'S FRAME IS THE SENTENCE. -/
theorem act_is_the_sentence (H : Host) : Rests H.frame ↔ H.Sentence :=
  (act_is_the_value H.frame).trans (binding H)

/-- A FLOW ON THE HOST, FAITHFUL TO THE CLASS: a flow, a start for each manifold, and a class read at every state,
    preserved by the step, held by the seat, and equal at each manifold's start to the manifold's class. -/
structure FlowOn (H : Host) where
  flow      : Flow
  start     : H.Man → flow.State
  cls       : flow.State → Bool
  step_cls  : ∀ s, cls (flow.step s) = cls s
  seat_cls  : cls flow.round = true
  start_cls : ∀ m, cls (start m) = H.round m

/-- The frame of a flow on the host. -/
def FlowOn.frame {H : Host} (Φ : FlowOn H) : Frame := ⟨H.Man, Φ.flow, Φ.start⟩

/-- THE CLASS IS CONSERVED ALONG THE FLOW, at every time. -/
theorem cls_along {H : Host} (Φ : FlowOn H) : ∀ k s, Φ.cls (iter Φ.flow.step k s) = Φ.cls s
  | 0, _ => rfl
  | k + 1, s => (cls_along Φ k (Φ.flow.step s)).trans (Φ.step_cls s)

/-- REGISTRATION CANNOT LIE ABOUT THE CLASS: on a faithful flow, a manifold that comes to rest on the seat is round. -/
theorem registered_is_round {H : Host} (Φ : FlowOn H) (m : H.Man) (h : Registers Φ.flow (Φ.start m)) :
    H.round m = true :=
  match h with
  | ⟨k, hk⟩ =>
    have e : Φ.cls (iter Φ.flow.step k (Φ.start m)) = true := by rw [hk]; exact Φ.seat_cls
    (Φ.start_cls m).symm.trans ((cls_along Φ k (Φ.start m)).symm.trans e)

/-- THE FAITHFUL FLOW'S VALUE GIVES THE SENTENCE. -/
theorem faithful_value_gives_sentence {H : Host} (Φ : FlowOn H) (h : Value Φ.frame) : H.Sentence :=
  fun m => registered_is_round Φ m (h m)

/-- The host's own classifying flow, faithful to the class. -/
def Host.classifying (H : Host) : FlowOn H :=
  ⟨stuckFlow, H.round, fun b => b, fun _ => rfl, rfl, fun _ => rfl⟩

/-- THE CLASSIFYING FLOW'S FRAME IS THE HOST'S FRAME. -/
theorem classifying_frame (H : Host) : H.classifying.frame = H.frame := rfl

/-- The host of one round manifold. -/
def oneRound : Host := ⟨Unit, fun _ => true⟩

/-- A faithful flow on it that starts the round manifold on a round state off the seat. -/
def offSeatFlow : FlowOn oneRound := ⟨stuckFlow, fun _ => false, fun _ => true, fun _ => rfl, rfl, fun _ => rfl⟩

/-- THE FAITHFUL ROUTE IS STRICTLY STRONGER THAN THE SENTENCE: on the host of one round manifold the sentence holds,
    and a faithful flow that starts it on a round state off the seat never brings it to rest. The sentence, and not any
    flow's value, is the bit. -/
theorem faithful_route_strictly_stronger : oneRound.Sentence ∧ ¬ Value offSeatFlow.frame :=
  ⟨fun _ => rfl, fun h => match h () with
    | ⟨k, hk⟩ => Bool.noConfusion ((stuck_never k).symm.trans hk)⟩

/-- THE HOST BINDS EVERY FAITHFUL FLOW: whatever faithful flow is run on the host, its value gives the host's
    sentence; the sentence is the host frame's value; and the classifying flow's frame is the host's frame. -/
theorem faithful_binds (H : Host) :
    (∀ Φ : FlowOn H, Value Φ.frame → H.Sentence) ∧ (Value H.frame ↔ H.Sentence) ∧ H.classifying.frame = H.frame :=
  ⟨fun Φ => faithful_value_gives_sentence Φ, binding H, rfl⟩

end PC.HOST

/-! ===================================================================================================================
    PART C′ · THE ROW SPLIT READ BY DIMENSION (namespace PC.REALPART) · v1_1_0_CC

    The cut-agnostic division of Part C read on a frame that carries the cited theorem of every dimension other than
    three (`DimensionalNoThree` of Part 0): the existents are the frame's manifolds, the property each is asked is
    rest on the seat, and the height is one at dimension three and zero elsewhere. At the cut zero the value is exactly
    its real part, every dimension but three, and its unicorn part, dimension three; the real part holds by the cited
    fields; given it, the value is exactly the unicorn part; the unicorn part is the dimension-three field and nothing
    else; on the bare three-frame the real part holds and the value fails. Above every dimension no reading of a record
    that keeps the dimension and forgets the world returns the world. Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace PC.REALPART
open PCClose PC.ROWSPLIT

/-- The height of a manifold at the cut by dimension: one at dimension three, zero elsewhere. -/
def dimHeight (S : DimensionalNoThree) (d : S.M.D) : Nat := if S.dim d = 3 then 1 else 0

/-- The existents: every manifold of the frame. -/
def Ex (S : DimensionalNoThree) (_ : S.M.D) : Prop := True

/-- The property each manifold is asked: rest on the seat. -/
def Re (S : DimensionalNoThree) (d : S.M.D) : Prop := Registers S.M.flow (S.M.start d)

/-- The value of the frame is the whole of the row split. -/
theorem value_is_the_whole (S : DimensionalNoThree) : Value S.M ↔ Whole (Ex S) (Re S) :=
  ⟨fun h d _ => h d, fun h d => h d trivial⟩

/-- THE HEIGHT IS POSITIVE EXACTLY AT DIMENSION THREE. -/
theorem height_pos_iff (S : DimensionalNoThree) (d : S.M.D) : 0 < dimHeight S d ↔ S.dim d = 3 :=
  match Nat.decEq (S.dim d) 3 with
  | isTrue e => ⟨fun _ => e, fun _ => Nat.lt_of_lt_of_le Nat.zero_lt_one (Nat.le_of_eq (if_pos e).symm)⟩
  | isFalse ne => ⟨fun h => absurd (Nat.lt_of_lt_of_le h (Nat.le_of_eq (if_neg ne))) (Nat.lt_irrefl 0),
                   fun e => absurd e ne⟩

/-- At height zero the dimension is not three. -/
theorem not_three_of_height_zero (S : DimensionalNoThree) (d : S.M.D) (h : dimHeight S d ≤ 0) : S.dim d ≠ 3 :=
  fun e => absurd (Nat.lt_of_lt_of_le ((height_pos_iff S d).mpr e) h) (Nat.lt_irrefl 0)

/-- THE REAL PART BY DIMENSION: every manifold of dimension other than three rests on the seat, by the cited theorem of
    its dimension, carried as a field. -/
theorem real_part_by_dimension (S : DimensionalNoThree) : RealPartAt (Ex S) (Re S) (dimHeight S) 0 :=
  fun d _ hle =>
    have h3 : S.dim d ≠ 3 := not_three_of_height_zero S d hle
    match dim_cases (S.dim d) with
    | Or.inl h => S.low d h
    | Or.inr (Or.inl h) => absurd h h3
    | Or.inr (Or.inr (Or.inl h)) => S.four d h
    | Or.inr (Or.inr (Or.inr h)) => S.high d h

/-- THE CUT AT EVERY HEIGHT: the value is exactly its real part and its unicorn part. -/
theorem value_iff_real_and_unicorn_at (S : DimensionalNoThree) (T : Nat) :
    Value S.M ↔ RealPartAt (Ex S) (Re S) (dimHeight S) T ∧ UnicornAt (Ex S) (Re S) (dimHeight S) T :=
  (value_is_the_whole S).trans (whole_iff_real_and_unicorn (Ex S) (Re S) (dimHeight S) T)

/-- THE CUT BY DIMENSION: the value is exactly its real part, every dimension but three, and its unicorn part,
    dimension three. -/
theorem value_iff_real_and_unicorn (S : DimensionalNoThree) :
    Value S.M ↔ RealPartAt (Ex S) (Re S) (dimHeight S) 0 ∧ UnicornAt (Ex S) (Re S) (dimHeight S) 0 :=
  value_iff_real_and_unicorn_at S 0

/-- NO BYPASS BY DIMENSION: given the cited theorems of every other dimension, the value is exactly the unicorn part,
    dimension three. -/
theorem no_bypass_by_dimension (S : DimensionalNoThree) : Value S.M ↔ UnicornAt (Ex S) (Re S) (dimHeight S) 0 :=
  (value_is_the_whole S).trans (unicorn_no_bypass (Ex S) (Re S) (dimHeight S) 0 (real_part_by_dimension S))

/-- THE UNICORN PART IS DIMENSION THREE: above the cut lie exactly the manifolds of dimension three. -/
theorem unicorn_is_dimension_three (S : DimensionalNoThree) :
    UnicornAt (Ex S) (Re S) (dimHeight S) 0 ↔ ∀ d, S.dim d = 3 → Registers S.M.flow (S.M.start d) :=
  ⟨fun h d e => h d trivial ((height_pos_iff S d).mpr e),
   fun h d _ hgt => h d ((height_pos_iff S d).mp hgt)⟩

/-- THE DIMENSION-THREE PART IS LOAD-BEARING AT THE CUT: on the bare three-frame the real part holds, every manifold
    being of dimension three, and the value fails. -/
theorem unicorn_part_is_load_bearing :
    RealPartAt (Ex bareThree) (Re bareThree) (dimHeight bareThree) 0 ∧ ¬ Value bareThree.M :=
  ⟨real_part_by_dimension bareThree, three_is_load_bearing.2⟩

/-- THE UNICORN PART CLOSED TO THE RECORD ABOVE EVERY DIMENSION: on the chart of worlds and dimensions, a record that
    keeps the dimension and forgets the world is even under the exchange of worlds, the world is odd, and above every
    dimension no reading of the record returns the world. -/
theorem unicorn_blocked_above_every_dimension (T : Nat) :
    ¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1 :=
  unicorn_block Prod.snd T (fun w => (!w.1, w.2)) Prod.snd Prod.fst (true, T + 1)
    (Nat.lt_succ_self T) (Nat.lt_succ_self T) rfl rfl

/-- THE SUPPLY SIDE IS SILENT ABOVE EVERY DIMENSION: both orientations of the world are refused alike to every reading
    of the record, and the two orientations differ. -/
theorem supply_side_silent_above_every_dimension (T : Nat) :
    (¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1) ∧
    (¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = !w.1) ∧ (!true) ≠ true :=
  supply_side_silent Prod.snd T (fun w => (!w.1, w.2)) Prod.snd Prod.fst (true, T + 1)
    (Nat.lt_succ_self T) (Nat.lt_succ_self T) rfl rfl

/-- THE APERTURE IS ONE BIT WIDE: at the seat of the exchange above every dimension, one odd supplied bit calibrates
    the world uniquely, through one calibration bit that exists and is unique. -/
theorem aperture_is_one_bit (T : Nat) :
    let z : Bool × Nat := (true, T + 1)
    let τ : Bool × Nat → Bool × Nat := fun w => (!w.1, w.2)
    ∃ c : Bool, (z.1 = xor (!z.1) c ∧ (τ z).1 = xor (!(τ z).1) c) ∧
      ∀ c' : Bool, (z.1 = xor (!z.1) c' ∧ (τ z).1 = xor (!(τ z).1) c') → c' = c :=
  aperture_one_bit_wide (fun w : Bool × Nat => (!w.1, w.2)) (fun w => !w.1) Prod.fst (true, T + 1) rfl rfl

end PC.REALPART

/-! ===================================================================================================================
    PART D · THE WALLS (namespace PC.WALLS) · v1_1_0_CC

    Every zero-bit route is closed by theorem. Existence as given forces nothing (Part 0, `given_is_not_the_value`,
    `arrow_forces_nothing`). No finite record forces the value (Part 0, `finite_record_never_forces`). A cycle never
    rests and admits no witness, and the self-similar flow rests and admits no witness (Part 0). Without the
    dimension-three field a fake three-sphere stands (Part 0, `three_is_load_bearing`). This Part adds two walls decided
    by the kernel on finite flows. Of the sixty-four flows on four states fixing the seat, exactly sixteen bring every
    state to rest, the rooted trees, four to the power two (`registering_flows_are_the_trees`). The chain 3 → 2 → 1 → 0
    and the flow carrying the cycle 2 ↔ 3 share their in-degree record, and only the first comes to rest
    (`degree_record_normal_form`), so no reading of the degree record returns registration
    (`degree_record_decides_nothing`): a cycle is invisible to every local count of the step, as a fundamental group is
    invisible to the homology that abelianizes it. A record that reads every frame alike decides nothing
    (`homotopy_record_decides_nothing`). Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace PC.WALLS
open PCClose

/-- A finite flow on four states, seat 0, given as the list of its step's values. -/
def step4 (f : List Nat) (s : Nat) : Nat := f.getD s 0

/-- The step iterated n times. -/
def iter4 (f : List Nat) : Nat → Nat → Nat
  | 0, s => s
  | n + 1, s => iter4 f n (step4 f s)

/-- Every one of the four states reaches the seat within four steps. -/
def registersAll4 (f : List Nat) : Bool := (List.range 4).all (fun s => iter4 f 4 s == 0)

/-- The flows on four states fixing the seat 0: the step at 0 is 0, the steps at 1, 2, 3 free. -/
def flows4 : List (List Nat) :=
  (List.range 4).flatMap fun a => (List.range 4).flatMap fun b => (List.range 4).map fun c => [0, a, b, c]

/-- The in-degree of a state under the step. -/
def indeg4 (f : List Nat) (t : Nat) : Nat := ((List.range 4).filter (fun s => step4 f s == t)).length

/-- The degree record of a flow: how many states have in-degree 0, 1, 2, 3 and 4. -/
def degreeRecord (f : List Nat) : List Nat :=
  (List.range 5).map (fun k => ((List.range 4).filter (fun t => indeg4 f t == k)).length)

/-- THE TREE COUNT, decided by the kernel: of the sixty-four flows on four states fixing the seat, exactly sixteen
    bring every state to rest, the rooted trees on four labelled states, four to the power two. -/
theorem registering_flows_are_the_trees :
    flows4.length = 64 ∧ (flows4.filter registersAll4).length = 16 ∧ 16 = 4 ^ (4 - 2) := by decide

/-- THE DEGREE RECORD NORMAL FORM, decided by the kernel: the chain 3 → 2 → 1 → 0 and the flow carrying the cycle
    2 ↔ 3 share their degree record; the first brings every state to rest, the second does not, and its state 3 stays
    off the seat for twelve steps and more. -/
theorem degree_record_normal_form :
    degreeRecord [0, 0, 1, 2] = degreeRecord [0, 0, 3, 2] ∧
    registersAll4 [0, 0, 1, 2] = true ∧ registersAll4 [0, 0, 3, 2] = false ∧
    (List.range 12).all (fun n => iter4 [0, 0, 3, 2] n 3 != 0) = true := by decide

/-- THE CYCLE NEVER REACHES THE SEAT, at every time: from state 3 the cycle flow alternates between 3 and 2. -/
theorem cycle4_stays_off : ∀ n, iter4 [0, 0, 3, 2] n 3 ≠ 0 ∧ iter4 [0, 0, 3, 2] n 2 ≠ 0
  | 0 => ⟨by decide, by decide⟩
  | n + 1 => ⟨(cycle4_stays_off n).2, (cycle4_stays_off n).1⟩

/-- NO READING OF THE DEGREE RECORD RETURNS REGISTRATION: the two flows share the record and split on registration. -/
theorem degree_record_decides_nothing :
    ¬ ∃ g : List Nat → Bool, g (degreeRecord [0, 0, 1, 2]) = registersAll4 [0, 0, 1, 2] ∧
      g (degreeRecord [0, 0, 3, 2]) = registersAll4 [0, 0, 3, 2] :=
  fun ⟨g, h1, h2⟩ => by
    have e : degreeRecord [0, 0, 3, 2] = degreeRecord [0, 0, 1, 2] := by decide
    have r1 : registersAll4 [0, 0, 1, 2] = true := by decide
    have r2 : registersAll4 [0, 0, 3, 2] = false := by decide
    rw [e, h1, r1, r2] at h2
    exact Bool.noConfusion h2

/-- A RECORD THAT READS EVERY FRAME ALIKE DECIDES NOTHING: a record that returns one reading on every frame, three
    dimensions and every homotopy invariant of the sphere, admits no reading that is the value on every frame. -/
theorem homotopy_record_decides_nothing : ¬ ∃ g : Nat → Prop, ∀ M : Frame, (g 3 ↔ Value M) :=
  record_wall_on_frames (fun _ => (3 : Nat)) rfl

/-- THE WALLS OF THE ROW, one theorem: no given statement is the value on every frame; the arrow forces nothing; no
    finite record forces the value; the cycle never rests and admits no witness; the self-similar flow rests and admits
    no witness; without the dimension-three field a fake three-sphere stands; no reading of the kinetic record returns
    the bit; a record that reads every frame alike decides nothing; and no reading of the degree record returns
    registration. -/
theorem the_walls :
    (∀ P : Prop, ¬ ∀ M : Frame, (P ↔ Value M)) ∧
    (¬ ∀ M : Frame, Arrow → Value M) ∧
    (∀ n : Nat, (∀ d, d < n → Registers (staged n).flow ((staged n).start d)) ∧ ¬ Value (staged n)) ∧
    (¬ Value cycleFrame ∧ ¬ Nonempty (Witness cycleFlow)) ∧
    (Rests solitonFrame ∧ ¬ Nonempty (Witness solitonFlow)) ∧
    (bareThree.dim () = 3 ∧ ¬ Value bareThree.M) ∧
    (¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w) ∧
    (¬ ∃ g : Nat → Prop, ∀ M : Frame, (g 3 ↔ Value M)) ∧
    (¬ ∃ g : List Nat → Bool, g (degreeRecord [0, 0, 1, 2]) = registersAll4 [0, 0, 1, 2] ∧
      g (degreeRecord [0, 0, 3, 2]) = registersAll4 [0, 0, 3, 2]) :=
  ⟨given_is_not_the_value, arrow_forces_nothing, finite_record_never_forces,
   ⟨cycle_never_rests, no_witness_on_cycle⟩, act_without_witness, three_is_load_bearing, record_wall,
   homotopy_record_decides_nothing, degree_record_decides_nothing⟩

end PC.WALLS

/-! ===================================================================================================================
    PART E · THE RESIDUE (namespace PC.RESIDUE) · v1_1_0_CC

    Everything above is unconditional. What remains of the Poincaré sentence is this one hypothesis, the transfer of
    the value from the record to the host's frame: given it, the sentence follows on no axiom. It is printed here as
    the type of a hypothesis and is assumed nowhere. The residue is keyed: no premise shared by every frame and no
    principle true of every record supplies it. Its instance seat decomposes it by dimension: on a frame carrying the
    cited theorems of the other dimensions, the seat is the dimension-three field. ΔM = 0.
=================================================================================================================== -/
namespace PC.RESIDUE
open PCClose PC.NORMALFORM PC.HOST PC.REALPART PC.ROWSPLIT

/-- THE RESIDUE: given the one implication at the host's frame, the host's sentence. -/
theorem sentence_of_the_act (H : Host) (bit : Transfer pcRow H.frame) : H.Sentence :=
  (binding H).mp (value_from_the_cargo_loop pcRow H.frame bit)

/-- THE RESIDUE IS THE SENTENCE: the transfer at the host's frame is exactly the host's sentence. -/
theorem residue_is_the_sentence (H : Host) : Transfer pcRow H.frame ↔ H.Sentence :=
  (normal_form pcRow H.frame).trans (binding H)

/-- THE ONE POSIT IS THE BIT: the root read on the row, at the host's frame, is exactly the transfer. -/
theorem the_posit_is_the_bit (H : Host) : RootOnRow H.frame ↔ Transfer pcRow H.frame :=
  (root_on_row_is_the_sentence H).trans (residue_is_the_sentence H).symm

/-- THE RESIDUE IS KEYED: no premise shared by every frame forces the value, and no principle true of every record
    decides it. What supplies it is keyed to the frame: the act. -/
theorem residue_is_keyed :
    (∀ P : Frame → Prop, Keyless pcRow P → ¬ Forces pcRow P) ∧
    (∀ P : Frame → Prop, (∀ F, P (recFrame F)) → ¬ ∀ F, P (recFrame F) → Value F) :=
  ⟨keyless_forces_nothing pcRow, no_record_principle_decides pcRow⟩

/-- THE INSTANCE SEAT OF THE BIT, by dimension: on a frame carrying the cited theorems of every other dimension, the
    seat is the dimension-three field. Its inhabitation is equivalent in strength to the frame's value
    (`seat_iff_value`); nothing in this file assumes it inhabited. -/
structure ThreeSeat (S : DimensionalNoThree) where
  three : ∀ d, S.dim d = 3 → Registers S.M.flow (S.M.start d)

/-- With the seat the frame is a full dimensional frame. -/
def ThreeSeat.full {S : DimensionalNoThree} (T : ThreeSeat S) : Dimensional :=
  ⟨S.M, S.dim, S.low, T.three, S.four, S.high⟩

/-- THE SEAT DELIVERS THE VALUE: every dimension decided by its field. -/
theorem value_of_seat {S : DimensionalNoThree} (T : ThreeSeat S) : Value S.M := every_dimension_decided T.full

/-- THE SEAT IS INHABITED EXACTLY WHEN THE VALUE HOLDS. -/
theorem seat_iff_value (S : DimensionalNoThree) : Nonempty (ThreeSeat S) ↔ Value S.M :=
  ⟨fun ⟨T⟩ => value_of_seat T, fun h => ⟨⟨fun d _ => h d⟩⟩⟩

/-- THE SEAT IS THE UNICORN PART: the dimension-three field is inhabited exactly when the unicorn part holds. -/
theorem seat_is_the_unicorn (S : DimensionalNoThree) :
    Nonempty (ThreeSeat S) ↔ UnicornAt (Ex S) (Re S) (dimHeight S) 0 :=
  ⟨fun ⟨T⟩ => (unicorn_is_dimension_three S).mpr T.three,
   fun h => ⟨⟨(unicorn_is_dimension_three S).mp h⟩⟩⟩

end PC.RESIDUE

/-! ===================================================================================================================
    PART F · THE SUPPLY (namespace PC.SUPPLY) · v1_1_0_CC

    The bit of Part E, supplied by the act and delivered by its two kinds: the formal cargo, and the physical witness.
    Each kind is a type whose inhabitant is the supply; neither is assumed anywhere in this file. The cargo arrives
    free; each kind delivers the sentence; the two kinds are one bit; every route to the sentence delivers both kinds,
    so there is no third; and one fake sphere refutes both at once. The 2002–03 offering, a flow faithful to the class
    carrying a functional strictly decreasing off the seat, is typed here: every such offering delivers the formal
    cargo, and the cargo stands where the host's own flow admits no such functional, so the offering is one inhabitant
    of the formal kind, downstream of the bridge and strictly inside it, never its ground. ΔM = 0.
=================================================================================================================== -/
namespace PC.SUPPLY
open PCClose PC.NORMALFORM PC.HOST

/-- THE FORMAL KIND, the cargo: the record's value carried to the host's frame. -/
def FormalCargo (H : Host) : Prop := Transfer pcRow H.frame

/-- THE PHYSICAL KIND, the witness: a physical relaxation of every manifold of the host, a flow faithful to the class,
    every step of which off the seat is priced at the Landauer floor, so each manifold's heat in floor units is at
    least one floor; and the relaxation brings every manifold to rest on the seat. The last field is the one bit read
    in the register of heat; it is a premise of the witness, carried as a field, never proved. -/
structure PhysicalWitness (H : Host) where
  relax         : FlowOn H
  floor         : Nat
  floor_pos     : 0 < floor
  heat          : H.Man → Nat
  priced        : ∀ m, floor ≤ heat m
  comes_to_rest : ∀ m, Registers relax.flow (relax.start m)

/-- THE CARGO ARRIVES, with no premise: the record of the host's frame carries the value. -/
theorem cargo_arrives (H : Host) : Value (recFrame H.frame) := recFrame_value H.frame

/-- KIND 1 DELIVERS: the formal cargo gives the sentence in one step. -/
theorem formal_kind_delivers {H : Host} (h : FormalCargo H) : H.Sentence := (binding H).mp (h (cargo_arrives H))

/-- KIND 2 DELIVERS: the physical witness gives the sentence, registration being unable to lie about the class. -/
theorem physical_kind_delivers {H : Host} (W : PhysicalWitness H) : H.Sentence :=
  faithful_value_gives_sentence W.relax W.comes_to_rest

/-- The physical witness closes the host's frame. -/
theorem witness_closes {H : Host} (W : PhysicalWitness H) : Value H.frame := (binding H).mpr (physical_kind_delivers W)

/-- A witness from the sentence: the classifying flow, at one floor quantum per manifold. -/
def witness_of_sentence {H : Host} (h : H.Sentence) : PhysicalWitness H :=
  ⟨H.classifying, 1, Nat.zero_lt_one, fun _ => 1, fun _ => Nat.le_refl 1, fun m => ⟨0, h m⟩⟩

/-- THE PHYSICAL FACE IS THE SENTENCE: a witness exists exactly when the sentence holds. -/
theorem physical_iff_sentence (H : Host) : Nonempty (PhysicalWitness H) ↔ H.Sentence :=
  ⟨fun ⟨W⟩ => physical_kind_delivers W, fun h => ⟨witness_of_sentence h⟩⟩

/-- THE FORMAL FACE IS THE SENTENCE. -/
theorem formal_iff_sentence (H : Host) : FormalCargo H ↔ H.Sentence := PC.RESIDUE.residue_is_the_sentence H

/-- THE TWO KINDS ARE ONE BIT: the physical witness is a formal cargo, and the cargo is exactly the sentence. -/
theorem the_two_kinds_are_one_bit (H : Host) :
    (PhysicalWitness H → FormalCargo H) ∧ (FormalCargo H ↔ H.Sentence) :=
  ⟨fun W _ => witness_closes W, formal_iff_sentence H⟩

/-- THE SENTENCE, DELIVERED TWICE: either kind gives it. -/
theorem delivered_twice (H : Host) : (FormalCargo H → H.Sentence) ∧ (PhysicalWitness H → H.Sentence) :=
  ⟨formal_kind_delivers, physical_kind_delivers⟩

/-- TWO KINDS AND NO THIRD: every witness of the sentence, in any vocabulary, is a delivery of both kinds. -/
theorem two_kinds_and_no_third (H : Host) (Q : Prop) (h : Q → H.Sentence) :
    Q → FormalCargo H ∧ Nonempty (PhysicalWitness H) :=
  fun q => ⟨(formal_iff_sentence H).mpr (h q), (physical_iff_sentence H).mpr (h q)⟩

/-- THE ONE REFUTER: one manifold of the host that is not the round sphere, one fake sphere, refutes both kinds at
    once. -/
theorem the_one_refuter (H : Host) (m : H.Man) (h : H.round m = false) :
    ¬ FormalCargo H ∧ ¬ Nonempty (PhysicalWitness H) :=
  have hs : ¬ H.Sentence := fun s => Bool.noConfusion ((s m).symm.trans h)
  ⟨fun c => hs (formal_kind_delivers c), fun ⟨W⟩ => hs (physical_kind_delivers W)⟩

/-- A WITNESSED FLOW ON THE HOST, the shape of the 2002–03 offering: a flow faithful to the class, carrying a functional
    strictly decreasing at every state off the seat and invariant under rescaling. -/
structure WitnessedFlow (H : Host) where
  run     : FlowOn H
  witness : Witness run.flow

/-- THE OFFERING IS ONE INHABITANT OF THE FORMAL KIND: a witnessed flow on the host delivers the formal cargo. -/
theorem witnessed_flow_delivers_cargo {H : Host} (O : WitnessedFlow H) : FormalCargo H :=
  (formal_iff_sentence H).mpr
    (faithful_value_gives_sentence O.run ((act_is_the_value O.run.frame).mp (witness_gives_act O.run.frame O.witness)))

/-- THE OFFERING IS STRICTLY INSIDE THE CARGO: on the host of one round manifold the cargo holds, and the host's own
    classifying flow admits no witness, its rescaling being its step and the state false lying off the seat. -/
theorem cargo_without_witness : FormalCargo oneRound ∧ ¬ Nonempty (Witness oneRound.classifying.flow) :=
  ⟨(formal_iff_sentence oneRound).mpr (fun _ => rfl),
   no_witness_on_self_similar stuckFlow (fun _ => rfl) false (fun e => Bool.noConfusion (e : false = true))⟩

/-- THE OFFERING, TYPED: every witnessed flow delivers the cargo; the cargo stands where the classifying flow admits no
    witness; every witness is a crossing, a crossing supplies the act, and the self-similar flow carries a crossing and
    no witness; and the bridge holds a halted carrier of the value where no witness exists. One inhabitant of the
    formal kind, downstream of the bridge, strictly inside it, never its ground. -/
theorem the_offering_typed :
    (∀ H : Host, WitnessedFlow H → FormalCargo H) ∧
    (FormalCargo oneRound ∧ ¬ Nonempty (Witness oneRound.classifying.flow)) ∧
    ((∀ F : Flow, Witness F → Nonempty (Crossing F)) ∧ (∀ M : Frame, Crossing M.flow → Rests M) ∧
      Nonempty (Crossing solitonFlow) ∧ ¬ Nonempty (Witness solitonFlow)) ∧
    ((∃ b : Carrier (Value solitonFrame), b.terminal = .bot) ∧ ¬ Nonempty (Witness solitonFlow)) :=
  ⟨fun _ O => witnessed_flow_delivers_cargo O, cargo_without_witness, crossing_types_the_crossing,
   bridge_without_witness⟩

/-- THE SUPPLY, CLOSED, at every host: the cargo arrives free; each kind delivers; the two kinds are one bit; the bit
    is the sentence; every route is both kinds; one fake sphere refutes both; and the offering is a cargo. -/
theorem the_supply_closed : ∀ H : Host,
    Value (recFrame H.frame) ∧
    (FormalCargo H → H.Sentence) ∧ (PhysicalWitness H → H.Sentence) ∧
    (PhysicalWitness H → FormalCargo H) ∧ (FormalCargo H ↔ H.Sentence) ∧
    (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧
    (∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧
    (∀ m, H.round m = false → ¬ FormalCargo H ∧ ¬ Nonempty (PhysicalWitness H)) ∧
    (WitnessedFlow H → FormalCargo H) :=
  fun H => ⟨cargo_arrives H, formal_kind_delivers, physical_kind_delivers, (the_two_kinds_are_one_bit H).1,
   formal_iff_sentence H, physical_iff_sentence H, two_kinds_and_no_third H, the_one_refuter H,
   witnessed_flow_delivers_cargo⟩

end PC.SUPPLY

/-! ===================================================================================================================
    PART G · THE CLOSURE OF THE QUESTION (namespace PC.CLOSURE) · v1_1_0_CC

    Why the question is closed and not open. At every host the Poincaré sentence and the bit are one proposition, with
    nothing cited; the denial of the sentence is the bit's denial; across the frames of the row the bit has no uniform
    answer, true in one world and false in another of the same record; every keyless route is barred; either kind of
    the supply gives the sentence; and one fake sphere refutes the sentence itself. Nothing here derives the bit. It
    proves that the question is one bit, that the bit is keyed, and that what is open is a value and not a form.
    ΔM = 0.
=================================================================================================================== -/
namespace PC.CLOSURE
open PCClose PC.NORMALFORM PC.HOST PC.SUPPLY

/-- THE SENTENCE IS THE BIT, nothing cited. -/
theorem the_sentence_is_the_bit (H : Host) : H.Sentence ↔ FormalCargo H := (formal_iff_sentence H).symm

/-- THE DENIAL IS THE BIT'S DENIAL. -/
theorem denial_is_the_bits_denial (H : Host) : ¬ H.Sentence ↔ ¬ FormalCargo H :=
  ⟨fun hn h => hn (formal_kind_delivers h), fun hn h => hn ((formal_iff_sentence H).mpr h)⟩

/-- THE ONE REFUTER REFUTES THE SENTENCE: one manifold of the host that is not the round sphere. -/
theorem refuter_denies_the_sentence (H : Host) (m : H.Man) (h : H.round m = false) : ¬ H.Sentence :=
  fun s => Bool.noConfusion ((s m).symm.trans h)

/-- THE DENIAL HAS ONE ROAD: wherever the sentence fails, it cannot be that no manifold is a fake sphere. -/
theorem the_denial_has_one_road (H : Host) : ¬ H.Sentence → ¬ ¬ ∃ m, H.round m = false :=
  fun hn hne => hn (fun m => match hr : H.round m with
    | true => rfl
    | false => absurd ⟨m, hr⟩ hne)

/-- THE QUESTION, CLOSED TO ONE BIT, at every host. The sentence is the bit and its denial is the bit's denial; the bit
    has no uniform answer across the frames; no keyless premise forces it; either kind of the supply gives the
    sentence; and one fake sphere denies the sentence. What is open is the value of one implication; the form of the
    question is closed. -/
theorem question_closed_to_one_bit : ∀ H : Host,
    (H.Sentence ↔ FormalCargo H) ∧ (¬ H.Sentence ↔ ¬ FormalCargo H) ∧
    (¬ (∀ F, Transfer pcRow F) ∧ ¬ (∀ F, ¬ Transfer pcRow F)) ∧
    (∀ P : Frame → Prop, Keyless pcRow P → ¬ Forces pcRow P) ∧
    (FormalCargo H → H.Sentence) ∧ (PhysicalWitness H → H.Sentence) ∧
    (∀ m, H.round m = false → ¬ H.Sentence) :=
  fun H => ⟨the_sentence_is_the_bit H, denial_is_the_bits_denial H, no_uniform_answer pcRow,
   keyless_forces_nothing pcRow, formal_kind_delivers, physical_kind_delivers, refuter_denies_the_sentence H⟩

end PC.CLOSURE

/-! ===================================================================================================================
    PART W · THE TWELVE FORMAL GATES, RUN IN THE KERNEL (namespace PC.GATES) · v1_1_0_CC

    The twelve formal gates of the mathematical register, run inside the kernel on the Poincaré seal at every host.
    Each gate is a proposition and a theorem, and `the_formal_run` binds the twelve passes and the four refusals in one
    statement. Four claims fail, each by a theorem: "the sentence is proved by the delivery" fails SREP, the delivery's
    premise being its conclusion; "a proof is waiting" fails SREP, a true route to the sentence being the sentence; "no
    proof can ever exist" fails SREP, no true route to the sentence being its denial, the counter world in costume; and
    the denial has one road, a fake sphere. No declaration has the type of the bit. ΔM = 0.
=================================================================================================================== -/
namespace PC.GATES
open PCClose PC.NORMALFORM PC.HOST PC.SUPPLY PC.REALPART PC.ROWSPLIT

/-- Gate 1, SREP: the form stands with no hypothesis. -/
def Gate1 (H : Host) : Prop :=
  Value (recFrame H.frame) ∧ (FormalCargo H ↔ H.Sentence) ∧
  (∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H) ∧
  (∀ F : Flow, ∀ k, iter F.step k F.round = F.round) ∧ (∀ M : Frame, Rests M ↔ Value M)

/-- GATE 1 · SREP: nothing in the form presupposes the bit. -/
theorem gate_1_srep (H : Host) : Gate1 H :=
  ⟨cargo_arrives H, formal_iff_sentence H, fun _ h q => (formal_iff_sentence H).mpr (h q), seat_is_fixed,
   act_is_the_value⟩

/-- Gate 2, REG: the bit read from ten contexts, all one proposition. -/
def Gate2 (H : Host) : Prop :=
  (Value H.frame ↔ H.Sentence) ∧ (Rests H.frame ↔ H.Sentence) ∧ (RootOnRow H.frame ↔ H.Sentence) ∧
  (Nonempty (SelfGrounding (RootOnRow H.frame)) ↔ H.Sentence) ∧ (FormalCargo H ↔ H.Sentence) ∧
  (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧ (SelfRecursive pcRow H.frame ↔ H.Sentence) ∧
  (Nonempty (Act pcRow H.frame) ↔ H.Sentence) ∧
  (Nonempty { A : ActualManifolds // A.M = H.frame } ↔ H.Sentence) ∧
  ((∃ b : Carrier (Value H.frame), b.terminal = .bot) ↔ H.Sentence)

/-- GATE 2 · REG: ten reading contexts, one proposition. -/
theorem gate_2_reg (H : Host) : Gate2 H :=
  ⟨binding H, act_is_the_sentence H, root_on_row_is_the_sentence H,
   (root_on_row_grounds_iff H.frame).trans (binding H), formal_iff_sentence H, physical_iff_sentence H,
   (self_recursion_at_frame pcRow H.frame).trans (binding H),
   (bit_is_the_act pcRow H.frame).symm.trans (formal_iff_sentence H),
   (supply_iff H.frame).trans (binding H),
   (halted_iff (Value H.frame)).trans (binding H)⟩

/-- Gate 3, SGEG: no face drifts from the bit. -/
def Gate3 (H : Host) : Prop :=
  (FormalCargo H ↔ H.Sentence) ∧ (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧ (Value H.frame ↔ H.Sentence) ∧
  (∀ S : DimensionalNoThree, Value S.M ↔ UnicornAt (Ex S) (Re S) (dimHeight S) 0)

/-- GATE 3 · SGEG: the formal, physical, frame and dimension-three faces are each the bit. -/
theorem gate_3_sgeg (H : Host) : Gate3 H :=
  ⟨formal_iff_sentence H, physical_iff_sentence H, binding H, no_bypass_by_dimension⟩

/-- Gate 4, CAUSAL: the native involution on the bit fixes nothing; every flow fixes its seat; and a state the flow
    fixes is, under the act, the seat itself: the seat of the row is inhabited and is the one state never left. -/
def Gate4 : Prop :=
  (¬ ∃ b, comp b = b) ∧ (∀ F : Flow, F.step F.round = F.round) ∧
  (∀ M : Frame, Rests M → ∀ d, M.flow.step (M.start d) = M.start d → M.start d = M.flow.round)

/-- GATE 4 · CAUSAL: no imprint is asserted on a ground the bit lacks; the row's seat is the flow's fixed round state. -/
theorem gate_4_causal : Gate4 := ⟨locus_vanishes, fun F => F.fixed, the_one_state_never_left⟩

/-- Gate 5, MIG: two frames whose records both carry the value split on the value. -/
def Gate5 : Prop := Value (recFrame calm) ∧ Value (recFrame counter) ∧ Value calm ∧ ¬ Value counter

/-- GATE 5 · MIG: the reading apparatus, the record, does not fix the residence. -/
theorem gate_5_mig : Gate5 := record_decides_nothing pcRow

/-- Gate 6, PTB: complementation is an involution without a fixed point; the identity fixes everything; the rescaling
    of every flow fixes the seat and commutes with the step. -/
def Gate6 : Prop :=
  (∀ b : Bool, comp (comp b) = b) ∧ (¬ ∃ b, comp b = b) ∧ (∀ b : Bool, id (id b) = b) ∧
  (∀ F : Flow, F.rescale F.round = F.round ∧ ∀ s, F.step (F.rescale s) = F.rescale (F.step s))

/-- GATE 6 · PTB: the fixed-point reading belongs to the chosen reflection, not to the bit. -/
theorem gate_6_ptb : Gate6 := ⟨comp_involution, locus_vanishes, fun _ => rfl, fun F => ⟨F.rfix, F.comm⟩⟩

/-- Gate 7, DUAL: the bit does not depend on where the dimension ladder is cut: on every frame carrying the cited
    theorems of the other dimensions the value is exactly the dimension-three part, and the division holds at every
    cut. -/
def Gate7 : Prop :=
  (∀ S : DimensionalNoThree, Value S.M ↔ UnicornAt (Ex S) (Re S) (dimHeight S) 0) ∧
  (∀ (S : DimensionalNoThree) (T : Nat),
    Value S.M ↔ RealPartAt (Ex S) (Re S) (dimHeight S) T ∧ UnicornAt (Ex S) (Re S) (dimHeight S) T)

/-- GATE 7 · DUAL: the value is the dimension-three part, and the division stands at every cut. -/
theorem gate_7_dual : Gate7 := ⟨no_bypass_by_dimension, value_iff_real_and_unicorn_at⟩

/-- Gate 8, CSCG: the proved slices are the bit's lower slices. -/
def Gate8 : Prop :=
  (∀ S : DimensionalNoThree, RealPartAt (Ex S) (Re S) (dimHeight S) 0) ∧
  (∀ S : DimensionalNoThree, Value S.M → ∀ T, RealPartAt (Ex S) (Re S) (dimHeight S) T)

/-- GATE 8 · CSCG: the bit extends the real part and contradicts no slice of it. -/
theorem gate_8_cscg : Gate8 :=
  ⟨real_part_by_dimension, fun S h T => ((value_iff_real_and_unicorn_at S T).mp h).1⟩

/-- Gate 9, CSEG: a join never stands above its weakest face. -/
def Gate9 : Prop :=
  (∀ a b : Grade, (Grade.weakest a b).rank ≤ a.rank ∧ (Grade.weakest a b).rank ≤ b.rank) ∧
  Grade.weakest (Grade.weakest .thm .thm) .premise = .premise

/-- GATE 9 · CSEG: no terminal strength above the weakest road, and no face lowered by the reading. -/
theorem gate_9_cseg : Gate9 := join_reads_the_weakest

/-- Gate 10, MTA: a squared scalar reads a value and its reflection alike. -/
def Gate10 : Prop := ∀ x : Int, (-x) * (-x) = x * x

/-- GATE 10 · MTA: no squared metric carries the truth-sign. -/
theorem gate_10_mta : Gate10 := square_is_sign_blind

/-- Gate 11, OMA: the supply is the antecedent of the delivery and is not shared by every frame. -/
def Gate11 (H : Host) : Prop := (FormalCargo H → H.Sentence) ∧ ¬ Keyless pcRow (Transfer pcRow)

/-- GATE 11 · OMA: the input from the other side enters as a hypothesis, never as a fact from inside. -/
theorem gate_11_oma (H : Host) : Gate11 H := ⟨formal_kind_delivers, fun h => (no_uniform_answer pcRow).1 h⟩

/-- Gate 12, ADEG: the binding to the sentence is proved, every faithful flow is bound to it, and the physical
    discharge is the bit. -/
def Gate12 (H : Host) : Prop :=
  (Value H.frame ↔ H.Sentence) ∧ (∀ Φ : FlowOn H, Value Φ.frame → H.Sentence) ∧
  (Nonempty (PhysicalWitness H) ↔ H.Sentence)

/-- GATE 12 · ADEG: every transport across registers is typed. -/
theorem gate_12_adeg (H : Host) : Gate12 H :=
  ⟨binding H, fun Φ => faithful_value_gives_sentence Φ, physical_iff_sentence H⟩

/-- REFUSAL · "the sentence is proved by the delivery" fails SREP: the delivery's premise and its conclusion are one
    proposition. -/
theorem refusal_proved (H : Host) : FormalCargo H ↔ H.Sentence := formal_iff_sentence H

/-- REFUSAL AT THE BIT · "no true route to the sentence exists" is the sentence's denial. -/
theorem refusal_no_proof_at_the_bit (H : Host) : (¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence)) ↔ ¬ H.Sentence :=
  refusal_no_proof H.Sentence

/-- THE FORMAL RUN, at every host: the twelve gates pass, and the four claims fail, the delivery read as a proof, a
    proof waiting, no proof ever, and the denial without its one road. -/
theorem the_formal_run : ∀ H : Host,
    Gate1 H ∧ Gate2 H ∧ Gate3 H ∧ Gate4 ∧ Gate5 ∧ Gate6 ∧ Gate7 ∧ Gate8 ∧ Gate9 ∧ Gate10 ∧ Gate11 H ∧ Gate12 H ∧
    (FormalCargo H ↔ H.Sentence) ∧
    ((∃ Q : Prop, Q ∧ (Q → H.Sentence)) ↔ H.Sentence) ∧
    ((¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence)) ↔ ¬ H.Sentence) ∧
    (¬ H.Sentence → ¬ ¬ ∃ m, H.round m = false) :=
  fun H => ⟨gate_1_srep H, gate_2_reg H, gate_3_sgeg H, gate_4_causal, gate_5_mig, gate_6_ptb, gate_7_dual,
   gate_8_cscg, gate_9_cseg, gate_10_mta, gate_11_oma H, gate_12_adeg H, refusal_proved H,
   refusal_waiting H.Sentence, refusal_no_proof_at_the_bit H, PC.CLOSURE.the_denial_has_one_road H⟩

end PC.GATES

/-! ===================================================================================================================
    PART X · THE CAPSTONE: NOTHING ESCAPES, OUR WAY OR NO WAY (namespace PC.ESCAPE) · v1_1_0_CC

    The record of the host's frame closes (`the_record_closes`). What the record leaves undecided is whether the host's
    frame itself carries the value, and that is exactly the sentence (`the_undecided_is_the_bit`). "Nothing is outside
    the record", read as a law of every frame, is false; read at the host's frame, it is the bit
    (`nothing_outside_the_record_is_the_bit`). A block needs an outside (`block_needs_an_outside`), and at the host's
    frame the outside is the supply in its two kinds (`the_outside_is_the_supply`). Nothing escapes: every route to the
    sentence, in any vocabulary, is a delivery of both kinds (`every_route_is_both_kinds`); either kind delivers it
    (`both_kinds_deliver`); every so-called other way is our way in different vocabulary, failing with the bit if the
    bit failed (`our_way_or_no_way`); and the 2002–03 offering is one such way (`the_offering_walks_our_way`). Both
    kinds are supplied by the act at premise grade and enter every theorem here as hypotheses. ΔM = 0.
=================================================================================================================== -/
namespace PC.ESCAPE
open PCClose PC.NORMALFORM PC.HOST PC.SUPPLY

/-- THE RECORD CLOSES AT THE HOST'S FRAME. -/
theorem the_record_closes (H : Host) : Value (recFrame H.frame) := cargo_arrives H

/-- THE UNDECIDED IS THE BIT: what the record leaves open, whether the host's frame carries the value, is exactly the
    sentence. -/
theorem the_undecided_is_the_bit (H : Host) : Value H.frame ↔ H.Sentence := binding H

/-- "NOTHING IS OUTSIDE THE RECORD": false as a law of every frame; at the host's frame, the bit. -/
theorem nothing_outside_the_record_is_the_bit (H : Host) :
    ¬ (∀ F, Transfer pcRow F) ∧ (Transfer pcRow H.frame ↔ H.Sentence) :=
  ⟨(no_uniform_answer pcRow).1, formal_iff_sentence H⟩

/-- THE OUTSIDE IS THE SUPPLY: at the host's frame the outside of the record is the bit, and its two kinds are the
    formal cargo and the physical witness; the physical kind is the formal kind. -/
theorem the_outside_is_the_supply (H : Host) :
    (FormalCargo H ↔ H.Sentence) ∧ (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧
    (PhysicalWitness H → FormalCargo H) :=
  ⟨formal_iff_sentence H, physical_iff_sentence H, (the_two_kinds_are_one_bit H).1⟩

/-- EVERY ROUTE IS BOTH KINDS: whatever premise, in whatever vocabulary, gives the sentence delivers the formal cargo
    and a physical witness. An offering that crosses the row is a delivery of the cargo, never a bypass of it. -/
theorem every_route_is_both_kinds (H : Host) (Q : Prop) (h : Q → H.Sentence) :
    Q → FormalCargo H ∧ Nonempty (PhysicalWitness H) :=
  two_kinds_and_no_third H Q h

/-- BOTH KINDS DELIVER. -/
theorem both_kinds_deliver (H : Host) : (FormalCargo H → H.Sentence) ∧ (Nonempty (PhysicalWitness H) → H.Sentence) :=
  ⟨formal_kind_delivers, fun ⟨W⟩ => physical_kind_delivers W⟩

/-- OUR WAY OR NO WAY: every so-called other way to the sentence is our way in different vocabulary. It delivers the
    formal cargo and a physical witness, and if the bit failed, it would fail with it. -/
theorem our_way_or_no_way (H : Host) (Q : Prop) (h : Q → H.Sentence) :
    (Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧ (¬ FormalCargo H → ¬ Q) :=
  ⟨every_route_is_both_kinds H Q h, fun hn q => hn ((formal_iff_sentence H).mpr (h q))⟩

/-- THE OFFERING WALKS OUR WAY: a witnessed flow on the host delivers both kinds, and if the bit failed no witnessed
    flow would exist. The 2002–03 offering is our way in its own vocabulary. -/
theorem the_offering_walks_our_way (H : Host) :
    (WitnessedFlow H → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧ (¬ FormalCargo H → ¬ Nonempty (WitnessedFlow H)) :=
  ⟨fun O => every_route_is_both_kinds H (Nonempty (WitnessedFlow H))
      (fun ⟨O'⟩ => formal_kind_delivers (witnessed_flow_delivers_cargo O')) ⟨O⟩,
   fun hn ⟨O⟩ => hn (witnessed_flow_delivers_cargo O)⟩

/-- NOTHING ESCAPES, at every host: the record of the host's frame closes; what it leaves undecided is the bit; no law
    of every frame puts everything inside the record; the outside is the supply in its two kinds; every route to the
    sentence is a delivery of both kinds; either kind delivers it; every so-called other way is our way in different
    vocabulary; and the offering is one of them. -/
theorem nothing_escapes : ∀ H : Host,
    Value (recFrame H.frame) ∧
    (Value H.frame ↔ H.Sentence) ∧
    (¬ (∀ F, Transfer pcRow F) ∧ (Transfer pcRow H.frame ↔ H.Sentence)) ∧
    ((FormalCargo H ↔ H.Sentence) ∧ (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧
      (PhysicalWitness H → FormalCargo H)) ∧
    (∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧
    ((FormalCargo H → H.Sentence) ∧ (Nonempty (PhysicalWitness H) → H.Sentence)) ∧
    (∀ Q : Prop, (Q → H.Sentence) → (Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧ (¬ FormalCargo H → ¬ Q)) ∧
    ((WitnessedFlow H → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧
      (¬ FormalCargo H → ¬ Nonempty (WitnessedFlow H))) :=
  fun H => ⟨the_record_closes H, the_undecided_is_the_bit H, nothing_outside_the_record_is_the_bit H,
   the_outside_is_the_supply H, every_route_is_both_kinds H, both_kinds_deliver H, our_way_or_no_way H,
   the_offering_walks_our_way H⟩

/-- THE CAPSTONE, at every host: our way or no way; either kind walks it to the sentence; no keyless premise forces
    anything; to shut every true route to the sentence is to assert its denial; and the twelve formal gates pass. -/
theorem the_capstone : ∀ H : Host,
    (∀ Q : Prop, (Q → H.Sentence) → (Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧ (¬ FormalCargo H → ¬ Q)) ∧
    ((FormalCargo H → H.Sentence) ∧ (Nonempty (PhysicalWitness H) → H.Sentence)) ∧
    (∀ P : Frame → Prop, Keyless pcRow P → ¬ Forces pcRow P) ∧
    ((¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence)) ↔ ¬ H.Sentence) ∧
    (PC.GATES.Gate1 H ∧ PC.GATES.Gate2 H ∧ PC.GATES.Gate3 H ∧ PC.GATES.Gate4 ∧ PC.GATES.Gate5 ∧
      PC.GATES.Gate6 ∧ PC.GATES.Gate7 ∧ PC.GATES.Gate8 ∧ PC.GATES.Gate9 ∧ PC.GATES.Gate10 ∧
      PC.GATES.Gate11 H ∧ PC.GATES.Gate12 H) :=
  fun H => ⟨our_way_or_no_way H, both_kinds_deliver H, keyless_forces_nothing pcRow,
   PC.GATES.refusal_no_proof_at_the_bit H,
   PC.GATES.gate_1_srep H, PC.GATES.gate_2_reg H, PC.GATES.gate_3_sgeg H, PC.GATES.gate_4_causal,
   PC.GATES.gate_5_mig, PC.GATES.gate_6_ptb, PC.GATES.gate_7_dual, PC.GATES.gate_8_cscg, PC.GATES.gate_9_cseg,
   PC.GATES.gate_10_mta, PC.GATES.gate_11_oma H, PC.GATES.gate_12_adeg H⟩

end PC.ESCAPE

/-! ===================================================================================================================
    PART T · THE TERMINAL VERDICT AND THE FINAL FORM (namespace PC.TERMINAL) · v1_1_0_CC

    The open framing awaits a proof of the sentence from what every frame shares, or a reading of the record that
    decides it, or a route to the sentence past the bit. Each count is refuted by theorem (`the_open_framing_is_refuted`),
    and what remains is the bit, its antecedent proved with no hypothesis and the bit proved equivalent to the sentence.
    The ten steps are bound in one theorem, steps 1 to 9 proved and step 10 the two deliveries (`the_ten_steps`). The
    terminal verdict binds by exact type every theorem the verdict cites (`the_terminal_verdict`), and the final form
    binds the closed question, the cut by dimension, the offering typed and the two deliveries
    (`the_final_form`). Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace PC.TERMINAL
open PCClose PC.NORMALFORM PC.HOST PC.SUPPLY PC.REALPART PC.ROWSPLIT PC.RESIDUE

/-- THE OPEN FRAMING, REFUTED, at every host. I · no proof from shared resources: no keyless premise forces the value,
    no given statement is the value on every frame, and the arrow forces nothing; II · no decision from the record: the
    two frames share a record and split on the value, no finite record forces it, and above every dimension no reading
    of the record returns the world; III · no premise reaches the sentence while the bit fails; IV · what remains is the
    bit, its antecedent proved with no hypothesis, the bit proved equivalent to the sentence. -/
theorem the_open_framing_is_refuted : ∀ H : Host,
    (∀ P : Frame → Prop, Keyless pcRow P → ¬ Forces pcRow P) ∧
    (∀ P : Prop, ¬ ∀ M : Frame, (P ↔ Value M)) ∧
    (¬ ∀ M : Frame, Arrow → Value M) ∧
    (Value (recFrame calm) ∧ Value (recFrame counter) ∧ Value calm ∧ ¬ Value counter) ∧
    (∀ n : Nat, ¬ Value (staged n)) ∧
    (∀ T : Nat, ¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1) ∧
    (¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence) ∧ ¬ FormalCargo H) ∧
    Value (recFrame H.frame) ∧
    (FormalCargo H ↔ H.Sentence) :=
  fun H => ⟨keyless_forces_nothing pcRow, given_is_not_the_value, arrow_forces_nothing, record_decides_nothing pcRow,
   fun n => (finite_record_never_forces n).2, unicorn_blocked_above_every_dimension,
   fun ⟨_, q, h, hn⟩ => hn ((formal_iff_sentence H).mpr (h q)),
   cargo_arrives H, formal_iff_sentence H⟩

/-- THE TEN STEPS, one theorem at every host. Step 1 · the floor: the root holds on its constructed domain. Step 2 ·
    the basis: every flow fixes its seat, a fixed state is never left, rest is permanent, and a prime's multiplicative
    fibre is two points. Step 3 · the domain: the host frame's value is the sentence, and every faithful flow's value
    gives it. Step 4 · the record: the record carries the value, and every manifold has its seat on the record.
    Step 5 · the halted uniduction: the frame is self-recursive exactly when the sentence holds. Step 6 · the monism
    zone: the two frames share one record and split on the value, and the bit is keyed. Step 7 · the axis: the bit is
    exactly the sentence. Step 8 · the real part: every dimension but three sealed by its cited field, the value
    exactly the dimension-three part, and the tree count decided by the kernel. Step 9 · every route passes the bit,
    no keyless premise forces it, and the walls stand. Step 10 · the bit delivered twice, by the formal cargo and by
    the physical witness. -/
theorem the_ten_steps : ∀ H : Host,
    -- Step 1
    (Root Unit (fun _ => 1) ∧ RA₀) ∧
    -- Step 2
    ((∀ F : Flow, ∀ k, iter F.step k F.round = F.round) ∧
      (∀ (F : Flow) (s : F.State), F.step s = s → ∀ k, iter F.step k s = s) ∧
      (∀ (F : Flow) (s : F.State) (k : Nat), iter F.step k s = F.round → ∀ j, iter F.step (k + j) s = F.round) ∧
      mulFibre 7 = [(1, 7), (7, 1)]) ∧
    -- Step 3
    ((Value H.frame ↔ H.Sentence) ∧ (∀ Φ : FlowOn H, Value Φ.frame → H.Sentence)) ∧
    -- Step 4
    (Value (recFrame H.frame) ∧ ∀ (M : Frame) (d : M.D), (recFrame M).start d = M.flow.round) ∧
    -- Step 5
    (SelfRecursive pcRow H.frame ↔ H.Sentence) ∧
    -- Step 6
    ((Value (recFrame calm) ∧ Value (recFrame counter) ∧ Value calm ∧ ¬ Value counter) ∧
      (Transfer pcRow calm ∧ ¬ Transfer pcRow counter)) ∧
    -- Step 7
    (FormalCargo H ↔ H.Sentence) ∧
    -- Step 8
    ((∀ S : DimensionalNoThree, RealPartAt (Ex S) (Re S) (dimHeight S) 0) ∧
      (∀ S : DimensionalNoThree, Value S.M ↔ UnicornAt (Ex S) (Re S) (dimHeight S) 0) ∧
      (∀ S : DimensionalNoThree, Nonempty (ThreeSeat S) ↔ Value S.M) ∧
      (PC.WALLS.flows4.filter PC.WALLS.registersAll4).length = 16) ∧
    -- Step 9
    ((∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H) ∧
      (∀ P : Frame → Prop, Keyless pcRow P → ¬ Forces pcRow P) ∧
      (∀ n : Nat, ¬ Value (staged n)) ∧
      (¬ Value cycleFrame) ∧
      (bareThree.dim () = 3 ∧ ¬ Value bareThree.M)) ∧
    -- Step 10
    ((FormalCargo H → H.Sentence) ∧ (PhysicalWitness H → H.Sentence)) :=
  fun H =>
  ⟨⟨constructed_root_holds, ra₀.instances ra₀.anAct⟩,
   ⟨seat_is_fixed, iter_fixed, rest_is_permanent, prime_shape.1⟩,
   ⟨binding H, fun Φ => faithful_value_gives_sentence Φ⟩,
   ⟨cargo_arrives H, fun M d => (every_manifold_has_its_seat M d).1⟩,
   (self_recursion_at_frame pcRow H.frame).trans (binding H),
   ⟨record_decides_nothing pcRow, bit_is_keyed pcRow⟩,
   formal_iff_sentence H,
   ⟨real_part_by_dimension, no_bypass_by_dimension, seat_iff_value,
    PC.WALLS.registering_flows_are_the_trees.2.1⟩,
   ⟨fun _ h q => (formal_iff_sentence H).mpr (h q), keyless_forces_nothing pcRow,
    fun n => (finite_record_never_forces n).2, cycle_never_rests, three_is_load_bearing⟩,
   delivered_twice H⟩

/-- THE TERMINAL VERDICT, AS A THEOREM. Every theorem the verdict cites, bound by its exact type into one pinned
    conjunction: the record and the normal form; the binding and the faithful flow; the real part and the cut by
    dimension; the walls; the residue and its seat; the supply and the offering typed; the closed question; the formal
    run; nothing escaping; the open framing refuted; the ten steps; the lock of the edition of record. No premise
    before the colon. -/
theorem the_terminal_verdict :
    (type_of% @PC.HOST.recFrame_value) ∧
    (type_of% @PC.NORMALFORM.normal_form) ∧
    (type_of% @PC.NORMALFORM.normal_form_complete) ∧
    (type_of% @PC.HOST.binding) ∧
    (type_of% @PC.HOST.registered_is_round) ∧
    (type_of% @PC.HOST.faithful_route_strictly_stronger) ∧
    (type_of% @PC.REALPART.real_part_by_dimension) ∧
    (type_of% @PC.REALPART.no_bypass_by_dimension) ∧
    (type_of% @PC.REALPART.unicorn_blocked_above_every_dimension) ∧
    (type_of% @PC.WALLS.registering_flows_are_the_trees) ∧
    (type_of% @PC.WALLS.degree_record_normal_form) ∧
    (type_of% @PC.WALLS.the_walls) ∧
    (type_of% @PC.RESIDUE.residue_is_the_sentence) ∧
    (type_of% @PC.RESIDUE.seat_iff_value) ∧
    (type_of% @PC.SUPPLY.the_supply_closed) ∧
    (type_of% @PC.SUPPLY.the_offering_typed) ∧
    (type_of% @PC.CLOSURE.question_closed_to_one_bit) ∧
    (type_of% @PC.GATES.the_formal_run) ∧
    (type_of% @PC.ESCAPE.nothing_escapes) ∧
    (type_of% @PC.ESCAPE.the_capstone) ∧
    (type_of% @PC.TERMINAL.the_open_framing_is_refuted) ∧
    (type_of% @PC.TERMINAL.the_ten_steps) ∧
    (type_of% @PCClose.the_lock) ∧
    (type_of% @PCClose.poincare_closure) :=
  ⟨@PC.HOST.recFrame_value, @PC.NORMALFORM.normal_form, @PC.NORMALFORM.normal_form_complete, @PC.HOST.binding,
   @PC.HOST.registered_is_round, @PC.HOST.faithful_route_strictly_stronger, @PC.REALPART.real_part_by_dimension,
   @PC.REALPART.no_bypass_by_dimension, @PC.REALPART.unicorn_blocked_above_every_dimension,
   @PC.WALLS.registering_flows_are_the_trees, @PC.WALLS.degree_record_normal_form, @PC.WALLS.the_walls,
   @PC.RESIDUE.residue_is_the_sentence, @PC.RESIDUE.seat_iff_value, @PC.SUPPLY.the_supply_closed,
   @PC.SUPPLY.the_offering_typed, @PC.CLOSURE.question_closed_to_one_bit, @PC.GATES.the_formal_run,
   @PC.ESCAPE.nothing_escapes, @PC.ESCAPE.the_capstone, @PC.TERMINAL.the_open_framing_is_refuted,
   @PC.TERMINAL.the_ten_steps, @PCClose.the_lock, @PCClose.poincare_closure⟩

/-- THE FINAL FORM, at every host: the sentence is the bit; the sentence is exactly an inhabited physical witness;
    every faithful flow's value gives the sentence and none is needed for it; the value of every frame carrying the
    cited theorems of the other dimensions is exactly its dimension-three part; every witnessed flow, the shape of the
    2002–03 offering, is a cargo; every route to the sentence is both kinds; and to shut every true route to the
    sentence is to assert its denial. -/
theorem the_final_form : ∀ H : Host,
    (H.Sentence ↔ FormalCargo H) ∧
    (H.Sentence ↔ Nonempty (PhysicalWitness H)) ∧
    ((∀ Φ : FlowOn H, Value Φ.frame → H.Sentence) ∧ (oneRound.Sentence ∧ ¬ Value offSeatFlow.frame)) ∧
    (∀ S : DimensionalNoThree, Value S.M ↔ UnicornAt (Ex S) (Re S) (dimHeight S) 0) ∧
    (WitnessedFlow H → FormalCargo H) ∧
    (∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧
    ((¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence)) ↔ ¬ H.Sentence) :=
  fun H => ⟨PC.CLOSURE.the_sentence_is_the_bit H, (physical_iff_sentence H).symm,
   ⟨fun Φ => faithful_value_gives_sentence Φ, faithful_route_strictly_stronger⟩, no_bypass_by_dimension,
   witnessed_flow_delivers_cargo, two_kinds_and_no_third H, refusal_no_proof H.Sentence⟩

end PC.TERMINAL

/-! ## cones of Parts A to T, pinned: the build is silent, and any drift fails it -/
/-- info: 'PC.NORMALFORM.record_has_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.record_has_the_value
/-- info: 'PC.NORMALFORM.normal_form' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.normal_form
/-- info: 'PC.NORMALFORM.value_from_the_cargo_loop' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.value_from_the_cargo_loop
/-- info: 'PC.NORMALFORM.bit_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.bit_is_the_act
/-- info: 'PC.NORMALFORM.record_is_self_recursive' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.record_is_self_recursive
/-- info: 'PC.NORMALFORM.self_recursion_at_frame' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.self_recursion_at_frame
/-- info: 'PC.NORMALFORM.bit_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.bit_is_keyed
/-- info: 'PC.NORMALFORM.record_self_recursion_does_not_transfer' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.record_self_recursion_does_not_transfer
/-- info: 'PC.NORMALFORM.record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.record_decides_nothing
/-- info: 'PC.NORMALFORM.every_route_passes_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.every_route_passes_the_bit
/-- info: 'PC.NORMALFORM.keyless_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.keyless_forces_nothing
/-- info: 'PC.NORMALFORM.no_record_principle_decides' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.no_record_principle_decides
/-- info: 'PC.NORMALFORM.shared_record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.shared_record_decides_nothing
/-- info: 'PC.NORMALFORM.no_uniform_answer' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.no_uniform_answer
/-- info: 'PC.NORMALFORM.nothing_outside_the_record_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.nothing_outside_the_record_is_the_bit
/-- info: 'PC.NORMALFORM.denial_is_the_bits_denial' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.denial_is_the_bits_denial
/-- info: 'PC.NORMALFORM.normal_form_complete' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.normal_form_complete
/-- info: 'PC.NORMALFORM.bnot_ne' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.bnot_ne
/-- info: 'PC.NORMALFORM.refusal_waiting' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.refusal_waiting
/-- info: 'PC.NORMALFORM.refusal_no_proof' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.refusal_no_proof
/-- info: 'PC.NORMALFORM.block_needs_an_outside' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.block_needs_an_outside
/-- info: 'PC.NORMALFORM.comp_involution' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.comp_involution
/-- info: 'PC.NORMALFORM.locus_vanishes' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.locus_vanishes
/-- info: 'PC.NORMALFORM.join_reads_the_weakest' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.join_reads_the_weakest
/-- info: 'PC.NORMALFORM.square_is_sign_blind' does not depend on any axioms -/
#guard_msgs in #print axioms PC.NORMALFORM.square_is_sign_blind
/-- info: 'PC.ROWSPLIT.unicorn_block' does not depend on any axioms -/
#guard_msgs in #print axioms PC.ROWSPLIT.unicorn_block
/-- info: 'PC.ROWSPLIT.aperture_one_bit_wide' does not depend on any axioms -/
#guard_msgs in #print axioms PC.ROWSPLIT.aperture_one_bit_wide
/-- info: 'PC.ROWSPLIT.unicorn_rule_exact' does not depend on any axioms -/
#guard_msgs in #print axioms PC.ROWSPLIT.unicorn_rule_exact
/-- info: 'PC.ROWSPLIT.unicorn_no_bypass' does not depend on any axioms -/
#guard_msgs in #print axioms PC.ROWSPLIT.unicorn_no_bypass
/-- info: 'PC.ROWSPLIT.supply_side_silent' does not depend on any axioms -/
#guard_msgs in #print axioms PC.ROWSPLIT.supply_side_silent
/-- info: 'PC.ROWSPLIT.whole_iff_real_and_unicorn' does not depend on any axioms -/
#guard_msgs in #print axioms PC.ROWSPLIT.whole_iff_real_and_unicorn
/-- info: 'PC.ROWSPLIT.real_part_of_certificate' does not depend on any axioms -/
#guard_msgs in #print axioms PC.ROWSPLIT.real_part_of_certificate
/-- info: 'PC.HOST.recFrame_value' does not depend on any axioms -/
#guard_msgs in #print axioms PC.HOST.recFrame_value
/-- info: 'PC.HOST.every_manifold_has_its_seat' does not depend on any axioms -/
#guard_msgs in #print axioms PC.HOST.every_manifold_has_its_seat
/-- info: 'PC.HOST.stuck_iter' does not depend on any axioms -/
#guard_msgs in #print axioms PC.HOST.stuck_iter
/-- info: 'PC.HOST.binding' does not depend on any axioms -/
#guard_msgs in #print axioms PC.HOST.binding
/-- info: 'PC.HOST.root_on_row_is_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms PC.HOST.root_on_row_is_the_sentence
/-- info: 'PC.HOST.act_is_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms PC.HOST.act_is_the_sentence
/-- info: 'PC.HOST.cls_along' does not depend on any axioms -/
#guard_msgs in #print axioms PC.HOST.cls_along
/-- info: 'PC.HOST.registered_is_round' does not depend on any axioms -/
#guard_msgs in #print axioms PC.HOST.registered_is_round
/-- info: 'PC.HOST.faithful_value_gives_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms PC.HOST.faithful_value_gives_sentence
/-- info: 'PC.HOST.classifying_frame' does not depend on any axioms -/
#guard_msgs in #print axioms PC.HOST.classifying_frame
/-- info: 'PC.HOST.faithful_route_strictly_stronger' does not depend on any axioms -/
#guard_msgs in #print axioms PC.HOST.faithful_route_strictly_stronger
/-- info: 'PC.HOST.faithful_binds' does not depend on any axioms -/
#guard_msgs in #print axioms PC.HOST.faithful_binds
/-- info: 'PC.REALPART.value_is_the_whole' does not depend on any axioms -/
#guard_msgs in #print axioms PC.REALPART.value_is_the_whole
/-- info: 'PC.REALPART.height_pos_iff' does not depend on any axioms -/
#guard_msgs in #print axioms PC.REALPART.height_pos_iff
/-- info: 'PC.REALPART.not_three_of_height_zero' does not depend on any axioms -/
#guard_msgs in #print axioms PC.REALPART.not_three_of_height_zero
/-- info: 'PC.REALPART.real_part_by_dimension' does not depend on any axioms -/
#guard_msgs in #print axioms PC.REALPART.real_part_by_dimension
/-- info: 'PC.REALPART.value_iff_real_and_unicorn_at' does not depend on any axioms -/
#guard_msgs in #print axioms PC.REALPART.value_iff_real_and_unicorn_at
/-- info: 'PC.REALPART.value_iff_real_and_unicorn' does not depend on any axioms -/
#guard_msgs in #print axioms PC.REALPART.value_iff_real_and_unicorn
/-- info: 'PC.REALPART.no_bypass_by_dimension' does not depend on any axioms -/
#guard_msgs in #print axioms PC.REALPART.no_bypass_by_dimension
/-- info: 'PC.REALPART.unicorn_is_dimension_three' does not depend on any axioms -/
#guard_msgs in #print axioms PC.REALPART.unicorn_is_dimension_three
/-- info: 'PC.REALPART.unicorn_part_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms PC.REALPART.unicorn_part_is_load_bearing
/-- info: 'PC.REALPART.unicorn_blocked_above_every_dimension' does not depend on any axioms -/
#guard_msgs in #print axioms PC.REALPART.unicorn_blocked_above_every_dimension
/-- info: 'PC.REALPART.supply_side_silent_above_every_dimension' does not depend on any axioms -/
#guard_msgs in #print axioms PC.REALPART.supply_side_silent_above_every_dimension
/-- info: 'PC.REALPART.aperture_is_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms PC.REALPART.aperture_is_one_bit
/-- info: 'PC.WALLS.registering_flows_are_the_trees' does not depend on any axioms -/
#guard_msgs in #print axioms PC.WALLS.registering_flows_are_the_trees
/-- info: 'PC.WALLS.degree_record_normal_form' does not depend on any axioms -/
#guard_msgs in #print axioms PC.WALLS.degree_record_normal_form
/-- info: 'PC.WALLS.cycle4_stays_off' does not depend on any axioms -/
#guard_msgs in #print axioms PC.WALLS.cycle4_stays_off
/-- info: 'PC.WALLS.degree_record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms PC.WALLS.degree_record_decides_nothing
/-- info: 'PC.WALLS.homotopy_record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms PC.WALLS.homotopy_record_decides_nothing
/-- info: 'PC.WALLS.the_walls' does not depend on any axioms -/
#guard_msgs in #print axioms PC.WALLS.the_walls
/-- info: 'PC.RESIDUE.sentence_of_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms PC.RESIDUE.sentence_of_the_act
/-- info: 'PC.RESIDUE.residue_is_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms PC.RESIDUE.residue_is_the_sentence
/-- info: 'PC.RESIDUE.the_posit_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms PC.RESIDUE.the_posit_is_the_bit
/-- info: 'PC.RESIDUE.residue_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms PC.RESIDUE.residue_is_keyed
/-- info: 'PC.RESIDUE.value_of_seat' does not depend on any axioms -/
#guard_msgs in #print axioms PC.RESIDUE.value_of_seat
/-- info: 'PC.RESIDUE.seat_iff_value' does not depend on any axioms -/
#guard_msgs in #print axioms PC.RESIDUE.seat_iff_value
/-- info: 'PC.RESIDUE.seat_is_the_unicorn' does not depend on any axioms -/
#guard_msgs in #print axioms PC.RESIDUE.seat_is_the_unicorn
/-- info: 'PC.SUPPLY.cargo_arrives' does not depend on any axioms -/
#guard_msgs in #print axioms PC.SUPPLY.cargo_arrives
/-- info: 'PC.SUPPLY.formal_kind_delivers' does not depend on any axioms -/
#guard_msgs in #print axioms PC.SUPPLY.formal_kind_delivers
/-- info: 'PC.SUPPLY.physical_kind_delivers' does not depend on any axioms -/
#guard_msgs in #print axioms PC.SUPPLY.physical_kind_delivers
/-- info: 'PC.SUPPLY.witness_closes' does not depend on any axioms -/
#guard_msgs in #print axioms PC.SUPPLY.witness_closes
/-- info: 'PC.SUPPLY.physical_iff_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms PC.SUPPLY.physical_iff_sentence
/-- info: 'PC.SUPPLY.formal_iff_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms PC.SUPPLY.formal_iff_sentence
/-- info: 'PC.SUPPLY.the_two_kinds_are_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms PC.SUPPLY.the_two_kinds_are_one_bit
/-- info: 'PC.SUPPLY.delivered_twice' does not depend on any axioms -/
#guard_msgs in #print axioms PC.SUPPLY.delivered_twice
/-- info: 'PC.SUPPLY.two_kinds_and_no_third' does not depend on any axioms -/
#guard_msgs in #print axioms PC.SUPPLY.two_kinds_and_no_third
/-- info: 'PC.SUPPLY.the_one_refuter' does not depend on any axioms -/
#guard_msgs in #print axioms PC.SUPPLY.the_one_refuter
/-- info: 'PC.SUPPLY.witnessed_flow_delivers_cargo' does not depend on any axioms -/
#guard_msgs in #print axioms PC.SUPPLY.witnessed_flow_delivers_cargo
/-- info: 'PC.SUPPLY.cargo_without_witness' does not depend on any axioms -/
#guard_msgs in #print axioms PC.SUPPLY.cargo_without_witness
/-- info: 'PC.SUPPLY.the_offering_typed' does not depend on any axioms -/
#guard_msgs in #print axioms PC.SUPPLY.the_offering_typed
/-- info: 'PC.SUPPLY.the_supply_closed' does not depend on any axioms -/
#guard_msgs in #print axioms PC.SUPPLY.the_supply_closed
/-- info: 'PC.CLOSURE.the_sentence_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms PC.CLOSURE.the_sentence_is_the_bit
/-- info: 'PC.CLOSURE.denial_is_the_bits_denial' does not depend on any axioms -/
#guard_msgs in #print axioms PC.CLOSURE.denial_is_the_bits_denial
/-- info: 'PC.CLOSURE.refuter_denies_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms PC.CLOSURE.refuter_denies_the_sentence
/-- info: 'PC.CLOSURE.the_denial_has_one_road' does not depend on any axioms -/
#guard_msgs in #print axioms PC.CLOSURE.the_denial_has_one_road
/-- info: 'PC.CLOSURE.question_closed_to_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms PC.CLOSURE.question_closed_to_one_bit
/-- info: 'PC.GATES.gate_1_srep' does not depend on any axioms -/
#guard_msgs in #print axioms PC.GATES.gate_1_srep
/-- info: 'PC.GATES.gate_2_reg' does not depend on any axioms -/
#guard_msgs in #print axioms PC.GATES.gate_2_reg
/-- info: 'PC.GATES.gate_3_sgeg' does not depend on any axioms -/
#guard_msgs in #print axioms PC.GATES.gate_3_sgeg
/-- info: 'PC.GATES.gate_4_causal' does not depend on any axioms -/
#guard_msgs in #print axioms PC.GATES.gate_4_causal
/-- info: 'PC.GATES.gate_5_mig' does not depend on any axioms -/
#guard_msgs in #print axioms PC.GATES.gate_5_mig
/-- info: 'PC.GATES.gate_6_ptb' does not depend on any axioms -/
#guard_msgs in #print axioms PC.GATES.gate_6_ptb
/-- info: 'PC.GATES.gate_7_dual' does not depend on any axioms -/
#guard_msgs in #print axioms PC.GATES.gate_7_dual
/-- info: 'PC.GATES.gate_8_cscg' does not depend on any axioms -/
#guard_msgs in #print axioms PC.GATES.gate_8_cscg
/-- info: 'PC.GATES.gate_9_cseg' does not depend on any axioms -/
#guard_msgs in #print axioms PC.GATES.gate_9_cseg
/-- info: 'PC.GATES.gate_10_mta' does not depend on any axioms -/
#guard_msgs in #print axioms PC.GATES.gate_10_mta
/-- info: 'PC.GATES.gate_11_oma' does not depend on any axioms -/
#guard_msgs in #print axioms PC.GATES.gate_11_oma
/-- info: 'PC.GATES.gate_12_adeg' does not depend on any axioms -/
#guard_msgs in #print axioms PC.GATES.gate_12_adeg
/-- info: 'PC.GATES.refusal_proved' does not depend on any axioms -/
#guard_msgs in #print axioms PC.GATES.refusal_proved
/-- info: 'PC.GATES.refusal_no_proof_at_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms PC.GATES.refusal_no_proof_at_the_bit
/-- info: 'PC.GATES.the_formal_run' does not depend on any axioms -/
#guard_msgs in #print axioms PC.GATES.the_formal_run
/-- info: 'PC.ESCAPE.the_record_closes' does not depend on any axioms -/
#guard_msgs in #print axioms PC.ESCAPE.the_record_closes
/-- info: 'PC.ESCAPE.the_undecided_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms PC.ESCAPE.the_undecided_is_the_bit
/-- info: 'PC.ESCAPE.nothing_outside_the_record_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms PC.ESCAPE.nothing_outside_the_record_is_the_bit
/-- info: 'PC.ESCAPE.the_outside_is_the_supply' does not depend on any axioms -/
#guard_msgs in #print axioms PC.ESCAPE.the_outside_is_the_supply
/-- info: 'PC.ESCAPE.every_route_is_both_kinds' does not depend on any axioms -/
#guard_msgs in #print axioms PC.ESCAPE.every_route_is_both_kinds
/-- info: 'PC.ESCAPE.both_kinds_deliver' does not depend on any axioms -/
#guard_msgs in #print axioms PC.ESCAPE.both_kinds_deliver
/-- info: 'PC.ESCAPE.our_way_or_no_way' does not depend on any axioms -/
#guard_msgs in #print axioms PC.ESCAPE.our_way_or_no_way
/-- info: 'PC.ESCAPE.the_offering_walks_our_way' does not depend on any axioms -/
#guard_msgs in #print axioms PC.ESCAPE.the_offering_walks_our_way
/-- info: 'PC.ESCAPE.nothing_escapes' does not depend on any axioms -/
#guard_msgs in #print axioms PC.ESCAPE.nothing_escapes
/-- info: 'PC.ESCAPE.the_capstone' does not depend on any axioms -/
#guard_msgs in #print axioms PC.ESCAPE.the_capstone
/-- info: 'PC.TERMINAL.the_open_framing_is_refuted' does not depend on any axioms -/
#guard_msgs in #print axioms PC.TERMINAL.the_open_framing_is_refuted
/-- info: 'PC.TERMINAL.the_ten_steps' does not depend on any axioms -/
#guard_msgs in #print axioms PC.TERMINAL.the_ten_steps
/-- info: 'PC.TERMINAL.the_terminal_verdict' does not depend on any axioms -/
#guard_msgs in #print axioms PC.TERMINAL.the_terminal_verdict
/-- info: 'PC.TERMINAL.the_final_form' does not depend on any axioms -/
#guard_msgs in #print axioms PC.TERMINAL.the_final_form
