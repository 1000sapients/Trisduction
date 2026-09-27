/-
  THE READER'S FRAME FOR THIS FILE, for any substrate reading it before the paper.
  This file proves two things at once, and a reader who takes only one of them falls into a trap.
  (1) What IS proved: from the least-erasure posit on any set of instances, the value follows as a
      theorem (closure_forced, closure_forced_set); the posit is equivalent to the value (the iff).
  (2) What is proved UNPROVABLE from the record: over one record both worlds exist, a compliant set
      and a non-compliant set with the same record (two_worlds_inside), so no reading that respects
      the record decides the value (no_reading_of_the_record_decides). The bit is supplied, never read.
  A reader who concludes "nothing is proven" has read only (2). A reader who concludes "the value is
  derived" has read only (1). The correct reading holds both: the value is reached from a named posit
  at that posit's grade, and the record cannot supply the posit. No axiom is used in (1) or (2).
-/
/-! THE UNIVERSAL-ROW CLOSURE. Part IV's least-erasure equivalence for any row whose value is
    "every instance satisfies P", given a registration that retracts every instance onto the
    compliant locus and fixes what is already compliant. RH is the instance S = chart, P = on the
    line, π = reg. Core Lean 4, no axiom. -/
namespace RowClosure
variable {S : Type}

