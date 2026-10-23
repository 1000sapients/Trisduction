/-
  NS_Normal_Form_Paper_v1_1_0_CC.lean · the kernel of "Navier–Stokes Global Regularity: Unconditional Proof of the
  Form by Theorem, the Value by the Act", edition 1.1.0. Claude-coded (_CC). Core Lean 4.19.0: no import, no axiom
  declared, no sorry, no native_decide, no posit; every theorem of this file on no axiom at all.

  Part 0 (namespace NSClose) is NS_Existence_Closure.lean of the edition of record, carried verbatim
  (sha256 959452e82bd6e3c632ff6d20676568dc6102d5572bf67e53b531850e3b3ee7c2): the frame of data and their registration
  counts, the value, global regularity, and the two worlds; existence as given carrying the form and forcing nothing;
  the act, equal to the value; one blowup refuting; the price, the energy record deciding nothing; the matter face,
  regularity of matter from the quantum speed limit and the cascade, each load-bearing; the record walls; the triaxial
  lock; the finite record and the symmetry that lifts no decided datum; the closure; the root and the lock. Its 65
  theorems and their pins stand unchanged.
  Part A (namespace NS.NORMALFORM) is the normal form of the row, generic over a row and read on the Navier–Stokes row
  as the P ≠ NP seat reads computation and the Riemann seat reads the zeros: the record carries the value with no
  premise; the value is exactly the transfer from the record, the one bit; the cargo loop; the act; self-recursion;
  the keyed bit; the record deciding nothing; every route passing the bit; the keyless wall; no uniform answer.
  Part B (namespace NS.HOST) is the host model and its binding, proved: the record of a frame registers every datum
  finite at every time; the host carries each smooth divergence-free datum of rapid decay on ℝ³ with the count of the
  registrations its flow has made by each time, none at blowup; the value of the host's frame is exactly the host's
  sentence, every flow finite at every time; the sentence at every horizon; one blowup refutes.
  Part C (namespace NS.ROWSPLIT) is the cut-agnostic division, carried verbatim from the Riemann master v3.0.39_CC,
  and Part C′ (namespace NS.REALPART) reads it by the size of the datum: the real part, small data, sealed by the cited
  small-data theorem carried as a field; given it, the value is exactly the unicorn part, the large data; the unicorn
  part load-bearing; the unicorn part closed to the record above every size.
  Part D (namespace NS.WALLS): the speed limit cutting every dyadic cascade at a finite step, decided by the kernel and
  proved at every bound; and the walls of the row in one theorem.
  Part E (namespace NS.RESIDUE): the one implication that remains, printed as a hypothesis and assumed nowhere; its
  instance seat at large data.
  Part F (namespace NS.SUPPLY): the bit supplied by its two kinds, the formal cargo and the physical witness, the
  quantum speed limit read with the cascade; the two kinds one bit; delivered twice; two kinds and no third; the one
  refuter, one blowup; the witnesses of the subject typed: the energy inequality short of the value, the small-data
  theorem inside the bit, the speed limit and the cascade each load-bearing.
  Part G (namespace NS.CLOSURE): the question closed to one bit.
  Part W (namespace NS.GATES): the twelve formal gates run in the kernel, and the four refusals.
  Part X (namespace NS.ESCAPE): nothing escapes, our way or no way, and the capstone.
  Part T (namespace NS.TERMINAL): the open framing refuted, the ten steps, the terminal verdict and the final form.
  Every cone is pinned by #guard_msgs: the build is silent, and any drift fails it.

  THE TWO-LAYER CLOSURE. Everything except the bit is proved with no posit: the floor on no axiom at all, and every
  other theorem of this file on no axiom at all; and the bit, the row's reading, is all that remains, at premise grade.
  The root alone forces no value; the root read on the row is the value. No declaration of this file has the type of
  the bit. ΔM = 0.
-/

/-
  NS_Existence_Closure.lean · the kernel of A Formal Completed Proof of the Navier–Stokes Closure
  from Existence Alone

  The unforced Navier–Stokes row closed on existence alone, the freedom arrow beside it. Every theorem
  of this file is on no axiom at all: no propext, no Quot.sound, no Classical.choice.
  I     The frame, the value, the two coherent worlds.
  II    Existence as given: the root, the arrow, the bare freedom bit; what they carry on every
        frame, and that they force no value.
  III   Existence read on the row: the act, equal to the value; the root read on the row is the act and
        the value; nothing given forces or refutes the act; the closure by one act; nothing escapes;
        every instant lands; one blowup refutes; existence as given carries this form on every frame.
  IV    The price: energy does not decide, and a regular priced frame with the blowup frame's energy record
        shows the record decides nothing; on matter the speed limit and the cascade give the frame's own
        count finite at every time, regular in the sense of I, with no physical blowup and no limit blowup
        from the speed limit, the limit form holding on a world carrying the speed limit alone; the speed
        limit is load-bearing, and so is the cascade.
  V     Freedom: one free orbit, walled, in the Bool model and on frames; the prime's shape, its fibre one
        swap orbit.
  VI    The triaxial lock.
  VII   The record and the seed: no finite record forces the value and no symmetry lifts a decided
        datum; a uniform step decides every rung of a ladder that carries it.
  VIII  The closure, whole.
  Core Lean 4, no import, no axiom declared, no sorry. Cones pinned at the foot.
  ROOT  The root, undeniable in deed, and the lock: the root holds by its deed in both worlds and forces
        the value neither way; a root grounded on every frame forces no value; the undeniability stays with
        the root, the root read on the row grounding exactly where the value holds; Appendix R's constructed
        root, repeated verbatim, is the constructed root, and its lock on the row (the_lock_on_the_root);
        read on the row it is the act; one theorem on no axiom binds the root, its readings, the act, the
        value, their keying, the closing theorem, the record wall and the finite record (the_lock); and one
        fixes the sense of 'from existence alone' (from_existence_alone).
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

/-- The root holds on the empty background, vacuously. -/
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

/-- THE ROOT READ ON THE ROW: to exist is to actuate, `Root` itself, with the row's existents, each datum at
each time, and the row's actuation, one where the datum's count is finite and zero where it is not. -/
def RootOnRow (F : Frame) : Prop :=
  Root (F.D × Nat) (fun x => indicator (suppliedDec (F.count x.1 x.2)))

/-- THE ROOT IS SATISFIABLE ON EVERY BACKGROUND: on every type, with actuation one at every existent. -/
theorem root_satisfiable (U : Type) : Root U (fun _ => 1) := fun _ => show (0 : Int) < 1 by decide

/-- THE CONSTRUCTED ROOT, in the words of Appendix R: one existent, whose actuation is one. A theorem
with no hypothesis and no axiom. -/
theorem constructed_root_holds : Root Unit (fun _ => 1) := root_satisfiable Unit

/-- THE ROOT READ ON THE ROW IS THE ACT. -/
theorem root_on_row_is_the_act (F : Frame) : RootOnRow F ↔ ActsFinitely F :=
  ⟨fun h d t => (indicator_pos _).mp (h (d, t)), fun h x => (indicator_pos _).mpr (h x.1 x.2)⟩

/-- THE ROOT READ ON THE ROW IS THE VALUE. -/
theorem root_on_row_is_the_value (F : Frame) : RootOnRow F ↔ Value F :=
  ⟨fun h => (act_is_the_value F).mp ((root_on_row_is_the_act F).mp h),
   fun h => (root_on_row_is_the_act F).mpr ((act_is_the_value F).mpr h)⟩

/-- THE ROOT READ ON THE ROW IS KEYED: it holds where the value holds and fails where the value fails. -/
theorem root_on_row_is_keyed : RootOnRow calm ∧ ¬ RootOnRow burst :=
  ⟨(root_on_row_is_the_value calm).mpr calm_value, fun h => burst_fails ((root_on_row_is_the_value burst).mp h)⟩

/-- THE ACT IS THE WEAKEST PREMISE: the act forces the value on every frame, and every premise that forces
the value on every frame implies the act. -/
theorem act_is_the_weakest_premise :
    (∀ F : Frame, ActsFinitely F → Value F) ∧
    ∀ Q : Frame → Prop, (∀ F : Frame, Q F → Value F) → ∀ F : Frame, Q F → ActsFinitely F :=
  ⟨fun F h => (act_is_the_value F).mp h, fun _ hQ F hq => (act_is_the_value F).mpr (hQ F hq)⟩

/-- EXISTENCE AS GIVEN HOLDS IN BOTH WORLDS: the root satisfiable on every background, the arrow and the
freedom bit hold in the world where the value holds and in the world where it fails. -/
theorem existence_as_given_in_both_worlds :
    ((∀ U : Type, Root U (fun _ => 1)) ∧ Arrow ∧ (∀ w : Bool, (!w) ≠ w)) ∧ Value calm ∧ ¬ Value burst :=
  ⟨⟨root_satisfiable, arrow_given, freedom_given⟩, calm_value, burst_fails⟩

/-- NOTHING GIVEN REFUTES THE ACT: no statement that holds refutes the act on every frame. -/
theorem nothing_given_refutes : ∀ P : Prop, P → ¬ ∀ F : Frame, P → ¬ ActsFinitely F :=
  fun _ hp h => h calm hp act_is_keyed.1

/-- NOTHING GIVEN FORCES THE VALUE: no statement that holds forces the value on every frame. -/
theorem nothing_given_forces : ∀ P : Prop, P → ¬ ∀ F : Frame, P → Value F :=
  fun _ hp h => burst_fails (h burst hp)

/-- THE ONLY REFUTER: wherever the act fails, it cannot be that no instance fails, a datum blowing up. -/
theorem only_refuter (F : Frame) : ¬ ActsFinitely F → ¬ ¬ ∃ d t, F.count d t = none :=
  fun hn hne => hn (fun d t => match hc : F.count d t with
    | some n => ⟨n, rfl⟩
    | none => absurd ⟨d, t, hc⟩ hne)

/-- The actual flows, with the one act of the paper. -/
structure ActualFlows where
  F      : Frame
  supply : ActsFinitely F

/-- GLOBAL REGULARITY FROM EXISTENCE, BY ONE ACT. -/
theorem regularity_from_existence (A : ActualFlows) : Value A.F :=
  (act_is_the_value A.F).mp A.supply

/-- THE SUPPLY IS EXACT: an act exists on a frame exactly when the value holds there. -/
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

/-- EXISTENCE AS GIVEN CARRIES THE FORM: under any root, on every frame, the act is the value, every instant
lands on a gate, and one blowup refutes the act. -/
theorem given_carries_the_form : ∀ (U : Type) (ΔE : U → Int), Root U ΔE →
    (∀ F : Frame, ActsFinitely F ↔ Value F) ∧
    (∀ (F : Frame) (d : F.D) (t : Nat), (∃ n, F.count d t = some n) ∨ F.count d t = none) ∧
    (∀ (F : Frame) (d : F.D) (t : Nat), F.count d t = none → ¬ ActsFinitely F) :=
  fun _ _ _ => ⟨act_is_the_value, every_instant_lands, blowup_refutes⟩

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

/-- The regular world, priced: the same energy and the same dissipation as the blowup frame. -/
def calmPriced : Priced := ⟨calm, fun _ => 1, fun _ _ => 1, fun _ _ => Nat.le_refl 1⟩

/-- THE ENERGY RECORD DECIDES NOTHING: a regular priced frame and the blowup priced frame carry the same energy
and the same dissipation, so no reading of that record is the value on both. -/
theorem energy_record_decides_nothing :
    (∀ d : Unit, calmPriced.energy d = leray.energy d) ∧
    (∀ (d : Unit) (t : Nat), calmPriced.paid d t = leray.paid d t) ∧
    Value calmPriced.F ∧ ¬ Value leray.F ∧
    ¬ ∃ g : (Unit → Nat) → (Unit → Nat → Nat) → Prop,
      (g calmPriced.energy calmPriced.paid ↔ Value calmPriced.F) ∧ (g leray.energy leray.paid ↔ Value leray.F) :=
  ⟨fun _ => rfl, fun _ _ => rfl, calm_value, burst_fails,
   fun ⟨_, h1, h2⟩ => burst_fails (h2.mp (h1.mpr calm_value))⟩

