import Lean
/-!
# The Definition Screen · Fertility, Obedience, Freedom · v1.0.0_CC

RATIONALE. A Lean file can compile, carry no `sorry`, declare no axiom, and still rest its named argument on
definitions that say nothing. This file states, in core Lean and on no axiom, exactly what such a definition
can and cannot do, and it ships a command that looks for the pattern on the path of a headline theorem.

DESIGN. Three parts, in the order of the manual.
  Part F · FERTILITY. Composition is free: a certificate, once minted, travels along every arrow.
  Part O · OBEDIENCE. Six drills on a load-bearing definition (Mother Codex, sPSP-TONGUE-UNCLOSED-01, Section X),
           each paired with the gate of the axiom screen that enforces it.
  Part V · FREEDOM. What clearing the drills earns, and its bound: veto and never substitution.
  Part S · THE SCAN. A command that walks the constants a headline uses and prints flags for a human to read.

NON-NEGOTIABLES.
  1. No `axiom`, no `sorry`, no `native_decide`. Every theorem is pinned to "does not depend on any axioms".
  2. This file rules on no outside proof. `middle_vacuity_does_not_void_the_headline` is a theorem here: a
     vacuous definition in the middle of a closed term cannot unprove a headline stated in trusted words.
  3. The scan FLAGS. It proves nothing about the file it reads. A flag is a place to read, never a verdict.
  4. Model names (`Config`, `Goal`, `Side`) are abstract on purpose. Nothing here is a statement about any
     particular archive; the manual applies the theorems, with its receipts, in prose.

RISKS. The scan is syntactic: a vacuous predicate in a dress the scan does not know passes unflagged, and a
flag can land on an honest definition. Both are stated in the manual. Compiled with Lean 4.19.0, warnings fatal.
-/

namespace Screen
universe u v w

/-! ## Part F · FERTILITY · composition is free -/

/-- A predicate that accepts every input: the terminal predicate, in whatever dress. -/
def Vacuous {α : Sort u} (P : α → Prop) : Prop := ∀ x, P x

/-- A predicate that rejects every input: the initial predicate. -/
def Void {α : Sort u} (P : α → Prop) : Prop := ∀ x, ¬ P x

/-- A predicate testifies when it accepts one input and rejects another. -/
def Testifies {α : Sort u} (P : α → Prop) : Prop := (∃ x, P x) ∧ (∃ x, ¬ P x)

/-- The predicate defined as `True`, on any carrier. -/
def anyP (α : Sort u) : α → Prop := fun _ => True

/-- The closure of a predicate under a step, as an inductive with a base constructor. -/
inductive Closure {α : Type u} (step : α → α) (P : α → Prop) : α → Prop
  | base {x : α} : P x → Closure step P x
  | step {x : α} : Closure step P x → Closure step P (step x)

theorem anyP_is_vacuous (α : Sort u) : Vacuous (anyP α) := fun _ => True.intro

/-- A vacuous predicate factors through `True`: pointwise it is the terminal proposition. -/
theorem vacuous_iff_pointwise_true {α : Sort u} (P : α → Prop) : Vacuous P ↔ ∀ x, (P x ↔ True) :=
  ⟨fun h x => ⟨fun _ => True.intro, fun _ => h x⟩, fun h x => (h x).mpr True.intro⟩

/-- The mint: the closure of a vacuous predicate certifies every input, on no evidence. -/
theorem closure_of_vacuous_is_vacuous {α : Type u} (step : α → α) {P : α → Prop} (h : Vacuous P) :
    Vacuous (Closure step P) := fun x => Closure.base (h x)

theorem closure_of_anyP_certifies_everything {α : Type u} (step : α → α) (x : α) :
    Closure step (anyP α) x := Closure.base True.intro

/-- Transport is free: any arrow out of the certificate carries it onward. -/
theorem a_certificate_travels_every_arrow {α : Sort u} {P Q : α → Prop} (h : Vacuous P)
    (arrow : ∀ x, P x → Q x) : Vacuous Q := fun x => arrow x (h x)

/-- Composition is free: two arrows carry it as well as one. -/
theorem arrows_compose_freely {α : Sort u} {P Q R : α → Prop} (h : Vacuous P)
    (f : ∀ x, P x → Q x) (g : ∀ x, Q x → R x) : Vacuous R := fun x => g x (f x (h x))

