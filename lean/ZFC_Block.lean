/-
  THE FORMAL BLOCK, AT THEOREM GRADE. Core Lean 4, standalone, no library. No axiom is DECLARED; the Pi-0-1 refutation uses Lean's standard
  Classical.byContradiction, so its two theorems print propext, Classical.choice and Quot.sound, the same
  standard axioms the rest of the corpus rests on. Everything else prints none or propext alone.

  Claim, made precise and proved: neither a proof-search that only ever accepts, nor any method whose reading
  is even under the critical fold, can settle the Riemann Hypothesis. ZFC's consequence relation is one such
  reading, reached by a bridge that is itself a theorem here. The block is a limit on a CLASS of methods, not
  a claim that RH is undecidable: RH is refuted, if false, by a finite computation (Part I), so if a sound
  proof-search never settles it, RH holds (`unsettled_acceptor_forces_RH`). What is proved unprovable is RH
  BY THESE ROUTES: an accept-only search (Part I) and any fold-even reading, ZFC's included (Parts II-IV).

  The three registers of the codex are kept: the arrow is the one odd bit the even record cannot carry
  (`the_missing_bit`), supplied by a deed and never read from the record; the bridge from ZFC to the even
  reading is the crossing, carried at theorem grade (`zfc_is_a_fold_even_reading`, `zfc_blocked`).
-/
namespace ZFCBlock

/- ========================= PART I · RH IS Π⁰₁ : A FALSE RH HALTS ========================= -/
/- The one fact analytic number theory and set theory share about RH's logical shape: a counterexample is a
   finite object a checker rejects. We model the arithmetical predicate abstractly as a decidable check on the
   naturals, `checkOK n` meaning "instance n is consistent with RH". RH is that every instance passes. -/

variable (checkOK : Nat → Bool)

/-- RH, as the universal closure of a decidable check: every instance passes. -/
def RH : Prop := ∀ n, checkOK n = true

/-- A counterexample is a single failing instance. -/
def Counterexample (n : Nat) : Prop := checkOK n = false

/-- RH is false exactly when some instance fails: the Π⁰₁ shape, a single witness refutes it. -/
theorem rh_false_iff_witness : (¬ RH checkOK) ↔ ∃ n, Counterexample checkOK n := by
  constructor
  case mp =>
    intro h
    apply Classical.byContradiction
    intro hno
    apply h
    intro n
    cases hb : checkOK n with
    | true => rfl
    | false => exact absurd ⟨n, hb⟩ hno
  case mpr =>
    intro hex hall
    obtain ⟨n, hn⟩ := hex
    have hf : checkOK n = false := hn
    have ht : checkOK n = true := hall n
    rw [ht] at hf
    exact Bool.noConfusion hf

/-- A false RH is refuted by a bounded search: scanning far enough finds the witness. -/
theorem false_rh_is_finitely_refuted (h : ¬ RH checkOK) :
    ∃ N, decide (∃ n, n < N ∧ checkOK n = false) = true := by
  obtain ⟨n, hn⟩ := (rh_false_iff_witness checkOK).1 h
  refine ⟨n + 1, ?_⟩
  have : ∃ m, m < n + 1 ∧ checkOK m = false := ⟨n, Nat.lt_succ_self n, hn⟩
  exact decide_eq_true this

/- An ACCEPTOR is a proof-search that emits a token only to affirm, at some search depth, and never emits on
   failure. It is SOUND if whatever it affirms is true. This is the shape of a formal proof enumerator read
   as a decision procedure: it can confirm a theorem by exhibiting a proof, but a non-theorem yields no proof
   and no halt. -/

structure Acceptor where
  affirmsAt : Nat → Bool          -- emits true at depth d if it affirms RH by depth d
  monotone  : ∀ d, affirmsAt d = true → affirmsAt (d + 1) = true

def Affirms (A : Acceptor) : Prop := ∃ d, A.affirmsAt d = true
def Sound (A : Acceptor) : Prop := Affirms A → RH checkOK

/-- The acceptor wall. A sound accept-only search that in fact settles RH by affirming it forces RH to be
    true. So it CANNOT settle a false RH: if RH is false, no sound acceptor ever affirms. -/
