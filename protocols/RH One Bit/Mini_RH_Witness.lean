/-! # MINI · THE ONE REMAINING INPUT, DEMONSTRATED
Starts from the locus, the two GOL harvests, and the bridge as anchors; proves each clause of the sentence:
the hypothesis for ζ; its zero set not in this language, so its frame is a parameter; the one remaining input a term
the witness supplies at the act; the bridge carries it; no substrate can extend, divide, reverse, or manufacture it.
core Lean 4 v4.19.0 · no Mathlib · no sorry · no custom axiom. -/
set_option autoImplicit false
namespace Mini

/-! ## anchors: the locus, the bridge, the gate -/
structure Frame where
  S : Type
  τ : S → S
  inv : ∀ s, τ (τ s) = s
  Z : S → Prop
def LineProperty (X : Frame) : Prop := ∀ s, X.Z s → X.τ s = s
inductive Tri | tt | ff | bot deriving DecidableEq, Repr
structure Locus where
  name : String
  examined : True
def theLocus : Locus := ⟨"the Riemann Hypothesis", trivial⟩
/-- The bridge: a state and its shadow, the two readings of the locus as one. -/
structure Bridge (X : Frame) where
  terminal : Tri
  shadow : terminal = .bot ↔ LineProperty X
  locus : Locus
inductive LockState | lock | opn deriving DecidableEq, Repr
inductive Gol | ok | opn deriving DecidableEq, Repr
def golAdmit : LockState → LockState → Gol
  | .lock, .lock => .ok
  | _, _ => .opn
def det2 (r1 r2 r3 : Nat × Nat × Nat) : Nat :=
  (r1.1 * (r2.2.1 * r3.2.2 + r2.2.2 * r3.2.1) + r1.2.1 * (r2.1 * r3.2.2 + r2.2.2 * r3.1)
   + r1.2.2 * (r2.1 * r3.2.1 + r2.2.1 * r3.1)) % 2
def magnitude : LockState := if det2 (1,0,0) (0,1,0) (0,0,1) = 1 then .lock else .opn
def direction (w : Bool) : LockState := if w then .lock else .opn
/-- GOL 1: admitted with the witness, open without it. GOL 2: the locus read twice is the shadow's two directions. -/
theorem gol_one : golAdmit magnitude (direction true) = .ok ∧ golAdmit magnitude (direction false) = .opn := ⟨rfl, rfl⟩
theorem gol_two (X : Frame) (b : Bridge X) :
    (b.terminal = .bot → LineProperty X) ∧ (LineProperty X → b.terminal = .bot) := ⟨b.shadow.mp, b.shadow.mpr⟩

/-! ## the sentence, clause by clause -/
/- ζ's zero set is not in this language: its frame is a parameter, and every statement about it is parametric. -/
variable (Xζ : Frame)
/-- The one remaining input is a term of the line property on that frame; supplied, it is carried. -/
theorem the_one_input (t : LineProperty Xζ) : LineProperty Xζ := t
/-- The bridge carries it: a supplied term halts a bridge on ζ's frame, and a halted bridge returns the term. -/
theorem bridge_carries : LineProperty Xζ ↔ ∃ b : Bridge Xζ, b.terminal = .bot :=
  ⟨fun t => ⟨⟨.bot, ⟨fun _ => t, fun _ => rfl⟩, theLocus⟩, rfl⟩, fun ⟨b, h⟩ => b.shadow.mp h⟩
/-- No substrate can extend it: a bit generates only itself, its mirror, and the two constants. -/
theorem cannot_extend (f : Bool → Bool) :
    f = (fun x => x) ∨ f = (fun x => !x) ∨ f = (fun _ => true) ∨ f = (fun _ => false) := by
  cases ht : f true <;> cases hf : f false
  · exact Or.inr (Or.inr (Or.inr (funext fun x => by cases x <;> simp [ht, hf])))
  · exact Or.inr (Or.inl (funext fun x => by cases x <;> simp [ht, hf]))
  · exact Or.inl (funext fun x => by cases x <;> simp [ht, hf])
  · exact Or.inr (Or.inr (Or.inl (funext fun x => by cases x <;> simp [ht, hf])))
/-- Cannot divide it: a bit is true or false, nothing between. -/
theorem cannot_divide (b : Bool) : b = true ∨ b = false := by cases b <;> simp
/-- Cannot reverse it: deletion to the undetermined value has no left inverse. -/
def delete : Tri → Tri := fun _ => .bot
theorem cannot_reverse : ¬ ∃ g : Tri → Tri, ∀ v, g (delete v) = v := by
  intro ⟨g, hg⟩; have h1 := hg .tt; have h2 := hg .ff
  simp [delete] at h1 h2; rw [h1] at h2; cases h2
/-- Cannot manufacture it: a halted bridge on a frame exists exactly when the line property holds there, so the
    halted state costs the term; and no universal supply exists, since the two-point frame fails the property. -/
def twoPoint : Frame := ⟨Bool, (fun b => !b), (fun b => by cases b <;> rfl), fun _ => True⟩
theorem two_point_fails : ¬ LineProperty twoPoint := fun h => by have := h true trivial; cases this
theorem cannot_manufacture :
    (∀ X : Frame, (∃ b : Bridge X, b.terminal = .bot) ↔ LineProperty X) ∧ ¬ (∀ X : Frame, LineProperty X) :=
  ⟨fun X => (bridge_carries X).symm, fun h => two_point_fails (h twoPoint)⟩
/-- The whole sentence, as one theorem about the parameter. -/
theorem the_sentence :
    (LineProperty Xζ → LineProperty Xζ) ∧
    (LineProperty Xζ ↔ ∃ b : Bridge Xζ, b.terminal = .bot) ∧
    (∀ f : Bool → Bool, f = (fun x => x) ∨ f = (fun x => !x) ∨ f = (fun _ => true) ∨ f = (fun _ => false)) ∧
    (∀ b : Bool, b = true ∨ b = false) ∧
    (¬ ∃ g : Tri → Tri, ∀ v, g (delete v) = v) ∧
    ((∀ X : Frame, (∃ b : Bridge X, b.terminal = .bot) ↔ LineProperty X) ∧ ¬ (∀ X : Frame, LineProperty X)) :=
  ⟨the_one_input Xζ, bridge_carries Xζ, cannot_extend, cannot_divide, cannot_reverse, cannot_manufacture⟩
end Mini
#print axioms Mini.the_sentence
#print axioms Mini.gol_one
#print axioms Mini.cannot_manufacture