/-- The law of the middle. A headline stated in trusted words, reached through a vacuous predicate, is
reached. The vacuity cannot unprove it. -/
theorem middle_vacuity_does_not_void_the_headline {α : Sort u} {P : α → Prop} {Goal : Prop}
    (h : Vacuous P) (route : (∀ x, P x) → Goal) : Goal := route h

/-- What the vacuity does show: the slot was never needed. A lemma that consumes a vacuous certificate
holds with the slot deleted, and conversely. -/
theorem a_vacuous_slot_is_deletable {α : Sort u} {P Q : α → Prop} (h : Vacuous P) :
    (∀ x, P x → Q x) ↔ (∀ x, Q x) :=
  ⟨fun f x => f x (h x), fun g x _ => g x⟩

/-- Fertility in one line: the vacuous predicate and an honest one compose alike; the arrow cannot tell. -/
theorem the_arrow_cannot_tell {α : Sort u} {P Q : α → Prop} (arrow : ∀ x, P x → Q x) (x : α) :
    (anyP α x → P x) → Q x := fun k => arrow x (k True.intro)

/-! ## Part O · OBEDIENCE · six drills on a definition -/

/-! ### D6 · negation distinctness: a definition that cannot fail cannot testify -/

theorem a_vacuous_predicate_does_not_testify {α : Sort u} {P : α → Prop} (h : Vacuous P) : ¬ Testifies P :=
  fun t => t.2.elim fun x hx => hx (h x)

theorem a_void_predicate_does_not_testify {α : Sort u} {P : α → Prop} (h : Void P) : ¬ Testifies P :=
  fun t => t.1.elim fun x hx => h x hx

theorem anyP_does_not_testify (α : Sort u) : ¬ Testifies (anyP α) :=
  a_vacuous_predicate_does_not_testify (anyP_is_vacuous α)

/-- The drill is satisfiable: an honest predicate exists and passes it. -/
theorem an_honest_predicate_testifies : Testifies (fun n : Nat => n = 0) :=
  ⟨⟨0, rfl⟩, ⟨1, fun h => Nat.noConfusion h⟩⟩

/-- A void hypothesis proves every conclusion: the screen's `refused-inconsistent`. -/
theorem a_void_hypothesis_proves_anything {α : Sort u} {P : α → Prop} (h : Void P) (Goal : Prop) :
    ∀ x, P x → Goal := fun x hx => (h x hx).elim

/-! ### The first place vacuity voids a claim: the headline's own words -/

/-- A headline stated on a vacuous predicate is proved for free, on every configuration. -/
theorem a_headline_in_vacuous_words_is_free {Config : Sort u} {H : Config → Prop} (h : Vacuous H) :
    ∀ c, H c := h

/-- And it tells no configuration from another. -/
theorem a_headline_in_vacuous_words_separates_nothing {Config : Sort u} {H : Config → Prop} (h : Vacuous H)
    (c d : Config) : H c ↔ H d := ⟨fun _ => h d, fun _ => h c⟩

/-! ### D1 · the deletion test, and the second place: a bundle that carries the goal -/

/-- A hypothesis bundle with one side condition and one field that is the goal itself. -/
structure Bundle (Side Goal : Prop) : Prop where
  side : Side
  bit : Goal

theorem a_bundle_hands_over_its_goal {Side Goal : Prop} (b : Bundle Side Goal) : Goal := b.bit

/-- The price theorem. Once the side condition is free, inhabiting the bundle costs exactly the goal. -/
theorem the_bundle_costs_exactly_the_goal {Side Goal : Prop} (hs : Side) : Bundle Side Goal ↔ Goal :=
  ⟨fun b => b.bit, fun g => ⟨hs, g⟩⟩

/-- Circular (gate A2). A premise that gives the goal and is given by it is the goal in another dress. -/
def Circular (Premise Goal : Prop) : Prop := Premise ↔ Goal

theorem a_bundle_with_a_free_side_is_circular {Side Goal : Prop} (hs : Side) :
    Circular (Bundle Side Goal) Goal := the_bundle_costs_exactly_the_goal hs

/-- Every premise strong enough for the goal pays the goal: nothing weaker than the goal gives it back. -/
theorem a_sufficient_premise_is_at_least_the_goal {Premise Goal : Prop} (gives : Premise → Goal)
    (cheap : Goal → Premise) : Circular Premise Goal := ⟨gives, cheap⟩

