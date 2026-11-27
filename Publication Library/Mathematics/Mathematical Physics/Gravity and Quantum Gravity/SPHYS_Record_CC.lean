/-
  SPHYS_Record_CC.lean · The record and the canonical pair.
  Lean 4.19.0 with Mathlib 4.19.0. No axiom declared, no open proof.

  RATIONALE. The file settles one question: can a reading of the record be a member of a canonical pair. A seat is any
  type `S`. A reading is a function on the seat with values in a ring whose multiplication commutes. The quantities are
  the linear maps of the readings, and a reading acts among them by multiplying. A canonical pair is a pair of quantities
  with commutator one.

  DESIGN. Part I: the quantity of a reading; readings commute; sums and products of readings are readings; a quantity that
  commutes with every reading is a reading. Part II: no reading is a member of a canonical pair, in either place, with a
  reading or with any other quantity; the same for a reading of the record, a function of the registered point.
  Part III: the other side. On the polynomials, where no single point is read, multiplication by the variable and the
  derivative are a canonical pair. So are a reading that rises at a fixed rate and the derivative over that rate. Part IV: the functions of a geometry. Commutation of the functions is not assumed. A
  metric that is symmetric and linear over the functions in its first place, with one field of square plus or minus
  one, forces the functions to commute; without the symmetry, or without such a field, they need not. Part V: where a
  field differentiates. The commutator of a field with a function is the function's derivative along the field, so a
  field that moves a function at unit rate is its canonical partner; and on the ring of all readings of a set of
  points, with constants unmoved, no field differentiates at all. Part VI: fields that are a module over the functions
  and act by the rule of the product. No metric enters. The commutator of two functions kills every derivative, so one
  coordinate forces the functions to commute, and in a ring with no divisors of zero functions that do not commute are
  not differentiated at all. Part II also holds the converse of its bar: a reading with a canonical partner on a space
  of states lives where no single point is read. Part VII: fields that are a module over the scalars only, the
  functions being any ring. A frame that resolves the fields by the metric makes the metric scalar, so the geometry
  commutes with every function and has no canonical partner among them; and a field keeps the functions that commute
  with all. Part VIII: rings with divisors of zero. Where one is a sum of functions times commutators, nothing is
  differentiated, and the two by two matrices are such a ring. Part IX: a source in two places. A reading never moves
  one point to another; a product of readings of the parts keeps a product; a reading of the joint record that does
  not factor entangles; a reading weighted by the state is not linear; and where every reading acts on the states, the
  reading of a point is a state and no reading has a partner. Part X: for a canonical pair with a ground state, the
  square of the amplitude returns the ground state once. Part XI: a sum over histories of two steps is the product of
  the steps. Part XII: a reading with invertible values is undone by a reading and loses no state, and a reading whose
  complex values have size one keeps the size of a state at every point.

  RISK. Part II is stated for the space of ALL readings of the seat, where the reading of one registered point exists; the
  proof evaluates on that reading. On a space of readings that leaves it out, Part III shows a pair. The file does not say
  which space the states of a field of nature form, and it does not say that gravity is a reading of the record: that is
  a premise of the paper, printed there. Part IV speaks of the functions of a geometry, the readings of its points. It
  does not speak of the readings of the states of a field, which Parts I to III treat. A geometry whose metric is
  symmetric only up to an adjoint is outside Part IV, and the first witness there shows that door is open. Part VI
  closes it for every geometry whose fields are a module over its functions, whatever its metric. A geometry whose
  fields are no module over its functions is the subject of Part VII: there the fields are a module over scalars that
  commute with every function, and a frame that resolves the fields by the metric makes the metric scalar. A geometry
  with no frame of fields, or with no fields, is outside the file.

  NON-NEGOTIABLES. No axiom is declared. No hypothesis states its conclusion. Every theorem prints its kernel line below.

  SUMMARY RULE. The sentences of this header are summaries. Each theorem states its own conditions, and where a summary
  and a statement differ the statement governs.
-/
import Mathlib.Algebra.Module.LinearMap.End
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Algebra.Module.Pi
import Mathlib.Tactic.Ring
import Mathlib.Data.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.Algebra.Algebra.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Tactic.NormNum
import Mathlib.Algebra.Field.Basic
import Mathlib.Analysis.Complex.Basic

namespace SPHYS.Record
variable {S L K : Type*} [CommRing K]

/-! ## Part I. The readings among the quantities. -/

/-- THE QUANTITY OF A READING. A reading `f` acts on the readings by multiplying, point by point. -/
def quantity (f : S → K) : Module.End K (S → K) where
  toFun φ := fun x => f x * φ x
  map_add' φ ψ := by funext x; simp [mul_add]
  map_smul' c φ := by funext x; simp [mul_left_comm]

/-- The quantity of a reading, at a point. -/
@[simp] theorem quantity_apply (f φ : S → K) (x : S) : quantity f φ x = f x * φ x := rfl

/-- READINGS COMMUTE. The quantities of two readings commute. -/
theorem readings_commute (f g : S → K) : quantity f * quantity g = quantity g * quantity f :=
  LinearMap.ext fun φ => funext fun x => by simp [Module.End.mul_apply, mul_left_comm]

/-- A PRODUCT OF READINGS IS A READING. -/
theorem a_product_of_readings_is_a_reading (f g : S → K) : quantity f * quantity g = quantity (f * g) :=
  LinearMap.ext fun φ => funext fun x => by simp [Module.End.mul_apply, mul_assoc]

/-- A SUM OF READINGS IS A READING. -/
theorem a_sum_of_readings_is_a_reading (f g : S → K) : quantity f + quantity g = quantity (f + g) :=
  LinearMap.ext fun φ => funext fun x => by simp [add_mul]

/-- THE READINGS ARE ALL THAT COMMUTES WITH THE READINGS. A quantity that commutes with the quantity of every reading
is the quantity of a reading: the one it gives the constant reading one. -/
theorem a_quantity_that_commutes_with_every_reading_is_a_reading (T : Module.End K (S → K))
    (h : ∀ f, T * quantity f = quantity f * T) : T = quantity (T fun _ => 1) :=
  LinearMap.ext fun φ => funext fun x => by
    have h1 := congrArg (fun A : Module.End K (S → K) => A (fun _ => 1) x) (h φ)
    simp only [Module.End.mul_apply, quantity_apply] at h1
    have h2 : quantity φ (fun _ => (1 : K)) = φ := funext fun y => by simp
    rw [h2] at h1; rw [h1]; simp [mul_comm]

