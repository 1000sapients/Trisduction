/-
  PNP_Normal_Form_Paper_v1_3_0_CC.lean · the kernel of the paper
  "P ≠ NP Closed to One Bit: The Unconditional Normal Form of the Separation of SAT on Turing Machines".
  Claude-coded (_CC). Core Lean 4.19.0: no import, no axiom declared, no sorry, no native_decide, no posit,
  no physics and no root in Parts A to E: formal alone to the bit; Part F supplies it.

  Part A (namespace PNP.NORMALFORM) is PNP_Normal_Form_CC.lean of 21 October 2026, carried verbatim
  (sha256 33c8d9dd601b9729a650b4bcd67e68ddd81740325d1c2fdfa0aad27049457933): the machine, the closure, the act,
  the record, the normal form, the cargo loop, self-recursion, the two coherent worlds, the keyless wall, Stage 1,
  the vacant seat, two rows and two bits.
  Part B (namespaces PNP.ZA, PNP.SAT) makes the predicate concrete on no axiom: zero-axiom list and arithmetic
  helpers; formulas in conjunctive normal form, satisfiability by exhaustion proved sound and complete; the SAT
  machine over any algorithm model; the SAT-fixed worlds and the keyless wall on the formulas themselves; the
  premise trichotomy.
  Part C (namespace PNP.TM) makes the model concrete on no axiom: the binary encoding and its decoder; Turing
  machines with finite control, one two-way tape and a total transition function; the running time as the first
  halting step; SAT as a language; the SAT machine of the Turing model; the classes P and NP as definitions and
  the sentence P ≠ NP; the bridge, over every Turing machine, that the separation is exactly SAT ∉ P; the normal
  form on the model; the coincidence form; the unique certificate; the defense; executable checks.
  Part D (namespaces PNP.BLACKBOX, PNP.MISSING) carries the formal-alone frontier of the register: the
  black-box floor by pigeonhole and the white-box contrast.
  Part E (namespace PNP.RESIDUE) prints the one implication that remains as a hypothesis in a theorem, and the
  sentence P ≠ NP as its consequence under SAT ∈ NP, so that the residue is a type and is assumed nowhere.
  Part F (namespace PNP.SUPPLY) supplies the bit by its two kinds, the formal cargo and the physical witness, each
  a type whose inhabitant is the supply, and closes the row; the supply is a hypothesis of every theorem that uses it.
  Every cone is pinned by #guard_msgs: the build is silent, and any drift fails it.
  No seat is earned by this file. ΔM = 0.
-/

/-! # PART A · THE NORMAL FORM, carried verbatim -/
namespace PNP.NORMALFORM

/-! ## 0 · the machine, the closure, the act, verbatim from PNP.HARDENED -/
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
def NothingEscapes (M : Machine) : Prop := ∀ A c k, ∃ x, ¬ Clean M A c k x
def Sep (M : Machine) : Prop := ¬ ∃ A c k, Escapes M A c k

structure LeastEscape (M : Machine) where
  closure : NothingEscapes M

structure Examination (M : Machine) where
  A : M.Alg
  c : Nat
  k : Nat
  x : M.Inst
  stops : ¬ Clean M A c k x

theorem sep_of_closure (M : Machine) (h : NothingEscapes M) : Sep M :=
  fun ⟨A, c, k, he⟩ => match h A c k with
    | ⟨x, hx⟩ => hx (he x)

theorem closure_of_sep (M : Machine) (h : Sep M) : NothingEscapes M :=
  fun A c k => Classical.byContradiction fun hn =>
    h ⟨A, c, k, fun x => Classical.byContradiction fun hx => hn ⟨x, hx⟩⟩

/-! ## I · the record: the registration of every pair onto its stop -/

theorem bnot_ne (b : Bool) : (!b) ≠ b := by cases b <;> decide

/-- THE RECORD OF A MACHINE. The registration keeps the algorithms, the instances, the sizes and the times and
    forgets the side of every pair: on the record every output is read against satisfiability as its opposite, so
    no check is clean. The record is the machine read onto its stops, as the record of a zero set is the zero set
    read onto the line. -/
def Rec (M : Machine) : Machine :=
  { M with out := fun _ x => !(M.sat x) }

/-- THE RECORD HAS LEAST ESCAPE, UNCONDITIONALLY: on the record no check is clean, so every pair stops at every
    instance (the mirror of `record_has_least_erasure`). One instance is needed to stop at. -/
theorem record_has_least_escape (M : Machine) (x₀ : M.Inst) : NothingEscapes (Rec M) :=
  fun _ _ _ => ⟨x₀, fun hc => bnot_ne (M.sat x₀) hc.1⟩

/-- The record is separated, with no premise but an instance (the mirror of `cargo_at_zeros`). -/
theorem record_is_separated (M : Machine) (x₀ : M.Inst) : Sep (Rec M) :=
  sep_of_closure (Rec M) (record_has_least_escape M x₀)

/-! ## II · the normal form: the separation is one implication -/

/-- THE NORMAL FORM OF P VERSUS NP (the mirror of `zeta_ra_loop`, first leg): the separation is exactly the
    transfer of least escape from the record of the machine to the machine. The antecedent is a theorem, so the
    implication carries the whole content of the separation: it is the 1-bit, and nothing else remains. -/
theorem sep_normal_form (M : Machine) (x₀ : M.Inst) :
    (NothingEscapes (Rec M) → NothingEscapes M) ↔ Sep M :=
  ⟨fun h => sep_of_closure M (h (record_has_least_escape M x₀)),
   fun hs _ => closure_of_sep M hs⟩

/-- THE CARGO LOOP: the record's least escape, unconditional, carried by the one bit, is the separation
    (the mirror of `rh_from_the_cargo_loop`; the bit is the printed premise). -/
theorem sep_from_the_cargo_loop (M : Machine) (x₀ : M.Inst)
    (bit : NothingEscapes (Rec M) → NothingEscapes M) : Sep M :=
  sep_of_closure M (bit (record_has_least_escape M x₀))

/-- The bit is the act: the transfer holds exactly when the act stands. -/
theorem bit_is_the_act (M : Machine) (x₀ : M.Inst) :
    (NothingEscapes (Rec M) → NothingEscapes M) ↔ Nonempty (LeastEscape M) :=
  ⟨fun h => ⟨⟨h (record_has_least_escape M x₀)⟩⟩, fun ⟨L⟩ _ => L.closure⟩

/-! ## III · self-recursion: a machine that coincides with its own record -/

/-- The profile of a machine: which pairs escape. The record's profile is empty. -/
def SelfRecursive (M : Machine) : Prop := ∀ A c k, Escapes M A c k ↔ False

/-- THE RECORD IS SELF-RECURSIVE, with no premise but an instance (the mirror of `record_is_self_recursive`). -/
theorem record_is_self_recursive (M : Machine) (x₀ : M.Inst) : SelfRecursive (Rec M) :=
  fun _ _ _ => ⟨fun he => bnot_ne (M.sat x₀) (he x₀).1, fun h => h.elim⟩

/-- THE MACHINE IS SELF-RECURSIVE EXACTLY WHEN IT IS SEPARATED (the mirror of `self_recursion_at_zeros`). -/
theorem self_recursion_at_machine (M : Machine) : SelfRecursive M ↔ Sep M :=
  ⟨fun h ⟨A, c, k, he⟩ => (h A c k).mp he, fun hs A c k => ⟨fun he => hs ⟨A, c, k, he⟩, fun h => h.elim⟩⟩

/-- A statement self-verifies exactly when it is true (the mirror of `self_verifying_iff_true`). -/
theorem self_verifying_iff_true (P : Prop) : (¬ P → P) ↔ P :=
  ⟨fun h => Classical.byCases id h, fun hp _ => hp⟩

/-! ## IV · the two coherent machines: the bit is keyed, the record's self-recursion does not transfer -/

theorem beq_self : ∀ n : Nat, Nat.beq n n = true
  | 0 => rfl
  | n + 1 => beq_self n

def stageWorld (n : Nat) : Machine :=
  ⟨Nat, Unit, fun _ => 0, fun A _ => Nat.beq A n, fun _ _ => 0, fun _ => true⟩
def closedWorld : Machine :=
  ⟨Nat, Unit, fun _ => 0, fun _ _ => false, fun _ _ => 0, fun _ => true⟩

theorem stage_escapes (n : Nat) : Escapes (stageWorld n) n 0 0 :=
  fun _ => ⟨beq_self n, Nat.zero_le _⟩
theorem closed_world_closes : NothingEscapes closedWorld :=
  fun _ _ _ => ⟨(), fun ⟨h, _⟩ => Bool.noConfusion h⟩
theorem stage_fails_closure (n : Nat) : ¬ NothingEscapes (stageWorld n) :=
  fun h => sep_of_closure _ h ⟨n, 0, 0, stage_escapes n⟩

/-- THE BIT IS KEYED: the transfer holds on the closed world and fails on the stage world. -/
theorem bit_is_keyed :
    (NothingEscapes (Rec closedWorld) → NothingEscapes closedWorld) ∧
    ¬ (NothingEscapes (Rec (stageWorld 0)) → NothingEscapes (stageWorld 0)) :=
  ⟨fun _ => closed_world_closes,
   fun h => stage_fails_closure 0 (h (record_has_least_escape (stageWorld 0) ()))⟩

/-- THE RECORD'S SELF-RECURSION DOES NOT TRANSFER (the mirror of `record_self_recursion_does_not_transfer`):
    the record of the stage world is self-recursive and the stage world is not. -/
theorem record_self_recursion_does_not_transfer :
    SelfRecursive (Rec (stageWorld 0)) ∧ ¬ SelfRecursive (stageWorld 0) :=
  ⟨record_is_self_recursive (stageWorld 0) (),
   fun h => (h (0 : Nat) 0 0).mp (stage_escapes 0)⟩

/-- CLOSURE OF THE RECORD GIVES NO SELF-RECURSION OF THE MACHINE: no reading of the record decides the machine
    (the mirror of `closure_does_not_give_self_recursion`, `record_decides_nothing`). -/
theorem record_decides_nothing :
    NothingEscapes (Rec closedWorld) ∧ NothingEscapes (Rec (stageWorld 0)) ∧
    NothingEscapes closedWorld ∧ ¬ NothingEscapes (stageWorld 0) :=
  ⟨record_has_least_escape closedWorld (), record_has_least_escape (stageWorld 0) (),
   closed_world_closes, stage_fails_closure 0⟩

/-! ## V · every route passes the bit; keyless premises force nothing -/

/-- EVERY ROUTE PASSES THE BIT (the mirror of `every_route_passes_the_bit`): any premise that yields the
    separation yields the transfer, so every proof of P ≠ NP, from any premise, delivers the one implication. -/
theorem every_route_passes_the_bit (M : Machine) (x₀ : M.Inst) (Q : Prop) (h : Q → Sep M) :
    Q → (NothingEscapes (Rec M) → NothingEscapes M) :=
  fun q => (sep_normal_form M x₀).mpr (h q)

def Keyless (P : Machine → Prop) : Prop := ∀ M, P M
def Forces (P : Machine → Prop) : Prop := ∀ M, P M → NothingEscapes M

/-- A KEYLESS PREMISE FORCES NOTHING (the mirror of `the_unconditional_route_is_blocked`): what every machine
    shares yields the transfer on none. -/
theorem keyless_forces_nothing (P : Machine → Prop) (hP : Keyless P) : ¬ Forces P :=
  fun h => stage_fails_closure 0 (h (stageWorld 0) (hP _))

/-- NO CLOSED PRINCIPLE DECIDES: a principle true of the record of every machine decides the machine on none
    (the mirror of `no_closed_principle_decides`). -/
theorem no_record_principle_decides (P : Machine → Prop) (hP : ∀ M, P (Rec M)) :
    ¬ ∀ M, P (Rec M) → NothingEscapes M :=
  fun h => stage_fails_closure 0 (h (stageWorld 0) (hP _))

/-! ## VI · the cargo: every examination enacts Stage 1, unconditionally -/

/-- STAGE 1 OF THE ROW: a pair examined and stopped. -/
structure Stage1 (M : Machine) where
  e : Examination M
  stopped : ¬ Clean M e.A e.c e.k e.x
  witnessed : ∃ x, ¬ Clean M e.A e.c e.k x

/-- THE EXAMINATION ENACTS STAGE 1: every stopping run supplies one (the mirror of
    `computation_enacts_stage1`); no universal appears in it. -/
def examination_enacts_stage1 (M : Machine) (e : Examination M) : Stage1 M :=
  ⟨e, e.stops, ⟨e.x, e.stops⟩⟩

