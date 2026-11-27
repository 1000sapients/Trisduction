/-
SPHYS_Field_Quantization_CC.lean · The Field Itself: the Adjoint Derived. Lean 4.19.0, Mathlib 4.19.0.
RATIONALE. Generalized Quantization proves its theorem inside any ring with an adjoint and takes the adjoint as given. This
  file constructs it. A reading of a field on a seat is a function from the seat to a ring of values. Readings form a ring
  point by point. The fold of the seat acts on readings by moving the point. Part I: fold, then the adjoint of the values,
  is an adjoint on readings; its three laws are proved. Part II: its line, the kept and the reversed readings, and the limit:
  where the values commute the readings commute, so the readings alone hold no commutator. Part III: the ring of the
  readings together with the fold as an operator. It has an adjoint by construction and it fails to commute exactly
  where the fold moves a reading. Part IV: both on the readings of any field. Part V: naturality and the binding theorem.
DESIGN. Part III is stated on any ring `R` with a ring map `σ` that is its own inverse and an adjoint `τ` that commutes with
  it; Part IV supplies `R` as the readings, `σ` as the fold and `τ` as the adjoint of the values taken point by point.
  Parts VI to X: the canonical pair. Part VI: what any ring forces on a pair whose commutator is one, and where no such
  pair can be: under any trace that does not vanish on one, and between two observables. Part VII: a seat with a shift
  and a coordinate along it, the Weyl form, and why such a seat is infinite. Part VIII: the ladder on the whole numbers,
  over any other seat: a pair whose commutator is one, and whose product is the count. Part IX: the line, with the
  derivative. Part X: every quantity on a finite seat is a matrix, every map of the seat among them, and there is no
  canonical pair there. The theorem that closes Part X binds the two cases.
  Parts XI to XIII: nothing left outside. Part XI: every infinite seat is matched with itself taken together with the
  whole numbers, the ladder is carried across the matching, and a seat that is not empty carries a canonical pair among
  the linear maps of its readings exactly when it is infinite. Part XII: every space with an inner product is a form
  of the spectral seat, the bounded quantities of every Hilbert space are a ring with an adjoint that is the adjoint of
  the form, and no pair of them is canonical: a canonical pair on a space with a norm is unbounded. Part XIII: the
  converse, a ring with an adjoint and a positive reading is a space with a positive form on which the ring acts.
  Part XIV: that space has a Hilbert home, a complete space into which it maps densely with its form kept; the
  registrations of the count are exactly the whole numbers; and a canonical pair with a ground state, on any space,
  holds one copy of the ladder.
  Part XV: two statements the earlier Quantization kernels left. The occupation numbers are the finest registration
  of the relabellings: the same occupation numbers exactly when one assignment is a relabelling of the other. And a
  symmetry with no finite period: where a full turn is the identity and the label of a state turns differentiably,
  the label is an integer number of turns, of either sign.
  Part XVI: the free field of quanta. The seat is the assignments of a whole number to every mode. Each mode is a
  canonical pair, different modes do not disturb each other, the energy is the sum of the counts each times its
  frequency, and its commutator with the raising and the lowering of a mode is the law of motion. In any ring the
  energy of a mode is the count and a half. With two polarisations to a mode, the mirror exchanges them and keeps
  the energy. Part XVII: what no proof decides. A seat with a canonical pair and a seat without one both exist, so
  the choice is not a theorem; a seat is infinite exactly when a reading takes every whole number; and on an
  infinite seat every value of the constant is the commutator of some pair. Part XIX: time and the geometry as a reading.
  The count has no canonical partner, so time is not a quantity of the ring; a reading kept by the joint step of a
  system and its count is its own history; a law kept by every map prefers no slicing while a record may carry
  one; and whether a field holds a commutator is decided by no proof. Part XX: what an outside clock registers at a
  horizon: the time for a ray grows past every bound as the horizon is approached. Part XXI: the binding theorem of
  the Hilbert space.
BOUNDARY. Each theorem's kernel line, pinned at the foot of the file, is the authority. Read by Part:
  (1) Parts I to X, 46 theorems. 38 print no axiom of choice: 7 of them print no axiom at all, and 31 print only
  propositional extensionality or the soundness of quotients. 8 print the axiom of choice: the two theorems of Part IV
  on a seat that is all line, `a_finite_seat_has_no_coordinate_along_a_shift`, the two theorems of Part IX, and the
  three theorems of Part X. In those the axiom comes with excluded middle and with the library's finite sets,
  matrices and polynomials.
  (2) Part XI, 9 theorems. The matching of an infinite seat with itself taken together with the whole numbers is a
  theorem of the axiom of choice, and the dichotomy rests on it. 7 print the axiom. The 2 that take the matching as
  given, `the_ladder_carries_across_a_matching` and `a_seat_matched_with_a_count_carries_a_canonical_pair`, do not.
  (3) Parts XII and XIII, 17 theorems. The values are the real and the complex numbers, which the library builds with
  the axiom of choice. All 17 print it; it enters with the numbers.
  (4) Part XIV, 8 theorems. 4 print the axiom: the Hilbert home, with the numbers; the two theorems on the
  registrations of the count, with excluded middle; and `the_rungs_are_independent`, with the library's eigenspaces.
  The 4 theorems on the ground state and its rungs that come before it do not.
  (5) Part XV, 4 theorems. All 4 print the axiom: the two on the occupation numbers with the library's finite sets,
  the two on the full turn with the numbers.
  (6) Part XVI, 13 theorems. 7 print the axiom, with excluded middle on whether a count is zero and with the library's
  finite sums; 6 do not. No step of Part XVI uses the matching of Part XI: the seat is given with its counts.
  (7) Part XVII, 4 theorems. All 4 print the axiom: three speak of every infinite seat and rest on Part XI, and the
  one on a finite seat has it with the library's finite sets.
  (8) Part XIX, 6 theorems. 5 print no axiom of choice, 2 of them no axiom at all: the theorems on time, on the
  history and on the law and the record. The one on the commutator prints it, with the rational numbers and matrices
  of the library.
  (9) Part XX, 2 theorems, and Part XXI, the binding theorem. All 3 print the axiom, with the numbers.
RISK. A reader may take the file to say that the field of gravity is quantized. It says neither that nor the contrary. It
  proves what follows on a finite seat and what follows on a seat with a shift, and leaves to measurement which seat
  the states of the field form. Part XVI takes as its seat the assignments of a count to every mode: that the states of
  a given field are such assignments is the premise of that Part, and by Part XVII no proof decides it. Part XX
  speaks of the outside clock alone; what the one who falls registers is no statement of this file. No constant of action is derived: the commutator is one, and its size in any unit is
  measured. No law of motion is given. The adjoint of the ring of values is still given; on values that commute it
  may be the identity.
OUTSIDE THE FILE, AND WHY NO THEOREM HERE NEEDS IT. Two classical theorems are formalised neither here nor in the
  library this file uses.
  (a) The spectral theorem for a general observable without a bound. The one such observable this file builds is the
  count. It is already a coordinate: Part VIII gives it as multiplication by the count, and Part XIV gives its
  registrations as exactly the whole numbers. No theorem here concerns another.
  (b) The uniqueness of a canonical pair in the form of Weyl on a Hilbert space. No theorem here rests on it: the
  dichotomy of Part XI is about existence, and Part XIV proves the uniqueness the ladder needs, that a canonical
  pair with a ground state holds one copy of it. For infinitely many modes uniqueness fails, so it could not have
  been a premise.
  The extension of a quantity with a bound from the dense image to the whole Hilbert home is the library's extension
  by continuity. The ladder has no bound, by Part XII, and no theorem here uses the extension.
NON-NEGOTIABLE. No axiom is declared. No proof is left open. The fold enters every theorem as an explicit map.
SUMMARY RULE. The sentences of this header, and the comment printed above each theorem, are summaries. Each theorem
  states its own conditions in its statement, and where a summary and a statement differ the statement governs.
-/
import Mathlib.Algebra.Star.Basic
import Mathlib.Algebra.Ring.Pi
import Mathlib.Tactic.Ring
import Mathlib.SetTheory.Cardinal.Arithmetic
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.Data.Nat.Factorial.Basic
import Mathlib.Analysis.InnerProductSpace.Adjoint
import Mathlib.Analysis.InnerProductSpace.Completion
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.Analysis.SpecialFunctions.ExpDeriv
import Mathlib.Analysis.Calculus.MeanValue
import Mathlib.Logic.Equiv.Fintype
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Data.Fintype.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Deriv
import Mathlib.Data.Matrix.Notation
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.NoncommRing
import Mathlib.Tactic.Linarith
import Mathlib.Algebra.CharZero.Defs
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Data.Fintype.Card

namespace SPHYS.FieldQuantization

/-! ## Part I. The readings of a field and the constructed adjoint. -/

section Readings
variable {α β : Type*} [Ring β] [StarRing β]

/-- The fold on readings: the seat's map moves the point. -/
def fold (σ : α → α) (f : α → β) : α → β := fun x => f (σ x)

/-- The constructed adjoint on readings: fold, then the adjoint of the values. -/
def foldStar (σ : α → α) (f : α → β) : α → β := fun x => star (f (σ x))

omit [StarRing β] in
/-- The fold on readings is a map of rings: it keeps sums, products and one. -/
theorem the_fold_is_a_map_of_rings (σ : α → α) (f g : α → β) :
    fold σ (f + g) = fold σ f + fold σ g ∧ fold σ (f * g) = fold σ f * fold σ g ∧ fold σ (1 : α → β) = 1 :=
  ⟨rfl, rfl, rfl⟩

omit [Ring β] [StarRing β] in
/-- The fold on readings is its own inverse, because the seat's map is. -/
theorem the_fold_on_readings_is_its_own_inverse (σ : α → α) (hσ : Function.Involutive σ) (f : α → β) :
    fold σ (fold σ f) = f := by
  funext x; show f (σ (σ x)) = f x; rw [hσ x]

/-- OBLIGATION 1. The constructed adjoint is an involution. -/
theorem the_constructed_adjoint_is_an_involution (σ : α → α) (hσ : Function.Involutive σ) (f : α → β) :
    foldStar σ (foldStar σ f) = f := by
  funext x; show star (star (f (σ (σ x)))) = f x; rw [hσ x, star_star]

/-- OBLIGATION 2. The constructed adjoint is additive. -/
theorem the_constructed_adjoint_is_additive (σ : α → α) (f g : α → β) :
    foldStar σ (f + g) = foldStar σ f + foldStar σ g := by
  funext x; show star (f (σ x) + g (σ x)) = star (f (σ x)) + star (g (σ x)); rw [star_add]

/-- OBLIGATION 3. The constructed adjoint reverses products. -/
theorem the_constructed_adjoint_reverses_products (σ : α → α) (f g : α → β) :
    foldStar σ (f * g) = foldStar σ g * foldStar σ f := by
  funext x; show star (f (σ x) * g (σ x)) = star (g (σ x)) * star (f (σ x)); rw [star_mul]

/-- The fold and the adjoint of the values commute on readings. -/
theorem the_fold_and_the_adjoint_of_the_values_commute (σ : α → α) (f : α → β) :
    foldStar σ f = fold σ (fun x => star (f x)) := rfl

/-- THE READINGS OF A FIELD ARE A RING WITH AN ADJOINT, the adjoint constructed from the fold. This is the structure in
which Generalized Quantization proves its theorem. -/
def readingsWithAdjoint (σ : α → α) (hσ : Function.Involutive σ) : StarRing (α → β) where
  star := foldStar σ
  star_involutive := the_constructed_adjoint_is_an_involution σ hσ
  star_mul := the_constructed_adjoint_reverses_products σ
  star_add := the_constructed_adjoint_is_additive σ

/-! ## Part II. The line of the constructed adjoint, and the limit of the readings alone. -/

/-- A reading the fold keeps, with values that are their own adjoints, is on the line: it is an observable. -/
theorem a_kept_reading_is_an_observable (σ : α → α) (f : α → β)
    (hkept : fold σ f = f) (hself : ∀ x, star (f x) = f x) : foldStar σ f = f := by
  funext x; show star (f (σ x)) = f x
  rw [show f (σ x) = f x from congrFun hkept x, hself x]

/-- A reading the fold reverses, with values that are their own adjoints, is reversed by the adjoint. -/
theorem a_reversed_reading_is_reversed_by_the_adjoint (σ : α → α) (f : α → β)
    (hrev : fold σ f = -f) (hself : ∀ x, star (f x) = f x) : foldStar σ f = -f := by
  funext x; show star (f (σ x)) = -f x
  rw [show f (σ x) = -f x from congrFun hrev x, star_neg, hself x]

/-- WHERE THE ADJOINT OF THE VALUES IS THE IDENTITY, THE OBSERVABLES ARE EXACTLY THE KEPT READINGS. -/
theorem the_observables_are_the_kept_readings (σ : α → α) (hid : ∀ b : β, star b = b) (f : α → β) :
    foldStar σ f = f ↔ fold σ f = f := by
  constructor
  · intro h; funext x; have h1 := congrFun h x; show f (σ x) = f x; rw [← hid (f (σ x))]; exact h1
  · intro h; funext x; show star (f (σ x)) = f x; rw [hid, show f (σ x) = f x from congrFun h x]

omit [StarRing β] in
/-- TWO REVERSALS KEEP. The product of two readings the fold reverses is a reading the fold keeps. -/
theorem two_reversals_keep (σ : α → α) (f g : α → β) (hf : fold σ f = -f) (hg : fold σ g = -g) :
    fold σ (f * g) = f * g := by
  funext x; show f (σ x) * g (σ x) = f x * g x
  rw [show f (σ x) = -f x from congrFun hf x, show g (σ x) = -g x from congrFun hg x, neg_mul_neg]

omit [StarRing β] in
/-- A reversal and a keeping reverse. -/
theorem a_reversal_and_a_keeping_reverse (σ : α → α) (f g : α → β) (hf : fold σ f = -f) (hg : fold σ g = g) :
    fold σ (f * g) = -(f * g) := by
  funext x; show f (σ x) * g (σ x) = -(f x * g x)
  rw [show f (σ x) = -f x from congrFun hf x, show g (σ x) = g x from congrFun hg x, neg_mul]

/-- Every reading and its adjoint together make an observable. -/
theorem a_reading_with_its_adjoint_is_an_observable (σ : α → α) (hσ : Function.Involutive σ) (f : α → β) :
    foldStar σ (f + foldStar σ f) = f + foldStar σ f := by
  rw [the_constructed_adjoint_is_additive, the_constructed_adjoint_is_an_involution σ hσ, add_comm]

end Readings

/-- THE LIMIT OF THE READINGS ALONE. Where the values commute, any two readings commute: the readings by themselves hold
no commutator, whatever the fold. -/
theorem where_the_values_commute_the_readings_commute {α β : Type*} [CommRing β] (f g : α → β) :
    f * g - g * f = 0 := by
  funext x; show f x * g x - g x * f x = 0; ring