/-! ## Part II. No reading is a member of a canonical pair. -/

/-- THE READING OF ONE POINT IS KEPT BY EVERY READING. The quantity of a reading `f` sends the reading of the single
point `x` to `f x` times itself. -/
theorem a_reading_keeps_the_reading_of_a_point [DecidableEq S] (f : S → K) (x : S) :
    quantity f (Pi.single x (1 : K) : S → K) = f x • (Pi.single x (1 : K) : S → K) := by
  funext y
  by_cases hy : y = x
  · subst hy; simp
  · simp [Pi.single_eq_of_ne hy]

/-- NO READING HAS A CANONICAL PARTNER. On a seat that is not empty, with values in which one is not zero, no linear map
of the readings has commutator one with the quantity of a reading. -/
theorem no_reading_has_a_canonical_partner [Nontrivial K] [Nonempty S] (f : S → K)
    (P : Module.End K (S → K)) : P * quantity f - quantity f * P ≠ 1 := by
  classical
  intro h
  obtain ⟨x⟩ := ‹Nonempty S›
  have h1 := congrArg (fun A : Module.End K (S → K) => A (Pi.single x (1 : K) : S → K) x) h
  simp only [LinearMap.sub_apply, Module.End.mul_apply, Module.End.one_apply, Pi.sub_apply, quantity_apply,
    a_reading_keeps_the_reading_of_a_point, map_smul, Pi.smul_apply, smul_eq_mul, sub_self, Pi.single_eq_same] at h1
  exact zero_ne_one h1

/-- NOR IN THE OTHER PLACE. Under the same conditions no linear map of the readings stands second to a reading in a
canonical pair. -/
theorem no_reading_is_first_in_a_canonical_pair [Nontrivial K] [Nonempty S] (f : S → K)
    (Q : Module.End K (S → K)) : quantity f * Q - Q * quantity f ≠ 1 := by
  classical
  intro h
  obtain ⟨x⟩ := ‹Nonempty S›
  have h1 := congrArg (fun A : Module.End K (S → K) => A (Pi.single x (1 : K) : S → K) x) h
  simp only [LinearMap.sub_apply, Module.End.mul_apply, Module.End.one_apply, Pi.sub_apply, quantity_apply,
    a_reading_keeps_the_reading_of_a_point, map_smul, Pi.smul_apply, smul_eq_mul, sub_self, Pi.single_eq_same] at h1
  exact zero_ne_one h1

/-- NO READING IS A MEMBER OF A CANONICAL PAIR. Both places at once. -/
theorem no_reading_is_a_member_of_a_canonical_pair [Nontrivial K] [Nonempty S] (f : S → K)
    (T : Module.End K (S → K)) : T * quantity f - quantity f * T ≠ 1 ∧ quantity f * T - T * quantity f ≠ 1 :=
  ⟨no_reading_has_a_canonical_partner f T, no_reading_is_first_in_a_canonical_pair f T⟩

/-- NO TWO READINGS ARE CANONICAL. -/
theorem no_two_readings_are_canonical [Nontrivial K] [Nonempty S] (f g : S → K) :
    quantity g * quantity f - quantity f * quantity g ≠ 1 := no_reading_has_a_canonical_partner f _

/-- NO READING OF THE RECORD IS A MEMBER OF A CANONICAL PAIR. Let `reg` send each state to its registered point and let
`g` be any function of the registered point. Then `g` after `reg` is a reading, and it is a member of no canonical
pair. -/
theorem no_reading_of_the_record_is_a_member_of_a_canonical_pair [Nontrivial K] [Nonempty S] (reg : S → L)
    (g : L → K) (T : Module.End K (S → K)) :
    T * quantity (g ∘ reg) - quantity (g ∘ reg) * T ≠ 1 ∧ quantity (g ∘ reg) * T - T * quantity (g ∘ reg) ≠ 1 :=
  no_reading_is_a_member_of_a_canonical_pair _ T

/-- IN A CANONICAL PAIR NEITHER MEMBER IS A READING. If two quantities have commutator one, neither is the quantity of
a reading. -/
theorem in_a_canonical_pair_neither_member_is_a_reading [Nontrivial K] [Nonempty S] (P Q : Module.End K (S → K))
    (h : P * Q - Q * P = 1) : (∀ f, Q ≠ quantity f) ∧ (∀ f, P ≠ quantity f) :=
  ⟨fun f hQ => no_reading_has_a_canonical_partner f P (hQ ▸ h),
   fun f hP => no_reading_is_first_in_a_canonical_pair f Q (hP ▸ h)⟩

/-- A READING WITH A CANONICAL PARTNER LIVES WHERE NO SINGLE POINT IS READ. Let `V` be any space of states, a subspace
of the readings that the reading `f` carries into itself, and let `P` be a linear map on `V` whose commutator with `f`
is the identity on `V`. Then `V` holds the reading of no single point. So a space of states that holds the reading of
one registered point gives no reading a canonical partner. -/
theorem a_reading_with_a_canonical_partner_lives_where_no_single_point_is_read [Nontrivial K] [DecidableEq S]
    (V : Submodule K (S → K)) (f : S → K) (hV : ∀ φ ∈ V, quantity f φ ∈ V) (P : V →ₗ[K] (S → K))
    (h : ∀ φ : V, P ⟨quantity f φ, hV φ φ.2⟩ - quantity f (P φ) = φ) (x : S) :
    (Pi.single x (1 : K) : S → K) ∉ V := by
  intro hx
  have he : (⟨quantity f (Pi.single x (1 : K)), hV _ hx⟩ : V) = f x • (⟨Pi.single x 1, hx⟩ : V) :=
    Subtype.ext (by simpa using a_reading_keeps_the_reading_of_a_point f x)
  have h1 := congrFun (h ⟨Pi.single x 1, hx⟩) x
  simp only [he, map_smul] at h1
  simp at h1

/-! ## Part III. The other side: where no single point is read. -/

