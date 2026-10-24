/- FTOE_Shared · module Millennium.FTOE_Shared of the Millennium Grand Master v1.0.0_CC.
   The fTOE kernel shared by the RH master v3.0.39_CC and the P ≠ NP master v1.13.0_CC: lines 14560 to 14843 of the RH master, verbatim (62 declarations,
   each text-identical to its copy in the P ≠ NP master). Both masters import it; Lean refuses one name declared twice. -/
namespace FTOE

/-! ## 0 · Zero-Axiom Arithmetic & Integer Cancellation Engine (No `[propext]` Leak) -/

theorem add_right_eq_zero_za (a : Nat) : ∀ b : Nat, a + b ≤ a → b = 0
  | 0, _ => rfl
  | d + 1, h =>
    have hlt : a < a + (d + 1) := Nat.succ_le_succ (Nat.le_add_right a d)
    False.elim (Nat.lt_irrefl a (Nat.lt_of_lt_of_le hlt h))

theorem add_eq_zero_right_za (a : Nat) : ∀ b : Nat, a + b = 0 → b = 0
  | 0, _ => rfl
  | _ + 1, h => Nat.noConfusion h

theorem neg_neg_free : ∀ d : Int, - -d = d
  | Int.ofNat 0 => rfl
  | Int.ofNat (_ + 1) => rfl
  | Int.negSucc _ => rfl

theorem neg_eq_self_free : ∀ d : Int, -d = d → d = 0
  | Int.ofNat 0, _ => rfl
  | Int.ofNat (_ + 1), h => Int.noConfusion h
  | Int.negSucc _, h => Int.noConfusion h

theorem natAbs_zero_free : ∀ d : Int, d.natAbs = 0 → d = 0
  | Int.ofNat 0, _ => rfl
  | Int.ofNat (_ + 1), h => Nat.noConfusion h
  | Int.negSucc _, h => Nat.noConfusion h

/-! ## I · 1 and 3 Colocated Before 2: The Orthogonal Fertile Logos Algebra (OFL.1–OFL.4) -/

structure Q where
  (a b c d : Int)
  deriving DecidableEq

def Q.mul (x y : Q) : Q :=
  ⟨x.a * y.a - x.b * y.b - x.c * y.c - x.d * y.d,
   x.a * y.b + x.b * y.a + x.c * y.d - x.d * y.c,
   x.a * y.c - x.b * y.d + x.c * y.a + x.d * y.b,
   x.a * y.d + x.b * y.c - x.c * y.b + x.d * y.a⟩

def Q.conj (x : Q) : Q := ⟨x.a, -x.b, -x.c, -x.d⟩

/-- 1D Stillness (Ground projection onto Fix(conj) = R). -/
def Q.reg (x : Q) : Q := ⟨x.a, 0, 0, 0⟩

/-- 3D Motion (Chiral Residence projection onto Im H). -/
def Q.chiral (x : Q) : Q := ⟨0, x.b, x.c, x.d⟩

def Q.add (x y : Q) : Q := ⟨x.a + y.a, x.b + y.b, x.c + y.c, x.d + y.d⟩

def Q.groundNorm (x : Q) : Nat := x.a.natAbs
def Q.chiralDefect (x : Q) : Nat := (x.b.natAbs + x.c.natAbs) + x.d.natAbs
def Q.totalNorm (x : Q) : Nat := Q.groundNorm x + Q.chiralDefect x

def qone : Q := ⟨1, 0, 0, 0⟩
def qneg : Q := ⟨-1, 0, 0, 0⟩
def qi   : Q := ⟨0, 1, 0, 0⟩
def qj   : Q := ⟨0, 0, 1, 0⟩
def qk   : Q := ⟨0, 0, 0, 1⟩

theorem ofl_fertility_begets_third :
    qi.mul qj = qk ∧ qj.mul qi = ⟨0, 0, 0, -1⟩ ∧ (qi.mul qj).a = 0 := by decide

theorem three_before_two_closure :
    (qi.mul qj).d = 1 ∧ qone.d = 0 ∧ qi.d = 0 ∧ qj.d = 0 := by decide

theorem ofl_two_contacts :
    (qi.mul qj).mul qk = qneg ∧ ((qi.mul qi).mul qk).a = 0 ∧
    Q.chiralDefect ((qi.mul qj).mul qk) = 0 ∧ Q.chiralDefect ((qi.mul qi).mul qk) = 1 := by decide

def chart : List Int := [-2, -1, 0, 1, 2]
def quats : List Q :=
  chart.flatMap fun a => chart.flatMap fun b => chart.flatMap fun c => chart.map fun d => ⟨a, b, c, d⟩