/-- On values that commute the identity is an adjoint: it reverses products. So there the whole adjoint of the readings is
the fold. -/
theorem on_commuting_values_the_identity_is_an_adjoint {β : Type*} [CommRing β] (a b : β) :
    id (a * b) = id b * id a := mul_comm a b

/-! ## Part III. The readings together with the fold. An element is a reading `a`, and a reading `b` times the fold. The
fold moves a reading across itself as `σ`, and done twice it is one. Stated on any ring `R`. -/

@[ext] structure RF (R : Type*) where
  a : R
  b : R

section WithTheFold
variable {R : Type*} [Ring R]

def RF.mul (σ : R → R) (p q : RF R) : RF R := ⟨p.a * q.a + p.b * σ q.b, p.a * q.b + p.b * σ q.a⟩
def RF.adj (σ τ : R → R) (p : RF R) : RF R := ⟨τ p.a, σ (τ p.b)⟩
/-- A reading alone, and the fold alone. -/
def RF.of (a : R) : RF R := ⟨a, 0⟩
def RF.U : RF R := ⟨0, 1⟩

/-- The product is associative. -/
theorem the_product_is_associative (σ : R → R) (hm : ∀ x y, σ (x * y) = σ x * σ y)
    (ha : ∀ x y, σ (x + y) = σ x + σ y) (hi : ∀ x, σ (σ x) = x) (p q r : RF R) :
    RF.mul σ (RF.mul σ p q) r = RF.mul σ p (RF.mul σ q r) := by
  ext <;> simp only [RF.mul, hm, ha, hi] <;> noncomm_ring

/-- THE ADJOINT REVERSES PRODUCTS. With `σ` a map of rings that is its own inverse and `τ` an adjoint of `R` that commutes
with it, the adjoint of the readings with the fold reverses products. Nothing else is assumed. -/
theorem the_adjoint_reverses_products (σ τ : R → R) (hm : ∀ x y, σ (x * y) = σ x * σ y)
    (ha : ∀ x y, σ (x + y) = σ x + σ y) (hi : ∀ x, σ (σ x) = x) (tm : ∀ x y, τ (x * y) = τ y * τ x)
    (ta : ∀ x y, τ (x + y) = τ x + τ y) (hc : ∀ x, σ (τ x) = τ (σ x)) (p q : RF R) :
    RF.adj σ τ (RF.mul σ p q) = RF.mul σ (RF.adj σ τ q) (RF.adj σ τ p) := by
  ext
  · simp only [RF.mul, RF.adj, ta, tm, hi, hc]
  · simp only [RF.mul, RF.adj, ta, tm, ha, hm, hi, hc]; rw [add_comm]

omit [Ring R] in
/-- The adjoint is an involution. -/
theorem the_adjoint_is_an_involution (σ τ : R → R) (hi : ∀ x, σ (σ x) = x) (ti : ∀ x, τ (τ x) = x)
    (hc : ∀ x, σ (τ x) = τ (σ x)) (p : RF R) : RF.adj σ τ (RF.adj σ τ p) = p := by
  ext
  · simp only [RF.adj, ti]
  · simp only [RF.adj]; rw [hc (σ (τ p.b)), hi, ti]

/-- THE FOLD IS ITS OWN INVERSE AND ITS OWN ADJOINT. -/
theorem the_fold_is_its_own_inverse_and_its_own_adjoint (σ τ : R → R) (h0 : σ 0 = 0) (h1 : σ 1 = 1) (t0 : τ 0 = 0)
    (t1 : τ 1 = 1) : RF.mul σ RF.U RF.U = RF.of (1 : R) ∧ RF.adj σ τ (RF.U : RF R) = RF.U := by
  constructor
  · ext <;> simp [RF.mul, RF.U, RF.of, h0, h1]
  · ext <;> simp [RF.adj, RF.U, t0, t1, h1]

/-- THE FOLD MOVES A READING ACROSS ITSELF. -/
theorem the_fold_moves_a_reading_across (σ : R → R) (h0 : σ 0 = 0) (a : R) :
    RF.mul σ RF.U (RF.of a) = RF.mul σ (RF.of (σ a)) RF.U := by
  ext <;> simp [RF.mul, RF.U, RF.of, h0]

/-- A READING COMMUTES WITH THE FOLD EXACTLY WHEN THE FOLD KEEPS IT. -/
theorem a_reading_commutes_with_the_fold_iff_kept (σ : R → R) (h0 : σ 0 = 0) (a : R) :
    RF.mul σ (RF.of a) RF.U = RF.mul σ RF.U (RF.of a) ↔ σ a = a := by
  constructor
  · intro h
    have hb := congrArg RF.b h
    simp [RF.mul, RF.U, RF.of] at hb
    exact hb.symm
  · intro h; ext <;> simp [RF.mul, RF.U, RF.of, h0, h]

omit [Ring R] in
/-- The observables of the readings with the fold: a reading that is its own adjoint, and a reading times the fold whose
adjoint, folded, is itself. -/
theorem the_observables_with_the_fold (σ τ : R → R) (p : RF R) :
    RF.adj σ τ p = p ↔ τ p.a = p.a ∧ σ (τ p.b) = p.b := by
  constructor
  · intro h; exact ⟨congrArg RF.a h, congrArg RF.b h⟩
  · rintro ⟨h1, h2⟩; ext
    · exact h1
    · exact h2

end WithTheFold

/-- NOT COMMUTATIVE EXACTLY WHERE THE FOLD MOVES A READING. Over readings that commute, the readings with the fold commute
exactly when the fold keeps every reading. -/
theorem commutative_iff_the_fold_keeps_every_reading {R : Type*} [CommRing R] (σ : R → R) (h0 : σ 0 = 0) :
    (∀ p q : RF R, RF.mul σ p q = RF.mul σ q p) ↔ ∀ x, σ x = x := by
  constructor
  · intro h x
    exact (a_reading_commutes_with_the_fold_iff_kept σ h0 x).1 (h (RF.of x) RF.U)
  · intro h p q; ext <;> simp only [RF.mul, h] <;> ring

/-! ## Part IV. The readings of any field, with the fold. -/

/-- The fold keeps every reading exactly when the seat is all line: the seat's map moves no point. The values need two
elements. -/
theorem the_fold_keeps_every_reading_iff_the_seat_is_all_line {α β : Type*} [Ring β] [Nontrivial β]
    (σ : α → α) : (∀ f : α → β, fold σ f = f) ↔ ∀ x, σ x = x := by
  classical
  constructor
  · intro h x
    by_contra hne
    have h1 := congrFun (h (fun y => if y = x then (1 : β) else 0)) x
    have h2 : (if σ x = x then (1 : β) else 0) = if x = x then (1 : β) else 0 := h1
    rw [if_neg hne, if_pos rfl] at h2
    exact zero_ne_one h2
  · intro h f; funext x; show f (σ x) = f x; rw [h x]

/-- THE FIELD ITSELF. For any seat with a map that is its own inverse and any ring of values with an adjoint, the readings
with the fold have a product that is associative and an adjoint that reverses products and is an involution. -/
theorem the_readings_with_the_fold_are_a_ring_with_an_adjoint {α β : Type*} [Ring β] [StarRing β] (σ : α → α)
    (hσ : Function.Involutive σ) :
    (∀ p q r : RF (α → β), RF.mul (fold σ) (RF.mul (fold σ) p q) r = RF.mul (fold σ) p (RF.mul (fold σ) q r))
    ∧ (∀ p q : RF (α → β), RF.adj (fold σ) (fun f x => star (f x)) (RF.mul (fold σ) p q)
        = RF.mul (fold σ) (RF.adj (fold σ) (fun f x => star (f x)) q) (RF.adj (fold σ) (fun f x => star (f x)) p))
    ∧ (∀ p : RF (α → β), RF.adj (fold σ) (fun f x => star (f x)) (RF.adj (fold σ) (fun f x => star (f x)) p) = p) := by
  have hi : ∀ f : α → β, fold σ (fold σ f) = f := the_fold_on_readings_is_its_own_inverse σ hσ
  refine ⟨the_product_is_associative (fold σ) (fun _ _ => rfl) (fun _ _ => rfl) hi, ?_, ?_⟩
  · exact the_adjoint_reverses_products (fold σ) _ (fun _ _ => rfl) (fun _ _ => rfl) hi
      (fun f g => funext fun x => star_mul (f x) (g x)) (fun f g => funext fun x => star_add (f x) (g x)) (fun _ => rfl)
  · exact the_adjoint_is_an_involution (fold σ) _ hi (fun f => funext fun x => star_star (f x)) (fun _ => rfl)

/-- THE FIELD COMMUTES EXACTLY WHERE THE SEAT IS ALL LINE. With values that commute and have two elements, the readings
with the fold commute exactly when the seat's map moves no point. A seat with one point off its line has a field whose
ring does not commute. -/
theorem the_field_commutes_iff_the_seat_is_all_line {α β : Type*} [CommRing β] [Nontrivial β] (σ : α → α) :
    (∀ p q : RF (α → β), RF.mul (fold σ) p q = RF.mul (fold σ) q p) ↔ ∀ x, σ x = x :=
  (commutative_iff_the_fold_keeps_every_reading (fold σ) rfl).trans (the_fold_keeps_every_reading_iff_the_seat_is_all_line σ)

/-! ## Part V. Naturality, and the binding theorem. -/