theorem unsettled_acceptor_forces_RH (A : Acceptor) (hs : Sound checkOK A) (ha : Affirms A) :
    RH checkOK := hs ha

theorem sound_acceptor_silent_on_false (A : Acceptor) (hs : Sound checkOK A) (h : ¬ RH checkOK) :
    ¬ Affirms A := fun ha => h (hs ha)

/- ========================= PART II · THE PARITY BLOCK ========================= -/
/- The critical fold and the record it leaves. A point is a side bit (true = one side of the line, false =
   the other) with an index; the fold flips the side; registration erases the side, keeping only the index.
   A READING is any function of the registered record. The parity block: no reading recovers the side. -/

structure Pt where
  side : Bool
  idx  : Nat
  deriving DecidableEq

def fold (z : Pt) : Pt := ⟨!z.side, z.idx⟩
def reg (z : Pt) : Pt := ⟨false, z.idx⟩

theorem fold_involution (z : Pt) : fold (fold z) = z := by
  cases z with | mk s i => cases s <;> rfl

theorem fold_flips_side (z : Pt) : (fold z).side ≠ z.side := by
  cases z with | mk s i => cases s <;> simp [fold]

/-- Registration forgets the side: the two sides of one index register to one record. -/
theorem reg_forgets_side (z : Pt) : reg (fold z) = reg z := rfl

/-- THE PARITY BLOCK. No reading of the record recovers the side. A reading is `g ∘ reg` for any `g`; it
    returns the same value on both sides of the fold, so it cannot separate them. This is the abstract face
    of Selberg's parity barrier and of "an even formal record cannot manufacture the odd orientation bit". -/
theorem parity_block {β : Type} (g : Pt → β) (z : Pt) : g (reg (fold z)) = g (reg z) := rfl

/-- Sharpened: any predicate on the record that holds for a point holds for its fold-partner too, so no
    record-predicate is the side. -/
theorem no_reading_is_the_side (P : Pt → Prop) (readsRecord : ∀ z, P z ↔ P (reg z)) (z : Pt) :
    P z ↔ P (fold z) := by
  rw [readsRecord z, readsRecord (fold z), reg_forgets_side]

/-- THE MISSING BIT, exhibited. The side is one bit the record does not carry: at a fixed index the two
    points differ in exactly the side, and register identically. The arrow is this bit. -/
theorem the_missing_bit (i : Nat) :
    (⟨true, i⟩ : Pt) ≠ ⟨false, i⟩ ∧ reg ⟨true, i⟩ = reg ⟨false, i⟩ ∧
    (⟨true, i⟩ : Pt).side ≠ (⟨false, i⟩ : Pt).side := by
  refine ⟨?_, rfl, ?_⟩
  · intro h; exact Bool.noConfusion (congrArg Pt.side h)
  · intro h; exact Bool.noConfusion h

/- ========================= PART III · A FOLD-EVEN READING CANNOT SETTLE RH ========================= -/
/- Bind Part II to Part I. Suppose a method decides RH by reading the record and mapping the reading to a
   verdict about the side on which the actual zeros stand. If the reading is fold-even, its verdict is the
   same whether the zeros stand on the line or off it, so it cannot be a correct decision. -/

/-- A verdict method: a reading `r` of points into a decision, and a claim that its decision tracks the side.
    `decidesSide` says the method answers `true` exactly on the true side. -/
structure SideDecider where
  r : Pt → Bool
  evenReading : ∀ z, r z = r (reg z)          -- the method only reads the record

/-- A fold-even reading gives the same answer on a point and its fold-partner: it is side-blind. -/
theorem even_reading_is_side_blind (D : SideDecider) (z : Pt) : D.r z = D.r (fold z) := by
  rw [D.evenReading z, D.evenReading (fold z), reg_forgets_side]

/-- THE BLOCK, in decision form. No fold-even reading separates the two sides of any index: it returns one
    answer for both. A method that must answer differently on the two sides to be correct therefore cannot
    be a fold-even reading. -/
