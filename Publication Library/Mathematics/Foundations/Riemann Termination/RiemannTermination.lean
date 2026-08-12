/-
  Riemann Termination: formalization of the three core results.

  Theorem 3.2   U(R) ↔ Q ⊢ ¬R            (purely proof-theoretic, no soundness)
  Theorem 4.1   T ⊇ Q → T ⊬ ¬R → ℕ ⊨ R   (Σ⁰₁-completeness of Q only)
  Corollary 3.6a U(R) ↔ ℕ ⊨ ¬R           (adds Σ⁰₁-soundness of Q)

  The setting is deliberately abstract. The theorems use no property of arithmetic
  beyond: monotonicity of derivability, the deduction theorem, explosion, closure
  of r.e.-ness under adjoining one sentence, and — for 4.1 and 3.6a only — Σ⁰₁
  completeness and soundness of the base for the negation of a Π⁰₁ sentence.
  Stating them abstractly is what makes the hypothesis boundary machine-visible,
  which is the boundary a human reader loses track of first.

  NO MATHLIB DEPENDENCY: core Lean 4 only. Tactics used are constructor, intro,
  exact, absurd, by_cases, cases and rw. It checks against a bare toolchain.

  NOT CHECKED IN THE SESSION THAT PRODUCED IT: no Lean toolchain was present.
  This ships to be checked, which is the entire point.
-/

/-- An abstract proof-theoretic setting. -/
structure ProofSetting where
  Sentence  : Type
  Thy       : Type
  neg       : Sentence → Sentence
  Der       : Thy → Sentence → Prop          -- T ⊢ φ
  Sub       : Thy → Thy → Prop               -- Sub T S  means  T ⊇ S
  adjoin    : Thy → Sentence → Thy           -- T + φ
  Con       : Thy → Prop                     -- consistency
  RE        : Thy → Prop                     -- recursive enumerability
  -- structural axioms
  mono        : ∀ {S T : Thy} {φ : Sentence}, Sub T S → Der S φ → Der T φ
  adjoin_sub  : ∀ (T : Thy) (φ : Sentence), Sub (adjoin T φ) T
  adjoin_der  : ∀ (T : Thy) (φ : Sentence), Der (adjoin T φ) φ
  deduction   : ∀ (T : Thy) (φ : Sentence), ¬ Con (adjoin T φ) → Der T (neg φ)
  explosion   : ∀ (T : Thy) (φ : Sentence), Der T φ → Der T (neg φ) → ¬ Con T
  adjoin_re   : ∀ (T : Thy) (φ : Sentence), RE T → RE (adjoin T φ)

namespace ProofSetting

variable (𝔓 : ProofSetting) (Q : 𝔓.Thy) (R : 𝔓.Sentence)

/-- 𝒯: consistent, r.e. extensions of Q. -/
def InT (T : 𝔓.Thy) : Prop := 𝔓.Con T ∧ 𝔓.RE T ∧ 𝔓.Sub T Q

/-- U(R): no theory in 𝒯 proves R. -/
def U : Prop := ∀ T : 𝔓.Thy, 𝔓.InT Q T → ¬ 𝔓.Der T R

/-- **Theorem 3.2.**  U(R) ↔ Q ⊢ ¬R.  No soundness hypothesis; no semantics. -/
theorem universal_unprovability_iff_refutable
    (hQre : 𝔓.RE Q) :
    𝔓.U Q R ↔ 𝔓.Der Q (𝔓.neg R) := by
  constructor
  · intro hU
    by_cases hcon : 𝔓.Con (𝔓.adjoin Q R)
    · exact absurd (𝔓.adjoin_der Q R)
        (hU (𝔓.adjoin Q R) ⟨hcon, 𝔓.adjoin_re Q R hQre, 𝔓.adjoin_sub Q R⟩)
    · exact 𝔓.deduction Q R hcon
  · intro hQneg T hT hTR
    exact (𝔓.explosion T R hTR (𝔓.mono hT.2.2 hQneg)) hT.1

end ProofSetting

/-- Arithmetic layer: a truth predicate on ℕ, plus Σ⁰₁-completeness and soundness
    of the base for the negation of the Π⁰₁ sentence under consideration. -/
structure ArithSetting extends ProofSetting where
  Sat        : Sentence → Prop                -- ℕ ⊨ φ
  sat_total  : ∀ φ : Sentence, Sat φ ∨ Sat (neg φ)
  sat_excl   : ∀ φ : Sentence, Sat φ → Sat (neg φ) → False

namespace ArithSetting

variable (𝔄 : ArithSetting) (Q : 𝔄.Thy) (R : 𝔄.Sentence)

/-- **Theorem 4.1.**  For R ∈ Π⁰₁ and any T ⊇ Q: T ⊬ ¬R → ℕ ⊨ R.
    Hypothesis on T is containment alone: T need not be consistent, r.e., or sound. -/
theorem restriction
    (sigma1_complete : 𝔄.Sat (𝔄.neg R) → 𝔄.Der Q (𝔄.neg R))
    (T : 𝔄.Thy) (hT : 𝔄.Sub T Q) (h : ¬ 𝔄.Der T (𝔄.neg R)) :
    𝔄.Sat R := by
  cases 𝔄.sat_total R with
  | inl hR  => exact hR
  | inr hnR => exact absurd (𝔄.mono hT (sigma1_complete hnR)) h

/-- **Corollary 3.6a.**  Under Σ⁰₁-completeness and Σ⁰₁-soundness of Q:
    U(R) ↔ ℕ ⊨ ¬R.  "No consistent r.e. extension of Q proves R iff R is false." -/
theorem universal_unprovability_iff_false
    (hQre : 𝔄.RE Q)
    (sigma1_complete : 𝔄.Sat (𝔄.neg R) → 𝔄.Der Q (𝔄.neg R))
    (sigma1_sound    : 𝔄.Der Q (𝔄.neg R) → 𝔄.Sat (𝔄.neg R)) :
    𝔄.toProofSetting.U Q R ↔ 𝔄.Sat (𝔄.neg R) := by
  rw [𝔄.toProofSetting.universal_unprovability_iff_refutable Q R hQre]
  exact ⟨sigma1_sound, sigma1_complete⟩

end ArithSetting

/-
  Hypothesis boundary, made explicit by the signatures above and this is the
  point of formalizing rather than asserting:

    universal_unprovability_iff_refutable   uses  RE Q                  only.
    restriction                             uses  sigma1_complete       only.
    universal_unprovability_iff_false       uses  RE Q, complete, sound.

  Corollary 3.6a is the sole result requiring soundness. Theorem 3.2 does not,
  and Theorem 4.1 does not. That separation is exactly what the paper's abstract
  claims and is the claim a reader most often loses track of.
-/
