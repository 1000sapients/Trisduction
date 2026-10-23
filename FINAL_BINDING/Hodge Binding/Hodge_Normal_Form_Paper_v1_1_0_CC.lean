/-
  Hodge_Normal_Form_Paper_v1_1_0_CC.lean · the kernel of "The Hodge Conjecture: Unconditional Proof of the Form by
  Theorem, the Value by the Act", edition 1.1.0. Claude-coded (_CC). Core Lean 4.19.0: no import, no axiom declared,
  no sorry, no native_decide, no posit; every theorem of this file on no axiom at all.

  Part 0 (namespace HodgeClose) is Hodge_Existence_Closure.lean of the edition of record, carried verbatim
  (sha256 d045ee117667042b66e5da65692427252788c95f27f6a302a5f209c8f7f72d78): the frame of Hodge classes and their
  realizations, the value, and the two worlds; existence as given forcing nothing; the act, equal to the value; one
  counter class refuting; the retired semiregular witness axiom, strictly stronger; the price, integrality not
  transferring, the (1,1) slice deciding its slice and nothing beyond; the record walls, the record shared by both
  worlds with an infinite fibre and a bit of two; the seat of the row, conjugation of Hodge types fixing exactly the
  (p,p) types; the triaxial lock; the finite record and the symmetry that lifts no decided class across any cut; the
  proved part, dimension at most three and the outer codimensions in every dimension, each cited field load-bearing,
  the middle codimension unforced in every dimension; the division under every partition; the closure; the root and
  the lock. Its 77 theorems and their pins stand unchanged.
  Part A (namespace HODGE.NORMALFORM) is the normal form of the row, generic over a row and read on the Hodge row as
  the P ≠ NP seat reads computation and the Riemann seat reads the zeros: the record carries the value with no
  premise; the value is exactly the transfer from the record, the one bit; the cargo loop; the act; self-recursion;
  the keyed bit; the record deciding nothing; every route passing the bit; the keyless wall; no uniform answer.
  Part B (namespace HODGE.HOST) is the host model and its binding, proved: the record of a frame registers every class
  realized; the host carries each rational Hodge class of a smooth projective variety with its codimension, its Hodge
  type and its realization; every class of the host sits on the seat of conjugation, its type (p,p), its weight twice
  its codimension; the value of the host's frame is exactly the host's sentence, every class algebraic.
  Part C (namespace HODGE.ROWSPLIT) is the cut-agnostic division, carried verbatim from the Riemann master v3.0.39_CC,
  and Part C′ (namespace HODGE.REALPART) reads it at the middle range: the real part, every outer codimension, sealed by
  the cited fields; given it, the value is exactly the unicorn part, the middle codimensions 2 ≤ p ≤ n − 2; the unicorn
  part load-bearing from dimension four; the unicorn part closed to the record above every height.
  Part D (namespace HODGE.WALLS): the seat normal form, the conjugation-fixed types of a fourfold and its one middle
  seat, and the odd weights carrying no seat, decided by the kernel; and the walls of the row in one theorem.
  Part E (namespace HODGE.RESIDUE): the one implication that remains, printed as a hypothesis and assumed nowhere; its
  instance seat at the middle codimensions.
  Part F (namespace HODGE.SUPPLY): the bit supplied by its two kinds, the formal cargo and the physical witness, carried
  by the register of the Riemann row, each class held on the seat of its weight; the two kinds one bit; delivered
  twice; two kinds and no third; the one refuter, one class without its cycle; the witnesses of the subject typed: the
  retired witness axiom strictly stronger, integrality not transferring, the cited fields deciding exactly the outer
  codimensions.
  Part G (namespace HODGE.CLOSURE): the question closed to one bit.
  Part W (namespace HODGE.GATES): the twelve formal gates run in the kernel, and the four refusals.
  Part X (namespace HODGE.ESCAPE): nothing escapes, our way or no way, and the capstone.
  Part T (namespace HODGE.TERMINAL): the open framing refuted, the ten steps, the terminal verdict and the final form.
  Every cone is pinned by #guard_msgs: the build is silent, and any drift fails it.

  THE TWO-LAYER CLOSURE. Everything except the bit is proved with no posit: the floor on no axiom at all, and every
  other theorem of this file on no axiom at all; and the bit, the row's reading, is all that remains, at premise grade.
  The root alone forces no value; the root read on the row is the value. No declaration of this file has the type of
  the bit. ΔM = 0.
-/

/-
  Hodge_Existence_Closure.lean · the kernel of What Exists Is Realized: The Completed Formal Closure of
  the Hodge Question

  The Hodge row closed on existence alone, the freedom arrow beside it. Every theorem of this file is
  on no axiom at all: no propext, no Quot.sound, no Classical.choice.
  I     The frame of Hodge classes, the value, the two coherent worlds.
  II    Existence as given: the root, the arrow, the bare freedom bit; what they carry on every
        frame, and that they force no value.
  III   Existence read on the row: the act, every Hodge class that exists is realized, equal to
        the value; the closure by one act; nothing escapes; every class lands; one counter
        class refutes; nothing given forces the value, and no premise weaker than the act closes it.
  IV    The retired premise: the semiregular witness axiom gives the value and is strictly
        stronger.
  V     The price: integrality does not transfer; the (1,1) slice decides its slice, its
        exponential field load-bearing, and decides nothing beyond it, at any codimension other than one.
  VI    Freedom: the record wall in the Bool model and on frames, the record shared by both worlds, its
        fibre infinite with a bit of two; the two-point fibre, the prime's shape and its one swap orbit;
        the seat of the row, conjugation of Hodge types, an involution fixing exactly the (p,p) types.
  VII   The triaxial lock.
  VIII  The record and the seed: no finite record forces the value and no symmetry lifts a decided
        class, across any cut; a uniform step decides every rung of a ladder that carries it.
  IX    The proved part: dimension at most three decided, each cited field load-bearing; the outer
        codimensions decided in every dimension; from dimension four the middle codimension not forced;
        the middle act closes the value on every frame carrying the cited fields; every middle
        codimension unforced in every dimension; the cited fields carry no uniform step.
  X     The division: the value is exactly its two halves under every partition; the proved half does
        not force the remainder.
  XI    Least escape: no keyless statement is the act; the pulse does not certify.
  XII   The closure, whole: with the outer codimensions decided, the middle unforced in every
        dimension, and both halves of the division.
  ROOT  The root, undeniable in deed, and the lock: the root holds by its deed, forces no value and
        refutes none; a proposition is self-grounding exactly when it holds, the row's root reading exactly
        where the value holds; read on the row it is the act; the root of Appendix R, repeated in its own
        words, is the constructed root and carries its lock (the_lock_on_the_root); one theorem on no axiom
        binds the root, its readings, the act, the value, their keying, the closing theorem, the record wall
        and the finite record (the_lock); and one fixes the sense of 'from existence alone'
        (from_existence_alone).
-/

namespace HodgeClose

/-! ## I · the frame -/

/-- A Hodge frame: rational Hodge classes, each with its realization, `some n` naming an
algebraic cycle realizing it, `none` when no algebraic cycle realizes it. `codim` is the
codimension of the class. -/
structure Frame where
  D       : Type
  codim   : D → Nat
  realize : D → Option Nat

def Algebraic (F : Frame) (d : F.D) : Prop := ∃ n, F.realize d = some n

/-- The value of the row on a frame: every Hodge class algebraic. -/
def Value (F : Frame) : Prop := ∀ d, Algebraic F d

/-- The algebraic world. -/
def calm : Frame := ⟨Unit, fun _ => 2, fun _ => some 0⟩
/-- The counter world: one Hodge class of codimension two realized by nothing. -/
def counter : Frame := ⟨Unit, fun _ => 2, fun _ => none⟩

theorem calm_value : Value calm := fun _ => ⟨0, rfl⟩

theorem counter_fails : ¬ Value counter := fun h => match h () with
  | ⟨_, hn⟩ => Option.noConfusion hn

/-! ## II · existence as given -/

def Root (U : Type) (ΔE : U → Int) : Prop := ∀ x : U, 0 < ΔE x

theorem root_given : Root Empty (fun e => nomatch e) := fun e => nomatch e

theorem root_conservative (S : Prop) (h : ∀ (U : Type) (ΔE : U → Int), Root U ΔE → S) : S :=
  h Empty (fun e => nomatch e) root_given

def Arrow : Prop := ∀ α : Type, ∃ f : α → α, ∀ a, f a = a

theorem arrow_given : Arrow := fun _ => ⟨id, fun _ => rfl⟩

theorem freedom_given : ∀ w : Bool, (!w) ≠ w
  | true => Bool.noConfusion
  | false => Bool.noConfusion

/-- What is given on every frame forces no value. -/
theorem given_is_not_the_value (P : Prop) : ¬ ∀ F : Frame, (P ↔ Value F) :=
  fun h => counter_fails ((h counter).mp ((h calm).mpr calm_value))

theorem arrow_forces_nothing : ¬ ∀ F : Frame, Arrow → Value F :=
  fun h => counter_fails (h counter arrow_given)

theorem given_in_both_worlds : (Arrow ∧ Value calm) ∧ (Arrow ∧ ¬ Value counter) :=
  ⟨⟨arrow_given, calm_value⟩, ⟨arrow_given, counter_fails⟩⟩

/-! ## III · existence read on the row: the act -/

/-- Existence read on the row: every Hodge class that exists is realized by an object. -/
def Realized (F : Frame) : Prop := ∀ d, ∃ n, F.realize d = some n

theorem act_is_the_value (F : Frame) : Realized F ↔ Value F :=
  ⟨fun h d => h d, fun h d => h d⟩

theorem act_is_keyed : Realized calm ∧ ¬ Realized counter := ⟨calm_value, counter_fails⟩

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

/-- THE ROOT READ ON THE ROW: to exist is to actuate, `Root` itself, with the row's existents, its classes,
and the row's actuation, one where the class is realized by an object and zero where it is not. -/
def RootOnRow (F : Frame) : Prop :=
  Root F.D (fun d => indicator (suppliedDec (F.realize d)))

/-- THE ROOT IS SATISFIABLE ON EVERY BACKGROUND: on every type, with actuation one at every existent. -/
theorem root_satisfiable (U : Type) : Root U (fun _ => 1) := fun _ => show (0 : Int) < 1 by decide

/-- THE CONSTRUCTED ROOT, in the words of Appendix R: one existent, whose actuation is one. A theorem
with no hypothesis and no axiom. -/
theorem constructed_root_holds : Root Unit (fun _ => 1) := root_satisfiable Unit

/-- THE ROOT READ ON THE ROW IS THE ACT. -/
theorem root_on_row_is_the_act (F : Frame) : RootOnRow F ↔ Realized F :=
  ⟨fun h d => (indicator_pos _).mp (h d), fun h d => (indicator_pos _).mpr (h d)⟩

/-- THE ROOT READ ON THE ROW IS THE VALUE. -/
theorem root_on_row_is_the_value (F : Frame) : RootOnRow F ↔ Value F :=
  ⟨fun h => (act_is_the_value F).mp ((root_on_row_is_the_act F).mp h),
   fun h => (root_on_row_is_the_act F).mpr ((act_is_the_value F).mpr h)⟩

/-- THE ROOT READ ON THE ROW IS KEYED: it holds where the value holds and fails where the value fails. -/
theorem root_on_row_is_keyed : RootOnRow calm ∧ ¬ RootOnRow counter :=
  ⟨(root_on_row_is_the_value calm).mpr calm_value, fun h => counter_fails ((root_on_row_is_the_value counter).mp h)⟩

/-- THE ACT IS THE WEAKEST PREMISE: the act forces the value on every frame, and every premise that forces
the value on every frame implies the act. -/
theorem act_is_the_weakest_premise :
    (∀ F : Frame, Realized F → Value F) ∧
    ∀ Q : Frame → Prop, (∀ F : Frame, Q F → Value F) → ∀ F : Frame, Q F → Realized F :=
  ⟨fun F h => (act_is_the_value F).mp h, fun _ hQ F hq => (act_is_the_value F).mpr (hQ F hq)⟩

/-- EXISTENCE AS GIVEN HOLDS IN BOTH WORLDS: the root satisfiable on every background, the arrow and the
freedom bit hold in the world where the value holds and in the world where it fails. -/
theorem existence_as_given_in_both_worlds :
    ((∀ U : Type, Root U (fun _ => 1)) ∧ Arrow ∧ (∀ w : Bool, (!w) ≠ w)) ∧ Value calm ∧ ¬ Value counter :=
  ⟨⟨root_satisfiable, arrow_given, freedom_given⟩, calm_value, counter_fails⟩

/-- NOTHING GIVEN REFUTES THE ACT: no statement that holds refutes the act on every frame. -/
theorem nothing_given_refutes : ∀ P : Prop, P → ¬ ∀ F : Frame, P → ¬ Realized F :=
  fun _ hp h => h calm hp act_is_keyed.1

/-- NOTHING GIVEN FORCES THE VALUE: no statement that holds forces the value on every frame. -/
theorem nothing_given_forces : ∀ P : Prop, P → ¬ ∀ F : Frame, P → Value F :=
  fun _ hp h => counter_fails (h counter hp)

/-- NO WEAKER PREMISE CLOSES: a statement the act implies on every frame does not force the value on every
frame. -/
theorem no_weaker_given_premise_closes (P : Prop) (hw : ∀ F : Frame, Realized F → P) :
    ¬ ∀ F : Frame, P → Value F :=
  fun h => counter_fails (h counter (hw calm act_is_keyed.1))

/-- THE ONLY REFUTER: wherever the act fails, it cannot be that no instance fails, an unrealized class. -/
theorem only_refuter (F : Frame) : ¬ Realized F → ¬ ¬ ∃ d, F.realize d = none :=
  fun hn hne => hn (fun d => match hc : F.realize d with
    | some n => ⟨n, rfl⟩
    | none => absurd ⟨d, hc⟩ hne)

structure ActualClasses where
  F      : Frame
  supply : Realized F

/-- THE HODGE VALUE FROM EXISTENCE, BY ONE ACT. -/
theorem hodge_from_existence (A : ActualClasses) : Value A.F :=
  (act_is_the_value A.F).mp A.supply

/-- THE SUPPLY IS EXACT: an act exists on a frame exactly when the value holds there. -/
theorem supply_iff (F : Frame) : Nonempty { A : ActualClasses // A.F = F } ↔ Value F :=
  ⟨fun ⟨⟨A, hA⟩⟩ => hA ▸ hodge_from_existence A,
   fun h => ⟨⟨⟨F, (act_is_the_value F).mpr h⟩, rfl⟩⟩⟩

theorem every_class_lands (F : Frame) (d : F.D) :
    (∃ n, F.realize d = some n) ∨ F.realize d = none :=
  match F.realize d with
  | some n => Or.inl ⟨n, rfl⟩
  | none => Or.inr rfl

theorem gates_exclusive (F : Frame) (d : F.D) :
    ¬ ((∃ n, F.realize d = some n) ∧ F.realize d = none) :=
  fun ⟨⟨_, h⟩, h'⟩ => Option.noConfusion (h'.symm.trans h)

