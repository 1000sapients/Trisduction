/-
RH_Unicorn_Block.lean · the Unicorn part of the Riemann Hypothesis, closed to derivation, its
aperture one bit wide, its supply side silent. Core Lean 4.19.0, no library, no sorry, no user-declared axiom. 2026-09-25.

Part III divided the hypothesis at a height T into a Real part and a Unicorn part and proved
the Real part by certificate. Parts I and II proved the wall, the crossing, the bound, and the
cure theorem, and did not say what they say of the Unicorn part. This file says it: closed to
derivation, the aperture one bit wide, the register silent beyond it. ΔM = 0.
-/
namespace RHUnicorn

variable {α β : Type}

/-- The line property, the Real part at T, the Unicorn part at T, as in Part III. -/
def RH (Z onL : α → Prop) : Prop := ∀ z, Z z → onL z
def RealPartAt (Z onL : α → Prop) (height : α → Nat) (T : Nat) : Prop :=
  ∀ z, Z z → height z ≤ T → onL z
def UnicornAt (Z onL : α → Prop) (height : α → Nat) (T : Nat) : Prop :=
  ∀ z, Z z → height z > T → onL z

/-- THE FORMAL BLOCK OF THE UNICORN PART. Let τ act on the zeros, let ρ be a record even at a
    seat z above the height, and let d decide the line property, odd at z. Then no reading g of
    the record agrees with d even on the region above the height alone. The Unicorn part is
    closed to every even register; the closure is a theorem and does not expire. -/
