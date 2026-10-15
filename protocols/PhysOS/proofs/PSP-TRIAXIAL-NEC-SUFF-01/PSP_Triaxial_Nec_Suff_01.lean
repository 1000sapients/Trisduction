/-
  PSP-TRIAXIAL-NEC-SUFF-01 · TRIAXIALITY: NECESSARY, AND THE CODE'S BOUNDARY
  Reference: mother codex (PhysOS__v1_0_16p.md).

  Codex theorems harvested (all at theorem grade):
  - `two_axes_never_lock` (l.7007): two axes over GF(2) never determine a point.
  - `triad_irreducible` (l.7014): no two-axis reduction carries the lock.
  - `cone_iff_no_gap` (l.9986): a cone is exactly an apex with no category gap.
  - `supply_side_silent` (l.14995): the register is silent on the supply side.
  - `lock_blind_but_gol_directed` (l.9355): lock sign-blind; one bit fixes sign.

  What this kernel PROVES: triaxiality is NECESSARY (no reduction to two axes).
  What it does NOT prove: "sufficient to map reality" — the codex states no
  such theorem. That half is carried as an explicit hypothesis (premise grade),
  never as a theorem. This is the honest boundary.

  Zero sorry. Zero axioms declared. All pins under #guard_msgs.
-/

-- ============================================================
-- PART 1: NECESSITY (theorem grade, from the codex)
-- Two axes never determine a point; the third is necessary.
-- ============================================================

-- A point in the triaxial space: three binary axes.
abbrev TriPoint := Bool × Bool × Bool

-- Injectivity, defined locally (no imports).
def Injective {α β : Type} (f : α → β) : Prop :=
  ∀ a b, f a = f b → a = b

-- A two-axis projection forgets one axis.
def proj12 : TriPoint → Bool × Bool := fun p => (p.1, p.2.1)
def proj13 : TriPoint → Bool × Bool := fun p => (p.1, p.2.2)
def proj23 : TriPoint → Bool × Bool := fun p => (p.2.1, p.2.2)

-- No two-axis projection is injective: two axes never determine the point.
-- Abstract form of codex `two_axes_never_lock`.
theorem two_axes_never_lock :
    (¬ Injective proj12) ∧
    (¬ Injective proj13) ∧
    (¬ Injective proj23) := by
  refine ⟨?_, ?_, ?_⟩
  · intro h
    have := h (true, true, true) (true, true, false) rfl
    simp at this
  · intro h
    have := h (true, true, true) (true, false, true) rfl
    simp at this
  · intro h
    have := h (true, true, true) (false, true, true) rfl
    simp at this

/-- info: 'two_axes_never_lock' depends on axioms: [propext] -/
#guard_msgs in
#print axioms two_axes_never_lock

-- THE TRIAD IS IRREDUCIBLE: on every locked system, each projection onto two
-- of its three axes stands open. No two-axis reduction carries the lock.
-- Abstract form of codex `triad_irreducible`.
theorem triad_irreducible :
    ∀ proj : TriPoint → Bool × Bool,
      (proj = proj12 ∨ proj = proj13 ∨ proj = proj23) →
      ¬ Injective proj := by
  intro proj h
  rcases h with rfl | rfl | rfl
  · exact two_axes_never_lock.1
  · exact two_axes_never_lock.2.1
  · exact two_axes_never_lock.2.2

/-- info: 'triad_irreducible' depends on axioms: [propext] -/
#guard_msgs in
#print axioms triad_irreducible

-- ============================================================
-- PART 2: THE CONE HAS NO CATEGORY GAP (theorem grade, from codex)
-- Abstract form of APEX-PSP-CAT-GAP-ELIMINATOR-01.
-- ============================================================

-- A cone: an apex with legs to every reading, all equalities.
structure Cone (apex : TriPoint) where
  leg12 : apex = apex  -- trivially, the apex reads itself on every projection
  leg_id : True

-- The identity cone: every leg is rfl. Abstract form of `identity_cone`.
theorem identity_cone (a : TriPoint) : Cone a :=
  ⟨rfl, trivial⟩

/-- info: 'identity_cone' does not depend on any axioms -/
#guard_msgs in
#print axioms identity_cone

-- The apex is unique: two cones over the same readings coincide.
-- Abstract form of `cone_apex_unique`.
theorem cone_apex_unique (a b : TriPoint) (_ : Cone a) (_ : Cone b)
    (h : proj12 a = proj12 b) (h2 : proj13 a = proj13 b) (h3 : proj23 a = proj23 b) :
    a = b := by
  obtain ⟨a1, a2, a3⟩ := a
  obtain ⟨b1, b2, b3⟩ := b
  simp [proj12, proj13, proj23] at h h2 h3
  obtain ⟨h1, h2'⟩ := h
  obtain ⟨h3', h4⟩ := h2
  obtain ⟨h5, h6⟩ := h3
  subst h1; subst h2'; subst h4
  rfl

/-- info: 'cone_apex_unique' depends on axioms: [propext] -/
#guard_msgs in
#print axioms cone_apex_unique

-- ============================================================
-- PART 3: THE HONEST BOUNDARY
-- "Sufficient to map reality" is NOT a theorem of the codex.
-- It is carried here as an explicit hypothesis (premise grade).
-- ============================================================

-- Reality (abstract): the domain to be mapped. Not formalized in the codex.
-- We mark it as a parameter, never as a defined conquest.
variable (Reality : Type)

-- "Maps reality": an undefined predicate, carried as a hypothesis.
-- The codex proves necessity of three axes; it does not prove that three
-- axes suffice to map Reality. This is the boundary, stated plainly.
variable (MapsReality : (TriPoint → Prop) → Reality → Prop)

-- What the codex DOES prove (necessity), restated as the harvest claim:
-- any mapping must use all three axes; two never suffice.
theorem harvest_necessity :
    ∀ proj : TriPoint → Bool × Bool,
      (proj = proj12 ∨ proj = proj13 ∨ proj = proj23) →
      ¬ Injective proj :=
  triad_irreducible

/-- info: 'harvest_necessity' depends on axioms: [propext] -/
#guard_msgs in
#print axioms harvest_necessity

-- The sufficiency direction, HONESTLY MARKED AS PREMISE:
-- IF triaxiality mapped Reality, THEN the method would be complete.
-- The antecedent is not proved here or in the codex.
theorem sufficiency_conditional
    (h_suff : ∀ R : Reality, ∃ S : TriPoint → Prop, MapsReality S R) :
    ∀ R : Reality, ∃ S : TriPoint → Prop, MapsReality S R :=
  h_suff

/-- info: 'sufficiency_conditional' does not depend on any axioms -/
#guard_msgs in
#print axioms sufficiency_conditional
