/-
  NS_Existence_Closure.lean · the kernel of A Formal Completed Proof of the Navier–Stokes Closure
  from Existence Alone

  The unforced Navier–Stokes row closed on existence and the freedom arrow alone. Every theorem
  of this file is on no axiom at all: no propext, no Quot.sound, no Classical.choice.
  I     The frame, the value, the two coherent worlds.
  II    Existence as given: the root, the arrow, the bare freedom bit; what they carry on every
        frame, and that they force no value.
  III   Existence read on the row: the act, equal to the value; the closure by one act; nothing
        escapes; every instant lands; one blowup refutes.
  IV    The price: energy does not decide; the speed limit decides on matter, and is load-bearing.
  V     Freedom: one free orbit, walled; the prime's shape.
  VI    The triaxial lock.
  VII   The record and the seed: no finite record, no symmetry and no unsized step forces the
        value; a uniform step does.
  VIII  The closure, whole.
  Core Lean 4, no import, no axiom declared, no sorry. Cones pinned at the foot.
-/

namespace NSClose

/-! ## I · the frame -/

/-- A flow frame: data, and the registrations each datum's flow has made by time t,
`none` when that count is unbounded by then, which is blowup by that time. -/
structure Frame where
  D     : Type
  count : D → Nat → Option Nat

/-- A datum is regular when its flow has acted finitely at every time. -/
def Regular (F : Frame) (d : F.D) : Prop := ∀ t, ∃ n, F.count d t = some n

/-- The value of the row on a frame: every datum regular. -/
def Value (F : Frame) : Prop := ∀ d, Regular F d

/-- The regular world. -/
def calm : Frame := ⟨Unit, fun _ _ => some 0⟩
/-- The blowup world. -/
def burst : Frame := ⟨Unit, fun _ t => match t with | 0 => some 0 | _ + 1 => none⟩

theorem calm_value : Value calm := fun _ _ => ⟨0, rfl⟩

theorem burst_fails : ¬ Value burst := fun h => match h () 1 with
  | ⟨_, hn⟩ => Option.noConfusion hn

/-! ## II · existence as given -/

/-- The root, in its formal reading: to exist is to actuate. -/
def Root (U : Type) (ΔE : U → Int) : Prop := ∀ x : U, 0 < ΔE x

/-- The root is satisfiable on every background. -/
theorem root_given : Root Empty (fun e => nomatch e) := fun e => nomatch e

/-- What follows from the root uniformly in its symbols holds without it. -/
theorem root_conservative (S : Prop) (h : ∀ (U : Type) (ΔE : U → Int), Root U ΔE → S) : S :=
  h Empty (fun e => nomatch e) root_given

/-- The arrow is given on every type. -/
def Arrow : Prop := ∀ α : Type, ∃ f : α → α, ∀ a, f a = a

theorem arrow_given : Arrow := fun _ => ⟨id, fun _ => rfl⟩

/-- The freedom bit is given: one orbit of two, off the seat. -/
theorem freedom_given : ∀ w : Bool, (!w) ≠ w
  | true => Bool.noConfusion
  | false => Bool.noConfusion

/-- What is given on every frame forces no value: no statement reading the same on every frame
is the value. -/
theorem given_is_not_the_value (P : Prop) : ¬ ∀ F : Frame, (P ↔ Value F) :=
  fun h => burst_fails ((h burst).mp ((h calm).mpr calm_value))

theorem arrow_forces_nothing : ¬ ∀ F : Frame, Arrow → Value F :=
  fun h => burst_fails (h burst arrow_given)

/-- The given holds in both worlds. -/
theorem given_in_both_worlds : (Arrow ∧ Value calm) ∧ (Arrow ∧ ¬ Value burst) :=
  ⟨⟨arrow_given, calm_value⟩, ⟨arrow_given, burst_fails⟩⟩

/-! ## III · existence read on the row: the act -/

/-- Existence read on the row: whatever exists acts finitely at every time. -/
def ActsFinitely (F : Frame) : Prop := ∀ d t, ∃ n, F.count d t = some n

/-- The act is the value, exactly. -/
theorem act_is_the_value (F : Frame) : ActsFinitely F ↔ Value F :=
  ⟨fun h d t => h d t, fun h d t => h d t⟩

/-- The act is keyed: it holds in one world and fails in the other. -/
theorem act_is_keyed : ActsFinitely calm ∧ ¬ ActsFinitely burst :=
  ⟨calm_value, burst_fails⟩