open Polynomial in
/-- Multiplication by the variable, on the polynomials. -/
noncomputable def timesX : K[X] →ₗ[K] K[X] where
  toFun p := X * p
  map_add' p q := mul_add X p q
  map_smul' c p := by simp only [RingHom.id_apply, smul_eq_C_mul]; ring

open Polynomial in
/-- WHERE NO POINT IS READ, A READING HAS A PARTNER. On the polynomials the derivative and multiplication by the
variable have commutator one. The polynomials hold no reading of a single point. -/
theorem where_no_point_is_read_a_reading_has_a_partner :
    (derivative : K[X] →ₗ[K] K[X]) * timesX - timesX * derivative = 1 :=
  LinearMap.ext fun p => by simp [Module.End.mul_apply, timesX, derivative_mul]

open Polynomial in
/-- A READING THAT RISES AT A FIXED RATE HAS A PARTNER WHERE NO POINT IS READ. On the polynomials over a field, take the
reading that is the rate `c` times the variable, with `c` not zero: the potential of a uniform pull against the
height. The derivative divided by `c` has commutator one with it. On the polynomials the potential of a body has a
partner among the quantities of the body. -/
theorem where_no_point_is_read_a_potential_of_fixed_rate_has_a_partner {F : Type*} [Field F] (c : F) (hc : c ≠ 0) :
    (c⁻¹ • (derivative : F[X] →ₗ[F] F[X])) * (c • timesX) - (c • timesX) * (c⁻¹ • (derivative : F[X] →ₗ[F] F[X])) = 1 := by
  rw [smul_mul_smul_comm, smul_mul_smul_comm, inv_mul_cancel₀ hc, mul_inv_cancel₀ hc, one_smul, one_smul]
  exact where_no_point_is_read_a_reading_has_a_partner

/-! ## Part IV. The functions of a geometry commute. Commutation is not assumed: the ring is any ring. -/

section Geometry
variable {A M : Type*} [Ring A] [AddCommGroup M] [Module A M]

/-- A SYMMETRIC METRIC SLIDES TWO FUNCTIONS PAST EACH OTHER. Let `g` be symmetric and linear over the functions in its
first place. Then for any two functions and any two fields, the two products of the functions give the same multiple
of the metric. -/
theorem a_symmetric_metric_slides_two_functions_past_each_other (g : M → M → A)
    (g_symm : ∀ X Y, g X Y = g Y X) (g_smul : ∀ (f : A) (X Z : M), g (f • X) Z = f * g X Z)
    (f h : A) (X Z : M) : (f * h) * g X Z = (h * f) * g X Z := by
  have a : g (f • X) (h • Z) = f * (h * g X Z) := by rw [g_smul, g_symm X (h • Z), g_smul, g_symm Z X]
  have b : g (f • X) (h • Z) = h * (f * g X Z) := by rw [g_symm (f • X) (h • Z), g_smul, g_symm Z (f • X), g_smul]
  rw [mul_assoc, mul_assoc, ← a, ← b]

/-- A SYMMETRIC METRIC WITH A FIELD OF UNIT SQUARE FORCES THE FUNCTIONS TO COMMUTE. Let `g` be symmetric and linear
over the functions in its first place, and let one field have square one or minus one, as each field of a frame has.
Then any two functions commute. -/
theorem a_symmetric_metric_with_a_field_of_unit_square_forces_the_functions_to_commute (g : M → M → A)
    (g_symm : ∀ X Y, g X Y = g Y X) (g_smul : ∀ (f : A) (X Z : M), g (f • X) Z = f * g X Z)
    (e : M) (he : g e e = 1 ∨ g e e = -1) (f h : A) : f * h = h * f := by
  have k := a_symmetric_metric_slides_two_functions_past_each_other g g_symm g_smul f h e e
  rcases he with he | he <;> rw [he] at k
  · simpa using k
  · simpa using k

/-- NO TWO FUNCTIONS OF SUCH A GEOMETRY ARE CANONICAL. Under the same conditions, where one is not zero, no two
functions have commutator one. The components of the metric and of every curvature are among the functions. -/
theorem no_two_functions_of_a_geometry_are_canonical [Nontrivial A] (g : M → M → A)
    (g_symm : ∀ X Y, g X Y = g Y X) (g_smul : ∀ (f : A) (X Z : M), g (f • X) Z = f * g X Z)
    (e : M) (he : g e e = 1 ∨ g e e = -1) (a b : A) : a * b - b * a ≠ 1 := by
  intro k
  rw [a_symmetric_metric_with_a_field_of_unit_square_forces_the_functions_to_commute g g_symm g_smul e he a b,
    sub_self] at k
  exact zero_ne_one k

end Geometry

/-- WITHOUT THE SYMMETRY THE FUNCTIONS NEED NOT COMMUTE. On the two by two matrices, the product is linear over the
matrices in its first place and gives one on the unit field, and two matrices do not commute. A geometry whose
functions do not commute must give up the symmetry of its metric. -/
theorem without_the_symmetry_the_functions_need_not_commute :
    ∃ g : Matrix (Fin 2) (Fin 2) ℚ → Matrix (Fin 2) (Fin 2) ℚ → Matrix (Fin 2) (Fin 2) ℚ,
      (∀ f X Z, g (f • X) Z = f * g X Z) ∧ g 1 1 = 1 ∧ ∃ a b : Matrix (Fin 2) (Fin 2) ℚ, a * b ≠ b * a := by
  refine ⟨fun X Z => X * Z, fun f X Z => by simp [mul_assoc], by simp, !![0, 1; 0, 0], !![0, 0; 1, 0], fun h => ?_⟩
  have e := congrFun (congrFun h 0) 0
  simp [Matrix.mul_apply, Fin.sum_univ_two] at e

/-- WITHOUT A FIELD OF UNIT SQUARE THE FUNCTIONS NEED NOT COMMUTE. The zero form is symmetric and linear over any
ring. -/
theorem without_a_field_of_unit_square_the_functions_need_not_commute :
    ∃ g : Matrix (Fin 2) (Fin 2) ℚ → Matrix (Fin 2) (Fin 2) ℚ → Matrix (Fin 2) (Fin 2) ℚ,
      (∀ X Y, g X Y = g Y X) ∧ (∀ f X Z, g (f • X) Z = f * g X Z)
        ∧ ∃ a b : Matrix (Fin 2) (Fin 2) ℚ, a * b ≠ b * a := by
  refine ⟨fun _ _ => 0, fun _ _ => rfl, fun f X Z => by simp, !![0, 1; 0, 0], !![0, 0; 1, 0], fun h => ?_⟩
  have e := congrFun (congrFun h 0) 0
  simp [Matrix.mul_apply, Fin.sum_univ_two] at e