/-! ### D2 and D5 · disjointness and the named group: identification by theorem, never by copy -/

/-- An identification of two sides, index by index. -/
def Identified {ι : Sort u} {α : Sort v} (left right : ι → α) : Prop := ∀ i, left i = right i

/-- When the second side is a copy of the first, the identification holds by `rfl`. One side, read twice. -/
theorem identification_by_copy_is_free {ι : Sort u} {α : Sort v} (left : ι → α) : Identified left left :=
  fun _ => rfl

/-- Between independently given sides it is a claim with content: it can fail. -/
theorem identification_of_two_sides_can_fail :
    ∃ left right : Unit → Bool, ¬ Identified left right :=
  ⟨fun _ => true, fun _ => false, fun h => Bool.noConfusion (h ())⟩

/-- So a copy passes a test that an independent side can fail. The test told nothing about the copy. -/
theorem the_copy_passes_what_the_second_side_can_fail :
    (∀ left : Unit → Bool, Identified left left) ∧ (∃ left right : Unit → Bool, ¬ Identified left right) :=
  ⟨fun left => identification_by_copy_is_free left, identification_of_two_sides_can_fail⟩

/-! ### D3 · the provenance flag: quantities derived, never assigned -/

/-- Installation. If the quantity may be assigned, every satisfiable specification is met. -/
theorem an_assigned_quantity_meets_any_satisfiable_spec {α : Sort u} (spec : α → Prop) (w : α) (hw : spec w) :
    ∃ q, spec q ∧ q = w := ⟨w, hw, rfl⟩

/-- The equation "quantity = formula" is `rfl` when the quantity was defined to be the formula. -/
theorem an_assigned_quantity_equals_its_formula_by_rfl {α : Sort u} (formula : α) :
    (fun q : α => q = formula) formula := rfl

/-- A quantity measured on an object is not free: a measure and a specification exist that disagree. -/
theorem a_measured_quantity_can_miss_the_spec :
    ∃ (measure : Unit → Nat) (spec : Nat → Prop), ¬ spec (measure ()) :=
  ⟨fun _ => 0, fun n => n = 1, fun h => Nat.noConfusion h⟩

/-! ### D4 · direction and never volume: a definition adds no proving power -/

/-- A definition is a name for its body. A statement about the name is the statement about the body. -/
theorem a_definition_is_its_body {α : Sort u} (body : α) (Says : α → Prop) :
    (let name := body; Says name) ↔ Says body := Iff.rfl

/-- So whatever is proved with the name is proved without it. The name points; it pays nothing. -/
theorem a_definition_buys_nothing {α : Sort u} (body : α) (Says : α → Prop) (proved : let name := body; Says name) :
    Says body := proved

/-! ### The six drills as a record, defaults absent, and the screen's states -/

/-- Section X of the Tongue law, one field per drill. Every default is the failing value. -/
structure Drills where
  count        : Bool := false   -- D1 deletion test: the slot is load-bearing
  disjoint     : Bool := false   -- D2 the sides are independently given
  ledger       : Bool := false   -- D3 original definition, provenance flag clean
  signOnly     : Bool := false   -- D4 the definition asserts no theorem
  group        : Bool := false   -- D5 identification names its acting group and invariant
  negation     : Bool := false   -- D6 an accepted instance and a rejected one are exhibited
deriving DecidableEq, Repr

def Drills.cleared (d : Drills) : Bool :=
  d.count && d.disjoint && d.ledger && d.signOnly && d.group && d.negation

/-- What the Tongue may say of a definition. There is no third constructor: it cannot say "false". -/
inductive Ruling
  | admitted
  | uncertified
deriving DecidableEq, Repr

def rule (d : Drills) : Ruling := if d.cleared then .admitted else .uncertified

theorem an_unspecified_call_is_uncertified : rule {} = .uncertified := by decide

theorem one_failed_drill_withdraws_the_ruling :
    rule { count := true, disjoint := true, ledger := true, signOnly := true, group := true } = .uncertified := by
  decide

theorem six_cleared_drills_admit :
    rule { count := true, disjoint := true, ledger := true, signOnly := true, group := true, negation := true }
      = .admitted := by decide