/-- SUBSUMPTION. A map of seats that matches the maps carries readings back, and the constructed adjoint goes with them:
any model of a field carried into another has its adjoint carried too. -/
theorem the_constructed_adjoint_is_natural {α α' β : Type*} [Ring β] [StarRing β] (σ : α → α) (σ' : α' → α')
    (φ : α' → α) (heq : ∀ y, φ (σ' y) = σ (φ y)) (f : α → β) :
    foldStar σ' (fun y => f (φ y)) = fun y => foldStar σ f (φ y) := by
  funext y; show star (f (φ (σ' y))) = star (f (σ (φ y))); rw [heq]

/-- THE FIELD ITSELF IS AN ALGEBRAIC QUANTIZATION, the adjoint derived from the fold. -/
theorem the_field_itself {α β : Type*} [Ring β] [StarRing β] (σ : α → α) (hσ : Function.Involutive σ) :
    (∀ f : α → β, foldStar σ (foldStar σ f) = f)
    ∧ (∀ f g : α → β, foldStar σ (f + g) = foldStar σ f + foldStar σ g)
    ∧ (∀ f g : α → β, foldStar σ (f * g) = foldStar σ g * foldStar σ f)
    ∧ (∀ f g : α → β, fold σ f = -f → fold σ g = -g → fold σ (f * g) = f * g)
    ∧ (∀ a : α → β, RF.mul (fold σ) (RF.of a) RF.U = RF.mul (fold σ) RF.U (RF.of a) ↔ fold σ a = a) :=
  ⟨the_constructed_adjoint_is_an_involution σ hσ, the_constructed_adjoint_is_additive σ,
   the_constructed_adjoint_reverses_products σ, two_reversals_keep σ,
   fun a => a_reading_commutes_with_the_fold_iff_kept (fold σ) rfl a⟩

/-! ## Part VI. The canonical pair, in any ring. A pair is canonical when its commutator is one. -/

section Canonical
variable {A : Type*} [Ring A]

/-- A CANONICAL PAIR AGAINST A POWER. If `P Q − Q P = 1` then `P Qⁿ⁺¹ − Qⁿ⁺¹ P = (n + 1) Qⁿ`, for every `n`. -/
theorem a_canonical_pair_against_a_power (P Q : A) (h : P * Q - Q * P = 1) (n : ℕ) :
    P * Q ^ (n + 1) - Q ^ (n + 1) * P = (n + 1) • Q ^ n := by
  induction n with
  | zero => simp [h]
  | succ k ih =>
    have e : P * Q ^ (k + 1 + 1) - Q ^ (k + 1 + 1) * P
        = (P * Q ^ (k + 1) - Q ^ (k + 1) * P) * Q + Q ^ (k + 1) * (P * Q - Q * P) := by
      rw [pow_succ Q (k + 1)]; generalize Q ^ (k + 1) = S; noncomm_ring
    rw [e, ih, h, mul_one, smul_mul_assoc, ← pow_succ]
    exact (succ_nsmul _ _).symm

/-- A CANONICAL PAIR IS NEVER NILPOTENT. Where one is not zero and no whole multiple annihilates, no power of `Q` is zero:
the readings `1, Q, Q², …` never end. -/
theorem a_canonical_pair_is_never_nilpotent (hA : (1 : A) ≠ 0) (ht : ∀ (n : ℕ) (a : A), (n + 1) • a = 0 → a = 0)
    (P Q : A) (h : P * Q - Q * P = 1) (n : ℕ) : Q ^ n ≠ 0 := by
  induction n with
  | zero => simpa using hA
  | succ k ih =>
    intro h0
    have e := a_canonical_pair_against_a_power P Q h k
    rw [h0, mul_zero, zero_mul, sub_zero] at e
    exact ih (ht k _ e.symm)

/-- NO CANONICAL PAIR UNDER A TRACE. Let `τ` be any additive reading of the ring that takes one value on `a b` and `b a` and
is not zero on one. Then no pair has commutator one. -/
theorem no_canonical_pair_under_a_trace {V : Type*} [AddGroup V] (τ : A → V) (hsub : ∀ a b, τ (a - b) = τ a - τ b)
    (hcyc : ∀ a b, τ (a * b) = τ (b * a)) (h1 : τ 1 ≠ 0) (P Q : A) : P * Q - Q * P ≠ 1 := by
  intro h; apply h1; rw [← h, hsub, hcyc, sub_self]

/-- THE CONSTANT IS A CHOICE OF UNIT. A pair whose commutator is a constant `c` with an inverse `d` that commutes with `Q`
is, after one of the two is measured in the unit `d`, a pair whose commutator is one. -/
theorem the_constant_is_a_choice_of_unit (P Q c d : A) (h : P * Q - Q * P = c) (hd : d * c = 1) (hdQ : d * Q = Q * d) :
    (d * P) * Q - Q * (d * P) = 1 := by
  calc (d * P) * Q - Q * (d * P) = d * (P * Q) - (Q * d) * P := by noncomm_ring
    _ = d * (P * Q) - (d * Q) * P := by rw [hdQ]
    _ = d * (P * Q - Q * P) := by noncomm_ring
    _ = 1 := by rw [h, hd]

/-- THE COMMUTATOR OF TWO OBSERVABLES IS REVERSED BY THE ADJOINT. -/
theorem the_commutator_of_two_observables_is_reversed [StarRing A] (P Q : A) (hP : star P = P) (hQ : star Q = Q) :
    star (P * Q - Q * P) = -(P * Q - Q * P) := by
  rw [star_sub, star_mul, star_mul, hP, hQ]; noncomm_ring

/-- TWO OBSERVABLES NEVER HAVE COMMUTATOR ONE. One is its own adjoint; the commutator of two observables is reversed. So
the constant of a canonical pair of observables is a quantity the adjoint reverses, where the ring has no element of
additive order two and one is not zero. -/
theorem two_observables_never_have_commutator_one [StarRing A] (h2 : ∀ a : A, a + a = 0 → a = 0) (hA : (1 : A) ≠ 0)
    (P Q : A) (hP : star P = P) (hQ : star Q = Q) : P * Q - Q * P ≠ 1 := by
  intro h
  have e := the_commutator_of_two_observables_is_reversed P Q hP hQ
  rw [h, star_one] at e
  exact hA (h2 1 (by nth_rewrite 1 [e]; exact neg_add_cancel 1))

end Canonical

/-! ## Part VII. A seat with a shift, and a coordinate along it. -/

/-- THE WEYL FORM. Let `s` be a map of the seat and `q` a reading that the map raises by one. Shifting the reading `q f`
gives `(q + 1)` times the shifted `f`. -/
theorem the_weyl_form {X K : Type*} [CommRing K] (s : X → X) (q : X → K) (hq : ∀ x, q (s x) = q x + 1) (f : X → K)
    (x : X) : (fun y => q y * f y) (s x) = (q x + 1) * f (s x) := by
  show q (s x) * f (s x) = (q x + 1) * f (s x); rw [hq]

/-- THE DIFFERENCE AGAINST THE COORDINATE. The difference `f ∘ s − f` and the coordinate have commutator the shift. -/
theorem the_difference_against_the_coordinate {X K : Type*} [CommRing K] (s : X → X) (q : X → K)
    (hq : ∀ x, q (s x) = q x + 1) (f : X → K) (x : X) :
    (q (s x) * f (s x) - q x * f x) - q x * (f (s x) - f x) = f (s x) := by
  rw [hq]; ring

/-- A SEAT WITH A COORDINATE ALONG ITS SHIFT IS INFINITE. From any point the shift never returns: the points
`x, s x, s (s x), …` are all different, where the values have characteristic zero. -/
theorem a_seat_with_a_coordinate_along_its_shift_is_infinite {X K : Type*} [CommRing K] [CharZero K] (s : X → X)
    (q : X → K) (hq : ∀ x, q (s x) = q x + 1) (x : X) : Function.Injective (fun n : ℕ => s^[n] x) := by
  have hn : ∀ n : ℕ, q (s^[n] x) = q x + n := by
    intro n
    induction n with
    | zero => simp
    | succ k ih => rw [Function.iterate_succ_apply', hq, ih]; push_cast; ring
  intro m n h
  have h' : s^[m] x = s^[n] x := h
  have e := congrArg q h'
  rw [hn, hn] at e
  exact_mod_cast add_left_cancel e

/-- A FINITE SEAT HAS NO COORDINATE ALONG ANY SHIFT. -/
theorem a_finite_seat_has_no_coordinate_along_a_shift {X K : Type*} [Finite X] [Nonempty X] [CommRing K] [CharZero K]
    (s : X → X) (q : X → K) : ¬ ∀ x, q (s x) = q x + 1 := by
  intro hq
  obtain ⟨x⟩ := ‹Nonempty X›
  exact not_injective_infinite_finite _ (a_seat_with_a_coordinate_along_its_shift_is_infinite s q hq x)

/-! ## Part VIII. The ladder. The seat is any seat `Y` together with the whole numbers: a state is a point of `Y` and a count. -/

section Ladder
variable {Y K : Type*} [CommRing K]

/-- One step up: the reading at count `n + 1` becomes the reading at `n`; at count zero there is nothing below. -/
def up (f : Y × ℕ → K) : Y × ℕ → K := fun p => match p.2 with
  | 0 => 0
  | n + 1 => f (p.1, n)

/-- One step down, weighted by the count it leaves. -/
def down (f : Y × ℕ → K) : Y × ℕ → K := fun p => ((p.2 : K) + 1) * f (p.1, p.2 + 1)

/-- THE LADDER IS A CANONICAL PAIR, on every reading and at every state: down after up, less up after down, is the
reading itself. -/
theorem the_ladder_is_a_canonical_pair (f : Y × ℕ → K) (p : Y × ℕ) : down (up f) p - up (down f) p = f p := by
  obtain ⟨y, n⟩ := p
  cases n with
  | zero => show (((0 : ℕ) : K) + 1) * f (y, 0) - 0 = f (y, 0); simp
  | succ k => show ((((k + 1 : ℕ)) : K) + 1) * f (y, k + 1) - ((k : K) + 1) * f (y, k + 1) = f (y, k + 1); push_cast; ring

/-- THE COUNT IS THE PRODUCT OF THE LADDER. Up after down multiplies a reading by the count of the state. -/
theorem the_count_is_the_product_of_the_ladder (f : Y × ℕ → K) (p : Y × ℕ) : up (down f) p = (p.2 : K) * f p := by
  obtain ⟨y, n⟩ := p
  cases n with
  | zero => show (0 : K) = ((0 : ℕ) : K) * f (y, 0); simp
  | succ k => show ((k : K) + 1) * f (y, k + 1) = ((k + 1 : ℕ) : K) * f (y, k + 1); push_cast; ring

/-- Down after up multiplies by the count and one more. -/
theorem down_after_up_is_the_count_and_one (f : Y × ℕ → K) (p : Y × ℕ) : down (up f) p = ((p.2 : K) + 1) * f p := by
  obtain ⟨y, n⟩ := p
  rfl

/-- The step up raises the count by one: the reading that is one at count `n` goes to the reading that is one at `n + 1`. -/
theorem the_step_up_raises_the_count (y : Y) (n : ℕ) (f : Y × ℕ → K) : up f (y, n + 1) = f (y, n) := rfl

end Ladder

/-! ## Part IX. The line. The readings are the polynomials; the derivative is the generator of the shift. -/

open Polynomial in
/-- THE CANONICAL FORM ON THE LINE. The derivative and the position have commutator one, on every polynomial reading. -/
theorem the_canonical_form_on_the_line {K : Type*} [CommRing K] (p : K[X]) :
    derivative (X * p) - X * derivative p = p := by
  rw [derivative_mul, derivative_X, one_mul]; ring

open Polynomial in
/-- THE FOLD OF THE LINE REVERSES THE DERIVATIVE, as it reverses the position. -/
theorem the_fold_of_the_line_reverses_the_derivative {K : Type*} [CommRing K] (p : K[X]) :
    derivative (p.comp (-X)) = -((derivative p).comp (-X)) := by
  rw [derivative_comp, derivative_neg, derivative_X]; ring

/-! ## Part X. A finite seat. Every quantity that acts on its readings is a matrix indexed by the seat. -/

section Finite
variable {X K : Type*} [Fintype X] [DecidableEq X]

/-- A map of the seat, as a quantity. -/
def mapMatrix [Zero K] [One K] (σ : X → X) : Matrix X X K := fun x y => if y = σ x then 1 else 0

/-- EVERY MAP OF THE SEAT MOVES A READING ACROSS ITSELF. For any map, its own inverse or not, the map times a reading is
the moved reading times the map. Every family and every group of maps is covered. -/
theorem every_map_moves_a_reading_across [CommRing K] (σ : X → X) (f : X → K) :
    mapMatrix σ * Matrix.diagonal f = Matrix.diagonal (fun x => f (σ x)) * (mapMatrix σ : Matrix X X K) := by
  ext x y
  simp only [Matrix.mul_diagonal, Matrix.diagonal_mul, mapMatrix]
  split_ifs with h
  · rw [h, one_mul, mul_one]
  · rw [zero_mul, mul_zero]

/-- NO CANONICAL PAIR ON A FINITE SEAT. Among all the quantities on the readings of a finite seat that is not empty, with
values in a field of characteristic zero, no pair has commutator one. -/
theorem no_canonical_pair_on_a_finite_seat [Nonempty X] [Field K] [CharZero K] (P Q : Matrix X X K) :
    P * Q - Q * P ≠ 1 :=
  no_canonical_pair_under_a_trace Matrix.trace (fun a b => Matrix.trace_sub a b) (fun a b => Matrix.trace_mul_comm a b)
    (by rw [Matrix.trace_one]; exact_mod_cast Fintype.card_ne_zero) P Q

end Finite

/-- THE CANONICAL QUESTION IS DECIDED BY THE SEAT. On a finite seat no pair of quantities is canonical. On a seat that
carries a count, over any other seat, the ladder is canonical and its product is the count. A seat with a coordinate
along a shift is infinite. And a canonical pair of observables is none: its constant is reversed by the adjoint. -/
theorem the_canonical_question_is_decided_by_the_seat :
    (∀ (n : ℕ) (P Q : Matrix (Fin (n + 1)) (Fin (n + 1)) ℚ), P * Q - Q * P ≠ 1)
    ∧ (∀ (f : Unit × ℕ → ℚ) (p : Unit × ℕ), down (up f) p - up (down f) p = f p)
    ∧ (∀ (f : Unit × ℕ → ℚ) (p : Unit × ℕ), up (down f) p = (p.2 : ℚ) * f p)
    ∧ (∀ (s : ℕ → ℕ) (q : ℕ → ℚ), (∀ x, q (s x) = q x + 1) → ∀ x, Function.Injective (fun n : ℕ => s^[n] x))
    ∧ (∀ (P Q : ℚ), P * Q - Q * P ≠ 1) :=
  ⟨fun _ P Q => no_canonical_pair_on_a_finite_seat P Q, the_ladder_is_a_canonical_pair,
   the_count_is_the_product_of_the_ladder, fun s q hq x => a_seat_with_a_coordinate_along_its_shift_is_infinite s q hq x,
   fun P Q => by rw [mul_comm, sub_self]; exact zero_ne_one⟩


/-! ## Part XI. Every infinite seat carries a count, and with it a canonical pair.
THE BOUNDARY. This Part uses the axiom of choice in its argument: the matching of an infinite seat with itself taken
together with the whole numbers is a theorem of choice. Its kernel lines print the axiom. -/

section Count

/-- EVERY INFINITE SEAT HOLDS THE WHOLE NUMBERS. -/
theorem every_infinite_seat_holds_the_whole_numbers (X : Type*) [Infinite X] : ∃ e : ℕ → X, Function.Injective e :=
  ⟨Infinite.natEmbedding X, (Infinite.natEmbedding X).injective⟩

open Cardinal in
/-- EVERY INFINITE SEAT IS A SEAT WITH A COUNT. It is matched, one to one and onto, with itself taken together with
the whole numbers. -/
theorem every_infinite_seat_is_a_seat_with_a_count (X : Type*) [Infinite X] : Nonempty (X × ℕ ≃ X) := by
  have h : #(X × ℕ) = #X := by
    rw [mk_prod, lift_uzero, mk_nat, lift_aleph0, mul_aleph0_eq (aleph0_le_mk X)]
  exact Cardinal.eq.1 h

/-- A SEAT CARRIES A COUNT EXACTLY WHEN IT IS INFINITE, for a seat that is not empty. -/
theorem a_seat_carries_a_count_iff_it_is_infinite (X : Type*) [Nonempty X] : Nonempty (X × ℕ ≃ X) ↔ Infinite X :=
  ⟨fun ⟨e⟩ => e.infinite_iff.mp inferInstance, fun _ => every_infinite_seat_is_a_seat_with_a_count X⟩

variable {Y X K : Type*} [CommRing K]

/-- The step up, carried across a matching of the seat with a seat that has a count. -/
def upOn (e : Y × ℕ ≃ X) (f : X → K) : X → K := fun x => up (fun p => f (e p)) (e.symm x)

/-- The step down, carried across the same matching. -/
def downOn (e : Y × ℕ ≃ X) (f : X → K) : X → K := fun x => down (fun p => f (e p)) (e.symm x)

/-- THE LADDER CARRIES ACROSS A MATCHING. On every reading of the matched seat and at every point: down after up, less
up after down, is the reading itself. This theorem takes the matching as given and uses no choice. -/
theorem the_ladder_carries_across_a_matching (e : Y × ℕ ≃ X) (f : X → K) (x : X) :
    downOn e (upOn e f) x - upOn e (downOn e f) x = f x := by
  have h1 : (fun p => upOn e f (e p)) = up (fun p => f (e p)) := by funext p; simp [upOn]
  have h2 : (fun p => downOn e f (e p)) = down (fun p => f (e p)) := by funext p; simp [downOn]
  show down (fun p => upOn e f (e p)) (e.symm x) - up (fun p => downOn e f (e p)) (e.symm x) = f x
  rw [h1, h2, the_ladder_is_a_canonical_pair]; simp

/-- The step up as a quantity: a linear map of the readings. -/
def upLin (e : Y × ℕ ≃ X) : Module.End K (X → K) where
  toFun := upOn e
  map_add' f g := by
    funext x; simp only [upOn, Pi.add_apply]
    generalize e.symm x = p; obtain ⟨y, n⟩ := p; cases n <;> simp [up]
  map_smul' c f := by
    funext x; simp only [upOn, Pi.smul_apply, RingHom.id_apply]
    generalize e.symm x = p; obtain ⟨y, n⟩ := p; cases n <;> simp [up]

/-- The step down as a quantity. -/
def downLin (e : Y × ℕ ≃ X) : Module.End K (X → K) where
  toFun := downOn e
  map_add' f g := by funext x; simp only [downOn, down, Pi.add_apply]; ring
  map_smul' c f := by funext x; simp only [downOn, down, Pi.smul_apply, RingHom.id_apply, smul_eq_mul]; ring

/-- A SEAT MATCHED WITH A COUNT CARRIES A CANONICAL PAIR OF QUANTITIES, in the ring of all linear maps of its readings.
The matching is given; no choice is used. -/
theorem a_seat_matched_with_a_count_carries_a_canonical_pair (e : Y × ℕ ≃ X) :
    (downLin e : Module.End K (X → K)) * upLin e - upLin e * downLin e = 1 :=
  LinearMap.ext fun f => funext fun x => the_ladder_carries_across_a_matching e f x

/-- EVERY INFINITE SEAT CARRIES A CANONICAL PAIR, among the linear maps of its readings, with values in any
commutative ring. -/
theorem every_infinite_seat_carries_a_canonical_pair (X : Type*) [Infinite X] (K : Type*) [CommRing K] :
    ∃ P Q : Module.End K (X → K), P * Q - Q * P = 1 := by
  obtain ⟨e⟩ := every_infinite_seat_is_a_seat_with_a_count X
  exact ⟨downLin e, upLin e, a_seat_matched_with_a_count_carries_a_canonical_pair e⟩

/-- NO CANONICAL PAIR AMONG THE QUANTITIES OF A FINITE SEAT. Every linear map of the readings of a finite seat is a
matrix indexed by the seat, and Part X applies. The seat is not empty; the values are a field of characteristic zero. -/
theorem no_canonical_pair_among_the_quantities_of_a_finite_seat (X : Type*) [Finite X] [Nonempty X] (K : Type*)
    [Field K] [CharZero K] (P Q : Module.End K (X → K)) : P * Q - Q * P ≠ 1 := by
  classical
  haveI := Fintype.ofFinite X
  intro h
  have e := congrArg (LinearMap.toMatrixAlgEquiv' (R := K) (n := X)) h
  rw [map_sub, map_mul, map_mul, map_one] at e
  exact no_canonical_pair_on_a_finite_seat _ _ e

/-- THE DICHOTOMY, EXACT. A seat that is not empty carries a canonical pair among the linear maps of its readings
exactly when it is infinite. The values are a field of characteristic zero. -/
theorem a_seat_carries_a_canonical_pair_iff_it_is_infinite (X : Type*) [Nonempty X] (K : Type*) [Field K]
    [CharZero K] : (∃ P Q : Module.End K (X → K), P * Q - Q * P = 1) ↔ Infinite X := by
  constructor
  · rintro ⟨P, Q, h⟩
    by_contra hX
    haveI : Finite X := not_infinite_iff_finite.mp hX
    exact no_canonical_pair_among_the_quantities_of_a_finite_seat X K P Q h
  · intro _; exact every_infinite_seat_carries_a_canonical_pair X K

/-- THE LADDER IS ADJOINT UNDER THE WEIGHTED PAIRING. With each count weighted by its factorial, the step up on one
side of the pairing is the step down on the other, on every pair of readings and up to every count. -/
theorem the_ladder_is_adjoint_under_the_weighted_pairing {Y K : Type*} [CommRing K] (f g : Y × ℕ → K) (y : Y)
    (N : ℕ) : ∑ n ∈ Finset.range (N + 1), (n.factorial : K) * up f (y, n) * g (y, n)
      = ∑ n ∈ Finset.range N, (n.factorial : K) * f (y, n) * down g (y, n) := by
  rw [Finset.sum_range_succ']
  have z : ((Nat.factorial 0 : ℕ) : K) * up f (y, 0) * g (y, 0) = 0 := by
    show ((Nat.factorial 0 : ℕ) : K) * 0 * g (y, 0) = 0; ring
  rw [z, add_zero]
  refine Finset.sum_congr rfl fun k _ => ?_
  show (((k + 1).factorial : ℕ) : K) * f (y, k) * g (y, k + 1) = (k.factorial : K) * f (y, k) * (((k : K) + 1) * g (y, k + 1))
  rw [Nat.factorial_succ]; push_cast; ring

end Count

/-! ## Part XII. The Hilbert space, subsumed.
THE BOUNDARY. A Hilbert space is built on the real numbers, and the library builds the real numbers with the axiom of
choice. Every kernel line of this Part and the next therefore prints the axiom: it enters with the numbers, before any
argument of this file. -/

section Hilbert
open scoped InnerProductSpace

/-- A form on states: linear in the second place, conjugate-linear in the first. This is the spectral seat of the
Quantization kernel, written out here word for word. -/
structure Form (K V : Type) [Field K] [StarRing K] [AddCommGroup V] [Module K V] where
  ip : V → V → K
  right : ∀ (u v : V) (c : K), ip u (c • v) = c * ip u v
  left : ∀ (u v : V) (c : K), ip (c • u) v = star c * ip u v

/-- THE REGISTRATIONS OF AN OBSERVABLE ARE ON THE LINE, on any form. As in the Quantization kernel. -/
theorem the_registrations_of_an_observable_are_on_the_line {K V : Type} [Field K] [StarRing K] [AddCommGroup V]
    [Module K V] (B : Form K V) (T : V → V) (sym : ∀ u v, B.ip (T u) v = B.ip u (T v)) (v : V) (lam : K)
    (h : T v = lam • v) (norm : B.ip v v ≠ 0) : star lam = lam := by
  have e := sym v v
  rw [h, B.left, B.right] at e
  exact mul_right_cancel₀ norm e

/-- STATES WITH DIFFERENT REGISTRATIONS ARE ORTHOGONAL, on any form. As in the Quantization kernel. -/
theorem states_with_different_registrations_are_orthogonal {K V : Type} [Field K] [StarRing K] [AddCommGroup V]
    [Module K V] (B : Form K V) (T : V → V) (sym : ∀ u v, B.ip (T u) v = B.ip u (T v)) (u v : V) (mu lam : K)
    (hu : T u = mu • u) (hv : T v = lam • v) (real : star mu = mu) (ne : mu ≠ lam) : B.ip u v = 0 := by
  have e := sym u v
  rw [hu, hv, B.left, B.right, real] at e
  have z : (mu - lam) * B.ip u v = 0 := by rw [sub_mul, e, sub_self]
  rcases mul_eq_zero.mp z with h0 | h0
  · exact absurd (sub_eq_zero.mp h0) ne
  · exact h0

variable {𝕜 E : Type} [RCLike 𝕜] [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]

/-- EVERY SPACE WITH AN INNER PRODUCT IS A SPECTRAL SEAT. Real or complex, complete or not, of any dimension: its inner
product is a form in the sense above. -/
def everySpaceWithAnInnerProductIsASpectralSeat : Form 𝕜 E where
  ip u v := ⟪u, v⟫_𝕜
  right u v c := inner_smul_right u v c
  left u v c := inner_smul_left u v c

/-- THE FORM OF THE SEAT IS THE INNER PRODUCT ITSELF. -/
theorem the_form_of_the_seat_is_the_inner_product (u v : E) :
    (everySpaceWithAnInnerProductIsASpectralSeat : Form 𝕜 E).ip u v = ⟪u, v⟫_𝕜 := rfl

/-- NO STATE BUT ZERO HAS NORM ZERO under the form of an inner product. -/
theorem a_state_that_is_not_zero_has_a_norm (v : E) (hv : v ≠ 0) :
    (everySpaceWithAnInnerProductIsASpectralSeat : Form 𝕜 E).ip v v ≠ 0 := inner_self_ne_zero.mpr hv

section Complete
variable [CompleteSpace E]

/-- THE BOUNDED QUANTITIES OF A HILBERT SPACE ARE A RING WITH AN ADJOINT. The adjoint is the adjoint operator. This is a
quantization in the sense of the Quantization paper, and every theorem of Part VI holds in it. -/
noncomputable def theBoundedQuantitiesOfAHilbertSpaceAreARingWithAnAdjoint : StarRing (E →L[𝕜] E) := inferInstance

/-- THE ADJOINT OF THE RING IS THE ADJOINT OF THE FORM. -/
theorem the_adjoint_of_the_ring_is_the_adjoint_of_the_form (T : E →L[𝕜] E) (u v : E) :
    ⟪(star T) u, v⟫_𝕜 = ⟪u, T v⟫_𝕜 := by
  rw [ContinuousLinearMap.star_eq_adjoint]; exact ContinuousLinearMap.adjoint_inner_left T v u

/-- AN OBSERVABLE OF A HILBERT SPACE IS SYMMETRIC UNDER ITS FORM. -/
theorem an_observable_of_a_hilbert_space_is_symmetric_under_its_form (T : E →L[𝕜] E) (hT : star T = T) (u v : E) :
    (everySpaceWithAnInnerProductIsASpectralSeat : Form 𝕜 E).ip (T u) v
      = (everySpaceWithAnInnerProductIsASpectralSeat : Form 𝕜 E).ip u (T v) := by
  have e := the_adjoint_of_the_ring_is_the_adjoint_of_the_form T u v
  rw [hT] at e; exact e

/-- THE REGISTRATIONS OF AN OBSERVABLE OF A HILBERT SPACE ARE ON THE LINE. The theorem of the spectral seat, applied. -/
theorem the_registrations_of_an_observable_of_a_hilbert_space_are_on_the_line (T : E →L[𝕜] E) (hT : star T = T)
    (v : E) (lam : 𝕜) (h : T v = lam • v) (hv : v ≠ 0) : star lam = lam :=
  the_registrations_of_an_observable_are_on_the_line everySpaceWithAnInnerProductIsASpectralSeat T
    (an_observable_of_a_hilbert_space_is_symmetric_under_its_form T hT) v lam h
    (a_state_that_is_not_zero_has_a_norm v hv)

/-- STATES OF A HILBERT SPACE WITH DIFFERENT REGISTRATIONS ARE ORTHOGONAL. The theorem of the spectral seat, applied. -/
theorem states_of_a_hilbert_space_with_different_registrations_are_orthogonal (T : E →L[𝕜] E) (hT : star T = T)
    (u v : E) (mu lam : 𝕜) (hu : T u = mu • u) (hv : T v = lam • v) (hu0 : u ≠ 0) (ne : mu ≠ lam) :
    ⟪u, v⟫_𝕜 = 0 :=
  states_with_different_registrations_are_orthogonal everySpaceWithAnInnerProductIsASpectralSeat T
    (an_observable_of_a_hilbert_space_is_symmetric_under_its_form T hT) u v mu lam hu hv
    (the_registrations_of_an_observable_of_a_hilbert_space_are_on_the_line T hT u mu hu hu0) ne

/-- THE VALUE OF AN OBSERVABLE IN ANY STATE IS ON THE LINE. -/
theorem the_value_of_an_observable_in_any_state_is_on_the_line (T : E →L[𝕜] E) (hT : star T = T) (v : E) :
    star ⟪v, T v⟫_𝕜 = ⟪v, T v⟫_𝕜 := by
  have e := the_adjoint_of_the_ring_is_the_adjoint_of_the_form T v v
  rw [hT] at e
  exact (inner_conj_symm (𝕜 := 𝕜) (T v) v).trans e

/-- TWO OBSERVABLES OF A HILBERT SPACE NEVER HAVE COMMUTATOR ONE. Part VI, applied. The space is not the zero space. -/
theorem two_observables_of_a_hilbert_space_never_have_commutator_one [Nontrivial E] (P Q : E →L[𝕜] E)
    (hP : star P = P) (hQ : star Q = Q) : P * Q - Q * P ≠ 1 := by
  refine two_observables_never_have_commutator_one (fun a h => ?_) ?_ P Q hP hQ
  · rw [← two_smul 𝕜 a] at h
    exact (smul_eq_zero.mp h).resolve_left two_ne_zero
  · intro h
    obtain ⟨v, hv⟩ := exists_ne (0 : E)
    exact hv (by simpa using congrArg (fun T : E →L[𝕜] E => T v) h)

end Complete

/-- NO CANONICAL PAIR IN A RING WITH A NORM. In any ring with a norm over the real or the complex numbers, where one is
not zero, no pair has commutator one. Part VI gives `P Qⁿ⁺¹ − Qⁿ⁺¹ P = (n + 1) Qⁿ` with no power of `Q` zero; the norm
then bounds every whole number by twice the norms of the pair. -/
theorem no_canonical_pair_in_a_ring_with_a_norm {𝕂 A : Type*} [RCLike 𝕂] [NormedRing A] [NormedAlgebra 𝕂 A]
    (hA : (1 : A) ≠ 0) (P Q : A) : P * Q - Q * P ≠ 1 := by
  intro h
  have ht : ∀ (n : ℕ) (a : A), (n + 1) • a = 0 → a = 0 := by
    intro n a ha
    rw [← Nat.cast_smul_eq_nsmul 𝕂] at ha
    exact (smul_eq_zero.mp ha).resolve_left (Nat.cast_ne_zero.mpr (Nat.succ_ne_zero n))
  have hnil := a_canonical_pair_is_never_nilpotent hA ht P Q h
  have key : ∀ n : ℕ, ((n : ℝ) + 1) ≤ 2 * ‖P‖ * ‖Q‖ := by
    intro n
    have e := a_canonical_pair_against_a_power P Q h n
    have hpos : 0 < ‖Q ^ n‖ := norm_pos_iff.mpr (hnil n)
    have e1 : ‖(n + 1) • Q ^ n‖ = ((n : ℝ) + 1) * ‖Q ^ n‖ := by
      rw [← Nat.cast_smul_eq_nsmul 𝕂, norm_smul, RCLike.norm_natCast]; push_cast; ring
    have e3 : ‖Q ^ (n + 1)‖ ≤ ‖Q ^ n‖ * ‖Q‖ := by rw [pow_succ]; exact norm_mul_le _ _
    have e2 : ‖P * Q ^ (n + 1) - Q ^ (n + 1) * P‖ ≤ 2 * ‖P‖ * ‖Q‖ * ‖Q ^ n‖ := by
      calc ‖P * Q ^ (n + 1) - Q ^ (n + 1) * P‖ ≤ ‖P * Q ^ (n + 1)‖ + ‖Q ^ (n + 1) * P‖ := norm_sub_le _ _
        _ ≤ ‖P‖ * ‖Q ^ (n + 1)‖ + ‖Q ^ (n + 1)‖ * ‖P‖ := add_le_add (norm_mul_le _ _) (norm_mul_le _ _)
        _ ≤ ‖P‖ * (‖Q ^ n‖ * ‖Q‖) + (‖Q ^ n‖ * ‖Q‖) * ‖P‖ :=
            add_le_add (mul_le_mul_of_nonneg_left e3 (norm_nonneg _)) (mul_le_mul_of_nonneg_right e3 (norm_nonneg _))
        _ = 2 * ‖P‖ * ‖Q‖ * ‖Q ^ n‖ := by ring
    rw [e, e1] at e2
    exact le_of_mul_le_mul_right e2 hpos
  obtain ⟨n, hn⟩ := exists_nat_gt (2 * ‖P‖ * ‖Q‖)
  have := key n
  linarith

/-- NO CANONICAL PAIR AMONG THE BOUNDED QUANTITIES OF A HILBERT SPACE, of any dimension, where the space is not the zero
space. Completeness is not used. A canonical pair on a space with a norm is a pair of unbounded quantities. -/
theorem no_canonical_pair_among_the_bounded_quantities_of_a_hilbert_space [Nontrivial E] (P Q : E →L[𝕜] E) :
    P * Q - Q * P ≠ 1 := by
  refine no_canonical_pair_in_a_ring_with_a_norm (𝕂 := 𝕜) ?_ P Q
  intro h
  obtain ⟨v, hv⟩ := exists_ne (0 : E)
  exact hv (by simpa using congrArg (fun T : E →L[𝕜] E => T v) h)

end Hilbert

/-! ## Part XIII. The converse: a ring with an adjoint and a positive reading is a space with a form.
A positive reading is a linear reading `ω` of the ring with `ω (a†) = conj (ω a)` and `ω (a† a)` of real part at least
zero. The boundary of Part XII holds here: the values are the complex numbers. -/

section Representation
variable {A : Type} [Ring A] [StarRing A] [Algebra ℂ A] [StarModule ℂ A]

/-- The form of a reading: the reading of `a† b`. -/
def readingForm (ω : A →ₗ[ℂ] ℂ) : Form ℂ A where
  ip a b := ω (star a * b)
  right a b c := by rw [mul_smul_comm, map_smul, smul_eq_mul]
  left a b c := by rw [star_smul, smul_mul_assoc, map_smul, smul_eq_mul]

/-- THE RING ACTS ON ITSELF WITH ITS ADJOINT THE ADJOINT OF THE FORM. For any linear reading. -/
theorem the_ring_acts_with_its_adjoint_the_adjoint_of_the_form (ω : A →ₗ[ℂ] ℂ) (c a b : A) :
    (readingForm ω).ip (c * a) b = (readingForm ω).ip a (star c * b) := by
  show ω (star (c * a) * b) = ω (star a * (star c * b)); rw [star_mul, mul_assoc]

/-- AN OBSERVABLE OF THE RING IS SYMMETRIC UNDER THE FORM OF ANY READING. So the two theorems of the spectral seat hold
for every observable of every ring with an adjoint, acting on the ring. -/
theorem an_observable_of_the_ring_is_symmetric_under_the_form (ω : A →ₗ[ℂ] ℂ) (c : A) (hc : star c = c) (a b : A) :
    (readingForm ω).ip (c * a) b = (readingForm ω).ip a (c * b) := by
  rw [the_ring_acts_with_its_adjoint_the_adjoint_of_the_form, hc]

/-- THE FORM OF A READING THAT RESPECTS THE ADJOINT IS REVERSED BY CONJUGATION. -/
theorem the_form_of_a_reading_is_conjugate_symmetric (ω : A →ₗ[ℂ] ℂ) (hω : ∀ a, ω (star a) = star (ω a)) (a b : A) :
    star ((readingForm ω).ip a b) = (readingForm ω).ip b a := by
  show star (ω (star a * b)) = ω (star b * a); rw [← hω, star_mul, star_star]

/-- A positive reading makes the ring a space with a positive form, in the library's own sense. -/
def positiveReadingCore (ω : A →ₗ[ℂ] ℂ) (hω : ∀ a, ω (star a) = star (ω a))
    (pos : ∀ a, 0 ≤ (ω (star a * a)).re) : PreInnerProductSpace.Core ℂ A where
  inner a b := ω (star a * b)
  conj_inner_symm a b := by
    show star (ω (star b * a)) = ω (star a * b); rw [← hω, star_mul, star_star]
  re_inner_nonneg a := pos a
  add_left a b c := by show ω (star (a + b) * c) = ω (star a * c) + ω (star b * c); rw [star_add, add_mul, map_add]
  smul_left a b r := by
    show ω (star (r • a) * b) = star r * ω (star a * b); rw [star_smul, smul_mul_assoc, map_smul, smul_eq_mul]

/-- THE INEQUALITY OF THE FORM. For a positive reading, the overlap of two states is bounded by their norms. -/
theorem the_overlap_is_bounded_by_the_norms (ω : A →ₗ[ℂ] ℂ) (hω : ∀ a, ω (star a) = star (ω a))
    (pos : ∀ a, 0 ≤ (ω (star a * a)).re) (a b : A) :
    ‖ω (star a * b)‖ * ‖ω (star b * a)‖ ≤ (ω (star a * a)).re * (ω (star b * b)).re :=
  @InnerProductSpace.Core.inner_mul_inner_self_le ℂ A _ _ _ (positiveReadingCore ω hω pos) a b

/-- THE STATES OF NORM ZERO ARE CARRIED INTO THEMSELVES BY THE RING. For a positive reading: if `a† a` reads zero, so
does `(c a)† (c a)`, for every `c`. The ring therefore acts on the states taken up to the states of norm zero. -/
theorem the_states_of_norm_zero_are_carried_into_themselves (ω : A →ₗ[ℂ] ℂ) (hω : ∀ a, ω (star a) = star (ω a))
    (pos : ∀ a, 0 ≤ (ω (star a * a)).re) (c a : A) (h : ω (star a * a) = 0) : ω (star (c * a) * (c * a)) = 0 := by
  have e : star (c * a) * (c * a) = star a * (star c * (c * a)) := by rw [star_mul, mul_assoc]
  have cs := the_overlap_is_bounded_by_the_norms ω hω pos a (star c * (c * a))
  rw [h, Complex.zero_re, zero_mul] at cs
  have e2 : ω (star (star c * (c * a)) * a) = star (ω (star a * (star c * (c * a)))) := by
    rw [← hω, star_mul (star a), star_star]
  rw [e2, norm_star] at cs
  rw [e]
  have z : ‖ω (star a * (star c * (c * a)))‖ = 0 := by
    have hn := norm_nonneg (ω (star a * (star c * (c * a))))
    nlinarith
  exact norm_eq_zero.mp z

end Representation

/-! ## Part XIV. What Parts XI to XIII left: the completion, the registrations of the count, and the ground state.
The boundary of Part XII holds for the completion, whose values are the complex numbers. -/

section Completion

/-- A Hilbert home of a space with a form: a complete space with an inner product, and a linear map of the space into
it whose image is dense and which carries the form to the inner product. -/
structure HilbertHome (V : Type) [AddCommGroup V] [Module ℂ V] (form : V → V → ℂ) where
  H : Type
  [normed : NormedAddCommGroup H]
  [product : InnerProductSpace ℂ H]
  [complete : CompleteSpace H]
  into : V →ₗ[ℂ] H
  dense : DenseRange into
  keeps : ∀ a b, inner (into a) (into b) = form a b

variable {A : Type} [Ring A] [StarRing A] [Algebra ℂ A] [StarModule ℂ A]

/-- A RING WITH AN ADJOINT AND A POSITIVE READING HAS A HILBERT HOME. The ring, with the form of its reading, maps onto a
dense part of a Hilbert space, and the form is carried to the inner product. The states of norm zero go to zero. -/
theorem a_ring_with_a_positive_reading_has_a_hilbert_home (ω : A →ₗ[ℂ] ℂ) (hω : ∀ a, ω (star a) = star (ω a))
    (pos : ∀ a, 0 ≤ (ω (star a * a)).re) : Nonempty (HilbertHome A (fun a b => ω (star a * b))) := by
  let c := positiveReadingCore ω hω pos
  letI : SeminormedAddCommGroup A := @InnerProductSpace.Core.toSeminormedAddCommGroup ℂ A _ _ _ c
  letI : NormedSpace ℂ A := @InnerProductSpace.Core.toSeminormedSpace ℂ A _ _ _ c
  letI : InnerProductSpace ℂ A :=
    { c with
      norm_sq_eq_re_inner := fun x => by
        have h₁ : ‖x‖ ^ 2 = √(RCLike.re (c.inner x x)) ^ 2 := rfl
        have h₂ : 0 ≤ RCLike.re (c.inner x x) := pos x
        rw [h₁, Real.sq_sqrt h₂] }
  exact ⟨{ H := UniformSpace.Completion A
           into := (UniformSpace.Completion.toComplₗᵢ (𝕜 := ℂ) (E := A)).toLinearMap
           dense := UniformSpace.Completion.denseRange_coe
           keeps := fun a b => UniformSpace.Completion.inner_coe a b }⟩

end Completion

section CountRegistrations
variable {Y K : Type*} [CommRing K]

/-- EVERY REGISTRATION OF THE COUNT IS A WHOLE NUMBER. The count is up after down. If it multiplies a reading that is
not zero by one value, that value is a whole number. The values have no divisors of zero. -/
theorem every_registration_of_the_count_is_a_whole_number [NoZeroDivisors K] (f : Y × ℕ → K) (lam : K)
    (h : ∀ p, up (down f) p = lam * f p) (hf : f ≠ 0) : ∃ n : ℕ, lam = n := by
  obtain ⟨p, hp⟩ := Function.ne_iff.mp hf
  refine ⟨p.2, ?_⟩
  have e := h p
  rw [the_count_is_the_product_of_the_ladder] at e
  exact (mul_right_cancel₀ hp e).symm

/-- EVERY WHOLE NUMBER IS A REGISTRATION OF THE COUNT, at every point of the other seat, where one is not zero. -/
theorem every_whole_number_is_a_registration_of_the_count [Nontrivial K] (y : Y) (n : ℕ) :
    ∃ f : Y × ℕ → K, f ≠ 0 ∧ ∀ p, up (down f) p = (n : K) * f p := by
  classical
  refine ⟨fun p => if p = (y, n) then 1 else 0, ?_, ?_⟩
  · intro h
    have e := congrFun h (y, n)
    simp at e
  · intro p
    rw [the_count_is_the_product_of_the_ladder]
    by_cases hp : p = (y, n)
    · subst hp; simp
    · simp [hp]

/-- THE LADDER HAS A GROUND STATE. A reading carried at count zero alone is sent to zero by the step down. -/
theorem the_ladder_has_a_ground_state (f : Y × ℕ → K) (h : ∀ y n, f (y, n + 1) = 0) : down f = 0 := by
  funext p; show ((p.2 : K) + 1) * f (p.1, p.2 + 1) = 0; rw [h, mul_zero]

end CountRegistrations

section Ground
variable {K V : Type*} [CommRing K] [AddCommGroup V] [Module K V]

/-- A GROUND STATE CARRIES THE LADDER. For any canonical pair of linear maps of any space, and any state the first
member sends to zero: the first member takes the rung `n + 1` above that state to `n + 1` times the rung `n`. -/
theorem a_ground_state_carries_the_ladder (P Q : Module.End K V) (h : P * Q - Q * P = 1) (v : V) (hv : P v = 0)
    (n : ℕ) : P ((Q ^ (n + 1)) v) = (n + 1) • (Q ^ n) v := by
  have e := congrArg (fun T : Module.End K V => T v) (a_canonical_pair_against_a_power P Q h n)
  simp only [LinearMap.sub_apply, Module.End.mul_apply, hv, map_zero, sub_zero] at e
  rw [e]; rfl

/-- THE COUNT REGISTERS EACH RUNG. The second member after the first multiplies the rung `n` by `n`. -/
theorem the_count_registers_each_rung (P Q : Module.End K V) (h : P * Q - Q * P = 1) (v : V) (hv : P v = 0)
    (n : ℕ) : (Q * P) ((Q ^ n) v) = n • (Q ^ n) v := by
  cases n with
  | zero => simp [hv]
  | succ k =>
    rw [Module.End.mul_apply, a_ground_state_carries_the_ladder P Q h v hv k, map_nsmul, pow_succ' Q k,
      Module.End.mul_apply]

/-- NO RUNG IS EMPTY, where no whole multiple annihilates a state and the ground state is not zero. -/
theorem no_rung_is_empty (ht : ∀ (n : ℕ) (x : V), (n + 1) • x = 0 → x = 0) (P Q : Module.End K V)
    (h : P * Q - Q * P = 1) (v : V) (hv : P v = 0) (hv0 : v ≠ 0) (n : ℕ) : (Q ^ n) v ≠ 0 := by
  induction n with
  | zero => simpa using hv0
  | succ k ih =>
    intro h0
    have e := a_ground_state_carries_the_ladder P Q h v hv k
    rw [h0, map_zero] at e
    exact ih (ht k _ e.symm)

/-- THE RUNGS ARE INDEPENDENT. Over a field of characteristic zero, the rungs above a ground state that is not zero
are linearly independent. With the two theorems above, the first and second member act on them by the rule of the
ladder of Part VIII and by no other: a canonical pair with a ground state holds one copy of the ladder, and any two
such copies are matched rung to rung. -/
theorem the_rungs_are_independent {K V : Type*} [Field K] [CharZero K] [AddCommGroup V] [Module K V]
    (P Q : Module.End K V) (h : P * Q - Q * P = 1) (v : V) (hv : P v = 0) (hv0 : v ≠ 0) :
    LinearIndependent K (fun n : ℕ => (Q ^ n) v) := by
  have ht : ∀ (n : ℕ) (x : V), (n + 1) • x = 0 → x = 0 := by
    intro n x hx
    rw [← Nat.cast_smul_eq_nsmul K] at hx
    exact (smul_eq_zero.mp hx).resolve_left (Nat.cast_ne_zero.mpr (Nat.succ_ne_zero n))
  refine Module.End.eigenvectors_linearIndependent' (Q * P) (fun n : ℕ => (n : K)) Nat.cast_injective _ fun n => ⟨?_, ?_⟩
  · rw [Module.End.mem_eigenspace_iff, the_count_registers_each_rung P Q h v hv n, Nat.cast_smul_eq_nsmul]
  · exact no_rung_is_empty ht P Q h v hv hv0 n

end Ground

/-! ## Part XV. Two statements the earlier kernels left: the finest registration, and the symmetry with no finite period.
The first prints the axiom of choice with excluded middle and the library's finite sets; the second with the numbers. -/

section Finest
variable {n : ℕ} {M : Type*}

/-- Relabelling n quanta, as in the second Quantization kernel. -/
def relabel (π : Equiv.Perm (Fin n)) (x : Fin n → M) : Fin n → M := fun i => x (π i)

/-- The occupation number of a mode, as in the second Quantization kernel. -/
def occupation [DecidableEq M] (x : Fin n → M) (m : M) : ℕ := (Finset.univ.filter (fun i => x i = m)).card

/-- THE SAME OCCUPATION NUMBERS, THE SAME ASSIGNMENT UP TO THE LABELS. Two assignments of n quanta to modes with the
same occupation numbers are relabellings of one another. -/
theorem assignments_with_the_same_occupation_numbers_are_relabellings [DecidableEq M] (x y : Fin n → M)
    (h : occupation x = occupation y) : ∃ π : Equiv.Perm (Fin n), relabel π x = y := by
  have hc : ∀ m, Fintype.card {i // y i = m} = Fintype.card {i // x i = m} := by
    intro m
    have e := congrFun h m
    simp only [occupation] at e
    rw [Fintype.card_subtype, Fintype.card_subtype]; exact e.symm
  let e : ∀ m, {i // y i = m} ≃ {i // x i = m} := fun m => Fintype.equivOfCardEq (hc m)
  let π : Equiv.Perm (Fin n) :=
    (Equiv.sigmaFiberEquiv y).symm.trans ((Equiv.sigmaCongrRight e).trans (Equiv.sigmaFiberEquiv x))
  exact ⟨π, funext fun i => (e (y i) ⟨i, rfl⟩).2⟩

/-- THE OCCUPATION NUMBERS ARE THE FINEST REGISTRATION OF THE RELABELLINGS. Two assignments have the same occupation
numbers exactly when one is a relabelling of the other: the occupation numbers tell apart everything the
relabellings do not join. -/
theorem the_occupation_numbers_are_the_finest_registration [DecidableEq M] (x y : Fin n → M) :
    occupation x = occupation y ↔ ∃ π : Equiv.Perm (Fin n), relabel π x = y := by
  refine ⟨assignments_with_the_same_occupation_numbers_are_relabellings x y, ?_⟩
  rintro ⟨π, rfl⟩
  funext m
  unfold occupation relabel
  exact (Finset.card_bij (fun i _ => π i) (fun i hi => by simpa using hi) (fun _ _ _ _ hij => π.injective hij)
    (fun j hj => ⟨π.symm j, by simpa using hj, by simp⟩)).symm

end Finest

section FullTurn
open Complex Real

/-- THE LABELS OF A FULL TURN ARE THE INTEGERS. Let `χ` give a complex label to every real part of a turn, with
`χ (s + t) = χ s * χ t`, with the whole turn labelled one, and differentiable. Then there is an integer `n` with
`χ t = exp (n · 2πi · t)` for every `t`. No period is supposed finite; the labels are isolated all the same. -/
theorem the_labels_of_a_full_turn_are_the_integers (χ : ℝ → ℂ) (hd : Differentiable ℝ χ)
    (hm : ∀ s t, χ (s + t) = χ s * χ t) (h1 : χ 1 = 1) :
    ∃ n : ℤ, ∀ t : ℝ, χ t = Complex.exp (n * (2 * π * I) * t) := by
  have h0 : χ 0 = 1 := by have e := hm 0 1; rw [zero_add, h1, mul_one] at e; exact e.symm
  set c : ℂ := deriv χ 0 with hc
  have hχ : ∀ x, HasDerivAt χ (χ x * c) x := by
    intro x
    have a : HasDerivAt (fun y => χ (y - x)) c x := by
      have b : HasDerivAt χ c (x - x) := by rw [sub_self]; exact (hd 0).hasDerivAt
      exact b.comp_sub_const x x
    have e : χ = fun y => χ x * χ (y - x) := by funext y; rw [← hm]; congr 1; ring
    exact (a.const_mul (χ x)).congr_of_eventuallyEq (Filter.Eventually.of_forall fun y => congrFun e y)
  have hE : ∀ x : ℝ, HasDerivAt (fun t : ℝ => Complex.exp (-(c * t))) (Complex.exp (-(c * x)) * (-c)) x := by
    intro x
    have a : HasDerivAt (fun t : ℝ => -(c * (t : ℂ))) (-c) x := by
      simpa using (((hasDerivAt_id x).ofReal_comp).const_mul c).neg
    exact a.cexp
  have hg : ∀ x : ℝ, HasDerivAt (fun t : ℝ => χ t * Complex.exp (-(c * t))) 0 x := by
    intro x
    have a := (hχ x).mul (hE x)
    have z : χ x * c * Complex.exp (-(c * x)) + χ x * (Complex.exp (-(c * x)) * -c) = 0 := by ring
    rw [z] at a; exact a
  have hconst : ∀ t : ℝ, χ t * Complex.exp (-(c * t)) = 1 := by
    intro t
    have e := is_const_of_deriv_eq_zero (f := fun t : ℝ => χ t * Complex.exp (-(c * t)))
      (fun x => (hg x).differentiableAt) (fun x => (hg x).deriv) t 0
    simpa [h0] using e
  have hexp : ∀ t : ℝ, χ t = Complex.exp (c * t) := by
    intro t
    have e := hconst t
    calc χ t = χ t * (Complex.exp (-(c * t)) * Complex.exp (c * t)) := by
            rw [← Complex.exp_add, neg_add_cancel, Complex.exp_zero, mul_one]
      _ = Complex.exp (c * t) := by rw [← mul_assoc, e, one_mul]
  have hc1 : Complex.exp c = 1 := by have e := hexp 1; rw [h1] at e; simpa using e.symm
  obtain ⟨n, hn⟩ := Complex.exp_eq_one_iff.mp hc1
  exact ⟨n, fun t => by rw [hexp t, hn]⟩

/-- A SYMMETRY WITH A FULL TURN GIVES ITS STATES INTEGERS. Let linear maps `T t` of a complex space compose as
`T (s + t) = T s * T t` with the whole turn the identity, and let a state that is not zero be labelled `χ t` by each,
differentiably. Then the label is `exp (n · 2πi · t)` for one integer `n`. -/
theorem a_symmetry_with_a_full_turn_gives_its_states_integers {V : Type*} [AddCommGroup V] [Module ℂ V]
    (T : ℝ → Module.End ℂ V) (hT : ∀ s t, T (s + t) = T s * T t) (h1 : T 1 = 1) (v : V) (hv : v ≠ 0) (χ : ℝ → ℂ)
    (hχ : ∀ t, T t v = χ t • v) (hd : Differentiable ℝ χ) :
    ∃ n : ℤ, ∀ t : ℝ, χ t = Complex.exp (n * (2 * π * I) * t) := by
  refine the_labels_of_a_full_turn_are_the_integers χ hd (fun s t => ?_) ?_
  · have e : χ (s + t) • v = (χ s * χ t) • v := by
      rw [← hχ, hT, Module.End.mul_apply, hχ t, map_smul, hχ s, smul_smul, mul_comm]
    exact smul_left_injective ℂ hv e
  · have e : χ 1 • v = (1 : ℂ) • v := by rw [← hχ, h1, one_smul]; rfl
    exact smul_left_injective ℂ hv e

end FullTurn

/-! ## Part XVI. The free field of quanta. Many modes, each with its count: the seat is the assignments of a whole
number to every mode. The premise is the seat itself: that the states of the field are such assignments. -/

section FreeField
variable {M K : Type*} [DecidableEq M] [CommRing K]

/-- One quantum more in the mode `m`. -/
def raise (m : M) (f : (M → ℕ) → K) : (M → ℕ) → K :=
  fun o => if o m = 0 then 0 else f (Function.update o m (o m - 1))

/-- One quantum fewer in the mode `m`, weighted by the count it leaves. -/
def lower (m : M) (f : (M → ℕ) → K) : (M → ℕ) → K :=
  fun o => ((o m : K) + 1) * f (Function.update o m (o m + 1))

/-- THE COUNT OF A MODE. Raising after lowering multiplies a reading by the number of quanta in the mode. -/
theorem the_count_of_a_mode (m : M) (f : (M → ℕ) → K) (o : M → ℕ) : raise m (lower m f) o = (o m : K) * f o := by
  unfold raise lower
  by_cases h : o m = 0
  · simp [h]
  · obtain ⟨k, hk⟩ := Nat.exists_eq_succ_of_ne_zero h
    have e : Function.update o m (k + 1) = o := by
      have t := Function.update_eq_self m o
      rw [hk] at t; exact t
    simp [hk, e]

/-- EACH MODE IS A CANONICAL PAIR. Lowering after raising, less raising after lowering, is the reading itself. -/
theorem each_mode_is_a_canonical_pair (m : M) (f : (M → ℕ) → K) (o : M → ℕ) :
    lower m (raise m f) o - raise m (lower m f) o = f o := by
  rw [the_count_of_a_mode]
  unfold raise lower
  have e : Function.update o m (o m) = o := Function.update_eq_self m o
  simp [e]; ring

/-- DIFFERENT MODES DO NOT DISTURB EACH OTHER: lowering one and raising another may be done in either order. -/
theorem lowering_one_mode_commutes_with_raising_another (m k : M) (h : m ≠ k) (f : (M → ℕ) → K) :
    lower m (raise k f) = raise k (lower m f) := by
  funext o
  unfold raise lower
  have hk : k ≠ m := fun e => h e.symm
  by_cases z : o k = 0
  · simp [z, Function.update_of_ne hk]
  · simp [z, Function.update_of_ne hk, Function.update_of_ne h, Function.update_comm h]

/-- RAISING TWO MODES may be done in either order. -/
theorem raising_two_modes_commutes (m k : M) (h : m ≠ k) (f : (M → ℕ) → K) :
    raise m (raise k f) = raise k (raise m f) := by
  funext o
  unfold raise
  have hk : k ≠ m := fun e => h e.symm
  by_cases z : o k = 0 <;> by_cases w : o m = 0 <;>
    simp [z, w, Function.update_of_ne hk, Function.update_of_ne h, Function.update_comm h]

/-- LOWERING TWO MODES may be done in either order. -/
theorem lowering_two_modes_commutes (m k : M) (h : m ≠ k) (f : (M → ℕ) → K) :
    lower m (lower k f) = lower k (lower m f) := by
  funext o
  unfold lower
  have hk : k ≠ m := fun e => h e.symm
  simp [Function.update_of_ne hk, Function.update_of_ne h, Function.update_comm h]; ring

/-- The energy of an assignment: over a finite set of modes, the frequency of each times its count. -/
def energy (S : Finset M) (w : M → K) (o : M → ℕ) : K := ∑ m ∈ S, w m * (o m : K)

/-- THE ENERGY IS THE SUM OF THE COUNTS, EACH TIMES ITS FREQUENCY. The quantity that raises after lowering in every mode,
each weighted by its frequency, multiplies a reading by the energy of the assignment. -/
theorem the_energy_is_the_sum_of_the_counts (S : Finset M) (w : M → K) (f : (M → ℕ) → K) (o : M → ℕ) :
    ∑ m ∈ S, w m * raise m (lower m f) o = energy S w o * f o := by
  unfold energy
  rw [Finset.sum_mul]
  exact Finset.sum_congr rfl fun m _ => by rw [the_count_of_a_mode]; ring

/-- THE ENERGY MOVES BY ONE FREQUENCY FOR ONE QUANTUM. Changing the count of one mode of the set changes the energy by
the frequency of that mode times the change. -/
theorem the_energy_moves_by_the_frequency (S : Finset M) (w : M → K) (o : M → ℕ) (m : M) (hm : m ∈ S) (a : ℕ) :
    energy S w (Function.update o m a) = energy S w o + w m * ((a : K) - (o m : K)) := by
  unfold energy
  have e1 : ∀ p : M → ℕ, ∑ x ∈ S, w x * (p x : K) = w m * (p m : K) + ∑ x ∈ S.erase m, w x * (p x : K) :=
    fun p => (Finset.add_sum_erase S (fun x => w x * (p x : K)) hm).symm
  have e2 : ∑ x ∈ S.erase m, w x * ((Function.update o m a x : ℕ) : K) = ∑ x ∈ S.erase m, w x * (o x : K) :=
    Finset.sum_congr rfl fun x hx => by rw [Function.update_of_ne (Finset.ne_of_mem_erase hx)]
  rw [e1 (Function.update o m a), e1 o, e2, Function.update_self]; ring

/-- THE LAW OF MOTION OF THE STEP UP. The energy, taken as a quantity, against the raising of a mode of the set: their
commutator is the frequency of the mode times the raising. -/
theorem the_law_of_motion_of_raising (S : Finset M) (w : M → K) (m : M) (hm : m ∈ S) (f : (M → ℕ) → K)
    (o : M → ℕ) : energy S w o * raise m f o - raise m (fun p => energy S w p * f p) o = w m * raise m f o := by
  unfold raise
  by_cases h : o m = 0
  · simp [h]
  · obtain ⟨k, hk⟩ := Nat.exists_eq_succ_of_ne_zero h
    simp only [h, if_false]
    rw [the_energy_moves_by_the_frequency S w o m hm, hk]; push_cast; simp; ring

/-- THE LAW OF MOTION OF THE STEP DOWN. Against the lowering of a mode, the commutator of the energy is the frequency
of the mode times the lowering, reversed. -/
theorem the_law_of_motion_of_lowering (S : Finset M) (w : M → K) (m : M) (hm : m ∈ S) (f : (M → ℕ) → K)
    (o : M → ℕ) : energy S w o * lower m f o - lower m (fun p => energy S w p * f p) o = -(w m * lower m f o) := by
  unfold lower
  beta_reduce
  rw [the_energy_moves_by_the_frequency S w o m hm]; push_cast; ring

end FreeField

/-- THE ENERGY OF A MODE IS THE COUNT AND A HALF. In any ring, for a canonical pair `a`, `b`: the square of their sum
less the square of their difference is four times `b a` and two. With `b a` the count, the quantity that stands for
the energy of an oscillator is the count and one half: the half is there when the count is zero. -/
theorem the_energy_of_a_mode_is_the_count_and_a_half {A : Type*} [Ring A] (a b : A) (h : a * b - b * a = 1) :
    (a + b) ^ 2 - (a - b) ^ 2 = 4 * (b * a) + 2 := by
  have e : a * b = b * a + 1 := by rw [← h]; noncomm_ring
  calc (a + b) ^ 2 - (a - b) ^ 2 = 2 * (a * b) + 2 * (b * a) := by noncomm_ring
    _ = 4 * (b * a) + 2 := by rw [e]; noncomm_ring; simp

section Helicity
variable {Y K : Type*} [DecidableEq Y] [CommRing K]

/-- The mirror on the quanta of a wave with two polarisations: the counts of the two are exchanged, mode by mode. -/
def mirrorQuanta (o : Y × Bool → ℕ) : Y × Bool → ℕ := fun p => o (p.1, !p.2)

omit [DecidableEq Y] in
/-- THE MIRROR OF THE QUANTA IS ITS OWN INVERSE. -/
theorem the_mirror_of_the_quanta_is_its_own_inverse (o : Y × Bool → ℕ) : mirrorQuanta (mirrorQuanta o) = o := by
  funext p; simp [mirrorQuanta]

/-- THE MIRROR EXCHANGES THE TWO POLARISATIONS OF THE QUANTA. Raising a quantum of one polarisation, read through the
mirror, is raising a quantum of the other. -/
theorem the_mirror_exchanges_the_two_polarisations (y : Y) (b : Bool) (f : (Y × Bool → ℕ) → K)
    (o : Y × Bool → ℕ) :
    raise (y, b) (fun p => f (mirrorQuanta p)) o = raise (y, !b) f (mirrorQuanta o) := by
  have e : ∀ a : ℕ, mirrorQuanta (Function.update o (y, b) a) = Function.update (mirrorQuanta o) (y, !b) a := by
    intro a; funext p
    obtain ⟨u, c⟩ := p
    by_cases h : u = y ∧ c = !b
    · obtain ⟨rfl, rfl⟩ := h
      show Function.update o (u, b) a (u, !(!b)) = Function.update (mirrorQuanta o) (u, !b) a (u, !b)
      rw [Function.update_self]
      cases b <;> exact Function.update_self _ _ _
    · have h1 : (u, !c) ≠ (y, b) := by
        intro q; apply h; cases Prod.mk.inj q with | intro q1 q2 => exact ⟨q1, by rw [← q2]; simp⟩
      have h2 : (u, c) ≠ (y, !b) := fun q => h (Prod.mk.inj q)
      simp [mirrorQuanta, Function.update_of_ne h1, Function.update_of_ne h2]
  unfold raise
  simp [mirrorQuanta, e]

omit [DecidableEq Y] in
/-- THE ENERGY IS KEPT BY THE MIRROR where the two polarisations of each mode have one frequency: the energy of an
assignment and of its mirror are the same, over a set of modes that holds both polarisations of each. -/
theorem the_energy_is_kept_by_the_mirror (T : Finset Y) (w : Y → K) (o : Y × Bool → ℕ) :
    energy (T ×ˢ (Finset.univ : Finset Bool)) (fun p => w p.1) (mirrorQuanta o)
      = energy (T ×ˢ (Finset.univ : Finset Bool)) (fun p => w p.1) o := by
  unfold energy
  rw [Finset.sum_product, Finset.sum_product]
  refine Finset.sum_congr rfl fun y _ => ?_
  simp [mirrorQuanta, add_comm]

end Helicity

/-! ## Part XVII. What no proof decides: which seat, and what size of constant. Each statement is a theorem. -/

section Undecided

/-- A SEAT IS INFINITE EXACTLY WHEN SOME READING OF IT TAKES EVERY WHOLE NUMBER. This is what a measurement must find to
place a field on the infinite branch: a quantity whose registrations do not end. -/
theorem a_seat_is_infinite_iff_a_reading_takes_every_whole_number (X : Type*) :
    Infinite X ↔ ∃ f : X → ℕ, Function.Surjective f := by
  constructor
  · intro _
    obtain ⟨e⟩ := every_infinite_seat_is_a_seat_with_a_count X
    exact ⟨fun x => (e.symm x).2, fun n => by
      obtain ⟨x⟩ := (inferInstance : Nonempty X)
      exact ⟨e (x, n), by simp⟩⟩
  · rintro ⟨f, hf⟩; exact Infinite.of_surjective f hf

/-- ON A FINITE SEAT EVERY READING TAKES FINITELY MANY VALUES. -/
theorem on_a_finite_seat_every_reading_takes_finitely_many_values {X K : Type*} [Finite X] (f : X → K) :
    (Set.range f).Finite := Set.finite_range f

/-- NO PROOF DECIDES THE SEAT. There is a seat that carries a canonical pair and a seat that carries none. Both are
seats in the sense of this file, and every theorem of it holds of both; so no theorem that follows from being a seat
says which of the two a given field is. -/
theorem no_proof_decides_the_seat :
    (∃ X : Type, Nonempty X ∧ ∃ P Q : Module.End ℚ (X → ℚ), P * Q - Q * P = 1)
    ∧ (∃ X : Type, Nonempty X ∧ ∀ P Q : Module.End ℚ (X → ℚ), P * Q - Q * P ≠ 1) :=
  ⟨⟨ℕ, inferInstance, every_infinite_seat_carries_a_canonical_pair ℕ ℚ⟩,
   ⟨Unit, inferInstance, no_canonical_pair_among_the_quantities_of_a_finite_seat Unit ℚ⟩⟩

/-- NO VALUE OF THE CONSTANT IS FORCED. On every infinite seat, and for every value `c` in the ring of values, there is
a pair of quantities whose commutator is `c`. The algebra holds all values at once; which one a field has is not a
consequence of the algebra. -/
theorem no_value_of_the_constant_is_forced (X : Type*) [Infinite X] (K : Type*) [CommRing K] (c : K) :
    ∃ P Q : Module.End K (X → K), P * Q - Q * P = c • (1 : Module.End K (X → K)) := by
  obtain ⟨P, Q, h⟩ := every_infinite_seat_carries_a_canonical_pair X K
  have e := congrArg (fun T : Module.End K (X → K) => c • T) h
  exact ⟨c • P, Q, by simpa [smul_sub, smul_mul_assoc, mul_smul_comm] using e⟩

end Undecided

/-! ## Part XIX. Time, and the geometry as a reading. Time is no quantity of the ring; a reading kept by the joint step
is its own history; a law kept by every map prefers no slicing while a record may carry one; and whether a field
holds a commutator is decided by no proof. -/

section TimeIsNoQuantity
variable {Y K : Type*} [CommRing K]

/-- The count, as a quantity: it multiplies a reading by the count of the state. -/
def countLin : Module.End K (Y × ℕ → K) where
  toFun f := fun p => (p.2 : K) * f p
  map_add' f g := by funext p; simp only [Pi.add_apply]; ring
  map_smul' c f := by funext p; simp only [Pi.smul_apply, RingHom.id_apply, smul_eq_mul]; ring

/-- THE COUNT HAS NO CANONICAL PARTNER. No linear map of the readings has commutator one with the count, on a seat with
a count that is not empty, where one is not zero. The count is the energy of a mode in its own unit; so no quantity
of the ring stands to the energy as the step up stands to the step down. Time is not among the quantities. -/
theorem the_count_has_no_canonical_partner [Nontrivial K] [Nonempty Y] (T : Module.End K (Y × ℕ → K)) :
    T * countLin - countLin * T ≠ 1 := by
  intro h
  obtain ⟨y⟩ := ‹Nonempty Y›
  let f : Y × ℕ → K := fun p => if p.2 = 0 then 1 else 0
  have z : (countLin : Module.End K (Y × ℕ → K)) f = 0 := by
    funext p
    show (p.2 : K) * (if p.2 = 0 then 1 else 0) = 0
    by_cases hp : p.2 = 0
    · simp [hp]
    · simp [hp]
  have e := congrFun (congrArg (fun S : Module.End K (Y × ℕ → K) => S f) h) (y, 0)
  simp only [LinearMap.sub_apply, Module.End.mul_apply, z, map_zero, Pi.sub_apply, Pi.zero_apply,
    Module.End.one_apply] at e
  have e2 : (countLin : Module.End K (Y × ℕ → K)) (T f) (y, 0) = 0 := by
    show (((0 : ℕ) : K)) * T f (y, 0) = 0; simp
  rw [e2, sub_zero] at e
  exact zero_ne_one e

end TimeIsNoQuantity

section History
variable {Y K : Type*}

/-- A READING KEPT BY THE JOINT STEP IS ITS OWN HISTORY. Let `U` be any step of the readings of the system. A reading of
the system together with a count is kept by the joint step when its slice at each next count is the step of its
slice before. Such a reading is fixed as a whole, and its slice at count `n` is the `n`-th step of its slice at
count zero. -/
theorem a_reading_kept_by_the_joint_step_is_its_own_history (U : (Y → K) → (Y → K)) (F : Y × ℕ → K)
    (kept : ∀ n, (fun y => F (y, n + 1)) = U (fun y => F (y, n))) (n : ℕ) :
    (fun y => F (y, n)) = U^[n] (fun y => F (y, 0)) := by
  induction n with
  | zero => rfl
  | succ k ih => rw [kept k, ih, Function.iterate_succ_apply']

/-- EVERY HISTORY IS A READING KEPT BY THE JOINT STEP. From any reading of the system at count zero there is a reading of
the system with the count that the joint step keeps and whose slice at zero is the one given. -/
theorem every_history_is_a_reading_kept_by_the_joint_step (U : (Y → K) → (Y → K)) (g : Y → K) :
    ∃ F : Y × ℕ → K, (fun y => F (y, 0)) = g ∧ ∀ n, (fun y => F (y, n + 1)) = U (fun y => F (y, n)) :=
  ⟨fun p => U^[p.2] g p.1, rfl, fun n => by
    show (fun y => U^[n + 1] g y) = U (fun y => U^[n] g y)
    rw [Function.iterate_succ_apply']⟩

end History

section LawAndRecord
variable {G X S : Type*}

/-- A LAW KEPT BY EVERY MAP PREFERS NO SLICING. Let a family of maps act on the records and on the slicings, and let no
slicing be fixed by every map. Then no choice of slicing that is the same for every record is carried by the maps:
a slicing chosen by the law alone, and not by the record, does not exist. -/
theorem a_law_kept_by_every_map_prefers_no_slicing [Nonempty X] (onRecords : G → X → X) (onSlicings : G → S → S)
    (none_fixed : ∀ σ : S, ∃ g : G, onSlicings g σ ≠ σ) (s : X → S)
    (carried : ∀ g x, s (onRecords g x) = onSlicings g (s x)) (by_the_law_alone : ∀ x y, s x = s y) : False := by
  obtain ⟨x⟩ := ‹Nonempty X›
  obtain ⟨g, hg⟩ := none_fixed (s x)
  exact hg ((carried g x).symm.trans (by_the_law_alone _ _))

/-- A RECORD MAY CARRY ITS OWN SLICING. For any family of maps acting on the slicings there is a choice of slicing, one
for each record, that every map carries from a record to its image. The second statement does not contradict the
first: the slicing belongs to the record and not to the law. -/
theorem a_record_may_carry_its_own_slicing (onSlicings : G → S → S) :
    ∃ s : S → S, ∀ g σ, s (onSlicings g σ) = onSlicings g (s σ) := ⟨id, fun _ _ => rfl⟩

end LawAndRecord

/-- NO PROOF DECIDES WHETHER A FIELD HOLDS A COMMUTATOR. There is a ring with an adjoint in which every two quantities
commute, and a ring with an adjoint in which two do not. Every theorem of this file about rings with an adjoint holds
of both. Whether the quantities of a given field, the geometry among them, commute is therefore no theorem. Where
they are readings with values that commute, they commute, by Part II. -/
theorem no_proof_decides_whether_a_field_holds_a_commutator :
    (∀ a b : ℚ, a * b = b * a)
    ∧ (∃ a b : Matrix (Fin 2) (Fin 2) ℚ, a * b ≠ b * a) := by
  refine ⟨mul_comm, !![0, 1; 0, 0], !![0, 0; 1, 0], fun h => ?_⟩
  have e := congrFun (congrFun h 0) 0
  simp [Matrix.mul_apply, Fin.sum_univ_two] at e

/-! ## Part XX. What an outside clock registers at a horizon. The values are the real numbers. -/

section Horizon
open Real

/-- THE RATE OF THE OUTSIDE CLOCK ALONG A RAY. For a mass `m` and a radius `r` outside `2m`, the function
`r + 2m log (r − 2m)` has derivative `r / (r − 2m)`, which is one over `1 − 2m/r`: the time an outside clock
registers for light to cover a step of radius. -/
theorem the_rate_of_the_outside_clock_along_a_ray (m r : ℝ) (h : 2 * m < r) :
    HasDerivAt (fun x : ℝ => x + 2 * m * Real.log (x - 2 * m)) (r / (r - 2 * m)) r := by
  have hne : r - 2 * m ≠ 0 := by linarith
  have a := (hasDerivAt_id r).add ((((hasDerivAt_id r).sub_const (2 * m)).log hne).const_mul (2 * m))
  have e : (1 : ℝ) + 2 * m * (1 / (id r - 2 * m)) = r / (r - 2 * m) := by
    simp only [id]; field_simp
  rw [e] at a; exact a

/-- THE OUTSIDE CLOCK NEVER REGISTERS THE CROSSING. For a positive mass, the time registered outside for a ray between a
radius `r` and a fixed radius grows past every bound as `r` approaches `2m` from outside: below any number `−B`
the function `r + 2m log (r − 2m)` falls, for all `r` near enough. No signal from the horizon, or from within it,
is registered outside at any finite time. -/
theorem the_outside_clock_never_registers_the_crossing (m : ℝ) (hm : 0 < m) (B : ℝ) :
    ∃ δ > 0, ∀ r, 2 * m < r → r < 2 * m + δ → r + 2 * m * Real.log (r - 2 * m) < -B := by
  refine ⟨min 1 (Real.exp ((-B - 2 * m - 1) / (2 * m))), lt_min one_pos (Real.exp_pos _), fun r h1 h2 => ?_⟩
  have hx : 0 < r - 2 * m := by linarith
  have k1 := min_le_left 1 (Real.exp ((-B - 2 * m - 1) / (2 * m)))
  have k2 := min_le_right 1 (Real.exp ((-B - 2 * m - 1) / (2 * m)))
  have hx2 : r - 2 * m < Real.exp ((-B - 2 * m - 1) / (2 * m)) := by linarith
  have hl : Real.log (r - 2 * m) < (-B - 2 * m - 1) / (2 * m) := (Real.log_lt_iff_lt_exp hx).mpr hx2
  have h2m : 0 < 2 * m := by linarith
  have t : 2 * m * Real.log (r - 2 * m) < 2 * m * ((-B - 2 * m - 1) / (2 * m)) := mul_lt_mul_of_pos_left hl h2m
  have e : 2 * m * ((-B - 2 * m - 1) / (2 * m)) = -B - 2 * m - 1 := by field_simp
  linarith

end Horizon

/-! ## Part XXI. The binding theorem of the Hilbert space. -/

/-- THE HILBERT SPACE IS SUBSUMED. For every Hilbert space, real or complex, of any dimension, that is not the zero
space: its inner product is a form of the spectral seat; its bounded quantities are a ring with an adjoint, and that
adjoint is the adjoint of the form; the registrations of its observables are on the line; no two observables among
them have commutator one; and no pair of bounded quantities is canonical. -/
theorem the_hilbert_space_is_subsumed (𝕜 E : Type) [RCLike 𝕜] [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]
    [CompleteSpace E] [Nontrivial E] :
    (∀ u v : E, (everySpaceWithAnInnerProductIsASpectralSeat : Form 𝕜 E).ip u v = inner u v)
    ∧ (∀ (T : E →L[𝕜] E) (u v : E), inner ((star T) u) v = (inner u (T v) : 𝕜))
    ∧ (∀ (T : E →L[𝕜] E), star T = T → ∀ (v : E) (lam : 𝕜), T v = lam • v → v ≠ 0 → star lam = lam)
    ∧ (∀ P Q : E →L[𝕜] E, star P = P → star Q = Q → P * Q - Q * P ≠ 1)
    ∧ (∀ P Q : E →L[𝕜] E, P * Q - Q * P ≠ 1) :=
  ⟨fun _ _ => rfl, the_adjoint_of_the_ring_is_the_adjoint_of_the_form,
   the_registrations_of_an_observable_of_a_hilbert_space_are_on_the_line,
   two_observables_of_a_hilbert_space_never_have_commutator_one,
   no_canonical_pair_among_the_bounded_quantities_of_a_hilbert_space⟩

end SPHYS.FieldQuantization

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.FieldQuantization.the_fold_is_a_map_of_rings' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_fold_is_a_map_of_rings
/-- info: 'SPHYS.FieldQuantization.the_fold_on_readings_is_its_own_inverse' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_fold_on_readings_is_its_own_inverse
/-- info: 'SPHYS.FieldQuantization.the_constructed_adjoint_is_an_involution' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_constructed_adjoint_is_an_involution
/-- info: 'SPHYS.FieldQuantization.the_constructed_adjoint_is_additive' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_constructed_adjoint_is_additive
/-- info: 'SPHYS.FieldQuantization.the_constructed_adjoint_reverses_products' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_constructed_adjoint_reverses_products
/-- info: 'SPHYS.FieldQuantization.the_fold_and_the_adjoint_of_the_values_commute' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_fold_and_the_adjoint_of_the_values_commute
/-- info: 'SPHYS.FieldQuantization.a_kept_reading_is_an_observable' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.a_kept_reading_is_an_observable
/--
info: 'SPHYS.FieldQuantization.a_reversed_reading_is_reversed_by_the_adjoint' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.a_reversed_reading_is_reversed_by_the_adjoint
/-- info: 'SPHYS.FieldQuantization.the_observables_are_the_kept_readings' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_observables_are_the_kept_readings
/-- info: 'SPHYS.FieldQuantization.two_reversals_keep' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.two_reversals_keep
/-- info: 'SPHYS.FieldQuantization.a_reversal_and_a_keeping_reverse' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.a_reversal_and_a_keeping_reverse
/-- info: 'SPHYS.FieldQuantization.a_reading_with_its_adjoint_is_an_observable' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.a_reading_with_its_adjoint_is_an_observable
/--
info: 'SPHYS.FieldQuantization.where_the_values_commute_the_readings_commute' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.where_the_values_commute_the_readings_commute
/-- info: 'SPHYS.FieldQuantization.on_commuting_values_the_identity_is_an_adjoint' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.on_commuting_values_the_identity_is_an_adjoint
/-- info: 'SPHYS.FieldQuantization.the_product_is_associative' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_product_is_associative
/-- info: 'SPHYS.FieldQuantization.the_adjoint_reverses_products' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_adjoint_reverses_products
/-- info: 'SPHYS.FieldQuantization.the_adjoint_is_an_involution' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_adjoint_is_an_involution
/-- info: 'SPHYS.FieldQuantization.the_fold_is_its_own_inverse_and_its_own_adjoint' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_fold_is_its_own_inverse_and_its_own_adjoint
/-- info: 'SPHYS.FieldQuantization.the_fold_moves_a_reading_across' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_fold_moves_a_reading_across
/-- info: 'SPHYS.FieldQuantization.a_reading_commutes_with_the_fold_iff_kept' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.a_reading_commutes_with_the_fold_iff_kept
/-- info: 'SPHYS.FieldQuantization.the_observables_with_the_fold' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_observables_with_the_fold
/-- info: 'SPHYS.FieldQuantization.commutative_iff_the_fold_keeps_every_reading' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.commutative_iff_the_fold_keeps_every_reading
/--
info: 'SPHYS.FieldQuantization.the_fold_keeps_every_reading_iff_the_seat_is_all_line' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_fold_keeps_every_reading_iff_the_seat_is_all_line
/--
info: 'SPHYS.FieldQuantization.the_readings_with_the_fold_are_a_ring_with_an_adjoint' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_readings_with_the_fold_are_a_ring_with_an_adjoint
/--
info: 'SPHYS.FieldQuantization.the_field_commutes_iff_the_seat_is_all_line' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_field_commutes_iff_the_seat_is_all_line
/-- info: 'SPHYS.FieldQuantization.the_constructed_adjoint_is_natural' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_constructed_adjoint_is_natural
/-- info: 'SPHYS.FieldQuantization.the_field_itself' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_field_itself
/-- info: 'SPHYS.FieldQuantization.a_canonical_pair_against_a_power' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.a_canonical_pair_against_a_power
/-- info: 'SPHYS.FieldQuantization.a_canonical_pair_is_never_nilpotent' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.a_canonical_pair_is_never_nilpotent
/-- info: 'SPHYS.FieldQuantization.no_canonical_pair_under_a_trace' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.no_canonical_pair_under_a_trace
/-- info: 'SPHYS.FieldQuantization.the_constant_is_a_choice_of_unit' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_constant_is_a_choice_of_unit
/--
info: 'SPHYS.FieldQuantization.the_commutator_of_two_observables_is_reversed' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_commutator_of_two_observables_is_reversed
/--
info: 'SPHYS.FieldQuantization.two_observables_never_have_commutator_one' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.two_observables_never_have_commutator_one
/-- info: 'SPHYS.FieldQuantization.the_weyl_form' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_weyl_form
/-- info: 'SPHYS.FieldQuantization.the_difference_against_the_coordinate' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_difference_against_the_coordinate
/--
info: 'SPHYS.FieldQuantization.a_seat_with_a_coordinate_along_its_shift_is_infinite' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.a_seat_with_a_coordinate_along_its_shift_is_infinite
/--
info: 'SPHYS.FieldQuantization.a_finite_seat_has_no_coordinate_along_a_shift' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.a_finite_seat_has_no_coordinate_along_a_shift
/-- info: 'SPHYS.FieldQuantization.the_ladder_is_a_canonical_pair' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_ladder_is_a_canonical_pair
/-- info: 'SPHYS.FieldQuantization.the_count_is_the_product_of_the_ladder' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_count_is_the_product_of_the_ladder
/-- info: 'SPHYS.FieldQuantization.down_after_up_is_the_count_and_one' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.down_after_up_is_the_count_and_one
/-- info: 'SPHYS.FieldQuantization.the_step_up_raises_the_count' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_step_up_raises_the_count
/--
info: 'SPHYS.FieldQuantization.the_canonical_form_on_the_line' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_canonical_form_on_the_line
/--
info: 'SPHYS.FieldQuantization.the_fold_of_the_line_reverses_the_derivative' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_fold_of_the_line_reverses_the_derivative
/--
info: 'SPHYS.FieldQuantization.every_map_moves_a_reading_across' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.every_map_moves_a_reading_across
/--
info: 'SPHYS.FieldQuantization.no_canonical_pair_on_a_finite_seat' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.no_canonical_pair_on_a_finite_seat
/--
info: 'SPHYS.FieldQuantization.the_canonical_question_is_decided_by_the_seat' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_canonical_question_is_decided_by_the_seat
/--
info: 'SPHYS.FieldQuantization.every_infinite_seat_holds_the_whole_numbers' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.every_infinite_seat_holds_the_whole_numbers
/--
info: 'SPHYS.FieldQuantization.every_infinite_seat_is_a_seat_with_a_count' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.every_infinite_seat_is_a_seat_with_a_count
/--
info: 'SPHYS.FieldQuantization.a_seat_carries_a_count_iff_it_is_infinite' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.a_seat_carries_a_count_iff_it_is_infinite
/-- info: 'SPHYS.FieldQuantization.the_ladder_carries_across_a_matching' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_ladder_carries_across_a_matching
/--
info: 'SPHYS.FieldQuantization.a_seat_matched_with_a_count_carries_a_canonical_pair' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.a_seat_matched_with_a_count_carries_a_canonical_pair
/--
info: 'SPHYS.FieldQuantization.every_infinite_seat_carries_a_canonical_pair' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.every_infinite_seat_carries_a_canonical_pair
/--
info: 'SPHYS.FieldQuantization.no_canonical_pair_among_the_quantities_of_a_finite_seat' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.no_canonical_pair_among_the_quantities_of_a_finite_seat
/--
info: 'SPHYS.FieldQuantization.a_seat_carries_a_canonical_pair_iff_it_is_infinite' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.a_seat_carries_a_canonical_pair_iff_it_is_infinite
/--
info: 'SPHYS.FieldQuantization.the_ladder_is_adjoint_under_the_weighted_pairing' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_ladder_is_adjoint_under_the_weighted_pairing
/--
info: 'SPHYS.FieldQuantization.the_registrations_of_an_observable_are_on_the_line' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_registrations_of_an_observable_are_on_the_line
/--
info: 'SPHYS.FieldQuantization.states_with_different_registrations_are_orthogonal' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.states_with_different_registrations_are_orthogonal
/--
info: 'SPHYS.FieldQuantization.the_form_of_the_seat_is_the_inner_product' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_form_of_the_seat_is_the_inner_product
/--
info: 'SPHYS.FieldQuantization.a_state_that_is_not_zero_has_a_norm' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.a_state_that_is_not_zero_has_a_norm
/--
info: 'SPHYS.FieldQuantization.the_adjoint_of_the_ring_is_the_adjoint_of_the_form' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_adjoint_of_the_ring_is_the_adjoint_of_the_form
/--
info: 'SPHYS.FieldQuantization.an_observable_of_a_hilbert_space_is_symmetric_under_its_form' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.an_observable_of_a_hilbert_space_is_symmetric_under_its_form
/--
info: 'SPHYS.FieldQuantization.the_registrations_of_an_observable_of_a_hilbert_space_are_on_the_line' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in
#print axioms SPHYS.FieldQuantization.the_registrations_of_an_observable_of_a_hilbert_space_are_on_the_line
/--
info: 'SPHYS.FieldQuantization.states_of_a_hilbert_space_with_different_registrations_are_orthogonal' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in
#print axioms SPHYS.FieldQuantization.states_of_a_hilbert_space_with_different_registrations_are_orthogonal
/--
info: 'SPHYS.FieldQuantization.the_value_of_an_observable_in_any_state_is_on_the_line' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_value_of_an_observable_in_any_state_is_on_the_line
/--
info: 'SPHYS.FieldQuantization.two_observables_of_a_hilbert_space_never_have_commutator_one' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.two_observables_of_a_hilbert_space_never_have_commutator_one
/--
info: 'SPHYS.FieldQuantization.no_canonical_pair_in_a_ring_with_a_norm' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.no_canonical_pair_in_a_ring_with_a_norm
/--
info: 'SPHYS.FieldQuantization.no_canonical_pair_among_the_bounded_quantities_of_a_hilbert_space' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.no_canonical_pair_among_the_bounded_quantities_of_a_hilbert_space
/--
info: 'SPHYS.FieldQuantization.the_ring_acts_with_its_adjoint_the_adjoint_of_the_form' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_ring_acts_with_its_adjoint_the_adjoint_of_the_form
/--
info: 'SPHYS.FieldQuantization.an_observable_of_the_ring_is_symmetric_under_the_form' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.an_observable_of_the_ring_is_symmetric_under_the_form
/--
info: 'SPHYS.FieldQuantization.the_form_of_a_reading_is_conjugate_symmetric' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_form_of_a_reading_is_conjugate_symmetric
/--
info: 'SPHYS.FieldQuantization.the_overlap_is_bounded_by_the_norms' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_overlap_is_bounded_by_the_norms
/--
info: 'SPHYS.FieldQuantization.the_states_of_norm_zero_are_carried_into_themselves' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_states_of_norm_zero_are_carried_into_themselves
/--
info: 'SPHYS.FieldQuantization.a_ring_with_a_positive_reading_has_a_hilbert_home' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.a_ring_with_a_positive_reading_has_a_hilbert_home
/--
info: 'SPHYS.FieldQuantization.every_registration_of_the_count_is_a_whole_number' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.every_registration_of_the_count_is_a_whole_number
/--
info: 'SPHYS.FieldQuantization.every_whole_number_is_a_registration_of_the_count' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.every_whole_number_is_a_registration_of_the_count
/-- info: 'SPHYS.FieldQuantization.the_ladder_has_a_ground_state' depends on axioms: [Quot.sound] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_ladder_has_a_ground_state
/-- info: 'SPHYS.FieldQuantization.a_ground_state_carries_the_ladder' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.a_ground_state_carries_the_ladder
/-- info: 'SPHYS.FieldQuantization.the_count_registers_each_rung' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_count_registers_each_rung
/-- info: 'SPHYS.FieldQuantization.no_rung_is_empty' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.no_rung_is_empty
/--
info: 'SPHYS.FieldQuantization.the_rungs_are_independent' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_rungs_are_independent
/--
info: 'SPHYS.FieldQuantization.assignments_with_the_same_occupation_numbers_are_relabellings' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.assignments_with_the_same_occupation_numbers_are_relabellings
/--
info: 'SPHYS.FieldQuantization.the_occupation_numbers_are_the_finest_registration' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_occupation_numbers_are_the_finest_registration
/--
info: 'SPHYS.FieldQuantization.the_labels_of_a_full_turn_are_the_integers' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_labels_of_a_full_turn_are_the_integers
/--
info: 'SPHYS.FieldQuantization.a_symmetry_with_a_full_turn_gives_its_states_integers' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.a_symmetry_with_a_full_turn_gives_its_states_integers
/-- info: 'SPHYS.FieldQuantization.the_count_of_a_mode' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_count_of_a_mode
/--
info: 'SPHYS.FieldQuantization.each_mode_is_a_canonical_pair' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.each_mode_is_a_canonical_pair
/--
info: 'SPHYS.FieldQuantization.lowering_one_mode_commutes_with_raising_another' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.lowering_one_mode_commutes_with_raising_another
/-- info: 'SPHYS.FieldQuantization.raising_two_modes_commutes' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.raising_two_modes_commutes
/-- info: 'SPHYS.FieldQuantization.lowering_two_modes_commutes' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.lowering_two_modes_commutes
/--
info: 'SPHYS.FieldQuantization.the_energy_is_the_sum_of_the_counts' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_energy_is_the_sum_of_the_counts
/--
info: 'SPHYS.FieldQuantization.the_energy_moves_by_the_frequency' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_energy_moves_by_the_frequency
/--
info: 'SPHYS.FieldQuantization.the_law_of_motion_of_raising' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_law_of_motion_of_raising
/--
info: 'SPHYS.FieldQuantization.the_law_of_motion_of_lowering' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_law_of_motion_of_lowering
/-- info: 'SPHYS.FieldQuantization.the_energy_of_a_mode_is_the_count_and_a_half' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_energy_of_a_mode_is_the_count_and_a_half
/--
info: 'SPHYS.FieldQuantization.the_mirror_of_the_quanta_is_its_own_inverse' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_mirror_of_the_quanta_is_its_own_inverse
/--
info: 'SPHYS.FieldQuantization.the_mirror_exchanges_the_two_polarisations' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_mirror_exchanges_the_two_polarisations
/--
info: 'SPHYS.FieldQuantization.the_energy_is_kept_by_the_mirror' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_energy_is_kept_by_the_mirror
/--
info: 'SPHYS.FieldQuantization.a_seat_is_infinite_iff_a_reading_takes_every_whole_number' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.a_seat_is_infinite_iff_a_reading_takes_every_whole_number
/--
info: 'SPHYS.FieldQuantization.on_a_finite_seat_every_reading_takes_finitely_many_values' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.on_a_finite_seat_every_reading_takes_finitely_many_values
/--
info: 'SPHYS.FieldQuantization.no_proof_decides_the_seat' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.no_proof_decides_the_seat
/--
info: 'SPHYS.FieldQuantization.no_value_of_the_constant_is_forced' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.no_value_of_the_constant_is_forced
/-- info: 'SPHYS.FieldQuantization.the_count_has_no_canonical_partner' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_count_has_no_canonical_partner
/--
info: 'SPHYS.FieldQuantization.a_reading_kept_by_the_joint_step_is_its_own_history' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.a_reading_kept_by_the_joint_step_is_its_own_history
/--
info: 'SPHYS.FieldQuantization.every_history_is_a_reading_kept_by_the_joint_step' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.every_history_is_a_reading_kept_by_the_joint_step
/-- info: 'SPHYS.FieldQuantization.a_law_kept_by_every_map_prefers_no_slicing' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.a_law_kept_by_every_map_prefers_no_slicing
/-- info: 'SPHYS.FieldQuantization.a_record_may_carry_its_own_slicing' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.FieldQuantization.a_record_may_carry_its_own_slicing
/--
info: 'SPHYS.FieldQuantization.no_proof_decides_whether_a_field_holds_a_commutator' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.no_proof_decides_whether_a_field_holds_a_commutator
/--
info: 'SPHYS.FieldQuantization.the_rate_of_the_outside_clock_along_a_ray' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_rate_of_the_outside_clock_along_a_ray
/--
info: 'SPHYS.FieldQuantization.the_outside_clock_never_registers_the_crossing' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_outside_clock_never_registers_the_crossing
/--
info: 'SPHYS.FieldQuantization.the_hilbert_space_is_subsumed' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.FieldQuantization.the_hilbert_space_is_subsumed