/-! ## Part VI. Fields that are a module over the functions. No metric enters, and commutation is not assumed. -/

section Fields
variable {A M : Type*} [Ring A] [AddCommGroup M] [Module A M]

/-- THE COMMUTATOR OF TWO FUNCTIONS KILLS EVERY DERIVATIVE. Let the fields be a module over the functions and act on
them by the rule of the product, with a function times a field acting as the function times the action. Then the
commutator of any two functions, times any derivative of any function, is zero. -/
theorem the_commutator_of_two_functions_kills_every_derivative (act : M → A → A)
    (act_mul : ∀ (X : M) (f h : A), act X (f * h) = act X f * h + f * act X h)
    (smul_act : ∀ (f : A) (X : M) (h : A), act (f • X) h = f * act X h) (f a b : A) (X : M) :
    (f * a - a * f) * act X b = 0 := by
  have h1 := act_mul (f • X) a b
  rw [smul_act, smul_act, smul_act, act_mul, mul_add, mul_assoc] at h1
  have h2 : f * (a * act X b) = a * (f * act X b) := add_left_cancel h1
  rw [sub_mul, mul_assoc, mul_assoc, h2, sub_self]

/-- ONE DERIVATIVE THAT IS NOT A DIVISOR OF ZERO FORCES THE FUNCTIONS TO COMMUTE. Under the same conditions, if some
field moves some function to a value that no function but zero multiplies to zero, any two functions commute. -/
theorem one_derivative_that_divides_no_zero_forces_the_functions_to_commute (act : M → A → A)
    (act_mul : ∀ (X : M) (f h : A), act X (f * h) = act X f * h + f * act X h)
    (smul_act : ∀ (f : A) (X : M) (h : A), act (f • X) h = f * act X h) (X : M) (b : A)
    (hb : ∀ c : A, c * act X b = 0 → c = 0) (f a : A) : f * a = a * f :=
  sub_eq_zero.mp (hb _ (the_commutator_of_two_functions_kills_every_derivative act act_mul smul_act f a b X))

/-- A COORDINATE FORCES THE FUNCTIONS TO COMMUTE. If some field moves some function at unit rate, any two functions
commute. -/
theorem a_coordinate_forces_the_functions_to_commute (act : M → A → A)
    (act_mul : ∀ (X : M) (f h : A), act X (f * h) = act X f * h + f * act X h)
    (smul_act : ∀ (f : A) (X : M) (h : A), act (f • X) h = f * act X h) (X : M) (b : A)
    (hb : act X b = 1) (f a : A) : f * a = a * f :=
  one_derivative_that_divides_no_zero_forces_the_functions_to_commute act act_mul smul_act X b
    (fun c hc => by rw [hb, mul_one] at hc; exact hc) f a

/-- FUNCTIONS THAT DO NOT COMMUTE ARE NOT DIFFERENTIATED. In a ring with no divisors of zero, if two functions do not
commute, every field sends every function to zero. -/
theorem functions_that_do_not_commute_are_not_differentiated [NoZeroDivisors A] (act : M → A → A)
    (act_mul : ∀ (X : M) (f h : A), act X (f * h) = act X f * h + f * act X h)
    (smul_act : ∀ (f : A) (X : M) (h : A), act (f • X) h = f * act X h) (f a : A) (hfa : f * a ≠ a * f)
    (X : M) (b : A) : act X b = 0 :=
  (mul_eq_zero.mp (the_commutator_of_two_functions_kills_every_derivative act act_mul smul_act f a b X)).resolve_left
    (sub_ne_zero.mpr hfa)

end Fields

/-- WHERE NOTHING IS DIFFERENTIATED THE FUNCTIONS NEED NOT COMMUTE. The zero action obeys both rules on the two by
two matrices, and two matrices do not commute. -/
theorem where_nothing_is_differentiated_the_functions_need_not_commute :
    ∃ act : Matrix (Fin 2) (Fin 2) ℚ → Matrix (Fin 2) (Fin 2) ℚ → Matrix (Fin 2) (Fin 2) ℚ,
      (∀ X f h, act X (f * h) = act X f * h + f * act X h) ∧ (∀ f X h, act (f • X) h = f * act X h)
        ∧ ∃ a b : Matrix (Fin 2) (Fin 2) ℚ, a * b ≠ b * a := by
  refine ⟨fun _ _ => 0, fun X f h => by simp, fun f X h => by simp, !![0, 1; 0, 0], !![0, 0; 1, 0], fun h => ?_⟩
  have e := congrFun (congrFun h 0) 0
  simp [Matrix.mul_apply, Fin.sum_univ_two] at e

/-! ## Part VII. Fields that are a module over the scalars only. The functions are any ring; the scalars commute with
all of them. -/

section Scalars
variable {C A M ι : Type*} [CommRing C] [Ring A] [Algebra C A] [AddCommGroup M] [Module C M] [Fintype ι]

/-- THE METRIC OF A GEOMETRY WITH A FRAME IS SCALAR. Let the functions be any ring, and let the fields be a module over
scalars that commute with every function. Let the metric be symmetric and linear over the scalars, and let a frame
resolve every field with the metric's components as coefficients, as the frame of the paper does: the component of `X`
along `e i` is the scalar `γ i X`, and `X` is the sum of `s i * γ i X` times `e i`. Then the metric of any two fields
is a scalar, and the formula gives it. -/
theorem the_metric_of_a_geometry_with_a_frame_is_scalar (g : M →ₗ[C] M →ₗ[C] A) (g_symm : ∀ X Y, g X Y = g Y X)
    (e : ι → M) (s : ι → C) (γ : ι → M → C) (comp : ∀ X i, g X (e i) = algebraMap C A (γ i X))
    (complete : ∀ X : M, X = ∑ i, (s i * γ i X) • e i) (X Y : M) :
    g X Y = algebraMap C A (∑ i, s i * γ i X * γ i Y) := by
  have h : g X Y = ∑ i, (s i * γ i X) • g (e i) Y := by
    conv_lhs => rw [complete X]
    simp only [map_sum, LinearMap.sum_apply, map_smul, LinearMap.smul_apply]
  rw [h, map_sum]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [g_symm (e i) Y, comp, Algebra.smul_def, ← map_mul]