/-- Stage 1 is local: it decides its pair and no other (the universal is the act). -/
theorem stage1_is_local (M : Machine) (s : Stage1 M) :
    (∃ x, ¬ Clean M s.e.A s.e.c s.e.k x) ∧ ¬ Escapes M s.e.A s.e.c s.e.k :=
  ⟨s.witnessed, fun he => s.stopped (he s.e.x)⟩

/-! ## VII · RA read on computation, the one posit, and the seatless lock -/

/-- RA READ ON COMPUTATION: every decider of satisfiability actuates beyond every polynomial bound. -/
def RAcomp (M : Machine) : Prop := ∀ A c k, ¬ Escapes M A c k

theorem ra_comp_is_sep (M : Machine) : RAcomp M ↔ Sep M :=
  ⟨fun h ⟨A, c, k, he⟩ => h A c k he, fun h A c k he => h ⟨A, c, k, he⟩⟩

/-- THE ONE POSIT IS THE BIT: RA read on computation is exactly the transfer. -/
theorem the_posit_is_the_bit (M : Machine) (x₀ : M.Inst) :
    RAcomp M ↔ (NothingEscapes (Rec M) → NothingEscapes M) :=
  ⟨fun h => (sep_normal_form M x₀).mpr ((ra_comp_is_sep M).mp h),
   fun h => (ra_comp_is_sep M).mpr ((sep_normal_form M x₀).mp h)⟩

/-- The seat of the row is vacant: complementation of worlds has no fixed point (PNP.VANISH, restated). -/
def comp (b : Bool) : Bool := !b
theorem locus_vanishes : ¬ ∃ b, comp b = b := fun ⟨b, h⟩ => bnot_ne b h

/-- SEATLESS: there is no fixed world to cross at, and the lock closes at the act on exactly the world the act
    names (the mirror of nothing in the Riemann master, where the seat is inhabited: the one difference). -/
theorem seatless_lock (M : Machine) :
    (¬ ∃ b, comp b = b) ∧ (Nonempty (LeastEscape M) ↔ Sep M) :=
  ⟨locus_vanishes, ⟨fun ⟨L⟩ => sep_of_closure M L.closure, fun hs => ⟨⟨closure_of_sep M hs⟩⟩⟩⟩

/-! ## VIII · the capstone, nothing before the colon but the machine and an instance -/

/-- THE P VERSUS NP NORMAL FORM, COMPLETE. The record has least escape; the separation is the transfer; the
    transfer is the act; the machine is self-recursive exactly when separated; every route passes the bit; the one
    posit is the bit; the seat is vacant. Separation is not a conjunct: it occurs only inside biconditionals and
    inside the premise of a route. -/
theorem pnp_normal_form_complete (M : Machine) (x₀ : M.Inst) :
    NothingEscapes (Rec M) ∧
    ((NothingEscapes (Rec M) → NothingEscapes M) ↔ Sep M) ∧
    ((NothingEscapes (Rec M) → NothingEscapes M) ↔ Nonempty (LeastEscape M)) ∧
    (SelfRecursive M ↔ Sep M) ∧
    (∀ Q : Prop, (Q → Sep M) → Q → (NothingEscapes (Rec M) → NothingEscapes M)) ∧
    (RAcomp M ↔ (NothingEscapes (Rec M) → NothingEscapes M)) ∧
    (¬ ∃ b, comp b = b) :=
  ⟨record_has_least_escape M x₀, sep_normal_form M x₀, bit_is_the_act M x₀, self_recursion_at_machine M,
   fun Q h => every_route_passes_the_bit M x₀ Q h, the_posit_is_the_bit M x₀, locus_vanishes⟩

/-- THE TWO ROWS, ONE SHAPE, TWO BITS. The Riemann bit and the separation bit are each a transfer from a record
    that has the property to the object; neither follows from the other's record, since the stage world's record
    has least escape while the stage world escapes. The bits are two. -/
theorem two_rows_two_bits :
    NothingEscapes (Rec (stageWorld 0)) ∧ ¬ NothingEscapes (stageWorld 0) :=
  ⟨record_has_least_escape (stageWorld 0) (), stage_fails_closure 0⟩

end PNP.NORMALFORM

/-! # PART B · THE SAT INSTANCE, on no axiom -/

/-! ## IX · zero-axiom helpers: lists, arithmetic, halving -/
namespace PNP.ZA

theorem append_assoc {α : Type} : ∀ (l₁ l₂ l₃ : List α), (l₁ ++ l₂) ++ l₃ = l₁ ++ (l₂ ++ l₃)
  | [], _, _ => rfl
  | a :: l₁, l₂, l₃ => congrArg (List.cons a) (append_assoc l₁ l₂ l₃)

theorem length_append {α : Type} : ∀ (l₁ l₂ : List α), (l₁ ++ l₂).length = l₁.length + l₂.length
  | [], _ => (Nat.zero_add _).symm
  | _ :: l₁, l₂ => (congrArg Nat.succ (length_append l₁ l₂)).trans (Nat.succ_add _ _).symm

theorem any_append {α : Type} (p : α → Bool) : ∀ (l₁ l₂ : List α),
    (l₁ ++ l₂).any p = (l₁.any p || l₂.any p)
  | [], _ => rfl
  | a :: l₁, l₂ => by
    show (p a || (l₁ ++ l₂).any p) = ((p a || l₁.any p) || l₂.any p)
    rw [any_append p l₁ l₂]
    cases p a <;> rfl

theorem any_flatMap {α β : Type} (p : β → Bool) (g : α → List β) : ∀ l : List α,
    (l.flatMap g).any p = l.any (fun x => (g x).any p)
  | [] => rfl
  | a :: l => by
    show (g a ++ l.flatMap g).any p = ((g a).any p || l.any (fun x => (g x).any p))
    rw [any_append, any_flatMap p g l]

theorem any_true_of {α : Type} (p : α → Bool) : ∀ l : List α, l.any p = true → ∃ x, p x = true
  | [], h => Bool.noConfusion h
  | a :: l, h => by
    cases hpa : p a with
    | true => exact ⟨a, hpa⟩
    | false =>
      have h' : l.any p = true := by
        have : (p a || l.any p) = true := h
        rw [hpa] at this
        exact this
      exact any_true_of p l h'

theorem or_true_left {a b : Bool} (h : a = true) : (a || b) = true := by
  rw [h]; rfl

theorem or_true_right {a b : Bool} (h : b = true) : (a || b) = true := by
  rw [h]; cases a <;> rfl

/-- `All P l`: P holds of every element, by recursion on the list. -/
def All {α : Type} (P : α → Prop) : List α → Prop
  | [] => True
  | x :: l => P x ∧ All P l

theorem All_append {α : Type} (P : α → Prop) : ∀ (l₁ l₂ : List α),
    All P (l₁ ++ l₂) → All P l₁ ∧ All P l₂
  | [], _, h => ⟨trivial, h⟩
  | _ :: l₁, l₂, ⟨hx, h⟩ =>
    match All_append P l₁ l₂ h with
    | ⟨h₁, h₂⟩ => ⟨⟨hx, h₁⟩, h₂⟩

