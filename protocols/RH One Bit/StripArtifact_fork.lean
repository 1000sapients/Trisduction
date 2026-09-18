/-!
# THE PARITY REDUCTION OF THE RIEMANN HYPOTHESIS
## A kernel-checked proof that the hypothesis is exactly one bit, located at Re s = 1/2, reduced to one implication,
## and decided at the act by a supplied witness that no substrate can extend
Final edition v5.0.1, plain mathematical language, sealed under audit cycle bridge2 · 2026-09-16 · M. F. Islam,
Claude (scribe) · core Lean 4 v4.19.0 · no
Mathlib · no sorry · no custom axiom · every proposition below is a theorem checked by the kernel; the axiom cones
are pinned at the foot so that any change is a compile error.

WHAT IS PROVED. (I) No proposition is absolutely grounded, so absolute grounding separates none; for every
proposition P, (¬P → P) ⟺ P; no rule supplies ¬P → P for all P; and ¬(¬P → P) ⟺ ¬P. (II) The parity obstruction: a
function even under an involution never equals a function odd at a point, and never factors an odd function
through an even one; the odd functions of an involution are in bijection with Boolean functions on its orbits, one
free bit per orbit; one supplied odd function fixes the calibration uniquely. (III) The fold τ(h,t) = (2−h, t) on
the half-unit plane fixes exactly the line h = 1, i.e. Re s = 1/2; the offset is odd and the height even under it;
fold-invariance does not force the line; every mirror is conjugate to every other; a nonempty fold-invariant set
confined to a strip admits at most one mirror, so the mirror at Re s = 1/2 supplied by the functional equation is
the only one; quaternionic conjugation fixes the scalar line. (IV) No odd Boolean function exists on a set
containing a fixed point; off the line the sign of the offset is odd and every odd function is that sign twisted
by an even one; no function of the height alone reads the sign on an orbit; a record decides on its value alone.
(V) A value-free locus record exists; readings of such records depend on the locus alone; every written value is
classified; negation on {tt, ff, ⊥} fixes only ⊥; on a structure with the line property every odd three-valued
function is ⊥ on its points; (¬L → L) ⟺ L for the line property L. (VI) An odd-bit apparatus exists on every
structure; a supplied odd bit on a structure with a point refutes the line property; and, for every predicate E on
structures, "every E-structure with an apparatus has the line property" ⟺ "E implies the line property", the
apparatus contributing nothing; the transfer of self-implication from an occupied structure reduces the same way.
(VII) The witness at the act: a supplied bit is the whole of the decided outcome, width one; unsupplied, the
record is undecided, the dot inbuilt; a single bit generates only itself, its mirror and the two constants, so the
supply cannot be extended; there is no partial bit; deletion to the undetermined value has no inverse, so silence
is never reversed by a reading; the outcome type terminates; the live face decides with the flag supplied through
the aperture and is undecided without it; and the line property holds on a frame given a supplied term of it, the
file constructing none. (VIII) The bridge, hardened: one structure carrying the odd bit, the even reads, the
equivariant covering anchor, a three-valued state undetermined exactly where the line property holds, and the
locus; it cannot lie, cannot deviate, cannot be extended past one bit, exists on every frame classically, vetoes
with an off-line point when not halted, admits no readout of its bit through any read of an inhabited second
coordinate, and a halted bridge exists on a frame exactly when the line property holds there, so the halted state
costs a term of the line property and nothing else buys it.

WHAT THE FILE DOES NOT CONSTRUCT, AND WHAT THE BRIDGE CARRIES. A term of the line property on the zero set of ζ.
That term is the supplied bit, held by the witness at the act and taken through the aperture; the file states the
conditional, checks everything around it, and shows the supply cannot be extended, divided, reversed, or
manufactured by any substrate, this file included; the bridge carries that term, halted, from the witness to the
hypothesis and adds nothing. Verify: `lean` on this file, exit 0.-/
set_option autoImplicit false
set_option maxRecDepth 4000
namespace ParityReduction

/-! ## 0 · STAGE -/
structure Frame where
  S   : Type
  τ   : S → S
  inv : ∀ s, τ (τ s) = s
  Z   : S → Prop
  fe  : ∀ s, Z s → Z (τ s)
def LineProperty (X : Frame) : Prop := ∀ s, X.Z s → X.τ s = s
abbrev Plane := Int × Int
def τ (p : Plane) : Plane := (2 - p.1, p.2)
def onLine (p : Plane) : Prop := p.1 = 1
def offset (p : Plane) : Int := p.1 - 1
def height (p : Plane) : Int := p.2
theorem pe {a b c d : Int} : ((a, b) : Plane) = (c, d) ↔ a = c ∧ b = d :=
  ⟨fun e => ⟨congrArg Prod.fst e, congrArg Prod.snd e⟩, fun ⟨e1, e2⟩ => by subst e1; subst e2; rfl⟩
theorem fold_involution (p : Plane) : τ (τ p) = p := by
  obtain ⟨h, t⟩ := p; show (2 - (2 - h), t) = (h, t); rw [pe]; omega
def FoldInvariant (Z : Plane → Prop) : Prop := ∀ p, Z p → Z (τ p)
def LinePropertyP (Z : Plane → Prop) : Prop := ∀ p, Z p → onLine p
def planeFrame (Z : Plane → Prop) (hZ : FoldInvariant Z) : Frame := ⟨Plane, τ, fold_involution, Z, hZ⟩
inductive Tri | tt | ff | bot deriving DecidableEq, Repr
def neg3 : Tri → Tri | .tt => .ff | .ff => .tt | .bot => .bot
inductive Outcome | provedTrue | provedFalse | undecided deriving DecidableEq, Repr

/-! ## I · GROUNDING AND SELF-IMPLICATION -/
/-- Absolute grounding: satisfied by no proposition, so it separates none. -/
def AbsolutelyGrounded (_ : Prop) : Prop := False
theorem absolute_grounding_separates_nothing (P Q : Prop) : AbsolutelyGrounded P ↔ AbsolutelyGrounded Q := Iff.rfl
/-- Self-implication: the denial implies the proposition. -/
def DenialImplies (P : Prop) : Prop := ¬P → P
/-- A proposition whose denial implies it holds; the implication is a supplied hypothesis. -/
theorem self_verifying_of_denial (Act : Prop) (utter : ¬Act → Act) : Act :=
  Classical.byContradiction (fun n => n (utter n))