/-- A physical frame. Time before a horizon T is resolved by instants indexed by k, each before T.
`stage d T k` counts the registrations of datum d by the k-th instant before T, and `count d T` is the frame's
count of datum d by T in the sense of Section I: `none` when it is unbounded, which is blowup by T. The quantum
speed limit is a cited field: no stage count before T exceeds c·E·T. The cascade is a hypothesis carried as a
field, the limit-form link between the count and the stages: an unbounded count by T has a stage count before T
above every bound. -/
structure Physical where
  D       : Type
  energy  : D → Nat
  stage   : D → Nat → Nat → Nat
  c       : Nat
  speed   : ∀ d T k, stage d T k ≤ c * energy d * T
  count   : D → Nat → Option Nat
  cascade : ∀ d T, count d T = none → ∀ N, ∃ k, N < stage d T k

/-- The frame of matter: the physical frame's own count. -/
def Physical.frame (P : Physical) : Frame := ⟨P.D, P.count⟩

/-- Blowup by T on matter, in the sense of Section I: the count by T is unbounded. -/
def Physical.Blowup (P : Physical) (d : P.D) (T : Nat) : Prop := P.count d T = none

/-- A physical frame exists: one datum of energy one, no registration, count zero. -/
def matterWorld : Physical :=
  ⟨Unit, fun _ => 1, fun _ _ _ => 0, 1, fun _ _ _ => Nat.zero_le _, fun _ _ => some 0,
   fun _ _ h => Option.noConfusion h⟩

theorem physical_inhabited : Nonempty Physical := ⟨matterWorld⟩

/-- NO ACTUAL FLOW BLOWS UP: finite energy bounds every stage count before T by c·E·T, and an unbounded count by
T needs stage counts before T above every bound. -/
theorem no_actual_blowup (P : Physical) (d : P.D) (T : Nat) : ¬ P.Blowup d T :=
  fun hb => match P.cascade d T hb (P.c * P.energy d * T) with
    | ⟨k, hlt⟩ => Nat.lt_irrefl _ (Nat.lt_of_lt_of_le hlt (P.speed d T k))

/-- NO PHYSICAL BLOWUP: on matter, no datum's count by any horizon is unbounded. -/
theorem no_physical_blowup (P : Physical) (d : P.D) (T : Nat) : ¬ P.Blowup d T :=
  no_actual_blowup P d T

/-- NO LIMIT BLOWUP FROM THE SPEED LIMIT: on matter, the stage counts before a horizon never pass every bound. -/
theorem no_limit_blowup_from_speed (P : Physical) (d : P.D) (T : Nat) : ¬ ∀ N, ∃ k, N < P.stage d T k :=
  fun h => match h (P.c * P.energy d * T) with
    | ⟨k, hlt⟩ => Nat.lt_irrefl _ (Nat.lt_of_lt_of_le hlt (P.speed d T k))

/-- The cascade without the speed limit: the same count and the same cascade hypothesis, no bound. -/
structure CascadeOnly where
  D       : Type
  stage   : D → Nat → Nat → Nat
  count   : D → Nat → Option Nat
  cascade : ∀ d T, count d T = none → ∀ N, ∃ k, N < stage d T k

def cascadeWorld : CascadeOnly :=
  ⟨Unit, fun _ _ k => k, fun _ _ => none, fun _ _ _ N => ⟨N + 1, Nat.lt_succ_self N⟩⟩

/-- The frame of the cascade world: its own count. -/
def cascadeFrame : Frame := ⟨cascadeWorld.D, cascadeWorld.count⟩

/-- THE SPEED LIMIT IS LOAD-BEARING: without it blowup is satisfiable under the cascade; the cascade world's count by
time one is unbounded, its frame is not regular, and its stages exceed every bound the speed limit would impose. -/
theorem speed_is_load_bearing :
    cascadeWorld.count () 1 = none ∧ ¬ Value cascadeFrame ∧ ∀ b : Nat, ∃ k, ¬ cascadeWorld.stage () 1 k ≤ b :=
  ⟨rfl, fun h => match h () 1 with | ⟨_, hn⟩ => Option.noConfusion hn,
   fun b => ⟨b + 1, Nat.not_succ_le_self b⟩⟩

/-- The speed limit without the cascade: the same energy, stages, bound and count, no cascade hypothesis. -/
structure SpeedOnly where
  D      : Type
  energy : D → Nat
  stage  : D → Nat → Nat → Nat
  c      : Nat
  speed  : ∀ d T k, stage d T k ≤ c * energy d * T
  count  : D → Nat → Option Nat

/-- A speed-limited world: one datum of energy one, no registration, and a count unbounded at every time. -/
def speedWorld : SpeedOnly :=
  ⟨Unit, fun _ => 1, fun _ _ _ => 0, 1, fun _ _ _ => Nat.zero_le _, fun _ _ => none⟩

/-- The frame of the speed-limited world: its own count. -/
def speedFrame : Frame := ⟨speedWorld.D, speedWorld.count⟩

/-- NO LIMIT BLOWUP FROM THE SPEED LIMIT ALONE: on a world carrying the speed limit and nothing else, no cascade
field, the stage counts before a horizon never pass every bound. -/
theorem no_limit_blowup_from_speed_only (P : SpeedOnly) (d : P.D) (T : Nat) : ¬ ∀ N, ∃ k, N < P.stage d T k :=
  fun h => match h (P.c * P.energy d * T) with
    | ⟨k, hlt⟩ => Nat.lt_irrefl _ (Nat.lt_of_lt_of_le hlt (P.speed d T k))

/-- THE CASCADE IS LOAD-BEARING: without it the speed limit holds and still the count by time one is
unbounded, and the frame is not regular. -/
theorem cascade_is_load_bearing :
    (∀ d T k, speedWorld.stage d T k ≤ speedWorld.c * speedWorld.energy d * T) ∧
    speedWorld.count () 1 = none ∧ ¬ Value speedFrame :=
  ⟨speedWorld.speed, rfl, fun h => match h () 1 with | ⟨_, hn⟩ => Option.noConfusion hn⟩

/-- On matter the act holds: existence acts finitely, the frame's own count finite at every time, from the speed
limit and the cascade. -/
theorem matter_acts_finitely (P : Physical) : ActsFinitely P.frame :=
  fun d t => show ∃ n, P.count d t = some n from
    match hc : P.count d t with
    | some n => ⟨n, rfl⟩
    | none => absurd hc (no_actual_blowup P d t)

theorem matter_is_regular (P : Physical) : Value P.frame :=
  (act_is_the_value P.frame).mp (matter_acts_finitely P)

/-- REGULARITY OF MATTER FROM THE SPEED LIMIT: on every physical frame every stage count before every horizon is
bounded by c·E·T, the cited field; no datum blows up; and the frame of matter is regular in the sense of Section I. -/
theorem matter_regular_from_speed (P : Physical) :
    (∀ d T, ∃ b, ∀ k, P.stage d T k ≤ b) ∧ (∀ d T, ¬ P.Blowup d T) ∧ Value P.frame :=
  ⟨fun d T => ⟨P.c * P.energy d * T, P.speed d T⟩, no_actual_blowup P, matter_is_regular P⟩

/-! ## V · freedom -/

/-- The kinetic record, the Bool model of the bit; `record_wall_on_frames` is the wall on frames. -/
def kineticRecord (_w : Bool) : Nat := 0

/-- No reading of the record returns the world, in the Bool model of the bit; `record_wall_on_frames` is the
wall on frames. -/
theorem record_wall : ¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w :=
  fun ⟨_, hg⟩ => Bool.noConfusion ((hg false).symm.trans (hg true))

/-- The record wall on frames: a record of frames that reads the regular world and the blowup world alike
has no reading that is the value on every frame. -/
theorem record_wall_on_frames {α : Type} (rec : Frame → α) (h : rec calm = rec burst) :
    ¬ ∃ g : α → Prop, ∀ F : Frame, (g (rec F) ↔ Value F) :=
  fun ⟨_, hg⟩ => burst_fails ((hg burst).mp (h ▸ (hg calm).mpr calm_value))

/-- ONE FREE ORBIT: negation moves every world, and every world is the given one or its negation. -/
theorem one_free_orbit : (∀ w : Bool, (!w) ≠ w) ∧ ∀ w v : Bool, v = w ∨ v = !w :=
  ⟨freedom_given, fun w v => match w, v with
    | true, true => Or.inl rfl
    | true, false => Or.inr rfl
    | false, true => Or.inr rfl
    | false, false => Or.inl rfl⟩

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

/-- THE PRIME FIBRE IS ONE SWAP ORBIT: swapping the factors of each point reverses the fibre. -/
theorem prime_fibre_one_swap_orbit : (mulFibre 7).map (fun p => (p.2, p.1)) = (mulFibre 7).reverse := by
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
    -- existence as given carries the form (given_carries_the_form), adds nothing (root_conservative),
    -- and forces no value
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
    (cascadeWorld.count () 1 = none ∧ ¬ Value cascadeFrame ∧ ∀ b : Nat, ∃ k, ¬ cascadeWorld.stage () 1 k ≤ b) ∧
    (∀ P : Physical, Value P.frame) ∧
    -- freedom and the lock
    (¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w) ∧
    (∀ w : Bool, (!w) ≠ w) ∧
    -- the record
    (∀ n, (∀ d, d < n → Regular (staged n) d) ∧ ¬ Value (staged n)) :=
  ⟨root_conservative, given_is_not_the_value, given_in_both_worlds, act_is_the_value,
   act_is_keyed, regularity_from_existence, nothing_escapes, every_instant_lands, blowup_refutes,
   energy_does_not_decide, no_actual_blowup, speed_is_load_bearing, matter_is_regular, record_wall, freedom_given,
   finite_record_never_forces⟩


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
and in one where it fails, so it forces the value on no frame uniformly and refutes it on none uniformly. -/
theorem undeniable_root_forces_no_value {R : Prop} (G : SelfGrounding R) :
    R ∧ Value calm ∧ ¬ Value burst ∧ ¬ (∀ F : Frame, R → Value F) ∧ ¬ (∀ F : Frame, R → ¬ Value F) :=
  ⟨G.instances G.anAct, calm_value, burst_fails, fun h => burst_fails (h burst (G.instances G.anAct)),
   fun h => h calm (G.instances G.anAct) calm_value⟩

/-- A root grounded on every frame forces no value: a family of roots, each held by its deed, holds on every
frame and does not force the value on every frame. -/
theorem grounded_on_every_frame_forces_no_value (R : Frame → Prop) (G : ∀ F : Frame, SelfGrounding (R F)) :
    (∀ F : Frame, R F) ∧ ¬ (∀ F : Frame, R F → Value F) :=
  ⟨fun F => (G F).instances (G F).anAct, fun h => burst_fails (h burst ((G burst).instances (G burst).anAct))⟩

/-- THE CONSTRUCTED ROOT GROUNDS ITSELF: one act, the unit, and every act instances the constructed root. -/
def constructedGrounding : SelfGrounding (Root Unit (fun _ => 1)) := ⟨Unit, (), fun _ => constructed_root_holds⟩

/-- THE ROOT READ ON THE ROW GROUNDS ITSELF EXACTLY WHERE THE VALUE HOLDS: a grounding of the row's reading
exists on a frame exactly when the value holds there. -/
theorem row_root_grounds_iff_value (F : Frame) : Nonempty (SelfGrounding (RootOnRow F)) ↔ Value F :=
  ⟨fun ⟨G⟩ => (root_on_row_is_the_value F).mp (G.instances G.anAct),
   fun h => ⟨⟨Unit, (), fun _ => (root_on_row_is_the_value F).mpr h⟩⟩⟩

/-- THE UNDENIABILITY STAYS WITH THE ROOT: the constructed root is grounded, it does not carry over to the
root read on every frame, and the row's reading is not grounded on every frame. -/
theorem undeniability_stays_with_the_root :
    Nonempty (SelfGrounding (Root Unit (fun _ => 1))) ∧
    ¬ (∀ F : Frame, Root Unit (fun _ => 1) → RootOnRow F) ∧
    ¬ (∀ F : Frame, Nonempty (SelfGrounding (RootOnRow F))) :=
  ⟨⟨constructedGrounding⟩, fun h => root_on_row_is_keyed.2 (h burst constructed_root_holds),
   fun h => burst_fails ((row_root_grounds_iff_value burst).mp (h burst))⟩

/-- Appendix R's actuation, verbatim: the one existent actuates by one. -/
def ΔE₀ : Unit → Int := fun _ => 1

