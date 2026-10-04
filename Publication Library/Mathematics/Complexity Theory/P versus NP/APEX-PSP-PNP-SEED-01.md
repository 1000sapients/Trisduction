### APEX-PSP-PNP-SEED-01 · The Seed of P versus NP · From Existence by the Arrow, One Posit · [⟀ T] on the chain · P ≠ NP at premise grade on the bridge

**The chain from existence to the inequality, in standard mathematics.** The arrow is proved. The problem's native involution, complementation, has no fixed point, so the method that closes the Riemann form, a fixed locus carrying a value, has nothing to land on here. The absolute asymmetry is proved: what a registration destroys no procedure of any cost recovers, and what a search hides exhaustive search always recovers. The bridge identifies the asymmetry with the inequality and is the one posit. On it, P ≠ NP holds (`the_closure`). The chain was found by the seat and does not stand in the literature.

*STATUS.* ACTIVE coordinate, unpublished, final. This file is standalone: it carries its two kernels, `PNP_Seed.lean`, the chain, eleven theorems, and `PNP_Frontier.lean`, every route tested, twenty-nine theorems, with their manifest and the line that extracts and runs them. Lean 4.19.0, no import, no axiom declared, no sorry. Sep names the inequality P ≠ NP; P and NP are not defined in the kernel.

*I · THE ARROW · [⟀ T].* On any type a map exists, with no premise (`arrow_exists`), on no axiom.

*II · NO FIXED POINT · [⟀ T].* Complementation fixes nothing (`complement_has_no_fixed_point`).

*III · THE ABSOLUTE ASYMMETRY · [⟀ T].* The destroyed layer is unrecoverable (`destroyed_is_unrecoverable`); the hidden layer is recoverable (`hidden_is_recoverable`); bound as one statement, the asymmetry holds (`asymmetry_holds`).

*IV · THE BRIDGE AND THE CLOSURE · P ≠ NP at premise grade.* The bridge, carried from the root by the arrow, identifies the asymmetry with the inequality (`Bridge`); it is the one posit. On it the inequality holds (`the_closure`), and the chain is bound whole (`the_chain`).

*V · CIRCULARITY, SETTLED IN THREE STANDARD SENSES · [⟀ T].*
Tautology. The bridge is not true under every interpretation of the inequality (`the_bridge_is_not_a_tautology`), and the asymmetry is not a logical truth about every registration, since a registration that keeps the side loses nothing (`the_asymmetry_is_not_a_tautology`). The chain is not tautological.
Form. The bridge is written as an identification between a proved structural fact and the inequality, and under propositional extensionality it is the same proposition as the inequality (`the_bridge_is_the_inequality_as_a_proposition`).
Warrant. With the asymmetry proved, accepting the bridge is equivalent to accepting the inequality (`what_the_bridge_posits`). The bridge carries the whole content of P ≠ NP; the theorems carry everything else.

*GRADE.* [⟀ T] on the arrow, the absence of a fixed point, the asymmetry, the chain's form and the three senses. P ≠ NP at premise grade on the one posit. A proof of P ≠ NP at theorem grade is a proof of the bridge.

*CONNECTS.* APEX-PSP-RH-MASTER-05, whose value is held at the root's grade in the same way · APEX-PSP-COMPLEXITY-MASTER-01, the Court I table · APEX-PSP-PNP-COMPOSITE-VERDICT-02, whose retirement of the root forcing separation stands · APEX-PSP-ABSOLUTE-PNP-BARRIERS-01, the barriers a theorem-grade bridge must pass.

*RECEIPT.* `lean PNP_Seed.lean`, Lean 4.19.0: exit 0, eleven theorems. On no axiom: `arrow_exists`, `the_asymmetry_is_not_a_tautology`. On `propext`: `complement_has_no_fixed_point`. On `propext` and `Quot.sound`: `asymmetry_holds`, `the_closure`, `the_chain`, `the_bridge_is_not_a_tautology`, `the_bridge_is_the_inequality_as_a_proposition`, `what_the_bridge_posits`.