/-- SO THE GEOMETRY COMMUTES WITH EVERY FUNCTION. Under the same conditions the metric of any two fields commutes with
every function, whether or not the functions commute with one another. -/
theorem the_metric_of_a_geometry_with_a_frame_commutes_with_every_function (g : M →ₗ[C] M →ₗ[C] A)
    (g_symm : ∀ X Y, g X Y = g Y X) (e : ι → M) (s : ι → C) (γ : ι → M → C)
    (comp : ∀ X i, g X (e i) = algebraMap C A (γ i X)) (complete : ∀ X : M, X = ∑ i, (s i * γ i X) • e i)
    (X Y : M) (a : A) : g X Y * a = a * g X Y := by
  rw [the_metric_of_a_geometry_with_a_frame_is_scalar g g_symm e s γ comp complete X Y]
  exact Algebra.commutes _ a

/-- AND NO COMPONENT OF IT HAS A CANONICAL PARTNER AMONG THE FUNCTIONS. Under the same conditions, where one is not
zero, no function has commutator one with the metric of two fields, in either place. -/
theorem no_function_is_canonical_with_the_metric_of_a_geometry_with_a_frame [Nontrivial A]
    (g : M →ₗ[C] M →ₗ[C] A) (g_symm : ∀ X Y, g X Y = g Y X) (e : ι → M) (s : ι → C) (γ : ι → M → C)
    (comp : ∀ X i, g X (e i) = algebraMap C A (γ i X)) (complete : ∀ X : M, X = ∑ i, (s i * γ i X) • e i)
    (X Y : M) (a : A) : a * g X Y - g X Y * a ≠ 1 ∧ g X Y * a - a * g X Y ≠ 1 := by
  have k := the_metric_of_a_geometry_with_a_frame_commutes_with_every_function g g_symm e s γ comp complete X Y a
  constructor
  · intro h; rw [k, sub_self] at h; exact zero_ne_one h
  · intro h; rw [k, sub_self] at h; exact zero_ne_one h

end Scalars

/-- A FIELD SENDS A FUNCTION THAT COMMUTES WITH ALL TO A FUNCTION THAT COMMUTES WITH ALL. Let `D` obey the rule of the
product on any ring. If `z` commutes with every function, so does `D z`. So the functions that commute with all are a
geometry of their own under the same fields. -/
theorem a_field_keeps_the_functions_that_commute_with_all {B : Type*} [Ring B] (D : B → B)
    (leib : ∀ f h, D (f * h) = D f * h + f * D h) (z : B) (hz : ∀ a, z * a = a * z) (a : B) :
    D z * a = a * D z := by
  have h1 := leib z a
  have h2 := leib a z
  rw [hz a, h2, hz (D a), add_comm (D z * a)] at h1
  exact (add_left_cancel h1).symm

/-! ## Part VIII. Where the commutators reach one. Rings with divisors of zero. -/

section Reach
variable {A M : Type*} [Ring A] [AddCommGroup M] [Module A M]

/-- WHERE THE COMMUTATORS REACH ONE NOTHING IS DIFFERENTIATED. Let the fields be a module over the functions and act by
the rule of the product, as in Part VI. If one is a sum of functions times commutators of functions, every field sends
every function to zero. No condition on divisors of zero is asked. -/
theorem where_the_commutators_reach_one_nothing_is_differentiated (act : M → A → A)
    (act_mul : ∀ (X : M) (f h : A), act X (f * h) = act X f * h + f * act X h)
    (smul_act : ∀ (f : A) (X : M) (h : A), act (f • X) h = f * act X h) {κ : Type*} (s : Finset κ)
    (c f a : κ → A) (h : ∑ k ∈ s, c k * (f k * a k - a k * f k) = 1) (X : M) (b : A) : act X b = 0 := by
  have z : (∑ k ∈ s, c k * (f k * a k - a k * f k)) * act X b = 0 := by
    rw [Finset.sum_mul]
    refine Finset.sum_eq_zero fun k _ => ?_
    rw [mul_assoc, the_commutator_of_two_functions_kills_every_derivative act act_mul smul_act, mul_zero]
  rwa [h, one_mul] at z

end Reach

/-- IN THE TWO BY TWO MATRICES THE COMMUTATORS REACH ONE. Over any ring of values that commutes, one is a matrix times
a commutator of two matrices. So by the theorem above, functions with values in the two by two matrices are
differentiated by no field that is a module over them. -/
theorem in_the_two_by_two_matrices_the_commutators_reach_one {R : Type*} [CommRing R] :
    ∃ c f a : Matrix (Fin 2) (Fin 2) R, c * (f * a - a * f) = 1 := by
  refine ⟨!![1, 0; 0, -1], !![0, 1; 0, 0], !![0, 0; 1, 0], ?_⟩
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two, Matrix.one_apply]

/-! ## Part IX. A source in two places: what a reading does to a state that is no single point. -/

/-- A READING NEVER MOVES ONE POINT TO ANOTHER. The quantity of a reading, applied to the reading of the point `x`, is
zero at every other point. -/
theorem a_reading_never_moves_one_point_to_another [DecidableEq S] (f : S → K) (x y : S) (h : y ≠ x) :
    quantity f (Pi.single x (1 : K) : S → K) y = 0 := by
  simp [Pi.single_eq_of_ne h]

/-- A PRODUCT OF READINGS OF THE PARTS KEEPS A PRODUCT. On a seat of two parts, a reading that is a product of a
reading of each part sends a product of states to a product of states. -/
theorem a_product_of_readings_of_the_parts_keeps_a_product {T : Type*} (a φ : S → K) (b χ : T → K) :
    quantity (fun p : S × T => a p.1 * b p.2) (fun p => φ p.1 * χ p.2)
      = fun p => (a p.1 * φ p.1) * (b p.2 * χ p.2) := by
  funext p; simp only [quantity_apply]; ring