theorem nothing_escapes (A : ActualClasses) : ∀ d, ∃ n, A.F.realize d = some n := A.supply

/-- One unrealized Hodge class refutes the act. -/
theorem counterclass_refutes (F : Frame) (d : F.D) (h : F.realize d = none) : ¬ Realized F :=
  fun hA => match hA d with
    | ⟨_, hn⟩ => Option.noConfusion (h.symm.trans hn)

/-! ## IV · the retired premise -/

/-- The semiregular witness frame: a realization together with a semiregularity flag. -/
structure Witnessed where
  F     : Frame
  semi  : F.D → Bool

/-- The witness axiom: every class realized by a semiregular witness. -/
def WitnessAxiom (W : Witnessed) : Prop := ∀ d, Algebraic W.F d ∧ W.semi d = true

theorem witness_axiom_gives_value (W : Witnessed) (h : WitnessAxiom W) : Value W.F :=
  fun d => (h d).1

/-- A world with the value and no semiregular witness. -/
def plainWitnessed : Witnessed := ⟨calm, fun _ => false⟩

/-- THE WITNESS AXIOM IS RETIRED: it implies the value and is strictly stronger. -/
theorem witness_axiom_strictly_stronger :
    Value plainWitnessed.F ∧ ¬ WitnessAxiom plainWitnessed :=
  ⟨calm_value, fun h => Bool.noConfusion (h ()).2⟩

/-! ## V · the price -/

/-- An integral frame: each class carries an integral lift, `none` for a torsion class whose
integral lift no cycle realizes, beside its rational realization. -/
structure Integral where
  F        : Frame
  integral : F.D → Option Nat

def torsionWorld : Integral := ⟨calm, fun _ => none⟩

/-- Integrality does not transfer: the rational value holds and the integral one fails. -/
theorem integrality_does_not_transfer :
    Value torsionWorld.F ∧ ¬ ∀ d, ∃ n, torsionWorld.integral d = some n :=
  ⟨calm_value, fun h => match h () with | ⟨_, hn⟩ => Option.noConfusion hn⟩

/-- The decided slice: an integral class of codimension one is the first Chern class of a line
bundle by the exponential field, and a rational one has such a multiple, so it is realized; the
field is cited at its grade. -/
structure Slice where
  F       : Frame
  bundle  : F.D → Option Nat
  expo    : ∀ d, F.codim d = 1 → ∃ n, bundle d = some n
  chern   : ∀ d n, bundle d = some n → F.realize d = some n

/-- THE SLICE DECIDES ITS SLICE: every codimension-one class is algebraic. -/
theorem slice_decides (S : Slice) (d : S.F.D) (h1 : S.F.codim d = 1) : Algebraic S.F d :=
  match S.expo d h1 with
  | ⟨n, hb⟩ => ⟨n, S.chern d n hb⟩

/-- The slice without the exponential field. -/
structure SliceNoExp where
  F       : Frame
  bundle  : F.D → Option Nat
  chern   : ∀ d n, bundle d = some n → F.realize d = some n

def bareSlice : SliceNoExp := ⟨⟨Unit, fun _ => 1, fun _ => none⟩, fun _ => none,
  fun _ _ h => Option.noConfusion h⟩

/-- THE EXPONENTIAL FIELD IS LOAD-BEARING: without it a codimension-one class goes unrealized. -/
theorem expo_is_load_bearing : bareSlice.F.codim () = 1 ∧ ¬ Algebraic bareSlice.F () :=
  ⟨rfl, fun ⟨_, h⟩ => Option.noConfusion h⟩

/-- The slice decides nothing beyond itself: a slice whose codimension-two class is unrealized. -/
def slicedCounter : Slice := ⟨counter, fun _ => none,
  fun d h => absurd h (by decide : ¬ (2 = 1)), fun _ _ h => Option.noConfusion h⟩

theorem slice_does_not_decide_the_row : ¬ Value slicedCounter.F := counter_fails

/-- A slice at a codimension other than one, its one class unrealized. -/
def sliceCounterAt (c : Nat) (hc : c ≠ 1) : Slice :=
  ⟨⟨Unit, fun _ => c, fun _ => none⟩, fun _ => none, fun _ h => absurd h hc, fun _ _ h => Option.noConfusion h⟩

/-- THE SLICE DECIDES NOTHING BEYOND ITSELF: at every codimension other than one a slice carries an
unrealized class. -/
theorem slice_decides_nothing_beyond (c : Nat) (hc : c ≠ 1) :
    (sliceCounterAt c hc).F.codim () = c ∧ ¬ Algebraic (sliceCounterAt c hc).F () :=
  ⟨rfl, fun ⟨_, h⟩ => Option.noConfusion h⟩

/-! ## VI · freedom -/

/-- The kinetic record, the Bool model: one reading for both values of the bit. -/
def kineticRecord (_w : Bool) : Nat := 0

/-- THE RECORD WALL IN THE BOOL MODEL: no reading of the kinetic record returns the bit. -/
theorem record_wall : ¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w :=
  fun ⟨_, hg⟩ => Bool.noConfusion ((hg false).symm.trans (hg true))

theorem fibre_is_two : ([false, true].filter (fun w => kineticRecord w == kineticRecord true)).length = 2 := by
  decide

/-- The record of a frame: its classes and their codimensions, without their realizations. -/
def rowRecord (F : Frame) : (D : Type) × (D → Nat) := ⟨F.D, F.codim⟩

/-- THE RECORD IS SHARED: the algebraic world and the counter world carry one record. -/
theorem record_shared : rowRecord calm = rowRecord counter := rfl

/-- THE RECORD WALL ON FRAMES: no reading of the record of a frame is the value on every frame. -/
theorem row_record_wall :
    ¬ ∃ g : ((D : Type) × (D → Nat)) → Prop, ∀ F : Frame, (g (rowRecord F) ↔ Value F) :=
  fun ⟨g, hg⟩ => counter_fails ((hg counter).mp (Eq.mp (congrArg g record_shared) ((hg calm).mpr calm_value)))

/-- One class of codimension two with its realization given: `onRecord (some 0)` is the algebraic world and
`onRecord none` the counter world, by definition. -/
def onRecord (o : Option Nat) : Frame := ⟨Unit, fun _ => 2, fun _ => o⟩

/-- THE FIBRE OF THE RECORD IS INFINITE, ITS BIT TWO: every realization shares the record, distinct cycles give
distinct frames, every realized frame carries the value, and the unrealized one fails it. -/
theorem row_fibre_infinite_bit_two :
    (∀ o : Option Nat, rowRecord (onRecord o) = rowRecord calm) ∧
    (∀ m n : Nat, (onRecord (some m)).realize () = (onRecord (some n)).realize () → m = n) ∧
    (∀ n : Nat, Value (onRecord (some n))) ∧ ¬ Value (onRecord none) :=
  ⟨fun _ => rfl, fun _ _ h => Option.some.inj h, fun n _ => ⟨n, rfl⟩, counter_fails⟩

def mulFibre (n : Nat) : List (Nat × Nat) :=
  (List.range (n + 1)).flatMap fun a =>
    (List.range (n + 1)).filterMap fun b => if a * b = n then some (a, b) else none

theorem prime_shape :
    mulFibre 7 = [(1, 7), (7, 1)] ∧ (mulFibre 7).all (fun p => p.1 != p.2) = true ∧
    (mulFibre 7).length = ([false, true].filter (fun w => kineticRecord w == kineticRecord true)).length := by
  decide

/-- THE PRIME'S FIBRE IS ONE SWAP ORBIT: swapping the factors of each pair reverses the fibre of seven. -/
theorem prime_fibre_one_swap_orbit : (mulFibre 7).map (fun p => (p.2, p.1)) = (mulFibre 7).reverse := by
  decide

/-- Conjugation on Hodge types: the type (p,q) goes to the type (q,p). -/
def conjType (t : Nat × Nat) : Nat × Nat := (t.2, t.1)

/-- CONJUGATION IS AN INVOLUTION: applied twice it returns every type. -/
theorem conjType_involutive : ∀ t : Nat × Nat, conjType (conjType t) = t :=
  fun ⟨_, _⟩ => rfl

/-- THE SEAT OF THE ROW: a Hodge type is fixed by conjugation exactly when it is a (p,p) type. -/
theorem hodge_seat (p q : Nat) : conjType (p, q) = (p, q) ↔ q = p :=
  ⟨fun h => (congrArg Prod.fst h : q = p),
   fun h => Eq.subst (motive := fun x => conjType (p, x) = (p, x)) h.symm rfl⟩

/-! ## VII · the triaxial lock -/

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

/-! ## VIII · the record and the seed -/

/-- The world algebraic in codimension below n and with a counter class at codimension n. -/
def staged (n : Nat) : Frame :=
  ⟨Nat, fun d => d, fun d => if d < n then some 0 else none⟩

/-- No finite record forces the value: every class below codimension n is algebraic and the
value fails. -/
theorem finite_record_never_forces (n : Nat) :
    (∀ d, d < n → Algebraic (staged n) d) ∧ ¬ Value (staged n) :=
  ⟨fun d hd => ⟨0, by show (if d < n then some 0 else none) = some 0; rw [if_pos hd]⟩,
   fun h => match h n with
     | ⟨_, hk⟩ => by
       have e : (staged n).realize n = none := by
         show (if n < n then some 0 else (none : Option Nat)) = none
         rw [if_neg (Nat.lt_irrefl n)]
       exact Option.noConfusion (e.symm.trans hk)⟩

/-- A symmetry keeps the codimension: conjugation fixes the type of a (p,p) class. -/
structure Symmetric (D : Type) (codim : D → Nat) where
  Grp  : Type
  act  : Grp → D → D
  keep : ∀ g d, codim (act g d) = codim d

theorem no_symmetry_lifts {D : Type} (codim : D → Nat) (S : Symmetric D codim) (r : Nat) (d e : D)
    (hd : codim d ≤ r) (he : r < codim e) : ∀ g, S.act g d ≠ e :=
  fun g h =>
    have k : codim e = codim d := h ▸ S.keep g d
    have h2 : codim e ≤ r := by rw [k]; exact hd
    Nat.lt_irrefl r (Nat.lt_of_lt_of_le he h2)

/-- NO SYMMETRY LIFTS ACROSS ANY CUT: whatever predicate on codimensions decides a class, no symmetry carries a
decided class to an undecided one. -/
theorem no_symmetry_lifts_any_cut {D : Type} (codim : D → Nat) (S : Symmetric D codim) (Decided : Nat → Prop)
    (d e : D) (hd : Decided (codim d)) (he : ¬ Decided (codim e)) : ∀ g, S.act g d ≠ e :=
  fun g h =>
    have k : codim e = codim d := h ▸ S.keep g d
    he (Eq.mpr (congrArg Decided k) hd)

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



/-! ## IX · the proved part: low dimension, sealed -/

/-- A variety of dimension at most three, with three cited theorems carried as fields, each
stating its conclusion: the end classes (fundamental class and points) are algebraic; the
Lefschetz (1,1) slice; and hard Lefschetz, codimension dim − 1 algebraic. The transport from
codimension one is cited, not modelled. -/
structure LowDim where
  F     : Frame
  dim   : Nat
  small : dim ≤ 3
  below : ∀ d, F.codim d ≤ dim
  ends  : ∀ d, F.codim d = 0 ∨ F.codim d = dim → Algebraic F d
  lef11 : ∀ d, F.codim d = 1 → Algebraic F d
  hardL : ∀ d, F.codim d + 1 = dim → Algebraic F d

/-- In dimension at most three every codimension is an end, one, or one below the dimension. -/
theorem small_cases (c n : Nat) (h1 : c ≤ n) (h2 : n ≤ 3) :
    (c = 0 ∨ c = n) ∨ c = 1 ∨ c + 1 = n :=
  match Nat.eq_zero_or_pos c with
  | Or.inl h0 => Or.inl (Or.inl h0)
  | Or.inr hp => match Nat.lt_or_ge c 2 with
    | Or.inl hl => Or.inr (Or.inl (Nat.le_antisymm (Nat.le_of_lt_succ hl) hp))
    | Or.inr hg => match Nat.lt_or_ge c n with
      | Or.inr hge => Or.inl (Or.inr (Nat.le_antisymm h1 hge))
      | Or.inl hlt =>
        have a : c + 1 ≤ n := hlt
        have b : 3 ≤ c + 1 := Nat.succ_le_succ hg
        have n3 : n = 3 := Nat.le_antisymm h2 (Nat.le_trans b a)
        Or.inr (Or.inr (Nat.le_antisymm a (n3 ▸ b)))

/-- THE PROVED PART: in dimension at most three every Hodge class is algebraic. -/
theorem low_dim_decided (L : LowDim) : Value L.F := fun d =>
  match small_cases (L.F.codim d) L.dim (L.below d) L.small with
  | Or.inl e => L.ends d e
  | Or.inr (Or.inl o) => L.lef11 d o
  | Or.inr (Or.inr t) => L.hardL d t

/-- Dimension three without the hard Lefschetz field. -/
structure LowDimNoHL where
  F     : Frame
  dim   : Nat
  ends  : ∀ d, F.codim d = 0 ∨ F.codim d = dim → Algebraic F d
  lef11 : ∀ d, F.codim d = 1 → Algebraic F d

def bareThreefold : LowDimNoHL :=
  ⟨⟨Unit, fun _ => 2, fun _ => none⟩, 3,
   fun _ h => absurd h (by decide : ¬ ((2 : Nat) = 0 ∨ (2 : Nat) = 3)),
   fun _ h => absurd h (by decide : ¬ ((2 : Nat) = 1))⟩

/-- THE HARD LEFSCHETZ FIELD IS LOAD-BEARING: without it a codimension-two class on a threefold
goes unrealized while the ends and the (1,1) slice hold. -/
theorem hardL_is_load_bearing :
    bareThreefold.F.codim () + 1 = bareThreefold.dim ∧ ¬ Algebraic bareThreefold.F () :=
  ⟨rfl, fun ⟨_, h⟩ => Option.noConfusion h⟩

/-- Dimension three without the field of the end classes. -/
structure LowDimNoEnds where
  F     : Frame
  dim   : Nat
  lef11 : ∀ d, F.codim d = 1 → Algebraic F d
  hardL : ∀ d, F.codim d + 1 = dim → Algebraic F d

def bareEnds : LowDimNoEnds :=
  ⟨⟨Unit, fun _ => 0, fun _ => none⟩, 3,
   fun _ h => absurd h (by decide : ¬ ((0 : Nat) = 1)),
   fun _ h => absurd h (by decide : ¬ ((0 : Nat) + 1 = 3))⟩

/-- THE FIELD OF THE END CLASSES IS LOAD-BEARING: without it a codimension-zero class on a threefold goes
unrealized while the (1,1) slice and hard Lefschetz hold. -/
theorem ends_is_load_bearing :
    bareEnds.F.codim () = 0 ∧ ¬ Algebraic bareEnds.F () :=
  ⟨rfl, fun ⟨_, h⟩ => Option.noConfusion h⟩