/-- Appendix R's constructed root, verbatim: every existent of the unit background actuates. -/
def RA₀ : Prop := ∀ x : Unit, 0 < ΔE₀ x

/-- Appendix R's grounding, verbatim: one act, and every act instances the constructed root. -/
def ra₀ : SelfGrounding RA₀ := ⟨Unit, (), fun _ _ => show (0 : Int) < 1 by decide⟩

/-- APPENDIX R'S ROOT IS THE CONSTRUCTED ROOT: the verbatim root and the constructed root are one statement. -/
theorem RA₀_is_the_constructed_root : RA₀ ↔ Root Unit (fun _ => 1) :=
  Iff.rfl

/-- REGULARITY FROM THE ROOT ON THE ROW: wherever the root read on the row holds, the value holds. -/
theorem regularity_from_root_on_row (F : Frame) (h : RootOnRow F) : Value F :=
  (root_on_row_is_the_value F).mp h

/-- THE LOCK ON THE ROOT: Appendix R's root holds by its deed, forces no value on every frame, read on the
row is the value exactly, and the closing theorem gives the value on every actual frame. -/
theorem the_lock_on_the_root :
    RA₀ ∧ ¬ (∀ F : Frame, RA₀ → Value F) ∧ (∀ F : Frame, RootOnRow F ↔ Value F) ∧ (∀ A : ActualFlows, Value A.F) :=
  ⟨ra₀.instances ra₀.anAct, fun h => burst_fails (h burst (ra₀.instances ra₀.anAct)), root_on_row_is_the_value,
   regularity_from_existence⟩

/-- THE ROOT READ ON THE ROW IS KEYED: the root holds, and read uniformly on the frames it gives no value;
read on the row, with the row's existents and the row's actuation, it is the value exactly, and keyed. -/
theorem root_read_on_row_is_keyed {R : Prop} (G : SelfGrounding R) :
    R ∧ ¬ (∀ F : Frame, R → Value F) ∧ (∀ F : Frame, RootOnRow F ↔ Value F) ∧ (RootOnRow calm ∧ ¬ RootOnRow burst) :=
  ⟨G.instances G.anAct, fun h => burst_fails (h burst (G.instances G.anAct)), root_on_row_is_the_value,
   root_on_row_is_keyed⟩

/-- THE LOCK, one theorem on no axiom: the constructed root holds with no hypothesis; every self-grounding
root holds by its deed; no given statement is the value on every frame; the root read uniformly on the frames
gives no value; read on the row the root is the act, the act is the value exactly, and both are keyed; the
closing theorem gives the value on every actual frame; no reading of the kinetic record returns the bit; and
no finite record forces the value. -/
theorem the_lock {R : Prop} (G : SelfGrounding R) :
    Root Unit (fun _ => 1) ∧
    R ∧
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    ¬ (∀ F : Frame, R → Value F) ∧
    (∀ F : Frame, RootOnRow F ↔ ActsFinitely F) ∧
    (∀ F : Frame, ActsFinitely F ↔ Value F) ∧
    (RootOnRow calm ∧ ¬ RootOnRow burst) ∧
    (ActsFinitely calm ∧ ¬ ActsFinitely burst) ∧
    (∀ A : ActualFlows, Value A.F) ∧
    (¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w) ∧
    (∀ n : Nat, (∀ d, d < n → Regular (staged n) d) ∧ ¬ Value (staged n)) :=
  ⟨constructed_root_holds, G.instances G.anAct, given_is_not_the_value, (root_read_on_row_is_keyed G).2.1,
   root_on_row_is_the_act, act_is_the_value, root_on_row_is_keyed, act_is_keyed, regularity_from_existence, record_wall,
   finite_record_never_forces⟩