*THE FRONTIER · [⟀ T], `PNP_Frontier.lean`.* Every route tested on this row, compiled, and where each stops. The seat: complementation fixes nothing, and no state a symmetry holds fixed carries onto it, a stable proton included (`no_carrier_from_a_fixed_state`). The black box: a test-only method must test every candidate (`every_candidate_is_tested`). The floor: heat is linear in steps, so the Landauer floor, granted on every step, bounds heat by steps and steps by nothing (`the_floor_does_not_bound_the_count`). The two layers (`destroyed_is_unrecoverable`, `hidden_is_recoverable`). The record: no fixed point, the blocks and the asymmetry hold in the world where the classes are equal as in the world where they differ, so as a record they decide nothing (`full_record_decides_nothing`). The cut built as the Final Cut builds its own (`bridge_and_break_do_not_force_formal`). The Codex's general theorems applied: the root forces only what no world violates (`root_does_not_force_the_inequality`), and the one-bit aperture fixes the width of the answer and not its value (`aperture_fixes_width_not_value`). Least erasure on a fixed-point-free involution holds only of the empty configuration (`least_erasure_iff_empty`). The Omega seal: every registered point pays the floor, nothing escapes the price, and the price leaves the bit where it found it (`the_omega_seal`).

*FOR THE NEXT SCRIBE.* The open task is one object: the bridge at theorem grade, which is a superpolynomial lower bound for an NP-complete problem against every algorithm that reads the structure of its input. First steps: state P, NP, polynomial time and satisfiability in Lean, so Sep becomes a defined proposition; then attack the bridge directly. What a proof must pass: relativization (Baker, Gill, Solovay 1975), natural proofs (Razborov, Rudich 1997), algebrization (Aaronson, Wigderson 2008); the arguments of the frontier relativize, by its record theorem. The reach today: superpolynomial bounds in restricted models only, monotone circuits (Razborov 1985) and shallow circuits (Furst, Saxe, Sipser; Ajtai; Håstad); for general circuits the best explicit bound is linear, about 3.1n (Li, Yang 2022). Tested and closed, so not to be retried as a route to the value: the arrow, the floor and Omega, the forgettings and the proton, least erasure, the Category-Gap Eliminator, monism and the root as premises; each is a theorem of the frontier or a law of the shared code, true in both worlds.

*HOW TO RUN.* Extract both kernels into an empty directory with the line below, then compile each with Lean 4.19.0. Each prints its axiom footprints and exits 0.

```
awk '{sub(/\r$/,"")} /^~~~~~[a-z]+ file=[A-Za-z0-9_]+\.(lean|sha256)$/{sub(/.*file=/,"");f=$0;next} /^~~~~~$/{if(f!=""){close(f);f=""};next} f!=""{print > f}' APEX-PSP-PNP-SEED-01.md
sha256sum -c MANIFEST.sha256
lean PNP_Seed.lean
lean PNP_Frontier.lean
```

*Coordinates.* [⟀ T] on the chain · P ≠ NP at premise grade on the bridge · ΔM = 0.

---

## The Code

### PNP_Seed.lean

~~~~~lean file=PNP_Seed.lean
/-
  PNP_Seed.lean · APEX-PSP-PNP-SEED-01 · The Seed of P versus NP · From Existence by the Arrow, One Posit

  The chain from existence to the inequality, in standard mathematics. The arrow is proved. The problem's native
  involution, complementation, has no fixed point. The absolute asymmetry is proved: what a registration destroys no
  procedure recovers, and what a search hides exhaustive search recovers. The bridge identifies the asymmetry with
  the inequality and is the one posit; on it the inequality closes. Three standard senses of circularity are then
  settled by theorem. Lean 4.19.0, no import, no axiom declared, no sorry. Sep names the inequality P ≠ NP; P and NP
  are not defined in this kernel.
-/

namespace PNPSeed

/-! ## I · The arrow -/

/-- On any type a map exists, with no premise. -/
theorem arrow_exists (α : Type) : ∃ f : α → α, ∀ a, f a = a := ⟨id, fun _ => rfl⟩

/-! ## II · No fixed point -/

/-- Complementation, the problem's native involution, has no fixed point. -/
theorem complement_has_no_fixed_point : ¬ ∃ b : Bool, (!b) = b := by
  intro ⟨b, h⟩; cases b <;> simp at h