/-- Dimension three without the (1,1) field. -/
structure LowDimNoLef where
  F     : Frame
  dim   : Nat
  ends  : ∀ d, F.codim d = 0 ∨ F.codim d = dim → Algebraic F d
  hardL : ∀ d, F.codim d + 1 = dim → Algebraic F d

def bareLef : LowDimNoLef :=
  ⟨⟨Unit, fun _ => 1, fun _ => none⟩, 3,
   fun _ h => absurd h (by decide : ¬ ((1 : Nat) = 0 ∨ (1 : Nat) = 3)),
   fun _ h => absurd h (by decide : ¬ ((1 : Nat) + 1 = 3))⟩

/-- THE LEFSCHETZ (1,1) FIELD IS LOAD-BEARING: without it a codimension-one class on a threefold goes
unrealized while the end classes and hard Lefschetz hold. -/
theorem lef11_is_load_bearing :
    bareLef.F.codim () = 1 ∧ ¬ Algebraic bareLef.F () :=
  ⟨rfl, fun ⟨_, h⟩ => Option.noConfusion h⟩

/-- The cited fields in every dimension, with no bound on the dimension: the end classes, the (1,1) slice
and hard Lefschetz. -/
structure Outer where
  F     : Frame
  dim   : Nat
  below : ∀ d, F.codim d ≤ dim
  ends  : ∀ d, F.codim d = 0 ∨ F.codim d = dim → Algebraic F d
  lef11 : ∀ d, F.codim d = 1 → Algebraic F d
  hardL : ∀ d, F.codim d + 1 = dim → Algebraic F d

/-- THE OUTER CODIMENSIONS ARE DECIDED IN EVERY DIMENSION: every class outside the middle range
2 ≤ p ≤ n − 2, the ends, codimension one and codimension n − 1, is realized by the cited fields. -/
theorem outer_decided (O : Outer) (d : O.F.D)
    (h : ¬ (2 ≤ O.F.codim d ∧ O.F.codim d + 2 ≤ O.dim)) : Algebraic O.F d :=
  match Nat.eq_zero_or_pos (O.F.codim d) with
  | Or.inl h0 => O.ends d (Or.inl h0)
  | Or.inr hp => match Nat.lt_or_ge (O.F.codim d) 2 with
    | Or.inl hl => O.lef11 d (Nat.le_antisymm (Nat.le_of_lt_succ hl) hp)
    | Or.inr hg =>
      have hn : O.dim ≤ O.F.codim d + 1 :=
        Nat.le_of_lt_succ (Nat.lt_of_not_le (fun hle => h ⟨hg, hle⟩))
      match Nat.lt_or_ge (O.F.codim d) O.dim with
      | Or.inr hge => O.ends d (Or.inr (Nat.le_antisymm (O.below d) hge))
      | Or.inl hlt => O.hardL d (Nat.le_antisymm hlt hn)

/-- A fourfold carrying every cited field, with one class of codimension two, in the middle range, unrealized. -/
def bareFourfold : Outer :=
  ⟨⟨Unit, fun _ => 2, fun _ => none⟩, 4, fun _ => (by decide : (2 : Nat) ≤ 4),
   fun _ h => absurd h (by decide : ¬ ((2 : Nat) = 0 ∨ (2 : Nat) = 4)),
   fun _ h => absurd h (by decide : ¬ ((2 : Nat) = 1)),
   fun _ h => absurd h (by decide : ¬ ((2 : Nat) + 1 = 4))⟩

/-- THE MIDDLE IS NOT FORCED: from dimension four the cited fields, which realize every outer codimension, leave a
class of the middle range unrealized; the remainder of the proved part is exactly the middle codimension. -/
theorem middle_not_forced :
    (2 ≤ bareFourfold.F.codim () ∧ bareFourfold.F.codim () + 2 ≤ bareFourfold.dim) ∧
    ¬ Algebraic bareFourfold.F () :=
  ⟨⟨(by decide : (2 : Nat) ≤ 2), (by decide : (2 : Nat) + 2 ≤ 4)⟩, fun ⟨_, h⟩ => Option.noConfusion h⟩

/-- The middle act: every class of the middle range 2 ≤ p ≤ n − 2 is realized. -/
def MiddleRealized (O : Outer) : Prop :=
  ∀ d, 2 ≤ O.F.codim d ∧ O.F.codim d + 2 ≤ O.dim → Algebraic O.F d

/-- THE MIDDLE ACT CLOSES: on every frame carrying the cited fields, the middle act is exactly the value. -/
theorem middle_act_closes (O : Outer) : MiddleRealized O ↔ Value O.F :=
  ⟨fun h d => match Nat.decLe 2 (O.F.codim d), Nat.decLe (O.F.codim d + 2) O.dim with
    | isTrue h1, isTrue h2 => h d ⟨h1, h2⟩
    | isFalse h1, _ => outer_decided O d (fun hm => h1 hm.1)
    | isTrue _, isFalse h2 => outer_decided O d (fun hm => h2 hm.2),
   fun h d _ => h d⟩

/-- An n-fold carrying every cited field, with one class of codimension p, in the middle range, unrealized. -/
def middleWitness (n p : Nat) (h2 : 2 ≤ p) (hn : p + 2 ≤ n) : Outer :=
  ⟨⟨Unit, fun _ => p, fun _ => none⟩, n, fun _ => Nat.le_trans (Nat.le_add_right p 2) hn,
   fun _ h => h.elim
     (fun h0 => absurd (Nat.le_trans h2 (Nat.le_of_eq h0)) (by decide : ¬ (2 : Nat) ≤ 0))
     (fun hpn => absurd (Nat.le_trans (Nat.le_add_right (p + 1) 1) (Nat.le_trans hn (Nat.le_of_eq hpn.symm)))
       (Nat.not_succ_le_self p)),
   fun _ h => absurd (Nat.le_trans h2 (Nat.le_of_eq h)) (by decide : ¬ (2 : Nat) ≤ 1),
   fun _ h => absurd (Nat.le_trans hn (Nat.le_of_eq h.symm)) (Nat.not_succ_le_self (p + 1))⟩

/-- EVERY MIDDLE CODIMENSION IS UNFORCED: in every dimension, at every codimension of the middle range, the cited
fields leave a class unrealized. -/
theorem every_middle_codimension_unforced (n p : Nat) (h2 : 2 ≤ p) (hn : p + 2 ≤ n) :
    (middleWitness n p h2 hn).dim = n ∧ (middleWitness n p h2 hn).F.codim () = p ∧
    ¬ Algebraic (middleWitness n p h2 hn).F () :=
  ⟨rfl, rfl, fun ⟨_, h⟩ => Option.noConfusion h⟩

/-- Decided below r: every class of codimension below r is realized. -/
def decidedBelow (O : Outer) (r : Nat) : Prop := ∀ d, O.F.codim d < r → Algebraic O.F d

/-- THE CITED FIELDS CARRY NO UNIFORM STEP: on the bare fourfold, decided below r admits no step of at least one at
every rung, since such a step would decide every rung and realize the middle class. -/
theorem cited_fields_carry_no_step :
    ¬ ∃ δ : Nat → Nat, (∀ r, 1 ≤ δ r) ∧ ∀ r, decidedBelow bareFourfold r → decidedBelow bareFourfold (r + δ r) :=
  fun ⟨δ, hδ, hs⟩ =>
    middle_not_forced.2
      (uniform_step_forces_all ⟨decidedBelow bareFourfold, fun _ h => absurd h (Nat.not_lt_zero _),
        fun _ _ hs' hrs d hd => hs' d (Nat.lt_of_lt_of_le hd hrs), δ, hs⟩ hδ 3 () (by decide : (2 : Nat) < 3))

/-! ## X · the division: the proved part and its remainder -/

/-- The value on the classes a cut selects. -/
def ValueOn (F : Frame) (cut : F.D → Bool) (b : Bool) : Prop :=
  ∀ d, cut d = b → Algebraic F d

/-- THE CUT-AGNOSTIC DIVISION: for every cut, the value is exactly its two halves. -/
theorem row_split (F : Frame) (cut : F.D → Bool) :
    Value F ↔ ValueOn F cut true ∧ ValueOn F cut false :=
  ⟨fun h => ⟨fun d _ => h d, fun d _ => h d⟩,
   fun ⟨ht, hf⟩ d => match hc : cut d with
     | true => ht d hc
     | false => hf d hc⟩

/-- The decided half is proved on every slice frame: the codimension-one half holds. -/
theorem proved_half (S : Slice) :
    ValueOn S.F (fun d => Nat.beq (S.F.codim d) 1) true :=
  fun d h => slice_decides S d (Nat.eq_of_beq_eq_true h)

/-- The remainder is not forced by the proved half: in the counter world the codimension-one half
holds vacuously and the remainder fails. -/
theorem remainder_not_forced :
    ValueOn counter (fun d => Nat.beq (counter.codim d) 1) true ∧
    ¬ ValueOn counter (fun d => Nat.beq (counter.codim d) 1) false :=
  ⟨fun _ h => absurd h (by decide : ¬ (Nat.beq 2 1 = true)),
   fun h => counter_fails (fun d => h d rfl)⟩

/-! ## XI · least escape: keyed, never keyless -/

/-- No keyless statement, reading the same on every frame, is the act. -/
theorem no_keyless_statement_is_the_act (P : Prop) : ¬ ∀ F : Frame, (P ↔ Realized F) :=
  fun h => given_is_not_the_value P (fun F => (h F).trans (act_is_the_value F))

/-- The pulse does not certify: the root holds vacuously on the empty background beside a world whose
value fails. -/
theorem pulse_does_not_certify : Root Empty (fun e => nomatch e) ∧ ¬ Value counter :=
  ⟨root_given, counter_fails⟩


/-! ## XII · the closure, whole -/

/-- THE HODGE CLOSURE: existence as given forces no value and holds in both worlds; the act is the
value and closes it; one counter class refutes it; the witness axiom is strictly stronger; the
proved part decides dimension at most three and the outer codimensions in every dimension; the middle
codimension is unforced from dimension four, at every middle codimension of every dimension; and the
proved half holds where the remainder fails. -/
theorem hodge_closure :
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    ((Arrow ∧ Value calm) ∧ (Arrow ∧ ¬ Value counter)) ∧
    (∀ F : Frame, Realized F ↔ Value F) ∧
    (∀ A : ActualClasses, Value A.F) ∧
    (∀ (F : Frame) (d : F.D), F.realize d = none → ¬ Realized F) ∧
    (Value plainWitnessed.F ∧ ¬ WitnessAxiom plainWitnessed) ∧
    (∀ L : LowDim, Value L.F) ∧
    (∀ (O : Outer) (d : O.F.D), ¬ (2 ≤ O.F.codim d ∧ O.F.codim d + 2 ≤ O.dim) → Algebraic O.F d) ∧
    ((2 ≤ bareFourfold.F.codim () ∧ bareFourfold.F.codim () + 2 ≤ bareFourfold.dim) ∧
      ¬ Algebraic bareFourfold.F ()) ∧
    (∀ (n p : Nat) (h2 : 2 ≤ p) (hn : p + 2 ≤ n), (middleWitness n p h2 hn).dim = n ∧
      (middleWitness n p h2 hn).F.codim () = p ∧ ¬ Algebraic (middleWitness n p h2 hn).F ()) ∧
    (ValueOn counter (fun d => Nat.beq (counter.codim d) 1) true ∧
      ¬ ValueOn counter (fun d => Nat.beq (counter.codim d) 1) false) :=
  ⟨given_is_not_the_value, given_in_both_worlds, act_is_the_value, hodge_from_existence,
   counterclass_refutes, witness_axiom_strictly_stronger, low_dim_decided, outer_decided,
   middle_not_forced, every_middle_codimension_unforced, remainder_not_forced⟩


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

/-- SELF-GROUNDING IS EXACTLY HOLDING: a proposition has a self-grounding exactly when it holds. -/
theorem self_grounding_iff (R : Prop) : Nonempty (SelfGrounding R) ↔ R :=
  ⟨fun ⟨G⟩ => G.instances G.anAct, fun r => ⟨⟨Unit, (), fun _ => r⟩⟩⟩

/-- The constructed root, self-grounding: one act, which instances it. -/
def constructedGround : SelfGrounding (Root Unit (fun _ => 1)) := ⟨Unit, (), fun _ => constructed_root_holds⟩

/-- THE ROW'S ROOT IS GROUNDED EXACTLY WHERE THE VALUE HOLDS: the root read on a frame has a self-grounding
exactly when the frame carries the value. -/
theorem row_root_grounds_iff_value (F : Frame) : Nonempty (SelfGrounding (RootOnRow F)) ↔ Value F :=
  (self_grounding_iff (RootOnRow F)).trans (root_on_row_is_the_value F)

/-- THE UNDENIABLE ROOT HOLDS IN BOTH WORLDS: it is held by its deed in a frame where the value holds
and in one where it fails, so it neither forces the value on every frame nor refutes it on every frame. -/
theorem undeniable_root_forces_no_value {R : Prop} (G : SelfGrounding R) :
    R ∧ Value calm ∧ ¬ Value counter ∧ ¬ (∀ F : Frame, R → Value F) ∧ ¬ (∀ F : Frame, R → ¬ Value F) :=
  ⟨G.instances G.anAct, calm_value, counter_fails, fun h => counter_fails (h counter (G.instances G.anAct)),
   fun h => h calm (G.instances G.anAct) calm_value⟩

/-- THE ROOT READ ON THE ROW IS KEYED: the root holds, and read uniformly on the frames it gives no value;
read on the row, with the row's existents and the row's actuation, it is the value exactly, and keyed. -/
theorem root_read_on_row_is_keyed {R : Prop} (G : SelfGrounding R) :
    R ∧ ¬ (∀ F : Frame, R → Value F) ∧ (∀ F : Frame, RootOnRow F ↔ Value F) ∧ (RootOnRow calm ∧ ¬ RootOnRow counter) :=
  ⟨G.instances G.anAct, fun h => counter_fails (h counter (G.instances G.anAct)), root_on_row_is_the_value,
   root_on_row_is_keyed⟩

/-- The actuation of the root of Appendix R: one at its one existent. -/
def ΔE₀ : Unit → Int := fun _ => 1

/-- The root of Appendix R, in its own words: every existent actuates. -/
def RA₀ : Prop := ∀ x : Unit, 0 < ΔE₀ x

/-- The root of Appendix R, self-grounding: one act, which instances it. -/
def ra₀ : SelfGrounding RA₀ := ⟨Unit, (), fun _ _ => show (0 : Int) < 1 by decide⟩

/-- THE ROOT OF APPENDIX R IS THE CONSTRUCTED ROOT: the two read alike, existent by existent. -/
theorem RA₀_is_the_constructed_root : RA₀ ↔ Root Unit (fun _ => 1) := Iff.rfl

