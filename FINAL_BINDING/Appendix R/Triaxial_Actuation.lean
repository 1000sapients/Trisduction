/-
  Triaxial_Actuation.lean · actuation is triaxial

  Core Lean 4: no import, no axiom declared, no sorry, no native_decide, and every theorem rests on no
  axiom at all, not even propositional extensionality, quotients or choice.

  An actuation is a self-grounding root whose acts carry a direction: each act has a side and a height,
  and reversing the deed reverses the side and keeps the height. From the direction alone the kernel
  constructs three axes and proves them forced:
  I    The fold: reversing the deed is an involution.
  II   The registration: it keeps the height and forgets the side; it is blind to the fold, closed with
       it under combination, and it is the only height-keeping map onto the seat.
  III  The seat: the fold's fixed set, where the fold and the registration both fix the act, and off
       which neither does.
  IV   The third axis: off the seat the fold's orbit has two acts with one record, so the record leaves
       exactly the orientation open; every reading blind to the fold reads both alike.
  V    The root through the axes: a reversed deed is still an act and instances the root; the axes are
       carried by every actuation, and they force no orientation.
  VI   The bridge atom: the integers, with negation as the fold, are an actuation.
  VII  The triaxial seal.
  VIII The Tongue: no reading of the record returns the orientation; the seat is the only special cut.
  IX   Every root actuates: a self-grounding root is the root of an actuation over its own acts, so the
       root carries the three axes; the registration is the fold's record and lands on the seat, where
       the orientation an act and its reversal share stays open; the even pair leaves two acts, the
       orientation locks one; and a degenerate direction, one side only, is the characterless case.
-/

namespace TriAct

/-! ## The root, self-grounding -/

/-- A self-grounding root: acts occur, and every act instances the root. -/
structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

/-! ## Actuation: a self-grounding root whose acts carry a direction -/

/-- The direction of a deed: a side with a reversal, whose one fixed side is the zero side. -/
structure Direction where
  Side     : Type
  rev      : Side → Side
  zero     : Side
  rev_rev  : ∀ s, rev (rev s) = s
  rev_zero : rev zero = zero
  fix_zero : ∀ s, rev s = s → s = zero

/-- An actuation: a self-grounding root whose acts are pairs of a side and a height. -/
structure Actuation (R : Prop) where
  dir       : Direction
  Height    : Type
  anAct     : dir.Side × Height
  instances : dir.Side × Height → R

variable {R : Prop}

/-- Every actuation is a self-grounding root. -/
def Actuation.toSelfGrounding (A : Actuation R) : SelfGrounding R :=
  ⟨A.dir.Side × A.Height, A.anAct, A.instances⟩

/-- The fold: reversing the deed reverses the side and keeps the height. -/
def fold (A : Actuation R) (p : A.dir.Side × A.Height) : A.dir.Side × A.Height := (A.dir.rev p.1, p.2)

/-- The registration: it keeps the height and forgets the side. -/
def reg (A : Actuation R) (p : A.dir.Side × A.Height) : A.dir.Side × A.Height := (A.dir.zero, p.2)

/-- The seat: the acts the fold fixes. -/
def OnSeat (A : Actuation R) (p : A.dir.Side × A.Height) : Prop := fold A p = p

/-! ## I · the fold -/

theorem fold_involutive (A : Actuation R) (p : A.dir.Side × A.Height) : fold A (fold A p) = p := by
  cases p with
  | mk s h => show (A.dir.rev (A.dir.rev s), h) = (s, h); rw [A.dir.rev_rev]

/-! ## II · the registration -/

/-- The registration forgets the side: an act and its reversal have one record. -/
theorem reg_forgets_side (A : Actuation R) (p : A.dir.Side × A.Height) : reg A (fold A p) = reg A p := rfl

/-- The registration keeps the height. -/
theorem reg_keeps_height (A : Actuation R) (p : A.dir.Side × A.Height) : (reg A p).2 = p.2 := rfl

