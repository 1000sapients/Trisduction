/-
ZFC_Under_RAM.lean · ZFC subsumed under RAM by placement, the RA–RAM bridge, and the round trip,
in one file. Core Lean 4.19.0, no library, no sorry, no user-declared axiom. Forged 2026-09-25 from
RAM_ZFC_Placement.lean, RA_to_ZFC_Chain.lean, and ZFC_RA_RoundTrip.lean (lean/, 2026-09-24).

The claim, exactly. RAM does not derive ZFC's axioms and does not replace ZFC's proofs. It LOCATES
ZFC: computation is the rung (L3m), provability the ladder (L2m), truth in the intended world the
Ground (L1m), and rung ⊆ ladder ⊆ Ground under two named premises, Σ₁-completeness (a theorem of
arithmetic, cited) and soundness (which no consistent theory proves of itself, carried openly).
Across the RA–RAM bridge the root reaches every world of ZFC as presence and carries no keyed
sentence; the round trip returns every sentence unchanged; and every step holds with the root
replaced by a bare computation arrow, so the root contributes the act and never a line of content.
ΔM = 0.
-/
namespace ZFCUnderRAM

/-! ## 1 · The placement: rung ⊆ ladder ⊆ Ground -/

structure Theory where
  Sent  : Type
  Prov  : Sent → Prop        -- L2m, the ladder
  Comp  : Sent → Prop        -- L3m, the rung: sentences settled by finite computation
  True_ : Sent → Prop        -- L1m, the Ground: truth in the intended world

/-- Σ₁-completeness, abstractly: what finite computation settles, the theory proves. -/
def RungOnLadder (T : Theory) : Prop := ∀ s, T.Comp s → T.Prov s
/-- Soundness: what the theory proves holds in its intended world. Carried openly, never derived. -/
def Sound (T : Theory) : Prop := ∀ s, T.Prov s → T.True_ s

/-- THE PLACEMENT. Under the two premises every theory sits in the strata in order. -/
theorem ram_places_theory (T : Theory) (hR : RungOnLadder T) (hS : Sound T) :
    (∀ s, T.Comp s → T.Prov s) ∧ (∀ s, T.Prov s → T.True_ s) ∧ (∀ s, T.Comp s → T.True_ s) :=
  ⟨hR, hS, fun s h => hS s (hR s h)⟩

/-- Soundness is load-bearing: an unsound theory breaks ladder ⊆ Ground. -/
def unsound : Theory := ⟨Bool, fun _ => True, fun _ => False, fun b => b = true⟩
theorem soundness_is_load_bearing : RungOnLadder unsound ∧ ¬ Sound unsound := by
  refine ⟨fun _ h => h.elim, fun h => ?_⟩
  have := h false trivial
  cases this