theorem mul_assoc' (n m : Nat) : ∀ k : Nat, n * m * k = n * (m * k)
  | 0 => rfl
  | k+1 => by
    show n * m * k + n * m = n * (m * k + m)
    rw [Nat.left_distrib, mul_assoc' n m k]

theorem add_mul' (a b k : Nat) : (a + b) * k = a * k + b * k := by
  rw [Nat.mul_comm, Nat.left_distrib, Nat.mul_comm k a, Nat.mul_comm k b]

theorem succ_ne_zero' (n : Nat) : n + 1 ≠ 0 := fun h => Nat.noConfusion h

/-- Halving and parity, by two-step recursion; no division operator is used anywhere in the file. -/
def div2 : Nat → Nat
  | 0 => 0
  | 1 => 0
  | n+2 => div2 n + 1

def mod2 : Nat → Bool
  | 0 => false
  | 1 => true
  | n+2 => mod2 n

/-- The digit and the half recompose the number. -/
theorem digit_spec : ∀ n : Nat, (if mod2 n then 1 else 0) + 2 * div2 n = n
  | 0 => rfl
  | 1 => rfl
  | n+2 => by
    show (if mod2 n then 1 else 0) + 2 * (div2 n + 1) = n + 2
    rw [Nat.mul_succ, ← Nat.add_assoc, digit_spec n]

theorem div2_le : ∀ n : Nat, div2 n ≤ n
  | 0 => Nat.le_refl 0
  | 1 => Nat.zero_le 1
  | n+2 => Nat.succ_le_succ (Nat.le_succ_of_le (div2_le n))

theorem div2_lt : ∀ n : Nat, 0 < n → div2 n < n
  | 0, h => absurd h (Nat.lt_irrefl 0)
  | 1, _ => Nat.zero_lt_succ 0
  | n+2, _ => Nat.succ_le_succ (Nat.succ_le_succ (div2_le n))

end PNP.ZA

/-! ## X · formulas, assignments, satisfiability by exhaustion -/
namespace PNP.SAT
open PNP.NORMALFORM PNP.ZA

abbrev Lit := Nat × Bool
abbrev Clause := List Lit
abbrev CNF := List Clause
abbrev Assignment := Nat → Bool
/-- A literal (n, b) is true under a when a n = b: b = true the positive literal, b = false the negative. -/
def evalLit (a : Assignment) (l : Lit) : Bool := a l.1 == l.2
def evalClause (a : Assignment) (c : Clause) : Bool := c.any (evalLit a)
def evalCNF (a : Assignment) (f : CNF) : Bool := f.all (evalClause a)
def varsClause (c : Clause) : List Nat := c.map (·.1)
def vars : CNF → List Nat
  | [] => []
  | c :: f => varsClause c ++ vars f
def extend (v : Nat) (b : Bool) (a : Assignment) : Assignment := fun n => if n = v then b else a n
/-- Every assignment to a finite list of variables, the variables outside the list fixed false. -/
def assignments : List Nat → List Assignment
  | [] => [fun _ => false]
  | v :: vs => (assignments vs).flatMap (fun a => [extend v true a, extend v false a])
def restrict : List Nat → Assignment → Assignment
  | [], _ => fun _ => false
  | v :: vs, a => extend v (a v) (restrict vs a)
/-- THE DECISION PROCEDURE: satisfiability by exhaustion over the variables that occur. -/
def satB (f : CNF) : Bool := (assignments (vars f)).any (fun a => evalCNF a f)
/-- SATISFIABILITY, the mathematical predicate. -/
def Satisfiable (f : CNF) : Prop := ∃ a : Assignment, evalCNF a f = true
/-- The size of a formula: its clauses and its literals counted together. -/
def size : CNF → Nat
  | [] => 0
  | c :: f => c.length + 1 + size f

theorem extend_agrees (a : Assignment) (v : Nat) (r : Assignment) :
    ∀ vs' : List Nat, All (fun n => r n = a n) vs' → All (fun n => extend v (a v) r n = a n) vs'
  | [], _ => trivial
  | n :: vs', ⟨hn, h⟩ =>
    ⟨(if hv : n = v then by
        show (if n = v then a v else r n) = a n
        rw [if_pos hv, hv]
      else by
        show (if n = v then a v else r n) = a n
        rw [if_neg hv]; exact hn),
     extend_agrees a v r vs' h⟩

/-- The restriction agrees with the assignment on every listed variable. -/
theorem restrict_agrees (a : Assignment) : ∀ vs : List Nat, All (fun n => restrict vs a n = a n) vs
  | [] => trivial
  | v :: vs =>
    ⟨show (if v = v then a v else restrict vs a v) = a v from if_pos rfl,
     extend_agrees a v (restrict vs a) vs (restrict_agrees a vs)⟩

theorem evalClause_congr (a b : Assignment) :
    ∀ c : Clause, All (fun n => a n = b n) (varsClause c) → evalClause a c = evalClause b c
  | [], _ => rfl
  | l :: c, ⟨hl, h⟩ => by
    show (evalLit a l || evalClause a c) = (evalLit b l || evalClause b c)
    rw [evalClause_congr a b c h]
    show ((a l.1 == l.2) || evalClause b c) = ((b l.1 == l.2) || evalClause b c)
    rw [hl]

theorem evalCNF_congr (a b : Assignment) :
    ∀ f : CNF, All (fun n => a n = b n) (vars f) → evalCNF a f = evalCNF b f
  | [], _ => rfl
  | c :: f, h =>
    match All_append _ (varsClause c) (vars f) h with
    | ⟨hc, hf⟩ => by
      show (evalClause a c && evalCNF a f) = (evalClause b c && evalCNF b f)
      rw [evalClause_congr a b c hc, evalCNF_congr a b f hf]

/-- SOUNDNESS: the procedure says satisfiable only when a satisfying assignment exists. -/
theorem satB_sound (f : CNF) (h : satB f = true) : Satisfiable f :=
  any_true_of (fun a => evalCNF a f) (assignments (vars f)) h

/-- The exhaustion finds any assignment through its restriction. -/
theorem any_assignments (q : Assignment → Bool) (a : Assignment) :
    ∀ vs : List Nat, q (restrict vs a) = true → (assignments vs).any q = true
  | [], h => or_true_left h
  | v :: vs, h => by
    show ((assignments vs).flatMap (fun b => [extend v true b, extend v false b])).any q = true
    rw [any_flatMap]
    apply any_assignments (fun b => [extend v true b, extend v false b].any q) a vs
    show (q (extend v true (restrict vs a)) || (q (extend v false (restrict vs a)) || false)) = true
    have h' : q (extend v (a v) (restrict vs a)) = true := h
    cases hav : a v with
    | true =>
      rw [hav] at h'
      exact or_true_left h'
    | false =>
      rw [hav] at h'
      exact or_true_right (or_true_left h')

/-- COMPLETENESS: every satisfying assignment is found, through its restriction to the variables that occur. -/
theorem satB_complete (f : CNF) (h : Satisfiable f) : satB f = true :=
  match h with
  | ⟨a, ha⟩ =>
    any_assignments (fun b => evalCNF b f) a (vars f)
      ((evalCNF_congr (restrict (vars f) a) a f (restrict_agrees a (vars f))).trans ha)

/-- THE PROCEDURE IS SATISFIABILITY. -/
theorem satB_iff (f : CNF) : satB f = true ↔ Satisfiable f := ⟨satB_sound f, satB_complete f⟩

/-! ## XI · the SAT machine over any algorithm model -/

/-- THE SAT MACHINE. An algorithm model is a type of algorithms with an output and a step count on every
    formula; nothing about it is assumed. The instances are the formulas, the size the clause-and-literal count,
    satisfiability the decided predicate. -/
def SAT (Alg : Type) (out : Alg → CNF → Bool) (time : Alg → CNF → Nat) : Machine :=
  ⟨Alg, CNF, size, out, time, satB⟩

/-- The empty formula is an instance, and it is satisfiable. -/
theorem empty_satisfiable : satB [] = true := rfl

/-- SEPARATION OF SAT: no algorithm of the model decides satisfiability within any polynomial bound. -/
abbrev SepSAT (Alg : Type) (out : Alg → CNF → Bool) (time : Alg → CNF → Nat) : Prop := Sep (SAT Alg out time)

/-- THE RECORD OF SAT HAS LEAST ESCAPE, unconditionally, in every algorithm model. -/
theorem sat_record_has_least_escape (Alg : Type) (out : Alg → CNF → Bool) (time : Alg → CNF → Nat) :
    NothingEscapes (Rec (SAT Alg out time)) :=
  record_has_least_escape (SAT Alg out time) []

/-- THE NORMAL FORM OF SAT: the separation is exactly the transfer of least escape from the record of SAT to SAT,
    and the antecedent is a theorem, so the separation is one implication. -/
theorem sat_normal_form (Alg : Type) (out : Alg → CNF → Bool) (time : Alg → CNF → Nat) :
    (NothingEscapes (Rec (SAT Alg out time)) → NothingEscapes (SAT Alg out time)) ↔ SepSAT Alg out time :=
  sep_normal_form (SAT Alg out time) []

/-- The transfer is the act on SAT. -/
theorem sat_bit_is_the_act (Alg : Type) (out : Alg → CNF → Bool) (time : Alg → CNF → Nat) :
    (NothingEscapes (Rec (SAT Alg out time)) → NothingEscapes (SAT Alg out time)) ↔
      Nonempty (LeastEscape (SAT Alg out time)) :=
  bit_is_the_act (SAT Alg out time) []

/-- SAT is self-recursive exactly when separated; its record is self-recursive with no premise. -/
theorem sat_self_recursion (Alg : Type) (out : Alg → CNF → Bool) (time : Alg → CNF → Nat) :
    (SelfRecursive (SAT Alg out time) ↔ SepSAT Alg out time) ∧ SelfRecursive (Rec (SAT Alg out time)) :=
  ⟨self_recursion_at_machine (SAT Alg out time), record_is_self_recursive (SAT Alg out time) []⟩

/-- EVERY ROUTE TO THE SEPARATION OF SAT PASSES THE BIT. -/
theorem sat_every_route_passes_the_bit (Alg : Type) (out : Alg → CNF → Bool) (time : Alg → CNF → Nat)
    (Q : Prop) (h : Q → SepSAT Alg out time) :
    Q → (NothingEscapes (Rec (SAT Alg out time)) → NothingEscapes (SAT Alg out time)) :=
  every_route_passes_the_bit (SAT Alg out time) [] Q h

/-- RA READ ON COMPUTATION IS THE BIT, on SAT. -/
theorem sat_posit_is_the_bit (Alg : Type) (out : Alg → CNF → Bool) (time : Alg → CNF → Nat) :
    RAcomp (SAT Alg out time) ↔ (NothingEscapes (Rec (SAT Alg out time)) → NothingEscapes (SAT Alg out time)) :=
  the_posit_is_the_bit (SAT Alg out time) []

/-- THE SAT NORMAL FORM, COMPLETE: the capstone of Part A on the SAT machine, in every algorithm model. -/
theorem sat_normal_form_complete (Alg : Type) (out : Alg → CNF → Bool) (time : Alg → CNF → Nat) :
    NothingEscapes (Rec (SAT Alg out time)) ∧
    ((NothingEscapes (Rec (SAT Alg out time)) → NothingEscapes (SAT Alg out time)) ↔ SepSAT Alg out time) ∧
    ((NothingEscapes (Rec (SAT Alg out time)) → NothingEscapes (SAT Alg out time)) ↔
      Nonempty (LeastEscape (SAT Alg out time))) ∧
    (SelfRecursive (SAT Alg out time) ↔ SepSAT Alg out time) ∧
    (∀ Q : Prop, (Q → SepSAT Alg out time) →
      Q → (NothingEscapes (Rec (SAT Alg out time)) → NothingEscapes (SAT Alg out time))) ∧
    (RAcomp (SAT Alg out time) ↔ (NothingEscapes (Rec (SAT Alg out time)) → NothingEscapes (SAT Alg out time))) ∧
    (¬ ∃ b, comp b = b) :=
  pnp_normal_form_complete (SAT Alg out time) []

/-! ## XII · the SAT-fixed worlds: the wall on the formulas themselves -/

/-- A closed world of SAT: every algorithm answers false in no time; nothing escapes, since the empty formula
    is satisfiable. Instances CNF, size, predicate satB, all fixed. -/
def satClosedWorld : Machine := SAT Nat (fun _ _ => false) (fun _ _ => 0)
/-- A stage world of SAT: algorithm n answers satisfiability itself in no time and escapes; the others answer
    false. The same instances, size and predicate. -/
def satStageWorld (n : Nat) : Machine :=
  SAT Nat (fun A f => if Nat.beq A n then satB f else false) (fun _ _ => 0)

theorem sat_closed_world_closes : NothingEscapes satClosedWorld :=
  fun _ _ _ => ⟨[], fun ⟨h, _⟩ => Bool.noConfusion h⟩

theorem sat_stage_escapes (n : Nat) : Escapes (satStageWorld n) n 0 0 :=
  fun f => ⟨show (if Nat.beq n n then satB f else false) = satB f by rw [beq_self n]; rfl, Nat.zero_le _⟩

theorem sat_stage_fails_closure (n : Nat) : ¬ NothingEscapes (satStageWorld n) :=
  fun h => sep_of_closure _ h ⟨n, 0, 0, sat_stage_escapes n⟩

/-- THE BIT IS KEYED ON SAT ITSELF: the transfer holds on the closed SAT world and fails on the stage SAT world,
    both deciding the same formulas with the same predicate. -/
theorem sat_bit_is_keyed :
    (NothingEscapes (Rec satClosedWorld) → NothingEscapes satClosedWorld) ∧
    ¬ (NothingEscapes (Rec (satStageWorld 0)) → NothingEscapes (satStageWorld 0)) :=
  ⟨fun _ => sat_closed_world_closes,
   fun h => sat_stage_fails_closure 0 (h (record_has_least_escape (satStageWorld 0) []))⟩

/-- A property of algorithm models of SAT: it ranges over the machines `SAT Alg out time` and nothing else. -/
def SATKeyless (P : Machine → Prop) : Prop :=
  ∀ (Alg : Type) (out : Alg → CNF → Bool) (time : Alg → CNF → Nat), P (SAT Alg out time)
def SATForces (P : Machine → Prop) : Prop :=
  ∀ (Alg : Type) (out : Alg → CNF → Bool) (time : Alg → CNF → Nat),
    P (SAT Alg out time) → NothingEscapes (SAT Alg out time)

/-- THE KEYLESS WALL ON SAT: no property shared by every algorithm model of SAT forces the closure of any. -/
theorem sat_keyless_forces_nothing (P : Machine → Prop) (hP : SATKeyless P) : ¬ SATForces P :=
  fun h => sat_stage_fails_closure 0 (h Nat _ _ (hP Nat _ _))

/-- NO RECORD PRINCIPLE DECIDES SAT: a principle true of the record of every algorithm model of SAT decides
    none of them. -/
theorem sat_no_record_principle_decides (P : Machine → Prop)
    (hP : ∀ (Alg : Type) (out : Alg → CNF → Bool) (time : Alg → CNF → Nat), P (Rec (SAT Alg out time))) :
    ¬ ∀ (Alg : Type) (out : Alg → CNF → Bool) (time : Alg → CNF → Nat),
        P (Rec (SAT Alg out time)) → NothingEscapes (SAT Alg out time) :=
  fun h => sat_stage_fails_closure 0 (h Nat _ _ (hP Nat _ _))

/-- THE RECORD DECIDES NOTHING ON SAT: both SAT worlds' records close; one world closes and the other escapes. -/
theorem sat_record_decides_nothing :
    NothingEscapes (Rec satClosedWorld) ∧ NothingEscapes (Rec (satStageWorld 0)) ∧
    NothingEscapes satClosedWorld ∧ ¬ NothingEscapes (satStageWorld 0) :=
  ⟨record_has_least_escape satClosedWorld [], record_has_least_escape (satStageWorld 0) [],
   sat_closed_world_closes, sat_stage_fails_closure 0⟩

/-- THE PREMISE TRICHOTOMY ON SAT (classical): a premise on algorithm models of SAT either has a world where it
    holds and an algorithm escapes, or it forces the closure on every model it holds of; and if it forces, either
    the separation returns it on every model, so it is the separation, or on some separated model it fails, so it
    is strictly stronger than the separation. -/
theorem sat_premise_trichotomy (P : Machine → Prop) :
    (∃ (Alg : Type) (out : Alg → CNF → Bool) (time : Alg → CNF → Nat),
        P (SAT Alg out time) ∧ ¬ NothingEscapes (SAT Alg out time)) ∨
    (SATForces P ∧
      ((∀ (Alg : Type) (out : Alg → CNF → Bool) (time : Alg → CNF → Nat),
          SepSAT Alg out time → P (SAT Alg out time)) ∨
       (∃ (Alg : Type) (out : Alg → CNF → Bool) (time : Alg → CNF → Nat),
          SepSAT Alg out time ∧ ¬ P (SAT Alg out time)))) :=
  Classical.byCases
    (fun hF : SATForces P =>
      Or.inr ⟨hF, Classical.byCases
        (fun hR : ∀ (Alg : Type) (out : Alg → CNF → Bool) (time : Alg → CNF → Nat),
            SepSAT Alg out time → P (SAT Alg out time) => Or.inl hR)
        (fun hR => Or.inr (Classical.byContradiction fun hne =>
          hR (fun Alg out time hs => Classical.byContradiction fun hp => hne ⟨Alg, out, time, hs, hp⟩)))⟩)
    (fun hF => Or.inl (Classical.byContradiction fun hne =>
      hF (fun Alg out time hp => Classical.byContradiction fun hc => hne ⟨Alg, out, time, hp, hc⟩)))

end PNP.SAT

/-! # PART C · THE TURING MODEL: real machines deciding real SAT, on no axiom -/
namespace PNP.TM
open PNP.NORMALFORM PNP.SAT PNP.ZA

/-! ## XIII · the input alphabet and the binary encoding of formulas, with its decoder -/

/-- The input alphabet: two binary digits and a separator. -/
inductive Sym | zero | one | sep
  deriving DecidableEq

def symOfBool : Bool → Sym
  | true => Sym.one
  | false => Sym.zero

theorem symOfBool_ne_sep (b : Bool) : symOfBool b ≠ Sym.sep := by
  cases b <;> exact fun h => Sym.noConfusion h

/-- The binary digits of n, least significant first, computed with a fuel of halvings; `bits 0 = []`. -/
def bitsF : Nat → Nat → List Bool
  | 0, _ => []
  | fuel+1, n => if n = 0 then [] else mod2 n :: bitsF fuel (div2 n)

def bits (n : Nat) : List Bool := bitsF n n

def ofBits : List Bool → Nat
  | [] => 0
  | b :: l => (if b then 1 else 0) + 2 * ofBits l

theorem ofBits_bitsF : ∀ (fuel n : Nat), n ≤ fuel → ofBits (bitsF fuel n) = n
  | 0, n, h => by
    have : n = 0 := Nat.le_zero.mp h
    subst this; rfl
  | fuel+1, n, h =>
    if h0 : n = 0 then by
      show ofBits (if n = 0 then [] else mod2 n :: bitsF fuel (div2 n)) = n
      rw [if_pos h0, h0]; rfl
    else by
      show ofBits (if n = 0 then [] else mod2 n :: bitsF fuel (div2 n)) = n
      rw [if_neg h0]
      show (if mod2 n then 1 else 0) + 2 * ofBits (bitsF fuel (div2 n)) = n
      have hlt : div2 n < n := div2_lt n (Nat.pos_of_ne_zero h0)
      rw [ofBits_bitsF fuel (div2 n) (Nat.le_of_lt_succ (Nat.lt_of_lt_of_le hlt h))]
      exact digit_spec n

theorem ofBits_bits (n : Nat) : ofBits (bits n) = n := ofBits_bitsF n n (Nat.le_refl n)

theorem bits_succ (n : Nat) : bits (n+1) = mod2 (n+1) :: bitsF n (div2 (n+1)) := by
  show (if n + 1 = 0 then [] else mod2 (n+1) :: bitsF n (div2 (n+1))) = _
  rw [if_neg (succ_ne_zero' n)]

/-- Read binary digits up to the first separator: the digits, and the remainder after the separator. -/
def parseBits : List Sym → Option (List Bool × List Sym)
  | [] => none
  | Sym.sep :: rest => some ([], rest)
  | Sym.zero :: rest => (parseBits rest).map (fun p => (false :: p.1, p.2))
  | Sym.one :: rest => (parseBits rest).map (fun p => (true :: p.1, p.2))

theorem parseBits_enc (rest : List Sym) : ∀ l : List Bool,
    parseBits (l.map symOfBool ++ Sym.sep :: rest) = some (l, rest)
  | [] => rfl
  | true :: l => by
    show (parseBits (l.map symOfBool ++ Sym.sep :: rest)).map (fun p => (true :: p.1, p.2)) = some (true :: l, rest)
    exact congrArg (Option.map (fun p => (true :: p.1, p.2))) (parseBits_enc rest l)
  | false :: l => by
    show (parseBits (l.map symOfBool ++ Sym.sep :: rest)).map (fun p => (false :: p.1, p.2)) = some (false :: l, rest)
    exact congrArg (Option.map (fun p => (false :: p.1, p.2))) (parseBits_enc rest l)

/-- A number n is written as the digits of n+1 (never empty) followed by a separator. -/
def encNat (n : Nat) : List Sym := (bits (n+1)).map symOfBool ++ [Sym.sep]
/-- A literal is its variable followed by its sign. -/
def encLit (l : Lit) : List Sym := encNat l.1 ++ [symOfBool l.2]
/-- A clause is its literals followed by a separator. -/
def encClause : Clause → List Sym
  | [] => [Sym.sep]
  | l :: c => encLit l ++ encClause c
/-- A formula is its clauses, one after the other. -/
def encode : CNF → List Sym
  | [] => []
  | c :: f => encClause c ++ encode f

def parseLit (w : List Sym) : Option (Lit × List Sym) :=
  match parseBits w with
  | none => none
  | some (ds, rest) =>
    match rest with
    | [] => none
    | Sym.sep :: _ => none
    | Sym.zero :: rest' => some ((ofBits ds - 1, false), rest')
    | Sym.one :: rest' => some ((ofBits ds - 1, true), rest')

theorem encLit_append (n : Nat) (b : Bool) (rest : List Sym) :
    encLit (n, b) ++ rest = (bits (n+1)).map symOfBool ++ Sym.sep :: (symOfBool b :: rest) := by
  show (((bits (n+1)).map symOfBool ++ [Sym.sep]) ++ [symOfBool b]) ++ rest = _
  rw [append_assoc, append_assoc]; rfl

theorem parseLit_enc (l : Lit) (rest : List Sym) : parseLit (encLit l ++ rest) = some (l, rest) := by
  obtain ⟨n, b⟩ := l
  rw [encLit_append]
  unfold parseLit
  rw [parseBits_enc]
  cases b with
  | true => exact congrArg (fun m => some ((m - 1, true), rest)) (ofBits_bits (n+1))
  | false => exact congrArg (fun m => some ((m - 1, false), rest)) (ofBits_bits (n+1))

theorem encLit_cons (l : Lit) : ∃ s tl, encLit l = s :: tl ∧ s ≠ Sym.sep := by
  obtain ⟨n, b⟩ := l
  show ∃ s tl, ((bits (n+1)).map symOfBool ++ [Sym.sep]) ++ [symOfBool b] = s :: tl ∧ s ≠ Sym.sep
  rw [bits_succ]
  exact ⟨_, _, rfl, symOfBool_ne_sep _⟩

/-- Read a clause: literals until a separator stands where a literal would start. Fuel bounds the recursion. -/
def parseClause : Nat → List Sym → Option (Clause × List Sym)
  | 0, _ => none
  | fuel+1, w =>
    match w with
    | Sym.sep :: rest => some ([], rest)
    | _ =>
      match parseLit w with
      | none => none
      | some (l, rest) =>
        match parseClause fuel rest with
        | none => none
        | some (c, rest') => some (l :: c, rest')

theorem encClause_cons_append (l : Lit) (c : Clause) (rest : List Sym) :
    encClause (l :: c) ++ rest = encLit l ++ (encClause c ++ rest) :=
  append_assoc _ _ _

theorem parseClause_enc : ∀ (c : Clause) (fuel : Nat) (rest : List Sym), c.length ≤ fuel →
    parseClause (fuel+1) (encClause c ++ rest) = some (c, rest)
  | [], _, _, _ => rfl
  | l :: c, fuel'+1, rest, h => by
    obtain ⟨s, tl, he, hs⟩ := encLit_cons l
    have hc : c.length ≤ fuel' := Nat.le_of_succ_le_succ h
    have hw : encClause (l :: c) ++ rest = s :: (tl ++ (encClause c ++ rest)) := by
      rw [encClause_cons_append, he]; rfl
    rw [hw, parseClause]
    · rw [← List.cons_append, ← he, parseLit_enc]
      show (match parseClause (fuel'+1) (encClause c ++ rest) with
            | none => none
            | some (c', rest') => some (l :: c', rest')) = some (l :: c, rest)
      rw [parseClause_enc c fuel' rest hc]
    · intro r hr
      exact hs (List.cons.inj hr).1

theorem encLit_length_pos (l : Lit) : 1 ≤ (encLit l).length := by
  obtain ⟨s, tl, he, _⟩ := encLit_cons l
  rw [he]; exact Nat.succ_le_succ (Nat.zero_le _)

theorem encClause_length : ∀ c : Clause, c.length + 1 ≤ (encClause c).length
  | [] => Nat.le_refl 1
  | l :: c => by
    show c.length + 1 + 1 ≤ (encLit l ++ encClause c).length
    rw [length_append, Nat.add_comm (c.length + 1) 1]
    exact Nat.add_le_add (encLit_length_pos l) (encClause_length c)

theorem encClause_cons (c : Clause) : ∃ s tl, encClause c = s :: tl := by
  cases c with
  | nil => exact ⟨Sym.sep, [], rfl⟩
  | cons l c =>
    obtain ⟨s, tl, he, _⟩ := encLit_cons l
    exact ⟨s, tl ++ encClause c, by show encLit l ++ encClause c = _; rw [he]; rfl⟩

theorem encClause_ne_nil (c : Clause) (rest : List Sym) : encClause c ++ rest ≠ [] := by
  obtain ⟨s, tl, he⟩ := encClause_cons c
  rw [he]; exact fun h => List.noConfusion h

/-- Read a formula: clauses until the string ends. Fuel bounds the recursion. -/
def parseCNF : Nat → List Sym → Option CNF
  | _, [] => some []
  | 0, _ :: _ => none
  | fuel+1, x :: w =>
    match parseClause (x :: w).length (x :: w) with
    | none => none
    | some (c, rest) =>
      match parseCNF fuel rest with
      | none => none
      | some f => some (c :: f)

/-- THE DECODER. -/
def decode (w : List Sym) : Option CNF := parseCNF w.length w

theorem encode_length : ∀ f : CNF, f.length ≤ (encode f).length
  | [] => Nat.le_refl 0
  | c :: f => by
    show f.length + 1 ≤ (encClause c ++ encode f).length
    rw [length_append, Nat.add_comm f.length 1]
    exact Nat.add_le_add (Nat.le_trans (Nat.le_add_left 1 c.length) (encClause_length c)) (encode_length f)

theorem parseCNF_enc : ∀ (f : CNF) (fuel : Nat), f.length ≤ fuel → parseCNF fuel (encode f) = some f
  | [], fuel, _ => by cases fuel <;> rfl
  | c :: f, fuel'+1, h => by
    have hf : f.length ≤ fuel' := Nat.le_of_succ_le_succ h
    show parseCNF (fuel'+1) (encClause c ++ encode f) = some (c :: f)
    cases hE : encClause c ++ encode f with
    | nil => exact absurd hE (encClause_ne_nil c _)
    | cons x w =>
      have hcw : c.length ≤ w.length := by
        have h1 : (encClause c ++ encode f).length = w.length + 1 := congrArg List.length hE
        rw [length_append] at h1
        exact Nat.le_of_succ_le_succ (Nat.le_trans (encClause_length c)
          (Nat.le_trans (Nat.le_add_right _ _) (Nat.le_of_eq h1)))
      show (match parseClause (w.length + 1) (x :: w) with
            | none => none
            | some (c', rest) =>
              match parseCNF fuel' rest with
              | none => none
              | some f' => some (c' :: f')) = some (c :: f)
      rw [← hE, parseClause_enc c w.length (encode f) hcw]
      show (match parseCNF fuel' (encode f) with
            | none => none
            | some f' => some (c :: f')) = some (c :: f)
      rw [parseCNF_enc f fuel' hf]

/-- THE DECODER INVERTS THE ENCODING. -/
theorem decode_encode (f : CNF) : decode (encode f) = some f :=
  parseCNF_enc f _ (encode_length f)

/-- THE ENCODING IS INJECTIVE: distinct formulas have distinct strings. -/
theorem encode_injective (f g : CNF) (h : encode f = encode g) : f = g := by
  have hf := decode_encode f
  rw [h, decode_encode] at hf
  exact (Option.some.inj hf).symm

/-- SAT AS A LANGUAGE over the input alphabet: a string is in SAT when it decodes to a satisfiable formula. -/
def satLang (w : List Sym) : Bool :=
  match decode w with
  | some f => satB f
  | none => false

theorem satLang_encode (f : CNF) : satLang (encode f) = satB f := by
  unfold satLang
  rw [decode_encode]

theorem satLang_encode_iff (f : CNF) : satLang (encode f) = true ↔ Satisfiable f := by
  rw [satLang_encode]; exact satB_iff f

/-! ## XIV · Turing machines: finite control, one two-way tape, step semantics -/

inductive Dir | L | R

/-- A TURING MACHINE. States are `Fin q`; tape symbols are `Fin (s + 4)`: 0 the blank, 1 and 2 the binary
    digits, 3 the separator, and s further work symbols. The transition function is total; the machine halts in
    its accept or reject state. -/
structure TM where
  q : Nat
  s : Nat
  δ : Fin q → Fin (s + 4) → Fin q × Fin (s + 4) × Dir
  start : Fin q
  accept : Fin q
  reject : Fin q

theorem lt_add4 (i s : Nat) (h : i < 4) : i < s + 4 := Nat.lt_of_lt_of_le h (Nat.le_add_left 4 s)

def Sym.toTape (s : Nat) : Sym → Fin (s + 4)
  | Sym.zero => ⟨1, lt_add4 1 s (by decide)⟩
  | Sym.one => ⟨2, lt_add4 2 s (by decide)⟩
  | Sym.sep => ⟨3, lt_add4 3 s (by decide)⟩

structure Config (M : TM) where
  st : Fin M.q
  pos : Int
  tape : Int → Fin (M.s + 4)

def blank (M : TM) : Fin (M.s + 4) := ⟨0, lt_add4 0 M.s (by decide)⟩

/-- The input written from cell 0 rightward, blank elsewhere. -/
def initTape (M : TM) (w : List Sym) : Int → Fin (M.s + 4) :=
  fun i => if i < 0 then blank M else (w.map (Sym.toTape M.s)).getD i.toNat (blank M)

def init (M : TM) (w : List Sym) : Config M := ⟨M.start, 0, initTape M w⟩

def halted (M : TM) (c : Config M) : Prop := c.st = M.accept ∨ c.st = M.reject
instance (M : TM) (c : Config M) : Decidable (halted M c) := inferInstanceAs (Decidable (_ ∨ _))

def move : Dir → Int
  | Dir.L => -1
  | Dir.R => 1

/-- ONE STEP: read the scanned cell, write, move, change state; a halted configuration is fixed. -/
def step (M : TM) (c : Config M) : Config M :=
  if halted M c then c else
  let r := M.δ c.st (c.tape c.pos)
  { st := r.1, pos := c.pos + move r.2.2, tape := fun i => if i = c.pos then r.2.1 else c.tape i }

/-- THE RUN: the configuration after t steps on input w. -/
def run (M : TM) (w : List Sym) : Nat → Config M
  | 0 => init M w
  | t+1 => step M (run M w t)

def HaltsAt (M : TM) (w : List Sym) (t : Nat) : Prop := halted M (run M w t)
instance (M : TM) (w : List Sym) (t : Nat) : Decidable (HaltsAt M w t) :=
  inferInstanceAs (Decidable (halted M (run M w t)))

/-- The verdict after t steps: in the accept state or not. -/
def verdictAt (M : TM) (w : List Sym) (t : Nat) : Bool := decide ((run M w t).st = M.accept)

theorem step_halted (M : TM) (c : Config M) (h : halted M c) : step M c = c := by
  unfold step; exact if_pos h

/-- A HALTED MACHINE STAYS WHERE IT IS: the run is constant from the halting step on. -/
theorem run_of_le {M : TM} {w : List Sym} {t u : Nat} (h : HaltsAt M w t) (hle : t ≤ u) :
    run M w u = run M w t := by
  induction hle with
  | refl => rfl
  | step _ ih => exact (congrArg (step M) ih).trans (step_halted M _ h)

/-- A HALTED MACHINE STAYS HALTED. -/
theorem haltsAt_of_le {M : TM} {w : List Sym} {t u : Nat} (h : HaltsAt M w t) (hle : t ≤ u) :
    HaltsAt M w u :=
  Eq.mpr (congrArg (halted M) (run_of_le h hle)) h

/-- THE VERDICT IS FIXED FROM THE HALTING STEP ON. -/
theorem verdict_of_le {M : TM} {w : List Sym} {t u : Nat} (h : HaltsAt M w t) (hle : t ≤ u) :
    verdictAt M w u = verdictAt M w t :=
  congrArg (fun c : Config M => decide (c.st = M.accept)) (run_of_le h hle)

/-! ## XV · the running time: the first halting step -/

/-- The first halting step at or below n, or n when none is found below it. -/
def firstHalt (M : TM) (w : List Sym) : Nat → Nat
  | 0 => 0
  | n+1 => if HaltsAt M w (firstHalt M w n) then firstHalt M w n else n+1

theorem firstHalt_le (M : TM) (w : List Sym) : ∀ n, firstHalt M w n ≤ n
  | 0 => Nat.le_refl 0
  | n+1 =>
    if h : HaltsAt M w (firstHalt M w n) then by
      show (if HaltsAt M w (firstHalt M w n) then firstHalt M w n else n+1) ≤ n+1
      rw [if_pos h]; exact Nat.le_succ_of_le (firstHalt_le M w n)
    else by
      show (if HaltsAt M w (firstHalt M w n) then firstHalt M w n else n+1) ≤ n+1
      rw [if_neg h]; exact Nat.le_refl _

theorem firstHalt_halts (M : TM) (w : List Sym) : ∀ n, HaltsAt M w n → HaltsAt M w (firstHalt M w n)
  | 0, h => h
  | n+1, h =>
    if hn : HaltsAt M w (firstHalt M w n) then by
      show HaltsAt M w (if HaltsAt M w (firstHalt M w n) then firstHalt M w n else n+1)
      rw [if_pos hn]; exact hn
    else by
      show HaltsAt M w (if HaltsAt M w (firstHalt M w n) then firstHalt M w n else n+1)
      rw [if_neg hn]; exact h

theorem firstHalt_least (M : TM) (w : List Sym) :
    ∀ n t, HaltsAt M w t → t ≤ n → firstHalt M w n ≤ t
  | 0, t, _, _ => Nat.zero_le t
  | n+1, t, h, ht =>
    if hn : HaltsAt M w (firstHalt M w n) then by
      show (if HaltsAt M w (firstHalt M w n) then firstHalt M w n else n+1) ≤ t
      rw [if_pos hn]
      exact match Nat.lt_or_ge t (n+1) with
        | Or.inl hlt => firstHalt_least M w n t h (Nat.le_of_lt_succ hlt)
        | Or.inr hge => Nat.le_trans (firstHalt_le M w n) (Nat.le_trans (Nat.le_succ n) hge)
    else by
      show (if HaltsAt M w (firstHalt M w n) then firstHalt M w n else n+1) ≤ t
      rw [if_neg hn]
      exact match Nat.lt_or_ge t (n+1) with
        | Or.inl hlt => absurd (firstHalt_halts M w n (haltsAt_of_le h (Nat.le_of_lt_succ hlt))) hn
        | Or.inr hge => hge

/-- A DECIDER: a Turing machine with a clock that certifies it halts on every input. The clock certifies and
    does not time: the running time below is the first halting step, whatever the clock says. -/
structure Decider where
  M : TM
  clock : List Sym → Nat
  halts : ∀ w : List Sym, HaltsAt M w (clock w)

/-- THE RUNNING TIME: the first halting step. -/
def time (D : Decider) (w : List Sym) : Nat := firstHalt D.M w (D.clock w)
/-- THE OUTPUT: the verdict at the first halting step. -/
def out (D : Decider) (w : List Sym) : Bool := verdictAt D.M w (time D w)

theorem time_halts (D : Decider) (w : List Sym) : HaltsAt D.M w (time D w) :=
  firstHalt_halts D.M w (D.clock w) (D.halts w)

theorem time_least (D : Decider) (w : List Sym) (t : Nat) (h : HaltsAt D.M w t) : time D w ≤ t :=
  match Nat.lt_or_ge t (D.clock w) with
  | Or.inl hlt => firstHalt_least D.M w (D.clock w) t h (Nat.le_of_lt hlt)
  | Or.inr hge => Nat.le_trans (firstHalt_le D.M w (D.clock w)) hge

theorem out_eq (D : Decider) (w : List Sym) (t : Nat) (h : HaltsAt D.M w t) : out D w = verdictAt D.M w t :=
  (verdict_of_le (time_halts D w) (time_least D w t h)).symm

/-! ## XVI · the SAT machine of the Turing model, and SAT ∉ P stated over all Turing machines -/

/-- THE SAT MACHINE OF THE TURING MODEL. Algorithms: deciders. Instances: strings over the input alphabet.
    Size: the length of the string. Output and time: the verdict and the step count of the run. Predicate: SAT. -/
def TMSAT : Machine := ⟨Decider, List Sym, List.length, out, time, satLang⟩

/-- A language over the input alphabet. -/
abbrev Lang := List Sym → Bool

/-- A LANGUAGE IS IN P: some Turing machine halts on every input within c·n^k + c steps, n the length of the
    input, in the accept state exactly on the strings of the language. -/
def InP (L : Lang) : Prop := ∃ (M : TM) (c k : Nat), ∀ w : List Sym,
  ∃ t, t ≤ bound c k w.length ∧ HaltsAt M w t ∧ verdictAt M w t = L w

/-- SAT ∈ P, the proposition, over every Turing machine. -/
def SATinP : Prop := InP satLang

theorem satInP_iff : SATinP ↔ InP satLang := Iff.rfl

/-- A LANGUAGE IS IN NP: some Turing machine, the verifier, accepts within c·n^k + c steps the string made of a
    binary certificate of length at most c·n^k + c, the separator, and the input, exactly when the input is in the
    language; n is the length of the input. The certificate contains no separator, so the first separator on the
    tape delimits it. -/
def InNP (L : Lang) : Prop := ∃ (M : TM) (c k : Nat), ∀ w : List Sym,
  (L w = true ↔ ∃ u : List Bool, u.length ≤ bound c k w.length ∧
    ∃ t, t ≤ bound c k w.length ∧ HaltsAt M (u.map symOfBool ++ Sym.sep :: w) t ∧
      verdictAt M (u.map symOfBool ++ Sym.sep :: w) t = true)

/-- P ≠ NP, the sentence: some language is in NP and not in P. -/
def P_ne_NP : Prop := ∃ L : Lang, InNP L ∧ ¬ InP L

/-- THE ONE-WAY BRIDGE, with SAT ∈ NP as its named hypothesis: SAT ∉ P gives P ≠ NP. -/
theorem p_ne_np_of_not_inP (hNP : InNP satLang) (h : ¬ SATinP) : P_ne_NP := ⟨satLang, hNP, h⟩

/-- THE BRIDGE: the separation of the SAT machine is exactly SAT ∉ P over all Turing machines. -/
theorem sep_tmsat_iff : Sep TMSAT ↔ ¬ SATinP := by
  constructor
  · intro hsep ⟨M, c, k, h⟩
    let D : Decider := ⟨M, fun w => bound c k w.length,
      fun w => match h w with | ⟨t, hle, ht, _⟩ => haltsAt_of_le ht hle⟩
    apply hsep
    refine ⟨D, c, k, fun w => ?_⟩
    obtain ⟨t, hle, ht, hv⟩ := h w
    exact ⟨(out_eq D w t ht).trans hv, Nat.le_trans (time_least D w t ht) hle⟩
  · intro hnot ⟨D, c, k, he⟩
    apply hnot
    refine ⟨D.M, c, k, fun w => ?_⟩
    obtain ⟨hout, htime⟩ := he w
    exact ⟨time D w, htime, time_halts D w, hout⟩

/-- Every natural-coefficient polynomial is dominated by a bound of the kernel's form. -/
def evalPoly : List Nat → Nat → Nat
  | [], _ => 0
  | a :: as, n => a + n * evalPoly as n

theorem evalPoly_le (as : List Nat) (n : Nat) (hn : 1 ≤ n) : evalPoly as n ≤ as.sum * n ^ as.length := by
  induction as with
  | nil => exact Nat.le_refl 0
  | cons a as ih =>
    show a + n * evalPoly as n ≤ (a + as.sum) * (n ^ as.length * n)
    have hpos : 1 ≤ n ^ as.length * n := Nat.mul_pos (Nat.pow_pos hn) hn
    have h1 : a ≤ a * (n ^ as.length * n) :=
      Nat.le_trans (Nat.le_of_eq (Nat.mul_one a).symm) (Nat.mul_le_mul_left a hpos)
    have h2 : n * evalPoly as n ≤ as.sum * (n ^ as.length * n) := by
      have := Nat.mul_le_mul_left n ih
      rw [Nat.mul_comm n (as.sum * n ^ as.length), mul_assoc'] at this
      exact this
    rw [add_mul']
    exact Nat.add_le_add h1 h2

theorem evalPoly_le_bound (as : List Nat) (n : Nat) : evalPoly as n ≤ bound as.sum as.length n :=
  match n with
  | 0 => by
    cases as with
    | nil => exact Nat.le_refl 0
    | cons a as =>
      show a + 0 * evalPoly as 0 ≤ (a + as.sum) * 0 ^ (as.length + 1) + (a + as.sum)
      rw [Nat.zero_mul, Nat.add_zero, Nat.pow_succ, Nat.mul_zero, Nat.mul_zero, Nat.zero_add]
      exact Nat.le_add_right a as.sum
  | n+1 => Nat.le_trans (evalPoly_le as (n+1) (Nat.succ_le_succ (Nat.zero_le n))) (Nat.le_add_right _ _)

/-- SAT ∈ P in the polynomial's own terms implies SAT ∈ P in the kernel's: nothing is lost in the bound. -/
theorem SATinP_of_poly (M : TM) (as : List Nat)
    (h : ∀ w : List Sym, ∃ t, t ≤ evalPoly as w.length ∧ HaltsAt M w t ∧ verdictAt M w t = satLang w) :
    SATinP :=
  ⟨M, as.sum, as.length, fun w => match h w with
    | ⟨t, hle, ht, hv⟩ => ⟨t, Nat.le_trans hle (evalPoly_le_bound as w.length), ht, hv⟩⟩

/-! ## XVII · the normal form on the Turing model -/

theorem tmsat_record_has_least_escape : NothingEscapes (Rec TMSAT) :=
  record_has_least_escape TMSAT []

/-- THE NORMAL FORM OF P VERSUS NP ON THE TURING MODEL: SAT ∉ P is exactly the transfer of least escape from the
    record of the SAT machine to the SAT machine. -/
theorem pnp_normal_form_turing :
    (NothingEscapes (Rec TMSAT) → NothingEscapes TMSAT) ↔ ¬ SATinP :=
  (sep_normal_form TMSAT []).trans sep_tmsat_iff

theorem tmsat_bit_is_the_act :
    (NothingEscapes (Rec TMSAT) → NothingEscapes TMSAT) ↔ Nonempty (LeastEscape TMSAT) :=
  bit_is_the_act TMSAT []

theorem tmsat_self_recursion : (SelfRecursive TMSAT ↔ ¬ SATinP) ∧ SelfRecursive (Rec TMSAT) :=
  ⟨(self_recursion_at_machine TMSAT).trans sep_tmsat_iff, record_is_self_recursive TMSAT []⟩

/-- EVERY ROUTE TO SAT ∉ P PASSES THE BIT. -/
theorem tmsat_every_route_passes_the_bit (Q : Prop) (h : Q → ¬ SATinP) :
    Q → (NothingEscapes (Rec TMSAT) → NothingEscapes TMSAT) :=
  every_route_passes_the_bit TMSAT [] Q (fun q => sep_tmsat_iff.mpr (h q))

theorem tmsat_posit_is_the_bit :
    RAcomp TMSAT ↔ (NothingEscapes (Rec TMSAT) → NothingEscapes TMSAT) :=
  the_posit_is_the_bit TMSAT []

/-- THE BRIDGE TEST: the register's reading of the root on computation, every decider at every bound failing to
    escape, is exactly SAT ∉ P on the Turing model, on no axiom. -/
theorem tmsat_racomp_iff_not_inP : RAcomp TMSAT ↔ ¬ SATinP :=
  (ra_comp_is_sep TMSAT).trans sep_tmsat_iff

/-- EVERY EXIT IS THE POSIT: any proof of SAT ∉ P, by any route, including one built from facts about Turing
    machines, yields all three names of the one posit: the transfer, a least-escape certificate, and the root
    read on computation. -/
theorem every_exit_is_the_posit (h : ¬ SATinP) :
    (NothingEscapes (Rec TMSAT) → NothingEscapes TMSAT) ∧ Nonempty (LeastEscape TMSAT) ∧ RAcomp TMSAT :=
  have bit : NothingEscapes (Rec TMSAT) → NothingEscapes TMSAT := pnp_normal_form_turing.mpr h
  ⟨bit, tmsat_bit_is_the_act.mp bit, tmsat_racomp_iff_not_inP.mpr h⟩

/-- THE POSIT IS EVERY EXIT: each name of the posit gives SAT ∉ P back, on no axiom. Nothing stands between the
    posit and the conclusion. -/
theorem the_posit_is_every_exit :
    ((NothingEscapes (Rec TMSAT) → NothingEscapes TMSAT) → ¬ SATinP) ∧
    (Nonempty (LeastEscape TMSAT) → ¬ SATinP) ∧
    (RAcomp TMSAT → ¬ SATinP) :=
  ⟨fun bit => sep_tmsat_iff.mp (sep_from_the_cargo_loop TMSAT [] bit),
   fun ⟨L⟩ => sep_tmsat_iff.mp (sep_of_closure TMSAT L.closure),
   fun h => tmsat_racomp_iff_not_inP.mp h⟩

/-- THE CAPSTONE ON THE TURING MODEL. -/
theorem tmsat_normal_form_complete :
    NothingEscapes (Rec TMSAT) ∧
    ((NothingEscapes (Rec TMSAT) → NothingEscapes TMSAT) ↔ ¬ SATinP) ∧
    ((NothingEscapes (Rec TMSAT) → NothingEscapes TMSAT) ↔ Nonempty (LeastEscape TMSAT)) ∧
    (SelfRecursive TMSAT ↔ ¬ SATinP) ∧
    (∀ Q : Prop, (Q → ¬ SATinP) → Q → (NothingEscapes (Rec TMSAT) → NothingEscapes TMSAT)) ∧
    (RAcomp TMSAT ↔ (NothingEscapes (Rec TMSAT) → NothingEscapes TMSAT)) ∧
    (¬ ∃ b, comp b = b) :=
  ⟨tmsat_record_has_least_escape, pnp_normal_form_turing, tmsat_bit_is_the_act, tmsat_self_recursion.1,
   tmsat_every_route_passes_the_bit, tmsat_posit_is_the_bit, locus_vanishes⟩

/-! ## XVIII · the coincidence form and the unique certificate -/

/-- Registration is idempotent: the record of the record is the record. -/
theorem rec_rec (M : Machine) : Rec (Rec M) = Rec M := rfl

/-- THE COINCIDENCE NORMAL FORM: a machine is separated exactly when its escape profile coincides with its
    record's, which is empty. -/
theorem coincidence_normal_form (M : Machine) (x₀ : M.Inst) :
    (∀ A c k, Escapes M A c k ↔ Escapes (Rec M) A c k) ↔ Sep M :=
  ⟨fun h ⟨A, c, k, he⟩ => bnot_ne (M.sat x₀) ((h A c k).mp he x₀).1,
   fun hs A c k => ⟨fun he => absurd ⟨A, c, k, he⟩ hs, fun he => (bnot_ne (M.sat x₀) (he x₀).1).elim⟩⟩

theorem tmsat_coincidence : (∀ A c k, Escapes TMSAT A c k ↔ Escapes (Rec TMSAT) A c k) ↔ ¬ SATinP :=
  (coincidence_normal_form TMSAT []).trans sep_tmsat_iff

/-- THE CERTIFICATE IS UNIQUE: any two least-escape certificates of the SAT machine are the same object, and any
    two proofs of SAT ∉ P are the same proof, by proof irrelevance; so every route delivers one object. -/
theorem certificate_unique : (∀ L₁ L₂ : LeastEscape TMSAT, L₁ = L₂) ∧ (∀ h₁ h₂ : ¬ SATinP, h₁ = h₂) :=
  ⟨fun _ _ => rfl, fun _ _ => rfl⟩

/-! ## XIX · the defense on the Turing machine -/

/-- NOTHING PASSES AGAINST THE SEPARATION BUT AN ESCAPE (classical): a rejection of SAT ∉ P is a witness, a
    decider and a bound with every run clean. -/
theorem tmsat_rejection_is_a_witness : ¬ ¬ SATinP ↔ ∃ (D : Decider) (c k : Nat), Escapes TMSAT D c k :=
  ⟨fun hnn => Classical.byContradiction fun hne => hnn (sep_tmsat_iff.mp hne),
   fun he hn => sep_tmsat_iff.mpr hn he⟩

/-- EVERY PAIR LANDS (classical): every decider at every bound either is stopped by some string or escapes. -/
theorem tmsat_every_pair_lands (D : Decider) (c k : Nat) :
    (∃ w, ¬ Clean TMSAT D c k w) ∨ Escapes TMSAT D c k :=
  Classical.byCases (fun he : Escapes TMSAT D c k => Or.inr he)
    (fun hne => Or.inl (Classical.byContradiction fun hno =>
      hne (fun w => Classical.byContradiction fun hw => hno ⟨w, hw⟩)))

/-- FORCES OR HAS A TWIN (classical): every property of machines either forces the closure or holds on some
    machine that escapes. -/
theorem forces_or_has_a_twin (P : Machine → Prop) : Forces P ∨ ∃ M, P M ∧ ¬ NothingEscapes M :=
  Classical.byCases (fun hF : Forces P => Or.inl hF)
    (fun hF => Or.inr (Classical.byContradiction fun hne =>
      hF (fun M hp => Classical.byContradiction fun hc => hne ⟨M, hp, hc⟩)))

/-- An escape refutes the closure, on no axiom. -/
theorem escape_refutes (M : Machine) (A : M.Alg) (c k : Nat) (he : Escapes M A c k) : ¬ NothingEscapes M :=
  fun h => match h A c k with | ⟨x, hx⟩ => hx (he x)

/-- The act leaves no escape, on no axiom. -/
theorem act_leaves_no_escape (M : Machine) (h : NothingEscapes M) : ∀ A c k, ¬ Escapes M A c k :=
  fun A c k he => escape_refutes M A c k he h

/-- THE EXTENSION of a machine by one more algorithm, which answers the predicate itself in no time. -/
def extendM (M : Machine) : Machine :=
  ⟨Option M.Alg, M.Inst, M.size,
   fun A x => match A with | none => M.sat x | some a => M.out a x,
   fun A x => match A with | none => 0 | some a => M.time a x,
   M.sat⟩

/-- The added algorithm escapes at every bound. -/
theorem extend_escapes (M : Machine) (c k : Nat) : Escapes (extendM M) none c k :=
  fun _ => ⟨rfl, Nat.zero_le _⟩

/-- Every examination of the machine is an examination of its extension. -/
def examination_extend (M : Machine) (e : Examination M) : Examination (extendM M) :=
  ⟨some e.A, e.c, e.k, e.x, e.stops⟩

/-- Every examination of the machine is an examination of its record. -/
def examination_rec (M : Machine) (e : Examination M) : Examination (Rec M) :=
  ⟨e.A, e.c, e.k, e.x, fun hc => bnot_ne (M.sat e.x) hc.1⟩

/-- NO RECORD DECIDES: every stock of examinations of a machine with an instance, finite or infinite, is a stock
    of stops both on its extension, where an algorithm escapes, and on its record, where nothing escapes.
    Observed stops decide nothing about the machine. -/
theorem no_record_decides (M : Machine) (x₀ : M.Inst) (ι : Type) (stock : ι → Examination M) :
    (∃ A c k, Escapes (extendM M) A c k) ∧
    (∀ i, ¬ Clean (extendM M) (some (stock i).A) (stock i).c (stock i).k (stock i).x) ∧
    NothingEscapes (Rec M) ∧
    (∀ i, ¬ Clean (Rec M) (stock i).A (stock i).c (stock i).k (stock i).x) :=
  ⟨⟨none, 0, 0, extend_escapes M 0 0⟩, fun i => (examination_extend M (stock i)).stops,
   record_has_least_escape M x₀, fun i => (examination_rec M (stock i)).stops⟩

theorem tmsat_no_record_decides (ι : Type) (stock : ι → Examination TMSAT) :
    (∃ A c k, Escapes (extendM TMSAT) A c k) ∧
    (∀ i, ¬ Clean (extendM TMSAT) (some (stock i).A) (stock i).c (stock i).k (stock i).x) ∧
    NothingEscapes (Rec TMSAT) ∧
    (∀ i, ¬ Clean (Rec TMSAT) (stock i).A (stock i).c (stock i).k (stock i).x) :=
  no_record_decides TMSAT [] ι stock

/-! ## XX · executable checks: the model and the decoder compute, by `decide` -/

/-- A three-state machine that accepts exactly when the first input symbol is `one`. -/
def firstIsOne : TM :=
  { q := 3, s := 0,
    δ := fun _ a => if a.val = 2 then (⟨1, by decide⟩, a, Dir.R) else (⟨2, by decide⟩, a, Dir.R),
    start := ⟨0, by decide⟩, accept := ⟨1, by decide⟩, reject := ⟨2, by decide⟩ }

example : ¬ HaltsAt firstIsOne [Sym.one] 0 := by decide
example : HaltsAt firstIsOne [Sym.one] 1 := by decide
example : verdictAt firstIsOne [Sym.one] 1 = true := by decide
example : verdictAt firstIsOne [Sym.zero] 1 = false := by decide
example : HaltsAt firstIsOne [] 1 := by decide
example : verdictAt firstIsOne [Sym.one, Sym.zero] 5 = true := by decide
example : encode [[(0, true)]] = [Sym.one, Sym.sep, Sym.one, Sym.sep] := by decide
example : decode [Sym.one, Sym.sep, Sym.one, Sym.sep] = some [[(0, true)]] := by decide
example : decode [Sym.one, Sym.one] = none := by decide
example : satLang [] = true := by decide
example : satLang [Sym.sep] = false := by decide
example : satLang (encode [[(0, true)]]) = true := by decide
example : satLang (encode [[(0, true)], [(0, false)]]) = false := by decide
example : satLang (encode [[(1, true), (0, false)], [(1, false)]]) = true := by decide

end PNP.TM

/-! # PART D · THE FRONTIER, FORMAL ALONE: the black-box floor and the white-box contrast
    Carried from PNP_Frontier_II.lean of the register (namespaces BLACKBOX and MISSING), pure mathematics on no
    axiom; no physics and no root enter. -/
namespace PNP.BLACKBOX

def has : List Nat → Nat → Bool
  | [], _ => false
  | y :: ys, k => Nat.beq y k || has ys k

def drop : List Nat → Nat → List Nat
  | [], _ => []
  | y :: ys, k => cond (Nat.beq y k) (drop ys k) (y :: drop ys k)

theorem beq_self : ∀ n : Nat, Nat.beq n n = true
  | 0 => rfl
  | n + 1 => beq_self n

theorem drop_le : ∀ (l : List Nat) (k : Nat), (drop l k).length ≤ l.length
  | [], _ => Nat.le_refl 0
  | y :: ys, k => by
    unfold drop
    cases Nat.beq y k with
    | true => exact Nat.le_succ_of_le (drop_le ys k)
    | false => exact Nat.succ_le_succ (drop_le ys k)

theorem drop_len : ∀ (l : List Nat) (k : Nat), has l k = true → (drop l k).length + 1 ≤ l.length
  | [], _, h => Bool.noConfusion h
  | y :: ys, k, h => by
    unfold drop
    unfold has at h
    cases hy : Nat.beq y k with
    | true => exact Nat.succ_le_succ (drop_le ys k)
    | false =>
      rw [hy] at h
      exact Nat.succ_le_succ (drop_len ys k h)

theorem has_drop : ∀ (l : List Nat) (k x : Nat), Nat.beq x k = false →
    has l x = true → has (drop l k) x = true
  | [], _, _, _, h => Bool.noConfusion h
  | y :: ys, k, x, hxk, h => by
    unfold drop
    unfold has at h
    cases hy : Nat.beq y k with
    | true =>
      cases hyx : Nat.beq y x with
      | true =>
        have : x = k := (Nat.eq_of_beq_eq_true hyx).symm.trans (Nat.eq_of_beq_eq_true hy)
        rw [this, beq_self] at hxk; exact Bool.noConfusion hxk
      | false =>
        rw [hyx] at h
        exact has_drop ys k x hxk h
    | false =>
      show has (y :: drop ys k) x = true
      unfold has
      cases hyx : Nat.beq y x with
      | true => rfl
      | false =>
        rw [hyx] at h
        exact has_drop ys k x hxk h

theorem beq_false_of_lt (x K : Nat) (h : x < K) : Nat.beq x K = false := by
  cases hb : Nat.beq x K with
  | false => rfl
  | true =>
    have e : x = K := Nat.eq_of_beq_eq_true hb
    rw [e] at h; exact absurd h (Nat.lt_irrefl K)

/-- PIGEONHOLE, on no axiom: a list that contains every number below K has at least K entries. -/
theorem pigeon : ∀ (K : Nat) (l : List Nat), (∀ x, x < K → has l x = true) → K ≤ l.length
  | 0, _, _ => Nat.zero_le _
  | K + 1, l, h =>
    Nat.le_trans
      (Nat.succ_le_succ (pigeon K (drop l K) (fun x hx =>
        has_drop l K x (beq_false_of_lt x K hx) (h x (Nat.lt_succ_of_lt hx)))))
      (drop_len l K (h K (Nat.lt_succ_self K)))

/-- The run of a test-only procedure with a fixed list of queries: it answers true when some queried
    candidate is a witness. -/
def run (path : List Nat) (f : Nat → Bool) : Bool := path.any f

theorem run_eq_has : ∀ (l : List Nat) (x : Nat), run l (fun y => Nat.beq y x) = has l x
  | [], _ => rfl
  | y :: ys, x => by
    show (Nat.beq y x || run ys (fun y => Nat.beq y x)) = (Nat.beq y x || has ys x)
    rw [run_eq_has ys x]

/-- THE BLACK-BOX BOUND: a fixed list of tests that decides existence over K candidates for every candidate
    function tests at least K of them. -/
theorem black_box_bound (K : Nat) (path : List Nat)
    (correct : ∀ f : Nat → Bool, run path f = true ↔ ∃ x, x < K ∧ f x = true) :
    K ≤ path.length :=
  pigeon K path (fun x hx => by
    rw [← run_eq_has]
    exact (correct _).mpr ⟨x, hx, beq_self x⟩)

/-- NO SAVINGS: over 2^N candidates no such list is shorter than 2^N. -/
theorem black_box_no_savings (N : Nat) (path : List Nat)
    (correct : ∀ f : Nat → Bool, run path f = true ↔ ∃ x, x < 2 ^ N ∧ f x = true) :
    ¬ path.length < 2 ^ N :=
  Nat.not_lt_of_le (black_box_bound (2 ^ N) path correct)

end PNP.BLACKBOX

namespace PNP.MISSING

/-- The black-box adversary family of `black_box_bound`: the point functions. -/
def point (x : Nat) : Nat → Bool := fun y => Nat.beq y x

/-- The same family, handed over as descriptions. -/
structure Desc where
  secret : Nat

def evalD (d : Desc) : Nat → Bool := point d.secret

/-- The white-box reader: one step, read the description. -/
def reader (d : Desc) : Nat := d.secret
def readerTime (_ : Nat) : Nat := 1

/-- The black-box hard instances are white-box trivial. -/
theorem reader_solves : ∀ d : Desc, evalD d (reader d) = true :=
  fun d => PNP.BLACKBOX.beq_self d.secret

structure Model where
  Alg     : Type
  decides : Alg → Prop
  time    : Alg → Nat → Nat

def PolyBounded (t : Nat → Nat) : Prop := ∃ c k : Nat, ∀ n, t n ≤ c * n ^ k + c

/-- THE MISSING OBJECT: every algorithm that decides the problem from its description runs in
    super-polynomial time. -/
def WhiteBoxBound (M : Model) : Prop :=
  ∀ A : M.Alg, M.decides A → ¬ PolyBounded (M.time A)

theorem reader_poly : PolyBounded readerTime :=
  ⟨1, 0, fun n => Nat.le_add_left 1 (1 * n ^ 0)⟩

/-- A coherent model where descriptions reveal the witness: the object fails. -/
def revealing : Model := ⟨Unit, fun _ => ∀ d : Desc, evalD d (reader d) = true, fun _ => readerTime⟩

theorem fails_when_descriptions_reveal : ¬ WhiteBoxBound revealing :=
  fun h => h () reader_solves reader_poly

/-- The object is keyed: it fails where descriptions reveal and holds wherever no algorithm decides. -/
theorem missing_object_is_keyed :
    (∃ M : Model, ¬ WhiteBoxBound M) ∧ (∀ M : Model, (∀ A, ¬ M.decides A) → WhiteBoxBound M) :=
  ⟨⟨revealing, fails_when_descriptions_reveal⟩, fun _ h A hA => absurd hA (h A)⟩

end PNP.MISSING

/-! # PART E · THE RESIDUE, PRINTED AS A TYPE -/
namespace PNP.RESIDUE
open PNP.NORMALFORM

/-- THE RESIDUE. Everything above is unconditional. What remains of the separation is this one hypothesis, the
    transfer of least escape from the record to the machine, which is the act: given it, the separation follows
    on no axiom. It is printed here as the type of a hypothesis and is assumed nowhere in this file. -/
theorem separation_of_the_act (M : Machine) (x₀ : M.Inst)
    (bit : NothingEscapes (Rec M) → NothingEscapes M) : Sep M :=
  sep_from_the_cargo_loop M x₀ bit

/-- The residue on SAT, in every algorithm model: the one implication, and nothing else, stands between the
    theorems of this file and the separation of SAT. -/
theorem sat_separation_of_the_act (Alg : Type) (out : Alg → PNP.SAT.CNF → Bool) (time : Alg → PNP.SAT.CNF → Nat)
    (bit : NothingEscapes (Rec (PNP.SAT.SAT Alg out time)) → NothingEscapes (PNP.SAT.SAT Alg out time)) :
    PNP.SAT.SepSAT Alg out time :=
  separation_of_the_act (PNP.SAT.SAT Alg out time) [] bit

/-- THE RESIDUE ON THE TURING MODEL: given the one implication on the SAT machine of the Turing model, no Turing
    machine decides SAT within any polynomial bound. SAT ∉ P is this hypothesis and nothing else. -/
theorem sat_not_in_P_of_the_act
    (bit : NothingEscapes (Rec PNP.TM.TMSAT) → NothingEscapes PNP.TM.TMSAT) : ¬ PNP.TM.SATinP :=
  PNP.TM.sep_tmsat_iff.mp (separation_of_the_act PNP.TM.TMSAT [] bit)

/-- THE RESIDUE AS THE SENTENCE: with SAT ∈ NP named as a hypothesis, the one implication gives P ≠ NP. -/
theorem p_ne_np_of_residue (hNP : PNP.TM.InNP PNP.TM.satLang)
    (bit : NothingEscapes (Rec PNP.TM.TMSAT) → NothingEscapes PNP.TM.TMSAT) : PNP.TM.P_ne_NP :=
  PNP.TM.p_ne_np_of_not_inP hNP (sat_not_in_P_of_the_act bit)

/-- THE WALL, restated on the residue: the residue cannot be supplied by any property shared by every machine
    (keyless_forces_nothing), nor by any principle true of every record (no_record_principle_decides), nor by
    any property shared by every algorithm model of SAT itself (sat_keyless_forces_nothing). What supplies it is
    keyed to the machine: the act. -/
theorem residue_is_keyed :
    (∀ P : Machine → Prop, Keyless P → ¬ Forces P) ∧
    (∀ P : Machine → Prop, (∀ M, P (Rec M)) → ¬ ∀ M, P (Rec M) → NothingEscapes M) ∧
    (∀ P : Machine → Prop, PNP.SAT.SATKeyless P → ¬ PNP.SAT.SATForces P) :=
  ⟨keyless_forces_nothing, no_record_principle_decides, PNP.SAT.sat_keyless_forces_nothing⟩

end PNP.RESIDUE

/-! ## cones, pinned: the build is silent, and any drift fails it -/
/-- info: 'PNP.NORMALFORM.record_has_least_escape' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.NORMALFORM.record_has_least_escape
/-- info: 'PNP.NORMALFORM.record_is_separated' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.NORMALFORM.record_is_separated
/-- info: 'PNP.NORMALFORM.sep_normal_form' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.NORMALFORM.sep_normal_form
/-- info: 'PNP.NORMALFORM.sep_from_the_cargo_loop' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.NORMALFORM.sep_from_the_cargo_loop
/-- info: 'PNP.NORMALFORM.bit_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.NORMALFORM.bit_is_the_act
/-- info: 'PNP.NORMALFORM.record_is_self_recursive' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.NORMALFORM.record_is_self_recursive
/-- info: 'PNP.NORMALFORM.self_recursion_at_machine' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.NORMALFORM.self_recursion_at_machine
/-- info: 'PNP.NORMALFORM.self_verifying_iff_true' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.NORMALFORM.self_verifying_iff_true
/-- info: 'PNP.NORMALFORM.bit_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.NORMALFORM.bit_is_keyed
/-- info: 'PNP.NORMALFORM.record_self_recursion_does_not_transfer' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.NORMALFORM.record_self_recursion_does_not_transfer
/-- info: 'PNP.NORMALFORM.record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.NORMALFORM.record_decides_nothing
/-- info: 'PNP.NORMALFORM.every_route_passes_the_bit' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.NORMALFORM.every_route_passes_the_bit
/-- info: 'PNP.NORMALFORM.keyless_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.NORMALFORM.keyless_forces_nothing
/-- info: 'PNP.NORMALFORM.no_record_principle_decides' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.NORMALFORM.no_record_principle_decides
/-- info: 'PNP.NORMALFORM.examination_enacts_stage1' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.NORMALFORM.examination_enacts_stage1
/-- info: 'PNP.NORMALFORM.stage1_is_local' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.NORMALFORM.stage1_is_local
/-- info: 'PNP.NORMALFORM.the_posit_is_the_bit' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.NORMALFORM.the_posit_is_the_bit
/-- info: 'PNP.NORMALFORM.locus_vanishes' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.NORMALFORM.locus_vanishes
/-- info: 'PNP.NORMALFORM.seatless_lock' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.NORMALFORM.seatless_lock
/-- info: 'PNP.NORMALFORM.pnp_normal_form_complete' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.NORMALFORM.pnp_normal_form_complete
/-- info: 'PNP.NORMALFORM.two_rows_two_bits' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.NORMALFORM.two_rows_two_bits
/-- info: 'PNP.SAT.satB_iff' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.SAT.satB_iff
/-- info: 'PNP.SAT.empty_satisfiable' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.SAT.empty_satisfiable
/-- info: 'PNP.SAT.sat_record_has_least_escape' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.SAT.sat_record_has_least_escape
/-- info: 'PNP.SAT.sat_normal_form' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.SAT.sat_normal_form
/-- info: 'PNP.SAT.sat_bit_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.SAT.sat_bit_is_the_act
/-- info: 'PNP.SAT.sat_self_recursion' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.SAT.sat_self_recursion
/-- info: 'PNP.SAT.sat_every_route_passes_the_bit' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.SAT.sat_every_route_passes_the_bit
/-- info: 'PNP.SAT.sat_posit_is_the_bit' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.SAT.sat_posit_is_the_bit
/-- info: 'PNP.SAT.sat_normal_form_complete' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.SAT.sat_normal_form_complete
/-- info: 'PNP.SAT.sat_bit_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.SAT.sat_bit_is_keyed
/-- info: 'PNP.SAT.sat_keyless_forces_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.SAT.sat_keyless_forces_nothing
/-- info: 'PNP.SAT.sat_no_record_principle_decides' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.SAT.sat_no_record_principle_decides
/-- info: 'PNP.SAT.sat_record_decides_nothing' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.SAT.sat_record_decides_nothing
/-- info: 'PNP.SAT.sat_premise_trichotomy' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.SAT.sat_premise_trichotomy
/-- info: 'PNP.TM.decode_encode' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.decode_encode
/-- info: 'PNP.TM.encode_injective' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.encode_injective
/-- info: 'PNP.TM.satLang_encode_iff' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.satLang_encode_iff
/-- info: 'PNP.TM.haltsAt_of_le' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.haltsAt_of_le
/-- info: 'PNP.TM.verdict_of_le' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.verdict_of_le
/-- info: 'PNP.TM.time_halts' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.time_halts
/-- info: 'PNP.TM.time_least' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.time_least
/-- info: 'PNP.TM.sep_tmsat_iff' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.sep_tmsat_iff
/-- info: 'PNP.TM.evalPoly_le_bound' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.evalPoly_le_bound
/-- info: 'PNP.TM.SATinP_of_poly' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.SATinP_of_poly
/-- info: 'PNP.TM.p_ne_np_of_not_inP' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.p_ne_np_of_not_inP
/-- info: 'PNP.TM.tmsat_record_has_least_escape' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.tmsat_record_has_least_escape
/-- info: 'PNP.TM.pnp_normal_form_turing' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.TM.pnp_normal_form_turing
/-- info: 'PNP.TM.tmsat_bit_is_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.tmsat_bit_is_the_act
/-- info: 'PNP.TM.tmsat_self_recursion' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.tmsat_self_recursion
/-- info: 'PNP.TM.tmsat_every_route_passes_the_bit' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.TM.tmsat_every_route_passes_the_bit
/-- info: 'PNP.TM.tmsat_posit_is_the_bit' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.TM.tmsat_posit_is_the_bit
/-- info: 'PNP.TM.tmsat_normal_form_complete' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.TM.tmsat_normal_form_complete
/-- info: 'PNP.TM.tmsat_racomp_iff_not_inP' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.tmsat_racomp_iff_not_inP
/-- info: 'PNP.TM.every_exit_is_the_posit' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.TM.every_exit_is_the_posit
/-- info: 'PNP.TM.the_posit_is_every_exit' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.the_posit_is_every_exit
/-- info: 'PNP.TM.rec_rec' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.rec_rec
/-- info: 'PNP.TM.coincidence_normal_form' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.coincidence_normal_form
/-- info: 'PNP.TM.tmsat_coincidence' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.tmsat_coincidence
/-- info: 'PNP.TM.certificate_unique' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.certificate_unique
/-- info: 'PNP.TM.tmsat_rejection_is_a_witness' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.TM.tmsat_rejection_is_a_witness
/-- info: 'PNP.TM.tmsat_every_pair_lands' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.TM.tmsat_every_pair_lands
/-- info: 'PNP.TM.forces_or_has_a_twin' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.TM.forces_or_has_a_twin
/-- info: 'PNP.TM.escape_refutes' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.escape_refutes
/-- info: 'PNP.TM.act_leaves_no_escape' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.act_leaves_no_escape
/-- info: 'PNP.TM.extend_escapes' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.extend_escapes
/-- info: 'PNP.TM.no_record_decides' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.no_record_decides
/-- info: 'PNP.TM.tmsat_no_record_decides' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.tmsat_no_record_decides
/-- info: 'PNP.TM.TMSAT' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.TMSAT
/-- info: 'PNP.TM.InP' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.InP
/-- info: 'PNP.TM.InNP' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.InNP
/-- info: 'PNP.TM.P_ne_NP' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.P_ne_NP
/-- info: 'PNP.TM.SATinP' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.TM.SATinP
/-- info: 'PNP.BLACKBOX.pigeon' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.BLACKBOX.pigeon
/-- info: 'PNP.BLACKBOX.black_box_bound' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.BLACKBOX.black_box_bound
/-- info: 'PNP.BLACKBOX.black_box_no_savings' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.BLACKBOX.black_box_no_savings
/-- info: 'PNP.MISSING.reader_solves' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.MISSING.reader_solves
/-- info: 'PNP.MISSING.reader_poly' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.MISSING.reader_poly
/-- info: 'PNP.MISSING.fails_when_descriptions_reveal' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.MISSING.fails_when_descriptions_reveal
/-- info: 'PNP.MISSING.missing_object_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.MISSING.missing_object_is_keyed
/-- info: 'PNP.RESIDUE.separation_of_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.RESIDUE.separation_of_the_act
/-- info: 'PNP.RESIDUE.sat_separation_of_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.RESIDUE.sat_separation_of_the_act
/-- info: 'PNP.RESIDUE.sat_not_in_P_of_the_act' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.RESIDUE.sat_not_in_P_of_the_act
/-- info: 'PNP.RESIDUE.p_ne_np_of_residue' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.RESIDUE.p_ne_np_of_residue
/-- info: 'PNP.RESIDUE.residue_is_keyed' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.RESIDUE.residue_is_keyed

/-! ===================================================================================================================
    PART F · THE SUPPLY (namespace PNP.SUPPLY). The bit of Part E, supplied by the act and delivered by its two
    kinds: the formal cargo, and the physical witness. Each kind is a type whose inhabitant is the supply; neither
    is assumed anywhere in this file. Every exit is the posit (Part C), so each kind is the one bit in its own
    register, and either delivers SAT ∉ P and, with SAT ∈ NP, P ≠ NP.
=================================================================================================================== -/
namespace PNP.SUPPLY
open PNP.NORMALFORM

/-- THE FORMAL KIND, the cargo: the record's least escape carried to the Turing SAT machine. -/
def FormalCargo : Prop := NothingEscapes (Rec PNP.TM.TMSAT) → NothingEscapes PNP.TM.TMSAT

/-- THE PHYSICAL KIND, the witness: every run of a decider is a physical process that registers each step at
    the Landauer floor, so its heat, counted in floor units, is its step count; and no decider answers every
    formula correctly within a polynomial heat budget. The second field is the one bit read in the register of
    heat; it is a premise of the witness, carried as a field, never proved. -/
structure PhysicalWitness where
  floor : Nat
  floor_pos : 0 < floor
  heat : PNP.TM.Decider → List PNP.TM.Sym → Nat
  priced : ∀ D w, heat D w = PNP.TM.time D w
  beyond_every_budget : ∀ (D : PNP.TM.Decider) (c k : Nat), ∃ w : List PNP.TM.Sym,
    PNP.TM.out D w ≠ PNP.TM.satLang w ∨ bound c k w.length < heat D w

/-- The cargo arrives with no premise: the record of the Turing SAT machine has least escape. -/
theorem cargo_arrives : NothingEscapes (Rec PNP.TM.TMSAT) := PNP.TM.tmsat_record_has_least_escape

/-- KIND 1 DELIVERS: the formal cargo gives SAT ∉ P in one step. -/
theorem formal_kind_delivers (h : FormalCargo) : ¬ PNP.TM.SATinP := PNP.RESIDUE.sat_not_in_P_of_the_act h

/-- The physical witness closes the Turing SAT machine: every decider at every bound is stopped. -/
theorem witness_closes (W : PhysicalWitness) : NothingEscapes PNP.TM.TMSAT :=
  fun D c k => match W.beyond_every_budget D c k with
    | ⟨w, Or.inl hne⟩ => ⟨w, fun hc => hne hc.1⟩
    | ⟨w, Or.inr hlt⟩ => ⟨w, fun hc =>
        Nat.lt_irrefl _ (Nat.lt_of_lt_of_le hlt (W.priced D w ▸ hc.2))⟩

/-- KIND 2 DELIVERS: the physical witness gives SAT ∉ P. -/
theorem physical_kind_delivers (W : PhysicalWitness) : ¬ PNP.TM.SATinP :=
  PNP.TM.sep_tmsat_iff.mp (sep_of_closure PNP.TM.TMSAT (witness_closes W))

/-- THE TWO KINDS ARE ONE BIT: the physical witness is a formal cargo, and the cargo is exactly SAT ∉ P. -/
theorem the_two_kinds_are_one_bit :
    (PhysicalWitness → FormalCargo) ∧ (FormalCargo ↔ ¬ PNP.TM.SATinP) :=
  ⟨fun W _ => witness_closes W, PNP.TM.pnp_normal_form_turing⟩

/-- P ≠ NP, DELIVERED TWICE: with SAT ∈ NP, either kind gives the sentence. -/
theorem p_ne_np_delivered_twice (hNP : PNP.TM.InNP PNP.TM.satLang) :
    (FormalCargo → PNP.TM.P_ne_NP) ∧ (PhysicalWitness → PNP.TM.P_ne_NP) :=
  ⟨fun h => PNP.TM.p_ne_np_of_not_inP hNP (formal_kind_delivers h),
   fun W => PNP.TM.p_ne_np_of_not_inP hNP (physical_kind_delivers W)⟩

/-- THE ONE REFUTER: an escape, a decider and a bound with every run clean, refutes both kinds at once. -/
theorem the_one_refuter (e : ∃ (D : PNP.TM.Decider) (c k : Nat), Escapes PNP.TM.TMSAT D c k) :
    ¬ FormalCargo ∧ ¬ Nonempty PhysicalWitness :=
  have hs : ¬ Sep PNP.TM.TMSAT := fun hsep => hsep e
  ⟨fun h => hs (sep_of_closure _ (h cargo_arrives)),
   fun ⟨W⟩ => hs (sep_of_closure _ (witness_closes W))⟩

/-- THE SUPPLY, CLOSED. Nothing before the colon: the cargo arrives free; each kind delivers; the two kinds are
    one bit; the bit is SAT ∉ P; with SAT ∈ NP each kind gives P ≠ NP; and one escape refutes both. -/
theorem the_supply_closed :
    NothingEscapes (Rec PNP.TM.TMSAT) ∧
    (FormalCargo → ¬ PNP.TM.SATinP) ∧ (PhysicalWitness → ¬ PNP.TM.SATinP) ∧
    (PhysicalWitness → FormalCargo) ∧ (FormalCargo ↔ ¬ PNP.TM.SATinP) ∧
    (PNP.TM.InNP PNP.TM.satLang → (FormalCargo → PNP.TM.P_ne_NP) ∧ (PhysicalWitness → PNP.TM.P_ne_NP)) ∧
    ((∃ (D : PNP.TM.Decider) (c k : Nat), Escapes PNP.TM.TMSAT D c k) →
      ¬ FormalCargo ∧ ¬ Nonempty PhysicalWitness) :=
  ⟨cargo_arrives, formal_kind_delivers, physical_kind_delivers, the_two_kinds_are_one_bit.1,
   the_two_kinds_are_one_bit.2, p_ne_np_delivered_twice, the_one_refuter⟩

end PNP.SUPPLY

/-- info: 'PNP.SUPPLY.cargo_arrives' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.SUPPLY.cargo_arrives
/-- info: 'PNP.SUPPLY.formal_kind_delivers' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.SUPPLY.formal_kind_delivers
/-- info: 'PNP.SUPPLY.witness_closes' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.SUPPLY.witness_closes
/-- info: 'PNP.SUPPLY.physical_kind_delivers' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.SUPPLY.physical_kind_delivers
/-- info: 'PNP.SUPPLY.the_two_kinds_are_one_bit' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.SUPPLY.the_two_kinds_are_one_bit
/-- info: 'PNP.SUPPLY.p_ne_np_delivered_twice' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.SUPPLY.p_ne_np_delivered_twice
/-- info: 'PNP.SUPPLY.the_one_refuter' does not depend on any axioms -/
#guard_msgs in #print axioms PNP.SUPPLY.the_one_refuter
/-- info: 'PNP.SUPPLY.the_supply_closed' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in #print axioms PNP.SUPPLY.the_supply_closed
