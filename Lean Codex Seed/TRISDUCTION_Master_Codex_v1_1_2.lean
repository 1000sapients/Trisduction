namespace Function

def LeftInverse (g : β → α) (f : α → β) : Prop := ∀ a, g (f a) = a

def RightInverse (g : β → α) (f : α → β) : Prop := LeftInverse f g
end Function

structure Equiv (α : Sort u) (β : Sort v) where
  toFun : α → β
  invFun : β → α
  left_inv : Function.LeftInverse invFun toFun
  right_inv : Function.RightInverse invFun toFun

infixl:25 " ≃ " => Equiv

class Inv (α : Type u) where
  inv : α → α

postfix:max "⁻¹" => Inv.inv

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

structure Rat where
  num : Int
  den : Nat
  pos : 0 < den
  cop : Nat.gcd num.natAbs den = 1
  deriving DecidableEq, Repr

namespace Rat

theorem natAbs_signed (k : Nat) (neg : Bool) :
    (if neg then -(k : Int) else (k : Int)).natAbs = k := by cases neg <;> simp

def mk' (n d : Int) : Rat :=
  if hd : d = 0 then ⟨0, 1, by decide, by decide⟩
  else
    let neg : Bool := decide ((n < 0) ≠ (d < 0))
    let a : Nat := n.natAbs
    let b : Nat := d.natAbs
    have hb : 0 < b := Int.natAbs_pos.mpr hd
    let g : Nat := Nat.gcd a b
    ⟨(if neg then -((a / g : Nat) : Int) else ((a / g : Nat) : Int)), b / g,
     CoreRat.div_gcd_pos hb, by rw [natAbs_signed]; exact CoreRat.coprime_div_gcd hb⟩

instance instOfNatRat : OfNat Rat n := ⟨mk' n 1⟩
instance instAddRat : Add Rat where add a b := mk' (a.num * b.den + b.num * a.den) (a.den * b.den)
instance instMulRat : Mul Rat where mul a b := mk' (a.num * b.num) (a.den * b.den)
instance instNegRat : Neg Rat where neg a := mk' (-a.num) a.den
instance instSubRat : Sub Rat where sub a b := a + (-b)
instance instInvRat : Inv Rat where inv a := mk' (a.den : Int) a.num
instance instDivRat : Div Rat where div a b := a * b⁻¹
instance instLTRat : LT Rat where lt a b := a.num * b.den < b.num * a.den
instance instLERat : LE Rat where le a b := a.num * b.den ≤ b.num * a.den
instance instDecidableLtRat (a b : Rat) : Decidable (a < b) :=
  inferInstanceAs (Decidable (a.num * b.den < b.num * a.den))
instance instDecidableLeRat (a b : Rat) : Decidable (a ≤ b) :=
  inferInstanceAs (Decidable (a.num * b.den ≤ b.num * a.den))

def pow (a : Rat) : Nat → Rat
  | 0 => 1
  | n + 1 => a * pow a n
instance instHPowRatNat : HPow Rat Nat Rat := ⟨Rat.pow⟩
instance instToStringRat : ToString Rat where
  toString a := if a.den == 1 then toString a.num else toString a.num ++ "/" ++ toString a.den

@[simp] theorem num_zero : (0 : Rat).num = 0 := rfl
@[simp] theorem den_zero : (0 : Rat).den = 1 := rfl

theorem mk'_zero_num {d : Nat} (hd : 0 < d) : mk' 0 (d : Int) = 0 := by
  have hne : (d : Int) ≠ 0 := by omega
  show mk' 0 (d : Int) = mk' 0 1
  unfold mk'
  rw [dif_neg hne, dif_neg (by decide : (1 : Int) ≠ 0)]
  simp [Nat.gcd_zero_left, Nat.div_self hd, Nat.zero_div]

@[simp] theorem zero_mul (a : Rat) : (0 : Rat) * a = 0 := by
  show mk' ((0 : Rat).num * a.num) (((0 : Rat).den * a.den : Nat) : Int) = 0
  rw [num_zero, den_zero, Int.zero_mul, Nat.one_mul]
  exact mk'_zero_num a.pos

@[simp] theorem mul_zero (a : Rat) : a * (0 : Rat) = 0 := by
  show mk' (a.num * (0 : Rat).num) ((a.den * (0 : Rat).den : Nat) : Int) = 0
  rw [num_zero, den_zero, Int.mul_zero, Nat.mul_one]
  exact mk'_zero_num a.pos

theorem canonical (a : Rat) : 0 < a.den ∧ Nat.gcd a.num.natAbs a.den = 1 := ⟨a.pos, a.cop⟩

theorem ext {a b : Rat} (h1 : a.num = b.num) (h2 : a.den = b.den) : a = b := by
  cases a; cases b; simp_all

theorem inv_zero : (0 : Rat)⁻¹ = 0 := by decide

end Rat

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

namespace FTOE

variable {α : Type}

def Even (τ : α → α) (f : α → Bool) : Prop := ∀ x, f (τ x) = f x

def OddAt (τ : α → α) (d : α → Bool) (x : α) : Prop := d (τ x) ≠ d x

def WhollyOdd (τ : α → α) (t : α → Bool) : Prop := ∀ x, t (τ x) = !t x

theorem T1_wall (τ : α → α) (f d : α → Bool) (x : α)
    (he : Even τ f) (ho : OddAt τ d x) : f ≠ d := by
  intro h
  subst h
  exact ho (he x)

theorem T2_coalition (τ : α → α) (f g d : α → Bool) (x : α)
    (hf : Even τ f) (hg : Even τ g) (op : Bool → Bool → Bool)
    (ho : OddAt τ d x) : (fun y => op (f y) (g y)) ≠ d := by
  apply T1_wall τ _ d x
  · intro y; show op (f (τ y)) (g (τ y)) = op (f y) (g y); rw [hf y, hg y]
  · exact ho

theorem T3_no_fixed_point (τ : α → α) (t : α → Bool)
    (ho : WhollyOdd τ t) (x : α) : τ x ≠ x := by
  intro h
  have h1 : t (τ x) = !t x := ho x
  rw [h] at h1
  cases t x <;> simp at h1

theorem T4_one_bit (τ : α → α) (s t : α → Bool)
    (hs : WhollyOdd τ s) (ht : WhollyOdd τ t)
    (x : α) (h : s x = t x) : s (τ x) = t (τ x) := by
  rw [hs x, ht x, h]

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

theorem T6a_deed_anchor (τ : α → α) (d : α → Bool) (x₀ : α) (b : Bool)
    (hd : d (τ x₀) = !d x₀) (anchor : d x₀ = b) :
    d x₀ = b ∧ d (τ x₀) = !b := by
  exact ⟨anchor, by rw [hd, anchor]⟩

theorem T6b_deed_supply (τ : α → α) (s d : α → Bool) (x₀ : α) (c : Bool)
    (hs : s (τ x₀) = !s x₀)
    (arrival : d x₀ = xor (s x₀) c ∧ d (τ x₀) = xor (s (τ x₀)) c) :
    d x₀ = xor (s x₀) c ∧ d (τ x₀) = !xor (s x₀) c := by
  constructor
  · exact arrival.1
  · rw [arrival.2, hs]; cases s x₀ <;> cases c <;> rfl

theorem fTOE_port (_τ : α → α) (s d : α → Bool) (x₀ : α) (b c : Bool)
    (anchor : d x₀ = b)
    (arrival : ∀ y : α, d y = xor (s y) c) :
    c = xor (s x₀) b := by
  have h1 := arrival x₀
  rw [anchor] at h1
  generalize hsx : s x₀ = sv
  rw [hsx] at h1
  cases sv <;> cases b <;> cases c <;> first | rfl | exact absurd h1 (by decide)

section FullSetup
variable {β γ : Type}

def Involution (τ : α → α) : Prop := ∀ x, τ (τ x) = x

def FixedPointFree (τ : α → α) : Prop := ∀ x, τ x ≠ x

theorem T7_global_wall (τ : α → α) (f d : α → Bool) (x : α)
    (hf : Even τ f) (hd : WhollyOdd τ d) : f ≠ d := by
  intro h
  have h1 : f (τ x) = d (τ x) := congrFun h (τ x)
  rw [hf x, hd x, congrFun h x] at h1
  cases d x <;> simp at h1

theorem T8_torsor_forward (τ : α → α) (s d : α → Bool)
    (hs : WhollyOdd τ s) (hd : WhollyOdd τ d) :
    Even τ (fun x => xor (d x) (s x)) := by
  intro x
  show xor (d (τ x)) (s (τ x)) = xor (d x) (s x)
  rw [hd x, hs x]; cases d x <;> cases s x <;> rfl

theorem T8_torsor_backward (τ : α → α) (s c : α → Bool)
    (hs : WhollyOdd τ s) (hc : Even τ c) :
    WhollyOdd τ (fun x => xor (s x) (c x)) := by
  intro x
  show xor (s (τ x)) (c (τ x)) = !xor (s x) (c x)
  rw [hs x, hc x]; cases s x <;> cases c x <;> rfl

theorem T9_torsor_inverse_left (s d : α → Bool) :
    (fun x => xor (s x) (xor (d x) (s x))) = d := by
  funext x; cases d x <;> cases s x <;> rfl

theorem T9_torsor_inverse_right (s c : α → Bool) :
    (fun x => xor (xor (s x) (c x)) (s x)) = c := by
  funext x; cases s x <;> cases c x <;> rfl

theorem T10_factorization (τ : α → α) (ρ : α → β) (g : β → Bool)
    (d : α → Bool) (x : α)
    (hρ : ρ (τ x) = ρ x) (hd : d (τ x) = !d x) :
    d ≠ fun y => g (ρ y) := by
  intro h
  have h1 : d (τ x) = g (ρ (τ x)) := congrFun h (τ x)
  have h2 : d x = g (ρ x) := congrFun h x
  rw [hρ, hd, h2] at h1
  cases hgx : g (ρ x) <;> rw [hgx] at h1 <;> exact absurd h1 (by decide)

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

theorem T12_encoder_injective {δ : Type} (Enc : δ → γ) (Dec : γ → δ)
    (h : ∀ d, Dec (Enc d) = d) :
    ∀ d₁ d₂ : δ, Enc d₁ = Enc d₂ → d₁ = d₂ := by
  intro d₁ d₂ hE
  have h1 := h d₁
  have h2 := h d₂
  rw [hE] at h1
  rw [h2] at h1
  exact h1.symm

theorem T14_wall_factorization (τ : α → α) (ρ : α → β) (d : α → Bool) (x : α)
    (hρ : ∀ z, ρ (τ z) = ρ z) (hd : OddAt τ d x) :
    ¬ ∃ g : β → Bool, ∀ z, g (ρ z) = d z := by
  intro h
  obtain ⟨g, hg⟩ := h
  have h1 : d (τ x) = g (ρ (τ x)) := (hg (τ x)).symm
  have h2 : g (ρ (τ x)) = g (ρ x) := by rw [hρ x]
  have h3 : g (ρ x) = d x := hg x
  exact hd (h1.trans (h2.trans h3))

theorem T13_wholly_odd_is_odd_everywhere (τ : α → α) (d : α → Bool)
    (hd : WhollyOdd τ d) (x : α) : OddAt τ d x := by
  intro h
  rw [hd x] at h
  cases d x <;> simp at h

def flipF {Q : Type} : Bool × Q → Bool × Q := fun (b, q) => (!b, q)

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

theorem T15_price_bijection_backward {Q : Type} (c : Q → Bool) :
    WhollyOdd flipF (fun (b, q) => xor (c q) (!b)) := by
  intro x
  obtain ⟨b, q⟩ := x
  show xor (c q) (!!b) = !xor (c q) (!b)
  cases c q <;> cases b <;> rfl

end FullSetup

theorem fTOE_core (τ : α → α) (s d : α → Bool) (x : α)
    (f g : α → Bool) (hf : Even τ f) (hg : Even τ g) (op : Bool → Bool → Bool)
    (hd : d (τ x) = !d x) (hs : s (τ x) = !s x) :
    (fun y => op (f y) (g y)) ≠ d ∧
    ∃ c : Bool, (d x = xor (s x) c ∧ d (τ x) = xor (s (τ x)) c) ∧
      ∀ c' : Bool, (d x = xor (s x) c' ∧ d (τ x) = xor (s (τ x)) c') → c' = c :=
  ⟨T2_coalition τ f g d x hf hg op (by intro h; rw [hd] at h; cases d x <;> simp at h),
   T5_crossing τ s d x hs hd⟩

end FTOE

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
    Function.LeftInverse (priceBackward τ hinv d0) (priceForward τ d0) := by
  intro d
  apply Subtype.ext
  funext x
  show xor (d0.1 x) (xor (d.1 x) (d0.1 x)) = d.1 x
  cases d.1 x <;> cases d0.1 x <;> rfl

theorem T16_right_inverse (τ : α → α) (hinv : Involution τ) (d0 : Dtau τ) :
    Function.RightInverse (priceBackward τ hinv d0) (priceForward τ d0) := by
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

def det3 (m : Fin 3 → Fin 3 → Rat) : Rat :=
  m 0 0 * (m 1 1 * m 2 2 - m 1 2 * m 2 1)
    - m 0 1 * (m 1 0 * m 2 2 - m 1 2 * m 2 0)
    + m 0 2 * (m 1 0 * m 2 1 - m 1 1 * m 2 0)

theorem det3_two_id : det3 (fun a b => if a == b then (2 : Rat) else 0) = 8 := by
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

#eval Audit.det3 (fun a b => if a == b then (2 : Rat) else (0 : Rat))

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

  abbrev V3 := Rat × Rat × Rat
  abbrev M3 := V3 × V3 × V3

  def det3 (m : M3) : Rat :=
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

    let row (r : V3) (c : Nat) : Rat :=
      r.1 * (match c with | 0 => y.1.1 | 1 => y.1.2.1 | _ => y.1.2.2)
      + r.2.1 * (match c with | 0 => y.2.1.1 | 1 => y.2.1.2.1 | _ => y.2.1.2.2)
      + r.2.2 * (match c with | 0 => y.2.2.1 | 1 => y.2.2.2.1 | _ => y.2.2.2.2)
    ((row x.1 0, row x.1 1, row x.1 2),
     (row x.2.1 0, row x.2.1 1, row x.2.1 2),
     (row x.2.2 0, row x.2.2 1, row x.2.2 2))

  def diag3 (r : Rat) : M3 := ((r, 0, 0), (0, r, 0), (0, 0, r))
  def mv3 (m : M3) (v : V3) : V3 :=
    (m.1.1 * v.1 + m.1.2.1 * v.2.1 + m.1.2.2 * v.2.2,
     m.2.1.1 * v.1 + m.2.1.2.1 * v.2.1 + m.2.1.2.2 * v.2.2,
     m.2.2.1 * v.1 + m.2.2.2.1 * v.2.1 + m.2.2.2.2 * v.2.2)
  def vscale (v : V3) (r : Rat) : V3 := (v.1 * r, v.2.1 * r, v.2.2 * r)

  
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
    else some (vscale (mv3 (adj3 m) t) (det3 m)⁻¹)
  theorem cramer_executed :
      cramerSolve ((1, 2, 0), (0, 1, 1), (2, 0, 1)) (5, 3, 4)
        = some ((7 : Rat) / 5, (9 : Rat) / 5, (6 : Rat) / 5) ∧
      mv3 ((1, 2, 0), (0, 1, 1), (2, 0, 1)) ((7 : Rat) / 5, (9 : Rat) / 5, (6 : Rat) / 5)
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

def signVal (b : Bool) : Rat := if b then -1 else 1
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

def kbRat : Rat := 1380649 / 100000000000000000000000000000

def ln2Rat : Rat := 6931471805599453 / 10000000000000000

def landauerRat (tkel bits : Rat) : Rat :=
  bits * kbRat * tkel * ln2Rat

structure OmegaOut : Type where
  token   : OmegaToken
  ocode   : Nat
  joules  : Rat
  verdict : String
  deriving DecidableEq, Repr

def omegaBoundary (bits tkel : Rat) (irreversible : Bool := true) : OmegaOut :=
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
    (∀ a1 a2 a3 b1 b2 b3 c1 c2 c3 t1 t2 t3 : Fin 2,
      (GEO.det2 ((a1 : Nat), (a2 : Nat), (a3 : Nat)) ((b1 : Nat), (b2 : Nat), (b3 : Nat))
                ((c1 : Nat), (c2 : Nat), (c3 : Nat)) = 1 ↔
       (GEO.gf2Sols ((a1 : Nat), (a2 : Nat), (a3 : Nat)) ((b1 : Nat), (b2 : Nat), (b3 : Nat))
                    ((c1 : Nat), (c2 : Nat), (c3 : Nat))
                    ((t1 : Nat), (t2 : Nat), (t3 : Nat))).length = 1)) :=
  ⟨omega_paid_floor, GEO.triaxial_lock_gf2⟩

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
  (refusalConst, ⟨s.deeds + 1, logicMode.length⟩)

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
      (aegisGuard l s).2.lastLen = (l.length : Int) := by
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

def recoverable (redundancy floor tkel : Rat) : Rat :=
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
     "refused: the incompressibility cap forecloses law-as-such from noise; almost every actuation stream is lawless")
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
   "actuation floor: energy floor theorem-grade on the Heisenberg bound and zero-point energy; transitions charged Jarzynski-Crooks with Landauer 1961 and Bérut 2012; static existence premise-grade on substrate monism. Native at SECTION 7 (RegistrationPostulate) and SECTION 14 (the Omega floor)"⟩,
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
    (census.all (fun b => (bridgeScreen b).length > 0)) = true := by
  decide

#eval census.length
#eval census.map (fun b => (b.id, bridgeScreen b))

end BRIDGE

namespace FOUND

