/-
RA_Li_Bridge_Retirement.lean · the retirement claim adjudicated on the file's own terms.
Imports RA_Li_Bridge unchanged and adds the scribe's theorems A1 and A2. Nothing here is an axiom. ΔM = 0.
-/
import RA_Li_Bridge

namespace RALi

/-- A1. Given the known seed λ₁ ≥ 0, the transport field of the Li anchor is the hypothesis:
positing the transport posits RH, so as a premise it purchases nothing. -/
theorem transport_is_RH (L : LiData) (hLi : LiCriterion L) (h1 : L.nonneg 1) :
    (∀ n, L.nonneg (n + 1) → L.nonneg (n + 2)) ↔ L.RH := by
  constructor
  · intro ht
    have all : ∀ k, L.nonneg (k + 1) := by
      intro k
      induction k with
      | zero => exact h1
      | succ k ih => exact ht k ih
    refine hLi.mpr (fun n hn => ?_)
    cases n with
    | zero => exact absurd hn (by decide)
    | succ k => exact all k
  · intro hRH n _
    exact (hLi.mp hRH) (n + 2) (by omega)

/-- A2. Every retirement of [Ξ₀] on the formal string is a proof of the hypothesis. -/
theorem retirement_is_RH (S : Substrate) (L : LiData) (hRA : RA S) (hLi : LiCriterion L)
    (u : Option (Unity S L)) (h : emit u ≠ .xi0) : L.RH := by
  cases u with
  | none => exact absurd rfl h
  | some w => exact retired_seal_is_sound S L hRA hLi w

end RALi

#print axioms RALi.transport_is_RH
#print axioms RALi.retirement_is_RH
