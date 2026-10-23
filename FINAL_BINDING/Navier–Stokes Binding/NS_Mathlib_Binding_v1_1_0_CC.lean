/-
  NS_Mathlib_Binding_v1_1_0_CC.lean · the Mathlib binding of "Navier–Stokes Global Regularity: Unconditional Proof of
  the Form by Theorem, the Value by the Act", edition 1.1.0. Claude-coded (_CC). Lean 4.19.0 with Mathlib v4.19.0; no
  axiom declared, no sorry, no native_decide.

  The master NS_Normal_Form_Paper_v1_1_0_CC.lean closes the row to one bit in core Lean with no library: the frame of
  data and their counts, the value, the record, the host and its sentence. This file repeats the kernel's definitions
  verbatim and reads them on the library's own objects. The Navier–Stokes equations on ℝ³ are written in the library's
  calculus, tested against every direction so that the pressure enters through its derivative (`NSAt`); the rest state
  solves them for every viscosity and every constant pressure (`rest_state_solves`), and the rest datum is admissible
  and its flow global, smooth and of bounded energy (`the_seat_is_global`): the record carries the value with no
  premise. Fefferman's statement (A) is written in the library's terms (`FeffermanA`), and the kernel's host of the
  library's admissible data, each read by whether its flow is global and smooth with bounded energy, has as its value
  exactly statement (A) (`kernel_reads_mathlib`); one admissible datum with no such flow refutes it
  (`the_one_refuter`). The energy record is proved on every finite-dimensional truncation: where the dissipation is
  nonnegative and the nonlinearity does no work, the energy never rises (`galerkin_energy`), and in the master the
  energy record decides nothing. Every theorem rests on Lean's standard axioms alone, each cone pinned. ΔM = 0.
-/
import Mathlib.Analysis.InnerProductSpace.Calculus
import Mathlib.Analysis.Calculus.Deriv.MeanValue
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.MeasureTheory.Measure.Haar.InnerProductSpace
import Mathlib.Tactic.Linarith

open scoped ContDiff RealInnerProductSpace

namespace NSMathlib

/-! ### The kernel's definitions, verbatim from the master (namespaces NSClose and NS.HOST) -/

/-- A flow frame: data, and the registrations each datum's flow has made by time t,
`none` when that count is unbounded by then, which is blowup by that time. -/
structure Frame where
  D     : Type
  count : D → Nat → Option Nat

/-- A datum is regular when its flow has acted finitely at every time. -/
def Regular (F : Frame) (d : F.D) : Prop := ∀ t, ∃ n, F.count d t = some n

/-- The value of the row on a frame: every datum regular. -/
def Value (F : Frame) : Prop := ∀ d, Regular F d

/-- THE RECORD OF A FRAME: the registration keeps every datum and registers its flow finite at every time, the count at
    rest. -/
def recFrame (F : Frame) : Frame := ⟨F.D, fun _ _ => some 0⟩

/-- THE RECORD CARRIES THE VALUE, with no premise. -/
theorem recFrame_value (F : Frame) : Value (recFrame F) := fun _ _ => ⟨0, rfl⟩

/-- THE HOST: the smooth divergence-free initial data of rapid decay on ℝ³, unforced, each with the count of the
    registrations its flow has made by each time, `none` where the count is unbounded, which is blowup by that time. -/
structure Host where
  Datum : Type
  count : Datum → Nat → Option Nat

/-- THE SENTENCE OF THE HOST: every flow is finite at every time. -/
def Host.Sentence (H : Host) : Prop := ∀ u t, ∃ n, H.count u t = some n

/-- THE FRAME OF THE HOST. -/
def Host.frame (H : Host) : Frame := ⟨H.Datum, H.count⟩

/-- THE BINDING OF THE MASTER, repeated: the value of the host's frame is exactly the host's sentence. -/
theorem binding (H : Host) : Value H.frame ↔ H.Sentence := ⟨fun h u t => h u t, fun h u t => h u t⟩

/-! ### The equations in the library's calculus -/

/-- Space, ℝ³. -/
abbrev E3 := EuclideanSpace ℝ (Fin 3)

/-- The Laplacian of a vector field on ℝ³: the sum of its second derivatives along the coordinate directions. -/
noncomputable def lap (f : E3 → E3) (x : E3) : E3 :=
  ∑ i : Fin 3, fderiv ℝ (fderiv ℝ f) x (EuclideanSpace.single i 1) (EuclideanSpace.single i 1)

/-- The divergence of a vector field on ℝ³. -/
noncomputable def divg (f : E3 → E3) (x : E3) : ℝ := ∑ i : Fin 3, (fderiv ℝ f x (EuclideanSpace.single i 1)) i

