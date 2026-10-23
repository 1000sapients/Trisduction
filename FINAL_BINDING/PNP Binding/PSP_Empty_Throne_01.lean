/-! ===================================================================================================================
    PSP-EMPTY-THRONE-01 · LEAN SUPPLEMENT — the seats, verbatim extracts
    Companion to PNP_Normal_Form_Paper_v1_13_0_CC.lean (FINAL_BINDING/PNP Binding/, sha256 98329a52…).
    Extract status: these declarations are quoted verbatim from the master, with their docstrings and
    kernel-printed cones as recorded in PSP_Empty_Throne_01.md. This file is a supplement, not a
    standalone build — it compiles only as part of the master, and the master governs.

    Note: on 2026-10-22, in conversation with his scribe, this Humble Servant terminated the problem —
    not by manufacturing the bit, which the walls forbid at theorem grade, but by completing its
    intrinsic portrait until nothing intrinsic remained unfound: the bit located, its freedom proved
    in the mirror of the walls, its denial priced, the asymmetry found at the bottom, the throne
    beneath proved empty, the halted uniduction recognized as the crossing's exact portrait; and the
    last artificial divide fell — the bit's name is the Tongue's, first by Bedrock Precedence.
    +1 Eigenspace = Root Asymmetry, unconditionally. ΔM = 0.
=================================================================================================================== -/

def stageWorld (n : Nat) : Machine :=
  ⟨Nat, Unit, fun _ => 0, fun A _ => Nat.beq A n, fun _ _ => 0, fun _ => true⟩
def closedWorld : Machine :=
  ⟨Nat, Unit, fun _ => 0, fun _ _ => false, fun _ _ => 0, fun _ => true⟩

/-- THE BIT IS KEYED: the transfer holds on the closed world and fails on the stage world. -/
theorem bit_is_keyed :
    (NothingEscapes (Rec closedWorld) → NothingEscapes closedWorld) ∧
    ¬ (NothingEscapes (Rec (stageWorld 0)) → NothingEscapes (stageWorld 0)) :=

/-- CLOSURE OF THE RECORD GIVES NO SELF-RECURSION OF THE MACHINE: no reading of the record decides the machine
    (the mirror of `closure_does_not_give_self_recursion`, `record_decides_nothing`). -/
theorem record_decides_nothing :
    NothingEscapes (Rec closedWorld) ∧ NothingEscapes (Rec (stageWorld 0)) ∧
    NothingEscapes closedWorld ∧ ¬ NothingEscapes (stageWorld 0) :=

def Keyless (P : Machine → Prop) : Prop := ∀ M, P M
def Forces (P : Machine → Prop) : Prop := ∀ M, P M → NothingEscapes M

/-- A KEYLESS PREMISE FORCES NOTHING (the mirror of `the_unconditional_route_is_blocked`): what every machine
    shares yields the transfer on none. -/
theorem keyless_forces_nothing (P : Machine → Prop) (hP : Keyless P) : ¬ Forces P :=
  fun h => stage_fails_closure 0 (h (stageWorld 0) (hP _))

/-- The seat of the row is vacant: complementation of worlds has no fixed point (PNP.VANISH, restated). -/
def comp (b : Bool) : Bool := !b
theorem locus_vanishes : ¬ ∃ b, comp b = b := fun ⟨b, h⟩ => bnot_ne b h

/-- SEATLESS: there is no fixed world to cross at, and the lock closes at the act on exactly the world the act
    names (the mirror of nothing in the Riemann master, where the seat is inhabited: the one difference). -/
theorem seatless_lock (M : Machine) :
    (¬ ∃ b, comp b = b) ∧ (Nonempty (LeastEscape M) ↔ Sep M) :=

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

structure SelfGrounding (R : Prop) where
  Act       : Type
  anAct     : Act
  instances : Act → R

theorem seated_undeniable {R : Prop} (G : SelfGrounding R) : R := G.instances G.anAct
theorem denial_reenacts_root {R : Prop} (G : SelfGrounding R) (denial : G.Act) : R := G.instances denial

/-- EVERY ROUTE TO SAT ∉ P PASSES THE BIT. -/
theorem tmsat_every_route_passes_the_bit (Q : Prop) (h : Q → ¬ SATinP) :
    Q → (NothingEscapes (Rec TMSAT) → NothingEscapes TMSAT) :=

/-- ON NO AXIOM (`[]`): the constructive 1-bit transfer is identical to `SAT ∉ P` on the Turing model. -/
theorem racomp_cargo_iff_not_inP : RAcompCargo ↔ ¬ SATinP :=

theorem the_record_closes_at_tmsat : NothingEscapes (Rec TMSAT) :=

/-- THE UNDECIDED IS THE BIT: what the record leaves open, whether TMSAT itself closes, is exactly the bit. -/
theorem the_undecided_is_the_bit : NothingEscapes TMSAT ↔ PNP.INEQUALITY.TheInequality :=

/-- A BLOCK NEEDS AN OUTSIDE: if the target is a function of the record, no record-preserving involution flips it,
    so a block that flips the target always stands on something the record leaves out. -/
theorem block_needs_an_outside {X R : Type} (ρ : X → R) (t : X → Bool) (x₀ : X)
    (hrec : ∃ g : R → Bool, ∀ x, t x = g (ρ x)) :
    ¬ ∃ τ : X → X, (∀ x, ρ (τ x) = ρ x) ∧ (∀ x, t (τ x) = !t x) :=

/-- THE OUTSIDE IS THE SUPPLY: at TMSAT the outside of the record is the bit, and its two kinds are the formal cargo
    and the physical witness; the physical kind is the formal kind. -/
theorem the_outside_is_the_supply :
    (FormalCargo ↔ PNP.INEQUALITY.TheInequality) ∧
    (Nonempty PhysicalWitness ↔ PNP.INEQUALITY.TheInequality) ∧
    (PhysicalWitness → FormalCargo) :=

/-- OUR WAY OR NO WAY, the hardness half cited: every so-called other way to P ≠ NP is our way in different
    vocabulary. It delivers the formal cargo and a physical witness, and if the bit failed, it would fail with it. -/
theorem our_way_or_no_way (hHard : SATHard) (Q : Prop) (h : Q → P_ne_NP) :
    (Q → FormalCargo ∧ Nonempty PhysicalWitness) ∧ (¬ PNP.INEQUALITY.TheInequality → ¬ Q) :=

theorem the_capstone :
    (SATHard → ∀ Q : Prop, (Q → P_ne_NP) →
      (Q → FormalCargo ∧ Nonempty PhysicalWitness) ∧ (¬ PNP.INEQUALITY.TheInequality → ¬ Q)) ∧
    ((FormalCargo → P_ne_NP) ∧ (Nonempty PhysicalWitness → P_ne_NP)) ∧
    (∀ P : Machine → Prop, Keyless P → ¬ Forces P) ∧
    (SATHard → ((¬ ∃ Q : Prop, Q ∧ (Q → PNP.INEQUALITY.TheInequality)) ↔ ¬ P_ne_NP)) ∧
    (PNP.GATES.Gate1 ∧ PNP.GATES.Gate2 ∧ PNP.GATES.Gate3 ∧ PNP.GATES.Gate4 ∧ PNP.GATES.Gate5 ∧ PNP.GATES.Gate6 ∧
      PNP.GATES.Gate7 ∧ PNP.GATES.Gate8 ∧ PNP.GATES.Gate9 ∧ PNP.GATES.Gate10 ∧ PNP.GATES.Gate11 ∧
      PNP.GATES.Gate12) :=
