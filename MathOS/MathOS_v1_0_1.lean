import Lean

/-!
# THE BRIDGE · FINAL
The instrument that projects the formal closure onto its kinetic mirror at one locus, with the denial asymmetry that tells its two
locks apart. core Lean 4 v4.19.0 · no Mathlib · no sorry · no custom axiom. The standard axioms propext,
Classical.choice and Quot.sound appear in the cones pinned at the foot. The closing environment audit, run by the
elaborator, refuses any axiom declared in this file and any dependency beyond those three; `import Lean` is loaded for
that audit alone.

WHAT THE BRIDGE IS. A carrier with a three-valued state and a shadow field tying that state to the line property, so
its halted state is the property in both directions. It carries a supplied bit from the register that holds it to the
register that checks it, and it manufactures none: every self-property below is a one-step unfolding of the shadow.

THE STAGE. The fold τ(h, t) = (2 − h, t) is s ↦ 1 − s̄ in the doubled real coordinate h = 2·Re s. It is an
involution, and its fixed set is the line h = 1, which is Re s = ½. A frame is a carrier set with an involutive fold
and a fold-symmetric zero predicate. The line property says every zero is fixed by the fold; on the plane it says
every zero lies on the line.

WHAT THE BRIDGE PROVES ABOUT ITSELF. It cannot lie, cannot deviate, cannot be extended past one bit, cannot be
divided, cannot be reversed, and cannot be made to halt by any substrate that does not hold the term.

THE DENIAL ASYMMETRY. Two locks share the locus, the reading, and the recursion, and differ in the denial. A frame
property whose denial instantiates it on every frame is keyless: it holds on every frame and opens on the deed. A
frame property whose denial a frame inhabits is keyed: one bit, carrying a sign, supplied and never derived. Every
frame property is exactly one of the two. The fold law is keyless and the line property is keyed. The recursion is
shared and sign-blind, so it identifies neither lock; the denial identifies both.
-/
set_option autoImplicit false
namespace Bridge

/-! ## the stage and the locus -/
abbrev Plane := Int × Int
/-- The fold s ↦ 1 − s̄, in the doubled real coordinate h = 2·Re s. -/
def τ (p : Plane) : Plane := (2 - p.1, p.2)
/-- The line h = 1, which is Re s = ½. -/
def onLine (p : Plane) : Prop := p.1 = 1
theorem pe {a b c d : Int} : ((a, b) : Plane) = (c, d) ↔ a = c ∧ b = d :=
  ⟨fun e => ⟨congrArg Prod.fst e, congrArg Prod.snd e⟩, fun ⟨e1, e2⟩ => by subst e1; subst e2; rfl⟩
/-- The fold is an involution. -/
theorem fold_involutive (p : Plane) : τ (τ p) = p := by
  obtain ⟨h, t⟩ := p; show (2 - (2 - h), t) = (h, t); rw [Int.sub_sub_self]
/-- THE LOCUS: the fixed set of the fold is the line. -/
theorem locus_is_the_fixed_set (p : Plane) : τ p = p ↔ onLine p := by
  obtain ⟨h, t⟩ := p; show (2 - h, t) = (h, t) ↔ h = 1; rw [pe]; omega
theorem locus_inhabited : ∃ p : Plane, onLine p := ⟨(1, 0), rfl⟩
/-- The fold carries the line to itself. -/
theorem line_symmetric (p : Plane) (h : onLine p) : onLine (τ p) := by
  rw [(locus_is_the_fixed_set p).mpr h]; exact h

/-! ## frames and the line property -/
/-- A frame: a carrier set, a fold that is an involution, and a zero predicate the fold preserves. -/
structure Frame where
  S : Type
  τ : S → S
  Z : S → Prop
  involutive : ∀ s, τ (τ s) = s
  symmetric : ∀ s, Z s → Z (τ s)