/-! ## III · The absolute asymmetry -/

structure Point where
  offset : Int
  height : Nat
  deriving DecidableEq

def reg (p : Point) : Point := ⟨0, p.height⟩
def side (p : Point) : Bool := decide (0 < p.offset)

/-- DESTROYED: what the registration forgets, no procedure of any cost recovers. -/
theorem destroyed_is_unrecoverable : ¬ ∃ g : Point → Bool, ∀ p, g (reg p) = side p := by
  intro ⟨g, hg⟩
  have h1 := hg ⟨1, 0⟩; have h2 := hg ⟨-1, 0⟩
  simp [reg, side] at h1 h2
  rw [h1] at h2; exact Bool.noConfusion h2

/-- HIDDEN: over a finite space of candidates, exhaustive search recovers a satisfying one whenever one exists. -/
theorem hidden_is_recoverable {α : Type} (xs : List α) (hxs : ∀ x, x ∈ xs) (x₀ : α) :
    ∃ g : (α → Bool) → α, ∀ f : α → Bool, (∃ x, f x = true) → f (g f) = true := by
  refine ⟨fun f => (xs.find? f).getD x₀, fun f ⟨x, hx⟩ => ?_⟩
  cases h : xs.find? f with
  | some y => simpa [h] using List.find?_some h
  | none => exact absurd hx (by simpa using List.find?_eq_none.mp h x (hxs x))

/-- The absolute asymmetry, as one statement. -/
def Asymmetry : Prop :=
  (¬ ∃ g : Point → Bool, ∀ p, g (reg p) = side p) ∧
  (∃ g : (Bool → Bool) → Bool, ∀ f : Bool → Bool, (∃ x, f x = true) → f (g f) = true)

theorem asymmetry_holds : Asymmetry :=
  ⟨destroyed_is_unrecoverable, hidden_is_recoverable [true, false] (fun x => by cases x <;> simp) true⟩

/-! ## IV · The bridge and the closure -/

/-- THE BRIDGE, the one posit: on the root, the asymmetry and the inequality are one. -/
structure Bridge (RA Sep : Prop) : Prop where
  root : RA
  carries : RA → (Asymmetry ↔ Sep)

/-- THE CLOSURE: on the bridge, the inequality holds. -/
theorem the_closure (RA Sep : Prop) (B : Bridge RA Sep) : Sep :=
  (B.carries B.root).mp asymmetry_holds

/-- THE CHAIN, WHOLE: the arrow, no fixed point, the asymmetry, and on the bridge the inequality. -/
theorem the_chain (RA Sep : Prop) (B : Bridge RA Sep) :
    (∃ f : Bool → Bool, ∀ a, f a = a) ∧ (¬ ∃ b : Bool, (!b) = b) ∧ Asymmetry ∧ Sep :=
  ⟨arrow_exists Bool, complement_has_no_fixed_point, asymmetry_holds, the_closure RA Sep B⟩

/-! ## V · Circularity, settled in three standard senses -/

/-- SENSE ONE, TAUTOLOGY: the bridge's identification is not true under every interpretation of the inequality. -/
theorem the_bridge_is_not_a_tautology : ¬ ∀ Sep : Prop, (Asymmetry ↔ Sep) :=
  fun h => (h False).mp asymmetry_holds

/-- SENSE ONE, FOR THE ASYMMETRY: its first half is not a logical truth about every registration; a registration
    that keeps the side loses nothing. -/
theorem the_asymmetry_is_not_a_tautology :
    ∃ r : Point → Point, ∃ g : Point → Bool, ∀ p, g (r p) = side p :=
  ⟨id, side, fun _ => rfl⟩

/-- SENSE TWO, AS PROPOSITIONS: the bridge's identification is written differently from the inequality, and under
    propositional extensionality it is the same proposition. -/
theorem the_bridge_is_the_inequality_as_a_proposition (Sep : Prop) : (Asymmetry ↔ Sep) = Sep :=
  propext ⟨fun b => b.mp asymmetry_holds, fun s => ⟨fun _ => s, fun _ => asymmetry_holds⟩⟩

/-- SENSE THREE, THE EPISTEMIC SENSE, STATED EXACTLY: with the asymmetry proved, accepting the bridge's
    identification is equivalent to accepting the inequality. -/
