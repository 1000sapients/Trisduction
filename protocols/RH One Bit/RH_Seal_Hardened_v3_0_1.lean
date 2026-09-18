/-!
# THE TRISDUCTION RH SEAL · THE HARDENED ARCHITECTURE · v3.0.1
The architect's document, its proofs repaired by the scribe, its head corrected after external review.
core Lean 4 v4.19.0 · no Mathlib · no sorry · no custom axiom; the three standard axioms propext, Classical.choice and
Quot.sound appear in the cones, as the receipts at the foot show, through `omega` and classical contradiction.

WHAT THE KERNEL CHECKS. The stage is the integer lattice ℤ × ℤ with the fold τ(x, y) = (2 − x, y) and the line x = 1.
`RHp Z` says every point of Z has first coordinate 1. `ZetaEuler Z` says Z is τ-stable and has no point with x > 1.
`topo_vanishing` is the arithmetic fact that an integer x with ¬(x > 1) and ¬(2 − x > 1) equals 1. The field x > 1 is
Re s > ½, the hypothesis's own boundary, not the Euler region Re s > 1; under symmetry the socket is `Symmetric
Z ∧ RHp Z`
(`submitted_socket_is_RH` in RH_Seal_Forge.lean). `recursion_is_seal` is the classical tautology (¬P → P) ↔ P.
`proof_sealed` packages the two. `Zdh` sits on the boundary points x ∈ {0, 2}; the Davenport–Heilbronn zero inside the
strip, Re s ≈ 0.8085, is not representable on this stage.

WHAT IT IS NOT. A proof of the Riemann Hypothesis. There is no ζ, no Euler product, no ξ, and no statement translatable
into a claim about zeros of an analytic function on ℂ; the open strip 0 < Re s < 1 contains no lattice point but
the line,
so the lock is the discreteness of ℤ. The file is a correct kernel proof of a lattice fact, sealed as exactly that.
-/
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
  have h_fixed : tau p = p := by
    obtain ⟨hv, tv⟩ := p; show (2 - hv, tv) = (hv, tv); rw [pe]
    exact ⟨by simp [crit] at hc; omega, rfl⟩
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
end TrisductionRH

/-! ## CONE PINNING (VERIFICATION RECEIPT) -/
/-- info: 'TrisductionRH.pe' does not depend on any axioms -/
#guard_msgs in #print axioms TrisductionRH.pe
/-- info: 'TrisductionRH.tau_involution' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms TrisductionRH.tau_involution
/-- info: 'TrisductionRH.no_odd_at_fixed' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms TrisductionRH.no_odd_at_fixed
/-- info: 'TrisductionRH.Zdh_symmetric' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms TrisductionRH.Zdh_symmetric
/-- info: 'TrisductionRH.Zdh_not_RH' depends on axioms: [propext] -/
#guard_msgs in #print axioms TrisductionRH.Zdh_not_RH
/-- info: 'TrisductionRH.DH_fails_socket' does not depend on any axioms -/
#guard_msgs in #print axioms TrisductionRH.DH_fails_socket
/-- info: 'TrisductionRH.topo_vanishing' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms TrisductionRH.topo_vanishing
/-- info: 'TrisductionRH.recursion_is_seal' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms TrisductionRH.recursion_is_seal
/-- info: 'TrisductionRH.proof_sealed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms TrisductionRH.proof_sealed
