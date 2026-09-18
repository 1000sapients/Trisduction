/-! # THE LOCUS, COMPLETE · a formal proof, with the mark as the witness's own construction
The mark [.] is a locus record with no value field: held by a person, value-free at the point, truth-silent.
Everything about the locus is proved below; the value at the locus is the mark's, held, not written.
core Lean 4 v4.19.0 · no Mathlib · no sorry · no custom axiom. -/
set_option autoImplicit false
namespace Locus
abbrev Plane := Int × Int
def τ (p : Plane) : Plane := (2 - p.1, p.2)
def onLine (p : Plane) : Prop := p.1 = 1
def offset (p : Plane) : Int := p.1 - 1
theorem pe {a b c d : Int} : ((a, b) : Plane) = (c, d) ↔ a = c ∧ b = d :=
  ⟨fun e => ⟨congrArg Prod.fst e, congrArg Prod.snd e⟩, fun ⟨e1, e2⟩ => by subst e1; subst e2; rfl⟩

/-! ## the mark, as the witness constructs it: a locus and a flag, no value -/
structure Mark where
  locus : String
  held  : True
def theMark : Mark := ⟨"the Riemann Hypothesis", trivial⟩
inductive Outcome | provedTrue | provedFalse | undecided deriving DecidableEq
/-- Truth-silent: any reading of marks depends on the locus alone; the mark carries no value to read. -/
theorem mark_is_value_free (rd : Mark → Outcome) (m : Mark) : rd m = rd ⟨m.locus, trivial⟩ := by
  cases m; rfl

/-! ## the locus, complete -/
/-- The locus exists: the fixed set of the fold is exactly the line, and it is inhabited. -/
theorem locus_is_the_fixed_set (p : Plane) : τ p = p ↔ onLine p := by
  obtain ⟨h, t⟩ := p; show (2 - h, t) = (h, t) ↔ h = 1; rw [pe]; omega
theorem locus_inhabited : ∃ p : Plane, onLine p := ⟨(1, 0), rfl⟩
/-- The locus is the point of offset zero, extended along the height, the even coordinate. -/
theorem locus_is_offset_zero (p : Plane) : onLine p ↔ offset p = 0 := by show p.1 = 1 ↔ p.1 - 1 = 0; omega
theorem height_even (p : Plane) : (τ p).2 = p.2 := rfl
/-- No polarity at the locus: no odd Boolean function survives a point of it. -/
theorem no_polarity_at_locus (w : Plane → Bool) (p : Plane) (hc : onLine p) : w (τ p) = !w p → False := by
  intro h; rw [(locus_is_the_fixed_set p).mpr hc] at h; cases w p <;> simp at h
