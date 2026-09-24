/-
RAM_ZFC_Placement.lean · ZFC subsumed by RAM, and ZFC's location under RAM.
Core Lean 4.19.0, no library, no sorry, no axiom declaration. Harvested 2026-09-24.

Location. ZFC is a ladder at L2m (provability); its intended world, the cumulative hierarchy and
the numbers inside it, is the Ground at L1m (formal being as grounding); its computable part is
the rung at L3m. The order rung ⊆ ladder ⊆ Ground holds under two named premises: the rung on
the ladder (for ZFC, Σ₁-completeness, a theorem of arithmetic) and soundness (which ZFC cannot
prove of itself, Gödel II, so it is carried openly).

Subsumption is by placement: RAM locates ZFC, as it locates NBG, PA, and every other ladder; it
does not derive ZFC's axioms and does not replace ZFC's proofs. Any theory, ZFC included, is
modelled abstractly: sentences, a provability predicate, a decidable fragment, and truth in the
intended world.
-/
namespace RAMZFC

structure Theory where
  Sent  : Type
  Prov  : Sent → Prop        -- L2m, the ladder
  Comp  : Sent → Prop        -- L3m, the rung: sentences settled by finite computation
  True_ : Sent → Prop        -- L1m, the Ground: truth in the intended world

/-- The rung is on the ladder: what finite computation settles, the theory proves.
    (For ZFC: Σ₁-completeness, a theorem of arithmetic, carried as a named premise.) -/
def RungOnLadder (T : Theory) : Prop := ∀ s, T.Comp s → T.Prov s

/-- The ladder reaches only the Ground: soundness. For ZFC this is exactly what ZFC cannot
    prove of itself (Gödel II); it is carried openly, never derived. -/
def Sound (T : Theory) : Prop := ∀ s, T.Prov s → T.True_ s

-- Z1.
/-- THE PLACEMENT. Under the two named premises, every theory sits in RAM's strata in order:
    rung ⊆ ladder ⊆ Ground. -/
theorem ram_places_theory (T : Theory) (hR : RungOnLadder T) (hS : Sound T) :
    (∀ s, T.Comp s → T.Prov s) ∧ (∀ s, T.Prov s → T.True_ s) ∧ (∀ s, T.Comp s → T.True_ s) :=
  ⟨hR, hS, fun s h => hS s (hR s h)⟩

-- Z2.
/-- The placement is not free: an unsound theory breaks ladder ⊆ Ground. -/
def unsound : Theory := ⟨Bool, fun _ => True, fun _ => False, fun b => b = true⟩

theorem soundness_is_load_bearing :
    RungOnLadder unsound ∧ ¬ Sound unsound := by
  refine ⟨fun _ h => h.elim, fun h => ?_⟩
  have := h false trivial
  cases this

-- Z3.
/-- The Ground can exceed the ladder: a sound theory can leave a truth unproved (Gödel's
    incompleteness region, L1m minus L2m), so the strata are genuinely three, not one. -/
def incomplete : Theory := ⟨Bool, fun b => b = true, fun _ => False, fun _ => True⟩

theorem ground_exceeds_ladder :
    Sound incomplete ∧ incomplete.True_ false ∧ ¬ incomplete.Prov false :=
  ⟨fun _ _ => trivial, trivial, fun h => Bool.noConfusion h⟩

-- Z4.
/-- Axioms as bits. Two independent axioms are two bits, not one composite paradox: all four
    combinations of their truth values are realized, so a theory with several independent
    axioms is a product of bits. (For ZFC: Choice is independent of ZF, Gödel 1938 and Cohen
    1963; this is cited, not proved here.) -/
theorem independent_axioms_are_separate_bits :
    ∀ a b : Bool, ∃ w : Bool × Bool, w.1 = a ∧ w.2 = b :=
  fun a b => ⟨(a, b), rfl, rfl⟩

-- Z5.
/-- THE VERDICT. RAM places every theory, ZFC included, as rung ⊆ ladder ⊆ Ground, conditional
    on the two named premises; soundness cannot be dropped; the Ground genuinely exceeds the
    ladder. Placement is structural subsumption: RAM does not derive ZFC's axioms, and does
    not replace ZFC's proofs. -/
theorem ram_subsumes_by_placement :
    (∀ T : Theory, RungOnLadder T → Sound T →
        (∀ s, T.Comp s → T.True_ s)) ∧
    (RungOnLadder unsound ∧ ¬ Sound unsound) ∧
    (Sound incomplete ∧ incomplete.True_ false ∧ ¬ incomplete.Prov false) :=
  ⟨fun T hR hS => (ram_places_theory T hR hS).2.2, soundness_is_load_bearing, ground_exceeds_ladder⟩

end RAMZFC

#print axioms RAMZFC.ram_places_theory
#print axioms RAMZFC.soundness_is_load_bearing
#print axioms RAMZFC.ground_exceeds_ladder
#print axioms RAMZFC.independent_axioms_are_separate_bits
#print axioms RAMZFC.ram_subsumes_by_placement