set_option maxRecDepth 100000 in
theorem one_and_three_colocated_on_chart :
    quats.all (fun q =>
      Q.add (Q.reg q) (Q.chiral q) == q &&
      (Q.reg q).conj == Q.reg q &&
      (Q.chiral q).conj == ⟨0, -q.b, -q.c, -q.d⟩) = true := by decide

/-! ## II · The Manifest Dual (2) Born as the Residue of the 3-Axis Lock -/

def bitAt : Nat → Nat → Nat
  | x, 0 => x % 2
  | x, k + 1 => bitAt (x / 2) k

def dot3 (r x : Nat) : Nat := (bitAt r 2 * bitAt x 2 + bitAt r 1 * bitAt x 1 + bitAt r 0 * bitAt x 0) % 2

def cube8 : List Nat := [0, 1, 2, 3, 4, 5, 6, 7]

def solCount3 (r1 t1 r2 t2 r3 t3 : Nat) : Nat :=
  (cube8.filter fun x => dot3 r1 x == t1 && dot3 r2 x == t2 && dot3 r3 x == t3).length

def solCount2 (r1 t1 r2 t2 : Nat) : Nat :=
  (cube8.filter fun x => dot3 r1 x == t1 && dot3 r2 x == t2).length

theorem two_born_from_three_lock :
    (cube8.all fun t =>
      solCount3 1 (bitAt t 0) 2 (bitAt t 1) 4 (bitAt t 2) == 1 &&
      solCount2 1 (bitAt t 0) 2 (bitAt t 1) == 2) = true := by decide

/-! ## III · fTOE in the Formal Domain: Canonizing Least Erasure & the 1-Bit Transfer -/

structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

theorem seated_undeniable {R : Prop} (G : SelfGrounding R) : R := G.instances G.anAct
theorem denial_reenacts_root {R : Prop} (G : SelfGrounding R) (denial : G.Act) : R := G.instances denial

/-- THE fTOE SEAT (`FertileLogosSeat`), upgraded with `ground_defect_zero`:
    Every object x has a 1D Ground norm `ground_norm (ρ x)` and a 3D chiral motion defect
    `chiral_defect x` co-located in `total_norm x`, with the ground projection carrying zero chiral defect. -/
structure FertileLogosSeat (X : Type) where
  σ                  : X → X
  ρ                  : X → X
  total_norm         : X → Nat
  ground_norm        : X → Nat
  chiral_defect      : X → Nat
  invol              : ∀ x, σ (σ x) = x
  lands              : ∀ x, σ (ρ x) = ρ x
  keeps              : ∀ x, σ x = x → ρ x = x
  forgets            : ∀ x, ρ (σ x) = ρ x
  colocated_1_3      : ∀ x, total_norm x = ground_norm (ρ x) + chiral_defect x
  ground_defect_zero : ∀ x, chiral_defect (ρ x) = 0
  motion_faithful    : ∀ x, chiral_defect x = 0 → ρ x = x

def LeastErasure {X : Type} (F : FertileLogosSeat X) (Z : X → Prop) : Prop :=
  ∀ x, Z x → F.ρ x = x

def Value {X : Type} (F : FertileLogosSeat X) (Z : X → Prop) : Prop :=
  ∀ x, Z x → F.σ x = x

def RecLocus {X : Type} (F : FertileLogosSeat X) (Z : X → Prop) (y : X) : Prop :=
  ∃ x, Z x ∧ F.ρ x = y

def MadeZeroLocus {X : Type} (F : FertileLogosSeat X) (Z : X → Prop) : Prop :=
  ∀ x, Z x → F.total_norm x ≤ F.ground_norm (F.ρ x)

theorem rho_idempotent {X : Type} (F : FertileLogosSeat X) (x : X) : F.ρ (F.ρ x) = F.ρ x :=
  F.keeps (F.ρ x) (F.lands x)

theorem defect_vanishes_iff_fixed {X : Type} (F : FertileLogosSeat X) (x : X) :
    F.chiral_defect x = 0 ↔ F.ρ x = x :=
  ⟨F.motion_faithful x, fun h => h ▸ F.ground_defect_zero x⟩

theorem record_locus_has_least_erasure {X : Type} (F : FertileLogosSeat X) (Z : X → Prop) :
    LeastErasure F (RecLocus F Z) :=
  fun _ ⟨x, _, hxy⟩ => Eq.trans (congrArg F.ρ hxy.symm) (Eq.trans (rho_idempotent F x) hxy)

theorem least_erasure_iff_value {X : Type} (F : FertileLogosSeat X) (Z : X → Prop) :
    LeastErasure F Z ↔ Value F Z :=
  ⟨fun h x hx => Eq.trans (congrArg F.σ (h x hx).symm) (Eq.trans (F.lands x) (h x hx)),
   fun h x hx => F.keeps x (h x hx)⟩