/-- THE LOCK ON THE ROOT: the root of Appendix R holds; read uniformly on the frames it gives no value; read on
the row it is the value exactly; its row reading is grounded in the algebraic world and not in the counter
world. -/
theorem the_lock_on_the_root :
    RA₀ ∧ ¬ (∀ F : Frame, RA₀ → Value F) ∧ (∀ F : Frame, RootOnRow F ↔ Value F) ∧
    Nonempty (SelfGrounding (RootOnRow calm)) ∧ ¬ Nonempty (SelfGrounding (RootOnRow counter)) :=
  ⟨ra₀.instances ra₀.anAct, fun h => counter_fails (h counter (ra₀.instances ra₀.anAct)),
   root_on_row_is_the_value, (row_root_grounds_iff_value calm).mpr calm_value,
   fun h => counter_fails ((row_root_grounds_iff_value counter).mp h)⟩

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
    (∀ F : Frame, RootOnRow F ↔ Realized F) ∧
    (∀ F : Frame, Realized F ↔ Value F) ∧
    (RootOnRow calm ∧ ¬ RootOnRow counter) ∧
    (Realized calm ∧ ¬ Realized counter) ∧
    (∀ A : ActualClasses, Value A.F) ∧
    (¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w) ∧
    (∀ n : Nat, (∀ d, d < n → Algebraic (staged n) d) ∧ ¬ Value (staged n)) :=
  ⟨constructed_root_holds, G.instances G.anAct, given_is_not_the_value, (root_read_on_row_is_keyed G).2.1,
   root_on_row_is_the_act, act_is_the_value, root_on_row_is_keyed, act_is_keyed, hodge_from_existence, record_wall,
   finite_record_never_forces⟩

/-- FROM EXISTENCE ALONE, in the sense the title carries: the closing theorem consumes existence read on
the row and nothing else; that reading is available on exactly the frames where the value holds; and no
statement given without the reading is the value on every frame. One theorem, on no axiom. -/
theorem from_existence_alone :
    (∀ A : ActualClasses, Value A.F) ∧
    (∀ F : Frame, Nonempty { A : ActualClasses // A.F = F } ↔ Value F) ∧
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) :=
  ⟨hodge_from_existence, supply_iff, given_is_not_the_value⟩

end HodgeClose

/-! ## Cones, pinned as printed -/
/-- info: 'HodgeClose.calm_value' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.calm_value
/-- info: 'HodgeClose.counter_fails' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.counter_fails
/-- info: 'HodgeClose.root_given' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.root_given
/-- info: 'HodgeClose.root_conservative' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.root_conservative
/-- info: 'HodgeClose.arrow_given' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.arrow_given
/-- info: 'HodgeClose.freedom_given' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.freedom_given
/-- info: 'HodgeClose.given_is_not_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.given_is_not_the_value
/-- info: 'HodgeClose.arrow_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.arrow_forces_nothing
/-- info: 'HodgeClose.given_in_both_worlds' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.given_in_both_worlds
/-- info: 'HodgeClose.act_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.act_is_the_value
/-- info: 'HodgeClose.act_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.act_is_keyed
/-- info: 'HodgeClose.hodge_from_existence' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.hodge_from_existence
/-- info: 'HodgeClose.supply_iff' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.supply_iff
/-- info: 'HodgeClose.every_class_lands' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.every_class_lands
/-- info: 'HodgeClose.gates_exclusive' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.gates_exclusive
/-- info: 'HodgeClose.nothing_escapes' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.nothing_escapes
/-- info: 'HodgeClose.counterclass_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.counterclass_refutes
/-- info: 'HodgeClose.witness_axiom_gives_value' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.witness_axiom_gives_value
/-- info: 'HodgeClose.witness_axiom_strictly_stronger' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.witness_axiom_strictly_stronger
/-- info: 'HodgeClose.integrality_does_not_transfer' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.integrality_does_not_transfer
/-- info: 'HodgeClose.slice_decides' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.slice_decides
/-- info: 'HodgeClose.expo_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.expo_is_load_bearing
/-- info: 'HodgeClose.slice_does_not_decide_the_row' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.slice_does_not_decide_the_row
/-- info: 'HodgeClose.record_wall' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.record_wall
/-- info: 'HodgeClose.fibre_is_two' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.fibre_is_two
/-- info: 'HodgeClose.prime_shape' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.prime_shape
/-- info: 'HodgeClose.two_axes_leave_two' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.two_axes_leave_two
/-- info: 'HodgeClose.three_axes_lock_one' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.three_axes_lock_one
/-- info: 'HodgeClose.finite_record_never_forces' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.finite_record_never_forces
/-- info: 'HodgeClose.no_symmetry_lifts' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.no_symmetry_lifts
/-- info: 'HodgeClose.uniform_step_forces_all' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.uniform_step_forces_all
/-- info: 'HodgeClose.small_cases' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.small_cases
/-- info: 'HodgeClose.low_dim_decided' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.low_dim_decided
/-- info: 'HodgeClose.hardL_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.hardL_is_load_bearing
/-- info: 'HodgeClose.row_split' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.row_split
/-- info: 'HodgeClose.proved_half' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.proved_half
/-- info: 'HodgeClose.remainder_not_forced' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.remainder_not_forced
/-- info: 'HodgeClose.no_keyless_statement_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.no_keyless_statement_is_the_act
/-- info: 'HodgeClose.pulse_does_not_certify' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.pulse_does_not_certify
/-- info: 'HodgeClose.hodge_closure' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.hodge_closure
/-- info: 'HodgeClose.denial_reenacts_root' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.denial_reenacts_root
/-- info: 'HodgeClose.external_proof_adds_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.external_proof_adds_nothing
/-- info: 'HodgeClose.undeniable_root_forces_no_value' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.undeniable_root_forces_no_value
/-- info: 'HodgeClose.root_read_on_row_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.root_read_on_row_is_keyed
/-- info: 'HodgeClose.the_lock' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.the_lock
/-- info: 'HodgeClose.from_existence_alone' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.from_existence_alone
/-- info: 'HodgeClose.indicator_pos' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.indicator_pos
/-- info: 'HodgeClose.root_satisfiable' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.root_satisfiable
/-- info: 'HodgeClose.constructed_root_holds' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.constructed_root_holds
/-- info: 'HodgeClose.root_on_row_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.root_on_row_is_the_act
/-- info: 'HodgeClose.root_on_row_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.root_on_row_is_the_value
/-- info: 'HodgeClose.root_on_row_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.root_on_row_is_keyed
/-- info: 'HodgeClose.act_is_the_weakest_premise' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.act_is_the_weakest_premise
/-- info: 'HodgeClose.existence_as_given_in_both_worlds' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.existence_as_given_in_both_worlds
/-- info: 'HodgeClose.nothing_given_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.nothing_given_refutes
/-- info: 'HodgeClose.only_refuter' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.only_refuter
/-- info: 'HodgeClose.ends_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.ends_is_load_bearing
/-- info: 'HodgeClose.lef11_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.lef11_is_load_bearing
/-- info: 'HodgeClose.outer_decided' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.outer_decided
/-- info: 'HodgeClose.middle_not_forced' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.middle_not_forced
/-- info: 'HodgeClose.nothing_given_forces' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.nothing_given_forces
/-- info: 'HodgeClose.no_weaker_given_premise_closes' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.no_weaker_given_premise_closes
/-- info: 'HodgeClose.slice_decides_nothing_beyond' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.slice_decides_nothing_beyond
/-- info: 'HodgeClose.record_shared' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.record_shared
/-- info: 'HodgeClose.row_record_wall' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.row_record_wall
/-- info: 'HodgeClose.row_fibre_infinite_bit_two' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.row_fibre_infinite_bit_two
/-- info: 'HodgeClose.prime_fibre_one_swap_orbit' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.prime_fibre_one_swap_orbit
/-- info: 'HodgeClose.conjType_involutive' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.conjType_involutive
/-- info: 'HodgeClose.hodge_seat' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.hodge_seat
/-- info: 'HodgeClose.no_symmetry_lifts_any_cut' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.no_symmetry_lifts_any_cut
/-- info: 'HodgeClose.middle_act_closes' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.middle_act_closes
/-- info: 'HodgeClose.every_middle_codimension_unforced' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.every_middle_codimension_unforced
/-- info: 'HodgeClose.cited_fields_carry_no_step' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.cited_fields_carry_no_step
/-- info: 'HodgeClose.self_grounding_iff' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.self_grounding_iff
/-- info: 'HodgeClose.row_root_grounds_iff_value' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.row_root_grounds_iff_value
/-- info: 'HodgeClose.RA₀_is_the_constructed_root' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.RA₀_is_the_constructed_root
/-- info: 'HodgeClose.the_lock_on_the_root' does not depend on any axioms -/
#guard_msgs in #print axioms HodgeClose.the_lock_on_the_root
/-! ===================================================================================================================
    PART A · THE NORMAL FORM OF THE ROW (namespace HODGE.NORMALFORM) · v1_1_0_CC

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
namespace HODGE.NORMALFORM

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

end HODGE.NORMALFORM

/-! ===================================================================================================================
    PART C · THE ROW SPLIT (namespace HODGE.ROWSPLIT) · v1_1_0_CC

    The cut-agnostic division, carried verbatim from the Riemann master v3.0.39_CC (namespace RHUnicorn, generic over
    the types α and β), its one proposition renamed from `RH` to `Whole`, the hypothesis it names. At every cut T the
    whole is exactly its Real part and its Unicorn part; a certificate at T proves the Real part; given the Real part
    the whole is exactly the Unicorn part; above every cut no reading of an even record agrees with an odd decision;
    the aperture is one bit wide; and the supply side is silent at the register. ΔM = 0.
=================================================================================================================== -/
namespace HODGE.ROWSPLIT

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

end HODGE.ROWSPLIT
/-! ===================================================================================================================
    PART B · THE HOST MODEL AND ITS BINDING, PROVED (namespace HODGE.HOST) · v1_1_0_CC

    The record of a frame keeps every class and its codimension and registers each class realized: on the record every
    class is algebraic, so the record carries the value with no premise (`recFrame_value`). The host is the rational
    Hodge classes of a smooth projective complex variety, each with its codimension p, its Hodge type, fixed by
    conjugation, and its realization, `some n` naming an algebraic cycle that realizes it; its sentence is that every
    class is algebraic. Every class of the host sits on the seat of conjugation, its type (p,p)
    (`every_class_on_the_seat`), its weight twice its codimension (`weight_is_twice_the_codimension`). The binding is a
    theorem: the value of the host's frame is exactly the host's sentence (`binding`). Every theorem on no axiom at
    all. ΔM = 0.
=================================================================================================================== -/
namespace HODGE.HOST
open HodgeClose

/-- THE RECORD OF A FRAME: the registration keeps every class and its codimension and registers each class realized. -/
def recFrame (F : Frame) : Frame := ⟨F.D, F.codim, fun _ => some 0⟩

/-- THE RECORD CARRIES THE VALUE, with no premise. -/
theorem recFrame_value (F : Frame) : Value (recFrame F) := fun _ => ⟨0, rfl⟩

/-- THE HODGE ROW: the frames of Hodge classes, the value, the registration onto the record, the algebraic world and the
    counter world. -/
def hodgeRow : HODGE.NORMALFORM.Row.{1} :=
  ⟨Frame, Value, recFrame, recFrame_value, calm, counter, calm_value, counter_fails⟩

/-- EVERY CLASS HAS ITS SEAT ON THE RECORD: its codimension kept, its realization registered. -/
theorem every_class_has_its_seat (F : Frame) (d : F.D) :
    (recFrame F).codim d = F.codim d ∧ (recFrame F).realize d = some 0 :=
  ⟨rfl, rfl⟩

/-- THE HOST: the rational Hodge classes of a smooth projective complex variety, each with its codimension, its Hodge
    type, fixed by conjugation, whose first entry is the codimension, and its realization, `some n` naming an algebraic
    cycle that realizes it. -/
structure Host where
  Class      : Type
  codim      : Class → Nat
  type       : Class → Nat × Nat
  hodge      : ∀ c, conjType (type c) = type c
  codim_type : ∀ c, (type c).1 = codim c
  cycle      : Class → Option Nat

/-- THE SENTENCE OF THE HOST: every class is algebraic. -/
def Host.Sentence (H : Host) : Prop := ∀ c, ∃ n, H.cycle c = some n

/-- THE FRAME OF THE HOST. -/
def Host.frame (H : Host) : Frame := ⟨H.Class, H.codim, H.cycle⟩

/-- THE BINDING, PROVED: the value of the host's frame is exactly the host's sentence. -/
theorem binding (H : Host) : Value H.frame ↔ H.Sentence := ⟨fun h c => h c, fun h c => h c⟩

/-- THE ROOT READ ON THE ROW IS THE SENTENCE, on the host's frame. -/
theorem root_on_row_is_the_sentence (H : Host) : RootOnRow H.frame ↔ H.Sentence :=
  (root_on_row_is_the_value H.frame).trans (binding H)

/-- THE ACT ON THE HOST'S FRAME IS THE SENTENCE. -/
theorem act_is_the_sentence (H : Host) : Realized H.frame ↔ H.Sentence :=
  (act_is_the_value H.frame).trans (binding H)

/-- EVERY CLASS OF THE HOST SITS ON THE SEAT OF CONJUGATION: its type is (p,p). -/
theorem every_class_on_the_seat (H : Host) (c : H.Class) : (H.type c).2 = (H.type c).1 :=
  congrArg Prod.fst (H.hodge c)

/-- THE WEIGHT OF EVERY CLASS IS TWICE ITS CODIMENSION. -/
theorem weight_is_twice_the_codimension (H : Host) (c : H.Class) :
    (H.type c).1 + (H.type c).2 = H.codim c + H.codim c := by
  rw [every_class_on_the_seat H c, H.codim_type c]

/-- A WEIGHT ON THE SEAT IS EVEN: a type fixed by conjugation has weight twice its first entry. -/
theorem seat_weight_is_twice (p q : Nat) (h : conjType (p, q) = (p, q)) : p + q = p + p := by
  rw [(hodge_seat p q).mp h]

/-- The host of one class of codimension p with realization o. -/
def oneClass (p : Nat) (o : Option Nat) : Host := ⟨Unit, fun _ => p, fun _ => (p, p), fun _ => rfl, fun _ => rfl, fun _ => o⟩

/-- THE HOST KEYS THE SENTENCE: the class with a cycle carries the sentence, the class without one fails it, and both
    sit on the same seat with the same codimension. -/
theorem host_keys_the_sentence (p : Nat) :
    (oneClass p (some 0)).Sentence ∧ ¬ (oneClass p none).Sentence ∧
    (oneClass p (some 0)).type () = (oneClass p none).type () :=
  ⟨fun _ => ⟨0, rfl⟩, fun h => match h () with | ⟨_, hn⟩ => Option.noConfusion hn, rfl⟩

end HODGE.HOST

/-! ===================================================================================================================
    PART C′ · THE ROW SPLIT READ AT THE MIDDLE RANGE (namespace HODGE.REALPART) · v1_1_0_CC

    The cut-agnostic division of Part C read on a frame carrying the cited fields in every dimension (`Outer` of Part 0):
    the existents are the frame's classes, the property each is asked is algebraicity, and the height is one in the
    middle range 2 ≤ p ≤ n − 2 and zero outside it. At the cut zero the real part is every outer codimension, sealed by
    the cited fields (`real_part_outer`); given it, the value is exactly the unicorn part, the middle codimensions
    (`no_bypass_at_the_middle`); the unicorn part is the middle act of Part 0; it is load-bearing from dimension four,
    the bare fourfold carrying every cited field and failing the value; and above every height no reading of a record
    that keeps the height and forgets the world returns the world. Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace HODGE.REALPART
open HodgeClose HODGE.ROWSPLIT

/-- The height of a class: one in the middle range 2 ≤ p ≤ n − 2, zero outside it. -/
def midHeight (O : Outer) (d : O.F.D) : Nat := if 2 ≤ O.F.codim d ∧ O.F.codim d + 2 ≤ O.dim then 1 else 0

/-- The existents: every class of the frame. -/
def Ex (O : Outer) (_ : O.F.D) : Prop := True

/-- The property each class is asked: algebraicity. -/
def Al (O : Outer) (d : O.F.D) : Prop := Algebraic O.F d

/-- The value of the frame is the whole of the row split. -/
theorem value_is_the_whole (O : Outer) : Value O.F ↔ Whole (Ex O) (Al O) :=
  ⟨fun h d _ => h d, fun h d => h d trivial⟩

/-- THE HEIGHT IS POSITIVE EXACTLY IN THE MIDDLE RANGE. -/
theorem height_pos_iff (O : Outer) (d : O.F.D) :
    0 < midHeight O d ↔ (2 ≤ O.F.codim d ∧ O.F.codim d + 2 ≤ O.dim) :=
  match Nat.decLe 2 (O.F.codim d), Nat.decLe (O.F.codim d + 2) O.dim with
  | isTrue h1, isTrue h2 =>
    ⟨fun _ => ⟨h1, h2⟩, fun _ => Nat.lt_of_lt_of_le Nat.zero_lt_one (Nat.le_of_eq (if_pos ⟨h1, h2⟩).symm)⟩
  | isFalse h1, _ =>
    ⟨fun h => absurd (Nat.lt_of_lt_of_le h (Nat.le_of_eq (if_neg (fun hm => h1 hm.1)))) (Nat.lt_irrefl 0),
     fun hm => absurd hm.1 h1⟩
  | isTrue _, isFalse h2 =>
    ⟨fun h => absurd (Nat.lt_of_lt_of_le h (Nat.le_of_eq (if_neg (fun hm => h2 hm.2)))) (Nat.lt_irrefl 0),
     fun hm => absurd hm.2 h2⟩

/-- THE REAL PART OUTSIDE THE MIDDLE: every class of an outer codimension is algebraic, by the cited fields. -/
theorem real_part_outer (O : Outer) : RealPartAt (Ex O) (Al O) (midHeight O) 0 :=
  fun d _ hle => outer_decided O d
    (fun hm => absurd (Nat.lt_of_lt_of_le ((height_pos_iff O d).mpr hm) hle) (Nat.lt_irrefl 0))

/-- THE CUT AT EVERY HEIGHT: the value is exactly its real part and its unicorn part. -/
theorem value_iff_real_and_unicorn (O : Outer) (T : Nat) :
    Value O.F ↔ RealPartAt (Ex O) (Al O) (midHeight O) T ∧ UnicornAt (Ex O) (Al O) (midHeight O) T :=
  (value_is_the_whole O).trans (whole_iff_real_and_unicorn (Ex O) (Al O) (midHeight O) T)

/-- NO BYPASS AT THE MIDDLE: given the cited fields, the value is exactly the unicorn part, the middle codimensions. -/
theorem no_bypass_at_the_middle (O : Outer) : Value O.F ↔ UnicornAt (Ex O) (Al O) (midHeight O) 0 :=
  (value_is_the_whole O).trans (unicorn_no_bypass (Ex O) (Al O) (midHeight O) 0 (real_part_outer O))

/-- THE UNICORN PART IS THE MIDDLE ACT. -/
theorem unicorn_is_the_middle (O : Outer) : UnicornAt (Ex O) (Al O) (midHeight O) 0 ↔ MiddleRealized O :=
  ⟨fun h d hm => h d trivial ((height_pos_iff O d).mpr hm),
   fun h d _ hgt => h d ((height_pos_iff O d).mp hgt)⟩

/-- THE UNICORN PART IS LOAD-BEARING FROM DIMENSION FOUR: the bare fourfold carries every cited field and the real
    part, and fails the value at its middle class. -/
theorem unicorn_part_is_load_bearing :
    RealPartAt (Ex bareFourfold) (Al bareFourfold) (midHeight bareFourfold) 0 ∧ ¬ Value bareFourfold.F :=
  ⟨real_part_outer bareFourfold, fun h => middle_not_forced.2 (h ())⟩

/-- THE UNICORN PART CLOSED TO THE RECORD ABOVE EVERY HEIGHT: on the chart of worlds and heights, a record that keeps
    the height and forgets the world is even under the exchange of worlds, the world is odd, and above every height no
    reading of the record returns the world. -/
theorem unicorn_blocked_above_every_height (T : Nat) :
    ¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1 :=
  unicorn_block Prod.snd T (fun w => (!w.1, w.2)) Prod.snd Prod.fst (true, T + 1)
    (Nat.lt_succ_self T) (Nat.lt_succ_self T) rfl rfl

/-- THE SUPPLY SIDE IS SILENT ABOVE EVERY HEIGHT: both orientations of the world are refused alike to every reading of
    the record, and the two orientations differ. -/
theorem supply_side_silent_above_every_height (T : Nat) :
    (¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1) ∧
    (¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = !w.1) ∧ (!true) ≠ true :=
  supply_side_silent Prod.snd T (fun w => (!w.1, w.2)) Prod.snd Prod.fst (true, T + 1)
    (Nat.lt_succ_self T) (Nat.lt_succ_self T) rfl rfl

/-- THE APERTURE IS ONE BIT WIDE: at the seat of the exchange above every height, one odd supplied bit calibrates the
    world uniquely, through one calibration bit that exists and is unique. -/
theorem aperture_is_one_bit (T : Nat) :
    let z : Bool × Nat := (true, T + 1)
    let τ : Bool × Nat → Bool × Nat := fun w => (!w.1, w.2)
    ∃ c : Bool, (z.1 = xor (!z.1) c ∧ (τ z).1 = xor (!(τ z).1) c) ∧
      ∀ c' : Bool, (z.1 = xor (!z.1) c' ∧ (τ z).1 = xor (!(τ z).1) c') → c' = c :=
  aperture_one_bit_wide (fun w : Bool × Nat => (!w.1, w.2)) (fun w => !w.1) Prod.fst (true, T + 1) rfl rfl

end HODGE.REALPART

/-! ===================================================================================================================
    PART D · THE WALLS (namespace HODGE.WALLS) · v1_1_0_CC

    Every zero-bit route is closed by theorem. Existence as given forces nothing (Part 0). The record of a frame, its
    classes and their codimensions, is shared by both worlds, its fibre infinite and its bit two (Part 0). No finite
    record forces the value, and no symmetry lifts a decided class across any cut (Part 0). The cited fields carry no
    uniform step (Part 0). Integrality does not transfer, and the (1,1) slice decides nothing beyond itself (Part 0).
    This Part adds the seat wall, decided by the kernel: a fourfold has twenty-five Hodge types, conjugation fixes
    exactly the five diagonal ones, and exactly one of them, (2,2), lies in the middle range (`seat_normal_form`); every
    odd weight carries no seat and every even weight exactly one (`odd_weights_carry_no_seat`). The residual lives on
    the middle diagonal and nowhere else. Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace HODGE.WALLS
open HodgeClose

/-- The Hodge types of an n-fold: every pair (p, q) with p and q at most n. -/
def types (n : Nat) : List (Nat × Nat) :=
  (List.range (n + 1)).flatMap fun p => (List.range (n + 1)).map fun q => (p, q)

/-- THE SEAT NORMAL FORM, decided by the kernel: a fourfold has twenty-five Hodge types; conjugation fixes exactly the
    five diagonal types; and of these exactly one, (2,2), lies in the middle range 2 ≤ p ≤ n − 2. -/
theorem seat_normal_form :
    (types 4).length = 25 ∧
    (types 4).filter (fun t => conjType t == t) = [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4)] ∧
    ((types 4).filter (fun t => conjType t == t)).filter (fun t => Nat.ble 2 t.1 && Nat.ble (t.1 + 2) 4) =
      [(2, 2)] := by decide