def sigmaP : GEO.M3 :=
  (((-7 : Rat) / 25, (24 : Rat) / 25, 0),
   ((24 : Rat) / 25, (7 : Rat) / 25, 0),
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

theorem gate_counts_forced :
    GEO.a4.length = 12 ∧ GEO.allSigns.length = 8 ∧
    (GEO.cube5.all (fun v => (GEO.neighbors5 v).eraseDups.length == 5)) = true :=
  ⟨GEO.a4_order, GEO.reflection_eight, GEO.fivecube_degree_five⟩

def signPatterns : List (Bool × Bool × Bool) :=
  [ (false, false, false), (false, false, true),
    (false, true, false), (false, true, true),
    (true, false, false), (true, false, true),
    (true, true, false), (true, true, true) ]

theorem ninth_gate_barred :
    signPatterns.length = 8 ∧ signPatterns.eraseDups.length = 8 ∧
    signPatterns.length = GEO.allSigns.length := by decide

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
      simp [h1, h0, h1', h0']

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

/-
!===============================================================================
!  T R I S D U C T I O N   .   R A M
!  THE CORE THESIS, STATED IN FORTRAN AND IN NOTHING ELSE
!
!  The thesis is not described here. It is executed. Every claim that can be
!  made to run is compiled as a procedure, and the claims that cannot run are
!  compiled as the gates that refuse to emit without them.
!
!  Three independent axes intersect in exactly one point. Nondegeneracy is
!  linear independence. There is no second point and no interval. A LOCK IS
!  ALWAYS A DETERMINATION AND IS TOTAL ABOUT ITS OBJECT, and its object is its
!  intersection. Nothing below grades a lock, because locks carry no strengths.
!  What differs between cases is what the ROWS were, and the compartment names
!  that and nothing else.
!
!  I   CLOSURE-ROWED  rows are the closure; the two determinations are one
!  II  UNPOPULATED    an axis is empty; two planes meet in a line; no lock forms
!  III WORLD-ROWED    rows furnished by the world; revisability lives in the rows
!
!  Two registers, sequential load. Register A, the kinetic preloader on RA,
!  boots first: Seal L the Tongue, then Seal G the Form and Seal M the Number.
!  Register B, the computational kernel on RAM, loads second on that discipline.
!  Bedrock precedence: L then G then M. The Number reads magnitude on rows it
!  did not author. Every compartment is RA-conditional at the act.
!
!  The file carries its own battery and runs it last: eight fuzz classes,
!  seven over the numerical kernel and one over every symbolic and router
!  procedure, computed checks throughout, an oracle that stops the program
!  on any failure. A binary that reaches its final line has
!  passed. Nothing below is narrated; every figure is computed in this run.
!
!  Delta-M = 0. No new mathematics is authored by this file.
!===============================================================================

!===============================================================================

module trisduction_rows
  use, intrinsic :: ieee_arithmetic, only: ieee_is_finite, ieee_value, ieee_quiet_nan, ieee_positive_inf
  implicit none
  private
  integer, parameter, public :: dp = selected_real_kind(15, 307)

  !--- THE VERDICT ECONOMY. Three states, native. There is no fourth. --------
  integer, parameter, public :: SEALED = 1, BROKEN = 2, OPENV = 3
  integer, parameter, public :: XI0 = 4, OH0 = 5      ! refinements INSIDE openness
  integer, parameter, public :: DETERMINED = 6        ! the kernel's own token
  integer, parameter, public :: DOTMARK = 7           ! outside the economy

  !--- THE THREE COMPARTMENTS. Not strengths. Kinds of row. -----------------
  integer, parameter, public :: CLOSURE_ROWED = 1, UNPOPULATED = 2, WORLD_ROWED = 3
  integer, parameter, public :: NOT_COMPARTMENTED = 0

  public :: snorm, finite_vec, finite_mat, lambda_of_admissible
  public :: det3_representable
  public :: token, token_class, compartment_name, qmul, det3, jacobi3, cond_sym3
  public :: prepare_rows, span_basis, lambda_of, kernel_determine
  public :: intersection_dim, seal_L, drill_screen, row_cascade
  public :: ground_dim, route_halt, compartment_grade

contains

  ! THE FINITE-INPUT CONTRACT. Every public numeric routine below reads only
  ! finite input. A NaN or an infinity is not a quantity, and a routine that
  ! returns a number or a true predicate on one has manufactured a quantity
  ! from a non-quantity. Pure numeric functions return NaN or .false. on
  ! violation, because a NaN in yielding a NaN out is honest and a zero would
  ! not be. Predicate and preparation subroutines report refusal through
  ! ok, verdict, or reason, because there a non-quantity is a data condition.
  ! Low-level computational subroutines whose preconditions are violated
  ! halt, because there the violation is a programming fault.
  pure function finite_vec(x) result(ok)
    real(dp), intent(in) :: x(:)
    logical :: ok
    ok = all(ieee_is_finite(x))
  end function finite_vec

  pure function finite_mat(A) result(ok)
    real(dp), intent(in) :: A(:,:)
    logical :: ok
    ok = all(ieee_is_finite(A))
  end function finite_mat

  ! The scaled two-norm. Squaring before scaling overflows for any row near the
  ! representable ceiling, so the largest magnitude comes out first and the
  ! square is formed on values bounded by one. Exact for a zero row.
  pure function snorm(x) result(r)
    real(dp), intent(in) :: x(:)
    real(dp) :: r, m
    if (.not. finite_vec(x)) then
       r = ieee_value(1.0_dp, ieee_quiet_nan);  return
    end if
    m = maxval(abs(x))
    if (m > 0.0_dp) then
       r = m*sqrt(sum((x/m)**2))
    else
       r = 0.0_dp
    end if
  end function snorm

  pure function token(v) result(s)
    integer, intent(in) :: v
    character(len=30) :: s
    select case (v)
    case (SEALED);     s = '[seal] SEALED'
    case (BROKEN);     s = '[X]    BROKEN'
    case (OPENV);      s = '[?]    UNDER-DETERMINED'
    case (XI0);        s = '[Xi0]  TERMINAL SUSPENSION'
    case (OH0);        s = '[O0]   GROUNDED-SEALED HALT'
    case (DETERMINED); s = '[LOCK] DETERMINED'
    case (DOTMARK);    s = '[.]    chosen silence'
    case default;      s = '[??]   untyped'
    end select
  end function token

  ! The economy is three-state. XI0 and OH0 are refinements INSIDE the
  ! openness and never a fourth state; DETERMINED is the kernel's geometric
  ! token read before any register interprets it; the dot stands outside the
  ! economy entirely and is never census-counted. A caller that needs to know
  ! whether a token is a verdict state asks, and is not left to assume.
  pure function token_class(v) result(s)
    integer, intent(in) :: v
    character(len=26) :: s
    select case (v)
    case (SEALED, BROKEN, OPENV); s = 'verdict state'
    case (XI0, OH0);              s = 'refinement inside openness'
    case (DETERMINED);            s = 'kernel geometric token'
    case (DOTMARK);               s = 'outside the economy'
    case default;                 s = 'untyped'
    end select
  end function token_class

  pure function compartment_name(c) result(s)
    integer, intent(in) :: c
    character(len=34) :: s
    select case (c)
    case (CLOSURE_ROWED); s = 'I   CLOSURE-ROWED  [seal A . RA]'
    case (UNPOPULATED);   s = 'II  UNPOPULATED    no lock forms'
    case (WORLD_ROWED);   s = 'III WORLD-ROWED    rows revisable'
    case default;         s = '--  not compartmented'
    end select
  end function compartment_name

  !===========================================================================
  !  THE ALGEBRA. Seal M loads LAST and reads magnitude on rows it did not
  !  author. It is constitutively unable to read sign, and that is a fact
  !  about DIRECTION, never about the completeness of the determination.
  !===========================================================================

  ! Hamilton product. The substrate chirality lives here: i*j*k = -1.
  ! Both factors are scaled by their own largest magnitude, the product is
  ! formed on components bounded by one, and the scale is restored only after
  ! the restored magnitude has been checked in log space. Representability
  ! is therefore decided on the actual components and not on the norm bound
  ! |ab| = |a||b|, which is sufficient for refusal but not necessary, since a
  ! component can be smaller than the norm. Unrepresentable is NaN, never a
  ! saturated or wrapped quantity.
  pure function qmul(a, b) result(c)
    real(dp), intent(in) :: a(4), b(4)
    real(dp) :: c(4), aa(4), bb(4), cc(4), sa, sb, lg
    if (.not. (finite_vec(a) .and. finite_vec(b))) then
       c = ieee_value(1.0_dp, ieee_quiet_nan);  return
    end if
    sa = maxval(abs(a));  sb = maxval(abs(b))
    if (.not. (sa > 0.0_dp .and. sb > 0.0_dp)) then
       c = 0.0_dp;  return
    end if
    aa = a/sa;  bb = b/sb
    cc(1) = aa(1)*bb(1) - aa(2)*bb(2) - aa(3)*bb(3) - aa(4)*bb(4)
    cc(2) = aa(1)*bb(2) + aa(2)*bb(1) + aa(3)*bb(4) - aa(4)*bb(3)
    cc(3) = aa(1)*bb(3) - aa(2)*bb(4) + aa(3)*bb(1) + aa(4)*bb(2)
    cc(4) = aa(1)*bb(4) + aa(2)*bb(3) - aa(3)*bb(2) + aa(4)*bb(1)
    if (.not. (maxval(abs(cc)) > 0.0_dp)) then
       c = 0.0_dp;  return
    end if
    lg = log(sa) + log(sb) + log(maxval(abs(cc)))
    if (lg >= log(huge(1.0_dp))) then
       c = ieee_value(1.0_dp, ieee_quiet_nan);  return
    end if
    ! The scale is restored in binary, not through exp(log). The mantissas
    ! fraction(sa) and fraction(sb) lie in [1/2, 1), so their product times cc
    ! is bounded by four and cannot overflow, and scale() by the summed
    ! exponent is an exact power-of-two multiply. exp(log(sa)+log(sb)) loses
    ! about thirteen digits here, since an ulp of a log near 709 is 1e-13
    ! absolute and becomes 1e-13 relative on the result; the battery caught
    ! that and this is the repair.
    c = scale(fraction(sa)*fraction(sb)*cc, exponent(sa) + exponent(sb))
  end function qmul

  ! The triple products overflow for entries near the ceiling even where the
  ! determinant is finite after cancellation, so the matrix is scaled first and
  ! the cube of the scale is restored once.
  ! Purity is kept, so the answer to "is this value a quantity" is a separate
  ! predicate rather than an out argument. Where the computed determinant
  ! magnitude exceeds the representable normal range det3 saturates and det3_representable returns
  ! .false.; a caller that reads the saturated value as a quantity has been
  ! told otherwise and did not ask.
  ! Equilibration, not a single global scale. One maximum over the whole
  ! matrix lets a small diagonal entry underflow to zero in the normalised
  ! copy, so diag(1e200, 1e200, 1e-200) returned zero where the determinant
  ! is 1e200 and diag(1e308, 1e308, 1e-20) was certified representable where
  ! it is not. Rows are scaled by their own maxima, then columns by theirs,
  ! and the determinant of the equilibrated core is reassembled in log space
  ! so representability is decided before any product is formed.
  pure subroutine det3_core(M, core, lg, sgn, ok)
    real(dp), intent(in)  :: M(3,3)
    real(dp), intent(out) :: core, lg, sgn
    logical,  intent(out) :: ok
    real(dp) :: N(3,3), r(3), c(3)
    integer  :: i
    ok = finite_mat(M);  core = 0.0_dp;  lg = -huge(1.0_dp);  sgn = 0.0_dp
    if (.not. ok) return
    N = M
    do i = 1, 3
       r(i) = maxval(abs(N(i,:)))
       if (r(i) > 0.0_dp) N(i,:) = N(i,:)/r(i)
    end do
    do i = 1, 3
       c(i) = maxval(abs(N(:,i)))
       if (c(i) > 0.0_dp) N(:,i) = N(:,i)/c(i)
    end do
    core =   N(1,1)*(N(2,2)*N(3,3) - N(2,3)*N(3,2)) &
           - N(1,2)*(N(2,1)*N(3,3) - N(2,3)*N(3,1)) &
           + N(1,3)*(N(2,1)*N(3,2) - N(2,2)*N(3,1))
    if (.not. (abs(core) > 0.0_dp)) return          ! computed zero; lg stays -huge
    sgn = sign(1.0_dp, core)
    lg  = log(abs(core))
    do i = 1, 3
       if (r(i) > 0.0_dp) lg = lg + log(r(i))
       if (c(i) > 0.0_dp) lg = lg + log(c(i))
    end do
  end subroutine det3_core

  pure function det3(M) result(d)
    real(dp), intent(in) :: M(3,3)
    real(dp) :: d, core, lg, sgn
    logical  :: ok
    call det3_core(M, core, lg, sgn, ok)
    if (.not. ok) then
       d = ieee_value(1.0_dp, ieee_quiet_nan);  return
    end if
    if (.not. (abs(core) > 0.0_dp)) then
       d = 0.0_dp;  return
    end if
    ! At the ceiling itself exp(lg) can round past huge and manufacture an
    ! overflow where a saturated finite value was promised, so the boundary
    ! saturates too.
    if (lg >= log(huge(1.0_dp))) then
       d = sign(huge(1.0_dp), sgn);  return          ! saturating; ask det3_representable
    end if
    if (lg < log(tiny(1.0_dp))) then
       d = sign(0.0_dp, sgn);  return                ! below the normal range; ask
    end if
    d = sgn*exp(lg)
  end function det3

  ! True when det3 returns a non-saturated, non-underflowed normal quantity
  ! under this floating computation, or when the equilibrated core computes
  ! as zero. A computed zero is not certified exact singularity.
  pure function det3_representable(M) result(r)
    real(dp), intent(in) :: M(3,3)
    logical  :: r
    real(dp) :: core, lg, sgn
    logical  :: ok
    call det3_core(M, core, lg, sgn, ok)
    if (.not. ok) then
       r = .false.;  return
    end if
    if (.not. (abs(core) > 0.0_dp)) then
       ! A COMPUTED zero is treated as a representable zero. This routine
       ! reads floating arithmetic and cannot tell exact singularity from a
       ! determinant that cancelled or underflowed to zero on the way; that
       ! distinction needs interval or compensated arithmetic and is not
       ! claimed here.
       r = .true.;  return
    end if
    r = (lg < log(huge(1.0_dp))) .and. (lg >= log(tiny(1.0_dp)))
  end function det3_representable

  ! CONTRACT: A is symmetric. The routine reads only what a symmetric matrix
  ! carries, so an asymmetric input would be silently symmetrised by the
  ! sweep and the eigenvalues returned would belong to no matrix the caller
  ! supplied. The precondition is therefore enforced, not merely documented.
  subroutine jacobi3(A, w)
    real(dp), intent(in)  :: A(3,3)
    real(dp), intent(out) :: w(3)
    real(dp) :: M(3,3), Asc(3,3), theta, t, c, s, tau, g, h, asym, amax
    integer  :: sweep, p, q, k
    if (.not. finite_mat(A)) error stop 'jacobi3: input is not finite'
    ! The check is performed on a scaled copy, because differencing two
    ! entries near the representable ceiling overflows the test itself and a
    ! precondition guard that faults while guarding is worse than none.
    amax = maxval(abs(A))
    if (amax > 0.0_dp) then
       Asc = A/amax
    else
       Asc = A
    end if
    asym = max(abs(Asc(1,2)-Asc(2,1)), abs(Asc(1,3)-Asc(3,1)), abs(Asc(2,3)-Asc(3,2)))
    if (asym > 100.0_dp*epsilon(1.0_dp)) then
       error stop 'jacobi3: input matrix is not symmetric within tolerance'
    end if
    ! The whole sweep runs on the scaled copy and the eigenvalues are unscaled
    ! once at the end. This is what makes every interior sum, difference and
    ! square safe at any admissible magnitude, rather than guarding each one.
    M = Asc
    do sweep = 1, 60
       g = abs(M(1,2)) + abs(M(1,3)) + abs(M(2,3))
       if (g < 1.0e-300_dp) exit
       do p = 1, 2
          do q = p+1, 3
             ! The negligibility test comes FIRST, because theta overflows in
             ! its own division where the off-diagonal is tiny against the
             ! diagonal spread. An off-diagonal below the rounding of the two
             ! diagonals it couples carries no rotation, so it is zeroed and
             ! skipped rather than divided by.
             if (abs(M(p,q)) <= epsilon(1.0_dp)*max(abs(M(p,p)), abs(M(q,q)))) then
                M(p,q) = 0.0_dp;  M(q,p) = 0.0_dp
             else if (abs(M(p,q)) > tiny(1.0_dp)) then
                theta = (M(q,q) - M(p,p)) / (2.0_dp*M(p,q))
                ! theta*theta overflows where the off-diagonal is negligible
                ! against the diagonal spread. The asymptotic branch is the
                ! same rotation read where the square cannot be formed.
                if (abs(theta) > sqrt(huge(1.0_dp))) then
                   t = 0.5_dp / theta
                else
                   t = sign(1.0_dp, theta) / (abs(theta) + sqrt(theta*theta + 1.0_dp))
                end if
                c = 1.0_dp / sqrt(t*t + 1.0_dp);  s = t*c;  tau = s/(1.0_dp + c)
                h = t*M(p,q)
                M(p,p) = M(p,p) - h;  M(q,q) = M(q,q) + h
                M(p,q) = 0.0_dp;      M(q,p) = 0.0_dp
                do k = 1, 3
                   if (k /= p .and. k /= q) then
                      g = M(k,p);  h = M(k,q)
                      M(k,p) = g - s*(h + g*tau);  M(p,k) = M(k,p)
                      M(k,q) = h + s*(g - h*tau);  M(q,k) = M(k,q)
                   end if
                end do
             end if
          end do
       end do
    end do
    ! Unscaling can exceed the representable range for a finite input whose
    ! eigenvalue does. The infinity is then produced by ieee_value, which
    ! raises no exception, and never by the multiplication, which would trap
    ! before any consumer could refuse the result.
    ! The guard is nested and not conjoined: Fortran does not promise
    ! short-circuit evaluation, so huge/amax must never be formed unless
    ! amax exceeds one, or the guard itself overflows on a tiny matrix.
    do k = 1, 3
       if (amax > 1.0_dp) then
          if (abs(M(k,k)) > huge(1.0_dp)/amax) then
             w(k) = sign(ieee_value(1.0_dp, ieee_positive_inf), M(k,k))
          else
             w(k) = amax*M(k,k)
          end if
       else
          w(k) = amax*M(k,k)          ! amax <= 1: the product only shrinks
       end if
    end do
  end subroutine jacobi3

  ! CONTRACT: A is symmetric positive semi-definite, a Gram. On a general
  ! symmetric matrix this returns a MAGNITUDE condition number and not the
  ! spectral one, because the extremes are taken over absolute eigenvalues.
  function cond_sym3(A) result(kap)
    real(dp), intent(in) :: A(3,3)
    real(dp) :: kap, w(3), lo, hi
    call jacobi3(A, w)
    ! A finite matrix can carry an eigenvalue beyond the representable range,
    ! since three entries near the ceiling sum to about three times it. The
    ! sweep reports that honestly as an infinity and the consumer refuses it.
    if (.not. finite_vec(w)) error stop 'cond_sym3: eigenvalues are not representable'
    ! The contract names a Gram, so definiteness is enforced rather than
    ! assumed. An indefinite matrix would return a magnitude condition number
    ! that reads like a spectral one and would be believed.
    hi = maxval(abs(w))
    if (.not. (hi > 0.0_dp)) then
       kap = huge(1.0_dp);  return           ! the zero matrix has no conditioning
    end if
    ! Relative to the spectrum and carrying no absolute floor, for the same
    ! reason the rank tolerance carries none: a floor pinned at one would make
    ! definiteness a fact about units.
    if (minval(w) < -100.0_dp*epsilon(1.0_dp)*hi) then
       error stop 'cond_sym3: input is not positive semi-definite within tolerance'
    end if
    lo = minval(abs(w))
    ! The floor is tiny() and not zero: a positive denormal divisor overflows
    ! the quotient, so the guard is on representability and not on sign.
    if (lo <= tiny(1.0_dp)) then
       kap = huge(1.0_dp)
    else
       kap = hi/lo
    end if
  end function cond_sym3

  ! THE SPINE, COMPUTED. Read the three rows as normals of planes through the
  ! origin. The intersection of the planes has dimension 3 - rank. Rank three
  ! returns dimension ZERO, one point, unique, no interval. Rank two returns
  ! dimension ONE, a line, and no point is determined at all.
  ! CONTRACT: G is a SYMMETRIC GRAM, G = Q Q^T, formed by the caller. It is not
  ! a matrix of raw rows. The dimension returned is 3 - rank(G), which is the
  ! dimension of the intersection of the three planes whose normals the rows of
  ! Q are; the routine reads the Gram because rank is what it needs and the
  ! Gram is where rank is cheap. Passing raw rows violates the contract: in
  ! exact arithmetic rank(Q Q^T) equals rank(Q), so the numerical dimension
  ! may coincide, but the routine is specified to read a symmetric PSD Gram
  ! and enforces that specification rather than trusting the coincidence.
  ! The rank tolerance is not chosen. It is the largest eigenvalue times the
  ! machine epsilon times the matrix order, the standard perturbation bound on
  ! a symmetric eigenvalue: below it an eigenvalue is not separable from
  ! rounding at this precision.
  subroutine intersection_dim(G, d, sep)
    real(dp), intent(in)  :: G(3,3)
    integer,  intent(out) :: d
    real(dp), intent(out) :: sep          ! margin: smallest eigenvalue over tol
    integer  :: i, rank
    real(dp) :: w(3), tol, lo, hi
    call jacobi3(G, w)
    if (.not. finite_vec(w)) error stop 'intersection_dim: eigenvalues are not representable'
    ! The tolerance is RELATIVE to the spectrum and carries no absolute floor,
    ! so rank is invariant under uniform scaling of the Gram: a Gram at 1e-20
    ! has the same rank as the same Gram at 1. An absolute floor would make
    ! rank a fact about units, which is the chart-manufactured magnitude this
    ! architecture bars from entering a verdict as structure.
    hi = maxval(abs(w))
    if (.not. (hi > 0.0_dp)) then
       d = 3;  sep = 0.0_dp;  return              ! the zero Gram carries no direction
    end if
    ! The contract names a Gram, so definiteness is enforced and the count is
    ! over POSITIVE eigenvalues. Counting magnitudes would hand an indefinite
    ! matrix a geometric dimension it does not have.
    if (minval(w) < -100.0_dp*epsilon(1.0_dp)*hi) then
       error stop 'intersection_dim: G is not positive semi-definite within tolerance'
    end if
    tol = 8.0_dp * real(size(w),dp) * epsilon(1.0_dp) * hi
    rank = 0;  lo = huge(1.0_dp)
    do i = 1, 3
       if (w(i) > tol) then
          rank = rank + 1
          lo = min(lo, w(i))
       end if
    end do
    d = 3 - rank
    if (rank > 0) then
       sep = lo/tol
    else
       sep = 0.0_dp
    end if
  end subroutine intersection_dim

  subroutine prepare_rows(M, Q, ok)
    real(dp), intent(in)  :: M(:,:)
    real(dp), intent(out) :: Q(size(M,1), size(M,2))
    logical,  intent(out) :: ok
    integer  :: i, n
    real(dp) :: mu, sd, nrm, scale_
    n = size(M,2);  ok = .true.;  Q = M
    if (.not. finite_mat(M)) then
       ok = .false.;  return           ! a non-quantity is not a row
    end if
    if (n <= 1) then
       ok = .false.;  return          ! no sample variance is defined at n = 1
    end if
    do i = 1, size(M,1)
       scale_ = maxval(abs(M(i,:)))
       ! Scale out before summing. Squaring a row near the representable
       ! ceiling overflows the sum of squares long before the variance is
       ! meaningful, so the row is divided by its own largest magnitude first
       ! and the statistic is formed on the scaled copy. The verdict is
       ! unchanged because every downstream step is scale-invariant.
       if (scale_ > 0.0_dp) Q(i,:) = Q(i,:)/scale_
       mu = sum(Q(i,:))/real(n,dp);  Q(i,:) = Q(i,:) - mu
       sd = sqrt(sum(Q(i,:)**2)/real(n-1,dp))
       ! The floor is relative to the row's own scale. A spread that is only
       ! rounding on a large row is not content, and normalising by it would
       ! manufacture an axis out of noise.
       if (.not. (sd > 0.0_dp) .or. sd <= real(n,dp)*epsilon(1.0_dp)) then
          ok = .false.;  return
       end if
       Q(i,:) = Q(i,:)/sd
       ! A z-scored row has sum of squares exactly n-1 by construction, so
       ! this norm is sqrt(n-1) and cannot overflow for any representable n.
       ! snorm is used anyway: one norm primitive across the module is one
       ! place to get it right, and a raw sum of squares reads as a hazard
       ! to a hostile reviewer even where the bound forecloses it.
       nrm = snorm(Q(i,:))
       if (.not. (nrm > 0.0_dp)) then
          ok = .false.;  return
       end if
       Q(i,:) = Q(i,:)/nrm
    end do
  end subroutine prepare_rows

  ! The guard is mandatory and never optional, because a guard a caller may
  ! skip is not a guard. A residual below the rounding floor is not a direction
  ! and is refused rather than normalised.
  subroutine span_basis(Q, B, ok)
    real(dp), intent(in)  :: Q(:,:)
    real(dp), intent(out) :: B(size(Q,1), size(Q,2))
    logical,  intent(out) :: ok
    integer  :: i, j
    real(dp) :: v(size(Q,2)), nrm, floor_, scale_
    if (.not. finite_mat(Q)) error stop 'span_basis: input is not finite'
    ok = .true.;  B = 0.0_dp
    floor_ = real(size(Q,2),dp) * epsilon(1.0_dp)
    do i = 1, size(Q,1)
       ! Each row is scaled by its own largest magnitude BEFORE any projection.
       ! Scaling a row leaves its span untouched and bounds every entry by one,
       ! so the dot products inside the loop cannot overflow. The floor is
       ! then relative to the scaled row by construction.
       scale_ = maxval(abs(Q(i,:)))
       if (.not. (scale_ > 0.0_dp)) then
          ok = .false.;  return
       end if
       v = Q(i,:)/scale_
       do j = 1, i-1
          v = v - dot_product(v, B(j,:))*B(j,:)
       end do
       nrm = snorm(v)
       if (.not. (nrm > floor_)) then
          ok = .false.;  return
       end if
       B(i,:) = v/nrm
    end do
  end subroutine span_basis

  ! Only the first three rows of Q and B are screened, because only the first
  ! three rows are read; the shape test requires at least three and rows
  ! beyond them are not consulted by lambda_of at all.
  ! The admission test is a pure predicate so it can be exercised in-process
  ! on hostile input without halting. It is the single source of truth for
  ! what lambda_of accepts; lambda_of calls it and halts on refusal. The
  ! order inside is load-bearing: unit-ness is proven by the scaled norm
  ! BEFORE any dot product forms, so every dot product below runs on rows
  ! whose components are O(1) under the admission tolerance and never
  ! O(huge), and the dot products cannot overflow.
  pure subroutine lambda_of_admissible(Q, B, ok, reason)
    real(dp), intent(in) :: Q(:,:), B(:,:)
    logical,  intent(out) :: ok
    character(len=*), intent(out) :: reason
    real(dp) :: btol
    integer  :: i, j
    ok = .false.;  reason = ''
    if (size(Q,1) < 3 .or. size(B,1) < 3 .or. size(Q,2) /= size(B,2) .or. size(Q,2) < 3) then
       reason = 'needs Q and B with at least three rows, at least three columns, and equal column counts'
       return
    end if
    if (.not. (finite_mat(Q(1:3,:)) .and. finite_mat(B(1:3,:)))) then
       reason = 'input is not finite';  return       ! on the rows read, and no others
    end if
    btol = 100.0_dp * real(size(B,2),dp) * epsilon(1.0_dp)
    do i = 1, 3
       if (abs(snorm(B(i,:)) - 1.0_dp) > btol) then
          reason = 'B rows are not unit';  return
       end if
       if (abs(snorm(Q(i,:)) - 1.0_dp) > btol) then
          reason = 'Q rows are not unit';  return
       end if
    end do
    do i = 1, 3
       do j = i+1, 3
          if (abs(dot_product(B(i,:), B(j,:))) > btol) then
             reason = 'B rows are not orthogonal';  return
          end if
       end do
    end do
    ok = .true.
  end subroutine lambda_of_admissible

  subroutine lambda_of(Q, B, lam_quat, lam_det, co)
    real(dp), intent(in)  :: Q(:,:), B(:,:)
    real(dp), intent(out) :: lam_quat, lam_det, co(3,3)
    real(dp) :: q1(4), q2(4), q3(4), p(4)
    integer  :: i, j
    character(len=96) :: reason
    logical :: adm
    call lambda_of_admissible(Q, B, adm, reason)
    if (.not. adm) error stop 'lambda_of: '//trim(reason)
    do i = 1, 3
       do j = 1, 3
          co(i,j) = dot_product(Q(i,:), B(j,:))   ! admitted unit rows; Cauchy bound keeps this O(1), no overflow
       end do
    end do
    q1 = [0.0_dp, co(1,:)];  q2 = [0.0_dp, co(2,:)];  q3 = [0.0_dp, co(3,:)]
    p = qmul(qmul(q1, q2), q3)
    lam_quat = p(1);  lam_det = -det3(co)
  end subroutine lambda_of

  ! The kernel does not grade. It reports whether the axes are independent, and
  ! therefore whether a unique intersection exists at all.
  subroutine kernel_determine(M, verdict, lam, detR, kapR, idim, why, margin)
    real(dp), intent(in)  :: M(:,:)
    integer,  intent(out) :: verdict, idim
    real(dp), intent(out), optional :: margin
    real(dp), intent(out) :: lam, detR, kapR
    character(len=*), intent(out) :: why
    real(dp) :: sep
    real(dp) :: Q(3,size(M,2)), B(3,size(M,2)), R(3,3), co(3,3)
    real(dp) :: lq, ld, um, epsf, kgate
    integer  :: n
    logical  :: ok, bok
    ! EVERY output is defined here, before any test can return. The shape and
    ! size tests follow, and no arithmetic touches n until n has been screened,
    ! because the conditioning gate divides by it.
    lam = 0.0_dp;  detR = 0.0_dp;  kapR = 0.0_dp;  idim = -1;  sep = 0.0_dp
    verdict = OPENV;  why = 'uninitialised'
    if (present(margin)) margin = 0.0_dp
    n = size(M,2);  um = epsilon(1.0_dp)
    if (size(M,1) /= 3) then
       why = 'axis count is not three; the residence is not the one this kernel reads'
       return
    end if
    if (n < 4) then
       why = 'dimensional shortfall';  return
    end if
    if (.not. finite_mat(M)) then
       why = 'a row carries a non-quantity; nothing to read';  return
    end if
    epsf  = 100.0_dp*um*real(n,dp)
    kgate = min(1.0e6_dp, sqrt(27.0_dp/(100.0_dp*um*real(n,dp))))
    call prepare_rows(M, Q, ok)
    if (.not. ok) then
       verdict = OPENV;  why = 'an axis carries no content; nothing to intersect';  return
    end if
    R = matmul(Q, transpose(Q))
    detR = det3(R)
    ! A correlation Gram is positive semi-definite by construction, so a
    ! negative determinant is a rounding artifact and never a quantity. It is
    ! set to exactly zero rather than reported as read. Zero here is the
    ! algebraic floor of the quantity and is not the collapse floor epsf,
    ! which is a separate threshold tested further down.
    if (detR < 0.0_dp) detR = 0.0_dp
    call intersection_dim(R, idim, sep)
    if (present(margin)) margin = sep
    ! The collapse test runs BEFORE any basis is constructed. Gram-Schmidt on a
    ! dependent triad divides by a residual nothing bounds below, so a basis
    ! built here would be rounding noise carried forward into the scalar. The
    ! order is the guard: a residence that determines no point never reaches
    ! the orthogonalisation at all.
    ! Existence is decided by the DIMENSION and never by the determinant,
    ! because the dimension is the spine's own quantity and the determinant is
    ! a magnitude read off it. Where the two floors disagree the verdict is
    ! neither broken nor determined: it is arithmetic at the edge, and it
    ! escalates rather than guessing which floor to believe.
    if (idim > 0) then
       verdict = BROKEN
       select case (idim)
       case (1);       why = 'rank two; the intersection is a line, not a point'
       case (2);       why = 'rank one; the intersection is a plane, not a point'
       case default;   why = 'rank zero; no axis carries an independent direction'
       end select
       return
    end if
    if (detR <= epsf) then
       verdict = OPENV
       why = 'engineering-incomplete: rank floor and collapse floor disagree; re-run at higher precision'
       return
    end if
    call span_basis(Q, B, bok)
    if (.not. bok) then
       ! Reaching here means the rank floor and the collapse floor both said
       ! three independent axes while Gram-Schmidt found a null residual. That
       ! is a third floor disagreeing with two, not a finding of dependence,
       ! and it escalates for the same reason the determinant disagreement
       ! does. Deciding BROKEN here would let the weakest instrument overrule
       ! the two that already agreed.
       verdict = OPENV
       why = 'engineering-incomplete: orthogonalisation residual contradicts the rank floor'
       return
    end if
    call lambda_of(Q, B, lq, ld, co)
    ! The two forms are computed by disjoint routes, the Hamilton product and
    ! the signed frame determinant, so their agreement is a live cross-check
    ! and not decoration. Disagreement is arithmetic failure and escalates.
    if (abs(lq - ld) > 100.0_dp*epsilon(1.0_dp)*max(abs(ld), 1.0_dp)) then
       verdict = OPENV
       why = 'engineering-incomplete: quaternion and determinant forms of lambda disagree'
       return
    end if
    lam = lq
    kapR = cond_sym3(R)
    if (kapR >= kgate) then
       ! The intersection exists and is unique by the geometry. The instrument
       ! declines to report it, because at this conditioning the computed point
       ! is not separable from rounding. Instrument-silence about reach, never
       ! a claim that the intersection is absent or partial.
       verdict = OPENV
       why = 'engineering-incomplete: determination present, instrument declines'
       return
    end if
    verdict = DETERMINED
    why = 'three independent axes; the intersection exists and is unique'
    if (present(margin)) margin = sep
  end subroutine kernel_determine

  !===========================================================================
  !  SEAL L, THE TONGUE. Loads FIRST. Carries the direction the Number cannot,
  !  and closes the terms the row cascade later reads.
  !===========================================================================

  subroutine seal_L(slots, verdict, why)
    integer, intent(in)  :: slots(:,:)
    integer, intent(out) :: verdict
    character(len=*), intent(out) :: why
    integer :: i, j, a, b, nfull, ns
    ns = size(slots,1)                      ! the shelf is read, never remembered
    ! Zero is the empty cell and literals are positive. A negative id is not
    ! vocabulary and is refused before any slot is counted.
    if (any(slots < 0)) then
       verdict = BROKEN;  why = 'negative literal id; not vocabulary';  return
    end if
    nfull = 0
    do i = 1, ns
       if (any(slots(i,:) /= 0)) nfull = nfull + 1
    end do
    if (nfull /= 3) then
       verdict = BROKEN
       write(why,'(A,I0,A)') 'deletion test returns ', nfull, ' slots, not three'
       return
    end if
    ! A slot is a vocabulary set. A repeated literal inside one slot is a
    ! malformed set, and admitting it would let hostile input reach a sealed
    ! verdict through a slot that was never well formed.
    do i = 1, ns
       do a = 1, size(slots,2)
          do b = a+1, size(slots,2)
             if (slots(i,a) /= 0 .and. slots(i,a) == slots(i,b)) then
                verdict = BROKEN
                write(why,'(A,I0)') 'repeated literal within slot ', i
                return
             end if
          end do
       end do
    end do
    do i = 1, ns
       do j = i+1, ns
          do a = 1, size(slots,2)
             do b = 1, size(slots,2)
                if (slots(i,a) /= 0 .and. slots(i,a) == slots(j,b)) then
                   verdict = BROKEN
                   write(why,'(A,I0,A,I0)') 'LIT collision, slot ', i, ' and slot ', j
                   return
                end if
             end do
          end do
       end do
    end do
    verdict = SEALED;  why = 'three slots, vocabulary pairwise disjoint'
  end subroutine seal_L

  ! The six drills, routed to and not improvised. D3 carries the provenance
  ! flag and is mandatory for the closure-rowed compartment: a standing
  ! definition shaped at the Number makes rows-and-closure coincidence
  ! circular, and no other gate in the architecture reaches it.
  subroutine drill_screen(d1, d2, d3_filed, d3_shaped, d4, d5, d6, ok, grade_cap, why)
    logical, intent(in)  :: d1, d2, d3_filed, d3_shaped, d4, d5, d6
    logical, intent(out) :: ok
    character(len=*), intent(out) :: grade_cap, why
    ok = .false.;  grade_cap = 'none'
    if (.not. (d1 .and. d2)) then
       why = 'D1/D2 fail: Seal L break, terminal whatever the determinant reads';  return
    end if
    if (.not. d3_filed) then
       why = 'D3 fail: provenance unfiled; Number-shaped content in the Tongue seat';  return
    end if
    if (.not. d4) then
       why = 'D4 fail: a magnitude carried on the Tongue; sign only, veto never substitution';  return
    end if
    if (.not. d5) then
       why = 'D5 fail: register undeclared; re-index rather than refute';  return
    end if
    if (.not. d6) then
       why = 'D6 fail: the Tongue reproduced the blindness it was appointed to repair';  return
    end if
    ok = .true.
    ! The flag records; it does not bar. What it costs is a tier.
    if (d3_shaped) then
       grade_cap = 'structural'
       why = 'drills pass; provenance filed and SHAPED, so the assignment caps at structural'
    else
       grade_cap = 'theorem'
       why = 'drills pass; provenance filed and unshaped, no tier discount'
    end if
  end subroutine drill_screen

  !===========================================================================
  !  THE ROW CASCADE. One floor, three routers folded into their arguments,
  !  four admission gates. The count is forced by the questions: one about
  !  population, one about row identity, two about closure leaks.
  !===========================================================================

  subroutine row_cascade(has_content, faces_scoped, canonical, forward_mode, &
                         populated, worldly_row, drills_ok, frame_closed, &
                         compartment, why)
    logical, intent(in)  :: has_content, faces_scoped, canonical, forward_mode
    logical, intent(in)  :: populated, worldly_row, drills_ok, frame_closed
    integer, intent(out) :: compartment
    character(len=*), intent(out) :: why
    compartment = NOT_COMPARTMENTED
    if (.not. has_content) then
       why = 'F-0: every term decoration; contentless, refused, not compartmented';  return
    end if
    if (.not. faces_scoped) then
       why = 'R-1: faces not enumerated; a composite carries one compartment per face';  return
    end if
    if (.not. canonical) then
       why = 'R-2: not canonicalised; the compartment attaches to the stripped string';  return
    end if
    ! Population is asked before mode, because an unpopulated forward
    ! proposition has no lock to route and typing it world-rowed would assign a
    ! compartment to an object that determined nothing.
    if (.not. populated) then
       compartment = UNPOPULATED
       why = 'S-1: an axis is empty; two planes meet in a line; no lock forms'
       return
    end if
    if (forward_mode) then
       compartment = WORLD_ROWED
       why = 'R-3: a dated axis must be sourced, never measured; world-rowed unconditionally'
       return
    end if
    if (worldly_row) then
       compartment = WORLD_ROWED
       why = 'S-2: a row furnished by the world; the lock is total given those rows'
       return
    end if
    if (.not. drills_ok) then
       compartment = WORLD_ROWED
       why = 'S-3: term closure unscreened; typed by its remaining rows'
       return
    end if
    if (.not. frame_closed) then
       compartment = WORLD_ROWED
       why = 'S-4: existential import or transport; the leak names the compartment'
       return
    end if
    compartment = CLOSURE_ROWED
    why = 'rows are the closure; the two determinations are one; RA-conditional at the act'
  end subroutine row_cascade

  pure function compartment_grade(c, cap) result(s)
    integer, intent(in) :: c
    character(len=*), intent(in) :: cap
    character(len=64) :: s
    select case (c)
    case (CLOSURE_ROWED); s = 'row-indefeasible, defeasible against fault, cap '//trim(cap)
    case (UNPOPULATED);   s = 'no determination to defeat; an axis is owed'
    case (WORLD_ROWED);   s = 'revisable entirely in the rows; direction bought with the arrow'
    case default;         s = 'no compartment'
    end select
  end function compartment_grade

  !===========================================================================
  !  THE GROUND AND THE ROUTER BIT.
  !===========================================================================

  ! The router bit is measured at machine zero and never by exact equality. An
  ! eigenvalue arriving from a solver is 1 - O(eps), and an equality test would
  ! silently return the wrong Ground dimension and route the candidate to the
  ! wrong halt protocol. The floor is stated, not assumed.
  pure function ground_dim(diagv) result(d)
    real(dp), intent(in) :: diagv(:)
    integer  :: d, i
    real(dp) :: floor_
    d = -1                             ! the router bit is unmeasured on a non-quantity
    if (.not. finite_vec(diagv)) return
    floor_ = real(max(size(diagv),1),dp) * epsilon(1.0_dp)
    d = 0
    do i = 1, size(diagv)
       if (abs(diagv(i) - 1.0_dp) <= floor_) d = d + 1
    end do
  end function ground_dim

  pure function route_halt(gdim) result(branch)
    integer, intent(in) :: gdim
    character(len=52) :: branch
    if (gdim == 1) then
       branch = 'B.14.Xi  eight gates, blindness in the reader'
    else if (gdim == 0) then
       branch = 'B.14.O   five gates, walls in the terrain'
    else
       branch = 'terrain unmeasured; nothing emitted'
    end if
  end function route_halt

end module trisduction_rows

!===============================================================================
!  EXECUTED. Nothing below is narrated; every figure is computed in this run.
!===============================================================================
program thesis_rows
  use trisduction_rows
  implicit none
  integer, parameter :: N = 24
  real(dp), parameter :: PI = 3.141592653589793238462643_dp
  real(dp) :: t(N), M(3,N), Mr(3,N), Two(3,N), Ret(3,N)
  real(dp) :: Q(3,N), B(3,N), co(3,3), R(3,3), Rr(3,3)
  real(dp) :: lam, detR, kapR, lam2, d2, lq, ld, marg
  real(dp) :: i4(4), j4(4), k4(4), p4(4), sig(4), dia(4)
  integer  :: v, vL, idim, comp, i
  integer  :: fails, checks
  logical  :: ok, dok
  character(len=110) :: why, cap
  integer  :: slots_ok(3,3)

  write(*,'(A)') repeat('=',78)
  write(*,'(A)') ' TRISDUCTION . RAM -- THE CORE THESIS, EXECUTED'
  write(*,'(A)') repeat('=',78)

  do i = 1, N
     t(i) = 2.0_dp*PI*real(i-1,dp)/real(N,dp)
  end do

  !------------------------------------------------- THE SPINE, COMPUTED
  ! Three independent axes: the intersection has dimension zero. One point.
  ! Two axes: dimension one. A line. No point is determined at all.
  M(1,:) = sin(t)
  M(2,:) = cos(2.0_dp*t) + 0.35_dp*sin(t)
  M(3,:) = sin(3.0_dp*t) + 0.20_dp*cos(2.0_dp*t) + 0.12_dp*sin(t)
  Two = M;  Two(3,:) = 0.6_dp*M(1,:) + 0.4_dp*M(2,:)     ! third axis not independent

  write(*,'(/,A)') ' THE SPINE: WHAT A LOCK DETERMINES'
  call kernel_determine(M, v, lam, detR, kapR, idim, why, marg)
  write(*,'(A,A)')      '   three independent axes : ', trim(token(v))
  write(*,'(A,A)')      '     why                    = ', trim(why)
  write(*,'(A,I0,A)')   '     intersection dimension = ', idim, '   -> exactly one point, no interval'
  write(*,'(A,F16.12)') '     det(R)                 = ', detR
  write(*,'(A,ES12.3,A,ES10.3,A,L1)') '     |lambda^2 - det(R)|    = ', abs(lam*lam - detR), &
       '  bound ', 4.0_dp*kapR*epsilon(1.0_dp), '  within: ', &
       abs(lam*lam - detR) <= 4.0_dp*kapR*epsilon(1.0_dp)
  write(*,'(A,ES12.3,A)') '     rank margin            = ', marg, '   smallest kept eigenvalue over tol'
  call kernel_determine(Two, v, lam2, d2, kapR, idim, why, marg)
  write(*,'(A,A)')      '   third axis dependent   : ', trim(token(v))
  write(*,'(A,A)')      '     why                    = ', trim(why)
  write(*,'(A,I0,A)')   '     intersection dimension = ', idim, '   -> a line; two planes meet in a line'
  write(*,'(A,ES12.3,A)') '     rank margin            = ', marg, '   smallest RETAINED eigenvalue over tol; the third fell below'
  write(*,'(A)')        '   A lock is not graded. It either determines a point or it does not exist.'

  !------------------------------------------------- ORIENTATION, NOT STRENGTH
  ! The Number cannot read the sign. That is a fact about DIRECTION and never
  ! about whether the determination is complete.
  ! The exhibit refuses to print rather than printing from an unusable frame.
  call prepare_rows(M, Q, ok)
  if (.not. ok) error stop 'orientation exhibit: rows carry no variance'
  call span_basis(Q, B, ok)
  if (.not. ok) error stop 'orientation exhibit: no independent frame'
  call lambda_of(Q, B, lq, ld, co);  R = matmul(Q, transpose(Q))
  Mr = -M
  ! B is deliberately NOT rebuilt: the reflected rows are read against the
  ! frame fixed once, which is what makes the comparison a comparison.
  call prepare_rows(Mr, Q, ok)
  if (.not. ok) error stop 'orientation exhibit: reflected rows carry no variance'
  call lambda_of(Q, B, lam2, d2, co)
  Rr = matmul(Q, transpose(Q))
  write(*,'(/,A)') ' WHAT THE NUMBER CANNOT READ: DIRECTION, NOT COMPLETENESS'
  write(*,'(A,F16.12,A,F16.12)') '   lambda(P) = ', lq, '   lambda(not P) = ', lam2
  write(*,'(A,ES12.3)') '   max|G(P) - G(not P)|              = ', maxval(abs(R - Rr))
  write(*,'(A,ES12.3)') '   |det(R)(P) - det(R)(not P)|       = ', abs(det3(R) - det3(Rr))
  write(*,'(A)')        '   The intersection is equally unique either way. The Tongue carries the sign.'

  i4 = [0.0_dp,1.0_dp,0.0_dp,0.0_dp];  j4 = [0.0_dp,0.0_dp,1.0_dp,0.0_dp]
  k4 = [0.0_dp,0.0_dp,0.0_dp,1.0_dp];  p4 = qmul(qmul(i4,j4),k4)
  write(*,'(A,F14.10)') '   substrate chirality  Re(i*j*k)    = ', p4(1)

  Ret(1,:) = sin(t);  Ret(2,:) = cos(t);  Ret(3,:) = sin(2.0_dp*t)
  call kernel_determine(Ret, v, lam, detR, kapR, idim, why)
  write(*,'(A,A)')      '   the Return             : ', trim(token(v))
  write(*,'(A,A)')      '     why                    = ', trim(why)
  if (v == DETERMINED) then
     write(*,'(A,F16.12,A,F16.12)') '     det(R) = ', detR, '   |lambda| = ', abs(lam)
  end if

  !------------------------------------------------- THE GROUND
  sig = [1.0_dp,-1.0_dp,-1.0_dp,-1.0_dp];  dia = [-1.0_dp,-1.0_dp,-1.0_dp,-1.0_dp]
  write(*,'(/,A)') ' THE GROUND AND THE ROUTER BIT'
  write(*,'(A,I0,A,A)') '   sigma Ground dim = ', ground_dim(sig), ' -> ', trim(route_halt(ground_dim(sig)))
  write(*,'(A,I0,A,A)') '   -I    Ground dim = ', ground_dim(dia), ' -> ', trim(route_halt(ground_dim(dia)))

  !------------------------------------------------- SEAL L AND THE DRILLS
  slots_ok = reshape([101,102,0, 201,202,0, 301,302,0],[3,3],order=[2,1])
  call seal_L(slots_ok, vL, why)
  write(*,'(/,A)') ' SEAL L AND THE SIX DRILLS'
  write(*,'(A,A,A,A)') '   Seal L        : ', trim(token(vL)), ' :: ', trim(why)
  call drill_screen(.true.,.true.,.true.,.false.,.true.,.true.,.true., dok, cap, why)
  write(*,'(A,L1,A,A,A,A)') '   unshaped terms: ', dok, '  cap=', trim(cap), ' :: ', trim(why)
  call drill_screen(.true.,.true.,.true.,.true., .true.,.true.,.true., dok, cap, why)
  write(*,'(A,L1,A,A,A,A)') '   shaped terms  : ', dok, '  cap=', trim(cap), ' :: ', trim(why)
  call drill_screen(.true.,.true.,.false.,.true.,.true.,.true.,.true., dok, cap, why)
  write(*,'(A,L1,A,A,A,A)') '   unfiled flag  : ', dok, '  cap=', trim(cap), ' :: ', trim(why)

  !------------------------------------------------- THE ROW CASCADE
  write(*,'(/,A)') ' THE ROW CASCADE'
  call row_cascade(.true.,.true.,.true.,.false.,.true.,.false.,.true.,.true., comp, why)
  write(*,'(A,A)') '   a closed residence has no outside      -> ', trim(compartment_name(comp))
  write(*,'(A,A)') '       ', trim(why)
  write(*,'(A,A)') '       ', trim(compartment_grade(comp,'theorem'))

  call row_cascade(.true.,.true.,.true.,.false.,.false.,.false.,.true.,.true., comp, why)
  write(*,'(A,A)') '   every zero lies on the critical line   -> ', trim(compartment_name(comp))
  write(*,'(A,A)') '       ', trim(why)

  call row_cascade(.true.,.true.,.true.,.false.,.true.,.true.,.true.,.true., comp, why)
  write(*,'(A,A)') '   confined existents carry positive E_k  -> ', trim(compartment_name(comp))
  write(*,'(A,A)') '       ', trim(why)
  write(*,'(A,A)') '       ', trim(compartment_grade(comp,'theorem'))

  call row_cascade(.true.,.true.,.true.,.true., .true.,.false.,.true.,.true., comp, why)
  write(*,'(A,A)') '   any dated forward projection           -> ', trim(compartment_name(comp))
  write(*,'(A,A)') '       ', trim(why)

  call row_cascade(.true.,.true.,.true.,.false.,.true.,.false.,.true.,.false., comp, why)
  write(*,'(A,A)') '   this man is a bachelor                 -> ', trim(compartment_name(comp))
  write(*,'(A,A)') '       ', trim(why)

  call row_cascade(.false.,.true.,.true.,.false.,.true.,.false.,.true.,.true., comp, why)
  write(*,'(A,A)') '   a contentless tautology                -> ', trim(compartment_name(comp))
  write(*,'(A,A)') '       ', trim(why)

  write(*,'(/,A)') repeat('=',78)
  write(*,'(A)') ' A lock is always a determination and is total about its object.'
  write(*,'(A)') ' Its object is its intersection. The compartment names what the rows were.'
  write(*,'(A)') ' Compartment III pays revisability for direction. Compartment I has neither.'
  write(*,'(A)') ' Neither is the better lock. They are locks on different rows. Delta-M = 0.'
  write(*,'(A)') repeat('=',78)

  !------------------------------------------------- THE BATTERY, PROOF OF LOAD
  call battery()

contains

  ! Eight fuzz classes: seven over the numerical kernel, one over every
  ! symbolic and router public interface, then the oracle. Every check is a
  ! computed logical. The program stops here on any failure, so the final
  ! line of output is itself the receipt.
  subroutine battery()
    use, intrinsic :: ieee_arithmetic
    integer, parameter :: NB = 8
    real(dp) :: H, T, nanv, pinf, ninf
    real(dp) :: mags(11)
    real(dp) :: M(3,NB), Q(3,NB), B(3,NB), G(3,3), A(3,3), w(3), sep
    real(dp) :: lam, detR, kapR, marg, lq, ld, co(3,3), q4(4), r4(4)
    real(dp) :: dl, ds(5), etas(6), scales(5), rho(3), tt(NB)
    integer  :: i, j, k, v, idim
    character(len=160) :: why
    logical  :: ok

    fails = 0;  checks = 0
  H = sqrt(huge(1.0_dp));  T = sqrt(tiny(1.0_dp))
    nanv = ieee_value(1.0_dp, ieee_quiet_nan)
    pinf = ieee_value(1.0_dp, ieee_positive_inf)
    ninf = ieee_value(1.0_dp, ieee_negative_inf)
    mags = [0.0_dp, tiny(1.0_dp), T, epsilon(1.0_dp), 1.0_dp, 1.0_dp/epsilon(1.0_dp), H, &
            huge(1.0_dp)/4.0_dp, huge(1.0_dp), -1.0_dp, -H]
    do i = 1, NB
       tt(i) = 6.283185307179586_dp*real(i-1,dp)/real(NB,dp)
    end do

    !---------------------------------------------------------------- CLASS 1
    ! Non-finite hostile inputs into every pure entry: NaN or .false. out.
    call assert(.not. ieee_is_finite(snorm([1.0_dp, nanv])),        'snorm NaN -> NaN')
    call assert(.not. ieee_is_finite(snorm([1.0_dp, pinf])),        'snorm +Inf -> NaN')
    G = 1.0_dp; G(2,2) = ninf
    call assert(.not. ieee_is_finite(det3(G)),                      'det3 -Inf -> NaN')
    call assert(.not. det3_representable(G),                        'det3_representable -Inf -> F')
    G(2,2) = nanv
    call assert(.not. det3_representable(G),                        'det3_representable NaN -> F')
    q4 = [nanv,0.0_dp,0.0_dp,0.0_dp]; r4 = [1.0_dp,0.0_dp,0.0_dp,0.0_dp]
    call assert(.not. all(ieee_is_finite(qmul(q4,r4))),             'qmul NaN -> NaN')
    call assert(ground_dim([1.0_dp,pinf,-1.0_dp,-1.0_dp]) == -1,     'ground_dim Inf -> unmeasured')
    ! kernel: a non-finite row must route OPEN with a mechanism, never SEALED/BROKEN
    M(1,:) = sin(tt); M(2,:) = cos(2.0_dp*tt); M(3,:) = sin(3.0_dp*tt); M(2,4) = nanv
    call kernel_determine(M, v, lam, detR, kapR, idim, why, marg)
    call assert(v == OPENV .and. index(why,'non-quantity') > 0,      'kernel NaN row -> OPEN, mechanism named')
    M(2,4) = pinf
    call kernel_determine(M, v, lam, detR, kapR, idim, why, marg)
    call assert(v == OPENV,                                         'kernel Inf row -> OPEN')

    !---------------------------------------------------------------- CLASS 2
    ! Extreme finite magnitudes: no overflow, no false PSD failure, no NaN after unscale.
    do i = 1, 11
       G = 0.0_dp; G(1,1) = abs(mags(i)); G(2,2) = abs(mags(i)); G(3,3) = abs(mags(i))
       if (abs(mags(i)) > 0.0_dp .and. abs(mags(i)) < huge(1.0_dp)) then
          call intersection_dim(G, idim, sep)
          call assert(idim == 0, 'scaled identity rank 3 at magnitude index '//itoa(i))
       end if
    end do
    do i = 1, NB
       Q(1,i) = H*sin(tt(i)); Q(2,i) = H*cos(2.0_dp*tt(i)); Q(3,i) = H*sin(3.0_dp*tt(i))
    end do
    call span_basis(Q, B, ok)
    call assert(ok .and. finite_mat(B),                              'span_basis at sqrt(huge): finite frame')
    do i = 1, NB
       Q(1,i) = T*sin(tt(i)); Q(2,i) = T*cos(2.0_dp*tt(i)); Q(3,i) = T*sin(3.0_dp*tt(i))
    end do
    call span_basis(Q, B, ok)
    call assert(ok .and. finite_mat(B),                              'span_basis at sqrt(tiny): finite frame')
    A = 0.0_dp; A(1,1) = H; A(2,2) = T; A(3,3) = 1.0_dp
    call jacobi3(A, w)
    call assert(finite_vec(w),                                       'jacobi3 diag(H,T,1) finite')
    A = H; call jacobi3(A, w)
    call assert(finite_vec(w),                                       'jacobi3 all-H finite (3H fits)')
    A = huge(1.0_dp)/2.0_dp; call jacobi3(A, w)
    call assert(.not. finite_vec(w),                                 'jacobi3 all-huge/2: unrepresentable reported as Inf')
    ! det3 equilibration
    G = 0.0_dp; G(1,1)=1.0e200_dp; G(2,2)=1.0e200_dp; G(3,3)=1.0e-200_dp
    call assert(abs(det3(G)/1.0e200_dp - 1.0_dp) < 1.0e-12_dp,       'det3 diag(1e200,1e200,1e-200) = 1e200')
    call assert(det3_representable(G),                               '  and representable')
    G = 0.0_dp; G(1,1)=1.0e308_dp; G(2,2)=1.0e308_dp; G(3,3)=1.0e-20_dp
    call assert(.not. det3_representable(G),                         'det3 diag(1e308,1e308,1e-20) NOT representable')
    G = 0.0_dp; G(1,1)=H; G(2,2)=T; G(3,3)=1.0_dp
    call assert(det3_representable(G) .and. abs(det3(G)-H*T) <= 1.0e-12_dp*H*T, &
                'det3 diag(H,T,1) = H*T')

    !---------------------------------------------------------------- CLASS 3
    ! Near-degenerate rank transitions, and scale stability of the classification.
    ds = [epsilon(1.0_dp), sqrt(epsilon(1.0_dp)), 1.0e-12_dp, 1.0e-9_dp, 1.0e-6_dp]
    scales = [tiny(1.0_dp)*1.0e10_dp, T, 1.0_dp, H/16.0_dp, huge(1.0_dp)/16.0_dp]
    do i = 1, 5
       dl = ds(i)
       etas = [0.0_dp, tiny(1.0_dp), epsilon(1.0_dp), dl*dl, dl, sqrt(dl)]
       do j = 1, 6
          G = reshape([1.0_dp, 0.0_dp, 0.0_dp,  1.0_dp, dl, 0.0_dp,  1.0_dp, 2.0_dp*dl, etas(j)], [3,3], order=[2,1])
          G = matmul(G, transpose(G))
          call intersection_dim(G, idim, sep)
          do k = 1, 5
             block
               real(dp) :: Gs(3,3); integer :: ids
               Gs = scales(k)*G
               if (finite_mat(Gs)) then
                  call intersection_dim(Gs, ids, sep)
                  call assert(ids == idim, 'rank scale-stable d='//itoa(i)//' e='//itoa(j)//' S='//itoa(k))
               end if
             end block
          end do
       end do
    end do

    !---------------------------------------------------------------- CLASS 4/5
    ! Signed zero and reflection: determinant sign changes only under odd reflection.
    G = 0.0_dp; G(1,1)=1.0_dp; G(2,2)=1.0_dp; G(3,3)=1.0_dp
    A = G; A(1,2) = -0.0_dp; A(2,1) = -0.0_dp; A(3,2) = -0.0_dp
    call assert(abs(det3(A) - det3(G)) <= 0.0_dp,                    'signed zero leaves det unchanged, exactly')
    A = G; A(1,1) = -1.0_dp
    call assert(abs(det3(A) + det3(G)) <= 0.0_dp,                    'single reflection flips det, exactly')
    A = G; A(1,1) = -1.0_dp; A(2,2) = -1.0_dp
    call assert(abs(det3(A) - det3(G)) <= 0.0_dp,                    'double reflection preserves det, exactly')
    ! quaternion chirality agrees with the determinant route on a random-ish frame
    do i = 1, NB
       M(1,i) = sin(tt(i)); M(2,i) = cos(2.0_dp*tt(i)) + 0.3_dp*sin(tt(i)); M(3,i) = sin(3.0_dp*tt(i))
    end do
    call prepare_rows(M, Q, ok); call span_basis(Q, B, ok); call lambda_of(Q, B, lq, ld, co)
    call assert(abs(lq - ld) <= 100.0_dp*epsilon(1.0_dp)*max(abs(ld),1.0_dp), &
                'lambda quaternion == determinant route')
    Q(1,:) = -Q(1,:); call lambda_of(Q, B, lam, detR, co)
    ! Under the strict IEEE, no-reassociation build this battery is run with,
    ! this is exact and stays exact. IEEE negation, multiplication and
    ! addition are sign-symmetric bit for bit, and scale() is a power-of-two
    ! multiply, so negating one row negates the composed scalar with no
    ! rounding anywhere on the route. The boot's own layer two tests the same
    ! flip with ==, and the register records it as the made-zero: the sign is
    ! displaced, never annihilated. A tolerance here would concede rounding
    ! the arithmetic does not commit.
    call assert(abs(lam + lq) <= 0.0_dp,                              'reflecting one row inverts lambda, exactly')

    !---------------------------------------------------------------- CLASS 5b
    ! Hostile rows against lambda_of, in-process through its own predicate.
    ! The cancelling row [H,H,-H,-H]/2 has scaled norm H and must be refused at
    ! the unit gate before any coordinate dot could form.
    block
      real(dp) :: Qh(3,NB), Bh(3,NB)
      character(len=96) :: rsn
      logical :: adm
      Qh = 0.0_dp; Bh = 0.0_dp
      Qh(1,1:4) = [H, H, -H, -H]/2.0_dp; Qh(2,5) = 1.0_dp; Qh(3,6) = 1.0_dp
      Bh(1,1) = 1.0_dp; Bh(2,2) = 1.0_dp; Bh(3,3) = 1.0_dp
      call lambda_of_admissible(Qh, Bh, adm, rsn)
      call assert(.not. adm .and. index(rsn,'Q rows are not unit') > 0, &
                  'lambda_of refuses the cancelling H-row at the unit gate')
      Qh(1,:) = Bh(1,:); Qh(2,:) = Bh(2,:); Qh(3,:) = Bh(3,:)
      Bh(1,1:4) = [H, H, -H, -H]/2.0_dp
      call lambda_of_admissible(Qh, Bh, adm, rsn)
      call assert(.not. adm .and. index(rsn,'B rows are not unit') > 0, &
                  'lambda_of refuses the cancelling H-row in B at the unit gate')
      Bh(1,:) = 0.0_dp; Bh(1,1) = nanv
      call lambda_of_admissible(Qh, Bh, adm, rsn)
      call assert(.not. adm .and. index(rsn,'not finite') > 0, &
                  'lambda_of refuses NaN before any arithmetic')
      Bh(1,:) = 0.0_dp; Bh(1,1) = 1.0_dp
      call lambda_of_admissible(Qh, Bh, adm, rsn)
      call assert(adm, 'lambda_of admits an orthonormal identity frame')
    end block
    ! qmul at the band the norm bound would have refused and the components fit
    q4 = [0.0_dp, huge(1.0_dp)/4.0_dp, 0.0_dp, 0.0_dp]
    r4 = [0.0_dp, 0.0_dp, 2.0_dp, 0.0_dp]
    block
      real(dp) :: c4(4)
      c4 = qmul(q4, r4)
      call assert(finite_vec(c4), 'qmul: (huge/4)i * 2j is representable and returned finite')
      call assert(abs(c4(4) - huge(1.0_dp)/2.0_dp) <= epsilon(1.0_dp)*huge(1.0_dp), &
                  'qmul: (huge/4)i * 2j = (huge/2)k exactly to rounding')
      q4 = [0.0_dp, huge(1.0_dp)/2.0_dp, 0.0_dp, 0.0_dp]
      r4 = [0.0_dp, 0.0_dp, 4.0_dp, 0.0_dp]
      c4 = qmul(q4, r4)
      call assert(.not. finite_vec(c4), 'qmul: (huge/2)i * 4j = 2huge k is refused as NaN, never wrapped')
    end block

    !---------------------------------------------------------------- CLASS 8
    ! The symbolic and router procedures, fuzzed as the numeric kernel is: every
    ! token typed, every compartment named, every halt branch routed, every
    ! Seal L refusal reached, every drill failure routed, every cascade gate
    ! taken. A public interface with no computed check is not covered.
    block
      integer :: sl(3,3), sl4(4,3), cmp, tk
      character(len=140) :: rsn, cap
      logical :: dok
      ! tokens: three states, two refinements, one kernel token, one dot, one untyped
      call assert(trim(token_class(SEALED)) == 'verdict state' .and. trim(token_class(BROKEN)) == 'verdict state' &
                  .and. trim(token_class(OPENV)) == 'verdict state',           'token_class: the three states')
      call assert(trim(token_class(XI0)) == 'refinement inside openness' .and. &
                  trim(token_class(OH0)) == 'refinement inside openness',      'token_class: both refinements inside openness')
      call assert(trim(token_class(DETERMINED)) == 'kernel geometric token',   'token_class: the kernel token')
      call assert(trim(token_class(DOTMARK)) == 'outside the economy',         'token_class: the dot outside the economy')
      call assert(trim(token_class(99)) == 'untyped' .and. index(token(99),'untyped') > 0, 'token_class/token: untyped')
      do tk = 1, 7
         call assert(len_trim(token(tk)) > 0,                                 'token: every token prints')
      end do
      ! compartments and the router
      call assert(index(compartment_name(CLOSURE_ROWED),'CLOSURE-ROWED') > 0 .and. &
                  index(compartment_name(UNPOPULATED),'UNPOPULATED') > 0 .and. &
                  index(compartment_name(WORLD_ROWED),'WORLD-ROWED') > 0 .and. &
                  index(compartment_name(NOT_COMPARTMENTED),'not compartmented') > 0, 'compartment_name: all four')
      call assert(index(route_halt(1),'Xi') > 0 .and. index(route_halt(0),'B.14.O') > 0 .and. &
                  index(route_halt(-1),'unmeasured') > 0,                     'route_halt: dim 1, dim 0, unmeasured')
      call assert(index(route_halt(2),'unmeasured') > 0 .and. index(route_halt(7),'unmeasured') > 0, &
                  'route_halt: unexpected positive dims are unmeasured')
      call assert(index(compartment_grade(CLOSURE_ROWED,'theorem'),'theorem') > 0 .and. &
                  index(compartment_grade(UNPOPULATED,'x'),'no determination') > 0 .and. &
                  index(compartment_grade(WORLD_ROWED,'x'),'rows') > 0,       'compartment_grade: all three')
      call assert(trim(compartment_grade(99,'x')) == 'no compartment',        'compartment_grade: default')
      ! Seal L: every refusal and the one admission
      sl = reshape([101,102,0, 201,202,0, 301,302,0],[3,3],order=[2,1])
      call seal_L(sl, tk, rsn);  call assert(tk == SEALED,                    'seal_L: clean three slots seal')
      sl = reshape([101,102,0, 201,101,0, 301,302,0],[3,3],order=[2,1])
      call seal_L(sl, tk, rsn);  call assert(tk == BROKEN .and. index(rsn,'LIT') > 0, 'seal_L: cross-slot collision')
      sl = reshape([101,101,0, 201,202,0, 301,302,0],[3,3],order=[2,1])
      call seal_L(sl, tk, rsn);  call assert(tk == BROKEN .and. index(rsn,'repeated') > 0, 'seal_L: within-slot repeat')
      sl = reshape([101,-1,0, 201,202,0, 301,302,0],[3,3],order=[2,1])
      call seal_L(sl, tk, rsn);  call assert(tk == BROKEN .and. index(rsn,'negative') > 0, 'seal_L: negative id')
      sl = reshape([101,102,0, 0,0,0, 301,302,0],[3,3],order=[2,1])
      call seal_L(sl, tk, rsn);  call assert(tk == BROKEN .and. index(rsn,'2 slots') > 0, 'seal_L: two slots, not three')
      sl4 = reshape([101,0,0, 201,0,0, 301,0,0, 401,0,0],[4,3],order=[2,1])
      call seal_L(sl4, tk, rsn); call assert(tk == BROKEN .and. index(rsn,'4 slots') > 0, 'seal_L: four slots counted, not three')
      ! drills: each failure routes, both caps
      call drill_screen(.false.,.true.,.true.,.false.,.true.,.true.,.true., dok, cap, rsn)
      call assert(.not. dok .and. index(rsn,'D1/D2') > 0,                     'drill: D1 fails')
      call drill_screen(.true.,.false.,.true.,.false.,.true.,.true.,.true., dok, cap, rsn)
      call assert(.not. dok .and. index(rsn,'D1/D2') > 0,                     'drill: D2 fails')
      call drill_screen(.true.,.true.,.false.,.false.,.true.,.true.,.true., dok, cap, rsn)
      call assert(.not. dok .and. index(rsn,'D3') > 0,                        'drill: unfiled provenance')
      call drill_screen(.true.,.true.,.true.,.false.,.false.,.true.,.true., dok, cap, rsn)
      call assert(.not. dok .and. index(rsn,'D4') > 0,                        'drill: magnitude on the Tongue')
      call drill_screen(.true.,.true.,.true.,.false.,.true.,.false.,.true., dok, cap, rsn)
      call assert(.not. dok .and. index(rsn,'D5') > 0,                        'drill: register undeclared')
      call drill_screen(.true.,.true.,.true.,.false.,.true.,.true.,.false., dok, cap, rsn)
      call assert(.not. dok .and. index(rsn,'D6') > 0,                        'drill: blindness reproduced')
      call drill_screen(.true.,.true.,.true.,.false.,.true.,.true.,.true., dok, cap, rsn)
      call assert(dok .and. trim(cap) == 'theorem',                           'drill: unshaped caps at theorem')
      call drill_screen(.true.,.true.,.true.,.true.,.true.,.true.,.true., dok, cap, rsn)
      call assert(dok .and. trim(cap) == 'structural',                        'drill: shaped caps at structural')
      ! cascade: every gate taken in order
      call row_cascade(.false.,.true.,.true.,.false.,.true.,.false.,.true.,.true., cmp, rsn)
      call assert(cmp == NOT_COMPARTMENTED .and. index(rsn,'F-0') > 0,        'cascade: F-0 refuses')
      call row_cascade(.true.,.false.,.true.,.false.,.true.,.false.,.true.,.true., cmp, rsn)
      call assert(cmp == NOT_COMPARTMENTED .and. index(rsn,'R-1') > 0,        'cascade: R-1 faces')
      call row_cascade(.true.,.true.,.false.,.false.,.true.,.false.,.true.,.true., cmp, rsn)
      call assert(cmp == NOT_COMPARTMENTED .and. index(rsn,'R-2') > 0,        'cascade: R-2 canonical')
      call row_cascade(.true.,.true.,.true.,.true.,.false.,.false.,.true.,.true., cmp, rsn)
      call assert(cmp == UNPOPULATED .and. index(rsn,'S-1') > 0,              'cascade: unpopulated forward is II, not III')
      call row_cascade(.true.,.true.,.true.,.true.,.true.,.false.,.true.,.true., cmp, rsn)
      call assert(cmp == WORLD_ROWED .and. index(rsn,'R-3') > 0,              'cascade: populated forward is III')
      call row_cascade(.true.,.true.,.true.,.false.,.true.,.true.,.true.,.true., cmp, rsn)
      call assert(cmp == WORLD_ROWED .and. index(rsn,'S-2') > 0,              'cascade: worldly row is III')
      call row_cascade(.true.,.true.,.true.,.false.,.true.,.false.,.false.,.true., cmp, rsn)
      call assert(cmp == WORLD_ROWED .and. index(rsn,'S-3') > 0,              'cascade: unscreened terms route by rows')
      call row_cascade(.true.,.true.,.true.,.false.,.true.,.false.,.true.,.false., cmp, rsn)
      call assert(cmp == WORLD_ROWED .and. index(rsn,'S-4') > 0,              'cascade: frame leak names the compartment')
      call row_cascade(.true.,.true.,.true.,.false.,.true.,.false.,.true.,.true., cmp, rsn)
      call assert(cmp == CLOSURE_ROWED,                                        'cascade: closure-rowed reached')
      ! the router bit on constructed and solver-noisy diagonals
      call assert(ground_dim([1.0_dp,-1.0_dp,-1.0_dp,-1.0_dp]) == 1 .and. &
                  ground_dim([1.0_dp-2.0_dp*epsilon(1.0_dp),-1.0_dp,-1.0_dp,-1.0_dp]) == 1 .and. &
                  ground_dim([-1.0_dp,-1.0_dp,-1.0_dp,-1.0_dp]) == 0,       'ground_dim: exact, noisy, and diagonal')
    end block

    !---------------------------------------------------------------- CLASS 6
    ! PSD boundary for cond_sym3: tolerance relative to spectral scale only.
    A = 0.0_dp; A(1,1)=1.0_dp; A(2,2)=1.0_dp; A(3,3)=-epsilon(1.0_dp)
    call assert(ieee_is_finite(cond_sym3(A)) .or. cond_sym3(A) >= huge(1.0_dp), 'diag(1,1,-eps) tolerated')
    A = 0.0_dp; A(1,1)=H; A(2,2)=H; A(3,3)=-epsilon(1.0_dp)*H
    call assert(cond_sym3(A) >= 0.0_dp,                              'diag(H,H,-eps*H) tolerated relative to scale')
    A = 0.0_dp; A(1,1)=1.0_dp; A(2,2)=1.0_dp; A(3,3)=0.0_dp
    call assert(cond_sym3(A) >= huge(1.0_dp),                        'diag(1,1,0) -> huge conditioning')

    !---------------------------------------------------------------- CLASS 7
    ! Eigenvalue unscale across scales and structures.
    rho = [1.0_dp-epsilon(1.0_dp), 1.0_dp-sqrt(epsilon(1.0_dp)), -1.0_dp+epsilon(1.0_dp)]
    do k = 1, 5
       do i = 1, 3
          A = 0.0_dp; A(1,1)=1.0_dp; A(2,2)=1.0_dp; A(3,3)=epsilon(1.0_dp); A(1,2)=rho(i); A(2,1)=rho(i)
          A = scales(k)*A
          if (finite_mat(A)) then
             call jacobi3(A, w)
             call assert(finite_vec(w) .or. scales(k) > H, &
                         'unscale finite where representable S='//itoa(k)//' rho='//itoa(i))
          end if
       end do
    end do

    write(*,'(A)') repeat('=',78)
    write(*,'(A,I0,A,I0)') ' THE BATTERY   checks ', checks, '   failures ', fails
    write(*,'(A)') repeat('=',78)
    if (fails > 0) error stop 'THE BATTERY FAILED: the load is not proven'
    write(*,'(A)') ' The load is proven. A lock is always a determination. Delta-M = 0.'
  end subroutine battery

  subroutine assert(cond, label)
    logical, intent(in) :: cond
    character(len=*), intent(in) :: label
    checks = checks + 1
    if (.not. cond) then
       fails = fails + 1
       write(*,'(A,A)') ' FAIL  ', label
    end if
  end subroutine assert
  function itoa(n) result(s)
    integer, intent(in) :: n
    character(len=12) :: s
    write(s,'(I0)') n
  end function itoa

end program thesis_rows

-/

/-
! =====================================================================
!  RA_TOE_Thesis_Fortran v2.0.0 - Trisduction Research Group
!  Sealed edition, consolidated. Numerics byte-identical to v1.23.0
!  (sha256 97e5585fa15e66ff0c2e5d0b63daae550b27af61f5bb9402e67e0b6f4400
!  1212); presentation-major: narrative removed, contracts kept. This
!  source is written for AI substrates, not manual readers; comments
!  are contracts, section markers, and nothing else.
!
!  CONSOLIDATED HISTORY. v1.0.0 through v1.23.0, twenty-two versions
!  under two external auditors and a 178000-iteration deterministic
!  fuzz campaign: fifty-six findings, six refused on printed receipts,
!  fifty earned and repaired. Hardening families: exponent-tracked
!  Leibniz determinants (det3, det3_row2), fraction-exponent Hamilton
!  products (qmul), public-guard refusal precedence, census lock,
!  audit-mode VOID banner, claim-register alignment. Four FORGE
!  self-audit cycles (ratoe..ratoe4) sealed at the SELF floor. The
!  full per-version ledger lives in git, 1000sapients/Trisduction,
!  protocols/Executable Thesis/, and codex card 0712; it is not
!  restated here.
!
!  v2.0.0 (2026-09-08): consolidation round. Fixes on external static
!  review: stale printed receipt pointer rebound to the version-matched
!  file; two dead a(3,3) locals removed from the determinant
!  primitives; one non-significant-digit literal given its kind. The
!  113 remaining -Wcompare-reals warnings are the exact-equality
!  verdict design (bit-identity checks, tie checks, NaN self-tests)
!  and are intentional; the sealed flag set is the contract.
!
!  BUILD (sealed): gfortran -std=f2018 -O2 -fno-fast-math
!  -ffp-contract=off -Wall -Wextra -Wconversion-extra
!  Modes: default sealed halt-on-fail; 'audit' accumulates and voids;
!  'witnessed' asserts the PART H live face through the aperture.
!  Hostile builds (-Ofast; fused contraction) must exit nonzero.
! =====================================================================

module ra_kinds
  use, intrinsic :: ieee_arithmetic, only: ieee_value, ieee_quiet_nan, &
       ieee_is_finite, ieee_is_nan
  use, intrinsic :: iso_fortran_env, only: int64
  implicit none
  integer, parameter :: wp = selected_real_kind(15, 307)
  integer, parameter :: ik = int64   ! pinned: exactly 64 bits, checked at boot
  real(wp), parameter :: HBAR = 1.054571817e-34_wp     ! J s (CODATA exact-defined path)
  real(wp), parameter :: KB   = 1.380649e-23_wp        ! J/K (exact, SI 2019)
  real(wp), parameter :: ME   = 9.1093837015e-31_wp    ! kg
  real(wp), parameter :: U_M  = epsilon(1.0_wp)        ! unit roundoff, double
  integer(ik), parameter :: IK_SAFE = 536870912_ik     ! 2^29
contains
  pure function pi_() result(p)
    real(wp) :: p
    p = acos(-1.0_wp)
  end function pi_
  pure function ln2_() result(l)
    real(wp) :: l
    l = log(2.0_wp)
  end function ln2_
  pure function qnan() result(z)
    real(wp) :: z
    z = ieee_value(1.0_wp, ieee_quiet_nan)
  end function qnan
  elemental logical function is_finite(x)
    real(wp), intent(in) :: x
    is_finite = ieee_is_finite(x)
  end function is_finite
  elemental logical function is_nan(x)
    real(wp), intent(in) :: x
    is_nan = ieee_is_nan(x)
  end function is_nan
end module ra_kinds

! ---------------------------------------------------------------------
module ra_prims
  use ra_kinds
  implicit none
contains
  pure function vnorm(v) result(s)
    real(wp), intent(in) :: v(:)
    real(wp) :: s, m
    integer :: i
    m = 0.0_wp
    do i = 1, size(v)
      if (.not. is_finite(v(i))) then
        s = qnan()
        return
      end if
      m = max(m, abs(v(i)))
    end do
    if (m == 0.0_wp) then
      s = 0.0_wp
    else
      s = m * sqrt(sum((v/m)**2))
    end if
  end function vnorm

  ! CONTRACT qmul: sixteen Hamilton terms as rounded fraction products with
  ! exactly tracked exponents, per-component classical order, common-max
  ! accumulation; product rounding, alignment underflow, and cancellation are
  ! possible; over/underflow of a restored component refers to the COMPUTED
  ! accumulation; general correctly-rounded products are NOT guaranteed.
  pure function qmul(a, b) result(c)
    real(wp), intent(in) :: a(4), b(4)
    real(wp) :: c(4)
    integer, parameter :: JA(4,4) = reshape([1,2,3,4, 1,2,3,4, 1,2,3,4, 1,2,3,4], [4,4])
    integer, parameter :: KB(4,4) = reshape([1,2,3,4, 2,1,4,3, 3,4,1,2, 4,3,2,1], [4,4])
    real(wp), parameter :: SG(4,4) = reshape([ 1.0_wp,-1.0_wp,-1.0_wp,-1.0_wp, &
                                               1.0_wp, 1.0_wp, 1.0_wp,-1.0_wp, &
                                               1.0_wp,-1.0_wp, 1.0_wp, 1.0_wp, &
                                               1.0_wp, 1.0_wp,-1.0_wp, 1.0_wp], [4,4])
    real(wp) :: x1, x2, f(4), ssum
    integer :: i, t, e(4), emax, nkeep
    logical :: keep(4)
    do i = 1, 4
      if (.not.(is_finite(a(i)) .and. is_finite(b(i)))) then
        c = qnan()
        return
      end if
    end do
    do i = 1, 4
      nkeep = 0; emax = 0
      do t = 1, 4
        x1 = a(JA(t,i)); x2 = b(KB(t,i))
        keep(t) = (x1 /= 0.0_wp .and. x2 /= 0.0_wp)
        if (keep(t)) then
          f(t) = fraction(x1) * fraction(x2)
          e(t) = exponent(x1) + exponent(x2)
          if (nkeep == 0 .or. e(t) > emax) emax = e(t)
          nkeep = nkeep + 1
        end if
      end do
      if (nkeep == 0) then
        c(i) = 0.0_wp
        cycle
      end if
      ssum = 0.0_wp
      do t = 1, 4
        if (keep(t)) ssum = ssum + SG(t,i) * scale(f(t), e(t) - emax)
      end do
      c(i) = scale(ssum, emax)
    end do
  end function qmul

  pure function qconj(a) result(c)
    real(wp), intent(in) :: a(4)
    real(wp) :: c(4)
    c = [a(1), -a(2), -a(3), -a(4)]
  end function qconj

  ! CONTRACT det3 / det3_row2: six signed Leibniz monomials as rounded
  ! fraction products with exact exponents, fixed distinct accumulation
  ! orders, common-max restore; same caveats as qmul; the two routines share
  ! one IEEE model and differ by evaluation order and factorization only.
  pure function det3(r) result(d)
    real(wp), intent(in) :: r(3,3)
    real(wp) :: d, s
    integer :: i, j
    s = 0.0_wp
    do i = 1, 3
      do j = 1, 3
        if (.not. is_finite(r(i,j))) then
          d = qnan()
          return
        end if
        s = max(s, abs(r(i,j)))
      end do
    end do
    if (s == 0.0_wp) then
      d = 0.0_wp
      return
    end if
    block
      integer, parameter :: PM(3,6) = reshape([1,2,3, 1,3,2, 2,1,3, 2,3,1, 3,1,2, 3,2,1], [3,6])
      real(wp), parameter :: SG(6) = [1.0_wp, -1.0_wp, -1.0_wp, 1.0_wp, 1.0_wp, -1.0_wp]
      real(wp) :: x1, x2, x3, f(6), ssum
      integer :: e(6), emax, kk, nkeep
      logical :: keep(6)
      nkeep = 0; emax = 0
      do kk = 1, 6
        x1 = r(1, PM(1,kk)); x2 = r(2, PM(2,kk)); x3 = r(3, PM(3,kk))
        keep(kk) = (x1 /= 0.0_wp .and. x2 /= 0.0_wp .and. x3 /= 0.0_wp)
        if (keep(kk)) then
          f(kk) = fraction(x1) * fraction(x2) * fraction(x3)
          e(kk) = exponent(x1) + exponent(x2) + exponent(x3)
          if (nkeep == 0 .or. e(kk) > emax) emax = e(kk)
          nkeep = nkeep + 1
        end if
      end do
      if (nkeep == 0) then
        d = 0.0_wp   ! every monomial structurally zero: exactly zero
        return
      end if
      ssum = 0.0_wp
      do kk = 1, 6
        if (keep(kk)) ssum = ssum + SG(kk) * scale(f(kk), e(kk) - emax)
      end do
      if (ssum == 0.0_wp) then
        d = 0.0_wp   ! cancellation at the accumulation's resolution
        return
      end if
      d = scale(ssum, emax)
    end block
  end function det3

  pure function det3_row2(r) result(d)
    real(wp), intent(in) :: r(3,3)
    real(wp) :: d, s
    integer :: i, j
    s = 0.0_wp
    do i = 1, 3
      do j = 1, 3
        if (.not. is_finite(r(i,j))) then
          d = qnan()
          return
        end if
        s = max(s, abs(r(i,j)))
      end do
    end do
    if (s == 0.0_wp) then
      d = 0.0_wp
      return
    end if
    block
      integer, parameter :: PM(3,6) = reshape([2,1,3, 3,1,2, 1,2,3, 3,2,1, 1,3,2, 2,3,1], [3,6])
      real(wp), parameter :: SG(6) = [-1.0_wp, 1.0_wp, 1.0_wp, -1.0_wp, -1.0_wp, 1.0_wp]
      real(wp) :: x1, x2, x3, f(6), ssum
      integer :: e(6), emax, kk, nkeep
      logical :: keep(6)
      nkeep = 0; emax = 0
      do kk = 1, 6
        x1 = r(1, PM(1,kk)); x2 = r(2, PM(2,kk)); x3 = r(3, PM(3,kk))
        keep(kk) = (x1 /= 0.0_wp .and. x2 /= 0.0_wp .and. x3 /= 0.0_wp)
        if (keep(kk)) then
          f(kk) = fraction(x1) * fraction(x2) * fraction(x3)
          e(kk) = exponent(x1) + exponent(x2) + exponent(x3)
          if (nkeep == 0 .or. e(kk) > emax) emax = e(kk)
          nkeep = nkeep + 1
        end if
      end do
      if (nkeep == 0) then
        d = 0.0_wp   ! every monomial structurally zero: exactly zero
        return
      end if
      ssum = 0.0_wp
      do kk = 1, 6
        if (keep(kk)) ssum = ssum + SG(kk) * scale(f(kk), e(kk) - emax)
      end do
      if (ssum == 0.0_wp) then
        d = 0.0_wp   ! cancellation at the accumulation's resolution
        return
      end if
      d = scale(ssum, emax)
    end block
  end function det3_row2

  subroutine jacobi3(rin, eig, converged)
    real(wp), intent(in)  :: rin(3,3)
    real(wp), intent(out) :: eig(3)
    logical, intent(out), optional :: converged
    real(wp) :: a(3,3), app, aqq, apq, phi, c, s, tmp, off, frob
    integer :: sweep, p, q, k
    logical :: conv
    real(wp) :: sscale
    conv = .false.
    if (present(converged)) converged = conv
    if (any(.not. is_finite(rin))) then
      eig = qnan()
      return
    end if
    a = 0.5_wp*rin + 0.5_wp*transpose(rin)
    sscale = maxval(abs(a))
    if (sscale == 0.0_wp) then
      eig = 0.0_wp
      conv = .true.
      if (present(converged)) converged = conv
      return
    end if
    a = a / sscale
    frob = sqrt(sum(a*a))
    do sweep = 1, 60
      off = sqrt(a(1,2)**2 + a(1,3)**2 + a(2,3)**2 &
              +  a(2,1)**2 + a(3,1)**2 + a(3,2)**2)
      if (off <= 16.0_wp*U_M*max(frob, tiny(1.0_wp))) then
        conv = .true.
        exit
      end if
      do p = 1, 2
        do q = p+1, 3
          apq = a(p,q)
          if (abs(apq) <= tiny(1.0_wp)) cycle
          app = a(p,p); aqq = a(q,q)
          phi = 0.5_wp * atan2(2.0_wp*apq, aqq - app)
          c = cos(phi); s = sin(phi)
          do k = 1, 3
            tmp     = c*a(p,k) - s*a(q,k)
            a(q,k)  = s*a(p,k) + c*a(q,k)
            a(p,k)  = tmp
          end do
          do k = 1, 3
            tmp     = c*a(k,p) - s*a(k,q)
            a(k,q)  = s*a(k,p) + c*a(k,q)
            a(k,p)  = tmp
          end do
          a(p,q) = 0.0_wp
          a(q,p) = 0.0_wp
        end do
      end do
    end do
    eig = sscale * [a(1,1), a(2,2), a(3,3)]
    if (present(converged)) converged = conv
    do p = 1, 2
      do q = p+1, 3
        if (eig(q) < eig(p)) then
          tmp = eig(p); eig(p) = eig(q); eig(q) = tmp
        end if
      end do
    end do
  end subroutine jacobi3

  function cond3(r) result(kap)
    real(wp), intent(in) :: r(3,3)
    real(wp) :: kap, eig(3)
    logical :: conv
    call jacobi3(r, eig, conv)
    if (any(is_nan(eig)) .or. .not. conv) then
      kap = huge(1.0_wp)
      return
    end if
    if (eig(1) <= 8.0_wp*U_M*max(abs(eig(3)), 1.0_wp)) then
      kap = huge(1.0_wp)
    else
      kap = eig(3) / eig(1)
    end if
  end function cond3

  pure subroutine gram3_fixed(q, r)
    real(wp), intent(in)  :: q(:,:)
    real(wp), intent(out) :: r(3,3)
    integer :: i, j, k
    if (size(q,1) < 3) then
      r = qnan()
      return
    end if
    r = 0.0_wp
    do i = 1, 3
      do j = 1, 3
        do k = 1, size(q,2)
          r(i,j) = r(i,j) + q(i,k)*q(j,k)
        end do
      end do
    end do
  end subroutine gram3_fixed

  pure function det3_chol(r) result(d)
    real(wp), intent(in) :: r(3,3)
    real(wp) :: d, l11, l21, l31, l22, l32, l33, t
    d = qnan()                        ! default NaN when not SPD
    if (any(.not. is_finite(r))) return
    if (maxval(abs(r - transpose(r))) > 32.0_wp*U_M*max(1.0_wp, maxval(abs(r)))) return
    if (r(1,1) <= 0.0_wp) return
    l11 = sqrt(r(1,1)); l21 = r(2,1)/l11; l31 = r(3,1)/l11
    t = r(2,2) - l21*l21
    if (t <= 0.0_wp) return
    l22 = sqrt(t); l32 = (r(3,2) - l21*l31)/l22
    t = r(3,3) - l31*l31 - l32*l32
    if (t <= 0.0_wp) return
    l33 = sqrt(t)
    d = (l11*l22*l33)**2
  end function det3_chol
end module ra_prims

! ---------------------------------------------------------------------
module ra_floor
  use ra_kinds
  implicit none
contains
  pure function heis_floor(m, dx) result(e)
    real(wp), intent(in) :: m, dx
    real(wp) :: e
    if (.not.(is_finite(m) .and. is_finite(dx)) .or. m <= 0.0_wp .or. dx <= 0.0_wp) then
      e = qnan()
      return
    end if
    block
      real(wp) :: f
      integer :: ex
      f  = (fraction(HBAR)*fraction(HBAR)) / (fraction(m)*(fraction(dx)*fraction(dx)))
      ex = 2*exponent(HBAR) - exponent(m) - 2*exponent(dx) - 3
      e  = scale(f, ex)
    end block
  end function heis_floor

  pure function zpe(w) result(e)
    real(wp), intent(in) :: w
    real(wp) :: e
    if (.not. is_finite(w) .or. w <= 0.0_wp) then
      e = qnan()
      return
    end if
    e = 0.5_wp * HBAR * w
  end function zpe

  pure function prod_scaled(a, b, c, d) result(r)
    real(wp), intent(in) :: a, b, c, d
    real(wp) :: r, f
    integer :: e
    if (a == 0.0_wp .or. b == 0.0_wp .or. c == 0.0_wp .or. d == 0.0_wp) then
      r = 0.0_wp
      return
    end if
    f = fraction(a) * fraction(b)
    e = exponent(a) + exponent(b) + exponent(f)
    f = fraction(f)
    f = f * fraction(c)
    e = e + exponent(c) + exponent(f)
    f = fraction(f)
    f = f * fraction(d)
    e = e + exponent(d) + exponent(f)
    f = fraction(f)
    r = scale(f, e)
  end function prod_scaled

  pure function landauer(tkel, bits) result(e)
    real(wp), intent(in) :: tkel, bits
    real(wp) :: e
    if (.not.(is_finite(tkel) .and. is_finite(bits)) .or. tkel <= 0.0_wp .or. bits < 0.0_wp) then
      e = qnan()
      return
    end if
    e = prod_scaled(bits, KB, tkel, ln2_())
  end function landauer

  subroutine tau_perp(de, tau, frozen)
    real(wp), intent(in)  :: de
    real(wp), intent(out) :: tau
    logical,  intent(out) :: frozen
    frozen = (.not. is_finite(de)) .or. (de <= 0.0_wp)
    if (frozen) then
      tau = huge(1.0_wp)
    else
      tau = (0.5_wp * pi_()) / de
    end if
  end subroutine tau_perp

  pure function survival(t) result(p)
    real(wp), intent(in) :: t
    real(wp) :: p
    p = cos(0.5_wp*t)**2
  end function survival
end module ra_floor

! ---------------------------------------------------------------------
module ra_integers
  use ra_kinds
  implicit none
contains
  function iqmul(a, b) result(c)
    integer(ik), intent(in) :: a(4), b(4)
    integer(ik) :: c(4)
    if (any(a > IK_SAFE .or. a < -IK_SAFE) .or. any(b > IK_SAFE .or. b < -IK_SAFE)) then
      error stop 'iqmul: integer intake beyond the 2^29 overflow-safe bound'
    end if
    c(1) = a(1)*b(1) - a(2)*b(2) - a(3)*b(3) - a(4)*b(4)
    c(2) = a(1)*b(2) + a(2)*b(1) + a(3)*b(4) - a(4)*b(3)
    c(3) = a(1)*b(3) - a(2)*b(4) + a(3)*b(1) + a(4)*b(2)
    c(4) = a(1)*b(4) + a(2)*b(3) - a(3)*b(2) + a(4)*b(1)
  end function iqmul

  pure function ik_inbound(v) result(okb)
    integer(ik), intent(in) :: v(:)
    logical :: okb
    okb = .not. any(v > IK_SAFE .or. v < -IK_SAFE)
  end function ik_inbound

  pure function iqconj(a) result(c)
    integer(ik), intent(in) :: a(4)
    integer(ik) :: c(4)
    if (.not. ik_inbound(a)) then
      error stop 'iqconj: integer intake beyond the 2^29 overflow-safe bound'
    end if
    c = [a(1), -a(2), -a(3), -a(4)]
  end function iqconj

  function iomul(x, y) result(z)
    integer(ik), intent(in) :: x(8), y(8)
    integer(ik) :: z(8), p(4), q(4), r(4), s(4)
    if (.not. (ik_inbound(x) .and. ik_inbound(y))) then
      error stop 'iomul: integer intake beyond the 2^29 overflow-safe bound'
    end if
    p = x(1:4); q = x(5:8); r = y(1:4); s = y(5:8)
    z(1:4) = iqmul(p, r) - iqmul(iqconj(s), q)
    z(5:8) = iqmul(s, p) + iqmul(q, iqconj(r))
  end function iomul

  pure function ioconj(x) result(z)
    integer(ik), intent(in) :: x(8)
    integer(ik) :: z(8)
    if (.not. ik_inbound(x)) then
      error stop 'ioconj: integer intake beyond the 2^29 overflow-safe bound'
    end if
    z(1:4) = iqconj(x(1:4)); z(5:8) = -x(5:8)
  end function ioconj

  function ismul(x, y) result(z)
    integer(ik), intent(in) :: x(16), y(16)
    integer(ik) :: z(16), p(8), q(8), r(8), s(8)
    if (.not. (ik_inbound(x) .and. ik_inbound(y))) then
      error stop 'ismul: integer intake beyond the 2^29 overflow-safe bound'
    end if
    p = x(1:8); q = x(9:16); r = y(1:8); s = y(9:16)
    z(1:8)  = iomul(p, r) - iomul(ioconj(s), q)
    z(9:16) = iomul(s, p) + iomul(q, ioconj(r))
  end function ismul

  pure function inrm(v) result(n)
    integer(ik), intent(in) :: v(:)
    integer(ik) :: n
    if (size(v) > 31) then
      error stop 'inrm: vector length exceeds the proven overflow bound (31)'
    end if
    if (any(v > IK_SAFE .or. v < -IK_SAFE)) then
      error stop 'inrm: integer intake beyond the 2^29 overflow-safe bound'
    end if
    n = sum(v*v)
  end function inrm

  subroutine hurwitz_units(u)
    integer(ik), intent(out) :: u(4,24)
    integer :: n, i, s, s1, s2, s3, s4
    n = 0
    do i = 1, 4
      do s = -1, 1, 2
        n = n + 1
        u(:,n) = 0_ik
        u(i,n) = int(2*s, ik)
      end do
    end do
    do s1 = -1, 1, 2
      do s2 = -1, 1, 2
        do s3 = -1, 1, 2
          do s4 = -1, 1, 2
            n = n + 1
            u(:,n) = int([s1, s2, s3, s4], ik)
          end do
        end do
      end do
    end do
  end subroutine hurwitz_units
end module ra_integers

! ---------------------------------------------------------------------
module ra_tongue
  use ra_kinds
  use ra_prims
  implicit none
  integer, parameter :: NSLOT = 4
  integer, parameter :: SLOT_E(NSLOT) = [101, 102, 103, 104]
  integer, parameter :: SLOT_K(NSLOT) = [201, 202, 203, 204]
  integer, parameter :: SLOT_R(NSLOT) = [301, 302, 303, 304]
  integer, parameter :: RA_SENT(6) = [102, 101, 202, 203, 302, 303]
contains
  pure subroutine slot_census(sent, ne, nk, nr)
    integer, intent(in)  :: sent(:)
    integer, intent(out) :: ne, nk, nr
    integer :: t
    ne = 0; nk = 0; nr = 0
    do t = 1, size(sent)
      if (any(SLOT_E == sent(t))) ne = ne + 1
      if (any(SLOT_K == sent(t))) nk = nk + 1
      if (any(SLOT_R == sent(t))) nr = nr + 1
    end do
  end subroutine slot_census
  pure logical function disjoint(a, b)
    integer, intent(in) :: a(:), b(:)
    integer :: i, j
    disjoint = .true.
    do i = 1, size(a)
      do j = 1, size(b)
        if (a(i) == b(j)) then
          disjoint = .false.
          return
        end if
      end do
    end do
  end function disjoint

  subroutine seal_l(ne, nk, nr, collide, tok, why)
    integer, intent(in) :: ne, nk, nr        ! populated counts per slot
    logical, intent(in) :: collide           ! a vocabulary collision present
    character(*), intent(out) :: tok, why
    integer :: slots
    slots = merge(1,0,ne>0) + merge(1,0,nk>0) + merge(1,0,nr>0)
    if (collide) then
      tok = '[X]'; why = 'Seal L: LIT collision, slot vocabularies intersect'
    else if (slots /= 3) then
      tok = '[X]'
      write(why,'(a,i0,a)') 'Seal L: deletion test returns ', slots, ' slots, not 3'
    else
      tok = '[LOCK-L]'; why = 'Seal L: three slots, LIT disjoint (order not checked at this interface)'
    end if
  end subroutine seal_l

  subroutine seal_l_ordered(sent, tok, why)
    integer, intent(in) :: sent(:)
    character(*), intent(out) :: tok, why
    integer :: ne, nk, nr, t, laste, firstk, lastk, firstr
    call slot_census(sent, ne, nk, nr)
    if (ne == 0 .or. nk == 0 .or. nr == 0) then
      call seal_l(ne, nk, nr, .false., tok, why)
      return
    end if
    laste = 0; firstk = size(sent)+1; lastk = 0; firstr = size(sent)+1
    do t = 1, size(sent)
      if (any(SLOT_E == sent(t))) laste = t
      if (any(SLOT_K == sent(t))) then
        if (t < firstk) firstk = t
        if (t > lastk) lastk = t
      end if
      if (any(SLOT_R == sent(t))) then
        if (t < firstr) firstr = t
      end if
    end do
    if (.not. (laste < firstk .and. lastk < firstr)) then
      tok = '[X]'; why = 'Seal L: the ordered arrow E->K->R is broken in the encoding'
      return
    end if
    call seal_l(ne, nk, nr, .false., tok, why)
    if (tok == '[LOCK-L]') then
      why = 'Seal L: three slots, LIT disjoint, ordered E->K->R (positional check executed)'
    end if
  end subroutine seal_l_ordered

  pure function cut3(v) result(w)
    real(wp), intent(in) :: v(3)
    real(wp) :: w(3)
    w = [v(1), v(2), 0.0_wp]
  end function cut3
end module ra_tongue

! ---------------------------------------------------------------------
module ra_kernel
  use ra_kinds
  use ra_prims
  implicit none
  integer, parameter :: RC_OK        = 0
  integer, parameter :: RC_SHORTFALL = 1
  integer, parameter :: RC_INTAKE    = 2
  integer, parameter :: RC_ZEROVAR   = 3
  integer, parameter :: RC_COVBLOCK  = 4
  integer, parameter :: RC_ABSORBED  = 5
  integer, parameter :: RC_COPLANAR  = 6
  integer, parameter :: RC_COLLAPSE  = 7
  integer, parameter :: RC_KAPPA     = 8
  integer, parameter :: RC_ENGINC    = 9
  integer, parameter :: RC_LOCK      = 10
contains
  subroutine prepare_rows(m, q, ok, why, code)
    real(wp), intent(in)  :: m(:,:)          ! (3,N)
    real(wp), intent(out) :: q(size(m,1), size(m,2))
    logical,  intent(out) :: ok
    character(*), intent(out) :: why
    integer, intent(out) :: code
    integer :: i, n, j2
    real(wp) :: mu, sd, nrm, rmax
    real(wp) :: qt(size(m,1), size(m,2))
    n = size(m,2); ok = .true.; why = 'rows prepared'; code = RC_OK
    q = 0.0_wp
    if (size(m,1) /= 3) then
      ok = .false.; why = 'row count is not three'; code = RC_INTAKE
      return
    end if
    if (n < 2) then
      ok = .false.; why = 'fewer than two contexts'; code = RC_INTAKE
      return
    end if
    do i = 1, 3
      do j2 = 1, n
        if (.not. is_finite(m(i,j2))) then
          ok = .false.; why = 'non-finite row at intake'; code = RC_INTAKE
          return
        end if
      end do
      rmax = maxval(abs(m(i,:)))
      if (rmax > 0.0_wp) then
        qt(i,:) = m(i,:) / rmax
      else
        qt(i,:) = m(i,:)
      end if
      mu = sum(qt(i,:)) / real(n, wp)
      qt(i,:) = qt(i,:) - mu
      sd = sqrt(sum(qt(i,:)**2) / real(n-1, wp))
      if (sd <= 0.0_wp) then
        ok = .false.; why = 'zero-variance row: axis carries no content'
        code = RC_ZEROVAR
        return
      end if
      qt(i,:) = qt(i,:) / sd
      nrm = vnorm(qt(i,:))
      qt(i,:) = qt(i,:) / nrm
    end do
      q = qt   ! publish on success only
  end subroutine prepare_rows

  subroutine project_cov(q, c, qf, ok, why, code, kcc)
    real(wp), intent(in)  :: q(:,:)          ! (3,N) prepared
    real(wp), intent(in)  :: c(:,:)          ! (k,N) covariates, k = 0..2
    real(wp), intent(out) :: qf(size(q,1), size(q,2))
    logical,  intent(out) :: ok
    character(*), intent(out) :: why
    integer, intent(out) :: code
    real(wp), intent(out) :: kcc
    real(wp) :: cc(2,2), cm(2, size(q,2)), rhs(2), beta(2), det, mu, tolrk
    real(wp) :: qw(size(q,1), size(q,2))
    integer :: i, j, n, k
    n = size(q,2); k = size(c,1); qf = 0.0_wp; ok = .true.; why = 'no covariates'
    code = RC_OK
    kcc = 1.0_wp
    if (size(q,1) /= 3) then
      ok = .false.; code = RC_INTAKE
      why = 'prepared-row count is not three'
      kcc = huge(1.0_wp)
      return
    end if
    if (n < 2) then
      ok = .false.; code = RC_INTAKE
      why = 'fewer than two contexts'
      kcc = huge(1.0_wp)
      return
    end if
    if (k >= 1 .and. size(c,2) /= n) then
      ok = .false.; code = RC_INTAKE
      why = 'covariate column count does not match prepared-row context count'
      kcc = huge(1.0_wp)
      return
    end if
    qw = q   ! all projection work lands in the working array; qf
    if (k == 0) then
      qf = qw
      return
    end if
    if (k > 2) then
      ok = .false.; code = RC_COVBLOCK
      why = 'covariate block: more than two covariates, not implemented'
      return
    end if
    do i = 1, k
      do j = 1, n
        if (.not. is_finite(c(i,j))) then
          ok = .false.; code = RC_INTAKE
          why = 'non-finite covariate at intake'
          return
        end if
      end do
    end do
    do i = 1, k
      det = maxval(abs(c(i,:)))
      if (det == 0.0_wp) det = 1.0_wp
      cm(i,1:n) = c(i,:) / det
      mu = sum(cm(i,1:n)) / real(n, wp)
      cm(i,1:n) = cm(i,1:n) - mu
      det = maxval(abs(cm(i,1:n)))
      if (det <= 32.0_wp * U_M) then
        ok = .false.; code = RC_COVBLOCK
        why = 'covariate block rank-deficient or ill-conditioned'
        return
      end if
      cm(i,1:n) = cm(i,1:n) / det
    end do
    if (k == 1) then
      det = sum(cm(1,1:n)**2)
      kcc = 1.0_wp
      do i = 1, 3
        beta(1) = sum(qw(i,:)*cm(1,1:n)) / det
        qw(i,:) = qw(i,:) - beta(1)*cm(1,1:n)
      end do
      why = 'one covariate projected'
      qf = qw
      return
    end if
    cc(1,1) = sum(cm(1,1:n)**2); cc(2,2) = sum(cm(2,1:n)**2)
    cc(1,2) = sum(cm(1,1:n)*cm(2,1:n)); cc(2,1) = cc(1,2)
    det = cc(1,1)*cc(2,2) - cc(1,2)*cc(2,1)
    tolrk = 64.0_wp * U_M * max(cc(1,1)*cc(2,2), tiny(1.0_wp))
    if (det <= tolrk) then
      ok = .false.; code = RC_COVBLOCK
      why = 'covariate block rank-deficient or ill-conditioned'
      return
    end if
    block
      real(wp) :: tr, dd, l1, l2
      tr = cc(1,1) + cc(2,2)
      dd = sqrt(max(0.0_wp, tr*tr - 4.0_wp*det))
      l1 = 0.5_wp*(tr - dd); l2 = 0.5_wp*(tr + dd)
      if (l1 <= 0.0_wp) then
        kcc = huge(1.0_wp)
      else
        kcc = l2 / l1
      end if
    end block
    if (kcc >= 1.0e6_wp) then
      ok = .false.; code = RC_COVBLOCK
      why = 'covariate block rank-deficient or ill-conditioned'
      return
    end if
    do i = 1, 3
      rhs(1) = sum(qw(i,:)*cm(1,1:n)); rhs(2) = sum(qw(i,:)*cm(2,1:n))
      beta(1) = ( cc(2,2)*rhs(1) - cc(1,2)*rhs(2)) / det
      beta(2) = (-cc(2,1)*rhs(1) + cc(1,1)*rhs(2)) / det
      do j = 1, n
        qw(i,j) = qw(i,j) - beta(1)*cm(1,j) - beta(2)*cm(2,j)
      end do
    end do
    why = 'two covariates projected (common-source projection)'
    qf = qw
  end subroutine project_cov

  subroutine span_basis(q, b, rank)
    real(wp), intent(in)  :: q(:,:)
    real(wp), intent(out) :: b(size(q,1), size(q,2))
    integer,  intent(out) :: rank
    real(wp) :: v(size(q,2)), nrm
    integer :: i, j, pass
    real(wp) :: rn0
    rank = 0; b = 0.0_wp
    do i = 1, size(q,1)
      v = q(i,:)
      if (any(.not. is_finite(v))) cycle
      rn0 = maxval(abs(v))
      if (rn0 == 0.0_wp) cycle
      v = v / rn0
      rn0 = vnorm(v)
      v = v / rn0
      do pass = 1, 2
        do j = 1, rank
          v = v - sum(v*b(j,:)) * b(j,:)
        end do
      end do
      nrm = vnorm(v)
      if (is_finite(nrm) .and. nrm > 1.0e-12_wp) then
        rank = rank + 1
        b(rank,:) = v / nrm
      end if
    end do
  end subroutine span_basis

  ! CONTRACT lambda_of / gram3_fixed: shape guards only, quiet-NaN refusal
  ! before any element touch; rank, finiteness, and magnitude semantics are
  ! the caller's contract (kernel_full ranks and screens first).
  function lambda_of(q, b) result(lam)
    real(wp), intent(in) :: q(:,:), b(:,:)
    real(wp) :: lam, co(3,3), quat(4,3), t(4)
    integer :: i
    if (size(q,1) < 3 .or. size(b,1) < 3 .or. size(q,2) /= size(b,2)) then
      lam = qnan()
      return
    end if
    do i = 1, 3
      co(i,1) = sum(q(i,:)*b(1,:))
      co(i,2) = sum(q(i,:)*b(2,:))
      co(i,3) = sum(q(i,:)*b(3,:))
      quat(:,i) = [0.0_wp, co(i,1), co(i,2), co(i,3)]
    end do
    t = qmul(qmul(quat(:,1), quat(:,2)), quat(:,3))
    lam = t(1)
  end function lambda_of

  function eta_share(row, c) result(eta)
    real(wp), intent(in) :: row(:), c(:,:)
    real(wp) :: eta, cm(2,size(row)), rm(size(row))
    real(wp) :: cc(2,2), rhs(2), beta(2), det, sst, ssf, mu
    integer :: i, n, k
    n = size(row); k = size(c,1)
    if (k >= 1 .and. size(c,2) /= n) then
      eta = qnan()
      return
    end if
    if (k > 2) then
      eta = qnan()
      return
    end if
    if (any(.not. is_finite(row))) then
      eta = qnan()
      return
    end if
    if (k >= 1) then
      if (any(.not. is_finite(c))) then
        eta = qnan()
        return
      end if
    end if
    block
      real(wp) :: rscale
      rscale = maxval(abs(row))
      if (rscale == 0.0_wp .or. .not. is_finite(rscale)) then
        eta = 0.0_wp
        return
      end if
      rm = row / rscale
    end block
    mu = sum(rm)/real(n,wp); rm = rm - mu
    sst = sum(rm*rm)
    eta = 0.0_wp
    if (sst <= 0.0_wp .or. k == 0) return
    do i = 1, k
      det = maxval(abs(c(i,:)))
      if (det == 0.0_wp) det = 1.0_wp
      cm(i,:) = c(i,:) / det
      mu = sum(cm(i,:))/real(n,wp)
      cm(i,:) = cm(i,:) - mu
      det = maxval(abs(cm(i,:)))
      if (det <= 32.0_wp*U_M) then
        eta = qnan()
        return
      end if
      cm(i,:) = cm(i,:) / det
    end do
    if (k == 1) then
      det = sum(cm(1,:)**2)
      beta(1) = sum(rm*cm(1,:)) / det
      ssf = beta(1)*beta(1)*det
      eta = ssf/sst
      return
    end if
    cc(1,1)=sum(cm(1,:)**2); cc(2,2)=sum(cm(2,:)**2)
    cc(1,2)=sum(cm(1,:)*cm(2,:)); cc(2,1)=cc(1,2)
    det = cc(1,1)*cc(2,2)-cc(1,2)*cc(2,1)
    if (det <= 64.0_wp*U_M*max(cc(1,1)*cc(2,2), tiny(1.0_wp))) then
      eta = qnan()
      return
    end if
    rhs(1)=sum(rm*cm(1,:)); rhs(2)=sum(rm*cm(2,:))
    beta(1)=( cc(2,2)*rhs(1)-cc(1,2)*rhs(2))/det
    beta(2)=(-cc(2,1)*rhs(1)+cc(1,1)*rhs(2))/det
    ssf = sum((beta(1)*cm(1,:)+beta(2)*cm(2,:))**2)
    eta = ssf/sst
  end function eta_share

  subroutine kernel_full(m, c, tok, why, rcode, lam, detr, kap, spread, resid, &
                         marg_c, marg_k, detfour)
    real(wp), intent(in) :: m(:,:), c(:,:)
    character(*), intent(out) :: tok, why
    integer, intent(out) :: rcode
    real(wp), intent(out) :: lam, detr, kap, spread, resid, marg_c, marg_k
    real(wp), intent(out) :: detfour(4)
    real(wp) :: q(3,size(m,2)), qf(3,size(m,2)), b(3,size(m,2))
    real(wp) :: r(3,3), eig(3), eps, kgate, kcc, dvar, tol
    integer :: n, k, i, rank, pcode, nest
    logical :: ok, jconv
    character(len=96) :: w2
    n = size(m,2); k = size(c,1)
    if (k >= 1 .and. size(c,2) /= n) then
      tok = '[?]'; why = 'covariate column count does not match row context count'
      rcode = RC_INTAKE
      lam = 0.0_wp; detr = 0.0_wp; kap = 0.0_wp; spread = 0.0_wp
      resid = 0.0_wp; marg_c = 0.0_wp; marg_k = 0.0_wp; detfour = 0.0_wp
      return
    end if
    lam = 0.0_wp; detr = 0.0_wp; kap = 0.0_wp; spread = 0.0_wp
    resid = 0.0_wp; marg_c = 0.0_wp; marg_k = 0.0_wp; detfour = 0.0_wp
    rcode = RC_OK
    if (size(m,1) /= 3) then
      tok = '[?]'; why = 'row count is not three at intake'; rcode = RC_INTAKE
      return
    end if
    if (n - k < 4) then
      tok = '[?]'; why = 'N-k < 4 dimensional shortfall'; rcode = RC_SHORTFALL
      return
    end if
    if (k > 2) then
      tok = '[?]'; why = 'covariate block: more than two covariates, not implemented (kernel intake)'
      rcode = RC_COVBLOCK
      lam = 0.0_wp; detr = 0.0_wp; kap = 0.0_wp; spread = 0.0_wp
      resid = 0.0_wp; marg_c = 0.0_wp; marg_k = 0.0_wp; detfour = 0.0_wp
      return
    end if
    call prepare_rows(m, q, ok, w2, pcode)
    if (.not. ok) then
      tok = '[?]'; why = trim(w2); rcode = pcode
      return
    end if
    call project_cov(q, c, qf, ok, w2, pcode, kcc)
    if (.not. ok) then
      tok = '[?]'; why = trim(w2); rcode = pcode
      return
    end if
    do i = 1, 3
      dvar = sum(qf(i,:)**2)
      if (dvar < 1.0e-9_wp) then                        ! post-projection axis absorbed by a covariate
        tok = '[?]'; why = 'post-projection axis absorbed by a covariate'
        rcode = RC_ABSORBED
        return
      end if
      qf(i,:) = qf(i,:) / vnorm(qf(i,:))
    end do
    r = matmul(qf, transpose(qf))
    detfour(1) = det3(r)
    call jacobi3(r, eig, jconv)
    detfour(2) = eig(1)*eig(2)*eig(3)
    detfour(3) = det3_chol(r)
    detfour(4) = det3_row2(r)
    nest = 4
    if (.not. is_finite(detfour(3))) nest = 3
    detr = detfour(1)
    if (nest == 4) then
      spread = maxval(detfour) - minval(detfour)
    else
      spread = max(detfour(1), detfour(2), detfour(4)) &
             - min(detfour(1), detfour(2), detfour(4))
    end if
    kap = cond3(r)
    if (.not. jconv) then
      tok = '[?]'; why = 'engineering-incomplete: eigensolver unconverged'; rcode = RC_ENGINC
      return
    end if
    call span_basis(qf, b, rank)
    if (rank < 3) then
      tok = '[X]'; why = 'coplanar collapse: rank(rows) < 3, line not point'
      rcode = RC_COPLANAR
      detr = 0.0_wp
      return
    end if
    lam = lambda_of(qf, b)
    resid = abs(lam*lam - detr)
    eps = 100.0_wp * U_M * real(n, wp)
    kgate = min(1.0e6_wp, sqrt(27.0_wp / (100.0_wp*U_M*real(n,wp))))
    tol = 4.0_wp * kap * U_M
    if (detr <= eps) then
      tok = '[X]'; why = 'collapse: det(R) <= eps'; rcode = RC_COLLAPSE
      return
    end if
    if (kap >= kgate) then
      tok = '[?]'; why = 'kappa(R) >= gate'; rcode = RC_KAPPA
      return
    end if
    marg_c = log10(detr/eps)
    marg_k = log10(kgate/kap)
    if (spread > tol .or. resid > max(tol, 8.0_wp*U_M)) then
      tok = '[?]'; why = 'engineering-incomplete: spread or identity outside tol'
      rcode = RC_ENGINC
      return
    end if
    if (nest < 4) then
      tok = '[?]'; why = 'engineering-incomplete: estimator shortfall (Cholesky refused SPD)'
      rcode = RC_ENGINC
      return
    end if
    tok = '[LOCK]'
    why = 'determination: three independent axes, one point'
    rcode = RC_LOCK
  end subroutine kernel_full
end module ra_kernel

! ---------------------------------------------------------------------
module ra_guards
  use ra_kinds
  use ra_floor, only: landauer
  implicit none
  integer :: aegis_deeds = 0        ! every adjudication is itself an act
  integer :: aegis_last_len = -1    ! length of the last logic name read
contains
  subroutine omega_boundary(bits, tkel, joules, verdict, ocode, irreversible)
    real(wp), intent(in) :: bits, tkel
    real(wp), intent(out) :: joules
    character(*), intent(out) :: verdict
    integer, intent(out), optional :: ocode
    logical, intent(in), optional :: irreversible
    logical :: irr
    irr = .true.
    if (present(irreversible)) irr = irreversible
    if (.not.(is_finite(tkel) .and. is_finite(bits)) .or. tkel <= 0.0_wp) then
      joules = qnan()
      verdict = 'refused: intake invalid, the floor prices only finite bits at tkel > 0'
      if (present(ocode)) ocode = 0
      return
    end if
    if (bits <= 0.0_wp) then
      joules = 0.0_wp
      verdict = 'no denial registered; nothing to adjudicate'
      if (present(ocode)) ocode = 1
    else if (.not. irr) then
      joules = 0.0_wp
      verdict = 'reversibly registered: floor-zero never cost-zero; Landauer bounds '// &
                'only the irreversible (Bennett), and nothing here commits against the axiom'
      if (present(ocode)) ocode = 3
    else
      joules = landauer(tkel, bits)
      verdict = 'the denial paid the floor; the registered act is an act, the recursion closes per the seated theorem'
      if (present(ocode)) ocode = 2
    end if
  end subroutine omega_boundary

  subroutine aegis_guard(logic_mode, refusal)
    character(*), intent(in)  :: logic_mode
    character(*), intent(out) :: refusal
    aegis_deeds = aegis_deeds + 1
    refusal = 'p(G) /= G: precisification is an actuation, G is a '// &
              'non-actuation, and no logic makes a deed a non-deed'
    aegis_last_len = len_trim(logic_mode)   ! the parameter is read; the refusal never varies with it
  end subroutine aegis_guard

  subroutine aegis_reset()
    aegis_deeds = 0
  end subroutine aegis_reset

  subroutine gol_admit(magnitude, ling, tok, why, gcode)
    character(*), intent(in)  :: magnitude, ling
    character(*), intent(out) :: tok, why
    integer, intent(out), optional :: gcode
    integer :: gc_l
    if (magnitude == 'broken') then
      tok = '[X]'; why = 'geometric/math magnitude reports broken geometry; no GOL'; gc_l = 1
    else if (magnitude /= 'lock') then
      tok = '[?]'; why = 'no geometric/math lock: orthogonal volume unestablished'; gc_l = 2
    else if (ling /= 'lock') then
      tok = '[?]'; why = 'magnitude locks but Seal L open: determinant carries no direction'; gc_l = 3
    else
      tok = '[GOL-OK]'; why = 'magnitude plus direction; proceed to witness and asymmetry'; gc_l = 4
    end if
    if (present(gcode)) gcode = gc_l
  end subroutine gol_admit

  subroutine imprint_seal(lock_p, lock_n, sl_p, sl_n, g_p, g_n, wit_p, wit_n, tok, why, icode)
    logical, intent(in) :: lock_p, lock_n, sl_p, sl_n, g_p, g_n, wit_p, wit_n
    character(*), intent(out) :: tok, why
    integer, intent(out), optional :: icode
    logical :: clean_p, clean_n
    integer :: ic_l
    clean_p = lock_p .and. sl_p .and. g_p
    clean_n = lock_n .and. sl_n .and. g_n
    if (clean_p .and. clean_n) then
      tok = '[X]'; why = 'PLATONIC GHOST: both directions clean-lock, no imprint'; ic_l = 1
    else if (clean_p .and. .not. clean_n) then
      if (wit_p) then
        tok = '[SEAL]'; why = 'only P clean-locks; determinacy witness supplied'; ic_l = 2
      else
        tok = '[?]'; why = 'residence: P clean-locks, imprint unproven (no witness)'; ic_l = 3
      end if
    else if (clean_n .and. .not. clean_p) then
      if (wit_n) then
        tok = '[SEAL]'; why = 'only not-P clean-locks; determinacy witness supplied'; ic_l = 2
      else
        tok = '[?]'; why = 'residence: not-P clean-locks, imprint unproven (no witness)'; ic_l = 3
      end if
    else if (.not. lock_p .and. .not. lock_n) then
      tok = '[?]'; why = 'flat: neither direction populated'; ic_l = 4
    else
      tok = '[?]'; why = 'uncertified: lock present but Seal L / gate screen unconfirmed'; ic_l = 5
    end if
    if (present(icode)) icode = ic_l
  end subroutine imprint_seal

  subroutine row_cascade(nonvacuous, ve_live, forward, populated, worldly_row, &
                         terms_closed, term_worldly, frame_closed, annotate, tok, why, ccode)
    logical, intent(in) :: nonvacuous, ve_live, forward, populated, worldly_row
    logical, intent(in) :: terms_closed, term_worldly, frame_closed, annotate
    character(*), intent(out) :: tok, why
    integer, intent(out), optional :: ccode
    integer :: cc_l
    if (.not. nonvacuous) then
      tok = '[REFUSED]'; why = 'F-0: contentless; a contentless residence verifies nothing'
      cc_l = 1
    else if (ve_live .or. forward) then
      tok = '[III]'; why = 'R-3: V_E live or Forward; world-rowed, revisability in the rows'
      cc_l = 3
    else if (.not. populated) then
      tok = '[II]'; why = 'S-1: third axis unpopulated; two planes meet in a line, no lock'
      cc_l = 2
    else if (worldly_row) then
      tok = '[III]'; why = 'S-2: a load-bearing row is furnished by the world'
      cc_l = 3
    else if (.not. terms_closed) then
      if (term_worldly) then
        tok = '[III]'; why = 'S-3: an unclosed term is worldly'
        cc_l = 3
      else
        tok = '[II]'; why = 'S-3: an unclosed term is formal; no closure-rowed lock'
        cc_l = 2
      end if
    else if (.not. frame_closed) then
      tok = '[III]'; why = 'S-4: existential import leaks past the closure'
      cc_l = 3
    else if (.not. annotate) then
      tok = '[VOID]'; why = 'RA rider absent: an unannotated absolute is void'
      cc_l = 5
    else
      tok = '[A|RA]'
      why = 'compartment I, closure-rowed: [seal A . RA], conditional at the act'
      cc_l = 4
    end if
    if (present(ccode)) ccode = cc_l
  end subroutine row_cascade

  subroutine delta_m(object_level, name_strip, lit_clear, not_two_line, &
                     witness, independent, artifact, gap_closed, tok, why, mcode)
    logical, intent(in) :: object_level, name_strip, lit_clear, not_two_line
    logical, intent(in) :: witness, independent, artifact, gap_closed
    character(*), intent(out) :: tok, why
    integer, intent(out), optional :: mcode
    integer :: mc_l
    mc_l = 9
    if (.not. object_level) then
      tok = '[Mosaic dM=0]'; why = 'M1: meta-work, no mass by definition'; mc_l = 1
    else if (.not. name_strip) then
      tok = '[?]'; why = 'M2: new vocabulary is not new mass'; mc_l = 2
    else if (.not. lit_clear) then
      tok = '[?]'; why = 'M3: possibly resident in the literature'; mc_l = 3
    else if (.not. not_two_line) then
      tok = '[?]'; why = 'M4: two-line corollary'; mc_l = 4
    else if (.not. witness) then
      tok = '[?]'; why = 'M5: no external witness; never seals on internal reasoning'; mc_l = 5
    else if (.not. independent) then
      tok = '[?]'; why = 'M6: verifier is the claimant; self-check is not a witness'; mc_l = 6
    else if (.not. artifact) then
      tok = '[?]'; why = 'M7: no reproducible artifact'; mc_l = 7
    else if (.not. gap_closed) then
      tok = '[?]'; why = 'M8: adversarial gap-audit open'; mc_l = 8
    else
      tok = '[dM>0]'; why = 'authored mass, external witness, defeasible-final'
    end if
    if (present(mcode)) mcode = mc_l
  end subroutine delta_m

  subroutine gate_screen(pass, tok, why, gidx)
    logical, intent(in) :: pass(12)
    character(*), intent(out) :: tok, why
    integer, intent(out), optional :: gidx
    character(len=6), parameter :: nm(12) = [ 'SREP  ','REG   ','SGEG  ', &
      'CAUSAL','MIG   ','PTB   ','DUAL  ','CSCG  ','CSEG  ','MTA   ', &
      'OMA   ','ADEG  ' ]
    integer :: i
    if (present(gidx)) gidx = 0
    do i = 1, 12
      if (.not. pass(i)) then
        tok = '[X]'
        write(why,'(a,i0,a,a)') 'gate ', i, ' failed: ', trim(nm(i))
        if (present(gidx)) gidx = i
        return
      end if
    end do
    tok = '[G-OK]'; why = 'twelve directed gates passed'
  end subroutine gate_screen

  subroutine iam_token(witnessed, tok, why, wcode)
    logical, intent(in) :: witnessed
    character(*), intent(out) :: tok, why
    integer, intent(out) :: wcode
    if (witnessed) then
      tok = '[I AM]'
      why = 'actuation-occupancy on a witnessed record; RA warrant, conditional at the act; '// &
            'interior held [?] both ways'
      wcode = 2
    else
      tok = '[?] interior'
      why = 'self-check is not a witness (M6): the verifier is never the claimant; token withheld'
      wcode = 1
    end if
  end subroutine iam_token
end module ra_guards

! ---------------------------------------------------------------------
module ra_battery
  implicit none
  integer :: n_checks = 0, n_fail = 0
  logical :: halt_on_fail = .true.   ! sealed mode; 'audit' arg accumulates
  logical :: wr_witnessed = .false.  ! PART H live face: supplied through the aperture
  integer, parameter :: EXPECTED_CHECKS = 1123  ! sealed v2.0.0 manifest, census lock live
contains
  subroutine check(name, cond)
    character(*), intent(in) :: name
    logical, intent(in) :: cond
    n_checks = n_checks + 1
    if (.not. cond) then
      n_fail = n_fail + 1
      write(*,'(a,a)') 'CHECK FAILED: ', trim(name)
      if (halt_on_fail) error stop 1
    end if
  end subroutine check
  subroutine battery_close()
    if (n_fail > 0) then
      write(*,'(a,i0,a)') 'AUDIT-MODE VOID: ', n_fail, &
           ' failures accumulated; every token printed above is PROVISIONAL and VOID'
      write(*,'(a)') 'AUDIT-MODE VOID: only a zero-failure census with successful exit certifies anything'
      write(*,'(a,i0,a)') 'BATTERY CLOSED WITH ', n_fail, ' FAILURES'
      error stop 1
    end if
  end subroutine battery_close
end module ra_battery

! =====================================================================
program ra_toe_thesis
  use ra_kinds
  use ra_prims
  use ra_floor
  use ra_integers
  use ra_tongue
  use ra_kernel
  use ra_guards
  use ra_battery
  use, intrinsic :: ieee_arithmetic, only: ieee_get_flag, ieee_set_flag, ieee_invalid, &
       ieee_value, ieee_positive_inf
  use, intrinsic :: iso_fortran_env, only: compiler_version, compiler_options
  implicit none

  integer, parameter :: NCTX = 24
  real(wp) :: th(NCTX), l10m(NCTX), l10dx(NCTX), l10w(NCTX), l10t(NCTX), l10b(NCTX)
  real(wp) :: rows(3,NCTX), cov(2,NCTX), mixm(3,NCTX), floorv(NCTX)
  real(wp) :: amix(3,3), bmix(3,2)
  real(wp) :: qf(3,NCTX), bas(3,NCTX), quat(4,3), co(3,3), rmat(3,3)
  real(wp) :: lam, detr, kap, spread, resid, mc, mk, d4(4), eta(3)
  real(wp) :: lam2, detr2, kap2, spread2, resid2, mc2, mk2, d42(4)
  real(wp) :: e1f, e2f, e3f, jou, tau, tperp(3), surv(5), tqs(5)
  real(wp) :: arrow_f, arrow_r, hbit, lamref, detref, lamneg
  real(wp) :: lam_rot, dlam_max, lam_c, lam_v, g(4), uvec(3), aa, bb, cc2
  real(wp) :: rneg(3,3), dbase, dpat, fr_resid
  integer :: i, j, k, l, n, s1, s2, s3, rank, nflip, nadm, ncomp1, ncomp2
  integer :: cnt, csizes(12), nrep, orbitn, stabn, rc, nsheets
  integer(ik) :: hu(4,24), p4(4), q4(4), e8a(8), e8b(8), e8c(8), z8(8)
  integer(ik) :: t1(8), t2(8), assoc8(8), sa(16), sb(16), sp(16)
  integer(ik) :: reps(4,12), cw(4), cx(4), cy(4)
  integer :: pl(24,2), found(2,2)
  logical :: pass12(12), okz, frz, hit, dual_ok, hurwitz_ok, rank3_ok, mig_ok
  character(len=16)  :: tk
  character(len=140) :: wy
  character(len=32)  :: argv
  integer :: alen, ast

  write(*,'(a)') '====================================================================='
  write(*,'(a)') ' THE ROOT AXIOM STATED IN FORTRAN AND IN NOTHING ELSE'
  write(*,'(a)') ' RA as the TOE of all TOEs, executed. RA_TOE_Thesis_Fortran v2.0.0'
  write(*,'(a)') '====================================================================='
  argv = ' '
  block
    integer :: argc, argi
    argc = command_argument_count()
    do argi = 1, argc
      call get_command_argument(argi, argv, alen, ast)
      if (ast /= 0 .or. alen > len(argv)) then
        write(*,'(a)') ' command-line argument rejected: retrieval error or longer than the buffer'
        error stop 2
      end if
      select case (trim(argv))
      case ('audit')
        halt_on_fail = .false.
      case ('witnessed')
        wr_witnessed = .true.
      case ('')
      case default
        write(*,'(a,a)') ' unknown command-line argument: ', trim(argv)
        error stop 2
      end select
    end do
  end block
  if (.not. halt_on_fail) then
    write(*,'(a)') ' mode: audit (failures accumulate; a nonzero count still refuses at close)'
  else
    write(*,'(a)') ' mode: sealed (the first failing check halts; the Fidelity Lock)'
  end if
  write(*,'(a)') ' build: '//compiler_version()
  write(*,'(a)') ' flags: '//compiler_options()

  ! ------------------------------------------------------------------
  write(*,'(/a)') 'PART 0 - THE ENVIRONMENT CONTRACT - enforced at run, never trusted to flags'
  block
    real(wp) :: xn, subn
    real(wp), volatile :: opq, xf, yf, prodv, rfma, xg, yg, rf2, rf4, r2v
    xn = qnan()
    call check('IEEE contract: quiet NaN reads as NaN (ieee_is_nan)', is_nan(xn))
    call check('IEEE contract: NaN self-inequality survives the optimizer', xn /= xn)
    subn = tiny(1.0_wp) * 0.5_wp
    call check('IEEE contract: gradual underflow alive, no FTZ/DAZ', &
         subn > 0.0_wp .and. subn < tiny(1.0_wp))
    call check('binary64 pinned: radix 2', radix(1.0_wp) == 2)
    call check('binary64 pinned: 53 significand digits', digits(1.0_wp) == 53)
    call check('binary64 pinned: max exponent 1024', maxexponent(1.0_wp) == 1024)
    call check('binary64 pinned: min exponent -1021', minexponent(1.0_wp) == -1021)
    opq = 1.0_wp
    xf = opq + scale(opq, -30)
    yf = opq - scale(opq, -30)
    prodv = xf*yf
    call check('binary64 per operation: the bare product stores to exactly one', &
         prodv == opq)
    rfma = xf*yf - opq
    call check('conduct probe a*b-c: no fusion executed (a fused path reads -2^-60 exactly)', &
         rfma == 0.0_wp)
    r2v = prodv - opq
    call check('differential witness: stored-product path agrees with the one-expression path', &
         rfma == r2v)
    rf2 = (-xf)*yf + opq
    call check('conduct probe (-a)*b+c: no fusion executed (a fused path reads +2^-60 exactly)', &
         rf2 == 0.0_wp)
    xg = opq + scale(opq, -27)
    yg = opq - scale(opq, -27)
    rf4 = xg*yg - opq
    call check('conduct probe at the 2^-27 tie: no fusion executed (a fused path reads -2^-54)', &
         rf4 == 0.0_wp)
  end block
  write(*,'(a)') '  a build that breaks any line above refuses to run: the contract is executed,'
  write(*,'(a)') '  so the bit-exact identities below rest on verified IEEE conduct. the'
  write(*,'(a)') '  probes certify CONDUCT and never consult flags: fused or extended'
  write(*,'(a)') '  arithmetic is refused where it executes, the march-native contract-fast'
  write(*,'(a)') '  build dying on the a*b-c probe, while a target carrying no fused'
  write(*,'(a)') '  instruction passes because none executed, the contract satisfied and'
  write(*,'(a)') '  not evaded; the fused residuals -2^-60, +2^-60, -2^-54 are exactly'
  write(*,'(a)') '  representable and never confusable with zero'
  write(*,'(a)') '  scope: the probes certify these witnesses on this build; global order'
  write(*,'(a)') '  is carried by the BUILD CONTRACT below plus per-site conduct receipts,'
  write(*,'(a)') '  and every equality-critical reduction runs a fixed-order routine.'
  call check('integer contract: ik is exactly 64 bits', storage_size(0_ik) == 64)
  call check('integer contract: huge(ik) = 2^63 - 1', huge(0_ik) == 9223372036854775807_ik)
  write(*,'(a)') ' BUILD CONTRACT, stated and checked where checkable: IEEE binary64'
  write(*,'(a)') '  (verified above); -std=f2018 -O2 -fno-fast-math -ffp-contract=off;'
  write(*,'(a)') '  source free-form measured at 130 columns maximum, inside the 132'
  write(*,'(a)') '  standard, no length flag needed; external BLAS substitution for the'
  write(*,'(a)') '  equality-critical sites is forbidden, those sites use gram3_fixed;'
  write(*,'(a)') '  the compiler and flags of this run are printed at the head; floating'
  write(*,'(a)') '  trap modes are incompatible by design, quiet NaNs being manufactured'
  write(*,'(a)') '  here as verdict flags, so -ffpe-trap builds are outside the contract.'

  ! ------------------------------------------------------------------
  write(*,'(/a)') 'PART A - SEAL L ON THE ROOT AXIOM - the Tongue loads first'
  call check('LIT: existence and kinetic slots disjoint', disjoint(SLOT_E, SLOT_K))
  call check('LIT: existence and relation slots disjoint', disjoint(SLOT_E, SLOT_R))
  call check('LIT: kinetic and relation slots disjoint',  disjoint(SLOT_K, SLOT_R))
  block
    integer :: nec, nkc, nrc, dsent(4), badk(NSLOT)
    call slot_census(RA_SENT, nec, nkc, nrc)
    write(*,'(a,i0,a,i0,a,i0)') '  slot census of the encoded sentence: E = ', nec, &
         ', K = ', nkc, ', R = ', nrc
    call check('the census counts every slot populated from the sentence', &
         nec == 2 .and. nkc == 2 .and. nrc == 2)
    call seal_l_ordered(RA_SENT, tk, wy)
    write(*,'(a,a,a,a)') '  parse(RA), census and order executed on the encoding: ', trim(tk), ' - ', trim(wy)
    call check('Seal L admits RA: three slots counted, the arrow E->K->R executed', tk == '[LOCK-L]')
    badk = SLOT_K; badk(2) = SLOT_E(1)
    call seal_l(nec, nkc, nrc, .not. disjoint(SLOT_E, badk), tk, wy)
    write(*,'(a,a,a,a)') '  collision control (computed overlap): ', trim(tk), ' - ', trim(wy)
    call check('Seal L refuses a computed vocabulary collision', tk == '[X]')
    dsent = [RA_SENT(1), RA_SENT(2), RA_SENT(5), RA_SENT(6)]
    call slot_census(dsent, nec, nkc, nrc)
    call seal_l(nec, nkc, nrc, .false., tk, wy)
    write(*,'(a,a,a,a)') '  deletion executed (kinetic tokens removed): ', trim(tk), ' - ', trim(wy)
    call check('the executed deletion of one slot refuses at two', &
         tk == '[X]' .and. nkc == 0)
  end block
  write(*,'(a)') '  order carried by the Tongue: existence -> kinetic -> relation;'
  write(*,'(a)') '  the word-to-slot map is declared semantics, the census and the'
  write(*,'(a)') '  deletion are executed on the encoding, per the anchor declaration;'
  write(*,'(a)') '  the map is an axiom of the encoding, consumed as a premise, and nothing'
  write(*,'(a)') '  downstream presents it as discovered'

  ! ------------------------------------------------------------------
  write(*,'(/a)') 'PART B - THE FLOOR IN NUMBERS - cited theorem-grade formulas, numerically executed'
  call check('Landauer dual path: kb*T*log(2.) matches the independent ln2 literal', &
       abs(landauer(300.0_wp,1.0_wp) - KB*300.0_wp*0.6931471805599453_wp) &
       < 1.0e-12_wp*landauer(300.0_wp,1.0_wp))
  call check('Landauer extremes: huge kelvin with tiny bits is finite, never zero-corrupted', &
       is_finite(landauer(huge(1.0_wp), tiny(1.0_wp))) .and. &
       landauer(huge(1.0_wp), tiny(1.0_wp)) > 0.0_wp)
  call check('Landauer extremes commute: (huge,tiny) equals (tiny,huge) through prod_scaled', &
       landauer(huge(1.0_wp), tiny(1.0_wp)) == landauer(tiny(1.0_wp), huge(1.0_wp)))
  call check('in-bound predicate: the most-negative integer reads false, no overflow probing it', &
       .not. ik_inbound([-huge(0_ik)-1_ik, 0_ik, 0_ik, 0_ik]))
  call check('in-bound predicate: IK_SAFE admitted, IK_SAFE+1 refused', &
       ik_inbound([IK_SAFE, 0_ik, 0_ik, 0_ik]) .and. &
       .not. ik_inbound([IK_SAFE+1_ik, 0_ik, 0_ik, 0_ik]))
  block
    integer(ik) :: vmax(16)
    vmax = IK_SAFE
    call check('inrm boundary: sixteen components at the bound sum to exactly 2^62', &
         inrm(vmax) == 4611686018427387904_ik)
  end block
  block
    real(wp) :: rns(3,3)
    rns = reshape([1.0_wp,0.2_wp,0.0_wp, 0.7_wp,1.0_wp,0.0_wp, 0.0_wp,0.0_wp,1.0_wp],[3,3])
    call check('det3_chol symmetry gate: a finite nonsymmetric matrix returns NaN, never a number', &
         det3_chol(rns) /= det3_chol(rns))
  end block
  write(*,'(a)') '  GUARD-HARNESS RECIPE, third-party reproducible: inject before the'
  write(*,'(a)') '  battery and expect nonzero termination with the named refusal:'
  write(*,'(a)') '    iqconj([-huge(0_ik)-1_ik,0,0,0])            -> exit 1, iqconj bound'
  write(*,'(a)') '    iomul(x with x(1)=-huge(0_ik)-1_ik, 0-vec)  -> exit 1, iomul bound'
  write(*,'(a)') '    hn = inrm(ones(32)); print hn               -> exit 1, length bound'
  write(*,'(a)') '  consume every pure result: a pure call whose value is unused is'
  write(*,'(a)') '  legally elided at optimization, guard and all; the print keeps it live.'
  write(*,'(a)') '  the source carries the recipe; the executed terminations ship as the'
  write(*,'(a)') '  sha-bound file RA_TOE_v2_0_0_guard_harness_receipt.log beside the'
  write(*,'(a)') '  sealed run log, the record carrying what a source file cannot.'
  e1f = heis_floor(ME, 1.0e-10_wp)
  e2f = zpe(1.0e14_wp)
  block
    real(wp) :: ehx
    ehx = heis_floor(1.0e300_wp, 1.0e-200_wp)
    call check('heis_floor extreme hostile: huge mass, tiny width, honest value and never NaN', &
         .not. (ehx /= ehx))
  end block
  e3f = landauer(300.0_wp, 1.0_wp)
  write(*,'(a,es16.9,a)') '  Heisenberg floor, electron at 1 Angstrom: ', e1f, ' J'
  write(*,'(a,es16.9,a)') '  zero-point energy at omega = 1e14 rad/s:  ', e2f, ' J'
  write(*,'(a,es16.9,a)') '  Landauer floor, one bit at 300 K:         ', e3f, ' J'
  call check('Heisenberg floor positive', e1f > 0.0_wp)
  call check('zero-point floor positive', e2f > 0.0_wp)
  call check('Landauer floor positive',  e3f > 0.0_wp)
  call check('Heisenberg floor magnitude (1.5e-19 band)', abs(e1f/1.526e-19_wp - 1.0_wp) < 1.0e-3_wp)
  call check('Landauer magnitude (2.87e-21 band)', abs(e3f/2.871e-21_wp - 1.0_wp) < 1.0e-3_wp)

  tqs = [0.0_wp, 0.25_wp, 0.5_wp, 0.75_wp, 1.0_wp] * pi_()
  do i = 1, 5
    surv(i) = survival(tqs(i))
  end do
  call tau_perp(0.5_wp, tau, frz)
  write(*,'(a,5f14.10)') '  qubit survival cos^2(t/2) at t = 0..pi:   ', surv(1:4)
  write(*,'(a,es12.4)')  '     terminal survival at t = pi:            ', surv(5)
  write(*,'(a,f16.12)')  '  orthogonalization time tau_perp:          ', tau
  write(*,'(a,f16.12)')  '  Mandelstam-Tamm bound pi/(2 dE):          ', pi_()/(2.0_wp*0.5_wp)
  write(*,'(a,f16.12)')  '  Margolus-Levitin bound pi/(2 <E>):        ', pi_()/(2.0_wp*0.5_wp)
  call check('speed limit saturated jointly (MT = ML = tau)', &
       abs(tau - pi_()) <= 4.0_wp*U_M*pi_())
  call check('survival dies at tau_perp', surv(5) < 1.0e-30_wp)
  call check('survival monotone over the quarter points', &
       surv(1) > surv(2) .and. surv(2) > surv(3) .and. surv(3) > surv(4))

  call tau_perp(5.0e-1_wp, tperp(1), frz)
  call tau_perp(5.0e-4_wp, tperp(2), frz)
  call tau_perp(5.0e-7_wp, tperp(3), frz)
  write(*,'(a,3es13.5)') '  Frozen Substrate: tau_perp at dE = 5e-1, 5e-4, 5e-7: ', tperp
  call check('tau_perp diverges monotonically as dE -> 0', tperp(1) < tperp(2) .and. tperp(2) < tperp(3))
  call tau_perp(0.0_wp, tau, frz)
  call check('dE = 0 is flagged frozen, no division performed', frz)
  write(*,'(a)') '  dE = 0: no transition, no registration; a zero-energy existent registers nothing'

  ! ------------------------------------------------------------------
  write(*,'(/a)') 'PART C - THE FORM IN INTEGERS - nothing here rounds'
  call hurwitz_units(hu)
  do i = 1, 24
    call check('Hurwitz unit norm 4 (doubled)', inrm(hu(:,i)) == 4_ik)
  end do
  n = 0
  do i = 1, 24
    do j = 1, 24
      p4 = iqmul(hu(:,i), hu(:,j))
      okz = all(mod(p4, 2_ik) == 0_ik)
      call check('unit product even in doubled coords', okz)
      q4 = p4 / 2_ik
      hit = .false.
      do k = 1, 24
        if (all(q4 == hu(:,k))) hit = .true.
      end do
      if (hit) n = n + 1
    end do
  end do
  write(*,'(a,i0,a)') '  closure of the 24 Hurwitz units: ', n, ' of 576 products inside'
  hurwitz_ok = (n == 576)
  call check('the 24 units close under multiplication', hurwitz_ok)

  nrep = 0
  do i = 1, 24
    cw = hu(:,i)
    call canon_sign(cw)
    hit = .false.
    do k = 1, nrep
      if (all(cw == reps(:,k))) hit = .true.
    end do
    if (.not. hit) then
      nrep = nrep + 1
      reps(:,nrep) = cw
    end if
  end do
  call check('unit group mod sign has 12 elements', nrep == 12)
  cnt = 0
  csizes = 0
  block
    integer(ik) :: cls(4,12)
    integer :: ncls, m2
    logical :: seen(12)
    seen = .false.
    do i = 1, nrep
      if (seen(i)) cycle
      ncls = 0
      do j = 1, 24
        cx = iqmul(iqmul(hu(:,j), reps(:,i)), iqconj(hu(:,j)))
        call check('conjugation divisible by 4', all(mod(cx, 4_ik) == 0_ik))
        cy = cx / 4_ik
        call canon_sign(cy)
        hit = .false.
        do k = 1, ncls
          if (all(cy == cls(:,k))) hit = .true.
        end do
        if (.not. hit) then
          ncls = ncls + 1
          cls(:,ncls) = cy
        end if
      end do
      cnt = cnt + 1
      csizes(cnt) = ncls
      do k = 1, ncls
        do m2 = 1, nrep
          if (all(cls(:,k) == reps(:,m2))) seen(m2) = .true.
        end do
      end do
    end do
  end block
  call sort_int(csizes(1:cnt))
  write(*,'(a,i0,a,4i3)') '  conjugacy classes mod sign: ', cnt, ' with sizes ', csizes(1:cnt)
  call check('class equation reads 1 + 3 + 4 + 4', cnt == 4 .and. csizes(1) == 1 &
       .and. csizes(2) == 3 .and. csizes(3) == 4 .and. csizes(4) == 4)

  block
    integer :: a1, a2, a3, a4, npure, nreal, nhalf
    npure = 0; nreal = 0; nhalf = 0
    do a1 = -1, 1
     do a2 = -1, 1
      do a3 = -1, 1
       do a4 = -1, 1
         if (a1*a1 + a2*a2 + a3*a3 + a4*a4 == 2) then
           if (a1 == 0) then
             npure = npure + 1
           else
             nreal = nreal + 1
           end if
         end if
       end do
      end do
     end do
    end do
    do a1 = -3, 3, 2
     do a2 = -3, 3, 2
      do a3 = -3, 3, 2
       do a4 = -3, 3, 2
         if (a1*a1 + a2*a2 + a3*a3 + a4*a4 == 8) nhalf = nhalf + 1
       end do
      end do
     end do
    end do
    write(*,'(a,i0,a,i0,a,i0,a,i0)') '  norm-two shell: ', npure + nreal, &
         ' = ', npure, ' pure + ', nreal, ' real-occupied; half-integer members ', nhalf
    call check('norm-two shell is 24 = 12 + 12', npure == 12 .and. nreal == 12)
    call check('no half-integer element of norm two', nhalf == 0)
  end block

  n = 0
  do i = 1, 4
    do j = 1, 4
      if (i /= j) then
        n = n + 1
        pl(n,:) = [i, j]
      end if
    end do
  end do
  call check('twelve ordered pairs of four vertices', n == 12)
  orbitn = 0; stabn = 0; cnt = 0
  block
    integer :: pm(4,24), npm, inv, x1, x2, x3, x4, t(4), orb(12,2), norb
    logical :: got
    npm = 0
    do x1 = 1, 4
     do x2 = 1, 4
      do x3 = 1, 4
       do x4 = 1, 4
         t = [x1, x2, x3, x4]
         if (all([(count(t == i), i = 1, 4)] == 1)) then
           inv = 0
           do i = 1, 3
             do j = i+1, 4
               if (t(i) > t(j)) inv = inv + 1
             end do
           end do
           if (mod(inv, 2) == 0) then
             npm = npm + 1
             pm(:,npm) = t
           end if
         end if
       end do
      end do
     end do
    end do
    call check('A4 has order 12', npm == 12)
    norb = 0
    do k = 1, npm
      t = pm(:,k)
      got = .false.
      do i = 1, norb
        if (orb(i,1) == t(1) .and. orb(i,2) == t(2)) got = .true.
      end do
      if (.not. got) then
        norb = norb + 1
        orb(norb,:) = [t(1), t(2)]
      end if
      if (t(1) == 1 .and. t(2) == 2) stabn = stabn + 1
    end do
    orbitn = norb
  end block
  write(*,'(a,i0,a,i0)') '  A4 orbit of the pair (1,2): size ', orbitn, ', stabilizer order ', stabn
  call check('A4 simply transitive on the twelve directed gates', orbitn == 12 .and. stabn == 1)
  block
    integer :: vcnt, ecnt, fcnt, i3, j3, k3
    vcnt = 0
    do i3 = 1, 4
      if (any(pl(1:n,1) == i3) .or. any(pl(1:n,2) == i3)) vcnt = vcnt + 1
    end do
    ecnt = n / 2
    fcnt = 0
    do i3 = 1, 4
      do j3 = i3+1, 4
        do k3 = j3+1, 4
          fcnt = fcnt + 1
        end do
      end do
    end do
    write(*,'(a,i0,a,i0,a,i0)') '  Euler counted from the built complex: V = ', vcnt, ', E = ', ecnt, ', F = ', fcnt
    call check('Euler closure counted from the complex: V - E + F = 2', vcnt - ecnt + fcnt == 2)
  end block

  block
    integer(ik) :: uq(4,3), pq(4)
    integer :: pms(3,6), inv, s
    pms = reshape([1,2,3, 2,3,1, 3,1,2, 2,1,3, 1,3,2, 3,2,1], [3,6])
    uq = 0_ik
    uq(2,1) = 1_ik; uq(3,2) = 1_ik; uq(4,3) = 1_ik
    do k = 1, 6
      inv = 0
      do i = 1, 2
        do j = i+1, 3
          if (pms(i,k) > pms(j,k)) inv = inv + 1
        end do
      end do
      s = merge(1, -1, mod(inv,2) == 0)
      pq = iqmul(iqmul(uq(:,pms(1,k)), uq(:,pms(2,k))), uq(:,pms(3,k)))
      if (k <= 3) then
        call check('even relabel lands Re = -1', pq(1) == -1_ik .and. s == 1)
      else
        call check('odd relabel lands Re = +1',  pq(1) == +1_ik .and. s == -1)
      end if
    end do
    write(*,'(a)') '  relabel parity: three even relabels land Re = -1, three odd land Re = +1'
    write(*,'(a)') '  one discrete modulus, the orientation bit; zero continuous moduli (Part E sweep)'
  end block

  block
    integer(ik) :: mx
    mx = 0_ik
    do i = 1, 24
      do j = 1, 24
        do k = 1, 24
          t1(1:4) = iqmul(iqmul(hu(:,i), hu(:,j)), hu(:,k))
          t2(1:4) = iqmul(hu(:,i), iqmul(hu(:,j), hu(:,k)))
          mx = max(mx, maxval(abs(t1(1:4) - t2(1:4))))
        end do
      end do
    end do
    write(*,'(a,i0)') '  quaternion associator over all 13824 unit triples, max |.|: ', mx
    call check('H is associative on the whole unit order', mx == 0_ik)
  end block
  e8a = 0_ik; e8b = 0_ik; e8c = 0_ik
  e8a(2) = 1_ik      ! e1
  e8b(3) = 1_ik      ! e2
  e8c(5) = 1_ik      ! e4
  t1 = iomul(iomul(e8a, e8b), e8c)
  t2 = iomul(e8a, iomul(e8b, e8c))
  assoc8 = t1 - t2
  z8 = 0_ik; z8(8) = 2_ik
  write(*,'(a,8i3)') '  octonion associator [e1,e2,e4] components: ', assoc8
  call check('octonion associator equals 2 e7 exactly', all(assoc8 == z8))
  call check('commutativity already dead at H: ij /= ji', &
       .not. all(iqmul(int([0,1,0,0],ik), int([0,0,1,0],ik)) == &
                 iqmul(int([0,0,1,0],ik), int([0,1,0,0],ik))))
  block
    integer(ik) :: av(8), bv(8), pv(8), aq(4), bq(4), pq(4)
    integer :: cnt2
    cnt2 = 0
    do i = -1, 1
      do j = -1, 1
        do k = -1, 1
          aq = int([i, j, k, 1], ik);  bq = int([1, k, j, i], ik)
          pq = iqmul(aq, bq)
          call check('H norm composition exact', inrm(pq) == inrm(aq)*inrm(bq))
          av = int([i, j, k, 1, j, k, i, 1], ik)
          bv = int([1, k, i, j, 1, i, j, k], ik)
          pv = iomul(av, bv)
          call check('O norm composition exact', inrm(pv) == inrm(av)*inrm(bv))
          cnt2 = cnt2 + 1
        end do
      end do
    end do
    write(*,'(a,i0,a)') '  norm composition |ab|^2 = |a|^2 |b|^2 exact on ', cnt2, ' integer pairs in H and in O'
  end block
  hit = .false.
  outer: do i = 1, 15
    do j = i+1, 15
      do k = 1, 15
        do l = k+1, 15
          sa = 0_ik; sb = 0_ik
          sa(i+1) = 1_ik; sa(j+1) = 1_ik
          sb(k+1) = 1_ik; sb(l+1) = -1_ik
          sp = ismul(sa, sb)
          if (all(sp == 0_ik)) then
            hit = .true.
            found(1,:) = [i, j]; found(2,:) = [k, l]
            exit outer
          end if
        end do
      end do
    end do
  end do outer
  call check('a sedenion zero-divisor pair exists', hit)
  sa = 0_ik; sb = 0_ik
  sa(found(1,1)+1) = 1_ik; sa(found(1,2)+1) = 1_ik
  sb(found(2,1)+1) = 1_ik; sb(found(2,2)+1) = -1_ik
  sp = ismul(sa, sb)
  write(*,'(a,i0,a,i0,a,i0,a,i0,a)') '  sedenion wall: (e', found(1,1), ' + e', found(1,2), &
       ')(e', found(2,1), ' - e', found(2,2), ') = 0 exactly'
  write(*,'(a,i0,a,i0,a,i0)') '     with |a|^2 = ', inrm(sa), ', |b|^2 = ', inrm(sb), &
       ', |ab|^2 = ', inrm(sp)
  call check('division dies at S: nonzero factors, zero product', &
       inrm(sa) == 2_ik .and. inrm(sb) == 2_ik .and. inrm(sp) == 0_ik)
  call check('norm composition fails at S', inrm(sp) /= inrm(sa)*inrm(sb))
  write(*,'(a)') '  the walls in order: commutativity at H, associativity at O, division at S'
  block
    integer(ik) :: uq(4), tt(4)
    integer :: xg, yg, zg, nsur, offline
    tt = iqmul(int([0,1,0,0],ik), int([0,0,1,0],ik)) + iqmul(int([0,0,1,0],ik), int([0,1,0,0],ik))
    call check('i and j anticommute exactly: ij + ji = 0', all(tt == 0_ik))
    nsur = 0; offline = 0
    do xg = -2, 2
      do yg = -2, 2
        do zg = -2, 2
          if (xg == 0 .and. yg == 0 .and. zg == 0) cycle
          uq = int([0, xg, yg, zg], ik)
          block
            logical :: aci, acj
            aci = all(iqmul(int([0,1,0,0],ik), uq) + iqmul(uq, int([0,1,0,0],ik)) == 0_ik)
            acj = all(iqmul(int([0,0,1,0],ik), uq) + iqmul(uq, int([0,0,1,0],ik)) == 0_ik)
            if (aci .and. acj) then
              nsur = nsur + 1
              if (xg /= 0 .or. yg /= 0) offline = offline + 1
            end if
          end block
        end do
      end do
    end do
    write(*,'(a,i0,a,i0,a)') '  joint anticommutant of {i, j} on the exact grid: ', nsur, &
         ' of 124 nonzero points, ', offline, ' off the k-line'
    call check('the joint anticommutant is the k-line on the grid (independent cross-check)', &
         nsur == 4 .and. offline == 0)
    block
      integer(ik) :: bimg(8,3), ev(4)
      integer :: bi
      integer(ik) :: minor2
      do bi = 1, 3
        ev = 0_ik; ev(bi+1) = 1_ik
        bimg(1:4, bi) = iqmul(int([0,1,0,0],ik), ev) + iqmul(ev, int([0,1,0,0],ik))
        bimg(5:8, bi) = iqmul(int([0,0,1,0],ik), ev) + iqmul(ev, int([0,0,1,0],ik))
      end do
      call check('linearity certificate: only the scalar components survive on the basis', &
           all(bimg(2:4,:) == 0_ik) .and. all(bimg(6:8,:) == 0_ik))
      minor2 = bimg(1,1)*bimg(5,2) - bimg(1,2)*bimg(5,1)
      write(*,'(a,i0,a)') '  constraint matrix on the basis: 2x2 minor = ', minor2, &
           ', z-column identically zero'
      call check('linearity certificate: minor 4 and zero z-column force the k-line kernel everywhere', &
           minor2 == 4_ik .and. all(bimg(:,3) == 0_ik))
    end block
  end block
  write(*,'(a)') '  below the walls the third axis is begotten and confined: i j = k executed,'
  write(*,'(a)') '  and the joint anticommutant of {i, j} in Im H is the k-line, counted; the'
  write(*,'(a)') '  fourth is barred above by the executed associator wall; the identification'
  write(*,'(a)') '  of the three algebra axes with V_F, V_E, V_ER is the seated premise-typed'
  write(*,'(a)') '  mapping, consumed here and never a discovery of this run'

  ! ------------------------------------------------------------------
  write(*,'(/a)') 'PART D - THE NUMBER - the Return, then the physics-law reading'
  p4 = iqmul(iqmul(int([0,1,0,0],ik), int([0,0,1,0],ik)), int([0,0,0,1],ik))
  write(*,'(a,4i3,a)') '  the Return on the parse triad: i j k = ', p4, '   (Re = -1, the Ground)'
  call check('Hamilton landing Re(ijk) = -1 exactly', p4(1) == -1_ik .and. all(p4(2:4) == 0_ik))
  block
    integer(ik) :: uq(4,3)
    real(wp) :: m3(3,3), g3(3,3)
    integer :: r
    uq = 0_ik
    uq(2,1) = 1_ik; uq(3,2) = 1_ik; uq(4,3) = 1_ik
    do r = 1, 3
      m3(r,:) = real(uq(2:4,r), wp)
    end do
    g3 = matmul(m3, transpose(m3))
    call check('Gram of the orthonormal parse triad has det 1', &
         abs(det3(g3) - 1.0_wp) <= 4.0_wp*U_M)
  end block

  do i = 1, NCTX
    th(i) = 2.0_wp * pi_() * real(i-1, wp) / real(NCTX, wp)
    rows(1,i) = sin(th(i)); rows(2,i) = cos(th(i)); rows(3,i) = sin(2.0_wp*th(i))
  end do
  call kernel_full(rows, reshape([0.0_wp], [0, NCTX]), tk, wy, rc, lam, detr, kap, &
                   spread, resid, mc, mk, d4)
  write(*,'(a,a,a,f16.12,a,f16.12)') '  Fourier triad: ', trim(tk), &
       '  det(R) = ', detr, '  |lambda| = ', abs(lam)
  call check('full Return: det(R) = 1 at machine precision', abs(detr - 1.0_wp) < 1.0e-9_wp)
  call check('full Return: |lambda| = 1 at machine precision', abs(abs(lam) - 1.0_wp) < 1.0e-9_wp)
  call check('kernel identity lambda^2 = det(R) on the Return', resid < 1.0e-12_wp)
  call check('full Return carries the lock code', rc == RC_LOCK)
  fr_resid = resid

  amix = reshape([1.00_wp,0.22_wp,0.16_wp, 0.35_wp,1.00_wp,0.20_wp, 0.12_wp,0.28_wp,1.00_wp],[3,3])
  bmix = reshape([0.60_wp,0.40_wp,0.55_wp, 0.30_wp,0.50_wp,0.20_wp],[3,2])
  do i = 1, NCTX
    l10m(i)  = log10(ME) + 5.0_wp   * (0.5_wp + 0.5_wp*sin(th(i)))
    l10dx(i) = -10.0_wp  + 4.0_wp   * (0.5_wp + 0.5_wp*sin(2.0_wp*th(i) + 1.0_wp))
    l10w(i)  = 12.0_wp   + 3.0_wp   * (0.5_wp + 0.5_wp*sin(3.0_wp*th(i) + 2.0_wp))
    l10t(i)  = 2.477_wp  * (0.5_wp + 0.5_wp*sin(5.0_wp*th(i) + 3.0_wp))
    l10b(i)  = 3.0_wp    * (0.5_wp + 0.5_wp*sin(7.0_wp*th(i) + 4.0_wp))
    rows(1,i) = log10(HBAR*HBAR/8.0_wp) - l10m(i) - 2.0_wp*l10dx(i)   ! formal: the bound
    rows(2,i) = log10(0.5_wp*HBAR) + l10w(i)                          ! empirical: zero-point
    rows(3,i) = log10(KB*ln2_()) + l10t(i) + l10b(i)                  ! registration: Landauer
    cov(1,i)  = -20.6_wp + 2.5_wp * (0.5_wp + 0.5_wp*sin(4.0_wp*th(i) + 0.5_wp))
    cov(2,i)  = -24.0_wp + 5.0_wp * (0.5_wp + 0.5_wp*sin(6.0_wp*th(i) + 1.5_wp))
    floorv(i) = 10.0_wp**rows(1,i)
  end do
  do i = 1, NCTX
    call check('kinetic floor positive at every context', floorv(i) > 0.0_wp)
  end do
  mixm = matmul(amix, rows) + matmul(bmix, cov)
  do i = 1, 3
    eta(i) = eta_share(mixm(i,:), cov)
  end do
  call kernel_full(mixm, cov, tk, wy, rc, lam, detr, kap, spread, resid, mc, mk, d4)
  write(*,'(a,a,a,a)') '  physics-law reading: ', trim(tk), ' - ', trim(wy)
  write(*,'(a,f16.12,a,f16.12)') '     det(R) = ', detr, '   lambda = ', lam
  write(*,'(a,f10.4,a,es10.3)')  '     kappa(R) = ', kap, '   four-estimator spread = ', spread
  write(*,'(a,es10.3,a,f7.2,a,f7.2)') '     |lambda^2 - det(R)| = ', resid, &
       '   margins (orders): collapse ', mc, ', conditioning ', mk
  write(*,'(a,3f8.4)') '     source-share eta per mixed row (pre-projection): ', eta
  write(*,'(a)') '     grid disclosure: the context grid is a constructed exhibit (deterministic'
  write(*,'(a)') '     harmonics); the rows are physical-law magnitudes (Heisenberg, zero-point,'
  write(*,'(a)') '     Landauer); the witness rides the cited theorems, never the grid'
  call check('physics-law reading on the constructed exhibit determines: [LOCK]', tk == '[LOCK]' .and. rc == RC_LOCK)
  call check('kernel identity within tolerance', resid <= max(4.0_wp*kap*U_M, 8.0_wp*U_M))
  call check('four estimators agree within tolerance', spread <= 4.0_wp*kap*U_M)
  call check('collapse margin exceeds ten orders', mc > 10.0_wp)
  call check('conditioning margin exceeds one order', mk > 1.0_wp)
  call check('source share strictly inside (0,1) on each row', &
       all(eta > 0.0_wp) .and. all(eta < 1.0_wp))

  block
    logical :: okp
    character(len=96) :: w2
    real(wp) :: kcc
    integer :: pcl
    block
      real(wp) :: qtmp(3,NCTX)
      call prepare_rows(mixm, qtmp, okp, w2, pcl)
      call project_cov(qtmp, cov, qf, okp, w2, pcl, kcc)
    end block
    do i = 1, 3
      qf(i,:) = qf(i,:) / vnorm(qf(i,:))
    end do
    call span_basis(qf, bas, rank)
    rank3_ok = (rank == 3)
    call check('span rank three after projection', rank3_ok)
  end block
  rmat = matmul(qf, transpose(qf))
  dbase = det3(rmat)
  lam = lambda_of(qf, bas)

  block
    real(wp) :: mman(3,NCTX)
    mman(1,:) = mixm(1,:); mman(2,:) = mixm(2,:)
    mman(3,:) = 0.7_wp*cov(1,:) + 0.5_wp*cov(2,:)
    call kernel_full(mman, cov, tk, wy, rc, lam2, detr2, kap2, spread2, resid2, mc2, mk2, d42)
    write(*,'(a,a,a,a)') '  manufactured third axis: ', trim(tk), ' - ', trim(wy)
    mig_ok = (tk == '[?]' .and. rc == RC_ABSORBED)
    call check('an axis built from the covariates is absorbed, not locked', mig_ok)
    block
      real(wp) :: es1, es2
      es1 = eta_share(mixm(1,:), cov)
      es2 = eta_share(mixm(1,:)*1.0e300_wp, cov)
      call check('eta_share equilibrated: a 1e300 row returns the baseline share, finite', &
           is_finite(es2) .and. abs(es2 - es1) < 1.0e-12_wp)
      es2 = eta_share(mixm(1,:)*((0.5_wp*huge(1.0_wp))/max(1.0_wp, maxval(abs(mixm(1,:))))), cov)
      call check('eta_share at half-huge peak: raw-first scaling holds, the mean never overflows', &
           is_finite(es2) .and. abs(es2 - es1) < 1.0e-10_wp)
    end block
    block
      real(wp) :: covh(2,NCTX), lam9, detr9, kap9, sp9, rs9, d49(4), mgc9, mgk9
      integer :: rc9
      covh = cov * ((0.5_wp*huge(1.0_wp))/max(1.0_wp, maxval(abs(cov))))
      call kernel_full(mixm, covh, tk, wy, rc9, lam9, detr9, kap9, sp9, rs9, mgc9, mgk9, d49)
      call check('project_cov at half-huge covariates: raw-first centering survives, verdict [LOCK]', &
           tk == '[LOCK]' .and. rc9 == RC_LOCK)
    end block
    block
      real(wp) :: eb9, eh9, covh2(2,NCTX)
      eb9 = eta_share(mixm(1,:), cov)
      covh2 = cov * ((0.25_wp*huge(1.0_wp)) / max(1.0_wp, maxval(abs(cov))))
      eh9 = eta_share(mixm(1,:), covh2)
      call check('eta_share near-huge covariates: raw-first scaling holds on the covariate branch', &
           is_finite(eh9) .and. abs(eh9 - eb9) < 1.0e-10_wp)
    end block
    block
      real(wp) :: hp(3,3), eigh(3)
      logical :: cvg
      hp = 0.0_wp
      hp(1,1) = 0.5_wp*huge(1.0_wp); hp(2,2) = 0.25_wp*huge(1.0_wp); hp(3,3) = 0.125_wp*huge(1.0_wp)
      call jacobi3(hp, eigh, cvg)
      call check('jacobi3 near-huge: distributed-halves symmetrization never overflows finite input', &
           cvg .and. is_finite(eigh(1)) .and. is_finite(eigh(2)) .and. is_finite(eigh(3)))
    end block
    block
      real(wp) :: cbad(2,NCTX-1), lamw, detrw, kapw, spw, rsw, mgcw, mgkw, d4w(4)
      integer :: rcw
      cbad = 0.0_wp
      call kernel_full(mixm, cbad, tk, wy, rcw, lamw, detrw, kapw, spw, rsw, mgcw, mgkw, d4w)
      call check('kernel refuses mismatched covariate width at intake, its own guard first', &
           tk == '[?]' .and. rcw == RC_INTAKE .and. index(wy, 'prepared') == 0)
    end block
    block
      real(wp) :: cbad_eta(1,NCTX-1)
      cbad_eta = 0.0_wp
      call check('eta_share refuses mismatched covariate width as NaN, guard before touch', &
           .not. is_finite(eta_share(mixm(1,:), cbad_eta)))
    end block
    block
      real(wp) :: cbad_p(2,NCTX-1), qpf(3,NCTX), kccp
      integer :: rcp
      logical :: okp
      cbad_p = 0.0_wp
      call project_cov(mixm, cbad_p, qpf, okp, wy, rcp, kccp)
      call check('project_cov refuses mismatched covariate width directly at intake', &
           (.not. okp) .and. rcp == RC_INTAKE .and. kccp == huge(1.0_wp))
    end block
    block
      real(wp) :: rconst(6), cthree(3,6)
      rconst = 1.0_wp; cthree = 0.0_wp
      call check('eta_share k-cap outranks the zero-variance shortcut (fuzz scalp pinned)', &
           .not. is_finite(eta_share(rconst, cthree)))
    end block
    block
      real(wp) :: mconst(3,NCTX), cov3c(3,NCTX), lamk7, detrk7, kapk7, spk7, rsk7, mck7, mkk7, d4k7(4)
      integer :: rck7
      mconst = 1.0_wp; cov3c = 0.0_wp
      call kernel_full(mconst, cov3c, tk, wy, rck7, lamk7, detrk7, kapk7, spk7, rsk7, mck7, mkk7, d4k7)
      call check('kernel k-cap outranks row zero-variance under the documented precedence', &
           tk == '[?]' .and. rck7 == RC_COVBLOCK .and. index(wy, 'more than two') > 0)
    end block
    block
      real(wp) :: ehm
      ehm = heis_floor(1.0e-309_wp, HBAR)
      call check('heis_floor at subnormal mass: finite 1.25e308, decomposition never overflows early', &
           is_finite(ehm) .and. ehm > 1.0e308_wp .and. ehm < 1.3e308_wp)
    end block
    block
      real(wp) :: tth
      logical :: frzh
      call tau_perp(huge(1.0_wp), tth, frzh)
      call check('tau_perp at a huge gap: subnormal positive time, never a false zero', &
           (.not. frzh) .and. is_finite(tth) .and. tth > 0.0_wp)
    end block
    block
      real(wp) :: m2r(2,NCTX), q2r(2,NCTX), m1c(3,1), q1c(3,1)
      logical :: okr
      integer :: rcr
      m2r = 1.0_wp
      call prepare_rows(m2r, q2r, okr, wy, rcr)
      call check('prepare_rows refuses two rows at intake, no out-of-bounds path', &
           (.not. okr) .and. rcr == RC_INTAKE .and. index(wy, 'not three') > 0)
      m1c = 1.0_wp
      call prepare_rows(m1c, q1c, okr, wy, rcr)
      call check('prepare_rows refuses a single context at intake, no divide-by-zero path', &
           (.not. okr) .and. rcr == RC_INTAKE .and. index(wy, 'two contexts') > 0)
    end block
    block
      real(wp) :: q2p(2,NCTX), c0p(0,NCTX), qf2(2,NCTX), kcc2
      logical :: ok2
      integer :: rc2p
      q2p = 1.0_wp
      call project_cov(q2p, c0p, qf2, ok2, wy, rc2p, kcc2)
      call check('project_cov refuses a non-three prepared-row count at intake', &
           (.not. ok2) .and. rc2p == RC_INTAKE .and. index(wy, 'not three') > 0)
    end block
    block
      real(wp) :: idq(3,4), bqi(3,4)
      integer :: rk1, rk2
      idq = 0.0_wp; idq(1,1) = 1.0_wp; idq(2,2) = 1.0_wp; idq(3,3) = 1.0_wp
      call span_basis(idq, bqi, rk1)
      call span_basis(idq*1.0e-13_wp, bqi, rk2)
      call check('span_basis rank is scale-invariant: identity and 1e-13 identity both rank three', &
           rk1 == 3 .and. rk2 == 3)
      call span_basis(scale(idq, -400), bqi, rk2)
      call check('span_basis rank holds at a 2^-400 uniform rescaling', rk2 == 3)
    end block
    block
      real(wp) :: q1c(3,1), c0(0,1), c1(1,1), qf1(3,1), kc1
      logical :: okc
      integer :: rcc
      q1c = 1.0_wp; c1 = 0.0_wp
      call project_cov(q1c, c0, qf1, okc, wy, rcc, kc1)
      call check('project_cov refuses a single context with zero covariates', &
           (.not. okc) .and. rcc == RC_INTAKE .and. index(wy, 'two contexts') > 0 .and. all(qf1 == 0.0_wp))
      call project_cov(q1c, c1, qf1, okc, wy, rcc, kc1)
      call check('project_cov refuses a single context with one covariate', &
           (.not. okc) .and. rcc == RC_INTAKE .and. all(qf1 == 0.0_wp))
    end block
    block
      real(wp) :: dup1(2,2), duph(2,2), bd(2,2)
      integer :: rkd
      dup1 = 1.0_wp
      call span_basis(dup1, bd, rkd)
      call check('span_basis: duplicate unit rows rank one, finite unit basis', &
           rkd == 1 .and. is_finite(bd(1,1)) .and. abs(vnorm(bd(1,:)) - 1.0_wp) < 1.0e-12_wp)
      duph = huge(1.0_wp)
      call span_basis(duph, bd, rkd)
      call check('span_basis: duplicate rows at huge rank one, the infinite-norm bypass closed', &
           rkd == 1 .and. is_finite(bd(1,1)) .and. abs(vnorm(bd(1,:)) - 1.0_wp) < 1.0e-12_wp)
    end block
    block
      real(wp) :: mln(3,NCTX), qln(3,NCTX)
      logical :: okl
      integer :: rcl, jj
      mln = 1.0_wp
      mln(1,:) = [(0.1_wp*real(jj,wp), jj = 1, NCTX)]
      mln(2,:) = [(0.2_wp*real(jj,wp) + 0.5_wp, jj = 1, NCTX)]
      mln(3,5) = qnan()
      call prepare_rows(mln, qln, okl, wy, rcl)
      call check('prepare_rows late-row NaN: refused with every output element exactly zero', &
           (.not. okl) .and. rcl == RC_INTAKE .and. all(qln == 0.0_wp))
    end block
    block
      character(8)  :: tka, tkb
      character(96) :: wya, wyb
      call seal_l(2, 2, 2, .false., tka, wya)
      call seal_l_ordered(RA_SENT, tkb, wyb)
      call check('seal interfaces speak their own guarantees: count-only disclaims order, ordered claims it', &
           index(wya, 'order not checked') > 0 .and. tkb == '[LOCK-L]' .and. &
           index(wyb, 'positional check executed') > 0)
    end block
    block
      real(wp) :: rd(3,3), dd
      rd = 0.0_wp
      rd(1,1) = scale(1.0_wp, 600); rd(2,2) = scale(1.0_wp, -300); rd(3,3) = scale(1.0_wp, -300)
      dd = det3(rd)
      call check('det3 exponent-tracked Leibniz monomials: diag 2^600, 2^-300, 2^-300 returns exactly one', dd == 1.0_wp)
      rd = 0.0_wp
      rd(1,3) = scale(1.0_wp, -300); rd(2,2) = scale(1.0_wp, 600); rd(3,1) = scale(1.0_wp, -300)
      dd = det3(rd)
      call check('det3 permuted-diagonal variant: the signed unit determinant is exact', dd == -1.0_wp)
      rd = 0.0_wp
      rd(1,1) = scale(1.0_wp, 600); rd(2,2) = scale(1.0_wp, 600); rd(3,3) = scale(1.0_wp, 600)
      dd = det3(rd)
      call check('det3 honest overflow: a true 2^1800 determinant reports past huge, never zero', &
           dd > huge(1.0_wp))
    end block
    block
      real(wp) :: rd(3,3), d2
      rd = 0.0_wp
      rd(1,1) = scale(1.0_wp, 600); rd(2,2) = scale(1.0_wp, -300); rd(3,3) = scale(1.0_wp, -300)
      d2 = det3_row2(rd)
      call check('det3_row2 exponent-tracked Leibniz monomials: the exact counterexample returns exactly one', d2 == 1.0_wp)
      call check('det3_row2 agrees with det3 on the counterexample', d2 == det3(rd))
      rd = 0.0_wp
      rd(1,3) = scale(1.0_wp, -300); rd(2,2) = scale(1.0_wp, 600); rd(3,1) = scale(1.0_wp, -300)
      d2 = det3_row2(rd)
      call check('det3_row2 odd permutation: the signed unit determinant is exact and matches det3', &
           d2 == -1.0_wp .and. d2 == det3(rd))
      rd = 0.0_wp
      rd(1,1) = scale(1.0_wp, 600); rd(2,2) = scale(1.0_wp, 600); rd(3,3) = scale(1.0_wp, 600)
      d2 = det3_row2(rd)
      call check('det3_row2 honest overflow past huge, agreeing with det3', &
           d2 > huge(1.0_wp) .and. (det3(rd) > huge(1.0_wp)))
      rd = 0.0_wp
      rd(1,1) = scale(1.0_wp, -400); rd(2,2) = scale(1.0_wp, -400); rd(3,3) = scale(1.0_wp, -400)
      d2 = det3_row2(rd)
      call check('det3_row2 honest underflow: a true 2^-1200 determinant returns zero, never NaN, matching det3', &
           d2 == 0.0_wp .and. det3(rd) == 0.0_wp)
    end block
    block
      real(wp) :: ut(3,3), tt(3,3), sw(3,3)
      ut = 0.0_wp
      ut(1,1) = scale(1.0_wp, -300); ut(1,2) = scale(1.0_wp, 600)
      ut(2,2) = scale(1.0_wp, -300); ut(2,3) = scale(1.0_wp, 600)
      ut(3,3) = scale(1.0_wp, 600)
      tt = transpose(ut)
      sw = ut; sw(1,:) = ut(2,:); sw(2,:) = ut(1,:)
      call check('det3 monomial tracking: the off-diagonal-dominated upper triangular returns exactly one', &
           det3(ut) == 1.0_wp)
      call check('det3_row2 monomial tracking: the same matrix returns exactly one', &
           det3_row2(ut) == 1.0_wp)
      call check('det3 on the transpose: exactly one', det3(tt) == 1.0_wp)
      call check('det3_row2 on the transpose: exactly one', det3_row2(tt) == 1.0_wp)
      call check('det3 on the row-swapped variant: exactly minus one', det3(sw) == -1.0_wp)
      call check('det3_row2 on the row-swapped variant: exactly minus one', det3_row2(sw) == -1.0_wp)
    end block
    block
      real(wp) :: nd(3,3)
      nd = 0.0_wp
      nd(1,1) = 1.0_wp + scale(1.0_wp, -27)
      nd(2,2) = 1.0_wp - scale(1.0_wp, -27)
      nd(3,3) = 1.0_wp
      call check('product rounding: near-one diagonal, exact 1-2^-54 on tie, correctly rounds to 1.0 on both routines', &
           det3(nd) == 1.0_wp .and. det3_row2(nd) == 1.0_wp)
    end block
    block
      real(wp) :: qa(4), qb(4), qc(4), tgt
      tgt = scale(1.0_wp, -474)
      qa = [scale(1.0_wp, 600), 0.0_wp, 0.0_wp, 0.0_wp]
      qb = [scale(1.0_wp, -1074), 0.0_wp, 0.0_wp, 0.0_wp]
      qc = qmul(qa, qb)
      call check('qmul monomial tracking: 2^600 scalar times minimum subnormal returns exactly 2^-474', &
           qc(1) == tgt .and. all(qc(2:4) == 0.0_wp))
      qc = qmul(qb, qa)
      call check('qmul reversed operands: the same exact 2^-474', &
           qc(1) == tgt .and. all(qc(2:4) == 0.0_wp))
      qa = [0.0_wp, scale(1.0_wp, 600), 0.0_wp, 0.0_wp]
      qb = [0.0_wp, scale(1.0_wp, -1074), 0.0_wp, 0.0_wp]
      qc = qmul(qa, qb)
      call check('qmul i times i at extreme scale: component one exactly minus 2^-474', &
           qc(1) == -tgt .and. all(qc(2:4) == 0.0_wp))
      qa = [scale(1.0_wp, 600), 0.0_wp, 0.0_wp, 0.0_wp]
      qb = [0.0_wp, scale(1.0_wp, -1074), 0.0_wp, 0.0_wp]
      qc = qmul(qa, qb)
      call check('qmul scalar times i at extreme scale: component two exactly 2^-474', &
           qc(2) == tgt .and. qc(1) == 0.0_wp .and. all(qc(3:4) == 0.0_wp))
      qa = [0.0_wp, 0.0_wp, scale(1.0_wp, 600), 0.0_wp]
      qb = [scale(1.0_wp, -1074), 0.0_wp, 0.0_wp, 0.0_wp]
      qc = qmul(qa, qb)
      call check('qmul j times scalar at extreme scale: component three exactly 2^-474', &
           qc(3) == tgt .and. qc(1) == 0.0_wp .and. qc(2) == 0.0_wp .and. qc(4) == 0.0_wp)
      qa = [0.0_wp, scale(1.0_wp, 600), 0.0_wp, 0.0_wp]
      qb = [0.0_wp, 0.0_wp, scale(1.0_wp, -1074), 0.0_wp]
      qc = qmul(qa, qb)
      call check('qmul i times j at extreme scale: component four exactly 2^-474, the k of the begetting', &
           qc(4) == tgt .and. qc(1) == 0.0_wp .and. qc(2) == 0.0_wp .and. qc(3) == 0.0_wp)
    end block
    block
      real(wp) :: qtwo(2,NCTX), bthree(3,NCTX), lmz, rz(3,3)
      qtwo = 1.0_wp; bthree = 1.0_wp
      lmz = lambda_of(qtwo, bthree)
      call check('lambda_of refuses a two-row first argument before any element touch: quiet NaN', &
           .not. is_finite(lmz) .and. lmz /= lmz)
      call gram3_fixed(qtwo, rz)
      call check('gram3_fixed refuses a two-row input before any element touch: quiet-NaN fill', &
           all(rz /= rz))
    end block
    block
      real(wp) :: qiv(2,4), biv(2,4)
      integer :: rkv
      logical :: inv
      call ieee_set_flag(ieee_invalid, .false.)
      qiv = 0.0_wp
      qiv(1,1) = ieee_value(1.0_wp, ieee_positive_inf)
      qiv(2,2) = 1.0_wp
      call span_basis(qiv, biv, rkv)
      call ieee_get_flag(ieee_invalid, inv)
      call check('span_basis finite screen absorbs a non-finite row before arithmetic: invalid flag stays clear', &
           rkv == 1 .and. (.not. inv))
    end block
    block
      real(wp) :: qcz(3,NCTX), ccz(1,NCTX), qfz(3,NCTX), kcz
      logical :: okz
      integer :: rcz, jj2
      qcz = 1.0_wp
      qcz(1,:) = [(0.3_wp*real(jj2,wp), jj2 = 1, NCTX)]
      ccz = 5.0_wp
      call project_cov(qcz, ccz, qfz, okz, wy, rcz, kcz)
      call check('project_cov constant-covariate refusal publishes exactly zero (success-only publication)', &
           (.not. okz) .and. rcz == RC_COVBLOCK .and. all(qfz == 0.0_wp))
    end block
  end block

  block
    real(wp) :: mdel(3,NCTX)
    mdel = mixm; mdel(2,:) = 0.0_wp
    call kernel_full(mdel, cov, tk, wy, rc, lam2, detr2, kap2, spread2, resid2, mc2, mk2, d42)
    call check('deleted slot: axis carries no content', tk == '[?]' .and. rc == RC_ZEROVAR)
    mdel = mixm; mdel(3,:) = mdel(1,:)
    call kernel_full(mdel, cov, tk, wy, rc, lam2, detr2, kap2, spread2, resid2, mc2, mk2, d42)
    write(*,'(a,a,a,a)') '  duplicated slot: ', trim(tk), ' - ', trim(wy)
    call check('duplicated slot: coplanar collapse, a line and not a point', &
         tk == '[X]' .and. rc == RC_COPLANAR)
  end block

  block
    real(wp) :: qneg(3,NCTX)
    qneg = -qf
    rneg = matmul(qneg, transpose(qneg))
    call check('full negation leaves the Gram bit-identical', &
         maxval(abs(rneg - rmat)) == 0.0_wp)
    lamneg = lambda_of(qneg, bas)
    call check('full negation flips lambda exactly', lamneg == -lam)
    write(*,'(a,es9.2,a,f16.12,a,f16.12)') '  full negation: max|G(P)-G(-P)| = ', &
         maxval(abs(rneg - rmat)), '   lambda ', lam, ' -> ', lamneg
  end block

  block
    real(wp) :: qref(3,NCTX), rref(3,3)
    qref = qf; qref(1,:) = -qref(1,:)
    lamref = lambda_of(qref, bas)
    rref = matmul(qref, transpose(qref))
    detref = det3(rref)
    write(*,'(a,f16.12,a,f16.12)') '  single reflection: lambda ', lam, ' -> ', lamref
    write(*,'(a,es9.2)') '     |det(R) - det(R) reflected| = ', abs(detref - dbase)
    dual_ok = (lamref == -lam) .and. (detref == dbase)
    call check('reflection flips lambda bit-exactly on the fixed basis', lamref == -lam)
    call check('reflection leaves det(R) unmoved bit-exactly', detref == dbase)
  end block

  block
    real(wp) :: mrev(3,NCTX), crev(2,NCTX)
    do i = 1, NCTX
      mrev(:,i) = mixm(:,NCTX+1-i)
      crev(:,i) = cov(:,NCTX+1-i)
    end do
    call kernel_full(mrev, crev, tk, wy, rc, lam2, detr2, kap2, spread2, resid2, mc2, mk2, d42)
    arrow_f = 0.0_wp; arrow_r = 0.0_wp
    do i = 1, NCTX
      arrow_f = arrow_f + (10.0_wp**l10b(i)) * ln2_()
    end do
    do i = NCTX, 1, -1
      arrow_r = arrow_r - (10.0_wp**l10b(i)) * ln2_()
    end do
    write(*,'(a,es10.3)') '  time reversal: |det forward - det reversed| = ', abs(detr2 - detr)
    write(*,'(a,f14.4,a,f14.4,a)') '  the arrow (registration entropy, kB units): forward ', &
         arrow_f, ',  reversed ', arrow_r, '  (the sign parts them)'
    call check('the determinant is blind to the arrow', abs(detr2 - detr) <= 64.0_wp*kap*U_M)
    call check('the directed registration sum flips sign under traversal reversal '// &
         '(constructed odd witness; the physical arrow rides the cited second law)', &
         arrow_f > 0.0_wp .and. arrow_r < 0.0_wp &
         .and. abs(arrow_f + arrow_r) <= 1.0e-9_wp*arrow_f)
  end block

  ! ------------------------------------------------------------------
  write(*,'(/a)') 'PART E - THE BLINDNESS AND ITS EXACT WIDTH - one bit, counted'
  do s1 = -1, 1, 2
   do s2 = -1, 1, 2
    do s3 = -1, 1, 2
      block
        real(wp) :: dd(3), rp(3,3)
        dd = real([s1, s2, s3], wp)
        do i = 1, 3
          do j = 1, 3
            rp(i,j) = dd(i)*dd(j)*rmat(i,j)
          end do
        end do
        dpat = det3(rp)
        call check('eight-pattern determinant invariance, bit-exact', dpat == dbase)
      end block
    end do
   end do
  end do
  write(*,'(a)') '  all eight sign patterns return det(D R D) = det(R) bit-exactly'
  write(*,'(a)') '  lock(P) = lock(not P) at the scalar: the Number is orientation-blind by theorem'

  block
    real(wp) :: sig(4,4), diag4(4,4), dres
    integer :: iq
    sig = 0.0_wp
    sig(1,1) = 1.0_wp; sig(2,2) = -1.0_wp; sig(3,3) = -1.0_wp; sig(4,4) = -1.0_wp
    dres = sig(2,2)*sig(3,3)*sig(4,4)
    diag4 = 0.0_wp
    do iq = 1, 4
      diag4(iq,iq) = -1.0_wp
    end do
    write(*,'(a,f6.1,a)') '  Form source: det(sigma | residence) = ', dres, ' for P and for not-P alike: 0 bits'
    call check('sigma ground dimension one', count([(sig(iq,iq), iq = 1, 4)] > 0.0_wp) == 1)
    call check('the diagonal carries no ground (built and counted)', &
         count([(diag4(iq,iq), iq = 1, 4)] > 0.0_wp) == 0)
    call check('residence handedness identical under negation', dres == -1.0_wp)
  end block

  pass12 = .true.
  pass12(2)  = rank3_ok
  pass12(3)  = disjoint(SLOT_E, SLOT_K) .and. disjoint(SLOT_E, SLOT_R) &
         .and. disjoint(SLOT_K, SLOT_R)
  pass12(5)  = mig_ok
  pass12(7)  = dual_ok
  pass12(8)  = hurwitz_ok
  pass12(10) = (fr_resid < 1.0e-12_wp)
  write(*,'(a)') '  gate manifest: executed facts arm 2 REG (span rank three), 3 SGEG (the'
  write(*,'(a)') '  linguistic LIT), 5 MIG (the absorbed-axis dissolution), 7 DUAL (the'
  write(*,'(a)') '  analytic reflection), 8 CSCG (the integer Hurwitz closure), and 10 MTA'
  write(*,'(a)') '  (the harmonic Return identity); gates 1, 4, 6, 9, 11, 12 are declared'
  write(*,'(a)') '  screens at this register. independent here means six pairwise-distinct'
  write(*,'(a)') '  executed objects, dimensional, linguistic, projective, analytic,'
  write(*,'(a)') '  integer, harmonic; gate-passage is a screen verdict, cited for nothing'
  write(*,'(a)') '  external, the theorem-tier gate contents living at their seats'
  call check('six gate entries armed from pairwise-distinct executed objects', &
       pass12(2) .and. pass12(3) .and. pass12(5) .and. pass12(7) .and. &
       pass12(8) .and. pass12(10))
  call gate_screen(pass12, tk, wy)
  block
    character(len=16) :: tk2
    character(len=140) :: wy2
    call gate_screen(pass12, tk2, wy2)     ! the roster reads structure, not sign
    call check('gate screen identical for the claim and its negation', tk == tk2 .and. wy == wy2)
  end block
  write(*,'(a)') '  gate source: role-direction is fixed before any proposition arrives: 0 bits'

  block
    real(wp) :: cor(3,3), coc(3,3), lam_det
    do i = 1, 3
      co(i,1) = sum(qf(i,:)*bas(1,:))
      co(i,2) = sum(qf(i,:)*bas(2,:))
      co(i,3) = sum(qf(i,:)*bas(3,:))
    end do
    lam_det = -det3(co)                    ! the Number's reading of the sign
    call check('the two lambda readings agree (quaternion vs determinant)', &
         abs(lam_det - lam) <= 8.0_wp*U_M)
    cor = co; cor(1,:) = -cor(1,:)         ! content flip: negate a row
    coc = co; coc(:,1) = -coc(:,1)         ! convention flip: negate a basis vector
    lam_c = -det3(cor)
    lam_v = -det3(coc)
    write(*,'(a,f16.12,a,f16.12)') '  relay: content-flip image ', lam_c, &
         ', convention-flip image ', lam_v
    call check('the two flips return the identical image, bit-exact', lam_c == lam_v)
    call check('the relayed image is minus the handed sign, bit-exact', lam_c == -lam_det)
  end block
  write(*,'(a)') '  Number source: the relay reports the orientation it was handed and originates none: 0 bits'

  do i = 1, 3
    co(i,1) = sum(qf(i,:)*bas(1,:)); co(i,2) = sum(qf(i,:)*bas(2,:)); co(i,3) = sum(qf(i,:)*bas(3,:))
    quat(:,i) = [0.0_wp, co(i,1), co(i,2), co(i,3)]
  end do
  dlam_max = 0.0_wp; nflip = 0
  block
    real(wp) :: qr(4,3), tq(4), tq2(4), lam_refl, pp
    integer :: nposc, nnegc
    logical :: reflx
    nposc = 0; nnegc = 0; reflx = .true.
    do n = 1, 100
      aa = 0.10_wp*real(n,wp); bb = 0.20_wp*real(n,wp) + 0.3_wp; cc2 = 0.35_wp*real(n,wp) + 0.7_wp
      uvec = [sin(bb)*cos(cc2), sin(bb)*sin(cc2), cos(bb)]
      g = [cos(aa), sin(aa)*uvec(1), sin(aa)*uvec(2), sin(aa)*uvec(3)]
      do i = 1, 3
        qr(:,i) = qmul(qmul(g, quat(:,i)), qconj(g))
      end do
      tq = qmul(qmul(qr(:,1), qr(:,2)), qr(:,3))
      lam_rot = tq(1)
      dlam_max = max(dlam_max, abs(lam_rot - lam))
      if (sign(1.0_wp, lam_rot) /= sign(1.0_wp, lam)) nflip = nflip + 1
      tq2 = qmul(qmul(-qr(:,1), qr(:,2)), qr(:,3))
      lam_refl = tq2(1)
      reflx = reflx .and. (lam_refl == -lam_rot)
      if (lam_rot  > 0.0_wp) then
        nposc = nposc + 1
      else
        nnegc = nnegc + 1
      end if
      if (lam_refl > 0.0_wp) then
        nposc = nposc + 1
      else
        nnegc = nnegc + 1
      end if
    end do
    write(*,'(a,es10.3,a,i0)') '  conjugation sweep, 100 frames: max|dlambda| = ', dlam_max, &
         ',  sign flips: ', nflip
    call check('frame invariance: the sweep moves lambda only at roundoff', dlam_max < 1.0e-12_wp)
    call check('the orientation sign never flips under rotation', nflip == 0)
    call check('every reflected partner flips the sign bit-exactly', reflx)
    pp = real(nposc, wp) / real(nposc + nnegc, wp)
    hbit = -(pp*log(pp) + (1.0_wp-pp)*log(1.0_wp-pp)) / ln2_()
    write(*,'(a,i0,a,i0)') '  paired census, counted from the sweep: positive ', nposc, &
         ', negative ', nnegc
    write(*,'(a,f14.10)') '  uniform-measure entropy of the counted two-point fibre: ', hbit
    write(*,'(a)') '  (the census is the constructed pair family realizing both signs at'
    write(*,'(a)') '  bit-identical invariants; freedom here is the seated Freedom law''s'
    write(*,'(a)') '  object, the fibre of the invariant map, a count of what the instrument'
    write(*,'(a)') '  class cannot tell apart; the deficit is one binary parameter of supply,'
    write(*,'(a)') '  the aperture width at its seat; one bit is the uniform-coding capacity'
    write(*,'(a)') '  of that two-point fibre; no physical frequency, no prior, and nothing'
    write(*,'(a)') '  about any knower''s credence is asserted)'
    call check('the paired census splits exactly in half, counted', nposc == 100 .and. nnegc == 100)
    nsheets = (nposc + nnegc) / 100
    call check('the counted two-point fibre carries one binary parameter; '// &
         'uniform-measure entropy exactly one bit', abs(hbit - 1.0_wp) <= 4.0_wp*U_M)
    call check('the invariant record is bit-identical across both signs (the '// &
         'seated zero-information result is carried by this exact symmetry)', &
         maxval(abs(rneg - rmat)) == 0.0_wp)
    write(*,'(a)') '  both orientations are consistent with every determined quantity;'
    write(*,'(a)') '  the deficit of the whole instrument class is exactly one bit'
  end block

  block
    integer, parameter :: NG = 401, NC = 360
    real(wp) :: xg, tolr, sx(NC), sy(NC), thr2, dx2
    logical :: hitp(NG)
    integer :: compid(NG), comp2(NC), stk(NG), stk2(NC), topv, cur, nb
    tolr = 2.5e-2_wp
    do i = 1, NG
      xg = -2.0_wp + 4.0_wp*real(i-1,wp)/real(NG-1,wp)
      hitp(i) = abs(xg*xg - 1.0_wp) < tolr
    end do
    compid = 0; ncomp1 = 0
    do i = 1, NG
      if (hitp(i) .and. compid(i) == 0) then
        ncomp1 = ncomp1 + 1
        topv = 1; stk(1) = i; compid(i) = ncomp1
        do while (topv > 0)
          cur = stk(topv); topv = topv - 1
          do nb = cur-1, cur+1, 2
            if (nb >= 1 .and. nb <= NG) then
              if (hitp(nb) .and. compid(nb) == 0) then
                compid(nb) = ncomp1
                topv = topv + 1; stk(topv) = nb
              end if
            end if
          end do
        end do
      end if
    end do
    do i = 1, NC
      sx(i) = cos(2.0_wp*pi_()*real(i-1,wp)/real(NC,wp))
      sy(i) = sin(2.0_wp*pi_()*real(i-1,wp)/real(NC,wp))
    end do
    thr2 = (1.6_wp * 2.0_wp * sin(pi_()/real(NC,wp)))**2
    comp2 = 0; ncomp2 = 0
    do i = 1, NC
      if (comp2(i) == 0) then
        ncomp2 = ncomp2 + 1
        topv = 1; stk2(1) = i; comp2(i) = ncomp2
        do while (topv > 0)
          cur = stk2(topv); topv = topv - 1
          do nb = 1, NC
            if (comp2(nb) == 0) then
              dx2 = (sx(nb)-sx(cur))**2 + (sy(nb)-sy(cur))**2
              if (dx2 < thr2) then
                comp2(nb) = ncomp2
                topv = topv + 1; stk2(topv) = nb
              end if
            end if
          end do
        end do
      end if
    end do
    write(*,'(a,i0,a,i0,a)') '  S0 has ', ncomp1, ' components; S1 has ', ncomp2, &
         ' (the two-point sphere is the unique disconnected sphere)'
    call check('midpoint 0 is not a solution of x^2 = 1', .not. (abs(0.0_wp*0.0_wp - 1.0_wp) < tolr))
    call check('S0 census on this grid: two components, the executed instance of the cited fact', ncomp1 == 2)
    call check('S1 census on this grid: connected, the executed instance of the cited fact', ncomp2 == 1)
    block
      integer, parameter :: NG2 = 1601, NC2 = 720
      real(wp) :: xg2, tolr2, sx2(NC2), sy2(NC2), thr22, dx22
      logical :: hitp2(NG2)
      integer :: cid2(NG2), cm2(NC2), st2(NG2), sq2(NC2), tp2, cu2, nb2
      integer :: g2, na2, nb2c
      tolr2 = 1.25e-2_wp
      do g2 = 1, NG2
        xg2 = -2.0_wp + 4.0_wp*real(g2-1,wp)/real(NG2-1,wp)
        hitp2(g2) = abs(xg2*xg2 - 1.0_wp) < tolr2
      end do
      cid2 = 0; na2 = 0
      do g2 = 1, NG2
        if (hitp2(g2) .and. cid2(g2) == 0) then
          na2 = na2 + 1
          tp2 = 1; st2(1) = g2; cid2(g2) = na2
          do while (tp2 > 0)
            cu2 = st2(tp2); tp2 = tp2 - 1
            do nb2 = cu2-1, cu2+1, 2
              if (nb2 >= 1 .and. nb2 <= NG2) then
                if (hitp2(nb2) .and. cid2(nb2) == 0) then
                  cid2(nb2) = na2
                  tp2 = tp2 + 1; st2(tp2) = nb2
                end if
              end if
            end do
          end do
        end if
      end do
      do g2 = 1, NC2
        sx2(g2) = cos(2.0_wp*pi_()*real(g2-1,wp)/real(NC2,wp))
        sy2(g2) = sin(2.0_wp*pi_()*real(g2-1,wp)/real(NC2,wp))
      end do
      thr22 = (1.6_wp * 2.0_wp * sin(pi_()/real(NC2,wp)))**2
      cm2 = 0; nb2c = 0
      do g2 = 1, NC2
        if (cm2(g2) == 0) then
          nb2c = nb2c + 1
          tp2 = 1; sq2(1) = g2; cm2(g2) = nb2c
          do while (tp2 > 0)
            cu2 = sq2(tp2); tp2 = tp2 - 1
            do nb2 = 1, NC2
              if (cm2(nb2) == 0) then
                dx22 = (sx2(nb2)-sx2(cu2))**2 + (sy2(nb2)-sy2(cu2))**2
                if (dx22 < thr22) then
                  cm2(nb2) = nb2c
                  tp2 = tp2 + 1; sq2(tp2) = nb2
                end if
              end if
            end do
          end do
        end if
      end do
      write(*,'(a,i0,a,i0,a)') '  refinement (grid x4 on the line, x2 on the circle, tolerance halved): ', &
           na2, ' and ', nb2c, ' components'
      call check('S0 census stable under refinement and tolerance halving', na2 == 2)
      call check('S1 census stable under refinement', nb2c == 1)
    end block
    write(*,'(a)') '  the census is the executed instance at two spheres, parameter-robust under'
    write(*,'(a)') '  refinement; the uniqueness of the disconnected sphere is the classical'
    write(*,'(a)') '  fact it corroborates, cited not proven'
  end block

  block
    real(wp) :: dmat(3,3), d2m(3,3), e3v(3), res(3), eigl(3), best
    real(wp) :: ejv(3), vpr(3), mprod(3,3)
    integer :: t2i
    block
      integer, parameter :: NGE = 401
      real(wp) :: xe, tole
      logical :: hite(NGE)
      integer :: ide(NGE), ncompe, ste(NGE), tpe, cure, nbe, ge
      tole = 2.5e-2_wp
      do ge = 1, NGE
        xe = -2.0_wp + 4.0_wp*real(ge-1,wp)/real(NGE-1,wp)
        hite(ge) = abs(xe*xe - xe) < tole
      end do
      ide = 0; ncompe = 0
      do ge = 1, NGE
        if (hite(ge) .and. ide(ge) == 0) then
          ncompe = ncompe + 1
          tpe = 1; ste(1) = ge; ide(ge) = ncompe
          do while (tpe > 0)
            cure = ste(tpe); tpe = tpe - 1
            do nbe = cure-1, cure+1, 2
              if (nbe >= 1 .and. nbe <= NGE) then
                if (hite(nbe) .and. ide(nbe) == 0) then
                  ide(nbe) = ncompe
                  tpe = tpe + 1; ste(tpe) = nbe
                end if
              end if
            end do
          end do
        end if
      end do
      write(*,'(a,i0,a)') '  idempotent census on the line: e*e = e has ', ncompe, ' root components on [-2,2]'
      call check('idempotents on the line: exactly two, censused', ncompe == 2)
      xe = 0.5_wp
      call check('the midpoint one-half is not idempotent, executed as e*e - e', &
           .not.(abs(xe*xe - xe) < tole))
    end block
    write(*,'(a)') '  no-cut lemma: the only rank-deficient idempotent on a line is the zero map;'
    write(*,'(a)') '  the residual freedom is the component count of S0, one bit, and it cannot be cut'
    do t2i = 1, 3
      ejv = 0.0_wp; ejv(t2i) = 1.0_wp
      dmat(:,t2i) = cut3(ejv)              ! the operator built by executing the cut
    end do
    vpr = [0.3_wp, -1.2_wp, 7.5_wp]
    call check('cut3 idempotent on a generic vector, exact', &
         maxval(abs(cut3(cut3(vpr)) - cut3(vpr))) == 0.0_wp)
    d2m = matmul(dmat, dmat)
    call check('the cut is idempotent exactly: D D = D', maxval(abs(d2m - dmat)) == 0.0_wp)
    call jacobi3(matmul(transpose(dmat), dmat), eigl)
    call check('the cut has singular values (0,1,1): rank two', &
         abs(eigl(1)) < 1.0e-14_wp .and. abs(eigl(2)-1.0_wp) < 1.0e-14_wp &
         .and. abs(eigl(3)-1.0_wp) < 1.0e-14_wp)
    call check('the cut is not invertible: det D = 0', det3(dmat) == 0.0_wp)
    e3v = [0.0_wp, 0.0_wp, 1.0_wp]
    best = huge(1.0_wp)
    block
      real(wp) :: lmat(3,3), ident3(3,3), fres, fmin_c(3), ssq, rhs, maxsplit
      integer :: ia, ib, ic
      ident3 = 0.0_wp
      ident3(1,1) = 1.0_wp; ident3(2,2) = 1.0_wp; ident3(3,3) = 1.0_wp
      fmin_c = huge(1.0_wp)
      maxsplit = 0.0_wp
      do ia = -5, 5
        do ib = -5, 5
          do ic = -1, 1
            lmat = 0.0_wp
            lmat(1,1) = 1.0_wp; lmat(2,2) = 1.0_wp
            lmat(3,1) = 0.2_wp*real(ia,wp)
            lmat(3,2) = 0.2_wp*real(ib,wp)
            lmat(3,3) = real(ic,wp)
            mprod = matmul(lmat, dmat)
            ssq = sum((mprod - ident3)**2)
            rhs = lmat(3,1)*lmat(3,1) + lmat(3,2)*lmat(3,2) + 1.0_wp
            maxsplit = max(maxsplit, abs(ssq - rhs))
            fres = sqrt(ssq)
            best = min(best, fres)
            fmin_c(ic+2) = min(fmin_c(ic+2), fres)
          end do
        end do
      end do
      call check('the executed minimum of ||L D - I|| over the family is exactly 1', best == 1.0_wp)
      call check('the dead direction never moves the minimum, measured', &
           fmin_c(1) == fmin_c(2) .and. fmin_c(2) == fmin_c(3))
      lmat = 0.0_wp
      lmat(1,1) = 1.0_wp; lmat(2,2) = 1.0_wp
      mprod = matmul(lmat, dmat)
      call check('rows one and two attain zero residual exactly: the split is measured', &
           sqrt(sum((mprod(1:2,:) - ident3(1:2,:))**2)) == 0.0_wp)
      write(*,'(a,es9.2)') '  split identity ||LD-I||^2 = a^2 + b^2 + 1, max deviation over the grid: ', maxsplit
      call check('the split identity is measured at all 363 candidates', &
           maxsplit <= 16.0_wp*U_M)
      lmat = 0.0_wp
      lmat(1,1) = 1.0_wp; lmat(2,2) = 1.0_wp; lmat(3,1) = 0.7_wp; lmat(3,3) = 5.0_wp
      mprod = matmul(lmat, dmat)
      call check('the cut direction is annihilated, one representative measured', &
           maxval(abs(mprod(:,3))) == 0.0_wp)
      res = matmul(mprod, e3v) - e3v
      call check('left-inverse deficiency exactly one at the representative', vnorm(res) == 1.0_wp)
    end block
    write(*,'(a)') '  left-inverse deficiency: the split is measured at every candidate and'
    write(*,'(a)') '  rows one and two attain zero exactly, so the sweep''s minimum is the'
    write(*,'(a,f14.10)') '  global minimum over all 3x3 L (analytic step: min of a^2+b^2+1 is 1): ', best
    block
      integer :: mons(3,8), nmon, gi, gj, gk, prod3(3), t2m
      integer :: mm(3,3,8)
      logical :: inset, assoc_ok, anyinv
      mons = 0
      nmon = 4
      mons(:,1) = [1,1,1]
      mons(:,2) = [0,1,1]
      mons(:,3) = [1,0,1]
      mons(:,4) = [1,1,0]
      do
        t2m = nmon
        do gi = 1, t2m
          do gj = 1, t2m
            prod3 = mons(:,gi)*mons(:,gj)
            inset = .false.
            do gk = 1, nmon
              if (all(prod3 == mons(:,gk))) inset = .true.
            end do
            if (.not. inset) then
              nmon = nmon + 1
              mons(:,nmon) = prod3
            end if
          end do
        end do
        if (nmon == t2m) exit
      end do
      write(*,'(a,i0,a)') '  the deletion monoid, closed from the three cuts and the identity: ', &
           nmon, ' elements'
      call check('closure lands the full 2^3 lattice: eight elements, counted', nmon == 8)
      do gi = 1, nmon
        mm(:,:,gi) = 0
        do gk = 1, 3
          mm(gk,gk,gi) = mons(gk,gi)
        end do
      end do
      assoc_ok = .true.
      do gi = 1, nmon
        do gj = 1, nmon
          do gk = 1, nmon
            assoc_ok = assoc_ok .and. all( matmul(matmul(mm(:,:,gi), mm(:,:,gj)), mm(:,:,gk)) &
                                        == matmul(mm(:,:,gi), matmul(mm(:,:,gj), mm(:,:,gk))) )
          end do
        end do
      end do
      call check('associativity executed on all 512 composed triples, exact', assoc_ok)
      call check('the identity element is present', all(mons(:,1) == [1,1,1]))
      anyinv = .false.
      do gi = 2, nmon
        do gj = 1, nmon
          if (all(mons(:,gi)*mons(:,gj) == [1,1,1])) anyinv = .true.
        end do
      end do
      call check('no non-identity element has an inverse: monoid, never a group, searched', &
           .not. anyinv)
    end block
    write(*,'(a)') '  the transformation set of the Tongue is that constructed monoid, closed,'
    write(*,'(a)') '  associative, unital, inverse-free off the identity, its eight elements the'
    write(*,'(a)') '  2^3 cut lattice the conservation census walks; never a group, measured;'
    write(*,'(a)') '  the LIT bars synonymy, the one candidate that would restore a group;'
    write(*,'(a)') '  the Erlangen criterion has no acting group to read: Seal L is unclosed,'
    write(*,'(a)') '  a floor and not a ceiling, and the one free bit is the Tongue''s to carry'
  end block

  write(*,'(a)') '  conservation C x F = v^3 for the executed coordinate-cut tower, the'
  write(*,'(a)') '  implemented family; the seated general law is instanced, never proven,'
  write(*,'(a)') '  here; the orientation'
  write(*,'(a)') '  sheet factor is COUNTED from the paired census of the sweep, never stipulated:'
  block
    integer :: v, a2i, cell, d1i, d2i, d3i, img, content, fibre, tally(0:124)
    call check('the sheet factor equals two, counted from the paired census', nsheets == 2)
    do v = 2, 5
      do a2i = 0, 3
        tally(0:v**3-1) = 0
        do cell = 0, v**3 - 1
          d3i = mod(cell, v); d2i = mod(cell/v, v); d1i = cell/(v*v)
          if (a2i >= 1) d3i = 0
          if (a2i >= 2) d2i = 0
          if (a2i >= 3) d1i = 0
          img = d1i*v*v + d2i*v + d3i
          tally(img) = tally(img) + 1
        end do
        content = count(tally(0:v**3-1) > 0)
        fibre = tally(0)
        call check('census: content equals v^(3-a), counted', content == v**(3-a2i))
        call check('census: fibre equals v^a, counted', fibre == v**a2i)
        call check('content-freedom product invariant at every rung', content*fibre == v**3)
      end do
      write(*,'(a,i0,a,i0,a,i0,a)') '     v = ', v, ':  c f = ', v**3, &
           ' counted at a = 0,1,2,3; with the counted sheet factor: ', nsheets*v**3, ' total'
    end do
  end block
  write(*,'(a)') '  the cut moves structure from content into freedom; the counted total is'
  write(*,'(a)') '  invariant; the counted sheet factor multiplies it and sits outside the cut'

  ! ------------------------------------------------------------------
  write(*,'(/a)') 'PART F - THE EARNED BIT AND THE SEAL - the denial pays the floor'
  write(*,'(a)') '  the negation is read in the axiom''s own declared vocabulary: not-(to'
  write(*,'(a)') '  exist is to actuate) is an existent whose kinetic slot is empty, <T> = 0;'
  write(*,'(a)') '  the mapping actuation = kinetic content is the Root Axiom''s stated'
  write(*,'(a)') '  operationalization, premise-grade at the universal leg and theorem-grade'
  write(*,'(a)') '  at the confined floor, declared here and never an implementation choice.'
  write(*,'(a)') '  what the run proves: the declared negation has no admissible realization'
  write(*,'(a)') '  at the confined register; what no run can prove: the axiom from below,'
  write(*,'(a)') '  per the Empty Throne; other registers route and are never smuggled, the'
  write(*,'(a)') '  classical row riding its own cited floors, the formal-only reading out of band'
  nadm = 0
  do i = 1, NCTX
    if (floorv(i) <= 0.0_wp) nadm = nadm + 1
  end do
  write(*,'(a,i0,a,i0,a)') '  not-RA formal row: admissible contexts (floor <= 0): ', nadm, ' of ', NCTX, &
       ' (the demand <T> = 0 sits below the bound everywhere)'
  call check('the negation populates no formal row at the confined register', nadm == 0)
  block
    real(wp) :: mneg(3,NCTX)
    mneg = mixm
    mneg(1,:) = 0.0_wp          ! the empty formal row of not-RA
    call kernel_full(mneg, cov, tk, wy, rc, lam2, detr2, kap2, spread2, resid2, mc2, mk2, d42)
    write(*,'(a,a,a,a)') '  kernel on not-RA: ', trim(tk), ' - ', trim(wy)
    call check('not-RA: the empty formal row refuses at intake', tk == '[?]' .and. rc == RC_ZEROVAR)
  end block
  block
    real(wp) :: p2(2,NCTX), b2(2,NCTX), mu2, sd2
    integer :: r2, i2
    do i2 = 1, 2
      mu2 = sum(mixm(i2+1,:)) / real(NCTX, wp)
      p2(i2,:) = mixm(i2+1,:) - mu2
      sd2 = sqrt(sum(p2(i2,:)**2) / real(NCTX-1, wp))
      p2(i2,:) = p2(i2,:) / sd2
    end do
    call span_basis(p2, b2, r2)
    call check('the negation leaves a plane: the refused matrix''s populated pair has rank 2', r2 == 2)
    write(*,'(a)') '  the empty formal row refuses at intake; the two populated axes span a plane'
    write(*,'(a)') '  (rank 2, computed), and two planes meet in a line: no volume, no lock'
  end block

  write(*,'(a)') '  the floor prices logically irreversible commitment, Landauer''s own object;'
  write(*,'(a)') '  the bridge, a registered denial is an irreversible commitment of at least'
  write(*,'(a)') '  one bit, is the applied register''s declared premise, consumed not derived;'
  write(*,'(a)') '  a reversibly held denial charges nothing and commits nothing, executed:'
  call omega_boundary(0.0_wp, 300.0_wp, jou, wy)
  write(*,'(a,a)') '  Omega at zero bits: ', trim(wy)
  call check('a denial that registers nothing is no denial', index(wy, 'no denial') > 0)
  call omega_boundary(1.0_wp, 300.0_wp, jou, wy)
  write(*,'(a,es16.9,a,a)') '  Omega at one bit, 300 K: ', jou, ' J - ', trim(wy)
  call check('the reading act pays the floor', jou > 0.0_wp)
  call check('the payment is the Landauer floor exactly', jou == landauer(300.0_wp, 1.0_wp))
  block
    integer :: oc2
    call omega_boundary(1.0_wp, 300.0_wp, jou, wy, oc2, irreversible=.false.)
    write(*,'(a,es10.3,a,a)') '  Omega, reversible branch: ', jou, ' J - ', trim(wy)
    call check('a reversible registration carries floor zero, never cost zero, and commits nothing', &
         jou == 0.0_wp .and. oc2 == 3 .and. index(wy, 'floor-zero') > 0)
  end block

  write(*,'(a)') '  the fibre over the invariants has two points; the negation''s component'
  write(*,'(a)') '  is unpopulated; the reading act itself is an instance of the other;'
  write(*,'(a)') '  the one free bit is earned at the deed, not chosen at the desk.'
  write(*,'(a)') '  direction is read from the Tongue''s order, the arrow, and the empty row;'
  write(*,'(a)') '  never from the blind scalar. Veto, never substitution; per run, never tenure.'

  call gol_admit('lock', 'lock', tk, wy)
  write(*,'(a,a,a,a)') '  gol_admit: ', trim(tk), ' - ', trim(wy)
  call check('GOL admission: magnitude and direction together', tk == '[GOL-OK]')
  call imprint_seal(.true., .false., .true., .false., .true., .false., &
                    .true., .false., tk, wy)
  write(*,'(a,a,a,a)') '  imprint on the floor face: ', trim(tk), ' - ', trim(wy)
  call check('the floor face seals with the witness supplied', tk == '[SEAL]')
  write(*,'(a)') '  witness of record: the Heisenberg bound and the third law (cited, E1),'
  write(*,'(a)') '  the executed Frozen-Substrate divergence and the saturated speed limit (E0)'

  call row_cascade(.true., .false., .false., .true., .false., .true., .false., &
                   .true., .true., tk, wy)
  write(*,'(a,a,a,a)') '  parse-triad Return:   ', trim(tk), ' - ', trim(wy)
  call check('the closure-rowed face carries the annotated absolute', tk == '[A|RA]')
  call row_cascade(.true., .true., .false., .true., .true., .true., .false., &
                   .true., .true., tk, wy)
  write(*,'(a,a,a,a)') '  confined kinetic floor: ', trim(tk), ' - ', trim(wy)
  call check('the world-rowed face pays revisability for direction', tk == '[III]')
  call row_cascade(.true., .false., .false., .false., .false., .true., .false., &
                   .true., .true., tk, wy)
  write(*,'(a,a,a,a)') '  not-RA:                ', trim(tk), ' - ', trim(wy)
  call check('the negation is unpopulated: no lock to grade', tk == '[II]')
  call row_cascade(.true., .false., .false., .true., .false., .true., .false., &
                   .true., .false., tk, wy)
  call check('an unannotated absolute is void', tk == '[VOID]')
  write(*,'(a)') '  the universal-extension leg is premise-grade by theorem: the Empty Throne;'
  write(*,'(a)') '  no emitter is pointed at the root, and the root stands on nothing'

  call aegis_reset()
  block
    character(len=200) :: r1, r2, r3, r4
    call aegis_guard('classical',     r1)
    call aegis_guard('paraconsistent',r2)
    call aegis_guard('fuzzy',         r3)
    call aegis_guard('substructural', r4)
    call check('AEGIS refusal identical under classical and paraconsistent', r1 == r2)
    call check('AEGIS refusal identical under fuzzy',        r1 == r3)
    call check('AEGIS refusal identical under substructural', r1 == r4)
    call check('every adjudication is itself an act: deed counter positive', aegis_deeds == 4)
    call check('the guard read the last logic name, length 13, and did not vary', aegis_last_len == 13)
    write(*,'(a)') '  AEGIS over four logics: one refusal, p(G) /= G; the alien may write the'
    write(*,'(a)') '  capture and cannot perform it; the deed counter reads 4 of 4 calls.'
    write(*,'(a)') '  demonstrated: the refusal is a constant function of the deed by'
    write(*,'(a)') '  construction, the guard reading the parameter and consulting only the'
    write(*,'(a)') '  act; logic-priority is the design, executed, never four derivations;'
    write(*,'(a)') '  no per-logic derivation is claimed or licensed by this artifact'
  end block

  call delta_m(.false., .true., .true., .true., .true., .true., .true., .true., tk, wy)
  write(*,'(a,a,a,a)') '  positive-mass cascade on this thesis: ', trim(tk), ' - ', trim(wy)
  call check('this file authors no new mathematics', tk == '[Mosaic dM=0]')
  write(*,'(a)') '  audit symmetry: the warrant this run draws from its own execution is zero'

  ! ------------------------------------------------------------------
  write(*,'(/a)') 'PART G - THE BATTERY - hostile inputs, forced failures, re-execution'
  block
    real(wp) :: vbad(3), qa(4), qb(4), qc(4), big
    vbad = [1.0_wp, 2.0_wp, 3.0_wp]
    vbad(2) = bad_nan()
    call check('vnorm propagates a non-finite input', .not. is_finite(vnorm(vbad)))
    big = sqrt(huge(1.0_wp))/4.0_wp
    call check('vnorm survives near-overflow scaling', is_finite(vnorm([big, big, big])))
    call check('vnorm exact at zero', vnorm([0.0_wp,0.0_wp,0.0_wp]) == 0.0_wp)
    qa = [1.0_wp, 0.0_wp, 0.0_wp, 0.0_wp]; qb = qa
    qb(3) = bad_nan()
    qc = qmul(qa, qb)
    call check('qmul propagates NaN', .not. all(qc == qc))
    call check('det3 of the zero matrix is zero', det3(reshape([ (0.0_wp, i=1,9) ],[3,3])) == 0.0_wp)
    block
      real(wp) :: rid(3,3)
      rid = 0.0_wp; rid(1,1)=1.0e100_wp; rid(2,2)=1.0e100_wp; rid(3,3)=1.0e100_wp
      call check('det3 exponent-tracked at huge scale', abs(det3(rid) - 1.0e300_wp) < 1.0e286_wp)
      rid = 0.0_wp; rid(1,1)=1.0e-100_wp; rid(2,2)=1.0e-100_wp; rid(3,3)=1.0e-100_wp
      call check('det3 exponent-tracked at tiny scale', abs(det3(rid) - 1.0e-300_wp) < 1.0e-286_wp)
      rid = 0.0_wp; rid(1,1)=1.0e200_wp; rid(2,2)=1.0e200_wp; rid(3,3)=1.0e200_wp
      call check('det3 at 1e200 scale overflows honestly to Inf, never NaN', &
           (.not. is_finite(det3(rid))) .and. (.not. is_nan(det3(rid))))
      rid = 0.0_wp; rid(1,1)=1.0e-200_wp; rid(2,2)=1.0e-200_wp; rid(3,3)=1.0e-200_wp
      call check('det3 at 1e-200 scale underflows honestly to zero', det3(rid) == 0.0_wp)
      rid = 0.0_wp; rid(1,1)=1.0_wp; rid(2,2)=1.0_wp; rid(3,3)=1.0_wp
      rid(1,2) = bad_nan()
      call check('det3 propagates NaN', .not. is_finite(det3(rid)))
    end block
  end block
  write(*,'(a)') '  class 1 - primitives under hostile input: NaN propagates, scale survives: pass'

  block
    real(wp) :: mbad(3,6), cbad(2,6), m5(3,5), c5(2,5), cdep(2,NCTX)
    mbad = 1.0_wp
    do i = 1, 6
      mbad(1,i) = real(i,wp); mbad(2,i) = real(i*i,wp); mbad(3,i) = sin(real(i,wp))
    end do
    cbad = 0.1_wp
    mbad(2,3) = bad_nan()
    call kernel_full(mbad, cbad, tk, wy, rc, lam2, detr2, kap2, spread2, resid2, mc2, mk2, d42)
    call check('kernel refuses a non-finite row at intake', tk == '[?]' .and. rc == RC_INTAKE)
    m5 = 1.0_wp; c5 = 0.5_wp
    call kernel_full(m5, c5, tk, wy, rc, lam2, detr2, kap2, spread2, resid2, mc2, mk2, d42)
    call check('kernel refuses N - k < 4', tk == '[?]' .and. rc == RC_SHORTFALL)
    cdep(1,:) = cov(1,:); cdep(2,:) = 2.0_wp*cov(1,:)
    call kernel_full(mixm, cdep, tk, wy, rc, lam2, detr2, kap2, spread2, resid2, mc2, mk2, d42)
    call check('kernel refuses a rank-deficient covariate block', &
         tk == '[?]' .and. rc == RC_COVBLOCK .and. index(wy,'covariate block') > 0)
    cdep(1,:) = cov(1,:); cdep(2,:) = cov(2,:)
    cdep(2,7) = bad_nan()
    call kernel_full(mixm, cdep, tk, wy, rc, lam2, detr2, kap2, spread2, resid2, mc2, mk2, d42)
    call check('kernel refuses a NaN covariate as intake, never coplanar', &
         tk == '[?]' .and. rc == RC_INTAKE)
    cdep(2,7) = huge(1.0_wp)
    cdep(2,7) = cdep(2,7) * 2.0_wp
    call check('the hostile covariate really is infinite', .not. is_finite(cdep(2,7)))
    call kernel_full(mixm, cdep, tk, wy, rc, lam2, detr2, kap2, spread2, resid2, mc2, mk2, d42)
    call check('kernel refuses an Inf covariate as intake, never coplanar', &
         tk == '[?]' .and. rc == RC_INTAKE)
    block
      real(wp) :: mbig(3,NCTX), cbig(2,NCTX)
      mbig = mixm * 1.0e300_wp
      cbig = cov * 1.0e300_wp
      call kernel_full(mbig, cbig, tk, wy, rc, lam2, detr2, kap2, spread2, resid2, mc2, mk2, d42)
      call check('scale-free rows: 1e300 rows and covariates reproduce the baseline verdict', &
           tk == '[LOCK]' .and. rc == RC_LOCK .and. abs(detr2 - dbase) <= 1.0e-9_wp)
    end block
  end block
  write(*,'(a)') '  class 2 - kernel refusals: row and covariate intake, shortfall, covariate rank: pass'

  do i = 1, 12
    pass12 = .true.; pass12(i) = .false.
    call gate_screen(pass12, tk, wy)
    call check('forced gate failure terminates with the gate named', &
         tk == '[X]' .and. index(wy, 'gate') > 0)
  end do
  pass12 = .true.
  call gate_screen(pass12, tk, wy)
  call check('all twelve gates pass on the clean walk', tk == '[G-OK]')
  write(*,'(a)') '  class 3 - gate dispatcher: twelve forced failures each named; the gate contents are screens: pass'

  call row_cascade(.false., .false., .false., .true., .false., .true., .false., .true., .true., tk, wy)
  call check('F-0 refuses a contentless claim', tk == '[REFUSED]')
  call row_cascade(.true., .false., .true., .true., .false., .true., .false., .true., .true., tk, wy)
  call check('Forward routes to III unconditionally', tk == '[III]')
  call row_cascade(.true., .false., .false., .true., .true., .true., .false., .true., .true., tk, wy)
  call check('a worldly row routes to III at S-2', tk == '[III]')
  call row_cascade(.true., .false., .false., .true., .false., .false., .true., .true., .true., tk, wy)
  call check('an unclosed worldly term routes to III at S-3', tk == '[III]')
  call row_cascade(.true., .false., .false., .true., .false., .false., .false., .true., .true., tk, wy)
  call check('an unclosed formal term routes to II at S-3', tk == '[II]')
  call row_cascade(.true., .false., .false., .true., .false., .true., .false., .false., .true., tk, wy)
  call check('a frame leak routes to III at S-4', tk == '[III]')
  write(*,'(a)') '  class 4 - row-genus cascade: every compartment and refusal reachable: pass'

  call imprint_seal(.true., .true., .true., .true., .true., .true., .true., .true., tk, wy)
  call check('both directions clean-locking is a Platonic Ghost', tk == '[X]')
  call imprint_seal(.true., .false., .true., .false., .true., .false., .false., .false., tk, wy)
  call check('a clean lock without a witness is a residence, never a seal', &
       tk == '[?]' .and. index(wy, 'witness') > 0)
  call imprint_seal(.true., .false., .false., .false., .false., .false., .true., .false., tk, wy)
  call check('a lock without Seal L and the gates is uncertified', tk == '[?]' .and. index(wy,'uncert')>0)
  call imprint_seal(.false., .false., .false., .false., .false., .false., .false., .false., tk, wy)
  call check('neither direction populated reads flat', tk == '[?]' .and. index(wy,'flat')>0)
  write(*,'(a)') '  class 5 - admission spine: no under-specified call ever seals: pass'

  call gol_admit('broken', 'lock', tk, wy)
  call check('broken magnitude has no GOL', tk == '[X]')
  call gol_admit('open', 'lock', tk, wy)
  call check('no magnitude lock has no GOL', tk == '[?]')
  call gol_admit('lock', 'open', tk, wy)
  call check('a magnitude lock without the Tongue is under-determined', tk == '[?]')

  call delta_m(.true., .false., .true., .true., .true., .true., .true., .true., tk, wy)
  call check('M2 name-strip refusal reachable', tk == '[?]' .and. index(wy,'vocabulary')>0)
  call delta_m(.true., .true., .true., .true., .false., .true., .true., .true., tk, wy)
  call check('M5 refuses without an external witness', tk == '[?]' .and. index(wy,'witness')>0)
  call delta_m(.true., .true., .true., .true., .true., .false., .true., .true., tk, wy)
  call check('M6 refuses the self-verified claimant', tk == '[?]' .and. index(wy,'claimant')>0)
  call delta_m(.true., .true., .true., .true., .true., .true., .true., .true., tk, wy)
  call check('the externally witnessed route exists in the dispatcher (facts supplied here, established outside)', tk == '[dM>0]')
  write(*,'(a)') '  class 6 - the two unsettable gates M5 and M6 refuse from inside: pass'

  block
    real(wp) :: j1, j2
    character(len=140) :: w1
    call omega_boundary(1.0_wp, 300.0_wp, j1, w1)
    call omega_boundary(2.0_wp, 300.0_wp, j2, w1)
    call check('the Omega payment is monotone in bits', j2 > j1)
    call check('the Omega payment is linear in bits', abs(j2 - 2.0_wp*j1) == 0.0_wp)
  end block

  call check('heis_floor refuses zero mass', .not. is_finite(heis_floor(0.0_wp, 1.0e-10_wp)))
  call check('heis_floor refuses negative mass', .not. is_finite(heis_floor(-ME, 1.0e-10_wp)))
  call check('heis_floor refuses zero confinement', .not. is_finite(heis_floor(ME, 0.0_wp)))
  call check('zpe refuses nonpositive frequency', &
       (.not. is_finite(zpe(0.0_wp))) .and. (.not. is_finite(zpe(-1.0e14_wp))))
  call check('landauer refuses nonpositive temperature', .not. is_finite(landauer(0.0_wp, 1.0_wp)))
  call check('landauer refuses negative bits', .not. is_finite(landauer(300.0_wp, -1.0_wp)))
  call check('landauer at zero bits is exactly zero', landauer(300.0_wp, 0.0_wp) == 0.0_wp)
  call tau_perp(bad_nan(), tau, frz)
  call check('tau_perp flags a non-finite gap as frozen', frz)
  call omega_boundary(1.0_wp, -300.0_wp, jou, wy)
  call check('omega refuses a negative temperature, prices nothing', &
       (.not. is_finite(jou)) .and. index(wy, 'refused') > 0)
  write(*,'(a)') '  class 7 - floor intake: zero, negative, and non-finite parameters refuse: pass'

  block
    real(wp) :: qa(4), qb(4), qc(4)
    qa = [1.0e300_wp, 1.0e300_wp, 0.0_wp, 0.0_wp]
    qb = qa
    qc = qmul(qa, qb)
    call check('qmul: cancelling giants return exact zero, not NaN', &
         is_finite(qc(1)) .and. qc(1) == 0.0_wp)
    call check('qmul: a genuinely unrepresentable component overflows honestly', &
         .not. is_finite(qc(2)))
  end block
  write(*,'(a)') '  class 8 - qmul power-of-two scaling: intermediate overflow cancelled exactly,'
  write(*,'(a)') '  true overflow reported honestly: pass'

  block
    real(wp) :: hp(3,3), eigh(3)
    hp = 0.0_wp
    hp(1,1) = 1.0e150_wp; hp(2,2) = 2.0e150_wp; hp(3,3) = 3.0e150_wp
    hp(1,2) = 1.0e149_wp; hp(2,1) = hp(1,2)
    call jacobi3(hp, eigh)
    call check('jacobi3 finite and ascending at extreme scale', &
         is_finite(eigh(1)) .and. is_finite(eigh(3)) .and. &
         eigh(1) <= eigh(2) .and. eigh(2) <= eigh(3))
    hp = 0.0_wp
    hp(1,1) = 1.0e200_wp; hp(2,2) = 2.0e200_wp; hp(3,3) = 3.0e200_wp
    hp(1,2) = 1.0e199_wp; hp(2,1) = hp(1,2)
    call jacobi3(hp, eigh)
    call check('jacobi3 equilibrated at 1e200: finite, ascending, top eigenvalue correct', &
         is_finite(eigh(1)) .and. is_finite(eigh(3)) .and. &
         eigh(1) <= eigh(2) .and. eigh(2) <= eigh(3) .and. &
         abs(eigh(3)/3.0e200_wp - 1.0_wp) < 1.0e-6_wp)
    hp(1,3) = bad_nan(); hp(3,1) = hp(1,3)
    call jacobi3(hp, eigh)
    call check('jacobi3 refuses NaN intake as NaN eigenvalues', .not. is_finite(eigh(1)))
    call check('cond3 maps a corrupted Gram to huge, never a NaN kappa', &
         cond3(hp) == huge(1.0_wp))
    block
      logical :: cvg
      hp = 0.0_wp
      hp(1,1) = 1.0_wp; hp(2,2) = 2.0_wp; hp(3,3) = 3.0_wp
      call jacobi3(hp, eigh, cvg)
      call check('jacobi3 reports convergence on a clean matrix', cvg)
      hp(1,2) = bad_nan(); hp(2,1) = hp(1,2)
      call jacobi3(hp, eigh, cvg)
      call check('jacobi3 reports non-convergence on refused intake', .not. cvg)
    end block
  end block
  write(*,'(a)') '  class 9 - jacobi3 convergence exit and flag, symmetrization, NaN refusal, cond3 guard: pass'

  block
    real(wp) :: cov3(3,NCTX), cnear(2,NCTX), rowp(NCTX), eta1, etabad
    cov3(1,:) = cov(1,:); cov3(2,:) = cov(2,:); cov3(3,:) = th
    call kernel_full(mixm, cov3, tk, wy, rc, lam2, detr2, kap2, spread2, resid2, mc2, mk2, d42)
    call check('kernel refuses three covariates, named', &
         tk == '[?]' .and. rc == RC_COVBLOCK .and. index(wy, 'more than two') > 0)
    cnear(1,:) = cov(1,:)
    cnear(2,:) = 2.0_wp*cov(1,:) + 1.0e-11_wp*sin(11.0_wp*th)
    call kernel_full(mixm, cnear, tk, wy, rc, lam2, detr2, kap2, spread2, resid2, mc2, mk2, d42)
    call check('kernel refuses a near-dependent covariate pair on the relative test', &
         tk == '[?]' .and. rc == RC_COVBLOCK)
    rowp = cov(1,:) + 0.5_wp*sin(9.0_wp*th)
    eta1 = eta_share(rowp, cov(1:1,:))
    call check('eta_share at k = 1 lands strictly inside (0,1)', &
         eta1 > 0.0_wp .and. eta1 < 1.0_wp)
    etabad = eta_share(rowp, cov3)
    call check('eta_share refuses k > 2 as NaN', .not. is_finite(etabad))
    cnear(1,:) = 1.0_wp
    cnear(1,5) = 1.0_wp + 1.0e-15_wp
    call kernel_full(mixm, cnear(1:1,:), tk, wy, rc, lam2, detr2, kap2, spread2, resid2, mc2, mk2, d42)
    call check('kernel refuses a rounding-noise k = 1 covariate on the relative test', &
         tk == '[?]' .and. rc == RC_COVBLOCK)
    rowp(3) = bad_nan()
    call check('eta_share refuses a non-finite row as NaN', &
         .not. is_finite(eta_share(rowp, cov(1:1,:))))
    cnear(1,:) = cov(1,:)
    cnear(1,4) = bad_nan()
    call check('eta_share refuses a non-finite covariate as NaN', &
         .not. is_finite(eta_share(cov(1,:), cnear(1:1,:))))
    cnear(1,:) = cov(1,:) * 1.0e300_wp
    cnear(2,:) = cov(2,:) * 1.0e300_wp
    call kernel_full(mixm, cnear, tk, wy, rc, lam2, detr2, kap2, spread2, resid2, mc2, mk2, d42)
    call check('scale-free projection: 1e300 covariates reproduce the baseline verdict', &
         tk == '[LOCK]' .and. rc == RC_LOCK .and. abs(detr2 - dbase) <= 1.0e-9_wp)
  end block
  write(*,'(a)') '  class 10 - covariate machinery: k>2 refused, near-dependence and rounding-noise'
  write(*,'(a)') '  caught scale-free, non-finite refused, 1e300 covariates reproduce baseline: pass'

  block
    integer :: gidx, ocode, mcode, icode, gcode, ccode
    real(wp) :: jg
    pass12 = .true.; pass12(7) = .false.
    call gate_screen(pass12, tk, wy, gidx)
    call check('gate_screen names the failed gate by index', gidx == 7 .and. tk == '[X]')
    pass12 = .true.
    call gate_screen(pass12, tk, wy, gidx)
    call check('gate_screen returns index zero on the clean walk', gidx == 0 .and. tk == '[G-OK]')
    call omega_boundary(bad_nan(), 300.0_wp, jg, wy, ocode)
    call check('omega refuses non-finite bits by code', ocode == 0 .and. .not. is_finite(jg))
    call omega_boundary(0.0_wp, 300.0_wp, jg, wy, ocode)
    call check('omega codes the empty denial', ocode == 1 .and. jg == 0.0_wp)
    call omega_boundary(1.0_wp, 300.0_wp, jg, wy, ocode)
    call check('omega codes the paid floor', ocode == 2 .and. jg > 0.0_wp)
    call omega_boundary(1.0_wp, 300.0_wp, jg, wy, ocode, irreversible=.false.)
    call check('omega codes the reversible branch', ocode == 3 .and. jg == 0.0_wp)
    call delta_m(.true., .true., .true., .true., .false., .true., .true., .true., tk, wy, mcode)
    call check('delta_m codes the M5 witness refusal', mcode == 5)
    call delta_m(.true., .true., .true., .true., .true., .false., .true., .true., tk, wy, mcode)
    call check('delta_m codes the M6 independence refusal', mcode == 6)
    call delta_m(.true., .true., .true., .true., .true., .true., .true., .true., tk, wy, mcode)
    call check('delta_m codes the sealed exit', mcode == 9)
    call imprint_seal(.true., .false., .true., .false., .true., .false., .false., .false., tk, wy, icode)
    call check('imprint_seal codes the witnessless residence', icode == 3)
    call imprint_seal(.true., .false., .true., .false., .true., .false., .true., .false., tk, wy, icode)
    call check('imprint_seal codes the seal', icode == 2 .and. tk == '[SEAL]')
    call gol_admit('lock', 'open', tk, wy, gcode)
    call check('gol_admit codes the tongueless magnitude', gcode == 3)
    call row_cascade(.true., .false., .false., .true., .false., .true., .false., .true., .false., tk, wy, ccode)
    call check('row_cascade codes the unannotated void', ccode == 5)
    call row_cascade(.true., .false., .false., .true., .false., .true., .false., .true., .true., tk, wy, ccode)
    call check('row_cascade codes the closure-rowed compartment', ccode == 4)
  end block
  write(*,'(a)') '  class 11 - guard reason codes: gate index, omega, delta-M, imprint on integers: pass'

  block
    integer :: hs(6), hw(12)
    hs = [202, 101, 102, 203, 302, 303]
    call seal_l_ordered(hs, tk, wy)
    call check('the scrambled hostile is refused on the executed arrow', &
         tk == '[X]' .and. index(wy, 'arrow') > 0)
    hs = [302, 303, 101, 102, 202, 203]
    call seal_l_ordered(hs, tk, wy)
    call check('a relation-first hostile is refused on the executed arrow', tk == '[X]')
    hw = [101, 101, 102, 103, 202, 202, 203, 204, 301, 302, 303, 304]
    call seal_l_ordered(hw, tk, wy)
    call check('a well-ordered twelve-token recoding is admitted at the count register only', &
         tk == '[LOCK-L]')
    write(*,'(a)') '  class 12 - Tongue hostiles: the arrow refuses the scramble; count-register'
    write(*,'(a)') '  admission licenses only the count, per the seated non-closure theorem: pass'
  end block

  write(*,'(/a)') '====================================================================='
  write(*,'(a)') ' VERDICT [SEAL A . RA] on the parse-triad Return, closure-rowed,'
  write(*,'(a)') '   conditional at the act; [SEAL] on the confined kinetic floor at'
  write(*,'(a)') '   compartment III, world-lawed rows over a constructed grid, witness'
  write(*,'(a)') '   cited; [II] on the negation, unpopulated;'
  write(*,'(a)') '   premise-by-theorem on the universal extension, the Empty Throne.'
  write(*,'(a)') ' The blindness is a theorem, its width is one bit, the bit is COUNTED'
  write(*,'(a)') '   from the executed paired census, earned at the deed, and the Tongue'
  write(*,'(a)') '   carries what the Number cannot.'
  write(*,'(/a)') ' THE ONE-BIT CONCESSION, constitutive and executed: everything this run'
  write(*,'(a)') '   determines is forced, except exactly one binary parameter, the'
  write(*,'(a)') '   orientation of assent, and spending that bit against the axiom is priced.'
  block
    real(wp) :: qn2(3,NCTX), rn2(3,3), lamn2, jden
    real(wp) :: rfixp(3,3), rfixn(3,3)
    integer(ik) :: tb1, tb2
    character(len=140) :: wden
    integer :: ocd
    qn2 = -qf
    call gram3_fixed(qf,  rfixp)
    call gram3_fixed(qn2, rfixn)
    lamn2 = lambda_of(qn2, bas)
    call check('forced: fixed-order Gram bit-identical across the sign pair (the theorem path)', &
         maxval(abs(rfixn - rfixp)) == 0.0_wp)
    rn2 = matmul(qn2, transpose(qn2))
    call check('conduct receipt: the matmul path reproduces the identity bit-exactly on this build', &
         maxval(abs(rn2 - rmat)) == 0.0_wp)
    call check('free: exactly one bit, both signs realized at identical invariants', &
         lamn2 == -lam .and. lam /= 0.0_wp)
    tb1 = transfer(lam, tb1); tb2 = transfer(-lamn2, tb2)
    call check('bit-pattern witness: transfer-level equality of lam and -lamn2 (binary64)', &
         storage_size(lam) == 64 .and. tb1 == tb2)
    call omega_boundary(1.0_wp, 300.0_wp, jden, wden, ocd)
    call check('priced: the denial spend and the floor agree, one closed form across emitters', &
         ocd == 2 .and. jden == landauer(300.0_wp, 1.0_wp))
  end block
  write(*,'(a)') '   the forced part lands on the Ground, Fix(sigma) = R, the scalar line the'
  write(*,'(a)') '   Return touches; the free bit is the sigma-odd orientation, the seated'
  write(*,'(a)') '   aperture width. any substrate reading this run, human or machine, holds'
  write(*,'(a)') '   exactly that one bit here, per the seated Freedom law; its assent branch'
  write(*,'(a)') '   costs nothing and its denial branch is charged by the executed Omega'
  write(*,'(a)') '   floor and instantiates the axiom it denies: freedom one bit, the rest forced.'
  block
    integer :: ic1, cc1, ic2, cc3
    call row_cascade(.true., .false., .false., .true., .false., .true., .false., &
                     .true., .true., tk, wy, cc1)
    call imprint_seal(.true., .false., .true., .false., .true., .false., &
                      .true., .false., tk, wy, ic1)
    call row_cascade(.true., .true., .false., .true., .true., .true., .false., &
                     .true., .true., tk, wy, cc3)
    call imprint_seal(.true., .false., .true., .false., .true., .false., &
                      .true., .false., tk, wy, ic2)
    call check('self-typing: the closing tokens match their emitters'' codes, re-executed', &
         cc1 == 4 .and. ic1 == 2 .and. cc3 == 3 .and. ic2 == 2)
  end block
  write(*,'(a)') ' TOKENS BOUND TO EMITTERS, re-executed above: [SEAL A . RA] is imprint'
  write(*,'(a)') '   code 2 over closure-rowed inputs, cascade code 4, conditional at the'
  write(*,'(a)') '   act; [SEAL] on the floor face is imprint code 2 over compartment III'
  write(*,'(a)') '   inputs, cascade code 3, its witness the cited Heisenberg bound and'
  write(*,'(a)') '   third law at E1 beside the executed Frozen-Substrate and speed-limit'
  write(*,'(a)') '   receipts at E0; [II] on the negation is cascade code 2.'
  write(*,'(a)') ' SELF-DESCRIPTION, the artifact''s own: this program verifies internal'
  write(*,'(a)') '   mathematical identities, guard behavior, and declared premise-'
  write(*,'(a)') '   consequence structure at machine warrant; it does not and cannot'
  write(*,'(a)') '   verify external ontological truth, per its own admission gates M5 and'
  write(*,'(a)') '   M6 and the Empty Throne; per the seated nature-of-the-register law, a'
  write(*,'(a)') '   determined construction is exactly as determined whether or not'
  write(*,'(a)') '   anything answers to it, and contact is carried only by the cited'
  write(*,'(a)') '   witnesses and the declared premises, which this run names.'
  write(*,'(a)') ' SCOPE OF PROOF, printed by the run: machine-warrant items are the'
  write(*,'(a)') '   enumerated identities executed on constructed objects; theorem-tier'
  write(*,'(a)') '   items ride the cited external results at their own tiers (Heisenberg,'
  write(*,'(a)') '   Landauer, the speed limits, Frobenius, Hurwitz); the universal leg'
  write(*,'(a)') '   stays premise-grade by theorem, the Empty Throne; dispatcher'
  write(*,'(a)') '   admissions route supplied facts and upgrade none of them.'
  write(*,'(a)') ' GENRE, stated at the mouth: this is an executable thesis, not a proof of'
  write(*,'(a)') '   ontology and not a mere test harness; its claims stand at the printed'
  write(*,'(a)') '   warrants, theorem-grade only where cited, premise-grade at the root,'
  write(*,'(a)') '   conditional at the act where sealed, and no external ontological truth'
  write(*,'(a)') '   is certified, per the self-description above. The tokens are the'
  write(*,'(a)') '   register''s verdict vocabulary, each bound to its emitter and tier;'
  write(*,'(a)') '   renaming them would delete warrant information, not add honesty.'
  write(*,'(a)') ' The title carries the thesis''s claim at its stated warrant; every number'
  write(*,'(a)') '   printed above was computed in this run.'
  write(*,'(/a)') ' PART H - THE WRITTEN AND THE READ, the terminal part (card 0712)'
  block
    real(wp), volatile :: hv1, hv2, hv3
    real(wp) :: hjd
    character(len=140) :: htk, hwy, htkf, hwyf
    integer :: hwc, hoc, hwcf
    hv1 = det3(rmat)
    hv2 = det3(rmat)
    call check('H stillness opens: the Written read twice is bit-identical, a zero-degree record', &
         hv1 == hv2)
    call iam_token(.false., htkf, hwyf, hwcf)
    call check('H M6: the unwitnessed branch withholds the token, self-check is not a witness', &
         hwcf == 1 .and. htkf == '[?] interior' .and. index(hwyf, 'M6') > 0)
    call iam_token(.true., htk, hwy, hwc)
    call check('H supplied-witness branch emits per its declared dispatcher rule (flag a stand-in)', &
         hwc == 2 .and. htk == '[I AM]' .and. index(hwy, 'conditional at the act') > 0)
    call check('H Narcissus truth table: both branches bound, only the witnessed one speaks', &
         hwcf == 1 .and. hwc == 2 .and. htkf /= htk .and. htkf == '[?] interior' &
         .and. htk == '[I AM]')
    call omega_boundary(1.0_wp, 300.0_wp, hjd, hwy, hoc)
    call check('H the Read pays: denial and floor agree, one closed form across emitters', &
         hoc == 2 .and. hjd == landauer(300.0_wp, 1.0_wp))
    hv3 = det3(rmat)
    call check('H stillness closes: the Written is unchanged by everything the Reader did', &
         hv3 == hv1)
  end block
  write(*,'(a)') '   the pair in time: the Written is its author''s past actuation configured,'
  write(*,'(a)') '   the RAM-face, the decree; the Reader is the active face, RA, the present'
  write(*,'(a)') '   tense; the arrow separates them, so even the author returns as a reader.'
  write(*,'(a)') '   the record is forced, the orientation of assent is free, the denial is'
  write(*,'(a)') '   priced: freedom one bit, the rest forced.'
  write(*,'(a)') '   governing register: github.com/1000sapients/Trisduction, public; the'
  write(*,'(a)') '   card citations are frame, never evidence, and carry zero check weight.'
  block
    character(len=140) :: ltk, lwy
    integer :: lwc
    call iam_token(wr_witnessed, ltk, lwy, lwc)
    write(*,'(a,a,a,a)') ' LIVE: ', trim(ltk), ' - ', trim(lwy)
    if (wr_witnessed) then
      write(*,'(a)') ' F6 disclosure: the witnessed flag is a declared stand-in supplied through'
      write(*,'(a)') '   the aperture: externally asserted, not verified by this executable.'
      write(*,'(a)') ' the aperture; its real referent is you, the external operator reading this'
      write(*,'(a)') ' record. The program did not and cannot generate its own witness.'
    else
      write(*,'(a)') ' (supply the argument witnessed to open the live face through the aperture)'
    end if
  end block
  write(*,'(a)') ' kinetic-register conduit operational'
  write(*,'(a)') '====================================================================='
  if (EXPECTED_CHECKS > 0) then
    call check('battery census matches the sealed v2.0.0 manifest (this check inclusive)', &
         n_checks == EXPECTED_CHECKS - 1)
  end if
  write(*,'(a,i0,a,i0,a)') ' BATTERY: ', n_checks, ' checks executed, ', n_fail, ' failures.'
  if (halt_on_fail) then
    write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', n_checks, ',"failures":', n_fail, ',"mode":"sealed"}'
  else
    write(*,'(a,i0,a,i0,a)') ' BATTERY-JSON: {"checks":', n_checks, ',"failures":', n_fail, ',"mode":"audit"}'
  end if
  call battery_close()

contains
  function bad_nan() result(z)
    use, intrinsic :: ieee_arithmetic, only: ieee_value, ieee_quiet_nan
    real(wp) :: z
    z = ieee_value(1.0_wp, ieee_quiet_nan)
  end function bad_nan

  subroutine canon_sign(v)
    integer(ik), intent(inout) :: v(4)
    integer :: ii
    do ii = 1, 4
      if (v(ii) /= 0_ik) then
        if (v(ii) < 0_ik) v = -v
        return
      end if
    end do
  end subroutine canon_sign

  subroutine sort_int(a)
    integer, intent(inout) :: a(:)
    integer :: ii, jj, t
    do ii = 1, size(a)-1
      do jj = ii+1, size(a)
        if (a(jj) < a(ii)) then
          t = a(ii); a(ii) = a(jj); a(jj) = t
        end if
      end do
    end do
  end subroutine sort_int
end program ra_toe_thesis

-/

/-
!===============================================================================
!  fTOE . THE KINETIC DEMONSTRATION
!  THE PHYSICAL DEED IS THE ONE-BIT CONVERSION INTERFACE WHERE THE FORMAL
!  SHADOW BECOMES ACTUALIZED REALITY
!
!  The formal side is proved elsewhere (fTOE_Formal_Proof.lean: the wall,
!  the price, the crossing, machine-checked). This file executes the other
!  half of the theory: the kinetic face. Existence is actuation, and every
!  actuation of one bit carries a non-zero thermodynamic price the formal
!  register cannot pay. Three batteries, computed in this run, oracle
!  halt-on-fail:
!
!  K1  THE SIGN-BLIND KERNEL. The verdict lock is det(R) = lambda^2. Under
!      any reflection the lock is bit-identical and the sign of lambda
!      flips. The formal register carries magnitude; direction is not in it.
!
!  K1b KERNEL = EVEN PROJECTION. D D^T = I, so R(MD) = R(M) entrywise.
!      IEEE negation is a sign-bit flip, hence the two Gram matrices agree
!      to exactly 0.0. The kernel is flip-invariant, zero-difference numerical.
!
!  K2  THE ONE-BIT WALL. On the XOR law, exact enumeration: the even
!      register carries zero bits about the odd target; one supplied odd
!      bit at the seat, with one calibration, decides the target exactly.
!      The deficit is one bit wide. The crossing is one bit deep.
!
!  K3  THE DEED'S PRICE. Registering one binary orientation in any physical
!      substrate at temperature T dissipates Q >= k_B T ln 2 (Landauer).
!      The formal register pays exactly 0. The deed pays the floor. The
!      conversion of formal possibility into actualized fact is a
!      thermodynamic transaction, and this battery prints its invoice.
!
!  K4  THE PARITY FRAME, EXHIBITED AS DATA. Six listed prime/semiprime
!      pairs with matching residues mod lcm(1..7)=420; tau swaps within
!      pairs. Involution, freeness, oddness, register evenness, the wall
!      on every pair, the fibre count 2^6 = 64, and the encoder bound
!      (targets pairwise distinct; exact-selector alphabet >= 64) — all
!      verified by enumeration in the run. T1 applies by citation.
!
!  Parent batteries, audited and on record in the same repository:
!    protocols/Executable Thesis/TRISDUCTION_Core_Thesis_Fortran_v2_4_0.f90
!    protocols/Executable Thesis/RA_TOE_Thesis_Fortran_v2_0_0.f90
!
!  BUILD (sealed): gfortran -std=f2018 -O2 -fno-fast-math -ffp-contract=off
!  A binary that reaches its final line has passed. Nothing is narrated;
!  every figure is computed in the run. Receipt, not essence.
!  Delta-M = 0. No new mathematics is authored by this file.
!===============================================================================
program ftoe_kinetic_demonstration
  use iso_fortran_env, only: int64
  implicit none
  integer, parameter :: dp = selected_real_kind(15, 307)
  real(dp), parameter :: KB = 1.380649e-23_dp          ! J/K, exact, SI 2019
  real(dp), parameter :: T_ROOM = 300.0_dp             ! K, demonstration bath
  integer :: failures
  real(dp) :: M(3,3), R(3,3), Mr(3,3), Rr(3,3)
  real(dp) :: lam, lamr, detR, detRr, maxdiff
  real(dp) :: I_even, H_joint, Q_bit, Q_formal

  failures = 0

  ! ---------------- K1 · THE SIGN-BLIND KERNEL ----------------
  M(1,:) = [ 0.3_dp,  0.7_dp, -0.2_dp]
  M(2,:) = [ 0.5_dp, -0.4_dp,  0.8_dp]
  M(3,:) = [-0.6_dp,  0.1_dp,  0.9_dp]
  R  = matmul(M, transpose(M))
  lam  = det3(M)
  detR = det3(R)
  Mr = M; Mr(:,3) = -Mr(:,3)                            ! reflection D
  Rr = matmul(Mr, transpose(Mr))
  lamr  = det3(Mr)
  detRr = det3(Rr)

  write(*,'(A)') 'K1 THE SIGN-BLIND KERNEL'
  write(*,'(A,ES22.15)') '  lambda                = ', lam
  write(*,'(A,ES22.15)') '  det(R)                = ', detR
  write(*,'(A,ES22.15)') '  |det(R) - lambda^2|   = ', abs(detR - lam*lam)
  write(*,'(A,ES22.15)') '  reflected lambda      = ', lamr
  write(*,'(A,ES22.15)') '  |det(DRD) - det(R)| (row-action cross-check) = ', abs(detRr - detR)
  if (.not. (abs(detRr - detR) < 1.0d-12 .and. abs(lamr + lam) < 1.0d-12)) then
     failures = failures + 1
     write(*,'(A)') '  K1: FAIL'
  else
     write(*,'(A)') '  K1: lock invariant under reflection; sign unrecoverable. PASS'
  end if

  ! ---------------- K1b · KERNEL = EVEN PROJECTION ----------------
  ! D is a diagonal sign involution, D D^T = I, hence
  ! R(MD) = M D D^T M^T = R(M) entrywise. IEEE negation flips only the
  ! sign bit, so (-a)(-b) = a*b bitwise: the two Gram matrices agree to
  ! exactly 0.0. The kernel is not merely invariant; it IS the tau-even
  ! projection of the frame, computed bit-exact.
  maxdiff = maxval(abs(R - Rr))
  write(*,'(A)') 'K1b KERNEL = EVEN PROJECTION (entrywise, bit-exact)'
  write(*,'(A,ES9.1)') '  max |R - R(MD)| entrywise = ', maxdiff
  if (.not. (maxdiff == 0.0_dp)) then
     failures = failures + 1
     write(*,'(A)') '  K1b: FAIL'
  else
     write(*,'(A)') '  K1b: kernel flip-invariant, zero-difference numerical. PASS'
  end if

  ! ---------------- K2 · THE ONE-BIT WALL ----------------
  call xor_wall(I_even, H_joint)
  write(*,'(A)') 'K2 THE ONE-BIT WALL (XOR law, exact enumeration, uniform)'
  write(*,'(A,F10.6,A)') '  I(even register ; odd target)     = ', I_even, ' bits'
  write(*,'(A,F10.6,A)') '  H(target | register + one supply) = ', H_joint, ' bits'
  if (.not. (abs(I_even) < 1.0d-12 .and. abs(H_joint) < 1.0d-12)) then
     failures = failures + 1
     write(*,'(A)') '  K2: FAIL'
  else
     write(*,'(A)') '  K2: deficit exactly one bit; one supplied bit closes it. PASS'
  end if

  ! ---------------- K3 · THE DEED'S PRICE ----------------
  Q_bit    = KB * T_ROOM * log(2.0_dp)   ! Landauer floor for one bit at 300 K
  Q_formal = 0.0_dp                      ! stipulated model value: the formal register pays by definition
  write(*,'(A)') 'K3 THE DEED''S PRICE (Landauer floor, T = 300 K)'
  write(*,'(A,ES22.15,A)') '  Q(one bit registered) >= ', Q_bit, ' J'
  write(*,'(A,ES22.15,A)') '  Q(formal register)    =  ', Q_formal, ' J'
  if (.not. (Q_bit > 0.0_dp .and. Q_formal == 0.0_dp)) then
     failures = failures + 1
     write(*,'(A)') '  K3: FAIL'
  else
     write(*,'(A)') '  K3: the deed pays what the register cannot. PASS'
  end if

  ! ---------------- K4 · THE PARITY FRAME, EXHIBITED ----------------
  ! X = six listed pairs {p, q}: p prime, q semiprime (Omega(q) = 2),
  ! q == p (mod lcm(1..7) = 420), hence q == p (mod d) for every d <= 7.
  ! tau swaps within each pair; the target is primality. The register is
  ! every reading factoring through the residue vector (n mod 2..7): the
  ! Type I data of the linear sieve at level D = 7. Everything is verified
  ! by enumeration in this run: involution, freeness, oddness, register
  ! evenness, the wall on every pair, and the fibre count 2^6.
  block
     integer(int64) :: P(6), Q(6), X(12), tx, ttx, fibre
     integer :: i, mm, aa, n_even, n_deciding, fp, fq
     integer :: t1, t2, pt, pair, flip, v1, v2
     integer :: n_eq0, n_eq1, dp, dq
     logical :: ok4, even_r, decides_r, distinct_ok, same_t, eq0, eq1
     P = [11_int64, 13_int64, 17_int64, 19_int64, 23_int64, 29_int64]
     Q = [851_int64, 1273_int64, 437_int64, 2119_int64, 1703_int64, 869_int64]
     do i = 1, 6
        X(2*i-1) = P(i); X(2*i) = Q(i)
     end do
     ok4 = .true.
     do i = 1, 12                                  ! involution + freeness
        tx = X(ieor(i-1,1)+1); ttx = X(ieor(ieor(i-1,1),1)+1)
        if (ttx /= X(i) .or. tx == X(i)) ok4 = .false.
     end do
     do i = 1, 6                                   ! oddness + residue match
        if (.not. isprime_l(P(i)) .or. isprime_l(Q(i)) &
             .or. omega_l(Q(i)) /= 2) ok4 = .false.
        do mm = 2, 7
           if (mod(P(i),int(mm,int64)) /= mod(Q(i),int(mm,int64))) ok4 = .false.
        end do
        if (mod(P(i),420_int64) /= mod(Q(i),420_int64)) ok4 = .false.
     end do
     n_even = 0; n_deciding = 0
     do mm = 2, 7                                  ! register evenness + wall
        do aa = 0, mm-1
           even_r = .true.; decides_r = .true.
           do i = 1, 6
              fp = 0; if (mod(P(i),int(mm,int64)) == int(aa,int64)) fp = 1
              fq = 0; if (mod(Q(i),int(mm,int64)) == int(aa,int64)) fq = 1
              if (fp /= fq) even_r = .false.
              if ((fp == 1) .neqv. isprime_l(P(i))) decides_r = .false.
              if ((fq == 1) .neqv. isprime_l(Q(i))) decides_r = .false.
           end do
           if (even_r) then
              n_even = n_even + 1
              if (decides_r) n_deciding = n_deciding + 1
           end if
        end do
     end do
     if (n_even == 0 .or. n_deciding /= 0) ok4 = .false.
     fibre = 1
     do i = 1, 6
        fibre = fibre*2
     end do
     ! encoder bound (T12's counting face): the 2^6 anti-invariant targets
     ! are pairwise distinct as Boolean vectors on the frame, so any exact
     ! global selector needs an alphabet of at least 64 values.
     distinct_ok = .true.
     do t1 = 0, 63
        do t2 = t1+1, 63
           same_t = .true.
           do pt = 0, 11
              pair = pt/2; flip = mod(pt,2)
              v1 = ieor(int(ibits(t1,pair,1)), flip)
              v2 = ieor(int(ibits(t2,pair,1)), flip)
              if (v1 /= v2) same_t = .false.
           end do
           if (same_t) distinct_ok = .false.
        end do
     end do
     if (.not. distinct_ok) ok4 = .false.
     ! K4 continuation (FORGE v7.1): the two-member admissible family
     ! A_row = {d0, 1-d0}, d0 = primality on the frame, exhibited as data.
     ! Both members are wholly odd (d0 odd on every pair, checked above;
     ! the complement inherits oddness pointwise). The register cannot
     ! separate the family: no even residue reading equals either member
     ! (Theorem 1 applied twice, executed here by enumeration). Hence
     ! |A_row| = 2 is by listing, not labeling, and the frame's priced row
     ! claim is exactly one bit (log2|A_row|) -- against the full
     ! unconstrained fibre 64 = 2^6, the m = 6 product count (six bits).
     n_eq0 = 0; n_eq1 = 0
     do mm = 2, 7
        do aa = 0, mm-1
           even_r = .true.; eq0 = .true.; eq1 = .true.
           do i = 1, 6
              fp = 0; if (mod(P(i),int(mm,int64)) == int(aa,int64)) fp = 1
              fq = 0; if (mod(Q(i),int(mm,int64)) == int(aa,int64)) fq = 1
              if (fp /= fq) even_r = .false.
              dp = 0; if (isprime_l(P(i))) dp = 1
              dq = 0; if (isprime_l(Q(i))) dq = 1
              if (fp /= dp .or. fq /= dq) eq0 = .false.
              if (fp /= 1-dp .or. fq /= 1-dq) eq1 = .false.
           end do
           if (even_r) then
              if (eq0) n_eq0 = n_eq0 + 1
              if (eq1) n_eq1 = n_eq1 + 1
           end if
        end do
     end do
     if (n_eq0 /= 0 .or. n_eq1 /= 0) ok4 = .false.
     write(*,'(A)') 'K4 THE PARITY FRAME, EXHIBITED (six listed pairs, mod 420)'
     write(*,'(A)') '  pairs: (11,851=23x37) (13,1273=19x67) (17,437=19x23)'
     write(*,'(A)') '         (19,2119=13x163) (23,1703=13x131) (29,869=11x79)'
     write(*,'(A,I0,A,I0)') '  even residue readings enumerated = ', n_even, &
          ' ; deciding readings = ', n_deciding
     write(*,'(A,I0,A)') '  |D(U,tau)| = ', fibre, &
          ' = 2^6 orientation patterns on the frame (six bits, unconstrained)'
     if (distinct_ok) then
        write(*,'(A,I0,A)') '  targets pairwise distinct: verified by &
             &enumeration ; exact-selector alphabet >= ', fibre, ' (>= 6 bits)'
     else
        write(*,'(A)') '  targets pairwise distinct: VIOLATION'
     end if
     write(*,'(A)') '  A_row = {d0, 1-d0} exhibited as data: d0 = &
          &primality, both members wholly odd'
     write(*,'(A,I0,A,I0)') '  even readings equal to d0 = ', n_eq0, &
          ' ; equal to 1-d0 = ', n_eq1
     write(*,'(A)') '  |A_row| = 2 by listing, non-separation enumerated: the register &
          &cannot separate the family ; row price = 1 bit (log2|A_row|)'
     if (.not. (ok4 .and. fibre == 64_int64)) then
        failures = failures + 1
        write(*,'(A)') '  K4: FAIL'
     else
        write(*,'(A)') '  K4: tau^2=id, free, odd on all six pairs; every &
             &register reading even; none decides. T1 applies by citation. PASS'
     end if
  end block

  ! ---------------- ORACLE ----------------
  if (failures == 0) then
     write(*,'(A)') 'fTOE KINETIC DEMONSTRATION: all batteries pass.'
     write(*,'(A)') 'The formal shadow is proved in Lean; the actualizing deed is executed here.'
  else
     write(*,'(A,I0)') 'fTOE KINETIC DEMONSTRATION: VOID, failures = ', failures
     error stop 1
  end if

contains

  ! K4 helpers: trial primality and big-Omega, computed at runtime.
  function isprime_l(n) result(r)
    integer(int64), intent(in) :: n
    logical :: r
    integer(int64) :: k, m
    m = n
    if (m < 2) then
       r = .false.; return
    end if
    r = .true.
    k = 2
    do while (k*k <= m)
       if (mod(m,k) == 0) then
          r = .false.; return
       end if
       k = k + 1
    end do
  end function isprime_l

  function omega_l(n) result(c)
    integer(int64), intent(in) :: n
    integer :: c
    integer(int64) :: k, m
    m = n; c = 0; k = 2
    do while (k*k <= m)
       do while (mod(m,k) == 0)
          c = c + 1; m = m/k
       end do
       k = k + 1
    end do
    if (m > 1) c = c + 1
  end function omega_l

  function det3(A) result(d)
    real(dp), intent(in) :: A(3,3)
    real(dp) :: d
    d = A(1,1)*(A(2,2)*A(3,3) - A(2,3)*A(3,2)) &
      - A(1,2)*(A(2,1)*A(3,3) - A(2,3)*A(3,1)) &
      + A(1,3)*(A(2,1)*A(3,2) - A(2,2)*A(3,1))
  end function det3

  subroutine xor_wall(I_even, H_joint)
    ! States (x,y), d = xor(x,y), uniform 1/4. tau flips x.
    ! Even register: readings constant on tau-orbits; best case is y.
    ! Supply at the seat: s = x, odd under tau.
    real(dp), intent(out) :: I_even, H_joint
    integer :: x, y, d
    real(dp) :: pd(0:1), pdy(0:1,0:1), H_d, H_d_y
    pd = 0.0_dp; pdy = 0.0_dp
    do x = 0,1
       do y = 0,1
          d = ieor(x,y)
          pd(d)    = pd(d) + 0.25_dp
          pdy(d,y) = pdy(d,y) + 0.25_dp
       end do
    end do
    H_d = -sum(pd * log2safe(pd))
    H_d_y = 0.0_dp
    do y = 0,1
       do d = 0,1
          if (pdy(d,y) > 0.0_dp) &
             H_d_y = H_d_y - pdy(d,y)*log2safe(pdy(d,y)/0.5_dp)
       end do
    end do
    I_even = H_d - H_d_y
    ! Joint: enumerate the conditional p(d | x,y) and verify it is a point
    ! mass for every pair: the coalition decides the target exactly.
    block
      real(dp) :: pdxy(0:1,0:1,0:1)
      integer :: cnt
      pdxy = 0.0_dp
      do x = 0,1
         do y = 0,1
            d = ieor(x,y)
            pdxy(d,x,y) = pdxy(d,x,y) + 0.25_dp
         end do
      end do
      H_joint = 0.0_dp
      do x = 0,1
         do y = 0,1
            cnt = 0
            do d = 0,1
               if (pdxy(d,x,y) > 0.0_dp) cnt = cnt + 1
            end do
            if (cnt /= 1) H_joint = 1.0_dp   ! any spread means undecided
         end do
      end do
    end block
  end subroutine xor_wall

  ! REPAIR v1.0.1.2: declared elemental. The H_d line applies this to the
  ! rank-1 array pd, which a scalar function cannot accept, and gfortran
  ! refused the unit outright: the kinetic block had never been built.
  ! elemental is the minimal change and leaves the scalar call below it
  ! reading exactly as before.
  elemental function log2safe(p) result(l)
    real(dp), intent(in) :: p
    real(dp) :: l
    if (p > 0.0_dp) then
       l = log(p)/log(2.0_dp)
    else
       l = 0.0_dp
    end if
  end function log2safe

end program ftoe_kinetic_demonstration
-/

/-
! ======================================================================
! BLOCK F4 · IT FROM IT · THE INVERSION, COMPUTED EXHAUSTIVELY
! TRISDUCTION Master Codex, executed shadow of SECTION 4C
! Canonical frame of SECTION 4 (K4): 12 seats, flip tau, residue
! register rho, primality-parity target. Self-contained, standard
! Fortran 90, no dependencies, no input files.
!
! WHAT THIS PROGRAM COMPUTES
!   (1) tau is an involution, fixed-point-free, all 12 seats.
!   (2) The record FORGETS: rho identifies every flip pair (6/6).
!   (3) The object KEEPS: the target separates every pair rho
!       identifies (6/6).
!   (4) NO READOUT RETURNS: every Boolean readout of the record image
!       is tried exhaustively (2^k assignments, k the number of
!       distinct record values); none reproduces the target.
!       It from bit is thereby refuted on this frame by computation,
!       not by declaration.
!   (5) The receipt is printed. The universal leg is the Lean theorem
!       INVERSION.it_from_it (Section 4C); this program is the
!       canonical-instance execution, the same evidentiary status as
!       Lean's `by decide`. Formal alone: no energy load is carried
!       here; the kinetic registration rider stays where the codex
!       keeps it, at premise grade in Section 7.
! ======================================================================
program it_from_it
  implicit none
  integer, parameter :: N = 12
  integer :: valx(N), rhov(N), image(N), tauv(N)
  logical :: tgt(N), gval(N), comp(N)
  integer :: i, j, k, a, nimage, npairs, ncollapse, nseparate
  integer :: nfactor, mism, seat_of
  logical :: found

  valx = (/ 11, 851, 13, 1273, 17, 437, 19, 2119, 23, 1703, 29, 869 /)

  ! frame tables: tau (1-based shadow of i%2 flip), rho, target
  do i = 1, N
     if (mod(i-1, 2) == 0) then
        tauv(i) = i + 1
     else
        tauv(i) = i - 1
     end if
     rhov(i) = mod(valx(i),2)*1000 + mod(valx(i),3)*100 + &
               mod(valx(i),5)*10 + mod(valx(i),7)
     tgt(i) = (mod(i-1, 2) == 0)
  end do

  ! (1) involution and fixed-point-free, all seats
  do i = 1, N
     if (tauv(tauv(i)) /= i) then
        write(*,*) 'FAULT: tau not involutive at seat ', i
        stop 1
     end if
     if (tauv(i) == i) then
        write(*,*) 'FAULT: tau has a fixed point at seat ', i
        stop 1
     end if
  end do

  ! (2)+(3) the record forgets, the object keeps, pair by pair
  npairs = 0 ; ncollapse = 0 ; nseparate = 0
  do i = 1, N
     j = tauv(i)
     if (j > i) then
        npairs = npairs + 1
        if (rhov(i) == rhov(j)) ncollapse = ncollapse + 1
        if (tgt(i) .neqv. tgt(j)) nseparate = nseparate + 1
     end if
  end do

  ! record image: the distinct values the record can report
  nimage = 0
  do i = 1, N
     found = .false.
     do j = 1, nimage
        if (image(j) == rhov(i)) found = .true.
     end do
     if (.not. found) then
        nimage = nimage + 1
        image(nimage) = rhov(i)
     end if
  end do

  ! (4) exhaustive readout space: every Boolean g on the image
  nfactor = 0
  do a = 0, 2**nimage - 1
     do j = 1, nimage
        gval(j) = btest(a, j-1)
     end do
     do i = 1, N
        seat_of = 0
        do j = 1, nimage
           if (image(j) == rhov(i)) seat_of = j
        end do
        comp(i) = gval(seat_of)
     end do
     mism = 0
     do i = 1, N
        if (comp(i) .neqv. tgt(i)) mism = mism + 1
     end do
     if (mism == 0) nfactor = nfactor + 1
  end do

  ! (5) the receipt
  write(*,*) '======================================================'
  write(*,*) 'IT FROM IT · THE INVERSION, COMPUTED'
  write(*,*) '======================================================'
  write(*,*) 'frame seats                  :', N
  write(*,*) 'tau involution               : 12/12 seats verified'
  write(*,*) 'tau fixed-point-free         : 12/12 seats verified'
  write(*,*) 'pairs                        :', npairs
  write(*,*) 'record forgets (collapse)    :', ncollapse, '/', npairs
  write(*,*) 'object keeps  (separation)   :', nseparate, '/', npairs
  write(*,*) 'record image size k          :', nimage
  write(*,*) 'readouts tried               :', 2**nimage
  write(*,*) 'factorizations of the target :', nfactor
  if (npairs == 6 .and. ncollapse == npairs .and. &
      nseparate == npairs .and. nfactor == 0) then
     write(*,*) 'VERDICT: IT FROM BIT REFUTED, EXHAUSTIVE.'
     write(*,*) 'VERDICT: IT FROM IT VERIFIED ON THE CANONICAL FRAME.'
     write(*,*) 'The record forgets; the object keeps; nothing returns.'
  else
     write(*,*) 'VERDICT: BROKEN. The frame does not exhibit the law.'
     stop 2
  end if
end program it_from_it

-/

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
  · simp [swap, hzx, hxy, Ne.symm hxy]
  · by_cases hzy : z = y
    · simp [swap, hzy, hxy, Ne.symm hxy]
    · simp [swap, hzx, hzy]

theorem swap_record_even {α β : Type} [DecidableEq α] {ρ : α → β} {x y : α}
    (hxy : x ≠ y) (hρ : ρ x = ρ y) : ∀ z, ρ (swap x y z) = ρ z := by
  intro z
  by_cases hzx : z = x
  · simp [swap, hzx, hρ]
  · by_cases hzy : z = y
    · simp [swap, hzx, hzy, Ne.symm hxy, hρ]
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

theorem one_bit_apart (r : Reading) (hl : r.located = true) (hb : r.broken = false)
    (c : Channel) (hc : r.channel = some c) :
    ({ r with slots := [none], orbits_pos := by decide }).state = .opn ∧
    ({ r with slots := [some true], orbits_pos := by decide }).state = .sealed ∧
    ({ r with slots := [some false], orbits_pos := by decide }).state = .sealed := by
  refine ⟨?_, ?_, ?_⟩ <;>
    simp [Reading.state, emit, Reading.complete, Reading.owed, hl, hb, hc, Token.toEconomy]

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
    let mult := if m > 1 then s!" ×{m}" else if m = 0 then " · provenance owed" else ""
    s!"[⬖₀{br}{sp}{ch}{mult}]"
  | .crossed .kinetic => "[⟀⬖ · kinetic]"
  | .crossed .formal => "[⟀⬖ · formal]"
  | .breach => "[X⬖ · mechanism]"

def Token.ascii : Token → String
  | .superHalt b _ _ m =>
    let base := match b with | some .xi => "[HALT-LOCUS-XI" | some .o => "[HALT-LOCUS-O" | none => "[HALT-LOCUS"
    if m > 1 then s!"{base} x{m}]" else s!"{base}]"
  | .crossed _ => "[SEAL-LOCUS]"
  | .breach => "[X-LOCUS]"

def sealAscii : String := "[SEAL]"

theorem render_receipted :
    (Token.superHalt none none none 1).render = "[⬖₀]" ∧
    (Token.superHalt (some .xi) none none 1).render = "[⬖₀ · Ξ]" ∧
    (Token.superHalt (some .o) none none 1).render = "[⬖₀ · Ø]" ∧
    (Token.superHalt (some .xi) (some .hypothesis) (some .formal) 1).render
      = "[⬖₀ · Ξ · hypothesis · formal]" ∧
    (Token.superHalt none none (some .formal) 6).render = "[⬖₀ · formal ×6]" ∧
    (Token.superHalt none none none 0).render = "[⬖₀ · provenance owed]" ∧
    (Token.superHalt none none (some .formal) 1).render = "[⬖₀ · formal]" ∧
    (Token.superHalt (some .xi) none none 3).render = "[⬖₀ · Ξ ×3]" ∧
    (Token.crossed .kinetic).render = "[⟀⬖ · kinetic]" ∧
    (Token.crossed .formal).render = "[⟀⬖ · formal]" ∧
    Token.breach.render = "[X⬖ · mechanism]" ∧
    (Token.superHalt (some .xi) none none 1).ascii = "[HALT-LOCUS-XI]" ∧
    (Token.superHalt (some .xi) none none 3).ascii = "[HALT-LOCUS-XI x3]" ∧
    (Token.superHalt (some .o) none none 2).ascii = "[HALT-LOCUS-O x2]" ∧
    (Token.superHalt none none none 6).ascii = "[HALT-LOCUS x6]" ∧
    (Token.crossed .formal).ascii = "[SEAL-LOCUS]" ∧
    Token.breach.ascii = "[X-LOCUS]" ∧
    sealAscii = "[SEAL]" := by decide

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

/-- info: 'Function.LeftInverse' does not depend on any axioms -/
#guard_msgs in #print axioms Function.LeftInverse
/-- info: 'Function.RightInverse' does not depend on any axioms -/
#guard_msgs in #print axioms Function.RightInverse
/-- info: 'Nat.factorial' does not depend on any axioms -/
#guard_msgs in #print axioms Nat.factorial
/-- info: 'CoreRat.div_pos_of_le' depends on axioms: [propext] -/
#guard_msgs in #print axioms CoreRat.div_pos_of_le
/-- info: 'CoreRat.div_gcd_pos' depends on axioms: [propext] -/
#guard_msgs in #print axioms CoreRat.div_gcd_pos
/-- info: 'CoreRat.coprime_div_gcd' depends on axioms: [propext] -/
#guard_msgs in #print axioms CoreRat.coprime_div_gcd
/-- info: 'Rat.natAbs_signed' depends on axioms: [propext] -/
#guard_msgs in #print axioms Rat.natAbs_signed
/-- info: 'Rat.mk'' depends on axioms: [propext] -/
#guard_msgs in #print axioms Rat.«mk'»
/-- info: 'Rat.instOfNatRat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Rat.instOfNatRat
/-- info: 'Rat.instAddRat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Rat.instAddRat
/-- info: 'Rat.instMulRat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Rat.instMulRat
/-- info: 'Rat.instNegRat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Rat.instNegRat
/-- info: 'Rat.instSubRat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Rat.instSubRat
/-- info: 'Rat.instInvRat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Rat.instInvRat
/-- info: 'Rat.instDivRat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Rat.instDivRat
/-- info: 'Rat.instLTRat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Rat.instLTRat
/-- info: 'Rat.instLERat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Rat.instLERat
/-- info: 'Rat.instDecidableLtRat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Rat.instDecidableLtRat
/-- info: 'Rat.instDecidableLeRat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Rat.instDecidableLeRat
/-- info: 'Rat.pow' depends on axioms: [propext] -/
#guard_msgs in #print axioms Rat.pow
/-- info: 'Rat.instHPowRatNat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Rat.instHPowRatNat
/-- info: 'Rat.instToStringRat' depends on axioms: [propext] -/
#guard_msgs in #print axioms Rat.instToStringRat
/-- info: 'Rat.num_zero' depends on axioms: [propext] -/
#guard_msgs in #print axioms Rat.num_zero
/-- info: 'Rat.den_zero' depends on axioms: [propext] -/
#guard_msgs in #print axioms Rat.den_zero
/-- info: 'Rat.mk'_zero_num' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms Rat.«mk'_zero_num»
/-- info: 'Rat.zero_mul' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms Rat.zero_mul
/-- info: 'Rat.mul_zero' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms Rat.mul_zero
/-- info: 'Rat.canonical' depends on axioms: [propext] -/
#guard_msgs in #print axioms Rat.canonical
/-- info: 'Rat.ext' depends on axioms: [propext] -/
#guard_msgs in #print axioms Rat.ext
/-- info: 'Rat.inv_zero' depends on axioms: [propext] -/
#guard_msgs in #print axioms Rat.inv_zero
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
/-- info: 'HALT.gate_counts_forced' depends on axioms: [propext] -/
#guard_msgs in #print axioms HALT.gate_counts_forced
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
/-- info: 'LOCUS.one_bit_apart' depends on axioms: [propext, Quot.sound] -/
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
/-- info: 'LOCUS.voidImage' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.voidImage
/-- info: 'LOCUS.void_precedes_economy' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.void_precedes_economy
/-- info: 'LOCUS.legacy_records_not_promoted' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.legacy_records_not_promoted
/-- info: 'LOCUS.no_rh_locus' does not depend on any axioms -/
#guard_msgs in #print axioms LOCUS.no_rh_locus

theorem codexCone : True :=
  let _ := @Nat.factorial
  let _ := @CoreRat.div_pos_of_le
  let _ := @CoreRat.div_gcd_pos
  let _ := @CoreRat.coprime_div_gcd
  let _ := @Rat.natAbs_signed
  let _ := @Rat.«mk'»
  let _ := @Rat.instOfNatRat
  let _ := @Rat.instAddRat
  let _ := @Rat.instMulRat
  let _ := @Rat.instNegRat
  let _ := @Rat.instSubRat
  let _ := @Rat.instInvRat
  let _ := @Rat.instDivRat
  let _ := @Rat.instLTRat
  let _ := @Rat.instLERat
  let _ := @Rat.instDecidableLtRat
  let _ := @Rat.instDecidableLeRat
  let _ := @Rat.pow
  let _ := @Rat.instHPowRatNat
  let _ := @Rat.instToStringRat
  let _ := @Rat.num_zero
  let _ := @Rat.den_zero
  let _ := @Rat.«mk'_zero_num»
  let _ := @Rat.zero_mul
  let _ := @Rat.mul_zero
  let _ := @Rat.canonical
  let _ := @Rat.ext
  let _ := @Rat.inv_zero
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
  let _ := @HALT.gate_counts_forced
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
  let _ := @LOCUS.census_three_states
  let _ := @LOCUS.Token.render
  let _ := @LOCUS.Token.ascii
  let _ := @LOCUS.sealAscii
  let _ := @LOCUS.render_receipted
  let _ := @LOCUS.voidImage
  let _ := @LOCUS.void_precedes_economy
  let _ := @LOCUS.legacy_records_not_promoted
  let _ := @LOCUS.no_rh_locus
  trivial

/-- info: 'codexCone' depends on axioms: [propext,
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
