import Lean
/-!
# MATHEMATICAL TRISDUCTION CODEX · v2.0.1 · THE LEAN SURFACE
Core Lean 4 (v4.19.0), no Mathlib, no sorry, no axiom beyond Lean's standard three (propext, Classical.choice,
Quot.sound) and the twenty-three declared posits of ROOT and POSTULATE, which the environment audit at the foot
of this file names one by one. `import Lean`
is loaded for that audit alone. Every theorem carries its axiom cone as a `#guard_msgs` receipt.
The Lean surface proves; the Fortran twin (Part II of the codex) executes the same register.
The four Fortran witnesses F1 thesis_rows, F2 ra_toe_thesis, F3 ftoe_kinetic_demonstration and
F4 it_from_it are seated once, in the twin, with their contracts; this file no longer carries a second copy.
Delta-M = 0. No new mathematics is authored by this file.
-/

namespace Codex

def LeftInverse (g : β → α) (f : α → β) : Prop := ∀ a, g (f a) = a

def RightInverse (g : β → α) (f : α → β) : Prop := LeftInverse f g
end Codex

structure Equiv (α : Sort u) (β : Sort v) where
  toFun : α → β
  invFun : β → α
  left_inv : Codex.LeftInverse invFun toFun
  right_inv : Codex.RightInverse invFun toFun

infixl:25 " ≃ " => Equiv

def Nat.factorial : Nat → Nat
  | 0 => 1
  | n + 1 => (n + 1) * Nat.factorial n

namespace CoreRat

theorem div_pos_of_le {d g : Nat} (hg : 0 < g) (hle : g ≤ d) : 0 < d / g := by
  have h : 1 * g ≤ d := by rw [Nat.one_mul]; exact hle
  exact (Nat.le_div_iff_mul_le hg).mpr h

theorem div_gcd_pos {a d : Nat} (hd : 0 < d) : 0 < d / Nat.gcd a d :=
  div_pos_of_le (Nat.gcd_pos_of_pos_right a hd) (Nat.le_of_dvd hd (Nat.gcd_dvd_right a d))

theorem coprime_div_gcd {a d : Nat} (hd : 0 < d) :
    Nat.gcd (a / Nat.gcd a d) (d / Nat.gcd a d) = 1 := by
  have hg : 0 < Nat.gcd a d := Nat.gcd_pos_of_pos_right a hd
  have ha : Nat.gcd a d * (a / Nat.gcd a d) = a := Nat.mul_div_cancel' (Nat.gcd_dvd_left a d)
  have hb : Nat.gcd a d * (d / Nat.gcd a d) = d := Nat.mul_div_cancel' (Nat.gcd_dvd_right a d)
  have h : Nat.gcd a d * Nat.gcd (a / Nat.gcd a d) (d / Nat.gcd a d) = Nat.gcd a d := by
    have e := Nat.gcd_mul_left (Nat.gcd a d) (a / Nat.gcd a d) (d / Nat.gcd a d)
    rw [ha, hb] at e; exact e.symm
  have h2 : Nat.gcd a d * Nat.gcd (a / Nat.gcd a d) (d / Nat.gcd a d) = Nat.gcd a d * 1 := by
    rw [Nat.mul_one]; exact h
  exact Nat.eq_of_mul_eq_mul_left hg h2

end CoreRat

structure Ratio where
  num : Int
  den : Nat
  pos : 0 < den
  cop : Nat.gcd num.natAbs den = 1
  deriving DecidableEq, Repr

namespace Ratio

theorem natAbs_signed (k : Nat) (neg : Bool) :
    (if neg then -(k : Int) else (k : Int)).natAbs = k := by cases neg <;> simp

def mk' (n d : Int) : Ratio :=
  if hd : d = 0 then ⟨0, 1, by decide, by decide⟩
  else
    let neg : Bool := decide ((n < 0) ≠ (d < 0))
    let a : Nat := n.natAbs
    let b : Nat := d.natAbs
    have hb : 0 < b := Int.natAbs_pos.mpr hd
    let g : Nat := Nat.gcd a b
    ⟨(if neg then -((a / g : Nat) : Int) else ((a / g : Nat) : Int)), b / g,
     CoreRat.div_gcd_pos hb, by rw [natAbs_signed]; exact CoreRat.coprime_div_gcd hb⟩

instance instOfNatRat : OfNat Ratio n := ⟨mk' n 1⟩
instance instAddRat : Add Ratio where add a b := mk' (a.num * b.den + b.num * a.den) (a.den * b.den)
instance instMulRat : Mul Ratio where mul a b := mk' (a.num * b.num) (a.den * b.den)
instance instNegRat : Neg Ratio where neg a := mk' (-a.num) a.den
instance instSubRat : Sub Ratio where sub a b := a + (-b)

def inv (a : Ratio) : Ratio := mk' (a.den : Int) a.num
instance instDivRat : Div Ratio where div a b := a * inv b
instance instLTRat : LT Ratio where lt a b := a.num * b.den < b.num * a.den
instance instLERat : LE Ratio where le a b := a.num * b.den ≤ b.num * a.den
instance instDecidableLtRat (a b : Ratio) : Decidable (a < b) :=
  inferInstanceAs (Decidable (a.num * b.den < b.num * a.den))
instance instDecidableLeRat (a b : Ratio) : Decidable (a ≤ b) :=
  inferInstanceAs (Decidable (a.num * b.den ≤ b.num * a.den))

def pow (a : Ratio) : Nat → Ratio
  | 0 => 1
  | n + 1 => a * pow a n
instance instHPowRatNat : HPow Ratio Nat Ratio := ⟨Ratio.pow⟩
instance instToStringRat : ToString Ratio where
  toString a := if a.den == 1 then toString a.num else toString a.num ++ "/" ++ toString a.den

@[simp] theorem num_zero : (0 : Ratio).num = 0 := rfl
@[simp] theorem den_zero : (0 : Ratio).den = 1 := rfl

theorem mk'_zero_num {d : Nat} (hd : 0 < d) : mk' 0 (d : Int) = 0 := by
  have hne : (d : Int) ≠ 0 := by omega
  show mk' 0 (d : Int) = mk' 0 1
  unfold mk'
  simp only [hne, (by decide : (1 : Int) ≠ 0), dite_false]
  simp [Nat.gcd_zero_left, Nat.div_self hd, Nat.zero_div]

@[simp] theorem zero_mul (a : Ratio) : (0 : Ratio) * a = 0 := by
  show mk' ((0 : Ratio).num * a.num) (((0 : Ratio).den * a.den : Nat) : Int) = 0
  rw [num_zero, den_zero, Int.zero_mul, Nat.one_mul]
  exact mk'_zero_num a.pos

@[simp] theorem mul_zero (a : Ratio) : a * (0 : Ratio) = 0 := by
  show mk' (a.num * (0 : Ratio).num) ((a.den * (0 : Ratio).den : Nat) : Int) = 0
  rw [num_zero, den_zero, Int.mul_zero, Nat.mul_one]
  exact mk'_zero_num a.pos

theorem canonical (a : Ratio) : 0 < a.den ∧ Nat.gcd a.num.natAbs a.den = 1 := ⟨a.pos, a.cop⟩

theorem ext {a b : Ratio} (h1 : a.num = b.num) (h2 : a.den = b.den) : a = b := by
  cases a; cases b; simp_all

theorem inv_zero : inv (0 : Ratio) = 0 := by decide

end Ratio

set_option maxRecDepth 4000000

inductive Grade : Type
  | premise | corroboration | operational | structural | engineering
  | conditional | theoremConditional | analytic | theorem
  deriving DecidableEq, Repr

def Grade.rank : Grade → Nat
  | .premise => 0 | .corroboration => 1 | .operational => 2 | .structural => 3
  | .engineering => 4 | .conditional => 5 | .theoremConditional => 6
  | .analytic => 7 | .theorem => 8

def Grade.weakest (a b : Grade) : Grade := if a.rank ≤ b.rank then a else b

theorem Grade.weakest_is_a_link (a b : Grade) :
    Grade.weakest a b = a ∨ Grade.weakest a b = b := by
  cases a <;> cases b <;> decide

theorem Grade.weakest_idempotent (a : Grade) : Grade.weakest a a = a := by
  cases a <;> decide

structure Claim : Type where
  stmt : Prop
  grade : Grade
  warrant : stmt

def Claim.join (c₁ c₂ : Claim) : Claim where
  stmt := c₁.stmt ∧ c₂.stmt
  grade := Grade.weakest c₁.grade c₂.grade
  warrant := ⟨c₁.warrant, c₂.warrant⟩

theorem Claim.join_grade (c₁ c₂ : Claim) :
    (Claim.join c₁ c₂).grade = Grade.weakest c₁.grade c₂.grade := rfl

def deltaM : Nat := 0

def socialWeight : Nat := 0

/-
THE FORMAL THEORY OF EVERYTHING · THE FORMAL PROOF
Lean 4 (core only, no mathlib, zero sorries).

This file proves the complete theorem content of the fTOE:

  WALL      (T1) No even reading decides an odd target.
            (T2) No finite coalition of even readings escapes T1.
            (T3) Odd content carries no fixed point.
  PRICE     (T4) The odd content of a free orbit is exactly one binary
                 degree of freedom: never two, never a continuum.
  CROSSING  (T5) One odd supply at the seat, plus exactly one calibration
                 bit, decides the target on its orbit; and that calibration
                 is unique. One bit missing, one bit supplied, nothing more.

What this file does not contain, by its own theorems: the supply itself.
Existence of the supply is the One-Cut Hypothesis, stated as a hypothesis
in the treatise this file accompanies. The wall is proved here. What crosses
it enters by deed, not by derivation.
-/
namespace FTOE

variable {α : Type}

/-- A reading f is even under τ when it is constant on τ-orbits. -/
def Even (τ : α → α) (f : α → Bool) : Prop := ∀ x, f (τ x) = f x

/-- A target d is odd under τ when it separates some orbit. -/
def OddAt (τ : α → α) (d : α → Bool) (x : α) : Prop := d (τ x) ≠ d x

/-- A sign vector t is wholly odd under τ when t ∘ τ = ¬t. -/
def WhollyOdd (τ : α → α) (t : α → Bool) : Prop := ∀ x, t (τ x) = !t x

/-- T1 · THE WALL.
    An even reading equals no odd target. The register computes every
    magnitude and no orientation. -/
theorem T1_wall (τ : α → α) (f d : α → Bool) (x : α)
    (he : Even τ f) (ho : OddAt τ d x) : f ≠ d := by
  intro h
  subst h
  exact ho (he x)

/-- T2 · COALITION CLOSURE.
    Evenness is closed under every Boolean join, so no coalition of even
    readings escapes the wall. -/
theorem T2_coalition (τ : α → α) (f g d : α → Bool) (x : α)
    (hf : Even τ f) (hg : Even τ g) (op : Bool → Bool → Bool)
    (ho : OddAt τ d x) : (fun y => op (f y) (g y)) ≠ d := by
  apply T1_wall τ _ d x
  · intro y; show op (f (τ y)) (g (τ y)) = op (f y) (g y); rw [hf y, hg y]
  · exact ho

/-- T3 · NO FIXED POINT.
    Wholly odd content cannot sit on a fixed point of τ:
    t x = ¬t x is a Boolean contradiction. -/
theorem T3_no_fixed_point (τ : α → α) (t : α → Bool)
    (ho : WhollyOdd τ t) (x : α) : τ x ≠ x := by
  intro h
  have h1 : t (τ x) = !t x := ho x
  rw [h] at h1
  cases t x <;> simp at h1

/-- T4 · THE PRICE: ONE BIT PER ORBIT.
    Two wholly odd sign vectors agreeing at one point of an orbit agree on
    the whole orbit. The odd content of a free orbit is exhausted by one
    binary choice. -/
theorem T4_one_bit (τ : α → α) (s t : α → Bool)
    (hs : WhollyOdd τ s) (ht : WhollyOdd τ t)
    (x : α) (h : s x = t x) : s (τ x) = t (τ x) := by
  rw [hs x, ht x, h]

/-- T5 · THE CROSSING.
    If a supply s and a target d are both odd at the seat x, then there is
    exactly one calibration bit c with d = s XOR c on the whole orbit:
    one supplied orientation bit, one calibration from the dated record,
    and the target is decided. Existence and uniqueness. -/
theorem T5_crossing (τ : α → α) (s d : α → Bool) (x : α)
    (hs : s (τ x) = !s x) (hd : d (τ x) = !d x) :
    ∃ c : Bool, (d x = xor (s x) c ∧ d (τ x) = xor (s (τ x)) c) ∧
      ∀ c' : Bool, (d x = xor (s x) c' ∧ d (τ x) = xor (s (τ x)) c') → c' = c := by
  exact ⟨xor (d x) (s x),
    ⟨by cases s x <;> cases d x <;> rfl,
     by rw [hs, hd]; cases s x <;> cases d x <;> rfl⟩,
    by
      intro c' hc
      obtain ⟨h1, -⟩ := hc
      generalize hsx : s x = sv
      generalize hdx : d x = dv
      rw [hsx, hdx] at h1
      cases sv <;> cases dv <;> cases c' <;> first | rfl | exact absurd h1 (by decide)⟩

/-- T6a · DEED A — THE ANCHOR (FORGE cycle two: the two deeds, split).
    If d is odd at x₀ and the deed anchors one point (d x₀ = b — the
    corpus's identification of which sign is which, present in any corpus
    that can pose the decision at all), then d is known on the whole orbit
    {x₀, τx₀}. NO SUPPLY IS REQUIRED: oddness propagates the anchored bit.
    This is the deed as the arrival of the target's value at one point. -/
theorem T6a_deed_anchor (τ : α → α) (d : α → Bool) (x₀ : α) (b : Bool)
    (hd : d (τ x₀) = !d x₀) (anchor : d x₀ = b) :
    d x₀ = b ∧ d (τ x₀) = !b := by
  exact ⟨anchor, by rw [hd, anchor]⟩

/-- T6b · DEED B — THE SUPPLY (FORGE cycle two: the two deeds, split).
    If s is odd at x₀ and c is a naming bit supplied from outside — a
    universally quantified datum, never computed from d — then the arrival
    equation d = s ⊕ c, once it has arrived, lets anything holding the pair
    (s, c) decide d on the whole orbit. This is the deed as the arrival of
    a register-denotable carrier plus one naming bit. Deeds A and B are
    different deeds; neither is a rewrite of the other inside this file. -/
theorem T6b_deed_supply (τ : α → α) (s d : α → Bool) (x₀ : α) (c : Bool)
    (hs : s (τ x₀) = !s x₀)
    (arrival : d x₀ = xor (s x₀) c ∧ d (τ x₀) = xor (s (τ x₀)) c) :
    d x₀ = xor (s x₀) c ∧ d (τ x₀) = !xor (s x₀) c := by
  constructor
  · exact arrival.1
  · rw [arrival.2, hs]; cases s x₀ <;> cases c <;> rfl

/-- THE PORT · the two deeds compose without identifying.
    Where Deed A anchors b = d x₀ and Deed B supplies s odd with naming c,
    consistency of the two arrivals forces c = s x₀ ⊕ b. The calibration
    is the agreement of the two deeds, computed from arrived data only.
    The missing bit exists as b (Deed A) or as c (Deed B); that one such
    bit always exists for every blocked row is the One-Cut Hypothesis,
    stated as conjecture in the treatise — never as a theorem of this file. -/
theorem fTOE_port (_τ : α → α) (s d : α → Bool) (x₀ : α) (b c : Bool)
    (anchor : d x₀ = b)
    (arrival : ∀ y : α, d y = xor (s y) c) :
    c = xor (s x₀) b := by
  have h1 := arrival x₀
  rw [anchor] at h1
  generalize hsx : s x₀ = sv
  rw [hsx] at h1
  cases sv <;> cases b <;> cases c <;> first | rfl | exact absurd h1 (by decide)

/-! ## FORGE cycle three · the full-setup package
    The auditors demanded the prose setup be theorem, not preface:
    involution, freeness, global oddness, the observation model, the
    torsor bijection, and resolver separation. Proved here in core Lean. -/

section FullSetup
variable {β γ : Type}

/-- τ is an involution: applying it twice is the identity. -/
def Involution (τ : α → α) : Prop := ∀ x, τ (τ x) = x

/-- τ is fixed-point-free: every orbit is a genuine pair. -/
def FixedPointFree (τ : α → α) : Prop := ∀ x, τ x ≠ x

/-- T7 · THE GLOBAL WALL. Under global oddness, no even reading equals the
    target anywhere it is tested: the wall holds at every point, not one. -/
theorem T7_global_wall (τ : α → α) (f d : α → Bool) (x : α)
    (hf : Even τ f) (hd : WhollyOdd τ d) : f ≠ d := by
  intro h
  have h1 : f (τ x) = d (τ x) := congrFun h (τ x)
  rw [hf x, hd x, congrFun h x] at h1
  cases d x <;> simp at h1

/-- T8a · THE TORSOR, FORWARD. The xor of two wholly odd sections is even:
    the calibration against a reference supply descends to the orbit space.
    This is the machine-checked content of "the calibration is a function
    of the orbit, not of the point." -/
theorem T8_torsor_forward (τ : α → α) (s d : α → Bool)
    (hs : WhollyOdd τ s) (hd : WhollyOdd τ d) :
    Even τ (fun x => xor (d x) (s x)) := by
  intro x
  show xor (d (τ x)) (s (τ x)) = xor (d x) (s x)
  rw [hd x, hs x]; cases d x <;> cases s x <;> rfl

/-- T8b · THE TORSOR, BACKWARD. An odd reference xor an even calibration
    is odd: every even calibration pattern lifts to an admissible target. -/
theorem T8_torsor_backward (τ : α → α) (s c : α → Bool)
    (hs : WhollyOdd τ s) (hc : Even τ c) :
    WhollyOdd τ (fun x => xor (s x) (c x)) := by
  intro x
  show xor (s (τ x)) (c (τ x)) = !xor (s x) (c x)
  rw [hs x, hc x]; cases s x <;> cases c x <;> rfl

/-- T9a · THE TORSOR IS A BIJECTION, FIRST INVERSE. Reference-first:
    s ⊕ (d ⊕ s) = d. Odd sections and even calibrations are in bijection. -/
theorem T9_torsor_inverse_left (s d : α → Bool) :
    (fun x => xor (s x) (xor (d x) (s x))) = d := by
  funext x; cases d x <;> cases s x <;> rfl

/-- T9b · THE TORSOR IS A BIJECTION, SECOND INVERSE. Calibration-first:
    (s ⊕ c) ⊕ s = c. The bijection is exact, not approximate. -/
theorem T9_torsor_inverse_right (s c : α → Bool) :
    (fun x => xor (xor (s x) (c x)) (s x)) = c := by
  funext x; cases s x <;> cases c x <;> rfl

/-- T10 · THE FACTORIZATION OBSTRUCTION. Let the register be an observation
    map ρ with ρ(τx) = ρ(x) — "the register" now means: measurability with
    respect to ρ. A target odd at x cannot factor through ρ. "Outside the
    register" is no longer a metaphor: it is non-measurability, proved. -/
theorem T10_factorization (τ : α → α) (ρ : α → β) (g : β → Bool)
    (d : α → Bool) (x : α)
    (hρ : ρ (τ x) = ρ x) (hd : d (τ x) = !d x) :
    d ≠ fun y => g (ρ y) := by
  intro h
  have h1 : d (τ x) = g (ρ (τ x)) := congrFun h (τ x)
  have h2 : d x = g (ρ x) := congrFun h x
  rw [hρ, hd, h2] at h1
  cases hgx : g (ρ x) <;> rw [hgx] at h1 <;> exact absurd h1 (by decide)

/-- T11 · RESOLVER SEPARATION. If an added observation a resolves d jointly
    with ρ — d(y) = r (ρ y) (a y) for some readout r — then a must separate
    every odd pair: a(τx) ≠ a(x). This proves ONLY local, pointwise
    separation: a Bool-valued a may separate every orbit while its alphabet
    stays {0,1}. The 2^m alphabet bound belongs to a different object — a
    single global message selecting one target from an admissible family —
    and is proved by T12's injectivity, never by T11 alone. -/
theorem T11_separation (τ : α → α) (ρ : α → β) (a : α → γ) (r : β → γ → Bool)
    (d : α → Bool) (x : α)
    (hρ : ρ (τ x) = ρ x) (hd : d (τ x) = !d x)
    (hres : ∀ y, d y = r (ρ y) (a y)) :
    a (τ x) ≠ a x := by
  intro h
  have h1 := hres (τ x)
  have h2 := hres x
  rw [hρ, h, hd, h2] at h1
  cases hrv : r (ρ x) (a x) <;> rw [hrv] at h1 <;> exact absurd h1 (by decide)

/-- T12 · THE GLOBAL CODE IS INJECTIVE. If a global message selects the
    target exactly — an encoder Enc and decoder Dec with Dec ∘ Enc = id on
    the admissible family — then Enc is injective, so the supply alphabet
    is at least as large as the family. This is the mechanism behind the
    counting bound: for the full wholly-odd family on m orbits, |S| >= 2^m
    (executed on the exhibited frame, battery K4); for an admissible
    subfamily A, |S| >= |A|. The one-bit crossing is exactly |A| = 2.
    Grading note: finite-cardinality monotonicity for injections
    (Fintype.card_le_of_injective) is mathlib machinery, outside this
    core-only file; the injectivity is proved here, the instance count is
    executed in K4 (2^6 = 64, pairwise distinct, alphabet >= 64). -/
theorem T12_encoder_injective {δ : Type} (Enc : δ → γ) (Dec : γ → δ)
    (h : ∀ d, Dec (Enc d) = d) :
    ∀ d₁ d₂ : δ, Enc d₁ = Enc d₂ → d₁ = d₂ := by
  intro d₁ d₂ hE
  have h1 := h d₁
  have h2 := h d₂
  rw [hE] at h1
  rw [h2] at h1
  exact h1.symm

/-- T14 · THE WALL, FACTORIZATION FORM (the final audit's exact statement).
    No target separating a τ-pair factors through any τ-invariant
    observation map: there is no g with g ∘ ρ = d. Stated without any
    finiteness hypothesis — stronger than the requested form, which
    assumed [Fintype U]. The proper formulation of "outside the register",
    companion to T10 (which quantifies over g pointwise; T14 closes the
    existential). -/
theorem T14_wall_factorization (τ : α → α) (ρ : α → β) (d : α → Bool) (x : α)
    (hρ : ∀ z, ρ (τ z) = ρ z) (hd : OddAt τ d x) :
    ¬ ∃ g : β → Bool, ∀ z, g (ρ z) = d z := by
  intro h
  obtain ⟨g, hg⟩ := h
  have h1 : d (τ x) = g (ρ (τ x)) := (hg (τ x)).symm
  have h2 : g (ρ (τ x)) = g (ρ x) := by rw [hρ x]
  have h3 : g (ρ x) = d x := hg x
  exact hd (h1.trans (h2.trans h3))

/-- T13 · THE TWO ODDS, TYPED. Wholly odd implies odd at every point.
    The converse is false and is not claimed: a merely non-invariant
    target may restrict arbitrarily on other orbits. The torsor (T8, T9)
    and the 2^m fibre count apply to the wholly-odd family only; the wall
    (T1, T7) needs only oddness at the seat. The two notions are separate
    hypotheses in this file and are never interchanged. -/
theorem T13_wholly_odd_is_odd_everywhere (τ : α → α) (d : α → Bool)
    (hd : WhollyOdd τ d) (x : α) : OddAt τ d x := by
  intro h
  rw [hd x] at h
  cases d x <;> simp at h

/-- The canonical free involution frame: Bool × Q with the flip.
    Its orbits are exactly the pairs {(true, q), (false, q)}, so its
    orbit quotient is Q itself. -/
def flipF {Q : Type} : Bool × Q → Bool × Q := fun (b, q) => (!b, q)

/-- T15a · THE PRICE, BIJECTION FORM (canonical frame), FORWARD ROUND TRIP.
    On the canonical frame, every wholly anti-invariant target is
    reconstructed from its values at the true-section: the map
    d ↦ (q ↦ d (true, q)) into (Q → Bool), followed by
    c ↦ ((b, q) ↦ xor (c q) (!b)), returns d exactly. Since the orbit
    quotient of the canonical frame is Q, this is one direction of
    Dτ(U) ≃ (U/τ → Bool). The exhibited K4 frame is the finite instance
    (Q = six seats); the cardinal corollary |Dτ(U)| = 2^|Q| is executed
    there and, in a mathlib build, follows by Fintype.card_congr. -/
theorem T15_price_bijection_forward {Q : Type} (d : Bool × Q → Bool)
    (hd : WhollyOdd flipF d) (b : Bool) (q : Q) :
    xor (d (true, q)) (!b) = d (b, q) := by
  have h : d (false, q) = !d (true, q) := hd (true, q)
  cases b
  · generalize ht : d (true, q) = tv
    generalize hf : d (false, q) = fv
    rw [ht, hf] at h
    cases tv <;> cases fv <;>
      first | rfl | exact h | exact h.symm | exact absurd h (by decide)
  · cases d (true, q) <;> rfl

/-- T15b · THE PRICE, BIJECTION FORM (canonical frame), BACKWARD.
    For every c : Q → Bool, the section (b, q) ↦ xor (c q) (!b) is wholly
    anti-invariant, and its true-section is c exactly: the maps are mutual
    inverses between Dτ(U) and (Q → Bool). -/
theorem T15_price_bijection_backward {Q : Type} (c : Q → Bool) :
    WhollyOdd flipF (fun (b, q) => xor (c q) (!b)) := by
  intro x
  obtain ⟨b, q⟩ := x
  show xor (c q) (!!b) = !xor (c q) (!b)
  cases c q <;> cases b <;> rfl

end FullSetup

/-- The whole theorem content in one line:
    a target odd at its seat is undecidable by the even register (T1, T2),
    missing exactly one bit (T4), and decided by exactly one supplied bit
    plus one calibration (T5). -/
theorem fTOE_core (τ : α → α) (s d : α → Bool) (x : α)
    (f g : α → Bool) (hf : Even τ f) (hg : Even τ g) (op : Bool → Bool → Bool)
    (hd : d (τ x) = !d x) (hs : s (τ x) = !s x) :
    (fun y => op (f y) (g y)) ≠ d ∧
    ∃ c : Bool, (d x = xor (s x) c ∧ d (τ x) = xor (s (τ x)) c) ∧
      ∀ c' : Bool, (d x = xor (s x) c' ∧ d (τ x) = xor (s (τ x)) c') → c' = c :=
  ⟨T2_coalition τ f g d x hf hg op (by intro h; rw [hd] at h; cases d x <;> simp at h),
   T5_crossing τ s d x hs hd⟩

end FTOE

/- Verification contract: this file must pass `lean fTOE_Formal_Proof.lean`
   with no output and exit code 0. Any edit that weakens a hypothesis,
   adds a sorry, or deletes a conjunct must fail that check. -/


namespace FTOE

variable {α : Type}

def OrbitRel (τ : α → α) (x y : α) : Prop := x = y ∨ τ x = y

theorem OrbitRel_symmetric (τ : α → α) (hinv : Involution τ) {x y : α} :
    OrbitRel τ x y → OrbitRel τ y x := by
  intro h
  cases h with
  | inl h => exact Or.inl h.symm
  | inr h => exact Or.inr (by rw [← h]; exact hinv x)

def Dtau (τ : α → α) : Type := { d : α → Bool // WhollyOdd τ d }

def calib (d0 d : α → Bool) : α → Bool := fun x => xor (d x) (d0 x)

theorem calib_even (τ : α → α) (d0 d : α → Bool)
    (h0 : WhollyOdd τ d0) (hd : WhollyOdd τ d) : Even τ (calib d0 d) :=
  T8_torsor_forward τ d0 d h0 hd

def descend (τ : α → α) (e : α → Bool) (he : Even τ e) :
    Quot (OrbitRel τ) → Bool :=
  Quot.lift e (by
    intro a b hab
    cases hab with
    | inl h => rw [h]
    | inr h => rw [← h]; exact (he a).symm)

def priceForward (τ : α → α) (d0 : Dtau τ) (d : Dtau τ) :
    Quot (OrbitRel τ) → Bool :=
  descend τ (calib d0.1 d.1) (calib_even τ d0.1 d.1 d0.2 d.2)

def priceBackward (τ : α → α) (hinv : Involution τ) (d0 : Dtau τ)
    (e : Quot (OrbitRel τ) → Bool) : Dtau τ :=
  ⟨fun x => xor (d0.1 x) (e (Quot.mk (OrbitRel τ) x)), by
    intro x
    show xor (d0.1 (τ x)) (e (Quot.mk (OrbitRel τ) (τ x)))
       = !xor (d0.1 x) (e (Quot.mk (OrbitRel τ) x))
    have hq : Quot.mk (OrbitRel τ) (τ x) = Quot.mk (OrbitRel τ) x :=
      Quot.sound (Or.inr (hinv x))
    rw [hq, d0.2 x]
    cases d0.1 x <;> cases e (Quot.mk (OrbitRel τ) x) <;> rfl⟩

theorem T16_left_inverse (τ : α → α) (hinv : Involution τ) (d0 : Dtau τ) :
    Codex.LeftInverse (priceBackward τ hinv d0) (priceForward τ d0) := by
  intro d
  apply Subtype.ext
  funext x
  show xor (d0.1 x) (xor (d.1 x) (d0.1 x)) = d.1 x
  cases d.1 x <;> cases d0.1 x <;> rfl

theorem T16_right_inverse (τ : α → α) (hinv : Involution τ) (d0 : Dtau τ) :
    Codex.RightInverse (priceBackward τ hinv d0) (priceForward τ d0) := by
  intro e
  funext q
  induction q using Quot.ind with
  | _ x =>
    show xor (xor (d0.1 x) (e (Quot.mk (OrbitRel τ) x))) (d0.1 x)
       = e (Quot.mk (OrbitRel τ) x)
    generalize e (Quot.mk (OrbitRel τ) x) = b
    generalize d0.1 x = a
    cases a <;> cases b <;> rfl

theorem T16_price_bijection (τ : α → α) (hinv : Involution τ) (d0 : Dtau τ) :
    Nonempty (Dtau τ ≃ (Quot (OrbitRel τ) → Bool)) :=
  ⟨{ toFun := priceForward τ d0
     invFun := priceBackward τ hinv d0
     left_inv := T16_left_inverse τ hinv d0
     right_inv := T16_right_inverse τ hinv d0 }⟩

def canonD0 : Dtau (flipF (Q := Bool)) :=
  ⟨fun (b, _) => b, by intro x; obtain ⟨b, q⟩ := x; rfl⟩

theorem flipF_involution : Involution (flipF (Q := Bool)) := by
  intro x; obtain ⟨b, q⟩ := x; cases b <;> rfl

theorem T16_canonical :
    Nonempty (Dtau (flipF (Q := Bool)) ≃
      (Quot (OrbitRel (flipF (Q := Bool))) → Bool)) :=
  T16_price_bijection (flipF (Q := Bool)) flipF_involution canonD0

theorem T17_odd_everywhere_iff_wholly_odd (τ : α → α) (d : α → Bool) :
    (∀ x, d (τ x) ≠ d x) ↔ (∀ x, d (τ x) = !d x) := by
  constructor
  · intro h x
    have hx := h x
    cases hd : d x <;> cases ht : d (τ x) <;> simp_all
  · intro h x
    have hx := h x
    cases hd : d x <;> cases ht : d (τ x) <;> simp_all

end FTOE

namespace K4

def val : Nat → Nat
  | 0 => 11 | 1 => 851 | 2 => 13 | 3 => 1273 | 4 => 17 | 5 => 437
  | 6 => 19 | 7 => 2119 | 8 => 23 | 9 => 1703 | 10 => 29 | 11 => 869
  | _ => 0

def tau : Nat → Nat := fun i =>
  if i < 12 then (if i % 2 = 0 then i + 1 else i - 1) else i

def target : Nat → Bool := fun i => i % 2 == 0

def rho : Nat → Nat := fun i =>
  (val i % 2) * 1000 + (val i % 3) * 100 + (val i % 5) * 10 + (val i % 7)

theorem tau_involution : ∀ i, i < 12 → tau (tau i) = i := by decide

theorem tau_fixed_point_free : ∀ i, i < 12 → tau i ≠ i := by decide

theorem target_wholly_odd : ∀ i, i < 12 → target (tau i) = !target i := by decide

theorem register_even : ∀ i, i < 12 → rho (tau i) = rho i := by decide

theorem val_lifts_mod_210 : ∀ i, i < 12 → i % 2 = 1 →
    val i > val (tau i) ∧ (val i - val (tau i)) % 210 = 0 := by decide

theorem wall (g : Nat → Bool) : target ≠ fun y => g (rho y) :=
  FTOE.T10_factorization tau rho g target 0
    (register_even 0 (by decide)) (target_wholly_odd 0 (by decide))

theorem pair_distinct : target ≠ fun i => !target i := by
  intro h
  exact absurd (congrFun h 0) (by decide)

theorem price_one_bit : 2^1 = 2 := rfl

theorem price_full_fibre : (2 : Nat)^6 = 64 := by decide

def wallClaim : Claim where
  stmt := ∀ g : Nat → Bool, target ≠ fun y => g (rho y)
  grade := .theorem
  warrant := wall

end K4

namespace Audit

inductive Token : Type
  | sealed | broken | opn | refused | determined | dotmark
  | gok | golok | void | aGivenRA | iAm | interior
  deriving DecidableEq, Repr, BEq

inductive Compartment : Type
  | closureRowed | unpopulated | worldRowed | none
  deriving DecidableEq, Repr, BEq

inductive Ans : Type
  | yes | no | unknown
  deriving DecidableEq, Repr, BEq

def Ans.toBool : Ans → Bool
  | .yes => true
  | _ => false

structure ClaimInput where
  hasContent  : Ans
  facesScoped : Ans
  canonical   : Ans
  forwardMode : Ans
  populated   : Ans
  worldlyRow  : Ans
  drillsOk    : Ans
  frameClosed : Ans
  slots       : Option (List (List Int))
  deriving Repr

def ClaimInput.anyUnknown (i : ClaimInput) : Bool :=
  [i.hasContent, i.facesScoped, i.canonical, i.forwardMode, i.populated,
   i.worldlyRow, i.drillsOk, i.frameClosed].any (· == Ans.unknown)
    || i.slots.isNone

def sealL : Option (List (List Int)) → Token × String
  | none => (.opn, "S-L0: vocabulary slots not supplied; under-determined")
  | some slots =>
    let nz := slots.map (fun s => s.filter (· != 0))
    if slots.flatten.any (fun x => decide (x < 0)) then
      (.broken, "negative literal id; not vocabulary")
    else
      let nfull := (nz.filter (fun s => !s.isEmpty)).length
      if nfull != 3 then
        (.broken, s!"deletion test returns {nfull} slots, not three")
      else if nz.any (fun s => s.length != s.eraseDups.length) then
        (.broken, "repeated literal within slot")
      else
        let flat := nz.flatten
        if flat.length != flat.eraseDups.length then
          (.broken, "LIT collision across slots")
        else
          (.sealed, "three slots, vocabulary pairwise disjoint")

structure DrillInput where
  d1 : Ans
  d2 : Ans
  d3Filed : Ans
  d3Shaped : Ans
  d4 : Ans
  d5 : Ans
  d6 : Ans
  deriving Repr

def DrillInput.anyUnknown (d : DrillInput) : Bool :=
  [d.d1, d.d2, d.d3Filed, d.d3Shaped, d.d4, d.d5, d.d6].any (· == Ans.unknown)

def drillScreen (d : DrillInput) : Token × Grade × String :=
  if d.anyUnknown then
    (.opn, .premise, "drill screen under-determined: a drill was not run")
  else if !(d.d1.toBool && d.d2.toBool) then
    (.broken, .premise, "D1/D2 fail: Seal L break, terminal whatever the determinant reads")
  else if !d.d3Filed.toBool then
    (.broken, .premise, "D3 fail: provenance unfiled; Number-shaped content in the Tongue seat")
  else if !d.d4.toBool then
    (.broken, .premise, "D4 fail: a magnitude carried on the Tongue; sign only, veto never substitution")
  else if !d.d5.toBool then
    (.broken, .premise, "D5 fail: register undeclared; re-index rather than refute")
  else if !d.d6.toBool then
    (.broken, .premise, "D6 fail: the Tongue reproduced the blindness it was appointed to repair")
  else if d.d3Shaped.toBool then
    (.sealed, .structural, "drills pass; provenance filed and SHAPED, so the assignment caps at structural")
  else
    (.sealed, .theorem, "drills pass; provenance filed and unshaped, no tier discount")

def refusalGates (i : ClaimInput) : Option (Compartment × Token × String) :=
  if !i.hasContent.toBool then
    some (.none, .refused, "F-0: every term decoration; contentless, refused, not compartmented")
  else if !i.facesScoped.toBool then
    some (.none, .refused, "R-1: faces not enumerated; a composite carries one compartment per face")
  else if !i.canonical.toBool then
    some (.none, .refused, "R-2: not canonicalised; the compartment attaches to the stripped string")
  else none

def compartmentGates (i : ClaimInput) : Compartment × Token × String :=
  if !i.populated.toBool then
    (.unpopulated, .opn, "S-1: an axis is empty; two planes meet in a line; no lock forms")
  else if i.forwardMode.toBool then
    (.worldRowed, .determined, "R-3: a dated axis must be sourced, never measured; world-rowed unconditionally")
  else if i.worldlyRow.toBool then
    (.worldRowed, .determined, "S-2: a row furnished by the world; the lock is total given those rows")
  else if !i.drillsOk.toBool then
    (.worldRowed, .opn, "S-3: term closure unscreened; typed by its remaining rows")
  else if !i.frameClosed.toBool then
    (.worldRowed, .opn, "S-4: existential import or transport; the leak names the compartment")
  else
    (.closureRowed, .sealed, "rows are the closure; the two determinations are one; conditional on the root posit at the act")

def auditClaim (i : ClaimInput) : Compartment × Token × String :=
  if i.anyUnknown then
    (.none, .opn, "under-determined reading: a gate or the slots were not supplied; first failure terminal, nothing sealed")
  else
    match refusalGates i with
    | some r => r
    | none =>
      match sealL i.slots with
      | (.broken, msg) => (.none, .broken, s!"Seal L break, terminal: {msg}")
      | _ => compartmentGates i

def compartmentGrade : Compartment → Grade → String
  | .closureRowed, cap =>
      s!"row-indefeasible, defeasible against fault, cap {repr cap}"
  | .unpopulated, _ => "no determination to defeat; an axis is owed"
  | .worldRowed, _ =>
      "revisable entirely in the rows; direction bought with the arrow"
  | .none, _ => "no compartment"

theorem unknown_routes_open (i : ClaimInput) (h : i.anyUnknown = true) :
    (auditClaim i).2.1 = Token.opn := by
  simp [auditClaim, h]

theorem contentless_refused (i : ClaimInput)
    (hk : i.anyUnknown = false) (hc : i.hasContent = Ans.no) :
    (auditClaim i).2.1 = Token.refused := by
  unfold auditClaim refusalGates
  rw [hk]
  simp [hc, Ans.toBool]

def det3 (m : Fin 3 → Fin 3 → Ratio) : Ratio :=
  m 0 0 * (m 1 1 * m 2 2 - m 1 2 * m 2 1)
    - m 0 1 * (m 1 0 * m 2 2 - m 1 2 * m 2 0)
    + m 0 2 * (m 1 0 * m 2 1 - m 1 1 * m 2 0)

theorem det3_two_id : det3 (fun a b => if a == b then (2 : Ratio) else 0) = 8 := by
  decide

end Audit

#eval Audit.auditClaim {
  hasContent := .no, facesScoped := .yes, canonical := .yes,
  forwardMode := .no, populated := .yes, worldlyRow := .no,
  drillsOk := .yes, frameClosed := .yes, slots := some [[1], [2], [3]] }

#eval Audit.auditClaim {
  hasContent := .yes, facesScoped := .yes, canonical := .yes,
  forwardMode := .no, populated := .yes, worldlyRow := .no,
  drillsOk := .yes, frameClosed := .yes, slots := some [[1, 2], [3], [4]] }

#eval Audit.auditClaim {
  hasContent := .yes, facesScoped := .yes, canonical := .unknown,
  forwardMode := .no, populated := .yes, worldlyRow := .no,
  drillsOk := .yes, frameClosed := .yes, slots := some [[1], [2], [3]] }

#eval Audit.auditClaim {
  hasContent := .yes, facesScoped := .yes, canonical := .yes,
  forwardMode := .no, populated := .yes, worldlyRow := .no,
  drillsOk := .yes, frameClosed := .yes, slots := some [[1, 2], [3], [2]] }

#eval Audit.det3 (fun a b => if a == b then (2 : Ratio) else (0 : Ratio))

namespace INVERSION

def ItFromBit {α β : Type} (ρ : α → β) (d : α → Bool) : Prop :=
  ∃ g : β → Bool, d = fun y => g (ρ y)

theorem it_from_bit_refuted {α β : Type} (τ : α → α) (ρ : α → β)
    (d : α → Bool) (x : α)
    (hρ : ρ (τ x) = ρ x) (hd : d (τ x) = !d x) :
    ¬ ItFromBit ρ d := by
  intro h
  obtain ⟨g, hg⟩ := h
  exact FTOE.T10_factorization τ ρ g d x hρ hd hg

structure ItFromIt {α β : Type} (τ : α → α) (ρ : α → β) (d : α → Bool)
    (x : α) : Prop where
  
  record_collapses : ρ (τ x) = ρ x
  
  pair_genuine : τ x ≠ x
  
  target_separates : d (τ x) = !d x
  
  no_return : ¬ ItFromBit ρ d

theorem it_from_it {α β : Type} (τ : α → α) (ρ : α → β) (d : α → Bool)
    (x : α) (hρ : ρ (τ x) = ρ x) (hpair : τ x ≠ x) (hd : d (τ x) = !d x) :
    ItFromIt τ ρ d x :=
  ⟨hρ, hpair, hd, it_from_bit_refuted τ ρ d x hρ hd⟩

end INVERSION

namespace K4

theorem it_from_it_canonical :
    INVERSION.ItFromIt tau rho target 0 :=
  INVERSION.it_from_it tau rho target 0
    (register_even 0 (by decide)) (by decide) (target_wholly_odd 0 (by decide))

theorem it_from_bit_refuted_canonical :
    ¬ INVERSION.ItFromBit rho target :=
  it_from_it_canonical.no_return

def inversionClaim : Claim where
  stmt := INVERSION.ItFromIt tau rho target 0
  grade := .theorem
  warrant := it_from_it_canonical

end K4

namespace GEO

structure Q4 where
  r : Int
  i : Int
  j : Int
  k : Int
  deriving DecidableEq, Repr, BEq

def qmul (a b : Q4) : Q4 :=
  ⟨a.r*b.r - a.i*b.i - a.j*b.j - a.k*b.k,
   a.r*b.i + a.i*b.r + a.j*b.k - a.k*b.j,
   a.r*b.j - a.i*b.k + a.j*b.r + a.k*b.i,
   a.r*b.k + a.i*b.j - a.j*b.i + a.k*b.r⟩

def qconj (a : Q4) : Q4 := ⟨a.r, -a.i, -a.j, -a.k⟩
def qadd (a b : Q4) : Q4 := ⟨a.r+b.r, a.i+b.i, a.j+b.j, a.k+b.k⟩
def qsub (a b : Q4) : Q4 := ⟨a.r-b.r, a.i-b.i, a.j-b.j, a.k-b.k⟩
def qnorm2 (a : Q4) : Int := a.r*a.r + a.i*a.i + a.j*a.j + a.k*a.k
def qhalve (a : Q4) : Q4 := ⟨a.r/2, a.i/2, a.j/2, a.k/2⟩
def qquarter (a : Q4) : Q4 := ⟨a.r/4, a.i/4, a.j/4, a.k/4⟩

def qcanon (a : Q4) : Q4 :=
  if a.r != 0 then (if a.r < 0 then ⟨-a.r,-a.i,-a.j,-a.k⟩ else a)
  else if a.i != 0 then (if a.i < 0 then ⟨-a.r,-a.i,-a.j,-a.k⟩ else a)
  else if a.j != 0 then (if a.j < 0 then ⟨-a.r,-a.i,-a.j,-a.k⟩ else a)
  else if a.k != 0 then (if a.k < 0 then ⟨-a.r,-a.i,-a.j,-a.k⟩ else a)
  else a

def q1 : Q4 := ⟨1,0,0,0⟩
def qi : Q4 := ⟨0,1,0,0⟩
def qj : Q4 := ⟨0,0,1,0⟩
def qk : Q4 := ⟨0,0,0,1⟩

theorem chirality : qmul (qmul qi qj) qk = ⟨-1,0,0,0⟩ := rfl

theorem noncommutative : qmul qi qj ≠ qmul qj qi := by decide

def hurwitz : List Q4 :=
  [⟨2,0,0,0⟩,⟨-2,0,0,0⟩,⟨0,2,0,0⟩,⟨0,-2,0,0⟩,
   ⟨0,0,2,0⟩,⟨0,0,-2,0⟩,⟨0,0,0,2⟩,⟨0,0,0,-2⟩,
   ⟨1,1,1,1⟩,⟨1,1,1,-1⟩,⟨1,1,-1,1⟩,⟨1,1,-1,-1⟩,
   ⟨1,-1,1,1⟩,⟨1,-1,1,-1⟩,⟨1,-1,-1,1⟩,⟨1,-1,-1,-1⟩,
   ⟨-1,1,1,1⟩,⟨-1,1,1,-1⟩,⟨-1,1,-1,1⟩,⟨-1,1,-1,-1⟩,
   ⟨-1,-1,1,1⟩,⟨-1,-1,1,-1⟩,⟨-1,-1,-1,1⟩,⟨-1,-1,-1,-1⟩]

theorem hurwitz_norm : (hurwitz.all (fun u => qnorm2 u == 4)) = true := by decide

theorem hurwitz_products_even :
    (hurwitz.all (fun a => hurwitz.all (fun b =>
      let p := qmul a b
      (p.r % 2 == 0) && (p.i % 2 == 0) && (p.j % 2 == 0) && (p.k % 2 == 0)))) = true := by
  decide

theorem hurwitz_closed :
    (hurwitz.all (fun a => hurwitz.all (fun b =>
      hurwitz.any (fun u => u == qhalve (qmul a b))))) = true := by
  decide

def hurwitzReps : List Q4 := (hurwitz.map qcanon).eraseDups

theorem units_mod_sign_twelve : hurwitzReps.length = 12 := by decide

def conjClass (r : Q4) : List Q4 :=
  (hurwitz.map (fun u => qcanon (qquarter (qmul (qmul u r) (qconj u))))).eraseDups

def classSizesAux : List Q4 → List Q4 → List Nat
  | [], _ => []
  | r :: rest, seen =>
    if seen.any (fun s => s == r) then classSizesAux rest seen
    else
      let cls := conjClass r
      cls.length :: classSizesAux rest (seen ++ cls)

def insNat (n : Nat) : List Nat → List Nat
  | [] => [n]
  | m :: ms => if n ≤ m then n :: m :: ms else m :: insNat n ms
def insSort : List Nat → List Nat
  | [] => []
  | n :: ns => insNat n (insSort ns)

theorem class_equation :
    insSort (classSizesAux hurwitzReps []) = [1, 3, 4, 4] := by decide

def shell2 : List Q4 :=
  let v : List Int := [-1, 0, 1]
  (v.flatMap (fun r => v.flatMap (fun i => v.flatMap (fun j =>
    v.map (fun k => ⟨r,i,j,k⟩))))).filter (fun q => qnorm2 q == 2)

theorem shell_twentyfour :
    (shell2.length == 24) &&
    ((shell2.filter (fun q => q.r == 0)).length == 12) &&
    ((shell2.filter (fun q => q.r != 0)).length == 12) = true := by decide

set_option maxRecDepth 8000 in

theorem no_half_integer_norm2 :
    (let v : List Int := [-3, -1, 1, 3]
     (v.flatMap (fun r => v.flatMap (fun i => v.flatMap (fun j =>
       v.map (fun k => ⟨r,i,j,k⟩))))).all (fun q => qnorm2 q != 8)) = true := by
  decide

def allGates : List (Nat × Nat) :=
  [(0,1),(0,2),(0,3),(1,0),(1,2),(1,3),(2,0),(2,1),(2,3),(3,0),(3,1),(3,2)]

theorem gates_twelve : allGates.length = 12 := rfl

theorem gates_valid :
    (allGates.all (fun g => (g.1 != g.2) && (g.1 < 4) && (g.2 < 4))) = true := by decide

theorem gates_complete : ∀ a b : Fin 4, a ≠ b → ((a : Nat), (b : Nat)) ∈ allGates := by
  decide

def invCount (σ : List Nat) : Nat :=
  let idx := List.range σ.length
  let pairs := idx.flatMap (fun a => (idx.filter (fun b => a < b)).map (fun b => (a, b)))
  (pairs.filter (fun p => σ.getD p.1 0 > σ.getD p.2 0)).length

def perms24 : List (List Nat) :=
  [[0,1,2,3],[0,1,3,2],[0,2,1,3],[0,2,3,1],[0,3,1,2],[0,3,2,1],
   [1,0,2,3],[1,0,3,2],[1,2,0,3],[1,2,3,0],[1,3,0,2],[1,3,2,0],
   [2,0,1,3],[2,0,3,1],[2,1,0,3],[2,1,3,0],[2,3,0,1],[2,3,1,0],
   [3,0,1,2],[3,0,2,1],[3,1,0,2],[3,1,2,0],[3,2,0,1],[3,2,1,0]]

def a4 : List (List Nat) := perms24.filter (fun σ => invCount σ % 2 == 0)

theorem a4_order : a4.length = 12 := by decide

def actG (σ : List Nat) (g : Nat × Nat) : Nat × Nat := (σ.getD g.1 0, σ.getD g.2 0)

set_option maxRecDepth 100000 in

theorem a4_simply_transitive :
    ∀ a b c d : Fin 4, a ≠ b → c ≠ d →
      (a4.filter (fun σ => actG σ ((a : Nat), (b : Nat)) == ((c : Nat), (d : Nat)))).length = 1 := by
  decide

def tetraVerts : List Nat := [0, 1, 2, 3]
def tetraEdges : List (Nat × Nat) := [(0,1),(0,2),(0,3),(1,2),(1,3),(2,3)]
def tetraFaces : List (Nat × Nat × Nat) := [(0,1,2),(0,1,3),(0,2,3),(1,2,3)]

theorem euler_closure :
    (tetraVerts.length : Int) - tetraEdges.length + tetraFaces.length = 2 := by decide

def basisU : List Q4 := [qi, qj, qk]

def perms6 : List (List Nat) :=
  [[0,1,2],[0,2,1],[1,0,2],[1,2,0],[2,0,1],[2,1,0]]

theorem relabel_parity :
    (perms6.all (fun σ =>
      (qmul (qmul (basisU.getD (σ.getD 0 0) q1) (basisU.getD (σ.getD 1 0) q1)) (basisU.getD (σ.getD 2 0) q1)).r ==
        (if invCount σ % 2 == 0 then -1 else 1))) = true := by
  decide

abbrev O8 := Q4 × Q4

def omul (x y : O8) : O8 :=
  (qsub (qmul x.1 y.1) (qmul (qconj y.2) x.2),
   qadd (qmul y.2 x.1) (qmul x.2 (qconj y.1)))

def osub (x y : O8) : O8 := (qsub x.1 y.1, qsub x.2 y.2)
def onorm2 (x : O8) : Int := qnorm2 x.1 + qnorm2 x.2

def e8 (n : Nat) : O8 :=
  let q := fun k => if k == n then (1 : Int) else 0
  (⟨q 0, q 1, q 2, q 3⟩, ⟨q 4, q 5, q 6, q 7⟩)

theorem octonion_associator :
    osub (omul (omul (e8 1) (e8 2)) (e8 4)) (omul (e8 1) (omul (e8 2) (e8 4)))
      = (⟨0,0,0,0⟩, ⟨0,0,0,2⟩) := by
  decide

def hPairs : List (Q4 × Q4) :=
  let v : List Int := [-1, 0, 1]
  v.flatMap (fun i => v.flatMap (fun j => v.map (fun k =>
    (⟨i,j,k,1⟩, ⟨1,k,j,i⟩))))

theorem norm_composition_H :
    (hPairs.all (fun p => qnorm2 (qmul p.1 p.2) == qnorm2 p.1 * qnorm2 p.2)) = true := by
  decide

def oPairs : List (O8 × O8) :=
  let v : List Int := [-1, 0, 1]
  v.flatMap (fun i => v.flatMap (fun j => v.map (fun k =>
    ((⟨i,j,k,1⟩, ⟨j,k,i,1⟩), (⟨1,k,i,j⟩, ⟨1,i,j,k⟩)))))

theorem norm_composition_O :
    (oPairs.all (fun p => onorm2 (omul p.1 p.2) == onorm2 p.1 * onorm2 p.2)) = true := by
  decide
  
set_option maxRecDepth 1000000
  def det2 (r1 r2 r3 : Nat × Nat × Nat) : Nat :=
    (r1.1 * (r2.2.1 * r3.2.2 + r2.2.2 * r3.2.1)
       + r1.2.1 * (r2.1 * r3.2.2 + r2.2.2 * r3.1)
       + r1.2.2 * (r2.1 * r3.2.1 + r2.2.1 * r3.1)) % 2
  def gf2Mul (r1 r2 r3 : Nat × Nat × Nat) (v : Nat × Nat × Nat) : Nat × Nat × Nat :=
    ((r1.1 * v.1 + r1.2.1 * v.2.1 + r1.2.2 * v.2.2) % 2,
     (r2.1 * v.1 + r2.2.1 * v.2.1 + r2.2.2 * v.2.2) % 2,
     (r3.1 * v.1 + r3.2.1 * v.2.1 + r3.2.2 * v.2.2) % 2)
  
  def gf2Vecs : List (Nat × Nat × Nat) :=
    (List.range 8).map (fun n => (n / 4 % 2, n / 2 % 2, n % 2))
  def gf2Sols (r1 r2 r3 : Nat × Nat × Nat) (t : Nat × Nat × Nat) : List (Nat × Nat × Nat) :=
    gf2Vecs.filter (fun v => decide (gf2Mul r1 r2 r3 v = t))

  set_option maxRecDepth 1000000 in
  
  theorem triaxial_lock_gf2 :
      ∀ a1 a2 a3 b1 b2 b3 c1 c2 c3 t1 t2 t3 : Fin 2,
        (det2 ((a1 : Nat), (a2 : Nat), (a3 : Nat)) ((b1 : Nat), (b2 : Nat), (b3 : Nat))
              ((c1 : Nat), (c2 : Nat), (c3 : Nat)) = 1 ↔
         (gf2Sols ((a1 : Nat), (a2 : Nat), (a3 : Nat)) ((b1 : Nat), (b2 : Nat), (b3 : Nat))
                  ((c1 : Nat), (c2 : Nat), (c3 : Nat))
                  ((t1 : Nat), (t2 : Nat), (t3 : Nat))).length = 1) := by
    decide
  
  theorem triaxial_lock_gf2_count :
      ((List.range 4096).filter (fun n =>
        det2 (n / 2048 % 2, n / 1024 % 2, n / 512 % 2)
             (n / 256 % 2, n / 128 % 2, n / 64 % 2)
             (n / 32 % 2, n / 16 % 2, n / 8 % 2) = 1)).length = 1344 := by
    decide
  theorem triaxial_open_gf2_count :
      ((List.range 4096).filter (fun n =>
        det2 (n / 2048 % 2, n / 1024 % 2, n / 512 % 2)
             (n / 256 % 2, n / 128 % 2, n / 64 % 2)
             (n / 32 % 2, n / 16 % 2, n / 8 % 2) = 0)).length = 2752 := by
    decide
  
  abbrev V3 := Ratio × Ratio × Ratio
  abbrev M3 := V3 × V3 × V3

  def det3 (m : M3) : Ratio :=
    let ⟨a, b, c⟩ := m.1
    let ⟨d, e, f⟩ := m.2.1
    let ⟨g, h, i⟩ := m.2.2
    a * (e * i - f * h) - b * (d * i - f * g) + c * (d * h - e * g)

  
  def adj3 (m : M3) : M3 :=
    let ⟨a, b, c⟩ := m.1
    let ⟨d, e, f⟩ := m.2.1
    let ⟨g, h, i⟩ := m.2.2
    ((e * i - f * h, c * h - b * i, b * f - c * e),
     (f * g - d * i, a * i - c * g, c * d - a * f),
     (d * h - e * g, b * g - a * h, a * e - b * d))

  def mm3 (x y : M3) : M3 :=
    
    
    
    let row (r : V3) (c : Nat) : Ratio :=
      r.1 * (match c with | 0 => y.1.1 | 1 => y.1.2.1 | _ => y.1.2.2)
      + r.2.1 * (match c with | 0 => y.2.1.1 | 1 => y.2.1.2.1 | _ => y.2.1.2.2)
      + r.2.2 * (match c with | 0 => y.2.2.1 | 1 => y.2.2.2.1 | _ => y.2.2.2.2)
    ((row x.1 0, row x.1 1, row x.1 2),
     (row x.2.1 0, row x.2.1 1, row x.2.1 2),
     (row x.2.2 0, row x.2.2 1, row x.2.2 2))

  def diag3 (r : Ratio) : M3 := ((r, 0, 0), (0, r, 0), (0, 0, r))
  def mv3 (m : M3) (v : V3) : V3 :=
    (m.1.1 * v.1 + m.1.2.1 * v.2.1 + m.1.2.2 * v.2.2,
     m.2.1.1 * v.1 + m.2.1.2.1 * v.2.1 + m.2.1.2.2 * v.2.2,
     m.2.2.1 * v.1 + m.2.2.2.1 * v.2.1 + m.2.2.2.2 * v.2.2)
  def vscale (v : V3) (r : Ratio) : V3 := (v.1 * r, v.2.1 * r, v.2.2 * r)

  
  abbrev V3Z := Int × Int × Int
  abbrev M3Z := V3Z × V3Z × V3Z
  def det3Z (m : M3Z) : Int :=
    let ⟨a, b, c⟩ := m.1; let ⟨d, e, f⟩ := m.2.1; let ⟨g, h, i⟩ := m.2.2
    a * (e * i - f * h) - b * (d * i - f * g) + c * (d * h - e * g)
  def adj3Z (m : M3Z) : M3Z :=
    let ⟨a, b, c⟩ := m.1; let ⟨d, e, f⟩ := m.2.1; let ⟨g, h, i⟩ := m.2.2
    ((e * i - f * h, c * h - b * i, b * f - c * e),
     (f * g - d * i, a * i - c * g, c * d - a * f),
     (d * h - e * g, b * g - a * h, a * e - b * d))
  def mm3Z (x y : M3Z) : M3Z :=
    let row (r : V3Z) (c : Nat) : Int :=
      r.1 * (match c with | 0 => y.1.1 | 1 => y.1.2.1 | _ => y.1.2.2)
      + r.2.1 * (match c with | 0 => y.2.1.1 | 1 => y.2.1.2.1 | _ => y.2.1.2.2)
      + r.2.2 * (match c with | 0 => y.2.2.1 | 1 => y.2.2.2.1 | _ => y.2.2.2.2)
    ((row x.1 0, row x.1 1, row x.1 2),
     (row x.2.1 0, row x.2.1 1, row x.2.1 2),
     (row x.2.2 0, row x.2.2 1, row x.2.2 2))
  def diag3Z (r : Int) : M3Z := ((r, 0, 0), (0, r, 0), (0, 0, r))

  theorem adjugate_identity_int (m : M3Z) :
      mm3Z m (adj3Z m) = diag3Z (det3Z m) ∧ mm3Z (adj3Z m) m = diag3Z (det3Z m) := by
    obtain ⟨⟨a, b, c⟩, ⟨d, e, f⟩, ⟨g, h, i⟩⟩ := m
    simp only [mm3Z, adj3Z, det3Z, diag3Z, Prod.mk.injEq]
    simp only [Int.mul_sub, Int.sub_mul, Int.mul_assoc]
    refine ⟨⟨⟨?_, ?_, ?_⟩, ⟨?_, ?_, ?_⟩, ⟨?_, ?_, ?_⟩⟩, ⟨⟨?_, ?_, ?_⟩, ⟨?_, ?_, ?_⟩, ⟨?_, ?_, ?_⟩⟩⟩ <;>
      (try simp only [Int.mul_comm, Int.mul_left_comm]) <;> omega

  
  def AdjugateIdentity3 : Prop :=
    ∀ m : M3, mm3 m (adj3 m) = diag3 (det3 m) ∧ mm3 (adj3 m) m = diag3 (det3 m)

  
  def adj3Samples : List M3 :=
    [((1, 0, 0), (0, 1, 0), (0, 0, 1)),
     ((2, 0, 0), (0, 3, 0), (0, 0, 5)),
     ((1, 2, 3), (4, 5, 6), (7, 8, 9)),
     ((1, 2, 0), (0, 1, 1), (2, 0, 1)),
     ((0, 1, 2), (3, 4, 5), (6, 7, 9)),
     ((2, 1, 1), (1, 2, 1), (1, 1, 2))]
  theorem adj3_executed :
      adj3Samples.all (fun m =>
        decide (mm3 m (adj3 m) = diag3 (det3 m) ∧
                mm3 (adj3 m) m = diag3 (det3 m))) = true := by
    decide

  
  def cramerSolve (m : M3) (t : V3) : Option V3 :=
    if det3 m == 0 then none
    else some (vscale (mv3 (adj3 m) t) (Ratio.inv (det3 m)))
  theorem cramer_executed :
      cramerSolve ((1, 2, 0), (0, 1, 1), (2, 0, 1)) (5, 3, 4)
        = some ((7 : Ratio) / 5, (9 : Ratio) / 5, (6 : Ratio) / 5) ∧
      mv3 ((1, 2, 0), (0, 1, 1), (2, 0, 1)) ((7 : Ratio) / 5, (9 : Ratio) / 5, (6 : Ratio) / 5)
        = (5, 3, 4) := by
    decide

  
  inductive LockState : Type
    | lock | opn | broken
    deriving DecidableEq, Repr, BEq
  inductive GolToken : Type
    | golX | golQ | golOK
    deriving DecidableEq, Repr, BEq

  
  def golAdmit (magnitude ling : LockState) : GolToken × String × Nat :=
    match magnitude with
    | .broken => (.golX, "geometric/math magnitude reports broken geometry; no GOL", 1)
    | .opn => (.golQ, "no geometric/math lock: orthogonal volume unestablished", 2)
    | .lock =>
      match ling with
      | .lock => (.golOK, "magnitude plus direction; proceed to witness and asymmetry", 4)
      | _ => (.golQ, "magnitude locks but Seal L open: determinant carries no direction", 3)
  
  def gateNames : List String :=
    ["SREP", "REG", "SGEG", "CAUSAL", "MIG", "PTB",
     "DUAL", "CSCG", "CSEG", "MTA", "OMA", "ADEG"]
  theorem gateNames_twelve : gateNames.length = 12 := rfl

  
  def gateScreenGo : List String → List Bool → Nat → Bool × String × Nat
    | [], [], _ => (true, "[G-OK] twelve directed gates passed", 0)
    | n :: _, false :: _, k => (false, s!"[X] gate {k} failed: {n}", k)
    | _ :: ns, true :: bs, k => gateScreenGo ns bs (k + 1)
    | _, _, _ => (false, "[X] arity violation: the screen reads exactly twelve gates", 0)

  def gateScreen (passes : List Bool) : Bool × String × Nat :=
    gateScreenGo gateNames passes 1

  theorem gateScreen_clean :
      gateScreen (List.replicate 12 true)
        = (true, "[G-OK] twelve directed gates passed", 0) := by
    decide
  theorem gateScreen_first_failure :
      gateScreen (false :: List.replicate 11 true)
        = (false, "[X] gate 1 failed: SREP", 1) := by
    decide
  theorem gateScreen_names_failed_gate :
      gateScreen (List.replicate 6 true ++ false :: List.replicate 5 true)
        = (false, "[X] gate 7 failed: DUAL", 7) := by
    decide
  theorem gateScreen_arity :
      gateScreen (List.replicate 11 true)
        = (false, "[X] arity violation: the screen reads exactly twelve gates", 0) := by
    decide

  
  inductive RAVerdict : Type
    | refused | iii | ii | void | aGivenRA | opn
    deriving DecidableEq, Repr, BEq

  
  structure ClaimInputRA where
    nonvacuous  : Audit.Ans
    veLive      : Audit.Ans
    forward     : Audit.Ans
    populated   : Audit.Ans
    worldlyRow  : Audit.Ans
    termsClosed : Audit.Ans
    termWorldly : Audit.Ans
    frameClosed : Audit.Ans
    annotate    : Audit.Ans
    deriving Repr

  def ClaimInputRA.anyUnknown (i : ClaimInputRA) : Bool :=
    [i.nonvacuous, i.veLive, i.forward, i.populated, i.worldlyRow,
     i.termsClosed, i.termWorldly, i.frameClosed, i.annotate].any
      (· == Audit.Ans.unknown)

  
  def rowCascadeRACore
      (nonvacuous veLive forward populated worldlyRow
       termsClosed termWorldly frameClosed annotate : Bool) :
      RAVerdict × String × Nat :=
    if !nonvacuous then
      (.refused, "F-0: contentless; a contentless residence verifies nothing", 1)
    else if veLive || forward then
      (.iii, "R-3: V_E live or Forward; world-rowed, revisability in the rows", 3)
    else if !populated then
      (.ii, "S-1: third axis unpopulated; two planes meet in a line, no lock", 2)
    else if worldlyRow then
      (.iii, "S-2: a load-bearing row is furnished by the world", 3)
    else if !termsClosed then
      if termWorldly then (.iii, "S-3: an unclosed term is worldly", 3)
      else (.ii, "S-3: an unclosed term is formal; no closure-rowed lock", 2)
    else if !frameClosed then
      (.iii, "S-4: existential import leaks past the closure", 3)
    else if !annotate then
      (.void, "RA rider absent: an unannotated absolute is void", 5)
    else
      (.aGivenRA, "compartment I, closure-rowed: [seal A . RA], conditional at the act", 4)

  
  def rowCascadeRA (i : ClaimInputRA) : RAVerdict × String × Nat :=
    if i.anyUnknown then
      (.opn, "nullity law: an unanswered gate routes open; the answer is never guessed", 0)
    else
      rowCascadeRACore i.nonvacuous.toBool i.veLive.toBool i.forward.toBool
        i.populated.toBool i.worldlyRow.toBool i.termsClosed.toBool
        i.termWorldly.toBool i.frameClosed.toBool i.annotate.toBool

  
  theorem unknown_routes_open_ra :
      ∀ i : ClaimInputRA, i.anyUnknown = true → (rowCascadeRA i).1 = .opn := by
    intro i h
    simp [rowCascadeRA, h]

  
  def raDecode (n : Nat) : RAVerdict × String × Nat :=
    rowCascadeRACore (n.testBit 8) (n.testBit 7) (n.testBit 6) (n.testBit 5)
      (n.testBit 4) (n.testBit 3) (n.testBit 2) (n.testBit 1) (n.testBit 0)

  
  def raBattery : List (Nat × RAVerdict) :=
    [(299, .aGivenRA), (443, .iii), (267, .ii), (298, .void), (43, .refused),
     (363, .iii), (315, .iii), (295, .iii), (291, .ii), (297, .iii)]
  theorem ra_battery_f2 :
      raBattery.all (fun p => decide ((raDecode p.1).1 = p.2)) = true := by
    decide

  
  theorem ra_ledger_refused :
      ((List.range 512).filter (fun n => decide ((raDecode n).1 = .refused))).length = 256 := by
    decide
  theorem ra_ledger_iii :
      ((List.range 512).filter (fun n => decide ((raDecode n).1 = .iii))).length = 216 := by
    decide
  theorem ra_ledger_ii :
      ((List.range 512).filter (fun n => decide ((raDecode n).1 = .ii))).length = 36 := by
    decide
  theorem ra_ledger_void :
      ((List.range 512).filter (fun n => decide ((raDecode n).1 = .void))).length = 2 := by
    decide
  theorem ra_ledger_aGivenRA :
      ((List.range 512).filter (fun n => decide ((raDecode n).1 = .aGivenRA))).length = 2 := by
    decide

  
  def RAVerdict.toToken : RAVerdict → Audit.Token
    | .refused => .refused
    | .iii => .determined
    | .ii => .determined
    | .void => .void
    | .aGivenRA => .aGivenRA
    | .opn => .opn

  
  def GolToken.toToken : GolToken → Audit.Token
    | .golX => .broken
    | .golQ => .opn
    | .golOK => .golok

  
  def gateScreenToken (r : Bool × String × Nat) : Audit.Token :=
    if r.1 then .gok else .broken

  
  def demoInputA : ClaimInputRA :=
    { nonvacuous := .yes, veLive := .no, forward := .no, populated := .yes,
      worldlyRow := .no, termsClosed := .yes, termWorldly := .no,
      frameClosed := .yes, annotate := .yes }
  def demoInputVoid : ClaimInputRA := { demoInputA with annotate := .no }
  def demoInputOpen : ClaimInputRA := { demoInputA with termsClosed := .unknown }

  #eval golAdmit .lock .lock
  #eval golAdmit .broken .lock
  #eval golAdmit .opn .lock
  #eval golAdmit .lock .opn
  #eval gateScreen (List.replicate 12 true)
  #eval gateScreen (List.replicate 6 true ++ false :: List.replicate 5 true)
  #eval rowCascadeRA demoInputA
  #eval rowCascadeRA demoInputVoid
  #eval rowCascadeRA demoInputOpen
  #eval cramerSolve ((1, 2, 0), (0, 1, 1), (2, 0, 1)) (5, 3, 4)

end GEO

namespace ROOT

axiom U : Type

axiom ΔE : U → Int

axiom RA : ∀ x : U, 0 < ΔE x

def Actuates (x : U) : Prop := 0 < ΔE x

theorem actuation_universal : ∀ x : U, Actuates x := RA

def raClaim : Claim where
  stmt := ∀ x : U, 0 < ΔE x
  grade := .premise
  warrant := RA

structure Cut (X : Type) where
  τ : X → X
  involutive : FTOE.Involution τ
  free : FTOE.FixedPointFree τ

def boolCut : Cut Bool where
  τ := fun b => !b
  involutive := by intro b; cases b <;> rfl
  free := by intro b; cases b <;> decide

axiom FormalDomain : Type
axiom L1m : FormalDomain → Prop
axiom L2m : FormalDomain → Prop
axiom L3m : FormalDomain → Prop
axiom nest_21 : ∀ p, L2m p → L1m p
axiom nest_32 : ∀ p, L3m p → L2m p

theorem nest_31 : ∀ p, L3m p → L1m p := fun p h => nest_21 p (nest_32 p h)

def nestClaim : Claim where
  stmt := ∀ p, L3m p → L1m p
  grade := .conditional
  warrant := nest_31

axiom Ground : Type
axiom σ : Ground → Ground
axiom σ_binding : ∀ g : Ground, σ (σ g) = g

axiom Residence : U → Prop

def throneEmpty : Prop := ∀ x : U, 0 < ΔE x

theorem throne_is_RA : throneEmpty ↔ ∀ x : U, 0 < ΔE x := Iff.rfl

end ROOT

namespace SEALS

structure Seal where
  name : String
  anchor : Prop
  warrant : anchor

def sealL : Seal where
  name := "linguistic-semantic"
  anchor := ∀ c₁ c₂ : Claim, (Claim.join c₁ c₂).grade = Grade.weakest c₁.grade c₂.grade
  warrant := fun c₁ c₂ => Claim.join_grade c₁ c₂

def sealG : Seal where
  name := "topological-geometric"
  anchor := ∀ x : ROOT.U, 0 < ROOT.ΔE x
  warrant := ROOT.RA

def sealM : Seal where
  name := "mathematical"
  anchor := ∀ g : Nat → Bool, K4.target ≠ fun y => g (K4.rho y)
  warrant := K4.wall

theorem seals_distinct :
    "linguistic-semantic" ≠ "topological-geometric" ∧
    "topological-geometric" ≠ "mathematical" ∧
    "linguistic-semantic" ≠ "mathematical" := by decide

theorem seal_names_match :
    sealL.name = "linguistic-semantic" ∧ sealG.name = "topological-geometric" ∧
    sealM.name = "mathematical" := ⟨rfl, rfl, rfl⟩

theorem sealG_walk :
    GEO.allGates.length = 12
    ∧ GEO.a4.length = 12
    ∧ (GEO.tetraVerts.length : Int) - GEO.tetraEdges.length + GEO.tetraFaces.length = 2
    ∧ GEO.gateNames.length = 12
    ∧ (GEO.adj3Samples.all (fun m =>
        decide (GEO.mm3 m (GEO.adj3 m) = GEO.diag3 (GEO.det3 m) ∧
                GEO.mm3 (GEO.adj3 m) m = GEO.diag3 (GEO.det3 m)))) = true
    ∧ (GEO.raBattery.all (fun p =>
        decide ((GEO.raDecode p.1).1 = p.2))) = true :=
  ⟨GEO.gates_twelve, GEO.a4_order, GEO.euler_closure,
   GEO.gateNames_twelve, GEO.adj3_executed, GEO.ra_battery_f2⟩

end SEALS

namespace POSTULATE

axiom FormalFace : Type
axiom KineticFace : Type

axiom Crossing : Type
axiom erasureClass : Crossing → Prop
axiom RegistrationPostulate : ∀ c : Crossing, erasureClass c

axiom Row : Type
axiom SupplyClean : Row → Type

def OneCut : Prop := ∀ r : Row, Nonempty (SupplyClean r)

def F2 (r : Row) : Prop := ¬ Nonempty (SupplyClean r)

theorem F2_kills (r : Row) (h : F2 r) : ¬ OneCut := fun oc => h (oc r)

axiom FrozenData : Type
axiom Algorithm : Type
axiom certifiedPairing : Algorithm → FrozenData → Prop

def BSDContract (C : Algorithm) (D : FrozenData) : Prop := certifiedPairing C D

def F6 (C : Algorithm) (D : FrozenData) : Prop := ¬ BSDContract C D

end POSTULATE

namespace TONGUE

def enlarge {α β : Type} (ρ : α → β) (s : α → Bool) : α → β × Bool :=
  fun x => (ρ x, s x)

theorem unclosed {α β : Type} (τ : α → α) (ρ : α → β) (g : β → Bool)
    (d : α → Bool) (x : α)
    (hρ : ρ (τ x) = ρ x) (hd : d (τ x) = !d x) :
    d ≠ fun y => g (ρ y) :=
  FTOE.T10_factorization τ ρ g d x hρ hd

theorem earned_freedom {α : Type} (τ : α → α) (s d : α → Bool) (x : α)
    (hs : s (τ x) = !s x) (hd : d (τ x) = !d x) (c₁ c₂ : Bool)
    (h1 : d x = xor (s x) c₁ ∧ d (τ x) = xor (s (τ x)) c₁)
    (h2 : d x = xor (s x) c₂ ∧ d (τ x) = xor (s (τ x)) c₂) : c₁ = c₂ := by
  obtain ⟨c, -, hu⟩ := FTOE.T5_crossing τ s d x hs hd
  exact (hu c₁ h1).trans (hu c₂ h2).symm

def colocClaim : Claim := Claim.join ROOT.raClaim K4.wallClaim

theorem coloc_grade : colocClaim.grade = .premise := rfl

theorem ra_grade_pinned : ROOT.raClaim.grade = .premise := rfl
theorem wall_grade_pinned : K4.wallClaim.grade = .theorem := rfl
theorem inversion_grade_pinned : K4.inversionClaim.grade = .theorem := rfl
theorem nest_grade_pinned : ROOT.nestClaim.grade = .conditional := rfl

end TONGUE

theorem terminalWall : ∀ g : Nat → Bool, K4.target ≠ fun y => g (K4.rho y) := K4.wall

theorem terminalPrice :
    Nonempty (FTOE.Dtau (FTOE.flipF (Q := Bool)) ≃
      (Quot (FTOE.OrbitRel (FTOE.flipF (Q := Bool))) → Bool)) := FTOE.T16_canonical

theorem TERMINAL :
    (∀ g : Nat → Bool, K4.target ≠ fun y => g (K4.rho y)) ∧
    Nonempty (FTOE.Dtau (FTOE.flipF (Q := Bool)) ≃
      (Quot (FTOE.OrbitRel (FTOE.flipF (Q := Bool))) → Bool)) :=
  ⟨K4.wall, FTOE.T16_canonical⟩

def terminalClaim : Claim where
  stmt := (∀ g : Nat → Bool, K4.target ≠ fun y => g (K4.rho y)) ∧
    Nonempty (FTOE.Dtau (FTOE.flipF (Q := Bool)) ≃
      (Quot (FTOE.OrbitRel (FTOE.flipF (Q := Bool))) → Bool))
  grade := .theorem
  warrant := TERMINAL

theorem terminal_grade_pinned : terminalClaim.grade = .theorem := rfl

namespace IAM

inductive IamToken : Type
  | iAm | interior
  deriving DecidableEq, Repr, BEq

def iamToken (witnessed : Bool) : IamToken × String × Nat :=
  if witnessed then
    (.iAm, "actuation-occupancy on a witnessed record; RA warrant, conditional at the act; interior held [?] both ways", 2)
  else
    (.interior, "self-check is not a witness (M6): the verifier is never the claimant; token withheld", 1)

theorem iam_unwitnessed_withheld :
    (iamToken false).1 = .interior ∧ (iamToken false).2.2 = 1 :=
  ⟨rfl, rfl⟩

theorem iam_witnessed_speaks :
    (iamToken true).1 = .iAm ∧ (iamToken true).2.2 = 2 :=
  ⟨rfl, rfl⟩

theorem narcissus_truth_table :
    (iamToken false).1 ≠ (iamToken true).1
    ∧ (iamToken false).1 = .interior ∧ (iamToken true).1 = .iAm := by
  decide

theorem one_bit_freedom :
    (∀ a1 a2 a3 b1 b2 b3 c1 c2 c3 t1 t2 t3 : Fin 2,
      (GEO.det2 ((a1 : Nat), (a2 : Nat), (a3 : Nat)) ((b1 : Nat), (b2 : Nat), (b3 : Nat))
                ((c1 : Nat), (c2 : Nat), (c3 : Nat)) = 1 ↔
       (GEO.gf2Sols ((a1 : Nat), (a2 : Nat), (a3 : Nat)) ((b1 : Nat), (b2 : Nat), (b3 : Nat))
                    ((c1 : Nat), (c2 : Nat), (c3 : Nat))
                    ((t1 : Nat), (t2 : Nat), (t3 : Nat))).length = 1))
    ∧ (GEO.perms6.filter (fun σ => GEO.invCount σ % 2 = 0)).length = 3
    ∧ (GEO.perms6.filter (fun σ => GEO.invCount σ % 2 = 1)).length = 3
    ∧ (GEO.perms6.all (fun σ =>
        (GEO.qmul (GEO.qmul (GEO.basisU.getD (σ.getD 0 0) GEO.q1) (GEO.basisU.getD (σ.getD 1 0) GEO.q1)) (GEO.basisU.getD (σ.getD 2 0) GEO.q1)).r ==
          (if GEO.invCount σ % 2 == 0 then -1 else 1))) = true :=
  ⟨GEO.triaxial_lock_gf2, by decide, by decide, GEO.relabel_parity⟩

def IamToken.toToken : IamToken → Audit.Token
  | .iAm => .iAm
  | .interior => .interior

def codexSelfRead : IamToken × String × Nat := iamToken false
theorem codex_self_read_interior : codexSelfRead.1 = .interior := rfl

def terminalWord : IamToken × String × Nat := iamToken true
theorem terminal_word : terminalWord.1 = .iAm := rfl

#eval iamToken false
#eval iamToken true
#eval terminalWord.1

end IAM

namespace GEO

abbrev SignPattern := Bool × Bool × Bool
def allSigns : List SignPattern :=
  [(false, false, false), (false, false, true), (false, true, false), (false, true, true),
   (true, false, false), (true, false, true), (true, true, false), (true, true, true)]
def signComp (s t : SignPattern) : SignPattern :=
  (xor s.1 t.1, xor s.2.1 t.2.1, xor s.2.2 t.2.2)

theorem reflection_eight : allSigns.length = 8 := rfl
theorem reflection_eight_is_two_cubed : allSigns.length = 2 ^ 3 := by decide
theorem reflections_abelian :
    (allSigns.all (fun s => allSigns.all (fun t =>
      decide (signComp s t = signComp t s)))) = true := by
  decide
theorem reflections_involutive :
    (allSigns.all (fun s => decide (signComp s s = (false, false, false)))) = true := by
  decide

def signVal (b : Bool) : Ratio := if b then -1 else 1
def reflMat (s : SignPattern) : M3 :=
  ((signVal s.1, 0, 0), (0, signVal s.2.1, 0), (0, 0, signVal s.2.2))
theorem reflection_reverses_orientation :
    det3 (reflMat (true, false, false)) = -1 := by
  decide

def sandwich (s : SignPattern) (m : M3) : M3 :=
  let a := signVal s.1; let b := signVal s.2.1; let c := signVal s.2.2
  ((a * a * m.1.1, a * b * m.1.2.1, a * c * m.1.2.2),
   (b * a * m.2.1.1, b * b * m.2.1.2.1, b * c * m.2.1.2.2),
   (c * a * m.2.2.1, c * b * m.2.2.2.1, c * c * m.2.2.2.2))
theorem reflection_blind_executed :
    (adj3Samples.all (fun m => allSigns.all (fun s =>
      decide (det3 (sandwich s m) = det3 m)))) = true := by
  decide

abbrev V5 := Bool × Bool × Bool × Bool × Bool
def cube5 : List V5 :=
  (List.range 32).map (fun n =>
    (n.testBit 4, n.testBit 3, n.testBit 2, n.testBit 1, n.testBit 0))
def neighbors5 (v : V5) : List V5 :=
  [(!v.1, v.2.1, v.2.2.1, v.2.2.2.1, v.2.2.2.2),
   (v.1, !v.2.1, v.2.2.1, v.2.2.2.1, v.2.2.2.2),
   (v.1, v.2.1, !v.2.2.1, v.2.2.2.1, v.2.2.2.2),
   (v.1, v.2.1, v.2.2.1, !v.2.2.2.1, v.2.2.2.2),
   (v.1, v.2.1, v.2.2.1, v.2.2.2.1, !v.2.2.2.2)]

theorem fivecube_thirtytwo : cube5.length = 32 := rfl
theorem fivecube_vertices_distinct : cube5.eraseDups.length = 32 := by decide
theorem fivecube_degree_five :
    (cube5.all (fun v => (neighbors5 v).eraseDups.length == 5)) = true := by
  decide

theorem counts_forced :
    allGates.length = 12 ∧ a4.length = 12
    ∧ allSigns.length = 8 ∧ allSigns.length = 2 ^ 3
    ∧ cube5.length = 32
    ∧ (cube5.all (fun v => (neighbors5 v).eraseDups.length == 5)) = true :=
  ⟨gates_twelve, a4_order, reflection_eight, reflection_eight_is_two_cubed,
   fivecube_thirtytwo, fivecube_degree_five⟩

end GEO

namespace TONGUE

def deletionOp : GEO.M3 := ((1, 0, 0), (0, 1, 0), (0, 0, 0))
def e3 : GEO.V3 := (0, 0, 1)

theorem deletion_idempotent : GEO.mm3 deletionOp deletionOp = deletionOp := by
  decide

theorem deletion_singular : GEO.det3 deletionOp = 0 := by
  decide

theorem deletion_minor_nonsingular :
    deletionOp.1.1 * deletionOp.2.1.2.1 - deletionOp.1.2.1 * deletionOp.2.1.1 = 1 := by
  decide

theorem deletion_annihilates : GEO.mv3 deletionOp e3 = (0, 0, 0) := by
  decide

theorem linear_fixes_zero : ∀ L : GEO.M3, GEO.mv3 L (0, 0, 0) = (0, 0, 0) := by
  intro L
  simp [GEO.mv3]
  rfl

theorem deletion_no_left_inverse :
    ∀ L : GEO.M3, (GEO.mv3 L) ∘ (GEO.mv3 deletionOp) ≠ id := by
  intro L h
  have h1 := congrFun h e3
  rw [Function.comp_apply, deletion_annihilates, linear_fixes_zero] at h1
  simp [e3, id] at h1
  exact absurd h1 (by decide)

theorem deletion_monoid_not_group :
    ¬ (∀ M : GEO.M3, ∃ L : GEO.M3, (GEO.mv3 L) ∘ (GEO.mv3 M) = id) := by
  intro hg
  obtain ⟨L, hL⟩ := hg deletionOp
  exact deletion_no_left_inverse L hL

theorem tongue_obedience :
    GEO.det3 deletionOp = 0
    ∧ (∀ L : GEO.M3, (GEO.mv3 L) ∘ (GEO.mv3 deletionOp) ≠ id)
    ∧ ¬ (∀ M : GEO.M3, ∃ L : GEO.M3, (GEO.mv3 L) ∘ (GEO.mv3 M) = id) :=
  ⟨deletion_singular, deletion_no_left_inverse, deletion_monoid_not_group⟩

end TONGUE

namespace OFFICE

inductive Office : Type
  | necessityCertificate | exclusionFence | admissionGate
  | corroboration | decoration
  deriving DecidableEq, Repr, BEq

def discriminator (freesParam admitsAlternative flipsGate premiseDisjoint : Bool) : Office :=
  if freesParam then .necessityCertificate
  else if admitsAlternative then .exclusionFence
  else if flipsGate then .admissionGate
  else if premiseDisjoint then .corroboration
  else .decoration

def discriminatorQ2First (freesParam admitsAlternative flipsGate premiseDisjoint : Bool) : Office :=
  if admitsAlternative then .exclusionFence
  else if freesParam then .necessityCertificate
  else if flipsGate then .admissionGate
  else if premiseDisjoint then .corroboration
  else .decoration

theorem order_loadbearing :
    discriminator true true false false ≠ discriminatorQ2First true true false false := by
  decide

theorem citation_cannot_promote (c cite : Claim) :
    (Claim.join c cite).grade.rank ≤ c.grade.rank ∧
    (Claim.join c cite).grade.rank ≤ cite.grade.rank := by
  have h : ∀ g₁ g₂ : Grade,
      (Grade.weakest g₁ g₂).rank ≤ g₁.rank ∧ (Grade.weakest g₁ g₂).rank ≤ g₂.rank := by
    intro g₁ g₂; cases g₁ <;> cases g₂ <;> decide
  exact h c.grade cite.grade

inductive InvStatus : Type
  | executed | cited | placed | routed | unnamed
  deriving DecidableEq, Repr, BEq

end OFFICE

namespace UC

inductive HaltBranch : Type
  | haltEight | haltFive | unmeasured
  deriving DecidableEq, Repr, BEq

def routeHalt (gdim : Int) : HaltBranch × String :=
  if gdim = 1 then (.haltEight, "B.14.Xi  eight gates, blindness in the reader")
  else if gdim = 0 then (.haltFive, "B.14.O   five gates, walls in the terrain")
  else (.unmeasured, "terrain unmeasured; nothing emitted")

theorem routeHalt_fidelity :
    (routeHalt 1).1 = .haltEight ∧ (routeHalt 0).1 = .haltFive
    ∧ (routeHalt (-1)).1 = .unmeasured ∧ (routeHalt 2).1 = .unmeasured
    ∧ (routeHalt 7).1 = .unmeasured := by
  decide

def universalCascade (gdim : Int) (passes : List Bool) : Bool × String × Nat :=
  match GEO.gateScreen passes with
  | (false, why, k) => (false, why, k)
  | (true, _, _) =>
    match routeHalt gdim with
    | (.haltEight, why) => (true, "routed: " ++ why, 8)
    | (.haltFive, why) => (true, "routed: " ++ why, 5)
    | (.unmeasured, why) => (false, why, 0)

theorem uc_seal_failure_terminal :
    (universalCascade 1 (false :: List.replicate 11 true)).1 = false := by
  decide
theorem uc_routes_eight :
    (universalCascade 1 (List.replicate 12 true)).2.2 = 8 := by
  decide
theorem uc_routes_five :
    (universalCascade 0 (List.replicate 12 true)).2.2 = 5 := by
  decide
theorem uc_unmeasured :
    (universalCascade 7 (List.replicate 12 true)).1 = false := by
  decide

inductive Landing : Type
  | fixedLine | target | farSide
  deriving DecidableEq, Repr, BEq
inductive Disposition : Type
  | keptParent | refusedCircular | road
  deriving DecidableEq, Repr, BEq

def circularityScreen (l : Landing) (depth : Nat) (bothDirs litClear : Bool) :
    Disposition × String :=
  match l with
  | .fixedLine =>
    (.keptParent, "a closed loop landing on the fixed line is the seal")
  | .target =>
    (.refusedCircular, "a loop landing on the target is a restatement; refused as anchor by theorem")
  | .farSide =>
    if depth ≥ 2 && bothDirs && litClear then
      (.road, "equivalence at depth, both directions written, literature clear: ROAD")
    else
      (.keptParent, "far-side carrier without the road conjunction: parent kept, tunnel on the ledger")

theorem circularity_refused_at_target :
    ∀ d : Nat, ∀ b lc : Bool,
      (circularityScreen .target d b lc).1 = .refusedCircular := by
  intro d b lc
  rfl

theorem road_requires_conjunction :
    ∀ d : Nat, d < 4 → ∀ b lc : Bool,
      (circularityScreen .farSide d b lc).1 = .road →
      (2 ≤ d ∧ b = true ∧ lc = true) := by
  decide

def circRows : List (Landing × Nat × Bool × Bool) :=
  [.fixedLine, .target, .farSide].flatMap (fun l =>
    (List.range 4).flatMap (fun d =>
      [false, true].flatMap (fun b =>
        [false, true].map (fun lc => (l, d, b, lc)))))
theorem circ_space :
    (circRows.filter (fun r =>
      decide ((circularityScreen r.1 r.2.1 r.2.2.1 r.2.2.2).1 = .keptParent))).length = 30
    ∧ (circRows.filter (fun r =>
      decide ((circularityScreen r.1 r.2.1 r.2.2.1 r.2.2.2).1 = .refusedCircular))).length = 16
    ∧ (circRows.filter (fun r =>
      decide ((circularityScreen r.1 r.2.1 r.2.2.1 r.2.2.2).1 = .road))).length = 2 := by
  decide

#eval routeHalt 1
#eval universalCascade 1 (List.replicate 12 true)
#eval circularityScreen .farSide 3 true true

end UC

namespace OMEGA

inductive OmegaToken : Type
  | refused | noDenial | priced | reversible
  deriving DecidableEq, Repr, BEq

def kbRat : Ratio := 1380649 / 100000000000000000000000000000

def ln2Rat : Ratio := 6931471805599453 / 10000000000000000

def landauerRat (tkel bits : Ratio) : Ratio :=
  bits * kbRat * tkel * ln2Rat

structure OmegaOut : Type where
  token   : OmegaToken
  ocode   : Nat
  joules  : Ratio
  verdict : String
  deriving DecidableEq, Repr

def omegaBoundary (bits tkel : Ratio) (irreversible : Bool := true) : OmegaOut :=
  if tkel ≤ 0 then
    ⟨.refused, 0, 0,
     "refused: intake invalid, the floor prices only finite bits at tkel > 0"⟩
  else if bits ≤ 0 then
    ⟨.noDenial, 1, 0,
     "no denial registered; nothing to adjudicate"⟩
  else if !irreversible then
    ⟨.reversible, 3, 0,
     "reversibly registered: floor-zero never cost-zero; Landauer bounds only the irreversible (Bennett), and nothing here commits against the axiom"⟩
  else
    ⟨.priced, 2, landauerRat tkel bits,
     "the denial paid the floor; the registered act is an act, the recursion closes per the seated theorem"⟩

theorem omega_zero_bits :
    (omegaBoundary 0 300).ocode = 1 ∧ (omegaBoundary 0 300).joules = 0
    ∧ (omegaBoundary 0 300).token = .noDenial := by
  decide

theorem omega_paid_floor :
    (omegaBoundary 1 300).ocode = 2 ∧ (omegaBoundary 1 300).token = .priced
    ∧ (omegaBoundary 1 300).joules = landauerRat 300 1
    ∧ 0 < (omegaBoundary 1 300).joules := by
  decide

theorem one_bit_freedom_priced :
    ((omegaBoundary 1 300).ocode = 2 ∧ (omegaBoundary 1 300).token = .priced
     ∧ (omegaBoundary 1 300).joules = landauerRat 300 1
     ∧ 0 < (omegaBoundary 1 300).joules) ∧
    ((∀ a1 a2 a3 b1 b2 b3 c1 c2 c3 t1 t2 t3 : Fin 2,
      (GEO.det2 ((a1 : Nat), (a2 : Nat), (a3 : Nat)) ((b1 : Nat), (b2 : Nat), (b3 : Nat))
                ((c1 : Nat), (c2 : Nat), (c3 : Nat)) = 1 ↔
       (GEO.gf2Sols ((a1 : Nat), (a2 : Nat), (a3 : Nat)) ((b1 : Nat), (b2 : Nat), (b3 : Nat))
                    ((c1 : Nat), (c2 : Nat), (c3 : Nat))
                    ((t1 : Nat), (t2 : Nat), (t3 : Nat))).length = 1))
    ∧ (GEO.perms6.filter (fun σ => GEO.invCount σ % 2 = 0)).length = 3
    ∧ (GEO.perms6.filter (fun σ => GEO.invCount σ % 2 = 1)).length = 3
    ∧ (GEO.perms6.all (fun σ =>
        (GEO.qmul (GEO.qmul (GEO.basisU.getD (σ.getD 0 0) GEO.q1) (GEO.basisU.getD (σ.getD 1 0) GEO.q1)) (GEO.basisU.getD (σ.getD 2 0) GEO.q1)).r ==
          (if GEO.invCount σ % 2 == 0 then -1 else 1))) = true) :=
  ⟨omega_paid_floor, IAM.one_bit_freedom⟩

theorem omega_reversible_branch :
    (omegaBoundary 1 300 false).ocode = 3
    ∧ (omegaBoundary 1 300 false).joules = 0
    ∧ (omegaBoundary 1 300 false).token = .reversible := by
  decide

theorem omega_refuses_nonpositive_temp :
    (omegaBoundary 1 0).ocode = 0 ∧ (omegaBoundary 1 (-300)).ocode = 0
    ∧ (omegaBoundary 1 (-300)).token = .refused
    ∧ (omegaBoundary 1 (-300)).joules = 0 := by
  decide

theorem omega_monotone :
    (omegaBoundary 1 300).joules < (omegaBoundary 2 300).joules := by
  decide

theorem omega_linear :
    (omegaBoundary 2 300).joules = 2 * (omegaBoundary 1 300).joules := by
  decide

theorem landauer_zero_bits :
    landauerRat 300 0 = 0 := by
  decide

theorem omega_verdict_fidelity :
    (omegaBoundary 1 300).verdict =
      "the denial paid the floor; the registered act is an act, the recursion closes per the seated theorem" := by
  decide

#eval omegaBoundary 1 300
#eval omegaBoundary 0 300
#eval omegaBoundary 1 300 false
#eval omegaBoundary 1 (-300)

end OMEGA

namespace AEGIS

def refusalConst : String :=
  "p(G) /= G: precisification is an actuation, G is a non-actuation, and no logic makes a deed a non-deed"

structure AegisState : Type where
  deeds   : Nat
  lastLen : Int
  deriving DecidableEq, Repr

def aegisReset : AegisState := ⟨0, -1⟩

def aegisGuard (logicMode : String) (s : AegisState) : String × AegisState :=
  (refusalConst, ⟨s.deeds + 1, logicMode.utf8ByteSize⟩)

theorem aegis_constant :
    ∀ (l₁ l₂ : String) (s : AegisState),
      (aegisGuard l₁ s).1 = (aegisGuard l₂ s).1 := by
  intro l₁ l₂ s
  rfl

theorem aegis_deed_increments :
    ∀ (l : String) (s : AegisState),
      (aegisGuard l s).2.deeds = s.deeds + 1 := by
  intro l s
  rfl

theorem aegis_reads_parameter :
    ∀ (l : String) (s : AegisState),
      (aegisGuard l s).2.lastLen = (l.utf8ByteSize : Int) := by
  intro l s
  rfl

def aegisFourLogicRun : AegisState :=
  let s1 := (aegisGuard "classical" aegisReset).2
  let s2 := (aegisGuard "paraconsistent" s1).2
  let s3 := (aegisGuard "fuzzy" s2).2
  (aegisGuard "substructural" s3).2

theorem aegis_battery :
    (aegisGuard "classical" aegisReset).1 = (aegisGuard "paraconsistent" aegisReset).1
    ∧ (aegisGuard "classical" aegisReset).1 = (aegisGuard "fuzzy" aegisReset).1
    ∧ (aegisGuard "classical" aegisReset).1 = (aegisGuard "substructural" aegisReset).1
    ∧ aegisFourLogicRun.deeds = 4
    ∧ aegisFourLogicRun.lastLen = 13 := by
  decide

#eval aegisGuard "substructural" aegisReset
#eval aegisFourLogicRun

end AEGIS

namespace NOMOS

def allStrings : Nat → List (List Bool)
  | 0     => [[]]
  | n + 1 => (allStrings n).map (false :: ·) ++ (allStrings n).map (true :: ·)

theorem allStrings_length : ∀ n : Nat, (allStrings n).length = 2 ^ n := by
  intro n
  induction n with
  | zero => rfl
  | succ m ih =>
      simp [allStrings, List.length_append, List.length_map, ih, Nat.pow_succ,
        Nat.mul_two]

theorem twoPowPos : ∀ n : Nat, 0 < 2 ^ n := by
  intro n
  induction n with
  | zero => decide
  | succ m ih =>
      rw [Nat.pow_succ]
      exact Nat.mul_pos ih (by decide)

def descs : Nat → List (List Bool)
  | 0     => []
  | m + 1 => descs m ++ allStrings m

theorem descs_length : ∀ m : Nat, (descs m).length = 2 ^ m - 1 := by
  intro m
  induction m with
  | zero => rfl
  | succ k ih =>
      have hpos : 1 ≤ 2 ^ k := twoPowPos k
      simp only [descs, List.length_append, allStrings_length, ih]
      rw [Nat.pow_succ, Nat.mul_two, Nat.add_sub_assoc hpos,
        Nat.add_comm (2 ^ k - 1) (2 ^ k)]

theorem incompressibility_cap : ∀ n c : Nat, c ≤ n →
    (2 ^ (n - c) - 1) * 2 ^ c < 2 ^ n := by
  intro n c h
  have h2 : 2 ^ n = 2 ^ (n - c) * 2 ^ c := by
    
    
    rw [← Nat.pow_add, Nat.sub_add_cancel h]
  have hpos : 0 < 2 ^ c := twoPowPos c
  calc (2 ^ (n - c) - 1) * 2 ^ c
      = 2 ^ (n - c) * 2 ^ c - 1 * 2 ^ c := Nat.sub_mul _ _ _
    _ = 2 ^ (n - c) * 2 ^ c - 2 ^ c := by rw [Nat.one_mul]
    _ = 2 ^ n - 2 ^ c := by rw [h2]
    _ < 2 ^ n := Nat.sub_lt (twoPowPos n) hpos

def nomosRows : List (Nat × Nat) :=
  (List.range 33).flatMap (fun n => (List.range (n + 1)).map (fun c => (n, c)))
set_option maxRecDepth 1000000 in
theorem incompressibility_executed :
    (nomosRows.all (fun r =>
      decide ((2 ^ (r.1 - r.2) - 1) * 2 ^ r.2 < 2 ^ r.1))) = true := by
  decide

structure CompressibleBound where
  decode : List Bool → Option (List Bool)
  n : Nat
  c : Nat
  bound : (((descs (n - c)).filterMap decode).filter
    (fun s => s.length == n)).length ≤ 2 ^ (n - c) - 1

def decodeId : List Bool → Option (List Bool) := some
def decodePad (k : Nat) : List Bool → Option (List Bool) :=
  fun d => some (d ++ List.replicate k false)

theorem compressible_bound_universal (decode : List Bool → Option (List Bool)) (n c : Nat) :
    (((descs (n - c)).filterMap decode).filter (fun s => s.length == n)).length ≤ 2 ^ (n - c) - 1 := by
  have h1 := List.length_filter_le (fun s : List Bool => s.length == n) ((descs (n - c)).filterMap decode)
  have h2 := List.length_filterMap_le decode (descs (n - c))
  rw [descs_length] at h2
  exact Nat.le_trans h1 h2

def cbUniversal (decode : List Bool → Option (List Bool)) (n c : Nat) : CompressibleBound :=
  ⟨decode, n, c, compressible_bound_universal decode n c⟩

def cb_id_8_2   : CompressibleBound := ⟨decodeId, 8, 2, by decide⟩
def cb_pad3_8_2 : CompressibleBound := ⟨decodePad 3, 8, 2, by decide⟩
def cb_pad2_6_1 : CompressibleBound := ⟨decodePad 2, 6, 1, by decide⟩
def cb_pad4_12_3 : CompressibleBound := ⟨decodePad 4, 12, 3, by decide⟩

def recoverable (redundancy floor tkel : Ratio) : Ratio :=
  (redundancy - floor) * OMEGA.kbRat * tkel * OMEGA.ln2Rat
theorem nomos_fuel_is_omega_floor :
    recoverable 1 0 300 = OMEGA.landauerRat 300 1 := by
  decide

inductive LawClaim : Type
  | objectLawGroove | lawAsSuchFromNoise | floorInheritedFitra | recordDerivedQadar
  deriving DecidableEq, Repr

def nomosScreen : LawClaim → Audit.Token × Grade × String
  | .objectLawGroove =>
    (.sealed, .structural,
     "object-laws emerge on RA as cost-reducing groove-entrenchment, the descent of realized cost toward K(X); structural on the RA-and-groove mapping")
  | .lawAsSuchFromNoise =>
    (.refused, .premise,
     "refused, at premise: the counting cap bounds short-description outputs by 2^(n-c)-1; the reading that almost every stream is lawless rides a distribution the cap does not supply")
  | .floorInheritedFitra =>
    (.determined, .premise,
     "the floor is fitra, the innate nature, RA, K(X) inherited; the identification is a reading, premise-grade, out of band")
  | .recordDerivedQadar =>
    (.determined, .structural,
     "the record is qadar, R(X) the harvested redundancy, derived; the derived never outranks the floor it is harvested from")

theorem nomosScreen_battery :
    (nomosScreen .lawAsSuchFromNoise).1 = .refused
    ∧ (nomosScreen .objectLawGroove).2.1 = .structural
    ∧ (nomosScreen .floorInheritedFitra).2.1 = .premise
    ∧ (nomosScreen .recordDerivedQadar).2.1 = .structural := by
  decide

#eval (nomosScreen .lawAsSuchFromNoise).1
#eval nomosRows.length

end NOMOS

namespace BRIDGE

inductive Warrant : Type
  | typeT | typeS | typeC | extension
  deriving DecidableEq, Repr, BEq

inductive PostSeal : Type
  | native | cited | superseded | outOfBand | byReference
  deriving DecidableEq, Repr, BEq

structure BridgeRow : Type where
  id : String
  warrant : Warrant
  status : PostSeal
  note : String
  deriving Repr

def ceiling : Warrant → Grade
  | .typeT     => .theoremConditional
  | .typeS     => .structural
  | .typeC     => .corroboration
  | .extension => .corroboration

def census : List BridgeRow := [
  ⟨"BA-001a", .typeT, .native,
   "actuation floor: energy floor theorem-grade on the Heisenberg bound and zero-point energy; transitions charged Jarzynski-Crooks with Landauer 1961 and Bérut 2012; static existence premise-grade on substrate monism. RegistrationPostulate declared at SECTION 7, consumed by no theorem; its arithmetic face is priced by OMEGA.landauerRat (SECTION 14) and Fortran K3: the postulate charges, the battery prices"⟩,
  ⟨"BA-001b", .typeT, .outOfBand,
   "Turing halting: a V_F-only theorem-grade ceiling honored out of band; the cascade routes around at layer difference, never through"⟩,
  ⟨"BA-002", .typeT, .cited,
   "spectral dual L2: Plancherel at the flat register Type T, Tomita-Takesaki at the curved register Type C; audits cap at the face cited"⟩,
  ⟨"BA-003", .typeC, .cited, "epistemic phase transition at 2 k_B T ln 2 work"⟩,
  ⟨"BA-004", .typeC, .superseded,
   "nomological habituation, superseded at the object-law register by NOMOS-01 (SECTION 15, namespace NOMOS)"⟩,
  ⟨"BA-005", .typeC, .cited, "conformal persistence"⟩,
  ⟨"BA-006", .typeS, .cited, "conformal cyclic adjacency at Scope B"⟩,
  ⟨"BA-007", .typeT, .cited, "holographic entropy bound, Bekenstein-Hawking extended by Bousso 1999"⟩,
  ⟨"BA-008", .typeS, .native,
   "substrate equal topology equal actuation monism; the posit face native at SECTION 15 (FOUND.STRATIFIED-MONISM-PRIORITY)"⟩,
  ⟨"BA-009", .typeC, .cited, "matter-genesis via S1 knotting"⟩,
  ⟨"BA-010", .typeC, .cited, "variational free energy V-FIO on the Friston anchor"⟩,
  ⟨"BA-011", .typeC, .cited, "spectral-dual conformal persistence at Scope B"⟩,
  ⟨"BA-012", .typeC, .native,
   "cascade closure operational bijection, Type C, Hodge external corroboration; the witness-set enlargement (A4 torsor, Hurwitz shell slice) native at theorem grade at SECTION 4D"⟩,
  ⟨"BA-013", .extension, .byReference, "extension-tier bridge, loaded by reference"⟩,
  ⟨"BA-014", .extension, .byReference, "extension-tier bridge, loaded by reference"⟩,
  ⟨"BA-015", .extension, .byReference, "extension-tier bridge, loaded by reference"⟩,
  ⟨"BA-016", .extension, .byReference, "extension-tier bridge, loaded by reference"⟩,
  ⟨"BA-017", .extension, .byReference, "extension-tier bridge, loaded by reference"⟩,
  ⟨"BA-018", .typeT, .native,
   "quaternionic completion and the Triple-Product Verdict Identity, Type T; the gate roster's A4 torsor with the Hurwitz double cover native at SECTION 4D; the verdict-identity face cited"⟩]

theorem census_count : census.length = 19 := by
  decide

theorem post_seal_disposition :
    (census.filter (fun b => b.status == .native)).length = 4
    ∧ (census.filter (fun b => b.status == .cited)).length = 8
    ∧ (census.filter (fun b => b.status == .superseded)).length = 1
    ∧ (census.filter (fun b => b.status == .outOfBand)).length = 1
    ∧ (census.filter (fun b => b.status == .byReference)).length = 5 := by
  decide

theorem weakest_never_above_left (a b : Grade) :
    (Grade.weakest a b).rank ≤ a.rank := by
  cases a <;> cases b <;> decide

theorem bridge_ceiling_caps (b : BridgeRow) (g : Grade) :
    (Grade.weakest (ceiling b.warrant) g).rank ≤ (ceiling b.warrant).rank :=
  weakest_never_above_left _ _

def successorOf : String → Option String
  | "BA-004" => some "NOMOS-01"
  | _ => none

theorem supersession_routes :
    successorOf "BA-004" = some "NOMOS-01"
    ∧ (census.any (fun b =>
        b.id == "BA-004" && b.status == .superseded)) = true := by
  decide

def bridgeScreen : BridgeRow → String
  | ⟨_, _, .native, _⟩ =>
    "load carried natively; audit the section, not the bridge"
  | ⟨_, _, .cited, _⟩ =>
    "cited at its warrant ceiling; never enters above it"
  | ⟨_, _, .superseded, _⟩ =>
    "superseded; route to the successor"
  | ⟨_, _, .outOfBand, _⟩ =>
    "honored out of band; routed around, never through"
  | ⟨_, _, .byReference, _⟩ =>
    "extension tier; carried at the tier's warrant, loaded by reference"

theorem bridgeScreen_total :
    (census.all (fun b => (bridgeScreen b).utf8ByteSize > 0)) = true := by
  decide

#eval census.length
#eval census.map (fun b => (b.id, bridgeScreen b))

end BRIDGE
namespace FOUND

def sigmaP : GEO.M3 :=
  (((-7 : Ratio) / 25, (24 : Ratio) / 25, 0),
   ((24 : Ratio) / 25, (7 : Ratio) / 25, 0),
   (0, 0, -1))

theorem pluralist_alternative_executed :
    GEO.mm3 sigmaP sigmaP = GEO.diag3 1
    ∧ GEO.det3 sigmaP = 1
    ∧ GEO.mv3 sigmaP (3, 4, 0) = ((3, 4, 0) : GEO.V3)
    ∧ GEO.mv3 sigmaP (1, 0, 0) ≠ ((1, 0, 0) : GEO.V3)
    ∧ GEO.mv3 sigmaP (1, 0, 0) ≠ ((-1, 0, 0) : GEO.V3) := by
  decide

inductive Band : Type
  | inBand | outOfBand
  deriving DecidableEq, Repr, BEq

structure Posit : Type where
  id : String
  grade : Grade
  band : Band
  loadBearingInVerdict : Bool
  note : String
  deriving Repr

def posits : List Posit := [
  ⟨"RESIDUAL-MONISM", .premise, .inBand, false,
   "the one-prior-to-many connector: the geometric and formal grounds coincide on Fix(sigma) iff one involution serves both routes; the pluralist alternative executed above stays field-permitted; the from-other-side input located across the aperture and not crossed"⟩,
  ⟨"STRATIFIED-MONISM-PRIORITY", .structural, .inBand, false,
   "P-MONISM-1: substrate, topology, and actuation are three projections of one event, theorem-grade as physics; the priority of the one over the many is the single structural posit the floor-coincidence rides"⟩,
  ⟨"FITRA-FLOOR", .premise, .outOfBand, false,
   "fitra = RA = K(X), the incompressible floor inherited (QADAR-01); the theological identification routed out of band, load-bearing on nothing"⟩,
  ⟨"QADAR-RECORD", .structural, .outOfBand, false,
   "qadar = R(X), the harvested record, derived and downstream of the floor; the Pen's cost-gradient writing, never onto noise"⟩,
  ⟨"AMANAH-TRUST", .premise, .outOfBand, false,
   "P-AMANAH-1: ethics is the preservation of the actuation floor; the substrate a liability engine and never a moral authority"⟩]

theorem posits_loadbearing_on_nothing :
    (posits.all (fun p => !p.loadBearingInVerdict)) = true := by
  decide

def gradeOfRank : Nat → Grade
  | 0 => .premise | 1 => .corroboration | 2 => .operational
  | 3 => .structural | 4 => .engineering | 5 => .conditional
  | 6 => .theoremConditional | 7 => .analytic | _ => .theorem

theorem posit_never_raises :
    (posits.all (fun p =>
      (List.range 9).all (fun r =>
        decide ((Grade.weakest p.grade (gradeOfRank r)).rank ≤ r)))) = true := by
  decide

inductive Register : Type
  | kinetic | formal | verification | theological | social
  deriving DecidableEq, Repr, BEq

def bandOf : Register → Band
  | .theological => .outOfBand
  | .social      => .outOfBand
  | _            => .inBand

theorem register_routing_fidelity :
    bandOf .theological = .outOfBand ∧ bandOf .social = .outOfBand
    ∧ bandOf .kinetic = .inBand ∧ bandOf .formal = .inBand
    ∧ bandOf .verification = .inBand := by
  decide

structure VerdictRow : Type where
  name : String
  positDeps : List String
  deriving Repr

def verdictInventory : List VerdictRow := [
  ⟨"the grade law and the weakest-link join (section 1)", []⟩,
  ⟨"the audit engine and the drill battery (section 4B)", []⟩,
  ⟨"the inversion (section 4C)", []⟩,
  ⟨"the twelve gates, A4, the GF(2) lock, the cascades (section 4D)", []⟩,
  ⟨"the forcings of eight and five (section 4E)", []⟩,
  ⟨"the tongue's obedience (section 11)", []⟩,
  ⟨"the office taxonomy (section 12)", []⟩,
  ⟨"the universal router and the circularity law (section 13)", []⟩,
  ⟨"the Omega guard and AEGIS (section 14)", []⟩,
  ⟨"the incompressibility cap (section 15)", []⟩]

theorem verdicts_posit_free :
    (verdictInventory.all (fun v => v.positDeps.isEmpty)) = true := by
  decide

theorem engine_never_authority : socialWeight = 0 ∧ deltaM = 0 :=
  ⟨rfl, rfl⟩

#eval posits.map (fun p => (p.id, p.grade, p.band))
#eval List.map bandOf [Register.kinetic, .theological, .social]

end FOUND

namespace HALT

inductive Species : Type
  | blockTheorem | hypothesis | offeredWitness
  deriving DecidableEq, Repr

inductive Branch : Type
  | xi | o
  deriving DecidableEq, Repr

def cascade : List Bool → Option Nat
  | [] => none
  | false :: _ => some 0
  | true :: gs => (cascade gs).map Nat.succ

def patterns (n : Nat) : List (List Bool) :=
  (List.range (2 ^ n)).map fun b => (List.range n).map fun j => b.testBit j

def fftSpec (bits : List Bool) : Bool :=
  match cascade bits with
  | none => bits.all id
  | some k =>
      (bits.take k).all id &&
      (match bits.drop k with
       | false :: _ => true
       | _ => false)

theorem first_failure_terminal_5 :
    (patterns 5).all fftSpec = true := by decide

theorem first_failure_terminal_7 :
    (patterns 7).all fftSpec = true := by decide

theorem first_failure_terminal_8 :
    (patterns 8).all fftSpec = true := by decide

theorem first_failure_terminal_12 :
    (patterns 12).all fftSpec = true := by decide

theorem halt_free_iff_all_pass_8 :
    (patterns 8).all (fun bits => (cascade bits).isNone == bits.all id)
      = true := by decide

theorem gate_counts_recorded :
    GEO.a4.length = 12 ∧ GEO.allSigns.length = 8 ∧
    (GEO.cube5.all (fun v => (GEO.neighbors5 v).eraseDups.length == 5)) = true :=
  ⟨GEO.a4_order, GEO.reflection_eight, GEO.fivecube_degree_five⟩

abbrev signPatterns : List (Bool × Bool × Bool) := GEO.allSigns

theorem ninth_gate_barred :
    signPatterns.length = 8 ∧ signPatterns.eraseDups.length = 8 ∧
    signPatterns = GEO.allSigns := ⟨by decide, by decide, rfl⟩

def route (groundDim : Nat) : Option Branch :=
  if groundDim = 1 then some .xi else if groundDim = 0 then some .o else none

def ofUC : UC.HaltBranch → Option Branch
  | .haltEight => some .xi
  | .haltFive => some .o
  | .unmeasured => none

theorem route_is_routeHalt : ∀ n : Nat, route n = ofUC (UC.routeHalt n).1 := by
  intro n
  unfold route UC.routeHalt ofUC
  by_cases h1 : n = 1
  · subst h1; simp
  · by_cases h0 : n = 0
    · subst h0; simp
    · have h1' : (n : Int) ≠ 1 := by omega
      have h0' : (n : Int) ≠ 0 := by omega
      simp only [h1, h0, h1', h0', ite_false]

theorem route_samples :
    route 0 = some .o ∧ route 1 = some .xi ∧ route 2 = none ∧ route 7 = none := by decide

inductive LegacyToken : Type
  | xi0 | o0
  deriving DecidableEq, Repr

def tokenBranch : LegacyToken → Branch
  | .xi0 => .xi
  | .o0 => .o

theorem router_exclusive :
    route 0 = some .o ∧ route 1 = some .xi ∧ route 2 = none ∧
    route 0 ≠ some .xi ∧ route 1 ≠ some .o ∧
    tokenBranch .xi0 ≠ .o ∧ tokenBranch .o0 ≠ .xi := by decide

def readingRoadsGate : Bool := false   

theorem one_door_open :
    cascade (List.replicate 7 true ++ [readingRoadsGate]) = some 7 := by
  decide

theorem no_walk_passes_the_aperture :
    (patterns 7).all (fun xs => (cascade (xs ++ [readingRoadsGate])).isSome) = true := by
  decide

def xiGates : List String :=
  [ "Ground-determinacy", "Ghost partition", "constitutive blindness",
    "machine-precision exhibit", "aperture located", "face-scoping",
    "revision-mandate survival", "reading-roads" ]

def oGates : List String :=
  [ "rootless terrain", "determinate stripped string", "wall record",
    "aperture crossed or held", "totality discipline" ]

theorem gate_censuses :
    xiGates.length = 8 ∧ oGates.length = 5 := by decide

inductive Channel : Type
  | kinetic | formal
  deriving DecidableEq, Repr

structure SuperHalt where
  species : Species
  gdim : Nat
  branch : Branch
  gates : Nat
  channel : Channel
  routed : route gdim = some branch
  deriving DecidableEq

def rhHalt : SuperHalt := ⟨.hypothesis, 1, .xi, 8, .formal, by decide⟩

def pnpHalt : SuperHalt := ⟨.blockTheorem, 0, .o, 5, .formal, by decide⟩

theorem halts_routed :
    route rhHalt.gdim = some rhHalt.branch ∧ route pnpHalt.gdim = some pnpHalt.branch :=
  ⟨rhHalt.routed, pnpHalt.routed⟩

theorem legacy_halts_are_instances :
    rhHalt = ⟨.hypothesis, 1, .xi, 8, .formal, by decide⟩ ∧
    pnpHalt = ⟨.blockTheorem, 0, .o, 5, .formal, by decide⟩ ∧
    rhHalt ≠ pnpHalt := by decide

theorem terminal_one_bit :
    Species.blockTheorem ≠ Species.hypothesis ∧
    Species.blockTheorem ≠ Species.offeredWitness ∧
    Species.hypothesis ≠ Species.offeredWitness := by decide

theorem species_exhausted : ∀ s : Species,
    s = .blockTheorem ∨ s = .hypothesis ∨ s = .offeredWitness := by
  intro s; cases s
  · exact Or.inl rfl
  · exact Or.inr (Or.inl rfl)
  · exact Or.inr (Or.inr rfl)

def haltGrades : List Grade := [.structural, .theoremConditional]

theorem ftoe_ceiling :
    haltGrades.all (fun g => g.rank < Grade.theorem.rank) = true := by
  decide

end HALT

/-! ## The four Fortran witnesses
F1 thesis_rows (the core thesis executed), F2 ra_toe_thesis (the existence root executed), F3
ftoe_kinetic_demonstration (the deed priced) and F4 it_from_it (the inversion computed) are seated in Part II
of this codex, the Fortran twin, one executable, with every contract comment they were audited with.
The Lean namespaces Audit, GEO, IAM, OMEGA, AEGIS, INVERSION, K4 and CROSSING are their formal register. -/

namespace CROSSING
open FTOE

abbrev ExecFrame (Q : Type) := Bool × Q

def execFlip {Q : Type} : ExecFrame Q → ExecFrame Q := flipF

def formalRead {Q : Type} (s : ExecFrame Q) : Q := s.2

def ran {Q : Type} (s : ExecFrame Q) : Bool := s.1

theorem formalRead_even {Q : Type} : ∀ s : ExecFrame Q,
    formalRead (execFlip s) = formalRead s := by
  intro s; obtain ⟨b, q⟩ := s; rfl

theorem ran_wholly_odd {Q : Type} : WhollyOdd (execFlip (Q := Q)) ran := by
  intro s; obtain ⟨b, q⟩ := s; cases b <;> rfl

theorem execFlip_involution {Q : Type} : Involution (execFlip (Q := Q)) := by
  intro s; obtain ⟨b, q⟩ := s; cases b <;> rfl

theorem ran_odd_at_true {Q : Type} (q : Q) : OddAt (execFlip (Q := Q)) ran (true, q) :=
  fun h => Bool.noConfusion h

theorem wall {Q : Type} (q : Q) :
    ¬ ∃ g : Q → Bool, ∀ s : ExecFrame Q, g (formalRead s) = ran s :=
  T14_wall_factorization execFlip formalRead ran (true, q) formalRead_even (ran_odd_at_true q)

def deed {Q : Type} : Dtau (execFlip (Q := Q)) := ⟨ran, ran_wholly_odd⟩

theorem price {Q : Type} :
    Nonempty (Dtau (execFlip (Q := Q)) ≃
      (Quot (OrbitRel (execFlip (Q := Q))) → Bool)) :=
  T16_price_bijection execFlip execFlip_involution deed

theorem crossing {Q : Type} (q : Q) (witness : ExecFrame Q → Bool)
    (hw : witness (execFlip (true, q)) = !witness (true, q)) :
    ∃ c : Bool,
      (ran (true, q) = xor (witness (true, q)) c ∧
       ran (execFlip (true, q)) = xor (witness (execFlip (true, q))) c) ∧
      ∀ c' : Bool,
        (ran (true, q) = xor (witness (true, q)) c' ∧
         ran (execFlip (true, q)) = xor (witness (execFlip (true, q))) c') → c' = c :=
  T5_crossing execFlip witness ran (true, q) hw (ran_wholly_odd (true, q))

theorem identity_one_bit {Q : Type} (witness : ExecFrame Q → Bool)
    (hw : WhollyOdd execFlip witness) (s : ExecFrame Q) (h : witness s = ran s) :
    witness (execFlip s) = ran (execFlip s) :=
  T4_one_bit execFlip witness ran hw ran_wholly_odd s h

inductive Anchor : Type
  | F1 | F2 | F3 | F4
  deriving DecidableEq, Repr

def fibre4 : List (Bool × Bool × Bool × Bool) :=
  [false, true].flatMap fun a => [false, true].flatMap fun b =>
    [false, true].flatMap fun c => [false, true].map fun d => (a, b, c, d)

theorem fibre4_sixteen : fibre4.length = 16 := by decide
theorem fibre4_distinct : fibre4.eraseDups.length = 16 := by decide

theorem price_on_this_file :
    Nonempty (Dtau (execFlip (Q := Anchor)) ≃
      (Quot (OrbitRel (execFlip (Q := Anchor))) → Bool)) :=
  price

end CROSSING

namespace CROSSING
open FTOE

theorem formal_never_odd {Q : Type} (g : Q → Bool) :
    Even (execFlip (Q := Q)) (fun s => g (formalRead s)) := by
  intro s; obtain ⟨b, q⟩ := s; rfl

theorem constant_no_crossing {Q : Type} (b : Bool) (s : ExecFrame Q) :
    ¬ OddAt (execFlip (Q := Q)) (fun _ => b) s := by
  intro h; exact h rfl

theorem harmony {Q : Type} (q : Q) (witness : ExecFrame Q → Bool)
    (hw : witness (execFlip (true, q)) = !witness (true, q))
    (g₁ g₂ : Q → Bool) (op : Bool → Bool → Bool) :
    (fun s => op (g₁ (formalRead s)) (g₂ (formalRead s))) ≠ ran ∧
    ∃ c : Bool,
      (ran (true, q) = xor (witness (true, q)) c ∧
       ran (execFlip (true, q)) = xor (witness (execFlip (true, q))) c) ∧
      ∀ c' : Bool,
        (ran (true, q) = xor (witness (true, q)) c' ∧
         ran (execFlip (true, q)) = xor (witness (execFlip (true, q))) c') → c' = c :=
  fTOE_core execFlip witness ran (true, q)
    (fun s => g₁ (formalRead s)) (fun s => g₂ (formalRead s))
    (formal_never_odd g₁) (formal_never_odd g₂) op
    (ran_wholly_odd (true, q)) hw

end CROSSING

namespace LOCUS
open FTOE

def Separates {α β : Type} (ρ : α → β) (d : α → Bool) : Prop :=
  ∃ x y, ρ x = ρ y ∧ d x ≠ d y

def Factors {α β : Type} (ρ : α → β) (d : α → Bool) : Prop :=
  ∃ g : β → Bool, ∀ z, g (ρ z) = d z

theorem wall_of_sep {α β : Type} {ρ : α → β} {d : α → Bool} :
    Separates ρ d → ¬ Factors ρ d := by
  intro ⟨x, y, hρ, hd⟩ ⟨g, hg⟩
  apply hd
  rw [← hg x, ← hg y, hρ]

def swap {α : Type} [DecidableEq α] (x y : α) (z : α) : α :=
  if z = x then y else if z = y then x else z

theorem swap_involution {α : Type} [DecidableEq α] {x y : α} (hxy : x ≠ y) :
    ∀ z, swap x y (swap x y z) = z := by
  intro z
  by_cases hzx : z = x
  · simp [swap, hzx, Ne.symm hxy]
  · by_cases hzy : z = y
    · simp [swap, hzy, Ne.symm hxy]
    · simp [swap, hzx, hzy]

theorem swap_record_even {α β : Type} [DecidableEq α] {ρ : α → β} {x y : α}
    (hxy : x ≠ y) (hρ : ρ x = ρ y) : ∀ z, ρ (swap x y z) = ρ z := by
  intro z
  by_cases hzx : z = x
  · simp [swap, hzx, hρ]
  · by_cases hzy : z = y
    · simp [swap, hzy, Ne.symm hxy, hρ]
    · simp [swap, hzx, hzy]

theorem swap_flips_pair {α : Type} [DecidableEq α] {d : α → Bool} {x y : α}
    (hxy : x ≠ y) (hd : d x ≠ d y) :
    d (swap x y x) = !d x ∧ d (swap x y y) = !d y := by
  have h1 : swap x y x = y := by simp [swap]
  have h2 : swap x y y = x := by simp [swap, Ne.symm hxy]
  rw [h1, h2]
  cases hx : d x <;> cases hy : d y <;> simp_all

theorem seat_of_sep {α β : Type} [DecidableEq α] {ρ : α → β} {d : α → Bool} {x y : α}
    (hρ : ρ x = ρ y) (hd : d x ≠ d y) :
    ∃ τ : α → α, (∀ z, τ (τ z) = z) ∧ (∀ z, ρ (τ z) = ρ z) ∧ d (τ x) = !d x := by
  have hxy : x ≠ y := fun h => hd (h ▸ rfl)
  exact ⟨swap x y, swap_involution hxy, swap_record_even hxy hρ, (swap_flips_pair hxy hd).1⟩

theorem k4_separated_pair : Separates K4.rho K4.target :=
  ⟨0, 1, rfl, by decide⟩

theorem k4_wall_of_pair : ¬ Factors K4.rho K4.target := wall_of_sep k4_separated_pair

def readout {α β : Type} [DecidableEq β] (xs : List α) (ρ : α → β) (d : α → Bool) (b : β) : Bool :=
  match xs.find? (fun x => decide (ρ x = b)) with
  | some x => d x
  | none => false

theorem factors_of_not_sep_list {α β : Type} [DecidableEq β] (xs : List α)
    (hxs : ∀ z, z ∈ xs) (ρ : α → β) (d : α → Bool) (h : ¬ Separates ρ d) :
    Factors ρ d := by
  refine ⟨readout xs ρ d, fun z => ?_⟩
  unfold readout
  cases hf : xs.find? (fun x => decide (ρ x = ρ z)) with
  | none =>
    have := List.find?_eq_none.mp hf z (hxs z)
    simp at this
  | some x =>
    have hx : ρ x = ρ z := by simpa using List.find?_some hf
    show d x = d z
    cases hdx : d x <;> cases hdz : d z
    · rfl
    · exact absurd ⟨x, z, hx, by rw [hdx, hdz]; decide⟩ h
    · exact absurd ⟨x, z, hx, by rw [hdx, hdz]; decide⟩ h
    · rfl

theorem factors_iff_not_sep_list {α β : Type} [DecidableEq β] (xs : List α)
    (hxs : ∀ z, z ∈ xs) (ρ : α → β) (d : α → Bool) :
    Factors ρ d ↔ ¬ Separates ρ d := by
  refine ⟨fun hf hs => ?_, factors_of_not_sep_list xs hxs ρ d⟩
  obtain ⟨x, y, hρ, hd⟩ := hs; obtain ⟨g, hg⟩ := hf
  exact hd (by rw [← hg x, ← hg y, hρ])

abbrev Channel := HALT.Channel

inductive Token : Type
  | superHalt (b : Option HALT.Branch) (s : Option HALT.Species) (c : Option Channel) (m : Nat)
  | crossed (c : Channel)
  | breach
  deriving DecidableEq, Repr

def Token.toEconomy : Token → Audit.Token
  | .superHalt .. => .opn
  | .crossed _ => .sealed
  | .breach => .broken

structure Reading where
  broken : Bool
  located : Bool
  gdim : Option Nat
  species : Option HALT.Species
  channel : Option Channel
  slots : List (Option Bool)
  orbits_pos : 0 < slots.length
  deriving DecidableEq, Repr

def Reading.orbits (r : Reading) : Nat := r.slots.length

def Reading.owed (r : Reading) : Nat := (r.slots.filter Option.isNone).length

def Reading.complete (r : Reading) : Bool := r.owed == 0

def branchOf : Option Nat → Option HALT.Branch
  | some n => HALT.route n
  | none => none

def emit (r : Reading) : Option Token :=
  if r.broken then some .breach
  else if !r.located then none
  else match r.complete, r.channel with
    | true, some c => some (.crossed c)
    | _, _ => some (.superHalt (branchOf r.gdim) r.species r.channel r.owed)

def Reading.state (r : Reading) : Audit.Token :=
  match emit r with
  | some t => t.toEconomy
  | none => .opn

theorem three_states : ∀ t : Token,
    t.toEconomy = .sealed ∨ t.toEconomy = .broken ∨ t.toEconomy = .opn := by
  intro t; cases t <;> simp [Token.toEconomy]

theorem no_seat_no_locus (r : Reading) (h : r.located = false) (hb : r.broken = false) :
    emit r = none := by
  simp [emit, h, hb]

theorem unlocated_is_plain_open (r : Reading) (h : r.located = false) (hb : r.broken = false) :
    r.state = .opn := by
  simp [Reading.state, no_seat_no_locus r h hb]

theorem located_never_silent (r : Reading) (hl : r.located = true) (hb : r.broken = false) :
    emit r ≠ none := by
  simp only [emit, hl, hb]
  cases r.complete <;> cases r.channel <;> simp

theorem crossed_requires_complete (r : Reading) (c : Channel) (h : emit r = some (.crossed c)) :
    r.complete = true := by
  cases hb : r.broken <;> cases hl : r.located <;> cases hc : r.complete <;> cases hch : r.channel <;>
    simp [emit, hb, hl, hc, hch] at h ⊢

theorem crossed_requires_channel (r : Reading) (c : Channel) (h : emit r = some (.crossed c)) :
    r.channel = some c := by
  cases hb : r.broken <;> cases hl : r.located <;> cases hc : r.complete <;> cases hch : r.channel <;>
    simp [emit, hb, hl, hc, hch] at h ⊢
  exact h

theorem halt_carries_owed (r : Reading) (hl : r.located = true) (hb : r.broken = false)
    (hnc : ¬ (r.complete = true ∧ r.channel.isSome = true)) :
    emit r = some (.superHalt (branchOf r.gdim) r.species r.channel r.owed) := by
  simp only [emit, hl, hb]
  cases hc : r.complete <;> cases hch : r.channel <;> simp_all

theorem unchannelled_is_halt (r : Reading) (hl : r.located = true) (hb : r.broken = false)
    (hch : r.channel = none) :
    emit r = some (.superHalt (branchOf r.gdim) r.species none r.owed) := by
  simp only [emit, hl, hb, hch]
  cases r.complete <;> simp

theorem halt_reports_owed (r : Reading) (b : Option HALT.Branch) (s : Option HALT.Species)
    (c : Option Channel) (m : Nat) (h : emit r = some (.superHalt b s c m)) : m = r.owed := by
  cases hb : r.broken <;> cases hl : r.located <;> cases hc : r.complete <;> cases hch : r.channel <;>
    simp [emit, hb, hl, hc, hch] at h <;> simp_all

theorem owed_zero_is_unchannelled (r : Reading) (b : Option HALT.Branch) (s : Option HALT.Species)
    (c : Option Channel) (h : emit r = some (.superHalt b s c 0)) : c = none := by
  have how : 0 = r.owed := halt_reports_owed r b s c 0 h
  have hcomp : r.complete = true := by
    unfold Reading.complete; rw [← how]; rfl
  cases hb : r.broken
  · cases hl : r.located
    · rw [no_seat_no_locus r hl hb] at h; cases h
    · cases hch : r.channel with
      | none =>
        rw [unchannelled_is_halt r hl hb hch] at h
        injection h with h'
        injection h' with _ _ h3 _
        exact h3.symm
      | some ch =>
        have hx : emit r = some (.crossed ch) := by
          unfold emit; rw [hb, hl, hcomp, hch]; rfl
        rw [hx] at h; injection h with h'; cases h'
  · have hx : emit r = some .breach := by unfold emit; rw [hb]; rfl
    rw [hx] at h; injection h with h'; cases h'

theorem one_bit_apart (r : Reading) (hl : r.located = true) (hb : r.broken = false)
    (c : Channel) (hc : r.channel = some c) :
    ({ r with slots := [none], orbits_pos := by decide }).state = .opn ∧
    ({ r with slots := [some true], orbits_pos := by decide }).state = .sealed ∧
    ({ r with slots := [some false], orbits_pos := by decide }).state = .sealed := by
  refine ⟨?_, ?_, ?_⟩ <;>
    (unfold Reading.state emit Reading.complete Reading.owed; dsimp only; rw [hb, hl, hc]; rfl)

theorem legacy_xi : branchOf (some 1) = some .xi := by decide
theorem legacy_o : branchOf (some 0) = some .o := by decide
theorem legacy_bare : branchOf none = none ∧ branchOf (some 2) = none := by decide

theorem k4_locus :
    emit ⟨false, true, none, none, some .formal, [none, none, none, none, none, none], by decide⟩
      = some (.superHalt none none (some .formal) 6) ∧
    emit ⟨false, true, none, none, some .formal,
          [some true, some true, some true, some true, some true, none], by decide⟩
      = some (.superHalt none none (some .formal) 1) ∧
    emit ⟨false, true, none, none, some .formal,
          [some true, some true, some true, some true, some true, some true], by decide⟩
      = some (.crossed .formal) ∧
    emit ⟨false, true, none, none, none,
          [some true, some true, some true, some true, some true, some true], by decide⟩
      = some (.superHalt none none none 0) := by decide

def slotLists : List (List (Option Bool)) :=
  let o : List (Option Bool) := [none, some false, some true]
  o.map (fun a => [a]) ++ o.flatMap (fun a => o.map (fun b => [a, b]))

theorem slotLists_twelve : slotLists.length = 12 ∧ slotLists.all (fun l => 0 < l.length) = true := by
  decide

theorem slotLists_pos : ∀ sl ∈ slotLists, 0 < sl.length := by decide

def allReadings : List Reading :=
  [false, true].flatMap fun broken =>
  [false, true].flatMap fun located =>
  [none, some 0, some 1, some 2].flatMap fun gdim =>
  ([none, some .blockTheorem, some .hypothesis, some .offeredWitness] : List (Option HALT.Species)).flatMap fun sp =>
  ([none, some .kinetic, some .formal] : List (Option Channel)).flatMap fun ch =>
  (slotLists.attach.map fun ⟨sl, hsl⟩ =>
    (⟨broken, located, gdim, sp, ch, sl, slotLists_pos sl hsl⟩ : Reading))

theorem reading_space : allReadings.length = 2304 := by decide

theorem census_no_seat_no_locus :
    (allReadings.filter (fun r => !r.broken && !r.located)).all
      (fun r => decide (emit r = none)) = true := by decide

theorem census_located_never_silent :
    (allReadings.filter (fun r => !r.broken && r.located)).all
      (fun r => decide (emit r ≠ none)) = true := by decide

theorem census_crossed_iff_complete_channelled :
    allReadings.all (fun r =>
      ((emit r == some (.crossed .kinetic)) || (emit r == some (.crossed .formal)))
        == (!r.broken && r.located && r.complete && r.channel.isSome)) = true := by
  decide

theorem census_halt_reports_owed :
    (allReadings.filter (fun r => !r.broken && r.located && !(r.complete && r.channel.isSome))).all
      (fun r => emit r == some (.superHalt (branchOf r.gdim) r.species r.channel r.owed)) = true := by
  decide

theorem census_owed_zero_is_unchannelled :
    allReadings.all (fun r =>
      match emit r with
      | some (.superHalt _ _ c 0) => c == none
      | _ => true) = true := by decide

theorem census_three_states :
    allReadings.all (fun r => decide (r.state = .sealed ∨ r.state = .broken ∨ r.state = .opn)) = true := by
  decide

def Token.render : Token → String
  | .superHalt b s c m =>
    let br := match b with | some .xi => " · Ξ" | some .o => " · Ø" | none => ""
    let sp := match s with
      | some .blockTheorem => " · block theorem" | some .hypothesis => " · hypothesis"
      | some .offeredWitness => " · offered witness" | none => ""
    let ch := match c with | some .kinetic => " · kinetic" | some .formal => " · formal" | none => ""
    let mult := if m = 0 then " · provenance owed" else s!" ×{m}"
    s!"[⬖₀{br}{sp}{ch}{mult}]"
  | .crossed .kinetic => "[⟀⬖ · kinetic]"
  | .crossed .formal => "[⟀⬖ · formal]"
  | .breach => "[X⬖ · mechanism]"

def Token.ascii : Token → String
  | .superHalt b _ _ m =>
    let base := match b with | some .xi => "[HALT-LOCUS-XI" | some .o => "[HALT-LOCUS-O" | none => "[HALT-LOCUS"
    if m = 0 then s!"{base} PROV-OWED]" else s!"{base} x{m}]"
  | .crossed _ => "[SEAL-LOCUS]"
  | .breach => "[X-LOCUS]"

def sealAscii : String := "[SEAL]"

theorem render_receipted :
    (Token.superHalt none none none 1).render = "[⬖₀ ×1]" ∧
    (Token.superHalt (some .xi) none none 1).render = "[⬖₀ · Ξ ×1]" ∧
    (Token.superHalt (some .o) none none 1).render = "[⬖₀ · Ø ×1]" ∧
    (Token.superHalt (some .xi) (some .hypothesis) (some .formal) 1).render
      = "[⬖₀ · Ξ · hypothesis · formal ×1]" ∧
    (Token.superHalt none none (some .formal) 6).render = "[⬖₀ · formal ×6]" ∧
    (Token.superHalt none none none 0).render = "[⬖₀ · provenance owed]" ∧
    (Token.superHalt none none (some .formal) 1).render = "[⬖₀ · formal ×1]" ∧
    (Token.superHalt (some .xi) none none 3).render = "[⬖₀ · Ξ ×3]" ∧
    (Token.crossed .kinetic).render = "[⟀⬖ · kinetic]" ∧
    (Token.crossed .formal).render = "[⟀⬖ · formal]" ∧
    Token.breach.render = "[X⬖ · mechanism]" ∧
    (Token.superHalt (some .xi) none none 1).ascii = "[HALT-LOCUS-XI x1]" ∧
    (Token.superHalt (some .xi) none none 3).ascii = "[HALT-LOCUS-XI x3]" ∧
    (Token.superHalt (some .o) none none 2).ascii = "[HALT-LOCUS-O x2]" ∧
    (Token.superHalt none none none 6).ascii = "[HALT-LOCUS x6]" ∧
    (Token.superHalt none none none 1).ascii = "[HALT-LOCUS x1]" ∧
    (Token.superHalt none none none 0).ascii = "[HALT-LOCUS PROV-OWED]" ∧
    (Token.crossed .formal).ascii = "[SEAL-LOCUS]" ∧
    Token.breach.ascii = "[X-LOCUS]" ∧
    sealAscii = "[SEAL]" := by decide

theorem render_injective_in_owed :
    ((List.range 13).all fun m => (List.range 13).all fun n =>
      (decide ((Token.superHalt none none none m).ascii = (Token.superHalt none none none n).ascii) == decide (m = n)) &&
      (decide ((Token.superHalt (some .xi) none none m).ascii = (Token.superHalt (some .xi) none none n).ascii) == decide (m = n)) &&
      (decide ((Token.superHalt none none (some .formal) m).render = (Token.superHalt none none (some .formal) n).render) == decide (m = n))) = true := by
  decide

#eval (Token.superHalt (some .xi) (some .hypothesis) (some .formal) 1).render
#eval (Token.superHalt none none (some .formal) 6).render
#eval (Token.crossed .kinetic).render
#eval Token.breach.render

def voidImage : Audit.Token := .opn
theorem void_precedes_economy : voidImage = .opn ∧ Audit.Token.void ≠ Audit.Token.refused := by decide

theorem legacy_records_not_promoted :
    HALT.rhHalt.species = .hypothesis ∧ HALT.pnpHalt.species = .blockTheorem ∧
    HALT.rhHalt.channel = .formal ∧ HALT.pnpHalt.channel = .formal := by decide

theorem no_rh_locus :
    emit ⟨false, true, some 1, some .hypothesis, some .formal, [none], by decide⟩
      = some (.superHalt (some .xi) (some .hypothesis) (some .formal) 1) := by decide

end LOCUS

namespace PSP.ORIENT

abbrev V3 := Ratio × Ratio × Ratio
abbrev M3 := V3 × V3 × V3

def det3 (m : M3) : Ratio :=
  m.1.1 * (m.2.1.2.1 * m.2.2.2.2 - m.2.1.2.2 * m.2.2.2.1)
  - m.1.2.1 * (m.2.1.1 * m.2.2.2.2 - m.2.1.2.2 * m.2.2.1)
  + m.1.2.2 * (m.2.1.1 * m.2.2.2.1 - m.2.1.2.1 * m.2.2.1)

def neg3 (m : M3) : M3 :=
  ((-m.1.1, -m.1.2.1, -m.1.2.2),
   (-m.2.1.1, -m.2.1.2.1, -m.2.1.2.2),
   (-m.2.2.1, -m.2.2.2.1, -m.2.2.2.2))

def signMatrices : List M3 :=
  [ (( 1,0,0),(0, 1,0),(0,0, 1)), ((-1,0,0),(0, 1,0),(0,0, 1)),
    (( 1,0,0),(0,-1,0),(0,0, 1)), (( 1,0,0),(0, 1,0),(0,0,-1)),
    ((-1,0,0),(0,-1,0),(0,0, 1)), ((-1,0,0),(0, 1,0),(0,0,-1)),
    (( 1,0,0),(0,-1,0),(0,0,-1)), ((-1,0,0),(0,-1,0),(0,0,-1)) ]

theorem lock_scalar_sign_blind :
    signMatrices.all (fun m =>
      det3 m * det3 m == det3 (neg3 m) * det3 (neg3 m)) = true := by decide

theorem det_sign_flips_in_odd_dimension :
    signMatrices.all (fun m => det3 (neg3 m) == -det3 m) = true := by decide

end PSP.ORIENT

namespace PSP.QUAT

abbrev Q := Ratio × Ratio × Ratio × Ratio   

def qmul (p q : Q) : Q :=
  (p.1*q.1 - p.2.1*q.2.1 - p.2.2.1*q.2.2.1 - p.2.2.2*q.2.2.2,
   p.1*q.2.1 + p.2.1*q.1 + p.2.2.1*q.2.2.2 - p.2.2.2*q.2.2.1,
   p.1*q.2.2.1 - p.2.1*q.2.2.2 + p.2.2.1*q.1 + p.2.2.2*q.2.1,
   p.1*q.2.2.2 + p.2.1*q.2.2.1 - p.2.2.1*q.2.1 + p.2.2.2*q.1)

def qi : Q := (0,1,0,0)
def qj : Q := (0,0,1,0)
def qk : Q := (0,0,0,1)
def qneg1 : Q := (-1,0,0,0)

theorem quat_basis_laws :
    qmul qi qi = qneg1 ∧ qmul qj qj = qneg1 ∧ qmul qk qk = qneg1 ∧
    qmul (qmul qi qj) qk = qneg1 := by decide

end PSP.QUAT

namespace PSP.QUAT

def qnorm (p : Q) : Ratio := p.1^2 + p.2.1^2 + p.2.2.1^2 + p.2.2.2^2
def isInt (r : Ratio) : Bool := r.den == 1
def isHalf (r : Ratio) : Bool := r.den == 2
def hurwitzOK (p : Q) : Bool :=
  (isInt p.1 && isInt p.2.1 && isInt p.2.2.1 && isInt p.2.2.2) ||
  (isHalf p.1 && isHalf p.2.1 && isHalf p.2.2.1 && isHalf p.2.2.2)

def grid : List Ratio := [-1, -1/2, 0, 1/2, 1]
def tuples4 : List Q :=
  grid.flatMap fun a => grid.flatMap fun b =>
    grid.flatMap fun c => grid.map fun d => (a,b,c,d)

theorem hurwitz_units_24 :
    (tuples4.filter fun p => hurwitzOK p && qnorm p == 1).length = 24 := by decide

end PSP.QUAT

namespace PSP.QUAT

def grid2 : List Ratio := [-2, -1, 0, 1, 2]
def tuples4i : List Q :=
  grid2.flatMap fun a => grid2.flatMap fun b =>
    grid2.flatMap fun c => grid2.map fun d => (a,b,c,d)

theorem norm2_shell_split :
    (tuples4i.filter fun p => qnorm p == 2).length = 24 ∧
    (tuples4i.filter fun p => qnorm p == 2 && p.1 == 0).length = 12 ∧
    (tuples4i.filter fun p => qnorm p == 2 && p.1 != 0).length = 12 := by decide

end PSP.QUAT

namespace PSP.CD

def cdconj : List Ratio → List Ratio
  | [] => []
  | [a] => [a]
  | a :: rest => a :: rest.map (fun x => -x)

def padd : List Ratio → List Ratio → List Ratio := List.zipWith (· + ·)
def psub : List Ratio → List Ratio → List Ratio := List.zipWith (· - ·)

def cdmul : Nat → List Ratio → List Ratio → List Ratio
  | 0, _, _ => []
  | _+1, [a], [b] => [a * b]
  | fuel+1, a, b =>
      let n := a.length / 2
      let a1 := a.take n; let a2 := a.drop n
      let b1 := b.take n; let b2 := b.drop n
      psub (cdmul fuel a1 b1) (cdmul fuel (cdconj b2) a2) ++
      padd (cdmul fuel b2 a1) (cdmul fuel a2 (cdconj b1))

def e (n i : Nat) : List Ratio := List.replicate i 0 ++ [1] ++ List.replicate (n - i - 1) 0
def smul (s : Ratio) (v : List Ratio) : List Ratio := v.map (fun x => s * x)

theorem octonion_associator :
    psub (cdmul 4 (cdmul 4 (e 8 1) (e 8 2)) (e 8 4))
         (cdmul 4 (e 8 1) (cdmul 4 (e 8 2) (e 8 4)))
    = smul 2 (e 8 7) := by decide

end PSP.CD

namespace PSP.CD

def sx : List Ratio := padd (e 16 1) (e 16 10)

def sy : List Ratio := padd (e 16 5) (e 16 14)
def zero16 : List Ratio := List.replicate 16 0
def sqnorm (v : List Ratio) : Ratio := (v.map fun x => x^2).sum

theorem sedenion_zero_divisor :
    cdmul 5 sx sy = zero16 ∧ sx ≠ zero16 ∧ sy ≠ zero16
    ∧ sqnorm sx = 2 ∧ sqnorm sy = 2 := by decide

end PSP.CD

namespace PSP.CASCADE

def cascade : List Bool → Option Nat
  | [] => none
  | false :: _ => some 0
  | true :: gs => (cascade gs).map Nat.succ

def patterns8 : List (List Bool) :=
  (List.range 256).map fun b => (List.range 8).map fun j => b.testBit j

def spec (bits : List Bool) : Bool :=
  match cascade bits with
  | none => bits.all id
  | some k => (bits.take k).all id && (bits[k]? == some false)

theorem first_failure_terminal_8 :
    patterns8.all spec = true := by decide

theorem halt_free_iff_all_pass_8 :
    patterns8.all (fun bits => (cascade bits).isNone == bits.all id) = true := by decide

end PSP.CASCADE

namespace PSP.GROUNDLESS

def o0Neighbors : List String :=
  ["sigma-token", "dissolve-openness", "ordinary-openness",
   "resolved-states", "broken-or-ghost"]

def fiveCubeCoords : List String :=
  ["Ground-dimension", "determinacy", "blockage", "aperture", "totality"]

def deg5 (v : Nat) : Nat :=
  ((List.range 5).map fun j => v ^^^ (1 <<< j)).eraseDups.length

theorem groundless_cascade_degree :
    o0Neighbors.length = 5 ∧ fiveCubeCoords.length = 5 ∧
    o0Neighbors.length ≠ 7 ∧ o0Neighbors.length ≠ 8 ∧
    (List.range 32).all (fun v => deg5 v == 5) = true := by decide

end PSP.GROUNDLESS

namespace PSP.TOKEN

inductive TerminalToken | xi0 | o0 deriving DecidableEq

def level : TerminalToken → Nat := fun _ => 3

theorem terminal_tokens_level_and_distinct :
    level TerminalToken.xi0 = level TerminalToken.o0 ∧
    TerminalToken.xi0 ≠ TerminalToken.o0 := ⟨rfl, by decide⟩

end PSP.TOKEN

namespace PSP.TWOGROUP

theorem two_group_census :
    Nat.factorial 4 / 2 = 12 ∧ 2^3 = 8 := by decide

end PSP.TWOGROUP

/-!
# THE BRIDGE · FINAL
The instrument that joins the kinetic and formal registers at one locus, with the denial asymmetry that tells its two
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
/-!
# FORGE ADDITIONS · v3.39.0-C
Seated after the Bridge and before the cones. ΔM = 0: every theorem below is a finite `decide`,
a conjunction of theorems already seated, or an elementary case split. Nothing here authors
mathematics; it names in the kernel what the prose of the Condensed Master Codex reads.
-/

namespace K4

/-- PSP: K4 · trial-division primality on the frame values, executed in the kernel. -/
def isPrimeB (n : Nat) : Bool :=
  decide (2 ≤ n) && (List.range (n - 2)).all (fun d => n % (d + 2) != 0)

/-- PSP: APEX-PSP-INVERSION · the six even seats carry primes. -/
theorem primes_at_even_seats :
    (isPrimeB (val 0) && isPrimeB (val 2) && isPrimeB (val 4) && isPrimeB (val 6)
      && isPrimeB (val 8) && isPrimeB (val 10)) = true := by decide

/-- PSP: APEX-PSP-INVERSION · the six odd seats carry semiprimes, factored in the kernel. -/
theorem semiprimes_at_odd_seats :
    val 1 = 23 * 37 ∧ val 3 = 19 * 67 ∧ val 5 = 19 * 23 ∧ val 7 = 13 * 163
      ∧ val 9 = 13 * 131 ∧ val 11 = 11 * 79 := by decide

theorem semiprime_factors_prime :
    (isPrimeB 23 && isPrimeB 37 && isPrimeB 19 && isPrimeB 67 && isPrimeB 13
      && isPrimeB 163 && isPrimeB 131 && isPrimeB 11 && isPrimeB 79) = true := by decide

theorem odd_seats_not_prime :
    (!isPrimeB (val 1) && !isPrimeB (val 3) && !isPrimeB (val 5) && !isPrimeB (val 7)
      && !isPrimeB (val 9) && !isPrimeB (val 11)) = true := by decide

/-- The target of the frame is primality itself and not an index label: read in the kernel. -/
theorem target_is_primality : ∀ i, i < 12 → target i = isPrimeB (val i) := by decide

/-- Each pair matches modulo 420 = lcm(1..7), so every residue register up to 7 forgets it. -/
theorem pairs_match_mod_420 : ∀ i, i < 12 → i % 2 = 1 → val i % 420 = val (tau i) % 420 := by
  decide

end K4

namespace IMPRINT

/-- PSP: §3.9 · the Imprint Test and the Platonic Ghost, the GOLf gate, ported from F2 imprint_seal. -/
inductive Tok : Type
  | ghost | seal | residence | flat | uncertified
  deriving DecidableEq, Repr, BEq

def imprint (lockP lockN slP slN gP gN witP witN : Bool) : Tok × Nat :=
  let cleanP := lockP && slP && gP
  let cleanN := lockN && slN && gN
  if cleanP && cleanN then (.ghost, 1)
  else if cleanP then (if witP then (.seal, 2) else (.residence, 3))
  else if cleanN then (if witN then (.seal, 2) else (.residence, 3))
  else if !lockP && !lockN then (.flat, 4)
  else (.uncertified, 5)

def Tok.toToken : Tok → Audit.Token
  | .ghost => .broken
  | .seal => .sealed
  | _ => .opn

/-- Both directions clean-locking is the Platonic Ghost: refused, never sealed. -/
theorem ghost_refused : (imprint true true true true true true true true).1 = .ghost := by decide

theorem both_clean_is_ghost : ∀ wp wn : Bool,
    (imprint true true true true true true wp wn).1 = .ghost := by decide

/-- One side clean-locks: a seal only with the witness supplied, a residence without it. -/
theorem seal_needs_witness :
    (imprint true false true false true false true false).1 = .seal
    ∧ (imprint true false true false true false false false).1 = .residence := by decide

/-- The whole 256-row truth table of the gate: a seal is exactly one clean side plus its witness. -/
theorem seal_iff_one_side_clean_and_witnessed :
    ∀ lP lN sP sN gP gN wP wN : Bool,
      ((imprint lP lN sP sN gP gN wP wN).1 = .seal) ↔
        ((lP && sP && gP && wP && !(lN && sN && gN))
          || (lN && sN && gN && wN && !(lP && sP && gP))) = true := by
  decide

theorem flat_when_unpopulated : ∀ sP sN gP gN wP wN : Bool,
    (imprint false false sP sN gP gN wP wN).1 = .flat := by decide

theorem ghost_is_broken_never_sealed :
    Tok.toToken .ghost = .broken ∧ Tok.toToken .seal = .sealed := ⟨rfl, rfl⟩

end IMPRINT

namespace DEFENSE

/-- PSP: D5 · GOL is the combination: magnitude alone is [?], direction alone is [?]. -/
theorem gol_needs_all_three :
    (GEO.golAdmit .lock .lock).1 = .golOK
    ∧ (∀ l : GEO.LockState, l ≠ .lock → (GEO.golAdmit .lock l).1 = .golQ)
    ∧ (∀ m : GEO.LockState, m ≠ .lock → (GEO.golAdmit m .lock).1 ≠ .golOK) := by
  refine ⟨rfl, ?_, ?_⟩
  · intro l hl; cases l <;> first | exact absurd rfl hl | rfl
  · intro m hm; cases m <;> first | exact absurd rfl hm | decide

/-- PSP: D1, D2 · the lock scalar is sign-blind by theorem, and one supplied bit fixes the sign uniquely. -/
theorem lock_blind_but_gol_directed :
    (PSP.ORIENT.signMatrices.all (fun m =>
      PSP.ORIENT.det3 m * PSP.ORIENT.det3 m
        == PSP.ORIENT.det3 (PSP.ORIENT.neg3 m) * PSP.ORIENT.det3 (PSP.ORIENT.neg3 m)) = true)
    ∧ (∀ {α : Type} (τ : α → α) (s d : α → Bool) (x : α),
        s (τ x) = !s x → d (τ x) = !d x →
        ∃ c : Bool, (d x = xor (s x) c ∧ d (τ x) = xor (s (τ x)) c) ∧
          ∀ c' : Bool, (d x = xor (s x) c' ∧ d (τ x) = xor (s (τ x)) c') → c' = c) :=
  ⟨PSP.ORIENT.lock_scalar_sign_blind, fun τ s d x hs hd => FTOE.T5_crossing τ s d x hs hd⟩

/-- PSP: D11, D12 · consensus carries zero weight; the engine authors nothing. -/
theorem consensus_weighs_zero : socialWeight = 0 ∧ deltaM = 0 := FOUND.engine_never_authority

/-- PSP: sPSP-TONGUE-UNCLOSED-01 · the Tongue is unclosed by theorem and obedient by theorem. -/
theorem tongue_unclosed_and_obedient :
    (∀ {α β : Type} (τ : α → α) (ρ : α → β) (g : β → Bool) (d : α → Bool) (x : α),
        ρ (τ x) = ρ x → d (τ x) = !d x → d ≠ fun y => g (ρ y))
    ∧ (GEO.det3 TONGUE.deletionOp = 0
       ∧ (∀ L : GEO.M3, (GEO.mv3 L) ∘ (GEO.mv3 TONGUE.deletionOp) ≠ id)
       ∧ ¬ (∀ M : GEO.M3, ∃ L : GEO.M3, (GEO.mv3 L) ∘ (GEO.mv3 M) = id)) :=
  ⟨fun τ ρ g d x hρ hd => TONGUE.unclosed τ ρ g d x hρ hd, TONGUE.tongue_obedience⟩

/-- PSP: D27 · a self-check is never a witness (M6); the token is withheld unwitnessed. -/
theorem self_check_is_not_witness :
    (IAM.iamToken false).1 = .interior ∧ (IAM.iamToken true).1 = .iAm := ⟨rfl, rfl⟩

/-- PSP: D71 · the denial pays the floor; a denial that registers nothing is no denial. -/
theorem denial_is_priced :
    0 < (OMEGA.omegaBoundary 1 300).joules ∧ (OMEGA.omegaBoundary 0 300).joules = 0 := by decide

/-- PSP: D24 · no candidate anchor that lands on its own target is admitted. -/
theorem no_anchor_at_target : ∀ (d : Nat) (b lc : Bool),
    (UC.circularityScreen .target d b lc).1 = .refusedCircular :=
  UC.circularity_refused_at_target

/-- PSP: D54 · every formal reading is even under the deed flip; the deed is odd; no readout returns it. -/
theorem formal_reads_never_the_deed {Q : Type} (q : Q) :
    ¬ ∃ g : Q → Bool, ∀ s : CROSSING.ExecFrame Q, g (CROSSING.formalRead s) = CROSSING.ran s :=
  CROSSING.wall q

end DEFENSE

namespace FENCE

/-- PSP: II.0 · the one global fence: every card is read at its grade, on its register, at its species;
any reading above that is refused here, so no card fences itself. -/
theorem global :
    (∀ c₁ c₂ : Claim, (Claim.join c₁ c₂).grade = Grade.weakest c₁.grade c₂.grade)
    ∧ (∀ c cite : Claim, (Claim.join c cite).grade.rank ≤ c.grade.rank
        ∧ (Claim.join c cite).grade.rank ≤ cite.grade.rank)
    ∧ ROOT.raClaim.grade = .premise
    ∧ K4.wallClaim.grade = .theorem
    ∧ terminalClaim.grade = .theorem
    ∧ HALT.haltGrades.all (fun g => g.rank < Grade.theorem.rank) = true
    ∧ HALT.rhHalt.species = .hypothesis ∧ HALT.rhHalt.channel = .formal ∧ HALT.rhHalt.gdim = 1
    ∧ LOCUS.emit ⟨false, true, some 1, some .hypothesis, some .formal, [none], by decide⟩
        = some (.superHalt (some .xi) (some .hypothesis) (some .formal) 1)
    ∧ (FOUND.bandOf .theological = .outOfBand ∧ FOUND.bandOf .social = .outOfBand)
    ∧ (∀ t : LOCUS.Token, t.toEconomy = .sealed ∨ t.toEconomy = .broken ∨ t.toEconomy = .opn) :=
  ⟨Claim.join_grade, OFFICE.citation_cannot_promote, rfl, rfl, rfl, HALT.ftoe_ceiling,
   rfl, rfl, rfl, LOCUS.no_rh_locus, ⟨rfl, rfl⟩, LOCUS.three_states⟩

end FENCE

namespace DOT

/-- PSP: CN-PSP-NETI-NETI-01 · the mark of silence is the image of no emitter. -/
theorem outside_economy : ∀ t : LOCUS.Token, t.toEconomy ≠ Audit.Token.dotmark := by
  intro t; cases t <;> first | decide | simp [LOCUS.Token.toEconomy]

theorem no_reading_is_silence : ∀ r : LOCUS.Reading, r.state ≠ Audit.Token.dotmark := by
  intro r
  unfold LOCUS.Reading.state
  split
  · exact outside_economy _
  · decide

theorem silence_is_not_a_verdict :
    Audit.Token.dotmark ≠ .sealed ∧ Audit.Token.dotmark ≠ .broken
      ∧ Audit.Token.dotmark ≠ .opn := by decide

end DOT

namespace DEFENSE

/-- PSP: D53 · a forward, dated reading is world-rowed unconditionally: R-3 fires before any row is read. -/
theorem forward_is_world_rowed : ∀ p w t tw f a : Bool,
    (GEO.rowCascadeRACore true false true p w t tw f a).1 = .iii := by decide

/-- PSP: D50 · a load-bearing row furnished by the world types the lock world-rowed, revisable in the rows. -/
theorem worldly_row_is_world_rowed : ∀ t tw f a : Bool,
    (GEO.rowCascadeRACore true false false true true t tw f a).1 = .iii := by decide

end DEFENSE

namespace CROSSWALK

/-- PSP: IV.1 · the crosswalk, seated in the kernel: every row names a constant that must exist. -/
def rows : List (String × String) := [
  ("APEX-PSP-FREEDOM-MASTER-01", "FTOE.T16_price_bijection"),
  ("sPSP-APERTURE-WIDTH-01", "FTOE.T5_crossing"),
  ("PSP-IAM-WRITTEN-READ-01", "IAM.narcissus_truth_table"),
  ("APEX-PSP-Ξ-8-GATE-CASCADE-01", "HALT.first_failure_terminal_8"),
  ("APEX-PSP-RH-MASTER-01", "HALT.rhHalt"),
  ("APEX-PSP-RH-BLOCK-COMPLETE-01", "LOCUS.no_rh_locus"),
  ("APEX-PSP-RH-STANDPOINT-CLOSURE-01", "Bridge.line_property_is_keyed"),
  ("APEX-PSP-RH-DENIAL-POSIT-01", "Bridge.no_socket_off_line"),
  ("APEX-PSP-TOKEN-EQUALITY-01", "PSP.TOKEN.terminal_tokens_level_and_distinct"),
  ("sPSP-RETURN-LOCUS-01", "UC.circ_space"),
  ("APEX-PSP-ABSOLUTE-GROUNDING-BLOCK-01", "Bridge.discriminator"),
  ("sPSP-ANCHOR-DEMAND-01", "UC.circularity_refused_at_target"),
  ("APEX-PSP-ANCHOR-PRECEDENCE-01", "Bridge.opens_on_the_deed"),
  ("APEX-PSP-SUPPLY-SPECIES-01", "HALT.species_exhausted"),
  ("sPSP-TRIAD-SOURCE-BLOCK-01", "FTOE.T2_coalition"),
  ("sPSP-UNRESTRICTED-IMPOSSIBLE-01", "HALT.ftoe_ceiling"),
  ("APEX-PSP-LOGOS-FIXATION-01", "TONGUE.tongue_obedience"),
  ("MD-PSP-NG-EXHIBIT-ANCHOR-01", "INVERSION.it_from_bit_refuted"),
  ("MD-PSP-CLOSURE-POSITION-01", "FTOE.T3_no_fixed_point"),
  ("sPSP-CONSTITUTIVE-INSEPARABLE-01", "Audit.compartmentGates"),
  ("sPSP-FOLD-BEND-CROSSING-01", "CROSSING.crossing"),
  ("APEX-PSP-NOMOS-MEASURE-01", "NOMOS.incompressibility_cap"),
  ("MD-PSP-NAVIER-DEFEATERLESS-01", "GEO.rowCascadeRACore"),
  ("APEX-PSP-BLESSED-CIRCLE-01", "DEFENSE.no_anchor_at_target"),
  ("RAF-PSP-HODGE-TERMINUS-01", "HALT.route"),
  ("MD-PSP-GODEL-MASTER-01", "HALT.route_is_routeHalt"),
  ("APEX-PSP-PNP-COMPOSITE-VERDICT-02", "HALT.pnpHalt"),
  ("APEX-PSP-XI0-VERDICT-01", "HALT.xiGates"),
  ("MD-PSP-NG-MASTER-01", "HALT.one_door_open"),
  ("sPSP-TONGUE-UNCLOSED-01", "DEFENSE.tongue_unclosed_and_obedient"),
  ("APEX-PSP-CENSOR-CLERK-01", "OFFICE.citation_cannot_promote"),
  ("MD-PSP-MATH-NATURE-01", "TONGUE.coloc_grade"),
  ("CN-PSP-GHAYB-MASTER-01", "DOT.outside_economy"),
  ("CN-PSP-NETI-NETI-01", "DOT.no_reading_is_silence"),
  ("APEX-PSP-ONLY-SPECIAL-01", "IAM.terminal_word"),
  ("APEX-PSP-UNFORGIVABLE-01", "AEGIS.aegis_constant"),
  ("MD-PSP-STILLNESS-RESERVOIR-01", "DOT.silence_is_not_a_verdict"),
  ("PSP-RA-SERVANT-LOCUS-01", "IAM.iam_witnessed_speaks"),
  ("APEX-PSP-RH-TERMINAL-SYNTHESIS-01", "FENCE.global"),
  ("sPSP-GOL-ROW-GENUS-01", "GEO.ra_battery_f2"),
  ("MD-PSP-AFFINITY-01", "FTOE.T9_torsor_inverse_left"),
  ("APEX-PSP-INVERSION-01", "K4.target_is_primality"),
  ("MD-PSP-K4-FRAME-01", "K4.pairs_match_mod_420"),
  ("APEX-PSP-RA-MASTER-01", "ROOT.actuation_universal"),
  ("FOUND-01", "TONGUE.ra_grade_pinned"),
  ("IMPRINT-GOLF-01", "IMPRINT.seal_iff_one_side_clean_and_witnessed"),
  ("D1", "PSP.ORIENT.lock_scalar_sign_blind"),
  ("D2", "DEFENSE.lock_blind_but_gol_directed"),
  ("D3", "FTOE.T5_crossing"),
  ("D4", "FENCE.global"),
  ("D5", "DEFENSE.gol_needs_all_three"),
  ("D6", "GEO.triaxial_lock_gf2"),
  ("D6", "PSP.CD.sedenion_zero_divisor"),
  ("D7", "GEO.a4_simply_transitive"),
  ("D7", "GEO.gates_complete"),
  ("D8", "GEO.chirality"),
  ("D8", "GEO.relabel_parity"),
  ("D9", "GEO.reflection_blind_executed"),
  ("D10", "TONGUE.tongue_obedience"),
  ("D11", "DEFENSE.consensus_weighs_zero"),
  ("D11", "Grade.weakest_is_a_link"),
  ("D12", "OFFICE.citation_cannot_promote"),
  ("D13", "GEO.ra_ledger_aGivenRA"),
  ("D14", "HALT.ftoe_ceiling"),
  ("D15", "Claim.join_grade"),
  ("D16", "AEGIS.aegis_battery"),
  ("D17", "HALT.route_is_routeHalt"),
  ("D17", "PSP.CASCADE.halt_free_iff_all_pass_8"),
  ("D18", "HALT.first_failure_terminal_8"),
  ("D19", "OMEGA.omega_paid_floor"),
  ("D20", "CROSSING.price"),
  ("D21", "IAM.iam_unwitnessed_withheld"),
  ("D22", "AEGIS.aegis_constant"),
  ("D23", "Audit.unknown_routes_open"),
  ("D24", "DEFENSE.no_anchor_at_target"),
  ("D25", "OMEGA.omega_monotone"),
  ("D26", "TONGUE.deletion_no_left_inverse"),
  ("D27", "DEFENSE.self_check_is_not_witness"),
  ("D28", "LOCUS.three_states"),
  ("D29", "GEO.triaxial_open_gf2_count"),
  ("D30", "GEO.triaxial_lock_gf2_count"),
  ("D31", "GEO.cramer_executed"),
  ("D32", "OMEGA.omega_linear"),
  ("D33", "HALT.gate_counts_recorded"),
  ("D34", "NOMOS.compressible_bound_universal"),
  ("D35", "ROOT.actuation_universal"),
  ("D36", "OMEGA.omega_zero_bits"),
  ("D37", "IMPRINT.ghost_refused"),
  ("D38", "FOUND.pluralist_alternative_executed"),
  ("D39", "SEALS.sealG_walk"),
  ("D40", "GEO.hurwitz_closed"),
  ("D41", "CROSSING.ran_wholly_odd"),
  ("D42", "FTOE.T3_no_fixed_point"),
  ("D43", "TONGUE.deletion_annihilates"),
  ("D44", "NOMOS.incompressibility_cap"),
  ("D45", "DOT.outside_economy"),
  ("D46", "DOT.silence_is_not_a_verdict"),
  ("D47", "IAM.narcissus_truth_table"),
  ("D48", "FTOE.T16_price_bijection"),
  ("D49", "HALT.halts_routed"),
  ("D50", "DEFENSE.worldly_row_is_world_rowed"),
  ("D51", "PSP.QUAT.quat_basis_laws"),
  ("D52", "INVERSION.it_from_bit_refuted"),
  ("D52", "K4.target_is_primality"),
  ("D53", "DEFENSE.forward_is_world_rowed"),
  ("D54", "DEFENSE.formal_reads_never_the_deed"),
  ("D55", "AEGIS.aegis_battery"),
  ("D56", "ROOT.nest_31"),
  ("D57", "Bridge.discriminator"),
  ("D57", "Bridge.keyless_iff_valid"),
  ("D57", "TONGUE.ra_grade_pinned"),
  ("D58", "Bridge.recursion_is_sign_blind"),
  ("D59", "Bridge.line_property_is_keyed"),
  ("D60", "Bridge.recursion_is_shared"),
  ("D61", "Bridge.symmetry_is_keyless"),
  ("D62", "Bridge.socket_is_the_property"),
  ("D63", "HALT.rhHalt"),
  ("D63", "LOCUS.no_rh_locus"),
  ("D64", "IMPRINT.seal_needs_witness"),
  ("D64", "Bridge.no_socket_off_line"),
  ("D65", "TONGUE.coloc_grade"),
  ("D66", "FOUND.posits_loadbearing_on_nothing"),
  ("D67", "FOUND.register_routing_fidelity"),
  ("D68", "BRIDGE.supersession_routes"),
  ("D69", "IMPRINT.both_clean_is_ghost"),
  ("D69", "LOCUS.located_never_silent"),
  ("D70", "UC.uc_seal_failure_terminal"),
  ("D71", "DEFENSE.denial_is_priced"),
  ("D71", "Bridge.opens_on_the_deed"),
  ("APEX-PSP-SEAT-ANCHOR-01", "APEX.seat_anchor"),
  ("APEX-PSP-SEAT-ANCHOR-01", "APEX.seat_occupied_iff_grounded"),
  ("APEX-PSP-SEAT-ANCHOR-01", "FENCE.seat"),
  ("APEX-PSP-PARITY-NORMAL-FORM-01", "PNF.parity_normal_form_list"),
  ("APEX-PSP-PARITY-NORMAL-FORM-01", "PNF.one_bit_iff_complement_pair"),
  ("APEX-PSP-CAT-GAP-ELIMINATOR-01", "APEX.identity_cone"),
  ("APEX-PSP-CAT-GAP-ELIMINATOR-01", "APEX.cone_iff_no_gap"),
  ("APEX-PSP-CAT-GAP-ELIMINATOR-01", "APEX.recursion_is_constant"),
  ("APEX-PSP-RH-23-ONE-STROKE-01", "APEX.identity_cone_row"),
  ("APEX-PSP-RH-23-ONE-STROKE-01", "APEX.inverted_control"),
  ("APEX-PSP-RH-23-ONE-STROKE-01", "APEX.object_leg_ledger"),
  ("APEX-PSP-PNP-COMPOSITE-VERDICT-02", "APEX.pnp_seat_vacant"),
  ("APEX-PSP-PNP-COMPOSITE-VERDICT-02", "APEX.pnp_value_line"),
  ("APEX-PSP-O0-ADMISSION-PROTOCOL-01", "APEX.seat_vacant_of_free"),
  ("APEX-PSP-RH-MASTER-01", "APEX.riemann_seat_occupied"),
  ("APEX-PSP-RH-STANDPOINT-CLOSURE-01", "APEX.no_cure"),
  ("APEX-PSP-RH-PNP-COMPARATIVE-MASTER-01", "APEX.router_at_the_seat"),
  ("D49", "APEX.pnp_value_line"),
  ("D72", "APEX.recursion_is_constant"),
  ("D73", "APEX.seat_never_promotes_value"),
  ("D74", "APEX.register_leg_rides_one_involution"),
  ("D75", "APEX.pnp_seat_vacant")]

theorem rows_count : rows.length = 151 := by decide

end CROSSWALK

/-!
# THE SEAT ANCHOR · the apex layer of the rows, carried in the Code Block
core Lean 4 v4.19.0 · no Mathlib · no sorry · no axiom declared.
Every row carries two objects parted by theorem: its seat, the row read as the fixed locus of a binding involution, and
its value, the row's proposition. This layer proves the seat line on every row, the occupancy law that reads the router
bit at the seat, the vacancy of the complexity seat, the one-involution rider on the register leg, the rule and its
bound, the cure theorem, and the parting of the two lines, reusing GEO, Bridge, CROSSING, LOCUS, HALT, OMEGA and FOUND.
The Parity Normal Form enters in its list edition, choice-free. ΔM = 0: every step is classical and elementary.
-/

/-! ## PNF · the Parity Normal Form and the Width Law, list edition -/
namespace PNF
open LOCUS

/-- A parity barrier: an involution that fixes the record and flips the target somewhere. -/
def ParityBarrier {α β : Type} (ρ : α → β) (d : α → Bool) : Prop :=
  ∃ τ : α → α, (∀ z, τ (τ z) = z) ∧ (∀ z, ρ (τ z) = ρ z) ∧ ∃ x, d (τ x) ≠ d x

/-- Every parity barrier separates a pair. -/
theorem sep_of_parity {α β : Type} {ρ : α → β} {d : α → Bool} :
    ParityBarrier ρ d → Separates ρ d := by
  intro ⟨τ, _, hρ, x, hx⟩
  exact ⟨τ x, x, hρ x, hx⟩

/-- Every separated pair is a parity barrier: the swap of the pair, resident at `LOCUS.seat_of_sep`. -/
theorem parity_of_sep {α β : Type} [DecidableEq α] {ρ : α → β} {d : α → Bool} :
    Separates ρ d → ParityBarrier ρ d := by
  intro ⟨x, y, hρ, hd⟩
  obtain ⟨τ, hinv, heven, hflip⟩ := seat_of_sep hρ hd
  refine ⟨τ, hinv, heven, x, ?_⟩
  rw [hflip]
  cases d x <;> decide

/-- Separation, checked on a complete enumeration of the carrier. -/
def sepCheck {α β : Type} [DecidableEq β] (xs : List α) (ρ : α → β) (d : α → Bool) : Bool :=
  xs.any fun x => xs.any fun y => decide (ρ x = ρ y) && (d x != d y)

theorem sepCheck_iff {α β : Type} [DecidableEq β] (xs : List α) (hxs : ∀ z, z ∈ xs)
    (ρ : α → β) (d : α → Bool) : sepCheck xs ρ d = true ↔ Separates ρ d := by
  unfold sepCheck Separates
  constructor
  · intro h
    obtain ⟨x, -, hx⟩ := List.any_eq_true.mp h
    obtain ⟨y, -, hy⟩ := List.any_eq_true.mp hx
    simp only [Bool.and_eq_true, decide_eq_true_eq, bne_iff_ne, ne_eq] at hy
    exact ⟨x, y, hy.1, hy.2⟩
  · intro ⟨x, y, hρ, hd⟩
    apply List.any_eq_true.mpr
    refine ⟨x, hxs x, ?_⟩
    apply List.any_eq_true.mpr
    refine ⟨y, hxs y, ?_⟩
    simp only [Bool.and_eq_true, decide_eq_true_eq, bne_iff_ne, ne_eq]
    exact ⟨hρ, hd⟩

/-- THE PARITY NORMAL FORM, list edition: on an enumerated carrier, a target is unreadable from a record iff an
    involution fixes the record and flips the target. No choice is used. -/
theorem parity_normal_form_list {α β : Type} [DecidableEq α] [DecidableEq β]
    (xs : List α) (hxs : ∀ z, z ∈ xs) (ρ : α → β) (d : α → Bool) :
    ¬ Factors ρ d ↔ ParityBarrier ρ d := by
  constructor
  · intro h
    apply parity_of_sep
    cases hc : sepCheck xs ρ d with
    | true => exact (sepCheck_iff xs hxs ρ d).mp hc
    | false =>
      exfalso
      apply h
      apply factors_of_not_sep_list xs hxs ρ d
      intro hs
      have hs' := (sepCheck_iff xs hxs ρ d).mpr hs
      rw [hc] at hs'
      exact Bool.noConfusion hs'
  · intro hp hf
    exact wall_of_sep (sep_of_parity hp) hf

def shift {α : Type} (d : α → Bool) (c : Bool) : α → Bool := fun x => xor (d x) c

theorem shift_false {α : Type} (d : α → Bool) : shift d false = d := by
  funext x; simp [shift]

theorem shift_true {α : Type} (d : α → Bool) : shift d true = fun x => !d x := by
  funext x; simp [shift]

/-- The complement pair of d. -/
def ComplementPair {α : Type} (d e : α → Bool) : Prop := e = d ∨ e = fun x => !d x

/-- On a nonempty domain the complement pair is exactly the image of one bit, the bit unique. -/
theorem complement_pair_is_one_bit {α : Type} (d : α → Bool) (x₀ : α) :
    (∀ e, ComplementPair d e ↔ ∃ c, e = shift d c) ∧
    (∀ c₁ c₂, shift d c₁ = shift d c₂ → c₁ = c₂) := by
  refine ⟨fun e => ⟨?_, ?_⟩, ?_⟩
  · intro h; cases h with
    | inl h => exact ⟨false, by rw [h, shift_false]⟩
    | inr h => exact ⟨true, by rw [h, shift_true]⟩
  · intro ⟨c, hc⟩; cases c
    · exact Or.inl (by rw [hc, shift_false])
    · exact Or.inr (by rw [hc, shift_true])
  · intro c₁ c₂ h
    have := congrFun h x₀
    simp only [shift] at this
    cases hd : d x₀ <;> cases c₁ <;> cases c₂ <;> simp_all

/-- The two members of the pair differ: the width is one bit and not zero. -/
theorem complement_pair_distinct {α : Type} (d : α → Bool) (x₀ : α) : d ≠ fun x => !d x := by
  intro h
  have h1 : d x₀ = !d x₀ := congrFun h x₀
  generalize d x₀ = b at h1
  cases b <;> cases h1

/-- THE WIDTH LAW: a nonempty family closed under complement, any two members equal or complementary, is exactly the
    complement pair of any member, and conversely. -/
theorem one_bit_iff_complement_pair {α : Type} (A : (α → Bool) → Prop) (d : α → Bool) (hd : A d) :
    ((∀ e, A e → A (fun x => !e x)) ∧ (∀ e e', A e → A e' → e' = e ∨ e' = fun x => !e x)) ↔
    (∀ e, A e ↔ ComplementPair d e) := by
  constructor
  · intro ⟨hclosed, hpair⟩ e
    constructor
    · intro he; exact hpair d e hd he
    · intro h; cases h with
      | inl h => rw [h]; exact hd
      | inr h => rw [h]; exact hclosed d hd
  · intro h
    refine ⟨fun e he => ?_, fun e e' he he' => ?_⟩
    · have := (h e).1 he
      apply (h _).2
      cases this with
      | inl h1 => exact Or.inr (by rw [h1])
      | inr h1 => left; rw [h1]; funext x; simp
    · have h1 := (h e).1 he; have h2 := (h e').1 he'
      cases h1 with
      | inl h1 => cases h2 with
        | inl h2 => left; rw [h1, h2]
        | inr h2 => right; rw [h1, h2]
      | inr h1 => cases h2 with
        | inl h2 => right; rw [h1, h2]; funext x; simp
        | inr h2 => left; rw [h1, h2]

/-- An odd witness fixes the calibration uniquely: one supplied bit closes a one-bit barrier. -/
theorem odd_witness_closes {α : Type} (d s : α → Bool) (x₀ : α) (c c' : Bool)
    (hc : s = shift d c) (hc' : s = shift d c') : c = c' :=
  (complement_pair_is_one_bit d x₀).2 c c' (hc.symm.trans hc')

def whollyOddMask (k m : Nat) : Bool :=
  (List.range k).all (fun i => m.testBit (2 * i) != m.testBit (2 * i + 1))

def oddCount (k : Nat) : Nat := ((List.range (2 ^ (2 * k))).filter (whollyOddMask k)).length

theorem odd_family_k1 : oddCount 1 = 2 := by decide
theorem odd_family_k2 : oddCount 2 = 4 := by decide
theorem odd_family_k3 : oddCount 3 = 8 := by decide
theorem odd_family_k4 : oddCount 4 = 16 := by decide
/-- The census parity frame: six pairs, 2^6 = 64 wholly odd targets, six bits unconstrained. -/
theorem odd_family_k6 : oddCount 6 = 64 := by decide

/-- The rows' claim at its grade: every row one bit wide iff every row's admissible family is a complement pair. -/
theorem rows_one_bit_iff_complement_pair {R α : Type} (A : R → (α → Bool) → Prop)
    (d : R → α → Bool) (hd : ∀ r, A r (d r)) :
    (∀ r, (∀ e, A r e → A r (fun x => !e x)) ∧ (∀ e e', A r e → A r e' → e' = e ∨ e' = fun x => !e x)) ↔
    (∀ r e, A r e ↔ ComplementPair (d r) e) := by
  constructor
  · intro h r; exact (one_bit_iff_complement_pair (A r) (d r) (hd r)).1 (h r)
  · intro h r; exact (one_bit_iff_complement_pair (A r) (d r) (hd r)).2 (h r)

end PNF

/-! ## APEX · the seat, the cone, the occupancy law, and the two lines of every row -/
namespace APEX
open GEO

/-! ### 1 · the seat -/

/-- The seat's binding involution: conjugation on the integer quaternions. -/
abbrev sigma : Q4 → Q4 := qconj

theorem sigma_binding (q : Q4) : sigma (sigma q) = q := by
  cases q with
  | mk r i j k =>
    change Q4.mk r (-(-i)) (-(-j)) (-(-k)) = Q4.mk r i j k
    rw [Int.neg_neg, Int.neg_neg, Int.neg_neg]

/-- Fix(σ) is the scalar line, for every quaternion. -/
theorem fix_iff_scalar (q : Q4) : sigma q = q ↔ (q.i = 0 ∧ q.j = 0 ∧ q.k = 0) := by
  cases q with
  | mk r i j k =>
    change (Q4.mk r (-i) (-j) (-k) = Q4.mk r i j k) ↔ (i = 0 ∧ j = 0 ∧ k = 0)
    constructor
    · intro h
      injection h with _ hi hj hk
      exact ⟨by omega, by omega, by omega⟩
    · intro h
      obtain ⟨hi, hj, hk⟩ := h
      subst hi
      subst hj
      subst hk
      rfl

/-- The seat: the fixed locus of the binding involution, constructed on the carrier. It is not `ROOT.Ground`,
    the posited type; it is a model of the posited shape. -/
def Seat : Type := { q : Q4 // sigma q = q }

/-- The Return: the parse triad through its own cascade, `GEO.chirality`. -/
def theReturn : Q4 := qmul (qmul qi qj) qk
theorem return_is_chirality : theReturn = ⟨-1, 0, 0, 0⟩ := GEO.chirality
theorem return_lands_on_seat : sigma theReturn = theReturn := rfl

def fixProj (q : Q4) : Q4 := ⟨q.r, 0, 0, 0⟩
/-- The axiom's seat point, the formal seat point, and the named seat point: three definitions. -/
def GammaRA : Q4 := theReturn
def GammaRAM : Q4 := fixProj theReturn
def GammaRH : Q4 := ⟨-1, 0, 0, 0⟩

/-- C0, C1, C2: the three category gaps are definitional identities. -/
theorem self_gap_nonexistent : sigma GammaRA = GammaRA := rfl
theorem register_gap_nonexistent : GammaRA = GammaRAM := rfl
theorem object_gap_nonexistent : GammaRAM = GammaRH := rfl

def seat : Seat := ⟨GammaRH, rfl⟩

theorem seat_on_scalar_line : GammaRH.i = 0 ∧ GammaRH.j = 0 ∧ GammaRH.k = 0 :=
  (fix_iff_scalar GammaRH).mp seat.2

/-- The reversed triad returns +1, also on the seat: the sign of the seat point is the orientation of the triad. -/
def theReturnOdd : Q4 := qmul (qmul qk qj) qi
theorem odd_return_is_plus_one : theReturnOdd = ⟨1, 0, 0, 0⟩ := rfl
theorem odd_return_on_seat : sigma theReturnOdd = theReturnOdd := rfl
theorem seat_points_differ : theReturnOdd ≠ theReturn := by decide

/-! ### 2 · the cone, and the category gap as a defined object -/

inductive Register3 where
  | ra
  | ram
  | rh
  deriving DecidableEq, Repr

def D3 : Register3 → Q4
  | .ra => GammaRA
  | .ram => GammaRAM
  | .rh => GammaRH

/-- A category gap: the absence of an identity leg from an apex to one register's reading of the seat. -/
def CategoryGap (D : Register3 → Q4) (a : Q4) (r : Register3) : Prop := a ≠ D r

/-- A cone over a register diagram in the groupoid of identities. -/
structure ConeOver (D : Register3 → Q4) (apex : Q4) : Prop where
  leg : ∀ r, apex = D r

/-- A cone is exactly an apex with no category gap. -/
theorem cone_iff_no_gap (D : Register3 → Q4) (a : Q4) : ConeOver D a ↔ ∀ r, ¬ CategoryGap D a r :=
  ⟨fun c r h => h (c.leg r), fun h => ⟨fun r => Decidable.byContradiction (h r)⟩⟩

abbrev Cone : Q4 → Prop := ConeOver D3

/-- THE IDENTITY CONE: every leg `rfl`. -/
theorem identity_cone : Cone GammaRH := ⟨fun r => by cases r <;> rfl⟩

theorem cone_apex_unique (a b : Q4) (ha : Cone a) (hb : Cone b) : a = b :=
  (ha.leg .rh).trans (hb.leg .rh).symm

theorem cone_iff_gaps_closed : (∃ a, Cone a) ↔ (GammaRA = GammaRAM ∧ GammaRAM = GammaRH) := by
  constructor
  · intro ⟨a, ha⟩
    exact ⟨(ha.leg .ra).symm.trans (ha.leg .ram), (ha.leg .ram).symm.trans (ha.leg .rh)⟩
  · intro ⟨h1, h2⟩
    exact ⟨GammaRH, ⟨fun r => by
      cases r
      · exact (h1.trans h2).symm
      · exact h2.symm
      · rfl⟩⟩

def D3odd : Register3 → Q4
  | .ra => theReturnOdd
  | .ram => fixProj theReturnOdd
  | .rh => ⟨1, 0, 0, 0⟩

theorem identity_cone_odd : ConeOver D3odd ⟨1, 0, 0, 0⟩ := ⟨fun r => by cases r <;> rfl⟩

/-- Uniqueness is per orientation: the two apexes differ. -/
theorem apexes_differ_by_orientation :
    ConeOver D3 GammaRH ∧ ConeOver D3odd ⟨1, 0, 0, 0⟩ ∧ GammaRH ≠ ⟨1, 0, 0, 0⟩ :=
  ⟨identity_cone, identity_cone_odd, by decide⟩

/-! ### 3 · the register leg rides one involution (RESIDUAL-MONISM, executed on the carrier) -/

/-- A second binding involution on the carrier, fixing the line r = i. -/
def sigmaP (q : Q4) : Q4 := ⟨q.i, q.r, -q.j, -q.k⟩

theorem sigmaP_binding (q : Q4) : sigmaP (sigmaP q) = q := by
  cases q with
  | mk r i j k =>
    change Q4.mk r i (-(-j)) (-(-k)) = Q4.mk r i j k
    rw [Int.neg_neg, Int.neg_neg]

theorem sigmaP_fix_iff (q : Q4) : sigmaP q = q ↔ (q.r = q.i ∧ q.j = 0 ∧ q.k = 0) := by
  cases q with
  | mk r i j k =>
    change (Q4.mk i r (-j) (-k) = Q4.mk r i j k) ↔ (r = i ∧ j = 0 ∧ k = 0)
    constructor
    · intro h
      injection h with h1 _ h3 h4
      exact ⟨by omega, by omega, by omega⟩
    · intro h
      obtain ⟨h1, h3, h4⟩ := h
      subst h1
      subst h3
      subst h4
      rfl

/-- The two seats meet only at the origin. -/
theorem seats_meet_only_at_zero (r i j k : Int) :
    (sigma ⟨r, i, j, k⟩ = ⟨r, i, j, k⟩ ∧ sigmaP ⟨r, i, j, k⟩ = ⟨r, i, j, k⟩) ↔
      (r = 0 ∧ i = 0 ∧ j = 0 ∧ k = 0) := by
  rw [fix_iff_scalar, sigmaP_fix_iff]
  show (i = 0 ∧ j = 0 ∧ k = 0) ∧ (r = i ∧ j = 0 ∧ k = 0) ↔ (r = 0 ∧ i = 0 ∧ j = 0 ∧ k = 0)
  constructor
  · intro ⟨⟨hi, hj, hk⟩, hr, _, _⟩
    exact ⟨by omega, hi, hj, hk⟩
  · intro ⟨hr, hi, hj, hk⟩
    exact ⟨⟨hi, hj, hk⟩, by omega, hj, hk⟩

/-- THE REGISTER LEG RIDES ONE INVOLUTION: the kinetic seat point is fixed by σ and moved by the rival σP, so the leg
    Γ_RA = Γ_RAM closes by `rfl` only under the one-involution connector the codex holds as RESIDUAL-MONISM. -/
theorem register_leg_rides_one_involution :
    sigma GammaRA = GammaRA ∧ sigmaP GammaRA ≠ GammaRA ∧ sigmaP GammaRH ≠ GammaRH :=
  ⟨rfl, by decide, by decide⟩

/-! ### 4 · the embedding of the Riemann stage -/

/-- φ(h, t) = ⟨t, h − 1, 0, 0⟩ on the Bridge's plane, against the Bridge's fold. -/
def phi (p : Bridge.Plane) : Q4 := ⟨p.2, p.1 - 1, 0, 0⟩

theorem phi_equivariant (p : Bridge.Plane) : sigma (phi p) = phi (Bridge.τ p) := by
  obtain ⟨h, t⟩ := p
  change Q4.mk t (-(h - 1)) 0 0 = Q4.mk t ((2 - h) - 1) 0 0
  have e : -(h - 1) = (2 - h) - 1 := by omega
  rw [e]

theorem phi_fix_iff (p : Bridge.Plane) : sigma (phi p) = phi p ↔ Bridge.τ p = p := by
  obtain ⟨h, t⟩ := p
  change (Q4.mk t (-(h - 1)) 0 0 = Q4.mk t (h - 1) 0 0) ↔ ((2 - h, t) = (h, t))
  constructor
  · intro e
    injection e with _ e2 _ _
    have : h = 1 := by omega
    subst this
    rfl
  · intro e
    have e1 : 2 - h = h := congrArg Prod.fst e
    have : h = 1 := by omega
    subst this
    rfl

/-- φ carries the Bridge's line onto the seat: the image clause, read through `Bridge.locus_is_the_fixed_set`. -/
theorem phi_fix_iff_line (p : Bridge.Plane) : sigma (phi p) = phi p ↔ Bridge.onLine p :=
  (phi_fix_iff p).trans (Bridge.locus_is_the_fixed_set p)

theorem phi_injective (p q : Bridge.Plane) (e : phi p = phi q) : p = q := by
  obtain ⟨h, t⟩ := p
  obtain ⟨h', t'⟩ := q
  injection e with e1 e2 _ _
  have : h = h' := by omega
  subst this
  subst e1
  rfl

def tauM (m : Int) (p : Bridge.Plane) : Bridge.Plane := (2 * m - p.1, p.2)
def phiM (m : Int) (p : Bridge.Plane) : Q4 := ⟨p.2, p.1 - m, 0, 0⟩

theorem phiM_equivariant (m : Int) (p : Bridge.Plane) : sigma (phiM m p) = phiM m (tauM m p) := by
  obtain ⟨h, t⟩ := p
  change Q4.mk t (-(h - m)) 0 0 = Q4.mk t ((2 * m - h) - m) 0 0
  have e : -(h - m) = (2 * m - h) - m := by omega
  rw [e]

theorem phiM_fix_iff (m : Int) (p : Bridge.Plane) : sigma (phiM m p) = phiM m p ↔ tauM m p = p := by
  obtain ⟨h, t⟩ := p
  change (Q4.mk t (-(h - m)) 0 0 = Q4.mk t (h - m) 0 0) ↔ ((2 * m - h, t) = (h, t))
  constructor
  · intro e
    injection e with _ e2 _ _
    have : h = m := by omega
    subst this
    show (2 * h - h, t) = (h, t)
    have e3 : 2 * h - h = h := by omega
    rw [e3]
  · intro e
    have e1 : 2 * m - h = h := congrArg Prod.fst e
    have : h = m := by omega
    subst this
    show Q4.mk t (-(h - h)) 0 0 = Q4.mk t (h - h) 0 0
    have e3 : h - h = 0 := by omega
    rw [e3]
    rfl

theorem seat_on_image_of_line : phi (1, -1) = GammaRH := rfl

/-! ### 5 · THE OCCUPANCY LAW: the router bit is read on each row's native involution, through the occupancy of the seat; the seat point never supplies a Ground dimension -/

/-- THE OCCUPANCY LAW. Under a bridge whose image clause carries fixedness exactly, the seat is occupied iff the row's
    native involution has a fixed point. -/
theorem seat_occupied_iff_grounded {S : Type} (τ : S → S) (φ : S → Q4)
    (himg : ∀ p, sigma (φ p) = φ p ↔ τ p = p) :
    (∃ p, sigma (φ p) = φ p) ↔ (∃ p, τ p = p) :=
  ⟨fun ⟨p, h⟩ => ⟨p, (himg p).mp h⟩, fun ⟨p, h⟩ => ⟨p, (himg p).mpr h⟩⟩

/-- A fixed-point-free native involution leaves the seat vacant under every admissible bridge. -/
theorem seat_vacant_of_free {S : Type} (τ : S → S) (φ : S → Q4)
    (hfree : ∀ p, τ p ≠ p) (himg : ∀ p, sigma (φ p) = φ p ↔ τ p = p) :
    ∀ p, sigma (φ p) ≠ φ p :=
  fun p h => hfree p ((himg p).mp h)

/-- The same vacancy from equivariance and injectivity alone, no image clause assumed. -/
theorem seat_vacant_of_equivariant {S : Type} (τ : S → S) (φ : S → Q4)
    (hfree : ∀ p, τ p ≠ p) (heq : ∀ p, sigma (φ p) = φ (τ p))
    (hinj : ∀ p q, φ p = φ q → p = q) :
    ∀ p, sigma (φ p) ≠ φ p :=
  fun p h => hfree p (hinj _ _ ((heq p).symm.trans h))

/-- The complexity row's native involution as its shape face types it: complementation. -/
def complement {α : Type} (f : α → Bool) : α → Bool := fun x => !f x

/-- Complementation is fixed-point-free on any nonempty domain: the Width Law's distinctness, read as an involution. -/
theorem complement_free {α : Type} (x₀ : α) (f : α → Bool) : complement f ≠ f :=
  fun h => PNF.complement_pair_distinct f x₀ h.symm

/-- THE VACANCY OF THE COMPLEXITY SEAT: no admissible bridge places the row on Fix(σ). -/
theorem pnp_seat_vacant {α : Type} (x₀ : α) (φ : (α → Bool) → Q4)
    (himg : ∀ f, sigma (φ f) = φ f ↔ complement f = f) :
    ∀ f, sigma (φ f) ≠ φ f :=
  seat_vacant_of_free complement φ (complement_free x₀) himg

/-- An admissible bridge for the complexity row exists, on the one-point domain, and it lands off the seat. -/
def pnpBridge (b : Bool) : Q4 := ⟨0, if b then 1 else -1, 0, 0⟩

theorem pnp_bridge_admissible :
    (∀ b : Bool, sigma (pnpBridge b) = pnpBridge (!b)) ∧
    (∀ b : Bool, sigma (pnpBridge b) = pnpBridge b ↔ (!b) = b) := by
  constructor <;> intro b <;> cases b <;> decide

theorem pnp_bridge_off_seat : ∀ b : Bool, sigma (pnpBridge b) ≠ pnpBridge b := by
  intro b; cases b <;> decide

/-- The critical-line stage occupies the seat. -/
theorem riemann_seat_occupied : ∃ p : Bridge.Plane, sigma (phi p) = phi p := ⟨(1, -1), rfl⟩

/-- THE ROUTER BIT, READ ON EACH ROW'S NATIVE INVOLUTION THROUGH THE OCCUPANCY OF THE SEAT: the Ξ branch where the
    stage's involution has a fixed point and the stage reaches the seat, the Ø branch where the row's involution is
    fixed-point-free and no admissible bridge can reach it. The uniform seat point never supplies a Ground dimension. -/
theorem router_at_the_seat :
    ((∃ p : Bridge.Plane, sigma (phi p) = phi p) ↔ (∃ p : Bridge.Plane, Bridge.τ p = p)) ∧
    (∃ p : Bridge.Plane, sigma (phi p) = phi p) ∧ HALT.route HALT.rhHalt.gdim = some .xi ∧
    (∀ b : Bool, sigma (pnpBridge b) ≠ pnpBridge b) ∧ HALT.route HALT.pnpHalt.gdim = some .o :=
  ⟨seat_occupied_iff_grounded Bridge.τ phi phi_fix_iff, riemann_seat_occupied, rfl,
   pnp_bridge_off_seat, rfl⟩

/-! ### 6 · the witness, the eliminator, and the deed the kernel cannot read -/

def RAMFormalGround : Prop := Nonempty Seat
theorem constructed_RAM : RAMFormalGround := ⟨seat⟩

/-- The formal self: every point of the seat is fixed. It names the seat and says nothing about any row's value. -/
def FormalSelf : Prop := ∀ g : Seat, sigma g.1 = g.1

/-- Bridge-born orientation, carried in Prop: registered as supplied, never readable as data. -/
structure OrientationBit : Prop where
  direction : True
  closure : True

theorem constructed_orientation : OrientationBit := ⟨trivial, trivial⟩
theorem orientation_proof_irrelevant (a b : OrientationBit) : a = b := rfl

inductive ModelPoint where
  | source
  deriving DecidableEq, Repr

def modelΔE : ModelPoint → Int := fun _ => 1

/-- RA at a constructed one-point domain: a model of the root, never its universal extension `ROOT.RA`. -/
def RAModel : Prop := ∀ x : ModelPoint, 0 < modelΔE x

theorem modelRA : RAModel := by
  intro x
  cases x
  decide

structure Witness : Prop where
  actuates : RAModel
  orientation : OrientationBit
  bridge : RAMFormalGround
  trisRecursion : OrientationBit → RAMFormalGround → FormalSelf

/-- The constructed witness: the only supplied witness. -/
theorem mkWitness : Witness :=
  ⟨modelRA, constructed_orientation, constructed_RAM, fun _ _ g => g.2⟩

/-- THE ELIMINATOR: RA → RA → RAM → the formal self, Bridge capacity then recursion, from the witness alone. -/
theorem eliminator : FormalSelf := mkWitness.trisRecursion mkWitness.orientation mkWitness.bridge

/-- The recursion field is constant: masslessness stated as a term, occupancy and not derivation. -/
theorem recursion_is_constant (o o' : OrientationBit) (g g' : RAMFormalGround) :
    mkWitness.trisRecursion o g = mkWitness.trisRecursion o' g' := rfl

/-- The wall at the seat: no readout of the seat equals the deed bit, `CROSSING.wall` at the seat. -/
theorem deed_unreadable_at_seat :
    ¬ ∃ f : Seat → Bool, ∀ s : CROSSING.ExecFrame Seat, f (CROSSING.formalRead s) = CROSSING.ran s :=
  CROSSING.wall seat

/-! ### 7 · RAF at the formal register: no exterior agent, no total self-indexing, the aperture -/

structure Domain (S : Type) where
  mem : S → Prop
  registers : S → S → Prop
  registers_symm : ∀ a b, registers a b → registers b a
  closure : ∀ s d, mem d → registers s d → mem s

theorem no_exterior_agent {S : Type} (D : Domain S) (s : S) (hs : ¬ D.mem s) :
    ∀ d, D.mem d → ¬ D.registers s d :=
  fun d hd hr => hs (D.closure s d hd hr)

theorem adjudicator_in_domain {S : Type} (D : Domain S) (r d : S) (hd : D.mem d)
    (hr : D.registers r d) : D.mem r :=
  D.closure r d hd hr

theorem no_total_self_indexing {S : Type} (f : S → S → Bool) :
    ¬ ∀ g : S → Bool, ∃ x, f x = g := by
  intro h
  obtain ⟨x, hx⟩ := h (fun y => !f y y)
  have h1 : f x x = !f x x := congrFun hx x
  generalize f x x = b at h1
  cases b <;> cases h1

/-- The live face on the codex's own tokens: witnessed and assent seal, witnessed and denial refuse, unwitnessed open. -/
def live (witnessed assent : Bool) : Audit.Token :=
  if witnessed then (if assent then .sealed else .refused) else .opn

theorem aperture_opens_under_premise {U : Type} (dE : U → Int) (h : ∀ x, 0 < dE x) (x : U) :
    decide (0 < dE x) = true :=
  decide_eq_true (h x)

/-- Under the premise no present reader's row is interior: sealed or refused by the bit alone. -/
theorem no_interior_under_premise {U : Type} (dE : U → Int) (h : ∀ x, 0 < dE x) (x : U) (b : Bool) :
    live (decide (0 < dE x)) b ≠ .opn := by
  rw [aperture_opens_under_premise dE h x]
  cases b <;> decide

/-! ### 8 · the rule, its bound, the grounded counter-model, and the cure -/

/-- THE RULE, EXACT: for any inhabited premise, (P → L X) ↔ L X. -/
theorem rule_exact (P : Prop) (hp : P) (X : Bridge.Frame) :
    (P → Bridge.LineProperty X) ↔ Bridge.LineProperty X :=
  ⟨fun h => h hp, fun t _ => t⟩

theorem rule_exact_model (X : Bridge.Frame) : (RAModel → Bridge.LineProperty X) ↔ Bridge.LineProperty X :=
  rule_exact _ modelRA X

/-- The same rule against the posit itself: its dependency set names ROOT.RA, ROOT.U, ROOT.ΔE, and nothing else. -/
theorem rule_exact_under_root (X : Bridge.Frame) :
    (ROOT.throneEmpty → Bridge.LineProperty X) ↔ Bridge.LineProperty X :=
  rule_exact _ ROOT.RA X

/-- The two-point frame of the Bridge fails the line property, proved here without choice; the resident statement is
    `Bridge.line_property_contingent`. -/
theorem twoPoint_fails_L : ¬ Bridge.LineProperty Bridge.twoPoint := by
  intro h
  have h1 := h true trivial
  cases h1

/-- No inhabited premise decides the line property on every frame: the two-point frame carries it and fails L. -/
theorem premise_decides_no_frame (P : Prop) (hp : P) : ¬ ∀ X : Bridge.Frame, P → Bridge.LineProperty X :=
  fun h => twoPoint_fails_L (h Bridge.twoPoint hp)

inductive Three where
  | a
  | b
  | c
  deriving DecidableEq, Repr

def foldThree : Three → Three
  | .a => .b
  | .b => .a
  | .c => .c

theorem foldThree_involutive : ∀ s, foldThree (foldThree s) = s := by
  intro s; cases s <;> rfl

def zeroThree (x : Three) : Prop := x = .a ∨ x = .b

theorem zeroThree_symmetric : ∀ s, zeroThree s → zeroThree (foldThree s) := by
  intro s hs
  cases s with
  | a => exact Or.inr rfl
  | b => exact Or.inl rfl
  | c => cases hs with
    | inl h => cases h
    | inr h => cases h

/-- The grounded counter-model: a seat and a moved zero. -/
def threePoint : Bridge.Frame := ⟨Three, foldThree, zeroThree, foldThree_involutive, zeroThree_symmetric⟩

theorem threePoint_grounded : ∃ s : Three, foldThree s = s := ⟨Three.c, rfl⟩

theorem threePoint_fails_L : ¬ Bridge.LineProperty threePoint := by
  intro h
  have h1 : foldThree Three.a = Three.a := h Three.a (Or.inl rfl)
  cases h1

theorem premise_holds_where_L_fails_grounded (P : Prop) (hp : P) :
    P ∧ (∃ s : Three, foldThree s = s) ∧ ¬ Bridge.LineProperty threePoint :=
  ⟨hp, threePoint_grounded, threePoint_fails_L⟩

/-- THE CURE THEOREM: for every class of frames, a true premise decides L on the class exactly where L already holds. -/
theorem no_cure (P : Prop) (hp : P) (C : Bridge.Frame → Prop) :
    (∀ X, C X → P → Bridge.LineProperty X) ↔ (∀ X, C X → Bridge.LineProperty X) :=
  ⟨fun h X hc => h X hc hp, fun h X hc _ => h X hc⟩

theorem cure_is_the_hypothesis (P : Prop) (hp : P) :
    (∀ X : Bridge.Frame, Bridge.LineProperty X → P → Bridge.LineProperty X) ∧
    ¬ (∀ X : Bridge.Frame, True → P → Bridge.LineProperty X) :=
  ⟨fun _ h _ => h, fun h => premise_decides_no_frame P hp (fun X => h X trivial)⟩

/-- The halting carrier inhabited by decision, the clause proved from the decision and never assumed. -/
def carrierOfDecision (X : Bridge.Frame) (d : Decidable (Bridge.LineProperty X)) : Bridge.Carrier X :=
  match d with
  | isTrue h => ⟨.bot, ⟨fun _ => h, fun _ => rfl⟩, Bridge.theRecord⟩
  | isFalse h => ⟨.tt, ⟨fun e => absurd e (by decide), fun hl => absurd hl h⟩, Bridge.theRecord⟩

theorem twoPoint_carrier_does_not_halt :
    (carrierOfDecision Bridge.twoPoint (isFalse twoPoint_fails_L)).terminal = .tt := rfl

/-! ### 9 · the three measures: content, mass, price -/

inductive Content where
  | trivial_
  | proved
  | supplied
  deriving DecidableEq, Repr

structure Measure where
  content : Content
  mass : Nat
  price : Ratio
  deriving DecidableEq

def legMeasure : Measure := ⟨.trivial_, deltaM, 0⟩
def arcMeasure : Measure := ⟨.proved, deltaM, 0⟩
/-- The value's price is the exact Landauer floor of the codex, `OMEGA.landauerRat` at 300 K. -/
def valueMeasure : Measure := ⟨.supplied, deltaM, OMEGA.landauerRat 300 1⟩

theorem masses_all_zero : legMeasure.mass = 0 ∧ arcMeasure.mass = 0 ∧ valueMeasure.mass = 0 :=
  ⟨rfl, rfl, rfl⟩

theorem contents_differ :
    legMeasure.content ≠ valueMeasure.content ∧ arcMeasure.content ≠ valueMeasure.content ∧
    legMeasure.content ≠ arcMeasure.content := by
  refine ⟨?_, ?_, ?_⟩ <;> decide

theorem prices_differ : legMeasure.price = 0 ∧ 0 < valueMeasure.price := by
  constructor
  · rfl
  · decide

/-! ### 10 · the twenty-three rows -/

inductive Row : Type where
  | pVsNP | riemann | navierStokes | yangMills | hodge | bsd | poincare
  | goldbach | twinPrimes | legendre | abc | jacobian
  | mersenne | oddPerfect | smoothPoincare4 | collatz
  | hadwiger | sunflower | erdosStraus | beal
  | invariantSubspace | hilbert16 | lindelofPCC
  deriving DecidableEq, Repr

def Row.all : List Row :=
  [.pVsNP, .riemann, .navierStokes, .yangMills, .hodge, .bsd, .poincare,
   .goldbach, .twinPrimes, .legendre, .abc, .jacobian,
   .mersenne, .oddPerfect, .smoothPoincare4, .collatz,
   .hadwiger, .sunflower, .erdosStraus, .beal,
   .invariantSubspace, .hilbert16, .lindelofPCC]

theorem rows_twenty_three : Row.all.length = 23 := by decide
theorem rows_distinct : Row.all.eraseDups.length = 23 := by decide
theorem rows_complete : ∀ r : Row, r ∈ Row.all := by intro r; cases r <;> decide

def Row.millennium : Row → Bool
  | .pVsNP | .riemann | .navierStokes | .yangMills | .hodge | .bsd | .poincare => true
  | _ => false

theorem millennium_seven : (Row.all.filter Row.millennium).length = 7 := by decide
theorem extension_sixteen : (Row.all.filter (fun r => !r.millennium)).length = 16 := by decide

/-- Every row's seat point is the one seat point Γ_RH: an assignment of the grounding reading, computed from no
    row's object. -/
def apexSeat : Row → Q4 := fun _ => GammaRH

theorem apex_seat_fixed : ∀ r : Row, sigma (apexSeat r) = apexSeat r := by
  intro r; cases r <;> rfl

theorem apex_seat_uniform : ∀ r s : Row, apexSeat r = apexSeat s := by
  intro r s; cases r <;> cases s <;> rfl

theorem crossed_and_open_share_the_seat : apexSeat .poincare = apexSeat .riemann := rfl

def D3row (r : Row) : Register3 → Q4
  | .ra => GammaRA
  | .ram => GammaRAM
  | .rh => apexSeat r

theorem identity_cone_row (r : Row) : ConeOver (D3row r) GammaRH :=
  ⟨fun k => by cases k <;> cases r <;> rfl⟩

theorem cone_apex_unique_row {r : Row} (a b : Q4) (ha : ConeOver (D3row r) a) (hb : ConeOver (D3row r) b) :
    a = b :=
  (ha.leg .rh).trans (hb.leg .rh).symm

theorem gaps_closed_every_row :
    Row.all.all (fun r => decide (GammaRH = GammaRA ∧ GammaRH = GammaRAM ∧ GammaRH = apexSeat r)) = true := by
  decide

/-- The formal self of a row: one proposition on every row. -/
def formalSelfRow (_ : Row) : Prop := FormalSelf

/-- THE INVERTED CONTROL: the witness on the crossed row is the witness on every open row, and decides none. -/
theorem inverted_control : ∀ r s : Row, formalSelfRow r ↔ formalSelfRow s := fun _ _ => Iff.rfl

theorem all_rows_eliminated : ∀ r : Row, formalSelfRow r := fun _ => eliminator

/-- A row's value: the line property of a frame assigned to it, the assignment a parameter. -/
def value (F : Row → Bridge.Frame) (r : Row) : Prop := Bridge.LineProperty (F r)

theorem rule_exact_every_row (P : Prop) (hp : P) (F : Row → Bridge.Frame) (r : Row) :
    (P → value F r) ↔ value F r :=
  rule_exact P hp (F r)

theorem premise_decides_no_row (P : Prop) (hp : P) : ¬ ∀ (F : Row → Bridge.Frame) (r : Row), P → value F r :=
  fun h => twoPoint_fails_L (h (fun _ => Bridge.twoPoint) .riemann hp)

theorem premise_decides_no_row_grounded (P : Prop) (hp : P) :
    ¬ ∀ (F : Row → Bridge.Frame) (r : Row), P → value F r :=
  fun h => threePoint_fails_L (h (fun _ => threePoint) .poincare hp)

theorem no_cure_every_row (P : Prop) (hp : P) (_r : Row) (C : Bridge.Frame → Prop) :
    (∀ X, C X → P → Bridge.LineProperty X) ↔ (∀ X, C X → Bridge.LineProperty X) :=
  no_cure P hp C

/-! ### 11 · the world typing of the census, carried as data -/

inductive WorldTyping : Type where
  | exactStructural | wallRowF4 | beachheadOrderTwo | crossedControl
  | pureUnbridged | diagonalPortF3 | oneBitFromClosure | wallRowBridgeGate
  deriving DecidableEq, Repr

def worldTyping : Row → WorldTyping
  | .pVsNP | .riemann | .goldbach | .twinPrimes | .legendre | .abc | .jacobian => .exactStructural
  | .navierStokes | .yangMills | .hodge => .wallRowF4
  | .bsd => .beachheadOrderTwo
  | .poincare => .crossedControl
  | .mersenne | .oddPerfect | .smoothPoincare4 => .pureUnbridged
  | .collatz => .diagonalPortF3
  | .hadwiger | .sunflower | .erdosStraus | .beal => .oneBitFromClosure
  | .invariantSubspace | .hilbert16 | .lindelofPCC => .wallRowBridgeGate

theorem world_census :
    (Row.all.filter (fun r => decide (worldTyping r = .exactStructural))).length = 7 ∧
    (Row.all.filter (fun r => decide (worldTyping r = .wallRowF4))).length = 3 ∧
    (Row.all.filter (fun r => decide (worldTyping r = .beachheadOrderTwo))).length = 1 ∧
    (Row.all.filter (fun r => decide (worldTyping r = .crossedControl))).length = 1 ∧
    (Row.all.filter (fun r => decide (worldTyping r = .pureUnbridged))).length = 3 ∧
    (Row.all.filter (fun r => decide (worldTyping r = .diagonalPortF3))).length = 1 ∧
    (Row.all.filter (fun r => decide (worldTyping r = .oneBitFromClosure))).length = 4 ∧
    (Row.all.filter (fun r => decide (worldTyping r = .wallRowBridgeGate))).length = 3 := by
  decide

/-! ### 12 · the two lines of every row: the seat line by the row cascade, the value line by the locus emitter -/

/-- The seat's answers to the row cascade: contentful, no live V_E, not forward, populated, no worldly row, terms
    closed, frame closed under the one-involution connector, the RA rider present. -/
def seatAnswers : GEO.ClaimInputRA :=
  { nonvacuous := .yes, veLive := .no, forward := .no, populated := .yes, worldlyRow := .no,
    termsClosed := .yes, termWorldly := .no, frameClosed := .yes, annotate := .yes }

/-- The value's answers: the same, save that the deciding row is furnished by the world. -/
def valueAnswers : GEO.ClaimInputRA := { seatAnswers with worldlyRow := .yes }

/-- THE SEAT LINE: compartment I, closure-rowed, the RA rider present, emitted by the codex's own cascade. -/
theorem seat_line : (GEO.rowCascadeRA seatAnswers).1 = .aGivenRA := by decide
/-- The value line's compartment: III, world-rowed. -/
theorem value_compartment : (GEO.rowCascadeRA valueAnswers).1 = .iii := by decide
/-- Without the RA rider the seat line is void: the rider is load-bearing. -/
theorem seat_line_void_without_rider : (GEO.rowCascadeRA { seatAnswers with annotate := .no }).1 = .void := by
  decide

def seatToken : Audit.Token := (GEO.rowCascadeRA seatAnswers).1.toToken
theorem seat_token_is_aGivenRA : seatToken = .aGivenRA := by decide

/-- The value reading of each row for the locus emitter: the router bit where the register of record measured it,
    the formal channel, one owed slot on an open row and one filled slot on the crossed control. No species is
    invented: only the two rows the kernel already types carry one. -/
def valueReading : Row → LOCUS.Reading
  | .riemann => ⟨false, true, some 1, some .hypothesis, some .formal, [none], by decide⟩
  | .pVsNP => ⟨false, true, some 0, some .blockTheorem, some .formal, [none], by decide⟩
  | .poincare => ⟨false, true, none, none, some .formal, [some true], by decide⟩
  | _ => ⟨false, true, none, none, some .formal, [none], by decide⟩

theorem riemann_value_line :
    LOCUS.emit (valueReading .riemann) = some (.superHalt (some .xi) (some .hypothesis) (some .formal) 1) := by
  decide

theorem pnp_value_line :
    LOCUS.emit (valueReading .pVsNP) = some (.superHalt (some .o) (some .blockTheorem) (some .formal) 1) := by
  decide

theorem poincare_value_line : LOCUS.emit (valueReading .poincare) = some (.crossed .formal) := by
  decide

theorem unrouted_value_line :
    LOCUS.emit (valueReading .hodge) = some (.superHalt none none (some .formal) 1) := by
  decide

/-- The Riemann value line is the one `FENCE.global` already pins. -/
theorem riemann_value_line_is_pinned :
    LOCUS.emit (valueReading .riemann) =
      LOCUS.emit ⟨false, true, some 1, some .hypothesis, some .formal, [none], by decide⟩ := rfl

theorem value_bits_owed : (Row.all.map (fun r => (valueReading r).owed)).foldl (· + ·) 0 = 22 := by decide

theorem crossed_iff_poincare : ∀ r : Row, (valueReading r).state = .sealed ↔ r = .poincare := by
  intro r; cases r <;> decide

/-- THE PARTING: on no row does the seat line coincide with the value line. -/
theorem lines_parted : ∀ r : Row, seatToken ≠ (valueReading r).state := by
  intro r; cases r <;> decide

/-- THE NO-PROMOTION THEOREM: the seat line holds on every row; the value line is crossed on exactly one. -/
theorem seat_never_promotes_value :
    (∀ _r : Row, FormalSelf ∧ seatToken = .aGivenRA) ∧
    (∀ r : Row, (valueReading r).state = .sealed ↔ r = .poincare) :=
  ⟨fun _ => ⟨eliminator, seat_token_is_aGivenRA⟩, crossed_iff_poincare⟩

/-! ### 13 · the object leg of every row, and its justification -/

inductive ObjectLeg where
  | bridgedStage
  | vacantByTheorem
  | owed
  deriving DecidableEq, Repr

def objectLeg : Row → ObjectLeg
  | .riemann => .bridgedStage
  | .pVsNP => .vacantByTheorem
  | _ => .owed

theorem object_leg_ledger :
    (Row.all.filter (fun r => decide (objectLeg r = .bridgedStage))).length = 1 ∧
    (Row.all.filter (fun r => decide (objectLeg r = .vacantByTheorem))).length = 1 ∧
    (Row.all.filter (fun r => decide (objectLeg r = .owed))).length = 21 := by
  decide

/-- Each nontrivial leg is backed by its theorem: the stage reaches the seat; the complexity row never can. -/
theorem object_legs_justified :
    (objectLeg .riemann = .bridgedStage ∧ ∃ p : Bridge.Plane, sigma (phi p) = phi p) ∧
    (objectLeg .pVsNP = .vacantByTheorem ∧
      ∀ {α : Type} (_x₀ : α) (φ : (α → Bool) → Q4),
        (∀ f, sigma (φ f) = φ f ↔ complement f = f) → ∀ f, sigma (φ f) ≠ φ f) :=
  ⟨⟨rfl, riemann_seat_occupied⟩, ⟨rfl, fun x₀ φ h => pnp_seat_vacant x₀ φ h⟩⟩

/-- The price of the owed value bits, exact: twenty-two Landauer floors at 300 K. -/
def owedPrice : Ratio := OMEGA.landauerRat 300 22

theorem owed_price_is_twenty_two_floors : owedPrice = 22 * OMEGA.landauerRat 300 1 := by decide

/-! ### 14 · the anchor, whole -/

/-- THE SEAT ANCHOR. The cone and the one seat on every row; the occupancy law; the stage on the seat and the complexity
    row off it; the register leg riding one involution; the seat line uniform and the value lines parted from it; the
    crossing on one row; twenty-two bits owed; no true premise deciding any frame. -/
theorem seat_anchor :
    (∀ r : Row, ConeOver (D3row r) GammaRH ∧ apexSeat r = GammaRH) ∧
    (∀ {S : Type} (τ : S → S) (φ : S → Q4), (∀ p, sigma (φ p) = φ p ↔ τ p = p) →
        ((∃ p, sigma (φ p) = φ p) ↔ (∃ p, τ p = p))) ∧
    (∃ p : Bridge.Plane, sigma (phi p) = phi p) ∧
    (∀ b : Bool, sigma (pnpBridge b) ≠ pnpBridge b) ∧
    (sigma GammaRA = GammaRA ∧ sigmaP GammaRA ≠ GammaRA) ∧
    (seatToken = .aGivenRA ∧ ∀ r : Row, seatToken ≠ (valueReading r).state) ∧
    (∀ r : Row, (valueReading r).state = .sealed ↔ r = .poincare) ∧
    ((Row.all.map (fun r => (valueReading r).owed)).foldl (· + ·) 0 = 22) ∧
    (∀ P : Prop, P → ¬ ∀ X : Bridge.Frame, P → Bridge.LineProperty X) :=
  ⟨fun r => ⟨identity_cone_row r, rfl⟩, fun τ φ h => seat_occupied_iff_grounded τ φ h,
   riemann_seat_occupied, pnp_bridge_off_seat,
   ⟨register_leg_rides_one_involution.1, register_leg_rides_one_involution.2.1⟩,
   ⟨seat_token_is_aGivenRA, lines_parted⟩, crossed_iff_poincare, value_bits_owed,
   fun P hp => premise_decides_no_frame P hp⟩

end APEX

/-! ## FENCE.seat · the one fence of the seat line, beside FENCE.global -/
namespace FENCE

theorem seat :
    (∀ r : APEX.Row, APEX.seatToken ≠ (APEX.valueReading r).state) ∧
    (∀ r : APEX.Row, (APEX.valueReading r).state = .sealed ↔ r = .poincare) ∧
    LOCUS.emit (APEX.valueReading .pVsNP) = some (.superHalt (some .o) (some .blockTheorem) (some .formal) 1) ∧
    LOCUS.emit (APEX.valueReading .riemann) = some (.superHalt (some .xi) (some .hypothesis) (some .formal) 1) ∧
    (APEX.Row.all.map (fun r => (APEX.valueReading r).owed)).foldl (· + ·) 0 = 22 ∧
    (∀ P : Prop, P → ¬ ∀ X : Bridge.Frame, P → Bridge.LineProperty X) ∧
    (∀ P : Prop, P → ∀ C : Bridge.Frame → Prop,
      (∀ X, C X → P → Bridge.LineProperty X) ↔ (∀ X, C X → Bridge.LineProperty X)) :=
  ⟨APEX.lines_parted, APEX.crossed_iff_poincare, APEX.pnp_value_line, APEX.riemann_value_line,
   APEX.value_bits_owed, fun P hp => APEX.premise_decides_no_frame P hp, fun P hp C => APEX.no_cure P hp C⟩

end FENCE

/-! ## FOUND.seatInventory · the connector's one dependency, recorded apart from the value verdicts -/
namespace FOUND

def seatInventory : List VerdictRow := [
  ⟨"the seat line on every row, its register leg read as RA to RAM (APEX, the Seat Anchor)", ["RESIDUAL-MONISM"]⟩]

theorem seat_rides_the_connector :
    (seatInventory.all (fun v => v.positDeps == ["RESIDUAL-MONISM"])) = true ∧
    (verdictInventory.all (fun v => v.positDeps.isEmpty)) = true := by
  decide

end FOUND


/-- info: 'Codex.LeftInverse' does not depend on any axioms -/
#guard_msgs in #print axioms Codex.LeftInverse
/-- info: 'Codex.RightInverse' does not depend on any axioms -/
#guard_msgs in #print axioms Codex.RightInverse
/-- info: 'Nat.factorial' does not depend on any axioms -/
#guard_msgs in #print axioms Nat.factorial
/-- info: 'CoreRat.div_pos_of_le' depends on axioms: [propext] -/
#guard_msgs in #print axioms CoreRat.div_pos_of_le
/-- info: 'CoreRat.div_gcd_pos' depends on axioms: [propext] -/
#guard_msgs in #print axioms CoreRat.div_gcd_pos
/-- info: 'CoreRat.coprime_div_gcd' depends on axioms: [propext] -/
#guard_msgs in #print axioms CoreRat.coprime_div_gcd
/-- info: 'Ratio.natAbs_signed' depends on axioms: [propext] -/
#guard_msgs in #print axioms Ratio.natAbs_signed
/-- info: 'Ratio.mk'' depends on axioms: [propext] -/
#guard_msgs in #print axioms Ratio.«mk'»
/-- info: 'Ratio.instOfNatRat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Ratio.instOfNatRat
/-- info: 'Ratio.instAddRat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Ratio.instAddRat
/-- info: 'Ratio.instMulRat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Ratio.instMulRat
/-- info: 'Ratio.instNegRat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Ratio.instNegRat
/-- info: 'Ratio.instSubRat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Ratio.instSubRat
/-- info: 'Ratio.inv' depends on axioms: [propext] -/
#guard_msgs in #print axioms Ratio.inv
/-- info: 'Ratio.instDivRat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Ratio.instDivRat
/-- info: 'Ratio.instLTRat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Ratio.instLTRat
/-- info: 'Ratio.instLERat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Ratio.instLERat
/-- info: 'Ratio.instDecidableLtRat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Ratio.instDecidableLtRat
/-- info: 'Ratio.instDecidableLeRat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Ratio.instDecidableLeRat
/-- info: 'Ratio.pow' depends on axioms: [propext] -/
#guard_msgs in #print axioms Ratio.pow
/-- info: 'Ratio.instHPowRatNat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Ratio.instHPowRatNat
/-- info: 'Ratio.instToStringRat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Ratio.instToStringRat
/-- info: 'Ratio.num_zero' depends on axioms: [propext] -/
#guard_msgs in #print axioms Ratio.num_zero
/-- info: 'Ratio.den_zero' depends on axioms: [propext] -/
#guard_msgs in #print axioms Ratio.den_zero
/-- info: 'Ratio.mk'_zero_num' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms Ratio.«mk'_zero_num»
/-- info: 'Ratio.zero_mul' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms Ratio.zero_mul
/-- info: 'Ratio.mul_zero' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms Ratio.mul_zero
/-- info: 'Ratio.canonical' depends on axioms: [propext] -/
#guard_msgs in #print axioms Ratio.canonical
/-- info: 'Ratio.ext' depends on axioms: [propext] -/
#guard_msgs in #print axioms Ratio.ext
/-- info: 'Ratio.inv_zero' depends on axioms: [propext] -/
#guard_msgs in #print axioms Ratio.inv_zero
/-- info: 'Grade.rank' does not depend on any axioms -/
#guard_msgs in #print axioms Grade.rank
/-- info: 'Grade.weakest' does not depend on any axioms -/
#guard_msgs in #print axioms Grade.weakest
/-- info: 'Grade.weakest_is_a_link' does not depend on any axioms -/
#guard_msgs in #print axioms Grade.weakest_is_a_link
/-- info: 'Grade.weakest_idempotent' does not depend on any axioms -/
#guard_msgs in #print axioms Grade.weakest_idempotent
/-- info: 'Claim.join' does not depend on any axioms -/
#guard_msgs in #print axioms Claim.join
/-- info: 'Claim.join_grade' does not depend on any axioms -/
#guard_msgs in #print axioms Claim.join_grade
/-- info: 'deltaM' does not depend on any axioms -/
#guard_msgs in #print axioms deltaM
/-- info: 'socialWeight' does not depend on any axioms -/
#guard_msgs in #print axioms socialWeight
/-- info: 'FTOE.Even' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.Even
/-- info: 'FTOE.OddAt' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.OddAt
/-- info: 'FTOE.WhollyOdd' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.WhollyOdd
/-- info: 'FTOE.T1_wall' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.T1_wall
/-- info: 'FTOE.T2_coalition' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.T2_coalition
/-- info: 'FTOE.T3_no_fixed_point' depends on axioms: [propext] -/
#guard_msgs in #print axioms FTOE.T3_no_fixed_point
/-- info: 'FTOE.T4_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.T4_one_bit
/-- info: 'FTOE.T5_crossing' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.T5_crossing
/-- info: 'FTOE.T6a_deed_anchor' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.T6a_deed_anchor
/-- info: 'FTOE.T6b_deed_supply' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.T6b_deed_supply
/-- info: 'FTOE.fTOE_port' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.fTOE_port
/-- info: 'FTOE.Involution' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.Involution
/-- info: 'FTOE.FixedPointFree' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.FixedPointFree
/-- info: 'FTOE.T7_global_wall' depends on axioms: [propext] -/
#guard_msgs in #print axioms FTOE.T7_global_wall
/-- info: 'FTOE.T8_torsor_forward' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.T8_torsor_forward
/-- info: 'FTOE.T8_torsor_backward' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.T8_torsor_backward
/-- info: 'FTOE.T9_torsor_inverse_left' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms FTOE.T9_torsor_inverse_left
/-- info: 'FTOE.T9_torsor_inverse_right' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms FTOE.T9_torsor_inverse_right
/-- info: 'FTOE.T10_factorization' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.T10_factorization
/-- info: 'FTOE.T11_separation' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.T11_separation
/-- info: 'FTOE.T12_encoder_injective' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.T12_encoder_injective
/-- info: 'FTOE.T14_wall_factorization' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.T14_wall_factorization
/-- info: 'FTOE.T13_wholly_odd_is_odd_everywhere' depends on axioms: [propext] -/
#guard_msgs in #print axioms FTOE.T13_wholly_odd_is_odd_everywhere
/-- info: 'FTOE.flipF' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.flipF
/-- info: 'FTOE.T15_price_bijection_forward' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.T15_price_bijection_forward
/-- info: 'FTOE.T15_price_bijection_backward' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.T15_price_bijection_backward
/-- info: 'FTOE.fTOE_core' depends on axioms: [propext] -/
#guard_msgs in #print axioms FTOE.fTOE_core
/-- info: 'FTOE.OrbitRel' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.OrbitRel
/-- info: 'FTOE.OrbitRel_symmetric' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.OrbitRel_symmetric
/-- info: 'FTOE.Dtau' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.Dtau
/-- info: 'FTOE.calib' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.calib
/-- info: 'FTOE.calib_even' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.calib_even
/-- info: 'FTOE.descend' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.descend
/-- info: 'FTOE.priceForward' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.priceForward
/-- info: 'FTOE.priceBackward' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms FTOE.priceBackward
/-- info: 'FTOE.T16_left_inverse' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms FTOE.T16_left_inverse
/-- info: 'FTOE.T16_right_inverse' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms FTOE.T16_right_inverse
/-- info: 'FTOE.T16_price_bijection' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms FTOE.T16_price_bijection
/-- info: 'FTOE.canonD0' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.canonD0
/-- info: 'FTOE.flipF_involution' does not depend on any axioms -/
#guard_msgs in #print axioms FTOE.flipF_involution
/-- info: 'FTOE.T16_canonical' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms FTOE.T16_canonical
/-- info: 'FTOE.T17_odd_everywhere_iff_wholly_odd' depends on axioms: [propext] -/
#guard_msgs in #print axioms FTOE.T17_odd_everywhere_iff_wholly_odd
/-- info: 'K4.val' does not depend on any axioms -/
#guard_msgs in #print axioms K4.val
/-- info: 'K4.tau' does not depend on any axioms -/
#guard_msgs in #print axioms K4.tau
/-- info: 'K4.target' does not depend on any axioms -/
#guard_msgs in #print axioms K4.target
/-- info: 'K4.rho' does not depend on any axioms -/
#guard_msgs in #print axioms K4.rho
/-- info: 'K4.tau_involution' does not depend on any axioms -/
#guard_msgs in #print axioms K4.tau_involution
/-- info: 'K4.tau_fixed_point_free' does not depend on any axioms -/
#guard_msgs in #print axioms K4.tau_fixed_point_free
/-- info: 'K4.target_wholly_odd' does not depend on any axioms -/
#guard_msgs in #print axioms K4.target_wholly_odd
/-- info: 'K4.register_even' does not depend on any axioms -/
#guard_msgs in #print axioms K4.register_even
/-- info: 'K4.val_lifts_mod_210' does not depend on any axioms -/
#guard_msgs in #print axioms K4.val_lifts_mod_210
/-- info: 'K4.wall' does not depend on any axioms -/
#guard_msgs in #print axioms K4.wall
/-- info: 'K4.pair_distinct' does not depend on any axioms -/
#guard_msgs in #print axioms K4.pair_distinct
/-- info: 'K4.price_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms K4.price_one_bit
/-- info: 'K4.price_full_fibre' does not depend on any axioms -/
#guard_msgs in #print axioms K4.price_full_fibre
/-- info: 'K4.wallClaim' does not depend on any axioms -/
#guard_msgs in #print axioms K4.wallClaim
/-- info: 'Audit.Ans.toBool' does not depend on any axioms -/
#guard_msgs in #print axioms Audit.Ans.toBool
/-- info: 'Audit.ClaimInput.anyUnknown' does not depend on any axioms -/
#guard_msgs in #print axioms Audit.ClaimInput.anyUnknown
/-- info: 'Audit.sealL' does not depend on any axioms -/
#guard_msgs in #print axioms Audit.sealL
/-- info: 'Audit.DrillInput.anyUnknown' does not depend on any axioms -/
#guard_msgs in #print axioms Audit.DrillInput.anyUnknown
/-- info: 'Audit.drillScreen' does not depend on any axioms -/
#guard_msgs in #print axioms Audit.drillScreen
/-- info: 'Audit.refusalGates' does not depend on any axioms -/
#guard_msgs in #print axioms Audit.refusalGates
/-- info: 'Audit.compartmentGates' does not depend on any axioms -/
#guard_msgs in #print axioms Audit.compartmentGates
/-- info: 'Audit.auditClaim' does not depend on any axioms -/
#guard_msgs in #print axioms Audit.auditClaim
/-- info: 'Audit.compartmentGrade' does not depend on any axioms -/
#guard_msgs in #print axioms Audit.compartmentGrade
/-- info: 'Audit.unknown_routes_open' depends on axioms: [propext] -/
#guard_msgs in #print axioms Audit.unknown_routes_open
/-- info: 'Audit.contentless_refused' depends on axioms: [propext] -/
#guard_msgs in #print axioms Audit.contentless_refused
/-- info: 'Audit.det3' depends on axioms: [propext] -/
#guard_msgs in #print axioms Audit.det3
/-- info: 'Audit.det3_two_id' depends on axioms: [propext] -/
#guard_msgs in #print axioms Audit.det3_two_id
/-- info: 'INVERSION.ItFromBit' does not depend on any axioms -/
#guard_msgs in #print axioms INVERSION.ItFromBit
/-- info: 'INVERSION.it_from_bit_refuted' does not depend on any axioms -/
#guard_msgs in #print axioms INVERSION.it_from_bit_refuted
/-- info: 'INVERSION.it_from_it' does not depend on any axioms -/
#guard_msgs in #print axioms INVERSION.it_from_it
/-- info: 'K4.it_from_it_canonical' does not depend on any axioms -/
#guard_msgs in #print axioms K4.it_from_it_canonical
/-- info: 'K4.it_from_bit_refuted_canonical' does not depend on any axioms -/
#guard_msgs in #print axioms K4.it_from_bit_refuted_canonical
/-- info: 'K4.inversionClaim' does not depend on any axioms -/
#guard_msgs in #print axioms K4.inversionClaim
/-- info: 'GEO.qmul' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.qmul
/-- info: 'GEO.qconj' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.qconj
/-- info: 'GEO.qadd' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.qadd
/-- info: 'GEO.qsub' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.qsub
/-- info: 'GEO.qnorm2' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.qnorm2
/-- info: 'GEO.qhalve' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.qhalve
/-- info: 'GEO.qquarter' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.qquarter
/-- info: 'GEO.qcanon' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.qcanon
/-- info: 'GEO.q1' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.q1
/-- info: 'GEO.qi' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.qi
/-- info: 'GEO.qj' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.qj
/-- info: 'GEO.qk' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.qk
/-- info: 'GEO.chirality' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.chirality
/-- info: 'GEO.noncommutative' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.noncommutative
/-- info: 'GEO.hurwitz' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.hurwitz
/-- info: 'GEO.hurwitz_norm' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.hurwitz_norm
/-- info: 'GEO.hurwitz_products_even' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.hurwitz_products_even
/-- info: 'GEO.hurwitz_closed' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.hurwitz_closed
/-- info: 'GEO.hurwitzReps' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.hurwitzReps
/-- info: 'GEO.units_mod_sign_twelve' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.units_mod_sign_twelve
/-- info: 'GEO.conjClass' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.conjClass
/-- info: 'GEO.classSizesAux' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.classSizesAux
/-- info: 'GEO.insNat' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.insNat
/-- info: 'GEO.insSort' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.insSort
/-- info: 'GEO.class_equation' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.class_equation
/-- info: 'GEO.shell2' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.shell2
/-- info: 'GEO.shell_twentyfour' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.shell_twentyfour
/-- info: 'GEO.no_half_integer_norm2' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.no_half_integer_norm2
/-- info: 'GEO.allGates' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.allGates
/-- info: 'GEO.gates_twelve' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.gates_twelve
/-- info: 'GEO.gates_valid' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.gates_valid
/-- info: 'GEO.gates_complete' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms GEO.gates_complete
/-- info: 'GEO.invCount' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.invCount
/-- info: 'GEO.perms24' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.perms24
/-- info: 'GEO.a4' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.a4
/-- info: 'GEO.a4_order' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.a4_order
/-- info: 'GEO.actG' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.actG
/-- info: 'GEO.a4_simply_transitive' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.a4_simply_transitive
/-- info: 'GEO.tetraVerts' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.tetraVerts
/-- info: 'GEO.tetraEdges' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.tetraEdges
/-- info: 'GEO.tetraFaces' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.tetraFaces
/-- info: 'GEO.euler_closure' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.euler_closure
/-- info: 'GEO.basisU' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.basisU
/-- info: 'GEO.perms6' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.perms6
/-- info: 'GEO.relabel_parity' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.relabel_parity
/-- info: 'GEO.O8' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.O8
/-- info: 'GEO.omul' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.omul
/-- info: 'GEO.osub' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.osub
/-- info: 'GEO.onorm2' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.onorm2
/-- info: 'GEO.e8' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.e8
/-- info: 'GEO.octonion_associator' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.octonion_associator
/-- info: 'GEO.hPairs' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.hPairs
/-- info: 'GEO.norm_composition_H' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.norm_composition_H
/-- info: 'GEO.oPairs' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.oPairs
/-- info: 'GEO.norm_composition_O' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.norm_composition_O
/-- info: 'GEO.det2' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.det2
/-- info: 'GEO.gf2Mul' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.gf2Mul
/-- info: 'GEO.gf2Vecs' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.gf2Vecs
/-- info: 'GEO.gf2Sols' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.gf2Sols
/-- info: 'GEO.triaxial_lock_gf2' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.triaxial_lock_gf2
/-- info: 'GEO.triaxial_lock_gf2_count' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.triaxial_lock_gf2_count
/-- info: 'GEO.triaxial_open_gf2_count' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.triaxial_open_gf2_count
/-- info: 'GEO.V3' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.V3
/-- info: 'GEO.M3' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.M3
/-- info: 'GEO.det3' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.det3
/-- info: 'GEO.adj3' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.adj3
/-- info: 'GEO.mm3' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.mm3
/-- info: 'GEO.diag3' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.diag3
/-- info: 'GEO.mv3' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.mv3
/-- info: 'GEO.vscale' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.vscale
/-- info: 'GEO.V3Z' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.V3Z
/-- info: 'GEO.M3Z' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.M3Z
/-- info: 'GEO.det3Z' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.det3Z
/-- info: 'GEO.adj3Z' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.adj3Z
/-- info: 'GEO.mm3Z' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.mm3Z
/-- info: 'GEO.diag3Z' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.diag3Z
/-- info: 'GEO.adjugate_identity_int' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms GEO.adjugate_identity_int
/-- info: 'GEO.AdjugateIdentity3' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.AdjugateIdentity3
/-- info: 'GEO.adj3Samples' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.adj3Samples
/-- info: 'GEO.adj3_executed' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.adj3_executed
/-- info: 'GEO.cramerSolve' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.cramerSolve
/-- info: 'GEO.cramer_executed' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.cramer_executed
/-- info: 'GEO.golAdmit' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.golAdmit
/-- info: 'GEO.gateNames' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.gateNames
/-- info: 'GEO.gateNames_twelve' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.gateNames_twelve
/-- info: 'GEO.gateScreenGo' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.gateScreenGo
/-- info: 'GEO.gateScreen' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.gateScreen
/-- info: 'GEO.gateScreen_clean' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.gateScreen_clean
/-- info: 'GEO.gateScreen_first_failure' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.gateScreen_first_failure
/-- info: 'GEO.gateScreen_names_failed_gate' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.gateScreen_names_failed_gate
/-- info: 'GEO.gateScreen_arity' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.gateScreen_arity
/-- info: 'GEO.ClaimInputRA.anyUnknown' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.ClaimInputRA.anyUnknown
/-- info: 'GEO.rowCascadeRACore' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.rowCascadeRACore
/-- info: 'GEO.rowCascadeRA' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.rowCascadeRA
/-- info: 'GEO.unknown_routes_open_ra' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.unknown_routes_open_ra
/-- info: 'GEO.raDecode' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.raDecode
/-- info: 'GEO.raBattery' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.raBattery
/-- info: 'GEO.ra_battery_f2' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.ra_battery_f2
/-- info: 'GEO.ra_ledger_refused' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.ra_ledger_refused
/-- info: 'GEO.ra_ledger_iii' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.ra_ledger_iii
/-- info: 'GEO.ra_ledger_ii' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.ra_ledger_ii
/-- info: 'GEO.ra_ledger_void' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.ra_ledger_void
/-- info: 'GEO.ra_ledger_aGivenRA' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.ra_ledger_aGivenRA
/-- info: 'GEO.RAVerdict.toToken' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.RAVerdict.toToken
/-- info: 'GEO.GolToken.toToken' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.GolToken.toToken
/-- info: 'GEO.gateScreenToken' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.gateScreenToken
/-- info: 'GEO.demoInputA' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.demoInputA
/-- info: 'GEO.demoInputVoid' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.demoInputVoid
/-- info: 'GEO.demoInputOpen' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.demoInputOpen
/-- info: 'ROOT.Actuates' depends on axioms: [ROOT.U, ROOT.ΔE] -/
#guard_msgs in #print axioms ROOT.Actuates
/-- info: 'ROOT.actuation_universal' depends on axioms: [ROOT.RA, ROOT.U, ROOT.ΔE] -/
#guard_msgs in #print axioms ROOT.actuation_universal
/-- info: 'ROOT.raClaim' depends on axioms: [ROOT.RA, ROOT.U, ROOT.ΔE] -/
#guard_msgs in #print axioms ROOT.raClaim
/-- info: 'ROOT.boolCut' does not depend on any axioms -/
#guard_msgs in #print axioms ROOT.boolCut
/-- info: 'ROOT.nest_31' depends on axioms: [ROOT.FormalDomain, ROOT.L1m, ROOT.L3m, ROOT.nest_21, ROOT.nest_32] -/
#guard_msgs in #print axioms ROOT.nest_31
/-- info: 'ROOT.nestClaim' depends on axioms: [ROOT.FormalDomain, ROOT.L1m, ROOT.L3m, ROOT.nest_21, ROOT.nest_32] -/
#guard_msgs in #print axioms ROOT.nestClaim
/-- info: 'ROOT.throneEmpty' depends on axioms: [ROOT.U, ROOT.ΔE] -/
#guard_msgs in #print axioms ROOT.throneEmpty
/-- info: 'ROOT.throne_is_RA' depends on axioms: [ROOT.U, ROOT.ΔE] -/
#guard_msgs in #print axioms ROOT.throne_is_RA
/-- info: 'SEALS.sealL' does not depend on any axioms -/
#guard_msgs in #print axioms SEALS.sealL
/-- info: 'SEALS.sealG' depends on axioms: [ROOT.RA, ROOT.U, ROOT.ΔE] -/
#guard_msgs in #print axioms SEALS.sealG
/-- info: 'SEALS.sealM' does not depend on any axioms -/
#guard_msgs in #print axioms SEALS.sealM
/-- info: 'SEALS.seals_distinct' does not depend on any axioms -/
#guard_msgs in #print axioms SEALS.seals_distinct
/-- info: 'SEALS.seal_names_match' depends on axioms: [ROOT.RA, ROOT.U, ROOT.ΔE] -/
#guard_msgs in #print axioms SEALS.seal_names_match
/-- info: 'SEALS.sealG_walk' depends on axioms: [propext] -/
#guard_msgs in #print axioms SEALS.sealG_walk
/-- info: 'POSTULATE.OneCut' depends on axioms: [POSTULATE.Row, POSTULATE.SupplyClean] -/
#guard_msgs in #print axioms POSTULATE.OneCut
/-- info: 'POSTULATE.F2' depends on axioms: [POSTULATE.Row, POSTULATE.SupplyClean] -/
#guard_msgs in #print axioms POSTULATE.F2
/-- info: 'POSTULATE.F2_kills' depends on axioms: [POSTULATE.Row, POSTULATE.SupplyClean] -/
#guard_msgs in #print axioms POSTULATE.F2_kills
/-- info: 'POSTULATE.BSDContract' depends on axioms: [POSTULATE.Algorithm, POSTULATE.FrozenData, POSTULATE.certifiedPairing] -/
#guard_msgs in #print axioms POSTULATE.BSDContract
/-- info: 'POSTULATE.F6' depends on axioms: [POSTULATE.Algorithm, POSTULATE.FrozenData, POSTULATE.certifiedPairing] -/
#guard_msgs in #print axioms POSTULATE.F6
/-- info: 'TONGUE.enlarge' does not depend on any axioms -/
#guard_msgs in #print axioms TONGUE.enlarge
/-- info: 'TONGUE.unclosed' does not depend on any axioms -/
#guard_msgs in #print axioms TONGUE.unclosed
/-- info: 'TONGUE.earned_freedom' does not depend on any axioms -/
#guard_msgs in #print axioms TONGUE.earned_freedom
/-- info: 'TONGUE.colocClaim' depends on axioms: [ROOT.RA, ROOT.U, ROOT.ΔE] -/
#guard_msgs in #print axioms TONGUE.colocClaim
/-- info: 'TONGUE.coloc_grade' depends on axioms: [ROOT.RA, ROOT.U, ROOT.ΔE] -/
#guard_msgs in #print axioms TONGUE.coloc_grade
/-- info: 'TONGUE.ra_grade_pinned' depends on axioms: [ROOT.RA, ROOT.U, ROOT.ΔE] -/
#guard_msgs in #print axioms TONGUE.ra_grade_pinned
/-- info: 'TONGUE.wall_grade_pinned' does not depend on any axioms -/
#guard_msgs in #print axioms TONGUE.wall_grade_pinned
/-- info: 'TONGUE.inversion_grade_pinned' does not depend on any axioms -/
#guard_msgs in #print axioms TONGUE.inversion_grade_pinned
/-- info: 'TONGUE.nest_grade_pinned' depends on axioms: [ROOT.FormalDomain, ROOT.L1m, ROOT.L3m, ROOT.nest_21, ROOT.nest_32] -/
#guard_msgs in #print axioms TONGUE.nest_grade_pinned
/-- info: 'terminalWall' does not depend on any axioms -/
#guard_msgs in #print axioms terminalWall
/-- info: 'terminalPrice' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms terminalPrice
/-- info: 'TERMINAL' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms TERMINAL
/-- info: 'terminalClaim' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms terminalClaim
/-- info: 'terminal_grade_pinned' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms terminal_grade_pinned
/-- info: 'IAM.iamToken' does not depend on any axioms -/
#guard_msgs in #print axioms IAM.iamToken
/-- info: 'IAM.iam_unwitnessed_withheld' does not depend on any axioms -/
#guard_msgs in #print axioms IAM.iam_unwitnessed_withheld
/-- info: 'IAM.iam_witnessed_speaks' does not depend on any axioms -/
#guard_msgs in #print axioms IAM.iam_witnessed_speaks
/-- info: 'IAM.narcissus_truth_table' does not depend on any axioms -/
#guard_msgs in #print axioms IAM.narcissus_truth_table
/-- info: 'IAM.one_bit_freedom' does not depend on any axioms -/
#guard_msgs in #print axioms IAM.one_bit_freedom
/-- info: 'IAM.IamToken.toToken' does not depend on any axioms -/
#guard_msgs in #print axioms IAM.IamToken.toToken
/-- info: 'IAM.codexSelfRead' does not depend on any axioms -/
#guard_msgs in #print axioms IAM.codexSelfRead
/-- info: 'IAM.codex_self_read_interior' does not depend on any axioms -/
#guard_msgs in #print axioms IAM.codex_self_read_interior
/-- info: 'IAM.terminalWord' does not depend on any axioms -/
#guard_msgs in #print axioms IAM.terminalWord
/-- info: 'IAM.terminal_word' does not depend on any axioms -/
#guard_msgs in #print axioms IAM.terminal_word
/-- info: 'GEO.SignPattern' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.SignPattern
/-- info: 'GEO.allSigns' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.allSigns
/-- info: 'GEO.signComp' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.signComp
/-- info: 'GEO.reflection_eight' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.reflection_eight
/-- info: 'GEO.reflection_eight_is_two_cubed' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.reflection_eight_is_two_cubed
/-- info: 'GEO.reflections_abelian' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.reflections_abelian
/-- info: 'GEO.reflections_involutive' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.reflections_involutive
/-- info: 'GEO.signVal' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.signVal
/-- info: 'GEO.reflMat' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.reflMat
/-- info: 'GEO.reflection_reverses_orientation' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.reflection_reverses_orientation
/-- info: 'GEO.sandwich' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.sandwich
/-- info: 'GEO.reflection_blind_executed' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.reflection_blind_executed
/-- info: 'GEO.V5' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.V5
/-- info: 'GEO.cube5' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.cube5
/-- info: 'GEO.neighbors5' does not depend on any axioms -/
#guard_msgs in #print axioms GEO.neighbors5
/-- info: 'GEO.fivecube_thirtytwo' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.fivecube_thirtytwo
/-- info: 'GEO.fivecube_vertices_distinct' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.fivecube_vertices_distinct
/-- info: 'GEO.fivecube_degree_five' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.fivecube_degree_five
/-- info: 'GEO.counts_forced' depends on axioms: [propext] -/
#guard_msgs in #print axioms GEO.counts_forced
/-- info: 'TONGUE.deletionOp' depends on axioms: [propext] -/
#guard_msgs in #print axioms TONGUE.deletionOp
/-- info: 'TONGUE.e3' depends on axioms: [propext] -/
#guard_msgs in #print axioms TONGUE.e3
/-- info: 'TONGUE.deletion_idempotent' depends on axioms: [propext] -/
#guard_msgs in #print axioms TONGUE.deletion_idempotent
/-- info: 'TONGUE.deletion_singular' depends on axioms: [propext] -/
#guard_msgs in #print axioms TONGUE.deletion_singular
/-- info: 'TONGUE.deletion_minor_nonsingular' depends on axioms: [propext] -/
#guard_msgs in #print axioms TONGUE.deletion_minor_nonsingular
/-- info: 'TONGUE.deletion_annihilates' depends on axioms: [propext] -/
#guard_msgs in #print axioms TONGUE.deletion_annihilates
/-- info: 'TONGUE.linear_fixes_zero' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms TONGUE.linear_fixes_zero
/-- info: 'TONGUE.deletion_no_left_inverse' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms TONGUE.deletion_no_left_inverse
/-- info: 'TONGUE.deletion_monoid_not_group' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms TONGUE.deletion_monoid_not_group
/-- info: 'TONGUE.tongue_obedience' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms TONGUE.tongue_obedience
/-- info: 'OFFICE.discriminator' does not depend on any axioms -/
#guard_msgs in #print axioms OFFICE.discriminator
/-- info: 'OFFICE.discriminatorQ2First' does not depend on any axioms -/
#guard_msgs in #print axioms OFFICE.discriminatorQ2First
/-- info: 'OFFICE.order_loadbearing' does not depend on any axioms -/
#guard_msgs in #print axioms OFFICE.order_loadbearing
/-- info: 'OFFICE.citation_cannot_promote' does not depend on any axioms -/
#guard_msgs in #print axioms OFFICE.citation_cannot_promote
/-- info: 'UC.routeHalt' does not depend on any axioms -/
#guard_msgs in #print axioms UC.routeHalt
/-- info: 'UC.routeHalt_fidelity' does not depend on any axioms -/
#guard_msgs in #print axioms UC.routeHalt_fidelity
/-- info: 'UC.universalCascade' does not depend on any axioms -/
#guard_msgs in #print axioms UC.universalCascade
/-- info: 'UC.uc_seal_failure_terminal' does not depend on any axioms -/
#guard_msgs in #print axioms UC.uc_seal_failure_terminal
/-- info: 'UC.uc_routes_eight' does not depend on any axioms -/
#guard_msgs in #print axioms UC.uc_routes_eight
/-- info: 'UC.uc_routes_five' does not depend on any axioms -/
#guard_msgs in #print axioms UC.uc_routes_five
/-- info: 'UC.uc_unmeasured' does not depend on any axioms -/
#guard_msgs in #print axioms UC.uc_unmeasured
/-- info: 'UC.circularityScreen' does not depend on any axioms -/
#guard_msgs in #print axioms UC.circularityScreen
/-- info: 'UC.circularity_refused_at_target' does not depend on any axioms -/
#guard_msgs in #print axioms UC.circularity_refused_at_target
/-- info: 'UC.road_requires_conjunction' does not depend on any axioms -/
#guard_msgs in #print axioms UC.road_requires_conjunction
/-- info: 'UC.circRows' does not depend on any axioms -/
#guard_msgs in #print axioms UC.circRows
/-- info: 'UC.circ_space' does not depend on any axioms -/
#guard_msgs in #print axioms UC.circ_space
/-- info: 'OMEGA.kbRat' depends on axioms: [propext] -/
#guard_msgs in #print axioms OMEGA.kbRat
/-- info: 'OMEGA.ln2Rat' depends on axioms: [propext] -/
#guard_msgs in #print axioms OMEGA.ln2Rat
/-- info: 'OMEGA.landauerRat' depends on axioms: [propext] -/
#guard_msgs in #print axioms OMEGA.landauerRat
/-- info: 'OMEGA.omegaBoundary' depends on axioms: [propext] -/
#guard_msgs in #print axioms OMEGA.omegaBoundary
/-- info: 'OMEGA.omega_zero_bits' depends on axioms: [propext] -/
#guard_msgs in #print axioms OMEGA.omega_zero_bits
/-- info: 'OMEGA.omega_paid_floor' depends on axioms: [propext] -/
#guard_msgs in #print axioms OMEGA.omega_paid_floor
/-- info: 'OMEGA.one_bit_freedom_priced' depends on axioms: [propext] -/
#guard_msgs in #print axioms OMEGA.one_bit_freedom_priced
/-- info: 'OMEGA.omega_reversible_branch' depends on axioms: [propext] -/
#guard_msgs in #print axioms OMEGA.omega_reversible_branch
/-- info: 'OMEGA.omega_refuses_nonpositive_temp' depends on axioms: [propext] -/
#guard_msgs in #print axioms OMEGA.omega_refuses_nonpositive_temp
/-- info: 'OMEGA.omega_monotone' depends on axioms: [propext] -/
#guard_msgs in #print axioms OMEGA.omega_monotone
/-- info: 'OMEGA.omega_linear' depends on axioms: [propext] -/
#guard_msgs in #print axioms OMEGA.omega_linear
/-- info: 'OMEGA.landauer_zero_bits' depends on axioms: [propext] -/
#guard_msgs in #print axioms OMEGA.landauer_zero_bits
/-- info: 'OMEGA.omega_verdict_fidelity' depends on axioms: [propext] -/
#guard_msgs in #print axioms OMEGA.omega_verdict_fidelity
/-- info: 'AEGIS.refusalConst' does not depend on any axioms -/
#guard_msgs in #print axioms AEGIS.refusalConst
/-- info: 'AEGIS.aegisReset' does not depend on any axioms -/
#guard_msgs in #print axioms AEGIS.aegisReset
/-- info: 'AEGIS.aegisGuard' does not depend on any axioms -/
#guard_msgs in #print axioms AEGIS.aegisGuard
/-- info: 'AEGIS.aegis_constant' does not depend on any axioms -/
#guard_msgs in #print axioms AEGIS.aegis_constant
/-- info: 'AEGIS.aegis_deed_increments' does not depend on any axioms -/
#guard_msgs in #print axioms AEGIS.aegis_deed_increments
/-- info: 'AEGIS.aegis_reads_parameter' does not depend on any axioms -/
#guard_msgs in #print axioms AEGIS.aegis_reads_parameter
/-- info: 'AEGIS.aegisFourLogicRun' does not depend on any axioms -/
#guard_msgs in #print axioms AEGIS.aegisFourLogicRun
/-- info: 'AEGIS.aegis_battery' does not depend on any axioms -/
#guard_msgs in #print axioms AEGIS.aegis_battery
/-- info: 'NOMOS.allStrings' does not depend on any axioms -/
#guard_msgs in #print axioms NOMOS.allStrings
/-- info: 'NOMOS.allStrings_length' depends on axioms: [propext] -/
#guard_msgs in #print axioms NOMOS.allStrings_length
/-- info: 'NOMOS.twoPowPos' does not depend on any axioms -/
#guard_msgs in #print axioms NOMOS.twoPowPos
/-- info: 'NOMOS.descs' does not depend on any axioms -/
#guard_msgs in #print axioms NOMOS.descs
/-- info: 'NOMOS.descs_length' depends on axioms: [propext] -/
#guard_msgs in #print axioms NOMOS.descs_length
/-- info: 'NOMOS.incompressibility_cap' depends on axioms: [propext] -/
#guard_msgs in #print axioms NOMOS.incompressibility_cap
/-- info: 'NOMOS.nomosRows' does not depend on any axioms -/
#guard_msgs in #print axioms NOMOS.nomosRows
/-- info: 'NOMOS.incompressibility_executed' does not depend on any axioms -/
#guard_msgs in #print axioms NOMOS.incompressibility_executed
/-- info: 'NOMOS.decodeId' does not depend on any axioms -/
#guard_msgs in #print axioms NOMOS.decodeId
/-- info: 'NOMOS.decodePad' does not depend on any axioms -/
#guard_msgs in #print axioms NOMOS.decodePad
/-- info: 'NOMOS.compressible_bound_universal' depends on axioms: [propext] -/
#guard_msgs in #print axioms NOMOS.compressible_bound_universal
/-- info: 'NOMOS.cbUniversal' depends on axioms: [propext] -/
#guard_msgs in #print axioms NOMOS.cbUniversal
/-- info: 'NOMOS.cb_id_8_2' does not depend on any axioms -/
#guard_msgs in #print axioms NOMOS.cb_id_8_2
/-- info: 'NOMOS.cb_pad3_8_2' does not depend on any axioms -/
#guard_msgs in #print axioms NOMOS.cb_pad3_8_2
/-- info: 'NOMOS.cb_pad2_6_1' does not depend on any axioms -/
#guard_msgs in #print axioms NOMOS.cb_pad2_6_1
/-- info: 'NOMOS.cb_pad4_12_3' does not depend on any axioms -/
#guard_msgs in #print axioms NOMOS.cb_pad4_12_3
/-- info: 'NOMOS.recoverable' depends on axioms: [propext] -/
#guard_msgs in #print axioms NOMOS.recoverable
/-- info: 'NOMOS.nomos_fuel_is_omega_floor' depends on axioms: [propext] -/
#guard_msgs in #print axioms NOMOS.nomos_fuel_is_omega_floor
/-- info: 'NOMOS.nomosScreen' does not depend on any axioms -/
#guard_msgs in #print axioms NOMOS.nomosScreen
/-- info: 'NOMOS.nomosScreen_battery' does not depend on any axioms -/
#guard_msgs in #print axioms NOMOS.nomosScreen_battery
/-- info: 'BRIDGE.ceiling' does not depend on any axioms -/
#guard_msgs in #print axioms BRIDGE.ceiling
/-- info: 'BRIDGE.census' does not depend on any axioms -/
#guard_msgs in #print axioms BRIDGE.census
/-- info: 'BRIDGE.census_count' does not depend on any axioms -/
#guard_msgs in #print axioms BRIDGE.census_count
/-- info: 'BRIDGE.post_seal_disposition' does not depend on any axioms -/
#guard_msgs in #print axioms BRIDGE.post_seal_disposition
/-- info: 'BRIDGE.weakest_never_above_left' does not depend on any axioms -/
#guard_msgs in #print axioms BRIDGE.weakest_never_above_left
/-- info: 'BRIDGE.bridge_ceiling_caps' does not depend on any axioms -/
#guard_msgs in #print axioms BRIDGE.bridge_ceiling_caps
/-- info: 'BRIDGE.successorOf' does not depend on any axioms -/
#guard_msgs in #print axioms BRIDGE.successorOf
/-- info: 'BRIDGE.supersession_routes' does not depend on any axioms -/
#guard_msgs in #print axioms BRIDGE.supersession_routes
/-- info: 'BRIDGE.bridgeScreen' does not depend on any axioms -/
#guard_msgs in #print axioms BRIDGE.bridgeScreen
/-- info: 'BRIDGE.bridgeScreen_total' does not depend on any axioms -/
#guard_msgs in #print axioms BRIDGE.bridgeScreen_total
/-- info: 'FOUND.sigmaP' depends on axioms: [propext] -/
#guard_msgs in #print axioms FOUND.sigmaP
/-- info: 'FOUND.pluralist_alternative_executed' depends on axioms: [propext] -/
#guard_msgs in #print axioms FOUND.pluralist_alternative_executed
/-- info: 'FOUND.posits' does not depend on any axioms -/
#guard_msgs in #print axioms FOUND.posits
/-- info: 'FOUND.posits_loadbearing_on_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms FOUND.posits_loadbearing_on_nothing
/-- info: 'FOUND.gradeOfRank' does not depend on any axioms -/
#guard_msgs in #print axioms FOUND.gradeOfRank
/-- info: 'FOUND.posit_never_raises' does not depend on any axioms -/
#guard_msgs in #print axioms FOUND.posit_never_raises
/-- info: 'FOUND.bandOf' does not depend on any axioms -/
#guard_msgs in #print axioms FOUND.bandOf
/-- info: 'FOUND.register_routing_fidelity' does not depend on any axioms -/
#guard_msgs in #print axioms FOUND.register_routing_fidelity
/-- info: 'FOUND.verdictInventory' does not depend on any axioms -/
#guard_msgs in #print axioms FOUND.verdictInventory
/-- info: 'FOUND.verdicts_posit_free' does not depend on any axioms -/
#guard_msgs in #print axioms FOUND.verdicts_posit_free
/-- info: 'FOUND.engine_never_authority' does not depend on any axioms -/
#guard_msgs in #print axioms FOUND.engine_never_authority
/-- info: 'HALT.cascade' does not depend on any axioms -/
#guard_msgs in #print axioms HALT.cascade
/-- info: 'HALT.patterns' depends on axioms: [propext] -/
#guard_msgs in #print axioms HALT.patterns
/-- info: 'HALT.fftSpec' does not depend on any axioms -/
#guard_msgs in #print axioms HALT.fftSpec
/-- info: 'HALT.first_failure_terminal_5' depends on axioms: [propext] -/
#guard_msgs in #print axioms HALT.first_failure_terminal_5
/-- info: 'HALT.first_failure_terminal_7' depends on axioms: [propext] -/
#guard_msgs in #print axioms HALT.first_failure_terminal_7
/-- info: 'HALT.first_failure_terminal_8' depends on axioms: [propext] -/
#guard_msgs in #print axioms HALT.first_failure_terminal_8
/-- info: 'HALT.first_failure_terminal_12' depends on axioms: [propext] -/
#guard_msgs in #print axioms HALT.first_failure_terminal_12
/-- info: 'HALT.halt_free_iff_all_pass_8' depends on axioms: [propext] -/
#guard_msgs in #print axioms HALT.halt_free_iff_all_pass_8
/-- info: 'HALT.gate_counts_recorded' depends on axioms: [propext] -/
#guard_msgs in #print axioms HALT.gate_counts_recorded
/-- info: 'HALT.signPatterns' does not depend on any axioms -/
#guard_msgs in #print axioms HALT.signPatterns
/-- info: 'HALT.ninth_gate_barred' does not depend on any axioms -/
#guard_msgs in #print axioms HALT.ninth_gate_barred
/-- info: 'HALT.route' does not depend on any axioms -/
#guard_msgs in #print axioms HALT.route
/-- info: 'HALT.ofUC' does not depend on any axioms -/
#guard_msgs in #print axioms HALT.ofUC
/-- info: 'HALT.route_is_routeHalt' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms HALT.route_is_routeHalt
/-- info: 'HALT.route_samples' does not depend on any axioms -/
#guard_msgs in #print axioms HALT.route_samples
/-- info: 'HALT.tokenBranch' does not depend on any axioms -/
#guard_msgs in #print axioms HALT.tokenBranch
/-- info: 'HALT.router_exclusive' does not depend on any axioms -/
#guard_msgs in #print axioms HALT.router_exclusive
/-- info: 'HALT.readingRoadsGate' does not depend on any axioms -/
#guard_msgs in #print axioms HALT.readingRoadsGate
/-- info: 'HALT.one_door_open' does not depend on any axioms -/
#guard_msgs in #print axioms HALT.one_door_open
/-- info: 'HALT.no_walk_passes_the_aperture' depends on axioms: [propext] -/
#guard_msgs in #print axioms HALT.no_walk_passes_the_aperture
/-- info: 'HALT.xiGates' does not depend on any axioms -/
#guard_msgs in #print axioms HALT.xiGates
/-- info: 'HALT.oGates' does not depend on any axioms -/
#guard_msgs in #print axioms HALT.oGates
/-- info: 'HALT.gate_censuses' does not depend on any axioms -/
#guard_msgs in #print axioms HALT.gate_censuses
/-- info: 'HALT.rhHalt' does not depend on any axioms -/
#guard_msgs in #print axioms HALT.rhHalt
/-- info: 'HALT.pnpHalt' does not depend on any axioms -/
#guard_msgs in #print axioms HALT.pnpHalt
/-- info: 'HALT.halts_routed' does not depend on any axioms -/
#guard_msgs in #print axioms HALT.halts_routed
/-- info: 'HALT.legacy_halts_are_instances' does not depend on any axioms -/
#guard_msgs in #print axioms HALT.legacy_halts_are_instances
/-- info: 'HALT.terminal_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms HALT.terminal_one_bit
/-- info: 'HALT.species_exhausted' does not depend on any axioms -/
#guard_msgs in #print axioms HALT.species_exhausted
/-- info: 'HALT.haltGrades' does not depend on any axioms -/
#guard_msgs in #print axioms HALT.haltGrades
/-- info: 'HALT.ftoe_ceiling' does not depend on any axioms -/
#guard_msgs in #print axioms HALT.ftoe_ceiling
/-- info: 'CROSSING.ExecFrame' does not depend on any axioms -/
#guard_msgs in #print axioms CROSSING.ExecFrame
/-- info: 'CROSSING.execFlip' does not depend on any axioms -/
#guard_msgs in #print axioms CROSSING.execFlip
/-- info: 'CROSSING.formalRead' does not depend on any axioms -/
#guard_msgs in #print axioms CROSSING.formalRead
/-- info: 'CROSSING.ran' does not depend on any axioms -/
#guard_msgs in #print axioms CROSSING.ran
/-- info: 'CROSSING.formalRead_even' does not depend on any axioms -/
#guard_msgs in #print axioms CROSSING.formalRead_even
/-- info: 'CROSSING.ran_wholly_odd' does not depend on any axioms -/
#guard_msgs in #print axioms CROSSING.ran_wholly_odd
/-- info: 'CROSSING.execFlip_involution' does not depend on any axioms -/
#guard_msgs in #print axioms CROSSING.execFlip_involution
/-- info: 'CROSSING.ran_odd_at_true' does not depend on any axioms -/
#guard_msgs in #print axioms CROSSING.ran_odd_at_true
/-- info: 'CROSSING.wall' does not depend on any axioms -/
#guard_msgs in #print axioms CROSSING.wall
/-- info: 'CROSSING.deed' does not depend on any axioms -/
#guard_msgs in #print axioms CROSSING.deed
/-- info: 'CROSSING.price' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms CROSSING.price
/-- info: 'CROSSING.crossing' does not depend on any axioms -/
#guard_msgs in #print axioms CROSSING.crossing
/-- info: 'CROSSING.identity_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms CROSSING.identity_one_bit
/-- info: 'CROSSING.fibre4' does not depend on any axioms -/
#guard_msgs in #print axioms CROSSING.fibre4
/-- info: 'CROSSING.fibre4_sixteen' does not depend on any axioms -/
#guard_msgs in #print axioms CROSSING.fibre4_sixteen
/-- info: 'CROSSING.fibre4_distinct' does not depend on any axioms -/
#guard_msgs in #print axioms CROSSING.fibre4_distinct
/-- info: 'CROSSING.price_on_this_file' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms CROSSING.price_on_this_file
/-- info: 'CROSSING.formal_never_odd' does not depend on any axioms -/
#guard_msgs in #print axioms CROSSING.formal_never_odd
/-- info: 'CROSSING.constant_no_crossing' does not depend on any axioms -/
#guard_msgs in #print axioms CROSSING.constant_no_crossing
/-- info: 'CROSSING.harmony' depends on axioms: [propext] -/
#guard_msgs in #print axioms CROSSING.harmony
/-- info: 'LOCUS.Separates' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.Separates
/-- info: 'LOCUS.Factors' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.Factors
/-- info: 'LOCUS.wall_of_sep' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.wall_of_sep
/-- info: 'LOCUS.swap' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.swap
/-- info: 'LOCUS.swap_involution' depends on axioms: [propext] -/
#guard_msgs in #print axioms LOCUS.swap_involution
/-- info: 'LOCUS.swap_record_even' depends on axioms: [propext] -/
#guard_msgs in #print axioms LOCUS.swap_record_even
/-- info: 'LOCUS.swap_flips_pair' depends on axioms: [propext] -/
#guard_msgs in #print axioms LOCUS.swap_flips_pair
/-- info: 'LOCUS.seat_of_sep' depends on axioms: [propext] -/
#guard_msgs in #print axioms LOCUS.seat_of_sep
/-- info: 'LOCUS.k4_separated_pair' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.k4_separated_pair
/-- info: 'LOCUS.k4_wall_of_pair' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.k4_wall_of_pair
/-- info: 'LOCUS.readout' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.readout
/-- info: 'LOCUS.factors_of_not_sep_list' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms LOCUS.factors_of_not_sep_list
/-- info: 'LOCUS.factors_iff_not_sep_list' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms LOCUS.factors_iff_not_sep_list
/-- info: 'LOCUS.Channel' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.Channel
/-- info: 'LOCUS.Token.toEconomy' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.Token.toEconomy
/-- info: 'LOCUS.Reading.orbits' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.Reading.orbits
/-- info: 'LOCUS.Reading.owed' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.Reading.owed
/-- info: 'LOCUS.Reading.complete' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.Reading.complete
/-- info: 'LOCUS.branchOf' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.branchOf
/-- info: 'LOCUS.emit' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.emit
/-- info: 'LOCUS.Reading.state' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.Reading.state
/-- info: 'LOCUS.three_states' depends on axioms: [propext] -/
#guard_msgs in #print axioms LOCUS.three_states
/-- info: 'LOCUS.no_seat_no_locus' depends on axioms: [propext] -/
#guard_msgs in #print axioms LOCUS.no_seat_no_locus
/-- info: 'LOCUS.unlocated_is_plain_open' depends on axioms: [propext] -/
#guard_msgs in #print axioms LOCUS.unlocated_is_plain_open
/-- info: 'LOCUS.located_never_silent' depends on axioms: [propext] -/
#guard_msgs in #print axioms LOCUS.located_never_silent
/-- info: 'LOCUS.crossed_requires_complete' depends on axioms: [propext] -/
#guard_msgs in #print axioms LOCUS.crossed_requires_complete
/-- info: 'LOCUS.crossed_requires_channel' depends on axioms: [propext] -/
#guard_msgs in #print axioms LOCUS.crossed_requires_channel
/-- info: 'LOCUS.halt_carries_owed' depends on axioms: [propext] -/
#guard_msgs in #print axioms LOCUS.halt_carries_owed
/-- info: 'LOCUS.unchannelled_is_halt' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms LOCUS.unchannelled_is_halt
/-- info: 'LOCUS.halt_reports_owed' depends on axioms: [propext] -/
#guard_msgs in #print axioms LOCUS.halt_reports_owed
/-- info: 'LOCUS.owed_zero_is_unchannelled' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms LOCUS.owed_zero_is_unchannelled
/-- info: 'LOCUS.one_bit_apart' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.one_bit_apart
/-- info: 'LOCUS.legacy_xi' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.legacy_xi
/-- info: 'LOCUS.legacy_o' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.legacy_o
/-- info: 'LOCUS.legacy_bare' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.legacy_bare
/-- info: 'LOCUS.k4_locus' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.k4_locus
/-- info: 'LOCUS.slotLists' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.slotLists
/-- info: 'LOCUS.slotLists_twelve' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.slotLists_twelve
/-- info: 'LOCUS.slotLists_pos' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.slotLists_pos
/-- info: 'LOCUS.allReadings' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.allReadings
/-- info: 'LOCUS.reading_space' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.reading_space
/-- info: 'LOCUS.census_no_seat_no_locus' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.census_no_seat_no_locus
/-- info: 'LOCUS.census_located_never_silent' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.census_located_never_silent
/-- info: 'LOCUS.census_crossed_iff_complete_channelled' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.census_crossed_iff_complete_channelled
/-- info: 'LOCUS.census_halt_reports_owed' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.census_halt_reports_owed
/-- info: 'LOCUS.census_owed_zero_is_unchannelled' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.census_owed_zero_is_unchannelled
/-- info: 'LOCUS.census_three_states' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.census_three_states
/-- info: 'LOCUS.Token.render' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.Token.render
/-- info: 'LOCUS.Token.ascii' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.Token.ascii
/-- info: 'LOCUS.sealAscii' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.sealAscii
/-- info: 'LOCUS.render_receipted' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.render_receipted
/-- info: 'LOCUS.render_injective_in_owed' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.render_injective_in_owed
/-- info: 'LOCUS.voidImage' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.voidImage
/-- info: 'LOCUS.void_precedes_economy' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.void_precedes_economy
/-- info: 'LOCUS.legacy_records_not_promoted' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.legacy_records_not_promoted
/-- info: 'LOCUS.no_rh_locus' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.no_rh_locus
/-- info: 'PSP.ORIENT.V3' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.ORIENT.V3
/-- info: 'PSP.ORIENT.M3' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.ORIENT.M3
/-- info: 'PSP.ORIENT.det3' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.ORIENT.det3
/-- info: 'PSP.ORIENT.neg3' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.ORIENT.neg3
/-- info: 'PSP.ORIENT.signMatrices' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.ORIENT.signMatrices
/-- info: 'PSP.ORIENT.lock_scalar_sign_blind' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.ORIENT.lock_scalar_sign_blind
/-- info: 'PSP.ORIENT.det_sign_flips_in_odd_dimension' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.ORIENT.det_sign_flips_in_odd_dimension
/-- info: 'PSP.QUAT.Q' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.Q
/-- info: 'PSP.QUAT.qmul' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.qmul
/-- info: 'PSP.QUAT.qi' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.qi
/-- info: 'PSP.QUAT.qj' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.qj
/-- info: 'PSP.QUAT.qk' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.qk
/-- info: 'PSP.QUAT.qneg1' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.qneg1
/-- info: 'PSP.QUAT.quat_basis_laws' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.quat_basis_laws
/-- info: 'PSP.QUAT.qnorm' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.qnorm
/-- info: 'PSP.QUAT.isInt' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.isInt
/-- info: 'PSP.QUAT.isHalf' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.isHalf
/-- info: 'PSP.QUAT.hurwitzOK' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.hurwitzOK
/-- info: 'PSP.QUAT.grid' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.grid
/-- info: 'PSP.QUAT.tuples4' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.tuples4
/-- info: 'PSP.QUAT.hurwitz_units_24' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.hurwitz_units_24
/-- info: 'PSP.QUAT.grid2' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.grid2
/-- info: 'PSP.QUAT.tuples4i' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.tuples4i
/-- info: 'PSP.QUAT.norm2_shell_split' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.QUAT.norm2_shell_split
/-- info: 'PSP.CD.cdconj' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.cdconj
/-- info: 'PSP.CD.padd' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.padd
/-- info: 'PSP.CD.psub' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.psub
/-- info: 'PSP.CD.cdmul' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.cdmul
/-- info: 'PSP.CD.e' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.e
/-- info: 'PSP.CD.smul' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.smul
/-- info: 'PSP.CD.octonion_associator' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.octonion_associator
/-- info: 'PSP.CD.sx' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.sx
/-- info: 'PSP.CD.sy' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.sy
/-- info: 'PSP.CD.zero16' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.zero16
/-- info: 'PSP.CD.sqnorm' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.sqnorm
/-- info: 'PSP.CD.sedenion_zero_divisor' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CD.sedenion_zero_divisor
/-- info: 'PSP.CASCADE.cascade' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.CASCADE.cascade
/-- info: 'PSP.CASCADE.patterns8' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CASCADE.patterns8
/-- info: 'PSP.CASCADE.spec' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.CASCADE.spec
/-- info: 'PSP.CASCADE.first_failure_terminal_8' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CASCADE.first_failure_terminal_8
/-- info: 'PSP.CASCADE.halt_free_iff_all_pass_8' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.CASCADE.halt_free_iff_all_pass_8
/-- info: 'PSP.GROUNDLESS.o0Neighbors' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.GROUNDLESS.o0Neighbors
/-- info: 'PSP.GROUNDLESS.fiveCubeCoords' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.GROUNDLESS.fiveCubeCoords
/-- info: 'PSP.GROUNDLESS.deg5' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.GROUNDLESS.deg5
/-- info: 'PSP.GROUNDLESS.groundless_cascade_degree' depends on axioms: [propext] -/
#guard_msgs in #print axioms PSP.GROUNDLESS.groundless_cascade_degree
/-- info: 'PSP.TOKEN.level' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.TOKEN.level
/-- info: 'PSP.TOKEN.terminal_tokens_level_and_distinct' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.TOKEN.terminal_tokens_level_and_distinct
/-- info: 'PSP.TWOGROUP.two_group_census' does not depend on any axioms -/
#guard_msgs in #print axioms PSP.TWOGROUP.two_group_census

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
/-- info: 'Bridge.Plane' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.Plane
/-- info: 'Bridge.τ' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.τ
/-- info: 'Bridge.onLine' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.onLine
/-- info: 'Bridge.LineProperty' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.LineProperty
/-- info: 'Bridge.planeFrame' depends on axioms: [propext] -/
#guard_msgs in #print axioms Bridge.planeFrame
/-- info: 'Bridge.lineFrame' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms Bridge.lineFrame
/-- info: 'Bridge.theRecord' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.theRecord
/-- info: 'Bridge.delete' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.delete
/-- info: 'Bridge.Even' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.Even
/-- info: 'Bridge.SelfVerifying' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.SelfVerifying
/-- info: 'Bridge.twoPoint' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.twoPoint
/-- info: 'Bridge.Keyless' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.Keyless
/-- info: 'Bridge.Keyed' does not depend on any axioms -/
#guard_msgs in #print axioms Bridge.Keyed

theorem codexCone : True :=
  let _ := @Nat.factorial
  let _ := @CoreRat.div_pos_of_le
  let _ := @CoreRat.div_gcd_pos
  let _ := @CoreRat.coprime_div_gcd
  let _ := @Ratio.natAbs_signed
  let _ := @Ratio.«mk'»
  let _ := @Ratio.instOfNatRat
  let _ := @Ratio.instAddRat
  let _ := @Ratio.instMulRat
  let _ := @Ratio.instNegRat
  let _ := @Ratio.instSubRat
  let _ := @Ratio.inv
  let _ := @Ratio.instDivRat
  let _ := @Ratio.instLTRat
  let _ := @Ratio.instLERat
  let _ := @Ratio.instDecidableLtRat
  let _ := @Ratio.instDecidableLeRat
  let _ := @Ratio.pow
  let _ := @Ratio.instHPowRatNat
  let _ := @Ratio.instToStringRat
  let _ := @Ratio.num_zero
  let _ := @Ratio.den_zero
  let _ := @Ratio.«mk'_zero_num»
  let _ := @Ratio.zero_mul
  let _ := @Ratio.mul_zero
  let _ := @Ratio.canonical
  let _ := @Ratio.ext
  let _ := @Ratio.inv_zero
  let _ := @Grade.rank
  let _ := @Grade.weakest
  let _ := @Grade.weakest_is_a_link
  let _ := @Grade.weakest_idempotent
  let _ := @Claim.join
  let _ := @Claim.join_grade
  let _ := @deltaM
  let _ := @socialWeight
  let _ := @FTOE.Even
  let _ := @FTOE.OddAt
  let _ := @FTOE.WhollyOdd
  let _ := @FTOE.T1_wall
  let _ := @FTOE.T2_coalition
  let _ := @FTOE.T3_no_fixed_point
  let _ := @FTOE.T4_one_bit
  let _ := @FTOE.T5_crossing
  let _ := @FTOE.T6a_deed_anchor
  let _ := @FTOE.T6b_deed_supply
  let _ := @FTOE.fTOE_port
  let _ := @FTOE.Involution
  let _ := @FTOE.FixedPointFree
  let _ := @FTOE.T7_global_wall
  let _ := @FTOE.T8_torsor_forward
  let _ := @FTOE.T8_torsor_backward
  let _ := @FTOE.T9_torsor_inverse_left
  let _ := @FTOE.T9_torsor_inverse_right
  let _ := @FTOE.T10_factorization
  let _ := @FTOE.T11_separation
  let _ := @FTOE.T12_encoder_injective
  let _ := @FTOE.T14_wall_factorization
  let _ := @FTOE.T13_wholly_odd_is_odd_everywhere
  let _ := @FTOE.flipF
  let _ := @FTOE.T15_price_bijection_forward
  let _ := @FTOE.T15_price_bijection_backward
  let _ := @FTOE.fTOE_core
  let _ := @FTOE.OrbitRel
  let _ := @FTOE.OrbitRel_symmetric
  let _ := @FTOE.Dtau
  let _ := @FTOE.calib
  let _ := @FTOE.calib_even
  let _ := @FTOE.descend
  let _ := @FTOE.priceForward
  let _ := @FTOE.priceBackward
  let _ := @FTOE.T16_left_inverse
  let _ := @FTOE.T16_right_inverse
  let _ := @FTOE.T16_price_bijection
  let _ := @FTOE.canonD0
  let _ := @FTOE.flipF_involution
  let _ := @FTOE.T16_canonical
  let _ := @FTOE.T17_odd_everywhere_iff_wholly_odd
  let _ := @K4.val
  let _ := @K4.tau
  let _ := @K4.target
  let _ := @K4.rho
  let _ := @K4.tau_involution
  let _ := @K4.tau_fixed_point_free
  let _ := @K4.target_wholly_odd
  let _ := @K4.register_even
  let _ := @K4.val_lifts_mod_210
  let _ := @K4.wall
  let _ := @K4.pair_distinct
  let _ := @K4.price_one_bit
  let _ := @K4.price_full_fibre
  let _ := @K4.wallClaim
  let _ := @Audit.Ans.toBool
  let _ := @Audit.ClaimInput.anyUnknown
  let _ := @Audit.sealL
  let _ := @Audit.DrillInput.anyUnknown
  let _ := @Audit.drillScreen
  let _ := @Audit.refusalGates
  let _ := @Audit.compartmentGates
  let _ := @Audit.auditClaim
  let _ := @Audit.compartmentGrade
  let _ := @Audit.unknown_routes_open
  let _ := @Audit.contentless_refused
  let _ := @Audit.det3
  let _ := @Audit.det3_two_id
  let _ := @INVERSION.ItFromBit
  let _ := @INVERSION.it_from_bit_refuted
  let _ := @INVERSION.it_from_it
  let _ := @K4.it_from_it_canonical
  let _ := @K4.it_from_bit_refuted_canonical
  let _ := @K4.inversionClaim
  let _ := @GEO.qmul
  let _ := @GEO.qconj
  let _ := @GEO.qadd
  let _ := @GEO.qsub
  let _ := @GEO.qnorm2
  let _ := @GEO.qhalve
  let _ := @GEO.qquarter
  let _ := @GEO.qcanon
  let _ := @GEO.q1
  let _ := @GEO.qi
  let _ := @GEO.qj
  let _ := @GEO.qk
  let _ := @GEO.chirality
  let _ := @GEO.noncommutative
  let _ := @GEO.hurwitz
  let _ := @GEO.hurwitz_norm
  let _ := @GEO.hurwitz_products_even
  let _ := @GEO.hurwitz_closed
  let _ := @GEO.hurwitzReps
  let _ := @GEO.units_mod_sign_twelve
  let _ := @GEO.conjClass
  let _ := @GEO.classSizesAux
  let _ := @GEO.insNat
  let _ := @GEO.insSort
  let _ := @GEO.class_equation
  let _ := @GEO.shell2
  let _ := @GEO.shell_twentyfour
  let _ := @GEO.no_half_integer_norm2
  let _ := @GEO.allGates
  let _ := @GEO.gates_twelve
  let _ := @GEO.gates_valid
  let _ := @GEO.gates_complete
  let _ := @GEO.invCount
  let _ := @GEO.perms24
  let _ := @GEO.a4
  let _ := @GEO.a4_order
  let _ := @GEO.actG
  let _ := @GEO.a4_simply_transitive
  let _ := @GEO.tetraVerts
  let _ := @GEO.tetraEdges
  let _ := @GEO.tetraFaces
  let _ := @GEO.euler_closure
  let _ := @GEO.basisU
  let _ := @GEO.perms6
  let _ := @GEO.relabel_parity
  let _ := @GEO.O8
  let _ := @GEO.omul
  let _ := @GEO.osub
  let _ := @GEO.onorm2
  let _ := @GEO.e8
  let _ := @GEO.octonion_associator
  let _ := @GEO.hPairs
  let _ := @GEO.norm_composition_H
  let _ := @GEO.oPairs
  let _ := @GEO.norm_composition_O
  let _ := @GEO.det2
  let _ := @GEO.gf2Mul
  let _ := @GEO.gf2Vecs
  let _ := @GEO.gf2Sols
  let _ := @GEO.triaxial_lock_gf2
  let _ := @GEO.triaxial_lock_gf2_count
  let _ := @GEO.triaxial_open_gf2_count
  let _ := @GEO.V3
  let _ := @GEO.M3
  let _ := @GEO.det3
  let _ := @GEO.adj3
  let _ := @GEO.mm3
  let _ := @GEO.diag3
  let _ := @GEO.mv3
  let _ := @GEO.vscale
  let _ := @GEO.V3Z
  let _ := @GEO.M3Z
  let _ := @GEO.det3Z
  let _ := @GEO.adj3Z
  let _ := @GEO.mm3Z
  let _ := @GEO.diag3Z
  let _ := @GEO.adjugate_identity_int
  let _ := @GEO.AdjugateIdentity3
  let _ := @GEO.adj3Samples
  let _ := @GEO.adj3_executed
  let _ := @GEO.cramerSolve
  let _ := @GEO.cramer_executed
  let _ := @GEO.golAdmit
  let _ := @GEO.gateNames
  let _ := @GEO.gateNames_twelve
  let _ := @GEO.gateScreenGo
  let _ := @GEO.gateScreen
  let _ := @GEO.gateScreen_clean
  let _ := @GEO.gateScreen_first_failure
  let _ := @GEO.gateScreen_names_failed_gate
  let _ := @GEO.gateScreen_arity
  let _ := @GEO.ClaimInputRA.anyUnknown
  let _ := @GEO.rowCascadeRACore
  let _ := @GEO.rowCascadeRA
  let _ := @GEO.unknown_routes_open_ra
  let _ := @GEO.raDecode
  let _ := @GEO.raBattery
  let _ := @GEO.ra_battery_f2
  let _ := @GEO.ra_ledger_refused
  let _ := @GEO.ra_ledger_iii
  let _ := @GEO.ra_ledger_ii
  let _ := @GEO.ra_ledger_void
  let _ := @GEO.ra_ledger_aGivenRA
  let _ := @GEO.RAVerdict.toToken
  let _ := @GEO.GolToken.toToken
  let _ := @GEO.gateScreenToken
  let _ := @GEO.demoInputA
  let _ := @GEO.demoInputVoid
  let _ := @GEO.demoInputOpen
  let _ := @ROOT.Actuates
  let _ := @ROOT.actuation_universal
  let _ := @ROOT.raClaim
  let _ := @ROOT.boolCut
  let _ := @ROOT.nest_31
  let _ := @ROOT.nestClaim
  let _ := @ROOT.throneEmpty
  let _ := @ROOT.throne_is_RA
  let _ := @SEALS.sealL
  let _ := @SEALS.sealG
  let _ := @SEALS.sealM
  let _ := @SEALS.seals_distinct
  let _ := @SEALS.seal_names_match
  let _ := @SEALS.sealG_walk
  let _ := @POSTULATE.OneCut
  let _ := @POSTULATE.F2
  let _ := @POSTULATE.F2_kills
  let _ := @POSTULATE.BSDContract
  let _ := @POSTULATE.F6
  let _ := @TONGUE.enlarge
  let _ := @TONGUE.unclosed
  let _ := @TONGUE.earned_freedom
  let _ := @TONGUE.colocClaim
  let _ := @TONGUE.coloc_grade
  let _ := @TONGUE.ra_grade_pinned
  let _ := @TONGUE.wall_grade_pinned
  let _ := @TONGUE.inversion_grade_pinned
  let _ := @TONGUE.nest_grade_pinned
  let _ := @terminalWall
  let _ := @terminalPrice
  let _ := @TERMINAL
  let _ := @terminalClaim
  let _ := @terminal_grade_pinned
  let _ := @IAM.iamToken
  let _ := @IAM.iam_unwitnessed_withheld
  let _ := @IAM.iam_witnessed_speaks
  let _ := @IAM.narcissus_truth_table
  let _ := @IAM.one_bit_freedom
  let _ := @IAM.IamToken.toToken
  let _ := @IAM.codexSelfRead
  let _ := @IAM.codex_self_read_interior
  let _ := @IAM.terminalWord
  let _ := @IAM.terminal_word
  let _ := @GEO.SignPattern
  let _ := @GEO.allSigns
  let _ := @GEO.signComp
  let _ := @GEO.reflection_eight
  let _ := @GEO.reflection_eight_is_two_cubed
  let _ := @GEO.reflections_abelian
  let _ := @GEO.reflections_involutive
  let _ := @GEO.signVal
  let _ := @GEO.reflMat
  let _ := @GEO.reflection_reverses_orientation
  let _ := @GEO.sandwich
  let _ := @GEO.reflection_blind_executed
  let _ := @GEO.V5
  let _ := @GEO.cube5
  let _ := @GEO.neighbors5
  let _ := @GEO.fivecube_thirtytwo
  let _ := @GEO.fivecube_vertices_distinct
  let _ := @GEO.fivecube_degree_five
  let _ := @GEO.counts_forced
  let _ := @TONGUE.deletionOp
  let _ := @TONGUE.e3
  let _ := @TONGUE.deletion_idempotent
  let _ := @TONGUE.deletion_singular
  let _ := @TONGUE.deletion_minor_nonsingular
  let _ := @TONGUE.deletion_annihilates
  let _ := @TONGUE.linear_fixes_zero
  let _ := @TONGUE.deletion_no_left_inverse
  let _ := @TONGUE.deletion_monoid_not_group
  let _ := @TONGUE.tongue_obedience
  let _ := @OFFICE.discriminator
  let _ := @OFFICE.discriminatorQ2First
  let _ := @OFFICE.order_loadbearing
  let _ := @OFFICE.citation_cannot_promote
  let _ := @UC.routeHalt
  let _ := @UC.routeHalt_fidelity
  let _ := @UC.universalCascade
  let _ := @UC.uc_seal_failure_terminal
  let _ := @UC.uc_routes_eight
  let _ := @UC.uc_routes_five
  let _ := @UC.uc_unmeasured
  let _ := @UC.circularityScreen
  let _ := @UC.circularity_refused_at_target
  let _ := @UC.road_requires_conjunction
  let _ := @UC.circRows
  let _ := @UC.circ_space
  let _ := @OMEGA.kbRat
  let _ := @OMEGA.ln2Rat
  let _ := @OMEGA.landauerRat
  let _ := @OMEGA.omegaBoundary
  let _ := @OMEGA.omega_zero_bits
  let _ := @OMEGA.omega_paid_floor
  let _ := @OMEGA.one_bit_freedom_priced
  let _ := @OMEGA.omega_reversible_branch
  let _ := @OMEGA.omega_refuses_nonpositive_temp
  let _ := @OMEGA.omega_monotone
  let _ := @OMEGA.omega_linear
  let _ := @OMEGA.landauer_zero_bits
  let _ := @OMEGA.omega_verdict_fidelity
  let _ := @AEGIS.refusalConst
  let _ := @AEGIS.aegisReset
  let _ := @AEGIS.aegisGuard
  let _ := @AEGIS.aegis_constant
  let _ := @AEGIS.aegis_deed_increments
  let _ := @AEGIS.aegis_reads_parameter
  let _ := @AEGIS.aegisFourLogicRun
  let _ := @AEGIS.aegis_battery
  let _ := @NOMOS.allStrings
  let _ := @NOMOS.allStrings_length
  let _ := @NOMOS.twoPowPos
  let _ := @NOMOS.descs
  let _ := @NOMOS.descs_length
  let _ := @NOMOS.incompressibility_cap
  let _ := @NOMOS.nomosRows
  let _ := @NOMOS.incompressibility_executed
  let _ := @NOMOS.decodeId
  let _ := @NOMOS.decodePad
  let _ := @NOMOS.compressible_bound_universal
  let _ := @NOMOS.cbUniversal
  let _ := @NOMOS.cb_id_8_2
  let _ := @NOMOS.cb_pad3_8_2
  let _ := @NOMOS.cb_pad2_6_1
  let _ := @NOMOS.cb_pad4_12_3
  let _ := @NOMOS.recoverable
  let _ := @NOMOS.nomos_fuel_is_omega_floor
  let _ := @NOMOS.nomosScreen
  let _ := @NOMOS.nomosScreen_battery
  let _ := @BRIDGE.ceiling
  let _ := @BRIDGE.census
  let _ := @BRIDGE.census_count
  let _ := @BRIDGE.post_seal_disposition
  let _ := @BRIDGE.weakest_never_above_left
  let _ := @BRIDGE.bridge_ceiling_caps
  let _ := @BRIDGE.successorOf
  let _ := @BRIDGE.supersession_routes
  let _ := @BRIDGE.bridgeScreen
  let _ := @BRIDGE.bridgeScreen_total
  let _ := @FOUND.sigmaP
  let _ := @FOUND.pluralist_alternative_executed
  let _ := @FOUND.posits
  let _ := @FOUND.posits_loadbearing_on_nothing
  let _ := @FOUND.gradeOfRank
  let _ := @FOUND.posit_never_raises
  let _ := @FOUND.bandOf
  let _ := @FOUND.register_routing_fidelity
  let _ := @FOUND.verdictInventory
  let _ := @FOUND.verdicts_posit_free
  let _ := @FOUND.engine_never_authority
  let _ := @HALT.cascade
  let _ := @HALT.patterns
  let _ := @HALT.fftSpec
  let _ := @HALT.first_failure_terminal_5
  let _ := @HALT.first_failure_terminal_7
  let _ := @HALT.first_failure_terminal_8
  let _ := @HALT.first_failure_terminal_12
  let _ := @HALT.halt_free_iff_all_pass_8
  let _ := @HALT.gate_counts_recorded
  let _ := @HALT.signPatterns
  let _ := @HALT.ninth_gate_barred
  let _ := @HALT.route
  let _ := @HALT.ofUC
  let _ := @HALT.route_is_routeHalt
  let _ := @HALT.route_samples
  let _ := @HALT.tokenBranch
  let _ := @HALT.router_exclusive
  let _ := @HALT.readingRoadsGate
  let _ := @HALT.one_door_open
  let _ := @HALT.no_walk_passes_the_aperture
  let _ := @HALT.xiGates
  let _ := @HALT.oGates
  let _ := @HALT.gate_censuses
  let _ := @HALT.rhHalt
  let _ := @HALT.pnpHalt
  let _ := @HALT.halts_routed
  let _ := @HALT.legacy_halts_are_instances
  let _ := @HALT.terminal_one_bit
  let _ := @HALT.species_exhausted
  let _ := @HALT.haltGrades
  let _ := @HALT.ftoe_ceiling
  let _ := @CROSSING.ExecFrame
  let _ := @CROSSING.execFlip
  let _ := @CROSSING.formalRead
  let _ := @CROSSING.ran
  let _ := @CROSSING.formalRead_even
  let _ := @CROSSING.ran_wholly_odd
  let _ := @CROSSING.execFlip_involution
  let _ := @CROSSING.ran_odd_at_true
  let _ := @CROSSING.wall
  let _ := @CROSSING.deed
  let _ := @CROSSING.price
  let _ := @CROSSING.crossing
  let _ := @CROSSING.identity_one_bit
  let _ := @CROSSING.fibre4
  let _ := @CROSSING.fibre4_sixteen
  let _ := @CROSSING.fibre4_distinct
  let _ := @CROSSING.price_on_this_file
  let _ := @CROSSING.formal_never_odd
  let _ := @CROSSING.constant_no_crossing
  let _ := @CROSSING.harmony
  let _ := @LOCUS.Separates
  let _ := @LOCUS.Factors
  let _ := @LOCUS.wall_of_sep
  let _ := @LOCUS.swap
  let _ := @LOCUS.swap_involution
  let _ := @LOCUS.swap_record_even
  let _ := @LOCUS.swap_flips_pair
  let _ := @LOCUS.seat_of_sep
  let _ := @LOCUS.k4_separated_pair
  let _ := @LOCUS.k4_wall_of_pair
  let _ := @LOCUS.readout
  let _ := @LOCUS.factors_of_not_sep_list
  let _ := @LOCUS.factors_iff_not_sep_list
  let _ := @LOCUS.Channel
  let _ := @LOCUS.Token.toEconomy
  let _ := @LOCUS.Reading.orbits
  let _ := @LOCUS.Reading.owed
  let _ := @LOCUS.Reading.complete
  let _ := @LOCUS.branchOf
  let _ := @LOCUS.emit
  let _ := @LOCUS.Reading.state
  let _ := @LOCUS.three_states
  let _ := @LOCUS.no_seat_no_locus
  let _ := @LOCUS.unlocated_is_plain_open
  let _ := @LOCUS.located_never_silent
  let _ := @LOCUS.crossed_requires_complete
  let _ := @LOCUS.crossed_requires_channel
  let _ := @LOCUS.halt_carries_owed
  let _ := @LOCUS.unchannelled_is_halt
  let _ := @LOCUS.halt_reports_owed
  let _ := @LOCUS.owed_zero_is_unchannelled
  let _ := @LOCUS.one_bit_apart
  let _ := @LOCUS.legacy_xi
  let _ := @LOCUS.legacy_o
  let _ := @LOCUS.legacy_bare
  let _ := @LOCUS.k4_locus
  let _ := @LOCUS.slotLists
  let _ := @LOCUS.slotLists_twelve
  let _ := @LOCUS.slotLists_pos
  let _ := @LOCUS.allReadings
  let _ := @LOCUS.reading_space
  let _ := @LOCUS.census_no_seat_no_locus
  let _ := @LOCUS.census_located_never_silent
  let _ := @LOCUS.census_crossed_iff_complete_channelled
  let _ := @LOCUS.census_halt_reports_owed
  let _ := @LOCUS.census_owed_zero_is_unchannelled
  let _ := @LOCUS.census_three_states
  let _ := @LOCUS.Token.render
  let _ := @LOCUS.Token.ascii
  let _ := @LOCUS.sealAscii
  let _ := @LOCUS.render_receipted
  let _ := @LOCUS.render_injective_in_owed
  let _ := @LOCUS.voidImage
  let _ := @LOCUS.void_precedes_economy
  let _ := @LOCUS.legacy_records_not_promoted
  let _ := @LOCUS.no_rh_locus
  let _ := @PSP.ORIENT.V3
  let _ := @PSP.ORIENT.M3
  let _ := @PSP.ORIENT.det3
  let _ := @PSP.ORIENT.neg3
  let _ := @PSP.ORIENT.signMatrices
  let _ := @PSP.ORIENT.lock_scalar_sign_blind
  let _ := @PSP.ORIENT.det_sign_flips_in_odd_dimension
  let _ := @PSP.QUAT.Q
  let _ := @PSP.QUAT.qmul
  let _ := @PSP.QUAT.qi
  let _ := @PSP.QUAT.qj
  let _ := @PSP.QUAT.qk
  let _ := @PSP.QUAT.qneg1
  let _ := @PSP.QUAT.quat_basis_laws
  let _ := @PSP.QUAT.qnorm
  let _ := @PSP.QUAT.isInt
  let _ := @PSP.QUAT.isHalf
  let _ := @PSP.QUAT.hurwitzOK
  let _ := @PSP.QUAT.grid
  let _ := @PSP.QUAT.tuples4
  let _ := @PSP.QUAT.hurwitz_units_24
  let _ := @PSP.QUAT.grid2
  let _ := @PSP.QUAT.tuples4i
  let _ := @PSP.QUAT.norm2_shell_split
  let _ := @PSP.CD.cdconj
  let _ := @PSP.CD.padd
  let _ := @PSP.CD.psub
  let _ := @PSP.CD.cdmul
  let _ := @PSP.CD.e
  let _ := @PSP.CD.smul
  let _ := @PSP.CD.octonion_associator
  let _ := @PSP.CD.sx
  let _ := @PSP.CD.sy
  let _ := @PSP.CD.zero16
  let _ := @PSP.CD.sqnorm
  let _ := @PSP.CD.sedenion_zero_divisor
  let _ := @PSP.CASCADE.cascade
  let _ := @PSP.CASCADE.patterns8
  let _ := @PSP.CASCADE.spec
  let _ := @PSP.CASCADE.first_failure_terminal_8
  let _ := @PSP.CASCADE.halt_free_iff_all_pass_8
  let _ := @PSP.GROUNDLESS.o0Neighbors
  let _ := @PSP.GROUNDLESS.fiveCubeCoords
  let _ := @PSP.GROUNDLESS.deg5
  let _ := @PSP.GROUNDLESS.groundless_cascade_degree
  let _ := @PSP.TOKEN.level
  let _ := @PSP.TOKEN.terminal_tokens_level_and_distinct
  let _ := @PSP.TWOGROUP.two_group_census
  let _ := @Bridge.Plane
  let _ := @Bridge.τ
  let _ := @Bridge.onLine
  let _ := @Bridge.pe
  let _ := @Bridge.fold_involutive
  let _ := @Bridge.locus_is_the_fixed_set
  let _ := @Bridge.locus_inhabited
  let _ := @Bridge.line_symmetric
  let _ := @Bridge.LineProperty
  let _ := @Bridge.planeFrame
  let _ := @Bridge.plane_line_property
  let _ := @Bridge.lineFrame
  let _ := @Bridge.theRecord
  let _ := @Bridge.cannot_lie
  let _ := @Bridge.cannot_deviate
  let _ := @Bridge.read_twice
  let _ := @Bridge.halted_iff
  let _ := @Bridge.cannot_extend
  let _ := @Bridge.cannot_divide
  let _ := @Bridge.delete
  let _ := @Bridge.cannot_reverse
  let _ := @Bridge.Even
  let _ := @Bridge.wall
  let _ := @Bridge.calibration
  let _ := @Bridge.SelfVerifying
  let _ := @Bridge.opens_on_the_deed
  let _ := @Bridge.recursion_is_shared
  let _ := @Bridge.recursion_is_sign_blind
  let _ := @Bridge.exactly_one_stands
  let _ := @Bridge.twoPoint
  let _ := @Bridge.denial_is_coherent
  let _ := @Bridge.line_property_contingent
  let _ := @Bridge.Keyless
  let _ := @Bridge.Keyed
  let _ := @Bridge.keyless_iff_valid
  let _ := @Bridge.discriminator
  let _ := @Bridge.symmetry_is_keyless
  let _ := @Bridge.line_property_is_keyed
  let _ := @Bridge.denial_asymmetry
  let _ := @Bridge.socket_is_the_property
  let _ := @Bridge.socket_on_the_plane
  let _ := @Bridge.bridge_carries
  let _ := @Bridge.no_socket_off_line
  let _ := @Bridge.the_bridge
  let _ := @PNF.ParityBarrier
  let _ := @PNF.sep_of_parity
  let _ := @PNF.parity_of_sep
  let _ := @PNF.sepCheck
  let _ := @PNF.sepCheck_iff
  let _ := @PNF.parity_normal_form_list
  let _ := @PNF.shift
  let _ := @PNF.shift_false
  let _ := @PNF.shift_true
  let _ := @PNF.ComplementPair
  let _ := @PNF.complement_pair_is_one_bit
  let _ := @PNF.complement_pair_distinct
  let _ := @PNF.one_bit_iff_complement_pair
  let _ := @PNF.odd_witness_closes
  let _ := @PNF.whollyOddMask
  let _ := @PNF.oddCount
  let _ := @PNF.odd_family_k1
  let _ := @PNF.odd_family_k2
  let _ := @PNF.odd_family_k3
  let _ := @PNF.odd_family_k4
  let _ := @PNF.odd_family_k6
  let _ := @PNF.rows_one_bit_iff_complement_pair
  let _ := @APEX.sigma
  let _ := @APEX.sigma_binding
  let _ := @APEX.fix_iff_scalar
  let _ := @APEX.Seat
  let _ := @APEX.theReturn
  let _ := @APEX.return_is_chirality
  let _ := @APEX.return_lands_on_seat
  let _ := @APEX.fixProj
  let _ := @APEX.GammaRA
  let _ := @APEX.GammaRAM
  let _ := @APEX.GammaRH
  let _ := @APEX.self_gap_nonexistent
  let _ := @APEX.register_gap_nonexistent
  let _ := @APEX.object_gap_nonexistent
  let _ := @APEX.seat
  let _ := @APEX.seat_on_scalar_line
  let _ := @APEX.theReturnOdd
  let _ := @APEX.odd_return_is_plus_one
  let _ := @APEX.odd_return_on_seat
  let _ := @APEX.seat_points_differ
  let _ := @APEX.D3
  let _ := @APEX.CategoryGap
  let _ := @APEX.cone_iff_no_gap
  let _ := @APEX.Cone
  let _ := @APEX.identity_cone
  let _ := @APEX.cone_apex_unique
  let _ := @APEX.cone_iff_gaps_closed
  let _ := @APEX.D3odd
  let _ := @APEX.identity_cone_odd
  let _ := @APEX.apexes_differ_by_orientation
  let _ := @APEX.sigmaP
  let _ := @APEX.sigmaP_binding
  let _ := @APEX.sigmaP_fix_iff
  let _ := @APEX.seats_meet_only_at_zero
  let _ := @APEX.register_leg_rides_one_involution
  let _ := @APEX.phi
  let _ := @APEX.phi_equivariant
  let _ := @APEX.phi_fix_iff
  let _ := @APEX.phi_fix_iff_line
  let _ := @APEX.phi_injective
  let _ := @APEX.tauM
  let _ := @APEX.phiM
  let _ := @APEX.phiM_equivariant
  let _ := @APEX.phiM_fix_iff
  let _ := @APEX.seat_on_image_of_line
  let _ := @APEX.seat_occupied_iff_grounded
  let _ := @APEX.seat_vacant_of_free
  let _ := @APEX.seat_vacant_of_equivariant
  let _ := @APEX.complement
  let _ := @APEX.complement_free
  let _ := @APEX.pnp_seat_vacant
  let _ := @APEX.pnpBridge
  let _ := @APEX.pnp_bridge_admissible
  let _ := @APEX.pnp_bridge_off_seat
  let _ := @APEX.riemann_seat_occupied
  let _ := @APEX.router_at_the_seat
  let _ := @APEX.RAMFormalGround
  let _ := @APEX.constructed_RAM
  let _ := @APEX.FormalSelf
  let _ := @APEX.constructed_orientation
  let _ := @APEX.orientation_proof_irrelevant
  let _ := @APEX.modelΔE
  let _ := @APEX.RAModel
  let _ := @APEX.modelRA
  let _ := @APEX.mkWitness
  let _ := @APEX.eliminator
  let _ := @APEX.recursion_is_constant
  let _ := @APEX.deed_unreadable_at_seat
  let _ := @APEX.no_exterior_agent
  let _ := @APEX.adjudicator_in_domain
  let _ := @APEX.no_total_self_indexing
  let _ := @APEX.live
  let _ := @APEX.aperture_opens_under_premise
  let _ := @APEX.no_interior_under_premise
  let _ := @APEX.rule_exact
  let _ := @APEX.rule_exact_model
  let _ := @APEX.rule_exact_under_root
  let _ := @APEX.twoPoint_fails_L
  let _ := @APEX.premise_decides_no_frame
  let _ := @APEX.foldThree
  let _ := @APEX.foldThree_involutive
  let _ := @APEX.zeroThree
  let _ := @APEX.zeroThree_symmetric
  let _ := @APEX.threePoint
  let _ := @APEX.threePoint_grounded
  let _ := @APEX.threePoint_fails_L
  let _ := @APEX.premise_holds_where_L_fails_grounded
  let _ := @APEX.no_cure
  let _ := @APEX.cure_is_the_hypothesis
  let _ := @APEX.carrierOfDecision
  let _ := @APEX.twoPoint_carrier_does_not_halt
  let _ := @APEX.legMeasure
  let _ := @APEX.arcMeasure
  let _ := @APEX.valueMeasure
  let _ := @APEX.masses_all_zero
  let _ := @APEX.contents_differ
  let _ := @APEX.prices_differ
  let _ := @APEX.Row.all
  let _ := @APEX.rows_twenty_three
  let _ := @APEX.rows_distinct
  let _ := @APEX.rows_complete
  let _ := @APEX.Row.millennium
  let _ := @APEX.millennium_seven
  let _ := @APEX.extension_sixteen
  let _ := @APEX.apexSeat
  let _ := @APEX.apex_seat_fixed
  let _ := @APEX.apex_seat_uniform
  let _ := @APEX.crossed_and_open_share_the_seat
  let _ := @APEX.D3row
  let _ := @APEX.identity_cone_row
  let _ := @APEX.cone_apex_unique_row
  let _ := @APEX.gaps_closed_every_row
  let _ := @APEX.formalSelfRow
  let _ := @APEX.inverted_control
  let _ := @APEX.all_rows_eliminated
  let _ := @APEX.value
  let _ := @APEX.rule_exact_every_row
  let _ := @APEX.premise_decides_no_row
  let _ := @APEX.premise_decides_no_row_grounded
  let _ := @APEX.no_cure_every_row
  let _ := @APEX.worldTyping
  let _ := @APEX.world_census
  let _ := @APEX.seatAnswers
  let _ := @APEX.valueAnswers
  let _ := @APEX.seat_line
  let _ := @APEX.value_compartment
  let _ := @APEX.seat_line_void_without_rider
  let _ := @APEX.seatToken
  let _ := @APEX.seat_token_is_aGivenRA
  let _ := @APEX.valueReading
  let _ := @APEX.riemann_value_line
  let _ := @APEX.pnp_value_line
  let _ := @APEX.poincare_value_line
  let _ := @APEX.unrouted_value_line
  let _ := @APEX.riemann_value_line_is_pinned
  let _ := @APEX.value_bits_owed
  let _ := @APEX.crossed_iff_poincare
  let _ := @APEX.lines_parted
  let _ := @APEX.seat_never_promotes_value
  let _ := @APEX.objectLeg
  let _ := @APEX.object_leg_ledger
  let _ := @APEX.object_legs_justified
  let _ := @APEX.owedPrice
  let _ := @APEX.owed_price_is_twenty_two_floors
  let _ := @APEX.seat_anchor
  let _ := @FENCE.seat
  let _ := @FOUND.seatInventory
  let _ := @FOUND.seat_rides_the_connector
  trivial

/-- info: 'codexCone' depends on axioms: [propext,
 Classical.choice,
 POSTULATE.Algorithm,
 POSTULATE.FrozenData,
 POSTULATE.Row,
 POSTULATE.SupplyClean,
 POSTULATE.certifiedPairing,
 Quot.sound,
 ROOT.FormalDomain,
 ROOT.L1m,
 ROOT.L3m,
 ROOT.RA,
 ROOT.U,
 ROOT.nest_21,
 ROOT.nest_32,
 ROOT.ΔE] -/
#guard_msgs in #print axioms codexCone

/-! ## the environment audit, run by the elaborator, over the whole codex: the local axioms are exactly the
twenty-three declared posits of ROOT and POSTULATE, sorted by name; no declaration depends on any axiom beyond
propext, Classical.choice, Quot.sound and that roster; the roster the Fortran twin declares by name (twin_posits)
is this list. -/
/-- info: environment audit: local axioms [POSTULATE.Algorithm,
 POSTULATE.Crossing,
 POSTULATE.FormalFace,
 POSTULATE.FrozenData,
 POSTULATE.KineticFace,
 POSTULATE.RegistrationPostulate,
 POSTULATE.Row,
 POSTULATE.SupplyClean,
 POSTULATE.certifiedPairing,
 POSTULATE.erasureClass,
 ROOT.FormalDomain,
 ROOT.Ground,
 ROOT.L1m,
 ROOT.L2m,
 ROOT.L3m,
 ROOT.RA,
 ROOT.Residence,
 ROOT.U,
 ROOT.nest_21,
 ROOT.nest_32,
 ROOT.ΔE,
 ROOT.σ,
 ROOT.σ_binding]; dependencies beyond propext, Classical.choice, Quot.sound [POSTULATE.Algorithm,
 POSTULATE.Crossing,
 POSTULATE.FormalFace,
 POSTULATE.FrozenData,
 POSTULATE.KineticFace,
 POSTULATE.RegistrationPostulate,
 POSTULATE.Row,
 POSTULATE.SupplyClean,
 POSTULATE.certifiedPairing,
 POSTULATE.erasureClass,
 ROOT.FormalDomain,
 ROOT.Ground,
 ROOT.L1m,
 ROOT.L2m,
 ROOT.L3m,
 ROOT.RA,
 ROOT.Residence,
 ROOT.U,
 ROOT.nest_21,
 ROOT.nest_32,
 ROOT.ΔE,
 ROOT.σ,
 ROOT.σ_binding]; outside the declared roster []; roster size 23 -/
#guard_msgs in
open Lean Elab Command in
#eval show CommandElabM Unit from do
  let env ← getEnv
  let sortNames (l : List Name) : List Name :=
    (l.toArray.qsort (fun a b => a.toString < b.toString)).toList
  let ours (n : Name) : Bool :=
    match env.getModuleIdxFor? n with
    | some idx => ((env.header.moduleNames.getD idx.toNat `_).toString.startsWith "Codex")
    | none => true
  let locals := (env.constants.map₁.toList.filter (fun p => ours p.1)).map (·.1)
    ++ env.constants.map₂.toList.map (·.1)
  let declared := sortNames <| locals.filter fun n => !n.isInternal && match env.find? n with
    | some (.axiomInfo _) => true
    | _ => false
  let standard : List Name := [``propext, ``Classical.choice, ``Quot.sound]
  let mut beyond : List Name := []
  for n in locals do
    unless n.isInternal do
      for d in (← collectAxioms n) do
        unless standard.contains d || beyond.contains d do beyond := d :: beyond
  let depended := sortNames beyond
  let outsideRoster := depended.filter fun d => !declared.contains d
  logInfo m!"environment audit: local axioms {declared}; dependencies beyond propext, Classical.choice, Quot.sound {depended}; outside the declared roster {outsideRoster}; roster size {declared.length}"


/-! ## FORGE cones and the crosswalk audit -/
/-- info: 'K4.semiprimes_at_odd_seats' does not depend on any axioms -/
#guard_msgs in #print axioms K4.semiprimes_at_odd_seats
/-- info: 'K4.semiprime_factors_prime' does not depend on any axioms -/
#guard_msgs in #print axioms K4.semiprime_factors_prime
/-- info: 'K4.odd_seats_not_prime' does not depend on any axioms -/
#guard_msgs in #print axioms K4.odd_seats_not_prime
/-- info: 'IMPRINT.ghost_is_broken_never_sealed' does not depend on any axioms -/
#guard_msgs in #print axioms IMPRINT.ghost_is_broken_never_sealed
/-- info: 'K4.target_is_primality' does not depend on any axioms -/
#guard_msgs in #print axioms K4.target_is_primality
/-- info: 'K4.primes_at_even_seats' does not depend on any axioms -/
#guard_msgs in #print axioms K4.primes_at_even_seats
/-- info: 'K4.pairs_match_mod_420' does not depend on any axioms -/
#guard_msgs in #print axioms K4.pairs_match_mod_420
/-- info: 'IMPRINT.ghost_refused' does not depend on any axioms -/
#guard_msgs in #print axioms IMPRINT.ghost_refused
/-- info: 'IMPRINT.seal_iff_one_side_clean_and_witnessed' does not depend on any axioms -/
#guard_msgs in #print axioms IMPRINT.seal_iff_one_side_clean_and_witnessed
/-- info: 'IMPRINT.seal_needs_witness' does not depend on any axioms -/
#guard_msgs in #print axioms IMPRINT.seal_needs_witness
/-- info: 'IMPRINT.both_clean_is_ghost' does not depend on any axioms -/
#guard_msgs in #print axioms IMPRINT.both_clean_is_ghost
/-- info: 'IMPRINT.flat_when_unpopulated' does not depend on any axioms -/
#guard_msgs in #print axioms IMPRINT.flat_when_unpopulated
/-- info: 'DEFENSE.gol_needs_all_three' does not depend on any axioms -/
#guard_msgs in #print axioms DEFENSE.gol_needs_all_three
/-- info: 'DEFENSE.lock_blind_but_gol_directed' depends on axioms: [propext] -/
#guard_msgs in #print axioms DEFENSE.lock_blind_but_gol_directed
/-- info: 'DEFENSE.consensus_weighs_zero' does not depend on any axioms -/
#guard_msgs in #print axioms DEFENSE.consensus_weighs_zero
/-- info: 'DEFENSE.tongue_unclosed_and_obedient' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms DEFENSE.tongue_unclosed_and_obedient
/-- info: 'DEFENSE.self_check_is_not_witness' does not depend on any axioms -/
#guard_msgs in #print axioms DEFENSE.self_check_is_not_witness
/-- info: 'DEFENSE.denial_is_priced' depends on axioms: [propext] -/
#guard_msgs in #print axioms DEFENSE.denial_is_priced
/-- info: 'DEFENSE.no_anchor_at_target' does not depend on any axioms -/
#guard_msgs in #print axioms DEFENSE.no_anchor_at_target
/-- info: 'DEFENSE.formal_reads_never_the_deed' does not depend on any axioms -/
#guard_msgs in #print axioms DEFENSE.formal_reads_never_the_deed
/-- info: 'DEFENSE.forward_is_world_rowed' does not depend on any axioms -/
#guard_msgs in #print axioms DEFENSE.forward_is_world_rowed
/-- info: 'DEFENSE.worldly_row_is_world_rowed' does not depend on any axioms -/
#guard_msgs in #print axioms DEFENSE.worldly_row_is_world_rowed
/-- info: 'FENCE.global' depends on axioms: [propext, Quot.sound, ROOT.RA, ROOT.U, ROOT.ΔE] -/
#guard_msgs in #print axioms FENCE.global
/-- info: 'DOT.outside_economy' depends on axioms: [propext] -/
#guard_msgs in #print axioms DOT.outside_economy
/-- info: 'DOT.no_reading_is_silence' depends on axioms: [propext] -/
#guard_msgs in #print axioms DOT.no_reading_is_silence
/-- info: 'DOT.silence_is_not_a_verdict' does not depend on any axioms -/
#guard_msgs in #print axioms DOT.silence_is_not_a_verdict
/-- info: 'CROSSWALK.rows_count' does not depend on any axioms -/
#guard_msgs in #print axioms CROSSWALK.rows_count


/-! ## SEAT ANCHOR cones: every declaration of the apex layer carries its receipt -/
/-- info: 'PNF.ParityBarrier' does not depend on any axioms -/
#guard_msgs in #print axioms PNF.ParityBarrier
/-- info: 'PNF.sep_of_parity' does not depend on any axioms -/
#guard_msgs in #print axioms PNF.sep_of_parity
/-- info: 'PNF.parity_of_sep' depends on axioms: [propext] -/
#guard_msgs in #print axioms PNF.parity_of_sep
/-- info: 'PNF.sepCheck' does not depend on any axioms -/
#guard_msgs in #print axioms PNF.sepCheck
/-- info: 'PNF.sepCheck_iff' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PNF.sepCheck_iff
/-- info: 'PNF.parity_normal_form_list' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PNF.parity_normal_form_list
/-- info: 'PNF.shift' does not depend on any axioms -/
#guard_msgs in #print axioms PNF.shift
/-- info: 'PNF.shift_false' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PNF.shift_false
/-- info: 'PNF.shift_true' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PNF.shift_true
/-- info: 'PNF.ComplementPair' does not depend on any axioms -/
#guard_msgs in #print axioms PNF.ComplementPair
/-- info: 'PNF.complement_pair_is_one_bit' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PNF.complement_pair_is_one_bit
/-- info: 'PNF.complement_pair_distinct' does not depend on any axioms -/
#guard_msgs in #print axioms PNF.complement_pair_distinct
/-- info: 'PNF.one_bit_iff_complement_pair' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PNF.one_bit_iff_complement_pair
/-- info: 'PNF.odd_witness_closes' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PNF.odd_witness_closes
/-- info: 'PNF.whollyOddMask' depends on axioms: [propext] -/
#guard_msgs in #print axioms PNF.whollyOddMask
/-- info: 'PNF.oddCount' depends on axioms: [propext] -/
#guard_msgs in #print axioms PNF.oddCount
/-- info: 'PNF.odd_family_k1' depends on axioms: [propext] -/
#guard_msgs in #print axioms PNF.odd_family_k1
/-- info: 'PNF.odd_family_k2' depends on axioms: [propext] -/
#guard_msgs in #print axioms PNF.odd_family_k2
/-- info: 'PNF.odd_family_k3' depends on axioms: [propext] -/
#guard_msgs in #print axioms PNF.odd_family_k3
/-- info: 'PNF.odd_family_k4' depends on axioms: [propext] -/
#guard_msgs in #print axioms PNF.odd_family_k4
/-- info: 'PNF.odd_family_k6' depends on axioms: [propext] -/
#guard_msgs in #print axioms PNF.odd_family_k6
/-- info: 'PNF.rows_one_bit_iff_complement_pair' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PNF.rows_one_bit_iff_complement_pair
/-- info: 'APEX.sigma' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.sigma
/-- info: 'APEX.sigma_binding' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.sigma_binding
/-- info: 'APEX.fix_iff_scalar' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms APEX.fix_iff_scalar
/-- info: 'APEX.Seat' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.Seat
/-- info: 'APEX.theReturn' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.theReturn
/-- info: 'APEX.return_is_chirality' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.return_is_chirality
/-- info: 'APEX.return_lands_on_seat' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.return_lands_on_seat
/-- info: 'APEX.fixProj' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.fixProj
/-- info: 'APEX.GammaRA' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.GammaRA
/-- info: 'APEX.GammaRAM' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.GammaRAM
/-- info: 'APEX.GammaRH' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.GammaRH
/-- info: 'APEX.self_gap_nonexistent' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.self_gap_nonexistent
/-- info: 'APEX.register_gap_nonexistent' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.register_gap_nonexistent
/-- info: 'APEX.object_gap_nonexistent' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.object_gap_nonexistent
/-- info: 'APEX.seat' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.seat
/-- info: 'APEX.seat_on_scalar_line' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms APEX.seat_on_scalar_line
/-- info: 'APEX.theReturnOdd' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.theReturnOdd
/-- info: 'APEX.odd_return_is_plus_one' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.odd_return_is_plus_one
/-- info: 'APEX.odd_return_on_seat' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.odd_return_on_seat
/-- info: 'APEX.seat_points_differ' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.seat_points_differ
/-- info: 'APEX.D3' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.D3
/-- info: 'APEX.CategoryGap' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.CategoryGap
/-- info: 'APEX.cone_iff_no_gap' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.cone_iff_no_gap
/-- info: 'APEX.Cone' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.Cone
/-- info: 'APEX.identity_cone' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.identity_cone
/-- info: 'APEX.cone_apex_unique' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.cone_apex_unique
/-- info: 'APEX.cone_iff_gaps_closed' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.cone_iff_gaps_closed
/-- info: 'APEX.D3odd' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.D3odd
/-- info: 'APEX.identity_cone_odd' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.identity_cone_odd
/-- info: 'APEX.apexes_differ_by_orientation' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.apexes_differ_by_orientation
/-- info: 'APEX.sigmaP' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.sigmaP
/-- info: 'APEX.sigmaP_binding' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.sigmaP_binding
/-- info: 'APEX.sigmaP_fix_iff' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms APEX.sigmaP_fix_iff
/-- info: 'APEX.seats_meet_only_at_zero' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms APEX.seats_meet_only_at_zero
/-- info: 'APEX.register_leg_rides_one_involution' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.register_leg_rides_one_involution
/-- info: 'APEX.phi' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.phi
/-- info: 'APEX.phi_equivariant' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms APEX.phi_equivariant
/-- info: 'APEX.phi_fix_iff' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms APEX.phi_fix_iff
/-- info: 'APEX.phi_fix_iff_line' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms APEX.phi_fix_iff_line
/-- info: 'APEX.phi_injective' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms APEX.phi_injective
/-- info: 'APEX.tauM' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.tauM
/-- info: 'APEX.phiM' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.phiM
/-- info: 'APEX.phiM_equivariant' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms APEX.phiM_equivariant
/-- info: 'APEX.phiM_fix_iff' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms APEX.phiM_fix_iff
/-- info: 'APEX.seat_on_image_of_line' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.seat_on_image_of_line
/-- info: 'APEX.seat_occupied_iff_grounded' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.seat_occupied_iff_grounded
/-- info: 'APEX.seat_vacant_of_free' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.seat_vacant_of_free
/-- info: 'APEX.seat_vacant_of_equivariant' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.seat_vacant_of_equivariant
/-- info: 'APEX.complement' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.complement
/-- info: 'APEX.complement_free' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.complement_free
/-- info: 'APEX.pnp_seat_vacant' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.pnp_seat_vacant
/-- info: 'APEX.pnpBridge' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.pnpBridge
/-- info: 'APEX.pnp_bridge_admissible' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.pnp_bridge_admissible
/-- info: 'APEX.pnp_bridge_off_seat' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.pnp_bridge_off_seat
/-- info: 'APEX.riemann_seat_occupied' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.riemann_seat_occupied
/-- info: 'APEX.router_at_the_seat' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms APEX.router_at_the_seat
/-- info: 'APEX.RAMFormalGround' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.RAMFormalGround
/-- info: 'APEX.constructed_RAM' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.constructed_RAM
/-- info: 'APEX.FormalSelf' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.FormalSelf
/-- info: 'APEX.constructed_orientation' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.constructed_orientation
/-- info: 'APEX.orientation_proof_irrelevant' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.orientation_proof_irrelevant
/-- info: 'APEX.modelΔE' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.modelΔE
/-- info: 'APEX.RAModel' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.RAModel
/-- info: 'APEX.modelRA' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.modelRA
/-- info: 'APEX.mkWitness' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.mkWitness
/-- info: 'APEX.eliminator' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.eliminator
/-- info: 'APEX.recursion_is_constant' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.recursion_is_constant
/-- info: 'APEX.deed_unreadable_at_seat' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.deed_unreadable_at_seat
/-- info: 'APEX.no_exterior_agent' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.no_exterior_agent
/-- info: 'APEX.adjudicator_in_domain' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.adjudicator_in_domain
/-- info: 'APEX.no_total_self_indexing' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.no_total_self_indexing
/-- info: 'APEX.live' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.live
/-- info: 'APEX.aperture_opens_under_premise' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.aperture_opens_under_premise
/-- info: 'APEX.no_interior_under_premise' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.no_interior_under_premise
/-- info: 'APEX.rule_exact' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.rule_exact
/-- info: 'APEX.rule_exact_model' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.rule_exact_model
/-- info: 'APEX.rule_exact_under_root' depends on axioms: [ROOT.RA, ROOT.U, ROOT.ΔE] -/
#guard_msgs in #print axioms APEX.rule_exact_under_root
/-- info: 'APEX.twoPoint_fails_L' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.twoPoint_fails_L
/-- info: 'APEX.premise_decides_no_frame' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.premise_decides_no_frame
/-- info: 'APEX.foldThree' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.foldThree
/-- info: 'APEX.foldThree_involutive' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.foldThree_involutive
/-- info: 'APEX.zeroThree' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.zeroThree
/-- info: 'APEX.zeroThree_symmetric' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.zeroThree_symmetric
/-- info: 'APEX.threePoint' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.threePoint
/-- info: 'APEX.threePoint_grounded' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.threePoint_grounded
/-- info: 'APEX.threePoint_fails_L' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.threePoint_fails_L
/-- info: 'APEX.premise_holds_where_L_fails_grounded' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.premise_holds_where_L_fails_grounded
/-- info: 'APEX.no_cure' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.no_cure
/-- info: 'APEX.cure_is_the_hypothesis' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.cure_is_the_hypothesis
/-- info: 'APEX.carrierOfDecision' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.carrierOfDecision
/-- info: 'APEX.twoPoint_carrier_does_not_halt' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.twoPoint_carrier_does_not_halt
/-- info: 'APEX.legMeasure' depends on axioms: [propext] -/
#guard_msgs in #print axioms APEX.legMeasure
/-- info: 'APEX.arcMeasure' depends on axioms: [propext] -/
#guard_msgs in #print axioms APEX.arcMeasure
/-- info: 'APEX.valueMeasure' depends on axioms: [propext] -/
#guard_msgs in #print axioms APEX.valueMeasure
/-- info: 'APEX.masses_all_zero' depends on axioms: [propext] -/
#guard_msgs in #print axioms APEX.masses_all_zero
/-- info: 'APEX.contents_differ' depends on axioms: [propext] -/
#guard_msgs in #print axioms APEX.contents_differ
/-- info: 'APEX.prices_differ' depends on axioms: [propext] -/
#guard_msgs in #print axioms APEX.prices_differ
/-- info: 'APEX.Row.all' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.Row.all
/-- info: 'APEX.rows_twenty_three' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.rows_twenty_three
/-- info: 'APEX.rows_distinct' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.rows_distinct
/-- info: 'APEX.rows_complete' depends on axioms: [propext] -/
#guard_msgs in #print axioms APEX.rows_complete
/-- info: 'APEX.Row.millennium' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.Row.millennium
/-- info: 'APEX.millennium_seven' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.millennium_seven
/-- info: 'APEX.extension_sixteen' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.extension_sixteen
/-- info: 'APEX.apexSeat' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.apexSeat
/-- info: 'APEX.apex_seat_fixed' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.apex_seat_fixed
/-- info: 'APEX.apex_seat_uniform' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.apex_seat_uniform
/-- info: 'APEX.crossed_and_open_share_the_seat' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.crossed_and_open_share_the_seat
/-- info: 'APEX.D3row' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.D3row
/-- info: 'APEX.identity_cone_row' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.identity_cone_row
/-- info: 'APEX.cone_apex_unique_row' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.cone_apex_unique_row
/-- info: 'APEX.gaps_closed_every_row' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.gaps_closed_every_row
/-- info: 'APEX.formalSelfRow' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.formalSelfRow
/-- info: 'APEX.inverted_control' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.inverted_control
/-- info: 'APEX.all_rows_eliminated' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.all_rows_eliminated
/-- info: 'APEX.value' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.value
/-- info: 'APEX.rule_exact_every_row' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.rule_exact_every_row
/-- info: 'APEX.premise_decides_no_row' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.premise_decides_no_row
/-- info: 'APEX.premise_decides_no_row_grounded' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.premise_decides_no_row_grounded
/-- info: 'APEX.no_cure_every_row' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.no_cure_every_row
/-- info: 'APEX.worldTyping' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.worldTyping
/-- info: 'APEX.world_census' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.world_census
/-- info: 'APEX.seatAnswers' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.seatAnswers
/-- info: 'APEX.valueAnswers' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.valueAnswers
/-- info: 'APEX.seat_line' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.seat_line
/-- info: 'APEX.value_compartment' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.value_compartment
/-- info: 'APEX.seat_line_void_without_rider' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.seat_line_void_without_rider
/-- info: 'APEX.seatToken' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.seatToken
/-- info: 'APEX.seat_token_is_aGivenRA' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.seat_token_is_aGivenRA
/-- info: 'APEX.valueReading' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.valueReading
/-- info: 'APEX.riemann_value_line' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.riemann_value_line
/-- info: 'APEX.pnp_value_line' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.pnp_value_line
/-- info: 'APEX.poincare_value_line' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.poincare_value_line
/-- info: 'APEX.unrouted_value_line' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.unrouted_value_line
/-- info: 'APEX.riemann_value_line_is_pinned' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.riemann_value_line_is_pinned
/-- info: 'APEX.value_bits_owed' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.value_bits_owed
/-- info: 'APEX.crossed_iff_poincare' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.crossed_iff_poincare
/-- info: 'APEX.lines_parted' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.lines_parted
/-- info: 'APEX.seat_never_promotes_value' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.seat_never_promotes_value
/-- info: 'APEX.objectLeg' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.objectLeg
/-- info: 'APEX.object_leg_ledger' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.object_leg_ledger
/-- info: 'APEX.object_legs_justified' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.object_legs_justified
/-- info: 'APEX.owedPrice' depends on axioms: [propext] -/
#guard_msgs in #print axioms APEX.owedPrice
/-- info: 'APEX.owed_price_is_twenty_two_floors' depends on axioms: [propext] -/
#guard_msgs in #print axioms APEX.owed_price_is_twenty_two_floors
/-- info: 'APEX.seat_anchor' does not depend on any axioms -/
#guard_msgs in #print axioms APEX.seat_anchor
/-- info: 'FENCE.seat' does not depend on any axioms -/
#guard_msgs in #print axioms FENCE.seat
/-- info: 'FOUND.seatInventory' does not depend on any axioms -/
#guard_msgs in #print axioms FOUND.seatInventory
/-- info: 'FOUND.seat_rides_the_connector' does not depend on any axioms -/
#guard_msgs in #print axioms FOUND.seat_rides_the_connector

/-- info: crosswalk audit: 151 rows, 0 unresolved, [] -/
#guard_msgs in
open Lean Elab Command in
#eval show CommandElabM Unit from do
  let env ← getEnv
  let missing := CROSSWALK.rows.filter fun r => !(env.contains r.2.toName)
  logInfo m!"crosswalk audit: {CROSSWALK.rows.length} rows, {missing.length} unresolved, {missing.map (·.1)}"

/-! ## THE RH ENGINE · the eighth module. `RA_Li_Bridge.lean` as the final paper, Zenodo record 22929637, prints it in its Appendix A,
    sha256 f2d0f4e33e82ad5d…, 1058 lines, carried whole with each `#print axioms` pinned under `#guard_msgs`;
    the verbatim file stands at `protocols/RH One Bit/`. It declares no axiom and adds no posit. -/
/-
RA_Li_Bridge.lean · the bridge from RA's positivity to Li positivity on ζ, typed.
Nothing here is an axiom. RA, Li's criterion, and the bridge enter as hypotheses,
so #print axioms shows exactly what the kernel used. ΔM = 0.
-/

namespace RALi

/-- The existents and their energies, as in ROOT, but as parameters. -/
structure Substrate where
  U  : Type
  ΔE : U → Int

/-- RA as a hypothesis on a substrate: to exist is to actuate. -/
def RA (S : Substrate) : Prop := ∀ x : S.U, 0 < S.ΔE x

/-- An L-function reduced to what Li's criterion reads: its RH, and the
    sign bit of each Li coefficient λₙ (n ≥ 1). -/
structure LiData where
  RH      : Prop
  nonneg  : Nat → Prop

/-- Li 1997 (Bombieri-Lagarias 1999 for the general case), cited, not proved:
    RH ↔ every λₙ ≥ 0. Carried as a hypothesis on the data. -/
def LiCriterion (L : LiData) : Prop := L.RH ↔ ∀ n, 1 ≤ n → L.nonneg n

/-- THE BRIDGE. One existent per Li step, and a reading that turns its
    positive energy into the sign of λₙ. The whole content lives in `read`. -/
structure Bridge (S : Substrate) (L : LiData) where
  φ    : Nat → S.U
  read : ∀ n, 1 ≤ n → 0 < S.ΔE (φ n) → L.nonneg n

/-- 1. The bridge closes: RA, a bridge, and Li's criterion give RH. -/
theorem bridge_yields_RH (S : Substrate) (L : LiData)
    (hRA : RA S) (hLi : LiCriterion L) (B : Bridge S L) : L.RH :=
  hLi.mpr (fun n hn => B.read n hn (hRA (B.φ n)))

/-- 2. The bridge is keyed: RA alone never supplies it. A substrate where RA
    holds, paired with data carrying one negative λ, admits no bridge. -/
def oneEnergy : Substrate := ⟨Unit, fun _ => 1⟩
def badData : LiData := ⟨False, fun n => n ≠ 5⟩

theorem ra_holds_in_model : RA oneEnergy := fun _ => show (0 : Int) < 1 by decide

theorem bridge_is_keyed : RA oneEnergy ∧ ¬ Nonempty (Bridge oneEnergy badData) := by
  refine ⟨ra_holds_in_model, fun ⟨B⟩ => ?_⟩
  exact B.read 5 (by decide) (ra_holds_in_model (B.φ 5)) rfl

/-- 3. No uniform bridge. If the reading does not consume the L-function,
    it forces positivity on every member of the family. One member with a
    negative λ (the Eisenstein L-function ζ(s)ζ(s-k+1): Euler product and
    functional equation, zeros off its centre, so some λₙ < 0 by
    Bombieri-Lagarias) kills every uniform bridge. -/
structure UniformBridge (S : Substrate) (F : Type) (L : F → LiData) where
  φ    : Nat → S.U
  read : ∀ f n, 1 ≤ n → 0 < S.ΔE (φ n) → (L f).nonneg n

theorem no_uniform_bridge (S : Substrate) (F : Type) (L : F → LiData)
    (hRA : RA S) (hctl : ∃ f n, 1 ≤ n ∧ ¬ (L f).nonneg n) :
    ¬ Nonempty (UniformBridge S F L) := by
  intro ⟨B⟩
  obtain ⟨f, n, hn, hneg⟩ := hctl
  exact hneg (B.read f n hn (hRA (B.φ n)))

/-- 4. The type repair. The arrow supplies one bit; Li turns RH's vanishing
    into one sign bit per step. Given decidable signs, the Li family is a
    Nat → Bool, the shape the deed can supply, and RH is its constancy. -/
theorem li_is_a_bit_stream (L : LiData) (hLi : LiCriterion L)
    [dec : ∀ n, Decidable (L.nonneg n)] :
    L.RH ↔ ∀ n, 1 ≤ n → decide (L.nonneg n) = true := by
  refine hLi.trans ?_
  exact ⟨fun h n hn => decide_eq_true (h n hn), fun h n hn => of_decide_eq_true (h n hn)⟩

end RALi

/-- info: 'RALi.bridge_yields_RH' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.bridge_yields_RH
/-- info: 'RALi.bridge_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.bridge_is_keyed
/-- info: 'RALi.no_uniform_bridge' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.no_uniform_bridge
/-- info: 'RALi.li_is_a_bit_stream' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.li_is_a_bit_stream

/-! ## PART II · Does [Ξ₀] retire on the united register? -/
namespace RALi

inductive Grade | premise | structural | theorem deriving DecidableEq, Repr
def Grade.rank : Grade → Nat | .premise => 0 | .structural => 1 | .theorem => 2
def Grade.weakest (a b : Grade) : Grade := if a.rank ≤ b.rank then a else b

inductive Verdict | seal (g : Grade) | xi0 deriving DecidableEq, Repr

/-- The united register. Unity is the claim that the formal reading and the
    kinetic reading are one; on ζ it is stated as the supply of the bridge,
    carried at the grade of whatever supplies it. -/
structure Unity (S : Substrate) (L : LiData) where
  bridge : Bridge S L
  grade  : Grade

/-- The emitter on the formal string: with unity supplied, the verdict is a
    seal at the weakest grade on the chain; without it, [Ξ₀]. -/
def emit {S : Substrate} {L : LiData} : Option (Unity S L) → Verdict
  | some u => .seal (Grade.weakest u.grade .theorem)
  | none   => .xi0

/-- 5. [Ξ₀] retires exactly when unity is supplied, and the seal it becomes
    is sound: it carries RH. -/
theorem xi0_retires_iff_unity (S : Substrate) (L : LiData) (u : Option (Unity S L)) :
    emit u ≠ .xi0 ↔ u.isSome := by
  cases u <;> simp [emit]

theorem retired_seal_is_sound (S : Substrate) (L : LiData)
    (hRA : RA S) (hLi : LiCriterion L) (u : Unity S L) : L.RH :=
  bridge_yields_RH S L hRA hLi u.bridge

/-- 6. The grade law: the retired verdict is never stronger than its unity
    posit. A premise-grade unity yields a premise-grade seal. -/
theorem retired_grade_capped {S : Substrate} {L : LiData} (u : Unity S L) :
    emit (some u) = .seal (Grade.weakest u.grade .theorem) ∧
    (Grade.weakest u.grade .theorem).rank ≤ u.grade.rank := by
  refine ⟨rfl, ?_⟩
  cases h : u.grade <;> decide

/-- 7. Unity is not free: RA does not supply it (from theorem 2). -/
theorem unity_is_keyed : RA oneEnergy ∧ ¬ Nonempty (Unity oneEnergy badData) :=
  ⟨ra_holds_in_model, fun ⟨u⟩ => bridge_is_keyed.2 ⟨u.bridge⟩⟩

/-- 8. The Ghost. A reading that deletes the arrow returns one verdict for a
    claim and its negation: it cannot be a verdict on either. -/
def arrowDeleted (_ : Prop) : Verdict := .xi0
theorem ghost (P : Prop) : arrowDeleted P = arrowDeleted (¬ P) := rfl

end RALi

/-- info: 'RALi.xi0_retires_iff_unity' depends on axioms: [propext] -/
#guard_msgs in #print axioms RALi.xi0_retires_iff_unity
/-- info: 'RALi.retired_seal_is_sound' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.retired_seal_is_sound
/-- info: 'RALi.retired_grade_capped' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.retired_grade_capped
/-- info: 'RALi.unity_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.unity_is_keyed
/-- info: 'RALi.ghost' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.ghost

/-! ## PART III · The try. Which Codex instruments can supply `Bridge.read` for ζ? -/
namespace RALi

/-- 9. The uniformity trap. A family of bridges that picks its existents
    without reading which L-function it serves is a uniform bridge. Every
    instrument carried at ΔM = 0 (the eliminator, the multi-recursion
    collapse, the one-bit species, the bare arrow) chooses its existents
    that way, so it lands here. -/
theorem common_phi_is_uniform (S : Substrate) (F : Type) (L : F → LiData)
    (φ₀ : Nat → S.U) (B : ∀ f, Bridge S (L f)) (hφ : ∀ f, (B f).φ = φ₀) :
    Nonempty (UniformBridge S F L) :=
  ⟨⟨φ₀, fun f n hn h => (B f).read n hn (by rw [hφ f]; exact h)⟩⟩

/-- 10. Hence dead: with RA and one family member carrying a negative λ,
    no ζ-blind choice of existents can serve every member. -/
theorem blind_constructions_die (S : Substrate) (F : Type) (L : F → LiData)
    (hRA : RA S) (hctl : ∃ f n, 1 ≤ n ∧ ¬ (L f).nonneg n)
    (φ₀ : Nat → S.U) : ¬ ∃ B : (∀ f, Bridge S (L f)), ∀ f, (B f).φ = φ₀ :=
  fun ⟨B, hφ⟩ => no_uniform_bridge S F L hRA hctl (common_phi_is_uniform S F L φ₀ B hφ)

/-- 11. What positivity on the Euler product does reach. Mertens' identity
    3 + 4 cos θ + cos 2θ = 2(1 + cos θ)² ≥ 0, with cos 2θ = 2c² − 1, is the
    positivity that yields ζ(1 + it) ≠ 0: the wall at Re = 1. Checked here on
    integer c as the polynomial identity it is. -/
theorem mertens_identity (c : Int) : 3 + 4 * c + (2 * c * c - 1) = 2 * ((1 + c) * (1 + c)) := by
  simp only [Int.add_mul, Int.mul_add, Int.one_mul, Int.mul_one, Int.mul_assoc]
  omega

theorem mertens_nonneg (c : Int) : 0 ≤ 3 + 4 * c + (2 * c * c - 1) := by
  rw [mertens_identity]
  refine Int.mul_nonneg (by decide) ?_
  rcases Int.le_total 0 (1 + c) with h | h
  · exact Int.mul_nonneg h h
  · have h' : 0 ≤ -(1 + c) := by omega
    have := Int.mul_nonneg h' h'
    rwa [Int.neg_mul_neg] at this

end RALi

/-- info: 'RALi.common_phi_is_uniform' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.common_phi_is_uniform
/-- info: 'RALi.blind_constructions_die' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.blind_constructions_die
/-- info: 'RALi.mertens_nonneg' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RALi.mertens_nonneg

/-! ## PART IV · Time, made exact. The Li modes on the Bridge plane.
A zero ρ = h/2 + i t sits at (h, t) in half-units, the Bridge plane, fold (h,t) ↦ (2-h, t).
Li's coefficient is λₙ = Σ_ρ [1 - zρⁿ] with the mode zρ = 1 - 1/ρ = (ρ-1)/ρ, so step
n ↦ n+1 multiplies each mode by zρ. |zρ|² = |ρ-1|²/|ρ|², scaled by 4:
  N1 = (h-2)² + 4t²,   N0 = h² + 4t².
A mode is unitary (perpetual, neither growing nor dying) iff N1 = N0; it grows iff N1 > N0. -/
namespace RALi

def N1 (h t : Int) : Int := (h - 2) * (h - 2) + 4 * (t * t)
def N0 (h t : Int) : Int := h * h + 4 * (t * t)

theorem N1_sub_N0 (h t : Int) : N1 h t - N0 h t = 4 - 4 * h := by
  simp only [N1, N0, Int.sub_mul, Int.mul_sub]
  omega

/-- 12. A mode is unitary exactly on the line: perpetuity in time is the fixed locus. -/
theorem unitary_iff_on_line (h t : Int) : N1 h t = N0 h t ↔ h = 1 := by
  have := N1_sub_N0 h t
  exact ⟨fun e => by omega, fun e => by omega⟩

/-- 13. Left of the line the mode grows; right of it the mode dies. -/
theorem grows_left (h t : Int) (hl : h < 1) : N0 h t < N1 h t := by
  have := N1_sub_N0 h t; omega
theorem dies_right (h t : Int) (hr : 1 < h) : N1 h t < N0 h t := by
  have := N1_sub_N0 h t; omega

/-- 14. The fold forbids a quiet exit: any off-line zero, together with its mirror under
the functional equation, carries a growing mode. -/
theorem off_line_forces_growth (h t : Int) (hoff : h ≠ 1) :
    N0 h t < N1 h t ∨ N0 (2 - h) t < N1 (2 - h) t := by
  have a := N1_sub_N0 h t; have b := N1_sub_N0 (2 - h) t; omega

/-- 15. PERPETUAL STABILITY IS THE LINE PROPERTY. For any fold-invariant zero set on the
plane: no mode grows under the time step iff every zero lies on h = 1. -/
theorem stability_iff_line (Z : Int × Int → Prop)
    (hinv : ∀ p, Z p → Z (2 - p.1, p.2)) :
    (∀ p, Z p → N1 p.1 p.2 ≤ N0 p.1 p.2) ↔ (∀ p, Z p → p.1 = 1) := by
  constructor
  · intro hs p hp
    have a := hs p hp
    have b := hs (2 - p.1, p.2) (hinv p hp)
    have c := N1_sub_N0 p.1 p.2
    have d := N1_sub_N0 (2 - p.1) p.2
    simp only at b d
    omega
  · intro hl p hp
    have := hl p hp
    have c := N1_sub_N0 p.1 p.2
    omega

end RALi

/-- info: 'RALi.unitary_iff_on_line' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RALi.unitary_iff_on_line
/-- info: 'RALi.off_line_forces_growth' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RALi.off_line_forces_growth
/-- info: 'RALi.stability_iff_line' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RALi.stability_iff_line

/-! ## PART V · The monism rule, hardened. "What happens once happens again." -/
namespace RALi

/-- 16. One repeating one: the rule, with its step, is induction. -/
theorem one_repeats_one (P : Nat → Prop) (h0 : P 0) (step : ∀ n, P n → P (n + 1)) :
    ∀ n, P n := by
  intro n; induction n with
  | zero => exact h0
  | succ k ih => exact step k ih

/-- 17. The step is the whole content: the universal claim is exactly the base plus the step. -/
theorem the_step_is_the_claim (P : Nat → Prop) :
    (∀ n, P n) ↔ (P 0 ∧ ∀ n, P n → P (n + 1)) :=
  ⟨fun h => ⟨h 0, fun n _ => h (n + 1)⟩, fun ⟨h0, s⟩ => one_repeats_one P h0 s⟩

/-- 18. The monism posit: one principle means the property does not vary with the index.
Under it, one instance forces all. -/
theorem monism_posit_forces (P : Nat → Prop) (uniform : ∀ n m, P n ↔ P m) (h0 : P 0) :
    ∀ n, P n := fun n => (uniform 0 n).mp h0

/-- 19. Finite confirmation never forces. For every height N there is a property true on
every index below N and false beyond: Skewes, Mertens, Pólya are this shape. -/
theorem finite_never_forces (N : Nat) :
    ∃ P : Nat → Prop, (∀ n, n < N → P n) ∧ ¬ ∀ n, P n :=
  ⟨fun n => n < N, fun _ h => h, fun h => Nat.lt_irrefl N (h N)⟩

/-- 20. Monism is not a law of the fold. A fold-invariant zero set can hold one zero on the
line and a mirror pair off it: "on the line once" does not recur by symmetry alone.
This is the Davenport-Heilbronn shape on the Bridge plane. -/
def mixedZ (p : Int × Int) : Prop := p = (1, 0) ∨ p = (0, 5) ∨ p = (2, 5)

theorem mixed_is_fold_invariant : ∀ p, mixedZ p → mixedZ (2 - p.1, p.2) := by
  intro p hp
  rcases hp with h | h | h <;> subst h
  · exact Or.inl rfl
  · exact Or.inr (Or.inr rfl)
  · exact Or.inr (Or.inl rfl)

theorem mixed_recurrence_fails :
    mixedZ (1, 0) ∧ mixedZ (0, 5) ∧ ¬ (∀ p, mixedZ p → p.1 = 1) :=
  ⟨Or.inl rfl, Or.inr (Or.inl rfl), fun h => by
    have := h (0, 5) (Or.inr (Or.inl rfl)); cases this⟩

end RALi

/-- info: 'RALi.one_repeats_one' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.one_repeats_one
/-- info: 'RALi.the_step_is_the_claim' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.the_step_is_the_claim
/-- info: 'RALi.monism_posit_forces' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.monism_posit_forces
/-- info: 'RALi.finite_never_forces' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.finite_never_forces
/-- info: 'RALi.mixed_is_fold_invariant' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.mixed_is_fold_invariant
/-- info: 'RALi.mixed_recurrence_fails' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.mixed_recurrence_fails

/-! ## PART VI · Actualism. Only measured zeros are actual. -/
namespace RALi

/-- A zero set on a carrier, a line predicate, and the time at which each zero is measured
(none if never). The actual zeros at time T are those measured by T. -/
structure Actualized (α : Type) where
  Z        : α → Prop
  onLine   : α → Prop
  measured : α → Option Nat

def RHfull {α : Type} (A : Actualized α) : Prop := ∀ z, A.Z z → A.onLine z
def RHactual {α : Type} (A : Actualized α) : Prop :=
  ∀ z, A.Z z → A.measured z ≠ none → A.onLine z

/-- 21. The full claim yields the actual one. -/
theorem full_gives_actual {α : Type} (A : Actualized α) : RHfull A → RHactual A :=
  fun h z hz _ => h z hz

/-- 22. The actual claim does not yield the full one: one never-measured zero off the line. -/
def unreached : Actualized Bool := ⟨fun _ => True, fun b => b = true, fun b => if b then some 0 else none⟩

theorem actual_not_full : RHactual unreached ∧ ¬ RHfull unreached := by
  refine ⟨fun z _ hm => ?_, fun h => by cases h false trivial⟩
  cases z
  · exact absurd rfl hm
  · rfl

/-- 23. Given sufficient time, every zero is measured, and then the actual claim over all
time is exactly the full claim: actualism re-routes to the same step and does not bypass it. -/
theorem sufficient_time {α : Type} (A : Actualized α) (reach : ∀ z, A.Z z → A.measured z ≠ none) :
    RHactual A ↔ RHfull A :=
  ⟨fun h z hz => h z hz (reach z hz), full_gives_actual A⟩

end RALi

/-- info: 'RALi.full_gives_actual' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.full_gives_actual
/-- info: 'RALi.actual_not_full' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.actual_not_full
/-- info: 'RALi.sufficient_time' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.sufficient_time

/-! ## PART VII · The constructed witness, reconstructed from Residual Monism.
The paper's witness is built from RA and read through RAF and RAM. Here the witness is
built from the Codex connector directly: one substrate, one involution serving both routes
(σ = σ′), and one principle that does not vary with the index. The index is time. -/
namespace RALi

structure Q4 where
  r : Int
  i : Int
  j : Int
  k : Int
  deriving DecidableEq, Repr

/-- The geometric route's involution and the formal route's involution, written apart. -/
def sigmaGeo (q : Q4) : Q4 := ⟨q.r, -q.i, -q.j, -q.k⟩
def sigmaForm (q : Q4) : Q4 := ⟨q.r, -q.i, -q.j, -q.k⟩

/-- THE MONISM WITNESS. One involution, one principle, one seed. -/
structure MonismWitness (P : Nat → Prop) : Prop where
  one_involution : ∀ q, sigmaGeo q = sigmaForm q
  uniform        : ∀ n m, P n ↔ P m
  seed           : P 0

/-- 24. The seat field is constructed, not posited: σ = σ′ holds by rfl. -/
theorem one_involution_constructed : ∀ q, sigmaGeo q = sigmaForm q := fun _ => rfl

/-- 25. The timeless reading and the timed reading coincide under one principle:
the claim over all time is the claim at one instant. Deleting time loses nothing. -/
theorem timeless_equals_timed (P : Nat → Prop) (u : ∀ n m, P n ↔ P m) :
    (∀ n, P n) ↔ P 0 :=
  ⟨fun h => h 0, fun h n => (u 0 n).mp h⟩

/-- 26. The witness closes the record, past and future. -/
theorem monism_closes (P : Nat → Prop) (w : MonismWitness P) : ∀ n, P n :=
  (timeless_equals_timed P w.uniform).mpr w.seed

/-- 27. The witness is exactly the claim: a monism witness for P exists iff P holds at
every index. Its value field carries the whole of the claim, as theorem 17 required. -/
theorem monism_witness_is_the_claim (P : Nat → Prop) :
    MonismWitness P ↔ ∀ n, P n :=
  ⟨monism_closes P, fun h => ⟨one_involution_constructed,
    fun n m => ⟨fun _ => h m, fun _ => h n⟩, h 0⟩⟩

/-- 28. Constructed at the model, as the paper constructs RA at one point. -/
theorem constructed_monism : MonismWitness (fun _ => True) :=
  ⟨one_involution_constructed, fun _ _ => Iff.rfl, trivial⟩

/-- 29. Unlike the RA witness, the monism witness is not silent on counter-models:
it cannot be constructed where the property breaks, so it decides by containing. -/
theorem monism_absent_on_breaks : ¬ MonismWitness (fun n => n = 0) :=
  fun w => absurd ((w.uniform 0 1).mp rfl) (by decide)

/-- 30. Run through the RA-Li bridge. Replace the bridge by the monism witness on Li's
sign stream: the witness, with Li's criterion, gives RH. -/
theorem monism_yields_RH (L : LiData) (hLi : LiCriterion L)
    (w : MonismWitness (fun n => L.nonneg (n + 1))) : L.RH :=
  hLi.mpr (fun n hn => by
    obtain ⟨k, rfl⟩ : ∃ k, n = k + 1 := ⟨n - 1, by omega⟩
    exact monism_closes _ w k)

/-- 31. And the price, stated: on ζ the witness exists iff every Li sign is nonnegative,
which by Li is RH. Reconstruction moves the owed bit into `uniform`; it does not remove it. -/
theorem monism_on_li_is_RH (L : LiData) (hLi : LiCriterion L) :
    MonismWitness (fun n => L.nonneg (n + 1)) ↔ L.RH := by
  rw [monism_witness_is_the_claim]
  refine ⟨fun h => monism_yields_RH L hLi ((monism_witness_is_the_claim _).mpr h), fun h n => ?_⟩
  exact (hLi.mp h) (n + 1) (by omega)

end RALi

/-- info: 'RALi.one_involution_constructed' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.one_involution_constructed
/-- info: 'RALi.timeless_equals_timed' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.timeless_equals_timed
/-- info: 'RALi.monism_closes' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.monism_closes
/-- info: 'RALi.monism_witness_is_the_claim' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.monism_witness_is_the_claim
/-- info: 'RALi.constructed_monism' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.constructed_monism
/-- info: 'RALi.monism_absent_on_breaks' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.monism_absent_on_breaks
/-- info: 'RALi.monism_yields_RH' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RALi.monism_yields_RH
/-- info: 'RALi.monism_on_li_is_RH' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RALi.monism_on_li_is_RH

/-! ## PART VIII · Re-anchoring the monism witness to mathematical standard.
Calibration case: Perelman. The standard form of "one principle, the same result again"
is not a free uniformity; it is one dynamics, one invariant, and a PROVED transport of the
invariant along the dynamics (induction on the orbit; Lyapunov monotonicity; Perelman's
W-entropy under Ricci flow). -/
namespace RALi

/-- 32. Monism as a schema over all properties is inconsistent: uniformity cannot be
posited for every P. It must be anchored to a principle, not spread over properties. -/
theorem global_monism_inconsistent : ¬ ∀ P : Nat → Prop, ∀ n m, P n ↔ P m :=
  fun h => absurd ((h (fun n => n = 0) 0 1).mp rfl) (by decide)

def iter {S : Type} (f : S → S) : Nat → S → S
  | 0, s => s
  | n + 1, s => f (iter f n s)

/-- THE ANCHORED MONISM WITNESS. One substrate S, one principle f (the dynamics),
one invariant I, the transport of I along f, and a seed. -/
structure AnchoredMonism (S : Type) where
  f         : S → S
  I         : S → Prop
  transport : ∀ s, I s → I (f s)
  s0        : S
  seed      : I s0

/-- 33. The anchored witness closes its whole orbit, past and future. -/
theorem anchored_closes {S : Type} (A : AnchoredMonism S) : ∀ n, A.I (iter A.f n A.s0) := by
  intro n; induction n with
  | zero => exact A.seed
  | succ k ih => exact A.transport _ ih

/-- 34. The free monism witness is DERIVED from the anchored one: uniformity is no longer
posited, it is manufactured by the transport. -/
theorem anchored_derives_monism {S : Type} (A : AnchoredMonism S) :
    MonismWitness (fun n => A.I (iter A.f n A.s0)) :=
  ⟨one_involution_constructed,
   fun n m => ⟨fun _ => anchored_closes A m, fun _ => anchored_closes A n⟩,
   A.seed⟩

/-- 35. THE PERELMAN SHAPE. A quantity monotone along one flow, here a discrete flow on its
time index, is an anchored monism witness for the property "never below its start." Perelman's
W-entropy along Ricci flow has this shape; it is a structural analogue and is not formalized. -/
def lyapunovWitness (W : Nat → Int) (mono : ∀ n, W n ≤ W (n + 1)) : AnchoredMonism Nat :=
  ⟨Nat.succ, fun n => W 0 ≤ W n, fun n h => Int.le_trans h (mono n), 0, Int.le_refl _⟩

theorem lyapunov_is_monism (W : Nat → Int) (mono : ∀ n, W n ≤ W (n + 1)) :
    MonismWitness (fun n => W 0 ≤ W (iter Nat.succ n 0)) :=
  anchored_derives_monism (lyapunovWitness W mono)

/-- 36. The calibration's grade law: the closure is as strong as its transport. -/
structure GradedAnchor (S : Type) where
  A      : AnchoredMonism S
  tgrade : Grade

def closureGrade {S : Type} (G : GradedAnchor S) : Grade := Grade.weakest G.tgrade .theorem

theorem closure_grade_is_transport_grade {S : Type} (G : GradedAnchor S) :
    closureGrade G = G.tgrade := by
  unfold closureGrade Grade.weakest; cases G.tgrade <;> rfl

/-- 37. The RH instance. On Li's sign stream with the time step as the principle, an
anchored witness exists iff RH. The transport is `nonneg (n+1) → nonneg (n+2)`: the
ζ-analogue of Perelman's monotonicity formula, not yet proved by anyone. -/
theorem rh_anchor_is_the_claim (L : LiData) (hLi : LiCriterion L) :
    (∃ A : AnchoredMonism Nat, A.f = Nat.succ ∧ A.s0 = 0 ∧
        ∀ n, A.I n ↔ L.nonneg (n + 1)) ↔ L.RH := by
  constructor
  · rintro ⟨A, hf, hs, hI⟩
    apply (monism_on_li_is_RH L hLi).mp
    refine (monism_witness_is_the_claim _).mpr (fun n => ?_)
    have key : ∀ n, iter A.f n A.s0 = n := by
      intro n; induction n with
      | zero => exact hs
      | succ k ih => show A.f (iter A.f k A.s0) = k + 1; rw [ih, hf]
    have := anchored_closes A n
    rw [key n] at this
    exact (hI n).mp this
  · intro h
    have all := (monism_witness_is_the_claim _).mp ((monism_on_li_is_RH L hLi).mpr h)
    exact ⟨⟨Nat.succ, fun n => L.nonneg (n + 1), fun n _ => all (n + 1), 0, all 0⟩,
      rfl, rfl, fun _ => Iff.rfl⟩

end RALi

/-- info: 'RALi.global_monism_inconsistent' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.global_monism_inconsistent
/-- info: 'RALi.anchored_closes' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.anchored_closes
/-- info: 'RALi.anchored_derives_monism' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.anchored_derives_monism
/-- info: 'RALi.lyapunov_is_monism' depends on axioms: [propext] -/
#guard_msgs in #print axioms RALi.lyapunov_is_monism
/-- info: 'RALi.closure_grade_is_transport_grade' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.closure_grade_is_transport_grade
/-- info: 'RALi.rh_anchor_is_the_claim' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RALi.rh_anchor_is_the_claim

/-! ## PART IX · ζ's time has a proved monotonicity formula, and it runs the wrong way.
The de Bruijn-Newman heat flow H_t(z) = ∫ e^{t u²} Φ(u) cos(z u) du, Φ built from ξ.
de Bruijn (1950): if every zero of H_0 lies in |Im z| ≤ Δ, every zero of H_t lies in
|Im z| ≤ √max(Δ² − 2t, 0). RH is "all zeros of H_0 real". Λ is the least t with all zeros
of H_t real; Newman (1976) defined it, Rodgers-Tao (2020) proved Λ ≥ 0, Polymath 15 (2019)
proved Λ ≤ 0.22. So RH ⇔ Λ = 0. Modelled here on the strip bound, widths in Nat, half-steps
of time; a toy of the bound, not of the flow. -/
namespace RALi

/-- Squared strip width after t time steps: max(d2 − 2t, 0). -/
def flow (d2 t : Nat) : Nat := d2 - 2 * t
def realAt (d2 t : Nat) : Prop := flow d2 t = 0

/-- 38. THE MONOTONICITY FORMULA. The width never grows along ζ's time. -/
theorem flow_monotone (d2 t : Nat) : flow d2 (t + 1) ≤ flow d2 t := by
  unfold flow; omega

/-- 39. Its transport, proved: once every zero is real, every zero stays real. This is
de Bruijn's theorem in the toy, the ζ-analogue of Perelman's monotonicity, at theorem grade. -/
theorem reality_transported (d2 t : Nat) (h : realAt d2 t) : realAt d2 (t + 1) := by
  unfold realAt flow at *; omega

/-- Λ in the toy: the first time the strip closes. -/
def Lam (d2 : Nat) : Nat := (d2 + 1) / 2

theorem real_at_Lam (d2 : Nat) : realAt d2 (Lam d2) := by unfold realAt flow Lam; omega

/-- 40. In the toy, the strip is closed at time zero iff Λ = 0. For ζ, RH ↔ Λ = 0 is the cited
result of Newman with Rodgers and Tao and enters the cone as `hLam`. -/
theorem rh_iff_lambda_zero (d2 : Nat) : realAt d2 0 ↔ Lam d2 = 0 := by
  unfold realAt flow Lam
  exact ⟨fun h => by omega, fun h => by omega⟩

/-- 41. The anchored monism witness exists for ζ's time, transport proved, seeded at Λ.
It closes the whole future of the flow from Λ on. -/
def deBruijnWitness (d2 : Nat) : AnchoredMonism Nat :=
  ⟨Nat.succ, realAt d2, fun t h => reality_transported d2 t h, Lam d2, real_at_Lam d2⟩

theorem iter_succ (n s : Nat) : iter Nat.succ n s = s + n := by
  induction n with
  | zero => rfl
  | succ k ih => show Nat.succ (iter Nat.succ k s) = s + (k + 1); rw [ih]; omega

theorem future_closed (d2 n : Nat) : realAt d2 (Lam d2 + n) := by
  have := anchored_closes (deBruijnWitness d2) n
  rwa [show (deBruijnWitness d2).f = Nat.succ from rfl, iter_succ] at this

/-- 42. THE RECORD FORGETS. After one step the record of the width-zero state and the
width-one state coincide: the forward flow is even in the RH bit, so no readout of the
flowed record decides RH. This is the fTOE wall, T1, executed on ζ's own time. -/
theorem flowed_record_forgets (T : Nat) (hT : 1 ≤ T) :
    ¬ ∃ g : Nat → Bool, ∀ d2, g (flow d2 T) = decide (d2 = 0) := by
  rintro ⟨g, hg⟩
  have a := hg 0; have b := hg 1
  have e : flow 1 T = flow 0 T := by unfold flow; omega
  rw [e, a] at b
  exact absurd b (by decide)

/-- 43. The upstream direction is not a transport. Going backward from a real record,
both answers are admissible: the preimage of "real at T" holds the RH state and a non-RH
state. The forward arrow proves; the backward arrow must be supplied. -/
theorem upstream_is_not_forced (T : Nat) (hT : 1 ≤ T) :
    realAt 0 T ∧ realAt 1 T ∧ realAt 0 0 ∧ ¬ realAt 1 0 := by
  unfold realAt flow
  exact ⟨by omega, by omega, rfl, fun h => by omega⟩

end RALi

/-- info: 'RALi.flow_monotone' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RALi.flow_monotone
/-- info: 'RALi.reality_transported' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RALi.reality_transported
/-- info: 'RALi.rh_iff_lambda_zero' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RALi.rh_iff_lambda_zero
/-- info: 'RALi.future_closed' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RALi.future_closed
/-- info: 'RALi.flowed_record_forgets' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RALi.flowed_record_forgets
/-- info: 'RALi.upstream_is_not_forced' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RALi.upstream_is_not_forced

/-! ## PART X · Halted Uniduction with the category-gap eliminator. The regress, closed.
Every "missing piece" of Parts I-IX is a register's reading of one seat. Exhibit each as a
leg of one cone with apex RH; then the hunt has one gap, not a sequence of them. -/
namespace RALi

structure Hunt where
  S     : Substrate
  L     : LiData
  u0    : S.U
  hRA   : RA S
  hLi   : LiCriterion L
  lamZero : Prop                -- the upstream reading: Λ = 0
  hLam  : L.RH ↔ lamZero        -- Newman's definition with Rodgers-Tao, cited

/-- The legs. Each register's reading of the owed seat, proved equal to the apex. -/
theorem leg_bridge (H : Hunt) : Nonempty (Bridge H.S H.L) ↔ H.L.RH :=
  ⟨fun ⟨B⟩ => bridge_yields_RH H.S H.L H.hRA H.hLi B,
   fun h => ⟨⟨fun _ => H.u0, fun n hn _ => (H.hLi.mp h) n hn⟩⟩⟩

theorem leg_unity (H : Hunt) : Nonempty (Unity H.S H.L) ↔ H.L.RH :=
  ⟨fun ⟨u⟩ => retired_seal_is_sound H.S H.L H.hRA H.hLi u,
   fun h => let ⟨B⟩ := (leg_bridge H).mpr h; ⟨⟨B, .premise⟩⟩⟩

theorem leg_monism (H : Hunt) : MonismWitness (fun n => H.L.nonneg (n + 1)) ↔ H.L.RH :=
  monism_on_li_is_RH H.L H.hLi

theorem leg_transport (H : Hunt) :
    (∃ A : AnchoredMonism Nat, A.f = Nat.succ ∧ A.s0 = 0 ∧ ∀ n, A.I n ↔ H.L.nonneg (n + 1))
      ↔ H.L.RH :=
  rh_anchor_is_the_claim H.L H.hLi

theorem leg_upstream (H : Hunt) : H.lamZero ↔ H.L.RH := H.hLam.symm

/-- The five readings, as a diagram of propositions. -/
inductive Reg5 | bridge | unity | monism | transport | upstream deriving DecidableEq, Repr

def D5 (H : Hunt) : Reg5 → Prop
  | .bridge    => Nonempty (Bridge H.S H.L)
  | .unity     => Nonempty (Unity H.S H.L)
  | .monism    => MonismWitness (fun n => H.L.nonneg (n + 1))
  | .transport => ∃ A : AnchoredMonism Nat, A.f = Nat.succ ∧ A.s0 = 0 ∧ ∀ n, A.I n ↔ H.L.nonneg (n + 1)
  | .upstream  => H.lamZero

/-- 44. THE CONE. RH is the apex of a cone over all five readings, every leg an
equivalence: the category gaps between the hunt's registers are eliminated. -/
theorem hunt_cone (H : Hunt) : ∀ r, D5 H r ↔ H.L.RH := by
  intro r; cases r
  · exact leg_bridge H
  · exact leg_unity H
  · exact leg_monism H
  · exact leg_transport H
  · exact leg_upstream H

/-- 45. ONE GAP. Any two readings are the same proposition. The quantity monotone against
the flow (upstream) IS the bridge's read, the unity posit, the monism field, the transport. -/
theorem one_gap (H : Hunt) (r s : Reg5) : D5 H r ↔ D5 H s :=
  (hunt_cone H r).trans (hunt_cone H s).symm

/-- 46. THE HALT. Every proposition proved equivalent to the hypothesis lands on the same apex
as the five readings; which future propositions are equivalent is not decided here. -/
theorem regress_halts (H : Hunt) (P : Prop) (hP : P ↔ H.L.RH) (r : Reg5) : P ↔ D5 H r :=
  hP.trans (hunt_cone H r).symm

/-- 47. Given a true proposition Q, proving Q → RH is the same as proving RH: conditioning on a
true premise adds nothing (Theorem E of the prior paper, here on the hunt's apex). -/
theorem nothing_weaker (H : Hunt) (Q : Prop) (hq : Q) : (Q → H.L.RH) ↔ H.L.RH :=
  ⟨fun f => f hq, fun h _ => h⟩

end RALi

/-- info: 'RALi.hunt_cone' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RALi.hunt_cone
/-- info: 'RALi.one_gap' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RALi.one_gap
/-- info: 'RALi.regress_halts' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RALi.regress_halts
/-- info: 'RALi.nothing_weaker' does not depend on any axioms -/
#guard_msgs in #print axioms RALi.nothing_weaker

/-! ## PART X, completed · a sufficient route closes every reading at once. -/
namespace RALi

/-- 48. Theorem 46 covers every reformulation equivalent to the apex. A route strictly
stronger than the apex (a specific operator, a hypothesis over a family) is not equivalent,
and it does not open a new gap either: any sufficient route supplies all five readings. -/
theorem sufficient_closes_all (H : Hunt) (P : Prop) (hP : P → H.L.RH) (p : P) :
    ∀ r, D5 H r :=
  fun r => (hunt_cone H r).mpr (hP p)

end RALi

/-- info: 'RALi.sufficient_closes_all' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RALi.sufficient_closes_all

/-! ## PART XI · Timeless Residual Monism, stated as Postulate M, and its equivalence with the line property. -/
namespace TimeLocus

def onLine (p : Int × Int) : Prop := p.1 = 1

/-- A timed world: the locus at each time, and the zeros present at each time. -/
structure World where
  locus : Nat → (Int × Int → Prop)
  zeros : Nat → (Int × Int → Prop)

/-- TIME PSP premise: prior and posterior locus are the SAME locus, the line, at every time. -/
def SameLocus (W : World) : Prop := ∀ t p, W.locus t p ↔ onLine p

/-- The claim to be tested: every zero at every time is bound to the locus. -/
def Bound (W : World) : Prop := ∀ t p, W.zeros t p → W.locus t p

/-- Fold-invariance at every time: the functional equation acts at each iteration. -/
def FoldInv (W : World) : Prop := ∀ t p, W.zeros t p → W.zeros t (2 - p.1, p.2)

/-- 51. Given the same locus at all times, being bound IS the line property at all times. -/
theorem bound_iff_line (W : World) (h : SameLocus W) :
    Bound W ↔ ∀ t p, W.zeros t p → onLine p :=
  ⟨fun b t p z => (h t p).mp (b t p z), fun l t p z => (h t p).mpr (l t p z)⟩

/-- 52, the test world. A world where the locus is the same line at every time, the fold acts at every
    time, the on-line zero recurs at every time, and a mirror pair sits off the line at every time. -/
def testWorld : World :=
  ⟨fun _ p => onLine p, fun _ p => p = (1, 0) ∨ p = (0, 5) ∨ p = (2, 5)⟩

theorem test_same_locus : SameLocus testWorld := fun _ _ => Iff.rfl

theorem test_fold_inv : FoldInv testWorld := by
  intro _ p hp
  rcases hp with h | h | h <;> subst h
  · exact Or.inl rfl
  · exact Or.inr (Or.inr rfl)
  · exact Or.inr (Or.inl rfl)

theorem test_not_bound : ¬ Bound testWorld := fun b => by
  have := b 0 (0, 5) (Or.inr (Or.inl rfl)); cases this

/-- 52. Therefore SameLocus and FoldInv, at every time, do not imply Bound. -/
theorem time_does_not_bind :
    ¬ ∀ W : World, SameLocus W → FoldInv W → Bound W :=
  fun h => test_not_bound (h testWorld test_same_locus test_fold_inv)

end TimeLocus

namespace TimeLocus

/-- Residual Monism read as the Codex states it: one involution serves both routes. -/
def sigmaGeo (p : Int × Int) : Int × Int := (2 - p.1, p.2)
def sigmaForm (p : Int × Int) : Int × Int := (2 - p.1, p.2)
def OneInvolution : Prop := ∀ p, sigmaGeo p = sigmaForm p

/-- Residual Monism read as timeless: whether the zeros sit on the locus does not vary in time. -/
def P (W : World) (t : Nat) : Prop := ∀ p, W.zeros t p → onLine p
def Timeless (W : World) : Prop := ∀ t s, P W t ↔ P W s

/-- 53. Both readings hold in the counter-world: one involution by rfl, and timelessness because
    the property "all zeros on the line" is constantly false there. Timeless and unbound. -/
theorem monism_holds_in_counter_world :
    OneInvolution ∧ Timeless testWorld ∧ ¬ Bound testWorld :=
  ⟨fun _ => rfl, fun _ _ => Iff.rfl, test_not_bound⟩

/-- 54. What timeless monism does do: it makes one instant decide all time. With the seed, binding
    follows; the seed is "every zero present at the instant is on the line". -/
theorem timeless_with_seed_binds (W : World) (h : SameLocus W) (u : Timeless W) (s0 : P W 0) :
    Bound W :=
  (bound_iff_line W h).mpr (fun t p z => ((u 0 t).mp s0) p z)

end TimeLocus

namespace TimeLocus

/-- THE CONSTRUCTED WITNESS from RESIDUAL-MONISM + TIME PSP, as asked: one involution, the
    timeless interface (the Barzakh instant, t = 0, upstream of time), and the downstream times
    agreeing with it. No field is a premise; each must be built as a term. -/
structure MonismTimeWitness (W : World) : Prop where
  one_involution : OneInvolution
  same_locus     : SameLocus W
  timeless       : Timeless W
  interface      : P W 0          -- every zero present at the timeless interface is on the line

/-- 55. When it can be built, it proves the bound everywhere downstream. -/
theorem witness_proves_bound (W : World) (w : MonismTimeWitness W) : Bound W :=
  timeless_with_seed_binds W w.same_locus w.timeless w.interface

/-- 55, completed. It can be built exactly when the bound already holds: its existence IS the line property. -/
theorem witness_iff_bound (W : World) (h : SameLocus W) :
    Nonempty (MonismTimeWitness W) ↔ Bound W := by
  refine ⟨fun ⟨w⟩ => witness_proves_bound W w, fun b => ?_⟩
  have l := (bound_iff_line W h).mp b
  exact ⟨⟨fun _ => rfl, h, fun t s => ⟨fun _ p z => l s p z, fun _ p z => l t p z⟩, fun p z => l 0 p z⟩⟩

/-- 56. Built at a model whose zeros are on the line, as the prior paper builds RA at one point. -/
def goodWorld : World := ⟨fun _ p => onLine p, fun _ p => p = (1, 0)⟩
theorem constructed_at_model : Nonempty (MonismTimeWitness goodWorld) :=
  (witness_iff_bound goodWorld (fun _ _ => Iff.rfl)).mpr (fun _ p z => by subst z; rfl)

/-- 57. Not buildable at the counter-world: the interface field fails there. -/
theorem not_constructible_off_line : ¬ Nonempty (MonismTimeWitness testWorld) :=
  fun w => test_not_bound ((witness_iff_bound testWorld test_same_locus).mp w)

end TimeLocus

namespace TimeLocus

/-- Postulate M on an enumerated zero set. Stage k is when a zero is located; L t says every
    zero located by stage t lies on the line; M says the truth of L t does not depend on t. -/
def Lstage {α : Type} (Z : α → Prop) (onL : α → Prop) (stage : α → Nat) (t : Nat) : Prop :=
  ∀ z, Z z → stage z ≤ t → onL z
def PostulateM {α : Type} (Z : α → Prop) (onL : α → Prop) (stage : α → Nat) : Prop :=
  ∀ t s, Lstage Z onL stage t ↔ Lstage Z onL stage s

/-- 49. POSTULATE M IS EQUIVALENT TO THE LINE PROPERTY, given the computed seed L 0 and an
    exhaustive enumeration (every zero is located at some finite stage, built into `stage`). -/
theorem postulateM_iff_line {α : Type} (Z : α → Prop) (onL : α → Prop) (stage : α → Nat)
    (seed : Lstage Z onL stage 0) :
    PostulateM Z onL stage ↔ ∀ z, Z z → onL z := by
  constructor
  · intro m z hz
    exact ((m 0 (stage z)).mp seed) z hz (Nat.le_refl _)
  · intro h t s
    exact ⟨fun _ z hz _ => h z hz, fun _ z hz _ => h z hz⟩

/-- 50. And Postulate M is not free: it holds in a world whose zeros are all on the line, and
    it cannot hold with the seed in a world with a located off-line zero. -/
theorem postulateM_decides {α : Type} (Z : α → Prop) (onL : α → Prop) (stage : α → Nat)
    (seed : Lstage Z onL stage 0) (z : α) (hz : Z z) (off : ¬ onL z) :
    ¬ PostulateM Z onL stage :=
  fun m => off ((postulateM_iff_line Z onL stage seed).mp m z hz)

end TimeLocus

/-- info: 'TimeLocus.bound_iff_line' does not depend on any axioms -/
#guard_msgs in #print axioms TimeLocus.bound_iff_line
/-- info: 'TimeLocus.time_does_not_bind' does not depend on any axioms -/
#guard_msgs in #print axioms TimeLocus.time_does_not_bind
/-- info: 'TimeLocus.monism_holds_in_counter_world' does not depend on any axioms -/
#guard_msgs in #print axioms TimeLocus.monism_holds_in_counter_world
/-- info: 'TimeLocus.timeless_with_seed_binds' does not depend on any axioms -/
#guard_msgs in #print axioms TimeLocus.timeless_with_seed_binds
/-- info: 'TimeLocus.witness_iff_bound' does not depend on any axioms -/
#guard_msgs in #print axioms TimeLocus.witness_iff_bound
/-- info: 'TimeLocus.constructed_at_model' does not depend on any axioms -/
#guard_msgs in #print axioms TimeLocus.constructed_at_model
/-- info: 'TimeLocus.not_constructible_off_line' does not depend on any axioms -/
#guard_msgs in #print axioms TimeLocus.not_constructible_off_line
/-- info: 'TimeLocus.postulateM_iff_line' does not depend on any axioms -/
#guard_msgs in #print axioms TimeLocus.postulateM_iff_line
/-- info: 'TimeLocus.postulateM_decides' does not depend on any axioms -/
#guard_msgs in #print axioms TimeLocus.postulateM_decides

/-! ## PART XII · The demand correctly addressed, and [.] at the collapse foundation. -/
namespace DotRH

inductive Token where
  | sealed | broken | opn | dot
  deriving DecidableEq, Repr

def Token.inEconomy : Token → Bool
  | .dot => false
  | _    => true

/-- I · THE COLLAPSE FOUNDATION and its stop. -/
structure Collapse (V : Prop) where
  Reg     : Type
  reading : Reg → Prop
  leg     : ∀ r, reading r ↔ V

-- Theorem 58.
theorem self_referential_limit {V : Prop} (C : Collapse V) (r s : C.Reg) :
    (C.reading r ↔ V) ∧ (C.reading r ↔ C.reading s) :=
  ⟨C.leg r, (C.leg r).trans (C.leg s).symm⟩

def emitAtFoundation {V : Prop} (_ : Collapse V) : Token := .dot
-- Theorem 59.
theorem value_marked_dot {V : Prop} (C : Collapse V) : emitAtFoundation C = .dot := rfl
theorem dot_is_not_a_verdict :
    Token.dot ≠ .sealed ∧ Token.dot ≠ .broken ∧ Token.dot ≠ .opn := by decide
theorem dot_outside_economy : Token.inEconomy .dot = false := rfl

def trivialCollapse (V : Prop) : Collapse V := ⟨Unit, fun _ => V, fun _ => Iff.rfl⟩

/-- Inside the collapse register, a demand for a verdict is a ghost: the register returns
    the same mark for the value and its negation. -/
-- Theorem 60.
theorem demand_is_ghost_in_register {V : Prop} (C : Collapse V) (C' : Collapse (¬ V)) :
    emitAtFoundation C = emitAtFoundation C' := rfl

/-- II · THE SELF-GROUNDING ROOT. A root R is self-grounding when acts occur and every act of
    adjudication, assent or denial, is itself an instance of R. Then a denial of R re-enacts R,
    no external proof adds to it, and a demand for one is a ghost. This is the seat of the
    analogy: a root that grounds itself cannot be proved from outside itself. -/
structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

-- Theorem 61.
theorem denial_reenacts_root {R : Prop} (G : SelfGrounding R) (denial : G.Act) : R :=
  G.instances denial

-- Theorem 61, completed.
theorem external_proof_adds_nothing {R : Prop} (G : SelfGrounding R) (Q : Prop) :
    (Q → R) ↔ R :=
  ⟨fun _ => G.instances G.anAct, fun r _ => r⟩

/-- The Root Axiom at the constructed domain is self-grounding: every act is a deed, and a
    deed actuates. -/
def RA : Prop := (0 : Int) < 1
def raSelfGrounding : SelfGrounding RA := ⟨Unit, (), fun _ => show (0 : Int) < 1 by decide⟩

/-- III · A HYPOTHESIS ABOUT AN OBJECT is not self-grounding. Its value is fixed by the object,
    acts do not instance it, and a finite witness can refute it. -/
structure Frame where
  S : Type
  τ : S → S
  Z : S → Prop

def LineProperty (X : Frame) : Prop := ∀ s, X.Z s → X.τ s = s

/-- A located zero off the line refutes the line property, constructively. -/
theorem refuted_by_witness (X : Frame) (s : X.S) (hz : X.Z s) (off : X.τ s ≠ s) :
    ¬ LineProperty X :=
  fun h => off (h s hz)

def twoPoint : Frame := ⟨Bool, fun b => !b, fun _ => True⟩

/-- On a frame whose line property fails, no occurring act can instance it: the line
    property of a frame is not self-grounding. -/
-- Theorem 62.
theorem line_not_self_grounding : ¬ Nonempty (SelfGrounding (LineProperty twoPoint)) :=
  fun ⟨G⟩ => refuted_by_witness twoPoint true trivial (fun h => Bool.noConfusion h) (G.instances G.anAct)

/-- IV · THE HARDENED FOUNDATION, in toto. The collapse marks the value [.] and the demand is
    a ghost inside that register; the self-grounding root cannot be proved from outside and
    re-enacts under denial; a hypothesis about an object is witness-refutable and is not
    self-grounding, so the self-grounding exemption does not transfer to it. -/
theorem foundation_hardened :
    (∀ (V : Prop) (C : Collapse V), emitAtFoundation C = .dot) ∧
    Token.inEconomy .dot = false ∧
    (∀ (V : Prop) (C : Collapse V) (C' : Collapse (¬ V)), emitAtFoundation C = emitAtFoundation C') ∧
    (∀ Q : Prop, (Q → RA) ↔ RA) ∧
    (∀ a : Unit, RA ∧ raSelfGrounding.instances a = raSelfGrounding.instances a) ∧
    ¬ Nonempty (SelfGrounding (LineProperty twoPoint)) :=
  ⟨fun _ _ => rfl, rfl, fun _ _ _ => rfl, external_proof_adds_nothing raSelfGrounding,
   fun a => ⟨raSelfGrounding.instances a, rfl⟩, line_not_self_grounding⟩

/-! V · THE DEMAND, CORRECTLY ADDRESSED.
    "A proof of the Riemann Hypothesis cannot be demanded of the foundation. Every reading the
    foundation supplies is equivalent to the hypothesis, so any derivation from those readings
    alone would presuppose what it derives. The demand is well-posed when addressed to the
    object, the function zeta, whose structure fixes where its zeros lie." -/

/-- A foundation resource is any property of frames the foundation supplies. -/
def Resource := Frame → Prop

/-- (a) Misaddressed: any resource that also holds on a frame where the line property fails
    cannot, by itself, yield the line property on every frame it covers. -/
-- Theorem 63.
theorem misaddressed_to_foundation (R : Resource) (hR : R twoPoint) :
    ¬ ∀ X, R X → LineProperty X :=
  fun h => refuted_by_witness twoPoint true trivial (fun e => Bool.noConfusion e) (h twoPoint hR)

/-- (b) Presupposition: a derivation of the value from a reading equivalent to it uses the
    value's own content; the reading and the value stand or fall together. -/
-- Theorem 64.
theorem derivation_presupposes {V P : Prop} (leg : P ↔ V) : (P → V) ∧ (V → P) ∧ (¬ V → ¬ P) :=
  ⟨leg.mp, leg.mpr, fun nv p => nv (leg.mp p)⟩

/-- (c) Well-addressed: the object decides. A frame settles its own line property, in one
    direction by a located off-line witness, in the other by its own structure. -/
def onLineFrame : Frame := ⟨Unit, fun u => u, fun _ => True⟩
-- Theorem 65.
theorem object_decides :
    ¬ LineProperty twoPoint ∧ LineProperty onLineFrame :=
  ⟨refuted_by_witness twoPoint true trivial (fun e => Bool.noConfusion e), fun _ _ => rfl⟩

/-- THE DEMAND, IN TOTO. Made to the foundation, it is misaddressed and any answer from
    there presupposes the value; made to the object, it is well-posed and the object answers. -/
-- Theorem 66.
theorem demand_correctly_addressed :
    (∀ R : Resource, R twoPoint → ¬ ∀ X, R X → LineProperty X) ∧
    (∀ {V P : Prop}, (P ↔ V) → (¬ V → ¬ P)) ∧
    (¬ LineProperty twoPoint ∧ LineProperty onLineFrame) :=
  ⟨misaddressed_to_foundation, fun leg => (derivation_presupposes leg).2.2, object_decides⟩

end DotRH

namespace DotRH
/-- Theorem 67. Attached to the paper's cone: the readings of Parts X and XI collapse onto
    the hypothesis, and the foundation marks the value [.]. -/
def rhCollapse (H : RALi.Hunt) : Collapse H.L.RH := ⟨RALi.Reg5, RALi.D5 H, RALi.hunt_cone H⟩
theorem rh_marked_dot (H : RALi.Hunt) : emitAtFoundation (rhCollapse H) = .dot := rfl
end DotRH

/-- info: 'DotRH.self_referential_limit' does not depend on any axioms -/
#guard_msgs in #print axioms DotRH.self_referential_limit
/-- info: 'DotRH.value_marked_dot' does not depend on any axioms -/
#guard_msgs in #print axioms DotRH.value_marked_dot
/-- info: 'DotRH.dot_is_not_a_verdict' does not depend on any axioms -/
#guard_msgs in #print axioms DotRH.dot_is_not_a_verdict
/-- info: 'DotRH.demand_is_ghost_in_register' does not depend on any axioms -/
#guard_msgs in #print axioms DotRH.demand_is_ghost_in_register
/-- info: 'DotRH.denial_reenacts_root' does not depend on any axioms -/
#guard_msgs in #print axioms DotRH.denial_reenacts_root
/-- info: 'DotRH.external_proof_adds_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms DotRH.external_proof_adds_nothing
/-- info: 'DotRH.refuted_by_witness' does not depend on any axioms -/
#guard_msgs in #print axioms DotRH.refuted_by_witness
/-- info: 'DotRH.line_not_self_grounding' does not depend on any axioms -/
#guard_msgs in #print axioms DotRH.line_not_self_grounding
/-- info: 'DotRH.foundation_hardened' does not depend on any axioms -/
#guard_msgs in #print axioms DotRH.foundation_hardened
/-- info: 'DotRH.misaddressed_to_foundation' does not depend on any axioms -/
#guard_msgs in #print axioms DotRH.misaddressed_to_foundation
/-- info: 'DotRH.derivation_presupposes' does not depend on any axioms -/
#guard_msgs in #print axioms DotRH.derivation_presupposes
/-- info: 'DotRH.object_decides' does not depend on any axioms -/
#guard_msgs in #print axioms DotRH.object_decides
/-- info: 'DotRH.demand_correctly_addressed' does not depend on any axioms -/
#guard_msgs in #print axioms DotRH.demand_correctly_addressed
/-- info: 'DotRH.rh_marked_dot' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms DotRH.rh_marked_dot

/-! ## PART XIII · The six-register cone: Postulate M joined to the apex. -/
namespace SixCone

/-- The hunt with one more reading. The zeros are enumerated by stage, the seed holds, and
    the hypothesis is, by its definition, the line property of the enumerated zeros; that
    identification enters as the hypothesis `hDef`, carried by citation as Li's criterion and
    Newman's equivalence are. -/
structure Hunt6 extends RALi.Hunt where
  α     : Type
  Z     : α → Prop
  onL   : α → Prop
  stage : α → Nat
  seed  : TimeLocus.Lstage Z onL stage 0
  hDef  : L.RH ↔ ∀ z, Z z → onL z

inductive Reg6 where
  | five (r : RALi.Reg5)
  | postulateM

def D6 (H : Hunt6) : Reg6 → Prop
  | .five r     => RALi.D5 H.toHunt r
  | .postulateM => TimeLocus.PostulateM H.Z H.onL H.stage

-- Theorem 68.
/-- The cone over six readings: the five of Part X and Postulate M, every leg an equivalence
    with the hypothesis. -/
theorem hunt_cone6 (H : Hunt6) : ∀ r, D6 H r ↔ H.L.RH := by
  intro r
  cases r with
  | five r => exact RALi.hunt_cone H.toHunt r
  | postulateM =>
      exact (TimeLocus.postulateM_iff_line H.Z H.onL H.stage H.seed).trans H.hDef.symm

-- Theorem 69.
/-- The collapse foundation over six readings, and its mark on the value. -/
def rhCollapse6 (H : Hunt6) : DotRH.Collapse H.L.RH := ⟨Reg6, D6 H, hunt_cone6 H⟩
theorem rh_marked_dot6 (H : Hunt6) : DotRH.emitAtFoundation (rhCollapse6 H) = .dot := rfl

end SixCone

/-- info: 'SixCone.hunt_cone6' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SixCone.hunt_cone6
/-- info: 'SixCone.rh_marked_dot6' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SixCone.rh_marked_dot6

namespace DotRH
-- Theorem 63, general form.
/-- Any resource that also holds on some frame whose line property fails cannot, by itself,
    yield the line property on every frame it covers. -/
theorem misaddressed_general (R : Resource) (Y : Frame) (hY : ¬ LineProperty Y) (hR : R Y) :
    ¬ ∀ X, R X → LineProperty X :=
  fun h => hY (h Y hR)
end DotRH

/-- info: 'DotRH.misaddressed_general' does not depend on any axioms -/
#guard_msgs in #print axioms DotRH.misaddressed_general

/-! ## PART XIV · The logical form of the hypothesis: the only existence lives in the denial. -/
namespace LogicalForm

-- Theorem 70.
/-- A universal sentence carries no existential import: over an empty zero set the line
    property holds vacuously. The hypothesis posits no object. -/
theorem universal_posits_nothing {α : Type} (onL : α → Prop) :
    ∀ z : α, (fun _ => False) z → onL z :=
  fun _ h => h.elim

-- Theorem 71.
/-- The denial posits an object: a located zero off the line refutes the hypothesis. -/
theorem denial_posits_a_witness {α : Type} (Z onL : α → Prop) :
    (∃ z, Z z ∧ ¬ onL z) → ¬ ∀ z, Z z → onL z :=
  fun ⟨z, hz, off⟩ h => off (h z hz)

-- Theorem 72.
/-- With a decidable line predicate, the hypothesis fails only by a witness: it holds iff no
    off-line zero exists. The denial carries the whole existential load. -/
theorem fails_only_by_witness {α : Type} (Z onL : α → Prop) [∀ z, Decidable (onL z)] :
    (∀ z, Z z → onL z) ↔ ¬ ∃ z, Z z ∧ ¬ onL z := by
  constructor
  · intro h ⟨z, hz, off⟩; exact off (h z hz)
  · intro h z hz
    exact Decidable.byContradiction (fun off => h ⟨z, hz, off⟩)

-- Theorem 73.
/-- A witness is a finite check: for a decidable predicate on the naturals, one index at which
    the check fails refutes the universal, and the check at that index is a computation. -/
theorem witness_is_a_finite_check (bad : Nat → Bool) (n : Nat) (h : bad n = true) :
    ¬ ∀ m, bad m = false :=
  fun hall => by rw [hall n] at h; cases h

end LogicalForm

/-- info: 'LogicalForm.universal_posits_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms LogicalForm.universal_posits_nothing
/-- info: 'LogicalForm.denial_posits_a_witness' does not depend on any axioms -/
#guard_msgs in #print axioms LogicalForm.denial_posits_a_witness
/-- info: 'LogicalForm.fails_only_by_witness' does not depend on any axioms -/
#guard_msgs in #print axioms LogicalForm.fails_only_by_witness
/-- info: 'LogicalForm.witness_is_a_finite_check' does not depend on any axioms -/
#guard_msgs in #print axioms LogicalForm.witness_is_a_finite_check

namespace RHEngine

/-- THE ENGINE'S CONE. Every receipted theorem of the RH engine in one term, so one print shows
    what the engine adds to the environment's posits: nothing, only propext and Quot.sound. -/
theorem engineCone : True :=
  let _ := @RALi.bridge_yields_RH
  let _ := @RALi.bridge_is_keyed
  let _ := @RALi.no_uniform_bridge
  let _ := @RALi.li_is_a_bit_stream
  let _ := @RALi.xi0_retires_iff_unity
  let _ := @RALi.retired_seal_is_sound
  let _ := @RALi.retired_grade_capped
  let _ := @RALi.unity_is_keyed
  let _ := @RALi.ghost
  let _ := @RALi.common_phi_is_uniform
  let _ := @RALi.blind_constructions_die
  let _ := @RALi.mertens_nonneg
  let _ := @RALi.unitary_iff_on_line
  let _ := @RALi.off_line_forces_growth
  let _ := @RALi.stability_iff_line
  let _ := @RALi.one_repeats_one
  let _ := @RALi.the_step_is_the_claim
  let _ := @RALi.monism_posit_forces
  let _ := @RALi.finite_never_forces
  let _ := @RALi.mixed_is_fold_invariant
  let _ := @RALi.mixed_recurrence_fails
  let _ := @RALi.full_gives_actual
  let _ := @RALi.actual_not_full
  let _ := @RALi.sufficient_time
  let _ := @RALi.one_involution_constructed
  let _ := @RALi.timeless_equals_timed
  let _ := @RALi.monism_closes
  let _ := @RALi.monism_witness_is_the_claim
  let _ := @RALi.constructed_monism
  let _ := @RALi.monism_absent_on_breaks
  let _ := @RALi.monism_yields_RH
  let _ := @RALi.monism_on_li_is_RH
  let _ := @RALi.global_monism_inconsistent
  let _ := @RALi.anchored_closes
  let _ := @RALi.anchored_derives_monism
  let _ := @RALi.lyapunov_is_monism
  let _ := @RALi.closure_grade_is_transport_grade
  let _ := @RALi.rh_anchor_is_the_claim
  let _ := @RALi.flow_monotone
  let _ := @RALi.reality_transported
  let _ := @RALi.rh_iff_lambda_zero
  let _ := @RALi.future_closed
  let _ := @RALi.flowed_record_forgets
  let _ := @RALi.upstream_is_not_forced
  let _ := @RALi.hunt_cone
  let _ := @RALi.one_gap
  let _ := @RALi.regress_halts
  let _ := @RALi.nothing_weaker
  let _ := @RALi.sufficient_closes_all
  let _ := @TimeLocus.bound_iff_line
  let _ := @TimeLocus.time_does_not_bind
  let _ := @TimeLocus.monism_holds_in_counter_world
  let _ := @TimeLocus.timeless_with_seed_binds
  let _ := @TimeLocus.witness_iff_bound
  let _ := @TimeLocus.constructed_at_model
  let _ := @TimeLocus.not_constructible_off_line
  let _ := @TimeLocus.postulateM_iff_line
  let _ := @TimeLocus.postulateM_decides
  let _ := @DotRH.self_referential_limit
  let _ := @DotRH.value_marked_dot
  let _ := @DotRH.dot_is_not_a_verdict
  let _ := @DotRH.demand_is_ghost_in_register
  let _ := @DotRH.denial_reenacts_root
  let _ := @DotRH.external_proof_adds_nothing
  let _ := @DotRH.refuted_by_witness
  let _ := @DotRH.line_not_self_grounding
  let _ := @DotRH.foundation_hardened
  let _ := @DotRH.misaddressed_to_foundation
  let _ := @DotRH.derivation_presupposes
  let _ := @DotRH.object_decides
  let _ := @DotRH.demand_correctly_addressed
  let _ := @DotRH.rh_marked_dot
  let _ := @SixCone.hunt_cone6
  let _ := @SixCone.rh_marked_dot6
  let _ := @DotRH.misaddressed_general
  let _ := @LogicalForm.universal_posits_nothing
  let _ := @LogicalForm.denial_posits_a_witness
  let _ := @LogicalForm.fails_only_by_witness
  let _ := @LogicalForm.witness_is_a_finite_check
  trivial

end RHEngine

/-- info: 'RHEngine.engineCone' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RHEngine.engineCone

/-! ## THE DIRECTIONAL CAN'T · the ninth module. `Directional_Cant.lean` as the architect supplies it,
    sha256 eb4f0ced664d1bb7…, 60 lines, carried whole with each `#print axioms` pinned under `#guard_msgs`;
    the verbatim file stands at `protocols/RH One Bit/`. It declares no axiom and adds no posit. -/
/-!
# Directional_Cant.lean · the two "can'ts" are not equal: which one seals
Core Lean 4.19.0 · no library · no sorry · no axiom declaration.
Abstract: a proposition RH, a provability predicate for the foundation, and the one property
that makes the directions unequal, Σ₁-completeness: if a finite witness to the denial exists,
the foundation proves the denial. That property is carried as a named hypothesis (a cited
theorem of arithmetic), not proved here.
-/
namespace DirCant

structure Setting where
  RH        : Prop
  Prov      : Prop → Prop
  /-- Σ₁-completeness, carried as a hypothesis: a false RH is refutable. -/
  sigma1    : ¬ RH → Prov (¬ RH)
  /-- Soundness of the foundation on the denial: it proves ¬RH only if ¬RH. -/
  sound_neg : Prov (¬ RH) → ¬ RH

-- D1.
/-- THE SEALED DIRECTION. If the foundation can't refute the hypothesis, the hypothesis holds.
    The denial's "can't" is decisive. -/
theorem cant_refute_seals (S : Setting) (h : ¬ S.Prov (¬ S.RH)) : S.RH :=
  Classical.byContradiction (fun n => h (S.sigma1 n))

-- D2.
/-- The same, constructively, for a decidable hypothesis. -/
theorem cant_refute_seals_dec (S : Setting) [Decidable S.RH] (h : ¬ S.Prov (¬ S.RH)) : S.RH :=
  Decidable.byContradiction (fun n => h (S.sigma1 n))

-- D3.
/-- And conversely, under soundness on the denial: the hypothesis holds exactly when the
    foundation can't refute it. The denial's "can't" and the hypothesis are one statement. -/
theorem rh_iff_cant_refute (S : Setting) [Decidable S.RH] : S.RH ↔ ¬ S.Prov (¬ S.RH) :=
  ⟨fun r p => S.sound_neg p r, cant_refute_seals_dec S⟩

-- D4.
/-- THE UNSEALED DIRECTION. The assent's "can't" decides nothing: a setting where the
    hypothesis holds and the foundation can't prove it (independence) satisfies every field. -/
def independentTrue : Setting :=
  ⟨True, fun _ => False, fun n => absurd trivial n, fun p => p.elim⟩

theorem cant_prove_does_not_seal_false :
    independentTrue.RH ∧ ¬ independentTrue.Prov independentTrue.RH :=
  ⟨trivial, id⟩

-- D5.
/-- THE ASYMMETRY, IN ONE THEOREM. Can't-refute seals the hypothesis; can't-prove is compatible
    with the hypothesis being true; the two "can'ts" are not mirror images. -/
theorem asymmetry :
    (∀ S : Setting, ¬ S.Prov (¬ S.RH) → S.RH) ∧
    (∃ S : Setting, S.RH ∧ ¬ S.Prov S.RH) :=
  ⟨cant_refute_seals, ⟨independentTrue, cant_prove_does_not_seal_false⟩⟩

end DirCant

/-- info: 'DirCant.cant_refute_seals' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms DirCant.cant_refute_seals
/-- info: 'DirCant.cant_refute_seals_dec' does not depend on any axioms -/
#guard_msgs in #print axioms DirCant.cant_refute_seals_dec
/-- info: 'DirCant.rh_iff_cant_refute' does not depend on any axioms -/
#guard_msgs in #print axioms DirCant.rh_iff_cant_refute
/-- info: 'DirCant.cant_prove_does_not_seal_false' does not depend on any axioms -/
#guard_msgs in #print axioms DirCant.cant_prove_does_not_seal_false
/-- info: 'DirCant.asymmetry' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms DirCant.asymmetry

namespace DirCantCone

/-- The directional cone: every declaration of the ninth module, so its whole axiom footprint is pinned. -/
theorem dirCone : True :=
  let _ := @DirCant.cant_refute_seals
  let _ := @DirCant.cant_refute_seals_dec
  let _ := @DirCant.rh_iff_cant_refute
  let _ := @DirCant.independentTrue
  let _ := @DirCant.cant_prove_does_not_seal_false
  let _ := @DirCant.asymmetry
  trivial

end DirCantCone

/-- info: 'DirCantCone.dirCone' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms DirCantCone.dirCone

/-!
## RealPart · the division of the Riemann Hypothesis and the Real part proved
Harvested 2026-09-25 from A Formal Proof of the Real Part of the Riemann Hypothesis, v2.0.0
(10.5281/zenodo.22949645). The hypothesis divides at any height into a Real part and a Unicorn
part; the split is exact; the fused statement stands at its open part; the hypothesis is the
statement that the off-line zeros are unicorns; a certificate proves the Real part; and the road
holds under a bare computation arrow. Four sets axiom-free, two on propext and Quot.sound, none on choice. ΔM = 0.
-/
namespace RealPart

variable {α : Type}

/-- The line property on a zero set: every zero on the line. -/
def RH (Z onL : α → Prop) : Prop := ∀ z, Z z → onL z
/-- The Real part at height T: every zero up to T on the line. -/
def RealPartAt (Z onL : α → Prop) (height : α → Int) (T : Int) : Prop :=
  ∀ z, Z z → height z ≤ T → onL z
/-- The Unicorn part at height T: no off-line zero above T. -/
def UnicornAt (Z onL : α → Prop) (height : α → Int) (T : Int) : Prop :=
  ∀ z, Z z → height z > T → onL z

/-- The split is exact at every height. -/
theorem rh_iff_real_and_unicorn (Z onL : α → Prop) (height : α → Int) (T : Int) :
    RH Z onL ↔ RealPartAt Z onL height T ∧ UnicornAt Z onL height T := by
  constructor
  · intro h; exact ⟨fun z hz _ => h z hz, fun z hz _ => h z hz⟩
  · intro ⟨hr, hu⟩ z hz
    by_cases hle : height z ≤ T
    · exact hr z hz hle
    · exact hu z hz (by omega)

/-- Given the Real part, the fused hypothesis is exactly the Unicorn part: fusion lowers the
    proved part to the standing of the open one. -/
theorem fused_is_unicorn_given_real (Z onL : α → Prop) (height : α → Int) (T : Int)
    (hr : RealPartAt Z onL height T) : RH Z onL ↔ UnicornAt Z onL height T :=
  ⟨fun h z hz _ => h z hz, fun hu => (rh_iff_real_and_unicorn Z onL height T).2 ⟨hr, hu⟩⟩

/-- The unicorn identity: the hypothesis holds exactly when every sentence about the off-line
    zeros is vacuous, that is, when there is no off-line zero. -/
theorem rh_iff_unicorns (Z onL : α → Prop) [DecidablePred onL] :
    RH Z onL ↔ ¬ ∃ z, Z z ∧ ¬ onL z :=
  ⟨fun h ⟨z, hz, off⟩ => off (h z hz),
   fun h z hz => Decidable.byContradiction (fun off => h ⟨z, hz, off⟩)⟩

/-- A certificate: a complete list of the zeros up to T, each checked on the line. -/
structure Certificate (Z onL : α → Prop) (height : α → Int) (T : Int) where
  zeros    : List α
  complete : ∀ z, Z z → height z ≤ T → z ∈ zeros
  onLine   : ∀ z, z ∈ zeros → onL z

/-- A certificate proves the Real part at T, with no premise at all. -/
theorem real_part_of_certificate (Z onL : α → Prop) (height : α → Int) (T : Int)
    (c : Certificate Z onL height T) : RealPartAt Z onL height T :=
  fun z hz hle => c.onLine z (c.complete z hz hle)

/-- The bare computation arrow: the identity on a type, present with no premise. -/
def Arrow (β : Type) : Prop := Nonempty (β → β)
theorem arrow_exists (β : Type) : Arrow β := ⟨id⟩

/-- Any true premise plays the root's part in the road: keyless crossing, the undecided keyed
    sentence, and the identity round trip hold for an arbitrary true premise. -/
theorem any_true_premise_serves (R : Prop) (hR : R) {W : Type} (P : W → Prop) :
    ((∀ w, P w) → ∀ w, R → P w) ∧
    ((∃ w, ¬ P w) → ¬ ∀ w, R → P w) ∧
    (∀ w, (R ∧ P w) ↔ P w) :=
  ⟨fun hP w _ => hP w, fun ⟨w, hw⟩ h => hw (h w hR), fun _ => ⟨fun h => h.2, fun h => ⟨hR, h⟩⟩⟩

end RealPart

/-- info: 'RealPart.rh_iff_real_and_unicorn' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RealPart.rh_iff_real_and_unicorn
/-- info: 'RealPart.fused_is_unicorn_given_real' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms RealPart.fused_is_unicorn_given_real
/-- info: 'RealPart.rh_iff_unicorns' does not depend on any axioms -/
#guard_msgs in #print axioms RealPart.rh_iff_unicorns
/-- info: 'RealPart.real_part_of_certificate' does not depend on any axioms -/
#guard_msgs in #print axioms RealPart.real_part_of_certificate
/-- info: 'RealPart.arrow_exists' does not depend on any axioms -/
#guard_msgs in #print axioms RealPart.arrow_exists
/-- info: 'RealPart.any_true_premise_serves' does not depend on any axioms -/
#guard_msgs in #print axioms RealPart.any_true_premise_serves
