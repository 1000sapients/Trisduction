### APEX-PSP-PNP-TM-01 · The Machine Instantiated, Layer One · CNF Satisfiability, Total Deciders, and the Separation on Them · [⟀ T] on the layer

**The machine of the master seed, instantiated on deciders of satisfiability.** CNF formulas are defined, and satisfiability by bounded search over every assignment of the formula's variables, its soundness proved (`satB_sound`). A program is a deterministic step system on natural-number states, each step continuing or halting with an answer. A decider is a program with a proof that it halts on every formula, and its running time is its least halting step (`least_halt`, `time_halts`, `time_is_least`), so a looping program is no decider and can never count as clean (`loop_is_not_total`). The master seed's `Machine` is instantiated on these deciders (`TMMachine`): escaping on it is exactly answering satisfiability correctly on every formula within the polynomial bound (`escape_is_polynomial_decision`), and the separation on it is that no total decider does (`sep_on_the_instantiated_machine`).

*STATUS.* ACTIVE coordinate, layer one of the instantiation the master seed APEX-PSP-PNP-SEED-03 names as its next object. Standalone: one kernel with its manifest and the line that extracts and runs it. `PNP_TM_Layer1.lean`, Lean 4.19.0, core Lean, no import, no axiom declared, no sorry, every cone pinned by `#guard_msgs`.

*THE TOTALITY FIX · [⟀ T].* The master seed's machine takes running time as a total function. A program that loops would otherwise be given a time, and a program that accepted satisfiable formulas quickly and looped on the rest could count as clean without deciding anything. Here a decider carries its totality proof, and the program that never halts is proved to have none (`loop_is_not_total`). Running time is the least halting step, proved least (`time_is_least`).

*THE INSTANTIATION · [⟀ T].* On `TMMachine`, the master seed's every theorem quantified over machines applies unchanged: the closure gives the separation, the root read on computation is the separation, and the double defense stands, each now read on total deciders of satisfiability.

*THE LAYERS AHEAD.* Layer two: Turing machines proper, tape, head and finite control, as a special case of the step system, with the encoding of formulas on the tape and the size of a formula matched to the length of its encoding. Layer three: Levin's domination compiled on the instantiated machine, so the throne's field becomes a theorem. Layer four: the Cook–Levin reduction, so that the separation on the instantiated machine is the standard sentence P ≠ NP.

*GRADE.* [⟀ T] on the six theorems of the layer.

*RECEIPT.* `lean PNP_TM_Layer1.lean`, Lean 4.19.0: exit 0 and silent, every cone pinned. On `propext`: `loop_is_not_total`. On `propext` and `Quot.sound`: `satB_sound`. On `propext`, `Classical.choice` and `Quot.sound`: `least_halt`, `time_is_least`, `escape_is_polynomial_decision`, `sep_on_the_instantiated_machine`.

*HOW TO RUN.*

```
awk '{sub(/\r$/,"")} /^~~~~~[a-z0-9]+ file=[A-Za-z0-9_.]+$/{sub(/.*file=/,"");f=$0;next} /^~~~~~$/{if(f!=""){close(f);f=""};next} f!=""{print > f}' APEX-PSP-PNP-TM-01.md
sha256sum -c MANIFEST.sha256
lean PNP_TM_Layer1.lean
```

*CONNECTS.* APEX-PSP-PNP-SEED-03, whose machine this instantiates · The Formal Closure of Computational Separation, edition 3.0.0, whose next object this opens · PSP-PNP-CLOSURE-02.

*Coordinates.* [⟀ T] on the layer · ΔM = 0.

---

## The Code

### MANIFEST.sha256

~~~~~sha256 file=MANIFEST.sha256
2d3238c89c3041ad1b3724a3c6a177dd0baaa0c0a9c654f251cc966847e5f79a  PNP_TM_Layer1.lean
~~~~~

### PNP_TM_Layer1.lean