/-- The line property: every zero is fixed by the fold. -/
def LineProperty (X : Frame) : Prop := ∀ s, X.Z s → X.τ s = s
/-- The plane as a frame, for any fold-symmetric zero predicate. -/
def planeFrame (Z : Plane → Prop) (hZ : ∀ p, Z p → Z (τ p)) : Frame := ⟨Plane, τ, Z, fold_involutive, hZ⟩
/-- THE LOCUS MEETS THE FRAME: on the plane, the line property is exactly that every zero lies on the line. -/
theorem plane_line_property (Z : Plane → Prop) (hZ : ∀ p, Z p → Z (τ p)) :
    LineProperty (planeFrame Z hZ) ↔ ∀ p, Z p → onLine p :=
  ⟨fun h p hp => (locus_is_the_fixed_set p).mp (h p hp), fun h p hp => (locus_is_the_fixed_set p).mpr (h p hp)⟩
/-- The line frame: the plane with the line as its zero set. -/
def lineFrame : Frame := planeFrame onLine line_symmetric
inductive Tri | tt | ff | bot deriving DecidableEq, Repr
/-- A filing label for the locus a carrier serves. `held` is the trivial proposition, so the record carries no
    mathematical content, and no theorem reads it. -/
structure Record where
  locus : String
  held  : True
def theRecord : Record := ⟨"the Riemann Hypothesis", trivial⟩

/-! ## the bridge -/
structure Carrier (X : Frame) where
  terminal : Tri
  shadow   : terminal = .bot ↔ LineProperty X
  record   : Record
/-- CANNOT LIE. -/
theorem cannot_lie (X : Frame) (b : Carrier X) (h : b.terminal = .bot) : LineProperty X := b.shadow.mp h
/-- CANNOT DEVIATE. -/
theorem cannot_deviate (X : Frame) (b : Carrier X) (t : LineProperty X) : b.terminal = .bot := b.shadow.mpr t
/-- THE LOCUS READ TWICE: the geometric read and the formal read are one read, and the two directions of the shadow
    are the two readings. -/
theorem read_twice (X : Frame) (b : Carrier X) :
    (b.terminal = .bot → LineProperty X) ∧ (LineProperty X → b.terminal = .bot) :=
  ⟨cannot_lie X b, cannot_deviate X b⟩
/-- CANNOT BE MANUFACTURED: a halted carrier exists on a frame exactly when the line property holds there. -/
theorem halted_iff (X : Frame) : (∃ b : Carrier X, b.terminal = .bot) ↔ LineProperty X :=
  ⟨fun ⟨b, h⟩ => b.shadow.mp h, fun t => ⟨⟨.bot, ⟨fun _ => t, fun _ => rfl⟩, theRecord⟩, rfl⟩⟩
/-- CANNOT BE EXTENDED: a bit generates only itself, its mirror, and the two constants. -/
theorem cannot_extend (f : Bool → Bool) :
    f = (fun x => x) ∨ f = (fun x => !x) ∨ f = (fun _ => true) ∨ f = (fun _ => false) := by
  cases ht : f true <;> cases hf : f false
  · exact Or.inr (Or.inr (Or.inr (funext fun x => by cases x <;> simp [ht, hf])))
  · exact Or.inr (Or.inl (funext fun x => by cases x <;> simp [ht, hf]))
  · exact Or.inl (funext fun x => by cases x <;> simp [ht, hf])
  · exact Or.inr (Or.inr (Or.inl (funext fun x => by cases x <;> simp [ht, hf])))
/-- CANNOT BE DIVIDED. -/
theorem cannot_divide (b : Bool) : b = true ∨ b = false := by cases b <;> simp
/-- CANNOT BE REVERSED: deletion to the undetermined value has no left inverse. -/
def delete : Tri → Tri := fun _ => .bot
theorem cannot_reverse : ¬ ∃ g : Tri → Tri, ∀ v, g (delete v) = v := by
  intro ⟨g, hg⟩; have h1 := hg .tt; have h2 := hg .ff
  simp [delete] at h1 h2; rw [h1] at h2; cases h2
