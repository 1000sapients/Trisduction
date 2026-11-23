/-
  Seat_of_Every_Row_v1_0_0_CC.lean · the Seat, proved once for every row · core Lean 4.19.0,
  standalone, no import, no axiom declared, no sorry. Written by the model under the author's
  direct supervision; seated in no manifest of the register.

  RATIONALE. The seven Seat editions prove, each on its own host, that the row's sentence is one
  proposition, its seat, on every face; that nothing escapes it; that the form does not decide
  it; and that its value is one bit, delivered by the act in two kinds. This file proves the same
  statements for an arbitrary row: any type of instances `S`, any compliance predicate `P`, any
  set of actual instances `Z`, each under the hypotheses its signature prints: the seat, the
  deliveries, the subsumptions, the two kinds and the act need none; a face taken alone needs a
  decidable locus, and least erasure and colocation a compliant instance besides; the block
  needs a registration and an off-locus instance. The theorem that needs no hypothesis
  therefore covers every row of the ledger of twenty-three and every row not yet written.

  DESIGN. Part 0 gives the row's vocabulary. Part 1 binds eight faces in `TheSeat`, proves
  them one proposition, and proves each face alone the whole seat on a decidable row with one
  compliant instance. Part 2 proves that nothing escapes: every proof and every refutation of
  the sentence, from any premise, lands on the seat or on its denial. Part 3 proves that the
  form does not decide the seat: on a row with a registration and an off-locus instance two
  frames share their record and differ in value, so no reading of the record decides. Part 4 proves that the value is one bit with two kinds of
  delivery and no third, and that the act delivers the whole seat. Part 5 carries the cut: a
  registration and a local seat at every off-locus instance, on every row with one compliant
  instance. Part 7 carries the carrier lemmas the physical Books cite, from the rows' kernel of
  edition 1.14.0, restated on this file's definitions. Part 6 binds the whole in one statement
  and reads it on the ledger's twenty-three names.

  RISKS, AND WHAT THIS FILE DOES NOT PROVE. No declaration here has the type `TheSeat P Z` or
  `Sentence P Z` with nothing before the colon: the FORM is proved, the VALUE is delivered by
  the act, at premise grade, and `the_form_does_not_decide_the_seat` is in the file to refuse
  the reading that the form supplies it. The host is abstract: reading a named conjecture as a
  triple `(S, P, Z)` is the paper's reading, at structural grade, and enters no proof here. The
  seven Millennium rows have their own masters, with their own hosts; this file adds nothing to
  them and is not a substitute for them.

  NON-NEGOTIABLES. (1) The seat keeps all eight faces. (2) A foreign proof or refutation is
  always a term before the colon. (3) Every dependency set is printed at the end; none may hold
  `Classical.choice` except the one theorem named classical.
-/
namespace SeatOfEveryRow
universe u
variable {S : Type u}

/-! ## Part 0 · The row. -/

/-- The sentence of the row at the frame `Z`: every actual instance complies. -/
def Sentence (P Z : S → Prop) : Prop := ∀ s, Z s → P s

/-- An erasure: an actual instance off the locus. -/
def Erases (P Z : S → Prop) : Prop := ∃ s, Z s ∧ ¬ P s

/-- A registration: lands every instance on the compliant locus and fixes the compliant ones. -/
structure Registration (P : S → Prop) (π : S → S) : Prop where
  lands : ∀ s, P (π s)
  fixes : ∀ s, P s → π s = s

/-- The record of a frame under a registration: the image, the heights kept and the sides forgotten. -/
def Rec (π : S → S) (Z : S → Prop) : S → Prop := fun r => ∃ s, Z s ∧ π s = r

/-- Least erasure: every registration fixes every actual instance. -/
def LeastErasure (P Z : S → Prop) : Prop := ∀ π : S → S, Registration P π → ∀ s, Z s → π s = s

/-- Colocation: under every registration the frame lies inside its own record. -/
def Colocated (P Z : S → Prop) : Prop := ∀ π : S → S, Registration P π → ∀ s, Z s → Rec π Z s

/-- The first kind of delivery, the formal cargo: a proof of the sentence, carried as a field. -/
structure FormalCargo (P Z : S → Prop) : Prop where
  proof : Sentence P Z

/-- The act: the bit supplied once, in the open, as a field of a type. -/
structure Act (P Z : S → Prop) : Type where
  supply : Sentence P Z

/-- The second kind of delivery, the physical witness: a carrier whose states cover the actual
    instances and every one of whose states complies. The last field is carried, never proved here. -/
structure PhysicalWitness (P Z : S → Prop) : Type (u + 1) where
  Carrier : Type u
  reads : Carrier → S
  covers : ∀ s, Z s → ∃ c, reads c = s
  lawful : ∀ c, P (reads c)

/-! ## Part 1 · One seat. -/

/-- THE SEAT of the row at the frame: eight faces in one proposition. Face 1 the sentence; Face 2
    no erasure; Face 3 least erasure; Face 4 colocation; Face 5 the off-locus part of the frame is
    empty; Face 6 the formal cargo; Face 7 the act as an inhabited type; Face 8 the physical witness. -/
