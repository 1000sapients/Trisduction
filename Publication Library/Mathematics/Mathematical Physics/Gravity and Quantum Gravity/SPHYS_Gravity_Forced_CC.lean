/-
  SPHYS_Gravity_Forced_CC.lean · Conservation forces Einstein's law, on real curvature · Lean 4.19.0, Mathlib v4.19.0.

  RATIONALE. The first engine of this name's paper carried the Bianchi identity as a field of a structure of three
  integers, and its reading of gravity was defined so as to have the properties it then "proved". A reader objected
  that nothing was proved about curvature. This file replaces that skeleton. Curvature is defined from a connection
  with no property built in; both Bianchi identities, the tensor laws of curvature, the contracted identity and the
  divergence of the family a·Ric + b·Scal·g + c·g are theorems; and conservation forces a + 2b = 0.

  DESIGN, in the form of Lie and Rinehart (no coordinates, no manifold library).
    Parts I-II   Vector fields are a Lie ring L. A connection is a map additive in each argument with no torsion.
                 Curvature R(X,Y)Z = ∇_X∇_Y Z − ∇_Y∇_X Z − ∇_[X,Y] Z. `first_bianchi`, `second_bianchi`.
    Part III     The hypotheses are not empty: half the bracket on a rational Lie algebra.
    Part IV      The derivations of any commutative algebra are such a Lie ring (Mathlib), so the identities hold
                 for them. The smooth vector fields of a manifold are the derivations of its smooth functions; that
                 identification is classical and is used in no proof.
    Part V       `Geom`: functions A, the action of a field on a function, the Leibniz rule, a metric the connection
                 preserves. Proved: curvature is linear over functions in each argument (`curv_smul_left`, `_mid`,
                 `_right`); the lowered curvature is antisymmetric in each pair; `second_bianchi_Rm`.
    Part VI      `Frame`: an orthonormal frame. Ricci and scalar curvature by trace. Proved: a trace commutes with
                 the covariant derivative (`trace_commute`), and `contracted_bianchi`: 2·div Ric = d Scal.
    Part VII     The family of laws. Proved: `twice_div_law`: 2·div = (a + 2b)·d Scal; `conservation_forces_the_ratio`;
                 `the_forced_law_is_conserved`; `einstein_law_is_conserved`.
    Part VIII    An explicit geometry: the surface dx² + f(x)² dy² in its orthonormal frame, over the rational
                 polynomials. Its Lie ring (Jacobi included), connection, metric and frame are built and every law
                 is proved. `model_curv`, `model_scal` = −2(1 + x²), `model_dScal_ne`.
    Part IX      `conservation_on_every_geometry_forces_the_ratio`: for integers a, b, c, a law of the family with
                 no divergence on every geometry has a + 2b = 0. No hypothesis on a geometry is left.
                 `the_forced_ratio_is_conserved_on_every_geometry`: the converse, with c free.
    Part VIII-b  A spacetime of four dimensions with one time direction, the surface times a flat plane; every
                 law proved again. `conservation_on_every_spacetime_of_four_dimensions_forces_the_ratio`: the
                 hypothesis of Part IX restricted to such spacetimes gives the same conclusion.
    Part IX-b    The seat and the record, as definitions.
    Part X       `Premises`: the three premises of the paper, in one structure the kernel sees. `einstein_forced`:
                 on them, twice the law is a·(2·Ric − Scal·g) + 2c·g on every geometry.
                 The field `conserved` asks for conservation on four-dimensional spacetimes only.
                 `einsteinPremises`: the structure is inhabited by Einstein's law with any vacuum term.
    Part XI      What a reading of the record can see: blind to the sign of charge and to composition, for every
                 reading; nothing is defined to be so.

  WHAT A STRUCTURE HERE CARRIES. `Connection`, `Geom` and `Frame` carry the definitions of a torsion-free connection,
  of a metric geometry and of an orthonormal frame. None of their fields is an identity of curvature, a symmetry of
  curvature, or a conservation law. Every such statement is a theorem below.

  WHAT IS NOT PROVED HERE (read before citing).
    (a) The family is the three-term family. That every conserved symmetric law of second order in four dimensions
        lies in it is Lovelock's theorem (1971), which is not proved here. Part VI-b proves the algebraic piece:
        every contraction of the curvature with the metric is a multiple of Ric, every full contraction a multiple
        of Scal. What stays cited is that an invariant law is built from contractions (Weyl) and that a conserved
        second-order law is linear in the curvature (Lovelock).
    (b) The premises are premises. That the law of gravity is a conserved law of this family is the structure
        `Premises` of Part X; that gravity reads the record is its field `reads_record`. Neither is proved.
        Part VII-b narrows P2: for the scalar field the conservation of the source is a theorem of the field's
        own equation, and a law equated to such a source is conserved. What P2 still assumes is that this holds
        for all matter, on every spacetime of four dimensions.
    (c) Part X-b computes what the forced law reads of a fluid in n dimensions. That the weak-field potentials
        are sourced by those readings is derived in a file of its own, SPHYS_WeakField_CC.lean, in coordinates.
    (d) The files in coordinates (the spherical solution, the waves, the weak field) take the Ricci curvature by
        its coordinate formula. That this formula is the frame contraction of Part VI written in a chart is the
        standard dictionary and is not formalised.

  NON-NEGOTIABLE. No axiom is declared. No headline theorem closes by `rfl`, by its own hypothesis, or over a
  structure that holds its conclusion as a field. The kernel line of each headline theorem is printed at the end.
-/
import Mathlib.RingTheory.Derivation.Lie
import Mathlib.Algebra.Lie.Basic
import Mathlib.Tactic.Abel
import Mathlib.Tactic.Module
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.Ring
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Tactic.NormNum

namespace SPHYS.Geometry

/-! ## Part I. Connections and curvature -/

/-- A torsion-free connection on a Lie ring of vector fields. -/
structure Connection (L : Type*) [LieRing L] where
  /-- The covariant derivative, additive in the direction and in the field. -/
  nabla : L →+ L →+ L
  /-- No torsion. -/
  torsion : ∀ X Y : L, nabla X Y - nabla Y X = ⁅X, Y⁆

variable {L : Type*} [LieRing L] (C : Connection L)

/-- The curvature of a connection. -/
def curv (X Y Z : L) : L :=
  C.nabla X (C.nabla Y Z) - C.nabla Y (C.nabla X Z) - C.nabla ⁅X, Y⁆ Z

/-- Curvature changes sign when its first two arguments are exchanged. -/
theorem curv_antisymm (X Y Z : L) : curv C X Y Z = - curv C Y X Z := by
  unfold curv
  have h : ⁅X, Y⁆ = -⁅Y, X⁆ := (lie_skew X Y).symm
  rw [h, map_neg, AddMonoidHom.neg_apply]
  abel

/-- Curvature is additive in its second argument, stated for a difference. -/
theorem curv_sub_mid (X A B Z : L) : curv C X (A - B) Z = curv C X A Z - curv C X B Z := by
  unfold curv
  simp only [map_sub, AddMonoidHom.sub_apply, lie_sub]
  abel

/-! ## Part II. The two identities -/

/-- THE FIRST BIANCHI IDENTITY. The cyclic sum of the curvature vanishes. -/
theorem first_bianchi (X Y Z : L) : curv C X Y Z + curv C Y Z X + curv C Z X Y = 0 := by
  have h1 : C.nabla X (C.nabla Y Z) - C.nabla X (C.nabla Z Y) = C.nabla X ⁅Y, Z⁆ := by
    rw [← map_sub, C.torsion]
  have h2 : C.nabla Y (C.nabla Z X) - C.nabla Y (C.nabla X Z) = C.nabla Y ⁅Z, X⁆ := by
    rw [← map_sub, C.torsion]
  have h3 : C.nabla Z (C.nabla X Y) - C.nabla Z (C.nabla Y X) = C.nabla Z ⁅X, Y⁆ := by
    rw [← map_sub, C.torsion]
  have k1 : C.nabla X ⁅Y, Z⁆ - C.nabla ⁅Y, Z⁆ X = ⁅X, ⁅Y, Z⁆⁆ := C.torsion _ _
  have k2 : C.nabla Y ⁅Z, X⁆ - C.nabla ⁅Z, X⁆ Y = ⁅Y, ⁅Z, X⁆⁆ := C.torsion _ _
  have k3 : C.nabla Z ⁅X, Y⁆ - C.nabla ⁅X, Y⁆ Z = ⁅Z, ⁅X, Y⁆⁆ := C.torsion _ _
  calc curv C X Y Z + curv C Y Z X + curv C Z X Y
      = (C.nabla X (C.nabla Y Z) - C.nabla X (C.nabla Z Y))
        + (C.nabla Y (C.nabla Z X) - C.nabla Y (C.nabla X Z))
        + (C.nabla Z (C.nabla X Y) - C.nabla Z (C.nabla Y X))
        - C.nabla ⁅X, Y⁆ Z - C.nabla ⁅Y, Z⁆ X - C.nabla ⁅Z, X⁆ Y := by unfold curv; abel
    _ = C.nabla X ⁅Y, Z⁆ + C.nabla Y ⁅Z, X⁆ + C.nabla Z ⁅X, Y⁆
        - C.nabla ⁅X, Y⁆ Z - C.nabla ⁅Y, Z⁆ X - C.nabla ⁅Z, X⁆ Y := by rw [h1, h2, h3]
    _ = (C.nabla X ⁅Y, Z⁆ - C.nabla ⁅Y, Z⁆ X) + (C.nabla Y ⁅Z, X⁆ - C.nabla ⁅Z, X⁆ Y)
        + (C.nabla Z ⁅X, Y⁆ - C.nabla ⁅X, Y⁆ Z) := by abel
    _ = ⁅X, ⁅Y, Z⁆⁆ + ⁅Y, ⁅Z, X⁆⁆ + ⁅Z, ⁅X, Y⁆⁆ := by rw [k1, k2, k3]
    _ = 0 := lie_jacobi X Y Z

/-- The covariant derivative of the curvature in the direction X. -/
def dcurv (X Y Z W : L) : L :=
  C.nabla X (curv C Y Z W) - curv C (C.nabla X Y) Z W - curv C Y (C.nabla X Z) W
    - curv C Y Z (C.nabla X W)

/-- THE SECOND BIANCHI IDENTITY. The cyclic sum of the covariant derivative of the curvature vanishes. -/
theorem second_bianchi (X Y Z W : L) :
    dcurv C X Y Z W + dcurv C Y Z X W + dcurv C Z X Y W = 0 := by
  -- the Jacobi identity, read through the connection
  have J : C.nabla ⁅X, ⁅Y, Z⁆⁆ W + C.nabla ⁅Y, ⁅Z, X⁆⁆ W + C.nabla ⁅Z, ⁅X, Y⁆⁆ W = 0 := by
    rw [← AddMonoidHom.add_apply, ← AddMonoidHom.add_apply, ← map_add, ← map_add, lie_jacobi,
      map_zero, AddMonoidHom.zero_apply]
  -- the triple derivatives cancel in the cyclic sum; what is left is curvature with a bracket or a derivative inside
  have key : dcurv C X Y Z W + dcurv C Y Z X W + dcurv C Z X Y W
        + (C.nabla ⁅X, ⁅Y, Z⁆⁆ W + C.nabla ⁅Y, ⁅Z, X⁆⁆ W + C.nabla ⁅Z, ⁅X, Y⁆⁆ W)
      = -(curv C X ⁅Y, Z⁆ W + curv C Y ⁅Z, X⁆ W + curv C Z ⁅X, Y⁆ W)
        - (curv C (C.nabla X Y) Z W + curv C Y (C.nabla X Z) W + curv C (C.nabla Y Z) X W
          + curv C Z (C.nabla Y X) W + curv C (C.nabla Z X) Y W + curv C X (C.nabla Z Y) W) := by
    unfold dcurv curv
    simp only [map_sub]
    abel
  rw [J, add_zero] at key
  rw [key, ← C.torsion Y Z, ← C.torsion Z X, ← C.torsion X Y, curv_sub_mid, curv_sub_mid, curv_sub_mid,
    curv_antisymm C (C.nabla Y Z) X, curv_antisymm C (C.nabla X Y) Z, curv_antisymm C (C.nabla Z X) Y]
  abel

/-! ## Part III. The hypotheses are not empty -/

section Inhabited
variable {𝔤 : Type*} [LieRing 𝔤] [LieAlgebra ℚ 𝔤]

/-- Half the bracket: a torsion-free connection on every Lie algebra over the rationals. -/
def halfBracket (𝔤 : Type*) [LieRing 𝔤] [LieAlgebra ℚ 𝔤] : Connection 𝔤 where
  nabla := AddMonoidHom.mk' (fun X => AddMonoidHom.mk' (fun Y => (1 / 2 : ℚ) • ⁅X, Y⁆)
      (fun a b => by
        show (1 / 2 : ℚ) • ⁅X, a + b⁆ = (1 / 2 : ℚ) • ⁅X, a⁆ + (1 / 2 : ℚ) • ⁅X, b⁆
        rw [lie_add, smul_add]))
    (fun a b => by
      ext Y
      show (1 / 2 : ℚ) • ⁅a + b, Y⁆ = (1 / 2 : ℚ) • ⁅a, Y⁆ + (1 / 2 : ℚ) • ⁅b, Y⁆
      rw [add_lie, smul_add])
  torsion := fun X Y => by
    show (1 / 2 : ℚ) • ⁅X, Y⁆ - (1 / 2 : ℚ) • ⁅Y, X⁆ = ⁅X, Y⁆
    have h : ⁅Y, X⁆ = -⁅X, Y⁆ := (lie_skew Y X).symm
    rw [h, smul_neg, sub_neg_eq_add, ← add_smul]
    norm_num

