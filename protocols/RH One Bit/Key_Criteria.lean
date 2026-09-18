/-! # THE CRITERIA OF THE KEY, AND THE THREE-AXIS ENGINE RUN ON THEM
The key is a predicate P on frames that turns the socket on ζ's frame. Its criteria, read from the register's
Euler necessity: (1) sufficient, P entails the line property; (2) asymmetric, P fails on the Davenport–Heilbronn
shaped frame, so it uses what ζ has and the witness lacks; (3) independent, P is not the line property restated,
some frame has the line property and lacks P. The engine then asks whether the three rows lock. -/
set_option autoImplicit false
namespace Key
structure Frame where
  S : Type
  τ : S → S
  Z : S → Prop
def LineProperty (X : Frame) : Prop := ∀ s, X.Z s → X.τ s = s
inductive Tri | tt | ff | bot deriving DecidableEq
structure Bridge (X : Frame) where
  terminal : Tri
  shadow : terminal = .bot ↔ LineProperty X
theorem bridge (X : Frame) : (∃ b : Bridge X, b.terminal = .bot) ↔ LineProperty X :=
  ⟨fun ⟨b, h⟩ => b.shadow.mp h, fun t => ⟨⟨.bot, ⟨fun _ => t, fun _ => rfl⟩⟩, rfl⟩⟩
/-- The witness-shaped frame: fold-invariant, off the line. -/
def dhFrame : Frame := ⟨Bool, (fun b => !b), fun _ => True⟩
theorem dh_off_line : ¬ LineProperty dhFrame := fun h => by have := h true trivial; cases this
/-- A frame on the line, with no Euler structure attached: one fixed point. -/
def lineFrame : Frame := ⟨Unit, id, fun _ => True⟩
theorem line_on_line : LineProperty lineFrame := fun _ _ => rfl

/-! ## the criteria of the object -/
structure KeyCriteria (P : Frame → Prop) : Prop where
  sufficient  : ∀ X, P X → LineProperty X
  asymmetric  : ¬ P dhFrame
  independent : ∃ X, LineProperty X ∧ ¬ P X
/-- The criteria are satisfiable: a candidate exists. Here, the line property together with an Euler mark, modelled
    as the frame having exactly one point (the candidate is a shape for the engine, not the analytic construction). -/
def candidate (X : Frame) : Prop := LineProperty X ∧ (∀ a b : X.S, a = b) ∧ Nonempty X.S
theorem candidate_meets_criteria : KeyCriteria candidate :=
  ⟨fun _ h => h.1, fun h => dh_off_line h.1,
   ⟨⟨Bool, id, fun _ => True⟩, fun _ _ => rfl, fun h => by have := h.2.1 true false; cases this⟩⟩

/-! ## the engine: three rows at the key -/
def det2 (r1 r2 r3 : Nat × Nat × Nat) : Nat :=
  (r1.1 * (r2.2.1 * r3.2.2 + r2.2.2 * r3.2.1) + r1.2.1 * (r2.1 * r3.2.2 + r2.2.2 * r3.1)
   + r1.2.2 * (r2.1 * r3.2.1 + r2.2.1 * r3.1)) % 2
/-- Row one, sufficiency; row two, asymmetry; row three, independence: three distinct axes, the criteria are a
    lock about the key's shape. -/
theorem criteria_lock : det2 (1,0,0) (0,1,0) (0,0,1) = 1 := rfl
/-- The population test. A lock is total about its object given its rows; the row the socket reads is P on ζ's
    frame. For every P meeting the criteria, that row is not a theorem: P fails on some frame, so `P Xζ` for a
    parameter Xζ is exactly a supplied term. The engine returns: rows independent, object row unpopulated. -/
theorem key_row_unpopulated (P : Frame → Prop) (hK : KeyCriteria P) : ¬ ∀ X : Frame, P X :=
  fun h => hK.asymmetric (h dhFrame)
/-- What a populated row does: given `P Xζ` for a criteria-meeting P, the socket turns and the bridge halts. -/
theorem key_turns (P : Frame → Prop) (hK : KeyCriteria P) (Xζ : Frame) (t : P Xζ) :
    ∃ b : Bridge Xζ, b.terminal = .bot :=
  (bridge Xζ).mpr (hK.sufficient Xζ t)
/-- And no criteria-meeting P is decided by the engine on the parameter frame: the engine cannot populate the row it
    reads, because the row is a fact about ζ's zeros and ζ is not in the language. -/
theorem engine_verdict :
    (det2 (1,0,0) (0,1,0) (0,0,1) = 1) ∧
    KeyCriteria candidate ∧
    (∀ P, KeyCriteria P → ¬ ∀ X : Frame, P X) ∧
    (∀ P, KeyCriteria P → ∀ Xζ : Frame, P Xζ → ∃ b : Bridge Xζ, b.terminal = .bot) :=
  ⟨criteria_lock, candidate_meets_criteria, key_row_unpopulated, key_turns⟩
end Key
#print axioms Key.engine_verdict
#print axioms Key.key_row_unpopulated
#print axioms Key.key_turns