/-- The even pair is closed under combination: folding a record changes nothing. -/
theorem fold_of_reg (A : Actuation R) (p : A.dir.Side × A.Height) : fold A (reg A p) = reg A p := by
  show (A.dir.rev A.dir.zero, p.2) = (A.dir.zero, p.2); rw [A.dir.rev_zero]

/-- The registration is idempotent. -/
theorem reg_idempotent (A : Actuation R) (p : A.dir.Side × A.Height) : reg A (reg A p) = reg A p := rfl

/-- THE REGISTRATION IS FORCED, NOT ELECTED: any map that keeps the height and lands on the seat is
the registration. -/
theorem registration_is_forced (A : Actuation R) (g : A.dir.Side × A.Height → A.dir.Side × A.Height)
    (keeps : ∀ p, (g p).2 = p.2) (lands : ∀ p, OnSeat A (g p)) : ∀ p, g p = reg A p := by
  intro p
  have hs : (g p).1 = A.dir.zero := by
    have hf := lands p
    have h1 : A.dir.rev (g p).1 = (g p).1 := congrArg Prod.fst hf
    exact A.dir.fix_zero _ h1
  have hh := keeps p
  cases hg : g p with
  | mk s h =>
    rw [hg] at hs hh
    show (s, h) = (A.dir.zero, p.2)
    rw [show s = A.dir.zero from hs, show h = p.2 from hh]

/-! ## III · the seat -/

/-- The seat is exactly the zero side. -/
theorem seat_iff_zero_side (A : Actuation R) (p : A.dir.Side × A.Height) : OnSeat A p ↔ p.1 = A.dir.zero :=
  ⟨fun h => A.dir.fix_zero _ (congrArg Prod.fst h),
   fun h => by
     cases p with
     | mk s t =>
       show (A.dir.rev s, t) = (s, t)
       have hs : s = A.dir.zero := h
       rw [hs, A.dir.rev_zero]⟩

/-- ON THE SEAT BOTH BLIND SPOTS CANCEL: the fold and the registration both fix the act. -/
theorem seat_cancels_both (A : Actuation R) (p : A.dir.Side × A.Height) (h : OnSeat A p) :
    fold A p = p ∧ reg A p = p := by
  refine ⟨h, ?_⟩
  have hz : p.1 = A.dir.zero := (seat_iff_zero_side A p).mp h
  cases p with
  | mk s t =>
    have hs : s = A.dir.zero := hz
    show (A.dir.zero, t) = (s, t)
    rw [hs]

/-- OFF THE SEAT BOTH STAND: neither the fold nor the registration fixes the act. -/
theorem off_seat_both (A : Actuation R) (p : A.dir.Side × A.Height) (h : ¬ OnSeat A p) :
    fold A p ≠ p ∧ reg A p ≠ p := by
  refine ⟨h, fun hr => h ?_⟩
  have hz : p.1 = A.dir.zero := (congrArg Prod.fst hr).symm
  exact (seat_iff_zero_side A p).mpr hz

/-! ## IV · the third axis -/

/-- THE RECORD LEAVES EXACTLY THE ORIENTATION: off the seat, an act and its reversal are two acts with
one record. -/
theorem record_leaves_the_orientation (A : Actuation R) (p : A.dir.Side × A.Height) (h : ¬ OnSeat A p) :
    fold A p ≠ p ∧ reg A (fold A p) = reg A p :=
  ⟨h, rfl⟩

/-- Every reading blind to the fold reads an act and its reversal alike. -/
theorem even_readings_are_blind (A : Actuation R) {α : Type} (f : A.dir.Side × A.Height → α)
    (blind : ∀ p, f (fold A p) = f p) (p : A.dir.Side × A.Height) : f (fold A p) = f p :=
  blind p

/-- The registration is such a reading, and so is every reading of the record. -/
theorem readings_of_the_record_are_blind (A : Actuation R) {α : Type} (k : A.dir.Side × A.Height → α)
    (p : A.dir.Side × A.Height) : k (reg A (fold A p)) = k (reg A p) := rfl

/-! ## V · the root through the axes -/

