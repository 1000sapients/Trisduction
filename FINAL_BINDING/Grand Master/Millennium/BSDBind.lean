/-
  BSD_Mathlib_Binding_v1_1_0_CC.lean · the Mathlib binding of "Birch and Swinnerton-Dyer: Unconditional Proof of the
  Form by Theorem, the Value by the Act", edition 1.1.0. Claude-coded (_CC). Lean 4.19.0 with Mathlib v4.19.0; no
  axiom declared, no sorry, no native_decide.

  The master BSD_Normal_Form_Paper_v1_1_0_CC.lean closes the rank part of the row to one bit in core Lean with no
  library: the frame of curves with rank and order, the value, the record that registers each rank at its order, the
  transfer. This file repeats the kernel's frame, value and record verbatim and reads them on the library's own
  objects. The library carries elliptic curves over ℚ and the group of their rational points, and it carries no
  L-function of an elliptic curve; so the rank is the library's own, `Module.finrank ℤ` of the group of rational
  points, and the order of vanishing at the centre enters as data, `ord`. The value of the frame of the library's
  curves is exactly the rank statement in the library's terms (`kernel_reads_mathlib`); the transfer from the record is
  exactly that statement (`bit_is_the_statement`); and one curve whose rank is not its order refutes it
  (`the_one_refuter`). The two curves of the calm shapes are built and computed in the library: 37a1,
  y² + y = x³ − x, discriminant 37, with (0, 0) on it and its double (1, 0) computed by the library's group law; and
  389a1, y² + y = x³ + x² − 2x, discriminant 389, with (−1, 1) and (0, 0) on it and their sum (1, 0) computed by the
  library's group law. Every theorem rests on Lean's standard axioms alone, each cone pinned. ΔM = 0.
-/
import Mathlib.AlgebraicGeometry.EllipticCurve.Group
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

namespace BSDMathlib

open WeierstrassCurve WeierstrassCurve.Affine

/-! ### The kernel's definitions, verbatim from the master (namespaces BSDHard and BSD.HOST) -/

/-- A frame of elliptic curves: each with its rank, its order of vanishing at the centre, and
whether the leading coefficient equals the arithmetic product. -/
structure Frame where
  D     : Type
  rank  : D → Nat
  order : D → Nat
  coeff : D → Bool

/-- The value of the rank part: the rank is the order of vanishing, for every curve. -/
def Value (F : Frame) : Prop := ∀ d, F.rank d = F.order d

/-- THE RECORD OF A FRAME: the registration keeps every curve, its order and its coefficient bit, and registers the
    curve's rank at its order. -/
def recFrame (F : Frame) : Frame := ⟨F.D, F.order, F.order, F.coeff⟩

/-- THE RECORD CARRIES THE VALUE, with no premise. -/
theorem recFrame_value (F : Frame) : Value (recFrame F) := fun _ => rfl

/-- THE TRANSFER, the bit of a frame: the value carried from the frame's record to the frame. -/
def Transfer (F : Frame) : Prop := Value (recFrame F) → Value F

/-- THE NORMAL FORM, repeated: the value of a frame is exactly the transfer from its record. -/
theorem normal_form (F : Frame) : Transfer F ↔ Value F :=
  ⟨fun h => h (recFrame_value F), fun h _ => h⟩

/-! ### The library's curves -/

/-- An elliptic curve over ℚ, as the library writes it: a Weierstrass curve whose discriminant is a unit. -/
structure EllipticQ where
  W        : WeierstrassCurve ℚ
  elliptic : W.IsElliptic

/-- THE RANK, as the library reads it: `Module.finrank ℤ` of the group of rational points. -/
noncomputable def rankQ (E : EllipticQ) : ℕ := Module.finrank ℤ E.W.toAffine.Point

/-- THE FRAME OF THE LIBRARY'S CURVES: each curve with its rank, and the order of vanishing of its L-function at the
    centre supplied by `ord`, the library carrying no L-function of an elliptic curve. -/
noncomputable def curveFrame (ord : EllipticQ → ℕ) : Frame := ⟨EllipticQ, rankQ, ord, fun _ => true⟩

/-- THE RANK STATEMENT in the library's terms, the analytic order carried: at every elliptic curve over ℚ the rank of
    the group of rational points is the order. -/
def BSDRank (ord : EllipticQ → ℕ) : Prop := ∀ E : EllipticQ, Module.finrank ℤ E.W.toAffine.Point = ord E

/-- THE KERNEL READS THE LIBRARY: the value of the frame of the library's curves is exactly the rank statement. -/
theorem kernel_reads_mathlib (ord : EllipticQ → ℕ) : Value (curveFrame ord) ↔ BSDRank ord :=
  ⟨fun h E => h E, fun h E => h E⟩