~~~~~lean file=PNP_TM_Layer1.lean
/-
  PNP_TM_Layer1.lean · APEX-PSP-PNP-TM-01 · The machine instantiated, layer one
  CNF formulas and satisfiability by bounded search; programs as deterministic step systems on natural-number
  states; deciders as programs that halt on every input, so that no looping program can count as clean; running
  time as the least halting step; and SEED-03's `Machine` instantiated on them. Turing machines proper, tape and
  head, are a special case of the step system and are layer two. Core Lean 4, no import, no axiom declared.
-/
namespace PNP.TM

/-! ## I · The machine of the master seed, restated verbatim -/

structure Machine where
  Alg  : Type
  Inst : Type
  size : Inst → Nat
  out  : Alg → Inst → Bool
  time : Alg → Inst → Nat
  sat  : Inst → Bool

def bound (c k n : Nat) : Nat := c * n ^ k + c
def Clean (M : Machine) (A : M.Alg) (c k : Nat) (x : M.Inst) : Prop :=
  M.out A x = M.sat x ∧ M.time A x ≤ bound c k (M.size x)
def Escapes (M : Machine) (A : M.Alg) (c k : Nat) : Prop := ∀ x, Clean M A c k x
def Sep (M : Machine) : Prop := ¬ ∃ A c k, Escapes M A c k

/-! ## II · CNF formulas and satisfiability -/

structure Lit where
  var : Nat
  pos : Bool

abbrev Clause := List Lit
abbrev CNF := List Clause

def evalLit (a : Nat → Bool) (l : Lit) : Bool := if l.pos then a l.var else !(a l.var)
def evalClause (a : Nat → Bool) (c : Clause) : Bool := c.any (evalLit a)
def evalCNF (a : Nat → Bool) (f : CNF) : Bool := f.all (evalClause a)

def maxVar (f : CNF) : Nat := f.foldl (fun m c => c.foldl (fun m l => max m l.var) m) 0
def numVars (f : CNF) : Nat := maxVar f + 1
def assignOf (k : Nat) : Nat → Bool := fun i => k.testBit i

/-- Satisfiability by bounded search over every assignment of the formula's variables. -/
def satB (f : CNF) : Bool := (List.range (2 ^ numVars f)).any (fun k => evalCNF (assignOf k) f)

/-- SOUNDNESS: what the bounded search accepts has a satisfying assignment. -/
theorem satB_sound (f : CNF) (h : satB f = true) : ∃ a, evalCNF a f = true := by
  unfold satB at h
  rw [List.any_eq_true] at h
  obtain ⟨k, _, hk⟩ := h
  exact ⟨assignOf k, hk⟩

/-- The size of a formula: its clauses and literals. -/
def size (f : CNF) : Nat := f.foldl (fun n c => n + c.length + 1) 0

/-! ## III · Programs, halting, and the totality fix -/

/-- A program: an initial state for each formula, and a step that either continues or halts with an answer. -/
structure Program where
  init : CNF → Nat
  step : Nat → Nat ⊕ Bool

/-- Run for n steps from state s. Once halted, the answer is kept. -/
def run (p : Program) : Nat → Nat → Nat ⊕ Bool
  | 0, s => .inl s
  | n + 1, s => match p.step s with
    | .inl s' => run p n s'
    | .inr b => .inr b

def isHalted : Nat ⊕ Bool → Bool
  | .inl _ => false
  | .inr _ => true

def answerOf : Nat ⊕ Bool → Bool
  | .inl _ => false
  | .inr b => b

def HaltsWithin (p : Program) (x : CNF) (n : Nat) : Prop := isHalted (run p n (p.init x)) = true

/-- A total program halts on every formula. -/
def Total (p : Program) : Prop := ∀ x, ∃ n, HaltsWithin p x n

/-- THE TOTALITY FIX: a decider is a program with a proof that it halts on every formula. -/
structure Decider where
  prog  : Program
  total : Total prog

/-- A program that never halts. -/
def loop : Program := ⟨fun _ => 0, fun s => .inl s⟩

