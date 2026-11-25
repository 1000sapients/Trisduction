/-
SPHYS_Record_Forced_CC.lean · the record of a sequence of registrations, on real structures
RATIONALE. The engine of edition 1.0.0 proved its statements for a gain entered by hand as zero or one on a small
  structure of integers. This file replaces it. A registration is a map whose fibres are the pairs of an
  involution; a history is a sequence of maps of a finite set; the record is the number of states the history can
  no longer tell apart. The gain is not entered: it is computed from the maps.
DESIGN. Parts, in order.
    Part I    The registration. `forgets_the_side`, `no_reading_returns_the_side`,
              `a_bit_is_erased_exactly_off_the_line`, `at_most_one_bit`, `a_whole_bit_exactly`,
              `nothing_is_lost_on_the_line`; `orbitRegistration`: every involution has one; `seat`.
    Part II   The record of a history. `the_one_sign`, `step_law`, `record_monotone`,
              `a_span_with_an_erasure_ends_above`, `a_span_that_returns_erased_nothing`,
              `no_map_undoes_an_erasure`, `a_registration_erases_at_most_one_bit`.
    Part III  The turnover. `the_majority_changes_hands_once`, `nothing_is_left`, `turnover_of_the_record`.
    Part IV   `a_boundary_writes`.
    Part V    `Premises`; `record_forced`; `recordPremises`; `the_member_erases_one_bit`.
WHAT IS NOT PROVED HERE (read before citing).
    (a) That what happens in the world is a sequence of registrations on a finite set of states. It is the
        structure `Premises`.
    (b) That the area of a horizon is a count of what is registered on it, that a return in time returns the
        record, and that the radiation of a hole is its record. These are the readings of the paper, cited or
        premise-grade, and no theorem here states them.
    (c) The direction. The order of the acts is an input of a history.
RISK. Finite sets of states throughout. No magnitude is derived.
NON-NEGOTIABLE. No axiom is declared, no sorry. No headline theorem closes over a structure that carries its
  conclusion. The kernel line of every theorem the paper names is printed at the end.
-/
import Mathlib.Data.Finset.Card
import Mathlib.Data.Finset.Image
import Mathlib.Data.Fintype.Card
import Mathlib.Data.Fintype.Pi
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Order.Monotone.Basic
import Mathlib.Logic.Function.Basic
import Mathlib.Data.Int.Basic
import Mathlib.Data.Nat.Find
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum

namespace SPHYS.Record
open Finset

/-! ## Part I. The registration -/

/-- A registration: a fold of the states that is its own inverse, and a map that gives two states one value
exactly when they are the same state or partners under the fold. It keeps the height and forgets the side. -/
structure Registration (X Y : Type*) where
  fold : X → X
  involutive : Function.Involutive fold
  reg : X → Y
  spec : ∀ x y, reg x = reg y ↔ y = x ∨ y = fold x

section Reg
variable {X Y : Type*} (r : Registration X Y)

/-- THE REGISTRATION FORGETS THE SIDE. -/
theorem forgets_the_side (x : X) : r.reg (r.fold x) = r.reg x :=
  ((r.spec x (r.fold x)).mpr (Or.inr rfl)).symm

/-- NO READING OF THE RECORD RETURNS THE SIDE. Every function of the registration gives a state and its partner
one value. -/
theorem no_reading_returns_the_side {Z : Type*} (g : Y → Z) (x : X) : g (r.reg (r.fold x)) = g (r.reg x) := by
  rw [forgets_the_side]

/-- A BIT IS ERASED EXACTLY OFF THE LINE. A state shares its registration with another state exactly when the
fold moves it. -/
theorem a_bit_is_erased_exactly_off_the_line (x : X) : (∃ y, y ≠ x ∧ r.reg y = r.reg x) ↔ r.fold x ≠ x := by
  constructor
  · rintro ⟨y, hne, he⟩ hfix
    rcases (r.spec x y).mp he.symm with h | h
    · exact hne h
    · exact hne (h.trans hfix)
  · intro h
    exact ⟨r.fold x, h, forgets_the_side r x⟩

