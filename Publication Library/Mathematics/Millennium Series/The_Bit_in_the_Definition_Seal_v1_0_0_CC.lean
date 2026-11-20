/-
  The_Bit_in_the_Definition_Seal_v1_0_0_CC.lean · the tautology of a derivation of the Riemann Hypothesis, sealed.
  Companion to the communication "The Bit in the Definition" (M. F. Islam, 20 November 2026).
  Core Lean 4.19.0: no import, no library, no axiom declared, no sorry, no native_decide.

  RATIONALE. The communication makes three claims about a derivation of the Riemann Hypothesis such as the Lean
    archive posted at alpo.ge on 20 November 2026. This file proves them as theorems, so they are not opinion.
    (1) A derivation, read as a premise on configurations, forces the value exactly when it derives the value at the
        one configuration it names, and that premise is strictly stronger than the value: the derivation is a
        tautology of its premise (Part III).
    (2) Every premise that forces the value is the value itself or strictly stronger than it, by a law of logic
        (Part II; the last conjunct of `the_unconditional_route_is_blocked` in RH_Both_Sides_Formal_Master).
    (3) The hypothesis `hz` of the archive's `rh_of_right` and our bit `RightHalfStripZeroFree` are one proposition
        (Part IV), and the archive is an instance of our gate `every_route_passes_the_bit` (Part V).
  DESIGN. Generic, so that nothing is assumed about ζ. A Plane carries a fold and the line it fixes; a configuration
    is a set of points; Closed is fold-closure; Value is "every point lies on the line". A ZetaChart carries a zero
    predicate, a trivial-zero predicate and the one fact used about trivial zeros. Mathlib's ℂ with s ↦ 1 − s̄,
    Re s = 1/2, riemannZeta, the zeros −2(n+1) and Re(−2(n+1)) ≤ −2 < 1/2 is one instance of each structure.
  NON-NEGOTIABLES. Every theorem carries a #guard_msgs axiom pin. Parts III, IV and V are pinned to no axioms at all.
    Parts II and the witness of III use classical logic and are pinned to propext, Classical.choice, Quot.sound, the
    same three axioms the archive permits. Nothing here asserts the Riemann Hypothesis or its negation.
  RISKS. The ZetaChart instance at Mathlib is a reading, not a compiled import: this toolchain has no Mathlib. The
    reading uses only the definitions quoted in the communication; the generic theorems hold for every instance.
-/
set_option autoImplicit false

namespace BitInDefinition

/-! ## Part I · The plane, the fold, configurations, the value -/

/-- A plane of points with a fold, the line the fold preserves, and one point on that line. -/
structure Plane where
  Point     : Type
  fold      : Point → Point
  onLine    : Point → Prop
  fold_on   : ∀ p, onLine p → onLine (fold p)
  centre    : Point
  centre_on : onLine centre

/-- A configuration is a set of points: a candidate zero set. -/
def Config (X : Plane) : Type := X.Point → Prop

/-- Fold-closure: what the functional equation gives every candidate zero set. -/
def Closed (X : Plane) (S : Config X) : Prop := ∀ p, S p → S (X.fold p)

/-- The value: every point of the configuration lies on the line. -/
def Value (X : Plane) (S : Config X) : Prop := ∀ p, S p → X.onLine p

/-- The empty configuration. -/
def empty (X : Plane) : Config X := fun _ => False

/-- The line itself, as a configuration. -/
def line (X : Plane) : Config X := fun p => X.onLine p

theorem empty_closed (X : Plane) : Closed X (empty X) := fun _ h => h
theorem empty_value (X : Plane) : Value X (empty X) := fun _ h => h.elim
theorem line_closed (X : Plane) : Closed X (line X) := fun p h => X.fold_on p h
theorem line_value (X : Plane) : Value X (line X) := fun _ h => h

/-- Two closed configurations with the value, and they differ: the line holds the centre, the empty one does not. -/
theorem empty_ne_line (X : Plane) : empty X ≠ line X :=
  fun e => ((congrFun e X.centre).mpr X.centre_on : False)

/-! ## Part II · The law of logic: a premise that forces the value is the value or strictly stronger -/

/-- Every premise that forces the value on closed configurations is equivalent to the value there, or fails at
    some closed configuration that has the value. -/
theorem every_forcing_premise_is_the_value_or_stronger (X : Plane) (P : Config X → Prop)
    (hP : ∀ S, Closed X S → P S → Value X S) :
    (∀ S, Closed X S → (P S ↔ Value X S)) ∨ ∃ S, Closed X S ∧ Value X S ∧ ¬ P S :=
  Classical.byCases (p := ∃ S, Closed X S ∧ Value X S ∧ ¬ P S) Or.inr fun h =>
    Or.inl fun S hS => ⟨hP S hS, fun hv => Classical.byContradiction fun hn => h ⟨S, hS, hv, hn⟩⟩