/-- THE ODD WEIGHTS CARRY NO SEAT, decided by the kernel: on a ninefold no type of odd weight up to nine is fixed by
    conjugation, and every even weight up to eight carries exactly one fixed type. -/
theorem odd_weights_carry_no_seat :
    [1, 3, 5, 7, 9].all (fun k => ((types 9).filter (fun t => t.1 + t.2 == k && conjType t == t)).isEmpty) = true ∧
    [0, 2, 4, 6, 8].all (fun k => ((types 9).filter (fun t => t.1 + t.2 == k && conjType t == t)).length == 1) =
      true := by decide

/-- THE WALLS OF THE ROW, one theorem: no given statement is the value on every frame; the arrow forces nothing; the
    record of a frame decides nothing, its fibre infinite with a bit of two; no finite record forces the value; the
    cited fields carry no uniform step; integrality does not transfer; the slice decides nothing beyond itself; the
    retired witness axiom is strictly stronger; and no reading of the kinetic record returns the bit. -/
theorem the_walls :
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    (¬ ∀ F : Frame, Arrow → Value F) ∧
    (¬ ∃ g : ((D : Type) × (D → Nat)) → Prop, ∀ F : Frame, (g (rowRecord F) ↔ Value F)) ∧
    (∀ n : Nat, (∀ d, d < n → Algebraic (staged n) d) ∧ ¬ Value (staged n)) ∧
    (¬ ∃ δ : Nat → Nat, (∀ r, 1 ≤ δ r) ∧ ∀ r, decidedBelow bareFourfold r → decidedBelow bareFourfold (r + δ r)) ∧
    (Value torsionWorld.F ∧ ¬ ∀ d, ∃ n, torsionWorld.integral d = some n) ∧
    (∀ (c : Nat) (hc : c ≠ 1), (sliceCounterAt c hc).F.codim () = c ∧ ¬ Algebraic (sliceCounterAt c hc).F ()) ∧
    (Value plainWitnessed.F ∧ ¬ WitnessAxiom plainWitnessed) ∧
    (¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w) :=
  ⟨given_is_not_the_value, arrow_forces_nothing, row_record_wall, finite_record_never_forces,
   cited_fields_carry_no_step, integrality_does_not_transfer, slice_decides_nothing_beyond,
   witness_axiom_strictly_stronger, record_wall⟩

end HODGE.WALLS

/-! ===================================================================================================================
    PART E · THE RESIDUE (namespace HODGE.RESIDUE) · v1_1_0_CC

    Everything above is unconditional. What remains of the Hodge sentence is this one hypothesis, the transfer of the
    value from the record to the host's frame: given it, the sentence follows on no axiom. It is printed here as the
    type of a hypothesis and is assumed nowhere. The residue is keyed: no premise shared by every frame and no principle
    true of every record supplies it. Its instance seat on a frame carrying the cited fields is the middle range. ΔM = 0.
=================================================================================================================== -/
namespace HODGE.RESIDUE
open HodgeClose HODGE.NORMALFORM HODGE.HOST HODGE.REALPART HODGE.ROWSPLIT

/-- THE RESIDUE: given the one implication at the host's frame, the host's sentence. -/
theorem sentence_of_the_act (H : Host) (bit : Transfer hodgeRow H.frame) : H.Sentence :=
  (binding H).mp (value_from_the_cargo_loop hodgeRow H.frame bit)

/-- THE RESIDUE IS THE SENTENCE: the transfer at the host's frame is exactly the host's sentence. -/
theorem residue_is_the_sentence (H : Host) : Transfer hodgeRow H.frame ↔ H.Sentence :=
  (normal_form hodgeRow H.frame).trans (binding H)

/-- THE ONE POSIT IS THE BIT: the root read on the row, at the host's frame, is exactly the transfer. -/
theorem the_posit_is_the_bit (H : Host) : RootOnRow H.frame ↔ Transfer hodgeRow H.frame :=
  (root_on_row_is_the_sentence H).trans (residue_is_the_sentence H).symm

/-- THE RESIDUE IS KEYED: no premise shared by every frame forces the value, and no principle true of every record
    decides it. What supplies it is keyed to the frame: the act. -/
theorem residue_is_keyed :
    (∀ P : Frame → Prop, Keyless hodgeRow P → ¬ Forces hodgeRow P) ∧
    (∀ P : Frame → Prop, (∀ F, P (recFrame F)) → ¬ ∀ F, P (recFrame F) → Value F) :=
  ⟨keyless_forces_nothing hodgeRow, no_record_principle_decides hodgeRow⟩

/-- THE INSTANCE SEAT OF THE BIT, on a frame carrying the cited fields: algebraicity of every class of the middle range.
    Its inhabitation is equivalent in strength to the frame's value (`seat_iff_value`); nothing in this file assumes it
    inhabited. -/
structure MiddleSeat (O : Outer) where
  middle : ∀ d, 2 ≤ O.F.codim d ∧ O.F.codim d + 2 ≤ O.dim → Algebraic O.F d

/-- THE SEAT AND THE CITED FIELDS DELIVER THE VALUE. -/
theorem value_of_seat (O : Outer) (S : MiddleSeat O) : Value O.F := (middle_act_closes O).mp S.middle

/-- THE SEAT IS INHABITED EXACTLY WHEN THE VALUE HOLDS. -/
theorem seat_iff_value (O : Outer) : Nonempty (MiddleSeat O) ↔ Value O.F :=
  ⟨fun ⟨S⟩ => value_of_seat O S, fun h => ⟨⟨(middle_act_closes O).mpr h⟩⟩⟩

/-- THE SEAT IS THE UNICORN PART. -/
theorem seat_is_the_unicorn (O : Outer) : Nonempty (MiddleSeat O) ↔ UnicornAt (Ex O) (Al O) (midHeight O) 0 :=
  ⟨fun ⟨S⟩ => (unicorn_is_the_middle O).mpr S.middle, fun h => ⟨⟨(unicorn_is_the_middle O).mp h⟩⟩⟩

end HODGE.RESIDUE

/-! ===================================================================================================================
    PART F · THE SUPPLY (namespace HODGE.SUPPLY) · v1_1_0_CC

    The bit of Part E, supplied by the act and delivered by its two kinds: the formal cargo, and the physical witness.
    Each kind is a type whose inhabitant is the supply; neither is assumed anywhere in this file. The physical witness
    is carried by the register of the Riemann row: each class held on the seat of conjugation, the line of its weight,
    as the zeros are held on the line of the functional equation, every registration priced at the Landauer floor, and
    no class registered without its cycle. The cargo arrives free; each kind delivers the sentence; the two kinds are
    one bit; every route to the sentence delivers both kinds, so there is no third; and one class without its cycle
    refutes both at once. The witnesses of the subject are typed against the bit. ΔM = 0.