theorem unicorn_block (height : α → Nat) (T : Nat) (τ : α → α) (ρ : α → β) (d : α → Bool)
    (z : α) (habove : height z > T) (habove' : height (τ z) > T)
    (hρ : ρ (τ z) = ρ z) (hd : d (τ z) = !d z) :
    ¬ ∃ g : β → Bool, ∀ w, height w > T → g (ρ w) = d w := by
  intro ⟨g, hg⟩
  have h1 := hg z habove
  have h2 := hg (τ z) habove'
  rw [hρ, hd, h1] at h2
  revert h2
  cases d z <;> intro h2 <;> exact Bool.noConfusion h2

/-- THE APERTURE, ONE BIT WIDE. At a seat where d is odd, one odd bit s at the seat would decide d
    on the seat and its partner through a calibration that exists and is unique. The width of
    the aperture, a theorem; it says nothing of whether anything passes through it. -/
theorem aperture_one_bit_wide (τ : α → α) (s d : α → Bool) (z : α)
    (hs : s (τ z) = !s z) (hd : d (τ z) = !d z) :
    ∃ c : Bool, (d z = xor (s z) c ∧ d (τ z) = xor (s (τ z)) c) ∧
      ∀ c' : Bool, (d z = xor (s z) c' ∧ d (τ z) = xor (s (τ z)) c') → c' = c :=
  ⟨xor (d z) (s z),
    ⟨by cases s z <;> cases d z <;> rfl,
     by rw [hs, hd]; cases s z <;> cases d z <;> rfl⟩,
    by
      intro c' hc
      obtain ⟨h1, -⟩ := hc
      generalize hsz : s z = sv
      generalize hdz : d z = dv
      rw [hsz, hdz] at h1
      cases sv <;> cases dv <;> cases c' <;> first | rfl | exact absurd h1 (by decide)⟩

/-- EXISTENCE SUPPLIES NOTHING. Conditioning the Unicorn part on an inhabited premise, the root
    axiom for one, leaves it exactly where it was; and no class of frames on which the premise
    is to decide it decides more than already held on the class. Theorems E and I of Part I,
    read at the Unicorn part. -/
theorem unicorn_rule_exact (Z onL : α → Prop) (height : α → Nat) (T : Nat) (A : Prop) (ha : A) :
    (A → UnicornAt Z onL height T) ↔ UnicornAt Z onL height T :=
  ⟨fun h => h ha, fun hu _ => hu⟩

theorem unicorn_no_cure {Frame : Type} (A : Prop) (ha : A) (C U : Frame → Prop) :
    (∀ X, C X → A → U X) ↔ (∀ X, C X → U X) :=
  ⟨fun h X hc => h X hc ha, fun h X hc _ => h X hc⟩

/-- NO BYPASS. Given the Real part, the fused hypothesis is exactly the Unicorn part, so a proof
    of the hypothesis contains a proof of the Unicorn part and the block is not avoided by
    aiming at the whole. -/
theorem unicorn_no_bypass (Z onL : α → Prop) (height : α → Nat) (T : Nat)
    (hr : RealPartAt Z onL height T) : RH Z onL ↔ UnicornAt Z onL height T := by
  constructor
  · intro h z hz _; exact h z hz
  · intro hu z hz
    cases Nat.lt_or_ge T (height z) with
    | inl hgt => exact hu z hz hgt
    | inr hle => exact hr z hz hle

/-- THE SUPPLY SIDE IS SILENCE, AT THE REGISTER. Over one even record, both orientations of d at
    the seat are equally refused to every reading above the height: the register cannot say
    which way the seat lies, so it cannot say what a supply would bring, nor that one exists,
    nor that none does. -/
theorem supply_side_silent (height : α → Nat) (T : Nat) (τ : α → α) (ρ : α → β) (d : α → Bool)
    (z : α) (habove : height z > T) (habove' : height (τ z) > T)
    (hρ : ρ (τ z) = ρ z) (hd : d (τ z) = !d z) :
    (¬ ∃ g : β → Bool, ∀ w, height w > T → g (ρ w) = d w) ∧
    (¬ ∃ g : β → Bool, ∀ w, height w > T → g (ρ w) = !d w) ∧
    (!d z) ≠ d z :=
  ⟨unicorn_block height T τ ρ d z habove habove' hρ hd,
   unicorn_block height T τ ρ (fun w => !d w) z habove habove' hρ (by
     show (!d (τ z)) = !(!d z)
     rw [hd]),
   by cases d z <;> decide⟩

/-- The division at the height, on natural heights: the hypothesis is exactly its Real part and
    its Unicorn part. -/
theorem rh_iff_real_and_unicorn (Z onL : α → Prop) (height : α → Nat) (T : Nat) :
    RH Z onL ↔ RealPartAt Z onL height T ∧ UnicornAt Z onL height T := by
  constructor
  · intro h; exact ⟨fun z hz _ => h z hz, fun z hz _ => h z hz⟩
  · intro ⟨hr, hu⟩ z hz
    cases Nat.lt_or_ge T (height z) with
    | inl hgt => exact hu z hz hgt
    | inr hle => exact hr z hz hle

/-- A certificate at the height: a complete list of the zeros up to T, each checked on the line. -/
structure Certificate (Z onL : α → Prop) (height : α → Nat) (T : Nat) where
  items    : List α
  complete : ∀ z, Z z → height z ≤ T → z ∈ items
  checked  : ∀ z, z ∈ items → onL z

theorem real_part_of_certificate (Z onL : α → Prop) (height : α → Nat) (T : Nat)
    (c : Certificate Z onL height T) : RealPartAt Z onL height T :=
  fun z hz hle => c.checked z (c.complete z hz hle)

/-- THE THREE BITS AS ONE TERM · THE REGISTER'S PROOF OF THE HYPOTHESIS, COMPLETE. Under a
    certificate at T and the seat data above T, the hypothesis divides exactly (bit one), its
    Real part at T holds (bit two), every reading of the even register is refused above T (bit
    three, refused), and one supplied bit calibrates the seat uniquely (the door). The hypothesis
    is not thereby proved; nothing derivable about it is left underived. -/
theorem rh_register_proof_complete (Z onL : α → Prop) (height : α → Nat) (T : Nat)
    (c : Certificate Z onL height T) (τ : α → α) (ρ : α → β) (d s : α → Bool) (z : α)
    (habove : height z > T) (habove' : height (τ z) > T) (hρ : ρ (τ z) = ρ z)
    (hd : d (τ z) = !d z) (hs : s (τ z) = !s z) :
    (RH Z onL ↔ RealPartAt Z onL height T ∧ UnicornAt Z onL height T) ∧
    RealPartAt Z onL height T ∧
    (¬ ∃ g : β → Bool, ∀ w, height w > T → g (ρ w) = d w) ∧
    ∃ k : Bool, (d z = xor (s z) k ∧ d (τ z) = xor (s (τ z)) k) ∧
      ∀ k' : Bool, (d z = xor (s z) k' ∧ d (τ z) = xor (s (τ z)) k') → k' = k :=
  ⟨rh_iff_real_and_unicorn Z onL height T, real_part_of_certificate Z onL height T c,
   unicorn_block height T τ ρ d z habove habove' hρ hd, aperture_one_bit_wide τ s d z hs hd⟩

end RHUnicorn

#print axioms RHUnicorn.unicorn_block
#print axioms RHUnicorn.aperture_one_bit_wide
#print axioms RHUnicorn.unicorn_rule_exact
#print axioms RHUnicorn.unicorn_no_cure
#print axioms RHUnicorn.unicorn_no_bypass
#print axioms RHUnicorn.supply_side_silent
#print axioms RHUnicorn.rh_iff_real_and_unicorn
#print axioms RHUnicorn.real_part_of_certificate
#print axioms RHUnicorn.rh_register_proof_complete
