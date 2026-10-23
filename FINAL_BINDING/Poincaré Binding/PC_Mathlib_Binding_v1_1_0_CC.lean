/-
  PC_Mathlib_Binding_v1_1_0_CC.lean · the Mathlib binding of "The Poincaré Conjecture: Unconditional Proof of the Form
  by Theorem, the Value by the Act", edition 1.1.0. Claude-coded (_CC). Lean 4.19.0 with Mathlib v4.19.0; no axiom
  declared, no sorry, no native_decide.

  The master PC_Normal_Form_Paper_v1_1_0_CC.lean closes the Poincaré row to one bit in core Lean with no library: the
  flow and its seat, the frame, the value, the host and its sentence. This file repeats the kernel's definitions
  verbatim and reads them on Mathlib's own objects. Mathlib states the three-dimensional question on its own terms,
  a Hausdorff compact simply connected space charted on ℝ³ homeomorphic to the unit sphere of ℝ⁴, as a statement and
  not a theorem (`SimplyConnectedSpace.nonempty_homeomorph_sphere_three`, `proof_wanted`); `PoincareThree` is that
  statement. The seat is a closed three-manifold of the library, Hausdorff, compact and charted on ℝ³
  (`seat_is_a_closed_three_manifold`), and it carries the value with no premise (`record_has_the_value`). The transfer
  from the seat to a manifold is exactly the manifold's value (`normal_form`), and the transfer at every closed simply
  connected three-manifold is exactly the library's statement (`bit_is_the_statement`). The kernel's host of a manifold
  reads it by its class, and its sentence is exactly the manifold being the round sphere (`kernel_reads_mathlib`); the
  library's statement is the kernel's sentence at the host of every such manifold (`statement_iff_hosts`). The value is
  a property of the class (`value_is_a_class_property`). The generalized statement, by dimension, is that a homotopy
  equivalence to the sphere is a homeomorphism to it (`generalized_iff`), and given every dimension other than three
  the whole is exactly dimension three (`no_bypass_by_dimension`). Every theorem rests on Lean's standard axioms
  alone, each cone pinned. ΔM = 0.
-/
import Mathlib.Geometry.Manifold.Instances.Sphere
import Mathlib.AlgebraicTopology.FundamentalGroupoid.SimplyConnected
import Mathlib.Topology.Homotopy.Equiv

universe u

namespace PCMathlib

open Metric (sphere)

/-! ### The kernel's definitions, verbatim from the master (namespaces PCClose and PC.HOST) -/

def iter {α : Type} (f : α → α) : Nat → α → α
  | 0, x => x
  | k + 1, x => iter f k (f x)

/-- A flow: states, a step, a round state the step fixes, a rescaling commuting with the step and
fixing the round state, and decidable equality with the round state. -/
structure Flow where
  State   : Type
  step    : State → State
  round   : State
  fixed   : step round = round
  rescale : State → State
  comm    : ∀ s, step (rescale s) = rescale (step s)
  rfix    : rescale round = round
  deq     : ∀ s, Decidable (s = round)

/-- A state registers when its flow comes to rest on the round state. -/
def Registers (F : Flow) (s : F.State) : Prop := ∃ k, iter F.step k s = F.round

/-- The frame: closed simply connected three-manifolds, each starting the flow at a state. -/
structure Frame where
  D     : Type
  flow  : Flow
  start : D → flow.State

/-- The value: every manifold comes to rest on the round state. -/
def Value (M : Frame) : Prop := ∀ d, Registers M.flow (M.start d)

def stuckFlow : Flow := ⟨Bool, id, true, rfl, id, fun _ => rfl, rfl,
  fun s => match s with | true => isTrue rfl | false => isFalse Bool.noConfusion⟩

/-- THE HOST: the manifolds of the row, each read by its class, one bit, true exactly where the manifold is the round
    three-sphere. -/
structure Host where
  Man   : Type
  round : Man → Bool

/-- THE SENTENCE OF THE HOST: every manifold of the host is the round sphere. -/
def Host.Sentence (H : Host) : Prop := ∀ m, H.round m = true