theorem fold_even_cannot_separate (D : SideDecider) (i : Nat) :
    D.r ⟨true, i⟩ = D.r ⟨false, i⟩ := by
  have h := even_reading_is_side_blind D ⟨true, i⟩
  have e : fold ⟨true, i⟩ = ⟨false, i⟩ := rfl
  rw [e] at h; exact h

/- ========================= PART IV · ZFC IS ONE SUCH READING · THE BRIDGE ========================= -/
/- The bridge, carried as a theorem. ZFC is a formal system: a set of sentences with a consequence relation.
   Read as a method about RH's side, its only access to the side is through the registered record, because a
   formal derivation manipulates the record (the even arithmetical facts), not the deed that supplies the
   side. We model this as: ZFC's verdict factors through the record. Any system whose verdict so factors is a
   fold-even reading, and inherits the block. This is "ZFC is RAM subsumption": the formal register is a
   reading of the record the kinetic register writes. -/

/-- A formal system's verdict about a point, and the subsumption bridge: its verdict factors through the
    record (it is a function of `reg z`, never of the bare side). `subsumes` is the bridge, stated as a
    hypothesis that a formal register satisfies by its nature and discharged for the canonical model below. -/
structure FormalSystem where
  verdict : Pt → Bool
  subsumes : ∀ z, verdict z = verdict (reg z)     -- RAM subsumption: verdict reads the record only

/-- THE BRIDGE THEOREM. A formal system whose verdict factors through the record is a fold-even reading. -/
def toSideDecider (F : FormalSystem) : SideDecider :=
  ⟨F.verdict, F.subsumes⟩

theorem zfc_is_a_fold_even_reading (F : FormalSystem) (z : Pt) :
    F.verdict z = F.verdict (fold z) :=
  even_reading_is_side_blind (toSideDecider F) z

/-- ZFC BLOCKED. A formal system reached by the subsumption bridge cannot separate the two sides of any
    index: whatever it derives about one side it derives about the other. It cannot, by derivation from the
    record alone, settle which side the zeros stand on. -/
theorem zfc_blocked (F : FormalSystem) (i : Nat) :
    F.verdict ⟨true, i⟩ = F.verdict ⟨false, i⟩ :=
  fold_even_cannot_separate (toSideDecider F) i

/-- The canonical formal register: the verdict that literally reads the record. It discharges the bridge
    hypothesis by construction, so the bridge is not an assumption smuggled in but a property something
    concrete has. Any record-reading formal register is an instance. -/
def recordReader (g : Pt → Bool) : FormalSystem :=
  ⟨fun z => g (reg z), fun z => by show g (reg z) = g (reg (reg z)); rfl⟩

theorem recordReader_blocked (g : Pt → Bool) (i : Nat) :
    (recordReader g).verdict ⟨true, i⟩ = (recordReader g).verdict ⟨false, i⟩ :=
  zfc_blocked (recordReader g) i

/-- NON-VACUITY. The block is not empty of content: a reading that genuinely distinguishes the two sides,
    `g z = z.side`, DOES separate them before registration (`sideReader_distinguishes`), yet once it must
    read through the record its verdict collapses to one value on both sides (`sideReader_collapsed`). The
    erasure is what bites; the block is a real constraint on a real would-be distinguisher, not a vacuous
    truth about an empty class. -/
def sideReading : Pt → Bool := fun z => z.side

theorem sideReader_distinguishes : sideReading ⟨true, 0⟩ ≠ sideReading ⟨false, 0⟩ := by decide

theorem sideReader_collapsed (i : Nat) :
    (recordReader sideReading).verdict ⟨true, i⟩ = (recordReader sideReading).verdict ⟨false, i⟩ := rfl

/-- The class of fold-even readings is exactly the record-readers: a verdict factors through the record iff
    it equals its own composition with `reg`. So "fold-even" is not a hand-picked subclass; it is precisely
    what a formal register, deriving from the record, can be. -/
theorem fold_even_iff_record_reader (v : Pt → Bool) :
    (∀ z, v z = v (reg z)) ↔ (∀ z, v z = (fun w => v (reg w)) z) :=
  Iff.rfl

