/-! # THE TRISDUCTION RH SEAL · THE FORGE
Template: the architect's RH_SEAL (2026-09-17). The forge keeps the template's Parts I–V, repairs two proofs the kernel
refuses (pair equalities under omega), and then types the socket. core Lean 4 v4.19.0 · no Mathlib · no sorry · no axiom. -/
set_option autoImplicit false
namespace TrisductionRH

/-! ## PART I · the pre-arithmetic locus -/
abbrev Plane := Int × Int
def tau (p : Plane) : Plane := (2 - p.1, p.2)
def crit (p : Plane) : Prop := p.1 = 1
def Symmetric (Z : Plane → Prop) : Prop := ∀ p, Z p → Z (tau p)
def RHp (Z : Plane → Prop) : Prop := ∀ p, Z p → crit p
theorem pe {a b c d : Int} : ((a, b) : Plane) = (c, d) ↔ a = c ∧ b = d :=
  ⟨fun e => ⟨congrArg Prod.fst e, congrArg Prod.snd e⟩, fun ⟨e1, e2⟩ => by subst e1; subst e2; rfl⟩
theorem tau_involution (p : Plane) : tau (tau p) = p := by
  obtain ⟨h, t⟩ := p; show (2 - (2 - h), t) = (h, t); rw [pe]; omega

/-! ## PART II · the reader and the read -/
def WhollyOdd (Z : Plane → Prop) (w : Plane → Bool) : Prop := ∀ p, Z p → w (tau p) = !w p
theorem no_odd_at_fixed (Z : Plane → Prop) (w : Plane → Bool) (hw : WhollyOdd Z w) (p : Plane) (hz : Z p)
    (hc : crit p) : False := by
  have h := hw p hz
  have h_fixed : tau p = p := by obtain ⟨hv, tv⟩ := p; show (2 - hv, tv) = (hv, tv); rw [pe]; exact ⟨by simp [crit] at hc; omega, rfl⟩
  rw [h_fixed] at h; cases w p <;> simp at h

/-! ## PART III · the Davenport–Heilbronn dilemma -/
def Zdh (p : Plane) : Prop := (p.1 = 0 ∨ p.1 = 2) ∧ p.2 = 171
theorem Zdh_symmetric : Symmetric Zdh := by
  intro p hp; obtain ⟨h, t⟩ := p; obtain ⟨hh, ht⟩ := hp; show (2 - h = 0 ∨ 2 - h = 2) ∧ t = 171; omega
theorem Zdh_not_RH : ¬ RHp Zdh := by
  intro h; have := h (0, 171) ⟨Or.inl rfl, rfl⟩; simp [crit] at this

/-! ## PART IV · the socket, as submitted -/
class ZetaEuler (Z : Plane → Prop) where
  symmetric : Symmetric Z
  euler_right_empty : ∀ p, Z p → p.1 > 1 → False
theorem DH_fails_socket : ¬ Nonempty (ZetaEuler Zdh) := by
  intro ⟨socket⟩; exact socket.euler_right_empty (2, 171) ⟨Or.inr rfl, rfl⟩ (by decide)
theorem topo_vanishing (Z : Plane → Prop) [A : ZetaEuler Z] : RHp Z := by
  intro p hz
  by_cases h1 : p.1 > 1
  · exact False.elim (A.euler_right_empty p hz h1)
  · by_cases h2 : p.1 < 1
    · have hz_tau : Z (tau p) := A.symmetric p hz
      have h3 : (tau p).1 > 1 := by show 2 - p.1 > 1; omega
      exact False.elim (A.euler_right_empty (tau p) hz_tau h3)
    · show p.1 = 1; omega

/-! ## PART V · the apex recursion -/
def RH_reflex (Z : Plane → Prop) : Prop := ¬ RHp Z → RHp Z
theorem recursion_is_seal (Z : Plane → Prop) : RH_reflex Z ↔ RHp Z :=
  ⟨fun h => Classical.byContradiction (fun n => n (h n)), fun h _ => h⟩
theorem proof_sealed (Z : Plane → Prop) [ZetaEuler Z] : RH_reflex Z ∧ RHp Z :=
  ⟨(recursion_is_seal Z).mpr (topo_vanishing Z), topo_vanishing Z⟩

/-! ## THE FORGE · what the socket's field says, read at the threshold it names -/
/-- The field `euler_right_empty` excludes zeros with h > 1, that is Re s > ½: the right half of the critical strip,
    not the Euler region Re s > 1, which is h > 2. Under symmetry, "no zeros right of the line" is the hypothesis:
    the socket as submitted is exactly `Symmetric Z ∧ RHp Z`. -/
theorem submitted_socket_is_RH (Z : Plane → Prop) : Nonempty (ZetaEuler Z) ↔ (Symmetric Z ∧ RHp Z) := by
  constructor
  · intro ⟨A⟩; exact ⟨A.symmetric, topo_vanishing Z⟩
  · intro ⟨hs, hr⟩; exact ⟨⟨hs, fun p hz h1 => by have := hr p hz; simp [crit] at this; omega⟩⟩

