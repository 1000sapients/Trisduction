/-
  THE BRIDGE FROM FIRST PRINCIPLE · the kernel. Core Lean 4.19.0, no import, no library, no axiom declared,
  no sorry. One fold, one registration, one bit: the RA–RAM Bridge, the heat floor and the ninth-gate crossing
  read as three maps of one cut, on the chart, on the multiplicative cut, and on the heat flow.
  The Ground is the one premise and it enters as data: existence is actuation, read as no-cessation, P1, the
  whole merges no two states. It appears as a named hypothesis wherever it is used and nowhere else.
  No named human result is a premise. Every cone is printed and pinned at the foot of the file.
-/
set_option autoImplicit false
namespace BFP

/-! ## I · The chart, the fold, the registration: the atom of the Bridge -/

/-- A point is (d, t): d its offset from the line, t its height. The line is d = 0. -/
abbrev Point := Int × Int
/-- The fold: s ↦ 1 − s̄ on the offset chart, (d, t) ↦ (−d, t). -/
def fold (p : Point) : Point := (-p.1, p.2)
/-- The line: offset zero. -/
def onLine (p : Point) : Prop := p.1 = 0
/-- The registration: it keeps the height and forgets the side. -/
def reg (p : Point) : Point := (0, p.2)

/-- Integer negation is an involution, by the integer's constructors. -/
theorem neg_neg_free : ∀ d : Int, - -d = d
  | Int.ofNat 0 => rfl
  | Int.ofNat (_ + 1) => rfl
  | Int.negSucc _ => rfl

/-- An integer equal to its own negation is zero, by the integer's constructors. -/
theorem neg_self_zero : ∀ d : Int, -d = d → d = 0
  | Int.ofNat 0, _ => rfl
  | Int.ofNat (_ + 1), h => Int.noConfusion h
  | Int.negSucc _, h => Int.noConfusion h

/-- The fold is an involution. -/
theorem fold_involutive (p : Point) : fold (fold p) = p := by
  obtain ⟨d, t⟩ := p
  show (- -d, t) = (d, t)
  rw [neg_neg_free d]

/-- THE CUT IS THE LINE: the fold fixes a point exactly when it is on the line. -/
theorem the_cut_is_the_line (p : Point) : fold p = p ↔ onLine p := by
  obtain ⟨d, t⟩ := p
  exact ⟨fun h => neg_self_zero d (congrArg Prod.fst h), fun h => by cases h; rfl⟩

/-- The registration lands on the line. -/
theorem reg_lands (p : Point) : onLine (reg p) := rfl
/-- The registration keeps the height. -/
theorem reg_keeps_height (p : Point) : (reg p).2 = p.2 := rfl
/-- The registration forgets the side: a point and its partner leave one record. -/
theorem reg_forgets_side (p : Point) : reg (fold p) = reg p := rfl

/-- The registration erases nothing at a point exactly when the point is on the line. -/
theorem reg_erases_nothing_iff (p : Point) : reg p = p ↔ onLine p := by
  obtain ⟨d, t⟩ := p
  exact ⟨fun h => (congrArg Prod.fst h).symm, fun h => by cases h; rfl⟩

/-- Off the line, the fold moves the point and the two worlds share one record. -/
theorem off_line_pair (p : Point) (h : ¬ onLine p) : fold p ≠ p ∧ reg (fold p) = reg p :=
  ⟨fun e => h ((the_cut_is_the_line p).mp e), rfl⟩

/-- ONE BIT IS LOST: off the line, no map from records to points returns both the point and its partner. -/
theorem one_bit_lost (p : Point) (h : ¬ onLine p) :
    ¬ ∃ g : Point → Point, g (reg p) = p ∧ g (reg (fold p)) = fold p :=
  fun ⟨_, h1, h2⟩ => h ((the_cut_is_the_line p).mp (h2.symm.trans h1))

/-- A configuration: a set of points. Closed: the fold carries it to itself. -/
abbrev Config := Point → Prop
def Closed (S : Config) : Prop := ∀ p, S p → S (fold p)
/-- The value: every point of the configuration is on the line. -/
def Value (S : Config) : Prop := ∀ p, S p → onLine p
/-- Least erasure: the registration leaves every point of the configuration unchanged. -/
def LeastErasure (S : Config) : Prop := ∀ p, S p → reg p = p

/-- LEAST ERASURE IS THE VALUE: one property, read twice. -/
theorem least_erasure_iff_value (S : Config) : LeastErasure S ↔ Value S :=
  ⟨fun h p hp => (reg_erases_nothing_iff p).mp (h p hp), fun h p hp => (reg_erases_nothing_iff p).mpr (h p hp)⟩

/-- NOTHING ESCAPES LEAST ERASURE: the atom, whole. -/
theorem nothing_escapes_least_erasure :
    (∀ p : Point, fold (fold p) = p) ∧ (∀ p : Point, fold p = p ↔ onLine p) ∧
    (∀ p : Point, onLine (reg p) ∧ (reg p).2 = p.2 ∧ reg (fold p) = reg p) ∧
    (∀ p : Point, reg p = p ↔ onLine p) ∧
    (∀ p : Point, ¬ onLine p → ¬ ∃ g : Point → Point, g (reg p) = p ∧ g (reg (fold p)) = fold p) ∧
    (∀ S : Config, LeastErasure S ↔ Value S) :=
  ⟨fold_involutive, the_cut_is_the_line, fun p => ⟨reg_lands p, reg_keeps_height p, reg_forgets_side p⟩,
   reg_erases_nothing_iff, one_bit_lost, least_erasure_iff_value⟩

/-! ## II · The reader's frame: the act, the record, the bit, the weakest premise -/

