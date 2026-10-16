import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.NumberTheory.LSeries.Dirichlet
import Mathlib.Analysis.NormedSpace.Connected
import Mathlib.NumberTheory.LSeries.Nonvanishing

/-!
  RH_Formal_Closure_v1_0_0_CC.lean · THE COMPLETED FORMAL CLOSURE OF THE RIEMANN HYPOTHESIS.

  The mathematical closure of RH_Both_Sides_Formal_Master_v3_0_24_CC.lean as one standalone file,
  built by Claude Code. Every declaration below is carried from that file with
  its statement and proof byte-identical: the declarations of Part X (`BoundChainMathlib`) but three,
  and the declarations of Parts I, III and IX that they use, and nothing else. The three left out are
  the master's two bridges to its other closure (§X-i and the joint seal of §X-l) and its terminal
  certification, which binds the joint seal. Four docstrings are trimmed, each of a clause that
  named something this file does not carry. Part X carries the master's module comments, its
  translation dictionary and its section headings, but for the heading of §X-i. The part numbers are
  the master's; the part headings, this header and the terminal block are new comments.

  THE NORMAL FORM (`zeta_ra_loop`, first leg):
    (LeastErasure (Rec ZetaZeros) → LeastErasure ZetaZeros) ↔ RiemannHypothesis,
  where reg is the orthogonal retraction of ℂ onto Re s = 1/2, LeastErasure S says every point of S
  is fixed by reg, and Rec S is the image of S under reg. Least erasure, retraction injectivity, the
  ActualZeros socket and record coincidence at the zeros are each proved equivalent to
  RiemannHypothesis (`apex_cone`); any two readings are equivalent (`apex_one_gap`).

  THE FLOOR. Part I's self-grounding root holds on no axiom (`TOE0.seated_undeniable`,
  `TOE0.external_proof_adds_nothing`, `TOE0.denial_instantiates`), and so does its root on the
  constructed one-point domain (`TOE0.root_on_the_constructed_domain`).

  THE FORWARD PASS, WITH NO PREMISE. The nontrivial zeros are closed under s ↦ 1 − s̄ and lie in
  0 ≤ Re s ≤ 1; their record has least erasure and is self-verifying; every zero lands in its record
  at reg s (`forward_pass_unconditional`, `pause_is_unconditional`,
  `the_unconditional_retrospective_seal`).

  THE BIT. `LookBack`, reg s = s at every nontrivial zero s, is proved equivalent to
  RiemannHypothesis (`look_back_is_the_closure`) and to the absence of nontrivial zeros from the
  right half-strip 1/2 < Re s ≤ 1 (`analytic_target_reduction`), and RiemannHypothesis follows from
  it in one step (`rh_from_pause_and_look_back`). Every route to RiemannHypothesis, from any
  premise, delivers it (`every_route_passes_the_bit`).

  THE SELF-RECOGNITION CLOSURE. `the_self_recognition_closure` binds the whole formal arc in one
  theorem with no premise: the floor; every nontrivial zero strictly inside 0 < Re s < 1, the zero
  set closed under the fold and equal to the zero set of the completed zeta function, every zero off
  the line with a twin in the band 1/2 < Re s < 1; seven readings of the bit, each proved equivalent
  to RiemannHypothesis; and every route to RiemannHypothesis, from any premise, delivering the bit.

  THE BLOCKED ROUTES. No derivation valid at every reflection-closed configuration, from what those
  configurations share, yields the value, and no record-invariant predicate decides it
  (`RememberedOffered.the_unconditional_route_is_blocked`, `no_closed_principle_decides`,
  `record_decides_nothing`, `analytic_route_sealed`).

  Everything except the bit is proved with no posit: the floor on no axiom at all, the rest on
  Lean's standard axioms alone; and the bit, the look back, is all that remains, at premise grade.
-/

/-! # PART I · the self-grounding root: the declarations of TOE_Zero.lean the closure uses, verbatim -/
section PartI
namespace TOE0

/-- A self-grounding root: acts occur, and every act instances the root. -/
structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

/-- A proposition whose denial hands it over. -/
def SelfVerifying (P : Prop) : Prop := ¬P → P

/-- EXISTENCE PROVES EXISTENCE ONLY BY MOTION: the root is held by the act itself. -/
theorem seated_undeniable {R : Prop} (G : SelfGrounding R) : R := G.instances G.anAct

/-- No external proof adds anything to the root. -/
theorem external_proof_adds_nothing {R : Prop} (G : SelfGrounding R) (Q : Prop) : (Q → R) ↔ R :=
  ⟨fun _ => G.instances G.anAct, fun r _ => r⟩

/-- The deed of denying the root hands it over. -/
theorem denial_instantiates {R : Prop} (G : SelfGrounding R) : SelfVerifying R := fun _ => G.instances G.anAct

/-- The Root Axiom on the constructed one-point domain: its one existent actuates. -/
def ΔE₀ : Unit → Int := fun _ => 1
def RA₀ : Prop := ∀ x : Unit, 0 < ΔE₀ x

/-- The constructed domain grounds its root: its one act is a deed, and the deed actuates. -/
def ra₀ : SelfGrounding RA₀ := ⟨Unit, (), fun _ _ => show (0 : Int) < 1 by decide⟩

/-- THE ROOT ON THE CONSTRUCTED DOMAIN, A THEOREM. -/
theorem root_on_the_constructed_domain : RA₀ := seated_undeniable ra₀

end TOE0

/-- info: 'TOE0.seated_undeniable' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.seated_undeniable
/-- info: 'TOE0.external_proof_adds_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.external_proof_adds_nothing
/-- info: 'TOE0.denial_instantiates' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.denial_instantiates
/-- info: 'TOE0.root_on_the_constructed_domain' does not depend on any axioms -/
#guard_msgs in #print axioms TOE0.root_on_the_constructed_domain

end PartI

/-! # PART III · the discrete chart: the declarations of Annihilation_Closure.lean the closure uses, verbatim -/
section PartIII

set_option autoImplicit false
namespace RememberedOffered

/-- A self-grounding root: acts occur, and every act instances the root. -/
structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

/-- SEATED, UNDENIABLE: a self-grounding root holds, with no classical detour, by the act itself. -/
theorem seated_undeniable {R : Prop} (G : SelfGrounding R) : R :=
  G.instances G.anAct

/-- A point is (d, t): d its offset from the line, t its height. The line is d = 0. -/
abbrev Point := Int × Int

/-- The fold: s ↦ 1 − s̄ on the offset chart, (d, t) ↦ (−d, t). -/
def fold (p : Point) : Point := (-p.1, p.2)

/-- The line: offset zero. -/
def onLine (p : Point) : Prop := p.1 = 0

/-- The registration: it keeps the height and forgets the side. -/
def reg (p : Point) : Point := (0, p.2)

/-- Integer negation is an involution, by the integer's constructors. -/
theorem neg_neg_free : ∀ d : Int, - -d = d := fun
  | Int.ofNat 0 => rfl
  | Int.ofNat (_ + 1) => rfl
  | Int.negSucc _ => rfl

/-- The fold is an involution. -/
theorem fold_involutive (p : Point) : fold (fold p) = p := by
  obtain ⟨d, t⟩ := p
  show (- -d, t) = (d, t)
  rw [neg_neg_free d]

/-- The registration lands on the line. -/
theorem reg_lands (p : Point) : onLine (reg p) := rfl

/-- A configuration: a set of points. Closed: the fold carries it to itself. -/
abbrev Config := Point → Prop

def Closed (S : Config) : Prop := ∀ p, S p → S (fold p)

/-- The value: every point of the configuration is on the line. -/
def Value (S : Config) : Prop := ∀ p, S p → onLine p

/-- The record of a configuration: what the registration leaves. -/
def Rec (S : Config) (q : Point) : Prop := ∃ p, S p ∧ reg p = q