theorem made_zero_iff_defect_vanishes {X : Type} (F : FertileLogosSeat X) (Z : X → Prop) :
    MadeZeroLocus F Z ↔ ∀ x, Z x → F.chiral_defect x = 0 :=
  ⟨fun hm x hx =>
     have h_col : F.ground_norm (F.ρ x) + F.chiral_defect x = F.total_norm x := (F.colocated_1_3 x).symm
     have h_le : F.ground_norm (F.ρ x) + F.chiral_defect x ≤ F.ground_norm (F.ρ x) :=
       Nat.le_trans (Nat.le_of_eq h_col) (hm x hx)
     add_right_eq_zero_za (F.ground_norm (F.ρ x)) (F.chiral_defect x) h_le,
   fun hv x hx => Nat.le_of_eq ((F.colocated_1_3 x).trans (by rw [hv x hx, Nat.add_zero]))⟩

/-- UNCONDITIONAL RECORD CONSERVATION (Cone `[]`): Every record locus `RecLocus F Z` is
    unconditionally a `MadeZeroLocus` with zero premises. -/
theorem record_locus_is_made_zero {X : Type} (F : FertileLogosSeat X) (Z : X → Prop) :
    MadeZeroLocus F (RecLocus F Z) :=
  (made_zero_iff_defect_vanishes F (RecLocus F Z)).mpr
    (fun _ ⟨x, _, hxy⟩ => hxy ▸ F.ground_defect_zero x)

theorem ftoe_least_erasure_theorem {X : Type} (F : FertileLogosSeat X) (Z : X → Prop)
    (h_made : MadeZeroLocus F Z) : LeastErasure F Z :=
  fun x hx => F.motion_faithful x ((made_zero_iff_defect_vanishes F Z).mp h_made x hx)

/-- THE FOUR-WAY FOUNDATIONAL EQUIVALENCE (Cone `[]`): On any `FertileLogosSeat`,
    `MadeZeroLocus`, `LeastErasure`, `Value`, and the 1-Bit Cargo Transfer are one proposition. -/
theorem made_zero_iff_least_erasure {X : Type} (F : FertileLogosSeat X) (Z : X → Prop) :
    MadeZeroLocus F Z ↔ LeastErasure F Z :=
  ⟨ftoe_least_erasure_theorem F Z,
   fun hle => (made_zero_iff_defect_vanishes F Z).mpr
     (fun x hx => (defect_vanishes_iff_fixed F x).mpr (hle x hx))⟩

theorem made_zero_iff_one_bit_transfer {X : Type} (F : FertileLogosSeat X) (Z : X → Prop) :
    MadeZeroLocus F Z ↔ (LeastErasure F (RecLocus F Z) → LeastErasure F Z) :=
  ⟨fun hm _ => ftoe_least_erasure_theorem F Z hm,
   fun htr => (made_zero_iff_least_erasure F Z).mpr (htr (record_locus_has_least_erasure F Z))⟩

theorem ftoe_value_and_one_bit_transfer {X : Type} (F : FertileLogosSeat X) (Z : X → Prop)
    (h_made : MadeZeroLocus F Z) :
    (LeastErasure F (RecLocus F Z) → LeastErasure F Z) ∧ Value F Z :=
  have hle : LeastErasure F Z := ftoe_least_erasure_theorem F Z h_made
  ⟨fun _ => hle, (least_erasure_iff_value F Z).mp hle⟩

def ftoe_self_grounding_value {X : Type} (F : FertileLogosSeat X) (Z : X → Prop)
    (h_made : MadeZeroLocus F Z) : SelfGrounding (Value F Z) :=
  ⟨Subtype (fun _ : Unit => MadeZeroLocus F Z), ⟨(), h_made⟩,
   fun a => (ftoe_value_and_one_bit_transfer F Z a.2).2⟩

/-! ### III.b · The Concrete Quaternion Seat (`quatSeat`) & Unconditional 3-Axis Return Theorems -/