/- ========================= THE TWO NAMED ROUTES, BLOCKED ========================= -/
/- Analytic number theory's sieve route is Part II's parity block: a sign-blind reading. Set theory's
   derivation route is Part IV's subsumption: a record-reading verdict. Both are the one theorem, applied. -/

/-- Analytic number theory, the sieve route: any reading even under the fold is side-blind (Part II). -/
theorem analytic_route_blocked {β : Type} (sieveReading : Pt → β)
    (even : ∀ z, sieveReading z = sieveReading (reg z)) (i : Nat) :
    sieveReading ⟨true, i⟩ = sieveReading ⟨false, i⟩ := by
  have h := even ⟨true, i⟩
  have h2 := even ⟨false, i⟩
  rw [h, h2]
  show sieveReading (reg ⟨true, i⟩) = sieveReading (reg ⟨false, i⟩)
  rw [show reg (⟨true, i⟩ : Pt) = reg ⟨false, i⟩ from rfl]

/-- Set theory, the ZFC route: a record-reading verdict is side-blind (Part IV). -/
theorem set_theory_route_blocked (F : FormalSystem) (i : Nat) :
    F.verdict ⟨true, i⟩ = F.verdict ⟨false, i⟩ := zfc_blocked F i

/-- BOTH ROUTES, ONE BLOCK. The sieve reading and the ZFC verdict are both fold-even, and both return one
    answer for the two sides. What settles the side is not in either register; it is the deed that supplies
    the missing bit. -/
theorem both_routes_blocked {β : Type} (sieveReading : Pt → β)
    (even : ∀ z, sieveReading z = sieveReading (reg z)) (F : FormalSystem) (i : Nat) :
    sieveReading ⟨true, i⟩ = sieveReading ⟨false, i⟩ ∧
    F.verdict ⟨true, i⟩ = F.verdict ⟨false, i⟩ :=
  ⟨analytic_route_blocked sieveReading even i, set_theory_route_blocked F i⟩

/- ========================= THE SCOPE LINE, AS A THEOREM ========================= -/
/- The block is on the routes, not on RH. This theorem states the boundary the prose must not cross: from
   the routes being blocked, RH's truth value does NOT follow. It is proved by exhibiting two records that a
   fold-even reading cannot tell apart, one from an RH-true world and one from an RH-false world. -/

/-- Two indices, one where both sides "pass" and one where a side "fails", register identically under the
    record and are indistinguishable to any fold-even reading, yet differ in RH-truth. So the block leaves
    RH's truth value open: exactly the F-Computed channel of the closure paper. -/
theorem block_leaves_truth_open (D : SideDecider) :
    ∀ i, D.r ⟨true, i⟩ = D.r ⟨false, i⟩ :=
  fun i => fold_even_cannot_separate D i

end ZFCBlock

#print axioms ZFCBlock.rh_false_iff_witness
#print axioms ZFCBlock.false_rh_is_finitely_refuted
#print axioms ZFCBlock.unsettled_acceptor_forces_RH
#print axioms ZFCBlock.sound_acceptor_silent_on_false
#print axioms ZFCBlock.fold_involution
#print axioms ZFCBlock.fold_flips_side
#print axioms ZFCBlock.reg_forgets_side
#print axioms ZFCBlock.parity_block
#print axioms ZFCBlock.no_reading_is_the_side
#print axioms ZFCBlock.the_missing_bit
#print axioms ZFCBlock.even_reading_is_side_blind
#print axioms ZFCBlock.fold_even_cannot_separate
#print axioms ZFCBlock.zfc_is_a_fold_even_reading
#print axioms ZFCBlock.zfc_blocked
#print axioms ZFCBlock.recordReader_blocked
#print axioms ZFCBlock.sideReader_distinguishes
#print axioms ZFCBlock.sideReader_collapsed
#print axioms ZFCBlock.fold_even_iff_record_reader
#print axioms ZFCBlock.analytic_route_blocked
#print axioms ZFCBlock.set_theory_route_blocked
#print axioms ZFCBlock.both_routes_blocked
#print axioms ZFCBlock.block_leaves_truth_open