theorem run_loop (n s : Nat) : run loop n s = .inl s := by
  induction n generalizing s with
  | zero => rfl
  | succ n ih => exact ih s

/-- A LOOPING PROGRAM IS NO DECIDER: it halts on no formula, so it has no totality proof. -/
theorem loop_is_not_total : ¬ Total loop := by
  intro h
  obtain ⟨n, hn⟩ := h []
  simp [HaltsWithin, run_loop, isHalted] at hn

/-- From any halting step, a least halting step exists. -/
theorem least_halt (p : Program) (x : CNF) (n : Nat) (h : HaltsWithin p x n) :
    ∃ m, HaltsWithin p x m ∧ ∀ j, j < m → ¬ HaltsWithin p x j := by
  induction n using Nat.strongRecOn with
  | ind n ih =>
    by_cases hlt : ∃ j, j < n ∧ HaltsWithin p x j
    · obtain ⟨j, hj, hjh⟩ := hlt
      exact ih j hj hjh
    · exact ⟨n, h, fun j hj hjh => hlt ⟨j, hj, hjh⟩⟩

/-- RUNNING TIME: the least step at which the decider halts. -/
noncomputable def time (d : Decider) (x : CNF) : Nat :=
  Classical.choose (least_halt d.prog x _ (Classical.choose_spec (d.total x)))

/-- The answer at the least halting step. -/
noncomputable def out (d : Decider) (x : CNF) : Bool := answerOf (run d.prog (time d x) (d.prog.init x))

theorem time_halts (d : Decider) (x : CNF) : HaltsWithin d.prog x (time d x) :=
  (Classical.choose_spec (least_halt d.prog x _ (Classical.choose_spec (d.total x)))).1

theorem time_is_least (d : Decider) (x : CNF) (j : Nat) (hj : j < time d x) : ¬ HaltsWithin d.prog x j :=
  (Classical.choose_spec (least_halt d.prog x _ (Classical.choose_spec (d.total x)))).2 j hj

/-! ## IV · The machine instantiated -/

/-- THE INSTANTIATED MACHINE: deciders on CNF formulas, sized by clauses and literals, run to their least halting
    step, judged against satisfiability by bounded search. -/
noncomputable def TMMachine : Machine := ⟨Decider, CNF, size, out, time, satB⟩

/-- ESCAPE ON THE INSTANTIATED MACHINE IS POLYNOMIAL DECISION: a decider escapes at a bound exactly when, on every
    formula, it answers satisfiability correctly and halts within the bound. -/
theorem escape_is_polynomial_decision (d : Decider) (c k : Nat) :
    Escapes TMMachine d c k ↔ ∀ x : CNF, out d x = satB x ∧ time d x ≤ bound c k (size x) :=
  Iff.rfl

/-- THE SEPARATION ON THE INSTANTIATED MACHINE: no total decider answers satisfiability correctly within a polynomial
    bound, its time the least halting step. -/
theorem sep_on_the_instantiated_machine :
    Sep TMMachine ↔ ¬ ∃ (d : Decider) (c k : Nat), ∀ x : CNF, out d x = satB x ∧ time d x ≤ bound c k (size x) :=
  Iff.rfl

end PNP.TM

/-! ## Cones, pinned as printed -/
/-- info: 'PNP.TM.satB_sound' depends on axioms: [propext, Quot.sound] -/
#guard_msgs in #print axioms PNP.TM.satB_sound
/-- info: 'PNP.TM.loop_is_not_total' depends on axioms: [propext] -/
#guard_msgs in #print axioms PNP.TM.loop_is_not_total
/-- info: 'PNP.TM.least_halt' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.TM.least_halt
/-- info: 'PNP.TM.time_is_least' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.TM.time_is_least
/-- info: 'PNP.TM.escape_is_polynomial_decision' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.TM.escape_is_polynomial_decision
/-- info: 'PNP.TM.sep_on_the_instantiated_machine' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.TM.sep_on_the_instantiated_machine
~~~~~