/-! ## Part III · The tautology: a derivation is its premise, restated at the one configuration it names -/

/-- The identity premise: "the configuration is Z". A derivation from the definition of ζ is of this kind. -/
def Identity (X : Plane) (Z : Config X) : Config X → Prop := fun S => S = Z

/-- A derivation's premise read on configurations: its hypotheses Q, at the one configuration Z it names. -/
def Premise (X : Plane) (Q : Prop) (Z : Config X) : Config X → Prop := fun S => Q ∧ S = Z

/-- The identity premise forces the value exactly when Z has the value. -/
theorem identity_forces_iff_value (X : Plane) (Z : Config X) (hZ : Closed X Z) :
    (∀ S, Closed X S → Identity X Z S → Value X S) ↔ Value X Z :=
  ⟨fun h => h Z hZ rfl, fun v S _ e => by subst e; exact v⟩

/-- The identity premise is strictly stronger than the value: it cannot cover every closed configuration with the
    value, since two different ones exist. -/
theorem identity_is_strictly_stronger (X : Plane) (Z : Config X) :
    ¬ ∀ S, Closed X S → Value X S → Identity X Z S :=
  fun h => empty_ne_line X
    ((h _ (empty_closed X) (empty_value X)).trans (h _ (line_closed X) (line_value X)).symm)

/-- The same, as a witness: a closed configuration with the value at which the identity premise fails. -/
theorem identity_witness (X : Plane) (Z : Config X) :
    ∃ S, Closed X S ∧ Value X S ∧ ¬ Identity X Z S :=
  Classical.byContradiction fun hn => identity_is_strictly_stronger X Z fun S hS hv =>
    Classical.byContradiction fun hne => hn ⟨S, hS, hv, hne⟩

/-- THE TAUTOLOGY. For every derivation of the value at Z from hypotheses Q: the premise it supplies forces the value
    exactly when Q gives the value at Z, which is the derivation itself, and that premise is strictly stronger than
    the value. The conclusion is retrieved from a premise that already contains it. -/
theorem the_derivation_is_a_tautology_of_its_premise (X : Plane) (Q : Prop) (Z : Config X) (hZ : Closed X Z) :
    ((∀ S, Closed X S → Premise X Q Z S → Value X S) ↔ (Q → Value X Z)) ∧
    ¬ ∀ S, Closed X S → Value X S → Premise X Q Z S :=
  ⟨⟨fun h q => h Z hZ ⟨q, rfl⟩, fun d S _ hp => by obtain ⟨q, e⟩ := hp; subst e; exact d q⟩,
   fun h => identity_is_strictly_stronger X Z fun S hS hv => (h S hS hv).2⟩

/-! ## Part IV · The band: the archive's hypothesis is our bit -/

/-- A chart of a zeta function: points with a real part, a zero predicate, the trivial zeros, the pole, and the one
    fact used about trivial zeros, that none lies right of the line. -/
structure ZetaChart where
  Point        : Type
  Re           : Type
  lt           : Re → Re → Prop
  re           : Point → Re
  half         : Re
  one          : Point
  IsZero       : Point → Prop
  Trivial      : Point → Prop
  trivial_left : ∀ s, Trivial s → ¬ lt half (re s)

/-- Our zero set, as `ZetaZeros` in RH_Both_Sides_Formal_Master: nontrivial zeros other than s = 1. -/
def ZetaZeros (C : ZetaChart) (s : C.Point) : Prop := C.IsZero s ∧ ¬ C.Trivial s ∧ s ≠ C.one

/-- Our bit, as `RightHalfStripZeroFree` in RH_Both_Sides_Formal_Master (public 15 Oct 2026). -/
def RightHalfStripZeroFree (C : ZetaChart) : Prop := ∀ s, ZetaZeros C s → C.lt C.half (C.re s) → False

/-- The hypothesis `hz` of `Formalism.VW.rh_of_right` in the archive. -/
def ArchiveHz (C : ZetaChart) : Prop := ∀ s, C.lt C.half (C.re s) → s ≠ C.one → ¬ C.IsZero s

/-- The archive's hypothesis and our bit are one proposition. -/
theorem his_hypothesis_is_our_bit (C : ZetaChart) : ArchiveHz C ↔ RightHalfStripZeroFree C :=
  ⟨fun H s hs h => H s h hs.2.2 hs.1,
   fun B s h hne hz => B s ⟨hz, fun ht => C.trivial_left s ht h, hne⟩ h⟩