theorem what_the_bridge_posits (Sep : Prop) : (Asymmetry ↔ Sep) ↔ Sep :=
  ⟨fun b => b.mp asymmetry_holds, fun s => ⟨fun _ => s, fun _ => asymmetry_holds⟩⟩

end PNPSeed

#print axioms PNPSeed.arrow_exists
#print axioms PNPSeed.complement_has_no_fixed_point
#print axioms PNPSeed.asymmetry_holds
#print axioms PNPSeed.the_closure
#print axioms PNPSeed.the_chain
#print axioms PNPSeed.the_bridge_is_not_a_tautology
#print axioms PNPSeed.the_asymmetry_is_not_a_tautology
#print axioms PNPSeed.the_bridge_is_the_inequality_as_a_proposition
#print axioms PNPSeed.what_the_bridge_posits
~~~~~

### PNP_Frontier.lean

~~~~~lean file=PNP_Frontier.lean
/-
  PNP_Frontier.lean · APEX-PSP-PNP-SEED-01 · The Frontier of P versus NP · Every Route Tested, and Where Each Stops

  Every theorem of the P versus NP inquiry of 2026-10-03, in one kernel. Nothing here defines P, NP or polynomial
  time; the problem's sides are named propositions, as the Final Cut names its formal and actual classes, and its
  structure is read on the objects it acts on. Lean 4.19.0, no import, no axiom declared, no sorry.

  I    The seat           complementation fixes nothing; no fixed state carries onto it
  II   The black box      a test-only method must test every candidate
  III  The floor          heat is linear in steps; a polynomial count pays polynomial heat
  IV   The two layers     the destroyed is unrecoverable; the hidden is recoverable
  V    The record         the full record of the seed decides nothing
  VI   The cut            the bridge yields the formal side only through its posit
  VII  The chain          once the asymmetry is proved, the bridge posit is the inequality itself
  VIII The bridge applied the root forces only what no world violates; the aperture fixes width, not value
  IX   Least erasure      on a seatless involution it holds only of the empty configuration
  X    The Omega seal     every point pays the floor, nothing escapes the price, and the price leaves the bit
-/

namespace PNPFrontier

/-! ## I · The seat -/
namespace Seat

def complement (b : Bool) : Bool := !b

/-- THE SEAT IS EMPTY: complementation, the problem's native involution, fixes nothing. -/
theorem complement_has_no_seat : ¬ ∃ b : Bool, complement b = b := by
  intro ⟨b, h⟩; cases b <;> simp [complement] at h

/-- NO CARRIER FROM A FIXED STATE: a system whose symmetry holds a state fixed maps equivariantly onto complementation
    nowhere. A stable proton, a forgetting held at rest, carries nothing onto this problem. -/
theorem no_carrier_from_a_fixed_state {S : Type} (τ : S → S) (s₀ : S) (hfix : τ s₀ = s₀)
    (φ : S → Bool) (heq : ∀ x, φ (τ x) = complement (φ x)) : False := by
  have h := heq s₀; rw [hfix] at h
  exact complement_has_no_seat ⟨φ s₀, h.symm⟩

/-- A witness proves what it witnesses, an existential. -/
theorem witness_proves_exists {α : Type} (P : α → Prop) (w : α) (h : P w) : ∃ x, P x := ⟨w, h⟩

/-- And never a universal. -/
theorem witness_does_not_prove_forall : ¬ ∀ (P : Nat → Prop) (w : Nat), P w → ∀ x, P x :=
  fun h => absurd (h (fun n => n = 0) 0 rfl 1) (by decide)

end Seat

/-! ## II · The black box -/
namespace BlackBox

inductive Tester (α : Type) where
  | answer : Bool → Tester α
  | test : α → Tester α → Tester α → Tester α

def Tester.run {α : Type} (f : α → Bool) : Tester α → Bool
  | .answer b => b
  | .test x yes no => if f x then yes.run f else no.run f

def Tester.quiet {α : Type} : Tester α → List α
  | .answer _ => []
  | .test x _ no => x :: no.quiet