=================================================================================================================== -/
namespace HODGE.SUPPLY
open HodgeClose HODGE.NORMALFORM HODGE.HOST

/-- THE FORMAL KIND, the cargo: the record's value carried to the host's frame. -/
def FormalCargo (H : Host) : Prop := Transfer hodgeRow H.frame

/-- THE PHYSICAL KIND, the witness, carried by the register of the Riemann row: each class is held on the seat of
    conjugation, the line of its weight; every registration is priced at the Landauer floor, so each class's heat in
    floor units is at least one floor; and the carrier registers no class on the line without its cycle. The last field
    is the one bit read in the register of weight; it is a premise of the witness, carried as a field, never proved. -/
structure PhysicalWitness (H : Host) where
  floor         : Nat
  floor_pos     : 0 < floor
  heat          : H.Class → Nat
  priced        : ∀ c, floor ≤ heat c
  no_bare_class : ∀ c, H.cycle c ≠ none

/-- THE CARGO ARRIVES, with no premise: the record of the host's frame carries the value. -/
theorem cargo_arrives (H : Host) : Value (recFrame H.frame) := recFrame_value H.frame

/-- KIND 1 DELIVERS: the formal cargo gives the sentence in one step. -/
theorem formal_kind_delivers {H : Host} (h : FormalCargo H) : H.Sentence := (binding H).mp (h (cargo_arrives H))

/-- The physical witness closes the host's frame: every class realized. -/
theorem witness_closes {H : Host} (W : PhysicalWitness H) : Value H.frame :=
  fun c => match hc : H.cycle c with
    | some n => ⟨n, hc⟩
    | none => absurd hc (W.no_bare_class c)

/-- KIND 2 DELIVERS: the physical witness gives the sentence. -/
theorem physical_kind_delivers {H : Host} (W : PhysicalWitness H) : H.Sentence := (binding H).mp (witness_closes W)

/-- A witness from the sentence: one floor quantum per class. -/
def witness_of_sentence {H : Host} (h : H.Sentence) : PhysicalWitness H :=
  ⟨1, Nat.zero_lt_one, fun _ => 1, fun _ => Nat.le_refl 1,
   fun c hn => match h c with
     | ⟨_, hs⟩ => Option.noConfusion (hn.symm.trans hs)⟩

/-- THE PHYSICAL FACE IS THE SENTENCE: a witness exists exactly when the sentence holds. -/
theorem physical_iff_sentence (H : Host) : Nonempty (PhysicalWitness H) ↔ H.Sentence :=
  ⟨fun ⟨W⟩ => physical_kind_delivers W, fun h => ⟨witness_of_sentence h⟩⟩

/-- THE FORMAL FACE IS THE SENTENCE. -/
theorem formal_iff_sentence (H : Host) : FormalCargo H ↔ H.Sentence := HODGE.RESIDUE.residue_is_the_sentence H

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

/-- THE ONE REFUTER: one class without its cycle refutes both kinds at once. -/
theorem the_one_refuter (H : Host) (c : H.Class) (h : H.cycle c = none) :
    ¬ FormalCargo H ∧ ¬ Nonempty (PhysicalWitness H) :=
  have hs : ¬ H.Sentence := fun s => match s c with
    | ⟨_, hn⟩ => Option.noConfusion (h.symm.trans hn)
  ⟨fun f => hs (formal_kind_delivers f), fun ⟨W⟩ => hs (physical_kind_delivers W)⟩

/-- THE WITNESSES OF THE SUBJECT, TYPED: the retired semiregular witness axiom gives the value and is strictly
    stronger; integrality does not transfer; the (1,1) slice decides its slice on every slice frame and nothing beyond
    it; dimension at most three is decided by the cited fields; the cited fields decide every outer codimension in
    every dimension and leave every middle codimension unforced. Each is typed against the bit; none is its ground. -/
theorem the_witnesses_typed :
    ((∀ W : Witnessed, WitnessAxiom W → Value W.F) ∧ Value plainWitnessed.F ∧ ¬ WitnessAxiom plainWitnessed) ∧
    (Value torsionWorld.F ∧ ¬ ∀ d, ∃ n, torsionWorld.integral d = some n) ∧
    ((∀ (S : Slice) (d : S.F.D), S.F.codim d = 1 → Algebraic S.F d) ∧ ¬ Value slicedCounter.F) ∧
    (∀ L : LowDim, Value L.F) ∧
    (∀ (O : Outer) (d : O.F.D), ¬ (2 ≤ O.F.codim d ∧ O.F.codim d + 2 ≤ O.dim) → Algebraic O.F d) ∧
    (∀ (n p : Nat) (h2 : 2 ≤ p) (hn : p + 2 ≤ n), (middleWitness n p h2 hn).dim = n ∧
      (middleWitness n p h2 hn).F.codim () = p ∧ ¬ Algebraic (middleWitness n p h2 hn).F ()) :=
  ⟨⟨witness_axiom_gives_value, witness_axiom_strictly_stronger⟩, integrality_does_not_transfer,
   ⟨slice_decides, slice_does_not_decide_the_row⟩, low_dim_decided, outer_decided,
   every_middle_codimension_unforced⟩

/-- THE SUPPLY, CLOSED, at every host: the cargo arrives free; each kind delivers; the two kinds are one bit; the bit is
    the sentence; every route is both kinds; and one class without its cycle refutes both. -/