/-- A REVERSED DEED IS STILL AN ACT, AND INSTANCES THE ROOT: the denial spends the deed. -/
theorem denial_instances_root (A : Actuation R) (p : A.dir.Side × A.Height) : R :=
  A.instances (fold A p)

/-- The root holds on every actuation, by its act. -/
theorem root_holds (A : Actuation R) : R := A.instances A.anAct

/-- THE AXES FORCE NO ORIENTATION: off the seat both orientations are acts, both instance the root, and
the record reads them alike; the triaxial structure leaves the one orientation open. -/
theorem axes_force_no_orientation (A : Actuation R) (p : A.dir.Side × A.Height) (h : ¬ OnSeat A p) :
    R ∧ R ∧ fold A p ≠ p ∧ reg A (fold A p) = reg A p :=
  ⟨A.instances p, A.instances (fold A p), h, rfl⟩

/-! ## VI · the bridge atom: the integers are an actuation -/

theorem int_neg_neg : ∀ s : Int, -(-s) = s
  | Int.ofNat 0 => rfl
  | Int.ofNat (_ + 1) => rfl
  | Int.negSucc _ => rfl

theorem self_neg_zero : ∀ v : Int, -v = v → v = 0
  | Int.ofNat 0, _ => rfl
  | Int.ofNat (_ + 1), h => Int.noConfusion h
  | Int.negSucc _, h => Int.noConfusion h

/-- The integer direction: negation, with zero its one fixed side. -/
def intDir : Direction := ⟨Int, fun s => -s, 0, int_neg_neg, rfl, self_neg_zero⟩

/-- The bridge atom: points (d, t), the fold (d, t) ↦ (−d, t), the registration (d, t) ↦ (0, t). -/
def atom : Actuation True := ⟨intDir, Int, ((0 : Int), (0 : Int)), fun _ => True.intro⟩

/-- THE BRIDGE ATOM, AS AN ACTUATION: the fold fixes (d, t) exactly when d = 0, the registration
leaves it unchanged exactly then, and off the seat the record leaves the orientation. -/
theorem the_bridge_atom (d t : Int) :
    (OnSeat atom (d, t) ↔ d = 0) ∧ (reg atom (d, t) = (d, t) ↔ d = 0) ∧
    (d ≠ 0 → fold atom (d, t) ≠ (d, t) ∧ reg atom (fold atom (d, t)) = reg atom (d, t)) :=
  ⟨seat_iff_zero_side atom (d, t),
   ⟨fun h => (congrArg Prod.fst h).symm, fun h => by rw [h]; rfl⟩,
   fun hd => record_leaves_the_orientation atom (d, t) (fun hs => hd ((seat_iff_zero_side atom (d, t)).mp hs))⟩

/-- The atom is not characterless: off the seat it has two acts with one record. -/
theorem the_atom_is_not_characterless :
    fold atom ((1 : Int), (0 : Int)) ≠ ((1 : Int), (0 : Int)) ∧ reg atom (fold atom ((1 : Int), (0 : Int))) = reg atom ((1 : Int), (0 : Int)) :=
  ⟨fun h => Int.noConfusion (congrArg Prod.fst h), rfl⟩

/-! ## VII · the triaxial seal -/

/-- ACTUATION IS TRIAXIAL: every actuation carries a fold that is an involution, a registration that
keeps the height, forgets the side and is the only such map onto the seat, and a seat where both fix
the act and off which neither does; off the seat the record leaves exactly the orientation; every act
and its reversal instance the root; and the axes force no orientation. -/
theorem actuation_is_triaxial (A : Actuation R) :
    (∀ p, fold A (fold A p) = p) ∧
    (∀ p, reg A (fold A p) = reg A p ∧ (reg A p).2 = p.2 ∧ fold A (reg A p) = reg A p) ∧
    (∀ g : A.dir.Side × A.Height → A.dir.Side × A.Height,
       (∀ p, (g p).2 = p.2) → (∀ p, OnSeat A (g p)) → ∀ p, g p = reg A p) ∧
    (∀ p, OnSeat A p → fold A p = p ∧ reg A p = p) ∧
    (∀ p, ¬ OnSeat A p → fold A p ≠ p ∧ reg A p ≠ p) ∧
    (∀ p, ¬ OnSeat A p → R ∧ R ∧ fold A p ≠ p ∧ reg A (fold A p) = reg A p) :=
  ⟨fold_involutive A, fun p => ⟨reg_forgets_side A p, reg_keeps_height A p, fold_of_reg A p⟩,
   registration_is_forced A, seat_cancels_both A, off_seat_both A, axes_force_no_orientation A⟩