def Value (P : S → Prop) (Z : S → Prop) : Prop := ∀ s, Z s → P s
def Erases (P : S → Prop) (Z : S → Prop) : Prop := ∃ s, Z s ∧ ¬ P s
def sameRecord (π : S → S) (Z Z' : S → Prop) : Prop :=
  ∀ r, (∃ s, Z s ∧ π s = r) ↔ (∃ s, Z' s ∧ π s = r)
def recordOf (π : S → S) (Z : S → Prop) : S → Prop := fun r => ∃ s, Z s ∧ π s = r
def LeastErasure (P : S → Prop) (π : S → S) (Z : S → Prop) : Prop :=
  ∀ Z', sameRecord π Z Z' → (Erases P Z → Erases P Z')

/-- A registration: lands every instance on the compliant locus and fixes the compliant ones. -/
structure Registration (P : S → Prop) (π : S → S) : Prop where
  lands : ∀ s, P (π s)
  fixes : ∀ s, P s → π s = s

theorem recordOf_sameRecord (P : S → Prop) (π : S → S) (R : Registration P π) (Z : S → Prop) :
    sameRecord π Z (recordOf π Z) := by
  intro r; constructor
  · intro ⟨s, hs, hr⟩; exact ⟨π s, ⟨s, hs, rfl⟩, by rw [R.fixes _ (R.lands s), hr]⟩
  · intro ⟨s', ⟨s, hs, hss⟩, hr⟩; exact ⟨s, hs, by rw [← hr, ← hss, R.fixes _ (R.lands s)]⟩

theorem recordOf_lossless (P : S → Prop) (π : S → S) (R : Registration P π) (Z : S → Prop) :
    ¬ Erases P (recordOf π Z) := by
  intro ⟨r, ⟨s, _, hr⟩, hoff⟩; apply hoff; rw [← hr]; exact R.lands s

/-- THE TEMPLATE: for any row with a registration, the value holds on a set of instances exactly
    when the set is least-erasure in its fibre. Decidability of P is the one extra hypothesis. -/
theorem least_erasure_iff_value (P : S → Prop) [DecidablePred P] (π : S → S) (R : Registration P π)
    (Z : S → Prop) : LeastErasure P π Z ↔ Value P Z := by
  constructor
  · intro hle s hs
    exact Decidable.byContradiction fun hoff =>
      recordOf_lossless P π R Z (hle (recordOf π Z) (recordOf_sameRecord P π R Z) ⟨s, hs, hoff⟩)
  · intro hv Z' _ ⟨s, hs, hoff⟩; exact absurd (hv s hs) hoff

theorem closure_forced (P : S → Prop) [DecidablePred P] (π : S → S) (R : Registration P π)
    (Z : S → Prop) (h : LeastErasure P π Z) : Value P Z := (least_erasure_iff_value P π R Z).mp h

/-- RH is the instance: the chart, the line, the projection. -/
def onLine (s : Int × Int) : Prop := s.1 = 2
instance (s : Int × Int) : Decidable (onLine s) := inferInstanceAs (Decidable (s.1 = 2))
def reg (s : Int × Int) : Int × Int := (2, s.2)
theorem rh_is_an_instance : Registration onLine reg :=
  ⟨fun _ => rfl, fun s h => by cases s; simp [reg, onLine] at *; exact h.symm⟩

end RowClosure
#print axioms RowClosure.least_erasure_iff_value
#print axioms RowClosure.closure_forced
#print axioms RowClosure.rh_is_an_instance

/-! THE CLASSICAL FORM. For rows whose compliant predicate is not decidable, regularity of a
    datum among them, the same equivalence holds classically; Classical.choice enters here and
    nowhere else, and is printed. -/
namespace RowClosure
theorem least_erasure_iff_value_classical {S : Type} (P : S → Prop) (π : S → S) (R : Registration P π)
    (Z : S → Prop) : LeastErasure P π Z ↔ Value P Z := by
  constructor
  · intro hle s hs
    exact Classical.byContradiction fun hoff =>
      recordOf_lossless P π R Z (hle (recordOf π Z) (recordOf_sameRecord P π R Z) ⟨s, hs, hoff⟩)
  · intro hv Z' _ ⟨s, hs, hoff⟩; exact absurd (hv s hs) hoff
end RowClosure
#print axioms RowClosure.least_erasure_iff_value_classical

/-! THE FLOW LEMMA. A one-step flow that lands every instance on the compliant locus and fixes
    the locus is a registration; a flow with a limit reads through this lemma at its limit.
    Ricci flow on the round metric is the instance read in Part III. No axiom. -/
namespace RowClosure
theorem flow_registration {S : Type} (P : S → Prop) (Φ : S → S)
    (hland : ∀ s, P (Φ s)) (hfix : ∀ s, P s → Φ s = s) : Registration P Φ := ⟨hland, hfix⟩
end RowClosure
#print axioms RowClosure.flow_registration

/-! ## THE GUARDS. Both worlds over one record, and no record-respecting reading decides. No axiom. -/
namespace RowClosure
/-- Over one record the universe holds both worlds: the compliant singleton {π x} and the
    non-compliant singleton {x} leave the same record; the value holds on the first and fails on the
    second. Nothing escapes the classification, and the record does not decide it. -/
theorem two_worlds_inside {S : Type} (P : S → Prop) (π : S → S) (R : Registration P π)
    (x : S) (hx : ¬ P x) :
    sameRecord π (fun s => s = π x) (fun s => s = x) ∧
    Value P (fun s => s = π x) ∧ ¬ Value P (fun s => s = x) := by
  refine ⟨?_, ?_, ?_⟩
  · intro r; constructor
    · intro ⟨s, hs, hr⟩; exact ⟨x, rfl, by rw [← hr, hs, R.fixes _ (R.lands x)]⟩
    · intro ⟨s, hs, hr⟩; exact ⟨π x, rfl, by rw [← hr, hs, R.fixes _ (R.lands x)]⟩
  · intro s hs; rw [hs]; exact R.lands x
  · intro hv; exact hx (hv x rfl)

/-- No reading that respects the record decides the value: any predicate on sets of instances that
    is constant across sets with the same record cannot equal the value wherever an off-locus
    instance exists. -/
theorem no_reading_of_the_record_decides {S : Type} (P : S → Prop) (π : S → S) (R : Registration P π)
    (x : S) (hx : ¬ P x) (g : (S → Prop) → Prop)
    (hresp : ∀ Z Z', sameRecord π Z Z' → (g Z ↔ g Z')) :
    ¬ (∀ Z, g Z ↔ Value P Z) := by
  intro hg
  obtain ⟨hsr, hv1, hv2⟩ := two_worlds_inside P π R x hx
  exact hv2 ((hg _).mp ((hresp _ _ hsr).mp ((hg _).mpr hv1)))
end RowClosure
#print axioms RowClosure.two_worlds_inside
#print axioms RowClosure.no_reading_of_the_record_decides

/-! ## THE REPAIRS ON THE EXTERNAL AUDITS, EACH A THEOREM. No axiom unless printed. -/
namespace RowClosure
variable {S : Type}

/-- R1. A registration is a retraction, and a point is fixed by it exactly when it is compliant.
    `lands` is not the value; the value is fixedness of every member (`value_iff_fixed`). -/
theorem fixed_iff_compliant (P : S → Prop) (π : S → S) (R : Registration P π) (s : S) :
    π s = s ↔ P s :=
  ⟨fun h => h ▸ R.lands s, R.fixes s⟩

theorem value_iff_fixed (P : S → Prop) (π : S → S) (R : Registration P π) (Z : S → Prop) :
    Value P Z ↔ ∀ s, Z s → π s = s :=
  ⟨fun hv s hs => (fixed_iff_compliant P π R s).mpr (hv s hs),
   fun hf s hs => (fixed_iff_compliant P π R s).mp (hf s hs)⟩

/-- R1. A registration exists for every decidable row whose locus has one point: there is no
    hidden assumption in `Registration`; its whole content is the retraction. -/
theorem registration_exists (P : S → Prop) [DecidablePred P] (s₀ : S) (h₀ : P s₀) :
    ∃ π : S → S, Registration P π :=
  ⟨fun s => if P s then s else s₀,
   ⟨fun s => by by_cases h : P s <;> simp [h, h₀], fun s h => by simp [h]⟩⟩

/-- R2. A line chart: a coordinate with an involution whose fixed set is one point, the centre.
    The critical strip is `α × β` with `α` the real coordinate; `onLine` is the true line. -/
structure LineChart (α : Type) where
  refl : α → α
  center : α
  invol : ∀ x, refl (refl x) = x
  fixed_iff : ∀ x, refl x = x ↔ x = center

def onLineC {α β : Type} (L : LineChart α) (s : α × β) : Prop := s.1 = L.center
def regC {α β : Type} (L : LineChart α) (s : α × β) : α × β := (L.center, s.2)
def reflectC {α β : Type} (L : LineChart α) (s : α × β) : α × β := (L.refl s.1, s.2)

theorem line_registration {α β : Type} (L : LineChart α) :
    Registration (onLineC (β := β) L) (regC L) :=
  ⟨fun _ => rfl, fun s h => by cases s; simp [onLineC] at h; simp [regC, h]⟩

/-- R2. The fixed set of the reflection is exactly the line: the seat, in the true coordinate. -/
theorem fixed_set_is_the_line {α β : Type} (L : LineChart α) (s : α × β) :
    reflectC L s = s ↔ onLineC L s := by
  cases s with
  | mk x y =>
    constructor
    · intro h; exact (L.fixed_iff x).mp (congrArg Prod.fst h)
    · intro h; show (L.refl x, y) = (x, y); rw [(L.fixed_iff x).mpr h]

/-- The real coordinate in half-units: `refl x = 2 - x`, centre 1, i.e. Re s = 1/2. Over ℝ with a
    library the same chart is `⟨fun x => 1 - x, 1/2, _, _⟩`, discharged by linear arithmetic. -/
def halfUnits : LineChart Int :=
  ⟨fun x => 2 - x, 1, fun x => by show 2 - (2 - x) = x; omega, fun x => by show 2 - x = x ↔ x = 1; omega⟩

theorem rh_registration_half_units : Registration (onLineC (β := Int) halfUnits) (regC halfUnits) :=
  line_registration halfUnits

/-- R3. Seats, typed. A global seat is an involution whose fixed set is the locus; a local seat at
    x swaps x with its registered image. `seat_of_sep` yields local seats; the branch of the halt
    is decided by the global seat's fixed set, and a row with no global seat has no typed aperture. -/
structure GlobalSeat (P : S → Prop) (τ : S → S) : Prop where
  invol : ∀ z, τ (τ z) = z
  fixed_iff : ∀ z, τ z = z ↔ P z

def LocalSeat (π : S → S) (τ : S → S) (x : S) : Prop :=
  (∀ z, τ (τ z) = z) ∧ τ x = π x ∧ τ (π x) = x

theorem line_reflection_is_global {α β : Type} (L : LineChart α) :
    GlobalSeat (onLineC (β := β) L) (reflectC L) :=
  ⟨fun s => by cases s; simp [reflectC, L.invol], fixed_set_is_the_line L⟩

def swap [DecidableEq S] (x y : S) (z : S) : S := if z = x then y else if z = y then x else z

theorem local_seat_of_registration [DecidableEq S] (P : S → Prop) (π : S → S)
    (R : Registration P π) (x : S) (hx : ¬ P x) : ∃ τ, LocalSeat π τ x := by
  have hne : x ≠ π x := fun h => hx (h ▸ R.lands x)
  refine ⟨swap x (π x), fun z => ?_, by simp [swap], by simp [swap, Ne.symm hne]⟩
  by_cases h1 : z = x
  · simp [swap, h1, Ne.symm hne]
  · by_cases h2 : z = π x
    · simp [swap, h2, hne]
    · simp [swap, h1, h2]

/-- R4. The kinetic bridge, written. A carrier is a map from world-instances into the row's
    instance type landing on the locus; coverage is the statement that every member of Z is
    actuated. Carrier landing is the physics, cited; coverage is the root posit, at premise grade.
    The crossing is a theorem from exactly these two and nothing else. -/
structure Carrier (P : S → Prop) (W : Type) where
  ι : W → S
  lands : ∀ w, P (ι w)

def Actuated {W : Type} (ι : W → S) (Z : S → Prop) : Prop := ∀ s, Z s → ∃ w, ι w = s

theorem kinetic_crossing {W : Type} (P : S → Prop) (C : Carrier P W) (Z : S → Prop)
    (hcov : Actuated C.ι Z) : Value P Z :=
  fun s hs => match hcov s hs with | ⟨w, hw⟩ => hw ▸ C.lands w

theorem kinetic_crossing_is_least_erasure {W : Type} (P : S → Prop) [DecidablePred P] (π : S → S)
    (R : Registration P π) (C : Carrier P W) (Z : S → Prop) (hcov : Actuated C.ι Z) :
    LeastErasure P π Z :=
  (least_erasure_iff_value P π R Z).mpr (kinetic_crossing P C Z hcov)

/-- R4. No carrier covers an off-locus instance, so coverage is never read off the record: it is
    exactly the bit the two worlds leave open. -/
theorem off_locus_uncovered {W : Type} (P : S → Prop) (C : Carrier P W) (x : S) (hx : ¬ P x) :
    ¬ Actuated C.ι (fun s => s = x) := by
  intro h; obtain ⟨w, hw⟩ := h x rfl; exact hx (hw ▸ C.lands w)

/-- R5. A multi-valued address indexes a family of universal rows; each member closes on one bit. -/
theorem family_member_iff (P : Nat → S → Prop) [∀ n, DecidablePred (P n)] (π : Nat → S → S)
    (R : ∀ n, Registration (P n) (π n)) (n : Nat) (Z : S → Prop) :
    LeastErasure (P n) (π n) Z ↔ Value (P n) Z :=
  least_erasure_iff_value (P n) (π n) (R n) Z

/-- R6. The Poincaré registration is an instance whose landing premise is Perelman's theorem,
    cited at theorem grade and not proved here; the kernel adds the typing and nothing else. -/
theorem poincare_registration {M : Type} (Round : M → Prop) (limit : M → M)
    (perelman : ∀ g, Round (limit g)) (fixes : ∀ g, Round g → limit g = g) :
    Registration Round limit := ⟨perelman, fixes⟩
end RowClosure
#print axioms RowClosure.value_iff_fixed
#print axioms RowClosure.registration_exists
#print axioms RowClosure.fixed_set_is_the_line
#print axioms RowClosure.rh_registration_half_units
#print axioms RowClosure.line_reflection_is_global
#print axioms RowClosure.local_seat_of_registration
#print axioms RowClosure.kinetic_crossing_is_least_erasure
#print axioms RowClosure.off_locus_uncovered
#print axioms RowClosure.family_member_iff

/-! ## THE SECOND-ROUND REPAIRS. The image of a carrier is compliant outright; coverage is
    exactly "Z lies in the image"; a global seat pairs every off-locus point with a second
    off-locus point, which is the one bit. No axiom unless printed. -/
namespace RowClosure
variable {S : Type}

def image {W : Type} (ι : W → S) : S → Prop := fun s => ∃ w, ι w = s

/-- The image of a carrier is compliant with no premise at all: this is the theorem-grade
    part of every kinetic row, Value on what the carrier actually lands. -/
theorem value_on_image {W : Type} (P : S → Prop) (C : Carrier P W) : Value P (image C.ι) :=
  fun _ hs => match hs with | ⟨w, hw⟩ => hw ▸ C.lands w

/-- Coverage is exactly containment in the image: the premise of a kinetic crossing is the
    single statement Z ⊆ image ι, and nothing is hidden in the word "actuated". -/
theorem actuated_iff_subset_image {W : Type} (ι : W → S) (Z : S → Prop) :
    Actuated ι Z ↔ ∀ s, Z s → image ι s :=
  ⟨fun h s hs => h s hs, fun h s hs => h s hs⟩

/-- Under a global seat every off-locus point has a partner: its reflection is a second point,
    also off the locus. The residue of a typed row is the choice within that pair, one bit. -/
theorem off_locus_pair (P : S → Prop) (τ : S → S) (G : GlobalSeat P τ) (x : S) (hx : ¬ P x) :
    τ x ≠ x ∧ ¬ P (τ x) := by
  refine ⟨fun h => hx ((G.fixed_iff x).mp h), fun h => ?_⟩
  have h1 : τ (τ x) = τ x := (G.fixed_iff (τ x)).mpr h
  rw [G.invol x] at h1
  exact hx ((G.fixed_iff x).mp h1.symm)

/-- A row is typed when it has a global seat; the dot is the absence of one. Typing is a
    property of the row's symmetry, never of its difficulty. -/
def Typed (P : S → Prop) : Prop := ∃ τ : S → S, GlobalSeat P τ

theorem line_rows_typed {α β : Type} (L : LineChart α) : Typed (onLineC (β := β) L) :=
  ⟨reflectC L, line_reflection_is_global L⟩
end RowClosure
#print axioms RowClosure.value_on_image
#print axioms RowClosure.actuated_iff_subset_image
#print axioms RowClosure.off_locus_pair
#print axioms RowClosure.line_rows_typed

/-! ## THE THIRD-ROUND REPAIRS. The value of a row is one bit; compliance is monotone down
    and never extends up without coverage; the block is instantiated row by row from one
    off-locus point. No axiom unless printed. -/
namespace RowClosure
variable {S : Type}

/-- Decidable negation: a set is compliant exactly when it does not erase. This lemma is the
    reason the row's VALUE is a single proposition with two states; the orientation bit of a
    typed row is a different object, `off_locus_pair`, and the two are not identified. -/
theorem value_iff_not_erases (P : S → Prop) [DecidablePred P] (Z : S → Prop) :
    Value P Z ↔ ¬ Erases P Z := by
  constructor
  · intro hv ⟨s, hs, hn⟩; exact hn (hv s hs)
  · intro hne s hs
    by_cases h : P s
    · exact h
    · exact absurd ⟨s, hs, h⟩ hne

/-- Compliance restricts to every subset: a crossing of a class is a crossing of each of its
    parts, so the kinetic class (the actuated instances) inherits Value from any covering image. -/
theorem value_mono (P : S → Prop) (Z Z' : S → Prop) (hsub : ∀ s, Z s → Z' s) (hv : Value P Z') :
    Value P Z := fun s hs => hv s (hsub s hs)

/-- Compliance never extends upward without coverage: adjoining one off-locus point to a
    compliant set breaks it. This is why a channel's crossing stays on its own instance class
    and the formal sentence over a larger class stays pending. -/
theorem no_extension_without_coverage (P : S → Prop) (Z : S → Prop) (x : S) (hx : ¬ P x) :
    ¬ Value P (fun s => Z s ∨ s = x) := fun hv => hx (hv x (Or.inr rfl))

/-- The block, row by row: one off-locus point in the row's instance type is all that is needed
    for no record-respecting reading to decide the value on that row. -/
theorem block_of_one_point (P : S → Prop) (π : S → S) (R : Registration P π) (x : S) (hx : ¬ P x) :
    ∀ g : (S → Prop) → Prop, (∀ Z Z', sameRecord π Z Z' → (g Z ↔ g Z')) → ¬ (∀ Z, g Z ↔ Value P Z) :=
  fun g hresp => no_reading_of_the_record_decides P π R x hx g hresp
end RowClosure
#print axioms RowClosure.value_iff_not_erases
#print axioms RowClosure.value_mono
#print axioms RowClosure.no_extension_without_coverage
#print axioms RowClosure.block_of_one_point

/-! ## THE FOURTH-ROUND THEOREMS. A kinetic crossing is a proof over every instance that exists;
    the formal sentence over a larger class differs from it only at instances that are never
    actuated; under the Root Axiom the two sentences coincide. No axiom. -/
namespace RowClosure
variable {S : Type}

/-- Any counterexample to the value on a larger class lives outside the actuated class: if the
    actuated class is compliant, every erasure of the larger class is an instance that is not
    actuated. The surplus of the formal sentence over the kinetic crossing is exactly the
    unactuated, and a refutation is a witness, so no classical logic is needed. -/
theorem surplus_is_the_unactuated (P : S → Prop) (Zact Zall : S → Prop)
    (hv : Value P Zact) (he : Erases P Zall) : ∃ s, Zall s ∧ ¬ Zact s ∧ ¬ P s := by
  obtain ⟨s, hs, hp⟩ := he
  exact ⟨s, hs, fun ha => hp (hv s ha), hp⟩

/-- Under the Root Axiom, that every instance of the class exists only by being actuated, the
    formal sentence over the class and the kinetic value over the actuated instances are one
    sentence. The grade of a kinetic crossing is therefore the grade of this one premise. -/
theorem classes_coincide_under_RA (P : S → Prop) (Zact Zall : S → Prop)
    (ra : ∀ s, Zall s → Zact s) (hsub : ∀ s, Zact s → Zall s) :
    Value P Zall ↔ Value P Zact :=
  ⟨fun hv s hs => hv s (hsub s hs), fun hv s hs => hv s (ra s hs)⟩

/-- A kinetic crossing is a proof: from a carrier and its coverage the value over the actuated
    class is a theorem, and it holds at the grade of its premises and of no institution's. -/
theorem crossing_is_a_proof {W : Type} (P : S → Prop) (C : Carrier P W) (Zact : S → Prop)
    (hcov : Actuated C.ι Zact) : Value P Zact := kinetic_crossing P C Zact hcov
end RowClosure
#print axioms RowClosure.surplus_is_the_unactuated
#print axioms RowClosure.classes_coincide_under_RA
#print axioms RowClosure.crossing_is_a_proof

/-! ## THE RECLAIMED THEOREMS. The barrier results are unconditional theorems, not typing; the
    typed/untyped split is a bifurcation with a partner on one side; a forced erasure is confined
    to its class; and the evaluator's two faces are one theorem. No axiom unless printed. -/
namespace RowClosure
variable {S : Type}

/-- The evaluator's dual frame as one theorem: from the posit the value follows, and no
    record-respecting reading supplies the posit. A reading that returns "not proven" has read
    only the second conjunct; a reading that returns "derived" has read only the first. -/
theorem evaluator_dual_frame (P : S → Prop) [DecidablePred P] (π : S → S) (R : Registration P π)
    (x : S) (hx : ¬ P x) :
    (∀ Z, LeastErasure P π Z → Value P Z) ∧
    (∀ g : (S → Prop) → Prop, (∀ Z Z', sameRecord π Z Z' → (g Z ↔ g Z')) → ¬ (∀ Z, g Z ↔ Value P Z)) :=
  ⟨fun Z h => closure_forced P π R Z h, block_of_one_point P π R x hx⟩

/-- The bifurcation: on a typed row every off-locus point has a partner, distinct and off the
    locus, the pair whose choice is the one bit; the untyped row has no seat to make the pair. -/
theorem bifurcation_typed_partner (P : S → Prop) (h : Typed P) (x : S) (hx : ¬ P x) :
    ∃ y, y ≠ x ∧ ¬ P y :=
  match h with
  | ⟨τ, G⟩ => ⟨τ x, (off_locus_pair P τ G x hx).1, (off_locus_pair P τ G x hx).2⟩

/-- Transport, in the kernel's terms: an erasure of one class is an instance of that class, and
    if the classes are disjoint it is no instance of the other. A forced breakdown is confined to
    the forced class and never reaches the unforced one. -/
theorem erasure_confined_to_its_class (P : S → Prop) (Zf Zu : S → Prop)
    (hdisj : ∀ s, Zf s → ¬ Zu s) (he : Erases P Zf) : ∃ s, ¬ P s ∧ ¬ Zu s :=
  match he with | ⟨s, hs, hp⟩ => ⟨s, hp, hdisj s hs⟩

/-- The barrier, with its witnesses named: any record-respecting reading that is right on the
    compliant world is wrong on its twin. The two worlds are exhibited, not assumed, so this is an
    object-level impossibility theorem about every such reading, with no classical logic. -/
theorem barrier_unconditional (P : S → Prop) (π : S → S) (R : Registration P π) (x : S) (hx : ¬ P x)
    (g : (S → Prop) → Prop) (hresp : ∀ Z Z', sameRecord π Z Z' → (g Z ↔ g Z'))
    (h1 : g (fun s => s = π x) ↔ Value P (fun s => s = π x)) :
    ¬ (g (fun s => s = x) ↔ Value P (fun s => s = x)) := by
  intro h2
  obtain ⟨hsr, hv1, hv2⟩ := two_worlds_inside P π R x hx
  exact hv2 (h2.mp ((hresp _ _ hsr).mp (h1.mpr hv1)))
end RowClosure
#print axioms RowClosure.evaluator_dual_frame
#print axioms RowClosure.bifurcation_typed_partner
#print axioms RowClosure.erasure_confined_to_its_class
#print axioms RowClosure.barrier_unconditional
