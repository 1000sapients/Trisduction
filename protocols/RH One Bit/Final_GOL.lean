/-! # THE FINAL GOL · the wall, the witness, and the bridge as three axes at the locus -/
set_option autoImplicit false
namespace FinalGOL
def det2 (r1 r2 r3 : Nat × Nat × Nat) : Nat :=
  (r1.1 * (r2.2.1 * r3.2.2 + r2.2.2 * r3.2.1) + r1.2.1 * (r2.1 * r3.2.2 + r2.2.2 * r3.1)
   + r1.2.2 * (r2.1 * r3.2.1 + r2.2.1 * r3.1)) % 2
/-- The No: the wall. An even reading never returns an odd bit. -/
def Even {α : Type} (σ : α → α) (f : α → Bool) : Prop := ∀ x, f (σ x) = f x
def OddAt {α : Type} (σ : α → α) (d : α → Bool) (x : α) : Prop := d (σ x) ≠ d x
theorem wall {α : Type} (σ : α → α) (f d : α → Bool) (x : α) (he : Even σ f) (ho : OddAt σ d x) : f ≠ d := by
  intro h; subst h; exact ho (he x)
/-- The Yes: the witness. One supplied odd function fixes the bit's calibration uniquely. -/
theorem witness {α : Type} (σ : α → α) (s d : α → Bool) (x : α) (hs : s (σ x) = !s x) (hd : d (σ x) = !d x) :
    ∃ c : Bool, (d x = xor (s x) c ∧ d (σ x) = xor (s (σ x)) c) ∧
      ∀ c', (d x = xor (s x) c' ∧ d (σ x) = xor (s (σ x)) c') → c' = c := by
  refine ⟨xor (d x) (s x), ⟨by cases s x <;> cases d x <;> rfl, by rw [hs, hd]; cases s x <;> cases d x <;> rfl⟩, ?_⟩
  intro c' hc; obtain ⟨h1, -⟩ := hc
  generalize hsx : s x = sv at h1; generalize hdx : d x = dv at h1
  cases sv <;> cases dv <;> cases c' <;> first | rfl | exact absurd h1 (by decide)
/-- The bridge: the halted state is the line property, both ways; it carries what is supplied. -/
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
/-- The three axes are independent: the lock forms. -/
def wallAxis : Nat × Nat × Nat := (1, 0, 0)
def witnessAxis : Nat × Nat × Nat := (0, 1, 0)
def bridgeAxis : Nat × Nat × Nat := (0, 0, 1)
theorem lock_forms : det2 wallAxis witnessAxis bridgeAxis = 1 := rfl
/-- The lock is total about its object and contains both answers as rows: the No is an axis of the Yes. -/
theorem final_gol (X : Frame) :
    det2 wallAxis witnessAxis bridgeAxis = 1 ∧
    (∀ {α : Type} (σ : α → α) (f d : α → Bool) (x : α), Even σ f → OddAt σ d x → f ≠ d) ∧
    (∀ {α : Type} (σ : α → α) (s d : α → Bool) (x : α), s (σ x) = !s x → d (σ x) = !d x →
      ∃ c : Bool, (d x = xor (s x) c ∧ d (σ x) = xor (s (σ x)) c) ∧
        ∀ c', (d x = xor (s x) c' ∧ d (σ x) = xor (s (σ x)) c') → c' = c) ∧
    ((∃ b : Bridge X, b.terminal = .bot) ↔ LineProperty X) :=
  ⟨lock_forms, fun σ f d x he ho => wall σ f d x he ho, fun σ s d x hs hd => witness σ s d x hs hd, bridge X⟩
/-- The lock does not escape the wall: on the two-point frame every row holds and the line property fails. -/
def twoPoint : Frame := ⟨Bool, (fun b => !b), fun _ => True⟩
theorem lock_holds_off_line : (det2 wallAxis witnessAxis bridgeAxis = 1 ∧
    ((∃ b : Bridge twoPoint, b.terminal = .bot) ↔ LineProperty twoPoint)) ∧ ¬ LineProperty twoPoint :=
  ⟨⟨lock_forms, bridge twoPoint⟩, fun h => by have := h true trivial; cases this⟩
end FinalGOL
#print axioms FinalGOL.final_gol
#print axioms FinalGOL.lock_holds_off_line