/-- A reading supplied to the axiom screen, for a definition or a hypothesis. Defaults refuse. -/
structure Reading where
  wellformed : Bool := false
  refuted    : Bool := false   -- A1 the base refutes it: a void hypothesis
  circular   : Bool := false   -- A2 equivalent to the goal: the bundle that carries the bit
  coupled    : Bool := false   -- A3 something is derived from it
  owned      : Bool := false   -- A4 already a named statement of the literature
  breadth    : Nat  := 0       -- A5 proved consequences outside the goal
deriving DecidableEq, Repr

inductive State
  | refusedIllformed | refusedInconsistent | refusedCircular | refusedInert | conditional | candidate
deriving DecidableEq, Repr

/-- The admission gates of the axiom screen, first failure terminal, in the order of the engine. -/
def screen (r : Reading) : State :=
  if !r.wellformed then .refusedIllformed
  else if r.refuted then .refusedInconsistent
  else if r.circular then .refusedCircular
  else if !r.coupled then .refusedInert
  else if r.owned then .conditional
  else if r.breadth = 0 then .conditional
  else .candidate

theorem the_screen_refuses_by_default : screen {} = .refusedIllformed := by decide

theorem a_vacuous_predicate_is_inert : screen { wellformed := true } = .refusedInert := by decide

theorem a_bundle_that_carries_the_goal_is_circular :
    screen { wellformed := true, circular := true, coupled := true, breadth := 3 } = .refusedCircular := by decide

theorem a_void_hypothesis_is_inconsistent :
    screen { wellformed := true, refuted := true, coupled := true, breadth := 3 } = .refusedInconsistent := by decide

/-- The screen's whole vocabulary. No state among the six is a truth value. -/
theorem the_screen_emits_only_these (s : State) :
    s = .refusedIllformed ∨ s = .refusedInconsistent ∨ s = .refusedCircular ∨ s = .refusedInert ∨
      s = .conditional ∨ s = .candidate := by
  cases s <;> decide

/-- Candidacy is the most the screen grants, and it grants it only on breadth. -/
theorem a_candidate_has_breadth (r : Reading) (h : screen r = .candidate) : r.breadth ≠ 0 := by
  intro hb
  cases r with
  | mk w rf c cp o b =>
    have hb' : b = 0 := hb
    subst hb'
    cases w <;> cases rf <;> cases c <;> cases cp <;> cases o <;> exact absurd h (by decide)

/-! ## Part V · FREEDOM · what the drills earn, and its bound -/

/-- Veto and never substitution, first half. An uncertified ruling is no refutation: the goal can hold. -/
theorem uncertified_is_not_refuted : ∃ (Goal : Prop) (d : Drills), rule d = .uncertified ∧ Goal :=
  ⟨True, {}, by decide, True.intro⟩

/-- Second half. An uncertified ruling is no proof either: the goal can fail. -/
theorem uncertified_is_not_proved : ∃ (Goal : Prop) (d : Drills), rule d = .uncertified ∧ ¬ Goal :=
  ⟨False, {}, by decide, fun h => h⟩

/-- Direction and never volume. An admitted definition proves no goal by being admitted. -/
theorem admitted_is_not_proved :
    ∃ (Goal : Prop) (d : Drills), rule d = .admitted ∧ ¬ Goal :=
  ⟨False, { count := true, disjoint := true, ledger := true, signOnly := true, group := true, negation := true },
   by decide, fun h => h⟩

/-- The Tongue's whole vocabulary on a definition. Neither value is "false". -/
theorem the_ruling_has_two_values (r : Ruling) : r = .admitted ∨ r = .uncertified := by
  cases r <;> decide

/-- Per run and never tenure: the ruling of one reading says nothing of the next. -/
theorem obedience_does_not_bank : ∃ d₁ d₂ : Drills, rule d₁ = .admitted ∧ rule d₂ = .uncertified :=
  ⟨{ count := true, disjoint := true, ledger := true, signOnly := true, group := true, negation := true }, {},
   by decide, by decide⟩

/-- The two jurisdictions, in one statement. The kernel's office: the headline, reached, is reached. The
Tongue's office: the slot it was reached through testifies to nothing. Both hold at once. -/
theorem the_two_jurisdictions {α : Sort u} {P : α → Prop} {Goal : Prop} (h : Vacuous P)
    (route : (∀ x, P x) → Goal) : Goal ∧ ¬ Testifies P :=
  ⟨route h, a_vacuous_predicate_does_not_testify h⟩

