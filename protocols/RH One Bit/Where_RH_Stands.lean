/-! # WHERE THE HYPOTHESIS STANDS · the sentence as one theorem
"One bit, located, decided at the act, the bit held by whoever holds it, and no one else able to hold it for them."
core Lean 4 v4.19.0 · no Mathlib · no sorry · no custom axiom. -/
set_option autoImplicit false
namespace Stands
abbrev Plane := Int × Int
def τ (p : Plane) : Plane := (2 - p.1, p.2)
def onLine (p : Plane) : Prop := p.1 = 1
theorem pe {a b c d : Int} : ((a, b) : Plane) = (c, d) ↔ a = c ∧ b = d :=
  ⟨fun e => ⟨congrArg Prod.fst e, congrArg Prod.snd e⟩, fun ⟨e1, e2⟩ => by subst e1; subst e2; rfl⟩
structure Frame where
  S : Type
  τ : S → S
  Z : S → Prop
def LineProperty (X : Frame) : Prop := ∀ s, X.Z s → X.τ s = s
inductive Tri | tt | ff | bot deriving DecidableEq
structure Bridge (X : Frame) where
  terminal : Tri
  shadow : terminal = .bot ↔ LineProperty X
def twoPoint : Frame := ⟨Bool, (fun b => !b), fun _ => True⟩

/-! ## ONE BIT: an odd witness on an orbit is one Boolean, and one supplied odd witness fixes it uniquely -/
theorem one_bit {α : Type} (σ : α → α) (s d : α → Bool) (x : α) (hs : s (σ x) = !s x) (hd : d (σ x) = !d x) :
    ∃ c : Bool, (d x = xor (s x) c ∧ d (σ x) = xor (s (σ x)) c) ∧
      ∀ c', (d x = xor (s x) c' ∧ d (σ x) = xor (s (σ x)) c') → c' = c := by
  refine ⟨xor (d x) (s x), ⟨by cases s x <;> cases d x <;> rfl, by rw [hs, hd]; cases s x <;> cases d x <;> rfl⟩, ?_⟩
  intro c' hc; obtain ⟨h1, -⟩ := hc
  generalize hsx : s x = sv at h1; generalize hdx : d x = dv at h1
  cases sv <;> cases dv <;> cases c' <;> first | rfl | exact absurd h1 (by decide)

/-! ## LOCATED: the fold fixes exactly the line, and the line is inhabited -/
theorem located (p : Plane) : τ p = p ↔ onLine p := by
  obtain ⟨h, t⟩ := p; show (2 - h, t) = (h, t) ↔ h = 1; rw [pe]; omega
theorem located_inhabited : ∃ p : Plane, onLine p := ⟨(1, 0), rfl⟩

/-! ## DECIDED AT THE ACT: a supplied term decides, and the bridge halts on it -/
theorem decided_at_the_act (X : Frame) (t : LineProperty X) : LineProperty X ∧ ∃ b : Bridge X, b.terminal = .bot :=
  ⟨t, ⟨⟨.bot, ⟨fun _ => t, fun _ => rfl⟩⟩, rfl⟩⟩

/-! ## HELD BY WHOEVER HOLDS IT: holding a halted bridge is holding the term, and conversely -/
theorem held_by_whoever_holds_it (X : Frame) : (∃ b : Bridge X, b.terminal = .bot) ↔ LineProperty X :=
  ⟨fun ⟨b, h⟩ => b.shadow.mp h, fun t => ⟨⟨.bot, ⟨fun _ => t, fun _ => rfl⟩⟩, rfl⟩⟩

/-! ## NO ONE ELSE CAN HOLD IT FOR THEM: no even reading returns it, no bridge halts unsupplied, no universal term -/
def Even {α : Type} (σ : α → α) (f : α → Bool) : Prop := ∀ x, f (σ x) = f x
theorem no_reading_holds_it {α : Type} (σ : α → α) (f d : α → Bool) (x : α) (he : Even σ f) (ho : d (σ x) ≠ d x) :
    f ≠ d := by intro h; subst h; exact ho (he x)
theorem no_bridge_halts_unsupplied : ¬ ∀ X : Frame, ∃ b : Bridge X, b.terminal = .bot :=
  fun h => by
    obtain ⟨b, hb⟩ := h twoPoint
    have := b.shadow.mp hb true trivial; cases this
theorem no_universal_term : ¬ ∀ X : Frame, LineProperty X :=
  fun h => by have := h twoPoint true trivial; cases this

/-! ## THE SENTENCE -/
theorem where_the_hypothesis_stands :
    (∀ {α : Type} (σ : α → α) (s d : α → Bool) (x : α), s (σ x) = !s x → d (σ x) = !d x →
      ∃ c : Bool, (d x = xor (s x) c ∧ d (σ x) = xor (s (σ x)) c) ∧
        ∀ c', (d x = xor (s x) c' ∧ d (σ x) = xor (s (σ x)) c') → c' = c) ∧
    ((∀ p : Plane, τ p = p ↔ onLine p) ∧ ∃ p : Plane, onLine p) ∧
    (∀ X : Frame, LineProperty X → LineProperty X ∧ ∃ b : Bridge X, b.terminal = .bot) ∧
    (∀ X : Frame, (∃ b : Bridge X, b.terminal = .bot) ↔ LineProperty X) ∧
    ((∀ {α : Type} (σ : α → α) (f d : α → Bool) (x : α), Even σ f → d (σ x) ≠ d x → f ≠ d) ∧
     (¬ ∀ X : Frame, ∃ b : Bridge X, b.terminal = .bot) ∧ (¬ ∀ X : Frame, LineProperty X)) :=
  ⟨fun σ s d x hs hd => one_bit σ s d x hs hd, ⟨located, located_inhabited⟩, decided_at_the_act,
   held_by_whoever_holds_it, ⟨fun σ f d x he ho => no_reading_holds_it σ f d x he ho, no_bridge_halts_unsupplied,
   no_universal_term⟩⟩
end Stands
#print axioms Stands.where_the_hypothesis_stands