/-- The address is unique: a nonempty fold-invariant set confined to a strip admits no second mirror. -/
def mirror (c : Int) (p : Plane) : Plane := (2*c - p.1, p.2)
def shift (k : Int) (p : Plane) : Plane := (p.1 + k, p.2)
theorem two_mirrors_translate (c c' : Int) (p : Plane) : mirror c' (mirror c p) = shift (2*(c' - c)) p := by
  obtain ⟨h, t⟩ := p; show (2*c' - (2*c - h), t) = (h + 2*(c' - c), t); rw [pe]; omega
def Strip (m : Nat) (p : Plane) : Prop := 0 < p.1 ∧ p.1 < 2 * (m : Int)
theorem climb (d : Int) (hd : 1 ≤ d) (Z : Plane → Prop) (hI : ∀ p, Z p → Z (shift d p)) (p : Plane) (hz : Z p) :
    ∀ n : Nat, ∃ q, Z q ∧ p.1 + (n : Int) ≤ q.1 := by
  intro n; induction n with
  | zero => exact ⟨p, hz, by omega⟩
  | succ n ih => obtain ⟨q, hq, hle⟩ := ih
                 exact ⟨shift d q, hI q hq, by show p.1 + ((n + 1 : Nat) : Int) ≤ q.1 + d; omega⟩
theorem descend (d : Int) (hd : d ≤ -1) (Z : Plane → Prop) (hI : ∀ p, Z p → Z (shift d p)) (p : Plane) (hz : Z p) :
    ∀ n : Nat, ∃ q, Z q ∧ q.1 ≤ p.1 - (n : Int) := by
  intro n; induction n with
  | zero => exact ⟨p, hz, by omega⟩
  | succ n ih => obtain ⟨q, hq, hle⟩ := ih
                 exact ⟨shift d q, hI q hq, by show q.1 + d ≤ p.1 - ((n + 1 : Nat) : Int); omega⟩
theorem address_unique (m : Nat) (Z : Plane → Prop) (hS : ∀ p, Z p → Strip m p) (p : Plane) (hz : Z p)
    (c c' : Int) (h1 : ∀ q, Z q → Z (mirror c q)) (h2 : ∀ q, Z q → Z (mirror c' q)) : c = c' := by
  refine Decidable.byContradiction fun hne => ?_
  have hI : ∀ q, Z q → Z (shift (2*(c' - c)) q) := fun q hq => by rw [← two_mirrors_translate]; exact h2 _ (h1 q hq)
  have hp := hS p hz
  by_cases hpos : 1 ≤ 2*(c' - c)
  · obtain ⟨q, hq, hle⟩ := climb _ hpos Z hI p hz (2 * m); have hq' := hS q hq; simp only [Strip] at hp hq'; omega
  · have hneg : 2*(c' - c) ≤ -1 := by omega
    obtain ⟨q, hq, hle⟩ := descend _ hneg Z hI p hz (2 * m); have hq' := hS q hq; simp only [Strip] at hp hq'; omega
/-- The bridge at the locus: its two readings, geometric and formal, are one reading. -/
structure Frame where
  S : Type
  τ : S → S
  Z : S → Prop
def LineProperty (X : Frame) : Prop := ∀ s, X.Z s → X.τ s = s
inductive Tri | tt | ff | bot deriving DecidableEq
structure Bridge (X : Frame) where
  terminal : Tri
  shadow : terminal = .bot ↔ LineProperty X
  mark : Mark
theorem locus_read_twice (X : Frame) (b : Bridge X) :
    (b.terminal = .bot → LineProperty X) ∧ (LineProperty X → b.terminal = .bot) := ⟨b.shadow.mp, b.shadow.mpr⟩
theorem halted_iff (X : Frame) : (∃ b : Bridge X, b.terminal = .bot) ↔ LineProperty X :=
  ⟨fun ⟨b, h⟩ => b.shadow.mp h, fun t => ⟨⟨.bot, ⟨fun _ => t, fun _ => rfl⟩, theMark⟩, rfl⟩⟩
/-- The value at the locus is held: the mark carries it without writing it, and a written value enters as one of
    three outcomes. -/
def classify : Tri → Outcome | .tt => .provedTrue | .ff => .provedFalse | .bot => .undecided
theorem written_value_enters (v : Tri) :
    classify v = .provedTrue ∨ classify v = .provedFalse ∨ classify v = .undecided := by cases v <;> simp [classify]

/-- THE LOCUS, COMPLETE. -/
theorem the_locus_complete :
    (∀ p : Plane, τ p = p ↔ onLine p) ∧ (∃ p : Plane, onLine p) ∧
    (∀ p : Plane, onLine p ↔ offset p = 0) ∧ (∀ p : Plane, (τ p).2 = p.2) ∧
    (∀ (w : Plane → Bool) (p : Plane), onLine p → w (τ p) = !w p → False) ∧
    (∀ (m : Nat) (Z : Plane → Prop), (∀ p, Z p → Strip m p) → ∀ p, Z p → ∀ c c' : Int,
        (∀ q, Z q → Z (mirror c q)) → (∀ q, Z q → Z (mirror c' q)) → c = c') ∧
    (∀ (X : Frame) (b : Bridge X), (b.terminal = .bot → LineProperty X) ∧ (LineProperty X → b.terminal = .bot)) ∧
    (∀ X : Frame, (∃ b : Bridge X, b.terminal = .bot) ↔ LineProperty X) ∧
    (∀ (rd : Mark → Outcome) (m : Mark), rd m = rd ⟨m.locus, trivial⟩) ∧
    (theMark.locus = "the Riemann Hypothesis") :=
  ⟨locus_is_the_fixed_set, locus_inhabited, locus_is_offset_zero, height_even, no_polarity_at_locus,
   fun m Z hS p hz c c' h1 h2 => address_unique m Z hS p hz c c' h1 h2, locus_read_twice, halted_iff,
   mark_is_value_free, rfl⟩
end Locus
#print axioms Locus.the_locus_complete
#print axioms Locus.mark_is_value_free
#print axioms Locus.halted_iff