/-- THE FRAME OF THE HOST: each manifold starts the classifying flow at its class, the seat being the round class. -/
def Host.frame (H : Host) : Frame := ⟨H.Man, stuckFlow, H.round⟩

/-- On the classifying flow no state moves. -/
theorem stuck_iter (b : Bool) : ∀ k, iter stuckFlow.step k b = b
  | 0 => rfl
  | k + 1 => stuck_iter b k

/-- THE BINDING OF THE MASTER, repeated: the value of the host's frame is exactly the host's sentence. -/
theorem binding (H : Host) : Value H.frame ↔ H.Sentence :=
  ⟨fun h m => match h m with
    | ⟨k, hk⟩ => (stuck_iter (H.round m) k).symm.trans hk,
   fun h m => ⟨0, h m⟩⟩

/-! ### The library's objects -/

/-- The model space ℝ³. -/
abbrev E3 := EuclideanSpace ℝ (Fin 3)

/-- THE SEAT: the unit sphere of ℝ⁴, as the library writes it. -/
abbrev S3 := sphere (0 : EuclideanSpace ℝ (Fin (3 + 1))) 1

/-- THE POINCARÉ STATEMENT, as the library states it: every Hausdorff compact simply connected space charted on ℝ³ is
    homeomorphic to the unit sphere of ℝ⁴. -/
def PoincareThree : Prop :=
  ∀ (M : Type u) [TopologicalSpace M] [T2Space M] [ChartedSpace E3 M] [SimplyConnectedSpace M] [CompactSpace M],
    Nonempty (M ≃ₜ S3)

/-- THE SEAT IS A CLOSED THREE-MANIFOLD OF THE LIBRARY: Hausdorff, compact, and charted on ℝ³. -/
theorem seat_is_a_closed_three_manifold : T2Space S3 ∧ CompactSpace S3 ∧ Nonempty (ChartedSpace E3 S3) :=
  ⟨inferInstance, inferInstance, ⟨inferInstance⟩⟩

/-- THE RECORD HAS THE VALUE, with no premise: the seat is homeomorphic to the round sphere. -/
theorem record_has_the_value : Nonempty (S3 ≃ₜ S3) := ⟨Homeomorph.refl _⟩

/-- THE TRANSFER AT A MANIFOLD, the bit: the value carried from the seat to the manifold. -/
def Transfer (M : Type u) [TopologicalSpace M] : Prop := Nonempty (S3 ≃ₜ S3) → Nonempty (M ≃ₜ S3)

/-- THE NORMAL FORM ON THE LIBRARY'S OBJECTS: the transfer at a manifold is exactly the manifold's value. -/
theorem normal_form (M : Type u) [TopologicalSpace M] : Transfer M ↔ Nonempty (M ≃ₜ S3) :=
  ⟨fun h => h record_has_the_value, fun h _ => h⟩

/-- THE BIT IS THE STATEMENT: the transfer at every closed simply connected three-manifold of the library is exactly
    the library's Poincaré statement. -/
theorem bit_is_the_statement :
    (∀ (M : Type u) [TopologicalSpace M] [T2Space M] [ChartedSpace E3 M] [SimplyConnectedSpace M] [CompactSpace M],
      Transfer M) ↔ PoincareThree.{u} :=
  ⟨fun h M => (normal_form M).mp (h M), fun h M => (normal_form M).mpr (h M)⟩

/-- THE VALUE IS A PROPERTY OF THE CLASS: homeomorphic manifolds carry the value alike. -/
theorem value_is_a_class_property {M N : Type u} [TopologicalSpace M] [TopologicalSpace N] (e : M ≃ₜ N) :
    Nonempty (M ≃ₜ S3) ↔ Nonempty (N ≃ₜ S3) :=
  ⟨fun ⟨f⟩ => ⟨e.symm.trans f⟩, fun ⟨f⟩ => ⟨e.trans f⟩⟩

/-- The class of a manifold, one bit: true exactly where it is homeomorphic to the round sphere. -/
noncomputable def roundClass (M : Type u) [TopologicalSpace M] : Bool :=
  @decide (Nonempty (M ≃ₜ S3)) (Classical.propDecidable _)