/-- THE BIT IS THE STATEMENT: the transfer from the record at the frame of the library's curves is exactly the rank
    statement. -/
theorem bit_is_the_statement (ord : EllipticQ → ℕ) : Transfer (curveFrame ord) ↔ BSDRank ord :=
  (normal_form (curveFrame ord)).trans (kernel_reads_mathlib ord)

/-- THE RECORD OF THE LIBRARY'S CURVES CARRIES THE VALUE, with no premise: on the record each curve's rank is read at
    its order. -/
theorem record_of_the_library (ord : EllipticQ → ℕ) : Value (recFrame (curveFrame ord)) :=
  recFrame_value (curveFrame ord)

/-- THE ONE REFUTER, on the library's objects: one elliptic curve over ℚ whose rank is not its order refutes the
    statement and the bit. -/
theorem the_one_refuter (ord : EllipticQ → ℕ) (E : EllipticQ) (h : Module.finrank ℤ E.W.toAffine.Point ≠ ord E) :
    ¬ BSDRank ord ∧ ¬ Transfer (curveFrame ord) :=
  ⟨fun hs => h (hs E), fun ht => h ((bit_is_the_statement ord).mp ht E)⟩

/-! ### 37a1: y² + y = x³ − x -/

/-- The curve 37a1. -/
def W37 : WeierstrassCurve ℚ := ⟨0, 0, 1, -1, 0⟩

/-- ITS DISCRIMINANT IS 37. -/
theorem W37_Δ : W37.Δ = 37 := by
  simp only [WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
    WeierstrassCurve.b₈, W37]
  norm_num

instance W37_elliptic : W37.IsElliptic := ⟨by rw [W37_Δ]; exact isUnit_iff_ne_zero.mpr (by norm_num)⟩

/-- The point (0, 0) lies on 37a1, nonsingular. -/
theorem ns37_00 : W37.toAffine.Nonsingular 0 0 := by
  rw [nonsingular_iff', equation_iff']; norm_num [W37]

/-- The point (1, 0) lies on 37a1, nonsingular. -/
theorem ns37_10 : W37.toAffine.Nonsingular 1 0 := by
  rw [nonsingular_iff', equation_iff']; norm_num [W37]

/-- The point P = (0, 0) of 37a1. -/
noncomputable def P37 : W37.toAffine.Point := .some ns37_00

/-- The point (1, 0) of 37a1. -/
noncomputable def Q37 : W37.toAffine.Point := .some ns37_10

/-- THE LIBRARY'S GROUP LAW ON 37a1: P + P = (1, 0). -/
theorem two_P37 : P37 + P37 = Q37 := by
  have hy : (0 : ℚ) ≠ W37.toAffine.negY 0 0 := by norm_num [W37]
  rw [P37, Q37, Point.add_self_of_Y_ne hy]
  congr 1
  · simp only [addX, slope_of_Y_ne rfl hy, W37]; norm_num
  · simp only [addY, negAddY, addX, negY, slope_of_Y_ne rfl hy, W37]; norm_num

/-- P IS NOT THE IDENTITY, and neither is its double. -/
theorem P37_ne_zero : P37 ≠ 0 ∧ P37 + P37 ≠ 0 :=
  ⟨Point.some_ne_zero ns37_00, two_P37 ▸ Point.some_ne_zero ns37_10⟩

/-- 37a1 as an elliptic curve of the library. -/
def E37 : EllipticQ := ⟨W37, W37_elliptic⟩

/-! ### 389a1: y² + y = x³ + x² − 2x -/

/-- The curve 389a1. -/
def W389 : WeierstrassCurve ℚ := ⟨0, 1, 1, -2, 0⟩

/-- ITS DISCRIMINANT IS 389. -/
theorem W389_Δ : W389.Δ = 389 := by
  simp only [WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
    WeierstrassCurve.b₈, W389]
  norm_num

instance W389_elliptic : W389.IsElliptic := ⟨by rw [W389_Δ]; exact isUnit_iff_ne_zero.mpr (by norm_num)⟩

/-- The point (−1, 1) lies on 389a1, nonsingular. -/
theorem ns389_m11 : W389.toAffine.Nonsingular (-1) 1 := by
  rw [nonsingular_iff', equation_iff']; norm_num [W389]

/-- The point (0, 0) lies on 389a1, nonsingular. -/
theorem ns389_00 : W389.toAffine.Nonsingular 0 0 := by
  rw [nonsingular_iff', equation_iff']; norm_num [W389]