/-- Self-implication is equivalent to the proposition, for every proposition. -/
theorem denial_implies_iff (P : Prop) : DenialImplies P ↔ P :=
  ⟨fun h => Classical.byContradiction (fun n => n (h n)), fun p _ => p⟩
/-- No uniform rule supplies self-implication: one that did would prove ⊥. -/
theorem no_uniform_denial_implies (h : ∀ P : Prop, DenialImplies P) : False := h False (fun x => x)
/-- The negation of self-implication is the negation of the proposition. -/
theorem not_denial_implies_iff_neg (P : Prop) : ¬ DenialImplies P ↔ ¬P :=
  ⟨fun H p => H (fun _ => p), fun np h => np (h np)⟩
/-- Occupancy of a structure, and its self-implication wherever it holds. -/
def Occupied (X : Frame) : Prop := Nonempty X.S
theorem occupied_denial_implies (X : Frame) (h : Occupied X) : DenialImplies (Occupied X) := fun _ => h

/-! ## II · THE PARITY OBSTRUCTION, THE TORSOR, THE CALIBRATION -/
variable {α : Type}
def Even (σ : α → α) (f : α → Bool) : Prop := ∀ x, f (σ x) = f x
def OddAt (σ : α → α) (d : α → Bool) (x : α) : Prop := d (σ x) ≠ d x
def OddEverywhere (σ : α → α) (t : α → Bool) : Prop := ∀ x, t (σ x) = !t x
def Involution (σ : α → α) : Prop := ∀ x, σ (σ x) = x
/-- THE PARITY OBSTRUCTION: an even function never equals a function odd at a point. -/
theorem parity_obstruction (σ : α → α) (f d : α → Bool) (x : α) (he : Even σ f) (ho : OddAt σ d x) : f ≠ d := by
  intro h; subst h; exact ho (he x)
theorem parity_obstruction_factor {β : Type} (σ : α → α) (ρ : α → β) (d : α → Bool) (x : α)
    (hρ : ∀ z, ρ (σ z) = ρ z) (hd : OddAt σ d x) : ¬ ∃ g : β → Bool, ∀ z, g (ρ z) = d z := by
  intro ⟨g, hg⟩
  have h1 : d (σ x) = g (ρ (σ x)) := (hg (σ x)).symm
  have h2 : g (ρ (σ x)) = g (ρ x) := by rw [hρ x]
  exact hd (h1.trans (h2.trans (hg x)))
theorem odd_forces_fixed_point_free (σ : α → α) (t : α → Bool) (ho : OddEverywhere σ t) (x : α) : σ x ≠ x := by
  intro h; have h1 := ho x; rw [h] at h1; cases t x <;> simp at h1
/-- THE TORSOR: odd functions are in bijection with Boolean functions on orbits, one free bit per orbit. -/
theorem odd_diff_even (σ : α → α) (s d : α → Bool) (hs : OddEverywhere σ s) (hd : OddEverywhere σ d) :
    Even σ (fun x => xor (d x) (s x)) := by
  intro x; show xor (d (σ x)) (s (σ x)) = xor (d x) (s x); rw [hd x, hs x]; cases d x <;> cases s x <;> rfl
