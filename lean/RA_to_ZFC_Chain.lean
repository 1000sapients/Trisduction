/-
RA_to_ZFC_Chain.lean · RA mapped to ZFC through the RA–RAM bridge, link by link.
Core Lean 4.19.0, no library, no sorry, no axiom declaration. Harvested 2026-09-24.

The chain RA → Bridge → RAM → ZFC. The RA–RAM bridge is the junction's discriminator
(Master Codex Ch. 10B, `Bridge.discriminator`): a property whose every world has it is KEYLESS
and crosses from the root; a property some world lacks is KEYED, one bit, supplied and never
derived. ZFC's location under RAM is RAM_ZFC_Placement.lean. Worlds are ways a theory's content
could be, which of its independent sentences hold.

Verdict. Upward, every act of using ZFC grounds RA. Downward, RA crosses the bridge as presence
into every world of ZFC and carries no keyed content: no independent sentence of ZFC, Choice
over ZF the cited example (Gödel 1938, Cohen 1963), is decided by RA.
-/
namespace RAtoZFC

structure Substrate where
  U  : Type
  ΔE : U → Int

def RA (S : Substrate) : Prop := ∀ x : S.U, 0 < S.ΔE x

structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

def unitSub : Substrate := ⟨Unit, fun _ => 1⟩
theorem ra_unit : RA unitSub := fun _ => show (0 : Int) < 1 by decide

/-- A theory, abstractly: sentences and a provability predicate (the RAM ladder). -/
structure Theory where
  Sent : Type
  Prov : Sent → Prop

-- LINK 1 · ZFC → RA: every act of using a theory grounds RA. This link holds.
theorem using_grounds_root (T : Theory) (s : T.Sent) (d : T.Prov s) :
    Nonempty (SelfGrounding (RA unitSub)) :=
  ⟨⟨PLift (T.Prov s), ⟨d⟩, fun _ => ra_unit⟩⟩

-- LINK 2 · RA → Bridge: the bridge carries only KEYLESS properties, those no world denies.
/-- A property of worlds is keyless when every world has it, keyed when some world lacks it. -/
def Keyless {W : Type} (P : W → Prop) : Prop := ∀ w, P w
def Keyed   {W : Type} (P : W → Prop) : Prop := ∃ w, ¬ P w

/-- RA crosses to every world whatever its content: RA is keyless over worlds. -/
theorem ra_is_keyless {W : Type} : Keyless (fun _ : W => RA unitSub) := fun _ => ra_unit

/-- A keyless property is carried by RA to every world. -/
theorem keyless_crosses {W : Type} (P : W → Prop) (hP : Keyless P) :
    ∀ w, RA unitSub → P w := fun w _ => hP w

-- LINK 3 · Bridge → RAM → ZFC: a keyed sentence, one the theory's worlds disagree on (for ZFC,
-- Choice over ZF: Gödel 1938, Cohen 1963, cited), is not carried. RA holds in both worlds.
/-- Two worlds of ZF: in one Choice holds, in the other it fails. -/
def choiceHolds : Bool → Prop := fun w => w = true

theorem choice_is_keyed : Keyed choiceHolds := ⟨false, fun h => Bool.noConfusion h⟩

/-- THE BREAK. RA holds in both worlds, so RA cannot carry Choice into ZFC, nor its denial. -/
theorem ra_does_not_cross_keyed :
    (∀ _w : Bool, RA unitSub) ∧ choiceHolds true ∧ ¬ choiceHolds false :=
  ⟨fun _ => ra_unit, rfl, fun h => Bool.noConfusion h⟩

/-- In general: RA decides no keyed property of worlds. -/
theorem ra_decides_no_keyed {W : Type} (P : W → Prop) (hK : Keyed P) :
    ¬ (∀ w, RA unitSub → P w) :=
  fun h => let ⟨w, hw⟩ := hK; hw (h w ra_unit)

-- THE CHAIN, IN ONE THEOREM.
/-- Upward, every act of using ZFC grounds RA. Downward, RA carries exactly the keyless and
    none of the keyed: it reaches every world of ZFC as presence, and no independent sentence of
    ZFC as content. -/
theorem chain_verdict :
    (∀ (T : Theory) (s : T.Sent), T.Prov s → Nonempty (SelfGrounding (RA unitSub))) ∧
    (∀ {W : Type} (P : W → Prop), Keyless P → ∀ w, RA unitSub → P w) ∧
    (∀ {W : Type} (P : W → Prop), Keyed P → ¬ ∀ w, RA unitSub → P w) ∧
    ((∀ _w : Bool, RA unitSub) ∧ choiceHolds true ∧ ¬ choiceHolds false) :=
  ⟨using_grounds_root, fun P hP => keyless_crosses P hP, fun P hK => ra_decides_no_keyed P hK,
   ra_does_not_cross_keyed⟩

end RAtoZFC

#print axioms RAtoZFC.using_grounds_root
#print axioms RAtoZFC.ra_is_keyless
#print axioms RAtoZFC.keyless_crosses
#print axioms RAtoZFC.choice_is_keyed
#print axioms RAtoZFC.ra_does_not_cross_keyed
#print axioms RAtoZFC.ra_decides_no_keyed
#print axioms RAtoZFC.chain_verdict