/-- THE TRIAXIAL SEAL: actuation is triaxial, universally; the bridge atom is an actuation; and it is
not characterless. -/
theorem the_triaxial_seal :
    (∀ (R : Prop) (A : Actuation R), (∀ p, fold A (fold A p) = p) ∧
      (∀ p, OnSeat A p → fold A p = p ∧ reg A p = p) ∧
      (∀ p, ¬ OnSeat A p → fold A p ≠ p ∧ reg A (fold A p) = reg A p)) ∧
    (∀ d t : Int, OnSeat atom (d, t) ↔ d = 0) ∧
    (fold atom ((1 : Int), (0 : Int)) ≠ ((1 : Int), (0 : Int)) ∧ reg atom (fold atom ((1 : Int), (0 : Int))) = reg atom ((1 : Int), (0 : Int))) :=
  ⟨fun _ A => ⟨fold_involutive A, seat_cancels_both A,
     fun p h => record_leaves_the_orientation A p h⟩,
   fun d t => seat_iff_zero_side atom (d, t),
   the_atom_is_not_characterless⟩


/-! ## VIII · the Tongue: freedom and the only special cut -/

/-- TONGUE FREEDOM: no reading of the record returns the orientation. If a record is blind to the fold
and an orientation is flipped by it, the orientation is not a function of the record. -/
theorem tongue_freedom {α β : Type} (τ : α → α) (ρ : α → β) (g : β → Bool) (d : α → Bool) (x : α)
    (blind : ρ (τ x) = ρ x) (flip : d (τ x) = !d x) : d ≠ fun y => g (ρ y) := by
  intro h
  have h1 : d (τ x) = g (ρ (τ x)) := congrFun h (τ x)
  have h2 : d x = g (ρ x) := congrFun h x
  rw [blind] at h1
  rw [← h2] at h1
  rw [h1] at flip
  cases hd : d x with
  | false => rw [hd] at flip; exact Bool.noConfusion flip
  | true => rw [hd] at flip; exact Bool.noConfusion flip

/-- THE ONLY SPECIAL CUT: the seat is exactly where both blind spots cancel; nowhere else do the fold
and the registration both fix an act. -/
theorem the_only_special_cut (A : Actuation R) (p : A.dir.Side × A.Height) :
    (fold A p = p ∧ reg A p = p) ↔ OnSeat A p :=
  ⟨fun h => h.1, fun h => seat_cancels_both A p h⟩

/-! ## IX · every root actuates: the root carries the three axes -/