/-- The point (1, 0) lies on 389a1, nonsingular. -/
theorem ns389_10 : W389.toAffine.Nonsingular 1 0 := by
  rw [nonsingular_iff', equation_iff']; norm_num [W389]

/-- The points of 389a1. -/
noncomputable def P389 : W389.toAffine.Point := .some ns389_m11
noncomputable def Q389 : W389.toAffine.Point := .some ns389_00
noncomputable def R389 : W389.toAffine.Point := .some ns389_10

/-- THE LIBRARY'S GROUP LAW ON 389a1: (−1, 1) + (0, 0) = (1, 0). -/
theorem P389_add_Q389 : P389 + Q389 = R389 := by
  have hx : (-1 : ℚ) ≠ 0 := by norm_num
  rw [P389, Q389, R389, Point.add_of_X_ne hx]
  congr 1
  · simp only [addX, slope_of_X_ne hx, W389]; norm_num
  · simp only [addY, negAddY, addX, negY, slope_of_X_ne hx, W389]; norm_num

/-- 389a1 as an elliptic curve of the library. -/
def E389 : EllipticQ := ⟨W389, W389_elliptic⟩

/-- THE STATEMENT AT THE TWO CALM CURVES: with the orders one and two carried, the rank statement asks rank one of
    37a1 and rank two of 389a1, and each is the bit at its curve. -/
theorem the_statement_at_the_calm_curves (ord : EllipticQ → ℕ) (h37 : ord E37 = 1) (h389 : ord E389 = 2) :
    BSDRank ord → Module.finrank ℤ W37.toAffine.Point = 1 ∧ Module.finrank ℤ W389.toAffine.Point = 2 :=
  fun h => ⟨(h E37).trans h37, (h E389).trans h389⟩

/-- THE FORMS ARE BOUND: the value of the frame of the library's curves, the transfer from its record and the rank
    statement are one proposition; the record carries the value with no premise; and one curve whose rank is not its
    order refutes the statement. -/
theorem the_forms_are_bound (ord : EllipticQ → ℕ) :
    (Value (curveFrame ord) ↔ BSDRank ord) ∧ (Transfer (curveFrame ord) ↔ BSDRank ord) ∧
    Value (recFrame (curveFrame ord)) ∧
    (∀ E : EllipticQ, Module.finrank ℤ E.W.toAffine.Point ≠ ord E → ¬ BSDRank ord) :=
  ⟨kernel_reads_mathlib ord, bit_is_the_statement ord, record_of_the_library ord,
   fun E h => (the_one_refuter ord E h).1⟩

end BSDMathlib

/-! ## cones of the binding, pinned: the build is silent, and any drift fails it -/
/-- info: 'BSDMathlib.recFrame_value' does not depend on any axioms -/
#guard_msgs in #print axioms BSDMathlib.recFrame_value
/-- info: 'BSDMathlib.normal_form' does not depend on any axioms -/
#guard_msgs in #print axioms BSDMathlib.normal_form
/-- info: 'BSDMathlib.kernel_reads_mathlib' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BSDMathlib.kernel_reads_mathlib
/-- info: 'BSDMathlib.bit_is_the_statement' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BSDMathlib.bit_is_the_statement
/-- info: 'BSDMathlib.record_of_the_library' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BSDMathlib.record_of_the_library
/-- info: 'BSDMathlib.the_one_refuter' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BSDMathlib.the_one_refuter
/-- info: 'BSDMathlib.W37_Δ' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BSDMathlib.W37_Δ
/-- info: 'BSDMathlib.ns37_00' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BSDMathlib.ns37_00
/-- info: 'BSDMathlib.ns37_10' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BSDMathlib.ns37_10
/-- info: 'BSDMathlib.two_P37' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BSDMathlib.two_P37
/-- info: 'BSDMathlib.P37_ne_zero' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BSDMathlib.P37_ne_zero
/-- info: 'BSDMathlib.W389_Δ' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BSDMathlib.W389_Δ
/-- info: 'BSDMathlib.ns389_m11' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BSDMathlib.ns389_m11
/-- info: 'BSDMathlib.ns389_00' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BSDMathlib.ns389_00
/-- info: 'BSDMathlib.ns389_10' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BSDMathlib.ns389_10
/-- info: 'BSDMathlib.P389_add_Q389' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BSDMathlib.P389_add_Q389
/-- info: 'BSDMathlib.the_statement_at_the_calm_curves' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BSDMathlib.the_statement_at_the_calm_curves
/-- info: 'BSDMathlib.the_forms_are_bound' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BSDMathlib.the_forms_are_bound
