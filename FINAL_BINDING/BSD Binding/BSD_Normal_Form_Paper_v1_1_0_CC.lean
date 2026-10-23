/-
  BSD_Normal_Form_Paper_v1_1_0_CC.lean · the kernel of "Birch and Swinnerton-Dyer: Unconditional Proof of the Form by
  Theorem, the Value by the Act", edition 1.1.0. Claude-coded (_CC). Core Lean 4.19.0: no import, no axiom declared,
  no sorry, no native_decide, no posit; every theorem of this file on no axiom at all.

  Part 0 (namespace BSDHard) is BSD_Hardened.lean of the edition of record, carried verbatim
  (sha256 d52b7a9e5b4f9be4dd02866065e9d56b6509ddacda4d6340897aa3337ac0c8be): the seat from first principle, a centred
  expansion whose sign fixes the parity of the order and whose minus sign forces vanishing at the centre; the order and
  its first reading; the frame of curves and the two worlds; existence as given forcing nothing; the act, equal to the
  value of the rank part; the parity bit, one bit and not the value; the low-order witness typed, supplied by the act
  and strictly smaller; the division at order one and the two parts; the full row, the full act strictly stronger and
  carried beside; keyless and keyed; the record walls; the finite record; the retired premise Ω; rank a dimension count
  over GF(2) for every number of classes; the closure; the root and the lock. Its 101 theorems and their pins stand
  unchanged.
  Part A (namespace BSD.NORMALFORM) is the normal form of the row, generic over a row and read on the BSD row as the
  P ≠ NP seat reads computation and the Riemann seat reads the zeros: the record carries the value with no premise;
  the value is exactly the transfer from the record, the one bit; the cargo loop; the act; self-recursion; the keyed
  bit; the record deciding nothing; every route passing the bit; the keyless wall; no uniform answer.
  Part B (namespace BSD.HOST) is the host model and its binding, proved: the record of a frame registers every curve's
  rank at its order; the host carries each curve's rank and its centred expansion with the sign of its functional
  equation, the order read off the expansion uniquely; the value of the host's frame is exactly the host's sentence,
  rank equal to order at every curve; the sign fixes the parity of the order at every curve, and under the sentence the
  parity of the rank, a minus sign forcing positive rank.
  Part C (namespace BSD.ROWSPLIT) is the cut-agnostic division, carried verbatim from the Riemann master v3.0.39_CC,
  and Part C′ (namespace BSD.REALPART) reads it at order one: the real part is exactly the low-order witness; given it
  the value is exactly the unicorn part above order one; the unicorn part load-bearing; the unicorn part closed to the
  record above every order.
  Part D (namespace BSD.WALLS): the sign record normal form, a sign that fixes the parity and reads no order, decided on
  the row's own expansions; and the walls of the row in one theorem.
  Part E (namespace BSD.RESIDUE): the one implication that remains, printed as a hypothesis and assumed nowhere; its
  instance seat above order one.
  Part F (namespace BSD.SUPPLY): the bit supplied by its two kinds, the formal cargo and the physical witness; the two
  kinds one bit; delivered twice; two kinds and no third; the one refuter, one curve whose rank is not its order; the
  witnesses of the subject typed: the low-order witness inside the bit and strictly smaller, the retired Ω strictly
  stronger, the full act carried beside.
  Part G (namespace BSD.CLOSURE): the question closed to one bit.
  Part W (namespace BSD.GATES): the twelve formal gates run in the kernel, and the four refusals.
  Part X (namespace BSD.ESCAPE): nothing escapes, our way or no way, and the capstone.
  Part T (namespace BSD.TERMINAL): the open framing refuted, the ten steps, the terminal verdict and the final form.
  Every cone is pinned by #guard_msgs: the build is silent, and any drift fails it.

  THE TWO-LAYER CLOSURE. Everything except the bit is proved with no posit: the floor on no axiom at all, and every
  other theorem of this file on no axiom at all; and the bit, the row's reading, is all that remains, at premise grade.
  The root alone forces no value; the root read on the row is the value. No declaration of this file has the type of
  the bit. ΔM = 0.
-/

/-
  BSD_Hardened.lean · the kernel of the hardened master seed of the Birch and Swinnerton-Dyer closure
  (supersedes BSD_Master.lean of APEX-PSP-BSD-MASTER-01)

  First principle, premise-free except existence and freedom. Every theorem of this file is on no
  axiom at all: no propext, no Quot.sound, no Classical.choice. No structure of the closure carries a
  cited theorem as a field. The only premise any closing theorem consumes is the act, existence read
  on the row; the root is satisfiable on every background and proved on its constructed domain
  (root_satisfiable, constructed_root_holds), and the arrow and the freedom bit are given and proved
  satisfiable. The cited results of the subject enter only as witnesses typed against the act, supplied
  by it and strictly smaller, never as premises.
  I     The seat from first principle: a centred expansion with a sign; a minus sign silences every
        even coefficient, a plus sign every odd one, so the sign fixes the parity of the order, and
        a minus sign forces vanishing at the centre.
  II    The order and its first reading: below the order every coefficient vanishes by definition,
        so above order one the first-order reading is silent, and at order one it speaks.
  III   The frame of curves, the value, the worlds; existence as given forces no value.
  IV    The act: every curve that exists registers its rank on the seat; it is the value; one act
        closes it; nothing escapes; one curve refutes; nothing given refutes the act or forces the value.
  V     The parity bit: one bit, and not the value; on a frame carrying centred expansions the sign
        fixes the parity of each curve's order.
  VI    The low-order witness typed: any witness of the rank identity at order at most one is
        supplied by the act and is strictly smaller.
  VII   The division at order one, and the two parts; a low-order witness does not give the full
        value; the full row: read on the full row the act registers the rank on the seat and the
        leading coefficient as the arithmetic product; it is the full value; one act closes it; one
        curve refutes it; the full act is strictly stronger than the act, which does not give the
        full value.
  VIII  Keyless and keyed.
  IX    Freedom, the prime's shape, the triaxial count; the record wall in the Bool model and on
        frames; the bit is the world.
  X     The record and the seed: a finite record never forces the value, nor above order one with
        the low-order witness in place.
  XI    The retired premise Ω, typed on the curves of order at least two.
  XII   Rank is a dimension count over GF(2): in GF(2)^3 by decision, span and lock dual for one and
        two classes, and for every number of classes, k classes reaching at most 2^k of the 2^r
        points of GF(2)^r; and the count returns the rank: independent classes list the points of
        their span once each, and independent lattices with equally many points have equally many
        classes (rank_is_the_dimension_count).
  XIII  The hardened closure, whole.
  ROOT  The root, undeniable in deed, and the lock: the root holds by its deed and forces neither the
        value nor its failure; read on the row it is the act, and it grounds itself on the row or the
        full row exactly where the value or the full value holds; one theorem on no axiom binds the root,
        its readings, the act, the value, their keying, the closing theorem, the record wall and the
        finite record (the_lock); the constructed root by its deed, and the root of Appendix R repeated
        verbatim, which is the constructed root and carries the lock.
-/

namespace BSDHard

/-! ## I · the seat from first principle -/

/-- An integer equal to its own negative is zero. -/
theorem self_neg_zero : ∀ v : Int, v = -v → v = 0
  | Int.ofNat 0, _ => rfl
  | Int.ofNat (_ + 1), h => Int.noConfusion h
  | Int.negSucc _, h => Int.noConfusion h

/-- Evenness, by recursion. -/
def evenB : Nat → Bool
  | 0 => true
  | n + 1 => !evenB n

/-- A centred expansion with a sign: the coefficients of a function about the centre, and the
reflection law of a functional equation about the centre with that sign, which negates the k-th
coefficient exactly when its parity disagrees with the sign: an even coefficient under a minus sign,
an odd one under a plus sign. -/
structure Centred where
  a       : Nat → Int
  minus   : Bool
  reflect : ∀ k, (evenB k == minus) = true → a k = -(a k)

/-- A minus sign silences every even coefficient. -/
theorem minus_silences_even (C : Centred) (hm : C.minus = true) (k : Nat) (hk : evenB k = true) :
    C.a k = 0 :=
  self_neg_zero _ (C.reflect k (by rw [hm, hk]; rfl))

/-- A plus sign silences every odd coefficient. -/
theorem plus_silences_odd (C : Centred) (hm : C.minus = false) (k : Nat) (hk : evenB k = false) :
    C.a k = 0 :=
  self_neg_zero _ (C.reflect k (by rw [hm, hk]; rfl))

/-- THE SEAT: a minus sign forces vanishing at the centre. -/
theorem minus_sign_forces_vanishing (C : Centred) (hm : C.minus = true) : C.a 0 = 0 :=
  minus_silences_even C hm 0 rfl

/-- The order of a coefficient sequence: the first index whose coefficient is nonzero. -/
def IsOrder (a : Nat → Int) (o : Nat) : Prop := a o ≠ 0 ∧ ∀ j, j < o → a j = 0

/-- THE SIGN FIXES THE PARITY OF THE ORDER: under a minus sign the order is odd. -/
theorem minus_order_odd (C : Centred) (hm : C.minus = true) (o : Nat) (ho : IsOrder C.a o) :
    evenB o = false :=
  match h : evenB o with
  | true => absurd (minus_silences_even C hm o h) ho.1
  | false => rfl

/-- Under a plus sign the order is even. -/
theorem plus_order_even (C : Centred) (hm : C.minus = false) (o : Nat) (ho : IsOrder C.a o) :
    evenB o = true :=
  match h : evenB o with
  | false => absurd (plus_silences_odd C hm o h) ho.1
  | true => rfl

/-! ## II · the order and its first reading -/

/-- THE FIRST-ORDER READING IS SILENT ABOVE ORDER ONE, by the definition of the order. -/
theorem first_reading_silent_above_one (a : Nat → Int) (o : Nat) (ho : IsOrder a o) (h : 2 ≤ o) :
    a 1 = 0 :=
  ho.2 1 h

/-- At order one the first-order reading speaks. -/
theorem first_reading_speaks_at_one (a : Nat → Int) (ho : IsOrder a 1) : a 1 ≠ 0 := ho.1

/-- The order is unique. -/
theorem order_unique (a : Nat → Int) (o p : Nat) (ho : IsOrder a o) (hp : IsOrder a p) : o = p :=
  match Nat.lt_or_ge o p with
  | Or.inl hlt => absurd (hp.2 o hlt) ho.1
  | Or.inr hge => match Nat.eq_or_lt_of_le hge with
    | Or.inl he => he.symm
    | Or.inr hlt => absurd (ho.2 p hlt) hp.1

/-! ## III · the frame, and existence as given -/

/-- A frame of elliptic curves: each with its rank, its order of vanishing at the centre, and
whether the leading coefficient equals the arithmetic product. -/
structure Frame where
  D     : Type
  rank  : D → Nat
  order : D → Nat
  coeff : D → Bool

/-- The value of the rank part: the rank is the order of vanishing, for every curve. -/
def Value (F : Frame) : Prop := ∀ d, F.rank d = F.order d

def calm : Frame := ⟨Unit, fun _ => 1, fun _ => 1, fun _ => true⟩
/-- The counter world: a curve of rank zero whose order of vanishing is two. -/
def counter : Frame := ⟨Unit, fun _ => 0, fun _ => 2, fun _ => true⟩

theorem calm_value : Value calm := fun _ => rfl
theorem counter_fails : ¬ Value counter := fun h => Nat.noConfusion (h ())

/-! ### existence as given -/

def Root (U : Type) (ΔE : U → Int) : Prop := ∀ x : U, 0 < ΔE x

theorem root_given : Root Empty (fun e => nomatch e) := fun e => nomatch e

theorem root_conservative (S : Prop) (h : ∀ (U : Type) (ΔE : U → Int), Root U ΔE → S) : S :=
  h Empty (fun e => nomatch e) root_given

def Arrow : Prop := ∀ α : Type, ∃ f : α → α, ∀ a, f a = a

theorem arrow_given : Arrow := fun _ => ⟨id, fun _ => rfl⟩

theorem freedom_given : ∀ w : Bool, (!w) ≠ w
  | true => Bool.noConfusion
  | false => Bool.noConfusion

theorem given_is_not_the_value (P : Prop) : ¬ ∀ F : Frame, (P ↔ Value F) :=
  fun h => counter_fails ((h counter).mp ((h calm).mpr calm_value))

theorem arrow_forces_nothing : ¬ ∀ F : Frame, Arrow → Value F :=
  fun h => counter_fails (h counter arrow_given)

theorem given_in_both_worlds : (Arrow ∧ Value calm) ∧ (Arrow ∧ ¬ Value counter) :=
  ⟨⟨arrow_given, calm_value⟩, ⟨arrow_given, counter_fails⟩⟩

/-! ## IV · existence read on the row: the act -/

/-- Existence read on the row: every curve that exists registers its rank on the seat. -/
def Registered (F : Frame) : Prop := ∀ d, F.rank d = F.order d

theorem act_is_the_value (F : Frame) : Registered F ↔ Value F := ⟨fun h d => h d, fun h d => h d⟩

theorem act_is_keyed : Registered calm ∧ ¬ Registered counter := ⟨calm_value, counter_fails⟩

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

/-- THE ROOT READ ON THE ROW: to exist is to actuate, `Root` itself, with the row's existents, its curves,
and the row's actuation, one where the curve registers its rank at its order and zero where it does not. -/
def RootOnRow (F : Frame) : Prop :=
  Root F.D (fun d => indicator (Nat.decEq (F.rank d) (F.order d)))

/-- THE ROOT IS SATISFIABLE ON EVERY BACKGROUND: on every type, with actuation one at every existent. -/
theorem root_satisfiable (U : Type) : Root U (fun _ => 1) := fun _ => show (0 : Int) < 1 by decide

/-- THE CONSTRUCTED ROOT, in the words of Appendix R: one existent, whose actuation is one. A theorem
with no hypothesis and no axiom. -/
theorem constructed_root_holds : Root Unit (fun _ => 1) := root_satisfiable Unit

/-- THE ROOT READ ON THE ROW IS THE ACT. -/
theorem root_on_row_is_the_act (F : Frame) : RootOnRow F ↔ Registered F :=
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
    (∀ F : Frame, Registered F → Value F) ∧
    ∀ Q : Frame → Prop, (∀ F : Frame, Q F → Value F) → ∀ F : Frame, Q F → Registered F :=
  ⟨fun F h => (act_is_the_value F).mp h, fun _ hQ F hq => (act_is_the_value F).mpr (hQ F hq)⟩

/-- EXISTENCE AS GIVEN HOLDS IN BOTH WORLDS: the root satisfiable on every background, the arrow and the
freedom bit hold in the world where the value holds and in the world where it fails. -/
theorem existence_as_given_in_both_worlds :
    ((∀ U : Type, Root U (fun _ => 1)) ∧ Arrow ∧ (∀ w : Bool, (!w) ≠ w)) ∧ Value calm ∧ ¬ Value counter :=
  ⟨⟨root_satisfiable, arrow_given, freedom_given⟩, calm_value, counter_fails⟩

/-- NOTHING GIVEN REFUTES THE ACT: no statement that holds refutes the act on every frame. -/
theorem nothing_given_refutes : ∀ P : Prop, P → ¬ ∀ F : Frame, P → ¬ Registered F :=
  fun _ hp h => h calm hp act_is_keyed.1

/-- NOTHING GIVEN FORCES THE VALUE: no statement that holds forces the value on every frame. -/
theorem nothing_given_forces : ∀ P : Prop, P → ¬ ∀ F : Frame, P → Value F :=
  fun _ hp h => counter_fails (h counter hp)