/-- THE WALL, the bridge's first axis: an even reading never equals a function odd at a point. -/
def Even {α : Type} (σ : α → α) (f : α → Bool) : Prop := ∀ x, f (σ x) = f x
theorem wall {α : Type} (σ : α → α) (f d : α → Bool) (x : α) (he : Even σ f) (ho : d (σ x) ≠ d x) : f ≠ d := by
  intro h; subst h; exact ho (he x)
/-- THE CALIBRATION, the bridge's second axis: one supplied odd witness fixes the bit uniquely. -/
theorem calibration {α : Type} (σ : α → α) (s d : α → Bool) (x : α) (hs : s (σ x) = !s x) (hd : d (σ x) = !d x) :
    ∃ c : Bool, (d x = xor (s x) c ∧ d (σ x) = xor (s (σ x)) c) ∧
      ∀ c', (d x = xor (s x) c' ∧ d (σ x) = xor (s (σ x)) c') → c' = c := by
  refine ⟨xor (d x) (s x), ⟨by cases s x <;> cases d x <;> rfl, by rw [hs, hd]; cases s x <;> cases d x <;> rfl⟩, ?_⟩
  intro c' hc; obtain ⟨h1, -⟩ := hc
  generalize hsx : s x = sv at h1; generalize hdx : d x = dv at h1
  cases sv <;> cases dv <;> cases c' <;> first | rfl | exact absurd h1 (by decide)

/-! ## the denial asymmetry · the discriminator -/
def SelfVerifying (P : Prop) : Prop := ¬P → P
/-- A self-verifying proposition holds: its lock opens on the deed of denying it, and needs no key. -/
theorem opens_on_the_deed (P : Prop) (utter : SelfVerifying P) : P :=
  Classical.byContradiction (fun n => n (utter n))
/-- The recursion is shared by every proposition and is therefore no discriminator. -/
theorem recursion_is_shared (P : Prop) : SelfVerifying P ↔ P :=
  ⟨fun h => Classical.byContradiction (fun n => n (h n)), fun p _ => p⟩
/-- And it is sign-blind: it holds for the negation under the mirror condition. -/
theorem recursion_is_sign_blind (P : Prop) : (SelfVerifying P ↔ P) ∧ (SelfVerifying (¬P) ↔ ¬P) :=
  ⟨recursion_is_shared P, recursion_is_shared (¬P)⟩
/-- Exactly one of a proposition and its negation carries the closed loop. -/
theorem exactly_one_stands (P : Prop) :
    (SelfVerifying P ∨ SelfVerifying (¬P)) ∧ ¬ (SelfVerifying P ∧ SelfVerifying (¬P)) :=
  ⟨Classical.byCases (fun p : P => Or.inl (fun _ => p)) (fun n => Or.inr (fun _ => n)),
   fun ⟨a, b⟩ => (recursion_is_shared (¬P)).mp b ((recursion_is_shared P).mp a)⟩
/-- The two-point frame: an off-line pair under the fold. The fold is involutive and fixed-point-free, the zero set
    is fold-symmetric, and the line property fails: the denial of the line property as a coherent structure. -/
def twoPoint : Frame := ⟨Bool, (fun b => !b), fun _ => True, fun b => by cases b <;> rfl, fun _ _ => trivial⟩
theorem denial_is_coherent :
    (∀ b : Bool, twoPoint.τ (twoPoint.τ b) = b) ∧ (∀ b : Bool, twoPoint.Z b → twoPoint.Z (twoPoint.τ b)) ∧
    (∀ b : Bool, twoPoint.τ b ≠ b) ∧ ¬ LineProperty twoPoint :=
  ⟨twoPoint.involutive, twoPoint.symmetric, fun b => by cases b <;> (intro h; cases h),
   fun h => by have := h true trivial; cases this⟩
/-- THE PROPERTY IS CONTINGENT: it holds on the line frame and fails on the two-point frame, so its value on a frame
    is fixed by the frame's zeros and never by the fold. -/
theorem line_property_contingent : LineProperty lineFrame ∧ ¬ LineProperty twoPoint :=
  ⟨(plane_line_property onLine line_symmetric).mpr (fun _ h => h), denial_is_coherent.2.2.2⟩