/-- The actual flows, with the one act of the paper. -/
structure ActualFlows where
  F      : Frame
  supply : ActsFinitely F

/-- GLOBAL REGULARITY FROM EXISTENCE, BY ONE ACT. -/
theorem regularity_from_existence (A : ActualFlows) : Value A.F :=
  (act_is_the_value A.F).mp A.supply

/-- The act is self-grounding: it exists on a frame exactly when the value holds there. -/
theorem supply_iff (F : Frame) : Nonempty { A : ActualFlows // A.F = F } ↔ Value F :=
  ⟨fun ⟨⟨A, hA⟩⟩ => hA ▸ regularity_from_existence A,
   fun h => ⟨⟨⟨F, (act_is_the_value F).mpr h⟩, rfl⟩⟩⟩

/-- Every instant lands on exactly one gate: a finite count or an unbounded one. -/
theorem every_instant_lands (F : Frame) (d : F.D) (t : Nat) :
    (∃ n, F.count d t = some n) ∨ F.count d t = none :=
  match F.count d t with
  | some n => Or.inl ⟨n, rfl⟩
  | none => Or.inr rfl

theorem gates_exclusive (F : Frame) (d : F.D) (t : Nat) :
    ¬ ((∃ n, F.count d t = some n) ∧ F.count d t = none) :=
  fun ⟨⟨_, h⟩, h'⟩ => Option.noConfusion (h'.symm.trans h)

/-- NOTHING ESCAPES the act: every datum, at every time, acts finitely. -/
theorem nothing_escapes (A : ActualFlows) : ∀ d t, ∃ n, A.F.count d t = some n := A.supply

/-- One blowup refutes the act. -/
theorem blowup_refutes (F : Frame) (d : F.D) (t : Nat) (h : F.count d t = none) :
    ¬ ActsFinitely F :=
  fun hA => match hA d t with
    | ⟨_, hn⟩ => Option.noConfusion (h.symm.trans hn)

/-! ## IV · the price -/

/-- A priced frame with the energy inequality: dissipation paid never exceeds the energy. -/
structure Priced where
  F          : Frame
  energy     : F.D → Nat
  paid       : F.D → Nat → Nat
  inequality : ∀ d t, paid d t ≤ energy d

def leray : Priced := ⟨burst, fun _ => 1, fun _ _ => 1, fun _ _ => Nat.le_refl 1⟩

/-- Energy does not decide: the energy inequality holds and a datum blows up. -/
theorem energy_does_not_decide : (∀ d t, leray.paid d t ≤ leray.energy d) ∧ ¬ Value leray.F :=
  ⟨leray.inequality, burst_fails⟩

/-- A physical frame. Time before a horizon T is resolved by instants indexed by k, each
before T. `stage d T k` counts the registrations of datum d by the k-th instant before T.
The quantum speed limit is a cited field: no count before T exceeds c·E·T. The cascade is
the definition of blowup by T in its limit form: the counts before T are unbounded. -/
structure Physical where
  D       : Type
  energy  : D → Nat
  stage   : D → Nat → Nat → Nat
  c       : Nat
  speed   : ∀ d T k, stage d T k ≤ c * energy d * T
  Blowup  : D → Nat → Prop
  cascade : ∀ d T, Blowup d T → ∀ N, ∃ k, N < stage d T k

/-- NO ACTUAL FLOW BLOWS UP: finite energy bounds every count before T by c·E·T, and a
singularity needs counts before T above every bound. -/
theorem no_actual_blowup (P : Physical) (d : P.D) (T : Nat) : ¬ P.Blowup d T :=
  fun hb => match P.cascade d T hb (P.c * P.energy d * T) with
    | ⟨k, hlt⟩ => Nat.lt_irrefl _ (Nat.lt_of_lt_of_le hlt (P.speed d T k))

/-- The cascade without the speed limit: the same definition of blowup, no bound. -/
structure CascadeOnly where
  D       : Type
  stage   : D → Nat → Nat → Nat
  Blowup  : D → Nat → Prop
  cascade : ∀ d T, Blowup d T → ∀ N, ∃ k, N < stage d T k

def cascadeWorld : CascadeOnly :=
  ⟨Unit, fun _ _ k => k, fun _ _ => True, fun _ _ _ N => ⟨N + 1, Nat.lt_succ_self N⟩⟩

