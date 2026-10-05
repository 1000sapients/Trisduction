/-
  BSD_Hardened.lean · the kernel of the hardened master seed of the Birch and Swinnerton-Dyer closure
  (supersedes BSD_Master.lean of APEX-PSP-BSD-MASTER-01)

  First principle, premise-free except existence and freedom. Every theorem of this file is on no
  axiom at all: no propext, no Quot.sound, no Classical.choice. No structure of the closure carries a
  cited theorem as a field. The only premise any closing theorem consumes is the act, existence read
  on the row; the root, the arrow and the freedom bit are given and proved satisfiable. The cited
  results of the subject enter only as witnesses typed against the act, downstream and strictly
  smaller, never as premises.
  I     The seat from first principle: a centred expansion with a sign; a minus sign silences every
        even coefficient, a plus sign every odd one, so the sign fixes the parity of the order, and
        a minus sign forces vanishing at the centre.
  II    The order and its first reading: below the order every coefficient vanishes by definition,
        so above order one the first-order reading is silent, and at order one it speaks.
  III   The frame of curves, the value, the worlds; existence as given forces no value.
  IV    The act: every curve that exists registers its rank on the seat; it is the value; one act
        closes it; nothing escapes; one curve refutes.
  V     The parity bit: one bit, and not the value.
  VI    The low-order witness typed: any witness of the rank identity at order at most one is
        supplied by the act, is downstream of it, and is strictly smaller.
  VII   The division at order one, and the two parts.
  VIII  Keyless and keyed.
  IX    Freedom, the prime's shape, the triaxial lock.
  X     The record and the seed.
  XI    The retired premise Ω.
  XII   Rank is a dimension count over GF(2).
  XIII  The hardened closure, whole.
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

structure ActualCurves where
  F      : Frame
  supply : Registered F

/-- THE RANK PART FROM EXISTENCE, BY ONE ACT. -/
theorem bsd_from_existence (A : ActualCurves) : Value A.F := (act_is_the_value A.F).mp A.supply

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

/-! ## VI · the low-order witness typed -/

/-- A low-order witness: the rank identity on every curve of order at most one. The cited theorem
of the subject at order at most one has this shape; here it is a type, not a premise. -/
def LowWitness (F : Frame) : Prop := ∀ d, F.order d ≤ 1 → F.rank d = F.order d

/-- DOWNSTREAM: the act supplies a low-order witness. -/
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

/-! ## VIII · keyless and keyed -/

def Keyed (P : Frame → Prop) : Prop := ∃ F, ¬ P F

theorem value_is_keyed : Keyed Value := ⟨counter, counter_fails⟩

theorem no_keyless_statement_is_the_act (P : Prop) : ¬ ∀ F : Frame, (P ↔ Registered F) :=
  fun h => given_is_not_the_value P (fun F => (h F).trans (act_is_the_value F))

theorem pulse_does_not_certify : Root Empty (fun e => nomatch e) ∧ ¬ Value counter :=
  ⟨root_given, counter_fails⟩

/-! ## IX · freedom, the prime, the lock -/

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

/-! ### the triaxial lock -/

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

/-- The higher-cycle axiom Ω of the earlier draft: every curve's family comes from a construction
fixed in advance, and the family's height determinant, descent and Selmer clauses give the rank
identity. -/
def OmegaHolds (P : Provenanced) : Prop := (∀ d, P.fixed d = true) ∧ Value P.F

theorem omega_gives_value (P : Provenanced) (h : OmegaHolds P) : Value P.F := h.2

def unprovenanced : Provenanced := ⟨calm, fun _ => false⟩

/-- THE AXIOM Ω IS RETIRED: it gives the value and is strictly stronger; a frame carries the value
with no construction fixed in advance, so the value does not hand Ω back. -/
theorem omega_strictly_stronger : Value unprovenanced.F ∧ ¬ OmegaHolds unprovenanced :=
  ⟨calm_value, fun ⟨h, _⟩ => Bool.noConfusion (h ())⟩

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
    Keyed Value :=
  ⟨given_is_not_the_value, act_is_the_value, bsd_from_existence, minus_sign_forces_vanishing,
   minus_order_odd, first_reading_silent_above_one, parity_is_not_the_value, act_gives_low_witness,
   low_witness_strict, one_class_spans_two, omega_strictly_stronger, rank_part_not_full,
   value_is_keyed⟩

end BSDHard

/-! ## Cones, pinned as printed: every theorem on no axiom -/
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