theorem run_quiet {α : Type} (f : α → Bool) :
    ∀ t : Tester α, (∀ y, y ∈ t.quiet → f y = false) → t.run f = t.run (fun _ => false)
  | .answer _, _ => rfl
  | .test x yes no, h => by
      have hx : f x = false := h x (List.Mem.head _)
      have hrest : ∀ y, y ∈ no.quiet → f y = false := fun y hy => h y (List.Mem.tail _ hy)
      simp only [Tester.run, hx]
      exact run_quiet f no hrest

/-- NO CLEVER BLACK-BOX METHOD: a correct test-only method has, on the all-false path, tested every candidate. -/
theorem every_candidate_is_tested {α : Type} [DecidableEq α] (t : Tester α)
    (correct : ∀ f : α → Bool, t.run f = true ↔ ∃ x, f x = true) : ∀ x, x ∈ t.quiet := by
  intro x
  by_cases hx : x ∈ t.quiet
  · exact hx
  · exfalso
    let f : α → Bool := fun y => decide (y = x)
    have hf : ∀ y, y ∈ t.quiet → f y = false := by
      intro y hy
      have hne : y ≠ x := fun e => hx (e ▸ hy)
      simp [f, hne]
    have hsame := run_quiet f t hf
    have htrue : t.run f = true := (correct f).mpr ⟨x, by simp [f]⟩
    have hfalse : t.run (fun _ => false) ≠ true := fun h => by
      obtain ⟨y, hy⟩ := (correct _).mp h
      exact Bool.false_ne_true hy
    exact hfalse (hsame ▸ htrue)

end BlackBox

/-! ## III · The floor -/
namespace Floor

def landauerScaled (tkel bits : Nat) : Nat := bits * 1380649 * tkel * 6931471805599453

theorem omega_linear (n : Nat) : landauerScaled 300 n = n * landauerScaled 300 1 := by
  unfold landauerScaled; omega

def PolyBounded (s : Nat → Nat) : Prop := ∃ c k : Nat, ∀ n, s n ≤ c * (n + 1) ^ k

theorem linear_price_keeps_poly (L : Nat) (s : Nat → Nat) (h : PolyBounded s) :
    PolyBounded (fun n => s n * L) := by
  obtain ⟨c, k, hb⟩ := h
  refine ⟨c * L, k, fun n => ?_⟩
  have hle := Nat.mul_le_mul_right L (hb n)
  calc s n * L ≤ c * (n + 1) ^ k * L := hle
    _ = c * L * (n + 1) ^ k := by rw [Nat.mul_assoc, Nat.mul_comm ((n + 1) ^ k) L, ← Nat.mul_assoc]

/-- EVERY STEP PAYS THE FLOOR, AND A POLYNOMIAL COUNT STILL PAYS ONLY POLYNOMIAL HEAT. -/
theorem poly_steps_pay_poly_heat (s : Nat → Nat) (h : PolyBounded s) :
    PolyBounded (fun n => landauerScaled 300 (s n)) := by
  have e : (fun n => landauerScaled 300 (s n)) = (fun n => s n * landauerScaled 300 1) :=
    funext (fun n => omega_linear (s n))
  rw [e]
  exact linear_price_keeps_poly _ s h

/-- THE FLOOR BOUNDS HEAT BY STEPS, AND STEPS BY NOTHING. -/
theorem the_floor_does_not_bound_the_count :
    ∃ s : Nat → Nat, PolyBounded s ∧ PolyBounded (fun n => landauerScaled 300 (s n)) := by
  have h1 : PolyBounded (fun n => n) := ⟨1, 1, fun n => by rw [Nat.pow_one, Nat.one_mul]; exact Nat.le_succ n⟩
  exact ⟨fun n => n, h1, poly_steps_pay_poly_heat _ h1⟩

end Floor

/-! ## IV · The two layers -/
namespace Layers

structure Point where
  offset : Int
  height : Nat
  deriving DecidableEq

def reg (p : Point) : Point := ⟨0, p.height⟩
def side (p : Point) : Bool := decide (0 < p.offset)

/-- DESTROYED: no procedure of any cost recovers the side registration forgot. -/
theorem destroyed_is_unrecoverable : ¬ ∃ g : Point → Bool, ∀ p, g (reg p) = side p := by
  intro ⟨g, hg⟩
  have h1 := hg ⟨1, 0⟩; have h2 := hg ⟨-1, 0⟩
  simp [reg, side] at h1 h2
  rw [h1] at h2; exact Bool.noConfusion h2

