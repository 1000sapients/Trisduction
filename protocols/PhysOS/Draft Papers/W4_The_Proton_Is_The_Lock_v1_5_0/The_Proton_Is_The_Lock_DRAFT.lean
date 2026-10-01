/-
  SPHYS_Proton_Lock.lean · The proton as the lock of the closure template · core Lean 4.
  The color singlet of three quarks is the Levi-Civita symbol, the determinant: nonzero
  exactly when the three colors are distinct, antisymmetric under every exchange, and the
  lock fails when two axes coincide. The quark-spin record does not decide how the rest of
  the proton's spin is split. The valence quarks carry under one percent of the mass. The
  spectrum is gapped. Finite models; every physical number enters as a citation.
-/
namespace SPHYS.Proton

def eps (i j k : Fin 3) : Int :=
  if i = j ∨ j = k ∨ i = k then 0 else if (i.val + 1) % 3 = j.val then 1 else -1

theorem eps_nonzero_iff_distinct :
    ∀ i j k : Fin 3, eps i j k ≠ 0 ↔ (i ≠ j ∧ j ≠ k ∧ i ≠ k) := by decide
theorem eps_antisymmetric : ∀ i j k : Fin 3, eps j i k = - eps i j k := by decide
theorem eps_cyclic : ∀ i j k : Fin 3, eps j k i = eps i j k := by decide

def colors : List (Fin 3) := [0, 1, 2]
def epsTable : List Int :=
  colors.flatMap fun i => colors.flatMap fun j => colors.map fun k => eps i j k
/-- Twenty-seven color states, six nonzero entries, one singlet up to sign. -/
theorem singlet_count : epsTable.length = 27 ∧ (epsTable.filter (· ≠ 0)).length = 6 := by decide

/-- The determinant as the lock. -/
def det3 (M : Fin 3 → Fin 3 → Int) : Int :=
  colors.foldl (fun acc i => colors.foldl (fun acc j => colors.foldl
    (fun acc k => acc + eps i j k * M 0 i * M 1 j * M 2 k) acc) acc) 0
def idM : Fin 3 → Fin 3 → Int := fun r c => if r = c then 1 else 0
def collapsed : Fin 3 → Fin 3 → Int := fun r c => if r = 2 then (if c = 0 then 1 else 0) else idM r c
theorem lock_closes : det3 idM = 1 := by decide
theorem lock_fails_when_axes_coincide : det3 collapsed = 0 := by decide

/-- The proton's spin, in hundredths of hbar: one half = 50 = (1/2) quark spin + gluon spin +
    orbital. Two budgets with the same quark record split the rest differently. -/
structure Budget where
  sigma : Int
  gluon : Int
  orbital : Int
  deriving DecidableEq, Repr
def total (b : Budget) : Int := b.sigma / 2 + b.gluon + b.orbital
def worldA : Budget := ⟨30, 20, 15⟩
def worldB : Budget := ⟨30, 5, 30⟩
theorem quark_record_does_not_decide :
    worldA.sigma = worldB.sigma ∧ total worldA = 50 ∧ total worldB = 50 ∧ worldA ≠ worldB := by decide

/-- Masses in hundredths of MeV: the valence quarks carry under one percent of the proton. -/
theorem field_carries_the_mass : (2 * 216 + 467) * 100 < 93827 := by decide
/-- The spectrum is gapped: every listed state (pion, proton, lightest glueball) is massive. -/
theorem spectrum_gapped : ([13957, 93827, 173000] : List Nat).all (0 < ·) = true := by decide

/-- The lock's algebra for every integer entry, not on a grid. A determinant with two equal columns
    vanishes and swapping two columns negates it. These are polynomial identities in the nine
    entries; an identity true for every integer value is an identity of polynomials, and so holds
    over every commutative ring, the complex entries of the color rotations included. -/
def det3v (a b c d e f g h i : Int) : Int :=
  a * (e * i - f * h) - b * (d * i - f * g) + c * (d * h - e * g)
theorem det_two_equal_columns (a c d f g i : Int) : det3v a a c d d f g g i = 0 := by
  simp only [det3v, Int.mul_sub, Int.mul_comm, Int.mul_left_comm, Int.mul_assoc]
  omega
theorem det_swap_columns (a b c d e f g h i : Int) :
    det3v b a c e d f h g i = - det3v a b c d e f g h i := by
  simp only [det3v, Int.mul_sub, Int.mul_comm, Int.mul_left_comm, Int.mul_assoc]
  omega

end SPHYS.Proton
#print axioms SPHYS.Proton.eps_nonzero_iff_distinct
#print axioms SPHYS.Proton.eps_antisymmetric
#print axioms SPHYS.Proton.eps_cyclic
#print axioms SPHYS.Proton.singlet_count
#print axioms SPHYS.Proton.lock_closes
#print axioms SPHYS.Proton.lock_fails_when_axes_coincide
#print axioms SPHYS.Proton.quark_record_does_not_decide
#print axioms SPHYS.Proton.field_carries_the_mass
#print axioms SPHYS.Proton.spectrum_gapped
#print axioms SPHYS.Proton.det_two_equal_columns
#print axioms SPHYS.Proton.det_swap_columns