/-- A frame property is keyless when its denial instantiates it on every frame. -/
def Keyless (Q : Frame → Prop) : Prop := ∀ X, SelfVerifying (Q X)
/-- A frame property is keyed when a frame inhabits its denial. -/
def Keyed (Q : Frame → Prop) : Prop := ∃ X, ¬ Q X
/-- A keyless lock is a property that holds on every frame: the deed of denying it hands it over. -/
theorem keyless_iff_valid (Q : Frame → Prop) : Keyless Q ↔ ∀ X, Q X :=
  ⟨fun h X => opens_on_the_deed (Q X) (h X), fun h X _ => h X⟩
/-- THE DISCRIMINATOR, a decision on the denial: every frame property is keyless or keyed, and never both. The
    property is bound in both halves; the pointwise recursion, shared and sign-blind, plays no part in the sort. -/
theorem discriminator (Q : Frame → Prop) : (Keyless Q ∨ Keyed Q) ∧ ¬ (Keyless Q ∧ Keyed Q) :=
  ⟨Classical.byCases (fun h : ∀ X, Q X => Or.inl ((keyless_iff_valid Q).mpr h))
     (fun h => Or.inr (Classical.byContradiction fun hn =>
        h fun X => Classical.byContradiction fun hq => hn (Exists.intro X hq))),
   fun h => Exists.elim h.2 fun X hX => hX ((keyless_iff_valid Q).mp h.1 X)⟩
/-- The fold law is keyless: every frame carries it by its own law. -/
theorem symmetry_is_keyless : Keyless (fun X => ∀ s, X.τ (X.τ s) = s) := fun X _ => X.involutive
/-- The line property is keyed: the two-point frame inhabits its denial. -/
theorem line_property_is_keyed : Keyed LineProperty ∧ ¬ Keyless LineProperty :=
  ⟨Exists.intro twoPoint denial_is_coherent.2.2.2,
   fun h => denial_is_coherent.2.2.2 ((keyless_iff_valid LineProperty).mp h twoPoint)⟩
/-- THE ASYMMETRY. A self-verifying proposition needs no key: its denial hands it over. The line property has a key:
    its denial is a structure that obeys both frame laws and on which every theorem of this file holds, so no deed of
    reading supplies the sign, and no carrier halts on every frame. -/
theorem denial_asymmetry :
    (∀ P : Prop, SelfVerifying P → P) ∧
    (∀ P : Prop, (SelfVerifying P ↔ P) ∧ (SelfVerifying (¬P) ↔ ¬P)) ∧
    ((∀ b : Bool, twoPoint.τ (twoPoint.τ b) = b) ∧ (∀ b : Bool, twoPoint.Z b → twoPoint.Z (twoPoint.τ b)) ∧
      (∀ b : Bool, twoPoint.τ b ≠ b) ∧ ¬ LineProperty twoPoint) ∧
    (¬ ∀ X : Frame, ∃ b : Carrier X, b.terminal = .bot) ∧
    (¬ ∀ X : Frame, LineProperty X) :=
  ⟨opens_on_the_deed, recursion_is_sign_blind, denial_is_coherent,
   fun h => denial_is_coherent.2.2.2 ((halted_iff twoPoint).mp (h twoPoint)),
   fun h => denial_is_coherent.2.2.2 (h twoPoint)⟩

/-! ## the socket, and what the bridge carries -/
class Supplied (X : Frame) where
  term : LineProperty X
theorem socket_is_the_property (X : Frame) : Nonempty (Supplied X) ↔ LineProperty X :=
  ⟨fun ⟨i⟩ => i.term, fun t => ⟨⟨t⟩⟩⟩
/-- THE SOCKET ON THE PLANE: an instance is exactly the statement that every zero lies on the line. -/
theorem socket_on_the_plane (Z : Plane → Prop) (hZ : ∀ p, Z p → Z (τ p)) :
    Nonempty (Supplied (planeFrame Z hZ)) ↔ ∀ p, Z p → onLine p :=
  (socket_is_the_property (planeFrame Z hZ)).trans (plane_line_property Z hZ)