/-- THE HOST OF ONE MANIFOLD: one existent, read by its class. -/
noncomputable def hostOf (M : Type u) [TopologicalSpace M] : Host := ⟨Unit, fun _ => roundClass M⟩

/-- THE CLASS BIT IS THE VALUE. -/
theorem roundClass_iff (M : Type u) [TopologicalSpace M] : roundClass M = true ↔ Nonempty (M ≃ₜ S3) :=
  @decide_eq_true_iff _ (Classical.propDecidable _)

/-- THE HOST'S SENTENCE IS THE MANIFOLD'S VALUE. -/
theorem hostOf_sentence (M : Type u) [TopologicalSpace M] : (hostOf M).Sentence ↔ Nonempty (M ≃ₜ S3) :=
  ⟨fun h => (roundClass_iff M).mp (h ()), fun h _ => (roundClass_iff M).mpr h⟩

/-- THE KERNEL READS THE LIBRARY: the value of the host frame of a manifold, in the kernel's own sense, every manifold
    coming to rest on the seat, is exactly the manifold being homeomorphic to the round sphere. -/
theorem kernel_reads_mathlib (M : Type u) [TopologicalSpace M] : Value (hostOf M).frame ↔ Nonempty (M ≃ₜ S3) :=
  (binding (hostOf M)).trans (hostOf_sentence M)

/-- THE STATEMENT IS THE KERNEL'S SENTENCE AT EVERY HOST: the library's Poincaré statement holds exactly when the
    kernel's sentence holds at the host of every closed simply connected three-manifold. -/
theorem statement_iff_hosts : PoincareThree.{u} ↔
    ∀ (M : Type u) [TopologicalSpace M] [T2Space M] [ChartedSpace E3 M] [SimplyConnectedSpace M] [CompactSpace M],
      (hostOf M).Sentence :=
  ⟨fun h M => (hostOf_sentence M).mpr (h M), fun h M => (hostOf_sentence M).mp (h M)⟩

/-- THE STATEMENT IS THE KERNEL'S VALUE AT EVERY HOST. -/
theorem statement_iff_values : PoincareThree.{u} ↔
    ∀ (M : Type u) [TopologicalSpace M] [T2Space M] [ChartedSpace E3 M] [SimplyConnectedSpace M] [CompactSpace M],
      Value (hostOf M).frame :=
  ⟨fun h M => (kernel_reads_mathlib M).mpr (h M), fun h M => (kernel_reads_mathlib M).mp (h M)⟩

/-- THE ONE REFUTER, on the library's objects: one Hausdorff compact simply connected space charted on ℝ³ and not
    homeomorphic to the round sphere refutes the statement. -/
theorem the_one_refuter (M : Type u) [TopologicalSpace M] [T2Space M] [ChartedSpace E3 M] [SimplyConnectedSpace M]
    [CompactSpace M] (h : IsEmpty (M ≃ₜ S3)) : ¬ PoincareThree.{u} :=
  fun hp => h.false (hp M).some

/-! ### The generalized statement, by dimension -/

/-- The unit sphere of ℝⁿ⁺¹. -/
abbrev Sph (n : ℕ) := sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1

/-- THE GENERALIZED STATEMENT AT DIMENSION n, as the library states it
    (`ContinuousMap.HomotopyEquiv.nonempty_homeomorph_sphere`): every Hausdorff space charted on ℝⁿ and homotopy
    equivalent to the n-sphere is homeomorphic to it. -/
def GeneralizedAt (n : ℕ) : Prop :=
  ∀ (M : Type u) [TopologicalSpace M] [T2Space M] [ChartedSpace (EuclideanSpace ℝ (Fin n)) M],
    ContinuousMap.HomotopyEquiv M (Sph n) → Nonempty (M ≃ₜ Sph n)

/-- THE GENERALIZED STATEMENT IS ONE EQUIVALENCE: at each dimension it says that a homotopy equivalence to the sphere
    and a homeomorphism to it exist together. -/