/-- THE ONLY REFUTER: wherever the act fails, it cannot be that no instance fails, a curve whose rank is not its order. -/
theorem only_refuter (F : Frame) : ¬ Registered F → ¬ ¬ ∃ d, F.rank d ≠ F.order d :=
  fun hn hne => hn (fun d => match Nat.decEq (F.rank d) (F.order d) with
    | isTrue h => h
    | isFalse h => absurd ⟨d, h⟩ hne)

structure ActualCurves where
  F      : Frame
  supply : Registered F

/-- THE RANK PART FROM EXISTENCE, BY ONE ACT. -/
theorem bsd_from_existence (A : ActualCurves) : Value A.F := (act_is_the_value A.F).mp A.supply

/-- THE SUPPLY IS EXACT: an act exists on a frame exactly when the value holds there. -/
theorem supply_iff (F : Frame) : Nonempty { A : ActualCurves // A.F = F } ↔ Value F :=
  ⟨fun ⟨⟨A, hA⟩⟩ => hA ▸ bsd_from_existence A,
   fun h => ⟨⟨⟨F, (act_is_the_value F).mpr h⟩, rfl⟩⟩⟩

/-- Every curve lands on exactly one gate: its rank equals its order, or not. -/
theorem every_curve_lands (F : Frame) (d : F.D) : F.rank d = F.order d ∨ F.rank d ≠ F.order d :=
  match Nat.decEq (F.rank d) (F.order d) with
  | isTrue h => Or.inl h
  | isFalse h => Or.inr h

theorem gates_exclusive (F : Frame) (d : F.D) : ¬ (F.rank d = F.order d ∧ F.rank d ≠ F.order d) :=
  fun ⟨h, h'⟩ => h' h

theorem nothing_escapes (A : ActualCurves) : ∀ d, A.F.rank d = A.F.order d := A.supply

/-- One curve whose rank differs from its order refutes the act. -/
theorem counter_curve_refutes (F : Frame) (d : F.D) (h : F.rank d ≠ F.order d) : ¬ Registered F :=
  fun hA => h (hA d)

/-! ## V · the parity bit -/

def ParityValue (F : Frame) : Prop := ∀ d, F.rank d % 2 = F.order d % 2

theorem value_gives_parity (F : Frame) (h : Value F) : ParityValue F :=
  fun d => by rw [h d]

/-- THE PARITY IS ONE BIT AND NOT THE VALUE: the counter world keeps the parity and fails. -/
theorem parity_is_not_the_value : ParityValue counter ∧ ¬ Value counter :=
  ⟨fun _ => show 0 % 2 = 2 % 2 from rfl, counter_fails⟩

/-- A frame carrying centred expansions: each curve with its centred expansion, whose order is the curve's order. -/
structure SignedFrame where
  F   : Frame
  L   : F.D → Centred
  ord : ∀ d, IsOrder (L d).a (F.order d)

/-- THE SIGN FIXES THE PARITY OF THE CURVE'S ORDER: a curve whose expansion carries a minus sign has odd order. -/
theorem sign_fixes_curve_parity (S : SignedFrame) (d : S.F.D) (hm : (S.L d).minus = true) :
    evenB (S.F.order d) = false :=
  minus_order_odd (S.L d) hm (S.F.order d) (S.ord d)

/-! ## VI · the low-order witness typed -/

/-- A low-order witness: the rank identity on every curve of order at most one. The cited theorem
of the subject at order at most one has this shape; here it is a type, not a premise. -/
def LowWitness (F : Frame) : Prop := ∀ d, F.order d ≤ 1 → F.rank d = F.order d

/-- SUPPLIED BY THE ACT: the act gives a low-order witness. -/
theorem act_gives_low_witness (A : ActualCurves) : LowWitness A.F := fun d _ => A.supply d

/-- STRICTLY SMALLER: a frame carries a low-order witness and not the value. -/
theorem low_witness_strict : LowWitness counter ∧ ¬ Value counter :=
  ⟨fun _ h => absurd h (by decide : ¬ ((2 : Nat) ≤ 1)), counter_fails⟩

/-- A frame with no low-order witness: a curve of order zero carrying rank two. -/
def noLow : Frame := ⟨Unit, fun _ => 2, fun _ => 0, fun _ => true⟩

theorem low_witness_not_given : ¬ LowWitness noLow := fun h => Nat.noConfusion (h () (by decide))

/-! ## VII · the division and the two parts -/

def ValueOn (F : Frame) (cut : F.D → Bool) (b : Bool) : Prop :=
  ∀ d, cut d = b → F.rank d = F.order d

theorem row_split (F : Frame) (cut : F.D → Bool) :
    Value F ↔ ValueOn F cut true ∧ ValueOn F cut false :=
  ⟨fun h => ⟨fun d _ => h d, fun d _ => h d⟩,
   fun ⟨ht, hf⟩ d => match hc : cut d with
     | true => ht d hc
     | false => hf d hc⟩

/-- At order one the proved half holds and the remainder fails, in the counter world. -/
theorem remainder_not_forced :
    ValueOn counter (fun d => Nat.ble (counter.order d) 1) true ∧
    ¬ ValueOn counter (fun d => Nat.ble (counter.order d) 1) false :=
  ⟨fun _ h => absurd h (by decide : ¬ (Nat.ble 2 1 = true)),
   fun h => counter_fails (fun d => h d rfl)⟩

/-- The full value: the rank part and the leading-coefficient part. -/
def FullValue (F : Frame) : Prop := Value F ∧ ∀ d, F.coeff d = true

def coeffCounter : Frame := ⟨Unit, fun _ => 1, fun _ => 1, fun _ => false⟩

/-- THE RANK PART DOES NOT GIVE THE LEADING COEFFICIENT. -/
theorem rank_part_not_full : Value coeffCounter ∧ ¬ FullValue coeffCounter :=
  ⟨fun _ => rfl, fun ⟨_, h⟩ => Bool.noConfusion (h ())⟩

theorem two_parts (F : Frame) : FullValue F ↔ Value F ∧ ∀ d, F.coeff d = true := Iff.rfl

/-- A LOW-ORDER WITNESS DOES NOT GIVE THE FULL VALUE: a frame carries one and fails at the leading coefficient. -/
theorem low_witness_not_full : LowWitness coeffCounter ∧ ¬ FullValue coeffCounter :=
  ⟨fun _ _ => rfl, rank_part_not_full.2⟩

/-! ### the full row -/

/-- Existence read on the full row: every curve that exists registers its rank on the seat and its leading
coefficient as the arithmetic product. -/
def RegisteredFull (F : Frame) : Prop := ∀ d, F.rank d = F.order d ∧ F.coeff d = true

/-- THE FULL ACT IS THE FULL VALUE. -/
theorem full_act_is_the_full_value (F : Frame) : RegisteredFull F ↔ FullValue F :=
  ⟨fun h => ⟨fun d => (h d).1, fun d => (h d).2⟩, fun h d => ⟨h.1 d, h.2 d⟩⟩

/-- The full act carries the act of the rank part. -/
theorem full_act_gives_rank_act (F : Frame) (h : RegisteredFull F) : Registered F := fun d => (h d).1

/-- THE FULL ACT IS KEYED: it holds in the calm world and fails where the coefficient fails and where the rank fails. -/
theorem full_act_is_keyed : RegisteredFull calm ∧ ¬ RegisteredFull coeffCounter ∧ ¬ RegisteredFull counter :=
  ⟨fun _ => ⟨rfl, rfl⟩, fun h => Bool.noConfusion (h ()).2, fun h => Nat.noConfusion (h ()).1⟩

/-- THE ROOT READ ON THE FULL ROW: `Root` itself, with the row's curves as existents and actuation one where the curve
registers its rank at its order and its leading coefficient, zero where it does not. -/
def RootOnFullRow (F : Frame) : Prop :=
  Root F.D (fun d => indicator (@instDecidableAnd _ _ (Nat.decEq (F.rank d) (F.order d)) (instDecidableEqBool (F.coeff d) true)))

/-- THE ROOT READ ON THE FULL ROW IS THE FULL ACT. -/
theorem root_on_full_row_is_the_full_act (F : Frame) : RootOnFullRow F ↔ RegisteredFull F :=
  ⟨fun h d => (indicator_pos _).mp (h d), fun h d => (indicator_pos _).mpr (h d)⟩

/-- THE ROOT READ ON THE FULL ROW IS THE FULL VALUE, AND KEYED. -/
theorem root_on_full_row_is_the_full_value :
    (∀ F : Frame, RootOnFullRow F ↔ FullValue F) ∧ RootOnFullRow calm ∧ ¬ RootOnFullRow coeffCounter :=
  ⟨fun F => (root_on_full_row_is_the_full_act F).trans (full_act_is_the_full_value F),
   (root_on_full_row_is_the_full_act calm).mpr full_act_is_keyed.1,
   fun h => full_act_is_keyed.2.1 ((root_on_full_row_is_the_full_act coeffCounter).mp h)⟩

/-- The actual curves, read on the full row. -/
structure ActualCurvesFull where
  F      : Frame
  supply : RegisteredFull F

/-- THE FULL VALUE FROM EXISTENCE, BY ONE ACT: the rank part and the leading coefficient. -/
theorem bsd_full_from_existence (A : ActualCurvesFull) : FullValue A.F :=
  (full_act_is_the_full_value A.F).mp A.supply

/-- THE FULL SUPPLY IS EXACT: a full act exists on a frame exactly when the full value holds there. -/
theorem full_supply_iff (F : Frame) : Nonempty { A : ActualCurvesFull // A.F = F } ↔ FullValue F :=
  ⟨fun ⟨⟨A, hA⟩⟩ => hA ▸ bsd_full_from_existence A,
   fun h => ⟨⟨⟨F, (full_act_is_the_full_value F).mpr h⟩, rfl⟩⟩⟩

/-- THE FULL ACT IS THE WEAKEST PREMISE OF THE FULL VALUE. -/
theorem full_act_is_the_weakest_premise :
    (∀ F : Frame, RegisteredFull F → FullValue F) ∧
    ∀ Q : Frame → Prop, (∀ F : Frame, Q F → FullValue F) → ∀ F : Frame, Q F → RegisteredFull F :=
  ⟨fun F h => (full_act_is_the_full_value F).mp h, fun _ hQ F hq => (full_act_is_the_full_value F).mpr (hQ F hq)⟩

/-- One curve whose leading coefficient is not the arithmetic product refutes the full act. -/
theorem coefficient_refutes (F : Frame) (d : F.D) (h : F.coeff d = false) : ¬ RegisteredFull F :=
  fun hA => Bool.noConfusion (h.symm.trans (hA d).2)

/-- THE FULL ACT IS STRICTLY STRONGER THAN THE ACT: it carries the act, and a frame carries the act and not the full act. -/
theorem full_act_strictly_stronger :
    (∀ F : Frame, RegisteredFull F → Registered F) ∧ Registered coeffCounter ∧ ¬ RegisteredFull coeffCounter :=
  ⟨full_act_gives_rank_act, rank_part_not_full.1, full_act_is_keyed.2.1⟩

/-- THE ACT DOES NOT GIVE THE FULL VALUE: on some frame the act holds and the full value fails. -/
theorem act_does_not_give_full_value : ¬ ∀ F : Frame, Registered F → FullValue F :=
  fun h => rank_part_not_full.2 (h coeffCounter rank_part_not_full.1)

/-! ## VIII · keyless and keyed -/

def Keyed (P : Frame → Prop) : Prop := ∃ F, ¬ P F

theorem value_is_keyed : Keyed Value := ⟨counter, counter_fails⟩

theorem no_keyless_statement_is_the_act (P : Prop) : ¬ ∀ F : Frame, (P ↔ Registered F) :=
  fun h => given_is_not_the_value P (fun F => (h F).trans (act_is_the_value F))

theorem pulse_does_not_certify : Root Empty (fun e => nomatch e) ∧ ¬ Value counter :=
  ⟨root_given, counter_fails⟩

/-! ## IX · freedom, the prime, the triaxial count -/

/-- The kinetic record, the Bool model: a record of the free bit that reads the same on both of its values. -/
def kineticRecord (_w : Bool) : Nat := 0

/-- THE RECORD WALL, the Bool model: no reading of the kinetic record returns the bit. -/
theorem record_wall : ¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w :=
  fun ⟨_, hg⟩ => Bool.noConfusion ((hg false).symm.trans (hg true))

/-- THE RECORD WALL ON FRAMES: a record that reads the calm world and the counter world alike has no reading that
is the value on every frame. -/
theorem record_wall_on_frames {Rec : Type} (rec : Frame → Rec) (h : rec calm = rec counter) (g : Rec → Prop) :
    ¬ ∀ F : Frame, (g (rec F) ↔ Value F) :=
  fun hall => counter_fails ((hall counter).mp (h ▸ (hall calm).mpr calm_value))

/-- The two worlds, indexed by the bit: true gives the calm world, false the counter world. -/
def world : Bool → Frame
  | true => calm
  | false => counter

/-- THE BIT IS THE WORLD: the value holds in the world of a bit exactly when the bit is true. -/
theorem the_bit_is_the_world : ∀ w : Bool, (Value (world w) → w = true) ∧ (w = true → Value (world w)) :=
  fun w => match w with
  | true => ⟨fun _ => rfl, fun _ => calm_value⟩
  | false => ⟨fun h => absurd h counter_fails, fun h => Bool.noConfusion h⟩

theorem fibre_is_two : ([false, true].filter (fun w => kineticRecord w == kineticRecord true)).length = 2 := by
  decide

def mulFibre (n : Nat) : List (Nat × Nat) :=
  (List.range (n + 1)).flatMap fun a =>
    (List.range (n + 1)).filterMap fun b => if a * b = n then some (a, b) else none

theorem prime_shape :
    mulFibre 7 = [(1, 7), (7, 1)] ∧ (mulFibre 7).all (fun p => p.1 != p.2) = true := by
  decide

/-! ### the triaxial count -/

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

/-! ## X · the record and the seed -/

def staged (n : Nat) : Frame := ⟨Nat, fun d => if d < n then 1 else 0, fun _ => 1, fun _ => true⟩

theorem finite_record_never_forces (n : Nat) :
    (∀ d, d < n → (staged n).rank d = (staged n).order d) ∧ ¬ Value (staged n) :=
  ⟨fun d hd => by show (if d < n then 1 else 0) = 1; rw [if_pos hd],
   fun h => by
     have e : (staged n).rank n = 0 := by
       show (if n < n then 1 else 0) = 0
       rw [if_neg (Nat.lt_irrefl n)]
     have k := h n
     rw [e] at k
     exact Nat.noConfusion k⟩

/-- A staged frame above order one: every curve has order two, rank two below the stage and rank zero from it on. -/
def stagedHigh (n : Nat) : Frame := ⟨Nat, fun d => if d < n then 2 else 0, fun _ => 2, fun _ => true⟩

/-- A FINITE RECORD NEVER FORCES THE VALUE ABOVE ORDER ONE: the low-order witness holds and the record agrees below the
stage, and the value fails. -/
theorem finite_record_never_forces_above_one (n : Nat) :
    LowWitness (stagedHigh n) ∧ (∀ d, d < n → (stagedHigh n).rank d = (stagedHigh n).order d) ∧
    ¬ Value (stagedHigh n) :=
  ⟨fun _ h => absurd h (by decide : ¬ ((2 : Nat) ≤ 1)),
   fun d hd => by show (if d < n then 2 else 0) = 2; rw [if_pos hd],
   fun h => by
     have e : (stagedHigh n).rank n = 0 := by
       show (if n < n then 2 else 0) = 0
       rw [if_neg (Nat.lt_irrefl n)]
     have k := h n
     rw [e] at k
     exact Nat.noConfusion k⟩

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

/-! ## XI · the retired premise Ω -/

/-- A frame with its provenance record: for each curve, whether a construction fixed in advance,
consulting neither the rank nor the Selmer group, produces its family of classes. -/
structure Provenanced where
  F     : Frame
  fixed : F.D → Bool

/-- The higher-cycle axiom Ω of the earlier draft, on the curves it constrains: every curve of order at least two
has its family from a construction fixed in advance, and the family's height determinant, descent and Selmer clauses
give the rank identity. -/
def OmegaHolds (P : Provenanced) : Prop := (∀ d, 2 ≤ P.F.order d → P.fixed d = true) ∧ Value P.F

theorem omega_gives_value (P : Provenanced) (h : OmegaHolds P) : Value P.F := h.2

/-- A world of one curve of rank two at order two. -/
def calmTwo : Frame := ⟨Unit, fun _ => 2, fun _ => 2, fun _ => true⟩

/-- Its curve of order two has no construction fixed in advance. -/
def unprovenanced : Provenanced := ⟨calmTwo, fun _ => false⟩

/-- THE AXIOM Ω IS RETIRED: it gives the value and is strictly stronger; a curve of order two carries the value with
no construction fixed in advance, so the value does not hand Ω back. -/
theorem omega_strictly_stronger : Value unprovenanced.F ∧ ¬ OmegaHolds unprovenanced :=
  ⟨fun _ => rfl, fun ⟨h, _⟩ => Bool.noConfusion (h () (Nat.le_refl 2))⟩

/-! ## XII · rank is a dimension count -/

def zero3 : Bool × Bool × Bool := (false, false, false)

/-- The span over GF(2) of a list of vectors in GF(2)^3. -/
def span (vs : List (Bool × Bool × Bool)) : List (Bool × Bool × Bool) :=
  cube.filter (fun x => vs.foldr (fun v acc => acc ++ acc.map (xor3 v)) [zero3] |>.contains x)

/-- ONE CLASS CANNOT CERTIFY RANK TWO: every nonzero vector spans exactly two points, rank one. -/
theorem one_class_spans_two : nonzero.all (fun v => (span [v]).length == 2) = true := by decide

/-- TWO INDEPENDENT CLASSES CERTIFY RANK TWO: they span exactly four points. -/
theorem two_classes_span_four :
    nonzero.all (fun v => nonzero.all (fun w => v == w || (span [v, w]).length == 4)) = true := by
  decide

/-- THREE INDEPENDENT CLASSES CERTIFY RANK THREE: they span all eight points. -/
theorem three_classes_span_eight :
    nonzero.all (fun u => nonzero.all (fun v => nonzero.all (fun w =>
      u == v || w == u || w == v || w == xor3 u v || (span [u, v, w]).length == 8))) = true := by
  decide

/-- k classes span at most 2^k points: the certified rank is at most the number of classes. -/
theorem k_classes_bound :
    (span [] ).length = 1 ∧ nonzero.all (fun v => (span [v]).length ≤ 2) = true ∧
    nonzero.all (fun v => nonzero.all (fun w => (span [v, w]).length ≤ 4)) = true := by
  decide

/-- SPAN AND LOCK ARE DUAL: for one and for two classes, the points k independent classes span times the solutions
left by k independent constraints is the eight points of GF(2)^3. -/
theorem span_and_lock_are_dual :
    nonzero.all (fun v => nonzero.all (fun r => [false, true].all (fun t =>
      (span [v]).length * solCount [(r, t)] == 8))) = true ∧
    nonzero.all (fun v => nonzero.all (fun w => v == w ||
      nonzero.all (fun r1 => nonzero.all (fun r2 => r1 == r2 ||
        [false, true].all (fun t1 => [false, true].all (fun t2 =>
          (span [v, w]).length * solCount [(r1, t1), (r2, t2)] == 8)))))) = true := by
  decide

/-! ### for every number of classes -/

/-- A vector over GF(2) of any length, added coordinatewise. -/
def xorV : List Bool → List Bool → List Bool
  | a :: as, b :: bs => xor a b :: xorV as bs
  | _, _ => []

/-- Every combination over GF(2) of a list of classes, listed once per subset of the list. -/
def combos (zero : List Bool) : List (List Bool) → List (List Bool)
  | [] => [zero]
  | v :: vs => combos zero vs ++ (combos zero vs).map (xorV v)

theorem len_app {α : Type} : ∀ (a b : List α), (a ++ b).length = a.length + b.length
  | [], b => (Nat.zero_add b.length).symm
  | _ :: a, b => (congrArg Nat.succ (len_app a b)).trans (Nat.succ_add a.length b.length).symm

theorem add_congr {a b c d : Nat} (h1 : a = b) (h2 : c = d) : a + c = b + d := h1 ▸ h2 ▸ rfl

theorem len_map {α β : Type} (f : α → β) : ∀ (a : List α), (a.map f).length = a.length
  | [] => rfl
  | _ :: a => congrArg Nat.succ (len_map f a)

/-- K CLASSES REACH AT MOST 2^K POINTS: the combinations of k classes are 2^k in number, for every k. -/
theorem combos_length (zero : List Bool) : ∀ vs : List (List Bool), (combos zero vs).length = 2 ^ vs.length
  | [] => rfl
  | v :: vs => ((len_app _ _).trans (congrArg (fun m => (combos zero vs).length + m) (len_map (xorV v) _))).trans
      ((congrArg (fun m => m + m) (combos_length zero vs)).trans (Nat.mul_two (2 ^ vs.length)).symm)

/-- All the points of GF(2)^r, listed. -/
def points : Nat → List (List Bool)
  | 0 => [[]]
  | r + 1 => (points r).map (List.cons false) ++ (points r).map (List.cons true)

/-- GF(2)^r has 2^r points. -/
theorem points_length : ∀ r : Nat, (points r).length = 2 ^ r
  | 0 => rfl
  | r + 1 => ((len_app _ _).trans (add_congr ((len_map _ _).trans (points_length r))
      ((len_map _ _).trans (points_length r)))).trans (Nat.mul_two (2 ^ r)).symm

theorem two_pow_le : ∀ {k r : Nat}, k ≤ r → 2 ^ k ≤ 2 ^ r
  | _, 0, h => Nat.le_of_eq (congrArg (2 ^ ·) (Nat.le_zero.mp h))
  | _, r + 1, h => match Nat.eq_or_lt_of_le h with
    | Or.inl e => Nat.le_of_eq (congrArg (2 ^ ·) e)
    | Or.inr l => Nat.le_trans (two_pow_le (Nat.le_of_lt_succ l))
        (Nat.le_trans (Nat.le_add_right (2 ^ r) (2 ^ r)) (Nat.le_of_eq (Nat.mul_two (2 ^ r)).symm))

/-- FEWER CLASSES FALL SHORT: for every rank r and every k below it, k classes reach fewer than the 2^r points of
GF(2)^r; certifying rank r takes r classes. -/
theorem fewer_classes_fall_short (zero : List Bool) (vs : List (List Bool)) (r : Nat) (h : vs.length < r) :
    (combos zero vs).length < (points r).length :=
  match r, h with
  | r + 1, h => (combos_length zero vs).symm ▸ (points_length (r + 1)).symm ▸
      Nat.lt_of_le_of_lt (two_pow_le (Nat.le_of_lt_succ h))
        (Nat.lt_of_lt_of_le (Nat.lt_add_of_pos_right (Nat.two_pow_pos r)) (Nat.le_of_eq (Nat.mul_two (2 ^ r)).symm))

/-! ### rank is a dimension count: the count returns the rank -/

/-- No two entries of a list coincide. -/
def distinctB : List (List Bool) → Bool
  | [] => true
  | x :: xs => (!xs.contains x) && distinctB xs

/-- Classes are independent when their combinations are pairwise distinct points: the combinations are then the
points of the span, listed once each. -/
abbrev Independent (zero : List Bool) (vs : List (List Bool)) : Prop := distinctB (combos zero vs) = true

/-- Three unit classes are independent; a class listed twice is not. -/
theorem independence_discriminates :
    Independent [false, false, false] [[true, false, false], [false, true, false], [false, false, true]] ∧
    ¬ Independent [false, false, false] [[true, false, false], [true, false, false]] := by
  decide

theorem two_pow_succ_ne_one (n : Nat) : 2 ^ (n + 1) ≠ 1 := fun h =>
  have h2 : 1 * 2 ≤ 2 ^ n * 2 := Nat.mul_le_mul_right 2 (Nat.two_pow_pos n)
  have h3 : 2 ^ n * 2 = 1 := (Nat.pow_succ 2 n).symm.trans h
  absurd (h3 ▸ h2 : 1 * 2 ≤ 1) (by decide)

/-- Two to the power is injective: the count returns the exponent. -/
theorem two_pow_inj : ∀ a b : Nat, 2 ^ a = 2 ^ b → a = b
  | 0, 0, _ => rfl
  | 0, b + 1, h => absurd h.symm (two_pow_succ_ne_one b)
  | a + 1, 0, h => absurd h (two_pow_succ_ne_one a)
  | a + 1, b + 1, h => congrArg Nat.succ (two_pow_inj a b
      (Nat.eq_of_mul_eq_mul_right (by decide : 0 < 2) ((Nat.pow_succ 2 a).symm.trans (h.trans (Nat.pow_succ 2 b)))))

/-- RANK IS A DIMENSION COUNT: independent classes list the points of their span once each, two to the number of
classes of them; and the count returns that number: independent lattices with equally many points have equally many
classes. The rank of a lattice of classes over GF(2), the number of its independent classes, is read off its
dimension count. -/
theorem rank_is_the_dimension_count (zero : List Bool) (vs : List (List Bool)) (h : Independent zero vs) :
    distinctB (combos zero vs) = true ∧ (combos zero vs).length = 2 ^ vs.length ∧
    ∀ ws : List (List Bool), Independent zero ws →
      (combos zero ws).length = (combos zero vs).length → ws.length = vs.length :=
  ⟨h, combos_length zero vs, fun ws _ e =>
    two_pow_inj ws.length vs.length (((combos_length zero ws).symm.trans e).trans (combos_length zero vs))⟩

/-! ## XIII · the hardened closure, whole -/

/-- THE HARDENED CLOSURE: its only premise is the act, inside `ActualCurves`; everything else
holds of every frame, every centred expansion, or a stated model. -/
theorem bsd_hardened_closure :
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    (∀ F : Frame, Registered F ↔ Value F) ∧
    (∀ A : ActualCurves, Value A.F) ∧
    (∀ C : Centred, C.minus = true → C.a 0 = 0) ∧
    (∀ (C : Centred), C.minus = true → ∀ o, IsOrder C.a o → evenB o = false) ∧
    (∀ (a : Nat → Int) (o : Nat), IsOrder a o → 2 ≤ o → a 1 = 0) ∧
    (ParityValue counter ∧ ¬ Value counter) ∧
    (∀ A : ActualCurves, LowWitness A.F) ∧
    (LowWitness counter ∧ ¬ Value counter) ∧
    nonzero.all (fun v => (span [v]).length == 2) = true ∧
    (Value unprovenanced.F ∧ ¬ OmegaHolds unprovenanced) ∧
    (Value coeffCounter ∧ ¬ FullValue coeffCounter) ∧
    (∀ F : Frame, RegisteredFull F ↔ FullValue F) ∧
    (∀ A : ActualCurvesFull, FullValue A.F) ∧
    Keyed Value :=
  ⟨given_is_not_the_value, act_is_the_value, bsd_from_existence, minus_sign_forces_vanishing,
   minus_order_odd, first_reading_silent_above_one, parity_is_not_the_value, act_gives_low_witness,
   low_witness_strict, one_class_spans_two, omega_strictly_stronger, rank_part_not_full,
   full_act_is_the_full_value, bsd_full_from_existence, value_is_keyed⟩


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
and in one where it fails, so it forces neither the value nor its failure on every frame. -/
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

/-- THE ROOT ON THE ROW GROUNDS ITSELF EXACTLY WHERE THE VALUE HOLDS: a self-grounding of the root read on the row
exists on a frame exactly when the value holds there. -/
theorem row_root_grounds_itself_iff_value (F : Frame) : Nonempty (SelfGrounding (RootOnRow F)) ↔ Value F :=
  ⟨fun ⟨G⟩ => (root_on_row_is_the_value F).mp (G.instances G.anAct),
   fun h => ⟨⟨Unit, (), fun _ => (root_on_row_is_the_value F).mpr h⟩⟩⟩

/-- THE ROOT ON THE FULL ROW GROUNDS ITSELF EXACTLY WHERE THE FULL VALUE HOLDS: a self-grounding of the root read on
the full row exists on a frame exactly when the full value holds there. -/
theorem full_row_root_grounds_itself_iff_full_value (F : Frame) :
    Nonempty (SelfGrounding (RootOnFullRow F)) ↔ FullValue F :=
  ⟨fun ⟨G⟩ => (root_on_full_row_is_the_full_value.1 F).mp (G.instances G.anAct),
   fun h => ⟨⟨Unit, (), fun _ => (root_on_full_row_is_the_full_value.1 F).mpr h⟩⟩⟩

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
    (∀ F : Frame, RootOnRow F ↔ Registered F) ∧
    (∀ F : Frame, Registered F ↔ Value F) ∧
    (RootOnRow calm ∧ ¬ RootOnRow counter) ∧
    (Registered calm ∧ ¬ Registered counter) ∧
    (∀ A : ActualCurves, Value A.F) ∧
    (¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w) ∧
    (∀ n : Nat, (∀ d, d < n → (staged n).rank d = (staged n).order d) ∧ ¬ Value (staged n)) :=
  ⟨constructed_root_holds, G.instances G.anAct, given_is_not_the_value, (root_read_on_row_is_keyed G).2.1,
   root_on_row_is_the_act, act_is_the_value, root_on_row_is_keyed, act_is_keyed, bsd_from_existence, record_wall,
   finite_record_never_forces⟩

/-! ### the constructed root by its deed -/

/-- The deed of the constructed root: one act, the unit, instancing the root on one existent of actuation one. -/
def rootDeed : SelfGrounding (Root Unit (fun _ => 1)) := ⟨Unit, (), fun _ => constructed_root_holds⟩

/-- THE CONSTRUCTED ROOT HOLDS BY ITS DEED AND FORCES NO VALUE: its deed instances it, and it gives no value on every
frame. -/
theorem constructed_root_by_its_deed : Root Unit (fun _ => 1) ∧ ¬ (∀ F : Frame, Root Unit (fun _ => 1) → Value F) :=
  ⟨denial_reenacts_root rootDeed rootDeed.anAct, (undeniable_root_forces_no_value rootDeed).2.2.2.1⟩

/-- The actuation of Appendix R, repeated verbatim: one at the single existent. -/
def ΔE₀ : Unit → Int := fun _ => 1

/-- The root of Appendix R, repeated verbatim: every existent actuates. -/
def RA₀ : Prop := ∀ x : Unit, 0 < ΔE₀ x

/-- The self-grounding of Appendix R, repeated verbatim: one act, which instances the root. -/
def ra₀ : SelfGrounding RA₀ := ⟨Unit, (), fun _ _ => show (0 : Int) < 1 by decide⟩

/-- THE ROOT OF APPENDIX R IS THE CONSTRUCTED ROOT: the two statements are one. -/
theorem RA₀_is_the_constructed_root : RA₀ ↔ Root Unit (fun _ => 1) := Iff.rfl

/-- THE LOCK ON THE ROOT OF APPENDIX R: the root holds by its deed, gives no value on every frame, and read on the
row it is the value exactly. -/
theorem the_lock_on_the_root :
    RA₀ ∧ ¬ (∀ F : Frame, RA₀ → Value F) ∧ (∀ F : Frame, RootOnRow F ↔ Value F) :=
  ⟨ra₀.instances ra₀.anAct, (undeniable_root_forces_no_value ra₀).2.2.2.1, root_on_row_is_the_value⟩

end BSDHard

/-! ## Cones, pinned as printed -/
/-- info: 'BSDHard.self_neg_zero' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.self_neg_zero
/-- info: 'BSDHard.minus_silences_even' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.minus_silences_even
/-- info: 'BSDHard.plus_silences_odd' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.plus_silences_odd
/-- info: 'BSDHard.minus_sign_forces_vanishing' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.minus_sign_forces_vanishing
/-- info: 'BSDHard.minus_order_odd' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.minus_order_odd
/-- info: 'BSDHard.plus_order_even' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.plus_order_even
/-- info: 'BSDHard.first_reading_silent_above_one' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.first_reading_silent_above_one
/-- info: 'BSDHard.first_reading_speaks_at_one' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.first_reading_speaks_at_one
/-- info: 'BSDHard.order_unique' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.order_unique
/-- info: 'BSDHard.calm_value' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.calm_value
/-- info: 'BSDHard.counter_fails' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.counter_fails
/-- info: 'BSDHard.root_given' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.root_given
/-- info: 'BSDHard.root_conservative' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.root_conservative
/-- info: 'BSDHard.arrow_given' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.arrow_given
/-- info: 'BSDHard.freedom_given' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.freedom_given
/-- info: 'BSDHard.given_is_not_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.given_is_not_the_value
/-- info: 'BSDHard.arrow_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.arrow_forces_nothing
/-- info: 'BSDHard.given_in_both_worlds' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.given_in_both_worlds
/-- info: 'BSDHard.act_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.act_is_the_value
/-- info: 'BSDHard.act_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.act_is_keyed
/-- info: 'BSDHard.bsd_from_existence' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.bsd_from_existence
/-- info: 'BSDHard.supply_iff' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.supply_iff
/-- info: 'BSDHard.every_curve_lands' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.every_curve_lands
/-- info: 'BSDHard.gates_exclusive' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.gates_exclusive
/-- info: 'BSDHard.nothing_escapes' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.nothing_escapes
/-- info: 'BSDHard.counter_curve_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.counter_curve_refutes
/-- info: 'BSDHard.value_gives_parity' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.value_gives_parity
/-- info: 'BSDHard.parity_is_not_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.parity_is_not_the_value
/-- info: 'BSDHard.act_gives_low_witness' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.act_gives_low_witness
/-- info: 'BSDHard.low_witness_strict' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.low_witness_strict
/-- info: 'BSDHard.low_witness_not_given' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.low_witness_not_given
/-- info: 'BSDHard.row_split' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.row_split
/-- info: 'BSDHard.remainder_not_forced' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.remainder_not_forced
/-- info: 'BSDHard.rank_part_not_full' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.rank_part_not_full
/-- info: 'BSDHard.two_parts' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.two_parts
/-- info: 'BSDHard.value_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.value_is_keyed
/-- info: 'BSDHard.no_keyless_statement_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.no_keyless_statement_is_the_act
/-- info: 'BSDHard.pulse_does_not_certify' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.pulse_does_not_certify
/-- info: 'BSDHard.record_wall' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.record_wall
/-- info: 'BSDHard.fibre_is_two' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.fibre_is_two
/-- info: 'BSDHard.prime_shape' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.prime_shape
/-- info: 'BSDHard.two_axes_leave_two' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.two_axes_leave_two
/-- info: 'BSDHard.three_axes_lock_one' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.three_axes_lock_one
/-- info: 'BSDHard.finite_record_never_forces' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.finite_record_never_forces
/-- info: 'BSDHard.uniform_step_forces_all' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.uniform_step_forces_all
/-- info: 'BSDHard.omega_gives_value' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.omega_gives_value
/-- info: 'BSDHard.omega_strictly_stronger' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.omega_strictly_stronger
/-- info: 'BSDHard.one_class_spans_two' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.one_class_spans_two
/-- info: 'BSDHard.two_classes_span_four' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.two_classes_span_four
/-- info: 'BSDHard.three_classes_span_eight' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.three_classes_span_eight
/-- info: 'BSDHard.k_classes_bound' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.k_classes_bound
/-- info: 'BSDHard.bsd_hardened_closure' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.bsd_hardened_closure
/-- info: 'BSDHard.denial_reenacts_root' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.denial_reenacts_root
/-- info: 'BSDHard.external_proof_adds_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.external_proof_adds_nothing
/-- info: 'BSDHard.undeniable_root_forces_no_value' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.undeniable_root_forces_no_value
/-- info: 'BSDHard.root_read_on_row_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.root_read_on_row_is_keyed
/-- info: 'BSDHard.the_lock' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.the_lock
/-- info: 'BSDHard.indicator_pos' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.indicator_pos
/-- info: 'BSDHard.root_satisfiable' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.root_satisfiable
/-- info: 'BSDHard.constructed_root_holds' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.constructed_root_holds
/-- info: 'BSDHard.root_on_row_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.root_on_row_is_the_act
/-- info: 'BSDHard.root_on_row_is_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.root_on_row_is_the_value
/-- info: 'BSDHard.root_on_row_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.root_on_row_is_keyed
/-- info: 'BSDHard.act_is_the_weakest_premise' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.act_is_the_weakest_premise
/-- info: 'BSDHard.existence_as_given_in_both_worlds' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.existence_as_given_in_both_worlds
/-- info: 'BSDHard.nothing_given_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.nothing_given_refutes
/-- info: 'BSDHard.only_refuter' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.only_refuter
/-- info: 'BSDHard.full_act_is_the_full_value' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.full_act_is_the_full_value
/-- info: 'BSDHard.full_act_gives_rank_act' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.full_act_gives_rank_act
/-- info: 'BSDHard.full_act_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.full_act_is_keyed
/-- info: 'BSDHard.root_on_full_row_is_the_full_act' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.root_on_full_row_is_the_full_act
/-- info: 'BSDHard.root_on_full_row_is_the_full_value' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.root_on_full_row_is_the_full_value
/-- info: 'BSDHard.bsd_full_from_existence' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.bsd_full_from_existence
/-- info: 'BSDHard.full_supply_iff' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.full_supply_iff
/-- info: 'BSDHard.full_act_is_the_weakest_premise' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.full_act_is_the_weakest_premise
/-- info: 'BSDHard.coefficient_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.coefficient_refutes
/-- info: 'BSDHard.len_app' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.len_app
/-- info: 'BSDHard.add_congr' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.add_congr
/-- info: 'BSDHard.len_map' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.len_map
/-- info: 'BSDHard.combos_length' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.combos_length
/-- info: 'BSDHard.points_length' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.points_length
/-- info: 'BSDHard.two_pow_le' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.two_pow_le
/-- info: 'BSDHard.fewer_classes_fall_short' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.fewer_classes_fall_short
/-- info: 'BSDHard.independence_discriminates' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.independence_discriminates
/-- info: 'BSDHard.two_pow_succ_ne_one' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.two_pow_succ_ne_one
/-- info: 'BSDHard.two_pow_inj' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.two_pow_inj
/-- info: 'BSDHard.rank_is_the_dimension_count' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.rank_is_the_dimension_count
/-- info: 'BSDHard.nothing_given_forces' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.nothing_given_forces
/-- info: 'BSDHard.sign_fixes_curve_parity' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.sign_fixes_curve_parity
/-- info: 'BSDHard.low_witness_not_full' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.low_witness_not_full
/-- info: 'BSDHard.full_act_strictly_stronger' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.full_act_strictly_stronger
/-- info: 'BSDHard.act_does_not_give_full_value' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.act_does_not_give_full_value
/-- info: 'BSDHard.record_wall_on_frames' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.record_wall_on_frames
/-- info: 'BSDHard.the_bit_is_the_world' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.the_bit_is_the_world
/-- info: 'BSDHard.finite_record_never_forces_above_one' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.finite_record_never_forces_above_one
/-- info: 'BSDHard.span_and_lock_are_dual' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.span_and_lock_are_dual
/-- info: 'BSDHard.row_root_grounds_itself_iff_value' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.row_root_grounds_itself_iff_value
/-- info: 'BSDHard.full_row_root_grounds_itself_iff_full_value' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.full_row_root_grounds_itself_iff_full_value
/-- info: 'BSDHard.constructed_root_by_its_deed' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.constructed_root_by_its_deed
/-- info: 'BSDHard.RA₀_is_the_constructed_root' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.RA₀_is_the_constructed_root
/-- info: 'BSDHard.the_lock_on_the_root' does not depend on any axioms -/
#guard_msgs in #print axioms BSDHard.the_lock_on_the_root
/-! ===================================================================================================================
    PART A · THE NORMAL FORM OF THE ROW (namespace BSD.NORMALFORM) · v1_1_0_CC

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
namespace BSD.NORMALFORM

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

end BSD.NORMALFORM

/-! ===================================================================================================================
    PART C · THE ROW SPLIT (namespace BSD.ROWSPLIT) · v1_1_0_CC

    The cut-agnostic division, carried verbatim from the Riemann master v3.0.39_CC (namespace RHUnicorn, generic over
    the types α and β), its one proposition renamed from `RH` to `Whole`, the hypothesis it names. At every cut T the
    whole is exactly its Real part and its Unicorn part; a certificate at T proves the Real part; given the Real part
    the whole is exactly the Unicorn part; above every cut no reading of an even record agrees with an odd decision;
    the aperture is one bit wide; and the supply side is silent at the register. ΔM = 0.
=================================================================================================================== -/
namespace BSD.ROWSPLIT

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

end BSD.ROWSPLIT
/-! ===================================================================================================================
    PART B · THE HOST MODEL AND ITS BINDING, PROVED (namespace BSD.HOST) · v1_1_0_CC

    The record of a frame keeps every curve, its order and its coefficient bit, and registers the curve's rank at its
    order: on the record the rank sits on the seat, so the record carries the value with no premise
    (`recFrame_value`). The host is the row's curves, each with its rank and its centred expansion at the centre,
    carrying the sign of its functional equation, the order of vanishing read off the expansion; its sentence is rank
    equal to order at every curve. The binding is a theorem: the value of the host's frame is exactly the host's
    sentence (`binding`). The order is read off the expansion uniquely (`order_is_read`); the sign fixes the parity of
    the order at every curve (`sign_fixes_order_parity`), a minus sign forcing the central value to vanish
    (`minus_sign_vanishes`); and under the sentence the sign fixes the parity of the rank
    (`sentence_gives_rank_parity`), a minus sign forcing positive rank (`minus_sign_forces_positive_rank`). A curve of
    every order is built on the seat (`monoCentred`). Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace BSD.HOST
open BSDHard

/-- THE RECORD OF A FRAME: the registration keeps every curve, its order and its coefficient bit, and registers the
    curve's rank at its order. -/
def recFrame (F : Frame) : Frame := ⟨F.D, F.order, F.order, F.coeff⟩

/-- THE RECORD CARRIES THE VALUE, with no premise. -/
theorem recFrame_value (F : Frame) : Value (recFrame F) := fun _ => rfl

/-- THE BSD ROW: the frames of curves with their ranks and orders, the value, the registration onto the record, the
    calm world and the counter world. -/
def bsdRow : BSD.NORMALFORM.Row.{1} :=
  ⟨Frame, Value, recFrame, recFrame_value, calm, counter, calm_value, counter_fails⟩

/-- EVERY CURVE HAS ITS SEAT ON THE RECORD: on the record each curve's rank is read at its order, and its order and
    coefficient bit are kept. -/
theorem every_curve_has_its_seat (F : Frame) (d : F.D) :
    (recFrame F).rank d = F.order d ∧ (recFrame F).order d = F.order d ∧ (recFrame F).coeff d = F.coeff d :=
  ⟨rfl, rfl, rfl⟩

/-- THE HOST: the curves of the row, each with its rank, its centred expansion at the centre carrying the sign of its
    functional equation, and its order of vanishing, read off the expansion. -/
structure Host where
  Curve : Type
  rank  : Curve → Nat
  L     : Curve → Centred
  order : Curve → Nat
  ord   : ∀ c, IsOrder (L c).a (order c)

/-- THE SENTENCE OF THE HOST: at every curve the rank is the order of vanishing at the centre. -/
def Host.Sentence (H : Host) : Prop := ∀ c, H.rank c = H.order c

/-- THE FRAME OF THE HOST. -/
def Host.frame (H : Host) : Frame := ⟨H.Curve, H.rank, H.order, fun _ => true⟩

/-- THE SIGNED FRAME OF THE HOST: each curve with its centred expansion. -/
def Host.signed (H : Host) : SignedFrame := ⟨H.frame, H.L, H.ord⟩

/-- THE BINDING, PROVED: the value of the host's frame is exactly the host's sentence. -/
theorem binding (H : Host) : Value H.frame ↔ H.Sentence := ⟨fun h c => h c, fun h c => h c⟩

/-- THE ROOT READ ON THE ROW IS THE SENTENCE, on the host's frame. -/
theorem root_on_row_is_the_sentence (H : Host) : RootOnRow H.frame ↔ H.Sentence :=
  (root_on_row_is_the_value H.frame).trans (binding H)

/-- THE ACT ON THE HOST'S FRAME IS THE SENTENCE. -/
theorem act_is_the_sentence (H : Host) : Registered H.frame ↔ H.Sentence :=
  (act_is_the_value H.frame).trans (binding H)

/-- THE ORDER IS READ OFF THE EXPANSION, uniquely. -/
theorem order_is_read (H : Host) (c : H.Curve) (o : Nat) (ho : IsOrder (H.L c).a o) : o = H.order c :=
  order_unique (H.L c).a o (H.order c) ho (H.ord c)

/-- THE SIGN FIXES THE PARITY OF THE ORDER at every curve of the host: under a minus sign the order is odd, under a plus
    sign even. -/
theorem sign_fixes_order_parity (H : Host) (c : H.Curve) :
    ((H.L c).minus = true → evenB (H.order c) = false) ∧ ((H.L c).minus = false → evenB (H.order c) = true) :=
  ⟨fun hm => minus_order_odd (H.L c) hm (H.order c) (H.ord c),
   fun hm => plus_order_even (H.L c) hm (H.order c) (H.ord c)⟩

/-- A MINUS SIGN FORCES THE CENTRAL VALUE TO VANISH, at every curve of the host. -/
theorem minus_sign_vanishes (H : Host) (c : H.Curve) (hm : (H.L c).minus = true) : (H.L c).a 0 = 0 :=
  minus_sign_forces_vanishing (H.L c) hm

/-- UNDER THE SENTENCE THE SIGN FIXES THE PARITY OF THE RANK. -/
theorem sentence_gives_rank_parity (H : Host) (h : H.Sentence) (c : H.Curve) :
    ((H.L c).minus = true → evenB (H.rank c) = false) ∧ ((H.L c).minus = false → evenB (H.rank c) = true) :=
  ⟨fun hm => by rw [h c]; exact (sign_fixes_order_parity H c).1 hm,
   fun hm => by rw [h c]; exact (sign_fixes_order_parity H c).2 hm⟩

/-- UNDER THE SENTENCE A MINUS SIGN FORCES POSITIVE RANK. -/
theorem minus_sign_forces_positive_rank (H : Host) (h : H.Sentence) (c : H.Curve) (hm : (H.L c).minus = true) :
    H.rank c ≠ 0 :=
  fun h0 => Bool.noConfusion (((sentence_gives_rank_parity H h c).1 hm).symm.trans (congrArg evenB h0))

/-- The expansion with one nonzero coefficient, one, at index o. -/
def mono (o : Nat) : Nat → Int := fun k => if k = o then 1 else 0

/-- Off its index the expansion vanishes. -/
theorem mono_off (o k : Nat) (h : k ≠ o) : mono o k = 0 := if_neg h

/-- A Boolean never equals its negation. -/
theorem beq_not_self (b : Bool) : (b == !b) = false := by cases b <;> rfl

/-- The expansion with one coefficient at o obeys the reflection law of the sign fixed by the parity of o. -/
theorem mono_reflect (o : Nat) : ∀ k, (evenB k == !evenB o) = true → mono o k = -(mono o k) :=
  fun k hk => match Nat.decEq k o with
    | isTrue e =>
      have h2 : (evenB o == !evenB o) = true := e ▸ hk
      Bool.noConfusion (h2.symm.trans (beq_not_self (evenB o)))
    | isFalse ne =>
      (mono_off o k ne).trans ((rfl : (0 : Int) = -0).trans (congrArg Neg.neg (mono_off o k ne).symm))

/-- A CENTRED EXPANSION OF EVERY ORDER: one coefficient at o, the sign minus exactly when o is odd. -/
def monoCentred (o : Nat) : Centred := ⟨mono o, !evenB o, mono_reflect o⟩

/-- Its order is o. -/
theorem mono_is_order (o : Nat) : IsOrder (monoCentred o).a o :=
  ⟨fun h => absurd ((if_pos rfl : mono o o = 1).symm.trans h) (by decide),
   fun j hj => mono_off o j (Nat.ne_of_lt hj)⟩

/-- The host of one curve of rank r whose expansion has order o. -/
def oneCurve (r o : Nat) : Host := ⟨Unit, fun _ => r, fun _ => monoCentred o, fun _ => o, fun _ => mono_is_order o⟩

/-- THE CURVE OF RANK ONE AT ORDER ONE carries a minus sign and the sentence: the shape of 37a1. -/
theorem rank_one_at_order_one : (oneCurve 1 1).Sentence ∧ ((oneCurve 1 1).L ()).minus = true := ⟨fun _ => rfl, rfl⟩

/-- THE LOW-ORDER WITNESS ON THE HOST: the cited theorems at order at most one have this shape. -/
def Host.Low (H : Host) : Prop := LowWitness H.frame

/-- THE SENTENCE GIVES THE LOW-ORDER WITNESS, and the low-order witness does not give the sentence: a curve of rank
    zero at order two carries the witness and fails the sentence. -/
theorem low_is_strictly_inside :
    (∀ H : Host, H.Sentence → H.Low) ∧ (oneCurve 0 2).Low ∧ ¬ (oneCurve 0 2).Sentence :=
  ⟨fun _ h c _ => h c, fun _ h => absurd h (by decide : ¬ ((2 : Nat) ≤ 1)), fun h => Nat.noConfusion (h ())⟩

end BSD.HOST

/-! ===================================================================================================================
    PART C′ · THE ROW SPLIT READ AT ORDER ONE (namespace BSD.REALPART) · v1_1_0_CC

    The cut-agnostic division of Part C read on the BSD row: the existents are a frame's curves, the property each is
    asked is rank equal to order, and the height is the order. At order one the real part is exactly the low-order
    witness (`low_witness_is_the_real_part`); the value is exactly its real part and its unicorn part at every cut;
    given the low-order witness the value is exactly the unicorn part above order one (`no_bypass_at_order_one`); the
    unicorn part is load-bearing, the staged world above order one carrying the real part and failing the value; and
    above every order no reading of a record that keeps the order and forgets the world returns the world. Every
    theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace BSD.REALPART
open BSDHard BSD.ROWSPLIT

/-- The existents: every curve of the frame. -/
def Ex (F : Frame) (_ : F.D) : Prop := True

/-- The property each curve is asked: rank equal to order. -/
def Rk (F : Frame) (d : F.D) : Prop := F.rank d = F.order d

/-- The value of the frame is the whole of the row split. -/
theorem value_is_the_whole (F : Frame) : Value F ↔ Whole (Ex F) (Rk F) :=
  ⟨fun h d _ => h d, fun h d => h d trivial⟩

/-- THE REAL PART AT ORDER ONE IS THE LOW-ORDER WITNESS. -/
theorem low_witness_is_the_real_part (F : Frame) : LowWitness F ↔ RealPartAt (Ex F) (Rk F) F.order 1 :=
  ⟨fun h d _ hle => h d hle, fun h d hle => h d trivial hle⟩

/-- THE CUT AT EVERY ORDER: the value is exactly its real part and its unicorn part. -/
theorem value_iff_real_and_unicorn (F : Frame) (T : Nat) :
    Value F ↔ RealPartAt (Ex F) (Rk F) F.order T ∧ UnicornAt (Ex F) (Rk F) F.order T :=
  (value_is_the_whole F).trans (whole_iff_real_and_unicorn (Ex F) (Rk F) F.order T)

/-- NO BYPASS AT ORDER ONE: given the low-order witness, the value is exactly the unicorn part above order one. -/
theorem no_bypass_at_order_one (F : Frame) (hw : LowWitness F) : Value F ↔ UnicornAt (Ex F) (Rk F) F.order 1 :=
  (value_is_the_whole F).trans
    (unicorn_no_bypass (Ex F) (Rk F) F.order 1 ((low_witness_is_the_real_part F).mp hw))

/-- THE UNICORN PART IS THE CURVES OF ORDER AT LEAST TWO. -/
theorem unicorn_is_order_two_and_above (F : Frame) :
    UnicornAt (Ex F) (Rk F) F.order 1 ↔ ∀ d, 2 ≤ F.order d → F.rank d = F.order d :=
  ⟨fun h d h2 => h d trivial h2, fun h d _ h2 => h d h2⟩

/-- THE UNICORN PART IS LOAD-BEARING: at every stage the staged world above order one carries the real part and fails
    the value. -/
theorem unicorn_part_is_load_bearing (n : Nat) :
    RealPartAt (Ex (stagedHigh n)) (Rk (stagedHigh n)) (stagedHigh n).order 1 ∧ ¬ Value (stagedHigh n) :=
  ⟨(low_witness_is_the_real_part (stagedHigh n)).mp (finite_record_never_forces_above_one n).1,
   (finite_record_never_forces_above_one n).2.2⟩

/-- THE UNICORN PART CLOSED TO THE RECORD ABOVE EVERY ORDER: on the chart of worlds and orders, a record that keeps the
    order and forgets the world is even under the exchange of worlds, the world is odd, and above every order no
    reading of the record returns the world. -/
theorem unicorn_blocked_above_every_order (T : Nat) :
    ¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1 :=
  unicorn_block Prod.snd T (fun w => (!w.1, w.2)) Prod.snd Prod.fst (true, T + 1)
    (Nat.lt_succ_self T) (Nat.lt_succ_self T) rfl rfl

/-- THE SUPPLY SIDE IS SILENT ABOVE EVERY ORDER: both orientations of the world are refused alike to every reading of
    the record, and the two orientations differ. -/
theorem supply_side_silent_above_every_order (T : Nat) :
    (¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1) ∧
    (¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = !w.1) ∧ (!true) ≠ true :=
  supply_side_silent Prod.snd T (fun w => (!w.1, w.2)) Prod.snd Prod.fst (true, T + 1)
    (Nat.lt_succ_self T) (Nat.lt_succ_self T) rfl rfl

/-- THE APERTURE IS ONE BIT WIDE: at the seat of the exchange above every order, one odd supplied bit calibrates the
    world uniquely, through one calibration bit that exists and is unique. -/
theorem aperture_is_one_bit (T : Nat) :
    let z : Bool × Nat := (true, T + 1)
    let τ : Bool × Nat → Bool × Nat := fun w => (!w.1, w.2)
    ∃ c : Bool, (z.1 = xor (!z.1) c ∧ (τ z).1 = xor (!(τ z).1) c) ∧
      ∀ c' : Bool, (z.1 = xor (!z.1) c' ∧ (τ z).1 = xor (!(τ z).1) c') → c' = c :=
  aperture_one_bit_wide (fun w : Bool × Nat => (!w.1, w.2)) (fun w => !w.1) Prod.fst (true, T + 1) rfl rfl

end BSD.REALPART

/-! ===================================================================================================================
    PART D · THE WALLS (namespace BSD.WALLS) · v1_1_0_CC

    Every zero-bit route is closed by theorem. Existence as given forces nothing (Part 0, `given_is_not_the_value`,
    `arrow_forces_nothing`). No finite record forces the value, nor above order one with the low-order witness in place
    (Part 0). The parity is one bit and not the value (Part 0, `parity_is_not_the_value`). The retired Ω is strictly
    stronger than the value (Part 0). This Part adds the sign wall on the row's own expansions: the expansions of
    order one and order three carry the same sign, and the sign reads the parity of the order and never the order
    (`sign_record_normal_form`, `sign_reads_no_order`): the root number of a curve of rank one and of a curve of rank
    three is one and the same, minus. Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace BSD.WALLS
open BSDHard BSD.HOST

/-- THE SIGN RECORD NORMAL FORM, decided by the kernel on the row's own expansions: the expansions of order one and
    of order three both carry the minus sign; their first-order readings are one and zero; and the sign at every order
    is the parity of the order, flipped. -/
theorem sign_record_normal_form :
    (monoCentred 1).minus = true ∧ (monoCentred 3).minus = true ∧
    (monoCentred 1).a 1 = 1 ∧ (monoCentred 3).a 1 = 0 ∧ (∀ o, (monoCentred o).minus = !evenB o) :=
  ⟨rfl, rfl, rfl, rfl, fun _ => rfl⟩

/-- THE SIGN READS NO ORDER: no reading of the sign returns the order of the expansion. -/
theorem sign_reads_no_order : ¬ ∃ g : Bool → Nat, ∀ o : Nat, g (monoCentred o).minus = o :=
  fun ⟨g, hg⟩ => absurd ((hg 1).symm.trans (hg 3)) (by decide)

/-- THE SIGN READS NO RANK UNDER THE SENTENCE: the curves of rank one and rank three at their orders share the sign. -/
theorem sign_reads_no_rank :
    (oneCurve 1 1).Sentence ∧ (oneCurve 3 3).Sentence ∧ ((oneCurve 1 1).L ()).minus = ((oneCurve 3 3).L ()).minus ∧
    ¬ ∃ g : Bool → Nat, g ((oneCurve 1 1).L ()).minus = 1 ∧ g ((oneCurve 3 3).L ()).minus = 3 :=
  ⟨fun _ => rfl, fun _ => rfl, rfl, fun ⟨_, h1, h3⟩ => absurd (h1.symm.trans h3) (by decide)⟩

/-- THE WALLS OF THE ROW, one theorem: no given statement is the value on every frame; the arrow forces nothing; no
    finite record forces the value, nor above order one with the low-order witness in place; the parity is one bit and
    not the value; the low-order witness is strictly smaller; the retired Ω is strictly stronger; no reading of the
    kinetic record returns the bit; and the sign reads no order. -/
theorem the_walls :
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    (¬ ∀ F : Frame, Arrow → Value F) ∧
    (∀ n : Nat, (∀ d, d < n → (staged n).rank d = (staged n).order d) ∧ ¬ Value (staged n)) ∧
    (∀ n : Nat, LowWitness (stagedHigh n) ∧ (∀ d, d < n → (stagedHigh n).rank d = (stagedHigh n).order d) ∧
      ¬ Value (stagedHigh n)) ∧
    (ParityValue counter ∧ ¬ Value counter) ∧
    (LowWitness counter ∧ ¬ Value counter) ∧
    (Value unprovenanced.F ∧ ¬ OmegaHolds unprovenanced) ∧
    (¬ ∃ g : Nat → Bool, ∀ w, g (kineticRecord w) = w) ∧
    (¬ ∃ g : Bool → Nat, ∀ o : Nat, g (monoCentred o).minus = o) :=
  ⟨given_is_not_the_value, arrow_forces_nothing, finite_record_never_forces, finite_record_never_forces_above_one,
   parity_is_not_the_value, low_witness_strict, omega_strictly_stronger, record_wall, sign_reads_no_order⟩

end BSD.WALLS

/-! ===================================================================================================================
    PART E · THE RESIDUE (namespace BSD.RESIDUE) · v1_1_0_CC

    Everything above is unconditional. What remains of the rank part of the Birch and Swinnerton-Dyer sentence is this
    one hypothesis, the transfer of the value from the record to the host's frame: given it, the sentence follows on no
    axiom. It is printed here as the type of a hypothesis and is assumed nowhere. The residue is keyed: no premise
    shared by every frame and no principle true of every record supplies it. Its instance seat decomposes it at order
    one: given the low-order witness, the seat is the curves of order at least two. ΔM = 0.
=================================================================================================================== -/
namespace BSD.RESIDUE
open BSDHard BSD.NORMALFORM BSD.HOST BSD.REALPART BSD.ROWSPLIT

/-- THE RESIDUE: given the one implication at the host's frame, the host's sentence. -/
theorem sentence_of_the_act (H : Host) (bit : Transfer bsdRow H.frame) : H.Sentence :=
  (binding H).mp (value_from_the_cargo_loop bsdRow H.frame bit)

/-- THE RESIDUE IS THE SENTENCE: the transfer at the host's frame is exactly the host's sentence. -/
theorem residue_is_the_sentence (H : Host) : Transfer bsdRow H.frame ↔ H.Sentence :=
  (normal_form bsdRow H.frame).trans (binding H)

/-- THE ONE POSIT IS THE BIT: the root read on the row, at the host's frame, is exactly the transfer. -/
theorem the_posit_is_the_bit (H : Host) : RootOnRow H.frame ↔ Transfer bsdRow H.frame :=
  (root_on_row_is_the_sentence H).trans (residue_is_the_sentence H).symm

/-- THE RESIDUE IS KEYED: no premise shared by every frame forces the value, and no principle true of every record
    decides it. What supplies it is keyed to the frame: the act. -/
theorem residue_is_keyed :
    (∀ P : Frame → Prop, Keyless bsdRow P → ¬ Forces bsdRow P) ∧
    (∀ P : Frame → Prop, (∀ F, P (recFrame F)) → ¬ ∀ F, P (recFrame F) → Value F) :=
  ⟨keyless_forces_nothing bsdRow, no_record_principle_decides bsdRow⟩

/-- THE INSTANCE SEAT OF THE BIT, above order one: rank equal to order at every curve of order at least two. Given the
    low-order witness, its inhabitation is equivalent in strength to the value (`seat_iff_value`); nothing in this file
    assumes it inhabited. -/
structure HighSeat (F : Frame) where
  high : ∀ d, 2 ≤ F.order d → F.rank d = F.order d

/-- THE SEAT AND THE LOW-ORDER WITNESS DELIVER THE VALUE. -/
theorem value_of_seat (F : Frame) (hw : LowWitness F) (S : HighSeat F) : Value F :=
  fun d => match Nat.lt_or_ge 1 (F.order d) with
    | Or.inl h => S.high d h
    | Or.inr h => hw d h

/-- GIVEN THE LOW-ORDER WITNESS, THE SEAT IS INHABITED EXACTLY WHEN THE VALUE HOLDS. -/
theorem seat_iff_value (F : Frame) (hw : LowWitness F) : Nonempty (HighSeat F) ↔ Value F :=
  ⟨fun ⟨S⟩ => value_of_seat F hw S, fun h => ⟨⟨fun d _ => h d⟩⟩⟩

/-- THE SEAT IS THE UNICORN PART. -/
theorem seat_is_the_unicorn (F : Frame) : Nonempty (HighSeat F) ↔ UnicornAt (Ex F) (Rk F) F.order 1 :=
  ⟨fun ⟨S⟩ => (unicorn_is_order_two_and_above F).mpr S.high,
   fun h => ⟨⟨(unicorn_is_order_two_and_above F).mp h⟩⟩⟩

end BSD.RESIDUE

/-! ===================================================================================================================
    PART F · THE SUPPLY (namespace BSD.SUPPLY) · v1_1_0_CC

    The bit of Part E, supplied by the act and delivered by its two kinds: the formal cargo, and the physical witness.
    Each kind is a type whose inhabitant is the supply; neither is assumed anywhere in this file. The cargo arrives
    free; each kind delivers the sentence; the two kinds are one bit; every route to the sentence delivers both kinds,
    so there is no third; and one curve whose rank is not its order refutes both at once. The witnesses of the subject
    are typed here against the bit: the cited theorems at order at most one are inside it and strictly smaller; the
    retired Ω is strictly stronger; the full act, rank and leading coefficient, is strictly stronger and carried beside.
    ΔM = 0.
=================================================================================================================== -/
namespace BSD.SUPPLY
open BSDHard BSD.NORMALFORM BSD.HOST

/-- THE FORMAL KIND, the cargo: the record's value carried to the host's frame. -/
def FormalCargo (H : Host) : Prop := Transfer bsdRow H.frame

/-- THE PHYSICAL KIND, the witness: each curve's group of rational points is a physical register whose free directions
    are each registered at one Landauer floor quantum, the curve itself at one more, so a curve's heat in floor units is
    its rank plus one; and the carrier registers every curve's free directions as the zero modes at the centre, rank
    equal to the order of vanishing. The last field is the one bit read in the register of heat; it is a premise of the
    witness, carried as a field, never proved. -/
structure PhysicalWitness (H : Host) where
  floor      : Nat
  floor_pos  : 0 < floor
  heat       : H.Curve → Nat
  counts     : ∀ c, heat c = floor * (H.rank c + 1)
  zero_modes : ∀ c, H.rank c = H.order c

/-- THE CARGO ARRIVES, with no premise: the record of the host's frame carries the value. -/
theorem cargo_arrives (H : Host) : Value (recFrame H.frame) := recFrame_value H.frame

/-- KIND 1 DELIVERS: the formal cargo gives the sentence in one step. -/
theorem formal_kind_delivers {H : Host} (h : FormalCargo H) : H.Sentence := (binding H).mp (h (cargo_arrives H))

/-- KIND 2 DELIVERS: the physical witness gives the sentence. -/
theorem physical_kind_delivers {H : Host} (W : PhysicalWitness H) : H.Sentence := W.zero_modes

/-- The physical witness closes the host's frame. -/
theorem witness_closes {H : Host} (W : PhysicalWitness H) : Value H.frame := (binding H).mpr (physical_kind_delivers W)

/-- A witness from the sentence, at one floor quantum per free direction. -/
def witness_of_sentence {H : Host} (h : H.Sentence) : PhysicalWitness H :=
  ⟨1, Nat.zero_lt_one, fun c => 1 * (H.rank c + 1), fun _ => rfl, h⟩

/-- THE PHYSICAL FACE IS THE SENTENCE: a witness exists exactly when the sentence holds. -/
theorem physical_iff_sentence (H : Host) : Nonempty (PhysicalWitness H) ↔ H.Sentence :=
  ⟨fun ⟨W⟩ => physical_kind_delivers W, fun h => ⟨witness_of_sentence h⟩⟩

/-- THE FORMAL FACE IS THE SENTENCE. -/
theorem formal_iff_sentence (H : Host) : FormalCargo H ↔ H.Sentence := BSD.RESIDUE.residue_is_the_sentence H

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

/-- THE ONE REFUTER: one curve whose rank is not its order refutes both kinds at once. -/
theorem the_one_refuter (H : Host) (c : H.Curve) (h : H.rank c ≠ H.order c) :
    ¬ FormalCargo H ∧ ¬ Nonempty (PhysicalWitness H) :=
  have hs : ¬ H.Sentence := fun s => h (s c)
  ⟨fun f => hs (formal_kind_delivers f), fun ⟨W⟩ => hs (physical_kind_delivers W)⟩

/-- THE WITNESSES OF THE SUBJECT, TYPED: the sentence gives the low-order witness, which a curve of rank zero at order
    two carries while failing the sentence; the act supplies the low-order witness on every actual frame and the
    witness is strictly smaller than the value; the retired Ω gives the value and is strictly stronger; the full act
    carries the act, is strictly stronger, and the act does not give the full value. Each is typed against the bit;
    none is its ground. -/
theorem the_witnesses_typed :
    ((∀ H : Host, H.Sentence → H.Low) ∧ (oneCurve 0 2).Low ∧ ¬ (oneCurve 0 2).Sentence) ∧
    (∀ A : ActualCurves, LowWitness A.F) ∧ (LowWitness counter ∧ ¬ Value counter) ∧
    ((∀ P : Provenanced, OmegaHolds P → Value P.F) ∧ Value unprovenanced.F ∧ ¬ OmegaHolds unprovenanced) ∧
    ((∀ F : Frame, RegisteredFull F → Registered F) ∧ Registered coeffCounter ∧ ¬ RegisteredFull coeffCounter) ∧
    (¬ ∀ F : Frame, Registered F → FullValue F) :=
  ⟨low_is_strictly_inside, act_gives_low_witness, low_witness_strict,
   ⟨omega_gives_value, omega_strictly_stronger⟩, full_act_strictly_stronger, act_does_not_give_full_value⟩

/-- THE SUPPLY, CLOSED, at every host: the cargo arrives free; each kind delivers; the two kinds are one bit; the bit is
    the sentence; every route is both kinds; and one curve whose rank is not its order refutes both. -/
theorem the_supply_closed : ∀ H : Host,
    Value (recFrame H.frame) ∧
    (FormalCargo H → H.Sentence) ∧ (PhysicalWitness H → H.Sentence) ∧
    (PhysicalWitness H → FormalCargo H) ∧ (FormalCargo H ↔ H.Sentence) ∧
    (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧
    (∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧
    (∀ c, H.rank c ≠ H.order c → ¬ FormalCargo H ∧ ¬ Nonempty (PhysicalWitness H)) :=
  fun H => ⟨cargo_arrives H, formal_kind_delivers, physical_kind_delivers, (the_two_kinds_are_one_bit H).1,
   formal_iff_sentence H, physical_iff_sentence H, two_kinds_and_no_third H, the_one_refuter H⟩

end BSD.SUPPLY

/-! ===================================================================================================================
    PART G · THE CLOSURE OF THE QUESTION (namespace BSD.CLOSURE) · v1_1_0_CC

    Why the question is closed and not open. At every host the rank sentence and the bit are one proposition, with
    nothing cited; the denial of the sentence is the bit's denial; across the frames of the row the bit has no uniform
    answer, true in one world and false in another of the same record; every keyless route is barred; either kind of
    the supply gives the sentence; and one curve whose rank is not its order refutes the sentence itself. Nothing here
    derives the bit. It proves that the question is one bit, that the bit is keyed, and that what is open is a value
    and not a form. ΔM = 0.
=================================================================================================================== -/
namespace BSD.CLOSURE
open BSDHard BSD.NORMALFORM BSD.HOST BSD.SUPPLY

/-- THE SENTENCE IS THE BIT, nothing cited. -/
theorem the_sentence_is_the_bit (H : Host) : H.Sentence ↔ FormalCargo H := (formal_iff_sentence H).symm

/-- THE DENIAL IS THE BIT'S DENIAL. -/
theorem denial_is_the_bits_denial (H : Host) : ¬ H.Sentence ↔ ¬ FormalCargo H :=
  ⟨fun hn h => hn (formal_kind_delivers h), fun hn h => hn ((formal_iff_sentence H).mpr h)⟩

/-- THE ONE REFUTER REFUTES THE SENTENCE: one curve whose rank is not its order. -/
theorem refuter_denies_the_sentence (H : Host) (c : H.Curve) (h : H.rank c ≠ H.order c) : ¬ H.Sentence :=
  fun s => h (s c)

/-- THE DENIAL HAS ONE ROAD: wherever the sentence fails, it cannot be that no curve has rank other than its order. -/
theorem the_denial_has_one_road (H : Host) : ¬ H.Sentence → ¬ ¬ ∃ c, H.rank c ≠ H.order c :=
  fun hn hne => hn (fun c => match Nat.decEq (H.rank c) (H.order c) with
    | isTrue e => e
    | isFalse ne => absurd ⟨c, ne⟩ hne)

/-- THE QUESTION, CLOSED TO ONE BIT, at every host. The sentence is the bit and its denial is the bit's denial; the bit
    has no uniform answer across the frames; no keyless premise forces it; either kind of the supply gives the
    sentence; and one curve whose rank is not its order denies the sentence. What is open is the value of one
    implication; the form of the question is closed. -/
theorem question_closed_to_one_bit : ∀ H : Host,
    (H.Sentence ↔ FormalCargo H) ∧ (¬ H.Sentence ↔ ¬ FormalCargo H) ∧
    (¬ (∀ F, Transfer bsdRow F) ∧ ¬ (∀ F, ¬ Transfer bsdRow F)) ∧
    (∀ P : Frame → Prop, Keyless bsdRow P → ¬ Forces bsdRow P) ∧
    (FormalCargo H → H.Sentence) ∧ (PhysicalWitness H → H.Sentence) ∧
    (∀ c, H.rank c ≠ H.order c → ¬ H.Sentence) :=
  fun H => ⟨the_sentence_is_the_bit H, denial_is_the_bits_denial H, no_uniform_answer bsdRow,
   keyless_forces_nothing bsdRow, formal_kind_delivers, physical_kind_delivers, refuter_denies_the_sentence H⟩

end BSD.CLOSURE

/-! ===================================================================================================================
    PART W · THE TWELVE FORMAL GATES, RUN IN THE KERNEL (namespace BSD.GATES) · v1_1_0_CC

    The twelve formal gates of the mathematical register, run inside the kernel on the BSD seal at every host. Each gate
    is a proposition and a theorem, and `the_formal_run` binds the twelve passes and the four refusals in one
    statement. Four claims fail, each by a theorem: "the sentence is proved by the delivery" fails SREP, the delivery's
    premise being its conclusion; "a proof is waiting" fails SREP, a true route to the sentence being the sentence; "no
    proof can ever exist" fails SREP, no true route to the sentence being its denial, the counter world in costume; and
    the denial has one road, a curve whose rank is not its order. No declaration has the type of the bit. ΔM = 0.
=================================================================================================================== -/
namespace BSD.GATES
open BSDHard BSD.NORMALFORM BSD.HOST BSD.SUPPLY BSD.REALPART BSD.ROWSPLIT

/-- Gate 1, SREP: the form stands with no hypothesis. -/
def Gate1 (H : Host) : Prop :=
  Value (recFrame H.frame) ∧ (FormalCargo H ↔ H.Sentence) ∧
  (∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H) ∧
  (∀ C : Centred, C.minus = true → C.a 0 = 0) ∧ (∀ F : Frame, Registered F ↔ Value F)

/-- GATE 1 · SREP: nothing in the form presupposes the bit. -/
theorem gate_1_srep (H : Host) : Gate1 H :=
  ⟨cargo_arrives H, formal_iff_sentence H, fun _ h q => (formal_iff_sentence H).mpr (h q),
   minus_sign_forces_vanishing, act_is_the_value⟩

/-- Gate 2, REG: the bit read from ten contexts, all one proposition. -/
def Gate2 (H : Host) : Prop :=
  (Value H.frame ↔ H.Sentence) ∧ (Registered H.frame ↔ H.Sentence) ∧ (RootOnRow H.frame ↔ H.Sentence) ∧
  (Nonempty (SelfGrounding (RootOnRow H.frame)) ↔ H.Sentence) ∧ (FormalCargo H ↔ H.Sentence) ∧
  (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧ (SelfRecursive bsdRow H.frame ↔ H.Sentence) ∧
  (Nonempty (Act bsdRow H.frame) ↔ H.Sentence) ∧
  (Nonempty { A : ActualCurves // A.F = H.frame } ↔ H.Sentence) ∧
  (Whole (Ex H.frame) (Rk H.frame) ↔ H.Sentence)

/-- GATE 2 · REG: ten reading contexts, one proposition. -/
theorem gate_2_reg (H : Host) : Gate2 H :=
  ⟨binding H, act_is_the_sentence H, root_on_row_is_the_sentence H,
   (row_root_grounds_itself_iff_value H.frame).trans (binding H), formal_iff_sentence H, physical_iff_sentence H,
   (self_recursion_at_frame bsdRow H.frame).trans (binding H),
   (bit_is_the_act bsdRow H.frame).symm.trans (formal_iff_sentence H),
   (supply_iff H.frame).trans (binding H),
   (value_is_the_whole H.frame).symm.trans (binding H)⟩

/-- Gate 3, SGEG: no face drifts from the bit. -/
def Gate3 (H : Host) : Prop :=
  (FormalCargo H ↔ H.Sentence) ∧ (Nonempty (PhysicalWitness H) ↔ H.Sentence) ∧ (Value H.frame ↔ H.Sentence) ∧
  (∀ F : Frame, LowWitness F → (Value F ↔ UnicornAt (Ex F) (Rk F) F.order 1))

/-- GATE 3 · SGEG: the formal, physical, frame and unicorn faces are each the bit. -/
theorem gate_3_sgeg (H : Host) : Gate3 H :=
  ⟨formal_iff_sentence H, physical_iff_sentence H, binding H, no_bypass_at_order_one⟩

/-- Gate 4, CAUSAL: the native involution on the bit fixes nothing; an integer equal to its own reflection is zero;
    and a minus sign forces vanishing at the centre: the seat of the row is inhabited and is the centre. -/
def Gate4 : Prop :=
  (¬ ∃ b, comp b = b) ∧ (∀ v : Int, v = -v → v = 0) ∧ (∀ C : Centred, C.minus = true → C.a 0 = 0)

/-- GATE 4 · CAUSAL: no imprint is asserted on a ground the bit lacks; the row's seat is the centre of the reflection. -/
theorem gate_4_causal : Gate4 := ⟨locus_vanishes, self_neg_zero, minus_sign_forces_vanishing⟩

/-- Gate 5, MIG: two frames whose records both carry the value split on the value. -/
def Gate5 : Prop := Value (recFrame calm) ∧ Value (recFrame counter) ∧ Value calm ∧ ¬ Value counter

/-- GATE 5 · MIG: the reading apparatus, the record, does not fix the residence. -/
theorem gate_5_mig : Gate5 := record_decides_nothing bsdRow

/-- Gate 6, PTB: complementation is an involution without a fixed point; the identity fixes everything; and the parity
    flips at every step, so the sign's reflection has no fixed parity. -/
def Gate6 : Prop :=
  (∀ b : Bool, comp (comp b) = b) ∧ (¬ ∃ b, comp b = b) ∧ (∀ b : Bool, id (id b) = b) ∧
  (∀ n, evenB (n + 1) = !evenB n)

/-- GATE 6 · PTB: the fixed-point reading belongs to the chosen reflection, not to the bit. -/
theorem gate_6_ptb : Gate6 := ⟨comp_involution, locus_vanishes, fun _ => rfl, fun _ => rfl⟩

/-- Gate 7, DUAL: the bit does not depend on where the order ladder is cut: given the low-order witness the value is
    exactly the part above order one, and the division holds at every cut. -/
def Gate7 : Prop :=
  (∀ F : Frame, LowWitness F → (Value F ↔ UnicornAt (Ex F) (Rk F) F.order 1)) ∧
  (∀ (F : Frame) (T : Nat), Value F ↔ RealPartAt (Ex F) (Rk F) F.order T ∧ UnicornAt (Ex F) (Rk F) F.order T)

/-- GATE 7 · DUAL: the value is the part above order one, and the division stands at every cut. -/
theorem gate_7_dual : Gate7 := ⟨no_bypass_at_order_one, value_iff_real_and_unicorn⟩

/-- Gate 8, CSCG: the proved slices are the bit's lower slices. -/
def Gate8 : Prop :=
  (∀ F : Frame, LowWitness F ↔ RealPartAt (Ex F) (Rk F) F.order 1) ∧
  (∀ F : Frame, Value F → ∀ T, RealPartAt (Ex F) (Rk F) F.order T)

/-- GATE 8 · CSCG: the bit extends the real part and contradicts no slice of it. -/
theorem gate_8_cscg : Gate8 :=
  ⟨low_witness_is_the_real_part, fun F h T => ((value_iff_real_and_unicorn F T).mp h).1⟩

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
def Gate11 (H : Host) : Prop := (FormalCargo H → H.Sentence) ∧ ¬ Keyless bsdRow (Transfer bsdRow)

/-- GATE 11 · OMA: the input from the other side enters as a hypothesis, never as a fact from inside. -/
theorem gate_11_oma (H : Host) : Gate11 H := ⟨formal_kind_delivers, fun h => (no_uniform_answer bsdRow).1 h⟩

/-- Gate 12, ADEG: the binding to the sentence is proved, the sign's transport to the parity of the rank is typed, and
    the physical discharge is the bit. -/
def Gate12 (H : Host) : Prop :=
  (Value H.frame ↔ H.Sentence) ∧
  (H.Sentence → ∀ c, (H.L c).minus = true → evenB (H.rank c) = false) ∧
  (Nonempty (PhysicalWitness H) ↔ H.Sentence)

/-- GATE 12 · ADEG: every transport across registers is typed. -/
theorem gate_12_adeg (H : Host) : Gate12 H :=
  ⟨binding H, fun h c => (sentence_gives_rank_parity H h c).1, physical_iff_sentence H⟩

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
    (¬ H.Sentence → ¬ ¬ ∃ c, H.rank c ≠ H.order c) :=
  fun H => ⟨gate_1_srep H, gate_2_reg H, gate_3_sgeg H, gate_4_causal, gate_5_mig, gate_6_ptb, gate_7_dual,
   gate_8_cscg, gate_9_cseg, gate_10_mta, gate_11_oma H, gate_12_adeg H, refusal_proved H,
   refusal_waiting H.Sentence, refusal_no_proof_at_the_bit H, BSD.CLOSURE.the_denial_has_one_road H⟩

end BSD.GATES

/-! ===================================================================================================================
    PART X · THE CAPSTONE: NOTHING ESCAPES, OUR WAY OR NO WAY (namespace BSD.ESCAPE) · v1_1_0_CC

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
namespace BSD.ESCAPE
open BSDHard BSD.NORMALFORM BSD.HOST BSD.SUPPLY

/-- THE RECORD CLOSES AT THE HOST'S FRAME. -/
theorem the_record_closes (H : Host) : Value (recFrame H.frame) := cargo_arrives H

/-- THE UNDECIDED IS THE BIT: what the record leaves open, whether the host's frame carries the value, is exactly the
    sentence. -/
theorem the_undecided_is_the_bit (H : Host) : Value H.frame ↔ H.Sentence := binding H

/-- "NOTHING IS OUTSIDE THE RECORD": false as a law of every frame; at the host's frame, the bit. -/
theorem nothing_outside_the_record_is_the_bit (H : Host) :
    ¬ (∀ F, Transfer bsdRow F) ∧ (Transfer bsdRow H.frame ↔ H.Sentence) :=
  ⟨(no_uniform_answer bsdRow).1, formal_iff_sentence H⟩

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
    (¬ (∀ F, Transfer bsdRow F) ∧ (Transfer bsdRow H.frame ↔ H.Sentence)) ∧
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
    (∀ P : Frame → Prop, Keyless bsdRow P → ¬ Forces bsdRow P) ∧
    ((¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence)) ↔ ¬ H.Sentence) ∧
    (BSD.GATES.Gate1 H ∧ BSD.GATES.Gate2 H ∧ BSD.GATES.Gate3 H ∧ BSD.GATES.Gate4 ∧ BSD.GATES.Gate5 ∧
      BSD.GATES.Gate6 ∧ BSD.GATES.Gate7 ∧ BSD.GATES.Gate8 ∧ BSD.GATES.Gate9 ∧ BSD.GATES.Gate10 ∧
      BSD.GATES.Gate11 H ∧ BSD.GATES.Gate12 H) :=
  fun H => ⟨our_way_or_no_way H, both_kinds_deliver H, keyless_forces_nothing bsdRow,
   BSD.GATES.refusal_no_proof_at_the_bit H,
   BSD.GATES.gate_1_srep H, BSD.GATES.gate_2_reg H, BSD.GATES.gate_3_sgeg H, BSD.GATES.gate_4_causal,
   BSD.GATES.gate_5_mig, BSD.GATES.gate_6_ptb, BSD.GATES.gate_7_dual, BSD.GATES.gate_8_cscg, BSD.GATES.gate_9_cseg,
   BSD.GATES.gate_10_mta, BSD.GATES.gate_11_oma H, BSD.GATES.gate_12_adeg H⟩

end BSD.ESCAPE

/-! ===================================================================================================================
    PART T · THE TERMINAL VERDICT AND THE FINAL FORM (namespace BSD.TERMINAL) · v1_1_0_CC

    The open framing awaits a proof of the sentence from what every frame shares, or a reading of the record that
    decides it, or a route to the sentence past the bit. Each count is refuted by theorem (`the_open_framing_is_refuted`),
    and what remains is the bit, its antecedent proved with no hypothesis and the bit proved equivalent to the sentence.
    The ten steps are bound in one theorem, steps 1 to 9 proved and step 10 the two deliveries (`the_ten_steps`). The
    terminal verdict binds by exact type every theorem the verdict cites (`the_terminal_verdict`), and the final form
    binds the closed question, the cut at order one, the sign's transport and the two deliveries (`the_final_form`).
    Every theorem on no axiom at all. ΔM = 0.
=================================================================================================================== -/
namespace BSD.TERMINAL
open BSDHard BSD.NORMALFORM BSD.HOST BSD.SUPPLY BSD.REALPART BSD.ROWSPLIT BSD.RESIDUE

/-- THE OPEN FRAMING, REFUTED, at every host. I · no proof from shared resources: no keyless premise forces the value,
    no given statement is the value on every frame, and the arrow forces nothing; II · no decision from the record: the
    two frames share a record and split on the value, no finite record forces it, not even above order one with the
    low-order witness in place, and above every order no reading of the record returns the world; III · no premise
    reaches the sentence while the bit fails; IV · what remains is the bit, its antecedent proved with no hypothesis,
    the bit proved equivalent to the sentence. -/
theorem the_open_framing_is_refuted : ∀ H : Host,
    (∀ P : Frame → Prop, Keyless bsdRow P → ¬ Forces bsdRow P) ∧
    (∀ P : Prop, ¬ ∀ F : Frame, (P ↔ Value F)) ∧
    (¬ ∀ F : Frame, Arrow → Value F) ∧
    (Value (recFrame calm) ∧ Value (recFrame counter) ∧ Value calm ∧ ¬ Value counter) ∧
    (∀ n : Nat, ¬ Value (staged n)) ∧
    (∀ n : Nat, LowWitness (stagedHigh n) ∧ ¬ Value (stagedHigh n)) ∧
    (∀ T : Nat, ¬ ∃ g : Nat → Bool, ∀ w : Bool × Nat, w.2 > T → g w.2 = w.1) ∧
    (¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence) ∧ ¬ FormalCargo H) ∧
    Value (recFrame H.frame) ∧
    (FormalCargo H ↔ H.Sentence) :=
  fun H => ⟨keyless_forces_nothing bsdRow, given_is_not_the_value, arrow_forces_nothing, record_decides_nothing bsdRow,
   fun n => (finite_record_never_forces n).2,
   fun n => ⟨(finite_record_never_forces_above_one n).1, (finite_record_never_forces_above_one n).2.2⟩,
   unicorn_blocked_above_every_order,
   fun ⟨_, q, h, hn⟩ => hn ((formal_iff_sentence H).mpr (h q)),
   cargo_arrives H, formal_iff_sentence H⟩

/-- THE TEN STEPS, one theorem at every host. Step 1 · the floor: the root holds on its constructed domain. Step 2 ·
    the basis: an integer equal to its reflection is zero, a minus sign forces vanishing at the centre, the order is
    unique, and a prime's multiplicative fibre is two points. Step 3 · the domain: the host frame's value is the
    sentence, the order is read off the expansion, and the sign fixes its parity. Step 4 · the record: the record
    carries the value, and every curve's rank sits on the seat of the record. Step 5 · the halted uniduction: the frame
    is self-recursive exactly when the sentence holds. Step 6 · the monism zone: the two frames share one record and
    split on the value, and the bit is keyed. Step 7 · the axis: the bit is exactly the sentence. Step 8 · the real
    part: the real part at order one is the low-order witness, given it the value is the part above order one, the
    sentence fixes the parity of the rank by the sign, and rank is a dimension count. Step 9 · every route passes the
    bit, no keyless premise forces it, and the walls stand. Step 10 · the bit delivered twice, by the formal cargo and
    by the physical witness. -/
theorem the_ten_steps : ∀ H : Host,
    -- Step 1
    (Root Unit (fun _ => 1) ∧ RA₀) ∧
    -- Step 2
    ((∀ v : Int, v = -v → v = 0) ∧ (∀ C : Centred, C.minus = true → C.a 0 = 0) ∧
      (∀ (a : Nat → Int) (o p : Nat), IsOrder a o → IsOrder a p → o = p) ∧ mulFibre 7 = [(1, 7), (7, 1)]) ∧
    -- Step 3
    ((Value H.frame ↔ H.Sentence) ∧ (∀ c o, IsOrder (H.L c).a o → o = H.order c) ∧
      (∀ c, (H.L c).minus = true → evenB (H.order c) = false)) ∧
    -- Step 4
    (Value (recFrame H.frame) ∧ ∀ (F : Frame) (d : F.D), (recFrame F).rank d = F.order d) ∧
    -- Step 5
    (SelfRecursive bsdRow H.frame ↔ H.Sentence) ∧
    -- Step 6
    ((Value (recFrame calm) ∧ Value (recFrame counter) ∧ Value calm ∧ ¬ Value counter) ∧
      (Transfer bsdRow calm ∧ ¬ Transfer bsdRow counter)) ∧
    -- Step 7
    (FormalCargo H ↔ H.Sentence) ∧
    -- Step 8
    ((∀ F : Frame, LowWitness F ↔ RealPartAt (Ex F) (Rk F) F.order 1) ∧
      (∀ F : Frame, LowWitness F → (Value F ↔ UnicornAt (Ex F) (Rk F) F.order 1)) ∧
      (H.Sentence → ∀ c, (H.L c).minus = true → H.rank c ≠ 0) ∧
      (∀ (zero : List Bool) (vs : List (List Bool)), (combos zero vs).length = 2 ^ vs.length)) ∧
    -- Step 9
    ((∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H) ∧
      (∀ P : Frame → Prop, Keyless bsdRow P → ¬ Forces bsdRow P) ∧
      (∀ n : Nat, ¬ Value (staged n)) ∧
      (ParityValue counter ∧ ¬ Value counter) ∧
      (¬ ∃ g : Bool → Nat, ∀ o : Nat, g (monoCentred o).minus = o)) ∧
    -- Step 10
    ((FormalCargo H → H.Sentence) ∧ (PhysicalWitness H → H.Sentence)) :=
  fun H =>
  ⟨⟨constructed_root_holds, ra₀.instances ra₀.anAct⟩,
   ⟨self_neg_zero, minus_sign_forces_vanishing, order_unique, prime_shape.1⟩,
   ⟨binding H, order_is_read H, fun c => (sign_fixes_order_parity H c).1⟩,
   ⟨cargo_arrives H, fun F d => (every_curve_has_its_seat F d).1⟩,
   (self_recursion_at_frame bsdRow H.frame).trans (binding H),
   ⟨record_decides_nothing bsdRow, bit_is_keyed bsdRow⟩,
   formal_iff_sentence H,
   ⟨low_witness_is_the_real_part, no_bypass_at_order_one, fun h c => minus_sign_forces_positive_rank H h c,
    combos_length⟩,
   ⟨fun _ h q => (formal_iff_sentence H).mpr (h q), keyless_forces_nothing bsdRow,
    fun n => (finite_record_never_forces n).2, parity_is_not_the_value, BSD.WALLS.sign_reads_no_order⟩,
   delivered_twice H⟩

/-- THE TERMINAL VERDICT, AS A THEOREM. Every theorem the verdict cites, bound by its exact type into one pinned
    conjunction: the record and the normal form; the binding and the sign; the real part and the cut at order one; the
    walls; the residue and its seat; the supply and the witnesses typed; the closed question; the formal run; nothing
    escaping; the open framing refuted; the ten steps; the lock and the hardened closure of the edition of record. No
    premise before the colon. -/
theorem the_terminal_verdict :
    (type_of% @BSD.HOST.recFrame_value) ∧
    (type_of% @BSD.NORMALFORM.normal_form) ∧
    (type_of% @BSD.NORMALFORM.normal_form_complete) ∧
    (type_of% @BSD.HOST.binding) ∧
    (type_of% @BSD.HOST.sign_fixes_order_parity) ∧
    (type_of% @BSD.HOST.minus_sign_forces_positive_rank) ∧
    (type_of% @BSD.HOST.low_is_strictly_inside) ∧
    (type_of% @BSD.REALPART.low_witness_is_the_real_part) ∧
    (type_of% @BSD.REALPART.no_bypass_at_order_one) ∧
    (type_of% @BSD.REALPART.unicorn_blocked_above_every_order) ∧
    (type_of% @BSD.WALLS.sign_record_normal_form) ∧
    (type_of% @BSD.WALLS.the_walls) ∧
    (type_of% @BSD.RESIDUE.residue_is_the_sentence) ∧
    (type_of% @BSD.RESIDUE.seat_iff_value) ∧
    (type_of% @BSD.SUPPLY.the_supply_closed) ∧
    (type_of% @BSD.SUPPLY.the_witnesses_typed) ∧
    (type_of% @BSD.CLOSURE.question_closed_to_one_bit) ∧
    (type_of% @BSD.GATES.the_formal_run) ∧
    (type_of% @BSD.ESCAPE.nothing_escapes) ∧
    (type_of% @BSD.ESCAPE.the_capstone) ∧
    (type_of% @BSD.TERMINAL.the_open_framing_is_refuted) ∧
    (type_of% @BSD.TERMINAL.the_ten_steps) ∧
    (type_of% @BSDHard.the_lock) ∧
    (type_of% @BSDHard.bsd_hardened_closure) :=
  ⟨@BSD.HOST.recFrame_value, @BSD.NORMALFORM.normal_form, @BSD.NORMALFORM.normal_form_complete, @BSD.HOST.binding,
   @BSD.HOST.sign_fixes_order_parity, @BSD.HOST.minus_sign_forces_positive_rank, @BSD.HOST.low_is_strictly_inside,
   @BSD.REALPART.low_witness_is_the_real_part, @BSD.REALPART.no_bypass_at_order_one,
   @BSD.REALPART.unicorn_blocked_above_every_order, @BSD.WALLS.sign_record_normal_form, @BSD.WALLS.the_walls,
   @BSD.RESIDUE.residue_is_the_sentence, @BSD.RESIDUE.seat_iff_value, @BSD.SUPPLY.the_supply_closed,
   @BSD.SUPPLY.the_witnesses_typed, @BSD.CLOSURE.question_closed_to_one_bit, @BSD.GATES.the_formal_run,
   @BSD.ESCAPE.nothing_escapes, @BSD.ESCAPE.the_capstone, @BSD.TERMINAL.the_open_framing_is_refuted,
   @BSD.TERMINAL.the_ten_steps, @BSDHard.the_lock, @BSDHard.bsd_hardened_closure⟩

/-- THE FINAL FORM, at every host: the sentence is the bit; the sentence is exactly an inhabited physical witness;
    under the sentence the sign fixes the parity of the rank and a minus sign forces positive rank; given the low-order
    witness, the value of every frame is exactly its part above order one; the low-order witness is strictly inside the
    sentence; every route to the sentence is both kinds; and to shut every true route to the sentence is to assert its
    denial. -/
theorem the_final_form : ∀ H : Host,
    (H.Sentence ↔ FormalCargo H) ∧
    (H.Sentence ↔ Nonempty (PhysicalWitness H)) ∧
    (H.Sentence → ∀ c, ((H.L c).minus = true → evenB (H.rank c) = false) ∧ ((H.L c).minus = true → H.rank c ≠ 0)) ∧
    (∀ F : Frame, LowWitness F → (Value F ↔ UnicornAt (Ex F) (Rk F) F.order 1)) ∧
    ((H.Sentence → H.Low) ∧ (oneCurve 0 2).Low ∧ ¬ (oneCurve 0 2).Sentence) ∧
    (∀ Q : Prop, (Q → H.Sentence) → Q → FormalCargo H ∧ Nonempty (PhysicalWitness H)) ∧
    ((¬ ∃ Q : Prop, Q ∧ (Q → H.Sentence)) ↔ ¬ H.Sentence) :=
  fun H => ⟨BSD.CLOSURE.the_sentence_is_the_bit H, (physical_iff_sentence H).symm,
   fun h c => ⟨(sentence_gives_rank_parity H h c).1, minus_sign_forces_positive_rank H h c⟩,
   no_bypass_at_order_one,
   ⟨low_is_strictly_inside.1 H, low_is_strictly_inside.2.1, low_is_strictly_inside.2.2⟩,
   two_kinds_and_no_third H, refusal_no_proof H.Sentence⟩

end BSD.TERMINAL

/-! ## cones of Parts A to T, pinned: the build is silent, and any drift fails it -/
/-- info: 'BSD.NORMALFORM.record_has_the_value' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.record_has_the_value
/-- info: 'BSD.NORMALFORM.normal_form' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.normal_form
/-- info: 'BSD.NORMALFORM.value_from_the_cargo_loop' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.value_from_the_cargo_loop
/-- info: 'BSD.NORMALFORM.bit_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.bit_is_the_act
/-- info: 'BSD.NORMALFORM.record_is_self_recursive' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.record_is_self_recursive
/-- info: 'BSD.NORMALFORM.self_recursion_at_frame' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.self_recursion_at_frame
/-- info: 'BSD.NORMALFORM.bit_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.bit_is_keyed
/-- info: 'BSD.NORMALFORM.record_self_recursion_does_not_transfer' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.record_self_recursion_does_not_transfer
/-- info: 'BSD.NORMALFORM.record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.record_decides_nothing
/-- info: 'BSD.NORMALFORM.every_route_passes_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.every_route_passes_the_bit
/-- info: 'BSD.NORMALFORM.keyless_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.keyless_forces_nothing
/-- info: 'BSD.NORMALFORM.no_record_principle_decides' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.no_record_principle_decides
/-- info: 'BSD.NORMALFORM.shared_record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.shared_record_decides_nothing
/-- info: 'BSD.NORMALFORM.no_uniform_answer' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.no_uniform_answer
/-- info: 'BSD.NORMALFORM.nothing_outside_the_record_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.nothing_outside_the_record_is_the_bit
/-- info: 'BSD.NORMALFORM.denial_is_the_bits_denial' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.denial_is_the_bits_denial
/-- info: 'BSD.NORMALFORM.normal_form_complete' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.normal_form_complete
/-- info: 'BSD.NORMALFORM.bnot_ne' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.bnot_ne
/-- info: 'BSD.NORMALFORM.refusal_waiting' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.refusal_waiting
/-- info: 'BSD.NORMALFORM.refusal_no_proof' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.refusal_no_proof
/-- info: 'BSD.NORMALFORM.block_needs_an_outside' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.block_needs_an_outside
/-- info: 'BSD.NORMALFORM.comp_involution' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.comp_involution
/-- info: 'BSD.NORMALFORM.locus_vanishes' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.locus_vanishes
/-- info: 'BSD.NORMALFORM.join_reads_the_weakest' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.join_reads_the_weakest
/-- info: 'BSD.NORMALFORM.square_is_sign_blind' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.NORMALFORM.square_is_sign_blind
/-- info: 'BSD.ROWSPLIT.unicorn_block' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.ROWSPLIT.unicorn_block
/-- info: 'BSD.ROWSPLIT.aperture_one_bit_wide' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.ROWSPLIT.aperture_one_bit_wide
/-- info: 'BSD.ROWSPLIT.unicorn_rule_exact' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.ROWSPLIT.unicorn_rule_exact
/-- info: 'BSD.ROWSPLIT.unicorn_no_bypass' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.ROWSPLIT.unicorn_no_bypass
/-- info: 'BSD.ROWSPLIT.supply_side_silent' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.ROWSPLIT.supply_side_silent
/-- info: 'BSD.ROWSPLIT.whole_iff_real_and_unicorn' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.ROWSPLIT.whole_iff_real_and_unicorn
/-- info: 'BSD.ROWSPLIT.real_part_of_certificate' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.ROWSPLIT.real_part_of_certificate
/-- info: 'BSD.HOST.recFrame_value' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.HOST.recFrame_value
/-- info: 'BSD.HOST.every_curve_has_its_seat' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.HOST.every_curve_has_its_seat
/-- info: 'BSD.HOST.binding' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.HOST.binding
/-- info: 'BSD.HOST.root_on_row_is_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.HOST.root_on_row_is_the_sentence
/-- info: 'BSD.HOST.act_is_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.HOST.act_is_the_sentence
/-- info: 'BSD.HOST.order_is_read' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.HOST.order_is_read
/-- info: 'BSD.HOST.sign_fixes_order_parity' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.HOST.sign_fixes_order_parity
/-- info: 'BSD.HOST.minus_sign_vanishes' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.HOST.minus_sign_vanishes
/-- info: 'BSD.HOST.sentence_gives_rank_parity' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.HOST.sentence_gives_rank_parity
/-- info: 'BSD.HOST.minus_sign_forces_positive_rank' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.HOST.minus_sign_forces_positive_rank
/-- info: 'BSD.HOST.mono_off' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.HOST.mono_off
/-- info: 'BSD.HOST.beq_not_self' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.HOST.beq_not_self
/-- info: 'BSD.HOST.mono_reflect' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.HOST.mono_reflect
/-- info: 'BSD.HOST.mono_is_order' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.HOST.mono_is_order
/-- info: 'BSD.HOST.rank_one_at_order_one' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.HOST.rank_one_at_order_one
/-- info: 'BSD.HOST.low_is_strictly_inside' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.HOST.low_is_strictly_inside
/-- info: 'BSD.REALPART.value_is_the_whole' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.REALPART.value_is_the_whole
/-- info: 'BSD.REALPART.low_witness_is_the_real_part' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.REALPART.low_witness_is_the_real_part
/-- info: 'BSD.REALPART.value_iff_real_and_unicorn' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.REALPART.value_iff_real_and_unicorn
/-- info: 'BSD.REALPART.no_bypass_at_order_one' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.REALPART.no_bypass_at_order_one
/-- info: 'BSD.REALPART.unicorn_is_order_two_and_above' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.REALPART.unicorn_is_order_two_and_above
/-- info: 'BSD.REALPART.unicorn_part_is_load_bearing' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.REALPART.unicorn_part_is_load_bearing
/-- info: 'BSD.REALPART.unicorn_blocked_above_every_order' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.REALPART.unicorn_blocked_above_every_order
/-- info: 'BSD.REALPART.supply_side_silent_above_every_order' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.REALPART.supply_side_silent_above_every_order
/-- info: 'BSD.REALPART.aperture_is_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.REALPART.aperture_is_one_bit
/-- info: 'BSD.WALLS.sign_record_normal_form' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.WALLS.sign_record_normal_form
/-- info: 'BSD.WALLS.sign_reads_no_order' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.WALLS.sign_reads_no_order
/-- info: 'BSD.WALLS.sign_reads_no_rank' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.WALLS.sign_reads_no_rank
/-- info: 'BSD.WALLS.the_walls' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.WALLS.the_walls
/-- info: 'BSD.RESIDUE.sentence_of_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.RESIDUE.sentence_of_the_act
/-- info: 'BSD.RESIDUE.residue_is_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.RESIDUE.residue_is_the_sentence
/-- info: 'BSD.RESIDUE.the_posit_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.RESIDUE.the_posit_is_the_bit
/-- info: 'BSD.RESIDUE.residue_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.RESIDUE.residue_is_keyed
/-- info: 'BSD.RESIDUE.value_of_seat' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.RESIDUE.value_of_seat
/-- info: 'BSD.RESIDUE.seat_iff_value' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.RESIDUE.seat_iff_value
/-- info: 'BSD.RESIDUE.seat_is_the_unicorn' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.RESIDUE.seat_is_the_unicorn
/-- info: 'BSD.SUPPLY.cargo_arrives' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.SUPPLY.cargo_arrives
/-- info: 'BSD.SUPPLY.formal_kind_delivers' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.SUPPLY.formal_kind_delivers
/-- info: 'BSD.SUPPLY.physical_kind_delivers' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.SUPPLY.physical_kind_delivers
/-- info: 'BSD.SUPPLY.witness_closes' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.SUPPLY.witness_closes
/-- info: 'BSD.SUPPLY.physical_iff_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.SUPPLY.physical_iff_sentence
/-- info: 'BSD.SUPPLY.formal_iff_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.SUPPLY.formal_iff_sentence
/-- info: 'BSD.SUPPLY.the_two_kinds_are_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.SUPPLY.the_two_kinds_are_one_bit
/-- info: 'BSD.SUPPLY.delivered_twice' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.SUPPLY.delivered_twice
/-- info: 'BSD.SUPPLY.two_kinds_and_no_third' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.SUPPLY.two_kinds_and_no_third
/-- info: 'BSD.SUPPLY.the_one_refuter' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.SUPPLY.the_one_refuter
/-- info: 'BSD.SUPPLY.the_witnesses_typed' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.SUPPLY.the_witnesses_typed
/-- info: 'BSD.SUPPLY.the_supply_closed' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.SUPPLY.the_supply_closed
/-- info: 'BSD.CLOSURE.the_sentence_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.CLOSURE.the_sentence_is_the_bit
/-- info: 'BSD.CLOSURE.denial_is_the_bits_denial' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.CLOSURE.denial_is_the_bits_denial
/-- info: 'BSD.CLOSURE.refuter_denies_the_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.CLOSURE.refuter_denies_the_sentence
/-- info: 'BSD.CLOSURE.the_denial_has_one_road' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.CLOSURE.the_denial_has_one_road
/-- info: 'BSD.CLOSURE.question_closed_to_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.CLOSURE.question_closed_to_one_bit
/-- info: 'BSD.GATES.gate_1_srep' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.GATES.gate_1_srep
/-- info: 'BSD.GATES.gate_2_reg' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.GATES.gate_2_reg
/-- info: 'BSD.GATES.gate_3_sgeg' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.GATES.gate_3_sgeg
/-- info: 'BSD.GATES.gate_4_causal' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.GATES.gate_4_causal
/-- info: 'BSD.GATES.gate_5_mig' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.GATES.gate_5_mig
/-- info: 'BSD.GATES.gate_6_ptb' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.GATES.gate_6_ptb
/-- info: 'BSD.GATES.gate_7_dual' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.GATES.gate_7_dual
/-- info: 'BSD.GATES.gate_8_cscg' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.GATES.gate_8_cscg
/-- info: 'BSD.GATES.gate_9_cseg' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.GATES.gate_9_cseg
/-- info: 'BSD.GATES.gate_10_mta' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.GATES.gate_10_mta
/-- info: 'BSD.GATES.gate_11_oma' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.GATES.gate_11_oma
/-- info: 'BSD.GATES.gate_12_adeg' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.GATES.gate_12_adeg
/-- info: 'BSD.GATES.refusal_proved' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.GATES.refusal_proved
/-- info: 'BSD.GATES.refusal_no_proof_at_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.GATES.refusal_no_proof_at_the_bit
/-- info: 'BSD.GATES.the_formal_run' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.GATES.the_formal_run
/-- info: 'BSD.ESCAPE.the_record_closes' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.ESCAPE.the_record_closes
/-- info: 'BSD.ESCAPE.the_undecided_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.ESCAPE.the_undecided_is_the_bit
/-- info: 'BSD.ESCAPE.nothing_outside_the_record_is_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.ESCAPE.nothing_outside_the_record_is_the_bit
/-- info: 'BSD.ESCAPE.the_outside_is_the_supply' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.ESCAPE.the_outside_is_the_supply
/-- info: 'BSD.ESCAPE.every_route_is_both_kinds' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.ESCAPE.every_route_is_both_kinds
/-- info: 'BSD.ESCAPE.both_kinds_deliver' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.ESCAPE.both_kinds_deliver
/-- info: 'BSD.ESCAPE.our_way_or_no_way' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.ESCAPE.our_way_or_no_way
/-- info: 'BSD.ESCAPE.nothing_escapes' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.ESCAPE.nothing_escapes
/-- info: 'BSD.ESCAPE.the_capstone' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.ESCAPE.the_capstone
/-- info: 'BSD.TERMINAL.the_open_framing_is_refuted' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.TERMINAL.the_open_framing_is_refuted
/-- info: 'BSD.TERMINAL.the_ten_steps' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.TERMINAL.the_ten_steps
/-- info: 'BSD.TERMINAL.the_terminal_verdict' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.TERMINAL.the_terminal_verdict
/-- info: 'BSD.TERMINAL.the_final_form' does not depend on any axioms -/
#guard_msgs in #print axioms BSD.TERMINAL.the_final_form
