/-
  SPHYS_Neutrino_Witness.lean · The neutral lepton as the witness of the closure template ·
  core Lean 4, no library. Six correspondences in the row kernel's own terms: the seat is
  charge conjugation and its fixed set is the neutral line (Majorana = on the locus); the
  electron is an off-locus point with its partner; the weak registration lands only one
  chirality, so the sterile state is uncovered, the ghost; oscillation is registration in a
  second basis, unitarity is losslessness; the ordering is a one-bit address; and an observed
  mass difference forces a nonzero mass, the Root Axiom's floor supplied by deed.
-/
namespace SPHYS.Neutrino

/-- A lepton state: charge and chirality (true = left-handed). -/
abbrev State := Int × Bool
def conj (p : State) : State := (-p.1, p.2)
def neutral (p : State) : Prop := p.1 = 0
instance (p : State) : Decidable (neutral p) := inferInstanceAs (Decidable (p.1 = 0))
def electron : State := (-1, true)
def nuL : State := (0, true)
def nuR : State := (0, false)

theorem conj_involution (p : State) : conj (conj p) = p := by
  cases p with | mk q h => show (-(-q), h) = (q, h); simp

/-- The seat's fixed set is exactly the neutral line: a state is its own mirror image under
    conjugation iff it carries no charge. Majorana is membership in this fixed set. -/
theorem majorana_iff_neutral (p : State) : conj p = p ↔ neutral p := by
  cases p with
  | mk q h =>
    show (-q, h) = (q, h) ↔ q = 0
    constructor
    · intro e; have h1 : -q = q := congrArg Prod.fst e; omega
    · intro e; subst e; rfl

/-- The electron is off the locus and has a partner, the positron, distinct and off the locus:
    the pair the seat makes, the electron's witness role. -/
theorem electron_pair : conj electron ≠ electron ∧ ¬ neutral (conj electron) ∧ ¬ neutral electron := by
  decide

/-- The neutrino sits on the fixed set. -/
theorem neutrino_on_the_locus : conj nuL = nuL ∧ conj nuR = nuR := by decide

/-- Weak registration lands only on left-handed states: the carrier's image. -/
def weakImage (p : State) : Prop := p.2 = true
instance (p : State) : Decidable (weakImage p) := inferInstanceAs (Decidable (p.2 = true))
theorem active_registered : weakImage nuL := rfl
/-- The sterile state is uncovered by every weak registration: the ghost in the formal domain. -/
theorem sterile_uncovered : ¬ weakImage nuR := by decide
/-- One bit separates the registered state from the ghost: same charge, opposite chirality. -/
theorem one_bit_apart : nuL.1 = nuR.1 ∧ nuL.2 ≠ nuR.2 := by decide

/-- Oscillation as registration in a second basis: a mass state is read as a flavour record,
    or falls outside the active flavours (sterile admixture). -/
abbrev Mixing := Fin 3 → Option (Fin 3)
def Lossless (U : Mixing) : Prop := ∀ m, ∃ f, U m = some f
def Erases (U : Mixing) : Prop := ∃ m, U m = none
theorem lossless_iff_not_erases (U : Mixing) : Lossless U ↔ ¬ Erases U := by
  constructor
  · intro hl ⟨m, hm⟩; obtain ⟨f, hf⟩ := hl m; rw [hm] at hf; cases hf
  · intro hne m
    cases hU : U m with
    | none => exact absurd ⟨m, hU⟩ hne
    | some f => exact ⟨f, rfl⟩
def pmns : Mixing := fun m => some m
theorem pmns_unitary_is_lossless : Lossless pmns := fun m => ⟨m, rfl⟩
def withSterile : Mixing := fun m => if m = 2 then none else some m
theorem sterile_admixture_erases : Erases withSterile := ⟨2, rfl⟩

/-- The ordering is a one-bit address indexing the family. -/
inductive Ordering | normal | inverted deriving DecidableEq, Repr
theorem ordering_one_bit : ([Ordering.normal, Ordering.inverted] : List Ordering).length = 2 := rfl

/-- An observed mass difference forces a nonzero mass: the floor supplied by deed where the
    register wrote zero. -/
theorem oscillation_forces_floor (m1 m2 : Nat) (h : m1 ≠ m2) : 0 < m1 ∨ 0 < m2 := by omega

end SPHYS.Neutrino
#print axioms SPHYS.Neutrino.conj_involution
#print axioms SPHYS.Neutrino.majorana_iff_neutral
#print axioms SPHYS.Neutrino.electron_pair
#print axioms SPHYS.Neutrino.neutrino_on_the_locus
#print axioms SPHYS.Neutrino.sterile_uncovered
#print axioms SPHYS.Neutrino.one_bit_apart
#print axioms SPHYS.Neutrino.lossless_iff_not_erases
#print axioms SPHYS.Neutrino.pmns_unitary_is_lossless
#print axioms SPHYS.Neutrino.sterile_admixture_erases
#print axioms SPHYS.Neutrino.ordering_one_bit
#print axioms SPHYS.Neutrino.oscillation_forces_floor
#print axioms SPHYS.Neutrino.active_registered