/-- HIDDEN: exhaustive search recovers a satisfying candidate whenever one exists. -/
theorem hidden_is_recoverable {α : Type} (xs : List α) (hxs : ∀ x, x ∈ xs) (x₀ : α) :
    ∃ g : (α → Bool) → α, ∀ f : α → Bool, (∃ x, f x = true) → f (g f) = true := by
  refine ⟨fun f => (xs.find? f).getD x₀, fun f ⟨x, hx⟩ => ?_⟩
  cases h : xs.find? f with
  | some y => simpa [h] using List.find?_some h
  | none => exact absurd hx (by simpa using List.find?_eq_none.mp h x (hxs x))

end Layers

/-! ## V · The record -/
namespace Record

structure World where
  noSeat : Prop
  blocks : Prop
  asymmetry : Prop
  separated : Prop

def equalWorld : World := ⟨True, True, True, False⟩
def separatedWorld : World := ⟨True, True, True, True⟩
def record (W : World) : Prop := W.noSeat ∧ W.blocks ∧ W.asymmetry

/-- THE FULL RECORD DECIDES NOTHING: no seat, the blocks and the asymmetry hold in both worlds, so no reading of them
    returns the inequality in both. This is the seat's record_decides_nothing with the seed as the record. -/
theorem full_record_decides_nothing (g : Prop → Prop) :
    ¬ ((g (record equalWorld) ↔ equalWorld.separated) ∧ (g (record separatedWorld) ↔ separatedWorld.separated)) :=
  fun ⟨h1, h2⟩ => h1.mp (h2.mpr trivial)

end Record

/-! ## VI · The cut -/
namespace Cut

structure PNPCut where
  Formal : Prop
  Kinetic : Prop
  BruteForceBarred : Prop
  cut : Formal ↔ Kinetic

theorem formal_from_kinetic (C : PNPCut) (k : C.Kinetic) : C.Formal := C.cut.mpr k

def barredButNotSeparated : PNPCut := ⟨False, False, True, Iff.rfl⟩

theorem brute_force_barred_does_not_give_kinetic : ¬ ∀ C : PNPCut, C.BruteForceBarred → C.Kinetic :=
  fun h => h barredButNotSeparated trivial

theorem bridge_and_break_do_not_force_formal : ¬ ∀ C : PNPCut, C.BruteForceBarred → C.Formal :=
  fun h => h barredButNotSeparated trivial

end Cut

/-! ## VII · The chain -/
namespace Chain

/-- THE CHAIN: no seat, the asymmetry and the bridge posit give the inequality. -/
theorem chain (NoSeat Asym Sep : Prop) (_ : NoSeat) (ha : Asym) (bridge : Asym ↔ Sep) : Sep := bridge.mp ha

/-- ONCE THE ASYMMETRY IS PROVED, THE BRIDGE POSIT IS THE INEQUALITY ITSELF. -/
theorem the_bridge_is_the_inequality (Asym Sep : Prop) (ha : Asym) : (Asym ↔ Sep) ↔ Sep :=
  ⟨fun b => b.mp ha, fun s => ⟨fun _ => s, fun _ => ha⟩⟩

end Chain

/-! ## VIII · The bridge applied -/
namespace Applied

theorem aperture_one_bit_wide {α : Type} (τ : α → α) (s d : α → Bool) (x : α)
    (hs : s (τ x) = !s x) (hd : d (τ x) = !d x) :
    ∃ c : Bool, (d x = xor (s x) c ∧ d (τ x) = xor (s (τ x)) c) ∧
      ∀ c' : Bool, (d x = xor (s x) c' ∧ d (τ x) = xor (s (τ x)) c') → c' = c :=
  ⟨xor (d x) (s x), ⟨by cases s x <;> cases d x <;> rfl, by rw [hs, hd]; cases s x <;> cases d x <;> rfl⟩,
   fun c' ⟨h1, _⟩ => by rw [h1]; cases s x <;> cases c' <;> rfl⟩