theorem halfBracket_apply (X Y : 𝔤) : (halfBracket 𝔤).nabla X Y = (1 / 2 : ℚ) • ⁅X, Y⁆ := rfl

/-- Its curvature is minus a quarter of the double bracket. -/
theorem halfBracket_curv (X Y Z : 𝔤) :
    curv (halfBracket 𝔤) X Y Z = (-(1 / 4) : ℚ) • ⁅⁅X, Y⁆, Z⁆ := by
  unfold curv
  simp only [halfBracket_apply, lie_smul]
  have hj : ⁅⁅X, Y⁆, Z⁆ = ⁅X, ⁅Y, Z⁆⁆ - ⁅Y, ⁅X, Z⁆⁆ := by rw [lie_lie]
  rw [hj, smul_smul, smul_smul]
  module

end Inhabited

/-! ## Part IV. The vector fields of a commutative algebra -/

section VectorFields
variable {𝕜 A : Type*} [CommRing 𝕜] [CommRing A] [Algebra 𝕜 A]

/-- The first Bianchi identity for the derivations of any commutative algebra. -/
theorem first_bianchi_of_vector_fields (C : Connection (Derivation 𝕜 A A)) (X Y Z : Derivation 𝕜 A A) :
    curv C X Y Z + curv C Y Z X + curv C Z X Y = 0 := first_bianchi C X Y Z

/-- The second Bianchi identity for the derivations of any commutative algebra. -/
theorem second_bianchi_of_vector_fields (C : Connection (Derivation 𝕜 A A)) (X Y Z W : Derivation 𝕜 A A) :
    dcurv C X Y Z W + dcurv C Y Z X W + dcurv C Z X Y W = 0 := second_bianchi C X Y Z W

end VectorFields


/-! ## Part V. Functions, a metric, and the linearity of curvature
    A geometry in the form of Lie and Rinehart: a commutative ring A of functions, a Lie ring L of vector fields that
    is a module over A, the action of a field on a function, a torsion-free connection that obeys the Leibniz rule,
    and a metric the connection preserves. Every field below is part of the definition of one of those objects.
    No field is an identity of curvature. -/

structure Geom (A : Type*) [CommRing A] (L : Type*) [LieRing L] [Module A L] where
  /-- A vector field differentiates a function. -/
  act : L → A → A
  act_add : ∀ (X : L) (f h : A), act X (f + h) = act X f + act X h
  act_mul : ∀ (X : L) (f h : A), act X (f * h) = act X f * h + f * act X h
  add_act : ∀ (X Y : L) (f : A), act (X + Y) f = act X f + act Y f
  smul_act : ∀ (f : A) (X : L) (h : A), act (f • X) h = f * act X h
  /-- The bracket acts as the commutator. -/
  lie_act : ∀ (X Y : L) (f : A), act ⁅X, Y⁆ f = act X (act Y f) - act Y (act X f)
  /-- The bracket and multiplication by a function. -/
  bracket_smul : ∀ (X : L) (f : A) (Y : L), ⁅X, f • Y⁆ = act X f • Y + f • ⁅X, Y⁆
  /-- A torsion-free connection. -/
  conn : Connection L
  nabla_smul : ∀ (f : A) (X Y : L), conn.nabla (f • X) Y = f • conn.nabla X Y
  /-- The Leibniz rule. -/
  nabla_leib : ∀ (X : L) (f : A) (Y : L), conn.nabla X (f • Y) = act X f • Y + f • conn.nabla X Y
  /-- The metric. -/
  g : L → L → A
  g_symm : ∀ (X Y : L), g X Y = g Y X
  g_add : ∀ (X Y Z : L), g (X + Y) Z = g X Z + g Y Z
  g_smul : ∀ (f : A) (X Z : L), g (f • X) Z = f * g X Z
  /-- The connection preserves the metric. -/
  compat : ∀ (X Y Z : L), act X (g Y Z) = g (conn.nabla X Y) Z + g Y (conn.nabla X Z)

section Geometry
variable {A : Type*} [CommRing A] {L : Type*} [LieRing L] [Module A L] (G : Geom A L)

theorem act_zero (X : L) : G.act X 0 = 0 := by
  have h := G.act_add X 0 0
  rw [add_zero] at h
  linear_combination -h

theorem act_one (X : L) : G.act X 1 = 0 := by
  have h := G.act_mul X 1 1
  simp only [mul_one, one_mul] at h
  linear_combination -h

theorem act_neg (X : L) (f : A) : G.act X (-f) = - G.act X f := by
  have h := G.act_add X f (-f)
  rw [add_neg_cancel, act_zero] at h
  linear_combination -h

theorem act_sub (X : L) (f h : A) : G.act X (f - h) = G.act X f - G.act X h := by
  rw [sub_eq_add_neg, G.act_add, act_neg]; ring

theorem g_neg_left (X Z : L) : G.g (-X) Z = - G.g X Z := by
  have h := G.g_smul (-1) X Z
  rw [neg_one_smul] at h
  rw [h]; ring

theorem g_zero_left (Z : L) : G.g 0 Z = 0 := by
  have h := G.g_smul 0 (0 : L) Z
  rw [zero_smul, zero_mul] at h
  exact h

theorem g_sub_left (X Y Z : L) : G.g (X - Y) Z = G.g X Z - G.g Y Z := by
  rw [sub_eq_add_neg, G.g_add, g_neg_left]; ring

theorem g_add_right (X Y Z : L) : G.g X (Y + Z) = G.g X Y + G.g X Z := by
  rw [G.g_symm, G.g_add, G.g_symm Y, G.g_symm Z]

theorem g_smul_right (f : A) (X Z : L) : G.g X (f • Z) = f * G.g X Z := by
  rw [G.g_symm, G.g_smul, G.g_symm]

theorem smul_bracket (f : A) (X Y : L) : ⁅f • X, Y⁆ = f • ⁅X, Y⁆ - G.act Y f • X := by
  have h := G.bracket_smul Y f X
  calc ⁅f • X, Y⁆ = -⁅Y, f • X⁆ := (lie_skew _ _).symm
    _ = -(G.act Y f • X + f • ⁅Y, X⁆) := by rw [h]
    _ = f • ⁅X, Y⁆ - G.act Y f • X := by rw [← lie_skew X Y]; module