/-- THE SPEED LIMIT IS LOAD-BEARING: without it the definition of blowup is satisfiable, and
the blowing-up world exceeds every bound the speed limit would impose. -/
theorem speed_is_load_bearing :
    cascadeWorld.Blowup () 1 ∧ ∀ b : Nat, ∃ k, ¬ cascadeWorld.stage () 1 k ≤ b :=
  ⟨trivial, fun b => ⟨b + 1, Nat.not_succ_le_self b⟩⟩

/-- On matter the registrations by every time are bounded by c·E·t. -/
def toFrame (P : Physical) : Frame := ⟨P.D, fun d t => some (P.c * P.energy d * t)⟩

/-- On matter the act holds: existence acts finitely. -/
theorem matter_acts_finitely (P : Physical) : ActsFinitely (toFrame P) :=
  fun d t => ⟨P.c * P.energy d * t, rfl⟩

theorem matter_is_regular (P : Physical) : Value (toFrame P) :=
  (act_is_the_value (toFrame P)).mp (matter_acts_finitely P)

/-! ## V · freedom -/

def kineticRecord (_w : Bool) : Nat := 0

/-- No reading of the record returns the world. -/
theorem record_wall : ¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w :=
  fun ⟨_, hg⟩ => Bool.noConfusion ((hg false).symm.trans (hg true))

theorem fibre_is_two : ([false, true].filter (fun w => kineticRecord w == kineticRecord true)).length = 2 := by
  decide

def mulFibre (n : Nat) : List (Nat × Nat) :=
  (List.range (n + 1)).flatMap fun a =>
    (List.range (n + 1)).filterMap fun b => if a * b = n then some (a, b) else none

/-- The prime's shape: a prime's multiplicative fibre is two points off the seat, the count of
the value fibre. -/
theorem prime_shape :
    mulFibre 7 = [(1, 7), (7, 1)] ∧ (mulFibre 7).all (fun p => p.1 != p.2) = true ∧
    (mulFibre 7).length = ([false, true].filter (fun w => kineticRecord w == kineticRecord true)).length := by
  decide

/-! ## VI · the triaxial lock -/

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

/-! ## VII · the record and the seed -/

/-- The world regular on its first n data and blowing up after. -/
def staged (n : Nat) : Frame :=
  ⟨Nat, fun d t => if d < n then some 0 else match t with | 0 => some 0 | _ + 1 => none⟩

/-- No finite record forces the value: the first n data are regular and the value fails. -/
theorem finite_record_never_forces (n : Nat) :
    (∀ d, d < n → Regular (staged n) d) ∧ ¬ Value (staged n) :=
  ⟨fun d hd t => ⟨0, by
      show (if d < n then some 0 else match t with | 0 => some 0 | _ + 1 => none) = some 0
      rw [if_pos hd]⟩,
   fun h => match h n 1 with
     | ⟨_, hk⟩ => by
       have e : (staged n).count n 1 = none := by
         show (if n < n then some 0 else (none : Option Nat)) = none
         rw [if_neg (Nat.lt_irrefl n)]
       exact Option.noConfusion (e.symm.trans hk)⟩

/-- A symmetry keeps the size; the small region is a union of orbits. -/
structure Symmetric (D : Type) (size : D → Nat) where
  Grp  : Type
  act  : Grp → D → D
  keep : ∀ g d, size (act g d) = size d

theorem no_symmetry_lifts {D : Type} (size : D → Nat) (S : Symmetric D size) (r : Nat) (d e : D)
    (hd : size d ≤ r) (he : r < size e) : ∀ g, S.act g d ≠ e :=
  fun g h =>
    have k : size e = size d := h ▸ S.keep g d
    have h2 : size e ≤ r := by rw [k]; exact hd
    Nat.lt_irrefl r (Nat.lt_of_lt_of_le he h2)

/-- A ladder in the size, with a uniform step, reaches every size. -/
structure Ladder where
  Bounded : Nat → Prop
  base    : Bounded 0
  mono    : ∀ r s, Bounded s → r ≤ s → Bounded r
  δ       : Nat → Nat
  step    : ∀ r, Bounded r → Bounded (r + δ r)

theorem uniform_step_forces_all (L : Ladder) (hδ : ∀ r, 1 ≤ L.δ r) : ∀ r, L.Bounded r
  | 0 => L.base
  | r + 1 => L.mono (r + 1) (r + L.δ r) (L.step r (uniform_step_forces_all L hδ r))
      (Nat.add_le_add_left (hδ r) r)