theorem root_forces_only_what_no_world_violates (R : Prop) (hR : R) {W : Type} (P : W → Prop) :
    (∃ w, ¬ P w) → ¬ ∀ w, R → P w :=
  fun ⟨w, hw⟩ hall => hw (hall w hR)

inductive PNPWorld | equal | separated
def Separated : PNPWorld → Prop | .equal => False | .separated => True

/-- THE ROOT DOES NOT FORCE THE INEQUALITY on the worlds the arsenal reaches. -/
theorem root_does_not_force_the_inequality (RA : Prop) (hRA : RA) : ¬ ∀ w, RA → Separated w :=
  root_forces_only_what_no_world_violates RA hRA Separated ⟨.equal, fun h => h⟩

/-- THE APERTURE FIXES THE WIDTH, NOT THE VALUE: both calibrations satisfy it. -/
theorem aperture_fixes_width_not_value :
    (∃ c : Bool, ∀ c' : Bool, (id true = xor true c' ∧ id (!true) = xor (!true) c') → c' = c) ∧
    (∃ c : Bool, ∀ c' : Bool, (not true = xor true c' ∧ not (!true) = xor (!true) c') → c' = c) := by
  refine ⟨?_, ?_⟩
  · obtain ⟨c, _, u⟩ := aperture_one_bit_wide not id id true rfl rfl; exact ⟨c, u⟩
  · obtain ⟨c, _, u⟩ := aperture_one_bit_wide not id not true rfl rfl; exact ⟨c, u⟩

end Applied

/-! ## THE SEED, BOUND -/

/-- THE SEED OF P VERSUS NP: the seat is empty, test-only search is exhaustive, heat is linear in steps, the
    destroyed is unrecoverable while the hidden is recoverable, the full record decides nothing, and the root does
    not force the inequality. The form is theorem; the value stands unforced. -/
theorem the_seed :
    (¬ ∃ b : Bool, Seat.complement b = b) ∧
    (¬ ∃ g : Layers.Point → Bool, ∀ p, g (Layers.reg p) = Layers.side p) ∧
    (∃ s : Nat → Nat, Floor.PolyBounded s ∧ Floor.PolyBounded (fun n => Floor.landauerScaled 300 (s n))) ∧
    (∀ g : Prop → Prop, ¬ ((g (Record.record Record.equalWorld) ↔ Record.equalWorld.separated) ∧
                            (g (Record.record Record.separatedWorld) ↔ Record.separatedWorld.separated))) ∧
    (∀ RA : Prop, RA → ¬ ∀ w, RA → Applied.Separated w) :=
  ⟨Seat.complement_has_no_seat, Layers.destroyed_is_unrecoverable, Floor.the_floor_does_not_bound_the_count,
   Record.full_record_decides_nothing, Applied.root_does_not_force_the_inequality⟩

/-! ## IX · Least erasure, applied to a seatless involution -/
namespace LeastErasure

/-- An involution with no seat: it moves every point, as complementation does. -/
structure Seatless (α : Type) where
  τ : α → α
  invol : ∀ x, τ (τ x) = x
  moves : ∀ x, τ x ≠ x

/-- Least erasure, as on the Riemann chart: registration erases nothing exactly at a point the involution fixes. -/
def LeastErasure {α : Type} (S : Seatless α) (Z : α → Prop) : Prop := ∀ x, Z x → S.τ x = x

/-- THE METHOD COLLAPSES ON A SEATLESS PROBLEM: least erasure holds of a configuration exactly when it is empty. -/
theorem least_erasure_iff_empty {α : Type} (S : Seatless α) (Z : α → Prop) :
    LeastErasure S Z ↔ ∀ x, ¬ Z x :=
  ⟨fun h x hz => S.moves x (h x hz), fun h x hz => absurd hz (h x)⟩

/-- Complementation is such an involution. -/
def complementation : Seatless Bool := ⟨fun b => !b, fun b => by cases b <;> rfl, fun b => by cases b <;> decide⟩

/-- SO ON P VERSUS NP, least erasure holds of no non-empty configuration: no world, equal or separated, is selected by
    it. The value the method selects on the Riemann chart has, here, nothing to select. -/