/-- Curvature is additive in each of its three arguments. -/
theorem curv_add_left (X X' Y Z : L) :
    curv G.conn (X + X') Y Z = curv G.conn X Y Z + curv G.conn X' Y Z := by
  unfold curv; simp only [map_add, AddMonoidHom.add_apply, add_lie]; abel

theorem curv_add_mid (X Y Y' Z : L) :
    curv G.conn X (Y + Y') Z = curv G.conn X Y Z + curv G.conn X Y' Z := by
  unfold curv; simp only [map_add, AddMonoidHom.add_apply, lie_add]; abel

theorem curv_add_right (X Y Z Z' : L) :
    curv G.conn X Y (Z + Z') = curv G.conn X Y Z + curv G.conn X Y Z' := by
  unfold curv; simp only [map_add]; abel

/-- CURVATURE IS A TENSOR: it is linear over functions in each argument. This is proved, from the Leibniz rule and
    from the bracket acting as the commutator. -/
theorem curv_smul_left (f : A) (X Y Z : L) : curv G.conn (f • X) Y Z = f • curv G.conn X Y Z := by
  unfold curv
  simp only [smul_bracket G, map_sub, AddMonoidHom.sub_apply, G.nabla_smul, G.nabla_leib]
  module

theorem curv_smul_mid (f : A) (X Y Z : L) : curv G.conn X (f • Y) Z = f • curv G.conn X Y Z := by
  rw [curv_antisymm, curv_smul_left, curv_antisymm G.conn Y X Z]
  module

theorem curv_smul_right (f : A) (X Y Z : L) : curv G.conn X Y (f • Z) = f • curv G.conn X Y Z := by
  unfold curv
  simp only [G.nabla_leib, map_add, G.lie_act]
  module

/-- The curvature with its last index lowered. -/
def Rm (X Y Z W : L) : A := G.g (curv G.conn X Y Z) W

theorem Rm_antisymm12 (X Y Z W : L) : Rm G X Y Z W = - Rm G Y X Z W := by
  unfold Rm; rw [curv_antisymm, g_neg_left]

/-- THE LOWERED CURVATURE IS ANTISYMMETRIC IN ITS LAST PAIR. From the metric being preserved; no division. -/
theorem Rm_antisymm34 (X Y Z W : L) : Rm G X Y Z W + Rm G X Y W Z = 0 := by
  unfold Rm curv
  simp only [g_sub_left]
  have c1 := G.compat X (G.conn.nabla Y Z) W
  have c2 := G.compat X (G.conn.nabla Y W) Z
  have c3 := G.compat Y (G.conn.nabla X Z) W
  have c4 := G.compat Y (G.conn.nabla X W) Z
  have c5 := G.compat ⁅X, Y⁆ Z W
  have s5 := G.g_symm Z (G.conn.nabla ⁅X, Y⁆ W)
  have t1 := G.g_symm (G.conn.nabla Y Z) (G.conn.nabla X W)
  have t2 := G.g_symm (G.conn.nabla Y W) (G.conn.nabla X Z)
  have la := G.lie_act X Y (G.g Z W)
  have h6 : G.act Y (G.g Z W) = G.g (G.conn.nabla Y Z) W + G.g (G.conn.nabla Y W) Z := by
    rw [G.compat, G.g_symm Z]
  have h7 : G.act X (G.g Z W) = G.g (G.conn.nabla X Z) W + G.g (G.conn.nabla X W) Z := by
    rw [G.compat, G.g_symm Z]
  have d6 : G.act X (G.act Y (G.g Z W))
      = G.act X (G.g (G.conn.nabla Y Z) W) + G.act X (G.g (G.conn.nabla Y W) Z) := by rw [h6, G.act_add]
  have d7 : G.act Y (G.act X (G.g Z W))
      = G.act Y (G.g (G.conn.nabla X Z) W) + G.act Y (G.g (G.conn.nabla X W) Z) := by rw [h7, G.act_add]
  linear_combination (-c1) - c2 + c3 + c4 + c5 + s5 - t1 - t2 - la - d6 + d7

/-- The covariant derivative of the lowered curvature. -/
def dRm (X Y Z W V : L) : A :=
  G.act X (Rm G Y Z W V) - Rm G (G.conn.nabla X Y) Z W V - Rm G Y (G.conn.nabla X Z) W V
    - Rm G Y Z (G.conn.nabla X W) V - Rm G Y Z W (G.conn.nabla X V)

theorem dRm_eq (X Y Z W V : L) : dRm G X Y Z W V = G.g (dcurv G.conn X Y Z W) V := by
  unfold dRm Rm dcurv
  simp only [g_sub_left]
  have c := G.compat X (curv G.conn Y Z W) V
  linear_combination c

/-- THE SECOND BIANCHI IDENTITY for the lowered curvature. -/
theorem second_bianchi_Rm (X Y Z W V : L) :
    dRm G X Y Z W V + dRm G Y Z X W V + dRm G Z X Y W V = 0 := by
  rw [dRm_eq, dRm_eq, dRm_eq, ← G.g_add, ← G.g_add, second_bianchi, g_zero_left]

end Geometry


/-! ## Part VI. A frame, the Ricci curvature, and the contracted identity
    An orthonormal frame: finitely many fields, orthogonal, each of square plus or minus one, in which every field
    expands. The fields of `Frame` say that and nothing about curvature. -/

section Contracted
variable {A : Type*} [CommRing A] {L : Type*} [LieRing L] [Module A L] (G : Geom A L)
variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- The sign plus one or minus one, as a function. -/
def sgn (A : Type*) [CommRing A] (b : Bool) : A := if b then 1 else -1

structure Frame (G : Geom A L) (ι : Type*) [Fintype ι] [DecidableEq ι] where
  e : ι → L
  pos : ι → Bool
  ortho : ∀ i j, G.g (e i) (e j) = if i = j then sgn A (pos i) else 0
  complete : ∀ X : L, X = ∑ i, (sgn A (pos i) * G.g X (e i)) • e i

variable (F : Frame G ι)

/-- The sign of the i-th field of the frame. -/
def Frame.eps {G : Geom A L} (F : Frame G ι) (i : ι) : A := sgn A (F.pos i)

theorem act_eps (X : L) (i : ι) : G.act X (F.eps i) = 0 := by
  unfold Frame.eps sgn
  split
  · exact act_one G X
  · rw [act_neg, act_one, neg_zero]

theorem act_eps_mul (X : L) (i : ι) (f : A) : G.act X (F.eps i * f) = F.eps i * G.act X f := by
  rw [G.act_mul, act_eps, zero_mul, zero_add]

omit [Fintype ι] in
theorem act_sum (X : L) (s : Finset ι) (f : ι → A) : G.act X (∑ i ∈ s, f i) = ∑ i ∈ s, G.act X (f i) := by
  classical
  refine Finset.induction_on s ?_ ?_
  · rw [Finset.sum_empty, Finset.sum_empty]; exact act_zero G X
  · intro a s ha ih
    rw [Finset.sum_insert ha, Finset.sum_insert ha, G.act_add, ih]

/-- A form in two fields that is linear over functions in each. -/
structure IsBilin (B : L → L → A) : Prop where
  add_left : ∀ U U' V, B (U + U') V = B U V + B U' V
  smul_left : ∀ (f : A) U V, B (f • U) V = f * B U V
  add_right : ∀ U V V', B U (V + V') = B U V + B U V'
  smul_right : ∀ (f : A) U V, B U (f • V) = f * B U V

omit [Fintype ι] in
theorem IsBilin.sum_left {B : L → L → A} (hB : IsBilin B) (s : Finset ι) (c : ι → A) (v : ι → L) (W : L) :
    B (∑ i ∈ s, c i • v i) W = ∑ i ∈ s, c i * B (v i) W := by
  classical
  refine Finset.induction_on s ?_ ?_
  · rw [Finset.sum_empty, Finset.sum_empty]
    have h := hB.smul_left 0 (0 : L) W
    rw [zero_smul, zero_mul] at h
    exact h
  · intro a s ha ih
    rw [Finset.sum_insert ha, Finset.sum_insert ha, hB.add_left, hB.smul_left, ih]

omit [Fintype ι] in
theorem IsBilin.sum_right {B : L → L → A} (hB : IsBilin B) (s : Finset ι) (c : ι → A) (v : ι → L) (W : L) :
    B W (∑ i ∈ s, c i • v i) = ∑ i ∈ s, c i * B W (v i) := by
  classical
  refine Finset.induction_on s ?_ ?_
  · rw [Finset.sum_empty, Finset.sum_empty]
    have h := hB.smul_right 0 W (0 : L)
    rw [zero_smul, zero_mul] at h
    exact h
  · intro a s ha ih
    rw [Finset.sum_insert ha, Finset.sum_insert ha, hB.add_right, hB.smul_right, ih]

/-- The connection turns the frame by an antisymmetric array: the metric is preserved and the frame's squares are
    constants. -/
theorem frame_turn_antisymm (X : L) (a c : ι) :
    G.g (G.conn.nabla X (F.e a)) (F.e c) + G.g (G.conn.nabla X (F.e c)) (F.e a) = 0 := by
  have h := G.compat X (F.e a) (F.e c)
  have h0 : G.act X (G.g (F.e a) (F.e c)) = 0 := by
    rw [F.ortho]
    split
    · exact act_eps G F X a
    · exact act_zero G X
  rw [h0, G.g_symm (F.e a) (G.conn.nabla X (F.e c))] at h
  linear_combination -h

/-- A TRACE COMMUTES WITH THE COVARIANT DERIVATIVE. For every bilinear form, the terms in which the derivative falls
    on the frame cancel in the trace. -/
theorem trace_commute {B : L → L → A} (hB : IsBilin B) (X : L) :
    ∑ a, F.eps a * (B (G.conn.nabla X (F.e a)) (F.e a) + B (F.e a) (G.conn.nabla X (F.e a))) = 0 := by
  have h1 : ∀ a, B (G.conn.nabla X (F.e a)) (F.e a)
      = ∑ c, (F.eps c * G.g (G.conn.nabla X (F.e a)) (F.e c)) * B (F.e c) (F.e a) := by
    intro a
    have hx := F.complete (G.conn.nabla X (F.e a))
    calc B (G.conn.nabla X (F.e a)) (F.e a)
        = B (∑ c, (sgn A (F.pos c) * G.g (G.conn.nabla X (F.e a)) (F.e c)) • F.e c) (F.e a) := by rw [← hx]
      _ = _ := hB.sum_left _ _ _ _
  have h2 : ∀ a, B (F.e a) (G.conn.nabla X (F.e a))
      = ∑ c, (F.eps c * G.g (G.conn.nabla X (F.e a)) (F.e c)) * B (F.e a) (F.e c) := by
    intro a
    have hx := F.complete (G.conn.nabla X (F.e a))
    calc B (F.e a) (G.conn.nabla X (F.e a))
        = B (F.e a) (∑ c, (sgn A (F.pos c) * G.g (G.conn.nabla X (F.e a)) (F.e c)) • F.e c) := by rw [← hx]
      _ = _ := hB.sum_right _ _ _ _
  have step : ∑ a, F.eps a * (B (G.conn.nabla X (F.e a)) (F.e a) + B (F.e a) (G.conn.nabla X (F.e a)))
      = (∑ a, ∑ c, F.eps a * (F.eps c * G.g (G.conn.nabla X (F.e a)) (F.e c) * B (F.e c) (F.e a)))
        + ∑ a, ∑ c, F.eps a * (F.eps c * G.g (G.conn.nabla X (F.e a)) (F.e c) * B (F.e a) (F.e c)) := by
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro a _
    rw [h1 a, h2 a, mul_add, Finset.mul_sum, Finset.mul_sum]
  rw [step, Finset.sum_comm, ← Finset.sum_add_distrib]
  apply Finset.sum_eq_zero
  intro a _
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_eq_zero
  intro c _
  have h := frame_turn_antisymm G F X a c
  linear_combination (F.eps a * F.eps c * B (F.e a) (F.e c)) * h

/-- The Ricci curvature: the trace of the curvature over its first and last arguments. -/
def Ric (Y Z : L) : A := ∑ i, F.eps i * Rm G (F.e i) Y Z (F.e i)

/-- The scalar curvature: the trace of the Ricci curvature. -/
def Scal : A := ∑ j, F.eps j * Ric G F (F.e j) (F.e j)

theorem Rm_bilin_outer (Y Z : L) : IsBilin (fun U V => Rm G U Y Z V) where
  add_left := fun U U' V => by show Rm G (U + U') Y Z V = _; unfold Rm; rw [curv_add_left, G.g_add]
  smul_left := fun f U V => by show Rm G (f • U) Y Z V = _; unfold Rm; rw [curv_smul_left, G.g_smul]
  add_right := fun U V V' => by show Rm G U Y Z (V + V') = _; unfold Rm; rw [g_add_right]
  smul_right := fun f U V => by show Rm G U Y Z (f • V) = _; unfold Rm; rw [g_smul_right]

theorem Ric_bilin : IsBilin (Ric G F) where
  add_left := fun U U' V => by
    unfold Ric Rm
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro i _
    rw [curv_add_mid, G.g_add]; ring
  smul_left := fun f U V => by
    unfold Ric Rm
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro i _
    rw [curv_smul_mid, G.g_smul]; ring
  add_right := fun U V V' => by
    unfold Ric Rm
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro i _
    rw [curv_add_right, G.g_add]; ring
  smul_right := fun f U V => by
    unfold Ric Rm
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro i _
    rw [curv_smul_right, G.g_smul]; ring

/-- The covariant derivative of the Ricci curvature. -/
def dRic (X Y Z : L) : A :=
  G.act X (Ric G F Y Z) - Ric G F (G.conn.nabla X Y) Z - Ric G F Y (G.conn.nabla X Z)

/-- The derivative of the trace is the trace of the derivative. -/
theorem dRic_eq (X Y Z : L) : dRic G F X Y Z = ∑ b, F.eps b * dRm G X (F.e b) Y Z (F.e b) := by
  have tc := trace_commute G F (Rm_bilin_outer G Y Z) X
  simp only [mul_add, Finset.sum_add_distrib] at tc
  unfold dRic Ric dRm
  rw [act_sum]
  simp only [act_eps_mul, mul_sub, Finset.sum_sub_distrib]
  linear_combination tc

/-- The derivative of the scalar curvature is the trace of the derivative of the Ricci curvature. -/
theorem dScal_eq (Z : L) : ∑ a, F.eps a * dRic G F Z (F.e a) (F.e a) = G.act Z (Scal G F) := by
  have tc := trace_commute G F (Ric_bilin G F) Z
  simp only [mul_add, Finset.sum_add_distrib] at tc
  unfold Scal dRic
  rw [act_sum]
  simp only [act_eps_mul, mul_sub, Finset.sum_sub_distrib]
  linear_combination -tc

theorem dRm_antisymm12 (X Y Z W V : L) : dRm G X Y Z W V = - dRm G X Z Y W V := by
  unfold dRm
  rw [Rm_antisymm12 G Y Z W V, Rm_antisymm12 G (G.conn.nabla X Y) Z W V, Rm_antisymm12 G Y (G.conn.nabla X Z) W V,
    Rm_antisymm12 G Y Z (G.conn.nabla X W) V, Rm_antisymm12 G Y Z W (G.conn.nabla X V), act_neg]
  ring

theorem dRm_antisymm34 (X Y Z W V : L) : dRm G X Y Z W V + dRm G X Y Z V W = 0 := by
  unfold dRm
  have h := Rm_antisymm34 G Y Z W V
  have hA : G.act X (Rm G Y Z W V) + G.act X (Rm G Y Z V W) = 0 := by rw [← G.act_add, h, act_zero]
  have k1 := Rm_antisymm34 G (G.conn.nabla X Y) Z W V
  have k2 := Rm_antisymm34 G Y (G.conn.nabla X Z) W V
  have k3 := Rm_antisymm34 G Y Z (G.conn.nabla X W) V
  have k4 := Rm_antisymm34 G Y Z W (G.conn.nabla X V)
  linear_combination hA - k1 - k2 - k3 - k4

/-- The divergence of the Ricci curvature. -/
def divRic (Z : L) : A := ∑ a, F.eps a * dRic G F (F.e a) Z (F.e a)

/-- THE CONTRACTED BIANCHI IDENTITY. Twice the divergence of the Ricci curvature is the derivative of the scalar
    curvature. Proved from the second Bianchi identity by two traces; no division. -/
theorem contracted_bianchi (Z : L) : 2 * divRic G F Z = G.act Z (Scal G F) := by
  have sb : ∀ a b, dRm G (F.e a) (F.e b) Z (F.e a) (F.e b) + dRm G (F.e b) Z (F.e a) (F.e a) (F.e b)
      + dRm G Z (F.e a) (F.e b) (F.e a) (F.e b) = 0 := fun a b => second_bianchi_Rm G _ _ _ _ _
  have H0 : (∑ a, ∑ b, F.eps a * F.eps b * dRm G (F.e a) (F.e b) Z (F.e a) (F.e b))
      + (∑ a, ∑ b, F.eps a * F.eps b * dRm G (F.e b) Z (F.e a) (F.e a) (F.e b))
      + (∑ a, ∑ b, F.eps a * F.eps b * dRm G Z (F.e a) (F.e b) (F.e a) (F.e b)) = 0 := by
    rw [← Finset.sum_add_distrib, ← Finset.sum_add_distrib]
    apply Finset.sum_eq_zero
    intro a _
    rw [← Finset.sum_add_distrib, ← Finset.sum_add_distrib]
    apply Finset.sum_eq_zero
    intro b _
    rw [← mul_add, ← mul_add, sb a b, mul_zero]
  have E1 : (∑ a, ∑ b, F.eps a * F.eps b * dRm G (F.e a) (F.e b) Z (F.e a) (F.e b)) = divRic G F Z := by
    unfold divRic
    apply Finset.sum_congr rfl
    intro a _
    rw [dRic_eq, Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro b _
    ring
  have E2 : (∑ a, ∑ b, F.eps a * F.eps b * dRm G (F.e b) Z (F.e a) (F.e a) (F.e b)) = divRic G F Z := by
    rw [Finset.sum_comm]
    unfold divRic
    apply Finset.sum_congr rfl
    intro b _
    rw [dRic_eq, Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro a _
    have h1 := dRm_antisymm12 G (F.e b) Z (F.e a) (F.e a) (F.e b)
    have h2 := dRm_antisymm34 G (F.e b) (F.e a) Z (F.e a) (F.e b)
    linear_combination (F.eps a * F.eps b) * h1 - (F.eps a * F.eps b) * h2
  have E3 : (∑ a, ∑ b, F.eps a * F.eps b * dRm G Z (F.e a) (F.e b) (F.e a) (F.e b))
      = - G.act Z (Scal G F) := by
    rw [← dScal_eq, ← Finset.sum_neg_distrib]
    apply Finset.sum_congr rfl
    intro a _
    rw [dRic_eq, Finset.mul_sum, ← Finset.sum_neg_distrib]
    apply Finset.sum_congr rfl
    intro b _
    have h1 := dRm_antisymm12 G Z (F.e a) (F.e b) (F.e a) (F.e b)
    linear_combination (F.eps a * F.eps b) * h1
  rw [E1, E2, E3] at H0
  linear_combination H0

end Contracted

/-! ## Part VI-b. Every contraction of the curvature is the Ricci curvature, or the scalar, or nothing

RATIONALE. The law is taken in the family a Ric + b Scal g + c g. That every conserved second-order law lies in the
family is Lovelock's theorem, cited. This part proves the piece of it that is plain algebra: a symmetric law made by
contracting the curvature with the metric can only be a multiple of Ric, and a scalar made by contracting it fully
can only be a multiple of Scal. There is nothing else to build a law from.
DESIGN. The four slots of the curvature can be paired in six ways; each is computed. The pair symmetry of the
curvature is derived from the first Bianchi identity and the two antisymmetries by one explicit combination.
RISK. That every invariant linear law is a combination of contractions is Weyl's first fundamental theorem for the
orthogonal group, cited and not proved here. The pair symmetry needs a ring in which 2 x = 0 gives x = 0. -/
section Contractions
variable {A : Type*} [CommRing A] {L : Type*} [LieRing L] [Module A L] (G : Geom A L)
variable {ι : Type*} [Fintype ι] [DecidableEq ι] (F : Frame G ι)

/-- The first Bianchi identity, with all four slots. -/
theorem Rm_bianchi (X Y Z W : L) : Rm G X Y Z W + Rm G Y Z X W + Rm G Z X Y W = 0 := by
  unfold Rm
  rw [← G.g_add, ← G.g_add, first_bianchi, g_zero_left]

/-- Twice the pair symmetry: an explicit combination of the Bianchi identity and the two antisymmetries. -/
theorem two_pair_symm (X Y Z W : L) : 2 * Rm G X Y Z W = 2 * Rm G Z W X Y := by
  linear_combination
    Rm_antisymm34 G X Y Z W + Rm_bianchi G X Y Z W - Rm_bianchi G X Y W Z - Rm_antisymm12 G X Z Y W
    + Rm_antisymm34 G X Z Y W - Rm_bianchi G X Z W Y + Rm_antisymm12 G X W Y Z - Rm_antisymm34 G X W Y Z
    + Rm_antisymm12 G X W Z Y - Rm_antisymm34 G Y Z X W + Rm_bianchi G Y Z W X + Rm_antisymm34 G Y W X Z
    - Rm_antisymm12 G Y W Z X - Rm_antisymm34 G Z W X Y

/-- A ring with no 2-torsion. -/
def NoTwoTorsion (A : Type*) [CommRing A] : Prop := ∀ x : A, 2 * x = 0 → x = 0

/-- THE PAIR SYMMETRY OF THE CURVATURE. -/
theorem pair_symm (h2 : NoTwoTorsion A) (X Y Z W : L) : Rm G X Y Z W = Rm G Z W X Y := by
  have h := two_pair_symm G X Y Z W
  have : 2 * (Rm G X Y Z W - Rm G Z W X Y) = 0 := by linear_combination h
  exact sub_eq_zero.mp (h2 _ this)

/-- The Ricci curvature is symmetric. -/
theorem Ric_symm (h2 : NoTwoTorsion A) (Y Z : L) : Ric G F Y Z = Ric G F Z Y := by
  unfold Ric
  apply Finset.sum_congr rfl
  intro i _
  have p := pair_symm G h2 (F.e i) Y Z (F.e i)
  have a := Rm_antisymm12 G Z (F.e i) (F.e i) Y
  have b := Rm_antisymm34 G (F.e i) Z (F.e i) Y
  rw [p, a]
  linear_combination -(F.eps i) * b

/-- Slots one and two: nothing. -/
theorem contract_12 (Y Z : L) : ∑ i, F.eps i * Rm G (F.e i) (F.e i) Y Z = 0 := by
  apply Finset.sum_eq_zero
  intro i _
  have h : curv G.conn (F.e i) (F.e i) Y = 0 := by
    unfold curv
    rw [lie_self, map_zero]
    simp
  unfold Rm
  rw [h, g_zero_left, mul_zero]

/-- Slots three and four: nothing. -/
theorem contract_34 (h2 : NoTwoTorsion A) (Y Z : L) : ∑ i, F.eps i * Rm G Y Z (F.e i) (F.e i) = 0 := by
  apply Finset.sum_eq_zero
  intro i _
  have a := Rm_antisymm34 G Y Z (F.e i) (F.e i)
  have : Rm G Y Z (F.e i) (F.e i) = 0 := h2 _ (by linear_combination a)
  rw [this, mul_zero]

/-- Slots one and four: the Ricci curvature, by definition. -/
theorem contract_14 (Y Z : L) : ∑ i, F.eps i * Rm G (F.e i) Y Z (F.e i) = Ric G F Y Z := rfl

/-- Slots one and three: minus the Ricci curvature. -/
theorem contract_13 (Y Z : L) : ∑ i, F.eps i * Rm G (F.e i) Y (F.e i) Z = - Ric G F Y Z := by
  unfold Ric
  rw [← Finset.sum_neg_distrib]
  apply Finset.sum_congr rfl
  intro i _
  linear_combination F.eps i * Rm_antisymm34 G (F.e i) Y (F.e i) Z

/-- Slots two and four: minus the Ricci curvature. -/
theorem contract_24 (Y Z : L) : ∑ i, F.eps i * Rm G Y (F.e i) Z (F.e i) = - Ric G F Y Z := by
  unfold Ric
  rw [← Finset.sum_neg_distrib]
  apply Finset.sum_congr rfl
  intro i _
  linear_combination F.eps i * Rm_antisymm12 G Y (F.e i) Z (F.e i)

/-- Slots two and three: the Ricci curvature. -/
theorem contract_23 (Y Z : L) : ∑ i, F.eps i * Rm G Y (F.e i) (F.e i) Z = Ric G F Y Z := by
  unfold Ric
  apply Finset.sum_congr rfl
  intro i _
  linear_combination F.eps i * Rm_antisymm12 G Y (F.e i) (F.e i) Z - F.eps i * Rm_antisymm34 G (F.e i) Y (F.e i) Z

/-- THE FULL CONTRACTIONS. Pairing the slots (14)(23) gives the scalar curvature, (13)(24) gives minus it, and
(12)(34) gives nothing. -/
theorem full_contract_14_23 : ∑ j, F.eps j * ∑ i, F.eps i * Rm G (F.e i) (F.e j) (F.e j) (F.e i) = Scal G F := rfl

theorem full_contract_13_24 : ∑ j, F.eps j * ∑ i, F.eps i * Rm G (F.e i) (F.e j) (F.e i) (F.e j) = - Scal G F := by
  unfold Scal
  rw [← Finset.sum_neg_distrib]
  apply Finset.sum_congr rfl
  intro j _
  rw [contract_13]
  ring

theorem full_contract_12_34 : ∑ j, F.eps j * ∑ i, F.eps i * Rm G (F.e i) (F.e i) (F.e j) (F.e j) = 0 := by
  apply Finset.sum_eq_zero
  intro j _
  rw [contract_12, mul_zero]
end Contractions


/-! ## Part VII. The family of laws, and what conservation forces
    The family a·Ric + b·Scal·g + c·g, with a, b and c constants. Its divergence is computed, and conservation on a
    geometry whose scalar curvature is not constant forces a + 2b = 0. The term in c is free. -/

section Forcing
variable {A : Type*} [CommRing A] {L : Type*} [LieRing L] [Module A L] (G : Geom A L)
variable {ι : Type*} [Fintype ι] [DecidableEq ι] (F : Frame G ι)

/-- A constant: a function every field differentiates to zero. -/
def Const (c : A) : Prop := ∀ X : L, G.act X c = 0

theorem const_one : Const G (1 : A) := fun X => act_one G X

theorem const_add {a b : A} (ha : Const G a) (hb : Const G b) : Const G (a + b) := fun X => by
  rw [G.act_add, ha X, hb X, add_zero]

theorem const_neg {a : A} (ha : Const G a) : Const G (-a) := fun X => by
  rw [act_neg, ha X, neg_zero]

omit [Fintype ι] in
theorem act_sum_field (s : Finset ι) (c : ι → A) (v : ι → L) (f : A) :
    G.act (∑ i ∈ s, c i • v i) f = ∑ i ∈ s, c i * G.act (v i) f := by
  classical
  refine Finset.induction_on s ?_ ?_
  · rw [Finset.sum_empty, Finset.sum_empty]
    have h := G.smul_act 0 (0 : L) f
    rw [zero_smul, zero_mul] at h
    exact h
  · intro a s ha ih
    rw [Finset.sum_insert ha, Finset.sum_insert ha, G.add_act, G.smul_act, ih]

/-- A field differentiates a function through its components in the frame. -/
theorem act_in_frame (Z : L) (f : A) :
    G.act Z f = ∑ i, (F.eps i * G.g Z (F.e i)) * G.act (F.e i) f := by
  calc G.act Z f = G.act (∑ i, (sgn A (F.pos i) * G.g Z (F.e i)) • F.e i) f := by rw [← F.complete Z]
    _ = _ := act_sum_field G _ _ _ _

/-- The law with coefficients a, b, c. -/
def Law (a b c : A) (Y Z : L) : A := a * Ric G F Y Z + b * (Scal G F * G.g Y Z) + c * G.g Y Z

/-- Its covariant derivative. -/
def dLaw (a b c : A) (X Y Z : L) : A :=
  G.act X (Law G F a b c Y Z) - Law G F a b c (G.conn.nabla X Y) Z - Law G F a b c Y (G.conn.nabla X Z)

/-- Its divergence. -/
def divLaw (a b c : A) (Z : L) : A := ∑ i, F.eps i * dLaw G F a b c (F.e i) Z (F.e i)

theorem dLaw_eq {a b c : A} (ha : Const G a) (hb : Const G b) (hc : Const G c) (X Y Z : L) :
    dLaw G F a b c X Y Z = a * dRic G F X Y Z + b * (G.act X (Scal G F) * G.g Y Z) := by
  unfold dLaw Law dRic
  simp only [G.act_add, G.act_mul, ha X, hb X, hc X]
  have cp := G.compat X Y Z
  linear_combination (b * Scal G F + c) * cp

/-- THE DIVERGENCE OF THE FAMILY. Twice the divergence of the law is (a + 2b) times the derivative of the scalar
    curvature. The term in c does not appear. -/
theorem twice_div_law {a b c : A} (ha : Const G a) (hb : Const G b) (hc : Const G c) (Z : L) :
    2 * divLaw G F a b c Z = (a + 2 * b) * G.act Z (Scal G F) := by
  have cb := contracted_bianchi G F Z
  have hsum : divLaw G F a b c Z = a * divRic G F Z + b * G.act Z (Scal G F) := by
    unfold divLaw divRic
    rw [act_in_frame G F Z (Scal G F), Finset.mul_sum, Finset.mul_sum, ← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro i _
    rw [dLaw_eq G F ha hb hc, G.g_symm Z (F.e i)]
    ring
  rw [hsum]
  linear_combination a * cb

/-- CONSERVATION FORCES THE RATIO. On a geometry where the scalar curvature is not constant in some direction, a law
    of the family whose divergence vanishes has a + 2b = 0. -/
theorem conservation_forces_the_ratio [NoZeroDivisors A] {a b c : A}
    (ha : Const G a) (hb : Const G b) (hc : Const G c)
    (hcons : ∀ Z : L, divLaw G F a b c Z = 0) (Z₀ : L) (hne : G.act Z₀ (Scal G F) ≠ 0) :
    a + 2 * b = 0 := by
  have h := twice_div_law G F ha hb hc Z₀
  rw [hcons Z₀, mul_zero] at h
  rcases mul_eq_zero.mp h.symm with h0 | h0
  · exact h0
  · exact absurd h0 hne

/-- AND THE FORCED LAW IS CONSERVED, with the term in c free: where a + 2b = 0, twice the divergence vanishes on
    every geometry and in every direction. -/
theorem the_forced_law_is_conserved {a b c : A} (ha : Const G a) (hb : Const G b) (hc : Const G c)
    (hab : a + 2 * b = 0) (Z : L) : 2 * divLaw G F a b c Z = 0 := by
  rw [twice_div_law G F ha hb hc Z, hab, zero_mul]

/-- EINSTEIN'S LAW IS CONSERVED. Twice the Ricci curvature minus the scalar curvature times the metric, with any
    constant multiple of the metric added, has no divergence. -/
theorem einstein_law_is_conserved {c : A} (hc : Const G c) (Z : L) :
    2 * divLaw G F (1 + 1) (-1) c Z = 0 :=
  the_forced_law_is_conserved G F (const_add G (const_one G) (const_one G)) (const_neg G (const_one G)) hc
    (by ring) Z

end Forcing

/-! ## Part VII-b. The source is conserved: a theorem for the scalar field

RATIONALE. The forcing theorem takes the conservation of the law as its hypothesis. For that hypothesis not to stand
bare, the source side must be shown conserved by the matter's own equation. Here it is proved for the scalar field:
the divergence of its stress tensor is the field equation times the gradient. No conservation is assumed.
DESIGN. T2 is twice the stress tensor, so that no division by two is needed in a general ring.
RISK. One matter model is treated. The statement for all matter needs an action principle and is not formalised. -/
section Matter
variable {A : Type*} [CommRing A] {L : Type*} [LieRing L] [Module A L] (G : Geom A L)
variable {ι : Type*} [Fintype ι] [DecidableEq ι] (F : Frame G ι) (φ μ : A)

theorem act_two (X : L) : G.act X (2 : A) = 0 := by
  have h : (2 : A) = 1 + 1 := by norm_num
  rw [h, G.act_add, act_one, add_zero]

/-- The second covariant derivative of a function. -/
def Hess (X Y : L) : A := G.act X (G.act Y φ) - G.act (G.conn.nabla X Y) φ

/-- It is symmetric, because the connection has no torsion. -/
theorem Hess_symm (X Y : L) : Hess G φ X Y = Hess G φ Y X := by
  unfold Hess
  have t : G.conn.nabla X Y = ⁅X, Y⁆ + G.conn.nabla Y X := sub_eq_iff_eq_add.mp (G.conn.torsion X Y)
  rw [t, G.add_act, G.lie_act]
  ring

/-- The wave operator. -/
def Box : A := ∑ a, F.eps a * Hess G φ (F.e a) (F.e a)
/-- The squared gradient. -/
def Nrm : A := ∑ a, F.eps a * (G.act (F.e a) φ * G.act (F.e a) φ)
/-- Twice the stress tensor of the scalar field with mass term μ. -/
def T2 (Y Z : L) : A := 2 * (G.act Y φ * G.act Z φ) - G.g Y Z * (Nrm G F φ + μ * (φ * φ))
/-- Its covariant derivative. -/
def dT2 (X Y Z : L) : A :=
  G.act X (T2 G F φ μ Y Z) - T2 G F φ μ (G.conn.nabla X Y) Z - T2 G F φ μ Y (G.conn.nabla X Z)
/-- Its divergence. -/
def divT2 (Z : L) : A := ∑ a, F.eps a * dT2 G F φ μ (F.e a) Z (F.e a)

theorem dphi_bilin : IsBilin (fun U V : L => G.act U φ * G.act V φ) where
  add_left U U' V := by simp only [G.add_act]; ring
  smul_left f U V := by simp only [G.smul_act]; ring
  add_right U V V' := by simp only [G.add_act]; ring
  smul_right f U V := by simp only [G.smul_act]; ring

theorem dT2_eq (hμ : Const G μ) (X Y Z : L) :
    dT2 G F φ μ X Y Z = 2 * (Hess G φ X Y * G.act Z φ) + 2 * (G.act Y φ * Hess G φ X Z)
      - G.g Y Z * (G.act X (Nrm G F φ) + μ * (2 * (φ * G.act X φ))) := by
  unfold dT2 T2 Hess
  simp only [act_sub, G.act_mul, G.act_add, act_two, hμ X]
  have cp := G.compat X Y Z
  linear_combination (-(Nrm G F φ + μ * (φ * φ))) * cp

/-- The derivative of the squared gradient. The terms in which the derivative falls on the frame cancel. -/
theorem act_Nrm (Z : L) :
    G.act Z (Nrm G F φ) = 2 * ∑ a, F.eps a * (G.act (F.e a) φ * Hess G φ (F.e a) Z) := by
  have tc : ∑ a, F.eps a * (G.act (G.conn.nabla Z (F.e a)) φ * G.act (F.e a) φ
      + G.act (F.e a) φ * G.act (G.conn.nabla Z (F.e a)) φ) = 0 := trace_commute G F (dphi_bilin G φ) Z
  unfold Nrm
  rw [act_sum, Finset.mul_sum]
  have h : ∀ a ∈ (Finset.univ : Finset ι), G.act Z (F.eps a * (G.act (F.e a) φ * G.act (F.e a) φ))
      = 2 * (F.eps a * (G.act (F.e a) φ * Hess G φ (F.e a) Z))
        + F.eps a * (G.act (G.conn.nabla Z (F.e a)) φ * G.act (F.e a) φ
          + G.act (F.e a) φ * G.act (G.conn.nabla Z (F.e a)) φ) := by
    intro a _
    rw [act_eps_mul, G.act_mul, Hess_symm G φ (F.e a) Z]
    unfold Hess
    ring
  rw [Finset.sum_congr rfl h, Finset.sum_add_distrib, tc, add_zero]

/-- THE DIVERGENCE OF THE STRESS TENSOR IS THE FIELD EQUATION TIMES THE GRADIENT. -/
theorem div_T2 (hμ : Const G μ) (Z : L) :
    divT2 G F φ μ Z = 2 * ((Box G F φ - μ * φ) * G.act Z φ) := by
  have hN := act_Nrm G F φ Z
  have fN := act_in_frame G F Z (Nrm G F φ)
  have fφ := act_in_frame G F Z φ
  have key : divT2 G F φ μ Z
      = 2 * ∑ a, F.eps a * (G.act (F.e a) φ * Hess G φ (F.e a) Z)
        + 2 * (G.act Z φ * ∑ a, F.eps a * Hess G φ (F.e a) (F.e a))
        - ∑ a, (F.eps a * G.g Z (F.e a)) * G.act (F.e a) (Nrm G F φ)
        - 2 * (μ * φ) * ∑ a, (F.eps a * G.g Z (F.e a)) * G.act (F.e a) φ := by
    unfold divT2
    simp only [dT2_eq G F φ μ hμ, Finset.mul_sum]
    rw [← Finset.sum_add_distrib, ← Finset.sum_sub_distrib, ← Finset.sum_sub_distrib]
    apply Finset.sum_congr rfl
    intro a _
    rw [Hess_symm G φ (F.e a) Z]
    ring
  rw [key, ← fN, ← fφ, hN]
  unfold Box
  ring

/-- THE FIELD EQUATION CONSERVES THE SOURCE. -/
theorem field_equation_conserves_the_source (hμ : Const G μ) (h : Box G F φ = μ * φ) (Z : L) :
    divT2 G F φ μ Z = 0 := by
  rw [div_T2 G F φ μ hμ, h]; ring

/-- AND CONVERSELY. Where the field varies along some direction, conservation of the source is the field equation. -/
theorem conservation_is_the_field_equation [NoZeroDivisors A] (h2 : (2 : A) ≠ 0) (hμ : Const G μ) (Z : L)
    (hZ : G.act Z φ ≠ 0) (h : divT2 G F φ μ Z = 0) : Box G F φ = μ * φ := by
  rw [div_T2 G F φ μ hμ] at h
  rcases mul_eq_zero.mp h with h' | h'
  · exact absurd h' h2
  · rcases mul_eq_zero.mp h' with h'' | h''
    · exact sub_eq_zero.mp h''
    · exact absurd h'' hZ
/-- THE LAW EQUATED TO A FIELD ON ITS EQUATION IS CONSERVED. If a law of the family equals a constant times the
stress tensor of a scalar field, and the field obeys its equation, the divergence of the law vanishes. This is where
the hypothesis of the forcing theorem comes from: it is the matter's own equation, carried across the equality. -/
theorem law_sourced_by_a_field_is_conserved {a b c κ : A} (hκ : Const G κ) (hμ : Const G μ)
    (hlaw : ∀ Y Z : L, Law G F a b c Y Z = κ * T2 G F φ μ Y Z) (hfield : Box G F φ = μ * φ) (Z : L) :
    divLaw G F a b c Z = 0 := by
  have h0 := field_equation_conserves_the_source G F φ μ hμ hfield Z
  unfold divT2 at h0
  unfold divLaw dLaw
  simp only [hlaw, G.act_mul, show ∀ X : L, G.act X κ = 0 from hκ]
  have e : ∀ i ∈ (Finset.univ : Finset ι),
      F.eps i * (0 * T2 G F φ μ Z (F.e i) + κ * G.act (F.e i) (T2 G F φ μ Z (F.e i))
        - κ * T2 G F φ μ (G.conn.nabla (F.e i) Z) (F.e i) - κ * T2 G F φ μ Z (G.conn.nabla (F.e i) (F.e i)))
      = κ * (F.eps i * dT2 G F φ μ (F.e i) Z (F.e i)) := by
    intro i _
    unfold dT2
    ring
  rw [Finset.sum_congr rfl e, ← Finset.mul_sum, h0, mul_zero]
end Matter


/-! ## Part VIII. A geometry whose scalar curvature is not constant
    The surface with metric dx² + f(x)² dy², written in its orthonormal frame e₁ = ∂x, e₂ = f⁻¹∂y, with the
    logarithmic derivative of f equal to x. Functions are the rational polynomials in x. A field is a pair (a, b),
    read a·e₁ + b·e₂. Every structure of Parts I to VI is built for it and every law they ask is proved, the
    Jacobi identity included. Its scalar curvature is computed: −2(1 + x²). -/

noncomputable section Witness
open Polynomial

/-- The fields of the model. -/
def V := ℚ[X] × ℚ[X]

instance : AddCommGroup V := inferInstanceAs (AddCommGroup (ℚ[X] × ℚ[X]))
instance : Module ℚ[X] V := inferInstanceAs (Module ℚ[X] (ℚ[X] × ℚ[X]))

theorem V.ext {p q : V} (h1 : p.1 = q.1) (h2 : p.2 = q.2) : p = q := Prod.ext h1 h2
theorem V.add_fst (p q : V) : (p + q).1 = p.1 + q.1 := rfl
theorem V.add_snd (p q : V) : (p + q).2 = p.2 + q.2 := rfl
theorem V.sub_fst (p q : V) : (p - q).1 = p.1 - q.1 := rfl
theorem V.sub_snd (p q : V) : (p - q).2 = p.2 - q.2 := rfl
theorem V.zero_fst : (0 : V).1 = 0 := rfl
theorem V.zero_snd : (0 : V).2 = 0 := rfl
theorem V.smul_fst (f : ℚ[X]) (p : V) : (f • p).1 = f * p.1 := rfl
theorem V.smul_snd (f : ℚ[X]) (p : V) : (f • p).2 = f * p.2 := rfl

/-- The bracket of two fields of the model: e₂ differentiates no function, and [e₁, e₂] = −x·e₂. -/
def vbr (p q : V) : V :=
  (p.1 * derivative q.1 - q.1 * derivative p.1,
   p.1 * derivative q.2 - q.1 * derivative p.2 - X * (p.1 * q.2 - q.1 * p.2))

theorem vbr_fst (p q : V) : (vbr p q).1 = p.1 * derivative q.1 - q.1 * derivative p.1 := rfl
theorem vbr_snd (p q : V) :
    (vbr p q).2 = p.1 * derivative q.2 - q.1 * derivative p.2 - X * (p.1 * q.2 - q.1 * p.2) := rfl

instance : LieRing V :=
  { (inferInstance : AddCommGroup V) with
    bracket := vbr
    add_lie := fun x y z => by
      apply V.ext <;> simp only [vbr_fst, vbr_snd, V.add_fst, V.add_snd, map_add] <;> ring
    lie_add := fun x y z => by
      apply V.ext <;> simp only [vbr_fst, vbr_snd, V.add_fst, V.add_snd, map_add] <;> ring
    lie_self := fun x => by
      apply V.ext <;> simp only [vbr_fst, vbr_snd, V.zero_fst, V.zero_snd] <;> ring
    leibniz_lie := fun x y z => by
      apply V.ext <;>
        simp only [vbr_fst, vbr_snd, V.add_fst, V.add_snd, map_add, map_sub, derivative_mul, derivative_X] <;>
        ring }

theorem lie_eq (p q : V) : ⁅p, q⁆ = vbr p q := rfl

/-- The connection of the model: ∇_{e₂} e₁ = x·e₂ and ∇_{e₂} e₂ = −x·e₁, the others zero. -/
def vnab (p q : V) : V :=
  (p.1 * derivative q.1 - X * p.2 * q.2, p.1 * derivative q.2 + X * p.2 * q.1)

theorem vnab_fst (p q : V) : (vnab p q).1 = p.1 * derivative q.1 - X * p.2 * q.2 := rfl
theorem vnab_snd (p q : V) : (vnab p q).2 = p.1 * derivative q.2 + X * p.2 * q.1 := rfl

def vnabla : V →+ V →+ V :=
  AddMonoidHom.mk' (fun p => AddMonoidHom.mk' (vnab p) (fun a b => by
      apply V.ext <;> simp only [vnab_fst, vnab_snd, V.add_fst, V.add_snd, map_add] <;> ring))
    (fun a b => by
      refine AddMonoidHom.ext fun q => ?_
      show vnab (a + b) q = vnab a q + vnab b q
      apply V.ext <;> simp only [vnab_fst, vnab_snd, V.add_fst, V.add_snd] <;> ring)

theorem vnabla_apply (p q : V) : vnabla p q = vnab p q := rfl

/-- The model: a geometry in the sense of Part V, every law proved. -/
def model : Geom ℚ[X] V where
  act := fun p f => p.1 * derivative f
  act_add := fun p f h => by rw [map_add, mul_add]
  act_mul := fun p f h => by rw [derivative_mul]; ring
  add_act := fun p q f => by rw [V.add_fst, add_mul]
  smul_act := fun f p h => by rw [V.smul_fst, mul_assoc]
  lie_act := fun p q f => by simp only [lie_eq, vbr_fst, derivative_mul]; ring
  bracket_smul := fun p f q => by
    rw [lie_eq, lie_eq]
    apply V.ext <;>
      simp only [vbr_fst, vbr_snd, V.add_fst, V.add_snd, V.smul_fst, V.smul_snd, derivative_mul] <;> ring
  conn :=
    { nabla := vnabla
      torsion := fun p q => by
        rw [lie_eq, vnabla_apply, vnabla_apply]
        apply V.ext <;> simp only [vnab_fst, vnab_snd, vbr_fst, vbr_snd, V.sub_fst, V.sub_snd] <;> ring }
  nabla_smul := fun f p q => by
    show vnab (f • p) q = f • vnab p q
    apply V.ext <;> simp only [vnab_fst, vnab_snd, V.smul_fst, V.smul_snd] <;> ring
  nabla_leib := fun p f q => by
    show vnab p (f • q) = (p.1 * derivative f) • q + f • vnab p q
    apply V.ext <;>
      simp only [vnab_fst, vnab_snd, V.add_fst, V.add_snd, V.smul_fst, V.smul_snd, derivative_mul] <;> ring
  g := fun p q => p.1 * q.1 + p.2 * q.2
  g_symm := fun p q => by ring
  g_add := fun p q r => by rw [V.add_fst, V.add_snd]; ring
  g_smul := fun f p r => by rw [V.smul_fst, V.smul_snd]; ring
  compat := fun p q r => by
    show p.1 * derivative (q.1 * r.1 + q.2 * r.2)
      = (vnab p q).1 * r.1 + (vnab p q).2 * r.2 + (q.1 * (vnab p r).1 + q.2 * (vnab p r).2)
    simp only [vnab_fst, vnab_snd, map_add, derivative_mul]; ring

theorem model_act (p : V) (f : ℚ[X]) : model.act p f = p.1 * derivative f := rfl
theorem model_g (p q : V) : model.g p q = p.1 * q.1 + p.2 * q.2 := rfl
theorem model_nabla (p q : V) : model.conn.nabla p q = vnab p q := rfl

/-- THE CURVATURE OF THE MODEL, computed: R(p, q)r = K·(g(q, r)·p − g(p, r)·q) with K = −(1 + x²). -/
theorem model_curv (p q r : V) :
    curv model.conn p q r
      = ((-(1 + X ^ 2)) * (r.2 * (q.2 * p.1 - p.2 * q.1)), (-(1 + X ^ 2)) * (r.1 * (q.1 * p.2 - p.1 * q.2))) := by
  unfold curv
  rw [model_nabla, model_nabla, model_nabla, model_nabla, model_nabla, lie_eq]
  apply V.ext <;>
    simp only [vnab_fst, vnab_snd, vbr_fst, vbr_snd, V.sub_fst, V.sub_snd, map_add, map_sub, map_neg,
      derivative_mul, derivative_X] <;>
    ring

/-- The orthonormal frame of the model. -/
def e₁ : V := (1, 0)
def e₂ : V := (0, 1)

def modelFrame : Frame model Bool where
  e := fun i => if i then e₂ else e₁
  pos := fun _ => true
  ortho := fun i j => by
    cases i <;> cases j <;> simp [model_g, e₁, e₂, sgn]
  complete := fun p => by
    rw [Fintype.sum_bool]
    apply V.ext <;> simp [model_g, e₁, e₂, sgn, V.add_fst, V.add_snd, V.smul_fst, V.smul_snd]

/-- THE SCALAR CURVATURE OF THE MODEL is −2(1 + x²). -/
theorem model_scal : Scal model modelFrame = -2 * (1 + X ^ 2) := by
  unfold Scal Ric Rm
  simp only [Fintype.sum_bool, Frame.eps, modelFrame, sgn, model_curv, model_g, e₁, e₂, if_true]
  simp
  ring

/-- IT IS NOT CONSTANT: the first field of the frame differentiates it to −4x, which is not zero. -/
theorem model_dScal_ne : model.act e₁ (Scal model modelFrame) ≠ 0 := by
  rw [model_scal, model_act]
  intro h
  have h1 := congrArg (Polynomial.eval 1) h
  simp [e₁] at h1

end Witness

/-! ## Part IX. Conservation on every geometry forces Einstein's law -/

section Capstone
variable {A : Type*} [CommRing A] {L : Type*} [LieRing L] [Module A L] (G : Geom A L)

theorem const_natCast (n : ℕ) : Const G (n : A) := by
  induction n with
  | zero => intro X; rw [Nat.cast_zero]; exact act_zero G X
  | succ k ih => rw [Nat.cast_succ]; exact const_add G ih (const_one G)

/-- Every integer is a constant of every geometry. -/
theorem const_intCast (n : ℤ) : Const G (n : A) := by
  cases n with
  | ofNat k => rw [Int.ofNat_eq_coe, Int.cast_natCast]; exact const_natCast G k
  | negSucc k => rw [Int.cast_negSucc]; exact const_neg G (const_natCast G (k + 1))

end Capstone

/-- CONSERVATION ON EVERY GEOMETRY FORCES THE RATIO. Let a, b and c be integers. If the law a·Ric + b·Scal·g + c·g
    has no divergence on every geometry, in every frame and in every direction, then a + 2b = 0. No hypothesis on
    any geometry is left: the geometry of Part VIII is the one on which every other ratio fails. -/
theorem conservation_on_every_geometry_forces_the_ratio (a b c : ℤ)
    (h : ∀ (A : Type) [CommRing A] (L : Type) [LieRing L] [Module A L] (G : Geom A L)
        (ι : Type) [Fintype ι] [DecidableEq ι] (F : Frame G ι) (Z : L),
        divLaw G F (a : A) (b : A) (c : A) Z = 0) :
    a + 2 * b = 0 := by
  have hm := conservation_forces_the_ratio model modelFrame (const_intCast model a) (const_intCast model b)
    (const_intCast model c) (fun Z => h _ _ model _ modelFrame Z) e₁ model_dScal_ne
  have hq : (a : ℚ) + 2 * (b : ℚ) = 0 := by simpa using congrArg (Polynomial.eval 0) hm
  have hz : ((a + 2 * b : ℤ) : ℚ) = 0 := by push_cast; exact hq
  exact Int.cast_eq_zero.mp hz

/-- AND THAT RATIO IS CONSERVED ON EVERY GEOMETRY, with c free: for all integers a, b, c with a + 2b = 0, twice the
    divergence vanishes on every geometry, in every frame and in every direction. -/
theorem the_forced_ratio_is_conserved_on_every_geometry (a b c : ℤ) (hab : a + 2 * b = 0)
    {A : Type*} [CommRing A] {L : Type*} [LieRing L] [Module A L] (G : Geom A L)
    {ι : Type*} [Fintype ι] [DecidableEq ι] (F : Frame G ι) (Z : L) :
    2 * divLaw G F (a : A) (b : A) (c : A) Z = 0 :=
  the_forced_law_is_conserved G F (const_intCast G a) (const_intCast G b) (const_intCast G c)
    (by exact_mod_cast congrArg (Int.cast : ℤ → A) hab) Z


/-! ## Part VIII-b. A spacetime of four dimensions whose scalar curvature is not constant
    The surface of Part VIII times a flat plane of one space and one time direction: the metric
    dx² + f(x)² dy² + dz² − dt², in its orthonormal frame. A field is a pair of pairs ((a, b), (c, d)), read
    a·e₁ + b·e₂ + c·e₃ + d·e₀. It has four dimensions and one time direction, so the main theorem can be stated
    with its hypothesis restricted to such spacetimes. RISK: coefficients depend on x alone. -/

noncomputable section Witness4
open Polynomial

/-- The fields of the four-dimensional model. -/
def W := V × V

instance : AddCommGroup W := inferInstanceAs (AddCommGroup (V × V))
instance : Module ℚ[X] W := inferInstanceAs (Module ℚ[X] (V × V))

theorem W.ext {p q : W} (h1 : p.1.1 = q.1.1) (h2 : p.1.2 = q.1.2) (h3 : p.2.1 = q.2.1) (h4 : p.2.2 = q.2.2) :
    p = q := Prod.ext (Prod.ext h1 h2) (Prod.ext h3 h4)
theorem W.add_fst (p q : W) : (p + q).1 = p.1 + q.1 := rfl
theorem W.add_snd (p q : W) : (p + q).2 = p.2 + q.2 := rfl
theorem W.sub_fst (p q : W) : (p - q).1 = p.1 - q.1 := rfl
theorem W.sub_snd (p q : W) : (p - q).2 = p.2 - q.2 := rfl
theorem W.zero_fst : (0 : W).1 = 0 := rfl
theorem W.zero_snd : (0 : W).2 = 0 := rfl
theorem W.smul_fst (f : ℚ[X]) (p : W) : (f • p).1 = f • p.1 := rfl
theorem W.smul_snd (f : ℚ[X]) (p : W) : (f • p).2 = f • p.2 := rfl

/-- The bracket: that of Part VIII on the first pair; e₃ and e₀ commute with everything but are differentiated
    by e₁ through their coefficients. -/
def wbr (p q : W) : W :=
  (vbr p.1 q.1,
   (p.1.1 * derivative q.2.1 - q.1.1 * derivative p.2.1, p.1.1 * derivative q.2.2 - q.1.1 * derivative p.2.2))

theorem wbr_fst (p q : W) : (wbr p q).1 = vbr p.1 q.1 := rfl
theorem wbr_c (p q : W) : (wbr p q).2.1 = p.1.1 * derivative q.2.1 - q.1.1 * derivative p.2.1 := rfl
theorem wbr_d (p q : W) : (wbr p q).2.2 = p.1.1 * derivative q.2.2 - q.1.1 * derivative p.2.2 := rfl

instance : LieRing W :=
  { (inferInstance : AddCommGroup W) with
    bracket := wbr
    add_lie := fun x y z => by
      apply W.ext <;> simp only [wbr_fst, wbr_c, wbr_d, vbr_fst, vbr_snd, W.add_fst, W.add_snd, V.add_fst,
        V.add_snd, map_add] <;> ring
    lie_add := fun x y z => by
      apply W.ext <;> simp only [wbr_fst, wbr_c, wbr_d, vbr_fst, vbr_snd, W.add_fst, W.add_snd, V.add_fst,
        V.add_snd, map_add] <;> ring
    lie_self := fun x => by
      apply W.ext <;> simp only [wbr_fst, wbr_c, wbr_d, vbr_fst, vbr_snd, W.zero_fst, W.zero_snd, V.zero_fst,
        V.zero_snd] <;> ring
    leibniz_lie := fun x y z => by
      apply W.ext <;>
        simp only [wbr_fst, wbr_c, wbr_d, vbr_fst, vbr_snd, W.add_fst, W.add_snd, V.add_fst, V.add_snd, map_add,
          map_sub, derivative_mul, derivative_X] <;>
        ring }

theorem lie_eq4 (p q : W) : ⁅p, q⁆ = wbr p q := rfl

/-- The connection: that of Part VIII on the first pair; e₃ and e₀ are parallel. -/
def wnab (p q : W) : W := (vnab p.1 q.1, (p.1.1 * derivative q.2.1, p.1.1 * derivative q.2.2))

theorem wnab_fst (p q : W) : (wnab p q).1 = vnab p.1 q.1 := rfl
theorem wnab_c (p q : W) : (wnab p q).2.1 = p.1.1 * derivative q.2.1 := rfl
theorem wnab_d (p q : W) : (wnab p q).2.2 = p.1.1 * derivative q.2.2 := rfl

def wnabla : W →+ W →+ W :=
  AddMonoidHom.mk' (fun p => AddMonoidHom.mk' (wnab p) (fun a b => by
      apply W.ext <;> simp only [wnab_fst, wnab_c, wnab_d, vnab_fst, vnab_snd, W.add_fst, W.add_snd, V.add_fst,
        V.add_snd, map_add] <;> ring))
    (fun a b => by
      refine AddMonoidHom.ext fun q => ?_
      show wnab (a + b) q = wnab a q + wnab b q
      apply W.ext <;> simp only [wnab_fst, wnab_c, wnab_d, vnab_fst, vnab_snd, W.add_fst, W.add_snd, V.add_fst,
        V.add_snd] <;> ring)

theorem wnabla_apply (p q : W) : wnabla p q = wnab p q := rfl

/-- The four-dimensional model: a geometry in the sense of Part V, every law proved. The metric has one minus. -/
def model4 : Geom ℚ[X] W where
  act := fun p f => p.1.1 * derivative f
  act_add := fun p f h => by rw [map_add, mul_add]
  act_mul := fun p f h => by rw [derivative_mul]; ring
  add_act := fun p q f => by rw [W.add_fst, V.add_fst, add_mul]
  smul_act := fun f p h => by rw [W.smul_fst, V.smul_fst, mul_assoc]
  lie_act := fun p q f => by simp only [lie_eq4, wbr_fst, vbr_fst, derivative_mul]; ring
  bracket_smul := fun p f q => by
    rw [lie_eq4, lie_eq4]
    apply W.ext <;>
      simp only [wbr_fst, wbr_c, wbr_d, vbr_fst, vbr_snd, W.add_fst, W.add_snd, W.smul_fst, W.smul_snd,
        V.add_fst, V.add_snd, V.smul_fst, V.smul_snd, derivative_mul] <;> ring
  conn :=
    { nabla := wnabla
      torsion := fun p q => by
        rw [lie_eq4, wnabla_apply, wnabla_apply]
        apply W.ext <;> simp only [wnab_fst, wnab_c, wnab_d, wbr_fst, wbr_c, wbr_d, vnab_fst, vnab_snd, vbr_fst,
          vbr_snd, W.sub_fst, W.sub_snd, V.sub_fst, V.sub_snd] <;> ring }
  nabla_smul := fun f p q => by
    show wnab (f • p) q = f • wnab p q
    apply W.ext <;> simp only [wnab_fst, wnab_c, wnab_d, vnab_fst, vnab_snd, W.smul_fst, W.smul_snd,
      V.smul_fst, V.smul_snd] <;> ring
  nabla_leib := fun p f q => by
    show wnab p (f • q) = (p.1.1 * derivative f) • q + f • wnab p q
    apply W.ext <;>
      simp only [wnab_fst, wnab_c, wnab_d, vnab_fst, vnab_snd, W.add_fst, W.add_snd, W.smul_fst, W.smul_snd,
        V.add_fst, V.add_snd, V.smul_fst, V.smul_snd, derivative_mul] <;> ring
  g := fun p q => p.1.1 * q.1.1 + p.1.2 * q.1.2 + p.2.1 * q.2.1 - p.2.2 * q.2.2
  g_symm := fun p q => by ring
  g_add := fun p q r => by simp only [W.add_fst, W.add_snd, V.add_fst, V.add_snd]; ring
  g_smul := fun f p r => by simp only [W.smul_fst, W.smul_snd, V.smul_fst, V.smul_snd]; ring
  compat := fun p q r => by
    show p.1.1 * derivative (q.1.1 * r.1.1 + q.1.2 * r.1.2 + q.2.1 * r.2.1 - q.2.2 * r.2.2)
      = (wnab p q).1.1 * r.1.1 + (wnab p q).1.2 * r.1.2 + (wnab p q).2.1 * r.2.1 - (wnab p q).2.2 * r.2.2
        + (q.1.1 * (wnab p r).1.1 + q.1.2 * (wnab p r).1.2 + q.2.1 * (wnab p r).2.1 - q.2.2 * (wnab p r).2.2)
    simp only [wnab_fst, wnab_c, wnab_d, vnab_fst, vnab_snd, map_add, map_sub, derivative_mul]; ring

theorem model4_act (p : W) (f : ℚ[X]) : model4.act p f = p.1.1 * derivative f := rfl
theorem model4_g (p q : W) :
    model4.g p q = p.1.1 * q.1.1 + p.1.2 * q.1.2 + p.2.1 * q.2.1 - p.2.2 * q.2.2 := rfl
theorem model4_nabla (p q : W) : model4.conn.nabla p q = wnab p q := rfl

/-- THE CURVATURE OF THE FOUR-DIMENSIONAL MODEL, computed: that of the surface, and nothing in the flat plane. -/
theorem model4_curv (p q r : W) :
    curv model4.conn p q r
      = (((-(1 + X ^ 2)) * (r.1.2 * (q.1.2 * p.1.1 - p.1.2 * q.1.1)),
          (-(1 + X ^ 2)) * (r.1.1 * (q.1.1 * p.1.2 - p.1.1 * q.1.2))), (0, 0)) := by
  unfold curv
  rw [model4_nabla, model4_nabla, model4_nabla, model4_nabla, model4_nabla, lie_eq4]
  apply W.ext <;>
    simp only [wnab_fst, wnab_c, wnab_d, wbr_fst, wbr_c, wbr_d, vnab_fst, vnab_snd, vbr_fst, vbr_snd, W.sub_fst,
      W.sub_snd, V.sub_fst, V.sub_snd, map_add, map_sub, map_neg, derivative_mul, derivative_X] <;>
    ring

/-- The orthonormal frame: three fields of square plus one and one of square minus one. -/
def f₁ : W := ((1, 0), (0, 0))
def f₂ : W := ((0, 1), (0, 0))
def f₃ : W := ((0, 0), (1, 0))
def f₀ : W := ((0, 0), (0, 1))

def model4Frame : Frame model4 (Bool × Bool) where
  e := fun i => if i.1 then (if i.2 then f₀ else f₃) else (if i.2 then f₂ else f₁)
  pos := fun i => !(i.1 && i.2)
  ortho := fun i j => by
    rcases i with ⟨_ | _, _ | _⟩ <;> rcases j with ⟨_ | _, _ | _⟩ <;>
      simp [model4_g, f₁, f₂, f₃, f₀, sgn]
  complete := fun p => by
    rw [Fintype.sum_prod_type, Fintype.sum_bool, Fintype.sum_bool, Fintype.sum_bool]
    apply W.ext <;>
      simp [model4_g, f₁, f₂, f₃, f₀, sgn, W.add_fst, W.add_snd, W.smul_fst, W.smul_snd, V.add_fst, V.add_snd,
        V.smul_fst, V.smul_snd]

/-- It has four dimensions. -/
theorem model4_card : Fintype.card (Bool × Bool) = 4 := rfl

/-- It has one time direction. -/
theorem model4_one_time : (Finset.univ.filter (fun i => model4Frame.pos i = false)).card = 1 := rfl

/-- ITS SCALAR CURVATURE is −2(1 + x²). -/
theorem model4_scal : Scal model4 model4Frame = -2 * (1 + X ^ 2) := by
  unfold Scal Ric Rm
  simp only [Fintype.sum_prod_type, Fintype.sum_bool, Frame.eps, model4Frame, sgn, model4_curv, model4_g,
    f₁, f₂, f₃, f₀]
  simp
  ring

/-- IT IS NOT CONSTANT. -/
theorem model4_dScal_ne : model4.act f₁ (Scal model4 model4Frame) ≠ 0 := by
  rw [model4_scal, model4_act]
  intro h
  have h1 := congrArg (Polynomial.eval 1) h
  simp [f₁] at h1

end Witness4

/-- The polynomials over the rationals have no two-torsion. -/
theorem noTwoTorsion_poly : NoTwoTorsion (Polynomial ℚ) := fun _ h =>
  (mul_eq_zero.mp h).resolve_left two_ne_zero

/-- CONSERVATION ON EVERY SPACETIME OF FOUR DIMENSIONS FORCES THE RATIO. The hypothesis of the main theorem is
    weakened: the law need only be conserved on geometries with a frame of four fields, exactly one of them of
    square minus one, over rings in which 2x = 0 gives x = 0. The conclusion is the same. The geometry of Part VIII-b is the one on which every other
    ratio fails. -/
theorem conservation_on_every_spacetime_of_four_dimensions_forces_the_ratio (a b c : ℤ)
    (h : ∀ (A : Type) [CommRing A] (L : Type) [LieRing L] [Module A L] (G : Geom A L)
        (ι : Type) [Fintype ι] [DecidableEq ι] (F : Frame G ι),
        NoTwoTorsion A → Fintype.card ι = 4 → (Finset.univ.filter (fun i => F.pos i = false)).card = 1 →
        ∀ Z : L, divLaw G F (a : A) (b : A) (c : A) Z = 0) :
    a + 2 * b = 0 := by
  have hm := conservation_forces_the_ratio model4 model4Frame (const_intCast model4 a) (const_intCast model4 b)
    (const_intCast model4 c) (fun Z => h _ _ model4 _ model4Frame noTwoTorsion_poly model4_card model4_one_time Z) f₁
    model4_dScal_ne
  have hq : (a : ℚ) + 2 * (b : ℚ) = 0 := by simpa using congrArg (Polynomial.eval 0) hm
  have hz : ((a + 2 * b : ℤ) : ℚ) = 0 := by push_cast; exact hq
  exact Int.cast_eq_zero.mp hz

/-! ## Part IX-b. The seat and the record: definitions
    A particle is a charge and an energy, placed on the plane at (side, height) = (1 + charge, energy). The
    reflection in the line of side one exchanges a particle with its antiparticle. Registration is the projection
    onto that line. These are definitions; what gravity does with them is a premise, a field of `Premises`. -/

/-- A point of the seat: a side and a height. -/
abbrev Pt := ℤ × ℤ
/-- The reflection of the seat. -/
def fold (p : Pt) : Pt := (2 - p.1, p.2)
/-- The registration keeps the height and forgets the side. -/
def reg (p : Pt) : Pt := (1, p.2)

/-- A particle: a charge and an energy. -/
structure Particle where
  charge : ℤ
  energy : ℤ

/-- The antiparticle: the charge reversed, the energy kept. -/
def bar (c : Particle) : Particle := ⟨-c.charge, c.energy⟩

/-- The point of a particle: its charge is its side, its energy its height. -/
def seatOf (c : Particle) : Pt := (1 + c.charge, c.energy)

/-- The antiparticle sits at the reflected point. -/
theorem seat_of_bar (c : Particle) : seatOf (bar c) = fold (seatOf c) := by
  unfold seatOf bar fold
  refine Prod.ext ?_ rfl
  show 1 + -c.charge = 2 - (1 + c.charge)
  ring

/-- A point and its reflection have one registration. -/
theorem reg_fold (p : Pt) : reg (fold p) = reg p := rfl

/-! ## Part X. The premises, in one structure, and the theorem
    Everything above is mathematics and takes no premise. What joins it to gravity is collected here, where the
    kernel can see it. -/

/-- Twice Einstein's tensor: 2·Ric − Scal·g. -/
def Einstein2 {A : Type*} [CommRing A] {L : Type*} [LieRing L] [Module A L] (G : Geom A L)
    {ι : Type*} [Fintype ι] [DecidableEq ι] (F : Frame G ι) (Y Z : L) : A :=
  2 * Ric G F Y Z - Scal G F * G.g Y Z

/-- THE PREMISES OF THE PAPER. They are physics and are not proved.
    P1, geometry and order. The law of gravity is a symmetric law built from the metric and its curvature, of the
        family a·Ric + b·Scal·g + c·g with integer coefficients. In four dimensions every conserved symmetric law
        of second order in the metric lies in this family: that is Lovelock's theorem (1971), cited and not proved
        here, and it is what lets P1 be stated on the family.
    P2, conservation. The source of gravity is conserved, on every geometry, in every frame and in every direction;
        the law equals the source, so the law has no divergence there. This is the field `conserved`.
        For the scalar field this is proved in Part VII-b (`div_T2`, `law_sourced_by_a_field_is_conserved`);
        the premise is its extension to all matter. The field asks for conservation only where physics needs it:
        on spacetimes of four dimensions with one time direction, over rings of functions in which 2x = 0 gives
        x = 0. A weaker premise is a stronger theorem.
    P3, the record. Gravity reads the record: the weight it gives a particle is some function of the registration
        of the particle's point. These are the fields `weight` and `reads_record`. The function is not named. -/
structure Premises where
  a : ℤ
  b : ℤ
  c : ℤ
  conserved : ∀ (A : Type) [CommRing A] (L : Type) [LieRing L] [Module A L] (G : Geom A L)
      (ι : Type) [Fintype ι] [DecidableEq ι] (F : Frame G ι),
      NoTwoTorsion A → Fintype.card ι = 4 → (Finset.univ.filter (fun i => F.pos i = false)).card = 1 →
      ∀ Z : L, divLaw G F (a : A) (b : A) (c : A) Z = 0
  weight : Particle → ℤ
  reads_record : ∃ f : Pt → ℤ, ∀ p : Particle, weight p = f (reg (seatOf p))

/-- EINSTEIN'S LAW IS FORCED. On the premises, twice the law is a times twice Einstein's tensor plus a free multiple
    of the metric, on every geometry and in every frame. The coefficient a is the coupling and c the vacuum term;
    neither is fixed. The premise is used on one spacetime only, that of Part VIII-b. -/
theorem einstein_forced (P : Premises) {A : Type} [CommRing A] {L : Type} [LieRing L] [Module A L]
    (G : Geom A L) {ι : Type} [Fintype ι] [DecidableEq ι] (F : Frame G ι) (Y Z : L) :
    2 * Law G F (P.a : A) (P.b : A) (P.c : A) Y Z
      = (P.a : A) * Einstein2 G F Y Z + 2 * (P.c : A) * G.g Y Z := by
  have h := conservation_on_every_spacetime_of_four_dimensions_forces_the_ratio P.a P.b P.c P.conserved
  have hA : (P.a : A) + 2 * (P.b : A) = 0 := by exact_mod_cast congrArg (Int.cast : ℤ → A) h
  unfold Law Einstein2
  linear_combination (Scal G F * G.g Y Z) * hA

/-- The premises are not empty: Einstein's law with any vacuum term satisfies them wherever two is not a zero
    divisor. Stated on such rings: with a = 2 and b = −1, twice the divergence vanishes on every geometry. -/
theorem einstein_satisfies_conservation (c : ℤ) {A : Type*} [CommRing A] {L : Type*} [LieRing L] [Module A L]
    (G : Geom A L) {ι : Type*} [Fintype ι] [DecidableEq ι] (F : Frame G ι) (Z : L) :
    2 * divLaw G F ((2 : ℤ) : A) ((-1 : ℤ) : A) (c : A) Z = 0 :=
  the_forced_ratio_is_conserved_on_every_geometry 2 (-1) c (by norm_num) G F Z
/-- THE PREMISES ARE MET, AND NOT ONLY BY THE ZERO LAW: Einstein's law with any vacuum term is a member. -/
def einsteinPremises (c : ℤ) : Premises where
  a := 2
  b := -1
  c := c
  conserved := fun A _ L _ _ G ι _ _ F h2 _ _ Z =>
    h2 _ (the_forced_ratio_is_conserved_on_every_geometry 2 (-1) c (by norm_num) G F Z)
  weight := fun p => p.energy
  reads_record := ⟨fun q => q.2, fun _ => rfl⟩

theorem einsteinPremises_coupling (c : ℤ) : (einsteinPremises c).a = 2 := rfl

/-! ## Part X-b. The trace reversal, the active density, and the dimension

RATIONALE. The forced law reads a source through its trace reversal. This part computes that reading for a fluid in
any number of dimensions n: along the fluid's own time it is (n - 3) ρ + (n - 1) p, across it ρ - p. In four
dimensions these are ρ + 3p and ρ - p. For matter at rest the space reading equals the time reading exactly when
n = 4, and the time reading vanishes exactly when n = 3.
DESIGN. n is the number of fields of the frame. Nothing is assumed about the signature beyond g(u, u) = -1 for the
fluid's velocity. The trace of a form is taken in the frame; Parseval's identity comes from completeness.
RISK. That the weak-field potentials are sourced by these two readings is derived in SPHYS_WeakField_CC.lean, in
coordinates, to first order and for a static field. -/
section TraceReversal
variable {A : Type*} [CommRing A] {L : Type*} [LieRing L] [Module A L] (G : Geom A L)
variable {ι : Type*} [Fintype ι] [DecidableEq ι] (F : Frame G ι)

theorem eps_sq (i : ι) : F.eps i * F.eps i = 1 := by
  unfold Frame.eps sgn
  split <;> ring

theorem g_bilin : IsBilin G.g where
  add_left := G.g_add
  smul_left := G.g_smul
  add_right := g_add_right G
  smul_right := g_smul_right G

/-- Parseval's identity in the frame. -/
theorem parseval (X Y : L) : ∑ i, F.eps i * (G.g X (F.e i) * G.g (F.e i) Y) = G.g X Y := by
  symm
  calc G.g X Y = G.g (∑ i, (sgn A (F.pos i) * G.g X (F.e i)) • F.e i) Y := by rw [← F.complete X]
    _ = ∑ i, (sgn A (F.pos i) * G.g X (F.e i)) * G.g (F.e i) Y := (g_bilin G).sum_left _ _ _ _
    _ = _ := Finset.sum_congr rfl (fun i _ => by unfold Frame.eps; ring)

/-- The trace of the metric is the number of dimensions. -/
theorem frame_trace_g : ∑ i, F.eps i * G.g (F.e i) (F.e i) = (Fintype.card ι : A) := by
  have h : ∀ i ∈ (Finset.univ : Finset ι), F.eps i * G.g (F.e i) (F.e i) = 1 := by
    intro i _
    rw [F.ortho, if_pos rfl]
    exact eps_sq G F i
  rw [Finset.sum_congr rfl h]
  simp

/-- The trace of a form, in the frame. -/
def tr (T : L → L → A) : A := ∑ i, F.eps i * T (F.e i) (F.e i)

/-- The trace of the forced law is (2 - n) times the scalar curvature. -/
theorem trace_Einstein2 : tr G F (Einstein2 G F) = (2 - (Fintype.card ι : A)) * Scal G F := by
  have h1 : ∑ i, F.eps i * (2 * Ric G F (F.e i) (F.e i)) = 2 * Scal G F := by
    unfold Scal
    rw [Finset.mul_sum]
    exact Finset.sum_congr rfl (fun i _ => by ring)
  have h2 : ∑ i, F.eps i * (Scal G F * G.g (F.e i) (F.e i)) = Scal G F * (Fintype.card ι : A) := by
    rw [← frame_trace_g G F, Finset.mul_sum]
    exact Finset.sum_congr rfl (fun i _ => by ring)
  unfold tr Einstein2
  simp only [mul_sub]
  rw [Finset.sum_sub_distrib, h1, h2]
  ring

/-- The trace reversal of a form in n dimensions, cleared of its denominator. -/
def rev (T : L → L → A) (Y Z : L) : A := ((Fintype.card ι : A) - 2) * T Y Z - G.g Y Z * tr G F T

/-- THE TRACE REVERSAL. If the forced law equals κ T, then (n - 2) times twice the Ricci curvature is κ times the
trace reversal of T. This is what the curvature reads of a source. -/
theorem trace_reversal (T : L → L → A) (κ : A) (h : ∀ Y Z : L, Einstein2 G F Y Z = κ * T Y Z) (Y Z : L) :
    ((Fintype.card ι : A) - 2) * (2 * Ric G F Y Z) = κ * rev G F T Y Z := by
  have ht : tr G F (Einstein2 G F) = κ * tr G F T := by
    unfold tr
    simp only [h]
    rw [Finset.mul_sum]
    exact Finset.sum_congr rfl (fun i _ => by ring)
  rw [trace_Einstein2] at ht
  have hy := h Y Z
  unfold Einstein2 at hy
  unfold rev
  linear_combination ((Fintype.card ι : A) - 2) * hy - G.g Y Z * ht

/-- A fluid of density ρ and pressure p moving along u. -/
def fluid (u : L) (ρ p : A) (Y Z : L) : A := (ρ + p) * (G.g u Y * G.g u Z) + p * G.g Y Z

theorem tr_fluid (u : L) (ρ p : A) (hu : G.g u u = -1) :
    tr G F (fluid G u ρ p) = -(ρ + p) + (Fintype.card ι : A) * p := by
  have h1 : ∑ i, F.eps i * (G.g u (F.e i) * G.g u (F.e i)) = -1 := by
    rw [← hu, ← parseval G F u u]
    exact Finset.sum_congr rfl (fun i _ => by rw [G.g_symm (F.e i) u])
  have h2 := frame_trace_g G F
  unfold tr fluid
  simp only [mul_add]
  rw [Finset.sum_add_distrib]
  have e1 : ∑ i, F.eps i * ((ρ + p) * (G.g u (F.e i) * G.g u (F.e i)))
      = (ρ + p) * ∑ i, F.eps i * (G.g u (F.e i) * G.g u (F.e i)) := by
    rw [Finset.mul_sum]
    exact Finset.sum_congr rfl (fun i _ => by ring)
  have e2 : ∑ i, F.eps i * (p * G.g (F.e i) (F.e i)) = p * ∑ i, F.eps i * G.g (F.e i) (F.e i) := by
    rw [Finset.mul_sum]
    exact Finset.sum_congr rfl (fun i _ => by ring)
  rw [e1, e2, h1, h2]
  ring

/-- THE ACTIVE DENSITY IN n DIMENSIONS. Along the fluid's own time the curvature reads (n - 3) ρ + (n - 1) p. -/
theorem active_density (u : L) (ρ p : A) (hu : G.g u u = -1) :
    rev G F (fluid G u ρ p) u u = ((Fintype.card ι : A) - 3) * ρ + ((Fintype.card ι : A) - 1) * p := by
  unfold rev
  rw [tr_fluid G F u ρ p hu]
  unfold fluid
  rw [hu]
  ring

/-- THE SPACE READING. Across the fluid, along a unit direction at rest with it, the curvature reads ρ - p. -/
theorem space_reading (u w : L) (ρ p : A) (hu : G.g u u = -1) (hw : G.g w w = 1) (huw : G.g u w = 0) :
    rev G F (fluid G u ρ p) w w = ρ - p := by
  unfold rev
  rw [tr_fluid G F u ρ p hu]
  unfold fluid
  rw [hw, huw]
  ring

/-- In four dimensions the active density is ρ + 3 p. -/
theorem active_density_in_four (hn : Fintype.card ι = 4) (u : L) (ρ p : A) (hu : G.g u u = -1) :
    rev G F (fluid G u ρ p) u u = ρ + 3 * p := by
  rw [active_density G F u ρ p hu, hn]
  push_cast
  ring

/-- FOUR DIMENSIONS ARE SINGLED OUT. For matter at rest, without pressure, the space reading equals the time reading
exactly when (n - 4) ρ = 0. -/
theorem space_reads_what_time_reads_iff (u w : L) (ρ : A) (hu : G.g u u = -1) (hw : G.g w w = 1)
    (huw : G.g u w = 0) :
    rev G F (fluid G u ρ 0) w w = rev G F (fluid G u ρ 0) u u ↔ ((Fintype.card ι : A) - 4) * ρ = 0 := by
  rw [active_density G F u ρ 0 hu, space_reading G F u w ρ 0 hu hw huw]
  constructor
  · intro h; linear_combination -h
  · intro h; linear_combination -h

/-- AND THREE ARE EXCLUDED. For matter at rest, without pressure, the time reading is (n - 3) ρ: in three dimensions
of spacetime a body at rest has no weight. -/
theorem weight_of_matter_at_rest (u : L) (ρ : A) (hu : G.g u u = -1) :
    rev G F (fluid G u ρ 0) u u = ((Fintype.card ι : A) - 3) * ρ := by
  rw [active_density G F u ρ 0 hu]; ring
end TraceReversal

/-! ## Part XI. What a reading of the record can see
    The earlier engine defined the gravitational reading of a particle as its energy and then proved it blind to
    charge by `rfl`. Here nothing is defined so. The premise is that gravity reads the record: its reading of a
    particle is some function f of the registration of the particle's point. The theorems hold for every f. -/

section RecordReading

/-- EVERY READING OF THE RECORD IS BLIND TO THE SIGN OF CHARGE: antimatter reads as matter, whatever the reading. -/
theorem every_reading_of_the_record_is_blind_to_charge {β : Type*} (f : Pt → β) (c : Particle) :
    f (reg (seatOf (bar c))) = f (reg (seatOf c)) := by
  rw [seat_of_bar, reg_fold]

/-- EVERY READING OF THE RECORD IS BLIND TO COMPOSITION: two particles of one energy read alike, whatever their
    charges and whatever the reading. -/
theorem every_reading_of_the_record_is_blind_to_composition {β : Type*} (f : Pt → β) (c d : Particle)
    (h : c.energy = d.energy) : f (reg (seatOf c)) = f (reg (seatOf d)) := by
  have hc : reg (seatOf c) = (1, c.energy) := rfl
  have hd : reg (seatOf d) = (1, d.energy) := rfl
  rw [hc, hd, h]

/-- AND NO READING OF THE RECORD RETURNS THE CHARGE. -/
theorem no_reading_of_the_record_returns_the_charge :
    ¬ ∃ f : Pt → ℤ, ∀ c : Particle, f (reg (seatOf c)) = c.charge := by
  intro ⟨f, hf⟩
  have h1 := hf ⟨1, 0⟩
  have h2 := hf ⟨-1, 0⟩
  have e : reg (seatOf ⟨1, 0⟩) = reg (seatOf ⟨-1, 0⟩) := rfl
  rw [e] at h1
  rw [h1] at h2
  norm_num at h2

/-- ON THE PREMISES, ANTIMATTER WEIGHS AS MATTER. -/
theorem Premises.antimatter_weighs_as_matter (P : Premises) (c : Particle) : P.weight (bar c) = P.weight c := by
  obtain ⟨f, hf⟩ := P.reads_record
  rw [hf, hf]
  exact every_reading_of_the_record_is_blind_to_charge f c

/-- ON THE PREMISES, WEIGHT DOES NOT SEE COMPOSITION: two particles of one energy weigh alike. -/
theorem Premises.weight_is_blind_to_composition (P : Premises) (c d : Particle) (h : c.energy = d.energy) :
    P.weight c = P.weight d := by
  obtain ⟨f, hf⟩ := P.reads_record
  rw [hf, hf]
  exact every_reading_of_the_record_is_blind_to_composition f c d h

/-- ON THE PREMISES, THE WEIGHT IS NOT THE CHARGE. -/
theorem Premises.weight_is_not_the_charge (P : Premises) : ¬ ∀ c : Particle, P.weight c = c.charge := by
  intro h
  obtain ⟨f, hf⟩ := P.reads_record
  exact no_reading_of_the_record_returns_the_charge ⟨f, fun c => (hf c).symm.trans (h c)⟩

end RecordReading

end SPHYS.Geometry

#print axioms SPHYS.Geometry.first_bianchi
#print axioms SPHYS.Geometry.second_bianchi
#print axioms SPHYS.Geometry.halfBracket_curv
#print axioms SPHYS.Geometry.curv_smul_left
#print axioms SPHYS.Geometry.curv_smul_mid
#print axioms SPHYS.Geometry.curv_smul_right
#print axioms SPHYS.Geometry.Rm_antisymm34
#print axioms SPHYS.Geometry.second_bianchi_Rm
#print axioms SPHYS.Geometry.trace_commute
#print axioms SPHYS.Geometry.contracted_bianchi
#print axioms SPHYS.Geometry.twice_div_law
#print axioms SPHYS.Geometry.conservation_forces_the_ratio
#print axioms SPHYS.Geometry.the_forced_law_is_conserved
#print axioms SPHYS.Geometry.einstein_law_is_conserved
#print axioms SPHYS.Geometry.model_curv
#print axioms SPHYS.Geometry.model_scal
#print axioms SPHYS.Geometry.model_dScal_ne
#print axioms SPHYS.Geometry.conservation_on_every_geometry_forces_the_ratio
#print axioms SPHYS.Geometry.the_forced_ratio_is_conserved_on_every_geometry
#print axioms SPHYS.Geometry.model4_scal
#print axioms SPHYS.Geometry.conservation_on_every_spacetime_of_four_dimensions_forces_the_ratio
#print axioms SPHYS.Geometry.einstein_forced
#print axioms SPHYS.Geometry.einsteinPremises
#print axioms SPHYS.Geometry.einstein_satisfies_conservation
#print axioms SPHYS.Geometry.pair_symm
#print axioms SPHYS.Geometry.Ric_symm
#print axioms SPHYS.Geometry.contract_13
#print axioms SPHYS.Geometry.contract_23
#print axioms SPHYS.Geometry.contract_24
#print axioms SPHYS.Geometry.contract_34
#print axioms SPHYS.Geometry.full_contract_13_24
#print axioms SPHYS.Geometry.div_T2
#print axioms SPHYS.Geometry.field_equation_conserves_the_source
#print axioms SPHYS.Geometry.conservation_is_the_field_equation
#print axioms SPHYS.Geometry.law_sourced_by_a_field_is_conserved
#print axioms SPHYS.Geometry.parseval
#print axioms SPHYS.Geometry.trace_reversal
#print axioms SPHYS.Geometry.active_density
#print axioms SPHYS.Geometry.space_reading
#print axioms SPHYS.Geometry.active_density_in_four
#print axioms SPHYS.Geometry.space_reads_what_time_reads_iff
#print axioms SPHYS.Geometry.weight_of_matter_at_rest
#print axioms SPHYS.Geometry.every_reading_of_the_record_is_blind_to_charge
#print axioms SPHYS.Geometry.every_reading_of_the_record_is_blind_to_composition
#print axioms SPHYS.Geometry.no_reading_of_the_record_returns_the_charge
#print axioms SPHYS.Geometry.Premises.antimatter_weighs_as_matter
#print axioms SPHYS.Geometry.Premises.weight_is_blind_to_composition
#print axioms SPHYS.Geometry.Premises.weight_is_not_the_charge
#print axioms SPHYS.Geometry.Hess_symm
#print axioms SPHYS.Geometry.Rm_antisymm12
#print axioms SPHYS.Geometry.contract_12
#print axioms SPHYS.Geometry.model4_card
#print axioms SPHYS.Geometry.model4_one_time
#print axioms SPHYS.Geometry.model4_dScal_ne
#print axioms SPHYS.Geometry.einsteinPremises_coupling
#print axioms SPHYS.Geometry.noTwoTorsion_poly