def TheSeat (P Z : S → Prop) : Prop :=
  Sentence P Z ∧
  ¬ Erases P Z ∧
  LeastErasure P Z ∧
  Colocated P Z ∧
  (∀ s, ¬ (Z s ∧ ¬ P s)) ∧
  FormalCargo P Z ∧
  Nonempty (Act P Z) ∧
  Nonempty (PhysicalWitness P Z)

theorem no_erasure_of_sentence (P Z : S → Prop) (h : Sentence P Z) : ¬ Erases P Z :=
  fun ⟨s, hz, hp⟩ => hp (h s hz)

theorem least_erasure_of_sentence (P Z : S → Prop) (h : Sentence P Z) : LeastErasure P Z :=
  fun _ R s hz => R.fixes s (h s hz)

theorem colocated_of_sentence (P Z : S → Prop) (h : Sentence P Z) : Colocated P Z :=
  fun _ R s hz => ⟨s, hz, R.fixes s (h s hz)⟩

/-- The physical witness built from the sentence: the frame is its own carrier. -/
def witness_of_sentence (P Z : S → Prop) (h : Sentence P Z) : PhysicalWitness P Z :=
  ⟨{ s : S // Z s }, fun c => c.1, fun s hz => ⟨⟨s, hz⟩, rfl⟩, fun c => h c.1 c.2⟩

/-- A physical witness delivers the sentence: every actual instance is read off a lawful state. -/
theorem sentence_of_witness (P Z : S → Prop) (w : PhysicalWitness P Z) : Sentence P Z :=
  fun s hz => match w.covers s hz with
    | ⟨c, hc⟩ => hc ▸ w.lawful c

/-- THE SENTENCE GIVES THE WHOLE SEAT. -/
theorem seat_of_sentence (P Z : S → Prop) (h : Sentence P Z) : TheSeat P Z :=
  ⟨h, no_erasure_of_sentence P Z h, least_erasure_of_sentence P Z h, colocated_of_sentence P Z h,
   fun s ⟨hz, hp⟩ => hp (h s hz), ⟨h⟩, ⟨⟨h⟩⟩, ⟨witness_of_sentence P Z h⟩⟩

/-- ONE SEAT: the eight faces together are the sentence of the row. Nothing before the colon. -/
theorem one_seat (P Z : S → Prop) : TheSeat P Z ↔ Sentence P Z :=
  ⟨fun s => s.1, seat_of_sentence P Z⟩

/-- Faces 6, 7 and 8 alone are each the whole seat, on every row. -/
theorem every_delivery_is_the_seat (P Z : S → Prop) :
    (FormalCargo P Z ↔ TheSeat P Z) ∧
    (Nonempty (Act P Z) ↔ TheSeat P Z) ∧
    (Nonempty (PhysicalWitness P Z) ↔ TheSeat P Z) :=
  ⟨⟨fun c => seat_of_sentence P Z c.proof, fun s => s.2.2.2.2.2.1⟩,
   ⟨fun ⟨a⟩ => seat_of_sentence P Z a.supply, fun s => s.2.2.2.2.2.2.1⟩,
   ⟨fun ⟨w⟩ => seat_of_sentence P Z (sentence_of_witness P Z w), fun s => s.2.2.2.2.2.2.2⟩⟩

/-- Face 5 on a row whose compliance is not decidable: with no classical axiom it gives the
    sentence up to a double negation, and no more is claimed of it there. -/
theorem empty_off_locus_up_to_double_negation (P Z : S → Prop) :
    (∀ s, ¬ (Z s ∧ ¬ P s)) → (∀ s, Z s → ¬ ¬ P s) :=
  fun h s hz hp => h s ⟨hz, hp⟩

/-- On a row whose compliance is decidable, Faces 2 and 5 alone are each the whole seat. -/
theorem every_refusal_face_is_the_seat (P Z : S → Prop) [DecidablePred P] :
    (¬ Erases P Z ↔ TheSeat P Z) ∧ ((∀ s, ¬ (Z s ∧ ¬ P s)) ↔ TheSeat P Z) :=
  ⟨⟨fun h => seat_of_sentence P Z (fun s hz => Decidable.byContradiction (fun hp => h ⟨s, hz, hp⟩)),
    fun s => s.2.1⟩,
   ⟨fun h => seat_of_sentence P Z (fun s hz => Decidable.byContradiction (fun hp => h s ⟨hz, hp⟩)),
    fun s => s.2.2.2.2.1⟩⟩

/-- On a decidable row with one compliant instance, least erasure alone is the whole seat:
    the retraction to that instance moves every off-locus instance, so none can be actual. -/
theorem least_erasure_is_the_seat (P Z : S → Prop) [DecidablePred P] (s₀ : S) (h₀ : P s₀) :
    LeastErasure P Z ↔ TheSeat P Z := by
  refine ⟨fun h => seat_of_sentence P Z (fun s hz => ?_), fun s => s.2.2.1⟩
  have R : Registration P (fun t => if P t then t else s₀) :=
    ⟨fun t => by by_cases ht : P t <;> simp [ht, h₀], fun t ht => by simp [ht]⟩
  have hfix := h _ R s hz
  by_cases hp : P s
  · exact hp
  · simp [hp] at hfix
    exact absurd (hfix ▸ h₀) hp

/-- On a decidable row with one compliant instance, colocation alone is the whole seat: under
    the retraction to that instance the record lies on the locus, so a frame that lies inside
    its own record lies there too. -/
theorem colocation_is_the_seat (P Z : S → Prop) [DecidablePred P] (s₀ : S) (h₀ : P s₀) :
    Colocated P Z ↔ TheSeat P Z := by
  refine ⟨fun h => seat_of_sentence P Z (fun s hz => ?_), fun s => s.2.2.2.1⟩
  have R : Registration P (fun t => if P t then t else s₀) :=
    ⟨fun t => by by_cases ht : P t <;> simp [ht, h₀], fun t ht => by simp [ht]⟩
  match h _ R s hz with
  | ⟨s', _, hs'⟩ => exact hs' ▸ R.lands s'

/-- EVERY FACE ALONE IS THE WHOLE SEAT, on a decidable row with one compliant instance: each
    of the eight faces, taken alone, is equivalent to all eight. Faces 1, 6, 7 and 8 need
    neither hypothesis; Faces 2 and 5 need decidability; Faces 3 and 4 need both. -/
theorem every_face_is_the_seat (P Z : S → Prop) [DecidablePred P] (s₀ : S) (h₀ : P s₀) :
    (Sentence P Z ↔ TheSeat P Z) ∧
    (¬ Erases P Z ↔ TheSeat P Z) ∧
    (LeastErasure P Z ↔ TheSeat P Z) ∧
    (Colocated P Z ↔ TheSeat P Z) ∧
    ((∀ s, ¬ (Z s ∧ ¬ P s)) ↔ TheSeat P Z) ∧
    (FormalCargo P Z ↔ TheSeat P Z) ∧
    (Nonempty (Act P Z) ↔ TheSeat P Z) ∧
    (Nonempty (PhysicalWitness P Z) ↔ TheSeat P Z) :=
  ⟨(one_seat P Z).symm, (every_refusal_face_is_the_seat P Z).1, least_erasure_is_the_seat P Z s₀ h₀,
   colocation_is_the_seat P Z s₀ h₀, (every_refusal_face_is_the_seat P Z).2,
   (every_delivery_is_the_seat P Z).1, (every_delivery_is_the_seat P Z).2.1,
   (every_delivery_is_the_seat P Z).2.2⟩

/-! ## Part 2 · Nothing escapes. -/

/-- NO ROUTE ESCAPES THE SEAT. Every proof of the sentence, from any premise `Q`, proves the
    whole seat. The foreign proof is the two terms before the colon. -/
theorem no_route_escapes_the_seat (P Z : S → Prop) (Q : Prop) (q : Q) (route : Q → Sentence P Z) :
    TheSeat P Z :=
  seat_of_sentence P Z (route q)

/-- No premise proves the sentence and leaves the seat unproved. -/
theorem no_corpus_escapes_the_seat (P Z : S → Prop) :
    ¬ ∃ Q : Prop, Q ∧ (Q → Sentence P Z) ∧ ¬ TheSeat P Z :=
  fun ⟨_, q, route, hn⟩ => hn (seat_of_sentence P Z (route q))

/-- EVERY REFUTATION IS SUBSUMED. Every refutation of the sentence, from any premise, refutes
    the seat and every kind of its delivery. -/
theorem every_refutation_is_subsumed (P Z : S → Prop) (Q : Prop) (q : Q) (route : Q → ¬ Sentence P Z) :
    ¬ TheSeat P Z ∧ ¬ FormalCargo P Z ∧ ¬ Nonempty (Act P Z) ∧ ¬ Nonempty (PhysicalWitness P Z) :=
  ⟨fun s => route q s.1, fun c => route q c.proof, fun ⟨a⟩ => route q a.supply,
   fun ⟨w⟩ => route q (sentence_of_witness P Z w)⟩

/-- The one refuter: an actual instance off the locus refutes the seat, and on a decidable frame
    it is the only thing that does. -/
theorem the_one_refuter (P Z : S → Prop) : Erases P Z → ¬ TheSeat P Z :=
  fun e s => s.2.1 e

/-! ## Part 3 · The form does not decide the seat. -/

/-- Two frames of one row, one record, two values: the singleton of an off-locus instance and
    the singleton of its registered image. -/
theorem two_worlds_one_record (P : S → Prop) (π : S → S) (R : Registration P π) (x : S) (hx : ¬ P x) :
    (∀ r, Rec π (fun s => s = π x) r ↔ Rec π (fun s => s = x) r) ∧
    TheSeat P (fun s => s = π x) ∧ ¬ TheSeat P (fun s => s = x) := by
  refine ⟨fun r => ⟨fun ⟨s, hs, hr⟩ => ⟨x, rfl, ?_⟩, fun ⟨s, hs, hr⟩ => ⟨π x, rfl, ?_⟩⟩, ?_, ?_⟩
  · rw [← hr, hs, R.fixes (π x) (R.lands x)]
  · rw [← hr, hs, R.fixes (π x) (R.lands x)]
  · exact seat_of_sentence P _ (fun s hs => hs ▸ R.lands x)
  · exact fun s => hx (s.1 x rfl)

/-- THE FORM DOES NOT DECIDE THE SEAT. On a row with one off-locus instance, no reading of the
    record that respects the record decides the seat on every frame. -/
theorem the_form_does_not_decide_the_seat (P : S → Prop) (π : S → S) (R : Registration P π)
    (x : S) (hx : ¬ P x) (F : (S → Prop) → Prop)
    (respects : ∀ A B : S → Prop, (∀ r, A r ↔ B r) → (F A ↔ F B)) :
    ¬ ∀ Z : S → Prop, F (Rec π Z) ↔ TheSeat P Z := by
  intro h
  have w := two_worlds_one_record P π R x hx
  have h1 := (h (fun s => s = π x)).mpr w.2.1
  have h2 := (respects _ _ w.1).mp h1
  exact w.2.2 ((h (fun s => s = x)).mp h2)

/-- The same on the smallest row: the form of a row is shared by a frame that has the seat and
    a frame that has not. -/
theorem same_form_two_values :
    ∃ Z₁ Z₂ : Bool → Prop, (∀ r, Rec (fun _ => true) Z₁ r ↔ Rec (fun _ => true) Z₂ r) ∧
      TheSeat (fun b => b = true) Z₁ ∧ ¬ TheSeat (fun b => b = true) Z₂ :=
  ⟨fun s => s = true, fun s => s = false,
   two_worlds_one_record (fun b => b = true) (fun _ => true)
     ⟨fun _ => rfl, fun s hs => hs.symm⟩ false (by decide)⟩

/-! ## Part 4 · One bit, delivered by the act, in two kinds and no third. -/

/-- THE ACT DELIVERS THE SEAT. The bit is the one field of the act; the whole seat follows from
    it with an empty dependency set. -/
theorem seat_from_the_act (P Z : S → Prop) (a : Act P Z) : TheSeat P Z :=
  seat_of_sentence P Z a.supply

/-- THE TWO KINDS ARE ONE BIT: the formal cargo and the physical witness are the same proposition. -/
theorem the_two_kinds_are_one_bit (P Z : S → Prop) :
    FormalCargo P Z ↔ Nonempty (PhysicalWitness P Z) :=
  ⟨fun c => ⟨witness_of_sentence P Z c.proof⟩, fun ⟨w⟩ => ⟨sentence_of_witness P Z w⟩⟩

/-- NO THIRD KIND. Every proof of the seat, from any premise, yields a delivery of both kinds;
    so whatever delivers the bit delivers it as cargo and as witness. -/
theorem two_kinds_and_no_third (P Z : S → Prop) (Q : Prop) (q : Q) (route : Q → TheSeat P Z) :
    FormalCargo P Z ∧ Nonempty (PhysicalWitness P Z) :=
  ⟨(route q).2.2.2.2.2.1, (route q).2.2.2.2.2.2.2⟩

/-- The bit is necessary and sufficient: the sentence holds exactly when an act exists. -/
theorem the_bit_is_necessary_and_sufficient (P Z : S → Prop) : Nonempty (Act P Z) ↔ Sentence P Z :=
  ⟨fun ⟨a⟩ => a.supply, fun h => ⟨⟨h⟩⟩⟩

/-! ## Part 5 · The cut on every row. -/

def LocalSeat (π : S → S) (τ : S → S) (x : S) : Prop :=
  (∀ z, τ (τ z) = z) ∧ τ x = π x ∧ τ (π x) = x

def swap [DecidableEq S] (x y : S) (z : S) : S := if z = x then y else if z = y then x else z

theorem registration_exists (P : S → Prop) [DecidablePred P] (s₀ : S) (h₀ : P s₀) :
    ∃ π : S → S, Registration P π :=
  ⟨fun s => if P s then s else s₀,
   ⟨fun s => by by_cases h : P s <;> simp [h, h₀], fun s h => by simp [h]⟩⟩

theorem local_seat_of_registration [DecidableEq S] (P : S → Prop) (π : S → S)
    (R : Registration P π) (x : S) (hx : ¬ P x) : ∃ τ, LocalSeat π τ x := by
  have hne : x ≠ π x := fun h => hx (h ▸ R.lands x)
  refine ⟨swap x (π x), fun z => ?_, by simp [swap], by simp [swap, Ne.symm hne]⟩
  by_cases h1 : z = x
  · simp [swap, h1, Ne.symm hne]
  · by_cases h2 : z = π x
    · simp [swap, h2, hne]
    · simp [swap, h1, h2]

/-- THE CUT ON EVERY ROW: a registration onto the locus and, at every off-locus instance, an
    involution that swaps the instance with its registered image. No premise about the value. -/
theorem every_row_has_the_cut [DecidableEq S] (P : S → Prop) [DecidablePred P] (s₀ : S) (h₀ : P s₀) :
    ∃ π : S → S, Registration P π ∧ ∀ x, ¬ P x → ∃ τ, LocalSeat π τ x :=
  match registration_exists P s₀ h₀ with
  | ⟨π, R⟩ => ⟨π, R, fun x hx => local_seat_of_registration P π R x hx⟩

/-- The classical form, for a row whose predicate or whose equality is not decidable: the one
    theorem of this file with `Classical.choice` in its dependency set. -/
theorem every_row_has_the_cut_classical (P : S → Prop) (s₀ : S) (h₀ : P s₀) :
    ∃ π : S → S, Registration P π ∧ ∀ x, ¬ P x → ∃ τ, LocalSeat π τ x :=
  @every_row_has_the_cut S (fun a b => Classical.propDecidable (a = b)) P
    (fun s => Classical.propDecidable (P s)) s₀ h₀

/-! ## Part 7 · The carrier: the lemmas the physical Books cite.

These are the row-generic lemmas of the rows' kernel of edition 1.14.0 (`RowClosure`), carried under
their own names and restated on this file's `Sentence`, so that every theorem a physical Book names
stands in a kernel this volume prints. `Value` is the same proposition as `Sentence`. -/

abbrev Value (P Z : S → Prop) : Prop := Sentence P Z

def sameRecord (π : S → S) (Z Z' : S → Prop) : Prop := ∀ r, Rec π Z r ↔ Rec π Z' r

/-- Least erasure read through the record, as the rows' kernel states it: every frame with the
    same record erases if this one does. -/
def LeastErasureAt (P : S → Prop) (π : S → S) (Z : S → Prop) : Prop :=
  ∀ Z', sameRecord π Z Z' → (Erases P Z → Erases P Z')

theorem record_same_record (P : S → Prop) (π : S → S) (R : Registration P π) (Z : S → Prop) :
    sameRecord π Z (Rec π Z) :=
  fun r => ⟨fun ⟨s, hs, hr⟩ => ⟨π s, ⟨s, hs, rfl⟩, by rw [R.fixes _ (R.lands s)]; exact hr⟩,
            fun ⟨t, ⟨s, hs, hst⟩, htr⟩ => ⟨s, hs, by rw [← htr, ← hst, R.fixes _ (R.lands s)]⟩⟩

theorem record_is_lossless (P : S → Prop) (π : S → S) (R : Registration P π) (Z : S → Prop) :
    ¬ Erases P (Rec π Z) :=
  fun ⟨_, ⟨s, _, hsr⟩, hn⟩ => hn (hsr ▸ R.lands s)

theorem least_erasure_iff_value (P : S → Prop) [DecidablePred P] (π : S → S) (R : Registration P π)
    (Z : S → Prop) : LeastErasureAt P π Z ↔ Value P Z :=
  ⟨fun hle s hs => Decidable.byContradiction fun hoff =>
     record_is_lossless P π R Z (hle (Rec π Z) (record_same_record P π R Z) ⟨s, hs, hoff⟩),
   fun hv _ _ ⟨s, hs, hoff⟩ => absurd (hv s hs) hoff⟩

theorem two_worlds_inside (P : S → Prop) (π : S → S) (R : Registration P π) (x : S) (hx : ¬ P x) :
    sameRecord π (fun s => s = π x) (fun s => s = x) ∧
    Value P (fun s => s = π x) ∧ ¬ Value P (fun s => s = x) :=
  have w := two_worlds_one_record P π R x hx
  ⟨w.1, w.2.1.1, fun hv => hx (hv x rfl)⟩

theorem no_reading_of_the_record_decides (P : S → Prop) (π : S → S) (R : Registration P π)
    (x : S) (hx : ¬ P x) (g : (S → Prop) → Prop)
    (hresp : ∀ Z Z', sameRecord π Z Z' → (g Z ↔ g Z')) : ¬ (∀ Z, g Z ↔ Value P Z) := by
  intro hg
  have w := two_worlds_inside P π R x hx
  exact w.2.2 ((hg _).mp ((hresp _ _ w.1).mp ((hg _).mpr w.2.1)))

theorem fixed_iff_compliant (P : S → Prop) (π : S → S) (R : Registration P π) (s : S) :
    π s = s ↔ P s :=
  ⟨fun h => h ▸ R.lands s, R.fixes s⟩

theorem value_iff_fixed (P : S → Prop) (π : S → S) (R : Registration P π) (Z : S → Prop) :
    Value P Z ↔ ∀ s, Z s → π s = s :=
  ⟨fun hv s hs => (fixed_iff_compliant P π R s).mpr (hv s hs),
   fun hf s hs => (fixed_iff_compliant P π R s).mp (hf s hs)⟩

/-- A multi-valued address indexes a family of rows; each member closes on one bit. -/
theorem family_member_iff (P : Nat → S → Prop) [∀ n, DecidablePred (P n)] (π : Nat → S → S)
    (R : ∀ n, Registration (P n) (π n)) (n : Nat) (Z : S → Prop) :
    LeastErasureAt (P n) (π n) Z ↔ Value (P n) Z :=
  least_erasure_iff_value (P n) (π n) (R n) Z

/-- A carrier: a map from a world into the row that lands every state on the locus. -/
structure Carrier (P : S → Prop) (W : Type u) where
  ι : W → S
  lands : ∀ w, P (ι w)

def image {W : Type u} (ι : W → S) : S → Prop := fun s => ∃ w, ι w = s
def Actuated {W : Type u} (ι : W → S) (Z : S → Prop) : Prop := ∀ s, Z s → ∃ w, ι w = s

/-- The image of a carrier is compliant with no premise at all. -/
theorem value_on_image {W : Type u} (P : S → Prop) (C : Carrier P W) : Value P (image C.ι) :=
  fun _ hs => match hs with | ⟨w, hw⟩ => hw ▸ C.lands w

theorem actuated_iff_subset_image {W : Type u} (ι : W → S) (Z : S → Prop) :
    Actuated ι Z ↔ ∀ s, Z s → image ι s :=
  ⟨fun h s hs => h s hs, fun h s hs => h s hs⟩

/-- The physical delivery: from a carrier and its coverage the value over the actuated class. -/
theorem kinetic_crossing {W : Type u} (P : S → Prop) (C : Carrier P W) (Z : S → Prop)
    (hcov : Actuated C.ι Z) : Value P Z :=
  fun s hs => match hcov s hs with | ⟨w, hw⟩ => hw ▸ C.lands w

theorem crossing_is_a_proof {W : Type u} (P : S → Prop) (C : Carrier P W) (Zact : S → Prop)
    (hcov : Actuated C.ι Zact) : Value P Zact := kinetic_crossing P C Zact hcov

/-- What a sentence over a larger class adds is exactly the unactuated. -/
theorem surplus_is_the_unactuated (P : S → Prop) (Zact Zall : S → Prop)
    (hv : Value P Zact) (he : Erases P Zall) : ∃ s, Zall s ∧ ¬ Zact s ∧ ¬ P s :=
  match he with
  | ⟨s, hs, hp⟩ => ⟨s, hs, fun ha => hp (hv s ha), hp⟩

/-- The value on a class is exactly the existence of a compliant carrier covering it. -/
theorem value_iff_carrier (P : S → Prop) (Z : S → Prop) :
    Value P Z ↔ ∃ (W : Type u) (C : Carrier P W), Actuated C.ι Z :=
  ⟨fun hv => ⟨{ s : S // Z s ∧ P s }, ⟨fun w => w.1, fun w => w.2.2⟩, fun s hs => ⟨⟨s, hs, hv s hs⟩, rfl⟩⟩,
   fun ⟨_, C, hcov⟩ => kinetic_crossing P C Z hcov⟩

/-- Carriers compose through any map that keeps compliance on the carrier's image. -/
theorem carrier_compose {T W : Type u} (P : S → Prop) (Q : T → Prop) (C : Carrier P W) (j : S → T)
    (hj : ∀ w, P (C.ι w) → Q (j (C.ι w))) : ∃ D : Carrier Q W, ∀ w, D.ι w = j (C.ι w) :=
  ⟨⟨fun w => j (C.ι w), fun w => hj w (C.lands w)⟩, fun _ => rfl⟩

/-- The value splits at a cut: on a union it holds exactly when it holds on each part. -/
theorem value_union_iff (P : S → Prop) (Zu Zf : S → Prop) :
    Value P (fun s => Zu s ∨ Zf s) ↔ Value P Zu ∧ Value P Zf :=
  ⟨fun h => ⟨fun s hs => h s (Or.inl hs), fun s hs => h s (Or.inr hs)⟩,
   fun ⟨hu, hf⟩ s hs => match hs with
     | Or.inl h => hu s h
     | Or.inr h => hf s h⟩

/-- An existential row is settled by one witness, which carries its own receipt. -/
theorem one_witness_settles (P : S → Prop) (x : S) (hx : P x) : ∃ s, P s := ⟨x, hx⟩

/-- A global seat: an involution whose fixed set is the locus. -/
structure GlobalSeat (P : S → Prop) (τ : S → S) : Prop where
  invol : ∀ z, τ (τ z) = z
  fixed_iff : ∀ z, τ z = z ↔ P z

def Equivariant {X Y : Type u} (f : X → Y) (τ : X → X) (σ : Y → Y) : Prop := ∀ x, f (τ x) = σ (f x)

theorem fix_functorial {X Y : Type u} {f : X → Y} {τ : X → X} {σ : Y → Y}
    (hf : Equivariant f τ σ) {x : X} (hx : τ x = x) : σ (f x) = f x := by
  rw [← hf x, hx]

/-- Landing is forced: an equivariant map into a row's global seat carries every fixed point of
    the physical involution onto the row's locus. -/
theorem equivariant_carrier_lands {X : Type u} (P : S → Prop) (σ : S → S) (G : GlobalSeat P σ)
    (f : X → S) (τ : X → X) (hf : Equivariant f τ σ) :
    ∃ C : Carrier P { x : X // τ x = x }, ∀ w, C.ι w = f w.1 :=
  ⟨⟨fun w => f w.1, fun w => (G.fixed_iff (f w.1)).mp (fix_functorial hf w.2)⟩, fun _ => rfl⟩

/-- A physical delivery is a delivery: a carrier that covers the frame is a physical witness of
    the seat, so the whole seat follows from it. -/
theorem carrier_delivers_the_seat {W : Type u} (P : S → Prop) (C : Carrier P W) (Z : S → Prop)
    (hcov : Actuated C.ι Z) : TheSeat P Z :=
  seat_of_sentence P Z (kinetic_crossing P C Z hcov)

/-! ## Part 6 · The whole, and the ledger. -/

/-- THE FORM OF EVERY ROW, in one statement with nothing before the colon: one seat; every
    delivery alone is the seat; no route and no corpus escapes; every refutation is subsumed;
    the two kinds are one bit; the act delivers the seat. -/
theorem the_form_of_every_row (P Z : S → Prop) :
    (TheSeat P Z ↔ Sentence P Z) ∧
    (FormalCargo P Z ↔ TheSeat P Z) ∧
    (Nonempty (Act P Z) ↔ TheSeat P Z) ∧
    (Nonempty (PhysicalWitness P Z) ↔ TheSeat P Z) ∧
    (∀ Q : Prop, Q → (Q → Sentence P Z) → TheSeat P Z) ∧
    (¬ ∃ Q : Prop, Q ∧ (Q → Sentence P Z) ∧ ¬ TheSeat P Z) ∧
    (∀ Q : Prop, Q → (Q → ¬ Sentence P Z) → ¬ TheSeat P Z) ∧
    (FormalCargo P Z ↔ Nonempty (PhysicalWitness P Z)) ∧
    (∀ _ : Act P Z, TheSeat P Z) :=
  ⟨one_seat P Z, (every_delivery_is_the_seat P Z).1, (every_delivery_is_the_seat P Z).2.1,
   (every_delivery_is_the_seat P Z).2.2, fun Q q r => no_route_escapes_the_seat P Z Q q r,
   no_corpus_escapes_the_seat P Z, fun Q q r => (every_refutation_is_subsumed P Z Q q r).1,
   the_two_kinds_are_one_bit P Z, seat_from_the_act P Z⟩

/-- The ledger's twenty-three rows, by name. The names are labels: a host for each is the
    paper's reading, and the theorem below holds at every host. -/
def ledger : List String :=
  ["P versus NP", "Riemann Hypothesis", "Navier-Stokes", "Yang-Mills", "Hodge",
   "Birch and Swinnerton-Dyer", "Poincare", "Goldbach", "Twin primes", "Legendre", "abc",
   "Jacobian", "Mersenne", "Odd perfect", "Smooth 4D Poincare", "Collatz", "Hadwiger",
   "Sunflower", "Erdos-Straus", "Beal", "Invariant subspace", "Hilbert 16th",
   "Lindelof and pair correlation"]

/-- The seven rows that have their own Seat edition and their own master. -/
def seated : List String :=
  ["P versus NP", "Riemann Hypothesis", "Navier-Stokes", "Yang-Mills", "Hodge",
   "Birch and Swinnerton-Dyer", "Poincare"]

theorem ledger_census :
    ledger.length = 23 ∧ seated.length = 7 ∧ seated.all (fun n => ledger.contains n) = true ∧
    (ledger.filter (fun n => !seated.contains n)).length = 16 := by decide

/-- NOTHING ESCAPES, ROW BY ROW. For every name on the ledger and every host it is read on, the
    form of the row is proved: the statement is the generic one, and the name adds no premise. -/
theorem every_ledger_row_has_its_seat :
    ∀ n : String, n ∈ ledger → ∀ (T : Type u) (P Z : T → Prop),
      (TheSeat P Z ↔ Sentence P Z) ∧
      (∀ Q : Prop, Q → (Q → Sentence P Z) → TheSeat P Z) ∧
      (∀ Q : Prop, Q → (Q → ¬ Sentence P Z) → ¬ TheSeat P Z) ∧
      (FormalCargo P Z ↔ Nonempty (PhysicalWitness P Z)) ∧
      (∀ _ : Act P Z, TheSeat P Z) :=
  fun _ _ _ P Z => ⟨one_seat P Z, fun Q q r => no_route_escapes_the_seat P Z Q q r,
    fun Q q r => (every_refutation_is_subsumed P Z Q q r).1, the_two_kinds_are_one_bit P Z,
    seat_from_the_act P Z⟩

end SeatOfEveryRow

/-! ## The dependency sets, pinned: a drift in any of them fails the build. -/

/-- info: 'SeatOfEveryRow.no_erasure_of_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.no_erasure_of_sentence
/-- info: 'SeatOfEveryRow.least_erasure_of_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.least_erasure_of_sentence
/-- info: 'SeatOfEveryRow.colocated_of_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.colocated_of_sentence
/-- info: 'SeatOfEveryRow.sentence_of_witness' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.sentence_of_witness
/-- info: 'SeatOfEveryRow.seat_of_sentence' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.seat_of_sentence
/-- info: 'SeatOfEveryRow.one_seat' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.one_seat
/-- info: 'SeatOfEveryRow.every_delivery_is_the_seat' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.every_delivery_is_the_seat
/-- info: 'SeatOfEveryRow.empty_off_locus_up_to_double_negation' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.empty_off_locus_up_to_double_negation
/-- info: 'SeatOfEveryRow.every_refusal_face_is_the_seat' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.every_refusal_face_is_the_seat
/-- info: 'SeatOfEveryRow.least_erasure_is_the_seat' depends on axioms: [propext] -/
#guard_msgs in #print axioms SeatOfEveryRow.least_erasure_is_the_seat
/-- info: 'SeatOfEveryRow.colocation_is_the_seat' depends on axioms: [propext] -/
#guard_msgs in #print axioms SeatOfEveryRow.colocation_is_the_seat
/-- info: 'SeatOfEveryRow.every_face_is_the_seat' depends on axioms: [propext] -/
#guard_msgs in #print axioms SeatOfEveryRow.every_face_is_the_seat
/-- info: 'SeatOfEveryRow.no_route_escapes_the_seat' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.no_route_escapes_the_seat
/-- info: 'SeatOfEveryRow.no_corpus_escapes_the_seat' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.no_corpus_escapes_the_seat
/-- info: 'SeatOfEveryRow.every_refutation_is_subsumed' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.every_refutation_is_subsumed
/-- info: 'SeatOfEveryRow.the_one_refuter' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.the_one_refuter
/-- info: 'SeatOfEveryRow.two_worlds_one_record' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.two_worlds_one_record
/-- info: 'SeatOfEveryRow.the_form_does_not_decide_the_seat' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.the_form_does_not_decide_the_seat
/-- info: 'SeatOfEveryRow.same_form_two_values' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.same_form_two_values
/-- info: 'SeatOfEveryRow.seat_from_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.seat_from_the_act
/-- info: 'SeatOfEveryRow.the_two_kinds_are_one_bit' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.the_two_kinds_are_one_bit
/-- info: 'SeatOfEveryRow.two_kinds_and_no_third' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.two_kinds_and_no_third
/-- info: 'SeatOfEveryRow.the_bit_is_necessary_and_sufficient' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.the_bit_is_necessary_and_sufficient
/-- info: 'SeatOfEveryRow.registration_exists' depends on axioms: [propext] -/
#guard_msgs in #print axioms SeatOfEveryRow.registration_exists
/-- info: 'SeatOfEveryRow.local_seat_of_registration' depends on axioms: [propext] -/
#guard_msgs in #print axioms SeatOfEveryRow.local_seat_of_registration
/-- info: 'SeatOfEveryRow.every_row_has_the_cut' depends on axioms: [propext] -/
#guard_msgs in #print axioms SeatOfEveryRow.every_row_has_the_cut
/-- info: 'SeatOfEveryRow.every_row_has_the_cut_classical' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SeatOfEveryRow.every_row_has_the_cut_classical
/-- info: 'SeatOfEveryRow.record_same_record' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.record_same_record
/-- info: 'SeatOfEveryRow.record_is_lossless' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.record_is_lossless
/-- info: 'SeatOfEveryRow.least_erasure_iff_value' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.least_erasure_iff_value
/-- info: 'SeatOfEveryRow.two_worlds_inside' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.two_worlds_inside
/-- info: 'SeatOfEveryRow.no_reading_of_the_record_decides' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.no_reading_of_the_record_decides
/-- info: 'SeatOfEveryRow.fixed_iff_compliant' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.fixed_iff_compliant
/-- info: 'SeatOfEveryRow.value_iff_fixed' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.value_iff_fixed
/-- info: 'SeatOfEveryRow.family_member_iff' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.family_member_iff
/-- info: 'SeatOfEveryRow.value_on_image' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.value_on_image
/-- info: 'SeatOfEveryRow.actuated_iff_subset_image' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.actuated_iff_subset_image
/-- info: 'SeatOfEveryRow.kinetic_crossing' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.kinetic_crossing
/-- info: 'SeatOfEveryRow.crossing_is_a_proof' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.crossing_is_a_proof
/-- info: 'SeatOfEveryRow.surplus_is_the_unactuated' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.surplus_is_the_unactuated
/-- info: 'SeatOfEveryRow.value_iff_carrier' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.value_iff_carrier
/-- info: 'SeatOfEveryRow.carrier_compose' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.carrier_compose
/-- info: 'SeatOfEveryRow.value_union_iff' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.value_union_iff
/-- info: 'SeatOfEveryRow.one_witness_settles' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.one_witness_settles
/-- info: 'SeatOfEveryRow.fix_functorial' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.fix_functorial
/-- info: 'SeatOfEveryRow.equivariant_carrier_lands' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.equivariant_carrier_lands
/-- info: 'SeatOfEveryRow.carrier_delivers_the_seat' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.carrier_delivers_the_seat
/-- info: 'SeatOfEveryRow.the_form_of_every_row' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.the_form_of_every_row
/-- info: 'SeatOfEveryRow.ledger_census' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.ledger_census
/-- info: 'SeatOfEveryRow.every_ledger_row_has_its_seat' does not depend on any axioms -/
#guard_msgs in #print axioms SeatOfEveryRow.every_ledger_row_has_its_seat
