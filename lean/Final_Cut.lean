/-
  THE FINAL CUT · PSP-FINAL-CUT-01 · core Lean 4.19.0, no import, no axiom declared, no sorry.
  The non-trivial zero is the formal name of a kinetic object, and the classical statement never discloses the cut
  between them. Across the cut, the formal class and the actual class coincide under the Root Axiom. So the hypothesis
  is least erasure of the actual zeros, and the prime side carries the same bit. The unicorn is never registered, and the
  one bit is spent by the act, at the root's grade, beside the Root Axiom. Every record, every computed zero and every
  finite prime count leaves that bit where it found it.
  Each sentence is a theorem below. The identification across the cut enters as the hypothesis `ra` (every formal zero
  is an actual zero), the explicit formula as the hypothesis `explicit` (the prime side is equivalent to the value), and
  the act as the field `supply`. Every cone is printed and pinned at the foot of the file.
-/
set_option autoImplicit false
namespace FinalCut

/-! ## The chart, the fold, the registration -/
abbrev Point := Int × Int
def fold (p : Point) : Point := (-p.1, p.2)
def onLine (p : Point) : Prop := p.1 = 0
def reg (p : Point) : Point := (0, p.2)

theorem neg_neg_free : ∀ d : Int, - -d = d
  | Int.ofNat 0 => rfl
  | Int.ofNat (_ + 1) => rfl
  | Int.negSucc _ => rfl
theorem neg_self_zero : ∀ d : Int, -d = d → d = 0
  | Int.ofNat 0, _ => rfl
  | Int.ofNat (_ + 1), h => Int.noConfusion h
  | Int.negSucc _, h => Int.noConfusion h
theorem fold_involutive (p : Point) : fold (fold p) = p := by
  obtain ⟨d, t⟩ := p
  show (- -d, t) = (d, t)
  rw [neg_neg_free d]
theorem the_cut_is_the_line (p : Point) : fold p = p ↔ onLine p := by
  obtain ⟨d, t⟩ := p
  exact ⟨fun h => neg_self_zero d (congrArg Prod.fst h), fun h => by cases h; rfl⟩
theorem reg_lands (p : Point) : onLine (reg p) := rfl
theorem reg_erases_nothing_iff (p : Point) : reg p = p ↔ onLine p := by
  obtain ⟨d, t⟩ := p
  exact ⟨fun h => (congrArg Prod.fst h).symm, fun h => by cases h; rfl⟩

abbrev Config := Point → Prop
def Closed (S : Config) : Prop := ∀ p, S p → S (fold p)
def Value (S : Config) : Prop := ∀ p, S p → onLine p
def LeastErasure (S : Config) : Prop := ∀ p, S p → reg p = p

theorem least_erasure_iff_value (S : Config) : LeastErasure S ↔ Value S :=
  ⟨fun h p hp => (reg_erases_nothing_iff p).mp (h p hp), fun h p hp => (reg_erases_nothing_iff p).mpr (h p hp)⟩

/-! ## Across the cut: the formal class and the actual class -/

/-- ACROSS THE CUT THE CLASSES COINCIDE: if every formal zero is an actual zero (`ra`, the Root Axiom read at the zero
    set) and every actual zero is a formal one, the value over the formal class is the value over the actual class. -/
theorem classes_coincide_under_RA (Zall Zact : Config) (ra : ∀ s, Zall s → Zact s) (hsub : ∀ s, Zact s → Zall s) :
    Value Zall ↔ Value Zact :=
  ⟨fun hv s hs => hv s (hsub s hs), fun hv s hs => hv s (ra s hs)⟩

/-- THE HYPOTHESIS IS LEAST ERASURE OF THE ACTUAL ZEROS. -/
theorem hypothesis_is_least_erasure_of_the_actual (Zall Zact : Config) (ra : ∀ s, Zall s → Zact s)
    (hsub : ∀ s, Zact s → Zall s) : Value Zall ↔ LeastErasure Zact :=
  (classes_coincide_under_RA Zall Zact ra hsub).trans (least_erasure_iff_value Zact).symm