/-- A READING OF THE JOINT RECORD THAT DOES NOT FACTOR ENTANGLES. On two parts of two points each, let `u` be a reading
of the pair with `u(0,0) u(1,1)` different from `u(0,1) u(1,0)`. Applied to the product state that is one everywhere,
it gives a state that is the product of no two states of the parts. -/
theorem a_reading_of_the_joint_record_that_does_not_factor_entangles (u : Bool × Bool → K)
    (h : u (false, false) * u (true, true) ≠ u (false, true) * u (true, false)) :
    ¬ ∃ a b : Bool → K, ∀ x y, quantity u (fun _ => 1) (x, y) = a x * b y := by
  rintro ⟨a, b, hab⟩
  simp only [quantity_apply, mul_one] at hab
  apply h
  rw [hab false false, hab true true, hab false true, hab true false]; ring

/-- A READING WEIGHTED BY THE STATE IS NOT LINEAR. A map that multiplies a state by its own value is no linear map of
the states: it fails on a sum. So a geometry read off the mean of a state is no quantity. -/
theorem a_reading_weighted_by_the_state_is_not_linear :
    ¬ ∀ ψ χ : Unit → ℤ, (fun y => (ψ + χ) () * (ψ + χ) y) = (fun y => ψ () * ψ y) + fun y => χ () * χ y := by
  intro h
  have e := congrFun (h (fun _ => 1) (fun _ => 1)) ()
  norm_num at e

section EveryReading
variable {F : Type*} [Field F]

/-- WHERE EVERY READING ACTS, THE READING OF A POINT IS A STATE. Let `V` be a space of states that every reading
carries into itself, with values in a field. If some state is not zero at the point `x`, the reading of `x` is a
state. -/
theorem where_every_reading_acts_the_reading_of_a_point_is_a_state [DecidableEq S] (V : Submodule F (S → F))
    (hV : ∀ (h : S → F), ∀ φ ∈ V, quantity h φ ∈ V) (ψ : S → F) (hψ : ψ ∈ V) (x : S) (hx : ψ x ≠ 0) :
    (Pi.single x (1 : F) : S → F) ∈ V := by
  have k := hV (Pi.single x (ψ x)⁻¹) ψ hψ
  have e : quantity (Pi.single x (ψ x)⁻¹) ψ = (Pi.single x (1 : F) : S → F) := by
    funext y
    by_cases hy : y = x
    · subst hy; simp [hx]
    · simp [Pi.single_eq_of_ne hy]
  rwa [e] at k

/-- WHERE EVERY READING ACTS NO READING HAS A PARTNER. Let `V` be a space of states that every reading carries into
itself and that holds a state that is not zero. Then no linear map on `V` has commutator one with any reading. So a
canonical pair with a reading in it asks for a reading of the record that cannot be applied to a state. -/
theorem where_every_reading_acts_no_reading_has_a_partner [DecidableEq S] (V : Submodule F (S → F))
    (hV : ∀ (h : S → F), ∀ φ ∈ V, quantity h φ ∈ V) (ψ : S → F) (hψ : ψ ∈ V) (x : S) (hx : ψ x ≠ 0)
    (f : S → F) (P : V →ₗ[F] (S → F)) :
    ¬ ∀ φ : V, P ⟨quantity f φ, hV f φ φ.2⟩ - quantity f (P φ) = φ := fun h =>
  a_reading_with_a_canonical_partner_lives_where_no_single_point_is_read V f (hV f) P h x
    (where_every_reading_acts_the_reading_of_a_point_is_a_state V hV ψ hψ x hx)

end EveryReading

/-! ## Part X. The ground state and the amplitude. -/

section Amplitude
variable {W : Type*} [AddCommGroup W] [Module K W]

/-- THE AMPLITUDE ON THE GROUND STATE IS ONE QUANTUM. For any two quantities `P`, `Q` and a state `v` with `P v = 0`,
the sum `P + Q` sends `v` to `Q v`. -/
theorem the_amplitude_on_the_ground_state_is_one_quantum (P Q : Module.End K W) (v : W) (hv : P v = 0) :
    (P + Q) v = Q v := by
  simp [hv]

/-- THE AMPLITUDE SQUARED ON THE GROUND STATE. For a canonical pair `P`, `Q` and a ground state `v`, `P v = 0`, the
square of the amplitude `P + Q` sends `v` to `v` plus two quanta: the ground state comes back once. That one is the
fluctuation of the ground state. -/
theorem the_amplitude_squared_on_the_ground_state (P Q : Module.End K W) (h : P * Q - Q * P = 1) (v : W)
    (hv : P v = 0) : ((P + Q) * (P + Q)) v = v + Q (Q v) := by
  have h1 : P (Q v) = v := by
    have e := congrArg (fun T : Module.End K W => T v) h
    simpa [Module.End.mul_apply, hv] using e
  simp [Module.End.mul_apply, hv, h1]

end Amplitude

/-! ## Part XI. The sum over histories. -/

/-- A SUM OVER HISTORIES OF TWO STEPS IS THE PRODUCT OF THE STEPS. On a finite seat, the amplitude to go from `x` to
`z` in two steps, summed over every point between, is the entry of the product of the two steps. A sum over histories
is a power of a quantity and adds no quantity to the ring. -/
theorem a_sum_over_histories_of_two_steps_is_the_product_of_the_steps {n : Type*} [Fintype n]
    (T U : Matrix n n K) (x z : n) : (T * U) x z = ∑ y, T x y * U y z := Matrix.mul_apply

/-! ## Part XII. A reading loses nothing: no noise and no collapse. -/

/-- A READING WITH INVERTIBLE VALUES IS UNDONE BY A READING. If `f x * g x = 1` at every point, the quantities of `f` and
`g` undo each other on both sides. -/
theorem a_reading_with_invertible_values_is_undone_by_a_reading (f g : S → K) (h : ∀ x, f x * g x = 1) :
    quantity g * quantity f = 1 ∧ quantity f * quantity g = 1 := by
  constructor
  · refine LinearMap.ext fun φ => funext fun x => ?_
    simp only [Module.End.mul_apply, quantity_apply, Module.End.one_apply]
    rw [← mul_assoc, mul_comm (g x), h, one_mul]
  · refine LinearMap.ext fun φ => funext fun x => ?_
    simp only [Module.End.mul_apply, quantity_apply, Module.End.one_apply]
    rw [← mul_assoc, h, one_mul]