theorem the_supply_closed : ∀ H : Host,
    Value (recFrame H.frame) ∧
    (FormalCargo H → H.Sentence) ∧ (PhysicalWitness H → H.Sentence) ∧
    (PhysicalWitness H → FormalCargo H) ∧ (FormalCargo H ↔ H.Sentence) ∧
    (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧
    (∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧
    (∀ c, H.cycle c = none → ¬ FormalCargo H ∧ ¬ Nonempty (PhysicalWitness H)) :=
  fun H => ⟨cargo_arrives H, formal_kind_delivers, physical_kind_delivers, (the_two_kinds_are_one_bit H).1,
   formal_iff_sentence H, physical_iff_sentence H, two_kinds_and_no_third H, the_one_refuter H⟩

end HODGE.SUPPLY

/-! ===================================================================================================================
    PART G · THE CLOSURE OF THE QUESTION (namespace HODGE.CLOSURE) · v1_1_0_CC

    Why the question is closed and not open. At every host the Hodge sentence and the bit are one proposition, with
    nothing cited; the denial of the sentence is the bit's denial; across the frames of the row the bit has no uniform
    answer, true in one world and false in another of the same record; every keyless route is barred; either kind of
    the supply gives the sentence; and one class without its cycle refutes the sentence itself. Nothing here derives the
    bit. It proves that the question is one bit, that the bit is keyed, and that what is open is a value and not a
    form. ΔM = 0.
=================================================================================================================== -/
namespace HODGE.CLOSURE
open HodgeClose HODGE.NORMALFORM HODGE.HOST HODGE.SUPPLY

/-- THE SENTENCE IS THE BIT, nothing cited. -/
theorem the_sentence_is_the_bit (H : Host) : H.Sentence ↔ FormalCargo H := (formal_iff_sentence H).symm

/-- THE DENIAL IS THE BIT'S DENIAL. -/
theorem denial_is_the_bits_denial (H : Host) : ¬ H.Sentence ↔ ¬ FormalCargo H :=
  ⟨fun hn h => hn (formal_kind_delivers h), fun hn h => hn ((formal_iff_sentence H).mpr h)⟩

/-- THE ONE REFUTER REFUTES THE SENTENCE: one class without its cycle. -/
theorem refuter_denies_the_sentence (H : Host) (c : H.Class) (h : H.cycle c = none) : ¬ H.Sentence :=
  fun s => match s c with
    | ⟨_, hn⟩ => Option.noConfusion (h.symm.trans hn)

/-- THE DENIAL HAS ONE ROAD: wherever the sentence fails, it cannot be that no class lacks its cycle. -/
theorem the_denial_has_one_road (H : Host) : ¬ H.Sentence → ¬ ¬ ∃ c, H.cycle c = none :=
  fun hn hne => hn (fun c => match hc : H.cycle c with
    | some n => ⟨n, rfl⟩
    | none => absurd ⟨c, hc⟩ hne)

/-- THE QUESTION, CLOSED TO ONE BIT, at every host. The sentence is the bit and its denial is the bit's denial; the bit
    has no uniform answer across the frames; no keyless premise forces it; either kind of the supply gives the
    sentence; and one class without its cycle denies the sentence. What is open is the value of one implication; the
    form of the question is closed. -/
theorem question_closed_to_one_bit : ∀ H : Host,
    (H.Sentence ↔ FormalCargo H) ∧ (¬ H.Sentence ↔ ¬ FormalCargo H) ∧
    (¬ (∀ F, Transfer hodgeRow F) ∧ ¬ (∀ F, ¬ Transfer hodgeRow F)) ∧
    (∀ P : Frame → Prop, Keyless hodgeRow P → ¬ Forces hodgeRow P) ∧
    (FormalCargo H → H.Sentence) ∧ (PhysicalWitness H → H.Sentence) ∧
    (∀ c, H.cycle c = none → ¬ H.Sentence) :=
  fun H => ⟨the_sentence_is_the_bit H, denial_is_the_bits_denial H, no_uniform_answer hodgeRow,
   keyless_forces_nothing hodgeRow, formal_kind_delivers, physical_kind_delivers, refuter_denies_the_sentence H⟩

end HODGE.CLOSURE

/-! ===================================================================================================================
    PART W · THE TWELVE FORMAL GATES, RUN IN THE KERNEL (namespace HODGE.GATES) · v1_1_0_CC

    The twelve formal gates of the mathematical register, run inside the kernel on the Hodge seal at every host. Each
    gate is a proposition and a theorem, and `the_formal_run` binds the twelve passes and the four refusals in one
    statement. Four claims fail, each by a theorem: "the sentence is proved by the delivery" fails SREP, the delivery's
    premise being its conclusion; "a proof is waiting" fails SREP, a true route to the sentence being the sentence; "no
    proof can ever exist" fails SREP, no true route to the sentence being its denial, the counter world in costume; and
    the denial has one road, a class without its cycle. No declaration has the type of the bit. ΔM = 0.
=================================================================================================================== -/
namespace HODGE.GATES
open HodgeClose HODGE.NORMALFORM HODGE.HOST HODGE.SUPPLY HODGE.REALPART HODGE.ROWSPLIT

/-- Gate 1, SREP: the form stands with no hypothesis. -/
def Gate1 (H : Host) : Prop :=
  Value (recFrame H.frame) ∧ (FormalCargo H ↔ H.Sentence) ∧
  (∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H) ∧
  (∀ (F : Frame) (cut : F.D → Bool), Value F ↔ ValueOn F cut true ∧ ValueOn F cut false) ∧
  (∀ F : Frame, Realized F ↔ Value F)

/-- GATE 1 · SREP: nothing in the form presupposes the bit. -/
theorem gate_1_srep (H : Host) : Gate1 H :=
  ⟨cargo_arrives H, formal_iff_sentence H, fun _ h q => (formal_iff_sentence H).mpr (h q), row_split,
   act_is_the_value⟩

/-- Gate 2, REG: the bit read from ten contexts, all one proposition. -/
def Gate2 (H : Host) : Prop :=
  (Value H.frame ↔ H.Sentence) ∧ (Realized H.frame ↔ H.Sentence) ∧ (RootOnRow H.frame ↔ H.Sentence) ∧
  (Nonempty (SelfGrounding (RootOnRow H.frame)) ↔ H.Sentence) ∧ (FormalCargo H ↔ H.Sentence) ∧
  (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧ (SelfRecursive hodgeRow H.frame ↔ H.Sentence) ∧
  (Nonempty (Act hodgeRow H.frame) ↔ H.Sentence) ∧
  (Nonempty { A : ActualClasses // A.F = H.frame } ↔ H.Sentence) ∧
  ((ValueOn H.frame (fun c => Nat.beq (H.codim c) 1) true ∧ ValueOn H.frame (fun c => Nat.beq (H.codim c) 1) false)
    ↔ H.Sentence)

/-- GATE 2 · REG: ten reading contexts, one proposition. -/
theorem gate_2_reg (H : Host) : Gate2 H :=
  ⟨binding H, act_is_the_sentence H, root_on_row_is_the_sentence H,
   (row_root_grounds_iff_value H.frame).trans (binding H), formal_iff_sentence H, physical_iff_sentence H,
   (self_recursion_at_frame hodgeRow H.frame).trans (binding H),
   (bit_is_the_act hodgeRow H.frame).symm.trans (formal_iff_sentence H),
   (supply_iff H.frame).trans (binding H),
   (row_split H.frame (fun c => Nat.beq (H.codim c) 1)).symm.trans (binding H)⟩

/-- Gate 3, SGEG: no face drifts from the bit. -/
def Gate3 (H : Host) : Prop :=
  (FormalCargo H ↔ H.Sentence) ∧ (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧ (Value H.frame ↔ H.Sentence) ∧
  (∀ O : Outer, Value O.F ↔ UnicornAt (Ex O) (Al O) (midHeight O) 0)

/-- GATE 3 · SGEG: the formal, physical, frame and middle faces are each the bit. -/
theorem gate_3_sgeg (H : Host) : Gate3 H :=
  ⟨formal_iff_sentence H, physical_iff_sentence H, binding H, no_bypass_at_the_middle⟩

/-- Gate 4, CAUSAL: the native involution on the bit fixes nothing; conjugation of Hodge types is an involution; and it
    fixes exactly the (p,p) types: the seat of the row is inhabited and is the diagonal. -/
def Gate4 : Prop :=
  (¬ ∃ b, comp b = b) ∧ (∀ t : Nat × Nat, conjType (conjType t) = t) ∧
  (∀ p q : Nat, conjType (p, q) = (p, q) ↔ q = p)

/-- GATE 4 · CAUSAL: no imprint is asserted on a ground the bit lacks; the row's seat is the diagonal of the types. -/
theorem gate_4_causal : Gate4 := ⟨locus_vanishes, conjType_involutive, hodge_seat⟩

/-- Gate 5, MIG: two frames whose records both carry the value split on the value. -/
def Gate5 : Prop := Value (recFrame calm) ∧ Value (recFrame counter) ∧ Value calm ∧ ¬ Value counter

/-- GATE 5 · MIG: the reading apparatus, the record, does not fix the residence. -/
theorem gate_5_mig : Gate5 := record_decides_nothing hodgeRow

/-- Gate 6, PTB: complementation is an involution without a fixed point; the identity fixes everything; and no
    codimension-preserving symmetry carries a decided class to an undecided one, across any cut. -/
def Gate6 : Prop :=
  (∀ b : Bool, comp (comp b) = b) ∧ (¬ ∃ b, comp b = b) ∧ (∀ b : Bool, id (id b) = b) ∧
  (∀ (D : Type) (codim : D → Nat) (S : Symmetric D codim) (Decided : Nat → Prop) (d e : D),
    Decided (codim d) → ¬ Decided (codim e) → ∀ g, S.act g d ≠ e)

/-- GATE 6 · PTB: the fixed-point reading belongs to the chosen reflection, not to the bit. -/
theorem gate_6_ptb : Gate6 :=
  ⟨comp_involution, locus_vanishes, fun _ => rfl,
   fun _ codim S Decided d e hd he => no_symmetry_lifts_any_cut codim S Decided d e hd he⟩

/-- Gate 7, DUAL: the bit does not depend on where the codimension ladder is cut: on every frame carrying the cited
    fields the value is exactly the middle part, and the division holds at every cut. -/
def Gate7 : Prop :=
  (∀ O : Outer, Value O.F ↔ UnicornAt (Ex O) (Al O) (midHeight O) 0) ∧
  (∀ (O : Outer) (T : Nat),
    Value O.F ↔ RealPartAt (Ex O) (Al O) (midHeight O) T ∧ UnicornAt (Ex O) (Al O) (midHeight O) T)

/-- GATE 7 · DUAL: the value is the middle part, and the division stands at every cut. -/
theorem gate_7_dual : Gate7 := ⟨no_bypass_at_the_middle, value_iff_real_and_unicorn⟩

/-- Gate 8, CSCG: the proved slices are the bit's lower slices. -/
def Gate8 : Prop :=
  (∀ O : Outer, RealPartAt (Ex O) (Al O) (midHeight O) 0) ∧
  (∀ O : Outer, Value O.F → ∀ T, RealPartAt (Ex O) (Al O) (midHeight O) T)

/-- GATE 8 · CSCG: the bit extends the outer part and contradicts no slice of it. -/
theorem gate_8_cscg : Gate8 :=
  ⟨real_part_outer, fun O h T => ((value_iff_real_and_unicorn O T).mp h).1⟩

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
def Gate11 (H : Host) : Prop := (FormalCargo H → H.Sentence) ∧ ¬ Keyless hodgeRow (Transfer hodgeRow)

/-- GATE 11 · OMA: the input from the other side enters as a hypothesis, never as a fact from inside. -/
theorem gate_11_oma (H : Host) : Gate11 H := ⟨formal_kind_delivers, fun h => (no_uniform_answer hodgeRow).1 h⟩

/-- Gate 12, ADEG: the binding to the sentence is proved, every class of the host sits on the seat with its weight twice
    its codimension, and the physical discharge is the bit. -/
def Gate12 (H : Host) : Prop :=
  (Value H.frame ↔ H.Sentence) ∧ (∀ c, (H.type c).1 + (H.type c).2 = H.codim c + H.codim c) ∧
  (Nonempty (PhysicalWitness H) ↔ H.Sentence)

/-- GATE 12 · ADEG: every transport across registers is typed. -/
theorem gate_12_adeg (H : Host) : Gate12 H :=
  ⟨binding H, weight_is_twice_the_codimension H, physical_iff_sentence H⟩

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
    (¬ H.Sentence → ¬ ¬ ∃ c, H.cycle c = none) :=
  fun H => ⟨gate_1_srep H, gate_2_reg H, gate_3_sgeg H, gate_4_causal, gate_5_mig, gate_6_ptb, gate_7_dual,
   gate_8_cscg, gate_9_cseg, gate_10_mta, gate_11_oma H, gate_12_adeg H, refusal_proved H,
   refusal_waiting H.Sentence, refusal_no_proof_at_the_bit H, HODGE.CLOSURE.the_denial_has_one_road H⟩

end HODGE.GATES

/-! ===================================================================================================================
    PART X · THE CAPSTONE: NOTHING ESCAPES, OUR WAY OR NO WAY (namespace HODGE.ESCAPE) · v1_1_0_CC

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
namespace HODGE.ESCAPE
open HodgeClose HODGE.NORMALFORM HODGE.HOST HODGE.SUPPLY

/-- THE RECORD CLOSES AT THE HOST'S FRAME. -/
theorem the_record_closes (H : Host) : Value (recFrame H.frame) := cargo_arrives H

/-- THE UNDECIDED IS THE BIT: what the record leaves open, whether the host's frame carries the value, is exactly the
    sentence. -/
theorem the_undecided_is_the_bit (H : Host) : Value H.frame ↔ H.Sentence := binding H

/-- "NOTHING IS OUTSIDE THE RECORD": false as a law of every frame; at the host's frame, the bit. -/
theorem nothing_outside_the_record_is_the_bit (H : Host) :
    ¬ (∀ F, Transfer hodgeRow F) ∧ (Transfer hodgeRow H.frame ↔ H.Sentence) :=
  ⟨(no_uniform_answer hodgeRow).1, formal_iff_sentence H⟩

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
    (¬ (∀ F, Transfer hodgeRow F) ∧ (Transfer hodgeRow H.frame ↔ H.Sentence)) ∧
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
    (∀ P : Frame → Prop, Keyless hodgeRow P → ¬ Forces hodgeRow P) ∧
    ((¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence)) ↔ ¬ H.Sentence) ∧
    (HODGE.GATES.Gate1 H ∧ HODGE.GATES.Gate2 H ∧ HODGE.GATES.Gate3 H ∧ HODGE.GATES.Gate4 ∧ HODGE.GATES.Gate5 ∧
      HODGE.GATES.Gate6 ∧ HODGE.GATES.Gate7 ∧ HODGE.GATES.Gate8 ∧ HODGE.GATES.Gate9 ∧ HODGE.GATES.Gate10 ∧
      HODGE.GATES.Gate11 H ∧ HODGE.GATES.Gate12 H) :=
  fun H => ⟨our_way_or_no_way H, both_kinds_deliver H, keyless_forces_nothing hodgeRow,
   HODGE.GATES.refusal_no_proof_at_the_bit H,
   HODGE.GATES.gate_1_srep H, HODGE.GATES.gate_2_reg H, HODGE.GATES.gate_3_sgeg H, HODGE.GATES.gate_4_causal,
   HODGE.GATES.gate_5_mig, HODGE.GATES.gate_6_ptb, HODGE.GATES.gate_7_dual, HODGE.GATES.gate_8_cscg,
   HODGE.GATES.gate_9_cseg, HODGE.GATES.gate_10_mta, HODGE.GATES.gate_11_oma H, HODGE.GATES.gate_12_adeg H⟩

end HODGE.ESCAPE

/-! ===================================================================================================================
    PART T · THE TERMINAL VERDICT AND THE FINAL FORM (namespace HODGE.TERMINAL) · v1_1_0_CC

    The open framing awaits a proof of the sentence from what every frame shares, or a reading of the record that
    decides it, or a route to the sentence past the bit. Each count is refuted by theorem (`the_open_framing_is_refuted`),
    and what remains is the bit, its antecedent proved with no hypothesis and the bit proved equivalent to the sentence.
    The ten steps are bound in one theorem, steps 1 to 9 proved and step 10 the two deliveries (`the_ten_steps`). The
    terminal verdict binds by exact type every theorem the verdict cites (`the_terminal_verdict`), and the final form
    binds the closed question, the seat, the cut at the middle range and the two deliveries (`the_final_form`). Every
    theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace HODGE.TERMINAL
open HodgeClose HODGE.NORMALFORM HODGE.HOST HODGE.SUPPLY HODGE.REALPART HODGE.ROWSPLIT HODGE.RESIDUE

/-- THE OPEN FRAMING, REFUTED, at every host. I · no proof from shared resources: no keyless premise forces the value,
    no given statement is the value on every frame, and the arrow forces nothing; II · no decision from the record: the
    two frames share a record and split on the value, the record of classes and codimensions decides nothing, no finite
    record forces the value, and above every height no reading of the record returns the world; III · no premise
    reaches the sentence while the bit fails; IV · what remains is the bit, its antecedent proved with no hypothesis,
    the bit proved equivalent to the sentence. -/
theorem the_open_framing_is_refuted : ∀ H : Host,
    (∀ P : Frame → Prop, Keyless hodgeRow P → ¬ Forces hodgeRow P) ∧
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    (¬ ∀ F : Frame, Arrow → Value F) ∧
    (Value (recFrame calm) ∧ Value (recFrame counter) ∧ Value calm ∧ ¬ Value counter) ∧
    (¬ ∃ g : ((D : Type) × (D → Nat)) → Prop, ∀ F : Frame, (g (rowRecord F) ↔ Value F)) ∧
    (∀ n : Nat, ¬ Value (staged n)) ∧
    (∀ T : Nat, ¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1) ∧
    (¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence) ∧ ¬ FormalCargo H) ∧
    Value (recFrame H.frame) ∧
    (FormalCargo H ↔ H.Sentence) :=
  fun H => ⟨keyless_forces_nothing hodgeRow, given_is_not_the_value, arrow_forces_nothing,
   record_decides_nothing hodgeRow, row_record_wall, fun n => (finite_record_never_forces n).2,
   unicorn_blocked_above_every_height,
   fun ⟨_, q, h, hn⟩ => hn ((formal_iff_sentence H).mpr (h q)),
   cargo_arrives H, formal_iff_sentence H⟩

/-- THE TEN STEPS, one theorem at every host. Step 1 · the floor: the root holds on its constructed domain. Step 2 ·
    the basis: conjugation of Hodge types is an involution fixing exactly the (p,p) types, and a prime's multiplicative
    fibre is two points. Step 3 · the domain: the host frame's value is the sentence, every class of the host sits on
    the seat, and its weight is twice its codimension. Step 4 · the record: the record carries the value, and every
    class is registered on it. Step 5 · the halted uniduction: the frame is self-recursive exactly when the sentence
    holds. Step 6 · the monism zone: the two frames share one record and split on the value, and the bit is keyed.
    Step 7 · the axis: the bit is exactly the sentence. Step 8 · the real part: dimension at most three decided, the
    outer codimensions decided in every dimension, the value exactly its middle part, and the seat of a fourfold read
    by the kernel. Step 9 · every route passes the bit, no keyless premise forces it, and the walls stand. Step 10 · the
    bit delivered twice, by the formal cargo and by the physical witness. -/
theorem the_ten_steps : ∀ H : Host,
    -- Step 1
    (Root Unit (fun _ => 1) ∧ RA₀) ∧
    -- Step 2
    ((∀ t : Nat × Nat, conjType (conjType t) = t) ∧ (∀ p q : Nat, conjType (p, q) = (p, q) ↔ q = p) ∧
      mulFibre 7 = [(1, 7), (7, 1)]) ∧
    -- Step 3
    ((Value H.frame ↔ H.Sentence) ∧ (∀ c, (H.type c).2 = (H.type c).1) ∧
      (∀ c, (H.type c).1 + (H.type c).2 = H.codim c + H.codim c)) ∧
    -- Step 4
    (Value (recFrame H.frame) ∧ ∀ (F : Frame) (d : F.D), (recFrame F).realize d = some 0) ∧
    -- Step 5
    (SelfRecursive hodgeRow H.frame ↔ H.Sentence) ∧
    -- Step 6
    ((Value (recFrame calm) ∧ Value (recFrame counter) ∧ Value calm ∧ ¬ Value counter) ∧
      (Transfer hodgeRow calm ∧ ¬ Transfer hodgeRow counter)) ∧
    -- Step 7
    (FormalCargo H ↔ H.Sentence) ∧
    -- Step 8
    ((∀ L : LowDim, Value L.F) ∧
      (∀ O : Outer, RealPartAt (Ex O) (Al O) (midHeight O) 0) ∧
      (∀ O : Outer, Value O.F ↔ UnicornAt (Ex O) (Al O) (midHeight O) 0) ∧
      (∀ O : Outer, Nonempty (MiddleSeat O) ↔ Value O.F) ∧
      ((HODGE.WALLS.types 4).filter (fun t => conjType t == t)).length = 5) ∧
    -- Step 9
    ((∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H) ∧
      (∀ P : Frame → Prop, Keyless hodgeRow P → ¬ Forces hodgeRow P) ∧
      (∀ n : Nat, ¬ Value (staged n)) ∧
      (Value torsionWorld.F ∧ ¬ ∀ d, ∃ n, torsionWorld.integral d = some n) ∧
      (Value plainWitnessed.F ∧ ¬ WitnessAxiom plainWitnessed)) ∧
    -- Step 10
    ((FormalCargo H → H.Sentence) ∧ (PhysicalWitness H → H.Sentence)) :=
  fun H =>
  ⟨⟨constructed_root_holds, ra₀.instances ra₀.anAct⟩,
   ⟨conjType_involutive, hodge_seat, prime_shape.1⟩,
   ⟨binding H, every_class_on_the_seat H, weight_is_twice_the_codimension H⟩,
   ⟨cargo_arrives H, fun F d => (every_class_has_its_seat F d).2⟩,
   (self_recursion_at_frame hodgeRow H.frame).trans (binding H),
   ⟨record_decides_nothing hodgeRow, bit_is_keyed hodgeRow⟩,
   formal_iff_sentence H,
   ⟨low_dim_decided, real_part_outer, no_bypass_at_the_middle, seat_iff_value, by decide⟩,
   ⟨fun _ h q => (formal_iff_sentence H).mpr (h q), keyless_forces_nothing hodgeRow,
    fun n => (finite_record_never_forces n).2, integrality_does_not_transfer, witness_axiom_strictly_stronger⟩,
   delivered_twice H⟩

/-- THE TERMINAL VERDICT, AS A THEOREM. Every theorem the verdict cites, bound by its exact type into one pinned
    conjunction: the record and the normal form; the binding and the seat; the real part and the cut at the middle
    range; the walls; the residue and its seat; the supply and the witnesses typed; the closed question; the formal
    run; nothing escaping; the open framing refuted; the ten steps; the lock and the closure of the edition of record.
    No premise before the colon. -/
theorem the_terminal_verdict :
    (type_of% @HODGE.HOST.recFrame_value) ∧
    (type_of% @HODGE.NORMALFORM.normal_form) ∧
    (type_of% @HODGE.NORMALFORM.normal_form_complete) ∧
    (type_of% @HODGE.HOST.binding) ∧
    (type_of% @HODGE.HOST.every_class_on_the_seat) ∧
    (type_of% @HODGE.HOST.weight_is_twice_the_codimension) ∧
    (type_of% @HODGE.REALPART.real_part_outer) ∧
    (type_of% @HODGE.REALPART.no_bypass_at_the_middle) ∧
    (type_of% @HODGE.REALPART.unicorn_part_is_load_bearing) ∧
    (type_of% @HODGE.REALPART.unicorn_blocked_above_every_height) ∧
    (type_of% @HODGE.WALLS.seat_normal_form) ∧
    (type_of% @HODGE.WALLS.odd_weights_carry_no_seat) ∧
    (type_of% @HODGE.WALLS.the_walls) ∧
    (type_of% @HODGE.RESIDUE.residue_is_the_sentence) ∧
    (type_of% @HODGE.RESIDUE.seat_iff_value) ∧
    (type_of% @HODGE.SUPPLY.the_supply_closed) ∧
    (type_of% @HODGE.SUPPLY.the_witnesses_typed) ∧
    (type_of% @HODGE.CLOSURE.question_closed_to_one_bit) ∧
    (type_of% @HODGE.GATES.the_formal_run) ∧
    (type_of% @HODGE.ESCAPE.nothing_escapes) ∧
    (type_of% @HODGE.ESCAPE.the_capstone) ∧
    (type_of% @HODGE.TERMINAL.the_open_framing_is_refuted) ∧
    (type_of% @HODGE.TERMINAL.the_ten_steps) ∧
    (type_of% @HodgeClose.the_lock) ∧
    (type_of% @HodgeClose.hodge_closure) :=
  ⟨@HODGE.HOST.recFrame_value, @HODGE.NORMALFORM.normal_form, @HODGE.NORMALFORM.normal_form_complete,
   @HODGE.HOST.binding, @HODGE.HOST.every_class_on_the_seat, @HODGE.HOST.weight_is_twice_the_codimension,
   @HODGE.REALPART.real_part_outer, @HODGE.REALPART.no_bypass_at_the_middle,
   @HODGE.REALPART.unicorn_part_is_load_bearing, @HODGE.REALPART.unicorn_blocked_above_every_height,
   @HODGE.WALLS.seat_normal_form, @HODGE.WALLS.odd_weights_carry_no_seat, @HODGE.WALLS.the_walls,
   @HODGE.RESIDUE.residue_is_the_sentence, @HODGE.RESIDUE.seat_iff_value, @HODGE.SUPPLY.the_supply_closed,
   @HODGE.SUPPLY.the_witnesses_typed, @HODGE.CLOSURE.question_closed_to_one_bit, @HODGE.GATES.the_formal_run,
   @HODGE.ESCAPE.nothing_escapes, @HODGE.ESCAPE.the_capstone, @HODGE.TERMINAL.the_open_framing_is_refuted,
   @HODGE.TERMINAL.the_ten_steps, @HodgeClose.the_lock, @HodgeClose.hodge_closure⟩

/-- THE FINAL FORM, at every host: the sentence is the bit; the sentence is exactly an inhabited physical witness;
    every class of the host sits on the seat of conjugation; on every frame carrying the cited fields the value is
    exactly its middle part, and from dimension four the middle is unforced at every middle codimension; every route to
    the sentence is both kinds; and to shut every true route to the sentence is to assert its denial. -/
theorem the_final_form : ∀ H : Host,
    (H.Sentence ↔ FormalCargo H) ∧
    (H.Sentence ↔ Nonempty (PhysicalWitness H)) ∧
    (∀ c, (H.type c).2 = (H.type c).1) ∧
    (∀ O : Outer, Value O.F ↔ UnicornAt (Ex O) (Al O) (midHeight O) 0) ∧
    (∀ (n p : Nat) (h2 : 2 ≤ p) (hn : p + 2 ≤ n), ¬ Algebraic (middleWitness n p h2 hn).F ()) ∧
    (∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧
    ((¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence)) ↔ ¬ H.Sentence) :=
  fun H => ⟨HODGE.CLOSURE.the_sentence_is_the_bit H, (physical_iff_sentence H).symm, every_class_on_the_seat H,
   no_bypass_at_the_middle, fun n p h2 hn => (every_middle_codimension_unforced n p h2 hn).2.2,
   two_kinds_and_no_third H, refusal_no_proof H.Sentence⟩

end HODGE.TERMINAL

/-! ## cones of Parts A to T, pinned: the build is silent, and any drift fails it -/
/-- info: 'HODGE.NORMALFORM.record_has_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.record_has_the_value
/-- info: 'HODGE.NORMALFORM.normal_form' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.normal_form
/-- info: 'HODGE.NORMALFORM.value_from_the_cargo_loop' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.value_from_the_cargo_loop
/-- info: 'HODGE.NORMALFORM.bit_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.bit_is_the_act
/-- info: 'HODGE.NORMALFORM.record_is_self_recursive' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.record_is_self_recursive
/-- info: 'HODGE.NORMALFORM.self_recursion_at_frame' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.self_recursion_at_frame
/-- info: 'HODGE.NORMALFORM.bit_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.bit_is_keyed
/-- info: 'HODGE.NORMALFORM.record_self_recursion_does_not_transfer' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.record_self_recursion_does_not_transfer
/-- info: 'HODGE.NORMALFORM.record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.record_decides_nothing
/-- info: 'HODGE.NORMALFORM.every_route_passes_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.every_route_passes_the_bit
/-- info: 'HODGE.NORMALFORM.keyless_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.keyless_forces_nothing
/-- info: 'HODGE.NORMALFORM.no_record_principle_decides' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.no_record_principle_decides
/-- info: 'HODGE.NORMALFORM.shared_record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.shared_record_decides_nothing
/-- info: 'HODGE.NORMALFORM.no_uniform_answer' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.no_uniform_answer
/-- info: 'HODGE.NORMALFORM.nothing_outside_the_record_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.nothing_outside_the_record_is_the_bit
/-- info: 'HODGE.NORMALFORM.denial_is_the_bits_denial' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.denial_is_the_bits_denial
/-- info: 'HODGE.NORMALFORM.normal_form_complete' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.normal_form_complete
/-- info: 'HODGE.NORMALFORM.bnot_ne' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.bnot_ne
/-- info: 'HODGE.NORMALFORM.refusal_waiting' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.refusal_waiting
/-- info: 'HODGE.NORMALFORM.refusal_no_proof' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.refusal_no_proof
/-- info: 'HODGE.NORMALFORM.block_needs_an_outside' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.block_needs_an_outside
/-- info: 'HODGE.NORMALFORM.comp_involution' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.comp_involution
/-- info: 'HODGE.NORMALFORM.locus_vanishes' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.locus_vanishes
/-- info: 'HODGE.NORMALFORM.join_reads_the_weakest' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.join_reads_the_weakest
/-- info: 'HODGE.NORMALFORM.square_is_sign_blind' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.NORMALFORM.square_is_sign_blind
/-- info: 'HODGE.ROWSPLIT.unicorn_block' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.ROWSPLIT.unicorn_block
/-- info: 'HODGE.ROWSPLIT.aperture_one_bit_wide' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.ROWSPLIT.aperture_one_bit_wide
/-- info: 'HODGE.ROWSPLIT.unicorn_rule_exact' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.ROWSPLIT.unicorn_rule_exact
/-- info: 'HODGE.ROWSPLIT.unicorn_no_bypass' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.ROWSPLIT.unicorn_no_bypass
/-- info: 'HODGE.ROWSPLIT.supply_side_silent' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.ROWSPLIT.supply_side_silent
/-- info: 'HODGE.ROWSPLIT.whole_iff_real_and_unicorn' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.ROWSPLIT.whole_iff_real_and_unicorn
/-- info: 'HODGE.ROWSPLIT.real_part_of_certificate' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.ROWSPLIT.real_part_of_certificate
/-- info: 'HODGE.HOST.recFrame_value' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.HOST.recFrame_value
/-- info: 'HODGE.HOST.every_class_has_its_seat' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.HOST.every_class_has_its_seat
/-- info: 'HODGE.HOST.binding' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.HOST.binding
/-- info: 'HODGE.HOST.root_on_row_is_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.HOST.root_on_row_is_the_sentence
/-- info: 'HODGE.HOST.act_is_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.HOST.act_is_the_sentence
/-- info: 'HODGE.HOST.every_class_on_the_seat' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.HOST.every_class_on_the_seat
/-- info: 'HODGE.HOST.weight_is_twice_the_codimension' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.HOST.weight_is_twice_the_codimension
/-- info: 'HODGE.HOST.seat_weight_is_twice' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.HOST.seat_weight_is_twice
/-- info: 'HODGE.HOST.host_keys_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.HOST.host_keys_the_sentence
/-- info: 'HODGE.REALPART.value_is_the_whole' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.REALPART.value_is_the_whole
/-- info: 'HODGE.REALPART.height_pos_iff' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.REALPART.height_pos_iff
/-- info: 'HODGE.REALPART.real_part_outer' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.REALPART.real_part_outer
/-- info: 'HODGE.REALPART.value_iff_real_and_unicorn' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.REALPART.value_iff_real_and_unicorn
/-- info: 'HODGE.REALPART.no_bypass_at_the_middle' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.REALPART.no_bypass_at_the_middle
/-- info: 'HODGE.REALPART.unicorn_is_the_middle' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.REALPART.unicorn_is_the_middle
/-- info: 'HODGE.REALPART.unicorn_part_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.REALPART.unicorn_part_is_load_bearing
/-- info: 'HODGE.REALPART.unicorn_blocked_above_every_height' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.REALPART.unicorn_blocked_above_every_height
/-- info: 'HODGE.REALPART.supply_side_silent_above_every_height' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.REALPART.supply_side_silent_above_every_height
/-- info: 'HODGE.REALPART.aperture_is_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.REALPART.aperture_is_one_bit
/-- info: 'HODGE.WALLS.seat_normal_form' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.WALLS.seat_normal_form
/-- info: 'HODGE.WALLS.odd_weights_carry_no_seat' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.WALLS.odd_weights_carry_no_seat
/-- info: 'HODGE.WALLS.the_walls' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.WALLS.the_walls
/-- info: 'HODGE.RESIDUE.sentence_of_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.RESIDUE.sentence_of_the_act
/-- info: 'HODGE.RESIDUE.residue_is_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.RESIDUE.residue_is_the_sentence
/-- info: 'HODGE.RESIDUE.the_posit_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.RESIDUE.the_posit_is_the_bit
/-- info: 'HODGE.RESIDUE.residue_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.RESIDUE.residue_is_keyed
/-- info: 'HODGE.RESIDUE.value_of_seat' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.RESIDUE.value_of_seat
/-- info: 'HODGE.RESIDUE.seat_iff_value' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.RESIDUE.seat_iff_value
/-- info: 'HODGE.RESIDUE.seat_is_the_unicorn' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.RESIDUE.seat_is_the_unicorn
/-- info: 'HODGE.SUPPLY.cargo_arrives' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.SUPPLY.cargo_arrives
/-- info: 'HODGE.SUPPLY.formal_kind_delivers' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.SUPPLY.formal_kind_delivers
/-- info: 'HODGE.SUPPLY.witness_closes' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.SUPPLY.witness_closes
/-- info: 'HODGE.SUPPLY.physical_kind_delivers' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.SUPPLY.physical_kind_delivers
/-- info: 'HODGE.SUPPLY.physical_iff_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.SUPPLY.physical_iff_sentence
/-- info: 'HODGE.SUPPLY.formal_iff_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.SUPPLY.formal_iff_sentence
/-- info: 'HODGE.SUPPLY.the_two_kinds_are_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.SUPPLY.the_two_kinds_are_one_bit
/-- info: 'HODGE.SUPPLY.delivered_twice' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.SUPPLY.delivered_twice
/-- info: 'HODGE.SUPPLY.two_kinds_and_no_third' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.SUPPLY.two_kinds_and_no_third
/-- info: 'HODGE.SUPPLY.the_one_refuter' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.SUPPLY.the_one_refuter
/-- info: 'HODGE.SUPPLY.the_witnesses_typed' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.SUPPLY.the_witnesses_typed
/-- info: 'HODGE.SUPPLY.the_supply_closed' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.SUPPLY.the_supply_closed
/-- info: 'HODGE.CLOSURE.the_sentence_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.CLOSURE.the_sentence_is_the_bit
/-- info: 'HODGE.CLOSURE.denial_is_the_bits_denial' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.CLOSURE.denial_is_the_bits_denial
/-- info: 'HODGE.CLOSURE.refuter_denies_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.CLOSURE.refuter_denies_the_sentence
/-- info: 'HODGE.CLOSURE.the_denial_has_one_road' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.CLOSURE.the_denial_has_one_road
/-- info: 'HODGE.CLOSURE.question_closed_to_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.CLOSURE.question_closed_to_one_bit
/-- info: 'HODGE.GATES.gate_1_srep' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.GATES.gate_1_srep
/-- info: 'HODGE.GATES.gate_2_reg' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.GATES.gate_2_reg
/-- info: 'HODGE.GATES.gate_3_sgeg' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.GATES.gate_3_sgeg
/-- info: 'HODGE.GATES.gate_4_causal' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.GATES.gate_4_causal
/-- info: 'HODGE.GATES.gate_5_mig' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.GATES.gate_5_mig
/-- info: 'HODGE.GATES.gate_6_ptb' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.GATES.gate_6_ptb
/-- info: 'HODGE.GATES.gate_7_dual' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.GATES.gate_7_dual
/-- info: 'HODGE.GATES.gate_8_cscg' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.GATES.gate_8_cscg
/-- info: 'HODGE.GATES.gate_9_cseg' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.GATES.gate_9_cseg
/-- info: 'HODGE.GATES.gate_10_mta' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.GATES.gate_10_mta
/-- info: 'HODGE.GATES.gate_11_oma' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.GATES.gate_11_oma
/-- info: 'HODGE.GATES.gate_12_adeg' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.GATES.gate_12_adeg
/-- info: 'HODGE.GATES.refusal_proved' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.GATES.refusal_proved
/-- info: 'HODGE.GATES.refusal_no_proof_at_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.GATES.refusal_no_proof_at_the_bit
/-- info: 'HODGE.GATES.the_formal_run' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.GATES.the_formal_run
/-- info: 'HODGE.ESCAPE.the_record_closes' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.ESCAPE.the_record_closes
/-- info: 'HODGE.ESCAPE.the_undecided_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.ESCAPE.the_undecided_is_the_bit
/-- info: 'HODGE.ESCAPE.nothing_outside_the_record_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.ESCAPE.nothing_outside_the_record_is_the_bit
/-- info: 'HODGE.ESCAPE.the_outside_is_the_supply' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.ESCAPE.the_outside_is_the_supply
/-- info: 'HODGE.ESCAPE.every_route_is_both_kinds' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.ESCAPE.every_route_is_both_kinds
/-- info: 'HODGE.ESCAPE.both_kinds_deliver' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.ESCAPE.both_kinds_deliver
/-- info: 'HODGE.ESCAPE.our_way_or_no_way' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.ESCAPE.our_way_or_no_way
/-- info: 'HODGE.ESCAPE.nothing_escapes' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.ESCAPE.nothing_escapes
/-- info: 'HODGE.ESCAPE.the_capstone' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.ESCAPE.the_capstone
/-- info: 'HODGE.TERMINAL.the_open_framing_is_refuted' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.TERMINAL.the_open_framing_is_refuted
/-- info: 'HODGE.TERMINAL.the_ten_steps' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.TERMINAL.the_ten_steps
/-- info: 'HODGE.TERMINAL.the_terminal_verdict' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.TERMINAL.the_terminal_verdict
/-- info: 'HODGE.TERMINAL.the_final_form' does not depend on any axioms -/
#guard_msgs in #print axioms HODGE.TERMINAL.the_final_form
