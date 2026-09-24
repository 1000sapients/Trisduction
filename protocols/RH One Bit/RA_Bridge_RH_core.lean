/-
RA_Bridge_RH_core.lean · the same chain in core Lean 4.19.0, compiled in this session.
Identical proof terms to RA_Bridge_RH_Mathlib.lean. Two substitutions only, because core Lean
has no ℂ, ℝ, or ζ: Mathlib's `RiemannHypothesis` becomes a parameter `RH : Prop`, and ℝ
becomes ℤ. Neither proof uses any property of the conclusion or of ℝ beyond `0 < _` and
`0 ≤ _`, so the terms are the same terms.
-/
namespace RAChainCore

variable (RH : Prop)

structure Substrate where
  U  : Type
  ΔE : U → Int

def RA (S : Substrate) : Prop := ∀ x : S.U, 0 < S.ΔE x

def LiCriterion (lam : Nat → Int) : Prop := RH ↔ ∀ n : Nat, 1 ≤ n → 0 ≤ lam n

structure Bridge (S : Substrate) (lam : Nat → Int) where
  φ    : Nat → S.U
  read : ∀ n : Nat, 1 ≤ n → 0 < S.ΔE (φ n) → 0 ≤ lam n

theorem rh_of_ra_bridge (S : Substrate) (lam : Nat → Int)
    (hRA : RA S) (B : Bridge S lam) (hLi : LiCriterion RH lam) : RH :=
  hLi.mpr (fun n hn => B.read n hn (hRA (B.φ n)))

theorem bridge_iff_rh (S : Substrate) (lam : Nat → Int) (hRA : RA S) (x₀ : S.U)
    (hLi : LiCriterion RH lam) : Nonempty (Bridge S lam) ↔ RH :=
  ⟨fun ⟨B⟩ => rh_of_ra_bridge RH S lam hRA B hLi,
   fun h => ⟨⟨fun _ => x₀, fun n hn _ => hLi.mp h n hn⟩⟩⟩

end RAChainCore

#print axioms RAChainCore.rh_of_ra_bridge
#print axioms RAChainCore.bridge_iff_rh