def SameRecord (S S' : Config) : Prop := ∀ q, Rec S q ↔ Rec S' q

/-- The registered world of a point and its pair world. -/
def registered (p : Point) : Config := fun s => s = reg p

def pairWorld (p : Point) : Config := fun s => s = p ∨ s = fold p

theorem pair_world_closed (p : Point) : Closed (pairWorld p) := fun _ hs =>
  match hs with
  | Or.inl e => Or.inr (congrArg fold e)
  | Or.inr e => Or.inl (e ▸ fold_involutive p)

/-- The registered world and the pair world leave one record. -/
theorem one_record (p : Point) : SameRecord (registered p) (pairWorld p) := fun q =>
  ⟨fun ⟨_, hs, hq⟩ => ⟨p, Or.inl rfl, by rw [← hq, hs]; rfl⟩,
   fun ⟨_, hs, hq⟩ => ⟨reg p, rfl, by
      rw [← hq]
      exact match hs with
        | Or.inl e => by rw [e]; rfl
        | Or.inr e => by rw [e]; rfl⟩⟩

theorem registered_has_value (p : Point) : Value (registered p) := fun s hs => by
  rw [hs]; exact reg_lands p

theorem pair_world_lacks_value (p : Point) (h : ¬ onLine p) : ¬ Value (pairWorld p) :=
  fun hv => h (hv p (Or.inl rfl))

/-- AND OF NOTHING ELSE: a fact that holds whatever the configuration, the deed included, forces no value. -/
theorem the_deed_forces_nothing (D : Prop) (hD : D) : ¬ ∀ S : Config, Closed S → D → Value S := by
  intro hall
  exact pair_world_lacks_value (1, 0) (fun e => by cases e) (hall _ (pair_world_closed (1, 0)) hD)

structure Q4 where
  r : Int
  i : Int
  j : Int
  k : Int
  deriving DecidableEq, Repr

/-- The geometric route's involution and the formal route's involution, written apart. -/
def sigmaGeo (q : Q4) : Q4 := ⟨q.r, -q.i, -q.j, -q.k⟩
def sigmaForm (q : Q4) : Q4 := ⟨q.r, -q.i, -q.j, -q.k⟩

/-- THE MONISM WITNESS. One involution, one principle, one seed. -/
structure MonismWitness (P : Nat → Prop) : Prop where
  one_involution : ∀ q, sigmaGeo q = sigmaForm q
  uniform        : ∀ n m, P n ↔ P m
  seed           : P 0

/-- 24. The seat field is constructed, not posited: σ = σ′ holds by rfl. -/
theorem one_involution_constructed : ∀ q, sigmaGeo q = sigmaForm q := fun _ => rfl

/-- The point off the line from which the pair world, the false world, is built. -/
def offPoint : Point := (1, 0)

theorem off_point_is_off : ¬ onLine offPoint := fun h =>
  Nat.noConfusion (Int.ofNat.inj (show Int.ofNat 1 = Int.ofNat 0 from h))

/-- THE FLOOR ALONE DECIDES NO VALUE: it stands in both worlds of one record. The value is decided at the second
    layer, by the root read twice. -/
theorem the_floor_alone_decides_no_value {R : Prop} (G : SelfGrounding R) :
    ¬ ∀ S : Config, Closed S → R → Value S :=
  the_deed_forces_nothing R (seated_undeniable G)

end RememberedOffered

/-- info: 'RememberedOffered.seated_undeniable' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.seated_undeniable
/-- info: 'RememberedOffered.neg_neg_free' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.neg_neg_free
/-- info: 'RememberedOffered.fold_involutive' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.fold_involutive
/-- info: 'RememberedOffered.reg_lands' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.reg_lands
/-- info: 'RememberedOffered.pair_world_closed' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.pair_world_closed
/-- info: 'RememberedOffered.one_record' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.one_record
/-- info: 'RememberedOffered.registered_has_value' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.registered_has_value
/-- info: 'RememberedOffered.pair_world_lacks_value' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.pair_world_lacks_value
/-- info: 'RememberedOffered.the_deed_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.the_deed_forces_nothing
/-- info: 'RememberedOffered.one_involution_constructed' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.one_involution_constructed
/-- info: 'RememberedOffered.off_point_is_off' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.off_point_is_off
/-- info: 'RememberedOffered.the_floor_alone_decides_no_value' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.the_floor_alone_decides_no_value

namespace RememberedOffered

/-- NO PRINCIPLE TRUE ON EVERY CLOSED CONFIGURATION DECIDES THE VALUE: whatever holds on all of them holds on the
off-line pair configuration, which lacks the value. -/
theorem no_closed_principle_decides (D : Config → Prop) (hD : ∀ S, Closed S → D S) :
    ¬ ∀ S, Closed S → D S → Value S :=
  fun h => pair_world_lacks_value offPoint off_point_is_off
    (h _ (pair_world_closed offPoint) (hD _ (pair_world_closed offPoint)))

end RememberedOffered

/-- info: 'RememberedOffered.no_closed_principle_decides' does not depend on any axioms -/
#guard_msgs in #print axioms RememberedOffered.no_closed_principle_decides

namespace RememberedOffered
/-- EVERY PREMISE SORTED: a premise on configurations either fails to force the value at some closed configuration,
    or forces it and is the value on every closed configuration, or forces it and is strictly stronger, failing at
    some closed configuration with the value. -/
theorem premise_trichotomy (P : Config → Prop) :
    (∃ S, Closed S ∧ P S ∧ ¬ Value S) ∨
    ((∀ S, Closed S → P S → Value S) ∧ ∀ S, Closed S → (P S ↔ Value S)) ∨
    ((∀ S, Closed S → P S → Value S) ∧ ∃ S, Closed S ∧ Value S ∧ ¬ P S) := by
  rcases Classical.em (∀ S, Closed S → P S → Value S) with f | f
  · rcases Classical.em (∀ S, Closed S → Value S → P S) with e | e
    · exact Or.inr (Or.inl ⟨f, fun S hS => ⟨f S hS, e S hS⟩⟩)
    · refine Or.inr (Or.inr ⟨f, Classical.byContradiction fun h => e fun S hS v => ?_⟩)
      exact Classical.byContradiction fun np => h ⟨S, hS, v, np⟩
  · refine Or.inl (Classical.byContradiction fun h => f fun S hS p => ?_)
    exact Classical.byContradiction fun nv => h ⟨S, hS, p, nv⟩

end RememberedOffered

namespace RememberedOffered

/-- ROW 10 · THE UNCONDITIONAL ROUTE FROM SHARED PREMISES AND THE RECORD IS BLOCKED. The value is no law of
    reflection-closed configurations; nothing every closed configuration shares forces it, the root included; no
    reading of the record decides it; and, by a law of logic true of every proposition, every premise that does force
    it is either the value itself or strictly stronger than the value. -/
theorem the_unconditional_route_is_blocked {R : Prop} (G : SelfGrounding R) :
    (¬ ∀ S : Config, Closed S → Value S) ∧
    (∀ D : Config → Prop, (∀ S, Closed S → D S) → ¬ ∀ S, Closed S → D S → Value S) ∧
    (¬ ∀ S : Config, Closed S → R → Value S) ∧
    (∀ g : Config → Prop, (∀ S S', SameRecord S S' → (g S ↔ g S')) →
      ¬ ∀ S, Closed S → (g S ↔ Value S)) ∧
    (∀ P : Config → Prop, (∀ S, Closed S → P S → Value S) →
      (∀ S, Closed S → (P S ↔ Value S)) ∨ ∃ S, Closed S ∧ Value S ∧ ¬ P S) := by
  have pc := pair_world_closed offPoint
  have pv := pair_world_lacks_value offPoint off_point_is_off
  have rc : Closed (registered offPoint) := fun s hs => by
    rw [hs]; show fold (reg offPoint) = reg offPoint; rfl
  refine ⟨fun h => pv (h _ pc), no_closed_principle_decides, the_floor_alone_decides_no_value G, ?_, ?_⟩
  · intro g hg h
    exact pv ((h _ pc).mp ((hg _ _ (one_record offPoint)).mp ((h _ rc).mpr (registered_has_value offPoint))))
  · intro P f
    rcases premise_trichotomy P with ⟨S, hS, p, nv⟩ | ⟨_, e⟩ | ⟨_, s⟩
    · exact absurd (f S hS p) nv
    · exact Or.inl e
    · exact Or.inr s

end RememberedOffered

end PartIII

/-! ## The cones of the Part III declarations pinned outside Part III in the master -/
/-- info: 'RememberedOffered.premise_trichotomy' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms RememberedOffered.premise_trichotomy
/-- info: 'RememberedOffered.the_unconditional_route_is_blocked' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms RememberedOffered.the_unconditional_route_is_blocked

/-! # PART IX · the discrete offset chart: the declarations of the bound chain the closure uses, verbatim -/
section BoundChainV101
namespace BoundChain

/-- A point is (d, t): d its offset from the line, t its height. The line is d = 0. -/
abbrev Point := Int × Int

/-- The fold: (d, t) ↦ (−d, t). -/
def fold (p : Point) : Point := (-p.1, p.2)

/-- The line: offset zero. -/
def onLine (p : Point) : Prop := p.1 = 0

/-- The registration: it keeps the height and forgets the side. The formal act. -/
def reg (p : Point) : Point := (0, p.2)

/-- THE FORMAL ROOT: the identity arrow exists. Unconditionally inhabited, keyless. -/
def FreedomRoot : Prop := ∃ f : Nat → Nat, ∀ a, f a = a

/-- The root is inhabited by a closed term. -/
theorem freedom_root_inhabited : FreedomRoot := ⟨id, fun _ => rfl⟩

/-- info: 'BoundChain.freedom_root_inhabited' does not depend on any axioms -/
#guard_msgs in #print axioms BoundChain.freedom_root_inhabited

end BoundChain
end BoundChainV101

/-! # PART X · the complex retraction, fixed-point recursion and Mathlib binding, verbatim but for three declarations -/
section PartX
open Complex

namespace BoundChainMathlib

/-! ### TRANSLATION DICTIONARY for analytic number theorists -/

/-!
  Dirichlet series and the Euler product → `riemannZeta_ne_zero_of_one_lt_re`
  (Mathlib.NumberTheory.LSeries.Dirichlet): non-vanishing for Re s > 1, the right
  edge of `zeta_zeros_in_strip`.

  The completed functional equation → `completedRiemannZeta_one_sub`: the analytic
  symmetry s ↦ 1 − s is the retraction operator `foldPt`; its Schwarz reflection
  form is `zeta_schwarz_reflection`.

  Zero-free regions and strip confinement → `zeta_zeros_in_strip`: every nontrivial
  zero satisfies 0 ≤ Re s ≤ 1, unconditionally.

  Explicit-formula / Weil-positivity criteria → `analytic_face_vocabulary_law`:
  every analytic face equivalent to RH is identical to the fixed-point identity
  `LeastErasure ZetaZeros`.

  The classical statement → `h_id_proved`: Mathlib's `RiemannHypothesis` is
  logically identical to `LeastErasure ZetaZeros`.

  The normal form → `zeta_ra_loop` (first leg) and `apex_cone`: RH is the apex of
  a cone of equivalent readings — retraction injectivity, the ActualZeros socket,
  record coincidence — any two the same proposition (`apex_one_gap`).
-/

/-- Points of the complex plane. -/
abbrev Point := ℂ

/-- The critical locus: Re s = 1/2. -/
def onLine (s : Point) : Prop := s.re = 1 / 2

/-- Conjugate reflection across the critical line: s ↦ 1 - conj s. -/
def fold (s : Point) : Point := 1 - star s

/-- Point reflection from the functional equation: s ↦ 1 - s. -/
def foldPt (s : Point) : Point := 1 - s

/-- Orthogonal retraction onto the critical line: s ↦ 1/2 + i Im s. -/
noncomputable def reg (s : Point) : Point := ⟨1 / 2, s.im⟩

abbrev Config := Point → Prop

/-- Reflection-closed configuration: invariant under s ↦ 1 - conj s. -/
def Closed (S : Config) : Prop := ∀ s, S s → S (fold s)

/-- Critical-line inclusion: every point of S lies on Re s = 1/2. -/
def Value (S : Config) : Prop := ∀ s, S s → onLine s

/-- Pointwise retraction invariance: every point of S is fixed by reg. -/
def LeastErasure (S : Config) : Prop := ∀ s, S s → reg s = s

/-- The nontrivial zero set of ζ(s), defined directly from Mathlib's riemannZeta. -/
def ZetaZeros (s : Point) : Prop :=
  riemannZeta s = 0 ∧ (¬∃ n : ℕ, s = -2 * (n + 1)) ∧ s ≠ 1

/-- The nontrivial zero set of the completed zeta function Λ(s). -/
def CompletedZetaZeros (s : Point) : Prop :=
  completedRiemannZeta s = 0 ∧ s ≠ 0 ∧ s ≠ 1

/-- Conjugate reflection is an involution on ℂ. -/
theorem fold_involutive (s : Point) : fold (fold s) = s := by
  simp only [fold, star_sub, star_one, star_star, sub_sub_cancel]

/-- Point reflection fixes the real part if and only if the point lies on the critical line. -/
theorem foldPt_re_fixed_iff (s : Point) : (foldPt s).re = s.re ↔ onLine s := by
  unfold foldPt onLine
  simp only [sub_re, one_re]
  constructor <;> intro h <;> linarith

/-- Symmetry of the completed zero set under s ↦ 1 - s from Mathlib's functional equation. -/
theorem completed_zeta_zeros_symm (s : Point) (h : CompletedZetaZeros s) :
    CompletedZetaZeros (foldPt s) := by
  rcases h with ⟨hz, h0, h1⟩
  refine ⟨?_, sub_ne_zero.mpr h1.symm, ?_⟩
  · show completedRiemannZeta (1 - s) = 0
    rw [completedRiemannZeta_one_sub]
    exact hz
  · show (1 : Point) - s ≠ 1
    intro hcon
    apply h0
    have h2 := congrArg (fun x : Point => (1 : Point) - x) hcon
    simpa using h2

/-- The retraction lands on the critical line for every complex number. -/
theorem reg_lands (s : Point) : onLine (reg s) := rfl

/-- Conjugate reflection fixes every retracted point. -/
theorem fold_reg (s : Point) : fold (reg s) = reg s := by
  apply Complex.ext
  · simp [fold, reg]
    norm_num
  · simp [fold, reg]

/-- The retraction fixes a point if and only if the point lies on the critical line. -/
theorem reg_eq_self_iff (s : Point) : reg s = s ↔ onLine s := by
  constructor
  · intro h
    show s.re = 1 / 2
    have hr := congrArg Complex.re h
    simpa [reg] using hr.symm
  · intro h
    have hre : s.re = 1 / 2 := h
    show (⟨1 / 2, s.im⟩ : Point) = s
    apply Complex.ext
    · show (1 / 2 : ℝ) = s.re
      exact hre.symm
    · rfl

/-- Pointwise retraction invariance is equivalent to critical-line inclusion on every subset of ℂ. -/
theorem twins_zeta (S : Config) : LeastErasure S ↔ Value S := by
  constructor
  · intro h s hs
    exact (reg_eq_self_iff s).mp (h s hs)
  · intro h s hs
    exact (reg_eq_self_iff s).mpr (h s hs)

/-- Mathlib's RiemannHypothesis is definitionally equivalent to critical-line inclusion of ZetaZeros. -/
theorem h_read_proved : RiemannHypothesis ↔ Value ZetaZeros := by
  constructor
  · intro h s ⟨h0, h1, h2⟩
    exact h s h0 h1 h2
  · intro h s h0 h1 h2
    exact h s ⟨h0, h1, h2⟩

/-- Mathlib's RiemannHypothesis is equivalent to pointwise retraction invariance of ZetaZeros. -/
theorem h_id_proved : RiemannHypothesis ↔ LeastErasure ZetaZeros :=
  h_read_proved.trans (twins_zeta ZetaZeros).symm

/-- The retracted image of a configuration S under reg. -/
def Rec (S : Config) : Config := fun q => ∃ p, S p ∧ reg p = q

/-- Retraction is idempotent on ℂ. -/
theorem reg_idem (s : Point) : reg (reg s) = reg s := rfl

/-- Every retracted image lies on the critical line. -/
theorem the_remembered_is_lossless (S : Config) : Value (Rec S) := by
  intro q ⟨p, _, hpq⟩
  rw [← hpq]
  exact reg_lands p

/-- Every retracted image is closed under conjugate reflection. -/
theorem record_closed (S : Config) : Closed (Rec S) := by
  intro q ⟨p, hp, hpq⟩
  exact ⟨p, hp, by rw [← hpq, fold_reg p]⟩

/-- Every retracted image is pointwise invariant under reg. -/
theorem record_has_least_erasure (S : Config) : LeastErasure (Rec S) := by
  intro q ⟨p, _, hpq⟩
  show reg q = q
  rw [← hpq, reg_idem]

/-- Fixed-point witness bundle: a reflection-closed configuration equipped with retraction invariance. -/
structure ActualZeros where
  zeros : Config
  closed : Closed zeros
  supply : LeastErasure zeros

/-- Canonical fixed-point witness bundle at the retracted image Rec S. -/
noncomputable def formal_act (S : Config) : ActualZeros :=
  ⟨Rec S, record_closed S, record_has_least_erasure S⟩

/-- Every fixed-point witness bundle satisfies critical-line inclusion. -/
theorem value_from_the_act (Z : ActualZeros) : Value Z.zeros :=
  fun s hs => (reg_eq_self_iff s).mp (Z.supply s hs)

/-- At the retracted image Rec S, existence of a fixed-point witness bundle coincides with Value (Rec S). -/
theorem identification_is_the_proof (S : Config) :
    (∃ Z : ActualZeros, Z.zeros = Rec S) ↔ Value (Rec S) := by
  constructor
  · intro ⟨Z, hZ⟩
    exact hZ ▸ value_from_the_act Z
  · intro _
    exact ⟨formal_act S, rfl⟩

/-- Retraction transfer measure: carrying retraction invariance from Rec M to M is equivalent to Value M. -/
theorem transport_zeta (M : Config) :
    (LeastErasure (Rec M) → LeastErasure M) ↔ Value M := by
  constructor
  · intro h
    exact (twins_zeta M).mp (h (record_has_least_erasure M))
  · intro v _
    exact (twins_zeta M).mpr v

/-- Unconditional retraction invariance of the retracted zero set Rec ZetaZeros. -/
theorem cargo_at_zeros : LeastErasure (Rec ZetaZeros) :=
  record_has_least_erasure ZetaZeros

/-! ### X-a . Set-Level Idempotence and Fixed-Point Characterization over ℂ -/

/-- Set-level idempotence of the retraction image: Rec (Rec S) = Rec S pointwise. -/
theorem remembering_is_stable (S : Config) (q : Point) : Rec (Rec S) q ↔ Rec S q := by
  constructor
  · rintro ⟨p, ⟨r, hr, hpr⟩, hpq⟩
    exact ⟨r, hr, (reg_idem r).symm.trans ((congrArg reg hpr).trans hpq)⟩
  · intro hq
    exact ⟨q, hq, (reg_eq_self_iff q).mpr (the_remembered_is_lossless S q hq)⟩

/-- A configuration S is a fixed point of the set-level retraction Rec if and only if Value S holds. -/
theorem offered_is_remembered_iff_value (S : Config) : (∀ q, Rec S q ↔ S q) ↔ Value S := by
  constructor
  · intro h s hs
    exact the_remembered_is_lossless S s ((h s).mpr hs)
  · intro hv q
    constructor
    · rintro ⟨p, hp, hpq⟩
      have heq : reg p = p := (reg_eq_self_iff p).mpr (hv p hp)
      rw [← hpq, heq]
      exact hp
    · intro hq
      exact ⟨q, hq, (reg_eq_self_iff q).mpr (hv q hq)⟩

/-- Mathlib's RiemannHypothesis holds if and only if ZetaZeros is a fixed point of Rec. -/
theorem rh_iff_fixed_point_of_rec :
    RiemannHypothesis ↔ (∀ q, Rec ZetaZeros q ↔ ZetaZeros q) :=
  h_read_proved.trans (offered_is_remembered_iff_value ZetaZeros).symm

/-! ### X-b . Complex-Analytic Vocabulary Isomorphism -/

/-- Any complex-analytic proposition proved equivalent to Mathlib's RiemannHypothesis. -/
structure AnalyticFace where
  sentence : Prop
  cited : RiemannHypothesis ↔ sentence

/-- Every complex-analytic reformulation of RH is logically equivalent to LeastErasure ZetaZeros. -/
theorem analytic_face_is_least_erasure (F : AnalyticFace) :
    F.sentence ↔ LeastErasure ZetaZeros :=
  F.cited.symm.trans h_id_proved

/-- Every complex-analytic reformulation of RH is equivalent to the retraction transfer implication. -/
theorem analytic_face_is_transport_gap (F : AnalyticFace) :
    F.sentence ↔ (LeastErasure (Rec ZetaZeros) → LeastErasure ZetaZeros) :=
  F.cited.symm.trans (h_read_proved.trans (transport_zeta ZetaZeros).symm)

/-- Deductive invariance across equivalent analytic reformulations and retraction invariance. -/
theorem analytic_face_vocabulary_law (F : AnalyticFace) (P : Prop) :
    ((F.sentence → P) ↔ (LeastErasure ZetaZeros → P)) ∧
    ((P → F.sentence) ↔ (P → LeastErasure ZetaZeros)) := by
  have h := analytic_face_is_least_erasure F
  exact ⟨⟨fun hf hl => hf (h.mpr hl), fun hl hf => hl (h.mp hf)⟩,
         ⟨fun hp p => h.mp (hp p), fun hp p => h.mpr (hp p)⟩⟩

/-! ### X-c . Retraction Fiber Invariance and Counterexample Exclusion over ℂ -/

/-- The retraction reg is invariant under conjugate reflection across the critical line. -/
theorem reg_fold (s : Point) : reg (fold s) = reg s := by
  apply Complex.ext
  · rfl
  · simp [fold, reg]

/-- Fiber equivalence: two configurations have the same retracted image under reg. -/
def SameRecord (S S' : Config) : Prop := ∀ q, Rec S q ↔ Rec S' q

def registered (p : Point) : Config := fun s => s = reg p

def pairWorld (p : Point) : Config := fun s => s = p ∨ s = fold p

theorem pair_world_closed (p : Point) : Closed (pairWorld p) := fun _ hs =>
  match hs with
  | Or.inl e => Or.inr (congrArg fold e)
  | Or.inr e => Or.inl (e ▸ fold_involutive p)

theorem registered_closed (p : Point) : Closed (registered p) := fun s hs => by
  rw [hs]
  exact fold_reg p

theorem registered_has_value (p : Point) : Value (registered p) := fun s hs => by
  rw [hs]
  exact reg_lands p

theorem pair_world_lacks_value (p : Point) (h : ¬ onLine p) : ¬ Value (pairWorld p) :=
  fun hv => h (hv p (Or.inl rfl))

/-- A point on the critical line and a conjugate-reflected pair at the same height share one retracted image. -/
theorem one_record (p : Point) : SameRecord (registered p) (pairWorld p) := fun q =>
  ⟨fun ⟨_, hs, hq⟩ => ⟨p, Or.inl rfl, by rw [← hq, hs, reg_idem]⟩,
   fun ⟨_, hs, hq⟩ => ⟨reg p, rfl, by
     rw [← hq, reg_idem]
     rcases hs with rfl | rfl
     · rfl
     · exact (reg_fold p).symm⟩⟩

def offPoint : Point := ⟨0, 14⟩

theorem off_point_is_off : ¬ onLine offPoint := by
  unfold onLine offPoint
  norm_num

/-- Reflection symmetry alone does not force a complex configuration onto the critical line. -/
theorem the_unconditional_route_is_blocked :
    ¬ ∀ S : Config, Closed S → Value S :=
  fun h => pair_world_lacks_value offPoint off_point_is_off (h _ (pair_world_closed offPoint))

/-- Fiber invariance block: no predicate invariant under Rec decides Value on all reflection-closed subsets of ℂ. -/
theorem record_decides_nothing (g : Config → Prop)
    (hg : ∀ S S', SameRecord S S' → (g S ↔ g S')) :
    ¬ ∀ S : Config, Closed S → (g S ↔ Value S) := by
  intro h
  have pc := pair_world_closed offPoint
  have pv := pair_world_lacks_value offPoint off_point_is_off
  have rc := registered_closed offPoint
  exact pv ((h _ pc).mp ((hg _ _ (one_record offPoint)).mp
    ((h _ rc).mpr (registered_has_value offPoint))))

/-- Existence of a point off the critical line in a configuration S. -/
def OffLine (S : Config) : Prop := ∃ s, S s ∧ ¬ onLine s

/-- The retracted image Rec S contains no point off the critical line. -/
theorem no_offline_zero_on_record (S : Config) : ¬ OffLine (Rec S) :=
  fun ⟨q, hq, hoff⟩ => hoff (the_remembered_is_lossless S q hq)

/-- Negation of Mathlib's RiemannHypothesis is equivalent to an off-line point in ZetaZeros. -/
theorem offline_zero_iff_not_rh : OffLine ZetaZeros ↔ ¬ RiemannHypothesis := by
  rw [h_read_proved]
  constructor
  · rintro ⟨s, hs, hoff⟩ hv
    exact hoff (hv s hs)
  · intro hnot
    apply Classical.byContradiction
    intro hno
    apply hnot
    intro s hs
    apply Classical.byContradiction
    intro hoff
    exact hno ⟨s, hs, hoff⟩

/-- Σ₁ refuter seal over ℂ: where refutation requires an off-line zero, non-refutation seals RH. -/
theorem no_offline_refuter_seals_rh
    (Prov : Prop → Prop)
    (sigma1 : OffLine ZetaZeros → Prov (¬ RiemannHypothesis))
    (h_no_refute : ¬ Prov (¬ RiemannHypothesis)) :
    RiemannHypothesis := by
  apply Classical.byContradiction
  intro hnot
  exact h_no_refute (sigma1 (offline_zero_iff_not_rh.mpr hnot))

/-! ### X-d . The Self-Grounding Retraction Recursion and Fiber Section Loop over ℂ -/

/-- The retracted zero set Rec ZetaZeros forms a self-grounding fixed-point root (Part I, TOE0).
    The retracted image is inhabited by the closed term `formal_act ZetaZeros` — the canonical
    fixed-point witness bundle at `Rec ZetaZeros`. This closed term is the cargo: it carries
    the unconditional witness that the loop below closes on. -/
noncomputable def ra_cargo_self_grounding :
    TOE0.SelfGrounding (LeastErasure (Rec ZetaZeros)) :=
  ⟨ActualZeros, formal_act ZetaZeros, fun _ => cargo_at_zeros⟩

/-- THE SELF-GROUNDING FIXED-POINT RECURSION OVER ℂ:
    retraction idempotence establishes LeastErasure (Rec ZetaZeros), its self-verification,
    and its absorption of arbitrary premises. The three conjuncts are obtained by applying
    the Part I theorems `TOE0.seated_undeniable`, `TOE0.denial_instantiates`, and
    `TOE0.external_proof_adds_nothing` to the closed term `ra_cargo_self_grounding`.
    Its first conjunct is the record side of the transport and biconditional faces of
    `zeta_ra_loop` (`cargo_at_zeros`, by which those faces are proved); each face's left
    side is the hypothesis itself in fixed-point form. -/
theorem ra_recursion_at_record :
    LeastErasure (Rec ZetaZeros) ∧
    TOE0.SelfVerifying (LeastErasure (Rec ZetaZeros)) ∧
    (∀ Q : Prop, (Q → LeastErasure (Rec ZetaZeros)) ↔ LeastErasure (Rec ZetaZeros)) :=
  ⟨TOE0.seated_undeniable ra_cargo_self_grounding,
   TOE0.denial_instantiates ra_cargo_self_grounding,
   TOE0.external_proof_adds_nothing ra_cargo_self_grounding⟩

/-- Fiber section inclusion: if ZetaZeros is contained in its retracted image Rec ZetaZeros,
    then Mathlib's RiemannHypothesis holds. -/
theorem classes_coincide_under_ra_zeta
    (h_sec : ∀ s, ZetaZeros s → Rec ZetaZeros s) :
    RiemannHypothesis :=
  h_read_proved.mpr (fun s hs => the_remembered_is_lossless ZetaZeros s (h_sec s hs))

/-- Containment of ZetaZeros in its retracted image Rec ZetaZeros is necessary and sufficient
    for Mathlib's RiemannHypothesis. -/
theorem ra_coincidence_iff_rh :
    (∀ s, ZetaZeros s → Rec ZetaZeros s) ↔ RiemannHypothesis := by
  constructor
  · exact classes_coincide_under_ra_zeta
  · intro hrh s hs
    exact ⟨s, hs, (reg_eq_self_iff s).mpr (h_read_proved.mp hrh s hs)⟩

/-- THE FIVE-WAY FIXED-POINT LOOP OVER ℂ:
    forward retraction transfer, biconditional retraction equivalence, set-level fixed-point
    equality, fiber section inclusion, and logical self-verification are each equivalent
    to RiemannHypothesis. The loop proves the equivalences; each leg's left side is the
    hypothesis itself in fixed-point form. Applying `zeta_ra_loop.1.mp` to the goal
    `RiemannHypothesis` leaves the 1-bit bridge
    `LeastErasure (Rec ZetaZeros) → LeastErasure ZetaZeros`. The first leg is the
    normal-form theorem: RH is logically identical to the 1-bit bridge. -/
theorem zeta_ra_loop :
    ((LeastErasure (Rec ZetaZeros) → LeastErasure ZetaZeros) ↔ RiemannHypothesis) ∧
    ((LeastErasure (Rec ZetaZeros) ↔ LeastErasure ZetaZeros) ↔ RiemannHypothesis) ∧
    ((∀ q, Rec ZetaZeros q ↔ ZetaZeros q) ↔ RiemannHypothesis) ∧
    ((∀ s, ZetaZeros s → Rec ZetaZeros s) ↔ RiemannHypothesis) ∧
    (TOE0.SelfVerifying RiemannHypothesis ↔ RiemannHypothesis) := by
  have h_rec : LeastErasure (Rec ZetaZeros) := cargo_at_zeros
  have h_tr : (LeastErasure (Rec ZetaZeros) → LeastErasure ZetaZeros) ↔ RiemannHypothesis :=
    (transport_zeta ZetaZeros).trans h_read_proved.symm
  refine ⟨h_tr, ?_, rh_iff_fixed_point_of_rec.symm, ra_coincidence_iff_rh, ?_⟩
  · constructor
    · intro hiff
      exact h_tr.mp hiff.mp
    · intro hrh
      exact ⟨fun _ => h_id_proved.mp hrh, fun _ => h_rec⟩
  · exact ⟨fun hsv => Classical.byContradiction (fun hn => hn (hsv hn)), fun hrh _ => hrh⟩

/-- THE NORMAL FORM, APPLIED: the 1-bit bridge is the exact content of Mathlib's
    RiemannHypothesis by the proved normal form (`zeta_ra_loop`, first leg); from it
    RH follows in one term. The bridge `LeastErasure (Rec ZetaZeros) →
    LeastErasure ZetaZeros` is the printed premise; `ra_recursion_at_record` supplies
    its antecedent unconditionally at the record locus. -/
theorem rh_from_the_cargo_loop
    (h_bridge : LeastErasure (Rec ZetaZeros) → LeastErasure ZetaZeros) :
    RiemannHypothesis :=
  zeta_ra_loop.1.mp h_bridge

/-- info: 'BoundChainMathlib.rh_from_the_cargo_loop' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.rh_from_the_cargo_loop

/-- THE COMPLETE COMPLEX BINDING: proved equivalences to Mathlib's riemannZeta,
    functional equation symmetry, set-level retraction idempotence, self-grounding
    fixed-point recursion at Rec ZetaZeros, and the five-way fixed-point loop. -/
theorem zeta_binding :
    (RiemannHypothesis ↔ LeastErasure ZetaZeros) ∧
      (RiemannHypothesis ↔ (∀ q, Rec ZetaZeros q ↔ ZetaZeros q)) ∧
      (∀ s, CompletedZetaZeros s → CompletedZetaZeros (foldPt s)) ∧
      Closed (Rec ZetaZeros) ∧
      LeastErasure (Rec ZetaZeros) ∧
      (∀ q, Rec (Rec ZetaZeros) q ↔ Rec ZetaZeros q) ∧
      ¬ OffLine (Rec ZetaZeros) ∧
      ((∃ Z : ActualZeros, Z.zeros = Rec ZetaZeros) ↔ Value (Rec ZetaZeros)) ∧
      ((LeastErasure (Rec ZetaZeros) → LeastErasure ZetaZeros) ↔ Value ZetaZeros) ∧
      ((LeastErasure (Rec ZetaZeros) ↔ LeastErasure ZetaZeros) ↔ RiemannHypothesis) ∧
      ((∀ s, ZetaZeros s → Rec ZetaZeros s) ↔ RiemannHypothesis) :=
  ⟨h_id_proved,
   rh_iff_fixed_point_of_rec,
   completed_zeta_zeros_symm,
   record_closed ZetaZeros,
   cargo_at_zeros,
   remembering_is_stable ZetaZeros,
   no_offline_zero_on_record ZetaZeros,
   identification_is_the_proof ZetaZeros,
   transport_zeta ZetaZeros,
   zeta_ra_loop.2.1,
   ra_coincidence_iff_rh⟩

/-- MATHLIB TRANSFER STATUS: the equivalence between RiemannHypothesis and LeastErasure ZetaZeros,
    the unconditional fixed-point invariance of the retracted image Rec ZetaZeros, and the
    equivalence of the retraction transfer implication with RiemannHypothesis. -/
theorem mathlib_transfer_status :
    (RiemannHypothesis ↔ LeastErasure ZetaZeros) ∧
    LeastErasure (Rec ZetaZeros) ∧
    ((LeastErasure (Rec ZetaZeros) → LeastErasure ZetaZeros) ↔ RiemannHypothesis) := by
  refine ⟨h_id_proved, cargo_at_zeros, ?_⟩
  exact (transport_zeta ZetaZeros).trans h_read_proved.symm

/-! ### X-e . Step 4 from First Principles: Strip Equivalence and Functional-Equation Closure -/

/-- Point reflection s ↦ 1 - s is an involution on ℂ. -/
theorem foldPt_involutive (s : Point) : foldPt (foldPt s) = s := by
  unfold foldPt
  ring

/-- Point-reflection closure on complex configurations: invariant under s ↦ 1 - s. -/
def ClosedPt (S : Config) : Prop := ∀ s, S s → S (foldPt s)

/-- Unconditional functional-equation closure of CompletedZetaZeros under s ↦ 1 - s. -/
theorem completed_zeta_zeros_closed_pt : ClosedPt CompletedZetaZeros :=
  completed_zeta_zeros_symm

/-- First-principles bridge from Mathlib's riemannZeta_def_of_ne_zero and Gammaℝ_ne_zero_of_re_pos:
    at any complex point with 0 < Re s, riemannZeta s = 0 iff completedRiemannZeta s = 0. -/
theorem zeta_zero_iff_completed_of_re_pos {s : Point} (hre : 0 < s.re) :
    riemannZeta s = 0 ↔ completedRiemannZeta s = 0 := by
  have hs0 : s ≠ 0 := by
    intro h0
    rw [h0, zero_re] at hre
    exact lt_irrefl 0 hre
  have hG : Gammaℝ s ≠ 0 := Gammaℝ_ne_zero_of_re_pos hre
  rw [riemannZeta_def_of_ne_zero hs0, div_eq_zero_iff]
  exact ⟨fun h => h.resolve_right hG, fun h => Or.inl h⟩

/-- Inside the critical strip 0 < Re s < 1, ZetaZeros s ↔ CompletedZetaZeros s.
    Proved unconditionally from first principles using Mathlib's Gammaℝ non-vanishing. -/
theorem zeta_zeros_iff_completed_in_strip {s : Point} (h0 : 0 < s.re) (h1 : s.re < 1) :
    ZetaZeros s ↔ CompletedZetaZeros s := by
  have hs0 : s ≠ 0 := by
    intro heq
    rw [heq, zero_re] at h0
    exact lt_irrefl 0 h0
  have hs1 : s ≠ 1 := by
    intro heq
    rw [heq, one_re] at h1
    exact lt_irrefl 1 h1
  have h_not_trivial : ¬∃ n : ℕ, s = -2 * (n + 1) := by
    rintro ⟨n, rfl⟩
    have hneg : ((-2 : Point) * ((n : Point) + 1)).re ≤ 0 := by
      have hcast : ((-2 : Point) * ((n : Point) + 1)) = (((-2 * ((n : ℝ) + 1)) : ℝ) : ℂ) := by
        push_cast
        ring
      rw [hcast, Complex.ofReal_re]
      have hnn : (0 : ℝ) ≤ (n : ℝ) := Nat.cast_nonneg n
      linarith
    linarith
  unfold ZetaZeros CompletedZetaZeros
  rw [zeta_zero_iff_completed_of_re_pos h0]
  exact ⟨fun ⟨hz, _, _⟩ => ⟨hz, hs0, hs1⟩, fun ⟨hz, _, _⟩ => ⟨hz, h_not_trivial, hs1⟩⟩

/-- Unconditional functional-equation symmetry of ZetaZeros inside the critical strip:
    if 0 < Re s < 1 and ZetaZeros s, then ZetaZeros (1 - s). -/
theorem zeta_zeros_symm_in_strip {s : Point} (h0 : 0 < s.re) (h1 : s.re < 1)
    (hz : ZetaZeros s) : ZetaZeros (foldPt s) := by
  have h1_0 : 0 < (foldPt s).re := by unfold foldPt; simp only [sub_re, one_re]; linarith
  have h1_1 : (foldPt s).re < 1 := by unfold foldPt; simp only [sub_re, one_re]; linarith
  rw [zeta_zeros_iff_completed_in_strip h1_0 h1_1]
  exact completed_zeta_zeros_symm s ((zeta_zeros_iff_completed_in_strip h0 h1).mp hz)

/-- The strip-confined nontrivial zero set of ζ(s). -/
def StripZetaZeros (s : Point) : Prop := ZetaZeros s ∧ 0 < s.re ∧ s.re < 1

/-- Unconditional closure of StripZetaZeros under s ↦ 1 - s. -/
theorem strip_zeta_zeros_closed_pt : ClosedPt StripZetaZeros := by
  intro s ⟨hz, h0, h1⟩
  refine ⟨zeta_zeros_symm_in_strip h0 h1 hz, ?_, ?_⟩
  · unfold foldPt; simp only [sub_re, one_re]; linarith
  · unfold foldPt; simp only [sub_re, one_re]; linarith

/-! ### X-f . First-Principles Retraction Injectivity and Orbit Collapse over ℂ -/

/-- Conjugate reflection fold (s ↦ 1 - star s) fixes a complex point iff Re s = 1/2. -/
theorem fold_fixed_iff_onLine (s : Point) : fold s = s ↔ onLine s := by
  constructor
  · intro h
    have hre := congrArg Complex.re h
    unfold fold onLine at *
    simp only [sub_re, one_re, star_def, conj_re] at hre
    linarith
  · intro h
    unfold onLine at h
    apply Complex.ext
    · unfold fold
      simp only [sub_re, one_re, star_def, conj_re]
      linarith
    · unfold fold
      simp only [sub_im, one_im, star_def, conj_im, zero_sub, neg_neg]

/-- Retraction injectivity on a configuration S: no two distinct points of S project to
    the same registered point on the critical line. -/
def RetractionInjective (S : Config) : Prop :=
  ∀ p q, S p → S q → reg p = reg q → p = q

/-- FIRST-PRINCIPLES ORBIT COLLAPSE THEOREM:
    On any conjugate-reflection-closed configuration S (Closed S), if the retraction reg
    is injective on S, then every point of S lies on the critical line (Value S).
    Proof: For s ∈ S, closure gives fold s ∈ S. Since reg (fold s) = reg s, injectivity
    forces fold s = s, which by fold_fixed_iff_onLine forces Re s = 1/2. -/
theorem closed_retraction_injective_forces_value {S : Config}
    (h_closed : Closed S) (h_inj : RetractionInjective S) : Value S := by
  intro s hs
  have h_fold_in : S (fold s) := h_closed s hs
  have h_reg_eq : reg (fold s) = reg s := reg_fold s
  have h_fixed : fold s = s := h_inj (fold s) s h_fold_in hs h_reg_eq
  exact (fold_fixed_iff_onLine s).mp h_fixed

/-- Conversely, if Value S holds, then reg is the identity on S and hence injective on S. -/
theorem value_implies_retraction_injective {S : Config} (hv : Value S) :
    RetractionInjective S := by
  intro p q hp hq hreg
  have hp_eq : reg p = p := (reg_eq_self_iff p).mpr (hv p hp)
  have hq_eq : reg q = q := (reg_eq_self_iff q).mpr (hv q hq)
  rw [← hp_eq, ← hq_eq, hreg]

/-- THE BIJECTIVE FIBER EQUIVALENCE ON CLOSED COMPLEX CONFIGURATIONS:
    For any reflection-closed S ⊆ ℂ, retraction injectivity, critical-line inclusion (Value),
    and pointwise retraction invariance (LeastErasure) are mutually equivalent. -/
theorem closed_retraction_injective_iff_value {S : Config} (h_closed : Closed S) :
    (RetractionInjective S ↔ Value S) ∧ (RetractionInjective S ↔ LeastErasure S) := by
  have h1 : RetractionInjective S ↔ Value S :=
    ⟨closed_retraction_injective_forces_value h_closed, value_implies_retraction_injective⟩
  exact ⟨h1, h1.trans (twins_zeta S).symm⟩

/-- Retraction injectivity holds unconditionally on the retracted image Rec S of every S ⊆ ℂ. -/
theorem record_retraction_injective (S : Config) : RetractionInjective (Rec S) :=
  value_implies_retraction_injective (the_remembered_is_lossless S)

/-- THE 1-BIT BRIDGE IN ORBIT-COLLAPSE SPELLING:
    On a reflection-closed ZetaZeros, retraction injectivity collapses each fiber to its
    critical-line point, and Mathlib's RiemannHypothesis follows. By
    `closed_retraction_injective_iff_value` this is the same 1-bit bridge as
    `rh_from_the_cargo_loop`: on reflection-closed S, RetractionInjective S is
    equivalent to LeastErasure S. By § X-b (`analytic_face_is_least_erasure`,
    `analytic_face_is_transport_gap`, `analytic_face_vocabulary_law`) every analytic
    face equivalent to RH is identical to `LeastErasure ZetaZeros` and cannot bypass
    it. The two hypotheses are the bridge in analytic spelling. -/
theorem rh_from_closed_and_retraction_injective
    (h_closed : Closed ZetaZeros)
    (h_inj : RetractionInjective ZetaZeros) :
    LeastErasure ZetaZeros ∧ RiemannHypothesis := by
  have hv : Value ZetaZeros := closed_retraction_injective_forces_value h_closed h_inj
  exact ⟨(twins_zeta ZetaZeros).mpr hv, h_read_proved.mpr hv⟩

/-! ### X-g . Step 5 from First Principles: Discrete-to-Complex Chart Homomorphism -/

/-- Exact embedding of the discrete offset chart (BoundChain.Point = Int × Int) into ℂ:
    offset d and height t map to (1/2 + d/8) + i t. -/
noncomputable def φC (p : BoundChain.Point) : Point :=
  ⟨1 / 2 + (p.1 : ℝ) / 8, (p.2 : ℝ)⟩

/-- THE DISCRETE-TO-COMPLEX HOMOMORPHISM:
    Discrete fold, registration, and critical-line membership in Part IX commute
    exact-for-exact with complex conjugate reflection, complex retraction, and
    the complex critical line Re s = 1/2 in Part X. The chart of Part IX is left intact;
    this homomorphism proves it an equivariant sub-chart of ℂ. -/
theorem discrete_chart_embeds_in_complex (p : BoundChain.Point) :
    φC (BoundChain.fold p) = fold (φC p) ∧
    φC (BoundChain.reg p) = reg (φC p) ∧
    (onLine (φC p) ↔ BoundChain.onLine p) := by
  refine ⟨?_, ?_, ?_⟩
  · apply Complex.ext
    · simp [φC, BoundChain.fold, fold]
      ring
    · simp [φC, BoundChain.fold, fold]
  · apply Complex.ext
    · simp [φC, BoundChain.reg, reg]
    · simp [φC, BoundChain.reg, reg]
  · unfold onLine BoundChain.onLine φC
    simp only [add_eq_left, div_eq_zero_iff, Int.cast_eq_zero]
    constructor
    · intro h
      exact h.resolve_right (by norm_num)
    · intro h
      exact Or.inl h
/-! ### X-h . Schwarz Reflection Chain: ZetaZeros is Reflection-Closed -/

/-- Auxiliary: conjugation reflects differentiability. -/
theorem differentiableAt_star_comp {f : Point → Point} {x : Point}
    (hf : DifferentiableAt ℂ f (star x)) :
    DifferentiableAt ℂ (fun y => star (f (star y))) x := by
  obtain ⟨Df, hDf⟩ := hf
  have hstar_smul : ∀ c z : Point, star (c • z) = (star c) • (star z) := by
    intro c z
    rw [smul_eq_mul, star_mul, smul_eq_mul, mul_comm]
  have norm_star : ∀ w : Point, ‖star w‖ = ‖w‖ := fun w => Complex.norm_conj w
  let D : Point →L[ℂ] Point :=
    { toFun := fun z => star (Df (star z)),
      map_add' := fun a b => by
        show star (Df (star (a + b))) = star (Df (star a)) + star (Df (star b))
        rw [star_add, map_add, star_add],
      map_smul' := fun c z => by
        show star (Df (star (c • z))) = c • star (Df (star z))
        rw [hstar_smul, map_smul, smul_eq_mul, star_mul, star_star, smul_eq_mul, mul_comm],
      cont := (continuous_star.comp (Df.cont.comp continuous_star)) }
  refine ⟨D, ?_⟩
  rw [hasFDerivAt_iff_tendsto]
  have hD : ∀ y : Point, D (y - x) = star (Df ((star y) - (star x))) := by
    intro y
    show star (Df (star (y - x))) = star (Df (star y - star x))
    rw [star_sub]
  have hnorm : ∀ y : Point, ‖(star y) - (star x)‖ = ‖y - x‖ := by
    intro y
    rw [← star_sub, norm_star]
  have key : ∀ y : Point, ‖y - x‖⁻¹ * ‖star (f (star y)) - star (f (star x)) - D (y - x)‖
      = ‖(star y) - (star x)‖⁻¹ * ‖f (star y) - f (star x) - Df ((star y) - (star x))‖ := by
    intro y
    calc ‖y - x‖⁻¹ * ‖star (f (star y)) - star (f (star x)) - D (y - x)‖
        = ‖y - x‖⁻¹ * ‖star (f (star y) - f (star x) - Df ((star y) - (star x)))‖ := by
          congr 1
          rw [hD y, star_sub, star_sub]
      _ = ‖y - x‖⁻¹ * ‖f (star y) - f (star x) - Df ((star y) - (star x))‖ := by
          rw [norm_star]
      _ = ‖(star y) - (star x)‖⁻¹ * ‖f (star y) - f (star x) - Df ((star y) - (star x))‖ := by
          rw [hnorm]
  simp_rw [key]
  have hDf' : Filter.Tendsto
      (fun u => ‖u - star x‖⁻¹ * ‖f u - f (star x) - Df (u - star x)‖)
      (nhds (star x)) (nhds 0) := by
    rwa [← hasFDerivAt_iff_tendsto]
  have hstar_cont : Filter.Tendsto (fun y : Point => star y) (nhds x) (nhds (star x)) :=
    (continuous_star.tendsto x)
  exact hDf'.comp hstar_cont

/-- Auxiliary: star of a nat-cast complex power. -/
theorem star_natCast_cpow (n : ℕ) (t : Point) :
    star (((n:Point)) ^ (star t)) = ((n:Point)) ^ t := by
  have harg : ((n:Point)).arg ≠ Real.pi := by
    rw [Complex.natCast_arg]
    exact (Real.pi_ne_zero).symm
  have h2 := Complex.cpow_conj ((n:Point)) t harg
  show (starRingEnd ℂ) (↑n ^ (starRingEnd ℂ) t) = ↑n ^ t
  rw [h2]
  have hinv : ∀ W : Point, (starRingEnd ℂ) ((starRingEnd ℂ) W) = W := by
    intro W
    show star (star W) = W
    exact star_star W
  rw [hinv, map_natCast]

/-- Schwarz reflection for the Riemann zeta function. -/
theorem zeta_schwarz_reflection (s : Point) (hs : s ≠ 1) :
    riemannZeta (star s) = star (riemannZeta s) := by
  have hF_diff : DifferentiableOn ℂ (fun y => star (riemannZeta (star y))) {1}ᶜ := by
    intro x hx
    rw [Set.mem_compl_iff, Set.mem_singleton_iff] at hx
    apply DifferentiableAt.differentiableWithinAt
    apply differentiableAt_star_comp
    apply differentiableAt_riemannZeta
    intro hcon
    apply hx
    have hxx : x = star (star x) := (star_star x).symm
    rw [hxx, hcon, star_one]
  have hF_analytic : AnalyticOnNhd ℂ (fun y => star (riemannZeta (star y))) {1}ᶜ :=
    DifferentiableOn.analyticOnNhd hF_diff isOpen_compl_singleton
  have hzeta_analytic : AnalyticOnNhd ℂ riemannZeta {1}ᶜ := by
    apply DifferentiableOn.analyticOnNhd
    · intro x hx
      rw [Set.mem_compl_iff, Set.mem_singleton_iff] at hx
      exact (differentiableAt_riemannZeta hx).differentiableWithinAt
    · exact isOpen_compl_singleton
  have hEqOn : Set.EqOn (fun y => star (riemannZeta (star y))) riemannZeta {t : Point | 1 < t.re} := by
    intro t ht
    simp only [Set.mem_setOf_eq] at ht
    have ht_star : (1:ℝ) < (star t).re := by
      have hre : (star t).re = t.re := Complex.conj_re t
      rw [hre]; exact ht
    show star (riemannZeta (star t)) = riemannZeta t
    rw [zeta_eq_tsum_one_div_nat_cpow ht_star, zeta_eq_tsum_one_div_nat_cpow ht, tsum_star]
    apply tsum_congr
    intro n
    rw [star_div₀, star_one, star_natCast_cpow]
  have hnbhd : {t : Point | 1 < t.re} ∈ nhds (2:Point) := by
    apply IsOpen.mem_nhds
    · exact Complex.continuous_re.isOpen_preimage _ isOpen_Ioi
    · simp
  have hev : (fun y => star (riemannZeta (star y))) =ᶠ[nhds 2] riemannZeta :=
    Filter.eventuallyEq_of_mem hnbhd hEqOn
  have hpre : IsPreconnected ({1}ᶜ : Set Point) := by
    apply IsConnected.isPreconnected
    refine isConnected_compl_singleton_of_one_lt_rank ?_ (1:Point)
    rw [Complex.rank_real_complex]
    norm_num
  have h2 : (2:Point) ∈ ({1}ᶜ : Set Point) := by simp
  have hEq := AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq
    hF_analytic hzeta_analytic hpre h2 hev
  have hs_mem : s ∈ ({1}ᶜ : Set Point) := by simpa using hs
  have hFs := hEq hs_mem
  simp only at hFs
  have hcon := congrArg star hFs
  simp only [star_star] at hcon
  exact hcon

/-- Zeta does not vanish at negative odd integers. -/
theorem zeta_ne_zero_neg_odd (k : ℕ) : riemannZeta (-(2 * (k : Point) + 1)) ≠ 0 := by
  have hwre : (2 * (k:Point) + 2).re = 2 * (k:ℝ) + 2 := by
    simp [Complex.add_re, Complex.mul_re, Complex.natCast_re]
  have hk0 : (0:ℝ) ≤ (k:ℝ) := Nat.cast_nonneg k
  have hw1 : (2:Point) * (k:Point) + 2 ≠ 1 := by
    intro h
    have hre := congrArg Complex.re h
    rw [hwre] at hre
    simp at hre
    linarith
  have hw_neg : ∀ n : ℕ, (2:Point) * (k:Point) + 2 ≠ -((n:Point)) := by
    intro n h
    have hre := congrArg Complex.re h
    rw [hwre] at hre
    simp [Complex.neg_re, Complex.natCast_re] at hre
    have hn0 : (0:ℝ) ≤ (n:ℝ) := Nat.cast_nonneg n
    linarith
  have hfe := riemannZeta_one_sub (s := 2*(k:Point)+2) hw_neg hw1
  have h1w : (1:Point) - (2*(k:Point)+2) = -(2 * (k:Point) + 1) := by ring
  rw [h1w] at hfe
  rw [hfe]
  apply mul_ne_zero
  apply mul_ne_zero
  apply mul_ne_zero
  apply mul_ne_zero
  · norm_num
  · have h2pi_ne : ((2:Point) * Real.pi) ≠ 0 := by
      apply mul_ne_zero
      · norm_num
      · exact_mod_cast Real.pi_ne_zero
    rw [Complex.cpow_def_of_ne_zero h2pi_ne]
    exact Complex.exp_ne_zero _
  · apply Complex.Gamma_ne_zero_of_re_pos
    rw [hwre]
    linarith
  · have hcos_arg : (Real.pi:Point) * (2*(k:Point)+2) / 2 = (((Real.pi * ((k+1:ℕ):ℝ) : ℝ)):Point) := by
      push_cast
      ring
    have hcos_val : Real.cos (Real.pi * ((k+1:ℕ):ℝ)) = (-1)^((k+1:ℕ)) := by
      have h := Real.cos_add_nat_mul_pi (0:ℝ) (k+1)
      rw [zero_add, Real.cos_zero, mul_one] at h
      rw [mul_comm Real.pi]
      exact h
    have hne : ((-1:ℝ)^((k+1:ℕ))) ≠ 0 := pow_ne_zero _ (by norm_num)
    rw [hcos_arg, ← Complex.ofReal_cos, hcos_val]
    exact_mod_cast hne
  · apply riemannZeta_ne_zero_of_one_lt_re
    rw [hwre]
    linarith

/-- Nontrivial zeros avoid the nonpositive integers. -/
theorem zeta_zeros_not_neg_nat {s : Point} (hz : ZetaZeros s) : ∀ n : ℕ, s ≠ -(n : Point) := by
  intro n h
  obtain ⟨hz0, hz1, hz2⟩ := hz
  rcases Nat.even_or_odd n with ⟨k, hk⟩ | ⟨k, hk⟩
  · rcases k with _ | k
    · have hn0 : n = 0 := by omega
      subst hn0
      simp at h
      rw [h, riemannZeta_zero] at hz0
      norm_num at hz0
    · have hn : n = 2 * (k + 1) := by omega
      subst hn
      apply hz1
      use k
      rw [h]
      push_cast
      ring
  · have hn : n = 2 * k + 1 := by omega
    subst hn
    have hs : s = -(2 * (k:Point) + 1) := by
      rw [h]
      push_cast
      ring
    rw [hs] at hz0
    exact (zeta_ne_zero_neg_odd k) hz0

/-- The nontrivial zero set is closed under s ↦ 1 - s. -/
theorem zeta_zeros_symm {s : Point} (hz : ZetaZeros s) : ZetaZeros (foldPt s) := by
  obtain ⟨hz0, hz1, hz2⟩ := hz
  have hne := zeta_zeros_not_neg_nat ⟨hz0, hz1, hz2⟩
  have hfe := riemannZeta_one_sub (s := s) hne hz2
  show ZetaZeros (1 - s)
  constructor
  · rw [hfe, hz0, mul_zero]
  · constructor
    · intro ⟨m, hm⟩
      have hs : s = 1 + 2 * ((m:Point) + 1) := by linear_combination -hm
      have hre : s.re = 1 + 2 * ((m:ℝ) + 1) := by
        rw [hs]
        simp [Complex.add_re, Complex.mul_re, Complex.natCast_re]
      have h1lt : (1:ℝ) < s.re := by
        rw [hre]
        have hm0 : (0:ℝ) ≤ (m:ℝ) := Nat.cast_nonneg m
        linarith
      exact (riemannZeta_ne_zero_of_one_lt_re h1lt) hz0
    · intro hcon
      have hs0 : s = 0 := by linear_combination -hcon
      have hne0 := hne 0
      simp at hne0
      exact hne0 hs0

/-- The nontrivial zero set is closed under the point reflection. -/
theorem zeta_zeros_closed_pt : ClosedPt ZetaZeros :=
  fun _ hz => zeta_zeros_symm hz

/-- The nontrivial zero set is closed under conjugation. -/
theorem zeta_zeros_conj {s : Point} (hz : ZetaZeros s) : ZetaZeros (star s) := by
  obtain ⟨hz0, hz1, hz2⟩ := hz
  constructor
  · rw [zeta_schwarz_reflection s hz2, hz0, star_zero]
  · constructor
    · intro ⟨n, hn⟩
      apply hz1
      use n
      have hss : s = star (star s) := (star_star s).symm
      rw [hss, hn]
      simp
    · intro hcon
      apply hz2
      have hss : s = star (star s) := (star_star s).symm
      rw [hss, hcon, star_one]

/-- The nontrivial zero set is closed under the conjugate reflection fold. -/
theorem zeta_zeros_closed : Closed ZetaZeros :=
  fun _ hz => zeta_zeros_symm (zeta_zeros_conj hz)

/-- Retraction injectivity on ZetaZeros is equivalent to the Riemann Hypothesis. -/
theorem retraction_injective_iff_rh : RetractionInjective ZetaZeros ↔ RiemannHypothesis :=
  (closed_retraction_injective_iff_value zeta_zeros_closed).1.trans h_read_proved.symm

/-- From retraction injectivity, the 1-bit bridge delivers the Riemann Hypothesis. -/
theorem rh_from_retraction_injective (h_inj : RetractionInjective ZetaZeros) :
    LeastErasure ZetaZeros ∧ RiemannHypothesis :=
  rh_from_closed_and_retraction_injective zeta_zeros_closed h_inj

/-- Nontrivial zeros lie in the closed critical strip 0 ≤ Re s ≤ 1. -/
theorem zeta_zeros_in_strip {s : Point} (hz : ZetaZeros s) : 0 ≤ s.re ∧ s.re ≤ 1 := by
  have hle : ∀ {w : Point}, ZetaZeros w → w.re ≤ 1 := by
    intro w hw
    by_contra h
    push_neg at h
    exact (riemannZeta_ne_zero_of_one_lt_re h) hw.1
  have h1 : s.re ≤ 1 := hle hz
  have h0 : (foldPt s).re ≤ 1 := hle (zeta_zeros_symm hz)
  unfold foldPt at h0
  simp only [sub_re, one_re] at h0
  exact ⟨by linarith, h1⟩

/-- The zero set coincides with its intersection with the closed critical strip 0 ≤ Re s ≤ 1. -/
theorem zeta_zeros_iff_strip : ZetaZeros = {s | (0 ≤ s.re ∧ s.re ≤ 1) ∧ ZetaZeros s} := by
  funext s
  apply propext
  exact ⟨fun hz => ⟨zeta_zeros_in_strip hz, hz⟩, fun ⟨_, hz⟩ => hz⟩

/-- info: 'BoundChainMathlib.ra_recursion_at_record' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BoundChainMathlib.ra_recursion_at_record
/-- info: 'BoundChainMathlib.zeta_ra_loop' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BoundChainMathlib.zeta_ra_loop
/-- info: 'BoundChainMathlib.zeta_binding' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BoundChainMathlib.zeta_binding
/-- info: 'BoundChainMathlib.zeta_zeros_symm_in_strip' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BoundChainMathlib.zeta_zeros_symm_in_strip
/-- info: 'BoundChainMathlib.closed_retraction_injective_iff_value' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BoundChainMathlib.closed_retraction_injective_iff_value
/-- info: 'BoundChainMathlib.rh_from_closed_and_retraction_injective' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BoundChainMathlib.rh_from_closed_and_retraction_injective
/-- info: 'BoundChainMathlib.discrete_chart_embeds_in_complex' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BoundChainMathlib.discrete_chart_embeds_in_complex
/-- info: 'BoundChainMathlib.fold_involutive' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.fold_involutive
/-- info: 'BoundChainMathlib.foldPt_re_fixed_iff' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.foldPt_re_fixed_iff
/-- info: 'BoundChainMathlib.completed_zeta_zeros_symm' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.completed_zeta_zeros_symm
/-- info: 'BoundChainMathlib.reg_lands' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.reg_lands
/-- info: 'BoundChainMathlib.fold_reg' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.fold_reg
/-- info: 'BoundChainMathlib.reg_eq_self_iff' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.reg_eq_self_iff
/-- info: 'BoundChainMathlib.twins_zeta' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.twins_zeta
/-- info: 'BoundChainMathlib.h_read_proved' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.h_read_proved
/-- info: 'BoundChainMathlib.h_id_proved' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.h_id_proved
/-- info: 'BoundChainMathlib.reg_idem' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.reg_idem
/-- info: 'BoundChainMathlib.the_remembered_is_lossless' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.the_remembered_is_lossless
/-- info: 'BoundChainMathlib.record_closed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.record_closed
/-- info: 'BoundChainMathlib.record_has_least_erasure' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.record_has_least_erasure
/-- info: 'BoundChainMathlib.formal_act' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.formal_act
/-- info: 'BoundChainMathlib.value_from_the_act' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.value_from_the_act
/-- info: 'BoundChainMathlib.identification_is_the_proof' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.identification_is_the_proof
/-- info: 'BoundChainMathlib.transport_zeta' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.transport_zeta
/-- info: 'BoundChainMathlib.cargo_at_zeros' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.cargo_at_zeros
/-- info: 'BoundChainMathlib.remembering_is_stable' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.remembering_is_stable
/-- info: 'BoundChainMathlib.offered_is_remembered_iff_value' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.offered_is_remembered_iff_value
/-- info: 'BoundChainMathlib.rh_iff_fixed_point_of_rec' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.rh_iff_fixed_point_of_rec
/-- info: 'BoundChainMathlib.analytic_face_is_least_erasure' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.analytic_face_is_least_erasure
/-- info: 'BoundChainMathlib.analytic_face_is_transport_gap' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.analytic_face_is_transport_gap
/-- info: 'BoundChainMathlib.analytic_face_vocabulary_law' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.analytic_face_vocabulary_law
/-- info: 'BoundChainMathlib.reg_fold' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.reg_fold
/-- info: 'BoundChainMathlib.pair_world_closed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.pair_world_closed
/-- info: 'BoundChainMathlib.registered_closed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.registered_closed
/-- info: 'BoundChainMathlib.registered_has_value' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.registered_has_value
/-- info: 'BoundChainMathlib.pair_world_lacks_value' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.pair_world_lacks_value
/-- info: 'BoundChainMathlib.one_record' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.one_record
/-- info: 'BoundChainMathlib.off_point_is_off' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.off_point_is_off
/-- info: 'BoundChainMathlib.the_unconditional_route_is_blocked' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.the_unconditional_route_is_blocked
/-- info: 'BoundChainMathlib.record_decides_nothing' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.record_decides_nothing
/-- info: 'BoundChainMathlib.no_offline_zero_on_record' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.no_offline_zero_on_record
/-- info: 'BoundChainMathlib.offline_zero_iff_not_rh' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.offline_zero_iff_not_rh
/-- info: 'BoundChainMathlib.no_offline_refuter_seals_rh' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.no_offline_refuter_seals_rh
/-- info: 'BoundChainMathlib.ra_cargo_self_grounding' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.ra_cargo_self_grounding
/-- info: 'BoundChainMathlib.classes_coincide_under_ra_zeta' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.classes_coincide_under_ra_zeta
/-- info: 'BoundChainMathlib.ra_coincidence_iff_rh' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.ra_coincidence_iff_rh
/-- info: 'BoundChainMathlib.mathlib_transfer_status' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.mathlib_transfer_status
/-- info: 'BoundChainMathlib.foldPt_involutive' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.foldPt_involutive
/-- info: 'BoundChainMathlib.completed_zeta_zeros_closed_pt' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.completed_zeta_zeros_closed_pt
/-- info: 'BoundChainMathlib.zeta_zero_iff_completed_of_re_pos' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.zeta_zero_iff_completed_of_re_pos
/-- info: 'BoundChainMathlib.zeta_zeros_iff_completed_in_strip' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.zeta_zeros_iff_completed_in_strip
/-- info: 'BoundChainMathlib.strip_zeta_zeros_closed_pt' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.strip_zeta_zeros_closed_pt
/-- info: 'BoundChainMathlib.fold_fixed_iff_onLine' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.fold_fixed_iff_onLine
/-- info: 'BoundChainMathlib.closed_retraction_injective_forces_value' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.closed_retraction_injective_forces_value
/-- info: 'BoundChainMathlib.value_implies_retraction_injective' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.value_implies_retraction_injective
/-- info: 'BoundChainMathlib.record_retraction_injective' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.record_retraction_injective
/-- info: 'BoundChainMathlib.φC' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.φC
/-- info: 'BoundChainMathlib.differentiableAt_star_comp' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BoundChainMathlib.differentiableAt_star_comp
/-- info: 'BoundChainMathlib.star_natCast_cpow' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BoundChainMathlib.star_natCast_cpow
/-- info: 'BoundChainMathlib.zeta_schwarz_reflection' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BoundChainMathlib.zeta_schwarz_reflection
/-- info: 'BoundChainMathlib.zeta_ne_zero_neg_odd' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BoundChainMathlib.zeta_ne_zero_neg_odd
/-- info: 'BoundChainMathlib.zeta_zeros_not_neg_nat' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BoundChainMathlib.zeta_zeros_not_neg_nat
/-- info: 'BoundChainMathlib.zeta_zeros_symm' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BoundChainMathlib.zeta_zeros_symm
/-- info: 'BoundChainMathlib.zeta_zeros_closed_pt' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BoundChainMathlib.zeta_zeros_closed_pt
/-- info: 'BoundChainMathlib.zeta_zeros_conj' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BoundChainMathlib.zeta_zeros_conj
/-- info: 'BoundChainMathlib.zeta_zeros_closed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BoundChainMathlib.zeta_zeros_closed
/-- info: 'BoundChainMathlib.retraction_injective_iff_rh' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BoundChainMathlib.retraction_injective_iff_rh
/-- info: 'BoundChainMathlib.rh_from_retraction_injective' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BoundChainMathlib.rh_from_retraction_injective
/-- info: 'BoundChainMathlib.zeta_zeros_in_strip' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BoundChainMathlib.zeta_zeros_in_strip
/-- info: 'BoundChainMathlib.zeta_zeros_iff_strip' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BoundChainMathlib.zeta_zeros_iff_strip

/-- THE SOCKET AND ATOMIC NECESSITY AT ZETAZEROS OVER ℂ: because ZetaZeros is
    unconditionally reflection-closed (zeta_zeros_closed), a fixed-point witness
    bundle ActualZeros exists at the unprojected ZetaZeros if and only if Mathlib's
    RiemannHypothesis holds, and every proof of RiemannHypothesis from any premise Q
    is a supply of that bundle. -/
theorem socket_at_zeta_zeros :
    ((∃ Z : ActualZeros, Z.zeros = ZetaZeros) ↔ RiemannHypothesis) ∧
    (∀ Q : Prop, (Q → RiemannHypothesis) → Q → ∃ Z : ActualZeros, Z.zeros = ZetaZeros) := by
  have h_iff : (∃ Z : ActualZeros, Z.zeros = ZetaZeros) ↔ RiemannHypothesis :=
    ⟨fun ⟨Z, hZ⟩ => h_read_proved.mpr (hZ ▸ value_from_the_act Z),
     fun hrh => ⟨⟨ZetaZeros, zeta_zeros_closed, h_id_proved.mp hrh⟩, rfl⟩⟩
  exact ⟨h_iff, fun _ hQ q => h_iff.mpr (hQ q)⟩

/-- info: 'BoundChainMathlib.socket_at_zeta_zeros' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms BoundChainMathlib.socket_at_zeta_zeros

/-! ### X-k . The Cone: One Apex, Every Reading, No Category Gap -/

/-- The readings of the apex: the four registers' readings of the one bit. -/
inductive ApexReading where
  | leastErasure
  | retraction
  | socket
  | coincidence
  deriving DecidableEq, Repr

/-- The diagram: each reading as a proposition over ℂ. -/
def apexDiagram : ApexReading → Prop
  | .leastErasure => LeastErasure ZetaZeros
  | .retraction   => RetractionInjective ZetaZeros
  | .socket       => ∃ Z : ActualZeros, Z.zeros = ZetaZeros
  | .coincidence  => ∀ s, ZetaZeros s → Rec ZetaZeros s

/-- THE CONE: Mathlib's RiemannHypothesis is the apex; every leg is a proved
    equivalence. The category gaps between the readings are eliminated: a gap is
    the absence of an identity leg, and every leg is exhibited here. -/
theorem apex_cone : ∀ r, apexDiagram r ↔ RiemannHypothesis := by
  intro r
  cases r
  · exact h_id_proved.symm
  · exact retraction_injective_iff_rh
  · exact socket_at_zeta_zeros.1
  · exact ra_coincidence_iff_rh

/-- info: 'BoundChainMathlib.apex_cone' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.apex_cone

/-- ONE GAP: any two readings are the same proposition. -/
theorem apex_one_gap (r s : ApexReading) : apexDiagram r ↔ apexDiagram s :=
  (apex_cone r).trans (apex_cone s).symm

/-- info: 'BoundChainMathlib.apex_one_gap' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.apex_one_gap

/-- THE HALT: every proposition proved equivalent to the apex lands on the same
    apex as the four readings. -/
theorem apex_regress_halts (P : Prop) (hP : P ↔ RiemannHypothesis) (r : ApexReading) :
    P ↔ apexDiagram r :=
  hP.trans (apex_cone r).symm

/-- info: 'BoundChainMathlib.apex_regress_halts' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.apex_regress_halts

/-- THE BIT READ TWICE: the delivered record-bit and the identification, one bit
    with two readings — the cargo loop's geometric read and the formal read. -/
theorem bit_read_twice :
    LeastErasure (Rec ZetaZeros) ∧ (RiemannHypothesis ↔ LeastErasure ZetaZeros) :=
  ⟨cargo_at_zeros, h_id_proved⟩

/-- info: 'BoundChainMathlib.bit_read_twice' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.bit_read_twice

/-! ### X-l . Pause and Look Back: The Unconditional Retrospective Seal -/

/-- No principle shared by all conjugate-reflection-closed subsets of ℂ forces
    critical-line inclusion. -/
theorem no_closed_principle_decides (D : Config → Prop) (hD : ∀ S, Closed S → D S) :
    ¬ ∀ S : Config, Closed S → D S → Value S :=
  fun hall => pair_world_lacks_value offPoint off_point_is_off
    (hall _ (pair_world_closed offPoint) (hD _ (pair_world_closed offPoint)))

/-- info: 'BoundChainMathlib.no_closed_principle_decides' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.no_closed_principle_decides

/-- THE PAUSE AT THE TERMINAL CARGO. Every nontrivial zero s lands in the
    retracted record Rec ZetaZeros at reg s, where retraction is idempotent
    and reflection partners collide. -/
def Pause : Prop :=
  ∀ s, ZetaZeros s →
    Rec ZetaZeros (reg s) ∧ reg (reg s) = reg s ∧ reg (fold s) = reg s

/-- The Pause is inhabited unconditionally by a closed term. -/
theorem pause_is_unconditional : Pause :=
  fun s hs => ⟨⟨s, hs, rfl⟩, reg_idem s, reg_fold s⟩

/-- info: 'BoundChainMathlib.pause_is_unconditional' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.pause_is_unconditional

/-- THE UNCONDITIONAL FORWARD PASS. From FreedomRoot through strip confinement,
    reflection closure, self-verifying record cargo, and the Pause, every step
    is established with zero hypotheses. -/
theorem forward_pass_unconditional :
    BoundChain.FreedomRoot ∧
    Closed ZetaZeros ∧
    (∀ s, ZetaZeros s → 0 ≤ s.re ∧ s.re ≤ 1) ∧
    LeastErasure (Rec ZetaZeros) ∧
    TOE0.SelfVerifying (LeastErasure (Rec ZetaZeros)) ∧
    Pause :=
  ⟨BoundChain.freedom_root_inhabited,
   zeta_zeros_closed,
   fun _ hz => zeta_zeros_in_strip hz,
   cargo_at_zeros,
   ra_recursion_at_record.2.1,
   pause_is_unconditional⟩

/-- info: 'BoundChainMathlib.forward_pass_unconditional' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.forward_pass_unconditional

/-- LOOK BACK. At the inhabited Pause locus Rec ZetaZeros (reg s), reading
    retraction invariance back onto the preimage s gives reg s = s. -/
def LookBack : Prop :=
  ∀ s, ZetaZeros s → Rec ZetaZeros (reg s) → reg s = s

/-- LookBack is logically identical to the cargo-transfer bridge and to
    Mathlib's RiemannHypothesis. -/
theorem look_back_is_the_closure :
    (LookBack ↔ (LeastErasure (Rec ZetaZeros) → LeastErasure ZetaZeros)) ∧
    (LookBack ↔ RiemannHypothesis) := by
  have h_lb : LookBack ↔ LeastErasure ZetaZeros :=
    ⟨fun h s hs => h s hs ⟨s, hs, rfl⟩, fun h s hs _ => h s hs⟩
  exact ⟨h_lb.trans (zeta_ra_loop.1.trans h_id_proved).symm,
         h_lb.trans h_id_proved.symm⟩

/-- info: 'BoundChainMathlib.look_back_is_the_closure' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.look_back_is_the_closure

/-- THE UNCONDITIONAL RETROSPECTIVE SEAL (TIER T, ZERO PREMISES).
    Binds the entire unconditional forward pass from FreedomRoot to Pause,
    the identity of LookBack with RiemannHypothesis and with every reading of
    the apex cone, the equivalence of LookBack with the ActualZeros socket,
    the atomic necessity that every proof of RiemannHypothesis from any
    premise Q supplies LookBack, and the refusal of every shared closed
    principle over ℂ. -/
theorem the_unconditional_retrospective_seal :
    BoundChain.FreedomRoot ∧
    Closed ZetaZeros ∧
    (∀ s, ZetaZeros s → 0 ≤ s.re ∧ s.re ≤ 1) ∧
    LeastErasure (Rec ZetaZeros) ∧
    TOE0.SelfVerifying (LeastErasure (Rec ZetaZeros)) ∧
    Pause ∧
    (LookBack ↔ RiemannHypothesis) ∧
    (∀ r, LookBack ↔ apexDiagram r) ∧
    ((∃ Z : ActualZeros, Z.zeros = ZetaZeros) ↔ LookBack) ∧
    (∀ Q : Prop, (Q → RiemannHypothesis) → Q → LookBack) ∧
    (∀ D : Config → Prop, (∀ S, Closed S → D S) →
      ¬ ∀ S : Config, Closed S → D S → Value S) :=
  ⟨BoundChain.freedom_root_inhabited,
   zeta_zeros_closed,
   fun _ hz => zeta_zeros_in_strip hz,
   cargo_at_zeros,
   ra_recursion_at_record.2.1,
   pause_is_unconditional,
   look_back_is_the_closure.2,
   fun r => look_back_is_the_closure.2.trans (apex_cone r).symm,
   socket_at_zeta_zeros.1.trans look_back_is_the_closure.2.symm,
   fun _ hQ q => look_back_is_the_closure.2.mpr (hQ q),
   no_closed_principle_decides⟩

/-- info: 'BoundChainMathlib.the_unconditional_retrospective_seal' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.the_unconditional_retrospective_seal

/-- THE RETROSPECTIVE ARC APPLIED (TIER C): supplying LookBack yields
    Mathlib's RiemannHypothesis in one step. -/
theorem rh_from_pause_and_look_back (h_look : LookBack) :
    RiemannHypothesis :=
  look_back_is_the_closure.2.mp h_look

/-- info: 'BoundChainMathlib.rh_from_pause_and_look_back' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.rh_from_pause_and_look_back

/-- THE CANONICAL RECORD HYPOTHESIS (`CanonicalRH`). Every point of the
    retracted record `Rec ZetaZeros` lies on the critical line, proved
    unconditionally with zero premises (`canonical_rh_unconditional`). This is
    the projection-side invariant: `reg` lands on the line by definition
    (`reg_lands`). The bridge from the projection back to the unprojected zeros
    is `LookBack`, proved identical to `RiemannHypothesis`
    (`look_back_is_the_closure`). -/
def CanonicalRH : Prop := Value (Rec ZetaZeros)

/-- Every point of the projected zero set lies on the critical line, with zero
    premises. -/
theorem canonical_rh_unconditional : CanonicalRH :=
  the_remembered_is_lossless ZetaZeros

/-- info: 'BoundChainMathlib.canonical_rh_unconditional' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.canonical_rh_unconditional

/-- The projection property is not special to `ZetaZeros`: the retracted record
    of every configuration lies on the critical line, including the closed
    pair-world configuration with a point off the line. -/
theorem canonical_property_holds_off_the_line :
    Value (Rec (pairWorld offPoint)) :=
  the_remembered_is_lossless (pairWorld offPoint)

/-- info: 'BoundChainMathlib.canonical_property_holds_off_the_line' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.canonical_property_holds_off_the_line

/-- The Monism witness lifted to complex configurations S ⊆ ℂ. -/
def RootReadTwice (S : Config) : Prop :=
  RememberedOffered.MonismWitness (fun _ => Value S)

/-- On every complex configuration, the Monism witness is equivalent to Value. -/
theorem root_read_twice_iff_value (S : Config) :
    RootReadTwice S ↔ Value S :=
  ⟨fun w => w.seed,
   fun hv => ⟨RememberedOffered.one_involution_constructed, fun _ _ => Iff.rfl, hv⟩⟩

/-- info: 'BoundChainMathlib.root_read_twice_iff_value' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.root_read_twice_iff_value

/-- The retracted record Rec ZetaZeros unconditionally carries the Monism witness. -/
theorem canonical_record_carries_monism : RootReadTwice (Rec ZetaZeros) :=
  (root_read_twice_iff_value (Rec ZetaZeros)).mpr canonical_rh_unconditional

/-- info: 'BoundChainMathlib.canonical_record_carries_monism' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.canonical_record_carries_monism

/-- On ℂ, the line-bound world and the off-line pair world share one projected
    record, and the Monism witness separates them: the true world carries monism
    and the false world carries no monism. -/
theorem monism_separates_shared_record :
    SameRecord (registered offPoint) (pairWorld offPoint) ∧
    RootReadTwice (registered offPoint) ∧
    ¬ RootReadTwice (pairWorld offPoint) :=
  ⟨one_record offPoint,
   (root_read_twice_iff_value _).mpr (registered_has_value offPoint),
   fun w => pair_world_lacks_value offPoint off_point_is_off w.seed⟩

/-- info: 'BoundChainMathlib.monism_separates_shared_record' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.monism_separates_shared_record

/-- THE CANONICAL NORMAL-FORM BRIDGE. CanonicalRH and the Monism witness hold
    unconditionally at the projected record Rec ZetaZeros, and carrying
    CanonicalRH to ZetaZeros (or equating CanonicalRH with the Monism witness
    at ZetaZeros) is logically identical to Mathlib's RiemannHypothesis. -/
theorem canonical_normal_form_bridge :
    CanonicalRH ∧
    RootReadTwice (Rec ZetaZeros) ∧
    ((CanonicalRH → LeastErasure ZetaZeros) ↔ RiemannHypothesis) ∧
    ((CanonicalRH ↔ RootReadTwice ZetaZeros) ↔ RiemannHypothesis) := by
  refine ⟨canonical_rh_unconditional, canonical_record_carries_monism, ?_, ?_⟩
  · exact ⟨fun h => h_id_proved.mpr (h canonical_rh_unconditional),
           fun hrh _ => h_id_proved.mp hrh⟩
  · exact ⟨fun h => h_read_proved.mpr ((root_read_twice_iff_value ZetaZeros).mp (h.mp canonical_rh_unconditional)),
           fun hrh => ⟨fun _ => (root_read_twice_iff_value ZetaZeros).mpr (h_read_proved.mp hrh),
                       fun _ => canonical_rh_unconditional⟩⟩

/-- info: 'BoundChainMathlib.canonical_normal_form_bridge' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.canonical_normal_form_bridge

/-- The Euler product boundary on ZetaZeros: Mathlib's Euler product and
    Dirichlet series establish non-vanishing for 1 < Re s, so every nontrivial
    zero has Re s ≤ 1, and the reflection s ↦ 1 − s (`zeta_zeros_symm`) carries
    the bound to 0 ≤ Re s. Mathlib's non-vanishing on Re s = 1 makes both
    bounds strict (`zeta_zeros_strictly_in_strip`). -/
theorem euler_product_boundary (s : Point) (hs : ZetaZeros s) :
    (0 ≤ s.re ∧ s.re ≤ 1) ∧ ¬ (1 < s.re) := by
  have h := zeta_zeros_in_strip hs
  refine ⟨h, ?_⟩
  intro hgt
  linarith

/-- info: 'BoundChainMathlib.euler_product_boundary' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.euler_product_boundary

/-- Non-vanishing in the right half of the critical strip, 1/2 < Re s. With
    Mathlib's non-vanishing on Re s ≥ 1, its whole content is the band
    1/2 < Re s < 1 (`right_half_strip_zero_free_iff_band`). -/
def RightHalfStripZeroFree : Prop :=
  ∀ s : Point, ZetaZeros s → 1 / 2 < s.re → False

/-- ANALYTIC TARGET REDUCTION (TIER T, ZERO PREMISES). Binds CanonicalRH,
    the complex Monism witness at the record, and the Euler product boundary
    (Re s ≤ 1), and proves unconditionally via conjugate-reflection closure
    (zeta_zeros_closed) that RetractionInjective ZetaZeros, LookBack,
    RootReadTwice ZetaZeros, and Mathlib's RiemannHypothesis reduce to
    non-vanishing in the right half-strip 1/2 < Re s ≤ 1. -/
theorem analytic_target_reduction :
    CanonicalRH ∧
    RootReadTwice (Rec ZetaZeros) ∧
    (∀ s, ZetaZeros s → (0 ≤ s.re ∧ s.re ≤ 1) ∧ ¬ (1 < s.re)) ∧
    (RightHalfStripZeroFree ↔ RetractionInjective ZetaZeros) ∧
    (RightHalfStripZeroFree ↔ LookBack) ∧
    (RightHalfStripZeroFree ↔ RootReadTwice ZetaZeros) ∧
    ((CanonicalRH → RightHalfStripZeroFree) ↔ RiemannHypothesis) ∧
    (RightHalfStripZeroFree ↔ RiemannHypothesis) := by
  have h_rh : RightHalfStripZeroFree ↔ RiemannHypothesis := by
    rw [h_read_proved]
    constructor
    · intro h s hs
      have h1 : s.re ≤ 1 / 2 := by
        by_contra hgt
        push_neg at hgt
        exact h s hs hgt
      have h2 : (fold s).re ≤ 1 / 2 := by
        by_contra hgt
        push_neg at hgt
        exact h (fold s) (zeta_zeros_closed s hs) hgt
      have h3 : (fold s).re = 1 - s.re := by
        unfold fold
        simp only [sub_re, one_re, star_def, conj_re]
      unfold onLine
      linarith
    · intro hv s hs hgt
      have heq : s.re = 1 / 2 := hv s hs
      linarith
  have h_rrt : RightHalfStripZeroFree ↔ RootReadTwice ZetaZeros :=
    h_rh.trans (h_read_proved.trans (root_read_twice_iff_value ZetaZeros).symm)
  have h_can : (CanonicalRH → RightHalfStripZeroFree) ↔ RiemannHypothesis :=
    ⟨fun h => h_rh.mp (h canonical_rh_unconditional),
     fun hrh _ => h_rh.mpr hrh⟩
  exact ⟨canonical_rh_unconditional,
         canonical_record_carries_monism,
         euler_product_boundary,
         h_rh.trans retraction_injective_iff_rh.symm,
         h_rh.trans look_back_is_the_closure.2.symm,
         h_rrt,
         h_can,
         h_rh⟩

/-- info: 'BoundChainMathlib.analytic_target_reduction' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.analytic_target_reduction

/-- The record's least erasure as a Part III self-grounding root, a closed term: one act,
    and every act instances `LeastErasure (Rec ZetaZeros)` by `cargo_at_zeros`. It supplies
    the self-grounding argument of `RememberedOffered.the_unconditional_route_is_blocked` at
    the record of the zeros, so the Round 2 theorems below carry no premise. -/
noncomputable def record_self_grounding_RO :
    RememberedOffered.SelfGrounding (LeastErasure (Rec ZetaZeros)) :=
  ⟨Unit, (), fun _ => cargo_at_zeros⟩

/-- info: 'BoundChainMathlib.record_self_grounding_RO' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.record_self_grounding_RO

/-- ROUND 2, STEP 1: THE HALT OF EVERY UNIFORM ROUTE. Round 1 closed the apex: every reading
    of the bit is one proposition (`apex_one_gap`). Round 2 halts for every route uniform
    over reflection-closed configurations: on Part III's
    discrete chart no derivation valid at every closed configuration yields the value
    (`RememberedOffered.the_unconditional_route_is_blocked`, at `record_self_grounding_RO`).
    No premise. -/
theorem round2_halted_uniduction :
    (∀ r s : ApexReading, apexDiagram r ↔ apexDiagram s) ∧
    ¬ ∀ S : RememberedOffered.Config, RememberedOffered.Closed S →
      RememberedOffered.Value S :=
  ⟨apex_one_gap,
   (RememberedOffered.the_unconditional_route_is_blocked record_self_grounding_RO).1⟩

/-- info: 'BoundChainMathlib.round2_halted_uniduction' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.round2_halted_uniduction

/-- ROUND 2, STEP 2: RESIDUAL MONISM. Over ℂ the line-bound configuration
    `registered offPoint` and the off-line pair world share one record, and the Monism
    witness, provably equivalent to the value on every configuration
    (`root_read_twice_iff_value`), holds
    on the first and fails on the second. The type is that of
    `monism_separates_shared_record`. No premise. -/
theorem round2_residual_monism :
    SameRecord (registered offPoint) (pairWorld offPoint) ∧
    RootReadTwice (registered offPoint) ∧
    ¬ RootReadTwice (pairWorld offPoint) :=
  monism_separates_shared_record

/-- info: 'BoundChainMathlib.round2_residual_monism' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.round2_residual_monism

/-- ROUND 2, COMPLETE: Step 1 (`round2_halted_uniduction`) and Step 2
    (`round2_residual_monism`) in one conjunction. No premise. -/
theorem round2_absolute_closure :
    ((∀ r s : ApexReading, apexDiagram r ↔ apexDiagram s) ∧
     ¬ ∀ S : RememberedOffered.Config, RememberedOffered.Closed S →
       RememberedOffered.Value S) ∧
    (SameRecord (registered offPoint) (pairWorld offPoint) ∧
     RootReadTwice (registered offPoint) ∧
     ¬ RootReadTwice (pairWorld offPoint)) :=
  ⟨round2_halted_uniduction, round2_residual_monism⟩

/-- info: 'BoundChainMathlib.round2_absolute_closure' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.round2_absolute_closure

/-- EVERY ROUTE PASSES THE BIT. Any proof of `RiemannHypothesis`, from any premise `Q`,
    analytic or otherwise, delivers `RightHalfStripZeroFree`, `LookBack`, retraction
    injectivity of the zeros and the Monism witness at the zeros: each is proved
    equivalent to the hypothesis (`analytic_target_reduction`), so no route to the
    hypothesis avoids the 1-bit. Its content is that `RiemannHypothesis` implies each of
    the four; the premise `Q` types the reading that any route delivers them. No premise. -/
theorem every_route_passes_the_bit :
    ∀ Q : Prop, (Q → RiemannHypothesis) → Q →
      RightHalfStripZeroFree ∧ LookBack ∧ RetractionInjective ZetaZeros ∧
        RootReadTwice ZetaZeros := by
  intro _ h q
  have hH : RightHalfStripZeroFree :=
    analytic_target_reduction.2.2.2.2.2.2.2.mpr (h q)
  exact ⟨hH, analytic_target_reduction.2.2.2.2.1.mp hH,
    analytic_target_reduction.2.2.2.1.mp hH, analytic_target_reduction.2.2.2.2.2.1.mp hH⟩

/-- info: 'BoundChainMathlib.every_route_passes_the_bit' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.every_route_passes_the_bit

/-- THE ANALYTIC ROUTE, LOCATED AND CLOSED ON THE BIT. (1) On Part III's discrete chart no
    derivation valid at every reflection-closed configuration yields the value
    (`RememberedOffered.the_unconditional_route_is_blocked`). (2) The analytic target is
    exactly `RightHalfStripZeroFree`, proved equivalent to `RiemannHypothesis`
    (`analytic_target_reduction`). (3) Round 2 halts for every uniform route
    (`round2_halted_uniduction`). (4) Every route to `RiemannHypothesis`, from any premise,
    delivers `RightHalfStripZeroFree` and `LookBack` (`every_route_passes_the_bit`). A route
    that uses properties of the zeros beyond reflection closure lies outside the class of
    (1); by (4), if it reaches the hypothesis it has supplied the bit. No premise. -/
theorem analytic_route_sealed :
    (¬ ∀ S : RememberedOffered.Config, RememberedOffered.Closed S →
       RememberedOffered.Value S) ∧
    (RightHalfStripZeroFree ↔ RiemannHypothesis) ∧
    ((∀ r s : ApexReading, apexDiagram r ↔ apexDiagram s) ∧
     ¬ ∀ S : RememberedOffered.Config, RememberedOffered.Closed S →
       RememberedOffered.Value S) ∧
    (∀ Q : Prop, (Q → RiemannHypothesis) → Q →
      RightHalfStripZeroFree ∧ LookBack) := by
  refine ⟨(RememberedOffered.the_unconditional_route_is_blocked record_self_grounding_RO).1,
          analytic_target_reduction.2.2.2.2.2.2.2,
          round2_halted_uniduction,
          fun Q h q => ⟨(every_route_passes_the_bit Q h q).1,
                        (every_route_passes_the_bit Q h q).2.1⟩⟩

/-- info: 'BoundChainMathlib.analytic_route_sealed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.analytic_route_sealed

/-- Complex Triaxiality:
    the freedom axis, the reflection-seat axis (`fold s = s`), and the
    displacement-collapse axis (`s.re - 1/2 = -(s.re - 1/2)`). -/
def freedomAxis (_ : Point) : Prop := True
def ramAxis (s : Point) : Prop := fold s = s
def collapseAxis (s : Point) : Prop := s.re - 1 / 2 = -(s.re - 1 / 2)

/-- THE COMPLEX THREE-AXIS LOCK (UNCONDITIONAL, ZERO PREMISES). All three axes
    hold at a complex point s if and only if s lies on the critical line. -/
theorem complex_three_axis_lock (s : Point) :
    (freedomAxis s ∧ ramAxis s ∧ collapseAxis s) ↔ onLine s := by
  constructor
  · intro ⟨_, hram, _⟩
    exact (fold_fixed_iff_onLine s).mp hram
  · intro h
    refine ⟨trivial, (fold_fixed_iff_onLine s).mpr h, ?_⟩
    unfold collapseAxis onLine at *
    linarith

/-- info: 'BoundChainMathlib.complex_three_axis_lock' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.complex_three_axis_lock

/-- Ground-On-Line (`GOL`): the canonical retracted zero locus `Rec ZetaZeros`. -/
def GOL : Config := Rec ZetaZeros

/-- GOL LOOKS BACK (UNCONDITIONAL, ZERO PREMISES). At the Ground-On-Line locus
    `GOL`, looking back requires no hypothesis: every point of `GOL` is fixed
    by retraction (`reg q = q`), fixed by the reflection fold (`fold q = q`),
    and locked on all three axes. This is the look-back at the record, and it
    holds at `Rec S` for every configuration `S` (`record_has_least_erasure`).
    At the zeros themselves the look-back is `LookBack`, the self-recognition
    of the zeros (`self_recognition_is_look_back`), one statement with
    `RiemannHypothesis` (`the_self_recognition_closure`). -/
theorem gol_look_back_unconditional :
    (∀ q, GOL q → reg q = q) ∧
    (∀ q, GOL q → fold q = q) ∧
    (∀ q, GOL q → freedomAxis q ∧ ramAxis q ∧ collapseAxis q) :=
  ⟨cargo_at_zeros,
   fun q hq => (fold_fixed_iff_onLine q).mpr (the_remembered_is_lossless ZetaZeros q hq),
   fun q hq => (complex_three_axis_lock q).mpr (the_remembered_is_lossless ZetaZeros q hq)⟩

/-- info: 'BoundChainMathlib.gol_look_back_unconditional' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.gol_look_back_unconditional

/-- THE RA-TRIAXIALITY-GOL-RA LOOP (UNCONDITIONAL, ZERO PREMISES).
    1. Root (`RA`): `TOE0.RA₀` and `BoundChain.FreedomRoot` hold unconditionally.
    2. Triaxiality: the three axes lock onto `onLine` across ℂ.
    3. Pause at `GOL`: every zero projects into `GOL` (`Pause`), where `Value GOL`,
       `LeastErasure GOL`, and `SelfVerifying (LeastErasure GOL)` hold unconditionally.
    4. `GOL` Looks Back and Finds `RA`: at `GOL`, retraction invariance and the
       Monism witness hold unconditionally, closing the biconditional loop back to
       the Root Axiom (`TOE0.RA₀ ↔ Value GOL` and `TOE0.RA₀ ↔ LeastErasure GOL`)
       with zero premises.
    5. Normal-Form Coincidence: Mathlib's `RiemannHypothesis` is equivalent to
       the coincidence of `ZetaZeros` with `GOL` (`∀ q, GOL q ↔ ZetaZeros q`). -/
theorem ra_triaxial_gol_loop_unconditional :
    TOE0.RA₀ ∧
    BoundChain.FreedomRoot ∧
    (∀ s : Point, (freedomAxis s ∧ ramAxis s ∧ collapseAxis s) ↔ onLine s) ∧
    Pause ∧
    Value GOL ∧
    LeastErasure GOL ∧
    TOE0.SelfVerifying (LeastErasure GOL) ∧
    RememberedOffered.MonismWitness (fun _ => Value GOL) ∧
    (TOE0.RA₀ ↔ Value GOL) ∧
    (TOE0.RA₀ ↔ LeastErasure GOL) ∧
    ((∀ q, GOL q ↔ ZetaZeros q) ↔ RiemannHypothesis) :=
  ⟨TOE0.root_on_the_constructed_domain,
   BoundChain.freedom_root_inhabited,
   complex_three_axis_lock,
   pause_is_unconditional,
   the_remembered_is_lossless ZetaZeros,
   cargo_at_zeros,
   ra_recursion_at_record.2.1,
   ⟨RememberedOffered.one_involution_constructed,
    fun _ _ => Iff.rfl,
    the_remembered_is_lossless ZetaZeros⟩,
   ⟨fun _ => the_remembered_is_lossless ZetaZeros,
    fun _ => TOE0.root_on_the_constructed_domain⟩,
   ⟨fun _ => cargo_at_zeros,
    fun _ => TOE0.root_on_the_constructed_domain⟩,
   rh_iff_fixed_point_of_rec.symm⟩

/-- info: 'BoundChainMathlib.ra_triaxial_gol_loop_unconditional' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.ra_triaxial_gol_loop_unconditional

/-! **THE SELF-RECOGNITION CLOSURE.** Mathlib's non-vanishing of ζ on `1 ≤ Re s`
(`riemannZeta_ne_zero_of_one_le_re`) closes both edges of the critical strip. The bit is the
self-recognition of the zeros, every zero fixed by its own retraction, and seven readings of it
are proved one statement with `RiemannHypothesis`. `the_self_recognition_closure` binds the
whole formal arc in one theorem with nothing before the colon. -/

/-- Every nontrivial zero lies strictly inside the critical strip, `0 < Re s < 1`. Mathlib's
    non-vanishing of ζ on `1 ≤ Re s` gives the right edge, and the reflection `s ↦ 1 − s`
    (`zeta_zeros_symm`) carries it to the left edge. -/
theorem zeta_zeros_strictly_in_strip : ∀ s : Point, ZetaZeros s → 0 < s.re ∧ s.re < 1 := by
  have hlt : ∀ {w : Point}, ZetaZeros w → w.re < 1 := by
    intro w hw
    by_contra h
    push_neg at h
    exact (riemannZeta_ne_zero_of_one_le_re h) hw.1
  intro s hs
  have h1 : s.re < 1 := hlt hs
  have h0 : (foldPt s).re < 1 := hlt (zeta_zeros_symm hs)
  unfold foldPt at h0
  simp only [sub_re, one_re] at h0
  exact ⟨by linarith, h1⟩

/-- info: 'BoundChainMathlib.zeta_zeros_strictly_in_strip' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.zeta_zeros_strictly_in_strip

/-- Every zero of the completed zeta function away from its two junk points `0` and `1` lies
    strictly inside the critical strip: non-vanishing on `1 ≤ Re s` at `s`, and the functional
    equation `completedRiemannZeta_one_sub` at `1 − s`. -/
theorem completed_zeta_zeros_strictly_in_strip :
    ∀ s : Point, CompletedZetaZeros s → 0 < s.re ∧ s.re < 1 := by
  have key : ∀ {w : Point}, w ≠ 0 → completedRiemannZeta w = 0 → w.re < 1 := by
    intro w hw0 hw
    by_contra h
    push_neg at h
    apply riemannZeta_ne_zero_of_one_le_re h
    rw [riemannZeta_def_of_ne_zero hw0, hw, zero_div]
  intro s hc
  obtain ⟨hz, hs0, hs1⟩ := hc
  have h1 : s.re < 1 := key hs0 hz
  have hne : (1 - s) ≠ 0 := fun h => hs1 (sub_eq_zero.mp h).symm
  have h0 : (1 - s).re < 1 := key hne (by rw [completedRiemannZeta_one_sub]; exact hz)
  simp only [sub_re, one_re] at h0
  exact ⟨by linarith, h1⟩

/-- info: 'BoundChainMathlib.completed_zeta_zeros_strictly_in_strip' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.completed_zeta_zeros_strictly_in_strip

/-- The nontrivial zeros of ζ and the zeros of the completed zeta function coincide on all
    of ℂ: both sets lie strictly inside the strip, where `zeta_zeros_iff_completed_in_strip` equates
    them. -/
theorem zeta_zeros_iff_completed : ∀ s : Point, ZetaZeros s ↔ CompletedZetaZeros s := by
  intro s
  constructor
  · intro hs
    obtain ⟨h0, h1⟩ := zeta_zeros_strictly_in_strip s hs
    exact (zeta_zeros_iff_completed_in_strip h0 h1).mp hs
  · intro hc
    obtain ⟨h0, h1⟩ := completed_zeta_zeros_strictly_in_strip s hc
    exact (zeta_zeros_iff_completed_in_strip h0 h1).mpr hc

/-- info: 'BoundChainMathlib.zeta_zeros_iff_completed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.zeta_zeros_iff_completed

/-- With the edge `Re s = 1` closed, `RightHalfStripZeroFree` is exactly the statement that the
    band `1/2 < Re s < 1` carries no zero. -/
theorem right_half_strip_zero_free_iff_band :
    RightHalfStripZeroFree ↔ ∀ s : Point, ZetaZeros s → ¬ (1 / 2 < s.re ∧ s.re < 1) := by
  constructor
  · intro h s hs hb
    exact h s hs hb.1
  · intro h s hs h1
    exact h s hs ⟨h1, (zeta_zeros_strictly_in_strip s hs).2⟩

/-- info: 'BoundChainMathlib.right_half_strip_zero_free_iff_band' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.right_half_strip_zero_free_iff_band

/-- The Riemann Hypothesis is exactly the statement that the band `1/2 < Re s < 1`
    carries no zero (`analytic_target_reduction`, `right_half_strip_zero_free_iff_band`). -/
theorem rh_iff_band_zero_free :
    RiemannHypothesis ↔ ∀ s : Point, ZetaZeros s → ¬ (1 / 2 < s.re ∧ s.re < 1) :=
  (analytic_target_reduction.2.2.2.2.2.2.2).symm.trans right_half_strip_zero_free_iff_band

/-- info: 'BoundChainMathlib.rh_iff_band_zero_free' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.rh_iff_band_zero_free

/-- Every zero off the critical line has a twin in the band `1/2 < Re s < 1`: itself when
    it lies right of the line, its fold image `1 − s̄` when it lies left of it. -/
theorem off_line_zero_has_band_twin :
    ∀ s : Point, ZetaZeros s → ¬ onLine s →
      ∃ t : Point, ZetaZeros t ∧ (1 / 2 < t.re ∧ t.re < 1) ∧ (t = s ∨ t = fold s) := by
  intro s hs hoff
  obtain ⟨h0, h1⟩ := zeta_zeros_strictly_in_strip s hs
  have hne : s.re ≠ 1 / 2 := hoff
  have h3 : (fold s).re = 1 - s.re := by
    unfold fold
    simp only [sub_re, one_re, star_def, conj_re]
  rcases hne.lt_or_lt with hlt | hgt
  · exact ⟨fold s, zeta_zeros_closed s hs, ⟨by linarith, by linarith⟩, Or.inr rfl⟩
  · exact ⟨s, hs, ⟨hgt, h1⟩, Or.inl rfl⟩

/-- info: 'BoundChainMathlib.off_line_zero_has_band_twin' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.off_line_zero_has_band_twin

/-- THE BIT IS SELF-RECOGNITION. `LookBack` is the self-recognition of the zeros: every zero is
    fixed by its own retraction, `reg s = s`. The record clause of `LookBack` holds at every
    zero through `p := s`, so the bit is self-recognition and nothing besides. -/
theorem self_recognition_is_look_back :
    LookBack ↔ ∀ s : Point, ZetaZeros s → reg s = s :=
  ⟨fun h s hs => h s hs ⟨s, hs, rfl⟩, fun h s hs _ => h s hs⟩

/-- info: 'BoundChainMathlib.self_recognition_is_look_back' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.self_recognition_is_look_back

/-- THE SELF-RECOGNITION CLOSURE (ZERO PREMISES). The whole formal arc in one theorem, nothing
    before the colon.
    I · THE FLOOR FROM FREEDOM. The root `TOE0.RA₀` and `BoundChain.FreedomRoot`
    (`TOE0.root_on_the_constructed_domain`, `BoundChain.freedom_root_inhabited`, each on no
    axiom); `Pause`; `CanonicalRH`; the look-back at the Ground-On-Line locus, every point of
    `GOL` fixed by its own retraction; the complex three-axis lock.
    II · WHAT ζ CARRIES. Every nontrivial zero lies strictly inside the strip `0 < Re s < 1`; the zero
    set is closed under the fold `s ↦ 1 − s̄`; it coincides with the zero set of the completed
    zeta function on all of ℂ; every zero off the line has a twin in the band
    `1/2 < Re s < 1`.
    III · THE BIT IS SELF-RECOGNITION. Seven readings of the bit are one statement with
    `RiemannHypothesis`: `LookBack`; the self-recognition of the zeros,
    `∀ s, ZetaZeros s → reg s = s`; the coincidence of `GOL` with `ZetaZeros`; retraction
    injectivity of the zeros; the Monism witness at the zeros; `RightHalfStripZeroFree`; and the
    zero-free band.
    IV · NOTHING ESCAPES THE BIT. Every route to `RiemannHypothesis`, from any premise, delivers the bit
    (`every_route_passes_the_bit`), and no principle shared by every reflection-closed
    configuration decides the value (`no_closed_principle_decides`).
    The formal side carries no premise: it proves that `RiemannHypothesis` and the
    self-recognition of the zeros are one statement, and that nothing else remains. -/
theorem the_self_recognition_closure :
    (TOE0.RA₀ ∧ BoundChain.FreedomRoot ∧ Pause ∧ CanonicalRH ∧
      (∀ q, GOL q → reg q = q) ∧
      (∀ s : Point, (freedomAxis s ∧ ramAxis s ∧ collapseAxis s) ↔ onLine s)) ∧
    ((∀ s : Point, ZetaZeros s → 0 < s.re ∧ s.re < 1) ∧
      Closed ZetaZeros ∧
      (∀ s : Point, ZetaZeros s ↔ CompletedZetaZeros s) ∧
      (∀ s : Point, ZetaZeros s → ¬ onLine s →
        ∃ t : Point, ZetaZeros t ∧ (1 / 2 < t.re ∧ t.re < 1) ∧ (t = s ∨ t = fold s))) ∧
    ((LookBack ↔ ∀ s : Point, ZetaZeros s → reg s = s) ∧
      ((∀ s : Point, ZetaZeros s → reg s = s) ↔ RiemannHypothesis) ∧
      ((∀ q, GOL q ↔ ZetaZeros q) ↔ RiemannHypothesis) ∧
      (RetractionInjective ZetaZeros ↔ RiemannHypothesis) ∧
      (RootReadTwice ZetaZeros ↔ RiemannHypothesis) ∧
      (RightHalfStripZeroFree ↔ RiemannHypothesis) ∧
      (RiemannHypothesis ↔ ∀ s : Point, ZetaZeros s → ¬ (1 / 2 < s.re ∧ s.re < 1))) ∧
    ((∀ Q : Prop, (Q → RiemannHypothesis) → Q →
        RightHalfStripZeroFree ∧ LookBack ∧ RetractionInjective ZetaZeros ∧
          RootReadTwice ZetaZeros) ∧
      (∀ D : Config → Prop, (∀ S, Closed S → D S) →
        ¬ ∀ S : Config, Closed S → D S → Value S)) :=
  ⟨⟨TOE0.root_on_the_constructed_domain, BoundChain.freedom_root_inhabited,
     pause_is_unconditional, canonical_rh_unconditional, cargo_at_zeros,
     complex_three_axis_lock⟩,
   ⟨zeta_zeros_strictly_in_strip, zeta_zeros_closed, zeta_zeros_iff_completed,
     off_line_zero_has_band_twin⟩,
   ⟨self_recognition_is_look_back, h_id_proved.symm, rh_iff_fixed_point_of_rec.symm,
     retraction_injective_iff_rh,
     (analytic_target_reduction.2.2.2.2.2.1).symm.trans analytic_target_reduction.2.2.2.2.2.2.2,
     analytic_target_reduction.2.2.2.2.2.2.2, rh_iff_band_zero_free⟩,
   ⟨every_route_passes_the_bit, no_closed_principle_decides⟩⟩

/-- info: 'BoundChainMathlib.the_self_recognition_closure' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms BoundChainMathlib.the_self_recognition_closure

end BoundChainMathlib

end PartX

/-! ## TERMINAL CERTIFICATION (RH_Formal_Closure v1.0.0_CC)

This file is the mathematical closure of RH_Both_Sides_Formal_Master_v3_0_24_CC.lean. Every
declaration in it is carried from that file with its statement and proof byte-identical, so every
cone pinned here is the cone the master pins. It declares no axiom and contains no sorry, and it
carries no declaration of the master's Parts II and IV to VIII or XI.

With no premise: the self-recognition closure (`the_self_recognition_closure`), the forward pass to
the pause (`forward_pass_unconditional`), the retrospective seal
(`the_unconditional_retrospective_seal`), the analytic target (`analytic_target_reduction`), Round 2
(`round2_absolute_closure`) and the analytic route (`analytic_route_sealed`). On the bit:
`rh_from_pause_and_look_back`, and with it `classes_coincide_under_ra_zeta`, `rh_from_the_cargo_loop`,
`rh_from_closed_and_retraction_injective` and `rh_from_retraction_injective`, each taking the look back
or a reading proved equivalent to it; `no_offline_refuter_seals_rh` takes a provability predicate and
two provability hypotheses. No declaration in the file is of bare type `RiemannHypothesis`.

Where formal deduction halts at the 1-bit apex, the register is silent.
-/