/-- The record of a configuration: what the registration leaves. -/
def Rec (S : Config) (q : Point) : Prop := ∃ p, S p ∧ reg p = q
def SameRecord (S S' : Config) : Prop := ∀ q, Rec S q ↔ Rec S' q
/-- The registered world of a point and its pair world. -/
def registered (p : Point) : Config := fun s => s = reg p
def pairWorld (p : Point) : Config := fun s => s = p ∨ s = fold p

theorem pair_world_closed (p : Point) : Closed (pairWorld p) := fun _ hs =>
  match hs with
  | Or.inl e => Or.inr (congrArg fold e)
  | Or.inr e => Or.inl (e ▸ fold_involutive p)

theorem registered_closed (p : Point) : Closed (registered p) := fun s hs => by
  show fold s = reg p
  rw [hs]; rfl

/-- The registered world and the pair world leave one record. -/
theorem one_record (p : Point) : SameRecord (registered p) (pairWorld p) := fun q =>
  ⟨fun ⟨_, hs, hq⟩ => ⟨p, Or.inl rfl, by rw [← hq, hs]; rfl⟩,
   fun ⟨_, hs, hq⟩ => ⟨reg p, rfl, by
      rw [← hq]
      exact match hs with
        | Or.inl e => by rw [e]; rfl
        | Or.inr e => by rw [e]; rfl⟩⟩

theorem registered_has_value (p : Point) : Value (registered p) := fun s hs => by
  rw [hs]; exact reg_lands p

theorem pair_world_lacks_value (p : Point) (h : ¬ onLine p) : ¬ Value (pairWorld p) :=
  fun hv => h (hv p (Or.inl rfl))

/-- THE RECORD DECIDES NOTHING: for every point off the line, no reading that respects the record returns the
    value on both its registered world and its pair world. -/
theorem record_decides_nothing (p : Point) (h : ¬ onLine p) (g : Config → Prop)
    (hg : ∀ S S', SameRecord S S' → (g S ↔ g S')) :
    ¬ ((g (registered p) ↔ Value (registered p)) ∧ (g (pairWorld p) ↔ Value (pairWorld p))) :=
  fun ⟨h1, h2⟩ => pair_world_lacks_value p h
    (h2.mp ((hg _ _ (one_record p)).mp (h1.mpr (registered_has_value p))))

/-- A KEYLESS PREMISE FORCES NOTHING: a property true on every closed configuration never forces the value. -/
theorem keyless_forces_nothing (Q : Config → Prop) (hQ : ∀ S, Closed S → Q S) :
    ¬ ∀ S, Closed S → Q S → Value S :=
  fun hall => pair_world_lacks_value (1, 0) (fun e => by cases e)
    (hall _ (pair_world_closed (1, 0)) (hQ _ (pair_world_closed (1, 0))))

/-- THE WEAKEST FORCING PREMISE: a premise that forces the value and follows from it is the value. -/
theorem weakest_forcing_premise (P : Config → Prop) (forces : ∀ S, P S → Value S)
    (weaker : ∀ S, Value S → P S) : ∀ S, P S ↔ Value S :=
  fun S => ⟨forces S, weaker S⟩

/-- THE ACT. The bit is supplied once, in the open, as a field of a type: a closed configuration with least
    erasure at it. The field is the value supplied; the type makes the supply visible to every reader. -/
structure ActualZeros where
  zeros : Config
  closed : Closed zeros
  supply : LeastErasure zeros

/-- FROM THE ACT, THE VALUE. -/
theorem value_from_the_act (Z : ActualZeros) : Value Z.zeros :=
  fun p hp => (reg_erases_nothing_iff p).mp (Z.supply p hp)

/-- THE READER'S FRAME, whole: (a) from the supplied bit the value follows; (b) no reading of the record decides
    the value off the line; (c) the supplied bit is the value on every configuration; (d) nothing weaker than the
    value forces it; (e) no property true on every closed configuration forces it. -/
theorem reader_frame :
    (∀ Z : ActualZeros, Value Z.zeros) ∧
    (∀ (p : Point), ¬ onLine p → ∀ g : Config → Prop, (∀ S S', SameRecord S S' → (g S ↔ g S')) →
      ¬ ((g (registered p) ↔ Value (registered p)) ∧ (g (pairWorld p) ↔ Value (pairWorld p)))) ∧
    (∀ S : Config, LeastErasure S ↔ Value S) ∧
    (∀ P : Config → Prop, (∀ S, P S → Value S) → (∀ S, Value S → P S) → ∀ S, P S ↔ Value S) ∧
    (∀ Q : Config → Prop, (∀ S, Closed S → Q S) → ¬ ∀ S, Closed S → Q S → Value S) :=
  ⟨value_from_the_act, record_decides_nothing, least_erasure_iff_value, weakest_forcing_premise,
   keyless_forces_nothing⟩


/-! ## II.b · The record and its fibre: least erasure as leastness -/

/-- The record of a configuration, read as a configuration, stands on the line. -/
theorem record_is_lossless (S : Config) : Value (Rec S) := fun _ ⟨_, _, hq⟩ => hq ▸ rfl
/-- The record has the record of the configuration it came from. -/
theorem record_same (S : Config) : SameRecord S (Rec S) := fun q =>
  ⟨fun ⟨p, hp, hq⟩ => ⟨q, ⟨p, hp, hq⟩, hq ▸ rfl⟩,
   fun ⟨_, ⟨p, hp, hr⟩, hq⟩ => ⟨p, hp, by rw [← hq, ← hr]; rfl⟩⟩
/-- Least erasure in the record's form: the configuration is extremal in its fibre, so whenever it has a point
    off the line, every configuration of the same record has one too. -/
def Extremal (S : Config) : Prop :=
  ∀ S', SameRecord S S' → (∃ p, S p ∧ ¬ onLine p) → ∃ p, S' p ∧ ¬ onLine p
/-- LEASTNESS IS THE VALUE: extremal in the fibre exactly when every point is on the line. -/
theorem extremal_iff_value (S : Config) : Extremal S ↔ Value S := by
  constructor
  · intro h p hp
    exact if hl : p.1 = 0 then hl else
      absurd (h (Rec S) (record_same S) ⟨p, hp, hl⟩)
        (fun ⟨q, hq, hn⟩ => hn (record_is_lossless S q hq))
  · intro hv _ _ ⟨p, hp, hn⟩
    exact absurd (hv p hp) hn
/-- EVERY RECORD IS CARRIED BY ONE LEAST-ERASURE CONFIGURATION AND ONLY ONE: a configuration on the line with the
    record of S is the record of S, point for point. -/
theorem record_carried_uniquely (S S' : Config) (hs : SameRecord S' S) (hv : Value S') :
    ∀ q, S' q ↔ Rec S q := fun q =>
  ⟨fun h => (hs q).mp ⟨q, h, (reg_erases_nothing_iff q).mpr (hv q h)⟩,
   fun h => match (hs q).mpr h with
     | ⟨r, hr, hrq⟩ => by
       have e : reg r = r := (reg_erases_nothing_iff r).mpr (hv r hr)
       rw [← hrq, e]; exact hr⟩

/-! ## III · The Bridge: frames, the carrier, the socket, and the denial asymmetry -/

/-- A frame: a carrier set, a fold that is an involution, and a zero predicate the fold preserves. -/
structure Frame where
  S : Type
  τ : S → S
  Z : S → Prop
  involutive : ∀ s, τ (τ s) = s
  symmetric : ∀ s, Z s → Z (τ s)

/-- The line property of a frame: every zero is fixed by the fold. -/
def LineProperty (X : Frame) : Prop := ∀ s, X.Z s → X.τ s = s

/-- The chart as a frame, for any closed configuration. -/
def chartFrame (S : Config) (hS : Closed S) : Frame := ⟨Point, fold, S, fold_involutive, hS⟩

/-- THE LOCUS MEETS THE FRAME: on the chart the line property is the value. -/
theorem chart_line_property (S : Config) (hS : Closed S) : LineProperty (chartFrame S hS) ↔ Value S :=
  ⟨fun h p hp => (the_cut_is_the_line p).mp (h p hp), fun h p hp => (the_cut_is_the_line p).mpr (h p hp)⟩

/-- Three values of a carrier's state: true, false, and halted on the bit. -/
inductive Tri | tt | ff | bot

/-- The carrier: a state and a shadow tying the halted state to the line property in both directions. -/
structure Carrier (X : Frame) where
  terminal : Tri
  shadow : terminal = .bot ↔ LineProperty X

/-- CANNOT LIE. -/
theorem cannot_lie (X : Frame) (b : Carrier X) (h : b.terminal = .bot) : LineProperty X := b.shadow.mp h
/-- CANNOT DEVIATE. -/
theorem cannot_deviate (X : Frame) (b : Carrier X) (t : LineProperty X) : b.terminal = .bot := b.shadow.mpr t
/-- CANNOT BE MANUFACTURED: a halted carrier exists on a frame exactly when the line property holds there. -/
theorem halted_iff (X : Frame) : (∃ b : Carrier X, b.terminal = .bot) ↔ LineProperty X :=
  ⟨fun ⟨b, h⟩ => b.shadow.mp h, fun t => ⟨⟨.bot, ⟨fun _ => t, fun _ => rfl⟩⟩, rfl⟩⟩
/-- CANNOT BE REVERSED: deletion to the halted state has no left inverse. -/
def delete : Tri → Tri := fun _ => .bot
theorem cannot_reverse : ¬ ∃ g : Tri → Tri, ∀ v, g (delete v) = v :=
  fun ⟨_, hg⟩ => Tri.noConfusion ((hg .tt).symm.trans (hg .ff))
/-- CANNOT BE EXTENDED: a bit generates only itself, its mirror, and the two constants. -/
theorem cannot_extend (f : Bool → Bool) :
    f = (fun x => x) ∨ f = (fun x => !x) ∨ f = (fun _ => true) ∨ f = (fun _ => false) := by
  cases ht : f true <;> cases hf : f false
  · exact Or.inr (Or.inr (Or.inr (funext fun x => by cases x <;> assumption)))
  · exact Or.inr (Or.inl (funext fun x => by cases x <;> assumption))
  · exact Or.inl (funext fun x => by cases x <;> assumption)
  · exact Or.inr (Or.inr (Or.inl (funext fun x => by cases x <;> assumption)))

/-- The two-point frame: one off-line pair under the fold. Both frame laws hold and the line property fails:
    the denial of the line property is a coherent structure. -/
def twoPoint : Frame := ⟨Bool, (fun b => !b), fun _ => True, fun b => by cases b <;> rfl, fun _ _ => trivial⟩
theorem denial_is_coherent :
    (∀ b : Bool, twoPoint.τ (twoPoint.τ b) = b) ∧ (∀ b : Bool, twoPoint.τ b ≠ b) ∧ ¬ LineProperty twoPoint :=
  ⟨twoPoint.involutive, fun b => by cases b <;> (intro h; cases h), fun h => by have := h true trivial; cases this⟩

/-- A frame property is keyless when it holds on every frame; keyed when some frame inhabits its denial. -/
def Keyless (Q : Frame → Prop) : Prop := ∀ X, Q X
def Keyed (Q : Frame → Prop) : Prop := ∃ X, ¬ Q X
/-- THE DISCRIMINATOR: every frame property is keyless or keyed, and never both. -/
theorem discriminator (Q : Frame → Prop) : (Keyless Q ∨ Keyed Q) ∧ ¬ (Keyless Q ∧ Keyed Q) :=
  ⟨Classical.byCases (fun h : ∀ X, Q X => Or.inl h)
     (fun h => Or.inr (Classical.byContradiction fun hn =>
        h fun X => Classical.byContradiction fun hq => hn ⟨X, hq⟩)),
   fun ⟨hk, ⟨X, hX⟩⟩ => hX (hk X)⟩
/-- The fold law is keyless; the line property is keyed. -/
theorem symmetry_is_keyless : Keyless (fun X => ∀ s, X.τ (X.τ s) = s) := fun X => X.involutive
theorem line_property_is_keyed : Keyed LineProperty ∧ ¬ Keyless LineProperty :=
  ⟨⟨twoPoint, denial_is_coherent.2.2⟩, fun h => denial_is_coherent.2.2 (h twoPoint)⟩

/-- THE SOCKET: an instance of the supplied term is exactly the line property. -/
class Supplied (X : Frame) where
  term : LineProperty X
theorem socket_is_the_property (X : Frame) : Nonempty (Supplied X) ↔ LineProperty X :=
  ⟨fun ⟨i⟩ => i.term, fun t => ⟨⟨t⟩⟩⟩
theorem no_socket_off_line : ¬ Nonempty (Supplied twoPoint) :=
  fun h => denial_is_coherent.2.2 ((socket_is_the_property twoPoint).mp h)
/-- The act and the socket are one: a supplied configuration seats a halted carrier on its chart frame. -/
theorem act_seats_the_carrier (Z : ActualZeros) : ∃ b : Carrier (chartFrame Z.zeros Z.closed), b.terminal = .bot :=
  (halted_iff _).mpr ((chart_line_property Z.zeros Z.closed).mpr (value_from_the_act Z))

/-! ## IV · Three, twelve, eight, and the ninth -/

/-- GF(2) rows: a 3×3 system locks (one solution for every target) exactly when its determinant is one. -/
def det2 (r1 r2 r3 : Nat × Nat × Nat) : Nat :=
  (r1.1 * (r2.2.1 * r3.2.2 + r2.2.2 * r3.2.1)
     + r1.2.1 * (r2.1 * r3.2.2 + r2.2.2 * r3.1)
     + r1.2.2 * (r2.1 * r3.2.1 + r2.2.1 * r3.1)) % 2
def gf2Vecs : List (Nat × Nat × Nat) := (List.range 8).map (fun n => (n / 4 % 2, n / 2 % 2, n % 2))
def dot2 (r v : Nat × Nat × Nat) : Nat := (r.1 * v.1 + r.2.1 * v.2.1 + r.2.2 * v.2.2) % 2
/-- Solutions of a two-row system: two planes. -/
def sols2 (r1 r2 : Nat × Nat × Nat) (t1 t2 : Nat) : Nat :=
  (gf2Vecs.filter (fun v => dot2 r1 v == t1 && dot2 r2 v == t2)).length
def row3 (n : Nat) : Nat × Nat × Nat := (n / 4 % 2, n / 2 % 2, n % 2)

set_option maxRecDepth 100000 in
/-- TWO AXES NEVER LOCK: no two-row system over GF(2), for any target, has exactly one solution. -/
theorem two_axes_never_lock :
    (List.range 64).all (fun m => (List.range 4).all (fun t =>
      sols2 (row3 (m / 8)) (row3 (m % 8)) (t / 2) (t % 2) != 1)) = true := by decide

set_option maxRecDepth 100000 in
/-- THREE AXES LOCK: of the 512 three-row systems, 168 have determinant one, each locking all eight targets. -/
theorem three_axes_lock :
    ((List.range 512).filter (fun m => det2 (row3 (m / 64)) (row3 (m / 8 % 8)) (row3 (m % 8)) == 1)).length = 168 ∧
    (List.range 512).all (fun m => det2 (row3 (m / 64)) (row3 (m / 8 % 8)) (row3 (m % 8)) != 1 ||
      gf2Vecs.all (fun t => (gf2Vecs.filter (fun v => dot2 (row3 (m / 64)) v == t.1 &&
        dot2 (row3 (m / 8 % 8)) v == t.2.1 && dot2 (row3 (m % 8)) v == t.2.2)).length == 1)) = true := by
  decide

/-- The quaternion units on integer coordinates. -/
structure Q4 where
  r : Int
  i : Int
  j : Int
  k : Int
  deriving DecidableEq
def qmul (a b : Q4) : Q4 :=
  ⟨a.r*b.r - a.i*b.i - a.j*b.j - a.k*b.k,
   a.r*b.i + a.i*b.r + a.j*b.k - a.k*b.j,
   a.r*b.j - a.i*b.k + a.j*b.r + a.k*b.i,
   a.r*b.k + a.i*b.j - a.j*b.i + a.k*b.r⟩
/-- THE THIRD IS BEGOTTEN: i j = k, i j k = −1, and i j ≠ j i. -/
theorem third_begotten :
    qmul ⟨0,1,0,0⟩ ⟨0,0,1,0⟩ = ⟨0,0,0,1⟩ ∧ qmul (qmul ⟨0,1,0,0⟩ ⟨0,0,1,0⟩) ⟨0,0,0,1⟩ = ⟨-1,0,0,0⟩ ∧
    qmul ⟨0,1,0,0⟩ ⟨0,0,1,0⟩ ≠ qmul ⟨0,0,1,0⟩ ⟨0,1,0,0⟩ := by decide

/-- Cayley–Dickson doubling on integer coordinates. -/
def cdconj : List Int → List Int
  | [] => []
  | a :: rest => a :: rest.map (fun x => -x)
def padd (a b : List Int) : List Int := List.zipWith (· + ·) a b
def psub (a b : List Int) : List Int := List.zipWith (· - ·) a b
def cdmul : Nat → List Int → List Int → List Int
  | 0, _, _ => []
  | _ + 1, [a], [b] => [a * b]
  | fuel + 1, a, b =>
      let n := a.length / 2
      psub (cdmul fuel (a.take n) (b.take n)) (cdmul fuel (cdconj (b.drop n)) (a.drop n)) ++
      padd (cdmul fuel (b.drop n) (a.take n)) (cdmul fuel (a.drop n) (cdconj (b.take n)))
def e (n i : Nat) : List Int := (List.range n).map (fun j => if j == i then 1 else 0)

set_option maxRecDepth 100000 in
/-- NO FOURTH, BY TWO WALLS: associativity fails at eight dimensions, [e1, e2, e4] = 2 e7, and division fails at
    sixteen, (e1 + e10)(e5 + e14) = 0 with both factors nonzero. -/
theorem no_fourth_axis :
    psub (cdmul 4 (cdmul 4 (e 8 1) (e 8 2)) (e 8 4)) (cdmul 4 (e 8 1) (cdmul 4 (e 8 2) (e 8 4)))
      = (e 8 7).map (fun x => 2 * x) ∧
    cdmul 5 (padd (e 16 1) (e 16 10)) (padd (e 16 5) (e 16 14)) = List.replicate 16 0 := by decide

/-- The rotations of the tetrahedron as even permutations of four vertices. -/
def invCount (σ : List Nat) : Nat :=
  let idx := List.range σ.length
  ((idx.flatMap (fun a => (idx.filter (fun b => a < b)).map (fun b => (a, b)))).filter
    (fun p => σ.getD p.1 0 > σ.getD p.2 0)).length
def perms24 : List (List Nat) :=
  [[0,1,2,3],[0,1,3,2],[0,2,1,3],[0,2,3,1],[0,3,1,2],[0,3,2,1],
   [1,0,2,3],[1,0,3,2],[1,2,0,3],[1,2,3,0],[1,3,0,2],[1,3,2,0],
   [2,0,1,3],[2,0,3,1],[2,1,0,3],[2,1,3,0],[2,3,0,1],[2,3,1,0],
   [3,0,1,2],[3,0,2,1],[3,1,0,2],[3,1,2,0],[3,2,0,1],[3,2,1,0]]
def a4 : List (List Nat) := perms24.filter (fun σ => invCount σ % 2 == 0)
def gates : List (Nat × Nat) :=
  [(0,1),(0,2),(0,3),(1,0),(1,2),(1,3),(2,0),(2,1),(2,3),(3,0),(3,1),(3,2)]

set_option maxRecDepth 100000 in
/-- TWELVE: twelve rotations, twelve directed gates, and exactly one rotation carries any gate to any gate. -/
theorem twelve_gates_one_torsor :
    a4.length = 12 ∧ gates.length = 12 ∧
    gates.all (fun g => gates.all (fun h =>
      (a4.filter (fun σ => (σ.getD g.1 0, σ.getD g.2 0) == h)).length == 1)) = true := by decide

/-- The eight sign patterns on three axes, total negation, and parity. -/
def cube : List (Bool × Bool × Bool) :=
  [false, true].flatMap fun a => [false, true].flatMap fun b => [false, true].map fun c => (a, b, c)
def neg3 (s : Bool × Bool × Bool) : Bool × Bool × Bool := (!s.1, !s.2.1, !s.2.2)
def par3 (s : Bool × Bool × Bool) : Nat :=
  (if s.1 then 1 else 0) + (if s.2.1 then 1 else 0) + (if s.2.2 then 1 else 0)
/-- The orientation of a sign pattern, the determinant of its diagonal: −1 to the number of flips. -/
def orient (s : Bool × Bool × Bool) : Int := if par3 s % 2 == 0 then 1 else -1

/-- EIGHT: eight patterns; the squared orientation, the lock scalar, reads one on all eight; total negation moves
    every pattern, undoes itself, and joins each even pattern to an odd one. -/
theorem eight_patterns_four_orbits :
    cube.length = 8 ∧ cube.all (fun s => orient s * orient s == 1) = true ∧
    cube.all (fun s => neg3 s != s && neg3 (neg3 s) == s && orient (neg3 s) == -orient s) = true := by decide

/-- THE NINTH IS NOT A REFLECTION: no group of sign patterns, on any number of axes, has nine elements. -/
theorem no_reflection_group_of_nine : ∀ k : Nat, 2 ^ k ≠ 9
  | 0, h => Nat.noConfusion (Nat.succ.inj h)
  | k + 1, h =>
    have e : 2 ^ (k + 1) % 2 = 0 := Nat.mul_mod_left (2 ^ k) 2
    have e2 : 2 ^ (k + 1) % 2 = 9 % 2 := congrArg (· % 2) h
    Nat.noConfusion (e.symm.trans e2 : 0 = 1)

/-- The ordered factor pairs of n, by first factor; the swap sends a to n / a. -/
def pairs (n : Nat) : List Nat := (List.range (n + 1)).filter (fun a => 0 < a && n % a == 0)
def seats (n : Nat) : Nat := ((pairs n).filter (fun a => a * a == n)).length

set_option maxRecDepth 100000 in
/-- THE NINTH IS THE SEAT: thirty-six has nine ordered factor pairs, four free orbits and one seat (6, 6). -/
theorem nine_is_eight_and_a_seat :
    (pairs 36).length = 9 ∧ seats 36 = 1 ∧ ((pairs 36).filter (fun a => a * a != 36)).length = 8 ∧
    (pairs 36).all (fun a => (pairs 36).contains (36 / a) && 36 / (36 / a) == a) = true := by decide

set_option maxHeartbeats 4000000 in
set_option maxRecDepth 200000 in
/-- ODD EXACTLY WHEN SEATED: for every n from 1 to 200 the fibre is odd exactly when it holds a seat, and it
    never holds two. -/
theorem odd_fibre_iff_seat :
    (List.range 201).all (fun n => n == 0 ||
      ((pairs n).length % 2 == seats n % 2 && seats n ≤ 1)) = true := by decide

/-! ## V · The three legs on one orbit: forget, pay, supply -/

/-! ### Pay: the floor, from P1 and counting -/
def ND : List Nat → Prop
  | [] => True
  | x :: r => x ∉ r ∧ ND r
def AllLt (M : Nat) : List Nat → Prop
  | [] => True
  | x :: r => x < M ∧ AllLt M r

theorem allLt_mem (M : Nat) : ∀ (l : List Nat) (y : Nat), AllLt M l → y ∈ l → y < M
  | [], _, _, m => nomatch m
  | x :: r, y, h, m => by
    cases m with
    | head => exact h.1
    | tail _ hm => exact allLt_mem M r y h.2 hm

theorem nd_map (h : Nat → Nat) : ∀ l : List Nat, ND l → (∀ a ∈ l, ∀ b ∈ l, h a = h b → a = b) → ND (l.map h)
  | [], _, _ => trivial
  | x :: r, hnd, hinj => by
    refine ⟨fun m => ?_, nd_map h r hnd.2 (fun a ha b hb e => hinj a (List.Mem.tail x ha) b (List.Mem.tail x hb) e)⟩
    obtain ⟨y, hy, e⟩ := List.mem_map.mp m
    have : y = x := hinj y (List.Mem.tail x hy) x (List.Mem.head r) e
    exact hnd.1 (this ▸ hy)

theorem allLt_map (h : Nat → Nat) (M : Nat) : ∀ l : List Nat, (∀ a ∈ l, h a < M) → AllLt M (l.map h)
  | [], _ => trivial
  | x :: r, hb => ⟨hb x (List.Mem.head r), allLt_map h M r (fun a ha => hb a (List.Mem.tail x ha))⟩

/-- PIGEONHOLE: distinct numbers all below M number at most M. -/
theorem pigeonhole : ∀ (l : List Nat) (M : Nat), ND l → AllLt M l → l.length ≤ M
  | [], _, _, _ => Nat.zero_le _
  | x :: r, M, hnd, hlt => by
    have hx : x < M := hlt.1
    let sw : Nat → Nat := fun y => if y = M - 1 then x else y
    have hbound : ∀ a ∈ r, sw a < M - 1 := by
      intro a ha
      have haM := allLt_mem M r a hlt.2 ha
      have hax : a ≠ x := fun e => hnd.1 (e ▸ ha)
      show (if a = M - 1 then x else a) < M - 1
      by_cases e : a = M - 1
      · rw [if_pos e]
        have : x ≠ M - 1 := fun e2 => hax (e.trans e2.symm)
        omega
      · rw [if_neg e]; omega
    have hinj : ∀ a ∈ r, ∀ b ∈ r, sw a = sw b → a = b := by
      intro a ha b hb e
      have hax : a ≠ x := fun e2 => hnd.1 (e2 ▸ ha)
      have hbx : b ≠ x := fun e2 => hnd.1 (e2 ▸ hb)
      change (if a = M - 1 then x else a) = (if b = M - 1 then x else b) at e
      by_cases ea : a = M - 1 <;> by_cases eb : b = M - 1
      · rw [ea, eb]
      · rw [if_pos ea, if_neg eb] at e; exact absurd e.symm hbx
      · rw [if_neg ea, if_pos eb] at e; exact absurd e hax
      · rw [if_neg ea, if_neg eb] at e; exact e
    have ih := pigeonhole (r.map sw) (M - 1) (nd_map sw r hnd.2 hinj) (allLt_map sw (M - 1) r hbound)
    rw [List.length_map] at ih
    show r.length + 1 ≤ M
    omega

/-- THE EXPORT. The whole was C × F; the step merges nothing (P1); the content halves. The freedom doubles. -/
theorem export_doubles (L : List Nat) (step : Nat → Nat) (C F C' F' : Nat) (hnd : ND L)
    (hwhole : L.length = C * F) (P1 : ∀ a ∈ L, ∀ b ∈ L, step a = step b → a = b)
    (cells : ∀ a ∈ L, step a < C' * F') (hhalf : C = 2 * C') (hpos : 0 < C') : 2 * F ≤ F' := by
  have hb := pigeonhole (L.map step) (C' * F') (nd_map step L hnd P1) (allLt_map step _ L cells)
  rw [List.length_map, hwhole, hhalf, Nat.mul_assoc, Nat.mul_left_comm] at hb
  exact Nat.le_of_mul_le_mul_left hb hpos

theorem one_bit_arrives (b b' : Nat) (h : 2 * 2 ^ b ≤ 2 ^ b') : b + 1 ≤ b' := by
  refine Nat.lt_of_not_le fun hle => ?_
  have h1 := Nat.pow_le_pow_right (by decide : 0 < 2) hle
  have h2 := Nat.pow_pos (n := b) (by decide : 0 < 2)
  omega

/-- The price of exported freedom in native units: temperature is energy per bit, so b bits cost b·T. -/
def price (T bits : Nat) : Nat := bits * T

/-- FROM COUNT TO HEAT. Under P1 a halving of the content exports at least one bit, which costs at least one T. -/
theorem count_to_heat (L : List Nat) (step : Nat → Nat) (C C' b b' T : Nat) (hnd : ND L)
    (hwhole : L.length = C * 2 ^ b) (P1 : ∀ a ∈ L, ∀ x ∈ L, step a = step x → a = x)
    (cells : ∀ a ∈ L, step a < C' * 2 ^ b') (hhalf : C = 2 * C') (hpos : 0 < C') :
    b + 1 ≤ b' ∧ price T 1 ≤ price T (b' - b) := by
  have hb := one_bit_arrives b b' (export_doubles L step C (2 ^ b) C' (2 ^ b') hnd hwhole P1 cells hhalf hpos)
  exact ⟨hb, Nat.mul_le_mul_right T (by omega)⟩

/-- P1 IS LOAD-BEARING: a step that merges lets the content halve with no freedom exported. -/
theorem merge_exports_nothing :
    [0, 1].length = 2 * 2 ^ 0 ∧ (∀ a ∈ [0, 1], (fun _ : Nat => 0) a < 1 * 2 ^ 0) ∧
    ¬ (∀ a ∈ [0, 1], ∀ x ∈ [0, 1], (fun _ : Nat => (0 : Nat)) a = (fun _ : Nat => (0 : Nat)) x → a = x) := by
  refine ⟨rfl, ?_, ?_⟩
  · intro a _; show 0 < 1 * 2 ^ 0; decide
  · intro h; exact absurd (h 0 (List.Mem.head _) 1 (List.Mem.tail _ (List.Mem.head _)) rfl) (by decide)

/-- A finite configuration: the heights of its zeros on the line, and its off-line pairs, each an offset that is not
    zero and a height. -/
structure FinCfg where
  line : List Int
  pairs : List (Int × Int)
  offset_ne : ∀ q ∈ pairs, q.1 ≠ 0
def FinCfg.pts (F : FinCfg) : Config := fun p => (p.1 = 0 ∧ p.2 ∈ F.line) ∨ ∃ q ∈ F.pairs, p = q ∨ p = fold q
/-- The erased bits of a finite configuration: one per off-line pair, two points registered to one. -/
def erased (F : FinCfg) : Nat := F.pairs.length

theorem fincfg_closed (F : FinCfg) : Closed F.pts := fun p hp =>
  match hp with
  | Or.inl ⟨hl, ht⟩ => Or.inl ⟨by show -p.1 = 0; rw [hl]; rfl, ht⟩
  | Or.inr ⟨q, hq, Or.inl e⟩ => Or.inr ⟨q, hq, Or.inr (congrArg fold e)⟩
  | Or.inr ⟨q, hq, Or.inr e⟩ => Or.inr ⟨q, hq, Or.inl (by rw [e]; exact fold_involutive q)⟩

/-- LEAST ERASURE IS ZERO ERASED BITS: "least" is a count. -/
theorem least_erasure_iff_zero_erased (F : FinCfg) : LeastErasure F.pts ↔ erased F = 0 := by
  constructor
  · intro h
    unfold erased
    cases hp : F.pairs with
    | nil => rfl
    | cons q r =>
      have hq : q ∈ F.pairs := by rw [hp]; exact List.Mem.head r
      exact absurd ((reg_erases_nothing_iff q).mp (h q (Or.inr ⟨q, hq, Or.inl rfl⟩))) (F.offset_ne q hq)
  · intro h p hp
    have hnil : F.pairs = [] := List.eq_nil_of_length_eq_zero h
    rcases hp with ⟨hl, _⟩ | ⟨q, hq, _⟩
    · exact (reg_erases_nothing_iff p).mpr hl
    · rw [hnil] at hq; cases hq

/-- THE HEAT OF REGISTRATION IS ZERO EXACTLY AT THE VALUE: registering a finite configuration costs one T per
    off-line pair, and it costs nothing exactly when every point stands on the line. -/
theorem price_zero_iff_value (F : FinCfg) (T : Nat) (hT : 0 < T) : price T (erased F) = 0 ↔ Value F.pts := by
  constructor
  · intro h p hp
    have h0 : erased F = 0 := by
      cases he : erased F with
      | zero => rfl
      | succ k => rw [he] at h; exact absurd h (Nat.pos_iff_ne_zero.mp (Nat.mul_pos (Nat.succ_pos k) hT))
    exact (reg_erases_nothing_iff p).mp ((least_erasure_iff_zero_erased F).mpr h0 p hp)
  · intro hv
    have h0 := (least_erasure_iff_zero_erased F).mp (fun p hp => (reg_erases_nothing_iff p).mpr (hv p hp))
    show erased F * T = 0
    rw [h0, Nat.zero_mul]

/-- Each further off-line pair adds one T: the total is the erased bits times the floor. -/
theorem price_counts_pairs (F : FinCfg) (T : Nat) : price T (erased F) = F.pairs.length * T := rfl

/-- The measure of freedom: additivity taken over zero is dry. f (0 · n) = f 0 + f n forces f to vanish. -/
theorem additivity_over_zero_is_dry (f : Nat → Nat) (hmul : ∀ m n, f (m * n) = f m + f n) : ∀ n, f n = 0 := by
  intro n
  have h := hmul 0 n
  rw [Nat.zero_mul] at h
  omega

/-- THE LOG IS FORCED: additivity on positive arguments makes a measure linear on every tower; the unit is the
    only choice, and fixing one bit at 2 makes it the bit count. -/
theorem linear_on_tower (f : Nat → Nat) (hmul : ∀ m n, 0 < m → 0 < n → f (m * n) = f m + f n)
    (v : Nat) (hv : 0 < v) : ∀ a, f (v ^ a) = a * f v
  | 0 => by
    have h := hmul 1 1 (by decide) (by decide)
    show f 1 = 0 * f v
    rw [Nat.mul_one] at h; rw [Nat.zero_mul]; omega
  | a + 1 => by
    rw [Nat.pow_succ, hmul _ _ (Nat.pow_pos (n := a) hv) hv, linear_on_tower f hmul v hv a, Nat.succ_mul]

theorem bits_forced (f : Nat → Nat) (hmul : ∀ m n, 0 < m → 0 < n → f (m * n) = f m + f n)
    (h2 : f 2 = 1) : ∀ a, f (2 ^ a) = a :=
  fun a => by rw [linear_on_tower f hmul 2 (by decide) a, h2, Nat.mul_one]

/-- The two-adic valuation: the count of the bit 2 in a number. -/
def v2 : Nat → Nat
  | 0 => 0
  | n + 1 => if (n + 1) % 2 = 0 then v2 ((n + 1) / 2) + 1 else 0
decreasing_by omega

theorem v2_mul_two (n : Nat) (hn : 0 < n) : v2 (2 * n) = v2 n + 1 := by
  obtain ⟨k, rfl⟩ : ∃ k, n = k + 1 := ⟨n - 1, by omega⟩
  have e : 2 * (k + 1) = (2 * k + 1) + 1 := by omega
  rw [e, v2]
  have h1 : (2 * k + 1 + 1) % 2 = 0 := by omega
  have h2 : (2 * k + 1 + 1) / 2 = k + 1 := by omega
  rw [if_pos h1, h2]

theorem v2_odd (n : Nat) (h : n % 2 = 1) : v2 n = 0 := by
  cases n with
  | zero => exact absurd h (by decide)
  | succ k => rw [v2, if_neg (by omega)]

theorem v2_two : v2 2 = 1 := by
  have e := v2_mul_two 1 (by decide)
  rw [v2_odd 1 (by decide)] at e
  exact e

theorem v2_split : ∀ n, 0 < n → ∃ u, u % 2 = 1 ∧ n = 2 ^ v2 n * u := by
  intro n
  induction n using Nat.strongRecOn with
  | ind n ih =>
    intro hn
    by_cases hp : n % 2 = 0
    · obtain ⟨m, rfl⟩ : ∃ m, n = 2 * m := ⟨n / 2, by omega⟩
      have hm : 0 < m := by omega
      obtain ⟨u, hu, e⟩ := ih m (by omega) hm
      refine ⟨u, hu, ?_⟩
      rw [v2_mul_two m hm, Nat.pow_succ]
      calc 2 * m = 2 * (2 ^ v2 m * u) := by rw [← e]
        _ = 2 ^ v2 m * 2 * u := by rw [Nat.mul_comm 2, Nat.mul_assoc, Nat.mul_comm u 2, ← Nat.mul_assoc]
    · refine ⟨n, by omega, ?_⟩
      rw [v2_odd n (by omega)]; simp

theorem v2_pow_odd (k u : Nat) (hu : u % 2 = 1) : v2 (2 ^ k * u) = k := by
  induction k with
  | zero => simp; exact v2_odd u hu
  | succ j ih =>
    have hpos : 0 < 2 ^ j * u := Nat.mul_pos (Nat.pow_pos (n := j) (by decide : 0 < 2)) (by omega)
    rw [Nat.pow_succ, Nat.mul_comm (2 ^ j) 2, Nat.mul_assoc, v2_mul_two _ hpos, ih]

/-- The two-adic valuation is additive on positive arguments. -/
theorem v2_additive (m n : Nat) (hm : 0 < m) (hn : 0 < n) : v2 (m * n) = v2 m + v2 n := by
  obtain ⟨u, hu, em⟩ := v2_split m hm
  obtain ⟨w, hw, en⟩ := v2_split n hn
  have huw : (u * w) % 2 = 1 := by rw [Nat.mul_mod, hu, hw]
  have e : m * n = 2 ^ (v2 m + v2 n) * (u * w) := by
    calc m * n = (2 ^ v2 m * u) * (2 ^ v2 n * w) := by rw [← em, ← en]
      _ = (2 ^ v2 m * 2 ^ v2 n) * (u * w) := by rw [Nat.mul_assoc, Nat.mul_left_comm u, ← Nat.mul_assoc]
      _ = 2 ^ (v2 m + v2 n) * (u * w) := by rw [Nat.pow_add]
  rw [e, v2_pow_odd _ _ huw]

/-! ### Supply: the wall, the calibration, the crossing -/
def Even {α : Type} (σ : α → α) (f : α → Bool) : Prop := ∀ x, f (σ x) = f x

/-- THE WALL: an even reading never equals a target odd at a point. -/
theorem wall {α : Type} (σ : α → α) (f d : α → Bool) (x : α) (he : Even σ f) (ho : d (σ x) ≠ d x) : f ≠ d :=
  fun h => by subst h; exact ho (he x)

/-- THE CALIBRATION: one supplied odd witness fixes the bit, and fixes it uniquely. -/
theorem calibration {α : Type} (σ : α → α) (s d : α → Bool) (x : α) (hs : s (σ x) = !s x) (hd : d (σ x) = !d x) :
    ∃ c : Bool, (d x = xor (s x) c ∧ d (σ x) = xor (s (σ x)) c) ∧
      ∀ c', (d x = xor (s x) c' ∧ d (σ x) = xor (s (σ x)) c') → c' = c := by
  refine ⟨xor (d x) (s x), ⟨by cases s x <;> cases d x <;> rfl, by rw [hs, hd]; cases s x <;> cases d x <;> rfl⟩, ?_⟩
  intro c' hc; obtain ⟨h1, -⟩ := hc
  generalize hsx : s x = sv at h1; generalize hdx : d x = dv at h1
  cases sv <;> cases dv <;> cases c' <;> first | rfl | exact absurd h1 (by decide)

/-- The executed frame: a formal content and the bit of whether it ran. Reading the content is formal. -/
abbrev Exec (Q : Type) := Bool × Q
def run {Q : Type} (s : Exec Q) : Exec Q := (!s.1, s.2)
def formalRead {Q : Type} (s : Exec Q) : Q := s.2
def ran {Q : Type} (s : Exec Q) : Bool := s.1

/-- EVERY FORMAL READING IS EVEN. -/
theorem formal_never_odd {Q : Type} (g : Q → Bool) : Even (run (Q := Q)) (fun s => g (formalRead s)) :=
  fun _ => rfl
/-- A CONSTANT SUPPLIES NOTHING. -/
theorem constant_no_crossing {Q : Type} (b : Bool) (s : Exec Q) : ¬ ((fun _ : Exec Q => b) (run s) ≠ b) :=
  fun h => h rfl
/-- THE CROSSING WALL: no reading of the formal content returns whether it ran. -/
theorem no_reading_returns_the_deed {Q : Type} (q : Q) : ¬ ∃ g : Q → Bool, ∀ s : Exec Q, g (formalRead s) = ran s :=
  fun ⟨_, hg⟩ => Bool.noConfusion ((hg (true, q)).symm.trans (hg (false, q)))

/-- THE THREE LEGS ON ONE ORBIT. The orbit {(1, t), (−1, t)}, the seat (0, t). FORGET: both members register to the
    seat as one record. PAY: two distinct states sent injectively below F' need F' at least two. SUPPLY: for any
    target odd on the orbit, one calibration bit against the side reconstructs it, and only one. -/
def side (p : Point) : Bool := decide (0 < p.1)
theorem three_legs_one_orbit (t : Int) (d : Point → Bool) (hd : d (fold (1, t)) = !d (1, t)) :
    (onLine (reg (1, t)) ∧ reg (fold (1, t)) = reg (1, t) ∧ fold (1, t) ≠ (1, t)) ∧
    (∀ (F' : Nat) (step : Point → Nat), step (1, t) ≠ step (fold (1, t)) →
      step (1, t) < F' → step (fold (1, t)) < F' → 2 ≤ F') ∧
    (∃ c : Bool, (d (1, t) = xor (side (1, t)) c ∧ d (fold (1, t)) = xor (side (fold (1, t))) c) ∧
      ∀ c', (d (1, t) = xor (side (1, t)) c' ∧ d (fold (1, t)) = xor (side (fold (1, t))) c') → c' = c) := by
  refine ⟨⟨rfl, rfl, fun h => by cases (congrArg Prod.fst h)⟩, fun F' step hne h1 h2 => ?_, ?_⟩
  · match F', h1, h2 with
    | 0, h1, _ => exact absurd h1 (Nat.not_lt_zero _)
    | 1, h1, h2 => exact absurd ((Nat.le_zero.mp (Nat.le_of_lt_succ h1)).trans
        (Nat.le_zero.mp (Nat.le_of_lt_succ h2)).symm) hne
    | n + 2, _, _ => exact Nat.le_add_left 2 n
  · exact calibration fold side d (1, t) rfl hd

/-! ## VI · Primes: the Bridge on the multiplicative cut -/
def fib (n : Nat) : Nat := (pairs n).length
def isPrimeTrial (n : Nat) : Bool := 2 ≤ n && ((List.range n).filter (fun a => 2 ≤ a && n % a == 0)).isEmpty

set_option maxHeartbeats 4000000 in
set_option maxRecDepth 200000 in
/-- A PRIME IS ONE FREE ORBIT: for every n from 2 to 200, n is prime exactly when its ordered factor fibre has two
    points, and then no seat. -/
theorem prime_iff_one_free_orbit :
    (List.range 201).all (fun n => n < 2 || ((isPrimeTrial n == (fib n == 2)) && (!isPrimeTrial n || seats n == 0))) = true := by
  decide

/-- The six pairs of the parity frame: a prime and a semiprime with equal residues mod 420. -/
def k4 : List (Nat × Nat) := [(11, 851), (13, 1273), (17, 437), (19, 2119), (23, 1703), (29, 869)]
def lg2 : Nat → Nat → Nat
  | 0, _ => 0
  | k + 1, n => if n < 2 then 0 else lg2 k (n / 2) + 1

set_option maxRecDepth 100000 in
/-- THE PARITY FRAME: residues mod 420 merge each pair; the bits paid by registering the product separate it, one
    against two, and the parity of the bits paid is the sign: odd at the prime, even at the semiprime. -/
theorem parity_frame_paid_bits :
    k4.all (fun p => p.1 % 420 == p.2 % 420 && lg2 64 (fib p.1) == 1 && lg2 64 (fib p.2) == 2) = true := by
  decide

def divsN (n : Nat) : List Nat := (List.range (n + 1)).filter (fun d => 0 < d && n % d == 0)
def omegaIn (ps : List Nat) (d : Nat) : Nat := (ps.filter (fun p => d % p == 0)).length
def toggle (p d : Nat) : Nat := if d % p == 0 then d / p else d * p
def sig30 (d : Nat) : Bool × Bool × Bool := (d % 2 == 0, d % 3 == 0, d % 5 == 0)

set_option maxRecDepth 100000 in
/-- THE EIGHT ARE THE DIVISOR CUBE: the eight divisors of 30 are the eight sign patterns, one to one, and the
    Möbius sign is the orientation of the pattern. -/
theorem divisor_cube_is_sign_cube :
    divsN 30 = [1, 2, 3, 5, 6, 10, 15, 30] ∧ ((divsN 30).map sig30).eraseDups.length = 8 ∧
    (divsN 30).all (fun d => orient (sig30 d) == (if omegaIn [2, 3, 5] d % 2 == 0 then 1 else -1)) = true := by
  decide

set_option maxRecDepth 200000 in
/-- EVERY FINITE FIBRE BALANCES: on the 32 divisors of 2·3·5·7·11 the toggle of 2 is a free involution that flips
    the sign, so the signs balance sixteen against sixteen. -/
theorem fibre_balance :
    (divsN 2310).length = 32 ∧
    (divsN 2310).all (fun d => (divsN 2310).contains (toggle 2 d) && toggle 2 d != d &&
       toggle 2 (toggle 2 d) == d &&
       (omegaIn [2, 3, 5, 7, 11] d + omegaIn [2, 3, 5, 7, 11] (toggle 2 d)) % 2 == 1) = true ∧
    ((divsN 2310).filter (fun d => omegaIn [2, 3, 5, 7, 11] d % 2 == 0)).length = 16 := by decide

/-! ## VII · Wall, edge, seat -/

/-- The edge and the wall on the offset chart, d = 2 Re s − 1: the wall Re s = 1 is d = 1, the edge Re s = 0 is
    d = −1, and the fold exchanges them; the seat d = 0 is their midpoint. -/
theorem wall_and_edge_exchanged (t : Int) : fold (1, t) = (-1, t) ∧ fold (-1, t) = (1, t) ∧ onLine (0, t) :=
  ⟨rfl, rfl, rfl⟩

/-- Every prime's own mode p^d is unitary at exactly one depth: d = 0, the edge. -/
theorem prime_mode_unitary_iff (p d : Nat) (hp : 2 ≤ p) : p ^ d = 1 ↔ d = 0 := by
  constructor
  · intro h
    cases d with
    | zero => rfl
    | succ k =>
      have h1 : p ^ 1 ≤ p ^ (k + 1) := Nat.pow_le_pow_right (by omega) (by omega)
      rw [Nat.pow_one] at h1
      omega
  · intro h; rw [h]; rfl

/-- At s units of the floor per bit, the state 2^a weighs 2^(−a·s): s is the price per bit, and s = 1 is the
    floor itself. -/
theorem price_per_bit_tower (a s : Nat) : (2 ^ a) ^ s = 2 ^ (a * s) := (Nat.pow_mul 2 a s).symm

theorem len_le_sum : ∀ l : List Nat, (∀ x ∈ l, 1 ≤ x) → l.length ≤ l.sum
  | [], _ => Nat.le_refl 0
  | x :: r, h => by
    have hx := h x (List.Mem.head r)
    have ih := len_le_sum r (fun y hy => h y (List.Mem.tail x hy))
    simp only [List.length_cons, List.sum_cons]
    omega

/-- THE WALL OF COUNTING: the block (2^j, 2^(j+1)] of shares one-in-n holds, in units of 1/2^(j+1), at least
    2^j units, a half. Every block holds a half, so the shares of all states have no finite total at s = 1. -/
theorem wall_block_share (j : Nat) :
    2 ^ j ≤ ((List.range (2 ^ j)).map (fun i => 2 ^ (j + 1) / (2 ^ j + 1 + i))).sum := by
  have hlen : ((List.range (2 ^ j)).map (fun i => 2 ^ (j + 1) / (2 ^ j + 1 + i))).length = 2 ^ j := by simp
  have key := len_le_sum ((List.range (2 ^ j)).map (fun i => 2 ^ (j + 1) / (2 ^ j + 1 + i))) (by
    intro x hx
    obtain ⟨i, hi, rfl⟩ := List.mem_map.mp hx
    have hi' : i < 2 ^ j := List.mem_range.mp hi
    have hle : 2 ^ j + 1 + i ≤ 2 ^ (j + 1) := by rw [Nat.pow_succ]; omega
    exact (Nat.le_div_iff_mul_le (by omega)).mpr (by omega))
  rw [hlen] at key
  exact key

/-! ## VIII · The heat flow: the fold pulls every pair onto its seat -/

/-- Conjugation of the flow variable is the fold: with s = 1/2 + i z and Im z = y, the offset is d = −2y, and
    y ↦ −y sends d to −d. -/
theorem conjugation_is_the_fold (y : Int) : -2 * -y = -(-2 * y) := Int.mul_neg (-2) y

/-- The quadratic z^2 + b z + c under the flow c ↦ c − 2t. -/
def flow (t : Int) (q : Int × Int) : Int × Int := (q.1, q.2 - 2 * t)
theorem flow_inverse (t : Int) (q : Int × Int) : flow (-t) (flow t q) = q := by
  obtain ⟨b, c⟩ := q
  simp only [flow, Prod.mk.injEq, true_and]
  omega
/-- THE FLOW MERGES NOTHING: it is injective, so under the floor it exports nothing and costs nothing. -/
theorem flow_injective (t : Int) (p q : Int × Int) (h : flow t p = flow t q) : p = q := by
  rw [← flow_inverse t p, ← flow_inverse t q, h]
/-- The discriminant rises by exactly eight per unit of time. -/
theorem disc_flow (D c t : Int) : D - 4 * (c - 2 * t) = (D - 4 * c) + 8 * t := by omega
/-- The pull in squared form: the squared imaginary part of the pair of z^2 + c is c − 2t, falling by two per unit
    of time, which is the partner's pull −1/b on b. -/
theorem pull_in_square (c t : Int) : c - 2 * (t + 1) = (c - 2 * t) - 2 := by omega
/-- Collision, doubled time u = 2t: a pair while u < c, the seat at u = c, two fixed points after. -/
theorem collision_sign (c u : Int) :
    (u < c → 4 * u - 4 * c < 0) ∧ (u = c → 4 * u - 4 * c = 0) ∧ (c < u → 0 < 4 * u - 4 * c) :=
  ⟨fun _ => by omega, fun _ => by omega, fun _ => by omega⟩
/-- Zero slack: the double root on the seat leaves it under every backward step. -/
theorem zero_slack (t : Int) (ht : t < 0) : 0 - 4 * (0 - 2 * t) < 0 := by omega
/-- The only merge is the certificate: real-rootedness at a positive time takes one value on two states. -/
def realAt (t : Int) (q : Int × Int) : Bool := decide (0 ≤ q.1 * q.1 - 4 * (q.2 - 2 * t))
theorem certificate_merges : realAt 1 (0, 0) = realAt 1 (0, 1) ∧ ((0, 0) : Int × Int) ≠ (0, 1) ∧
    realAt 0 (0, 0) ≠ realAt 0 (0, 1) := by decide

/-! ## IX · The physical carrier -/

/-- Charge in thirds of the electron's charge; charge conjugation is negation; the carrier puts charge on the
    offset, d = Q, at resolution twelve. -/
def conj (q : Int) : Int := -q
def carrier (q : Int) : Point := (q, 0)
/-- The carrier is equivariant, neutral lands on the line, and the electron and positron are one off-line pair of
    one record. -/
theorem charge_carrier :
    (∀ q : Int, carrier (conj q) = fold (carrier q)) ∧ onLine (carrier 0) ∧ ¬ onLine (carrier (-3)) ∧
    fold (carrier (-3)) = carrier 3 ∧ reg (carrier 3) = reg (carrier (-3)) :=
  ⟨fun _ => rfl, rfl, fun h => (by decide : ¬ ((-3 : Int) = 0)) h, rfl, rfl⟩

/-! ## X · Inhabitation: every conditional law has a model of its hypotheses -/
theorem value_from_the_act_inhabited : Nonempty ActualZeros :=
  ⟨⟨onLine, fun p h => by show -p.1 = 0; rw [show p.1 = 0 from h]; rfl, fun p h => (reg_erases_nothing_iff p).mpr h⟩⟩
theorem off_line_inhabited : ∃ p : Point, ¬ onLine p := ⟨(1, 0), fun h => by cases h⟩
theorem weakest_forcing_premise_inhabited :
    ∃ P : Config → Prop, (∀ S, P S → Value S) ∧ (∀ S, Value S → P S) := ⟨Value, fun _ h => h, fun _ h => h⟩
theorem keyless_forces_nothing_inhabited : ∃ Q : Config → Prop, ∀ S, Closed S → Q S :=
  ⟨fun _ => True, fun _ _ => trivial⟩
theorem count_to_heat_inhabited :
    ND [0, 1] ∧ [0, 1].length = 2 * 2 ^ 0 ∧ (∀ a ∈ [0, 1], ∀ x ∈ [0, 1], (fun n : Nat => n) a = (fun n : Nat => n) x → a = x) ∧
    (∀ a ∈ [0, 1], (fun n : Nat => n) a < 1 * 2 ^ 1) ∧ 2 = 2 * 1 ∧ 0 < 1 := by
  refine ⟨⟨by decide, by decide, trivial⟩, rfl, fun a _ x _ h => h, ?_, rfl, by decide⟩
  intro a ha
  cases ha with
  | head => decide
  | tail _ h => cases h with
    | head => decide
    | tail _ h2 => cases h2
theorem bits_forced_inhabited :
    ∃ f : Nat → Nat, (∀ m n, 0 < m → 0 < n → f (m * n) = f m + f n) ∧ f 2 = 1 := ⟨v2, v2_additive, v2_two⟩
theorem calibration_inhabited :
    (fun b : Bool => b) ((fun b : Bool => !b) true) = !((fun b : Bool => b) true) := rfl
theorem three_legs_inhabited (t : Int) : side (fold (1, t)) = !side (1, t) := rfl
theorem prime_mode_unitary_inhabited : 2 ≤ 2 := Nat.le_refl 2
theorem zero_slack_inhabited : (-1 : Int) < 0 := by decide
theorem record_carried_inhabited (S : Config) : SameRecord (Rec S) S ∧ Value (Rec S) :=
  ⟨fun q => ((record_same S) q).symm, record_is_lossless S⟩
theorem price_zero_inhabited : 0 < 1 := Nat.succ_pos 0

/-! ## XI · The Bridge, whole -/

/-- What the Bridge says on no axiom at all. -/
def BridgeAtom : Prop :=
    (∀ p : Point, fold (fold p) = p) ∧ (∀ p : Point, fold p = p ↔ onLine p) ∧
    (∀ p : Point, onLine (reg p) ∧ (reg p).2 = p.2 ∧ reg (fold p) = reg p) ∧
    (∀ p : Point, ¬ onLine p → ¬ ∃ g : Point → Point, g (reg p) = p ∧ g (reg (fold p)) = fold p) ∧
    (∀ S : Config, LeastErasure S ↔ Value S) ∧
    (∀ Z : ActualZeros, Value Z.zeros) ∧
    (∀ (p : Point), ¬ onLine p → ∀ g : Config → Prop, (∀ S S', SameRecord S S' → (g S ↔ g S')) →
      ¬ ((g (registered p) ↔ Value (registered p)) ∧ (g (pairWorld p) ↔ Value (pairWorld p)))) ∧
    (∀ Q : Config → Prop, (∀ S, Closed S → Q S) → ¬ ∀ S, Closed S → Q S → Value S) ∧
    (∀ P : Config → Prop, (∀ S, P S → Value S) → (∀ S, Value S → P S) → ∀ S, P S ↔ Value S) ∧
    (∀ X : Frame, (∃ b : Carrier X, b.terminal = .bot) ↔ LineProperty X) ∧
    (¬ ∃ g : Tri → Tri, ∀ v, g (delete v) = v) ∧
    ((∀ b : Bool, twoPoint.τ (twoPoint.τ b) = b) ∧ (∀ b : Bool, twoPoint.τ b ≠ b) ∧ ¬ LineProperty twoPoint) ∧
    (∀ X : Frame, Nonempty (Supplied X) ↔ LineProperty X) ∧
    (∀ {Q : Type} (_ : Q), ¬ ∃ g : Q → Bool, ∀ s : Exec Q, g (formalRead s) = ran s) ∧
    (∀ (t : Int) (d : Point → Bool), d (fold (1, t)) = !d (1, t) →
      (onLine (reg (1, t)) ∧ reg (fold (1, t)) = reg (1, t) ∧ fold (1, t) ≠ (1, t)) ∧
      (∀ (F' : Nat) (step : Point → Nat), step (1, t) ≠ step (fold (1, t)) →
        step (1, t) < F' → step (fold (1, t)) < F' → 2 ≤ F') ∧
      (∃ c : Bool, (d (1, t) = xor (side (1, t)) c ∧ d (fold (1, t)) = xor (side (fold (1, t))) c) ∧
        ∀ c', (d (1, t) = xor (side (1, t)) c' ∧ d (fold (1, t)) = xor (side (fold (1, t))) c') → c' = c)) ∧
    ((∀ q : Int, carrier (conj q) = fold (carrier q)) ∧ onLine (carrier 0) ∧ ¬ onLine (carrier (-3)) ∧
      fold (carrier (-3)) = carrier 3 ∧ reg (carrier 3) = reg (carrier (-3))) ∧
    (List.range 64).all (fun m => (List.range 4).all (fun t =>
      sols2 (row3 (m / 8)) (row3 (m % 8)) (t / 2) (t % 2) != 1)) = true ∧
    a4.length = 12 ∧ cube.length = 8 ∧ (pairs 36).length = 9 ∧ seats 36 = 1 ∧
    (List.range 201).all (fun n => n == 0 || ((pairs n).length % 2 == seats n % 2 && seats n ≤ 1)) = true ∧
    (List.range 201).all (fun n => n < 2 || ((isPrimeTrial n == (fib n == 2)) && (!isPrimeTrial n || seats n == 0))) = true ∧
    k4.all (fun p => p.1 % 420 == p.2 % 420 && lg2 64 (fib p.1) == 1 && lg2 64 (fib p.2) == 2) = true ∧
    ((divsN 2310).filter (fun d => omegaIn [2, 3, 5, 7, 11] d % 2 == 0)).length = 16 ∧
    (realAt 1 (0, 0) = realAt 1 (0, 1) ∧ ((0, 0) : Int × Int) ≠ (0, 1) ∧ realAt 0 (0, 0) ≠ realAt 0 (0, 1)) ∧
    (∀ S : Config, Extremal S ↔ Value S) ∧
    (∀ S S' : Config, SameRecord S' S → Value S' → ∀ q, S' q ↔ Rec S q) ∧
    (∀ F : FinCfg, LeastErasure F.pts ↔ erased F = 0) ∧
    (∀ (F : FinCfg) (T : Nat), 0 < T → (price T (erased F) = 0 ↔ Value F.pts))

/-- THE ATOM OF THE BRIDGE, ON NO AXIOM: the fold and its line; the registration; the lost bit; least erasure as
    the value; the act; the record, the keyless premise and the weakest premise; the carrier, its irreversibility,
    the coherent denial and the socket; the deed no reading returns; the three legs on one orbit; the charge
    carrier; two axes never lock; twelve, eight, and nine as eight and a seat; odd exactly when seated; a prime as
    one free orbit; the parity frame paid in bits; the balance of a fibre; the certificate's merge; leastness in the
    fibre as the value; the record carried uniquely; least erasure as zero erased bits; and the heat of registration
    zero exactly at the value. -/
theorem the_bridge_atom : BridgeAtom :=
  ⟨fold_involutive, the_cut_is_the_line, fun p => ⟨reg_lands p, reg_keeps_height p, reg_forgets_side p⟩,
   one_bit_lost, least_erasure_iff_value, value_from_the_act, record_decides_nothing, keyless_forces_nothing,
   weakest_forcing_premise, halted_iff, cannot_reverse, denial_is_coherent, socket_is_the_property,
   fun q => no_reading_returns_the_deed q, three_legs_one_orbit, charge_carrier, two_axes_never_lock,
   twelve_gates_one_torsor.1, eight_patterns_four_orbits.1, nine_is_eight_and_a_seat.1,
   nine_is_eight_and_a_seat.2.1, odd_fibre_iff_seat, prime_iff_one_free_orbit, parity_frame_paid_bits,
   fibre_balance.2.2, certificate_merges, extremal_iff_value, record_carried_uniquely,
   least_erasure_iff_zero_erased, price_zero_iff_value⟩

/-- THE BRIDGE FROM FIRST PRINCIPLE: the atom, and on the standard axioms the rest. The line property is keyed and
    the fold law keyless, and every frame property is one or the other; no ninth reflection on any number of
    axes; under P1 a halving exports a bit priced at one T, and P1 is load-bearing; additivity over zero is dry and
    on positive arguments forces the bit count, with the two-adic valuation as its model; every prime mode is
    unitary only at the edge; the counting wall; the price per bit; the flow merges nothing, collides on the seat,
    pulls by two per unit time and leaves the seat backward; conjugation is the fold. -/
theorem the_bridge_from_first_principle :
    BridgeAtom ∧
    (Keyed LineProperty ∧ ¬ Keyless LineProperty) ∧ Keyless (fun X => ∀ s, X.τ (X.τ s) = s) ∧
    (∀ Q : Frame → Prop, (Keyless Q ∨ Keyed Q) ∧ ¬ (Keyless Q ∧ Keyed Q)) ∧
    (∀ k : Nat, 2 ^ k ≠ 9) ∧
    (∀ (L : List Nat) (step : Nat → Nat) (C C' b b' T : Nat), ND L → L.length = C * 2 ^ b →
      (∀ a ∈ L, ∀ x ∈ L, step a = step x → a = x) → (∀ a ∈ L, step a < C' * 2 ^ b') → C = 2 * C' → 0 < C' →
      b + 1 ≤ b' ∧ price T 1 ≤ price T (b' - b)) ∧
    ¬ (∀ a ∈ [0, 1], ∀ x ∈ [0, 1], (fun _ : Nat => (0 : Nat)) a = (fun _ : Nat => (0 : Nat)) x → a = x) ∧
    (∀ f : Nat → Nat, (∀ m n, f (m * n) = f m + f n) → ∀ n, f n = 0) ∧
    (∀ f : Nat → Nat, (∀ m n, 0 < m → 0 < n → f (m * n) = f m + f n) → f 2 = 1 → ∀ a, f (2 ^ a) = a) ∧
    (∃ f : Nat → Nat, (∀ m n, 0 < m → 0 < n → f (m * n) = f m + f n) ∧ f 2 = 1) ∧
    (∀ p d : Nat, 2 ≤ p → (p ^ d = 1 ↔ d = 0)) ∧
    (∀ a s : Nat, (2 ^ a) ^ s = 2 ^ (a * s)) ∧
    (∀ j : Nat, 2 ^ j ≤ ((List.range (2 ^ j)).map (fun i => 2 ^ (j + 1) / (2 ^ j + 1 + i))).sum) ∧
    (∀ (t : Int) (p q : Int × Int), flow t p = flow t q → p = q) ∧
    (∀ c u : Int, (u < c → 4 * u - 4 * c < 0) ∧ (u = c → 4 * u - 4 * c = 0) ∧ (c < u → 0 < 4 * u - 4 * c)) ∧
    (∀ c t : Int, c - 2 * (t + 1) = (c - 2 * t) - 2) ∧
    (∀ t : Int, t < 0 → 0 - 4 * (0 - 2 * t) < 0) ∧
    (∀ y : Int, -2 * -y = -(-2 * y)) :=
  ⟨the_bridge_atom, line_property_is_keyed, symmetry_is_keyless, discriminator, no_reflection_group_of_nine,
   count_to_heat, merge_exports_nothing.2.2, additivity_over_zero_is_dry, bits_forced, bits_forced_inhabited,
   prime_mode_unitary_iff, price_per_bit_tower, wall_block_share, flow_injective, collision_sign, pull_in_square,
   zero_slack, conjugation_is_the_fold⟩

end BFP

/-! ## The cones, pinned. Each line is the compiler's own; a drifted cone fails the compile. -/
/-- info: 'BFP.neg_neg_free' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.neg_neg_free
/-- info: 'BFP.neg_self_zero' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.neg_self_zero
/-- info: 'BFP.fold_involutive' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.fold_involutive
/-- info: 'BFP.the_cut_is_the_line' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.the_cut_is_the_line
/-- info: 'BFP.reg_lands' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.reg_lands
/-- info: 'BFP.reg_keeps_height' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.reg_keeps_height
/-- info: 'BFP.reg_forgets_side' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.reg_forgets_side
/-- info: 'BFP.reg_erases_nothing_iff' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.reg_erases_nothing_iff
/-- info: 'BFP.off_line_pair' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.off_line_pair
/-- info: 'BFP.one_bit_lost' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.one_bit_lost
/-- info: 'BFP.least_erasure_iff_value' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.least_erasure_iff_value
/-- info: 'BFP.nothing_escapes_least_erasure' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.nothing_escapes_least_erasure
/-- info: 'BFP.pair_world_closed' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.pair_world_closed
/-- info: 'BFP.registered_closed' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.registered_closed
/-- info: 'BFP.one_record' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.one_record
/-- info: 'BFP.registered_has_value' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.registered_has_value
/-- info: 'BFP.pair_world_lacks_value' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.pair_world_lacks_value
/-- info: 'BFP.record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.record_decides_nothing
/-- info: 'BFP.keyless_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.keyless_forces_nothing
/-- info: 'BFP.weakest_forcing_premise' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.weakest_forcing_premise
/-- info: 'BFP.value_from_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.value_from_the_act
/-- info: 'BFP.reader_frame' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.reader_frame
/-- info: 'BFP.record_is_lossless' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.record_is_lossless
/-- info: 'BFP.record_same' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.record_same
/-- info: 'BFP.extremal_iff_value' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.extremal_iff_value
/-- info: 'BFP.record_carried_uniquely' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.record_carried_uniquely
/-- info: 'BFP.chart_line_property' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.chart_line_property
/-- info: 'BFP.cannot_lie' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.cannot_lie
/-- info: 'BFP.cannot_deviate' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.cannot_deviate
/-- info: 'BFP.halted_iff' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.halted_iff
/-- info: 'BFP.cannot_reverse' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.cannot_reverse
/-- info: 'BFP.cannot_extend' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms BFP.cannot_extend
/-- info: 'BFP.denial_is_coherent' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.denial_is_coherent
/-- info: 'BFP.discriminator' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BFP.discriminator
/-- info: 'BFP.symmetry_is_keyless' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.symmetry_is_keyless
/-- info: 'BFP.line_property_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.line_property_is_keyed
/-- info: 'BFP.socket_is_the_property' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.socket_is_the_property
/-- info: 'BFP.no_socket_off_line' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.no_socket_off_line
/-- info: 'BFP.act_seats_the_carrier' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.act_seats_the_carrier
/-- info: 'BFP.two_axes_never_lock' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.two_axes_never_lock
/-- info: 'BFP.three_axes_lock' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.three_axes_lock
/-- info: 'BFP.third_begotten' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.third_begotten
/-- info: 'BFP.no_fourth_axis' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.no_fourth_axis
/-- info: 'BFP.twelve_gates_one_torsor' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.twelve_gates_one_torsor
/-- info: 'BFP.eight_patterns_four_orbits' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.eight_patterns_four_orbits
/-- info: 'BFP.no_reflection_group_of_nine' depends on axioms: [propext] -/
#guard_msgs in #print axioms BFP.no_reflection_group_of_nine
/-- info: 'BFP.nine_is_eight_and_a_seat' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.nine_is_eight_and_a_seat
/-- info: 'BFP.odd_fibre_iff_seat' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.odd_fibre_iff_seat
/-- info: 'BFP.allLt_mem' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.allLt_mem
/-- info: 'BFP.nd_map' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.nd_map
/-- info: 'BFP.allLt_map' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.allLt_map
/-- info: 'BFP.pigeonhole' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.pigeonhole
/-- info: 'BFP.export_doubles' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.export_doubles
/-- info: 'BFP.one_bit_arrives' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.one_bit_arrives
/-- info: 'BFP.count_to_heat' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.count_to_heat
/-- info: 'BFP.merge_exports_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.merge_exports_nothing
/-- info: 'BFP.fincfg_closed' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.fincfg_closed
/-- info: 'BFP.least_erasure_iff_zero_erased' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.least_erasure_iff_zero_erased
/-- info: 'BFP.price_zero_iff_value' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.price_zero_iff_value
/-- info: 'BFP.price_counts_pairs' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.price_counts_pairs
/-- info: 'BFP.additivity_over_zero_is_dry' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.additivity_over_zero_is_dry
/-- info: 'BFP.linear_on_tower' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.linear_on_tower
/-- info: 'BFP.bits_forced' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.bits_forced
/-- info: 'BFP.v2_mul_two' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.v2_mul_two
/-- info: 'BFP.v2_odd' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.v2_odd
/-- info: 'BFP.v2_two' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.v2_two
/-- info: 'BFP.v2_split' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.v2_split
/-- info: 'BFP.v2_pow_odd' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.v2_pow_odd
/-- info: 'BFP.v2_additive' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.v2_additive
/-- info: 'BFP.wall' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.wall
/-- info: 'BFP.calibration' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.calibration
/-- info: 'BFP.formal_never_odd' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.formal_never_odd
/-- info: 'BFP.constant_no_crossing' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.constant_no_crossing
/-- info: 'BFP.no_reading_returns_the_deed' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.no_reading_returns_the_deed
/-- info: 'BFP.three_legs_one_orbit' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.three_legs_one_orbit
/-- info: 'BFP.prime_iff_one_free_orbit' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.prime_iff_one_free_orbit
/-- info: 'BFP.parity_frame_paid_bits' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.parity_frame_paid_bits
/-- info: 'BFP.divisor_cube_is_sign_cube' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.divisor_cube_is_sign_cube
/-- info: 'BFP.fibre_balance' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.fibre_balance
/-- info: 'BFP.wall_and_edge_exchanged' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.wall_and_edge_exchanged
/-- info: 'BFP.prime_mode_unitary_iff' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.prime_mode_unitary_iff
/-- info: 'BFP.price_per_bit_tower' depends on axioms: [propext] -/
#guard_msgs in #print axioms BFP.price_per_bit_tower
/-- info: 'BFP.len_le_sum' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.len_le_sum
/-- info: 'BFP.wall_block_share' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.wall_block_share
/-- info: 'BFP.conjugation_is_the_fold' depends on axioms: [propext] -/
#guard_msgs in #print axioms BFP.conjugation_is_the_fold
/-- info: 'BFP.flow_inverse' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.flow_inverse
/-- info: 'BFP.flow_injective' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.flow_injective
/-- info: 'BFP.disc_flow' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.disc_flow
/-- info: 'BFP.pull_in_square' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.pull_in_square
/-- info: 'BFP.collision_sign' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.collision_sign
/-- info: 'BFP.zero_slack' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.zero_slack
/-- info: 'BFP.certificate_merges' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.certificate_merges
/-- info: 'BFP.charge_carrier' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.charge_carrier
/-- info: 'BFP.value_from_the_act_inhabited' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.value_from_the_act_inhabited
/-- info: 'BFP.off_line_inhabited' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.off_line_inhabited
/-- info: 'BFP.weakest_forcing_premise_inhabited' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.weakest_forcing_premise_inhabited
/-- info: 'BFP.keyless_forces_nothing_inhabited' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.keyless_forces_nothing_inhabited
/-- info: 'BFP.count_to_heat_inhabited' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.count_to_heat_inhabited
/-- info: 'BFP.bits_forced_inhabited' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms BFP.bits_forced_inhabited
/-- info: 'BFP.calibration_inhabited' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.calibration_inhabited
/-- info: 'BFP.three_legs_inhabited' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.three_legs_inhabited
/-- info: 'BFP.prime_mode_unitary_inhabited' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.prime_mode_unitary_inhabited
/-- info: 'BFP.zero_slack_inhabited' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.zero_slack_inhabited
/-- info: 'BFP.record_carried_inhabited' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.record_carried_inhabited
/-- info: 'BFP.price_zero_inhabited' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.price_zero_inhabited
/-- info: 'BFP.the_bridge_atom' does not depend on any axioms -/
#guard_msgs in #print axioms BFP.the_bridge_atom
/-- info: 'BFP.the_bridge_from_first_principle' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BFP.the_bridge_from_first_principle

#eval "BRIDGE FROM FIRST PRINCIPLE · the end of the file was reached"