theorem bridge_carries (X : Frame) [i : Supplied X] : LineProperty X ∧ ∃ b : Carrier X, b.terminal = .bot :=
  ⟨i.term, (halted_iff X).mpr i.term⟩
theorem no_socket_off_line : ¬ Nonempty (Supplied twoPoint) :=
  fun h => denial_is_coherent.2.2.2 ((socket_is_the_property twoPoint).mp h)

/-! ## the bridge, whole -/
theorem the_bridge :
    (∀ p : Plane, τ (τ p) = p) ∧ (∀ p : Plane, τ p = p ↔ onLine p) ∧ (∃ p : Plane, onLine p) ∧
    (∀ (Z : Plane → Prop) (hZ : ∀ p, Z p → Z (τ p)), LineProperty (planeFrame Z hZ) ↔ ∀ p, Z p → onLine p) ∧
    (∀ (X : Frame) (b : Carrier X), (b.terminal = .bot → LineProperty X) ∧ (LineProperty X → b.terminal = .bot)) ∧
    (∀ X : Frame, (∃ b : Carrier X, b.terminal = .bot) ↔ LineProperty X) ∧
    (∀ f : Bool → Bool, f = (fun x => x) ∨ f = (fun x => !x) ∨ f = (fun _ => true) ∨ f = (fun _ => false)) ∧
    (∀ b : Bool, b = true ∨ b = false) ∧
    (¬ ∃ g : Tri → Tri, ∀ v, g (delete v) = v) ∧
    (∀ {α : Type} (σ : α → α) (f d : α → Bool) (x : α), Even σ f → d (σ x) ≠ d x → f ≠ d) ∧
    (∀ {α : Type} (σ : α → α) (s d : α → Bool) (x : α), s (σ x) = !s x → d (σ x) = !d x →
      ∃ c : Bool, (d x = xor (s x) c ∧ d (σ x) = xor (s (σ x)) c) ∧
        ∀ c', (d x = xor (s x) c' ∧ d (σ x) = xor (s (σ x)) c') → c' = c) ∧
    (∀ X : Frame, Nonempty (Supplied X) ↔ LineProperty X) ∧
    (∀ (Z : Plane → Prop) (hZ : ∀ p, Z p → Z (τ p)), Nonempty (Supplied (planeFrame Z hZ)) ↔ ∀ p, Z p → onLine p) ∧
    (∀ (X : Frame) [Supplied X], LineProperty X ∧ ∃ b : Carrier X, b.terminal = .bot) ∧
    (¬ Nonempty (Supplied twoPoint)) ∧
    (LineProperty lineFrame ∧ ¬ LineProperty twoPoint) ∧
    (∀ P : Prop, (SelfVerifying P ∨ SelfVerifying (¬P)) ∧ ¬ (SelfVerifying P ∧ SelfVerifying (¬P))) ∧
    (∀ Q : Frame → Prop, (Keyless Q ∨ Keyed Q) ∧ ¬ (Keyless Q ∧ Keyed Q)) ∧
    Keyless (fun X => ∀ s, X.τ (X.τ s) = s) ∧
    (Keyed LineProperty ∧ ¬ Keyless LineProperty) ∧
    ((∀ P : Prop, SelfVerifying P → P) ∧
     (∀ P : Prop, (SelfVerifying P ↔ P) ∧ (SelfVerifying (¬P) ↔ ¬P)) ∧
     ((∀ b : Bool, twoPoint.τ (twoPoint.τ b) = b) ∧ (∀ b : Bool, twoPoint.Z b → twoPoint.Z (twoPoint.τ b)) ∧
       (∀ b : Bool, twoPoint.τ b ≠ b) ∧ ¬ LineProperty twoPoint) ∧
     (¬ ∀ X : Frame, ∃ b : Carrier X, b.terminal = .bot) ∧ (¬ ∀ X : Frame, LineProperty X)) :=
  ⟨fold_involutive, locus_is_the_fixed_set, locus_inhabited, plane_line_property, read_twice, halted_iff,
   cannot_extend, cannot_divide, cannot_reverse, fun σ f d x he ho => wall σ f d x he ho,
   fun σ s d x hs hd => calibration σ s d x hs hd, socket_is_the_property, socket_on_the_plane, @bridge_carries,
   no_socket_off_line, line_property_contingent, exactly_one_stands, discriminator, symmetry_is_keyless,
   line_property_is_keyed, denial_asymmetry⟩