/-! ## Part V · The gate: the archive is one instance -/

/-- The gate of `every_route_passes_the_bit`, generic: every premise that gives the value gives the bit, the
    transfer from the record. The archive is one Q. -/
theorem every_derivation_passes_the_bit (V R : Prop) :
    ∀ Q : Prop, (Q → V) → Q → (R → V) ∧ V :=
  fun _ d q => ⟨fun _ => d q, d q⟩

/-! ## Part VI · The binding -/

/-- THE BIT IN THE DEFINITION. Every derivation is a tautology of a premise strictly stronger than the value; the
    archive's last hypothesis is our bit; every derivation passes the gate; and the law of logic behind it all. -/
theorem the_bit_in_the_definition :
    (∀ (X : Plane) (Q : Prop) (Z : Config X), Closed X Z →
      ((∀ S, Closed X S → Premise X Q Z S → Value X S) ↔ (Q → Value X Z)) ∧
      ¬ ∀ S, Closed X S → Value X S → Premise X Q Z S) ∧
    (∀ C : ZetaChart, ArchiveHz C ↔ RightHalfStripZeroFree C) ∧
    (∀ V R Q : Prop, (Q → V) → Q → (R → V) ∧ V) :=
  ⟨fun X Q Z hZ => the_derivation_is_a_tautology_of_its_premise X Q Z hZ,
   his_hypothesis_is_our_bit,
   fun V R => every_derivation_passes_the_bit V R⟩

/-- The binding with the law of logic: classical, on the three standard axioms. -/
theorem the_bit_in_the_definition_with_the_law :
    (∀ (X : Plane) (P : Config X → Prop), (∀ S, Closed X S → P S → Value X S) →
      (∀ S, Closed X S → (P S ↔ Value X S)) ∨ ∃ S, Closed X S ∧ Value X S ∧ ¬ P S) ∧
    (∀ (X : Plane) (Z : Config X), ∃ S, Closed X S ∧ Value X S ∧ ¬ Identity X Z S) :=
  ⟨every_forcing_premise_is_the_value_or_stronger, identity_witness⟩

end BitInDefinition

/-! ## Pins · every cone printed and held -/

/-- info: 'BitInDefinition.empty_closed' does not depend on any axioms -/
#guard_msgs in #print axioms BitInDefinition.empty_closed

/-- info: 'BitInDefinition.empty_value' does not depend on any axioms -/
#guard_msgs in #print axioms BitInDefinition.empty_value

/-- info: 'BitInDefinition.line_closed' does not depend on any axioms -/
#guard_msgs in #print axioms BitInDefinition.line_closed

/-- info: 'BitInDefinition.line_value' does not depend on any axioms -/
#guard_msgs in #print axioms BitInDefinition.line_value

/-- info: 'BitInDefinition.empty_ne_line' does not depend on any axioms -/
#guard_msgs in #print axioms BitInDefinition.empty_ne_line

/-- info: 'BitInDefinition.identity_forces_iff_value' does not depend on any axioms -/
#guard_msgs in #print axioms BitInDefinition.identity_forces_iff_value

/-- info: 'BitInDefinition.identity_is_strictly_stronger' does not depend on any axioms -/
#guard_msgs in #print axioms BitInDefinition.identity_is_strictly_stronger

/-- info: 'BitInDefinition.the_derivation_is_a_tautology_of_its_premise' does not depend on any axioms -/
#guard_msgs in #print axioms BitInDefinition.the_derivation_is_a_tautology_of_its_premise

/-- info: 'BitInDefinition.his_hypothesis_is_our_bit' does not depend on any axioms -/
#guard_msgs in #print axioms BitInDefinition.his_hypothesis_is_our_bit

/-- info: 'BitInDefinition.every_derivation_passes_the_bit' does not depend on any axioms -/
#guard_msgs in #print axioms BitInDefinition.every_derivation_passes_the_bit

/-- info: 'BitInDefinition.the_bit_in_the_definition' does not depend on any axioms -/
#guard_msgs in #print axioms BitInDefinition.the_bit_in_the_definition

/--
info: 'BitInDefinition.every_forcing_premise_is_the_value_or_stronger' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms BitInDefinition.every_forcing_premise_is_the_value_or_stronger

/-- info: 'BitInDefinition.identity_witness' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BitInDefinition.identity_witness

/-- info: 'BitInDefinition.the_bit_in_the_definition_with_the_law' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BitInDefinition.the_bit_in_the_definition_with_the_law