/-- A READING WITH INVERTIBLE VALUES LOSES NO STATE. Under the same condition two states that the reading sends to one
state are one state. -/
theorem a_reading_with_invertible_values_loses_no_state (f g : S → K) (h : ∀ x, f x * g x = 1) (φ χ : S → K)
    (e : quantity f φ = quantity f χ) : φ = χ := by
  have k := (a_reading_with_invertible_values_is_undone_by_a_reading f g h).1
  have a := congrArg (quantity g) e
  have b : ∀ ψ : S → K, quantity g (quantity f ψ) = ψ := fun ψ => by
    have := congrArg (fun T : Module.End K (S → K) => T ψ) k
    simpa [Module.End.mul_apply] using this
  rwa [b, b] at a

/-- A PHASE KEEPS THE WEIGHT OF EVERY CONFIGURATION. With complex values, a reading whose value has size one at every
point leaves the size of a state unchanged at every point. Nothing is moved from one configuration to another and
nothing is lost: a reading of this kind is no source of noise and no collapse. -/
theorem a_phase_keeps_the_weight_of_every_configuration (f φ : S → ℂ) (h : ∀ x, ‖f x‖ = 1) (x : S) :
    ‖quantity f φ x‖ = ‖φ x‖ := by
  rw [quantity_apply, norm_mul, h, one_mul]

/-! ## Part V. Where a field differentiates. -/

/-- THE COMMUTATOR OF A FIELD AND A FUNCTION IS THE DERIVATIVE. Let `D` obey the rule of the product on a ring whose
multiplication commutes. Then `D` after multiplying by `f`, less multiplying by `f` after `D`, is multiplying by
`D f`. -/
theorem the_commutator_of_a_field_and_a_function_is_the_derivative {B : Type*} [CommRing B] (D : B → B)
    (leib : ∀ f h, D (f * h) = D f * h + f * D h) (f h : B) : D (f * h) - f * D h = D f * h := by
  rw [leib]; ring

/-- A FIELD THAT MOVES A FUNCTION AT UNIT RATE IS ITS CANONICAL PARTNER. If `D f = 1`, the commutator of `D` and
multiplying by `f` is the identity. -/
theorem a_field_that_moves_a_function_at_unit_rate_is_its_canonical_partner {B : Type*} [CommRing B] (D : B → B)
    (leib : ∀ f h, D (f * h) = D f * h + f * D h) (f : B) (hf : D f = 1) (h : B) :
    D (f * h) - f * D h = h := by
  rw [the_commutator_of_a_field_and_a_function_is_the_derivative D leib, hf, one_mul]

/-- WHERE SINGLE POINTS ARE READ NO FIELD DIFFERENTIATES. On the ring of all readings of a set of points, a map that
obeys the rule of the product and sends every constant to zero sends every reading to zero. -/
theorem where_single_points_are_read_no_field_differentiates (D : (S → K) → (S → K))
    (leib : ∀ f h, D (f * h) = D f * h + f * D h) (const : ∀ c : K, D (fun _ => c) = 0) (f : S → K) :
    D f = 0 := by
  classical
  funext x
  have ee : (Pi.single x (1 : K) : S → K) * Pi.single x 1 = Pi.single x 1 := by
    funext y
    by_cases hy : y = x
    · subst hy; simp
    · simp [Pi.single_eq_of_ne hy]
  have h1 := congrFun (leib (Pi.single x (1 : K)) (Pi.single x 1)) x
  rw [ee] at h1
  simp only [Pi.add_apply, Pi.mul_apply, Pi.single_eq_same, mul_one, one_mul] at h1
  have de : D (Pi.single x (1 : K)) x = 0 := by
    have := sub_eq_zero.mpr h1.symm; simpa using this
  have fe : f * Pi.single x (1 : K) = (fun _ => f x) * Pi.single x (1 : K) := by
    funext y
    by_cases hy : y = x
    · subst hy; simp
    · simp [Pi.single_eq_of_ne hy]
  have h2 := congrFun (leib f (Pi.single x (1 : K))) x
  have h3 := congrFun (leib (fun _ => f x) (Pi.single x (1 : K))) x
  rw [fe, h3] at h2
  simp only [Pi.add_apply, Pi.mul_apply, Pi.single_eq_same, mul_one, const, de, mul_zero, add_zero,
    Pi.zero_apply, zero_mul] at h2
  simpa using h2.symm

end SPHYS.Record

