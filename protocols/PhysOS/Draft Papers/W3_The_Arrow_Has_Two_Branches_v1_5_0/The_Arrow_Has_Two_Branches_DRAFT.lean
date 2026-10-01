/-
  SPHYS_Two_Arrows.lean · Magnetism and gravity as the two branches of one registration ·
  core Lean 4, no library. A one-signed field has no off-locus point, so no two worlds over a
  record and no bit to register: the reversible branch, the retraction itself. A two-signed
  field has pairs, remanence, two worlds over one record, the priced branch. Under time
  reversal the electric record is even and the magnetic target is odd, so no function of the
  record returns the target. Nothing here is a field theory; it is the typing of two arrows.
-/
namespace SPHYS.Arrows

/-- Sources of one sign: every source is its own conjugate, so none is off the locus. -/
def gravSource := { m : Int // 0 < m }
def conjG (s : gravSource) : gravSource := s
theorem gravity_no_off_locus (s : gravSource) : conjG s = s := rfl

/-- A row with every instance compliant admits no erasure and hence no two worlds: there is
    no bit for a record to miss. This is why the reversible branch keeps no record. -/
def Value {S : Type} (P : S → Prop) (Z : S → Prop) : Prop := ∀ s, Z s → P s
def Erases {S : Type} (P : S → Prop) (Z : S → Prop) : Prop := ∃ s, Z s ∧ ¬ P s
theorem no_bit_without_off_locus {S : Type} (P : S → Prop) (hall : ∀ s, P s) (Z : S → Prop) :
    Value P Z ∧ ¬ Erases P Z :=
  ⟨fun s _ => hall s, fun ⟨s, _, hp⟩ => hp (hall s)⟩

/-- Charges of two signs come in pairs under conjugation: an off-locus point has a partner,
    distinct and off the locus. No monopole: the pair never separates. -/
def charge := Int
def conjC (q : Int) : Int := -q
theorem magnetism_pair (q : Int) (hq : q ≠ 0) : conjC q ≠ q ∧ conjC q ≠ 0 := by
  unfold conjC
  exact ⟨fun h => hq (by omega), fun h => hq (by omega)⟩

/-- Remanence: at zero applied field the material sits in one of two states with the same
    record. Two worlds over one record, the kept bit. -/
abbrev MagState := Int × Bool     -- (applied field H, remanent orientation)
def record (s : MagState) : Int := s.1
theorem two_worlds_at_zero_field :
    record (0, true) = record (0, false) ∧ (0, true) ≠ ((0, false) : MagState) := by decide

/-- The priced and the reversible branch: a cycle of the priced branch pays at least one
    floor; the reversible branch pays none. -/
def cost : Bool → Nat | true => 1 | false => 0    -- true = irreversible (priced)
theorem priced_pays : cost true = 1 := rfl
theorem reversible_free : cost false = 0 := rfl
theorem branches_differ : cost true ≠ cost false := by decide

/-- Time reversal on the field record: the electric part is even, the magnetic part odd.
    No function of the even part returns the odd part. -/
abbrev Field := Int × Int        -- (E, B)
def timeRev (f : Field) : Field := (f.1, -f.2)
theorem electric_even (f : Field) : (timeRev f).1 = f.1 := rfl
theorem magnetic_odd (f : Field) : (timeRev f).2 = -f.2 := rfl
theorem no_reading_of_E_returns_B (g : Int → Int) : ¬ (∀ f : Field, g f.1 = f.2) := by
  intro h
  have h1 := h (0, 1); have h2 := h (0, -1)
  simp at h1 h2; omega

/-- A forbidden observation, derived: remanence needs two worlds over one record, so a field whose
    every instance is compliant can show no hysteresis, whatever its record. -/
theorem one_sign_no_remanence {S R : Type} (P : S → Prop) (record : S → R) (hall : ∀ s, P s) :
    ¬ ∃ s₁ s₂, record s₁ = record s₂ ∧ P s₁ ∧ ¬ P s₂ :=
  fun ⟨_, s₂, _, _, hn⟩ => hn (hall s₂)

end SPHYS.Arrows
#print axioms SPHYS.Arrows.gravity_no_off_locus
#print axioms SPHYS.Arrows.no_bit_without_off_locus
#print axioms SPHYS.Arrows.magnetism_pair
#print axioms SPHYS.Arrows.two_worlds_at_zero_field
#print axioms SPHYS.Arrows.branches_differ
#print axioms SPHYS.Arrows.magnetic_odd
#print axioms SPHYS.Arrows.no_reading_of_E_returns_B
#print axioms SPHYS.Arrows.one_sign_no_remanence
#print axioms SPHYS.Arrows.priced_pays
#print axioms SPHYS.Arrows.reversible_free
#print axioms SPHYS.Arrows.electric_even
