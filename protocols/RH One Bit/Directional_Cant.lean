/-!
# Directional_Cant.lean · the two "can'ts" are not equal: which one seals
Core Lean 4.19.0 · no library · no sorry · no axiom declaration.
Abstract: a proposition RH, a provability predicate for the foundation, and the one property
that makes the directions unequal, Σ₁-completeness: if a finite witness to the denial exists,
the foundation proves the denial. That property is carried as a named hypothesis (a cited
theorem of arithmetic), not proved here.
-/
namespace DirCant

structure Setting where
  RH        : Prop
  Prov      : Prop → Prop
  /-- Σ₁-completeness, carried as a hypothesis: a false RH is refutable. -/
  sigma1    : ¬ RH → Prov (¬ RH)
  /-- Soundness of the foundation on the denial: it proves ¬RH only if ¬RH. -/
  sound_neg : Prov (¬ RH) → ¬ RH

-- D1.
/-- THE SEALED DIRECTION. If the foundation can't refute the hypothesis, the hypothesis holds.
    The denial's "can't" is decisive. -/
theorem cant_refute_seals (S : Setting) (h : ¬ S.Prov (¬ S.RH)) : S.RH :=
  Classical.byContradiction (fun n => h (S.sigma1 n))

-- D2.
/-- The same, constructively, for a decidable hypothesis. -/
theorem cant_refute_seals_dec (S : Setting) [Decidable S.RH] (h : ¬ S.Prov (¬ S.RH)) : S.RH :=
  Decidable.byContradiction (fun n => h (S.sigma1 n))

-- D3.
/-- And conversely, under soundness on the denial: the hypothesis holds exactly when the
    foundation can't refute it. The denial's "can't" and the hypothesis are one statement. -/
theorem rh_iff_cant_refute (S : Setting) [Decidable S.RH] : S.RH ↔ ¬ S.Prov (¬ S.RH) :=
  ⟨fun r p => S.sound_neg p r, cant_refute_seals_dec S⟩

-- D4.
/-- THE UNSEALED DIRECTION. The assent's "can't" decides nothing: a setting where the
    hypothesis holds and the foundation can't prove it (independence) satisfies every field. -/
def independentTrue : Setting :=
  ⟨True, fun _ => False, fun n => absurd trivial n, fun p => p.elim⟩

theorem cant_prove_does_not_seal_false :
    independentTrue.RH ∧ ¬ independentTrue.Prov independentTrue.RH :=
  ⟨trivial, id⟩

-- D5.
/-- THE ASYMMETRY, IN ONE THEOREM. Can't-refute seals the hypothesis; can't-prove is compatible
    with the hypothesis being true; the two "can'ts" are not mirror images. -/
theorem asymmetry :
    (∀ S : Setting, ¬ S.Prov (¬ S.RH) → S.RH) ∧
    (∃ S : Setting, S.RH ∧ ¬ S.Prov S.RH) :=
  ⟨cant_refute_seals, ⟨independentTrue, cant_prove_does_not_seal_false⟩⟩

end DirCant

#print axioms DirCant.cant_refute_seals
#print axioms DirCant.cant_refute_seals_dec
#print axioms DirCant.rh_iff_cant_refute
#print axioms DirCant.cant_prove_does_not_seal_false
#print axioms DirCant.asymmetry