/-- The capstone. Fertility: the certificate of a vacuous predicate reaches every arrow's end. Obedience: the
predicate fails the sixth drill and its slot is deletable. Freedom: the ruling on it is uncertified, and that
ruling refutes nothing. -/
theorem the_capstone_of_the_screen {α : Type u} (step : α → α) {P Q : α → Prop} (h : Vacuous P)
    (arrow : ∀ x, Closure step P x → Q x) :
    Vacuous Q ∧ ¬ Testifies P ∧ ((∀ x, P x → Q x) ↔ (∀ x, Q x)) ∧ rule {} = .uncertified :=
  ⟨fun x => arrow x (Closure.base (h x)), a_vacuous_predicate_does_not_testify h, a_vacuous_slot_is_deletable h,
   by decide⟩

end Screen

/-! ## Part S · THE SCAN · a command that reads the path of a headline

USE.   `#screen headline in Scope`   walks every constant under the namespace `Scope` that the headline
       uses, directly or through other constants, and prints its flags. `#screen headline` alone takes
       as scope every declaration of the file being compiled.
DESIGN. Read-only. It inspects declarations already accepted by the kernel; it adds none and changes none.
FLAGS. F1 a definition on the path whose body is the constant `True` under its binders (drill D6).
       F2 a theorem on the path that states an equation and is proved by `rfl` (drills D2, D3, D5).
       F3 theorems of the scope that are not on the path: stored, never opened by this headline (drill D1).
       F4 a binder of the headline whose type is a structure of the scope: the headline speaks of an
          abstract host, or consumes a bundle (drill D1, gate A2). A human reads which.
       F5 `True` proved by `trivial` passed as an argument on the path is NOT detected; stated as a limit.
       F6 axioms the headline depends on, from the kernel's own collection.
NON-NEGOTIABLE. A flag is a place to read. The command issues no ruling and no verdict.
RISK. Syntactic. A vacuous predicate written as `fun _ => 0 = 0`, or behind a second definition, passes F1.
-/

namespace Screen.Scan
open Lean Elab Command Meta

/-- Strip leading binders. -/
partial def body : Expr → Expr
  | .lam _ _ b _ => body b
  | .forallE _ _ b _ => body b
  | .mdata _ e => body e
  | e => e