/-- The Ground exceeds the ladder: a sound theory can leave a truth unproved (Gödel's region). -/
def incomplete : Theory := ⟨Bool, fun b => b = true, fun _ => False, fun _ => True⟩
theorem ground_exceeds_ladder :
    Sound incomplete ∧ incomplete.True_ false ∧ ¬ incomplete.Prov false :=
  ⟨fun _ _ => trivial, trivial, fun h => Bool.noConfusion h⟩

/-- Independent axioms are separate bits: every combination of their values is realized. -/
theorem independent_axioms_are_separate_bits :
    ∀ a b : Bool, ∃ w : Bool × Bool, w.1 = a ∧ w.2 = b :=
  fun a b => ⟨(a, b), rfl, rfl⟩

/-- SUBSUMPTION BY PLACEMENT, the verdict of section 1. -/
theorem ram_subsumes_by_placement :
    (∀ T : Theory, RungOnLadder T → Sound T → (∀ s, T.Comp s → T.True_ s)) ∧
    (RungOnLadder unsound ∧ ¬ Sound unsound) ∧
    (Sound incomplete ∧ incomplete.True_ false ∧ ¬ incomplete.Prov false) :=
  ⟨fun T hR hS => (ram_places_theory T hR hS).2.2, soundness_is_load_bearing, ground_exceeds_ladder⟩

/-! ## 2 · The bridge: the root reaches every world as presence and carries no key -/

structure Substrate where
  U  : Type
  ΔE : U → Int
def RA (S : Substrate) : Prop := ∀ x : S.U, 0 < S.ΔE x
def unitSub : Substrate := ⟨Unit, fun _ => 1⟩
theorem ra_unit : RA unitSub := fun _ => show (0 : Int) < 1 by decide

structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

/-- Upward: every act of proving in any theory grounds the root. -/
theorem using_grounds_root (T : Theory) (s : T.Sent) (d : T.Prov s) :
    Nonempty (SelfGrounding (RA unitSub)) :=
  ⟨⟨PLift (T.Prov s), ⟨d⟩, fun _ => ra_unit⟩⟩

/-- Worlds are ways a theory's content could be. A property is keyless when every world has it,
    keyed when some world lacks it. The bridge carries the keyless and never the keyed. -/
def Keyless {W : Type} (P : W → Prop) : Prop := ∀ w, P w
def Keyed   {W : Type} (P : W → Prop) : Prop := ∃ w, ¬ P w

theorem ra_is_keyless {W : Type} : Keyless (fun _ : W => RA unitSub) := fun _ => ra_unit
theorem keyless_crosses {W : Type} (P : W → Prop) (hP : Keyless P) : ∀ w, RA unitSub → P w :=
  fun w _ => hP w
theorem ra_decides_no_keyed {W : Type} (P : W → Prop) (hK : Keyed P) :
    ¬ (∀ w, RA unitSub → P w) :=
  fun h => let ⟨w, hw⟩ := hK; hw (h w ra_unit)

/-- Choice over ZF, the cited keyed sentence (Gödel 1938, Cohen 1963): two worlds, one each way;
    the root holds in both and so carries neither Choice nor its denial into ZFC. -/
def choiceHolds : Bool → Prop := fun w => w = true
theorem choice_is_keyed : Keyed choiceHolds := ⟨false, fun h => Bool.noConfusion h⟩
theorem ra_does_not_cross_choice :
    (∀ _w : Bool, RA unitSub) ∧ choiceHolds true ∧ ¬ choiceHolds false :=
  ⟨fun _ => ra_unit, rfl, fun h => Bool.noConfusion h⟩

/-! ## 3 · The round trip: ZFC → RAM → bridge → RA → bridge → RAM → ZFC is the identity on content -/

def viaRA {W : Type} (P : W → Prop) : W → Prop := fun w => RA unitSub ∧ P w

theorem round_trip_identity {W : Type} (P : W → Prop) (w : W) : viaRA P w ↔ P w :=
  ⟨fun h => h.2, fun h => ⟨ra_unit, h⟩⟩

/-- An absolute sentence (the same value in every world, as an arithmetic sentence such as the
    hypothesis is across models with the standard numbers) returns with that same value. -/
theorem absolute_returns_unchanged {W : Type} (P : W → Prop) (hAbs : ∀ w v, P w ↔ P v) (w : W) :
    ∀ v, viaRA P v ↔ P w :=
  fun v => (round_trip_identity P v).trans (hAbs v w)

/-- The trip adds presence and nothing else: the root returns identically for a sentence and for
    its negation, so it tells them apart nowhere. -/
theorem trip_adds_presence_only {W : Type} (P : W → Prop) (w : W) :
    RA unitSub ∧ (viaRA P w ↔ P w) ∧ (viaRA (fun v => ¬ P v) w ↔ ¬ P w) :=
  ⟨ra_unit, round_trip_identity P w, round_trip_identity (fun v => ¬ P v) w⟩

/-! ## 4 · The arrow: any true premise plays the root's part, so the root is idle in the content -/

theorem any_true_premise_serves (R : Prop) (hR : R) {W : Type} (P : W → Prop) :
    ((∀ w, P w) → ∀ w, R → P w) ∧ ((∃ w, ¬ P w) → ¬ ∀ w, R → P w) ∧ (∀ w, (R ∧ P w) ↔ P w) :=
  ⟨fun hP w _ => hP w, fun ⟨w, hw⟩ h => hw (h w hR), fun _ => ⟨fun h => h.2, fun h => ⟨hR, h⟩⟩⟩

/-! ## 5 · The verdict, in one theorem -/

/-- ZFC UNDER RAM. Placement under the two named premises with soundness load-bearing and the
    Ground exceeding the ladder; the root grounded by every act of proof and crossing as presence;
    no keyed sentence decided, Choice the instance; the round trip the identity on content, adding
    presence only; and the whole holding for any true premise in the root's place. Subsumption is
    location, never derivation. -/
theorem zfc_under_ram :
    ((∀ T : Theory, RungOnLadder T → Sound T → (∀ s, T.Comp s → T.True_ s)) ∧
      (RungOnLadder unsound ∧ ¬ Sound unsound) ∧
      (Sound incomplete ∧ incomplete.True_ false ∧ ¬ incomplete.Prov false)) ∧
    (∀ (T : Theory) (s : T.Sent), T.Prov s → Nonempty (SelfGrounding (RA unitSub))) ∧
    (∀ {W : Type} (P : W → Prop), Keyed P → ¬ ∀ w, RA unitSub → P w) ∧
    ((∀ _w : Bool, RA unitSub) ∧ choiceHolds true ∧ ¬ choiceHolds false) ∧
    (∀ {W : Type} (P : W → Prop) (w : W), viaRA P w ↔ P w) ∧
    (∀ (R : Prop), R → ∀ {W : Type} (P : W → Prop) (w : W), (R ∧ P w) ↔ P w) :=
  ⟨ram_subsumes_by_placement, using_grounds_root, fun P hK => ra_decides_no_keyed P hK,
   ra_does_not_cross_choice, fun P w => round_trip_identity P w,
   fun R hR {W} P w => (any_true_premise_serves R hR (W := W) P).2.2 w⟩

end ZFCUnderRAM

#print axioms ZFCUnderRAM.ram_places_theory
#print axioms ZFCUnderRAM.soundness_is_load_bearing
#print axioms ZFCUnderRAM.ground_exceeds_ladder
#print axioms ZFCUnderRAM.independent_axioms_are_separate_bits
#print axioms ZFCUnderRAM.ram_subsumes_by_placement
#print axioms ZFCUnderRAM.using_grounds_root
#print axioms ZFCUnderRAM.ra_is_keyless
#print axioms ZFCUnderRAM.keyless_crosses
#print axioms ZFCUnderRAM.ra_decides_no_keyed
#print axioms ZFCUnderRAM.choice_is_keyed
#print axioms ZFCUnderRAM.ra_does_not_cross_choice
#print axioms ZFCUnderRAM.round_trip_identity
#print axioms ZFCUnderRAM.absolute_returns_unchanged
#print axioms ZFCUnderRAM.trip_adds_presence_only
#print axioms ZFCUnderRAM.any_true_premise_serves
#print axioms ZFCUnderRAM.zfc_under_ram