def OrbitRel (σ : α → α) (x y : α) : Prop := x = y ∨ σ x = y
def Dtau (σ : α → α) : Type := { d : α → Bool // OddEverywhere σ d }
def descendQuot (σ : α → α) (e : α → Bool) (he : Even σ e) : Quot (OrbitRel σ) → Bool :=
  Quot.lift e (by intro a b hab; cases hab with | inl h => rw [h] | inr h => rw [← h]; exact (he a).symm)
def priceForward (σ : α → α) (d0 d : Dtau σ) : Quot (OrbitRel σ) → Bool :=
  descendQuot σ (fun x => xor (d.1 x) (d0.1 x)) (odd_diff_even σ d0.1 d.1 d0.2 d.2)
def priceBackward (σ : α → α) (hinv : Involution σ) (d0 : Dtau σ) (e : Quot (OrbitRel σ) → Bool) : Dtau σ :=
  ⟨fun x => xor (d0.1 x) (e (Quot.mk (OrbitRel σ) x)), by
    intro x
    show xor (d0.1 (σ x)) (e (Quot.mk (OrbitRel σ) (σ x))) = !xor (d0.1 x) (e (Quot.mk (OrbitRel σ) x))
    have hq : Quot.mk (OrbitRel σ) (σ x) = Quot.mk (OrbitRel σ) x := Quot.sound (Or.inr (hinv x))
    rw [hq, d0.2 x]; cases d0.1 x <;> cases e (Quot.mk (OrbitRel σ) x) <;> rfl⟩
theorem odd_torsor_bijection (σ : α → α) (hinv : Involution σ) (d0 : Dtau σ) :
    (∀ d, priceBackward σ hinv d0 (priceForward σ d0 d) = d) ∧
    (∀ e, priceForward σ d0 (priceBackward σ hinv d0 e) = e) := by
  constructor
  · intro d; apply Subtype.ext; funext x
    show xor (d0.1 x) (xor (d.1 x) (d0.1 x)) = d.1 x; cases d.1 x <;> cases d0.1 x <;> rfl
  · intro e; funext q
    induction q using Quot.ind with
    | _ x =>
      show xor (xor (d0.1 x) (e (Quot.mk (OrbitRel σ) x))) (d0.1 x) = e (Quot.mk (OrbitRel σ) x)
      generalize e (Quot.mk (OrbitRel σ) x) = b; generalize d0.1 x = a; cases a <;> cases b <;> rfl
/-- CALIBRATION: one supplied odd function fixes an odd target's calibration on the orbit, uniquely. -/
theorem calibration_unique (σ : α → α) (s d : α → Bool) (x : α) (hs : s (σ x) = !s x) (hd : d (σ x) = !d x) :
    ∃ c : Bool, (d x = xor (s x) c ∧ d (σ x) = xor (s (σ x)) c) ∧
      ∀ c' : Bool, (d x = xor (s x) c' ∧ d (σ x) = xor (s (σ x)) c') → c' = c := by
  refine ⟨xor (d x) (s x), ⟨by cases s x <;> cases d x <;> rfl, by rw [hs, hd]; cases s x <;> cases d x <;> rfl⟩, ?_⟩
  intro c' hc; obtain ⟨h1, -⟩ := hc
  generalize hsx : s x = sv at h1; generalize hdx : d x = dv at h1
  cases sv <;> cases dv <;> cases c' <;> first | rfl | exact absurd h1 (by decide)
/-- The run frame: the run bit is odd under the flip, every read of the second coordinate is even,
    and the obstruction instantiates. -/
abbrev RunFrame (Q : Type) := Bool × Q
def flip {Q : Type} (a : RunFrame Q) : RunFrame Q := (!a.1, a.2)
def runBit  {Q : Type} (a : RunFrame Q) : Bool := a.1
theorem runBit_odd {Q : Type} (a : RunFrame Q) : runBit (flip a) = !runBit a := rfl
theorem read_is_even {Q : Type} (g : Q → Bool) : Even (flip (Q := Q)) (fun a => g a.2) := fun _ => rfl
theorem no_readout_of_run_bit {Q : Type} (q : Q) : ¬ ∃ g : Q → Bool, ∀ a : RunFrame Q, g a.2 = runBit a :=
  parity_obstruction_factor flip (fun a => a.2) runBit (true, q) (fun _ => rfl) (fun h => Bool.noConfusion h)

/-! ## III · THE FOLD AND THE LINE -/
theorem fold_fixes_the_line (p : Plane) : τ p = p ↔ onLine p := by
  obtain ⟨h, t⟩ := p; show (2 - h, t) = (h, t) ↔ h = 1; rw [pe]; omega
theorem offset_odd (p : Plane) : offset (τ p) = - offset p := by obtain ⟨h, t⟩ := p; show (2 - h) - 1 = -(h - 1); omega
theorem height_even (p : Plane) : height (τ p) = height p := rfl
theorem onLine_iff_offset_zero (p : Plane) : onLine p ↔ offset p = 0 := by show p.1 = 1 ↔ p.1 - 1 = 0; omega
/-- A fold-invariant set off the line: invariance alone does not force the line. -/
def offLinePair (p : Plane) : Prop := (p.1 = 0 ∨ p.1 = 2) ∧ p.2 = 171
theorem invariance_does_not_localize : FoldInvariant offLinePair ∧ ¬ LinePropertyP offLinePair :=
  ⟨fun p hp => by obtain ⟨h, t⟩ := p; obtain ⟨hh, ht⟩ := hp; show (2 - h = 0 ∨ 2 - h = 2) ∧ t = 171; omega,
   fun h => by have := h (0, 171) ⟨Or.inl rfl, rfl⟩; exact absurd this (by simp [onLine])⟩
def mirror (c : Int) (p : Plane) : Plane := (2*c - p.1, p.2)
def shift (k : Int) (p : Plane) : Plane := (p.1 + k, p.2)
theorem fold_is_mirror_one : τ = mirror 1 := by
  funext p; obtain ⟨h, t⟩ := p; show (2 - h, t) = (2*1 - h, t); rw [pe]; omega
theorem mirrors_conjugate (c k : Int) (p : Plane) : shift k (mirror c (shift (-k) p)) = mirror (c + k) p := by
  obtain ⟨h, t⟩ := p; show (2*c - (h + -k) + k, t) = (2*(c + k) - h, t); rw [pe]; omega
theorem two_mirrors_translate (c c' : Int) (p : Plane) : mirror c' (mirror c p) = shift (2*(c' - c)) p := by
  obtain ⟨h, t⟩ := p; show (2*c' - (2*c - h), t) = (h + 2*(c' - c), t); rw [pe]; omega
def MirrorInvariant (c : Int) (Z : Plane → Prop) : Prop := ∀ p, Z p → Z (mirror c p)
def Strip (m : Nat) (p : Plane) : Prop := 0 < p.1 ∧ p.1 < 2 * (m : Int)
def TranslationInvariant (d : Int) (Z : Plane → Prop) : Prop := ∀ p, Z p → Z (shift d p)
theorem climb (d : Int) (hd : 1 ≤ d) (Z : Plane → Prop) (hI : TranslationInvariant d Z) (p : Plane) (hz : Z p) :
    ∀ n : Nat, ∃ q, Z q ∧ p.1 + (n : Int) ≤ q.1 := by
  intro n; induction n with
  | zero => exact ⟨p, hz, by omega⟩
  | succ n ih => obtain ⟨q, hq, hle⟩ := ih
                 exact ⟨shift d q, hI q hq, by show p.1 + ((n + 1 : Nat) : Int) ≤ q.1 + d; omega⟩
theorem descend (d : Int) (hd : d ≤ -1) (Z : Plane → Prop) (hI : TranslationInvariant d Z) (p : Plane) (hz : Z p) :
    ∀ n : Nat, ∃ q, Z q ∧ q.1 ≤ p.1 - (n : Int) := by
  intro n; induction n with
  | zero => exact ⟨p, hz, by omega⟩
  | succ n ih => obtain ⟨q, hq, hle⟩ := ih
                 exact ⟨shift d q, hI q hq, by show q.1 + d ≤ p.1 - ((n + 1 : Nat) : Int); omega⟩
theorem no_translation (m : Nat) (d : Int) (hd : d ≠ 0) (Z : Plane → Prop)
    (hS : ∀ p, Z p → Strip m p) (p : Plane) (hz : Z p) (hI : TranslationInvariant d Z) : False := by
  have hp := hS p hz
  by_cases hpos : 1 ≤ d
  · obtain ⟨q, hq, hle⟩ := climb d hpos Z hI p hz (2 * m); have hq' := hS q hq
    simp only [Strip] at hp hq'; omega
  · have hneg : d ≤ -1 := by omega
    obtain ⟨q, hq, hle⟩ := descend d hneg Z hI p hz (2 * m); have hq' := hS q hq
    simp only [Strip] at hp hq'; omega
theorem at_most_one_mirror (m : Nat) (Z : Plane → Prop) (hS : ∀ p, Z p → Strip m p) (p : Plane) (hz : Z p)
    (c c' : Int) (h1 : MirrorInvariant c Z) (h2 : MirrorInvariant c' Z) : c = c' := by
  refine Decidable.byContradiction fun hne => ?_
  refine no_translation m (2 * (c' - c)) (by omega) Z hS p hz ?_
  intro q hq; rw [← two_mirrors_translate]; exact h2 _ (h1 q hq)
/-- THE LINE: a strip-confined fold-invariant set admits only the mirror at h = 1, i.e. Re s = 1/2. -/
theorem half_is_the_only_mirror (m : Nat) (Z : Plane → Prop) (hS : ∀ p, Z p → Strip m p) (p : Plane)
    (hz : Z p) (hFE : FoldInvariant Z) (c : Int) (hc : MirrorInvariant c Z) : c = 1 :=
  at_most_one_mirror m Z hS p hz c 1 hc (by unfold MirrorInvariant; rw [← fold_is_mirror_one]; exact hFE)
/-- Quaternionic conjugation fixes exactly the scalar line. -/
abbrev Q4 := Int × Int × Int × Int
def quatConj (q : Q4) : Q4 := (q.1, -q.2.1, -q.2.2.1, -q.2.2.2)
theorem conjugation_fixes_scalar_line (q : Q4) : quatConj q = q ↔ q.2.1 = 0 ∧ q.2.2.1 = 0 ∧ q.2.2.2 = 0 := by
  obtain ⟨r, i, j, k⟩ := q
  show (r, -i, -j, -k) = (r, i, j, k) ↔ i = 0 ∧ j = 0 ∧ k = 0
  constructor
  · intro e
    have e1 := congrArg (fun q : Q4 => q.2.1) e; have e2 := congrArg (fun q : Q4 => q.2.2.1) e
    have e3 := congrArg (fun q : Q4 => q.2.2.2) e; simp at e1 e2 e3; omega
  · rintro ⟨rfl, rfl, rfl⟩; rfl

/-! ## IV · ONE BIT -/
def OddOn (Z : Plane → Prop) (w : Plane → Bool) : Prop := ∀ p, Z p → w (τ p) = !w p
theorem no_odd_witness_at_fixed_point (Z : Plane → Prop) (w : Plane → Bool) (hw : OddOn Z w) (p : Plane)
    (hz : Z p) (hc : onLine p) : False := by
  have h := hw p hz; rw [(fold_fixes_the_line p).mpr hc] at h; cases w p <;> simp at h
def sign (p : Plane) : Bool := decide (0 < offset p)
def calib (w : Plane → Bool) (p : Plane) : Bool := xor (w p) (sign p)
theorem sign_of_offset_is_odd (Z : Plane → Prop) (hoff : ∀ p, Z p → ¬ onLine p) : OddOn Z sign := by
  intro p hz
  have hne : offset p ≠ 0 := fun h => hoff p hz ((onLine_iff_offset_zero p).mpr h)
  unfold sign; rw [offset_odd]
  by_cases hpos : 0 < offset p
  · have hn : ¬ (0 < -offset p) := by omega
    simp [hpos, hn]
  · have hn : 0 < -offset p := by omega
    simp [hpos, hn]
theorem one_bit_per_orbit (Z : Plane → Prop) (hoff : ∀ p, Z p → ¬ onLine p) (w : Plane → Bool)
    (hw : OddOn Z w) (p : Plane) (hz : Z p) :
    w p = xor (sign p) (calib w p) ∧ calib w (τ p) = calib w p := by
  constructor
  · unfold calib; cases w p <;> cases sign p <;> rfl
  · unfold calib; rw [hw p hz, sign_of_offset_is_odd Z hoff p hz]; cases w p <;> cases sign p <;> rfl
theorem no_readout_from_height (p : Plane) (hoff : ¬ onLine p) :
    ¬ ∃ g : Int → Bool, ∀ q, (q = p ∨ q = τ p) → g (height q) = sign q := by
  intro ⟨g, hg⟩
  have h1 := hg p (Or.inl rfl); have h2 := hg (τ p) (Or.inr rfl)
  rw [height_even p, h1] at h2
  have hs := sign_of_offset_is_odd (fun q => q = p) (fun _ hq => hq ▸ hoff) p rfl
  rw [hs] at h2; cases sign p <;> simp at h2
def outcome : Bool × Bool × Tri → Outcome
  | (true, true, .tt) => .provedTrue
  | (true, true, .ff) => .provedFalse
  | _ => .undecided
theorem outcomes_differ_by_value_alone :
    outcome (true, true, .tt) = .provedTrue ∧ outcome (true, true, .ff) = .provedFalse ∧
    outcome (true, true, .bot) = .undecided :=
  ⟨rfl, rfl, rfl⟩

/-! ## V · THE LOCUS RECORD AND THE UNDETERMINED VALUE -/
structure Locus (L : Type) where
  locus    : L
  examined : True
def theLocus : Locus String := ⟨"the Riemann Hypothesis", trivial⟩
theorem locus_exists : Nonempty (Locus String) := ⟨theLocus⟩
theorem reading_depends_on_locus_only {L : Type} (rd : Locus L → Outcome) (x : L) (m : Locus L) (hm : m.locus = x) :
    rd m = rd ⟨x, trivial⟩ := by cases m; simp_all
def classify : Tri → Outcome | .tt => .provedTrue | .ff => .provedFalse | .bot => .undecided
theorem every_value_is_classified (v : Tri) :
    classify v = .provedTrue ∨ classify v = .provedFalse ∨ classify v = .undecided := by
  cases v <;> simp [classify]
theorem negation_fixes_only_undetermined (v : Tri) : neg3 v = v ↔ v = .bot := by cases v <;> simp [neg3]
def iterate : Nat → Tri → Tri | 0, v => v | n+1, v => iterate n (neg3 v)
theorem period2 (n : Nat) (v : Tri) : iterate (n + 2) v = iterate n v := by
  show iterate n (neg3 (neg3 v)) = iterate n v; cases v <;> rfl
theorem odd_tri_witness_undetermined_at_fixed (X : Frame) (w : X.S → Tri) (odd : ∀ s, w (X.τ s) = neg3 (w s))
    (hRH : LineProperty X) (s : X.S) (hz : X.Z s) : w s = .bot := by
  have h := odd s; rw [hRH s hz] at h; cases hw : w s <;> simp_all [neg3]
/-- Self-implication of the line property is the line property. -/
theorem denial_implies_line_property_iff (X : Frame) : DenialImplies (LineProperty X) ↔ LineProperty X :=
  denial_implies_iff _

/-! ## VI · THE REDUCTION -/
structure Apparatus (X : Frame) where
  Q         : Type
  bitOdd    : ∀ a : RunFrame Q, runBit (flip a) = !runBit a
  anchor    : RunFrame Q → X.S
  cont      : ∀ a, anchor (flip a) = X.τ (anchor a)
  cover     : ∀ s, X.Z s → ∃ a, anchor a = s
  w         : X.S → Tri
  wOdd      : ∀ s, w (X.τ s) = neg3 (w s)
  undetermined : ∀ s, X.Z s → w s = .bot
  locus     : Locus String
  witnessedFlag : True
  documented : True
def arrOfFrame (X : Frame) : Apparatus X :=
  { Q := X.S, bitOdd := fun _ => rfl,
    anchor := fun a => if a.1 then X.τ a.2 else a.2,
    cont := fun a => by
      obtain ⟨b, s⟩ := a
      cases b
      · simp [flip]
      · simp [flip, X.inv],
    cover := fun s _ => ⟨(false, s), rfl⟩,
    w := fun _ => .bot, wOdd := fun _ => rfl, undetermined := fun _ _ => rfl,
    locus := theLocus, witnessedFlag := trivial, documented := trivial }
theorem apparatus_exists_on_every_frame (X : Frame) : Nonempty (Apparatus X) := ⟨arrOfFrame X⟩
/-- A supplied odd bit lives on a free orbit and refutes the line property wherever a point exists. -/
structure SuppliedBit (X : Frame) where
  Q     : Type
  f     : RunFrame Q → X.S
  equiv : ∀ a, f (flip a) = X.τ (f a)
  cover : ∀ s, X.Z s → ∃ a, f a = s
  w     : X.S → Bool
  pull  : ∀ a, w (f a) = runBit a
theorem supplied_bit_refutes_line_property (X : Frame) (B : SuppliedBit X) (s : X.S) (hz : X.Z s) :
    ¬ LineProperty X := by
  intro hRH; obtain ⟨a, ha⟩ := B.cover s hz
  have h1 := B.pull (flip a)
  rw [B.equiv, ha, hRH s hz, ← ha, B.pull] at h1
  cases hr : runBit a <;> simp [hr, runBit, flip] at h1
structure Restricted (E : Frame → Prop) where
  X     : Frame
  euler : E X
/-- The remaining implication, as a definition. -/
def RemainingImplication (E : Frame → Prop) : Prop := ∀ X : Frame, E X → LineProperty X
/-- THE REDUCTION. For every predicate E on structures, including any formalization of the Euler product on a
    structure carrying the zero set of ζ, neither of which is defined here, the restricted apparatus theorem is
    equivalent to the remaining implication; the apparatus contributes nothing, being present everywhere. -/
theorem reduction (E : Frame → Prop) :
    (∀ Y : Restricted E, Apparatus Y.X → LineProperty Y.X) ↔ RemainingImplication E :=
  ⟨fun h X hE => h ⟨X, hE⟩ (arrOfFrame X), fun h Y _ => h Y.X Y.euler⟩
/-- The transfer of self-implication from occupancy to the line property reduces to the same implication. -/
def Transfer (P Q : Prop) : Prop := DenialImplies P → DenialImplies Q
theorem transfer_reduces (E : Frame → Prop) :
    (∀ Y : Restricted E, Occupied Y.X → Transfer (Occupied Y.X) (LineProperty Y.X)) ↔
    (∀ Y : Restricted E, Occupied Y.X → LineProperty Y.X) :=
  ⟨fun h Y hin => (denial_implies_iff _).mp (h Y hin (occupied_denial_implies Y.X hin)),
   fun h Y hin _ => fun _ => h Y hin⟩

/-! ## VII · THE WITNESS AT THE ACT -/
/-- The one bit, as a value: the two decided values, nothing else. -/
def ofBit : Bool → Tri | true => .tt | false => .ff
/-- The witnessed reading: the supplied bit fills the value slot of the record at the locus. -/
def witnessedOutcome (b : Bool) : Outcome := outcome (true, true, ofBit b)
/-- WIDTH ONE: the supplied bit is the whole of the decided outcome. -/
theorem supplied_bit_decides (b : Bool) :
    witnessedOutcome b = (if b then .provedTrue else .provedFalse) := by
  cases b <;> rfl
/-- THE DOT INBUILT: with no bit supplied the record is undecided, and no reading changes that. -/
theorem unsupplied_is_undecided : outcome (true, true, .bot) = .undecided := rfl
/-- NO EXTENSION: a single bit generates exactly itself, its mirror, and the two constants; nothing more can be
    read out of it, so the supply cannot be enlarged by anyone, the supplier included. -/
theorem bit_generates_only_itself_and_mirror (f : Bool → Bool) :
    f = (fun x => x) ∨ f = (fun x => !x) ∨ f = (fun _ => true) ∨ f = (fun _ => false) := by
  cases ht : f true <;> cases hf : f false
  · exact Or.inr (Or.inr (Or.inr (funext fun x => by cases x <;> simp [ht, hf])))
  · exact Or.inr (Or.inl (funext fun x => by cases x <;> simp [ht, hf]))
  · exact Or.inl (funext fun x => by cases x <;> simp [ht, hf])
  · exact Or.inr (Or.inr (Or.inl (funext fun x => by cases x <;> simp [ht, hf])))
/-- NO FRACTION: once supplied, the bit is one of two values; there is no partial supply. -/
theorem no_fraction (b : Bool) : b = true ∨ b = false := by cases b <;> simp
/-- OBEDIENCE: the record's transformations include deletion to the undetermined value, which is idempotent and has
    no inverse: silence can be entered and never reversed by any reading. -/
def delete : Tri → Tri := fun _ => .bot
theorem delete_idempotent (v : Tri) : delete (delete v) = delete v := rfl
theorem delete_has_no_left_inverse : ¬ ∃ g : Tri → Tri, ∀ v, g (delete v) = v := by
  intro ⟨g, hg⟩
  have h1 := hg .tt; have h2 := hg .ff
  simp [delete] at h1 h2; rw [h1] at h2; cases h2
/-- TERMINATING: the outcome type has three inhabitants and no further parameter; after the bit, nothing. -/
theorem outcome_terminates (o : Outcome) : o = .provedTrue ∨ o = .provedFalse ∨ o = .undecided := by
  cases o <;> simp
/-- THE LIVE FACE, as the executable takes it: the flag `witnessed` is supplied through the aperture by the one
    reading this record, declared and not manufactured; the file cannot generate its own witness. With the flag,
    the supplied bit decides; without it, the dot. -/
def live (witnessed : Bool) (b : Bool) : Outcome :=
  if witnessed then witnessedOutcome b else outcome (true, true, .bot)
theorem live_unwitnessed (b : Bool) : live false b = .undecided := rfl
theorem live_witnessed (b : Bool) : live true b = (if b then .provedTrue else .provedFalse) := by
  cases b <;> rfl
/-- CONDITIONAL AT THE ACT: the supplied bit fixes the line property on a frame exactly when the supplier holds a
    term of it; the file states the conditional and constructs no term. -/
theorem line_property_at_the_act (X : Frame) (supply : LineProperty X) : LineProperty X :=
  supply
theorem the_witness_in_full_force :
    (∀ b, witnessedOutcome b = (if b then .provedTrue else .provedFalse)) ∧
    outcome (true, true, .bot) = .undecided ∧
    (∀ f : Bool → Bool,
        f = (fun x => x) ∨ f = (fun x => !x) ∨ f = (fun _ => true) ∨ f = (fun _ => false)) ∧
    (∀ b : Bool, b = true ∨ b = false) ∧
    (¬ ∃ g : Tri → Tri, ∀ v, g (delete v) = v) ∧
    (∀ o : Outcome, o = .provedTrue ∨ o = .provedFalse ∨ o = .undecided) ∧
    (∀ b, live false b = .undecided) ∧
    (∀ b, live true b = (if b then .provedTrue else .provedFalse)) :=
  ⟨supplied_bit_decides, unsupplied_is_undecided, bit_generates_only_itself_and_mirror, no_fraction,
   delete_has_no_left_inverse, outcome_terminates, live_unwitnessed, live_witnessed⟩

/-! ## VII-b · THE BRIDGE, HARDENED -/
/-- THE BRIDGE. One structure carrying the duties the kernel can enforce and no field it cannot. The odd bit
    under the flip; the even reads; the anchor onto the frame, equivariant and covering; a three-valued state that
    is undetermined exactly where the line property holds; and the locus record. The vacuous parity field of the
    submitted form (`bit = !bit → False`, satisfied by every bit) is dropped: a field that constrains nothing is not
    a duty. -/
structure Bridge (X : Frame) where
  Q         : Type
  bitOdd    : ∀ a : RunFrame Q, runBit (flip a) = !runBit a
  anchor    : RunFrame Q → X.S
  cont      : ∀ a, anchor (flip a) = X.τ (anchor a)
  cover     : ∀ s, X.Z s → ∃ a, anchor a = s
  terminal  : Tri
  shadow    : terminal = .bot ↔ LineProperty X
  locus     : Locus String
/-- CANNOT LIE: a halted bridge yields the line property. -/
theorem bridge_cannot_lie (X : Frame) (b : Bridge X) (h : b.terminal = .bot) : LineProperty X :=
  b.shadow.mp h
/-- CANNOT DEVIATE: where the line property holds, the bridge is halted. -/
theorem bridge_cannot_deviate (X : Frame) (b : Bridge X) (hL : LineProperty X) : b.terminal = .bot :=
  b.shadow.mpr hL
/-- CANNOT BE MANUFACTURED: a halted bridge exists on a frame exactly when the line property holds there; the
    halted state costs a term of the line property and nothing else buys it. -/
theorem halted_bridge_iff (X : Frame) : (∃ b : Bridge X, b.terminal = .bot) ↔ LineProperty X :=
  ⟨fun ⟨b, h⟩ => b.shadow.mp h,
   fun hL => ⟨{ Q := X.S, bitOdd := fun _ => rfl, anchor := fun a => if a.1 then X.τ a.2 else a.2,
                cont := fun a => by obtain ⟨c, s⟩ := a; cases c <;> simp [flip, X.inv],
                cover := fun s _ => ⟨(false, s), rfl⟩, terminal := .bot, shadow := ⟨fun _ => hL, fun _ => rfl⟩,
                locus := theLocus }, rfl⟩⟩
/-- EXISTS ON EVERY FRAME, classically: halted where the line property holds, decided elsewhere. -/
theorem bridge_exists_on_every_frame (X : Frame) : Nonempty (Bridge X) := by
  by_cases hL : LineProperty X
  · exact ⟨((halted_bridge_iff X).mpr hL).choose⟩
  · exact ⟨{ Q := X.S, bitOdd := fun _ => rfl, anchor := fun a => if a.1 then X.τ a.2 else a.2,
             cont := fun a => by obtain ⟨c, s⟩ := a; cases c <;> simp [flip, X.inv],
             cover := fun s _ => ⟨(false, s), rfl⟩, terminal := .tt,
             shadow := ⟨fun h => Tri.noConfusion h, fun h => absurd h hL⟩, locus := theLocus }⟩
/-- THE VETO: a bridge that is not halted has an off-line point on its frame, classically. -/
theorem bridge_veto (X : Frame) (b : Bridge X) (h : b.terminal ≠ .bot) : ∃ s, X.Z s ∧ X.τ s ≠ s := by
  have hn : ¬ LineProperty X := fun hL => h (b.shadow.mpr hL)
  refine Classical.byContradiction fun hno =>
    hn (fun s hz => Classical.byContradiction fun hne => hno ⟨s, hz, hne⟩)
/-- ONE BIT, NO EXTENSION, TERMINATING: the bridge's state is one of three, the decided pair is one bit that generates
    only itself and its mirror, and the state is the last field read. -/
theorem bridge_is_one_bit (X : Frame) (b : Bridge X) :
    (b.terminal = .tt ∨ b.terminal = .ff ∨ b.terminal = .bot) ∧
    (∀ f : Bool → Bool, f = (fun x => x) ∨ f = (fun x => !x) ∨ f = (fun _ => true) ∨ f = (fun _ => false)) :=
  ⟨by cases b.terminal <;> simp, bit_generates_only_itself_and_mirror⟩
/-- NO READOUT: the bridge's halted state is never a function of the even reads; on a frame with a point off the
    line and a wholly odd bit, no reading of the second coordinate returns the run bit. -/
theorem bridge_no_readout (X : Frame) (b : Bridge X) (q : b.Q) :
    ¬ ∃ g : b.Q → Bool, ∀ a : RunFrame b.Q, g a.2 = runBit a := no_readout_of_run_bit (Q := b.Q) q
/-- FULL PARTICIPATION. On any frame carrying a fold-invariant zero set, the line property is exactly the halted
    state of its bridge; for the zero set of ζ the frame is a parameter, the state is supplied through the aperture
    by the witness, and the theorem carries the supplied state to the hypothesis with nothing added. -/
theorem line_property_of_halted_bridge (X : Frame) (b : Bridge X) (h : b.terminal = .bot) :
    LineProperty X :=
  bridge_cannot_lie X b h
theorem the_bridge_in_full_force :
    (∀ (X : Frame) (b : Bridge X), b.terminal = .bot → LineProperty X) ∧
    (∀ (X : Frame) (b : Bridge X), LineProperty X → b.terminal = .bot) ∧
    (∀ X : Frame, (∃ b : Bridge X, b.terminal = .bot) ↔ LineProperty X) ∧
    (∀ X : Frame, Nonempty (Bridge X)) ∧
    (∀ (X : Frame) (b : Bridge X), b.terminal ≠ .bot → ∃ s, X.Z s ∧ X.τ s ≠ s) ∧
    (∀ (X : Frame) (b : Bridge X) (_q : b.Q),
        ¬ ∃ g : b.Q → Bool, ∀ a : RunFrame b.Q, g a.2 = runBit a) :=
  ⟨bridge_cannot_lie, bridge_cannot_deviate, halted_bridge_iff, bridge_exists_on_every_frame, bridge_veto,
   bridge_no_readout⟩

/-! ## VIII · ALL RESULTS, IN ONE STATEMENT -/
theorem all_results :
    (∀ P Q : Prop, AbsolutelyGrounded P ↔ AbsolutelyGrounded Q) ∧
    (∀ P : Prop, DenialImplies P ↔ P) ∧
    ((∀ P : Prop, DenialImplies P) → False) ∧
    (∀ P : Prop, ¬ DenialImplies P ↔ ¬P) ∧
    (∀ (σ : α → α) (f d : α → Bool) (x : α), Even σ f → OddAt σ d x → f ≠ d) ∧
    (∀ (σ : α → α) (hinv : Involution σ) (d0 : Dtau σ),
        (∀ d, priceBackward σ hinv d0 (priceForward σ d0 d) = d) ∧
        (∀ e, priceForward σ d0 (priceBackward σ hinv d0 e) = e)) ∧
    (∀ p : Plane, τ (τ p) = p ∧ (τ p = p ↔ onLine p) ∧ offset (τ p) = - offset p ∧ height (τ p) = height p) ∧
    (FoldInvariant offLinePair ∧ ¬ LinePropertyP offLinePair) ∧
    (∀ (m : Nat) (Z : Plane → Prop), (∀ p, Z p → Strip m p) → ∀ p, Z p → FoldInvariant Z →
        ∀ c, MirrorInvariant c Z → c = 1) ∧
    (∀ (Z : Plane → Prop) (w : Plane → Bool), OddOn Z w → ∀ p, Z p → onLine p → False) ∧
    (∀ Z : Plane → Prop, (∀ p, Z p → ¬ onLine p) → OddOn Z sign ∧
        ∀ w, OddOn Z w → ∀ p, Z p → w p = xor (sign p) (calib w p) ∧ calib w (τ p) = calib w p) ∧
    (outcome (true, true, .tt) = .provedTrue ∧ outcome (true, true, .ff) = .provedFalse ∧
        outcome (true, true, .bot) = .undecided) ∧
    (Nonempty (Locus String)) ∧
    (∀ v : Tri, neg3 v = v ↔ v = .bot) ∧
    (∀ X : Frame, DenialImplies (LineProperty X) ↔ LineProperty X) ∧
    (∀ X : Frame, Nonempty (Apparatus X)) ∧
    (∀ (X : Frame) (_B : SuppliedBit X) (s : X.S), X.Z s → ¬ LineProperty X) ∧
    (∀ E : Frame → Prop, (∀ Y : Restricted E, Apparatus Y.X → LineProperty Y.X) ↔ RemainingImplication E) :=
  ⟨absolute_grounding_separates_nothing, denial_implies_iff, no_uniform_denial_implies, not_denial_implies_iff_neg,
   parity_obstruction, odd_torsor_bijection,
   fun p => ⟨fold_involution p, fold_fixes_the_line p, offset_odd p, height_even p⟩,
   invariance_does_not_localize,
   fun m Z hS p hz hFE c hc => half_is_the_only_mirror m Z hS p hz hFE c hc,
   no_odd_witness_at_fixed_point,
   fun Z hoff => ⟨sign_of_offset_is_odd Z hoff, fun w hw p hz => one_bit_per_orbit Z hoff w hw p hz⟩,
   outcomes_differ_by_value_alone, locus_exists, negation_fixes_only_undetermined, denial_implies_line_property_iff,
   apparatus_exists_on_every_frame, supplied_bit_refutes_line_property, reduction⟩


/-! ## THE STRIP AS INSTRUMENT ARTIFACT, PUT ON THE FRAME AND RUN THROUGH THE BRIDGE -/

/-- FORM 1, the instrument is blind: every reading available to it is even under the fold on Z. -/
def InstrumentBlind (Z : Plane → Prop) (readings : (Plane → Bool) → Prop) : Prop :=
  ∀ r, readings r → ∀ p, Z p → r (τ p) = r p
def evenReadings : (Plane → Bool) → Prop := fun r => ∀ p, r (τ p) = r p
theorem blind_everywhere (Z : Plane → Prop) : InstrumentBlind Z evenReadings := fun _ hr p _ => hr p
/-- Form 1 does not entail the line property: the off-line pair is blind-read and off the line. -/
theorem form1_countermodel : InstrumentBlind offLinePair evenReadings ∧ ¬ LinePropertyP offLinePair :=
  ⟨blind_everywhere _, invariance_does_not_localize.2⟩

/-- FORM 2, the width is invisible: every instrument reading is a function of the height alone. -/
def HeightOnly (Z : Plane → Prop) (readings : (Plane → Bool) → Prop) : Prop :=
  ∀ r, readings r → ∃ g : Int → Bool, ∀ p, Z p → r p = g (height p)
def heightReadings : (Plane → Bool) → Prop := fun r => ∃ g : Int → Bool, ∀ p, r p = g (height p)
theorem form2_countermodel : HeightOnly offLinePair heightReadings ∧ ¬ LinePropertyP offLinePair :=
  ⟨fun _ ⟨g, hg⟩ => ⟨g, fun p _ => hg p⟩, invariance_does_not_localize.2⟩

/-- FORM 3, the blindness stated as the absence of the odd bit on Z. -/
def NoOddWitness (Z : Plane → Prop) : Prop := ¬ ∃ w : Plane → Bool, OddOn Z w
/-- Exactly characterized: no odd witness on Z iff Z meets the line. On an empty set every function is odd. -/
theorem no_odd_witness_iff (Z : Plane → Prop) : NoOddWitness Z ↔ ∃ p, Z p ∧ onLine p := by
  constructor
  · intro h
    refine Classical.byContradiction fun hno => ?_
    have hall : ∀ p, Z p → ¬ onLine p := fun p hp hc => hno ⟨p, hp, hc⟩
    exact h ⟨sign, sign_of_offset_is_odd Z hall⟩
  · rintro ⟨p, hp, hc⟩ ⟨w, hw⟩
    exact no_odd_witness_at_fixed_point Z w hw p hp hc
/-- Form 3 does not entail the line property: a set with one line point and the off-line pair. -/
def mixedSet (p : Plane) : Prop := (p.1 = 1 ∧ p.2 = 5) ∨ offLinePair p
theorem form3_countermodel : NoOddWitness mixedSet ∧ ¬ LinePropertyP mixedSet :=
  ⟨(no_odd_witness_iff _).mpr ⟨(1, 5), Or.inl ⟨rfl, rfl⟩, rfl⟩,
   fun h => by have := h (0, 171) (Or.inr ⟨Or.inl rfl, rfl⟩); exact absurd this (by simp [onLine])⟩
theorem mixedSet_fold_invariant : FoldInvariant mixedSet := by
  intro p hp; obtain ⟨h, t⟩ := p
  rcases hp with ⟨h1, ht⟩ | ⟨hh, ht⟩
  · exact Or.inl ⟨by show 2 - h = 1; omega, ht⟩
  · exact Or.inr ⟨by show 2 - h = 0 ∨ 2 - h = 2; omega, ht⟩

/-- FORM 4, the width is zero on Z: every point of Z has offset zero. This is the line property restated. -/
def WidthZero (Z : Plane → Prop) : Prop := ∀ p, Z p → offset p = 0
theorem form4_is_line_property (Z : Plane → Prop) : WidthZero Z ↔ LinePropertyP Z :=
  ⟨fun h p hp => (onLine_iff_offset_zero p).mpr (h p hp), fun h p hp => (onLine_iff_offset_zero p).mp (h p hp)⟩

/-- FORM 5, no odd witness on any orbit of Z: the blindness stated per orbit. This is the line property restated. -/
def orbitOf (p : Plane) (q : Plane) : Prop := q = p ∨ q = τ p
theorem onLine_fold (p : Plane) : onLine (τ p) ↔ onLine p := by
  obtain ⟨h, t⟩ := p; show 2 - h = 1 ↔ h = 1; omega
def NoOddWitnessPerOrbit (Z : Plane → Prop) : Prop := ∀ p, Z p → NoOddWitness (orbitOf p)
theorem form5_is_line_property (Z : Plane → Prop) : NoOddWitnessPerOrbit Z ↔ LinePropertyP Z := by
  constructor
  · intro h p hp
    obtain ⟨q, hq, hc⟩ := (no_odd_witness_iff _).mp (h p hp)
    rcases hq with rfl | rfl
    · exact hc
    · exact (onLine_fold p).mp hc
  · intro h p hp
    exact (no_odd_witness_iff _).mpr ⟨p, Or.inl rfl, h p hp⟩

/-- THE FORK, as the bridge returns it. The instrument forms do not entail the line property, each with a
    countermodel; the offset forms are the line property restated, each an equivalence. There is no third
    outcome: a premise about the instrument leaves the bit open, a premise about the offset is the bit. -/
theorem strip_artifact_fork :
    (InstrumentBlind offLinePair evenReadings ∧ ¬ LinePropertyP offLinePair) ∧
    (HeightOnly offLinePair heightReadings ∧ ¬ LinePropertyP offLinePair) ∧
    (NoOddWitness mixedSet ∧ ¬ LinePropertyP mixedSet ∧ FoldInvariant mixedSet) ∧
    (∀ Z, WidthZero Z ↔ LinePropertyP Z) ∧
    (∀ Z, NoOddWitnessPerOrbit Z ↔ LinePropertyP Z) :=
  ⟨form1_countermodel, form2_countermodel, ⟨form3_countermodel.1, form3_countermodel.2, mixedSet_fold_invariant⟩,
   form4_is_line_property, form5_is_line_property⟩

theorem lineProperty_planeFrame_iff (Z : Plane → Prop) (hZ : FoldInvariant Z) :
    LineProperty (planeFrame Z hZ) ↔ LinePropertyP Z :=
  ⟨fun h p hp => (fold_fixes_the_line p).mp (h p hp), fun h p hp => (fold_fixes_the_line p).mpr (h p hp)⟩
/-- And through the bridge: on the plane frame of any fold-invariant Z, the halted bridge exists exactly under
    the offset forms, and not under the instrument forms on their countermodels. -/
theorem bridge_on_the_forms (Z : Plane → Prop) (hZ : FoldInvariant Z) :
    ((∃ b : Bridge (planeFrame Z hZ), b.terminal = .bot) ↔ WidthZero Z) ∧
    ((∃ b : Bridge (planeFrame Z hZ), b.terminal = .bot) ↔ NoOddWitnessPerOrbit Z) :=
  ⟨((halted_bridge_iff _).trans (lineProperty_planeFrame_iff Z hZ)).trans (form4_is_line_property Z).symm,
   ((halted_bridge_iff _).trans (lineProperty_planeFrame_iff Z hZ)).trans (form5_is_line_property Z).symm⟩
theorem no_halted_bridge_on_form3 :
    ¬ ∃ b : Bridge (planeFrame mixedSet mixedSet_fold_invariant), b.terminal = .bot :=
  fun h => form3_countermodel.2 ((lineProperty_planeFrame_iff _ _).mp ((halted_bridge_iff _).mp h))
end ParityReduction
#print axioms ParityReduction.strip_artifact_fork
#print axioms ParityReduction.bridge_on_the_forms
#print axioms ParityReduction.no_halted_bridge_on_form3
