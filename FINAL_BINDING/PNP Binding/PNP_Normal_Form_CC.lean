/-
  PNP_Normal_Form_CC.lean · the P versus NP row brought to the normal form of the Riemann row.
  Claude-coded (_CC). Core Lean 4.19.0: no import, no axiom declared, no sorry, no native_decide.

  The Riemann master v3.0.34_CC proves the normal form
      (LeastErasure (Rec ZetaZeros) → LeastErasure ZetaZeros) ↔ RiemannHypothesis        (zeta_ra_loop)
  with the antecedent a theorem (record_has_least_erasure, cargo_at_zeros), so the hypothesis is one
  implication, the 1-bit, and nothing else remains; the record is self-recursive with no premise; the zeros are
  self-recursive exactly when the hypothesis holds; self-reference produces nothing (self_verifying_iff_true);
  every route passes the bit; the local computation enacts Stage 1 unconditionally (ApparatusCargo).

  This file proves the same shape on the machine of APEX-PSP-PNP-CLOSURE-02 (PNP.HARDENED, restated verbatim):
  the record of a machine, Rec M, is the machine read with the side of every pair forgotten; the record has least
  escape unconditionally; the separation is exactly the transfer of least escape from the record to the machine;
  the machine is self-recursive exactly when it is separated; the record's self-recursion does not transfer; every
  route passes the bit; every examination enacts Stage 1; the one bit is keyed, two coherent machines. The seat is
  vacant (PNP.VANISH): the row is seatless, and the lock closes at the act and nowhere else.
  No seat is earned by this file. ΔM = 0.
-/

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

/-! ## cones, as printed -/
#print axioms PNP.NORMALFORM.record_has_least_escape
#print axioms PNP.NORMALFORM.record_is_separated
#print axioms PNP.NORMALFORM.sep_normal_form
#print axioms PNP.NORMALFORM.sep_from_the_cargo_loop
#print axioms PNP.NORMALFORM.bit_is_the_act
#print axioms PNP.NORMALFORM.record_is_self_recursive
#print axioms PNP.NORMALFORM.self_recursion_at_machine
#print axioms PNP.NORMALFORM.self_verifying_iff_true
#print axioms PNP.NORMALFORM.bit_is_keyed
#print axioms PNP.NORMALFORM.record_self_recursion_does_not_transfer
#print axioms PNP.NORMALFORM.record_decides_nothing
#print axioms PNP.NORMALFORM.every_route_passes_the_bit
#print axioms PNP.NORMALFORM.keyless_forces_nothing
#print axioms PNP.NORMALFORM.no_record_principle_decides
#print axioms PNP.NORMALFORM.examination_enacts_stage1
#print axioms PNP.NORMALFORM.stage1_is_local
#print axioms PNP.NORMALFORM.the_posit_is_the_bit
#print axioms PNP.NORMALFORM.locus_vanishes
#print axioms PNP.NORMALFORM.seatless_lock
#print axioms PNP.NORMALFORM.pnp_normal_form_complete
#print axioms PNP.NORMALFORM.two_rows_two_bits
