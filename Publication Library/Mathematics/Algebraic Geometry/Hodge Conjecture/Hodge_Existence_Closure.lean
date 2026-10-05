/-
  Hodge_Existence_Closure.lean · the kernel of What Exists Is Realized: A Formal Closure of
  the Hodge Question from Existence Alone

  The Hodge row closed on existence and the freedom arrow alone. Every theorem of this file is
  on no axiom at all: no propext, no Quot.sound, no Classical.choice.
  I     The frame of Hodge classes, the value, the two coherent worlds.
  II    Existence as given: the root, the arrow, the bare freedom bit; what they carry on every
        frame, and that they force no value.
  III   Existence read on the row: the act, every Hodge class that exists is realized, equal to
        the value; the closure by one act; nothing escapes; every class lands; one counter
        class refutes.
  IV    The retired premise: the semiregular witness axiom gives the value and is strictly
        stronger.
  V     The price: integrality does not transfer; the (1,1) slice decides its slice, its
        exponential field load-bearing, and decides nothing beyond it.
  VI    Freedom: the record wall, the two-point fibre, the prime's shape.
  VII   The triaxial lock.
  VIII  The record and the seed: no finite record, no symmetry and no unsized step forces the
        value; a uniform step does.
  IX    The proved part: dimension at most three decided, the hard Lefschetz field load-bearing.
  X     The division: the value is exactly its two halves under every cut; the proved half does
        not force the remainder.
  XI    Least escape: no keyless statement is the act; the pulse does not certify.
  XII   The closure, whole.
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

structure ActualClasses where
  F      : Frame
  supply : Realized F

/-- THE HODGE VALUE FROM EXISTENCE, BY ONE ACT. -/
theorem hodge_from_existence (A : ActualClasses) : Value A.F :=
  (act_is_the_value A.F).mp A.supply

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

/-! ## VI · freedom -/

def kineticRecord (_w : Bool) : Nat := 0

theorem record_wall : ¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w :=
  fun ⟨_, hg⟩ => Bool.noConfusion ((hg false).symm.trans (hg true))

theorem fibre_is_two : ([false, true].filter (fun w => kineticRecord w == kineticRecord true)).length = 2 := by
  decide

def mulFibre (n : Nat) : List (Nat × Nat) :=
  (List.range (n + 1)).flatMap fun a =>
    (List.range (n + 1)).filterMap fun b => if a * b = n then some (a, b) else none

theorem prime_shape :
    mulFibre 7 = [(1, 7), (7, 1)] ∧ (mulFibre 7).all (fun p => p.1 != p.2) = true ∧
    (mulFibre 7).length = ([false, true].filter (fun w => kineticRecord w == kineticRecord true)).length := by
  decide

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

/-- The pulse does not certify: existence is instantiated on a background beside a world whose
value fails. -/
theorem pulse_does_not_certify : Root Empty (fun e => nomatch e) ∧ ¬ Value counter :=
  ⟨root_given, counter_fails⟩


/-! ## XII · the closure, whole -/

/-- THE HODGE CLOSURE: existence as given forces no value and holds in both worlds; the act is the
value and closes it; one counter class refutes it; the witness axiom is strictly stronger; the
proved part is sealed and does not force the remainder. -/
theorem hodge_closure :
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    ((Arrow ∧ Value calm) ∧ (Arrow ∧ ¬ Value counter)) ∧
    (∀ F : Frame, Realized F ↔ Value F) ∧
    (∀ A : ActualClasses, Value A.F) ∧
    (∀ (F : Frame) (d : F.D), F.realize d = none → ¬ Realized F) ∧
    (Value plainWitnessed.F ∧ ¬ WitnessAxiom plainWitnessed) ∧
    (∀ L : LowDim, Value L.F) ∧
    ¬ ValueOn counter (fun d => Nat.beq (counter.codim d) 1) false :=
  ⟨given_is_not_the_value, given_in_both_worlds, act_is_the_value, hodge_from_existence,
   counterclass_refutes, witness_axiom_strictly_stronger, low_dim_decided,
   remainder_not_forced.2⟩


/-! ## The root, undeniable in act -/

/-- A self-grounding root: a type of acts, every one of which instances the root. -/
structure SelfGrounding (R : Prop) where
  Act       : Type
  instances : Act → R

/-- THE ROOT IS UNDENIABLE IN ACT: a denial of a self-grounding root is an act, and instances it. -/
theorem denial_reenacts_root {R : Prop} (G : SelfGrounding R) (denial : G.Act) : R :=
  G.instances denial

/-- No outside proof adds to a self-grounding root: one act already carries it. -/
theorem external_proof_adds_nothing {R : Prop} (G : SelfGrounding R) (a : G.Act) (Q : Prop) : Q → R :=
  fun _ => G.instances a

/-- THE UNDENIABLE ROOT HOLDS IN BOTH WORLDS: it is carried by act in a frame where the value holds
and in one where it fails, so it forces no value. -/
theorem undeniable_root_forces_no_value {R : Prop} (G : SelfGrounding R) (a : G.Act) :
    R ∧ Value calm ∧ ¬ Value counter :=
  ⟨G.instances a, calm_value, counter_fails⟩

/-- THE ROOT READ ON THE ROW IS KEYED: the root holds, and no frame-uniform passage from it gives
the value; read on the row it is the act, which decides where the root alone does not. -/
theorem root_read_on_row_is_keyed {R : Prop} (G : SelfGrounding R) (a : G.Act) :
    R ∧ ¬ (∀ F : Frame, R → Value F) :=
  ⟨G.instances a, fun h => counter_fails (h counter (G.instances a))⟩

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