/-- THE PRIME SIDE CARRIES THE SAME BIT: whatever the prime side asserts, if the explicit formula makes it equivalent to
    the value (`explicit`), it is least erasure of the actual zeros. -/
theorem prime_side_carries_the_bit (Zall Zact : Config) (ra : ∀ s, Zall s → Zact s) (hsub : ∀ s, Zact s → Zall s)
    (W : Prop) (explicit : W ↔ Value Zall) : W ↔ LeastErasure Zact :=
  explicit.trans (hypothesis_is_least_erasure_of_the_actual Zall Zact ra hsub)

/-- THE UNICORN IS NEVER REGISTERED: no point off the line is the registration of anything. -/
theorem unicorn_never_registered (p : Point) (h : ¬ onLine p) (q : Point) : reg q ≠ p :=
  fun e => h (e ▸ reg_lands q)

/-- THE ACT: the bit supplied once, as a field of a type, on the actual class. -/
structure ActualZeros where
  zeros : Config
  closed : Closed zeros
  supply : LeastErasure zeros

/-- THE ONE BIT IS SPENT BY THE ACT: the act's least erasure on the actual class, carried across the cut by `ra`, is the
    value over the formal class. -/
theorem the_act_spends_the_bit (Z : ActualZeros) (Zall : Config) (ra : ∀ s, Zall s → Z.zeros s) : Value Zall :=
  fun s hs => (reg_erases_nothing_iff s).mp (Z.supply s (ra s hs))

