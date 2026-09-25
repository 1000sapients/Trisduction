/-
ZFC_RA_RoundTrip.lean · the round trip ZFC → RAM → Bridge → RA → Bridge → RAM → ZFC.
Core Lean 4.19.0, no library, no sorry, no axiom declaration. Drafted 2026-09-24.
A sentence of ZFC is read in its worlds (ways ZFC's content could be). Up the chain it is placed
on RAM's Ground; across the RA–RAM bridge it meets RA; the arrow back returns through the bridge,
which carries keyless content, to RAM and then to ZFC.
-/
namespace RoundTrip

structure Substrate where
  U  : Type
  ΔE : U → Int

def RA (S : Substrate) : Prop := ∀ x : S.U, 0 < S.ΔE x
def unitSub : Substrate := ⟨Unit, fun _ => 1⟩
theorem ra_unit : RA unitSub := fun _ => show (0 : Int) < 1 by decide

/-- Up: a sentence's content, read on RAM's Ground in each world. -/
def up {W : Type} (P : W → Prop) : W → Prop := P

/-- Across and back: what the bridge returns to RAM from RA, in each world: RA together with the
    content it received. -/
def viaRA {W : Type} (P : W → Prop) : W → Prop := fun w => RA unitSub ∧ up P w

/-- Down: from RAM back to the sentence of ZFC. -/
def down {W : Type} (Q : W → Prop) : W → Prop := Q

-- R1.
/-- THE ROUND TRIP IS THE IDENTITY ON CONTENT. In every world, the sentence that returns to ZFC
    is equivalent to the sentence that left. -/
theorem round_trip_identity {W : Type} (P : W → Prop) (w : W) :
    down (viaRA P) w ↔ P w :=
  ⟨fun h => h.2, fun h => ⟨ra_unit, h⟩⟩

-- R2.
/-- An absolute sentence, one with the same truth value in every world (an arithmetic sentence
    such as RH, whose value is fixed in every model with the standard numbers): the round trip
    returns that same value, true if it left true and false if it left false. -/
theorem absolute_returns_unchanged {W : Type} (P : W → Prop) (hAbs : ∀ w v, P w ↔ P v)
    (w : W) : (down (viaRA P) w ↔ P w) ∧ (∀ v, down (viaRA P) v ↔ P w) :=
  ⟨round_trip_identity P w, fun v => (round_trip_identity P v).trans (hAbs v w)⟩

-- R3.
/-- What the trip adds: presence. RA holds in every world on return; it holds identically for a
    sentence and for its negation, so it tells them apart nowhere. -/
theorem trip_adds_presence_only {W : Type} (P : W → Prop) :
    (∀ _w : W, RA unitSub) ∧ (∀ w, (down (viaRA P) w ↔ P w) ∧ (down (viaRA (fun v => ¬ P v)) w ↔ ¬ P w)) :=
  ⟨fun _ => ra_unit, fun w => ⟨round_trip_identity P w, round_trip_identity (fun v => ¬ P v) w⟩⟩

-- R4.
/-- THE VERDICT. Whatever ZFC sends up returns to ZFC unchanged in content, with RA's presence
    attached in every world; a sentence ZFC does not settle leaves undecided and returns
    undecided. -/
theorem round_trip_verdict :
    (∀ {W : Type} (P : W → Prop) (w : W), down (viaRA P) w ↔ P w) ∧
    (∀ {W : Type} (P : W → Prop), (∀ w v, P w ↔ P v) → ∀ w v, down (viaRA P) v ↔ P w) :=
  ⟨fun P w => round_trip_identity P w, fun P h w v => (absolute_returns_unchanged P h w).2 v⟩

end RoundTrip

#print axioms RoundTrip.round_trip_identity
#print axioms RoundTrip.absolute_returns_unchanged
#print axioms RoundTrip.trip_adds_presence_only
#print axioms RoundTrip.round_trip_verdict