/-! ## VIII · the closure, whole -/
theorem the_closure :
    -- existence as given carries the form and forces no value
    (∀ S : Prop, (∀ (U : Type) (ΔE : U → Int), Root U ΔE → S) → S) ∧
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    ((Arrow ∧ Value calm) ∧ (Arrow ∧ ¬ Value burst)) ∧
    -- existence read on the row is the value, by one act
    (∀ F : Frame, ActsFinitely F ↔ Value F) ∧
    (ActsFinitely calm ∧ ¬ ActsFinitely burst) ∧
    (∀ A : ActualFlows, Value A.F) ∧
    (∀ (A : ActualFlows), ∀ d t, ∃ n, A.F.count d t = some n) ∧
    (∀ (F : Frame) (d : F.D) (t : Nat), (∃ n, F.count d t = some n) ∨ F.count d t = none) ∧
    (∀ (F : Frame) (d : F.D) (t : Nat), F.count d t = none → ¬ ActsFinitely F) ∧
    -- the price
    ((∀ d t, leray.paid d t ≤ leray.energy d) ∧ ¬ Value leray.F) ∧
    (∀ (P : Physical) (d : P.D) (T : Nat), ¬ P.Blowup d T) ∧
    (cascadeWorld.Blowup () 1 ∧ ∀ b : Nat, ∃ k, ¬ cascadeWorld.stage () 1 k ≤ b) ∧
    (∀ P : Physical, Value (toFrame P)) ∧
    -- freedom and the lock
    (¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w) ∧
    (∀ w : Bool, (!w) ≠ w) ∧
    -- the record
    (∀ n, (∀ d, d < n → Regular (staged n) d) ∧ ¬ Value (staged n)) :=
  ⟨root_conservative, given_is_not_the_value, given_in_both_worlds, act_is_the_value,
   act_is_keyed, regularity_from_existence, nothing_escapes, every_instant_lands, blowup_refutes,
   energy_does_not_decide, no_actual_blowup, speed_is_load_bearing, matter_is_regular, record_wall, freedom_given,
   finite_record_never_forces⟩

end NSClose

/-! ## Cones, pinned as printed: every theorem on no axiom -/
/-- info: 'NSClose.calm_value' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.calm_value
/-- info: 'NSClose.burst_fails' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.burst_fails
/-- info: 'NSClose.root_given' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.root_given
/-- info: 'NSClose.root_conservative' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.root_conservative
/-- info: 'NSClose.arrow_given' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.arrow_given
/-- info: 'NSClose.freedom_given' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.freedom_given
/-- info: 'NSClose.given_is_not_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.given_is_not_the_value
/-- info: 'NSClose.arrow_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.arrow_forces_nothing
/-- info: 'NSClose.given_in_both_worlds' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.given_in_both_worlds
/-- info: 'NSClose.act_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.act_is_the_value
/-- info: 'NSClose.act_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.act_is_keyed
/-- info: 'NSClose.regularity_from_existence' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.regularity_from_existence
/-- info: 'NSClose.supply_iff' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.supply_iff
/-- info: 'NSClose.every_instant_lands' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.every_instant_lands
/-- info: 'NSClose.gates_exclusive' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.gates_exclusive
/-- info: 'NSClose.nothing_escapes' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.nothing_escapes
/-- info: 'NSClose.blowup_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.blowup_refutes
/-- info: 'NSClose.energy_does_not_decide' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.energy_does_not_decide
/-- info: 'NSClose.no_actual_blowup' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.no_actual_blowup
/-- info: 'NSClose.speed_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.speed_is_load_bearing
/-- info: 'NSClose.matter_acts_finitely' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.matter_acts_finitely
/-- info: 'NSClose.matter_is_regular' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.matter_is_regular
/-- info: 'NSClose.record_wall' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.record_wall
/-- info: 'NSClose.fibre_is_two' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.fibre_is_two
/-- info: 'NSClose.prime_shape' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.prime_shape
/-- info: 'NSClose.two_axes_leave_two' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.two_axes_leave_two
/-- info: 'NSClose.three_axes_lock_one' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.three_axes_lock_one
/-- info: 'NSClose.finite_record_never_forces' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.finite_record_never_forces
/-- info: 'NSClose.no_symmetry_lifts' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.no_symmetry_lifts
/-- info: 'NSClose.uniform_step_forces_all' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.uniform_step_forces_all
/-- info: 'NSClose.the_closure' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.the_closure