/-! ## THE CONES, PINNED. A change of any cone fails the build. -/
/-- info: 'SPHYS.Record.readings_commute' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Record.readings_commute
/-- info: 'SPHYS.Record.a_product_of_readings_is_a_reading' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Record.a_product_of_readings_is_a_reading
/-- info: 'SPHYS.Record.a_sum_of_readings_is_a_reading' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Record.a_sum_of_readings_is_a_reading
/--
info: 'SPHYS.Record.a_quantity_that_commutes_with_every_reading_is_a_reading' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.a_quantity_that_commutes_with_every_reading_is_a_reading
/-- info: 'SPHYS.Record.a_reading_keeps_the_reading_of_a_point' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Record.a_reading_keeps_the_reading_of_a_point
/--
info: 'SPHYS.Record.no_reading_has_a_canonical_partner' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.no_reading_has_a_canonical_partner
/--
info: 'SPHYS.Record.no_reading_is_first_in_a_canonical_pair' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.no_reading_is_first_in_a_canonical_pair
/--
info: 'SPHYS.Record.no_reading_is_a_member_of_a_canonical_pair' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.no_reading_is_a_member_of_a_canonical_pair
/-- info: 'SPHYS.Record.no_two_readings_are_canonical' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Record.no_two_readings_are_canonical
/--
info: 'SPHYS.Record.no_reading_of_the_record_is_a_member_of_a_canonical_pair' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.no_reading_of_the_record_is_a_member_of_a_canonical_pair
/--
info: 'SPHYS.Record.in_a_canonical_pair_neither_member_is_a_reading' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.in_a_canonical_pair_neither_member_is_a_reading
/--
info: 'SPHYS.Record.a_reading_with_a_canonical_partner_lives_where_no_single_point_is_read' depends on axioms: [propext,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.a_reading_with_a_canonical_partner_lives_where_no_single_point_is_read
/--
info: 'SPHYS.Record.where_no_point_is_read_a_reading_has_a_partner' depends on axioms: [propext, Classical.choice, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.where_no_point_is_read_a_reading_has_a_partner
/--
info: 'SPHYS.Record.where_no_point_is_read_a_potential_of_fixed_rate_has_a_partner' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.where_no_point_is_read_a_potential_of_fixed_rate_has_a_partner
/-- info: 'SPHYS.Record.a_symmetric_metric_slides_two_functions_past_each_other' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Record.a_symmetric_metric_slides_two_functions_past_each_other
/--
info: 'SPHYS.Record.a_symmetric_metric_with_a_field_of_unit_square_forces_the_functions_to_commute' depends on axioms: [propext]
-/
#guard_msgs in #print axioms SPHYS.Record.a_symmetric_metric_with_a_field_of_unit_square_forces_the_functions_to_commute
/-- info: 'SPHYS.Record.no_two_functions_of_a_geometry_are_canonical' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Record.no_two_functions_of_a_geometry_are_canonical
/--
info: 'SPHYS.Record.without_the_symmetry_the_functions_need_not_commute' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.without_the_symmetry_the_functions_need_not_commute
/--
info: 'SPHYS.Record.without_a_field_of_unit_square_the_functions_need_not_commute' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.without_a_field_of_unit_square_the_functions_need_not_commute
/-- info: 'SPHYS.Record.the_commutator_of_two_functions_kills_every_derivative' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Record.the_commutator_of_two_functions_kills_every_derivative
/--
info: 'SPHYS.Record.one_derivative_that_divides_no_zero_forces_the_functions_to_commute' depends on axioms: [propext]
-/
#guard_msgs in #print axioms SPHYS.Record.one_derivative_that_divides_no_zero_forces_the_functions_to_commute
/-- info: 'SPHYS.Record.a_coordinate_forces_the_functions_to_commute' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Record.a_coordinate_forces_the_functions_to_commute
/-- info: 'SPHYS.Record.functions_that_do_not_commute_are_not_differentiated' depends on axioms: [propext] -/
#guard_msgs in #print axioms SPHYS.Record.functions_that_do_not_commute_are_not_differentiated
/--
info: 'SPHYS.Record.where_nothing_is_differentiated_the_functions_need_not_commute' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.where_nothing_is_differentiated_the_functions_need_not_commute
/-- info: 'SPHYS.Record.the_metric_of_a_geometry_with_a_frame_is_scalar' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Record.the_metric_of_a_geometry_with_a_frame_is_scalar
/--
info: 'SPHYS.Record.the_metric_of_a_geometry_with_a_frame_commutes_with_every_function' depends on axioms: [propext,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.the_metric_of_a_geometry_with_a_frame_commutes_with_every_function
/--
info: 'SPHYS.Record.no_function_is_canonical_with_the_metric_of_a_geometry_with_a_frame' depends on axioms: [propext,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.no_function_is_canonical_with_the_metric_of_a_geometry_with_a_frame
/-- info: 'SPHYS.Record.a_field_keeps_the_functions_that_commute_with_all' does not depend on any axioms -/
#guard_msgs in #print axioms SPHYS.Record.a_field_keeps_the_functions_that_commute_with_all
/--
info: 'SPHYS.Record.where_the_commutators_reach_one_nothing_is_differentiated' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.where_the_commutators_reach_one_nothing_is_differentiated
/--
info: 'SPHYS.Record.in_the_two_by_two_matrices_the_commutators_reach_one' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.in_the_two_by_two_matrices_the_commutators_reach_one
/-- info: 'SPHYS.Record.a_reading_never_moves_one_point_to_another' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Record.a_reading_never_moves_one_point_to_another
/-- info: 'SPHYS.Record.a_product_of_readings_of_the_parts_keeps_a_product' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Record.a_product_of_readings_of_the_parts_keeps_a_product
/--
info: 'SPHYS.Record.a_reading_of_the_joint_record_that_does_not_factor_entangles' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.a_reading_of_the_joint_record_that_does_not_factor_entangles
/-- info: 'SPHYS.Record.a_reading_weighted_by_the_state_is_not_linear' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Record.a_reading_weighted_by_the_state_is_not_linear
/--
info: 'SPHYS.Record.where_every_reading_acts_the_reading_of_a_point_is_a_state' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.where_every_reading_acts_the_reading_of_a_point_is_a_state
/--
info: 'SPHYS.Record.where_every_reading_acts_no_reading_has_a_partner' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.where_every_reading_acts_no_reading_has_a_partner
/-- info: 'SPHYS.Record.the_amplitude_on_the_ground_state_is_one_quantum' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Record.the_amplitude_on_the_ground_state_is_one_quantum
/-- info: 'SPHYS.Record.the_amplitude_squared_on_the_ground_state' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Record.the_amplitude_squared_on_the_ground_state
/--
info: 'SPHYS.Record.a_sum_over_histories_of_two_steps_is_the_product_of_the_steps' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.a_sum_over_histories_of_two_steps_is_the_product_of_the_steps
/--
info: 'SPHYS.Record.a_reading_with_invertible_values_is_undone_by_a_reading' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.a_reading_with_invertible_values_is_undone_by_a_reading
/-- info: 'SPHYS.Record.a_reading_with_invertible_values_loses_no_state' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms SPHYS.Record.a_reading_with_invertible_values_loses_no_state
/--
info: 'SPHYS.Record.a_phase_keeps_the_weight_of_every_configuration' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.a_phase_keeps_the_weight_of_every_configuration
/--
info: 'SPHYS.Record.the_commutator_of_a_field_and_a_function_is_the_derivative' depends on axioms: [propext, Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.the_commutator_of_a_field_and_a_function_is_the_derivative
/--
info: 'SPHYS.Record.a_field_that_moves_a_function_at_unit_rate_is_its_canonical_partner' depends on axioms: [propext,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.a_field_that_moves_a_function_at_unit_rate_is_its_canonical_partner
/--
info: 'SPHYS.Record.where_single_points_are_read_no_field_differentiates' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
-/
#guard_msgs in #print axioms SPHYS.Record.where_single_points_are_read_no_field_differentiates