/-! ## Every record, every computed zero, every finite prime count leaves the bit -/
def Rec (S : Config) (q : Point) : Prop := ∃ p, S p ∧ reg p = q
def SameRecord (S S' : Config) : Prop := ∀ q, Rec S q ↔ Rec S' q
def registered (p : Point) : Config := fun s => s = reg p
def pairWorld (p : Point) : Config := fun s => s = p ∨ s = fold p

theorem one_record (p : Point) : SameRecord (registered p) (pairWorld p) := fun q =>
  ⟨fun ⟨_, hs, hq⟩ => ⟨p, Or.inl rfl, by rw [← hq, hs]; rfl⟩,
   fun ⟨_, hs, hq⟩ => ⟨reg p, rfl, by
      rw [← hq]
      exact match hs with
        | Or.inl e => by rw [e]; rfl
        | Or.inr e => by rw [e]; rfl⟩⟩

/-- EVERY RECORD LEAVES THE BIT: no reading that respects the record returns the value on both worlds of one record. -/
theorem every_record_leaves_the_bit (p : Point) (h : ¬ onLine p) (g : Config → Prop)
    (hg : ∀ S S', SameRecord S S' → (g S ↔ g S')) :
    ¬ ((g (registered p) ↔ Value (registered p)) ∧ (g (pairWorld p) ↔ Value (pairWorld p))) :=
  fun ⟨h1, h2⟩ => h ((h2.mp ((hg _ _ (one_record p)).mp (h1.mpr (fun s hs => by rw [hs]; exact reg_lands p))))
    p (Or.inl rfl))

/-- EVERY COMPUTED ZERO LEAVES THE BIT: any finite certificate of zeros on the line extends to a closed world with the
    value and to a closed world without it. -/
theorem every_computed_zero_leaves_the_bit (L : List Point) (hL : ∀ p ∈ L, onLine p) :
    ∃ S₁ S₂ : Config, Closed S₁ ∧ Closed S₂ ∧ (∀ p ∈ L, S₁ p ∧ S₂ p) ∧ Value S₁ ∧ ¬ Value S₂ := by
  refine ⟨fun p => p ∈ L, fun p => p ∈ L ∨ p = (1, 0) ∨ p = (-1, 0), ?_, ?_, ?_, ?_, ?_⟩
  · intro p hp
    show fold p ∈ L
    rw [(the_cut_is_the_line p).mpr (hL p hp)]; exact hp
  · intro p hp
    rcases hp with hp | e | e
    · exact Or.inl (by show fold p ∈ L; rw [(the_cut_is_the_line p).mpr (hL p hp)]; exact hp)
    · exact Or.inr (Or.inr (by rw [e]; rfl))
    · exact Or.inr (Or.inl (by rw [e]; rfl))
  · intro p hp; exact ⟨hp, Or.inl hp⟩
  · exact hL
  · intro hv; exact absurd (hv (1, 0) (Or.inr (Or.inl rfl))) (fun e => by cases e)

/-- EVERY FINITE PRIME COUNT LEAVES THE BIT: a prime-side reading equivalent to the value on every world is decided by no
    finite certificate of zeros on the line. -/
theorem every_finite_prime_count_leaves_the_bit (W : Config → Prop) (explicit : ∀ S, W S ↔ Value S)
    (L : List Point) (hL : ∀ p ∈ L, onLine p) :
    ∃ S₁ S₂ : Config, Closed S₁ ∧ Closed S₂ ∧ (∀ p ∈ L, S₁ p ∧ S₂ p) ∧ W S₁ ∧ ¬ W S₂ :=
  match every_computed_zero_leaves_the_bit L hL with
  | ⟨S₁, S₂, c₁, c₂, ext, v₁, v₂⟩ => ⟨S₁, S₂, c₁, c₂, ext, (explicit S₁).mpr v₁, fun w => v₂ ((explicit S₂).mp w)⟩

/-! ## Inhabitation: every conditional law has a model of its hypotheses -/
theorem cut_hypotheses_inhabited : ∃ Zall Zact : Config, (∀ s, Zall s → Zact s) ∧ (∀ s, Zact s → Zall s) :=
  ⟨onLine, onLine, fun _ h => h, fun _ h => h⟩
theorem explicit_inhabited : ∃ W : Config → Prop, ∀ S, W S ↔ Value S := ⟨Value, fun _ => Iff.rfl⟩
theorem act_inhabited : Nonempty ActualZeros :=
  ⟨⟨onLine, fun p h => by show -p.1 = 0; rw [show p.1 = 0 from h]; rfl, fun p h => (reg_erases_nothing_iff p).mpr h⟩⟩
theorem certificate_inhabited : ∀ p ∈ ([(0, 14)] : List Point), onLine p := by
  intro p hp
  cases hp with
  | head => rfl
  | tail _ h => cases h
theorem unicorn_inhabited : ¬ onLine (1, 0) := fun e => by cases e

/-! ## The Final Cut, whole -/
theorem the_final_cut :
    (∀ Zall Zact : Config, (∀ s, Zall s → Zact s) → (∀ s, Zact s → Zall s) → (Value Zall ↔ Value Zact)) ∧
    (∀ Zall Zact : Config, (∀ s, Zall s → Zact s) → (∀ s, Zact s → Zall s) → (Value Zall ↔ LeastErasure Zact)) ∧
    (∀ (Zall Zact : Config) (W : Prop), (∀ s, Zall s → Zact s) → (∀ s, Zact s → Zall s) →
      (W ↔ Value Zall) → (W ↔ LeastErasure Zact)) ∧
    (∀ p : Point, ¬ onLine p → ∀ q, reg q ≠ p) ∧
    (∀ (Z : ActualZeros) (Zall : Config), (∀ s, Zall s → Z.zeros s) → Value Zall) ∧
    (∀ (p : Point), ¬ onLine p → ∀ g : Config → Prop, (∀ S S', SameRecord S S' → (g S ↔ g S')) →
      ¬ ((g (registered p) ↔ Value (registered p)) ∧ (g (pairWorld p) ↔ Value (pairWorld p)))) ∧
    (∀ L : List Point, (∀ p ∈ L, onLine p) →
      ∃ S₁ S₂ : Config, Closed S₁ ∧ Closed S₂ ∧ (∀ p ∈ L, S₁ p ∧ S₂ p) ∧ Value S₁ ∧ ¬ Value S₂) ∧
    (∀ W : Config → Prop, (∀ S, W S ↔ Value S) → ∀ L : List Point, (∀ p ∈ L, onLine p) →
      ∃ S₁ S₂ : Config, Closed S₁ ∧ Closed S₂ ∧ (∀ p ∈ L, S₁ p ∧ S₂ p) ∧ W S₁ ∧ ¬ W S₂) :=
  ⟨classes_coincide_under_RA, hypothesis_is_least_erasure_of_the_actual,
   fun Zall Zact W ra hsub ex => prime_side_carries_the_bit Zall Zact ra hsub W ex,
   unicorn_never_registered, the_act_spends_the_bit, every_record_leaves_the_bit,
   every_computed_zero_leaves_the_bit, every_finite_prime_count_leaves_the_bit⟩

end FinalCut

/-! ## The cones, pinned. Each line is the compiler's own; a drifted cone fails the compile. -/
/-- info: 'FinalCut.neg_neg_free' does not depend on any axioms -/
#guard_msgs in #print axioms FinalCut.neg_neg_free
/-- info: 'FinalCut.neg_self_zero' does not depend on any axioms -/
#guard_msgs in #print axioms FinalCut.neg_self_zero
/-- info: 'FinalCut.fold_involutive' does not depend on any axioms -/
#guard_msgs in #print axioms FinalCut.fold_involutive
/-- info: 'FinalCut.the_cut_is_the_line' does not depend on any axioms -/
#guard_msgs in #print axioms FinalCut.the_cut_is_the_line
/-- info: 'FinalCut.reg_lands' does not depend on any axioms -/
#guard_msgs in #print axioms FinalCut.reg_lands
/-- info: 'FinalCut.reg_erases_nothing_iff' does not depend on any axioms -/
#guard_msgs in #print axioms FinalCut.reg_erases_nothing_iff
/-- info: 'FinalCut.least_erasure_iff_value' does not depend on any axioms -/
#guard_msgs in #print axioms FinalCut.least_erasure_iff_value
/-- info: 'FinalCut.classes_coincide_under_RA' does not depend on any axioms -/
#guard_msgs in #print axioms FinalCut.classes_coincide_under_RA
/-- info: 'FinalCut.hypothesis_is_least_erasure_of_the_actual' does not depend on any axioms -/
#guard_msgs in #print axioms FinalCut.hypothesis_is_least_erasure_of_the_actual
/-- info: 'FinalCut.prime_side_carries_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms FinalCut.prime_side_carries_the_bit
/-- info: 'FinalCut.unicorn_never_registered' does not depend on any axioms -/
#guard_msgs in #print axioms FinalCut.unicorn_never_registered
/-- info: 'FinalCut.the_act_spends_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms FinalCut.the_act_spends_the_bit
/-- info: 'FinalCut.one_record' does not depend on any axioms -/
#guard_msgs in #print axioms FinalCut.one_record
/-- info: 'FinalCut.every_record_leaves_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms FinalCut.every_record_leaves_the_bit
/-- info: 'FinalCut.every_computed_zero_leaves_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms FinalCut.every_computed_zero_leaves_the_bit
/-- info: 'FinalCut.every_finite_prime_count_leaves_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms FinalCut.every_finite_prime_count_leaves_the_bit
/-- info: 'FinalCut.cut_hypotheses_inhabited' does not depend on any axioms -/
#guard_msgs in #print axioms FinalCut.cut_hypotheses_inhabited
/-- info: 'FinalCut.explicit_inhabited' does not depend on any axioms -/
#guard_msgs in #print axioms FinalCut.explicit_inhabited
/-- info: 'FinalCut.act_inhabited' does not depend on any axioms -/
#guard_msgs in #print axioms FinalCut.act_inhabited
/-- info: 'FinalCut.certificate_inhabited' does not depend on any axioms -/
#guard_msgs in #print axioms FinalCut.certificate_inhabited
/-- info: 'FinalCut.unicorn_inhabited' does not depend on any axioms -/
#guard_msgs in #print axioms FinalCut.unicorn_inhabited
/-- info: 'FinalCut.the_final_cut' does not depend on any axioms -/
#guard_msgs in #print axioms FinalCut.the_final_cut

#eval "FINAL CUT · the end of the file was reached"