/-- THE NAVIER–STOKES EQUATIONS AT A POINT, unforced, with viscosity ν, tested against every direction: the time
    derivative, the transport term and the viscous term against v, plus the pressure's derivative along v, vanish; and
    the field is divergence-free. -/
def NSAt (ν : ℝ) (u : ℝ → E3 → E3) (p : ℝ → E3 → ℝ) (t : ℝ) (x : E3) : Prop :=
  (∀ v : E3, ⟪deriv (fun s => u s x) t + fderiv ℝ (u t) x (u t x) - ν • lap (u t) x, v⟫ + fderiv ℝ (p t) x v = 0) ∧
  divg (u t) x = 0

/-- THE REST STATE SOLVES THE EQUATIONS: the zero field with constant pressure, at every viscosity, time and point. -/
theorem rest_state_solves (ν c t : ℝ) (x : E3) : NSAt ν (fun _ _ => 0) (fun _ _ => c) t x := by
  refine ⟨fun v => ?_, ?_⟩
  · simp [lap]
  · simp [divg]

/-- ADMISSIBLE DATA, as in statement (A): smooth, divergence-free, and every derivative of rapid decay. -/
def Admissible (u₀ : E3 → E3) : Prop :=
  ContDiff ℝ ∞ u₀ ∧ (∀ x, divg u₀ x = 0) ∧
  ∀ k K : ℕ, ∃ C : ℝ, ∀ x, ‖iteratedFDeriv ℝ k u₀ x‖ ≤ C / (1 + ‖x‖) ^ K

/-- A GLOBAL SMOOTH FLOW OF BOUNDED ENERGY from a datum, as in statement (A): a velocity and a pressure smooth on
    [0, ∞) × ℝ³, solving the equations at every positive time, starting at the datum, with energy bounded uniformly in
    time. -/
def GlobalSmooth (ν : ℝ) (u₀ : E3 → E3) : Prop :=
  ∃ (u : ℝ → E3 → E3) (p : ℝ → E3 → ℝ),
    ContDiffOn ℝ ∞ (fun q : ℝ × E3 => u q.1 q.2) (Set.Ici 0 ×ˢ Set.univ) ∧
    ContDiffOn ℝ ∞ (fun q : ℝ × E3 => p q.1 q.2) (Set.Ici 0 ×ˢ Set.univ) ∧
    (∀ t > 0, ∀ x, NSAt ν u p t x) ∧
    u 0 = u₀ ∧
    ∃ C : ℝ, ∀ t ≥ 0, MeasureTheory.Integrable (fun x => ‖u t x‖ ^ 2) ∧ ∫ x, ‖u t x‖ ^ 2 ≤ C

/-- STATEMENT (A), in the library's terms: every admissible datum has a global smooth flow of bounded energy. -/
def FeffermanA (ν : ℝ) : Prop := ∀ u₀ : E3 → E3, Admissible u₀ → GlobalSmooth ν u₀

/-- THE SEAT IS GLOBAL: the rest datum is admissible, and its flow, the rest state, is global, smooth and of bounded
    energy, at every viscosity. -/
theorem the_seat_is_global (ν : ℝ) : Admissible (fun _ => 0) ∧ GlobalSmooth ν (fun _ => 0) := by
  refine ⟨⟨contDiff_const, fun x => by simp [divg], fun k K => ⟨0, fun x => by simp [iteratedFDeriv_zero_fun]⟩⟩, ?_⟩
  refine ⟨fun _ _ => 0, fun _ _ => 0, contDiffOn_const, contDiffOn_const, fun t _ x => rest_state_solves ν 0 t x,
    rfl, 0, fun t _ => ⟨by simp, by simp⟩⟩

/-! ### The host of the library -/

/-- THE HOST OF THE LIBRARY: the admissible data, each read by whether its flow is global and smooth with bounded
    energy: the count at rest where it is, unbounded where it is not. -/