def quatSeat : FertileLogosSeat Q where
  σ := Q.conj
  ρ := Q.reg
  total_norm := Q.totalNorm
  ground_norm := Q.groundNorm
  chiral_defect := Q.chiralDefect
  invol := fun ⟨a, b, c, d⟩ => by
    show Q.mk a (- -b) (- -c) (- -d) = Q.mk a b c d
    rw [neg_neg_free b, neg_neg_free c, neg_neg_free d]
  lands := fun _ => rfl
  keeps := fun ⟨a, b, c, d⟩ h => by
    injection h with _ hb hc hd
    rw [neg_eq_self_free b hb, neg_eq_self_free c hc, neg_eq_self_free d hd]
    rfl
  forgets := fun _ => rfl
  colocated_1_3 := fun _ => rfl
  ground_defect_zero := fun _ => rfl
  motion_faithful := fun ⟨a, b, c, d⟩ h =>
    -- SCRIBE REPAIR (kernel-verified): unfold `chiralDefect` in `h` first; as pasted,
    -- `rw [hd0] at h` failed because `h`'s type carries `Q.chiralDefect` folded, so the
    -- pattern `d.natAbs` is not syntactically present for the rewrite.
    have h' : (b.natAbs + c.natAbs) + d.natAbs = 0 := h
    have hd0 : d.natAbs = 0 := add_eq_zero_right_za (b.natAbs + c.natAbs) d.natAbs h'
    have hbc : b.natAbs + c.natAbs = 0 := by rw [hd0] at h'; exact h'
    have hc0 : c.natAbs = 0 := add_eq_zero_right_za b.natAbs c.natAbs hbc
    have hb0 : b.natAbs = 0 := by rw [hc0] at hbc; exact hbc
    by rw [natAbs_zero_free b hb0, natAbs_zero_free c hc0, natAbs_zero_free d hd0]; rfl

/-- The 3-Axis Full Return Locus on `Q`: the state reached by the orthogonal triad `(i·j)·k`. -/
def ReturnLocus (x : Q) : Prop := x = (qi.mul qj).mul qk

/-- The 2-Axis Sterile Collapse Locus on `Q`: the state reached by `(i·i)·k`. -/
def SterileLocus (x : Q) : Prop := x = (qi.mul qi).mul qk

/-- UNCONDITIONAL FOUNDATIONAL THEOREM A (Cone `[]`, Zero Hypotheses):
    The 3-axis Full Return Locus is unconditionally a `MadeZeroLocus` on `quatSeat`. -/
theorem return_locus_is_made_zero : MadeZeroLocus quatSeat ReturnLocus :=
  fun _ hx => hx ▸ Nat.le_refl 1

/-- UNCONDITIONAL FOUNDATIONAL THEOREM B (Cone `[]`, Zero Hypotheses):
    Least Erasure holds unconditionally on the 3-axis Full Return Locus. -/
theorem ftoe_unconditional_return_least_erasure : LeastErasure quatSeat ReturnLocus :=
  ftoe_least_erasure_theorem quatSeat ReturnLocus return_locus_is_made_zero

/-- UNCONDITIONAL FOUNDATIONAL THEOREM C (Cone `[]`, Zero Hypotheses):
    Both the 1-Bit Cargo Transfer and `Value` hold unconditionally on the 3-axis Full Return Locus. -/
theorem ftoe_unconditional_return_one_bit :
    (LeastErasure quatSeat (RecLocus quatSeat ReturnLocus) → LeastErasure quatSeat ReturnLocus) ∧
    Value quatSeat ReturnLocus :=
  ftoe_value_and_one_bit_transfer quatSeat ReturnLocus return_locus_is_made_zero

def ftoe_unconditional_return_self_grounding : SelfGrounding (Value quatSeat ReturnLocus) :=
  ftoe_self_grounding_value quatSeat ReturnLocus return_locus_is_made_zero

/-- The 2-axis sterile locus violates Made-Zero conservation and fails Least Erasure (`[]`). -/
theorem sterile_locus_not_made_zero :
    ¬ MadeZeroLocus quatSeat SterileLocus ∧ ¬ LeastErasure quatSeat SterileLocus :=
  ⟨fun hm => Nat.not_succ_le_zero 0 (hm ((qi.mul qi).mul qk) rfl),
   fun hle => Int.noConfusion (congrArg Q.d (hle ((qi.mul qi).mul qk) rfl))⟩

/-- A `CompletedFertileSeat` packages a seat with its 1+3 Made-Zero locus so Least Erasure
    and the 1-bit transfer are direct projections with no external hypothesis. -/
structure CompletedFertileSeat (X : Type) extends FertileLogosSeat X where
  Z         : X → Prop
  made_zero : MadeZeroLocus toFertileLogosSeat Z

def canonicalCompletedSeat : CompletedFertileSeat Q :=
  { quatSeat with Z := ReturnLocus, made_zero := return_locus_is_made_zero }

theorem completed_seat_least_erasure {X : Type} (S : CompletedFertileSeat X) :
    LeastErasure S.toFertileLogosSeat S.Z :=
  ftoe_least_erasure_theorem S.toFertileLogosSeat S.Z S.made_zero

theorem completed_seat_one_bit_and_value {X : Type} (S : CompletedFertileSeat X) :
    (LeastErasure S.toFertileLogosSeat (RecLocus S.toFertileLogosSeat S.Z) →
      LeastErasure S.toFertileLogosSeat S.Z) ∧
    Value S.toFertileLogosSeat S.Z :=
  ftoe_value_and_one_bit_transfer S.toFertileLogosSeat S.Z S.made_zero

end FTOE