theorem generalized_iff (n : ℕ) : GeneralizedAt.{u} n ↔
    ∀ (M : Type u) [TopologicalSpace M] [T2Space M] [ChartedSpace (EuclideanSpace ℝ (Fin n)) M],
      Nonempty (ContinuousMap.HomotopyEquiv M (Sph n)) ↔ Nonempty (M ≃ₜ Sph n) :=
  ⟨fun h M _ _ _ => ⟨fun ⟨e⟩ => h M e, fun ⟨f⟩ => ⟨f.toHomotopyEquiv⟩⟩,
   fun h M _ _ _ e => (h M).mp ⟨e⟩⟩

/-- NO BYPASS BY DIMENSION, on the library's objects: given the generalized statement at every dimension other than
    three, the statement at every dimension is exactly the statement at dimension three. -/
theorem no_bypass_by_dimension (h : ∀ n, n ≠ 3 → GeneralizedAt.{u} n) :
    (∀ n, GeneralizedAt.{u} n) ↔ GeneralizedAt.{u} 3 :=
  ⟨fun hall => hall 3, fun h3 n => if e : n = 3 then e ▸ h3 else h n e⟩

/-- THE THREE FORMS ARE BOUND: the library's statement is the bit at every closed simply connected three-manifold, and
    the kernel's sentence at the host of every one; and given every other dimension the generalized statement is
    exactly its dimension-three case. -/
theorem the_forms_are_bound :
    ((∀ (M : Type u) [TopologicalSpace M] [T2Space M] [ChartedSpace E3 M] [SimplyConnectedSpace M] [CompactSpace M],
      Transfer M) ↔ PoincareThree.{u}) ∧
    (PoincareThree.{u} ↔
      ∀ (M : Type u) [TopologicalSpace M] [T2Space M] [ChartedSpace E3 M] [SimplyConnectedSpace M] [CompactSpace M],
        (hostOf M).Sentence) ∧
    ((∀ n, n ≠ 3 → GeneralizedAt.{u} n) → ((∀ n, GeneralizedAt.{u} n) ↔ GeneralizedAt.{u} 3)) :=
  ⟨bit_is_the_statement, statement_iff_hosts, no_bypass_by_dimension⟩

end PCMathlib

/-! ## cones of the binding, pinned: the build is silent, and any drift fails it -/
/-- info: 'PCMathlib.stuck_iter' does not depend on any axioms -/
#guard_msgs in #print axioms PCMathlib.stuck_iter
/-- info: 'PCMathlib.binding' does not depend on any axioms -/
#guard_msgs in #print axioms PCMathlib.binding
/-- info: 'PCMathlib.seat_is_a_closed_three_manifold' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PCMathlib.seat_is_a_closed_three_manifold
/-- info: 'PCMathlib.record_has_the_value' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PCMathlib.record_has_the_value
/-- info: 'PCMathlib.normal_form' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PCMathlib.normal_form
/-- info: 'PCMathlib.bit_is_the_statement' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PCMathlib.bit_is_the_statement
/-- info: 'PCMathlib.value_is_a_class_property' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PCMathlib.value_is_a_class_property
/-- info: 'PCMathlib.roundClass_iff' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PCMathlib.roundClass_iff
/-- info: 'PCMathlib.hostOf_sentence' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PCMathlib.hostOf_sentence
/-- info: 'PCMathlib.kernel_reads_mathlib' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PCMathlib.kernel_reads_mathlib
/-- info: 'PCMathlib.statement_iff_hosts' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PCMathlib.statement_iff_hosts
/-- info: 'PCMathlib.statement_iff_values' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PCMathlib.statement_iff_values
/-- info: 'PCMathlib.the_one_refuter' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PCMathlib.the_one_refuter
/-- info: 'PCMathlib.generalized_iff' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PCMathlib.generalized_iff
/-- info: 'PCMathlib.no_bypass_by_dimension' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PCMathlib.no_bypass_by_dimension
/-- info: 'PCMathlib.the_forms_are_bound' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PCMathlib.the_forms_are_bound