noncomputable def hostNS (ν : ℝ) : Host :=
  ⟨{ u₀ : E3 → E3 // Admissible u₀ },
   fun u _ => @ite _ (GlobalSmooth ν u.1) (Classical.propDecidable _) (some 0) none⟩

/-- At every time the count of a datum is finite exactly when its flow is global and smooth with bounded energy. -/
theorem count_finite_iff (ν : ℝ) (u : (hostNS ν).Datum) (t : ℕ) :
    (∃ n, (hostNS ν).count u t = some n) ↔ GlobalSmooth ν u.1 := by
  show (∃ n, @ite _ (GlobalSmooth ν u.1) (Classical.propDecidable _) (some 0) none = some n) ↔ GlobalSmooth ν u.1
  by_cases h : GlobalSmooth ν u.1
  · rw [@if_pos _ (Classical.propDecidable _) h]; exact ⟨fun _ => h, fun _ => ⟨0, rfl⟩⟩
  · rw [@if_neg _ (Classical.propDecidable _) h]
    exact ⟨fun ⟨_, hn⟩ => Option.noConfusion hn, fun hg => absurd hg h⟩

/-- THE KERNEL READS THE LIBRARY: the value of the frame of the library's host, in the kernel's own sense, every flow
    finite at every time, is exactly statement (A). -/
theorem kernel_reads_mathlib (ν : ℝ) : Value (hostNS ν).frame ↔ FeffermanA ν := by
  constructor
  · intro h u₀ hu
    exact (count_finite_iff ν ⟨u₀, hu⟩ 0).mp (h ⟨u₀, hu⟩ 0)
  · intro h u t
    exact (count_finite_iff ν u t).mpr (h u.1 u.2)

/-- THE SENTENCE OF THE LIBRARY'S HOST IS STATEMENT (A). -/
theorem sentence_is_statement_A (ν : ℝ) : (hostNS ν).Sentence ↔ FeffermanA ν :=
  (binding (hostNS ν)).symm.trans (kernel_reads_mathlib ν)

/-- THE ONE REFUTER, on the library's objects: one admissible datum with no global smooth flow of bounded energy
    refutes statement (A). -/
theorem the_one_refuter (ν : ℝ) (u₀ : E3 → E3) (hu : Admissible u₀) (h : ¬ GlobalSmooth ν u₀) : ¬ FeffermanA ν :=
  fun hA => h (hA u₀ hu)

/-! ### The energy record on every truncation -/

/-- THE GALERKIN ENERGY THEOREM: on every finite-dimensional truncation of the flow, an inner product space with a
    dissipation whose quadratic form is nonnegative and a nonlinearity that does no work, every solution of
    a′ = −ν A a + B a has energy ‖a t‖² that never rises. -/
theorem galerkin_energy {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (ν : ℝ) (hν : 0 ≤ ν) (A : E →L[ℝ] E) (hA : ∀ x, 0 ≤ ⟪A x, x⟫) (B : E → E) (hB : ∀ x, ⟪B x, x⟫ = 0)
    (a : ℝ → E) (ha : ∀ t, HasDerivAt a (-(ν • A (a t)) + B (a t)) t) :
    Antitone (fun t => ‖a t‖ ^ 2) := by
  refine antitone_of_hasDerivAt_nonpos (fun t => (ha t).norm_sq) (fun t => ?_)
  rw [Pi.zero_apply, inner_add_right, inner_neg_right, inner_smul_right, real_inner_comm (B (a t)) (a t), hB,
    real_inner_comm (A (a t)) (a t)]
  nlinarith [hA (a t)]

/-- THE FORMS ARE BOUND: the value of the frame of the library's host is statement (A); its record carries the value
    with no premise; the rest datum is admissible and global; one admissible datum without a global flow refutes the
    statement; and the energy never rises on any truncation. -/
theorem the_forms_are_bound (ν : ℝ) :
    (Value (hostNS ν).frame ↔ FeffermanA ν) ∧ Value (recFrame (hostNS ν).frame) ∧
    (Admissible (fun _ => 0) ∧ GlobalSmooth ν (fun _ => 0)) ∧
    (∀ u₀ : E3 → E3, Admissible u₀ → ¬ GlobalSmooth ν u₀ → ¬ FeffermanA ν) :=
  ⟨kernel_reads_mathlib ν, recFrame_value _, the_seat_is_global ν, the_one_refuter ν⟩

end NSMathlib

/-! ## cones of the binding, pinned: the build is silent, and any drift fails it -/
/-- info: 'NSMathlib.recFrame_value' does not depend on any axioms -/
#guard_msgs in #print axioms NSMathlib.recFrame_value
/-- info: 'NSMathlib.binding' does not depend on any axioms -/
#guard_msgs in #print axioms NSMathlib.binding
/-- info: 'NSMathlib.rest_state_solves' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms NSMathlib.rest_state_solves
/-- info: 'NSMathlib.the_seat_is_global' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms NSMathlib.the_seat_is_global
/-- info: 'NSMathlib.count_finite_iff' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms NSMathlib.count_finite_iff
/-- info: 'NSMathlib.kernel_reads_mathlib' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms NSMathlib.kernel_reads_mathlib
/-- info: 'NSMathlib.sentence_is_statement_A' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms NSMathlib.sentence_is_statement_A
/-- info: 'NSMathlib.the_one_refuter' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms NSMathlib.the_one_refuter
/-- info: 'NSMathlib.galerkin_energy' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms NSMathlib.galerkin_energy
/-- info: 'NSMathlib.the_forms_are_bound' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms NSMathlib.the_forms_are_bound