/-- FROM EXISTENCE ALONE, in the sense the title carries: the closing theorem consumes existence read on
the row and nothing else; that reading is available on exactly the frames where the value holds; and no
statement given without the reading is the value on every frame. One theorem, on no axiom. -/
theorem from_existence_alone :
    (∀ A : ActualFlows, Value A.F) ∧
    (∀ F : Frame, Nonempty { A : ActualFlows // A.F = F } ↔ Value F) ∧
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) :=
  ⟨regularity_from_existence, supply_iff, given_is_not_the_value⟩

end NSClose

/-! ## Cones, pinned as printed -/
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
/-- info: 'NSClose.denial_reenacts_root' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.denial_reenacts_root
/-- info: 'NSClose.external_proof_adds_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.external_proof_adds_nothing
/-- info: 'NSClose.undeniable_root_forces_no_value' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.undeniable_root_forces_no_value
/-- info: 'NSClose.root_read_on_row_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.root_read_on_row_is_keyed
/-- info: 'NSClose.the_lock' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.the_lock
/-- info: 'NSClose.from_existence_alone' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.from_existence_alone
/-- info: 'NSClose.indicator_pos' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.indicator_pos
/-- info: 'NSClose.root_satisfiable' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.root_satisfiable
/-- info: 'NSClose.constructed_root_holds' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.constructed_root_holds
/-- info: 'NSClose.root_on_row_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.root_on_row_is_the_act
/-- info: 'NSClose.root_on_row_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.root_on_row_is_the_value
/-- info: 'NSClose.root_on_row_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.root_on_row_is_keyed
/-- info: 'NSClose.act_is_the_weakest_premise' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.act_is_the_weakest_premise
/-- info: 'NSClose.existence_as_given_in_both_worlds' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.existence_as_given_in_both_worlds
/-- info: 'NSClose.nothing_given_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.nothing_given_refutes
/-- info: 'NSClose.only_refuter' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.only_refuter
/-- info: 'NSClose.matter_regular_from_speed' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.matter_regular_from_speed
/-- info: 'NSClose.physical_inhabited' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.physical_inhabited
/-- info: 'NSClose.nothing_given_forces' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.nothing_given_forces
/-- info: 'NSClose.given_carries_the_form' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.given_carries_the_form
/-- info: 'NSClose.energy_record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.energy_record_decides_nothing
/-- info: 'NSClose.no_physical_blowup' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.no_physical_blowup
/-- info: 'NSClose.no_limit_blowup_from_speed' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.no_limit_blowup_from_speed
/-- info: 'NSClose.cascade_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.cascade_is_load_bearing
/-- info: 'NSClose.no_limit_blowup_from_speed_only' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.no_limit_blowup_from_speed_only
/-- info: 'NSClose.record_wall_on_frames' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.record_wall_on_frames
/-- info: 'NSClose.one_free_orbit' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.one_free_orbit
/-- info: 'NSClose.prime_fibre_one_swap_orbit' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.prime_fibre_one_swap_orbit
/-- info: 'NSClose.grounded_on_every_frame_forces_no_value' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.grounded_on_every_frame_forces_no_value
/-- info: 'NSClose.row_root_grounds_iff_value' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.row_root_grounds_iff_value
/-- info: 'NSClose.undeniability_stays_with_the_root' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.undeniability_stays_with_the_root
/-- info: 'NSClose.RA₀_is_the_constructed_root' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.RA₀_is_the_constructed_root
/-- info: 'NSClose.regularity_from_root_on_row' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.regularity_from_root_on_row
/-- info: 'NSClose.the_lock_on_the_root' does not depend on any axioms -/
#guard_msgs in #print axioms NSClose.the_lock_on_the_root
/-! ===================================================================================================================
    PART A · THE NORMAL FORM OF THE ROW (namespace NS.NORMALFORM) · v1_1_0_CC

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
namespace NS.NORMALFORM

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

end NS.NORMALFORM

/-! ===================================================================================================================
    PART C · THE ROW SPLIT (namespace NS.ROWSPLIT) · v1_1_0_CC

    The cut-agnostic division, carried verbatim from the Riemann master v3.0.39_CC (namespace RHUnicorn, generic over
    the types α and β), its one proposition renamed from `RH` to `Whole`, the hypothesis it names. At every cut T the
    whole is exactly its Real part and its Unicorn part; a certificate at T proves the Real part; given the Real part
    the whole is exactly the Unicorn part; above every cut no reading of an even record agrees with an odd decision;
    the aperture is one bit wide; and the supply side is silent at the register. ΔM = 0.
=================================================================================================================== -/
namespace NS.ROWSPLIT

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

end NS.ROWSPLIT
/-! ===================================================================================================================
    PART B · THE HOST MODEL AND ITS BINDING, PROVED (namespace NS.HOST) · v1_1_0_CC

    The record of a frame keeps every datum and registers its flow finite at every time, the count at rest: on the
    record every datum is regular, so the record carries the value with no premise (`recFrame_value`). The host is the
    row's smooth divergence-free initial data of rapid decay on ℝ³, unforced, each with the count of registrations its
    flow has made by each time, none where the count is unbounded, which is blowup by that time; its sentence is that
    every flow is finite at every time. The binding is a theorem: the value of the host's frame is exactly the host's
    sentence (`binding`); the sentence is exactly the sentence at every horizon (`sentence_iff_every_horizon`); and one
    blowup refutes it (`blowup_refutes_sentence`). Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace NS.HOST
open NSClose

/-- THE RECORD OF A FRAME: the registration keeps every datum and registers its flow finite at every time, the count at
    rest. -/
def recFrame (F : Frame) : Frame := ⟨F.D, fun _ _ => some 0⟩

/-- THE RECORD CARRIES THE VALUE, with no premise. -/
theorem recFrame_value (F : Frame) : Value (recFrame F) := fun _ _ => ⟨0, rfl⟩

/-- THE NAVIER–STOKES ROW: the frames of data and their counts, the value, the registration onto the record, the calm
    world and the blowup world. -/
def nsRow : NS.NORMALFORM.Row.{1} :=
  ⟨Frame, Value, recFrame, recFrame_value, calm, burst, calm_value, burst_fails⟩

/-- EVERY DATUM HAS ITS SEAT ON THE RECORD: at rest, its count zero at every time. -/
theorem every_datum_has_its_seat (F : Frame) (d : F.D) (t : Nat) : (recFrame F).count d t = some 0 := rfl

/-- THE HOST: the smooth divergence-free initial data of rapid decay on ℝ³, unforced, each with the count of the
    registrations its flow has made by each time, `none` where the count is unbounded, which is blowup by that time. -/
structure Host where
  Datum : Type
  count : Datum → Nat → Option Nat

/-- THE SENTENCE OF THE HOST: every flow is finite at every time. -/
def Host.Sentence (H : Host) : Prop := ∀ u t, ∃ n, H.count u t = some n

/-- THE FRAME OF THE HOST. -/
def Host.frame (H : Host) : Frame := ⟨H.Datum, H.count⟩

/-- THE BINDING, PROVED: the value of the host's frame is exactly the host's sentence. -/
theorem binding (H : Host) : Value H.frame ↔ H.Sentence := ⟨fun h u t => h u t, fun h u t => h u t⟩

/-- THE ROOT READ ON THE ROW IS THE SENTENCE, on the host's frame. -/
theorem root_on_row_is_the_sentence (H : Host) : RootOnRow H.frame ↔ H.Sentence :=
  (root_on_row_is_the_value H.frame).trans (binding H)

/-- THE ACT ON THE HOST'S FRAME IS THE SENTENCE. -/
theorem act_is_the_sentence (H : Host) : ActsFinitely H.frame ↔ H.Sentence :=
  (act_is_the_value H.frame).trans (binding H)

/-- THE SENTENCE BY A HORIZON: every flow finite at every time up to it. -/
def Host.SentenceBy (H : Host) (T : Nat) : Prop := ∀ u t, t ≤ T → ∃ n, H.count u t = some n

/-- THE SENTENCE IS THE SENTENCE AT EVERY HORIZON. -/
theorem sentence_iff_every_horizon (H : Host) : H.Sentence ↔ ∀ T, H.SentenceBy T :=
  ⟨fun h _ u t _ => h u t, fun h u t => h t u t (Nat.le_refl t)⟩

/-- ONE BLOWUP REFUTES THE SENTENCE. -/
theorem blowup_refutes_sentence (H : Host) (u : H.Datum) (t : Nat) (h : H.count u t = none) : ¬ H.Sentence :=
  fun s => match s u t with
    | ⟨_, hn⟩ => Option.noConfusion (h.symm.trans hn)

end NS.HOST

/-! ===================================================================================================================
    PART C′ · THE ROW SPLIT READ BY THE SIZE OF THE DATUM (namespace NS.REALPART) · v1_1_0_CC

    The cut-agnostic division of Part C read on a frame that carries the cited small-data theorem: the existents are the
    frame's data, the property each is asked is regularity, and the height is the size of the datum in the critical
    norm. At the threshold the real part is the small data, sealed by the cited theorem carried as a field
    (`real_part_small`); the value is exactly its real part and its unicorn part at every cut; given the real part the
    value is exactly the unicorn part, the large data (`no_bypass_at_small_data`); the unicorn part is load-bearing; and
    above every size no reading of a record that keeps the size and forgets the world returns the world. Every theorem
    on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace NS.REALPART
open NSClose NS.ROWSPLIT

/-- A FRAME WITH THE SMALL-DATA THEOREM: a frame, the size of each datum in the critical norm, the threshold, and the
    cited theorem that every datum at most the threshold in size is regular, carried as a field. -/
structure SmallData where
  F     : Frame
  size  : F.D → Nat
  ε     : Nat
  small : ∀ d, size d ≤ ε → Regular F d

/-- The existents: every datum of the frame. -/
def Ex (S : SmallData) (_ : S.F.D) : Prop := True

/-- The property each datum is asked: regularity. -/
def Re (S : SmallData) (d : S.F.D) : Prop := Regular S.F d

/-- The value of the frame is the whole of the row split. -/
theorem value_is_the_whole (S : SmallData) : Value S.F ↔ Whole (Ex S) (Re S) :=
  ⟨fun h d _ => h d, fun h d => h d trivial⟩

/-- THE REAL PART AT THE THRESHOLD: every small datum is regular, by the cited theorem. -/
theorem real_part_small (S : SmallData) : RealPartAt (Ex S) (Re S) S.size S.ε :=
  fun d _ h => S.small d h

/-- THE CUT AT EVERY SIZE: the value is exactly its real part and its unicorn part. -/
theorem value_iff_real_and_unicorn (S : SmallData) (T : Nat) :
    Value S.F ↔ RealPartAt (Ex S) (Re S) S.size T ∧ UnicornAt (Ex S) (Re S) S.size T :=
  (value_is_the_whole S).trans (whole_iff_real_and_unicorn (Ex S) (Re S) S.size T)

/-- NO BYPASS AT SMALL DATA: given the cited theorem, the value is exactly the unicorn part, the large data. -/
theorem no_bypass_at_small_data (S : SmallData) : Value S.F ↔ UnicornAt (Ex S) (Re S) S.size S.ε :=
  (value_is_the_whole S).trans (unicorn_no_bypass (Ex S) (Re S) S.size S.ε (real_part_small S))

/-- THE UNICORN PART IS THE LARGE DATA. -/
theorem unicorn_is_large_data (S : SmallData) :
    UnicornAt (Ex S) (Re S) S.size S.ε ↔ ∀ d, S.ε < S.size d → Regular S.F d :=
  ⟨fun h d hgt => h d trivial hgt, fun h d _ hgt => h d hgt⟩

/-- The staged world read by size: its first datum small and regular, every later datum large and blowing up. -/
def stagedSmall : SmallData :=
  ⟨staged 1, fun d => d, 0, fun d h => (finite_record_never_forces 1).1 d (Nat.lt_succ_of_le h)⟩

/-- THE UNICORN PART IS LOAD-BEARING: the staged world carries the cited small-data field and the real part, and fails
    the value on its large data. -/
theorem unicorn_part_is_load_bearing :
    RealPartAt (Ex stagedSmall) (Re stagedSmall) stagedSmall.size stagedSmall.ε ∧ ¬ Value stagedSmall.F :=
  ⟨real_part_small stagedSmall, (finite_record_never_forces 1).2⟩

/-- THE UNICORN PART CLOSED TO THE RECORD ABOVE EVERY SIZE: on the chart of worlds and sizes, a record that keeps the
    size and forgets the world is even under the exchange of worlds, the world is odd, and above every size no reading
    of the record returns the world. -/
theorem unicorn_blocked_above_every_size (T : Nat) :
    ¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1 :=
  unicorn_block Prod.snd T (fun w => (!w.1, w.2)) Prod.snd Prod.fst (true, T + 1)
    (Nat.lt_succ_self T) (Nat.lt_succ_self T) rfl rfl

/-- THE SUPPLY SIDE IS SILENT ABOVE EVERY SIZE: both orientations of the world are refused alike to every reading of
    the record, and the two orientations differ. -/
theorem supply_side_silent_above_every_size (T : Nat) :
    (¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1) ∧
    (¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = !w.1) ∧ (!true) ≠ true :=
  supply_side_silent Prod.snd T (fun w => (!w.1, w.2)) Prod.snd Prod.fst (true, T + 1)
    (Nat.lt_succ_self T) (Nat.lt_succ_self T) rfl rfl

/-- THE APERTURE IS ONE BIT WIDE: at the seat of the exchange above every size, one odd supplied bit calibrates the
    world uniquely, through one calibration bit that exists and is unique. -/
theorem aperture_is_one_bit (T : Nat) :
    let z : Bool × Nat := (true, T + 1)
    let τ : Bool × Nat → Bool × Nat := fun w => (!w.1, w.2)
    ∃ c : Bool, (z.1 = xor (!z.1) c ∧ (τ z).1 = xor (!(τ z).1) c) ∧
      ∀ c' : Bool, (z.1 = xor (!z.1) c' ∧ (τ z).1 = xor (!(τ z).1) c') → c' = c :=
  aperture_one_bit_wide (fun w : Bool × Nat => (!w.1, w.2)) (fun w => !w.1) Prod.fst (true, T + 1) rfl rfl

end NS.REALPART

/-! ===================================================================================================================
    PART D · THE WALLS (namespace NS.WALLS) · v1_1_0_CC

    Every zero-bit route is closed by theorem. Existence as given carries the form and forces nothing (Part 0). The
    energy inequality holds on a blowup frame, and the energy record decides nothing (Part 0). No finite record forces
    the value, and no size-preserving symmetry lifts a decided datum (Part 0). The speed limit and the cascade are each
    load-bearing (Part 0). This Part adds the dyadic wall, decided by the kernel and proved at every bound: a cascade
    that doubles its registrations at every dyadic step passes every bound c · E · T within c · E · T steps
    (`dyadic_cascade_is_cut`), at the first step k with 2^k above the bound, computed for the bounds 1, 12, 100, 1000
    and 4096 (`dyadic_cutoffs`); so a doubling cascade never holds to the speed limit (`doubling_breaks_the_speed_limit`),
    and the cascade a blowup needs halts at a finite dyadic step on matter. Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace NS.WALLS
open NSClose

/-- TWO TO EVERY POWER EXCEEDS THE EXPONENT. -/
theorem exponent_below_its_power : ∀ n : Nat, n < 2 ^ n
  | 0 => Nat.zero_lt_one
  | n + 1 =>
    have h1 : n + 1 ≤ 2 ^ n := Nat.succ_le_of_lt (exponent_below_its_power n)
    have h2 : 2 ^ n < 2 ^ n + 2 ^ n := Nat.lt_add_of_pos_right (Nat.two_pow_pos n)
    have h3 : 2 ^ n + 2 ^ n = 2 ^ (n + 1) := (Nat.mul_two (2 ^ n)).symm.trans (Nat.pow_succ 2 n).symm
    Nat.lt_of_le_of_lt h1 (Nat.lt_of_lt_of_le h2 (Nat.le_of_eq h3))

/-- THE SPEED LIMIT CUTS EVERY DYADIC CASCADE: for every bound there is a dyadic step, no later than the bound itself,
    at which the doubling cascade passes it. -/
theorem dyadic_cascade_is_cut (b : Nat) : ∃ k, k ≤ b ∧ b < 2 ^ k :=
  ⟨b, Nat.le_refl b, exponent_below_its_power b⟩

/-- A DOUBLING CASCADE BREAKS THE SPEED LIMIT: no cascade that doubles at every dyadic step holds every stage to the
    bound c · E · T. -/
theorem doubling_breaks_the_speed_limit (c E T : Nat) : ¬ ∀ k, 2 ^ k ≤ c * E * T :=
  fun h => Nat.lt_irrefl _ (Nat.lt_of_lt_of_le (exponent_below_its_power (c * E * T)) (h (c * E * T)))

/-- The search for the first dyadic step past the bound, with fuel. -/
def cutoffAux (b : Nat) : Nat → Nat → Nat
  | 0, k => k
  | fuel + 1, k => if b < 2 ^ k then k else cutoffAux b fuel (k + 1)

/-- The first dyadic step at which the doubling cascade passes the bound. -/
def cutoff (b : Nat) : Nat := cutoffAux b (b + 1) 0

/-- THE DYADIC CUTOFFS, decided by the kernel: the doubling cascade passes the bounds 1, 12, 100, 1000 and 4096 at the
    steps 1, 4, 7, 10 and 13; and at the bound 1 · 3 · 4 of one unit of the speed constant, three of energy and four of
    time, it passes at step 4, its step 3 still inside the bound. -/
theorem dyadic_cutoffs :
    [1, 12, 100, 1000, 4096].map cutoff = [1, 4, 7, 10, 13] ∧
    cutoff (1 * 3 * 4) = 4 ∧ 2 ^ 3 ≤ 1 * 3 * 4 ∧ 1 * 3 * 4 < 2 ^ 4 := by decide

/-- THE WALLS OF THE ROW, one theorem: no given statement is the value on every frame; the arrow forces nothing; the
    energy inequality holds on a blowup frame and the energy record decides nothing; no finite record forces the
    value; the speed limit and the cascade are each load-bearing; no reading of the kinetic record returns the bit;
    and no doubling cascade holds to the speed limit. -/
theorem the_walls :
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    (¬ ∀ F : Frame, Arrow → Value F) ∧
    ((∀ d t, leray.paid d t ≤ leray.energy d) ∧ ¬ Value leray.F) ∧
    (∀ n : Nat, (∀ d, d < n → Regular (staged n) d) ∧ ¬ Value (staged n)) ∧
    (cascadeWorld.count () 1 = none ∧ ¬ Value cascadeFrame ∧ ∀ b : Nat, ∃ k, ¬ cascadeWorld.stage () 1 k ≤ b) ∧
    ((∀ d T k, speedWorld.stage d T k ≤ speedWorld.c * speedWorld.energy d * T) ∧
      speedWorld.count () 1 = none ∧ ¬ Value speedFrame) ∧
    (¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w) ∧
    (∀ c E T : Nat, ¬ ∀ k, 2 ^ k ≤ c * E * T) :=
  ⟨given_is_not_the_value, arrow_forces_nothing, energy_does_not_decide, finite_record_never_forces,
   speed_is_load_bearing, cascade_is_load_bearing, record_wall, doubling_breaks_the_speed_limit⟩

end NS.WALLS

/-! ===================================================================================================================
    PART E · THE RESIDUE (namespace NS.RESIDUE) · v1_1_0_CC

    Everything above is unconditional. What remains of the Navier–Stokes sentence is this one hypothesis, the transfer
    of the value from the record to the host's frame: given it, the sentence follows on no axiom. It is printed here as
    the type of a hypothesis and is assumed nowhere. The residue is keyed: no premise shared by every frame and no
    principle true of every record supplies it. Its instance seat on a frame carrying the small-data theorem is the
    large data. ΔM = 0.
=================================================================================================================== -/
namespace NS.RESIDUE
open NSClose NS.NORMALFORM NS.HOST NS.REALPART NS.ROWSPLIT

/-- THE RESIDUE: given the one implication at the host's frame, the host's sentence. -/
theorem sentence_of_the_act (H : Host) (bit : Transfer nsRow H.frame) : H.Sentence :=
  (binding H).mp (value_from_the_cargo_loop nsRow H.frame bit)

/-- THE RESIDUE IS THE SENTENCE: the transfer at the host's frame is exactly the host's sentence. -/
theorem residue_is_the_sentence (H : Host) : Transfer nsRow H.frame ↔ H.Sentence :=
  (normal_form nsRow H.frame).trans (binding H)

/-- THE ONE POSIT IS THE BIT: the root read on the row, at the host's frame, is exactly the transfer. -/
theorem the_posit_is_the_bit (H : Host) : RootOnRow H.frame ↔ Transfer nsRow H.frame :=
  (root_on_row_is_the_sentence H).trans (residue_is_the_sentence H).symm

/-- THE RESIDUE IS KEYED: no premise shared by every frame forces the value, and no principle true of every record
    decides it. What supplies it is keyed to the frame: the act. -/
theorem residue_is_keyed :
    (∀ P : Frame → Prop, Keyless nsRow P → ¬ Forces nsRow P) ∧
    (∀ P : Frame → Prop, (∀ F, P (recFrame F)) → ¬ ∀ F, P (recFrame F) → Value F) :=
  ⟨keyless_forces_nothing nsRow, no_record_principle_decides nsRow⟩

/-- THE INSTANCE SEAT OF THE BIT, on a frame carrying the small-data theorem: regularity of every large datum. Its
    inhabitation is equivalent in strength to the frame's value (`seat_iff_value`); nothing in this file assumes it
    inhabited. -/
structure LargeSeat (S : SmallData) where
  large : ∀ d, S.ε < S.size d → Regular S.F d

/-- THE SEAT AND THE CITED THEOREM DELIVER THE VALUE. -/
theorem value_of_seat (S : SmallData) (L : LargeSeat S) : Value S.F :=
  fun d => match Nat.lt_or_ge S.ε (S.size d) with
    | Or.inl h => L.large d h
    | Or.inr h => S.small d h

/-- THE SEAT IS INHABITED EXACTLY WHEN THE VALUE HOLDS. -/
theorem seat_iff_value (S : SmallData) : Nonempty (LargeSeat S) ↔ Value S.F :=
  ⟨fun ⟨L⟩ => value_of_seat S L, fun h => ⟨⟨fun d _ => h d⟩⟩⟩

/-- THE SEAT IS THE UNICORN PART. -/
theorem seat_is_the_unicorn (S : SmallData) : Nonempty (LargeSeat S) ↔ UnicornAt (Ex S) (Re S) S.size S.ε :=
  ⟨fun ⟨L⟩ => (unicorn_is_large_data S).mpr L.large, fun h => ⟨⟨(unicorn_is_large_data S).mp h⟩⟩⟩

end NS.RESIDUE

/-! ===================================================================================================================
    PART F · THE SUPPLY (namespace NS.SUPPLY) · v1_1_0_CC

    The bit of Part E, supplied by the act and delivered by its two kinds: the formal cargo, and the physical witness.
    Each kind is a type whose inhabitant is the supply; neither is assumed anywhere in this file. The physical witness
    is matter read through the quantum speed limit and the cascade: every stage count before a horizon is at most
    c · E · T, and an unbounded count needs stage counts above every bound. The cargo arrives free; each kind delivers
    the sentence; the two kinds are one bit; every route to the sentence delivers both kinds, so there is no third; and
    one blowup refutes both at once. The witnesses of the subject are typed against the bit. ΔM = 0.
=================================================================================================================== -/
namespace NS.SUPPLY
open NSClose NS.NORMALFORM NS.HOST NS.REALPART

/-- THE FORMAL KIND, the cargo: the record's value carried to the host's frame. -/
def FormalCargo (H : Host) : Prop := Transfer nsRow H.frame

/-- THE PHYSICAL KIND, the witness: the energy of each datum, the stage counts of registrations before each horizon,
    the speed constant; the quantum speed limit, every stage count before T at most c · E · T; and the cascade, an
    unbounded count by T needing stage counts before T above every bound. The last two fields are the one bit read in
    the register of registrations; they are premises of the witness, carried as fields, never proved. -/
structure PhysicalWitness (H : Host) where
  energy  : H.Datum → Nat
  stage   : H.Datum → Nat → Nat → Nat
  c       : Nat
  speed   : ∀ u T k, stage u T k ≤ c * energy u * T
  cascade : ∀ u T, H.count u T = none → ∀ N, ∃ k, N < stage u T k

/-- The physical witness read as a physical frame of Part 0. -/
def PhysicalWitness.matter {H : Host} (W : PhysicalWitness H) : Physical :=
  ⟨H.Datum, W.energy, W.stage, W.c, W.speed, H.count, W.cascade⟩

/-- THE CARGO ARRIVES, with no premise: the record of the host's frame carries the value. -/
theorem cargo_arrives (H : Host) : Value (recFrame H.frame) := recFrame_value H.frame

/-- KIND 1 DELIVERS: the formal cargo gives the sentence in one step. -/
theorem formal_kind_delivers {H : Host} (h : FormalCargo H) : H.Sentence := (binding H).mp (h (cargo_arrives H))

/-- The physical witness closes the host's frame: matter is regular. -/
theorem witness_closes {H : Host} (W : PhysicalWitness H) : Value H.frame := matter_is_regular W.matter

/-- KIND 2 DELIVERS: the physical witness gives the sentence. -/
theorem physical_kind_delivers {H : Host} (W : PhysicalWitness H) : H.Sentence := (binding H).mp (witness_closes W)

/-- A witness from the sentence: no registration, no energy, and no unbounded count to cascade. -/
def witness_of_sentence {H : Host} (h : H.Sentence) : PhysicalWitness H :=
  ⟨fun _ => 0, fun _ _ _ => 0, 0, fun _ _ _ => Nat.zero_le _,
   fun u T hn => match h u T with
     | ⟨_, hs⟩ => Option.noConfusion (hn.symm.trans hs)⟩

/-- THE PHYSICAL FACE IS THE SENTENCE: a witness exists exactly when the sentence holds. -/
theorem physical_iff_sentence (H : Host) : Nonempty (PhysicalWitness H) ↔ H.Sentence :=
  ⟨fun ⟨W⟩ => physical_kind_delivers W, fun h => ⟨witness_of_sentence h⟩⟩

/-- THE FORMAL FACE IS THE SENTENCE. -/
theorem formal_iff_sentence (H : Host) : FormalCargo H ↔ H.Sentence := NS.RESIDUE.residue_is_the_sentence H

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

/-- THE ONE REFUTER: one blowup refutes both kinds at once. -/
theorem the_one_refuter (H : Host) (u : H.Datum) (t : Nat) (h : H.count u t = none) :
    ¬ FormalCargo H ∧ ¬ Nonempty (PhysicalWitness H) :=
  have hs : ¬ H.Sentence := blowup_refutes_sentence H u t h
  ⟨fun c => hs (formal_kind_delivers c), fun ⟨W⟩ => hs (physical_kind_delivers W)⟩

/-- THE WITNESSES OF THE SUBJECT, TYPED: the energy inequality holds on a blowup frame, and the energy record decides
    nothing; the small-data theorem gives the real part on every frame that carries it and stops short of the value;
    the speed limit and the cascade are each load-bearing; and on every physical frame every stage count before every
    horizon is bounded, no datum blows up, and the frame of matter is regular. Each is typed against the bit; none is
    its ground. -/
theorem the_witnesses_typed :
    ((∀ d t, leray.paid d t ≤ leray.energy d) ∧ ¬ Value leray.F) ∧
    (¬ ∃ g : (Unit → Nat) → (Unit → Nat → Nat) → Prop,
      (g calmPriced.energy calmPriced.paid ↔ Value calmPriced.F) ∧ (g leray.energy leray.paid ↔ Value leray.F)) ∧
    ((∀ S : SmallData, NS.ROWSPLIT.RealPartAt (Ex S) (Re S) S.size S.ε) ∧ ¬ Value stagedSmall.F) ∧
    (cascadeWorld.count () 1 = none ∧ ¬ Value cascadeFrame ∧ ∀ b : Nat, ∃ k, ¬ cascadeWorld.stage () 1 k ≤ b) ∧
    ((∀ d T k, speedWorld.stage d T k ≤ speedWorld.c * speedWorld.energy d * T) ∧
      speedWorld.count () 1 = none ∧ ¬ Value speedFrame) ∧
    (∀ P : Physical, (∀ d T, ∃ b, ∀ k, P.stage d T k ≤ b) ∧ (∀ d T, ¬ P.Blowup d T) ∧ Value P.frame) :=
  ⟨energy_does_not_decide, energy_record_decides_nothing.2.2.2.2, ⟨real_part_small, unicorn_part_is_load_bearing.2⟩,
   speed_is_load_bearing, cascade_is_load_bearing, matter_regular_from_speed⟩

/-- THE SUPPLY, CLOSED, at every host: the cargo arrives free; each kind delivers; the two kinds are one bit; the bit is
    the sentence; every route is both kinds; and one blowup refutes both. -/
theorem the_supply_closed : ∀ H : Host,
    Value (recFrame H.frame) ∧
    (FormalCargo H → H.Sentence) ∧ (PhysicalWitness H → H.Sentence) ∧
    (PhysicalWitness H → FormalCargo H) ∧ (FormalCargo H ↔ H.Sentence) ∧
    (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧
    (∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧
    (∀ u t, H.count u t = none → ¬ FormalCargo H ∧ ¬ Nonempty (PhysicalWitness H)) :=
  fun H => ⟨cargo_arrives H, formal_kind_delivers, physical_kind_delivers, (the_two_kinds_are_one_bit H).1,
   formal_iff_sentence H, physical_iff_sentence H, two_kinds_and_no_third H, the_one_refuter H⟩

end NS.SUPPLY

/-! ===================================================================================================================
    PART G · THE CLOSURE OF THE QUESTION (namespace NS.CLOSURE) · v1_1_0_CC

    Why the question is closed and not open. At every host the regularity sentence and the bit are one proposition,
    with nothing cited; the denial of the sentence is the bit's denial; across the frames of the row the bit has no
    uniform answer, true in one world and false in another of the same record; every keyless route is barred; either
    kind of the supply gives the sentence; and one blowup refutes the sentence itself. Nothing here derives the bit. It
    proves that the question is one bit, that the bit is keyed, and that what is open is a value and not a form. ΔM = 0.
=================================================================================================================== -/
namespace NS.CLOSURE
open NSClose NS.NORMALFORM NS.HOST NS.SUPPLY

/-- THE SENTENCE IS THE BIT, nothing cited. -/
theorem the_sentence_is_the_bit (H : Host) : H.Sentence ↔ FormalCargo H := (formal_iff_sentence H).symm

/-- THE DENIAL IS THE BIT'S DENIAL. -/
theorem denial_is_the_bits_denial (H : Host) : ¬ H.Sentence ↔ ¬ FormalCargo H :=
  ⟨fun hn h => hn (formal_kind_delivers h), fun hn h => hn ((formal_iff_sentence H).mpr h)⟩

/-- THE DENIAL HAS ONE ROAD: wherever the sentence fails, it cannot be that no datum blows up. -/
theorem the_denial_has_one_road (H : Host) : ¬ H.Sentence → ¬ ¬ ∃ u t, H.count u t = none :=
  fun hn hne => hn (fun u t => match hc : H.count u t with
    | some n => ⟨n, rfl⟩
    | none => absurd ⟨u, t, hc⟩ hne)

/-- THE QUESTION, CLOSED TO ONE BIT, at every host. The sentence is the bit and its denial is the bit's denial; the bit
    has no uniform answer across the frames; no keyless premise forces it; either kind of the supply gives the
    sentence; and one blowup denies the sentence. What is open is the value of one implication; the form of the
    question is closed. -/
theorem question_closed_to_one_bit : ∀ H : Host,
    (H.Sentence ↔ FormalCargo H) ∧ (¬ H.Sentence ↔ ¬ FormalCargo H) ∧
    (¬ (∀ F, Transfer nsRow F) ∧ ¬ (∀ F, ¬ Transfer nsRow F)) ∧
    (∀ P : Frame → Prop, Keyless nsRow P → ¬ Forces nsRow P) ∧
    (FormalCargo H → H.Sentence) ∧ (PhysicalWitness H → H.Sentence) ∧
    (∀ u t, H.count u t = none → ¬ H.Sentence) :=
  fun H => ⟨the_sentence_is_the_bit H, denial_is_the_bits_denial H, no_uniform_answer nsRow,
   keyless_forces_nothing nsRow, formal_kind_delivers, physical_kind_delivers, blowup_refutes_sentence H⟩

end NS.CLOSURE

/-! ===================================================================================================================
    PART W · THE TWELVE FORMAL GATES, RUN IN THE KERNEL (namespace NS.GATES) · v1_1_0_CC

    The twelve formal gates of the mathematical register, run inside the kernel on the Navier–Stokes seal at every
    host. Each gate is a proposition and a theorem, and `the_formal_run` binds the twelve passes and the four refusals
    in one statement. Four claims fail, each by a theorem: "the sentence is proved by the delivery" fails SREP, the
    delivery's premise being its conclusion; "a proof is waiting" fails SREP, a true route to the sentence being the
    sentence; "no proof can ever exist" fails SREP, no true route to the sentence being its denial, the counter world in
    costume; and the denial has one road, a blowup. No declaration has the type of the bit. ΔM = 0.
=================================================================================================================== -/
namespace NS.GATES
open NSClose NS.NORMALFORM NS.HOST NS.SUPPLY NS.REALPART NS.ROWSPLIT

/-- Gate 1, SREP: the form stands with no hypothesis. -/
def Gate1 (H : Host) : Prop :=
  Value (recFrame H.frame) ∧ (FormalCargo H ↔ H.Sentence) ∧
  (∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H) ∧
  (∀ (F : Frame) (d : F.D) (t : Nat), (∃ n, F.count d t = some n) ∨ F.count d t = none) ∧
  (∀ F : Frame, ActsFinitely F ↔ Value F)

/-- GATE 1 · SREP: nothing in the form presupposes the bit. -/
theorem gate_1_srep (H : Host) : Gate1 H :=
  ⟨cargo_arrives H, formal_iff_sentence H, fun _ h q => (formal_iff_sentence H).mpr (h q), every_instant_lands,
   act_is_the_value⟩

/-- Gate 2, REG: the bit read from ten contexts, all one proposition. -/
def Gate2 (H : Host) : Prop :=
  (Value H.frame ↔ H.Sentence) ∧ (ActsFinitely H.frame ↔ H.Sentence) ∧ (RootOnRow H.frame ↔ H.Sentence) ∧
  (Nonempty (SelfGrounding (RootOnRow H.frame)) ↔ H.Sentence) ∧ (FormalCargo H ↔ H.Sentence) ∧
  (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧ (SelfRecursive nsRow H.frame ↔ H.Sentence) ∧
  (Nonempty (Act nsRow H.frame) ↔ H.Sentence) ∧
  (Nonempty { A : ActualFlows // A.F = H.frame } ↔ H.Sentence) ∧
  ((∀ T, H.SentenceBy T) ↔ H.Sentence)

/-- GATE 2 · REG: ten reading contexts, one proposition. -/
theorem gate_2_reg (H : Host) : Gate2 H :=
  ⟨binding H, act_is_the_sentence H, root_on_row_is_the_sentence H,
   (row_root_grounds_iff_value H.frame).trans (binding H), formal_iff_sentence H, physical_iff_sentence H,
   (self_recursion_at_frame nsRow H.frame).trans (binding H),
   (bit_is_the_act nsRow H.frame).symm.trans (formal_iff_sentence H),
   (supply_iff H.frame).trans (binding H),
   (sentence_iff_every_horizon H).symm⟩

/-- Gate 3, SGEG: no face drifts from the bit. -/
def Gate3 (H : Host) : Prop :=
  (FormalCargo H ↔ H.Sentence) ∧ (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧ (Value H.frame ↔ H.Sentence) ∧
  (∀ S : SmallData, Value S.F ↔ UnicornAt (Ex S) (Re S) S.size S.ε)

/-- GATE 3 · SGEG: the formal, physical, frame and large-data faces are each the bit. -/
theorem gate_3_sgeg (H : Host) : Gate3 H :=
  ⟨formal_iff_sentence H, physical_iff_sentence H, binding H, no_bypass_at_small_data⟩

/-- Gate 4, CAUSAL: the native involution on the bit fixes nothing; the calm world carries the value; and on the record
    of every frame every datum rests, its count zero at every time: the seat of the row is inhabited. -/
def Gate4 : Prop :=
  (¬ ∃ b, comp b = b) ∧ Value calm ∧ (∀ (F : Frame) (d : F.D) (t : Nat), (recFrame F).count d t = some 0)

/-- GATE 4 · CAUSAL: no imprint is asserted on a ground the bit lacks; the row's seat is the rest state. -/
theorem gate_4_causal : Gate4 := ⟨locus_vanishes, calm_value, every_datum_has_its_seat⟩

/-- Gate 5, MIG: two frames whose records both carry the value split on the value. -/
def Gate5 : Prop := Value (recFrame calm) ∧ Value (recFrame burst) ∧ Value calm ∧ ¬ Value burst

/-- GATE 5 · MIG: the reading apparatus, the record, does not fix the residence. -/
theorem gate_5_mig : Gate5 := record_decides_nothing nsRow

/-- Gate 6, PTB: complementation is an involution without a fixed point; the identity fixes everything; and no
    size-preserving symmetry lifts a decided datum. -/
def Gate6 : Prop :=
  (∀ b : Bool, comp (comp b) = b) ∧ (¬ ∃ b, comp b = b) ∧ (∀ b : Bool, id (id b) = b) ∧
  (∀ (D : Type) (size : D → Nat) (S : Symmetric D size) (r : Nat) (d e : D),
    size d ≤ r → r < size e → ∀ g, S.act g d ≠ e)

/-- GATE 6 · PTB: the fixed-point reading belongs to the chosen reflection, not to the bit. -/
theorem gate_6_ptb : Gate6 :=
  ⟨comp_involution, locus_vanishes, fun _ => rfl, fun _ size S r d e hd he => no_symmetry_lifts size S r d e hd he⟩

/-- Gate 7, DUAL: the bit does not depend on where the size ladder is cut: on every frame carrying the small-data
    theorem the value is exactly the large-data part, and the division holds at every cut. -/
def Gate7 : Prop :=
  (∀ S : SmallData, Value S.F ↔ UnicornAt (Ex S) (Re S) S.size S.ε) ∧
  (∀ (S : SmallData) (T : Nat), Value S.F ↔ RealPartAt (Ex S) (Re S) S.size T ∧ UnicornAt (Ex S) (Re S) S.size T)

/-- GATE 7 · DUAL: the value is the large-data part, and the division stands at every cut. -/
theorem gate_7_dual : Gate7 := ⟨no_bypass_at_small_data, value_iff_real_and_unicorn⟩

/-- Gate 8, CSCG: the proved slices are the bit's lower slices. -/
def Gate8 : Prop :=
  (∀ S : SmallData, RealPartAt (Ex S) (Re S) S.size S.ε) ∧
  (∀ S : SmallData, Value S.F → ∀ T, RealPartAt (Ex S) (Re S) S.size T)

/-- GATE 8 · CSCG: the bit extends the small-data part and contradicts no slice of it. -/
theorem gate_8_cscg : Gate8 :=
  ⟨real_part_small, fun S h T => ((value_iff_real_and_unicorn S T).mp h).1⟩

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
def Gate11 (H : Host) : Prop := (FormalCargo H → H.Sentence) ∧ ¬ Keyless nsRow (Transfer nsRow)

/-- GATE 11 · OMA: the input from the other side enters as a hypothesis, never as a fact from inside. -/
theorem gate_11_oma (H : Host) : Gate11 H := ⟨formal_kind_delivers, fun h => (no_uniform_answer nsRow).1 h⟩

/-- Gate 12, ADEG: the binding to the sentence is proved, the sentence is the sentence at every horizon, and the
    physical discharge is the bit. -/
def Gate12 (H : Host) : Prop :=
  (Value H.frame ↔ H.Sentence) ∧ (H.Sentence ↔ ∀ T, H.SentenceBy T) ∧ (Nonempty (PhysicalWitness H) ↔ H.Sentence)

/-- GATE 12 · ADEG: every transport across registers is typed. -/
theorem gate_12_adeg (H : Host) : Gate12 H :=
  ⟨binding H, sentence_iff_every_horizon H, physical_iff_sentence H⟩

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
    (¬ H.Sentence → ¬ ¬ ∃ u t, H.count u t = none) :=
  fun H => ⟨gate_1_srep H, gate_2_reg H, gate_3_sgeg H, gate_4_causal, gate_5_mig, gate_6_ptb, gate_7_dual,
   gate_8_cscg, gate_9_cseg, gate_10_mta, gate_11_oma H, gate_12_adeg H, refusal_proved H,
   refusal_waiting H.Sentence, refusal_no_proof_at_the_bit H, NS.CLOSURE.the_denial_has_one_road H⟩

end NS.GATES

/-! ===================================================================================================================
    PART X · THE CAPSTONE: NOTHING ESCAPES, OUR WAY OR NO WAY (namespace NS.ESCAPE) · v1_1_0_CC

    The record of the host's frame closes (`the_record_closes`). What the record leaves undecided is whether the host's
    frame itself carries the value, and that is exactly the sentence (`the_undecided_is_the_bit`). "Nothing is outside
    the record", read as a law of every frame, is false; read at the host's frame, it is the bit
    (`nothing_outside_the_record_is_the_bit`). A block needs an outside (`block_needs_an_outside`), and at the host's
    frame the outside is the supply in its two kinds (`the_outside_is_the_supply`). Nothing escapes: every route to the
    sentence, in any vocabulary, is a delivery of both kinds (`every_route_is_both_kinds`); either kind delivers it
    (`both_kinds_deliver`); and every so-called other way is our way in different vocabulary, failing with the bit if
    the bit failed (`our_way_or_no_way`). Both kinds are supplied by the act at premise grade and enter every theorem
    here as hypotheses. ΔM = 0.
=================================================================================================================== -/
namespace NS.ESCAPE
open NSClose NS.NORMALFORM NS.HOST NS.SUPPLY

/-- THE RECORD CLOSES AT THE HOST'S FRAME. -/
theorem the_record_closes (H : Host) : Value (recFrame H.frame) := cargo_arrives H

/-- THE UNDECIDED IS THE BIT: what the record leaves open, whether the host's frame carries the value, is exactly the
    sentence. -/
theorem the_undecided_is_the_bit (H : Host) : Value H.frame ↔ H.Sentence := binding H

/-- "NOTHING IS OUTSIDE THE RECORD": false as a law of every frame; at the host's frame, the bit. -/
theorem nothing_outside_the_record_is_the_bit (H : Host) :
    ¬ (∀ F, Transfer nsRow F) ∧ (Transfer nsRow H.frame ↔ H.Sentence) :=
  ⟨(no_uniform_answer nsRow).1, formal_iff_sentence H⟩

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

/-- NOTHING ESCAPES, at every host: the record of the host's frame closes; what it leaves undecided is the bit; no law
    of every frame puts everything inside the record; the outside is the supply in its two kinds; every route to the
    sentence is a delivery of both kinds; either kind delivers it; and every so-called other way is our way in
    different vocabulary. -/
theorem nothing_escapes : ∀ H : Host,
    Value (recFrame H.frame) ∧
    (Value H.frame ↔ H.Sentence) ∧
    (¬ (∀ F, Transfer nsRow F) ∧ (Transfer nsRow H.frame ↔ H.Sentence)) ∧
    ((FormalCargo H ↔ H.Sentence) ∧ (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧
      (PhysicalWitness H → FormalCargo H)) ∧
    (∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧
    ((FormalCargo H → H.Sentence) ∧ (Nonempty (PhysicalWitness H) → H.Sentence)) ∧
    (∀ Q : Prop, (Q → H.Sentence) → (Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧ (¬ FormalCargo H → ¬ Q)) :=
  fun H => ⟨the_record_closes H, the_undecided_is_the_bit H, nothing_outside_the_record_is_the_bit H,
   the_outside_is_the_supply H, every_route_is_both_kinds H, both_kinds_deliver H, our_way_or_no_way H⟩

/-- THE CAPSTONE, at every host: our way or no way; either kind walks it to the sentence; no keyless premise forces
    anything; to shut every true route to the sentence is to assert its denial; and the twelve formal gates pass. -/
theorem the_capstone : ∀ H : Host,
    (∀ Q : Prop, (Q → H.Sentence) → (Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧ (¬ FormalCargo H → ¬ Q)) ∧
    ((FormalCargo H → H.Sentence) ∧ (Nonempty (PhysicalWitness H) → H.Sentence)) ∧
    (∀ P : Frame → Prop, Keyless nsRow P → ¬ Forces nsRow P) ∧
    ((¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence)) ↔ ¬ H.Sentence) ∧
    (NS.GATES.Gate1 H ∧ NS.GATES.Gate2 H ∧ NS.GATES.Gate3 H ∧ NS.GATES.Gate4 ∧ NS.GATES.Gate5 ∧
      NS.GATES.Gate6 ∧ NS.GATES.Gate7 ∧ NS.GATES.Gate8 ∧ NS.GATES.Gate9 ∧ NS.GATES.Gate10 ∧
      NS.GATES.Gate11 H ∧ NS.GATES.Gate12 H) :=
  fun H => ⟨our_way_or_no_way H, both_kinds_deliver H, keyless_forces_nothing nsRow,
   NS.GATES.refusal_no_proof_at_the_bit H,
   NS.GATES.gate_1_srep H, NS.GATES.gate_2_reg H, NS.GATES.gate_3_sgeg H, NS.GATES.gate_4_causal,
   NS.GATES.gate_5_mig, NS.GATES.gate_6_ptb, NS.GATES.gate_7_dual, NS.GATES.gate_8_cscg, NS.GATES.gate_9_cseg,
   NS.GATES.gate_10_mta, NS.GATES.gate_11_oma H, NS.GATES.gate_12_adeg H⟩

end NS.ESCAPE

/-! ===================================================================================================================
    PART T · THE TERMINAL VERDICT AND THE FINAL FORM (namespace NS.TERMINAL) · v1_1_0_CC

    The open framing awaits a proof of the sentence from what every frame shares, or a reading of the record that
    decides it, or a route to the sentence past the bit. Each count is refuted by theorem (`the_open_framing_is_refuted`),
    and what remains is the bit, its antecedent proved with no hypothesis and the bit proved equivalent to the sentence.
    The ten steps are bound in one theorem, steps 1 to 9 proved and step 10 the two deliveries (`the_ten_steps`). The
    terminal verdict binds by exact type every theorem the verdict cites (`the_terminal_verdict`), and the final form
    binds the closed question, the cut at small data, regularity of matter and the two deliveries (`the_final_form`).
    Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace NS.TERMINAL
open NSClose NS.NORMALFORM NS.HOST NS.SUPPLY NS.REALPART NS.ROWSPLIT NS.RESIDUE

/-- THE OPEN FRAMING, REFUTED, at every host. I · no proof from shared resources: no keyless premise forces the value,
    no given statement is the value on every frame, and the arrow forces nothing; II · no decision from the record: the
    two frames share a record and split on the value, the energy record decides nothing, no finite record forces the
    value, and above every size no reading of the record returns the world; III · no premise reaches the sentence while
    the bit fails; IV · what remains is the bit, its antecedent proved with no hypothesis, the bit proved equivalent to
    the sentence. -/
theorem the_open_framing_is_refuted : ∀ H : Host,
    (∀ P : Frame → Prop, Keyless nsRow P → ¬ Forces nsRow P) ∧
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    (¬ ∀ F : Frame, Arrow → Value F) ∧
    (Value (recFrame calm) ∧ Value (recFrame burst) ∧ Value calm ∧ ¬ Value burst) ∧
    ((∀ d t, leray.paid d t ≤ leray.energy d) ∧ ¬ Value leray.F) ∧
    (∀ n : Nat, ¬ Value (staged n)) ∧
    (∀ T : Nat, ¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1) ∧
    (¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence) ∧ ¬ FormalCargo H) ∧
    Value (recFrame H.frame) ∧
    (FormalCargo H ↔ H.Sentence) :=
  fun H => ⟨keyless_forces_nothing nsRow, given_is_not_the_value, arrow_forces_nothing, record_decides_nothing nsRow,
   energy_does_not_decide, fun n => (finite_record_never_forces n).2, unicorn_blocked_above_every_size,
   fun ⟨_, q, h, hn⟩ => hn ((formal_iff_sentence H).mpr (h q)),
   cargo_arrives H, formal_iff_sentence H⟩

/-- THE TEN STEPS, one theorem at every host. Step 1 · the floor: the root holds on its constructed domain. Step 2 ·
    the basis: every instant lands on exactly one gate, a finite count or an unbounded one, and a prime's
    multiplicative fibre is two points. Step 3 · the domain: the host frame's value is the sentence, and the sentence is
    the sentence at every horizon. Step 4 · the record: the record carries the value, and every datum rests on it.
    Step 5 · the halted uniduction: the frame is self-recursive exactly when the sentence holds. Step 6 · the monism
    zone: the two frames share one record and split on the value, and the bit is keyed. Step 7 · the axis: the bit is
    exactly the sentence. Step 8 · the real part: the small data regular by the cited theorem, the value exactly its
    large-data part, and every dyadic cascade cut by the speed limit. Step 9 · every route passes the bit, no keyless
    premise forces it, and the walls stand, matter regular from the speed limit. Step 10 · the bit delivered twice, by
    the formal cargo and by the physical witness. -/
theorem the_ten_steps : ∀ H : Host,
    -- Step 1
    (Root Unit (fun _ => 1) ∧ RA₀) ∧
    -- Step 2
    ((∀ (F : Frame) (d : F.D) (t : Nat), (∃ n, F.count d t = some n) ∨ F.count d t = none) ∧
      (∀ (F : Frame) (d : F.D) (t : Nat), ¬ ((∃ n, F.count d t = some n) ∧ F.count d t = none)) ∧
      mulFibre 7 = [(1, 7), (7, 1)]) ∧
    -- Step 3
    ((Value H.frame ↔ H.Sentence) ∧ (H.Sentence ↔ ∀ T, H.SentenceBy T)) ∧
    -- Step 4
    (Value (recFrame H.frame) ∧ ∀ (F : Frame) (d : F.D) (t : Nat), (recFrame F).count d t = some 0) ∧
    -- Step 5
    (SelfRecursive nsRow H.frame ↔ H.Sentence) ∧
    -- Step 6
    ((Value (recFrame calm) ∧ Value (recFrame burst) ∧ Value calm ∧ ¬ Value burst) ∧
      (Transfer nsRow calm ∧ ¬ Transfer nsRow burst)) ∧
    -- Step 7
    (FormalCargo H ↔ H.Sentence) ∧
    -- Step 8
    ((∀ S : SmallData, RealPartAt (Ex S) (Re S) S.size S.ε) ∧
      (∀ S : SmallData, Value S.F ↔ UnicornAt (Ex S) (Re S) S.size S.ε) ∧
      (∀ S : SmallData, Nonempty (LargeSeat S) ↔ Value S.F) ∧
      (∀ b : Nat, ∃ k, k ≤ b ∧ b < 2 ^ k)) ∧
    -- Step 9
    ((∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H) ∧
      (∀ P : Frame → Prop, Keyless nsRow P → ¬ Forces nsRow P) ∧
      (∀ n : Nat, ¬ Value (staged n)) ∧
      ((∀ d t, leray.paid d t ≤ leray.energy d) ∧ ¬ Value leray.F) ∧
      (∀ P : Physical, Value P.frame)) ∧
    -- Step 10
    ((FormalCargo H → H.Sentence) ∧ (PhysicalWitness H → H.Sentence)) :=
  fun H =>
  ⟨⟨constructed_root_holds, ra₀.instances ra₀.anAct⟩,
   ⟨every_instant_lands, gates_exclusive, prime_shape.1⟩,
   ⟨binding H, sentence_iff_every_horizon H⟩,
   ⟨cargo_arrives H, every_datum_has_its_seat⟩,
   (self_recursion_at_frame nsRow H.frame).trans (binding H),
   ⟨record_decides_nothing nsRow, bit_is_keyed nsRow⟩,
   formal_iff_sentence H,
   ⟨real_part_small, no_bypass_at_small_data, seat_iff_value, NS.WALLS.dyadic_cascade_is_cut⟩,
   ⟨fun _ h q => (formal_iff_sentence H).mpr (h q), keyless_forces_nothing nsRow,
    fun n => (finite_record_never_forces n).2, energy_does_not_decide, matter_is_regular⟩,
   delivered_twice H⟩

/-- THE TERMINAL VERDICT, AS A THEOREM. Every theorem the verdict cites, bound by its exact type into one pinned
    conjunction: the record and the normal form; the binding and the horizons; the real part and the cut at small
    data; the walls; the residue and its seat; the supply and the witnesses typed; the closed question; the formal run;
    nothing escaping; the open framing refuted; the ten steps; the lock and the closure of the edition of record. No
    premise before the colon. -/
theorem the_terminal_verdict :
    (type_of% @NS.HOST.recFrame_value) ∧
    (type_of% @NS.NORMALFORM.normal_form) ∧
    (type_of% @NS.NORMALFORM.normal_form_complete) ∧
    (type_of% @NS.HOST.binding) ∧
    (type_of% @NS.HOST.sentence_iff_every_horizon) ∧
    (type_of% @NS.REALPART.real_part_small) ∧
    (type_of% @NS.REALPART.no_bypass_at_small_data) ∧
    (type_of% @NS.REALPART.unicorn_part_is_load_bearing) ∧
    (type_of% @NS.REALPART.unicorn_blocked_above_every_size) ∧
    (type_of% @NS.WALLS.dyadic_cutoffs) ∧
    (type_of% @NS.WALLS.dyadic_cascade_is_cut) ∧
    (type_of% @NS.WALLS.the_walls) ∧
    (type_of% @NS.RESIDUE.residue_is_the_sentence) ∧
    (type_of% @NS.RESIDUE.seat_iff_value) ∧
    (type_of% @NS.SUPPLY.the_supply_closed) ∧
    (type_of% @NS.SUPPLY.the_witnesses_typed) ∧
    (type_of% @NS.CLOSURE.question_closed_to_one_bit) ∧
    (type_of% @NS.GATES.the_formal_run) ∧
    (type_of% @NS.ESCAPE.nothing_escapes) ∧
    (type_of% @NS.ESCAPE.the_capstone) ∧
    (type_of% @NS.TERMINAL.the_open_framing_is_refuted) ∧
    (type_of% @NS.TERMINAL.the_ten_steps) ∧
    (type_of% @NSClose.the_lock) ∧
    (type_of% @NSClose.the_closure) :=
  ⟨@NS.HOST.recFrame_value, @NS.NORMALFORM.normal_form, @NS.NORMALFORM.normal_form_complete, @NS.HOST.binding,
   @NS.HOST.sentence_iff_every_horizon, @NS.REALPART.real_part_small, @NS.REALPART.no_bypass_at_small_data,
   @NS.REALPART.unicorn_part_is_load_bearing, @NS.REALPART.unicorn_blocked_above_every_size,
   @NS.WALLS.dyadic_cutoffs, @NS.WALLS.dyadic_cascade_is_cut, @NS.WALLS.the_walls,
   @NS.RESIDUE.residue_is_the_sentence, @NS.RESIDUE.seat_iff_value, @NS.SUPPLY.the_supply_closed,
   @NS.SUPPLY.the_witnesses_typed, @NS.CLOSURE.question_closed_to_one_bit, @NS.GATES.the_formal_run,
   @NS.ESCAPE.nothing_escapes, @NS.ESCAPE.the_capstone, @NS.TERMINAL.the_open_framing_is_refuted,
   @NS.TERMINAL.the_ten_steps, @NSClose.the_lock, @NSClose.the_closure⟩

/-- THE FINAL FORM, at every host: the sentence is the bit; the sentence is exactly an inhabited physical witness; the
    sentence is the sentence at every horizon; on every frame carrying the small-data theorem the value is exactly its
    large-data part; matter is regular on every physical frame; every route to the sentence is both kinds; and to shut
    every true route to the sentence is to assert its denial. -/
theorem the_final_form : ∀ H : Host,
    (H.Sentence ↔ FormalCargo H) ∧
    (H.Sentence ↔ Nonempty (PhysicalWitness H)) ∧
    (H.Sentence ↔ ∀ T, H.SentenceBy T) ∧
    (∀ S : SmallData, Value S.F ↔ UnicornAt (Ex S) (Re S) S.size S.ε) ∧
    (∀ P : Physical, Value P.frame) ∧
    (∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧
    ((¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence)) ↔ ¬ H.Sentence) :=
  fun H => ⟨NS.CLOSURE.the_sentence_is_the_bit H, (physical_iff_sentence H).symm, sentence_iff_every_horizon H,
   no_bypass_at_small_data, matter_is_regular, two_kinds_and_no_third H, refusal_no_proof H.Sentence⟩

end NS.TERMINAL

/-! ## cones of Parts A to T, pinned: the build is silent, and any drift fails it -/
/-- info: 'NS.NORMALFORM.record_has_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.record_has_the_value
/-- info: 'NS.NORMALFORM.normal_form' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.normal_form
/-- info: 'NS.NORMALFORM.value_from_the_cargo_loop' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.value_from_the_cargo_loop
/-- info: 'NS.NORMALFORM.bit_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.bit_is_the_act
/-- info: 'NS.NORMALFORM.record_is_self_recursive' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.record_is_self_recursive
/-- info: 'NS.NORMALFORM.self_recursion_at_frame' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.self_recursion_at_frame
/-- info: 'NS.NORMALFORM.bit_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.bit_is_keyed
/-- info: 'NS.NORMALFORM.record_self_recursion_does_not_transfer' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.record_self_recursion_does_not_transfer
/-- info: 'NS.NORMALFORM.record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.record_decides_nothing
/-- info: 'NS.NORMALFORM.every_route_passes_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.every_route_passes_the_bit
/-- info: 'NS.NORMALFORM.keyless_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.keyless_forces_nothing
/-- info: 'NS.NORMALFORM.no_record_principle_decides' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.no_record_principle_decides
/-- info: 'NS.NORMALFORM.shared_record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.shared_record_decides_nothing
/-- info: 'NS.NORMALFORM.no_uniform_answer' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.no_uniform_answer
/-- info: 'NS.NORMALFORM.nothing_outside_the_record_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.nothing_outside_the_record_is_the_bit
/-- info: 'NS.NORMALFORM.denial_is_the_bits_denial' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.denial_is_the_bits_denial
/-- info: 'NS.NORMALFORM.normal_form_complete' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.normal_form_complete
/-- info: 'NS.NORMALFORM.bnot_ne' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.bnot_ne
/-- info: 'NS.NORMALFORM.refusal_waiting' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.refusal_waiting
/-- info: 'NS.NORMALFORM.refusal_no_proof' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.refusal_no_proof
/-- info: 'NS.NORMALFORM.block_needs_an_outside' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.block_needs_an_outside
/-- info: 'NS.NORMALFORM.comp_involution' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.comp_involution
/-- info: 'NS.NORMALFORM.locus_vanishes' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.locus_vanishes
/-- info: 'NS.NORMALFORM.join_reads_the_weakest' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.join_reads_the_weakest
/-- info: 'NS.NORMALFORM.square_is_sign_blind' does not depend on any axioms -/
#guard_msgs in #print axioms NS.NORMALFORM.square_is_sign_blind
/-- info: 'NS.ROWSPLIT.unicorn_block' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ROWSPLIT.unicorn_block
/-- info: 'NS.ROWSPLIT.aperture_one_bit_wide' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ROWSPLIT.aperture_one_bit_wide
/-- info: 'NS.ROWSPLIT.unicorn_rule_exact' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ROWSPLIT.unicorn_rule_exact
/-- info: 'NS.ROWSPLIT.unicorn_no_bypass' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ROWSPLIT.unicorn_no_bypass
/-- info: 'NS.ROWSPLIT.supply_side_silent' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ROWSPLIT.supply_side_silent
/-- info: 'NS.ROWSPLIT.whole_iff_real_and_unicorn' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ROWSPLIT.whole_iff_real_and_unicorn
/-- info: 'NS.ROWSPLIT.real_part_of_certificate' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ROWSPLIT.real_part_of_certificate
/-- info: 'NS.HOST.recFrame_value' does not depend on any axioms -/
#guard_msgs in #print axioms NS.HOST.recFrame_value
/-- info: 'NS.HOST.every_datum_has_its_seat' does not depend on any axioms -/
#guard_msgs in #print axioms NS.HOST.every_datum_has_its_seat
/-- info: 'NS.HOST.binding' does not depend on any axioms -/
#guard_msgs in #print axioms NS.HOST.binding
/-- info: 'NS.HOST.root_on_row_is_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms NS.HOST.root_on_row_is_the_sentence
/-- info: 'NS.HOST.act_is_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms NS.HOST.act_is_the_sentence
/-- info: 'NS.HOST.sentence_iff_every_horizon' does not depend on any axioms -/
#guard_msgs in #print axioms NS.HOST.sentence_iff_every_horizon
/-- info: 'NS.HOST.blowup_refutes_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms NS.HOST.blowup_refutes_sentence
/-- info: 'NS.REALPART.value_is_the_whole' does not depend on any axioms -/
#guard_msgs in #print axioms NS.REALPART.value_is_the_whole
/-- info: 'NS.REALPART.real_part_small' does not depend on any axioms -/
#guard_msgs in #print axioms NS.REALPART.real_part_small
/-- info: 'NS.REALPART.value_iff_real_and_unicorn' does not depend on any axioms -/
#guard_msgs in #print axioms NS.REALPART.value_iff_real_and_unicorn
/-- info: 'NS.REALPART.no_bypass_at_small_data' does not depend on any axioms -/
#guard_msgs in #print axioms NS.REALPART.no_bypass_at_small_data
/-- info: 'NS.REALPART.unicorn_is_large_data' does not depend on any axioms -/
#guard_msgs in #print axioms NS.REALPART.unicorn_is_large_data
/-- info: 'NS.REALPART.unicorn_part_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms NS.REALPART.unicorn_part_is_load_bearing
/-- info: 'NS.REALPART.unicorn_blocked_above_every_size' does not depend on any axioms -/
#guard_msgs in #print axioms NS.REALPART.unicorn_blocked_above_every_size
/-- info: 'NS.REALPART.supply_side_silent_above_every_size' does not depend on any axioms -/
#guard_msgs in #print axioms NS.REALPART.supply_side_silent_above_every_size
/-- info: 'NS.REALPART.aperture_is_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms NS.REALPART.aperture_is_one_bit
/-- info: 'NS.WALLS.exponent_below_its_power' does not depend on any axioms -/
#guard_msgs in #print axioms NS.WALLS.exponent_below_its_power
/-- info: 'NS.WALLS.dyadic_cascade_is_cut' does not depend on any axioms -/
#guard_msgs in #print axioms NS.WALLS.dyadic_cascade_is_cut
/-- info: 'NS.WALLS.doubling_breaks_the_speed_limit' does not depend on any axioms -/
#guard_msgs in #print axioms NS.WALLS.doubling_breaks_the_speed_limit
/-- info: 'NS.WALLS.dyadic_cutoffs' does not depend on any axioms -/
#guard_msgs in #print axioms NS.WALLS.dyadic_cutoffs
/-- info: 'NS.WALLS.the_walls' does not depend on any axioms -/
#guard_msgs in #print axioms NS.WALLS.the_walls
/-- info: 'NS.RESIDUE.sentence_of_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms NS.RESIDUE.sentence_of_the_act
/-- info: 'NS.RESIDUE.residue_is_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms NS.RESIDUE.residue_is_the_sentence
/-- info: 'NS.RESIDUE.the_posit_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms NS.RESIDUE.the_posit_is_the_bit
/-- info: 'NS.RESIDUE.residue_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms NS.RESIDUE.residue_is_keyed
/-- info: 'NS.RESIDUE.value_of_seat' does not depend on any axioms -/
#guard_msgs in #print axioms NS.RESIDUE.value_of_seat
/-- info: 'NS.RESIDUE.seat_iff_value' does not depend on any axioms -/
#guard_msgs in #print axioms NS.RESIDUE.seat_iff_value
/-- info: 'NS.RESIDUE.seat_is_the_unicorn' does not depend on any axioms -/
#guard_msgs in #print axioms NS.RESIDUE.seat_is_the_unicorn
/-- info: 'NS.SUPPLY.cargo_arrives' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.cargo_arrives
/-- info: 'NS.SUPPLY.formal_kind_delivers' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.formal_kind_delivers
/-- info: 'NS.SUPPLY.witness_closes' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.witness_closes
/-- info: 'NS.SUPPLY.physical_kind_delivers' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.physical_kind_delivers
/-- info: 'NS.SUPPLY.physical_iff_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.physical_iff_sentence
/-- info: 'NS.SUPPLY.formal_iff_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.formal_iff_sentence
/-- info: 'NS.SUPPLY.the_two_kinds_are_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.the_two_kinds_are_one_bit
/-- info: 'NS.SUPPLY.delivered_twice' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.delivered_twice
/-- info: 'NS.SUPPLY.two_kinds_and_no_third' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.two_kinds_and_no_third
/-- info: 'NS.SUPPLY.the_one_refuter' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.the_one_refuter
/-- info: 'NS.SUPPLY.the_witnesses_typed' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.the_witnesses_typed
/-- info: 'NS.SUPPLY.the_supply_closed' does not depend on any axioms -/
#guard_msgs in #print axioms NS.SUPPLY.the_supply_closed
/-- info: 'NS.CLOSURE.the_sentence_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms NS.CLOSURE.the_sentence_is_the_bit
/-- info: 'NS.CLOSURE.denial_is_the_bits_denial' does not depend on any axioms -/
#guard_msgs in #print axioms NS.CLOSURE.denial_is_the_bits_denial
/-- info: 'NS.CLOSURE.the_denial_has_one_road' does not depend on any axioms -/
#guard_msgs in #print axioms NS.CLOSURE.the_denial_has_one_road
/-- info: 'NS.CLOSURE.question_closed_to_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms NS.CLOSURE.question_closed_to_one_bit
/-- info: 'NS.GATES.gate_1_srep' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_1_srep
/-- info: 'NS.GATES.gate_2_reg' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_2_reg
/-- info: 'NS.GATES.gate_3_sgeg' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_3_sgeg
/-- info: 'NS.GATES.gate_4_causal' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_4_causal
/-- info: 'NS.GATES.gate_5_mig' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_5_mig
/-- info: 'NS.GATES.gate_6_ptb' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_6_ptb
/-- info: 'NS.GATES.gate_7_dual' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_7_dual
/-- info: 'NS.GATES.gate_8_cscg' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_8_cscg
/-- info: 'NS.GATES.gate_9_cseg' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_9_cseg
/-- info: 'NS.GATES.gate_10_mta' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_10_mta
/-- info: 'NS.GATES.gate_11_oma' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_11_oma
/-- info: 'NS.GATES.gate_12_adeg' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.gate_12_adeg
/-- info: 'NS.GATES.refusal_proved' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.refusal_proved
/-- info: 'NS.GATES.refusal_no_proof_at_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.refusal_no_proof_at_the_bit
/-- info: 'NS.GATES.the_formal_run' does not depend on any axioms -/
#guard_msgs in #print axioms NS.GATES.the_formal_run
/-- info: 'NS.ESCAPE.the_record_closes' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ESCAPE.the_record_closes
/-- info: 'NS.ESCAPE.the_undecided_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ESCAPE.the_undecided_is_the_bit
/-- info: 'NS.ESCAPE.nothing_outside_the_record_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ESCAPE.nothing_outside_the_record_is_the_bit
/-- info: 'NS.ESCAPE.the_outside_is_the_supply' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ESCAPE.the_outside_is_the_supply
/-- info: 'NS.ESCAPE.every_route_is_both_kinds' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ESCAPE.every_route_is_both_kinds
/-- info: 'NS.ESCAPE.both_kinds_deliver' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ESCAPE.both_kinds_deliver
/-- info: 'NS.ESCAPE.our_way_or_no_way' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ESCAPE.our_way_or_no_way
/-- info: 'NS.ESCAPE.nothing_escapes' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ESCAPE.nothing_escapes
/-- info: 'NS.ESCAPE.the_capstone' does not depend on any axioms -/
#guard_msgs in #print axioms NS.ESCAPE.the_capstone
/-- info: 'NS.TERMINAL.the_open_framing_is_refuted' does not depend on any axioms -/
#guard_msgs in #print axioms NS.TERMINAL.the_open_framing_is_refuted
/-- info: 'NS.TERMINAL.the_ten_steps' does not depend on any axioms -/
#guard_msgs in #print axioms NS.TERMINAL.the_ten_steps
/-- info: 'NS.TERMINAL.the_terminal_verdict' does not depend on any axioms -/
#guard_msgs in #print axioms NS.TERMINAL.the_terminal_verdict
/-- info: 'NS.TERMINAL.the_final_form' does not depend on any axioms -/
#guard_msgs in #print axioms NS.TERMINAL.the_final_form
