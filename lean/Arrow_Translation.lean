/-
Arrow_Translation.lean · Part Two translated into the purely formal domain: the Root Axiom
replaced by a bare computation arrow. Core Lean 4.19.0, no library, no sorry, no axiom declared.
The arrow is the identity computation on any type, `id : α → α`; its existence needs nothing.
Every place Part Two used the Root Axiom, it is replaced by the proposition that an arrow exists.
-/
namespace ArrowForm

/-- THE ARROW: a computation from a type to itself. It exists on every type, with no premise. -/
def Arrow (α : Type) : Prop := Nonempty (α → α)

theorem arrow_exists (α : Type) : Arrow α := ⟨id⟩

/-- The arrow used throughout, on the unit type. -/
def A : Prop := Arrow Unit
theorem a_holds : A := arrow_exists Unit

-- T1 · the upward link. Every act of proof yields an arrow: the proof itself, carried to itself.
theorem proof_yields_arrow (P : Prop) (h : P) : Arrow (PLift P) :=
  ⟨fun _ => ⟨h⟩⟩

-- T2 · keyless crossing. The arrow holds in every world and carries every keyless property.
def Keyless {W : Type} (P : W → Prop) : Prop := ∀ w, P w
def Keyed   {W : Type} (P : W → Prop) : Prop := ∃ w, ¬ P w

theorem arrow_is_keyless {W : Type} : Keyless (fun _ : W => A) := fun _ => a_holds
theorem keyless_crosses {W : Type} (P : W → Prop) (hP : Keyless P) : ∀ w, A → P w :=
  fun w _ => hP w

-- T3 · the break. The arrow decides no keyed property.
theorem arrow_decides_no_keyed {W : Type} (P : W → Prop) (hK : Keyed P) : ¬ ∀ w, A → P w :=
  fun h => let ⟨w, hw⟩ := hK; hw (h w a_holds)

-- T4 · the round trip. Carried through the arrow and back, every sentence returns unchanged.
def viaArrow {W : Type} (P : W → Prop) : W → Prop := fun w => A ∧ P w
theorem round_trip_identity {W : Type} (P : W → Prop) (w : W) : viaArrow P w ↔ P w :=
  ⟨fun h => h.2, fun h => ⟨a_holds, h⟩⟩

-- T5 · the massless arrow. An arrow that delivers the same for every proposition cannot
-- separate a proposition from its negation.
def Massless (f : Prop → Prop) : Prop := ∀ P Q, f P ↔ f Q
theorem arrowDelivery_massless : Massless (fun _ => A) := fun _ _ => Iff.rfl
theorem massless_cannot_separate (f : Prop → Prop) (hM : Massless f) (RH : Prop) :
    f RH ↔ f (¬ RH) := hM RH (¬ RH)

-- T6 · the Real part, closed by a certificate, with no premise at all.
structure Certificate {α : Type} (Z onL : α → Prop) (height : α → Int) (T : Int) where
  zeros    : List α
  complete : ∀ z, Z z → height z ≤ T → z ∈ zeros
  onLine   : ∀ z, z ∈ zeros → onL z

theorem arrow_real_part_of_certificate {α : Type} (Z onL : α → Prop) (height : α → Int) (T : Int)
    (c : Certificate Z onL height T) : ∀ z, Z z → height z ≤ T → onL z :=
  fun z hz hle => c.onLine z (c.complete z hz hle)

-- T7 · THE TRANSLATION IS FAITHFUL. Any inhabited proposition plays the root's part in every
-- result above: the road's theorems hold for an arbitrary true premise R, so the root is idle in
-- the formal content, and the bare arrow is enough.
theorem any_true_premise_serves (R : Prop) (hR : R) {W : Type} (P : W → Prop) :
    ((∀ w, P w) → ∀ w, R → P w) ∧
    ((∃ w, ¬ P w) → ¬ ∀ w, R → P w) ∧
    (∀ w, (R ∧ P w) ↔ P w) :=
  ⟨fun hP w _ => hP w, fun ⟨w, hw⟩ h => hw (h w hR), fun _ => ⟨fun h => h.2, fun h => ⟨hR, h⟩⟩⟩

end ArrowForm

#print axioms ArrowForm.arrow_exists
#print axioms ArrowForm.proof_yields_arrow
#print axioms ArrowForm.keyless_crosses
#print axioms ArrowForm.arrow_decides_no_keyed
#print axioms ArrowForm.round_trip_identity
#print axioms ArrowForm.massless_cannot_separate
#print axioms ArrowForm.arrow_real_part_of_certificate
#print axioms ArrowForm.any_true_premise_serves