/-- THE REGISTRATION IS THE FOLD'S RECORD: it reads an act and its reversal alike and keeps the height, and two
acts have one record exactly when they have one height. -/
theorem registration_is_the_folds_record (A : Actuation R) (p q : A.dir.Side × A.Height) :
    reg A (fold A p) = reg A p ∧ (reg A p = reg A q ↔ p.2 = q.2) :=
  ⟨rfl, ⟨fun h => show (reg A p).2 = (reg A q).2 from congrArg Prod.snd h, fun h => by
    cases p with
    | mk s t =>
      cases q with
      | mk s' t' =>
        have ht : t = t' := h
        show (A.dir.zero, t) = (A.dir.zero, t')
        rw [ht]⟩⟩

/-- THE REGISTRATION LANDS ON THE SEAT: every record is a seat point. -/
theorem reg_lands_on_seat (A : Actuation R) (p : A.dir.Side × A.Height) : OnSeat A (reg A p) :=
  fold_of_reg A p

/-- THE ORIENTATION IS OPEN AT THE SEAT: off the seat, an act and its reversal land on one seat point, the record
of both; at that place the record has left exactly the orientation open. -/
theorem open_at_the_seat (A : Actuation R) (p : A.dir.Side × A.Height) (h : ¬ OnSeat A p) :
    OnSeat A (reg A p) ∧ reg A (fold A p) = reg A p ∧ fold A p ≠ p :=
  ⟨reg_lands_on_seat A p, rfl, h⟩

/-- TWO AXES LEAVE TWO: off the seat, every reading blind to the fold, the record among them, reads an act and
its reversal alike: two acts, one reading. -/
theorem even_pair_leaves_two (A : Actuation R) (p : A.dir.Side × A.Height) (h : ¬ OnSeat A p) {α : Type}
    (f : A.dir.Side × A.Height → α) (blind : ∀ q, f (fold A q) = f q) :
    fold A p ≠ p ∧ f (fold A p) = f p ∧ reg A (fold A p) = reg A p :=
  ⟨h, blind p, rfl⟩

/-- THREE AXES LOCK ONE: the record together with the orientation, the side, determines the act. -/
theorem orientation_locks_the_act (A : Actuation R) (p q : A.dir.Side × A.Height)
    (hr : reg A p = reg A q) (hs : p.1 = q.1) : p = q := by
  cases p with
  | mk s t =>
    cases q with
    | mk s' t' =>
      have ht : t = t' := congrArg Prod.snd hr
      have hs' : s = s' := hs
      rw [hs', ht]

/-- A degenerate direction has the zero side and no other. -/
def Direction.Degenerate (D : Direction) : Prop := ∀ s, s = D.zero

/-- THE CHARACTERLESS CASE: over a degenerate direction every act is on the seat, and the fold and the
registration are both the identity: one scalar, no fold, no seat to lock. -/
theorem degenerate_is_characterless (A : Actuation R) (h : A.dir.Degenerate) (p : A.dir.Side × A.Height) :
    OnSeat A p ∧ fold A p = p ∧ reg A p = p :=
  have hs : OnSeat A p := (seat_iff_zero_side A p).mpr (h p.1)
  ⟨hs, seat_cancels_both A p hs⟩

/-- The integer direction is not degenerate. -/
theorem intDir_not_degenerate : ¬ intDir.Degenerate := fun h =>
  have h0 : (1 : Int) = 0 := h (1 : Int)
  absurd h0 (by decide)

/-- EVERY ROOT ACTUATES: a self-grounding root is the root of the actuation over its own acts, with the integer
direction; the root's deeds sit at the zero side and instance the root as before. -/
def SelfGrounding.toActuation (S : SelfGrounding R) : Actuation R :=
  ⟨intDir, S.Act, ((0 : Int), S.anAct), fun p => S.instances p.2⟩

theorem every_root_actuates (S : SelfGrounding R) :
    (∀ a : S.Act, OnSeat S.toActuation ((0 : Int), a)) ∧
    (∀ a : S.Act, ¬ OnSeat S.toActuation ((1 : Int), a)) ∧
    ¬ S.toActuation.dir.Degenerate :=
  ⟨fun _ => rfl,
   fun a h =>
     have h0 : (1 : Int) = 0 := (seat_iff_zero_side S.toActuation ((1 : Int), a)).mp h
     absurd h0 (by decide),
   intDir_not_degenerate⟩

/-- THE ROOT CARRIES THREE AXES: for every self-grounding root, its actuation carries the fold, an involution; the
registration, keeping the height, forgetting the side, the only height-keeping map onto the seat; and the seat,
where both fix the act; and it is not characterless: at every height an act off the seat, its reversal a second
act with the same record, both instancing the root, the orientation between them forced by nothing. -/
theorem the_root_carries_three_axes (S : SelfGrounding R) :
    (∀ p, fold S.toActuation (fold S.toActuation p) = p) ∧
    (∀ p, reg S.toActuation (fold S.toActuation p) = reg S.toActuation p ∧ (reg S.toActuation p).2 = p.2) ∧
    (∀ g : Int × S.Act → Int × S.Act, (∀ p, (g p).2 = p.2) → (∀ p, OnSeat S.toActuation (g p)) →
       ∀ p, g p = reg S.toActuation p) ∧
    (∀ p, OnSeat S.toActuation p → fold S.toActuation p = p ∧ reg S.toActuation p = p) ∧
    (∀ a : S.Act, fold S.toActuation ((1 : Int), a) ≠ ((1 : Int), a) ∧
       reg S.toActuation (fold S.toActuation ((1 : Int), a)) = reg S.toActuation ((1 : Int), a)) ∧
    (∀ p, ¬ OnSeat S.toActuation p →
       R ∧ R ∧ fold S.toActuation p ≠ p ∧ reg S.toActuation (fold S.toActuation p) = reg S.toActuation p) :=
  ⟨fold_involutive S.toActuation,
   fun p => ⟨reg_forgets_side S.toActuation p, reg_keeps_height S.toActuation p⟩,
   registration_is_forced S.toActuation,
   seat_cancels_both S.toActuation,
   fun a => record_leaves_the_orientation S.toActuation ((1 : Int), a) ((every_root_actuates S).2.1 a),
   axes_force_no_orientation S.toActuation⟩

end TriAct

/-! ## Cones, pinned as printed: every theorem on no axiom -/
/-- info: 'TriAct.fold_involutive' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.fold_involutive
/-- info: 'TriAct.reg_forgets_side' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.reg_forgets_side
/-- info: 'TriAct.reg_keeps_height' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.reg_keeps_height
/-- info: 'TriAct.fold_of_reg' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.fold_of_reg
/-- info: 'TriAct.reg_idempotent' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.reg_idempotent
/-- info: 'TriAct.registration_is_forced' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.registration_is_forced
/-- info: 'TriAct.seat_iff_zero_side' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.seat_iff_zero_side
/-- info: 'TriAct.seat_cancels_both' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.seat_cancels_both
/-- info: 'TriAct.off_seat_both' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.off_seat_both
/-- info: 'TriAct.record_leaves_the_orientation' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.record_leaves_the_orientation
/-- info: 'TriAct.even_readings_are_blind' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.even_readings_are_blind
/-- info: 'TriAct.readings_of_the_record_are_blind' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.readings_of_the_record_are_blind
/-- info: 'TriAct.denial_instances_root' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.denial_instances_root
/-- info: 'TriAct.root_holds' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.root_holds
/-- info: 'TriAct.axes_force_no_orientation' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.axes_force_no_orientation
/-- info: 'TriAct.int_neg_neg' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.int_neg_neg
/-- info: 'TriAct.self_neg_zero' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.self_neg_zero
/-- info: 'TriAct.the_bridge_atom' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.the_bridge_atom
/-- info: 'TriAct.the_atom_is_not_characterless' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.the_atom_is_not_characterless
/-- info: 'TriAct.actuation_is_triaxial' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.actuation_is_triaxial
/-- info: 'TriAct.the_triaxial_seal' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.the_triaxial_seal
/-- info: 'TriAct.tongue_freedom' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.tongue_freedom
/-- info: 'TriAct.the_only_special_cut' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.the_only_special_cut
/-- info: 'TriAct.registration_is_the_folds_record' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.registration_is_the_folds_record
/-- info: 'TriAct.reg_lands_on_seat' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.reg_lands_on_seat
/-- info: 'TriAct.open_at_the_seat' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.open_at_the_seat
/-- info: 'TriAct.even_pair_leaves_two' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.even_pair_leaves_two
/-- info: 'TriAct.orientation_locks_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.orientation_locks_the_act
/-- info: 'TriAct.degenerate_is_characterless' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.degenerate_is_characterless
/-- info: 'TriAct.intDir_not_degenerate' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.intDir_not_degenerate
/-- info: 'TriAct.every_root_actuates' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.every_root_actuates
/-- info: 'TriAct.the_root_carries_three_axes' does not depend on any axioms -/
#guard_msgs in #print axioms TriAct.the_root_carries_three_axes