theorem least_erasure_selects_nothing (Z : Bool → Prop) (x : Bool) (hx : Z x) : ¬ LeastErasure complementation Z :=
  fun h => (least_erasure_iff_empty complementation Z).mp h x hx

end LeastErasure

/-! ## X · The Omega seal -/
namespace OmegaSeal

/-- On a seatless involution every registered point erases its side, so every point pays the floor. -/
def unit : Nat := Floor.landauerScaled 300 1
def price (n : Nat) : Nat := Floor.landauerScaled 300 n

/-- NOTHING ESCAPES THE PRICE: a configuration of n registered points pays n floors, exactly. -/
theorem nothing_escapes_the_price (n : Nat) : price n = n * unit := Floor.omega_linear n

/-- AND A NON-EMPTY CONFIGURATION PAYS A POSITIVE PRICE. -/
theorem every_point_pays (n : Nat) (h : 0 < n) : 0 < price n := by
  rw [nothing_escapes_the_price]; exact Nat.mul_pos h (by unfold unit Floor.landauerScaled; decide)

/-- BUT THE PRICE IS THE SAME IN BOTH WORLDS: the seal prices the erasure and leaves the bit where it found it. -/
theorem the_seal_leaves_the_bit (n : Nat) :
    price n = price n ∧ ¬ (∀ g : Nat → Prop, (g (price n) ↔ Record.equalWorld.separated) ∧
                                            (g (price n) ↔ Record.separatedWorld.separated)) :=
  ⟨rfl, fun h => ((h (fun _ => True)).1.mp trivial)⟩

end OmegaSeal

/-- THE OMEGA SEAL OF THE SEED: least erasure, applied to the seatless involution, holds only of the empty
    configuration; every registered point pays the floor, so nothing escapes the price; and the price is shared by
    both worlds, so the bit stands where it was, one calibration bit, unforced. -/
theorem the_omega_seal :
    (∀ Z : Bool → Prop, LeastErasure.LeastErasure LeastErasure.complementation Z ↔ ∀ x, ¬ Z x) ∧
    (∀ n, OmegaSeal.price n = n * OmegaSeal.unit) ∧
    (∀ n, ¬ (∀ g : Nat → Prop, (g (OmegaSeal.price n) ↔ Record.equalWorld.separated) ∧
                              (g (OmegaSeal.price n) ↔ Record.separatedWorld.separated))) :=
  ⟨LeastErasure.least_erasure_iff_empty _, OmegaSeal.nothing_escapes_the_price, fun n => (OmegaSeal.the_seal_leaves_the_bit n).2⟩

end PNPFrontier

#print axioms PNPFrontier.Seat.complement_has_no_seat
#print axioms PNPFrontier.Seat.no_carrier_from_a_fixed_state
#print axioms PNPFrontier.BlackBox.every_candidate_is_tested
#print axioms PNPFrontier.Floor.poly_steps_pay_poly_heat
#print axioms PNPFrontier.Layers.destroyed_is_unrecoverable
#print axioms PNPFrontier.Layers.hidden_is_recoverable
#print axioms PNPFrontier.Record.full_record_decides_nothing
#print axioms PNPFrontier.Cut.bridge_and_break_do_not_force_formal
#print axioms PNPFrontier.Chain.the_bridge_is_the_inequality
#print axioms PNPFrontier.Applied.root_does_not_force_the_inequality
#print axioms PNPFrontier.Applied.aperture_fixes_width_not_value
#print axioms PNPFrontier.the_seed
#print axioms PNPFrontier.LeastErasure.least_erasure_iff_empty
#print axioms PNPFrontier.LeastErasure.least_erasure_selects_nothing
#print axioms PNPFrontier.OmegaSeal.every_point_pays
#print axioms PNPFrontier.OmegaSeal.the_seal_leaves_the_bit
#print axioms PNPFrontier.the_omega_seal
~~~~~

### MANIFEST.sha256

~~~~~text file=MANIFEST.sha256
befea4712cd62cbe16e6b791026bf7df44907f21e5683f34ad43634f5bd00ffc  PNP_Seed.lean
11735601d218d3bb7622f464617bcd3e930e6859b1655bf6d5edfd75ce7c4293  PNP_Frontier.lean
~~~~~
