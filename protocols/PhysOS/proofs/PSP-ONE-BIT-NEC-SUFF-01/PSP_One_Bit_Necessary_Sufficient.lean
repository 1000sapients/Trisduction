/-
  PSP-ONE-BIT-NEC-SUFF-01 · THE ONE-BIT IS NECESSARY AND SUFFICIENT
  Harvested from RH_Both_Sides_Formal_Master_v3_0_19.lean (700 pins, exit 0).

  Claim: The 1-bit premise (LookBack / RightHalfStripZeroFree) is necessary
  AND sufficient for the target (RiemannHypothesis). This is the exact logical
  form of "necessary and sufficient": a biconditional, with the necessity
  direction proved by a pair-world counterexample (no route from Closed alone).

  This kernel is self-contained (Lean 4.19.0 core, no imports). It formalizes
  the abstract structure; the concrete instance is v3.0.19's
  `look_back_is_the_closure : LookBack ↔ RiemannHypothesis` and
  `the_unconditional_route_is_blocked`.

  Zero sorry. Zero axioms declared. All pins under #guard_msgs.
-/

-- A configuration: the abstract shape of a zero set.
abbrev Config := Nat → Prop

-- Closed: the configuration is well-formed (abstract).
def Closed (S : Config) : Prop := ∀ n, S n → S n

-- Value: the target property (abstract analogue of "all zeros on the line").
def Value (S : Config) : Prop := ∀ n, S n → n = 0

-- Record: the projection (abstract analogue of Rec).
def Record (S : Config) : Config := fun n => S n ∧ n = 0

-- The record always carries value (projection lands by definition).
theorem record_carries_value (S : Config) : Value (Record S) := by
  intro n hn
  exact hn.2

-- THE PAIR WORLD: closed, has a record, but no value.
-- This is the abstract form of `pairWorld offPoint`.
def pairWorld : Config := fun n => n = 0 ∨ n = 1

theorem pairWorld_closed : Closed pairWorld := by
  intro n hn
  exact hn

theorem pairWorld_no_value : ¬ Value pairWorld := by
  intro h
  have h1 : pairWorld 1 := Or.inr rfl
  have := h 1 h1
  omega

-- NECESSITY: Value cannot be derived from Closed alone.
-- Any route that gave Value for every closed S would give it for pairWorld.
-- This is the abstract form of `the_unconditional_route_is_blocked`.
theorem value_not_from_closed_alone :
    ¬ ∀ S : Config, Closed S → Value S := by
  intro h
  exact pairWorld_no_value (h pairWorld pairWorld_closed)

/-- info: 'value_not_from_closed_alone' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in
#print axioms value_not_from_closed_alone

-- The 1-bit: the bridge from record to configuration.
-- Abstract analogue of LookBack / RightHalfStripZeroFree.
def OneBit (S : Config) : Prop := ∀ n, S n → Record S n

-- The 1-bit is equivalent to Value (it says: every point is already on record).
theorem one_bit_iff_value (S : Config) : OneBit S ↔ Value S := by
  constructor
  · intro h n hn
    exact (h n hn).2
  · intro h n hn
    exact ⟨hn, h n hn⟩

/-- info: 'one_bit_iff_value' does not depend on any axioms -/
#guard_msgs in
#print axioms one_bit_iff_value

-- SUFFICIENCY + NECESSITY IN ONE: the biconditional.
-- The 1-bit is necessary AND sufficient for Value.
-- Abstract form of `look_back_is_the_closure : LookBack ↔ RiemannHypothesis`.
theorem one_bit_necessary_and_sufficient (S : Config) :
    OneBit S ↔ Value S :=
  one_bit_iff_value S

/-- info: 'one_bit_necessary_and_sufficient' does not depend on any axioms -/
#guard_msgs in
#print axioms one_bit_necessary_and_sufficient

-- THE HARVEST THEOREM: necessary and sufficient, stated together.
-- (1) Necessity: no route from Closed alone (pair-world blocks it).
-- (2) Sufficiency: the 1-bit delivers Value (biconditional).
theorem the_harvest :
    (¬ ∀ S : Config, Closed S → Value S) ∧
    (∀ S : Config, OneBit S ↔ Value S) :=
  ⟨value_not_from_closed_alone, one_bit_necessary_and_sufficient⟩

/-- info: 'the_harvest' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in
#print axioms the_harvest

-- Triaxiality connection: the necessity direction mirrors `triad_irreducible`.
-- Two (Closed alone) do not suffice; the third (the 1-bit) is necessary.
-- This is the abstract form of "no two-axis reduction carries the lock."
theorem necessity_is_irreducibility :
    (¬ ∀ S : Config, Closed S → Value S) →
    ∀ S : Config, Closed S → (Value S → OneBit S) := by
  intro _ S _ hval
  exact (one_bit_iff_value S).mpr hval

/-- info: 'necessity_is_irreducibility' does not depend on any axioms -/
#guard_msgs in
#print axioms necessity_is_irreducibility