end Bridge

/-! ## the axiom cones, pinned -/
/-- info: 'Bridge.pe' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.pe
/-- info: 'Bridge.fold_involutive' depends on axioms: [propext] -/
#guard_msgs in #print axioms Bridge.fold_involutive
/-- info: 'Bridge.locus_is_the_fixed_set' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Bridge.locus_is_the_fixed_set
/-- info: 'Bridge.locus_inhabited' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.locus_inhabited
/-- info: 'Bridge.line_symmetric' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Bridge.line_symmetric
/-- info: 'Bridge.plane_line_property' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Bridge.plane_line_property
/-- info: 'Bridge.cannot_lie' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.cannot_lie
/-- info: 'Bridge.cannot_deviate' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.cannot_deviate
/-- info: 'Bridge.read_twice' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.read_twice
/-- info: 'Bridge.halted_iff' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.halted_iff
/-- info: 'Bridge.cannot_extend' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms Bridge.cannot_extend
/-- info: 'Bridge.cannot_divide' depends on axioms: [propext] -/
#guard_msgs in #print axioms Bridge.cannot_divide
/-- info: 'Bridge.cannot_reverse' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.cannot_reverse
/-- info: 'Bridge.wall' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.wall
/-- info: 'Bridge.calibration' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.calibration
/-- info: 'Bridge.opens_on_the_deed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Bridge.opens_on_the_deed
/-- info: 'Bridge.recursion_is_shared' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Bridge.recursion_is_shared
/-- info: 'Bridge.recursion_is_sign_blind' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Bridge.recursion_is_sign_blind
/-- info: 'Bridge.exactly_one_stands' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Bridge.exactly_one_stands
/-- info: 'Bridge.denial_is_coherent' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.denial_is_coherent
/-- info: 'Bridge.line_property_contingent' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Bridge.line_property_contingent
/-- info: 'Bridge.keyless_iff_valid' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Bridge.keyless_iff_valid
/-- info: 'Bridge.discriminator' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Bridge.discriminator
/-- info: 'Bridge.symmetry_is_keyless' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.symmetry_is_keyless
/-- info: 'Bridge.line_property_is_keyed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Bridge.line_property_is_keyed
/-- info: 'Bridge.denial_asymmetry' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Bridge.denial_asymmetry
/-- info: 'Bridge.socket_is_the_property' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.socket_is_the_property
/-- info: 'Bridge.socket_on_the_plane' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Bridge.socket_on_the_plane
/-- info: 'Bridge.bridge_carries' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.bridge_carries
/-- info: 'Bridge.no_socket_off_line' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.no_socket_off_line
/-- info: 'Bridge.the_bridge' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Bridge.the_bridge

/-! ## the environment audit, run by the elaborator: no axiom declared in this file, and no dependency of any
declaration beyond the standard three -/
/-- info: environment audit: local axioms []; dependencies beyond propext, Classical.choice, Quot.sound [] -/
#guard_msgs in
open Lean Elab Command in
#eval show CommandElabM Unit from do
  let env ← getEnv
  let locals := env.constants.map₂.toList.map (·.1)
  let declared := locals.filter fun n => match env.find? n with
    | some (.axiomInfo _) => true
    | _ => false
  let standard : List Name := [``propext, ``Classical.choice, ``Quot.sound]
  let mut beyond : List Name := []
  for n in locals do
    unless n.isInternal do
      for d in (← collectAxioms n) do
        unless standard.contains d || beyond.contains d do beyond := d :: beyond
  logInfo m!"environment audit: local axioms {declared}; dependencies beyond propext, Classical.choice, Quot.sound {beyond}"