/-- Constants under `scope` that `root` uses, transitively, through types and values. -/
partial def reach (env : Environment) (inScope : Name → Bool) (root : Name) : NameSet := Id.run do
  let mut seen : NameSet := {}
  let mut todo : Array Name := #[root]
  while !todo.isEmpty do
    let n := todo.back!
    todo := todo.pop
    if seen.contains n then continue
    seen := seen.insert n
    match env.find? n with
    | none => pure ()
    | some ci =>
      let used := ci.type.getUsedConstants ++ (match ci.value? with | some v => v.getUsedConstants | none => #[])
      for m in used do
        if inScope m && !seen.contains m then todo := todo.push m
  return seen

def isRflProof (v : Expr) : Bool :=
  let f := (body v).getAppFn
  f.isConstOf ``rfl || f.isConstOf ``Eq.refl || f.isConstOf ``HEq.rfl || f.isConstOf ``HEq.refl || f.isConstOf ``Iff.rfl

def statesEquation (t : Expr) : Bool :=
  let f := (body t).getAppFn
  f.isConstOf ``Eq || f.isConstOf ``HEq

/-- Binder types of a statement, outermost first. -/
partial def binderTypes : Expr → Array Expr
  | .forallE _ d b _ => #[d] ++ binderTypes b
  | .mdata _ e => binderTypes e
  | _ => #[]

/-- Declarations the compiler writes for a structure or an inductive are not the author's theorems. -/
def internal (n : Name) : Bool :=
  n.isInternal || n.isImplementationDetail ||
    (match n with
     | .str _ s => s == "inj" || s == "injEq" || s == "sizeOf_spec" || s == "noConfusion" || s.startsWith "eq_"
     | _ => false)

syntax (name := screenCmd) "#screen " ident (" in " ident)? : command

@[command_elab screenCmd] def elabScreen : CommandElab := fun stx => do
  let head ← liftCoreM <| realizeGlobalConstNoOverloadWithInfo stx[1]
  let env ← getEnv
  -- scope: a namespace when one is named; otherwise every declaration of the file being compiled
  let named := !stx[2].isNone
  let scopeName : Name := if named then stx[2][1].getId else Name.anonymous
  let inScope : Name → Bool := fun n =>
    if named then scopeName.isPrefixOf n else (env.getModuleIdxFor? n).isNone
  let scopeLabel : String := if named then toString scopeName else "this file"
  let path := reach env inScope head
  let onPath := path.toList.filter (fun n => !internal n)
  -- F1 vacuous definitions on the path
  let f1 := onPath.filter fun n => match env.find? n with
    | some (.defnInfo d) => (body d.value).isConstOf ``True
    | _ => false
  -- F2 equations proved by rfl on the path
  let f2 := onPath.filter fun n => match env.find? n with
    | some (.thmInfo t) => statesEquation t.type && isRflProof t.value
    | _ => false
  -- F3 theorems of the scope that this headline never opens
  let mut scopeThms : Array Name := #[]
  for (n, ci) in env.constants.map₂.toList do
    if inScope n && !internal n then
      if let .thmInfo _ := ci then
        if !(env.isProjectionFn n) then scopeThms := scopeThms.push n
  let f3 := scopeThms.filter (fun n => !path.contains n)
  -- F4 structures of the scope among the headline's binders
  let some hci := env.find? head | throwError "unknown constant {head}"
  let f4 := (binderTypes hci.type).filterMap fun d =>
    match d.getAppFn with
    | .const s _ => if inScope s && isStructure env s then some s else none
    | _ => none
  -- F6 axioms, from the kernel's collection
  let axs ← liftCoreM <| collectAxioms head
  let show_ (l : List Name) : String :=
    if l.isEmpty then "none" else String.intercalate ", " ((l.map toString).toArray.qsort (· < ·)).toList
  logInfo m!"SCREEN of {head} in {scopeLabel}\n  path: {onPath.length} constants of the scope\n  F1 body is True: {show_ f1}\n  F2 equation by rfl: {show_ f2}\n  F3 scope theorems not on the path: {f3.size} of {scopeThms.size}{if f3.size ≤ 6 && f3.size > 0 then " (" ++ show_ f3.toList ++ ")" else ""}\n  F4 scope structures among the binders: {show_ f4.toList.eraseDups}\n  F6 axioms: {show_ axs.toList}\n  A flag is a place to read. This command issues no ruling."

end Screen.Scan

/-! ### The scan on four small exhibits, each pinned to its printed output -/

namespace Exhibit

/-- The pattern: a predicate with content, and beside it the predicate defined as `True`. -/
def realGeometry (n : Nat) : Prop := n % 2 = 0
def anyGeometry (_ : Nat) : Prop := True

/-- A lemma stated for every predicate. It never opens the certificate. -/
theorem generic_lemma (G : Nat → Prop) (n : Nat) (_ : G n) : n + 0 = n := Nat.add_zero n

/-- A lemma that would extract content from the real predicate. Nothing calls it. -/
theorem extraction (n : Nat) (h : realGeometry n) : n % 2 = 0 := h

/-- An identification by copy. -/
def rowSide (n : Nat) : Nat := n * n
def geoSide (n : Nat) : Nat := rowSide n
theorem sides_agree (n : Nat) : geoSide n = rowSide n := rfl

/-- The headline: stated in trusted words, reached through the vacuous predicate. It is proved. -/
theorem headline (n : Nat) : n + 0 = n := generic_lemma anyGeometry n trivial

/-- The same headline with the copy identification on its path. -/
theorem headline_with_copy (n : Nat) : geoSide n + 0 = rowSide n :=
  (sides_agree n) ▸ generic_lemma anyGeometry (geoSide n) trivial

/-- An abstract host, and a headline that speaks of it. -/
structure Host where
  carrier : Type
  Sentence : Prop
  Value : Prop
  bridge : Value → Sentence

theorem on_the_host (H : Host) (v : H.Value) : H.Sentence := H.bridge v

/-- An honest route: the real predicate, opened. -/
theorem honest (n : Nat) (h : realGeometry n) : n % 2 = 0 := extraction n h

end Exhibit

/-! ## Pins · every theorem of this file, each with the cone the compiler printed -/

/-- info: 'Screen.anyP_is_vacuous' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.anyP_is_vacuous

/-- info: 'Screen.vacuous_iff_pointwise_true' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.vacuous_iff_pointwise_true

/-- info: 'Screen.closure_of_vacuous_is_vacuous' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.closure_of_vacuous_is_vacuous

/-- info: 'Screen.closure_of_anyP_certifies_everything' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.closure_of_anyP_certifies_everything

/-- info: 'Screen.a_certificate_travels_every_arrow' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.a_certificate_travels_every_arrow

/-- info: 'Screen.arrows_compose_freely' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.arrows_compose_freely

/-- info: 'Screen.middle_vacuity_does_not_void_the_headline' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.middle_vacuity_does_not_void_the_headline

/-- info: 'Screen.a_vacuous_slot_is_deletable' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.a_vacuous_slot_is_deletable

/-- info: 'Screen.the_arrow_cannot_tell' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.the_arrow_cannot_tell

/-- info: 'Screen.a_vacuous_predicate_does_not_testify' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.a_vacuous_predicate_does_not_testify

/-- info: 'Screen.a_void_predicate_does_not_testify' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.a_void_predicate_does_not_testify

/-- info: 'Screen.anyP_does_not_testify' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.anyP_does_not_testify

/-- info: 'Screen.an_honest_predicate_testifies' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.an_honest_predicate_testifies

/-- info: 'Screen.a_void_hypothesis_proves_anything' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.a_void_hypothesis_proves_anything

/-- info: 'Screen.a_headline_in_vacuous_words_is_free' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.a_headline_in_vacuous_words_is_free

/-- info: 'Screen.a_headline_in_vacuous_words_separates_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.a_headline_in_vacuous_words_separates_nothing

/-- info: 'Screen.a_bundle_hands_over_its_goal' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.a_bundle_hands_over_its_goal

/-- info: 'Screen.the_bundle_costs_exactly_the_goal' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.the_bundle_costs_exactly_the_goal

/-- info: 'Screen.a_bundle_with_a_free_side_is_circular' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.a_bundle_with_a_free_side_is_circular

/-- info: 'Screen.a_sufficient_premise_is_at_least_the_goal' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.a_sufficient_premise_is_at_least_the_goal

/-- info: 'Screen.identification_by_copy_is_free' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.identification_by_copy_is_free

/-- info: 'Screen.identification_of_two_sides_can_fail' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.identification_of_two_sides_can_fail

/-- info: 'Screen.the_copy_passes_what_the_second_side_can_fail' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.the_copy_passes_what_the_second_side_can_fail

/-- info: 'Screen.an_assigned_quantity_meets_any_satisfiable_spec' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.an_assigned_quantity_meets_any_satisfiable_spec

/-- info: 'Screen.an_assigned_quantity_equals_its_formula_by_rfl' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.an_assigned_quantity_equals_its_formula_by_rfl

/-- info: 'Screen.a_measured_quantity_can_miss_the_spec' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.a_measured_quantity_can_miss_the_spec

/-- info: 'Screen.a_definition_is_its_body' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.a_definition_is_its_body

/-- info: 'Screen.a_definition_buys_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.a_definition_buys_nothing

/-- info: 'Screen.an_unspecified_call_is_uncertified' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.an_unspecified_call_is_uncertified

/-- info: 'Screen.one_failed_drill_withdraws_the_ruling' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.one_failed_drill_withdraws_the_ruling

/-- info: 'Screen.six_cleared_drills_admit' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.six_cleared_drills_admit

/-- info: 'Screen.the_screen_refuses_by_default' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.the_screen_refuses_by_default

/-- info: 'Screen.a_vacuous_predicate_is_inert' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.a_vacuous_predicate_is_inert

/-- info: 'Screen.a_bundle_that_carries_the_goal_is_circular' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.a_bundle_that_carries_the_goal_is_circular

/-- info: 'Screen.a_void_hypothesis_is_inconsistent' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.a_void_hypothesis_is_inconsistent

/-- info: 'Screen.the_screen_emits_only_these' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.the_screen_emits_only_these

/-- info: 'Screen.a_candidate_has_breadth' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.a_candidate_has_breadth

/-- info: 'Screen.uncertified_is_not_refuted' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.uncertified_is_not_refuted

/-- info: 'Screen.uncertified_is_not_proved' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.uncertified_is_not_proved

/-- info: 'Screen.admitted_is_not_proved' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.admitted_is_not_proved

/-- info: 'Screen.the_ruling_has_two_values' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.the_ruling_has_two_values

/-- info: 'Screen.obedience_does_not_bank' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.obedience_does_not_bank

/-- info: 'Screen.the_two_jurisdictions' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.the_two_jurisdictions

/-- info: 'Screen.the_capstone_of_the_screen' does not depend on any axioms -/
#guard_msgs in #print axioms Screen.the_capstone_of_the_screen

/-- info: 'Exhibit.generic_lemma' does not depend on any axioms -/
#guard_msgs in #print axioms Exhibit.generic_lemma

/-- info: 'Exhibit.extraction' does not depend on any axioms -/
#guard_msgs in #print axioms Exhibit.extraction

/-- info: 'Exhibit.sides_agree' does not depend on any axioms -/
#guard_msgs in #print axioms Exhibit.sides_agree

/-- info: 'Exhibit.headline' does not depend on any axioms -/
#guard_msgs in #print axioms Exhibit.headline

/-- info: 'Exhibit.headline_with_copy' does not depend on any axioms -/
#guard_msgs in #print axioms Exhibit.headline_with_copy

/-- info: 'Exhibit.on_the_host' does not depend on any axioms -/
#guard_msgs in #print axioms Exhibit.on_the_host

/-- info: 'Exhibit.honest' does not depend on any axioms -/
#guard_msgs in #print axioms Exhibit.honest

/-! ## Pins · the scan on the exhibits, each with the output the compiler printed -/

/--
info: SCREEN of Exhibit.headline in Exhibit
  path: 3 constants of the scope
  F1 body is True: Exhibit.anyGeometry
  F2 equation by rfl: none
  F3 scope theorems not on the path: 5 of 7 (Exhibit.extraction, Exhibit.headline_with_copy, Exhibit.honest, Exhibit.on_the_host, Exhibit.sides_agree)
  F4 scope structures among the binders: none
  F6 axioms: none
  A flag is a place to read. This command issues no ruling.
-/
#guard_msgs in #screen Exhibit.headline in Exhibit

/--
info: SCREEN of Exhibit.headline_with_copy in Exhibit
  path: 6 constants of the scope
  F1 body is True: Exhibit.anyGeometry
  F2 equation by rfl: Exhibit.sides_agree
  F3 scope theorems not on the path: 4 of 7 (Exhibit.extraction, Exhibit.headline, Exhibit.honest, Exhibit.on_the_host)
  F4 scope structures among the binders: none
  F6 axioms: none
  A flag is a place to read. This command issues no ruling.
-/
#guard_msgs in #screen Exhibit.headline_with_copy in Exhibit

/--
info: SCREEN of Exhibit.on_the_host in Exhibit
  path: 5 constants of the scope
  F1 body is True: none
  F2 equation by rfl: none
  F3 scope theorems not on the path: 6 of 7 (Exhibit.extraction, Exhibit.generic_lemma, Exhibit.headline, Exhibit.headline_with_copy, Exhibit.honest, Exhibit.sides_agree)
  F4 scope structures among the binders: Exhibit.Host
  F6 axioms: none
  A flag is a place to read. This command issues no ruling.
-/
#guard_msgs in #screen Exhibit.on_the_host in Exhibit

/--
info: SCREEN of Exhibit.honest in Exhibit
  path: 3 constants of the scope
  F1 body is True: none
  F2 equation by rfl: none
  F3 scope theorems not on the path: 5 of 7 (Exhibit.generic_lemma, Exhibit.headline, Exhibit.headline_with_copy, Exhibit.on_the_host, Exhibit.sides_agree)
  F4 scope structures among the binders: none
  F6 axioms: none
  A flag is a place to read. This command issues no ruling.
-/
#guard_msgs in #screen Exhibit.honest in Exhibit

/--
info: SCREEN of Screen.anyP_does_not_testify in Screen
  path: 6 constants of the scope
  F1 body is True: Screen.anyP
  F2 equation by rfl: none
  F3 scope theorems not on the path: 44 of 47
  F4 scope structures among the binders: none
  F6 axioms: none
  A flag is a place to read. This command issues no ruling.
-/
#guard_msgs in #screen Screen.anyP_does_not_testify in Screen

/--
info: SCREEN of Screen.the_capstone_of_the_screen in Screen
  path: 26 constants of the scope
  F1 body is True: none
  F2 equation by rfl: none
  F3 scope theorems not on the path: 43 of 47
  F4 scope structures among the binders: none
  F6 axioms: none
  A flag is a place to read. This command issues no ruling.
-/
#guard_msgs in #screen Screen.the_capstone_of_the_screen in Screen