variable [DecidableEq X] [DecidableEq Y]

/-- No value of the registration is taken by more than two states. -/
theorem fibre_at_most_two (S : Finset X) (a : Y) : (S.filter fun x => r.reg x = a).card ≤ 2 := by
  by_cases hne : (S.filter fun x => r.reg x = a).Nonempty
  · obtain ⟨x0, hx0⟩ := hne
    have h0 : r.reg x0 = a := (Finset.mem_filter.mp hx0).2
    have sub : (S.filter fun x => r.reg x = a) ⊆ {x0, r.fold x0} := by
      intro y hy
      have hy' : r.reg y = a := (Finset.mem_filter.mp hy).2
      rcases (r.spec x0 y).mp (h0.trans hy'.symm) with h | h
      · simp [h]
      · simp [h]
    exact (Finset.card_le_card sub).trans Finset.card_le_two
  · rw [Finset.not_nonempty_iff_eq_empty.mp hne]; simp

/-- AT MOST ONE BIT. A registration never raises the number of states, and never takes it below one half. -/
theorem at_most_one_bit (S : Finset X) : (S.image r.reg).card ≤ S.card ∧ S.card ≤ 2 * (S.image r.reg).card :=
  ⟨Finset.card_image_le, Finset.card_le_mul_card_image S 2 fun a _ => fibre_at_most_two r S a⟩

/-- A WHOLE BIT, EXACTLY. On a set of states closed under the fold and with no state on the line, the
registration halves the number of states. -/
theorem a_whole_bit_exactly (S : Finset X) (hS : ∀ x ∈ S, r.fold x ∈ S) (hfree : ∀ x ∈ S, r.fold x ≠ x) :
    S.card = 2 * (S.image r.reg).card := by
  rw [Finset.card_eq_sum_card_image r.reg S]
  have each : ∀ a ∈ S.image r.reg, (S.filter fun x => r.reg x = a).card = 2 := by
    intro a ha
    obtain ⟨x0, hx0, rfl⟩ := Finset.mem_image.mp ha
    have e : (S.filter fun x => r.reg x = r.reg x0) = {x0, r.fold x0} := by
      ext y
      simp only [Finset.mem_filter, Finset.mem_insert, Finset.mem_singleton]
      constructor
      · rintro ⟨_, hy⟩; exact (r.spec x0 y).mp hy.symm
      · rintro (h | h)
        · rw [h]; exact ⟨hx0, rfl⟩
        · rw [h]; exact ⟨hS x0 hx0, forgets_the_side r x0⟩
    rw [e, Finset.card_pair (fun h => hfree x0 hx0 h.symm)]
  rw [Finset.sum_congr rfl each, Finset.sum_const]
  simp [mul_comm]

omit [DecidableEq X] in
/-- NOTHING IS LOST ON THE LINE. On a set of states that the fold does not move, the registration keeps the number
of states. -/
theorem nothing_is_lost_on_the_line (S : Finset X) (hfix : ∀ x ∈ S, r.fold x = x) :
    (S.image r.reg).card = S.card := by
  apply Finset.card_image_of_injOn
  intro x hx y _ he
  rcases (r.spec x y).mp he with h | h
  · exact h.symm
  · exact (h.trans (hfix x hx)).symm

end Reg

/-- A RENAMING AFTER A REGISTRATION IS A REGISTRATION. Following a registration by a map that sends different
values to different values gives a registration with the same fold. -/
def Registration.rename {X Y Z : Type*} (r : Registration X Y) (e : Y → Z) (he : Function.Injective e) :
    Registration X Z where
  fold := r.fold
  involutive := r.involutive
  reg := e ∘ r.reg
  spec := fun x y => ⟨fun h => (r.spec x y).mp (he h), fun h => congrArg e ((r.spec x y).mpr h)⟩

/-- The relation of a state to itself and to its partner. -/
def orbitSetoid {X : Type*} (σ : X → X) (h : Function.Involutive σ) : Setoid X where
  r x y := y = x ∨ y = σ x
  iseqv :=
    { refl := fun _ => Or.inl rfl
      symm := by
        rintro x y (rfl | rfl)
        · exact Or.inl rfl
        · exact Or.inr (h x).symm
      trans := by
        rintro x y z (rfl | rfl) (rfl | rfl)
        · exact Or.inl rfl
        · exact Or.inr rfl
        · exact Or.inr rfl
        · exact Or.inl (h x) }

/-- EVERY FOLD HAS A REGISTRATION. For every map that is its own inverse, the map to the set of pairs is a
registration. -/
def orbitRegistration {X : Type*} (σ : X → X) (h : Function.Involutive σ) :
    Registration X (Quotient (orbitSetoid σ h)) where
  fold := σ
  involutive := h
  reg := fun x => Quotient.mk (orbitSetoid σ h) x
  spec := fun _ _ => ⟨fun e => Quotient.exact e, fun e => Quotient.sound e⟩

/-- THE SEAT. States are pairs of whole numbers, a side and a height. The fold reverses the side; the
registration keeps the size of the side and the height. -/
def seat : Registration (ℤ × ℤ) (ℕ × ℤ) where
  fold := fun p => (-p.1, p.2)
  involutive := fun p => by simp
  reg := fun p => (p.1.natAbs, p.2)
  spec := by
    rintro ⟨s, h⟩ ⟨s', h'⟩
    simp only [Prod.mk.injEq, Int.natAbs_eq_natAbs_iff]
    constructor
    · rintro ⟨hs | hs, hh⟩
      · exact Or.inl ⟨hs.symm, hh.symm⟩
      · exact Or.inr ⟨by omega, hh.symm⟩
    · rintro (⟨hs, hh⟩ | ⟨hs, hh⟩)
      · exact ⟨Or.inl hs.symm, hh.symm⟩
      · exact ⟨Or.inr (by omega), hh.symm⟩

/-- On the seat a state is on the line exactly when its side is zero. -/
theorem seat_line (p : ℤ × ℤ) : seat.fold p = p ↔ p.1 = 0 := by
  obtain ⟨s, h⟩ := p
  simp only [seat, Prod.mk.injEq, and_true]
  omega

/-! ## Part II. The record of a history -/

section History
variable {X : Type*} [Fintype X] [DecidableEq X] (f : ℕ → X → X)

/-- A history: the acts f 0, f 1, ... done in order. -/
def run : ℕ → X → X
  | 0 => id
  | n + 1 => f n ∘ run n

/-- The states that are still told apart after n acts. -/
def alive (n : ℕ) : Finset X := Finset.univ.image (run f n)

/-- The gain of act n: the number of states it stops telling apart. -/
def gain (n : ℕ) : ℕ := (alive f n).card - (alive f (n + 1)).card

/-- The record after n acts: the number of states no longer told apart. -/
def record (n : ℕ) : ℕ := Fintype.card X - (alive f n).card

theorem alive_succ (n : ℕ) : alive f (n + 1) = (alive f n).image (f n) := by
  unfold alive; rw [Finset.image_image]; rfl

/-- THE ONE SIGN. No act raises the number of states told apart. -/
theorem the_one_sign (n : ℕ) : (alive f (n + 1)).card ≤ (alive f n).card := by
  rw [alive_succ]; exact Finset.card_image_le

theorem alive_le (n : ℕ) : (alive f n).card ≤ Fintype.card X := Finset.card_le_univ _

theorem alive_antitone {n m : ℕ} (h : n ≤ m) : (alive f m).card ≤ (alive f n).card := by
  induction h with
  | refl => exact le_refl _
  | step _ ih => exact (the_one_sign f _).trans ih

/-- THE STEP LAW. The record of a history is the sum of the gains of its acts. -/
theorem step_law (n : ℕ) : record f n = ∑ i ∈ Finset.range n, gain f i := by
  induction n with
  | zero => simp [record, alive, run]
  | succ n ih =>
    rw [Finset.sum_range_succ, ← ih]
    unfold record gain
    have := the_one_sign f n
    have := alive_le f n
    omega

/-- THE RECORD NEVER DECREASES. -/
theorem record_monotone : Monotone (record f) := by
  intro n m h
  unfold record
  have := alive_antitone f h
  omega

/-- A SPAN WITH AN ERASURE ENDS ABOVE ITS START. -/
theorem a_span_with_an_erasure_ends_above (n m : ℕ) (hnm : n < m) (h : 0 < gain f n) : record f n < record f m := by
  have h1 : record f n < record f (n + 1) := by
    unfold record; unfold gain at h
    have := alive_le f n
    omega
  exact lt_of_lt_of_le h1 (record_monotone f hnm)

/-- A SPAN THAT RETURNS THE RECORD ERASED NOTHING. -/
theorem a_span_that_returns_erased_nothing (n m : ℕ) (h : record f m = record f n) (i : ℕ) (hi : n ≤ i)
    (him : i < m) : gain f i = 0 := by
  by_contra hne
  have h1 := a_span_with_an_erasure_ends_above f i m him (Nat.pos_of_ne_zero hne)
  have h2 := record_monotone f hi
  omega

/-- NO MAP UNDOES AN ERASURE. After an act that erased, no map of the states, applied to the history at any later
time, gives back the history as it was before that act. -/
theorem no_map_undoes_an_erasure (n m : ℕ) (hnm : n < m) (h : 0 < gain f n) :
    ¬ ∃ g : X → X, g ∘ run f m = run f n := by
  rintro ⟨g, hg⟩
  have e : alive f n = (alive f m).image g := by
    unfold alive; rw [Finset.image_image, hg]
  have c1 : (alive f n).card ≤ (alive f m).card := by rw [e]; exact Finset.card_image_le
  have c2 := alive_antitone f (show n + 1 ≤ m from hnm)
  unfold gain at h
  omega

/-- A REGISTRATION ERASES AT MOST ONE BIT. If act n is a registration, the number of states told apart falls to
no less than one half. -/
theorem a_registration_erases_at_most_one_bit (n : ℕ) (r : Registration X X) (hr : r.reg = f n) :
    (alive f n).card ≤ 2 * (alive f (n + 1)).card := by
  rw [alive_succ, ← hr]; exact (at_most_one_bit r (alive f n)).2

end History

/-! ## Part III. The turnover -/

/-- THE MAJORITY CHANGES HANDS ONCE. Let a share never decrease, and let it pass half of a total N at some time.
Then there is one time from which it holds more than half, and before which it does not. -/
theorem the_majority_changes_hands_once (rad : ℕ → ℕ) (hm : Monotone rad) (N T : ℕ) (hT : N < 2 * rad T) :
    ∃ t0, ∀ t, N < 2 * rad t ↔ t0 ≤ t := by
  have ex : ∃ t, N < 2 * rad t := ⟨T, hT⟩
  refine ⟨Nat.find ex, fun t => ⟨fun h => Nat.find_min' ex h, fun h => ?_⟩⟩
  have h0 := Nat.find_spec ex
  have := hm h
  omega

/-- NOTHING IS LEFT. If two shares sum to N at every time and one reaches N, the other is zero then; and if the
first starts at zero and N is positive, the other holds more than half at the start. -/
theorem nothing_is_left (rad hole : ℕ → ℕ) (N T : ℕ) (hsum : ∀ t, hole t + rad t = N) (hT : rad T = N)
    (h0 : rad 0 = 0) (hN : 0 < N) : hole T = 0 ∧ N < 2 * hole 0 := by
  have a := hsum T
  have b := hsum 0
  omega

/-- THE TURNOVER OF THE RECORD. Let the record of a history reach a total N at some time, N positive, and let the
rest be held elsewhere. The holder of the rest has more than half at the start and nothing at that time, and the
record holds more than half from one time on and not before. -/
theorem turnover_of_the_record {X : Type*} [Fintype X] [DecidableEq X] (f : ℕ → X → X) (N T : ℕ) (hN : 0 < N)
    (hT : record f T = N) :
    (N - record f T = 0 ∧ N < 2 * (N - record f 0)) ∧ ∃ t0, ∀ t, N < 2 * record f t ↔ t0 ≤ t := by
  have z : record f 0 = 0 := by simp [record, alive, run]
  refine ⟨by omega, the_majority_changes_hands_once (record f) (record_monotone f) N T (by omega)⟩

/-! ## Part IV. A boundary -/

/-- A BOUNDARY OF k SITES OF ONE BIT WRITES 2^k NAMES. -/
theorem a_boundary_writes (k : ℕ) : Fintype.card (Fin k → Bool) = 2 ^ k := by simp

/-! ## Part V. The theorem -/

/-- The premises. There is a finite set of states, and what happens is a sequence of acts on it, each of which
is a registration. The area of a horizon that only registers is a count: a starting value plus the record. A
return in time, from a later act to an earlier one, returns the record. Nothing else is assumed. -/
structure Premises where
  State : Type
  fin : Fintype State
  dec : DecidableEq State
  act : ℕ → State → State
  registers : ∀ n, ∃ r : Registration State State, r.reg = act n
  area0 : ℕ
  area : ℕ → ℕ
  horizon : ∀ n, area n = area0 + record act n
  loop : ℕ → ℕ → Prop
  returns : ∀ n m, loop n m → n ≤ m ∧ record act m = record act n

attribute [instance] Premises.fin Premises.dec

/-- THE RECORD, FORCED. On the premises the record never decreases; each act takes the number of states told
apart to no less than one half; a span with an erasure ends above its start; and no map undoes an erasure. -/
theorem record_forced (P : Premises) :
    Monotone (record P.act) ∧ (∀ n, (alive P.act n).card ≤ 2 * (alive P.act (n + 1)).card)
      ∧ (∀ n m, n < m → 0 < gain P.act n → record P.act n < record P.act m)
      ∧ (∀ n m, n < m → 0 < gain P.act n → ¬ ∃ g : P.State → P.State, g ∘ run P.act m = run P.act n) := by
  refine ⟨record_monotone P.act, fun n => ?_, a_span_with_an_erasure_ends_above P.act, no_map_undoes_an_erasure P.act⟩
  obtain ⟨r, hr⟩ := P.registers n
  exact a_registration_erases_at_most_one_bit P.act n r hr

/-- A HORIZON ONLY GROWS. On the premises the area never decreases, and it is strictly larger after a span that
starts with an erasing act. -/
theorem a_horizon_only_grows (P : Premises) :
    Monotone P.area ∧ ∀ n m, n < m → 0 < gain P.act n → P.area n < P.area m := by
  constructor
  · intro n m h
    rw [P.horizon, P.horizon]
    exact Nat.add_le_add_left (record_monotone P.act h) _
  · intro n m h hg
    rw [P.horizon, P.horizon]
    exact Nat.add_lt_add_left (a_span_with_an_erasure_ends_above P.act n m h hg) _

/-- NO PATH RETURNS. On the premises a return in time holds no erasing act: every act on the loop has gain
zero. -/
theorem no_path_returns (P : Premises) (n m : ℕ) (h : P.loop n m) (i : ℕ) (hi : n ≤ i) (him : i < m) :
    gain P.act i = 0 :=
  a_span_that_returns_erased_nothing P.act n m (P.returns n m h).2 i hi him

/-- NOTHING IS LOST. On the premises, if the record reaches a total N, the holder of the rest starts with more
than half and ends with nothing, and the record holds more than half from one time on and not before. -/
theorem nothing_is_lost (P : Premises) (N T : ℕ) (hN : 0 < N) (hT : record P.act T = N) :
    (N - record P.act T = 0 ∧ N < 2 * (N - record P.act 0)) ∧ ∃ t0, ∀ t, N < 2 * record P.act t ↔ t0 ≤ t :=
  turnover_of_the_record P.act N T hN hT

/-- The fold of two states, and the registration that writes both as one. -/
def bitRegistration : Registration Bool Bool where
  fold := not
  involutive := Bool.not_not
  reg := fun _ => true
  spec := by decide

/-- The registration that moves nothing. -/
def idleRegistration : Registration Bool Bool where
  fold := id
  involutive := fun _ => rfl
  reg := id
  spec := by decide

/-- The acts of the member: the first writes both states as one, and every later act is idle. -/
def memberAct : ℕ → Bool → Bool := fun n => if n = 0 then (fun _ => true) else id

theorem member_alive (n : ℕ) : alive memberAct (n + 1) = {true} := by
  induction n with
  | zero => decide
  | succ n ih => rw [alive_succ, ih]; simp [memberAct]

theorem member_record (n : ℕ) : record memberAct (n + 1) = 1 := by
  unfold record; rw [member_alive]; simp

/-- THE PREMISES ARE INHABITED. Two states; the first act writes both as one, and every later act is idle. The
area is the record, and the loops are the spans that start after the first act. -/
def recordPremises : Premises where
  State := Bool
  fin := inferInstance
  dec := inferInstance
  act := memberAct
  registers := fun n => by
    by_cases h : n = 0
    · exact ⟨bitRegistration, by simp [h, bitRegistration, memberAct]⟩
    · exact ⟨idleRegistration, by simp [h, idleRegistration, memberAct]⟩
  area0 := 0
  area := record memberAct
  horizon := fun n => (Nat.zero_add _).symm
  loop := fun n m => 1 ≤ n ∧ n ≤ m
  returns := by
    rintro n m ⟨h1, h2⟩
    obtain ⟨n', rfl⟩ : ∃ k, n = k + 1 := ⟨n - 1, by omega⟩
    obtain ⟨m', rfl⟩ : ∃ k, m = k + 1 := ⟨m - 1, by omega⟩
    exact ⟨h2, by rw [member_record, member_record]⟩

/-- THE MEMBER ERASES ONE BIT. Its first act has gain one, and its record is one from then on. -/
theorem the_member_erases_one_bit : gain recordPremises.act 0 = 1 ∧ ∀ n, record recordPremises.act (n + 1) = 1 := by
  refine ⟨by decide, member_record⟩

end SPHYS.Record

#print axioms SPHYS.Record.forgets_the_side
#print axioms SPHYS.Record.no_reading_returns_the_side
#print axioms SPHYS.Record.a_bit_is_erased_exactly_off_the_line
#print axioms SPHYS.Record.fibre_at_most_two
#print axioms SPHYS.Record.at_most_one_bit
#print axioms SPHYS.Record.a_whole_bit_exactly
#print axioms SPHYS.Record.nothing_is_lost_on_the_line
#print axioms SPHYS.Record.Registration.rename
#print axioms SPHYS.Record.orbitRegistration
#print axioms SPHYS.Record.seat
#print axioms SPHYS.Record.seat_line
#print axioms SPHYS.Record.alive_succ
#print axioms SPHYS.Record.the_one_sign
#print axioms SPHYS.Record.alive_le
#print axioms SPHYS.Record.alive_antitone
#print axioms SPHYS.Record.step_law
#print axioms SPHYS.Record.record_monotone
#print axioms SPHYS.Record.a_span_with_an_erasure_ends_above
#print axioms SPHYS.Record.a_span_that_returns_erased_nothing
#print axioms SPHYS.Record.no_map_undoes_an_erasure
#print axioms SPHYS.Record.a_registration_erases_at_most_one_bit
#print axioms SPHYS.Record.the_majority_changes_hands_once
#print axioms SPHYS.Record.nothing_is_left
#print axioms SPHYS.Record.turnover_of_the_record
#print axioms SPHYS.Record.a_boundary_writes
#print axioms SPHYS.Record.record_forced
#print axioms SPHYS.Record.a_horizon_only_grows
#print axioms SPHYS.Record.no_path_returns
#print axioms SPHYS.Record.nothing_is_lost
#print axioms SPHYS.Record.member_alive
#print axioms SPHYS.Record.member_record
#print axioms SPHYS.Record.recordPremises
#print axioms SPHYS.Record.the_member_erases_one_bit