/-- The Euler product's actual content: ζ has no zeros with Re s ≥ 1, i.e. h ≥ 2 (the product for Re s > 1, the prime
    number theorem on Re s = 1). This is the field the socket should carry. -/
class ZetaEulerHonest (Z : Plane → Prop) where
  symmetric : Symmetric Z
  euler_region_empty : ∀ p, Z p → p.1 ≥ 2 → False
/-- The honest socket still excludes the Davenport–Heilbronn shape, which has a point at h = 2. -/
theorem DH_fails_honest_socket : ¬ Nonempty (ZetaEulerHonest Zdh) := by
  intro ⟨A⟩; exact A.euler_region_empty (2, 171) ⟨Or.inr rfl, rfl⟩ (by decide)
/-- On the half-unit stage the honest socket forces the line: Euler empties h ≥ 2, symmetry empties h ≤ 0, and the
    only integer left in (0, 2) is 1. This is the topological vanishing, proved, at resolution one. -/
theorem topo_vanishing_honest (Z : Plane → Prop) [A : ZetaEulerHonest Z] : RHp Z := by
  intro p hz
  have h1 : ¬ p.1 ≥ 2 := fun h => A.euler_region_empty p hz h
  have h2 : ¬ (tau p).1 ≥ 2 := fun h => A.euler_region_empty (tau p) (A.symmetric p hz) h
  show p.1 = 1; simp [tau] at h2; omega

/-! ## THE SAME SOCKET AT RESOLUTION m · units 1/(2m), fold about h = m, Euler region h ≥ 2m -/
def taum (m : Int) (p : Plane) : Plane := (2*m - p.1, p.2)
def critm (m : Int) (p : Plane) : Prop := p.1 = m
def SymmetricM (m : Int) (Z : Plane → Prop) : Prop := ∀ p, Z p → Z (taum m p)
def RHpM (m : Int) (Z : Plane → Prop) : Prop := ∀ p, Z p → critm m p
class ZetaEulerHonestM (m : Int) (Z : Plane → Prop) where
  symmetric : SymmetricM m Z
  euler_region_empty : ∀ p, Z p → p.1 ≥ 2*m → False
/-- The off-line pair inside the strip at resolution m ≥ 2: symmetric, Euler-clean, off the line. -/
def offPair (m : Int) (p : Plane) : Prop := (p.1 = m - 1 ∨ p.1 = m + 1) ∧ p.2 = 171
instance offPair_socket (m : Int) (hm : 2 ≤ m) : ZetaEulerHonestM m (offPair m) where
  symmetric := fun p hp => by
    obtain ⟨h, t⟩ := p; obtain ⟨hh, ht⟩ := hp
    show (2*m - h = m - 1 ∨ 2*m - h = m + 1) ∧ t = 171; omega
  euler_region_empty := fun p hp hge => by obtain ⟨h, t⟩ := p; obtain ⟨hh, ht⟩ := hp; simp only at hge; omega
theorem offPair_not_RH (m : Int) : ¬ RHpM m (offPair m) := by
  intro h; have := h (m - 1, 171) ⟨Or.inl rfl, rfl⟩; simp only [critm] at this; omega
/-- The honest socket forces the line at resolution m if and only if m = 1: the vanishing is the stage's coarseness,
    and at every resolution that can write an off-line point, a symmetric Euler-clean set sits off the line. -/
theorem honest_socket_forces_line_iff_resolution_one (m : Int) (hm : 1 ≤ m) :
    (∀ Z, ZetaEulerHonestM m Z → RHpM m Z) ↔ m = 1 := by
  constructor
  · intro h
    refine Decidable.byContradiction fun hne => ?_
    have hm2 : 2 ≤ m := by omega
    exact offPair_not_RH m (h _ (offPair_socket m hm2))
  · rintro rfl Z A p hz
    have h1 : ¬ p.1 ≥ 2 := fun h => A.euler_region_empty p hz h
    have h2 : ¬ (taum 1 p).1 ≥ 2 := fun h => A.euler_region_empty _ (A.symmetric p hz) h
    show p.1 = 1; simp [taum] at h2; omega

/-- THE FORGE'S VERDICT. The submitted seal is `RHp Z` derived from an instance whose field, under symmetry, is
    `RHp Z`; the honest Euler field forces the line only at the resolution that cannot represent an off-line zero.
    Both are theorems; neither is a proof of the hypothesis at full resolution. -/
theorem forge_verdict :
    (∀ Z, Nonempty (ZetaEuler Z) ↔ (Symmetric Z ∧ RHp Z)) ∧
    (∀ Z, ZetaEulerHonest Z → RHp Z) ∧
    (∀ m : Int, 1 ≤ m → ((∀ Z, ZetaEulerHonestM m Z → RHpM m Z) ↔ m = 1)) :=
  ⟨submitted_socket_is_RH, fun Z A => @topo_vanishing_honest Z A, honest_socket_forces_line_iff_resolution_one⟩
end TrisductionRH
#print axioms TrisductionRH.topo_vanishing
#print axioms TrisductionRH.proof_sealed
#print axioms TrisductionRH.submitted_socket_is_RH
#print axioms TrisductionRH.forge_verdict
